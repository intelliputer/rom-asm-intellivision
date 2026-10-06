
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
        DIS                     ; 5011  Color Stack init (2, 3)
        DECLE   $02F0           ; 5013  Border color init


        CLRR    R0                              ; 5014   01C0
        MVII    #$035D, R1                      ; 5015   02B9 035D
L_5017:
        MVO@    R0,     R1                      ; 5017   0248
        DECR    R1                              ; 5018   0011
        BPL     L_5017                          ; 5019   0223 0003

        MVII    #$00FF, R0                      ; 501B   02B8 00FF
        MVII    #$0010, R1                      ; 501D   02B9 0010
        MVII    #$0109, R5                      ; 501F   02BD 0109
L_5021:
        MVO@    R0,     R5                      ; 5021   0268
        DECR    R1                              ; 5022   0011
        BNEQ    L_5021                          ; 5023   022C 0003

        MVII    #$0005, R0                      ; 5025   02B8 0005
        MVO     R0,     G_0105                  ; 5027   0240 0105

        JSR     R5,     L_532A                  ; 5029   0004 0150 032A
        BIDECLE $5380                           ; 502C   0080 0053

        MVII    #$0002, R0                      ; 502E   02B8 0002
        MVII    #$0318, R3                      ; 5030   02BB 0318
        MOVR    R7,     R4                      ; 5032   00BC
        ADDI    #$02C2, R4                      ; 5033   02FC 02C2

        JSR     R5,     L_536B                  ; 5035   0004 0150 036B
        JSR     R5,     L_534A                  ; 5038   0004 0150 034A
        DECLE   $033D                           ; 503B   033D

        TSTR    R4                              ; 503C   00A4
        RLC     R0,     1                       ; 503D   0050
        SUB@    R6,     R0                      ; 503E   0330
        ADDR    R6,     R0                      ; 503F   00F0
        MOVR    R4,     R1                      ; 5040   00A1
        SUB@    R6,     R1                      ; 5041   0331
        ADDR    R6,     R6                      ; 5042   00F6
        MOVR    R4,     R1                      ; 5043   00A1
        SUB@    R6,     R2                      ; 5044   0332
        ADDR    R7,     R4                      ; 5045   00FC
        MOVR    R4,     R1                      ; 5046   00A1
        SUB@    R6,     R3                      ; 5047   0333
        EIS                                     ; 5048   0002
        MOVR    R4,     R2                      ; 5049   00A2
        SUB@    R6,     R4                      ; 504A   0334
        INCR    R0                              ; 504B   0008
        MOVR    R4,     R2                      ; 504C   00A2
        SUB@    R6,     R5                      ; 504D   0335
        INCR    R6                              ; 504E   000E
        MOVR    R4,     R2                      ; 504F   00A2
        SUB@    R6,     R6                      ; 5050   0336
        DECR    R4                              ; 5051   0014
        MOVR    R4,     R2                      ; 5052   00A2
        SUB@    R6,     R7                      ; 5053   0337

        DECLE   $001A,  $00A2,  $0000           ; 5054   001A 00A2 0000

        JSR     R5,     L_680D                  ; 5057   0004 0168 000D

        CLRR    R0                              ; 505A   01C0
        MVO     R0,     G_0132                  ; 505B   0240 0132
        MVII    #$00FF, R0                      ; 505D   02B8 00FF
        MVO     R0,     G_012C                  ; 505F   0240 012C

        JSR     R5,     L_530B                  ; 5061   0004 0150 030B

        MVII    #$005A, R1                      ; 5064   02B9 005A
        SLL     R1,     2                       ; 5066   004D
        SLL     R1,     2                       ; 5067   004D
        MVO     R1,     G_0344                  ; 5068   0241 0344
        MVII    #$008A, R1                      ; 506A   02B9 008A
        MVO     R1,     G_011B                  ; 506C   0241 011B

        JSR     R5,     L_5332                  ; 506E   0004 0150 0332

        CLRR    R0                              ; 5071   01C0
        MVO     R0,     .STIC.CS.0              ; 5072   0240 0028

        JSR     R5,     L_5615                  ; 5074   0004 0154 0215

        MVII    #$000C, R1                      ; 5077   02B9 000C
        MVO     R1,     G_010B                  ; 5079   0241 010B

        JSR     R5,     L_5D0C                  ; 507B   0004 015C 010C

        B       L_50C8                          ; 507E   0200 0048

        ADDR    R4,     R1                      ; 5080   00E1
        RLC     R0,     1                       ; 5081   0050
        DECR    R0                              ; 5082   0010
        RLC     R1,     1                       ; 5083   0051
        SLL     R2,     2                       ; 5084   004E
        RLC     R1,     1                       ; 5085   0051
        SLR     R3,     1                       ; 5086   0063
        RLC     R1,     1                       ; 5087   0051
        TSTR    R0                              ; 5088   0080
        RLC     R1,     1                       ; 5089   0051
        MOVR    R6,     R3                      ; 508A   00B3
        RLC     R1,     1                       ; 508B   0051
        ADDR    R1,     R7                      ; 508C   00CF

        DECLE   $0051,  $00DA,  $0051,  $00FA   ; 508D   0051 00DA 0051 00FA
        DECLE   $0051,  $002E,  $0052,  $005B   ; 5091   0051 002E 0052 005B
        DECLE   $0052,  $0060,  $0052,  $0062   ; 5095   0052 0060 0052 0062
        DECLE   $0052,  $0070,  $0052,  $0094   ; 5099   0052 0070 0052 0094
        DECLE   $0052,  $0002,  $0051,  $00C8   ; 509D   0052 0002 0051 00C8
        DECLE   $0050,  $00C8,  $0050,  $0001   ; 50A1   0050 00C8 0050 0001
        DECLE   $0053,  $0001,  $0053,  $0001   ; 50A5   0053 0001 0053 0001

        RLC     R3,     1                       ; 50A9   0053
        COMR    R1                              ; 50AA   0019
        RLC     R3,     1                       ; 50AB   0053
        MOVR    R4,     R3                      ; 50AC   00A3
        RLC     R2,     1                       ; 50AD   0052
        MOVR    R7,     R0                      ; 50AE   00B8
        RLC     R2,     1                       ; 50AF   0052
        COMR    R1                              ; 50B0   0019
        RLC     R3,     1                       ; 50B1   0053
        MOVR    R4,     R3                      ; 50B2   00A3
        RLC     R2,     1                       ; 50B3   0052
        COMR    R1                              ; 50B4   0019
        RLC     R3,     1                       ; 50B5   0053
        COMR    R1                              ; 50B6   0019
        RLC     R3,     1                       ; 50B7   0053
        MOVR    R4,     R3                      ; 50B8   00A3
        RLC     R2,     1                       ; 50B9   0052
        COMR    R1                              ; 50BA   0019
        RLC     R3,     1                       ; 50BB   0053
        NEGR    R1                              ; 50BC   0021
        MOVR    R4,     R3                      ; 50BD   00A3
        COMR    R1                              ; 50BE   0019
        RLC     R3,     1                       ; 50BF   0053
        COMR    R1                              ; 50C0   0019
        RLC     R3,     1                       ; 50C1   0053
        MOVR    R3,     R4                      ; 50C2   009C
        RLC     R2,     1                       ; 50C3   0052
        COMR    R1                              ; 50C4   0019
        RLC     R3,     1                       ; 50C5   0053
        COMR    R1                              ; 50C6   0019
        RLC     R3,     1                       ; 50C7   0053
L_50C8:
        EIS                                     ; 50C8   0002
        MVI     G_0102, R0                      ; 50C9   0280 0102
        DECR    R0                              ; 50CB   0010
        BPL     L_50C8                          ; 50CC   0223 0005

        MVII    #$0002, R0                      ; 50CE   02B8 0002
        MVO     R0,     G_0102                  ; 50D0   0240 0102
        MVI     G_012D, R0                      ; 50D2   0280 012D
        INCR    R0                              ; 50D4   0008
        MVO     R0,     G_012D                  ; 50D5   0240 012D
        SDBD                                    ; 50D7   0001
        MVII    #$5080, R4                      ; 50D8   02BC 0080 0050
        ADD     G_011C, R4                      ; 50DB   02C4 011C
        ADD     G_011C, R4                      ; 50DD   02C4 011C
        SDBD                                    ; 50DF   0001
        MVI@    R4,     R7                      ; 50E0   02A7

        MVII    #$00C8, R0                      ; 50E1   02B8 00C8
        MVO     R0,     G_0132                  ; 50E3   0240 0132
        MVII    #$000C, R0                      ; 50E5   02B8 000C

        JSR     R5,     L_5D0C                  ; 50E7   0004 015C 010C
        JSR     R5,     L_5457                  ; 50EA   0004 0154 0057
        JSR     R5,     L_5B31                  ; 50ED   0004 0158 0331
        JSR     R5,     L_6233                  ; 50F0   0004 0160 0233
        JSR     R5,     L_63A4                  ; 50F3   0004 0160 03A4
        JSR     R5,     L_64B6                  ; 50F6   0004 0164 00B6
        JSR     R5,     L_6ABE                  ; 50F9   0004 0168 02BE

        CLRR    R0                              ; 50FC   01C0
        DECR    R0                              ; 50FD   0010
        MVO     R0,     G_033E                  ; 50FE   0240 033E
        B       L_50C8                          ; 5100   0220 0039

        JSR     R5,     L_530B                  ; 5102   0004 0150 030B
        JSR     R5,     L_531A                  ; 5105   0004 0150 031A
        DECLE   $0004                           ; 5108   0004

        ANDR    R4,     R0                      ; 5109   01A0
        MVI@    R3,     R6                      ; 510A   029E

        JSR     R5,     L_5457                  ; 510B   0004 0154 0057

        B       L_50C8                          ; 510E   0220 0047

        SDBD                                    ; 5110   0001
        MVII    #$50AA, R0                      ; 5111   02B8 00AA 0050
        MVO     R0,     G_033D                  ; 5114   0240 033D
        MVII    #$0123, R4                      ; 5116   02BC 0123
        MVII    #$0033, R0                      ; 5118   02B8 0033

        JSR     R5,     X_FILL_ZERO             ; 511A   0004 0114 0338
        JSR     R5,     L_680D                  ; 511D   0004 0168 000D

        CLRR    R0                              ; 5120   01C0
        MVO     R0,     G_0132                  ; 5121   0240 0132
        MVII    #$00FF, R0                      ; 5123   02B8 00FF
        MVO     R0,     G_012C                  ; 5125   0240 012C

        JSR     R5,     L_5573                  ; 5127   0004 0154 0173
        JSR     R5,     L_530B                  ; 512A   0004 0150 030B
        JSR     R5,     L_531A                  ; 512D   0004 0150 031A

        CLRR    R0                              ; 5130   01C0
        MVO     R0,     G_0343                  ; 5131   0240 0343

        JSR     R5,     L_66B7                  ; 5133   0004 0164 02B7

        MVII    #$005A, R1                      ; 5136   02B9 005A
        SLL     R1,     2                       ; 5138   004D
        SLL     R1,     2                       ; 5139   004D
        MVO     R1,     G_0344                  ; 513A   0241 0344
        MVII    #$00E9, R0                      ; 513C   02B8 00E9
        MVO     R0,     G_015A                  ; 513E   0240 015A

        JSR     R5,     L_6648                  ; 5140   0004 0164 0248

        MVII    #$001B, R4                      ; 5143   02BC 001B

        JSR     R5,     L_6DB4                  ; 5145   0004 016C 01B4

        MVII    #$0002, R1                      ; 5148   02B9 0002
        MVO     R1,     G_011C                  ; 514A   0241 011C
        B       L_50C8                          ; 514C   0220 0085

        DECLE   $0280,  $015A,  $0080,  $022C   ; 514E   0280 015A 0080 022C
        DECLE   $008A,  $0004,  $01A0,  $033E   ; 5152   008A 0004 01A0 033E
        DECLE   $02B9,  $0001                   ; 5156   02B9 0001

        MVO     R1,     G_0122                  ; 5158   0241 0122

        JSR     R5,     L_6CAD                  ; 515A   0004 016C 00AD

        MVII    #$0003, R1                      ; 515D   02B9 0003
        MVO     R1,     G_011C                  ; 515F   0241 011C
        B       L_50C8                          ; 5161   0220 009A

        MVI     G_012D, R0                      ; 5163   0280 012D
        ANDI    #$000F, R0                      ; 5165   03B8 000F
        CMPI    #$000B, R0                      ; 5167   0378 000B
        BNEQ    L_516E                          ; 5169   020C 0003

        CLRR    R5                              ; 516B   01ED
        MVO     R5,     .BTAB.A4                ; 516C   0245 02A4
L_516E:
        ANDI    #$001F, R0                      ; 516E   03B8 001F
        BNEQ    L_50C8                          ; 5170   022C 00A9

        JSR     R5,     L_6C82                  ; 5172   0004 016C 0082

        MVI     G_0122, R0                      ; 5175   0280 0122
        TSTR    R0                              ; 5177   0080
        BNEQ    L_50C8                          ; 5178   022C 00B1

        MVII    #$0004, R1                      ; 517A   02B9 0004
        MVO     R1,     G_011C                  ; 517C   0241 011C
        B       L_50C8                          ; 517E   0220 00B7

L_5180:
        JSR     R5,     L_698B                  ; 5180   0004 0168 018B
        JSR     R5,     L_66FB                  ; 5183   0004 0164 02FB
        JSR     R5,     L_6373                  ; 5186   0004 0160 0373
        JSR     R5,     L_5B31                  ; 5189   0004 0158 0331
        JSR     R5,     L_5457                  ; 518C   0004 0154 0057
        JSR     R5,     L_6792                  ; 518F   0004 0164 0392
        JSR     R5,     L_6585                  ; 5192   0004 0164 0185
        JSR     R5,     L_6233                  ; 5195   0004 0160 0233
        JSR     R5,     L_63A4                  ; 5198   0004 0160 03A4
        JSR     R5,     L_64B6                  ; 519B   0004 0164 00B6
        JSR     R5,     L_66EB                  ; 519E   0004 0164 02EB
        JSR     R5,     L_6CD3                  ; 51A1   0004 016C 00D3

        MVI     G_0156, R0                      ; 51A4   0280 0156
        TSTR    R0                              ; 51A6   0080
        BEQ     L_50C8                          ; 51A7   0224 00E0

        CLRR    R0                              ; 51A9   01C0
        MVO     R0,     G_0156                  ; 51AA   0240 0156
        MVII    #$000C, R4                      ; 51AC   02BC 000C

        JSR     R5,     L_6DB4                  ; 51AE   0004 016C 01B4

        B       L_50C8                          ; 51B1   0220 00EA

        JSR     R5,     L_69A3                  ; 51B3   0004 0168 01A3

        MVI     G_0153, R0                      ; 51B6   0280 0153
        TSTR    R0                              ; 51B8   0080
        BNEQ    L_51C7                          ; 51B9   020C 000C

        MVII    #$0004, R0                      ; 51BB   02B8 0004
        MVO     R0,     G_011C                  ; 51BD   0240 011C
        CLRR    R0                              ; 51BF   01C0
        MVO     R0,     G_0130                  ; 51C0   0240 0130
        MVO     R0,     G_0131                  ; 51C2   0240 0131
        NOP                                     ; 51C4   0034
        MVO     R0,     G_0146                  ; 51C5   0240 0146

L_51C7:
        JSR     R5,     L_530B                  ; 51C7   0004 0150 030B
        JSR     R5,     L_531A                  ; 51CA   0004 0150 031A

        B       L_50C8                          ; 51CD   0220 0106

        MVI     G_012D, R0                      ; 51CF   0280 012D
        ANDI    #$0003, R0                      ; 51D1   03B8 0003
        BNEQ    L_50C8                          ; 51D3   022C 010C

        JSR     R5,     L_69E1                  ; 51D5   0004 0168 01E1

        B       L_50C8                          ; 51D8   0220 0111

        MVII    #$0123, R4                      ; 51DA   02BC 0123
        MVII    #$0033, R0                      ; 51DC   02B8 0033

        JSR     R5,     X_FILL_ZERO             ; 51DE   0004 0114 0338
        JSR     R5,     L_530B                  ; 51E1   0004 0150 030B
        JSR     R5,     L_531A                  ; 51E4   0004 0150 031A

        MVII    #$00E9, R0                      ; 51E7   02B8 00E9
        MVO     R0,     G_015A                  ; 51E9   0240 015A
        MVII    #$001E, R4                      ; 51EB   02BC 001E

        JSR     R5,     L_6DB4                  ; 51ED   0004 016C 01B4

        MVII    #$0008, R1                      ; 51F0   02B9 0008
        MVO     R1,     G_011C                  ; 51F2   0241 011C
        MVII    #$0001, R1                      ; 51F4   02B9 0001
        MVO     R1,     G_011F                  ; 51F6   0241 011F
        B       L_50C8                          ; 51F8   0220 0131

        MVI     G_015A, R0                      ; 51FA   0280 015A
        TSTR    R0                              ; 51FC   0080
        BNEQ    L_50C8                          ; 51FD   022C 0136

        SDBD                                    ; 51FF   0001
        MVII    #$05A0, R1                      ; 5200   02B9 00A0 0005
        MVO     R1,     G_0344                  ; 5203   0241 0344
        CLRR    R1                              ; 5205   01C9
        MVO     R1,     G_0345                  ; 5206   0241 0345
        MVO     R1,     G_0132                  ; 5208   0241 0132
        MVII    #$0001, R1                      ; 520A   02B9 0001
        MVO     R1,     G_011D                  ; 520C   0241 011D

        JSR     R5,     L_6719                  ; 520E   0004 0164 0319
        JSR     R5,     L_5C9B                  ; 5211   0004 015C 009B
        JSR     R5,     L_682C                  ; 5214   0004 0168 002C

        MVII    #$0009, R1                      ; 5217   02B9 0009
        MVO     R1,     G_011C                  ; 5219   0241 011C
        SDBD                                    ; 521B   0001
        MVII    #$50B0, R0                      ; 521C   02B8 00B0 0050
        MVO     R0,     G_033D                  ; 521F   0240 033D
        MVII    #$0004, R0                      ; 5221   02B8 0004
        MVO     R0,     G_0122                  ; 5223   0240 0122

        JSR     R5,     L_6CAD                  ; 5225   0004 016C 00AD

        MVII    #$00FF, R0                      ; 5228   02B8 00FF
        MVO     R0,     G_012C                  ; 522A   0240 012C
        B       L_50C8                          ; 522C   0220 0165

        JSR     R5,     L_5457                  ; 522E   0004 0154 0057

        MVII    #$000A, R1                      ; 5231   02B9 000A
        MVO     R1,     G_0152                  ; 5233   0241 0152
        MVI     G_012D, R0                      ; 5235   0280 012D
        ANDI    #$000F, R0                      ; 5237   03B8 000F
        CMPI    #$000B, R0                      ; 5239   0378 000B
        BNEQ    L_5240                          ; 523B   020C 0003

        CLRR    R5                              ; 523D   01ED
        MVO     R5,     .BTAB.A4                ; 523E   0245 02A4
L_5240:
        MVI     G_012D, R0                      ; 5240   0280 012D
        ANDI    #$001F, R0                      ; 5242   03B8 001F
        TSTR    R0                              ; 5244   0080
        BNEQ    L_50C8                          ; 5245   022C 017E

        JSR     R5,     L_6C82                  ; 5247   0004 016C 0082

        MVI     G_0122, R0                      ; 524A   0280 0122
        TSTR    R0                              ; 524C   0080
        BNEQ    L_50C8                          ; 524D   022C 0186

        SDBD                                    ; 524F   0001
        MVII    #$50AA, R0                      ; 5250   02B8 00AA 0050
        MVO     R0,     G_033D                  ; 5253   0240 033D
        MVII    #$000A, R1                      ; 5255   02B9 000A
        MVO     R1,     G_011C                  ; 5257   0241 011C
        B       L_50C8                          ; 5259   0220 0192

        JSR     R5,     L_68F1                  ; 525B   0004 0168 00F1

        B       L_5180                          ; 525E   0220 00DF
        B       L_5180                          ; 5260   0220 00E1

        JSR     R5,     L_6233                  ; 5262   0004 0160 0233

        MVI     G_012D, R0                      ; 5265   0280 012D
        ANDI    #$0003, R0                      ; 5267   03B8 0003
        BNEQ    L_526E                          ; 5269   020C 0003

        JSR     R5,     L_6929                  ; 526B   0004 0168 0129

L_526E:
        B       L_50C8                          ; 526E   0220 01A7

        MVII    #$0018, R4                      ; 5270   02BC 0018

        JSR     R5,     L_6DB4                  ; 5272   0004 016C 01B4

        SDBD                                    ; 5275   0001
        MVII    #$3207, R3                      ; 5276   02BB 0007 0032
        MVII    #$0242, R4                      ; 5279   02BC 0242

        JSR     R5,     X_PRINT_R5              ; 527B   0004 0118 007B
        STRING  "GAME OVER"                     ; 527E  
        DECLE   $0000                           ; 5287   0000

        MVII    #$000E, R1                      ; 5288   02B9 000E
        MVO     R1,     G_011C                  ; 528A   0241 011C
        SDBD                                    ; 528C   0001
        MVII    #$50C2, R0                      ; 528D   02B8 00C2 0050
        MVO     R0,     G_033D                  ; 5290   0240 033D
        B       L_50C8                          ; 5292   0220 01CB

        JSR     R5,     L_6233                  ; 5294   0004 0160 0233
        JSR     R5,     L_5457                  ; 5297   0004 0154 0057

        B       L_50C8                          ; 529A   0220 01D3

        CMPI    #$00FF, R0                      ; 529C   0378 00FF
        BNEQ    L_5319                          ; 529E   020C 0079
        J       X_RESET                         ; 52A0   0004 0310 0000

        PSHR    R5                              ; 52A3   0275
        CMPI    #$00FF, R0                      ; 52A4   0378 00FF
        BEQ     L_52B7                          ; 52A6   0204 000F

        ANDI    #$0001, R0                      ; 52A8   03B8 0001
        MVO     R0,     G_0119                  ; 52AA   0240 0119
        TSTR    R0                              ; 52AC   0080
        BNEQ    L_52B3                          ; 52AD   020C 0004

        MVII    #$008A, R1                      ; 52AF   02B9 008A
        B       L_52B5                          ; 52B1   0200 0002

L_52B3:
        MVII    #$00F0, R1                      ; 52B3   02B9 00F0
L_52B5:
        MVO     R1,     G_011B                  ; 52B5   0241 011B
L_52B7:
        PULR    R7                              ; 52B7   02B7

        PSHR    R5                              ; 52B8   0275
        CMPI    #$00FF, R0                      ; 52B9   0378 00FF
        BEQ     L_52F4                          ; 52BB   0204 0037

        MVI     G_012D, R2                      ; 52BD   0282 012D
        ANDI    #$0001, R2                      ; 52BF   03BA 0001
        BEQ     L_52F4                          ; 52C1   0204 0031

        MVI     G_0149, R2                      ; 52C3   0282 0149
        TSTR    R2                              ; 52C5   0092
        BNEQ    L_52F4                          ; 52C6   020C 002C

        MVO     R0,     G_0147                  ; 52C8   0240 0147
        CMPI    #$0008, R0                      ; 52CA   0378 0008
        BGT     L_52F1                          ; 52CC   020E 0023

        MVI     G_0132, R2                      ; 52CE   0282 0132
        CMP     G_011B, R2                      ; 52D0   0342 011B
        BLE     L_52DA                          ; 52D2   0206 0006

        SUBI    #$0006, R2                      ; 52D4   033A 0006
        MVO     R2,     G_0132                  ; 52D6   0242 0132
        B       L_52F1                          ; 52D8   0200 0017

L_52DA:
        ADDI    #$0003, R2                      ; 52DA   02FA 0003
        CMP     G_011B, R2                      ; 52DC   0342 011B
        BLE     L_52E4                          ; 52DE   0206 0004

        MVI     G_011B, R2                      ; 52E0   0282 011B
        B       L_52EF                          ; 52E2   0200 000B

L_52E4:
        MVI     G_0119, R1                      ; 52E4   0281 0119
        TSTR    R1                              ; 52E6   0089
        BEQ     L_52EF                          ; 52E7   0204 0006

        CMPI    #$0082, R2                      ; 52E9   037A 0082
        BGT     L_52EF                          ; 52EB   020E 0002

        DECR    R2                              ; 52ED   0012
        DECR    R2                              ; 52EE   0012
L_52EF:
        MVO     R2,     G_0132                  ; 52EF   0242 0132

L_52F1:
        JSR     R5,     L_5D0C                  ; 52F1   0004 015C 010C

L_52F4:
        PULR    R7                              ; 52F4   02B7

        DECLE   $005C,  $0006,  $00D8,  $0000   ; 52F5   005C 0006 00D8 0000
        DECLE   $0082,  $0009,  $005C,  $0006   ; 52F9   0082 0009 005C 0006
        DECLE   $00D8,  $0000                   ; 52FD   00D8 0000

        MOVR    R2,     R0                      ; 52FF   0090
        COMR    R1                              ; 5300   0019
        PSHR    R5                              ; 5301   0275
        CMPI    #$00FF, R0                      ; 5302   0378 00FF
        BNEQ    L_530A                          ; 5304   020C 0004

        MVII    #$000F, R1                      ; 5306   02B9 000F
        MVO     R1,     G_011C                  ; 5308   0241 011C
L_530A:
        PULR    R7                              ; 530A   02B7

L_530B:
        MVII    #$00FF, R1                      ; 530B   02B9 00FF
        MVO     R1,     G_0134                  ; 530D   0241 0134
        MVO     R1,     G_0137                  ; 530F   0241 0137
        MVO     R1,     G_013A                  ; 5311   0241 013A
        MVO     R1,     G_013D                  ; 5313   0241 013D
        MVO     R1,     G_0140                  ; 5315   0241 0140
        MVO     R1,     G_0143                  ; 5317   0241 0143
L_5319:
        MOVR    R5,     R7                      ; 5319   00AF

L_531A:
        PSHR    R5                              ; 531A   0275
        MVII    #$0006, R0                      ; 531B   02B8 0006
        MVII    #$031A, R4                      ; 531D   02BC 031A

        JSR     R5,     X_FILL_ZERO             ; 531F   0004 0114 0338

        MVII    #$0006, R0                      ; 5322   02B8 0006
        MVII    #$0322, R4                      ; 5324   02BC 0322

        JSR     R5,     X_FILL_ZERO             ; 5326   0004 0114 0338

        PULR    R7                              ; 5329   02B7

L_532A:
        SDBD                                    ; 532A   0001
        MVI@    R5,     R0                      ; 532B   02A8
        MVO     R0,     .ISRVEC.0               ; 532C   0240 0100
        SWAP    R0,     1                       ; 532E   0040
        MVO     R0,     .ISRVEC.1               ; 532F   0240 0101
L_5331:
        MOVR    R5,     R7                      ; 5331   00AF

L_5332:
        PSHR    R5                              ; 5332   0275
        MVI     .ISRVEC.0,R1                    ; 5333   0281 0100
        SWAP    R1,     1                       ; 5335   0041
        XOR     .ISRVEC.1,R1                    ; 5336   03C1 0101
        MOVR    R7,     R0                      ; 5338   00B8
        ADDI    #$0009, R0                      ; 5339   02F8 0009
        MVO     R0,     .ISRVEC.0               ; 533B   0240 0100
        SWAP    R0,     1                       ; 533D   0040
        MVO     R0,     .ISRVEC.1               ; 533E   0240 0101
        EIS                                     ; 5340   0002
L_5341:
        DECR    R7                              ; 5341   0017

        SUBI    #$0008, R6                      ; 5342   033E 0008
        MVO     R1,     .ISRVEC.1               ; 5344   0241 0101
        SWAP    R1,     1                       ; 5346   0041
        MVO     R1,     .ISRVEC.0               ; 5347   0241 0100
        PULR    R7                              ; 5349   02B7

L_534A:
        MVI@    R5,     R1                      ; 534A   02A9
        TSTR    R1                              ; 534B   0089
        BEQ     L_5331                          ; 534C   0224 001C

        SDBD                                    ; 534E   0001
        MVI@    R5,     R0                      ; 534F   02A8
        MVO@    R0,     R1                      ; 5350   0248
        B       L_534A                          ; 5351   0220 0008

L_5353:
        PSHR    R5                              ; 5353   0275
        MOVR    R1,     R5                      ; 5354   008D
L_5355:
        MVI@    R4,     R1                      ; 5355   02A1
        MVO@    R1,     R5                      ; 5356   0269
        MVI@    R4,     R1                      ; 5357   02A1
        MVO@    R1,     R5                      ; 5358   0269
        MVI@    R4,     R1                      ; 5359   02A1
        MVO@    R1,     R5                      ; 535A   0269
        MVI@    R4,     R1                      ; 535B   02A1
        MVO@    R1,     R5                      ; 535C   0269
        MVI@    R4,     R1                      ; 535D   02A1
        MVO@    R1,     R5                      ; 535E   0269
        MVI@    R4,     R1                      ; 535F   02A1
        MVO@    R1,     R5                      ; 5360   0269
        MVI@    R4,     R1                      ; 5361   02A1
        MVO@    R1,     R5                      ; 5362   0269
        MVI@    R4,     R1                      ; 5363   02A1
        MVO@    R1,     R5                      ; 5364   0269
        DECR    R0                              ; 5365   0010
        BPL     L_5355                          ; 5366   0223 0012
        PULR    R7                              ; 5368   02B7

L_5369:
        MVII    #$0001, R0                      ; 5369   02B8 0001
L_536B:
        PSHR    R5                              ; 536B   0275
        MOVR    R0,     R5                      ; 536C   0085
L_536D:
        SDBD                                    ; 536D   0001
        MVI@    R4,     R0                      ; 536E   02A0
        MVO@    R0,     R3                      ; 536F   0258
        ADDI    #$0008, R3                      ; 5370   02FB 0008
        SDBD                                    ; 5372   0001
        MVI@    R4,     R0                      ; 5373   02A0
        MVO@    R0,     R3                      ; 5374   0258
        ADDI    #$0008, R3                      ; 5375   02FB 0008
        SDBD                                    ; 5377   0001
        MVI@    R4,     R0                      ; 5378   02A0
        MVO@    R0,     R3                      ; 5379   0258
        SUBI    #$000F, R3                      ; 537A   033B 000F
        DECR    R5                              ; 537C   0015
        BNEQ    L_536D                          ; 537D   022C 0011
        PULR    R7                              ; 537F   02B7

        PSHR    R5                              ; 5380   0275

        JSR     R5,     L_55C5                  ; 5381   0004 0154 01C5

        BC      L_5438                          ; 5384   0201 00B2

        MVI     G_0157, R0                      ; 5386   0280 0157
        TSTR    R0                              ; 5388   0080
        BNEQ    L_543C                          ; 5389   020C 00B1

        DECR    R0                              ; 538B   0010
        MVO     R0,     G_0157                  ; 538C   0240 0157

        JSR     R5,     L_6AF8                  ; 538E   0004 0168 02F8

        BC      L_541B                          ; 5391   0201 0088

        MVI     G_0102, R0                      ; 5393   0280 0102
        DECR    R0                              ; 5395   0010
        BMI     L_53E7                          ; 5396   020B 004F

        MVO     R0,     G_0102                  ; 5398   0240 0102
        BEQ     L_53E7                          ; 539A   0204 004B

        MVII    #$0318, R4                      ; 539C   02BC 0318
        CLRR    R5                              ; 539E   01ED
        MVI@    R4,     R0                      ; 539F   02A0
        MVO@    R0,     R5                      ; 53A0   0268
        MVI@    R4,     R0                      ; 53A1   02A0
        MVO@    R0,     R5                      ; 53A2   0268
        MVI@    R4,     R0                      ; 53A3   02A0
        MVO@    R0,     R5                      ; 53A4   0268
        MVI@    R4,     R0                      ; 53A5   02A0
        MVO@    R0,     R5                      ; 53A6   0268
        MVI@    R4,     R0                      ; 53A7   02A0
        MVO@    R0,     R5                      ; 53A8   0268
        MVI@    R4,     R0                      ; 53A9   02A0
        MVO@    R0,     R5                      ; 53AA   0268
        MVI@    R4,     R0                      ; 53AB   02A0
        MVO@    R0,     R5                      ; 53AC   0268
        MVI@    R4,     R0                      ; 53AD   02A0
        MVO@    R0,     R5                      ; 53AE   0268
        MVI@    R4,     R0                      ; 53AF   02A0
        MVO@    R0,     R5                      ; 53B0   0268
        MVI@    R4,     R0                      ; 53B1   02A0
        MVO@    R0,     R5                      ; 53B2   0268
        MVI@    R4,     R0                      ; 53B3   02A0
        MVO@    R0,     R5                      ; 53B4   0268
        MVI@    R4,     R0                      ; 53B5   02A0
        MVO@    R0,     R5                      ; 53B6   0268
        MVI@    R4,     R0                      ; 53B7   02A0
        MVO@    R0,     R5                      ; 53B8   0268
        MVI@    R4,     R0                      ; 53B9   02A0
        MVO@    R0,     R5                      ; 53BA   0268
        MVI@    R4,     R0                      ; 53BB   02A0
        MVO@    R0,     R5                      ; 53BC   0268
        MVI@    R4,     R0                      ; 53BD   02A0
        MVO@    R0,     R5                      ; 53BE   0268
        MVI@    R4,     R0                      ; 53BF   02A0
        MVO@    R0,     R5                      ; 53C0   0268
        MVI@    R4,     R0                      ; 53C1   02A0
        MVO@    R0,     R5                      ; 53C2   0268
        MVI@    R4,     R0                      ; 53C3   02A0
        MVO@    R0,     R5                      ; 53C4   0268
        MVI@    R4,     R0                      ; 53C5   02A0
        MVO@    R0,     R5                      ; 53C6   0268
        MVI@    R4,     R0                      ; 53C7   02A0
        MVO@    R0,     R5                      ; 53C8   0268
        MVI@    R4,     R0                      ; 53C9   02A0
        MVO@    R0,     R5                      ; 53CA   0268
        MVI@    R4,     R0                      ; 53CB   02A0
        MVO@    R0,     R5                      ; 53CC   0268
        MVI@    R4,     R0                      ; 53CD   02A0
        MVO@    R0,     R5                      ; 53CE   0268
        MVI     G_0105, R0                      ; 53CF   0280 0105
        MVO     R0,     .STIC.EDGE              ; 53D1   0240 0032
        MVO     R0,     .STIC.MODE              ; 53D3   0240 0021
        ANDI    #$0004, R0                      ; 53D5   03B8 0004
        BNEQ    L_53DB                          ; 53D7   020C 0002

        MVI     .STIC.MODE,R0                   ; 53D9   0280 0021
L_53DB:
        MVI     G_0103, R0                      ; 53DB   0280 0103
        MVO     R0,     .STIC.BORD              ; 53DD   0240 002C
        MVI     G_0104, R0                      ; 53DF   0280 0104
        MVO     R0,     .STIC.HDLY              ; 53E1   0240 0030
        MVI     G_0106, R0                      ; 53E3   0280 0106
        MVO     R0,     .STIC.VDLY              ; 53E5   0240 0031
L_53E7:
        MVO     R0,     .STIC.VIDEN             ; 53E7   0240 0020
        MVI     G_0102, R0                      ; 53E9   0280 0102
        SARC    R0,     1                       ; 53EB   0078
        BNC     L_5414                          ; 53EC   0209 0026

        MVI     G_011C, R0                      ; 53EE   0280 011C
        CMPI    #$000F, R0                      ; 53F0   0378 000F
        BEQ     L_541B                          ; 53F2   0204 0027

        JSR     R5,     L_6674                  ; 53F4   0004 0164 0274

        MVII    #$0002, R2                      ; 53F7   02BA 0002
        MVII    #$0330, R4                      ; 53F9   02BC 0330

        JSR     R5,     L_543F                  ; 53FB   0004 0154 003F

        MVI     G_0119, R4                      ; 53FE   0284 0119
        ADDR    R4,     R4                      ; 5400   00E4
        ADDR    R4,     R4                      ; 5401   00E4
        ADDR    R4,     R4                      ; 5402   00E4
        SDBD                                    ; 5403   0001
        ADDI    #$A1E0, R4                      ; 5404   02FC 00E0 00A1
        CLRR    R0                              ; 5407   01C0
        SDBD                                    ; 5408   0001
        MVII    #$3918, R1                      ; 5409   02B9 0018 0039

        JSR     R5,     L_5353                  ; 540C   0004 0150 0353
        JSR     R5,     L_6648                  ; 540F   0004 0164 0248

        B       L_541B                          ; 5412   0200 0007

L_5414:
        MVII    #$0006, R2                      ; 5414   02BA 0006
        MVII    #$0332, R4                      ; 5416   02BC 0332

        JSR     R5,     L_543F                  ; 5418   0004 0154 003F

L_541B:
        MVI     .PSG0.lft_hand,R0               ; 541B   0280 01FF
        CMP     G_0117, R0                      ; 541D   0340 0117
        MVO     R0,     G_0117                  ; 541F   0240 0117
        BNEQ    L_5425                          ; 5421   020C 0002

        MVO     R0,     G_010C                  ; 5423   0240 010C
L_5425:
        MVI     .PSG0.rgt_hand,R0               ; 5425   0280 01FE
        CMP     G_0118, R0                      ; 5427   0340 0118
        MVO     R0,     G_0118                  ; 5429   0240 0118
        BNEQ    L_542F                          ; 542B   020C 0002

        MVO     R0,     G_0110                  ; 542D   0240 0110

L_542F:
        JSR     R5,     L_551B                  ; 542F   0004 0154 011B
        JSR     R5,     L_6DF0                  ; 5432   0004 016C 01F0
        DECLE   $0004                           ; 5435   0004

        ANDR    R5,     R4                      ; 5436   01AC
        SUB@    R5,     R0                      ; 5437   0328
L_5438:
        CLRR    R0                              ; 5438   01C0
        MVO     R0,     G_0157                  ; 5439   0240 0157
        PULR    R7                              ; 543B   02B7

L_543C:
        MVO     R7,     .STIC.VIDEN             ; 543C   0247 0020
        PULR    R7                              ; 543E   02B7

L_543F:
        PSHR    R5                              ; 543F   0275
L_5440:
        MVI@    R4,     R5                      ; 5440   02A5
        TSTR    R5                              ; 5441   00AD
        BEQ     L_5453                          ; 5442   0204 000F

        PSHR    R4                              ; 5444   0274
        SDBD                                    ; 5445   0001
        MVI@    R5,     R4                      ; 5446   02AC
        MVI@    R5,     R0                      ; 5447   02A8
        MVI@    R5,     R3                      ; 5448   02AB
        MVI@    R3,     R1                      ; 5449   0299
        SLL     R1,     2                       ; 544A   004D
        SLL     R1,     2                       ; 544B   004D
        ADDR    R1,     R4                      ; 544C   00CC
        SDBD                                    ; 544D   0001
        MVI@    R5,     R1                      ; 544E   02A9

        JSR     R5,     L_5353                  ; 544F   0004 0150 0353

        PULR    R4                              ; 5452   02B4
L_5453:
        DECR    R2                              ; 5453   0012
        BNEQ    L_5440                          ; 5454   022C 0015
        PULR    R7                              ; 5456   02B7

L_5457:
        PSHR    R5                              ; 5457   0275

        JSR     R5,     L_54D1                  ; 5458   0004 0154 00D1
        JSR     R5,     L_545F                  ; 545B   0004 0154 005F

        PULR    R7                              ; 545E   02B7

L_545F:
        PSHR    R5                              ; 545F   0275
        CLRR    R1                              ; 5460   01C9
        MVII    #$0109, R2                      ; 5461   02BA 0109
        MVII    #$0111, R3                      ; 5463   02BB 0111
        MVI     G_033D, R4                      ; 5465   0284 033D

        JSR     R5,     L_5473                  ; 5467   0004 0154 0073

        MVII    #$0001, R1                      ; 546A   02B9 0001
        MVII    #$010D, R2                      ; 546C   02BA 010D
        MVII    #$0114, R3                      ; 546E   02BB 0114
        MVI     G_033D, R4                      ; 5470   0284 033D
        INCR    R7                              ; 5472   000F

L_5473:
        PSHR    R5                              ; 5473   0275
L_5474:
        MVII    #$0002, R5                      ; 5474   02BD 0002
L_5476:
        MVI@    R2,     R0                      ; 5476   0290
        CMP@    R3,     R0                      ; 5477   0358
        BNEQ    L_547E                          ; 5478   020C 0004

        CMPI    #$00FF, R0                      ; 547A   0378 00FF
        BEQ     L_548F                          ; 547C   0204 0011

L_547E:
        PSHR    R5                              ; 547E   0275
        PSHR    R4                              ; 547F   0274
        PSHR    R3                              ; 5480   0273
        NOP                                     ; 5481   0034
        PSHR    R2                              ; 5482   0272
        PSHR    R1                              ; 5483   0271
        SDBD                                    ; 5484   0001
        MVII    #$548A, R5                      ; 5485   02BD 008A 0054
        SDBD                                    ; 5488   0001
        MVI@    R4,     R7                      ; 5489   02A7

        PULR    R1                              ; 548A   02B1
        PULR    R2                              ; 548B   02B2
        PULR    R3                              ; 548C   02B3
        PULR    R4                              ; 548D   02B4
        PULR    R5                              ; 548E   02B5
L_548F:
        MVI@    R2,     R0                      ; 548F   0290
        MVO@    R0,     R3                      ; 5490   0258
        INCR    R2                              ; 5491   000A
        INCR    R3                              ; 5492   000B
        ADDI    #$0002, R4                      ; 5493   02FC 0002
        DECR    R5                              ; 5495   0015
        BPL     L_5476                          ; 5496   0223 0021
        PULR    R7                              ; 5498   02B7

        DECLE   $0001,  $0012,  $0006,  $0000   ; 5499   0001 0012 0006 0000
        DECLE   $000A,  $0004,  $0008,  $0002   ; 549D   000A 0004 0008 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54A1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000A   ; 54A5   0000 0000 0000 000A
        DECLE   $0000,  $0000,  $0000,  $0007   ; 54A9   0000 0000 0000 0007
        DECLE   $0000,  $0004,  $0001,  $0000   ; 54AD   0000 0004 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0007   ; 54B1   0000 0000 0000 0007
        DECLE   $0000,  $0000,  $000B,  $0008   ; 54B5   0000 0000 000B 0008
        DECLE   $0000,  $0003,  $0000,  $0004   ; 54B9   0000 0003 0000 0004

        INCR    R7                              ; 54BD   000F

        DECR    R0                              ; 54BE   0010
L_54BF:
        INCR    R4                              ; 54BF   000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54C0   0000 0000 0000 0000
        DECLE   $0006,  $0000,  $0000,  $000A   ; 54C4   0006 0000 0000 000A
        DECLE   $0009,  $0000,  $0002,  $0000   ; 54C8   0009 0000 0002 0000
        DECLE   $0005,  $000E,  $0001,  $000D   ; 54CC   0005 000E 0001 000D
        DECLE   $0000                           ; 54D0   0000
L_54D1:
        PSHR    R5                              ; 54D1   0275
        MVI     G_010C, R0                      ; 54D2   0280 010C
        MVII    #$0109, R4                      ; 54D4   02BC 0109

        JSR     R5,     L_54DE                  ; 54D6   0004 0154 00DE

        MVI     G_0110, R0                      ; 54D9   0280 0110
        MVII    #$010D, R4                      ; 54DB   02BC 010D
        INCR    R7                              ; 54DD   000F

L_54DE:
        PSHR    R5                              ; 54DE   0275
L_54DF:
        MOVR    R0,     R1                      ; 54DF   0081
        DECLE   $0065,  $0065,  $0061,  $0001   ; 54E0   0065 0065 0061 0001
        DECLE   $02F9,  $0099,  $0054,  $0289   ; 54E4   02F9 0099 0054 0289
        DECLE   $0079,  $0201,  $001B,  $0079   ; 54E8   0079 0201 001B 0079
        DECLE   $0201,  $001C,  $0082,  $03B8   ; 54EC   0201 001C 0082 03B8
        DECLE   $0010,  $0204,  $0013,  $03BA   ; 54F0   0010 0204 0013 03BA
        DECLE   $000F,  $0001                   ; 54F4   000F 0001

        ADDI    #$00A1, R2                      ; 54F6   02FA 00A1
        RLC     R0,     2                       ; 54F8   0054
        ADD@    R2,     R1                      ; 54F9   02D1
        CMPI    #$000A, R1                      ; 54FA   0379 000A
        BLE     L_5508                          ; 54FC   0206 000A

        SUBI    #$000B, R1                      ; 54FE   0339 000B
        BEQ     L_5508                          ; 5500   0204 0006

        ADDI    #$000A, R1                      ; 5502   02F9 000A
        B       L_5508                          ; 5504   0200 0002

        MVII    #$00FF, R1                      ; 5506   02B9 00FF
L_5508:
        MVO@    R1,     R4                      ; 5508   0261
        PULR    R7                              ; 5509   02B7

        MVII    #$00FF, R2                      ; 550A   02BA 00FF
        MVO@    R2,     R4                      ; 550C   0262
        XORI    #$00FF, R1                      ; 550D   03F9 00FF
        MVO@    R1,     R4                      ; 550F   0261
        MOVR    R0,     R1                      ; 5510   0081
        ANDI    #$001F, R1                      ; 5511   03B9 001F
        SDBD                                    ; 5513   0001
        ADDI    #$54B1, R1                      ; 5514   02F9 00B1 0054
        MVI@    R1,     R1                      ; 5517   0289
        DECR    R1                              ; 5518   0011
        MVO@    R1,     R4                      ; 5519   0261
        PULR    R7                              ; 551A   02B7

L_551B:
        PSHR    R5                              ; 551B   0275
        MVI     G_033E, R5                      ; 551C   0285 033E
        MVI     .PSG0.rgt_hand,R0               ; 551E   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 5520   0380 01FF
        CMPI    #$00FF, R0                      ; 5522   0378 00FF
        BEQ     L_552A                          ; 5524   0204 0004

L_5526:
        SDBD                                    ; 5526   0001
        MVII    #$2A30, R5                      ; 5527   02BD 0030 002A
L_552A:
        DECR    R5                              ; 552A   0015
        MVO     R5,     G_033E                  ; 552B   0245 033E
        BEQ     L_553B                          ; 552D   0204 000C

        MVI     .PSG0.rgt_hand,R0               ; 552F   0280 01FE
        CMPI    #$005A, R0                      ; 5531   0378 005A
        BEQ     L_553B                          ; 5533   0204 0006

        AND     .PSG0.lft_hand,R0               ; 5535   0380 01FF
        CMPI    #$005A, R0                      ; 5537   0378 005A
        BNEQ    L_5561                          ; 5539   020C 0026

L_553B:
        MVI     .ISRVEC.0,R2                    ; 553B   0282 0100
        MVI     .ISRVEC.1,R3                    ; 553D   0283 0101
        SDBD                                    ; 553F   0001
        MVII    #$5572, R1                      ; 5540   02B9 0072 0055
        MVO     R1,     .ISRVEC.0               ; 5543   0241 0100
        SWAP    R1,     1                       ; 5545   0041
        MVO     R1,     .ISRVEC.1               ; 5546   0241 0101
        MVI     .PSG0.chan_enable,R1            ; 5548   0281 01F8
        MVII    #$003F, R5                      ; 554A   02BD 003F
        MVO     R5,     .PSG0.chan_enable       ; 554C   0245 01F8
        MVI     G_033E, R0                      ; 554E   0280 033E
        TSTR    R0                              ; 5550   0080
        BEQ     L_5556                          ; 5551   0204 0003

        JSR     R5,     L_5562                  ; 5553   0004 0154 0162
L_5556:
        JSR     R5,     L_5562                  ; 5556   0004 0154 0162

        MVO     R1,     .PSG0.chan_enable       ; 5559   0241 01F8
        MVO     R2,     .ISRVEC.0               ; 555B   0242 0100
        MVO     R3,     .ISRVEC.1               ; 555D   0243 0101
        B       L_5526                          ; 555F   0220 003A
L_5561:
        PULR    R7                              ; 5561   02B7

L_5562:
        MVI     .PSG0.rgt_hand,R0               ; 5562   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 5564   0380 01FF
        CMPI    #$00FF, R0                      ; 5566   0378 00FF
        BEQ     L_5562                          ; 5568   0224 0007

L_556A:
        MVI     .PSG0.rgt_hand,R0               ; 556A   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 556C   0380 01FF
        CMPI    #$00FF, R0                      ; 556E   0378 00FF
        BNEQ    L_556A                          ; 5570   022C 0007
        MOVR    R5,     R7                      ; 5572   00AF

L_5573:
        PSHR    R5                              ; 5573   0275
        MVI     G_0341, R5                      ; 5574   0285 0341
        SDBD                                    ; 5576   0001
        ADDI    #$A348, R5                      ; 5577   02FD 0048 00A3
        SDBD                                    ; 557A   0001
        MVI@    R5,     R4                      ; 557B   02AC
        CLRR    R2                              ; 557C   01D2
        CLRR    R0                              ; 557D   01C0
L_557E:
        MVI@    R4,     R1                      ; 557E   02A1
        CMPI    #$00FF, R1                      ; 557F   0379 00FF
        BGT     L_558F                          ; 5581   020E 000C
        ADD     G_0340, R7                      ; 5583   02C7 0340

        SDBD                                    ; 5585   0001
        ADDI    #$A380, R1                      ; 5586   02F9 0080 00A3
        MVI@    R1,     R1                      ; 5589   0289
        ADDI    #$0200, R1                      ; 558A   02F9 0200
        MVO@    R0,     R1                      ; 558C   0248
        B       L_557E                          ; 558D   0220 0010

L_558F:
        CMPI    #$01FF, R1                      ; 558F   0379 01FF
        BGT     L_55A6                          ; 5591   020E 0013

        ANDI    #$00FF, R1                      ; 5593   03B9 00FF
        ADD     G_0340, R7                      ; 5595   02C7 0340

        SDBD                                    ; 5597   0001
        ADDI    #$A470, R1                      ; 5598   02F9 0070 00A4
        MVI@    R1,     R1                      ; 559B   0289
        SLL     R1,     2                       ; 559C   004D
        SLL     R1,     1                       ; 559D   0049
        MOVR    R1,     R2                      ; 559E   008A
        SDBD                                    ; 559F   0001
        ANDI    #$3E07, R0                      ; 55A0   03B8 0007 003E
        XORR    R1,     R0                      ; 55A3   01C8
        B       L_557E                          ; 55A4   0220 0027

L_55A6:
        CMPI    #$02FF, R1                      ; 55A6   0379 02FF
        BGT     L_55B5                          ; 55A8   020E 000B

        MOVR    R1,     R0                      ; 55AA   0088
        ANDI    #$0007, R0                      ; 55AB   03B8 0007
        ANDI    #$00F8, R1                      ; 55AD   03B9 00F8
        SLR     R1,     2                       ; 55AF   0065
        SWAP    R1,     1                       ; 55B0   0041
        XORR    R1,     R0                      ; 55B1   01C8
        XORR    R2,     R0                      ; 55B2   01D0
        B       L_557E                          ; 55B3   0220 0036

L_55B5:
        CMPI    #$03FF, R1                      ; 55B5   0379 03FF
        BEQ     L_55C4                          ; 55B7   0204 000B

        MOVR    R1,     R0                      ; 55B9   0088
        ANDI    #$0007, R0                      ; 55BA   03B8 0007
        ANDI    #$00F8, R1                      ; 55BC   03B9 00F8
        SLR     R1,     2                       ; 55BE   0065
        SWAP    R1,     1                       ; 55BF   0041
        XORR    R1,     R0                      ; 55C0   01C8
        CLRR    R2                              ; 55C1   01D2
        B       L_557E                          ; 55C2   0220 0045
L_55C4:
        PULR    R7                              ; 55C4   02B7

L_55C5:
        PSHR    R5                              ; 55C5   0275
        MVI     G_012B, R5                      ; 55C6   0285 012B
        CMP     G_012C, R5                      ; 55C8   0345 012C
        BEQ     L_5613                          ; 55CA   0204 0047

        MVO     R5,     G_012C                  ; 55CC   0245 012C
        SDBD                                    ; 55CE   0001
        MVII    #$90E0, R0                      ; 55CF   02B8 00E0 0090
        MVII    #$0005, R1                      ; 55D2   02B9 0005
        CMPI    #$0027, R5                      ; 55D4   037D 0027
        BLT     L_55DF                          ; 55D6   0205 0007

        SDBD                                    ; 55D8   0001
        MVII    #$9630, R0                      ; 55D9   02B8 0030 0096
        CLRR    R1                              ; 55DC   01C9
        SUBI    #$0023, R5                      ; 55DD   033D 0023
L_55DF:
        ADDR    R5,     R5                      ; 55DF   00ED
        MVO     R0,     G_033F                  ; 55E0   0240 033F
        MVO     R1,     G_0340                  ; 55E2   0241 0340
        MVO     R5,     G_0341                  ; 55E4   0245 0341
        SDBD                                    ; 55E6   0001
        ADDI    #$A396, R5                      ; 55E7   02FD 0096 00A3
        SDBD                                    ; 55EA   0001
        MVI@    R5,     R2                      ; 55EB   02AA
        MVI@    R2,     R1                      ; 55EC   0291
        SDBD                                    ; 55ED   0001
        MVII    #$3920, R5                      ; 55EE   02BD 0020 0039
        MVO     R7,     .STIC.VIDEN             ; 55F1   0247 0020
        DECR    R1                              ; 55F3   0011
        BMI     L_560E                          ; 55F4   020B 0018

L_55F6:
        INCR    R2                              ; 55F6   000A
        MVI@    R2,     R4                      ; 55F7   0294
        ADDR    R4,     R4                      ; 55F8   00E4
        ADD     G_033F, R4                      ; 55F9   02C4 033F
        MVI@    R4,     R0                      ; 55FB   02A0
        MVO@    R0,     R5                      ; 55FC   0268
        MVI@    R4,     R0                      ; 55FD   02A0
        MVO@    R0,     R5                      ; 55FE   0268
        MVI@    R4,     R0                      ; 55FF   02A0
        MVO@    R0,     R5                      ; 5600   0268
        MVI@    R4,     R0                      ; 5601   02A0
        MVO@    R0,     R5                      ; 5602   0268
        MVI@    R4,     R0                      ; 5603   02A0
        MVO@    R0,     R5                      ; 5604   0268
        MVI@    R4,     R0                      ; 5605   02A0
        MVO@    R0,     R5                      ; 5606   0268
        MVI@    R4,     R0                      ; 5607   02A0
        MVO@    R0,     R5                      ; 5608   0268
        MVI@    R4,     R0                      ; 5609   02A0
        MVO@    R0,     R5                      ; 560A   0268
        DECR    R1                              ; 560B   0011
        BPL     L_55F6                          ; 560C   0223 0017

L_560E:
        JSR     R5,     L_5573                  ; 560E   0004 0154 0173

        SETC                                    ; 5611   0007
        PULR    R7                              ; 5612   02B7

L_5613:
        CLRC                                    ; 5613   0006
        PULR    R7                              ; 5614   02B7

L_5615:
        PSHR    R5                              ; 5615   0275
        SDBD                                    ; 5616   0001
        MVII    #$9000, R4                      ; 5617   02BC 0000 0090
        SDBD                                    ; 561A   0001
        MVII    #$3800, R5                      ; 561B   02BD 0000 0038
        MVII    #$001C, R0                      ; 561E   02B8 001C
L_5620:
        MVI@    R4,     R1                      ; 5620   02A1
        MVO@    R1,     R5                      ; 5621   0269
        MVI@    R4,     R1                      ; 5622   02A1
        MVO@    R1,     R5                      ; 5623   0269
        MVI@    R4,     R1                      ; 5624   02A1
        MVO@    R1,     R5                      ; 5625   0269
        MVI@    R4,     R1                      ; 5626   02A1
        MVO@    R1,     R5                      ; 5627   0269
        MVI@    R4,     R1                      ; 5628   02A1
        MVO@    R1,     R5                      ; 5629   0269
        MVI@    R4,     R1                      ; 562A   02A1
        MVO@    R1,     R5                      ; 562B   0269
        MVI@    R4,     R1                      ; 562C   02A1
        MVO@    R1,     R5                      ; 562D   0269
        MVI@    R4,     R1                      ; 562E   02A1
        MVO@    R1,     R5                      ; 562F   0269
        DECR    R0                              ; 5630   0010
        BNEQ    L_5620                          ; 5631   022C 0012
        PULR    R7                              ; 5633   02B7

        RLC     R2,     2                       ; 5634   0056
        RLC     R2,     2                       ; 5635   0056
        SLR     R3,     2                       ; 5636   0067
        RLC     R2,     2                       ; 5637   0056
        RRC     R2,     1                       ; 5638   0072
        RLC     R2,     2                       ; 5639   0056
        SARC    R1,     2                       ; 563A   007D
        RLC     R2,     2                       ; 563B   0056
        MOVR    R0,     R6                      ; 563C   0086
        RLC     R2,     2                       ; 563D   0056
        MOVR    R2,     R1                      ; 563E   0091
        RLC     R2,     2                       ; 563F   0056
        MOVR    R3,     R4                      ; 5640   009C
        RLC     R2,     2                       ; 5641   0056
        TSTR    R4                              ; 5642   00A4
        RLC     R2,     2                       ; 5643   0056
        TSTR    R5                              ; 5644   00AD
        RLC     R2,     2                       ; 5645   0056
        MOVR    R6,     R5                      ; 5646   00B5
        RLC     R2,     2                       ; 5647   0056
        ADDR    R0,     R0                      ; 5648   00C0
        RLC     R2,     2                       ; 5649   0056
        ADDR    R1,     R3                      ; 564A   00CB
        RLC     R2,     2                       ; 564B   0056
        ADDR    R2,     R4                      ; 564C   00D4
        RLC     R2,     2                       ; 564D   0056
        ADDR    R3,     R7                      ; 564E   00DF

        DECLE   $0056,  $00EA,  $0056,  $00F2   ; 564F   0056 00EA 0056 00F2
        DECLE   $0056,  $00FB,  $0056,  $0000   ; 5653   0056 00FB 0056 0000
        DECLE   $0001,  $0002,  $0003,  $0000   ; 5657   0001 0002 0003 0000
        DECLE   $0001,  $0002,  $0003,  $0000   ; 565B   0001 0002 0003 0000
        DECLE   $0001,  $0002,  $0003,  $0000   ; 565F   0001 0002 0003 0000
        DECLE   $0001,  $0002,  $0003,  $03FF   ; 5663   0001 0002 0003 03FF
        DECLE   $0004,  $0005,  $0006,  $0007   ; 5667   0004 0005 0006 0007
        DECLE   $0008,  $0009,  $000A,  $000B   ; 566B   0008 0009 000A 000B
        DECLE   $000C,  $000D,  $03FF           ; 566F   000C 000D 03FF

        INCR    R6                              ; 5672   000E
        INCR    R7                              ; 5673   000F

        DECR    R0                              ; 5674   0010
L_5675:
        DECR    R1                              ; 5675   0011
        DECR    R2                              ; 5676   0012
        DECR    R3                              ; 5677   0013
        DECR    R4                              ; 5678   0014
        DECR    R5                              ; 5679   0015
        DECR    R6                              ; 567A   0016
L_567B:
        DECR    R7                              ; 567B   0017

        DECLE   $03FF,  $0018,  $0019,  $001A   ; 567C   03FF 0018 0019 001A
        DECLE   $001B,  $0018,  $0019,  $001A   ; 5680   001B 0018 0019 001A
        DECLE   $001B,  $03FF                   ; 5684   001B 03FF
L_5686:
        DECR    R7                              ; 5686   0017

        DECLE   $0016,  $0015,  $0014,  $0013   ; 5687   0016 0015 0014 0013
        DECLE   $0012,  $0011,  $0010,  $000F   ; 568B   0012 0011 0010 000F
        DECLE   $000E,  $03FF,  $000D,  $000C   ; 568F   000E 03FF 000D 000C
        DECLE   $000B,  $000A,  $0009,  $0008   ; 5693   000B 000A 0009 0008
        DECLE   $0007,  $0006,  $0005,  $0004   ; 5697   0007 0006 0005 0004
        DECLE   $03FF,  $001C,  $001D,  $001E   ; 569B   03FF 001C 001D 001E
        DECLE   $001F,  $0020,  $0021,  $0022   ; 569F   001F 0020 0021 0022
        DECLE   $03FF,  $0023,  $0024,  $0025   ; 56A3   03FF 0023 0024 0025
        DECLE   $0026,  $0023,  $0024,  $0025   ; 56A7   0026 0023 0024 0025
        DECLE   $0026,  $03FF,  $0022,  $0021   ; 56AB   0026 03FF 0022 0021
        DECLE   $0020,  $001F,  $001E,  $001D   ; 56AF   0020 001F 001E 001D
        DECLE   $001C,  $03FF,  $0027,  $0028   ; 56B3   001C 03FF 0027 0028
        DECLE   $0029,  $002A,  $002B,  $002C   ; 56B7   0029 002A 002B 002C
        DECLE   $002D,  $002E,  $002F,  $0030   ; 56BB   002D 002E 002F 0030
        DECLE   $03FF,  $0031,  $0032,  $0033   ; 56BF   03FF 0031 0032 0033
        DECLE   $0034,  $0035,  $0036,  $0037   ; 56C3   0034 0035 0036 0037
        DECLE   $0038,  $0039,  $003A,  $03FF   ; 56C7   0038 0039 003A 03FF
        DECLE   $003B,  $003C,  $003D,  $003E   ; 56CB   003B 003C 003D 003E
        DECLE   $003B,  $003C,  $003D,  $003E   ; 56CF   003B 003C 003D 003E
        DECLE   $03FF,  $003A,  $0039,  $0038   ; 56D3   03FF 003A 0039 0038
        DECLE   $0037,  $0036,  $0035,  $0034   ; 56D7   0037 0036 0035 0034
        DECLE   $0033,  $0032,  $0031,  $03FF   ; 56DB   0033 0032 0031 03FF

        GSWD    R0                              ; 56DF   0030
        ADCR    R7                              ; 56E0   002F

        ADCR    R6                              ; 56E1   002E
L_56E2:
        ADCR    R5                              ; 56E2   002D
        DECLE   $002C,  $002B,  $002A,  $0029   ; 56E3   002C 002B 002A 0029
        DECLE   $0028,  $0027,  $03FF,  $003F   ; 56E7   0028 0027 03FF 003F
        DECLE   $0040,  $0041,  $0042,  $0043   ; 56EB   0040 0041 0042 0043
        DECLE   $0044,  $0045,  $03FF,  $0046   ; 56EF   0044 0045 03FF 0046
        DECLE   $0047,  $0048,  $0049,  $0046   ; 56F3   0047 0048 0049 0046
        DECLE   $0047,  $0048,  $0049,  $03FF   ; 56F7   0047 0048 0049 03FF
        DECLE   $0045,  $0044,  $0043,  $0042   ; 56FB   0045 0044 0043 0042
        DECLE   $0041,  $0040,  $003F,  $03FF   ; 56FF   0041 0040 003F 03FF
        DECLE   $000D,  $0057,  $0033,  $0057   ; 5703   000D 0057 0033 0057
        DECLE   $0033,  $0058,  $0032,  $0059   ; 5707   0033 0058 0032 0059
        DECLE   $0032,  $005A,  $0000,  $0000   ; 570B   0032 005A 0000 0000
        DECLE   $0000,  $0000,  $0378,  $0000   ; 570F   0000 0000 0378 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5713   0000 0000 0000 0000
        DECLE   $0300,  $0158,  $0000,  $0000   ; 5717   0300 0158 0000 0000
        DECLE   $0000,  $0000,  $0300,  $02A8   ; 571B   0000 0000 0300 02A8
        DECLE   $0000,  $0000,  $0000,  $0000   ; 571F   0000 0000 0000 0000
        DECLE   $0300,  $0150,  $0000,  $0000   ; 5723   0300 0150 0000 0000
        DECLE   $0000,  $0300,  $02B8,  $0000   ; 5727   0000 0300 02B8 0000
        DECLE   $0000,  $0000,  $0000,  $0300   ; 572B   0000 0000 0000 0300
        DECLE   $0288,  $0300,  $0248,  $03FF   ; 572F   0288 0300 0248 03FF
        DECLE   $0000,  $0000,  $0300,  $02A8   ; 5733   0000 0000 0300 02A8
        DECLE   $0378,  $004A,  $0000,  $0378   ; 5737   0378 004A 0000 0378
        DECLE   $0022,  $0300,  $02E8,  $0000   ; 573B   0022 0300 02E8 0000
        DECLE   $0378,  $006A,  $0000,  $0300   ; 573F   0378 006A 0000 0300
        DECLE   $02A8,  $0378,  $000A,  $0000   ; 5743   02A8 0378 000A 0000
        DECLE   $0378,  $0032,  $0378,  $007A   ; 5747   0378 0032 0378 007A
        DECLE   $0300,  $0110,  $0300,  $0150   ; 574B   0300 0110 0300 0150
        DECLE   $0009,  $000A,  $0378,  $000A   ; 574F   0009 000A 0378 000A
        DECLE   $000E,  $000F                   ; 5753   000E 000F

        CMPI    #$006A, R0                      ; 5755   0378 006A
        SUB     .BTAB.A8,R0                     ; 5757   0300 02A8
        INCR    R7                              ; 5759   000F

        DECLE   $000F                           ; 575A   000F
L_575B:
        CMPI    #$0012, R0                      ; 575B   0378 0012
        DECLE   $0300,  $02A8,  $0010,  $000C   ; 575D   0300 02A8 0010 000C
        DECLE   $000D,  $0378,  $007A,  $0300   ; 5761   000D 0378 007A 0300
        DECLE   $0278,  $0000,  $0378,  $0018   ; 5765   0278 0000 0378 0018
        DECLE   $0000,  $0300,  $01B8,  $0300   ; 5769   0000 0300 01B8 0300
        DECLE   $01D8,  $0378,  $0058,  $0001   ; 576D   01D8 0378 0058 0001
        DECLE   $0002,  $0378,  $0010,  $0003   ; 5771   0002 0378 0010 0003
        DECLE   $0003,  $0300,  $0260,  $0004   ; 5775   0003 0300 0260 0004
        DECLE   $0005,  $0378,  $0061,  $0000   ; 5779   0005 0378 0061 0000
        DECLE   $0378,  $0012,  $0378,  $0058   ; 577D   0378 0012 0378 0058
        DECLE   $0000,  $0300,  $0110,  $0009   ; 5781   0000 0300 0110 0009
        DECLE   $000A,  $0300,  $0150,  $0378   ; 5785   000A 0300 0150 0378
        DECLE   $0060,  $0300,  $02A8,  $0378   ; 5789   0060 0300 02A8 0378
        DECLE   $0038,  $000E,  $000F           ; 578D   0038 000E 000F

        CMPI    #$0069, R0                      ; 5790   0378 0069
        INCR    R7                              ; 5792   000F

        DECLE   $000F                           ; 5793   000F
L_5794:
        CMPI    #$0032, R0                      ; 5794   0378 0032
        DECLE   $0300,  $02F8,  $0010,  $000C   ; 5796   0300 02F8 0010 000C
        DECLE   $000D,  $0378,  $0072,  $0000   ; 579A   000D 0378 0072 0000
        DECLE   $0300,  $0220,  $0000,  $0378   ; 579E   0300 0220 0000 0378
        DECLE   $0048,  $0300,  $0198,  $0300   ; 57A2   0048 0300 0198 0300
        DECLE   $01F8,  $0001,  $0002,  $0378   ; 57A6   01F8 0001 0002 0378
        DECLE   $0018,  $0300,  $01D8,  $0378   ; 57AA   0018 0300 01D8 0378
        DECLE   $0050,  $0006,  $0007,  $0378   ; 57AE   0050 0006 0007 0378
        DECLE   $0071,  $0007,  $0007,  $0300   ; 57B2   0071 0007 0007 0300
        DECLE   $0260,  $0008,  $0004,  $0005   ; 57B6   0260 0008 0004 0005
        DECLE   $0000,  $0300,  $02A8,  $0378   ; 57BA   0000 0300 02A8 0378
        DECLE   $0052,  $0000,  $0300,  $0150   ; 57BE   0052 0000 0300 0150
        DECLE   $0300,  $0110,  $0378,  $000A   ; 57C2   0300 0110 0378 000A
        DECLE   $0009,  $000A,  $0378,  $006A   ; 57C6   0009 000A 0378 006A
        DECLE   $0300,  $0110,  $000B,  $000B   ; 57CA   0300 0110 000B 000B
        DECLE   $000C,  $000D,  $0000,  $0364   ; 57CE   000C 000D 0000 0364
        DECLE   $003A,  $0300,  $02A8,  $0378   ; 57D2   003A 0300 02A8 0378
        DECLE   $004A,  $0000,  $0300,  $02E8   ; 57D6   004A 0000 0300 02E8
        DECLE   $0000,  $0300,  $0138,  $0300   ; 57DA   0000 0300 0138 0300
        DECLE   $0178,  $0009,  $000A,  $036E   ; 57DE   0178 0009 000A 036E
        DECLE   $0010,  $0378,  $0048,  $000E   ; 57E2   0010 0378 0048 000E
        DECLE   $0010,  $0378,  $0020,  $000C   ; 57E6   0010 0378 0020 000C
        DECLE   $000D,  $0378,  $0009,  $0000   ; 57EA   000D 0378 0009 0000
        DECLE   $0300,  $02A8,  $0000,  $0000   ; 57EE   0300 02A8 0000 0000
        DECLE   $0378,  $001A,  $0378,  $0062   ; 57F2   0378 001A 0378 0062
        DECLE   $0300,  $02F8,  $0000,  $0378   ; 57F6   0300 02F8 0000 0378
        DECLE   $006A,  $0000,  $0378,  $007A   ; 57FA   006A 0000 0378 007A
        DECLE   $0300,  $02A8,  $0378,  $0020   ; 57FE   0300 02A8 0378 0020
        DECLE   $0000,  $0300,  $0110,  $0300   ; 5802   0000 0300 0110 0300
        DECLE   $0150,  $0378,  $0058,  $0009   ; 5806   0150 0378 0058 0009
        DECLE   $000A,  $0378,  $0060,  $000E   ; 580A   000A 0378 0060 000E
        DECLE   $0010,  $0378,  $0069,  $000C   ; 580E   0010 0378 0069 000C
        DECLE   $000D,  $0300,  $02E8,  $0378   ; 5812   000D 0300 02E8 0378
        DECLE   $006A,  $0000,  $0300,  $02A8   ; 5816   006A 0000 0300 02A8
        DECLE   $0378,  $0062,  $0000,  $0000   ; 581A   0378 0062 0000 0000
        DECLE   $0364,  $0010,  $0378,  $0058   ; 581E   0364 0010 0378 0058
        DECLE   $0000,  $0000,  $0300,  $02F8   ; 5822   0000 0000 0300 02F8
        DECLE   $0378,  $0049,  $0000,  $0000   ; 5826   0378 0049 0000 0000
        DECLE   $0000,  $0000,  $0300,  $0288   ; 582A   0000 0000 0300 0288
        DECLE   $0300,  $0248,  $0000,  $0000   ; 582E   0300 0248 0000 0000
        DECLE   $03FF,  $0300,  $01D8,  $0000   ; 5832   03FF 0300 01D8 0000
        DECLE   $0300,  $0220,  $0378,  $0022   ; 5836   0300 0220 0378 0022
        DECLE   $0001,  $0002,  $0378,  $0022   ; 583A   0001 0002 0378 0022
        DECLE   $0300,  $02A8,  $0004,  $0005   ; 583E   0300 02A8 0004 0005
        DECLE   $0378,  $005A,  $0300,  $0138   ; 5842   0378 005A 0300 0138
        DECLE   $0009,  $000A,  $0378,  $0032   ; 5846   0009 000A 0378 0032
        DECLE   $000B,  $000B,  $0300,  $01D8   ; 584A   000B 000B 0300 01D8
        DECLE   $000C,  $000D,  $0378,  $0018   ; 584E   000C 000D 0378 0018
        DECLE   $0001,  $0002,  $0300,  $0110   ; 5852   0001 0002 0300 0110
        DECLE   $0378,  $0078,  $0004,  $0005   ; 5856   0378 0078 0004 0005
        DECLE   $0300,  $02A8,  $0009,  $000A   ; 585A   0300 02A8 0009 000A
        DECLE   $0378,  $0030,  $000E,  $0010   ; 585E   0378 0030 000E 0010
        DECLE   $0378,  $0039,  $000C,  $000D   ; 5862   0378 0039 000C 000D
        DECLE   $0000,  $0378,  $0052,  $0300   ; 5866   0000 0378 0052 0300
        DECLE   $02B8,  $0382,  $000A,  $0000   ; 586A   02B8 0382 000A 0000
        DECLE   $0300,  $02A8,  $0378,  $0028   ; 586E   0300 02A8 0378 0028
        DECLE   $0009,  $000A,  $0378,  $0078   ; 5872   0009 000A 0378 0078
        DECLE   $0300,  $0138,  $000E,  $000F   ; 5876   0300 0138 000E 000F

        CMPI    #$0030, R0                      ; 587A   0378 0030
        CMPI    #$0051, R0                      ; 587C   0378 0051
        INCR    R7                              ; 587E   000F
        INCR    R7                              ; 587F   000F

L_5880:
        DECR    R0                              ; 5880   0010
L_5881:
        INCR    R4                              ; 5881   000C
        DECLE   $000D,  $0378,  $0062,  $0000   ; 5882   000D 0378 0062 0000
        DECLE   $0378,  $001A,  $0300,  $0248   ; 5886   0378 001A 0300 0248
        DECLE   $0300,  $0198,  $0001,  $0002   ; 588A   0300 0198 0001 0002
        DECLE   $0378,  $0030,  $0378,  $0078   ; 588E   0378 0030 0378 0078
        DECLE   $0006,  $0007,  $0300,  $0260   ; 5892   0006 0007 0300 0260
        DECLE   $0007,  $0007,  $0378,  $0050   ; 5896   0007 0007 0378 0050
        DECLE   $0008,  $0004,  $0005,  $0378   ; 589A   0008 0004 0005 0378
        DECLE   $0029,  $0300,  $02A8,  $0009   ; 589E   0029 0300 02A8 0009
        DECLE   $000A,  $0300,  $0110,  $0378   ; 58A2   000A 0300 0110 0378
        DECLE   $001A,  $000E,  $000F           ; 58A6   001A 000E 000F

        CMPI    #$0002, R0                      ; 58A9   0378 0002
        INCR    R7                              ; 58AB   000F

        DECLE   $000F                           ; 58AC   000F
L_58AD:
        CMPI    #$0023, R0                      ; 58AD   0378 0023
        DECLE   $0300,  $0278,  $0010,  $000C   ; 58AF   0300 0278 0010 000C
        DECLE   $000D,  $0378,  $0040,  $0001   ; 58B3   000D 0378 0040 0001
        DECLE   $0002,  $0378,  $0048,  $0300   ; 58B7   0002 0378 0048 0300
        DECLE   $0198,  $0006,  $0007,  $0378   ; 58BB   0198 0006 0007 0378
        DECLE   $0010,  $0378,  $0059,  $0007   ; 58BF   0010 0378 0059 0007
        DECLE   $0007,  $0300,  $02E8,  $0008   ; 58C3   0007 0300 02E8 0008
        DECLE   $0004,  $0005,  $0378,  $003A   ; 58C7   0004 0005 0378 003A
        DECLE   $0000,  $0300,  $02A8,  $0009   ; 58CB   0000 0300 02A8 0009
        DECLE   $000A,  $0300,  $02E8,  $000E   ; 58CF   000A 0300 02E8 000E
        DECLE   $000F                           ; 58D3   000F

        CMPI    #$0070, R0                      ; 58D4   0378 0070
        SUB     G_0138, R0                      ; 58D6   0300 0138
        INCR    R7                              ; 58D8   000F

        DECLE   $000F                           ; 58D9   000F
L_58DA:
        CMPI    #$0021, R0                      ; 58DA   0378 0021
        DECLE   $0378,  $0042,  $0010,  $000C   ; 58DC   0378 0042 0010 000C
        DECLE   $000D,  $0000,  $0300,  $0260   ; 58E0   000D 0000 0300 0260
        DECLE   $0378,  $007A,  $0001,  $0002   ; 58E4   0378 007A 0001 0002
        DECLE   $0300,  $01D8,  $0006,  $0007   ; 58E8   0300 01D8 0006 0007
        DECLE   $0378,  $0012,  $0007,  $0007   ; 58EC   0378 0012 0007 0007
        DECLE   $0300,  $0150,  $0008,  $0004   ; 58F0   0300 0150 0008 0004
        DECLE   $0005,  $0378,  $0032,  $0378   ; 58F4   0005 0378 0032 0378
        DECLE   $0042,  $0000,  $0300,  $02A8   ; 58F8   0042 0000 0300 02A8
        DECLE   $0378,  $0023,  $0009,  $000A   ; 58FC   0378 0023 0009 000A
        DECLE   $0378,  $0028,  $0378,  $0060   ; 5900   0378 0028 0378 0060
        DECLE   $0300,  $02A8,  $000E,  $000F   ; 5904   0300 02A8 000E 000F

        CMPI    #$0038, R0                      ; 5908   0378 0038
        INCR    R7                              ; 590A   000F

        DECLE   $000F                           ; 590B   000F
L_590C:
        SUB     G_0110, R0                      ; 590C   0300 0110
        DECLE   $0010,  $000C,  $000D,  $0378   ; 590E   0010 000C 000D 0378
        DECLE   $0019,  $0000,  $0000,  $0300   ; 5912   0019 0000 0000 0300
        DECLE   $02B8,  $0009,  $000A,  $0378   ; 5916   02B8 0009 000A 0378
        DECLE   $0030,  $0300,  $02E8,  $000E   ; 591A   0030 0300 02E8 000E
        DECLE   $0010,  $0378,  $0068,  $000C   ; 591E   0010 0378 0068 000C
        DECLE   $000D,  $0300,  $0260,  $0300   ; 5922   000D 0300 0260 0300
        DECLE   $0198,  $0001,  $0002,  $0004   ; 5926   0198 0001 0002 0004
        DECLE   $0005,  $0300,  $0288,  $0300   ; 592A   0005 0300 0288 0300
        DECLE   $0248,  $0000,  $0000,  $03FF   ; 592E   0248 0000 0000 03FF
        DECLE   $0000,  $0000,  $0300,  $0138   ; 5932   0000 0000 0300 0138
        DECLE   $0378,  $0022,  $0009,  $000A   ; 5936   0378 0022 0009 000A
        DECLE   $0300,  $02B8,  $0378,  $000A   ; 593A   0300 02B8 0378 000A
        DECLE   $0300,  $02E8,  $000B,  $000B   ; 593E   0300 02E8 000B 000B
        DECLE   $0378,  $006A,  $000C,  $000D   ; 5942   0378 006A 000C 000D
        DECLE   $0378,  $007B,  $0000,  $0378   ; 5946   0378 007B 0000 0378
        DECLE   $0050,  $0378,  $0018,  $0300   ; 594A   0050 0378 0018 0300
        DECLE   $0150,  $0300,  $02A8,  $0009   ; 594E   0150 0300 02A8 0009
        DECLE   $000A,  $0378,  $0038,  $0300   ; 5952   000A 0378 0038 0300
        DECLE   $0150,  $000B,  $000B,  $0378   ; 5956   0150 000B 000B 0378
        DECLE   $0051,  $000C,  $000D,  $0300   ; 595A   0051 000C 000D 0300
        DECLE   $02E8,  $0000,  $0300,  $0288   ; 595E   02E8 0000 0300 0288
        DECLE   $0378,  $0001,  $0009,  $000A   ; 5962   0378 0001 0009 000A
        DECLE   $0378,  $007A,  $000B,  $000B   ; 5966   0378 007A 000B 000B
        DECLE   $0300,  $0110,  $000C,  $000D   ; 596A   0300 0110 000C 000D
        DECLE   $0378,  $0020,  $0009,  $000A   ; 596E   0378 0020 0009 000A
        DECLE   $0300,  $02A8,  $0378,  $0070   ; 5972   0300 02A8 0378 0070
        DECLE   $000E,  $000F                   ; 5976   000E 000F

        CMPI    #$0018, R0                      ; 5978   0378 0018
        CMPI    #$0079, R0                      ; 597A   0378 0079
        INCR    R7                              ; 597C   000F

        DECLE   $000F                           ; 597D   000F
L_597E:
        CMPI    #$006A, R0                      ; 597E   0378 006A
        DECLE   $0300,  $0220,  $0010,  $000C   ; 5980   0300 0220 0010 000C
        DECLE   $000D,  $0300,  $01F8,  $0300   ; 5984   000D 0300 01F8 0300
        DECLE   $01B8,  $0378,  $0059,  $0001   ; 5988   01B8 0378 0059 0001
        DECLE   $0002,  $0300,  $0260,  $0378   ; 598C   0002 0300 0260 0378
        DECLE   $0008,  $0003,  $0003,  $0378   ; 5990   0008 0003 0003 0378
        DECLE   $0060,  $0004,  $0005,  $0000   ; 5994   0060 0004 0005 0000
        DECLE   $0300,  $01D8,  $0378,  $0051   ; 5998   0300 01D8 0378 0051
        DECLE   $0001,  $0002,  $0300,  $0238   ; 599C   0001 0002 0300 0238
        DECLE   $0378,  $0028,  $0003,  $0003   ; 59A0   0378 0028 0003 0003
        DECLE   $0378,  $0008,  $0004,  $0005   ; 59A4   0378 0008 0004 0005
        DECLE   $0000,  $0378,  $000A,  $0000   ; 59A8   0000 0378 000A 0000
        DECLE   $0378,  $0052,  $0300,  $0198   ; 59AC   0378 0052 0300 0198
        DECLE   $0000,  $0378,  $001A,  $0378   ; 59B0   0000 0378 001A 0378
        DECLE   $0062,  $0000,  $0300,  $01D8   ; 59B4   0062 0000 0300 01D8
        DECLE   $0001,  $0002,  $0300,  $0260   ; 59B8   0001 0002 0300 0260
        DECLE   $0378,  $0028,  $0003,  $0003   ; 59BC   0378 0028 0003 0003
        DECLE   $0378,  $0030,  $0004,  $0005   ; 59C0   0378 0030 0004 0005
        DECLE   $0300,  $01D8,  $0000,  $0300   ; 59C4   0300 01D8 0000 0300
        DECLE   $0198,  $0300,  $0278,  $0001   ; 59C8   0198 0300 0278 0001
        DECLE   $0002,  $0378,  $0032,  $0003   ; 59CC   0002 0378 0032 0003
        DECLE   $0003,  $0004,  $0005,  $0300   ; 59D0   0003 0004 0005 0300
        DECLE   $0260,  $0000,  $0378,  $007A   ; 59D4   0260 0000 0378 007A
        DECLE   $0001,  $0002,  $0300,  $0150   ; 59D8   0001 0002 0300 0150
        DECLE   $0378,  $0029,  $0003,  $0003   ; 59DC   0378 0029 0003 0003
        DECLE   $0300,  $0110,  $0004,  $0005   ; 59E0   0300 0110 0004 0005
        DECLE   $0378,  $0018,  $0300,  $02A8   ; 59E4   0378 0018 0300 02A8
        DECLE   $0009,  $000A,  $0378,  $0048   ; 59E8   0009 000A 0378 0048
        DECLE   $000E,  $000F                   ; 59EC   000E 000F

        SUB     G_0138, R0                      ; 59EE   0300 0138
        INCR    R7                              ; 59F0   000F

        DECLE   $000F                           ; 59F1   000F
L_59F2:
        CMPI    #$0050, R0                      ; 59F2   0378 0050
        DECLE   $0010,  $000C,  $000D,  $0300   ; 59F4   0010 000C 000D 0300
        DECLE   $02B8,  $0009,  $000A,  $0378   ; 59F8   02B8 0009 000A 0378
        DECLE   $0022,  $0300,  $0110,  $000B   ; 59FC   0022 0300 0110 000B
        DECLE   $000B,  $0300,  $02E8,  $000C   ; 5A00   000B 0300 02E8 000C
        DECLE   $000D,  $0378,  $0072,  $0300   ; 5A04   000D 0378 0072 0300
        DECLE   $0150,  $0000,  $0378,  $0018   ; 5A08   0150 0000 0378 0018
        DECLE   $0300,  $0110,  $0009,  $000A   ; 5A0C   0300 0110 0009 000A
        DECLE   $0300,  $02E8,  $000B,  $000B   ; 5A10   0300 02E8 000B 000B
        DECLE   $0378,  $0038,  $0378,  $0068   ; 5A14   0378 0038 0378 0068
        DECLE   $000C,  $000D,  $0378,  $0021   ; 5A18   000C 000D 0378 0021
        DECLE   $0000,  $0300,  $0110,  $0378   ; 5A1C   0000 0300 0110 0378
        DECLE   $000A,  $0009,  $000A,  $0300   ; 5A20   000A 0009 000A 0300
        DECLE   $02A8,  $0378,  $007A,  $000B   ; 5A24   02A8 0378 007A 000B
        DECLE   $000B,  $000C,  $000D,  $0300   ; 5A28   000B 000C 000D 0300
        DECLE   $0288,  $0300,  $0248,  $0000   ; 5A2C   0288 0300 0248 0000
        DECLE   $0000,  $03FF,  $0000,  $0000   ; 5A30   0000 03FF 0000 0000
        DECLE   $0300,  $0138,  $0300,  $02F8   ; 5A34   0300 0138 0300 02F8
        DECLE   $0378,  $0022,  $0009,  $000A   ; 5A38   0378 0022 0009 000A
        DECLE   $0378,  $001A,  $000E,  $0010   ; 5A3C   0378 001A 000E 0010
        DECLE   $0300,  $02A8,  $000C,  $000D   ; 5A40   0300 02A8 000C 000D
        DECLE   $0378,  $004A,  $0300,  $0110   ; 5A44   0378 004A 0300 0110
        DECLE   $0009,  $000A,  $0378,  $005A   ; 5A48   0009 000A 0378 005A
        DECLE   $000B,  $000B,  $0300,  $01D8   ; 5A4C   000B 000B 0300 01D8
        DECLE   $000C,  $000D,  $0300,  $0260   ; 5A50   000C 000D 0300 0260
        DECLE   $0378,  $0050,  $0001,  $0002   ; 5A54   0378 0050 0001 0002
        DECLE   $0300,  $01D8,  $0378,  $0028   ; 5A58   0300 01D8 0378 0028
        DECLE   $0006,  $0007,  $0378,  $0010   ; 5A5C   0006 0007 0378 0010
        DECLE   $0007,  $0007,  $0300,  $0138   ; 5A60   0007 0007 0300 0138
        DECLE   $0008,  $0004,  $0005,  $0378   ; 5A64   0008 0004 0005 0378
        DECLE   $0039,  $0300,  $02A8,  $0009   ; 5A68   0039 0300 02A8 0009
        DECLE   $000A,  $0300,  $0110,  $000E   ; 5A6C   000A 0300 0110 000E
        DECLE   $000F                           ; 5A70   000F

        CMPI    #$0072, R0                      ; 5A71   0378 0072
        INCR    R7                              ; 5A73   000F

        DECLE   $000F                           ; 5A74   000F
L_5A75:
        SUB     G_01D8, R0                      ; 5A75   0300 01D8
        DECLE   $0010,  $000C,  $000D,  $0378   ; 5A77   0010 000C 000D 0378
        DECLE   $0079,  $0300,  $0278,  $0001   ; 5A7B   0079 0300 0278 0001
        DECLE   $0002,  $0300,  $01D8,  $0006   ; 5A7F   0002 0300 01D8 0006
        DECLE   $0007,  $0378,  $0020,  $0378   ; 5A83   0007 0378 0020 0378
        DECLE   $0068,  $0007,  $0007,  $0300   ; 5A87   0068 0007 0007 0300
        DECLE   $02E8,  $0008,  $0004,  $0005   ; 5A8B   02E8 0008 0004 0005
        DECLE   $0300,  $02A8,  $0378,  $0018   ; 5A8F   0300 02A8 0378 0018
        DECLE   $0300,  $0150,  $0009,  $000A   ; 5A93   0300 0150 0009 000A
        DECLE   $0378,  $0000,  $000E,  $0010   ; 5A97   0378 0000 000E 0010
        DECLE   $0300,  $02A8,  $000C,  $000D   ; 5A9B   0300 02A8 000C 000D
        DECLE   $0300,  $02E8,  $0009,  $000A   ; 5A9F   0300 02E8 0009 000A
        DECLE   $0300,  $0110,  $0378,  $0072   ; 5AA3   0300 0110 0378 0072
        DECLE   $000B,  $000B,  $0378,  $006A   ; 5AA7   000B 000B 0378 006A
        DECLE   $000C,  $000D,  $0378,  $0052   ; 5AAB   000C 000D 0378 0052
        DECLE   $0000,  $0300,  $02A8,  $0378   ; 5AAF   0000 0300 02A8 0378
        DECLE   $001A,  $0000,  $0378,  $0078   ; 5AB3   001A 0000 0378 0078
        DECLE   $0300,  $0110,  $0378,  $0010   ; 5AB7   0300 0110 0378 0010
        DECLE   $0009,  $000A,  $0378,  $0078   ; 5ABB   0009 000A 0378 0078
        DECLE   $0378,  $0009,  $000E,  $0010   ; 5ABF   0378 0009 000E 0010
        DECLE   $0300,  $02A8,  $0378,  $0042   ; 5AC3   0300 02A8 0378 0042
        DECLE   $000C,  $000D,  $0300,  $0110   ; 5AC7   000C 000D 0300 0110
        DECLE   $0009,  $000A,  $0300,  $02A8   ; 5ACB   0009 000A 0300 02A8
        DECLE   $0378,  $0052,  $000B,  $000B   ; 5ACF   0378 0052 000B 000B
        DECLE   $0300,  $01F8,  $000C,  $000D   ; 5AD3   0300 01F8 000C 000D
        DECLE   $0300,  $0260,  $0378,  $0071   ; 5AD7   0300 0260 0378 0071
        DECLE   $0001,  $0002,  $0378,  $0050   ; 5ADB   0001 0002 0378 0050
        DECLE   $0378,  $0020,  $0006,  $0007   ; 5ADF   0378 0020 0006 0007
        DECLE   $0378,  $0008,  $0007,  $0007   ; 5AE3   0378 0008 0007 0007
        DECLE   $0300,  $0150,  $0008,  $0004   ; 5AE7   0300 0150 0008 0004
        DECLE   $0005,  $0300,  $02A8,  $0378   ; 5AEB   0005 0300 02A8 0378
        DECLE   $001A,  $0009,  $000A,  $0378   ; 5AEF   001A 0009 000A 0378
        DECLE   $0029,  $0378,  $0078,  $000E   ; 5AF3   0029 0378 0078 000E
        DECLE   $000F                           ; 5AF7   000F

        SUB     G_0138, R0                      ; 5AF8   0300 0138
        CMPI    #$0070, R0                      ; 5AFA   0378 0070
        INCR    R7                              ; 5AFC   000F
        INCR    R7                              ; 5AFD   000F

L_5AFE:
        DECR    R0                              ; 5AFE   0010
L_5AFF:
        INCR    R4                              ; 5AFF   000C
        DECLE   $000D,  $0300,  $01D8,  $0378   ; 5B00   000D 0300 01D8 0378
        DECLE   $007A,  $0001,  $0002,  $0300   ; 5B04   007A 0001 0002 0300
        DECLE   $0260,  $0006,  $0007,  $0378   ; 5B08   0260 0006 0007 0378
        DECLE   $0012,  $0007,  $0007,  $0378   ; 5B0C   0012 0007 0007 0378
        DECLE   $001A,  $0008,  $0004,  $0005   ; 5B10   001A 0008 0004 0005
        DECLE   $0300,  $02B8,  $0009,  $000A   ; 5B14   0300 02B8 0009 000A
        DECLE   $0378,  $0048,  $000E,  $0010   ; 5B18   0378 0048 000E 0010
        DECLE   $0378,  $0070,  $0378,  $0028   ; 5B1C   0378 0070 0378 0028
        DECLE   $000C,  $000D,  $0300,  $0110   ; 5B20   000C 000D 0300 0110
        DECLE   $0009,  $000A,  $000B,  $000B   ; 5B24   0009 000A 000B 000B
        DECLE   $000C,  $000D,  $0300,  $0288   ; 5B28   000C 000D 0300 0288
        DECLE   $0300,  $0248,  $0000,  $0000   ; 5B2C   0300 0248 0000 0000
        DECLE   $03FF                           ; 5B30   03FF
L_5B31:
        PSHR    R5                              ; 5B31   0275

        JSR     R5,     L_5C9B                  ; 5B32   0004 015C 009B

        MVI     G_0132, R0                      ; 5B35   0280 0132
        ANDI    #$00FF, R0                      ; 5B37   03B8 00FF
        BEQ     L_5B9F                          ; 5B39   0204 0064

        MVI     G_0133, R1                      ; 5B3B   0281 0133
        ANDI    #$00FF, R1                      ; 5B3D   03B9 00FF
        ADDR    R0,     R1                      ; 5B3F   00C1
        MVO     R1,     G_0133                  ; 5B40   0241 0133
        CMPI    #$00C8, R1                      ; 5B42   0379 00C8
        BLT     L_5B9F                          ; 5B44   0205 0059

        SUBI    #$00C8, R1                      ; 5B46   0339 00C8
        MVO     R1,     G_0133                  ; 5B48   0241 0133
        MVI     G_0123, R1                      ; 5B4A   0281 0123
        XORI    #$0001, R1                      ; 5B4C   03F9 0001
        MVO     R1,     G_0123                  ; 5B4E   0241 0123
        MVO     R1,     G_0124                  ; 5B50   0241 0124
L_5B52:
        MVI     G_0130, R0                      ; 5B52   0280 0130
L_5B54:
        SDBD                                    ; 5B54   0001
        MVII    #$5703, R4                      ; 5B55   02BC 0003 0057
        ADD     G_0121, R4                      ; 5B58   02C4 0121
        ADD     G_0121, R4                      ; 5B5A   02C4 0121
        SDBD                                    ; 5B5C   0001
        MVI@    R4,     R1                      ; 5B5D   02A1
        MOVR    R1,     R4                      ; 5B5E   008C
        ADDR    R0,     R4                      ; 5B5F   00C4
        MVI@    R4,     R1                      ; 5B60   02A1
        MVO     R1,     G_0146                  ; 5B61   0241 0146
        CMPI    #$03FF, R1                      ; 5B63   0379 03FF
        BEQ     L_5BA0                          ; 5B65   0204 0039

        CMPI    #$0300, R1                      ; 5B67   0379 0300
        BGE     L_5C00                          ; 5B69   020D 0095

        MOVR    R1,     R5                      ; 5B6B   008D
        MVI     G_0130, R0                      ; 5B6C   0280 0130
        ANDI    #$001F, R1                      ; 5B6E   03B9 001F
        SDBD                                    ; 5B70   0001
        MVII    #$5634, R4                      ; 5B71   02BC 0034 0056
        SLL     R1,     1                       ; 5B74   0049
        ADDR    R1,     R4                      ; 5B75   00CC
        SDBD                                    ; 5B76   0001
        MVI@    R4,     R2                      ; 5B77   02A2
        MVI     G_0131, R3                      ; 5B78   0283 0131
        ADDR    R3,     R2                      ; 5B7A   00DA
        MVI@    R2,     R1                      ; 5B7B   0291
        INCR    R3                              ; 5B7C   000B
        MVO     R3,     G_0131                  ; 5B7D   0243 0131
        CMPI    #$03FF, R1                      ; 5B7F   0379 03FF
        BNEQ    L_5B8B                          ; 5B81   020C 0008

        CLRR    R3                              ; 5B83   01DB
        MVO     R3,     G_0131                  ; 5B84   0243 0131
        INCR    R0                              ; 5B86   0008
        MVO     R0,     G_0130                  ; 5B87   0240 0130
        B       L_5B54                          ; 5B89   0220 0036

L_5B8B:
        MVO     R1,     G_012B                  ; 5B8B   0241 012B
        MVI     G_0343, R1                      ; 5B8D   0281 0343
        INCR    R1                              ; 5B8F   0009
        MVO     R1,     G_0343                  ; 5B90   0241 0343
        MVI     G_0148, R1                      ; 5B92   0281 0148
        TSTR    R1                              ; 5B94   0089
        BEQ     L_5B9C                          ; 5B95   0204 0005

        MVII    #$0009, R4                      ; 5B97   02BC 0009

        JSR     R5,     L_6DB4                  ; 5B99   0004 016C 01B4
L_5B9C:
        JSR     R5,     L_6630                  ; 5B9C   0004 0164 0230

L_5B9F:
        PULR    R7                              ; 5B9F   02B7

L_5BA0:
        MVI     G_011C, R0                      ; 5BA0   0280 011C
        CMPI    #$0000, R0                      ; 5BA2   0378 0000
        BEQ     L_5BF3                          ; 5BA4   0204 004D

        CMPI    #$0004, R0                      ; 5BA6   0378 0004
        BNEQ    L_5BB0                          ; 5BA8   020C 0006

        MVII    #$0005, R0                      ; 5BAA   02B8 0005
        MVO     R0,     G_011C                  ; 5BAC   0240 011C
        B       L_5BFC                          ; 5BAE   0200 004C

L_5BB0:
        MVI     G_011D, R0                      ; 5BB0   0280 011D
        INCR    R0                              ; 5BB2   0008
        MVO     R0,     G_011D                  ; 5BB3   0240 011D
        B       L_5BC9                          ; 5BB5   0200 0012

        DECLE   $0041,  $003C,  $0043,  $0032   ; 5BB7   0041 003C 0043 0032
        DECLE   $0045,  $002D,  $0047,  $0028   ; 5BBB   0045 002D 0047 0028
        DECLE   $004B,  $0023,  $004D,  $001E   ; 5BBF   004B 0023 004D 001E
        DECLE   $0051,  $0019,  $0055,  $0014   ; 5BC3   0051 0019 0055 0014
        DECLE   $00FF,  $0000                   ; 5BC7   00FF 0000
L_5BC9:
        SDBD                                    ; 5BC9   0001
        MVII    #$5BB7, R5                      ; 5BCA   02BD 00B7 005B
L_5BCD:
        MVI@    R5,     R1                      ; 5BCD   02A9
        MVI     G_0345, R0                      ; 5BCE   0280 0345
        SLR     R0,     2                       ; 5BD0   0064
        SLR     R0,     2                       ; 5BD1   0064
        CMPR    R0,     R1                      ; 5BD2   0141
        BGT     L_5BD8                          ; 5BD3   020E 0003

        INCR    R5                              ; 5BD5   000D
        B       L_5BCD                          ; 5BD6   0220 000A

L_5BD8:
        MVI@    R5,     R1                      ; 5BD8   02A9
        TSTR    R1                              ; 5BD9   0089
        BEQ     L_5BF3                          ; 5BDA   0204 0017

        SLL     R1,     2                       ; 5BDC   004D
        SLL     R1,     2                       ; 5BDD   004D
        MVI     G_0344, R0                      ; 5BDE   0280 0344
        ADDR    R1,     R0                      ; 5BE0   00C8
        MVO     R0,     G_0344                  ; 5BE1   0240 0344
        MVI     G_0345, R0                      ; 5BE3   0280 0345
        MVO     R0,     G_0346                  ; 5BE5   0240 0346
        MVII    #$0080, R0                      ; 5BE7   02B8 0080
        MVO     R0,     G_0155                  ; 5BE9   0240 0155
        CLRR    R0                              ; 5BEB   01C0
        MVO     R0,     G_0345                  ; 5BEC   0240 0345
        MVII    #$0006, R4                      ; 5BEE   02BC 0006

        JSR     R5,     L_6DB4                  ; 5BF0   0004 016C 01B4

L_5BF3:
        CLRR    R0                              ; 5BF3   01C0
        MVO     R0,     G_0130                  ; 5BF4   0240 0130
        MVO     R0,     G_0131                  ; 5BF6   0240 0131
        MVO     R0,     G_0146                  ; 5BF8   0240 0146
        B       L_5B52                          ; 5BFA   0220 00A9

L_5BFC:
        CLRR    R0                              ; 5BFC   01C0
        MVO     R0,     G_0146                  ; 5BFD   0240 0146
        PULR    R7                              ; 5BFF   02B7

L_5C00:
        ADDI    #$0002, R0                      ; 5C00   02F8 0002
        MVO     R0,     G_0130                  ; 5C02   0240 0130
        MVI@    R4,     R0                      ; 5C04   02A0
        MOVR    R0,     R2                      ; 5C05   0082
        ANDI    #$0007, R2                      ; 5C06   03BA 0007
        CMP     G_011D, R2                      ; 5C08   0342 011D
        BGT     L_5B52                          ; 5C0A   022E 00B9

        MVII    #$00FF, R2                      ; 5C0C   02BA 00FF
        MVII    #$031A, R3                      ; 5C0E   02BB 031A
        MVII    #$0134, R4                      ; 5C10   02BC 0134
L_5C12:
        CMP@    R4,     R2                      ; 5C12   0362
        BEQ     L_5C2E                          ; 5C13   0204 0019

        INCR    R3                              ; 5C15   000B
        ADDI    #$0002, R4                      ; 5C16   02FC 0002
        CMPI    #$0320, R3                      ; 5C18   037B 0320
        BLT     L_5C12                          ; 5C1A   0225 0009
        B       L_5B52                          ; 5C1C   0220 00CB

        DECLE   $0005                           ; 5C1E   0005

        INCR    R0                              ; 5C1F   0008
        SETC                                    ; 5C20   0007
        INCR    R0                              ; 5C21   0008

        JSR     R4,     .EXEC.801               ; 5C22   0004 0018 0001
        DECLE   $0018,  $0006,  $0018,  $0005   ; 5C25   0018 0006 0018 0005

        COMR    R0                              ; 5C29   0018
        EIS                                     ; 5C2A   0002
        COMR    R0                              ; 5C2B   0018
        CLRC                                    ; 5C2C   0006
        INCR    R0                              ; 5C2D   0008
L_5C2E:
        ANDI    #$00FF, R1                      ; 5C2E   03B9 00FF
        DECR    R4                              ; 5C30   0014
        MVO@    R1,     R4                      ; 5C31   0261
        PSHR    R3                              ; 5C32   0273
        SUBI    #$031A, R3                      ; 5C33   033B 031A
        SDBD                                    ; 5C35   0001
        MVII    #$0332, R2                      ; 5C36   02BA 0032 0003
        ADDR    R3,     R2                      ; 5C39   00DA
        MOVR    R0,     R1                      ; 5C3A   0081
        SWAP    R1,     1                       ; 5C3B   0041
        ANDI    #$0003, R1                      ; 5C3C   03B9 0003
        INCR    R1                              ; 5C3E   0009
        ADDR    R7,     R1                      ; 5C3F   00F9
        ADD@    R1,     R7                      ; 5C40   02CF
        INCR    R7                              ; 5C41   000F

        INCR    R1                              ; 5C42   0009
L_5C43:
        DIS                                     ; 5C43   0003
        SDBD                                    ; 5C44   0001
        MVII    #$A244, R5                      ; 5C45   02BD 0044 00A2
        B       L_5C54                          ; 5C48   0200 000A

        SDBD                                    ; 5C4A   0001
        MVII    #$A220, R5                      ; 5C4B   02BD 0020 00A2
        B       L_5C54                          ; 5C4E   0200 0004

        SDBD                                    ; 5C50   0001
        MVII    #$A1FC, R5                      ; 5C51   02BD 00FC 00A1
L_5C54:
        MOVR    R3,     R1                      ; 5C54   0099
        ADDR    R1,     R1                      ; 5C55   00C9
        ADDR    R1,     R5                      ; 5C56   00CD
        ADDR    R1,     R1                      ; 5C57   00C9
        ADDR    R1,     R5                      ; 5C58   00CD
        MVO@    R5,     R2                      ; 5C59   0255
        MVII    #$0322, R5                      ; 5C5A   02BD 0322
        ADDR    R3,     R5                      ; 5C5C   00DD
        MVI@    R5,     R1                      ; 5C5D   02A9
        SDBD                                    ; 5C5E   0001
        ANDI    #$FEFF, R1                      ; 5C5F   03B9 00FF 00FE
        DECR    R5                              ; 5C62   0015
        MVO@    R1,     R5                      ; 5C63   0269
        CLRR    R1                              ; 5C64   01C9
        MVII    #$0125, R5                      ; 5C65   02BD 0125
        ADDR    R3,     R5                      ; 5C67   00DD
        MVO@    R1,     R5                      ; 5C68   0269
        PULR    R3                              ; 5C69   02B3
        MVO@    R1,     R4                      ; 5C6A   0261
        MOVR    R0,     R1                      ; 5C6B   0081
        SLL     R1,     2                       ; 5C6C   004D
        SWAP    R1,     1                       ; 5C6D   0041
        MVO@    R1,     R4                      ; 5C6E   0261
        PSHR    R4                              ; 5C6F   0274
        SDBD                                    ; 5C70   0001
        MVII    #$5D93, R4                      ; 5C71   02BC 0093 005D
        MVI     G_012B, R1                      ; 5C74   0281 012B
        SLL     R1,     2                       ; 5C76   004D
        SLL     R1,     1                       ; 5C77   0049
        ADDR    R1,     R4                      ; 5C78   00CC
        MVI@    R4,     R1                      ; 5C79   02A1
        SLR     R1,     2                       ; 5C7A   0065
        ANDI    #$00F8, R1                      ; 5C7B   03B9 00F8
        PULR    R4                              ; 5C7D   02B4
        MVO@    R1,     R3                      ; 5C7E   0259
        ADDI    #$0008, R3                      ; 5C7F   02FB 0008
        MVII    #$0030, R1                      ; 5C81   02B9 0030
        MVO@    R1,     R3                      ; 5C83   0259
        MOVR    R3,     R1                      ; 5C84   0099
        SUBI    #$0322, R1                      ; 5C85   0339 0322
        ADDR    R1,     R1                      ; 5C87   00C9
        ADDI    #$0034, R1                      ; 5C88   02F9 0034
        SLL     R1,     2                       ; 5C8A   004D
        SLL     R1,     1                       ; 5C8B   0049
        ANDI    #$0038, R0                      ; 5C8C   03B8 0038
        SLR     R0,     2                       ; 5C8E   0064
        SDBD                                    ; 5C8F   0001
        ADDI    #$5C1E, R0                      ; 5C90   02F8 001E 005C
        MOVR    R0,     R4                      ; 5C93   0084
        SDBD                                    ; 5C94   0001
        XOR@    R4,     R1                      ; 5C95   03E1
        ADDI    #$0008, R3                      ; 5C96   02FB 0008
        MVO@    R1,     R3                      ; 5C98   0259
        B       L_5B52                          ; 5C99   0220 0148

L_5C9B:
        PSHR    R5                              ; 5C9B   0275
        MVI     G_011C, R0                      ; 5C9C   0280 011C
        CMPI    #$0000, R0                      ; 5C9E   0378 0000
        BEQ     L_5CAF                          ; 5CA0   0204 000D

        MVI     G_0132, R0                      ; 5CA2   0280 0132
        MVII    #$0003, R1                      ; 5CA4   02B9 0003
        SDBD                                    ; 5CA6   0001
        MVII    #$3207, R3                      ; 5CA7   02BB 0007 0032
        MVII    #$0225, R4                      ; 5CAA   02BC 0225

        JSR     R5,     X_PRNUM_RGT             ; 5CAC   0004 0118 00C5

L_5CAF:
        PULR    R7                              ; 5CAF   02B7

        DECLE   $0066,  $005D,  $0060,  $005D   ; 5CB0   0066 005D 0060 005D
        DECLE   $005A,  $005D,  $0054,  $005D   ; 5CB4   005A 005D 0054 005D
        DECLE   $0051,  $005D,  $0045,  $005D   ; 5CB8   0051 005D 0045 005D
        DECLE   $0039,  $005D,  $002D,  $005D   ; 5CBC   0039 005D 002D 005D
        DECLE   $0021,  $005D,  $002D,  $005D   ; 5CC0   0021 005D 002D 005D
        DECLE   $0039,  $005D,  $0045,  $005D   ; 5CC4   0039 005D 0045 005D
        DECLE   $0051,  $005D,  $0054,  $005D   ; 5CC8   0051 005D 0054 005D
        DECLE   $005A,  $005D,  $0060,  $005D   ; 5CCC   005A 005D 0060 005D
        DECLE   $0010,  $0010,  $0008,  $0008   ; 5CD0   0010 0010 0008 0008
        DECLE   $0008,  $0010,  $0000,  $0000   ; 5CD4   0008 0010 0000 0000
        DECLE   $0000,  $0010,  $0018,  $0018   ; 5CD8   0000 0010 0018 0018
        DECLE   $0018,  $0010,  $0020,  $0020   ; 5CDC   0018 0010 0020 0020
        DECLE   $0020,  $0010,  $0010,  $0010   ; 5CE0   0020 0010 0010 0010
        DECLE   $000E,  $0010,  $0012,  $0014   ; 5CE4   000E 0010 0012 0014
        DECLE   $0016,  $0018,  $0018,  $0018   ; 5CE8   0016 0018 0018 0018
        DECLE   $000E,  $0010,  $0012,  $0014   ; 5CEC   000E 0010 0012 0014
        DECLE   $000A,  $000C,  $000C,  $000C   ; 5CF0   000A 000C 000C 000C
        DECLE   $0002,  $0004                   ; 5CF4   0002 0004

        CLRC                                    ; 5CF6   0006
        INCR    R0                              ; 5CF7   0008
        INCR    R2                              ; 5CF8   000A
        INCR    R4                              ; 5CF9   000C
        INCR    R4                              ; 5CFA   000C
        INCR    R4                              ; 5CFB   000C
        INCR    R6                              ; 5CFC   000E
        DECR    R0                              ; 5CFD   0010
        DECR    R2                              ; 5CFE   0012
        DECR    R4                              ; 5CFF   0014
        INCR    R2                              ; 5D00   000A
        INCR    R4                              ; 5D01   000C
        INCR    R4                              ; 5D02   000C
        INCR    R4                              ; 5D03   000C
        INCR    R6                              ; 5D04   000E
        DECR    R0                              ; 5D05   0010
        DECR    R2                              ; 5D06   0012
        DECR    R4                              ; 5D07   0014
        DECR    R6                              ; 5D08   0016
        COMR    R0                              ; 5D09   0018
        COMR    R0                              ; 5D0A   0018
        COMR    R0                              ; 5D0B   0018
L_5D0C:
        PSHR    R5                              ; 5D0C   0275
        MOVR    R0,     R1                      ; 5D0D   0081
        SDBD                                    ; 5D0E   0001
        MVII    #$5CB0, R4                      ; 5D0F   02BC 00B0 005C
        MVI     G_0123, R0                      ; 5D12   0280 0123
        MVI     G_0320, R2                      ; 5D14   0282 0320
        SDBD                                    ; 5D16   0001
        ANDI    #$FBFF, R2                      ; 5D17   03BA 00FF 00FB
        ANDI    #$0001, R0                      ; 5D1A   03B8 0001
        SLL     R1,     1                       ; 5D1C   0049
        ADDR    R1,     R4                      ; 5D1D   00CC
        SDBD                                    ; 5D1E   0001
        MVI@    R4,     R1                      ; 5D1F   02A1
        MOVR    R1,     R7                      ; 5D20   008F

        SDBD                                    ; 5D21   0001
        MVII    #$FFFC, R4                      ; 5D22   02BC 00FC 00FF
        XORI    #$0008, R0                      ; 5D25   03F8 0008
        SDBD                                    ; 5D27   0001
        XORI    #$0400, R2                      ; 5D28   03FA 0000 0004
        B       L_5D6C                          ; 5D2B   0200 003F

        SDBD                                    ; 5D2D   0001
        MVII    #$FFFD, R4                      ; 5D2E   02BC 00FD 00FF
        XORI    #$0006, R0                      ; 5D31   03F8 0006
        SDBD                                    ; 5D33   0001
        XORI    #$0400, R2                      ; 5D34   03FA 0000 0004
        B       L_5D6C                          ; 5D37   0200 0033

        SDBD                                    ; 5D39   0001
        MVII    #$FFFE, R4                      ; 5D3A   02BC 00FE 00FF
        XORI    #$0004, R0                      ; 5D3D   03F8 0004
        SDBD                                    ; 5D3F   0001
        XORI    #$0400, R2                      ; 5D40   03FA 0000 0004
        B       L_5D6C                          ; 5D43   0200 0027

        SDBD                                    ; 5D45   0001
        MVII    #$FFFF, R4                      ; 5D46   02BC 00FF 00FF
        XORI    #$0002, R0                      ; 5D49   03F8 0002
        SDBD                                    ; 5D4B   0001
        XORI    #$0400, R2                      ; 5D4C   03FA 0000 0004
        B       L_5D6C                          ; 5D4F   0200 001B

        CLRR    R4                              ; 5D51   01E4
        B       L_5D6C                          ; 5D52   0200 0018

        MVII    #$0001, R4                      ; 5D54   02BC 0001
        XORI    #$0002, R0                      ; 5D56   03F8 0002
        B       L_5D6C                          ; 5D58   0200 0012

        MVII    #$0002, R4                      ; 5D5A   02BC 0002
        XORI    #$0004, R0                      ; 5D5C   03F8 0004
        B       L_5D6C                          ; 5D5E   0200 000C

        MVII    #$0003, R4                      ; 5D60   02BC 0003
        XORI    #$0006, R0                      ; 5D62   03F8 0006
        B       L_5D6C                          ; 5D64   0200 0006

        MVII    #$0004, R4                      ; 5D66   02BC 0004
        XORI    #$0008, R0                      ; 5D68   03F8 0008
        B       L_5D6C                          ; 5D6A   0200 0000

L_5D6C:
        MVO     R0,     G_0123                  ; 5D6C   0240 0123
        MVO     R0,     G_0124                  ; 5D6E   0240 0124
        MVO     R2,     G_0320                  ; 5D70   0242 0320
        MVO     R2,     G_0321                  ; 5D72   0242 0321
        MVI     G_0318, R0                      ; 5D74   0280 0318
        MOVR    R0,     R1                      ; 5D76   0081
        ANDI    #$00FF, R1                      ; 5D77   03B9 00FF
        XORR    R1,     R0                      ; 5D79   01C8
        ADDR    R4,     R1                      ; 5D7A   00E1
        CMPI    #$0010, R1                      ; 5D7B   0379 0010
        BLE     L_5D85                          ; 5D7D   0206 0006

        CMPI    #$0098, R1                      ; 5D7F   0379 0098
        BGE     L_5D89                          ; 5D81   020D 0006
        B       L_5D8B                          ; 5D83   0200 0006

L_5D85:
        MVII    #$0010, R1                      ; 5D85   02B9 0010
        B       L_5D8B                          ; 5D87   0200 0002

L_5D89:
        MVII    #$0098, R1                      ; 5D89   02B9 0098
L_5D8B:
        ANDI    #$00FF, R1                      ; 5D8B   03B9 00FF
        XORR    R1,     R0                      ; 5D8D   01C8
        MVO     R0,     G_0318                  ; 5D8E   0240 0318
        MVO     R0,     G_0319                  ; 5D90   0240 0319
        PULR    R7                              ; 5D92   02B7

        DECLE   $0052,  $0055,  $004E,  $005A   ; 5D93   0052 0055 004E 005A
        DECLE   $004A,  $0060,  $0044,  $0064   ; 5D97   004A 0060 0044 0064
        DECLE   $003E,  $006A,  $0038,  $0070   ; 5D9B   003E 006A 0038 0070
        DECLE   $0034,  $0074,  $0030,  $0078   ; 5D9F   0034 0074 0030 0078
        DECLE   $0052,  $0055,  $004E,  $005A   ; 5DA3   0052 0055 004E 005A
        DECLE   $004A,  $0060,  $0044,  $0064   ; 5DA7   004A 0060 0044 0064
        DECLE   $003E,  $006A,  $0038,  $0070   ; 5DAB   003E 006A 0038 0070
        DECLE   $0034,  $0074,  $0030,  $0078   ; 5DAF   0034 0074 0030 0078
        DECLE   $0052,  $0055,  $004E,  $005A   ; 5DB3   0052 0055 004E 005A
        DECLE   $004A,  $0060,  $0044,  $0064   ; 5DB7   004A 0060 0044 0064
        DECLE   $003E,  $006A,  $0038,  $0070   ; 5DBB   003E 006A 0038 0070
        DECLE   $0034,  $0074,  $0030,  $0078   ; 5DBF   0034 0074 0030 0078
        DECLE   $0052,  $0055,  $004E,  $005A   ; 5DC3   0052 0055 004E 005A
        DECLE   $004A,  $0060,  $0044,  $0064   ; 5DC7   004A 0060 0044 0064
        DECLE   $003E,  $006A,  $0038,  $0070   ; 5DCB   003E 006A 0038 0070
        DECLE   $0034,  $0074,  $0030,  $0078   ; 5DCF   0034 0074 0030 0078
        DECLE   $0052,  $0055,  $004C,  $005A   ; 5DD3   0052 0055 004C 005A
        DECLE   $0048,  $005E,  $0044,  $005E   ; 5DD7   0048 005E 0044 005E
        DECLE   $003E,  $0068,  $0038,  $006E   ; 5DDB   003E 0068 0038 006E
        DECLE   $0034,  $0072,  $0030,  $0076   ; 5DDF   0034 0072 0030 0076
        DECLE   $0050,  $0053,  $004A,  $0058   ; 5DE3   0050 0053 004A 0058
        DECLE   $0046,  $005C,  $0042,  $005C   ; 5DE7   0046 005C 0042 005C
        DECLE   $003C,  $0065,  $0036,  $006C   ; 5DEB   003C 0065 0036 006C
        DECLE   $0032,  $0070,  $002E,  $0074   ; 5DEF   0032 0070 002E 0074
        DECLE   $004E,  $0051,  $0048,  $0056   ; 5DF3   004E 0051 0048 0056
        DECLE   $0044,  $005A,  $0040,  $005A   ; 5DF7   0044 005A 0040 005A
        DECLE   $003A,  $0062,  $0034,  $006A   ; 5DFB   003A 0062 0034 006A
        DECLE   $0030,  $006E,  $002C,  $0072   ; 5DFF   0030 006E 002C 0072
        DECLE   $004C,  $004F,  $0046,  $0054   ; 5E03   004C 004F 0046 0054
        DECLE   $0042,  $0058,  $003E,  $0058   ; 5E07   0042 0058 003E 0058
        DECLE   $0038,  $0060,  $0032,  $0066   ; 5E0B   0038 0060 0032 0066
        DECLE   $002E,  $006C,  $002A,  $0070   ; 5E0F   002E 006C 002A 0070
        DECLE   $004A,  $004D,  $0046,  $0052   ; 5E13   004A 004D 0046 0052
        DECLE   $0040,  $0058,  $003E,  $0058   ; 5E17   0040 0058 003E 0058
        DECLE   $0038,  $0060,  $0032,  $0066   ; 5E1B   0038 0060 0032 0066
        DECLE   $002C,  $006C,  $0028,  $0070   ; 5E1F   002C 006C 0028 0070
        DECLE   $0048,  $004B,  $0044,  $0050   ; 5E23   0048 004B 0044 0050
        DECLE   $0040,  $0058,  $003E,  $0058   ; 5E27   0040 0058 003E 0058
        DECLE   $0038,  $0060,  $0032,  $0066   ; 5E2B   0038 0060 0032 0066
        DECLE   $002C,  $006C,  $0028,  $0070   ; 5E2F   002C 006C 0028 0070
        DECLE   $0046,  $0049,  $0042,  $004E   ; 5E33   0046 0049 0042 004E
        DECLE   $003E,  $0056,  $003E,  $0056   ; 5E37   003E 0056 003E 0056
        DECLE   $0038,  $0060,  $0032,  $0066   ; 5E3B   0038 0060 0032 0066
        DECLE   $002C,  $006C,  $0028,  $0070   ; 5E3F   002C 006C 0028 0070
        DECLE   $0044,  $0047,  $0040,  $004C   ; 5E43   0044 0047 0040 004C
        DECLE   $003C,  $0052,  $003C,  $0054   ; 5E47   003C 0052 003C 0054
        DECLE   $0038,  $0060,  $0032,  $0066   ; 5E4B   0038 0060 0032 0066
        DECLE   $002C,  $006C,  $0028,  $0070   ; 5E4F   002C 006C 0028 0070
        DECLE   $0042,  $0045,  $003E,  $004A   ; 5E53   0042 0045 003E 004A
        DECLE   $003A,  $0050,  $003A,  $0052   ; 5E57   003A 0050 003A 0052
        DECLE   $0036,  $005C,  $0032,  $0066   ; 5E5B   0036 005C 0032 0066
        DECLE   $002C,  $006C,  $0028,  $0070   ; 5E5F   002C 006C 0028 0070
        DECLE   $0040,  $0043,  $003C,  $0048   ; 5E63   0040 0043 003C 0048
        DECLE   $0038,  $004E,  $0036,  $004E   ; 5E67   0038 004E 0036 004E
        DECLE   $0034,  $005A,  $0030,  $0062   ; 5E6B   0034 005A 0030 0062
        DECLE   $002C,  $006C,  $0028,  $0070   ; 5E6F   002C 006C 0028 0070
        DECLE   $003F,  $0042,  $003C,  $0048   ; 5E73   003F 0042 003C 0048
        DECLE   $0038,  $004E,  $0036,  $004E   ; 5E77   0038 004E 0036 004E
        DECLE   $0034,  $005A,  $0030,  $0062   ; 5E7B   0034 005A 0030 0062
        DECLE   $002C,  $006C,  $0028,  $0070   ; 5E7F   002C 006C 0028 0070
        DECLE   $003B,  $003E,  $003B,  $0047   ; 5E83   003B 003E 003B 0047
        DECLE   $0038,  $004E,  $0036,  $004E   ; 5E87   0038 004E 0036 004E
        DECLE   $0034,  $005A,  $0030,  $0062   ; 5E8B   0034 005A 0030 0062
        DECLE   $002C,  $006C,  $0028,  $0070   ; 5E8F   002C 006C 0028 0070
        DECLE   $0039,  $003C,  $003D,  $0047   ; 5E93   0039 003C 003D 0047
        DECLE   $0038,  $004E,  $0036,  $004E   ; 5E97   0038 004E 0036 004E
        DECLE   $0034,  $005A,  $0030,  $0062   ; 5E9B   0034 005A 0030 0062
        DECLE   $002C,  $006C,  $0028,  $0070   ; 5E9F   002C 006C 0028 0070
        DECLE   $0036,  $0039,  $003A,  $0044   ; 5EA3   0036 0039 003A 0044
        DECLE   $0038,  $004E,  $0036,  $004E   ; 5EA7   0038 004E 0036 004E
        DECLE   $0034,  $005A,  $0030,  $0062   ; 5EAB   0034 005A 0030 0062
        DECLE   $002C,  $006C,  $0028,  $0070   ; 5EAF   002C 006C 0028 0070
        DECLE   $0031,  $0034,  $0036,  $0040   ; 5EB3   0031 0034 0036 0040
        DECLE   $0038,  $004E,  $0036,  $004E   ; 5EB7   0038 004E 0036 004E
        DECLE   $0034,  $005A,  $0030,  $0062   ; 5EBB   0034 005A 0030 0062
        DECLE   $002C,  $006C,  $0028,  $0070   ; 5EBF   002C 006C 0028 0070
        DECLE   $002D,  $0030,  $0032,  $003E   ; 5EC3   002D 0030 0032 003E
        DECLE   $0034,  $004A,  $0036,  $004E   ; 5EC7   0034 004A 0036 004E
        DECLE   $0034,  $005A,  $0030,  $0062   ; 5ECB   0034 005A 0030 0062
        DECLE   $002C,  $006C,  $0028,  $0070   ; 5ECF   002C 006C 0028 0070
        DECLE   $0029,  $002C,  $0030,  $0040   ; 5ED3   0029 002C 0030 0040
        DECLE   $0036,  $004C,  $0036,  $004E   ; 5ED7   0036 004C 0036 004E
        DECLE   $0034,  $005A,  $0030,  $0062   ; 5EDB   0034 005A 0030 0062
        DECLE   $002C,  $006C,  $0028,  $0070   ; 5EDF   002C 006C 0028 0070
        DECLE   $0025,  $0028,  $002C,  $0040   ; 5EE3   0025 0028 002C 0040
        DECLE   $0034,  $004C,  $0034,  $004E   ; 5EE7   0034 004C 0034 004E
        DECLE   $0034,  $005A,  $0030,  $0062   ; 5EEB   0034 005A 0030 0062
        DECLE   $002C,  $006C,  $0028,  $0070   ; 5EEF   002C 006C 0028 0070
        DECLE   $0021,  $0024,  $0029,  $003C   ; 5EF3   0021 0024 0029 003C
        DECLE   $0032,  $0048,  $0034,  $004E   ; 5EF7   0032 0048 0034 004E
        DECLE   $0034,  $005A,  $0030,  $0062   ; 5EFB   0034 005A 0030 0062
        DECLE   $002C,  $006C,  $0028,  $0070   ; 5EFF   002C 006C 0028 0070
        DECLE   $001D,  $0020,  $0026,  $003A   ; 5F03   001D 0020 0026 003A
        DECLE   $002E,  $0048,  $0030,  $004E   ; 5F07   002E 0048 0030 004E
        DECLE   $0030,  $005A,  $002C,  $0062   ; 5F0B   0030 005A 002C 0062
        DECLE   $002C,  $006C,  $0028,  $0070   ; 5F0F   002C 006C 0028 0070
        DECLE   $0019,  $001C,  $0022,  $0034   ; 5F13   0019 001C 0022 0034
        DECLE   $0028,  $0044,  $002E,  $004A   ; 5F17   0028 0044 002E 004A
        DECLE   $0030,  $0056,  $002C,  $0060   ; 5F1B   0030 0056 002C 0060
        DECLE   $002C,  $006A,  $0028,  $006E   ; 5F1F   002C 006A 0028 006E
        DECLE   $0019,  $001C,  $0022,  $0034   ; 5F23   0019 001C 0022 0034
        DECLE   $0028,  $0044,  $002E,  $004A   ; 5F27   0028 0044 002E 004A
        DECLE   $0030,  $0056,  $002C,  $0060   ; 5F2B   0030 0056 002C 0060
        DECLE   $002C,  $006A,  $0028,  $006E   ; 5F2F   002C 006A 0028 006E
        DECLE   $0019,  $001C,  $0022,  $0034   ; 5F33   0019 001C 0022 0034
        DECLE   $0028,  $0044,  $002E,  $004A   ; 5F37   0028 0044 002E 004A
        DECLE   $0030,  $0056,  $002C,  $0060   ; 5F3B   0030 0056 002C 0060
        DECLE   $002C,  $006A,  $0028,  $006E   ; 5F3F   002C 006A 0028 006E
        DECLE   $0019,  $001C,  $0022,  $0034   ; 5F43   0019 001C 0022 0034
        DECLE   $0028,  $0044,  $002E,  $004A   ; 5F47   0028 0044 002E 004A
        DECLE   $0030,  $0056,  $002C,  $0060   ; 5F4B   0030 0056 002C 0060
        DECLE   $002C,  $006A,  $0028,  $006E   ; 5F4F   002C 006A 0028 006E
        DECLE   $0015,  $0018,  $001E,  $0033   ; 5F53   0015 0018 001E 0033
        DECLE   $0024,  $0044,  $002A,  $004A   ; 5F57   0024 0044 002A 004A
        DECLE   $002C,  $0054,  $0028,  $005E   ; 5F5B   002C 0054 0028 005E
        DECLE   $0028,  $0068,  $0024,  $006C   ; 5F5F   0028 0068 0024 006C
        DECLE   $0011,  $0014,  $001A,  $002C   ; 5F63   0011 0014 001A 002C
        DECLE   $0022,  $0040,  $0026,  $0046   ; 5F67   0022 0040 0026 0046
        DECLE   $0028,  $0052,  $0024,  $005C   ; 5F6B   0028 0052 0024 005C
        DECLE   $0024,  $0066,  $0020,  $006A   ; 5F6F   0024 0066 0020 006A
        DECLE   $000D,  $0010,  $0016,  $002A   ; 5F73   000D 0010 0016 002A
        DECLE   $001C,  $003C,  $0022,  $0042   ; 5F77   001C 003C 0022 0042
        DECLE   $0024,  $004E,  $0020,  $005A   ; 5F7B   0024 004E 0020 005A
        DECLE   $0020,  $0064,  $001C,  $0068   ; 5F7F   0020 0064 001C 0068
        DECLE   $0006,  $000A,  $0012,  $0024   ; 5F83   0006 000A 0012 0024
        DECLE   $0018,  $0036,  $001E,  $0040   ; 5F87   0018 0036 001E 0040
        DECLE   $0020,  $004E,  $001C,  $0058   ; 5F8B   0020 004E 001C 0058
        DECLE   $001C,  $0062,  $0018,  $0066   ; 5F8F   001C 0062 0018 0066
        DECLE   $0000,  $0008,  $000E,  $0020   ; 5F93   0000 0008 000E 0020
        DECLE   $0014,  $0036,  $001C,  $0040   ; 5F97   0014 0036 001C 0040
        DECLE   $001C,  $004E,  $0018,  $0056   ; 5F9B   001C 004E 0018 0056
        DECLE   $0018,  $0060,  $0014,  $0064   ; 5F9F   0018 0060 0014 0064
        DECLE   $0000,  $0004,  $000A,  $001B   ; 5FA3   0000 0004 000A 001B
        DECLE   $0010,  $0032,  $0016,  $003C   ; 5FA7   0010 0032 0016 003C
        DECLE   $0018,  $004A,  $0014,  $0054   ; 5FAB   0018 004A 0014 0054
        DECLE   $0014,  $005E,  $0010,  $0062   ; 5FAF   0014 005E 0010 0062
        DECLE   $0000,  $0000,  $0006,  $0019   ; 5FB3   0000 0000 0006 0019
        DECLE   $000C,  $002E,  $0014,  $003C   ; 5FB7   000C 002E 0014 003C
        DECLE   $0014,  $0048,  $0010,  $0050   ; 5FBB   0014 0048 0010 0050
        DECLE   $0010,  $005A,  $000C,  $005E   ; 5FBF   0010 005A 000C 005E
        DECLE   $0000,  $0000                   ; 5FC3   0000 0000

        EIS                                     ; 5FC5   0002
L_5FC6:
        DECR    R7                              ; 5FC6   0017

        DECLE   $0008,  $002C,  $0010,  $0038   ; 5FC7   0008 002C 0010 0038
        DECLE   $0010,  $0044,  $000C,  $004E   ; 5FCB   0010 0044 000C 004E
        DECLE   $000C,  $0058,  $000A,  $005C   ; 5FCF   000C 0058 000A 005C
        DECLE   $0000,  $0000                   ; 5FD3   0000 0000

        EIS                                     ; 5FD5   0002
L_5FD6:
        DECR    R7                              ; 5FD6   0017

        DECLE   $0008,  $002C,  $0010,  $0038   ; 5FD7   0008 002C 0010 0038
        DECLE   $0010,  $0044,  $000C,  $004E   ; 5FDB   0010 0044 000C 004E
        DECLE   $000C,  $0058,  $000A,  $005C   ; 5FDF   000C 0058 000A 005C
        DECLE   $0000,  $0000                   ; 5FE3   0000 0000

        EIS                                     ; 5FE5   0002
L_5FE6:
        DECR    R7                              ; 5FE6   0017

        DECLE   $0008,  $002C,  $0010,  $0038   ; 5FE7   0008 002C 0010 0038
        DECLE   $0010,  $0044,  $000C,  $004E   ; 5FEB   0010 0044 000C 004E
        DECLE   $000C,  $0058,  $000A,  $005C   ; 5FEF   000C 0058 000A 005C
        DECLE   $0000,  $0000                   ; 5FF3   0000 0000

        EIS                                     ; 5FF5   0002
L_5FF6:
        DECR    R7                              ; 5FF6   0017

        DECLE   $0008,  $002C,  $0010,  $0038   ; 5FF7   0008 002C 0010 0038
        DECLE   $0010,  $0044,  $000C,  $004E   ; 5FFB   0010 0044 000C 004E
        DECLE   $000C,  $0058,  $000A,  $005C   ; 5FFF   000C 0058 000A 005C
        DECLE   $0052,  $0055,  $004E,  $005C   ; 6003   0052 0055 004E 005C
        DECLE   $004C,  $0062,  $004A,  $0064   ; 6007   004C 0062 004A 0064
        DECLE   $0040,  $006A,  $003A,  $0070   ; 600B   0040 006A 003A 0070
        DECLE   $0036,  $0074,  $0032,  $0078   ; 600F   0036 0074 0032 0078
        DECLE   $0054,  $0057,  $0050,  $005E   ; 6013   0054 0057 0050 005E
        DECLE   $004E,  $0064,  $004C,  $0066   ; 6017   004E 0064 004C 0066
        DECLE   $0043,  $006C,  $003C,  $0072   ; 601B   0043 006C 003C 0072
        DECLE   $0038,  $0076,  $0034,  $007A   ; 601F   0038 0076 0034 007A
        DECLE   $0056,  $0059,  $0052,  $0060   ; 6023   0056 0059 0052 0060
        DECLE   $0050,  $0066,  $004E,  $0068   ; 6027   0050 0066 004E 0068
        DECLE   $0046,  $006E,  $003E,  $0074   ; 602B   0046 006E 003E 0074
        DECLE   $003A,  $0078,  $0036           ; 602F   003A 0078 0036

        SARC    R0,     2                       ; 6032   007C
        SLLC    R0,     1                       ; 6033   0058
        SLLC    R3,     1                       ; 6034   005B
        RLC     R0,     2                       ; 6035   0054
        SLR     R2,     1                       ; 6036   0062
        RLC     R2,     1                       ; 6037   0052
        SAR     R0,     1                       ; 6038   0068
        RLC     R0,     1                       ; 6039   0050
        SAR     R2,     1                       ; 603A   006A
        SLL     R0,     1                       ; 603B   0048
        RRC     R0,     1                       ; 603C   0070
        SWAP    R2,     1                       ; 603D   0042
        RRC     R2,     2                       ; 603E   0076
        RSWD    R4                              ; 603F   003C
        SARC    R2,     1                       ; 6040   007A
        RSWD    R0                              ; 6041   0038
        SARC    R2,     2                       ; 6042   007E
        SLLC    R2,     1                       ; 6043   005A
        SLLC    R1,     2                       ; 6044   005D
        RLC     R2,     2                       ; 6045   0056
        SLR     R2,     1                       ; 6046   0062
        RLC     R2,     1                       ; 6047   0052
        SAR     R2,     1                       ; 6048   006A
        RLC     R0,     1                       ; 6049   0050
        SAR     R2,     1                       ; 604A   006A
        SLL     R0,     1                       ; 604B   0048
        RRC     R0,     1                       ; 604C   0070
        SWAP    R2,     1                       ; 604D   0042
        RRC     R2,     2                       ; 604E   0076
        RSWD    R4                              ; 604F   003C
        SARC    R0,     2                       ; 6050   007C
        RSWD    R0                              ; 6051   0038
        TSTR    R0                              ; 6052   0080
        SLLC    R0,     2                       ; 6053   005C
        SLLC    R3,     2                       ; 6054   005F
        SLLC    R0,     1                       ; 6055   0058
        SLR     R0,     2                       ; 6056   0064
        RLC     R2,     1                       ; 6057   0052
        SAR     R2,     1                       ; 6058   006A
        RLC     R0,     1                       ; 6059   0050
        SAR     R2,     1                       ; 605A   006A
        SLL     R0,     1                       ; 605B   0048
        RRC     R0,     1                       ; 605C   0070
        SWAP    R2,     1                       ; 605D   0042
        RRC     R2,     2                       ; 605E   0076
        RSWD    R4                              ; 605F   003C
        SARC    R0,     2                       ; 6060   007C
        RSWD    R0                              ; 6061   0038
        TSTR    R0                              ; 6062   0080
        SLLC    R2,     2                       ; 6063   005E
        SLR     R1,     1                       ; 6064   0061
        SLLC    R2,     1                       ; 6065   005A
        SLR     R2,     2                       ; 6066   0066
        RLC     R0,     2                       ; 6067   0054
        SAR     R0,     2                       ; 6068   006C
        RLC     R2,     1                       ; 6069   0052
        SAR     R2,     1                       ; 606A   006A
        SLL     R0,     1                       ; 606B   0048
        RRC     R0,     1                       ; 606C   0070
        SWAP    R2,     1                       ; 606D   0042
        RRC     R2,     2                       ; 606E   0076
        RSWD    R4                              ; 606F   003C
        SARC    R0,     2                       ; 6070   007C
        RSWD    R0                              ; 6071   0038
        TSTR    R0                              ; 6072   0080
        SLR     R0,     1                       ; 6073   0060
        SLR     R3,     1                       ; 6074   0063
        SLLC    R0,     2                       ; 6075   005C
        SAR     R0,     1                       ; 6076   0068
        SLLC    R0,     1                       ; 6077   0058
        SAR     R2,     2                       ; 6078   006E
        RLC     R0,     2                       ; 6079   0054
        SAR     R0,     2                       ; 607A   006C
        SLL     R0,     1                       ; 607B   0048
        RRC     R0,     1                       ; 607C   0070
        SWAP    R2,     1                       ; 607D   0042
        RRC     R2,     2                       ; 607E   0076
        RSWD    R4                              ; 607F   003C
        SARC    R0,     2                       ; 6080   007C
        RSWD    R0                              ; 6081   0038
        TSTR    R0                              ; 6082   0080
        SLR     R2,     1                       ; 6083   0062
        SLR     R1,     2                       ; 6084   0065
        SLLC    R2,     2                       ; 6085   005E
        SAR     R2,     1                       ; 6086   006A
        SLLC    R2,     1                       ; 6087   005A
        RRC     R0,     1                       ; 6088   0070
        RLC     R2,     2                       ; 6089   0056
        SAR     R2,     2                       ; 608A   006E
        SLL     R0,     2                       ; 608B   004C
        RRC     R2,     1                       ; 608C   0072
        SWAP    R2,     1                       ; 608D   0042
        RRC     R2,     2                       ; 608E   0076
        RSWD    R4                              ; 608F   003C
        SARC    R0,     2                       ; 6090   007C
        RSWD    R0                              ; 6091   0038
        TSTR    R0                              ; 6092   0080
        SLR     R0,     2                       ; 6093   0064
        SLR     R3,     2                       ; 6094   0067
        SLR     R0,     1                       ; 6095   0060
        SAR     R0,     2                       ; 6096   006C
        SLLC    R0,     2                       ; 6097   005C
        RRC     R2,     1                       ; 6098   0072
        SLLC    R2,     1                       ; 6099   005A
        RRC     R2,     1                       ; 609A   0072
        SLL     R2,     2                       ; 609B   004E
        RRC     R0,     2                       ; 609C   0074
        SWAP    R2,     2                       ; 609D   0046
        SARC    R0,     1                       ; 609E   0078
        RSWD    R4                              ; 609F   003C
        SARC    R0,     2                       ; 60A0   007C
        RSWD    R0                              ; 60A1   0038
        TSTR    R0                              ; 60A2   0080
        SLR     R1,     2                       ; 60A3   0065
        SAR     R0,     1                       ; 60A4   0068
        SLR     R0,     1                       ; 60A5   0060
        SAR     R0,     2                       ; 60A6   006C
        SLLC    R0,     2                       ; 60A7   005C
        RRC     R2,     1                       ; 60A8   0072
        SLLC    R2,     1                       ; 60A9   005A
        RRC     R2,     1                       ; 60AA   0072
        SLL     R2,     2                       ; 60AB   004E
        RRC     R0,     2                       ; 60AC   0074
        SWAP    R2,     2                       ; 60AD   0046
        SARC    R0,     1                       ; 60AE   0078
        RSWD    R4                              ; 60AF   003C
        SARC    R0,     2                       ; 60B0   007C
        RSWD    R0                              ; 60B1   0038
        TSTR    R0                              ; 60B2   0080
        SAR     R1,     1                       ; 60B3   0069
        SAR     R0,     2                       ; 60B4   006C
        SLR     R1,     1                       ; 60B5   0061
        SAR     R1,     2                       ; 60B6   006D
        SLLC    R0,     2                       ; 60B7   005C
        RRC     R2,     1                       ; 60B8   0072
        SLLC    R2,     1                       ; 60B9   005A
        RRC     R2,     1                       ; 60BA   0072
        SLL     R2,     2                       ; 60BB   004E
        RRC     R0,     2                       ; 60BC   0074
        SWAP    R2,     2                       ; 60BD   0046
        SARC    R0,     1                       ; 60BE   0078
        RSWD    R4                              ; 60BF   003C
        SARC    R0,     2                       ; 60C0   007C
        RSWD    R0                              ; 60C1   0038
        TSTR    R0                              ; 60C2   0080
        SAR     R3,     1                       ; 60C3   006B
        SAR     R2,     2                       ; 60C4   006E
        SLR     R1,     1                       ; 60C5   0061
        SAR     R3,     1                       ; 60C6   006B
        SLLC    R0,     2                       ; 60C7   005C
        RRC     R2,     1                       ; 60C8   0072
        SLLC    R2,     1                       ; 60C9   005A
        RRC     R2,     1                       ; 60CA   0072
        SLL     R2,     2                       ; 60CB   004E
        RRC     R0,     2                       ; 60CC   0074
        SWAP    R2,     2                       ; 60CD   0046
        SARC    R0,     1                       ; 60CE   0078
        RSWD    R4                              ; 60CF   003C
        SARC    R0,     2                       ; 60D0   007C
        RSWD    R0                              ; 60D1   0038
        TSTR    R0                              ; 60D2   0080
        SAR     R2,     2                       ; 60D3   006E
        RRC     R1,     1                       ; 60D4   0071
        SLR     R0,     2                       ; 60D5   0064
        SAR     R2,     2                       ; 60D6   006E
        SLLC    R0,     2                       ; 60D7   005C
        RRC     R2,     1                       ; 60D8   0072
        SLLC    R2,     1                       ; 60D9   005A
        RRC     R2,     1                       ; 60DA   0072
        SLL     R2,     2                       ; 60DB   004E
        RRC     R0,     2                       ; 60DC   0074
        SWAP    R2,     2                       ; 60DD   0046
        SARC    R0,     1                       ; 60DE   0078
        RSWD    R4                              ; 60DF   003C
        SARC    R0,     2                       ; 60E0   007C
        RSWD    R0                              ; 60E1   0038
        TSTR    R0                              ; 60E2   0080
        RRC     R3,     1                       ; 60E3   0073
        RRC     R2,     2                       ; 60E4   0076
        SAR     R0,     1                       ; 60E5   0068
        RRC     R2,     1                       ; 60E6   0072
        SLLC    R0,     2                       ; 60E7   005C
        RRC     R2,     1                       ; 60E8   0072
        SLLC    R2,     1                       ; 60E9   005A
        RRC     R2,     1                       ; 60EA   0072
        SLL     R2,     2                       ; 60EB   004E
        RRC     R0,     2                       ; 60EC   0074
        SWAP    R2,     2                       ; 60ED   0046
        SARC    R0,     1                       ; 60EE   0078
        RSWD    R4                              ; 60EF   003C
        SARC    R0,     2                       ; 60F0   007C
        RSWD    R0                              ; 60F1   0038
        TSTR    R0                              ; 60F2   0080
        RRC     R3,     2                       ; 60F3   0077
        SARC    R2,     1                       ; 60F4   007A
        SAR     R2,     1                       ; 60F5   006A
        RRC     R2,     2                       ; 60F6   0076
        SLR     R0,     1                       ; 60F7   0060
        RRC     R2,     2                       ; 60F8   0076
        SLLC    R2,     1                       ; 60F9   005A
        RRC     R2,     1                       ; 60FA   0072
        SLL     R2,     2                       ; 60FB   004E
        RRC     R0,     2                       ; 60FC   0074
        SWAP    R2,     2                       ; 60FD   0046
        SARC    R0,     1                       ; 60FE   0078
        RSWD    R4                              ; 60FF   003C
        SARC    R0,     2                       ; 6100   007C
        RSWD    R0                              ; 6101   0038
        TSTR    R0                              ; 6102   0080
        SARC    R3,     1                       ; 6103   007B
        SARC    R2,     2                       ; 6104   007E
        SAR     R0,     1                       ; 6105   0068
        SARC    R0,     1                       ; 6106   0078
        SLLC    R2,     2                       ; 6107   005E
        RRC     R0,     2                       ; 6108   0074
        SLLC    R2,     1                       ; 6109   005A
        RRC     R2,     1                       ; 610A   0072
        SLL     R2,     2                       ; 610B   004E
        RRC     R0,     2                       ; 610C   0074
        SWAP    R2,     2                       ; 610D   0046
        SARC    R0,     1                       ; 610E   0078
        RSWD    R4                              ; 610F   003C
        SARC    R0,     2                       ; 6110   007C
        RSWD    R0                              ; 6111   0038
        TSTR    R0                              ; 6112   0080
        SARC    R3,     2                       ; 6113   007F
        MOVR    R0,     R2                      ; 6114   0082
        SAR     R0,     1                       ; 6115   0068
        SARC    R0,     2                       ; 6116   007C
        SLLC    R2,     2                       ; 6117   005E
        RRC     R2,     2                       ; 6118   0076
        SLLC    R2,     1                       ; 6119   005A
        RRC     R0,     2                       ; 611A   0074
        SLL     R2,     2                       ; 611B   004E
        RRC     R0,     2                       ; 611C   0074
        SWAP    R2,     2                       ; 611D   0046
        SARC    R0,     1                       ; 611E   0078
        RSWD    R4                              ; 611F   003C
        SARC    R0,     2                       ; 6120   007C
        RSWD    R0                              ; 6121   0038
        TSTR    R0                              ; 6122   0080
        MOVR    R0,     R3                      ; 6123   0083
        MOVR    R0,     R6                      ; 6124   0086
        SAR     R0,     2                       ; 6125   006C
        SARC    R3,     2                       ; 6126   007F
        SLR     R2,     1                       ; 6127   0062
        SARC    R0,     1                       ; 6128   0078
        SLLC    R2,     1                       ; 6129   005A
        RRC     R0,     2                       ; 612A   0074
        SLL     R2,     2                       ; 612B   004E
        RRC     R0,     2                       ; 612C   0074
        SWAP    R2,     2                       ; 612D   0046
        SARC    R0,     1                       ; 612E   0078
        RSWD    R4                              ; 612F   003C
        SARC    R0,     2                       ; 6130   007C
        RSWD    R0                              ; 6131   0038
        TSTR    R0                              ; 6132   0080
        MOVR    R0,     R7                      ; 6133   0087

        MOVR    R1,     R2                      ; 6134   008A
        SAR     R2,     2                       ; 6135   006E
        MOVR    R0,     R2                      ; 6136   0082
        SLR     R2,     1                       ; 6137   0062
        SARC    R0,     2                       ; 6138   007C
        SLLC    R2,     1                       ; 6139   005A
        SARC    R0,     1                       ; 613A   0078
        SLL     R2,     2                       ; 613B   004E
        SARC    R0,     1                       ; 613C   0078
        SWAP    R2,     2                       ; 613D   0046
        SARC    R0,     2                       ; 613E   007C
        RSWD    R4                              ; 613F   003C
        SARC    R0,     2                       ; 6140   007C
        RSWD    R0                              ; 6141   0038
        TSTR    R0                              ; 6142   0080
        MOVR    R1,     R3                      ; 6143   008B
        MOVR    R1,     R6                      ; 6144   008E
        RRC     R0,     2                       ; 6145   0074
        MOVR    R0,     R6                      ; 6146   0086
        SLR     R2,     2                       ; 6147   0066
        MOVR    R0,     R2                      ; 6148   0082
        SLLC    R2,     2                       ; 6149   005E
        SARC    R2,     1                       ; 614A   007A
        RLC     R2,     1                       ; 614B   0052
        SARC    R0,     1                       ; 614C   0078
        SLL     R0,     1                       ; 614D   0048
        SARC    R0,     2                       ; 614E   007C
        RSWD    R6                              ; 614F   003E
        SARC    R0,     2                       ; 6150   007C
        RSWD    R2                              ; 6151   003A
        TSTR    R0                              ; 6152   0080
        MOVR    R1,     R3                      ; 6153   008B
        MOVR    R1,     R6                      ; 6154   008E
        RRC     R0,     2                       ; 6155   0074
        MOVR    R0,     R6                      ; 6156   0086
        SLR     R2,     2                       ; 6157   0066
        MOVR    R0,     R2                      ; 6158   0082
        SLLC    R2,     2                       ; 6159   005E
        SARC    R2,     1                       ; 615A   007A
        RLC     R2,     1                       ; 615B   0052
        SARC    R0,     1                       ; 615C   0078
        SLL     R0,     1                       ; 615D   0048
        SARC    R0,     2                       ; 615E   007C
        RSWD    R6                              ; 615F   003E
        SARC    R0,     2                       ; 6160   007C
        RSWD    R2                              ; 6161   003A
        TSTR    R0                              ; 6162   0080
        MOVR    R1,     R3                      ; 6163   008B
        MOVR    R1,     R6                      ; 6164   008E
        RRC     R0,     2                       ; 6165   0074
        MOVR    R0,     R6                      ; 6166   0086
        SLR     R2,     2                       ; 6167   0066
        MOVR    R0,     R2                      ; 6168   0082
        SLLC    R2,     2                       ; 6169   005E
        SARC    R2,     1                       ; 616A   007A
        RLC     R2,     1                       ; 616B   0052
        SARC    R0,     1                       ; 616C   0078
        SLL     R0,     1                       ; 616D   0048
        SARC    R0,     2                       ; 616E   007C
        RSWD    R6                              ; 616F   003E
        SARC    R0,     2                       ; 6170   007C
        RSWD    R2                              ; 6171   003A
        TSTR    R0                              ; 6172   0080
        MOVR    R1,     R3                      ; 6173   008B
        MOVR    R1,     R6                      ; 6174   008E
        RRC     R0,     2                       ; 6175   0074
        MOVR    R0,     R6                      ; 6176   0086
        SLR     R2,     2                       ; 6177   0066
        MOVR    R0,     R2                      ; 6178   0082
        SLLC    R2,     2                       ; 6179   005E
        SARC    R2,     1                       ; 617A   007A
        RLC     R2,     1                       ; 617B   0052
        SARC    R0,     1                       ; 617C   0078
        SLL     R0,     1                       ; 617D   0048
        SARC    R0,     2                       ; 617E   007C
        RSWD    R6                              ; 617F   003E
        SARC    R0,     2                       ; 6180   007C
        RSWD    R2                              ; 6181   003A
        TSTR    R0                              ; 6182   0080
        MOVR    R1,     R7                      ; 6183   008F

        TSTR    R2                              ; 6184   0092
        RRC     R1,     2                       ; 6185   0075
        MOVR    R1,     R2                      ; 6186   008A
        SLR     R2,     2                       ; 6187   0066
        MOVR    R0,     R6                      ; 6188   0086
        SLLC    R2,     2                       ; 6189   005E
        SARC    R2,     2                       ; 618A   007E
        RLC     R0,     2                       ; 618B   0054
        SARC    R0,     2                       ; 618C   007C
        SLL     R2,     1                       ; 618D   004A
        TSTR    R0                              ; 618E   0080
        SWAP    R0,     1                       ; 618F   0040
        TSTR    R0                              ; 6190   0080
        RSWD    R4                              ; 6191   003C
        MOVR    R0,     R4                      ; 6192   0084
        MOVR    R2,     R3                      ; 6193   0093
        MOVR    R2,     R6                      ; 6194   0096
        SARC    R0,     2                       ; 6195   007C
        MOVR    R1,     R6                      ; 6196   008E
        SAR     R2,     1                       ; 6197   006A
        MOVR    R1,     R0                      ; 6198   0088
        SLR     R2,     1                       ; 6199   0062
        MOVR    R0,     R2                      ; 619A   0082
        RLC     R2,     2                       ; 619B   0056
        TSTR    R0                              ; 619C   0080
        SLL     R0,     2                       ; 619D   004C
        MOVR    R0,     R4                      ; 619E   0084
        SWAP    R2,     1                       ; 619F   0042
        MOVR    R0,     R4                      ; 61A0   0084
        RSWD    R6                              ; 61A1   003E
        MOVR    R1,     R0                      ; 61A2   0088
        MOVR    R2,     R7                      ; 61A3   0097

        MOVR    R3,     R2                      ; 61A4   009A
        SARC    R2,     2                       ; 61A5   007E
        TSTR    R2                              ; 61A6   0092
        SAR     R2,     2                       ; 61A7   006E
        MOVR    R1,     R6                      ; 61A8   008E
        SLR     R2,     2                       ; 61A9   0066
        MOVR    R0,     R6                      ; 61AA   0086
        SLLC    R2,     1                       ; 61AB   005A
        MOVR    R0,     R4                      ; 61AC   0084
        SLL     R2,     2                       ; 61AD   004E
        MOVR    R1,     R0                      ; 61AE   0088
        SWAP    R0,     2                       ; 61AF   0044
        MOVR    R1,     R0                      ; 61B0   0088
        SWAP    R0,     1                       ; 61B1   0040
        MOVR    R1,     R4                      ; 61B2   008C
        MOVR    R3,     R5                      ; 61B3   009D
        MOVR    R4,     R1                      ; 61B4   00A1
        MOVR    R0,     R4                      ; 61B5   0084
        MOVR    R2,     R6                      ; 61B6   0096
        RRC     R0,     2                       ; 61B7   0074
        TSTR    R2                              ; 61B8   0092
        SAR     R0,     1                       ; 61B9   0068
        MOVR    R1,     R2                      ; 61BA   008A
        SLLC    R2,     1                       ; 61BB   005A
        MOVR    R1,     R0                      ; 61BC   0088
        RLC     R0,     1                       ; 61BD   0050
        MOVR    R1,     R4                      ; 61BE   008C
        SWAP    R2,     2                       ; 61BF   0046
        MOVR    R1,     R4                      ; 61C0   008C
        SWAP    R2,     1                       ; 61C1   0042
        MOVR    R2,     R0                      ; 61C2   0090
        MOVR    R3,     R7                      ; 61C3   009F
        MOVR    R4,     R7                      ; 61C4   00A7

        MOVR    R1,     R0                      ; 61C5   0088
        MOVR    R3,     R2                      ; 61C6   009A
        RRC     R0,     2                       ; 61C7   0074
        MOVR    R2,     R6                      ; 61C8   0096
        SAR     R0,     1                       ; 61C9   0068
        MOVR    R1,     R4                      ; 61CA   008C
        SLLC    R2,     1                       ; 61CB   005A
        MOVR    R1,     R4                      ; 61CC   008C
        RLC     R2,     1                       ; 61CD   0052
        MOVR    R2,     R0                      ; 61CE   0090
        SLL     R0,     1                       ; 61CF   0048
        MOVR    R2,     R0                      ; 61D0   0090
        SWAP    R0,     2                       ; 61D1   0044
        MOVR    R2,     R4                      ; 61D2   0094
        MOVR    R4,     R3                      ; 61D3   00A3
        MOVR    R4,     R7                      ; 61D4   00A7

        MOVR    R1,     R5                      ; 61D5   008D
        MOVR    R3,     R6                      ; 61D6   009E
        SARC    R0,     1                       ; 61D7   0078
        MOVR    R3,     R2                      ; 61D8   009A
        SAR     R0,     2                       ; 61D9   006C
        TSTR    R2                              ; 61DA   0092
        SLLC    R2,     2                       ; 61DB   005E
        MOVR    R2,     R0                      ; 61DC   0090
        RLC     R0,     2                       ; 61DD   0054
        MOVR    R2,     R4                      ; 61DE   0094
        SLL     R2,     1                       ; 61DF   004A
        MOVR    R2,     R4                      ; 61E0   0094
        SWAP    R2,     2                       ; 61E1   0046
        MOVR    R3,     R0                      ; 61E2   0098
        MOVR    R4,     R7                      ; 61E3   00A7
        MOVR    R4,     R7                      ; 61E4   00A7
        MOVR    R1,     R7                      ; 61E5   008F

        MOVR    R4,     R2                      ; 61E6   00A2
        SARC    R0,     2                       ; 61E7   007C
        MOVR    R3,     R6                      ; 61E8   009E
        SAR     R0,     2                       ; 61E9   006C
        MOVR    R2,     R4                      ; 61EA   0094
        SLR     R0,     1                       ; 61EB   0060
        MOVR    R2,     R4                      ; 61EC   0094
        SLLC    R0,     1                       ; 61ED   0058
        MOVR    R3,     R0                      ; 61EE   0098
        SLL     R2,     2                       ; 61EF   004E
        MOVR    R3,     R0                      ; 61F0   0098
        SLL     R2,     1                       ; 61F1   004A
        MOVR    R3,     R4                      ; 61F2   009C
        MOVR    R4,     R7                      ; 61F3   00A7
        MOVR    R4,     R7                      ; 61F4   00A7

        MOVR    R2,     R1                      ; 61F5   0091
        MOVR    R4,     R6                      ; 61F6   00A6
        SARC    R2,     2                       ; 61F7   007E
        MOVR    R4,     R2                      ; 61F8   00A2
        RRC     R0,     1                       ; 61F9   0070
        MOVR    R3,     R0                      ; 61FA   0098
        SLR     R0,     2                       ; 61FB   0064
        MOVR    R3,     R0                      ; 61FC   0098
        SLLC    R2,     1                       ; 61FD   005A
        MOVR    R3,     R4                      ; 61FE   009C
        RLC     R0,     1                       ; 61FF   0050
        MOVR    R3,     R4                      ; 6200   009C
        SLL     R0,     2                       ; 6201   004C
        MOVR    R3,     R6                      ; 6202   009E
        MOVR    R4,     R7                      ; 6203   00A7
        MOVR    R4,     R7                      ; 6204   00A7

        MOVR    R2,     R1                      ; 6205   0091
        MOVR    R4,     R6                      ; 6206   00A6
        SARC    R2,     2                       ; 6207   007E
        MOVR    R4,     R2                      ; 6208   00A2
        RRC     R0,     1                       ; 6209   0070
        MOVR    R3,     R0                      ; 620A   0098
        SLR     R0,     2                       ; 620B   0064
        MOVR    R3,     R0                      ; 620C   0098
        SLLC    R2,     1                       ; 620D   005A
        MOVR    R3,     R4                      ; 620E   009C
        RLC     R0,     1                       ; 620F   0050
        MOVR    R3,     R4                      ; 6210   009C
        SLL     R0,     2                       ; 6211   004C
        MOVR    R3,     R6                      ; 6212   009E
        MOVR    R4,     R7                      ; 6213   00A7
        MOVR    R4,     R7                      ; 6214   00A7

        MOVR    R2,     R1                      ; 6215   0091
        MOVR    R4,     R6                      ; 6216   00A6
        SARC    R2,     2                       ; 6217   007E
        MOVR    R4,     R2                      ; 6218   00A2
        RRC     R0,     1                       ; 6219   0070
        MOVR    R3,     R0                      ; 621A   0098
        SLR     R0,     2                       ; 621B   0064
        MOVR    R3,     R0                      ; 621C   0098
        SLLC    R2,     1                       ; 621D   005A
        MOVR    R3,     R4                      ; 621E   009C
        RLC     R0,     1                       ; 621F   0050
        MOVR    R3,     R4                      ; 6220   009C
        SLL     R0,     2                       ; 6221   004C
        MOVR    R3,     R6                      ; 6222   009E
        MOVR    R4,     R7                      ; 6223   00A7
        MOVR    R4,     R7                      ; 6224   00A7

        MOVR    R2,     R1                      ; 6225   0091
        MOVR    R4,     R6                      ; 6226   00A6
        SARC    R2,     2                       ; 6227   007E
        MOVR    R4,     R2                      ; 6228   00A2
        RRC     R0,     1                       ; 6229   0070
        MOVR    R3,     R0                      ; 622A   0098
        SLR     R0,     2                       ; 622B   0064
        MOVR    R3,     R0                      ; 622C   0098
        SLLC    R2,     1                       ; 622D   005A
        MOVR    R3,     R4                      ; 622E   009C
        RLC     R0,     1                       ; 622F   0050
        MOVR    R3,     R4                      ; 6230   009C
        SLL     R0,     2                       ; 6231   004C
        MOVR    R3,     R6                      ; 6232   009E
L_6233:
        PSHR    R5                              ; 6233   0275
        MVII    #$0322, R3                      ; 6234   02BB 0322
        MVII    #$0134, R5                      ; 6236   02BD 0134
L_6238:
        MVI@    R5,     R0                      ; 6238   02A8
        MVI@    R5,     R1                      ; 6239   02A9
        CMPI    #$00FF, R0                      ; 623A   0378 00FF
        BEQ     L_62D0                          ; 623C   0204 0092

        SDBD                                    ; 623E   0001
        MVII    #$5D93, R4                      ; 623F   02BC 0093 005D
        TSTR    R0                              ; 6242   0080
        BEQ     L_62D7                          ; 6243   0204 0092

        MVI     G_0132, R2                      ; 6245   0282 0132
        SUBR    R0,     R2                      ; 6247   0102
        ADDR    R2,     R2                      ; 6248   00D2
        ADDR    R2,     R1                      ; 6249   00D1
        DECR    R5                              ; 624A   0015
        MVO@    R1,     R5                      ; 624B   0269
        SAR     R1,     2                       ; 624C   006D
        SAR     R1,     2                       ; 624D   006D
        NOP                                     ; 624E   0034
        SAR     R1,     2                       ; 624F   006D
        SAR     R1,     2                       ; 6250   006D
        MVI@    R3,     R0                      ; 6251   0298
        ANDI    #$007F, R0                      ; 6252   03B8 007F
        ADDR    R1,     R0                      ; 6254   00C8
        CMPI    #$0052, R0                      ; 6255   0378 0052
        BLT     L_625F                          ; 6257   0205 0006

        CMPI    #$0054, R0                      ; 6259   0378 0054
        BGT     L_625F                          ; 625B   020E 0002

        MVO     R6,     G_0156                  ; 625D   0246 0156
L_625F:
        CMPI    #$0068, R0                      ; 625F   0378 0068
        BGT     L_6269                          ; 6261   020E 0006

        CMPI    #$0030, R0                      ; 6263   0378 0030
        BGE     L_6283                          ; 6265   020D 001C
        B       L_626E                          ; 6267   0200 0005

L_6269:
        MVI     G_0153, R0                      ; 6269   0280 0153
        INCR    R0                              ; 626B   0008
        MVO     R0,     G_0153                  ; 626C   0240 0153
L_626E:
        SUBI    #$0002, R5                      ; 626E   033D 0002
        MVII    #$00FF, R0                      ; 6270   02B8 00FF
        MVO@    R0,     R5                      ; 6272   0268
        CLRR    R0                              ; 6273   01C0
        MVO@    R0,     R5                      ; 6274   0268
        MVO@    R0,     R3                      ; 6275   0258
        SUBI    #$0008, R3                      ; 6276   033B 0008
        MVO@    R0,     R3                      ; 6278   0258
        ADDI    #$0008, R3                      ; 6279   02FB 0008
        MOVR    R3,     R2                      ; 627B   009A
        SUBI    #$0322, R2                      ; 627C   033A 0322
        ADDI    #$0125, R2                      ; 627E   02FA 0125
        MVO@    R0,     R2                      ; 6280   0250
        B       L_62D0                          ; 6281   0200 004D

L_6283:
        SDBD                                    ; 6283   0001
        MVII    #$5CD0, R1                      ; 6284   02B9 00D0 005C
        ADD     G_0146, R1                      ; 6287   02C1 0146
        MVI@    R1,     R1                      ; 6289   0289
        SDBD                                    ; 628A   0001
        ADDI    #$5CE4, R1                      ; 628B   02F9 00E4 005C
        MOVR    R0,     R2                      ; 628E   0082
        XORI    #$0080, R2                      ; 628F   03FA 0080
        SDBD                                    ; 6291   0001
        CMPI    #$5CF4, R1                      ; 6292   0379 00F4 005C
        BGE     L_629B                          ; 6295   020D 0004

        SDBD                                    ; 6297   0001
        XORI    #$0400, R2                      ; 6298   03FA 0000 0004
L_629B:
        MVO@    R2,     R3                      ; 629B   025A
        MVO     R0,     G_0120                  ; 629C   0240 0120
        SUBI    #$0030, R0                      ; 629E   0338 0030
        SLR     R0,     2                       ; 62A0   0064
        SLR     R0,     1                       ; 62A1   0060
        ADDR    R0,     R4                      ; 62A2   00C4
        ADDR    R0,     R4                      ; 62A3   00C4
        ADDR    R0,     R1                      ; 62A4   00C1
        MVI@    R1,     R1                      ; 62A5   0289
        MOVR    R3,     R2                      ; 62A6   009A
        SUBI    #$0322, R2                      ; 62A7   033A 0322
        ADDI    #$0125, R2                      ; 62A9   02FA 0125
        MVI@    R2,     R0                      ; 62AB   0290
        INCR    R0                              ; 62AC   0008
        ANDI    #$0001, R0                      ; 62AD   03B8 0001
        XORR    R0,     R1                      ; 62AF   01C1
        MVO@    R1,     R2                      ; 62B0   0251
        MVI     G_012B, R2                      ; 62B1   0282 012B
        SLL     R2,     2                       ; 62B3   004E
        SLL     R2,     2                       ; 62B4   004E
        ADDR    R2,     R4                      ; 62B5   00D4
        MVI@    R5,     R1                      ; 62B6   02A9
        ANDI    #$0003, R1                      ; 62B7   03B9 0003
        ADDR    R1,     R4                      ; 62B9   00CC
        MVI@    R4,     R2                      ; 62BA   02A2
        INCR    R4                              ; 62BB   000C
        MVI@    R4,     R0                      ; 62BC   02A0
        SUBR    R2,     R0                      ; 62BD   0110
        MVI     G_0120, R1                      ; 62BE   0281 0120
        PSHR    R5                              ; 62C0   0275

        JSR     R5,     L_67D5                  ; 62C1   0004 0164 03D5

        PULR    R5                              ; 62C4   02B5
        ADDR    R0,     R2                      ; 62C5   00C2
        SDBD                                    ; 62C6   0001
        XORI    #$0600, R2                      ; 62C7   03FA 0000 0006
        SUBI    #$0008, R3                      ; 62CA   033B 0008
        MVO@    R2,     R3                      ; 62CC   025A
        ADDI    #$0008, R3                      ; 62CD   02FB 0008
        INCR    R7                              ; 62CF   000F

L_62D0:
        INCR    R5                              ; 62D0   000D
L_62D1:
        INCR    R3                              ; 62D1   000B
        CMPI    #$0328, R3                      ; 62D2   037B 0328
        BLT     L_6238                          ; 62D4   0225 009D
        PULR    R7                              ; 62D6   02B7

L_62D7:
        MVI     G_0132, R2                      ; 62D7   0282 0132
        SUBR    R0,     R2                      ; 62D9   0102
        ADDR    R2,     R2                      ; 62DA   00D2
        ADDR    R2,     R1                      ; 62DB   00D1
        DECR    R5                              ; 62DC   0015
        MVO@    R1,     R5                      ; 62DD   0269
        SAR     R1,     2                       ; 62DE   006D
        SAR     R1,     2                       ; 62DF   006D
        NOP                                     ; 62E0   0034
        SAR     R1,     2                       ; 62E1   006D
        SAR     R1,     2                       ; 62E2   006D
        MVI@    R3,     R0                      ; 62E3   0298
        ANDI    #$007F, R0                      ; 62E4   03B8 007F
        ADDR    R1,     R0                      ; 62E6   00C8
        CMPI    #$0068, R0                      ; 62E7   0378 0068
        BLT     L_6300                          ; 62E9   0205 0015

        SUBI    #$0002, R5                      ; 62EB   033D 0002
        MVII    #$00FF, R0                      ; 62ED   02B8 00FF
        MVO@    R0,     R5                      ; 62EF   0268
        CLRR    R0                              ; 62F0   01C0
        MVO@    R0,     R5                      ; 62F1   0268
        MVO@    R0,     R3                      ; 62F2   0258
        SUBI    #$0008, R3                      ; 62F3   033B 0008
        MVO@    R0,     R3                      ; 62F5   0258
        ADDI    #$0008, R3                      ; 62F6   02FB 0008
        MOVR    R3,     R2                      ; 62F8   009A
        SUBI    #$0322, R2                      ; 62F9   033A 0322
        ADDI    #$0125, R2                      ; 62FB   02FA 0125
        MVO@    R0,     R2                      ; 62FD   0250
        B       L_62D0                          ; 62FE   0220 002F

L_6300:
        MOVR    R0,     R2                      ; 6300   0082
        XORI    #$0180, R2                      ; 6301   03FA 0180
        PSHR    R5                              ; 6303   0275
        MVI@    R5,     R5                      ; 6304   02AD
        ANDI    #$0002, R5                      ; 6305   03BD 0002
        PULR    R5                              ; 6307   02B5
        BEQ     L_630E                          ; 6308   0204 0004

        SDBD                                    ; 630A   0001
        XORI    #$0400, R2                      ; 630B   03FA 0000 0004
L_630E:
        MVO@    R2,     R3                      ; 630E   025A
        MVO     R0,     G_0120                  ; 630F   0240 0120
        SUBI    #$0030, R0                      ; 6311   0338 0030
        SLR     R0,     2                       ; 6313   0064
        SLR     R0,     1                       ; 6314   0060
        PSHR    R0                              ; 6315   0270
        ADDR    R0,     R4                      ; 6316   00C4
        ADDR    R0,     R4                      ; 6317   00C4
        MOVR    R0,     R1                      ; 6318   0081
        INCR    R1                              ; 6319   0009
        CMPI    #$0008, R1                      ; 631A   0379 0008
        BLT     L_631F                          ; 631C   0205 0001

        DECR    R1                              ; 631E   0011
L_631F:
        MOVR    R3,     R2                      ; 631F   009A
        SUBI    #$0322, R2                      ; 6320   033A 0322
        ADDI    #$0125, R2                      ; 6322   02FA 0125
        MVI@    R2,     R0                      ; 6324   0290
        MVO@    R1,     R2                      ; 6325   0251
        MVI     G_012B, R2                      ; 6326   0282 012B
        SLL     R2,     2                       ; 6328   004E
        SLL     R2,     2                       ; 6329   004E
        ADDR    R2,     R4                      ; 632A   00D4
        MVI@    R5,     R1                      ; 632B   02A9
        ANDI    #$0001, R1                      ; 632C   03B9 0001
        ADDR    R1,     R4                      ; 632E   00CC
        PULR    R0                              ; 632F   02B0
        INCR    R0                              ; 6330   0008
        SLL     R0,     2                       ; 6331   004C
        SLL     R0,     1                       ; 6332   0048
        TSTR    R1                              ; 6333   0089
        BNEQ    L_633C                          ; 6334   020C 0006

        SDBD                                    ; 6336   0001
        XORI    #$FFFF, R0                      ; 6337   03F8 00FF 00FF
        B       L_633E                          ; 633A   0200 0002

L_633C:
        ADDI    #$0008, R0                      ; 633C   02F8 0008
L_633E:
        MVI@    R4,     R2                      ; 633E   02A2
        ADDR    R0,     R2                      ; 633F   00C2
        INCR    R4                              ; 6340   000C
        TSTR    R1                              ; 6341   0089
        BNEQ    L_6348                          ; 6342   020C 0004

        SUBI    #$0008, R0                      ; 6344   0338 0008
        B       L_634A                          ; 6346   0200 0002

L_6348:
        ADDI    #$0008, R0                      ; 6348   02F8 0008
L_634A:
        MVI@    R4,     R1                      ; 634A   02A1
        ADDR    R1,     R0                      ; 634B   00C8
        SUBR    R2,     R0                      ; 634C   0110
        MVI     G_0120, R1                      ; 634D   0281 0120
        PSHR    R5                              ; 634F   0275

        JSR     R5,     L_67D5                  ; 6350   0004 0164 03D5

        PULR    R5                              ; 6353   02B5
        ADDR    R0,     R2                      ; 6354   00C2
        ANDI    #$00FF, R2                      ; 6355   03BA 00FF
        SDBD                                    ; 6357   0001
        XORI    #$0600, R2                      ; 6358   03FA 0000 0006
        SUBI    #$0008, R3                      ; 635B   033B 0008
        MVO@    R2,     R3                      ; 635D   025A
        ADDI    #$0008, R3                      ; 635E   02FB 0008
        DECR    R5                              ; 6360   0015
        B       L_62D0                          ; 6361   0220 0092
        INCR    R7                              ; 6363   000F

        INCR    R6                              ; 6364   000E
L_6365:
        INCR    R5                              ; 6365   000D
        INCR    R4                              ; 6366   000C
        INCR    R4                              ; 6367   000C
        INCR    R4                              ; 6368   000C
        INCR    R3                              ; 6369   000B
        INCR    R2                              ; 636A   000A
        INCR    R1                              ; 636B   0009
        INCR    R2                              ; 636C   000A
        INCR    R3                              ; 636D   000B
        INCR    R4                              ; 636E   000C
        INCR    R4                              ; 636F   000C
        INCR    R4                              ; 6370   000C
        INCR    R5                              ; 6371   000D
        INCR    R6                              ; 6372   000E
L_6373:
        PSHR    R5                              ; 6373   0275
        MVI     G_010B, R0                      ; 6374   0280 010B
        CMPI    #$00FF, R0                      ; 6376   0378 00FF
        BNEQ    L_63A3                          ; 6378   020C 0029

        MVI     G_010F, R0                      ; 637A   0280 010F
        CMPI    #$00FF, R0                      ; 637C   0378 00FF
        BNEQ    L_63A3                          ; 637E   020C 0023

        MVI     G_0132, R0                      ; 6380   0280 0132
        TSTR    R0                              ; 6382   0080
        BEQ     L_63A3                          ; 6383   0204 001E

        DECR    R0                              ; 6385   0010
        DECR    R0                              ; 6386   0010
        BMI     L_638D                          ; 6387   020B 0004

        MVO     R0,     G_0132                  ; 6389   0240 0132
        B       L_6390                          ; 638B   0200 0003

L_638D:
        CLRR    R0                              ; 638D   01C0
        MVO     R0,     G_0132                  ; 638E   0240 0132
L_6390:
        MVI     G_012D, R0                      ; 6390   0280 012D
        ANDI    #$0003, R0                      ; 6392   03B8 0003
        TSTR    R0                              ; 6394   0080
        BNEQ    L_63A3                          ; 6395   020C 000C

        MVI     G_0147, R1                      ; 6397   0281 0147
        SDBD                                    ; 6399   0001
        ADDI    #$6363, R1                      ; 639A   02F9 0063 0063
        MVI@    R1,     R0                      ; 639D   0288
        MVO     R0,     G_0147                  ; 639E   0240 0147

        JSR     R5,     L_5D0C                  ; 63A0   0004 015C 010C

L_63A3:
        PULR    R7                              ; 63A3   02B7

L_63A4:
        PSHR    R5                              ; 63A4   0275
        MVI     G_0149, R0                      ; 63A5   0280 0149
        TSTR    R0                              ; 63A7   0080
        BNEQ    L_63F4                          ; 63A8   020C 004A

        CLRR    R2                              ; 63AA   01D2
        MVO     R2,     G_014A                  ; 63AB   0242 014A
        MVII    #$0318, R1                      ; 63AD   02B9 0318
        MVI@    R1,     R0                      ; 63AF   0288
        ANDI    #$00FF, R0                      ; 63B0   03B8 00FF
        MVII    #$0320, R1                      ; 63B2   02B9 0320
        MVI@    R1,     R1                      ; 63B4   0289
        ANDI    #$007F, R1                      ; 63B5   03B9 007F
L_63B7:
        MVII    #$0134, R4                      ; 63B7   02BC 0134
        ADD     G_014A, R4                      ; 63B9   02C4 014A
        ADD     G_014A, R4                      ; 63BB   02C4 014A
        ADD     G_014A, R4                      ; 63BD   02C4 014A
        MVI@    R4,     R3                      ; 63BF   02A3
        CMPI    #$00FF, R3                      ; 63C0   037B 00FF
        BEQ     L_63F5                          ; 63C2   0204 0031

        TSTR    R3                              ; 63C4   009B
        BEQ     L_63CD                          ; 63C5   0204 0006

        MVII    #$0004, R3                      ; 63C7   02BB 0004
        MVII    #$000C, R4                      ; 63C9   02BC 000C
        B       L_63D1                          ; 63CB   0200 0004

L_63CD:
        MVII    #$000A, R3                      ; 63CD   02BB 000A
        MVII    #$000E, R4                      ; 63CF   02BC 000E
L_63D1:
        MVII    #$0322, R2                      ; 63D1   02BA 0322
        ADD     G_014A, R2                      ; 63D3   02C2 014A
        MVI@    R2,     R2                      ; 63D5   0292
        ANDI    #$007F, R2                      ; 63D6   03BA 007F
        ADDR    R3,     R2                      ; 63D8   00DA
        CMPR    R1,     R2                      ; 63D9   014A
        BLT     L_63F5                          ; 63DA   0205 0019

        SUBR    R3,     R2                      ; 63DC   011A
        SUBR    R3,     R2                      ; 63DD   011A
        CMPR    R2,     R1                      ; 63DE   0151
        BLT     L_63F5                          ; 63DF   0205 0014

        MVII    #$031A, R2                      ; 63E1   02BA 031A
        ADD     G_014A, R2                      ; 63E3   02C2 014A
        MVI@    R2,     R2                      ; 63E5   0292
        ANDI    #$00FF, R2                      ; 63E6   03BA 00FF
        ADDR    R4,     R2                      ; 63E8   00E2
        CMPR    R0,     R2                      ; 63E9   0142
        BLT     L_63F5                          ; 63EA   0205 0009

        SUBR    R4,     R2                      ; 63EC   0122
        SUBR    R4,     R2                      ; 63ED   0122
        CMPR    R2,     R0                      ; 63EE   0150
        BLT     L_63F5                          ; 63EF   0205 0004

        JSR     R5,     L_6400                  ; 63F1   0004 0164 0000

L_63F4:
        PULR    R7                              ; 63F4   02B7

L_63F5:
        MVI     G_014A, R2                      ; 63F5   0282 014A
        INCR    R2                              ; 63F7   000A
        CMPI    #$0006, R2                      ; 63F8   037A 0006
        BEQ     L_63F4                          ; 63FA   0224 0007

        MVO     R2,     G_014A                  ; 63FC   0242 014A
        B       L_63B7                          ; 63FE   0220 0048

L_6400:
        PSHR    R5                              ; 6400   0275
        MVII    #$0001, R1                      ; 6401   02B9 0001
        MVO     R1,     G_0149                  ; 6403   0241 0149
        MVII    #$0134, R2                      ; 6405   02BA 0134
        ADD     G_014A, R2                      ; 6407   02C2 014A
        ADD     G_014A, R2                      ; 6409   02C2 014A
        ADD     G_014A, R2                      ; 640B   02C2 014A
        MVII    #$00FF, R3                      ; 640D   02BB 00FF
        MVO@    R3,     R2                      ; 640F   0253
        CLRR    R3                              ; 6410   01DB
        MVO     R3,     G_0123                  ; 6411   0243 0123
        MVO     R3,     G_0124                  ; 6413   0243 0124
        MVO     R3,     G_0132                  ; 6415   0243 0132
        MVII    #$0125, R2                      ; 6417   02BA 0125
        ADD     G_014A, R2                      ; 6419   02C2 014A
        MVO@    R3,     R2                      ; 641B   0253
        MVII    #$0332, R2                      ; 641C   02BA 0332
        ADD     G_014A, R2                      ; 641E   02C2 014A
        SDBD                                    ; 6420   0001
        MVII    #$A27A, R3                      ; 6421   02BB 007A 00A2
        MVI     G_014A, R1                      ; 6424   0281 014A
        ADDR    R1,     R1                      ; 6426   00C9
        ADDR    R1,     R3                      ; 6427   00CB
        ADDR    R1,     R1                      ; 6428   00C9
        ADDR    R1,     R3                      ; 6429   00CB
        MVO@    R3,     R2                      ; 642A   0253
        MVII    #$0330, R2                      ; 642B   02BA 0330
        SDBD                                    ; 642D   0001
        MVII    #$A26E, R3                      ; 642E   02BB 006E 00A2
        MVO@    R3,     R2                      ; 6431   0253
        MVII    #$0331, R2                      ; 6432   02BA 0331
        SDBD                                    ; 6434   0001
        MVII    #$A274, R3                      ; 6435   02BB 0074 00A2
        MVO@    R3,     R2                      ; 6438   0253
        MVII    #$014B, R2                      ; 6439   02BA 014B
        ADD     G_014A, R2                      ; 643B   02C2 014A
        MVII    #$005A, R3                      ; 643D   02BB 005A
        MVO@    R3,     R2                      ; 643F   0253
        MVII    #$0001, R1                      ; 6440   02B9 0001
        MVO     R1,     G_0149                  ; 6442   0241 0149
        MVI     G_0320, R1                      ; 6444   0281 0320
        SDBD                                    ; 6446   0001
        XORI    #$0400, R1                      ; 6447   03F9 0000 0004
        MVO     R1,     G_0320                  ; 644A   0241 0320
        MVI     G_0329, R1                      ; 644C   0281 0329
        SDBD                                    ; 644E   0001
        ANDI    #$EFFF, R1                      ; 644F   03B9 00FF 00EF
        XORI    #$0006, R1                      ; 6452   03F9 0006
        MVO     R1,     G_0329                  ; 6454   0241 0329
        MVII    #$032A, R1                      ; 6456   02B9 032A
        ADD     G_014A, R1                      ; 6458   02C1 014A
        MVI@    R1,     R2                      ; 645A   028A
        SDBD                                    ; 645B   0001
        ANDI    #$EFF8, R2                      ; 645C   03BA 00F8 00EF
        SDBD                                    ; 645F   0001
        XORI    #$1002, R2                      ; 6460   03FA 0002 0010
        MVO@    R2,     R1                      ; 6463   024A
        MVII    #$0012, R4                      ; 6464   02BC 0012

        JSR     R5,     L_6DB4                  ; 6466   0004 016C 01B4

        PULR    R7                              ; 6469   02B7

L_646A:
        PSHR    R5                              ; 646A   0275
        MVII    #$031A, R2                      ; 646B   02BA 031A
        ADD     G_014A, R2                      ; 646D   02C2 014A
        MVI@    R2,     R3                      ; 646F   0293
        SDBD                                    ; 6470   0001
        ANDI    #$FF00, R3                      ; 6471   03BB 0000 00FF
        MVO@    R3,     R2                      ; 6474   0253
        ADDI    #$0008, R2                      ; 6475   02FA 0008
        MVI@    R2,     R3                      ; 6477   0293
        SDBD                                    ; 6478   0001
        ANDI    #$FF80, R3                      ; 6479   03BB 0080 00FF
        MVO@    R3,     R2                      ; 647C   0253
        MVII    #$0332, R2                      ; 647D   02BA 0332
        ADD     G_014A, R2                      ; 647F   02C2 014A
        SDBD                                    ; 6481   0001
        MVII    #$A1FC, R3                      ; 6482   02BB 00FC 00A1
        MVI     G_014A, R1                      ; 6485   0281 014A
        ADDR    R1,     R1                      ; 6487   00C9
        ADDR    R1,     R3                      ; 6488   00CB
        ADDR    R1,     R1                      ; 6489   00C9
        ADDR    R1,     R3                      ; 648A   00CB
        MVO@    R3,     R2                      ; 648B   0253
        MVII    #$0330, R2                      ; 648C   02BA 0330
        SDBD                                    ; 648E   0001
        MVII    #$A1F0, R3                      ; 648F   02BB 00F0 00A1
        MVO@    R3,     R2                      ; 6492   0253
        MVII    #$0331, R2                      ; 6493   02BA 0331
        SDBD                                    ; 6495   0001
        MVII    #$A1F6, R3                      ; 6496   02BB 00F6 00A1
        MVO@    R3,     R2                      ; 6499   0253
        CLRR    R1                              ; 649A   01C9
        MVO     R1,     G_0149                  ; 649B   0241 0149
        MVO     R1,     G_0123                  ; 649D   0241 0123
        MVO     R1,     G_0124                  ; 649F   0241 0124
        MVI     G_0320, R1                      ; 64A1   0281 0320
        SDBD                                    ; 64A3   0001
        XORI    #$0400, R1                      ; 64A4   03F9 0000 0004
        MVO     R1,     G_0320                  ; 64A7   0241 0320
        MVI     G_0329, R1                      ; 64A9   0281 0329
        SDBD                                    ; 64AB   0001
        ANDI    #$FFF9, R1                      ; 64AC   03B9 00F9 00FF
        SDBD                                    ; 64AF   0001
        XORI    #$1000, R1                      ; 64B0   03F9 0000 0010
        MVO     R1,     G_0329                  ; 64B3   0241 0329
        PULR    R7                              ; 64B5   02B7

L_64B6:
        PSHR    R5                              ; 64B6   0275
        MVI     G_0149, R1                      ; 64B7   0281 0149
        TSTR    R1                              ; 64B9   0089
        BEQ     L_64E9                          ; 64BA   0204 002D

        MVI     G_0123, R2                      ; 64BC   0282 0123
        INCR    R2                              ; 64BE   000A
        ANDI    #$0003, R2                      ; 64BF   03BA 0003
        MVO     R2,     G_0123                  ; 64C1   0242 0123
        MVO     R2,     G_0124                  ; 64C3   0242 0124
        CLRR    R1                              ; 64C5   01C9
        MVO     R1,     G_014A                  ; 64C6   0241 014A
L_64C8:
        MVII    #$014B, R2                      ; 64C8   02BA 014B
        ADD     G_014A, R2                      ; 64CA   02C2 014A
        MVI@    R2,     R3                      ; 64CC   0293
        TSTR    R3                              ; 64CD   009B
        BEQ     L_64DE                          ; 64CE   0204 000E

        DECR    R3                              ; 64D0   0013
        MVO@    R3,     R2                      ; 64D1   0253
        TSTR    R3                              ; 64D2   009B
        BEQ     L_64EA                          ; 64D3   0204 0015

        MVII    #$0125, R2                      ; 64D5   02BA 0125
        ADD     G_014A, R2                      ; 64D7   02C2 014A
        MVI@    R2,     R3                      ; 64D9   0293
        INCR    R3                              ; 64DA   000B
        ANDI    #$0003, R3                      ; 64DB   03BB 0003
        MVO@    R3,     R2                      ; 64DD   0253
L_64DE:
        MVI     G_014A, R1                      ; 64DE   0281 014A
        INCR    R1                              ; 64E0   0009
        CMPI    #$0006, R1                      ; 64E1   0379 0006
        BGE     L_64E9                          ; 64E3   020D 0004

        MVO     R1,     G_014A                  ; 64E5   0241 014A
        B       L_64C8                          ; 64E7   0220 0020
L_64E9:
        PULR    R7                              ; 64E9   02B7

L_64EA:
        JSR     R5,     L_646A                  ; 64EA   0004 0164 006A

        B       L_64DE                          ; 64ED   0220 0010

        DECLE   $002A,  $0080,  $002A,  $0080   ; 64EF   002A 0080 002A 0080
        DECLE   $002A,  $0080,  $002A,  $0080   ; 64F3   002A 0080 002A 0080
        DECLE   $0028,  $007E,  $0026,  $007C   ; 64F7   0028 007E 0026 007C
        DECLE   $0024,  $007A,  $0022,  $0079   ; 64FB   0024 007A 0022 0079
        DECLE   $0022,  $0079,  $0022,  $0079   ; 64FF   0022 0079 0022 0079
        DECLE   $0022,  $0079,  $0022,  $0078   ; 6503   0022 0079 0022 0078
        DECLE   $0021,  $0077,  $0020,  $0076   ; 6507   0021 0077 0020 0076
        DECLE   $001F,  $0075,  $001E,  $0073   ; 650B   001F 0075 001E 0073
        DECLE   $001D,  $0070,  $001C,  $006E   ; 650F   001D 0070 001C 006E
        DECLE   $001B,  $006D,  $001A,  $006A   ; 6513   001B 006D 001A 006A
        DECLE   $0018,  $0068,  $0016,  $0066   ; 6517   0018 0068 0016 0066
        DECLE   $0014,  $0064,  $0012,  $0062   ; 651B   0014 0064 0012 0062
        DECLE   $0010,  $005F,  $0010,  $005F   ; 651F   0010 005F 0010 005F
        DECLE   $0010,  $005F,  $0010,  $005F   ; 6523   0010 005F 0010 005F
        DECLE   $000E,  $005C,  $000E,  $005B   ; 6527   000E 005C 000E 005B
        DECLE   $000A,  $0059,  $000A,  $0056   ; 652B   000A 0059 000A 0056
        DECLE   $000A,  $0055,  $0004,  $0053   ; 652F   000A 0055 0004 0053
        DECLE   $0000,  $0052,  $0000,  $0050   ; 6533   0000 0052 0000 0050
        DECLE   $0000,  $0050,  $0000,  $0050   ; 6537   0000 0050 0000 0050
        DECLE   $0000,  $0050,  $002C,  $0082   ; 653B   0000 0050 002C 0082
        DECLE   $002E,  $0084,  $0030,  $0086   ; 653F   002E 0084 0030 0086
        DECLE   $0031,  $0088,  $0031,  $0088   ; 6543   0031 0088 0031 0088
        DECLE   $0031,  $0088,  $0031,  $0088   ; 6547   0031 0088 0031 0088
        DECLE   $0032,  $0088,  $0033,  $0089   ; 654B   0032 0088 0033 0089
        DECLE   $0034,  $008A,  $0035,  $008B   ; 654F   0034 008A 0035 008B
        DECLE   $0037                           ; 6553   0037

        MOVR    R1,     R4                      ; 6554   008C
        RSWD    R2                              ; 6555   003A
        MOVR    R1,     R5                      ; 6556   008D
        RSWD    R4                              ; 6557   003C
        MOVR    R1,     R6                      ; 6558   008E
        RSWD    R5                              ; 6559   003D
        MOVR    R1,     R7                      ; 655A   008F

        SWAP    R0,     1                       ; 655B   0040
        MOVR    R2,     R0                      ; 655C   0090
        SWAP    R2,     1                       ; 655D   0042
        TSTR    R2                              ; 655E   0092
        SWAP    R0,     2                       ; 655F   0044
        MOVR    R2,     R4                      ; 6560   0094
        SWAP    R2,     2                       ; 6561   0046
        MOVR    R2,     R6                      ; 6562   0096
        SLL     R0,     1                       ; 6563   0048
        MOVR    R3,     R0                      ; 6564   0098
        SLL     R3,     1                       ; 6565   004B
        MOVR    R3,     R2                      ; 6566   009A
        SLL     R3,     1                       ; 6567   004B
        MOVR    R3,     R2                      ; 6568   009A
        SLL     R3,     1                       ; 6569   004B
        MOVR    R3,     R2                      ; 656A   009A
        SLL     R3,     1                       ; 656B   004B
        MOVR    R3,     R2                      ; 656C   009A
        SLL     R2,     2                       ; 656D   004E
        MOVR    R3,     R4                      ; 656E   009C
        SLL     R3,     2                       ; 656F   004F
        MOVR    R3,     R4                      ; 6570   009C
        RLC     R1,     1                       ; 6571   0051
        MOVR    R4,     R0                      ; 6572   00A0
        RLC     R0,     2                       ; 6573   0054
        MOVR    R4,     R0                      ; 6574   00A0
        RLC     R1,     2                       ; 6575   0055
        MOVR    R4,     R0                      ; 6576   00A0
        RLC     R3,     2                       ; 6577   0057
        MOVR    R4,     R6                      ; 6578   00A6
        SLLC    R0,     1                       ; 6579   0058
        MOVR    R5,     R2                      ; 657A   00AA
        SLLC    R2,     1                       ; 657B   005A
        MOVR    R5,     R2                      ; 657C   00AA
        SLLC    R2,     1                       ; 657D   005A
        MOVR    R5,     R2                      ; 657E   00AA
        SLLC    R2,     1                       ; 657F   005A
        MOVR    R5,     R2                      ; 6580   00AA
        SLLC    R2,     1                       ; 6581   005A
        MOVR    R5,     R2                      ; 6582   00AA
        SLLC    R2,     1                       ; 6583   005A
        MOVR    R5,     R2                      ; 6584   00AA
L_6585:
        PSHR    R5                              ; 6585   0275
        MVI     G_012B, R1                      ; 6586   0281 012B
        SLL     R1,     1                       ; 6588   0049
        SDBD                                    ; 6589   0001
        MVII    #$64EF, R4                      ; 658A   02BC 00EF 0064
        ADDR    R1,     R4                      ; 658D   00CC
        MVI@    R4,     R2                      ; 658E   02A2
        MVI@    R4,     R3                      ; 658F   02A3
        MVI     G_0318, R1                      ; 6590   0281 0318
        ANDI    #$00FF, R1                      ; 6592   03B9 00FF
        CMPR    R2,     R1                      ; 6594   0151
        BLT     L_65AA                          ; 6595   0205 0013

        CMPR    R3,     R1                      ; 6597   0159
        BGT     L_65AA                          ; 6598   020E 0010

        CLRR    R1                              ; 659A   01C9
        MVO     R1,     G_0148                  ; 659B   0241 0148
        MVI     G_0119, R1                      ; 659D   0281 0119
        TSTR    R1                              ; 659F   0089
        BEQ     L_65A6                          ; 65A0   0204 0004

        MVII    #$00F0, R1                      ; 65A2   02B9 00F0
        B       L_65B0                          ; 65A4   0200 000A

L_65A6:
        MVII    #$008A, R1                      ; 65A6   02B9 008A
        B       L_65B0                          ; 65A8   0200 0006

L_65AA:
        MVII    #$0034, R1                      ; 65AA   02B9 0034
        MVII    #$0001, R0                      ; 65AC   02B8 0001
        MVO     R0,     G_0148                  ; 65AE   0240 0148
L_65B0:
        MVO     R1,     G_011B                  ; 65B0   0241 011B
        PULR    R7                              ; 65B2   02B7

        DECLE   $0000,  $0000,  $0001,  $0000   ; 65B3   0000 0000 0001 0000
        DECLE   $0001,  $0000,  $0002,  $0000   ; 65B7   0001 0000 0002 0000
        DECLE   $0001,  $0000,  $0001,  $0000   ; 65BB   0001 0000 0001 0000
        DECLE   $0002,  $0000,  $0003,  $0000   ; 65BF   0002 0000 0003 0000
        DECLE   $0002,  $0000,  $00FF,  $00FF   ; 65C3   0002 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FE,  $00FF   ; 65C7   00FF 00FF 00FE 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 65CB   00FF 00FF 00FF 00FF
        DECLE   $00FE,  $00FF,  $00FD,  $00FF   ; 65CF   00FE 00FF 00FD 00FF
        DECLE   $00FE,  $00FF,  $001C,  $0021   ; 65D3   00FE 00FF 001C 0021
        DECLE   $0020,  $001E,  $0021,  $0020   ; 65D7   0020 001E 0021 0020
        DECLE   $001E,  $001D,  $001F,  $0000   ; 65DB   001E 001D 001F 0000
        DECLE   $001C,  $001D,  $001E,  $001D   ; 65DF   001C 001D 001E 001D
        DECLE   $001E,  $001D,  $001E,  $001D   ; 65E3   001E 001D 001E 001D
        DECLE   $001E,  $0021,  $0020,  $001E   ; 65E7   001E 0021 0020 001E
        DECLE   $001D,  $001F,  $0000,  $0000   ; 65EB   001D 001F 0000 0000
        DECLE   $0000,  $001C,  $001D,  $001E   ; 65EF   0000 001C 001D 001E
        DECLE   $0021,  $0020,  $001E,  $001D   ; 65F3   0021 0020 001E 001D
        DECLE   $001F,  $0000,  $0000,  $001C   ; 65F7   001F 0000 0000 001C
        DECLE   $001D,  $001E,  $0021,  $0020   ; 65FB   001D 001E 0021 0020
        DECLE   $001E,  $0021,  $0020,  $001E   ; 65FF   001E 0021 0020 001E
        DECLE   $0021,  $0020,  $001F,  $0000   ; 6603   0021 0020 001F 0000
        DECLE   $001C,  $001D,  $001E,  $0021   ; 6607   001C 001D 001E 0021
        DECLE   $0020,  $001E,  $001D,  $001E   ; 660B   0020 001E 001D 001E
        DECLE   $0021,  $0020,  $001E,  $0021   ; 660F   0021 0020 001E 0021
        DECLE   $0020,  $001E,  $001D,  $001F   ; 6613   0020 001E 001D 001F
        DECLE   $0000,  $0000,  $0000,  $001C   ; 6617   0000 0000 0000 001C
        DECLE   $001D,  $001E,  $001D,  $001F   ; 661B   001D 001E 001D 001F
        DECLE   $0000,  $0000,  $0000,  $001C   ; 661F   0000 0000 0000 001C
        DECLE   $001D,  $001E,  $0021,  $0020   ; 6623   001D 001E 0021 0020
        DECLE   $001E,  $0021,  $0020,  $001E   ; 6627   001E 0021 0020 001E
        DECLE   $001D,  $001F,  $0000,  $0000   ; 662B   001D 001F 0000 0000
        DECLE   $03FF                           ; 662F   03FF
L_6630:
        PSHR    R5                              ; 6630   0275
        MVII    #$02D0, R3                      ; 6631   02BB 02D0
        MVI     G_0146, R4                      ; 6633   0284 0146
        ADDR    R4,     R4                      ; 6635   00E4
        SDBD                                    ; 6636   0001
        ADDI    #$65B3, R4                      ; 6637   02FC 00B3 0065
        SDBD                                    ; 663A   0001
        MVI@    R4,     R0                      ; 663B   02A0
        ADD     G_0342, R0                      ; 663C   02C0 0342
        BPL     L_6641                          ; 663E   0203 0001

        ADDR    R3,     R0                      ; 6640   00D8
L_6641:
        CMPR    R3,     R0                      ; 6641   0158
        BLE     L_6645                          ; 6642   0206 0001

        CLRR    R0                              ; 6644   01C0
L_6645:
        MVO     R0,     G_0342                  ; 6645   0240 0342
        PULR    R7                              ; 6647   02B7

L_6648:
        PSHR    R5                              ; 6648   0275
        MVII    #$0250, R4                      ; 6649   02BC 0250
        SDBD                                    ; 664B   0001
        MVII    #$65D5, R5                      ; 664C   02BD 00D5 0065
        MVI     G_0342, R0                      ; 664F   0280 0342
        SLR     R0,     2                       ; 6651   0064
        SLR     R0,     1                       ; 6652   0060
        NEGR    R0                              ; 6653   0020
        ADDI    #$005A, R0                      ; 6654   02F8 005A
        ADDR    R0,     R5                      ; 6656   00C5
L_6657:
        MVI@    R5,     R1                      ; 6657   02A9
        CMPI    #$03FF, R1                      ; 6658   0379 03FF
        BLT     L_6662                          ; 665A   0205 0006

        SDBD                                    ; 665C   0001
        MVII    #$65D5, R5                      ; 665D   02BD 00D5 0065
        B       L_6657                          ; 6660   0220 000A

L_6662:
        SLL     R1,     2                       ; 6662   004D
        SLL     R1,     1                       ; 6663   0049
        BEQ     L_666A                          ; 6664   0204 0004

        SDBD                                    ; 6666   0001
        XORI    #$0800, R1                      ; 6667   03F9 0000 0008
L_666A:
        SDBD                                    ; 666A   0001
        XORI    #$3203, R1                      ; 666B   03F9 0003 0032
        MVO@    R1,     R4                      ; 666E   0261
        CMPI    #$0264, R4                      ; 666F   037C 0264
        BNEQ    L_6657                          ; 6671   022C 001B
        PULR    R7                              ; 6673   02B7

L_6674:
        PSHR    R5                              ; 6674   0275
        SDBD                                    ; 6675   0001
        MVII    #$38E0, R5                      ; 6676   02BD 00E0 0038
        SDBD                                    ; 6679   0001
        MVII    #$A060, R4                      ; 667A   02BC 0060 00A0
        MVI     G_0342, R2                      ; 667D   0282 0342
        ANDI    #$0007, R2                      ; 667F   03BA 0007
        SLL     R2,     2                       ; 6681   004E
        SLL     R2,     2                       ; 6682   004E
        ADDR    R2,     R4                      ; 6683   00D4
        SLL     R2,     1                       ; 6684   004A
        ADDR    R2,     R4                      ; 6685   00D4
        MVII    #$0006, R0                      ; 6686   02B8 0006
L_6688:
        MVI@    R4,     R1                      ; 6688   02A1
        MVO@    R1,     R5                      ; 6689   0269
        MVI@    R4,     R1                      ; 668A   02A1
        MVO@    R1,     R5                      ; 668B   0269
        MVI@    R4,     R1                      ; 668C   02A1
        MVO@    R1,     R5                      ; 668D   0269
        MVI@    R4,     R1                      ; 668E   02A1
        MVO@    R1,     R5                      ; 668F   0269
        MVI@    R4,     R1                      ; 6690   02A1
        MVO@    R1,     R5                      ; 6691   0269
        MVI@    R4,     R1                      ; 6692   02A1
        MVO@    R1,     R5                      ; 6693   0269
        MVI@    R4,     R1                      ; 6694   02A1
        MVO@    R1,     R5                      ; 6695   0269
        MVI@    R4,     R1                      ; 6696   02A1
        MVO@    R1,     R5                      ; 6697   0269
        DECR    R0                              ; 6698   0010
        BNEQ    L_6688                          ; 6699   022C 0012
        PULR    R7                              ; 669B   02B7

        DECLE   $0002,  $0053,  $0043,  $004F   ; 669C   0002 0053 0043 004F
        DECLE   $0052,  $0045,  $0000,  $0003   ; 66A0   0052 0045 0000 0003
        DECLE   $0020,  $0020,  $0054,  $004D   ; 66A4   0020 0020 0054 004D
        DECLE   $0000,  $0005,  $0020,  $004C   ; 66A8   0000 0005 0020 004C
        DECLE   $0041,  $0050,  $0000,  $0007   ; 66AC   0041 0050 0000 0007
        DECLE   $0020,  $0053,  $0050,  $0045   ; 66B0   0020 0053 0050 0045
        DECLE   $0045,  $0044,  $0000           ; 66B4   0045 0044 0000
L_66B7:
        PSHR    R5                              ; 66B7   0275
        SDBD                                    ; 66B8   0001
        MVII    #$669C, R5                      ; 66B9   02BD 009C 0066
        MVII    #$0201, R4                      ; 66BC   02BC 0201
L_66BE:
        MVI@    R5,     R3                      ; 66BE   02AB
        SDBD                                    ; 66BF   0001
        XORI    #$3200, R3                      ; 66C0   03FB 0000 0032
        MOVR    R5,     R1                      ; 66C3   00A9

        JSR     R5,     X_PRINT_R1              ; 66C4   0004 0118 0067

        SDBD                                    ; 66C7   0001
        CMPI    #$66B7, R5                      ; 66C8   037D 00B7 0066
        BNEQ    L_66BE                          ; 66CB   022C 000E

        SDBD                                    ; 66CD   0001
        MVII    #$2710, R1                      ; 66CE   02B9 0010 0027
        MVI     G_0343, R0                      ; 66D1   0280 0343
        CMPR    R1,     R0                      ; 66D3   0148
        BLT     L_66D9                          ; 66D4   0205 0003

        SUBR    R1,     R0                      ; 66D6   0108
        MVO     R0,     G_0343                  ; 66D7   0240 0343
L_66D9:
        MVII    #$0004, R1                      ; 66D9   02B9 0004
        SDBD                                    ; 66DB   0001
        MVII    #$3202, R3                      ; 66DC   02BB 0002 0032
        MVII    #$0217, R4                      ; 66DF   02BC 0217

        JSR     R5,     X_PRNUM_RGT             ; 66E1   0004 0118 00C5

        SDBD                                    ; 66E4   0001
        MVII    #$3B18, R0                      ; 66E5   02B8 0018 003B
        MVO     R0,     .BTAB.23                ; 66E8   0240 0223
        PULR    R7                              ; 66EA   02B7

L_66EB:
        PSHR    R5                              ; 66EB   0275
        MVI     G_0343, R0                      ; 66EC   0280 0343
        SLR     R0,     1                       ; 66EE   0060
        MVII    #$0004, R1                      ; 66EF   02B9 0004
        SDBD                                    ; 66F1   0001
        MVII    #$3202, R3                      ; 66F2   02BB 0002 0032
        MVII    #$0216, R4                      ; 66F5   02BC 0216

        JSR     R5,     X_PRNUM_RGT             ; 66F7   0004 0118 00C5

        PULR    R7                              ; 66FA   02B7

L_66FB:
        PSHR    R5                              ; 66FB   0275
        MVI     G_0344, R0                      ; 66FC   0280 0344
        DECR    R0                              ; 66FE   0010
        CMPI    #$000F, R0                      ; 66FF   0378 000F
        BLT     L_6765                          ; 6701   0205 0062

        MVO     R0,     G_0344                  ; 6703   0240 0344
        SLR     R0,     2                       ; 6705   0064
        NOP                                     ; 6706   0034
        SLR     R0,     2                       ; 6707   0064
        MVII    #$0003, R1                      ; 6708   02B9 0003
        SDBD                                    ; 670A   0001
        MVII    #$3203, R3                      ; 670B   02BB 0003 0032
        MVII    #$021B, R4                      ; 670E   02BC 021B

        JSR     R5,     X_PRNUM_RGT             ; 6710   0004 0118 00C5

        MVI     G_0154, R0                      ; 6713   0280 0154
        TSTR    R0                              ; 6715   0080
        BEQ     L_675D                          ; 6716   0204 0045
        INCR    R7                              ; 6718   000F

L_6719:
        PSHR    R5                              ; 6719   0275
L_671A:
        MVI     G_0344, R0                      ; 671A   0280 0344
        CMPI    #$000F, R0                      ; 671C   0378 000F
        BLT     L_675D                          ; 671E   0205 003D

        MVI     G_0345, R0                      ; 6720   0280 0345
        INCR    R0                              ; 6722   0008
        MVO     R0,     G_0345                  ; 6723   0240 0345
        SDBD                                    ; 6725   0001
        MVII    #$3205, R3                      ; 6726   02BB 0005 0032
        MVII    #$021F, R4                      ; 6729   02BC 021F
        MVI     G_0155, R5                      ; 672B   0285 0155
        DECR    R5                              ; 672D   0015
        BMI     L_6756                          ; 672E   020B 0026

        MVO     R5,     G_0155                  ; 6730   0245 0155
        MVO@    R3,     R4                      ; 6732   0263
        MVO@    R3,     R4                      ; 6733   0263
        MVO@    R3,     R4                      ; 6734   0263
        MVII    #$022C, R4                      ; 6735   02BC 022C
        ANDI    #$0002, R5                      ; 6737   03BD 0002
        BEQ     L_675E                          ; 6739   0204 0023

        PSHR    R3                              ; 673B   0273
        SDBD                                    ; 673C   0001
        MVII    #$3202, R3                      ; 673D   02BB 0002 0032

        JSR     R5,     X_PRINT_R5              ; 6740   0004 0118 007B
        STRING  "EXTENDED PLAY"                 ; 6743  
        DECLE   $0000                           ; 6750   0000

        PULR    R3                              ; 6751   02B3
        MVII    #$021F, R4                      ; 6752   02BC 021F
        MVI     G_0346, R0                      ; 6754   0280 0346
L_6756:
        SLR     R0,     2                       ; 6756   0064
        MVII    #$0003, R1                      ; 6757   02B9 0003
        SLR     R0,     2                       ; 6759   0064

        JSR     R5,     X_PRNUM_RGT             ; 675A   0004 0118 00C5

L_675D:
        PULR    R7                              ; 675D   02B7

L_675E:
        MVII    #$000D, R0                      ; 675E   02B8 000D
        MOVR    R3,     R1                      ; 6760   0099

        JSR     R5,     X_FILL_MEM              ; 6761   0004 0114 0341

        PULR    R7                              ; 6764   02B7

L_6765:
        MVII    #$033D, R1                      ; 6765   02B9 033D
        SDBD                                    ; 6767   0001
        MVII    #$50B6, R0                      ; 6768   02B8 00B6 0050
        MVO@    R0,     R1                      ; 676B   0248
        CLRR    R0                              ; 676C   01C0
        MVO     R0,     G_0132                  ; 676D   0240 0132
        MVI     G_011C, R0                      ; 676F   0280 011C
        CMPI    #$000B, R0                      ; 6771   0378 000B
        BNEQ    L_677A                          ; 6773   020C 0005

        MVII    #$000C, R0                      ; 6775   02B8 000C
        MVO     R0,     G_011C                  ; 6777   0240 011C
        PULR    R7                              ; 6779   02B7

L_677A:
        MVII    #$000D, R0                      ; 677A   02B8 000D
        MVO     R0,     G_011C                  ; 677C   0240 011C
        PULR    R7                              ; 677E   02B7

        DECLE   $0000,  $0001,  $0002,  $0003   ; 677F   0000 0001 0002 0003
        DECLE   $0002,  $0001,  $0004,  $0004   ; 6783   0002 0001 0004 0004
        DECLE   $0004,  $03FF,  $03FE,  $03FD   ; 6787   0004 03FF 03FE 03FD
        DECLE   $03FE,  $03FF,  $03FC,  $03FC   ; 678B   03FE 03FF 03FC 03FC
        DECLE   $03FC,  $0000,  $0000           ; 678F   03FC 0000 0000
L_6792:
        PSHR    R5                              ; 6792   0275
        MVI     G_012D, R2                      ; 6793   0282 012D
        ANDI    #$0001, R2                      ; 6795   03BA 0001
        BEQ     L_67D4                          ; 6797   0204 003B

        CLRR    R1                              ; 6799   01C9
        MVI     G_0132, R2                      ; 679A   0282 0132
        CMPI    #$0050, R2                      ; 679C   037A 0050
        BLT     L_67B9                          ; 679E   0205 0019

        SDBD                                    ; 67A0   0001
        MVII    #$677F, R1                      ; 67A1   02B9 007F 0067
        ADD     G_0146, R1                      ; 67A4   02C1 0146
        MVI@    R1,     R1                      ; 67A6   0289
        SWAP    R1,     1                       ; 67A7   0041
        SAR     R1,     2                       ; 67A8   006D
        SAR     R1,     2                       ; 67A9   006D
        NOP                                     ; 67AA   0034
        SAR     R1,     2                       ; 67AB   006D
        SAR     R1,     2                       ; 67AC   006D
        CMPI    #$00A0, R2                      ; 67AD   037A 00A0
        BGT     L_67B9                          ; 67AF   020E 0008

        TSTR    R1                              ; 67B1   0089
        BEQ     L_67D4                          ; 67B2   0204 0020
        BPL     L_67B8                          ; 67B4   0203 0002

        INCR    R1                              ; 67B6   0009
        INCR    R7                              ; 67B7   000F

L_67B8:
        DECR    R1                              ; 67B8   0011
L_67B9:
        MVI     G_0318, R0                      ; 67B9   0280 0318
        MOVR    R0,     R2                      ; 67BB   0082
        ANDI    #$00FF, R2                      ; 67BC   03BA 00FF
        XORR    R2,     R0                      ; 67BE   01D0
        ADDR    R1,     R2                      ; 67BF   00CA
        ANDI    #$00FF, R2                      ; 67C0   03BA 00FF
        XORR    R2,     R0                      ; 67C2   01D0
        MVO     R0,     G_0318                  ; 67C3   0240 0318
        MVO     R0,     G_0319                  ; 67C5   0240 0319
        TSTR    R1                              ; 67C7   0089
        BPL     L_67CB                          ; 67C8   0203 0001

        NEGR    R1                              ; 67CA   0021
L_67CB:
        CMPI    #$0003, R1                      ; 67CB   0379 0003
        BLT     L_67D4                          ; 67CD   0205 0005

        MVII    #$000F, R4                      ; 67CF   02BC 000F

        JSR     R5,     L_6DB4                  ; 67D1   0004 016C 01B4

L_67D4:
        PULR    R7                              ; 67D4   02B7

L_67D5:
        PSHR    R5                              ; 67D5   0275
        MOVR    R0,     R5                      ; 67D6   0085
        BPL     L_67DA                          ; 67D7   0203 0001

        NEGR    R0                              ; 67D9   0020
L_67DA:
        ANDI    #$0007, R1                      ; 67DA   03B9 0007
        INCR    R1                              ; 67DC   0009
        ADDR    R7,     R1                      ; 67DD   00F9
        ADD@    R1,     R7                      ; 67DE   02CF

        ADCR    R0                              ; 67DF   0028
        INCR    R0                              ; 67E0   0008
        INCR    R1                              ; 67E1   0009
        NEGR    R2                              ; 67E2   0022
        INCR    R3                              ; 67E3   000B
        COMR    R4                              ; 67E4   001C
        INCR    R6                              ; 67E5   000E
        DECR    R4                              ; 67E6   0014
        SAR     R0,     1                       ; 67E7   0068
        SAR     R0,     1                       ; 67E8   0068
        NOP                                     ; 67E9   0034
        SAR     R0,     1                       ; 67EA   0068
        B       L_6808                          ; 67EB   0200 001B

        SAR     R0,     1                       ; 67ED   0068
        MOVR    R0,     R1                      ; 67EE   0081
        SAR     R0,     1                       ; 67EF   0068
        ADDR    R1,     R0                      ; 67F0   00C8
        B       L_6808                          ; 67F1   0200 0015

        SAR     R0,     1                       ; 67F3   0068
        MOVR    R0,     R1                      ; 67F4   0081
        SAR     R0,     1                       ; 67F5   0068
        ADDR    R0,     R1                      ; 67F6   00C1
        SAR     R0,     1                       ; 67F7   0068
        ADDR    R1,     R0                      ; 67F8   00C8
        B       L_6808                          ; 67F9   0200 000D

        SAR     R0,     1                       ; 67FB   0068
        MOVR    R0,     R1                      ; 67FC   0081
        SAR     R0,     2                       ; 67FD   006C
        ADDR    R1,     R0                      ; 67FE   00C8
        B       L_6808                          ; 67FF   0200 0007

        SAR     R0,     2                       ; 6801   006C
        MOVR    R0,     R1                      ; 6802   0081
        SAR     R0,     1                       ; 6803   0068
        ADDR    R1,     R0                      ; 6804   00C8
        B       L_6808                          ; 6805   0200 0001

        CLRR    R0                              ; 6807   01C0
L_6808:
        TSTR    R5                              ; 6808   00AD
        BPL     L_680C                          ; 6809   0203 0001

        NEGR    R0                              ; 680B   0020
L_680C:
        PULR    R7                              ; 680C   02B7

L_680D:
        PSHR    R5                              ; 680D   0275
        MVII    #$0064, R0                      ; 680E   02B8 0064
        SDBD                                    ; 6810   0001
        MVII    #$3200, R1                      ; 6811   02B9 0000 0032
        MVII    #$0200, R4                      ; 6814   02BC 0200

        JSR     R5,     X_FILL_MEM              ; 6816   0004 0114 0341

        PULR    R7                              ; 6819   02B7

        DECLE   $0004,  $0000,  $0004,  $0001   ; 681A   0004 0000 0004 0001
        DECLE   $0008,  $0000,  $0008,  $0001   ; 681E   0008 0000 0008 0001
        DECLE   $000F,  $0000,  $000F,  $0001   ; 6822   000F 0000 000F 0001

        INCR    R2                              ; 6826   000A
        INCR    R2                              ; 6827   000A
        INCR    R0                              ; 6828   0008
        INCR    R0                              ; 6829   0008
        CLRC                                    ; 682A   0006
        CLRC                                    ; 682B   0006
L_682C:
        PSHR    R5                              ; 682C   0275

        JSR     R5,     L_534A                  ; 682D   0004 0150 034A
        DECLE   $0332                           ; 6830   0332

        ADDR    R7,     R4                      ; 6831   00FC
        MOVR    R4,     R1                      ; 6832   00A1
        SUB@    R6,     R3                      ; 6833   0333
        EIS                                     ; 6834   0002
        MOVR    R4,     R2                      ; 6835   00A2
        SUB@    R6,     R4                      ; 6836   0334
        INCR    R0                              ; 6837   0008
        MOVR    R4,     R2                      ; 6838   00A2
        SUB@    R6,     R5                      ; 6839   0335
        INCR    R6                              ; 683A   000E
        MOVR    R4,     R2                      ; 683B   00A2
        SUB@    R6,     R6                      ; 683C   0336
        DECR    R4                              ; 683D   0014
        MOVR    R4,     R2                      ; 683E   00A2
        SUB@    R6,     R7                      ; 683F   0337

        DECLE   $001A,  $00A2,  $0000           ; 6840   001A 00A2 0000

        CLRR    R1                              ; 6843   01C9
        MVO     R1,     G_0132                  ; 6844   0241 0132
        MVO     R1,     G_0133                  ; 6846   0241 0133
        MVO     R1,     G_0123                  ; 6848   0241 0123
        MVO     R1,     G_0124                  ; 684A   0241 0124
        MVI     G_011E, R1                      ; 684C   0281 011E
        ANDI    #$0001, R1                      ; 684E   03B9 0001
        BEQ     L_6858                          ; 6850   0204 0006

        SDBD                                    ; 6852   0001
        MVII    #$0678, R1                      ; 6853   02B9 0078 0006
        B       L_685C                          ; 6856   0200 0004

L_6858:
        SDBD                                    ; 6858   0001
        MVII    #$0630, R1                      ; 6859   02B9 0030 0006
L_685C:
        MVO     R1,     G_0318                  ; 685C   0241 0318
        MVO     R1,     G_0319                  ; 685E   0241 0319
        MVII    #$00D8, R1                      ; 6860   02B9 00D8
        MVO     R1,     G_0320                  ; 6862   0241 0320
        MVO     R1,     G_0321                  ; 6864   0241 0321
        MVII    #$031A, R3                      ; 6866   02BB 031A
        MOVR    R7,     R4                      ; 6868   00BC
        ADDI    #$005E, R4                      ; 6869   02FC 005E

        JSR     R5,     L_5369                  ; 686B   0004 0150 0369

        MVI     G_011E, R0                      ; 686E   0280 011E
        ANDI    #$0001, R0                      ; 6870   03B8 0001
        TSTR    R0                              ; 6872   0080
        BNEQ    L_687B                          ; 6873   020C 0006

        SDBD                                    ; 6875   0001
        MVII    #$0678, R1                      ; 6876   02B9 0078 0006
        B       L_687F                          ; 6879   0200 0004

L_687B:
        SDBD                                    ; 687B   0001
        MVII    #$0630, R1                      ; 687C   02B9 0030 0006
L_687F:
        MVO     R1,     G_031A                  ; 687F   0241 031A
        XORI    #$0001, R0                      ; 6881   03F8 0001
        MVO     R0,     G_0136                  ; 6883   0240 0136
        CLRR    R0                              ; 6885   01C0
        MVO     R0,     G_0134                  ; 6886   0240 0134
        MVII    #$000C, R0                      ; 6888   02B8 000C
        MVO     R0,     G_0125                  ; 688A   0240 0125
        MVII    #$0001, R0                      ; 688C   02B8 0001
        MVO     R0,     G_0134                  ; 688E   0240 0134
        MVI     G_011E, R0                      ; 6890   0280 011E
        DECR    R0                              ; 6892   0010
        ANDI    #$0006, R0                      ; 6893   03B8 0006
        MVO     R0,     G_011E                  ; 6895   0240 011E
        TSTR    R0                              ; 6897   0080
        BEQ     L_68C6                          ; 6898   0204 002C

        MVII    #$0137, R4                      ; 689A   02BC 0137
        SDBD                                    ; 689C   0001
        MVII    #$681A, R5                      ; 689D   02BD 001A 0068
L_68A0:
        TSTR    R0                              ; 68A0   0080
        BEQ     L_68AC                          ; 68A1   0204 0009

        MVI@    R5,     R1                      ; 68A3   02A9
        MVO@    R1,     R4                      ; 68A4   0261
        CLRR    R1                              ; 68A5   01C9
        MVO@    R1,     R4                      ; 68A6   0261
        MVI@    R5,     R1                      ; 68A7   02A9
        MVO@    R1,     R4                      ; 68A8   0261
        DECR    R0                              ; 68A9   0010
        B       L_68A0                          ; 68AA   0220 000B

L_68AC:
        MVI     G_011E, R0                      ; 68AC   0280 011E
        MVII    #$0126, R4                      ; 68AE   02BC 0126
        SDBD                                    ; 68B0   0001
        MVII    #$6826, R5                      ; 68B1   02BD 0026 0068
L_68B4:
        TSTR    R0                              ; 68B4   0080
        BEQ     L_68BC                          ; 68B5   0204 0005

        MVI@    R5,     R1                      ; 68B7   02A9
        MVO@    R1,     R4                      ; 68B8   0261
        DECR    R0                              ; 68B9   0010
        B       L_68B4                          ; 68BA   0220 0007

L_68BC:
        MVI     G_011E, R0                      ; 68BC   0280 011E
        MVII    #$031B, R3                      ; 68BE   02BB 031B
        MOVR    R7,     R4                      ; 68C0   00BC
        ADDI    #$000C, R4                      ; 68C1   02FC 000C

        JSR     R5,     L_536B                  ; 68C3   0004 0150 036B

L_68C6:
        PULR    R7                              ; 68C6   02B7

        DECLE   $0044,  $0006,  $00D8,  $0000   ; 68C7   0044 0006 00D8 0000
        DECLE   $00A2,  $0019,  $0038,  $0006   ; 68CB   00A2 0019 0038 0006
        DECLE   $00D0,  $0000,  $00B1,  $0019   ; 68CF   00D0 0000 00B1 0019
        DECLE   $0070,  $0006,  $00D0,  $0000   ; 68D3   0070 0006 00D0 0000
        DECLE   $00C6,  $0009,  $0040,  $0006   ; 68D7   00C6 0009 0040 0006
        DECLE   $00C8,  $0000,  $00D7,  $0009   ; 68DB   00C8 0000 00D7 0009
        DECLE   $0068,  $0006,  $00C8,  $0000   ; 68DF   0068 0006 00C8 0000
        DECLE   $00E1,  $0009,  $0048,  $0006   ; 68E3   00E1 0009 0048 0006
        DECLE   $00C0,  $0000,  $00F7,  $0019   ; 68E7   00C0 0000 00F7 0019
        DECLE   $0060,  $0006,  $00C0,  $0000   ; 68EB   0060 0006 00C0 0000

        ADDR    R6,     R2                      ; 68EF   00F2
        COMR    R1                              ; 68F0   0019
L_68F1:
        PSHR    R5                              ; 68F1   0275
        MVI     G_012D, R0                      ; 68F2   0280 012D
        ANDI    #$0003, R0                      ; 68F4   03B8 0003
        BNEQ    L_6928                          ; 68F6   020C 0030

        MVI     G_0152, R0                      ; 68F8   0280 0152
        TSTR    R0                              ; 68FA   0080
        BNEQ    L_6901                          ; 68FB   020C 0004

        MVII    #$000B, R1                      ; 68FD   02B9 000B
        MVO     R1,     G_011C                  ; 68FF   0241 011C
L_6901:
        DECR    R0                              ; 6901   0010
        MVO     R0,     G_0152                  ; 6902   0240 0152
        MVI     G_011F, R1                      ; 6904   0281 011F
        TSTR    R1                              ; 6906   0089
        BEQ     L_6928                          ; 6907   0204 001F

        ADDI    #$0001, R1                      ; 6909   02F9 0001
        CMPI    #$000A, R1                      ; 690B   0379 000A
        BGT     L_6911                          ; 690D   020E 0002

        MVO     R1,     G_011F                  ; 690F   0241 011F
L_6911:
        MVI     G_011E, R0                      ; 6911   0280 011E
        INCR    R0                              ; 6913   0008
        MVII    #$0134, R4                      ; 6914   02BC 0134
L_6916:
        TSTR    R0                              ; 6916   0080
        BEQ     L_6928                          ; 6917   0204 000F

        DECR    R0                              ; 6919   0010
        MVI@    R4,     R2                      ; 691A   02A2
        DECR    R4                              ; 691B   0014
        ADDR    R1,     R2                      ; 691C   00CA
        CMPI    #$0096, R2                      ; 691D   037A 0096
        BLE     L_6923                          ; 691F   0206 0002

        MVII    #$0096, R2                      ; 6921   02BA 0096
L_6923:
        MVO@    R2,     R4                      ; 6923   0262
        INCR    R4                              ; 6924   000C
        INCR    R4                              ; 6925   000C
        B       L_6916                          ; 6926   0220 0011
L_6928:
        PULR    R7                              ; 6928   02B7

L_6929:
        PSHR    R5                              ; 6929   0275
        SDBD                                    ; 692A   0001
        MVII    #$3200, R3                      ; 692B   02BB 0000 0032
        MVII    #$0229, R4                      ; 692E   02BC 0229

        JSR     R5,     X_PRINT_R5              ; 6930   0004 0118 007B
        STRING  "PASSING BONUS"                 ; 6933  
        DECLE   $0000                           ; 6940   0000

        MVII    #$0248, R4                      ; 6941   02BC 0248

        JSR     R5,     X_PRINT_R5              ; 6943   0004 0118 007B
        STRING  "50 X"                          ; 6946   0035 0030 0020 0058
        DECLE   $0000                           ; 694A   0000

        MVI     G_0153, R0                      ; 694B   0280 0153
        MVII    #$0003, R1                      ; 694D   02B9 0003
        MVII    #$024C, R4                      ; 694F   02BC 024C

        JSR     R5,     X_PRNUM_RGT             ; 6951   0004 0118 00C5

        MVI     G_0153, R0                      ; 6954   0280 0153
        DECR    R0                              ; 6956   0010
        BMI     L_6966                          ; 6957   020B 000D

        MVO     R0,     G_0153                  ; 6959   0240 0153
        MVI     G_0343, R0                      ; 695B   0280 0343
        ADDI    #$000A, R0                      ; 695D   02F8 000A
        MVO     R0,     G_0343                  ; 695F   0240 0343

        JSR     R5,     L_66EB                  ; 6961   0004 0164 02EB

        B       L_6A06                          ; 6964   0200 00A0

L_6966:
        MVII    #$000D, R0                      ; 6966   02B8 000D
        MVO     R0,     G_011C                  ; 6968   0240 011C
        MVII    #$0229, R4                      ; 696A   02BC 0229

        JSR     R5,     X_PRINT_R5              ; 696C   0004 0118 007B
        STRING  "             "                 ; 696F  
        DECLE   $0000                           ; 697C   0000

        MVII    #$0248, R4                      ; 697D   02BC 0248

        JSR     R5,     X_PRINT_R5              ; 697F   0004 0118 007B
        STRING  "       "                       ; 6982  
        DECLE   $0000                           ; 6989   0000

        PULR    R7                              ; 698A   02B7

L_698B:
        PSHR    R5                              ; 698B   0275
        MVI     G_012B, R0                      ; 698C   0280 012B
        CMPI    #$0003, R0                      ; 698E   0378 0003
        BNEQ    L_6996                          ; 6990   020C 0004

        MVII    #$0001, R0                      ; 6992   02B8 0001
        MVO     R0,     G_0154                  ; 6994   0240 0154
L_6996:
        PULR    R7                              ; 6996   02B7

        DECLE   $0041,  $0028,  $0043,  $0014   ; 6997   0041 0028 0043 0014
        DECLE   $0045,  $000E,  $0047,  $000A   ; 699B   0045 000E 0047 000A
        DECLE   $004B,  $0008,  $00FF,  $0000   ; 699F   004B 0008 00FF 0000
L_69A3:
        PSHR    R5                              ; 69A3   0275
        SDBD                                    ; 69A4   0001
        MVII    #$6997, R5                      ; 69A5   02BD 0097 0069
        CLRR    R2                              ; 69A8   01D2
L_69A9:
        INCR    R2                              ; 69A9   000A
        MVI@    R5,     R1                      ; 69AA   02A9
        MVI     G_0345, R0                      ; 69AB   0280 0345
        SLR     R0,     2                       ; 69AD   0064
        SLR     R0,     2                       ; 69AE   0064
        CMPR    R0,     R1                      ; 69AF   0141
        BGE     L_69B5                          ; 69B0   020D 0003

        INCR    R5                              ; 69B2   000D
        B       L_69A9                          ; 69B3   0220 000B

L_69B5:
        MVI@    R5,     R0                      ; 69B5   02A8
        MVO     R0,     G_0153                  ; 69B6   0240 0153
        MVO     R2,     G_011E                  ; 69B8   0242 011E
        TSTR    R0                              ; 69BA   0080
        BEQ     L_69DC                          ; 69BB   0204 001F

        SDBD                                    ; 69BD   0001
        MVII    #$3200, R3                      ; 69BE   02BB 0000 0032
        MVII    #$0241, R4                      ; 69C1   02BC 0241

        JSR     R5,     X_PRINT_R5              ; 69C3   0004 0118 007B
        STRING  "BONUS "                        ; 69C6  
        DECLE   $0000                           ; 69CC   0000

        SLL     R0,     2                       ; 69CD   004C
        PSHR    R0                              ; 69CE   0270
        SLL     R0,     2                       ; 69CF   004C
        SLL     R0,     1                       ; 69D0   0048
        PSHR    R0                              ; 69D1   0270
        SLL     R0,     1                       ; 69D2   0048
        ADD@    R6,     R0                      ; 69D3   02F0
        ADD@    R6,     R0                      ; 69D4   02F0
        MVII    #$0004, R1                      ; 69D5   02B9 0004
        MVII    #$0247, R4                      ; 69D7   02BC 0247

        JSR     R5,     X_PRNUM_RGT             ; 69D9   0004 0118 00C5

L_69DC:
        MVII    #$0006, R0                      ; 69DC   02B8 0006
        MVO     R0,     G_011C                  ; 69DE   0240 011C
        PULR    R7                              ; 69E0   02B7

L_69E1:
        PSHR    R5                              ; 69E1   0275
        MVI     G_0153, R0                      ; 69E2   0280 0153
        TSTR    R0                              ; 69E4   0080
        BEQ     L_6A0C                          ; 69E5   0204 0025

        DECR    R0                              ; 69E7   0010
        MVO     R0,     G_0153                  ; 69E8   0240 0153
        SLL     R0,     2                       ; 69EA   004C
        PSHR    R0                              ; 69EB   0270
        SLL     R0,     2                       ; 69EC   004C
        SLL     R0,     1                       ; 69ED   0048
        PSHR    R0                              ; 69EE   0270
        SLL     R0,     1                       ; 69EF   0048
        ADD@    R6,     R0                      ; 69F0   02F0
        ADD@    R6,     R0                      ; 69F1   02F0
        MVII    #$0004, R1                      ; 69F2   02B9 0004
        SDBD                                    ; 69F4   0001
        MVII    #$3200, R3                      ; 69F5   02BB 0000 0032
        MVII    #$0247, R4                      ; 69F8   02BC 0247

        JSR     R5,     X_PRNUM_RGT             ; 69FA   0004 0118 00C5

        MVI     G_0343, R0                      ; 69FD   0280 0343
        ADDI    #$0014, R0                      ; 69FF   02F8 0014
        MVO     R0,     G_0343                  ; 6A01   0240 0343

        JSR     R5,     L_66EB                  ; 6A03   0004 0164 02EB

L_6A06:
        MVII    #$0015, R4                      ; 6A06   02BC 0015

        JSR     R5,     L_6DB4                  ; 6A08   0004 016C 01B4

        PULR    R7                              ; 6A0B   02B7

L_6A0C:
        MVII    #$0007, R0                      ; 6A0C   02B8 0007
        MVO     R0,     G_011C                  ; 6A0E   0240 011C
        SDBD                                    ; 6A10   0001
        MVII    #$3200, R3                      ; 6A11   02BB 0000 0032
        MVII    #$0241, R4                      ; 6A14   02BC 0241

        JSR     R5,     X_PRINT_R5              ; 6A16   0004 0118 007B
        STRING  "           "                   ; 6A19  
        DECLE   $0000                           ; 6A24   0000

        PULR    R7                              ; 6A25   02B7

        DECLE   $0042,  $006A,  $0056,  $006A   ; 6A26   0042 006A 0056 006A
        DECLE   $00BA,  $006A,  $0056,  $006A   ; 6A2A   00BA 006A 0056 006A
        DECLE   $00BA,  $006A,  $0056,  $006A   ; 6A2E   00BA 006A 0056 006A
        DECLE   $00BA,  $006A,  $0056,  $006A   ; 6A32   00BA 006A 0056 006A
        DECLE   $00BA,  $006A,  $0056,  $006A   ; 6A36   00BA 006A 0056 006A
        DECLE   $00BA,  $006A,  $0074,  $006A   ; 6A3A   00BA 006A 0074 006A
        DECLE   $009A,  $006A,  $00BC,  $006A   ; 6A3E   009A 006A 00BC 006A
        DECLE   $021C,  $0007,  $0049,  $004E   ; 6A42   021C 0007 0049 004E
        DECLE   $0054,  $0056,  $0000           ; 6A46   0054 0056 0000
L_6A49:
        BGT     L_6A49                          ; 6A49   022E 0001

        DECLE   $0050,  $0052,  $0045,  $0053   ; 6A4B   0050 0052 0045 0053
        DECLE   $0045,  $004E,  $0054,  $0053   ; 6A4F   0045 004E 0054 0053
        DECLE   $0000,  $03FF,  $003C,  $021B   ; 6A53   0000 03FF 003C 021B
        DECLE   $0002,  $0050,  $0020,  $004F   ; 6A57   0002 0050 0020 004F
        DECLE   $0020,  $004C,  $0020,  $0045   ; 6A5B   0020 004C 0020 0045
        DECLE   $0000,  $023F,  $0002,  $0050   ; 6A5F   0000 023F 0002 0050
        DECLE   $0020,  $004F,  $0020,  $0053   ; 6A63   0020 004F 0020 0053
        DECLE   $0020,  $0049,  $0020,  $0054   ; 6A67   0020 0049 0020 0054
        DECLE   $0020,  $0049,  $0020,  $004F   ; 6A6B   0020 0049 0020 004F
        DECLE   $0020,  $004E,  $0000,  $03FF   ; 6A6F   0020 004E 0000 03FF
        DECLE   $000E,  $0217,  $0007,  $0043   ; 6A73   000E 0217 0007 0043
        DECLE   $004F,  $0050,  $0059,  $0052   ; 6A77   004F 0050 0059 0052
        DECLE   $0049,  $0047,  $0048,  $0054   ; 6A7B   0049 0047 0048 0054
        DECLE   $0020,  $0031,  $0039,  $0038   ; 6A7F   0020 0031 0039 0038
        DECLE   $0037,  $0000,  $022A,  $0007   ; 6A83   0037 0000 022A 0007
        DECLE   $0049,  $004E,  $0054,  $0056   ; 6A87   0049 004E 0054 0056
        DECLE   $0020,  $0043,  $004F,  $0052   ; 6A8B   0020 0043 004F 0052
        DECLE   $0050,  $004F,  $0052,  $0041   ; 6A8F   0050 004F 0052 0041
        DECLE   $0054,  $0049,  $004F,  $004E   ; 6A93   0054 0049 004F 004E
        DECLE   $0000,  $03FF,  $0032,  $0219   ; 6A97   0000 03FF 0032 0219
        DECLE   $0003,  $004C,  $0049,  $0043   ; 6A9B   0003 004C 0049 0043
        DECLE   $0045,  $004E,  $0053,  $0045   ; 6A9F   0045 004E 0053 0045
        DECLE   $0044,  $0020,  $0042,  $0059   ; 6AA3   0044 0020 0042 0059
        DECLE   $0000,  $022C,  $0003,  $004E   ; 6AA7   0000 022C 0003 004E
        DECLE   $0041,  $004D,  $0043,  $004F   ; 6AAB   0041 004D 0043 004F
        DECLE   $0020,  $0041,  $004D,  $0045   ; 6AAF   0020 0041 004D 0045
        DECLE   $0052,  $0049,  $0043,  $0041   ; 6AB3   0052 0049 0043 0041
        DECLE   $0000,  $03FF,  $0023,  $03FF   ; 6AB7   0000 03FF 0023 03FF
        DECLE   $0006,  $03FF                   ; 6ABB   0006 03FF

        SLR     R0,     2                       ; 6ABD   0064
L_6ABE:
        PSHR    R5                              ; 6ABE   0275
        MVI     G_0159, R0                      ; 6ABF   0280 0159
        DECR    R0                              ; 6AC1   0010
        MVO     R0,     G_0159                  ; 6AC2   0240 0159
        BPL     L_6AF7                          ; 6AC4   0203 0031

        MVII    #$0200, R4                      ; 6AC6   02BC 0200
        MVII    #$0050, R0                      ; 6AC8   02B8 0050
        SDBD                                    ; 6ACA   0001
        MVII    #$3200, R1                      ; 6ACB   02B9 0000 0032

        JSR     R5,     X_FILL_MEM              ; 6ACE   0004 0114 0341

        MVI     G_0158, R4                      ; 6AD1   0284 0158
        ADDR    R4,     R4                      ; 6AD3   00E4
        SDBD                                    ; 6AD4   0001
        ADDI    #$6A26, R4                      ; 6AD5   02FC 0026 006A
        SDBD                                    ; 6AD8   0001
        MVI@    R4,     R5                      ; 6AD9   02A5
L_6ADA:
        MVI@    R5,     R4                      ; 6ADA   02AC
        CMPI    #$03FF, R4                      ; 6ADB   037C 03FF
        BEQ     L_6AEA                          ; 6ADD   0204 000B

        MVI@    R5,     R3                      ; 6ADF   02AB
        SDBD                                    ; 6AE0   0001
        XORI    #$3200, R3                      ; 6AE1   03FB 0000 0032
        MOVR    R5,     R1                      ; 6AE4   00A9

        JSR     R5,     X_PRINT_R1              ; 6AE5   0004 0118 0067

        B       L_6ADA                          ; 6AE8   0220 000F

L_6AEA:
        MVI@    R5,     R0                      ; 6AEA   02A8
        MVO     R0,     G_0159                  ; 6AEB   0240 0159
        MVI     G_0158, R0                      ; 6AED   0280 0158
        INCR    R0                              ; 6AEF   0008
        CMPI    #$000E, R0                      ; 6AF0   0378 000E
        BLT     L_6AF5                          ; 6AF2   0205 0001

        CLRR    R0                              ; 6AF4   01C0
L_6AF5:
        MVO     R0,     G_0158                  ; 6AF5   0240 0158
L_6AF7:
        PULR    R7                              ; 6AF7   02B7

L_6AF8:
        PSHR    R5                              ; 6AF8   0275
        MVI     G_015A, R0                      ; 6AF9   0280 015A
        DECR    R0                              ; 6AFB   0010
        BMI     L_6B50                          ; 6AFC   020B 0052

        CLRR    R3                              ; 6AFE   01DB
        CMPI    #$00E8, R0                      ; 6AFF   0378 00E8
        BNEQ    L_6B1C                          ; 6B01   020C 0019

        SDBD                                    ; 6B03   0001
        MVII    #$6C5E, R4                      ; 6B04   02BC 005E 006C
L_6B07:
        SDBD                                    ; 6B07   0001
        MVI@    R4,     R1                      ; 6B08   02A1
        MVO@    R1,     R3                      ; 6B09   0259
        ADDI    #$0008, R3                      ; 6B0A   02FB 0008
        SDBD                                    ; 6B0C   0001
        MVI@    R4,     R1                      ; 6B0D   02A1
        MVO@    R1,     R3                      ; 6B0E   0259
        ADDI    #$0008, R3                      ; 6B0F   02FB 0008
        SDBD                                    ; 6B11   0001
        MVI@    R4,     R1                      ; 6B12   02A1
        MVO@    R1,     R3                      ; 6B13   0259
        SUBI    #$000F, R3                      ; 6B14   033B 000F
        CMPI    #$0006, R3                      ; 6B16   037B 0006
        BNEQ    L_6B07                          ; 6B18   022C 0012
        B       L_6B24                          ; 6B1A   0200 0008

L_6B1C:
        MVI@    R3,     R1                      ; 6B1C   0299
        DECR    R1                              ; 6B1D   0011
        MVO@    R1,     R3                      ; 6B1E   0259
        INCR    R3                              ; 6B1F   000B
        CMPI    #$0006, R3                      ; 6B20   037B 0006
        BNEQ    L_6B1C                          ; 6B22   022C 0007

L_6B24:
        MVO     R7,     .STIC.VIDEN             ; 6B24   0247 0020
        MVO     R0,     G_015A                  ; 6B26   0240 015A
        ANDI    #$0007, R0                      ; 6B28   03B8 0007
        BEQ     L_6B52                          ; 6B2A   0204 0026

        MVII    #$0005, R5                      ; 6B2C   02BD 0005
L_6B2E:
        SDBD                                    ; 6B2E   0001
        MVII    #$39B0, R1                      ; 6B2F   02B9 00B0 0039
        SDBD                                    ; 6B32   0001
        MVII    #$39B8, R2                      ; 6B33   02BA 00B8 0039
        ADDR    R5,     R1                      ; 6B36   00E9
        ADDR    R5,     R2                      ; 6B37   00EA
        MVII    #$0005, R4                      ; 6B38   02BC 0005
        CLRR    R3                              ; 6B3A   01DB
L_6B3B:
        MVI@    R1,     R0                      ; 6B3B   0288
        SWAP    R0,     1                       ; 6B3C   0040
        XOR@    R2,     R0                      ; 6B3D   03D0
        RSWD    R3                              ; 6B3E   003B
        RLC     R0,     1                       ; 6B3F   0050
        GSWD    R3                              ; 6B40   0033
        MVO@    R0,     R2                      ; 6B41   0250
        SWAP    R0,     1                       ; 6B42   0040
        MVO@    R0,     R1                      ; 6B43   0248
        SUBI    #$0010, R1                      ; 6B44   0339 0010
        SUBI    #$0010, R2                      ; 6B46   033A 0010
        DECR    R4                              ; 6B48   0014
        BNEQ    L_6B3B                          ; 6B49   022C 000F

        DECR    R5                              ; 6B4B   0015
        BNEQ    L_6B2E                          ; 6B4C   022C 001F

        SETC                                    ; 6B4E   0007
        INCR    R7                              ; 6B4F   000F

L_6B50:
        CLRC                                    ; 6B50   0006
L_6B51:
        PULR    R7                              ; 6B51   02B7

L_6B52:
        MVII    #$0005, R0                      ; 6B52   02B8 0005
        SDBD                                    ; 6B54   0001
        MVII    #$3970, R1                      ; 6B55   02B9 0070 0039
        SDBD                                    ; 6B58   0001
        MVII    #$6BAE, R4                      ; 6B59   02BC 00AE 006B

        JSR     R5,     L_5353                  ; 6B5C   0004 0150 0353

        MVII    #$0003, R0                      ; 6B5F   02B8 0003
        SDBD                                    ; 6B61   0001
        MVII    #$39A0, R1                      ; 6B62   02B9 00A0 0039
        MVI     G_011C, R2                      ; 6B65   0282 011C
        CMPI    #$0002, R2                      ; 6B67   037A 0002
        BLE     L_6B6F                          ; 6B69   0206 0004

        SDBD                                    ; 6B6B   0001
        MVII    #$6C3E, R4                      ; 6B6C   02BC 003E 006C

L_6B6F:
        JSR     R5,     L_5353                  ; 6B6F   0004 0150 0353

        MVII    #$0007, R0                      ; 6B72   02B8 0007
        SDBD                                    ; 6B74   0001
        MVII    #$39C0, R1                      ; 6B75   02B9 00C0 0039
        SDBD                                    ; 6B78   0001
        MVII    #$6BFE, R4                      ; 6B79   02BC 00FE 006B

        JSR     R5,     L_5353                  ; 6B7C   0004 0150 0353

        MVI     G_015A, R2                      ; 6B7F   0282 015A
        SLR     R2,     2                       ; 6B81   0066
        SLR     R2,     1                       ; 6B82   0062
        MVII    #$002E, R0                      ; 6B83   02B8 002E
        MVII    #$001E, R1                      ; 6B85   02B9 001E
        SUBR    R2,     R1                      ; 6B87   0111
        CMPI    #$000A, R1                      ; 6B88   0379 000A
        BLE     L_6B8E                          ; 6B8A   0206 0002

        MVII    #$000A, R1                      ; 6B8C   02B9 000A
L_6B8E:
        SUBI    #$000A, R2                      ; 6B8E   033A 000A
        BPL     L_6B95                          ; 6B90   0203 0003

        SUBR    R2,     R0                      ; 6B92   0110
        ADDR    R2,     R1                      ; 6B93   00D1
        CLRR    R2                              ; 6B94   01D2
L_6B95:
        ADDI    #$0228, R2                      ; 6B95   02FA 0228
        MOVR    R2,     R5                      ; 6B97   0095
        SLL     R0,     2                       ; 6B98   004C
        SLL     R0,     1                       ; 6B99   0048
        SDBD                                    ; 6B9A   0001
        ADDI    #$2E00, R0                      ; 6B9B   02F8 0000 002E
        TSTR    R1                              ; 6B9E   0089
        BEQ     L_6BA7                          ; 6B9F   0204 0006

L_6BA1:
        MVO@    R0,     R5                      ; 6BA1   0268
        ADDI    #$0008, R0                      ; 6BA2   02F8 0008
        DECR    R1                              ; 6BA4   0011
        BNEQ    L_6BA1                          ; 6BA5   022C 0005

L_6BA7:
        SDBD                                    ; 6BA7   0001
        MVII    #$3200, R0                      ; 6BA8   02B8 0000 0032
        MVO@    R0,     R5                      ; 6BAB   0268
        SETC                                    ; 6BAC   0007
        PULR    R7                              ; 6BAD   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BAE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BB2   0000 0000 0000 0000
        DECLE   $0000,  $00EE,  $00AA,  $00EC   ; 6BB6   0000 00EE 00AA 00EC
        DECLE   $008A,  $008A,  $0000,  $0000   ; 6BBA   008A 008A 0000 0000
        DECLE   $0000,  $00EE,  $008A,  $00CE   ; 6BBE   0000 00EE 008A 00CE
        DECLE   $0088,  $00E8,  $0000,  $0000   ; 6BC2   0088 00E8 0000 0000
        DECLE   $0000,  $00EE,  $00AA,  $00EC   ; 6BC6   0000 00EE 00AA 00EC
        DECLE   $00AA,  $00AA,  $0000,  $0000   ; 6BCA   00AA 00AA 0000 0000
        DECLE   $0000,  $00E0,  $0080,  $00C0   ; 6BCE   0000 00E0 0080 00C0
        DECLE   $0080,  $00E0,  $0000,  $0000   ; 6BD2   0080 00E0 0000 0000
        DECLE   $0000,  $00EE,  $004A,  $004A   ; 6BD6   0000 00EE 004A 004A
        DECLE   $004A,  $004E,  $0000,  $0000   ; 6BDA   004A 004E 0000 0000
        DECLE   $0000,  $001C,  $0014,  $0014   ; 6BDE   0000 001C 0014 0014
        DECLE   $0014,  $001A,  $0000,  $0000   ; 6BE2   0014 001A 0000 0000
        DECLE   $0000,  $00AE,  $00AA,  $00AE   ; 6BE6   0000 00AE 00AA 00AE
        DECLE   $00AA,  $00EA,  $0000,  $0000   ; 6BEA   00AA 00EA 0000 0000
        DECLE   $0000,  $008E,  $0084,  $0084   ; 6BEE   0000 008E 0084 0084
        DECLE   $0084,  $00EE,  $0000,  $0000   ; 6BF2   0084 00EE 0000 0000
        DECLE   $0000,  $00EA,  $008A,  $00CE   ; 6BF6   0000 00EA 008A 00CE
        DECLE   $0084,  $0084,  $0000,  $0000   ; 6BFA   0084 0084 0000 0000

        DIS                                     ; 6BFE   0003
        INCR    R7                              ; 6BFF   000F

        DECLE   $003F                           ; 6C00   003F
L_6C01:
        SARC    R3,     2                       ; 6C01   007F
        DECLE   $007A,  $00FA,  $00FA,  $00FA   ; 6C02   007A 00FA 00FA 00FA
        DECLE   $00FA,  $00FA,  $007F,  $003F   ; 6C06   00FA 00FA 007F 003F
        DECLE   $000F,  $0003,  $0000,  $0000   ; 6C0A   000F 0003 0000 0000
        DECLE   $00FE,  $00FF,  $00FF,  $00FF   ; 6C0E   00FE 00FF 00FF 00FF
        DECLE   $00D1,  $00DB,  $005B,  $001B   ; 6C12   00D1 00DB 005B 001B
        DECLE   $009B,  $00DB,  $00FF,  $00FF   ; 6C16   009B 00DB 00FF 00FF
        DECLE   $00FF,  $00FF,  $00CE,  $003C   ; 6C1A   00FF 00FF 00CE 003C
        DECLE   $0000,  $00C0,  $00F6,  $00FE   ; 6C1E   0000 00C0 00F6 00FE
        DECLE   $005E,  $005F,  $005F,  $005F   ; 6C22   005E 005F 005F 005F
        DECLE   $001F,  $00BE,  $00FE,  $00F6   ; 6C26   001F 00BE 00FE 00F6
        DECLE   $00E0,  $0080,  $0000,  $0000   ; 6C2A   00E0 0080 0000 0000
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 6C2E   007F 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $007F   ; 6C32   00FF 00FF 00FF 007F
        DECLE   $00FF,  $00FE,  $00FC,  $00F8   ; 6C36   00FF 00FE 00FC 00F8
        DECLE   $00F8,  $00FC,  $00FE,  $00FF   ; 6C3A   00F8 00FC 00FE 00FF
        DECLE   $0000,  $000E,  $0009,  $000E   ; 6C3E   0000 000E 0009 000E
        DECLE   $0009,  $0009,  $0000,  $0000   ; 6C42   0009 0009 0000 0000
        DECLE   $0000,  $0031,  $004A,  $007A   ; 6C46   0000 0031 004A 007A
        DECLE   $004A,  $0049,  $0000,  $0000   ; 6C4A   004A 0049 0000 0000
        DECLE   $0000,  $009E,  $0050,  $001C   ; 6C4E   0000 009E 0050 001C
        DECLE   $0050,  $009E,  $0000,  $0000   ; 6C52   0050 009E 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C56   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C5A   0000 0000 0000 0000
        DECLE   $0087,  $0002,  $0098,  $0000   ; 6C5E   0087 0002 0098 0000

        ADDR    R0,     R0                      ; 6C62   00C0
        COMR    R1                              ; 6C63   0019
        MOVR    R1,     R7                      ; 6C64   008F

        DECLE   $0002,  $0098,  $0000           ; 6C65   0002 0098 0000

        ADDR    R2,     R0                      ; 6C68   00D0
        COMR    R1                              ; 6C69   0019
        MOVR    R2,     R7                      ; 6C6A   0097

        DECLE   $0002,  $0098,  $0000,  $00E0   ; 6C6B   0002 0098 0000 00E0
        DECLE   $0019,  $00A0,  $0002,  $0018   ; 6C6F   0019 00A0 0002 0018
        DECLE   $0001,  $00F7,  $0009,  $00F0   ; 6C73   0001 00F7 0009 00F0
        DECLE   $0002,  $0018,  $0001,  $00FF   ; 6C77   0002 0018 0001 00FF
        DECLE   $0009,  $008A,  $0006,  $001A   ; 6C7B   0009 008A 0006 001A
        DECLE   $0000                           ; 6C7F   0000

        ADDR    R6,     R0                      ; 6C80   00F0
        INCR    R1                              ; 6C81   0009
L_6C82:
        PSHR    R5                              ; 6C82   0275
        MVI     G_0122, R0                      ; 6C83   0280 0122
        DECR    R0                              ; 6C85   0010
        MVO     R0,     G_0122                  ; 6C86   0240 0122
        BNEQ    L_6CA0                          ; 6C88   020C 0016

        MVII    #$02A4, R4                      ; 6C8A   02BC 02A4
        SDBD                                    ; 6C8C   0001
        MVII    #$2000, R0                      ; 6C8D   02B8 0000 0020
        MVO@    R0,     R4                      ; 6C90   0260
        MVII    #$0003, R4                      ; 6C91   02BC 0003

        JSR     R5,     L_6DB4                  ; 6C93   0004 016C 01B4

        CLRR    R0                              ; 6C96   01C0
        MVO     R0,     G_0156                  ; 6C97   0240 0156
        SDBD                                    ; 6C99   0001
        MVII    #$0A28, R0                      ; 6C9A   02B8 0028 000A
        MVO     R0,     G_0348                  ; 6C9D   0240 0348
        PULR    R7                              ; 6C9F   02B7

L_6CA0:
        MVII    #$02A4, R4                      ; 6CA0   02BC 02A4
        SDBD                                    ; 6CA2   0001
        MVII    #$0400, R0                      ; 6CA3   02B8 0000 0004
        MVO@    R0,     R4                      ; 6CA6   0260
        MVII    #$0000, R4                      ; 6CA7   02BC 0000

        JSR     R5,     L_6DB4                  ; 6CA9   0004 016C 01B4

        PULR    R7                              ; 6CAC   02B7

L_6CAD:
        PSHR    R5                              ; 6CAD   0275
        SDBD                                    ; 6CAE   0001
        MVII    #$A268, R0                      ; 6CAF   02B8 0068 00A2
        MVII    #$0337, R1                      ; 6CB2   02B9 0337
        MVO@    R0,     R1                      ; 6CB4   0248
        CLRR    R0                              ; 6CB5   01C0
        MVO     R0,     G_0143                  ; 6CB6   0240 0143
        MVO     R0,     G_012A                  ; 6CB8   0240 012A
        MVII    #$0002, R0                      ; 6CBA   02B8 0002
        MVO     R0,     G_0145                  ; 6CBC   0240 0145
        SDBD                                    ; 6CBE   0001
        MVII    #$0620, R0                      ; 6CBF   02B8 0020 0006
        MVO     R0,     G_031F                  ; 6CC2   0240 031F
        MVII    #$01C7, R0                      ; 6CC4   02B8 01C7
        MVO     R0,     G_0327                  ; 6CC6   0240 0327
        SDBD                                    ; 6CC8   0001
        MVII    #$19F0, R0                      ; 6CC9   02B8 00F0 0019
        MVO     R0,     G_032F                  ; 6CCC   0240 032F
        MVII    #$02A4, R4                      ; 6CCE   02BC 02A4
        CLRR    R0                              ; 6CD0   01C0
        MVO@    R0,     R4                      ; 6CD1   0260
        PULR    R7                              ; 6CD2   02B7

L_6CD3:
        PSHR    R5                              ; 6CD3   0275
        MVI     G_0132, R0                      ; 6CD4   0280 0132
        CMPI    #$0032, R0                      ; 6CD6   0378 0032
        BGE     L_6CFB                          ; 6CD8   020D 0021

        MVI     G_012D, R0                      ; 6CDA   0280 012D
        ANDI    #$001F, R0                      ; 6CDC   03B8 001F
        BNEQ    L_6CFE                          ; 6CDE   020C 001E

        MVI     G_0151, R0                      ; 6CE0   0280 0151
        INCR    R0                              ; 6CE2   0008
        MVO     R0,     G_0151                  ; 6CE3   0240 0151
        CMPI    #$000F, R0                      ; 6CE5   0378 000F
        BLT     L_6CFE                          ; 6CE7   0205 0015

        MVII    #$00FF, R2                      ; 6CE9   02BA 00FF
        MVII    #$031A, R3                      ; 6CEB   02BB 031A
        MVII    #$0134, R4                      ; 6CED   02BC 0134
L_6CEF:
        CMP@    R4,     R2                      ; 6CEF   0362
        BEQ     L_6CFF                          ; 6CF0   0204 000D

        INCR    R3                              ; 6CF2   000B
        ADDI    #$0002, R4                      ; 6CF3   02FC 0002
        CMPI    #$0320, R3                      ; 6CF5   037B 0320
        BLT     L_6CEF                          ; 6CF7   0225 0009
        B       L_6CFE                          ; 6CF9   0200 0003

L_6CFB:
        CLRR    R0                              ; 6CFB   01C0
        MVO     R0,     G_0151                  ; 6CFC   0240 0151
L_6CFE:
        PULR    R7                              ; 6CFE   02B7

L_6CFF:
        MVII    #$0078, R1                      ; 6CFF   02B9 0078
        DECR    R4                              ; 6D01   0014
        MVO@    R1,     R4                      ; 6D02   0261
        PSHR    R3                              ; 6D03   0273
        SUBI    #$031A, R3                      ; 6D04   033B 031A
        MVII    #$0332, R2                      ; 6D06   02BA 0332
        ADDR    R3,     R2                      ; 6D08   00DA
        SDBD                                    ; 6D09   0001
        MVII    #$A1FC, R5                      ; 6D0A   02BD 00FC 00A1
        MOVR    R3,     R1                      ; 6D0D   0099
        ADDR    R1,     R1                      ; 6D0E   00C9
        ADDR    R1,     R5                      ; 6D0F   00CD
        ADDR    R1,     R1                      ; 6D10   00C9
        ADDR    R1,     R5                      ; 6D11   00CD
        MVO@    R5,     R2                      ; 6D12   0255
        PULR    R3                              ; 6D13   02B3
        CLRR    R1                              ; 6D14   01C9
        MVO@    R1,     R4                      ; 6D15   0261
        MVO     R1,     G_0151                  ; 6D16   0241 0151
        MVI     G_012B, R1                      ; 6D18   0281 012B
        ANDI    #$0001, R1                      ; 6D1A   03B9 0001
        MVO@    R1,     R4                      ; 6D1C   0261
        CLRR    R1                              ; 6D1D   01C9
        MVO@    R1,     R3                      ; 6D1E   0259
        ADDI    #$0008, R3                      ; 6D1F   02FB 0008
        MVII    #$0067, R1                      ; 6D21   02B9 0067
        MVO@    R1,     R3                      ; 6D23   0259
        MOVR    R3,     R1                      ; 6D24   0099
        SUBI    #$0322, R1                      ; 6D25   0339 0322
        ADDR    R1,     R1                      ; 6D27   00C9
        ADDI    #$0034, R1                      ; 6D28   02F9 0034
        SLL     R1,     2                       ; 6D2A   004D
        SLL     R1,     1                       ; 6D2B   0049
        MVI     G_012B, R0                      ; 6D2C   0280 012B
        ANDI    #$0007, R0                      ; 6D2E   03B8 0007
        SLL     R0,     1                       ; 6D30   0048
        SDBD                                    ; 6D31   0001
        MVII    #$5C1E, R4                      ; 6D32   02BC 001E 005C
        ADDR    R0,     R4                      ; 6D35   00C4
        SDBD                                    ; 6D36   0001
        XOR@    R4,     R1                      ; 6D37   03E1
        ADDI    #$0008, R3                      ; 6D38   02FB 0008
        MVO@    R1,     R3                      ; 6D3A   0259
        PULR    R7                              ; 6D3B   02B7

L_6D3C:
        PSHR    R5                              ; 6D3C   0275
        PSHR    R1                              ; 6D3D   0271
        MVII    #$0008, R5                      ; 6D3E   02BD 0008
        CLRR    R0                              ; 6D40   01C0
L_6D41:
        SLR     R0,     2                       ; 6D41   0064
        MVI@    R4,     R1                      ; 6D42   02A1
        ANDI    #$0300, R1                      ; 6D43   03B9 0300
        SLR     R1,     2                       ; 6D45   0065
        SWAP    R1,     1                       ; 6D46   0041
        XORR    R1,     R0                      ; 6D47   01C8
        DECR    R5                              ; 6D48   0015
        BNEQ    L_6D41                          ; 6D49   022C 0009

        PULR    R1                              ; 6D4B   02B1
        PULR    R7                              ; 6D4C   02B7

L_6D4D:
        PSHR    R5                              ; 6D4D   0275
        PSHR    R1                              ; 6D4E   0271
        MVII    #$0005, R5                      ; 6D4F   02BD 0005
        CLRR    R0                              ; 6D51   01C0
L_6D52:
        SLR     R0,     2                       ; 6D52   0064
        MVI@    R4,     R1                      ; 6D53   02A1
        ANDI    #$0300, R1                      ; 6D54   03B9 0300
        XORR    R1,     R0                      ; 6D56   01C8
        DECR    R5                              ; 6D57   0015
        BNEQ    L_6D52                          ; 6D58   022C 0007

        PULR    R1                              ; 6D5A   02B1
        PULR    R7                              ; 6D5B   02B7

        DECLE   $0000,  $00DB,  $0091,  $0000   ; 6D5C   0000 00DB 0091 0000
        DECLE   $0094,  $0091,  $0006,  $0042   ; 6D60   0094 0091 0006 0042
        DECLE   $0090,  $0018,  $0022,  $0092   ; 6D64   0090 0018 0022 0092
        DECLE   $000C,  $009D,  $0090,  $0014   ; 6D68   000C 009D 0090 0014
        DECLE   $0083,  $0092,  $001E,  $0016   ; 6D6C   0083 0092 001E 0016
        DECLE   $0091,  $0028,  $0000           ; 6D70   0091 0028 0000

        MOVR    R2,     R0                      ; 6D73   0090
        GSWD    R2                              ; 6D74   0032
        DECR    R2                              ; 6D75   0012
        MOVR    R2,     R3                      ; 6D76   0093
        GSWD    R2                              ; 6D77   0032
        SARC    R1,     1                       ; 6D78   0079
        MOVR    R2,     R5                      ; 6D79   0095
        GSWD    R2                              ; 6D7A   0032
        SARC    R0,     1                       ; 6D7B   0078
        MOVR    R2,     R6                      ; 6D7C   0096
        XORR    R6,     R0                      ; 6D7D   01F0
        XORR    R6,     R1                      ; 6D7E   01F1
        XORR    R6,     R2                      ; 6D7F   01F2
        CMPR    R5,     R1                      ; 6D80   0169
        CMPR    R5,     R3                      ; 6D81   016B
        CMPR    R5,     R5                      ; 6D82   016D
        CMPR    R4,     R1                      ; 6D83   0161
        CMPR    R4,     R2                      ; 6D84   0162
        XORR    R6,     R3                      ; 6D85   01F3
        XORR    R7,     R2                      ; 6D86   01FA
        CMPR    R4,     R3                      ; 6D87   0163
        CMPR    R4,     R4                      ; 6D88   0164
        CMPR    R4,     R5                      ; 6D89   0165
        CMPR    R4,     R6                      ; 6D8A   0166
        CMPR    R4,     R7                      ; 6D8B   0167
        CMPR    R5,     R0                      ; 6D8C   0168
        XORR    R7,     R0                      ; 6D8D   01F8
        XORR    R7,     R0                      ; 6D8E   01F8
        CMPR    R3,     R5                      ; 6D8F   015D
        CMPR    R3,     R6                      ; 6D90   015E
        CMPR    R3,     R7                      ; 6D91   015F
        CMPR    R4,     R0                      ; 6D92   0160
        CMPR    R3,     R3                      ; 6D93   015B
        SLLC    R1,     2                       ; 6D94   005D
        INCR    R5                              ; 6D95   000D
        MOVR    R3,     R4                      ; 6D96   009C
        INCR    R4                              ; 6D97   000C
        ADDR    R4,     R7                      ; 6D98   00E7

        INCR    R3                              ; 6D99   000B
        RSWD    R4                              ; 6D9A   003C
        INCR    R3                              ; 6D9B   000B
        TSTR    R3                              ; 6D9C   009B
        INCR    R2                              ; 6D9D   000A
        EIS                                     ; 6D9E   0002
        INCR    R2                              ; 6D9F   000A
        RRC     R3,     1                       ; 6DA0   0073
        INCR    R1                              ; 6DA1   0009
        ADDR    R5,     R3                      ; 6DA2   00EB
        INCR    R0                              ; 6DA3   0008
        SAR     R3,     1                       ; 6DA4   006B
        INCR    R0                              ; 6DA5   0008
        ADDR    R6,     R2                      ; 6DA6   00F2
        SETC                                    ; 6DA7   0007
        TSTR    R0                              ; 6DA8   0080
        SETC                                    ; 6DA9   0007
        DECR    R4                              ; 6DAA   0014
        SETC                                    ; 6DAB   0007
        CLRC                                    ; 6DAC   0006
        INCR    R0                              ; 6DAD   0008
        INCR    R4                              ; 6DAE   000C
        DECR    R2                              ; 6DAF   0012
        COMR    R0                              ; 6DB0   0018
        NEGR    R4                              ; 6DB1   0024
        GSWD    R0                              ; 6DB2   0030
        SLL     R0,     1                       ; 6DB3   0048
L_6DB4:
        PSHR    R5                              ; 6DB4   0275
        SDBD                                    ; 6DB5   0001
        MVII    #$6D5C, R5                      ; 6DB6   02BD 005C 006D
        ADDR    R4,     R5                      ; 6DB9   00E5
        MVI@    R5,     R2                      ; 6DBA   02AA
        CMP     G_015C, R2                      ; 6DBB   0342 015C
        BLT     L_6DEF                          ; 6DBD   0205 0030
        BGT     L_6DC5                          ; 6DBF   020E 0004

        SARC    R2,     1                       ; 6DC1   007A
        RLC     R2,     1                       ; 6DC2   0052
        BC      L_6DEF                          ; 6DC3   0201 002A

L_6DC5:
        SDBD                                    ; 6DC5   0001
        MVI@    R5,     R3                      ; 6DC6   02AB
        MVII    #$0018, R0                      ; 6DC7   02B8 0018
        MVII    #$015B, R4                      ; 6DC9   02BC 015B

        JSR     R5,     X_FILL_ZERO             ; 6DCB   0004 0114 0338

        MVO     R2,     G_015C                  ; 6DCE   0242 015C
        MVO     R3,     G_0347                  ; 6DD0   0243 0347
        CMPI    #$000C, R2                      ; 6DD2   037A 000C
        BNEQ    L_6DEB                          ; 6DD4   020C 0015

        MVI     G_012D, R1                      ; 6DD6   0281 012D
        ANDI    #$003F, R1                      ; 6DD8   03B9 003F
        SDBD                                    ; 6DDA   0001
        ADDI    #$00F0, R1                      ; 6DDB   02F9 00F0 0000
        MOVR    R1,     R2                      ; 6DDE   008A
        MVO     R1,     .PSG0.chn_b_lo          ; 6DDF   0241 01F1
        SWAP    R1,     1                       ; 6DE1   0041
        MVO     R1,     .PSG0.chn_b_hi          ; 6DE2   0241 01F5
        ADDI    #$000A, R2                      ; 6DE4   02FA 000A
        MVO     R2,     .PSG0.chn_c_lo          ; 6DE6   0242 01F2
        SWAP    R2,     1                       ; 6DE8   0042
        MVO     R2,     .PSG0.chn_c_hi          ; 6DE9   0242 01F6
L_6DEB:
        MVII    #$0001, R0                      ; 6DEB   02B8 0001
        MVO     R0,     G_015B                  ; 6DED   0240 015B
L_6DEF:
        PULR    R7                              ; 6DEF   02B7

L_6DF0:
        PSHR    R5                              ; 6DF0   0275
        MVI     G_015B, R0                      ; 6DF1   0280 015B
        DECR    R0                              ; 6DF3   0010
        BMI     L_6DEF                          ; 6DF4   022B 0006

        MVO     R0,     G_015B                  ; 6DF6   0240 015B
        BNEQ    L_6E01                          ; 6DF8   020C 0007

        MVI     G_0347, R4                      ; 6DFA   0284 0347

        JSR     R5,     L_6E52                  ; 6DFC   0004 016C 0252

        MVO     R4,     G_0347                  ; 6DFF   0244 0347
L_6E01:
        MVII    #$01F4, R3                      ; 6E01   02BB 01F4
        MVII    #$0169, R5                      ; 6E03   02BD 0169
L_6E05:
        MVI@    R3,     R0                      ; 6E05   0298
        ANDI    #$000F, R0                      ; 6E06   03B8 000F
        SUBI    #$0004, R3                      ; 6E08   033B 0004
        SWAP    R0,     1                       ; 6E0A   0040
        ADD@    R3,     R0                      ; 6E0B   02D8
        SDBD                                    ; 6E0C   0001
        ADD@    R5,     R0                      ; 6E0D   02E8
        MOVR    R3,     R4                      ; 6E0E   009C
        ADDI    #$0004, R3                      ; 6E0F   02FB 0004
        MOVR    R0,     R1                      ; 6E11   0081
        SWAP    R1,     1                       ; 6E12   0041
        MVO@    R0,     R4                      ; 6E13   0260
        MVO@    R1,     R3                      ; 6E14   0259
        INCR    R3                              ; 6E15   000B
        CMPI    #$01F7, R3                      ; 6E16   037B 01F7
        BNEQ    L_6E05                          ; 6E18   022C 0014

        MVI     G_0161, R0                      ; 6E1A   0280 0161
        MOVR    R0,     R1                      ; 6E1C   0081
        SLR     R0,     2                       ; 6E1D   0064
        SLR     R0,     1                       ; 6E1E   0060
        ADD     G_0162, R1                      ; 6E1F   02C1 0162
        MVO     R0,     .PSG0.noise             ; 6E21   0240 01F9
        MVO     R1,     G_0161                  ; 6E23   0241 0161
        MVII    #$016F, R2                      ; 6E25   02BA 016F
        MVII    #$0166, R3                      ; 6E27   02BB 0166
        MVII    #$0163, R4                      ; 6E29   02BC 0163
        MVII    #$01FB, R5                      ; 6E2B   02BD 01FB
L_6E2D:
        MVI@    R2,     R0                      ; 6E2D   0290
        DECR    R0                              ; 6E2E   0010
        BMI     L_6E39                          ; 6E2F   020B 0008

        MVO@    R0,     R2                      ; 6E31   0250
        BNEQ    L_6E39                          ; 6E32   020C 0005

        SDBD                                    ; 6E34   0001
        MVII    #$FFFA, R0                      ; 6E35   02B8 00FA 00FF
        MVO@    R0,     R3                      ; 6E38   0258
L_6E39:
        MVI@    R4,     R0                      ; 6E39   02A0
        CMPI    #$00FF, R0                      ; 6E3A   0378 00FF
        BEQ     L_6E4A                          ; 6E3C   0204 000C

        ADD@    R3,     R0                      ; 6E3E   02D8
        SWAP    R0,     2                       ; 6E3F   0044
        BPL     L_6E44                          ; 6E40   0203 0002

        CLRR    R0                              ; 6E42   01C0
        MVO@    R0,     R3                      ; 6E43   0258
L_6E44:
        DECR    R4                              ; 6E44   0014
        MVO@    R0,     R4                      ; 6E45   0260
        SLR     R0,     2                       ; 6E46   0064
        SLR     R0,     1                       ; 6E47   0060
        ANDI    #$000F, R0                      ; 6E48   03B8 000F
L_6E4A:
        MVO@    R0,     R5                      ; 6E4A   0268
        INCR    R2                              ; 6E4B   000A
        INCR    R3                              ; 6E4C   000B
        CMPI    #$01FE, R5                      ; 6E4D   037D 01FE
        BNEQ    L_6E2D                          ; 6E4F   022C 0023
        PULR    R7                              ; 6E51   02B7

L_6E52:
        PSHR    R5                              ; 6E52   0275
        MVI     G_0172, R0                      ; 6E53   0280 0172
        TSTR    R0                              ; 6E55   0080
        BNEQ    L_6ECB                          ; 6E56   020C 0073

L_6E58:
        JSR     R5,     L_6D4D                  ; 6E58   0004 016C 014D

        MOVR    R0,     R2                      ; 6E5B   0082
        MOVR    R2,     R3                      ; 6E5C   0093
        ANDI    #$001F, R3                      ; 6E5D   03BB 001F
        MOVR    R3,     R5                      ; 6E5F   009D
        SDBD                                    ; 6E60   0001
        ADDI    #$6D7D, R3                      ; 6E61   02FB 007D 006D
        MVI@    R3,     R3                      ; 6E64   029B
        INCR    R5                              ; 6E65   000D
        ADDR    R7,     R5                      ; 6E66   00FD
        ADD@    R5,     R7                      ; 6E67   02EF

        DECLE   $0018,  $0018,  $0018,  $001C   ; 6E68   0018 0018 0018 001C
        DECLE   $001C,  $001C,  $002F,  $002F   ; 6E6C   001C 001C 002F 002F
        DECLE   $0018,  $002F,  $0027,  $0027   ; 6E70   0018 002F 0027 0027
        DECLE   $0027,  $002F,  $002F,  $002F   ; 6E74   0027 002F 002F 002F
        DECLE   $002F,  $0051,  $0035,  $0035   ; 6E78   002F 0051 0035 0035
        DECLE   $0035,  $0035                   ; 6E7C   0035 0035

        SWAP    R3,     2                       ; 6E7E   0047
        SLLC    R3,     1                       ; 6E7F   005B
        MVII    #$0004, R1                      ; 6E80   02B9 0004
        B       L_6E86                          ; 6E82   0200 0002

        MVII    #$0001, R1                      ; 6E84   02B9 0001

L_6E86:
        JSR     R5,     L_6D3C                  ; 6E86   0004 016C 013C

        MVO@    R0,     R3                      ; 6E89   0258
        SWAP    R0,     1                       ; 6E8A   0040
        ADDR    R1,     R3                      ; 6E8B   00CB
        MVO@    R0,     R3                      ; 6E8C   0258
        B       L_6E58                          ; 6E8D   0220 0036

        ANDI    #$0020, R2                      ; 6E8F   03BA 0020
        BEQ     L_6E97                          ; 6E91   0204 0004

        MVII    #$00FF, R0                      ; 6E93   02B8 00FF
        B       L_6E9A                          ; 6E95   0200 0003

L_6E97:
        JSR     R5,     L_6D4D                  ; 6E97   0004 016C 014D

L_6E9A:
        MVO@    R0,     R3                      ; 6E9A   0258
        B       L_6E58                          ; 6E9B   0220 0044

        ANDI    #$0020, R2                      ; 6E9D   03BA 0020
        BEQ     L_6E97                          ; 6E9F   0224 0009

        JSR     R5,     L_6D3C                  ; 6EA1   0004 016C 013C

        MOVR    R0,     R5                      ; 6EA4   0085
        MVI@    R3,     R0                      ; 6EA5   0298
        DECR    R0                              ; 6EA6   0010
        BMI     L_6EAC                          ; 6EA7   020B 0003

        MVO@    R0,     R3                      ; 6EA9   0258
        BEQ     L_6E58                          ; 6EAA   0224 0053

L_6EAC:
        MOVR    R5,     R4                      ; 6EAC   00AC
        B       L_6E58                          ; 6EAD   0220 0056

        JSR     R5,     L_6D4D                  ; 6EAF   0004 016C 014D

        MVO@    R0,     R3                      ; 6EB2   0258
        TSTR    R0                              ; 6EB3   0080
        BNEQ    L_6EB8                          ; 6EB4   020C 0002

L_6EB6:
        MVO     R0,     G_015C                  ; 6EB6   0240 015C
L_6EB8:
        PULR    R7                              ; 6EB8   02B7

L_6EB9:
        CLRR    R0                              ; 6EB9   01C0
        MVO     R0,     G_0163                  ; 6EBA   0240 0163
        MVO     R0,     G_0164                  ; 6EBC   0240 0164
        NOP                                     ; 6EBE   0034
        MVO     R0,     G_0165                  ; 6EBF   0240 0165
        B       L_6EB6                          ; 6EC1   0220 000C

        MVII    #$0001, R0                      ; 6EC3   02B8 0001
        MVO     R0,     G_0172                  ; 6EC5   0240 0172
        MVII    #$0038, R0                      ; 6EC7   02B8 0038
        MVO     R0,     .PSG0.chan_enable       ; 6EC9   0240 01F8

L_6ECB:
        JSR     R5,     L_6D4D                  ; 6ECB   0004 016C 014D

        MOVR    R0,     R1                      ; 6ECE   0081
        ANDI    #$003F, R1                      ; 6ECF   03B9 003F
        CMPI    #$003F, R1                      ; 6ED1   0379 003F
        BGE     L_6EB9                          ; 6ED3   022D 001B

        MOVR    R0,     R2                      ; 6ED5   0082
        SLL     R2,     2                       ; 6ED6   004E
        SWAP    R2,     1                       ; 6ED7   0042
        ANDI    #$0007, R2                      ; 6ED8   03BA 0007
        SDBD                                    ; 6EDA   0001
        ADDI    #$6DAC, R2                      ; 6EDB   02FA 00AC 006D
        MVI@    R2,     R2                      ; 6EDE   0292
        MVO     R2,     G_015B                  ; 6EDF   0242 015B
        MVII    #$016F, R3                      ; 6EE1   02BB 016F
L_6EE3:
        MVI@    R3,     R2                      ; 6EE3   029A
        TSTR    R2                              ; 6EE4   0092
        BEQ     L_6EEE                          ; 6EE5   0204 0007

        INCR    R3                              ; 6EE7   000B
        CMPI    #$0172, R3                      ; 6EE8   037B 0172
        BNEQ    L_6EE3                          ; 6EEA   022C 0008
        B       L_6F1D                          ; 6EEC   0200 002F

L_6EEE:
        MVI     G_015B, R1                      ; 6EEE   0281 015B
        SUBI    #$0003, R1                      ; 6EF0   0339 0003
        BPL     L_6EF5                          ; 6EF2   0203 0001

        CLRR    R1                              ; 6EF4   01C9
L_6EF5:
        MVO@    R1,     R3                      ; 6EF5   0259
        SUBI    #$000C, R3                      ; 6EF6   033B 000C
        MVII    #$0060, R1                      ; 6EF8   02B9 0060
        MVO@    R1,     R3                      ; 6EFA   0259
        ADDI    #$0003, R3                      ; 6EFB   02FB 0003
        CLRR    R1                              ; 6EFD   01C9
        MVO@    R1,     R3                      ; 6EFE   0259
        ADDI    #$008A, R3                      ; 6EFF   02FB 008A
        MOVR    R0,     R5                      ; 6F01   0085
        ANDI    #$003F, R5                      ; 6F02   03BD 003F
        CLRR    R1                              ; 6F04   01C9
L_6F05:
        INCR    R1                              ; 6F05   0009
        SUBI    #$000C, R5                      ; 6F06   033D 000C
        BPL     L_6F05                          ; 6F08   0223 0004

        ADDI    #$000C, R5                      ; 6F0A   02FD 000C
        ADDR    R5,     R5                      ; 6F0C   00ED
        SDBD                                    ; 6F0D   0001
        ADDI    #$6D94, R5                      ; 6F0E   02FD 0094 006D
        SDBD                                    ; 6F11   0001
        MVI@    R5,     R2                      ; 6F12   02AA
L_6F13:
        SARC    R2,     1                       ; 6F13   007A
        ADCR    R2                              ; 6F14   002A
        DECR    R1                              ; 6F15   0011
        BNEQ    L_6F13                          ; 6F16   022C 0004

        MVO@    R2,     R3                      ; 6F18   025A
        SWAP    R2,     1                       ; 6F19   0042
        ADDI    #$0004, R3                      ; 6F1A   02FB 0004
        MVO@    R2,     R3                      ; 6F1C   025A
L_6F1D:
        ANDI    #$0200, R0                      ; 6F1D   03B8 0200
        BEQ     L_6ECB                          ; 6F1F   0224 0055
        PULR    R7                              ; 6F21   02B7

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
        DECLE   $00FF,  $00FE,  $01FC,  $00F8   ; D000   00FF 00FE 01FC 00F8
        DECLE   $00F0,  $02E0,  $03C0,  $0380   ; D004   00F0 02E0 03C0 0380
        DECLE   $00FF,  $007F,  $023F,  $021F   ; D008   00FF 007F 023F 021F
        DECLE   $020F,  $0007,  $0003,  $0001   ; D00C   020F 0007 0003 0001
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D010   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $01FF,  $03FF,  $03FE   ; D014   00FF 01FF 03FF 03FE
        DECLE   $01FC,  $00F8,  $00F0,  $00E0   ; D018   01FC 00F8 00F0 00E0
        DECLE   $00C0,  $0280,  $0000,  $0000   ; D01C   00C0 0280 0000 0000
        DECLE   $003F,  $001F,  $030F,  $0207   ; D020   003F 001F 030F 0207
        DECLE   $0003,  $0101,  $0000,  $0000   ; D024   0003 0101 0000 0000
        DECLE   $00FF,  $01FF,  $02FF,  $00FF   ; D028   00FF 01FF 02FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $007F   ; D02C   00FF 00FF 00FF 007F
        DECLE   $00FF,  $00FF,  $00FF,  $02FF   ; D030   00FF 00FF 00FF 02FF
        DECLE   $01FF,  $01FE,  $00FC,  $00F8   ; D034   01FF 01FE 00FC 00F8
        DECLE   $00F0,  $01E0,  $00C0,  $0080   ; D038   00F0 01E0 00C0 0080
        DECLE   $0000,  $0100,  $0000           ; D03C   0000 0100 0000

        SUBR    R0,     R0                      ; D03F   0100
        INCR    R7                              ; D040   000F

        SETC                                    ; D041   0007
L_D042:
        DIS                                     ; D042   0003
        DECLE   $0001,  $0100,  $0000,  $0000   ; D043   0001 0100 0000 0000
        DECLE   $0200,  $02FF,  $03FF,  $00FF   ; D047   0200 02FF 03FF 00FF
        DECLE   $00FF,  $02FF,  $007F,  $003F   ; D04B   00FF 02FF 007F 003F
        DECLE   $001F,  $00FF,  $00FF,  $00FF   ; D04F   001F 00FF 00FF 00FF
        DECLE   $02FE,  $02FC,  $00F8,  $00F0   ; D053   02FE 02FC 00F8 00F0
        DECLE   $00E0,  $00C0,  $0280,  $0000   ; D057   00E0 00C0 0280 0000
        DECLE   $0100,  $0000,  $0000,  $0100   ; D05B   0100 0000 0000 0100
        DECLE   $0100,  $0003,  $0001,  $0000   ; D05F   0100 0003 0001 0000
        DECLE   $0000,  $0300,  $0000,  $0000   ; D063   0000 0300 0000 0000
        DECLE   $0000,  $00FF,  $00FF,  $02FF   ; D067   0000 00FF 00FF 02FF
        DECLE   $017F,  $003F,  $021F           ; D06B   017F 003F 021F

        SUBR    R1,     R7                      ; D06E   010F
        SUBR    R0,     R7                      ; D06F   0107

        DECLE   $00FF,  $00FF,  $02FF,  $01FF   ; D070   00FF 00FF 02FF 01FF
        DECLE   $00FC,  $00F0,  $00C0,  $0000   ; D074   00FC 00F0 00C0 0000
        DECLE   $03FC,  $00F0,  $00C0,  $0000   ; D078   03FC 00F0 00C0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D07C   0000 0000 0000 0000
        DECLE   $003F,  $020F,  $0103,  $0100   ; D080   003F 020F 0103 0100
        DECLE   $0000,  $0000,  $0200,  $0100   ; D084   0000 0000 0200 0100
        DECLE   $00FF,  $00FF,  $00FF,  $02FF   ; D088   00FF 00FF 00FF 02FF
        DECLE   $003F,  $030F,  $0003,  $0000   ; D08C   003F 030F 0003 0000
        DECLE   $03FE,  $00FE,  $02FC,  $01FC   ; D090   03FE 00FE 02FC 01FC
        DECLE   $00F8,  $00F8,  $01F0,  $02F0   ; D094   00F8 00F8 01F0 02F0
        DECLE   $01E0,  $00E0,  $01C0,  $00C0   ; D098   01E0 00E0 01C0 00C0
        DECLE   $0080,  $0080,  $0000,  $0100   ; D09C   0080 0080 0000 0100
        DECLE   $007F,  $007F,  $003F,  $023F   ; D0A0   007F 007F 003F 023F
        DECLE   $031F,  $001F,  $000F,  $030F   ; D0A4   031F 001F 000F 030F
        DECLE   $0207,  $0007,  $0003,  $0003   ; D0A8   0207 0007 0003 0003
        DECLE   $0001,  $0001,  $0000,  $0100   ; D0AC   0001 0001 0000 0100
        DECLE   $00FF,  $00FF,  $03FF,  $00FF   ; D0B0   00FF 00FF 03FF 00FF
        DECLE   $00FF,  $00FF,  $003F,  $000F   ; D0B4   00FF 00FF 003F 000F
        DECLE   $00FF,  $01FF,  $00FF,  $02FF   ; D0B8   00FF 01FF 00FF 02FF
        DECLE   $03FF,  $00FF,  $00FC,  $00F0   ; D0BC   03FF 00FF 00FC 00F0
        DECLE   $02FF,  $00FF,  $00FC,  $00F0   ; D0C0   02FF 00FF 00FC 00F0
        DECLE   $00C0,  $0300,  $0300,  $0000   ; D0C4   00C0 0300 0300 0000
        DECLE   $00C0,  $0000,  $0200,  $0000   ; D0C8   00C0 0000 0200 0000
        DECLE   $0000,  $0000,  $0000,  $0200   ; D0CC   0000 0000 0000 0200
        DECLE   $0103,  $0100,  $0000,  $0000   ; D0D0   0103 0100 0000 0000
        DECLE   $0000,  $0000,  $0100,  $0000   ; D0D4   0000 0000 0100 0000
        DECLE   $00FF,  $02FF,  $033F,  $000F   ; D0D8   00FF 02FF 033F 000F
        DECLE   $0003,  $0000,  $0300,  $0300   ; D0DC   0003 0000 0300 0300
        DECLE   $03FF,  $03FF,  $03FC,  $03F8   ; D0E0   03FF 03FF 03FC 03F8
        DECLE   $03F0,  $00E0,  $00C0,  $0080   ; D0E4   03F0 00E0 00C0 0080
        DECLE   $03FF,  $03FE,  $03FC,  $03FC   ; D0E8   03FF 03FE 03FC 03FC
        DECLE   $03F0,  $00E0,  $01C0,  $0080   ; D0EC   03F0 00E0 01C0 0080
        DECLE   $00FF,  $00FE,  $01FC,  $01F8   ; D0F0   00FF 00FE 01FC 01F8
        DECLE   $00F0,  $00F0,  $00C0,  $0080   ; D0F4   00F0 00F0 00C0 0080
        DECLE   $00FF,  $00FE,  $01FC,  $01F8   ; D0F8   00FF 00FE 01FC 01F8
        DECLE   $00F0,  $00E0,  $00C0,  $01C0   ; D0FC   00F0 00E0 00C0 01C0
        DECLE   $01FF,  $00FF,  $003F,  $001F   ; D100   01FF 00FF 003F 001F

        INCR    R7                              ; D104   000F

        SETC                                    ; D105   0007
L_D106:
        DIS                                     ; D106   0003
        DECLE   $0201,  $01FF,  $017F,  $003F   ; D107   0201 01FF 017F 003F
        DECLE   $003F,  $010F,  $0007,  $0003   ; D10B   003F 010F 0007 0003
        DECLE   $0101,  $00FF,  $017F,  $003F   ; D10F   0101 00FF 017F 003F

        SUBR    R3,     R7                      ; D113   011F
        INCR    R7                              ; D114   000F

        DECLE   $000F                           ; D115   000F
L_D116:
        DIS                                     ; D116   0003
        DECLE   $0001,  $01FF,  $007F,  $003F   ; D117   0001 01FF 007F 003F
        DECLE   $021F,  $030F,  $0207,  $0003   ; D11B   021F 030F 0207 0003
        DECLE   $0003,  $03FF,  $02FF,  $02FF   ; D11F   0003 03FF 02FF 02FF
        DECLE   $00FF,  $003F,  $001F,  $020F   ; D123   00FF 003F 001F 020F
        DECLE   $0007,  $00FF,  $00FF,  $00FF   ; D127   0007 00FF 00FF 00FF
        DECLE   $027F,  $013F,  $013F,  $020F   ; D12B   027F 013F 013F 020F
        DECLE   $0007,  $00FF,  $00FF,  $02FF   ; D12F   0007 00FF 00FF 02FF
        DECLE   $017F,  $003F,  $001F           ; D133   017F 003F 001F

        INCR    R7                              ; D136   000F
        INCR    R7                              ; D137   000F

L_D138:
        ADDR    R3,     R4                      ; D138   00DC
L_D139:
        ADDI    #$00DF, R6                      ; D139   02FE 00DF
        DECLE   $00FF,  $01DF,  $02FF,  $00DF   ; D13B   00FF 01DF 02FF 00DF
        DECLE   $00FF                           ; D13F   00FF

        ADDR    R7,     R6                      ; D140   00FE
        ADDR    R7,     R0                      ; D141   00F8
        ADDR    R6,     R0                      ; D142   00F0
        ADDR    R4,     R0                      ; D143   00E0
        ADDR    R0,     R0                      ; D144   00C0
        TSTR    R0                              ; D145   0080
        B       L_D248                          ; D146   0200 0100

        DECLE   $01DF,  $00FF,  $00DF,  $02FF   ; D148   01DF 00FF 00DF 02FF
        DECLE   $01DF,  $00FF,  $00DF,  $00FF   ; D14C   01DF 00FF 00DF 00FF
        DECLE   $0007,  $0201,  $0000,  $0000   ; D150   0007 0201 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D154   0000 0000 0000 0000
        DECLE   $03CF,  $01CF,  $03CF,  $01CF   ; D158   03CF 01CF 03CF 01CF
        DECLE   $01CF,  $02CF,  $01FF,  $00FF   ; D15C   01CF 02CF 01FF 00FF
        DECLE   $008F,  $0007,  $0083,  $0201   ; D160   008F 0007 0083 0201
        DECLE   $0380,  $0300,  $0080,  $0100   ; D164   0380 0300 0080 0100
        DECLE   $02F0,  $00E0,  $00C0,  $0080   ; D168   02F0 00E0 00C0 0080
        DECLE   $0080,  $0000,  $0000,  $0000   ; D16C   0080 0000 0000 0000
        DECLE   $007F,  $02FF,  $017F,  $01FF   ; D170   007F 02FF 017F 01FF
        DECLE   $007F,  $00FF,  $007F,  $03FF   ; D174   007F 00FF 007F 03FF
        DECLE   $030F,  $0007,  $0003,  $0301   ; D178   030F 0007 0003 0301
        DECLE   $0101,  $0000,  $0000,  $0000   ; D17C   0101 0000 0000 0000
        DECLE   $023F,  $033F,  $03FF,  $03FF   ; D180   023F 033F 03FF 03FF
        DECLE   $033F,  $023F,  $013F,  $013F   ; D184   033F 023F 013F 013F
        DECLE   $00C2,  $0080,  $0002,  $0300   ; D188   00C2 0080 0002 0300
        DECLE   $0302,  $0000,  $0002,  $0100   ; D18C   0302 0000 0002 0100
        DECLE   $00E0,  $0180,  $0000,  $0000   ; D190   00E0 0180 0000 0000
        DECLE   $0000,  $0000,  $0100,  $0000   ; D194   0000 0000 0100 0000
        DECLE   $00FD,  $00FF,  $02FD,  $03FF   ; D198   00FD 00FF 02FD 03FF
        DECLE   $00FD,  $00FF,  $03FD,  $02FF   ; D19C   00FD 00FF 03FD 02FF
        DECLE   $007F,  $001F                   ; D1A0   007F 001F

        INCR    R7                              ; D1A2   000F

        SETC                                    ; D1A3   0007
L_D1A4:
        DIS                                     ; D1A4   0003
        DECLE   $0101,  $0100,  $0000,  $00FC   ; D1A5   0101 0100 0000 00FC
        DECLE   $03FC,  $00FC,  $00FC,  $00FC   ; D1A9   03FC 00FC 00FC 00FC
        DECLE   $00FC,  $00FF,  $01FF,  $01F7   ; D1AD   00FC 00FF 01FF 01F7
        DECLE   $00FF,  $01F7,  $00FF,  $00F7   ; D1B1   00FF 01F7 00FF 00F7
        DECLE   $00FF,  $00F7,  $03FF           ; D1B5   00FF 00F7 03FF

        XORR    R6,     R3                      ; D1B8   01F3
        XORR    R6,     R3                      ; D1B9   01F3
        ADDI    #$00FF, R7                      ; D1BA   02FF 00FF

        DECLE   $00F3,  $00F3,  $00F3,  $02F3   ; D1BC   00F3 00F3 00F3 02F3
        DECLE   $0023,  $0001,  $0020,  $0000   ; D1C0   0023 0001 0020 0000

        SUBR    R4,     R0                      ; D1C4   0120
        B       L_D2E7                          ; D1C5   0200 0120
        B       L_D2BC                          ; D1C7   0200 00F3

        DECLE   $00F3,  $00F3,  $00F3,  $02F3   ; D1C9   00F3 00F3 00F3 02F3
        DECLE   $01F3,  $01FF,  $00FF,  $008F   ; D1CD   01F3 01FF 00FF 008F
        DECLE   $0007,  $0043,  $0301,  $0020   ; D1D1   0007 0043 0301 0020
        DECLE   $0000,  $0120,  $0000,  $01EF   ; D1D5   0000 0120 0000 01EF
        DECLE   $00FF,  $00EF,  $00FF,  $00EF   ; D1D9   00FF 00EF 00FF 00EF
        DECLE   $01FF,  $00EF,  $00FF,  $01C4   ; D1DD   01FF 00EF 00FF 01C4
        DECLE   $0280,  $0302,  $0000,  $0001   ; D1E1   0280 0302 0000 0001
        DECLE   $0300,  $0201,  $0000,  $00F7   ; D1E5   0300 0201 0000 00F7
        DECLE   $00FF,  $00F7,  $00FF,  $01FB   ; D1E9   00FF 00F7 00FF 01FB
        DECLE   $01FF,  $00FB,  $00FF,  $03FD   ; D1ED   01FF 00FB 00FF 03FD
        DECLE   $00FF,  $00FD,  $00FF,  $00FE   ; D1F1   00FF 00FD 00FF 00FE
        DECLE   $00FF,  $01FE,  $01FF,  $007F   ; D1F5   00FF 01FE 01FF 007F
        DECLE   $01FF,  $007F,  $007F,  $007F   ; D1F9   01FF 007F 007F 007F
        DECLE   $00FF,  $00BF,  $03BF,  $02BF   ; D1FD   00FF 00BF 03BF 02BF
        DECLE   $00FF,  $01DF                   ; D201   00FF 01DF

        ADDR    R3,     R7                      ; D203   00DF
        ADDR    R3,     R7                      ; D204   00DF

        DECLE   $00FF                           ; D205   00FF

        ADD@    R5,     R7                      ; D206   02EF
        ADDR    R5,     R7                      ; D207   00EF
        ADDR    R5,     R7                      ; D208   00EF
        ADDR    R5,     R7                      ; D209   00EF

        DECLE   $00FF,  $02FF,  $03E7           ; D20A   00FF 02FF 03E7

        ADD@    R4,     R7                      ; D20D   02E7
        ADDR    R4,     R7                      ; D20E   00E7

        DECLE   $01E7                           ; D20F   01E7

        ADDR    R4,     R7                      ; D210   00E7
        ADDR    R4,     R7                      ; D211   00E7

        DECLE   $00FF,  $02FF,  $01F3,  $01F3   ; D212   00FF 02FF 01F3 01F3
        DECLE   $00F3,  $00F3,  $0023,  $0001   ; D216   00F3 00F3 0023 0001
        DECLE   $0120,  $0000,  $0010,  $0100   ; D21A   0120 0000 0010 0100
        DECLE   $0010,  $0100,  $007F,  $007F   ; D21E   0010 0100 007F 007F
        DECLE   $007F,  $00FF,  $01BF,  $00BF   ; D222   007F 00FF 01BF 00BF
        DECLE   $00BF,  $00FF,  $02E7,  $03E7   ; D226   00BF 00FF 02E7 03E7

        ADDR    R4,     R7                      ; D22A   00E7
        ADDR    R4,     R7                      ; D22B   00E7

        DECLE   $01E7,  $00E7,  $00FF,  $00FF   ; D22C   01E7 00E7 00FF 00FF
        DECLE   $008F,  $0007,  $0383,  $0101   ; D230   008F 0007 0383 0101
        DECLE   $0340,  $0100,  $0140,  $0000   ; D234   0340 0100 0140 0000

        ADDR    R3,     R7                      ; D238   00DF
        ADDI    #$00DF, R7                      ; D239   02FF 00DF

        DECLE   $00FF,  $00EF,  $00FF,  $00EF   ; D23B   00FF 00EF 00FF 00EF
        DECLE   $00FF,  $03EF,  $03FF,  $01F7   ; D23F   00FF 03EF 03FF 01F7
        DECLE   $01F7,  $00F7,  $00FF           ; D243   01F7 00F7 00FF

        XORR    R7,     R3                      ; D246   01FB
        XORR    R7,     R3                      ; D247   01FB
L_D248:
        ADDR    R7,     R3                      ; D248   00FB
        DECLE   $00FF,  $00FD,  $00FD,  $00FD   ; D249   00FF 00FD 00FD 00FD
        DECLE   $01FF,  $00FE,  $00FE,  $00FE   ; D24D   01FF 00FE 00FE 00FE
        DECLE   $00FE,  $00FF,  $03FF,  $02FF   ; D251   00FE 00FF 03FF 02FF
        DECLE   $02FF,  $00FF,  $00FF,  $00FF   ; D255   02FF 00FF 00FF 00FF
        DECLE   $03FF,  $02FF,  $00FF,  $003F   ; D259   03FF 02FF 00FF 003F
        DECLE   $003F,  $023F,  $003F,  $003F   ; D25D   003F 023F 003F 003F
        DECLE   $003F,  $00FF,  $00FF           ; D261   003F 00FF 00FF

        ADD@    R1,     R7                      ; D264   02CF
        ADDR    R1,     R7                      ; D265   00CF

        DECLE   $03CF                           ; D266   03CF

        ADDR    R1,     R7                      ; D267   00CF
        ADDR    R1,     R7                      ; D268   00CF
        ADDR    R1,     R7                      ; D269   00CF

        DECLE   $01FF,  $02FF                   ; D26A   01FF 02FF

        ADDR    R6,     R3                      ; D26C   00F3
        ADDR    R6,     R3                      ; D26D   00F3
        ADDR    R6,     R3                      ; D26E   00F3
        ADDR    R6,     R3                      ; D26F   00F3
        ADDI    #$00FF, R7                      ; D270   02FF 00FF

        DECLE   $00FF,  $00FF,  $02FF,  $01FF   ; D272   00FF 00FF 02FF 01FF
        DECLE   $01FC,  $00F8,  $00E2,  $00C0   ; D276   01FC 00F8 00E2 00C0
        DECLE   $01C2,  $0080,  $0001,  $0000   ; D27A   01C2 0080 0001 0000
        DECLE   $0101,  $0000,  $013F,  $000F   ; D27E   0101 0000 013F 000F
        DECLE   $0003,  $0001,  $0000,  $0100   ; D282   0003 0001 0000 0100
        DECLE   $0000,  $0000,  $00FF,  $02FF   ; D286   0000 0000 00FF 02FF
        DECLE   $03FF,  $00FF,  $00FF,  $00FF   ; D28A   03FF 00FF 00FF 00FF
        DECLE   $023F,  $001F,  $003F,  $003F   ; D28E   023F 001F 003F 003F
        DECLE   $003F,  $023F,  $013F,  $013F   ; D292   003F 023F 013F 013F
        DECLE   $02FF,  $00FF,  $0008,  $0080   ; D296   02FF 00FF 0008 0080
        DECLE   $0388,  $0280,  $0004,  $0000   ; D29A   0388 0280 0004 0000
        DECLE   $0004,  $0000,  $02F3,  $00F3   ; D29E   0004 0000 02F3 00F3
        DECLE   $01FF,  $00FF,  $00FC,  $03FC   ; D2A2   01FF 00FF 00FC 03FC
        DECLE   $00FC,  $00FC,  $00F8,  $00F8   ; D2A6   00FC 00FC 00F8 00F8
        DECLE   $02FC,  $00FC,  $01FE,  $00FC   ; D2AA   02FC 00FC 01FE 00FC
        DECLE   $02FC,  $00F8,  $0143,  $0000   ; D2AE   02FC 00F8 0143 0000
        DECLE   $0010,  $0300,  $0008,  $0000   ; D2B2   0010 0300 0008 0000
        DECLE   $0004,  $0000                   ; D2B6   0004 0000

        MVI     .IV.ALD,R4                      ; D2B8   0284 0080
        ADDR    R0,     R1                      ; D2BA   00C1
L_D2BB:
        ADDR    R0,     R0                      ; D2BB   00C0
L_D2BC:
        ADDR    R4,     R0                      ; D2BC   00E0
        DECLE   $02E0,  $02F0,  $02F0,  $023F   ; D2BD   02E0 02F0 02F0 023F
        DECLE   $000F,  $0003,  $0000,  $0040   ; D2C1   000F 0003 0000 0040
        DECLE   $0100,  $0010,  $0000,  $00FF   ; D2C5   0100 0010 0000 00FF
        DECLE   $00FF,  $03FF,  $02FF,  $023F   ; D2C9   00FF 03FF 02FF 023F
        DECLE   $020F,  $0003,  $0001,  $00F7   ; D2CD   020F 0003 0001 00F7
        DECLE   $00FF,  $02FB,  $01FF,  $01FD   ; D2D1   00FF 02FB 01FF 01FD
        DECLE   $00FF,  $00FD,  $01FF,  $00FE   ; D2D5   00FF 00FD 01FF 00FE
        DECLE   $00FE,  $00FF,  $00FE,  $02FE   ; D2D9   00FE 00FF 00FE 02FE
        DECLE   $00FF,  $00FE,  $00FE,  $00FF   ; D2DD   00FF 00FE 00FE 00FF
        DECLE   $017F,  $007F,  $037F,  $027F   ; D2E1   017F 007F 037F 027F
        DECLE   $00FF                           ; D2E5   00FF

        SARC    R3,     2                       ; D2E6   007F
L_D2E7:
        SARC    R3,     2                       ; D2E7   007F
        DECLE   $0083,  $0120,  $0008,  $0000   ; D2E8   0083 0120 0008 0000
        DECLE   $0002,  $0000,  $0300,  $0000   ; D2EC   0002 0000 0300 0000
        DECLE   $03FF,  $027F,  $000F,  $0001   ; D2F0   03FF 027F 000F 0001
        DECLE   $0000,  $0000,  $0280,  $0100   ; D2F4   0000 0000 0280 0100
        DECLE   $01FF,  $00FF,  $00FF,  $01FF   ; D2F8   01FF 00FF 00FF 01FF
        DECLE   $007F,  $001F,  $0007,  $0001   ; D2FC   007F 001F 0007 0001
        DECLE   $02FF,  $00FF,  $03FF           ; D300   02FF 00FF 03FF

        ADDR    R7,     R6                      ; D303   00FE
        ADDR    R7,     R6                      ; D304   00FE
        ADDR    R7,     R4                      ; D305   00FC
        ADDI    #$03F8, R4                      ; D306   02FC 03F8
        MVI@    R3,     R7                      ; D308   029F
        MVI@    R3,     R7                      ; D309   029F
        MOVR    R3,     R7                      ; D30A   009F

        DECLE   $019F,  $029F,  $019F,  $00FF   ; D30B   019F 029F 019F 00FF
        DECLE   $01FF,  $001F,  $0003,  $0340   ; D30F   01FF 001F 0003 0340
        DECLE   $0100,  $0108,  $0000           ; D313   0100 0108 0000

        EIS                                     ; D316   0002
        SUB     G_02F0, R0                      ; D317   0300 02F0
        XORR    R7,     R0                      ; D319   01F8
L_D31A:
        XORI    #$00F8, R0                      ; D31A   03F8 00F8
        DECLE   $03F0,  $01F0,  $02E0,  $03E0   ; D31C   03F0 01F0 02E0 03E0
        DECLE   $02FF,  $02FF,  $027F,  $01FF   ; D320   02FF 02FF 027F 01FF
        DECLE   $03BF,  $00FF,  $03BF,  $01FF   ; D324   03BF 00FF 03BF 01FF
        DECLE   $02FF,  $00FF,  $02FF           ; D328   02FF 00FF 02FF

        XORI    #$01FE, R6                      ; D32B   03FE 01FE
        ADDI    #$00F0, R0                      ; D32D   02F8 00F0
        ADD@    R4,     R0                      ; D32F   02E0
        XORI    #$01FB, R3                      ; D330   03FB 01FB
        ADDI    #$00FF, R7                      ; D332   02FF 00FF

        DECLE   $02F9,  $00F9,  $02F9,  $01F9   ; D334   02F9 00F9 02F9 01F9
        DECLE   $03F9,  $00F9,  $03FF,  $01FF   ; D338   03F9 00F9 03FF 01FF
        DECLE   $02FC,  $00FC,  $02FC,  $03FC   ; D33C   02FC 00FC 02FC 03FC
        DECLE   $01FC,  $02FC,  $00FF,  $02FF   ; D340   01FC 02FC 00FF 02FF
        DECLE   $03FE,  $01FE,  $02FE,  $00FE   ; D344   03FE 01FE 02FE 00FE
        DECLE   $02FF,  $02FF,  $01FF,  $01FF   ; D348   02FF 02FF 01FF 01FF
        DECLE   $037F,  $007F,  $017F,  $027F   ; D34C   037F 007F 017F 027F
        DECLE   $0203,  $0040,  $0210,  $0200   ; D350   0203 0040 0210 0200
        DECLE   $0002,  $0200,  $0000,  $0200   ; D354   0002 0200 0000 0200
        DECLE   $01FF,  $027F                   ; D358   01FF 027F

        BESC    L_D35C                          ; D35A   020F 0000
L_D35C:
        B       L_D65E                          ; D35C   0200 0300

        DECLE   $0240,  $0100,  $03EF,  $00FF   ; D35E   0240 0100 03EF 00FF
        DECLE   $03FB,  $01FF,  $02FD,  $03FF   ; D362   03FB 01FF 02FD 03FF
        DECLE   $02FE,  $02FF,  $02FE,  $01FE   ; D366   02FE 02FF 02FE 01FE
        DECLE   $03FC,  $00FC,  $03F8,  $01F8   ; D36A   03FC 00FC 03F8 01F8
        DECLE   $02F0,  $00E0,  $023F           ; D36E   02F0 00E0 023F
L_D371:
        SUB     G_0180, R3                      ; D371   0303 0180
        DECLE   $0220,  $0000                   ; D373   0220 0000

        SKIP                                    ; D375   0208
        SUB     .ISRVEC.0,R2                    ; D376   0302 0100
        ADDI    #$00FF, R7                      ; D378   02FF 00FF

        DECLE   $023F,  $0007,  $0200,  $0100   ; D37A   023F 0007 0200 0100
        DECLE   $0300,  $0000,  $03F8,  $01F8   ; D37E   0300 0000 03F8 01F8
        DECLE   $02F8,  $00F8,  $02F8,  $03F0   ; D382   02F8 00F8 02F8 03F0
        DECLE   $01F0,  $02F0,  $00BF,  $02FF   ; D386   01F0 02F0 00BF 02FF
        DECLE   $03EF,  $01FF,  $02FB,  $00FF   ; D38A   03EF 01FF 02FB 00FF
        DECLE   $02FE,  $02FF,  $01BF,  $01FF   ; D38E   02FE 02FF 01BF 01FF
        DECLE   $03BF,  $00BF,  $01BF           ; D392   03BF 00BF 01BF

        ADDI    #$02DF, R7                      ; D395   02FF 02DF
        ADDR    R3,     R7                      ; D397   00DF
        ADD@    R3,     R7                      ; D398   02DF
        ADD@    R3,     R7                      ; D399   02DF

        DECLE   $00FF,  $02FF                   ; D39A   00FF 02FF

        ADDR    R1,     R7                      ; D39C   00CF
        ADD@    R1,     R7                      ; D39D   02CF

        DECLE   $01CF                           ; D39E   01CF

        ADD@    R1,     R7                      ; D39F   02CF
        ADDI    #$007F, R7                      ; D3A0   02FF 007F

        DECLE   $0207,  $0300,  $0280,  $0100   ; D3A2   0207 0300 0280 0100
        DECLE   $0310,  $0000,  $03FF,  $01FF   ; D3A6   0310 0000 03FF 01FF
        DECLE   $02FF,  $02FF,  $001F,  $0303   ; D3AA   02FF 02FF 001F 0303
        DECLE   $0200,  $0200,  $02FD,  $02FF   ; D3AE   0200 0200 02FD 02FF
        DECLE   $03FF,  $02FF,  $02FF,  $00FF   ; D3B2   03FF 02FF 02FF 00FF
        DECLE   $00FF,  $03FF,  $01FF,  $02FF   ; D3B6   00FF 03FF 01FF 02FF
        DECLE   $003F,  $021F,  $0207,  $0203   ; D3BA   003F 021F 0207 0203
        DECLE   $0101,  $0300,  $00EF,  $03EF   ; D3BE   0101 0300 00EF 03EF
        DECLE   $01EF,  $02FF,  $00F7,  $00F7   ; D3C2   01EF 02FF 00F7 00F7
        DECLE   $03F7,  $02FF,  $02FB,  $00FB   ; D3C6   03F7 02FF 02FB 00FB
        DECLE   $02FB,  $02FF,  $00FD,  $02FD   ; D3CA   02FB 02FF 00FD 02FD
        DECLE   $00FD,  $00FF,  $033F,  $0103   ; D3CE   00FD 00FF 033F 0103
        DECLE   $0200,  $0040,  $0208,  $0300   ; D3D2   0200 0040 0208 0300
        DECLE   $0201,  $0200,  $00DF,  $00FF   ; D3D6   0201 0200 00DF 00FF
        DECLE   $03F7,  $01FF                   ; D3DA   03F7 01FF

        ADDI    #$00FF, R5                      ; D3DC   02FD 00FF
        ADDI    #$00FF, R6                      ; D3DE   02FE 00FF
        ADD@    R3,     R7                      ; D3E0   02DF

        DECLE   $01FF,  $03EF,  $00EF,  $01EF   ; D3E1   01FF 03EF 00EF 01EF
        DECLE   $02FF,  $02F7,  $00F7,  $00F7   ; D3E5   02FF 02F7 00F7 00F7
        DECLE   $00FF,  $03FF,  $02F3,  $00F3   ; D3E9   00FF 03FF 02F3 00F3
        DECLE   $02F3,  $02F3,  $00F3,  $023F   ; D3ED   02F3 02F3 00F3 023F
        DECLE   $0003,  $0000,  $0300,  $0110   ; D3F1   0003 0000 0300 0110
        DECLE   $0202,  $0000,  $0200,  $00F0   ; D3F5   0202 0000 0200 00F0

        XORI    #$02F8, R0                      ; D3F9   03F8 02F8
        ADDR    R7,     R0                      ; D3FB   00F8
        ADDR    R7,     R4                      ; D3FC   00FC
        XORR    R7,     R4                      ; D3FD   01FC
        ADDI    #$02FC, R4                      ; D3FE   02FC 02FC
        ADDR    R5,     R7                      ; D400   00EF

        DECLE   $02FF,  $02FB,  $01FF,  $01FE   ; D401   02FF 02FB 01FF 01FE
        DECLE   $03FF,  $00FF,  $03FF           ; D405   03FF 00FF 03FF

        ADD@    R5,     R7                      ; D408   02EF
        ADD@    R5,     R7                      ; D409   02EF
        ADDR    R5,     R7                      ; D40A   00EF

        DECLE   $00FF,  $02FB,  $03FB,  $02FB   ; D40B   00FF 02FB 03FB 02FB
        DECLE   $00FF,  $02FF,  $023F           ; D40F   00FF 02FF 023F

        DIS                                     ; D412   0003
        B       L_D415                          ; D413   0200 0000

L_D415:
        TSTR    R0                              ; D415   0080
        SUB@    R2,     R0                      ; D416   0310
        SUBR    R0,     R4                      ; D417   0104
        ADDI    #$00FF, R7                      ; D418   02FF 00FF
        ADDI    #$023F, R7                      ; D41A   02FF 023F

        DECLE   $0303,  $0200,  $0000,  $0000   ; D41C   0303 0200 0000 0000
        DECLE   $03FF                           ; D420   03FF
L_D421:
        ADDI    #$02FF, R7                      ; D421   02FF 02FF

        DECLE   $00FF,  $02FF,  $007F,  $0007   ; D423   00FF 02FF 007F 0007
        DECLE   $0200,  $0380,  $0080,  $00C0   ; D427   0200 0380 0080 00C0
        DECLE   $03C0,  $02C0,  $02E0,  $00E0   ; D42B   03C0 02C0 02E0 00E0
        DECLE   $01E0,  $00FF,  $03FF,  $02BF   ; D42F   01E0 00FF 03FF 02BF
L_D433:
        ADDI    #$01FF, R7                      ; D433   02FF 01FF

        DECLE   $00F7,  $03FF,  $00FD,  $00F0   ; D435   00F7 03FF 00FD 00F0
        DECLE   $00F0,  $03F0,  $02F0,  $00F0   ; D439   00F0 03F0 02F0 00F0
        DECLE   $02F0,  $03F0,  $03E0,  $01FF   ; D43D   02F0 03F0 03E0 01FF
        DECLE   $037F,  $00FF,  $03BF,  $02FF   ; D441   037F 00FF 03BF 02FF

        ADD@    R3,     R7                      ; D445   02DF
        ADDR    R3,     R7                      ; D446   00DF

        DECLE   $00FF,  $00FB,  $00FB,  $03FB   ; D447   00FF 00FB 00FB 03FB
        DECLE   $00FF,  $02FC,  $02FC,  $03FC   ; D44B   00FF 02FC 02FC 03FC
        DECLE   $02FC,  $003F,  $0003,  $0100   ; D44F   02FC 003F 0003 0100
        DECLE   $0200,  $0240,  $0000,  $0204   ; D453   0200 0240 0000 0204
        DECLE   $0000,  $00FF,  $03FF,  $001F   ; D457   0000 00FF 03FF 001F
        DECLE   $0003,  $0300,  $0200,  $0200   ; D45B   0003 0300 0200 0200
        DECLE   $0080,  $02F0,  $01F0,  $03F8   ; D45F   0080 02F0 01F0 03F8
        DECLE   $01F8,  $03F8,  $00F8,  $01FC   ; D463   01F8 03F8 00F8 01FC
        DECLE   $02FC,  $02DF,  $02FF,  $00FB   ; D467   02FC 02DF 02FF 00FB

        ADDI    #$03FF, R7                      ; D46B   02FF 03FF
        ADDI    #$02FF, R7                      ; D46D   02FF 02FF
        ADDI    #$00FF, R7                      ; D46F   02FF 00FF

        DECLE   $03FF,  $02FF,  $00FF,  $007F   ; D471   03FF 02FF 00FF 007F
        DECLE   $03FF,  $01EF                   ; D475   03FF 01EF

        ADDI    #$00FB, R7                      ; D477   02FF 00FB

L_D479:
        ADDI    #$02FB, R3                      ; D479   02FB 02FB
        DECLE   $01FF,  $01FE,  $03FE,  $00FE   ; D47B   01FF 01FE 03FE 00FE
        DECLE   $02FF,  $01BF,  $02BF,  $02BF   ; D47F   02FF 01BF 02BF 02BF
        DECLE   $00FF,  $03EF                   ; D483   00FF 03EF

        ADD@    R5,     R7                      ; D485   02EF
        ADD@    R5,     R7                      ; D486   02EF
        ADDI    #$02FF, R7                      ; D487   02FF 02FF

        CMPR    R7,     R7                      ; D489   017F
        ADD@    R3,     R7                      ; D48A   02DF
        ADDI    #$00FB, R7                      ; D48B   02FF 00FB

        DECLE   $00FF,  $02FE,  $00FF,  $02FF   ; D48D   00FF 02FE 00FF 02FF
        DECLE   $00BF,  $02FF,  $03EF,  $02EF   ; D491   00BF 02FF 03EF 02EF
        DECLE   $01EF,  $03FF,  $00FB,  $03FB   ; D495   01EF 03FF 00FB 03FB
        DECLE   $01FB,  $02FF,  $03FE,  $02FE   ; D499   01FB 02FF 03FE 02FE
        DECLE   $02FE,  $02FF,  $01FF,  $03FF   ; D49D   02FE 02FF 01FF 03FF
        DECLE   $00FF,  $03FF                   ; D4A1   00FF 03FF

        CMPR    R7,     R7                      ; D4A3   017F
        ADD@    R3,     R7                      ; D4A4   02DF

        DECLE   $00FF,  $02F7,  $03FF,  $0180   ; D4A5   00FF 02F7 03FF 0180
        DECLE   $0280,  $0080,  $02C0,  $03C0   ; D4A9   0280 0080 02C0 03C0
        DECLE   $0180,  $0280,  $0080,  $02FF   ; D4AD   0180 0280 0080 02FF
        DECLE   $00FF,  $027F,  $017F,  $037F   ; D4B1   00FF 027F 017F 037F
        DECLE   $00DF,  $03DF,  $01DF,  $02FF   ; D4B5   00DF 03DF 01DF 02FF
        DECLE   $00FF,  $023F                   ; D4B9   00FF 023F

        SUB@    R1,     R7                      ; D4BB   030F
        SUBR    R0,     R7                      ; D4BC   0107
        BC      L_D4BF                          ; D4BD   0201 0000
L_D4BF:
        B       L_D8B8                          ; D4BF   0200 03F7

        DECLE   $01F7,  $02F7,  $00FF,  $02FD   ; D4C1   01F7 02F7 00FF 02FD
        DECLE   $02FD,  $01FD,  $01FF,  $03FF   ; D4C5   02FD 01FD 01FF 03FF
        DECLE   $003F                           ; D4C9   003F

        SUBR    R0,     R3                      ; D4CA   0103
        B       L_D6CD                          ; D4CB   0200 0200

        DECLE   $0000,  $0200                   ; D4CD   0000 0200

        SUBR    R0,     R0                      ; D4CF   0100
        ADDI    #$02FF, R7                      ; D4D0   02FF 02FF

        DECLE   $00FF,  $02FF,  $01BF,  $02BF   ; D4D2   00FF 02FF 01BF 02BF
        DECLE   $02DF,  $00FF,  $02FB,  $03FB   ; D4D6   02DF 00FF 02FB 03FB
        DECLE   $02FD,  $01FF,  $03FF,  $00FF   ; D4DA   02FD 01FF 03FF 00FF
        DECLE   $03FF,  $02FF,  $02EF,  $03EF   ; D4DE   03FF 02FF 02EF 03EF
        DECLE   $00F7,  $03FF,  $01F3,  $02F3   ; D4E2   00F7 03FF 01F3 02F3
        DECLE   $03F3,  $02F1,  $02F9,  $02F9   ; D4E6   03F3 02F1 02F9 02F9
        DECLE   $01FF,  $03FF,  $00FF,  $03FF   ; D4EA   01FF 03FF 00FF 03FF
        DECLE   $01FF,  $02FF,  $00FB,  $00FF   ; D4EE   01FF 02FF 00FB 00FF

        XORI    #$02FF, R6                      ; D4F2   03FE 02FF
        ADDI    #$00FF, R7                      ; D4F4   02FF 00FF

        DECLE   $02FF,  $03FF,  $02FF,  $02FF   ; D4F6   02FF 03FF 02FF 02FF
        DECLE   $00FF,  $00FF,  $03BF,  $01EF   ; D4FA   00FF 00FF 03BF 01EF
        DECLE   $02EF,  $00F7,  $02FF,  $03FB   ; D4FE   02EF 00F7 02FF 03FB
        DECLE   $02FB,  $02FD,  $00FF,  $00FF   ; D502   02FB 02FD 00FF 00FF
        DECLE   $03FF,  $01FF,  $02FF,  $00FF   ; D506   03FF 01FF 02FF 00FF
        DECLE   $02FF,  $00FF,  $02FF,  $017F   ; D50A   02FF 00FF 02FF 017F
        DECLE   $037F,  $00BF,  $03FF,  $01DF   ; D50E   037F 00BF 03FF 01DF

        ADD@    R3,     R7                      ; D512   02DF
        ADDR    R5,     R7                      ; D513   00EF

        DECLE   $00FF,  $03FF                   ; D514   00FF 03FF

        ADD@    R4,     R7                      ; D516   02E7
        ADD@    R4,     R7                      ; D517   02E7

        ADDR    R4,     R3                      ; D518   00E3
L_D519:
        ADD@    R6,     R3                      ; D519   02F3
        XOR@    R6,     R3                      ; D51A   03F3
        ADD@    R6,     R3                      ; D51B   02F3
        ADDI    #$00FF, R7                      ; D51C   02FF 00FF

        DECLE   $00FE,  $03FE,  $017F,  $027F   ; D51E   00FE 03FE 017F 027F
        DECLE   $007F,  $027F,  $03FF,  $02FF   ; D522   007F 027F 03FF 02FF

        ADD@    R1,     R7                      ; D526   02CF
        ADDR    R1,     R7                      ; D527   00CF

        DECLE   $00FF,  $03F7,  $01FF,  $02F7   ; D528   00FF 03F7 01FF 02F7
        DECLE   $00FF,  $02F7,  $02FF,  $01F7   ; D52C   00FF 02F7 02FF 01F7
        DECLE   $01FF,  $03FF,  $00F3,  $01F3   ; D530   01FF 03FF 00F3 01F3
        DECLE   $02F3,  $02F3,  $00F3,  $00F3   ; D534   02F3 02F3 00F3 00F3
        DECLE   $02F3,  $03F3,  $02F3,  $00F3   ; D538   02F3 03F3 02F3 00F3
        DECLE   $02FF,  $02FF,  $03F3,  $02F3   ; D53C   02FF 02FF 03F3 02F3
        DECLE   $00FF,  $003F,  $0103,  $0200   ; D540   00FF 003F 0103 0200
        DECLE   $0280,  $0020,  $0208,  $0200   ; D544   0280 0020 0208 0200
        DECLE   $03FF,  $027F,  $00FF,  $00DF   ; D548   03FF 027F 00FF 00DF
        DECLE   $01FF,  $02F7,  $02FF,  $00FF   ; D54C   01FF 02F7 02FF 00FF
        DECLE   $02FF,  $03FF,  $00BF,  $03FF   ; D550   02FF 03FF 00BF 03FF
        DECLE   $03EF,  $01FF,  $03FB,  $02FF   ; D554   03EF 01FF 03FB 02FF
        DECLE   $02FF                           ; D558   02FF

        XORI    #$01FD, R5                      ; D559   03FD 01FD
        XORI    #$02FF, R5                      ; D55B   03FD 02FF
        XORR    R7,     R6                      ; D55D   01FE
        XORI    #$02FE, R6                      ; D55E   03FE 02FE
        ADDI    #$017F, R7                      ; D560   02FF 017F

        DECLE   $017F,  $037F,  $02FF,  $03BF   ; D562   017F 037F 02FF 03BF
        DECLE   $02BF,  $01BF,  $03FF,  $02FF   ; D566   02BF 01BF 03FF 02FF
        DECLE   $02CF,  $01CF,  $01CF,  $03CF   ; D56A   02CF 01CF 01CF 03CF
        DECLE   $02CF,  $03CF                   ; D56E   02CF 03CF
L_D570:
        ADDI    #$01FF, R7                      ; D570   02FF 01FF

        XORI    #$02FC, R4                      ; D572   03FC 02FC
L_D574:
        XORI    #$03FC, R4                      ; D574   03FC 03FC
        DECLE   $03FC,  $00FC,  $00FF,  $03FD   ; D576   03FC 00FC 00FF 03FD
        DECLE   $01FF,  $01FD,  $00FD,  $00FD   ; D57A   01FF 01FD 00FD 00FD
        DECLE   $01FF,  $00FE,  $02BF,  $03BF   ; D57E   01FF 00FE 02BF 03BF
        DECLE   $00BF,  $02BF,  $01FF,  $02FF   ; D582   00BF 02BF 01FF 02FF
        DECLE   $03CF                           ; D586   03CF

        ADDR    R1,     R7                      ; D587   00CF
L_D588:
        ADD@    R1,     R7                      ; D588   02CF

        DECLE   $01CF,  $02CF,  $03CF,  $02FF   ; D589   01CF 02CF 03CF 02FF
        DECLE   $00FF,  $01F3,  $02F3,  $03F3   ; D58D   00FF 01F3 02F3 03F3
        DECLE   $00F3,  $01F3,  $00F3,  $02FF   ; D591   00F3 01F3 00F3 02FF
        DECLE   $00FF                           ; D595   00FF

        ADDR    R7,     R4                      ; D596   00FC
        ADDI    #$01FF, R4                      ; D597   02FC 01FF
        ADD@    R3,     R7                      ; D599   02DF

        DECLE   $00FF,  $02FB,  $02FD,  $01FE   ; D59A   00FF 02FB 02FD 01FE
        DECLE   $02FF,  $00FF,  $00FF,  $01FF   ; D59E   02FF 00FF 00FF 01FF
        DECLE   $00FF,  $02FF,  $00FF,  $02FF   ; D5A2   00FF 02FF 00FF 02FF
        DECLE   $02DF,  $01EF,  $02FF,  $00FF   ; D5A6   02DF 01EF 02FF 00FF
        DECLE   $00FF,  $017F,  $00BF,  $02FF   ; D5AA   00FF 017F 00BF 02FF
        DECLE   $00FF                           ; D5AE   00FF

        ADD@    R6,     R7                      ; D5AF   02F7

        CMPI    #$031F, R7                      ; D5B0   037F 031F
        SUBR    R0,     R7                      ; D5B2   0107

        DECLE   $0303,  $0000,  $0100,  $0000   ; D5B3   0303 0000 0100 0000
        DECLE   $0200,  $03FF,  $00FF,  $00FF   ; D5B7   0200 03FF 00FF 00FF
        DECLE   $02FF,  $023F,  $003F           ; D5BB   02FF 023F 003F

        MVI@    R3,     R7                      ; D5BE   029F
        MOVR    R3,     R7                      ; D5BF   009F

        DECLE   $01CF,  $02CF,  $00FF           ; D5C0   01CF 02CF 00FF

        ADDI    #$01F3, R7                      ; D5C3   02FF 01F3

        ADDR    R6,     R3                      ; D5C5   00F3
        ADDI    #$00F9, R1                      ; D5C6   02F9 00F9
        ADD@    R6,     R7                      ; D5C8   02F7

        DECLE   $00FB,  $03FF,  $01FF,  $03FF   ; D5C9   00FB 03FF 01FF 03FF
        DECLE   $00FF,  $03FF,  $03FF,  $01FF   ; D5CD   00FF 03FF 03FF 01FF
        DECLE   $03FF,  $00FF,  $03FF,  $03FF   ; D5D1   03FF 00FF 03FF 03FF
        DECLE   $01FF                           ; D5D5   01FF

        MOVR    R3,     R7                      ; D5D6   009F
        MVI@    R3,     R7                      ; D5D7   029F

        DECLE   $01CF                           ; D5D8   01CF

        ADDR    R1,     R7                      ; D5D9   00CF
        ADD@    R4,     R7                      ; D5DA   02E7
        ADDR    R4,     R7                      ; D5DB   00E7
        ADDI    #$00FF, R7                      ; D5DC   02FF 00FF

        DECLE   $01F3,  $02F3,  $00F9,  $02F9   ; D5DE   01F3 02F3 00F9 02F9
        DECLE   $02F9,  $01F9,  $02FF,  $03FF   ; D5E2   02F9 01F9 02FF 03FF

        ADDR    R7,     R1                      ; D5E6   00F9
        ADDI    #$01FF, R1                      ; D5E7   02F9 01FF
        ADD@    R5,     R7                      ; D5E9   02EF
        ADD@    R6,     R7                      ; D5EA   02F7

        DECLE   $00FB,  $01FF,  $00FF           ; D5EB   00FB 01FF 00FF

        ADDI    #$02FF, R7                      ; D5EE   02FF 02FF
        ADDI    #$02FF, R7                      ; D5F0   02FF 02FF

        DECLE   $01FF                           ; D5F2   01FF

        ADDI    #$00BF, R7                      ; D5F3   02FF 00BF
L_D5F5:
        ADDR    R3,     R7                      ; D5F5   00DF

        DECLE   $01EF,  $00FF,  $02FC,  $00FC   ; D5F6   01EF 00FF 02FC 00FC
        DECLE   $02FE,  $00FE,  $01FF,  $02FF   ; D5FA   02FE 00FE 01FF 02FF
        DECLE   $03FF,  $00FF,  $03FF,  $03FF   ; D5FE   03FF 00FF 03FF 03FF
        DECLE   $017F,  $007F,  $003F,  $003F   ; D602   017F 007F 003F 003F
        DECLE   $02FF                           ; D606   02FF

        ADDI    #$00CF, R7                      ; D607   02FF 00CF
        ADD@    R1,     R7                      ; D609   02CF
        ADDR    R4,     R7                      ; D60A   00E7

        DECLE   $01E7,  $02F3,  $00F3,  $00FF   ; D60B   01E7 02F3 00F3 00FF
        DECLE   $00FF,  $03F9,  $01F9,  $00F9   ; D60F   00FF 03F9 01F9 00F9
        DECLE   $02F8,  $01FC,  $00FC,  $02FF   ; D613   02F8 01FC 00FC 02FF
        DECLE   $00FF,  $00FF,  $02FF,  $02FF   ; D617   00FF 00FF 02FF 02FF
        DECLE   $017F,  $00FF                   ; D61B   017F 00FF
L_D61D:
        ADD@    R3,     R7                      ; D61D   02DF

        DECLE   $01EF,  $00F7,  $02FF,  $03FF   ; D61E   01EF 00F7 02FF 03FF

        ADDR    R4,     R7                      ; D622   00E7
        ADDR    R4,     R7                      ; D623   00E7

        DECLE   $03F3,  $01F3,  $00F9,  $00F9   ; D624   03F3 01F3 00F9 00F9
        DECLE   $03FF,  $03FF,  $01F9,  $00F9   ; D628   03FF 03FF 01F9 00F9
        DECLE   $02F9,  $01F8,  $00FC,  $02FC   ; D62C   02F9 01F8 00FC 02FC
        DECLE   $00FF,  $00FF,  $033F           ; D630   00FF 00FF 033F

        SUB@    R3,     R7                      ; D633   031F
L_D634:
        SUBR    R1,     R7                      ; D634   010F

        DECLE   $0007,  $0203,  $0001,  $01FF   ; D635   0007 0203 0001 01FF
        DECLE   $027F,  $003F,  $003F,  $010F   ; D639   027F 003F 003F 010F
        DECLE   $0007,  $0203,  $0001,  $02FF   ; D63D   0007 0203 0001 02FF

        CMPI    #$033F, R7                      ; D641   037F 033F
        SUBR    R3,     R7                      ; D643   011F
        SUB@    R1,     R7                      ; D644   030F
        INCR    R7                              ; D645   000F

        DIS                                     ; D646   0003
L_D647:
        SUBR    R0,     R1                      ; D647   0101
        ADDI    #$007F, R7                      ; D648   02FF 007F

        DECLE   $003F,  $021F,  $010F,  $0207   ; D64A   003F 021F 010F 0207
        DECLE   $0003,  $0203,  $01FF,  $02FF   ; D64E   0003 0203 01FF 02FF

        ADDI    #$00F8, R4                      ; D652   02FC 00F8
        ADDR    R6,     R0                      ; D654   00F0
        ADDR    R4,     R0                      ; D655   00E0
        CLRR    R0                              ; D656   01C0
        MVI     .PSG1.lft_hand,R0               ; D657   0280 00FF
        ADDI    #$03FC, R6                      ; D659   02FE 03FC
L_D65B:
        ADDI    #$02F0, R4                      ; D65B   02FC 02F0
        ADDR    R4,     R0                      ; D65D   00E0
L_D65E:
        ADDR    R0,     R0                      ; D65E   00C0
        DECLE   $0180,  $02FF,  $02FE,  $00FC   ; D65F   0180 02FF 02FE 00FC
        DECLE   $02F8,  $01F0,  $03F0,  $02C0   ; D663   02F8 01F0 03F0 02C0
        DECLE   $0380,  $00FF                   ; D667   0380 00FF

        ADDR    R7,     R6                      ; D669   00FE
        ADDI    #$02F8, R4                      ; D66A   02FC 02F8
        XOR@    R6,     R0                      ; D66C   03F0
        ADDR    R4,     R0                      ; D66D   00E0
        CLRR    R0                              ; D66E   01C0
        ADDR    R0,     R0                      ; D66F   00C0
        ADDI    #$03FF, R7                      ; D670   02FF 03FF
        ADDI    #$03FF, R7                      ; D672   02FF 03FF

        XORI    #$03F8, R4                      ; D674   03FC 03F8
L_D676:
        ADDR    R6,     R0                      ; D676   00F0
        DECLE   $00E0,  $03FF,  $01FF,  $01FF   ; D677   00E0 03FF 01FF 01FF
        DECLE   $00FE,  $00FC,  $01FC,  $02F0   ; D67B   00FE 00FC 01FC 02F0
        DECLE   $02E0,  $01FF,  $01FF,  $02FF   ; D67F   02E0 01FF 01FF 02FF
        DECLE   $00FE,  $02FC,  $01F8,  $01F0   ; D683   00FE 02FC 01F8 01F0
        DECLE   $01F0,  $003B,  $027F,  $01FB   ; D687   01F0 003B 027F 01FB
        DECLE   $03FF,  $01FB,  $02FF,  $02FB   ; D68B   03FF 01FB 02FF 02FB
        DECLE   $02FF,  $007F,  $021F,  $000F   ; D68F   02FF 007F 021F 000F
        DECLE   $0207,  $0203,  $0001,  $0100   ; D693   0207 0203 0001 0100
        DECLE   $0000                           ; D697   0000

        ADDI    #$02FF, R3                      ; D698   02FB 02FF
        ADDI    #$01FF, R3                      ; D69A   02FB 01FF
        ADDI    #$02FF, R3                      ; D69C   02FB 02FF
        ADDI    #$00FF, R3                      ; D69E   02FB 00FF
        ADD@    R4,     R0                      ; D6A0   02E0
        TSTR    R0                              ; D6A1   0080
        B       L_D8A4                          ; D6A2   0200 0200

        DECLE   $0000,  $0100,  $0000,  $0200   ; D6A4   0000 0100 0000 0200
        DECLE   $02F3,  $02F3,  $02F3,  $02F3   ; D6A8   02F3 02F3 02F3 02F3
        DECLE   $02F3,  $02F3,  $00FF,  $03FF   ; D6AC   02F3 02F3 00FF 03FF

        ADDR    R6,     R1                      ; D6B0   00F1
        ADD@    R4,     R0                      ; D6B1   02E0
        ADD     .IV.ALD,R1                      ; D6B2   02C1 0080
L_D6B4:
        BC      L_D6B6                          ; D6B4   0201 0000
L_D6B6:
        BC      L_D8B8                          ; D6B6   0201 0200

        DECLE   $020F,  $0207,  $0203,  $0201   ; D6B8   020F 0207 0203 0201
        DECLE   $0201,  $0000,  $0300,  $0000   ; D6BC   0201 0000 0300 0000
        DECLE   $02FE,  $02FF,  $00FE,  $02FF   ; D6C0   02FE 02FF 00FE 02FF
        DECLE   $00FE,  $02FF                   ; D6C4   00FE 02FF

        ADDI    #$02FF, R6                      ; D6C6   02FE 02FF
        XOR@    R6,     R0                      ; D6C8   03F0
L_D6C9:
        ADD@    R4,     R0                      ; D6C9   02E0
        ADD     .BTAB.80,R0                     ; D6CA   02C0 0280
        TSTR    R0                              ; D6CC   0080
L_D6CD:
        SUB     .STIC.X.0,R0                    ; D6CD   0300 0000
        B       L_D9CD                          ; D6CF   0200 02FC

        DECLE   $00FC,  $00FF,  $01FF           ; D6D1   00FC 00FF 01FF

        ADDI    #$02FC, R4                      ; D6D4   02FC 02FC
        ADDI    #$03FC, R4                      ; D6D6   02FC 03FC
L_D6D8:
        MVO     R3,     .BTAB.01                ; D6D8   0243 0201
        MVO     R0,     .STIC.X.0               ; D6DA   0240 0000
        SWAP    R0,     1                       ; D6DC   0040
L_D6DD:
        SUBR    R0,     R0                      ; D6DD   0100
        MVO     R0,     .BTAB.00                ; D6DE   0240 0200
        SETC                                    ; D6E0   0007
L_D6E1:
        SUB     .STIC.X.0,R1                    ; D6E1   0301 0000
        DECLE   $0200,  $0200,  $0200,  $0000   ; D6E3   0200 0200 0200 0000
        DECLE   $0300,  $02BF,  $00FF,  $01BF   ; D6E7   0300 02BF 00FF 01BF
        DECLE   $01FF,  $01BF,  $02FF,  $00BF   ; D6EB   01FF 01BF 02FF 00BF
        DECLE   $01FF,  $00FE,  $01F8,  $02F0   ; D6EF   01FF 00FE 01F8 02F0
        DECLE   $00E0,  $03C0,  $0080,  $0300   ; D6F3   00E0 03C0 0080 0300
        DECLE   $0200,  $023F,  $003F,  $013F   ; D6F7   0200 023F 003F 013F
        DECLE   $013F,  $023F,  $023F,  $00FF   ; D6FB   013F 023F 023F 00FF
        DECLE   $00FF,  $01EF,  $02FF,  $02EF   ; D6FF   00FF 01EF 02FF 02EF
        DECLE   $02FF,  $01EF,  $03FF,  $02EF   ; D703   02FF 01EF 03FF 02EF
        DECLE   $03FF,  $01CF,  $02CF,  $01FF   ; D707   03FF 01CF 02CF 01FF
        DECLE   $02FF,  $03CF,  $01CF,  $01CF   ; D70B   02FF 03CF 01CF 01CF
        DECLE   $01CF,  $02C4,  $0380,  $0304   ; D70F   01CF 02C4 0380 0304
        DECLE   $0300,  $0304,  $0300,  $0004   ; D713   0300 0304 0300 0004
        DECLE   $0000                           ; D717   0000

        ADDR    R1,     R7                      ; D718   00CF
        ADDR    R1,     R7                      ; D719   00CF
        ADDR    R1,     R7                      ; D71A   00CF
        ADDR    R1,     R7                      ; D71B   00CF
        ADDR    R1,     R7                      ; D71C   00CF
        ADDR    R1,     R7                      ; D71D   00CF

        DECLE   $00FF,  $00FF                   ; D71E   00FF 00FF

        ADDR    R6,     R1                      ; D720   00F1
        ADDR    R4,     R0                      ; D721   00E0
L_D722:
        ADDR    R0,     R2                      ; D722   00C2
        DECLE   $0080,  $0004,  $0000,  $0004   ; D723   0080 0004 0000 0004
        DECLE   $0000,  $00F7,  $00FF,  $00F7   ; D727   0000 00F7 00FF 00F7
        DECLE   $00FF,  $00F7,  $00FF,  $00F7   ; D72B   00FF 00F7 00FF 00F7
        DECLE   $00FF,  $0023,  $0001,  $0040   ; D72F   00FF 0023 0001 0040
        DECLE   $0000,  $0080,  $0000,  $0080   ; D733   0000 0080 0000 0080
        DECLE   $0000,  $00EF,  $00FF,  $00EF   ; D737   0000 00EF 00FF 00EF
        DECLE   $00FF,  $00DF,  $00FF,  $00DF   ; D73B   00FF 00DF 00FF 00DF
        DECLE   $00FF,  $00BF,  $00FF,  $00BF   ; D73F   00FF 00BF 00FF 00BF
        DECLE   $00FF,  $007F,  $00FF,  $007F   ; D743   00FF 007F 00FF 007F
        DECLE   $00FF,  $00FE,  $00FF,  $00FE   ; D747   00FF 00FE 00FF 00FE
        DECLE   $00FE,  $00FE,  $00FF,  $00FD   ; D74B   00FE 00FE 00FF 00FD
        DECLE   $00FD,  $00FD,  $00FF,  $00FB   ; D74F   00FD 00FD 00FF 00FB
        DECLE   $00FB,  $00FB,  $00FF,  $00F7   ; D753   00FB 00FB 00FF 00F7
        DECLE   $00F7,  $00F7,  $00F7,  $00FF   ; D757   00F7 00F7 00F7 00FF
        DECLE   $00FF                           ; D75B   00FF

        ADDR    R4,     R7                      ; D75C   00E7
        ADDR    R4,     R7                      ; D75D   00E7
        ADDR    R4,     R7                      ; D75E   00E7
        ADDR    R4,     R7                      ; D75F   00E7
        ADDR    R4,     R7                      ; D760   00E7
        ADDR    R4,     R7                      ; D761   00E7

        DECLE   $00FF,  $00FF                   ; D762   00FF 00FF

        ADDR    R1,     R7                      ; D764   00CF
        ADDR    R1,     R7                      ; D765   00CF
        ADDR    R1,     R7                      ; D766   00CF
        ADDR    R1,     R7                      ; D767   00CF

        DECLE   $00C4,  $0080,  $0004,  $0000   ; D768   00C4 0080 0004 0000
        DECLE   $0008,  $0000                   ; D76C   0008 0000
L_D76E:
        INCR    R0                              ; D76E   0008
        DECLE   $0000                           ; D76F   0000

        ADDR    R7,     R6                      ; D770   00FE
L_D771:
        ADDR    R7,     R6                      ; D771   00FE
        DECLE   $00FE,  $00FF,  $00FD,  $00FD   ; D772   00FE 00FF 00FD 00FD
        DECLE   $00FD,  $00FF                   ; D776   00FD 00FF

        ADDR    R4,     R7                      ; D778   00E7
        ADDR    R4,     R7                      ; D779   00E7
        ADDR    R4,     R7                      ; D77A   00E7
        ADDR    R4,     R7                      ; D77B   00E7
        ADDR    R4,     R7                      ; D77C   00E7
        ADDR    R4,     R7                      ; D77D   00E7

        DECLE   $00FF,  $00FF,  $00F1,  $00E0   ; D77E   00FF 00FF 00F1 00E0
        DECLE   $00C1,  $0080,  $0002,  $0000   ; D782   00C1 0080 0002 0000
        DECLE   $0002,  $0000                   ; D786   0002 0000
L_D788:
        ADDR    R7,     R3                      ; D788   00FB
        DECLE   $00FF,  $00FB,  $00FF,  $00F7   ; D789   00FF 00FB 00FF 00F7
        DECLE   $00FF,  $00F7,  $00FF,  $00F7   ; D78D   00FF 00F7 00FF 00F7
        DECLE   $00FF                           ; D791   00FF

        ADDR    R5,     R7                      ; D792   00EF
        ADDR    R5,     R7                      ; D793   00EF
        ADDR    R5,     R7                      ; D794   00EF

        DECLE   $00FF                           ; D795   00FF

        ADDR    R3,     R7                      ; D796   00DF
        ADDR    R3,     R7                      ; D797   00DF
        ADDR    R3,     R7                      ; D798   00DF

        DECLE   $00FF,  $00BF,  $00BF,  $00BF   ; D799   00FF 00BF 00BF 00BF
        DECLE   $00FF,  $007F,  $007F,  $007F   ; D79D   00FF 007F 007F 007F
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; D7A1   007F 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D7A5   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FC   ; D7A9   00FF 00FF 00FF 00FC
        DECLE   $00FC,  $00FC,  $00FC,  $00FC   ; D7AD   00FC 00FC 00FC 00FC
        DECLE   $00FC,  $00FF,  $00FF           ; D7B1   00FC 00FF 00FF

        ADDR    R6,     R3                      ; D7B4   00F3
        ADDR    R6,     R3                      ; D7B5   00F3
        ADDR    R6,     R3                      ; D7B6   00F3
        ADDR    R6,     R3                      ; D7B7   00F3
L_D7B8:
        ADDR    R6,     R3                      ; D7B8   00F3
        DECLE   $00F3,  $00FF,  $00FF           ; D7B9   00F3 00FF 00FF

        ADDR    R1,     R7                      ; D7BC   00CF
        ADDR    R1,     R7                      ; D7BD   00CF
        ADDR    R1,     R7                      ; D7BE   00CF
        ADDR    R1,     R7                      ; D7BF   00CF

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D7C0   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $003F,  $001F   ; D7C4   00FF 00FF 003F 001F
        DECLE   $0047,  $0003,  $0043,  $0001   ; D7C8   0047 0003 0043 0001
        DECLE   $0080,  $0000,  $0080,  $0000   ; D7CC   0080 0000 0080 0000

        ADDR    R7,     R4                      ; D7D0   00FC
L_D7D1:
        ADDR    R6,     R0                      ; D7D1   00F0
        DECLE   $00C0,  $0080,  $0000,  $0000   ; D7D2   00C0 0080 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; D7D6   0000 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D7DA   00FF 00FF 00FF 00FF
        DECLE   $00FC,  $00F8,  $00FC,  $00FC   ; D7DE   00FC 00F8 00FC 00FC
        DECLE   $00FC,  $00FC,  $00FC,  $00FC   ; D7E2   00FC 00FC 00FC 00FC
        DECLE   $00FF,  $00FF,  $0010,  $0001   ; D7E6   00FF 00FF 0010 0001
        DECLE   $0011,  $0001,  $0020,  $0000   ; D7EA   0011 0001 0020 0000
        DECLE   $0020,  $0000                   ; D7EE   0020 0000

        ADDR    R1,     R7                      ; D7F0   00CF
        ADDR    R1,     R7                      ; D7F1   00CF

        DECLE   $00FF,  $00FF,  $003F,  $003F   ; D7F2   00FF 00FF 003F 003F
        DECLE   $003F,  $003F,  $001F,  $001F   ; D7F6   003F 003F 001F 001F
        DECLE   $003F,  $003F,  $007F,  $003F   ; D7FA   003F 003F 007F 003F
        DECLE   $003F,  $001F,  $00C2,  $0000   ; D7FE   003F 001F 00C2 0000
        DECLE   $0008,  $0000,  $0010,  $0000   ; D802   0008 0000 0010 0000
        DECLE   $0020,  $0000,  $0021,  $0001   ; D806   0020 0000 0021 0001

        MOVR    R0,     R3                      ; D80A   0083
        DIS                                     ; D80B   0003
        SETC                                    ; D80C   0007
        SETC                                    ; D80D   0007
        INCR    R7                              ; D80E   000F
        INCR    R7                              ; D80F   000F

L_D810:
        ADDR    R7,     R4                      ; D810   00FC
L_D811:
        ADDR    R6,     R0                      ; D811   00F0
        DECLE   $00C0,  $0000,  $0002,  $0000   ; D812   00C0 0000 0002 0000
        DECLE   $0008,  $0000,  $00FF,  $00FF   ; D816   0008 0000 00FF 00FF
        DECLE   $00FF,  $00FF                   ; D81A   00FF 00FF

        ADDR    R7,     R4                      ; D81C   00FC
        ADDR    R6,     R0                      ; D81D   00F0
        ADDR    R0,     R0                      ; D81E   00C0
        TSTR    R0                              ; D81F   0080
        ADDR    R5,     R7                      ; D820   00EF

        DECLE   $00FF,  $00DF,  $00FF,  $00BF   ; D821   00FF 00DF 00FF 00BF
        DECLE   $00FF,  $00BF,  $00FF,  $007F   ; D825   00FF 00BF 00FF 007F
        DECLE   $007F,  $00FF,  $007F,  $007F   ; D829   007F 00FF 007F 007F
        DECLE   $00FF,  $007F,  $007F,  $00FF   ; D82D   00FF 007F 007F 00FF
        DECLE   $00FE,  $00FE,  $00FE,  $00FE   ; D831   00FE 00FE 00FE 00FE
        DECLE   $00FF                           ; D835   00FF

        ADDR    R7,     R6                      ; D836   00FE
        ADDR    R7,     R6                      ; D837   00FE
        ADDR    R0,     R1                      ; D838   00C1

        JSR     R4,     X_RESET                 ; D839   0004 0010 0000
        DECLE   $0040,  $0000,  $0000,  $0000   ; D83C   0040 0000 0000 0000
        DECLE   $00FF,  $00FE,  $00F0,  $0080   ; D840   00FF 00FE 00F0 0080
        DECLE   $0000,  $0000,  $0001,  $0000   ; D844   0000 0000 0001 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D848   00FF 00FF 00FF 00FF
        DECLE   $00FE,  $00F8,  $00E0,  $0080   ; D84C   00FE 00F8 00E0 0080
        DECLE   $00FF,  $00FF,  $00FF,  $007F   ; D850   00FF 00FF 00FF 007F
        DECLE   $007F,  $003F,  $003F,  $001F   ; D854   007F 003F 003F 001F
        DECLE   $00F9,  $00F9,  $00F9,  $00F9   ; D858   00F9 00F9 00F9 00F9
        DECLE   $00F9,  $00F9,  $00FF,  $00FF   ; D85C   00F9 00F9 00FF 00FF
        DECLE   $00F8,  $00C0,  $0002,  $0000   ; D860   00F8 00C0 0002 0000
        DECLE   $0010,  $0000,  $0040,  $0000   ; D864   0010 0000 0040 0000
        DECLE   $000F,  $001F,  $001F,  $001F   ; D868   000F 001F 001F 001F
L_D86C:
        INCR    R7                              ; D86C   000F
        INCR    R7                              ; D86D   000F

L_D86E:
        SETC                                    ; D86E   0007
L_D86F:
        SETC                                    ; D86F   0007
        DECLE   $00FF,  $00FF,  $00FE,  $00FF   ; D870   00FF 00FF 00FE 00FF
        DECLE   $00FD,  $00FF,  $00FD,  $00FF   ; D874   00FD 00FF 00FD 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $007F   ; D878   00FF 00FF 00FF 007F
        DECLE   $007F,  $001F                   ; D87C   007F 001F

        INCR    R7                              ; D87E   000F

        SETC                                    ; D87F   0007
L_D880:
        ADDR    R3,     R7                      ; D880   00DF
        ADDR    R3,     R7                      ; D881   00DF

        DECLE   $00FF,  $00FF                   ; D882   00FF 00FF

        MOVR    R3,     R7                      ; D884   009F
        MOVR    R3,     R7                      ; D885   009F
        MOVR    R3,     R7                      ; D886   009F
        MOVR    R3,     R7                      ; D887   009F
        MOVR    R3,     R7                      ; D888   009F
        MOVR    R3,     R7                      ; D889   009F

        DECLE   $00FF,  $00FF,  $003F,  $003F   ; D88A   00FF 00FF 003F 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; D88E   003F 003F 003F 003F
        DECLE   $00FF,  $00FF,  $007F,  $007F   ; D892   00FF 00FF 007F 007F
        DECLE   $007F,  $007F,  $00FF,  $00FF   ; D896   007F 007F 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FE,  $00FE   ; D89A   00FF 00FF 00FE 00FE
        DECLE   $00FE,  $00FE,  $00C0,  $0002   ; D89E   00FE 00FE 00C0 0002
        DECLE   $0008,  $0000                   ; D8A2   0008 0000
L_D8A4:
        SWAP    R0,     1                       ; D8A4   0040
        DECLE   $0000,  $0000,  $0000,  $00FF   ; D8A5   0000 0000 0000 00FF
        DECLE   $00FE,  $00F0,  $0000,  $0000   ; D8A9   00FE 00F0 0000 0000
        DECLE   $0000,  $0002,  $0000,  $00F7   ; D8AD   0000 0002 0000 00F7
        DECLE   $00FF,  $00DF,  $00FF,  $00BF   ; D8B1   00FF 00DF 00FF 00BF
        DECLE   $00FF,  $007F,  $00FF           ; D8B5   00FF 007F 00FF
L_D8B8:
        SARC    R3,     2                       ; D8B8   007F
        DECLE   $007F,  $003F,  $003F,  $001F   ; D8B9   007F 003F 003F 001F
        DECLE   $001F                           ; D8BD   001F

        INCR    R7                              ; D8BE   000F

        SETC                                    ; D8BF   0007
L_D8C0:
        ADDR    R7,     R4                      ; D8C0   00FC
        DECLE   $00C0,  $0001,  $0004,  $0000   ; D8C1   00C0 0001 0004 0000
        DECLE   $0010,  $0040,  $0000,  $00FF   ; D8C5   0010 0040 0000 00FF
        DECLE   $00FF,  $00FC,  $00E0,  $0000   ; D8C9   00FF 00FC 00E0 0000
        DECLE   $0000,  $0000,  $0000,  $001F   ; D8CD   0000 0000 0000 001F
        DECLE   $001F,  $001F,  $001F,  $001F   ; D8D1   001F 001F 001F 001F
        DECLE   $000F,  $000F,  $000F,  $00FD   ; D8D5   000F 000F 000F 00FD
        DECLE   $00FF,  $00F7,  $00FF,  $00DF   ; D8D9   00FF 00F7 00FF 00DF
        DECLE   $00FF,  $007F,  $00FF,  $00FD   ; D8DD   00FF 007F 00FF 00FD
        DECLE   $00FF,  $00FD,  $00FD,  $00FD   ; D8E1   00FF 00FD 00FD 00FD
        DECLE   $00FF,  $00FB,  $00FB,  $00FB   ; D8E5   00FF 00FB 00FB 00FB
        DECLE   $00FB,  $00FF,  $00FF           ; D8E9   00FB 00FF 00FF

        ADDR    R6,     R3                      ; D8EC   00F3
        ADDR    R6,     R3                      ; D8ED   00F3
        ADDR    R6,     R3                      ; D8EE   00F3
L_D8EF:
        ADDR    R6,     R3                      ; D8EF   00F3
        DECLE   $00FF                           ; D8F0   00FF
L_D8F1:
        ADDR    R7,     R6                      ; D8F1   00FE
        DECLE   $00E0,  $0000,  $0001,  $0000   ; D8F2   00E0 0000 0001 0000
        DECLE   $0008,  $0000,  $00FF,  $00FF   ; D8F6   0008 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00F8,  $00C0   ; D8FA   00FF 00FF 00F8 00C0
        DECLE   $0000,  $0000,  $00BF,  $00FF   ; D8FE   0000 0000 00BF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D902   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D906   00FF 00FF 00FF 00FF
        DECLE   $00FC,  $00F8,  $00E0,  $00C0   ; D90A   00FC 00F8 00E0 00C0
        DECLE   $0080,  $0000,  $00F7,  $00F7   ; D90E   0080 0000 00F7 00F7
        DECLE   $00F7,  $00FF                   ; D912   00F7 00FF

        ADDR    R5,     R7                      ; D914   00EF
        ADDR    R5,     R7                      ; D915   00EF
        ADDR    R5,     R7                      ; D916   00EF

        DECLE   $00FF                           ; D917   00FF

        ADDR    R3,     R7                      ; D918   00DF
        ADDR    R3,     R7                      ; D919   00DF
        ADDR    R3,     R7                      ; D91A   00DF

        DECLE   $00FF,  $00BF,  $00BF,  $00BF   ; D91B   00FF 00BF 00BF 00BF
        DECLE   $00FF,  $00FC,  $00C0,  $0000   ; D91F   00FF 00FC 00C0 0000
        DECLE   $0002,  $0010,  $0000,  $0080   ; D923   0002 0010 0000 0080
        DECLE   $0000,  $00FB,  $00FF,  $00EF   ; D927   0000 00FB 00FF 00EF
        DECLE   $00FF,  $00BF,  $00FF,  $007F   ; D92B   00FF 00BF 00FF 007F
        DECLE   $00FF,  $00FB,  $00FF,  $00F7   ; D92F   00FF 00FB 00FF 00F7
        DECLE   $00F7,  $00F7,  $00FF           ; D933   00F7 00F7 00FF

        ADDR    R5,     R7                      ; D936   00EF
        ADDR    R5,     R7                      ; D937   00EF
        ADDR    R5,     R7                      ; D938   00EF

        DECLE   $00FF,  $00FF                   ; D939   00FF 00FF

        ADDR    R1,     R7                      ; D93B   00CF
        ADDR    R1,     R7                      ; D93C   00CF
        ADDR    R1,     R7                      ; D93D   00CF
        ADDR    R1,     R7                      ; D93E   00CF
        ADDR    R1,     R7                      ; D93F   00CF

        DECLE   $00FC,  $00C0,  $0000,  $0000   ; D940   00FC 00C0 0000 0000
        DECLE   $0008,  $0040,  $0000,  $0000   ; D944   0008 0040 0000 0000
        DECLE   $000F,  $001F,  $001F,  $001F   ; D948   000F 001F 001F 001F
        DECLE   $003F,  $003F,  $003F,  $003F   ; D94C   003F 003F 003F 003F
        DECLE   $00F7,  $00FF,  $00DF,  $00FF   ; D950   00F7 00FF 00DF 00FF
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; D954   007F 00FF 00FF 00FF
        DECLE   $00F7,  $00F7,  $00F7,  $00FF   ; D958   00F7 00F7 00F7 00FF

        ADDR    R3,     R7                      ; D95C   00DF
        ADDR    R3,     R7                      ; D95D   00DF
        ADDR    R3,     R7                      ; D95E   00DF

        DECLE   $00FF,  $00FF,  $00FC,  $00C0   ; D95F   00FF 00FF 00FC 00C0
        DECLE   $0000,  $0000,  $0001,  $0008   ; D963   0000 0000 0001 0008
        DECLE   $0020,  $00FF,  $00FF,  $00FF   ; D967   0020 00FF 00FF 00FF
        DECLE   $00FC,  $00C0,  $0000,  $0000   ; D96B   00FC 00C0 0000 0000
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; D96F   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FE,  $00E0   ; D973   00FF 00FF 00FE 00E0
        DECLE   $0000,  $0001,  $0001,  $0003   ; D977   0000 0001 0001 0003
        DECLE   $0003,  $0003,  $0007,  $0007   ; D97B   0003 0003 0007 0007
        DECLE   $0007,  $00FF,  $00FF,  $00FD   ; D97F   0007 00FF 00FF 00FD
        DECLE   $00FF,  $00FF,  $00EF,  $00FF   ; D983   00FF 00FF 00EF 00FF
        DECLE   $00BF,  $000F,  $000F,  $000F   ; D987   00BF 000F 000F 000F
        DECLE   $000F,  $000F,  $000F,  $000F   ; D98B   000F 000F 000F 000F
        DECLE   $0007,  $00FF,  $00FE,  $00FF   ; D98F   0007 00FF 00FE 00FF
        DECLE   $00FD,  $00FF,  $00FB,  $00FB   ; D993   00FD 00FF 00FB 00FB
        DECLE   $00FF                           ; D997   00FF

        ADDR    R3,     R7                      ; D998   00DF
        ADDR    R3,     R7                      ; D999   00DF
        ADDR    R3,     R7                      ; D99A   00DF

        DECLE   $00FF,  $003F,  $003F,  $003F   ; D99B   00FF 003F 003F 003F
        DECLE   $003F,  $00FC,  $00C0,  $0000   ; D99F   003F 00FC 00C0 0000
        DECLE   $0000,  $0002,  $0000,  $0020   ; D9A3   0000 0002 0000 0020
        DECLE   $0000,  $00FF,  $00FF,  $00F8   ; D9A7   0000 00FF 00FF 00F8
        DECLE   $00C0,  $0000,  $0000,  $0000   ; D9AB   00C0 0000 0000 0000
        DECLE   $0001,  $000F,  $000F,  $001F   ; D9AF   0001 000F 000F 001F
        DECLE   $001F,  $001F,  $001F,  $003F   ; D9B3   001F 001F 001F 003F
        DECLE   $003F,  $00FB,  $00FF,  $00DF   ; D9B7   003F 00FB 00FF 00DF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D9BB   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D9BF   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FE,  $00FF,  $00F7   ; D9C3   00FF 00FE 00FF 00F7
        DECLE   $00FF                           ; D9C7   00FF

        ADDR    R3,     R7                      ; D9C8   00DF
        ADDR    R3,     R7                      ; D9C9   00DF
        ADDR    R3,     R7                      ; D9CA   00DF

        DECLE   $00FF                           ; D9CB   00FF

        SARC    R3,     2                       ; D9CC   007F
L_D9CD:
        SARC    R3,     2                       ; D9CD   007F
        DECLE   $007F,  $00FF,  $00FD,  $00FD   ; D9CE   007F 00FF 00FD 00FD
        DECLE   $00FD,  $00FF,  $00F7,  $00F7   ; D9D2   00FD 00FF 00F7 00F7
        DECLE   $00F7,  $00FF,  $00FF,  $00FE   ; D9D6   00F7 00FF 00FF 00FE
        DECLE   $00FB,  $00FF,  $00DF,  $00FF   ; D9DA   00FB 00FF 00DF 00FF
        DECLE   $007F,  $00FF,  $00FF,  $00FD   ; D9DE   007F 00FF 00FF 00FD
        DECLE   $00FF,  $00F7,  $00F7,  $00F7   ; D9E2   00FF 00F7 00F7 00F7
        DECLE   $00FF                           ; D9E6   00FF

        ADDR    R3,     R7                      ; D9E7   00DF
        ADDR    R3,     R7                      ; D9E8   00DF
        ADDR    R3,     R7                      ; D9E9   00DF

        DECLE   $00FF,  $007F,  $007F,  $007F   ; D9EA   00FF 007F 007F 007F
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D9EE   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FE,  $00FB,  $00FF   ; D9F2   00FF 00FE 00FB 00FF
        DECLE   $00EF,  $00FF,  $0001,  $0001   ; D9F6   00EF 00FF 0001 0001
        DECLE   $0001,  $0003,  $0003,  $0001   ; D9FA   0001 0003 0003 0001
        DECLE   $0001,  $0001,  $00FF,  $00FF   ; D9FE   0001 0001 00FF 00FF
        DECLE   $00FE,  $00FE,  $00FE,  $00FB   ; DA02   00FE 00FE 00FE 00FB
        DECLE   $00FB,  $00FB,  $00FF,  $00FF   ; DA06   00FB 00FB 00FF 00FF
        DECLE   $00FC,  $00F0,  $00E0,  $0080   ; DA0A   00FC 00F0 00E0 0080
        DECLE   $0000,  $0000                   ; DA0E   0000 0000

        ADDR    R5,     R7                      ; DA10   00EF
        ADDR    R5,     R7                      ; DA11   00EF
        ADDR    R5,     R7                      ; DA12   00EF

        DECLE   $00FF,  $00BF,  $00BF,  $00BF   ; DA13   00FF 00BF 00BF 00BF
        DECLE   $00FF,  $00FF,  $00FC,  $00C0   ; DA17   00FF 00FF 00FC 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA1B   0000 0000 0000 0000
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; DA1F   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FD,  $00FD,  $00FB   ; DA23   00FF 00FD 00FD 00FB
        DECLE   $00FF                           ; DA27   00FF

        ADDR    R3,     R7                      ; DA28   00DF
        ADDR    R3,     R7                      ; DA29   00DF

        DECLE   $00BF,  $00FF,  $00FF,  $00FF   ; DA2A   00BF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00F7,  $00F7   ; DA2E   00FF 00FF 00F7 00F7
        DECLE   $00EF,  $00FF                   ; DA32   00EF 00FF

        ADDR    R1,     R7                      ; DA34   00CF
        ADDR    R1,     R7                      ; DA35   00CF
        ADDR    R1,     R7                      ; DA36   00CF
        MOVR    R1,     R7                      ; DA37   008F
        MOVR    R3,     R7                      ; DA38   009F
        MOVR    R3,     R7                      ; DA39   009F

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DA3A   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00DF,  $00FF   ; DA3E   00FF 00FF 00DF 00FF
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; DA42   007F 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DA46   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FD,  $00F7   ; DA4A   00FF 00FF 00FD 00F7
        DECLE   $00F7,  $00EF,  $00FF           ; DA4E   00F7 00EF 00FF

        ADDR    R3,     R7                      ; DA51   00DF
        ADDR    R3,     R7                      ; DA52   00DF

        DECLE   $00BF,  $00FF,  $00FF,  $00FF   ; DA53   00BF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DA57   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FE,  $00FE   ; DA5B   00FF 00FF 00FE 00FE
        DECLE   $00FD,  $00FF,  $00FB,  $00FB   ; DA5F   00FD 00FF 00FB 00FB
        DECLE   $00F7,  $00FF,  $00FF           ; DA63   00F7 00FF 00FF

        ADDR    R4,     R7                      ; DA66   00E7
        ADDR    R4,     R7                      ; DA67   00E7
        ADDR    R0,     R7                      ; DA68   00C7
        ADDR    R1,     R7                      ; DA69   00CF
        ADDR    R1,     R7                      ; DA6A   00CF
        ADDR    R1,     R7                      ; DA6B   00CF

        DECLE   $00FF,  $00FF                   ; DA6C   00FF 00FF

        SARC    R3,     2                       ; DA6E   007F
        SARC    R3,     2                       ; DA6F   007F
        ADDR    R7,     R6                      ; DA70   00FE
L_DA71:
        ADDR    R7,     R6                      ; DA71   00FE
        ADDR    R7,     R6                      ; DA72   00FE
L_DA73:
        ADDR    R7,     R6                      ; DA73   00FE
        DECLE   $00FF,  $00FF,  $00F3,  $00F3   ; DA74   00FF 00FF 00F3 00F3
        DECLE   $00FF,  $00EF,  $00FF,  $00EF   ; DA78   00FF 00EF 00FF 00EF
        DECLE   $00FF,  $00EF,  $00FF,  $00EF   ; DA7C   00FF 00EF 00FF 00EF
        DECLE   $00FF,  $00FF                   ; DA80   00FF 00FF

        ADDR    R1,     R7                      ; DA82   00CF
        ADDR    R1,     R7                      ; DA83   00CF
        ADDR    R1,     R7                      ; DA84   00CF
        ADDR    R1,     R7                      ; DA85   00CF
        ADDR    R1,     R7                      ; DA86   00CF
        ADDR    R1,     R7                      ; DA87   00CF
        ADDR    R1,     R7                      ; DA88   00CF
        ADDR    R1,     R7                      ; DA89   00CF
        ADDR    R1,     R7                      ; DA8A   00CF
        ADDR    R1,     R7                      ; DA8B   00CF

        DECLE   $00FF,  $00FF                   ; DA8C   00FF 00FF

        ADDR    R1,     R7                      ; DA8E   00CF
        ADDR    R1,     R7                      ; DA8F   00CF

        DECLE   $00FF,  $00FC,  $00C0,  $0000   ; DA90   00FF 00FC 00C0 0000
        DECLE   $0001,  $0004,  $0010,  $0000   ; DA94   0001 0004 0010 0000
        DECLE   $00FF,  $00FE,  $00FF,  $00FB   ; DA98   00FF 00FE 00FF 00FB
        DECLE   $00FF,  $00EF,  $00FF,  $00FF   ; DA9C   00FF 00EF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FD,  $00FF   ; DAA0   00FF 00FF 00FD 00FF
        DECLE   $00F7,  $00FF,  $00DF,  $00FF   ; DAA4   00F7 00FF 00DF 00FF
        DECLE   $00FF,  $00BF,  $00BF,  $00BF   ; DAA8   00FF 00BF 00BF 00BF
        DECLE   $00FF,  $007F,  $007F,  $007F   ; DAAC   00FF 007F 007F 007F
        DECLE   $00FF,  $00FE,  $00FE,  $00FE   ; DAB0   00FF 00FE 00FE 00FE
        DECLE   $00FF,  $00FD,  $00FD,  $00FD   ; DAB4   00FF 00FD 00FD 00FD
        DECLE   $00FF,  $00FF,  $00F3,  $00F3   ; DAB8   00FF 00FF 00F3 00F3
        DECLE   $00F3,  $00F3,  $00F3,  $00F3   ; DABC   00F3 00F3 00F3 00F3
        DECLE   $00FF,  $00FF,  $003F,  $003F   ; DAC0   00FF 00FF 003F 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; DAC4   003F 003F 003F 003F
        DECLE   $00FF,  $00BF,  $00FF,  $00BF   ; DAC8   00FF 00BF 00FF 00BF
        DECLE   $00BF,  $00BF,  $00FF,  $007F   ; DACC   00BF 00BF 00FF 007F
        DECLE   $00FD,  $00FD,  $00FD,  $00FD   ; DAD0   00FD 00FD 00FD 00FD
        DECLE   $00FF,  $00FF,  $00F3,  $00F3   ; DAD4   00FF 00FF 00F3 00F3
        DECLE   $00F3,  $00F3,  $00F3,  $00F3   ; DAD8   00F3 00F3 00F3 00F3
        DECLE   $00FF,  $00FF                   ; DADC   00FF 00FF

        ADDR    R1,     R7                      ; DADE   00CF
        ADDR    R1,     R7                      ; DADF   00CF
        ADDR    R1,     R7                      ; DAE0   00CF
        ADDR    R1,     R7                      ; DAE1   00CF
        ADDR    R1,     R7                      ; DAE2   00CF
        ADDR    R1,     R7                      ; DAE3   00CF

        DECLE   $00FF,  $00FF,  $003F,  $003F   ; DAE4   00FF 00FF 003F 003F
        DECLE   $00FF,  $00FB,  $00FF,  $00DF   ; DAE8   00FF 00FB 00FF 00DF
        DECLE   $00BF,  $007F,  $00FF,  $00FF   ; DAEC   00BF 007F 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DAF0   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FB,  $00F7   ; DAF4   00FF 00FF 00FB 00F7
        DECLE   $00FF,  $00FF,  $00FF,  $00FE   ; DAF8   00FF 00FF 00FF 00FE
        DECLE   $00FD,  $00FF,  $00FF,  $00EF   ; DAFC   00FD 00FF 00FF 00EF
        DECLE   $00FE,  $00F8,  $00E0,  $00C0   ; DB00   00FE 00F8 00E0 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB04   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DB08   00FF 00FF 00FF 00FF
        DECLE   $00FC,  $00FC,  $00F9,  $00F9   ; DB0C   00FC 00FC 00F9 00F9
        DECLE   $00F3,  $00F3,  $00FF,  $00FF   ; DB10   00F3 00F3 00FF 00FF

        ADDR    R1,     R7                      ; DB14   00CF
        ADDR    R1,     R7                      ; DB15   00CF
        MOVR    R3,     R7                      ; DB16   009F
        MOVR    R3,     R7                      ; DB17   009F
        ADDR    R5,     R7                      ; DB18   00EF
        ADDR    R3,     R7                      ; DB19   00DF

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DB1A   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DB1E   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DB22   00FF 00FF 00FF 00FF

        ADDR    R7,     R1                      ; DB26   00F9
        ADDR    R7,     R1                      ; DB27   00F9
        ADDR    R6,     R3                      ; DB28   00F3
        ADDR    R6,     R3                      ; DB29   00F3
        ADDR    R4,     R7                      ; DB2A   00E7
        ADDR    R4,     R7                      ; DB2B   00E7

        DECLE   $00FF,  $00FF                   ; DB2C   00FF 00FF

        ADDR    R1,     R7                      ; DB2E   00CF
        ADDR    R1,     R7                      ; DB2F   00CF
        MOVR    R3,     R7                      ; DB30   009F
        MOVR    R3,     R7                      ; DB31   009F
        MOVR    R3,     R7                      ; DB32   009F
        MOVR    R3,     R7                      ; DB33   009F

        DECLE   $00FF,  $00FF                   ; DB34   00FF 00FF

        MOVR    R3,     R7                      ; DB36   009F
        MOVR    R3,     R7                      ; DB37   009F

        DECLE   $00FF,  $00F7                   ; DB38   00FF 00F7

        ADDR    R5,     R7                      ; DB3A   00EF
        ADDR    R3,     R7                      ; DB3B   00DF

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DB3C   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DB40   00FF 00FF 00FF 00FF
        DECLE   $00FD,  $00FB,  $00F7,  $00FF   ; DB44   00FD 00FB 00F7 00FF
        DECLE   $003F,  $003F,  $007F,  $007F   ; DB48   003F 003F 007F 007F
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DB4C   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FE,  $00FE   ; DB50   00FF 00FF 00FE 00FE
        DECLE   $00FC,  $00FC,  $00FF,  $00FF   ; DB54   00FC 00FC 00FF 00FF

        ADDR    R6,     R3                      ; DB58   00F3
        ADDR    R6,     R3                      ; DB59   00F3
        ADDR    R4,     R7                      ; DB5A   00E7
        ADDR    R4,     R7                      ; DB5B   00E7
        ADDR    R1,     R7                      ; DB5C   00CF
        ADDR    R1,     R7                      ; DB5D   00CF

        DECLE   $00FF,  $00FF                   ; DB5E   00FF 00FF

        MOVR    R3,     R7                      ; DB60   009F
        MOVR    R3,     R7                      ; DB61   009F
        MOVR    R3,     R7                      ; DB62   009F

        DECLE   $001F,  $003F,  $003F,  $00FF   ; DB63   001F 003F 003F 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DB67   00FF 00FF 00FF 00FF
        DECLE   $00FE,  $00FF,  $00FB,  $00F7   ; DB6B   00FE 00FF 00FB 00F7
        DECLE   $00EF,  $00FF,  $00FF           ; DB6F   00EF 00FF 00FF

        ADDR    R4,     R7                      ; DB72   00E7
        ADDR    R4,     R7                      ; DB73   00E7
        ADDR    R1,     R7                      ; DB74   00CF
        ADDR    R1,     R7                      ; DB75   00CF
        MOVR    R3,     R7                      ; DB76   009F
        MOVR    R3,     R7                      ; DB77   009F

        DECLE   $00FF,  $00FF                   ; DB78   00FF 00FF

        MOVR    R3,     R7                      ; DB7A   009F
        MOVR    R3,     R7                      ; DB7B   009F
        MOVR    R3,     R7                      ; DB7C   009F

        DECLE   $001F,  $003F,  $003F           ; DB7D   001F 003F 003F

        SLLC    R2,     1                       ; DB80   005A
        RSWD    R4                              ; DB81   003C
        NEGR    R4                              ; DB82   0024
        SARC    R2,     2                       ; DB83   007E
        SLR     R2,     2                       ; DB84   0066
        SARC    R2,     2                       ; DB85   007E
        ADDR    R4,     R7                      ; DB86   00E7

        DECLE   $0042,  $0042,  $0066,  $007E   ; DB87   0042 0042 0066 007E
        DECLE   $003C,  $0042,  $003C,  $0042   ; DB8B   003C 0042 003C 0042
        DECLE   $003C,  $0018,  $007E,  $0024   ; DB8F   003C 0018 007E 0024
        DECLE   $007E,  $0066,  $00FF,  $0066   ; DB93   007E 0066 00FF 0066
        DECLE   $0042,  $0042,  $0066,  $007E   ; DB97   0042 0042 0066 007E
        DECLE   $003C,  $0042,  $003C,  $0042   ; DB9B   003C 0042 003C 0042
        DECLE   $003C,  $003E,  $003E,  $0026   ; DB9F   003C 003E 003E 0026
        DECLE   $007E,  $0066,  $007E,  $00E6   ; DBA3   007E 0066 007E 00E6
        DECLE   $0042,  $0043,  $0046,  $007E   ; DBA7   0042 0043 0046 007E
        DECLE   $0078,  $0006,  $0078,  $0006   ; DBAB   0078 0006 0078 0006
        DECLE   $0078,  $001C,  $003F,  $0026   ; DBAF   0078 001C 003F 0026
        DECLE   $007E,  $0066,  $00FE,  $0066   ; DBB3   007E 0066 00FE 0066
        DECLE   $0043,  $0042,  $0046,  $007E   ; DBB7   0043 0042 0046 007E
        DECLE   $0078,  $0006,  $0078,  $0006   ; DBBB   0078 0006 0078 0006
        DECLE   $0078,  $000E,  $001E,  $0033   ; DBBF   0078 000E 001E 0033
        DECLE   $003F,  $0067,  $007F,  $00E4   ; DBC3   003F 0067 007F 00E4
        DECLE   $0084,  $0086,  $00CC,  $00FD   ; DBC7   0084 0086 00CC 00FD
        DECLE   $0071,  $008C,  $0070,  $008C   ; DBCB   0071 008C 0070 008C
        DECLE   $0070,  $000E,  $001E,  $0033   ; DBCF   0070 000E 001E 0033
        DECLE   $003F,  $0067,  $007E,  $00E5   ; DBD3   003F 0067 007E 00E5
        DECLE   $0086,  $0084,  $00CC,  $00FD   ; DBD7   0086 0084 00CC 00FD
        DECLE   $0071,  $008C,  $0070,  $008C   ; DBDB   0071 008C 0070 008C
        DECLE   $0070,  $0007,  $003E,  $007A   ; DBDF   0070 0007 003E 007A
        DECLE   $006E,  $00F4,  $00FA,  $0098   ; DBE3   006E 00F4 00FA 0098
        DECLE   $008C,  $00C8,  $00EA,  $007A   ; DBE7   008C 00C8 00EA 007A
        DECLE   $00A0,  $0058,  $00A0,  $0058   ; DBEB   00A0 0058 00A0 0058
        DECLE   $0020,  $0006,  $003F,  $007A   ; DBEF   0020 0006 003F 007A
        DECLE   $006E,  $00F4,  $00FA,  $009C   ; DBF3   006E 00F4 00FA 009C
        DECLE   $0088,  $00C8,  $00EA,  $007A   ; DBF7   0088 00C8 00EA 007A
        DECLE   $00A0,  $0058,  $00A0,  $0058   ; DBFB   00A0 0058 00A0 0058
        DECLE   $0020,  $0006,  $007B,  $006D   ; DBFF   0020 0006 007B 006D
        DECLE   $00F7,  $00FE,  $003A,  $0090   ; DC03   00F7 00FE 003A 0090
        DECLE   $0088,  $00D0,  $0070,  $00A4   ; DC07   0088 00D0 0070 00A4
        DECLE   $0054,  $00A0,  $0050,  $0020   ; DC0B   0054 00A0 0050 0020
        DECLE   $0000,  $0006,  $007B,  $006D   ; DC0F   0000 0006 007B 006D
        DECLE   $00F6,  $00FF,  $003A,  $0094   ; DC13   00F6 00FF 003A 0094
        DECLE   $0088,  $00D0,  $0070,  $00A4   ; DC17   0088 00D0 0070 00A4
        DECLE   $0054,  $00A0,  $0050,  $0020   ; DC1B   0054 00A0 0050 0020
        DECLE   $0000,  $0042,  $007E,  $007E   ; DC1F   0000 0042 007E 007E
        DECLE   $007E,  $007E,  $00FF,  $00FF   ; DC23   007E 007E 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC27   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC2B   00FF 00FF 00FF 00FF
        DECLE   $0081,  $0042,  $007E,  $007E   ; DC2F   0081 0042 007E 007E
        DECLE   $007E,  $00FF,  $00FF,  $00FF   ; DC33   007E 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC37   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC3B   00FF 00FF 00FF 00FF
        DECLE   $0081,  $0021,  $0023,  $003F   ; DC3F   0081 0021 0023 003F
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC43   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC47   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC4B   00FF 00FF 00FF 00FF
        DECLE   $0003,  $0021,  $0023,  $003F   ; DC4F   0003 0021 0023 003F
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC53   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC57   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC5B   00FF 00FF 00FF 00FF
        DECLE   $0003,  $0021,  $0021,  $007F   ; DC5F   0003 0021 0021 007F
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC63   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC67   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC6B   00FF 00FF 00FF 00FF
        DECLE   $0002,  $0021,  $0021,  $007F   ; DC6F   0002 0021 0021 007F
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC73   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC77   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC7B   00FF 00FF 00FF 00FF

        EIS                                     ; DC7F   0002
        DECR    R0                              ; DC80   0010
        RLC     R1,     1                       ; DC81   0051
        ADDR    R3,     R7                      ; DC82   00DF

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC83   00FF 00FF 00FF 00FF

        ADDR    R7,     R6                      ; DC87   00FE
        ADDR    R7,     R6                      ; DC88   00FE
        ADDR    R7,     R6                      ; DC89   00FE
        ADDR    R7,     R6                      ; DC8A   00FE
        ADDR    R7,     R6                      ; DC8B   00FE
        ADDR    R7,     R6                      ; DC8C   00FE
        ADDR    R7,     R6                      ; DC8D   00FE
        SARC    R0,     2                       ; DC8E   007C

        JSR     R4,     .EXEC.051               ; DC8F   0004 0010 0051

        ADDR    R3,     R7                      ; DC92   00DF

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC93   00FF 00FF 00FF 00FF
        DECLE   $00FE,  $00FE,  $00FE,  $00FE   ; DC97   00FE 00FE 00FE 00FE
        DECLE   $00FE,  $00FE,  $00FE,  $007C   ; DC9B   00FE 00FE 00FE 007C
        DECLE   $0004,  $0008,  $007C,  $007F   ; DC9F   0004 0008 007C 007F
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DCA3   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FE,  $00FE   ; DCA7   00FF 00FF 00FE 00FE
        DECLE   $00FE,  $00FE,  $007E,  $003C   ; DCAB   00FE 00FE 007E 003C
        DECLE   $0004,  $0008,  $007C,  $007F   ; DCAF   0004 0008 007C 007F
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DCB3   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FE,  $00FE   ; DCB7   00FF 00FF 00FE 00FE
        DECLE   $00FE,  $00FE,  $007E,  $003C   ; DCBB   00FE 00FE 007E 003C
        DECLE   $0004,  $0000,  $0000,  $0000   ; DCBF   0004 0000 0000 0000
        DECLE   $0000,  $0000,  $001C,  $001C   ; DCC3   0000 0000 001C 001C
        DECLE   $0008,  $0000,  $0000,  $0000   ; DCC7   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DCCB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DCCF   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $001C,  $001C   ; DCD3   0000 0008 001C 001C
        DECLE   $0008,  $0000,  $0000,  $0000   ; DCD7   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DCDB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DCDF   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0024   ; DCE3   0000 0018 0018 0024
        DECLE   $003C,  $0024,  $0000,  $0000   ; DCE7   003C 0024 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DCEB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DCEF   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $003C,  $0024   ; DCF3   0018 0018 003C 0024
        DECLE   $003C,  $0024,  $0000,  $0000   ; DCF7   003C 0024 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DCFB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DCFF   0000 0000 0000 0000
        DECLE   $0038,  $0038,  $006C,  $0054   ; DD03   0038 0038 006C 0054
        DECLE   $007C,  $0054,  $0000,  $0000   ; DD07   007C 0054 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD0B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0028   ; DD0F   0000 0000 0000 0028
        DECLE   $0038,  $007C,  $006C,  $0054   ; DD13   0038 007C 006C 0054
        DECLE   $007C,  $0054,  $0000,  $0000   ; DD17   007C 0054 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD1B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0038   ; DD1F   0000 0000 0000 0038
        DECLE   $0038,  $0038,  $0038,  $007C   ; DD23   0038 0038 0038 007C
        DECLE   $006C,  $0054,  $006C,  $0054   ; DD27   006C 0054 006C 0054
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD2B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0028,  $0038   ; DD2F   0000 0000 0028 0038
        DECLE   $0038,  $0038,  $007C,  $007C   ; DD33   0038 0038 007C 007C
        DECLE   $006C,  $0054,  $006C,  $0054   ; DD37   006C 0054 006C 0054
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD3B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $003C,  $003C   ; DD3F   0000 0000 003C 003C
        DECLE   $003C,  $003C,  $007E,  $007E   ; DD43   003C 003C 007E 007E
        DECLE   $003C,  $0066,  $005A,  $0066   ; DD47   003C 0066 005A 0066
        DECLE   $005A,  $0042,  $0000,  $0000   ; DD4B   005A 0042 0000 0000
        DECLE   $0000,  $0024,  $0018,  $003C   ; DD4F   0000 0024 0018 003C
        DECLE   $003C,  $003C,  $007E,  $003C   ; DD53   003C 003C 007E 003C
        DECLE   $007E,  $0066,  $005A,  $0066   ; DD57   007E 0066 005A 0066
        DECLE   $005A,  $0042,  $0000,  $0000   ; DD5B   005A 0042 0000 0000
        DECLE   $0000,  $0010,  $007C,  $007C   ; DD5F   0000 0010 007C 007C
        DECLE   $007C,  $007C,  $007C,  $00FE   ; DD63   007C 007C 007C 00FE
        DECLE   $00EE,  $00D6,  $00BA,  $00C6   ; DD67   00EE 00D6 00BA 00C6
        DECLE   $00BA,  $00C6,  $00BA,  $0082   ; DD6B   00BA 00C6 00BA 0082
        DECLE   $0000,  $0054,  $0038,  $007C   ; DD6F   0000 0054 0038 007C
        DECLE   $007C,  $007C,  $00FE,  $007C   ; DD73   007C 007C 00FE 007C
        DECLE   $00EE,  $00D6,  $00BA,  $00C6   ; DD77   00EE 00D6 00BA 00C6
        DECLE   $00BA,  $00C6,  $00BA,  $0082   ; DD7B   00BA 00C6 00BA 0082
        DECLE   $0000,  $005A,  $003C,  $007E   ; DD7F   0000 005A 003C 007E
        DECLE   $007E,  $007E,  $00FF,  $007E   ; DD83   007E 007E 00FF 007E
        DECLE   $00FF,  $00E7,  $00DB,  $00BD   ; DD87   00FF 00E7 00DB 00BD
        DECLE   $00C3,  $00BD,  $00C3,  $00BD   ; DD8B   00C3 00BD 00C3 00BD
        DECLE   $0081,  $005A,  $007E,  $003C   ; DD8F   0081 005A 007E 003C
        DECLE   $007E,  $007E,  $00FF,  $00FF   ; DD93   007E 007E 00FF 00FF

        SARC    R2,     2                       ; DD97   007E
        ADDR    R4,     R7                      ; DD98   00E7

        DECLE   $00DB,  $00BD,  $00C3,  $00BD   ; DD99   00DB 00BD 00C3 00BD
        DECLE   $00C3,  $00BD,  $0081,  $0000   ; DD9D   00C3 00BD 0081 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDA1   0000 0000 0000 0000
        DECLE   $0008,  $001C,  $0008,  $0000   ; DDA5   0008 001C 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; DDB1   0000 0000 0000 0008
        DECLE   $001C,  $001C,  $0008,  $0000   ; DDB5   001C 001C 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $001C   ; DDC1   0000 0000 0008 001C
        DECLE   $002C,  $0034,  $003C,  $0004   ; DDC5   002C 0034 003C 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0018   ; DDD1   0000 0000 0008 0018
        DECLE   $000C,  $0034,  $003C,  $0004   ; DDD5   000C 0034 003C 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDDD   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0038,  $003C   ; DDE1   0000 0008 0038 003C
        DECLE   $004C,  $0074,  $005C,  $0004   ; DDE5   004C 0074 005C 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDED   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $003C,  $0078   ; DDF1   0000 0008 003C 0078
        DECLE   $004C,  $0074,  $005C,  $0004   ; DDF5   004C 0074 005C 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDFD   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $001C,  $0038   ; DE01   0000 0008 001C 0038
        DECLE   $007C,  $005C,  $006C,  $0054   ; DE05   007C 005C 006C 0054
        DECLE   $000C,  $0004,  $0000,  $0000   ; DE09   000C 0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE0D   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0018,  $003C   ; DE11   0000 0008 0018 003C
        DECLE   $003C,  $005C,  $006C,  $0054   ; DE15   003C 005C 006C 0054
        DECLE   $000C,  $0004,  $0000,  $0000   ; DE19   000C 0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE1D   0000 0000 0000 0000
        DECLE   $0004,  $001E,  $003E,  $007C   ; DE21   0004 001E 003E 007C
        DECLE   $007E,  $007C,  $005E,  $0066   ; DE25   007E 007C 005E 0066
        DECLE   $005A,  $0046,  $0002,  $0002   ; DE29   005A 0046 0002 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE2D   0000 0000 0000 0000
        DECLE   $0004,  $000C,  $003E,  $003E   ; DE31   0004 000C 003E 003E
        DECLE   $007C,  $007E,  $005E,  $0066   ; DE35   007C 007E 005E 0066
        DECLE   $005A,  $0046,  $0002,  $0002   ; DE39   005A 0046 0002 0002
        DECLE   $0000,  $0000,  $0000,  $0004   ; DE3D   0000 0000 0000 0004
        DECLE   $001E,  $003E,  $007E,  $00FC   ; DE41   001E 003E 007E 00FC
        DECLE   $00FE,  $00FC,  $00CE,  $00B6   ; DE45   00FE 00FC 00CE 00B6
        DECLE   $00CA,  $00B6,  $00CA,  $00B6   ; DE49   00CA 00B6 00CA 00B6
        DECLE   $0002,  $0002,  $0000,  $0004   ; DE4D   0002 0002 0000 0004
        DECLE   $000E,  $003E,  $007C,  $007C   ; DE51   000E 003E 007C 007C
        DECLE   $00FE,  $00FE,  $00CE,  $00B6   ; DE55   00FE 00FE 00CE 00B6
        DECLE   $00CA,  $00B6,  $00CA,  $00B6   ; DE59   00CA 00B6 00CA 00B6
        DECLE   $0002,  $0002,  $0000,  $0001   ; DE5D   0002 0002 0000 0001
        DECLE   $0001,  $0000,  $0000,  $0000   ; DE61   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0003   ; DE6D   0000 0000 0000 0003
        DECLE   $0003,  $0003,  $0000,  $0002   ; DE71   0003 0003 0000 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0007   ; DE7D   0000 0000 0000 0007
        DECLE   $0007,  $0005,  $0005,  $0007   ; DE81   0007 0005 0005 0007
        DECLE   $0007,  $0000,  $0002,  $0002   ; DE85   0007 0000 0002 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; DE8D   0000 0000 0000

        INCR    R7                              ; DE90   000F
        INCR    R7                              ; DE91   000F

L_DE92:
        INCR    R1                              ; DE92   0009
L_DE93:
        INCR    R1                              ; DE93   0009
        INCR    R3                              ; DE94   000B
        INCR    R3                              ; DE95   000B
        INCR    R7                              ; DE96   000F

        DECLE   $0000                           ; DE97   0000
L_DE98:
        EIS                                     ; DE98   0002
        DECLE   $0002,  $0000,  $0000,  $0000   ; DE99   0002 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001F   ; DE9D   0000 0000 0000 001F
        DECLE   $001F                           ; DEA1   001F

        COMR    R3                              ; DEA2   001B
        DECR    R1                              ; DEA3   0011
        DECR    R3                              ; DEA4   0013
L_DEA5:
        DECR    R7                              ; DEA5   0017
L_DEA6:
        DECR    R7                              ; DEA6   0017

        DECLE   $001F,  $001F,  $0000,  $0004   ; DEA7   001F 001F 0000 0004
        DECLE   $0004,  $0000,  $0000,  $0000   ; DEAB   0004 0000 0000 0000
        DECLE   $0000,  $007F,  $007F,  $007B   ; DEAF   0000 007F 007F 007B
        DECLE   $0061,  $0041,  $004B,  $005F   ; DEB3   0061 0041 004B 005F
        DECLE   $005F,  $005F,  $007F,  $007F   ; DEB7   005F 005F 007F 007F
        DECLE   $0000,  $0008,  $0008,  $0008   ; DEBB   0000 0008 0008 0008
        DECLE   $0000,  $00FF,  $00F7,  $00F3   ; DEBF   0000 00FF 00F7 00F3
        DECLE   $00C1,  $0081,  $0093,  $00B7   ; DEC3   00C1 0081 0093 00B7
        DECLE   $00BF,  $00BF,  $00BF,  $00FF   ; DEC7   00BF 00BF 00BF 00FF
        DECLE   $0000,  $0018,  $0018,  $0018   ; DECB   0000 0018 0018 0018
        DECLE   $0018,  $00FF,  $00F7,  $00F3   ; DECF   0018 00FF 00F7 00F3
        DECLE   $00C1,  $0081,  $0093,  $00B7   ; DED3   00C1 0081 0093 00B7
        DECLE   $00BF,  $00BF,  $00BF,  $00FF   ; DED7   00BF 00BF 00BF 00FF
        DECLE   $0000,  $0018,  $0018,  $0018   ; DEDB   0000 0018 0018 0018
        DECLE   $0018,  $00E0,  $00E0,  $0000   ; DEDF   0018 00E0 00E0 0000
        DECLE   $00A0,  $0000,  $0000,  $0000   ; DEE3   00A0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEE7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEEB   0000 0000 0000 0000
        DECLE   $0000,  $00F0,  $00F0,  $0000   ; DEEF   0000 00F0 00F0 0000
        DECLE   $0090,  $0090,  $0000,  $0000   ; DEF3   0090 0090 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEFB   0000 0000 0000 0000
        DECLE   $0000,  $00F8,  $0088,  $00F8   ; DEFF   0000 00F8 0088 00F8
        DECLE   $0000,  $0088,  $0088,  $0000   ; DF03   0000 0088 0088 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF07   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF0B   0000 0000 0000 0000
        DECLE   $0000,  $00FC,  $00DC,  $0084   ; DF0F   0000 00FC 00DC 0084
        DECLE   $00DC,  $00FC,  $0000,  $0084   ; DF13   00DC 00FC 0000 0084
        DECLE   $0084,  $0000,  $0000,  $0000   ; DF17   0084 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF1B   0000 0000 0000 0000
        DECLE   $0000,  $00FE,  $00DE,  $0082   ; DF1F   0000 00FE 00DE 0082
        DECLE   $0082,  $00DE,  $00FE,  $0000   ; DF23   0082 00DE 00FE 0000
        DECLE   $0082,  $0082,  $0082,  $0000   ; DF27   0082 0082 0082 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF2B   0000 0000 0000 0000
        DECLE   $0000,  $00FF                   ; DF2F   0000 00FF

        ADDR    R5,     R7                      ; DF31   00EF
        ADDR    R1,     R7                      ; DF32   00CF

        MOVR    R0,     R1                      ; DF33   0081
        MOVR    R0,     R1                      ; DF34   0081
        ADDR    R1,     R7                      ; DF35   00CF
        ADDR    R5,     R7                      ; DF36   00EF

        DECLE   $00FF,  $0000,  $0081,  $0081   ; DF37   00FF 0000 0081 0081
        DECLE   $0081,  $0000,  $0000,  $0000   ; DF3B   0081 0000 0000 0000
        DECLE   $0000,  $00FF                   ; DF3F   0000 00FF

        ADDR    R5,     R7                      ; DF41   00EF
        ADDR    R1,     R7                      ; DF42   00CF

        MOVR    R0,     R1                      ; DF43   0081
        MOVR    R0,     R1                      ; DF44   0081
        ADDR    R1,     R7                      ; DF45   00CF
        ADDR    R5,     R7                      ; DF46   00EF

        DECLE   $00FF,  $0000,  $0081,  $0081   ; DF47   00FF 0000 0081 0081
        DECLE   $0081,  $0000,  $0000,  $0000   ; DF4B   0081 0000 0000 0000
        DECLE   $0000,  $00FF                   ; DF4F   0000 00FF

        ADDR    R5,     R7                      ; DF51   00EF
        ADDR    R1,     R7                      ; DF52   00CF

        MOVR    R0,     R1                      ; DF53   0081
        MOVR    R0,     R1                      ; DF54   0081
        ADDR    R1,     R7                      ; DF55   00CF
        ADDR    R5,     R7                      ; DF56   00EF

        DECLE   $00FF,  $0000,  $0081,  $0081   ; DF57   00FF 0000 0081 0081
        DECLE   $0081,  $0000,  $0000,  $0000   ; DF5B   0081 0000 0000 0000
        DECLE   $0000,  $000E,  $001F,  $001B   ; DF5F   0000 000E 001F 001B
        DECLE   $0011,  $0011,  $0011,  $001B   ; DF63   0011 0011 0011 001B
        DECLE   $001F,  $001F,  $001F,  $000E   ; DF67   001F 001F 001F 000E
        DECLE   $0004,  $0004,  $0004,  $0004   ; DF6B   0004 0004 0004 0004
        DECLE   $000A,  $000E,  $001F,  $001B   ; DF6F   000A 000E 001F 001B
        DECLE   $0011,  $0011,  $0011,  $001B   ; DF73   0011 0011 0011 001B
        DECLE   $001F,  $001F,  $001F,  $000E   ; DF77   001F 001F 001F 000E
        DECLE   $0004,  $0004,  $0004,  $0004   ; DF7B   0004 0004 0004 0004
        DECLE   $000A,  $000E,  $001F,  $001B   ; DF7F   000A 000E 001F 001B
        DECLE   $0011,  $0011,  $0011,  $001B   ; DF83   0011 0011 0011 001B
        DECLE   $001F,  $001F,  $001F,  $000E   ; DF87   001F 001F 001F 000E
        DECLE   $0004,  $0004,  $0004,  $0004   ; DF8B   0004 0004 0004 0004
        DECLE   $000A,  $000E,  $001F,  $001B   ; DF8F   000A 000E 001F 001B
        DECLE   $0011,  $0011,  $0011,  $001B   ; DF93   0011 0011 0011 001B
        DECLE   $001F,  $001F,  $001F,  $000E   ; DF97   001F 001F 001F 000E
        DECLE   $0004,  $0004,  $0004,  $0004   ; DF9B   0004 0004 0004 0004
        DECLE   $000A,  $000E,  $001F,  $001B   ; DF9F   000A 000E 001F 001B
        DECLE   $0011,  $0011,  $0011,  $001B   ; DFA3   0011 0011 0011 001B
        DECLE   $001F,  $001F,  $001F,  $000E   ; DFA7   001F 001F 001F 000E
        DECLE   $0004,  $0004,  $0004,  $0004   ; DFAB   0004 0004 0004 0004
        DECLE   $000A,  $000E,  $001F,  $001B   ; DFAF   000A 000E 001F 001B
        DECLE   $0011,  $0011,  $0011,  $001B   ; DFB3   0011 0011 0011 001B
        DECLE   $001F,  $001F,  $001F,  $000E   ; DFB7   001F 001F 001F 000E
        DECLE   $0004,  $0004,  $0004,  $0004   ; DFBB   0004 0004 0004 0004
        DECLE   $000A,  $000E,  $001F,  $001B   ; DFBF   000A 000E 001F 001B
        DECLE   $0011,  $0011,  $0011,  $001B   ; DFC3   0011 0011 0011 001B
        DECLE   $001F,  $001F,  $001F,  $000E   ; DFC7   001F 001F 001F 000E
        DECLE   $0004,  $0004,  $0004,  $0004   ; DFCB   0004 0004 0004 0004
        DECLE   $000A,  $000E,  $001F,  $001B   ; DFCF   000A 000E 001F 001B
        DECLE   $0011,  $0011,  $0011,  $001B   ; DFD3   0011 0011 0011 001B
        DECLE   $001F,  $001F,  $001F,  $000E   ; DFD7   001F 001F 001F 000E
        DECLE   $0004,  $0004,  $0004,  $0004   ; DFDB   0004 0004 0004 0004
        DECLE   $000A,  $0000,  $0000,  $0080   ; DFDF   000A 0000 0000 0080
        DECLE   $0000,  $0004,  $0000,  $0000   ; DFE3   0000 0004 0000 0000
        DECLE   $0018,  $002C,  $0078,  $0076   ; DFE7   0018 002C 0078 0076
        DECLE   $007E,  $002C,  $0002,  $0000   ; DFEB   007E 002C 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFEF   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $0000,  $0031   ; DFF3   0000 0040 0000 0031
        DECLE   $00AB,  $007A,  $007D,  $00BF   ; DFF7   00AB 007A 007D 00BF

        ADDR    R7,     R6                      ; DFFB   00FE
        SAR     R1,     2                       ; DFFC   006D
        COMR    R6                              ; DFFD   001E
        DECLE   $0004,  $0000                   ; DFFE   0004 0000

        ORG     $F000
        DECLE   $0001,  $0000,  $0000,  $0004   ; F000   0001 0000 0000 0004
        DECLE   $0000,  $0001                   ; F004   0000 0001

        SLR     R3,     2                       ; F006   0067
        INCR    R2                              ; F007   000A
        RSWD    R6                              ; F008   003E
        ADDR    R3,     R7                      ; F009   00DF

        DECLE   $007E,  $00F5,  $00FC,  $0068   ; F00A   007E 00F5 00FC 0068
        DECLE   $0014,  $0000,  $0000,  $0000   ; F00E   0014 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $0000   ; F012   0000 0000 0040 0000
        DECLE   $0031,  $00AB,  $007A,  $007D   ; F016   0031 00AB 007A 007D
        DECLE   $00BF,  $00FE,  $006D,  $001E   ; F01A   00BF 00FE 006D 001E
        DECLE   $0004,  $0000,  $0000,  $0000   ; F01E   0004 0000 0000 0000
        DECLE   $0080,  $0000,  $0004,  $0000   ; F022   0080 0000 0004 0000
        DECLE   $0000,  $0018,  $002C,  $0078   ; F026   0000 0018 002C 0078
        DECLE   $0076,  $007E,  $002C,  $0002   ; F02A   0076 007E 002C 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; F02E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $0000   ; F032   0000 0000 0040 0000
        DECLE   $0031,  $00AB,  $007A,  $007D   ; F036   0031 00AB 007A 007D
        DECLE   $00BF,  $00FE,  $006D,  $001E   ; F03A   00BF 00FE 006D 001E
        DECLE   $0004,  $0000,  $0001,  $0000   ; F03E   0004 0000 0001 0000
        DECLE   $0000,  $0004,  $0000,  $0001   ; F042   0000 0004 0000 0001

        SLR     R3,     2                       ; F046   0067
        INCR    R2                              ; F047   000A
        RSWD    R6                              ; F048   003E
        ADDR    R3,     R7                      ; F049   00DF

        DECLE   $007E,  $00F5,  $00FC,  $0068   ; F04A   007E 00F5 00FC 0068
        DECLE   $0014,  $0000,  $0000,  $0000   ; F04E   0014 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $0000   ; F052   0000 0000 0040 0000
        DECLE   $0031,  $00AB,  $007A,  $007D   ; F056   0031 00AB 007A 007D
        DECLE   $00BF,  $00FE,  $006D,  $001E   ; F05A   00BF 00FE 006D 001E
        DECLE   $0004,  $0000,  $0000,  $0001   ; F05E   0004 0000 0000 0001
        DECLE   $0006,  $000D,  $001F,  $003F   ; F062   0006 000D 001F 003F
        DECLE   $007F,  $00FF,  $0000,  $0080   ; F066   007F 00FF 0000 0080
        DECLE   $00E0,  $0090,  $00E8,  $00F4   ; F06A   00E0 0090 00E8 00F4
        DECLE   $00FE,  $00FD,  $0000,  $0001   ; F06E   00FE 00FD 0000 0001
        DECLE   $0006,  $000D,  $001F,  $003F   ; F072   0006 000D 001F 003F
        DECLE   $007F,  $00FF,  $0000,  $0000   ; F076   007F 00FF 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F07A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; F07E   0000 0000 0000 0080
        DECLE   $00E0,  $0090,  $00E8,  $00F4   ; F082   00E0 0090 00E8 00F4
        DECLE   $00FE,  $00FD,  $00FF           ; F086   00FE 00FD 00FF

        ADDR    R3,     R7                      ; F089   00DF
        MOVR    R5,     R7                      ; F08A   00AF

        ADDR    R7,     R3                      ; F08B   00FB
        MOVR    R7,     R5                      ; F08C   00BD
        RRC     R2,     2                       ; F08D   0076
        ADDR    R5,     R7                      ; F08E   00EF
        ADDR    R3,     R7                      ; F08F   00DF

        DECLE   $0000,  $0000,  $0003,  $0006   ; F090   0000 0000 0003 0006
        DECLE   $000F,  $001F,  $003F,  $007F   ; F094   000F 001F 003F 007F
        DECLE   $0000,  $00C0,  $0070,  $00C8   ; F098   0000 00C0 0070 00C8
        DECLE   $00F4,  $00FA,  $00FF,  $00FE   ; F09C   00F4 00FA 00FF 00FE
        DECLE   $0000,  $0000,  $0003,  $0006   ; F0A0   0000 0000 0003 0006
        DECLE   $000F,  $001F,  $003F,  $00FF   ; F0A4   000F 001F 003F 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0A8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; F0AC   0000 0000 0000 0080
        DECLE   $0080,  $00C0,  $00F0,  $00C8   ; F0B0   0080 00C0 00F0 00C8
        DECLE   $00F4,  $007A,  $00FF           ; F0B4   00F4 007A 00FF

        ADDR    R7,     R6                      ; F0B7   00FE
        SARC    R3,     2                       ; F0B8   007F
        ADDR    R5,     R7                      ; F0B9   00EF

        DECLE   $0057,  $00FD,  $00DE,  $00BB   ; F0BA   0057 00FD 00DE 00BB
        DECLE   $00F7,  $00EF,  $0000,  $0000   ; F0BE   00F7 00EF 0000 0000
        DECLE   $0001,  $0003,  $0007,  $000F   ; F0C2   0001 0003 0007 000F
        DECLE   $001F,  $003F,  $0000,  $0060   ; F0C6   001F 003F 0000 0060
        DECLE   $00B8,  $0064,  $00FA,  $00FD   ; F0CA   00B8 0064 00FA 00FD
        DECLE   $00FF,  $00FF,  $0000,  $0000   ; F0CE   00FF 00FF 0000 0000
        DECLE   $0001                           ; F0D2   0001

        DIS                                     ; F0D3   0003
        SETC                                    ; F0D4   0007
        INCR    R7                              ; F0D5   000F
        MOVR    R3,     R7                      ; F0D6   009F

L_F0D7:
        SARC    R3,     2                       ; F0D7   007F
        DECLE   $0000,  $0000,  $0000,  $0000   ; F0D8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0040   ; F0DC   0000 0000 0080 0040
        DECLE   $00C0,  $00E0,  $00F8,  $00E4   ; F0E0   00C0 00E0 00F8 00E4
        DECLE   $007A,  $00BD,  $00FF,  $00FF   ; F0E4   007A 00BD 00FF 00FF
        DECLE   $003F                           ; F0E8   003F

        RRC     R3,     2                       ; F0E9   0077
        MOVR    R5,     R3                      ; F0EA   00AB
        SARC    R2,     2                       ; F0EB   007E
        ADDR    R5,     R7                      ; F0EC   00EF

        DECLE   $00DD,  $00FB,  $00F7,  $0000   ; F0ED   00DD 00FB 00F7 0000
        DECLE   $0000,  $0000,  $0001,  $0003   ; F0F1   0000 0000 0001 0003
        DECLE   $0007,  $000F,  $001F,  $0000   ; F0F5   0007 000F 001F 0000
        DECLE   $0030,  $00DC,  $00B2,  $00FD   ; F0F9   0030 00DC 00B2 00FD
        DECLE   $00FE,  $00FF,  $00FF,  $0000   ; F0FD   00FE 00FF 00FF 0000
        DECLE   $0000,  $0000,  $0001           ; F101   0000 0000 0001

        DIS                                     ; F104   0003
        MOVR    R0,     R7                      ; F105   0087
        ADDR    R1,     R7                      ; F106   00CF

        DECLE   $00BF,  $0000,  $0000,  $0000   ; F107   00BF 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $00C0   ; F10B   0000 0000 0080 00C0
        DECLE   $00A0,  $00E0,  $00F0,  $00FC   ; F10F   00A0 00E0 00F0 00FC
        DECLE   $0072,  $00BD,  $00DE,  $00FF   ; F113   0072 00BD 00DE 00FF
        DECLE   $00FF,  $001F,  $003B,  $00D5   ; F117   00FF 001F 003B 00D5
        DECLE   $00BF,  $00F7,  $00EE,  $00FD   ; F11B   00BF 00F7 00EE 00FD
        DECLE   $00FB,  $0000,  $0000,  $0000   ; F11F   00FB 0000 0000 0000
        DECLE   $0000,  $0001                   ; F123   0000 0001

        DIS                                     ; F125   0003
        SETC                                    ; F126   0007
        INCR    R7                              ; F127   000F

        DECLE   $0000                           ; F128   0000
L_F129:
        COMR    R0                              ; F129   0018
        DECLE   $006E,  $00D9,  $00FE,  $00FF   ; F12A   006E 00D9 00FE 00FF
        DECLE   $00FF,  $00FF,  $0000,  $0000   ; F12E   00FF 00FF 0000 0000
        DECLE   $0000,  $0000                   ; F132   0000 0000

        MOVR    R0,     R1                      ; F134   0081
        SWAP    R3,     1                       ; F135   0043
        ADDR    R4,     R7                      ; F136   00E7
        ADDR    R3,     R7                      ; F137   00DF

        DECLE   $0000,  $0000,  $0000,  $0000   ; F138   0000 0000 0000 0000
        DECLE   $0080,  $0040,  $00E0,  $00D0   ; F13C   0080 0040 00E0 00D0
        DECLE   $00F0,  $00F8,  $00FE,  $00B9   ; F140   00F0 00F8 00FE 00B9
        DECLE   $00DE,  $006F,  $00FF,  $00FF   ; F144   00DE 006F 00FF 00FF

        INCR    R7                              ; F148   000F

        COMR    R5                              ; F149   001D
L_F14A:
        SAR     R2,     1                       ; F14A   006A
        ADDR    R3,     R7                      ; F14B   00DF

        DECLE   $00FB,  $00F7,  $00FE,  $00FD   ; F14C   00FB 00F7 00FE 00FD
        DECLE   $0000,  $0000,  $0000,  $0000   ; F150   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0003,  $0007   ; F154   0000 0001 0003 0007
        DECLE   $0000,  $000C,  $0037,  $006C   ; F158   0000 000C 0037 006C
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; F15C   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000           ; F160   0000 0000 0000

        TSTR    R0                              ; F163   0080
        SWAP    R0,     1                       ; F164   0040
        MOVR    R4,     R1                      ; F165   00A1
        ADDR    R6,     R3                      ; F166   00F3
        ADDR    R5,     R7                      ; F167   00EF

        DECLE   $0000,  $0000,  $0000           ; F168   0000 0000 0000

        TSTR    R0                              ; F16B   0080
        SWAP    R0,     1                       ; F16C   0040
        MOVR    R4,     R0                      ; F16D   00A0
        ADDR    R6,     R0                      ; F16E   00F0
        ADDR    R5,     R0                      ; F16F   00E8
        ADDR    R7,     R0                      ; F170   00F8
        ADDR    R7,     R4                      ; F171   00FC
        SARC    R3,     2                       ; F172   007F
        ADDR    R3,     R4                      ; F173   00DC
        ADDR    R5,     R7                      ; F174   00EF

        DECLE   $00B7,  $007F,  $00FF,  $0007   ; F175   00B7 007F 00FF 0007
        DECLE   $000E,  $0035,  $006F,  $00FD   ; F179   000E 0035 006F 00FD
        DECLE   $00FB,  $00FF,  $00FE,  $0000   ; F17D   00FB 00FF 00FE 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F181   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0003,  $0000   ; F185   0000 0001 0003 0000
        DECLE   $0006,  $001B,  $0036,  $007F   ; F189   0006 001B 0036 007F
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; F18D   00FF 00FF 00FF 0000
        DECLE   $0000,  $0080,  $0040,  $00A0   ; F191   0000 0080 0040 00A0
        DECLE   $00D0,  $00F9,  $00F7,  $0000   ; F195   00D0 00F9 00F7 0000
        DECLE   $0000,  $0080,  $0040,  $00A0   ; F199   0000 0080 0040 00A0
        DECLE   $00D0,  $00F8,  $00F4,  $00FC   ; F19D   00D0 00F8 00F4 00FC
        DECLE   $007E,  $00BF,  $00EE,  $00F7   ; F1A1   007E 00BF 00EE 00F7
        DECLE   $00DB,  $00BF,  $007F,  $0003   ; F1A5   00DB 00BF 007F 0003
        DECLE   $0007,  $001A,  $0037,  $007E   ; F1A9   0007 001A 0037 007E
        DECLE   $00FD,  $00FF,  $00FF,  $0000   ; F1AD   00FD 00FF 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F1B1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; F1B5   0000 0000 0001 0000
        DECLE   $0003,  $000D,  $001B,  $003F   ; F1B9   0003 000D 001B 003F
        DECLE   $007F,  $00FF,  $00FF,  $0000   ; F1BD   007F 00FF 00FF 0000
        DECLE   $0000,  $00C0,  $0020,  $00D0   ; F1C1   0000 00C0 0020 00D0
        DECLE   $00E8,  $00FC,  $00FB,  $0000   ; F1C5   00E8 00FC 00FB 0000
        DECLE   $0000,  $00C0,  $0020,  $00D0   ; F1C9   0000 00C0 0020 00D0
        DECLE   $00E8,  $00FC,  $00FA,  $00FE   ; F1CD   00E8 00FC 00FA 00FE
        DECLE   $00BF,  $005F,  $00F7           ; F1D1   00BF 005F 00F7

        SARC    R3,     1                       ; F1D4   007B
        ADDR    R5,     R5                      ; F1D5   00ED
        ADDR    R3,     R7                      ; F1D6   00DF

        DECLE   $00BF,  $0001,  $0003,  $000D   ; F1D7   00BF 0001 0003 000D
        DECLE   $001B,  $003F,  $007E,  $00FF   ; F1DB   001B 003F 007E 00FF
        DECLE   $00FF                           ; F1DF   00FF

        CLRC                                    ; F1E0   0006
        ADDR    R1,     R5                      ; F1E1   00CD
        ADDR    R1,     R7                      ; F1E2   00CF

        DECLE   $00DE,  $00F0,  $00E0,  $00C0   ; F1E3   00DE 00F0 00E0 00C0
        DECLE   $00C0,  $0000                   ; F1E7   00C0 0000

        ADDR    R0,     R0                      ; F1E9   00C0
        ADDR    R0,     R0                      ; F1EA   00C0
        ADDR    R4,     R0                      ; F1EB   00E0
        ADDR    R6,     R6                      ; F1EC   00F6
        ADDR    R1,     R7                      ; F1ED   00CF

        DECLE   $00CD,  $00C6,  $0080,  $009B   ; F1EE   00CD 00C6 0080 009B
        DECLE   $0001,  $0123,  $0080,  $0039   ; F1F2   0001 0123 0080 0039
        DECLE   $0020,  $009C,  $0001,  $0124   ; F1F6   0020 009C 0001 0124
        DECLE   $0090,  $0039,  $00C0,  $009C   ; F1FA   0090 0039 00C0 009C
        DECLE   $0001,  $0125,  $00A0,  $0039   ; F1FE   0001 0125 00A0 0039
        DECLE   $00C0,  $009C,  $0001,  $0126   ; F202   00C0 009C 0001 0126
        DECLE   $00B0,  $0039,  $00C0,  $009C   ; F206   00B0 0039 00C0 009C
        DECLE   $0001,  $0127,  $00C0,  $0039   ; F20A   0001 0127 00C0 0039
        DECLE   $00C0,  $009C,  $0001,  $0128   ; F20E   00C0 009C 0001 0128
        DECLE   $00D0,  $0039,  $00C0,  $009C   ; F212   00D0 0039 00C0 009C
        DECLE   $0001,  $0129,  $00E0,  $0039   ; F216   0001 0129 00E0 0039
        DECLE   $00C0,  $009C,  $0001,  $012A   ; F21A   00C0 009C 0001 012A
        DECLE   $00F0,  $0039,  $0060,  $009E   ; F21E   00F0 0039 0060 009E
        DECLE   $0001,  $0125,  $00A0,  $0039   ; F222   0001 0125 00A0 0039
        DECLE   $0060,  $009E,  $0001,  $0126   ; F226   0060 009E 0001 0126
        DECLE   $00B0,  $0039,  $0060,  $009E   ; F22A   00B0 0039 0060 009E
        DECLE   $0001,  $0127,  $00C0,  $0039   ; F22E   0001 0127 00C0 0039
        DECLE   $0060,  $009E,  $0001,  $0128   ; F232   0060 009E 0001 0128
        DECLE   $00D0,  $0039,  $0060,  $009E   ; F236   00D0 0039 0060 009E
        DECLE   $0001,  $0129,  $00E0,  $0039   ; F23A   0001 0129 00E0 0039
        DECLE   $0060,  $009E,  $0001,  $012A   ; F23E   0060 009E 0001 012A
        DECLE   $00F0,  $0039,  $00E0,  $009E   ; F242   00F0 0039 00E0 009E
        DECLE   $0001,  $0125,  $00A0,  $0039   ; F246   0001 0125 00A0 0039
        DECLE   $00E0,  $009E,  $0001,  $0126   ; F24A   00E0 009E 0001 0126
        DECLE   $00B0,  $0039,  $00E0,  $009E   ; F24E   00B0 0039 00E0 009E
        DECLE   $0001,  $0127,  $00C0,  $0039   ; F252   0001 0127 00C0 0039
        DECLE   $00E0,  $009E,  $0001,  $0128   ; F256   00E0 009E 0001 0128
        DECLE   $00D0,  $0039,  $00E0,  $009E   ; F25A   00D0 0039 00E0 009E
        DECLE   $0001,  $0129,  $00E0,  $0039   ; F25E   0001 0129 00E0 0039
        DECLE   $00E0,  $009E,  $0001           ; F262   00E0 009E 0001

        SUBR    R5,     R2                      ; F265   012A
        ADDR    R6,     R0                      ; F266   00F0
        RSWD    R1                              ; F267   0039
        SLR     R0,     1                       ; F268   0060
        MOVR    R3,     R7                      ; F269   009F

        DECLE   $0001                           ; F26A   0001

        SUBR    R5,     R2                      ; F26B   012A
        ADDR    R6,     R0                      ; F26C   00F0
        RSWD    R1                              ; F26D   0039
        ADDR    R4,     R0                      ; F26E   00E0
        MOVR    R3,     R7                      ; F26F   009F

        DECLE   $0001,  $0123,  $0080,  $0039   ; F270   0001 0123 0080 0039
        DECLE   $0020,  $00A0,  $0001           ; F274   0020 00A0 0001

        SUBR    R4,     R4                      ; F277   0124
        MOVR    R2,     R0                      ; F278   0090
        RSWD    R1                              ; F279   0039
        ADDR    R4,     R0                      ; F27A   00E0
        MOVR    R3,     R7                      ; F27B   009F

        DECLE   $0001                           ; F27C   0001

        SUBR    R4,     R5                      ; F27D   0125
        MOVR    R4,     R0                      ; F27E   00A0
        RSWD    R1                              ; F27F   0039
        ADDR    R4,     R0                      ; F280   00E0
        MOVR    R3,     R7                      ; F281   009F

        DECLE   $0001                           ; F282   0001

        SUBR    R4,     R6                      ; F283   0126
        MOVR    R6,     R0                      ; F284   00B0
        RSWD    R1                              ; F285   0039
        ADDR    R4,     R0                      ; F286   00E0
        MOVR    R3,     R7                      ; F287   009F

        DECLE   $0001                           ; F288   0001

        SUBR    R4,     R7                      ; F289   0127

        ADDR    R0,     R0                      ; F28A   00C0
        RSWD    R1                              ; F28B   0039
        ADDR    R4,     R0                      ; F28C   00E0
        MOVR    R3,     R7                      ; F28D   009F

        DECLE   $0001                           ; F28E   0001

        SUBR    R5,     R0                      ; F28F   0128
        ADDR    R2,     R0                      ; F290   00D0
        RSWD    R1                              ; F291   0039
        ADDR    R4,     R0                      ; F292   00E0
        MOVR    R3,     R7                      ; F293   009F

        DECLE   $0001                           ; F294   0001

        SUBR    R5,     R1                      ; F295   0129
        ADDR    R4,     R0                      ; F296   00E0
        RSWD    R1                              ; F297   0039
        ADDR    R4,     R0                      ; F298   00E0
        MOVR    R3,     R7                      ; F299   009F

        DECLE   $0001,  $012A,  $00F0,  $0039   ; F29A   0001 012A 00F0 0039
        DECLE   $0275,  $0280,  $0173,  $0080   ; F29E   0275 0280 0173 0080
        DECLE   $020C,  $0013,  $0008,  $0240   ; F2A2   020C 0013 0008 0240
        DECLE   $0173,  $0004                   ; F2A6   0173 0004

        ANDR    R4,     R0                      ; F2A8   01A0
        SUBI    #$02B8, R6                      ; F2A9   033E 02B8
        ADDR    R6,     R0                      ; F2AB   00F0
        MVII    #$0200, R4                      ; F2AC   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; F2AE   0004 0114 0338

        MVI     G_0105, R0                      ; F2B1   0280 0105
        ANDI    #$00FB, R0                      ; F2B3   03B8 00FB
        MVO     R0,     G_0105                  ; F2B5   0240 0105
        MVII    #$0003, R3                      ; F2B7   02BB 0003
        MVII    #$0215, R4                      ; F2B9   02BC 0215

        JSR     R5,     X_PRINT_R5              ; F2BB   0004 0118 007B
        STRING  "Select -"                      ; F2BE  
        DECLE   $0000                           ; F2C6   0000

        MVII    #$023E, R4                      ; F2C7   02BC 023E

        JSR     R5,     X_PRINT_R5              ; F2C9   0004 0118 007B
        STRING  "1. Fuji Speedway"              ; F2CC  
        DECLE   $0000                           ; F2DC   0000

        MVII    #$0252, R4                      ; F2DD   02BC 0252

        JSR     R5,     X_PRINT_R5              ; F2DF   0004 0118 007B
        STRING  "2. Madison 500"                ; F2E2  
        DECLE   $0000                           ; F2F0   0000

        MVII    #$0266, R4                      ; F2F1   02BC 0266

        JSR     R5,     X_PRINT_R5              ; F2F3   0004 0118 007B
        STRING  "3. Grand National"             ; F2F6  
        DECLE   $0000                           ; F307   0000

        MVII    #$027A, R4                      ; F308   02BC 027A

        JSR     R5,     X_PRINT_R5              ; F30A   0004 0118 007B
        STRING  "4. Monaco GP"                  ; F30D  
        DECLE   $0000                           ; F319   0000

        SDBD                                    ; F31A   0001
        MVII    #$50BC, R0                      ; F31B   02B8 00BC 0050
        MVO     R0,     G_033D                  ; F31E   0240 033D
        PULR    R7                              ; F320   02B7

        PSHR    R5                              ; F321   0275
        CMPI    #$00FF, R0                      ; F322   0378 00FF
        BEQ     L_F33D                          ; F324   0204 0017

        CMP@    R3,     R0                      ; F326   0358
        BEQ     L_F33D                          ; F327   0204 0014

        CMPI    #$0000, R0                      ; F329   0378 0000
        BEQ     L_F33D                          ; F32B   0204 0010

        CMPI    #$0005, R0                      ; F32D   0378 0005
        BGE     L_F33D                          ; F32F   020D 000C

        MVO     R0,     G_0121                  ; F331   0240 0121
        MVII    #$0001, R1                      ; F333   02B9 0001
        MVO     R1,     G_011C                  ; F335   0241 011C
        MVI     G_0105, R0                      ; F337   0280 0105
        XORI    #$0004, R0                      ; F339   03F8 0004
        MVO     R0,     G_0105                  ; F33B   0240 0105
L_F33D:
        PULR    R7                              ; F33D   02B7

        PSHR    R5                              ; F33E   0275
        MVI     G_0318, R0                      ; F33F   0280 0318
        XORI    #$0200, R0                      ; F341   03F8 0200
        MVO     R0,     G_0318                  ; F343   0240 0318
        MVO     R0,     G_0319                  ; F345   0240 0319
        PULR    R7                              ; F347   02B7

        TSTR    R2                              ; F348   0092
        MOVR    R5,     R4                      ; F349   00AC
        ADCR    R3                              ; F34A   002B
        TSTR    R5                              ; F34B   00AD
        SLL     R2,     2                       ; F34C   004E
        TSTR    R5                              ; F34D   00AD
        RRC     R1,     1                       ; F34E   0071
        TSTR    R5                              ; F34F   00AD
        MOVR    R4,     R0                      ; F350   00A0
        TSTR    R4                              ; F351   00A4
        RSWD    R3                              ; F352   003B
        MOVR    R4,     R5                      ; F353   00A5
        RRC     R3,     2                       ; F354   0077
        MOVR    R4,     R5                      ; F355   00A5
        MOVR    R6,     R3                      ; F356   00B3
        MOVR    R4,     R5                      ; F357   00A5
        ADDR    R5,     R2                      ; F358   00EA
        MOVR    R4,     R5                      ; F359   00A5
L_F35A:
        DECR    R7                              ; F35A   0017

        MOVR    R4,     R6                      ; F35B   00A6
        SLL     R3,     1                       ; F35C   004B
        MOVR    R4,     R6                      ; F35D   00A6
        MOVR    R0,     R7                      ; F35E   0087

        MOVR    R4,     R6                      ; F35F   00A6
        ADDR    R1,     R7                      ; F360   00CF

        MOVR    R4,     R6                      ; F361   00A6
        COMR    R3                              ; F362   001B
        MOVR    R4,     R7                      ; F363   00A7

        SLR     R1,     2                       ; F364   0065
        MOVR    R4,     R7                      ; F365   00A7

        MOVR    R6,     R5                      ; F366   00B5
        MOVR    R4,     R7                      ; F367   00A7

        DECLE   $0005                           ; F368   0005

        MOVR    R5,     R0                      ; F369   00A8
        RLC     R0,     1                       ; F36A   0050
        MOVR    R5,     R0                      ; F36B   00A8
        TSTR    R3                              ; F36C   009B
        MOVR    R5,     R0                      ; F36D   00A8
        ADDR    R5,     R1                      ; F36E   00E9
        MOVR    R5,     R0                      ; F36F   00A8
        RSWD    R1                              ; F370   0039
        MOVR    R5,     R1                      ; F371   00A9
        MOVR    R0,     R5                      ; F372   0085
        MOVR    R5,     R1                      ; F373   00A9
        ADDR    R2,     R4                      ; F374   00D4
        MOVR    R5,     R1                      ; F375   00A9
        NEGR    R4                              ; F376   0024
        MOVR    R5,     R2                      ; F377   00AA
        MOVR    R2,     R4                      ; F378   0094
        TSTR    R5                              ; F379   00AD
        ADDR    R4,     R4                      ; F37A   00E4
        TSTR    R5                              ; F37B   00AD
        INCR    R7                              ; F37C   000F

        MOVR    R5,     R6                      ; F37D   00AE
L_F37E:
        RSWD    R2                              ; F37E   003A
        MOVR    R5,     R6                      ; F37F   00AE
        SARC    R1,     1                       ; F380   0079
        MOVR    R5,     R2                      ; F381   00AA
        ADDR    R1,     R7                      ; F382   00CF

        DECLE   $00AA,  $0021,  $00AB,  $0072   ; F383   00AA 0021 00AB 0072
        DECLE   $00AB,  $00BF,  $00AB,  $0009   ; F387   00AB 00BF 00AB 0009
        DECLE   $00AC,  $004D,  $00AC,  $006A   ; F38B   00AC 004D 00AC 006A
        DECLE   $00AE,  $00B0,  $00AE,  $00D8   ; F38F   00AE 00B0 00AE 00D8
        DECLE   $00AE,  $0000                   ; F393   00AE 0000

        MOVR    R5,     R7                      ; F395   00AF

        NEGR    R5                              ; F396   0025
        TSTR    R5                              ; F397   00AD
        SLL     R0,     1                       ; F398   0048
        TSTR    R5                              ; F399   00AD
        SAR     R3,     1                       ; F39A   006B
        TSTR    R5                              ; F39B   00AD
        MOVR    R1,     R6                      ; F39C   008E
        TSTR    R5                              ; F39D   00AD
        NOP                                     ; F39E   0034
        MOVR    R4,     R5                      ; F39F   00A5
        RRC     R0,     1                       ; F3A0   0070
        MOVR    R4,     R5                      ; F3A1   00A5
        MOVR    R5,     R4                      ; F3A2   00AC
        MOVR    R4,     R5                      ; F3A3   00A5
        ADDR    R4,     R4                      ; F3A4   00E4
        MOVR    R4,     R5                      ; F3A5   00A5
        DECR    R0                              ; F3A6   0010
        MOVR    R4,     R6                      ; F3A7   00A6
        SWAP    R0,     2                       ; F3A8   0044
        MOVR    R4,     R6                      ; F3A9   00A6
        SARC    R3,     2                       ; F3AA   007F
        MOVR    R4,     R6                      ; F3AB   00A6
        ADDR    R0,     R5                      ; F3AC   00C5
        MOVR    R4,     R6                      ; F3AD   00A6
        DECR    R1                              ; F3AE   0011
        MOVR    R4,     R7                      ; F3AF   00A7

        SLLC    R0,     2                       ; F3B0   005C
        MOVR    R4,     R7                      ; F3B1   00A7

        MOVR    R5,     R2                      ; F3B2   00AA
        MOVR    R4,     R7                      ; F3B3   00A7

        ADDR    R7,     R1                      ; F3B4   00F9
        MOVR    R4,     R7                      ; F3B5   00A7

        SWAP    R1,     2                       ; F3B6   0045
        MOVR    R5,     R0                      ; F3B7   00A8
        MOVR    R1,     R6                      ; F3B8   008E
        MOVR    R5,     R0                      ; F3B9   00A8
        ADDR    R3,     R4                      ; F3BA   00DC
        MOVR    R5,     R0                      ; F3BB   00A8
        ADCR    R4                              ; F3BC   002C
        MOVR    R5,     R1                      ; F3BD   00A9
        SARC    R0,     1                       ; F3BE   0078
        MOVR    R5,     R1                      ; F3BF   00A9
        ADDR    R0,     R7                      ; F3C0   00C7

        MOVR    R5,     R1                      ; F3C1   00A9
        COMR    R0                              ; F3C2   0018
        MOVR    R5,     R2                      ; F3C3   00AA
        SAR     R1,     2                       ; F3C4   006D
        MOVR    R5,     R2                      ; F3C5   00AA
        ADDR    R2,     R7                      ; F3C6   00D7

L_F3C7:
        TSTR    R5                              ; F3C7   00AD
        EIS                                     ; F3C8   0002
        MOVR    R5,     R6                      ; F3C9   00AE
        ADCR    R5                              ; F3CA   002D
        MOVR    R5,     R6                      ; F3CB   00AE
        SLLC    R1,     2                       ; F3CC   005D
        MOVR    R5,     R6                      ; F3CD   00AE
        ADDR    R0,     R2                      ; F3CE   00C2
        MOVR    R5,     R2                      ; F3CF   00AA
        DECR    R4                              ; F3D0   0014
        MOVR    R5,     R3                      ; F3D1   00AB
        SLR     R1,     2                       ; F3D2   0065
        MOVR    R5,     R3                      ; F3D3   00AB
        MOVR    R6,     R2                      ; F3D4   00B2
        MOVR    R5,     R3                      ; F3D5   00AB
        ADDR    R7,     R4                      ; F3D6   00FC
        MOVR    R5,     R3                      ; F3D7   00AB
        SWAP    R1,     1                       ; F3D8   0041
        MOVR    R5,     R4                      ; F3D9   00AC
        MOVR    R0,     R5                      ; F3DA   0085
        MOVR    R5,     R4                      ; F3DB   00AC
        MOVR    R4,     R3                      ; F3DC   00A3
        MOVR    R5,     R6                      ; F3DD   00AE
        ADDR    R1,     R3                      ; F3DE   00CB
        MOVR    R5,     R6                      ; F3DF   00AE
        ADDR    R6,     R3                      ; F3E0   00F3
        MOVR    R5,     R6                      ; F3E1   00AE
        COMR    R3                              ; F3E2   001B
        MOVR    R5,     R7                      ; F3E3   00AF

        SLR     R0,     2                       ; F3E4   0064
        RRC     R3,     2                       ; F3E5   0077
        RRC     R2,     2                       ; F3E6   0076
        RRC     R1,     2                       ; F3E7   0075
        RRC     R0,     2                       ; F3E8   0074
        RRC     R3,     1                       ; F3E9   0073
        RRC     R2,     1                       ; F3EA   0072
        RRC     R1,     1                       ; F3EB   0071
        RRC     R0,     1                       ; F3EC   0070
        SAR     R3,     2                       ; F3ED   006F
        SAR     R2,     2                       ; F3EE   006E
        SAR     R1,     2                       ; F3EF   006D
        SAR     R0,     2                       ; F3F0   006C
        SAR     R3,     1                       ; F3F1   006B
        SAR     R2,     1                       ; F3F2   006A
        SAR     R1,     1                       ; F3F3   0069
        SAR     R0,     1                       ; F3F4   0068
        SLR     R3,     2                       ; F3F5   0067
        SLR     R2,     2                       ; F3F6   0066
        SLR     R1,     2                       ; F3F7   0065
        SARC    R0,     1                       ; F3F8   0078
        MOVR    R1,     R3                      ; F3F9   008B
        MOVR    R1,     R2                      ; F3FA   008A
        TSTR    R1                              ; F3FB   0089
        MOVR    R1,     R0                      ; F3FC   0088
        MOVR    R0,     R7                      ; F3FD   0087

        MOVR    R0,     R6                      ; F3FE   0086
        MOVR    R0,     R5                      ; F3FF   0085
        MOVR    R0,     R4                      ; F400   0084
        MOVR    R0,     R3                      ; F401   0083
        MOVR    R0,     R2                      ; F402   0082
        MOVR    R0,     R1                      ; F403   0081
        TSTR    R0                              ; F404   0080
        SARC    R3,     2                       ; F405   007F
        SARC    R2,     2                       ; F406   007E
        SARC    R1,     2                       ; F407   007D
        SARC    R0,     2                       ; F408   007C
        SARC    R3,     1                       ; F409   007B
        SARC    R2,     1                       ; F40A   007A
        SARC    R1,     1                       ; F40B   0079
        MOVR    R1,     R4                      ; F40C   008C
        MOVR    R3,     R7                      ; F40D   009F

        MOVR    R3,     R6                      ; F40E   009E
        MOVR    R3,     R5                      ; F40F   009D
        MOVR    R3,     R4                      ; F410   009C
        TSTR    R3                              ; F411   009B
        MOVR    R3,     R2                      ; F412   009A
        MOVR    R3,     R1                      ; F413   0099
        MOVR    R3,     R0                      ; F414   0098
        MOVR    R2,     R7                      ; F415   0097

        MOVR    R2,     R6                      ; F416   0096
        MOVR    R2,     R5                      ; F417   0095
        MOVR    R2,     R4                      ; F418   0094
        MOVR    R2,     R3                      ; F419   0093
        TSTR    R2                              ; F41A   0092
        MOVR    R2,     R1                      ; F41B   0091
        MOVR    R2,     R0                      ; F41C   0090
        MOVR    R1,     R7                      ; F41D   008F

        MOVR    R1,     R6                      ; F41E   008E
        MOVR    R1,     R5                      ; F41F   008D
        MOVR    R4,     R0                      ; F420   00A0
        MOVR    R6,     R3                      ; F421   00B3
        MOVR    R6,     R2                      ; F422   00B2
        MOVR    R6,     R1                      ; F423   00B1
        MOVR    R6,     R0                      ; F424   00B0
        MOVR    R5,     R7                      ; F425   00AF

        MOVR    R5,     R6                      ; F426   00AE
        TSTR    R5                              ; F427   00AD
        MOVR    R5,     R4                      ; F428   00AC
        MOVR    R5,     R3                      ; F429   00AB
        MOVR    R5,     R2                      ; F42A   00AA
        MOVR    R5,     R1                      ; F42B   00A9
        MOVR    R5,     R0                      ; F42C   00A8
        MOVR    R4,     R7                      ; F42D   00A7

        MOVR    R4,     R6                      ; F42E   00A6
        MOVR    R4,     R5                      ; F42F   00A5
        TSTR    R4                              ; F430   00A4
        MOVR    R4,     R3                      ; F431   00A3
        MOVR    R4,     R2                      ; F432   00A2
        MOVR    R4,     R1                      ; F433   00A1
        MOVR    R6,     R4                      ; F434   00B4
        ADDR    R0,     R7                      ; F435   00C7

        DECLE   $00C6,  $00C5,  $00C4,  $00C3   ; F436   00C6 00C5 00C4 00C3
        DECLE   $00C2,  $00C1,  $00C0,  $00BF   ; F43A   00C2 00C1 00C0 00BF
        DECLE   $00BE,  $00BD,  $00BC,  $00BB   ; F43E   00BE 00BD 00BC 00BB
        DECLE   $00BA,  $00B9,  $00B8,  $00B7   ; F442   00BA 00B9 00B8 00B7

        TSTR    R6                              ; F446   00B6
        MOVR    R6,     R5                      ; F447   00B5
        ADDR    R1,     R0                      ; F448   00C8
        ADDR    R3,     R3                      ; F449   00DB
        ADDR    R3,     R2                      ; F44A   00DA
        ADDR    R3,     R1                      ; F44B   00D9
        ADDR    R3,     R0                      ; F44C   00D8
        ADDR    R2,     R7                      ; F44D   00D7

        ADDR    R2,     R6                      ; F44E   00D6
        ADDR    R2,     R5                      ; F44F   00D5
        ADDR    R2,     R4                      ; F450   00D4
        ADDR    R2,     R3                      ; F451   00D3
        ADDR    R2,     R2                      ; F452   00D2
        ADDR    R2,     R1                      ; F453   00D1
        ADDR    R2,     R0                      ; F454   00D0
        ADDR    R1,     R7                      ; F455   00CF

        ADDR    R1,     R6                      ; F456   00CE
        ADDR    R1,     R5                      ; F457   00CD
        ADDR    R1,     R4                      ; F458   00CC
        ADDR    R1,     R3                      ; F459   00CB
        ADDR    R1,     R2                      ; F45A   00CA
        ADDR    R1,     R1                      ; F45B   00C9
        ADDR    R3,     R4                      ; F45C   00DC
        ADDR    R5,     R7                      ; F45D   00EF

        ADDR    R5,     R6                      ; F45E   00EE
        ADDR    R5,     R5                      ; F45F   00ED
        ADDR    R5,     R4                      ; F460   00EC
        ADDR    R5,     R3                      ; F461   00EB
        ADDR    R5,     R2                      ; F462   00EA
        ADDR    R5,     R1                      ; F463   00E9
        ADDR    R5,     R0                      ; F464   00E8
        ADDR    R4,     R7                      ; F465   00E7

        ADDR    R4,     R6                      ; F466   00E6
        ADDR    R4,     R5                      ; F467   00E5
        ADDR    R4,     R4                      ; F468   00E4
        ADDR    R4,     R3                      ; F469   00E3
        ADDR    R4,     R2                      ; F46A   00E2
        ADDR    R4,     R1                      ; F46B   00E1
        ADDR    R4,     R0                      ; F46C   00E0
        ADDR    R3,     R7                      ; F46D   00DF

        DECLE   $00DE,  $00DD,  $0001,  $0000   ; F46E   00DE 00DD 0001 0000
        DECLE   $0005,  $0004                   ; F472   0005 0004

        DIS                                     ; F474   0003
        EIS                                     ; F475   0002
        INCR    R1                              ; F476   0009
        INCR    R0                              ; F477   0008
        SETC                                    ; F478   0007
        CLRC                                    ; F479   0006
        INCR    R5                              ; F47A   000D
L_F47B:
        INCR    R4                              ; F47B   000C
        INCR    R3                              ; F47C   000B
        INCR    R2                              ; F47D   000A
        DECR    R1                              ; F47E   0011
        DECR    R0                              ; F47F   0010
        INCR    R7                              ; F480   000F

        INCR    R6                              ; F481   000E
L_F482:
        DECR    R4                              ; F482   0014
        DECR    R5                              ; F483   0015
        DECR    R2                              ; F484   0012
        DECR    R3                              ; F485   0013
L_F486:
        DECR    R7                              ; F486   0017

        DECLE   $0016,  $001B,  $001A,  $0019   ; F487   0016 001B 001A 0019
        DECLE   $0018,  $0000,  $0000,  $0000   ; F48B   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F48F   0000 0000 0000 0000
        DECLE   $0000,  $0024,  $0025,  $0026   ; F493   0000 0024 0025 0026
        DECLE   $0027,  $0028,  $0029,  $002A   ; F497   0027 0028 0029 002A
        DECLE   $002B,  $002C,  $002D,  $002E   ; F49B   002B 002C 002D 002E
        DECLE   $002F                           ; F49F   002F

        SUB     .IV.FIFO,R4                     ; F4A0   0304 0081
        MOVR    R2,     R4                      ; F4A2   0094
        MOVR    R2,     R5                      ; F4A3   0095
        MOVR    R2,     R7                      ; F4A4   0097
        MOVR    R4,     R7                      ; F4A5   00A7

        DECLE   $00A8,  $00A9,  $00AB,  $00AC   ; F4A6   00A8 00A9 00AB 00AC
        DECLE   $00BA,  $00BB,  $00BC,  $00BD   ; F4AA   00BA 00BB 00BC 00BD
        DECLE   $00BF                           ; F4AE   00BF

        ADDR    R0,     R0                      ; F4AF   00C0
        ADDR    R0,     R1                      ; F4B0   00C1
        ADDR    R1,     R5                      ; F4B1   00CD
        ADDR    R1,     R6                      ; F4B2   00CE
        ADDR    R1,     R7                      ; F4B3   00CF

        ADDR    R2,     R0                      ; F4B4   00D0
        ADDR    R2,     R1                      ; F4B5   00D1
        ADDR    R2,     R3                      ; F4B6   00D3
        ADDR    R2,     R4                      ; F4B7   00D4
        ADDR    R2,     R5                      ; F4B8   00D5
        ADDR    R2,     R6                      ; F4B9   00D6
        ADDR    R4,     R0                      ; F4BA   00E0
L_F4BB:
        ADDR    R4,     R1                      ; F4BB   00E1
        ADDR    R4,     R2                      ; F4BC   00E2
        ADDR    R4,     R3                      ; F4BD   00E3
        ADDR    R4,     R4                      ; F4BE   00E4
        ADDR    R4,     R5                      ; F4BF   00E5
        ADDR    R4,     R7                      ; F4C0   00E7

        ADDR    R5,     R0                      ; F4C1   00E8
        ADDR    R5,     R1                      ; F4C2   00E9
        ADDR    R5,     R2                      ; F4C3   00EA
        ADDR    R5,     R3                      ; F4C4   00EB
        MVI@    R4,     R0                      ; F4C5   02A0
        SUBR    R4,     R4                      ; F4C6   0124
        SAR     R2,     2                       ; F4C7   006E
        BEQ     L_F3C7                          ; F4C8   0224 0102

        ADDR    R3,     R6                      ; F4CA   00DE
        MOVR    R4,     R5                      ; F4CB   00A5
        TSTR    R2                              ; F4CC   0092
        SAR     R0,     2                       ; F4CD   006C
        ADDR    R1,     R3                      ; F4CE   00CB
        MOVR    R7,     R0                      ; F4CF   00B8
        SARC    R3,     2                       ; F4D0   007F
        SUBR    R0,     R3                      ; F4D1   0103
        SAR     R1,     2                       ; F4D2   006D
        SUBR    R1,     R5                      ; F4D3   010D
        MOVR    R3,     R1                      ; F4D4   0099
        ADDR    R0,     R3                      ; F4D5   00C3
        MOVR    R0,     R4                      ; F4D6   0084
        SAR     R3,     2                       ; F4D7   006F
        ADDR    R5,     R5                      ; F4D8   00ED
        ADDR    R3,     R0                      ; F4D9   00D8
        MOVR    R5,     R6                      ; F4DA   00AE
        SUBR    R4,     R5                      ; F4DB   0125
        MOVR    R7,     R1                      ; F4DC   00B9
        ADDR    R1,     R4                      ; F4DD   00CC
        MOVR    R2,     R3                      ; F4DE   0093
        ADDR    R3,     R7                      ; F4DF   00DF

        MOVR    R4,     R6                      ; F4E0   00A6
        TSTR    R0                              ; F4E1   0080
        SUBR    R4,     R7                      ; F4E2   0127

        TSTR    R5                              ; F4E3   00AD
        MOVR    R3,     R0                      ; F4E4   0098
        ADDR    R5,     R4                      ; F4E5   00EC
        ADDR    R2,     R7                      ; F4E6   00D7

        ADDR    R0,     R2                      ; F4E7   00C2
        MOVR    R0,     R3                      ; F4E8   0083
        MVO@    R0,     R4                      ; F4E9   0260
        SUBR    R4,     R6                      ; F4EA   0126
L_F4EB:
        MOVR    R0,     R2                      ; F4EB   0082
        SUBR    R5,     R0                      ; F4EC   0128
        MOVR    R2,     R6                      ; F4ED   0096
        MOVR    R5,     R2                      ; F4EE   00AA
        SUBR    R5,     R1                      ; F4EF   0129
        ADDR    R2,     R2                      ; F4F0   00D2
        MOVR    R7,     R6                      ; F4F1   00BE
        ADDR    R4,     R6                      ; F4F2   00E6
        AND     G_007D, R0                      ; F4F3   0380 007D
        ADDR    R1,     R1                      ; F4F5   00C9
        ADDR    R1,     R2                      ; F4F6   00CA
        SARC    R2,     2                       ; F4F7   007E
        SLR     R2,     2                       ; F4F8   0066
        MOVR    R0,     R5                      ; F4F9   0085
        MOVR    R0,     R6                      ; F4FA   0086
        MOVR    R0,     R7                      ; F4FB   0087

        MOVR    R1,     R0                      ; F4FC   0088
        TSTR    R1                              ; F4FD   0089
        MOVR    R1,     R2                      ; F4FE   008A
        MOVR    R1,     R3                      ; F4FF   008B
        ADDR    R3,     R1                      ; F500   00D9
        ADDR    R3,     R2                      ; F501   00DA
        ADDR    R3,     R3                      ; F502   00DB
        SLR     R3,     2                       ; F503   0067
        ADDR    R3,     R5                      ; F504   00DD
        MOVR    R1,     R5                      ; F505   008D
        MOVR    R1,     R6                      ; F506   008E
        MOVR    R1,     R7                      ; F507   008F

        MOVR    R2,     R0                      ; F508   0090
        MOVR    R2,     R1                      ; F509   0091
        SAR     R0,     1                       ; F50A   0068
        SAR     R1,     1                       ; F50B   0069
        SAR     R2,     1                       ; F50C   006A
        MOVR    R3,     R2                      ; F50D   009A
        TSTR    R3                              ; F50E   009B
        MOVR    R3,     R4                      ; F50F   009C
        ADDR    R5,     R6                      ; F510   00EE
        ADDR    R5,     R7                      ; F511   00EF

        MOVR    R3,     R5                      ; F512   009D
        MOVR    R3,     R6                      ; F513   009E
        MOVR    R3,     R7                      ; F514   009F

        SAR     R3,     1                       ; F515   006B
        MOVR    R4,     R1                      ; F516   00A1
        MOVR    R4,     R2                      ; F517   00A2
L_F518:
        MOVR    R4,     R3                      ; F518   00A3
        TSTR    R4                              ; F519   00A4
        RRC     R0,     1                       ; F51A   0070
        RRC     R1,     1                       ; F51B   0071
        RRC     R2,     1                       ; F51C   0072
        RRC     R3,     1                       ; F51D   0073
        RRC     R0,     2                       ; F51E   0074
        MOVR    R5,     R7                      ; F51F   00AF

        DECLE   $00B0,  $00B1,  $00B2,  $00B3   ; F520   00B0 00B1 00B2 00B3
        DECLE   $0075,  $00B5,  $00B6,  $00B7   ; F524   0075 00B5 00B6 00B7

        RRC     R2,     2                       ; F528   0076
        RRC     R3,     2                       ; F529   0077
        SLR     R1,     2                       ; F52A   0065
        SARC    R1,     1                       ; F52B   0079
        SARC    R2,     1                       ; F52C   007A
        SARC    R3,     1                       ; F52D   007B
        SARC    R0,     2                       ; F52E   007C
        ADDR    R0,     R4                      ; F52F   00C4
        ADDR    R0,     R5                      ; F530   00C5
        ADDR    R0,     R6                      ; F531   00C6
        ADDR    R0,     R7                      ; F532   00C7

        DECLE   $03FF,  $0006,  $002C,  $0030   ; F533   03FF 0006 002C 0030
        DECLE   $0034,  $0038,  $0034,  $003C   ; F537   0034 0038 0034 003C
        DECLE   $0304,  $0081,  $0095,  $00A9   ; F53B   0304 0081 0095 00A9
        DECLE   $00BD,  $00D1,  $00E5,  $0224   ; F53F   00BD 00D1 00E5 0224

        SUBR    R0,     R6                      ; F543   0106
        ADDR    R3,     R6                      ; F544   00DE
        MOVR    R4,     R5                      ; F545   00A5
        TSTR    R2                              ; F546   0092
        SAR     R0,     2                       ; F547   006C
        ADDR    R1,     R3                      ; F548   00CB
        MOVR    R7,     R0                      ; F549   00B8
        SARC    R3,     2                       ; F54A   007F
        SUBR    R0,     R7                      ; F54B   0107

        SAR     R1,     2                       ; F54C   006D
L_F54D:
        SUBR    R1,     R1                      ; F54D   0109
        MOVR    R3,     R1                      ; F54E   0099
        ADDR    R0,     R3                      ; F54F   00C3
        MOVR    R0,     R4                      ; F550   0084
        SAR     R3,     2                       ; F551   006F
        ADDR    R5,     R5                      ; F552   00ED
        ADDR    R3,     R0                      ; F553   00D8
        MOVR    R5,     R6                      ; F554   00AE
        SUBR    R4,     R4                      ; F555   0124
        SAR     R2,     2                       ; F556   006E
        SUBR    R4,     R5                      ; F557   0125
        MOVR    R7,     R1                      ; F558   00B9
        ADDR    R1,     R4                      ; F559   00CC
        MOVR    R2,     R3                      ; F55A   0093
        ADDR    R3,     R7                      ; F55B   00DF

        MOVR    R4,     R6                      ; F55C   00A6
        TSTR    R0                              ; F55D   0080
        SUBR    R4,     R7                      ; F55E   0127

        TSTR    R5                              ; F55F   00AD
        MOVR    R3,     R0                      ; F560   0098
        ADDR    R5,     R4                      ; F561   00EC
        ADDR    R2,     R7                      ; F562   00D7

        DECLE   $00C2,  $0083,  $0260,  $0126   ; F563   00C2 0083 0260 0126
        DECLE   $0082,  $0128,  $0096,  $00AA   ; F567   0082 0128 0096 00AA
        DECLE   $0129,  $00D2,  $00BE,  $00E6   ; F56B   0129 00D2 00BE 00E6
        DECLE   $03FF                           ; F56F   03FF

        CLRC                                    ; F570   0006
        SWAP    R0,     1                       ; F571   0040
        SWAP    R0,     2                       ; F572   0044
        SLL     R0,     1                       ; F573   0048
        SLL     R0,     2                       ; F574   004C
        SLL     R0,     1                       ; F575   0048
        RLC     R0,     1                       ; F576   0050
        SUB     G_0082, R4                      ; F577   0304 0082
        MOVR    R2,     R6                      ; F579   0096
        MOVR    R5,     R2                      ; F57A   00AA
        MOVR    R7,     R6                      ; F57B   00BE
        ADDR    R2,     R2                      ; F57C   00D2
        ADDR    R4,     R6                      ; F57D   00E6
        BEQ     L_F47B                          ; F57E   0224 0104

        SAR     R2,     2                       ; F580   006E
        SUBR    R0,     R5                      ; F581   0105
        MOVR    R3,     R1                      ; F582   0099
        SAR     R3,     2                       ; F583   006F
        MOVR    R5,     R6                      ; F584   00AE
        ADDR    R0,     R3                      ; F585   00C3
        ADDR    R5,     R5                      ; F586   00ED
        MOVR    R0,     R4                      ; F587   0084
        ADDR    R3,     R0                      ; F588   00D8
        SUBR    R1,     R2                      ; F589   010A
        TSTR    R2                              ; F58A   0092
        MOVR    R7,     R0                      ; F58B   00B8
        ADDR    R1,     R3                      ; F58C   00CB
        MOVR    R4,     R5                      ; F58D   00A5
        SARC    R3,     2                       ; F58E   007F
L_F58F:
        SAR     R0,     2                       ; F58F   006C
        ADDR    R3,     R6                      ; F590   00DE
        SUBR    R4,     R4                      ; F591   0124
        SAR     R1,     2                       ; F592   006D
        SUBR    R4,     R5                      ; F593   0125
        MOVR    R7,     R1                      ; F594   00B9
        ADDR    R1,     R4                      ; F595   00CC
        MOVR    R2,     R3                      ; F596   0093
        ADDR    R3,     R7                      ; F597   00DF

        MOVR    R4,     R6                      ; F598   00A6
        TSTR    R0                              ; F599   0080
        SUBR    R4,     R7                      ; F59A   0127

        TSTR    R5                              ; F59B   00AD
        MOVR    R3,     R0                      ; F59C   0098
        ADDR    R5,     R4                      ; F59D   00EC
        ADDR    R2,     R7                      ; F59E   00D7

        DECLE   $00C2,  $0083,  $0260,  $0126   ; F59F   00C2 0083 0260 0126
        DECLE   $0081,  $0128,  $00A9,  $0095   ; F5A3   0081 0128 00A9 0095
        DECLE   $0129,  $00BD,  $00E5,  $00D1   ; F5A7   0129 00BD 00E5 00D1
        DECLE   $03FF                           ; F5AB   03FF

        CLRC                                    ; F5AC   0006
        RLC     R0,     2                       ; F5AD   0054
        SLLC    R0,     1                       ; F5AE   0058
        SLLC    R0,     2                       ; F5AF   005C
        SLR     R0,     1                       ; F5B0   0060
        SLLC    R0,     2                       ; F5B1   005C
        SLR     R0,     2                       ; F5B2   0064
        SUB     .IV.ALD,R4                      ; F5B3   0304 0080
        MOVR    R2,     R3                      ; F5B5   0093
        MOVR    R4,     R6                      ; F5B6   00A6
        MOVR    R7,     R1                      ; F5B7   00B9
        ADDR    R1,     R4                      ; F5B8   00CC
        ADDR    R3,     R7                      ; F5B9   00DF
        BEQ     L_F4BB                          ; F5BA   0224 0100

        SAR     R0,     2                       ; F5BC   006C
        SUBR    R0,     R1                      ; F5BD   0101
        SAR     R2,     2                       ; F5BE   006E
        SUBR    R4,     R5                      ; F5BF   0125
        ADDR    R1,     R3                      ; F5C0   00CB
        TSTR    R2                              ; F5C1   0092
        ADDR    R3,     R6                      ; F5C2   00DE
        MOVR    R4,     R5                      ; F5C3   00A5
        SARC    R3,     2                       ; F5C4   007F
        MOVR    R7,     R0                      ; F5C5   00B8
        SUBR    R4,     R6                      ; F5C6   0126
        TSTR    R5                              ; F5C7   00AD
        MOVR    R3,     R0                      ; F5C8   0098
        ADDR    R5,     R4                      ; F5C9   00EC
        ADDR    R2,     R7                      ; F5CA   00D7

        ADDR    R0,     R2                      ; F5CB   00C2
        MOVR    R0,     R3                      ; F5CC   0083
        MVO@    R0,     R4                      ; F5CD   0260
        SUBR    R4,     R4                      ; F5CE   0124
        MOVR    R0,     R1                      ; F5CF   0081
        SUBR    R4,     R7                      ; F5D0   0127

        DECLE   $00A9,  $0095,  $0128,  $00BD   ; F5D1   00A9 0095 0128 00BD
        DECLE   $00E5,  $00D1,  $0380,  $00C3   ; F5D5   00E5 00D1 0380 00C3
        DECLE   $0084,  $00D8,  $006B,  $006F   ; F5D9   0084 00D8 006B 006F
        DECLE   $0099,  $00ED,  $00AE,  $02A0   ; F5DD   0099 00ED 00AE 02A0
        DECLE   $0124,  $006D,  $03FF,  $0005   ; F5E1   0124 006D 03FF 0005

        SAR     R0,     1                       ; F5E5   0068
        INCR    R0                              ; F5E6   0008
        COMR    R0                              ; F5E7   0018
        SAR     R0,     1                       ; F5E8   0068
        SAR     R0,     2                       ; F5E9   006C
        SUB     G_0082, R4                      ; F5EA   0304 0082
        BEQ     L_F4EB                          ; F5EC   0224 0102

        SAR     R3,     1                       ; F5EE   006B
        SUBR    R0,     R3                      ; F5EF   0103
        SAR     R0,     2                       ; F5F0   006C
        SUBR    R1,     R5                      ; F5F1   010D
        SAR     R2,     2                       ; F5F2   006E
        SUBR    R4,     R4                      ; F5F3   0124
        SAR     R1,     2                       ; F5F4   006D
        SUBR    R4,     R5                      ; F5F5   0125
        ADDR    R1,     R3                      ; F5F6   00CB
        TSTR    R2                              ; F5F7   0092
        ADDR    R3,     R6                      ; F5F8   00DE
        MOVR    R4,     R5                      ; F5F9   00A5
        SARC    R3,     2                       ; F5FA   007F
        MOVR    R7,     R0                      ; F5FB   00B8
        SUBR    R4,     R7                      ; F5FC   0127

        TSTR    R5                              ; F5FD   00AD
        MOVR    R3,     R0                      ; F5FE   0098
        ADDR    R5,     R4                      ; F5FF   00EC
        ADDR    R2,     R7                      ; F600   00D7

        DECLE   $00C2,  $0083,  $0260,  $0126   ; F601   00C2 0083 0260 0126
        DECLE   $0081,  $0128,  $00A9,  $0095   ; F605   0081 0128 00A9 0095
        DECLE   $0129,  $00BD,  $00E5,  $00D1   ; F609   0129 00BD 00E5 00D1
        DECLE   $0380,  $007E,  $03FF,  $0006   ; F60D   0380 007E 03FF 0006
        DECLE   $0070,  $0000                   ; F611   0070 0000

        SAR     R0,     1                       ; F613   0068
        DECR    R0                              ; F614   0010
        SAR     R0,     1                       ; F615   0068
        RRC     R0,     2                       ; F616   0074
        SUB     G_0097, R4                      ; F617   0304 0097
        BEQ     L_F518                          ; F619   0224 0102

        SARC    R2,     2                       ; F61B   007E
        SUBR    R0,     R3                      ; F61C   0103
        SARC    R3,     2                       ; F61D   007F
        SUBR    R0,     R6                      ; F61E   0106
        SAR     R3,     1                       ; F61F   006B
        SUBR    R0,     R7                      ; F620   0107

L_F621:
        SAR     R0,     2                       ; F621   006C
        SUBR    R1,     R1                      ; F622   0109
        SAR     R2,     2                       ; F623   006E
        SUBR    R1,     R4                      ; F624   010C
        MOVR    R0,     R2                      ; F625   0082
        SUBR    R1,     R5                      ; F626   010D
        MOVR    R0,     R3                      ; F627   0083
        SUBR    R4,     R4                      ; F628   0124
        SAR     R1,     2                       ; F629   006D
        SUBR    R4,     R6                      ; F62A   0126
        MOVR    R4,     R5                      ; F62B   00A5
        MOVR    R7,     R0                      ; F62C   00B8
        TSTR    R2                              ; F62D   0092
        ADDR    R1,     R3                      ; F62E   00CB
        ADDR    R3,     R6                      ; F62F   00DE
        SUBR    R5,     R0                      ; F630   0128
        TSTR    R5                              ; F631   00AD
        ADDR    R5,     R4                      ; F632   00EC
        ADDR    R2,     R7                      ; F633   00D7

        MOVR    R3,     R0                      ; F634   0098
        ADDR    R0,     R2                      ; F635   00C2
        MVO@    R0,     R4                      ; F636   0260
        SUBR    R4,     R7                      ; F637   0127

        MOVR    R2,     R5                      ; F638   0095
        SUBR    R4,     R5                      ; F639   0125
        MOVR    R0,     R1                      ; F63A   0081
        SUBR    R4,     R7                      ; F63B   0127

        DECLE   $00A9,  $0129,  $00BD,  $00E5   ; F63C   00A9 0129 00BD 00E5
        DECLE   $00D1,  $0380,  $0091,  $03FF   ; F640   00D1 0380 0091 03FF

        CLRC                                    ; F644   0006
        SARC    R0,     1                       ; F645   0078
        SARC    R0,     2                       ; F646   007C
        INCR    R0                              ; F647   0008
        SAR     R0,     1                       ; F648   0068
        COMR    R0                              ; F649   0018
        SAR     R0,     2                       ; F64A   006C
        SUB     .IV.ALD,R4                      ; F64B   0304 0080
        MOVR    R5,     R4                      ; F64D   00AC
        BEQ     L_F54D                          ; F64E   0224 0102

        MOVR    R2,     R1                      ; F650   0091
        SUBR    R0,     R3                      ; F651   0103
        TSTR    R2                              ; F652   0092
        SUBR    R0,     R4                      ; F653   0104
        SAR     R1,     2                       ; F654   006D
        SUBR    R0,     R5                      ; F655   0105
        SAR     R2,     2                       ; F656   006E
        SUBR    R0,     R6                      ; F657   0106
        SARC    R2,     2                       ; F658   007E
        SUBR    R0,     R7                      ; F659   0107

        SARC    R3,     2                       ; F65A   007F
        SUBR    R1,     R0                      ; F65B   0108
        MOVR    R0,     R2                      ; F65C   0082
        SUBR    R1,     R1                      ; F65D   0109
        MOVR    R0,     R3                      ; F65E   0083
        SUBR    R1,     R2                      ; F65F   010A
        SAR     R3,     1                       ; F660   006B
        SUBR    R1,     R4                      ; F661   010C
        MOVR    R2,     R7                      ; F662   0097

        SUBR    R1,     R5                      ; F663   010D
        MOVR    R3,     R0                      ; F664   0098
        SUBR    R4,     R4                      ; F665   0124
        SAR     R0,     2                       ; F666   006C
        SUBR    R4,     R7                      ; F667   0127

        ADDR    R3,     R6                      ; F668   00DE
        MOVR    R7,     R0                      ; F669   00B8
        ADDR    R1,     R3                      ; F66A   00CB
        MOVR    R4,     R5                      ; F66B   00A5
        SUBR    R5,     R1                      ; F66C   0129
L_F66D:
        ADDR    R5,     R4                      ; F66D   00EC
        TSTR    R5                              ; F66E   00AD
        ADDR    R2,     R7                      ; F66F   00D7

        DECLE   $00C2,  $0260,  $0126,  $0095   ; F670   00C2 0260 0126 0095
        DECLE   $0128,  $00A9,  $0125,  $0081   ; F674   0128 00A9 0125 0081
        DECLE   $012A,  $00BD,  $00E5,  $00D1   ; F678   012A 00BD 00E5 00D1
        DECLE   $0380,  $00A4,  $03FF,  $0007   ; F67C   0380 00A4 03FF 0007
        DECLE   $0080,  $0034,  $007C,  $0000   ; F680   0080 0034 007C 0000

        SAR     R0,     1                       ; F684   0068
        DECR    R0                              ; F685   0010
        RRC     R0,     2                       ; F686   0074
        SUB     .IV.FIFO,R4                     ; F687   0304 0081
        MOVR    R2,     R4                      ; F689   0094
        ADDR    R0,     R1                      ; F68A   00C1
        MVI@    R4,     R0                      ; F68B   02A0
        SUBR    R4,     R4                      ; F68C   0124
        SAR     R0,     2                       ; F68D   006C
        BEQ     L_F58F                          ; F68E   0224 0100

        SAR     R3,     1                       ; F690   006B
        SUBR    R0,     R1                      ; F691   0101
        SAR     R1,     2                       ; F692   006D
        SUBR    R0,     R2                      ; F693   0102
        TSTR    R4                              ; F694   00A4
        SUBR    R0,     R3                      ; F695   0103
        MOVR    R4,     R5                      ; F696   00A5
        SUBR    R0,     R4                      ; F697   0104
        MOVR    R0,     R2                      ; F698   0082
        SUBR    R0,     R5                      ; F699   0105
        MOVR    R0,     R3                      ; F69A   0083
        SUBR    R0,     R6                      ; F69B   0106
        MOVR    R2,     R1                      ; F69C   0091
        SUBR    R0,     R7                      ; F69D   0107

        TSTR    R2                              ; F69E   0092
        SUBR    R1,     R0                      ; F69F   0108
        MOVR    R2,     R7                      ; F6A0   0097

        SUBR    R1,     R1                      ; F6A1   0109
        MOVR    R3,     R0                      ; F6A2   0098
        SUBR    R1,     R2                      ; F6A3   010A
        SARC    R2,     2                       ; F6A4   007E
        SUBR    R1,     R3                      ; F6A5   010B
        SARC    R3,     2                       ; F6A6   007F
        SUBR    R1,     R4                      ; F6A7   010C
        MOVR    R5,     R4                      ; F6A8   00AC
        SUBR    R1,     R5                      ; F6A9   010D
        TSTR    R5                              ; F6AA   00AD
        SUBR    R5,     R0                      ; F6AB   0128
        MOVR    R7,     R0                      ; F6AC   00B8
        ADDR    R1,     R3                      ; F6AD   00CB
        ADDR    R3,     R6                      ; F6AE   00DE
        SUBR    R5,     R2                      ; F6AF   012A
        ADDR    R2,     R7                      ; F6B0   00D7

        ADDR    R0,     R2                      ; F6B1   00C2
        ADDR    R5,     R4                      ; F6B2   00EC
        MVO@    R0,     R4                      ; F6B3   0260
        SUBR    R5,     R1                      ; F6B4   0129
        MOVR    R7,     R5                      ; F6B5   00BD
        SUBR    R4,     R5                      ; F6B6   0125
        TSTR    R0                              ; F6B7   0080
        SUBR    R4,     R6                      ; F6B8   0126
        MOVR    R2,     R5                      ; F6B9   0095
        SUBR    R4,     R7                      ; F6BA   0127

        DECLE   $00A9,  $012B,  $00D1,  $012C   ; F6BB   00A9 012B 00D1 012C
        DECLE   $00E5,  $0380,  $006A,  $006E   ; F6BF   00E5 0380 006A 006E
        DECLE   $00B7,  $03FF,  $0009,  $0084   ; F6C3   00B7 03FF 0009 0084
        DECLE   $0088,  $008C,  $0090,  $0008   ; F6C7   0088 008C 0090 0008
        DECLE   $0094,  $0018,  $0098,  $006C   ; F6CB   0094 0018 0098 006C
        DECLE   $0304,  $007F,  $0081,  $0095   ; F6CF   0304 007F 0081 0095
        DECLE   $00A8,  $00BC,  $00D6,  $00EB   ; F6D3   00A8 00BC 00D6 00EB
        DECLE   $0224,  $0100,  $007E,  $0101   ; F6D7   0224 0100 007E 0101
        DECLE   $0082,  $0102,  $006A,  $00B7   ; F6DB   0082 0102 006A 00B7

        SUBR    R0,     R3                      ; F6DF   0103
        SAR     R3,     1                       ; F6E0   006B
        MOVR    R7,     R0                      ; F6E1   00B8
        SUBR    R0,     R4                      ; F6E2   0104
        MOVR    R2,     R7                      ; F6E3   0097

        SUBR    R0,     R5                      ; F6E4   0105
        MOVR    R3,     R0                      ; F6E5   0098
        SUBR    R0,     R6                      ; F6E6   0106
        TSTR    R4                              ; F6E7   00A4
        SUBR    R0,     R7                      ; F6E8   0107

        MOVR    R4,     R5                      ; F6E9   00A5
        SUBR    R1,     R0                      ; F6EA   0108
        MOVR    R5,     R4                      ; F6EB   00AC
        SUBR    R1,     R1                      ; F6EC   0109
        TSTR    R5                              ; F6ED   00AD
        SUBR    R1,     R2                      ; F6EE   010A
        MOVR    R2,     R1                      ; F6EF   0091
        SUBR    R1,     R3                      ; F6F0   010B
        TSTR    R2                              ; F6F1   0092
        SUBR    R1,     R4                      ; F6F2   010C
        ADDR    R0,     R1                      ; F6F3   00C1
        SUBR    R1,     R5                      ; F6F4   010D
        ADDR    R0,     R2                      ; F6F5   00C2
        SAR     R1,     2                       ; F6F6   006D
        SUBR    R4,     R4                      ; F6F7   0124
        SAR     R0,     2                       ; F6F8   006C
        SUBR    R5,     R1                      ; F6F9   0129
        ADDR    R3,     R6                      ; F6FA   00DE
        ADDR    R1,     R3                      ; F6FB   00CB
        SUBR    R5,     R3                      ; F6FC   012B
        ADDR    R5,     R4                      ; F6FD   00EC
        ADDR    R2,     R7                      ; F6FE   00D7

        MVO@    R0,     R4                      ; F6FF   0260
        SUBR    R4,     R5                      ; F700   0125
        TSTR    R0                              ; F701   0080
        SUBR    R4,     R6                      ; F702   0126
        MOVR    R2,     R4                      ; F703   0094
        SUBR    R5,     R2                      ; F704   012A
        ADDR    R2,     R1                      ; F705   00D1
        SUBR    R4,     R7                      ; F706   0127

        DECLE   $00A9,  $0128,  $00BD,  $012C   ; F707   00A9 0128 00BD 012C
        DECLE   $00E5,  $0380,  $00CA,  $0083   ; F70B   00E5 0380 00CA 0083
        DECLE   $007D,  $03FF,  $0009,  $009C   ; F70F   007D 03FF 0009 009C
        DECLE   $0084,  $0088,  $00A0,  $003C   ; F713   0084 0088 00A0 003C
        DECLE   $0000                           ; F717   0000

        TSTR    R4                              ; F718   00A4
        DECR    R0                              ; F719   0010
        RRC     R0,     2                       ; F71A   0074
        SUB     G_0092, R4                      ; F71B   0304 0092
        MOVR    R2,     R6                      ; F71D   0096
        MOVR    R5,     R1                      ; F71E   00A9
        ADDR    R5,     R3                      ; F71F   00EB
        BEQ     L_F621                          ; F720   0224 0100

        MOVR    R2,     R1                      ; F722   0091
        ADDR    R3,     R6                      ; F723   00DE
        SUBR    R0,     R1                      ; F724   0101
        ADDR    R5,     R4                      ; F725   00EC
        MOVR    R2,     R7                      ; F726   0097

        DECLE   $0102,  $007D,  $00CA,  $0103   ; F727   0102 007D 00CA 0103
        DECLE   $007E,  $00CB,  $0104,  $00AC   ; F72B   007E 00CB 0104 00AC
        DECLE   $0105,  $00AD,  $0106,  $00B7   ; F72F   0105 00AD 0106 00B7

        SAR     R2,     1                       ; F733   006A
        SUBR    R0,     R7                      ; F734   0107

        MOVR    R7,     R0                      ; F735   00B8
        SAR     R3,     1                       ; F736   006B
        SUBR    R1,     R0                      ; F737   0108
        ADDR    R0,     R1                      ; F738   00C1
        SUBR    R1,     R1                      ; F739   0109
        ADDR    R0,     R2                      ; F73A   00C2
        SAR     R1,     2                       ; F73B   006D
        SUBR    R1,     R2                      ; F73C   010A
        TSTR    R4                              ; F73D   00A4
        SUBR    R1,     R3                      ; F73E   010B
        MOVR    R4,     R5                      ; F73F   00A5
        SUBR    R1,     R4                      ; F740   010C
        ADDR    R2,     R6                      ; F741   00D6
        MOVR    R0,     R1                      ; F742   0081
        SUBR    R1,     R5                      ; F743   010D
        ADDR    R2,     R7                      ; F744   00D7

        MOVR    R0,     R2                      ; F745   0082
        SUBR    R4,     R4                      ; F746   0124
        SAR     R0,     2                       ; F747   006C
        MVO@    R0,     R4                      ; F748   0260
        SUBR    R4,     R5                      ; F749   0125
        TSTR    R0                              ; F74A   0080
        SUBR    R4,     R6                      ; F74B   0126
        MOVR    R2,     R4                      ; F74C   0094
        SUBR    R4,     R7                      ; F74D   0127

        MOVR    R5,     R0                      ; F74E   00A8
        SUBR    R5,     R0                      ; F74F   0128
        MOVR    R7,     R4                      ; F750   00BC
        SUBR    R5,     R1                      ; F751   0129
        MOVR    R7,     R5                      ; F752   00BD
        SUBR    R5,     R2                      ; F753   012A
        ADDR    R2,     R1                      ; F754   00D1
        SUBR    R5,     R3                      ; F755   012B
L_F756:
        ADDR    R4,     R5                      ; F756   00E5
        DECLE   $0380,  $00DD,  $0090,  $0098   ; F757   0380 00DD 0090 0098
        DECLE   $03FF                           ; F75B   03FF

        INCR    R0                              ; F75C   0008
        MOVR    R5,     R0                      ; F75D   00A8
        MOVR    R5,     R4                      ; F75E   00AC
        MOVR    R6,     R0                      ; F75F   00B0
        MOVR    R6,     R4                      ; F760   00B4
        MOVR    R7,     R0                      ; F761   00B8
        MOVR    R7,     R4                      ; F762   00BC
        ADDR    R0,     R0                      ; F763   00C0
        ADDR    R0,     R4                      ; F764   00C4
        SUB     G_007F, R4                      ; F765   0304 007F
        MOVR    R4,     R5                      ; F767   00A5
        MOVR    R5,     R3                      ; F768   00AB
        MOVR    R7,     R5                      ; F769   00BD
        ADDR    R2,     R0                      ; F76A   00D0
        ADDR    R4,     R4                      ; F76B   00E4
        BEQ     L_F66D                          ; F76C   0224 0100

        TSTR    R4                              ; F76E   00A4
        SUBR    R0,     R1                      ; F76F   0101
        MOVR    R5,     R4                      ; F770   00AC
        SUBR    R0,     R2                      ; F771   0102
        MOVR    R2,     R0                      ; F772   0090
        ADDR    R3,     R5                      ; F773   00DD
        SUBR    R0,     R3                      ; F774   0103
        MOVR    R2,     R1                      ; F775   0091
        ADDR    R3,     R6                      ; F776   00DE
        SUBR    R0,     R4                      ; F777   0104
        ADDR    R0,     R1                      ; F778   00C1
        SUBR    R0,     R5                      ; F779   0105
        ADDR    R0,     R2                      ; F77A   00C2
        SUBR    R0,     R6                      ; F77B   0106
        SARC    R1,     2                       ; F77C   007D
        ADDR    R1,     R2                      ; F77D   00CA
        SUBR    R0,     R7                      ; F77E   0107

        SARC    R2,     2                       ; F77F   007E
        ADDR    R1,     R3                      ; F780   00CB
        SUBR    R1,     R0                      ; F781   0108
        ADDR    R2,     R6                      ; F782   00D6
        MOVR    R0,     R1                      ; F783   0081
        SUBR    R1,     R1                      ; F784   0109
        ADDR    R2,     R7                      ; F785   00D7

        DECLE   $0082,  $010A,  $00B7           ; F786   0082 010A 00B7

        SUBR    R1,     R3                      ; F789   010B
        MOVR    R7,     R0                      ; F78A   00B8
        SUBR    R1,     R4                      ; F78B   010C
        ADDR    R5,     R3                      ; F78C   00EB
        MOVR    R2,     R6                      ; F78D   0096
        SUBR    R1,     R5                      ; F78E   010D
        ADDR    R5,     R4                      ; F78F   00EC
        MOVR    R2,     R7                      ; F790   0097

        SUBR    R4,     R4                      ; F791   0124
        SAR     R2,     1                       ; F792   006A
        SUBR    R4,     R5                      ; F793   0125
        SAR     R3,     1                       ; F794   006B
        SUBR    R4,     R6                      ; F795   0126
        SAR     R0,     2                       ; F796   006C
        SUBR    R4,     R7                      ; F797   0127

        SAR     R1,     2                       ; F798   006D
        MVO@    R0,     R4                      ; F799   0260
        SUBR    R5,     R0                      ; F79A   0128
        TSTR    R0                              ; F79B   0080
        SUBR    R5,     R1                      ; F79C   0129
        MOVR    R2,     R4                      ; F79D   0094
        SUBR    R5,     R2                      ; F79E   012A
        MOVR    R5,     R0                      ; F79F   00A8
        SUBR    R5,     R3                      ; F7A0   012B
        MOVR    R7,     R4                      ; F7A1   00BC
L_F7A2:
        SUBR    R5,     R4                      ; F7A2   012C
        DECLE   $00D1,  $012D,  $00E5,  $0380   ; F7A3   00D1 012D 00E5 0380
        DECLE   $00A3,  $00AD,  $03FF,  $000A   ; F7A7   00A3 00AD 03FF 000A
        DECLE   $00C8,  $00CC,  $00D0,  $00D4   ; F7AB   00C8 00CC 00D0 00D4
        DECLE   $00A0,  $00AC,  $0084,  $0064   ; F7AF   00A0 00AC 0084 0064
        DECLE   $00D8,  $003C,  $0304,  $0080   ; F7B3   00D8 003C 0304 0080
        DECLE   $00B8,  $00C0,  $00D1,  $0224   ; F7B7   00B8 00C0 00D1 0224
        DECLE   $0100,  $00B7                   ; F7BB   0100 00B7

        SUBR    R0,     R1                      ; F7BD   0101
        ADDR    R0,     R1                      ; F7BE   00C1
        SUBR    R0,     R2                      ; F7BF   0102
        MOVR    R4,     R3                      ; F7C0   00A3
        SUBR    R0,     R3                      ; F7C1   0103
        TSTR    R4                              ; F7C2   00A4
        SUBR    R0,     R4                      ; F7C3   0104
        ADDR    R2,     R6                      ; F7C4   00D6
        SUBR    R0,     R5                      ; F7C5   0105
        SAR     R1,     2                       ; F7C6   006D
        MOVR    R0,     R2                      ; F7C7   0082
        ADDR    R2,     R7                      ; F7C8   00D7

        SUBR    R0,     R6                      ; F7C9   0106
        SAR     R2,     1                       ; F7CA   006A
        ADDR    R3,     R5                      ; F7CB   00DD
        MOVR    R2,     R0                      ; F7CC   0090
        SUBR    R0,     R7                      ; F7CD   0107

        ADDR    R3,     R6                      ; F7CE   00DE
        SUBR    R1,     R0                      ; F7CF   0108
        ADDR    R5,     R3                      ; F7D0   00EB
        MOVR    R2,     R6                      ; F7D1   0096
        SUBR    R1,     R1                      ; F7D2   0109
        ADDR    R5,     R4                      ; F7D3   00EC
        MOVR    R2,     R7                      ; F7D4   0097

        SUBR    R1,     R2                      ; F7D5   010A
        ADDR    R1,     R2                      ; F7D6   00CA
        SUBR    R1,     R3                      ; F7D7   010B
        ADDR    R1,     R3                      ; F7D8   00CB
        SUBR    R1,     R4                      ; F7D9   010C
        MOVR    R5,     R3                      ; F7DA   00AB
        SUBR    R1,     R5                      ; F7DB   010D
        MOVR    R5,     R4                      ; F7DC   00AC
        SUBR    R4,     R4                      ; F7DD   0124
        SAR     R3,     1                       ; F7DE   006B
        SUBR    R4,     R5                      ; F7DF   0125
        SAR     R0,     2                       ; F7E0   006C
        SUBR    R4,     R6                      ; F7E1   0126
        SARC    R2,     2                       ; F7E2   007E
        MOVR    R2,     R1                      ; F7E3   0091
        SUBR    R5,     R0                      ; F7E4   0128
        MOVR    R0,     R1                      ; F7E5   0081
        MVO@    R0,     R4                      ; F7E6   0260
        SUBR    R4,     R7                      ; F7E7   0127

        SARC    R3,     2                       ; F7E8   007F
        SUBR    R5,     R1                      ; F7E9   0129
        MOVR    R2,     R4                      ; F7EA   0094
        SUBR    R5,     R2                      ; F7EB   012A
        MOVR    R5,     R0                      ; F7EC   00A8
L_F7ED:
        SUBR    R5,     R3                      ; F7ED   012B
        DECLE   $00BC,  $012C,  $00D0,  $012D   ; F7EE   00BC 012C 00D0 012D
        DECLE   $00E4,  $012E,  $00E5,  $0380   ; F7F2   00E4 012E 00E5 0380
        DECLE   $00B6,  $00C2,  $03FF,  $000B   ; F7F6   00B6 00C2 03FF 000B
        DECLE   $00DC,  $0060,  $0044,  $0088   ; F7FA   00DC 0060 0044 0088
        DECLE   $0060,  $008C,  $0090,  $0098   ; F7FE   0060 008C 0090 0098
        DECLE   $00E0,  $00B8,  $00BC,  $0304   ; F802   00E0 00B8 00BC 0304
        DECLE   $0093,  $00CB,  $00D5,  $00E5   ; F806   0093 00CB 00D5 00E5
        DECLE   $0224,  $0100,  $00CA,  $0101   ; F80A   0224 0100 00CA 0101
        DECLE   $00D6,  $0102,  $00B6,  $0103   ; F80E   00D6 0102 00B6 0103
        DECLE   $00B7                           ; F812   00B7

        SUBR    R0,     R4                      ; F813   0104
        ADDR    R5,     R3                      ; F814   00EB
        MOVR    R2,     R6                      ; F815   0096
        SUBR    R0,     R5                      ; F816   0105
        ADDR    R5,     R4                      ; F817   00EC
        MOVR    R2,     R7                      ; F818   0097

        SUBR    R0,     R6                      ; F819   0106
        MOVR    R4,     R3                      ; F81A   00A3
        SUBR    R1,     R0                      ; F81B   0108
        MOVR    R5,     R3                      ; F81C   00AB
        SUBR    R1,     R1                      ; F81D   0109
        MOVR    R5,     R4                      ; F81E   00AC
        SUBR    R1,     R2                      ; F81F   010A
        ADDR    R3,     R5                      ; F820   00DD
        SUBR    R1,     R3                      ; F821   010B
        ADDR    R3,     R6                      ; F822   00DE
        SUBR    R1,     R4                      ; F823   010C
        ADDR    R0,     R0                      ; F824   00C0
        SUBR    R1,     R5                      ; F825   010D
        ADDR    R0,     R1                      ; F826   00C1
        SUBR    R4,     R4                      ; F827   0124
        SAR     R2,     1                       ; F828   006A
        SUBR    R4,     R5                      ; F829   0125
        SAR     R3,     1                       ; F82A   006B
        SUBR    R4,     R6                      ; F82B   0126
        MOVR    R0,     R1                      ; F82C   0081
        SAR     R0,     2                       ; F82D   006C
        SUBR    R4,     R7                      ; F82E   0127

        TSTR    R4                              ; F82F   00A4
        MOVR    R2,     R1                      ; F830   0091
        SARC    R2,     2                       ; F831   007E
        MVO@    R0,     R4                      ; F832   0260
        SUBR    R5,     R0                      ; F833   0128
        SARC    R3,     2                       ; F834   007F
        SUBR    R5,     R1                      ; F835   0129
        MOVR    R2,     R4                      ; F836   0094
        SUBR    R5,     R2                      ; F837   012A
        MOVR    R5,     R0                      ; F838   00A8
        SUBR    R5,     R3                      ; F839   012B
        MOVR    R7,     R4                      ; F83A   00BC
        SUBR    R5,     R4                      ; F83B   012C
        ADDR    R2,     R0                      ; F83C   00D0
        SUBR    R5,     R5                      ; F83D   012D
        ADDR    R4,     R4                      ; F83E   00E4
L_F83F:
        AND     G_00C9, R0                      ; F83F   0380 00C9
        MOVR    R0,     R2                      ; F841   0082
        ADDR    R2,     R7                      ; F842   00D7

        DECLE   $006D,  $03FF                   ; F843   006D 03FF

        INCR    R2                              ; F845   000A
        ADDR    R4,     R4                      ; F846   00E4
        ADDR    R5,     R0                      ; F847   00E8
        DECR    R0                              ; F848   0010
        SWAP    R0,     2                       ; F849   0044
        MOVR    R1,     R0                      ; F84A   0088
        MOVR    R4,     R0                      ; F84B   00A0
        NOP                                     ; F84C   0034
        RSWD    R4                              ; F84D   003C
        RRC     R0,     2                       ; F84E   0074
        SLR     R0,     2                       ; F84F   0064
        SUB     G_0094, R4                      ; F850   0304 0094
        MOVR    R4,     R7                      ; F852   00A7

        ADDR    R3,     R6                      ; F853   00DE
        ADDR    R5,     R2                      ; F854   00EA
        BEQ     L_F756                          ; F855   0224 0100

        ADDR    R3,     R5                      ; F857   00DD
        SUBR    R0,     R1                      ; F858   0101
        ADDR    R5,     R3                      ; F859   00EB
        SUBR    R0,     R2                      ; F85A   0102
        ADDR    R1,     R1                      ; F85B   00C9
        SUBR    R0,     R3                      ; F85C   0103
        ADDR    R1,     R2                      ; F85D   00CA
        SUBR    R0,     R4                      ; F85E   0104
        MOVR    R5,     R3                      ; F85F   00AB
        SUBR    R0,     R5                      ; F860   0105
        MOVR    R5,     R4                      ; F861   00AC
        SUBR    R0,     R6                      ; F862   0106
        TSTR    R6                              ; F863   00B6
        SARC    R1,     2                       ; F864   007D
        SUBR    R1,     R0                      ; F865   0108
        ADDR    R0,     R0                      ; F866   00C0
        SUBR    R1,     R1                      ; F867   0109
        ADDR    R0,     R1                      ; F868   00C1
        SUBR    R1,     R4                      ; F869   010C
        ADDR    R2,     R5                      ; F86A   00D5
        SUBR    R1,     R5                      ; F86B   010D
        ADDR    R2,     R6                      ; F86C   00D6
        SUBR    R4,     R4                      ; F86D   0124
        SAR     R2,     1                       ; F86E   006A
        SUBR    R4,     R5                      ; F86F   0125
        SAR     R3,     1                       ; F870   006B
        SUBR    R4,     R6                      ; F871   0126
        SAR     R0,     2                       ; F872   006C
        SUBR    R4,     R7                      ; F873   0127

        DECLE   $007E,  $0129,  $0096,  $0081   ; F874   007E 0129 0096 0081
        DECLE   $012A,  $00B7                   ; F878   012A 00B7

        TSTR    R4                              ; F87A   00A4
        MOVR    R2,     R1                      ; F87B   0091
        MVO@    R0,     R4                      ; F87C   0260
        SUBR    R5,     R0                      ; F87D   0128
        SARC    R3,     2                       ; F87E   007F
        SUBR    R5,     R3                      ; F87F   012B
        MOVR    R2,     R3                      ; F880   0093
        SUBR    R5,     R4                      ; F881   012C
        MOVR    R5,     R0                      ; F882   00A8
        SUBR    R5,     R5                      ; F883   012D
        MOVR    R7,     R4                      ; F884   00BC
        SUBR    R5,     R6                      ; F885   012E
        ADDR    R2,     R0                      ; F886   00D0
        SUBR    R5,     R7                      ; F887   012F

        ADDR    R4,     R4                      ; F888   00E4
        AND     G_0069, R0                      ; F889   0380 0069
        MOVR    R2,     R7                      ; F88B   0097

        DECLE   $00EC,  $03FF                   ; F88C   00EC 03FF

        INCR    R4                              ; F88E   000C
        ADDR    R5,     R4                      ; F88F   00EC
L_F890:
        ADDR    R6,     R0                      ; F890   00F0
        ADDR    R6,     R4                      ; F891   00F4
        SWAP    R0,     2                       ; F892   0044
        ADDR    R7,     R0                      ; F893   00F8
        COMR    R0                              ; F894   0018
        SWAP    R0,     2                       ; F895   0044
        ADDR    R7,     R4                      ; F896   00FC
        SUBR    R0,     R0                      ; F897   0100
        RLC     R0,     1                       ; F898   0050
        ADDR    R0,     R0                      ; F899   00C0
        ADDR    R0,     R4                      ; F89A   00C4
        SUB     G_007E, R4                      ; F89B   0304 007E
        TSTR    R0                              ; F89D   0080
        MOVR    R2,     R5                      ; F89E   0095
        MOVR    R5,     R0                      ; F89F   00A8
        MOVR    R5,     R2                      ; F8A0   00AA
        MOVR    R7,     R3                      ; F8A1   00BB
        ADDR    R1,     R7                      ; F8A2   00CF

        ADDR    R4,     R3                      ; F8A3   00E3
        BEQ     L_F7A2                          ; F8A4   0224 0103

        ADDR    R3,     R5                      ; F8A6   00DD
        SUBR    R0,     R4                      ; F8A7   0104
        ADDR    R0,     R0                      ; F8A8   00C0
        SUBR    R0,     R5                      ; F8A9   0105
        ADDR    R0,     R1                      ; F8AA   00C1
        SUBR    R0,     R6                      ; F8AB   0106
        ADDR    R1,     R1                      ; F8AC   00C9
        MOVR    R2,     R0                      ; F8AD   0090
        TSTR    R6                              ; F8AE   00B6
        MOVR    R4,     R3                      ; F8AF   00A3
        SUBR    R1,     R0                      ; F8B0   0108
        ADDR    R2,     R5                      ; F8B1   00D5
        SUBR    R1,     R1                      ; F8B2   0109
        ADDR    R2,     R6                      ; F8B3   00D6
        SUBR    R1,     R4                      ; F8B4   010C
        ADDR    R5,     R2                      ; F8B5   00EA
        SUBR    R1,     R5                      ; F8B6   010D
        ADDR    R5,     R3                      ; F8B7   00EB
        SUBR    R4,     R4                      ; F8B8   0124
        SAR     R2,     1                       ; F8B9   006A
        SUBR    R4,     R5                      ; F8BA   0125
        SAR     R3,     1                       ; F8BB   006B
        SUBR    R4,     R6                      ; F8BC   0126
        SAR     R0,     2                       ; F8BD   006C
        SUBR    R4,     R7                      ; F8BE   0127

        DECLE   $007D,  $0129,  $0081,  $0096   ; F8BF   007D 0129 0081 0096
        DECLE   $00AB,  $012A,  $00CA,  $00B7   ; F8C3   00AB 012A 00CA 00B7

        TSTR    R4                              ; F8C7   00A4
        MOVR    R2,     R1                      ; F8C8   0091
        MVO@    R0,     R4                      ; F8C9   0260
        SUBR    R5,     R0                      ; F8CA   0128
        SARC    R3,     2                       ; F8CB   007F
        SUBR    R5,     R3                      ; F8CC   012B
        MOVR    R2,     R3                      ; F8CD   0093
        SUBR    R5,     R4                      ; F8CE   012C
        MOVR    R4,     R7                      ; F8CF   00A7

        SUBR    R5,     R5                      ; F8D0   012D
        MOVR    R7,     R4                      ; F8D1   00BC
        SUBR    R5,     R6                      ; F8D2   012E
        ADDR    R2,     R0                      ; F8D3   00D0
        SUBR    R5,     R7                      ; F8D4   012F

        DECLE   $00E4,  $0380,  $00AC,  $02A0   ; F8D5   00E4 0380 00AC 02A0
        DECLE   $0115,  $0069,  $03FF,  $000C   ; F8D9   0115 0069 03FF 000C
        DECLE   $0104,  $0108,  $010C,  $0110   ; F8DD   0104 0108 010C 0110
        DECLE   $00AC,  $0010,  $0044,  $0084   ; F8E1   00AC 0010 0044 0084
        DECLE   $0088,  $00D8,  $0114,  $003C   ; F8E5   0088 00D8 0114 003C
        DECLE   $0304,  $00BC,  $00BF           ; F8E9   0304 00BC 00BF

        ADDR    R2,     R0                      ; F8EC   00D0
        BEQ     L_F7ED                          ; F8ED   0224 0101

        ADDR    R0,     R0                      ; F8EF   00C0
        SUBR    R0,     R4                      ; F8F0   0104
        ADDR    R2,     R5                      ; F8F1   00D5
        SUBR    R0,     R5                      ; F8F2   0105
        ADDR    R2,     R6                      ; F8F3   00D6
        SUBR    R0,     R7                      ; F8F4   0107

        DECLE   $00DD,  $0108,  $00EA,  $0109   ; F8F5   00DD 0108 00EA 0109
        DECLE   $00EB,  $010B,  $0091,  $00CA   ; F8F9   00EB 010B 0091 00CA
        DECLE   $00A4,  $00B7                   ; F8FD   00A4 00B7

        SUBR    R1,     R4                      ; F8FF   010C
        MOVR    R5,     R2                      ; F900   00AA
        MOVR    R2,     R5                      ; F901   0095
        TSTR    R0                              ; F902   0080
        SUBR    R2,     R6                      ; F903   0116
        SAR     R0,     2                       ; F904   006C
        SUBR    R3,     R3                      ; F905   011B
        SAR     R3,     1                       ; F906   006B
        SUBR    R4,     R4                      ; F907   0124
        SAR     R2,     1                       ; F908   006A
        SUBR    R4,     R5                      ; F909   0125
        SARC    R1,     2                       ; F90A   007D
        SUBR    R5,     R0                      ; F90B   0128
        MOVR    R5,     R3                      ; F90C   00AB
        MOVR    R0,     R1                      ; F90D   0081
        MOVR    R2,     R6                      ; F90E   0096
        SUBR    R5,     R1                      ; F90F   0129
        ADDR    R1,     R1                      ; F910   00C9
        TSTR    R6                              ; F911   00B6
        MOVR    R4,     R3                      ; F912   00A3
        MOVR    R2,     R0                      ; F913   0090
        MVO@    R0,     R4                      ; F914   0260
        SUBR    R4,     R7                      ; F915   0127

        SARC    R3,     2                       ; F916   007F
        SUBR    R4,     R6                      ; F917   0126
        SARC    R2,     2                       ; F918   007E
        SUBR    R5,     R2                      ; F919   012A
        MOVR    R2,     R3                      ; F91A   0093
        SUBR    R5,     R3                      ; F91B   012B
        MOVR    R4,     R7                      ; F91C   00A7

        SUBR    R5,     R4                      ; F91D   012C
        MOVR    R7,     R3                      ; F91E   00BB
        SUBR    R5,     R5                      ; F91F   012D
        ADDR    R1,     R7                      ; F920   00CF

        SUBR    R5,     R6                      ; F921   012E
        ADDR    R4,     R3                      ; F922   00E3
        SUBR    R5,     R7                      ; F923   012F

        DECLE   $00E4,  $0380,  $0068,  $00C1   ; F924   00E4 0380 0068 00C1
        DECLE   $02A0,  $0114,  $0069,  $03FF   ; F928   02A0 0114 0069 03FF

        INCR    R4                              ; F92C   000C
        SUBR    R3,     R0                      ; F92D   0118
        SUBR    R3,     R4                      ; F92E   011C
        MOVR    R7,     R0                      ; F92F   00B8
        SUBR    R4,     R0                      ; F930   0120
        NEGR    R0                              ; F931   0020
        SUBR    R4,     R4                      ; F932   0124
        MOVR    R2,     R0                      ; F933   0090
        MOVR    R6,     R0                      ; F934   00B0
        SUBR    R5,     R0                      ; F935   0128
        SUBR    R5,     R4                      ; F936   012C
        SUBR    R6,     R0                      ; F937   0130
        SUBR    R6,     R4                      ; F938   0134
        SUB     G_007D, R4                      ; F939   0304 007D
        SARC    R3,     2                       ; F93B   007F
        MOVR    R2,     R1                      ; F93C   0091
        ADDR    R2,     R4                      ; F93D   00D4
        ADDR    R4,     R4                      ; F93E   00E4
        BEQ     L_F83F                          ; F93F   0224 0101

        ADDR    R2,     R5                      ; F941   00D5
        SUBR    R0,     R4                      ; F942   0104
        ADDR    R5,     R2                      ; F943   00EA
        SUBR    R0,     R5                      ; F944   0105
        ADDR    R5,     R3                      ; F945   00EB
        SUBR    R1,     R2                      ; F946   010A
        TSTR    R6                              ; F947   00B6
        ADDR    R1,     R1                      ; F948   00C9
        MOVR    R4,     R3                      ; F949   00A3
        SUBR    R1,     R5                      ; F94A   010D
        MOVR    R2,     R6                      ; F94B   0096
        ADDR    R0,     R0                      ; F94C   00C0
        MOVR    R5,     R3                      ; F94D   00AB
        SUBR    R2,     R0                      ; F94E   0110
        TSTR    R0                              ; F94F   0080
        SUBR    R2,     R1                      ; F950   0111
        SAR     R3,     1                       ; F951   006B
        SUBR    R4,     R4                      ; F952   0124
        SAR     R1,     1                       ; F953   0069
        SUBR    R4,     R5                      ; F954   0125
        SAR     R2,     1                       ; F955   006A
        SUBR    R4,     R7                      ; F956   0127

        DECLE   $0081,  $0128,  $0090,  $012A   ; F957   0081 0128 0090 012A
        DECLE   $00BF,  $0095,  $00AA,  $012B   ; F95B   00BF 0095 00AA 012B
        DECLE   $00B7                           ; F95F   00B7

        TSTR    R4                              ; F960   00A4
        ADDR    R3,     R5                      ; F961   00DD
        ADDR    R1,     R2                      ; F962   00CA
        MVO@    R0,     R4                      ; F963   0260
        SUBR    R5,     R1                      ; F964   0129
        MOVR    R2,     R3                      ; F965   0093
        SUBR    R4,     R6                      ; F966   0126
        SARC    R2,     2                       ; F967   007E
        SUBR    R5,     R4                      ; F968   012C
        MOVR    R4,     R7                      ; F969   00A7

        SUBR    R5,     R5                      ; F96A   012D
        MOVR    R7,     R3                      ; F96B   00BB
        SUBR    R5,     R6                      ; F96C   012E
        ADDR    R1,     R7                      ; F96D   00CF
        SUBR    R5,     R7                      ; F96E   012F

        DECLE   $00E3,  $0380,  $007C,  $00D6   ; F96F   00E3 0380 007C 00D6
        DECLE   $006C,  $02A0,  $0115,  $0068   ; F973   006C 02A0 0115 0068
        DECLE   $03FF,  $000C,  $0138,  $013C   ; F977   03FF 000C 0138 013C
        DECLE   $0140,  $0020,  $0144,  $00A0   ; F97B   0140 0020 0144 00A0
        DECLE   $0038,  $0058,  $00AC,  $00A4   ; F97F   0038 0058 00AC 00A4
        DECLE   $0074,  $0064,  $0304,  $007D   ; F983   0074 0064 0304 007D
        DECLE   $007F,  $0092,  $00A4,  $00A6   ; F987   007F 0092 00A4 00A6
        DECLE   $00B7                           ; F98B   00B7

        MOVR    R7,     R2                      ; F98C   00BA
        ADDR    R1,     R2                      ; F98D   00CA
L_F98E:
        ADDR    R3,     R5                      ; F98E   00DD
        ADDR    R5,     R1                      ; F98F   00E9
        BEQ     L_F890                          ; F990   0224 0101

        ADDR    R5,     R2                      ; F992   00EA
        SUBR    R1,     R1                      ; F993   0109
        MOVR    R0,     R1                      ; F994   0081
        ADDR    R0,     R0                      ; F995   00C0
        MOVR    R5,     R3                      ; F996   00AB
        MOVR    R2,     R6                      ; F997   0096
        SUBR    R1,     R4                      ; F998   010C
        ADDR    R2,     R4                      ; F999   00D4
        SUBR    R1,     R5                      ; F99A   010D
        ADDR    R2,     R5                      ; F99B   00D5
        SUBR    R2,     R0                      ; F99C   0110
        TSTR    R0                              ; F99D   0080
        SUBR    R2,     R3                      ; F99E   0113
        MOVR    R2,     R0                      ; F99F   0090
        SUBR    R4,     R4                      ; F9A0   0124
        SAR     R1,     1                       ; F9A1   0069
        SUBR    R4,     R5                      ; F9A2   0125
        SAR     R2,     1                       ; F9A3   006A
        SUBR    R4,     R6                      ; F9A4   0126
        SAR     R3,     1                       ; F9A5   006B
        SUBR    R4,     R7                      ; F9A6   0127

        DECLE   $007C,  $012A,  $0095,  $00AA   ; F9A7   007C 012A 0095 00AA
        DECLE   $00BF                           ; F9AB   00BF

        SUBR    R5,     R3                      ; F9AC   012B
        TSTR    R6                              ; F9AD   00B6
        MOVR    R4,     R3                      ; F9AE   00A3
        ADDR    R1,     R1                      ; F9AF   00C9
        MVO@    R0,     R4                      ; F9B0   0260
        SUBR    R5,     R0                      ; F9B1   0128
        SARC    R2,     2                       ; F9B2   007E
        SUBR    R5,     R1                      ; F9B3   0129
        MOVR    R2,     R3                      ; F9B4   0093
        SUBR    R5,     R4                      ; F9B5   012C
        MOVR    R4,     R7                      ; F9B6   00A7

        SUBR    R5,     R5                      ; F9B7   012D
        MOVR    R7,     R3                      ; F9B8   00BB
        SUBR    R5,     R6                      ; F9B9   012E
        ADDR    R1,     R7                      ; F9BA   00CF
        SUBR    R5,     R7                      ; F9BB   012F

        ADDR    R4,     R3                      ; F9BC   00E3
        AND     G_0067, R0                      ; F9BD   0380 0067
        MOVR    R1,     R7                      ; F9BF   008F

        DECLE   $00EB,  $00A2,  $00B5,  $02A0   ; F9C0   00EB 00A2 00B5 02A0
        DECLE   $0114,  $0068,  $03FF           ; F9C4   0114 0068 03FF

        INCR    R4                              ; F9C7   000C
        CMPR    R1,     R0                      ; F9C8   0148
        CMPR    R1,     R4                      ; F9C9   014C
        SUBR    R1,     R4                      ; F9CA   010C
        CMPR    R2,     R0                      ; F9CB   0150
        CMPR    R2,     R4                      ; F9CC   0154
        MOVR    R1,     R4                      ; F9CD   008C
        SLL     R0,     2                       ; F9CE   004C
        INCR    R0                              ; F9CF   0008
        CMPR    R3,     R0                      ; F9D0   0158
        CMPR    R3,     R4                      ; F9D1   015C
        MOVR    R2,     R4                      ; F9D2   0094
        MOVR    R3,     R0                      ; F9D3   0098
        SUB     G_007C, R4                      ; F9D4   0304 007C
        MOVR    R2,     R0                      ; F9D6   0090
        MOVR    R2,     R3                      ; F9D7   0093
        MOVR    R4,     R7                      ; F9D8   00A7

        DECLE   $00BB,  $00CE,  $00E2,  $0224   ; F9D9   00BB 00CE 00E2 0224
        DECLE   $0102,  $00B5,  $00A2,  $0103   ; F9DD   0102 00B5 00A2 0103
        DECLE   $00B6,  $00C9,  $0104,  $00BF   ; F9E1   00B6 00C9 0104 00BF

        MOVR    R2,     R5                      ; F9E5   0095
        MOVR    R5,     R2                      ; F9E6   00AA
        SUBR    R0,     R5                      ; F9E7   0105
        MOVR    R5,     R3                      ; F9E8   00AB
        MOVR    R0,     R1                      ; F9E9   0081
        ADDR    R0,     R0                      ; F9EA   00C0
        MOVR    R2,     R6                      ; F9EB   0096
        SUBR    R1,     R0                      ; F9EC   0108
        ADDR    R2,     R4                      ; F9ED   00D4
        SUBR    R1,     R1                      ; F9EE   0109
        ADDR    R2,     R5                      ; F9EF   00D5
        SUBR    R1,     R4                      ; F9F0   010C
        ADDR    R5,     R1                      ; F9F1   00E9
        SUBR    R1,     R5                      ; F9F2   010D
        ADDR    R5,     R2                      ; F9F3   00EA
        SUBR    R2,     R3                      ; F9F4   0113
        MOVR    R4,     R3                      ; F9F5   00A3
        SUBR    R2,     R6                      ; F9F6   0116
        SAR     R3,     1                       ; F9F7   006B
        SUBR    R3,     R2                      ; F9F8   011A
        SARC    R3,     2                       ; F9F9   007F
        SAR     R0,     1                       ; F9FA   0068
        SUBR    R4,     R4                      ; F9FB   0124
        SAR     R1,     1                       ; F9FC   0069
        SUBR    R4,     R5                      ; F9FD   0125
        SAR     R2,     1                       ; F9FE   006A
        SUBR    R5,     R0                      ; F9FF   0128
        TSTR    R0                              ; FA00   0080
        SUBR    R5,     R1                      ; FA01   0129
        MOVR    R1,     R7                      ; FA02   008F

        MVO@    R0,     R4                      ; FA03   0260
        SUBR    R4,     R6                      ; FA04   0126
        SARC    R1,     2                       ; FA05   007D
        SUBR    R4,     R7                      ; FA06   0127

        SARC    R2,     2                       ; FA07   007E
        SUBR    R5,     R2                      ; FA08   012A
        TSTR    R2                              ; FA09   0092
        SUBR    R5,     R3                      ; FA0A   012B
        MOVR    R4,     R6                      ; FA0B   00A6
        SUBR    R5,     R4                      ; FA0C   012C
        MOVR    R7,     R2                      ; FA0D   00BA
        SUBR    R5,     R5                      ; FA0E   012D
        ADDR    R1,     R7                      ; FA0F   00CF

        DECLE   $012E,  $00E3,  $0380,  $007B   ; FA10   012E 00E3 0380 007B
        DECLE   $02A0,  $0115,  $0067,  $03FF   ; FA14   02A0 0115 0067 03FF

        INCR    R3                              ; FA18   000B
        CMPR    R4,     R0                      ; FA19   0160
        CMPR    R4,     R4                      ; FA1A   0164
        CMPR    R5,     R0                      ; FA1B   0168
        SUBR    R4,     R0                      ; FA1C   0120
        CMPR    R5,     R4                      ; FA1D   016C
        CMPR    R0,     R4                      ; FA1E   0144
        CMPR    R6,     R0                      ; FA1F   0170
        CMPR    R6,     R4                      ; FA20   0174
        SLR     R0,     2                       ; FA21   0064
        ADDR    R3,     R0                      ; FA22   00D8
        RSWD    R4                              ; FA23   003C
        SUB     G_007C, R4                      ; FA24   0304 007C
        SARC    R2,     2                       ; FA26   007E
        MOVR    R2,     R1                      ; FA27   0091
        MOVR    R2,     R4                      ; FA28   0094
        MOVR    R4,     R3                      ; FA29   00A3
        MOVR    R4,     R5                      ; FA2A   00A5
L_FA2B:
        MOVR    R5,     R1                      ; FA2B   00A9
        MOVR    R7,     R6                      ; FA2C   00BE
        ADDR    R1,     R7                      ; FA2D   00CF

        DECLE   $00D3,  $0224,  $0101,  $00AA   ; FA2E   00D3 0224 0101 00AA
        DECLE   $0080,  $0095,  $00BF           ; FA32   0080 0095 00BF

        SUBR    R0,     R4                      ; FA35   0104
        ADDR    R2,     R4                      ; FA36   00D4
        SUBR    R0,     R5                      ; FA37   0105
        ADDR    R2,     R5                      ; FA38   00D5
        SUBR    R0,     R6                      ; FA39   0106
        MOVR    R6,     R5                      ; FA3A   00B5
        SUBR    R0,     R7                      ; FA3B   0107

        ADDR    R1,     R1                      ; FA3C   00C9
        TSTR    R6                              ; FA3D   00B6
        SUBR    R1,     R0                      ; FA3E   0108
        ADDR    R5,     R1                      ; FA3F   00E9
        SUBR    R1,     R1                      ; FA40   0109
        ADDR    R5,     R2                      ; FA41   00EA
        SUBR    R2,     R2                      ; FA42   0112
        MOVR    R4,     R2                      ; FA43   00A2
        SUBR    R2,     R3                      ; FA44   0113
        MOVR    R1,     R7                      ; FA45   008F

        SUBR    R2,     R6                      ; FA46   0116
        SAR     R3,     1                       ; FA47   006B
        SUBR    R3,     R2                      ; FA48   011A
        SARC    R3,     2                       ; FA49   007F
        SUBR    R4,     R4                      ; FA4A   0124
        SAR     R0,     1                       ; FA4B   0068
        SUBR    R4,     R5                      ; FA4C   0125
        SAR     R1,     1                       ; FA4D   0069
        SUBR    R4,     R6                      ; FA4E   0126
        SAR     R2,     1                       ; FA4F   006A
        SUBR    R4,     R7                      ; FA50   0127

        DECLE   $007B,  $0260,  $0128,  $007D   ; FA51   007B 0260 0128 007D
        DECLE   $0129,  $0092,  $012A,  $00A6   ; FA55   0129 0092 012A 00A6
        DECLE   $012B,  $00BA,  $012C,  $00CE   ; FA59   012B 00BA 012C 00CE
        DECLE   $012D,  $00E2,  $012E,  $00E3   ; FA5D   012D 00E2 012E 00E3
        DECLE   $0380,  $00C0,  $008E,  $0096   ; FA61   0380 00C0 008E 0096
        DECLE   $00AB,  $007A,  $0066,  $0081   ; FA65   00AB 007A 0066 0081
        DECLE   $02A0,  $0114,  $0067,  $03FF   ; FA69   02A0 0114 0067 03FF

        INCR    R3                              ; FA6D   000B
        CMPR    R7,     R0                      ; FA6E   0178
        CMPR    R1,     R4                      ; FA6F   014C
        CMPR    R4,     R4                      ; FA70   0164
        CMPR    R2,     R0                      ; FA71   0150
        CMPR    R7,     R4                      ; FA72   017C
        CMPR    R3,     R0                      ; FA73   0158
        ANDR    R0,     R0                      ; FA74   0180
        ANDR    R0,     R4                      ; FA75   0184
        ADDR    R4,     R0                      ; FA76   00E0
        MOVR    R7,     R0                      ; FA77   00B8
        MOVR    R7,     R4                      ; FA78   00BC
L_FA79:
        SUB     G_007B, R4                      ; FA79   0304 007B
        MOVR    R1,     R7                      ; FA7B   008F

        DECLE   $0092,  $00A6,  $00B6,  $00B9   ; FA7C   0092 00A6 00B6 00B9
        DECLE   $00C9,  $00CD,  $00E3,  $00E8   ; FA80   00C9 00CD 00E3 00E8
        DECLE   $0224,  $0100,  $00B5,  $0101   ; FA84   0224 0100 00B5 0101
        DECLE   $00E9,  $0108,  $00BE,  $0094   ; FA88   00E9 0108 00BE 0094
        DECLE   $00A9,  $0109,  $00BF           ; FA8C   00A9 0109 00BF

        MOVR    R5,     R2                      ; FA8F   00AA
        MOVR    R2,     R5                      ; FA90   0095
        SUBR    R1,     R4                      ; FA91   010C
        ADDR    R2,     R3                      ; FA92   00D3
        SUBR    R1,     R5                      ; FA93   010D
        ADDR    R2,     R4                      ; FA94   00D4
        SUBR    R2,     R2                      ; FA95   0112
        MOVR    R1,     R6                      ; FA96   008E
        SUBR    R2,     R3                      ; FA97   0113
        MOVR    R4,     R2                      ; FA98   00A2
        SUBR    R2,     R6                      ; FA99   0116
        SAR     R2,     1                       ; FA9A   006A
        SUBR    R3,     R2                      ; FA9B   011A
        SARC    R2,     2                       ; FA9C   007E
        SUBR    R3,     R3                      ; FA9D   011B
        SARC    R3,     2                       ; FA9E   007F
        SUBR    R4,     R4                      ; FA9F   0124
        SLR     R3,     2                       ; FAA0   0067
        SUBR    R4,     R5                      ; FAA1   0125
        SAR     R0,     1                       ; FAA2   0068
        SUBR    R4,     R6                      ; FAA3   0126
        SAR     R1,     1                       ; FAA4   0069
        SUBR    R4,     R7                      ; FAA5   0127

        SARC    R2,     1                       ; FAA6   007A
        SUBR    R5,     R2                      ; FAA7   012A
        TSTR    R0                              ; FAA8   0080
        MVO@    R0,     R4                      ; FAA9   0260
        SUBR    R5,     R1                      ; FAAA   0129
        SARC    R1,     2                       ; FAAB   007D
        SUBR    R5,     R0                      ; FAAC   0128
        SARC    R0,     2                       ; FAAD   007C
        SUBR    R5,     R3                      ; FAAE   012B
        MOVR    R2,     R1                      ; FAAF   0091
        SUBR    R5,     R4                      ; FAB0   012C
        MOVR    R4,     R5                      ; FAB1   00A5
        SUBR    R5,     R5                      ; FAB2   012D
        MOVR    R7,     R2                      ; FAB3   00BA
        SUBR    R5,     R6                      ; FAB4   012E
        ADDR    R1,     R6                      ; FAB5   00CE
        SUBR    R5,     R7                      ; FAB6   012F

        DECLE   $00E2,  $0380,  $00D5,  $00EA   ; FAB7   00E2 0380 00D5 00EA
        DECLE   $00A1,  $0065,  $006B,  $02A0   ; FABB   00A1 0065 006B 02A0
        DECLE   $0114,  $0066,  $03FF           ; FABF   0114 0066 03FF

        INCR    R4                              ; FAC2   000C
        ANDR    R1,     R0                      ; FAC3   0188
        CMPR    R1,     R4                      ; FAC4   014C
        CMPR    R4,     R4                      ; FAC5   0164
        ANDR    R1,     R4                      ; FAC6   018C
        ANDR    R2,     R0                      ; FAC7   0190
L_FAC8:
        SUBR    R4,     R0                      ; FAC8   0120
        DECLE   $00D4,  $0194,  $0088,  $00D8   ; FAC9   00D4 0194 0088 00D8
        DECLE   $003C,  $0074,  $0304,  $007B   ; FACD   003C 0074 0304 007B
        DECLE   $007D,  $0090,  $0093,  $00BA   ; FAD1   007D 0090 0093 00BA
        DECLE   $0224,  $0102,  $00A1,  $0103   ; FAD5   0224 0102 00A1 0103
        DECLE   $00B5,  $0104,  $00BE,  $0094   ; FAD9   00B5 0104 00BE 0094
        DECLE   $00A9,  $0105,  $00BF           ; FADD   00A9 0105 00BF

        MOVR    R5,     R2                      ; FAE0   00AA
        MOVR    R2,     R5                      ; FAE1   0095
        SUBR    R1,     R0                      ; FAE2   0108
        ADDR    R2,     R3                      ; FAE3   00D3
        SUBR    R1,     R1                      ; FAE4   0109
        ADDR    R2,     R4                      ; FAE5   00D4
        SUBR    R1,     R4                      ; FAE6   010C
        ADDR    R5,     R0                      ; FAE7   00E8
        SUBR    R1,     R5                      ; FAE8   010D
        ADDR    R5,     R1                      ; FAE9   00E9
        SUBR    R2,     R0                      ; FAEA   0110
        SARC    R2,     2                       ; FAEB   007E
        SUBR    R2,     R1                      ; FAEC   0111
        SARC    R3,     2                       ; FAED   007F
        SUBR    R2,     R3                      ; FAEE   0113
        MOVR    R4,     R2                      ; FAEF   00A2
        SUBR    R3,     R2                      ; FAF0   011A
        SLR     R2,     2                       ; FAF1   0066
        SUBR    R4,     R4                      ; FAF2   0124
        SLR     R3,     2                       ; FAF3   0067
        SUBR    R4,     R5                      ; FAF4   0125
        SAR     R0,     1                       ; FAF5   0068
        SUBR    R4,     R6                      ; FAF6   0126
        SAR     R1,     1                       ; FAF7   0069
        SUBR    R4,     R7                      ; FAF8   0127

        SARC    R2,     1                       ; FAF9   007A
        SUBR    R5,     R1                      ; FAFA   0129
        MOVR    R1,     R6                      ; FAFB   008E
        MVO@    R0,     R4                      ; FAFC   0260
        SUBR    R5,     R0                      ; FAFD   0128
        SARC    R0,     2                       ; FAFE   007C
        SUBR    R5,     R2                      ; FAFF   012A
        MOVR    R2,     R1                      ; FB00   0091
        SUBR    R5,     R3                      ; FB01   012B
        MOVR    R4,     R5                      ; FB02   00A5
        SUBR    R5,     R4                      ; FB03   012C
        MOVR    R7,     R1                      ; FB04   00B9
        SUBR    R5,     R5                      ; FB05   012D
        ADDR    R1,     R5                      ; FB06   00CD
        SUBR    R5,     R6                      ; FB07   012E
        ADDR    R1,     R6                      ; FB08   00CE
        SUBR    R5,     R7                      ; FB09   012F

        ADDR    R4,     R2                      ; FB0A   00E2
        AND     G_008D, R0                      ; FB0B   0380 008D
        SAR     R2,     1                       ; FB0D   006A
        SARC    R1,     1                       ; FB0E   0079
L_FB0F:
        TSTR    R0                              ; FB0F   0080
        DECLE   $02A0,  $0115,  $0065,  $03FF   ; FB10   02A0 0115 0065 03FF

        INCR    R4                              ; FB14   000C
        ANDR    R3,     R0                      ; FB15   0198
        ANDR    R3,     R4                      ; FB16   019C
        ANDR    R4,     R0                      ; FB17   01A0
        ANDR    R4,     R4                      ; FB18   01A4
        ANDR    R5,     R0                      ; FB19   01A8
        ANDR    R5,     R4                      ; FB1A   01AC
        ANDR    R6,     R0                      ; FB1B   01B0
        CMPR    R6,     R0                      ; FB1C   0170
        ANDR    R6,     R4                      ; FB1D   01B4
        MOVR    R7,     R0                      ; FB1E   00B8
        MOVR    R7,     R4                      ; FB1F   00BC
        ADDR    R0,     R0                      ; FB20   00C0
        SUB     G_007A, R4                      ; FB21   0304 007A
        MOVR    R1,     R6                      ; FB23   008E
        MOVR    R2,     R1                      ; FB24   0091
L_FB25:
        MOVR    R4,     R2                      ; FB25   00A2
        TSTR    R4                              ; FB26   00A4
        MOVR    R5,     R0                      ; FB27   00A8
        MOVR    R7,     R5                      ; FB28   00BD
        ADDR    R1,     R6                      ; FB29   00CE
        ADDR    R4,     R1                      ; FB2A   00E1
        BEQ     L_FA2B                          ; FB2B   0224 0101

        MOVR    R5,     R1                      ; FB2D   00A9
        MOVR    R7,     R6                      ; FB2E   00BE
        MOVR    R2,     R4                      ; FB2F   0094
        SUBR    R0,     R4                      ; FB30   0104
        ADDR    R2,     R3                      ; FB31   00D3
        SUBR    R0,     R5                      ; FB32   0105
        ADDR    R2,     R4                      ; FB33   00D4
        SUBR    R1,     R0                      ; FB34   0108
        ADDR    R5,     R0                      ; FB35   00E8
        SUBR    R1,     R1                      ; FB36   0109
        ADDR    R5,     R1                      ; FB37   00E9
        SUBR    R2,     R2                      ; FB38   0112
        MOVR    R4,     R1                      ; FB39   00A1
        SUBR    R2,     R3                      ; FB3A   0113
        MOVR    R6,     R5                      ; FB3B   00B5
        SUBR    R2,     R6                      ; FB3C   0116
        SARC    R3,     2                       ; FB3D   007F
        SAR     R1,     1                       ; FB3E   0069
        SUBR    R3,     R2                      ; FB3F   011A
        SARC    R1,     2                       ; FB40   007D
        MOVR    R2,     R3                      ; FB41   0093
        SUBR    R3,     R3                      ; FB42   011B
        SARC    R2,     2                       ; FB43   007E
        SUBR    R4,     R4                      ; FB44   0124
        SLR     R2,     2                       ; FB45   0066
        SUBR    R4,     R5                      ; FB46   0125
        SLR     R3,     2                       ; FB47   0067
        SUBR    R4,     R6                      ; FB48   0126
        SAR     R0,     1                       ; FB49   0068
        SUBR    R4,     R7                      ; FB4A   0127

        SARC    R1,     1                       ; FB4B   0079
        SUBR    R5,     R2                      ; FB4C   012A
        MOVR    R1,     R5                      ; FB4D   008D
        MVO@    R0,     R4                      ; FB4E   0260
        SUBR    R5,     R1                      ; FB4F   0129
        SARC    R0,     2                       ; FB50   007C
        SUBR    R5,     R0                      ; FB51   0128
        SARC    R3,     1                       ; FB52   007B
        SUBR    R5,     R3                      ; FB53   012B
        MOVR    R2,     R0                      ; FB54   0090
        SUBR    R5,     R4                      ; FB55   012C
L_FB56:
        MOVR    R4,     R5                      ; FB56   00A5
        SUBR    R5,     R5                      ; FB57   012D
        MOVR    R7,     R1                      ; FB58   00B9
        SUBR    R5,     R6                      ; FB59   012E
        ADDR    R1,     R5                      ; FB5A   00CD
        SUBR    R5,     R7                      ; FB5B   012F

        DECLE   $00E2,  $0380,  $00BF,  $0095   ; FB5C   00E2 0380 00BF 0095
        DECLE   $00AA,  $02A0,  $0114,  $0065   ; FB60   00AA 02A0 0114 0065
        DECLE   $03FF                           ; FB64   03FF

        INCR    R4                              ; FB65   000C
        ANDR    R7,     R0                      ; FB66   01B8
L_FB67:
        ANDR    R7,     R4                      ; FB67   01BC
        CMPR    R4,     R4                      ; FB68   0164
        CLRR    R0                              ; FB69   01C0
        XORR    R0,     R4                      ; FB6A   01C4
        XORR    R1,     R0                      ; FB6B   01C8
        SUBR    R6,     R0                      ; FB6C   0130
        XORR    R1,     R4                      ; FB6D   01CC
        XORR    R2,     R0                      ; FB6E   01D0
        RRC     R0,     2                       ; FB6F   0074
        SLR     R0,     2                       ; FB70   0064
        ADDR    R3,     R0                      ; FB71   00D8
        SUB     G_007C, R4                      ; FB72   0304 007C
        MOVR    R1,     R7                      ; FB74   008F

        TSTR    R2                              ; FB75   0092
        MOVR    R6,     R5                      ; FB76   00B5
        ADDR    R2,     R2                      ; FB77   00D2
        ADDR    R4,     R2                      ; FB78   00E2
        BEQ     L_FA79                          ; FB79   0224 0101

        ADDR    R2,     R3                      ; FB7B   00D3
        SUBR    R0,     R4                      ; FB7C   0104
        ADDR    R5,     R0                      ; FB7D   00E8
        SUBR    R0,     R5                      ; FB7E   0105
        ADDR    R5,     R1                      ; FB7F   00E9
        SUBR    R1,     R0                      ; FB80   0108
        MOVR    R5,     R0                      ; FB81   00A8
        SUBR    R1,     R1                      ; FB82   0109
        MOVR    R5,     R1                      ; FB83   00A9
        MOVR    R2,     R4                      ; FB84   0094
        SUBR    R1,     R4                      ; FB85   010C
        MOVR    R7,     R5                      ; FB86   00BD
        SUBR    R1,     R5                      ; FB87   010D
        MOVR    R7,     R6                      ; FB88   00BE
        SUBR    R2,     R0                      ; FB89   0110
        SARC    R1,     2                       ; FB8A   007D
        SUBR    R2,     R1                      ; FB8B   0111
        SARC    R2,     2                       ; FB8C   007E
        SUBR    R2,     R3                      ; FB8D   0113
        MOVR    R4,     R1                      ; FB8E   00A1
        SUBR    R3,     R2                      ; FB8F   011A
        SLR     R1,     2                       ; FB90   0065
        SUBR    R4,     R4                      ; FB91   0124
        SLR     R2,     2                       ; FB92   0066
        SUBR    R4,     R5                      ; FB93   0125
        SLR     R3,     2                       ; FB94   0067
        SUBR    R4,     R6                      ; FB95   0126
        SAR     R0,     1                       ; FB96   0068
        SUBR    R5,     R0                      ; FB97   0128
        MOVR    R1,     R5                      ; FB98   008D
        SUBR    R5,     R2                      ; FB99   012A
        MOVR    R2,     R3                      ; FB9A   0093
        MVO@    R0,     R4                      ; FB9B   0260
        SUBR    R5,     R1                      ; FB9C   0129
        MOVR    R2,     R0                      ; FB9D   0090
        SUBR    R4,     R7                      ; FB9E   0127

        SARC    R3,     1                       ; FB9F   007B
        SUBR    R5,     R3                      ; FBA0   012B
        TSTR    R4                              ; FBA1   00A4
        SUBR    R5,     R4                      ; FBA2   012C
        MOVR    R4,     R5                      ; FBA3   00A5
        SUBR    R5,     R5                      ; FBA4   012D
        MOVR    R7,     R1                      ; FBA5   00B9
        SUBR    R5,     R6                      ; FBA6   012E
        ADDR    R1,     R5                      ; FBA7   00CD
        SUBR    R5,     R7                      ; FBA8   012F

        DECLE   $00E1,  $0380,  $007F,  $00D4   ; FBA9   00E1 0380 007F 00D4
        DECLE   $0069,  $02A0,  $0114,  $0079   ; FBAD   0069 02A0 0114 0079
        DECLE   $03FF                           ; FBB1   03FF

        INCR    R4                              ; FBB2   000C
        ANDR    R3,     R0                      ; FBB3   0198
        ANDR    R3,     R4                      ; FBB4   019C
        ANDR    R4,     R0                      ; FBB5   01A0
        XORR    R2,     R4                      ; FBB6   01D4
        ANDR    R5,     R4                      ; FBB7   01AC
        XORR    R3,     R0                      ; FBB8   01D8
        ADDR    R2,     R0                      ; FBB9   00D0
        XORR    R3,     R4                      ; FBBA   01DC
        CMPR    R5,     R0                      ; FBBB   0168
        ADDR    R0,     R0                      ; FBBC   00C0
        ADDR    R0,     R4                      ; FBBD   00C4
L_FBBE:
        ADDR    R4,     R0                      ; FBBE   00E0
        SUB     G_0079, R4                      ; FBBF   0304 0079
        MOVR    R1,     R6                      ; FBC1   008E
        MOVR    R4,     R1                      ; FBC2   00A1
        MOVR    R4,     R3                      ; FBC3   00A3
        MOVR    R4,     R5                      ; FBC4   00A5
        MOVR    R7,     R0                      ; FBC5   00B8
        ADDR    R1,     R4                      ; FBC6   00CC
        ADDR    R4,     R7                      ; FBC7   00E7
        BEQ     L_FAC8                          ; FBC8   0224 0101

        ADDR    R5,     R0                      ; FBCA   00E8
        SUBR    R0,     R4                      ; FBCB   0104
        MOVR    R5,     R0                      ; FBCC   00A8
        SUBR    R0,     R5                      ; FBCD   0105
        MOVR    R5,     R1                      ; FBCE   00A9
        MOVR    R2,     R4                      ; FBCF   0094
        SUBR    R1,     R0                      ; FBD0   0108
        MOVR    R7,     R5                      ; FBD1   00BD
        SUBR    R1,     R1                      ; FBD2   0109
        MOVR    R7,     R6                      ; FBD3   00BE
        SUBR    R1,     R4                      ; FBD4   010C
        ADDR    R2,     R2                      ; FBD5   00D2
        SUBR    R1,     R5                      ; FBD6   010D
        ADDR    R2,     R3                      ; FBD7   00D3
        SUBR    R2,     R6                      ; FBD8   0116
        SAR     R0,     1                       ; FBD9   0068
        SARC    R2,     2                       ; FBDA   007E
        SUBR    R3,     R2                      ; FBDB   011A
        SARC    R0,     2                       ; FBDC   007C
        TSTR    R2                              ; FBDD   0092
        SUBR    R3,     R3                      ; FBDE   011B
        SARC    R1,     2                       ; FBDF   007D
        SUBR    R4,     R4                      ; FBE0   0124
        SLR     R1,     2                       ; FBE1   0065
        SUBR    R4,     R5                      ; FBE2   0125
        SLR     R2,     2                       ; FBE3   0066
        SUBR    R4,     R6                      ; FBE4   0126
        SLR     R3,     2                       ; FBE5   0067
        SUBR    R5,     R0                      ; FBE6   0128
        MOVR    R1,     R5                      ; FBE7   008D
        SUBR    R5,     R3                      ; FBE8   012B
        MOVR    R2,     R3                      ; FBE9   0093
        MVO@    R0,     R4                      ; FBEA   0260
        SUBR    R5,     R1                      ; FBEB   0129
        MOVR    R1,     R7                      ; FBEC   008F

        SUBR    R5,     R2                      ; FBED   012A
        MOVR    R2,     R0                      ; FBEE   0090
        SUBR    R4,     R7                      ; FBEF   0127

        SARC    R3,     1                       ; FBF0   007B
        SUBR    R5,     R4                      ; FBF1   012C
        TSTR    R4                              ; FBF2   00A4
        SUBR    R5,     R5                      ; FBF3   012D
        MOVR    R7,     R1                      ; FBF4   00B9
        SUBR    R5,     R6                      ; FBF5   012E
        ADDR    R1,     R5                      ; FBF6   00CD
        SUBR    R5,     R7                      ; FBF7   012F

        DECLE   $00E1,  $0380,  $00E9,  $03FF   ; FBF8   00E1 0380 00E9 03FF

        INCR    R4                              ; FBFC   000C
        ANDR    R1,     R0                      ; FBFD   0188
        CMPR    R1,     R4                      ; FBFE   014C
        CMPR    R4,     R4                      ; FBFF   0164
        XORR    R4,     R0                      ; FC00   01E0
        CLRR    R4                              ; FC01   01E4
        CMPR    R5,     R0                      ; FC02   0168
        XORR    R5,     R0                      ; FC03   01E8
        XORR    R5,     R4                      ; FC04   01EC
        XORR    R6,     R0                      ; FC05   01F0
        ADDR    R3,     R0                      ; FC06   00D8
L_FC07:
        RSWD    R4                              ; FC07   003C
        RRC     R0,     2                       ; FC08   0074
        SUB     G_007B, R4                      ; FC09   0304 007B
        MOVR    R1,     R5                      ; FC0B   008D
        MOVR    R2,     R0                      ; FC0C   0090
        MOVR    R7,     R1                      ; FC0D   00B9
        ADDR    R4,     R0                      ; FC0E   00E0
        BEQ     L_FB0F                          ; FC0F   0224 0101

        MOVR    R5,     R0                      ; FC11   00A8
        SUBR    R0,     R4                      ; FC12   0104
        MOVR    R7,     R5                      ; FC13   00BD
        SUBR    R0,     R5                      ; FC14   0105
        MOVR    R7,     R6                      ; FC15   00BE
        SUBR    R1,     R0                      ; FC16   0108
        ADDR    R2,     R2                      ; FC17   00D2
        SUBR    R1,     R1                      ; FC18   0109
        ADDR    R2,     R3                      ; FC19   00D3
        SUBR    R1,     R4                      ; FC1A   010C
        ADDR    R4,     R7                      ; FC1B   00E7

        SUBR    R1,     R5                      ; FC1C   010D
        ADDR    R5,     R0                      ; FC1D   00E8
        SUBR    R2,     R0                      ; FC1E   0110
        SARC    R0,     2                       ; FC1F   007C
        TSTR    R2                              ; FC20   0092
        SUBR    R2,     R1                      ; FC21   0111
        SARC    R1,     2                       ; FC22   007D
        SUBR    R4,     R4                      ; FC23   0124
        SLR     R1,     2                       ; FC24   0065
        SUBR    R4,     R5                      ; FC25   0125
        SLR     R2,     2                       ; FC26   0066
        SUBR    R4,     R6                      ; FC27   0126
        SLR     R3,     2                       ; FC28   0067
        SUBR    R5,     R1                      ; FC29   0129
L_FC2A:
        MOVR    R2,     R3                      ; FC2A   0093
        MVO@    R0,     R4                      ; FC2B   0260
        SUBR    R5,     R0                      ; FC2C   0128
        TSTR    R4                              ; FC2D   00A4
        MOVR    R1,     R7                      ; FC2E   008F
        SUBR    R4,     R7                      ; FC2F   0127

        DECLE   $008E,  $012A,  $00A3,  $012B   ; FC30   008E 012A 00A3 012B
        DECLE   $00B8,  $012C,  $00CC,  $012D   ; FC34   00B8 012C 00CC 012D
        DECLE   $00CD,  $012E,  $00E1,  $0380   ; FC38   00CD 012E 00E1 0380
        DECLE   $0068,  $007E,  $0094,  $00A9   ; FC3C   0068 007E 0094 00A9
        DECLE   $03FF                           ; FC40   03FF

        INCR    R3                              ; FC41   000B
        XORR    R6,     R4                      ; FC42   01F4
        ANDR    R3,     R4                      ; FC43   019C
        ANDR    R4,     R0                      ; FC44   01A0
        XORR    R0,     R4                      ; FC45   01C4
        XORR    R7,     R0                      ; FC46   01F8
        ADDR    R6,     R4                      ; FC47   00F4
        XORR    R7,     R4                      ; FC48   01FC
        B       L_FE4F                          ; FC49   0200 0204

        MOVR    R7,     R4                      ; FC4B   00BC
        ADDR    R0,     R0                      ; FC4C   00C0
L_FC4D:
        SUB     G_007B, R4                      ; FC4D   0304 007B
        MOVR    R1,     R5                      ; FC4F   008D
        MOVR    R2,     R1                      ; FC50   0091
        MOVR    R4,     R2                      ; FC51   00A2
        MOVR    R4,     R7                      ; FC52   00A7

        DECLE   $00B7                           ; FC53   00B7

        MOVR    R7,     R4                      ; FC54   00BC
        ADDR    R1,     R3                      ; FC55   00CB
        BEQ     L_FB56                          ; FC56   0224 0101

        MOVR    R5,     R0                      ; FC58   00A8
        SUBR    R0,     R4                      ; FC59   0104
        MOVR    R7,     R5                      ; FC5A   00BD
        SUBR    R0,     R5                      ; FC5B   0105
        MOVR    R7,     R6                      ; FC5C   00BE
        SUBR    R1,     R0                      ; FC5D   0108
        ADDR    R2,     R2                      ; FC5E   00D2
        SUBR    R1,     R1                      ; FC5F   0109
        ADDR    R2,     R3                      ; FC60   00D3
        SUBR    R1,     R4                      ; FC61   010C
        ADDR    R4,     R7                      ; FC62   00E7

        SUBR    R1,     R5                      ; FC63   010D
        ADDR    R5,     R0                      ; FC64   00E8
        SUBR    R2,     R0                      ; FC65   0110
        TSTR    R2                              ; FC66   0092
        SARC    R0,     2                       ; FC67   007C
        SUBR    R2,     R1                      ; FC68   0111
        MOVR    R2,     R3                      ; FC69   0093
        SARC    R1,     2                       ; FC6A   007D
        SUBR    R4,     R4                      ; FC6B   0124
        SLR     R1,     2                       ; FC6C   0065
        SUBR    R4,     R5                      ; FC6D   0125
        SLR     R2,     2                       ; FC6E   0066
        SUBR    R4,     R6                      ; FC6F   0126
        SLR     R3,     2                       ; FC70   0067
        MVO@    R0,     R4                      ; FC71   0260
        SUBR    R4,     R7                      ; FC72   0127

        MOVR    R1,     R6                      ; FC73   008E
        SUBR    R5,     R0                      ; FC74   0128
        MOVR    R1,     R7                      ; FC75   008F

        SUBR    R5,     R1                      ; FC76   0129
        MOVR    R4,     R3                      ; FC77   00A3
        SUBR    R5,     R2                      ; FC78   012A
        TSTR    R4                              ; FC79   00A4
        SUBR    R5,     R3                      ; FC7A   012B
        MOVR    R7,     R0                      ; FC7B   00B8
        SUBR    R5,     R4                      ; FC7C   012C
        ADDR    R1,     R4                      ; FC7D   00CC
        SUBR    R5,     R5                      ; FC7E   012D
        ADDR    R1,     R5                      ; FC7F   00CD
        SUBR    R5,     R6                      ; FC80   012E
        ADDR    R4,     R0                      ; FC81   00E0
        SUBR    R5,     R7                      ; FC82   012F

        DECLE   $00E1,  $03FF,  $000C,  $01F4   ; FC83   00E1 03FF 000C 01F4
        DECLE   $019C,  $01A0,  $0208,  $020C   ; FC87   019C 01A0 0208 020C
        DECLE   $0210,  $0214,  $0218,  $021C   ; FC8B   0210 0214 0218 021C

        SUBR    R6,     R4                      ; FC8F   0134
        MOVR    R7,     R0                      ; FC90   00B8
        B       L_F98E                          ; FC91   0220 0304

        MOVR    R0,     R1                      ; FC93   0081
        MOVR    R0,     R3                      ; FC94   0083
        MOVR    R2,     R4                      ; FC95   0094
        MOVR    R2,     R5                      ; FC96   0095
        MOVR    R2,     R7                      ; FC97   0097

        MOVR    R3,     R0                      ; FC98   0098
        MOVR    R4,     R7                      ; FC99   00A7

L_FC9A:
        MOVR    R5,     R0                      ; FC9A   00A8
        DECLE   $00A9,  $00AB,  $00AC,  $00AD   ; FC9B   00A9 00AB 00AC 00AD
        DECLE   $00BA,  $00BB,  $00BC,  $00BD   ; FC9F   00BA 00BB 00BC 00BD
        DECLE   $00BF                           ; FCA3   00BF

        ADDR    R0,     R0                      ; FCA4   00C0
        ADDR    R0,     R1                      ; FCA5   00C1
        ADDR    R0,     R2                      ; FCA6   00C2
        ADDR    R1,     R5                      ; FCA7   00CD
        ADDR    R1,     R6                      ; FCA8   00CE
        ADDR    R1,     R7                      ; FCA9   00CF

        ADDR    R2,     R0                      ; FCAA   00D0
        ADDR    R2,     R1                      ; FCAB   00D1
        ADDR    R2,     R3                      ; FCAC   00D3
        ADDR    R2,     R4                      ; FCAD   00D4
        ADDR    R2,     R5                      ; FCAE   00D5
        ADDR    R2,     R6                      ; FCAF   00D6
        ADDR    R2,     R7                      ; FCB0   00D7

        ADDR    R4,     R0                      ; FCB1   00E0
        ADDR    R4,     R1                      ; FCB2   00E1
        ADDR    R4,     R2                      ; FCB3   00E2
        ADDR    R4,     R3                      ; FCB4   00E3
        ADDR    R4,     R4                      ; FCB5   00E4
        ADDR    R4,     R5                      ; FCB6   00E5
        ADDR    R4,     R7                      ; FCB7   00E7

        ADDR    R5,     R0                      ; FCB8   00E8
        ADDR    R5,     R1                      ; FCB9   00E9
        ADDR    R5,     R2                      ; FCBA   00EA
        ADDR    R5,     R3                      ; FCBB   00EB
        ADDR    R5,     R4                      ; FCBC   00EC
        BEQ     L_FBBE                          ; FCBD   0224 0100

        SAR     R1,     2                       ; FCBF   006D
        SUBR    R0,     R1                      ; FCC0   0101
L_FCC1:
        SAR     R3,     2                       ; FCC1   006F
        SUBR    R4,     R5                      ; FCC2   0125
        MOVR    R7,     R1                      ; FCC3   00B9
        ADDR    R1,     R4                      ; FCC4   00CC
        MOVR    R2,     R3                      ; FCC5   0093
        ADDR    R3,     R7                      ; FCC6   00DF

        MOVR    R4,     R6                      ; FCC7   00A6
        TSTR    R0                              ; FCC8   0080
        SUBR    R4,     R6                      ; FCC9   0126
        MOVR    R0,     R4                      ; FCCA   0084
        MOVR    R5,     R6                      ; FCCB   00AE
        MOVR    R3,     R1                      ; FCCC   0099
        ADDR    R5,     R5                      ; FCCD   00ED
        ADDR    R3,     R0                      ; FCCE   00D8
        ADDR    R0,     R3                      ; FCCF   00C3
        MVO@    R0,     R4                      ; FCD0   0260
        SUBR    R4,     R4                      ; FCD1   0124
        MOVR    R0,     R2                      ; FCD2   0082
        SUBR    R4,     R7                      ; FCD3   0127

        DECLE   $0096,  $00AA,  $0128,  $00D2   ; FCD4   0096 00AA 0128 00D2
        DECLE   $00BE,  $00E6,  $0380,  $0077   ; FCD8   00BE 00E6 0380 0077
        DECLE   $00B5,  $00B6,  $00B7           ; FCDC   00B5 00B6 00B7

        MOVR    R7,     R0                      ; FCDF   00B8
        SLR     R2,     2                       ; FCE0   0066
        SARC    R1,     1                       ; FCE1   0079
        SARC    R2,     1                       ; FCE2   007A
        SARC    R3,     1                       ; FCE3   007B
        SARC    R0,     2                       ; FCE4   007C
        SARC    R1,     2                       ; FCE5   007D
        SARC    R2,     2                       ; FCE6   007E
        SARC    R3,     2                       ; FCE7   007F
        ADDR    R0,     R4                      ; FCE8   00C4
        ADDR    R0,     R5                      ; FCE9   00C5
        ADDR    R0,     R6                      ; FCEA   00C6
        ADDR    R0,     R7                      ; FCEB   00C7

L_FCEC:
        SLR     R3,     2                       ; FCEC   0067
        ADDR    R1,     R1                      ; FCED   00C9
        ADDR    R1,     R2                      ; FCEE   00CA
        ADDR    R1,     R3                      ; FCEF   00CB
        SAR     R0,     1                       ; FCF0   0068
        MOVR    R0,     R5                      ; FCF1   0085
        MOVR    R0,     R6                      ; FCF2   0086
        MOVR    R0,     R7                      ; FCF3   0087

        MOVR    R1,     R0                      ; FCF4   0088
        TSTR    R1                              ; FCF5   0089
        MOVR    R1,     R2                      ; FCF6   008A
        MOVR    R1,     R3                      ; FCF7   008B
        SAR     R1,     1                       ; FCF8   0069
        MOVR    R1,     R5                      ; FCF9   008D
        ADDR    R3,     R1                      ; FCFA   00D9
        ADDR    R3,     R2                      ; FCFB   00DA
        ADDR    R3,     R3                      ; FCFC   00DB
        MOVR    R1,     R6                      ; FCFD   008E
        ADDR    R3,     R5                      ; FCFE   00DD
        ADDR    R3,     R6                      ; FCFF   00DE
        MOVR    R1,     R7                      ; FD00   008F

        MOVR    R2,     R0                      ; FD01   0090
        MOVR    R2,     R1                      ; FD02   0091
        TSTR    R2                              ; FD03   0092
        SAR     R2,     1                       ; FD04   006A
        SAR     R3,     1                       ; FD05   006B
        SAR     R0,     2                       ; FD06   006C
        SLR     R1,     2                       ; FD07   0065
        MOVR    R3,     R2                      ; FD08   009A
        TSTR    R3                              ; FD09   009B
        MOVR    R3,     R4                      ; FD0A   009C
        MOVR    R3,     R5                      ; FD0B   009D
        ADDR    R5,     R6                      ; FD0C   00EE
        ADDR    R5,     R7                      ; FD0D   00EF

        MOVR    R3,     R6                      ; FD0E   009E
        MOVR    R3,     R7                      ; FD0F   009F

        RRC     R0,     1                       ; FD10   0070
        MOVR    R4,     R1                      ; FD11   00A1
        MOVR    R4,     R2                      ; FD12   00A2
        MOVR    R4,     R3                      ; FD13   00A3
        TSTR    R4                              ; FD14   00A4
        MOVR    R4,     R5                      ; FD15   00A5
        RRC     R1,     1                       ; FD16   0071
        RRC     R2,     1                       ; FD17   0072
        RRC     R3,     1                       ; FD18   0073
        RRC     R0,     2                       ; FD19   0074
        RRC     R1,     2                       ; FD1A   0075
        RRC     R2,     2                       ; FD1B   0076
        MOVR    R5,     R7                      ; FD1C   00AF

        DECLE   $00B0,  $00B1,  $00B2,  $00B3   ; FD1D   00B0 00B1 00B2 00B3
        DECLE   $02A0,  $0124,  $006E,  $03FF   ; FD21   02A0 0124 006E 03FF
        DECLE   $0005,  $0068,  $0000           ; FD25   0005 0068 0000

        DECR    R0                              ; FD28   0010
        SAR     R0,     1                       ; FD29   0068
        RRC     R0,     2                       ; FD2A   0074
        BEQ     L_FC07                          ; FD2B   0224 0125

        MOVR    R7,     R1                      ; FD2D   00B9
        ADDR    R1,     R4                      ; FD2E   00CC
        MOVR    R2,     R3                      ; FD2F   0093
        ADDR    R3,     R7                      ; FD30   00DF

        MOVR    R4,     R6                      ; FD31   00A6
        TSTR    R0                              ; FD32   0080
        SUBR    R4,     R6                      ; FD33   0126
        MOVR    R0,     R4                      ; FD34   0084
        MOVR    R5,     R6                      ; FD35   00AE
        MOVR    R3,     R1                      ; FD36   0099
        ADDR    R5,     R5                      ; FD37   00ED
        ADDR    R3,     R0                      ; FD38   00D8
        ADDR    R0,     R3                      ; FD39   00C3
        MVO@    R0,     R4                      ; FD3A   0260
        SUBR    R4,     R4                      ; FD3B   0124
        MOVR    R0,     R2                      ; FD3C   0082
        SUBR    R4,     R7                      ; FD3D   0127

        MOVR    R2,     R6                      ; FD3E   0096
        MOVR    R5,     R2                      ; FD3F   00AA
        SUBR    R5,     R0                      ; FD40   0128
        ADDR    R2,     R2                      ; FD41   00D2
        MOVR    R7,     R6                      ; FD42   00BE
        ADDR    R4,     R6                      ; FD43   00E6
        MVI@    R4,     R0                      ; FD44   02A0
        SUBR    R4,     R4                      ; FD45   0124
L_FD46:
        SAR     R2,     2                       ; FD46   006E
        DECLE   $03FF,  $0005                   ; FD47   03FF 0005

        BEQ     L_FD46                          ; FD49   0224 0004

        DECR    R4                              ; FD4B   0014
        BEQ     L_FB25                          ; FD4C   0224 0228
        BEQ     L_FC2A                          ; FD4E   0224 0125

        MOVR    R7,     R1                      ; FD50   00B9
        ADDR    R1,     R4                      ; FD51   00CC
        MOVR    R2,     R3                      ; FD52   0093
        ADDR    R3,     R7                      ; FD53   00DF

        MOVR    R4,     R6                      ; FD54   00A6
        TSTR    R0                              ; FD55   0080
        SUBR    R4,     R6                      ; FD56   0126
        MOVR    R0,     R4                      ; FD57   0084
        MOVR    R5,     R6                      ; FD58   00AE
        MOVR    R3,     R1                      ; FD59   0099
        ADDR    R5,     R5                      ; FD5A   00ED
        ADDR    R3,     R0                      ; FD5B   00D8
        ADDR    R0,     R3                      ; FD5C   00C3
        MVO@    R0,     R4                      ; FD5D   0260
        SUBR    R4,     R4                      ; FD5E   0124
        MOVR    R0,     R2                      ; FD5F   0082
        SUBR    R4,     R7                      ; FD60   0127

        DECLE   $0096,  $00AA,  $0128,  $00D2   ; FD61   0096 00AA 0128 00D2
        DECLE   $00BE,  $00E6,  $02A0,  $0124   ; FD65   00BE 00E6 02A0 0124
        DECLE   $006E,  $03FF,  $0005           ; FD69   006E 03FF 0005

        SAR     R0,     1                       ; FD6C   0068
        INCR    R0                              ; FD6D   0008
        COMR    R0                              ; FD6E   0018
L_FD6F:
        SAR     R0,     1                       ; FD6F   0068
        SAR     R0,     2                       ; FD70   006C
        BEQ     L_FC4D                          ; FD71   0224 0125

        MOVR    R7,     R1                      ; FD73   00B9
        ADDR    R1,     R4                      ; FD74   00CC
        MOVR    R2,     R3                      ; FD75   0093
        ADDR    R3,     R7                      ; FD76   00DF

        MOVR    R4,     R6                      ; FD77   00A6
        TSTR    R0                              ; FD78   0080
        SUBR    R4,     R6                      ; FD79   0126
        MOVR    R0,     R4                      ; FD7A   0084
        MOVR    R5,     R6                      ; FD7B   00AE
        MOVR    R3,     R1                      ; FD7C   0099
        ADDR    R5,     R5                      ; FD7D   00ED
        ADDR    R3,     R0                      ; FD7E   00D8
        ADDR    R0,     R3                      ; FD7F   00C3
        MVO@    R0,     R4                      ; FD80   0260
        SUBR    R4,     R4                      ; FD81   0124
        MOVR    R0,     R2                      ; FD82   0082
        SUBR    R4,     R7                      ; FD83   0127

L_FD84:
        MOVR    R2,     R6                      ; FD84   0096
        DECLE   $00AA,  $0128,  $00D2,  $00BE   ; FD85   00AA 0128 00D2 00BE
        DECLE   $00E6,  $02A0,  $0124,  $006E   ; FD89   00E6 02A0 0124 006E
        DECLE   $03FF,  $0005                   ; FD8D   03FF 0005

        BEQ     L_FD84                          ; FD8F   0224 000C

        COMR    R4                              ; FD91   001C
        BEQ     L_FB67                          ; FD92   0224 022C

        SUB     G_007E, R4                      ; FD94   0304 007E
        TSTR    R2                              ; FD96   0092
        MOVR    R4,     R5                      ; FD97   00A5
        ADDR    R2,     R3                      ; FD98   00D3
        ADDR    R4,     R3                      ; FD99   00E3
        BEQ     L_FC9A                          ; FD9A   0224 0101

        ADDR    R2,     R4                      ; FD9C   00D4
        SUBR    R0,     R4                      ; FD9D   0104
        ADDR    R5,     R1                      ; FD9E   00E9
        SUBR    R0,     R5                      ; FD9F   0105
        ADDR    R5,     R2                      ; FDA0   00EA
        SUBR    R1,     R2                      ; FDA1   010A
        MOVR    R6,     R5                      ; FDA2   00B5
        SUBR    R1,     R3                      ; FDA3   010B
        TSTR    R6                              ; FDA4   00B6
        ADDR    R1,     R1                      ; FDA5   00C9
        SUBR    R1,     R4                      ; FDA6   010C
        MOVR    R5,     R1                      ; FDA7   00A9
        MOVR    R7,     R6                      ; FDA8   00BE
        MOVR    R2,     R4                      ; FDA9   0094
        SUBR    R2,     R0                      ; FDAA   0110
        SARC    R3,     2                       ; FDAB   007F
        SUBR    R2,     R2                      ; FDAC   0112
        MOVR    R4,     R2                      ; FDAD   00A2
        SUBR    R2,     R3                      ; FDAE   0113
        MOVR    R1,     R7                      ; FDAF   008F

        SUBR    R3,     R2                      ; FDB0   011A
        SLR     R3,     2                       ; FDB1   0067
        SUBR    R4,     R4                      ; FDB2   0124
        SAR     R0,     1                       ; FDB3   0068
        SUBR    R4,     R5                      ; FDB4   0125
        SAR     R1,     1                       ; FDB5   0069
        SUBR    R4,     R6                      ; FDB6   0126
        SAR     R2,     1                       ; FDB7   006A
        SUBR    R4,     R7                      ; FDB8   0127

        DECLE   $007B,  $012A,  $0095,  $00BF   ; FDB9   007B 012A 0095 00BF

        TSTR    R0                              ; FDBD   0080
        MOVR    R5,     R2                      ; FDBE   00AA
        MVO@    R0,     R4                      ; FDBF   0260
        SUBR    R5,     R0                      ; FDC0   0128
        SARC    R0,     2                       ; FDC1   007C
        SUBR    R5,     R1                      ; FDC2   0129
        SARC    R1,     2                       ; FDC3   007D
        SUBR    R5,     R3                      ; FDC4   012B
        MOVR    R2,     R1                      ; FDC5   0091
        SUBR    R5,     R4                      ; FDC6   012C
        MOVR    R4,     R6                      ; FDC7   00A6
        SUBR    R5,     R5                      ; FDC8   012D
        MOVR    R7,     R2                      ; FDC9   00BA
        SUBR    R5,     R6                      ; FDCA   012E
        ADDR    R1,     R6                      ; FDCB   00CE
        SUBR    R5,     R7                      ; FDCC   012F

        DECLE   $00E2,  $0380,  $00D5,  $008E   ; FDCD   00E2 0380 00D5 008E
        DECLE   $007A,  $006B,  $02A0,  $0115   ; FDD1   007A 006B 02A0 0115
        DECLE   $0066,  $03FF,  $000C,  $0230   ; FDD5   0066 03FF 000C 0230
        DECLE   $019C,  $01A0,  $01A4,  $0168   ; FDD9   019C 01A0 01A4 0168
        DECLE   $0234                           ; FDDD   0234

        NEGR    R0                              ; FDDE   0020
        MOVR    R1,     R0                      ; FDDF   0088
        MOVR    R4,     R0                      ; FDE0   00A0
        RSWD    R4                              ; FDE1   003C
        RRC     R0,     2                       ; FDE2   0074
        SLR     R0,     2                       ; FDE3   0064
        BEQ     L_FCC1                          ; FDE4   0224 0124

        SAR     R0,     1                       ; FDE6   0068
        SUBR    R4,     R5                      ; FDE7   0125
        SAR     R1,     1                       ; FDE8   0069
        SUBR    R4,     R6                      ; FDE9   0126
        SAR     R2,     1                       ; FDEA   006A
        SUBR    R4,     R7                      ; FDEB   0127

        DECLE   $007B,  $012A,  $0095,  $00BF   ; FDEC   007B 012A 0095 00BF

        TSTR    R0                              ; FDF0   0080
        MOVR    R5,     R2                      ; FDF1   00AA
        MVO@    R0,     R4                      ; FDF2   0260
        SUBR    R5,     R0                      ; FDF3   0128
        SARC    R0,     2                       ; FDF4   007C
        SUBR    R5,     R1                      ; FDF5   0129
        SARC    R1,     2                       ; FDF6   007D
        SUBR    R5,     R3                      ; FDF7   012B
        MOVR    R2,     R1                      ; FDF8   0091
        SUBR    R5,     R4                      ; FDF9   012C
        MOVR    R4,     R6                      ; FDFA   00A6
        SUBR    R5,     R5                      ; FDFB   012D
        MOVR    R7,     R2                      ; FDFC   00BA
        SUBR    R5,     R6                      ; FDFD   012E
        ADDR    R1,     R6                      ; FDFE   00CE
        SUBR    R5,     R7                      ; FDFF   012F

        DECLE   $00E2,  $03FF,  $000C,  $0198   ; FE00   00E2 03FF 000C 0198
        DECLE   $019C,  $01A0,  $01A4,  $00B8   ; FE04   019C 01A0 01A4 00B8
        DECLE   $0238,  $0024,  $023C,  $0240   ; FE08   0238 0024 023C 0240
        DECLE   $0244,  $0228                   ; FE0C   0244 0228

        MVO@    R0,     R1                      ; FE0E   0248
        BEQ     L_FCEC                          ; FE0F   0224 0124

        SAR     R0,     1                       ; FE11   0068
        SUBR    R4,     R5                      ; FE12   0125
        SAR     R1,     1                       ; FE13   0069
        SUBR    R4,     R6                      ; FE14   0126
        SAR     R2,     1                       ; FE15   006A
        SUBR    R4,     R7                      ; FE16   0127

        DECLE   $007B,  $012A,  $0095,  $00BF   ; FE17   007B 012A 0095 00BF

        TSTR    R0                              ; FE1B   0080
        MOVR    R5,     R2                      ; FE1C   00AA
        MVO@    R0,     R4                      ; FE1D   0260
        SUBR    R5,     R0                      ; FE1E   0128
        SARC    R0,     2                       ; FE1F   007C
        SUBR    R5,     R1                      ; FE20   0129
        SARC    R1,     2                       ; FE21   007D
        SUBR    R5,     R3                      ; FE22   012B
        MOVR    R2,     R1                      ; FE23   0091
        SUBR    R5,     R4                      ; FE24   012C
        MOVR    R4,     R6                      ; FE25   00A6
        SUBR    R5,     R5                      ; FE26   012D
        MOVR    R7,     R2                      ; FE27   00BA
        SUBR    R5,     R6                      ; FE28   012E
        ADDR    R1,     R6                      ; FE29   00CE
        SUBR    R5,     R7                      ; FE2A   012F

        DECLE   $00E2,  $03FF,  $000C,  $0230   ; FE2B   00E2 03FF 000C 0230
        DECLE   $019C,  $01A0,  $01A4,  $0168   ; FE2F   019C 01A0 01A4 0168
        DECLE   $0234,  $0028,  $00B4,  $008C   ; FE33   0234 0028 00B4 008C
        DECLE   $00C0,  $00C4,  $00E0,  $0224   ; FE37   00C0 00C4 00E0 0224
        DECLE   $010D,  $00AA,  $00BF           ; FE3B   010D 00AA 00BF

        TSTR    R0                              ; FE3E   0080
        MOVR    R2,     R5                      ; FE3F   0095
        SUBR    R4,     R4                      ; FE40   0124
        SAR     R0,     1                       ; FE41   0068
        SUBR    R4,     R5                      ; FE42   0125
        SAR     R1,     1                       ; FE43   0069
        SUBR    R4,     R6                      ; FE44   0126
        SAR     R2,     1                       ; FE45   006A
        SUBR    R4,     R7                      ; FE46   0127

        SARC    R3,     1                       ; FE47   007B
        SUBR    R5,     R3                      ; FE48   012B
        MOVR    R7,     R6                      ; FE49   00BE
        MOVR    R5,     R1                      ; FE4A   00A9
        MOVR    R2,     R4                      ; FE4B   0094
        MVO@    R0,     R4                      ; FE4C   0260
        SUBR    R5,     R2                      ; FE4D   012A
        MOVR    R2,     R1                      ; FE4E   0091
L_FE4F:
        SUBR    R5,     R0                      ; FE4F   0128
        SARC    R0,     2                       ; FE50   007C
        MOVR    R4,     R5                      ; FE51   00A5
        SUBR    R5,     R1                      ; FE52   0129
        SARC    R1,     2                       ; FE53   007D
        SUBR    R5,     R4                      ; FE54   012C
        MOVR    R4,     R6                      ; FE55   00A6
        SUBR    R5,     R5                      ; FE56   012D
        MOVR    R7,     R2                      ; FE57   00BA
        SUBR    R5,     R6                      ; FE58   012E
        ADDR    R1,     R6                      ; FE59   00CE
        SUBR    R5,     R7                      ; FE5A   012F

        DECLE   $00E2,  $03FF,  $000C,  $0198   ; FE5B   00E2 03FF 000C 0198
        DECLE   $019C,  $01A0,  $01A4,  $00B8   ; FE5F   019C 01A0 01A4 00B8
        DECLE   $0238                           ; FE63   0238

        MVO@    R4,     R1                      ; FE64   024C
        RSWD    R0                              ; FE65   0038
        SUBR    R6,     R4                      ; FE66   0134
        MVO@    R0,     R2                      ; FE67   0250
        MVO@    R4,     R2                      ; FE68   0254
        MVO@    R0,     R3                      ; FE69   0258
        SUB     G_008F, R4                      ; FE6A   0304 008F
        TSTR    R4                              ; FE6C   00A4
        ADDR    R1,     R5                      ; FE6D   00CD
        ADDR    R4,     R1                      ; FE6E   00E1
        BEQ     L_FD6F                          ; FE6F   0224 0101

        ADDR    R2,     R2                      ; FE71   00D2
        SUBR    R0,     R4                      ; FE72   0104
        ADDR    R4,     R7                      ; FE73   00E7

        SUBR    R0,     R5                      ; FE74   0105
        ADDR    R5,     R0                      ; FE75   00E8
        SUBR    R1,     R1                      ; FE76   0109
        MOVR    R5,     R0                      ; FE77   00A8
        SUBR    R1,     R4                      ; FE78   010C
        MOVR    R7,     R4                      ; FE79   00BC
        SUBR    R1,     R5                      ; FE7A   010D
        MOVR    R7,     R5                      ; FE7B   00BD
        SUBR    R2,     R0                      ; FE7C   0110
        MOVR    R2,     R1                      ; FE7D   0091
        SUBR    R2,     R1                      ; FE7E   0111
        TSTR    R2                              ; FE7F   0092
        SARC    R0,     2                       ; FE80   007C
        SUBR    R2,     R6                      ; FE81   0116
        SLR     R2,     2                       ; FE82   0066
        SUBR    R4,     R4                      ; FE83   0124
        SLR     R1,     2                       ; FE84   0065
        SUBR    R4,     R5                      ; FE85   0125
        SARC    R3,     1                       ; FE86   007B
        SUBR    R5,     R2                      ; FE87   012A
        MOVR    R4,     R7                      ; FE88   00A7

        MVO@    R0,     R4                      ; FE89   0260
        SUBR    R4,     R7                      ; FE8A   0127

        DECLE   $008E,  $0128,  $00A2,  $0129   ; FE8B   008E 0128 00A2 0129
        DECLE   $00A3,  $0126,  $008D,  $012B   ; FE8F   00A3 0126 008D 012B
        DECLE   $00B7                           ; FE93   00B7

        SUBR    R5,     R4                      ; FE94   012C
        MOVR    R7,     R0                      ; FE95   00B8
        SUBR    R5,     R5                      ; FE96   012D
        ADDR    R1,     R3                      ; FE97   00CB
        SUBR    R5,     R6                      ; FE98   012E
        ADDR    R1,     R4                      ; FE99   00CC
        SUBR    R5,     R7                      ; FE9A   012F

        DECLE   $00E0,  $0380,  $00BE,  $0067   ; FE9B   00E0 0380 00BE 0067
        DECLE   $007D,  $00D3,  $0093,  $03FF   ; FE9F   007D 00D3 0093 03FF
        DECLE   $000C,  $0164,  $01F4,  $025C   ; FEA3   000C 0164 01F4 025C
        DECLE   $0260,  $0208,  $0264,  $0268   ; FEA7   0260 0208 0264 0268
        DECLE   $0204,  $026C,  $0168,  $0270   ; FEAB   0204 026C 0168 0270
        DECLE   $0128,  $0224                   ; FEAF   0128 0224

        SUBR    R4,     R4                      ; FEB1   0124
        SLR     R1,     2                       ; FEB2   0065
        SUBR    R4,     R5                      ; FEB3   0125
        SARC    R3,     1                       ; FEB4   007B
        SUBR    R5,     R2                      ; FEB5   012A
        MOVR    R4,     R7                      ; FEB6   00A7

        MVO@    R0,     R4                      ; FEB7   0260
        SUBR    R4,     R7                      ; FEB8   0127

        DECLE   $008E,  $0128,  $00A2,  $0129   ; FEB9   008E 0128 00A2 0129
        DECLE   $00A3,  $0126,  $008D,  $012B   ; FEBD   00A3 0126 008D 012B
        DECLE   $00B7                           ; FEC1   00B7

        SUBR    R5,     R4                      ; FEC2   012C
        MOVR    R7,     R0                      ; FEC3   00B8
        SUBR    R5,     R5                      ; FEC4   012D
        ADDR    R1,     R3                      ; FEC5   00CB
        SUBR    R5,     R6                      ; FEC6   012E
        ADDR    R1,     R4                      ; FEC7   00CC
        SUBR    R5,     R7                      ; FEC8   012F

        DECLE   $00E0,  $03FF,  $000C,  $0164   ; FEC9   00E0 03FF 000C 0164
        DECLE   $01F4,  $025C,  $0260,  $0274   ; FECD   01F4 025C 0260 0274
        DECLE   $0264,  $0268,  $0208,  $0278   ; FED1   0264 0268 0208 0278
        DECLE   $0168,  $027C                   ; FED5   0168 027C

        MVI     .BTAB.24,R0                     ; FED7   0280 0224
        SUBR    R4,     R4                      ; FED9   0124
        SLR     R1,     2                       ; FEDA   0065
        SUBR    R4,     R5                      ; FEDB   0125
        SARC    R3,     1                       ; FEDC   007B
        SUBR    R5,     R2                      ; FEDD   012A
        MOVR    R4,     R7                      ; FEDE   00A7

        MVO@    R0,     R4                      ; FEDF   0260
        SUBR    R4,     R7                      ; FEE0   0127

        DECLE   $008E,  $0128,  $00A2,  $0129   ; FEE1   008E 0128 00A2 0129
        DECLE   $00A3,  $0126,  $008D,  $012B   ; FEE5   00A3 0126 008D 012B
        DECLE   $00B7                           ; FEE9   00B7

        SUBR    R5,     R4                      ; FEEA   012C
        MOVR    R7,     R0                      ; FEEB   00B8
        SUBR    R5,     R5                      ; FEEC   012D
        ADDR    R1,     R3                      ; FEED   00CB
        SUBR    R5,     R6                      ; FEEE   012E
        ADDR    R1,     R4                      ; FEEF   00CC
        SUBR    R5,     R7                      ; FEF0   012F

        DECLE   $00E0,  $03FF,  $000C,  $0164   ; FEF1   00E0 03FF 000C 0164
        DECLE   $01F4,  $0284,  $01F8,  $0208   ; FEF5   01F4 0284 01F8 0208
        DECLE   $0288,  $0268,  $028C,  $0290   ; FEF9   0288 0268 028C 0290
        DECLE   $0168,  $0294,  $0298,  $0224   ; FEFD   0168 0294 0298 0224

        SUBR    R4,     R4                      ; FF01   0124
        SLR     R1,     2                       ; FF02   0065
        SUBR    R4,     R5                      ; FF03   0125
        SARC    R3,     1                       ; FF04   007B
        SUBR    R5,     R2                      ; FF05   012A
        MOVR    R4,     R7                      ; FF06   00A7

        MVO@    R0,     R4                      ; FF07   0260
        SUBR    R4,     R7                      ; FF08   0127

        DECLE   $008E,  $0128,  $00A2,  $0129   ; FF09   008E 0128 00A2 0129
        DECLE   $00A3,  $0126,  $008D,  $012B   ; FF0D   00A3 0126 008D 012B
        DECLE   $00B7                           ; FF11   00B7

        SUBR    R5,     R4                      ; FF12   012C
        MOVR    R7,     R0                      ; FF13   00B8
        SUBR    R5,     R5                      ; FF14   012D
        ADDR    R1,     R3                      ; FF15   00CB
        SUBR    R5,     R6                      ; FF16   012E
        ADDR    R1,     R4                      ; FF17   00CC
        SUBR    R5,     R7                      ; FF18   012F

        DECLE   $00E0,  $03FF                   ; FF19   00E0 03FF

        INCR    R4                              ; FF1B   000C
        CMPR    R4,     R4                      ; FF1C   0164
        XORR    R6,     R4                      ; FF1D   01F4
        MVI     .BTAB.60,R4                     ; FF1E   0284 0260
        SKIP                                    ; FF20   0208
        MVI@    R3,     R4                      ; FF21   029C
        MVO@    R0,     R5                      ; FF22   0268
        SKIP                                    ; FF23   0208
        MVO@    R4,     R5                      ; FF24   026C
        CMPR    R5,     R0                      ; FF25   0168
        MVI@    R4,     R0                      ; FF26   02A0
        MVI@    R4,     R4                      ; FF27   02A4
        PSHR    R5                              ; FF28   0275
        MVI     G_011C, R0                      ; FF29   0280 011C
        CMPI    #$000B, R0                      ; FF2B   0378 000B
        BEQ     L_FF33                          ; FF2D   0204 0004

        CMPI    #$0004, R0                      ; FF2F   0378 0004
        BNEQ    L_FF73                          ; FF31   020C 0040

L_FF33:
        SDBD                                    ; FF33   0001
        MVII    #$0A28, R2                      ; FF34   02BA 0028 000A
        MVI     G_0132, R0                      ; FF37   0280 0132
        ADDR    R0,     R0                      ; FF39   00C0
        BEQ     L_FF53                          ; FF3A   0204 0017

        SUBI    #$0190, R2                      ; FF3C   033A 0190
        MOVR    R0,     R1                      ; FF3E   0081
        ADDR    R0,     R0                      ; FF3F   00C0
        ADDR    R1,     R0                      ; FF40   00C8
        ADD     G_0132, R0                      ; FF41   02C0 0132
        MVI     G_0119, R3                      ; FF43   0283 0119
        TSTR    R3                              ; FF45   009B
        BNEQ    L_FF4C                          ; FF46   020C 0004

        ADDR    R0,     R0                      ; FF48   00C0
        SUBR    R1,     R0                      ; FF49   0108
        ADDI    #$0078, R0                      ; FF4A   02F8 0078
L_FF4C:
        SUBR    R0,     R2                      ; FF4C   0102
        CMPI    #$0140, R2                      ; FF4D   037A 0140
        BGT     L_FF53                          ; FF4F   020E 0002

        MVII    #$0140, R2                      ; FF51   02BA 0140
L_FF53:
        SUB     G_0348, R2                      ; FF53   0302 0348
        SAR     R2,     2                       ; FF55   006E
        SAR     R2,     2                       ; FF56   006E
        NOP                                     ; FF57   0034
        SAR     R2,     1                       ; FF58   006A
        ADD     G_0348, R2                      ; FF59   02C2 0348
        MVO     R2,     G_0348                  ; FF5B   0242 0348
        MVI     .PSG0.chan_enable,R0            ; FF5D   0280 01F8
        ANDI    #$0036, R0                      ; FF5F   03B8 0036
        XORI    #$0008, R0                      ; FF61   03F8 0008
        MVO     R0,     .PSG0.chan_enable       ; FF63   0240 01F8
        MVO     R2,     .PSG0.chn_a_lo          ; FF65   0242 01F0
        NOP                                     ; FF67   0034
        SWAP    R2,     1                       ; FF68   0042
        MVO     R2,     .PSG0.chn_a_hi          ; FF69   0242 01F4
        MVII    #$0060, R0                      ; FF6B   02B8 0060
        MVO     R0,     G_0163                  ; FF6D   0240 0163
        MVII    #$000C, R0                      ; FF6F   02B8 000C
        MVO     R0,     .PSG0.chn_a_vol         ; FF71   0240 01FB
L_FF73:
        PULR    R7                              ; FF73   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; FF74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF7C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFBC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFCC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFD4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFD8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFDC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFFC   0000 0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5011       <entry>
;;  $5017       $5019  
;;  $5021       $5023  
;;  $50C8       $507E   $50CC   $5100   $510E   $514C   $5161   $5170   $5178  
;;  $50C8       $517E   $51A7   $51B1   $51CD   $51D3   $51D8   $51F8   $51FD  
;;  $50C8       $522C   $5245   $524D   $5259   $526E   $5292   $529A  
;;  $516E       $5169  
;;  $5180       $525E   $5260  
;;  $51C7       $51B9  
;;  $5240       $523B  
;;  $526E       $5269  
;;  $52B3       $52AD  
;;  $52B5       $52B1  
;;  $52B7       $52A6  
;;  $52DA       $52D2  
;;  $52E4       $52DE  
;;  $52EF       $52E2   $52E7   $52EB  
;;  $52F1       $52CC   $52D8  
;;  $52F4       $52BB   $52C1   $52C6  
;;  $530A       $5304  
;;  $530B       $5061   $5102   $512A   $51C7   $51E1  
;;  $5319       $529E  
;;  $531A       $5105   $512D   $51CA   $51E4  
;;  $532A       $5029  
;;  $5331       $534C  
;;  $5332       $506E  
;;  $5341       $5341  
;;  $534A       $5038   $5351   $682D  
;;  $5353       $540C   $544F   $6B5C   $6B6F   $6B7C  
;;  $5355       $5366  
;;  $5369       $686B  
;;  $536B       $5035   $68C3  
;;  $536D       $537D  
;;  $53DB       $53D7  
;;  $53E7       $5396   $539A  
;;  $5414       $53EC  
;;  $541B       $5391   $53F2   $5412  
;;  $5425       $5421  
;;  $542F       $542B  
;;  $5438       $5384  
;;  $543C       $5389  
;;  $543F       $53FB   $5418  
;;  $5440       $5454  
;;  $5453       $5442  
;;  $5457       $50EA   $510B   $518C   $522E   $5297  
;;  $545F       $545B  
;;  $5473       $5467  
;;  $5474       $5472  
;;  $5476       $5496  
;;  $547E       $5478  
;;  $548F       $547C  
;;  $54BF       $54BD  
;;  $54D1       $5458  
;;  $54DE       $54D6  
;;  $54DF       $54DD  
;;  $5508       $54FC   $5500   $5504  
;;  $551B       $542F  
;;  $5526       $555F  
;;  $552A       $5524  
;;  $553B       $552D   $5533  
;;  $5556       $5551  
;;  $5561       $5539  
;;  $5562       $5553   $5556   $5568  
;;  $556A       $5570  
;;  $5573       $5127   $560E  
;;  $557E       $558D   $55A4   $55B3   $55C2  
;;  $558F       $5581  
;;  $55A6       $5591  
;;  $55B5       $55A8  
;;  $55C4       $55B7  
;;  $55C5       $5381  
;;  $55DF       $55D6  
;;  $55F6       $560C  
;;  $560E       $55F4  
;;  $5613       $55CA  
;;  $5615       $5074  
;;  $5620       $5631  
;;  $5675       $5673  
;;  $567B       $567B  
;;  $5686       $5686  
;;  $56E2       $56E0  
;;  $575B       $5759  
;;  $5794       $5792  
;;  $5880       $587E  
;;  $5881       $587F  
;;  $58AD       $58AB  
;;  $58DA       $58D8  
;;  $590C       $590A  
;;  $597E       $597C  
;;  $59F2       $59F0  
;;  $5A75       $5A73  
;;  $5AFE       $5AFC  
;;  $5AFF       $5AFD  
;;  $5B31       $50ED   $5189  
;;  $5B52       $5BFA   $5C0A   $5C1C   $5C99  
;;  $5B54       $5B89  
;;  $5B8B       $5B81  
;;  $5B9C       $5B95  
;;  $5B9F       $5B39   $5B44  
;;  $5BA0       $5B65  
;;  $5BB0       $5BA8  
;;  $5BC9       $5BB5  
;;  $5BCD       $5BD6  
;;  $5BD8       $5BD3  
;;  $5BF3       $5BA4   $5BDA  
;;  $5BFC       $5BAE  
;;  $5C00       $5B69  
;;  $5C12       $5C1A  
;;  $5C2E       $5C13  
;;  $5C43       $5C41  
;;  $5C54       $5C48   $5C4E  
;;  $5C9B       $5211   $5B32  
;;  $5CAF       $5CA0  
;;  $5D0C       $507B   $50E7   $52F1   $63A0  
;;  $5D6C       $5D2B   $5D37   $5D43   $5D4F   $5D52   $5D58   $5D5E   $5D64  
;;  $5D6C       $5D6A  
;;  $5D85       $5D7D  
;;  $5D89       $5D81  
;;  $5D8B       $5D83   $5D87  
;;  $5FC6       $5FC6  
;;  $5FD6       $5FD6  
;;  $5FE6       $5FE6  
;;  $5FF6       $5FF6  
;;  $6233       $50F0   $5195   $5262   $5294  
;;  $6238       $62D4  
;;  $625F       $6257   $625B  
;;  $6269       $6261  
;;  $626E       $6267  
;;  $6283       $6265  
;;  $629B       $6295  
;;  $62D0       $623C   $6281   $62FE   $6361  
;;  $62D1       $62CF  
;;  $62D7       $6243  
;;  $6300       $62E9  
;;  $630E       $6308  
;;  $631F       $631C  
;;  $633C       $6334  
;;  $633E       $633A  
;;  $6348       $6342  
;;  $634A       $6346  
;;  $6365       $6363  
;;  $6373       $5186  
;;  $638D       $6387  
;;  $6390       $638B  
;;  $63A3       $6378   $637E   $6383   $6395  
;;  $63A4       $50F3   $5198  
;;  $63B7       $63FE  
;;  $63CD       $63C5  
;;  $63D1       $63CB  
;;  $63F4       $63A8   $63FA  
;;  $63F5       $63C2   $63DA   $63DF   $63EA   $63EF  
;;  $6400       $63F1  
;;  $646A       $64EA  
;;  $64B6       $50F6   $519B  
;;  $64C8       $64E7  
;;  $64DE       $64CE   $64ED  
;;  $64E9       $64BA   $64E3  
;;  $64EA       $64D3  
;;  $6585       $5192  
;;  $65A6       $65A0  
;;  $65AA       $6595   $6598  
;;  $65B0       $65A4   $65A8  
;;  $6630       $5B9C  
;;  $6641       $663E  
;;  $6645       $6642  
;;  $6648       $5140   $540F  
;;  $6657       $6660   $6671  
;;  $6662       $665A  
;;  $666A       $6664  
;;  $6674       $53F4  
;;  $6688       $6699  
;;  $66B7       $5133  
;;  $66BE       $66CB  
;;  $66D9       $66D4  
;;  $66EB       $519E   $6961   $6A03  
;;  $66FB       $5183  
;;  $6719       $520E  
;;  $671A       $6718  
;;  $6756       $672E  
;;  $675D       $6716   $671E  
;;  $675E       $6739  
;;  $6765       $6701  
;;  $677A       $6773  
;;  $6792       $518F  
;;  $67B8       $67B4  
;;  $67B9       $679E   $67AF   $67B7  
;;  $67CB       $67C8  
;;  $67D4       $6797   $67B2   $67CD  
;;  $67D5       $62C1   $6350  
;;  $67DA       $67D7  
;;  $6808       $67EB   $67F1   $67F9   $67FF   $6805  
;;  $680C       $6809  
;;  $680D       $5057   $511D  
;;  $682C       $5214  
;;  $6858       $6850  
;;  $685C       $6856  
;;  $687B       $6873  
;;  $687F       $6879  
;;  $68A0       $68AA  
;;  $68AC       $68A1  
;;  $68B4       $68BA  
;;  $68BC       $68B5  
;;  $68C6       $6898  
;;  $68F1       $525B  
;;  $6901       $68FB  
;;  $6911       $690D  
;;  $6916       $6926  
;;  $6923       $691F  
;;  $6928       $68F6   $6907   $6917  
;;  $6929       $526B  
;;  $6966       $6957  
;;  $698B       $5180  
;;  $6996       $6990  
;;  $69A3       $51B3  
;;  $69A9       $69B3  
;;  $69B5       $69B0  
;;  $69DC       $69BB  
;;  $69E1       $51D5  
;;  $6A06       $6964  
;;  $6A0C       $69E5  
;;  $6A49       $6A49  
;;  $6ABE       $50F9  
;;  $6ADA       $6AE8  
;;  $6AEA       $6ADD  
;;  $6AF5       $6AF2  
;;  $6AF7       $6AC4  
;;  $6AF8       $538E  
;;  $6B07       $6B18  
;;  $6B1C       $6B01   $6B22  
;;  $6B24       $6B1A  
;;  $6B2E       $6B4C  
;;  $6B3B       $6B49  
;;  $6B50       $6AFC  
;;  $6B51       $6B4F  
;;  $6B52       $6B2A  
;;  $6B6F       $6B69  
;;  $6B8E       $6B8A  
;;  $6B95       $6B90  
;;  $6BA1       $6BA5  
;;  $6BA7       $6B9F  
;;  $6C01       $6BFF  
;;  $6C82       $5172   $5247  
;;  $6CA0       $6C88  
;;  $6CAD       $515A   $5225  
;;  $6CD3       $51A1  
;;  $6CEF       $6CF7  
;;  $6CFB       $6CD8  
;;  $6CFE       $6CDE   $6CE7   $6CF9  
;;  $6CFF       $6CF0  
;;  $6D3C       $6E86   $6EA1  
;;  $6D41       $6D49  
;;  $6D4D       $6E58   $6E97   $6EAF   $6ECB  
;;  $6D52       $6D58  
;;  $6DB4       $5145   $51AE   $51ED   $5272   $5B99   $5BF0   $6466   $67D1  
;;  $6DB4       $6A08   $6C93   $6CA9  
;;  $6DC5       $6DBF  
;;  $6DEB       $6DD4  
;;  $6DEF       $6DBD   $6DC3   $6DF4  
;;  $6DF0       $5432  
;;  $6E01       $6DF8  
;;  $6E05       $6E18  
;;  $6E2D       $6E4F  
;;  $6E39       $6E2F   $6E32  
;;  $6E44       $6E40  
;;  $6E4A       $6E3C  
;;  $6E52       $6DFC  
;;  $6E58       $6E8D   $6E9B   $6EAA   $6EAD  
;;  $6E86       $6E82  
;;  $6E97       $6E91   $6E9F  
;;  $6E9A       $6E95  
;;  $6EAC       $6EA7  
;;  $6EB6       $6EC1  
;;  $6EB8       $6EB4  
;;  $6EB9       $6ED3  
;;  $6ECB       $6E56   $6F1F  
;;  $6EE3       $6EEA  
;;  $6EEE       $6EE5  
;;  $6EF5       $6EF2  
;;  $6F05       $6F08  
;;  $6F13       $6F16  
;;  $6F1D       $6EEC  
;;  $D042       $D040  
;;  $D106       $D104  
;;  $D116       $D114  
;;  $D138       $D136  
;;  $D139       $D137  
;;  $D1A4       $D1A2  
;;  $D248       $D146  
;;  $D2BB       $D1BA  
;;  $D2BC       $D1C7  
;;  $D2E7       $D1C5  
;;  $D31A       $D239  
;;  $D35C       $D35A  
;;  $D371       $D270  
;;  $D415       $D413  
;;  $D421       $D3A0  
;;  $D433       $D332  
;;  $D479       $D378  
;;  $D4BF       $D4BD  
;;  $D519       $D418  
;;  $D570       $D46F  
;;  $D574       $D477  
;;  $D588       $D48B  
;;  $D5F5       $D4F4  
;;  $D61D       $D51C  
;;  $D634       $D433  
;;  $D647       $D645  
;;  $D65B       $D41A  
;;  $D65E       $D35C  
;;  $D676       $D395  
;;  $D6B4       $D5F3  
;;  $D6B6       $D6B4  
;;  $D6C9       $D648  
;;  $D6CD       $D4CB  
;;  $D6D8       $D607  
;;  $D6DD       $D5DC  
;;  $D6E1       $D560  
;;  $D722       $D421  
;;  $D76E       $D46D  
;;  $D771       $D570  
;;  $D788       $D487  
;;  $D7B8       $D5C3  
;;  $D7D1       $D4D0  
;;  $D810       $D80E  
;;  $D811       $D80F  
;;  $D86C       $D46B  
;;  $D86E       $D86C  
;;  $D86F       $D86D  
;;  $D880       $D87E  
;;  $D8A4       $D6A2  
;;  $D8B8       $D4BF   $D6B6  
;;  $D8C0       $D8BE  
;;  $D8EF       $D5EE  
;;  $D8F1       $D5F0  
;;  $D9CD       $D6CF  
;;  $DA71       $D670  
;;  $DA73       $D672  
;;  $DE92       $DE90  
;;  $DE93       $DE91  
;;  $DE98       $DE96  
;;  $DEA5       $DEA5  
;;  $DEA6       $DEA6  
;;  $F0D7       $F0D5  
;;  $F129       $F127  
;;  $F14A       $F148  
;;  $F33D       $F324   $F327   $F32B   $F32F  
;;  $F35A       $F35A  
;;  $F37E       $F37C  
;;  $F3C7       $F4C8  
;;  $F47B       $F57E  
;;  $F482       $F480  
;;  $F486       $F486  
;;  $F4BB       $F5BA  
;;  $F4EB       $F5EC  
;;  $F518       $F619  
;;  $F54D       $F64E  
;;  $F58F       $F68E  
;;  $F621       $F720  
;;  $F66D       $F76C  
;;  $F756       $F855  
;;  $F7A2       $F8A4  
;;  $F7ED       $F8ED  
;;  $F83F       $F93F  
;;  $F890       $F990  
;;  $F98E       $FC91  
;;  $FA2B       $FB2B  
;;  $FA79       $FB79  
;;  $FAC8       $FBC8  
;;  $FB0F       $FC0F  
;;  $FB25       $FD4C  
;;  $FB56       $FC56  
;;  $FB67       $FD92  
;;  $FBBE       $FCBD  
;;  $FC07       $FD2B  
;;  $FC2A       $FD4E  
;;  $FC4D       $FD71  
;;  $FC9A       $FD9A  
;;  $FCC1       $FDE4  
;;  $FCEC       $FE0F  
;;  $FD46       $FD49  
;;  $FD6F       $FE6F  
;;  $FD84       $FD8F  
;;  $FE4F       $FC49  
;;  $FF33       $FF2D  
;;  $FF4C       $FF46  
;;  $FF53       $FF3A   $FF4F  
;;  $FF73       $FF31  
;; ======================================================================== ;;
