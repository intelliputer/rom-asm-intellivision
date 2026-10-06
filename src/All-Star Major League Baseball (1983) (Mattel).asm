
        ORG     $5000
.HEADER:
        BIDECLE $652B           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $5036           ; 5004  Ptr: Start of game
        BIDECLE $5DAB           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5D82           ; 5008  Ptr: GRAM init sequence
        BIDECLE $530C           ; 500A  Ptr: Date/Title
        DECLE   $007E           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0004,  $0003   ; 500F  Color Stack init (0, 1)
        DECLE   $0004,  $0003   ; 5011  Color Stack init (2, 3)
        DECLE   $000B           ; 5013  Border color init

        DECLE   $0180,  $0190,  $01A0,  $01B0   ; 5014   0180 0190 01A0 01B0
        DECLE   $01C0,  $01D0,  $01E0,  $01F0   ; 5018   01C0 01D0 01E0 01F0
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 501C  Timer dispatch/interval
        DECLE   $0011,  $0051,  $0001,  $0000; 5020  Timer dispatch/interval
        DECLE   $006C,  $0052,  $0030,  $0080; 5024  Timer dispatch/interval
        DECLE   $0014,  $0059,  $0005,  $0000; 5028  Timer dispatch/interval
        DECLE   $00C9,  $0055,  $001E,  $0000; 502C  Timer dispatch/interval
        DECLE   $0099,  $005F,  $0001,  $0080; 5030  Timer dispatch/interval
        BIDECLE $0000           ; 5034  End of timer table

.START:
        EIS                                     ; 5036   0002
        PSHR    R5                              ; 5037   0275
        MVII    #$0003, R0                      ; 5038   02B8 0003
        MVO     R0,     G_01D3                  ; 503A   0240 01D3
        SDBD                                    ; 503C   0001
        MVII    #$5028, R1                      ; 503D   02B9 0028 0050

        JSR     R5,     X_TIMER_STOP            ; 5040   0004 0118 0038

        SDBD                                    ; 5043   0001
        MVII    #$5020, R1                      ; 5044   02B9 0020 0050

        JSR     R5,     X_TIMER_STOP            ; 5047   0004 0118 0038

        SDBD                                    ; 504A   0001
        MVII    #$502C, R1                      ; 504B   02B9 002C 0050

        JSR     R5,     X_TIMER_STOP            ; 504E   0004 0118 0038

        MVII    #$0200, R4                      ; 5051   02BC 0200
        MVII    #$00F0, R0                      ; 5053   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5055   0004 0114 0338

        MVII    #$023E, R4                      ; 5058   02BC 023E
        MVII    #$0007, R3                      ; 505A   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 505C   0004 0118 007B
        STRING  "PLAYERS:"                      ; 505F  
        DECLE   $0000                           ; 5067   0000

        MVII    #$027A, R4                      ; 5068   02BC 027A
        MVII    #$0007, R3                      ; 506A   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 506C   0004 0118 007B
        STRING  "SKILL LEVEL:"                  ; 506F  
        DECLE   $0000                           ; 507B   0000
L_507C:
        MVII    #$0001, R0                      ; 507C   02B8 0001
        MVII    #$0247, R1                      ; 507E   02B9 0247
        MOVR    R0,     R2                      ; 5080   0082
        MVII    #$0007, R3                      ; 5081   02BB 0007

        JSR     R5,     X_GETNUM                ; 5083   0004 0118 00FF

        CMPI    #$0003, R0                      ; 5086   0378 0003
        BGE     L_507C                          ; 5088   022D 000D

        CMPI    #$0001, R0                      ; 508A   0378 0001
        BGT     L_509A                          ; 508C   020E 000C
        BEQ     L_5096                          ; 508E   0204 0006

        MVII    #$0080, R0                      ; 5090   02B8 0080
L_5092:
        MVO     R0,     G_01CF                  ; 5092   0240 01CF
        B       L_509A                          ; 5094   0200 0004

L_5096:
        MVII    #$0040, R0                      ; 5096   02B8 0040
        B       L_5092                          ; 5098   0220 0007

L_509A:
        MVII    #$0287, R1                      ; 509A   02B9 0287
        MVII    #$0007, R3                      ; 509C   02BB 0007
        MVII    #$0001, R0                      ; 509E   02B8 0001
        MOVR    R0,     R2                      ; 50A0   0082

        JSR     R5,     X_GETNUM                ; 50A1   0004 0118 00FF

        CMPI    #$0004, R0                      ; 50A4   0378 0004
        BGT     L_509A                          ; 50A6   022E 000D

        MVI     G_01CF, R1                      ; 50A8   0281 01CF
        MOVR    R1,     R2                      ; 50AA   008A
        ANDI    #$00C0, R2                      ; 50AB   03BA 00C0
        BNEQ    L_50B6                          ; 50AD   020C 0007

        TSTR    R0                              ; 50AF   0080
        BNEQ    L_50B6                          ; 50B0   020C 0004

        XORI    #$0010, R1                      ; 50B2   03F9 0010
        B       L_50BC                          ; 50B4   0200 0006

L_50B6:
        CMPI    #$0002, R0                      ; 50B6   0378 0002
        BGT     L_50BC                          ; 50B8   020E 0002

        XORI    #$0020, R1                      ; 50BA   03F9 0020
L_50BC:
        XORR    R1,     R0                      ; 50BC   01C8
        MVO     R0,     G_01CF                  ; 50BD   0240 01CF
        SDBD                                    ; 50BF   0001
        MVII    #$52B2, R1                      ; 50C0   02B9 00B2 0052
        MVO     R1,     .ISRVEC.0               ; 50C3   0241 0100
        SWAP    R1,     1                       ; 50C5   0041
        MVO     R1,     .ISRVEC.1               ; 50C6   0241 0101
        MVI     G_01CF, R0                      ; 50C8   0280 01CF
        ANDI    #$0007, R0                      ; 50CA   03B8 0007
        NEGR    R0                              ; 50CC   0020
        ADDI    #$0005, R0                      ; 50CD   02F8 0005
        SLL     R0,     2                       ; 50CF   004C
        MVO     R0,     G_01D1                  ; 50D0   0240 01D1
        MVO     R0,     G_01D2                  ; 50D2   0240 01D2

        JSR     R5,     L_5CF9                  ; 50D4   0004 015C 00F9

        SDBD                                    ; 50D7   0001
        MVII    #$674D, R1                      ; 50D8   02B9 004D 0067
        MVII    #$0189, R2                      ; 50DB   02BA 0189
        MVII    #$01A4, R3                      ; 50DD   02BB 01A4
L_50DF:
        MVI@    R1,     R0                      ; 50DF   0288
        MVO@    R0,     R2                      ; 50E0   0250
        MVO@    R0,     R3                      ; 50E1   0258
        INCR    R1                              ; 50E2   0009
        INCR    R2                              ; 50E3   000A
        INCR    R3                              ; 50E4   000B
        SDBD                                    ; 50E5   0001
        CMPI    #$6768, R1                      ; 50E6   0379 0068 0067
        BNEQ    L_50DF                          ; 50E9   022C 000B

        CLRR    R0                              ; 50EB   01C0
        MVO     R0,     G_015D                  ; 50EC   0240 015D
        MVO     R0,     G_01D7                  ; 50EE   0240 01D7

        JSR     R5,     L_5E7F                  ; 50F0   0004 015C 027F

        MVII    #$0001, R0                      ; 50F3   02B8 0001
        MVO     R0,     G_016B                  ; 50F5   0240 016B
        MVII    #$0002, R0                      ; 50F7   02B8 0002
        MVO     R0,     G_016A                  ; 50F9   0240 016A
        MVII    #$000A, R0                      ; 50FB   02B8 000A

        JSR     R5,     X_PLAY_CHEER1           ; 50FD   0004 011C 02D5

        SDBD                                    ; 5100   0001
        MVII    #$5020, R1                      ; 5101   02B9 0020 0050

        JSR     R5,     X_TIMER_START           ; 5104   0004 0118 0044

        SDBD                                    ; 5107   0001
        MVII    #$502C, R1                      ; 5108   02B9 002C 0050

        JSR     R5,     X_TIMER_START           ; 510B   0004 0118 0044

        J       L_58B6                          ; 510E   0004 0358 00B6

L_5111:
        NOP                                     ; 5111   0034
        NOP                                     ; 5112   0034
        NOP                                     ; 5113   0034
        NOP                                     ; 5114   0034
        NOP                                     ; 5115   0034
        PSHR    R5                              ; 5116   0275
        MVI     G_0320, R0                      ; 5117   0280 0320
        SWAP    R0,     1                       ; 5119   0040
        ANDI    #$00FF, R0                      ; 511A   03B8 00FF
        CMPI    #$0060, R0                      ; 511C   0378 0060
        BGE     L_5124                          ; 511E   020D 0004

        CMPI    #$0008, R0                      ; 5120   0378 0008
        BGE     L_5129                          ; 5122   020D 0005

L_5124:
        NOP                                     ; 5124   0034
        NOP                                     ; 5125   0034
        NOP                                     ; 5126   0034
        NOP                                     ; 5127   0034
        NOP                                     ; 5128   0034
L_5129:
        MVI     .PSG0.rgt_hand,R5               ; 5129   0285 01FE
        XORI    #$00FF, R5                      ; 512B   03FD 00FF
        MVO     R5,     G_0124                  ; 512D   0245 0124
        MVI     .PSG0.lft_hand,R5               ; 512F   0285 01FF
        XORI    #$00FF, R5                      ; 5131   03FD 00FF
        MVO     R5,     G_0123                  ; 5133   0245 0123

        JSR     R5,     L_5EE8                  ; 5135   0004 015C 02E8

        MVI     G_01D2, R0                      ; 5138   0280 01D2
        TSTR    R0                              ; 513A   0080
        BEQ     L_51CC                          ; 513B   0204 008F

        CLRR    R4                              ; 513D   01E4
        MVI     G_0181, R0                      ; 513E   0280 0181
        TSTR    R0                              ; 5140   0080
        BEQ     L_5156                          ; 5141   0204 0013

        CLRR    R1                              ; 5143   01C9
        MVO     R1,     G_01D8                  ; 5144   0241 01D8

        JSR     R5,     .EXEC.76C               ; 5146   0004 0114 036C

        MVII    #$0003, R4                      ; 5149   02BC 0003
        MVII    #$01C4, R5                      ; 514B   02BD 01C4
        SDBD                                    ; 514D   0001
        MVI@    R5,     R0                      ; 514E   02A8
        TSTR    R0                              ; 514F   0080
        BMI     L_5153                          ; 5150   020B 0001

        NEGR    R4                              ; 5152   0024
L_5153:
        MVO     R4,     G_014B                  ; 5153   0244 014B
        MOVR    R1,     R4                      ; 5155   008C

L_5156:
        JSR     R5,     L_5EDE                  ; 5156   0004 015C 02DE

        BNEQ    L_5162                          ; 5159   020C 0007

        CLRR    R0                              ; 515B   01C0
        MVO     R0,     G_01D8                  ; 515C   0240 01D8
        MVI     G_01D0, R2                      ; 515E   0282 01D0
        B       L_5196                          ; 5160   0200 0034

L_5162:
        JSR     R5,     .EXEC.76C               ; 5162   0004 0114 036C

L_5165:
        ADDI    #$0003, R1                      ; 5165   02F9 0003
        MVI@    R1,     R0                      ; 5167   0288
        SWAP    R0,     1                       ; 5168   0040
        ANDI    #$00FF, R0                      ; 5169   03B8 00FF
        SLR     R0,     1                       ; 516B   0060
        NEGR    R0                              ; 516C   0020
        ADDI    #$0007, R0                      ; 516D   02F8 0007
        BPL     L_5172                          ; 516F   0203 0001

        CLRR    R0                              ; 5171   01C0
L_5172:
        TSTR    R4                              ; 5172   00A4
        BEQ     L_5189                          ; 5173   0204 0014
        BMI     L_517C                          ; 5175   020B 0005

        PSHR    R0                              ; 5177   0270
        MOVR    R4,     R1                      ; 5178   00A1
        NEGR    R4                              ; 5179   0024
        B       L_5165                          ; 517A   0220 0016

L_517C:
        PULR    R1                              ; 517C   02B1
        TSTR    R1                              ; 517D   0089
        BEQ     L_518E                          ; 517E   0204 000E

        TSTR    R0                              ; 5180   0080
        BEQ     L_5186                          ; 5181   0204 0003

        CMPR    R0,     R1                      ; 5183   0141
        BLE     L_518E                          ; 5184   0206 0008

L_5186:
        MOVR    R1,     R0                      ; 5186   0088
        B       L_518E                          ; 5187   0200 0005

L_5189:
        PSHR    R0                              ; 5189   0270

        JSR     R5,     L_62CB                  ; 518A   0004 0160 02CB

        PULR    R0                              ; 518D   02B0
L_518E:
        MVI     G_01D0, R1                      ; 518E   0281 01D0
        MOVR    R1,     R2                      ; 5190   008A
        SUBR    R0,     R1                      ; 5191   0101
        CMPI    #$0001, R1                      ; 5192   0379 0001
        BLE     L_51A1                          ; 5194   0206 000B

L_5196:
        MVI     G_01D3, R1                      ; 5196   0281 01D3
        DECR    R1                              ; 5198   0011
        MVO     R1,     G_01D3                  ; 5199   0241 01D3
        BNEQ    L_51A7                          ; 519B   020C 000A

        DECR    R2                              ; 519D   0012
        BMI     L_51A7                          ; 519E   020B 0007

        MOVR    R2,     R0                      ; 51A0   0090
L_51A1:
        MVO     R0,     G_01D0                  ; 51A1   0240 01D0
        MVII    #$0003, R0                      ; 51A3   02B8 0003
        MVO     R0,     G_01D3                  ; 51A5   0240 01D3
L_51A7:
        MVI     G_01BF, R0                      ; 51A7   0280 01BF
        ANDI    #$0008, R0                      ; 51A9   03B8 0008
        BEQ     L_51B0                          ; 51AB   0204 0003

        JSR     R5,     L_60D7                  ; 51AD   0004 0160 00D7

L_51B0:
        MVI     G_01D1, R0                      ; 51B0   0280 01D1
        ANDI    #$0001, R0                      ; 51B2   03B8 0001
        BEQ     L_51BB                          ; 51B4   0204 0005

        JSR     R5,     L_D1CF                  ; 51B6   0004 01D0 01CF

        B       L_51BE                          ; 51B9   0200 0003

L_51BB:
        JSR     R5,     L_686B                  ; 51BB   0004 0168 006B

L_51BE:
        MVI     G_01D1, R0                      ; 51BE   0280 01D1
        DECR    R0                              ; 51C0   0010
        MVO     R0,     G_01D1                  ; 51C1   0240 01D1
        BNEQ    L_51CC                          ; 51C3   020C 0007

        MVI     G_01D2, R0                      ; 51C5   0280 01D2
        MVO     R0,     G_01D1                  ; 51C7   0240 01D1

        JSR     R5,     L_542C                  ; 51C9   0004 0154 002C

L_51CC:
        MVI     G_01D7, R0                      ; 51CC   0280 01D7
        TSTR    R0                              ; 51CE   0080
        BEQ     L_51FA                          ; 51CF   0204 0029
        J       L_6E6C                          ; 51D1   0004 036C 026C

L_51D4:
        PSHR    R5                              ; 51D4   0275
        MVI     G_016C, R0                      ; 51D5   0280 016C
        COMR    R0                              ; 51D7   0018
        ANDI    #$000E, R0                      ; 51D8   03B8 000E
        BNEQ    L_520D                          ; 51DA   020C 0031

        INCR    R0                              ; 51DC   0008
        MVI     G_016D, R5                      ; 51DD   0285 016D
        ANDI    #$000F, R5                      ; 51DF   03BD 000F
        ADDI    #$0170, R5                      ; 51E1   02FD 0170
        CMP@    R5,     R0                      ; 51E3   0368
        BNEQ    L_51E7                          ; 51E4   020C 0001

        INCR    R0                              ; 51E6   0008
L_51E7:
        CMP     G_0181, R0                      ; 51E7   0340 0181
        BNEQ    L_51F1                          ; 51E9   020C 0006

        INCR    R0                              ; 51EB   0008
        DECR    R5                              ; 51EC   0015
        CMP@    R5,     R0                      ; 51ED   0368
        BNEQ    L_51F1                          ; 51EE   020C 0001

        INCR    R0                              ; 51F0   0008
L_51F1:
        MVII    #$0170, R5                      ; 51F1   02BD 0170
L_51F3:
        CMP@    R5,     R0                      ; 51F3   0368
        BEQ     L_51FB                          ; 51F4   0204 0005

        CMPI    #$0179, R5                      ; 51F6   037D 0179
        BNEQ    L_51F3                          ; 51F8   022C 0006
L_51FA:
        PULR    R7                              ; 51FA   02B7

L_51FB:
        PSHR    R0                              ; 51FB   0270
        CLRR    R0                              ; 51FC   01C0
        DECR    R5                              ; 51FD   0015
        MVO@    R0,     R5                      ; 51FE   0268
        MOVR    R5,     R0                      ; 51FF   00A8
        SUBI    #$0171, R0                      ; 5200   0338 0171

        JSR     R5,     L_5C7F                  ; 5202   0004 015C 007F

        PULR    R0                              ; 5205   02B0
        PULR    R7                              ; 5206   02B7

L_5207:
        PSHR    R5                              ; 5207   0275
        MVI     G_016C, R0                      ; 5208   0280 016C
        COMR    R0                              ; 520A   0018
        ANDI    #$00F0, R0                      ; 520B   03B8 00F0
L_520D:
        CLRR    R5                              ; 520D   01ED
        INCR    R7                              ; 520E   000F

L_520F:
        INCR    R5                              ; 520F   000D
L_5210:
        SARC    R0,     1                       ; 5210   0078
        BC      L_5216                          ; 5211   0201 0003
        BNEQ    L_520F                          ; 5213   022C 0005

        DECR    R5                              ; 5215   0015
L_5216:
        MOVR    R5,     R0                      ; 5216   00A8

        JSR     R5,     X_CLR_BIT               ; 5217   0004 0114 02E6

        CMPR    R5,     R4                      ; 521A   016C
        PULR    R7                              ; 521B   02B7

L_521C:
        PSHR    R5                              ; 521C   0275
        PSHR    R1                              ; 521D   0271

        JSR     R5,     .EXEC.76C               ; 521E   0004 0114 036C
        JSR     R5,     X_SET_BIT               ; 5221   0004 0114 02DB

        CMPR    R5,     R4                      ; 5224   016C

        JSR     R5,     .EXEC.7AE               ; 5225   0004 0114 03AE

        PULR    R1                              ; 5228   02B1
        PULR    R7                              ; 5229   02B7

L_522A:
        PSHR    R5                              ; 522A   0275

        JSR     R5,     L_51D4                  ; 522B   0004 0150 01D4
        JSR     R5,     .EXEC.76C               ; 522E   0004 0114 036C

        MVO     R0,     G_0181                  ; 5231   0240 0181
        MOVR    R0,     R3                      ; 5233   0083
        MOVR    R1,     R2                      ; 5234   008A
        SDBD                                    ; 5235   0001
        MVII    #$6522, R1                      ; 5236   02B9 0022 0065

        JSR     R5,     X_INIT_MOB              ; 5239   0004 0114 02B2

        MOVR    R3,     R0                      ; 523C   0098

        JSR     R5,     .EXEC.41C               ; 523D   0004 0114 001C

        PULR    R7                              ; 5240   02B7

L_5241:
        PSHR    R5                              ; 5241   0275

        JSR     R5,     L_5251                  ; 5242   0004 0150 0251

        MOVR    R7,     R1                      ; 5245   00B9
        SUBI    #$0222, R1                      ; 5246   0339 0222

        JSR     R5,     .EXEC.81E               ; 5248   0004 0118 001E

        PULR    R5                              ; 524B   02B5
        MVI@    R5,     R4                      ; 524C   02AC
        CLRR    R3                              ; 524D   01DB
        J       X_PRINT_R5                      ; 524E   0004 0318 007B

L_5251:
        PSHR    R5                              ; 5251   0275
        MVI     .BTAB.05,R5                     ; 5252   0285 0205
        PSHR    R5                              ; 5254   0275
        MVII    #$0203, R4                      ; 5255   02BC 0203
        MVII    #$000E, R0                      ; 5257   02B8 000E

        JSR     R5,     X_FILL_ZERO             ; 5259   0004 0114 0338

        PULR    R5                              ; 525C   02B5
        CMPI    #$01A0, R5                      ; 525D   037D 01A0
        BNEQ    L_51FA                          ; 525F   022C 0066

        MVI     G_0186, R5                      ; 5261   0285 0186
        TSTR    R5                              ; 5263   00AD
        BEQ     L_51FA                          ; 5264   0224 006B

        CLRR    R5                              ; 5266   01ED
        MVO     R5,     G_0186                  ; 5267   0245 0186
        J       L_6429                          ; 5269   0004 0364 0029

L_526C:
        NOP                                     ; 526C   0034
        NOP                                     ; 526D   0034
        NOP                                     ; 526E   0034
        NOP                                     ; 526F   0034
        NOP                                     ; 5270   0034
        PSHR    R5                              ; 5271   0275

        JSR     R5,     .EXEC.7C1               ; 5272   0004 0114 03C1

        PSHR    R0                              ; 5275   0270

        JSR     R5,     L_5251                  ; 5276   0004 0150 0251

        MVII    #$0170, R1                      ; 5279   02B9 0170

        JSR     R5,     L_529B                  ; 527B   0004 0150 029B

L_527E:
        MVI     G_015F, R0                      ; 527E   0280 015F
        TSTR    R0                              ; 5280   0080
        BNEQ    L_5299                          ; 5281   020C 0016

        INCR    R2                              ; 5283   000A
        INCR    R1                              ; 5284   0009
        CMPI    #$0179, R1                      ; 5285   0379 0179
        BEQ     L_5299                          ; 5287   0204 0010

        CMP@    R1,     R0                      ; 5289   0348
        BNEQ    L_527E                          ; 528A   022C 000D

        MVI@    R2,     R3                      ; 528C   0293
        CMPI    #$0014, R3                      ; 528D   037B 0014
        BGT     L_527E                          ; 528F   022E 0012

        MOVR    R1,     R0                      ; 5291   0088
        SUBI    #$0170, R0                      ; 5292   0338 0170

        JSR     R5,     L_5C7F                  ; 5294   0004 015C 007F

        B       L_527E                          ; 5297   0220 001A

L_5299:
        PULR    R0                              ; 5299   02B0
        PULR    R7                              ; 529A   02B7

L_529B:
        MVI     G_01BF, R2                      ; 529B   0282 01BF
        ANDI    #$0001, R2                      ; 529D   03BA 0001
        BEQ     L_52AD                          ; 529F   0204 000C

        PSHR    R1                              ; 52A1   0271
        MVII    #$0189, R2                      ; 52A2   02BA 0189
        MVI     G_015D, R1                      ; 52A4   0281 015D
        TSTR    R1                              ; 52A6   0089
        BEQ     L_52AB                          ; 52A7   0204 0002

        MVII    #$01A4, R2                      ; 52A9   02BA 01A4
L_52AB:
        PULR    R1                              ; 52AB   02B1
        MOVR    R5,     R7                      ; 52AC   00AF

L_52AD:
        SDBD                                    ; 52AD   0001
        MVII    #$674D, R2                      ; 52AE   02BA 004D 0067
        MOVR    R5,     R7                      ; 52B1   00AF

        CMPI    #$0316, R6                      ; 52B2   037E 0316
        BLE     L_52EF                          ; 52B4   0206 0039

        MVI     G_01D9, R0                      ; 52B6   0280 01D9
        TSTR    R0                              ; 52B8   0080
        BNEQ    L_52EF                          ; 52B9   020C 0034

        MVO     R6,     G_01D9                  ; 52BB   0246 01D9
        PSHR    R5                              ; 52BD   0275
        DIS                                     ; 52BE   0003
        MVII    #$0200, R4                      ; 52BF   02BC 0200
        MVII    #$0006, R3                      ; 52C1   02BB 0006
        MVII    #$02F1, R2                      ; 52C3   02BA 02F1
L_52C5:
        MVI@    R2,     R1                      ; 52C5   0291

        JSR     R5,     L_DB87                  ; 52C6   0004 01D8 0387

        INCR    R2                              ; 52C9   000A
        CMPI    #$02F0, R4                      ; 52CA   037C 02F0
        BLT     L_52C5                          ; 52CC   0225 0008

        SDBD                                    ; 52CE   0001
        MVII    #$1906, R0                      ; 52CF   02B8 0006 0019
        MVO     R0,     G_035D                  ; 52D2   0240 035D
        CLRR    R0                              ; 52D4   01C0
        MVII    #$031E, R2                      ; 52D5   02BA 031E
L_52D7:
        MVO@    R0,     R2                      ; 52D7   0250
        ADDI    #$0008, R2                      ; 52D8   02FA 0008
        CMPI    #$035D, R2                      ; 52DA   037A 035D
        BLT     L_52D7                          ; 52DC   0225 0006

        DECR    R0                              ; 52DE   0010
        MVII    #$0125, R2                      ; 52DF   02BA 0125
L_52E1:
        MVO@    R0,     R2                      ; 52E1   0250
        INCR    R2                              ; 52E2   000A
        CMPI    #$0131, R2                      ; 52E3   037A 0131
        BLT     L_52E1                          ; 52E5   0225 0005

        EIS                                     ; 52E7   0002
        PULR    R5                              ; 52E8   02B5
L_52E9:
        DECR    R7                              ; 52E9   0017

        NOP                                     ; 52EA   0034
        NOP                                     ; 52EB   0034
        NOP                                     ; 52EC   0034
        NOP                                     ; 52ED   0034
        NOP                                     ; 52EE   0034
L_52EF:
        MVI     G_01D0, R0                      ; 52EF   0280 01D0
        MVO     R0,     .STIC.VDLY              ; 52F1   0240 0031
        NEGR    R0                              ; 52F3   0020
        ADDI    #$0008, R0                      ; 52F4   02F8 0008
        CMP     G_0119, R0                      ; 52F6   0340 0119
        BEQ     L_5309                          ; 52F8   0204 000F

        MVO     R0,     G_0119                  ; 52FA   0240 0119
        MVII    #$0320, R1                      ; 52FC   02B9 0320
        MVI@    R1,     R0                      ; 52FE   0288
        SWAP    R0,     1                       ; 52FF   0040
        ANDI    #$00FF, R0                      ; 5300   03B8 00FF
        CMPI    #$0001, R0                      ; 5302   0378 0001
        BGE     L_5309                          ; 5304   020D 0003

        INCR    R0                              ; 5306   0008
        SWAP    R0,     1                       ; 5307   0040
        MVO@    R0,     R1                      ; 5308   0248
L_5309:
        J       X_DEF_ISR                       ; 5309   0004 0310 0126

.TITLE:
        DECLE   $0053                           ; 530C  Cartridge year
        STRING  "ALL-STAR          MA"          ; 530D  Title string
        STRING  "JOR LEAGUE          "          ; 5321  
        STRING  "BASEBALL"                      ; 5335  
        DECLE   $0000                           ; 533D  

L_533E:
        PSHR    R5                              ; 533E   0275
        MVI     G_01CF, R1                      ; 533F   0281 01CF
        MOVR    R1,     R2                      ; 5341   008A
        ANDI    #$00A0, R2                      ; 5342   03BA 00A0
        BNEQ    L_534F                          ; 5344   020C 0009

        ANDI    #$0040, R1                      ; 5346   03B9 0040
        BEQ     L_55C8                          ; 5348   0204 027E

        MVI     G_015D, R1                      ; 534A   0281 015D
        TSTR    R1                              ; 534C   0089
        BEQ     L_55C8                          ; 534D   0204 0279

L_534F:
        MVII    #$01C4, R5                      ; 534F   02BD 01C4
        SDBD                                    ; 5351   0001
        MVI@    R5,     R1                      ; 5352   02A9
        MVII    #$0018, R2                      ; 5353   02BA 0018

        JSR     R5,     X_DIVR                  ; 5355   0004 011C 01F8

        PSHR    R0                              ; 5358   0270
        MOVR    R0,     R1                      ; 5359   0081
        MVII    #$01C0, R5                      ; 535A   02BD 01C0
        SDBD                                    ; 535C   0001
        MVI@    R5,     R0                      ; 535D   02A8
        SAR     R0,     2                       ; 535E   006C

        JSR     R5,     X_MPY                   ; 535F   0004 011C 01DC

        SAR     R2,     2                       ; 5362   006E
        SAR     R2,     2                       ; 5363   006E
        SAR     R2,     2                       ; 5364   006E
        MVI     G_01C7, R3                      ; 5365   0283 01C7
        ADDR    R2,     R3                      ; 5367   00D3
        CMPI    #$0008, R3                      ; 5368   037B 0008
        BGE     L_5370                          ; 536A   020D 0004

        MVII    #$0008, R3                      ; 536C   02BB 0008
        B       L_5376                          ; 536E   0200 0006

L_5370:
        CMPI    #$009F, R3                      ; 5370   037B 009F
        BLE     L_5383                          ; 5372   0206 000F

        MVII    #$009F, R3                      ; 5374   02BB 009F
L_5376:
        MVII    #$01C0, R5                      ; 5376   02BD 01C0
        SDBD                                    ; 5378   0001
        MVI@    R5,     R2                      ; 5379   02AA
        MVII    #$004C, R1                      ; 537A   02B9 004C
        SWAP    R1,     1                       ; 537C   0041

        JSR     R5,     X_DIVR                  ; 537D   0004 011C 01F8

        PULR    R1                              ; 5380   02B1
        MOVR    R0,     R1                      ; 5381   0081
        INCR    R7                              ; 5382   000F

L_5383:
        PULR    R1                              ; 5383   02B1
L_5384:
        MVII    #$01C2, R5                      ; 5384   02BD 01C2
        SDBD                                    ; 5386   0001
        MVI@    R5,     R0                      ; 5387   02A8
        SAR     R0,     1                       ; 5388   0068
        SAR     R0,     2                       ; 5389   006C

        JSR     R5,     X_MPY                   ; 538A   0004 011C 01DC

        SAR     R2,     2                       ; 538D   006E
        SAR     R2,     2                       ; 538E   006E
        SAR     R2,     2                       ; 538F   006E
        MVII    #$0059, R1                      ; 5390   02B9 0059
        SUBR    R2,     R1                      ; 5392   0111
        CMPI    #$0008, R1                      ; 5393   0379 0008
        BGE     L_539B                          ; 5395   020D 0004

        MVII    #$0008, R1                      ; 5397   02B9 0008
        MVII    #$0008, R1                      ; 5399   02B9 0008
L_539B:
        MVO     R3,     G_01DB                  ; 539B   0243 01DB
        MVO     R1,     G_01DA                  ; 539D   0241 01DA

        JSR     R5,     .EXEC.A61               ; 539F   0004 0118 0261
        DECLE   $0005                           ; 53A2   0005

        NOP                                     ; 53A3   0034
        NOP                                     ; 53A4   0034
        NOP                                     ; 53A5   0034
        NOP                                     ; 53A6   0034
        NOP                                     ; 53A7   0034
        SDBD                                    ; 53A8   0001
        MVII    #$7FFF, R0                      ; 53A9   02B8 00FF 007F
        MVO     R0,     G_01DC                  ; 53AC   0240 01DC
        SWAP    R0,     1                       ; 53AE   0040
        MVO     R0,     G_01DD                  ; 53AF   0240 01DD
        MVI     G_01DA, R1                      ; 53B1   0281 01DA
        MVI     G_01DB, R0                      ; 53B3   0280 01DB

        JSR     R5,     L_53CF                  ; 53B5   0004 0150 03CF

        MVII    #$01DA, R5                      ; 53B8   02BD 01DA
        SDBD                                    ; 53BA   0001
        MVI@    R5,     R2                      ; 53BB   02AA
        MVI     G_01CF, R3                      ; 53BC   0283 01CF
        ANDI    #$0007, R3                      ; 53BE   03BB 0007
        DECR    R3                              ; 53C0   0013
        PSHR    R0                              ; 53C1   0270
        MVII    #$0004, R0                      ; 53C2   02B8 0004

        JSR     R5,     X_RAND2                 ; 53C4   0004 0114 029E

        ADDR    R0,     R3                      ; 53C7   00C3
        PULR    R0                              ; 53C8   02B0
        SUBR    R3,     R2                      ; 53C9   011A
        MVII    #$000B, R3                      ; 53CA   02BB 000B
        J       L_5F55                          ; 53CC   0004 035C 0355

L_53CF:
        PSHR    R5                              ; 53CF   0275
        MVII    #$0012, R4                      ; 53D0   02BC 0012

        JSR     R5,     L_5E66                  ; 53D2   0004 015C 0266

        PSHR    R4                              ; 53D5   0274
        SUBI    #$0012, R4                      ; 53D6   033C 0012
L_53D8:
        MVI@    R4,     R3                      ; 53D8   02A3
        MVI@    R4,     R2                      ; 53D9   02A2
        PSHR    R4                              ; 53DA   0274

        JSR     R5,     .EXEC.78C               ; 53DB   0004 0114 038C

        PULR    R0                              ; 53DE   02B0
        MVII    #$01DC, R5                      ; 53DF   02BD 01DC
        SDBD                                    ; 53E1   0001
        MVI@    R5,     R1                      ; 53E2   02A9
        CMPR    R1,     R2                      ; 53E3   014A
        BC      L_53F3                          ; 53E4   0201 000D

        MVO     R2,     G_01DC                  ; 53E6   0242 01DC
        SWAP    R2,     1                       ; 53E8   0042
        MVO     R2,     G_01DD                  ; 53E9   0242 01DD
        SUBI    #$0002, R0                      ; 53EB   0338 0002
        MVO@    R0,     R5                      ; 53ED   0268
        SWAP    R0,     1                       ; 53EE   0040
        MVO@    R0,     R5                      ; 53EF   0268
        SWAP    R0,     1                       ; 53F0   0040
        ADDI    #$0002, R0                      ; 53F1   02F8 0002
L_53F3:
        PULR    R2                              ; 53F3   02B2
        CMPR    R2,     R0                      ; 53F4   0150
        BGE     L_53FD                          ; 53F5   020D 0006

        PSHR    R2                              ; 53F7   0272
        MOVR    R4,     R1                      ; 53F8   00A1
        MOVR    R0,     R4                      ; 53F9   0084
        MOVR    R3,     R0                      ; 53FA   0098
        B       L_53D8                          ; 53FB   0220 0024

L_53FD:
        SUBI    #$0012, R2                      ; 53FD   033A 0012
        MVII    #$01DE, R5                      ; 53FF   02BD 01DE
        SDBD                                    ; 5401   0001
        MVI@    R5,     R1                      ; 5402   02A9
        SUBR    R2,     R1                      ; 5403   0111
        SLR     R1,     1                       ; 5404   0061
        CMPI    #$0006, R1                      ; 5405   0379 0006
        BLT     L_540A                          ; 5407   0205 0001

        INCR    R1                              ; 5409   0009
L_540A:
        MOVR    R1,     R0                      ; 540A   0088
L_540B:
        CLRR    R4                              ; 540B   01E4
        MVO     R4,     G_01D5                  ; 540C   0244 01D5
        MVI     G_035D, R4                      ; 540E   0284 035D
        INCR    R4                              ; 5410   000C
        INCR    R4                              ; 5411   000C
        SDBD                                    ; 5412   0001
        MVI@    R4,     R1                      ; 5413   02A1
        TSTR    R1                              ; 5414   0089
        BEQ     L_5429                          ; 5415   0204 0012

        SDBD                                    ; 5417   0001
        CMPI    #$56B6, R1                      ; 5418   0379 00B6 0056
        BNEQ    L_5424                          ; 541B   020C 0007

        MVII    #$00FF, R1                      ; 541D   02B9 00FF

        JSR     R5,     L_56CC                  ; 541F   0004 0154 02CC

        B       L_5429                          ; 5422   0200 0005

L_5424:
        MVII    #$00FF, R1                      ; 5424   02B9 00FF

        JSR     R5,     L_56C7                  ; 5426   0004 0154 02C7

L_5429:
        J       L_5EDF                          ; 5429   0004 035C 02DF

L_542C:
        PSHR    R5                              ; 542C   0275
        MVI     G_016D, R0                      ; 542D   0280 016D
        SWAP    R0,     1                       ; 542F   0040
        SLLC    R0,     2                       ; 5430   005C
        BNOV    L_55C8                          ; 5431   020A 0195

        JSR     R5,     L_5B3D                  ; 5433   0004 0158 033D

        BEQ     L_55C8                          ; 5436   0204 0190
        BPL     L_543D                          ; 5438   0203 0003

        TSTR    R5                              ; 543A   00AD
        BEQ     L_55C8                          ; 543B   0204 018B

L_543D:
        MVO     R6,     G_011D                  ; 543D   0246 011D
        MVI     G_035D, R0                      ; 543F   0280 035D
        SDBD                                    ; 5441   0001
        CMPI    #$5B22, R0                      ; 5442   0378 0022 005B
        BEQ     L_55C8                          ; 5445   0204 0181

        MVII    #$0003, R0                      ; 5447   02B8 0003

L_5449:
        JSR     R5,     L_55A1                  ; 5449   0004 0154 01A1

        TSTR    R1                              ; 544C   0089
        BPL     L_5454                          ; 544D   0203 0005

L_544F:
        DECR    R0                              ; 544F   0010
        BPL     L_5449                          ; 5450   0223 0008
        B       L_54A3                          ; 5452   0200 004F

L_5454:
        DECR    R0                              ; 5454   0010
        MVI     G_01D6, R4                      ; 5455   0284 01D6
        TSTR    R4                              ; 5457   00A4
        BNEQ    L_5466                          ; 5458   020C 000C

        TSTR    R0                              ; 545A   0080
        BMI     L_5465                          ; 545B   020B 0008

        PSHR    R1                              ; 545D   0271

        JSR     R5,     L_55A1                  ; 545E   0004 0154 01A1

        TSTR    R1                              ; 5461   0089
        PULR    R1                              ; 5462   02B1
        BMI     L_544F                          ; 5463   022B 0015

L_5465:
        INCR    R0                              ; 5465   0008
L_5466:
        PSHR    R0                              ; 5466   0270

        JSR     R5,     L_564C                  ; 5467   0004 0154 024C

        MVI     G_01CF, R5                      ; 546A   0285 01CF
        ANDI    #$0007, R5                      ; 546C   03BD 0007
        SUBR    R5,     R0                      ; 546E   0128
        ADDI    #$0004, R0                      ; 546F   02F8 0004
        PULR    R0                              ; 5471   02B0
        BPL     L_544F                          ; 5472   0223 0024

        MVO     R1,     G_01D5                  ; 5474   0241 01D5
        MVI     G_01D6, R4                      ; 5476   0284 01D6
        TSTR    R4                              ; 5478   00A4
        BEQ     L_5480                          ; 5479   0204 0005

        MVII    #$0179, R5                      ; 547B   02BD 0179
        ADDR    R1,     R5                      ; 547D   00CD
        MVI@    R5,     R0                      ; 547E   02A8
        DECR    R0                              ; 547F   0010
L_5480:
        TSTR    R0                              ; 5480   0080
        BNEQ    L_5489                          ; 5481   020C 0006

        SDBD                                    ; 5483   0001
        MVII    #$9039, R3                      ; 5484   02BB 0039 0090
        B       L_551F                          ; 5487   0200 0096

L_5489:
        CMPI    #$0001, R0                      ; 5489   0378 0001
        BNEQ    L_5493                          ; 548B   020C 0006

        SDBD                                    ; 548D   0001
        MVII    #$5424, R3                      ; 548E   02BB 0024 0054
        B       L_551F                          ; 5491   0200 008C

L_5493:
        CMPI    #$0002, R0                      ; 5493   0378 0002
        BNEQ    L_549D                          ; 5495   020C 0006

        SDBD                                    ; 5497   0001
        MVII    #$1839, R3                      ; 5498   02BB 0039 0018
        B       L_551F                          ; 549B   0200 0082

L_549D:
        SDBD                                    ; 549D   0001
        MVII    #$5455, R3                      ; 549E   02BB 0055 0054
        B       L_551F                          ; 54A1   0200 007C

L_54A3:
        MVII    #$0003, R0                      ; 54A3   02B8 0003
        MVO     R0,     G_01E1                  ; 54A5   0240 01E1

L_54A7:
        JSR     R5,     L_55A1                  ; 54A7   0004 0154 01A1

        TSTR    R1                              ; 54AA   0089
        BPL     L_54CB                          ; 54AB   0203 001E

        MVI     G_01E1, R0                      ; 54AD   0280 01E1
        DECR    R0                              ; 54AF   0010
        MVO     R0,     G_01E1                  ; 54B0   0240 01E1
        BPL     L_54A7                          ; 54B2   0223 000C

        MVI     G_016D, R0                      ; 54B4   0280 016D
        ANDI    #$000F, R0                      ; 54B6   03B8 000F
        CMPI    #$0007, R0                      ; 54B8   0378 0007
        BNEQ    L_54C7                          ; 54BA   020C 000B

        MVI     G_0160, R0                      ; 54BC   0280 0160
        TSTR    R0                              ; 54BE   0080
        BNEQ    L_55C8                          ; 54BF   020C 0107

        MVI     G_0163, R0                      ; 54C1   0280 0163
        SUBI    #$0003, R0                      ; 54C3   0338 0003
        BPL     L_55C8                          ; 54C5   0203 0101

L_54C7:
        MVII    #$0008, R0                      ; 54C7   02B8 0008
        B       L_540B                          ; 54C9   0220 00BF

L_54CB:
        MVO     R1,     G_01E0                  ; 54CB   0241 01E0
        PSHR    R0                              ; 54CD   0270
        CMP     G_016E, R1                      ; 54CE   0341 016E
        BNEQ    L_54F2                          ; 54D0   020C 0020

        MVI     G_016D, R4                      ; 54D2   0284 016D
        ANDI    #$000F, R4                      ; 54D4   03BC 000F
        CMPI    #$0007, R4                      ; 54D6   037C 0007
        BEQ     L_54F2                          ; 54D8   0204 0018

        PSHR    R1                              ; 54DA   0271

        JSR     R5,     L_5EDE                  ; 54DB   0004 015C 02DE

        MOVR    R0,     R1                      ; 54DE   0081
        PULR    R0                              ; 54DF   02B0

        JSR     R5,     L_5691                  ; 54E0   0004 0154 0291
        JSR     R5,     X_RAND2                 ; 54E3   0004 0114 029E

        MVI     G_01CF, R5                      ; 54E6   0285 01CF
        ANDI    #$0007, R5                      ; 54E8   03BD 0007
        CMPI    #$0002, R5                      ; 54EA   037D 0002
        BLE     L_54EF                          ; 54EC   0206 0001

        SLR     R0,     1                       ; 54EE   0060
L_54EF:
        SLR     R0,     2                       ; 54EF   0064
        BEQ     L_556D                          ; 54F0   0204 007B

L_54F2:
        MVI     G_01E0, R0                      ; 54F2   0280 01E0

        JSR     R5,     .EXEC.76C               ; 54F4   0004 0114 036C

        ADDI    #$0007, R1                      ; 54F7   02F9 0007
        MVI@    R1,     R2                      ; 54F9   028A
        MOVR    R0,     R1                      ; 54FA   0081
        MOVR    R2,     R0                      ; 54FB   0090
        PSHR    R0                              ; 54FC   0270

        JSR     R5,     L_564C                  ; 54FD   0004 0154 024C

        MVI     G_01CF, R2                      ; 5500   0282 01CF
        ANDI    #$0007, R2                      ; 5502   03BA 0007
        NEGR    R2                              ; 5504   0022
        ADDI    #$0003, R2                      ; 5505   02FA 0003
        SUBR    R0,     R2                      ; 5507   0102
        PULR    R0                              ; 5508   02B0
        MVI     G_016D, R4                      ; 5509   0284 016D
        ANDI    #$000F, R4                      ; 550B   03BC 000F
        BEQ     L_5517                          ; 550D   0204 0008

        CMPI    #$0007, R4                      ; 550F   037C 0007
        BEQ     L_551D                          ; 5511   0204 000A

        CMPI    #$0004, R4                      ; 5513   037C 0004
        BLT     L_551D                          ; 5515   0205 0006

L_5517:
        SDBD                                    ; 5517   0001
        CMPI    #$FFFF, R2                      ; 5518   037A 00FF 00FF
        BGT     L_556D                          ; 551B   020E 0050

L_551D:
        MOVR    R0,     R3                      ; 551D   0083
        PULR    R0                              ; 551E   02B0
L_551F:
        PSHR    R0                              ; 551F   0270

        JSR     R5,     L_5EDE                  ; 5520   0004 015C 02DE
        DECLE   $0082,  $02B0,  $0281,  $016D   ; 5523   0082 02B0 0281 016D
        DECLE   $03B9,  $000F,  $0001           ; 5527   03B9 000F 0001

        CMPI    #$0055, R3                      ; 552A   037B 0055
        RLC     R0,     2                       ; 552C   0054
        BNEQ    L_5535                          ; 552D   020C 0006

        TSTR    R1                              ; 552F   0089
        BEQ     L_5572                          ; 5530   0204 0040

        CLRR    R0                              ; 5532   01C0
        B       L_540B                          ; 5533   0220 0129

L_5535:
        SDBD                                    ; 5535   0001
        CMPI    #$1839, R3                      ; 5536   037B 0039 0018
        BNEQ    L_554A                          ; 5539   020C 000F

        CMPI    #$0006, R1                      ; 553B   0379 0006
        BEQ     L_5572                          ; 553D   0204 0033

        CMPI    #$0002, R0                      ; 553F   0378 0002
        BEQ     L_5546                          ; 5541   0204 0003

        JSR     R5,     L_558D                  ; 5543   0004 0154 018D

L_5546:
        MVII    #$0007, R0                      ; 5546   02B8 0007
        B       L_540B                          ; 5548   0220 013E

L_554A:
        SDBD                                    ; 554A   0001
        CMPI    #$5424, R3                      ; 554B   037B 0024 0054
        BNEQ    L_555F                          ; 554E   020C 000F

        CMPI    #$0005, R1                      ; 5550   0379 0005
        BEQ     L_5572                          ; 5552   0204 001E

        CMPI    #$0001, R0                      ; 5554   0378 0001
        BEQ     L_555B                          ; 5556   0204 0003

        JSR     R5,     L_558D                  ; 5558   0004 0154 018D

L_555B:
        MVII    #$0005, R0                      ; 555B   02B8 0005
        B       L_540B                          ; 555D   0220 0153

L_555F:
        CMPI    #$0008, R1                      ; 555F   0379 0008
        BEQ     L_5572                          ; 5561   0204 000F

        TSTR    R0                              ; 5563   0080
        BEQ     L_5569                          ; 5564   0204 0003

        JSR     R5,     L_558D                  ; 5566   0004 0154 018D

L_5569:
        MVII    #$0009, R0                      ; 5569   02B8 0009
        B       L_540B                          ; 556B   0220 0161

L_556D:
        PULR    R5                              ; 556D   02B5

        JSR     R5,     L_5EDE                  ; 556E   0004 015C 02DE

        MOVR    R0,     R2                      ; 5571   0082
L_5572:
        PSHR    R2                              ; 5572   0272
        MOVR    R3,     R2                      ; 5573   009A
        MVI     G_01D5, R3                      ; 5574   0283 01D5
        CLRR    R5                              ; 5576   01ED
        MVO     R5,     G_01D5                  ; 5577   0245 01D5
        TSTR    R3                              ; 5579   009B
        BNEQ    L_5587                          ; 557A   020C 000B

        MVI     G_01E0, R0                      ; 557C   0280 01E0

        JSR     R5,     .EXEC.772               ; 557E   0004 0114 0372

        MOVR    R2,     R0                      ; 5581   0090
        MOVR    R3,     R1                      ; 5582   0099

        JSR     R5,     X_PACK_BYTES            ; 5583   0004 0114 034F

        MOVR    R0,     R2                      ; 5586   0082
L_5587:
        MVII    #$000F, R3                      ; 5587   02BB 000F
        PULR    R0                              ; 5589   02B0
        J       L_5F55                          ; 558A   0004 035C 0355

L_558D:
        PSHR    R5                              ; 558D   0275
        MVI     G_016D, R5                      ; 558E   0285 016D
        ANDI    #$000F, R5                      ; 5590   03BD 000F
        CMPI    #$0007, R5                      ; 5592   037D 0007
        BEQ     L_55C8                          ; 5594   0204 0032

        MVII    #$0004, R0                      ; 5596   02B8 0004

        JSR     R5,     X_RAND2                 ; 5598   0004 0114 029E

        TSTR    R0                              ; 559B   0080
        BEQ     L_55C8                          ; 559C   0204 002A

        PULR    R0                              ; 559E   02B0
        B       L_5572                          ; 559F   0220 002E

L_55A1:
        PSHR    R5                              ; 55A1   0275
        MVII    #$0179, R4                      ; 55A2   02BC 0179
L_55A4:
        MVI@    R4,     R3                      ; 55A4   02A3
        MOVR    R3,     R1                      ; 55A5   0099
        ANDI    #$0007, R1                      ; 55A6   03B9 0007
        BEQ     L_55C0                          ; 55A8   0204 0016

        MOVR    R3,     R2                      ; 55AA   009A
        ANDI    #$0020, R2                      ; 55AB   03BA 0020
        BNEQ    L_55C0                          ; 55AD   020C 0011

        SLR     R3,     2                       ; 55AF   0067
        SLR     R3,     1                       ; 55B0   0063
        ANDI    #$0003, R3                      ; 55B1   03BB 0003
        CMPR    R3,     R0                      ; 55B3   0158
        BNEQ    L_55C0                          ; 55B4   020C 000A

        PSHR    R1                              ; 55B6   0271
        PSHR    R0                              ; 55B7   0270
        MOVR    R1,     R0                      ; 55B8   0088

        JSR     R5,     L_6EBF                  ; 55B9   0004 016C 02BF

        PULR    R0                              ; 55BC   02B0
        PULR    R1                              ; 55BD   02B1
        BMI     L_55C8                          ; 55BE   020B 0008

L_55C0:
        CMPI    #$017D, R4                      ; 55C0   037C 017D
        BNEQ    L_55A4                          ; 55C2   022C 001F

        SDBD                                    ; 55C4   0001
        MVII    #$FFFF, R1                      ; 55C5   02B9 00FF 00FF
L_55C8:
        PULR    R7                              ; 55C8   02B7

L_55C9:
        NOP                                     ; 55C9   0034
        NOP                                     ; 55CA   0034
        NOP                                     ; 55CB   0034
        NOP                                     ; 55CC   0034
        NOP                                     ; 55CD   0034
        PSHR    R5                              ; 55CE   0275
        MVI     G_016D, R0                      ; 55CF   0280 016D
        MOVR    R0,     R3                      ; 55D1   0083
        SWAP    R0,     1                       ; 55D2   0040
        SLLC    R0,     2                       ; 55D3   005C
        BNOV    L_55C8                          ; 55D4   022A 000D

        MVI     G_0160, R0                      ; 55D6   0280 0160
        BEQ     L_55C8                          ; 55D8   0224 0011

        SDBD                                    ; 55DA   0001
        MVII    #$502C, R1                      ; 55DB   02B9 002C 0050

        JSR     R5,     X_TIMER_STOP            ; 55DE   0004 0118 0038
        JSR     R5,     L_5B3D                  ; 55E1   0004 0158 033D

        BEQ     L_55C8                          ; 55E4   0224 001D
        BPL     L_55EB                          ; 55E6   0203 0003

        TSTR    R5                              ; 55E8   00AD
        BEQ     L_55C8                          ; 55E9   0224 0022

L_55EB:
        ANDI    #$000F, R3                      ; 55EB   03BB 000F
        CMPI    #$0007, R3                      ; 55ED   037B 0007
        BNEQ    L_55C8                          ; 55EF   022C 0028

        MVII    #$0030, R0                      ; 55F1   02B8 0030

        JSR     R5,     X_RAND2                 ; 55F3   0004 0114 029E

        SDBD                                    ; 55F6   0001
        MVII    #$5615, R5                      ; 55F7   02BD 0015 0056
        CLRR    R1                              ; 55FA   01C9
        COMR    R1                              ; 55FB   0019
L_55FC:
        INCR    R1                              ; 55FC   0009
        SUB@    R5,     R0                      ; 55FD   0328
        BGT     L_55FC                          ; 55FE   022E 0003

        MVI     G_01CF, R0                      ; 5600   0280 01CF
        ANDI    #$0007, R0                      ; 5602   03B8 0007
        CMPI    #$0002, R0                      ; 5604   0378 0002
        BLE     L_5610                          ; 5606   0206 0008

        CMPI    #$0008, R1                      ; 5608   0379 0008
        BEQ     L_560F                          ; 560A   0204 0003

        TSTR    R1                              ; 560C   0089
        BNEQ    L_5610                          ; 560D   020C 0001

L_560F:
        INCR    R1                              ; 560F   0009
L_5610:
        MOVR    R1,     R0                      ; 5610   0088
        CLRR    R1                              ; 5611   01C9
        J       L_5AF9                          ; 5612   0004 0358 02F9

        DECLE   $0002,  $0002,  $0002,  $0004   ; 5615   0002 0002 0002 0004
        DECLE   $0006,  $0004,  $0002,  $0002   ; 5619   0006 0004 0002 0002
        DECLE   $0002,  $0002,  $0002,  $0004   ; 561D   0002 0002 0002 0004
        DECLE   $0006,  $0004                   ; 5621   0006 0004

        EIS                                     ; 5623   0002
        EIS                                     ; 5624   0002
L_5625:
        PSHR    R5                              ; 5625   0275
        CMPI    #$0001, R0                      ; 5626   0378 0001
        BLE     L_55C8                          ; 5628   0226 0061

        CMPI    #$0006, R0                      ; 562A   0378 0006
        BLE     L_563A                          ; 562C   0206 000C

        CMPI    #$000A, R0                      ; 562E   0378 000A
        BLE     L_55C8                          ; 5630   0226 0069

        CMPI    #$000F, R0                      ; 5632   0378 000F
        BGE     L_55C8                          ; 5634   022D 006D

        MVII    #$0023, R1                      ; 5636   02B9 0023
        B       L_563C                          ; 5638   0200 0002

L_563A:
        MVII    #$001A, R1                      ; 563A   02B9 001A
L_563C:
        PSHR    R0                              ; 563C   0270
        MVII    #$0006, R0                      ; 563D   02B8 0006

        JSR     R5,     X_RAND2                 ; 563F   0004 0114 029E

        ADDR    R1,     R0                      ; 5642   00C8
        SDBD                                    ; 5643   0001
        MVII    #$5030, R1                      ; 5644   02B9 0030 0050

        JSR     R5,     .EXEC.831               ; 5647   0004 0118 0031

        PULR    R0                              ; 564A   02B0
        PULR    R7                              ; 564B   02B7

L_564C:
        PSHR    R5                              ; 564C   0275

        JSR     R5,     .EXEC.7C1               ; 564D   0004 0114 03C1

        MOVR    R1,     R0                      ; 5650   0088

        JSR     R5,     .EXEC.76C               ; 5651   0004 0114 036C

        ADDI    #$0007, R1                      ; 5654   02F9 0007
        MVI@    R1,     R2                      ; 5656   028A
        MOVR    R2,     R3                      ; 5657   0093
        ANDI    #$00FF, R3                      ; 5658   03BB 00FF
        SWAP    R2,     1                       ; 565A   0042
        ANDI    #$00FF, R2                      ; 565B   03BA 00FF
        MOVR    R1,     R4                      ; 565D   008C
        PSHR    R2                              ; 565E   0272
        PSHR    R3                              ; 565F   0273
        SUBI    #$0005, R4                      ; 5660   033C 0005

        JSR     R5,     .EXEC.784               ; 5662   0004 0114 0384

        PULR    R3                              ; 5665   02B3
        PULR    R0                              ; 5666   02B0
        PSHR    R2                              ; 5667   0272
        MOVR    R0,     R2                      ; 5668   0082
        MVI     G_031E, R1                      ; 5669   0281 031E
        SDBD                                    ; 566B   0001
        CMPI    #$6776, R1                      ; 566C   0379 0076 0067
        BNEQ    L_5675                          ; 566F   020C 0004

        MVII    #$031F, R4                      ; 5671   02BC 031F
        B       L_567E                          ; 5673   0200 0009

L_5675:
        JSR     R5,     L_5EDE                  ; 5675   0004 015C 02DE
        JSR     R5,     .EXEC.76C               ; 5678   0004 0114 036C

        ADDI    #$0002, R1                      ; 567B   02F9 0002
        MOVR    R1,     R4                      ; 567D   008C

L_567E:
        JSR     R5,     .EXEC.784               ; 567E   0004 0114 0384

        MOVR    R2,     R1                      ; 5681   0091
        MVII    #$002D, R2                      ; 5682   02BA 002D

        JSR     R5,     X_DIVR                  ; 5684   0004 011C 01F8

        MOVR    R0,     R3                      ; 5687   0083
        PULR    R1                              ; 5688   02B1
        MVII    #$000E, R2                      ; 5689   02BA 000E

        JSR     R5,     X_DIVR                  ; 568B   0004 011C 01F8

        SUBR    R0,     R3                      ; 568E   0103
        MOVR    R3,     R0                      ; 568F   0098
        PULR    R7                              ; 5690   02B7

L_5691:
        PSHR    R5                              ; 5691   0275

        JSR     R5,     .EXEC.7C1               ; 5692   0004 0114 03C1

        MOVR    R1,     R2                      ; 5695   008A

        JSR     R5,     .EXEC.76C               ; 5696   0004 0114 036C

        ADDI    #$0002, R1                      ; 5699   02F9 0002
        MOVR    R1,     R4                      ; 569B   008C
        MOVR    R2,     R0                      ; 569C   0090

        JSR     R5,     .EXEC.772               ; 569D   0004 0114 0372
        JSR     R5,     .EXEC.7A3               ; 56A0   0004 0114 03A3

        MOVR    R2,     R0                      ; 56A3   0090
        PULR    R7                              ; 56A4   02B7

        NOP                                     ; 56A5   0034
        NOP                                     ; 56A6   0034
        NOP                                     ; 56A7   0034
        NOP                                     ; 56A8   0034
        NOP                                     ; 56A9   0034
        PSHR    R5                              ; 56AA   0275

        JSR     R5,     L_5B3D                  ; 56AB   0004 0158 033D

        BEQ     L_56C7                          ; 56AE   0204 0017
        BPL     L_5873                          ; 56B0   0203 01C1

        TSTR    R5                              ; 56B2   00AD
        BEQ     L_56C7                          ; 56B3   0204 0012
        PULR    R7                              ; 56B5   02B7

        NOP                                     ; 56B6   0034
        NOP                                     ; 56B7   0034
        NOP                                     ; 56B8   0034
        NOP                                     ; 56B9   0034
        NOP                                     ; 56BA   0034
        PSHR    R5                              ; 56BB   0275

        JSR     R5,     L_5B3D                  ; 56BC   0004 0158 033D

        BEQ     L_56CD                          ; 56BF   0204 000C
        BPL     L_5873                          ; 56C1   0203 01B0

        TSTR    R5                              ; 56C3   00AD
        BEQ     L_56CD                          ; 56C4   0204 0007
        PULR    R7                              ; 56C6   02B7

L_56C7:
        CMPI    #$0008, R0                      ; 56C7   0378 0008
        BEQ     L_5873                          ; 56C9   0204 01A8
        INCR    R7                              ; 56CB   000F

L_56CC:
        PSHR    R5                              ; 56CC   0275
L_56CD:
        CMP     G_015D, R1                      ; 56CD   0341 015D
        BEQ     L_5873                          ; 56CF   0204 01A2

        CMPI    #$000A, R0                      ; 56D1   0378 000A
        BGE     L_5767                          ; 56D3   020D 0092

L_56D5:
        MVI     G_016D, R1                      ; 56D5   0281 016D
        ANDI    #$00C0, R1                      ; 56D7   03B9 00C0
        BEQ     L_5873                          ; 56D9   0204 0198

        CMPI    #$0009, R0                      ; 56DB   0378 0009
        BGT     L_5873                          ; 56DD   020E 0194

        CMPI    #$0006, R0                      ; 56DF   0378 0006
        BLT     L_56E4                          ; 56E1   0205 0001

        DECR    R0                              ; 56E3   0010
L_56E4:
        MVI     G_016D, R2                      ; 56E4   0282 016D
        SWAP    R2,     1                       ; 56E6   0042
        SLLC    R2,     2                       ; 56E7   005E
        BNOV    L_56EA                          ; 56E8   020A 0000

L_56EA:
        JSR     R5,     L_5C6E                  ; 56EA   0004 015C 006E

        BC      L_56F9                          ; 56ED   0201 000A
        INCR    R7                              ; 56EF   000F

L_56F0:
        PSHR    R5                              ; 56F0   0275
L_56F1:
        MVI     G_016B, R4                      ; 56F1   0284 016B
        COMR    R4                              ; 56F3   001C
        AND@    R5,     R4                      ; 56F4   03AC
        DECR    R5                              ; 56F5   0015
        MVO@    R4,     R5                      ; 56F6   026C
        B       L_5712                          ; 56F7   0200 0019

L_56F9:
        MVI     G_016D, R1                      ; 56F9   0281 016D
        SWAP    R1,     1                       ; 56FB   0041
        SLLC    R1,     2                       ; 56FC   005D
        BNOV    L_5873                          ; 56FD   020A 0174

        CMPI    #$0007, R0                      ; 56FF   0378 0007
        BNEQ    L_5873                          ; 5701   020C 0170

        PSHR    R0                              ; 5703   0270
        MOVR    R1,     R0                      ; 5704   0088

        JSR     R5,     .EXEC.76C               ; 5705   0004 0114 036C

        ADDI    #$0001, R1                      ; 5708   02F9 0001
        MVI@    R1,     R1                      ; 570A   0289
        PULR    R0                              ; 570B   02B0
        SDBD                                    ; 570C   0001
        CMPI    #$683A, R1                      ; 570D   0379 003A 0068
        BEQ     L_5873                          ; 5710   0204 0161

L_5712:
        JSR     R5,     L_571F                  ; 5712   0004 0154 031F
        DECLE   $0000,  $0000,  $00B6,  $0056   ; 5715   0000 0000 00B6 0056
        DECLE   $0000,  $00D0,  $0000,  $00D0   ; 5719   0000 00D0 0000 00D0
        DECLE   $0000                           ; 571D   0000

        ADDR    R2,     R0                      ; 571E   00D0
L_571F:
        MVO     R5,     G_035D                  ; 571F   0245 035D
        MVI     G_016D, R1                      ; 5721   0281 016D
        MOVR    R0,     R2                      ; 5723   0082
        XORI    #$0080, R2                      ; 5724   03FA 0080
        MVO     R2,     G_016D                  ; 5726   0242 016D
        SWAP    R1,     1                       ; 5728   0041
        SLLC    R1,     2                       ; 5729   005D
        SLR     R1,     2                       ; 572A   0065
        SWAP    R1,     1                       ; 572B   0041
        BC      L_5732                          ; 572C   0201 0004

        MVII    #$0007, R1                      ; 572E   02B9 0007
        B       L_5734                          ; 5730   0200 0002
L_5732:
        BNOV    L_573A                          ; 5732   020A 0006

L_5734:
        JSR     R5,     L_5BAE                  ; 5734   0004 0158 03AE

        CMPR    R0,     R1                      ; 5737   0141
        BEQ     L_5873                          ; 5738   0204 0139

L_573A:
        MOVR    R1,     R4                      ; 573A   008C
        ADDR    R4,     R4                      ; 573B   00E4

        JSR     R5,     L_5E66                  ; 573C   0004 015C 0266

        MOVR    R4,     R5                      ; 573F   00A5
        SDBD                                    ; 5740   0001
        MVI@    R5,     R0                      ; 5741   02A8
        PSHR    R0                              ; 5742   0270
        ADDI    #$0170, R1                      ; 5743   02F9 0170
        MVI@    R1,     R0                      ; 5745   0288
        PSHR    R0                              ; 5746   0270

        JSR     R5,     .EXEC.76C               ; 5747   0004 0114 036C

        MOVR    R1,     R2                      ; 574A   008A
        ADDI    #$0002, R1                      ; 574B   02F9 0002
        MVI@    R1,     R3                      ; 574D   028B
        INCR    R1                              ; 574E   0009
        MVI@    R1,     R4                      ; 574F   028C
        SDBD                                    ; 5750   0001
        MVII    #$679E, R1                      ; 5751   02B9 009E 0067

        JSR     R5,     X_INIT_MOB              ; 5754   0004 0114 02B2

        MVI@    R2,     R5                      ; 5757   0295
        XOR     G_016B, R5                      ; 5758   03C5 016B
        MVO@    R5,     R2                      ; 575A   0255
        ADDI    #$0002, R2                      ; 575B   02FA 0002
        MVO@    R3,     R2                      ; 575D   0253
        INCR    R2                              ; 575E   000A
        MVO@    R4,     R2                      ; 575F   0254
        PULR    R0                              ; 5760   02B0
        PULR    R2                              ; 5761   02B2
        MVII    #$0017, R3                      ; 5762   02BB 0017

        JSR     R5,     L_5F55                  ; 5764   0004 015C 0355

L_5767:
        NOP                                     ; 5767   0034
        NOP                                     ; 5768   0034
        NOP                                     ; 5769   0034
        NOP                                     ; 576A   0034
        NOP                                     ; 576B   0034
        MVII    #$0179, R5                      ; 576C   02BD 0179
L_576E:
        MVI@    R5,     R1                      ; 576E   02A9
        TSTR    R1                              ; 576F   0089
        BEQ     L_5776                          ; 5770   0204 0004

        ANDI    #$0040, R1                      ; 5772   03B9 0040
        BEQ     L_5873                          ; 5774   0204 00FD

L_5776:
        CMPI    #$017D, R5                      ; 5776   037D 017D
        BNEQ    L_576E                          ; 5778   022C 000B

        MVI     G_016D, R1                      ; 577A   0281 016D
        ANDI    #$000F, R1                      ; 577C   03B9 000F
        BEQ     L_5873                          ; 577E   0204 00F3

        CMPI    #$0007, R1                      ; 5780   0379 0007
        BNEQ    L_57AD                          ; 5782   020C 0029
        INCR    R7                              ; 5784   000F

L_5785:
        PSHR    R5                              ; 5785   0275

L_5786:
        JSR     R5,     L_5868                  ; 5786   0004 0158 0068

        CMPI    #$000A, R0                      ; 5789   0378 000A
        MVI     G_01BF, R0                      ; 578B   0280 01BF
        BEQ     L_57A9                          ; 578D   0204 001A

        ANDI    #$00FE, R0                      ; 578F   03B8 00FE
        XORI    #$0001, R0                      ; 5791   03F8 0001
L_5793:
        MVO     R0,     G_01BF                  ; 5793   0240 01BF
        INCR    R7                              ; 5795   000F

L_5796:
        PSHR    R5                              ; 5796   0275
L_5797:
        MVII    #$0170, R3                      ; 5797   02BB 0170
        MVII    #$0009, R0                      ; 5799   02B8 0009
L_579B:
        DECR    R0                              ; 579B   0010
        BMI     L_5873                          ; 579C   020B 00D5

        MOVR    R0,     R1                      ; 579E   0081
        ADDR    R3,     R1                      ; 579F   00D9
        MVI@    R1,     R1                      ; 57A0   0289
        TSTR    R1                              ; 57A1   0089
        BNEQ    L_579B                          ; 57A2   022C 0008

        JSR     R5,     L_5C7F                  ; 57A4   0004 015C 007F

        B       L_579B                          ; 57A7   0220 000D

L_57A9:
        ANDI    #$00FE, R0                      ; 57A9   03B8 00FE
        B       L_5793                          ; 57AB   0220 0019

L_57AD:
        MOVR    R1,     R4                      ; 57AD   008C
        CMPI    #$000B, R0                      ; 57AE   0378 000B
        BEQ     L_57D7                          ; 57B0   0204 0025

        MVII    #$0189, R1                      ; 57B2   02B9 0189
        MVI     G_015D, R5                      ; 57B4   0285 015D
        TSTR    R5                              ; 57B6   00AD
        BEQ     L_57BB                          ; 57B7   0204 0002

        MVII    #$01A4, R1                      ; 57B9   02B9 01A4
L_57BB:
        ADDR    R4,     R1                      ; 57BB   00E1
        SDBD                                    ; 57BC   0001
        MVII    #$674D, R2                      ; 57BD   02BA 004D 0067
        ADDR    R4,     R2                      ; 57C0   00E2
        MVI@    R2,     R0                      ; 57C1   0290
        MVO@    R0,     R1                      ; 57C2   0248
        ADDI    #$0009, R2                      ; 57C3   02FA 0009
        ADDR    R4,     R2                      ; 57C5   00E2
        ADDI    #$0009, R1                      ; 57C6   02F9 0009
        ADDR    R4,     R1                      ; 57C8   00E1
        MVI@    R2,     R0                      ; 57C9   0290
        MVO@    R0,     R1                      ; 57CA   0248
        INCR    R2                              ; 57CB   000A
        INCR    R1                              ; 57CC   0009
        MVI@    R2,     R0                      ; 57CD   0290
        MVO@    R0,     R1                      ; 57CE   0248

        JSR     R5,     L_5868                  ; 57CF   0004 0158 0068
        JSR     R5,     L_5796                  ; 57D2   0004 0154 0396

        B       L_5860                          ; 57D5   0200 0089

L_57D7:
        ADDI    #$0170, R1                      ; 57D7   02F9 0170
        MVI@    R1,     R0                      ; 57D9   0288
        ANDI    #$0007, R0                      ; 57DA   03B8 0007
        BEQ     L_5873                          ; 57DC   0204 0095

        JSR     R5,     .EXEC.76C               ; 57DE   0004 0114 036C

        MOVR    R1,     R5                      ; 57E1   008D
        ADDI    #$0002, R1                      ; 57E2   02F9 0002
        MVI@    R1,     R1                      ; 57E4   0289
        SWAP    R1,     1                       ; 57E5   0041
        ANDI    #$00FF, R1                      ; 57E6   03B9 00FF
        SUBI    #$0004, R1                      ; 57E8   0339 0004
        SLR     R1,     2                       ; 57EA   0065
        SLR     R1,     1                       ; 57EB   0061
        MOVR    R1,     R2                      ; 57EC   008A
        MOVR    R5,     R1                      ; 57ED   00A9
        ADDI    #$0003, R1                      ; 57EE   02F9 0003
        MVI@    R1,     R1                      ; 57F0   0289
        SWAP    R1,     1                       ; 57F1   0041
        ANDI    #$00FF, R1                      ; 57F2   03B9 00FF
        SUBI    #$0004, R1                      ; 57F4   0339 0004
        SLR     R1,     2                       ; 57F6   0065
        SLR     R1,     1                       ; 57F7   0061
        MOVR    R1,     R3                      ; 57F8   008B
        SLL     R1,     2                       ; 57F9   004D
        MOVR    R1,     R0                      ; 57FA   0088
        SLL     R1,     2                       ; 57FB   004D
        ADDR    R0,     R1                      ; 57FC   00C1
        ADDR    R2,     R1                      ; 57FD   00D1
        MVII    #$000A, R5                      ; 57FE   02BD 000A
        MOVR    R1,     R0                      ; 5800   0088
L_5801:
        BMI     L_581A                          ; 5801   020B 0017

        CMPI    #$00EF, R0                      ; 5803   0378 00EF
        BGT     L_581A                          ; 5805   020E 0013

        TSTR    R2                              ; 5807   0092
        BMI     L_581A                          ; 5808   020B 0010

        CMPI    #$0014, R2                      ; 580A   037A 0014
        BGE     L_581A                          ; 580C   020D 000C

        ADDI    #$0200, R1                      ; 580E   02F9 0200
        MVI@    R1,     R1                      ; 5810   0289
        TSTR    R1                              ; 5811   0089
        BEQ     L_583D                          ; 5812   0204 0029

        SDBD                                    ; 5814   0001
        CMPI    #$2000, R1                      ; 5815   0379 0000 0020
        BEQ     L_583D                          ; 5818   0204 0023

L_581A:
        DECR    R5                              ; 581A   0015
        BNEQ    L_5821                          ; 581B   020C 0004

        JSR     R5,     X_PLAY_RAZZ2            ; 581D   0004 011C 02BD

        PULR    R7                              ; 5820   02B7

L_5821:
        CMPI    #$0009, R5                      ; 5821   037D 0009
        BNEQ    L_582B                          ; 5823   020C 0006

        SUBI    #$0015, R0                      ; 5825   0338 0015
        DECR    R3                              ; 5827   0013
        DECR    R2                              ; 5828   0012
        B       L_583A                          ; 5829   0200 000F

L_582B:
        INCR    R0                              ; 582B   0008
        INCR    R2                              ; 582C   000A
        CMPI    #$0006, R5                      ; 582D   037D 0006
        BEQ     L_5835                          ; 582F   0204 0004

        CMPI    #$0003, R5                      ; 5831   037D 0003
        BNEQ    L_583A                          ; 5833   020C 0005

L_5835:
        INCR    R3                              ; 5835   000B
        SUBI    #$0003, R2                      ; 5836   033A 0003
        ADDI    #$0011, R0                      ; 5838   02F8 0011
L_583A:
        MOVR    R0,     R1                      ; 583A   0081
        B       L_5801                          ; 583B   0220 003B

L_583D:
        MVII    #$0189, R1                      ; 583D   02B9 0189
        MVI     G_015D, R5                      ; 583F   0285 015D
        TSTR    R5                              ; 5841   00AD
        BEQ     L_5846                          ; 5842   0204 0002

        MVII    #$01A4, R1                      ; 5844   02B9 01A4
L_5846:
        ADDR    R4,     R1                      ; 5846   00E1
        MVO@    R0,     R1                      ; 5847   0248
        INCR    R2                              ; 5848   000A
        SWAP    R2,     1                       ; 5849   0042
        INCR    R3                              ; 584A   000B
        ADDR    R3,     R2                      ; 584B   00DA
        SLL     R2,     2                       ; 584C   004E
        SLL     R2,     1                       ; 584D   004A
        ADDR    R4,     R4                      ; 584E   00E4
        ADDI    #$0192, R4                      ; 584F   02FC 0192
        MVI     G_015D, R3                      ; 5851   0283 015D
        TSTR    R3                              ; 5853   009B
        BEQ     L_5858                          ; 5854   0204 0002

        ADDI    #$001B, R4                      ; 5856   02FC 001B
L_5858:
        MVO@    R2,     R4                      ; 5858   0262
        SWAP    R2,     1                       ; 5859   0042
        MVO@    R2,     R4                      ; 585A   0262
        MVII    #$000B, R0                      ; 585B   02B8 000B

        JSR     R5,     L_5785                  ; 585D   0004 0154 0385

L_5860:
        MVI     G_015D, R1                      ; 5860   0281 015D
        XORI    #$0001, R1                      ; 5862   03F9 0001
        MVII    #$0008, R0                      ; 5864   02B8 0008
        B       L_56CD                          ; 5866   0220 019A

L_5868:
        PSHR    R5                              ; 5868   0275
        PSHR    R0                              ; 5869   0270
        MVII    #$0008, R0                      ; 586A   02B8 0008

L_586C:
        JSR     R5,     L_5C9D                  ; 586C   0004 015C 009D

        DECR    R0                              ; 586F   0010
        BPL     L_586C                          ; 5870   0223 0005

        PULR    R0                              ; 5872   02B0
L_5873:
        PULR    R7                              ; 5873   02B7

L_5874:
        JSR     R5,     .EXEC.7AE               ; 5874   0004 0114 03AE
        JSR     R5,     .EXEC.766               ; 5877   0004 0114 0366
        JSR     R5,     X_POW2                  ; 587A   0004 0114 0345

        COMR    R0                              ; 587D   0018
        AND     G_015F, R0                      ; 587E   0380 015F
        MVO     R0,     G_015F                  ; 5880   0240 015F
        BNEQ    L_59C2                          ; 5882   020C 013E

        MVI     G_015D, R0                      ; 5884   0280 015D
        XORI    #$0001, R0                      ; 5886   03F8 0001
        MVO     R0,     G_015D                  ; 5888   0240 015D
        MVI     G_016A, R0                      ; 588A   0280 016A
        MVI     G_016B, R1                      ; 588C   0281 016B
        MVO     R0,     G_016B                  ; 588E   0240 016B
        MVO     R1,     G_016A                  ; 5890   0241 016A
        CLRR    R0                              ; 5892   01C0
        MVO     R0,     G_0183                  ; 5893   0240 0183
        MVO     R0,     G_0184                  ; 5895   0240 0184
        MVII    #$0179, R5                      ; 5897   02BD 0179
        MVO@    R0,     R5                      ; 5899   0268
        MVO@    R0,     R5                      ; 589A   0268
        MVO@    R0,     R5                      ; 589B   0268
        MVO@    R0,     R5                      ; 589C   0268
        MVII    #$0160, R5                      ; 589D   02BD 0160
        MVO@    R0,     R5                      ; 589F   0268
        MVO@    R0,     R5                      ; 58A0   0268
        MVO@    R0,     R5                      ; 58A1   0268
        MVO@    R0,     R5                      ; 58A2   0268
        MVI@    R5,     R0                      ; 58A3   02A8
        INCR    R0                              ; 58A4   0008
        MVO     R0,     G_0164                  ; 58A5   0240 0164
        CMPI    #$0011, R0                      ; 58A7   0378 0011
        BLT     L_58B6                          ; 58A9   0205 000B

        MVI     G_0166, R1                      ; 58AB   0281 0166
        CMP     G_0165, R1                      ; 58AD   0341 0165
        BGT     L_59C2                          ; 58AF   020E 0111
        BEQ     L_58B6                          ; 58B1   0204 0003

        RRC     R0,     1                       ; 58B3   0070
        BNC     L_59C2                          ; 58B4   0209 010C

L_58B6:
        JSR     R5,     L_5E7F                  ; 58B6   0004 015C 027F
        JSR     R5,     L_5251                  ; 58B9   0004 0150 0251

        CLRR    R0                              ; 58BC   01C0

        JSR     R5,     L_5C7F                  ; 58BD   0004 015C 007F

        MVII    #$00FF, R0                      ; 58C0   02B8 00FF
        MVO     R0,     G_015E                  ; 58C2   0240 015E
        MVII    #$031D, R1                      ; 58C4   02B9 031D
        MVII    #$0002, R4                      ; 58C6   02BC 0002

        JSR     R5,     L_5E66                  ; 58C8   0004 015C 0266

L_58CB:
        MOVR    R1,     R2                      ; 58CB   008A
        SDBD                                    ; 58CC   0001
        MVII    #$679E, R1                      ; 58CD   02B9 009E 0067

        JSR     R5,     X_INIT_MOB              ; 58D0   0004 0114 02B2

        MOVR    R2,     R1                      ; 58D3   0091
        MVI@    R1,     R0                      ; 58D4   0288
        XOR     G_016B, R0                      ; 58D5   03C0 016B
        MVO@    R0,     R1                      ; 58D7   0248
        MOVR    R1,     R5                      ; 58D8   008D
        ADDI    #$0002, R5                      ; 58D9   02FD 0002
        MVII    #$0036, R2                      ; 58DB   02BA 0036
        MVI     G_015D, R3                      ; 58DD   0283 015D
        TSTR    R3                              ; 58DF   009B
        BNEQ    L_58E4                          ; 58E0   020C 0002

        MVII    #$0072, R2                      ; 58E2   02BA 0072
L_58E4:
        SWAP    R2,     1                       ; 58E4   0042
        MVO@    R2,     R5                      ; 58E5   026A
        MVII    #$005D, R2                      ; 58E6   02BA 005D
        SWAP    R2,     1                       ; 58E8   0042
        MVO@    R2,     R5                      ; 58E9   026A
        SDBD                                    ; 58EA   0001
        MVI@    R4,     R2                      ; 58EB   02A2
        MVII    #$0019, R3                      ; 58EC   02BB 0019

        JSR     R5,     L_5F59                  ; 58EE   0004 015C 0359

        ADDI    #$0008, R1                      ; 58F1   02F9 0008
        CMPI    #$035D, R1                      ; 58F3   0379 035D
        BNEQ    L_58CB                          ; 58F5   022C 002B
        PULR    R7                              ; 58F7   02B7

L_58F8:
        PSHR    R0                              ; 58F8   0270

        JSR     R5,     .EXEC.7AE               ; 58F9   0004 0114 03AE

        PULR    R0                              ; 58FC   02B0
        INCR    R0                              ; 58FD   0008

        JSR     R5,     L_5C7F                  ; 58FE   0004 015C 007F

        DECR    R0                              ; 5901   0010

        JSR     R5,     X_POW2                  ; 5902   0004 0114 0345

        COMR    R0                              ; 5905   0018
        AND     G_015E, R0                      ; 5906   0380 015E
        MVO     R0,     G_015E                  ; 5908   0240 015E
        BNEQ    L_59C2                          ; 590A   020C 00B6

        JSR     R5,     L_526C                  ; 590C   0004 0150 026C

        CLRR    R0                              ; 590F   01C0
        MVO     R0,     G_016C                  ; 5910   0240 016C
        B       L_5940                          ; 5912   0200 002C

L_5914:
        NOP                                     ; 5914   0034
        NOP                                     ; 5915   0034
        NOP                                     ; 5916   0034
        NOP                                     ; 5917   0034
        NOP                                     ; 5918   0034
        PSHR    R5                              ; 5919   0275
        MVI     G_016C, R0                      ; 591A   0280 016C
        COMR    R0                              ; 591C   0018
        ANDI    #$00F0, R0                      ; 591D   03B8 00F0
        BNEQ    L_5925                          ; 591F   020C 0004

        XOR     G_0160, R0                      ; 5921   03C0 0160
        BEQ     L_59C2                          ; 5923   0204 009D

L_5925:
        SDBD                                    ; 5925   0001
        MVII    #$5028, R1                      ; 5926   02B9 0028 0050

        JSR     R5,     X_TIMER_STOP            ; 5929   0004 0118 0038

        CLRR    R0                              ; 592C   01C0

        JSR     R5,     L_5C6E                  ; 592D   0004 015C 006E
        JSR     R5,     L_56F0                  ; 5930   0004 0154 02F0
        DECLE   $0280                           ; 5933   0280

        CMPR    R6,     R0                      ; 5934   0170

        JSR     R5,     .EXEC.76C               ; 5935   0004 0114 036C

        MVI@    R1,     R0                      ; 5938   0288
        XOR     G_016B, R0                      ; 5939   03C0 016B
        XORI    #$0010, R0                      ; 593B   03F8 0010
        MVO@    R0,     R1                      ; 593D   0248
        B       L_5944                          ; 593E   0200 0004

L_5940:
        CLRR    R0                              ; 5940   01C0

        JSR     R5,     L_5C6E                  ; 5941   0004 015C 006E

L_5944:
        MVII    #$00C0, R0                      ; 5944   02B8 00C0
        MVO     R0,     G_016D                  ; 5946   0240 016D
        MVII    #$0008, R0                      ; 5948   02B8 0008
        J       L_56D5                          ; 594A   0004 0354 02D5

        NOP                                     ; 594D   0034
        NOP                                     ; 594E   0034
        NOP                                     ; 594F   0034
        NOP                                     ; 5950   0034
        NOP                                     ; 5951   0034
        PSHR    R5                              ; 5952   0275
        MVI     G_015F, R4                      ; 5953   0284 015F
        TSTR    R4                              ; 5955   00A4
        BNEQ    L_5874                          ; 5956   022C 00E3

        XOR     G_015E, R4                      ; 5958   03C4 015E
        BNEQ    L_58F8                          ; 595A   022C 0063

        MVI     G_01CF, R3                      ; 595C   0283 01CF
        MOVR    R3,     R5                      ; 595E   009D
        ANDI    #$00A0, R5                      ; 595F   03BD 00A0
        BNEQ    L_596C                          ; 5961   020C 0009

        ANDI    #$0040, R3                      ; 5963   03BB 0040
        BEQ     L_5983                          ; 5965   0204 001C

        MVI     G_015D, R3                      ; 5967   0283 015D
        TSTR    R3                              ; 5969   009B
        BEQ     L_5983                          ; 596A   0204 0017

L_596C:
        MVI     G_016D, R4                      ; 596C   0284 016D
        MOVR    R4,     R5                      ; 596E   00A5
        ANDI    #$0020, R5                      ; 596F   03BD 0020
        BNEQ    L_5983                          ; 5971   020C 0010

        ANDI    #$000F, R4                      ; 5973   03BC 000F
        ADDI    #$0170, R4                      ; 5975   02FC 0170
        MVI@    R4,     R2                      ; 5977   02A2
        ANDI    #$0003, R2                      ; 5978   03BA 0003
        CMPR    R0,     R2                      ; 597A   0142
        BNEQ    L_5983                          ; 597B   020C 0006

        MOVR    R1,     R2                      ; 597D   008A
        ADDI    #$0003, R2                      ; 597E   02FA 0003
        J       L_D20C                          ; 5980   0004 03D0 020C

L_5983:
        CMPI    #$0004, R0                      ; 5983   0378 0004
        BLT     L_598A                          ; 5985   0205 0003
        J       L_69AD                          ; 5987   0004 0368 01AD

L_598A:
        MVII    #$0170, R4                      ; 598A   02BC 0170
        CLRR    R1                              ; 598C   01C9
        DECR    R1                              ; 598D   0011
L_598E:
        INCR    R1                              ; 598E   0009
        CMP@    R4,     R0                      ; 598F   0360
        BNEQ    L_598E                          ; 5990   022C 0003

        MVI     G_016D, R3                      ; 5992   0283 016D
        MOVR    R3,     R5                      ; 5994   009D
        ANDI    #$0020, R3                      ; 5995   03BB 0020
        BEQ     L_59C3                          ; 5997   0204 002A

        ANDI    #$000F, R5                      ; 5999   03BD 000F
        CMPR    R5,     R1                      ; 599B   0169
        BNEQ    L_59C3                          ; 599C   020C 0025

        XOR     G_016D, R3                      ; 599E   03C3 016D
        XORI    #$0080, R3                      ; 59A0   03FB 0080
        MVO     R3,     G_016D                  ; 59A2   0243 016D
        SDBD                                    ; 59A4   0001
        MVII    #$5BA9, R4                      ; 59A5   02BC 00A9 005B
        PSHR    R4                              ; 59A8   0274
L_59A9:
        CMP@    R4,     R1                      ; 59A9   0361
        BNEQ    L_59A9                          ; 59AA   022C 0002

        SUB@    R6,     R4                      ; 59AC   0334
        DECR    R4                              ; 59AD   0014
        ADDR    R4,     R4                      ; 59AE   00E4
        SDBD                                    ; 59AF   0001
        ADDI    #$6743, R4                      ; 59B0   02FC 0043 0067

        JSR     R5,     .EXEC.76C               ; 59B3   0004 0114 036C

        ADDI    #$0003, R1                      ; 59B6   02F9 0003
        MVI@    R4,     R2                      ; 59B8   02A2
        SWAP    R2,     1                       ; 59B9   0042
        MVO@    R2,     R1                      ; 59BA   024A
        DECR    R1                              ; 59BB   0011
        MVI@    R4,     R2                      ; 59BC   02A2
        SWAP    R2,     1                       ; 59BD   0042
        ADDI    #$0002, R1                      ; 59BE   02F9 0002
        CLRR    R2                              ; 59C0   01D2
        MVO@    R2,     R1                      ; 59C1   024A
L_59C2:
        PULR    R7                              ; 59C2   02B7

L_59C3:
        DECR    R4                              ; 59C3   0014
        CLRR    R3                              ; 59C4   01DB
        MVO@    R3,     R4                      ; 59C5   0263

        JSR     R5,     L_521C                  ; 59C6   0004 0150 021C

        MOVR    R1,     R0                      ; 59C9   0088
        J       L_5C80                          ; 59CA   0004 035C 0080

        NOP                                     ; 59CD   0034
        NOP                                     ; 59CE   0034
        NOP                                     ; 59CF   0034
        NOP                                     ; 59D0   0034
        NOP                                     ; 59D1   0034
        PSHR    R5                              ; 59D2   0275
        MOVR    R1,     R2                      ; 59D3   008A
        SDBD                                    ; 59D4   0001
        MVII    #$6820, R1                      ; 59D5   02B9 0020 0068

        JSR     R5,     X_INIT_MOB              ; 59D8   0004 0114 02B2

L_59DB:
        MVI     G_031E, R0                      ; 59DB   0280 031E
        TSTR    R0                              ; 59DD   0080
        BEQ     L_59EB                          ; 59DE   0204 000B

        JSR     R5,     .EXEC.A61               ; 59E0   0004 0118 0261
        DECLE   $0001                           ; 59E3   0001

        NOP                                     ; 59E4   0034
        NOP                                     ; 59E5   0034
        NOP                                     ; 59E6   0034
        NOP                                     ; 59E7   0034
        NOP                                     ; 59E8   0034
        B       L_59DB                          ; 59E9   0220 000F

L_59EB:
        MVI     G_0177, R0                      ; 59EB   0280 0177

        JSR     R5,     .EXEC.76C               ; 59ED   0004 0114 036C

        MVI@    R1,     R0                      ; 59F0   0288
        XORI    #$0010, R0                      ; 59F1   03F8 0010
        XOR     G_016B, R0                      ; 59F3   03C0 016B
        MVO@    R0,     R1                      ; 59F5   0248
        INCR    R1                              ; 59F6   0009
        SDBD                                    ; 59F7   0001
        MVII    #$683A, R0                      ; 59F8   02B8 003A 0068
        MVO@    R0,     R1                      ; 59FB   0248

L_59FC:
        JSR     R5,     .EXEC.A61               ; 59FC   0004 0118 0261
        DECLE   $0001                           ; 59FF   0001

        NOP                                     ; 5A00   0034
        NOP                                     ; 5A01   0034
        NOP                                     ; 5A02   0034
        NOP                                     ; 5A03   0034
        NOP                                     ; 5A04   0034
        MVI     G_0170, R0                      ; 5A05   0280 0170
        TSTR    R0                              ; 5A07   0080
        BNEQ    L_59FC                          ; 5A08   022C 000D

        JSR     R5,     L_5A17                  ; 5A0A   0004 0158 0217
        DECLE   $00E0,  $005A,  $00A5,  $0056   ; 5A0D   00E0 005A 00A5 0056
        DECLE   $0000,  $00D0,  $0000,  $00D0   ; 5A11   0000 00D0 0000 00D0
        DECLE   $0000                           ; 5A15   0000

        ADDR    R2,     R0                      ; 5A16   00D0
L_5A17:
        MVO     R5,     G_035D                  ; 5A17   0245 035D
        PULR    R7                              ; 5A19   02B7

L_5A1A:
        PSHR    R5                              ; 5A1A   0275
        MVI     G_0181, R0                      ; 5A1B   0280 0181
        TSTR    R0                              ; 5A1D   0080
        BEQ     L_5ACF                          ; 5A1E   0204 00AF

        JSR     R5,     L_521C                  ; 5A20   0004 0150 021C

        CLRR    R0                              ; 5A23   01C0
        MVO     R0,     G_0181                  ; 5A24   0240 0181
        PULR    R7                              ; 5A26   02B7

        NOP                                     ; 5A27   0034
        NOP                                     ; 5A28   0034
        NOP                                     ; 5A29   0034
        NOP                                     ; 5A2A   0034
        NOP                                     ; 5A2B   0034
        PSHR    R5                              ; 5A2C   0275
        MVI     G_0181, R0                      ; 5A2D   0280 0181
        TSTR    R0                              ; 5A2F   0080
        BEQ     L_5A45                          ; 5A30   0204 0013

        MVI     G_01CF, R5                      ; 5A32   0285 01CF
        ANDI    #$0010, R5                      ; 5A34   03BD 0010
        BNEQ    L_5A42                          ; 5A36   020C 000A

        MVII    #$01CA, R5                      ; 5A38   02BD 01CA
        SDBD                                    ; 5A3A   0001
        MVI@    R5,     R2                      ; 5A3B   02AA
        SDBD                                    ; 5A3C   0001
        CMPI    #$0700, R2                      ; 5A3D   037A 0000 0007
        BC      L_5ACF                          ; 5A40   0201 008D

L_5A42:
        JSR     R5,     L_5A1A                  ; 5A42   0004 0158 021A

L_5A45:
        PSHR    R1                              ; 5A45   0271
        MVI     G_01BF, R1                      ; 5A46   0281 01BF
        ANDI    #$00F7, R1                      ; 5A48   03B9 00F7
        MVO     R1,     G_01BF                  ; 5A4A   0241 01BF
        PULR    R1                              ; 5A4C   02B1
        MVI     G_016D, R2                      ; 5A4D   0282 016D
        SWAP    R2,     1                       ; 5A4F   0042
        SLLC    R2,     2                       ; 5A50   005E
        SLR     R2,     2                       ; 5A51   0066
        SWAP    R2,     1                       ; 5A52   0042
        BNC     L_5ACF                          ; 5A53   0209 007A
        BOV     L_5ACF                          ; 5A55   0202 0078

        MOVR    R2,     R0                      ; 5A57   0090
        ADDI    #$0170, R2                      ; 5A58   02FA 0170
        CMP@    R2,     R3                      ; 5A5A   0353
        BNEQ    L_5ACF                          ; 5A5B   020C 0072

        MVI     G_016D, R0                      ; 5A5D   0280 016D
        XORI    #$0040, R0                      ; 5A5F   03F8 0040
        MVO     R0,     G_016D                  ; 5A61   0240 016D

        JSR     R5,     .EXEC.7AE               ; 5A63   0004 0114 03AE

        CLRR    R0                              ; 5A66   01C0
        MVO     R0,     G_01D8                  ; 5A67   0240 01D8
        MOVR    R3,     R0                      ; 5A69   0098

        JSR     R5,     .EXEC.76C               ; 5A6A   0004 0114 036C

        MVI@    R1,     R0                      ; 5A6D   0288
        XORI    #$0010, R0                      ; 5A6E   03F8 0010
        XOR     G_016B, R0                      ; 5A70   03C0 016B
        MVO@    R0,     R1                      ; 5A72   0248
        CLRR    R0                              ; 5A73   01C0
        MVO     R0,     G_0182                  ; 5A74   0240 0182

L_5A76:
        JSR     R5,     L_D157                  ; 5A76   0004 01D0 0157

        MVI     G_01D2, R0                      ; 5A79   0280 01D2
        MVO     R0,     G_01D1                  ; 5A7B   0240 01D1
        MVI     G_01CF, R0                      ; 5A7D   0280 01CF
        ANDI    #$0010, R0                      ; 5A7F   03B8 0010
        BNEQ    L_5A93                          ; 5A81   020C 0010

        MVI     G_01CE, R0                      ; 5A83   0280 01CE
        TSTR    R0                              ; 5A85   0080
        BEQ     L_5ACF                          ; 5A86   0204 0047

        MVO     R0,     G_01D6                  ; 5A88   0240 01D6

        JSR     R5,     .EXEC.76C               ; 5A8A   0004 0114 036C
        JSR     R5,     L_6DF9                  ; 5A8D   0004 016C 01F9

        J       L_6BCC                          ; 5A90   0004 0368 03CC

L_5A93:
        CLRR    R5                              ; 5A93   01ED
        MVO     R5,     G_01CE                  ; 5A94   0245 01CE
        PULR    R7                              ; 5A96   02B7

        NOP                                     ; 5A97   0034
        NOP                                     ; 5A98   0034
        NOP                                     ; 5A99   0034
        NOP                                     ; 5A9A   0034
        NOP                                     ; 5A9B   0034
        PSHR    R5                              ; 5A9C   0275

        JSR     R5,     L_5A1A                  ; 5A9D   0004 0158 021A

        SDBD                                    ; 5AA0   0001
        MVII    #$502C, R1                      ; 5AA1   02B9 002C 0050

        JSR     R5,     .EXEC.81E               ; 5AA4   0004 0118 001E

        MVII    #$031D, R1                      ; 5AA7   02B9 031D

        JSR     R5,     .EXEC.7AE               ; 5AA9   0004 0114 03AE

        MVI     G_016D, R0                      ; 5AAC   0280 016D
        ANDI    #$00BF, R0                      ; 5AAE   03B8 00BF
        XORI    #$0040, R0                      ; 5AB0   03F8 0040
        MVO     R0,     G_016D                  ; 5AB2   0240 016D
        B       L_5A76                          ; 5AB4   0220 003F

        NOP                                     ; 5AB6   0034
        NOP                                     ; 5AB7   0034
        NOP                                     ; 5AB8   0034
        NOP                                     ; 5AB9   0034
        NOP                                     ; 5ABA   0034
        PSHR    R5                              ; 5ABB   0275
        PSHR    R1                              ; 5ABC   0271
        MVI     G_01BF, R1                      ; 5ABD   0281 01BF
        ANDI    #$00F7, R1                      ; 5ABF   03B9 00F7
        MVO     R1,     G_01BF                  ; 5AC1   0241 01BF
        PULR    R1                              ; 5AC3   02B1
        MVII    #$031F, R4                      ; 5AC4   02BC 031F
        SDBD                                    ; 5AC6   0001
        MVII    #$5437, R0                      ; 5AC7   02B8 0037 0054
        MVO@    R0,     R4                      ; 5ACA   0260
        SWAP    R0,     1                       ; 5ACB   0040
        MVO@    R0,     R4                      ; 5ACC   0260
        CLRR    R0                              ; 5ACD   01C0
        MVO@    R0,     R4                      ; 5ACE   0260
L_5ACF:
        PULR    R7                              ; 5ACF   02B7

        DECLE   $0019,  $0015,  $000F,  $0009   ; 5AD0   0019 0015 000F 0009
        DECLE   $0001,  $01F9,  $01F3,  $01ED   ; 5AD4   0001 01F9 01F3 01ED
        DECLE   $01E9,  $01EE,  $01F4,  $01FA   ; 5AD8   01E9 01EE 01F4 01FA
        DECLE   $0000                           ; 5ADC   0000

        CLRC                                    ; 5ADD   0006
        INCR    R4                              ; 5ADE   000C
        DECR    R2                              ; 5ADF   0012
        NOP                                     ; 5AE0   0034
        NOP                                     ; 5AE1   0034
        NOP                                     ; 5AE2   0034
        NOP                                     ; 5AE3   0034
        NOP                                     ; 5AE4   0034
        PSHR    R5                              ; 5AE5   0275

        JSR     R5,     L_5B3D                  ; 5AE6   0004 0158 033D

        BEQ     L_5AF2                          ; 5AE9   0204 0007
        BPL     L_5ACF                          ; 5AEB   0223 001D

        TSTR    R5                              ; 5AED   00AD
        BNEQ    L_5ACF                          ; 5AEE   022C 0020
        INCR    R7                              ; 5AF0   000F

        PSHR    R5                              ; 5AF1   0275
L_5AF2:
        CMP     G_015D, R1                      ; 5AF2   0341 015D
        BEQ     L_5ACF                          ; 5AF4   0224 0026

        TSTR    R0                              ; 5AF6   0080
        BMI     L_5ACF                          ; 5AF7   022B 0029

L_5AF9:
        JSR     R5,     L_5B3D                  ; 5AF9   0004 0158 033D

        BEQ     L_5B06                          ; 5AFC   0204 0008
        BPL     L_5B03                          ; 5AFE   0203 0003

        TSTR    R5                              ; 5B00   00AD
        BNEQ    L_5B06                          ; 5B01   020C 0003

L_5B03:
        JSR     R5,     L_5625                  ; 5B03   0004 0154 0225

L_5B06:
        PSHR    R0                              ; 5B06   0270
        SDBD                                    ; 5B07   0001
        MVII    #$502C, R1                      ; 5B08   02B9 002C 0050

        JSR     R5,     X_TIMER_STOP            ; 5B0B   0004 0118 0038

        PULR    R0                              ; 5B0E   02B0
        MOVR    R0,     R1                      ; 5B0F   0081
        ADDR    R7,     R1                      ; 5B10   00F9
        SUBI    #$0041, R1                      ; 5B11   0339 0041
        MVI@    R1,     R0                      ; 5B13   0288
        MVII    #$0025, R1                      ; 5B14   02B9 0025
        SARC    R0,     1                       ; 5B16   0078
        BNC     L_5B1B                          ; 5B17   0209 0002

        MVII    #$0038, R1                      ; 5B19   02B9 0038
L_5B1B:
        SWAP    R0,     1                       ; 5B1B   0040
        XORR    R1,     R0                      ; 5B1C   01C8
        MVO     R0,     G_031D                  ; 5B1D   0240 031D

        JSR     R5,     L_5B2C                  ; 5B1F   0004 0158 032C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B22   0000 0000 0000 0000

        ADDR    R1,     R7                      ; 5B26   00CF

        SLLC    R3,     2                       ; 5B27   005F
        ADDR    R3,     R7                      ; 5B28   00DF

        SLLC    R3,     2                       ; 5B29   005F
        TSTR    R6                              ; 5B2A   00B6
        SLLC    R3,     2                       ; 5B2B   005F
L_5B2C:
        MVO     R5,     G_035D                  ; 5B2C   0245 035D
        MVI     G_0177, R0                      ; 5B2E   0280 0177

        JSR     R5,     .EXEC.76C               ; 5B30   0004 0114 036C

        ADDI    #$0005, R1                      ; 5B33   02F9 0005
        MVII    #$0200, R0                      ; 5B35   02B8 0200
        MVO@    R0,     R1                      ; 5B37   0248
        INCR    R1                              ; 5B38   0009
        MVII    #$0010, R0                      ; 5B39   02B8 0010
        MVO@    R0,     R1                      ; 5B3B   0248
        PULR    R7                              ; 5B3C   02B7

L_5B3D:
        PSHR    R5                              ; 5B3D   0275
        MVI     G_01CF, R5                      ; 5B3E   0285 01CF
        ANDI    #$0080, R5                      ; 5B40   03BD 0080
        BNEQ    L_5ACF                          ; 5B42   022C 0074

        MVI     G_01CF, R5                      ; 5B44   0285 01CF
        ANDI    #$0040, R5                      ; 5B46   03BD 0040
        BEQ     L_5ACF                          ; 5B48   0224 007A

        NEGR    R5                              ; 5B4A   0025
        MVI     G_015D, R5                      ; 5B4B   0285 015D
        PULR    R7                              ; 5B4D   02B7

        NOP                                     ; 5B4E   0034
        NOP                                     ; 5B4F   0034
        NOP                                     ; 5B50   0034
        NOP                                     ; 5B51   0034
        NOP                                     ; 5B52   0034
        PSHR    R5                              ; 5B53   0275
        MOVR    R1,     R2                      ; 5B54   008A
        SDBD                                    ; 5B55   0001
        MVII    #$679E, R1                      ; 5B56   02B9 009E 0067

        JSR     R5,     X_INIT_MOB              ; 5B59   0004 0114 02B2

        MVI@    R2,     R5                      ; 5B5C   0295
        XOR     G_016B, R5                      ; 5B5D   03C5 016B
        MVO@    R5,     R2                      ; 5B5F   0255
        MOVR    R2,     R1                      ; 5B60   0091
        MVII    #$0054, R0                      ; 5B61   02B8 0054
        SWAP    R0,     1                       ; 5B63   0040
        ADDI    #$0002, R2                      ; 5B64   02FA 0002
        MVO@    R0,     R2                      ; 5B66   0250
        MVII    #$0037, R0                      ; 5B67   02B8 0037
        SWAP    R0,     1                       ; 5B69   0040
        INCR    R2                              ; 5B6A   000A
        MVO@    R0,     R2                      ; 5B6B   0250
        MVII    #$000E, R4                      ; 5B6C   02BC 000E

        JSR     R5,     L_5E66                  ; 5B6E   0004 015C 0266

        SDBD                                    ; 5B71   0001
        MVI@    R4,     R2                      ; 5B72   02A2
        MVII    #$0017, R3                      ; 5B73   02BB 0017

        JSR     R5,     L_5F59                  ; 5B75   0004 015C 0359

        CLRR    R0                              ; 5B78   01C0
        MVO     R0,     G_016D                  ; 5B79   0240 016D
        SDBD                                    ; 5B7B   0001
        MVII    #$6768, R1                      ; 5B7C   02B9 0068 0067
        MVII    #$031D, R2                      ; 5B7F   02BA 031D
        MVI@    R2,     R3                      ; 5B81   0293

        JSR     R5,     X_INIT_MOB              ; 5B82   0004 0114 02B2

        MVO     R3,     G_0321                  ; 5B85   0243 0321
        MVII    #$0054, R2                      ; 5B87   02BA 0054
        SWAP    R2,     1                       ; 5B89   0042
        MVO     R2,     G_031F                  ; 5B8A   0242 031F
        MVII    #$0037, R2                      ; 5B8C   02BA 0037
        SWAP    R2,     1                       ; 5B8E   0042
        MVO     R2,     G_0320                  ; 5B8F   0242 0320

        JSR     R5,     L_D184                  ; 5B91   0004 01D0 0184
L_5B94:
        JSR     R5,     .EXEC.A61               ; 5B94   0004 0118 0261
        DECLE   $0001                           ; 5B97   0001

        NOP                                     ; 5B98   0034
        NOP                                     ; 5B99   0034
        NOP                                     ; 5B9A   0034
        NOP                                     ; 5B9B   0034
        NOP                                     ; 5B9C   0034
        MVI     G_0320, R0                      ; 5B9D   0280 0320
        SWAP    R0,     1                       ; 5B9F   0040
        ANDI    #$00FF, R0                      ; 5BA0   03B8 00FF
        CMPI    #$0056, R0                      ; 5BA2   0378 0056
        BLT     L_5B94                          ; 5BA4   0225 0011
        J       L_600F                          ; 5BA6   0004 0360 000F

        DECLE   $0008,  $0005,  $0006,  $0000   ; 5BA9   0008 0005 0006 0000

        SETC                                    ; 5BAD   0007
L_5BAE:
        PSHR    R5                              ; 5BAE   0275
        MOVR    R0,     R3                      ; 5BAF   0083
        MOVR    R1,     R4                      ; 5BB0   008C
        SDBD                                    ; 5BB1   0001
        MVII    #$6768, R1                      ; 5BB2   02B9 0068 0067
        MVII    #$031D, R2                      ; 5BB5   02BA 031D

        JSR     R5,     X_INIT_MOB              ; 5BB7   0004 0114 02B2

        MOVR    R4,     R1                      ; 5BBA   00A1
        ADDI    #$0170, R1                      ; 5BBB   02F9 0170
        MVI@    R1,     R0                      ; 5BBD   0288

        JSR     R5,     .EXEC.76C               ; 5BBE   0004 0114 036C

        MVI@    R1,     R0                      ; 5BC1   0288
        XORI    #$0010, R0                      ; 5BC2   03F8 0010
        XOR     G_016B, R0                      ; 5BC4   03C0 016B
        MVO@    R0,     R1                      ; 5BC6   0248
        ADDI    #$0002, R1                      ; 5BC7   02F9 0002
        MVII    #$031E, R5                      ; 5BC9   02BD 031E
        MVI@    R5,     R0                      ; 5BCB   02A8
        ADDI    #$000D, R0                      ; 5BCC   02F8 000D
        DECR    R5                              ; 5BCE   0015
        MVO@    R0,     R5                      ; 5BCF   0268
        MVI@    R1,     R0                      ; 5BD0   0288
        MVO@    R0,     R5                      ; 5BD1   0268
        INCR    R1                              ; 5BD2   0009
        MVI@    R1,     R0                      ; 5BD3   0288
        MVO@    R0,     R5                      ; 5BD4   0268
        PSHR    R4                              ; 5BD5   0274
        MOVR    R3,     R4                      ; 5BD6   009C
        ADDR    R4,     R4                      ; 5BD7   00E4

        JSR     R5,     L_5E66                  ; 5BD8   0004 015C 0266

        SDBD                                    ; 5BDB   0001
        MVI@    R4,     R2                      ; 5BDC   02A2
        PULR    R4                              ; 5BDD   02B4
        MOVR    R7,     R5                      ; 5BDE   00BD
        SUBI    #$0036, R5                      ; 5BDF   033D 0036
L_5BE1:
        CMP@    R5,     R3                      ; 5BE1   036B
        BEQ     L_5BEC                          ; 5BE2   0204 0008

        SDBD                                    ; 5BE4   0001
        CMPI    #$5BAE, R5                      ; 5BE5   037D 00AE 005B
        BNEQ    L_5BE1                          ; 5BE8   022C 0008
        B       L_5C12                          ; 5BEA   0200 0026

L_5BEC:
        SUBR    R7,     R5                      ; 5BEC   013D
        ADDI    #$0043, R5                      ; 5BED   02FD 0043
        ADDR    R5,     R5                      ; 5BEF   00ED
        SDBD                                    ; 5BF0   0001
        ADDI    #$6743, R5                      ; 5BF1   02FD 0043 0067
        SDBD                                    ; 5BF4   0001
        MVI@    R5,     R2                      ; 5BF5   02AA
        PSHR    R2                              ; 5BF6   0272
        PSHR    R3                              ; 5BF7   0273
        ADDI    #$0170, R3                      ; 5BF8   02FB 0170
        MVI@    R3,     R0                      ; 5BFA   0298
        MVII    #$002D, R3                      ; 5BFB   02BB 002D

        JSR     R5,     L_5F54                  ; 5BFD   0004 015C 0354

        ADDI    #$0006, R1                      ; 5C00   02F9 0006
        MVI@    R1,     R3                      ; 5C02   028B
        TSTR    R3                              ; 5C03   009B
        BNEQ    L_5C08                          ; 5C04   020C 0002

        INCR    R3                              ; 5C06   000B
        MVO@    R3,     R1                      ; 5C07   024B
L_5C08:
        MVI     G_016D, R0                      ; 5C08   0280 016D
        ANDI    #$005F, R0                      ; 5C0A   03B8 005F
        XORI    #$0020, R0                      ; 5C0C   03F8 0020
        MVO     R0,     G_016D                  ; 5C0E   0240 016D
        PULR    R3                              ; 5C10   02B3
        PULR    R2                              ; 5C11   02B2
L_5C12:
        CLRR    R0                              ; 5C12   01C0
        PSHR    R3                              ; 5C13   0273
        CMPI    #$0005, R3                      ; 5C14   037B 0005
        BEQ     L_5C23                          ; 5C16   0204 000B

        MVI     G_0320, R3                      ; 5C18   0283 0320
        SWAP    R3,     1                       ; 5C1A   0043
        ANDI    #$00FF, R3                      ; 5C1B   03BB 00FF
        CMPI    #$001C, R3                      ; 5C1D   037B 001C
        MVII    #$002D, R3                      ; 5C1F   02BB 002D
        BGT     L_5C25                          ; 5C21   020E 0002

L_5C23:
        MVII    #$0021, R3                      ; 5C23   02BB 0021

L_5C25:
        JSR     R5,     L_5F54                  ; 5C25   0004 015C 0354

        PULR    R3                              ; 5C28   02B3
        CMPI    #$0007, R3                      ; 5C29   037B 0007
        BNEQ    L_5C6B                          ; 5C2B   020C 003E

        MVI     G_0186, R0                      ; 5C2D   0280 0186
        TSTR    R0                              ; 5C2F   0080
        BNEQ    L_5C6B                          ; 5C30   020C 0039

        MVI     G_016C, R0                      ; 5C32   0280 016C
        COMR    R0                              ; 5C34   0018
        ANDI    #$00F0, R0                      ; 5C35   03B8 00F0
        BNEQ    L_5C3D                          ; 5C37   020C 0004

        XOR     G_0160, R0                      ; 5C39   03C0 0160
        BEQ     L_5C6B                          ; 5C3B   0204 002E

L_5C3D:
        MVO     R3,     G_016D                  ; 5C3D   0243 016D
        MVI     G_0177, R0                      ; 5C3F   0280 0177

        JSR     R5,     .EXEC.76C               ; 5C41   0004 0114 036C

        INCR    R1                              ; 5C44   0009
        SDBD                                    ; 5C45   0001
        MVII    #$6810, R0                      ; 5C46   02B8 0010 0068
        MVO@    R0,     R1                      ; 5C49   0248
        INCR    R1                              ; 5C4A   0009
        MVI@    R1,     R0                      ; 5C4B   0288
        SWAP    R0,     1                       ; 5C4C   0040
        ANDI    #$00FF, R0                      ; 5C4D   03B8 00FF
        SUBI    #$0002, R1                      ; 5C4F   0339 0002
        MVII    #$0200, R2                      ; 5C51   02BA 0200
        COMR    R2                              ; 5C53   001A
        AND@    R1,     R2                      ; 5C54   038A
        CMPI    #$0054, R0                      ; 5C55   0378 0054
        BLT     L_5C5B                          ; 5C57   0205 0002

        XORI    #$0200, R2                      ; 5C59   03FA 0200
L_5C5B:
        MVO@    R2,     R1                      ; 5C5B   024A
        SDBD                                    ; 5C5C   0001
        MVII    #$6790, R0                      ; 5C5D   02B8 0090 0067
        MVO     R0,     G_031E                  ; 5C60   0240 031E
        SDBD                                    ; 5C62   0001
        MVII    #$1906, R0                      ; 5C63   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5C66   0240 035D

        JSR     R5,     L_62E6                  ; 5C68   0004 0160 02E6

L_5C6B:
        MOVR    R3,     R0                      ; 5C6B   0098
        MOVR    R4,     R1                      ; 5C6C   00A1
        PULR    R7                              ; 5C6D   02B7

L_5C6E:
        PSHR    R5                              ; 5C6E   0275
        MOVR    R0,     R1                      ; 5C6F   0081
        ADDI    #$0170, R1                      ; 5C70   02F9 0170
        MVI@    R1,     R2                      ; 5C72   028A
        TSTR    R2                              ; 5C73   0092
        SETC                                    ; 5C74   0007
        BNEQ    L_5ACF                          ; 5C75   022C 01A7

        JSR     R5,     L_5C9D                  ; 5C77   0004 015C 009D
        JSR     R5,     L_5CBA                  ; 5C7A   0004 015C 00BA

        CLRC                                    ; 5C7D   0006
        PULR    R7                              ; 5C7E   02B7

L_5C7F:
        PSHR    R5                              ; 5C7F   0275

L_5C80:
        JSR     R5,     .EXEC.7C1               ; 5C80   0004 0114 03C1

        SDBD                                    ; 5C83   0001
        MVII    #$0800, R3                      ; 5C84   02BB 0000 0008
        XOR     G_016B, R3                      ; 5C87   03C3 016B

        JSR     R5,     L_529B                  ; 5C89   0004 0150 029B

        ADDR    R0,     R2                      ; 5C8C   00C2
        MVI@    R2,     R2                      ; 5C8D   0292
        ADDI    #$0200, R2                      ; 5C8E   02FA 0200
        MVI@    R2,     R1                      ; 5C90   0291
        TSTR    R1                              ; 5C91   0089
        BEQ     L_5C9A                          ; 5C92   0204 0006

        SDBD                                    ; 5C94   0001
        CMPI    #$2000, R1                      ; 5C95   0379 0000 0020
        BNEQ    L_5C9C                          ; 5C98   020C 0002

L_5C9A:
        XORR    R3,     R1                      ; 5C9A   01D9
        MVO@    R1,     R2                      ; 5C9B   0251
L_5C9C:
        PULR    R7                              ; 5C9C   02B7

L_5C9D:
        PSHR    R5                              ; 5C9D   0275

        JSR     R5,     .EXEC.7C1               ; 5C9E   0004 0114 03C1
        JSR     R5,     L_529B                  ; 5CA1   0004 0150 029B
        DECLE   $00C2,  $0292,  $02FA,  $0200   ; 5CA4   00C2 0292 02FA 0200
        DECLE   $0291,  $0001,  $03B9,  $00F8   ; 5CA8   0291 0001 03B9 00F8
        DECLE   $000F,  $0001                   ; 5CAC   000F 0001

        CMPI    #$0000, R1                      ; 5CAE   0379 0000
        INCR    R0                              ; 5CB0   0008
        BNEQ    L_5ACF                          ; 5CB1   022C 01E3

        MVI@    R2,     R1                      ; 5CB3   0291
        SDBD                                    ; 5CB4   0001
        ANDI    #$2000, R1                      ; 5CB5   03B9 0000 0020
        MVO@    R1,     R2                      ; 5CB8   0251
        PULR    R7                              ; 5CB9   02B7

L_5CBA:
        PSHR    R5                              ; 5CBA   0275
        MOVR    R0,     R3                      ; 5CBB   0083

        JSR     R5,     L_51D4                  ; 5CBC   0004 0150 01D4

        INCR    R7                              ; 5CBF   000F

L_5CC0:
        PSHR    R5                              ; 5CC0   0275

L_5CC1:
        JSR     R5,     .EXEC.76C               ; 5CC1   0004 0114 036C

        MOVR    R3,     R2                      ; 5CC4   009A
        ADDI    #$0170, R2                      ; 5CC5   02FA 0170
        MVO@    R0,     R2                      ; 5CC7   0250
        MOVR    R1,     R2                      ; 5CC8   008A
        SDBD                                    ; 5CC9   0001
        MVII    #$679E, R1                      ; 5CCA   02B9 009E 0067

        JSR     R5,     X_INIT_MOB              ; 5CCD   0004 0114 02B2

        MVI@    R2,     R5                      ; 5CD0   0295
        XOR     G_016B, R5                      ; 5CD1   03C5 016B
        MVO@    R5,     R2                      ; 5CD3   0255
        MOVR    R2,     R5                      ; 5CD4   0095
        MOVR    R3,     R0                      ; 5CD5   0098
        ADDR    R3,     R3                      ; 5CD6   00DB
        MVI     G_01BF, R1                      ; 5CD7   0281 01BF
        ANDI    #$0001, R1                      ; 5CD9   03B9 0001
        BEQ     L_5CEA                          ; 5CDB   0204 000D

        MVI     G_015D, R1                      ; 5CDD   0281 015D
        TSTR    R1                              ; 5CDF   0089
        BNEQ    L_5CE6                          ; 5CE0   020C 0004

        ADDI    #$0192, R3                      ; 5CE2   02FB 0192
        B       L_5CEE                          ; 5CE4   0200 0008

L_5CE6:
        ADDI    #$01AD, R3                      ; 5CE6   02FB 01AD
        B       L_5CEE                          ; 5CE8   0200 0004

L_5CEA:
        SDBD                                    ; 5CEA   0001
        ADDI    #$6756, R3                      ; 5CEB   02FB 0056 0067
L_5CEE:
        MVI@    R3,     R1                      ; 5CEE   0299
        SWAP    R1,     1                       ; 5CEF   0041
        INCR    R3                              ; 5CF0   000B
        MVI@    R3,     R3                      ; 5CF1   029B
        SWAP    R3,     1                       ; 5CF2   0043
        ADDI    #$0002, R2                      ; 5CF3   02FA 0002
        MVO@    R3,     R2                      ; 5CF5   0253
        INCR    R2                              ; 5CF6   000A
        MVO@    R1,     R2                      ; 5CF7   0251
        PULR    R7                              ; 5CF8   02B7

L_5CF9:
        PSHR    R5                              ; 5CF9   0275
        MVII    #$0200, R4                      ; 5CFA   02BC 0200
        MVII    #$00F0, R0                      ; 5CFC   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5CFE   0004 0114 0338

        SDBD                                    ; 5D01   0001
        MVII    #$5DE3, R4                      ; 5D02   02BC 00E3 005D
        MVII    #$003C, R2                      ; 5D05   02BA 003C
L_5D07:
        INCR    R5                              ; 5D07   000D
        CMPI    #$0047, R5                      ; 5D08   037D 0047
        BEQ     L_5D79                          ; 5D0A   0204 006D

        SDBD                                    ; 5D0C   0001
        CMPI    #$000A, R5                      ; 5D0D   037D 000A 0000
        BLT     L_5D67                          ; 5D10   0205 0055

        MVI@    R4,     R0                      ; 5D12   02A0
        SLL     R0,     1                       ; 5D13   0048
        MVI@    R4,     R1                      ; 5D14   02A1
        SARC    R1,     1                       ; 5D15   0079
        BNC     L_5D1A                          ; 5D16   0209 0002

        XORI    #$0001, R0                      ; 5D18   03F8 0001
L_5D1A:
        SARC    R1,     1                       ; 5D1A   0079
        BNC     L_5D1F                          ; 5D1B   0209 0002

        ADDI    #$0014, R2                      ; 5D1D   02FA 0014
L_5D1F:
        MOVR    R0,     R3                      ; 5D1F   0083
        SARC    R1,     1                       ; 5D20   0079
        BNC     L_5D27                          ; 5D21   0209 0004

        SDBD                                    ; 5D23   0001
        XORI    #$2000, R0                      ; 5D24   03F8 0000 0020
L_5D27:
        CMPI    #$0028, R5                      ; 5D27   037D 0028
        BLT     L_5D7A                          ; 5D29   0205 004F
        BEQ     L_5D7E                          ; 5D2B   0204 0051

L_5D2D:
        SDBD                                    ; 5D2D   0001
        XORI    #$0800, R0                      ; 5D2E   03F8 0000 0008
        SDBD                                    ; 5D31   0001
        XORI    #$0800, R3                      ; 5D32   03FB 0000 0008
        SARC    R1,     1                       ; 5D35   0079
        BNC     L_5D3C                          ; 5D36   0209 0004

        SDBD                                    ; 5D38   0001
        XORI    #$2000, R3                      ; 5D39   03FB 0000 0020
L_5D3C:
        ADDI    #$0098, R3                      ; 5D3C   02FB 0098
        PSHR    R3                              ; 5D3E   0273
        MVII    #$0001, R3                      ; 5D3F   02BB 0001
L_5D41:
        ANDI    #$00FF, R1                      ; 5D41   03B9 00FF
        PSHR    R1                              ; 5D43   0271
        ADDR    R2,     R1                      ; 5D44   00D1
        ADDI    #$0200, R1                      ; 5D45   02F9 0200
        NOP                                     ; 5D47   0034
        NOP                                     ; 5D48   0034
        NOP                                     ; 5D49   0034
        NOP                                     ; 5D4A   0034
        MVO@    R0,     R1                      ; 5D4B   0248
        NOP                                     ; 5D4C   0034
        NOP                                     ; 5D4D   0034
        NOP                                     ; 5D4E   0034
        NOP                                     ; 5D4F   0034
        PULR    R1                              ; 5D50   02B1
        CMPI    #$0001, R3                      ; 5D51   037B 0001
        BNEQ    L_5D07                          ; 5D53   022C 004D

        SUBI    #$0013, R1                      ; 5D55   0339 0013
        NEGR    R1                              ; 5D57   0021
        ADDR    R2,     R1                      ; 5D58   00D1
        ADDI    #$0200, R1                      ; 5D59   02F9 0200
        PULR    R3                              ; 5D5B   02B3
        NOP                                     ; 5D5C   0034
        NOP                                     ; 5D5D   0034
        NOP                                     ; 5D5E   0034
        NOP                                     ; 5D5F   0034
        MVO@    R3,     R1                      ; 5D60   024B
        NOP                                     ; 5D61   0034
        NOP                                     ; 5D62   0034
        NOP                                     ; 5D63   0034
        NOP                                     ; 5D64   0034
        B       L_5D07                          ; 5D65   0220 005F

L_5D67:
        MVI@    R4,     R1                      ; 5D67   02A1
        SDBD                                    ; 5D68   0001
        MVII    #$2000, R0                      ; 5D69   02B8 0000 0020
        ADDI    #$0200, R1                      ; 5D6C   02F9 0200
        NOP                                     ; 5D6E   0034
        NOP                                     ; 5D6F   0034
        NOP                                     ; 5D70   0034
        NOP                                     ; 5D71   0034
        MVO@    R0,     R1                      ; 5D72   0248
        NOP                                     ; 5D73   0034
        NOP                                     ; 5D74   0034
        NOP                                     ; 5D75   0034
        NOP                                     ; 5D76   0034
        B       L_5D07                          ; 5D77   0220 0071
L_5D79:
        PULR    R7                              ; 5D79   02B7

L_5D7A:
        SLR     R1,     1                       ; 5D7A   0061
        CLRR    R3                              ; 5D7B   01DB
        B       L_5D41                          ; 5D7C   0220 003C

L_5D7E:
        MVII    #$003C, R2                      ; 5D7E   02BA 003C
        B       L_5D2D                          ; 5D80   0220 0054

.GRAM_INIT_5D82:
        DECLE   $0027           ; 5D82  # of GRAM cards to init
        DECLE   $0000           ; 5D83  #00   :  CART #00    ----
        DECLE   $0003,  $0200   ; 5D84  #01-05:  CART #01-05 ----
        DECLE   $02B9,  $01EE   ; 5D86  #06   :  Algo #1
        DECLE   $02DD,  $00F6   ; 5D88  #07   :  Algo #1
        DECLE   $02CD,  $00E6   ; 5D8A  #08   :  Algo #1
        DECLE   $02BF,  $01C6   ; 5D8C  #09   :  Algo #1
        DECLE   $000C           ; 5D8E  #0A   :  CART #06    ----
        DECLE   $02F9,  $03F6   ; 5D8F  #0B   :  Algo #1
        DECLE   $025B,  $014E   ; 5D91  #0C   :  Algo #1
        DECLE   $035B,  $0146   ; 5D93  #0D   :  Algo #1
        DECLE   $02F7,  $0396   ; 5D95  #0E   :  Algo #1
        DECLE   $0201,  $001A   ; 5D97  #0F   :  Algo #1
        DECLE   $0201,  $002A   ; 5D99  #10   :  Algo #1
        DECLE   $02DD,  $00C6   ; 5D9B  #11   :  Algo #1
        DECLE   $02F7,  $03AE   ; 5D9D  #12   :  Algo #1
        DECLE   $0001,  $0002   ; 5D9F  #13   :  Algo #1
        DECLE   $0203,  $03C0   ; 5DA1  #14-1B:  GRAM #01-08 X---
        DECLE   $0213,  $03C0   ; 5DA3  #1C-23:  GRAM #09-10 X---
        DECLE   $0223,  $0040   ; 5DA5  #24-24:  GRAM #11-11 X---
        DECLE   $0191,  $0040   ; 5DA7  #25-25:  GRAM #08-08 -YI-
        DECLE   $0099,  $0040   ; 5DA9  #26-26:  GRAM #0C-0C --I-

.GFX_LIST_5DAB:
        DECLE   $0000,  $0000,  $0018,  $0024   ; 5DAB  CART PIC #00
        DECLE   $005A,  $003C,  $0024,  $0024   ; 5DAF  
        DECLE   $0000,  $0000,  $0001,  $000F   ; 5DB3  CART PIC #01
        DECLE   $007F,  $008F,  $0001,  $0000   ; 5DB7  
        DECLE   $0000,  $000F,  $007F,  $00FF   ; 5DBB  CART PIC #02
        DECLE   $00FF,  $007F,  $003F,  $000F   ; 5DBF  
        DECLE   $00FF,  $003F,  $000C,  $0003   ; 5DC3  CART PIC #03
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DC7  
        DECLE   $00F0,  $00F0,  $00F0,  $00F0   ; 5DCB  CART PIC #04
        DECLE   $00F0,  $0030,  $0000,  $0000   ; 5DCF  
        DECLE   $0000,  $0000,  $0000,  $000F   ; 5DD3  CART PIC #05
        DECLE   $00CF,  $003F,  $000F,  $0003   ; 5DD7  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DDB  CART PIC #06
        DECLE   $0000,  $0003,  $001C,  $00FF   ; 5DDF  

        SWAP    R0,     2                       ; 5DE3   0044
        RLC     R1,     2                       ; 5DE4   0055
        RRC     R2,     2                       ; 5DE5   0076
        TSTR    R0                              ; 5DE6   0080
        TSTR    R2                              ; 5DE7   0092
        MOVR    R2,     R7                      ; 5DE8   0097

        DECLE   $00A8,  $00AB,  $00E5,  $02BB   ; 5DE9   00A8 00AB 00E5 02BB
        DECLE   $0083,  $02BF                   ; 5DED   0083 02BF

        MOVR    R6,     R1                      ; 5DEF   00B1
        XORR    R3,     R6                      ; 5DF0   01DE
        NEGR    R6                              ; 5DF1   0026
        MVII    #$0051, R3                      ; 5DF2   02BB 0051
        ADD     G_0061, R3                      ; 5DF4   02C3 0061
        ADD@    R1,     R3                      ; 5DF6   02CB
        RRC     R1,     1                       ; 5DF7   0071
        ADD@    R1,     R7                      ; 5DF8   02CF

        ADDR    R0,     R1                      ; 5DF9   00C1
        ADD     G_00D1, R7                      ; 5DFA   02C7 00D1

        DECLE   $02BF                           ; 5DFC   02BF

        ADDR    R4,     R1                      ; 5DFD   00E1
        XORR    R3,     R2                      ; 5DFE   01DA
        SUBR    R2,     R0                      ; 5DFF   0110
        ADD@    R3,     R7                      ; 5E00   02DF

        SETC                                    ; 5E01   0007
        ADD@    R2,     R7                      ; 5E02   02D7

        DECR    R1                              ; 5E03   0011
        ADD     .STIC.VDLY,R3                   ; 5E04   02C3 0031
        ADD@    R1,     R3                      ; 5E06   02CB
        SWAP    R1,     1                       ; 5E07   0041
        ADD@    R1,     R7                      ; 5E08   02CF

        ADDR    R6,     R1                      ; 5E09   00F1
        ADD     .ISRVEC.1,R7                    ; 5E0A   02C7 0101

        ADD@    R2,     R3                      ; 5E0C   02D3
        SUBR    R4,     R1                      ; 5E0D   0121
        ADD@    R3,     R3                      ; 5E0E   02DB
        SUBR    R6,     R1                      ; 5E0F   0131
        ADD@    R2,     R7                      ; 5E10   02D7

        GSWD    R3                              ; 5E11   0033
        ADD@    R2,     R3                      ; 5E12   02D3
        SUBR    R0,     R1                      ; 5E13   0101
        ADD@    R3,     R7                      ; 5E14   02DF

        SWAP    R3,     2                       ; 5E15   0047
        ADD@    R2,     R7                      ; 5E16   02D7

        RLC     R1,     1                       ; 5E17   0051
        ADD@    R2,     R3                      ; 5E18   02D3
        ADDR    R4,     R1                      ; 5E19   00E1
        ADD@    R3,     R3                      ; 5E1A   02DB
        ADDR    R6,     R1                      ; 5E1B   00F1
        ADD@    R3,     R7                      ; 5E1C   02DF

        SLR     R3,     2                       ; 5E1D   0067
        ADD@    R2,     R7                      ; 5E1E   02D7

        RRC     R1,     1                       ; 5E1F   0071
        ADD@    R2,     R3                      ; 5E20   02D3
        ADDR    R0,     R1                      ; 5E21   00C1
        ADD@    R3,     R3                      ; 5E22   02DB
        ADDR    R2,     R1                      ; 5E23   00D1
        ADD@    R3,     R7                      ; 5E24   02DF
        MOVR    R0,     R7                      ; 5E25   0087

        DECLE   $02DB,  $00B1,  $0019,  $0053   ; 5E26   02DB 00B1 0019 0053
        DECLE   $001D,  $0061,  $0021,  $0079   ; 5E2A   001D 0061 0021 0079
        DECLE   $002D,  $0033,  $0025,  $0049   ; 5E2E   002D 0033 0025 0049
        DECLE   $0007,  $0091,  $001A,  $0082   ; 5E32   0007 0091 001A 0082
        DECLE   $003A,  $0090,  $002B,  $0023   ; 5E36   003A 0090 002B 0023
        DECLE   $001A,  $0050,  $003A,  $0060   ; 5E3A   001A 0050 003A 0060
        DECLE   $0046,  $0078,  $0009,  $0091   ; 5E3E   0046 0078 0009 0091
        DECLE   $0031,  $0007,  $0035,  $0019   ; 5E42   0031 0007 0035 0019
        DECLE   $000F,  $0025,  $0036,  $0058   ; 5E46   000F 0025 0036 0058
        DECLE   $003E,  $0094,  $0031,  $0023   ; 5E4A   003E 0094 0031 0023
        DECLE   $0035,  $0039,  $0032,  $0060   ; 5E4E   0035 0039 0032 0060
        DECLE   $0036,  $0078,  $0042,  $0094   ; 5E52   0036 0078 0042 0094
        DECLE   $0031,  $0043,  $0035,  $0059   ; 5E56   0031 0043 0035 0059
        DECLE   $0032,  $0080,  $0012,  $0090   ; 5E5A   0032 0080 0012 0090
        DECLE   $0031,  $0063,  $0035           ; 5E5E   0031 0063 0035

        SARC    R1,     1                       ; 5E61   0079
L_5E62:
        DECR    R7                              ; 5E62   0017

        MOVR    R2,     R1                      ; 5E63   0091
        GSWD    R1                              ; 5E64   0031
        MOVR    R1,     R3                      ; 5E65   008B
L_5E66:
        PSHR    R5                              ; 5E66   0275
        PSHR    R2                              ; 5E67   0272
        MVI     G_01BF, R2                      ; 5E68   0282 01BF
        ANDI    #$0001, R2                      ; 5E6A   03BA 0001
        BEQ     L_5E79                          ; 5E6C   0204 000B

        ADDI    #$0192, R4                      ; 5E6E   02FC 0192
        MVI     G_015D, R2                      ; 5E70   0282 015D
        TSTR    R2                              ; 5E72   0092
        BEQ     L_5E7D                          ; 5E73   0204 0008

        ADDI    #$001B, R4                      ; 5E75   02FC 001B
        B       L_5E7D                          ; 5E77   0200 0004

L_5E79:
        SDBD                                    ; 5E79   0001
        ADDI    #$6756, R4                      ; 5E7A   02FC 0056 0067
L_5E7D:
        PULR    R2                              ; 5E7D   02B2
        PULR    R7                              ; 5E7E   02B7

L_5E7F:
        PSHR    R5                              ; 5E7F   0275
        MVII    #$0002, R3                      ; 5E80   02BB 0002
        MVI     G_0165, R0                      ; 5E82   0280 0165
        MVII    #$0003, R1                      ; 5E84   02B9 0003
        MVII    #$0200, R4                      ; 5E86   02BC 0200

        JSR     R5,     X_PRNUM_RGT             ; 5E88   0004 0118 00C5

        SLR     R3,     1                       ; 5E8B   0063
        MVII    #$0211, R4                      ; 5E8C   02BC 0211
        MVI     G_0166, R0                      ; 5E8E   0280 0166

        JSR     R5,     X_PRNUM_LFT             ; 5E90   0004 0118 009E

        CLRR    R3                              ; 5E93   01DB
        MVII    #$02C8, R4                      ; 5E94   02BC 02C8
        DECR    R1                              ; 5E96   0011
        MVI     G_0163, R0                      ; 5E97   0280 0163
        CMPI    #$0003, R0                      ; 5E99   0378 0003
        BLE     L_5E9F                          ; 5E9B   0206 0002

        MVII    #$0003, R0                      ; 5E9D   02B8 0003

L_5E9F:
        JSR     R5,     X_PRNUM_RGT             ; 5E9F   0004 0118 00C5

        ADDI    #$0003, R4                      ; 5EA2   02FC 0003

        JSR     R5,     X_PRINT_R5              ; 5EA4   0004 0118 007B
        STRING  "Out"                           ; 5EA7   004F 0075 0074
        DECLE   $0000                           ; 5EAA   0000

        ADDI    #$0008, R4                      ; 5EAB   02FC 0008

        JSR     R5,     X_PRINT_R5              ; 5EAD   0004 0118 007B
        STRING  "Ing"                           ; 5EB0   0049 006E 0067
        DECLE   $0000                           ; 5EB3   0000

        INCR    R4                              ; 5EB4   000C
        MVI     G_0164, R0                      ; 5EB5   0280 0164
        SLR     R0,     1                       ; 5EB7   0060
        INCR    R0                              ; 5EB8   0008

        JSR     R5,     X_PRNUM_LFT             ; 5EB9   0004 0118 009E

        MVII    #$02DC, R4                      ; 5EBC   02BC 02DC
        MVI     G_0162, R0                      ; 5EBE   0280 0162

        JSR     R5,     X_PRNUM_RGT             ; 5EC0   0004 0118 00C5

        ADDI    #$0003, R4                      ; 5EC3   02FC 0003

        JSR     R5,     X_PRINT_R5              ; 5EC5   0004 0118 007B
        STRING  "Ball"                          ; 5EC8   0042 0061 006C 006C
        DECLE   $0000                           ; 5ECC   0000

        ADDI    #$0006, R4                      ; 5ECD   02FC 0006

        JSR     R5,     X_PRINT_R5              ; 5ECF   0004 0118 007B
        STRING  "Strk"                          ; 5ED2   0053 0074 0072 006B
        DECLE   $0000                           ; 5ED6   0000

        INCR    R4                              ; 5ED7   000C
        MVI     G_0161, R0                      ; 5ED8   0280 0161

        JSR     R5,     X_PRNUM_LFT             ; 5EDA   0004 0118 009E

        PULR    R7                              ; 5EDD   02B7

L_5EDE:
        PSHR    R5                              ; 5EDE   0275
L_5EDF:
        MVI     G_016D, R1                      ; 5EDF   0281 016D
        ANDI    #$000F, R1                      ; 5EE1   03B9 000F
        ADDI    #$0170, R1                      ; 5EE3   02F9 0170
        MVI@    R1,     R0                      ; 5EE5   0288
        TSTR    R0                              ; 5EE6   0080
        PULR    R7                              ; 5EE7   02B7

L_5EE8:
        PSHR    R5                              ; 5EE8   0275
        MVI     G_01CF, R2                      ; 5EE9   0282 01CF
        ANDI    #$00E0, R2                      ; 5EEB   03BA 00E0
        BNEQ    L_5F53                          ; 5EED   020C 0064

        MVI     G_035D, R0                      ; 5EEF   0280 035D
        SDBD                                    ; 5EF1   0001
        CMPI    #$5B22, R0                      ; 5EF2   0378 0022 005B
        BNEQ    L_5F53                          ; 5EF5   020C 005C

        MVII    #$031E, R4                      ; 5EF7   02BC 031E
        MVI@    R4,     R0                      ; 5EF9   02A0
        SDBD                                    ; 5EFA   0001
        CMPI    #$6776, R0                      ; 5EFB   0378 0076 0067
        BNEQ    L_5F53                          ; 5EFE   020C 0053

        INCR    R4                              ; 5F00   000C
        MVI@    R4,     R2                      ; 5F01   02A2
        SDBD                                    ; 5F02   0001
        CMPI    #$4800, R2                      ; 5F03   037A 0000 0048
        BGT     L_5F53                          ; 5F06   020E 004B

        MVI     G_015D, R1                      ; 5F08   0281 015D
        XORI    #$0001, R1                      ; 5F0A   03F9 0001
        ADDI    #$011F, R1                      ; 5F0C   02F9 011F
        MVI@    R1,     R1                      ; 5F0E   0289
        MOVR    R1,     R0                      ; 5F0F   0088
        ANDI    #$0040, R0                      ; 5F10   03B8 0040
        BNEQ    L_5F53                          ; 5F12   020C 003F

        TSTR    R1                              ; 5F14   0089
        BMI     L_5F53                          ; 5F15   020B 003C

        MVII    #$0014, R0                      ; 5F17   02B8 0014

        JSR     R5,     .EXEC.629               ; 5F19   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 5F1C   0004 0114 0357

        MVII    #$0002, R2                      ; 5F1F   02BA 0002
        SDBD                                    ; 5F21   0001
        MVII    #$FFFC, R3                      ; 5F22   02BB 00FC 00FF
        SDBD                                    ; 5F25   0001
        CMPI    #$FFF0, R0                      ; 5F26   0378 00F0 00FF
        BGT     L_5F2E                          ; 5F29   020E 0003

        NEGR    R2                              ; 5F2B   0022
        B       L_5F33                          ; 5F2C   0200 0005

L_5F2E:
        CMPI    #$0010, R0                      ; 5F2E   0378 0010
        BGE     L_5F33                          ; 5F30   020D 0001

        CLRR    R2                              ; 5F32   01D2
L_5F33:
        SDBD                                    ; 5F33   0001
        CMPI    #$FFF0, R1                      ; 5F34   0379 00F0 00FF
        BGT     L_5F3C                          ; 5F37   020E 0003

        NEGR    R3                              ; 5F39   0023
        B       L_5F41                          ; 5F3A   0200 0005

L_5F3C:
        CMPI    #$0010, R1                      ; 5F3C   0379 0010
        BGE     L_5F41                          ; 5F3E   020D 0001

        CLRR    R3                              ; 5F40   01DB
L_5F41:
        MVI     G_0321, R0                      ; 5F41   0280 0321

        JSR     R5,     X_UNPK_BYTES            ; 5F43   0004 0114 0357

        ADDR    R2,     R0                      ; 5F46   00D0
        ADDR    R3,     R1                      ; 5F47   00D9
        CMPI    #$0020, R1                      ; 5F48   0379 0020
        BGT     L_5F4E                          ; 5F4A   020E 0002

        MVII    #$0020, R1                      ; 5F4C   02B9 0020

L_5F4E:
        JSR     R5,     X_PACK_BYTES            ; 5F4E   0004 0114 034F

        MVO     R0,     G_0321                  ; 5F51   0240 0321
L_5F53:
        PULR    R7                              ; 5F53   02B7

L_5F54:
        PSHR    R5                              ; 5F54   0275

L_5F55:
        JSR     R5,     .EXEC.76C               ; 5F55   0004 0114 036C

        INCR    R7                              ; 5F58   000F

L_5F59:
        PSHR    R5                              ; 5F59   0275

L_5F5A:
        JSR     R5,     .EXEC.9A8               ; 5F5A   0004 0118 01A8

        ADDI    #$0006, R1                      ; 5F5D   02F9 0006
        MVI@    R1,     R5                      ; 5F5F   028D
        TSTR    R5                              ; 5F60   00AD
        BNEQ    L_5F65                          ; 5F61   020C 0002

        INCR    R5                              ; 5F63   000D
        MVO@    R5,     R1                      ; 5F64   024D

L_5F65:
        JSR     R5,     .EXEC.76C               ; 5F65   0004 0114 036C

        PULR    R7                              ; 5F68   02B7

L_5F69:
        PSHR    R5                              ; 5F69   0275
        PSHR    R0                              ; 5F6A   0270
        PSHR    R1                              ; 5F6B   0271
        MVI     G_01BF, R0                      ; 5F6C   0280 01BF
        ANDI    #$00E9, R0                      ; 5F6E   03B8 00E9
        MVO     R0,     G_01BF                  ; 5F70   0240 01BF
        MVI     G_033E, R0                      ; 5F72   0280 033E
        SDBD                                    ; 5F74   0001
        CMPI    #$684B, R0                      ; 5F75   0378 004B 0068
        BEQ     L_5F80                          ; 5F78   0204 0006

        SDBD                                    ; 5F7A   0001
        CMPI    #$682A, R0                      ; 5F7B   0378 002A 0068
        BNEQ    L_5F85                          ; 5F7E   020C 0005

L_5F80:
        MVII    #$0004, R0                      ; 5F80   02B8 0004

        JSR     R5,     L_521C                  ; 5F82   0004 0150 021C

L_5F85:
        MVI     G_016F, R0                      ; 5F85   0280 016F
        MVO     R0,     G_016E                  ; 5F87   0240 016E

        JSR     R5,     .EXEC.76C               ; 5F89   0004 0114 036C

        ADDI    #$0005, R1                      ; 5F8C   02F9 0005
        MVI@    R1,     R0                      ; 5F8E   0288
        ANDI    #$03F0, R0                      ; 5F8F   03B8 03F0
        BNEQ    L_5F96                          ; 5F91   020C 0003

        MVII    #$03F0, R0                      ; 5F93   02B8 03F0
        MVO@    R0,     R1                      ; 5F95   0248
L_5F96:
        PULR    R1                              ; 5F96   02B1
        PULR    R0                              ; 5F97   02B0
        PULR    R7                              ; 5F98   02B7

L_5F99:
        NOP                                     ; 5F99   0034
        NOP                                     ; 5F9A   0034
        NOP                                     ; 5F9B   0034
        NOP                                     ; 5F9C   0034
        NOP                                     ; 5F9D   0034
        PSHR    R5                              ; 5F9E   0275
        SDBD                                    ; 5F9F   0001
        MVII    #$5030, R1                      ; 5FA0   02B9 0030 0050

        JSR     R5,     X_TIMER_STOP            ; 5FA3   0004 0118 0038

        MVI     G_015D, R1                      ; 5FA6   0281 015D
        MVII    #$0005, R0                      ; 5FA8   02B8 0005

        JSR     R5,     X_RAND2                 ; 5FAA   0004 0114 029E

        TSTR    R0                              ; 5FAD   0080
        BEQ     L_5FBC                          ; 5FAE   0204 000C

        CMPI    #$0002, R0                      ; 5FB0   0378 0002
        BEQ     L_5FD5                          ; 5FB2   0204 0021
        B       L_5FE5                          ; 5FB4   0200 002F

        NOP                                     ; 5FB6   0034
        NOP                                     ; 5FB7   0034
        NOP                                     ; 5FB8   0034
        NOP                                     ; 5FB9   0034
        NOP                                     ; 5FBA   0034
        PSHR    R5                              ; 5FBB   0275
L_5FBC:
        MVII    #$0080, R0                      ; 5FBC   02B8 0080
        MVO     R0,     G_01CC                  ; 5FBE   0240 01CC
        MVII    #$0002, R0                      ; 5FC0   02B8 0002
        MVO     R0,     G_01CD                  ; 5FC2   0240 01CD

        JSR     R5,     L_5FEF                  ; 5FC4   0004 015C 03EF

        BNEQ    L_6212                          ; 5FC7   020C 0249

        MVII    #$0005, R0                      ; 5FC9   02B8 0005
        MVO@    R0,     R1                      ; 5FCB   0248
        MVO     R0,     G_0188                  ; 5FCC   0240 0188
        PULR    R7                              ; 5FCE   02B7

        NOP                                     ; 5FCF   0034
        NOP                                     ; 5FD0   0034
        NOP                                     ; 5FD1   0034
        NOP                                     ; 5FD2   0034
        NOP                                     ; 5FD3   0034
        PSHR    R5                              ; 5FD4   0275
L_5FD5:
        MVII    #$00F0, R0                      ; 5FD5   02B8 00F0
        MVO     R0,     G_01CC                  ; 5FD7   0240 01CC
        MVII    #$0004, R0                      ; 5FD9   02B8 0004
        MVO     R0,     G_01CD                  ; 5FDB   0240 01CD
        B       L_5FF0                          ; 5FDD   0200 0011

        NOP                                     ; 5FDF   0034
        NOP                                     ; 5FE0   0034
        NOP                                     ; 5FE1   0034
        NOP                                     ; 5FE2   0034
        NOP                                     ; 5FE3   0034
        PSHR    R5                              ; 5FE4   0275
L_5FE5:
        MVII    #$00FF, R0                      ; 5FE5   02B8 00FF
        MVO     R0,     G_01CC                  ; 5FE7   0240 01CC
        MVII    #$0001, R0                      ; 5FE9   02B8 0001
        MVO     R0,     G_01CD                  ; 5FEB   0240 01CD
        B       L_5FF0                          ; 5FED   0200 0001

L_5FEF:
        PSHR    R5                              ; 5FEF   0275
L_5FF0:
        CMP     G_015D, R1                      ; 5FF0   0341 015D
        BNEQ    L_6212                          ; 5FF2   020C 021E

        SDBD                                    ; 5FF4   0001
        MVII    #$1906, R0                      ; 5FF5   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5FF8   0240 035D

        JSR     R5,     L_D162                  ; 5FFA   0004 01D0 0162

        MVI     G_0160, R0                      ; 5FFD   0280 0160

        JSR     R5,     .EXEC.76C               ; 5FFF   0004 0114 036C

        ADDI    #$0005, R1                      ; 6002   02F9 0005
        MVII    #$03F0, R0                      ; 6004   02B8 03F0
        MVO@    R0,     R1                      ; 6006   0248
        INCR    R1                              ; 6007   0009
        MVII    #$0008, R0                      ; 6008   02B8 0008
        MVO@    R0,     R1                      ; 600A   0248
        CLRR    R0                              ; 600B   01C0
        MVO     R0,     G_01D4                  ; 600C   0240 01D4
        PULR    R7                              ; 600E   02B7

L_600F:
        JSR     R5,     L_5B3D                  ; 600F   0004 0158 033D

        BEQ     L_601D                          ; 6012   0204 0009
        BPL     L_6019                          ; 6014   0203 0003

        TSTR    R5                              ; 6016   00AD
        BNEQ    L_601D                          ; 6017   020C 0004

L_6019:
        CLRR    R4                              ; 6019   01E4

        JSR     R5,     L_68EC                  ; 601A   0004 0168 00EC

L_601D:
        CLRR    R0                              ; 601D   01C0
        MVO     R0,     G_0188                  ; 601E   0240 0188
        MVI     G_0160, R0                      ; 6020   0280 0160

        JSR     R5,     .EXEC.76C               ; 6022   0004 0114 036C

        ADDI    #$0005, R1                      ; 6025   02F9 0005
        MVI@    R1,     R0                      ; 6027   0288
        ANDI    #$000F, R0                      ; 6028   03B8 000F
        MVII    #$0002, R5                      ; 602A   02BD 0002
        MVII    #$0051, R3                      ; 602C   02BB 0051
        MVII    #$0057, R4                      ; 602E   02BC 0057
        BEQ     L_6034                          ; 6030   0204 0002

        SUBR    R5,     R3                      ; 6032   012B
        ADDR    R5,     R4                      ; 6033   00EC
L_6034:
        MVI     G_031F, R2                      ; 6034   0282 031F
        SWAP    R2,     1                       ; 6036   0042
        ANDI    #$00FF, R2                      ; 6037   03BA 00FF
        CMPR    R3,     R2                      ; 6039   015A
        BLT     L_60D4                          ; 603A   0205 0098

        CMPR    R4,     R2                      ; 603C   0162
        BGT     L_60D4                          ; 603D   020E 0095

        DECR    R5                              ; 603F   0015
        CMPI    #$0007, R0                      ; 6040   0378 0007
        BEQ     L_60D4                          ; 6042   0204 0090

        SUBI    #$0002, R0                      ; 6044   0338 0002
        BLT     L_60D4                          ; 6046   0205 008C

        SUBI    #$0004, R0                      ; 6048   0338 0004
        NEGR    R0                              ; 604A   0020
        MVI     G_01CC, R1                      ; 604B   0281 01CC
        MOVR    R1,     R3                      ; 604D   008B

        JSR     R5,     X_MPY                   ; 604E   0004 011C 01DC

        MOVR    R3,     R0                      ; 6051   0098

        JSR     R5,     X_RAND2                 ; 6052   0004 0114 029E

        ADDR    R0,     R2                      ; 6055   00C2
        MVII    #$01C0, R4                      ; 6056   02BC 01C0
        PSHR    R2                              ; 6058   0272
        MVI     G_01CC, R0                      ; 6059   0280 01CC
        MVII    #$0005, R1                      ; 605B   02B9 0005

        JSR     R5,     X_MPY                   ; 605D   0004 011C 01DC

        SLR     R2,     1                       ; 6060   0062
        PULR    R3                              ; 6061   02B3
        SUBR    R2,     R3                      ; 6062   0113
        MVO@    R3,     R4                      ; 6063   0263
        SWAP    R3,     1                       ; 6064   0043
        MVO@    R3,     R4                      ; 6065   0263
        SWAP    R3,     1                       ; 6066   0043
        TSTR    R3                              ; 6067   009B
        BPL     L_606B                          ; 6068   0203 0001

        NEGR    R3                              ; 606A   0023
L_606B:
        MOVR    R2,     R0                      ; 606B   0090

        JSR     R5,     X_RAND2                 ; 606C   0004 0114 029E

        MVI     G_0321, R5                      ; 606F   0285 0321
        ANDI    #$00FF, R5                      ; 6071   03BD 00FF
        SUBI    #$0025, R5                      ; 6073   033D 0025
        ADDR    R5,     R0                      ; 6075   00E8
        ADDR    R5,     R0                      ; 6076   00E8
        ADDR    R5,     R0                      ; 6077   00E8
        ADDR    R2,     R0                      ; 6078   00D0
        MOVR    R0,     R1                      ; 6079   0081
        MOVR    R2,     R3                      ; 607A   0093
        SLR     R2,     1                       ; 607B   0062
        SUBR    R2,     R0                      ; 607C   0110
        CMPR    R3,     R0                      ; 607D   0158
        BLE     L_6084                          ; 607E   0206 0004

        MOVR    R3,     R2                      ; 6080   009A
        MOVR    R1,     R0                      ; 6081   0088
        SUBR    R2,     R0                      ; 6082   0110
        SLL     R0,     1                       ; 6083   0048
L_6084:
        MVO@    R0,     R4                      ; 6084   0260
        SWAP    R0,     1                       ; 6085   0040
        MVO@    R0,     R4                      ; 6086   0260
        MVI     G_01CC, R0                      ; 6087   0280 01CC
        MOVR    R0,     R1                      ; 6089   0081

        JSR     R5,     X_RAND2                 ; 608A   0004 0114 029E

        MOVR    R0,     R3                      ; 608D   0083
        MVI     G_01CD, R0                      ; 608E   0280 01CD

        JSR     R5,     X_MPY                   ; 6090   0004 011C 01DC

        ADDR    R3,     R2                      ; 6093   00DA
        MVO@    R2,     R4                      ; 6094   0262
        SWAP    R2,     1                       ; 6095   0042
        MVO@    R2,     R4                      ; 6096   0262
        MVI     G_031F, R0                      ; 6097   0280 031F
        MVO@    R0,     R4                      ; 6099   0260
        SWAP    R0,     1                       ; 609A   0040
        MVO@    R0,     R4                      ; 609B   0260
        MVI     G_0320, R0                      ; 609C   0280 0320
        SLL     R0,     1                       ; 609E   0048
        MVO@    R0,     R4                      ; 609F   0260
        SWAP    R0,     1                       ; 60A0   0040
        MVO@    R0,     R4                      ; 60A1   0260
        CLRR    R0                              ; 60A2   01C0
        MVO@    R0,     R4                      ; 60A3   0260
        MVO@    R0,     R4                      ; 60A4   0260
        MVO     R0,     G_0321                  ; 60A5   0240 0321
        INCR    R0                              ; 60A7   0008
        MVO     R0,     G_0182                  ; 60A8   0240 0182
        MVI     G_01BF, R0                      ; 60AA   0280 01BF
        ANDI    #$00F7, R0                      ; 60AC   03B8 00F7
        XORI    #$0008, R0                      ; 60AE   03F8 0008
        MVO     R0,     G_01BF                  ; 60B0   0240 01BF

        JSR     R5,     L_522A                  ; 60B2   0004 0150 022A
        JSR     R5,     L_6489                  ; 60B5   0004 0164 0089

        MVII    #$0179, R4                      ; 60B8   02BC 0179
        MVII    #$017D, R5                      ; 60BA   02BD 017D
L_60BC:
        MVI@    R4,     R0                      ; 60BC   02A0
        SLR     R0,     2                       ; 60BD   0064
        SLR     R0,     1                       ; 60BE   0060
        ANDI    #$0007, R0                      ; 60BF   03B8 0007
        MVO@    R0,     R5                      ; 60C1   0268
        CMPI    #$017D, R4                      ; 60C2   037C 017D
        BNEQ    L_60BC                          ; 60C4   022C 0009

        MVII    #$00FF, R0                      ; 60C6   02B8 00FF
        MVO     R0,     G_0167                  ; 60C8   0240 0167

        JSR     R5,     L_6411                  ; 60CA   0004 0164 0011
        JSR     R5,     L_D170                  ; 60CD   0004 01D0 0170
        JSR     R5,     L_533E                  ; 60D0   0004 0150 033E

        CLRR    R5                              ; 60D3   01ED
L_60D4:
        MVO     R5,     G_0187                  ; 60D4   0245 0187
        PULR    R7                              ; 60D6   02B7

L_60D7:
        PSHR    R5                              ; 60D7   0275

        JSR     R5,     L_5B3D                  ; 60D8   0004 0158 033D

        BEQ     L_60EA                          ; 60DB   0204 000D
        BPL     L_60E2                          ; 60DD   0203 0003

        TSTR    R5                              ; 60DF   00AD
        BEQ     L_60EA                          ; 60E0   0204 0008

L_60E2:
        MVI     G_01CE, R1                      ; 60E2   0281 01CE
        TSTR    R1                              ; 60E4   0089
        BNEQ    L_60EA                          ; 60E5   020C 0003

        JSR     R5,     L_626E                  ; 60E7   0004 0160 026E

L_60EA:
        MVII    #$01C0, R5                      ; 60EA   02BD 01C0
        SDBD                                    ; 60EC   0001
        MVI@    R5,     R2                      ; 60ED   02AA

        JSR     R5,     L_6257                  ; 60EE   0004 0160 0257

        MVII    #$01C6, R5                      ; 60F1   02BD 01C6
        SDBD                                    ; 60F3   0001
        MVI@    R5,     R1                      ; 60F4   02A9
        ADDR    R2,     R1                      ; 60F5   00D1
        SDBD                                    ; 60F6   0001
        MVII    #$A000, R0                      ; 60F7   02B8 0000 00A0

        JSR     R5,     L_619B                  ; 60FA   0004 0160 019B

        MVII    #$01C6, R5                      ; 60FD   02BD 01C6
        MVO@    R1,     R5                      ; 60FF   0269
        SWAP    R1,     1                       ; 6100   0041
        MVO@    R1,     R5                      ; 6101   0269
        SWAP    R1,     1                       ; 6102   0041
        MVII    #$031F, R3                      ; 6103   02BB 031F
        MVO@    R1,     R3                      ; 6105   0259
        MVI     G_0181, R2                      ; 6106   0282 0181
        SLL     R2,     2                       ; 6108   004E
        SLL     R2,     1                       ; 6109   004A
        ADDR    R2,     R3                      ; 610A   00D3
        MVO@    R1,     R3                      ; 610B   0259
        MVII    #$01C4, R5                      ; 610C   02BD 01C4
        SDBD                                    ; 610E   0001
        MVI@    R5,     R2                      ; 610F   02AA

        JSR     R5,     L_6257                  ; 6110   0004 0160 0257

        MVII    #$01CA, R5                      ; 6113   02BD 01CA
        SDBD                                    ; 6115   0001
        MVI@    R5,     R1                      ; 6116   02A9
        ADDR    R2,     R1                      ; 6117   00D1
        SUBI    #$0030, R2                      ; 6118   033A 0030
        TSTR    R1                              ; 611A   0089
        BEQ     L_611F                          ; 611B   0204 0002
        BPL     L_6156                          ; 611D   0203 0037

L_611F:
        PSHR    R2                              ; 611F   0272
        PSHR    R3                              ; 6120   0273
        MVII    #$01C0, R5                      ; 6121   02BD 01C0
        SDBD                                    ; 6123   0001
        MVI@    R5,     R2                      ; 6124   02AA
        MOVR    R2,     R3                      ; 6125   0093
        SAR     R3,     2                       ; 6126   006F
        SAR     R3,     2                       ; 6127   006F
        SUBR    R3,     R2                      ; 6128   011A

        JSR     R5,     L_6257                  ; 6129   0004 0160 0257

        MVII    #$01C0, R5                      ; 612C   02BD 01C0
        MVO@    R2,     R5                      ; 612E   026A
        SWAP    R2,     1                       ; 612F   0042
        MVO@    R2,     R5                      ; 6130   026A
        MVII    #$01C2, R2                      ; 6131   02BA 01C2
        SDBD                                    ; 6133   0001
        MVI@    R5,     R2                      ; 6134   02AA
        MOVR    R2,     R3                      ; 6135   0093
        SAR     R3,     2                       ; 6136   006F
        SAR     R3,     2                       ; 6137   006F
        SUBR    R3,     R2                      ; 6138   011A

        JSR     R5,     L_6257                  ; 6139   0004 0160 0257

        MVII    #$01C2, R5                      ; 613C   02BD 01C2
        MVO@    R2,     R5                      ; 613E   026A
        SWAP    R2,     1                       ; 613F   0042
        MVO@    R2,     R5                      ; 6140   026A
        PULR    R3                              ; 6141   02B3
        PULR    R2                              ; 6142   02B2

        JSR     R5,     L_6214                  ; 6143   0004 0160 0214

        NEGR    R2                              ; 6146   0022
        CMPI    #$0030, R2                      ; 6147   037A 0030
        BLE     L_6152                          ; 6149   0206 0007

        PSHR    R2                              ; 614B   0272
        PSHR    R3                              ; 614C   0273

        JSR     R5,     L_D1BE                  ; 614D   0004 01D0 01BE

        PULR    R3                              ; 6150   02B3
        PULR    R2                              ; 6151   02B2
L_6152:
        CLRR    R1                              ; 6152   01C9
        MVO     R1,     G_01CE                  ; 6153   0241 01CE
        SAR     R2,     1                       ; 6155   006A
L_6156:
        MVII    #$01CA, R5                      ; 6156   02BD 01CA
        MVO@    R1,     R5                      ; 6158   0269
        SWAP    R1,     1                       ; 6159   0041
        MVO@    R1,     R5                      ; 615A   0269
        SWAP    R1,     1                       ; 615B   0041

        JSR     R5,     L_6257                  ; 615C   0004 0160 0257

        MVII    #$01C4, R5                      ; 615F   02BD 01C4
        MVO@    R2,     R5                      ; 6161   026A
        SWAP    R2,     1                       ; 6162   0042
        MVO@    R2,     R5                      ; 6163   026A
        MVII    #$01C2, R5                      ; 6164   02BD 01C2
        SDBD                                    ; 6166   0001
        MVI@    R5,     R2                      ; 6167   02AA

        JSR     R5,     L_6257                  ; 6168   0004 0160 0257

        MVII    #$01C8, R5                      ; 616B   02BD 01C8
        SDBD                                    ; 616D   0001
        MVI@    R5,     R1                      ; 616E   02A9
        SUBR    R2,     R1                      ; 616F   0111
        SDBD                                    ; 6170   0001
        MVII    #$C000, R0                      ; 6171   02B8 0000 00C0
        SDBD                                    ; 6174   0001
        ADDI    #$0A00, R1                      ; 6175   02F9 0000 000A

        JSR     R5,     L_619B                  ; 6178   0004 0160 019B

        SDBD                                    ; 617B   0001
        SUBI    #$0A00, R1                      ; 617C   0339 0000 000A
        MVII    #$01C8, R5                      ; 617F   02BD 01C8
        MVO@    R1,     R5                      ; 6181   0269
        SWAP    R1,     1                       ; 6182   0041
        MVO@    R1,     R5                      ; 6183   0269
        SWAP    R1,     1                       ; 6184   0041
        MVII    #$01CA, R5                      ; 6185   02BD 01CA
        SDBD                                    ; 6187   0001
        MVI@    R5,     R2                      ; 6188   02AA
        SLR     R1,     1                       ; 6189   0061
        INCR    R3                              ; 618A   000B
        MVO@    R1,     R3                      ; 618B   0259
        SLR     R2,     1                       ; 618C   0062
        MVI     G_01CF, R4                      ; 618D   0284 01CF
        ANDI    #$0010, R4                      ; 618F   03BC 0010
        BNEQ    L_6198                          ; 6191   020C 0005

        SUBR    R2,     R1                      ; 6193   0111
        TSTR    R1                              ; 6194   0089
        BPL     L_6198                          ; 6195   0203 0001

        CLRR    R1                              ; 6197   01C9
L_6198:
        MVO     R1,     G_0320                  ; 6198   0241 0320
        PULR    R7                              ; 619A   02B7

L_619B:
        MOVR    R0,     R4                      ; 619B   0084
        SDBD                                    ; 619C   0001
        CMPI    #$0A00, R1                      ; 619D   0379 0000 000A
        BC      L_61A8                          ; 61A0   0201 0006

        SDBD                                    ; 61A2   0001
        MVII    #$0A00, R1                      ; 61A3   02B9 0000 000A
        B       L_61AC                          ; 61A6   0200 0004

L_61A8:
        CMPR    R0,     R1                      ; 61A8   0141
        BNC     L_6213                          ; 61A9   0209 0068

        MOVR    R0,     R1                      ; 61AB   0081
L_61AC:
        MVI     G_01CE, R0                      ; 61AC   0280 01CE
        TSTR    R0                              ; 61AE   0080
        BEQ     L_61D5                          ; 61AF   0204 0024

        MOVR    R5,     R0                      ; 61B1   00A8

        JSR     R5,     L_6214                  ; 61B2   0004 0160 0214

        MOVR    R0,     R5                      ; 61B5   0085
        CLRR    R0                              ; 61B6   01C0
        MVO     R0,     G_01CE                  ; 61B7   0240 01CE
        MVI     G_01CB, R0                      ; 61B9   0280 01CB
        SWAP    R0,     1                       ; 61BB   0040
        XOR     G_01CA, R0                      ; 61BC   03C0 01CA
        SDBD                                    ; 61BE   0001
        CMPI    #$2800, R0                      ; 61BF   0378 0000 0028
        BNC     L_61D5                          ; 61C2   0209 0011

        MVI     G_0181, R0                      ; 61C4   0280 0181

        JSR     R5,     L_521C                  ; 61C6   0004 0150 021C

        CLRR    R0                              ; 61C9   01C0
        MVO     R0,     G_0181                  ; 61CA   0240 0181
        MVI     G_01BF, R0                      ; 61CC   0280 01BF
        ANDI    #$00F7, R0                      ; 61CE   03B8 00F7
        MVO     R0,     G_01BF                  ; 61D0   0240 01BF
        J       L_6B6E                          ; 61D2   0004 0368 036E

L_61D5:
        PSHR    R5                              ; 61D5   0275
        PSHR    R2                              ; 61D6   0272
        MVII    #$01C0, R5                      ; 61D7   02BD 01C0
        SDBD                                    ; 61D9   0001
        MVI@    R5,     R2                      ; 61DA   02AA
        SAR     R2,     2                       ; 61DB   006E

        JSR     R5,     L_6257                  ; 61DC   0004 0160 0257

        MVII    #$01C0, R5                      ; 61DF   02BD 01C0
        MVO@    R2,     R5                      ; 61E1   026A
        SWAP    R2,     1                       ; 61E2   0042
        MVO@    R2,     R5                      ; 61E3   026A
        SDBD                                    ; 61E4   0001
        MVI@    R5,     R2                      ; 61E5   02AA
        SAR     R2,     2                       ; 61E6   006E

        JSR     R5,     L_6257                  ; 61E7   0004 0160 0257

        MVII    #$01C2, R5                      ; 61EA   02BD 01C2
        MVO@    R2,     R5                      ; 61EC   026A
        SWAP    R2,     1                       ; 61ED   0042
        MVO@    R2,     R5                      ; 61EE   026A
        SDBD                                    ; 61EF   0001
        MVI@    R5,     R2                      ; 61F0   02AA
        SAR     R2,     2                       ; 61F1   006E

        JSR     R5,     L_6257                  ; 61F2   0004 0160 0257

        MVII    #$01C4, R5                      ; 61F5   02BD 01C4
        MVO@    R2,     R5                      ; 61F7   026A
        SWAP    R2,     1                       ; 61F8   0042
        MVO@    R2,     R5                      ; 61F9   026A
        SDBD                                    ; 61FA   0001
        CMPI    #$C000, R4                      ; 61FB   037C 0000 00C0
        BEQ     L_6205                          ; 61FE   0204 0005

        MVII    #$01C0, R5                      ; 6200   02BD 01C0
        MOVR    R5,     R4                      ; 6202   00AC
        B       L_6208                          ; 6203   0200 0003

L_6205:
        MVII    #$01C2, R5                      ; 6205   02BD 01C2
        MOVR    R5,     R4                      ; 6207   00AC
L_6208:
        SDBD                                    ; 6208   0001
        MVI@    R5,     R2                      ; 6209   02AA
        NEGR    R2                              ; 620A   0022

        JSR     R5,     L_6257                  ; 620B   0004 0160 0257

        MVO@    R2,     R4                      ; 620E   0262
        SWAP    R2,     1                       ; 620F   0042
        MVO@    R2,     R4                      ; 6210   0262
        PULR    R2                              ; 6211   02B2
L_6212:
        PULR    R7                              ; 6212   02B7
L_6213:
        MOVR    R5,     R7                      ; 6213   00AF

L_6214:
        PSHR    R5                              ; 6214   0275
        PSHR    R0                              ; 6215   0270
        PSHR    R1                              ; 6216   0271
        MVI     G_01CE, R1                      ; 6217   0281 01CE
        PSHR    R2                              ; 6219   0272
        PSHR    R3                              ; 621A   0273
        TSTR    R1                              ; 621B   0089
        BNEQ    L_622A                          ; 621C   020C 000C

        MVI     G_0181, R0                      ; 621E   0280 0181

        JSR     R5,     .EXEC.772               ; 6220   0004 0114 0372

        TSTR    R3                              ; 6223   009B
        BMI     L_622A                          ; 6224   020B 0004

        CMPI    #$0039, R3                      ; 6226   037B 0039
        BLE     L_6252                          ; 6228   0206 0028

L_622A:
        MVI     G_0181, R0                      ; 622A   0280 0181

        JSR     R5,     .EXEC.772               ; 622C   0004 0114 0372

        SUBI    #$0054, R2                      ; 622F   033A 0054
        BMI     L_6234                          ; 6231   020B 0001

        NEGR    R2                              ; 6233   0022
L_6234:
        SUBI    #$005C, R3                      ; 6234   033B 005C
        ADDR    R3,     R3                      ; 6236   00DB
        CMPR    R2,     R3                      ; 6237   0153
        PULR    R3                              ; 6238   02B3
        PULR    R2                              ; 6239   02B2
        PULR    R1                              ; 623A   02B1
        PULR    R0                              ; 623B   02B0
        BLE     L_6212                          ; 623C   0226 002B

        MVI     G_01BF, R0                      ; 623E   0280 01BF
        ANDI    #$00F7, R0                      ; 6240   03B8 00F7
        MVO     R0,     G_01BF                  ; 6242   0240 01BF
        MVI     G_0181, R0                      ; 6244   0280 0181

        JSR     R5,     L_521C                  ; 6246   0004 0150 021C

        CLRR    R0                              ; 6249   01C0
        MVO     R0,     G_0181                  ; 624A   0240 0181
        MVO     R0,     G_01CE                  ; 624C   0240 01CE
        PULR    R5                              ; 624E   02B5
        J       L_6B97                          ; 624F   0004 0368 0397

L_6252:
        PULR    R3                              ; 6252   02B3
        PULR    R2                              ; 6253   02B2
        PULR    R1                              ; 6254   02B1
        PULR    R0                              ; 6255   02B0
        PULR    R7                              ; 6256   02B7

L_6257:
        PSHR    R5                              ; 6257   0275
        PSHR    R3                              ; 6258   0273
        MVII    #$01CA, R5                      ; 6259   02BD 01CA
        SDBD                                    ; 625B   0001
        MVI@    R5,     R3                      ; 625C   02AB
        TSTR    R3                              ; 625D   009B
        BEQ     L_6262                          ; 625E   0204 0002
        BPL     L_626C                          ; 6260   0203 000A

L_6262:
        MVII    #$0061, R3                      ; 6262   02BB 0061
        CMPR    R3,     R2                      ; 6264   015A
        BGT     L_626C                          ; 6265   020E 0005

        NEGR    R3                              ; 6267   0023
        CMPR    R3,     R2                      ; 6268   015A
        BLT     L_626C                          ; 6269   0205 0001

        CLRR    R2                              ; 626B   01D2
L_626C:
        PULR    R3                              ; 626C   02B3
        PULR    R7                              ; 626D   02B7

L_626E:
        PSHR    R5                              ; 626E   0275

        JSR     R5,     L_5EDE                  ; 626F   0004 015C 02DE
        JSR     R5,     .EXEC.76C               ; 6272   0004 0114 036C

        MOVR    R1,     R4                      ; 6275   008C
        ADDI    #$0002, R4                      ; 6276   02FC 0002
        MVI     G_031F, R2                      ; 6278   0282 031F
        SWAP    R2,     1                       ; 627A   0042
        ANDI    #$00FF, R2                      ; 627B   03BA 00FF
        MVI     G_0320, R3                      ; 627D   0283 0320
        SWAP    R3,     1                       ; 627F   0043
        ANDI    #$00FF, R3                      ; 6280   03BB 00FF

        JSR     R5,     .EXEC.784               ; 6282   0004 0114 0384

        MVI     G_016D, R0                      ; 6285   0280 016D
        ANDI    #$000F, R0                      ; 6287   03B8 000F
        MVO     R2,     G_01DC                  ; 6289   0242 01DC
        SWAP    R2,     1                       ; 628B   0042
        MVO     R2,     G_01DD                  ; 628C   0242 01DD
        SLL     R0,     1                       ; 628E   0048
        CLRR    R4                              ; 628F   01E4

        JSR     R5,     L_5E66                  ; 6290   0004 015C 0266

        ADDR    R4,     R0                      ; 6293   00E0
        MVO     R0,     G_01DE                  ; 6294   0240 01DE
        SWAP    R0,     1                       ; 6296   0040
        MVO     R0,     G_01DF                  ; 6297   0240 01DF
        MVI     G_031F, R0                      ; 6299   0280 031F
        MVII    #$01C0, R5                      ; 629B   02BD 01C0
        SDBD                                    ; 629D   0001
        MVI@    R5,     R1                      ; 629E   02A9
        SLL     R1,     2                       ; 629F   004D
        ADDR    R1,     R0                      ; 62A0   00C8
        SWAP    R0,     1                       ; 62A1   0040
        ANDI    #$00FF, R0                      ; 62A2   03B8 00FF
        MVI     G_0320, R1                      ; 62A4   0281 0320
        MVII    #$01C2, R5                      ; 62A6   02BD 01C2
        SDBD                                    ; 62A8   0001
        MVI@    R5,     R2                      ; 62A9   02AA
        SLL     R2,     1                       ; 62AA   004A
        SUBR    R2,     R1                      ; 62AB   0111
        SWAP    R1,     1                       ; 62AC   0041
        ANDI    #$00FF, R1                      ; 62AD   03B9 00FF

        JSR     R5,     L_53CF                  ; 62AF   0004 0150 03CF
        JSR     R5,     .EXEC.76C               ; 62B2   0004 0114 036C

        MOVR    R1,     R3                      ; 62B5   008B
        MVI     G_031F, R0                      ; 62B6   0280 031F
        SWAP    R0,     1                       ; 62B8   0040
        ANDI    #$00FF, R0                      ; 62B9   03B8 00FF
        MVI     G_0320, R1                      ; 62BB   0281 0320
        SWAP    R1,     1                       ; 62BD   0041
        ANDI    #$00FF, R1                      ; 62BE   03B9 00FF

        JSR     R5,     X_PACK_BYTES            ; 62C0   0004 0114 034F

        MOVR    R0,     R2                      ; 62C3   0082
        MOVR    R3,     R1                      ; 62C4   0099
        MVII    #$000B, R3                      ; 62C5   02BB 000B

        JSR     R5,     .EXEC.9A1               ; 62C7   0004 0118 01A1

        PULR    R7                              ; 62CA   02B7

L_62CB:
        PSHR    R5                              ; 62CB   0275
        MVI     G_031E, R5                      ; 62CC   0285 031E
        TSTR    R5                              ; 62CE   00AD
        BNEQ    L_62D3                          ; 62CF   020C 0002

        MVO     R5,     G_01D8                  ; 62D1   0245 01D8
L_62D3:
        MVI     G_01D8, R5                      ; 62D3   0285 01D8
        TSTR    R5                              ; 62D5   00AD
        BEQ     L_6212                          ; 62D6   0224 00C5

        JSR     R5,     L_5B3D                  ; 62D8   0004 0158 033D

        BEQ     L_6212                          ; 62DB   0224 00CA
        BPL     L_62E2                          ; 62DD   0203 0003

        TSTR    R5                              ; 62DF   00AD
        BEQ     L_6212                          ; 62E0   0224 00CF

L_62E2:
        JSR     R5,     L_626E                  ; 62E2   0004 0160 026E

        PULR    R7                              ; 62E5   02B7

L_62E6:
        PSHR    R5                              ; 62E6   0275

        JSR     R5,     L_64AB                  ; 62E7   0004 0164 00AB

        MVI     G_0186, R0                      ; 62EA   0280 0186
        TSTR    R0                              ; 62EC   0080
        BNEQ    L_6410                          ; 62ED   020C 0121

        MVI     G_0160, R0                      ; 62EF   0280 0160

        JSR     R5,     .EXEC.76C               ; 62F1   0004 0114 036C

        TSTR    R0                              ; 62F4   0080
        BNEQ    L_6342                          ; 62F5   020C 004B

        PSHR    R3                              ; 62F7   0273
        PSHR    R4                              ; 62F8   0274
        CLRR    R0                              ; 62F9   01C0
        MVO     R0,     G_0161                  ; 62FA   0240 0161
        MVO     R0,     G_0162                  ; 62FC   0240 0162

        JSR     R5,     L_5E7F                  ; 62FE   0004 015C 027F
        JSR     R5,     L_5207                  ; 6301   0004 0150 0207

        MVO     R0,     G_0160                  ; 6304   0240 0160

        JSR     R5,     .EXEC.76C               ; 6306   0004 0114 036C

        MOVR    R1,     R2                      ; 6309   008A
        SDBD                                    ; 630A   0001
        MVII    #$679E, R1                      ; 630B   02B9 009E 0067

        JSR     R5,     X_INIT_MOB              ; 630E   0004 0114 02B2

        MVI@    R2,     R1                      ; 6311   0291
        XOR     G_016A, R1                      ; 6312   03C1 016A
        MVII    #$0036, R3                      ; 6314   02BB 0036
        MVI     G_015D, R4                      ; 6316   0284 015D
        TSTR    R4                              ; 6318   00A4
        BEQ     L_631F                          ; 6319   0204 0004

        MVII    #$0072, R3                      ; 631B   02BB 0072
        XORI    #$0200, R1                      ; 631D   03F9 0200
L_631F:
        MVO@    R1,     R2                      ; 631F   0251
        INCR    R2                              ; 6320   000A
        SDBD                                    ; 6321   0001
        MVII    #$6819, R1                      ; 6322   02B9 0019 0068
        MVO@    R1,     R2                      ; 6325   0251
        INCR    R2                              ; 6326   000A
        SWAP    R3,     1                       ; 6327   0043
        MVO@    R3,     R2                      ; 6328   0253
        INCR    R2                              ; 6329   000A
        MVII    #$005A, R3                      ; 632A   02BB 005A
        SWAP    R3,     1                       ; 632C   0043
        MVO@    R3,     R2                      ; 632D   0253
        SDBD                                    ; 632E   0001
        MVII    #$5159, R2                      ; 632F   02BA 0059 0051
        MVI     G_0160, R0                      ; 6332   0280 0160
        MVII    #$001E, R3                      ; 6334   02BB 001E

        JSR     R5,     L_5F54                  ; 6336   0004 015C 0354

        PULR    R4                              ; 6339   02B4
        PULR    R3                              ; 633A   02B3
        PULR    R7                              ; 633B   02B7

        NOP                                     ; 633C   0034
        NOP                                     ; 633D   0034
        NOP                                     ; 633E   0034
        NOP                                     ; 633F   0034
        NOP                                     ; 6340   0034
        PSHR    R5                              ; 6341   0275
L_6342:
        MOVR    R1,     R2                      ; 6342   008A
        SDBD                                    ; 6343   0001
        MVII    #$6841, R1                      ; 6344   02B9 0041 0068

        JSR     R5,     X_INIT_MOB              ; 6347   0004 0114 02B2

        MVI@    R2,     R0                      ; 634A   0290
        XOR     G_016A, R0                      ; 634B   03C0 016A
        MVO@    R0,     R2                      ; 634D   0250
        PULR    R7                              ; 634E   02B7

        NOP                                     ; 634F   0034
        NOP                                     ; 6350   0034
        NOP                                     ; 6351   0034
        NOP                                     ; 6352   0034
        NOP                                     ; 6353   0034
        PSHR    R5                              ; 6354   0275
        MVI     G_0187, R0                      ; 6355   0280 0187
        CLRR    R1                              ; 6357   01C9
        MVO     R1,     G_0321                  ; 6358   0241 0321
        MVO     R1,     G_0187                  ; 635A   0241 0187
        DECR    R0                              ; 635C   0010
        BMI     L_6410                          ; 635D   020B 00B1

        PSHR    R0                              ; 635F   0270

        JSR     R5,     L_6411                  ; 6360   0004 0164 0011

        MVI     G_0170, R0                      ; 6363   0280 0170

        JSR     R5,     .EXEC.76C               ; 6365   0004 0114 036C

        ADDI    #$0002, R1                      ; 6368   02F9 0002
        MVI     G_031F, R0                      ; 636A   0280 031F
        MVO@    R0,     R1                      ; 636C   0248
        PULR    R0                              ; 636D   02B0
        TSTR    R0                              ; 636E   0080
        BNEQ    L_638E                          ; 636F   020C 001D

L_6371:
        JSR     R5,     L_5241                  ; 6371   0004 0150 0241
        DECLE   $0207,  $0053,  $0054,  $0052   ; 6374   0207 0053 0054 0052
        DECLE   $0049,  $004B,  $0045,  $0000   ; 6378   0049 004B 0045 0000
L_637C:
        MVI     G_0161, R2                      ; 637C   0282 0161
        INCR    R2                              ; 637E   000A
        MVO     R2,     G_0161                  ; 637F   0242 0161

        JSR     R5,     L_5E7F                  ; 6381   0004 015C 027F

        CMPI    #$0003, R2                      ; 6384   037A 0003
        BNEQ    L_6410                          ; 6386   020C 0088

        JSR     R5,     L_6489                  ; 6388   0004 0164 0089

        J       L_6DFA                          ; 638B   0004 036C 01FA

L_638E:
        MVI     G_0160, R0                      ; 638E   0280 0160

        JSR     R5,     .EXEC.76C               ; 6390   0004 0114 036C

        ADDI    #$0005, R1                      ; 6393   02F9 0005
        MVI@    R1,     R0                      ; 6395   0288
        ANDI    #$000F, R0                      ; 6396   03B8 000F
        BNEQ    L_6371                          ; 6398   022C 0028

        JSR     R5,     L_5241                  ; 639A   0004 0150 0241
        DECLE   $0208,  $0042,  $0041,  $004C   ; 639D   0208 0042 0041 004C
        DECLE   $004C,  $0000                   ; 63A1   004C 0000

        MVI     G_0162, R2                      ; 63A3   0282 0162
        INCR    R2                              ; 63A5   000A
        MVO     R2,     G_0162                  ; 63A6   0242 0162

        JSR     R5,     L_5E7F                  ; 63A8   0004 015C 027F

        SUBI    #$0004, R2                      ; 63AB   033A 0004
        BNEQ    L_6410                          ; 63AD   020C 0061

        MVO     R2,     G_031E                  ; 63AF   0242 031E
        MVII    #$0001, R0                      ; 63B1   02B8 0001

        JSR     R5,     X_PLAY_CHEER1           ; 63B3   0004 011C 02D5
        JSR     R5,     L_5241                  ; 63B6   0004 0150 0241
        DECLE   $0208,  $0057,  $0041,  $004C   ; 63B9   0208 0057 0041 004C
        DECLE   $004B,  $0000                   ; 63BD   004B 0000

        JSR     R5,     L_6489                  ; 63BF   0004 0164 0089
        JSR     R5,     L_64AB                  ; 63C2   0004 0164 00AB
        JSR     R5,     .EXEC.766               ; 63C5   0004 0114 0366

        MVO     R0,     G_0183                  ; 63C8   0240 0183

L_63CA:
        JSR     R5,     L_5F69                  ; 63CA   0004 015C 0369
        JSR     R5,     L_6C4B                  ; 63CD   0004 016C 004B

        MVII    #$0002, R5                      ; 63D0   02BD 0002
        MVO     R5,     G_01E2                  ; 63D2   0245 01E2
        CLRR    R4                              ; 63D4   01E4
        MVO     R4,     G_01CE                  ; 63D5   0244 01CE
L_63D7:
        CLRR    R5                              ; 63D7   01ED
        MVO     R5,     G_01E3                  ; 63D8   0245 01E3
        MVII    #$0179, R5                      ; 63DA   02BD 0179
L_63DC:
        MVI@    R5,     R0                      ; 63DC   02A8
        MOVR    R0,     R1                      ; 63DD   0081
        ANDI    #$0007, R0                      ; 63DE   03B8 0007
        BEQ     L_63FF                          ; 63E0   0204 001D

        MOVR    R1,     R2                      ; 63E2   008A
        ANDI    #$0020, R2                      ; 63E3   03BA 0020
        BNEQ    L_63FF                          ; 63E5   020C 0018

        ANDI    #$0018, R1                      ; 63E7   03B9 0018
        SLR     R1,     2                       ; 63E9   0065
        CMPR    R4,     R1                      ; 63EA   0161
        BNEQ    L_63FF                          ; 63EB   020C 0012

        PSHR    R5                              ; 63ED   0275
        SDBD                                    ; 63EE   0001
        ADDI    #$6741, R1                      ; 63EF   02F9 0041 0067
        ADD     G_01E2, R1                      ; 63F2   02C1 01E2
        MOVR    R1,     R5                      ; 63F4   008D
        SDBD                                    ; 63F5   0001
        MVI@    R5,     R2                      ; 63F6   02AA
        MVII    #$000E, R3                      ; 63F7   02BB 000E
        MVO     R3,     G_01E3                  ; 63F9   0243 01E3

        JSR     R5,     L_5F54                  ; 63FB   0004 015C 0354

        PULR    R5                              ; 63FE   02B5
L_63FF:
        CMPI    #$017D, R5                      ; 63FF   037D 017D
        BNEQ    L_63DC                          ; 6401   022C 0026

        MVI     G_01E3, R5                      ; 6403   0285 01E3
        TSTR    R5                              ; 6405   00AD
        BNEQ    L_640A                          ; 6406   020C 0002

        MVO     R5,     G_01E2                  ; 6408   0245 01E2
L_640A:
        ADDI    #$0002, R4                      ; 640A   02FC 0002
        CMPI    #$0008, R4                      ; 640C   037C 0008
        BNEQ    L_63D7                          ; 640E   022C 0038
L_6410:
        PULR    R7                              ; 6410   02B7

L_6411:
        PSHR    R5                              ; 6411   0275
        CLRR    R0                              ; 6412   01C0

        JSR     R5,     L_5C6E                  ; 6413   0004 015C 006E

        BC      L_641E                          ; 6416   0201 0006

        MVI     G_016B, R0                      ; 6418   0280 016B
        COMR    R0                              ; 641A   0018
        AND@    R5,     R0                      ; 641B   03A8
        DECR    R5                              ; 641C   0015
        MVO@    R0,     R5                      ; 641D   0268
L_641E:
        MVII    #$0080, R0                      ; 641E   02B8 0080
        MVO     R0,     G_016D                  ; 6420   0240 016D
        SDBD                                    ; 6422   0001
        MVII    #$5715, R0                      ; 6423   02B8 0015 0057
        MVO     R0,     G_035D                  ; 6426   0240 035D
        PULR    R7                              ; 6428   02B7

L_6429:
        SDBD                                    ; 6429   0001
        MVII    #$1906, R0                      ; 642A   02B8 0006 0019
        MVO     R0,     G_035D                  ; 642D   0240 035D
        SDBD                                    ; 642F   0001
        MVII    #$5024, R1                      ; 6430   02B9 0024 0050

        JSR     R5,     X_TIMER_STOP            ; 6433   0004 0118 0038

        CLRR    R0                              ; 6436   01C0
        MVO     R0,     G_016D                  ; 6437   0240 016D
        MVO     R0,     G_016E                  ; 6439   0240 016E
        MVO     R0,     G_0146                  ; 643B   0240 0146
        MVII    #$00FF, R0                      ; 643D   02B8 00FF
        MVO     R0,     G_015F                  ; 643F   0240 015F

        JSR     R5,     L_5868                  ; 6441   0004 0158 0068

        CLRR    R0                              ; 6444   01C0
L_6445:
        PSHR    R0                              ; 6445   0270
        INCR    R0                              ; 6446   0008
        MOVR    R0,     R3                      ; 6447   0083
        DECR    R0                              ; 6448   0010

        JSR     R5,     L_5CC0                  ; 6449   0004 015C 00C0

        PULR    R0                              ; 644C   02B0
        MVII    #$0036, R2                      ; 644D   02BA 0036
        MVI     G_015D, R1                      ; 644F   0281 015D
        TSTR    R1                              ; 6451   0089
        BNEQ    L_6456                          ; 6452   020C 0002

        MVII    #$0072, R2                      ; 6454   02BA 0072
L_6456:
        SWAP    R2,     1                       ; 6456   0042
        ADDI    #$005D, R2                      ; 6457   02FA 005D
        MVII    #$0019, R3                      ; 6459   02BB 0019

        JSR     R5,     L_5F54                  ; 645B   0004 015C 0354

        INCR    R0                              ; 645E   0008
        CMPI    #$0008, R0                      ; 645F   0378 0008
        BNEQ    L_6445                          ; 6461   022C 001D

        MVII    #$0009, R0                      ; 6463   02B8 0009
        MVII    #$0170, R4                      ; 6465   02BC 0170

        JSR     R5,     X_FILL_ZERO             ; 6467   0004 0114 0338

        MVII    #$0001, R5                      ; 646A   02BD 0001
        MVO     R5,     G_01BF                  ; 646C   0245 01BF
        MVO     R5,     G_0181                  ; 646E   0245 0181
        SLL     R0,     1                       ; 6470   0048
        J       X_PLAY_CHEER2                   ; 6471   0004 031C 02D6

        NOP                                     ; 6474   0034
        NOP                                     ; 6475   0034
        NOP                                     ; 6476   0034
        NOP                                     ; 6477   0034
        NOP                                     ; 6478   0034
        ADDI    #$0005, R1                      ; 6479   02F9 0005
        MVII    #$0007, R0                      ; 647B   02B8 0007
        MVI     G_0188, R2                      ; 647D   0282 0188
        TSTR    R2                              ; 647F   0092
        BEQ     L_6487                          ; 6480   0204 0005

        CLRR    R0                              ; 6482   01C0
        MVO     R0,     G_0188                  ; 6483   0240 0188
        MVII    #$0004, R0                      ; 6485   02B8 0004
L_6487:
        MVO@    R0,     R1                      ; 6487   0248
        MOVR    R5,     R7                      ; 6488   00AF

L_6489:
        PSHR    R5                              ; 6489   0275
        MVI     G_0160, R0                      ; 648A   0280 0160

        JSR     R5,     L_6EFE                  ; 648C   0004 016C 02FE

        CLRR    R2                              ; 648F   01D2
        MVO     R2,     G_0160                  ; 6490   0242 0160
        MVO@    R0,     R5                      ; 6492   0268
        MVO     R0,     G_01CE                  ; 6493   0240 01CE

        JSR     R5,     .EXEC.76C               ; 6495   0004 0114 036C

        INCR    R1                              ; 6498   0009
        SDBD                                    ; 6499   0001
        MVII    #$67C5, R0                      ; 649A   02B8 00C5 0067
        MVO@    R0,     R1                      ; 649D   0248
        ADDI    #$0004, R1                      ; 649E   02F9 0004
        MVII    #$03F0, R0                      ; 64A0   02B8 03F0
        MVO@    R0,     R1                      ; 64A2   0248
        INCR    R1                              ; 64A3   0009
        MVO@    R2,     R1                      ; 64A4   024A

        JSR     R5,     L_64AB                  ; 64A5   0004 0164 00AB

        SUBI    #$0006, R1                      ; 64A8   0339 0006
        PULR    R7                              ; 64AA   02B7

L_64AB:
        PSHR    R5                              ; 64AB   0275

        JSR     R5,     .EXEC.7C1               ; 64AC   0004 0114 03C1

        PSHR    R0                              ; 64AF   0270
        MVII    #$0179, R4                      ; 64B0   02BC 0179
        MVI     G_0184, R2                      ; 64B2   0282 0184
        ADD     G_0183, R2                      ; 64B4   02C2 0183
        BNEQ    L_6520                          ; 64B6   020C 0068

        MVI     G_01BF, R3                      ; 64B8   0283 01BF
        ANDI    #$0006, R3                      ; 64BA   03BB 0006
        BNEQ    L_6520                          ; 64BC   020C 0062

        MVI     G_0186, R3                      ; 64BE   0283 0186
        DECR    R3                              ; 64C0   0013
        BPL     L_6520                          ; 64C1   0203 005D

L_64C3:
        MVI@    R4,     R0                      ; 64C3   02A0
        MOVR    R0,     R1                      ; 64C4   0081
        ANDI    #$0007, R0                      ; 64C5   03B8 0007
        BEQ     L_64FB                          ; 64C7   0204 0032

        CMP     G_0160, R0                      ; 64C9   0340 0160
        BEQ     L_64FB                          ; 64CB   0204 002E

        ANDI    #$0038, R1                      ; 64CD   03B9 0038
        SLR     R1,     2                       ; 64CF   0065
        SLR     R1,     1                       ; 64D0   0061
        CMPI    #$0004, R1                      ; 64D1   0379 0004
        BGE     L_64FB                          ; 64D3   020D 0026

        CMPR    R1,     R3                      ; 64D5   014B
        BGT     L_64FB                          ; 64D6   020E 0023
        BNEQ    L_64F9                          ; 64D8   020C 001F

        PSHR    R1                              ; 64DA   0271

        JSR     R5,     .EXEC.76C               ; 64DB   0004 0114 036C

        ADDI    #$0003, R1                      ; 64DE   02F9 0003
        MVI@    R1,     R1                      ; 64E0   0289
        PSHR    R1                              ; 64E1   0271
        PSHR    R0                              ; 64E2   0270
        MOVR    R2,     R0                      ; 64E3   0090

        JSR     R5,     .EXEC.76C               ; 64E4   0004 0114 036C

        PULR    R0                              ; 64E7   02B0
        ADDI    #$0003, R1                      ; 64E8   02F9 0003
        MVI@    R1,     R1                      ; 64EA   0289
        CMP@    R6,     R1                      ; 64EB   0371
        PULR    R1                              ; 64EC   02B1
        BLT     L_64F5                          ; 64ED   0205 0006

        CMPI    #$0001, R1                      ; 64EF   0379 0001
        BGT     L_64FB                          ; 64F1   020E 0008
        B       L_64F9                          ; 64F3   0200 0004

L_64F5:
        CMPI    #$0001, R1                      ; 64F5   0379 0001
        BLE     L_64FB                          ; 64F7   0206 0002

L_64F9:
        MOVR    R1,     R3                      ; 64F9   008B
        MOVR    R0,     R2                      ; 64FA   0082
L_64FB:
        CMPI    #$017D, R4                      ; 64FB   037C 017D
        BNEQ    L_64C3                          ; 64FD   022C 003B

        CMP     G_016E, R2                      ; 64FF   0342 016E
        BEQ     L_6520                          ; 6501   0204 001D

        MOVR    R2,     R0                      ; 6503   0090
        BEQ     L_6512                          ; 6504   0204 000C

        JSR     R5,     .EXEC.76C               ; 6506   0004 0114 036C

        TSTR    R3                              ; 6509   009B
        BEQ     L_6512                          ; 650A   0204 0006

        JSR     R5,     L_6EC4                  ; 650C   0004 016C 02C4

        BPL     L_6512                          ; 650F   0203 0001

        CLRR    R2                              ; 6511   01D2
L_6512:
        MVO     R2,     G_016E                  ; 6512   0242 016E
        TSTR    R2                              ; 6514   0092
        BEQ     L_6520                          ; 6515   0204 0009

        MVO     R2,     G_016F                  ; 6517   0242 016F
        MVI@    R1,     R0                      ; 6519   0288
        XORI    #$0010, R0                      ; 651A   03F8 0010
        MVO@    R0,     R1                      ; 651C   0248
        CLRR    R0                              ; 651D   01C0
        MVO     R0,     G_01D6                  ; 651E   0240 01D6
L_6520:
        PULR    R0                              ; 6520   02B0
        PULR    R7                              ; 6521   02B7

        TSTR    R0                              ; 6522   0080
        DECR    R0                              ; 6523   0010
        MOVR    R2,     R7                      ; 6524   0097

        DECLE   $0067,  $0000,  $0000,  $0000   ; 6525   0067 0000 0000 0000
        DECLE   $0014,  $0000,  $0000,  $0000   ; 6529   0014 0000 0000 0000
        DECLE   $0000,  $0000,  $0318,  $0318   ; 652D   0000 0000 0318 0318
        DECLE   $0324,  $0324,  $035A,  $035A   ; 6531   0324 0324 035A 035A
        DECLE   $033C,  $033C,  $0324,  $0324   ; 6535   033C 033C 0324 0324
        DECLE   $0000,  $0324,  $0000,  $0000   ; 6539   0000 0324 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0000   ; 653D   0000 0018 0018 0000
        DECLE   $0000,  $0000,  $0018,  $0018   ; 6541   0000 0000 0018 0018
        DECLE   $0000,  $007C,  $007C,  $005A   ; 6545   0000 007C 007C 005A
        DECLE   $001A,  $0000,  $001A,  $0018   ; 6549   001A 0000 001A 0018
        DECLE   $0018,  $0010,  $0010,  $0010   ; 654D   0018 0010 0010 0010
        DECLE   $0000,  $0010,  $0018,  $0018   ; 6551   0000 0010 0018 0018
        DECLE   $0000,  $003C,  $007E,  $005A   ; 6555   0000 003C 007E 005A
        DECLE   $005A,  $0000,  $0018,  $0018   ; 6559   005A 0000 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; 655D   0018 0018 0018 0018
        DECLE   $0000,  $0000,  $0018,  $0018   ; 6561   0000 0000 0018 0018
        DECLE   $0000,  $003C,  $007E,  $005A   ; 6565   0000 003C 007E 005A
        DECLE   $005A,  $0000,  $0018,  $0018   ; 6569   005A 0000 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; 656D   0018 0018 0018 0018
        DECLE   $0000,  $0000,  $0018,  $0018   ; 6571   0000 0000 0018 0018
        DECLE   $0000,  $003E,  $003E,  $005A   ; 6575   0000 003E 003E 005A
        DECLE   $0058,  $0000,  $0058,  $0018   ; 6579   0058 0000 0058 0018
        DECLE   $0018,  $0008,  $0008,  $0008   ; 657D   0018 0008 0008 0008
        DECLE   $0000,  $0008,  $000C,  $000E   ; 6581   0000 0008 000C 000E
        DECLE   $0070,  $00B0,  $001C,  $001E   ; 6585   0070 00B0 001C 001E
        DECLE   $000A,  $0032,  $003A,  $0028   ; 6589   000A 0032 003A 0028
        DECLE   $004A,  $0048,  $0080,  $0080   ; 658D   004A 0048 0080 0080
        DECLE   $0080,  $0080,  $000C,  $000E   ; 6591   0080 0080 000C 000E
        DECLE   $0000,  $0070,  $009E,  $001E   ; 6595   0000 0070 009E 001E
        DECLE   $000A,  $0032,  $0038,  $002A   ; 6599   000A 0032 0038 002A
        DECLE   $0048,  $0048,  $0098,  $0080   ; 659D   0048 0048 0098 0080
        DECLE   $0080,  $0080,  $000C,  $000E   ; 65A1   0080 0080 000C 000E
        DECLE   $0000,  $0032,  $007E,  $005E   ; 65A5   0000 0032 007E 005E
        DECLE   $004A,  $0050,  $001A,  $001C   ; 65A9   004A 0050 001A 001C
        DECLE   $0036,  $00E4,  $0084,  $0008   ; 65AD   0036 00E4 0084 0008
        DECLE   $0000,  $0000,  $000C,  $000E   ; 65B1   0000 0000 000C 000E
        DECLE   $0000,  $0012,  $003E,  $003E   ; 65B5   0000 0012 003E 003E
        DECLE   $0028,  $0032,  $0018,  $001C   ; 65B9   0028 0032 0018 001C
        DECLE   $001C,  $0076,  $0042,  $0002   ; 65BD   001C 0076 0042 0002
        DECLE   $0002,  $0002,  $000C,  $000E   ; 65C1   0002 0002 000C 000E
        DECLE   $0000,  $0012,  $003E,  $003E   ; 65C5   0000 0012 003E 003E
        DECLE   $0028,  $0032,  $0018,  $001E   ; 65C9   0028 0032 0018 001E
        DECLE   $000E,  $0014,  $0014,  $0008   ; 65CD   000E 0014 0014 0008
        DECLE   $0008,  $0008,  $000C,  $000E   ; 65D1   0008 0008 000C 000E
        DECLE   $0000,  $0010,  $003E,  $003E   ; 65D5   0000 0010 003E 003E
        DECLE   $002A,  $0032,  $0018,  $001C   ; 65D9   002A 0032 0018 001C
        DECLE   $0016,  $0012,  $0024,  $0024   ; 65DD   0016 0012 0024 0024
        DECLE   $0020,  $0020,  $000C,  $000E   ; 65E1   0020 0020 000C 000E
        DECLE   $0000,  $0010,  $007E,  $005E   ; 65E5   0000 0010 007E 005E
        DECLE   $000A,  $0052,  $0018,  $001C   ; 65E9   000A 0052 0018 001C
        DECLE   $0014,  $0074,  $0044,  $0004   ; 65ED   0014 0074 0044 0004
        DECLE   $0004,  $0000,  $000C,  $000E   ; 65F1   0004 0000 000C 000E
        DECLE   $0000,  $0070,  $009E,  $001E   ; 65F5   0000 0070 009E 001E
        DECLE   $000A,  $0032,  $003C,  $001C   ; 65F9   000A 0032 003C 001C
        DECLE   $0038,  $0028,  $0010,  $0010   ; 65FD   0038 0028 0010 0010
        DECLE   $0010,  $0010,  $00C0,  $00E0   ; 6601   0010 0010 00C0 00E0
        DECLE   $00C1,  $0007,  $00CC,  $00F9   ; 6605   00C1 0007 00CC 00F9
        DECLE   $00FF,  $00AC,  $0098,  $0040   ; 6609   00FF 00AC 0098 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 660D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6611   0000 0000 0000 0000
        DECLE   $0000,  $00C0,  $00E0,  $0000   ; 6615   0000 00C0 00E0 0000
        DECLE   $00C0,  $00F0,  $00E8,  $00B0   ; 6619   00C0 00F0 00E8 00B0
        DECLE   $0078,  $0034,  $001A,  $0005   ; 661D   0078 0034 001A 0005
        DECLE   $0002,  $0000,  $0004,  $000C   ; 6621   0002 0000 0004 000C
        DECLE   $000E,  $000A,  $000E,  $0016   ; 6625   000E 000A 000E 0016
        DECLE   $001E,  $001A,  $0016,  $001C   ; 6629   001E 001A 0016 001C
        DECLE   $002C,  $0038,  $0038,  $0070   ; 662D   002C 0038 0038 0070
        DECLE   $0060,  $00C0,  $0000,  $0000   ; 6631   0060 00C0 0000 0000
        DECLE   $0004                           ; 6635   0004

        CLRC                                    ; 6636   0006
        INCR    R6                              ; 6637   000E
        INCR    R7                              ; 6638   000F

        INCR    R5                              ; 6639   000D
L_663A:
        ADDR    R2,     R7                      ; 663A   00D7

        SARC    R3,     2                       ; 663B   007F
        RSWD    R6                              ; 663C   003E
        RSWD    R5                              ; 663D   003D
L_663E:
        DECR    R7                              ; 663E   0017

        COMR    R5                              ; 663F   001D
        INCR    R7                              ; 6640   000F

        INCR    R3                              ; 6641   000B
L_6642:
        CLRC                                    ; 6642   0006
        DECLE   $0000,  $0318,  $0318,  $0324   ; 6643   0000 0318 0318 0324
        DECLE   $033C,  $035A,  $035A,  $0324   ; 6647   033C 035A 035A 0324
        DECLE   $031C,  $0318,  $0318,  $0318   ; 664B   031C 0318 0318 0318
        DECLE   $0318,  $0318,  $0000,  $033C   ; 664F   0318 0318 0000 033C
        DECLE   $0000,  $0000,  $0318,  $0318   ; 6653   0000 0000 0318 0318
        DECLE   $0304,  $031E,  $033A,  $0324   ; 6657   0304 031E 033A 0324
        DECLE   $033C,  $0338,  $0318,  $0338   ; 665B   033C 0338 0318 0338
        DECLE   $0318,  $0310,  $0318,  $0338   ; 665F   0318 0310 0318 0338
        DECLE   $0318,  $0338,  $0000,  $0318   ; 6663   0318 0338 0000 0318
        DECLE   $0318,  $0358,  $03F8,  $03C8   ; 6667   0318 0358 03F8 03C8
        DECLE   $0318,  $0338,  $0328,  $0328   ; 666B   0318 0338 0328 0328
        DECLE   $0368,  $0308,  $0308,  $0318   ; 666F   0368 0308 0308 0318
        DECLE   $0318,  $0338,  $0340,  $0358   ; 6673   0318 0338 0340 0358
        DECLE   $0358,  $0338,  $0318,  $0000   ; 6677   0358 0338 0318 0000
        DECLE   $0378,  $0348,  $0348,  $03C8   ; 667B   0378 0348 0348 03C8
        DECLE   $030C,  $0304,  $0304,  $0304   ; 667F   030C 0304 0304 0304
        DECLE   $0358,  $0318,  $0340,  $034C   ; 6683   0358 0318 0340 034C
        DECLE   $037C,  $031A,  $031A,  $0000   ; 6687   037C 031A 031A 0000
        DECLE   $031A,  $0318,  $0318,  $0318   ; 668B   031A 0318 0318 0318
        DECLE   $0308,  $0308,  $0308,  $0308   ; 668F   0308 0308 0308 0308
        DECLE   $0000,  $0318,  $0398,  $0000   ; 6693   0000 0318 0398 0000
        DECLE   $03BE,  $03FA,  $031A,  $031A   ; 6697   03BE 03FA 031A 031A
        DECLE   $0318,  $0318,  $0318,  $0318   ; 669B   0318 0318 0318 0318
        DECLE   $0318,  $0318,  $0000,  $0000   ; 669F   0318 0318 0000 0000
        DECLE   $0000,  $0000                   ; 66A3   0000 0000

        SUB@    R3,     R0                      ; 66A5   0318
        SUB@    R3,     R0                      ; 66A6   0318
        SUB     G_03BD, R7                      ; 66A7   0307 03BD

        DECLE   $035A,  $0398,  $0338,  $0338   ; 66A9   035A 0398 0338 0338
        DECLE   $0338,  $0338,  $0330,  $0330   ; 66AD   0338 0338 0330 0330
        DECLE   $0330,  $0330,  $0000,  $0000   ; 66B1   0330 0330 0000 0000
        DECLE   $0000,  $0319,  $031B,  $0306   ; 66B5   0000 0319 031B 0306
        DECLE   $033C,  $0338,  $03A8,  $0338   ; 66B9   033C 0338 03A8 0338
        DECLE   $0308,  $0338,  $0330,  $0330   ; 66BD   0308 0338 0330 0330
        DECLE   $0330,  $0330,  $03B0,  $03B8   ; 66C1   0330 0330 03B0 03B8
        DECLE   $0380,  $03B0,  $03B8,  $0388   ; 66C5   0380 03B0 03B8 0388
        DECLE   $0378,  $0000,  $0330,  $0330   ; 66C9   0378 0000 0330 0330
        DECLE   $0330,  $0330,  $0330,  $0330   ; 66CD   0330 0330 0330 0330
        DECLE   $0000,  $0378,  $0330,  $0338   ; 66D1   0000 0378 0330 0338
        DECLE   $0380,  $03B0,  $0378,  $0358   ; 66D5   0380 03B0 0378 0358
        DECLE   $0328,  $0338,  $0000,  $0330   ; 66D9   0328 0338 0000 0330
        DECLE   $0330,  $0360,  $0360,  $03E0   ; 66DD   0330 0360 0360 03E0
        DECLE   $0320,  $0360,  $0330,  $0338   ; 66E1   0320 0360 0330 0338
        DECLE   $0380,  $0350,  $0320,  $0350   ; 66E5   0380 0350 0320 0350
        DECLE   $0348,  $0370,  $0000,  $0330   ; 66E9   0348 0370 0000 0330
        DECLE   $0330,  $0330,  $0330,  $0338   ; 66ED   0330 0330 0330 0338
        DECLE   $0340,  $0340,  $0330,  $0338   ; 66F1   0340 0340 0330 0338
        DECLE   $0000,  $0330,  $0338,  $0338   ; 66F5   0000 0330 0338 0338
        DECLE   $0304,  $03F8,  $0000,  $0330   ; 66F9   0304 03F8 0000 0330
        DECLE   $0338,  $0328,  $0328,  $032C   ; 66FD   0338 0328 0328 032C
        DECLE   $0340,  $0340,  $0330,  $0338   ; 6701   0340 0340 0330 0338
        DECLE   $0000,  $0330,  $0370,  $0370   ; 6705   0000 0330 0370 0370
        DECLE   $0340,  $037E,  $0000,  $033C   ; 6709   0340 037E 0000 033C
        DECLE   $033C,  $0324,  $0326,  $0320   ; 670D   033C 0324 0326 0320
        DECLE   $0340,  $0340,  $0330,  $0338   ; 6711   0340 0340 0330 0338
        DECLE   $0000,  $0331,  $0372,  $037C   ; 6715   0000 0331 0372 037C
        DECLE   $0368,  $0370,  $0000,  $0330   ; 6719   0368 0370 0000 0330
        DECLE   $033C,  $0324,  $0344,  $0346   ; 671D   033C 0324 0344 0346
        DECLE   $0380,  $0380,  $0334,  $033C   ; 6721   0380 0380 0334 033C
        DECLE   $0304,  $0334,  $0374,  $0364   ; 6725   0304 0334 0374 0364
        DECLE   $033C,  $0330,  $0000,  $0330   ; 6729   033C 0330 0000 0330
        DECLE   $033E,  $0322,  $0322,  $03E3   ; 672D   033E 0322 0322 03E3
        DECLE   $0380,  $0380,  $0000,  $0000   ; 6731   0380 0380 0000 0000
        DECLE   $0398,  $035C,  $0320,  $031C   ; 6735   0398 035C 0320 031C
        DECLE   $031A,  $031C,  $0318,  $0000   ; 6739   031A 031C 0318 0000
        DECLE   $0318,  $031C,  $0314,  $03F6   ; 673D   0318 031C 0314 03F6
        DECLE   $0382,  $0383,  $0039,  $0090   ; 6741   0382 0383 0039 0090
        DECLE   $0024,  $0054,  $0039,  $0018   ; 6745   0024 0054 0039 0018
        DECLE   $0055,  $0054,  $0037           ; 6749   0055 0054 0037

        RLC     R0,     2                       ; 674C   0054
        ADDR    R4,     R6                      ; 674D   00E6
        ADCR    R2                              ; 674E   002A
        COMR    R4                              ; 674F   001C
        RSWD    R1                              ; 6750   0039
        RLC     R2,     2                       ; 6751   0056
        SWAP    R3,     2                       ; 6752   0047
        SLR     R1,     2                       ; 6753   0065
        MOVR    R0,     R3                      ; 6754   0083
        RRC     R2,     2                       ; 6755   0076
        SLR     R0,     1                       ; 6756   0060
        SLLC    R0,     1                       ; 6757   0058
        COMR    R0                              ; 6758   0018
        COMR    R0                              ; 6759   0018
        DECR    R0                              ; 675A   0010
        SLL     R0,     1                       ; 675B   0048
        COMR    R0                              ; 675C   0018
        MOVR    R2,     R0                      ; 675D   0090
        ADCR    R0                              ; 675E   0028
        RSWD    R0                              ; 675F   0038
        NEGR    R0                              ; 6760   0020
        SLR     R0,     1                       ; 6761   0060
        GSWD    R0                              ; 6762   0030
        DECR    R0                              ; 6763   0010
        RSWD    R0                              ; 6764   0038
        SLR     R0,     1                       ; 6765   0060
        GSWD    R0                              ; 6766   0030
        MOVR    R3,     R0                      ; 6767   0098
        MOVR    R0,     R7                      ; 6768   0087

        DECLE   $0018,  $0076,  $0067,  $0000   ; 6769   0018 0076 0067 0000
        DECLE   $0000,  $0000,  $0000,  $0030   ; 676D   0000 0000 0000 0030
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6771   0000 0000 0000 0000
        DECLE   $0000,  $034F,  $0063,  $0000   ; 6775   0000 034F 0063 0000
        DECLE   $0000,  $0001,  $0002,  $0006   ; 6779   0000 0001 0002 0006
        DECLE   $0027,  $015A,  $0227,  $005A   ; 677D   0027 015A 0227 005A
        DECLE   $0227,  $015A,  $034F,  $0063   ; 6781   0227 015A 034F 0063
        DECLE   $0059,  $0068,  $0001,  $0002   ; 6785   0059 0068 0001 0002
        DECLE   $0006,  $0027,  $015A,  $0227   ; 6789   0006 0027 015A 0227
        DECLE   $005A,  $0227,  $015A,  $034F   ; 678D   005A 0227 015A 034F
        DECLE   $0063,  $00B6,  $005A,  $0001   ; 6791   0063 00B6 005A 0001
        DECLE   $0002,  $0000,  $0300,  $0000   ; 6795   0002 0000 0300 0000
        DECLE   $0000,  $0000,  $0001,  $0002   ; 6799   0000 0000 0001 0002
        DECLE   $0000,  $0040,  $0018,  $00DA   ; 679D   0000 0040 0018 00DA
        DECLE   $0067,  $0000,  $0000,  $0000   ; 67A1   0067 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00F0   ; 67A5   0000 0000 0000 00F0
        DECLE   $0003,  $0000,  $0000,  $003E   ; 67A9   0003 0000 0000 003E
        DECLE   $006D,  $0001,  $0000,  $000E   ; 67AD   006D 0001 0000 000E
        DECLE   $0090,  $0169,  $0290,  $0069   ; 67B1   0090 0169 0290 0069
        DECLE   $0290,  $0169,  $01DF,  $006D   ; 67B5   0290 0169 01DF 006D
        DECLE   $01DF,  $016D,  $03DF,  $006D   ; 67B9   01DF 016D 03DF 006D
        DECLE   $03DF,  $016D,  $0300,  $0000   ; 67BD   03DF 016D 0300 0000
        DECLE   $004D,  $0059,  $0008,  $000B   ; 67C1   004D 0059 0008 000B
        DECLE   $0000,  $0000,  $003E,  $006D   ; 67C5   0000 0000 003E 006D
        DECLE   $0008,  $000B,  $000E,  $0090   ; 67C9   0008 000B 000E 0090
        DECLE   $0169,  $0290,  $0069,  $0290   ; 67CD   0169 0290 0069 0290
        DECLE   $0169,  $01DF,  $006D,  $01DF   ; 67D1   0169 01DF 006D 01DF
        DECLE   $016D,  $03DF,  $006D,  $03DF   ; 67D5   016D 03DF 006D 03DF
        DECLE   $016D,  $0300,  $0000,  $004D   ; 67D9   016D 0300 0000 004D
        DECLE   $0059,  $0001,  $0000,  $0000   ; 67DD   0059 0001 0000 0000
        DECLE   $0000,  $003E,  $006D,  $0001   ; 67E1   0000 003E 006D 0001
        DECLE   $001B,  $000E,  $0090,  $0169   ; 67E5   001B 000E 0090 0169
        DECLE   $0290,  $0069,  $0290,  $0169   ; 67E9   0290 0069 0290 0169
        DECLE   $01DF,  $006D,  $01DF,  $016D   ; 67ED   01DF 006D 01DF 016D
        DECLE   $03DF,  $006D,  $03DF,  $016D   ; 67F1   03DF 006D 03DF 016D
        DECLE   $0300,  $0000,  $004D,  $0059   ; 67F5   0300 0000 004D 0059
        DECLE   $0004,  $0003,  $0000,  $0000   ; 67F9   0004 0003 0000 0000
        DECLE   $003E,  $006D,  $0001,  $001D   ; 67FD   003E 006D 0001 001D
        DECLE   $000E,  $0090,  $0169,  $0290   ; 6801   000E 0090 0169 0290
        DECLE   $0069,  $0290,  $0169,  $01DF   ; 6805   0069 0290 0169 01DF
        DECLE   $006D,  $01DF,  $016D,  $03DF   ; 6809   006D 01DF 016D 03DF
        DECLE   $006D,  $03DF                   ; 680D   006D 03DF

        CMPR    R5,     R5                      ; 680F   016D
        SUB     .STIC.X.0,R0                    ; 6810   0300 0000
        ADDR    R1,     R5                      ; 6812   00CD
        SLLC    R1,     1                       ; 6813   0059
        INCR    R0                              ; 6814   0008
        INCR    R3                              ; 6815   000B
        EIS                                     ; 6816   0002
        MOVR    R2,     R7                      ; 6817   0097

        DECLE   $005A,  $0300,  $0000,  $003C   ; 6818   005A 0300 0000 003C
        DECLE   $0063,  $0008,  $000B,  $0000   ; 681C   0063 0008 000B 0000
        DECLE   $0040,  $0018,  $0031,  $0068   ; 6820   0040 0018 0031 0068
        DECLE   $0000,  $0054,  $0000,  $0037   ; 6824   0000 0054 0000 0037
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6828   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0021   ; 682C   0000 0000 0001 0021
        DECLE   $0000                           ; 6830   0000

        SUB     .STIC.X.0,R0                    ; 6831   0300 0000
        SLL     R2,     2                       ; 6833   004E
        SLLC    R3,     1                       ; 6834   005B
        INCR    R0                              ; 6835   0008
        NEGR    R3                              ; 6836   0023
        EIS                                     ; 6837   0002
        MOVR    R2,     R7                      ; 6838   0097

        DECLE   $005A,  $0300,  $0000,  $004E   ; 6839   005A 0300 0000 004E
        DECLE   $005B,  $0008,  $0023,  $0000   ; 683D   005B 0008 0023 0000
        DECLE   $0040,  $0018,  $0052,  $0068   ; 6841   0040 0018 0052 0068
        DECLE   $0000,  $004E,  $0000,  $0056   ; 6845   0000 004E 0000 0056
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6849   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $001F   ; 684D   0000 0000 0001 001F
        DECLE   $0000,  $0300,  $0000,  $0074   ; 6851   0000 0300 0000 0074
        DECLE   $0064,  $0008,  $0033,  $0000   ; 6855   0064 0008 0033 0000

        NOP                                     ; 6859   0034
        NOP                                     ; 685A   0034
        NOP                                     ; 685B   0034
        NOP                                     ; 685C   0034
        NOP                                     ; 685D   0034
        PSHR    R5                              ; 685E   0275

        JSR     R5,     L_5B3D                  ; 685F   0004 0158 033D

        BEQ     L_686A                          ; 6862   0204 0006

        SDBD                                    ; 6864   0001
        MVII    #$FFFF, R5                      ; 6865   02BD 00FF 00FF
        MVO     R5,     G_01D8                  ; 6868   0245 01D8
L_686A:
        PULR    R7                              ; 686A   02B7

L_686B:
        PSHR    R5                              ; 686B   0275
        MVI     G_01BF, R0                      ; 686C   0280 01BF
        ANDI    #$0002, R0                      ; 686E   03B8 0002
        BEQ     L_68C1                          ; 6870   0204 004F

        MVI     G_016F, R0                      ; 6872   0280 016F
        MOVR    R0,     R2                      ; 6874   0082

        JSR     R5,     .EXEC.76C               ; 6875   0004 0114 036C

        ADDI    #$0007, R1                      ; 6878   02F9 0007
        MVI@    R1,     R0                      ; 687A   0288
        SDBD                                    ; 687B   0001
        CMPI    #$9039, R0                      ; 687C   0378 0039 0090
        BEQ     L_6898                          ; 687F   0204 0017

        SDBD                                    ; 6881   0001
        CMPI    #$5424, R0                      ; 6882   0378 0024 0054
        BEQ     L_689E                          ; 6885   0204 0017

        SDBD                                    ; 6887   0001
        CMPI    #$1839, R0                      ; 6888   0378 0039 0018
        BEQ     L_689E                          ; 688B   0204 0011

        SDBD                                    ; 688D   0001
        CMPI    #$5455, R0                      ; 688E   0378 0055 0054
        BEQ     L_689E                          ; 6891   0204 000B

L_6893:
        JSR     R5,     L_5F69                  ; 6893   0004 015C 0369

        B       L_6918                          ; 6896   0200 0080

L_6898:
        MVI     G_01BF, R0                      ; 6898   0280 01BF
        ANDI    #$0004, R0                      ; 689A   03B8 0004
        BNEQ    L_692F                          ; 689C   020C 0091

L_689E:
        ADDI    #$013B, R2                      ; 689E   02FA 013B
        MVI@    R2,     R0                      ; 68A0   0290
        SUBI    #$0002, R0                      ; 68A1   0338 0002
        BEQ     L_6893                          ; 68A3   0224 0011
        BMI     L_6893                          ; 68A5   022B 0013

        MVO@    R0,     R2                      ; 68A7   0250
        MVI     G_033E, R0                      ; 68A8   0280 033E
        SDBD                                    ; 68AA   0001
        CMPI    #$684B, R0                      ; 68AB   0378 004B 0068
        BEQ     L_68B6                          ; 68AE   0204 0006

        SDBD                                    ; 68B0   0001
        CMPI    #$682A, R0                      ; 68B1   0378 002A 0068
        BNEQ    L_692F                          ; 68B4   020C 0079

L_68B6:
        MVI     G_013F, R0                      ; 68B6   0280 013F
        SUBI    #$0002, R0                      ; 68B8   0338 0002
        BPL     L_68BD                          ; 68BA   0203 0001

        CLRR    R0                              ; 68BC   01C0
L_68BD:
        MVO     R0,     G_013F                  ; 68BD   0240 013F
        B       L_692F                          ; 68BF   0200 006E

L_68C1:
        MVI     G_016E, R0                      ; 68C1   0280 016E
        TSTR    R0                              ; 68C3   0080
        BEQ     L_692F                          ; 68C4   0204 0069

        JSR     R5,     L_5B3D                  ; 68C6   0004 0158 033D

        BEQ     L_68D0                          ; 68C9   0204 0005
        BPL     L_69DB                          ; 68CB   0203 010E

        TSTR    R5                              ; 68CD   00AD
        BEQ     L_69DB                          ; 68CE   0204 010B

L_68D0:
        MVI     G_015D, R1                      ; 68D0   0281 015D
        ADDI    #$011F, R1                      ; 68D2   02F9 011F
        MVI@    R1,     R0                      ; 68D4   0288
        SWAP    R0,     1                       ; 68D5   0040
        SLLC    R0,     2                       ; 68D6   005C
        SLR     R0,     2                       ; 68D7   0064
        SWAP    R0,     1                       ; 68D8   0040
        BC      L_6918                          ; 68D9   0201 003D
        BOV     L_6918                          ; 68DB   0202 003B

        CLRR    R4                              ; 68DD   01E4
        CMPI    #$0004, R0                      ; 68DE   0378 0004
        BLT     L_68ED                          ; 68E0   0205 000B
        BEQ     L_6918                          ; 68E2   0204 0034

        CMPI    #$000C, R0                      ; 68E4   0378 000C
        BGT     L_68ED                          ; 68E6   020E 0005
        BEQ     L_6918                          ; 68E8   0204 002E

L_68EA:
        DECR    R4                              ; 68EA   0014
        INCR    R7                              ; 68EB   000F

L_68EC:
        PSHR    R5                              ; 68EC   0275
L_68ED:
        MVI     G_016E, R0                      ; 68ED   0280 016E
        TSTR    R0                              ; 68EF   0080
        BEQ     L_6954                          ; 68F0   0204 0062

        JSR     R5,     L_6EFE                  ; 68F2   0004 016C 02FE

        MVI@    R5,     R0                      ; 68F5   02A8
        SLR     R0,     2                       ; 68F6   0064
        SLR     R0,     1                       ; 68F7   0060
        ANDI    #$0003, R0                      ; 68F8   03B8 0003
        ADDR    R0,     R4                      ; 68FA   00C4
        BMI     L_6918                          ; 68FB   020B 001B

        ADDR    R4,     R4                      ; 68FD   00E4
        SDBD                                    ; 68FE   0001
        ADDI    #$6743, R4                      ; 68FF   02FC 0043 0067
        MVI     G_016E, R0                      ; 6902   0280 016E
        SDBD                                    ; 6904   0001
        MVI@    R4,     R2                      ; 6905   02A2
        MVII    #$000E, R3                      ; 6906   02BB 000E

        JSR     R5,     L_5F54                  ; 6908   0004 015C 0354

        MVI     G_0167, R0                      ; 690B   0280 0167
        TSTR    R0                              ; 690D   0080
        BEQ     L_692F                          ; 690E   0204 001F

        JSR     R5,     L_6D11                  ; 6910   0004 016C 0111

        CLRR    R0                              ; 6913   01C0
        MVO     R0,     G_0167                  ; 6914   0240 0167
        B       L_692F                          ; 6916   0200 0017

L_6918:
        MVI     G_016E, R0                      ; 6918   0280 016E

        JSR     R5,     .EXEC.76C               ; 691A   0004 0114 036C

        MOVR    R1,     R2                      ; 691D   008A
        ADDI    #$0004, R2                      ; 691E   02FA 0004
        CLRR    R5                              ; 6920   01ED
        MVO@    R5,     R2                      ; 6921   0255
        ADDI    #$0002, R2                      ; 6922   02FA 0002
        MVO@    R5,     R2                      ; 6924   0255

        JSR     R5,     L_6EC4                  ; 6925   0004 016C 02C4

        BMI     L_692F                          ; 6928   020B 0005

        JSR     R5,     L_6D3E                  ; 692A   0004 016C 013E

        B       L_692F                          ; 692D   0200 0000

L_692F:
        MVI     G_016D, R1                      ; 692F   0281 016D
        SWAP    R1,     1                       ; 6931   0041
        SLLC    R1,     2                       ; 6932   005D
        SLR     R1,     2                       ; 6933   0065
        SWAP    R1,     1                       ; 6934   0041
        BNC     L_6941                          ; 6935   0209 000A
        BNOV    L_6941                          ; 6937   020A 0008

        ADDI    #$0170, R1                      ; 6939   02F9 0170
        MVI@    R1,     R0                      ; 693B   0288

        JSR     R5,     L_6EBF                  ; 693C   0004 016C 02BF

        BPL     L_6943                          ; 693F   0203 0002

L_6941:
        MVII    #$00FF, R0                      ; 6941   02B8 00FF
L_6943:
        MVO     R0,     G_0168                  ; 6943   0240 0168
        CLRR    R0                              ; 6945   01C0
        MVO     R0,     G_0169                  ; 6946   0240 0169
        MVII    #$0179, R4                      ; 6948   02BC 0179
L_694A:
        MVI@    R4,     R0                      ; 694A   02A0
        PSHR    R4                              ; 694B   0274

        JSR     R5,     L_6C60                  ; 694C   0004 016C 0060

        PULR    R4                              ; 694F   02B4
        CMPI    #$017D, R4                      ; 6950   037C 017D
        BNEQ    L_694A                          ; 6952   022C 0009
L_6954:
        PULR    R7                              ; 6954   02B7

L_6955:
        PSHR    R5                              ; 6955   0275

        JSR     R5,     L_6EF9                  ; 6956   0004 016C 02F9

        BC      L_6954                          ; 6959   0221 0006

        MOVR    R5,     R2                      ; 695B   00AA
        MVI@    R2,     R3                      ; 695C   0293
        ANDI    #$00DF, R3                      ; 695D   03BB 00DF
        XORI    #$0020, R3                      ; 695F   03FB 0020
        MVO@    R3,     R2                      ; 6961   0253
        SUB     G_016E, R0                      ; 6962   0300 016E
        BNEQ    L_696D                          ; 6964   020C 0007

        MVO     R0,     G_016E                  ; 6966   0240 016E
        MVII    #$0010, R0                      ; 6968   02B8 0010
        COMR    R0                              ; 696A   0018
        AND@    R1,     R0                      ; 696B   0388
        MVO@    R0,     R1                      ; 696C   0248
L_696D:
        INCR    R1                              ; 696D   0009
        SDBD                                    ; 696E   0001
        MVII    #$67BF, R0                      ; 696F   02B8 00BF 0067
        MVO@    R0,     R1                      ; 6972   0248
        ADDI    #$0004, R1                      ; 6973   02F9 0004
        MVI@    R1,     R0                      ; 6975   0288
        CMPI    #$0008, R0                      ; 6976   0378 0008
        BLT     L_697D                          ; 6978   0205 0003

        MVII    #$03F0, R0                      ; 697A   02B8 03F0
        MVO@    R0,     R1                      ; 697C   0248
L_697D:
        SUBI    #$0005, R1                      ; 697D   0339 0005
        MVII    #$0036, R2                      ; 697F   02BA 0036
        MVI     G_015D, R5                      ; 6981   0285 015D
        TSTR    R5                              ; 6983   00AD
        BEQ     L_6988                          ; 6984   0204 0002

        MVII    #$0072, R2                      ; 6986   02BA 0072
L_6988:
        SWAP    R2,     1                       ; 6988   0042
        ADDI    #$005F, R2                      ; 6989   02FA 005F
        MVII    #$0012, R3                      ; 698B   02BB 0012

        JSR     R5,     L_5F5A                  ; 698D   0004 015C 035A

        NOP                                     ; 6990   0034
        NOP                                     ; 6991   0034
        NOP                                     ; 6992   0034
        NOP                                     ; 6993   0034
        NOP                                     ; 6994   0034
        PSHR    R5                              ; 6995   0275

        JSR     R5,     L_6EC4                  ; 6996   0004 016C 02C4

        BPL     L_6954                          ; 6999   0223 0046

        MVI     G_016D, R2                      ; 699B   0282 016D
        SWAP    R2,     1                       ; 699D   0042
        SLLC    R2,     2                       ; 699E   005E
        SLR     R2,     2                       ; 699F   0066
        SWAP    R2,     1                       ; 69A0   0042
        BNC     L_6954                          ; 69A1   0229 004E
        BNOV    L_6954                          ; 69A3   022A 0050

        ADDI    #$0170, R2                      ; 69A5   02FA 0170
        CMP@    R2,     R3                      ; 69A7   0353
        BNEQ    L_6954                          ; 69A8   022C 0055
        J       L_6DFA                          ; 69AA   0004 036C 01FA

L_69AD:
        JSR     R5,     .EXEC.766               ; 69AD   0004 0114 0366

        PSHR    R0                              ; 69B0   0270

        JSR     R5,     L_6EFE                  ; 69B1   0004 016C 02FE

        CLRR    R1                              ; 69B4   01C9
        MVO@    R1,     R5                      ; 69B5   0269

        JSR     R5,     L_521C                  ; 69B6   0004 0150 021C

        MVI     G_0160, R0                      ; 69B9   0280 0160

        JSR     R5,     X_POW2                  ; 69BB   0004 0114 0345

        XOR     G_016C, R0                      ; 69BE   03C0 016C
        ANDI    #$00F0, R0                      ; 69C0   03B8 00F0
        BNEQ    L_69CE                          ; 69C2   020C 000A

        XOR     G_0184, R0                      ; 69C4   03C0 0184
        BEQ     L_69CE                          ; 69C6   0204 0006

        CLRR    R0                              ; 69C8   01C0
        MVO     R0,     G_0184                  ; 69C9   0240 0184

        JSR     R5,     L_5914                  ; 69CB   0004 0158 0114
L_69CE:
        JSR     R5,     L_64AB                  ; 69CE   0004 0164 00AB

        PULR    R0                              ; 69D1   02B0
        SUB     G_0186, R0                      ; 69D2   0300 0186
        BNEQ    L_6954                          ; 69D4   022C 0081

        MVO     R0,     G_0186                  ; 69D6   0240 0186
        J       L_6429                          ; 69D8   0004 0364 0029

L_69DB:
        MVII    #$0003, R0                      ; 69DB   02B8 0003
L_69DD:
        MVII    #$0179, R4                      ; 69DD   02BC 0179
L_69DF:
        MVI@    R4,     R3                      ; 69DF   02A3
        MOVR    R3,     R1                      ; 69E0   0099
        ANDI    #$0007, R1                      ; 69E1   03B9 0007
        BEQ     L_6A49                          ; 69E3   0204 0064

        MOVR    R3,     R2                      ; 69E5   009A
        ANDI    #$0020, R2                      ; 69E6   03BA 0020
        BNEQ    L_6A49                          ; 69E8   020C 005F

        SLR     R3,     2                       ; 69EA   0067
        SLR     R3,     1                       ; 69EB   0063
        ANDI    #$0003, R3                      ; 69EC   03BB 0003
        CMPR    R3,     R0                      ; 69EE   0158
        BNEQ    L_6A49                          ; 69EF   020C 0058

        PSHR    R1                              ; 69F1   0271
        PSHR    R0                              ; 69F2   0270
        MOVR    R1,     R0                      ; 69F3   0088

        JSR     R5,     L_6EBF                  ; 69F4   0004 016C 02BF

        BMI     L_69FD                          ; 69F7   020B 0004

        PULR    R0                              ; 69F9   02B0
        PULR    R1                              ; 69FA   02B1
        B       L_6A49                          ; 69FB   0200 004C

L_69FD:
        PULR    R2                              ; 69FD   02B2
        PSHR    R2                              ; 69FE   0272
        PSHR    R4                              ; 69FF   0274

        JSR     R5,     L_6CC5                  ; 6A00   0004 016C 00C5

        PULR    R4                              ; 6A03   02B4
        PULR    R0                              ; 6A04   02B0
        PULR    R1                              ; 6A05   02B1
        BNEQ    L_6A49                          ; 6A06   020C 0041

        CMP     G_016E, R1                      ; 6A08   0341 016E
        BEQ     L_6A1D                          ; 6A0A   0204 0011

        MVI     G_0167, R3                      ; 6A0C   0283 0167
        TSTR    R3                              ; 6A0E   009B
        BEQ     L_692F                          ; 6A0F   0224 00E1

        PSHR    R4                              ; 6A11   0274
        PSHR    R0                              ; 6A12   0270

        JSR     R5,     L_6D11                  ; 6A13   0004 016C 0111

        PULR    R0                              ; 6A16   02B0
        PULR    R4                              ; 6A17   02B4
        CLRR    R3                              ; 6A18   01DB
        MVO     R3,     G_0167                  ; 6A19   0243 0167
        B       L_6A49                          ; 6A1B   0200 002C

L_6A1D:
        ADDI    #$0175, R1                      ; 6A1D   02F9 0175
        MVI@    R1,     R0                      ; 6A1F   0288
        ANDI    #$0018, R0                      ; 6A20   03B8 0018
        BNEQ    L_6A2B                          ; 6A22   020C 0007

L_6A24:
        MVI     G_015D, R1                      ; 6A24   0281 015D

        JSR     R5,     L_D000                  ; 6A26   0004 01D0 0000

        B       L_6B6B                          ; 6A29   0200 0140

L_6A2B:
        SLR     R0,     2                       ; 6A2B   0064
        SLR     R0,     1                       ; 6A2C   0060
        MOVR    R0,     R2                      ; 6A2D   0082
        MVI     G_016E, R0                      ; 6A2E   0280 016E

        JSR     R5,     .EXEC.76C               ; 6A30   0004 0114 036C

        ADDI    #$0002, R1                      ; 6A33   02F9 0002
        MOVR    R1,     R4                      ; 6A35   008C
        MOVR    R2,     R5                      ; 6A36   0095
        ADDR    R5,     R5                      ; 6A37   00ED
        SDBD                                    ; 6A38   0001
        ADDI    #$6743, R5                      ; 6A39   02FD 0043 0067
        MVI@    R5,     R3                      ; 6A3C   02AB
        MVI@    R5,     R2                      ; 6A3D   02AA

        JSR     R5,     .EXEC.7A3               ; 6A3E   0004 0114 03A3

        CMPI    #$000C, R2                      ; 6A41   037A 000C
        BGT     L_6B6B                          ; 6A43   020E 0126

        MVII    #$0001, R0                      ; 6A45   02B8 0001
        B       L_6A24                          ; 6A47   0220 0024

L_6A49:
        CMPI    #$017D, R4                      ; 6A49   037C 017D
        BNEQ    L_69DF                          ; 6A4B   022C 006D

        DECR    R0                              ; 6A4D   0010
        BPL     L_69DD                          ; 6A4E   0223 0072

        MVI     G_016E, R1                      ; 6A50   0281 016E
        MOVR    R1,     R0                      ; 6A52   0088

        JSR     R5,     L_6EBF                  ; 6A53   0004 016C 02BF

        BMI     L_6A94                          ; 6A56   020B 003C

        INCR    R0                              ; 6A58   0008
        CMP     G_0168, R0                      ; 6A59   0340 0168
        BEQ     L_6918                          ; 6A5B   0224 0144

        MVI     G_016D, R1                      ; 6A5D   0281 016D
        MOVR    R1,     R5                      ; 6A5F   008D
        ANDI    #$0040, R5                      ; 6A60   03BD 0040
        BEQ     L_6A7F                          ; 6A62   0204 001B

        ANDI    #$000F, R1                      ; 6A64   03B9 000F
        CMPI    #$0003, R0                      ; 6A66   0378 0003
        BNEQ    L_6A73                          ; 6A68   020C 0009

        CMPI    #$0006, R1                      ; 6A6A   0379 0006
        BEQ     L_6918                          ; 6A6C   0224 0155

        TSTR    R1                              ; 6A6E   0089
        BEQ     L_6918                          ; 6A6F   0224 0158
        B       L_6A7F                          ; 6A71   0200 000C

L_6A73:
        CMPI    #$0002, R0                      ; 6A73   0378 0002
        BEQ     L_6918                          ; 6A75   0224 015E

        CMPI    #$0008, R1                      ; 6A77   0379 0008
        BEQ     L_6918                          ; 6A79   0224 0162

        CMPI    #$0005, R1                      ; 6A7B   0379 0005
        BEQ     L_6918                          ; 6A7D   0224 0166

L_6A7F:
        MVI     G_035D, R0                      ; 6A7F   0280 035D
        SDBD                                    ; 6A81   0001
        CMPI    #$5B22, R0                      ; 6A82   0378 0022 005B
        BEQ     L_6918                          ; 6A85   0224 016E

        MVI     G_0182, R0                      ; 6A87   0280 0182
        TSTR    R0                              ; 6A89   0080
        BNEQ    L_6A94                          ; 6A8A   020C 0008

        MVII    #$0050, R0                      ; 6A8C   02B8 0050

        JSR     R5,     X_RAND2                 ; 6A8E   0004 0114 029E

        TSTR    R0                              ; 6A91   0080
        BNEQ    L_6918                          ; 6A92   022C 017B

L_6A94:
        MVI     G_016E, R1                      ; 6A94   0281 016E
        ADDI    #$0175, R1                      ; 6A96   02F9 0175
        MVI@    R1,     R0                      ; 6A98   0288
        SLR     R0,     2                       ; 6A99   0064
        SLR     R0,     1                       ; 6A9A   0060
        ANDI    #$0003, R0                      ; 6A9B   03B8 0003
        MVI@    R1,     R4                      ; 6A9D   028C
        ANDI    #$0007, R4                      ; 6A9E   03BC 0007
        MVI     G_016D, R1                      ; 6AA0   0281 016D
        SWAP    R1,     1                       ; 6AA2   0041
        SLLC    R1,     2                       ; 6AA3   005D
        BOV     L_6AF7                          ; 6AA4   0202 0051

        MVI     G_0324, R2                      ; 6AA6   0282 0324
        MOVR    R0,     R5                      ; 6AA8   0085
        ADDR    R5,     R5                      ; 6AA9   00ED
        SDBD                                    ; 6AAA   0001
        ADDI    #$6743, R5                      ; 6AAB   02FD 0043 0067
        MOVR    R4,     R0                      ; 6AAE   00A0
        MOVR    R5,     R4                      ; 6AAF   00AC

        JSR     R5,     .EXEC.76C               ; 6AB0   0004 0114 036C

        ADDI    #$0007, R1                      ; 6AB3   02F9 0007
        CMP@    R1,     R2                      ; 6AB5   034A
        BNEQ    L_6B6B                          ; 6AB6   020C 00B3

        SDBD                                    ; 6AB8   0001
        MVI@    R4,     R1                      ; 6AB9   02A1
        CMPR    R2,     R1                      ; 6ABA   0151
        BNEQ    L_6B6B                          ; 6ABB   020C 00AE

        MOVR    R2,     R0                      ; 6ABD   0090
        MVI     G_016E, R1                      ; 6ABE   0281 016E

        JSR     R5,     L_564C                  ; 6AC0   0004 0154 024C

        CMPI    #$0004, R0                      ; 6AC3   0378 0004
        BGT     L_6B6B                          ; 6AC5   020E 00A4
        B       L_6AD3                          ; 6AC7   0200 000A

        MOVR    R2,     R0                      ; 6AC9   0090
        MVI     G_016E, R1                      ; 6ACA   0281 016E

        JSR     R5,     L_564C                  ; 6ACC   0004 0154 024C

        CMPI    #$0004, R0                      ; 6ACF   0378 0004
        BGT     L_6B64                          ; 6AD1   020E 0091

L_6AD3:
        SDBD                                    ; 6AD3   0001
        CMPI    #$FFFE, R0                      ; 6AD4   0378 00FE 00FF
        BLE     L_6AF7                          ; 6AD7   0206 001E

        MVI     G_016E, R0                      ; 6AD9   0280 016E

        JSR     R5,     .EXEC.76C               ; 6ADB   0004 0114 036C

        ADDI    #$0002, R1                      ; 6ADE   02F9 0002
        MOVR    R1,     R4                      ; 6AE0   008C
        MOVR    R2,     R3                      ; 6AE1   0093
        ANDI    #$00FF, R3                      ; 6AE2   03BB 00FF
        SWAP    R2,     1                       ; 6AE4   0042
        ANDI    #$00FF, R2                      ; 6AE5   03BA 00FF

        JSR     R5,     .EXEC.7A3               ; 6AE7   0004 0114 03A3

        CMPI    #$000E, R2                      ; 6AEA   037A 000E
        BGT     L_6AF7                          ; 6AEC   020E 0009

L_6AEE:
        MVII    #$0001, R0                      ; 6AEE   02B8 0001
        MVI     G_015D, R1                      ; 6AF0   0281 015D

        JSR     R5,     L_D000                  ; 6AF2   0004 01D0 0000

        B       L_692F                          ; 6AF5   0220 01C7

L_6AF7:
        JSR     R5,     L_5EDE                  ; 6AF7   0004 015C 02DE

        BEQ     L_6B6B                          ; 6AFA   0204 006F

        JSR     R5,     .EXEC.76C               ; 6AFC   0004 0114 036C

        ADDI    #$0002, R1                      ; 6AFF   02F9 0002
        MOVR    R1,     R4                      ; 6B01   008C
        MVI     G_016E, R0                      ; 6B02   0280 016E

        JSR     R5,     .EXEC.76C               ; 6B04   0004 0114 036C

        ADDI    #$0002, R1                      ; 6B07   02F9 0002
        MOVR    R1,     R5                      ; 6B09   008D
        MVI@    R5,     R2                      ; 6B0A   02AA
        MVI@    R5,     R3                      ; 6B0B   02AB
        SWAP    R2,     1                       ; 6B0C   0042
        ANDI    #$00FF, R2                      ; 6B0D   03BA 00FF
        SWAP    R3,     1                       ; 6B0F   0043
        ANDI    #$00FF, R3                      ; 6B10   03BB 00FF

        JSR     R5,     .EXEC.7A3               ; 6B12   0004 0114 03A3

        MVII    #$0001, R4                      ; 6B15   02BC 0001
        CMPI    #$0014, R2                      ; 6B17   037A 0014
        BLE     L_6B28                          ; 6B19   0206 000D

        CMPI    #$0018, R2                      ; 6B1B   037A 0018
        BGT     L_6B22                          ; 6B1D   020E 0003

        CLRR    R4                              ; 6B1F   01E4
        B       L_6B28                          ; 6B20   0200 0006

L_6B22:
        CMPI    #$001C, R2                      ; 6B22   037A 001C
        BGE     L_6B6B                          ; 6B24   020D 0045
        B       L_692F                          ; 6B26   0220 01F8

L_6B28:
        MVI     G_016E, R1                      ; 6B28   0281 016E
        ADDI    #$0175, R1                      ; 6B2A   02F9 0175
        MVI@    R1,     R0                      ; 6B2C   0288
        SLR     R0,     2                       ; 6B2D   0064
        SLR     R0,     1                       ; 6B2E   0060
        ANDI    #$0003, R0                      ; 6B2F   03B8 0003
        CMPI    #$0003, R0                      ; 6B31   0378 0003
        BEQ     L_6B3A                          ; 6B33   0204 0005

        TSTR    R3                              ; 6B35   009B
        BMI     L_6B6B                          ; 6B36   020B 0033
        B       L_6B3D                          ; 6B38   0200 0003

L_6B3A:
        TSTR    R3                              ; 6B3A   009B
        BPL     L_6B6B                          ; 6B3B   0203 002E

L_6B3D:
        PSHR    R4                              ; 6B3D   0274
        MVI     G_016E, R0                      ; 6B3E   0280 016E

        JSR     R5,     .EXEC.76C               ; 6B40   0004 0114 036C

        ADDI    #$0007, R1                      ; 6B43   02F9 0007
        MOVR    R1,     R4                      ; 6B45   008C
        ADDI    #$0175, R0                      ; 6B46   02F8 0175
        MOVR    R0,     R1                      ; 6B48   0081
        MVI@    R1,     R0                      ; 6B49   0288
        SLR     R0,     2                       ; 6B4A   0064
        ANDI    #$0006, R0                      ; 6B4B   03B8 0006
        SDBD                                    ; 6B4D   0001
        ADDI    #$6741, R0                      ; 6B4E   02F8 0041 0067
        MOVR    R0,     R5                      ; 6B51   0085
        SDBD                                    ; 6B52   0001
        MVI@    R5,     R2                      ; 6B53   02AA
        MVO@    R2,     R4                      ; 6B54   0262
        SUBI    #$0006, R4                      ; 6B55   033C 0006
        DECR    R5                              ; 6B57   0015
        DECR    R5                              ; 6B58   0015
        MVI@    R5,     R3                      ; 6B59   02AB
        MVI@    R5,     R2                      ; 6B5A   02AA

        JSR     R5,     .EXEC.7A3               ; 6B5B   0004 0114 03A3

        CMPI    #$000E, R2                      ; 6B5E   037A 000E
        PULR    R4                              ; 6B60   02B4
        BLE     L_6AEE                          ; 6B61   0226 0074
        INCR    R7                              ; 6B63   000F

L_6B64:
        PULR    R4                              ; 6B64   02B4
L_6B65:
        TSTR    R4                              ; 6B65   00A4
        BEQ     L_6918                          ; 6B66   0224 024F

        CLRR    R4                              ; 6B68   01E4
        B       L_68EA                          ; 6B69   0220 0280

L_6B6B:
        CLRR    R4                              ; 6B6B   01E4
        B       L_68ED                          ; 6B6C   0220 0280

L_6B6E:
        JSR     R5,     L_5A1A                  ; 6B6E   0004 0158 021A
        JSR     R5,     L_5241                  ; 6B71   0004 0150 0241
        DECLE   $0206,  $0048,  $004F,  $004D   ; 6B74   0206 0048 004F 004D
        DECLE   $0045,  $0020,  $0052,  $0055   ; 6B78   0045 0020 0052 0055
        DECLE   $004E,  $0000                   ; 6B7C   004E 0000

        MVII    #$000A, R0                      ; 6B7E   02B8 000A

        JSR     R5,     X_PLAY_CHEER1           ; 6B80   0004 011C 02D5

        MVI     G_01BF, R0                      ; 6B83   0280 01BF
        ANDI    #$0006, R0                      ; 6B85   03B8 0006
        BEQ     L_6B8C                          ; 6B87   0204 0003

        JSR     R5,     L_5F69                  ; 6B89   0004 015C 0369

L_6B8C:
        CLRR    R0                              ; 6B8C   01C0
        MVO     R0,     G_031E                  ; 6B8D   0240 031E
        DECR    R0                              ; 6B8F   0010
        MVO     R0,     G_0184                  ; 6B90   0240 0184

        JSR     R5,     L_6C4B                  ; 6B92   0004 016C 004B

        B       L_6D12                          ; 6B95   0200 017B

L_6B97:
        MVI     G_01BF, R0                      ; 6B97   0280 01BF
        ANDI    #$0006, R0                      ; 6B99   03B8 0006
        BEQ     L_6BA0                          ; 6B9B   0204 0003

        JSR     R5,     L_5F69                  ; 6B9D   0004 015C 0369

L_6BA0:
        MVI     G_0182, R0                      ; 6BA0   0280 0182
        TSTR    R0                              ; 6BA2   0080
        BEQ     L_6DDE                          ; 6BA3   0204 0239

        JSR     R5,     L_5A1A                  ; 6BA5   0004 0158 021A
        JSR     R5,     X_STOP_SFX              ; 6BA8   0004 011C 02B4
        JSR     R5,     L_5241                  ; 6BAB   0004 0150 0241
        DECLE   $0205,  $0046,  $004F,  $0055   ; 6BAE   0205 0046 004F 0055
        DECLE   $004C,  $0020,  $0042,  $0041   ; 6BB2   004C 0020 0042 0041
        DECLE   $004C,  $004C,  $0021,  $0000   ; 6BB6   004C 004C 0021 0000

        CLRR    R0                              ; 6BBA   01C0
        MVO     R0,     G_031E                  ; 6BBB   0240 031E
        MVO     R0,     G_0182                  ; 6BBD   0240 0182

        JSR     R5,     L_6BCB                  ; 6BBF   0004 0168 03CB

        MVI     G_0161, R0                      ; 6BC2   0280 0161
        CMPI    #$0002, R0                      ; 6BC4   0378 0002
        BEQ     L_6DDE                          ; 6BC6   0204 0216
        J       L_637C                          ; 6BC8   0004 0360 037C

L_6BCB:
        PSHR    R5                              ; 6BCB   0275

L_6BCC:
        JSR     R5,     L_5F69                  ; 6BCC   0004 015C 0369

        MVII    #$0179, R4                      ; 6BCF   02BC 0179
        MVII    #$017D, R5                      ; 6BD1   02BD 017D
L_6BD3:
        MVI@    R4,     R2                      ; 6BD3   02A2
        MVI@    R5,     R3                      ; 6BD4   02AB
        MOVR    R2,     R1                      ; 6BD5   0091
        ANDI    #$0020, R2                      ; 6BD6   03BA 0020
        BNEQ    L_6C3F                          ; 6BD8   020C 0065

        MOVR    R1,     R2                      ; 6BDA   008A
        ANDI    #$0007, R2                      ; 6BDB   03BA 0007
        BEQ     L_6C3F                          ; 6BDD   0204 0060

        PSHR    R5                              ; 6BDF   0275
        PSHR    R1                              ; 6BE0   0271
        PSHR    R0                              ; 6BE1   0270
        MOVR    R2,     R0                      ; 6BE2   0090

        JSR     R5,     .EXEC.76C               ; 6BE3   0004 0114 036C

        PULR    R0                              ; 6BE6   02B0
        INCR    R1                              ; 6BE7   0009
        MVI@    R1,     R5                      ; 6BE8   028D
        SDBD                                    ; 6BE9   0001
        CMPI    #$67AA, R5                      ; 6BEA   037D 00AA 0067
        BEQ     L_6BF9                          ; 6BED   0204 000A

        SDBD                                    ; 6BEF   0001
        CMPI    #$67C5, R5                      ; 6BF0   037D 00C5 0067
        BEQ     L_6BF9                          ; 6BF3   0204 0004

        PULR    R1                              ; 6BF5   02B1
        PULR    R5                              ; 6BF6   02B5
        B       L_6C3F                          ; 6BF7   0200 0046

L_6BF9:
        ADDI    #$0004, R1                      ; 6BF9   02F9 0004
        MVII    #$03F0, R5                      ; 6BFB   02BD 03F0
        MVO@    R5,     R1                      ; 6BFD   024D
        PULR    R1                              ; 6BFE   02B1
        PULR    R5                              ; 6BFF   02B5
        CMP     G_016E, R2                      ; 6C00   0342 016E
        BNEQ    L_6C11                          ; 6C02   020C 000D

        MOVR    R2,     R0                      ; 6C04   0090
        PSHR    R1                              ; 6C05   0271
        PSHR    R5                              ; 6C06   0275

        JSR     R5,     L_6EBF                  ; 6C07   0004 016C 02BF

        PULR    R5                              ; 6C0A   02B5
        PULR    R1                              ; 6C0B   02B1
        BMI     L_6C11                          ; 6C0C   020B 0003

        CMPR    R3,     R0                      ; 6C0E   0158
        BNC     L_6C3F                          ; 6C0F   0209 002E

L_6C11:
        SLR     R1,     2                       ; 6C11   0065
        SLR     R1,     1                       ; 6C12   0061
        ANDI    #$0007, R1                      ; 6C13   03B9 0007
        CMPI    #$0004, R1                      ; 6C15   0379 0004
        BGE     L_6C3F                          ; 6C17   020D 0026

        MOVR    R2,     R0                      ; 6C19   0090
        MOVR    R3,     R1                      ; 6C1A   0099
        CLRR    R2                              ; 6C1B   01D2
        DECR    R1                              ; 6C1C   0011
        PSHR    R5                              ; 6C1D   0275
        BPL     L_6C31                          ; 6C1E   0203 0011

        MVO     R0,     G_0160                  ; 6C20   0240 0160
        MVO     R0,     G_0185                  ; 6C22   0240 0185

        JSR     R5,     L_6EFE                  ; 6C24   0004 016C 02FE

        CLRR    R0                              ; 6C27   01C0
        MVO@    R0,     R5                      ; 6C28   0268
        ANDI    #$0003, R1                      ; 6C29   03B9 0003
        MVI     G_0160, R0                      ; 6C2B   0280 0160
        SDBD                                    ; 6C2D   0001
        MVII    #$FD04, R2                      ; 6C2E   02BA 0004 00FD
L_6C31:
        MOVR    R1,     R5                      ; 6C31   008D
        ADDR    R5,     R5                      ; 6C32   00ED
        SDBD                                    ; 6C33   0001
        ADDI    #$6743, R5                      ; 6C34   02FD 0043 0067
        SDBD                                    ; 6C37   0001
        ADD@    R5,     R2                      ; 6C38   02EA
        MVII    #$0011, R3                      ; 6C39   02BB 0011

        JSR     R5,     L_5F54                  ; 6C3B   0004 015C 0354

        PULR    R5                              ; 6C3E   02B5
L_6C3F:
        CMPI    #$017D, R4                      ; 6C3F   037C 017D
        BNEQ    L_6BD3                          ; 6C41   022C 006F

        JSR     R5,     L_6C4B                  ; 6C43   0004 016C 004B

        MVO     R5,     G_01D7                  ; 6C46   0245 01D7
        MVO     R5,     G_01E4                  ; 6C48   0245 01E4
        PULR    R7                              ; 6C4A   02B7

L_6C4B:
        PSHR    R5                              ; 6C4B   0275

        JSR     R5,     L_64AB                  ; 6C4C   0004 0164 00AB

        CLRR    R0                              ; 6C4F   01C0
        MVO     R0,     G_0167                  ; 6C50   0240 0167
        XOR     G_016E, R0                      ; 6C52   03C0 016E

        JSR     R5,     .EXEC.76C               ; 6C54   0004 0114 036C

        MVII    #$0010, R5                      ; 6C57   02BD 0010
        COMR    R5                              ; 6C59   001D
        AND@    R1,     R5                      ; 6C5A   038D
        MVO@    R5,     R1                      ; 6C5B   024D
        CLRR    R5                              ; 6C5C   01ED
        MVO     R5,     G_016E                  ; 6C5D   0245 016E
        PULR    R7                              ; 6C5F   02B7

L_6C60:
        PSHR    R5                              ; 6C60   0275
        MOVR    R0,     R2                      ; 6C61   0082
        ANDI    #$0007, R0                      ; 6C62   03B8 0007
        BEQ     L_6DDE                          ; 6C64   0204 0178

        MOVR    R2,     R1                      ; 6C66   0091
        ANDI    #$0020, R1                      ; 6C67   03B9 0020
        BNEQ    L_6DDE                          ; 6C69   020C 0173

        JSR     R5,     L_6EBF                  ; 6C6B   0004 016C 02BF

        BMI     L_6C97                          ; 6C6E   020B 0027

        PSHR    R0                              ; 6C70   0270

        JSR     R5,     X_POW2                  ; 6C71   0004 0114 0345

        MOVR    R0,     R3                      ; 6C74   0083
        AND     G_0169, R0                      ; 6C75   0380 0169
        PULR    R0                              ; 6C77   02B0
        BNEQ    L_6CFD                          ; 6C78   020C 0083

        XOR     G_0169, R3                      ; 6C7A   03C3 0169
        MVO     R3,     G_0169                  ; 6C7C   0243 0169
        CMP     G_0168, R0                      ; 6C7E   0340 0168
        BNEQ    L_6C8A                          ; 6C80   020C 0008

        PSHR    R4                              ; 6C82   0274
        MVI     G_01BF, R4                      ; 6C83   0284 01BF
        ANDI    #$0010, R4                      ; 6C85   03BC 0010
        PULR    R4                              ; 6C87   02B4
        BEQ     L_6C90                          ; 6C88   0204 0006

L_6C8A:
        ANDI    #$00BF, R2                      ; 6C8A   03BA 00BF
        XORI    #$0040, R2                      ; 6C8C   03FA 0040
        B       L_6C99                          ; 6C8E   0200 0009

L_6C90:
        MOVR    R2,     R5                      ; 6C90   0095
        ANDI    #$0040, R5                      ; 6C91   03BD 0040
        BEQ     L_6DFA                          ; 6C93   0204 0165
        B       L_6C9B                          ; 6C95   0200 0004

L_6C97:
        ANDI    #$00BF, R2                      ; 6C97   03BA 00BF
L_6C99:
        DECR    R4                              ; 6C99   0014
        MVO@    R2,     R4                      ; 6C9A   0262
L_6C9B:
        SLR     R2,     2                       ; 6C9B   0066
        SLR     R2,     1                       ; 6C9C   0062
        ANDI    #$0003, R2                      ; 6C9D   03BA 0003
        MVI     G_01D6, R5                      ; 6C9F   0285 01D6
        TSTR    R5                              ; 6CA1   00AD
        BEQ     L_6CA9                          ; 6CA2   0204 0005

        MOVR    R4,     R5                      ; 6CA4   00A5
        ADDI    #$0003, R5                      ; 6CA5   02FD 0003
        MVI@    R5,     R2                      ; 6CA7   02AA
        DECR    R2                              ; 6CA8   0012
L_6CA9:
        CMP     G_0168, R2                      ; 6CA9   0342 0168
        BNEQ    L_6DDE                          ; 6CAB   020C 0131

        JSR     R5,     L_6CC5                  ; 6CAD   0004 016C 00C5

        BNEQ    L_6DDE                          ; 6CB0   020C 012C

        MVI     G_0163, R3                      ; 6CB2   0283 0163
        CMPI    #$0002, R3                      ; 6CB4   037B 0002
        BNEQ    L_6CC0                          ; 6CB6   020C 0008

        MVI     G_015D, R3                      ; 6CB8   0283 015D
        ADDI    #$0165, R3                      ; 6CBA   02FB 0165
        MVI@    R3,     R0                      ; 6CBC   0298
        SUB     G_01D4, R0                      ; 6CBD   0300 01D4
        MVO@    R0,     R3                      ; 6CBF   0258
L_6CC0:
        CLRR    R0                              ; 6CC0   01C0
        MVO     R0,     G_01D4                  ; 6CC1   0240 01D4
        B       L_6DFA                          ; 6CC3   0200 0135

L_6CC5:
        PSHR    R5                              ; 6CC5   0275
        MVI     G_01D6, R5                      ; 6CC6   0285 01D6
        TSTR    R5                              ; 6CC8   00AD
        BEQ     L_6CCD                          ; 6CC9   0204 0002

        CLRR    R5                              ; 6CCB   01ED
        PULR    R7                              ; 6CCC   02B7

L_6CCD:
        DECR    R2                              ; 6CCD   0012
        BMI     L_6CF8                          ; 6CCE   020B 0028

        MVII    #$0179, R4                      ; 6CD0   02BC 0179
L_6CD2:
        MVI@    R4,     R0                      ; 6CD2   02A0
        MOVR    R0,     R3                      ; 6CD3   0083
        ANDI    #$0007, R0                      ; 6CD4   03B8 0007
        BEQ     L_6CF2                          ; 6CD6   0204 001A

        PSHR    R1                              ; 6CD8   0271

        JSR     R5,     .EXEC.76C               ; 6CD9   0004 0114 036C

        PULR    R5                              ; 6CDC   02B5
        CMPR    R5,     R1                      ; 6CDD   0169
        BEQ     L_6CF2                          ; 6CDE   0204 0012

        PSHR    R5                              ; 6CE0   0275

        JSR     R5,     L_6EC4                  ; 6CE1   0004 016C 02C4

        PULR    R1                              ; 6CE4   02B1
        CMPR    R2,     R0                      ; 6CE5   0150
        BEQ     L_6DDE                          ; 6CE6   0204 00F6

        TSTR    R0                              ; 6CE8   0080
        BPL     L_6CF2                          ; 6CE9   0203 0007

        SLR     R3,     2                       ; 6CEB   0067
        SLR     R3,     1                       ; 6CEC   0063
        ANDI    #$0007, R3                      ; 6CED   03BB 0007
        CMPR    R3,     R2                      ; 6CEF   015A
        BEQ     L_6DDE                          ; 6CF0   0204 00EC

L_6CF2:
        CMPI    #$017D, R4                      ; 6CF2   037C 017D
        BNEQ    L_6CD2                          ; 6CF4   022C 0023

        TSTR    R4                              ; 6CF6   00A4
        PULR    R7                              ; 6CF7   02B7

L_6CF8:
        MVI     G_01BF, R0                      ; 6CF8   0280 01BF
        ANDI    #$0010, R0                      ; 6CFA   03B8 0010
        PULR    R7                              ; 6CFC   02B7

L_6CFD:
        ANDI    #$0040, R2                      ; 6CFD   03BA 0040
        BEQ     L_6DFA                          ; 6CFF   0204 00F9

        MVII    #$0179, R4                      ; 6D01   02BC 0179
        MOVR    R0,     R2                      ; 6D03   0082
L_6D04:
        MVI@    R4,     R0                      ; 6D04   02A0
        ANDI    #$0007, R0                      ; 6D05   03B8 0007
        BEQ     L_6D04                          ; 6D07   0224 0004

        JSR     R5,     L_6EBF                  ; 6D09   0004 016C 02BF

        CMPR    R0,     R2                      ; 6D0C   0142
        BEQ     L_6DFA                          ; 6D0D   0204 00EB
        B       L_6D04                          ; 6D0F   0220 000C

L_6D11:
        PSHR    R5                              ; 6D11   0275
L_6D12:
        MVII    #$0179, R4                      ; 6D12   02BC 0179
L_6D14:
        MVI@    R4,     R1                      ; 6D14   02A1
        MOVR    R1,     R0                      ; 6D15   0088
        ANDI    #$0007, R0                      ; 6D16   03B8 0007
        BEQ     L_6D39                          ; 6D18   0204 001F

        CMP     G_016E, R0                      ; 6D1A   0340 016E
        BEQ     L_6D39                          ; 6D1C   0204 001B

        MOVR    R1,     R2                      ; 6D1E   008A
        ANDI    #$0020, R2                      ; 6D1F   03BA 0020
        BNEQ    L_6D39                          ; 6D21   020C 0016

        ANDI    #$0018, R1                      ; 6D23   03B9 0018
        SLR     R1,     2                       ; 6D25   0065
        SDBD                                    ; 6D26   0001
        ADDI    #$6743, R1                      ; 6D27   02F9 0043 0067
        MOVR    R1,     R5                      ; 6D2A   008D
        SDBD                                    ; 6D2B   0001
        MVI@    R5,     R2                      ; 6D2C   02AA
        MVII    #$000E, R3                      ; 6D2D   02BB 000E
        MVI     G_0184, R5                      ; 6D2F   0285 0184
        TSTR    R5                              ; 6D31   00AD
        BEQ     L_6D36                          ; 6D32   0204 0002

        MVII    #$001E, R3                      ; 6D34   02BB 001E

L_6D36:
        JSR     R5,     L_5F54                  ; 6D36   0004 015C 0354

L_6D39:
        CMPI    #$017D, R4                      ; 6D39   037C 017D
        BNEQ    L_6D14                          ; 6D3B   022C 0028
        PULR    R7                              ; 6D3D   02B7

L_6D3E:
        NOP                                     ; 6D3E   0034
        NOP                                     ; 6D3F   0034
        NOP                                     ; 6D40   0034
        NOP                                     ; 6D41   0034
        NOP                                     ; 6D42   0034
        PSHR    R5                              ; 6D43   0275
        MVI     G_01BF, R0                      ; 6D44   0280 01BF
        ANDI    #$0006, R0                      ; 6D46   03B8 0006
        BEQ     L_6D7F                          ; 6D48   0204 0035

        CMPI    #$0004, R0                      ; 6D4A   0378 0004
        BNEQ    L_6D7C                          ; 6D4C   020C 002E

        MVI@    R1,     R0                      ; 6D4E   0288
        SDBD                                    ; 6D4F   0001
        ANDI    #$F7FF, R0                      ; 6D50   03B8 00FF 00F7
        MVO@    R0,     R1                      ; 6D53   0248
        SDBD                                    ; 6D54   0001
        MVII    #$A030, R2                      ; 6D55   02BA 0030 00A0
        MVII    #$0011, R3                      ; 6D58   02BB 0011
        ADDI    #$0007, R1                      ; 6D5A   02F9 0007
        CMP@    R1,     R2                      ; 6D5C   034A
        BEQ     L_6D6A                          ; 6D5D   0204 000B

        SUBI    #$0007, R1                      ; 6D5F   0339 0007
        MVI     G_01BF, R5                      ; 6D61   0285 01BF
        XORI    #$0010, R5                      ; 6D63   03FD 0010
        MVO     R5,     G_01BF                  ; 6D65   0245 01BF

        JSR     R5,     L_5F5A                  ; 6D67   0004 015C 035A

L_6D6A:
        SDBD                                    ; 6D6A   0001
        MVII    #$6743, R4                      ; 6D6B   02BC 0043 0067
        SDBD                                    ; 6D6E   0001
        MVI@    R4,     R2                      ; 6D6F   02A2
        SUBI    #$0007, R1                      ; 6D70   0339 0007

        JSR     R5,     L_5F59                  ; 6D72   0004 015C 0359

        MVI     G_01BF, R0                      ; 6D75   0280 01BF
        XORI    #$0002, R0                      ; 6D77   03F8 0002
        MVO     R0,     G_01BF                  ; 6D79   0240 01BF
        PULR    R7                              ; 6D7B   02B7

L_6D7C:
        JSR     R5,     L_5F69                  ; 6D7C   0004 015C 0369

L_6D7F:
        MVI@    R1,     R0                      ; 6D7F   0288
        SDBD                                    ; 6D80   0001
        ANDI    #$F7FF, R0                      ; 6D81   03B8 00FF 00F7
        SDBD                                    ; 6D84   0001
        XORI    #$0800, R0                      ; 6D85   03F8 0000 0008
        MVO@    R0,     R1                      ; 6D88   0248

        JSR     R5,     .EXEC.766               ; 6D89   0004 0114 0366

        MVO     R0,     G_01E6                  ; 6D8C   0240 01E6
        PSHR    R0                              ; 6D8E   0270
        CMP     G_0183, R0                      ; 6D8F   0340 0183
        BEQ     L_6D9E                          ; 6D91   0204 000B

        CMP     G_0185, R0                      ; 6D93   0340 0185
        BNEQ    L_6DAC                          ; 6D95   020C 0015

        JSR     R5,     L_6EFE                  ; 6D97   0004 016C 02FE

        CLRR    R0                              ; 6D9A   01C0
        MVO@    R0,     R5                      ; 6D9B   0268
        PULR    R0                              ; 6D9C   02B0
        PSHR    R0                              ; 6D9D   0270
L_6D9E:
        PSHR    R1                              ; 6D9E   0271
        CLRR    R5                              ; 6D9F   01ED
        MVO     R5,     G_0185                  ; 6DA0   0245 0185
        MVO     R5,     G_0183                  ; 6DA2   0245 0183
        SDBD                                    ; 6DA4   0001
        MVII    #$5028, R1                      ; 6DA5   02B9 0028 0050

        JSR     R5,     X_TIMER_START           ; 6DA8   0004 0118 0044

        PULR    R1                              ; 6DAB   02B1

L_6DAC:
        JSR     R5,     L_64AB                  ; 6DAC   0004 0164 00AB

        PULR    R0                              ; 6DAF   02B0
        MOVR    R1,     R2                      ; 6DB0   008A
        ADDI    #$0004, R2                      ; 6DB1   02FA 0004
        CLRR    R5                              ; 6DB3   01ED
        MVO@    R5,     R2                      ; 6DB4   0255

        JSR     R5,     L_6EFE                  ; 6DB5   0004 016C 02FE

        MOVR    R5,     R2                      ; 6DB8   00AA

        JSR     R5,     L_6EC4                  ; 6DB9   0004 016C 02C4

        BMI     L_6DD9                          ; 6DBC   020B 001B

        CMPI    #$0003, R0                      ; 6DBE   0378 0003
        BEQ     L_6E63                          ; 6DC0   0204 00A1

        MOVR    R0,     R3                      ; 6DC2   0083
        INCR    R0                              ; 6DC3   0008
        SLL     R0,     2                       ; 6DC4   004C
        SLL     R0,     1                       ; 6DC5   0048
        MVI@    R2,     R5                      ; 6DC6   0295
        ANDI    #$0067, R5                      ; 6DC7   03BD 0067
        XORR    R0,     R5                      ; 6DC9   01C5
        MVO@    R5,     R2                      ; 6DCA   0255
        MVI     G_0183, R0                      ; 6DCB   0280 0183
        TSTR    R0                              ; 6DCD   0080
        BEQ     L_6DD9                          ; 6DCE   0204 0009

        MVI     G_01E6, R0                      ; 6DD0   0280 01E6
        CMP     G_016F, R0                      ; 6DD2   0340 016F
        BNEQ    L_6DD9                          ; 6DD4   020C 0003
        J       L_63CA                          ; 6DD6   0004 0360 03CA

L_6DD9:
        MVI     G_0184, R0                      ; 6DD9   0280 0184
        TSTR    R0                              ; 6DDB   0080
        BNEQ    L_6D12                          ; 6DDC   022C 00CB
L_6DDE:
        PULR    R7                              ; 6DDE   02B7

        NOP                                     ; 6DDF   0034
        NOP                                     ; 6DE0   0034
        NOP                                     ; 6DE1   0034
        NOP                                     ; 6DE2   0034
        NOP                                     ; 6DE3   0034
        PSHR    R5                              ; 6DE4   0275
        CMP     G_016E, R3                      ; 6DE5   0343 016E
        BNEQ    L_6DDE                          ; 6DE7   022C 000A

        MOVR    R0,     R5                      ; 6DE9   0085
        ADDI    #$0175, R5                      ; 6DEA   02FD 0175
        MVI@    R5,     R0                      ; 6DEC   02A8
        ANDI    #$0018, R0                      ; 6DED   03B8 0018
        MOVR    R3,     R5                      ; 6DEF   009D
        ADDI    #$0175, R5                      ; 6DF0   02FD 0175
        MVI@    R5,     R5                      ; 6DF2   02AD
        ANDI    #$001E, R5                      ; 6DF3   03BD 001E
        CMPR    R5,     R0                      ; 6DF5   0168
        BNEQ    L_6DDE                          ; 6DF6   022C 0019
        INCR    R7                              ; 6DF8   000F

L_6DF9:
        PSHR    R5                              ; 6DF9   0275
L_6DFA:
        MVI     G_01BF, R0                      ; 6DFA   0280 01BF
        ANDI    #$0016, R0                      ; 6DFC   03B8 0016
        BEQ     L_6E07                          ; 6DFE   0204 0007

        JSR     R5,     L_5F69                  ; 6E00   0004 015C 0369

        MVI     G_016F, R0                      ; 6E03   0280 016F
        MVO     R0,     G_016E                  ; 6E05   0240 016E
L_6E07:
        CLRR    R0                              ; 6E07   01C0
        MVO     R0,     G_01CE                  ; 6E08   0240 01CE
        MVI     G_0186, R0                      ; 6E0A   0280 0186
        TSTR    R0                              ; 6E0C   0080
        BNEQ    L_6DDE                          ; 6E0D   022C 0030

        JSR     R5,     L_6955                  ; 6E0F   0004 0168 0155

        PSHR    R0                              ; 6E12   0270

        JSR     R5,     L_D194                  ; 6E13   0004 01D0 0194
        JSR     R5,     L_5241                  ; 6E16   0004 0150 0241
        DECLE   $0206,  $0059,  $0045,  $0052   ; 6E19   0206 0059 0045 0052
        DECLE   $0020,  $004F,  $0055,  $0054   ; 6E1D   0020 004F 0055 0054
        DECLE   $0021,  $0000                   ; 6E21   0021 0000

        MVI     G_0163, R2                      ; 6E23   0282 0163
        INCR    R2                              ; 6E25   000A
        MVO     R2,     G_0163                  ; 6E26   0242 0163

        JSR     R5,     L_5E7F                  ; 6E28   0004 015C 027F

        PULR    R0                              ; 6E2B   02B0
        SUBI    #$0003, R2                      ; 6E2C   033A 0003
        BMI     L_6DDE                          ; 6E2E   022B 0051

        MVO     R0,     G_0186                  ; 6E30   0240 0186
        MVII    #$033E, R5                      ; 6E32   02BD 033E
L_6E34:
        MVI@    R5,     R1                      ; 6E34   02A9
        ADDI    #$0007, R5                      ; 6E35   02FD 0007
        SDBD                                    ; 6E37   0001
        CMPI    #$67C5, R1                      ; 6E38   0379 00C5 0067
        BNEQ    L_6E44                          ; 6E3B   020C 0007

        SUBI    #$0005, R5                      ; 6E3D   033D 0005
        MVO@    R2,     R5                      ; 6E3F   026A
        INCR    R5                              ; 6E40   000D
        MVO@    R2,     R5                      ; 6E41   026A
        ADDI    #$0002, R5                      ; 6E42   02FD 0002
L_6E44:
        CMPI    #$035E, R5                      ; 6E44   037D 035E
        BNEQ    L_6E34                          ; 6E46   022C 0013

        JSR     R5,     L_6C4B                  ; 6E48   0004 016C 004B
        JSR     R5,     L_5241                  ; 6E4B   0004 0150 0241
        DECLE   $0205,  $0054,  $0048,  $0049   ; 6E4E   0205 0054 0048 0049
        DECLE   $0052,  $0044,  $0020,  $004F   ; 6E52   0052 0044 0020 004F
        DECLE   $0055,  $0054,  $0000           ; 6E56   0055 0054 0000

        MVI     G_01BF, R1                      ; 6E59   0281 01BF
        ANDI    #$00F7, R1                      ; 6E5B   03B9 00F7
        MVO     R1,     G_01BF                  ; 6E5D   0241 01BF
        CLRR    R1                              ; 6E5F   01C9
        MVO     R1,     G_0181                  ; 6E60   0241 0181
        PULR    R7                              ; 6E62   02B7

L_6E63:
        MOVR    R1,     R5                      ; 6E63   008D
        ANDI    #$00FF, R5                      ; 6E64   03BD 00FF
        CMP     G_01E4, R5                      ; 6E66   0345 01E4
        BEQ     L_6DDE                          ; 6E68   0224 008B

        MVO     R1,     G_01E4                  ; 6E6A   0241 01E4
L_6E6C:
        MVI     G_01CE, R0                      ; 6E6C   0280 01CE
        TSTR    R0                              ; 6E6E   0080
        BEQ     L_6E74                          ; 6E6F   0204 0003

        MVI     G_0181, R0                      ; 6E71   0280 0181
        TSTR    R0                              ; 6E73   0080
L_6E74:
        MVO     R0,     G_01D7                  ; 6E74   0240 01D7
        BEQ     L_6E79                          ; 6E76   0204 0001
        PULR    R7                              ; 6E78   02B7

L_6E79:
        MVI     G_01E4, R1                      ; 6E79   0281 01E4
        MVO     R0,     G_01E4                  ; 6E7B   0240 01E4
        ADDI    #$0300, R1                      ; 6E7D   02F9 0300
        MVI     G_01D6, R0                      ; 6E7F   0280 01D6
        TSTR    R0                              ; 6E81   0080
        BNEQ    L_6DDE                          ; 6E82   022C 00A5

        JSR     R5,     L_6955                  ; 6E84   0004 0168 0155

        MVI     G_01D4, R2                      ; 6E87   0282 01D4
        INCR    R2                              ; 6E89   000A
        MVO     R2,     G_01D4                  ; 6E8A   0242 01D4
        MVI     G_015D, R1                      ; 6E8C   0281 015D
        ADDI    #$0165, R1                      ; 6E8E   02F9 0165
        MVI@    R1,     R2                      ; 6E90   028A
        INCR    R2                              ; 6E91   000A
        MVO@    R2,     R1                      ; 6E92   024A

        JSR     R5,     L_5E7F                  ; 6E93   0004 015C 027F

        MVI     G_0164, R0                      ; 6E96   0280 0164
        SARC    R0,     1                       ; 6E98   0078
        BNC     L_6EA3                          ; 6E99   0209 0008

        CMPI    #$0008, R0                      ; 6E9B   0378 0008
        BLT     L_6EA3                          ; 6E9D   0205 0004

        CMP     G_0165, R2                      ; 6E9F   0342 0165
        BGT     L_6EBC                          ; 6EA1   020E 0019

L_6EA3:
        MVII    #$0002, R0                      ; 6EA3   02B8 0002

        JSR     R5,     X_PLAY_CHEER1           ; 6EA5   0004 011C 02D5

        MVII    #$0080, R0                      ; 6EA8   02B8 0080
        CMP     G_0146, R0                      ; 6EAA   0340 0146
        BNEQ    L_6DDE                          ; 6EAC   022C 00CF

        INCR    R0                              ; 6EAE   0008
        MVO     R0,     G_0146                  ; 6EAF   0240 0146
        PULR    R7                              ; 6EB1   02B7

        JSR     R5,     L_64AB                  ; 6EB2   0004 0164 00AB

        PULR    R0                              ; 6EB5   02B0
        SUB     G_0186, R0                      ; 6EB6   0300 0186
        BNEQ    L_6DDE                          ; 6EB8   022C 00DB

        MVO     R0,     G_0186                  ; 6EBA   0240 0186
L_6EBC:
        J       L_6429                          ; 6EBC   0004 0364 0029

L_6EBF:
        PSHR    R5                              ; 6EBF   0275

        JSR     R5,     .EXEC.76C               ; 6EC0   0004 0114 036C

        INCR    R7                              ; 6EC3   000F

L_6EC4:
        PSHR    R5                              ; 6EC4   0275

L_6EC5:
        JSR     R5,     .EXEC.7C1               ; 6EC5   0004 0114 03C1

        SDBD                                    ; 6EC8   0001
        MVII    #$6743, R4                      ; 6EC9   02BC 0043 0067
L_6ECC:
        SDBD                                    ; 6ECC   0001
        MVI@    R4,     R2                      ; 6ECD   02A2
        PSHR    R4                              ; 6ECE   0274
        MVII    #$0202, R4                      ; 6ECF   02BC 0202
        ADDR    R4,     R4                      ; 6ED1   00E4

        JSR     R5,     .EXEC.6F7               ; 6ED2   0004 0114 02F7

        PULR    R4                              ; 6ED5   02B4
        BC      L_6EE1                          ; 6ED6   0201 0009

        SDBD                                    ; 6ED8   0001
        CMPI    #$674B, R4                      ; 6ED9   037C 004B 0067
        BNEQ    L_6ECC                          ; 6EDC   022C 0011

L_6EDE:
        CLRR    R0                              ; 6EDE   01C0
        DECR    R0                              ; 6EDF   0010
        PULR    R7                              ; 6EE0   02B7

L_6EE1:
        MOVR    R4,     R2                      ; 6EE1   00A2
        SDBD                                    ; 6EE2   0001
        SUBI    #$6745, R2                      ; 6EE3   033A 0045 0067
        SLR     R2,     1                       ; 6EE6   0062
        CMPI    #$0003, R2                      ; 6EE7   037A 0003
        BNEQ    L_6EF7                          ; 6EE9   020C 000C

        CMPI    #$033D, R1                      ; 6EEB   0379 033D
        BLT     L_6EF7                          ; 6EED   0205 0008

        JSR     R5,     L_6EF9                  ; 6EEF   0004 016C 02F9

        MVI@    R5,     R1                      ; 6EF2   02A9
        ANDI    #$0018, R1                      ; 6EF3   03B9 0018
        BEQ     L_6EDE                          ; 6EF5   0224 0018

L_6EF7:
        MOVR    R2,     R0                      ; 6EF7   0090
        PULR    R7                              ; 6EF8   02B7

L_6EF9:
        PSHR    R5                              ; 6EF9   0275

        JSR     R5,     .EXEC.766               ; 6EFA   0004 0114 0366

        INCR    R7                              ; 6EFD   000F

L_6EFE:
        PSHR    R5                              ; 6EFE   0275
L_6EFF:
        MOVR    R0,     R5                      ; 6EFF   0085
        ADDI    #$0175, R5                      ; 6F00   02FD 0175
        PSHR    R0                              ; 6F02   0270
        MVI@    R5,     R0                      ; 6F03   02A8
        DECR    R5                              ; 6F04   0015
        COMR    R0                              ; 6F05   0018
        SLR     R0,     2                       ; 6F06   0064
        RRC     R0,     1                       ; 6F07   0070
        PULR    R0                              ; 6F08   02B0
        PULR    R7                              ; 6F09   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F0A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F0E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F12   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F16   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F1A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F1E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F22   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F26   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F2A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F2E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F32   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F36   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F3A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F3E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F42   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F46   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F4A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F4E   0000 0000 0000 0000
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
L_D000:
        NOP                                     ; D000   0034
        NOP                                     ; D001   0034
        NOP                                     ; D002   0034
        NOP                                     ; D003   0034
        NOP                                     ; D004   0034
        PSHR    R5                              ; D005   0275
        CMP     G_015D, R1                      ; D006   0341 015D
        BNEQ    L_D154                          ; D008   020C 014A

        PSHR    R0                              ; D00A   0270
        MVI     G_016E, R2                      ; D00B   0282 016E
        TSTR    R2                              ; D00D   0092
        BEQ     L_D155                          ; D00E   0204 0145

        MVI     G_01BF, R0                      ; D010   0280 01BF
        MOVR    R0,     R3                      ; D012   0083
        ANDI    #$0006, R0                      ; D013   03B8 0006
        BNEQ    L_D155                          ; D015   020C 013E

        MOVR    R2,     R0                      ; D017   0090

        JSR     R5,     L_6EBF                  ; D018   0004 016C 02BF

        BPL     L_D155                          ; D01B   0203 0138

        ADDI    #$0007, R1                      ; D01D   02F9 0007
        MOVR    R2,     R0                      ; D01F   0090

        JSR     R5,     L_6EFE                  ; D020   0004 016C 02FE

        MVI@    R5,     R0                      ; D023   02A8
        ANDI    #$0018, R0                      ; D024   03B8 0018
        PULR    R0                              ; D026   02B0
        BEQ     L_D127                          ; D027   0204 00FE

        DECR    R0                              ; D029   0010
        BNEQ    L_D154                          ; D02A   020C 0128

        MVI@    R1,     R0                      ; D02C   0288
        SDBD                                    ; D02D   0001
        CMPI    #$9039, R0                      ; D02E   0378 0039 0090
        BEQ     L_D045                          ; D031   0204 0012

        SDBD                                    ; D033   0001
        CMPI    #$5424, R0                      ; D034   0378 0024 0054
        BEQ     L_D045                          ; D037   0204 000C

        SDBD                                    ; D039   0001
        CMPI    #$1839, R0                      ; D03A   0378 0039 0018
        BEQ     L_D045                          ; D03D   0204 0006

        SDBD                                    ; D03F   0001
        CMPI    #$5455, R0                      ; D040   0378 0055 0054
        BNEQ    L_D154                          ; D043   020C 010F

L_D045:
        MVI     G_016C, R3                      ; D045   0283 016C
        COMR    R3                              ; D047   001B
        ANDI    #$00F0, R3                      ; D048   03BB 00F0
        BEQ     L_D096                          ; D04A   0204 004A

        ANDI    #$0010, R3                      ; D04C   03BB 0010
        ADD     G_0185, R3                      ; D04E   02C3 0185
        BNEQ    L_D096                          ; D050   020C 0044

        PSHR    R0                              ; D052   0270

        JSR     R5,     L_5207                  ; D053   0004 0150 0207
        JSR     R5,     .EXEC.76C               ; D056   0004 0114 036C

        MOVR    R0,     R3                      ; D059   0083
        MVII    #$0008, R0                      ; D05A   02B8 0008
        MVII    #$033D, R4                      ; D05C   02BC 033D

        JSR     R5,     .EXEC.730               ; D05E   0004 0114 0330

        MVII    #$0004, R0                      ; D061   02B8 0004

        JSR     R5,     L_521C                  ; D063   0004 0150 021C

        CMPI    #$0004, R2                      ; D066   037A 0004
        BNEQ    L_D06E                          ; D068   020C 0004

        MVO     R3,     G_016E                  ; D06A   0243 016E
        MVO     R3,     G_016F                  ; D06C   0243 016F
L_D06E:
        MVI     G_0179, R4                      ; D06E   0284 0179
        TSTR    R4                              ; D070   00A4
        BEQ     L_D076                          ; D071   0204 0003

        ANDI    #$00F8, R4                      ; D073   03BC 00F8
        XORR    R3,     R4                      ; D075   01DC
L_D076:
        MVII    #$0175, R2                      ; D076   02BA 0175
        ADDR    R3,     R2                      ; D078   00DA
        MVI@    R2,     R0                      ; D079   0290
        MVO     R0,     G_0179                  ; D07A   0240 0179
        MVO@    R4,     R2                      ; D07C   0254
        ADDI    #$0004, R2                      ; D07D   02FA 0004
        MVI     G_017D, R0                      ; D07F   0280 017D
        MVI@    R2,     R4                      ; D081   0294
        MVO@    R0,     R2                      ; D082   0250
        MVO     R4,     G_017D                  ; D083   0244 017D
        MVI     G_0160, R2                      ; D085   0282 0160
        CMPI    #$0004, R2                      ; D087   037A 0004
        BNEQ    L_D08D                          ; D089   020C 0002

        MVO     R3,     G_0160                  ; D08B   0243 0160
L_D08D:
        MVI     G_016E, R2                      ; D08D   0282 016E
        MOVR    R2,     R0                      ; D08F   0090

        JSR     R5,     .EXEC.76C               ; D090   0004 0114 036C

        ADDI    #$0007, R1                      ; D093   02F9 0007
        PULR    R0                              ; D095   02B0
L_D096:
        MVO     R2,     G_016F                  ; D096   0242 016F
        MVI     G_01BF, R3                      ; D098   0283 01BF
        XORI    #$0002, R3                      ; D09A   03FB 0002
        MVO     R3,     G_01BF                  ; D09C   0243 01BF
        SDBD                                    ; D09E   0001
        CMPI    #$9039, R0                      ; D09F   0378 0039 0090
        BEQ     L_D0D0                          ; D0A2   0204 002C

        SDBD                                    ; D0A4   0001
        CMPI    #$5455, R0                      ; D0A5   0378 0055 0054
        BEQ     L_D0D0                          ; D0A8   0204 0026

        SDBD                                    ; D0AA   0001
        CMPI    #$5424, R0                      ; D0AB   0378 0024 0054
        BEQ     L_D0BD                          ; D0AE   0204 000D

        PSHR    R0                              ; D0B0   0270
        MOVR    R2,     R0                      ; D0B1   0090

        JSR     R5,     L_6EFE                  ; D0B2   0004 016C 02FE

        MVI@    R5,     R0                      ; D0B5   02A8
        ANDI    #$0018, R0                      ; D0B6   03B8 0018
        CMPI    #$0010, R0                      ; D0B8   0378 0010
        PULR    R0                              ; D0BA   02B0
        BEQ     L_D0D0                          ; D0BB   0204 0013

L_D0BD:
        SUBI    #$0002, R1                      ; D0BD   0339 0002
        CLRR    R5                              ; D0BF   01ED
        MVO     R5,     G_01E7                  ; D0C0   0245 01E7
        MVII    #$0008, R4                      ; D0C2   02BC 0008

        JSR     R5,     L_D0D8                  ; D0C4   0004 01D0 00D8

        BEQ     L_D154                          ; D0C7   0204 008B

        SDBD                                    ; D0C9   0001
        MVII    #$682A, R0                      ; D0CA   02B8 002A 0068
        MVO     R0,     G_033E                  ; D0CD   0240 033E
        PULR    R7                              ; D0CF   02B7

L_D0D0:
        SUBI    #$0002, R1                      ; D0D0   0339 0002
        CLRR    R5                              ; D0D2   01ED
        MVO     R5,     G_01E7                  ; D0D3   0245 01E7
        MVII    #$0009, R4                      ; D0D5   02BC 0009
        INCR    R7                              ; D0D7   000F

L_D0D8:
        PSHR    R5                              ; D0D8   0275
L_D0D9:
        MVO@    R4,     R1                      ; D0D9   024C
        SUBI    #$0004, R1                      ; D0DA   0339 0004
        DECR    R1                              ; D0DC   0011
        MVII    #$0017, R3                      ; D0DD   02BB 0017
        MOVR    R0,     R2                      ; D0DF   0082

        JSR     R5,     L_5F59                  ; D0E0   0004 015C 0359

        CLRR    R0                              ; D0E3   01C0
        MVO     R0,     G_016E                  ; D0E4   0240 016E
        MVI     G_016C, R0                      ; D0E6   0280 016C
        COMR    R0                              ; D0E8   0018
        ANDI    #$0010, R0                      ; D0E9   03B8 0010
        BEQ     L_D154                          ; D0EB   0204 0067

        JSR     R5,     L_5207                  ; D0ED   0004 0150 0207

        MOVR    R1,     R4                      ; D0F0   008C
        MVII    #$033D, R5                      ; D0F1   02BD 033D
        SDBD                                    ; D0F3   0001
        MVII    #$3050, R3                      ; D0F4   02BB 0050 0030
        MVO@    R3,     R5                      ; D0F7   026B
        SDBD                                    ; D0F8   0001
        MVII    #$684B, R3                      ; D0F9   02BB 004B 0068
        MVO@    R3,     R5                      ; D0FC   026B
        ADDI    #$0002, R4                      ; D0FD   02FC 0002
        MVI@    R4,     R0                      ; D0FF   02A0
        MOVR    R0,     R3                      ; D100   0083
        SWAP    R3,     1                       ; D101   0043
        ANDI    #$00FF, R3                      ; D102   03BB 00FF
        MOVR    R2,     R1                      ; D104   0091
        SWAP    R1,     1                       ; D105   0041
        ANDI    #$00FF, R1                      ; D106   03B9 00FF
        CMPR    R3,     R1                      ; D108   0159
        MVI     G_033D, R3                      ; D109   0283 033D
        BLT     L_D113                          ; D10B   0205 0006

        SDBD                                    ; D10D   0001
        SUBI    #$0900, R0                      ; D10E   0338 0000 0009
        XORI    #$0200, R3                      ; D111   03FB 0200
L_D113:
        MVO     R3,     G_033D                  ; D113   0243 033D
        MVO@    R0,     R5                      ; D115   0268
        MVI@    R4,     R0                      ; D116   02A0
        MVI     G_01E7, R3                      ; D117   0283 01E7
        SWAP    R3,     1                       ; D119   0043
        ADDR    R3,     R0                      ; D11A   00D8
        MVO@    R0,     R5                      ; D11B   0268
        CLRR    R3                              ; D11C   01DB
        MVO@    R3,     R5                      ; D11D   026B
        MVO@    R3,     R5                      ; D11E   026B
        MVO@    R3,     R5                      ; D11F   026B
        MVII    #$0017, R3                      ; D120   02BB 0017
        MVII    #$033D, R1                      ; D122   02B9 033D
        J       L_5F5A                          ; D124   0004 035C 035A

L_D127:
        TSTR    R0                              ; D127   0080
        BMI     L_D154                          ; D128   020B 002A

        MOVR    R3,     R0                      ; D12A   0098
        ANDI    #$0006, R0                      ; D12B   03B8 0006
        BNEQ    L_D154                          ; D12D   020C 0025

        PSHR    R1                              ; D12F   0271
        PSHR    R2                              ; D130   0272
        PSHR    R3                              ; D131   0273
        MOVR    R1,     R4                      ; D132   008C
        SUBI    #$0005, R4                      ; D133   033C 0005
        MVII    #$0090, R2                      ; D135   02BA 0090
        MVII    #$0039, R3                      ; D137   02BB 0039

        JSR     R5,     .EXEC.7A3               ; D139   0004 0114 03A3

        CMPI    #$0018, R2                      ; D13C   037A 0018
        PULR    R3                              ; D13E   02B3
        PULR    R2                              ; D13F   02B2
        PULR    R1                              ; D140   02B1
        BGT     L_D154                          ; D141   020E 0011

        MVO     R2,     G_016F                  ; D143   0242 016F
        XORI    #$0004, R3                      ; D145   03FB 0004
        MVO     R3,     G_01BF                  ; D147   0243 01BF
        MVI@    R1,     R2                      ; D149   028A
        MVII    #$001E, R3                      ; D14A   02BB 001E
        SUBI    #$0007, R1                      ; D14C   0339 0007

        JSR     R5,     L_5F59                  ; D14E   0004 015C 0359

        CLRR    R0                              ; D151   01C0
        MVO     R0,     G_016E                  ; D152   0240 016E
L_D154:
        PULR    R7                              ; D154   02B7

L_D155:
        PULR    R0                              ; D155   02B0
        PULR    R7                              ; D156   02B7

L_D157:
        PSHR    R5                              ; D157   0275

        JSR     R5,     X_PLAY_SFX1             ; D158   0004 0118 03BB
        DECLE   $0079                           ; D15B  SFX data
        DECLE   $03B7                           ; D15C  SFX data
        DECLE   $000C,  $0080                   ; D15D  SFX data
        DECLE   $010D                           ; D15F  SFX data
        DECLE   $010B                           ; D160  SFX data
        DECLE   $03CF                           ; D161  SFX end

L_D162:
        PSHR    R5                              ; D162   0275

        JSR     R5,     X_PLAY_SFX1             ; D163   0004 0118 03BB
        DECLE   $0079                           ; D166  SFX data
        DECLE   $001C,  $0000                   ; D167  SFX data
        DECLE   $010D                           ; D169  SFX data
        DECLE   $0035                           ; D16A  SFX data
        DECLE   $006E                           ; D16B  SFX data
        DECLE   $02EB                           ; D16C  SFX data
        DECLE   $03AE                           ; D16D  SFX data
        DECLE   $02EB                           ; D16E  SFX data
        DECLE   $03CF                           ; D16F  SFX end

L_D170:
        PSHR    R5                              ; D170   0275

        JSR     R5,     X_PLAY_SFX1             ; D171   0004 0118 03BB
        DECLE   $010D                           ; D174  SFX data
        DECLE   $03B7                           ; D175  SFX data
        DECLE   $000B                           ; D176  SFX data
        DECLE   $01EB                           ; D177  SFX data
        DECLE   $000C,  $0080                   ; D178  SFX data
        DECLE   $03E9                           ; D17A  SFX data
        DECLE   $0380,  $0180                   ; D17B  SFX data
        DECLE   $0001,  $03F4                   ; D17D  SFX data
        DECLE   $004F,  $000A                   ; D17F  SFX data
        DECLE   $0303,  $03F8                   ; D181  SFX data
        DECLE   $02CF                           ; D183  SFX end

L_D184:
        PSHR    R5                              ; D184   0275
        CLRR    R0                              ; D185   01C0
        MVO     R0,     G_0146                  ; D186   0240 0146

        JSR     R5,     X_PLAY_SFX1             ; D188   0004 0118 03BB
        DECLE   $03E9                           ; D18B  SFX data
        DECLE   $0340,  $0340                   ; D18C  SFX data
        DECLE   $0001,  $03F0                   ; D18E  SFX data
        DECLE   $031D                           ; D190  SFX data
        DECLE   $0303,  $03F8                   ; D191  SFX data
        DECLE   $02CF                           ; D193  SFX end

L_D194:
        PSHR    R5                              ; D194   0275

        JSR     R5,     X_PLAY_SFX2             ; D195   0004 0118 03BE
        DECLE   $0081                           ; D198  SFX prio
        DECLE   $03C9                           ; D199  SFX data
        DECLE   $000C,  $0078                   ; D19A  SFX data
        DECLE   $0035                           ; D19C  SFX data
        DECLE   $008F,  $0017                   ; D19D  SFX data
        DECLE   $020B                           ; D19F  SFX data
        DECLE   $0040,  $01A0                   ; D1A0  SFX data
        DECLE   $0048,  $0040                   ; D1A2  SFX data
        DECLE   $0001,  $03C0                   ; D1A4  SFX data
        DECLE   $0001,  $0012                   ; D1A6  SFX data
        DECLE   $02AB                           ; D1A8  SFX data
        DECLE   $0001,  $0003                   ; D1A9  SFX data
        DECLE   $000C,  $007C                   ; D1AB  SFX data
        DECLE   $036B                           ; D1AD  SFX data
        DECLE   $000C,  $0074                   ; D1AE  SFX data
        DECLE   $0001,  $03C0                   ; D1B0  SFX data
        DECLE   $0001,  $0012                   ; D1B2  SFX data
        DECLE   $012B                           ; D1B4  SFX data
        DECLE   $0001,  $0060                   ; D1B5  SFX data
        DECLE   $0001,  $000E                   ; D1B7  SFX data
        DECLE   $016B                           ; D1B9  SFX data
        DECLE   $000C,  $00A0                   ; D1BA  SFX data
        DECLE   $016B                           ; D1BC  SFX data
        DECLE   $02CF                           ; D1BD  SFX end

L_D1BE:
        PSHR    R5                              ; D1BE   0275

        JSR     R5,     X_PLAY_SFX2             ; D1BF   0004 0118 03BE
        DECLE   $0084                           ; D1C2  SFX prio
        DECLE   $0048,  $0328                   ; D1C3  SFX data
        DECLE   $001B                           ; D1C5  SFX data
        DECLE   $0040,  $0340                   ; D1C6  SFX data
        DECLE   $0044,  $033D                   ; D1C8  SFX data
        DECLE   $0389                           ; D1CA  SFX data
        DECLE   $000C,  $0108                   ; D1CB  SFX data
        DECLE   $000B                           ; D1CD  SFX data
        DECLE   $03CF                           ; D1CE  SFX end

L_D1CF:
        PSHR    R5                              ; D1CF   0275

        JSR     R5,     L_5B3D                  ; D1D0   0004 0158 033D

        BEQ     L_D1DA                          ; D1D3   0204 0005
        BPL     L_D210                          ; D1D5   0203 0039

        TSTR    R5                              ; D1D7   00AD
        BNEQ    L_D210                          ; D1D8   020C 0036

L_D1DA:
        MVI     G_016D, R1                      ; D1DA   0281 016D
        SWAP    R1,     1                       ; D1DC   0041
        SLLC    R1,     2                       ; D1DD   005D
        SLR     R1,     2                       ; D1DE   0065
        SWAP    R1,     1                       ; D1DF   0041
        BNC     L_D210                          ; D1E0   0209 002E

        ADDI    #$0170, R1                      ; D1E2   02F9 0170
        MVI@    R1,     R0                      ; D1E4   0288
        ANDI    #$0003, R0                      ; D1E5   03B8 0003

        JSR     R5,     .EXEC.76C               ; D1E7   0004 0114 036C

        MOVR    R1,     R2                      ; D1EA   008A
        ADDI    #$0003, R2                      ; D1EB   02FA 0003
        MVI     G_015D, R1                      ; D1ED   0281 015D
        XORI    #$0001, R1                      ; D1EF   03F9 0001
        ADDI    #$011F, R1                      ; D1F1   02F9 011F
        MVI@    R1,     R1                      ; D1F3   0289
        SWAP    R1,     1                       ; D1F4   0041
        SLLC    R1,     2                       ; D1F5   005D
        SLR     R1,     2                       ; D1F6   0065
        SWAP    R1,     1                       ; D1F7   0041
        BC      L_D210                          ; D1F8   0201 0016
        BOV     L_D20C                          ; D1FA   0202 0010

        MVI@    R2,     R0                      ; D1FC   0290
        SWAP    R0,     1                       ; D1FD   0040
        ANDI    #$00FF, R0                      ; D1FE   03B8 00FF
        CMPI    #$001C, R0                      ; D200   0378 001C
        MVII    #$000F, R0                      ; D202   02B8 000F
        BGT     L_D208                          ; D204   020E 0002

        MVII    #$000B, R0                      ; D206   02B8 000B

L_D208:
        JSR     R5,     .EXEC.629               ; D208   0004 0114 0229

        INCR    R7                              ; D20B   000F

L_D20C:
        CLRR    R0                              ; D20C   01C0
L_D20D:
        ADDI    #$0001, R2                      ; D20D   02FA 0001
        MVO@    R0,     R2                      ; D20F   0250
L_D210:
        MVII    #$0007, R0                      ; D210   02B8 0007
L_D212:
        PSHR    R0                              ; D212   0270

        JSR     R5,     L_D21B                  ; D213   0004 01D0 021B

        PULR    R0                              ; D216   02B0
        DECR    R0                              ; D217   0010
        BPL     L_D212                          ; D218   0223 0007
L_D21A:
        PULR    R7                              ; D21A   02B7

L_D21B:
        PSHR    R5                              ; D21B   0275

        JSR     R5,     .EXEC.76C               ; D21C   0004 0114 036C

        INCR    R1                              ; D21F   0009
        MVI@    R1,     R3                      ; D220   028B
        MVII    #$0006, R2                      ; D221   02BA 0006

        JSR     R5,     L_D232                  ; D223   0004 01D0 0232
        BIDECLE $67F5                           ; D226   00F5 0067
        DECLE   $00BF                           ; D228   00BF

        SLR     R3,     2                       ; D229   0067
        ADDR    R3,     R2                      ; D22A   00DA
        SLR     R3,     2                       ; D22B   0067
        ADDR    R0,     R5                      ; D22C   00C5
        SLR     R3,     2                       ; D22D   0067
        ADDR    R0,     R5                      ; D22E   00C5
        SLR     R3,     2                       ; D22F   0067
        MOVR    R5,     R2                      ; D230   00AA
        SLR     R3,     2                       ; D231   0067
L_D232:
        MOVR    R5,     R4                      ; D232   00AC
L_D233:
        SDBD                                    ; D233   0001
        CMP@    R5,     R3                      ; D234   036B
        BEQ     L_D23B                          ; D235   0204 0004

        DECR    R2                              ; D237   0012
        BNEQ    L_D233                          ; D238   022C 0006
        PULR    R7                              ; D23A   02B7

L_D23B:
        CMPI    #$0004, R2                      ; D23B   037A 0004
        BGE     L_D241                          ; D23D   020D 0002

        ADDI    #$0006, R4                      ; D23F   02FC 0006
L_D241:
        ADDI    #$0003, R1                      ; D241   02F9 0003
        MVI@    R1,     R0                      ; D243   0288
        MOVR    R0,     R5                      ; D244   0085
        MOVR    R0,     R2                      ; D245   0082
        BEQ     L_D26A                          ; D246   0204 0022

        ANDI    #$00FF, R2                      ; D248   03BA 00FF
        XORR    R2,     R0                      ; D24A   01D0
        BPL     L_D24E                          ; D24B   0203 0001

        NEGR    R0                              ; D24D   0020
L_D24E:
        SWAP    R2,     1                       ; D24E   0042
        TSTR    R2                              ; D24F   0092
        BPL     L_D253                          ; D250   0203 0001

        NEGR    R2                              ; D252   0022
L_D253:
        SLR     R2,     1                       ; D253   0062
        CMPR    R2,     R0                      ; D254   0150
        SDBD                                    ; D255   0001
        MVI@    R4,     R2                      ; D256   02A2
        BLT     L_D26E                          ; D257   0205 0015

        SDBD                                    ; D259   0001
        MVI@    R4,     R2                      ; D25A   02A2
        SUBI    #$0004, R1                      ; D25B   0339 0004
        MVII    #$0200, R0                      ; D25D   02B8 0200
        COMR    R0                              ; D25F   0018
        AND@    R1,     R0                      ; D260   0388
        TSTR    R5                              ; D261   00AD
        BPL     L_D266                          ; D262   0203 0002

        XORI    #$0200, R0                      ; D264   03F8 0200
L_D266:
        MVO@    R0,     R1                      ; D266   0248
        INCR    R1                              ; D267   0009
        MVO@    R2,     R1                      ; D268   024A
        PULR    R7                              ; D269   02B7

L_D26A:
        ADDI    #$0004, R4                      ; D26A   02FC 0004
        SDBD                                    ; D26C   0001
        MVI@    R4,     R2                      ; D26D   02A2
L_D26E:
        CMPR    R2,     R3                      ; D26E   0153
        BEQ     L_D21A                          ; D26F   0224 0056

        INCR    R1                              ; D271   0009
        MVII    #$03F0, R0                      ; D272   02B8 03F0
        MVO@    R0,     R1                      ; D274   0248
        SUBI    #$0004, R1                      ; D275   0339 0004
        MVO@    R2,     R1                      ; D277   024A
        PULR    R7                              ; D278   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; D279   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D27D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D281   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D285   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D289   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D28D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D291   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D295   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D299   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D29D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2A1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0050,  $0000   ; D2A5   0000 0000 0050 0000
        DECLE   $0060,  $0000,  $0000,  $0000   ; D2A9   0060 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2AD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2B1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2B5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2B9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2BD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2C1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2C5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2C9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2CD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2D1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2D5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2D9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2DD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2E1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2E5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2E9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2ED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2F1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2F5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2F9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2FD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D301   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D305   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D309   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D30D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D311   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D315   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D319   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D31D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D321   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D325   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D329   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D32D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D331   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D335   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D339   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D33D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D341   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D345   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D349   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D34D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D351   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D355   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D359   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D35D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D361   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D365   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D369   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D36D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D371   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D375   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D379   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D37D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D381   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D385   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D389   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D38D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D391   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D395   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D399   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D39D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D3A1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D3A5   0000 0000 0000
L_D3A8:
        MVII    #$0001, R0                      ; D3A8   02B8 0001
        B       L_D748                          ; D3AA   0200 039C

L_D3AC:
        MVII    #$001F, R0                      ; D3AC   02B8 001F
        CMP     .PSG0.rgt_hand,R0               ; D3AE   0340 01FE
        BEQ     L_D73D                          ; D3B0   0204 038B

        CMP     .PSG0.lft_hand,R0               ; D3B2   0340 01FF
        BEQ     L_D73D                          ; D3B4   0204 0387

        JSR     R5,     L_D9EE                  ; D3B6   0004 01D8 01EE

        B       L_D3A8                          ; D3B9   0220 0012

L_D3BB:
        MVII    #$0002, R0                      ; D3BB   02B8 0002
        B       L_D748                          ; D3BD   0200 0389

L_D3BF:
        MVII    #$001F, R0                      ; D3BF   02B8 001F
        CMP     .PSG0.rgt_hand,R0               ; D3C1   0340 01FE
        BEQ     L_D73D                          ; D3C3   0204 0378

        CMP     .PSG0.lft_hand,R0               ; D3C5   0340 01FF
        BEQ     L_D73D                          ; D3C7   0204 0374

        SDBD                                    ; D3C9   0001
        MVII    #$D28C, R5                      ; D3CA   02BD 008C 00D2
        SDBD                                    ; D3CD   0001
        MVI@    R5,     R0                      ; D3CE   02A8
        SWAP    R0,     1                       ; D3CF   0040
        ANDI    #$00F0, R0                      ; D3D0   03B8 00F0
        CMPI    #$0010, R0                      ; D3D2   0378 0010
        BNEQ    L_D73D                          ; D3D4   020C 0367

        JSR     R5,     L_D9EE                  ; D3D6   0004 01D8 01EE

        B       L_D3BB                          ; D3D9   0220 001F

        SDBD                                    ; D3DB   0001
        MVII    #$D28A, R5                      ; D3DC   02BD 008A 00D2
        MVI@    R5,     R0                      ; D3DF   02A8
        MVI@    R5,     R1                      ; D3E0   02A9
        SDBD                                    ; D3E1   0001
        MVII    #$D2B5, R4                      ; D3E2   02BC 00B5 00D2
        MVO@    R0,     R4                      ; D3E5   0260
        MVO@    R1,     R4                      ; D3E6   0261
L_D3E7:
        MVII    #$0003, R0                      ; D3E7   02B8 0003
        B       L_D748                          ; D3E9   0200 035D

L_D3EB:
        MVII    #$001F, R0                      ; D3EB   02B8 001F
        CMP     .PSG0.rgt_hand,R0               ; D3ED   0340 01FE
        BEQ     L_D73D                          ; D3EF   0204 034C

        CMP     .PSG0.lft_hand,R0               ; D3F1   0340 01FF
        BEQ     L_D73D                          ; D3F3   0204 0348

        SDBD                                    ; D3F5   0001
        MVII    #$D2B5, R5                      ; D3F6   02BD 00B5 00D2
        SDBD                                    ; D3F9   0001
        MVII    #$D28A, R4                      ; D3FA   02BC 008A 00D2
        SDBD                                    ; D3FD   0001
        MVI@    R5,     R0                      ; D3FE   02A8
        SDBD                                    ; D3FF   0001
        CMP@    R4,     R0                      ; D400   0360
        BC      L_D73D                          ; D401   0201 033A

        JSR     R5,     L_D9EE                  ; D403   0004 01D8 01EE

        B       L_D3E7                          ; D406   0220 0020

        PSHR    R5                              ; D408   0275
        PSHR    R4                              ; D409   0274
        PSHR    R0                              ; D40A   0270
        MVII    #$000C, R0                      ; D40B   02B8 000C
        SDBD                                    ; D40D   0001
        MVII    #$D2AA, R4                      ; D40E   02BC 00AA 00D2
        MVO@    R0,     R4                      ; D411   0260
        B       L_D466                          ; D412   0200 0052

        PSHR    R5                              ; D414   0275
        PSHR    R4                              ; D415   0274
        PSHR    R0                              ; D416   0270
        MVII    #$000D, R0                      ; D417   02B8 000D
        SDBD                                    ; D419   0001
        MVII    #$D2AA, R4                      ; D41A   02BC 00AA 00D2
        MVO@    R0,     R4                      ; D41D   0260
        B       L_D466                          ; D41E   0200 0046

        PSHR    R5                              ; D420   0275
        PSHR    R4                              ; D421   0274
        PSHR    R0                              ; D422   0270
        MVII    #$000E, R0                      ; D423   02B8 000E
        SDBD                                    ; D425   0001
        MVII    #$D2AA, R4                      ; D426   02BC 00AA 00D2
        MVO@    R0,     R4                      ; D429   0260
        B       L_D466                          ; D42A   0200 003A

        DECLE   $0275,  $0274,  $0270,  $02B8   ; D42C   0275 0274 0270 02B8
        DECLE   $000F,  $0001                   ; D430   000F 0001

        MVII    #$00AA, R4                      ; D432   02BC 00AA
        ADDR    R2,     R2                      ; D434   00D2
        MVO@    R0,     R4                      ; D435   0260
        B       L_D466                          ; D436   0200 002E

        PSHR    R5                              ; D438   0275
        PSHR    R4                              ; D439   0274
        PSHR    R0                              ; D43A   0270
        MVII    #$0010, R0                      ; D43B   02B8 0010
        SDBD                                    ; D43D   0001
        MVII    #$D2AA, R4                      ; D43E   02BC 00AA 00D2
        MVO@    R0,     R4                      ; D441   0260
        B       L_D466                          ; D442   0200 0022

        PSHR    R5                              ; D444   0275
        PSHR    R4                              ; D445   0274
        PSHR    R0                              ; D446   0270
        MVII    #$0011, R0                      ; D447   02B8 0011
        SDBD                                    ; D449   0001
        MVII    #$D2AA, R4                      ; D44A   02BC 00AA 00D2
        MVO@    R0,     R4                      ; D44D   0260
        B       L_D466                          ; D44E   0200 0016

        PSHR    R5                              ; D450   0275
        PSHR    R4                              ; D451   0274
        PSHR    R0                              ; D452   0270
        MVII    #$0012, R0                      ; D453   02B8 0012
        SDBD                                    ; D455   0001
        MVII    #$D2AA, R4                      ; D456   02BC 00AA 00D2
        MVO@    R0,     R4                      ; D459   0260
        B       L_D466                          ; D45A   0200 000A

        PSHR    R5                              ; D45C   0275
        PSHR    R4                              ; D45D   0274
        PSHR    R0                              ; D45E   0270
        MVII    #$0013, R0                      ; D45F   02B8 0013
        SDBD                                    ; D461   0001
        MVII    #$D2AA, R4                      ; D462   02BC 00AA 00D2
        MVO@    R0,     R4                      ; D465   0260
L_D466:
        GSWD    R0                              ; D466   0030
        PSHR    R0                              ; D467   0270
        SDBD                                    ; D468   0001
        MVII    #$D2AC, R5                      ; D469   02BD 00AC 00D2
        MVI@    R5,     R0                      ; D46C   02A8
        TSTR    R0                              ; D46D   0080
        BEQ     L_D4A0                          ; D46E   0204 0030

        SDBD                                    ; D470   0001
        MVII    #$D2AA, R5                      ; D471   02BD 00AA 00D2
        MVI@    R5,     R0                      ; D474   02A8
        SLL     R0,     1                       ; D475   0048
        MOVR    R0,     R5                      ; D476   0085
        SDBD                                    ; D477   0001
        ADDI    #$D27E, R5                      ; D478   02FD 007E 00D2
        MVI@    R5,     R0                      ; D47B   02A8
        ANDI    #$0001, R0                      ; D47C   03B8 0001
        BEQ     L_D4A0                          ; D47E   0204 0020
        B       L_D487                          ; D480   0200 0005

        PSHR    R5                              ; D482   0275
        PSHR    R4                              ; D483   0274
        PSHR    R0                              ; D484   0270
        GSWD    R0                              ; D485   0030
        PSHR    R0                              ; D486   0270
L_D487:
        SDBD                                    ; D487   0001
        MVII    #$D2B4, R5                      ; D488   02BD 00B4 00D2
        MVI@    R5,     R0                      ; D48B   02A8
        TSTR    R0                              ; D48C   0080
        BNEQ    L_D4A0                          ; D48D   020C 0011
        B       L_D4A5                          ; D48F   0200 0014

        PSHR    R5                              ; D491   0275
        PSHR    R4                              ; D492   0274
        PSHR    R0                              ; D493   0270
        GSWD    R0                              ; D494   0030
        PSHR    R0                              ; D495   0270
        MVII    #$001F, R0                      ; D496   02B8 001F
        CMP     .PSG0.rgt_hand,R0               ; D498   0340 01FE
        BEQ     L_D4A5                          ; D49A   0204 0009

        CMP     .PSG0.lft_hand,R0               ; D49C   0340 01FF
        BEQ     L_D4A5                          ; D49E   0204 0005

L_D4A0:
        PULR    R0                              ; D4A0   02B0
        RSWD    R0                              ; D4A1   0038
        PULR    R0                              ; D4A2   02B0
        PULR    R4                              ; D4A3   02B4
        PULR    R7                              ; D4A4   02B7

L_D4A5:
        MVI     .PSG0.lft_hand,R0               ; D4A5   0280 01FF
        AND     .PSG0.rgt_hand,R0               ; D4A7   0380 01FE
        CMPI    #$00FF, R0                      ; D4A9   0378 00FF
        BNEQ    L_D4A5                          ; D4AB   022C 0007

        MOVR    R6,     R5                      ; D4AD   00B5
        SUBI    #$0004, R5                      ; D4AE   033D 0004
        MVI@    R5,     R0                      ; D4B0   02A8
        SDBD                                    ; D4B1   0001
        MVII    #$D28C, R5                      ; D4B2   02BD 008C 00D2
        INCR    R0                              ; D4B5   0008
        MVO@    R0,     R5                      ; D4B6   0268
        SWAP    R0,     1                       ; D4B7   0040
        MVO@    R0,     R5                      ; D4B8   0268
        SDBD                                    ; D4B9   0001
        MVII    #$D2B7, R5                      ; D4BA   02BD 00B7 00D2
        CLRR    R0                              ; D4BD   01C0
        MVO@    R0,     R5                      ; D4BE   0268
        PULR    R0                              ; D4BF   02B0
        RSWD    R0                              ; D4C0   0038
        PULR    R0                              ; D4C1   02B0
        PULR    R4                              ; D4C2   02B4
        PULR    R5                              ; D4C3   02B5
        PULR    R5                              ; D4C4   02B5
        J       L_D8D3                          ; D4C5   0004 03D8 00D3

        SAR     R2,     2                       ; D4C8   006E
        SAR     R2,     2                       ; D4C9   006E
        SAR     R2,     2                       ; D4CA   006E
        SAR     R2,     2                       ; D4CB   006E
        SAR     R2,     2                       ; D4CC   006E
        SAR     R2,     2                       ; D4CD   006E
        SAR     R2,     2                       ; D4CE   006E
        SAR     R2,     2                       ; D4CF   006E
        SAR     R2,     2                       ; D4D0   006E
        SAR     R2,     2                       ; D4D1   006E
        MOVR    R0,     R7                      ; D4D2   0087
        MOVR    R1,     R7                      ; D4D3   008F
        MOVR    R2,     R7                      ; D4D4   0097
        MOVR    R3,     R7                      ; D4D5   009F
        MOVR    R4,     R7                      ; D4D6   00A7
        MOVR    R5,     R7                      ; D4D7   00AF

        DECLE   $00B7,  $00BF,  $019F,  $01D7   ; D4D8   00B7 00BF 019F 01D7
        DECLE   $01B7,  $011F,  $0112,  $0192   ; D4DC   01B7 011F 0112 0192
        DECLE   $015A,  $019A,  $0216,  $022A   ; D4E0   015A 019A 0216 022A
        DECLE   $023E,  $0252,  $021D,  $0231   ; D4E4   023E 0252 021D 0231
        DECLE   $0245,  $0259,  $0269,  $0272   ; D4E8   0245 0259 0269 0272
        DECLE   $0215,  $0229,  $023D,  $0251   ; D4EC   0215 0229 023D 0251
        DECLE   $021C,  $0230,  $0244,  $0258   ; D4F0   021C 0230 0244 0258
        DECLE   $0223,  $0224,  $0225,  $0226   ; D4F4   0223 0224 0225 0226
        DECLE   $024B,  $024C,  $024D,  $024E   ; D4F8   024B 024C 024D 024E
        DECLE   $0000,  $0000,  $0000,  $0007   ; D4FC   0000 0000 0000 0007
        DECLE   $0217,  $0002,  $0000,  $0000   ; D500   0217 0002 0000 0000
        DECLE   $0007,  $022B,  $0004,  $0000   ; D504   0007 022B 0004 0000
        DECLE   $0000,  $0007,  $023F,  $0006   ; D508   0000 0007 023F 0006
        DECLE   $0000,  $0000,  $0007,  $0253   ; D50C   0000 0000 0007 0253
        DECLE   $0008,  $0000,  $0000,  $0007   ; D510   0008 0000 0000 0007
        DECLE   $021E,  $000A,  $0000,  $0000   ; D514   021E 000A 0000 0000
        DECLE   $0007,  $0232,  $000C,  $0000   ; D518   0007 0232 000C 0000
        DECLE   $0000,  $0007,  $0246,  $000E   ; D51C   0000 0007 0246 000E
        DECLE   $0000,  $0000,  $0007,  $025A   ; D520   0000 0000 0007 025A
        DECLE   $0010,  $0001,  $0000,  $0007   ; D524   0010 0001 0000 0007
        DECLE   $0237,  $0012,  $0001,  $0000   ; D528   0237 0012 0001 0000
        DECLE   $0007,  $0238,  $0014,  $0001   ; D52C   0007 0238 0014 0001
        DECLE   $0000,  $0007,  $0239,  $0016   ; D530   0000 0007 0239 0016
        DECLE   $0001,  $0000,  $0007,  $023A   ; D534   0001 0000 0007 023A
        DECLE   $0018,  $0003,  $0000,  $0002   ; D538   0018 0003 0000 0002
        DECLE   $0261,  $001A,  $0003,  $0000   ; D53C   0261 001A 0003 0000
        DECLE   $0002,  $0261,  $001C,  $0003   ; D540   0002 0261 001C 0003
        DECLE   $0000,  $0002,  $0261,  $001E   ; D544   0000 0002 0261 001E
        DECLE   $0003,  $0000,  $0002,  $0261   ; D548   0003 0000 0002 0261
        DECLE   $0020,  $0003,  $0000,  $0002   ; D54C   0020 0003 0000 0002
        DECLE   $0261,  $0022,  $0003,  $0000   ; D550   0261 0022 0003 0000
        DECLE   $0002,  $0261,  $0024,  $0003   ; D554   0002 0261 0024 0003
        DECLE   $0000,  $0002,  $0261,  $0026   ; D558   0000 0002 0261 0026
        DECLE   $0003,  $0000,  $0002,  $0261   ; D55C   0003 0000 0002 0261
        DECLE   $0028,  $0000,  $0000,  $0002   ; D560   0028 0000 0000 0002
        DECLE   $0265,  $0028,  $0000,  $0001   ; D564   0265 0028 0000 0001
        DECLE   $0002,  $026A,  $002A,  $0000   ; D568   0002 026A 002A 0000
        DECLE   $0000,  $0000,  $026E,  $002A   ; D56C   0000 0000 026E 002A
        DECLE   $0000,  $0001,  $0000,  $0273   ; D570   0000 0001 0000 0273
        DECLE   $00FF                           ; D574   00FF
L_D575:
        CLRR    R0                              ; D575   01C0
        SDBD                                    ; D576   0001
        MVII    #$D2B4, R3                      ; D577   02BB 00B4 00D2
        MVO@    R0,     R3                      ; D57A   0258
        SDBD                                    ; D57B   0001
        MVII    #$D2AB, R3                      ; D57C   02BB 00AB 00D2
        MVO@    R0,     R3                      ; D57F   0258
L_D580:
        MVI     G_0102, R0                      ; D580   0280 0102
        TSTR    R0                              ; D582   0080
        BNEQ    L_D580                          ; D583   022C 0004

        JSR     R5,     L_D9EE                  ; D585   0004 01D8 01EE

L_D588:
        MVII    #$0004, R0                      ; D588   02B8 0004
L_D58A:
        SDBD                                    ; D58A   0001
        MVII    #$D279, R3                      ; D58B   02BB 0079 00D2
        MVO@    R0,     R3                      ; D58E   0258
        MVII    #$0300, R0                      ; D58F   02B8 0300
L_D591:
        DECR    R0                              ; D591   0010
        BNEQ    L_D591                          ; D592   022C 0002

        SDBD                                    ; D594   0001
        MVII    #$D27B, R3                      ; D595   02BB 007B 00D2
        MVI     .PSG0.lft_hand,R1               ; D598   0281 01FF
        CMP@    R3,     R1                      ; D59A   0359
        MVO@    R1,     R3                      ; D59B   0259
        BNEQ    L_D588                          ; D59C   022C 0015

        MVI     .PSG0.rgt_hand,R1               ; D59E   0281 01FE
        DECR    R3                              ; D5A0   0013
        CMP@    R3,     R1                      ; D5A1   0359
        MVO@    R1,     R3                      ; D5A2   0259
        BNEQ    L_D588                          ; D5A3   022C 001C

        DECR    R3                              ; D5A5   0013
        MVI@    R3,     R0                      ; D5A6   0298
        DECR    R0                              ; D5A7   0010
        BNEQ    L_D58A                          ; D5A8   022C 001F

        ADDI    #$0002, R3                      ; D5AA   02FB 0002
        MVI@    R3,     R1                      ; D5AC   0299

        JSR     R5,     L_D97D                  ; D5AD   0004 01D8 017D

        TSTR    R0                              ; D5B0   0080
        BMI     L_D5BB                          ; D5B1   020B 0008

        CMPI    #$000A, R0                      ; D5B3   0378 000A
        BNC     L_D5E5                          ; D5B5   0209 002E

        ADDI    #$000C, R0                      ; D5B7   02F8 000C
        B       L_D5E5                          ; D5B9   0200 002A

L_D5BB:
        DECR    R3                              ; D5BB   0013
        MVI@    R3,     R1                      ; D5BC   0299

        JSR     R5,     L_D97D                  ; D5BD   0004 01D8 017D

        TSTR    R0                              ; D5C0   0080
        BMI     L_D5CB                          ; D5C1   020B 0008
        BNEQ    L_D5C7                          ; D5C3   020C 0002

        ADDI    #$000C, R0                      ; D5C5   02F8 000C
L_D5C7:
        ADDI    #$0009, R0                      ; D5C7   02F8 0009
        B       L_D5E5                          ; D5C9   0200 001A

L_D5CB:
        MVI@    R3,     R1                      ; D5CB   0299
        INCR    R3                              ; D5CC   000B
        AND@    R3,     R1                      ; D5CD   0399

        JSR     R5,     L_D969                  ; D5CE   0004 01D8 0169

        TSTR    R0                              ; D5D1   0080
        BMI     L_D5D8                          ; D5D2   020B 0004

        ADDI    #$0019, R0                      ; D5D4   02F8 0019
        B       L_D5E5                          ; D5D6   0200 000D

L_D5D8:
        MVI@    R3,     R1                      ; D5D8   0299
        DECR    R3                              ; D5D9   0013
        AND@    R3,     R1                      ; D5DA   0399

        JSR     R5,     L_D93E                  ; D5DB   0004 01D8 013E

        TSTR    R0                              ; D5DE   0080
        MVII    #$0018, R0                      ; D5DF   02B8 0018
        BPL     L_D5E5                          ; D5E1   0203 0002

        MVII    #$001C, R0                      ; D5E3   02B8 001C
L_D5E5:
        SDBD                                    ; D5E5   0001
        MVII    #$D27C, R3                      ; D5E6   02BB 007C 00D2
        CMP@    R3,     R0                      ; D5E9   0358
        MVO@    R0,     R3                      ; D5EA   0258
        BEQ     L_D588                          ; D5EB   0224 0064

        MOVR    R0,     R5                      ; D5ED   0085
        ADDR    R0,     R5                      ; D5EE   00C5
        SDBD                                    ; D5EF   0001
        ADDI    #$D60F, R5                      ; D5F0   02FD 000F 00D6
        SDBD                                    ; D5F3   0001
        MVI@    R5,     R7                      ; D5F4   02AF

L_D5F5:
        PSHR    R5                              ; D5F5   0275
        SDBD                                    ; D5F6   0001
        MVII    #$D2AB, R5                      ; D5F7   02BD 00AB 00D2
        MVO@    R3,     R5                      ; D5FA   026B
        SDBD                                    ; D5FB   0001
        MVII    #$D28C, R5                      ; D5FC   02BD 008C 00D2
        SDBD                                    ; D5FF   0001
        MVI@    R5,     R3                      ; D600   02AB
        SDBD                                    ; D601   0001
        MVI@    R4,     R0                      ; D602   02A0
        DECR    R5                              ; D603   0015
        DECR    R5                              ; D604   0015
        DECR    R4                              ; D605   0014
        DECR    R4                              ; D606   0014
        MVO@    R0,     R5                      ; D607   0268
        SWAP    R0,     1                       ; D608   0040
        MVO@    R0,     R5                      ; D609   0268
        NOP                                     ; D60A   0034
        MVO@    R3,     R4                      ; D60B   0263
        SWAP    R3,     1                       ; D60C   0043
        MVO@    R3,     R4                      ; D60D   0263
        PULR    R7                              ; D60E   02B7

        DECLE   $00C9,  $00D6,  $00C9,  $00D6   ; D60F   00C9 00D6 00C9 00D6
        DECLE   $00C9,  $00D6,  $00C9,  $00D6   ; D613   00C9 00D6 00C9 00D6
        DECLE   $00C9,  $00D6,  $00C9,  $00D6   ; D617   00C9 00D6 00C9 00D6
        DECLE   $00C9,  $00D6,  $00C9,  $00D6   ; D61B   00C9 00D6 00C9 00D6
        DECLE   $00C9,  $00D6,  $00C9,  $00D6   ; D61F   00C9 00D6 00C9 00D6
        DECLE   $00C9,  $00D6,  $00C9,  $00D6   ; D623   00C9 00D6 00C9 00D6
        DECLE   $00C9,  $00D6,  $00C9,  $00D6   ; D627   00C9 00D6 00C9 00D6
        DECLE   $00C9,  $00D6,  $00C9,  $00D6   ; D62B   00C9 00D6 00C9 00D6
        DECLE   $00C0,  $00D6,  $0074,  $00D6   ; D62F   00C0 00D6 0074 00D6
        DECLE   $007A,  $00D6,  $0049,  $00D6   ; D633   007A 00D6 0049 00D6
        DECLE   $00A8,  $00D3,  $004C,  $00D6   ; D637   00A8 00D3 004C 00D6
        DECLE   $00DB,  $00D3,  $00BB,  $00D3   ; D63B   00DB 00D3 00BB 00D3
        DECLE   $0004                           ; D63F   0004

        ADDR    R2,     R7                      ; D640   00D7

        SWAP    R3,     2                       ; D641   0047
        ADDR    R2,     R7                      ; D642   00D7

        NEGR    R1                              ; D643   0021
        ADDR    R2,     R7                      ; D644   00D7

        DECR    R4                              ; D645   0014
        ADDR    R2,     R7                      ; D646   00D7

        RRC     R1,     2                       ; D647   0075
        ADDR    R2,     R5                      ; D648   00D5
        MVII    #$0001, R0                      ; D649   02B8 0001
        INCR    R7                              ; D64B   000F

        CLRR    R0                              ; D64C   01C0
L_D64D:
        SDBD                                    ; D64D   0001
        MVII    #$D2AC, R5                      ; D64E   02BD 00AC 00D2
        MVO@    R0,     R5                      ; D651   0268
        SDBD                                    ; D652   0001
        MVII    #$D2AD, R5                      ; D653   02BD 00AD 00D2
        MVII    #$0004, R0                      ; D656   02B8 0004
        MVO@    R0,     R5                      ; D658   0268
        SDBD                                    ; D659   0001
        MVII    #$D28C, R4                      ; D65A   02BC 008C 00D2
        SDBD                                    ; D65D   0001
        MVI@    R4,     R0                      ; D65E   02A0
        MOVR    R0,     R1                      ; D65F   0081
        SWAP    R0,     1                       ; D660   0040
        ANDI    #$00FC, R0                      ; D661   03B8 00FC
        XORI    #$0300, R0                      ; D663   03F8 0300
        MVO@    R0,     R5                      ; D665   0268
        MVO@    R1,     R5                      ; D666   0269
        CLRR    R0                              ; D667   01C0
L_D668:
        DECR    R0                              ; D668   0010
        BNEQ    L_D668                          ; D669   022C 0002

        SDBD                                    ; D66B   0001
        MVII    #$D2B7, R5                      ; D66C   02BD 00B7 00D2
        CLRR    R0                              ; D66F   01C0
        MVO@    R0,     R5                      ; D670   0268
        J       L_D88D                          ; D671   0004 03D8 008D

        CLRR    R0                              ; D674   01C0

        JSR     R5,     L_D6D5                  ; D675   0004 01D4 02D5

        B       L_D575                          ; D678   0220 0104

        JSR     R5,     L_D6F0                  ; D67A   0004 01D4 02F0

        INCR    R0                              ; D67D   0008
        SDBD                                    ; D67E   0001
        MVII    #$D2AA, R5                      ; D67F   02BD 00AA 00D2
        MVI@    R5,     R1                      ; D682   02A9
        CMPI    #$0007, R1                      ; D683   0379 0007
        BNEQ    L_D6BB                          ; D685   020C 0034

        SDBD                                    ; D687   0001
        MVII    #$D28C, R4                      ; D688   02BC 008C 00D2
        SDBD                                    ; D68B   0001
        MVI@    R4,     R3                      ; D68C   02A3
        MVI@    R3,     R1                      ; D68D   0299
        CMPI    #$0004, R1                      ; D68E   0379 0004
        BNEQ    L_D696                          ; D690   020C 0004

        ADDI    #$0002, R0                      ; D692   02F8 0002
        B       L_D6BB                          ; D694   0200 0025

L_D696:
        CMPI    #$0001, R1                      ; D696   0379 0001
        BNEQ    L_D6A5                          ; D698   020C 000B

        INCR    R0                              ; D69A   0008
        INCR    R3                              ; D69B   000B
        MVI@    R3,     R1                      ; D69C   0299
        ANDI    #$0038, R1                      ; D69D   03B9 0038
        CMPI    #$0038, R1                      ; D69F   0379 0038
        BNEQ    L_D6BB                          ; D6A1   020C 0018

        ADDI    #$0002, R0                      ; D6A3   02F8 0002
L_D6A5:
        CMPI    #$0200, R1                      ; D6A5   0379 0200
        BNC     L_D6BB                          ; D6A7   0209 0012

        CMPI    #$0240, R1                      ; D6A9   0379 0240
        BC      L_D6B0                          ; D6AB   0201 0003

        INCR    R0                              ; D6AD   0008
        B       L_D6BB                          ; D6AE   0200 000B

L_D6B0:
        ANDI    #$0038, R1                      ; D6B0   03B9 0038
        BNEQ    L_D6B7                          ; D6B2   020C 0003

L_D6B4:
        INCR    R0                              ; D6B4   0008
        B       L_D6BB                          ; D6B5   0200 0004

L_D6B7:
        CMPI    #$0038, R1                      ; D6B7   0379 0038
        BEQ     L_D6B4                          ; D6B9   0224 0006

L_D6BB:
        JSR     R5,     L_D6D5                  ; D6BB   0004 01D4 02D5

        B       L_D575                          ; D6BE   0220 014A

        JSR     R5,     L_D6F0                  ; D6C0   0004 01D4 02F0

        DECR    R0                              ; D6C3   0010

        JSR     R5,     L_D6D5                  ; D6C4   0004 01D4 02D5

        B       L_D575                          ; D6C7   0220 0153

        PSHR    R0                              ; D6C9   0270

        JSR     R5,     L_D6F0                  ; D6CA   0004 01D4 02F0

        SLL     R0,     2                       ; D6CD   004C
        SLL     R0,     2                       ; D6CE   004C
        ADD@    R6,     R0                      ; D6CF   02F0

        JSR     R5,     L_D6D5                  ; D6D0   0004 01D4 02D5

        B       L_D575                          ; D6D3   0220 015F

L_D6D5:
        PSHR    R5                              ; D6D5   0275

        JSR     R5,     L_D9CB                  ; D6D6   0004 01D8 01CB

        TSTR    R2                              ; D6D9   0092
        BEQ     L_D6E6                          ; D6DA   0204 000A

        SDBD                                    ; D6DC   0001
        MVI@    R4,     R1                      ; D6DD   02A1

        JSR     R5,     L_DD9F                  ; D6DE   0004 01DC 019F

        MVO@    R0,     R1                      ; D6E1   0248

        JSR     R5,     L_DD9F                  ; D6E2   0004 01DC 019F

        PULR    R7                              ; D6E5   02B7

L_D6E6:
        MOVR    R0,     R1                      ; D6E6   0081
        MOVR    R0,     R2                      ; D6E7   0082
        SWAP    R2,     1                       ; D6E8   0042
        ANDI    #$00FF, R1                      ; D6E9   03B9 00FF
        ANDI    #$00FF, R2                      ; D6EB   03BA 00FF
        MVO@    R1,     R4                      ; D6ED   0261
        MVO@    R2,     R4                      ; D6EE   0262
        PULR    R7                              ; D6EF   02B7

L_D6F0:
        PSHR    R5                              ; D6F0   0275

        JSR     R5,     L_D9CB                  ; D6F1   0004 01D8 01CB

        TSTR    R2                              ; D6F4   0092
        BEQ     L_D701                          ; D6F5   0204 000A

        SDBD                                    ; D6F7   0001
        MVI@    R4,     R1                      ; D6F8   02A1

        JSR     R5,     L_DD9F                  ; D6F9   0004 01DC 019F

        MVI@    R1,     R0                      ; D6FC   0288

        JSR     R5,     L_DD9F                  ; D6FD   0004 01DC 019F

        PULR    R7                              ; D700   02B7

L_D701:
        SDBD                                    ; D701   0001
        MVI@    R4,     R0                      ; D702   02A0
        PULR    R7                              ; D703   02B7

        JSR     R5,     L_DD9F                  ; D704   0004 01DC 019F

L_D707:
        MVI     .PSG0.lft_hand,R0               ; D707   0280 01FF
        AND     .PSG0.rgt_hand,R0               ; D709   0380 01FE
        CMPI    #$00FF, R0                      ; D70B   0378 00FF
        BNEQ    L_D707                          ; D70D   022C 0007

        JSR     R5,     L_DD9F                  ; D70F   0004 01DC 019F

        B       L_D575                          ; D712   0220 019E

        SDBD                                    ; D714   0001
        MVII    #$D2AA, R3                      ; D715   02BB 00AA 00D2
        MVI@    R3,     R0                      ; D718   0298
        INCR    R0                              ; D719   0008
        CMPI    #$0018, R0                      ; D71A   0378 0018
        BNEQ    L_D72B                          ; D71C   020C 000D

        CLRR    R0                              ; D71E   01C0
        B       L_D72B                          ; D71F   0200 000A

        SDBD                                    ; D721   0001
        MVII    #$D2AA, R3                      ; D722   02BB 00AA 00D2
        MVI@    R3,     R0                      ; D725   0298
        DECR    R0                              ; D726   0010
        BPL     L_D72B                          ; D727   0203 0002

        MVII    #$0017, R0                      ; D729   02B8 0017
L_D72B:
        MVO@    R0,     R3                      ; D72B   0258
        B       L_D575                          ; D72C   0220 01B8

L_D72E:
        SDBD                                    ; D72E   0001
        MVII    #$D2B7, R3                      ; D72F   02BB 00B7 00D2
        MVI@    R3,     R0                      ; D732   0298
        SLL     R0,     1                       ; D733   0048
        ADDR    R0,     R7                      ; D734   00C7
        B       L_D575                          ; D735   0220 01C1
        B       L_D3AC                          ; D737   0220 038C
        B       L_D3BF                          ; D739   0220 037B
        B       L_D3EB                          ; D73B   0220 0351

L_D73D:
        MVI     .PSG0.rgt_hand,R0               ; D73D   0280 01FE
        AND     .PSG0.lft_hand,R0               ; D73F   0380 01FF
        CMPI    #$00FF, R0                      ; D741   0378 00FF
        BNEQ    L_D73D                          ; D743   022C 0007
        B       L_D575                          ; D745   0220 01D1

        CLRR    R0                              ; D747   01C0
L_D748:
        SDBD                                    ; D748   0001
        MVII    #$D2B7, R3                      ; D749   02BB 00B7 00D2
        MVO@    R0,     R3                      ; D74C   0258
        MVII    #$0001, R0                      ; D74D   02B8 0001
        SDBD                                    ; D74F   0001
        MVII    #$D2B4, R3                      ; D750   02BB 00B4 00D2
        MVO@    R0,     R3                      ; D753   0258
        SDBD                                    ; D754   0001
        MVII    #$D2AB, R5                      ; D755   02BD 00AB 00D2
        CLRR    R0                              ; D758   01C0
        MVO@    R0,     R5                      ; D759   0268
        SDBD                                    ; D75A   0001
        MVII    #$D2AD, R4                      ; D75B   02BC 00AD 00D2
        SDBD                                    ; D75E   0001
        MVII    #$D28C, R5                      ; D75F   02BD 008C 00D2
        SDBD                                    ; D762   0001
        MVI@    R5,     R3                      ; D763   02AB
        MVI@    R3,     R2                      ; D764   029A
        CMPI    #$0004, R2                      ; D765   037A 0004
        BNEQ    L_D787                          ; D767   020C 001E

        INCR    R3                              ; D769   000B
        MVI@    R3,     R1                      ; D76A   0299
        INCR    R3                              ; D76B   000B
        MVI@    R3,     R0                      ; D76C   0298
        INCR    R3                              ; D76D   000B
        SLR     R1,     2                       ; D76E   0065
        SLL     R1,     2                       ; D76F   004D
        SWAP    R1,     1                       ; D770   0041
        MOVR    R1,     R4                      ; D771   008C
        ANDI    #$0003, R4                      ; D772   03BC 0003
        XORR    R4,     R1                      ; D774   01E1
        XORR    R0,     R1                      ; D775   01C1
        ADDR    R4,     R4                      ; D776   00E4
        SDBD                                    ; D777   0001
        ADDI    #$D286, R4                      ; D778   02FC 0086 00D2
        MVO@    R3,     R4                      ; D77B   0263
        SWAP    R3,     1                       ; D77C   0043
        MVO@    R3,     R4                      ; D77D   0263
        SDBD                                    ; D77E   0001
        MVII    #$D28C, R4                      ; D77F   02BC 008C 00D2
        MVO@    R1,     R4                      ; D782   0261
        SWAP    R1,     1                       ; D783   0041
        MVO@    R1,     R4                      ; D784   0261
        B       L_D72E                          ; D785   0220 0058

L_D787:
        MOVR    R2,     R1                      ; D787   0091
        DECLE   $03B9,  $03C0,  $0379,  $0200   ; D788   03B9 03C0 0379 0200
        DECLE   $020C,  $0047,  $0093,  $03BB   ; D78C   020C 0047 0093 03BB
        DECLE   $0020,  $01DA,  $0262,  $0001   ; D790   0020 01DA 0262 0001
        DECLE   $02BD,  $00D0,  $00D7,  $02B8   ; D794   02BD 00D0 00D7 02B8
        DECLE   $0005,  $02A9,  $0261,  $0010   ; D798   0005 02A9 0261 0010
        DECLE   $022C,  $0004,  $01C0,  $02BA   ; D79C   022C 0004 01C0 02BA
        DECLE   $0004,  $0001,  $02BD,  $008E   ; D7A0   0004 0001 02BD 008E
        DECLE   $00D2,  $0001,  $02A9,  $03B9   ; D7A4   00D2 0001 02A9 03B9
        DECLE   $0001,  $01C8,  $0048,  $0012   ; D7A8   0001 01C8 0048 0012
        DECLE   $022C,  $0008,  $004C,  $0048   ; D7AC   022C 0008 004C 0048
        DECLE   $0038,  $02B8,  $0000,  $0004   ; D7B0   0038 02B8 0000 0004

        XOR@    R2,     R0                      ; D7B4   03D0
        MVI@    R5,     R5                      ; D7B5   02AD
L_D7B6:
        SDBD                                    ; D7B6   0001
        MVII    #$D28C, R5                      ; D7B7   02BD 008C 00D2
        SDBD                                    ; D7BA   0001
        MVI@    R5,     R1                      ; D7BB   02A9
        ADDI    #$0002, R1                      ; D7BC   02F9 0002
        SUBI    #$0002, R5                      ; D7BE   033D 0002
        TSTR    R0                              ; D7C0   0080
        BNEQ    L_D7CB                          ; D7C1   020C 0008

        DECR    R1                              ; D7C3   0011
        MVI@    R1,     R4                      ; D7C4   028C
        INCR    R1                              ; D7C5   0009
        TSTR    R3                              ; D7C6   009B
        BEQ     L_D7CA                          ; D7C7   0204 0001

        COMR    R4                              ; D7C9   001C
L_D7CA:
        ADDR    R4,     R1                      ; D7CA   00E1
L_D7CB:
        MVO@    R1,     R5                      ; D7CB   0269
        SWAP    R1,     1                       ; D7CC   0041
        MVO@    R1,     R5                      ; D7CD   0269
        B       L_D72E                          ; D7CE   0220 00A1

        DECLE   $0001                           ; D7D0   0001

        INCR    R0                              ; D7D1   0008
        J       L_D7B6                          ; D7D2   0004 03D4 03B6

        INCR    R3                              ; D7D5   000B
        DECR    R5                              ; D7D6   0015
        DECR    R5                              ; D7D7   0015
        MVII    #$0034, R0                      ; D7D8   02B8 0034
        MVO@    R0,     R4                      ; D7DA   0260
        CMPI    #$0001, R2                      ; D7DB   037A 0001
        BNEQ    L_D7E4                          ; D7DD   020C 0005

        DECR    R4                              ; D7DF   0014
        MVO@    R2,     R4                      ; D7E0   0262
        MVI@    R3,     R2                      ; D7E1   029A
        INCR    R3                              ; D7E2   000B
        CLRR    R0                              ; D7E3   01C0
L_D7E4:
        MVO@    R2,     R4                      ; D7E4   0262
        MOVR    R2,     R1                      ; D7E5   0091
        ANDI    #$0238, R1                      ; D7E6   03B9 0238
        CMPI    #$0200, R1                      ; D7E8   0379 0200
        BEQ     L_D7F0                          ; D7EA   0204 0004

        CMPI    #$0238, R1                      ; D7EC   0379 0238
        BNEQ    L_D7F9                          ; D7EE   020C 0009

L_D7F0:
        MVI@    R3,     R2                      ; D7F0   029A
        MVO@    R2,     R4                      ; D7F1   0262
        INCR    R3                              ; D7F2   000B
        TSTR    R0                              ; D7F3   0080
        BNEQ    L_D7F9                          ; D7F4   020C 0003

        MVI@    R3,     R2                      ; D7F6   029A
        MVO@    R2,     R4                      ; D7F7   0262
        INCR    R3                              ; D7F8   000B
L_D7F9:
        MVO@    R3,     R5                      ; D7F9   026B
        SWAP    R3,     1                       ; D7FA   0043
        MVO@    R3,     R5                      ; D7FB   026B
        MVII    #$0003, R0                      ; D7FC   02B8 0003
        SDBD                                    ; D7FE   0001
        MVII    #$D9C8, R5                      ; D7FF   02BD 00C8 00D9
L_D802:
        MVI@    R5,     R1                      ; D802   02A9
        MVO@    R1,     R4                      ; D803   0261
        DECR    R0                              ; D804   0010
        BNEQ    L_D802                          ; D805   022C 0004

        SDBD                                    ; D807   0001
        MVII    #$D2AE, R5                      ; D808   02BD 00AE 00D2
        MVI@    R5,     R0                      ; D80B   02A8
        CMPI    #$0007, R0                      ; D80C   0378 0007
        BEQ     L_D88D                          ; D80E   0204 007D

        MOVR    R0,     R1                      ; D810   0081
        ANDI    #$03C0, R0                      ; D811   03B8 03C0
        CMPI    #$0040, R0                      ; D813   0378 0040
        BEQ     L_D88D                          ; D815   0204 0076

        MOVR    R1,     R0                      ; D817   0088
        ANDI    #$03F8, R0                      ; D818   03B8 03F8
        CMPI    #$0038, R0                      ; D81A   0378 0038
        BEQ     L_D88D                          ; D81C   0204 006F

        MOVR    R1,     R0                      ; D81E   0088
        ANDI    #$003F, R0                      ; D81F   03B8 003F
        CMPI    #$002F, R0                      ; D821   0378 002F
        BEQ     L_D87B                          ; D823   0204 0056

        MOVR    R1,     R0                      ; D825   0088
        ANDI    #$0007, R0                      ; D826   03B8 0007
        CMPI    #$0007, R0                      ; D828   0378 0007
        BEQ     L_D867                          ; D82A   0204 003B

        MOVR    R1,     R0                      ; D82C   0088
        ANDI    #$0200, R0                      ; D82D   03B8 0200
        BNEQ    L_D88D                          ; D82F   020C 005C

        MOVR    R1,     R0                      ; D831   0088
        ANDI    #$003F, R0                      ; D832   03B8 003F
        CMPI    #$003D, R0                      ; D834   0378 003D
        BEQ     L_D853                          ; D836   0204 001B

        MOVR    R1,     R0                      ; D838   0088
        ANDI    #$0038, R0                      ; D839   03B8 0038
        CMPI    #$0038, R0                      ; D83B   0378 0038
        BNEQ    L_D88D                          ; D83D   020C 004E

        MVII    #$0005, R3                      ; D83F   02BB 0005
        SDBD                                    ; D841   0001
        MVII    #$D288, R4                      ; D842   02BC 0088 00D2

        JSR     R5,     L_D5F5                  ; D845   0004 01D4 01F5

        SDBD                                    ; D848   0001
        MVII    #$D2AE, R5                      ; D849   02BD 00AE 00D2
        MVI@    R5,     R0                      ; D84C   02A8
        XORI    #$0010, R0                      ; D84D   03F8 0010
        DECR    R5                              ; D84F   0015
        MVO@    R0,     R5                      ; D850   0268
        B       L_D88D                          ; D851   0200 003A

L_D853:
        MVII    #$0004, R3                      ; D853   02BB 0004
        SDBD                                    ; D855   0001
        MVII    #$D286, R4                      ; D856   02BC 0086 00D2

        JSR     R5,     L_D5F5                  ; D859   0004 01D4 01F5

        SDBD                                    ; D85C   0001
        MVII    #$D2AE, R5                      ; D85D   02BD 00AE 00D2
        MVI@    R5,     R0                      ; D860   02A8
        XORI    #$0018, R0                      ; D861   03F8 0018
        DECR    R5                              ; D863   0015
        MVO@    R0,     R5                      ; D864   0268
        B       L_D88D                          ; D865   0200 0026

L_D867:
        MVII    #$0005, R3                      ; D867   02BB 0005
        SDBD                                    ; D869   0001
        MVII    #$D288, R4                      ; D86A   02BC 0088 00D2

        JSR     R5,     L_D5F5                  ; D86D   0004 01D4 01F5

        SDBD                                    ; D870   0001
        MVII    #$D2AE, R5                      ; D871   02BD 00AE 00D2
        MVI@    R5,     R0                      ; D874   02A8
        XORI    #$0002, R0                      ; D875   03F8 0002
        DECR    R5                              ; D877   0015
        MVO@    R0,     R5                      ; D878   0268
        B       L_D88D                          ; D879   0200 0012

L_D87B:
        MVII    #$0004, R3                      ; D87B   02BB 0004
        SDBD                                    ; D87D   0001
        MVII    #$D286, R4                      ; D87E   02BC 0086 00D2

        JSR     R5,     L_D5F5                  ; D881   0004 01D4 01F5

        SDBD                                    ; D884   0001
        MVII    #$D2AE, R5                      ; D885   02BD 00AE 00D2
        MVI@    R5,     R0                      ; D888   02A8
        XORI    #$0003, R0                      ; D889   03F8 0003
        DECR    R5                              ; D88B   0015
        MVO@    R0,     R5                      ; D88C   0268

L_D88D:
        JSR     R5,     L_DD9F                  ; D88D   0004 01DC 019F
        JSR     R5,     L_DDBB                  ; D890   0004 01DC 01BB
        DECLE   $0240,  $0020,  $01C0,  $02BC   ; D893   0240 0020 01C0 02BC
        DECLE   $0018,  $0260,  $0260,  $0260   ; D897   0018 0260 0260 0260
        DECLE   $0260,  $0260,  $0260,  $0260   ; D89B   0260 0260 0260 0260
        DECLE   $0260,  $02BB,  $0004,  $0001   ; D89F   0260 02BB 0004 0001
        DECLE   $02BD,  $008E,  $00D2,  $0001   ; D8A3   02BD 008E 00D2 0001
        DECLE   $02A9,  $03B9,  $0001,  $01C8   ; D8A7   02A9 03B9 0001 01C8
        DECLE   $0048,  $0013,  $022C,  $0008   ; D8AB   0048 0013 022C 0008
        DECLE   $004C,  $0048,  $0001,  $02BD   ; D8AF   004C 0048 0001 02BD
        DECLE   $0080,  $00D2,  $0001,  $02A9   ; D8B3   0080 00D2 0001 02A9
        DECLE   $0001,  $02AA,  $0001,  $02AB   ; D8B7   0001 02AA 0001 02AB
        DECLE   $0001,  $02AC,  $000D,  $000D   ; D8BB   0001 02AC 000D 000D
        DECLE   $0001,  $02AE,  $0274,  $0001   ; D8BF   0001 02AE 0274 0001
        DECLE   $02BC,  $0088,  $00D2,  $0001   ; D8C3   02BC 0088 00D2 0001
        DECLE   $02A5,  $0038,  $0001,  $02BC   ; D8C7   02A5 0038 0001 02BC
        DECLE   $007E,  $00D2,  $0001,  $02A0   ; D8CB   007E 00D2 0001 02A0
        DECLE   $02B4,  $0004                   ; D8CF   02B4 0004

        XOR@    R2,     R0                      ; D8D1   03D0
        MVI@    R5,     R5                      ; D8D2   02AD
L_D8D3:
        PSHR    R1                              ; D8D3   0271
        PSHR    R0                              ; D8D4   0270
        NOP                                     ; D8D5   0034
        PSHR    R4                              ; D8D6   0274
        SDBD                                    ; D8D7   0001
        MVII    #$D294, R4                      ; D8D8   02BC 0094 00D2
        GSWD    R0                              ; D8DB   0030
        SLR     R0,     2                       ; D8DC   0064
        SLR     R0,     2                       ; D8DD   0064
        MVII    #$0004, R1                      ; D8DE   02B9 0004
L_D8E0:
        MVO@    R0,     R4                      ; D8E0   0260
        SUBI    #$0003, R4                      ; D8E1   033C 0003
        SLR     R0,     1                       ; D8E3   0060
        DECR    R1                              ; D8E4   0011
        BNEQ    L_D8E0                          ; D8E5   022C 0006

        SDBD                                    ; D8E7   0001
        MVII    #$D288, R4                      ; D8E8   02BC 0088 00D2
        MOVR    R5,     R0                      ; D8EB   00A8
        MVO@    R0,     R4                      ; D8EC   0260
        SWAP    R0,     1                       ; D8ED   0040
        MVO@    R0,     R4                      ; D8EE   0260
        PULR    R4                              ; D8EF   02B4
        SDBD                                    ; D8F0   0001
        MVII    #$D28A, R5                      ; D8F1   02BD 008A 00D2
        MOVR    R6,     R0                      ; D8F4   00B0
        DECR    R0                              ; D8F5   0010
        DECR    R0                              ; D8F6   0010
        MVO@    R0,     R5                      ; D8F7   0268
        SWAP    R0,     1                       ; D8F8   0040
        MVO@    R0,     R5                      ; D8F9   0268
        PULR    R0                              ; D8FA   02B0
        PULR    R1                              ; D8FB   02B1
        SDBD                                    ; D8FC   0001
        MVII    #$D27E, R5                      ; D8FD   02BD 007E 00D2
        MVO@    R0,     R5                      ; D900   0268
        SWAP    R0,     1                       ; D901   0040
        MVO@    R0,     R5                      ; D902   0268
        MVO@    R1,     R5                      ; D903   0269
        NOP                                     ; D904   0034
        SWAP    R1,     1                       ; D905   0041
        MVO@    R1,     R5                      ; D906   0269
        MVO@    R2,     R5                      ; D907   026A
        NOP                                     ; D908   0034
        SWAP    R2,     1                       ; D909   0042
        MVO@    R2,     R5                      ; D90A   026A
        MVO@    R3,     R5                      ; D90B   026B
        SWAP    R3,     1                       ; D90C   0043
        MVO@    R3,     R5                      ; D90D   026B
        MOVR    R4,     R0                      ; D90E   00A0
        MVO@    R0,     R5                      ; D90F   0268
        NOP                                     ; D910   0034
        SWAP    R0,     1                       ; D911   0040
        MVO@    R0,     R5                      ; D912   0268
L_D913:
        MVI     G_0102, R0                      ; D913   0280 0102
        TSTR    R0                              ; D915   0080
        BNEQ    L_D913                          ; D916   022C 0004

        JSR     R5,     L_DD9F                  ; D918   0004 01DC 019F

        SDBD                                    ; D91B   0001
        MVII    #$D2AB, R5                      ; D91C   02BD 00AB 00D2
        MVI@    R5,     R0                      ; D91F   02A8
        CMPI    #$0004, R0                      ; D920   0378 0004
        BNEQ    L_D92F                          ; D922   020C 000B

        SDBD                                    ; D924   0001
        MVII    #$D286, R4                      ; D925   02BC 0086 00D2
        MVII    #$0004, R3                      ; D928   02BB 0004

        JSR     R5,     L_D5F5                  ; D92A   0004 01D4 01F5

        B       L_D72E                          ; D92D   0220 0200

L_D92F:
        CMPI    #$0005, R0                      ; D92F   0378 0005
        BNEQ    L_D72E                          ; D931   022C 0204

        SDBD                                    ; D933   0001
        MVII    #$D288, R4                      ; D934   02BC 0088 00D2
        MVII    #$0005, R3                      ; D937   02BB 0005

        JSR     R5,     L_D5F5                  ; D939   0004 01D4 01F5

        B       L_D72E                          ; D93C   0220 020F

L_D93E:
        PSHR    R1                              ; D93E   0271
        ANDI    #$001F, R1                      ; D93F   03B9 001F
        SDBD                                    ; D941   0001
        ADDI    #$D949, R1                      ; D942   02F9 0049 00D9
        MVI@    R1,     R0                      ; D945   0288
        DECR    R0                              ; D946   0010
        PULR    R1                              ; D947   02B1
        MOVR    R5,     R7                      ; D948   00AF

        DECLE   $0000,  $0000,  $0000,  $0007   ; D949   0000 0000 0000 0007
        DECLE   $0000,  $0000,  $000B,  $0008   ; D94D   0000 0000 000B 0008
        DECLE   $0000,  $0003,  $0000,  $0004   ; D951   0000 0003 0000 0004

        INCR    R7                              ; D955   000F

        DECR    R0                              ; D956   0010
L_D957:
        INCR    R4                              ; D957   000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; D958   0000 0000 0000 0000
        DECLE   $0006,  $0000,  $0000,  $000A   ; D95C   0006 0000 0000 000A
        DECLE   $0009,  $0000,  $0002,  $0000   ; D960   0009 0000 0002 0000
        DECLE   $0005,  $000E,  $0001,  $000D   ; D964   0005 000E 0001 000D
        DECLE   $0000                           ; D968   0000
L_D969:
        PSHR    R1                              ; D969   0271
        SLR     R1,     1                       ; D96A   0061
        SLR     R1,     2                       ; D96B   0065
        SLR     R1,     2                       ; D96C   0065
        SDBD                                    ; D96D   0001
        ADDI    #$D975, R1                      ; D96E   02F9 0075 00D9
        MVI@    R1,     R0                      ; D971   0288
        DECR    R0                              ; D972   0010
        PULR    R1                              ; D973   02B1
        MOVR    R5,     R7                      ; D974   00AF

        DECLE   $0000,  $0003,  $0001,  $0000   ; D975   0000 0003 0001 0000
        DECLE   $0002,  $0000,  $0000,  $0000   ; D979   0002 0000 0000 0000
L_D97D:
        PSHR    R2                              ; D97D   0272
        DECLE   $0271,  $008A,  $0065,  $0065   ; D97E   0271 008A 0065 0065
        DECLE   $03BA,  $000F,  $0001           ; D982   03BA 000F 0001

        ADDI    #$00B2, R1                      ; D985   02F9 00B2
        ADDR    R3,     R1                      ; D987   00D9
        SDBD                                    ; D988   0001
        ADDI    #$D9A3, R2                      ; D989   02FA 00A3 00D9
        MVI@    R1,     R0                      ; D98C   0288
        DECR    R0                              ; D98D   0010
        BMI     L_D9A0                          ; D98E   020B 0010

        MOVR    R0,     R1                      ; D990   0081
        MVI@    R2,     R0                      ; D991   0290
        DECR    R0                              ; D992   0010
        BMI     L_D9A0                          ; D993   020B 000B

        ADDR    R1,     R0                      ; D995   00C8
        CMPI    #$000B, R0                      ; D996   0378 000B
        BNEQ    L_D99B                          ; D998   020C 0001

        CLRR    R0                              ; D99A   01C0
L_D99B:
        CMPI    #$000C, R0                      ; D99B   0378 000C
        BNEQ    L_D9A0                          ; D99D   020C 0001

        DECR    R0                              ; D99F   0010
L_D9A0:
        PULR    R1                              ; D9A0   02B1
        PULR    R2                              ; D9A1   02B2
        MOVR    R5,     R7                      ; D9A2   00AF

        DECLE   $0000,  $0000,  $0000,  $0000   ; D9A3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000B   ; D9A7   0000 0000 0000 000B
        DECLE   $0000,  $0000,  $0000,  $0008   ; D9AB   0000 0000 0000 0008
        DECLE   $0000,  $0005,  $0002,  $0000   ; D9AF   0000 0005 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9B3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; D9B7   0000 0000 0001 0000
        DECLE   $0000,  $0000,  $0002,  $0000   ; D9BB   0000 0000 0002 0000
        DECLE   $0003,  $0000,  $0000           ; D9BF   0003 0000 0000
L_D9C2:
        CLRR    R1                              ; D9C2   01C9
L_D9C3:
        MVO@    R1,     R4                      ; D9C3   0261
        DECR    R0                              ; D9C4   0010
        BNEQ    L_D9C3                          ; D9C5   022C 0003
        MOVR    R5,     R7                      ; D9C7   00AF
        J       L_D8D3                          ; D9C8   0004 03D8 00D3

L_D9CB:
        PSHR    R5                              ; D9CB   0275
        CLRR    R2                              ; D9CC   01D2
        SDBD                                    ; D9CD   0001
        MVII    #$D2AA, R4                      ; D9CE   02BC 00AA 00D2
        MVI@    R4,     R4                      ; D9D1   02A4
        CMPI    #$0017, R4                      ; D9D2   037C 0017
        BNEQ    L_D9DB                          ; D9D4   020C 0005

        INCR    R2                              ; D9D6   000A
        DECR    R4                              ; D9D7   0014
        DECR    R4                              ; D9D8   0014
        B       L_D9E8                          ; D9D9   0200 000D

L_D9DB:
        CMPI    #$0016, R4                      ; D9DB   037C 0016
        BNEQ    L_D9E2                          ; D9DD   020C 0003

        DECR    R4                              ; D9DF   0014
        B       L_D9E8                          ; D9E0   0200 0006

L_D9E2:
        CMPI    #$0015, R4                      ; D9E2   037C 0015
        BNEQ    L_D9E8                          ; D9E4   020C 0002

        INCR    R2                              ; D9E6   000A
        DECR    R4                              ; D9E7   0014
L_D9E8:
        ADDR    R4,     R4                      ; D9E8   00E4
        SDBD                                    ; D9E9   0001
        ADDI    #$D27E, R4                      ; D9EA   02FC 007E 00D2
        PULR    R7                              ; D9ED   02B7

L_D9EE:
        PSHR    R5                              ; D9EE   0275
        MVII    #$0078, R0                      ; D9EF   02B8 0078
        MVII    #$0214, R4                      ; D9F1   02BC 0214

        JSR     R5,     L_D9C2                  ; D9F3   0004 01D8 01C2

        SDBD                                    ; D9F6   0001
        MVII    #$D28C, R4                      ; D9F7   02BC 008C 00D2
        SDBD                                    ; D9FA   0001
        MVI@    R4,     R5                      ; D9FB   02A5
        MVI@    R5,     R1                      ; D9FC   02A9
        PSHR    R5                              ; D9FD   0275
        MVII    #$0007, R3                      ; D9FE   02BB 0007
        MVII    #$0278, R4                      ; DA00   02BC 0278

        JSR     R5,     L_DB87                  ; DA02   0004 01D8 0387

        PULR    R5                              ; DA05   02B5
        MOVR    R1,     R2                      ; DA06   008A
        MOVR    R1,     R0                      ; DA07   0088
        MOVR    R5,     R4                      ; DA08   00AC

        JSR     R5,     L_DBB7                  ; DA09   0004 01D8 03B7

        MVII    #$001A, R0                      ; DA0C   02B8 001A
        SDBD                                    ; DA0E   0001
        MVII    #$D4C8, R5                      ; DA0F   02BD 00C8 00D4
        SDBD                                    ; DA12   0001
        MVII    #$D4E2, R4                      ; DA13   02BC 00E2 00D4
L_DA16:
        MVI@    R5,     R1                      ; DA16   02A9
        MVI@    R4,     R3                      ; DA17   02A3
        MVO@    R1,     R3                      ; DA18   0259
        DECR    R0                              ; DA19   0010
        BNEQ    L_DA16                          ; DA1A   022C 0005

        SDBD                                    ; DA1C   0001
        MVII    #$D4FC, R5                      ; DA1D   02BD 00FC 00D4
L_DA20:
        MVI@    R5,     R4                      ; DA20   02AC
        CMPI    #$00FF, R4                      ; DA21   037C 00FF
        BEQ     L_DA81                          ; DA23   0204 005C

        SDBD                                    ; DA25   0001
        ADDI    #$D27E, R4                      ; DA26   02FC 007E 00D2
        SDBD                                    ; DA29   0001
        MVI@    R4,     R1                      ; DA2A   02A1
        MVI@    R5,     R2                      ; DA2B   02AA
        PSHR    R2                              ; DA2C   0272
        MVI@    R5,     R3                      ; DA2D   02AB
        TSTR    R3                              ; DA2E   009B
        BEQ     L_DA3A                          ; DA2F   0204 0009

        PSHR    R5                              ; DA31   0275

        JSR     R5,     L_DD9F                  ; DA32   0004 01DC 019F

        MVI@    R1,     R1                      ; DA35   0289

        JSR     R5,     L_DD9F                  ; DA36   0004 01DC 019F

        PULR    R5                              ; DA39   02B5
L_DA3A:
        MVI@    R5,     R3                      ; DA3A   02AB
        MVI@    R5,     R4                      ; DA3B   02AC
        SDBD                                    ; DA3C   0001
        MVII    #$D2AA, R2                      ; DA3D   02BA 00AA 00D2
        MVI@    R2,     R2                      ; DA40   0292
        INCR    R2                              ; DA41   000A
        PSHR    R2                              ; DA42   0272
        SLL     R2,     2                       ; DA43   004E
        ADD@    R6,     R2                      ; DA44   02F2
        SDBD                                    ; DA45   0001
        ADDI    #$D4FC, R2                      ; DA46   02FA 00FC 00D4
        CMPR    R2,     R5                      ; DA49   0155
        BNEQ    L_DA4E                          ; DA4A   020C 0002

        MVII    #$0006, R3                      ; DA4C   02BB 0006
L_DA4E:
        PULR    R2                              ; DA4E   02B2
        PSHR    R5                              ; DA4F   0275
        CMPI    #$0003, R2                      ; DA50   037A 0003
        BEQ     L_DA5C                          ; DA52   0204 0008

        TSTR    R2                              ; DA54   0092
        BEQ     L_DA74                          ; DA55   0204 001D

        JSR     R5,     L_DA7A                  ; DA57   0004 01D8 027A

        B       L_DA77                          ; DA5A   0200 001B

L_DA5C:
        CMPI    #$0006, R3                      ; DA5C   037B 0006
        BNEQ    L_DA77                          ; DA5E   020C 0017

        SDBD                                    ; DA60   0001
        MVII    #$D2AA, R2                      ; DA61   02BA 00AA 00D2
        MVI@    R2,     R2                      ; DA64   0292
        SLL     R2,     2                       ; DA65   004E
        SLL     R2,     1                       ; DA66   004A
        ADDI    #$00AE, R2                      ; DA67   02FA 00AE
        MVO     R2,     .BTAB.5F                ; DA69   0242 025F
        MVII    #$00EE, R2                      ; DA6B   02BA 00EE
        MVO     R2,     .BTAB.60                ; DA6D   0242 0260

        JSR     R5,     L_DA7A                  ; DA6F   0004 01D8 027A

        ADDI    #$0003, R7                      ; DA72   02FF 0003

L_DA74:
        JSR     R5,     L_DB87                  ; DA74   0004 01D8 0387

L_DA77:
        PULR    R5                              ; DA77   02B5
        B       L_DA20                          ; DA78   0220 0059

L_DA7A:
        PSHR    R5                              ; DA7A   0275
        MOVR    R1,     R0                      ; DA7B   0088
        ANDI    #$0001, R0                      ; DA7C   03B8 0001

        JSR     R5,     L_DBA7                  ; DA7E   0004 01D8 03A7

L_DA81:
        PULR    R7                              ; DA81   02B7

L_DA82:
        PSHR    R5                              ; DA82   0275
        PSHR    R1                              ; DA83   0271
        PSHR    R4                              ; DA84   0274
        PSHR    R0                              ; DA85   0270
        MVII    #$0004, R0                      ; DA86   02B8 0004
        SLL     R2,     2                       ; DA88   004E
        MOVR    R2,     R5                      ; DA89   0095
        SDBD                                    ; DA8A   0001
        ADDI    #$DA9F, R5                      ; DA8B   02FD 009F 00DA
        MVII    #$027D, R4                      ; DA8E   02BC 027D
L_DA90:
        MVI@    R5,     R1                      ; DA90   02A9
        SUBI    #$0020, R1                      ; DA91   0339 0020
        SLL     R1,     2                       ; DA93   004D
        SLL     R1,     1                       ; DA94   0049
        ADDI    #$0007, R1                      ; DA95   02F9 0007
        MVO@    R1,     R4                      ; DA97   0261
        DECR    R0                              ; DA98   0010
        BNEQ    L_DA90                          ; DA99   022C 000A

        PULR    R0                              ; DA9B   02B0
        PULR    R4                              ; DA9C   02B4
        PULR    R1                              ; DA9D   02B1
        PULR    R7                              ; DA9E   02B7

        RLC     R0,     1                       ; DA9F   0050
        SLL     R3,     2                       ; DAA0   004F
        RLC     R0,     1                       ; DAA1   0050
        NEGR    R0                              ; DAA2   0020
        RLC     R0,     1                       ; DAA3   0050
        RLC     R1,     2                       ; DAA4   0055
        RLC     R3,     1                       ; DAA5   0053
        SLL     R0,     1                       ; DAA6   0048
        SWAP    R3,     1                       ; DAA7   0043
        SLL     R0,     2                       ; DAA8   004C
        RLC     R2,     1                       ; DAA9   0052
        NEGR    R0                              ; DAAA   0020
        RLC     R0,     2                       ; DAAB   0054
        RLC     R3,     1                       ; DAAC   0053
        RLC     R0,     2                       ; DAAD   0054
        NEGR    R0                              ; DAAE   0020
        SLL     R2,     2                       ; DAAF   004E
        SLL     R3,     2                       ; DAB0   004F
        RLC     R0,     1                       ; DAB1   0050
        NEGR    R0                              ; DAB2   0020
        SLL     R0,     1                       ; DAB3   0048
        SLL     R0,     2                       ; DAB4   004C
        RLC     R0,     2                       ; DAB5   0054
        NEGR    R0                              ; DAB6   0020
        RLC     R3,     1                       ; DAB7   0053
        SWAP    R0,     2                       ; DAB8   0044
        SWAP    R2,     1                       ; DAB9   0042
        SWAP    R0,     2                       ; DABA   0044
        SWAP    R1,     2                       ; DABB   0045
        SLL     R1,     1                       ; DABC   0049
        RLC     R3,     1                       ; DABD   0053
        NEGR    R0                              ; DABE   0020
        SWAP    R0,     2                       ; DABF   0044
        SLL     R1,     1                       ; DAC0   0049
        RLC     R3,     1                       ; DAC1   0053
        NEGR    R0                              ; DAC2   0020
        SLL     R2,     1                       ; DAC3   004A
        RLC     R1,     2                       ; DAC4   0055
        SLL     R1,     2                       ; DAC5   004D
        RLC     R0,     1                       ; DAC6   0050
        RLC     R0,     2                       ; DAC7   0054
        SWAP    R3,     1                       ; DAC8   0043
        SLL     R1,     1                       ; DAC9   0049
        NEGR    R0                              ; DACA   0020
        SWAP    R3,     1                       ; DACB   0043
        SLL     R0,     2                       ; DACC   004C
        RLC     R2,     1                       ; DACD   0052
        SWAP    R3,     1                       ; DACE   0043
        RLC     R3,     1                       ; DACF   0053
        SWAP    R1,     2                       ; DAD0   0045
        RLC     R0,     2                       ; DAD1   0054
        SWAP    R3,     1                       ; DAD2   0043
        SLL     R1,     1                       ; DAD3   0049
        SLL     R2,     2                       ; DAD4   004E
        SWAP    R3,     1                       ; DAD5   0043
        NEGR    R0                              ; DAD6   0020
        SWAP    R0,     2                       ; DAD7   0044
        SWAP    R1,     2                       ; DAD8   0045
        SWAP    R3,     1                       ; DAD9   0043
        NEGR    R0                              ; DADA   0020
        SWAP    R3,     1                       ; DADB   0043
        SLL     R3,     2                       ; DADC   004F
        SLL     R1,     2                       ; DADD   004D
        NEGR    R0                              ; DADE   0020
        SLL     R2,     2                       ; DADF   004E
        SWAP    R1,     2                       ; DAE0   0045
        SWAP    R3,     2                       ; DAE1   0047
        NEGR    R0                              ; DAE2   0020
        SWAP    R1,     1                       ; DAE3   0041
        SWAP    R0,     2                       ; DAE4   0044
        SWAP    R3,     1                       ; DAE5   0043
        NEGR    R0                              ; DAE6   0020
        SWAP    R3,     2                       ; DAE7   0047
        RLC     R3,     1                       ; DAE8   0053
        RLC     R3,     2                       ; DAE9   0057
        SWAP    R0,     2                       ; DAEA   0044
        RLC     R2,     1                       ; DAEB   0052
        RLC     R3,     1                       ; DAEC   0053
        RLC     R3,     2                       ; DAED   0057
        SWAP    R0,     2                       ; DAEE   0044
        RLC     R3,     1                       ; DAEF   0053
        RLC     R3,     2                       ; DAF0   0057
        SWAP    R1,     1                       ; DAF1   0041
        RLC     R0,     1                       ; DAF2   0050
        SWAP    R0,     2                       ; DAF3   0044
        RLC     R3,     1                       ; DAF4   0053
        RLC     R3,     2                       ; DAF5   0057
        RLC     R0,     1                       ; DAF6   0050
        RLC     R3,     1                       ; DAF7   0053
        SLL     R0,     2                       ; DAF8   004C
        SLL     R0,     2                       ; DAF9   004C
        NEGR    R0                              ; DAFA   0020
        RLC     R2,     1                       ; DAFB   0052
        SLL     R0,     2                       ; DAFC   004C
        SWAP    R3,     1                       ; DAFD   0043
        NEGR    R0                              ; DAFE   0020
        RLC     R3,     1                       ; DAFF   0053
        SLL     R0,     2                       ; DB00   004C
        SLL     R0,     2                       ; DB01   004C
        SWAP    R3,     1                       ; DB02   0043
        RLC     R3,     1                       ; DB03   0053
        SLL     R0,     2                       ; DB04   004C
        RLC     R2,     1                       ; DB05   0052
        NEGR    R0                              ; DB06   0020
        RLC     R3,     1                       ; DB07   0053
        SWAP    R1,     1                       ; DB08   0041
        RLC     R2,     1                       ; DB09   0052
        NEGR    R0                              ; DB0A   0020
        RLC     R2,     1                       ; DB0B   0052
        RLC     R2,     1                       ; DB0C   0052
        SWAP    R3,     1                       ; DB0D   0043
        NEGR    R0                              ; DB0E   0020
        RLC     R3,     1                       ; DB0F   0053
        SWAP    R1,     1                       ; DB10   0041
        RLC     R2,     1                       ; DB11   0052
        SWAP    R3,     1                       ; DB12   0043
        SLL     R1,     2                       ; DB13   004D
        SLL     R3,     2                       ; DB14   004F
        RLC     R2,     2                       ; DB15   0056
        NEGR    R0                              ; DB16   0020
        SWAP    R1,     1                       ; DB17   0041
        SWAP    R0,     2                       ; DB18   0044
        SWAP    R0,     2                       ; DB19   0044
        NEGR    R0                              ; DB1A   0020
        RLC     R3,     1                       ; DB1B   0053
        RLC     R1,     2                       ; DB1C   0055
        SWAP    R2,     1                       ; DB1D   0042
        NEGR    R0                              ; DB1E   0020
        SWAP    R3,     1                       ; DB1F   0043
        SLL     R1,     2                       ; DB20   004D
        RLC     R0,     1                       ; DB21   0050
        NEGR    R0                              ; DB22   0020
        SWAP    R1,     1                       ; DB23   0041
        SLL     R2,     2                       ; DB24   004E
        SWAP    R0,     2                       ; DB25   0044
        NEGR    R0                              ; DB26   0020
        SLLC    R0,     1                       ; DB27   0058
        SLL     R3,     2                       ; DB28   004F
        RLC     R2,     1                       ; DB29   0052
        NEGR    R0                              ; DB2A   0020
        SWAP    R2,     1                       ; DB2B   0042
        RLC     R2,     1                       ; DB2C   0052
        SWAP    R1,     1                       ; DB2D   0041
        NEGR    R0                              ; DB2E   0020
        SWAP    R2,     1                       ; DB2F   0042
        SWAP    R3,     1                       ; DB30   0043
        RLC     R3,     1                       ; DB31   0053
        NEGR    R0                              ; DB32   0020
        SWAP    R2,     1                       ; DB33   0042
        RLC     R2,     2                       ; DB34   0056
        RLC     R3,     1                       ; DB35   0053
        NEGR    R0                              ; DB36   0020
        SWAP    R2,     1                       ; DB37   0042
        RLC     R0,     1                       ; DB38   0050
        SLL     R0,     2                       ; DB39   004C
        NEGR    R0                              ; DB3A   0020
        SWAP    R2,     1                       ; DB3B   0042
        SWAP    R1,     2                       ; DB3C   0045
        RLC     R1,     1                       ; DB3D   0051
        NEGR    R0                              ; DB3E   0020
        SWAP    R2,     1                       ; DB3F   0042
        SLL     R0,     2                       ; DB40   004C
        RLC     R0,     2                       ; DB41   0054
        NEGR    R0                              ; DB42   0020
        SWAP    R2,     1                       ; DB43   0042
        SLL     R0,     2                       ; DB44   004C
        SWAP    R1,     2                       ; DB45   0045
        NEGR    R0                              ; DB46   0020
        SWAP    R2,     1                       ; DB47   0042
        RLC     R1,     2                       ; DB48   0055
        RLC     R3,     1                       ; DB49   0053
        SWAP    R3,     1                       ; DB4A   0043
        RLC     R2,     1                       ; DB4B   0052
        SWAP    R1,     2                       ; DB4C   0045
        RLC     R0,     2                       ; DB4D   0054
        SLL     R2,     2                       ; DB4E   004E
        SWAP    R2,     1                       ; DB4F   0042
        SWAP    R3,     1                       ; DB50   0043
        SWAP    R3,     1                       ; DB51   0043
        NEGR    R0                              ; DB52   0020
        SWAP    R2,     1                       ; DB53   0042
        RLC     R2,     2                       ; DB54   0056
        SWAP    R3,     1                       ; DB55   0043
        NEGR    R0                              ; DB56   0020
        SWAP    R2,     1                       ; DB57   0042
        SLL     R1,     2                       ; DB58   004D
        SLL     R1,     1                       ; DB59   0049
        NEGR    R0                              ; DB5A   0020
        SWAP    R2,     1                       ; DB5B   0042
        SLL     R2,     2                       ; DB5C   004E
        SWAP    R1,     2                       ; DB5D   0045
        NEGR    R0                              ; DB5E   0020
        SWAP    R2,     1                       ; DB5F   0042
        SWAP    R3,     2                       ; DB60   0047
        SWAP    R1,     2                       ; DB61   0045
        NEGR    R0                              ; DB62   0020
        SWAP    R2,     1                       ; DB63   0042
        SWAP    R3,     2                       ; DB64   0047
        RLC     R0,     2                       ; DB65   0054
        NEGR    R0                              ; DB66   0020
        SWAP    R2,     1                       ; DB67   0042
        SWAP    R1,     2                       ; DB68   0045
        RLC     R3,     1                       ; DB69   0053
        SWAP    R3,     1                       ; DB6A   0043
        RLC     R3,     1                       ; DB6B   0053
        SLL     R1,     1                       ; DB6C   0049
        SLL     R2,     2                       ; DB6D   004E
        NEGR    R0                              ; DB6E   0020
        SLL     R2,     1                       ; DB6F   004A
        NEGR    R0                              ; DB70   0020
        NEGR    R0                              ; DB71   0020
        NEGR    R0                              ; DB72   0020
        SLL     R2,     1                       ; DB73   004A
        SWAP    R1,     2                       ; DB74   0045
        NEGR    R0                              ; DB75   0020
        NEGR    R0                              ; DB76   0020
        SLL     R2,     1                       ; DB77   004A
        SWAP    R0,     2                       ; DB78   0044
        NEGR    R0                              ; DB79   0020
        NEGR    R0                              ; DB7A   0020
        SLL     R2,     1                       ; DB7B   004A
        RLC     R3,     1                       ; DB7C   0053
        RLC     R2,     1                       ; DB7D   0052
        NEGR    R0                              ; DB7E   0020
        SLL     R2,     1                       ; DB7F   004A
        RLC     R3,     1                       ; DB80   0053
        RLC     R2,     1                       ; DB81   0052
        SWAP    R1,     2                       ; DB82   0045
        SLL     R2,     1                       ; DB83   004A
        RLC     R3,     1                       ; DB84   0053
        RLC     R2,     1                       ; DB85   0052
        SWAP    R0,     2                       ; DB86   0044
L_DB87:
        PSHR    R5                              ; DB87   0275
        MOVR    R1,     R0                      ; DB88   0088
        SWAP    R0,     1                       ; DB89   0040
        SLR     R0,     2                       ; DB8A   0064
        SLR     R0,     2                       ; DB8B   0064
        ANDI    #$000F, R0                      ; DB8C   03B8 000F

        JSR     R5,     L_DBA7                  ; DB8E   0004 01D8 03A7

        MOVR    R1,     R0                      ; DB91   0088
        SWAP    R0,     1                       ; DB92   0040
        ANDI    #$000F, R0                      ; DB93   03B8 000F

        JSR     R5,     L_DBA7                  ; DB95   0004 01D8 03A7

        MOVR    R1,     R0                      ; DB98   0088
        SLR     R0,     2                       ; DB99   0064
        SLR     R0,     2                       ; DB9A   0064
        ANDI    #$000F, R0                      ; DB9B   03B8 000F

        JSR     R5,     L_DBA7                  ; DB9D   0004 01D8 03A7

        MOVR    R1,     R0                      ; DBA0   0088
        ANDI    #$000F, R0                      ; DBA1   03B8 000F

        JSR     R5,     L_DBA7                  ; DBA3   0004 01D8 03A7

        PULR    R7                              ; DBA6   02B7

L_DBA7:
        PSHR    R5                              ; DBA7   0275
        CMPI    #$000A, R0                      ; DBA8   0378 000A
        BC      L_DBB0                          ; DBAA   0201 0004

        ADDI    #$0010, R0                      ; DBAC   02F8 0010
        B       L_DBB2                          ; DBAE   0200 0002

L_DBB0:
        ADDI    #$0017, R0                      ; DBB0   02F8 0017
L_DBB2:
        SLL     R0,     2                       ; DBB2   004C
        SLL     R0,     1                       ; DBB3   0048
        XORR    R3,     R0                      ; DBB4   01D8
        MVO@    R0,     R4                      ; DBB5   0260
        PULR    R7                              ; DBB6   02B7

L_DBB7:
        PSHR    R5                              ; DBB7   0275
        ANDI    #$03FE, R2                      ; DBB8   03BA 03FE
        CMPI    #$0034, R2                      ; DBBA   037A 0034
        BNEQ    L_DBC4                          ; DBBC   020C 0006

        MVII    #$0004, R2                      ; DBBE   02BA 0004

L_DBC0:
        JSR     R5,     L_DA82                  ; DBC0   0004 01D8 0282

        PULR    R7                              ; DBC3   02B7

L_DBC4:
        CMPI    #$0036, R2                      ; DBC4   037A 0036
        BNEQ    L_DBCC                          ; DBC6   020C 0004

        MVII    #$0033, R2                      ; DBC8   02BA 0033
        B       L_DBC0                          ; DBCA   0220 000B

L_DBCC:
        CMPI    #$02B7, R0                      ; DBCC   0378 02B7
        BNEQ    L_DBD4                          ; DBCE   020C 0004

        MVII    #$002B, R2                      ; DBD0   02BA 002B
        B       L_DBC0                          ; DBD2   0220 0013

L_DBD4:
        MOVR    R0,     R2                      ; DBD4   0082
        CMPI    #$0001, R0                      ; DBD5   0378 0001
        BNEQ    L_DC04                          ; DBD7   020C 002B

        MVI@    R4,     R0                      ; DBD9   02A0
        MOVR    R0,     R1                      ; DBDA   0081
        MOVR    R0,     R2                      ; DBDB   0082
        MVI@    R4,     R3                      ; DBDC   02A3
        ANDI    #$00FF, R3                      ; DBDD   03BB 00FF
        SWAP    R3,     1                       ; DBDF   0043
        MVI@    R4,     R4                      ; DBE0   02A4
        ANDI    #$00FF, R4                      ; DBE1   03BC 00FF
        XORR    R4,     R3                      ; DBE3   01E3
        SWAP    R3,     1                       ; DBE4   0043
        MOVR    R3,     R4                      ; DBE5   009C
        MVII    #$0001, R3                      ; DBE6   02BB 0001
        PSHR    R4                              ; DBE8   0274
        SDBD                                    ; DBE9   0001
        MVII    #$D27D, R4                      ; DBEA   02BC 007D 00D2
        MVO@    R3,     R4                      ; DBED   0263
        PULR    R4                              ; DBEE   02B4
        CMPI    #$0280, R0                      ; DBEF   0378 0280
        BNC     L_DC1E                          ; DBF1   0209 002B

        SDBD                                    ; DBF3   0001
        CMPI    #$0400, R0                      ; DBF4   0378 0000 0004
        BC      L_DC1E                          ; DBF7   0201 0025

        ANDI    #$0038, R0                      ; DBF9   03B8 0038
        BEQ     L_DC1E                          ; DBFB   0204 0021

        CMPI    #$0030, R0                      ; DBFD   0378 0030
        BEQ     L_DC1E                          ; DBFF   0204 001D

        MOVR    R1,     R0                      ; DC01   0088
        B       L_DC50                          ; DC02   0200 004C

L_DC04:
        CLRR    R3                              ; DC04   01DB
        PSHR    R4                              ; DC05   0274
        SDBD                                    ; DC06   0001
        MVII    #$D27D, R4                      ; DC07   02BC 007D 00D2
        MVO@    R3,     R4                      ; DC0A   0263
        PULR    R4                              ; DC0B   02B4
        CMPI    #$0004, R0                      ; DC0C   0378 0004
        BNEQ    L_DC4F                          ; DC0E   020C 003F

        MVI@    R4,     R0                      ; DC10   02A0
        MVI@    R4,     R1                      ; DC11   02A1
        MOVR    R0,     R2                      ; DC12   0082
        SWAP    R2,     1                       ; DC13   0042
        MOVR    R2,     R3                      ; DC14   0093
        ANDI    #$0003, R3                      ; DC15   03BB 0003
        MOVR    R0,     R4                      ; DC17   0084
        ANDI    #$0003, R4                      ; DC18   03BC 0003
        CMPI    #$0003, R4                      ; DC1A   037C 0003
        BNEQ    L_DC1F                          ; DC1C   020C 0001
L_DC1E:
        PULR    R7                              ; DC1E   02B7

L_DC1F:
        ANDI    #$03FF, R1                      ; DC1F   03B9 03FF
        ANDI    #$00FC, R0                      ; DC21   03B8 00FC
        SWAP    R0,     1                       ; DC23   0040
        ADDR    R0,     R1                      ; DC24   00C1
        CMPI    #$0003, R3                      ; DC25   037B 0003
        BNEQ    L_DC35                          ; DC27   020C 000C

        MOVR    R4,     R2                      ; DC29   00A2
        ADDI    #$0034, R2                      ; DC2A   02FA 0034
        MVII    #$0281, R4                      ; DC2C   02BC 0281
        MVII    #$0007, R3                      ; DC2E   02BB 0007

        JSR     R5,     L_DB87                  ; DC30   0004 01D8 0387

        B       L_DBC0                          ; DC33   0220 0074

L_DC35:
        MOVR    R4,     R2                      ; DC35   00A2
        ADDI    #$0037, R2                      ; DC36   02FA 0037
        MVII    #$0197, R0                      ; DC38   02B8 0197
        MVO     R0,     .BTAB.82                ; DC3A   0240 0282
        MVII    #$0067, R0                      ; DC3C   02B8 0067
        MVO     R0,     .BTAB.84                ; DC3E   0240 0284
        SLL     R3,     2                       ; DC40   004F
        SLL     R3,     1                       ; DC41   004B
        ADDI    #$00A7, R3                      ; DC42   02FB 00A7
        MVO     R3,     .BTAB.83                ; DC44   0243 0283
        MVII    #$0285, R4                      ; DC46   02BC 0285
        MVII    #$0007, R3                      ; DC48   02BB 0007

        JSR     R5,     L_DB87                  ; DC4A   0004 01D8 0387

        B       L_DBC0                          ; DC4D   0220 008E

L_DC4F:
        MVI@    R4,     R4                      ; DC4F   02A4
L_DC50:
        CMPI    #$0008, R0                      ; DC50   0378 0008
        BC      L_DC58                          ; DC52   0201 0004

        ADDI    #$0005, R2                      ; DC54   02FA 0005
        B       L_DBC0                          ; DC56   0220 0097

L_DC58:
        CMPI    #$0040, R0                      ; DC58   0378 0040
        BC      L_DC6E                          ; DC5A   0201 0012

        SLR     R2,     2                       ; DC5C   0066
        SLR     R2,     1                       ; DC5D   0062
        ADDI    #$000C, R2                      ; DC5E   02FA 000C
        ANDI    #$0007, R1                      ; DC60   03B9 0007
L_DC62:
        SLL     R1,     2                       ; DC62   004D
        SLL     R1,     1                       ; DC63   0049
L_DC64:
        ADDI    #$0087, R1                      ; DC64   02F9 0087
        MVO     R1,     .BTAB.83                ; DC66   0241 0283
        MVII    #$0197, R0                      ; DC68   02B8 0197
        MVO     R0,     .BTAB.82                ; DC6A   0240 0282
        B       L_DBC0                          ; DC6C   0220 00AD

L_DC6E:
        CMPI    #$0048, R0                      ; DC6E   0378 0048
        BC      L_DC79                          ; DC70   0201 0007

        SLR     R2,     2                       ; DC72   0066
        ADDI    #$0004, R2                      ; DC73   02FA 0004
L_DC75:
        ANDI    #$0003, R1                      ; DC75   03B9 0003
        B       L_DC62                          ; DC77   0220 0016

L_DC79:
        CMPI    #$0080, R0                      ; DC79   0378 0080
        BC      L_DC8E                          ; DC7B   0201 0011

        SLL     R0,     1                       ; DC7D   0048
        ANDI    #$0008, R0                      ; DC7E   03B8 0008
        ADDI    #$008F, R0                      ; DC80   02F8 008F
        MVO     R0,     .BTAB.85                ; DC82   0240 0285
        MVII    #$0067, R0                      ; DC84   02B8 0067
        MVO     R0,     .BTAB.84                ; DC86   0240 0284
        SLR     R2,     2                       ; DC88   0066
        SLR     R2,     1                       ; DC89   0062
        ADDI    #$000D, R2                      ; DC8A   02FA 000D
        B       L_DC75                          ; DC8C   0220 0018

L_DC8E:
        CMPI    #$0200, R0                      ; DC8E   0378 0200
        BC      L_DCBE                          ; DC90   0201 002C

        ANDI    #$0038, R1                      ; DC92   03B9 0038
        SLR     R2,     2                       ; DC94   0066
        SLR     R2,     2                       ; DC95   0066
        SLR     R2,     2                       ; DC96   0066
        ADDI    #$001B, R2                      ; DC97   02FA 001B
        ANDI    #$0007, R0                      ; DC99   03B8 0007
        SLL     R0,     2                       ; DC9B   004C
        SLL     R0,     1                       ; DC9C   0048
        CMPR    R0,     R1                      ; DC9D   0141
        BNEQ    L_DCB0                          ; DC9E   020C 0010

        CMPI    #$001D, R2                      ; DCA0   037A 001D
        BNEQ    L_DCA8                          ; DCA2   020C 0004

        MVII    #$0003, R2                      ; DCA4   02BA 0003
        B       L_DC64                          ; DCA6   0220 0043

L_DCA8:
        CMPI    #$0022, R2                      ; DCA8   037A 0022
        BNEQ    L_DCB0                          ; DCAA   020C 0004

        MVII    #$0002, R2                      ; DCAC   02BA 0002
        B       L_DC64                          ; DCAE   0220 004B

L_DCB0:
        ADDI    #$0087, R0                      ; DCB0   02F8 0087
        MVO     R0,     .BTAB.86                ; DCB2   0240 0286
        MVII    #$0067, R0                      ; DCB4   02B8 0067
        MVO     R0,     .BTAB.84                ; DCB6   0240 0284
        MVII    #$0197, R0                      ; DCB8   02B8 0197
        MVO     R0,     .BTAB.85                ; DCBA   0240 0285
        B       L_DC64                          ; DCBC   0220 0059

L_DCBE:
        CMPI    #$0240, R0                      ; DCBE   0378 0240
        BC      L_DCEB                          ; DCC0   0201 0029

        CMPI    #$0208, R0                      ; DCC2   0378 0208
        BEQ     L_DD9E                          ; DCC4   0204 00D8

        CMPI    #$0228, R0                      ; DCC6   0378 0228
        BEQ     L_DD9E                          ; DCC8   0204 00D4

        ANDI    #$03D0, R1                      ; DCCA   03B9 03D0
        CMPI    #$0210, R1                      ; DCCC   0379 0210
        BEQ     L_DD9E                          ; DCCE   0204 00CE

        ANDI    #$000F, R2                      ; DCD0   03BA 000F
        ADDI    #$0023, R2                      ; DCD2   02FA 0023
        MOVR    R4,     R1                      ; DCD4   00A1
        ANDI    #$0020, R0                      ; DCD5   03B8 0020
        BEQ     L_DCDA                          ; DCD7   0204 0001

        COMR    R1                              ; DCD9   0019
L_DCDA:
        SDBD                                    ; DCDA   0001
        MVII    #$D28C, R4                      ; DCDB   02BC 008C 00D2
        SDBD                                    ; DCDE   0001
        ADD@    R4,     R1                      ; DCDF   02E1
        ADDI    #$0002, R1                      ; DCE0   02F9 0002
        MVII    #$0282, R4                      ; DCE2   02BC 0282
        MVII    #$0007, R3                      ; DCE4   02BB 0007

        JSR     R5,     L_DB87                  ; DCE6   0004 01D8 0387

        B       L_DBC0                          ; DCE9   0220 012A

L_DCEB:
        CMPI    #$0280, R0                      ; DCEB   0378 0280
        BC      L_DD2D                          ; DCED   0201 003E

        CMPI    #$0278, R0                      ; DCEF   0378 0278
        BC      L_DD9E                          ; DCF1   0201 00AB

        ANDI    #$0007, R0                      ; DCF3   03B8 0007
        SLL     R0,     2                       ; DCF5   004C
        SLL     R0,     1                       ; DCF6   0048
        ADDI    #$0087, R0                      ; DCF7   02F8 0087
        MVO     R0,     .BTAB.83                ; DCF9   0240 0283
        MVII    #$0197, R0                      ; DCFB   02B8 0197
        MVO     R0,     .BTAB.82                ; DCFD   0240 0282
        ANDI    #$0078, R2                      ; DCFF   03BA 0078
        CMPI    #$0070, R2                      ; DD01   037A 0070
        BNEQ    L_DD09                          ; DD03   020C 0004

        MVII    #$0001, R2                      ; DD05   02BA 0001
        B       L_DBC0                          ; DD07   0220 0148

L_DD09:
        MVII    #$0067, R0                      ; DD09   02B8 0067
        MVO     R0,     .BTAB.84                ; DD0B   0240 0284
        CMPI    #$0040, R2                      ; DD0D   037A 0040
        MVII    #$001D, R2                      ; DD0F   02BA 001D
        BNEQ    L_DD1D                          ; DD11   020C 000A

        MOVR    R4,     R1                      ; DD13   00A1
        MVII    #$0285, R4                      ; DD14   02BC 0285
        MVII    #$0007, R3                      ; DD16   02BB 0007

        JSR     R5,     L_DB87                  ; DD18   0004 01D8 0387

        B       L_DBC0                          ; DD1B   0220 015C

L_DD1D:
        MVII    #$0197, R0                      ; DD1D   02B8 0197
        MVO     R0,     .BTAB.86                ; DD1F   0240 0286
        MVII    #$0107, R0                      ; DD21   02B8 0107
        MVO     R0,     .BTAB.85                ; DD23   0240 0285
        ANDI    #$0038, R1                      ; DD25   03B9 0038
        ADDI    #$0087, R1                      ; DD27   02F9 0087
        MVO     R1,     .BTAB.87                ; DD29   0241 0287
        B       L_DBC0                          ; DD2B   0220 016C

L_DD2D:
        SDBD                                    ; DD2D   0001
        CMPI    #$0400, R0                      ; DD2E   0378 0000 0004
        BC      L_DD9E                          ; DD31   0201 006B

        ANDI    #$03F8, R0                      ; DD33   03B8 03F8
        CMPI    #$02B0, R0                      ; DD35   0378 02B0
        BNEQ    L_DD48                          ; DD37   020C 000F

        CLRR    R2                              ; DD39   01D2
        MVII    #$0197, R0                      ; DD3A   02B8 0197
        MVO     R0,     .BTAB.82                ; DD3C   0240 0282
        ANDI    #$0007, R1                      ; DD3E   03B9 0007
        SLL     R1,     2                       ; DD40   004D
        SLL     R1,     1                       ; DD41   0049
        ADDI    #$0087, R1                      ; DD42   02F9 0087
        MVO     R1,     .BTAB.83                ; DD44   0241 0283
        B       L_DBC0                          ; DD46   0220 0187

L_DD48:
        MOVR    R1,     R0                      ; DD48   0088
        ANDI    #$0007, R0                      ; DD49   03B8 0007
        MVII    #$0067, R3                      ; DD4B   02BB 0067
        MVO     R3,     .BTAB.87                ; DD4D   0243 0287
        MVII    #$0197, R3                      ; DD4F   02BB 0197
        MVO     R3,     .BTAB.88                ; DD51   0243 0288
        SLL     R0,     2                       ; DD53   004C
        SLL     R0,     1                       ; DD54   0048
        ADDI    #$0087, R0                      ; DD55   02F8 0087
        MVO     R0,     .BTAB.89                ; DD57   0240 0289
        SLR     R2,     2                       ; DD59   0066
        SLR     R2,     2                       ; DD5A   0066
        SLR     R2,     2                       ; DD5B   0066
        ADDI    #$0013, R2                      ; DD5C   02FA 0013
        ANDI    #$0038, R1                      ; DD5E   03B9 0038
        BEQ     L_DD6A                          ; DD60   0204 0008

        CMPI    #$0038, R1                      ; DD62   0379 0038
        BNEQ    L_DD82                          ; DD64   020C 001C

        MVII    #$001F, R0                      ; DD66   02B8 001F
        MVO     R0,     .BTAB.82                ; DD68   0240 0282
L_DD6A:
        MOVR    R4,     R1                      ; DD6A   00A1
        MVII    #$0283, R4                      ; DD6B   02BC 0283
        MVII    #$0007, R3                      ; DD6D   02BB 0007

        JSR     R5,     L_DB87                  ; DD6F   0004 01D8 0387

        PSHR    R4                              ; DD72   0274
        SDBD                                    ; DD73   0001
        MVII    #$D27D, R4                      ; DD74   02BC 007D 00D2
        MVI@    R4,     R0                      ; DD77   02A0
        PULR    R4                              ; DD78   02B4
        TSTR    R0                              ; DD79   0080
        BEQ     L_DBC0                          ; DD7A   0224 01BB

        MVI     .BTAB.82,R0                     ; DD7C   0280 0282
        MVO     R0,     .BTAB.81                ; DD7E   0240 0281
        B       L_DBC0                          ; DD80   0220 01C1

L_DD82:
        MVII    #$0107, R0                      ; DD82   02B8 0107
        MVO     R0,     .BTAB.84                ; DD84   0240 0284
        MVII    #$0197, R0                      ; DD86   02B8 0197
        MVO     R0,     .BTAB.85                ; DD88   0240 0285
        ADDI    #$0087, R1                      ; DD8A   02F9 0087
        MVO     R1,     .BTAB.86                ; DD8C   0241 0286
        PSHR    R4                              ; DD8E   0274
        SDBD                                    ; DD8F   0001
        MVII    #$D27D, R4                      ; DD90   02BC 007D 00D2
        MVI@    R4,     R0                      ; DD93   02A0
        PULR    R4                              ; DD94   02B4
        TSTR    R0                              ; DD95   0080
        BEQ     L_DBC0                          ; DD96   0224 01D7

        MVI     .BTAB.84,R0                     ; DD98   0280 0284
        MVO     R0,     .BTAB.83                ; DD9A   0240 0283
        B       L_DBC0                          ; DD9C   0220 01DD
L_DD9E:
        PULR    R7                              ; DD9E   02B7

L_DD9F:
        PSHR    R5                              ; DD9F   0275
        PSHR    R0                              ; DDA0   0270
        PSHR    R1                              ; DDA1   0271
        MVII    #$0078, R0                      ; DDA2   02B8 0078
        SDBD                                    ; DDA4   0001
        MVII    #$D2B8, R4                      ; DDA5   02BC 00B8 00D2
        MVII    #$0214, R5                      ; DDA8   02BD 0214
L_DDAA:
        MVI@    R5,     R1                      ; DDAA   02A9
        SDBD                                    ; DDAB   0001
        MVI@    R4,     R2                      ; DDAC   02A2
        DECR    R5                              ; DDAD   0015
        SUBI    #$0002, R4                      ; DDAE   033C 0002
        MVO@    R2,     R5                      ; DDB0   026A
        MVO@    R1,     R4                      ; DDB1   0261
        NOP                                     ; DDB2   0034
        SWAP    R1,     1                       ; DDB3   0041
        MVO@    R1,     R4                      ; DDB4   0261
        DECR    R0                              ; DDB5   0010
        BNEQ    L_DDAA                          ; DDB6   022C 000D

        PULR    R1                              ; DDB8   02B1
        PULR    R0                              ; DDB9   02B0
        PULR    R7                              ; DDBA   02B7

L_DDBB:
        PSHR    R5                              ; DDBB   0275
        MVI     .ISRVEC.0,R2                    ; DDBC   0282 0100
        MVI     .ISRVEC.1,R3                    ; DDBE   0283 0101
        MVII    #$03C9, R0                      ; DDC0   02B8 03C9
        MVII    #$00DD, R1                      ; DDC2   02B9 00DD
        MVO     R0,     .ISRVEC.0               ; DDC4   0240 0100
        MVO     R1,     .ISRVEC.1               ; DDC6   0241 0101
L_DDC8:
        DECR    R7                              ; DDC8   0017

        SUBI    #$0008, R6                      ; DDC9   033E 0008
        MVO     R2,     .ISRVEC.0               ; DDCB   0242 0100
        MVO     R3,     .ISRVEC.1               ; DDCD   0243 0101
        PULR    R7                              ; DDCF   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; DDD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDD4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDD8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDDC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDFC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE00   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE08   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE28   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE30   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE60   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE68   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE70   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE7C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEBC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DECC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DED0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DED4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DED8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEDC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEFC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF00   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF08   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF28   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF30   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF60   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF68   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF70   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF7C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFBC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFCC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFD4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFD8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFDC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFFC   0000 0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5036       <entry>
;;  $507C       $5088  
;;  $5092       $5098  
;;  $5096       $508E  
;;  $509A       $508C   $5094   $50A6  
;;  $50B6       $50AD   $50B0  
;;  $50BC       $50B4   $50B8  
;;  $50DF       $50E9  
;;  $5111       <entry>
;;  $5124       $511E  
;;  $5129       $5122  
;;  $5153       $5150  
;;  $5156       $5141  
;;  $5162       $5159  
;;  $5165       $517A  
;;  $5172       $516F  
;;  $517C       $5175  
;;  $5186       $5181  
;;  $5189       $5173  
;;  $518E       $517E   $5184   $5187  
;;  $5196       $5160  
;;  $51A1       $5194  
;;  $51A7       $519B   $519E  
;;  $51B0       $51AB  
;;  $51BB       $51B4  
;;  $51BE       $51B9  
;;  $51CC       $513B   $51C3  
;;  $51D4       $522B   $5CBC  
;;  $51E7       $51E4  
;;  $51F1       $51E9   $51EE  
;;  $51F3       $51F8  
;;  $51FA       $51CF   $525F   $5264  
;;  $51FB       $51F4  
;;  $5207       $6301   $D053   $D0ED  
;;  $520D       $51DA  
;;  $520F       $5213  
;;  $5210       $520E  
;;  $5216       $5211  
;;  $521C       $59C6   $5A20   $5F82   $61C6   $6246   $69B6   $D063  
;;  $522A       $60B2  
;;  $5241       $6371   $639A   $63B6   $6B71   $6BAB   $6E16   $6E4B  
;;  $5251       $5242   $5276   $58B9  
;;  $526C       <entry> $590C  
;;  $527E       $528A   $528F   $5297  
;;  $5299       $5281   $5287  
;;  $529B       $527B   $5C89   $5CA1  
;;  $52AB       $52A7  
;;  $52AD       $529F  
;;  $52C5       $52CC  
;;  $52D7       $52DC  
;;  $52E1       $52E5  
;;  $52E9       $52E9  
;;  $52EF       $52B4   $52B9  
;;  $5309       $52F8   $5304  
;;  $533E       $60D0  
;;  $534F       $5344  
;;  $5370       $536A  
;;  $5376       $536E  
;;  $5383       $5372  
;;  $5384       $5382  
;;  $539B       $5395  
;;  $53CF       $53B5   $62AF  
;;  $53D8       $53FB  
;;  $53F3       $53E4  
;;  $53FD       $53F5  
;;  $540A       $5407  
;;  $540B       $54C9   $5533   $5548   $555D   $556B  
;;  $5424       $541B  
;;  $5429       $5415   $5422  
;;  $542C       $51C9  
;;  $543D       $5438  
;;  $5449       $5450  
;;  $544F       $5463   $5472  
;;  $5454       $544D  
;;  $5465       $545B  
;;  $5466       $5458  
;;  $5480       $5479  
;;  $5489       $5481  
;;  $5493       $548B  
;;  $549D       $5495  
;;  $54A3       $5452  
;;  $54A7       $54B2  
;;  $54C7       $54BA  
;;  $54CB       $54AB  
;;  $54EF       $54EC  
;;  $54F2       $54D0   $54D8  
;;  $5517       $550D  
;;  $551D       $5511   $5515  
;;  $551F       $5487   $5491   $549B   $54A1  
;;  $5535       $552D  
;;  $5546       $5541  
;;  $554A       $5539  
;;  $555B       $5556  
;;  $555F       $554E  
;;  $5569       $5564  
;;  $556D       $54F0   $551B  
;;  $5572       $5530   $553D   $5552   $5561   $559F  
;;  $5587       $557A  
;;  $558D       $5543   $5558   $5566  
;;  $55A1       $5449   $545E   $54A7  
;;  $55A4       $55C2  
;;  $55C0       $55A8   $55AD   $55B4  
;;  $55C8       $5348   $534D   $5431   $5436   $543B   $5445   $54BF   $54C5  
;;  $55C8       $5594   $559C   $55BE   $55D4   $55D8   $55E4   $55E9   $55EF  
;;  $55C8       $5628   $5630   $5634  
;;  $55C9       <entry>
;;  $55EB       $55E6  
;;  $55FC       $55FE  
;;  $560F       $560A  
;;  $5610       $5606   $560D  
;;  $5625       $5B03  
;;  $563A       $562C  
;;  $563C       $5638  
;;  $564C       $5467   $54FD   $6AC0   $6ACC  
;;  $5675       $566F  
;;  $567E       $5673  
;;  $5691       $54E0  
;;  $56C7       $5426   $56AE   $56B3  
;;  $56CC       $541F  
;;  $56CD       $56BF   $56C4   $56CB   $5866  
;;  $56D5       $594A  
;;  $56E4       $56E1  
;;  $56EA       $56E8  
;;  $56F0       $5930  
;;  $56F1       $56EF  
;;  $56F9       $56ED  
;;  $5712       $56F7  
;;  $571F       $5712  
;;  $5732       $572C  
;;  $5734       $5730  
;;  $573A       $5732  
;;  $5767       $56D3  
;;  $576E       $5778  
;;  $5776       $5770  
;;  $5785       $585D  
;;  $5786       $5784  
;;  $5793       $57AB  
;;  $5796       $57D2  
;;  $5797       $5795  
;;  $579B       $57A2   $57A7  
;;  $57A9       $578D  
;;  $57AD       $5782  
;;  $57BB       $57B7  
;;  $57D7       $57B0  
;;  $5801       $583B  
;;  $581A       $5801   $5805   $5808   $580C  
;;  $5821       $581B  
;;  $582B       $5823  
;;  $5835       $582F  
;;  $583A       $5829   $5833  
;;  $583D       $5812   $5818  
;;  $5846       $5842  
;;  $5858       $5854  
;;  $5860       $57D5  
;;  $5868       $5786   $57CF   $6441  
;;  $586C       $5870  
;;  $5873       $56B0   $56C1   $56C9   $56CF   $56D9   $56DD   $56FD   $5701  
;;  $5873       $5710   $5738   $5774   $577E   $579C   $57DC  
;;  $5874       $5956  
;;  $58B6       $510E   $58A9   $58B1  
;;  $58CB       $58F5  
;;  $58E4       $58E0  
;;  $58F8       $595A  
;;  $5914       <entry> $69CB  
;;  $5925       $591F  
;;  $5940       $5912  
;;  $5944       $593E  
;;  $596C       $5961  
;;  $5983       $5965   $596A   $5971   $597B  
;;  $598A       $5985  
;;  $598E       $5990  
;;  $59A9       $59AA  
;;  $59C2       $5882   $58AF   $58B4   $590A   $5923  
;;  $59C3       $5997   $599C  
;;  $59DB       $59E9  
;;  $59EB       $59DE  
;;  $59FC       $5A08  
;;  $5A17       $5A0A  
;;  $5A1A       $5A42   $5A9D   $6B6E   $6BA5  
;;  $5A42       $5A36  
;;  $5A45       $5A30  
;;  $5A76       $5AB4  
;;  $5A93       $5A81  
;;  $5ACF       $5A1E   $5A40   $5A53   $5A55   $5A5B   $5A86   $5AEB   $5AEE  
;;  $5ACF       $5AF4   $5AF7   $5B42   $5B48   $5C75   $5CB1  
;;  $5AF2       $5AE9   $5AF0  
;;  $5AF9       $5612  
;;  $5B03       $5AFE  
;;  $5B06       $5AFC   $5B01  
;;  $5B1B       $5B17  
;;  $5B2C       $5B1F  
;;  $5B3D       $5433   $55E1   $56AB   $56BC   $5AE6   $5AF9   $600F   $60D8  
;;  $5B3D       $62D8   $685F   $68C6   $D1D0  
;;  $5B94       $5BA4  
;;  $5BAE       $5734  
;;  $5BE1       $5BE8  
;;  $5BEC       $5BE2  
;;  $5C08       $5C04  
;;  $5C12       $5BEA  
;;  $5C23       $5C16  
;;  $5C25       $5C21  
;;  $5C3D       $5C37  
;;  $5C5B       $5C57  
;;  $5C6B       $5C2B   $5C30   $5C3B  
;;  $5C6E       $56EA   $592D   $5941   $6413  
;;  $5C7F       $5202   $5294   $57A4   $58BD   $58FE  
;;  $5C80       $59CA  
;;  $5C9A       $5C92  
;;  $5C9C       $5C98  
;;  $5C9D       $586C   $5C77  
;;  $5CBA       $5C7A  
;;  $5CC0       $6449  
;;  $5CC1       $5CBF  
;;  $5CE6       $5CE0  
;;  $5CEA       $5CDB  
;;  $5CEE       $5CE4   $5CE8  
;;  $5CF9       $50D4  
;;  $5D07       $5D53   $5D65   $5D77  
;;  $5D1A       $5D16  
;;  $5D1F       $5D1B  
;;  $5D27       $5D21  
;;  $5D2D       $5D80  
;;  $5D3C       $5D36  
;;  $5D41       $5D7C  
;;  $5D67       $5D10  
;;  $5D79       $5D0A  
;;  $5D7A       $5D29  
;;  $5D7E       $5D2B  
;;  $5E62       $5E62  
;;  $5E66       $53D2   $573C   $58C8   $5B6E   $5BD8   $6290  
;;  $5E79       $5E6C  
;;  $5E7D       $5E73   $5E77  
;;  $5E7F       $50F0   $58B6   $62FE   $6381   $63A8   $6E28   $6E93  
;;  $5E9F       $5E9B  
;;  $5EDE       $5156   $54DB   $5520   $556E   $5675   $626F   $6AF7  
;;  $5EDF       $5429  
;;  $5EE8       $5135  
;;  $5F2E       $5F29  
;;  $5F33       $5F2C   $5F30  
;;  $5F3C       $5F37  
;;  $5F41       $5F3A   $5F3E  
;;  $5F4E       $5F4A  
;;  $5F53       $5EED   $5EF5   $5EFE   $5F06   $5F12   $5F15  
;;  $5F54       $5BFD   $5C25   $6336   $63FB   $645B   $6908   $6C3B   $6D36  
;;  $5F55       $53CC   $558A   $5764  
;;  $5F59       $58EE   $5B75   $6D72   $D0E0   $D14E  
;;  $5F5A       $5F58   $698D   $6D67   $D124  
;;  $5F65       $5F61  
;;  $5F69       $63CA   $6893   $6B89   $6B9D   $6BCC   $6D7C   $6E00  
;;  $5F80       $5F78  
;;  $5F85       $5F7E  
;;  $5F96       $5F91  
;;  $5F99       <entry>
;;  $5FBC       $5FAE  
;;  $5FD5       $5FB2  
;;  $5FE5       $5FB4  
;;  $5FEF       $5FC4  
;;  $5FF0       $5FDD   $5FED  
;;  $600F       $5BA6  
;;  $6019       $6014  
;;  $601D       $6012   $6017  
;;  $6034       $6030  
;;  $606B       $6068  
;;  $6084       $607E  
;;  $60BC       $60C4  
;;  $60D4       $603A   $603D   $6042   $6046  
;;  $60D7       $51AD  
;;  $60E2       $60DD  
;;  $60EA       $60DB   $60E0   $60E5  
;;  $611F       $611B  
;;  $6152       $6149  
;;  $6156       $611D  
;;  $6198       $6191   $6195  
;;  $619B       $60FA   $6178  
;;  $61A8       $61A0  
;;  $61AC       $61A6  
;;  $61D5       $61AF   $61C2  
;;  $6205       $61FE  
;;  $6208       $6203  
;;  $6212       $5FC7   $5FF2   $623C   $62D6   $62DB   $62E0  
;;  $6213       $61A9  
;;  $6214       $6143   $61B2  
;;  $622A       $621C   $6224  
;;  $6234       $6231  
;;  $6252       $6228  
;;  $6257       $60EE   $6110   $6129   $6139   $615C   $6168   $61DC   $61E7  
;;  $6257       $61F2   $620B  
;;  $6262       $625E  
;;  $626C       $6260   $6265   $6269  
;;  $626E       $60E7   $62E2  
;;  $62CB       $518A  
;;  $62D3       $62CF  
;;  $62E2       $62DD  
;;  $62E6       $5C68  
;;  $631F       $6319  
;;  $6342       $62F5  
;;  $6371       $6398  
;;  $637C       $6BC8  
;;  $638E       $636F  
;;  $63CA       $6DD6  
;;  $63D7       $640E  
;;  $63DC       $6401  
;;  $63FF       $63E0   $63E5   $63EB  
;;  $640A       $6406  
;;  $6410       $62ED   $635D   $6386   $63AD  
;;  $6411       $60CA   $6360  
;;  $641E       $6416  
;;  $6429       $5269   $69D8   $6EBC  
;;  $6445       $6461  
;;  $6456       $6452  
;;  $6487       $6480  
;;  $6489       $60B5   $6388   $63BF  
;;  $64AB       $62E7   $63C2   $64A5   $69CE   $6C4C   $6DAC   $6EB2  
;;  $64C3       $64FD  
;;  $64F5       $64ED  
;;  $64F9       $64D8   $64F3  
;;  $64FB       $64C7   $64CB   $64D3   $64D6   $64F1   $64F7  
;;  $6512       $6504   $650A   $650F  
;;  $6520       $64B6   $64BC   $64C1   $6501   $6515  
;;  $663A       $6638  
;;  $663E       $663E  
;;  $6642       $6640  
;;  $686A       $6862  
;;  $686B       $51BB  
;;  $6893       $68A3   $68A5  
;;  $6898       $687F  
;;  $689E       $6885   $688B   $6891  
;;  $68B6       $68AE  
;;  $68BD       $68BA  
;;  $68C1       $6870  
;;  $68D0       $68C9  
;;  $68EA       $6B69  
;;  $68EC       $601A  
;;  $68ED       $68E0   $68E6   $68EB   $6B6C  
;;  $6918       $6896   $68D9   $68DB   $68E2   $68E8   $68FB   $6A5B   $6A6C  
;;  $6918       $6A6F   $6A75   $6A79   $6A7D   $6A85   $6A92   $6B66  
;;  $692F       $689C   $68B4   $68BF   $68C4   $690E   $6916   $6928   $692D  
;;  $692F       $6A0F   $6AF5   $6B26  
;;  $6941       $6935   $6937  
;;  $6943       $693F  
;;  $694A       $6952  
;;  $6954       $68F0   $6959   $6999   $69A1   $69A3   $69A8   $69D4  
;;  $6955       $6E0F   $6E84  
;;  $696D       $6964  
;;  $697D       $6978  
;;  $6988       $6984  
;;  $69AD       $5987  
;;  $69CE       $69C2   $69C6  
;;  $69DB       $68CB   $68CE  
;;  $69DD       $6A4E  
;;  $69DF       $6A4B  
;;  $69FD       $69F7  
;;  $6A1D       $6A0A  
;;  $6A24       $6A47  
;;  $6A2B       $6A22  
;;  $6A49       $69E3   $69E8   $69EF   $69FB   $6A06   $6A1B  
;;  $6A73       $6A68  
;;  $6A7F       $6A62   $6A71  
;;  $6A94       $6A56   $6A8A  
;;  $6AD3       $6AC7  
;;  $6AEE       $6B61  
;;  $6AF7       $6AA4   $6AD7   $6AEC  
;;  $6B22       $6B1D  
;;  $6B28       $6B19   $6B20  
;;  $6B3A       $6B33  
;;  $6B3D       $6B38  
;;  $6B64       $6AD1  
;;  $6B65       $6B63  
;;  $6B6B       $6A29   $6A43   $6AB6   $6ABB   $6AC5   $6AFA   $6B24   $6B36  
;;  $6B6B       $6B3B  
;;  $6B6E       $61D2  
;;  $6B8C       $6B87  
;;  $6B97       $624F  
;;  $6BA0       $6B9B  
;;  $6BCB       $6BBF  
;;  $6BCC       $5A90  
;;  $6BD3       $6C41  
;;  $6BF9       $6BED   $6BF3  
;;  $6C11       $6C02   $6C0C  
;;  $6C31       $6C1E  
;;  $6C3F       $6BD8   $6BDD   $6BF7   $6C0F   $6C17  
;;  $6C4B       $63CD   $6B92   $6C43   $6E48  
;;  $6C60       $694C  
;;  $6C8A       $6C80  
;;  $6C90       $6C88  
;;  $6C97       $6C6E  
;;  $6C99       $6C8E  
;;  $6C9B       $6C95  
;;  $6CA9       $6CA2  
;;  $6CC0       $6CB6  
;;  $6CC5       $6A00   $6CAD  
;;  $6CCD       $6CC9  
;;  $6CD2       $6CF4  
;;  $6CF2       $6CD6   $6CDE   $6CE9  
;;  $6CF8       $6CCE  
;;  $6CFD       $6C78  
;;  $6D04       $6D07   $6D0F  
;;  $6D11       $6910   $6A13  
;;  $6D12       $6B95   $6DDC  
;;  $6D14       $6D3B  
;;  $6D36       $6D32  
;;  $6D39       $6D18   $6D1C   $6D21  
;;  $6D3E       $692A  
;;  $6D6A       $6D5D  
;;  $6D7C       $6D4C  
;;  $6D7F       $6D48  
;;  $6D9E       $6D91  
;;  $6DAC       $6D95  
;;  $6DD9       $6DBC   $6DCE   $6DD4  
;;  $6DDE       $6BA3   $6BC6   $6C64   $6C69   $6CAB   $6CB0   $6CE6   $6CF0  
;;  $6DDE       $6DE7   $6DF6   $6E0D   $6E2E   $6E68   $6E82   $6EAC   $6EB8  
;;  $6DF9       $5A8D  
;;  $6DFA       $638B   $69AA   $6C93   $6CC3   $6CFF   $6D0D   $6DF8  
;;  $6E07       $6DFE  
;;  $6E34       $6E46  
;;  $6E44       $6E3B  
;;  $6E63       $6DC0  
;;  $6E6C       $51D1  
;;  $6E74       $6E6F  
;;  $6E79       $6E76  
;;  $6EA3       $6E99   $6E9D  
;;  $6EBC       $6EA1  
;;  $6EBF       $55B9   $693C   $69F4   $6A53   $6C07   $6C6B   $6D09   $D018  
;;  $6EC4       $650C   $6925   $6996   $6CE1   $6DB9  
;;  $6EC5       $6EC3  
;;  $6ECC       $6EDC  
;;  $6EDE       $6EF5  
;;  $6EE1       $6ED6  
;;  $6EF7       $6EE9   $6EED  
;;  $6EF9       $6956   $6EEF  
;;  $6EFE       $648C   $68F2   $69B1   $6C24   $6D97   $6DB5   $D020   $D0B2  
;;  $6EFF       $6EFD  
;;  $D000       $6A26   $6AF2  
;;  $D045       $D031   $D037   $D03D  
;;  $D06E       $D068  
;;  $D076       $D071  
;;  $D08D       $D089  
;;  $D096       $D04A   $D050  
;;  $D0BD       $D0AE  
;;  $D0D0       $D0A2   $D0A8   $D0BB  
;;  $D0D8       $D0C4  
;;  $D0D9       $D0D7  
;;  $D113       $D10B  
;;  $D127       $D027  
;;  $D154       $D008   $D02A   $D043   $D0C7   $D0EB   $D128   $D12D   $D141  
;;  $D155       $D00E   $D015   $D01B  
;;  $D157       $5A76  
;;  $D162       $5FFA  
;;  $D170       $60CD  
;;  $D184       $5B91  
;;  $D194       $6E13  
;;  $D1BE       $614D  
;;  $D1CF       $51B6  
;;  $D1DA       $D1D3  
;;  $D208       $D204  
;;  $D20C       $5980   $D1FA  
;;  $D20D       $D20B  
;;  $D210       $D1D5   $D1D8   $D1E0   $D1F8  
;;  $D212       $D218  
;;  $D21A       $D26F  
;;  $D21B       $D213  
;;  $D232       $D223  
;;  $D233       $D238  
;;  $D23B       $D235  
;;  $D241       $D23D  
;;  $D24E       $D24B  
;;  $D253       $D250  
;;  $D266       $D262  
;;  $D26A       $D246  
;;  $D26E       $D257  
;;  $D3A8       $D3B9  
;;  $D3AC       $D737  
;;  $D3BB       $D3D9  
;;  $D3BF       $D739  
;;  $D3E7       $D406  
;;  $D3EB       $D73B  
;;  $D466       $D412   $D41E   $D42A   $D436   $D442   $D44E   $D45A  
;;  $D487       $D480  
;;  $D4A0       $D46E   $D47E   $D48D  
;;  $D4A5       $D48F   $D49A   $D49E   $D4AB  
;;  $D575       $D678   $D6BE   $D6C7   $D6D3   $D712   $D72C   $D735   $D745  
;;  $D580       $D583  
;;  $D588       $D59C   $D5A3   $D5EB  
;;  $D58A       $D5A8  
;;  $D591       $D592  
;;  $D5BB       $D5B1  
;;  $D5C7       $D5C3  
;;  $D5CB       $D5C1  
;;  $D5D8       $D5D2  
;;  $D5E5       $D5B5   $D5B9   $D5C9   $D5D6   $D5E1  
;;  $D5F5       $D845   $D859   $D86D   $D881   $D92A   $D939  
;;  $D64D       $D64B  
;;  $D668       $D669  
;;  $D696       $D690  
;;  $D6A5       $D698  
;;  $D6B0       $D6AB  
;;  $D6B4       $D6B9  
;;  $D6B7       $D6B2  
;;  $D6BB       $D685   $D694   $D6A1   $D6A7   $D6AE   $D6B5  
;;  $D6D5       $D675   $D6BB   $D6C4   $D6D0  
;;  $D6E6       $D6DA  
;;  $D6F0       $D67A   $D6C0   $D6CA  
;;  $D701       $D6F5  
;;  $D707       $D70D  
;;  $D72B       $D71C   $D71F   $D727  
;;  $D72E       $D785   $D7CE   $D92D   $D931   $D93C  
;;  $D73D       $D3B0   $D3B4   $D3C3   $D3C7   $D3D4   $D3EF   $D3F3   $D401  
;;  $D73D       $D743  
;;  $D748       $D3AA   $D3BD   $D3E9  
;;  $D787       $D767  
;;  $D7B6       $D7D2  
;;  $D7CA       $D7C7  
;;  $D7CB       $D7C1  
;;  $D7E4       $D7DD  
;;  $D7F0       $D7EA  
;;  $D7F9       $D7EE   $D7F4  
;;  $D802       $D805  
;;  $D853       $D836  
;;  $D867       $D82A  
;;  $D87B       $D823  
;;  $D88D       $D671   $D80E   $D815   $D81C   $D82F   $D83D   $D851   $D865  
;;  $D88D       $D879  
;;  $D8D3       $D4C5   $D9C8  
;;  $D8E0       $D8E5  
;;  $D913       $D916  
;;  $D92F       $D922  
;;  $D93E       $D5DB  
;;  $D957       $D955  
;;  $D969       $D5CE  
;;  $D97D       $D5AD   $D5BD  
;;  $D99B       $D998  
;;  $D9A0       $D98E   $D993   $D99D  
;;  $D9C2       $D9F3  
;;  $D9C3       $D9C5  
;;  $D9CB       $D6D6   $D6F1  
;;  $D9DB       $D9D4  
;;  $D9E2       $D9DD  
;;  $D9E8       $D9D9   $D9E0   $D9E4  
;;  $D9EE       $D3B6   $D3D6   $D403   $D585  
;;  $DA16       $DA1A  
;;  $DA20       $DA78  
;;  $DA3A       $DA2F  
;;  $DA4E       $DA4A  
;;  $DA5C       $DA52  
;;  $DA74       $DA55  
;;  $DA77       $DA5A   $DA5E   $DA72  
;;  $DA7A       $DA57   $DA6F  
;;  $DA81       $DA23  
;;  $DA82       $DBC0  
;;  $DA90       $DA99  
;;  $DB87       $52C6   $DA02   $DA74   $DC30   $DC4A   $DCE6   $DD18   $DD6F  
;;  $DBA7       $DA7E   $DB8E   $DB95   $DB9D   $DBA3  
;;  $DBB0       $DBAA  
;;  $DBB2       $DBAE  
;;  $DBB7       $DA09  
;;  $DBC0       $DBCA   $DBD2   $DC33   $DC4D   $DC56   $DC6C   $DCE9   $DD07  
;;  $DBC0       $DD1B   $DD2B   $DD46   $DD7A   $DD80   $DD96   $DD9C  
;;  $DBC4       $DBBC  
;;  $DBCC       $DBC6  
;;  $DBD4       $DBCE  
;;  $DC04       $DBD7  
;;  $DC1E       $DBF1   $DBF7   $DBFB   $DBFF  
;;  $DC1F       $DC1C  
;;  $DC35       $DC27  
;;  $DC4F       $DC0E  
;;  $DC50       $DC02  
;;  $DC58       $DC52  
;;  $DC62       $DC77  
;;  $DC64       $DCA6   $DCAE   $DCBC  
;;  $DC6E       $DC5A  
;;  $DC75       $DC8C  
;;  $DC79       $DC70  
;;  $DC8E       $DC7B  
;;  $DCA8       $DCA2  
;;  $DCB0       $DC9E   $DCAA  
;;  $DCBE       $DC90  
;;  $DCDA       $DCD7  
;;  $DCEB       $DCC0  
;;  $DD09       $DD03  
;;  $DD1D       $DD11  
;;  $DD2D       $DCED  
;;  $DD48       $DD37  
;;  $DD6A       $DD60  
;;  $DD82       $DD64  
;;  $DD9E       $DCC4   $DCC8   $DCCE   $DCF1   $DD31  
;;  $DD9F       $D6DE   $D6E2   $D6F9   $D6FD   $D704   $D70F   $D88D   $D918  
;;  $DD9F       $DA32   $DA36  
;;  $DDAA       $DDB6  
;;  $DDBB       $D890  
;;  $DDC8       $DDC8  
;; ======================================================================== ;;
