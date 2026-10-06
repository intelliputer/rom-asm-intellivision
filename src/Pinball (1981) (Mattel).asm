
        ORG     $5000
.HEADER:
        BIDECLE $0000           ; 5000  Ptr: MOB graphic images
        BIDECLE $6E1B           ; 5002  Ptr: EXEC timer table
        BIDECLE $5048           ; 5004  Ptr: Start of game
        BIDECLE $D5D4           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $DE24           ; 5008  Ptr: GRAM init sequence
        BIDECLE $6E2D           ; 500A  Ptr: Date/Title
        DECLE   $0180           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

L_5014:
        PSHR    R5                              ; 5014   0275
        CLRR    R0                              ; 5015   01C0
        MVO     R0,     G_016E                  ; 5016   0240 016E
        PULR    R7                              ; 5018   02B7

L_5019:
        PSHR    R5                              ; 5019   0275
        MVII    #$003C, R0                      ; 501A   02B8 003C
        MVII    #$031D, R4                      ; 501C   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; 501E   0004 0114 0338

        MVII    #$00A0, R0                      ; 5021   02B8 00A0
        MVII    #$015D, R4                      ; 5023   02BC 015D

        JSR     R5,     X_FILL_ZERO             ; 5025   0004 0114 0338

        SDBD                                    ; 5028   0001
        MVII    #$5040, R4                      ; 5029   02BC 0040 0050

        JSR     R5,     L_5377                  ; 502C   0004 0150 0377

        MVII    #$0031, R0                      ; 502F   02B8 0031
        MVO     R0,     G_0160                  ; 5031   0240 0160
        MVII    #$0001, R0                      ; 5033   02B8 0001
        MVO     R0,     G_018C                  ; 5035   0240 018C
        MVII    #$0007, R0                      ; 5037   02B8 0007
        MVO     R0,     G_01A8                  ; 5039   0240 01A8
        MVO     R0,     G_01A9                  ; 503B   0240 01A9
        MVO     R0,     G_0162                  ; 503D   0240 0162
        PULR    R7                              ; 503F   02B7

        DECLE   $0024,  $0026,  $0028,  $002A   ; 5040   0024 0026 0028 002A
        DECLE   $002C,  $002E,  $0030,  $0000   ; 5044   002C 002E 0030 0000
.START:
        SDBD                                    ; 5048   0001
        MVII    #$50FA, R5                      ; 5049   02BD 00FA 0050
        PSHR    R5                              ; 504C   0275

        JSR     R5,     L_5019                  ; 504D   0004 0150 0019

        MVI     G_0359, R0                      ; 5050   0280 0359
        XOR     G_035E, R0                      ; 5052   03C0 035E
        MVO     R0,     G_035E                  ; 5054   0240 035E

        JSR     R5,     L_51BD                  ; 5056   0004 0150 01BD

        MVI     .BTAB.25,R0                     ; 5059   0280 0225
        XORI    #$0007, R0                      ; 505B   03F8 0007
        MVO     R0,     .BTAB.25                ; 505D   0240 0225
        CLRR    R0                              ; 505F   01C0
        MVO     R0,     .BTAB.CE                ; 5060   0240 02CE

        JSR     R5,     L_5370                  ; 5062   0004 0150 0370
        DECLE   $0032,  $0007                   ; 5065   0032 0007

        SDBD                                    ; 5067   0001
        MVII    #$5072, R0                      ; 5068   02B8 0072 0050
        MVO     R0,     G_035D                  ; 506B   0240 035D
        MVII    #$01F4, R0                      ; 506D   02B8 01F4
        MVO     R0,     G_0325                  ; 506F   0240 0325
        PULR    R7                              ; 5071   02B7

        SARC    R0,     2                       ; 5072   007C
        RLC     R0,     1                       ; 5073   0050
        SARC    R0,     2                       ; 5074   007C
        RLC     R0,     1                       ; 5075   0050
        SARC    R0,     2                       ; 5076   007C
        RLC     R0,     1                       ; 5077   0050
        SARC    R0,     2                       ; 5078   007C
        RLC     R0,     1                       ; 5079   0050
        SARC    R0,     2                       ; 507A   007C
        RLC     R0,     1                       ; 507B   0050
        PSHR    R5                              ; 507C   0275

        JSR     R5,     L_5019                  ; 507D   0004 0150 0019

        CLRR    R0                              ; 5080   01C0
        MVO     R0,     G_0106                  ; 5081   0240 0106
        MVII    #$0002, R0                      ; 5083   02B8 0002
        MVO     R0,     G_0165                  ; 5085   0240 0165
        MVII    #$00F0, R0                      ; 5087   02B8 00F0
        CLRR    R1                              ; 5089   01C9
        MVII    #$0200, R4                      ; 508A   02BC 0200

        JSR     R5,     X_FILL_MEM              ; 508C   0004 0114 0341
        JSR     R5,     L_6E59                  ; 508F   0004 016C 0259

        PULR    R7                              ; 5092   02B7

L_5093:
        MVII    #$0007, R3                      ; 5093   02BB 0007
        MVII    #$0218, R4                      ; 5095   02BC 0218

        JSR     R5,     X_PRINT_R5              ; 5097   0004 0118 007B
        STRING  "Select 1 or 2"                 ; 509A  
        DECLE   $0000                           ; 50A7   0000

        MVII    #$0007, R3                      ; 50A8   02BB 0007
        MVII    #$0240, R4                      ; 50AA   02BC 0240

        JSR     R5,     X_PRINT_R5              ; 50AC   0004 0118 007B
        STRING  "players:"                      ; 50AF  
        DECLE   $0000                           ; 50B7   0000
L_50B8:
        MVII    #$0001, R0                      ; 50B8   02B8 0001
        MVII    #$024A, R1                      ; 50BA   02B9 024A
        CLRR    R2                              ; 50BC   01D2
        MVII    #$0007, R3                      ; 50BD   02BB 0007
        SDBD                                    ; 50BF   0001
        MVII    #$50EC, R4                      ; 50C0   02BC 00EC 0050

        JSR     R5,     .EXEC.910               ; 50C3   0004 0118 0110

        MOVR    R0,     R1                      ; 50C6   0081

        JSR     R5,     X_CLAMP                 ; 50C7   0004 0114 0270
        DECLE   $0001                           ; 50CA   0001

        EIS                                     ; 50CB   0002
        CMPR    R0,     R1                      ; 50CC   0141
        BNEQ    L_50B8                          ; 50CD   022C 0016

        MVO     R0,     G_0161                  ; 50CF   0240 0161
        MVII    #$00A3, R0                      ; 50D1   02B8 00A3
        SWAP    R0,     1                       ; 50D3   0040
        MVO     R0,     G_0326                  ; 50D4   0240 0326
        MVII    #$0054, R0                      ; 50D6   02B8 0054
        SWAP    R0,     1                       ; 50D8   0040
        MVO     R0,     G_0327                  ; 50D9   0240 0327

        JSR     R5,     L_6436                  ; 50DB   0004 0164 0036
        JSR     R5,     L_D210                  ; 50DE   0004 01D0 0210

        MVII    #$0003, R0                      ; 50E1   02B8 0003
        MVO     R0,     G_0165                  ; 50E3   0240 0165
        SDBD                                    ; 50E5   0001
        MVII    #$6E4F, R0                      ; 50E6   02B8 004F 006E
        MVO     R0,     G_035D                  ; 50E9   0240 035D
        PULR    R7                              ; 50EB   02B7

        DECLE   $0000,  $0000,  $00F6,  $0050   ; 50EC   0000 0000 00F6 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50F0   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 50F4   0000 0000

        PSHR    R5                              ; 50F6   0275
        J       .EXEC.951                       ; 50F7   0004 0318 0151

L_50FA:
        EIS                                     ; 50FA   0002
        MVI     G_0102, R0                      ; 50FB   0280 0102
        DECR    R0                              ; 50FD   0010
        BPL     L_50FA                          ; 50FE   0223 0005

        MVII    #$0003, R1                      ; 5100   02B9 0003
        MVO     R1,     G_0102                  ; 5102   0241 0102
        NEGR    R0                              ; 5104   0020

        JSR     R5,     X_RAND1                 ; 5105   0004 0114 027D

        MVI     G_0165, R1                      ; 5108   0281 0165
        INCR    R1                              ; 510A   0009
        ADDR    R7,     R1                      ; 510B   00F9
        ADD@    R1,     R7                      ; 510C   02CF

        DECLE   $0004                           ; 510D   0004

        DECR    R3                              ; 510E   0013
        COMR    R4                              ; 510F   001C
        DECR    R6                              ; 5110   0016
        MVI     G_0325, R0                      ; 5111   0280 0325
        DECR    R0                              ; 5113   0010
        MVO     R0,     G_0325                  ; 5114   0240 0325
        BNEQ    L_5129                          ; 5116   020C 0011

        INCR    R0                              ; 5118   0008
        MVO     R0,     G_0165                  ; 5119   0240 0165

        JSR     R5,     L_517F                  ; 511B   0004 0150 017F

        B       L_5129                          ; 511E   0200 0009

        JSR     R5,     L_6E33                  ; 5120   0004 016C 0233
        JSR     R5,     L_6E44                  ; 5123   0004 016C 0244
        JSR     R5,     .EXEC.7D5               ; 5126   0004 0114 03D5
L_5129:
        JSR     R5,     .EXEC.4F1               ; 5129   0004 0114 00F1
        JSR     R5,     .EXEC.AAD               ; 512C   0004 0118 02AD

        B       L_50FA                          ; 512F   0220 0036

L_5131:
        PSHR    R5                              ; 5131   0275
        MVII    #$011D, R4                      ; 5132   02BC 011D
        SDBD                                    ; 5134   0001
        MVI@    R4,     R0                      ; 5135   02A0
        CMPI    #$0014, R0                      ; 5136   0378 0014
        BGT     L_513D                          ; 5138   020E 0003
        J       X_RESET                         ; 513A   0004 0310 0000

L_513D:
        MVI     G_0166, R0                      ; 513D   0280 0166
        DECR    R0                              ; 513F   0010
        BMI     L_5145                          ; 5140   020B 0003

        MVO     R0,     G_0166                  ; 5142   0240 0166
        PULR    R7                              ; 5144   02B7

L_5145:
        MVI     G_0179, R0                      ; 5145   0280 0179
        TSTR    R0                              ; 5147   0080
        BEQ     L_5169                          ; 5148   0204 001F

        MVII    #$0003, R0                      ; 514A   02B8 0003

        JSR     R5,     X_RAND1                 ; 514C   0004 0114 027D

        CMPI    #$0005, R0                      ; 514F   0378 0005
        BGE     L_517B                          ; 5151   020D 0028

        MVI     G_0170, R3                      ; 5153   0283 0170
        ADDR    R7,     R3                      ; 5155   00FB
        ADDI    #$0026, R3                      ; 5156   02FB 0026
        MVI@    R3,     R3                      ; 5158   029B
        MVII    #$0003, R0                      ; 5159   02B8 0003

        JSR     R5,     X_RAND1                 ; 515B   0004 0114 027D

        TSTR    R0                              ; 515E   0080
        BNEQ    L_5162                          ; 515F   020C 0001

        SLR     R3,     1                       ; 5161   0063
L_5162:
        MVO     R3,     G_0169                  ; 5162   0243 0169
        MVII    #$0006, R0                      ; 5164   02B8 0006
        MVO     R0,     G_0166                  ; 5166   0240 0166
        PULR    R7                              ; 5168   02B7

L_5169:
        MVI     .PSG1.lft_hand,R3               ; 5169   0283 00FF
        MVII    #$0006, R0                      ; 516B   02B8 0006

        JSR     R5,     X_RAND1                 ; 516D   0004 0114 027D

        TSTR    R0                              ; 5170   0080
        BNEQ    L_5175                          ; 5171   020C 0002

        MVII    #$00FB, R3                      ; 5173   02BB 00FB
L_5175:
        MVO     R3,     G_0169                  ; 5175   0243 0169
        MVI     G_0167, R0                      ; 5177   0280 0167
        MVO     R0,     G_0166                  ; 5179   0240 0166
L_517B:
        PULR    R7                              ; 517B   02B7

        DECLE   $0000                           ; 517C   0000

        TSTR    R0                              ; 517D   0080
        NEGR    R0                              ; 517E   0020
L_517F:
        PSHR    R5                              ; 517F   0275
        MVII    #$0003, R0                      ; 5180   02B8 0003

        JSR     R5,     X_RAND1                 ; 5182   0004 0114 027D

        MVO     R0,     G_0166                  ; 5185   0240 0166
        MVO     R0,     G_0167                  ; 5187   0240 0167
        MVII    #$00FF, R0                      ; 5189   02B8 00FF
        MVO     R0,     G_0169                  ; 518B   0240 0169
        MVII    #$0001, R0                      ; 518D   02B8 0001
        MVO     R0,     G_0161                  ; 518F   0240 0161
        MVII    #$0002, R0                      ; 5191   02B8 0002
        MVO     R0,     G_01B4                  ; 5193   0240 01B4

        JSR     R5,     L_6436                  ; 5195   0004 0164 0036
        JSR     R5,     L_D210                  ; 5198   0004 01D0 0210

        SDBD                                    ; 519B   0001
        MVII    #$5300, R0                      ; 519C   02B8 0000 0053
        MVO     R0,     G_0326                  ; 519F   0240 0326
        SDBD                                    ; 51A1   0001
        MVII    #$3D00, R1                      ; 51A2   02B9 0000 003D
        MVO     R1,     G_0327                  ; 51A5   0241 0327
        MVII    #$000A, R0                      ; 51A7   02B8 000A

        JSR     R5,     X_RAND1                 ; 51A9   0004 0114 027D

        NEGR    R0                              ; 51AC   0020
        MVO     R0,     G_0329                  ; 51AD   0240 0329
        MVII    #$000B, R0                      ; 51AF   02B8 000B

        JSR     R5,     X_RAND1                 ; 51B1   0004 0114 027D

        SARC    R0,     1                       ; 51B4   0078
        ADCR    R7                              ; 51B5   002F

        NEGR    R0                              ; 51B6   0020
L_51B7:
        MVO     R0,     G_0328                  ; 51B7   0240 0328
        CLRR    R0                              ; 51B9   01C0
        MVO     R0,     G_015D                  ; 51BA   0240 015D
        PULR    R7                              ; 51BC   02B7

L_51BD:
        SDBD                                    ; 51BD   0001
        MVII    #$51C7, R0                      ; 51BE   02B8 00C7 0051
        MVO     R0,     .ISRVEC.0               ; 51C1   0240 0100
        SWAP    R0,     1                       ; 51C3   0040
        MVO     R0,     .ISRVEC.1               ; 51C4   0240 0101
        MOVR    R5,     R7                      ; 51C6   00AF

        MVI     G_0102, R1                      ; 51C7   0281 0102
        SWAP    R1,     1                       ; 51C9   0041
        SWAP    R1,     1                       ; 51CA   0041
        BPL     L_51D0                          ; 51CB   0203 0003
        J       X_DEF_ISR                       ; 51CD   0004 0310 0126

L_51D0:
        PSHR    R5                              ; 51D0   0275
        DECR    R1                              ; 51D1   0011
        BMI     L_51D6                          ; 51D2   020B 0002

        MVO     R1,     G_0102                  ; 51D4   0241 0102

L_51D6:
        JSR     R5,     L_523B                  ; 51D6   0004 0150 023B
        JSR     R5,     L_D54C                  ; 51D9   0004 01D4 014C
        JSR     R5,     L_D55F                  ; 51DC   0004 01D4 015F
        JSR     R5,     L_5286                  ; 51DF   0004 0150 0286
        JSR     R5,     L_52B1                  ; 51E2   0004 0150 02B1

        MVO     R0,     .STIC.VIDEN             ; 51E5   0240 0020

        JSR     R5,     L_51F1                  ; 51E7   0004 0150 01F1
        JSR     R5,     L_5273                  ; 51EA   0004 0150 0273

        PULR    R5                              ; 51ED   02B5
        J       X_PLAY_NOTE                     ; 51EE   0004 0318 02BD

L_51F1:
        PSHR    R5                              ; 51F1   0275
        SDBD                                    ; 51F2   0001
        MVII    #$032A, R4                      ; 51F3   02BC 002A 0003
L_51F6:
        CLRR    R5                              ; 51F6   01ED
        MVI@    R4,     R0                      ; 51F7   02A0
        MVO@    R0,     R5                      ; 51F8   0268
        MVI@    R4,     R0                      ; 51F9   02A0
        MVO@    R0,     R5                      ; 51FA   0268
        MVI@    R4,     R0                      ; 51FB   02A0
        MVO@    R0,     R5                      ; 51FC   0268
        MVI@    R4,     R0                      ; 51FD   02A0
        MVO@    R0,     R5                      ; 51FE   0268
        MVI@    R4,     R0                      ; 51FF   02A0
        MVO@    R0,     R5                      ; 5200   0268
        MVI@    R4,     R0                      ; 5201   02A0
        MVO@    R0,     R5                      ; 5202   0268
        MVI@    R4,     R0                      ; 5203   02A0
        MVO@    R0,     R5                      ; 5204   0268
        MVI@    R4,     R0                      ; 5205   02A0
        MVO@    R0,     R5                      ; 5206   0268
        MVI@    R4,     R0                      ; 5207   02A0
        MVO@    R0,     R5                      ; 5208   0268
        MVI@    R4,     R0                      ; 5209   02A0
        MVO@    R0,     R5                      ; 520A   0268
        MVI@    R4,     R0                      ; 520B   02A0
        MVO@    R0,     R5                      ; 520C   0268
        MVI@    R4,     R0                      ; 520D   02A0
        MVO@    R0,     R5                      ; 520E   0268
        MVI@    R4,     R0                      ; 520F   02A0
        MVO@    R0,     R5                      ; 5210   0268
        MVI@    R4,     R0                      ; 5211   02A0
        MVO@    R0,     R5                      ; 5212   0268
        MVI@    R4,     R0                      ; 5213   02A0
        MVO@    R0,     R5                      ; 5214   0268
        MVI@    R4,     R0                      ; 5215   02A0
        MVO@    R0,     R5                      ; 5216   0268
        MVI@    R4,     R0                      ; 5217   02A0
        MVO@    R0,     R5                      ; 5218   0268
        MVI@    R4,     R0                      ; 5219   02A0
        MVO@    R0,     R5                      ; 521A   0268
        MVI@    R4,     R0                      ; 521B   02A0
        MVO@    R0,     R5                      ; 521C   0268
        MVI@    R4,     R0                      ; 521D   02A0
        MVO@    R0,     R5                      ; 521E   0268
        MVI@    R4,     R0                      ; 521F   02A0
        MVO@    R0,     R5                      ; 5220   0268
        MVI@    R4,     R0                      ; 5221   02A0
        MVO@    R0,     R5                      ; 5222   0268
        MVI@    R4,     R0                      ; 5223   02A0
        MVO@    R0,     R5                      ; 5224   0268
        MVI@    R4,     R0                      ; 5225   02A0
        MVO@    R0,     R5                      ; 5226   0268
        MVI     G_0185, R0                      ; 5227   0280 0185
        MVO     R0,     .STIC.VDLY              ; 5229   0240 0031
        MVII    #$016A, R4                      ; 522B   02BC 016A
        MVII    #$0028, R5                      ; 522D   02BD 0028
        MVI@    R4,     R0                      ; 522F   02A0
        MVO@    R0,     R5                      ; 5230   0268
        MVI@    R4,     R0                      ; 5231   02A0
        MVO@    R0,     R5                      ; 5232   0268
        MVI@    R4,     R0                      ; 5233   02A0
        MVO@    R0,     R5                      ; 5234   0268
        MVI@    R4,     R0                      ; 5235   02A0
        MVO@    R0,     R5                      ; 5236   0268
        MVI     G_0106, R0                      ; 5237   0280 0106
        MVO@    R0,     R5                      ; 5239   0268
        PULR    R7                              ; 523A   02B7

L_523B:
        MVI     G_0165, R0                      ; 523B   0280 0165
        SARC    R0,     1                       ; 523D   0078
        BNC     L_5272                          ; 523E   0209 0032

        MVI     G_0326, R0                      ; 5240   0280 0326
        SWAP    R0,     1                       ; 5242   0040
        ANDI    #$00FF, R0                      ; 5243   03B8 00FF
        MVI     G_032C, R1                      ; 5245   0281 032C
        SDBD                                    ; 5247   0001
        ANDI    #$FF00, R1                      ; 5248   03B9 0000 00FF
        XORR    R1,     R0                      ; 524B   01C8
        MVO     R0,     G_032C                  ; 524C   0240 032C
        MVI     G_0327, R0                      ; 524E   0280 0327
        MOVR    R0,     R3                      ; 5250   0083
        SWAP    R0,     1                       ; 5251   0040
        ANDI    #$007F, R0                      ; 5252   03B8 007F
        MVI     G_0334, R1                      ; 5254   0281 0334
        SDBD                                    ; 5256   0001
        ANDI    #$FF80, R1                      ; 5257   03B9 0080 00FF
        XORR    R1,     R0                      ; 525A   01C8
        MVO     R0,     G_0334                  ; 525B   0240 0334
        MVI     G_033C, R0                      ; 525D   0280 033C
        SDBD                                    ; 525F   0001
        ANDI    #$F807, R0                      ; 5260   03B8 0007 00F8
        SWAP    R3,     2                       ; 5263   0047
        BMI     L_526C                          ; 5264   020B 0006

        SDBD                                    ; 5266   0001
        XORI    #$01B0, R0                      ; 5267   03F8 00B0 0001
        B       L_5270                          ; 526A   0200 0004

L_526C:
        SDBD                                    ; 526C   0001
        XORI    #$01B8, R0                      ; 526D   03F8 00B8 0001
L_5270:
        MVO     R0,     G_033C                  ; 5270   0240 033C
L_5272:
        MOVR    R5,     R7                      ; 5272   00AF

L_5273:
        MVI     G_0165, R1                      ; 5273   0281 0165
        CMPI    #$0003, R1                      ; 5275   0379 0003
        BNEQ    L_5285                          ; 5277   020C 000C

        MVI     .PSG0.rgt_hand,R0               ; 5279   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 527B   0380 01FF
        CMP     G_0168, R0                      ; 527D   0340 0168
        BNEQ    L_5283                          ; 527F   020C 0002

        MVO     R0,     G_0169                  ; 5281   0240 0169
L_5283:
        MVO     R0,     G_0168                  ; 5283   0240 0168
L_5285:
        MOVR    R5,     R7                      ; 5285   00AF

L_5286:
        PSHR    R5                              ; 5286   0275
        MVI     G_01B4, R0                      ; 5287   0280 01B4
        TSTR    R0                              ; 5289   0080
        BNEQ    L_52B0                          ; 528A   020C 0024

        MVI     G_016E, R0                      ; 528C   0280 016E
        CMP     G_0162, R0                      ; 528E   0340 0162
        BEQ     L_52B0                          ; 5290   0204 001E
        BGT     L_52A5                          ; 5292   020E 0011

        MVII    #$0010, R0                      ; 5294   02B8 0010
        SDBD                                    ; 5296   0001
        MVII    #$D78C, R4                      ; 5297   02BC 008C 00D7
        SDBD                                    ; 529A   0001
        MVII    #$3980, R1                      ; 529B   02B9 0080 0039

        JSR     R5,     .EXEC.730               ; 529E   0004 0114 0330

        MVII    #$0007, R0                      ; 52A1   02B8 0007
        B       L_52AE                          ; 52A3   0200 0009

L_52A5:
        CLRR    R1                              ; 52A5   01C9
        DECR    R0                              ; 52A6   0010
        MOVR    R0,     R2                      ; 52A7   0082
        ADDR    R0,     R2                      ; 52A8   00C2
        SDBD                                    ; 52A9   0001
        ADDI    #$3980, R2                      ; 52AA   02FA 0080 0039
        MVO@    R1,     R2                      ; 52AD   0251
L_52AE:
        MVO     R0,     G_016E                  ; 52AE   0240 016E
L_52B0:
        PULR    R7                              ; 52B0   02B7

L_52B1:
        PSHR    R5                              ; 52B1   0275
        MVI     G_0164, R0                      ; 52B2   0280 0164
        ADDI    #$0007, R0                      ; 52B4   02F8 0007
        SAR     R0,     2                       ; 52B6   006C
        SAR     R0,     1                       ; 52B7   0068
        CMP     G_016F, R0                      ; 52B8   0340 016F
        BEQ     L_52D3                          ; 52BA   0204 0017

        MVO     R0,     G_016F                  ; 52BC   0240 016F
        SDBD                                    ; 52BE   0001
        MVII    #$3977, R1                      ; 52BF   02B9 0077 0039
        TSTR    R0                              ; 52C2   0080
        BEQ     L_52C8                          ; 52C3   0204 0003

        ADDR    R0,     R1                      ; 52C5   00C1
        CLRR    R2                              ; 52C6   01D2
        MVO@    R2,     R1                      ; 52C7   024A
L_52C8:
        INCR    R1                              ; 52C8   0009
        NEGR    R0                              ; 52C9   0020
        ADDI    #$0008, R0                      ; 52CA   02F8 0008
        SDBD                                    ; 52CC   0001
        MVII    #$D64C, R4                      ; 52CD   02BC 004C 00D6

        JSR     R5,     .EXEC.730               ; 52D0   0004 0114 0330

L_52D3:
        PULR    R7                              ; 52D3   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 52D4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; 52D8   0000 0000 0000 0002
        DECLE   $0000,  $0000,  $00B7,  $0009   ; 52DC   0000 0000 00B7 0009
        DECLE   $0088,  $0006,  $0022,  $0001   ; 52E0   0088 0006 0022 0001
        DECLE   $0091,  $0009,  $001C,  $0006   ; 52E4   0091 0009 001C 0006
        DECLE   $0090,  $0001,  $0082,  $0019   ; 52E8   0090 0001 0082 0019
        DECLE   $0028,  $0002,  $008C,  $0000   ; 52EC   0028 0002 008C 0000
        DECLE   $00E2,  $0009,  $0054,  $0002   ; 52F0   00E2 0009 0054 0002
        DECLE   $0089,  $0000,  $00A7,  $0009   ; 52F4   0089 0000 00A7 0009
        DECLE   $0050,  $0002,  $0088,  $0000   ; 52F8   0050 0002 0088 0000
        DECLE   $00A7,  $0009,  $0048,  $0006   ; 52FC   00A7 0009 0048 0006
        DECLE   $00DE,  $0000,  $00C3,  $0009   ; 5300   00DE 0000 00C3 0009
        DECLE   $0020,  $0006,  $00BE,  $0000   ; 5304   0020 0006 00BE 0000
        DECLE   $00C3,  $0009,  $0020,  $0006   ; 5308   00C3 0009 0020 0006
        DECLE   $00BE,  $0000,  $00C3,  $0009   ; 530C   00BE 0000 00C3 0009
        DECLE   $0038,  $0006,  $00CE,  $0000   ; 5310   0038 0006 00CE 0000
        DECLE   $00C3,  $0009,  $0058,  $0006   ; 5314   00C3 0009 0058 0006
        DECLE   $00DE,  $0004,  $00C3,  $0009   ; 5318   00DE 0004 00C3 0009
        DECLE   $0080,  $0006,  $00BE,  $0004   ; 531C   0080 0006 00BE 0004
        DECLE   $00C3,  $0009,  $0068,  $0006   ; 5320   00C3 0009 0068 0006
        DECLE   $00D6,  $0004,  $00C3,  $0009   ; 5324   00D6 0004 00C3 0009
        DECLE   $0068,  $0006,  $00CE,  $0004   ; 5328   0068 0006 00CE 0004
        DECLE   $00C3,  $0009,  $0098,  $0002   ; 532C   00C3 0009 0098 0002
        DECLE   $0020,  $0005,  $0086,  $0019   ; 5330   0020 0005 0086 0019
        DECLE   $0098,  $0002,  $0092,  $0000   ; 5334   0098 0002 0092 0000
        DECLE   $00A7,  $0009,  $0010,  $0002   ; 5338   00A7 0009 0010 0002
        DECLE   $00A0,  $0000,  $0096,  $0009   ; 533C   00A0 0000 0096 0009
        DECLE   $001C,  $0006,  $0035           ; 5340   001C 0006 0035

        DIS                                     ; 5343   0003
        MOVR    R0,     R7                      ; 5344   0087

        DECLE   $0011,  $002D,  $0006,  $0035   ; 5345   0011 002D 0006 0035
        DECLE   $0003,  $004F,  $0012,  $003E   ; 5349   0003 004F 0012 003E
        DECLE   $0006,  $0035,  $0003,  $0077   ; 534D   0006 0035 0003 0077
        DECLE   $0012,  $0050,  $0006,  $0035   ; 5351   0012 0050 0006 0035

        DIS                                     ; 5355   0003
L_5356:
        DECR    R7                              ; 5356   0017

        DECLE   $0012,  $0063,  $0006,  $0035   ; 5357   0012 0063 0006 0035

        DIS                                     ; 535B   0003
        INCR    R7                              ; 535C   000F

        DECR    R2                              ; 535D   0012
L_535E:
        RRC     R0,     2                       ; 535E   0074
        DECLE   $0006,  $0035,  $0003,  $0067   ; 535F   0006 0035 0003 0067
        DECLE   $0012,  $0085,  $0006,  $0035   ; 5363   0012 0085 0006 0035
        DECLE   $0003,  $0067,  $0012,  $0038   ; 5367   0003 0067 0012 0038
        DECLE   $0002,  $00D8,  $0000           ; 536B   0002 00D8 0000

        SETC                                    ; 536E   0007
        INCR    R0                              ; 536F   0008
L_5370:
        MVI@    R5,     R4                      ; 5370   02AC
        MVI@    R5,     R2                      ; 5371   02AA
        PSHR    R5                              ; 5372   0275
        MVII    #$0007, R1                      ; 5373   02B9 0007
        B       L_537C                          ; 5375   0200 0005

L_5377:
        PSHR    R5                              ; 5377   0275
        MOVR    R4,     R5                      ; 5378   00A5
        CLRR    R1                              ; 5379   01C9
L_537A:
        MVI@    R5,     R4                      ; 537A   02AC
        MOVR    R1,     R2                      ; 537B   008A
L_537C:
        ADDI    #$032A, R2                      ; 537C   02FA 032A
        MOVR    R4,     R0                      ; 537E   00A0
        ADDR    R0,     R0                      ; 537F   00C0
        ADDR    R0,     R4                      ; 5380   00C4
        SDBD                                    ; 5381   0001
        ADDI    #$52D4, R4                      ; 5382   02FC 00D4 0052
        SDBD                                    ; 5385   0001
        MVI@    R4,     R0                      ; 5386   02A0
        MVO@    R0,     R2                      ; 5387   0250
        ADDI    #$0008, R2                      ; 5388   02FA 0008
        SDBD                                    ; 538A   0001
        MVI@    R4,     R0                      ; 538B   02A0
        MVO@    R0,     R2                      ; 538C   0250
        ADDI    #$0008, R2                      ; 538D   02FA 0008
        SDBD                                    ; 538F   0001
        MVI@    R4,     R0                      ; 5390   02A0
        MVO@    R0,     R2                      ; 5391   0250
        INCR    R1                              ; 5392   0009
        CMPI    #$0007, R1                      ; 5393   0379 0007
        BLE     L_537A                          ; 5395   0226 001C
        PULR    R7                              ; 5397   02B7

L_5398:
        PSHR    R5                              ; 5398   0275
        MVI     G_0326, R1                      ; 5399   0281 0326
        SUBI    #$0040, R1                      ; 539B   0339 0040
        SWAP    R1,     1                       ; 539D   0041
        ANDI    #$00FF, R1                      ; 539E   03B9 00FF
        MVI     G_0327, R2                      ; 53A0   0282 0327
        SUBI    #$0040, R2                      ; 53A2   033A 0040
        SWAP    R2,     1                       ; 53A4   0042
        ANDI    #$00FF, R2                      ; 53A5   03BA 00FF
        SUBI    #$0008, R1                      ; 53A7   0339 0008
        SUBI    #$0008, R2                      ; 53A9   033A 0008
        CMP     G_0177, R1                      ; 53AB   0341 0177
        BNEQ    L_53B5                          ; 53AD   020C 0006

        CMP     G_0178, R2                      ; 53AF   0342 0178
        BNEQ    L_53B5                          ; 53B1   020C 0002

        SETC                                    ; 53B3   0007
        PULR    R7                              ; 53B4   02B7

L_53B5:
        MVO     R1,     G_0177                  ; 53B5   0241 0177
        MVO     R2,     G_0178                  ; 53B7   0242 0178
        CLRC                                    ; 53B9   0006
        PULR    R7                              ; 53BA   02B7

L_53BB:
        PSHR    R5                              ; 53BB   0275
        MVI     G_0177, R1                      ; 53BC   0281 0177
        MVI     G_0178, R2                      ; 53BE   0282 0178
        INCR    R1                              ; 53C0   0009
        INCR    R2                              ; 53C1   000A
        CLRR    R0                              ; 53C2   01C0
        MVO     R0,     G_0342                  ; 53C3   0240 0342
        MVO     R0,     G_0179                  ; 53C5   0240 0179

        JSR     R5,     L_5476                  ; 53C7   0004 0154 0076

        MOVR    R0,     R1                      ; 53CA   0081
        ADDI    #$0200, R1                      ; 53CB   02F9 0200
        MVI@    R1,     R1                      ; 53CD   0289
        TSTR    R1                              ; 53CE   0089
        BMI     L_53D3                          ; 53CF   020B 0002

        MVO     R0,     G_0172                  ; 53D1   0240 0172
L_53D3:
        CLRR    R1                              ; 53D3   01C9
        MVI     G_0342, R0                      ; 53D4   0280 0342
        SUBI    #$03E8, R0                      ; 53D6   0338 03E8
        BMI     L_53E4                          ; 53D8   020B 000A

        INCR    R1                              ; 53DA   0009
        CMPI    #$0004, R0                      ; 53DB   0378 0004
        BLT     L_53E2                          ; 53DD   0205 0003

        INCR    R1                              ; 53DF   0009
        SUBI    #$0004, R0                      ; 53E0   0338 0004
L_53E2:
        MVO     R0,     G_0171                  ; 53E2   0240 0171
L_53E4:
        MVO     R1,     G_0170                  ; 53E4   0241 0170
        CLRR    R0                              ; 53E6   01C0
        MVO     R0,     G_0176                  ; 53E7   0240 0176
        MVO     R0,     G_0174                  ; 53E9   0240 0174
        SDBD                                    ; 53EB   0001
        MVII    #$5423, R4                      ; 53EC   02BC 0023 0054
L_53EF:
        MVI     G_0177, R1                      ; 53EF   0281 0177
        MVI     G_0178, R2                      ; 53F1   0282 0178
        ADD@    R4,     R1                      ; 53F3   02E1
        ADD@    R4,     R2                      ; 53F4   02E2
        PSHR    R4                              ; 53F5   0274

        JSR     R5,     L_5476                  ; 53F6   0004 0154 0076

        PULR    R4                              ; 53F9   02B4
        MVI     G_0176, R1                      ; 53FA   0281 0176
        SLL     R1,     1                       ; 53FC   0049
        TSTR    R3                              ; 53FD   009B
        BEQ     L_5403                          ; 53FE   0204 0003

        MVO     R0,     G_0173                  ; 5400   0240 0173
        INCR    R1                              ; 5402   0009
L_5403:
        MVO     R1,     G_0176                  ; 5403   0241 0176
        CMP     G_0174, R3                      ; 5405   0343 0174
        BLE     L_540B                          ; 5407   0206 0002

        MVO     R3,     G_0174                  ; 5409   0243 0174
L_540B:
        SDBD                                    ; 540B   0001
        CMPI    #$542B, R4                      ; 540C   037C 002B 0054
        BNEQ    L_53EF                          ; 540F   022C 0021

        MVI     G_0176, R2                      ; 5411   0282 0176
        TSTR    R2                              ; 5413   0092
        BEQ     L_5420                          ; 5414   0204 000A

        MOVR    R2,     R1                      ; 5416   0091
        SLL     R1,     2                       ; 5417   004D
        ADDR    R1,     R2                      ; 5418   00CA
        ADD     G_0174, R2                      ; 5419   02C2 0174
        SDBD                                    ; 541B   0001
        ADDI    #$5425, R2                      ; 541C   02FA 0025 0054
        MVI@    R2,     R2                      ; 541F   0292
L_5420:
        MVO     R2,     G_0175                  ; 5420   0242 0175
        PULR    R7                              ; 5422   02B7

        DECLE   $0002,  $0002,  $0000,  $0002   ; 5423   0002 0002 0000 0002
        DECLE   $0002,  $0000,  $0000,  $0000   ; 5427   0002 0000 0000 0000
        DECLE   $000A,  $000C,  $000B,  $0009   ; 542B   000A 000C 000B 0009
        DECLE   $0008,  $0004,  $0006,  $0005   ; 542F   0008 0004 0006 0005
        DECLE   $0003,  $0002,  $0007,  $0006   ; 5433   0003 0002 0007 0006
        DECLE   $0005                           ; 5437   0005

        INCR    R1                              ; 5438   0009
        INCR    R0                              ; 5439   0008
        DECR    R0                              ; 543A   0010
        DECR    R2                              ; 543B   0012
        DECR    R1                              ; 543C   0011
        INCR    R7                              ; 543D   000F

        INCR    R6                              ; 543E   000E
L_543F:
        INCR    R5                              ; 543F   000D
        DECLE   $000C,  $000B,  $000F,  $000E   ; 5440   000C 000B 000F 000E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5444   0000 0000 0000 0000
        DECLE   $0000                           ; 5448   0000

        COMR    R2                              ; 5449   001A
        COMR    R2                              ; 544A   001A
        COMR    R2                              ; 544B   001A
        COMR    R2                              ; 544C   001A
        COMR    R2                              ; 544D   001A
        DECR    R6                              ; 544E   0016
        COMR    R0                              ; 544F   0018
L_5450:
        DECR    R7                              ; 5450   0017

        DECLE   $0015,  $0014,  $0000,  $0000   ; 5451   0015 0014 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5455   0000 0000 0000 0001

        COMR    R0                              ; 5459   0018
L_545A:
        DECR    R7                              ; 545A   0017

        DIS                                     ; 545B   0003
        EIS                                     ; 545C   0002
        COMR    R1                              ; 545D   0019
        COMR    R1                              ; 545E   0019
        COMR    R1                              ; 545F   0019
        COMR    R1                              ; 5460   0019
        COMR    R1                              ; 5461   0019
        DECR    R3                              ; 5462   0013
        DECR    R2                              ; 5463   0012
        DECR    R1                              ; 5464   0011
        DECR    R5                              ; 5465   0015
        DECR    R4                              ; 5466   0014
        COMR    R3                              ; 5467   001B
        COMR    R3                              ; 5468   001B
        COMR    R3                              ; 5469   001B
        COMR    R3                              ; 546A   001B
        COMR    R3                              ; 546B   001B
        COMR    R4                              ; 546C   001C
        COMR    R4                              ; 546D   001C
        COMR    R4                              ; 546E   001C
        COMR    R4                              ; 546F   001C
        COMR    R4                              ; 5470   001C
        COMR    R5                              ; 5471   001D
        COMR    R5                              ; 5472   001D
        COMR    R5                              ; 5473   001D
        COMR    R5                              ; 5474   001D
        COMR    R5                              ; 5475   001D
L_5476:
        PSHR    R5                              ; 5476   0275
        MOVR    R1,     R4                      ; 5477   008C
        MOVR    R2,     R5                      ; 5478   0095
        ANDI    #$00F8, R1                      ; 5479   03B9 00F8
        ANDI    #$00F8, R2                      ; 547B   03BA 00F8
        SLL     R2,     1                       ; 547D   004A
        SLR     R1,     1                       ; 547E   0061
        ADDR    R2,     R1                      ; 547F   00D1
        SLR     R1,     2                       ; 5480   0065
        ADDR    R1,     R2                      ; 5481   00CA
        MOVR    R2,     R0                      ; 5482   0090
        MOVR    R0,     R3                      ; 5483   0083
        ADDI    #$0200, R3                      ; 5484   02FB 0200
        MVI@    R3,     R3                      ; 5486   029B
        SLLC    R3,     2                       ; 5487   005F
        BNC     L_548E                          ; 5488   0209 0004
        BNOV    L_548E                          ; 548A   020A 0002

        CLRR    R3                              ; 548C   01DB
        PULR    R7                              ; 548D   02B7

L_548E:
        MVI     G_01B4, R3                      ; 548E   0283 01B4
        TSTR    R3                              ; 5490   009B
        BNEQ    L_54A7                          ; 5491   020C 0014

        CMPI    #$002C, R4                      ; 5493   037C 002C
        BGE     L_54A7                          ; 5495   020D 0010

        MVI     G_0162, R3                      ; 5497   0283 0162
        TSTR    R3                              ; 5499   009B
        BEQ     L_54A7                          ; 549A   0204 000B

        SLL     R3,     1                       ; 549C   004B
        ADDI    #$0006, R3                      ; 549D   02FB 0006
L_549F:
        CMPR    R3,     R5                      ; 549F   015D
        BGT     L_54A7                          ; 54A0   020E 0005

        MVII    #$0001, R3                      ; 54A2   02BB 0001
        MVO     R3,     G_0163                  ; 54A4   0243 0163
        PULR    R7                              ; 54A6   02B7

L_54A7:
        MVI     G_01B4, R3                      ; 54A7   0283 01B4
        ADDR    R7,     R3                      ; 54A9   00FB
        ADDI    #$0067, R3                      ; 54AA   02FB 0067
        MVI@    R3,     R3                      ; 54AC   029B
        ADDR    R0,     R3                      ; 54AD   00C3
        SDBD                                    ; 54AE   0001
        ADDI    #$59D0, R3                      ; 54AF   02FB 00D0 0059
        MVI@    R3,     R3                      ; 54B2   029B
        MVO     R3,     G_0342                  ; 54B3   0243 0342
        CMPI    #$03E8, R3                      ; 54B5   037B 03E8
        BLT     L_54CD                          ; 54B7   0205 0014

        MVII    #$017D, R1                      ; 54B9   02B9 017D
        CMPI    #$03EC, R3                      ; 54BB   037B 03EC
        BLT     L_54C5                          ; 54BD   0205 0006

        INCR    R1                              ; 54BF   0009
        SUBI    #$0004, R3                      ; 54C0   033B 0004
        XORI    #$0001, R3                      ; 54C2   03FB 0001
        COMR    R4                              ; 54C4   001C
L_54C5:
        MVI@    R1,     R1                      ; 54C5   0289
        SLL     R1,     2                       ; 54C6   004D
        SDBD                                    ; 54C7   0001
        ADDI    #$58B8, R1                      ; 54C8   02F9 00B8 0058
        ADDR    R1,     R3                      ; 54CB   00CB
        MVI@    R3,     R3                      ; 54CC   029B
L_54CD:
        MOVR    R5,     R2                      ; 54CD   00AA
        RRC     R2,     2                       ; 54CE   0076
        RRC     R2,     2                       ; 54CF   0076
        RRC     R2,     1                       ; 54D0   0072
        MOVR    R4,     R1                      ; 54D1   00A1
        RRC     R1,     2                       ; 54D2   0075
        RRC     R1,     2                       ; 54D3   0075
        RRC     R1,     1                       ; 54D4   0071
        SLLC    R1,     1                       ; 54D5   0059
        RLC     R3,     1                       ; 54D6   0053
        SDBD                                    ; 54D7   0001
        ADDI    #$5CB0, R3                      ; 54D8   02FB 00B0 005C
        MVI@    R3,     R3                      ; 54DB   029B
        SLLC    R2,     1                       ; 54DC   005A
        RLC     R3,     1                       ; 54DD   0053
        SDBD                                    ; 54DE   0001
        ADDI    #$5CB0, R3                      ; 54DF   02FB 00B0 005C
        MVI@    R3,     R3                      ; 54E2   029B
        SLLC    R1,     1                       ; 54E3   0059
        RLC     R3,     1                       ; 54E4   0053
        SDBD                                    ; 54E5   0001
        ADDI    #$5CB0, R3                      ; 54E6   02FB 00B0 005C
        MVI@    R3,     R3                      ; 54E9   029B
        SLLC    R2,     1                       ; 54EA   005A
        RLC     R3,     1                       ; 54EB   0053
        SDBD                                    ; 54EC   0001
        ADDI    #$5CB0, R3                      ; 54ED   02FB 00B0 005C
        MVI@    R3,     R3                      ; 54F0   029B
        SLLC    R1,     1                       ; 54F1   0059
        RLC     R3,     1                       ; 54F2   0053
        SDBD                                    ; 54F3   0001
        ADDI    #$5CB0, R3                      ; 54F4   02FB 00B0 005C
        MVI@    R3,     R3                      ; 54F7   029B
        SLLC    R2,     1                       ; 54F8   005A
        RLC     R3,     1                       ; 54F9   0053
        SDBD                                    ; 54FA   0001
        ADDI    #$5CB0, R3                      ; 54FB   02FB 00B0 005C
        MVI@    R3,     R3                      ; 54FE   029B
        CMPI    #$0006, R3                      ; 54FF   037B 0006
        BNEQ    L_5506                          ; 5501   020C 0003

        MVO     R3,     G_0179                  ; 5503   0243 0179
        CLRR    R3                              ; 5505   01DB
L_5506:
        MVI     G_0342, R2                      ; 5506   0282 0342
        CMPI    #$03EC, R2                      ; 5508   037A 03EC
        BLT     L_5510                          ; 550A   0205 0004

        ADDR    R7,     R3                      ; 550C   00FB
        ADDI    #$0007, R3                      ; 550D   02FB 0007
        MVI@    R3,     R3                      ; 550F   029B
L_5510:
        PULR    R7                              ; 5510   02B7

        DECLE   $0000,  $00F0,  $01E0,  $0000   ; 5511   0000 00F0 01E0 0000
        DECLE   $0001,  $0005,  $0004           ; 5515   0001 0005 0004

        DIS                                     ; 5518   0003
        EIS                                     ; 5519   0002
L_551A:
        PSHR    R5                              ; 551A   0275

        JSR     R5,     L_58C9                  ; 551B   0004 0158 00C9

        CLRR    R0                              ; 551E   01C0
        MVO     R0,     G_017B                  ; 551F   0240 017B
        MVO     R0,     G_017C                  ; 5521   0240 017C
        MVO     R0,     G_0173                  ; 5523   0240 0173
        NOP                                     ; 5525   0034
        MVO     R0,     G_0177                  ; 5526   0240 0177
        MVO     R0,     G_0178                  ; 5528   0240 0178
        CMP     G_015D, R0                      ; 552A   0340 015D
        BEQ     L_5539                          ; 552C   0204 000B

        JSR     R5,     L_5398                  ; 552E   0004 0150 0398
        JSR     R5,     L_53BB                  ; 5531   0004 0150 03BB
        JSR     R5,     L_572E                  ; 5534   0004 0154 032E

        B       L_556F                          ; 5537   0200 0036

L_5539:
        MVI     G_0329, R1                      ; 5539   0281 0329
        ADD     G_0160, R1                      ; 553B   02C1 0160
        MVO     R1,     G_0329                  ; 553D   0241 0329

L_553F:
        JSR     R5,     L_5570                  ; 553F   0004 0154 0170

        BC      L_556F                          ; 5542   0201 002B

        JSR     R5,     L_5398                  ; 5544   0004 0150 0398

        BC      L_5555                          ; 5547   0201 000C

        JSR     R5,     L_53BB                  ; 5549   0004 0150 03BB
        JSR     R5,     L_55B6                  ; 554C   0004 0154 01B6
        JSR     R5,     L_56CA                  ; 554F   0004 0154 02CA
        JSR     R5,     L_572E                  ; 5552   0004 0154 032E
L_5555:
        JSR     R5,     L_5585                  ; 5555   0004 0154 0185

        MVI     G_017B, R0                      ; 5558   0280 017B
        CMP     G_017A, R0                      ; 555A   0340 017A
        BGE     L_556F                          ; 555C   020D 0011

        INCR    R0                              ; 555E   0008
        MVO     R0,     G_017B                  ; 555F   0240 017B
        MVI     G_0326, R1                      ; 5561   0281 0326
        ADD     G_0343, R1                      ; 5563   02C1 0343
        MVO     R1,     G_0326                  ; 5565   0241 0326
        MVI     G_0327, R1                      ; 5567   0281 0327
        ADD     G_0344, R1                      ; 5569   02C1 0344
        MVO     R1,     G_0327                  ; 556B   0241 0327
        B       L_553F                          ; 556D   0220 002F
L_556F:
        PULR    R7                              ; 556F   02B7

L_5570:
        PSHR    R5                              ; 5570   0275
        MVII    #$0001, R3                      ; 5571   02BB 0001
        MVI     G_0327, R0                      ; 5573   0280 0327
        TSTR    R0                              ; 5575   0080
        BMI     L_5580                          ; 5576   020B 0008

        SDBD                                    ; 5578   0001
        CMPI    #$6600, R0                      ; 5579   0378 0000 0066
        BGE     L_5581                          ; 557C   020D 0003

        CLRC                                    ; 557E   0006
        PULR    R7                              ; 557F   02B7

L_5580:
        INCR    R3                              ; 5580   000B
L_5581:
        MVO     R3,     G_015D                  ; 5581   0243 015D
        SETC                                    ; 5583   0007
        PULR    R7                              ; 5584   02B7

L_5585:
        PSHR    R5                              ; 5585   0275
        MVI     G_0328, R0                      ; 5586   0280 0328
        MVI     G_0329, R1                      ; 5588   0281 0329
        CMP     G_0345, R0                      ; 558A   0340 0345
        BNEQ    L_5592                          ; 558C   020C 0004

        CMP     G_0346, R1                      ; 558E   0341 0346
        BEQ     L_55B5                          ; 5590   0204 0023

L_5592:
        MVO     R0,     G_0345                  ; 5592   0240 0345
        MVO     R1,     G_0346                  ; 5594   0241 0346
        MOVR    R0,     R2                      ; 5596   0082
        BPL     L_559A                          ; 5597   0203 0001

        NEGR    R2                              ; 5599   0022
L_559A:
        MOVR    R1,     R3                      ; 559A   008B
        BPL     L_559E                          ; 559B   0203 0001

        NEGR    R3                              ; 559D   0023
L_559E:
        COMR    R2                              ; 559E   001A
        ANDR    R2,     R3                      ; 559F   0193
        COMR    R2                              ; 55A0   001A
        XORR    R2,     R3                      ; 55A1   01D3
        MVII    #$0001, R2                      ; 55A2   02BA 0001
        SWAP    R3,     1                       ; 55A4   0043
        ANDI    #$00FF, R3                      ; 55A5   03BB 00FF
        B       L_55AD                          ; 55A7   0200 0004

L_55A9:
        SAR     R0,     1                       ; 55A9   0068
        SAR     R1,     1                       ; 55AA   0069
        ADDR    R2,     R2                      ; 55AB   00D2
        SAR     R3,     1                       ; 55AC   006B
L_55AD:
        BNEQ    L_55A9                          ; 55AD   022C 0005

        MVO     R2,     G_017A                  ; 55AF   0242 017A
        MVO     R0,     G_0343                  ; 55B1   0240 0343
        MVO     R1,     G_0344                  ; 55B3   0241 0344
L_55B5:
        PULR    R7                              ; 55B5   02B7

L_55B6:
        PSHR    R5                              ; 55B6   0275
        MVI     G_0175, R3                      ; 55B7   0283 0175
        TSTR    R3                              ; 55B9   009B
        BEQ     L_5652                          ; 55BA   0204 0096

        CMPI    #$001D, R3                      ; 55BC   037B 001D
        BLT     L_55C2                          ; 55BE   0205 0002
        B       L_5652                          ; 55C0   0200 0090

L_55C2:
        CMPI    #$0019, R3                      ; 55C2   037B 0019
        BLT     L_55D7                          ; 55C4   0205 0011

        SDBD                                    ; 55C6   0001
        ADDI    #$56A9, R3                      ; 55C7   02FB 00A9 0056
        MVI@    R3,     R3                      ; 55CA   029B

        JSR     R5,     L_55D6                  ; 55CB   0004 0154 01D6

        MVI     G_0175, R3                      ; 55CE   0283 0175
        SDBD                                    ; 55D0   0001
        ADDI    #$56AD, R3                      ; 55D1   02FB 00AD 0056
        MVI@    R3,     R3                      ; 55D4   029B
        INCR    R7                              ; 55D5   000F

L_55D6:
        PSHR    R5                              ; 55D6   0275
L_55D7:
        DECR    R3                              ; 55D7   0013
        SLL     R3,     2                       ; 55D8   004F
        SDBD                                    ; 55D9   0001
        ADDI    #$5662, R3                      ; 55DA   02FB 0062 0056
        CLRR    R1                              ; 55DD   01C9
        MVI     G_0328, R4                      ; 55DE   0284 0328
        MVI@    R3,     R0                      ; 55E0   0298
        SARC    R0,     1                       ; 55E1   0078
        ADCR    R7                              ; 55E2   002F

        NEGR    R4                              ; 55E3   0024
L_55E4:
        ANDI    #$0003, R0                      ; 55E4   03B8 0003
        ADDR    R0,     R7                      ; 55E6   00C7

        ADDR    R4,     R1                      ; 55E7   00E1
        ADDR    R4,     R1                      ; 55E8   00E1
        ADDR    R4,     R1                      ; 55E9   00E1
        CLRR    R2                              ; 55EA   01D2
        MVI     G_0329, R4                      ; 55EB   0284 0329
        MVI@    R3,     R0                      ; 55ED   0298
        SLR     R0,     2                       ; 55EE   0064
        SLR     R0,     1                       ; 55EF   0060
        SARC    R0,     1                       ; 55F0   0078
        ADCR    R7                              ; 55F1   002F

        NEGR    R4                              ; 55F2   0024
L_55F3:
        ANDI    #$0003, R0                      ; 55F3   03B8 0003
        ADDR    R0,     R7                      ; 55F5   00C7

        ADDR    R4,     R2                      ; 55F6   00E2
        ADDR    R4,     R2                      ; 55F7   00E2
        ADDR    R4,     R2                      ; 55F8   00E2
        MOVR    R3,     R4                      ; 55F9   009C
        MVI@    R4,     R0                      ; 55FA   02A0
        SWAP    R0,     2                       ; 55FB   0044
        BMI     L_5603                          ; 55FC   020B 0005

        CMPR    R1,     R2                      ; 55FE   014A
        BGT     L_5608                          ; 55FF   020E 0007
        B       L_5652                          ; 5601   0200 004F

L_5603:
        CMPR    R1,     R2                      ; 5603   014A
        BLT     L_5608                          ; 5604   0205 0002
        B       L_5652                          ; 5606   0200 004A

L_5608:
        MVI@    R4,     R1                      ; 5608   02A1
        MVI     G_0328, R0                      ; 5609   0280 0328

        JSR     R5,     L_5653                  ; 560B   0004 0154 0253

        PSHR    R2                              ; 560E   0272
        MVI@    R4,     R1                      ; 560F   02A1
        MVI     G_0329, R0                      ; 5610   0280 0329

        JSR     R5,     L_5653                  ; 5612   0004 0154 0253

        ADD@    R6,     R2                      ; 5615   02F2
        PSHR    R2                              ; 5616   0272
        DECR    R4                              ; 5617   0014
        MVI@    R4,     R1                      ; 5618   02A1
        MVI     G_0328, R0                      ; 5619   0280 0328

        JSR     R5,     L_5653                  ; 561B   0004 0154 0253

        PSHR    R2                              ; 561E   0272
        MVI@    R4,     R1                      ; 561F   02A1
        MVI     G_0329, R0                      ; 5620   0280 0329

        JSR     R5,     L_5653                  ; 5622   0004 0154 0253

        ADD@    R6,     R2                      ; 5625   02F2
        PULR    R1                              ; 5626   02B1
        MOVR    R1,     R3                      ; 5627   008B
        BPL     L_562B                          ; 5628   0203 0001

        NEGR    R3                              ; 562A   0023
L_562B:
        MOVR    R2,     R4                      ; 562B   0094
        BPL     L_562F                          ; 562C   0203 0001

        NEGR    R4                              ; 562E   0024
L_562F:
        ADDR    R4,     R3                      ; 562F   00E3
        SWAP    R3,     1                       ; 5630   0043
        INCR    R3                              ; 5631   000B
        MVO     R3,     G_017C                  ; 5632   0243 017C
        MVI     G_0173, R3                      ; 5634   0283 0173
        ADDI    #$0200, R3                      ; 5636   02FB 0200
        MVI@    R3,     R3                      ; 5638   029B
        TSTR    R3                              ; 5639   009B
        BPL     L_5648                          ; 563A   0203 000C

        MOVR    R1,     R3                      ; 563C   008B
        SAR     R1,     1                       ; 563D   0069
        SAR     R3,     2                       ; 563E   006F
        ADDR    R3,     R1                      ; 563F   00D9
        SAR     R3,     1                       ; 5640   006B
        ADDR    R3,     R1                      ; 5641   00D9
        MOVR    R2,     R3                      ; 5642   0093
        SAR     R2,     1                       ; 5643   006A
        SAR     R3,     2                       ; 5644   006F
        ADDR    R3,     R2                      ; 5645   00DA
        SAR     R3,     1                       ; 5646   006B
        ADDR    R3,     R2                      ; 5647   00DA
L_5648:
        MVI     G_0329, R0                      ; 5648   0280 0329
        SUBR    R2,     R0                      ; 564A   0110
        MVO     R0,     G_0329                  ; 564B   0240 0329
        MVI     G_0328, R0                      ; 564D   0280 0328
        SUBR    R1,     R0                      ; 564F   0108
        MVO     R0,     G_0328                  ; 5650   0240 0328
L_5652:
        PULR    R7                              ; 5652   02B7

L_5653:
        PSHR    R5                              ; 5653   0275
        SARC    R1,     1                       ; 5654   0079
        ADCR    R7                              ; 5655   002F

        NEGR    R1                              ; 5656   0021

L_5657:
        JSR     R5,     L_59A6                  ; 5657   0004 0158 01A6

        ANDI    #$00FF, R3                      ; 565A   03BB 00FF
        SWAP    R3,     1                       ; 565C   0043
        SWAP    R2,     1                       ; 565D   0042
        ANDI    #$00FF, R2                      ; 565E   03BA 00FF
        XORR    R3,     R2                      ; 5660   01DA
        PULR    R7                              ; 5661   02B7

        MOVR    R7,     R5                      ; 5662   00BD
        SUB     .STIC.X.1,R7                    ; 5663   0307 0001

        DECLE   $0001,  $00A9,  $02BB,  $00E8   ; 5665   0001 00A9 02BB 00E8
        DECLE   $004F,  $00AB,  $026D,  $0136   ; 5669   004F 00AB 026D 0136
        DECLE   $009B,  $00AD,  $0185,  $0184   ; 566D   009B 00AD 0185 0184
        DECLE   $0185,  $009D,  $009B,  $0136   ; 5671   0185 009D 009B 0136
        DECLE   $026D,  $008D,  $004F,  $00E8   ; 5675   026D 008D 004F 00E8
        DECLE   $02BB,  $00AF,  $0001,  $0001   ; 5679   02BB 00AF 0001 0001
        DECLE   $0307,  $0005,  $004F,  $00E9   ; 567D   0307 0005 004F 00E9
        DECLE   $02BB,  $0015,  $009B,  $0137   ; 5681   02BB 0015 009B 0137
        DECLE   $026D,  $0025,  $0185,  $0185   ; 5685   026D 0025 0185 0185
        DECLE   $0185,  $0023,  $026D,  $0137   ; 5689   0185 0023 026D 0137

        TSTR    R3                              ; 568D   009B
        NEGR    R1                              ; 568E   0021
        MVII    #$00E9, R3                      ; 568F   02BB 00E9
        SLL     R3,     2                       ; 5691   004F
        RSWD    R5                              ; 5692   003D
        SUB     .STIC.X.1,R7                    ; 5693   0307 0001

        DECLE   $0001,  $0029,  $02BB,  $00E8   ; 5695   0001 0029 02BB 00E8
        DECLE   $004F,  $002B,  $026D,  $0136   ; 5699   004F 002B 026D 0136
        DECLE   $009B,  $002D,  $0185,  $0184   ; 569D   009B 002D 0185 0184
        DECLE   $0185,  $001D,  $009B,  $0136   ; 56A1   0185 001D 009B 0136
        DECLE   $026D,  $000D,  $004F,  $00E8   ; 56A5   026D 000D 004F 00E8
        DECLE   $02BB,  $002F,  $0001,  $0001   ; 56A9   02BB 002F 0001 0001
        DECLE   $0307,  $0085,  $004F,  $00E9   ; 56AD   0307 0085 004F 00E9
        DECLE   $02BB,  $0095,  $009B,  $0137   ; 56B1   02BB 0095 009B 0137
        DECLE   $026D,  $00A5,  $0185,  $0185   ; 56B5   026D 00A5 0185 0185
        DECLE   $0185,  $00A3,  $026D,  $0137   ; 56B9   0185 00A3 026D 0137
        DECLE   $009B,  $00A1,  $02BB,  $00E9   ; 56BD   009B 00A1 02BB 00E9
        DECLE   $004F,  $0007,  $0007,  $0013   ; 56C1   004F 0007 0007 0013
        DECLE   $0013,  $0001,  $000D,  $000D   ; 56C5   0013 0001 000D 000D
        DECLE   $0001                           ; 56C9   0001
L_56CA:
        PSHR    R5                              ; 56CA   0275
        MVI     G_017C, R2                      ; 56CB   0282 017C
        TSTR    R2                              ; 56CD   0092
        BEQ     L_56D6                          ; 56CE   0204 0006

        JSR     R5,     L_56EE                  ; 56D0   0004 0154 02EE
        JSR     R5,     L_56D7                  ; 56D3   0004 0154 02D7

L_56D6:
        PULR    R7                              ; 56D6   02B7

L_56D7:
        PSHR    R5                              ; 56D7   0275
        MVI     G_0186, R0                      ; 56D8   0280 0186
        TSTR    R0                              ; 56DA   0080
        BEQ     L_56ED                          ; 56DB   0204 0010

        MVI     G_0175, R0                      ; 56DD   0280 0175
        CMPI    #$000D, R0                      ; 56DF   0378 000D
        BLE     L_56ED                          ; 56E1   0206 000A

        CMPI    #$0019, R0                      ; 56E3   0378 0019
        BGE     L_56ED                          ; 56E5   020D 0006

        MVI     G_0329, R1                      ; 56E7   0281 0329
        SUBI    #$00F0, R1                      ; 56E9   0339 00F0
        MVO     R1,     G_0329                  ; 56EB   0241 0329
L_56ED:
        PULR    R7                              ; 56ED   02B7

L_56EE:
        PSHR    R5                              ; 56EE   0275
        DECR    R2                              ; 56EF   0012
        BEQ     L_5724                          ; 56F0   0204 0032

        MVI     G_0173, R1                      ; 56F2   0281 0173
        ADDI    #$0200, R1                      ; 56F4   02F9 0200
        MVI@    R1,     R1                      ; 56F6   0289
        SLLC    R1,     2                       ; 56F7   005D
        BC      L_5724                          ; 56F8   0201 002A
        BNOV    L_5724                          ; 56FA   020A 0028

        MVI     G_0188, R1                      ; 56FC   0281 0188
        TSTR    R1                              ; 56FE   0089
        BNEQ    L_5724                          ; 56FF   020C 0023

        MVI     G_0175, R1                      ; 5701   0281 0175
        CMPI    #$0019, R1                      ; 5703   0379 0019
        BGE     L_5724                          ; 5705   020D 001D

        DECR    R1                              ; 5707   0011
        BMI     L_5724                          ; 5708   020B 001A

        SLL     R1,     1                       ; 570A   0049
        MVII    #$0003, R2                      ; 570B   02BA 0003

        JSR     R5,     X_DIV                   ; 570D   0004 011C 01FB

        MOVR    R0,     R1                      ; 5710   0081
        MVII    #$002F, R0                      ; 5711   02B8 002F
        NEGR    R0                              ; 5713   0020

        JSR     R5,     .EXEC.629               ; 5714   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 5717   0004 0114 0357

        SLL     R0,     2                       ; 571A   004C
        ADD     G_0328, R0                      ; 571B   02C0 0328
        MVO     R0,     G_0328                  ; 571D   0240 0328
        SLL     R1,     2                       ; 571F   004D
        ADD     G_0329, R1                      ; 5720   02C1 0329
        MVO     R1,     G_0329                  ; 5722   0241 0329
L_5724:
        PULR    R7                              ; 5724   02B7

L_5725:
        PSHR    R5                              ; 5725   0275
        MVII    #$0008, R0                      ; 5726   02B8 0008
        MVII    #$017D, R4                      ; 5728   02BC 017D

        JSR     R5,     X_FILL_ZERO             ; 572A   0004 0114 0338

        PULR    R7                              ; 572D   02B7

L_572E:
        PSHR    R5                              ; 572E   0275
        MVI     G_0181, R0                      ; 572F   0280 0181
        TSTR    R0                              ; 5731   0080
        BEQ     L_57DB                          ; 5732   0204 00A7

        MVI     G_0184, R0                      ; 5734   0280 0184
        TSTR    R0                              ; 5736   0080
        BNEQ    L_57DB                          ; 5737   020C 00A2

        MVI     G_0170, R0                      ; 5739   0280 0170
        CMPI    #$0001, R0                      ; 573B   0378 0001
        BNEQ    L_57AF                          ; 573D   020C 0070

        MVI     G_0179, R0                      ; 573F   0280 0179
        TSTR    R0                              ; 5741   0080
        BEQ     L_57AF                          ; 5742   0204 006B

        MVI     G_0183, R0                      ; 5744   0280 0183
        TSTR    R0                              ; 5746   0080
        BNEQ    L_57DB                          ; 5747   020C 0092

        MVI     G_017F, R0                      ; 5749   0280 017F
        TSTR    R0                              ; 574B   0080
        BEQ     L_579A                          ; 574C   0204 004C

        MVII    #$0012, R2                      ; 574E   02BA 0012
        MVO     R2,     G_0175                  ; 5750   0242 0175

        JSR     R5,     L_55B6                  ; 5752   0004 0154 01B6

        MVI     G_0177, R1                      ; 5755   0281 0177
        INCR    R1                              ; 5757   0009
        ANDI    #$0007, R1                      ; 5758   03B9 0007
        MVI     G_0171, R3                      ; 575A   0283 0171
        ANDI    #$0001, R3                      ; 575C   03BB 0001
        SLL     R3,     2                       ; 575E   004F
        SLL     R3,     1                       ; 575F   004B
        ADDR    R3,     R1                      ; 5760   00D9
        PSHR    R1                              ; 5761   0271
        MOVR    R1,     R4                      ; 5762   008C
        ADDR    R7,     R4                      ; 5763   00FC
        ADDI    #$0129, R4                      ; 5764   02FC 0129
        MVI@    R4,     R1                      ; 5766   02A1
        MVI@    R4,     R2                      ; 5767   02A2
        SLL     R1,     2                       ; 5768   004D
        SLL     R2,     2                       ; 5769   004E
        MVI     G_0326, R0                      ; 576A   0280 0326
        SWAP    R0,     1                       ; 576C   0040
        MVII    #$0007, R3                      ; 576D   02BB 0007

        JSR     R5,     L_58C5                  ; 576F   0004 0158 00C5

        MVI     G_0329, R0                      ; 5772   0280 0329
        SUBR    R1,     R0                      ; 5774   0108
        MVO     R0,     G_0329                  ; 5775   0240 0329
        MVI     G_0178, R2                      ; 5777   0282 0178
        INCR    R2                              ; 5779   000A
        ANDI    #$0007, R2                      ; 577A   03BA 0007
        MVI     G_0171, R3                      ; 577C   0283 0171
        ANDI    #$0002, R3                      ; 577E   03BB 0002
        SLL     R3,     2                       ; 5780   004F
        ADDR    R3,     R2                      ; 5781   00DA
        ADD@    R6,     R2                      ; 5782   02F2
        MOVR    R2,     R4                      ; 5783   0094
        ADDR    R7,     R4                      ; 5784   00FC
        ADDI    #$0118, R4                      ; 5785   02FC 0118
        MVI@    R4,     R1                      ; 5787   02A1
        MVI@    R4,     R2                      ; 5788   02A2
        SLL     R1,     2                       ; 5789   004D
        SLL     R2,     2                       ; 578A   004E
        MVI     G_0327, R0                      ; 578B   0280 0327
        SWAP    R0,     1                       ; 578D   0040
        MVII    #$0007, R3                      ; 578E   02BB 0007

        JSR     R5,     L_58C5                  ; 5790   0004 0158 00C5

        MVI     G_0328, R0                      ; 5793   0280 0328
        ADDR    R1,     R0                      ; 5795   00C8
        MVO     R0,     G_0328                  ; 5796   0240 0328
        B       L_57A9                          ; 5798   0200 000F

L_579A:
        MVII    #$0006, R0                      ; 579A   02B8 0006
        MVO     R0,     G_0175                  ; 579C   0240 0175

        JSR     R5,     L_55B6                  ; 579E   0004 0154 01B6

        MVI     G_0329, R0                      ; 57A1   0280 0329
        SDBD                                    ; 57A3   0001
        ADDI    #$0400, R0                      ; 57A4   02F8 0000 0004
        MVO     R0,     G_0329                  ; 57A7   0240 0329
L_57A9:
        MVII    #$0001, R0                      ; 57A9   02B8 0001
        MVO     R0,     G_0183                  ; 57AB   0240 0183
        B       L_57DB                          ; 57AD   0200 002C

L_57AF:
        MVII    #$0001, R0                      ; 57AF   02B8 0001
        SUB     G_017D, R0                      ; 57B1   0300 017D
        MVO     R0,     G_017D                  ; 57B3   0240 017D
        SLL     R0,     2                       ; 57B5   004C
        SLL     R0,     2                       ; 57B6   004C
        SDBD                                    ; 57B7   0001
        ADDI    #$01C0, R0                      ; 57B8   02F8 00C0 0001
        MVI     G_033E, R1                      ; 57BB   0281 033E
        SDBD                                    ; 57BD   0001
        ANDI    #$F807, R1                      ; 57BE   03B9 0007 00F8
        XORR    R0,     R1                      ; 57C1   01C1
        MVI     G_017D, R0                      ; 57C2   0280 017D
        SLL     R0,     1                       ; 57C4   0048
        DECR    R0                              ; 57C5   0010
        SLL     R0,     2                       ; 57C6   004C
        NEGR    R0                              ; 57C7   0020
        MVI     G_0336, R2                      ; 57C8   0282 0336
        MVI     G_0337, R3                      ; 57CA   0283 0337
        ADDR    R0,     R2                      ; 57CC   00C2
        ADDR    R0,     R3                      ; 57CD   00C3
        MVO     R2,     G_0336                  ; 57CE   0242 0336
        MVO     R3,     G_0337                  ; 57D0   0243 0337
        MVO     R1,     G_033E                  ; 57D2   0241 033E
        MVO     R1,     G_033F                  ; 57D4   0241 033F
        CLRR    R0                              ; 57D6   01C0
        MVO     R0,     G_0181                  ; 57D7   0240 0181
        MVO     R0,     G_0183                  ; 57D9   0240 0183
L_57DB:
        MVI     G_0182, R0                      ; 57DB   0280 0182
        TSTR    R0                              ; 57DD   0080
        BEQ     L_588C                          ; 57DE   0204 00AC

        MVI     G_0183, R0                      ; 57E0   0280 0183
        TSTR    R0                              ; 57E2   0080
        BNEQ    L_588C                          ; 57E3   020C 00A7

        MVI     G_0170, R0                      ; 57E5   0280 0170
        CMPI    #$0002, R0                      ; 57E7   0378 0002
        BNEQ    L_5860                          ; 57E9   020C 0075

        MVI     G_0179, R0                      ; 57EB   0280 0179
        TSTR    R0                              ; 57ED   0080
        BEQ     L_5860                          ; 57EE   0204 0070

        MVI     G_0184, R0                      ; 57F0   0280 0184
        TSTR    R0                              ; 57F2   0080
        BNEQ    L_588C                          ; 57F3   020C 0097

        MVI     G_0180, R0                      ; 57F5   0280 0180
        TSTR    R0                              ; 57F7   0080
        BEQ     L_584B                          ; 57F8   0204 0051

        MVII    #$0014, R2                      ; 57FA   02BA 0014
        MVO     R2,     G_0175                  ; 57FC   0242 0175

        JSR     R5,     L_55B6                  ; 57FE   0004 0154 01B6

        MVI     G_0177, R1                      ; 5801   0281 0177
        INCR    R1                              ; 5803   0009
        ANDI    #$0007, R1                      ; 5804   03B9 0007
        NEGR    R1                              ; 5806   0021
        ADDI    #$0007, R1                      ; 5807   02F9 0007
        MVI     G_0171, R3                      ; 5809   0283 0171
        XORI    #$0001, R3                      ; 580B   03FB 0001
        ANDI    #$0001, R3                      ; 580D   03BB 0001
        SLL     R3,     2                       ; 580F   004F
        SLL     R3,     1                       ; 5810   004B
        ADDR    R3,     R1                      ; 5811   00D9
        PSHR    R1                              ; 5812   0271
        MOVR    R1,     R4                      ; 5813   008C
        ADDR    R7,     R4                      ; 5814   00FC
        ADDI    #$0078, R4                      ; 5815   02FC 0078
        MVI@    R4,     R1                      ; 5817   02A1
        MVI@    R4,     R2                      ; 5818   02A2
        SLL     R1,     2                       ; 5819   004D
        SLL     R2,     2                       ; 581A   004E
        MVI     G_0326, R0                      ; 581B   0280 0326
        SWAP    R0,     1                       ; 581D   0040
        MVII    #$0007, R3                      ; 581E   02BB 0007

        JSR     R5,     L_58C5                  ; 5820   0004 0158 00C5

        MVI     G_0329, R0                      ; 5823   0280 0329
        SUBR    R1,     R0                      ; 5825   0108
        MVO     R0,     G_0329                  ; 5826   0240 0329
        MVI     G_0178, R2                      ; 5828   0282 0178
        INCR    R2                              ; 582A   000A
        ANDI    #$0007, R2                      ; 582B   03BA 0007
        MVI     G_0171, R3                      ; 582D   0283 0171
        ANDI    #$0002, R3                      ; 582F   03BB 0002
        SLL     R3,     2                       ; 5831   004F
        ADDR    R3,     R2                      ; 5832   00DA
        ADD@    R6,     R2                      ; 5833   02F2
        MOVR    R2,     R4                      ; 5834   0094
        ADDR    R7,     R4                      ; 5835   00FC
        ADDI    #$0067, R4                      ; 5836   02FC 0067
        MVI@    R4,     R1                      ; 5838   02A1
        MVI@    R4,     R2                      ; 5839   02A2
        SLL     R1,     2                       ; 583A   004D
        SLL     R2,     2                       ; 583B   004E
        MVI     G_0327, R0                      ; 583C   0280 0327
        SWAP    R0,     1                       ; 583E   0040
        MVII    #$0007, R3                      ; 583F   02BB 0007

        JSR     R5,     L_58C5                  ; 5841   0004 0158 00C5

        MVI     G_0328, R0                      ; 5844   0280 0328
        SUBR    R1,     R0                      ; 5846   0108
        MVO     R0,     G_0328                  ; 5847   0240 0328
        B       L_585A                          ; 5849   0200 000F

L_584B:
        MVII    #$0008, R2                      ; 584B   02BA 0008
        MVO     R2,     G_0175                  ; 584D   0242 0175

        JSR     R5,     L_55B6                  ; 584F   0004 0154 01B6

        MVI     G_0329, R2                      ; 5852   0282 0329
        SDBD                                    ; 5854   0001
        ADDI    #$0400, R2                      ; 5855   02FA 0000 0004
        MVO     R2,     G_0329                  ; 5858   0242 0329
L_585A:
        MVII    #$0001, R0                      ; 585A   02B8 0001
        MVO     R0,     G_0184                  ; 585C   0240 0184
        B       L_588C                          ; 585E   0200 002C

L_5860:
        MVII    #$0001, R0                      ; 5860   02B8 0001
        SUB     G_017E, R0                      ; 5862   0300 017E
        MVO     R0,     G_017E                  ; 5864   0240 017E
        SLL     R0,     2                       ; 5866   004C
        SLL     R0,     2                       ; 5867   004C
        SDBD                                    ; 5868   0001
        ADDI    #$01C0, R0                      ; 5869   02F8 00C0 0001
        MVI     G_0340, R1                      ; 586C   0281 0340
        SDBD                                    ; 586E   0001
        ANDI    #$F807, R1                      ; 586F   03B9 0007 00F8
        XORR    R0,     R1                      ; 5872   01C1
        MVI     G_017E, R0                      ; 5873   0280 017E
        SLL     R0,     1                       ; 5875   0048
        DECR    R0                              ; 5876   0010
        SLL     R0,     2                       ; 5877   004C
        NEGR    R0                              ; 5878   0020
        MVI     G_0338, R2                      ; 5879   0282 0338
        MVI     G_0339, R3                      ; 587B   0283 0339
        ADDR    R0,     R2                      ; 587D   00C2
        ADDR    R0,     R3                      ; 587E   00C3
        MVO     R2,     G_0338                  ; 587F   0242 0338
        MVO     R3,     G_0339                  ; 5881   0243 0339
        MVO     R1,     G_0340                  ; 5883   0241 0340
        MVO     R1,     G_0341                  ; 5885   0241 0341
        CLRR    R0                              ; 5887   01C0
        MVO     R0,     G_0182                  ; 5888   0240 0182
        MVO     R0,     G_0184                  ; 588A   0240 0184
L_588C:
        PULR    R7                              ; 588C   02B7

        DECLE   $0062,  $009C,  $00BA,  $00EC   ; 588D   0062 009C 00BA 00EC
        DECLE   $012D,  $0165,  $017E,  $0196   ; 5891   012D 0165 017E 0196
        DECLE   $01A6,  $018E,  $0155,  $012C   ; 5895   01A6 018E 0155 012C
        DECLE   $0104,  $00B4,  $0062,  $004F   ; 5899   0104 00B4 0062 004F
        DECLE   $0000,  $0002,  $0004           ; 589D   0000 0002 0004

        CLRC                                    ; 58A0   0006
        INCR    R0                              ; 58A1   0008
        INCR    R2                              ; 58A2   000A
        INCR    R7                              ; 58A3   000F

        DECR    R1                              ; 58A4   0011
L_58A5:
        DECR    R3                              ; 58A5   0013
        DECR    R5                              ; 58A6   0015
L_58A7:
        DECR    R7                              ; 58A7   0017

        RLC     R2,     1                       ; 58A8   0052
        SLLC    R2,     1                       ; 58A9   005A
        SAR     R1,     2                       ; 58AA   006D
        SARC    R2,     1                       ; 58AB   007A
        MOVR    R1,     R5                      ; 58AC   008D
        MOVR    R4,     R3                      ; 58AD   00A3
        MOVR    R5,     R3                      ; 58AE   00AB
        ADDR    R1,     R3                      ; 58AF   00CB
        ADDR    R4,     R1                      ; 58B0   00E1
        ADDR    R5,     R3                      ; 58B1   00EB
        ADDR    R6,     R4                      ; 58B2   00F4
        ADDR    R7,     R4                      ; 58B3   00FC
        SUBR    R0,     R4                      ; 58B4   0104
        SUBR    R1,     R4                      ; 58B5   010C
        GSWD    R2                              ; 58B6   0032
        GSWD    R2                              ; 58B7   0032
        GSWD    R2                              ; 58B8   0032
L_58B9:
        GSWD    R2                              ; 58B9   0032
        GSWD    R2                              ; 58BA   0032
        GSWD    R2                              ; 58BB   0032
L_58BC:
        SLLC    R0,     1                       ; 58BC   0058
        BC      L_58C3                          ; 58BD   0201 0004

        ADDR    R1,     R2                      ; 58BF   00CA
        SAR     R2,     1                       ; 58C0   006A
        B       L_58C5                          ; 58C1   0200 0002

L_58C3:
        ADDR    R2,     R1                      ; 58C3   00D1
        SAR     R1,     1                       ; 58C4   0069
L_58C5:
        DECR    R3                              ; 58C5   0013
        BPL     L_58BC                          ; 58C6   0223 000B
        MOVR    R5,     R7                      ; 58C8   00AF

L_58C9:
        PSHR    R5                              ; 58C9   0275
        CLRR    R1                              ; 58CA   01C9
        CLRR    R2                              ; 58CB   01D2
        CMP     G_0188, R1                      ; 58CC   0341 0188
        BNEQ    L_58E5                          ; 58CE   020C 0015

        MVI     G_0169, R3                      ; 58D0   0283 0169
        SLR     R3,     2                       ; 58D2   0067
        SLR     R3,     2                       ; 58D3   0067
        SLR     R3,     1                       ; 58D4   0063
        INCR    R3                              ; 58D5   000B
        ADDR    R7,     R3                      ; 58D6   00FB
        ADD@    R3,     R7                      ; 58D7   02DF

        INCR    R0                              ; 58D8   0008
        INCR    R4                              ; 58D9   000C
        INCR    R0                              ; 58DA   0008
        INCR    R1                              ; 58DB   0009
        INCR    R1                              ; 58DC   0009
        INCR    R5                              ; 58DD   000D
        INCR    R4                              ; 58DE   000C
        INCR    R5                              ; 58DF   000D
        INCR    R2                              ; 58E0   000A
        INCR    R1                              ; 58E1   0009
        B       L_58E5                          ; 58E2   0200 0001

        INCR    R2                              ; 58E4   000A
L_58E5:
        MVO     R1,     G_017F                  ; 58E5   0241 017F
        XOR     G_017D, R1                      ; 58E7   03C1 017D
        MVO     R1,     G_0181                  ; 58E9   0241 0181
        MVO     R2,     G_0180                  ; 58EB   0242 0180
        XOR     G_017E, R2                      ; 58ED   03C2 017E
        MVO     R2,     G_0182                  ; 58EF   0242 0182
        PULR    R7                              ; 58F1   02B7

L_58F2:
        PSHR    R5                              ; 58F2   0275
        MVI     G_0169, R3                      ; 58F3   0283 0169
        ANDI    #$00E4, R3                      ; 58F5   03BB 00E4
        CMPI    #$00E0, R3                      ; 58F7   037B 00E0
        BNEQ    L_591E                          ; 58F9   020C 0023

        MVI     G_0186, R0                      ; 58FB   0280 0186
        TSTR    R0                              ; 58FD   0080
        BNEQ    L_591E                          ; 58FE   020C 001E

        MVII    #$0005, R0                      ; 5900   02B8 0005
        MVO     R0,     G_0186                  ; 5902   0240 0186
        MVI     G_0188, R0                      ; 5904   0280 0188
        TSTR    R0                              ; 5906   0080
        BNEQ    L_591E                          ; 5907   020C 0015

        MVI     G_0187, R0                      ; 5909   0280 0187
        ADDI    #$0023, R0                      ; 590B   02F8 0023
        CMPI    #$00FF, R0                      ; 590D   0378 00FF
        BLE     L_591C                          ; 590F   0206 000B

        MVII    #$0001, R0                      ; 5911   02B8 0001
        MVO     R0,     G_0188                  ; 5913   0240 0188

        JSR     R5,     X_PLAY_RAZZ2            ; 5915   0004 011C 02BD

        MVII    #$000C, R0                      ; 5918   02B8 000C
        MVO     R0,     G_0106                  ; 591A   0240 0106
L_591C:
        MVO     R0,     G_0187                  ; 591C   0240 0187
L_591E:
        MVI     G_0186, R0                      ; 591E   0280 0186
        DECLE   $0081,  $00F9,  $02F9,  $002A   ; 5920   0081 00F9 02F9 002A
        DECLE   $0289,  $0341,  $0185,  $0204   ; 5924   0289 0341 0185 0204
        DECLE   $0015                           ; 5928   0015

        MVI     G_015D, R2                      ; 5929   0282 015D
        TSTR    R2                              ; 592B   0092
        BNEQ    L_593D                          ; 592C   020C 000F

        MVI     G_0175, R2                      ; 592E   0282 0175
        TSTR    R2                              ; 5930   0092
        BNEQ    L_593D                          ; 5931   020C 000A

        MVII    #$0100, R2                      ; 5933   02BA 0100
        TSTR    R1                              ; 5935   0089
        BEQ     L_5939                          ; 5936   0204 0001

        NEGR    R2                              ; 5938   0022
L_5939:
        ADD     G_0327, R2                      ; 5939   02C2 0327
        MVO     R2,     G_0327                  ; 593B   0242 0327
L_593D:
        MVO     R1,     G_0185                  ; 593D   0241 0185
        DECR    R0                              ; 593F   0010
        BMI     L_5944                          ; 5940   020B 0002

        MVO     R0,     G_0186                  ; 5942   0240 0186
L_5944:
        MVI     G_0187, R0                      ; 5944   0280 0187
        DECR    R0                              ; 5946   0010
        BMI     L_594B                          ; 5947   020B 0002

        MVO     R0,     G_0187                  ; 5949   0240 0187
L_594B:
        PULR    R7                              ; 594B   02B7

        DECLE   $0001,  $0001,  $0000,  $0000   ; 594C   0001 0001 0000 0000
        DECLE   $0000,  $0001                   ; 5950   0000 0001
L_5952:
        PSHR    R5                              ; 5952   0275
        CLRR    R0                              ; 5953   01C0
        MVO     R0,     G_0164                  ; 5954   0240 0164
        MVO     R0,     G_016F                  ; 5956   0240 016F
        PULR    R7                              ; 5958   02B7

L_5959:
        PSHR    R5                              ; 5959   0275
        MVI     G_01B4, R0                      ; 595A   0280 01B4
        TSTR    R0                              ; 595C   0080
        BNEQ    L_597B                          ; 595D   020C 001C

        MVI     G_0169, R3                      ; 595F   0283 0169
        CMPI    #$00FF, R3                      ; 5961   037B 00FF
        BNEQ    L_5969                          ; 5963   020C 0004

        JSR     R5,     L_597C                  ; 5965   0004 0158 017C

        PULR    R7                              ; 5968   02B7

L_5969:
        ANDI    #$00E1, R3                      ; 5969   03BB 00E1
        CMPI    #$00E0, R3                      ; 596B   037B 00E0
        BNEQ    L_597B                          ; 596D   020C 000C

        MVI     G_0164, R0                      ; 596F   0280 0164
        INCR    R0                              ; 5971   0008
        CMPI    #$0038, R0                      ; 5972   0378 0038
        BGT     L_5978                          ; 5974   020E 0002

        MVO     R0,     G_0164                  ; 5976   0240 0164

L_5978:
        JSR     R5,     L_DFA5                  ; 5978   0004 01DC 03A5

L_597B:
        PULR    R7                              ; 597B   02B7

L_597C:
        PSHR    R5                              ; 597C   0275
        MVI     G_0164, R0                      ; 597D   0280 0164
        TSTR    R0                              ; 597F   0080
        BEQ     L_59A5                          ; 5980   0204 0023

        MVI     G_0326, R1                      ; 5982   0281 0326
        SWAP    R1,     1                       ; 5984   0041
        ANDI    #$00FF, R1                      ; 5985   03B9 00FF
        CMPI    #$00A0, R1                      ; 5987   0379 00A0
        BLT     L_59A2                          ; 5989   0205 0017

        MVI     G_0327, R1                      ; 598B   0281 0327
        SWAP    R1,     1                       ; 598D   0041
        ANDI    #$00FF, R1                      ; 598E   03B9 00FF
        CMPI    #$0056, R1                      ; 5990   0379 0056
        BLT     L_59A2                          ; 5992   0205 000E

        SLL     R0,     2                       ; 5994   004C
        MOVR    R0,     R1                      ; 5995   0081
        SLL     R0,     2                       ; 5996   004C
        SLL     R0,     2                       ; 5997   004C
        SUBR    R1,     R0                      ; 5998   0108
        SUBR    R1,     R0                      ; 5999   0108
        MVI     G_0329, R1                      ; 599A   0281 0329
        SUBR    R0,     R1                      ; 599C   0101
        MVO     R1,     G_0329                  ; 599D   0241 0329

        JSR     R5,     L_DEF4                  ; 599F   0004 01DC 02F4

L_59A2:
        CLRR    R0                              ; 59A2   01C0
        MVO     R0,     G_0164                  ; 59A3   0240 0164
L_59A5:
        PULR    R7                              ; 59A5   02B7

L_59A6:
        PSHR    R4                              ; 59A6   0274
        CLRR    R3                              ; 59A7   01DB
        CLRR    R2                              ; 59A8   01D2
        CLRR    R4                              ; 59A9   01E4
        TSTR    R0                              ; 59AA   0080
        BPL     L_59B0                          ; 59AB   0203 0003

        NEGR    R0                              ; 59AD   0020
        ADDI    #$0001, R3                      ; 59AE   02FB 0001
L_59B0:
        TSTR    R1                              ; 59B0   0089
        BPL     L_59B6                          ; 59B1   0203 0003

        NEGR    R1                              ; 59B3   0021
        ADDI    #$0001, R3                      ; 59B4   02FB 0001
L_59B6:
        PSHR    R3                              ; 59B6   0273
        CLRR    R3                              ; 59B7   01DB
        B       L_59BF                          ; 59B8   0200 0005

L_59BA:
        ADDR    R0,     R2                      ; 59BA   00C2
        ADCR    R4                              ; 59BB   002C
        ADDR    R3,     R4                      ; 59BC   00DC
L_59BD:
        SLLC    R0,     1                       ; 59BD   0058
        RLC     R3,     1                       ; 59BE   0053
L_59BF:
        SARC    R1,     1                       ; 59BF   0079
        BC      L_59BA                          ; 59C0   0221 0007
        BNEQ    L_59BD                          ; 59C2   022C 0006

        MOVR    R4,     R3                      ; 59C4   00A3
        PULR    R0                              ; 59C5   02B0
        SARC    R0,     1                       ; 59C6   0078
        BNC     L_59CE                          ; 59C7   0209 0005

        COMR    R3                              ; 59C9   001B
        COMR    R2                              ; 59CA   001A
        ADDI    #$0001, R2                      ; 59CB   02FA 0001
        ADCR    R3                              ; 59CD   002B
L_59CE:
        PULR    R4                              ; 59CE   02B4
        MOVR    R5,     R7                      ; 59CF   00AF

        DECLE   $0001,  $0001,  $0001,  $000E   ; 59D0   0001 0001 0001 000E
        DECLE   $001A,  $0024,  $0029,  $002A   ; 59D4   001A 0024 0029 002A
        DECLE   $002A,  $002A,  $002A,  $002A   ; 59D8   002A 002A 002A 002A
        DECLE   $002A,  $002F,  $0037,  $002A   ; 59DC   002A 002F 0037 002A
        DECLE   $0042,  $0046,  $0001,  $0001   ; 59E0   0042 0046 0001 0001
        DECLE   $0001,  $0001,  $004F,  $0058   ; 59E4   0001 0001 004F 0058
        DECLE   $0063,  $0068,  $0070,  $0075   ; 59E8   0063 0068 0070 0075
        DECLE   $007C,  $0000,  $007E,  $0086   ; 59EC   007C 0000 007E 0086
        DECLE   $008A,  $008C,  $0092,  $009D   ; 59F0   008A 008C 0092 009D
        DECLE   $00A1,  $00AC,  $00B1,  $0001   ; 59F4   00A1 00AC 00B1 0001
        DECLE   $0001,  $0001,  $00B8,  $00BF   ; 59F8   0001 0001 00B8 00BF
        DECLE   $0001,  $0001,  $00C2,  $0000   ; 59FC   0001 0001 00C2 0000
        DECLE   $0000,  $00CB,  $00D0,  $0000   ; 5A00   0000 00CB 00D0 0000
        DECLE   $0000,  $00D4,  $0001,  $0001   ; 5A04   0000 00D4 0001 0001

        ADDR    R3,     R3                      ; 5A08   00DB
        ADDR    R3,     R7                      ; 5A09   00DF

        ADDR    R4,     R5                      ; 5A0A   00E5
        ADDR    R4,     R7                      ; 5A0B   00E7

        DECLE   $0001,  $0001,  $00EF,  $00F1   ; 5A0C   0001 0001 00EF 00F1
        DECLE   $00F2,  $00F6,  $00F9,  $0000   ; 5A10   00F2 00F6 00F9 0000
        DECLE   $0100,  $0000,  $0000,  $0100   ; 5A14   0100 0000 0000 0100
        DECLE   $0000                           ; 5A18   0000

        SUBR    R0,     R3                      ; 5A19   0103
        SUBR    R0,     R7                      ; 5A1A   0107

        DECLE   $0109,  $00F9,  $010E,  $0111   ; 5A1B   0109 00F9 010E 0111
        DECLE   $0116,  $0001,  $0001,  $0118   ; 5A1F   0116 0001 0001 0118
        DECLE   $011C,  $0103,  $00F9,  $0000   ; 5A23   011C 0103 00F9 0000
        DECLE   $0122,  $0001,  $0128,  $0122   ; 5A27   0122 0001 0128 0122
        DECLE   $0003,  $012D,  $0000,  $0103   ; 5A2B   0003 012D 0000 0103
        DECLE   $00F9,  $0000,  $012F,  $0001   ; 5A2F   00F9 0000 012F 0001
        DECLE   $0132,  $0001,  $0136,  $0138   ; 5A33   0132 0001 0136 0138
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A37   0000 0000 0000 0000
        DECLE   $0000,  $0142,  $0000,  $0000   ; 5A3B   0000 0142 0000 0000
        DECLE   $014B,  $014C,  $0000,  $0000   ; 5A3F   014B 014C 0000 0000
        DECLE   $0000,  $0000                   ; 5A43   0000 0000

        CMPR    R2,     R0                      ; 5A45   0150
        SUBR    R5,     R7                      ; 5A46   012F

        DECLE   $0151,  $0001,  $0158,  $015B   ; 5A47   0151 0001 0158 015B
        DECLE   $03E8,  $03E9,  $0000,  $0000   ; 5A4B   03E8 03E9 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A4F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A53   0000 0000 0000 0000
        DECLE   $03EC,  $03ED,  $0160,  $0167   ; 5A57   03EC 03ED 0160 0167
        DECLE   $0151,  $0001,  $016A,  $0170   ; 5A5B   0151 0001 016A 0170
        DECLE   $03EA,  $03EB,  $0000,  $0000   ; 5A5F   03EA 03EB 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A63   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A67   0000 0000 0000 0000
        DECLE   $03EE,  $03EF,  $0173,  $0174   ; 5A6B   03EE 03EF 0173 0174
        DECLE   $0151,  $0001,  $017B,  $017D   ; 5A6F   0151 0001 017B 017D
        DECLE   $0000,  $0183,  $0185,  $0187   ; 5A73   0000 0183 0185 0187
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A77   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $018A,  $018E   ; 5A7B   0000 0000 018A 018E
        DECLE   $0194,  $0000,  $0199,  $01A0   ; 5A7F   0194 0000 0199 01A0
        DECLE   $0151,  $0001,  $0001,  $01A2   ; 5A83   0151 0001 0001 01A2
        DECLE   $01A5,  $018E,  $00B1,  $0185   ; 5A87   01A5 018E 00B1 0185
        DECLE   $0187,  $0000,  $0000,  $0000   ; 5A8B   0187 0000 0000 0000
        DECLE   $0000,  $018A,  $018E,  $01AA   ; 5A8F   0000 018A 018E 01AA
        DECLE   $0185,  $01AE,  $01B0,  $0001   ; 5A93   0185 01AE 01B0 0001
        DECLE   $0151,  $0001,  $0001,  $0001   ; 5A97   0151 0001 0001 0001
        DECLE   $0001,  $01B5,  $01B7,  $01BA   ; 5A9B   0001 01B5 01B7 01BA
        DECLE   $01C1,  $03E8,  $03E9,  $03EC   ; 5A9F   01C1 03E8 03E9 03EC
        DECLE   $03ED,  $01C8,  $01CE,  $01D2   ; 5AA3   03ED 01C8 01CE 01D2
        DECLE   $01D7,  $0001,  $0001,  $0001   ; 5AA7   01D7 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 5AAB   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0000   ; 5AAF   0001 0001 0001 0000
        DECLE   $0000,  $03EA,  $03EB,  $03EE   ; 5AB3   0000 03EA 03EB 03EE
        DECLE   $03EF,  $0000,  $0000,  $0001   ; 5AB7   03EF 0000 0000 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 5ABB   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 5ABF   0001 0001 0001 0001
        DECLE   $01DA,  $002A,  $002A,  $01E2   ; 5AC3   01DA 002A 002A 01E2
        DECLE   $01EA,  $01ED,  $0169,  $01F1   ; 5AC7   01EA 01ED 0169 01F1
        DECLE   $01FA,  $0201,  $002A,  $002A   ; 5ACB   01FA 0201 002A 002A
        DECLE   $0204,  $020A,  $0001,  $0001   ; 5ACF   0204 020A 0001 0001
        DECLE   $0151,  $0001,  $0001,  $020E   ; 5AD3   0151 0001 0001 020E
        DECLE   $0000,  $0213,  $0218,  $0000   ; 5AD7   0000 0213 0218 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ADB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0220,  $0224   ; 5ADF   0000 0000 0220 0224

        BNOV    L_58B9                          ; 5AE3   022A 022B
        ADDR    R4,     R7                      ; 5AE5   00E7

        DECLE   $0001,  $0151,  $0001           ; 5AE6   0001 0151 0001

        BGT     L_5AEB                          ; 5AE9   020E 0000

L_5AEB:
        NEGR    R2                              ; 5AEB   0022
        DECLE   $0001,  $022E,  $0000,  $0231   ; 5AEC   0001 022E 0000 0231
        DECLE   $0000,  $0231,  $0000,  $0231   ; 5AF0   0000 0231 0000 0231
        DECLE   $0000,  $0233,  $0001,  $0001   ; 5AF4   0000 0233 0001 0001
        DECLE   $0234,  $0237,  $0001,  $0151   ; 5AF8   0234 0237 0001 0151
        DECLE   $023B,  $0000,  $0000,  $0000   ; 5AFC   023B 0000 0000 0000
        DECLE   $023F,  $0000,  $0000,  $0000   ; 5B00   023F 0000 0000 0000
        DECLE   $0000,  $0100,  $0000,  $0000   ; 5B04   0000 0100 0000 0000
        DECLE   $0000,  $0000,  $00B1,  $0001   ; 5B08   0000 0000 00B1 0001
        DECLE   $0012,  $0244,  $0248,  $0151   ; 5B0C   0012 0244 0248 0151
        DECLE   $024E,  $0187,  $0000,  $0000   ; 5B10   024E 0187 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0100   ; 5B14   0000 0000 0000 0100
        DECLE   $0122,  $0001,  $0128,  $0100   ; 5B18   0122 0001 0128 0100
        DECLE   $0000,  $0000,  $0000,  $0254   ; 5B1C   0000 0000 0000 0254
        DECLE   $0259,  $0260,  $0263,  $0151   ; 5B20   0259 0260 0263 0151
        DECLE   $0001,  $0185,  $0187,  $0000   ; 5B24   0001 0185 0187 0000
        DECLE   $0000,  $0000,  $0122,  $0001   ; 5B28   0000 0000 0122 0001
        DECLE   $0128,  $0142,  $0122,  $0001   ; 5B2C   0128 0142 0122 0001
        DECLE   $0128,  $0000,  $0000,  $0000   ; 5B30   0128 0000 0000 0000
        DECLE   $0000,  $0264,  $0265,  $0151   ; 5B34   0000 0264 0265 0151
        DECLE   $0001,  $0001,  $0266,  $03E8   ; 5B38   0001 0001 0266 03E8
        DECLE   $03E9,  $0000,  $0000,  $0142   ; 5B3C   03E9 0000 0000 0142
        DECLE   $0000,  $0000,  $0000,  $0142   ; 5B40   0000 0000 0000 0142
        DECLE   $0000,  $0000,  $0000,  $018A   ; 5B44   0000 0000 0000 018A
        DECLE   $0187,  $0267,  $0001,  $0151   ; 5B48   0187 0267 0001 0151
        DECLE   $0001,  $0001,  $026A,  $03EA   ; 5B4C   0001 0001 026A 03EA
        DECLE   $03EB,  $0187,  $0000,  $0000   ; 5B50   03EB 0187 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $018A,  $018E   ; 5B58   0000 0000 018A 018E
        DECLE   $0185,  $026E,  $0001,  $0151   ; 5B5C   0185 026E 0001 0151
        DECLE   $0001,  $0001,  $0270,  $018A   ; 5B60   0001 0001 0270 018A
        DECLE   $018E,  $0185,  $0187,  $0000   ; 5B64   018E 0185 0187 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B68   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0277,  $027E   ; 5B6C   0000 0000 0277 027E
        DECLE   $0282,  $0289,  $0001,  $0151   ; 5B70   0282 0289 0001 0151
        DECLE   $0001,  $0001,  $01A2,  $028B   ; 5B74   0001 0001 01A2 028B
        DECLE   $0292,  $0294,  $0185,  $0187   ; 5B78   0292 0294 0185 0187
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B7C   0000 0000 0000 0000

        XOR@    R5,     R4                      ; 5B80   03EC
        XOR@    R5,     R5                      ; 5B81   03ED
        MVI@    R2,     R7                      ; 5B82   0297

        DECLE   $029D,  $02A1,  $0001,  $0001   ; 5B83   029D 02A1 0001 0001
        DECLE   $0151,  $0001,  $0001,  $0001   ; 5B87   0151 0001 0001 0001
        DECLE   $0001,  $02A3,  $02A6,  $02A8   ; 5B8B   0001 02A3 02A6 02A8
        DECLE   $02AC,  $03E8,  $03E9,  $03EC   ; 5B8F   02AC 03E8 03E9 03EC
        DECLE   $03ED,  $03EE,  $03EF,  $0001   ; 5B93   03ED 03EE 03EF 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 5B97   0001 0001 0001 0001
        DECLE   $0151,  $0001,  $0001,  $0001   ; 5B9B   0151 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0000   ; 5B9F   0001 0001 0001 0000
        DECLE   $02AF,  $03EA,  $03EB,  $03EE   ; 5BA3   02AF 03EA 03EB 03EE
        DECLE   $03EF,  $0119,  $0000,  $0001   ; 5BA7   03EF 0119 0000 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 5BAB   0001 0001 0001 0001
        DECLE   $0151,  $0001,  $0001,  $0001   ; 5BAF   0151 0001 0001 0001
        DECLE   $02B4,  $02B9,  $02BB,  $01F1   ; 5BB3   02B4 02B9 02BB 01F1
        DECLE   $01ED,  $0169,  $0169,  $0169   ; 5BB7   01ED 0169 0169 0169
        DECLE   $0169,  $01F1,  $01ED,  $02BF   ; 5BBB   0169 01F1 01ED 02BF
        DECLE   $02C7,  $02CA,  $0001,  $0001   ; 5BBF   02C7 02CA 0001 0001
        DECLE   $0151,  $0001,  $0001,  $02CD   ; 5BC3   0151 0001 0001 02CD
        DECLE   $014C,  $0000,  $0000,  $0000   ; 5BC7   014C 0000 0000 0000
        DECLE   $0000,  $0000,  $018A,  $0187   ; 5BCB   0000 0000 018A 0187
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BCF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $02D3,  $02D5   ; 5BD3   0000 0000 02D3 02D5
        DECLE   $0151,  $0001                   ; 5BD7   0151 0001

        SDBD                                    ; 5BD9   0001
        ADD@    R2,     R7                      ; 5BDA   02D7

        DECLE   $0000,  $02D9,  $0000           ; 5BDB   0000 02D9 0000

        ADD@    R3,     R1                      ; 5BDE   02D9
        ADD@    R3,     R2                      ; 5BDF   02DA
        ADD@    R3,     R4                      ; 5BE0   02DC
        ADD@    R3,     R7                      ; 5BE1   02DF

        DECLE   $02E2,  $02DC,  $02E3,  $02D9   ; 5BE2   02E2 02DC 02E3 02D9
        DECLE   $0000,  $02E5,  $0000,  $02F0   ; 5BE6   0000 02E5 0000 02F0
        DECLE   $02F4,  $0151,  $0001,  $0001   ; 5BEA   02F4 0151 0001 0001
        DECLE   $02F5,  $0000,  $0000,  $0000   ; 5BEE   02F5 0000 0000 0000
        DECLE   $0000                           ; 5BF2   0000

        ADD@    R6,     R6                      ; 5BF3   02F6
        ADD@    R6,     R7                      ; 5BF4   02F7

        DECLE   $0169,  $0169,  $02F8,  $00F9   ; 5BF5   0169 0169 02F8 00F9
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BF9   0000 0000 0000 0000
        DECLE   $02F9,  $02FC,  $0151,  $0001   ; 5BFD   02F9 02FC 0151 0001
        DECLE   $0012,  $0000,  $0000,  $0022   ; 5C01   0012 0000 0000 0022
        DECLE   $02FD,  $016A,  $0000,  $0000   ; 5C05   02FD 016A 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C09   0000 0000 0000 0000
        DECLE   $0022,  $02FD,  $016A,  $0000   ; 5C0D   0022 02FD 016A 0000
        DECLE   $0000,  $0020,  $0151,  $0001   ; 5C11   0000 0020 0151 0001
        DECLE   $0012,  $0000,  $0000,  $0000   ; 5C15   0012 0000 0000 0000
        DECLE   $0000,  $0022,  $02FD,  $016A   ; 5C19   0000 0022 02FD 016A
        DECLE   $0000,  $0000,  $0022,  $02FD   ; 5C1D   0000 0000 0022 02FD
        DECLE   $016A,  $0000,  $0000,  $0000   ; 5C21   016A 0000 0000 0000
        DECLE   $0000,  $0020,  $0151,  $0001   ; 5C25   0000 0020 0151 0001
        DECLE   $0012,  $0000,  $0000,  $0000   ; 5C29   0012 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C35   0000 0000 0000 0000
        DECLE   $0000,  $0020,  $0151,  $0001   ; 5C39   0000 0020 0151 0001

        ADDR    R7,     R1                      ; 5C3D   00F9
        SUB     G_018A, R7                      ; 5C3E   0307 018A

        DECLE   $0187,  $0000,  $0000,  $0000   ; 5C40   0187 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0309   ; 5C48   0000 0000 0000 0309
        DECLE   $0000,  $030C,  $02F6,  $0151   ; 5C4C   0000 030C 02F6 0151
        DECLE   $0001,  $030D,  $0315,  $031A   ; 5C50   0001 030D 0315 031A
        DECLE   $0323,  $032A,  $03E8,  $03E9   ; 5C54   0323 032A 03E8 03E9
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C58   0000 0000 0000 0000

        XOR@    R5,     R4                      ; 5C5C   03EC
        XOR@    R5,     R5                      ; 5C5D   03ED
        SUB@    R5,     R7                      ; 5C5E   032F

        SUB@    R6,     R5                      ; 5C5F   0335
        SUB@    R6,     R7                      ; 5C60   0337

        DECLE   $033E,  $033F,  $0151,  $0001   ; 5C61   033E 033F 0151 0001
        DECLE   $0001,  $0347,  $034C,  $034F   ; 5C65   0001 0347 034C 034F
        DECLE   $031A,  $03EA,  $03EB,  $0000   ; 5C69   031A 03EA 03EB 0000
        DECLE   $0000,  $0000,  $0000,  $03EE   ; 5C6D   0000 0000 0000 03EE
        DECLE   $03EF,  $0351,  $0353,  $0355   ; 5C71   03EF 0351 0353 0355
        DECLE   $0356,  $0001,  $0151,  $0001   ; 5C75   0356 0001 0151 0001
        DECLE   $0001,  $0001                   ; 5C79   0001 0001

        SDBD                                    ; 5C7B   0001
        CMP@    R2,     R7                      ; 5C7C   0357
        CMP@    R3,     R2                      ; 5C7D   035A
        CMP@    R3,     R3                      ; 5C7E   035B
        CMP@    R4,     R1                      ; 5C7F   0361
        XOR@    R5,     R0                      ; 5C80   03E8
        XOR@    R5,     R1                      ; 5C81   03E9
        XOR@    R5,     R4                      ; 5C82   03EC
        XOR@    R5,     R5                      ; 5C83   03ED
        SUB@    R5,     R7                      ; 5C84   032F

        DECLE   $0363,  $0365,  $01B0,  $0001   ; 5C85   0363 0365 01B0 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 5C89   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 5C8D   0001 0001 0001 0001
        DECLE   $0001,  $0000,  $0367,  $03EA   ; 5C91   0001 0000 0367 03EA
        DECLE   $03EB,  $03EE,  $03EF,  $0369   ; 5C95   03EB 03EE 03EF 0369
        DECLE   $0000,  $0001,  $0001,  $0001   ; 5C99   0000 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0377   ; 5C9D   0001 0001 0001 0377
        DECLE   $0383,  $038B,  $039A,  $03A1   ; 5CA1   0383 038B 039A 03A1
        DECLE   $03AE,  $03BA,  $03C2,  $0000   ; 5CA5   03AE 03BA 03C2 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CAD   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0001,  $0002   ; 5CB1   0000 0001 0001 0002
        DECLE   $0002,  $0003,  $0003,  $0004   ; 5CB5   0002 0003 0003 0004
        DECLE   $0004,  $0005,  $0005,  $0006   ; 5CB9   0004 0005 0005 0006
        DECLE   $0006,  $0005,  $0000,  $0005   ; 5CBD   0006 0005 0000 0005
        DECLE   $0007,  $0001,  $0008,  $0007   ; 5CC1   0007 0001 0008 0007
        DECLE   $0007,  $0001,  $000A,  $0009   ; 5CC5   0007 0001 000A 0009
        DECLE   $000B,  $0001,  $000C,  $0005   ; 5CC9   000B 0001 000C 0005
        DECLE   $000D,  $0008,  $0000           ; 5CCD   000D 0008 0000

        SETC                                    ; 5CD0   0007
        INCR    R7                              ; 5CD1   000F

        DECLE   $0001                           ; 5CD2   0001
L_5CD3:
        DECR    R0                              ; 5CD3   0010
        DECLE   $0001,  $0000,  $0001,  $0012   ; 5CD4   0001 0000 0001 0012
        DECLE   $0001,  $0013,  $0001,  $0014   ; 5CD8   0001 0013 0001 0014
        DECLE   $0007,  $0012,  $0016,  $0000   ; 5CDC   0007 0012 0016 0000
L_5CE0:
        DECR    R7                              ; 5CE0   0017

        DECLE   $0000,  $0015,  $0018,  $0011   ; 5CE1   0000 0015 0018 0011
        DECLE   $0019,  $0012,  $0012,  $0001   ; 5CE5   0019 0012 0012 0001
        DECLE   $001B,  $0012,  $0001,  $0001   ; 5CE9   001B 0012 0001 0001
        DECLE   $001D,  $001C,  $001E,  $0000   ; 5CED   001D 001C 001E 0000
        DECLE   $0001,  $0020,  $0020,  $0000   ; 5CF1   0001 0020 0020 0000
        DECLE   $0021,  $001F,  $0022,  $0023   ; 5CF5   0021 001F 0022 0023
        DECLE   $0001,  $001C,  $001C,  $0022   ; 5CF9   0001 001C 001C 0022
        DECLE   $0000,  $0025,  $0026,  $0025   ; 5CFD   0000 0025 0026 0025
        DECLE   $0000,  $0027,  $0028,  $0028   ; 5D01   0000 0027 0028 0028
        DECLE   $0028,  $0000,  $0020,  $0000   ; 5D05   0028 0000 0020 0000
        DECLE   $002B,  $002C,  $0022,  $0025   ; 5D09   002B 002C 0022 0025
        DECLE   $002D,  $0028,  $002E,  $0022   ; 5D0D   002D 0028 002E 0022
        DECLE   $0022,  $0025,  $0030,  $0000   ; 5D11   0022 0025 0030 0000
        DECLE   $0002,  $0032,  $0000,  $0000   ; 5D15   0002 0032 0000 0000
        DECLE   $0033,  $0034,  $0000,  $0025   ; 5D19   0033 0034 0000 0025
        DECLE   $0035,  $0031,  $0036,  $0002   ; 5D1D   0035 0031 0036 0002
        DECLE   $0000,  $0012,  $0038,  $0001   ; 5D21   0000 0012 0038 0001
        DECLE   $0039,  $001C,  $003A,  $003B   ; 5D25   0039 001C 003A 003B
        DECLE   $0000,  $0003,  $0000,  $003D   ; 5D29   0000 0003 0000 003D
        DECLE   $003D,  $003E,  $0000,  $0000   ; 5D2D   003D 003E 0000 0000
        DECLE   $003F,  $0003,  $0040,  $003C   ; 5D31   003F 0003 0040 003C
        DECLE   $0041,  $0001,  $003E,  $003D   ; 5D35   0041 0001 003E 003D
        DECLE   $0043,  $0001,  $0044,  $0045   ; 5D39   0043 0001 0044 0045
        DECLE   $0003,  $0003,  $003D,  $0001   ; 5D3D   0003 0003 003D 0001
        DECLE   $0047,  $0001,  $0048,  $0003   ; 5D41   0047 0001 0048 0003
        DECLE   $0047,  $003D,  $0000,  $004B   ; 5D45   0047 003D 0000 004B
        DECLE   $0000,  $004A,  $004C,  $0049   ; 5D49   0000 004A 004C 0049
        DECLE   $004D,  $0001,  $004E,  $0004   ; 5D4D   004D 0001 004E 0004
        DECLE   $0000,  $0012,  $0050,  $0051   ; 5D51   0000 0012 0050 0051
        DECLE   $0000,  $0052,  $0000,  $0053   ; 5D55   0000 0052 0000 0053
        DECLE   $0000,  $002B,  $0032,  $0000   ; 5D59   0000 002B 0032 0000
        DECLE   $0055,  $0000,  $0056,  $0054   ; 5D5D   0055 0000 0056 0054
        DECLE   $0057,  $0000,  $0005,  $0059   ; 5D61   0057 0000 0005 0059
        DECLE   $0059,  $0000,  $005A,  $002C   ; 5D65   0059 0000 005A 002C
        DECLE   $005B,  $005C,  $0001,  $0000   ; 5D69   005B 005C 0001 0000
        DECLE   $0004,  $0000,  $005E,  $005F   ; 5D6D   0004 0000 005E 005F
        DECLE   $0005,  $0059,  $0060,  $0061   ; 5D71   0005 0059 0060 0061
        DECLE   $0001                           ; 5D75   0001

        SLLC    R1,     2                       ; 5D76   005D
        SLR     R2,     1                       ; 5D77   0062
        SLLC    R2,     2                       ; 5D78   005E

        JSR     R4,     L_6401                  ; 5D79   0004 0064 0001
        DECLE   $0065,  $0001,  $0066,  $0001   ; 5D7C   0065 0001 0066 0001
        DECLE   $0067,  $0001,  $0001,  $0020   ; 5D80   0067 0001 0001 0020
        DECLE   $0069,  $0001,  $0001,  $006A   ; 5D84   0069 0001 0001 006A
        DECLE   $006B,  $0001,  $0000,  $0069   ; 5D88   006B 0001 0000 0069
        DECLE   $006D,  $0000,  $006E,  $006B   ; 5D8C   006D 0000 006E 006B
        DECLE   $006C,  $006F,  $0000,  $0012   ; 5D90   006C 006F 0000 0012
        DECLE   $002B,  $0071,  $0000,  $0072   ; 5D94   002B 0071 0000 0072
        DECLE   $0000,  $0073,  $0000,  $0074   ; 5D98   0000 0073 0000 0074
        DECLE   $002B,  $0001,  $002C,  $0076   ; 5D9C   002B 0001 002C 0076
        DECLE   $0077,  $0015,  $0013,  $0000   ; 5DA0   0077 0015 0013 0000
        DECLE   $0079,  $0000,  $0015,  $007A   ; 5DA4   0079 0000 0015 007A
        DECLE   $0078,  $007B,  $0073,  $0000   ; 5DA8   0078 007B 0073 0000
        DECLE   $0000,  $007D,  $0071,  $0000   ; 5DAC   0000 007D 0071 0000
        DECLE   $0001,  $0071,  $007F,  $0080   ; 5DB0   0001 0071 007F 0080
        DECLE   $006B,  $0081,  $0069,  $0013   ; 5DB4   006B 0081 0069 0013
        DECLE   $0001,  $0083,  $006E,  $0084   ; 5DB8   0001 0083 006E 0084
        DECLE   $0082,  $0085,  $002B,  $0059   ; 5DBC   0082 0085 002B 0059
        DECLE   $0000                           ; 5DC0   0000

        MOVR    R0,     R7                      ; 5DC1   0087

        DECLE   $0000,  $0088,  $0000,  $0089   ; 5DC2   0000 0088 0000 0089
        DECLE   $0077,  $0001,  $008B,  $0001   ; 5DC6   0077 0001 008B 0001
        DECLE   $0000,  $0003,  $0003,  $008D   ; 5DCA   0000 0003 0003 008D
        DECLE   $008E,  $0001                   ; 5DCE   008E 0001

        DIS                                     ; 5DD0   0003
        MOVR    R1,     R7                      ; 5DD1   008F

        DECLE   $0090,  $0001,  $0001,  $0091   ; 5DD2   0090 0001 0001 0091
        DECLE   $008D,  $0000,  $0093,  $0002   ; 5DD6   008D 0000 0093 0002
        DECLE   $0094,  $0032,  $0095,  $0001   ; 5DDA   0094 0032 0095 0001
        DECLE   $008D,  $0020,  $0000,  $0097   ; 5DDE   008D 0020 0000 0097
        DECLE   $0098,  $0000,  $0050,  $0004   ; 5DE2   0098 0000 0050 0004
        DECLE   $0001,  $009A,  $0099,  $009B   ; 5DE6   0001 009A 0099 009B
        DECLE   $0096,  $009C,  $0059,  $0000   ; 5DEA   0096 009C 0059 0000

        MOVR    R3,     R6                      ; 5DEE   009E

        JSRE    R4,     L_549F                  ; 5DEF   0004 0055 009F
        DECLE   $0000,  $00A0,  $008D,  $008D   ; 5DF2   0000 00A0 008D 008D
        DECLE   $0000,  $00A2,  $00A3,  $0000   ; 5DF6   0000 00A2 00A3 0000
        DECLE   $00A4,  $0003,  $003D,  $0012   ; 5DFA   00A4 0003 003D 0012
        DECLE   $00A6,  $0000,  $0000           ; 5DFE   00A6 0000 0000

        MOVR    R4,     R7                      ; 5E01   00A7
        MOVR    R2,     R7                      ; 5E02   0097

        DECLE   $0001,  $00A9,  $006D,  $00A8   ; 5E03   0001 00A9 006D 00A8
        DECLE   $00AA,  $00A5,  $00AB,  $0080   ; 5E07   00AA 00A5 00AB 0080
        DECLE   $0001,  $0000,  $007F,  $00AD   ; 5E0B   0001 0000 007F 00AD
        DECLE   $00AE,  $0001                   ; 5E0F   00AE 0001

        TSTR    R5                              ; 5E11   00AD
        MOVR    R5,     R7                      ; 5E12   00AF

        DECLE   $00B0,  $0002,  $003D,  $0003   ; 5E13   00B0 0002 003D 0003
        DECLE   $00B2,  $0001,  $00B3,  $00B4   ; 5E17   00B2 0001 00B3 00B4
        DECLE   $001C,  $004C,  $0000,  $00B6   ; 5E1B   001C 004C 0000 00B6
        DECLE   $0000,  $00B5,  $00B7,  $0000   ; 5E1F   0000 00B5 00B7 0000
        DECLE   $0032,  $0000,  $00B9,  $0000   ; 5E23   0032 0000 00B9 0000
        DECLE   $00BA,  $0000,  $008D,  $00BC   ; 5E27   00BA 0000 008D 00BC
        DECLE   $0003,  $00BD,  $0003,  $00BB   ; 5E2B   0003 00BD 0003 00BB
        DECLE   $00BE,  $0001,  $004B,  $0002   ; 5E2F   00BE 0001 004B 0002
        DECLE   $00C0,  $0001,  $00C1,  $0020   ; 5E33   00C0 0001 00C1 0020
        DECLE   $0001,  $00C3,  $001D,  $0000   ; 5E37   0001 00C3 001D 0000
        DECLE   $00C4,  $0000,  $00C5,  $0000   ; 5E3B   00C4 0000 00C5 0000
        DECLE   $00C3,  $00C3,  $0001,  $00C7   ; 5E3F   00C3 00C3 0001 00C7
        DECLE   $00C8,  $00C9,  $0001,  $00C6   ; 5E43   00C8 00C9 0001 00C6
        DECLE   $00CA,  $006A,  $006D,  $00CC   ; 5E47   00CA 006A 006D 00CC
        DECLE   $0001,  $0083,  $0000,  $0000   ; 5E4B   0001 0083 0000 0000

        ADDR    R1,     R6                      ; 5E4F   00CE
        ADDR    R1,     R5                      ; 5E50   00CD
        ADDR    R1,     R7                      ; 5E51   00CF

        DECLE   $005E,  $0000,  $00D1,  $0004   ; 5E52   005E 0000 00D1 0004
        DECLE   $0005,  $00D2,  $00D3,  $0001   ; 5E56   0005 00D2 00D3 0001
        DECLE   $009A,  $0000,  $0050,  $0005   ; 5E5A   009A 0000 0050 0005
        DECLE   $0001                           ; 5E5E   0001

        ADDR    R2,     R6                      ; 5E5F   00D6
        ADDR    R2,     R5                      ; 5E60   00D5
        ADDR    R2,     R7                      ; 5E61   00D7

        DECLE   $0000,  $00D1,  $00D9,  $0000   ; 5E62   0000 00D1 00D9 0000
        DECLE   $00D8,  $00DA,  $0059,  $0020   ; 5E66   00D8 00DA 0059 0020
        DECLE   $00DC,  $0001,  $0004,  $00DD   ; 5E6A   00DC 0001 0004 00DD
        DECLE   $00DE,  $0001,  $0000,  $0050   ; 5E6E   00DE 0001 0000 0050
        DECLE   $006A,  $00E0,  $00E1,  $0004   ; 5E72   006A 00E0 00E1 0004
        DECLE   $00E0,  $0000                   ; 5E76   00E0 0000

        ADDR    R3,     R1                      ; 5E78   00D9
        ADDR    R4,     R3                      ; 5E79   00E3
        ADDR    R4,     R2                      ; 5E7A   00E2
        ADDR    R4,     R4                      ; 5E7B   00E4

        JSRD    R4,     L_D0E6                  ; 5E7C   0004 00D2 00E6
        DECLE   $0001,  $001E,  $0001,  $0020   ; 5E7F   0001 001E 0001 0020
        DECLE   $0000,  $0000,  $00E9,  $00EA   ; 5E83   0000 0000 00E9 00EA
        DECLE   $0000,  $00E9,  $0001,  $0001   ; 5E87   0000 00E9 0001 0001

        ADDR    R5,     R4                      ; 5E8B   00EC
        ADDR    R5,     R3                      ; 5E8C   00EB
        ADDR    R5,     R5                      ; 5E8D   00ED
        ADDR    R5,     R0                      ; 5E8E   00E8
        ADDR    R5,     R6                      ; 5E8F   00EE
        MOVR    R5,     R6                      ; 5E90   00AE
        ADDR    R5,     R3                      ; 5E91   00EB
        ADDR    R6,     R0                      ; 5E92   00F0
        MOVR    R5,     R7                      ; 5E93   00AF

        DECLE   $00B0,  $0001,  $0015,  $0069   ; 5E94   00B0 0001 0015 0069
        DECLE   $003A,  $0002,  $00F4,  $0000   ; 5E98   003A 0002 00F4 0000
        DECLE   $00F3,  $00F5,  $0014,  $0079   ; 5E9C   00F3 00F5 0014 0079
        DECLE   $00F7,  $0000,  $00F8,  $0000   ; 5EA0   00F7 0000 00F8 0000
        DECLE   $0020,  $005E,  $0000,  $00FA   ; 5EA4   0020 005E 0000 00FA
        DECLE   $00FB,  $0059,  $0000,  $00FC   ; 5EA8   00FB 0059 0000 00FC
        DECLE   $0032,  $0098,  $0000,  $00FE   ; 5EAC   0032 0098 0000 00FE
        DECLE   $00FD,  $00FF,  $00AE,  $0000   ; 5EB0   00FD 00FF 00AE 0000
        DECLE   $00AD,  $0000,  $0101,  $0102   ; 5EB4   00AD 0000 0101 0102
        DECLE   $0009,  $001C,  $0104,  $002C   ; 5EB8   0009 001C 0104 002C
        DECLE   $0001,  $00C8,  $0105,  $0106   ; 5EBC   0001 00C8 0105 0106
        DECLE   $0001,  $00F7,  $0001,  $0108   ; 5EC0   0001 00F7 0001 0108
        DECLE   $0032,  $0002,  $0020,  $010A   ; 5EC4   0032 0002 0020 010A
        DECLE   $010B,  $0001,  $010C,  $0001   ; 5EC8   010B 0001 010C 0001
        DECLE   $010D,  $0001,  $0004           ; 5ECC   010D 0001 0004

        ADDR    R4,     R0                      ; 5ECF   00E0
        SUBR    R1,     R7                      ; 5ED0   010F

        DECLE   $0004,  $0001,  $0110,  $0000   ; 5ED1   0004 0001 0110 0000
        DECLE   $0007,  $0059,  $0112,  $0113   ; 5ED5   0007 0059 0112 0113
        DECLE   $0005,  $0004,  $0114,  $00E4   ; 5ED9   0005 0004 0114 00E4
        DECLE   $0115,  $0001                   ; 5EDD   0115 0001

        DECR    R5                              ; 5EDF   0015
        SUBR    R2,     R7                      ; 5EE0   0117

        DECLE   $007B,  $0012,  $0000,  $0119   ; 5EE1   007B 0012 0000 0119
        DECLE   $0000,  $011A,  $0000,  $011B   ; 5EE5   0000 011A 0000 011B
        DECLE   $0000                           ; 5EE9   0000

        ADDR    R0,     R3                      ; 5EEA   00C3
        DIS                                     ; 5EEB   0003
        ADCR    R4                              ; 5EEC   002C
        SUBR    R3,     R5                      ; 5EED   011D

        JSRE    R4,     .EXEC.C7F               ; 5EEE   0004 001D 007F

        SUBR    R3,     R7                      ; 5EF1   011F

        DECLE   $011E,  $0120,  $0000,  $0121   ; 5EF2   011E 0120 0000 0121
        DECLE   $0069,  $0004                   ; 5EF6   0069 0004

        SUBR    R4,     R3                      ; 5EF8   0123
        ADDR    R5,     R2                      ; 5EF9   00EA
        DIS                                     ; 5EFA   0003
        DECR    R3                              ; 5EFB   0013
        SUBR    R4,     R5                      ; 5EFC   0125
        SUBR    R3,     R2                      ; 5EFD   011A
        SUBR    R4,     R4                      ; 5EFE   0124
        SUBR    R4,     R6                      ; 5EFF   0126
        SUBR    R4,     R7                      ; 5F00   0127

        DECLE   $0000,  $0001,  $003D,  $0003   ; 5F01   0000 0001 003D 0003
        DECLE   $0129,  $012A,  $011A,  $0124   ; 5F05   0129 012A 011A 0124
        DECLE   $012B,  $012C,  $0000,  $0001   ; 5F09   012B 012C 0000 0001
        DECLE   $0081,  $012E,  $0001,  $0001   ; 5F0D   0081 012E 0001 0001
        DECLE   $0016,  $0007,  $0130,  $0131   ; 5F11   0016 0007 0130 0131
        DECLE   $0021,  $0013,  $0012,  $0133   ; 5F15   0021 0013 0012 0133
        DECLE   $0000,  $0015,  $0134,  $0001   ; 5F19   0000 0015 0134 0001
        DECLE   $0135,  $007A,  $0000,  $0137   ; 5F1D   0135 007A 0000 0137
        DECLE   $0000,  $0039,  $0000,  $0038   ; 5F21   0000 0039 0000 0038
        DECLE   $0001,  $013A,  $0000,  $0139   ; 5F25   0001 013A 0000 0139
        DECLE   $013B,  $013C,  $0000,  $0001   ; 5F29   013B 013C 0000 0001
        DECLE   $0007,  $013E,  $0000,  $013F   ; 5F2D   0007 013E 0000 013F
L_5F31:
        DECR    R7                              ; 5F31   0017

        DECLE   $0140,  $0000,  $013D,  $0141   ; 5F32   0140 0000 013D 0141
        DECLE   $0000,  $0038,  $0143,  $0000   ; 5F36   0000 0038 0143 0000
        DECLE   $0038,  $0038,  $0145,  $0000   ; 5F3A   0038 0038 0145 0000
        DECLE   $0144,  $0146,  $0147,  $0000   ; 5F3E   0144 0146 0147 0000

        DECR    R2                              ; 5F42   0012
L_5F43:
        DECR    R7                              ; 5F43   0017

        DECLE   $0149,  $0000,  $0148,  $014A   ; 5F44   0149 0000 0148 014A
        DECLE   $011C,  $0000,  $001D,  $0071   ; 5F48   011C 0000 001D 0071
        DECLE   $007F,  $014D,  $014E,  $0000   ; 5F4C   007F 014D 014E 0000
        DECLE   $0000,  $014F,  $0025,  $0021   ; 5F50   0000 014F 0025 0021
        DECLE   $0002,  $0038,  $0001,  $0152   ; 5F54   0002 0038 0001 0152
        DECLE   $0038,  $0000,  $0154,  $0000   ; 5F58   0038 0000 0154 0000
        DECLE   $00B3,  $0155,  $0153,  $0156   ; 5F5C   00B3 0155 0153 0156
        DECLE   $0157,  $0000,  $0000,  $00C9   ; 5F60   0157 0000 0000 00C9
        DECLE   $0026,  $006B,  $0159,  $015A   ; 5F64   0026 006B 0159 015A
        DECLE   $0000,  $0022,  $00C8,  $0001   ; 5F68   0000 0022 00C8 0001
        DECLE   $015C,  $015D,  $0000,  $00CC   ; 5F6C   015C 015D 0000 00CC
        DECLE   $015E,  $015F,  $0005,  $0059   ; 5F70   015E 015F 0005 0059
        DECLE   $0161,  $0001,  $0112,  $0000   ; 5F74   0161 0001 0112 0000
        DECLE   $0004,  $00D6,  $0163,  $0164   ; 5F78   0004 00D6 0163 0164
        DECLE   $0162,  $0165,  $0000,  $0166   ; 5F7C   0162 0165 0000 0166
        DECLE   $001B,  $0000,  $0168,  $0168   ; 5F80   001B 0000 0168 0168
        DECLE   $0169,  $0000,  $001D,  $0000   ; 5F84   0169 0000 001D 0000
        DECLE   $016B,  $001E,  $016C,  $0000   ; 5F88   016B 001E 016C 0000
        DECLE   $0168,  $0000,  $0015,  $016E   ; 5F8C   0168 0000 0015 016E
        DECLE   $016D,  $016F,  $0000,  $0168   ; 5F90   016D 016F 0000 0168
        DECLE   $00E8,  $0171,  $0172,  $00F8   ; 5F94   00E8 0171 0172 00F8
        DECLE   $0000,  $0030,  $0012,  $0069   ; 5F98   0000 0030 0012 0069
        DECLE   $0175,  $0000,  $0176,  $0003   ; 5F9C   0175 0000 0176 0003
        DECLE   $00A2,  $0001,  $0178,  $008D   ; 5FA0   00A2 0001 0178 008D
        DECLE   $0000,  $0179,  $0177,  $017A   ; 5FA4   0000 0179 0177 017A
        DECLE   $0000,  $00A4,  $017C,  $0000   ; 5FA8   0000 00A4 017C 0000
        DECLE   $002B,  $0020,  $017E,  $0001   ; 5FAC   002B 0020 017E 0001
        DECLE   $0020,  $0071,  $0180,  $0001   ; 5FB0   0020 0071 0180 0001
        DECLE   $017F,  $0181,  $0000,  $0182   ; 5FB4   017F 0181 0000 0182
        DECLE   $00ED,  $0001,  $0184,  $00EE   ; 5FB8   00ED 0001 0184 00EE
        DECLE   $0000,  $00EB,  $0186,  $0000   ; 5FBC   0000 00EB 0186 0000
        DECLE   $0000,  $002C,  $0000,  $0188   ; 5FC0   0000 002C 0000 0188
        DECLE   $0000,  $0189,  $0076,  $0001   ; 5FC4   0000 0189 0076 0001
        DECLE   $0188,  $018B,  $018B,  $0001   ; 5FC8   0188 018B 018B 0001
        DECLE   $018C,  $018D,  $00E9,  $0012   ; 5FCC   018C 018D 00E9 0012
        DECLE   $0001,  $018F,  $0012,  $0119   ; 5FD0   0001 018F 0012 0119
        DECLE   $0001,  $0191,  $0190,  $0192   ; 5FD4   0001 0191 0190 0192
        DECLE   $0193,  $0000,  $005E,  $005E   ; 5FD8   0193 0000 005E 005E
        DECLE   $0000,  $0195,  $0000,  $0196   ; 5FDC   0000 0195 0000 0196
        DECLE   $0000,  $0197,  $0000,  $0198   ; 5FE0   0000 0197 0000 0198
        DECLE   $0195,  $0001,  $005E,  $019A   ; 5FE4   0195 0001 005E 019A
        DECLE   $0000,  $019B,  $0020,  $00C3   ; 5FE8   0000 019B 0020 00C3
        DECLE   $0000,  $019D,  $019E,  $0004   ; 5FEC   0000 019D 019E 0004
        DECLE   $019C,  $019F,  $0179,  $0001   ; 5FF0   019C 019F 0179 0001
        DECLE   $0003,  $01A1,  $0178,  $0032   ; 5FF4   0003 01A1 0178 0032
        DECLE   $0000,  $01A3,  $00A5,  $01A4   ; 5FF8   0000 01A3 00A5 01A4
        DECLE   $0001,  $0119,  $0001,  $01A6   ; 5FFC   0001 0119 0001 01A6
        DECLE   $0001,  $01A7,  $01A7,  $011B   ; 6000   0001 01A7 01A7 011B
        DECLE   $01A8,  $01A9,  $0059,  $019A   ; 6004   01A8 01A9 0059 019A
        DECLE   $0000,  $01AB,  $0197,  $0004   ; 6008   0000 01AB 0197 0004
        DECLE   $01AC,  $01AD,  $019B,  $0001   ; 600C   01AC 01AD 019B 0001
        DECLE   $01AF,  $0004,  $0020,  $008D   ; 6010   01AF 0004 0020 008D
        DECLE   $01B1,  $0001,  $01B2,  $008D   ; 6014   01B1 0001 01B2 008D
        DECLE   $01B3,  $0001,  $0001,  $01B4   ; 6018   01B3 0001 0001 01B4
        DECLE   $00AE,  $00AA,  $00A5,  $01B6   ; 601C   00AE 00AA 00A5 01B6
        DECLE   $0044,  $0000,  $0003,  $00A8   ; 6020   0044 0000 0003 00A8
        DECLE   $01B8,  $01B9,  $003D,  $0002   ; 6024   01B8 01B9 003D 0002
        DECLE   $0001,  $01BB,  $0080,  $01BC   ; 6028   0001 01BB 0080 01BC
        DECLE   $00ED,  $01BD,  $0001,  $0178   ; 602C   00ED 01BD 0001 0178
        DECLE   $00EB,  $01BF,  $01BE,  $01C0   ; 6030   00EB 01BF 01BE 01C0
        DECLE   $019A,  $0001,  $0188,  $01C2   ; 6034   019A 0001 0188 01C2
        DECLE   $0005,  $0050,  $0001,  $01C4   ; 6038   0005 0050 0001 01C4
        DECLE   $01C5,  $01A6,  $018B,  $01C6   ; 603C   01C5 01A6 018B 01C6
        DECLE   $01C3,  $01C7,  $0004,  $0053   ; 6040   01C3 01C7 0004 0053
        DECLE   $0050,  $0050,  $0001,  $01CA   ; 6044   0050 0050 0001 01CA
        DECLE   $01CB,  $0050,  $01CC,  $0000   ; 6048   01CB 0050 01CC 0000
        DECLE   $01C9,  $01CD,  $00FA,  $0001   ; 604C   01C9 01CD 00FA 0001
        DECLE   $00C7,  $01CF,  $011B,  $01D0   ; 6050   00C7 01CF 011B 01D0
        DECLE   $01D1,  $01AD,  $005E,  $0020   ; 6054   01D1 01AD 005E 0020
        DECLE   $01D3,  $0001,  $005E,  $01D4   ; 6058   01D3 0001 005E 01D4
        DECLE   $01D5,  $0001,  $01D6,  $0001   ; 605C   01D5 0001 01D6 0001
        DECLE   $0005,  $0014,  $0001,  $01D8   ; 6060   0005 0014 0001 01D8
        DECLE   $01D9,  $007B,  $0038,  $0003   ; 6064   01D9 007B 0038 0003
        DECLE   $0001,  $01DB,  $01DC,  $0003   ; 6068   0001 01DB 01DC 0003
        DECLE   $0000,  $003D,  $01DE,  $0000   ; 606C   0000 003D 01DE 0000
        DECLE   $0000,  $01DF,  $01DD,  $01E0   ; 6070   0000 01DF 01DD 01E0
        DECLE   $0028,  $01E1,  $003D,  $0003   ; 6074   0028 01E1 003D 0003
        DECLE   $01E3,  $0000,  $0003,  $01DE   ; 6078   01E3 0000 0003 01DE
        DECLE   $01E4,  $01E5,  $0001,  $01E6   ; 607C   01E4 01E5 0001 01E6
        DECLE   $01BC,  $0001,  $0001,  $01E8   ; 6080   01BC 0001 0001 01E8
        DECLE   $01E7,  $01E9,  $0014,  $0012   ; 6084   01E7 01E9 0014 0012
        DECLE   $01EB,  $0000,  $0108,  $01EC   ; 6088   01EB 0000 0108 01EC
        DECLE   $0012,  $001E,  $01EE,  $0000   ; 608C   0012 001E 01EE 0000
        DECLE   $0001,  $016C,  $01EF,  $01F0   ; 6090   0001 016C 01EF 01F0
        DECLE   $0001,  $01C5,  $0001,  $01F2   ; 6094   0001 01C5 0001 01F2
        DECLE   $0050,  $0000,  $0004           ; 6098   0050 0000 0004

        XORR    R6,     R4                      ; 609B   01F4

        JSR     R4,     L_51F6                  ; 609C   0004 0050 01F6
        DECLE   $0000,  $01F5,  $01F7,  $0001   ; 609F   0000 01F5 01F7 0001
        DECLE   $01F8,  $01F3,  $01F9,  $0004   ; 60A3   01F8 01F3 01F9 0004
        DECLE   $0007,  $0001,  $01FB,  $0004   ; 60A7   0007 0001 01FB 0004
        DECLE   $01FC,  $01F4,  $0000,  $01FE   ; 60AB   01FC 01F4 0000 01FE
        DECLE   $0000,  $01FD,  $01FF,  $0200   ; 60AF   0000 01FD 01FF 0200
        DECLE   $0028,  $003A,  $0003,  $0202   ; 60B3   0028 003A 0003 0202
        DECLE   $0000,  $0028,  $0203,  $003F   ; 60B7   0000 0028 0203 003F
        DECLE   $003D,  $0001                   ; 60BB   003D 0001

        BLT     L_60C0                          ; 60BD   0205 0001

        MOVR    R4,     R6                      ; 60BF   00A6
L_60C0:
        BUSC    L_60C3                          ; 60C0   0207 0001

        DECLE   $0001                           ; 60C2   0001
L_60C3:
        SKIP                                    ; 60C3   0208
        DECLE   $0206,  $0209,  $0002,  $0013   ; 60C4   0206 0209 0002 0013
        DECLE   $0001,  $020B,  $020C,  $007A   ; 60C8   0001 020B 020C 007A
        DECLE   $01D9,  $020D,  $0196,  $005E   ; 60CC   01D9 020D 0196 005E
        DECLE   $0000,  $020F,  $019A,  $0005   ; 60D0   0000 020F 019A 0005
        DECLE   $0000,  $0211,  $0210,  $0212   ; 60D4   0000 0211 0210 0212
        DECLE   $0002,  $0178,  $0000,  $0214   ; 60D8   0002 0178 0000 0214
        DECLE   $008D,  $0022,  $0000,  $0216   ; 60DC   008D 0022 0000 0216
        DECLE   $0215,  $0217,  $0000,  $0059   ; 60E0   0215 0217 0000 0059
        DECLE   $0219,  $0001,  $0020,  $021A   ; 60E4   0219 0001 0020 021A
        DECLE   $0000,  $021B,  $005A,  $0001   ; 60E8   0000 021B 005A 0001
        DECLE   $021D,  $0005,  $0000,  $021E   ; 60EC   021D 0005 0000 021E
        DECLE   $021C,  $021F,  $0000,  $00DC   ; 60F0   021C 021F 0000 00DC
        DECLE   $0221                           ; 60F4   0221

        NEGR    R2                              ; 60F5   0022
L_60F6:
        BOV     L_60F6                          ; 60F6   0222 0001

        DECLE   $0059,  $0223,  $0020,  $0032   ; 60F8   0059 0223 0020 0032
        DECLE   $0000,  $0225,  $0226,  $0000   ; 60FC   0000 0225 0226 0000
        DECLE   $0227,  $0003,  $0000,  $00AA   ; 6100   0227 0003 0000 00AA
        DECLE   $0228,  $0229,  $0000,  $00DA   ; 6104   0228 0229 0000 00DA
        DECLE   $0005,  $001C,  $0001           ; 6108   0005 001C 0001
L_610B:
        BNEQ    L_610B                          ; 610B   022C 0001

        DECLE   $022D,  $002B,  $00C8,  $022F   ; 610D   022D 002B 00C8 022F
        DECLE   $0181,  $0230,  $0193,  $00DD   ; 6111   0181 0230 0193 00DD
        DECLE   $0181,  $0232,  $0001,  $00D8   ; 6115   0181 0232 0001 00D8
        DECLE   $0000,  $00D1,  $0005,  $0004   ; 6119   0000 00D1 0005 0004
        DECLE   $0235,  $00DA,  $0236,  $0003   ; 611D   0235 00DA 0236 0003
        DECLE   $0038,  $0238,  $0000,  $020C   ; 6121   0038 0238 0000 020C
        DECLE   $0239,  $0001,  $023A           ; 6125   0239 0001 023A

        BLT     L_612A                          ; 6128   0205 0000

L_612A:
        SWAP    R3,     1                       ; 612A   0043
        DECLE   $0001,  $023D,  $0000,  $023C   ; 612B   0001 023D 0000 023C
        DECLE   $023E,  $00BA,  $0002,  $0032   ; 612F   023E 00BA 0002 0032
        DECLE   $0003,  $0241,  $0001,  $0240   ; 6133   0003 0241 0001 0240
        DECLE   $0242,  $0000,  $0243,  $0014   ; 6137   0242 0000 0243 0014
        DECLE   $011A,  $0001,  $0245,  $0001   ; 613B   011A 0001 0245 0001
        DECLE   $0226,  $0246,  $0247,  $0007   ; 613F   0226 0246 0247 0007
        DECLE   $0004,  $0249,  $0000,  $0050   ; 6143   0004 0249 0000 0050
        DECLE   $0001,  $0001,  $024B,  $024A   ; 6147   0001 0001 024B 024A
        DECLE   $024C,  $0001,  $024D,  $0005   ; 614B   024C 0001 024D 0005
        DECLE   $001D,  $024F,  $0001,  $0000   ; 614F   001D 024F 0001 0000
        DECLE   $016B,  $0250,  $0251,  $0001   ; 6153   016B 0250 0251 0001
        DECLE   $00E8,  $0252,  $0253,  $0001   ; 6157   00E8 0252 0253 0001
        DECLE   $00B2,  $0003,  $0119,  $0256   ; 615B   00B2 0003 0119 0256
        DECLE   $0000,  $0255,  $0257,  $0258   ; 615F   0000 0255 0257 0258
        DECLE   $0000,  $008D,  $0003,  $0000   ; 6163   0000 008D 0003 0000
        DECLE   $025A,  $008D,  $0001,  $025C   ; 6167   025A 008D 0001 025C
        DECLE   $0001,  $025B,  $025D,  $0048   ; 616B   0001 025B 025D 0048
        DECLE   $0257,  $025E,  $025F,  $0000   ; 616F   0257 025E 025F 0000
        DECLE   $00BC,  $0000,  $0261,  $0262   ; 6173   00BC 0000 0261 0262
        DECLE   $00BE,  $0000,  $0262,  $00BE   ; 6177   00BE 0000 0262 00BE
        DECLE   $0001,  $0184,  $01C0,  $0188   ; 617B   0001 0184 01C0 0188
        DECLE   $00BE,  $0003,  $004B,  $0002   ; 617F   00BE 0003 004B 0002
        DECLE   $0268,  $0001,  $0269,  $0004   ; 6183   0268 0001 0269 0004
        DECLE   $0071,  $026B,  $0001,  $026C   ; 6187   0071 026B 0001 026C
        DECLE   $0022,  $0186,  $026D,  $0003   ; 618B   0022 0186 026D 0003
        DECLE   $00C0,  $026F,  $00B6,  $0076   ; 618F   00C0 026F 00B6 0076
        DECLE   $0004,  $0188,  $0271,  $0007   ; 6193   0004 0188 0271 0007
        DECLE   $0000,  $0005,  $0273,  $000B   ; 6197   0000 0005 0273 000B
        DECLE   $0274,  $018B,  $0275,  $0272   ; 619B   0274 018B 0275 0272
        DECLE   $0276,  $000A,  $0000,  $0007   ; 619F   0276 000A 0000 0007
        DECLE   $0278,  $0001,  $0279,  $0273   ; 61A3   0278 0001 0279 0273
        DECLE   $0000,  $027B,  $0000,  $0005   ; 61A7   0000 027B 0000 0005
        DECLE   $027C,  $027A,  $027D,  $000C   ; 61AB   027C 027A 027D 000C
        DECLE   $0000,  $0000,  $005B,  $0016   ; 61AF   0000 0000 005B 0016
        DECLE   $0280,  $027F,  $0281,  $0059   ; 61B3   0280 027F 0281 0059
        DECLE   $0004,  $0000,  $0283,  $005F   ; 61B7   0004 0000 0283 005F
        DECLE   $0004                           ; 61BB   0004

        MVI     .BTAB.85,R4                     ; 61BC   0284 0285
        SUBR    R3,     R2                      ; 61BE   011A
        MVI     G_019E, R6                      ; 61BF   0286 019E
        CMPR    R3,     R5                      ; 61C1   015D
        MVI     .BTAB.88,R7                     ; 61C2   0287 0288

        DECLE   $00AE,  $0179,  $00A5,  $028A   ; 61C4   00AE 0179 00A5 028A
        DECLE   $0002,  $01DE,  $0038,  $028C   ; 61C8   0002 01DE 0038 028C
        DECLE   $028D,  $00A4,  $0001           ; 61CC   028D 00A4 0001

        XORR    R4,     R3                      ; 61CF   01E3
        MVI@    R1,     R7                      ; 61D0   028F

        DECLE   $0003,  $0290,  $01E0,  $028E   ; 61D1   0003 0290 01E0 028E
        DECLE   $0291,  $0001,  $0290,  $01E7   ; 61D5   0291 0001 0290 01E7
        DECLE   $0293,  $019A,  $021D,  $016E   ; 61D9   0293 019A 021D 016E
        DECLE   $0295,  $0296,  $021F,  $0280   ; 61DD   0295 0296 021F 0280
        DECLE   $0005,  $0059,  $0005,  $0000   ; 61E1   0005 0059 0005 0000
        DECLE   $0299,  $029A,  $0059,  $029B   ; 61E5   0299 029A 0059 029B
        DECLE   $0001,  $0298,  $029C,  $0299   ; 61E9   0001 0298 029C 0299
        DECLE   $0001,  $021D                   ; 61ED   0001 021D

        MVI@    R3,     R6                      ; 61EF   029E
        MVI@    R3,     R7                      ; 61F0   029F

        DECLE   $0001,  $02A0,  $0005,  $01A3   ; 61F1   0001 02A0 0005 01A3
        DECLE   $0001,  $0003,  $02A2,  $006E   ; 61F5   0001 0003 02A2 006E
        DECLE   $0003,  $01E0,  $00AA,  $02A4   ; 61F9   0003 01E0 00AA 02A4
        DECLE   $02A5,  $01E6,  $0000,  $02A7   ; 61FD   02A5 01E6 0000 02A7
        DECLE   $0291,  $00ED,  $01E6,  $001E   ; 6201   0291 00ED 01E6 001E
        DECLE   $0178,  $00EB,  $02AA,  $02A9   ; 6205   0178 00EB 02AA 02A9
        DECLE   $02AB,  $007F,  $0168,  $02AD   ; 6209   02AB 007F 0168 02AD
        DECLE   $0000,  $0000,  $02AE,  $0001   ; 620D   0000 0000 02AE 0001
        DECLE   $01FC,  $0001,  $02B0,  $000B   ; 6211   01FC 0001 02B0 000B
        DECLE   $0007,  $0001,  $02B2,  $02B1   ; 6215   0007 0001 02B2 02B1
        DECLE   $02B3,  $000F,  $0278,  $0001   ; 6219   02B3 000F 0278 0001
        DECLE   $02B5,  $0005                   ; 621D   02B5 0005

        INCR    R1                              ; 621F   0009
        PULR    R7                              ; 6220   02B7

        DECLE   $0000,  $02B6,  $02B8,  $02B2   ; 6221   0000 02B6 02B8 02B2
        DECLE   $0000,  $02BA,  $0168,  $0001   ; 6225   0000 02BA 0168 0001
        DECLE   $0145,  $0038,  $02BC,  $02BD   ; 6229   0145 0038 02BC 02BD
        DECLE   $0000,  $0168,  $02BE,  $0038   ; 622D   0000 0168 02BE 0038
        DECLE   $0002,  $0001,  $02C0,  $02C1   ; 6231   0002 0001 02C0 02C1
        DECLE   $0002,  $02C2,  $0000,  $02C0   ; 6235   0002 02C2 0000 02C0
        DECLE   $0000,  $0146,  $02C4,  $0001   ; 6239   0000 0146 02C4 0001
        DECLE   $02C5,  $02C3,  $02C6,  $0001   ; 623D   02C5 02C3 02C6 0001
        DECLE   $02BD,  $0001,  $02C2,  $02C8   ; 6241   02BD 0001 02C2 02C8
        DECLE   $02C9,  $0001,  $0129,  $02CB   ; 6245   02C9 0001 0129 02CB
        DECLE   $0239,  $0001,  $02CC,  $0004   ; 6249   0239 0001 02CC 0004
        DECLE   $005E,  $02CE,  $0001,  $0004   ; 624D   005E 02CE 0001 0004
        DECLE   $0059,  $0000                   ; 6251   0059 0000

        ADD@    R2,     R0                      ; 6253   02D0
        ADD@    R1,     R7                      ; 6254   02CF

        DECLE   $02D1,  $02D2,  $0001,  $0001   ; 6255   02D1 02D2 0001 0001

        NEGR    R2                              ; 6259   0022
        MVO     R6,     .BTAB.D4                ; 625A   0246 02D4
        MVO@    R2,     R1                      ; 625C   024A
        ADDR    R2,     R7                      ; 625D   00D7

        DECLE   $0001,  $02D6,  $018B,  $00E8   ; 625E   0001 02D6 018B 00E8
        DECLE   $02D8,  $0193,  $0000,  $0159   ; 6262   02D8 0193 0000 0159
        DECLE   $0030,  $0001,  $02DB,  $02DB   ; 6266   0030 0001 02DB 02DB
        DECLE   $0022,  $0076,  $02DD,  $0001   ; 626A   0022 0076 02DD 0001
        DECLE   $02DE,  $0005,  $00EC,  $0022   ; 626E   02DE 0005 00EC 0022
        DECLE   $02E0,  $0001,  $0002,  $02E1   ; 6272   02E0 0001 0002 02E1
        DECLE   $015F,  $0000,  $006B,  $0015   ; 6276   015F 0000 006B 0015
        DECLE   $0230                           ; 627A   0230

        ADD@    R4,     R4                      ; 627B   02E4
        MOVR    R1,     R5                      ; 627C   008D
        EIS                                     ; 627D   0002
        ADD@    R4,     R6                      ; 627E   02E6
        DIS                                     ; 627F   0003
        MVO@    R1,     R4                      ; 6280   0261
        ADD@    R4,     R7                      ; 6281   02E7

        DECLE   $0242,  $0001,  $02E8,  $02E9   ; 6282   0242 0001 02E8 02E9
        DECLE   $0013,  $004B,  $0003,  $02EB   ; 6286   0013 004B 0003 02EB
        DECLE   $0047,  $0119,  $02ED,  $0000   ; 628A   0047 0119 02ED 0000

        ADD@    R5,     R4                      ; 628E   02EC
        ADD@    R5,     R6                      ; 628F   02EE
        ADD@    R5,     R2                      ; 6290   02EA
        ADD@    R5,     R7                      ; 6291   02EF

        DECLE   $025A,  $0003,  $02F1,  $0001   ; 6292   025A 0003 02F1 0001
        DECLE   $02E8,  $02F2,  $0264,  $02F3   ; 6296   02E8 02F2 0264 02F3
        DECLE   $0108,  $00F8,  $0000,  $016D   ; 629A   0108 00F8 0000 016D
        DECLE   $0134,  $0168,  $0168,  $0176   ; 629E   0134 0168 0168 0176
        DECLE   $016D,  $01F0,  $0261,  $02F1   ; 62A2   016D 01F0 0261 02F1
        DECLE   $02FA,  $015D,  $02FB,  $0001   ; 62A6   02FA 015D 02FB 0001
        DECLE   $0169,  $0021,  $0021,  $0001   ; 62AA   0169 0021 0021 0001
        DECLE   $00C7,  $02FE,  $0012,  $0005   ; 62AE   00C7 02FE 0012 0005

        SUB     .STIC.VIDEN,R0                  ; 62B2   0300 0020
        SUB     .STIC.X.1,R1                    ; 62B4   0301 0001
        ADDI    #$0302, R7                      ; 62B6   02FF 0302

        DECLE   $02FE,  $006D,  $0001,  $0079   ; 62B8   02FE 006D 0001 0079
        DECLE   $0304,  $0305,  $0303,  $0306   ; 62BC   0304 0305 0303 0306
        DECLE   $0000,  $015C,  $0000,  $0308   ; 62C0   0000 015C 0000 0308
        DECLE   $016B,  $0001,  $02FF,  $030A   ; 62C4   016B 0001 02FF 030A
        DECLE   $030B,  $0306,  $00CD,  $015F   ; 62C8   030B 0306 00CD 015F
        DECLE   $0001                           ; 62CC   0001

        XORR    R3,     R6                      ; 62CD   01DE
        ADDR    R5,     R1                      ; 62CE   00E9
        SUB@    R1,     R6                      ; 62CF   030E
        SUB@    R1,     R7                      ; 62D0   030F

        DECLE   $0000                           ; 62D1   0000

        DECR    R2                              ; 62D2   0012
        DIS                                     ; 62D3   0003
        SDBD                                    ; 62D4   0001
        SUB@    R2,     R1                      ; 62D5   0311
        SUB@    R2,     R2                      ; 62D6   0312
        MOVR    R1,     R5                      ; 62D7   008D
        SUB@    R2,     R3                      ; 62D8   0313
        XORR    R4,     R0                      ; 62D9   01E0
        SUB@    R2,     R0                      ; 62DA   0310
        SUB@    R2,     R4                      ; 62DB   0314
        TSTR    R4                              ; 62DC   00A4
        XORR    R4,     R6                      ; 62DD   01E6
        MOVR    R4,     R2                      ; 62DE   00A2
        XORR    R4,     R3                      ; 62DF   01E3
        SUB@    R2,     R7                      ; 62E0   0317

        DECLE   $008D,  $0171,  $0318,  $0316   ; 62E1   008D 0171 0318 0316
        DECLE   $0319,  $008E,  $003E,  $003D   ; 62E5   0319 008E 003E 003D
        DECLE   $031B,  $031C,  $00A4,  $0093   ; 62E9   031B 031C 00A4 0093
        DECLE   $0003,  $0003,  $0020,  $0000   ; 62ED   0003 0003 0020 0000
        DECLE   $031F,  $031E,  $0320,  $0321   ; 62F1   031F 031E 0320 0321
        DECLE   $0171,  $031D,  $0322,  $0311   ; 62F5   0171 031D 0322 0311
        DECLE   $0000                           ; 62F9   0000

        SUB@    R4,     R4                      ; 62FA   0324
        XORR    R4,     R5                      ; 62FB   01E5
        TSTR    R4                              ; 62FC   00A4
        SUB@    R4,     R5                      ; 62FD   0325
        ANDR    R6,     R1                      ; 62FE   01B1
        COMR    R5                              ; 62FF   001D
        SUB@    R4,     R7                      ; 6300   0327

        DECLE   $0178,  $0000,  $0328,  $0326   ; 6301   0178 0000 0328 0326
        DECLE   $0329,  $01D3,  $0013,  $019A   ; 6305   0329 01D3 0013 019A
        DECLE   $032B,  $0000,  $032C,  $0197   ; 6309   032B 0000 032C 0197
        DECLE   $01F8,  $032D,  $032E,  $0195   ; 630D   01F8 032D 032E 0195
        DECLE   $01F6,  $005E,  $0330,  $0331   ; 6311   01F6 005E 0330 0331
        DECLE   $01FF,  $01F5,  $0079,  $0333   ; 6315   01FF 01F5 0079 0333
        DECLE   $0197                           ; 6319   0197

        SUB@    R6,     R2                      ; 631A   0332
        SUB@    R6,     R4                      ; 631B   0334
        SUBR    R3,     R3                      ; 631C   011B
        SUB@    R6,     R1                      ; 631D   0331
        SUB@    R6,     R6                      ; 631E   0336
        SUB@    R5,     R6                      ; 631F   032E

        JSRD    R4,     .EXEC.001               ; 6320   0004 0012 0001
        DECLE   $0338,  $005E,  $0339,  $033A   ; 6323   0338 005E 0339 033A
        DECLE   $01FF,  $01A6,  $0000,  $033C   ; 6327   01FF 01A6 0000 033C
        DECLE   $0000,  $033B,  $033D,  $0159   ; 632B   0000 033B 033D 0159
        DECLE   $00CA,  $0002,  $008D,  $0340   ; 632F   00CA 0002 008D 0340
        DECLE   $0001,  $0002,  $0341,  $0342   ; 6333   0001 0002 0341 0342
        DECLE   $0001,  $0000,  $008E,  $031E   ; 6337   0001 0000 008E 031E
        DECLE   $0344,  $0345,  $0001,  $0343   ; 633B   0344 0345 0001 0343
        DECLE   $0346,  $0000,  $0093,  $0348   ; 633F   0346 0000 0093 0348
        DECLE   $0000,  $0349,  $0090,  $01E0   ; 6343   0000 0349 0090 01E0
        DECLE   $0345,  $034A,  $034B,  $01E6   ; 6347   0345 034A 034B 01E6
        DECLE   $0349,  $0318,  $01E0,  $034D   ; 634B   0349 0318 01E0 034D
        DECLE   $034E,  $016E,  $0331,  $0350   ; 634F   034E 016E 0331 0350
        DECLE   $032E,  $01F8,  $0197,  $0332   ; 6353   032E 01F8 0197 0332
        DECLE   $0352,  $01FF,  $019B,  $0354   ; 6357   0352 01FF 019B 0354
        DECLE   $01AD,  $01AF,  $0005           ; 635B   01AD 01AF 0005

        MOVR    R2,     R1                      ; 635E   0091
        CMP     G_00EC, R6                      ; 635F   0346 00EC
        ADDR    R5,     R2                      ; 6361   00EA
        XORR    R4,     R0                      ; 6362   01E0
        CMP@    R3,     R0                      ; 6363   0358
        CMP@    R1,     R2                      ; 6364   034A
        CMP@    R3,     R1                      ; 6365   0359
        MVI@    R4,     R7                      ; 6366   02A7

        DECLE   $034E,  $0003,  $0071,  $01E4   ; 6367   034E 0003 0071 01E4
        DECLE   $035C,  $00A4,  $035D,  $01B2   ; 636B   035C 00A4 035D 01B2
        DECLE   $0178,  $0000,  $035F,  $035E   ; 636F   0178 0000 035F 035E
        DECLE   $0360,  $01F8,  $0000,  $0332   ; 6373   0360 01F8 0000 0332
        DECLE   $0362,  $01FF,  $01D0,  $0364   ; 6377   0362 01FF 01D0 0364
        DECLE   $01AD,  $0171,  $0000,  $0000   ; 637B   01AD 0171 0000 0000
        DECLE   $0366,  $016E,  $0000,  $0368   ; 637F   0366 016E 0000 0368
        DECLE   $0000,  $0006,  $0003,  $0003   ; 6383   0000 0006 0003 0003
        DECLE   $036A,  $0000,  $036B,  $008D   ; 6387   036A 0000 036B 008D
        DECLE   $036C,  $0000,  $036D,  $0000   ; 638B   036C 0000 036D 0000
        DECLE   $0006,  $0000,  $036F,  $036A   ; 638F   0006 0000 036F 036A
        DECLE   $0006,  $0370,  $0371,  $036F   ; 6393   0006 0370 0371 036F
        DECLE   $0006,  $0373,  $0006,  $0372   ; 6397   0006 0373 0006 0372
        DECLE   $0374,  $0000,  $0375,  $036E   ; 639B   0374 0000 0375 036E
        DECLE   $0376,  $036F,  $036F,  $0000   ; 639F   0376 036F 036F 0000
        DECLE   $0378,  $0379,  $036F,  $037A   ; 63A3   0378 0379 036F 037A
        DECLE   $0006,  $036F,  $0000,  $0000   ; 63A7   0006 036F 0000 0000
        DECLE   $037C,  $037D,  $0000,  $0006   ; 63AB   037C 037D 0000 0006
        DECLE   $0000,  $037F,  $037F,  $0380   ; 63AF   0000 037F 037F 0380
        DECLE   $0000,  $037E,  $0381,  $037B   ; 63B3   0000 037E 0381 037B
        DECLE   $0382,  $001F,  $0000,  $0006   ; 63B7   0382 001F 0000 0006
        DECLE   $0001,  $0003,  $0385,  $0386   ; 63BB   0001 0003 0385 0386
        DECLE   $0001,  $0003,  $0387,  $007F   ; 63BF   0001 0003 0387 007F
        DECLE   $016B,  $0388,  $0389,  $0384   ; 63C3   016B 0388 0389 0384
        DECLE   $038A,  $0385,  $0006,  $038C   ; 63C7   038A 0385 0006 038C
        DECLE   $0001,  $0006,  $038C,  $038D   ; 63CB   0001 0006 038C 038D
        DECLE   $038E,  $0080,  $001C,  $038F   ; 63CF   038E 0080 001C 038F
        DECLE   $0390,  $0006,  $037F,  $0006   ; 63D3   0390 0006 037F 0006
        DECLE   $0392,  $0393,  $0000,  $0006   ; 63D7   0392 0393 0000 0006
        DECLE   $0004,  $0395,  $0000,  $0396   ; 63DB   0004 0395 0000 0396
        DECLE   $0273,  $0397,  $0000,  $0394   ; 63DF   0273 0397 0000 0394
        DECLE   $0398,  $0391,  $0399,  $0020   ; 63E3   0398 0391 0399 0020
        DECLE   $0285,  $0000,  $039B,  $0000   ; 63E7   0285 0000 039B 0000
        DECLE   $005F,  $0000,  $039D,  $0065   ; 63EB   005F 0000 039D 0065
        DECLE   $0004,  $039E,  $039F,  $039C   ; 63EF   0004 039E 039F 039C
        DECLE   $03A0,  $005E,  $0005,  $0000   ; 63F3   03A0 005E 0005 0000
        DECLE   $03A2,  $03A3,  $0020,  $0001   ; 63F7   03A2 03A3 0020 0001
        DECLE   $0006,  $03A5,  $03A5,  $0001   ; 63FB   0006 03A5 03A5 0001
        DECLE   $03A6,  $0004                   ; 63FF   03A6 0004
L_6401:
        CLRC                                    ; 6401   0006
        DECLE   $0001,  $03A8,  $03A9,  $0006   ; 6402   0001 03A8 03A9 0006
        DECLE   $03A7,  $03AA,  $03A4,  $03AB   ; 6406   03A7 03AA 03A4 03AB
        DECLE   $01DF,  $0381,  $03AC,  $03AD   ; 640A   01DF 0381 03AC 03AD
        DECLE   $0012,  $037F,  $0001,  $03AF   ; 640E   0012 037F 0001 03AF
        DECLE   $001C,  $03B0,  $03B1,  $0000   ; 6412   001C 03B0 03B1 0000
        DECLE   $0004,  $03A5,  $03B3,  $0006   ; 6416   0004 03A5 03B3 0006
        DECLE   $03A5,  $0006,  $03B5,  $0006   ; 641A   03A5 0006 03B5 0006
        DECLE   $03B4,  $03B6,  $0000,  $0381   ; 641E   03B4 03B6 0000 0381
        DECLE   $03B7,  $03B8,  $03B2,  $03B9   ; 6422   03B7 03B8 03B2 03B9
        DECLE   $0006,  $0380,  $037F,  $03BB   ; 6426   0006 0380 037F 03BB
        DECLE   $0006,  $03BC,  $037F,  $0000   ; 642A   0006 03BC 037F 0000
        DECLE   $037F,  $03BE,  $03BF,  $0000   ; 642E   037F 03BE 03BF 0000

        AND     G_03C0, R1                      ; 6432   0381 03C0
        ANDI    #$03C1, R5                      ; 6434   03BD 03C1
L_6436:
        PSHR    R5                              ; 6436   0275
        CLRR    R0                              ; 6437   01C0
        MVO     R0,     G_018F                  ; 6438   0240 018F
        MVO     R0,     G_01B5                  ; 643A   0240 01B5
        MVI     .ISRVEC.0,R0                    ; 643C   0280 0100
        MVO     R0,     G_01B7                  ; 643E   0240 01B7
        MVI     .ISRVEC.1,R0                    ; 6440   0280 0101
        MVO     R0,     G_01B8                  ; 6442   0240 01B8
        MVII    #$00FF, R0                      ; 6444   02B8 00FF
        MVII    #$0064, R1                      ; 6446   02B9 0064
        MVO     R0,     .ISRVEC.0               ; 6448   0240 0100
        MVO     R1,     .ISRVEC.1               ; 644A   0241 0101
L_644C:
        MVI     G_01B5, R0                      ; 644C   0280 01B5
        TSTR    R0                              ; 644E   0080
        BEQ     L_644C                          ; 644F   0224 0004

        JSR     R5,     L_5952                  ; 6451   0004 0158 0152
        JSR     R5,     L_5014                  ; 6454   0004 0150 0014
        JSR     R5,     L_5725                  ; 6457   0004 0154 0325

        MVI     G_01B4, R1                      ; 645A   0281 01B4
        INCR    R1                              ; 645C   0009
        ADDR    R7,     R1                      ; 645D   00F9
        ADD@    R1,     R7                      ; 645E   02CF

        DIS                                     ; 645F   0003
        DECR    R6                              ; 6460   0016
        ADCR    R1                              ; 6461   0029
        MVI     G_01AC, R0                      ; 6462   0280 01AC
        TSTR    R0                              ; 6464   0080
        BEQ     L_646B                          ; 6465   0204 0004

        MVI     G_01A9, R0                      ; 6467   0280 01A9
        B       L_646D                          ; 6469   0200 0002

L_646B:
        MVI     G_01A8, R0                      ; 646B   0280 01A8
L_646D:
        MVO     R0,     G_0162                  ; 646D   0240 0162
        SDBD                                    ; 646F   0001
        MVII    #$D884, R4                      ; 6470   02BC 0084 00D8
        B       L_648C                          ; 6473   0200 0017

        MVI     G_0162, R0                      ; 6475   0280 0162
        MVI     G_01AC, R1                      ; 6477   0281 01AC
        TSTR    R1                              ; 6479   0089
        BNEQ    L_6480                          ; 647A   020C 0004

        MVO     R0,     G_01A8                  ; 647C   0240 01A8
        B       L_6482                          ; 647E   0200 0002

L_6480:
        MVO     R0,     G_01A9                  ; 6480   0240 01A9
L_6482:
        SDBD                                    ; 6482   0001
        MVII    #$DA64, R4                      ; 6483   02BC 0064 00DA
        B       L_648C                          ; 6486   0200 0004

        SDBD                                    ; 6488   0001
        MVII    #$DC44, R4                      ; 6489   02BC 0044 00DC
L_648C:
        MVII    #$0200, R5                      ; 648C   02BD 0200
L_648E:
        SDBD                                    ; 648E   0001
        MVI@    R4,     R0                      ; 648F   02A0
        MVO@    R0,     R5                      ; 6490   0268
        CMPI    #$02F0, R5                      ; 6491   037D 02F0
        BNEQ    L_648E                          ; 6493   022C 0006

        CLRR    R0                              ; 6495   01C0
        MVO     R0,     G_012C                  ; 6496   0240 012C
        MVI     G_01B4, R4                      ; 6498   0284 01B4
        ADDR    R4,     R4                      ; 649A   00E4
        ADDR    R4,     R4                      ; 649B   00E4
        ADDR    R4,     R4                      ; 649C   00E4
        SDBD                                    ; 649D   0001
        ADDI    #$6549, R4                      ; 649E   02FC 0049 0065

        JSR     R5,     L_5377                  ; 64A1   0004 0150 0377

        MVI     G_01B4, R0                      ; 64A4   0280 01B4
        TSTR    R0                              ; 64A6   0080
        BEQ     L_64AA                          ; 64A7   0204 0001
        PULR    R7                              ; 64A9   02B7

L_64AA:
        MVI     G_0190, R0                      ; 64AA   0280 0190
        CMPI    #$0001, R0                      ; 64AC   0378 0001
        BLT     L_64CF                          ; 64AE   0205 001F
        BGT     L_64C9                          ; 64B0   020E 0017

        SDBD                                    ; 64B2   0001
        MVII    #$08DA, R0                      ; 64B3   02B8 00DA 0008
L_64B6:
        MVII    #$02B8, R1                      ; 64B6   02B9 02B8
        MVO@    R0,     R1                      ; 64B8   0248
        SDBD                                    ; 64B9   0001
        MVII    #$286E, R0                      ; 64BA   02B8 006E 0028
        MVII    #$022C, R1                      ; 64BD   02B9 022C
        MVO@    R0,     R1                      ; 64BF   0248
        SDBD                                    ; 64C0   0001
        MVII    #$0816, R0                      ; 64C1   02B8 0016 0008
        MVII    #$022D, R1                      ; 64C4   02B9 022D
        MVO@    R0,     R1                      ; 64C6   0248
        B       L_64CF                          ; 64C7   0200 0006

L_64C9:
        SDBD                                    ; 64C9   0001
        MVII    #$08DF, R0                      ; 64CA   02B8 00DF 0008
        B       L_64B6                          ; 64CD   0220 0018

L_64CF:
        MVI     G_0191, R0                      ; 64CF   0280 0191
        CMPI    #$0001, R0                      ; 64D1   0378 0001
        BLT     L_64F4                          ; 64D3   0205 001F
        BGT     L_64EE                          ; 64D5   020E 0017

        SDBD                                    ; 64D7   0001
        MVII    #$082A, R0                      ; 64D8   02B8 002A 0008
L_64DB:
        MVII    #$02C3, R1                      ; 64DB   02B9 02C3
        MVO@    R0,     R1                      ; 64DD   0248
        SDBD                                    ; 64DE   0001
        MVII    #$28C6, R0                      ; 64DF   02B8 00C6 0028
        MVII    #$0236, R1                      ; 64E2   02B9 0236
        MVO@    R0,     R1                      ; 64E4   0248
        SDBD                                    ; 64E5   0001
        MVII    #$091E, R0                      ; 64E6   02B8 001E 0009
        MVII    #$0237, R1                      ; 64E9   02B9 0237
        MVO@    R0,     R1                      ; 64EB   0248
        B       L_64F4                          ; 64EC   0200 0006

L_64EE:
        SDBD                                    ; 64EE   0001
        MVII    #$082F, R0                      ; 64EF   02B8 002F 0008
        B       L_64DB                          ; 64F2   0220 0018

L_64F4:
        MVI     G_0162, R0                      ; 64F4   0280 0162
        TSTR    R0                              ; 64F6   0080
        BNEQ    L_64FE                          ; 64F7   020C 0005

        JSR     R5,     L_5370                  ; 64F9   0004 0150 0370
        DECLE   $0008,  $0000                   ; 64FC   0008 0000
L_64FE:
        PULR    R7                              ; 64FE   02B7

        PSHR    R5                              ; 64FF   0275
        MVI     G_01B4, R1                      ; 6500   0281 01B4
        INCR    R1                              ; 6502   0009
        ADDR    R7,     R1                      ; 6503   00F9
        ADD@    R1,     R7                      ; 6504   02CF

        DIS                                     ; 6505   0003
        INCR    R5                              ; 6506   000D
L_6507:
        DECR    R7                              ; 6507   0017

        SDBD                                    ; 6508   0001
        MVII    #$DE39, R5                      ; 6509   02BD 0039 00DE
        MVII    #$000E, R0                      ; 650C   02B8 000E
        MVII    #$0004, R1                      ; 650E   02B9 0004
        B       L_6524                          ; 6510   0200 0012

        SDBD                                    ; 6512   0001
        MVII    #$DE5F, R5                      ; 6513   02BD 005F 00DE
        MVII    #$000A, R0                      ; 6516   02B8 000A
        MVII    #$0002, R1                      ; 6518   02B9 0002
        B       L_6524                          ; 651A   0200 0008

        SDBD                                    ; 651C   0001
        MVII    #$DE7F, R5                      ; 651D   02BD 007F 00DE
        MVII    #$000D, R0                      ; 6520   02B8 000D
        MVII    #$0001, R1                      ; 6522   02B9 0001
L_6524:
        MVO     R1,     G_016B                  ; 6524   0241 016B
        MVO     R1,     G_016D                  ; 6526   0241 016D
        MVII    #$0000, R1                      ; 6528   02B9 0000
        MVO     R1,     G_016A                  ; 652A   0241 016A
        MVO     R1,     G_016C                  ; 652C   0241 016C
        MVO     R1,     .STIC.BORD              ; 652E   0241 002C
        MVI     G_0188, R1                      ; 6530   0281 0188
        TSTR    R1                              ; 6532   0089
        BEQ     L_6537                          ; 6533   0204 0002

        MVII    #$000C, R0                      ; 6535   02B8 000C
L_6537:
        MVO     R0,     G_0106                  ; 6537   0240 0106

        JSRD    R4,     X_NEW_GRAM_INIT         ; 6539   0004 001E 0335

        MVII    #$0001, R0                      ; 653C   02B8 0001
        MVO     R0,     G_01B5                  ; 653E   0240 01B5
        MVI     G_01B7, R0                      ; 6540   0280 01B7
        MVI     G_01B8, R1                      ; 6542   0281 01B8
        MVO     R0,     .ISRVEC.0               ; 6544   0240 0100
        MVO     R1,     .ISRVEC.1               ; 6546   0241 0101
        PULR    R7                              ; 6548   02B7

        DECLE   $0006,  $0004,  $0002,  $0000   ; 6549   0006 0004 0002 0000
        DECLE   $000E,  $0010,  $0016,  $0018   ; 654D   000E 0010 0016 0018
        DECLE   $001E,  $0000,  $0002,  $0000   ; 6551   001E 0000 0002 0000
        DECLE   $000E,  $0012,  $0016,  $001A   ; 6555   000E 0012 0016 001A
        DECLE   $0000,  $0000,  $0002,  $0000   ; 6559   0000 0000 0002 0000

        INCR    R6                              ; 655D   000E
        DECR    R4                              ; 655E   0014
        DECR    R6                              ; 655F   0016
        COMR    R4                              ; 6560   001C
L_6561:
        PSHR    R5                              ; 6561   0275
        MVI     G_0193, R0                      ; 6562   0280 0193
        TSTR    R0                              ; 6564   0080
        BNEQ    L_65B1                          ; 6565   020C 004A

L_6567:
        MVI     G_0196, R0                      ; 6567   0280 0196
        TSTR    R0                              ; 6569   0080
        BNEQ    L_65CF                          ; 656A   020C 0063

L_656C:
        MVI     G_019A, R0                      ; 656C   0280 019A
        TSTR    R0                              ; 656E   0080
        BNEQ    L_6612                          ; 656F   020C 00A1

L_6571:
        MVI     G_019C, R0                      ; 6571   0280 019C
        TSTR    R0                              ; 6573   0080
        BNEQ    L_662A                          ; 6574   020C 00B4

L_6576:
        MVI     G_019E, R0                      ; 6576   0280 019E
        TSTR    R0                              ; 6578   0080
        BNEQ    L_6652                          ; 6579   020C 00D7

        MVII    #$0000, R0                      ; 657B   02B8 0000
        MVO     R0,     G_016A                  ; 657D   0240 016A
        MVO     R0,     G_016C                  ; 657F   0240 016C
L_6581:
        MVI     G_019D, R0                      ; 6581   0280 019D
        CMPI    #$0001, R0                      ; 6583   0378 0001
        BLT     L_658C                          ; 6585   0205 0005
        BEQ     L_665F                          ; 6587   0204 00D6

L_6589:
        DECR    R0                              ; 6589   0010
        MVO     R0,     G_019D                  ; 658A   0240 019D
L_658C:
        MVI     G_01A0, R0                      ; 658C   0280 01A0
        CMPI    #$0001, R0                      ; 658E   0378 0001
        BLT     L_6599                          ; 6590   0205 0007
        BEQ     L_667D                          ; 6592   0204 00E9

L_6594:
        MVI     G_01A0, R0                      ; 6594   0280 01A0
        DECR    R0                              ; 6596   0010
        MVO     R0,     G_01A0                  ; 6597   0240 01A0
L_6599:
        MVI     G_01A6, R0                      ; 6599   0280 01A6
        CMPI    #$0001, R0                      ; 659B   0378 0001
        BLT     L_65A4                          ; 659D   0205 0005
        BEQ     L_65A5                          ; 659F   0204 0004

        DECR    R0                              ; 65A1   0010
L_65A2:
        MVO     R0,     G_01A6                  ; 65A2   0240 01A6
L_65A4:
        PULR    R7                              ; 65A4   02B7

L_65A5:
        MVII    #$0005, R0                      ; 65A5   02B8 0005
        MVO     R0,     G_01A3                  ; 65A7   0240 01A3

        JSR     R5,     L_5370                  ; 65A9   0004 0150 0370
        DECLE   $0022,  $0001                   ; 65AC   0022 0001

        CLRR    R0                              ; 65AE   01C0
        B       L_65A2                          ; 65AF   0220 000E

L_65B1:
        MVI     G_0192, R0                      ; 65B1   0280 0192
        TSTR    R0                              ; 65B3   0080
        BEQ     L_65BF                          ; 65B4   0204 0009

        CMPI    #$000A, R0                      ; 65B6   0378 000A
        BEQ     L_65C4                          ; 65B8   0204 000A

L_65BA:
        DECR    R0                              ; 65BA   0010
        MVO     R0,     G_0192                  ; 65BB   0240 0192
        B       L_6567                          ; 65BD   0220 0057

L_65BF:
        CLRR    R0                              ; 65BF   01C0
        MVO     R0,     G_0193                  ; 65C0   0240 0193
        B       L_6567                          ; 65C2   0220 005C

L_65C4:
        CLRR    R3                              ; 65C4   01DB
        MVO     R3,     G_015D                  ; 65C5   0243 015D
        SDBD                                    ; 65C7   0001
        MVII    #$0400, R3                      ; 65C8   02BB 0000 0004
        MVO     R3,     G_0329                  ; 65CB   0243 0329
        B       L_65BA                          ; 65CD   0220 0014

L_65CF:
        MVI     G_0195, R0                      ; 65CF   0280 0195
        TSTR    R0                              ; 65D1   0080
        BEQ     L_65DC                          ; 65D2   0204 0008

        DECR    R0                              ; 65D4   0010
        MVO     R0,     G_0195                  ; 65D5   0240 0195

        JSR     R5,     L_DF22                  ; 65D7   0004 01DC 0322

        B       L_656C                          ; 65DA   0220 006F

L_65DC:
        CLRR    R0                              ; 65DC   01C0
        MVO     R0,     G_0196                  ; 65DD   0240 0196
        CLRR    R3                              ; 65DF   01DB
        MVO     R3,     G_015D                  ; 65E0   0243 015D
        MVI     G_01B4, R0                      ; 65E2   0280 01B4
        INCR    R0                              ; 65E4   0008
        MVO     R0,     G_01B4                  ; 65E5   0240 01B4

        JSR     R5,     L_6436                  ; 65E7   0004 0164 0036
        JSR     R5,     L_D210                  ; 65EA   0004 01D0 0210
        JSR     R5,     L_D36C                  ; 65ED   0004 01D0 036C

        MVII    #$0058, R0                      ; 65F0   02B8 0058
        SWAP    R0,     1                       ; 65F2   0040
        MVO     R0,     G_0327                  ; 65F3   0240 0327
        MVII    #$0058, R0                      ; 65F5   02B8 0058
        SWAP    R0,     1                       ; 65F7   0040
        MVO     R0,     G_0326                  ; 65F8   0240 0326
        SDBD                                    ; 65FA   0001
        MVII    #$0400, R0                      ; 65FB   02B8 0000 0004
        NEGR    R0                              ; 65FE   0020
        MVO     R0,     G_0329                  ; 65FF   0240 0329
        MVII    #$000B, R0                      ; 6601   02B8 000B

        JSR     R5,     X_RAND1                 ; 6603   0004 0114 027D

        SARC    R0,     1                       ; 6606   0078
        ADCR    R7                              ; 6607   002F

        NEGR    R0                              ; 6608   0020
L_6609:
        TSTR    R0                              ; 6609   0080
        BNEQ    L_660E                          ; 660A   020C 0002

        ADDI    #$0200, R0                      ; 660C   02F8 0200
L_660E:
        MVO     R0,     G_0328                  ; 660E   0240 0328
        B       L_656C                          ; 6610   0220 00A5

L_6612:
        MVI     G_0199, R0                      ; 6612   0280 0199
        DECR    R0                              ; 6614   0010
        BEQ     L_661B                          ; 6615   0204 0004

        MVO     R0,     G_0199                  ; 6617   0240 0199
        B       L_6571                          ; 6619   0220 00A9

L_661B:
        CLRR    R0                              ; 661B   01C0
        MVO     R0,     G_0197                  ; 661C   0240 0197
        MVO     R0,     G_0198                  ; 661E   0240 0198
        MVO     R0,     G_019A                  ; 6620   0240 019A

        JSR     R5,     L_D14B                  ; 6622   0004 01D0 014B
        JSR     R5,     L_DF08                  ; 6625   0004 01DC 0308

        B       L_6571                          ; 6628   0220 00B8

L_662A:
        MVI     G_019B, R0                      ; 662A   0280 019B
        TSTR    R0                              ; 662C   0080
        BEQ     L_6634                          ; 662D   0204 0005

        DECR    R0                              ; 662F   0010
        MVO     R0,     G_019B                  ; 6630   0240 019B
        B       L_6576                          ; 6632   0220 00BD

L_6634:
        MVII    #$02F9, R0                      ; 6634   02B8 02F9
        MVII    #$0237, R1                      ; 6636   02B9 0237
        MVO@    R0,     R1                      ; 6638   0248
        MVII    #$024B, R1                      ; 6639   02B9 024B
        MVO@    R0,     R1                      ; 663B   0248
        SDBD                                    ; 663C   0001
        MVII    #$080F, R0                      ; 663D   02B8 000F 0008
        MVII    #$024A, R1                      ; 6640   02B9 024A
        MVO@    R0,     R1                      ; 6642   0248
        SDBD                                    ; 6643   0001
        MVII    #$080E, R0                      ; 6644   02B8 000E 0008
        MVII    #$025F, R1                      ; 6647   02B9 025F
        MVO@    R0,     R1                      ; 6649   0248
        CLRR    R0                              ; 664A   01C0
        MVO     R0,     G_019C                  ; 664B   0240 019C

        JSR     R5,     L_DF08                  ; 664D   0004 01DC 0308

        B       L_6576                          ; 6650   0220 00DB

L_6652:
        DECR    R0                              ; 6652   0010
        MVO     R0,     G_019E                  ; 6653   0240 019E
        MVII    #$0007, R0                      ; 6655   02B8 0007
        XOR     G_016A, R0                      ; 6657   03C0 016A
        MVO     R0,     G_016A                  ; 6659   0240 016A
        MVO     R0,     G_016C                  ; 665B   0240 016C
        B       L_6581                          ; 665D   0220 00DD

L_665F:
        JSR     R5,     L_5370                  ; 665F   0004 0150 0370
        DECLE   $0020,  $0003                   ; 6662   0020 0003

        SDBD                                    ; 6664   0001
        MVII    #$669A, R5                      ; 6665   02BD 009A 0066
        SDBD                                    ; 6668   0001
        MVII    #$66A4, R4                      ; 6669   02BC 00A4 0066
L_666C:
        MVI@    R4,     R1                      ; 666C   02A1
        TSTR    R1                              ; 666D   0089
        BEQ     L_6677                          ; 666E   0204 0007

        ADDI    #$0200, R1                      ; 6670   02F9 0200
        SDBD                                    ; 6672   0001
        MVI@    R5,     R0                      ; 6673   02A8
        MVO@    R0,     R1                      ; 6674   0248
        B       L_666C                          ; 6675   0220 000A

L_6677:
        MVI     G_019D, R0                      ; 6677   0280 019D
        MVO     R0,     G_01A5                  ; 6679   0240 01A5
        B       L_6589                          ; 667B   0220 00F3

L_667D:
        SDBD                                    ; 667D   0001
        MVII    #$181C, R0                      ; 667E   02B8 001C 0018
        MVII    #$0255, R1                      ; 6681   02B9 0255
        MVO@    R0,     R1                      ; 6683   0248
        MVII    #$025E, R1                      ; 6684   02B9 025E
        MVO@    R0,     R1                      ; 6686   0248
        SDBD                                    ; 6687   0001
        MVII    #$180C, R0                      ; 6688   02B8 000C 0018
        MVII    #$026B, R1                      ; 668B   02B9 026B
        MVO@    R0,     R1                      ; 668D   0248
        SDBD                                    ; 668E   0001
        MVII    #$1814, R0                      ; 668F   02B8 0014 0018
        MVII    #$0270, R1                      ; 6692   02B9 0270
        MVO@    R0,     R1                      ; 6694   0248

        JSR     R5,     L_DF08                  ; 6695   0004 01DC 0308

        B       L_6594                          ; 6698   0220 0105

        DECLE   $0039,  $0004,  $0051,  $0008   ; 669A   0039 0004 0051 0008
        DECLE   $0021,  $0084,  $0000,  $00C0   ; 669E   0021 0084 0000 00C0
        DECLE   $0001,  $0004,  $0026,  $0039   ; 66A2   0001 0004 0026 0039
        DECLE   $003A,  $004D,  $004E,  $0000   ; 66A6   003A 004D 004E 0000
L_66AA:
        PSHR    R5                              ; 66AA   0275
        MVI     G_01B4, R0                      ; 66AB   0280 01B4
        CMPI    #$0001, R0                      ; 66AD   0378 0001
        BGE     L_6752                          ; 66AF   020D 00A1

        MVO     R0,     G_0328                  ; 66B1   0240 0328
        MVO     R0,     G_0329                  ; 66B3   0240 0329
        MVO     R0,     G_0326                  ; 66B5   0240 0326
        MVO     R0,     G_0327                  ; 66B7   0240 0327
        MVI     G_018B, R1                      ; 66B9   0281 018B
        TSTR    R1                              ; 66BB   0089
        BEQ     L_66CB                          ; 66BC   0204 000D

        CLRR    R0                              ; 66BE   01C0
        MVO     R0,     G_018B                  ; 66BF   0240 018B
        MVI     G_033C, R0                      ; 66C1   0280 033C
        XORI    #$0001, R0                      ; 66C3   03F8 0001
        MVO     R0,     G_033C                  ; 66C5   0240 033C
        MVII    #$0007, R0                      ; 66C7   02B8 0007
        MVO     R0,     G_0162                  ; 66C9   0240 0162
L_66CB:
        MVI     G_0162, R0                      ; 66CB   0280 0162
        MVI     G_01AC, R1                      ; 66CD   0281 01AC
        TSTR    R1                              ; 66CF   0089
        BEQ     L_66D6                          ; 66D0   0204 0004

        MVO     R0,     G_01A9                  ; 66D2   0240 01A9
        B       L_66D8                          ; 66D4   0200 0002

L_66D6:
        MVO     R0,     G_01A8                  ; 66D6   0240 01A8
L_66D8:
        MVI     G_01AA, R0                      ; 66D8   0280 01AA
        TSTR    R0                              ; 66DA   0080
        BEQ     L_66E2                          ; 66DB   0204 0005

        JSR     R5,     L_6776                  ; 66DD   0004 0164 0376

        B       L_6735                          ; 66E0   0200 0053

L_66E2:
        MVI     G_01AB, R0                      ; 66E2   0280 01AB
        MVI     G_0161, R3                      ; 66E4   0283 0161
        CMPI    #$0002, R3                      ; 66E6   037B 0002
        BEQ     L_6739                          ; 66E8   0204 004F
        B       L_6729                          ; 66EA   0200 003D

L_66EC:
        MVII    #$0080, R0                      ; 66EC   02B8 0080
        MVO     R0,     G_0126                  ; 66EE   0240 0126
        MVO     R0,     G_0128                  ; 66F0   0240 0128
        MVO     R0,     G_012A                  ; 66F2   0240 012A
        MVII    #$0005, R3                      ; 66F4   02BB 0005
        MVII    #$0294, R4                      ; 66F6   02BC 0294

        JSR     R5,     X_PRINT_R5              ; 66F8   0004 0118 007B
        STRING  "GAME"                          ; 66FB   0047 0041 004D 0045
        DECLE   $0000                           ; 66FF   0000

        MVII    #$0005, R3                      ; 6700   02BB 0005
        MVII    #$02A8, R4                      ; 6702   02BC 02A8

        JSR     R5,     X_PRINT_R5              ; 6704   0004 0118 007B
        STRING  "OVER"                          ; 6707   004F 0056 0045 0052
        DECLE   $0000                           ; 670B   0000

        CLRR    R0                              ; 670C   01C0
        MVO     R0,     G_0326                  ; 670D   0240 0326
        MVO     R0,     G_0327                  ; 670F   0240 0327
        INCR    R0                              ; 6711   0008
        MVO     R0,     G_015D                  ; 6712   0240 015D
        MVI     G_0347, R0                      ; 6714   0280 0347
        MVI     G_0348, R1                      ; 6716   0281 0348

        JSR     R5,     L_D47B                  ; 6718   0004 01D4 007B

        MVI     G_0349, R0                      ; 671B   0280 0349
        MVI     G_034A, R1                      ; 671D   0281 034A

        JSR     R5,     L_D47B                  ; 671F   0004 01D4 007B

        SDBD                                    ; 6722   0001
        MVII    #$67C9, R0                      ; 6723   02B8 00C9 0067
        MVO     R0,     G_035D                  ; 6726   0240 035D
        PULR    R7                              ; 6728   02B7

L_6729:
        JSR     R5,     L_6776                  ; 6729   0004 0164 0376

L_672C:
        MVI     G_01AB, R0                      ; 672C   0280 01AB
        CMPI    #$0004, R0                      ; 672E   0378 0004
        BGE     L_66EC                          ; 6730   022D 0045

        INCR    R0                              ; 6732   0008
        MVO     R0,     G_01AB                  ; 6733   0240 01AB

L_6735:
        JSR     R5,     L_D192                  ; 6735   0004 01D0 0192

        PULR    R7                              ; 6738   02B7

L_6739:
        MVI     G_01AC, R2                      ; 6739   0282 01AC
        TSTR    R2                              ; 673B   0092
        BNEQ    L_6748                          ; 673C   020C 000A

        PSHR    R2                              ; 673E   0272

        JSR     R5,     L_6776                  ; 673F   0004 0164 0376

        PULR    R2                              ; 6742   02B2
        INCR    R2                              ; 6743   000A
        MVO     R2,     G_01AC                  ; 6744   0242 01AC
        B       L_6735                          ; 6746   0220 0012

L_6748:
        PSHR    R2                              ; 6748   0272

        JSR     R5,     L_6776                  ; 6749   0004 0164 0376

        PULR    R2                              ; 674C   02B2
        DECR    R2                              ; 674D   0012
        MVO     R2,     G_01AC                  ; 674E   0242 01AC
        B       L_672C                          ; 6750   0220 0025

L_6752:
        DECR    R0                              ; 6752   0010
        MVO     R0,     G_01B4                  ; 6753   0240 01B4

        JSR     R5,     L_6436                  ; 6755   0004 0164 0036
        JSR     R5,     L_D210                  ; 6758   0004 01D0 0210

        MVII    #$0058, R0                      ; 675B   02B8 0058
        SWAP    R0,     1                       ; 675D   0040
        MVO     R0,     G_0326                  ; 675E   0240 0326
        MVII    #$000A, R0                      ; 6760   02B8 000A
        SWAP    R0,     1                       ; 6762   0040
        MVO     R0,     G_0327                  ; 6763   0240 0327
        MVI     G_0329, R0                      ; 6765   0280 0329
        SAR     R0,     2                       ; 6767   006C
        MVO     R0,     G_0329                  ; 6768   0240 0329
        MVI     G_0328, R0                      ; 676A   0280 0328
        SAR     R0,     2                       ; 676C   006C
        MVO     R0,     G_0328                  ; 676D   0240 0328

        JSR     R5,     X_STOP_SFX              ; 676F   0004 011C 02B4
        JSR     R5,     L_D36C                  ; 6772   0004 01D0 036C

        PULR    R7                              ; 6775   02B7

L_6776:
        PSHR    R5                              ; 6776   0275
        MVI     G_0188, R0                      ; 6777   0280 0188
        TSTR    R0                              ; 6779   0080
        BEQ     L_6785                          ; 677A   0204 0009

        CLRR    R0                              ; 677C   01C0
        MVO     R0,     G_018D                  ; 677D   0240 018D
        MVO     R0,     G_01AA                  ; 677F   0240 01AA
        INCR    R0                              ; 6781   0008
        MVO     R0,     G_018C                  ; 6782   0240 018C
        PULR    R7                              ; 6784   02B7

L_6785:
        MVI     G_018D, R0                      ; 6785   0280 018D
        MVO     R0,     G_0189                  ; 6787   0240 0189
L_6789:
        MVI     G_018D, R0                      ; 6789   0280 018D
        TSTR    R0                              ; 678B   0080
        BEQ     L_67B6                          ; 678C   0204 0028

        DECR    R0                              ; 678E   0010
        MVO     R0,     G_018D                  ; 678F   0240 018D

        JSR     R5,     L_D24F                  ; 6791   0004 01D0 024F
        JSR     R5,     L_DF5D                  ; 6794   0004 01DC 035D

        MVII    #$0028, R2                      ; 6797   02BA 0028
L_6799:
        MVII    #$0019, R0                      ; 6799   02B8 0019

        JSR     R5,     L_D3D6                  ; 679B   0004 01D0 03D6

        PSHR    R2                              ; 679E   0272

        JSR     R5,     L_6E44                  ; 679F   0004 016C 0244

        PULR    R2                              ; 67A2   02B2
        MVI     G_0188, R0                      ; 67A3   0280 0188
        TSTR    R0                              ; 67A5   0080
        BEQ     L_67B1                          ; 67A6   0204 0009

        CLRR    R0                              ; 67A8   01C0
        MVO     R0,     G_018D                  ; 67A9   0240 018D
        MVO     R0,     G_01AA                  ; 67AB   0240 01AA
        INCR    R0                              ; 67AD   0008
        MVO     R0,     G_018C                  ; 67AE   0240 018C
        PULR    R7                              ; 67B0   02B7

L_67B1:
        DECR    R2                              ; 67B1   0012
        BNEQ    L_6799                          ; 67B2   022C 001A
        B       L_6789                          ; 67B4   0220 002C

L_67B6:
        MVI     G_018C, R0                      ; 67B6   0280 018C
        CMPI    #$0001, R0                      ; 67B8   0378 0001
        BGT     L_67BD                          ; 67BA   020E 0001
        PULR    R7                              ; 67BC   02B7

L_67BD:
        DECR    R0                              ; 67BD   0010
        MVO     R0,     G_018C                  ; 67BE   0240 018C
        MVI     G_0189, R0                      ; 67C0   0280 0189
        MVO     R0,     G_018D                  ; 67C2   0240 018D

        JSR     R5,     L_D248                  ; 67C4   0004 01D0 0248

        B       L_6789                          ; 67C7   0220 003F

        DECLE   $0000,  $0000,  $0000,  $0000   ; 67C9   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0000,  $0010   ; 67CD   0000 0010 0000 0010
        DECLE   $0000                           ; 67D1   0000

        DECR    R0                              ; 67D2   0010
L_67D3:
        PSHR    R5                              ; 67D3   0275
        MVI     G_0188, R0                      ; 67D4   0280 0188
        TSTR    R0                              ; 67D6   0080
        BEQ     L_67E8                          ; 67D7   0204 000F

        MVI     G_01B4, R0                      ; 67D9   0280 01B4
        TSTR    R0                              ; 67DB   0080
        BNEQ    L_6832                          ; 67DC   020C 0054

        MVII    #$00C0, R0                      ; 67DE   02B8 00C0
        SWAP    R0,     1                       ; 67E0   0040
        MVII    #$02B8, R1                      ; 67E1   02B9 02B8
        MVO@    R0,     R1                      ; 67E3   0248
        MVII    #$02C3, R1                      ; 67E4   02B9 02C3
        MVO@    R0,     R1                      ; 67E6   0248
        PULR    R7                              ; 67E7   02B7

L_67E8:
        MVI     G_0173, R1                      ; 67E8   0281 0173

        JSR     R5,     L_6D8E                  ; 67EA   0004 016C 018E

        MVI     G_017C, R2                      ; 67ED   0282 017C
        MVI     G_01B4, R0                      ; 67EF   0280 01B4
        CMPI    #$0001, R0                      ; 67F1   0378 0001
        BEQ     L_699E                          ; 67F3   0204 01A9
        BGT     L_6BB6                          ; 67F5   020E 03BF

        CMPI    #$0001, R2                      ; 67F7   037A 0001
        BLE     L_692A                          ; 67F9   0206 012F

        SDBD                                    ; 67FB   0001
        MVII    #$6DA3, R4                      ; 67FC   02BC 00A3 006D
        B       L_6BBE                          ; 67FF   0200 03BD

L_6801:
        CMPI    #$002D, R3                      ; 6801   037B 002D
L_6803:
        BNEQ    L_6833                          ; 6803   020C 002E

        MVI     G_0190, R0                      ; 6805   0280 0190
        TSTR    R0                              ; 6807   0080
        BNEQ    L_680E                          ; 6808   020C 0004

        JSR     R5,     L_D2DD                  ; 680A   0004 01D0 02DD
        DECLE   $0001                           ; 680D   0001
L_680E:
        MVII    #$0003, R0                      ; 680E   02B8 0003
        MVO     R0,     G_0190                  ; 6810   0240 0190

        JSR     R5,     L_D256                  ; 6812   0004 01D0 0256

        SDBD                                    ; 6815   0001
        MVII    #$08DF, R0                      ; 6816   02B8 00DF 0008
        MVII    #$02B8, R1                      ; 6819   02B9 02B8
        MVO@    R0,     R1                      ; 681B   0248
        SDBD                                    ; 681C   0001
        MVII    #$286E, R0                      ; 681D   02B8 006E 0028
        MVII    #$022C, R1                      ; 6820   02B9 022C
        SDBD                                    ; 6822   0001
        MVII    #$0816, R2                      ; 6823   02BA 0016 0008
        MVII    #$022D, R3                      ; 6826   02BB 022D
L_6828:
        MVO@    R0,     R1                      ; 6828   0248
        MVO@    R2,     R3                      ; 6829   025A
        MVII    #$0032, R0                      ; 682A   02B8 0032

        JSR     R5,     L_D3D6                  ; 682C   0004 01D0 03D6
        JSR     R5,     L_DF99                  ; 682F   0004 01DC 0399

L_6832:
        PULR    R7                              ; 6832   02B7

L_6833:
        CMPI    #$002E, R3                      ; 6833   037B 002E
        BNEQ    L_685C                          ; 6835   020C 0025

        MVI     G_0191, R0                      ; 6837   0280 0191
        TSTR    R0                              ; 6839   0080
        BNEQ    L_6840                          ; 683A   020C 0004

        JSR     R5,     L_D2DD                  ; 683C   0004 01D0 02DD
        DECLE   $0001                           ; 683F   0001
L_6840:
        MVII    #$0003, R0                      ; 6840   02B8 0003
        MVO     R0,     G_0191                  ; 6842   0240 0191

        JSR     R5,     L_D260                  ; 6844   0004 01D0 0260
        DECLE   $0001,  $02B8,  $002F,  $0008   ; 6847   0001 02B8 002F 0008
        DECLE   $02B9,  $02C3,  $0248,  $0001   ; 684B   02B9 02C3 0248 0001

        MVII    #$00C6, R0                      ; 684F   02B8 00C6
        ADCR    R0                              ; 6851   0028
        MVII    #$0236, R1                      ; 6852   02B9 0236
        SDBD                                    ; 6854   0001
        MVII    #$091E, R2                      ; 6855   02BA 001E 0009
        MVII    #$0237, R3                      ; 6858   02BB 0237
        B       L_6828                          ; 685A   0220 0033

L_685C:
        CMPI    #$0017, R3                      ; 685C   037B 0017
        BNEQ    L_689C                          ; 685E   020C 003C

        SDBD                                    ; 6860   0001
        MVII    #$0805, R0                      ; 6861   02B8 0005 0008
        ADDI    #$0200, R1                      ; 6864   02F9 0200
        MVO@    R0,     R1                      ; 6866   0248
        MVII    #$0064, R0                      ; 6867   02B8 0064

        JSR     R5,     L_D3D6                  ; 6869   0004 01D0 03D6
        JSR     R5,     L_DEB0                  ; 686C   0004 01DC 02B0

        MVII    #$0052, R1                      ; 686F   02B9 0052

        JSR     R5,     L_6D8E                  ; 6871   0004 016C 018E

        MOVR    R3,     R4                      ; 6874   009C
        MVII    #$0065, R1                      ; 6875   02B9 0065

        JSR     R5,     L_6D8E                  ; 6877   0004 016C 018E

        ADDR    R4,     R3                      ; 687A   00E3
        TSTR    R3                              ; 687B   009B
        BNEQ    L_6832                          ; 687C   022C 004B

        MVII    #$0001, R0                      ; 687E   02B8 0001
        MVO     R0,     G_0197                  ; 6880   0240 0197
        SDBD                                    ; 6882   0001
        MVII    #$0896, R0                      ; 6883   02B8 0096 0008
        MVII    #$0258, R1                      ; 6886   02B9 0258
        MVO@    R0,     R1                      ; 6888   0248
L_6889:
        MVI     G_0197, R0                      ; 6889   0280 0197
        ADD     G_0198, R0                      ; 688B   02C0 0198
        CMPI    #$0002, R0                      ; 688D   0378 0002
        BNEQ    L_6832                          ; 688F   022C 005E

        MVII    #$00C8, R0                      ; 6891   02B8 00C8
        MVO     R0,     G_0199                  ; 6893   0240 0199
        MVO     R0,     G_019A                  ; 6895   0240 019A

        JSR     R5,     L_D2DD                  ; 6897   0004 01D0 02DD
        DECLE   $0001                           ; 689A   0001

        PULR    R7                              ; 689B   02B7

L_689C:
        CMPI    #$0001, R3                      ; 689C   037B 0001
        BNEQ    L_68CC                          ; 689E   020C 002C

        SDBD                                    ; 68A0   0001
        MVII    #$08B5, R0                      ; 68A1   02B8 00B5 0008
        ADDI    #$0200, R1                      ; 68A4   02F9 0200
        MVO@    R0,     R1                      ; 68A6   0248
        MVII    #$0064, R0                      ; 68A7   02B8 0064

        JSR     R5,     L_D3D6                  ; 68A9   0004 01D0 03D6
        JSR     R5,     L_DEB0                  ; 68AC   0004 01DC 02B0

        MVII    #$0061, R1                      ; 68AF   02B9 0061

        JSR     R5,     L_6D8E                  ; 68B1   0004 016C 018E

        MOVR    R3,     R4                      ; 68B4   009C
        MVII    #$0076, R1                      ; 68B5   02B9 0076

        JSR     R5,     L_6D8E                  ; 68B7   0004 016C 018E

        ADDR    R4,     R3                      ; 68BA   00E3
        CMPI    #$002C, R3                      ; 68BB   037B 002C
        BNEQ    L_6832                          ; 68BD   022C 008C

        MVII    #$0001, R0                      ; 68BF   02B8 0001
        MVO     R0,     G_0198                  ; 68C1   0240 0198
        SDBD                                    ; 68C3   0001
        MVII    #$0896, R0                      ; 68C4   02B8 0096 0008
        MVII    #$025B, R1                      ; 68C7   02B9 025B
        MVO@    R0,     R1                      ; 68C9   0248
        B       L_6889                          ; 68CA   0220 0042

L_68CC:
        CMPI    #$0005, R3                      ; 68CC   037B 0005
        BNEQ    L_68FF                          ; 68CE   020C 002F

        MVI     G_0191, R0                      ; 68D0   0280 0191
        DECR    R0                              ; 68D2   0010
        CMPI    #$0001, R0                      ; 68D3   0378 0001
        BGT     L_68E5                          ; 68D5   020E 000E
        BLT     L_68E1                          ; 68D7   0205 0008

        MVII    #$02C3, R1                      ; 68D9   02B9 02C3
        MVI@    R1,     R2                      ; 68DB   028A
        XORI    #$0005, R2                      ; 68DC   03FA 0005
        MVO@    R2,     R1                      ; 68DE   024A
        B       L_68E5                          ; 68DF   0200 0004

L_68E1:
        JSR     R5,     L_D3A4                  ; 68E1   0004 01D0 03A4

        CLRR    R0                              ; 68E4   01C0
L_68E5:
        MVO     R0,     G_0191                  ; 68E5   0240 0191
        MVII    #$0088, R2                      ; 68E7   02BA 0088
        MVII    #$0054, R3                      ; 68E9   02BB 0054
        MVII    #$03E8, R0                      ; 68EB   02B8 03E8
L_68ED:
        MVO     R0,     G_0328                  ; 68ED   0240 0328
        SDBD                                    ; 68EF   0001
        MVII    #$FA24, R0                      ; 68F0   02B8 0024 00FA
        MVO     R0,     G_0329                  ; 68F3   0240 0329
        SWAP    R2,     1                       ; 68F5   0042
        SWAP    R3,     1                       ; 68F6   0043
        MVO     R2,     G_0326                  ; 68F7   0242 0326
        MVO     R3,     G_0327                  ; 68F9   0243 0327

        JSR     R5,     L_DEF4                  ; 68FB   0004 01DC 02F4

        PULR    R7                              ; 68FE   02B7

L_68FF:
        CMPI    #$001B, R3                      ; 68FF   037B 001B
        BNEQ    L_6924                          ; 6901   020C 0021

        MVI     G_0190, R0                      ; 6903   0280 0190
        DECR    R0                              ; 6905   0010
        CMPI    #$0001, R0                      ; 6906   0378 0001
        BGT     L_6918                          ; 6908   020E 000E
        BLT     L_6914                          ; 690A   0205 0008

        MVII    #$02B8, R1                      ; 690C   02B9 02B8
        MVI@    R1,     R2                      ; 690E   028A
        XORI    #$0005, R2                      ; 690F   03FA 0005
        MVO@    R2,     R1                      ; 6911   024A
        B       L_6918                          ; 6912   0200 0004

L_6914:
        JSR     R5,     L_D3BD                  ; 6914   0004 01D0 03BD

        CLRR    R0                              ; 6917   01C0
L_6918:
        MVO     R0,     G_0190                  ; 6918   0240 0190
        SDBD                                    ; 691A   0001
        MVII    #$FC18, R0                      ; 691B   02B8 0018 00FC
        MVII    #$0026, R2                      ; 691E   02BA 0026
        MVII    #$0054, R3                      ; 6920   02BB 0054
        B       L_68ED                          ; 6922   0220 0036

L_6924:
        SDBD                                    ; 6924   0001
        MVII    #$6DD1, R4                      ; 6925   02BC 00D1 006D
        B       L_6A6B                          ; 6928   0200 0141

L_692A:
        MVI     G_0172, R0                      ; 692A   0280 0172
        MVI     G_0194, R1                      ; 692C   0281 0194
        TSTR    R1                              ; 692E   0089
        BEQ     L_693D                          ; 692F   0204 000C

        CMPI    #$0009, R0                      ; 6931   0378 0009
        BNEQ    L_6939                          ; 6933   020C 0004

L_6935:
        JSR     R5,     L_D27B                  ; 6935   0004 01D0 027B

        PULR    R7                              ; 6938   02B7

L_6939:
        CMPI    #$000A, R0                      ; 6939   0378 000A
        BEQ     L_6935                          ; 693B   0224 0007

L_693D:
        CMPI    #$004C, R0                      ; 693D   0378 004C
        BNEQ    L_6950                          ; 693F   020C 000F

        MVI     G_0329, R0                      ; 6941   0280 0329
        MOVR    R0,     R1                      ; 6943   0081
        BPL     L_6947                          ; 6944   0203 0001

        NEGR    R1                              ; 6946   0021
L_6947:
        SWAP    R1,     1                       ; 6947   0041
        ANDI    #$00FF, R1                      ; 6948   03B9 00FF
        INCR    R1                              ; 694A   0009
        SLL     R1,     2                       ; 694B   004D
        SLL     R1,     1                       ; 694C   0049
        MVO     R1,     G_01A2                  ; 694D   0241 01A2
        PULR    R7                              ; 694F   02B7

L_6950:
        CMPI    #$001B, R0                      ; 6950   0378 001B
        BNEQ    L_6971                          ; 6952   020C 001D

        MVII    #$0020, R2                      ; 6954   02BA 0020
L_6956:
        MOVR    R0,     R1                      ; 6956   0081
        ADDI    #$0200, R1                      ; 6957   02F9 0200
        SDBD                                    ; 6959   0001
        MVII    #$088F, R0                      ; 695A   02B8 008F 0008
        MVO@    R0,     R1                      ; 695D   0248
        ADDI    #$0200, R2                      ; 695E   02FA 0200
        MVI@    R2,     R2                      ; 6960   0292
        ANDI    #$0007, R2                      ; 6961   03BA 0007
        CMPI    #$0007, R2                      ; 6963   037A 0007
        BNEQ    L_6832                          ; 6965   022C 0134

        JSR     R5,     L_5370                  ; 6967   0004 0150 0370
        DECLE   $000A,  $0003                   ; 696A   000A 0003

        MVII    #$0001, R0                      ; 696C   02B8 0001
        MVO     R0,     G_0194                  ; 696E   0240 0194
        PULR    R7                              ; 6970   02B7

L_6971:
        CMPI    #$0020, R0                      ; 6971   0378 0020
        BNEQ    L_6979                          ; 6973   020C 0004

        MVII    #$001B, R2                      ; 6975   02BA 001B
        B       L_6956                          ; 6977   0220 0022

L_6979:
        CMPI    #$0018, R0                      ; 6979   0378 0018
        BNEQ    L_6832                          ; 697B   022C 014A

        MVI     G_0193, R0                      ; 697D   0280 0193
        TSTR    R0                              ; 697F   0080
        BNEQ    L_6832                          ; 6980   022C 014F

        MVII    #$0064, R0                      ; 6982   02B8 0064

        JSR     R5,     L_D3D6                  ; 6984   0004 01D0 03D6

        MVII    #$0001, R0                      ; 6987   02B8 0001
        MVO     R0,     G_018B                  ; 6989   0240 018B
        MVI     G_033C, R0                      ; 698B   0280 033C
        MOVR    R0,     R1                      ; 698D   0081
        ANDI    #$0007, R0                      ; 698E   03B8 0007
        CMPI    #$0007, R0                      ; 6990   0378 0007
        BNEQ    L_6998                          ; 6992   020C 0004

        XORI    #$0001, R1                      ; 6994   03F9 0001
        MVO     R1,     G_033C                  ; 6996   0241 033C
L_6998:
        MVII    #$002B, R0                      ; 6998   02B8 002B
        MVII    #$000F, R1                      ; 699A   02B9 000F
        B       L_6BA5                          ; 699C   0200 0207

L_699E:
        CMPI    #$0001, R2                      ; 699E   037A 0001
        BLE     L_6ABE                          ; 69A0   0206 011C

        CMPI    #$000D, R3                      ; 69A2   037B 000D
        BNEQ    L_69D8                          ; 69A4   020C 0032

        MOVR    R1,     R3                      ; 69A6   008B
        ADDI    #$0200, R1                      ; 69A7   02F9 0200
        MVI@    R1,     R2                      ; 69A9   028A
        XORI    #$0002, R2                      ; 69AA   03FA 0002
        MVO@    R2,     R1                      ; 69AC   024A
        PSHR    R3                              ; 69AD   0273
        MVII    #$0032, R0                      ; 69AE   02B8 0032

        JSR     R5,     L_D3D6                  ; 69B0   0004 01D0 03D6
        JSR     R5,     L_DE9D                  ; 69B3   0004 01DC 029D

        PULR    R3                              ; 69B6   02B3
        CMPI    #$002F, R3                      ; 69B7   037B 002F
        BNEQ    L_69C2                          ; 69B9   020C 0007

        MVII    #$0186, R0                      ; 69BB   02B8 0186
        MVII    #$021B, R1                      ; 69BD   02B9 021B
        MVO@    R0,     R1                      ; 69BF   0248
        B       L_6AFA                          ; 69C0   0200 0138

L_69C2:
        CMPI    #$0031, R3                      ; 69C2   037B 0031
        BNEQ    L_69CD                          ; 69C4   020C 0007

        MVII    #$014E, R0                      ; 69C6   02B8 014E
        MVII    #$021D, R1                      ; 69C8   02B9 021D
        MVO@    R0,     R1                      ; 69CA   0248
        B       L_6AFA                          ; 69CB   0200 012D

L_69CD:
        CMPI    #$0033, R3                      ; 69CD   037B 0033
        BNEQ    L_6832                          ; 69CF   022C 019E

        MVII    #$0176, R0                      ; 69D1   02B8 0176
        MVII    #$021F, R1                      ; 69D3   02B9 021F
        MVO@    R0,     R1                      ; 69D5   0248
        B       L_6AFA                          ; 69D6   0200 0122

L_69D8:
        CMPI    #$0001, R3                      ; 69D8   037B 0001
        BNEQ    L_6A30                          ; 69DA   020C 0054

        MOVR    R1,     R2                      ; 69DC   008A
        ADDI    #$0200, R1                      ; 69DD   02F9 0200
        SDBD                                    ; 69DF   0001
        MVII    #$0891, R0                      ; 69E0   02B8 0091 0008
        MVO@    R0,     R1                      ; 69E3   0248
        MVII    #$012C, R0                      ; 69E4   02B8 012C

        JSR     R5,     L_D3D6                  ; 69E6   0004 01D0 03D6

        CMPI    #$004A, R2                      ; 69E9   037A 004A
        BNEQ    L_6A25                          ; 69EB   020C 0038

        MVII    #$0237, R1                      ; 69ED   02B9 0237
        SDBD                                    ; 69EF   0001
        MVII    #$082F, R0                      ; 69F0   02B8 002F 0008
        MVO@    R0,     R1                      ; 69F3   0248
        MVII    #$024B, R1                      ; 69F4   02B9 024B
L_69F6:
        MVI@    R1,     R2                      ; 69F6   028A
        ANDI    #$0007, R0                      ; 69F7   03B8 0007
        ANDI    #$0007, R2                      ; 69F9   03BA 0007
        ADDR    R0,     R2                      ; 69FB   00C2
        CMPI    #$000E, R2                      ; 69FC   037A 000E
        BNEQ    L_6A21                          ; 69FE   020C 0021

        MVII    #$0032, R0                      ; 6A00   02B8 0032
        MVO     R0,     G_019B                  ; 6A02   0240 019B
        MVO     R0,     G_019C                  ; 6A04   0240 019C

        JSR     R5,     L_D2DD                  ; 6A06   0004 01D0 02DD
        DECLE   $0002                           ; 6A09   0002

        JSR     R5,     L_5370                  ; 6A0A   0004 0150 0370
        DECLE   $000C,  $0003                   ; 6A0D   000C 0003

        MVII    #$0001, R0                      ; 6A0F   02B8 0001
        MVO     R0,     G_0194                  ; 6A11   0240 0194
        SDBD                                    ; 6A13   0001
        MVII    #$0826, R0                      ; 6A14   02B8 0026 0008
        MVII    #$021C, R1                      ; 6A17   02B9 021C
        MVO@    R0,     R1                      ; 6A19   0248
        SDBD                                    ; 6A1A   0001
        MVII    #$08B0, R0                      ; 6A1B   02B8 00B0 0008
        MVII    #$021E, R1                      ; 6A1E   02B9 021E
        MVO@    R0,     R1                      ; 6A20   0248

L_6A21:
        JSR     R5,     L_DEB0                  ; 6A21   0004 01DC 02B0

        PULR    R7                              ; 6A24   02B7

L_6A25:
        MVII    #$024B, R1                      ; 6A25   02B9 024B
        SDBD                                    ; 6A27   0001
        MVII    #$0837, R0                      ; 6A28   02B8 0037 0008
        MVO@    R0,     R1                      ; 6A2B   0248
        MVII    #$0237, R1                      ; 6A2C   02B9 0237
        B       L_69F6                          ; 6A2E   0220 0039

L_6A30:
        CMPI    #$0013, R3                      ; 6A30   037B 0013
        BNEQ    L_6A67                          ; 6A32   020C 0033

        ADDI    #$0200, R1                      ; 6A34   02F9 0200
        SDBD                                    ; 6A36   0001
        MVII    #$0802, R0                      ; 6A37   02B8 0002 0008
        MVO@    R0,     R1                      ; 6A3A   0248
        MVII    #$012C, R0                      ; 6A3B   02B8 012C

        JSR     R5,     L_D3D6                  ; 6A3D   0004 01D0 03D6
        JSR     R5,     L_DEB0                  ; 6A40   0004 01DC 02B0
        JSR     R5,     L_D2DD                  ; 6A43   0004 01D0 02DD
        DECLE   $0001                           ; 6A46   0001

        MVII    #$0203, R1                      ; 6A47   02B9 0203
        MVI@    R1,     R1                      ; 6A49   0289
        MVII    #$0216, R2                      ; 6A4A   02BA 0216
        MVI@    R2,     R2                      ; 6A4C   0292
        MVII    #$0229, R3                      ; 6A4D   02BB 0229
        MVI@    R3,     R3                      ; 6A4F   029B
        MVII    #$023C, R4                      ; 6A50   02BC 023C
        MVI@    R4,     R4                      ; 6A52   02A4
        ANDI    #$0007, R1                      ; 6A53   03B9 0007
        ANDI    #$0007, R2                      ; 6A55   03BA 0007
        ANDI    #$0007, R3                      ; 6A57   03BB 0007
        ANDI    #$0007, R4                      ; 6A59   03BC 0007
        ADDR    R1,     R2                      ; 6A5B   00CA
        ADDR    R2,     R3                      ; 6A5C   00D3
        ADDR    R3,     R4                      ; 6A5D   00DC
        CMPI    #$0008, R4                      ; 6A5E   037C 0008
        BNEQ    L_6BE3                          ; 6A60   020C 0181

        MVII    #$0032, R0                      ; 6A62   02B8 0032
        MVO     R0,     G_01A6                  ; 6A64   0240 01A6
        PULR    R7                              ; 6A66   02B7

L_6A67:
        SDBD                                    ; 6A67   0001
        MVII    #$6DEA, R4                      ; 6A68   02BC 00EA 006D
L_6A6B:
        MOVR    R4,     R5                      ; 6A6B   00A5
L_6A6C:
        CLRR    R0                              ; 6A6C   01C0
        MVI@    R4,     R1                      ; 6A6D   02A1
        CMPI    #$0063, R1                      ; 6A6E   0379 0063
        BNEQ    L_6A76                          ; 6A70   020C 0004

L_6A72:
        JSR     R5,     L_DF71                  ; 6A72   0004 01DC 0371

        PULR    R7                              ; 6A75   02B7

L_6A76:
        CMPR    R1,     R3                      ; 6A76   014B
        BEQ     L_6A7D                          ; 6A77   0204 0004

        ADDI    #$0003, R4                      ; 6A79   02FC 0003
        B       L_6A6C                          ; 6A7B   0220 0010

L_6A7D:
        MVI     G_0173, R1                      ; 6A7D   0281 0173
L_6A7F:
        MVI@    R4,     R2                      ; 6A7F   02A2
        CMPR    R1,     R2                      ; 6A80   014A
        BEQ     L_6A8A                          ; 6A81   0204 0007

        INCR    R0                              ; 6A83   0008
        CMPI    #$0003, R0                      ; 6A84   0378 0003
        BGT     L_6A6C                          ; 6A86   022E 001B
        B       L_6A7F                          ; 6A88   0220 000A

L_6A8A:
        ADDI    #$0015, R5                      ; 6A8A   02FD 0015
        MVI@    R5,     R1                      ; 6A8C   02A9
        SLL     R1,     2                       ; 6A8D   004D
        SLL     R1,     1                       ; 6A8E   0049
        MVI@    R5,     R2                      ; 6A8F   02AA
        CMPI    #$0007, R2                      ; 6A90   037A 0007
        BGT     L_6A98                          ; 6A92   020E 0004

        MVII    #$0008, R3                      ; 6A94   02BB 0008
        B       L_6A9A                          ; 6A96   0200 0002

L_6A98:
        MVII    #$0018, R3                      ; 6A98   02BB 0018
L_6A9A:
        SWAP    R3,     1                       ; 6A9A   0043
        XORR    R3,     R1                      ; 6A9B   01D9
        XORR    R2,     R1                      ; 6A9C   01D1
        ADDR    R0,     R5                      ; 6A9D   00C5
        MVI@    R5,     R2                      ; 6A9E   02AA
        ADDI    #$0200, R2                      ; 6A9F   02FA 0200
        MVI@    R2,     R3                      ; 6AA1   0293
        MVO@    R1,     R2                      ; 6AA2   0251
        SDBD                                    ; 6AA3   0001
        ANDI    #$1007, R3                      ; 6AA4   03BB 0007 0010
        CMPI    #$0001, R3                      ; 6AA7   037B 0001
        BNEQ    L_6AB4                          ; 6AA9   020C 0009

L_6AAB:
        MVII    #$0032, R0                      ; 6AAB   02B8 0032

L_6AAD:
        JSR     R5,     L_D3D6                  ; 6AAD   0004 01D0 03D6
        JSR     R5,     L_DECB                  ; 6AB0   0004 01DC 02CB

        PULR    R7                              ; 6AB3   02B7

L_6AB4:
        SDBD                                    ; 6AB4   0001
        CMPI    #$1007, R3                      ; 6AB5   037B 0007 0010
        BEQ     L_6AAB                          ; 6AB8   0224 000E

        MVII    #$00C8, R0                      ; 6ABA   02B8 00C8
        B       L_6AAD                          ; 6ABC   0220 0010

L_6ABE:
        MVI     G_0172, R1                      ; 6ABE   0281 0172
        CMP     G_018E, R1                      ; 6AC0   0341 018E
        BEQ     L_6B35                          ; 6AC2   0204 0071

        MVO     R1,     G_018E                  ; 6AC4   0241 018E
        SDBD                                    ; 6AC6   0001
        MVII    #$6DB7, R4                      ; 6AC7   02BC 00B7 006D
L_6ACA:
        MVI@    R4,     R2                      ; 6ACA   02A2
        TSTR    R2                              ; 6ACB   0092
        BEQ     L_6B35                          ; 6ACC   0204 0067

        CMPR    R2,     R1                      ; 6ACE   0151
        BNEQ    L_6ACA                          ; 6ACF   022C 0006

        JSR     R5,     L_6D8E                  ; 6AD1   0004 016C 018E

        CMPI    #$000B, R3                      ; 6AD4   037B 000B
        BEQ     L_6AE0                          ; 6AD6   0204 0008

        ADDI    #$0200, R1                      ; 6AD8   02F9 0200
        SDBD                                    ; 6ADA   0001
        MVII    #$185A, R0                      ; 6ADB   02B8 005A 0018
        MVO@    R0,     R1                      ; 6ADE   0248
        PULR    R7                              ; 6ADF   02B7

L_6AE0:
        MOVR    R1,     R2                      ; 6AE0   008A
        ADDI    #$0200, R2                      ; 6AE1   02FA 0200
        SUBI    #$002E, R1                      ; 6AE3   0339 002E
        INCR    R1                              ; 6AE5   0009
        ADDR    R7,     R1                      ; 6AE6   00F9
        ADD@    R1,     R7                      ; 6AE7   02CF

        SETC                                    ; 6AE8   0007
        SLL     R1,     2                       ; 6AE9   004D
        SWAP    R1,     2                       ; 6AEA   0045
        SLL     R1,     2                       ; 6AEB   004D
        SLL     R1,     1                       ; 6AEC   0049
        SLL     R1,     2                       ; 6AED   004D
        SLL     R1,     1                       ; 6AEE   0049
        MVII    #$0116, R0                      ; 6AEF   02B8 0116
L_6AF1:
        MVO@    R0,     R2                      ; 6AF1   0250

        JSR     R5,     L_DF81                  ; 6AF2   0004 01DC 0381

        MVII    #$0032, R0                      ; 6AF5   02B8 0032

        JSR     R5,     L_D3D6                  ; 6AF7   0004 01D0 03D6

L_6AFA:
        CLRR    R2                              ; 6AFA   01D2
        SDBD                                    ; 6AFB   0001
        MVII    #$6DB4, R4                      ; 6AFC   02BC 00B4 006D
L_6AFF:
        MVI@    R4,     R1                      ; 6AFF   02A1
        TSTR    R1                              ; 6B00   0089
        BEQ     L_6B0B                          ; 6B01   0204 0008

        ADDI    #$0200, R1                      ; 6B03   02F9 0200
        MVI@    R1,     R1                      ; 6B05   0289
        ANDI    #$0007, R1                      ; 6B06   03B9 0007
        ADDR    R1,     R2                      ; 6B08   00CA
        B       L_6AFF                          ; 6B09   0220 000B

L_6B0B:
        CMPI    #$002A, R2                      ; 6B0B   037A 002A
        BNEQ    L_6BE3                          ; 6B0D   020C 00D4

        JSR     R5,     L_D2E9                  ; 6B0F   0004 01D0 02E9

        CLRR    R0                              ; 6B12   01C0
        MVII    #$021B, R1                      ; 6B13   02B9 021B
        MVO@    R0,     R1                      ; 6B15   0248
        MVII    #$021D, R1                      ; 6B16   02B9 021D
        MVO@    R0,     R1                      ; 6B18   0248
        MVII    #$021F, R1                      ; 6B19   02B9 021F
        MVO@    R0,     R1                      ; 6B1B   0248
        SDBD                                    ; 6B1C   0001
        MVII    #$185A, R0                      ; 6B1D   02B8 005A 0018
        MVII    #$022E, R1                      ; 6B20   02B9 022E
        MVO@    R0,     R1                      ; 6B22   0248
        MVII    #$0230, R1                      ; 6B23   02B9 0230
        MVO@    R0,     R1                      ; 6B25   0248
        MVII    #$0232, R1                      ; 6B26   02B9 0232
        MVO@    R0,     R1                      ; 6B28   0248
        MVII    #$0234, R1                      ; 6B29   02B9 0234
        MVO@    R0,     R1                      ; 6B2B   0248
        PULR    R7                              ; 6B2C   02B7

        MVII    #$010E, R0                      ; 6B2D   02B8 010E
        B       L_6AF1                          ; 6B2F   0220 003F

        MVII    #$0166, R0                      ; 6B31   02B8 0166
        B       L_6AF1                          ; 6B33   0220 0043

L_6B35:
        MVI     G_0194, R0                      ; 6B35   0280 0194
        TSTR    R0                              ; 6B37   0080
        BEQ     L_6B66                          ; 6B38   0204 002C

        CMPI    #$0009, R1                      ; 6B3A   0379 0009
        BNEQ    L_6B66                          ; 6B3C   020C 0028

        MVI     G_0196, R0                      ; 6B3E   0280 0196
        TSTR    R0                              ; 6B40   0080
        BNEQ    L_6B66                          ; 6B41   020C 0023

        SDBD                                    ; 6B43   0001
        MVII    #$1B58, R0                      ; 6B44   02B8 0058 001B

        JSR     R5,     L_D3D6                  ; 6B47   0004 01D0 03D6

        MVII    #$0053, R0                      ; 6B4A   02B8 0053
        MVII    #$000B, R1                      ; 6B4C   02B9 000B
        SWAP    R0,     1                       ; 6B4E   0040
        SWAP    R1,     1                       ; 6B4F   0041
        MVO     R0,     G_0326                  ; 6B50   0240 0326
        MVO     R1,     G_0327                  ; 6B52   0241 0327
        MVII    #$0064, R0                      ; 6B54   02B8 0064
        MVO     R0,     G_0195                  ; 6B56   0240 0195
        MVO     R0,     G_0196                  ; 6B58   0240 0196

        JSR     R5,     L_DF22                  ; 6B5A   0004 01DC 0322

L_6B5D:
        CLRR    R0                              ; 6B5D   01C0
        MVO     R0,     G_0328                  ; 6B5E   0240 0328
        MVO     R0,     G_0329                  ; 6B60   0240 0329
        INCR    R0                              ; 6B62   0008
        MVO     R0,     G_015D                  ; 6B63   0240 015D
        PULR    R7                              ; 6B65   02B7

L_6B66:
        CMPI    #$004E, R1                      ; 6B66   0379 004E
        BNEQ    L_6BE3                          ; 6B68   020C 0079

        MVI     G_0193, R0                      ; 6B6A   0280 0193
        TSTR    R0                              ; 6B6C   0080
        BNEQ    L_6BE3                          ; 6B6D   020C 0074

        SDBD                                    ; 6B6F   0001
        MVII    #$4877, R1                      ; 6B70   02B9 0077 0048
        MVI     G_018F, R3                      ; 6B73   0283 018F
        CMPI    #$0001, R3                      ; 6B75   037B 0001
        BEQ     L_6B82                          ; 6B77   0204 0009
        BGT     L_6B8A                          ; 6B79   020E 000F

        MVII    #$0259, R2                      ; 6B7B   02BA 0259
        MVII    #$03E8, R0                      ; 6B7D   02B8 03E8
L_6B7F:
        MVO@    R1,     R2                      ; 6B7F   0251
        B       L_6B9B                          ; 6B80   0200 0019

L_6B82:
        MVII    #$026B, R2                      ; 6B82   02BA 026B
        SDBD                                    ; 6B84   0001
        MVII    #$07D0, R0                      ; 6B85   02B8 00D0 0007
        B       L_6B7F                          ; 6B88   0220 000A

L_6B8A:
        MVII    #$026F, R2                      ; 6B8A   02BA 026F
        MVO@    R1,     R2                      ; 6B8C   0251

        JSR     R5,     L_D2E9                  ; 6B8D   0004 01D0 02E9
        JSR     R5,     L_D2DD                  ; 6B90   0004 01D0 02DD
        DECLE   $0003                           ; 6B93   0003

        MVII    #$0003, R3                      ; 6B94   02BB 0003
        SDBD                                    ; 6B96   0001
        MVII    #$0BB8, R0                      ; 6B97   02B8 00B8 000B
        INCR    R7                              ; 6B9A   000F

L_6B9B:
        INCR    R3                              ; 6B9B   000B
L_6B9C:
        MVO     R3,     G_018F                  ; 6B9C   0243 018F

        JSR     R5,     L_D3D6                  ; 6B9E   0004 01D0 03D6

        MVII    #$009B, R0                      ; 6BA1   02B8 009B
        MVII    #$0025, R1                      ; 6BA3   02B9 0025
L_6BA5:
        SWAP    R0,     1                       ; 6BA5   0040
        SWAP    R1,     1                       ; 6BA6   0041
        MVO     R0,     G_0326                  ; 6BA7   0240 0326
        MVO     R1,     G_0327                  ; 6BA9   0241 0327
        MVII    #$0028, R0                      ; 6BAB   02B8 0028
        MVO     R0,     G_0192                  ; 6BAD   0240 0192
        MVO     R0,     G_0193                  ; 6BAF   0240 0193

        JSR     R5,     L_DF3A                  ; 6BB1   0004 01DC 033A

        B       L_6B5D                          ; 6BB4   0220 0058

L_6BB6:
        CMPI    #$0001, R2                      ; 6BB6   037A 0001
        BLE     L_6CA5                          ; 6BB8   0206 00EB

        SDBD                                    ; 6BBA   0001
        MVII    #$6DBC, R4                      ; 6BBB   02BC 00BC 006D
L_6BBE:
        MVI@    R4,     R0                      ; 6BBE   02A0
        CMPI    #$0064, R0                      ; 6BBF   0378 0064
        BEQ     L_6801                          ; 6BC1   0224 03C1

        CMPI    #$0066, R0                      ; 6BC3   0378 0066
        BEQ     L_6BF0                          ; 6BC5   0204 0029

        CMPR    R0,     R3                      ; 6BC7   0143
        BNEQ    L_6BEC                          ; 6BC8   020C 0022

        MVI@    R4,     R2                      ; 6BCA   02A2
        CMPI    #$0007, R2                      ; 6BCB   037A 0007
        BGT     L_6BE4                          ; 6BCD   020E 0015

        SDBD                                    ; 6BCF   0001
        MVII    #$0800, R3                      ; 6BD0   02BB 0000 0008
L_6BD3:
        SLL     R0,     2                       ; 6BD3   004C
        SLL     R0,     1                       ; 6BD4   0048
        XORR    R3,     R0                      ; 6BD5   01D8
        XORR    R0,     R2                      ; 6BD6   01C2
        ADDI    #$0200, R1                      ; 6BD7   02F9 0200
        MVO@    R2,     R1                      ; 6BD9   024A
        MVI@    R4,     R0                      ; 6BDA   02A0
        MVO     R0,     G_01AD                  ; 6BDB   0240 01AD
        MVI@    R4,     R0                      ; 6BDD   02A0
        MVO     R0,     G_01AE                  ; 6BDE   0240 01AE

        JSR     R5,     L_DE9D                  ; 6BE0   0004 01DC 029D

L_6BE3:
        PULR    R7                              ; 6BE3   02B7

L_6BE4:
        SDBD                                    ; 6BE4   0001
        MVII    #$1800, R3                      ; 6BE5   02BB 0000 0018
        ANDI    #$0007, R2                      ; 6BE8   03BA 0007
        B       L_6BD3                          ; 6BEA   0220 0018

L_6BEC:
        ADDI    #$0003, R4                      ; 6BEC   02FC 0003
        B       L_6BBE                          ; 6BEE   0220 0031

L_6BF0:
        CMPI    #$0005, R3                      ; 6BF0   037B 0005
        BNEQ    L_6C01                          ; 6BF2   020C 000D

L_6BF4:
        MVII    #$00C8, R0                      ; 6BF4   02B8 00C8

        JSR     R5,     L_D3D6                  ; 6BF6   0004 01D0 03D6

        MVII    #$0006, R0                      ; 6BF9   02B8 0006
        MVO     R0,     G_019E                  ; 6BFB   0240 019E

        JSR     R5,     L_DEE1                  ; 6BFD   0004 01DC 02E1

L_6C00:
        PULR    R7                              ; 6C00   02B7

L_6C01:
        CMPI    #$0010, R3                      ; 6C01   037B 0010
        BEQ     L_6BF4                          ; 6C03   0224 0010

        TSTR    R3                              ; 6C05   009B
        BNEQ    L_6C77                          ; 6C06   020C 006F

        SDBD                                    ; 6C08   0001
        MVII    #$6E09, R4                      ; 6C09   02BC 0009 006E
        SDBD                                    ; 6C0C   0001
        MVII    #$0802, R3                      ; 6C0D   02BB 0002 0008
L_6C10:
        CLRR    R0                              ; 6C10   01C0
L_6C11:
        ADDI    #$0200, R1                      ; 6C11   02F9 0200
        MVO@    R0,     R1                      ; 6C13   0248
        MVII    #$03E8, R0                      ; 6C14   02B8 03E8
        PSHR    R4                              ; 6C16   0274
        PSHR    R3                              ; 6C17   0273

        JSR     R5,     L_D3D6                  ; 6C18   0004 01D0 03D6
        JSR     R5,     L_DEB0                  ; 6C1B   0004 01DC 02B0

        PULR    R3                              ; 6C1E   02B3
        PULR    R4                              ; 6C1F   02B4
        MOVR    R4,     R5                      ; 6C20   00A5
        CLRR    R2                              ; 6C21   01D2
L_6C22:
        MVI@    R4,     R1                      ; 6C22   02A1
        TSTR    R1                              ; 6C23   0089
        BEQ     L_6C2E                          ; 6C24   0204 0008

        ADDI    #$0200, R1                      ; 6C26   02F9 0200
        MVI@    R1,     R0                      ; 6C28   0288
        ANDI    #$0007, R0                      ; 6C29   03B8 0007
        ADDR    R0,     R2                      ; 6C2B   00C2
        B       L_6C22                          ; 6C2C   0220 000B

L_6C2E:
        TSTR    R2                              ; 6C2E   0092
        BNEQ    L_6C3A                          ; 6C2F   020C 0009

L_6C31:
        MVI@    R5,     R1                      ; 6C31   02A9
        TSTR    R1                              ; 6C32   0089
        BEQ     L_6C40                          ; 6C33   0204 000B

        ADDI    #$0200, R1                      ; 6C35   02F9 0200
        MVO@    R3,     R1                      ; 6C37   024B
        B       L_6C31                          ; 6C38   0220 0008

L_6C3A:
        CMPI    #$0010, R2                      ; 6C3A   037A 0010
        BNEQ    L_6C00                          ; 6C3C   022C 003D
        B       L_6C31                          ; 6C3E   0220 000E

L_6C40:
        JSR     R5,     L_D2DD                  ; 6C40   0004 01D0 02DD
        DECLE   $0003                           ; 6C43   0003

        PSHR    R3                              ; 6C44   0273

        JSR     R5,     L_DF08                  ; 6C45   0004 01DC 0308

        PULR    R3                              ; 6C48   02B3
        SDBD                                    ; 6C49   0001
        CMPI    #$085E, R3                      ; 6C4A   037B 005E 0008
        BNEQ    L_6C69                          ; 6C4D   020C 001A

        JSR     R5,     L_D2DD                  ; 6C4F   0004 01D0 02DD
        DECLE   $0001                           ; 6C52   0001

        JSR     R5,     L_D2F5                  ; 6C53   0004 01D0 02F5

        MVI     G_01A7, R0                      ; 6C56   0280 01A7
        CMPI    #$0005, R0                      ; 6C58   0378 0005
        BLT     L_6C00                          ; 6C5A   0225 005B

        CLRR    R0                              ; 6C5C   01C0
        MVO     R0,     G_01A7                  ; 6C5D   0240 01A7
        MVII    #$0001, R0                      ; 6C5F   02B8 0001
        MVO     R0,     G_019D                  ; 6C61   0240 019D
        MVO     R0,     G_01A5                  ; 6C63   0240 01A5

        JSR     R5,     L_DF08                  ; 6C65   0004 01DC 0308

        PULR    R7                              ; 6C68   02B7

L_6C69:
        SDBD                                    ; 6C69   0001
        CMPI    #$0802, R3                      ; 6C6A   037B 0002 0008
        BNEQ    L_6C00                          ; 6C6D   022C 006E

        JSR     R5,     L_D2E9                  ; 6C6F   0004 01D0 02E9
        JSR     R5,     L_D2DD                  ; 6C72   0004 01D0 02DD
        DECLE   $0001                           ; 6C75   0001

        PULR    R7                              ; 6C76   02B7

L_6C77:
        CMPI    #$0006, R3                      ; 6C77   037B 0006
        BNEQ    L_6C85                          ; 6C79   020C 000A

        SDBD                                    ; 6C7B   0001
        MVII    #$0832, R3                      ; 6C7C   02BB 0032 0008
        SDBD                                    ; 6C7F   0001
        MVII    #$6E0E, R4                      ; 6C80   02BC 000E 006E
        B       L_6C10                          ; 6C83   0220 0074

L_6C85:
        CMPI    #$0011, R3                      ; 6C85   037B 0011
        BNEQ    L_6C93                          ; 6C87   020C 000A

        SDBD                                    ; 6C89   0001
        MVII    #$088A, R3                      ; 6C8A   02BB 008A 0008
        SDBD                                    ; 6C8D   0001
        MVII    #$6E12, R4                      ; 6C8E   02BC 0012 006E
        B       L_6C10                          ; 6C91   0220 0082

L_6C93:
        CMPI    #$000B, R3                      ; 6C93   037B 000B
        BNEQ    L_6A72                          ; 6C95   022C 0224

        SDBD                                    ; 6C97   0001
        MVII    #$085E, R3                      ; 6C98   02BB 005E 0008
        SDBD                                    ; 6C9B   0001
        MVII    #$0664, R0                      ; 6C9C   02B8 0064 0006
        SDBD                                    ; 6C9F   0001
        MVII    #$6E16, R4                      ; 6CA0   02BC 0016 006E
        B       L_6C11                          ; 6CA3   0220 0093

L_6CA5:
        MVI     G_0172, R1                      ; 6CA5   0281 0172
        CMPI    #$0055, R1                      ; 6CA7   0379 0055
        BNEQ    L_6D24                          ; 6CA9   020C 0079

        JSR     R5,     L_6D8E                  ; 6CAB   0004 016C 018E

        CMPI    #$0004, R3                      ; 6CAE   037B 0004
        BEQ     L_6C00                          ; 6CB0   0224 00B1

        SDBD                                    ; 6CB2   0001
        MVII    #$6E05, R4                      ; 6CB3   02BC 0005 006E
L_6CB6:
        MVI@    R4,     R1                      ; 6CB6   02A1
        TSTR    R1                              ; 6CB7   0089
        BEQ     L_6CC3                          ; 6CB8   0204 0009

        JSR     R5,     L_6D8E                  ; 6CBA   0004 016C 018E

        CMPI    #$0004, R3                      ; 6CBD   037B 0004
        BEQ     L_6D5B                          ; 6CBF   0204 009A
        B       L_6CB6                          ; 6CC1   0220 000C

L_6CC3:
        MVI     G_019F, R0                      ; 6CC3   0280 019F
        INCR    R0                              ; 6CC5   0008
L_6CC6:
        MVO     R0,     G_019F                  ; 6CC6   0240 019F
        SDBD                                    ; 6CC8   0001
        MVII    #$1824, R0                      ; 6CC9   02B8 0024 0018
        MVI     G_0172, R1                      ; 6CCC   0281 0172
        ADDI    #$0200, R1                      ; 6CCE   02F9 0200
        MVO@    R0,     R1                      ; 6CD0   0248
        MVII    #$00C8, R0                      ; 6CD1   02B8 00C8

        JSR     R5,     L_D3D6                  ; 6CD3   0004 01D0 03D6
        JSR     R5,     L_DFB6                  ; 6CD6   0004 01DC 03B6

        SDBD                                    ; 6CD9   0001
        MVII    #$6E04, R4                      ; 6CDA   02BC 0004 006E
        CLRR    R3                              ; 6CDD   01DB
L_6CDE:
        PSHR    R3                              ; 6CDE   0273
        MVI@    R4,     R1                      ; 6CDF   02A1
        TSTR    R1                              ; 6CE0   0089
        BEQ     L_6CE9                          ; 6CE1   0204 0006

        JSR     R5,     L_6D8E                  ; 6CE3   0004 016C 018E

        ADD@    R6,     R3                      ; 6CE6   02F3
        B       L_6CDE                          ; 6CE7   0220 000A

L_6CE9:
        PULR    R3                              ; 6CE9   02B3
        CMPI    #$0010, R3                      ; 6CEA   037B 0010
        BNEQ    L_6C00                          ; 6CEC   022C 00ED

        MVII    #$0032, R0                      ; 6CEE   02B8 0032
        MVO     R0,     G_01A0                  ; 6CF0   0240 01A0
        MVI     G_019F, R0                      ; 6CF2   0280 019F
        CMPI    #$0004, R0                      ; 6CF4   0378 0004
        BEQ     L_6D02                          ; 6CF6   0204 000A

        JSR     R5,     L_D2DD                  ; 6CF8   0004 01D0 02DD
        DECLE   $0004                           ; 6CFB   0004

        SDBD                                    ; 6CFC   0001
        MVII    #$1388, R0                      ; 6CFD   02B8 0088 0013
        B       L_6AAD                          ; 6D00   0220 0254

L_6D02:
        MVII    #$0005, R2                      ; 6D02   02BA 0005
L_6D04:
        SDBD                                    ; 6D04   0001
        MVII    #$2710, R0                      ; 6D05   02B8 0010 0027

        JSR     R5,     L_D3D6                  ; 6D08   0004 01D0 03D6

        DECR    R2                              ; 6D0B   0012
        BNEQ    L_6D04                          ; 6D0C   022C 0009

        MVO     R2,     G_019F                  ; 6D0E   0242 019F

        JSR     R5,     L_D2E9                  ; 6D10   0004 01D0 02E9
        JSR     R5,     L_D2DD                  ; 6D13   0004 01D0 02DD
        DECLE   $0004                           ; 6D16   0004

        MVII    #$002C, R1                      ; 6D17   02B9 002C

        JSR     R5,     L_6D8E                  ; 6D19   0004 016C 018E

        CMPI    #$000F, R3                      ; 6D1C   037B 000F
        BEQ     L_6C00                          ; 6D1E   0224 011F

        INCR    R3                              ; 6D20   000B
        J       L_D50B                          ; 6D21   0004 03D4 010B

L_6D24:
        CMPI    #$006B, R1                      ; 6D24   0379 006B
        BNEQ    L_6D37                          ; 6D26   020C 000F

        JSR     R5,     L_6D8E                  ; 6D28   0004 016C 018E

        CMPI    #$0004, R3                      ; 6D2B   037B 0004
        BEQ     L_6C00                          ; 6D2D   0224 012E

        MVI     G_019F, R0                      ; 6D2F   0280 019F
        CMPI    #$0001, R0                      ; 6D31   0378 0001
        BNEQ    L_6D5B                          ; 6D33   020C 0026
        BEQ     L_6CC3                          ; 6D35   0224 0073

L_6D37:
        CMPI    #$0070, R1                      ; 6D37   0379 0070
        BNEQ    L_6D4A                          ; 6D39   020C 000F

        JSR     R5,     L_6D8E                  ; 6D3B   0004 016C 018E

        CMPI    #$0004, R3                      ; 6D3E   037B 0004
        BEQ     L_6C00                          ; 6D40   0224 0141

        MVI     G_019F, R0                      ; 6D42   0280 019F
        CMPI    #$0002, R0                      ; 6D44   0378 0002
        BNEQ    L_6D5B                          ; 6D46   020C 0013
        BEQ     L_6CC3                          ; 6D48   0224 0086

L_6D4A:
        CMPI    #$005E, R1                      ; 6D4A   0379 005E
        BNEQ    L_6D5E                          ; 6D4C   020C 0010

        JSR     R5,     L_6D8E                  ; 6D4E   0004 016C 018E

        CMPI    #$0004, R3                      ; 6D51   037B 0004
        BEQ     L_6C00                          ; 6D53   0224 0154

        MVI     G_019F, R0                      ; 6D55   0280 019F
        CMPI    #$0003, R0                      ; 6D57   0378 0003
        BEQ     L_6CC3                          ; 6D59   0224 0097

L_6D5B:
        CLRR    R0                              ; 6D5B   01C0
        B       L_6CC6                          ; 6D5C   0220 0097

L_6D5E:
        CMPI    #$0026, R1                      ; 6D5E   0379 0026
        BNEQ    L_6C00                          ; 6D60   022C 0161

        MVI     G_0193, R0                      ; 6D62   0280 0193
        TSTR    R0                              ; 6D64   0080
        BNEQ    L_6C00                          ; 6D65   022C 0166

        MVI     G_01AA, R0                      ; 6D67   0280 01AA
        TSTR    R0                              ; 6D69   0080
        BNEQ    L_6D77                          ; 6D6A   020C 000B

        INCR    R0                              ; 6D6C   0008
        MVO     R0,     G_01AA                  ; 6D6D   0240 01AA
        MVII    #$0200, R1                      ; 6D6F   02B9 0200
        MVI@    R1,     R0                      ; 6D71   0288
        XORI    #$0005, R0                      ; 6D72   03F8 0005
        MVO@    R0,     R1                      ; 6D74   0248
        B       L_6D88                          ; 6D75   0200 0011

L_6D77:
        MVII    #$009B, R0                      ; 6D77   02B8 009B
        MVII    #$0015, R1                      ; 6D79   02B9 0015
        SWAP    R0,     1                       ; 6D7B   0040
        SWAP    R1,     1                       ; 6D7C   0041
        MVO     R0,     G_0326                  ; 6D7D   0240 0326
        MVO     R1,     G_0327                  ; 6D7F   0241 0327
        MVII    #$0001, R3                      ; 6D81   02BB 0001
        MVO     R3,     G_015D                  ; 6D83   0243 015D

        JSR     R5,     L_6776                  ; 6D85   0004 0164 0376

L_6D88:
        MVII    #$009B, R0                      ; 6D88   02B8 009B
        MVII    #$0015, R1                      ; 6D8A   02B9 0015
        B       L_6BA5                          ; 6D8C   0220 01E8

L_6D8E:
        PSHR    R1                              ; 6D8E   0271
        ADDI    #$0200, R1                      ; 6D8F   02F9 0200
        MVI@    R1,     R3                      ; 6D91   028B
        MOVR    R3,     R2                      ; 6D92   009A
        SDBD                                    ; 6D93   0001
        ANDI    #$0800, R2                      ; 6D94   03BA 0000 0008
        BEQ     L_6D9F                          ; 6D97   0204 0006

        SLR     R3,     2                       ; 6D99   0067
        SLR     R3,     1                       ; 6D9A   0063
        ANDI    #$00FF, R3                      ; 6D9B   03BB 00FF
L_6D9D:
        PULR    R1                              ; 6D9D   02B1
        MOVR    R5,     R7                      ; 6D9E   00AF

L_6D9F:
        MVII    #$00C8, R3                      ; 6D9F   02BB 00C8
        B       L_6D9D                          ; 6DA1   0220 0005

        DECLE   $0028,  $000E,  $0014,  $0000   ; 6DA3   0028 000E 0014 0000
        DECLE   $002A,  $000E,  $0014,  $0000   ; 6DA7   002A 000E 0014 0000
        DECLE   $0007,  $000C,  $001E,  $0000   ; 6DAB   0007 000C 001E 0000
        DECLE   $001D,  $000C,  $001E,  $0000   ; 6DAF   001D 000C 001E 0000
        DECLE   $0064,  $001B,  $001D,  $001F   ; 6DB3   0064 001B 001D 001F
        DECLE   $002E,  $0030,  $0032,  $0034   ; 6DB7   002E 0030 0032 0034
        DECLE   $0000                           ; 6DBB   0000

        INCR    R4                              ; 6DBC   000C
        INCR    R2                              ; 6DBD   000A
        ADDR    R5,     R0                      ; 6DBE   00E8
        DIS                                     ; 6DBF   0003
        INCR    R5                              ; 6DC0   000D
        INCR    R2                              ; 6DC1   000A
        ADDR    R2,     R0                      ; 6DC2   00D0
        SETC                                    ; 6DC3   0007
        INCR    R6                              ; 6DC4   000E
        INCR    R2                              ; 6DC5   000A
        MOVR    R7,     R0                      ; 6DC6   00B8
        INCR    R3                              ; 6DC7   000B
        INCR    R7                              ; 6DC8   000F

        INCR    R2                              ; 6DC9   000A
L_6DCA:
        MOVR    R4,     R0                      ; 6DCA   00A0
        INCR    R7                              ; 6DCB   000F

        SETC                                    ; 6DCC   0007
L_6DCD:
        INCR    R0                              ; 6DCD   0008
        DECLE   $0032,  $0000,  $0066,  $0013   ; 6DCE   0032 0000 0066 0013
        DECLE   $0044,  $0047,  $0000,  $0004   ; 6DD2   0044 0047 0000 0004
        DECLE   $0057,  $005A,  $0000,  $0024   ; 6DD6   0057 005A 0000 0024
        DECLE   $006C,  $006F,  $0000,  $001A   ; 6DDA   006C 006F 0000 001A
        DECLE   $0059,  $005C,  $0000,  $0012   ; 6DDE   0059 005C 0000 0012
        DECLE   $0058,  $005B,  $0000           ; 6DE2   0058 005B 0000

        SLR     R3,     1                       ; 6DE5   0063
        DECR    R2                              ; 6DE6   0012
        CLRC                                    ; 6DE7   0006
        SLLC    R0,     1                       ; 6DE8   0058
        SLLC    R3,     1                       ; 6DE9   005B
        INCR    R2                              ; 6DEA   000A
        SWAP    R1,     2                       ; 6DEB   0045
        RLC     R3,     2                       ; 6DEC   0057
        SLLC    R3,     1                       ; 6DED   005B
        DIS                                     ; 6DEE   0003
        SLLC    R0,     1                       ; 6DEF   0058
        SAR     R2,     1                       ; 6DF0   006A
        SAR     R2,     2                       ; 6DF1   006E
L_6DF2:
        DECR    R7                              ; 6DF2   0017

        DECLE   $006D,  $007F,  $0083,  $0015   ; 6DF3   006D 007F 0083 0015
        DECLE   $005A,  $006C,  $0070,  $000E   ; 6DF7   005A 006C 0070 000E
        DECLE   $0059,  $006B,  $006F,  $0063   ; 6DFB   0059 006B 006F 0063
        DECLE   $000E,  $0007,  $0059,  $006B   ; 6DFF   000E 0007 0059 006B
        DECLE   $006F,  $0055,  $006B,  $0070   ; 6E03   006F 0055 006B 0070
        DECLE   $005E,  $0000,  $0008,  $0009   ; 6E07   005E 0000 0008 0009
        DECLE   $000A,  $000B,  $0000,  $0051   ; 6E0B   000A 000B 0000 0051
        DECLE   $0065,  $0079,  $0000,  $0062   ; 6E0F   0065 0079 0000 0062
        DECLE   $0076,  $008A,  $0000,  $0044   ; 6E13   0076 008A 0000 0044
        DECLE   $0045,  $0046,  $0047,  $0000   ; 6E17   0045 0046 0047 0000
.TIMER:
        DECLE   $0097,  $00D4,  $000A,  $0000; 6E1B  Timer dispatch/interval
        DECLE   $0062,  $006E,  $0001,  $0000; 6E1F  Timer dispatch/interval
        DECLE   $00A6,  $006F,  $0008,  $0000; 6E23  Timer dispatch/interval
        BIDECLE $D000           ; 6E27  End of timer table

        DECLE   $0001,  $0000,  $0000,  $0000   ; 6E29   0001 0000 0000 0000
.TITLE:
        DECLE   $0051                           ; 6E2D  Cartridge year
        DECLE   $0000                           ; 6E2E  

.TITLECODE:
        JSR     R5,     L_D440                  ; 6E2F   0004 01D4 0040

        PULR    R7                              ; 6E32   02B7

L_6E33:
        PSHR    R5                              ; 6E33   0275

        JSR     R5,     L_5131                  ; 6E34   0004 0150 0131

        MVI     G_035E, R0                      ; 6E37   0280 035E
        MVO     R0,     G_0359                  ; 6E39   0240 0359
        MVI     G_01AB, R0                      ; 6E3B   0280 01AB
        TSTR    R0                              ; 6E3D   0080
        BNEQ    L_6E41                          ; 6E3E   020C 0001
        PULR    R7                              ; 6E40   02B7
L_6E41:
        J       X_RESET                         ; 6E41   0004 0310 0000

L_6E44:
        PSHR    R5                              ; 6E44   0275

        JSR     R5,     L_551A                  ; 6E45   0004 0154 011A
        JSR     R5,     L_58F2                  ; 6E48   0004 0158 00F2
        JSR     R5,     L_5959                  ; 6E4B   0004 0158 0159

        PULR    R7                              ; 6E4E   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E4F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E53   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6E57   0000 0000
L_6E59:
        PSHR    R5                              ; 6E59   0275
        MVII    #$0080, R0                      ; 6E5A   02B8 0080
        MVO     R0,     G_012C                  ; 6E5C   0240 012C
        J       L_5093                          ; 6E5E   0004 0350 0093
        PULR    R7                              ; 6E61   02B7

L_6E62:
        PSHR    R5                              ; 6E62   0275

        JSR     R5,     L_6561                  ; 6E63   0004 0164 0161

        MVI     G_01B4, R0                      ; 6E66   0280 01B4
        TSTR    R0                              ; 6E68   0080
        BNEQ    L_6EB7                          ; 6E69   020C 004C

        MVI     G_0163, R1                      ; 6E6B   0281 0163
        TSTR    R1                              ; 6E6D   0089
        BEQ     L_6EAD                          ; 6E6E   0204 003D

        MVO     R0,     G_0163                  ; 6E70   0240 0163
        MVI     G_0162, R1                      ; 6E72   0281 0162
        DECR    R1                              ; 6E74   0011
        MVO     R1,     G_0162                  ; 6E75   0241 0162
        INCR    R1                              ; 6E77   0009
        ADDR    R7,     R1                      ; 6E78   00F9
        ADD@    R1,     R7                      ; 6E79   02CF

        SETC                                    ; 6E7A   0007
        DECR    R3                              ; 6E7B   0013
L_6E7C:
        DECR    R7                              ; 6E7C   0017

        DECLE   $001B,  $001F,  $0023,  $0027   ; 6E7D   001B 001F 0023 0027
        DECLE   $0004,  $0150,  $0370,  $0008   ; 6E81   0004 0150 0370 0008
        DECLE   $0000                           ; 6E85   0000

        JSR     R5,     L_D2E9                  ; 6E86   0004 01D0 02E9

        MVII    #$02BC, R0                      ; 6E89   02B8 02BC
        B       L_6EA3                          ; 6E8B   0200 0016

        MVII    #$0258, R0                      ; 6E8D   02B8 0258
        B       L_6EA3                          ; 6E8F   0200 0012

        MVII    #$01F4, R0                      ; 6E91   02B8 01F4
        B       L_6EA3                          ; 6E93   0200 000E

        MVII    #$0190, R0                      ; 6E95   02B8 0190
        B       L_6EA3                          ; 6E97   0200 000A

        MVII    #$012C, R0                      ; 6E99   02B8 012C
        B       L_6EA3                          ; 6E9B   0200 0006

        MVII    #$00C8, R0                      ; 6E9D   02B8 00C8
        B       L_6EA3                          ; 6E9F   0200 0002

        MVII    #$0064, R0                      ; 6EA1   02B8 0064

L_6EA3:
        JSR     R5,     L_D3D6                  ; 6EA3   0004 01D0 03D6
        JSR     R5,     L_DEB0                  ; 6EA6   0004 01DC 02B0
        JSR     R5,     L_D2DD                  ; 6EA9   0004 01D0 02DD
        DECLE   $0001                           ; 6EAC   0001
L_6EAD:
        MVI     G_01A2, R0                      ; 6EAD   0280 01A2
        TSTR    R0                              ; 6EAF   0080
        BEQ     L_6EB7                          ; 6EB0   0204 0005

        MVII    #$0001, R1                      ; 6EB2   02B9 0001

        JSR     R5,     L_D2C6                  ; 6EB4   0004 01D0 02C6

L_6EB7:
        MVI     G_015D, R0                      ; 6EB7   0280 015D
        TSTR    R0                              ; 6EB9   0080
        BEQ     L_6ECD                          ; 6EBA   0204 0011

        MVI     G_0327, R3                      ; 6EBC   0283 0327
        SWAP    R3,     1                       ; 6EBE   0043
        ANDI    #$00FF, R3                      ; 6EBF   03BB 00FF
        CMPI    #$0060, R3                      ; 6EC1   037B 0060
        BGE     L_6EC6                          ; 6EC3   020D 0001
        PULR    R7                              ; 6EC5   02B7

L_6EC6:
        JSR     R5,     L_66AA                  ; 6EC6   0004 0164 02AA

        CLRR    R1                              ; 6EC9   01C9
        MVO     R1,     G_015D                  ; 6ECA   0241 015D
        PULR    R7                              ; 6ECC   02B7

L_6ECD:
        JSR     R5,     L_67D3                  ; 6ECD   0004 0164 03D3
        JSR     R5,     L_D248                  ; 6ED0   0004 01D0 0248

        MVII    #$01AD, R4                      ; 6ED3   02BC 01AD
        SDBD                                    ; 6ED5   0001
        MVI@    R4,     R0                      ; 6ED6   02A0
        TSTR    R0                              ; 6ED7   0080
        BNEQ    L_6EDB                          ; 6ED8   020C 0001
        PULR    R7                              ; 6EDA   02B7

L_6EDB:
        JSR     R5,     L_D3D6                  ; 6EDB   0004 01D0 03D6

        CLRR    R0                              ; 6EDE   01C0
        MVO     R0,     G_01AD                  ; 6EDF   0240 01AD
        MVO     R0,     G_01AE                  ; 6EE1   0240 01AE
        PULR    R7                              ; 6EE3   02B7

        NEGR    R0                              ; 6EE4   0020
        SWAP    R3,     1                       ; 6EE5   0043
        SLL     R3,     2                       ; 6EE6   004F
        RLC     R0,     1                       ; 6EE7   0050
        RLC     R2,     1                       ; 6EE8   0052
        NEGR    R0                              ; 6EE9   0020
        ADCR    R0                              ; 6EEA   0028
        SWAP    R3,     1                       ; 6EEB   0043
        ADCR    R1                              ; 6EEC   0029
        NEGR    R0                              ; 6EED   0020
        GSWD    R1                              ; 6EEE   0031
        RSWD    R1                              ; 6EEF   0039
        RSWD    R0                              ; 6EF0   0038
        GSWD    R1                              ; 6EF1   0031
        NEGR    R0                              ; 6EF2   0020
        SLL     R1,     2                       ; 6EF3   004D
        SWAP    R1,     1                       ; 6EF4   0041
        RLC     R0,     2                       ; 6EF5   0054
        RLC     R0,     2                       ; 6EF6   0054
        SWAP    R1,     2                       ; 6EF7   0045
        SLL     R0,     2                       ; 6EF8   004C
        NEGR    R0                              ; 6EF9   0020
        SWAP    R3,     1                       ; 6EFA   0043
        SLL     R0,     1                       ; 6EFB   0048
        SLL     R1,     1                       ; 6EFC   0049
        SWAP    R1,     2                       ; 6EFD   0045
        SWAP    R2,     2                       ; 6EFE   0046
        NEGR    R0                              ; 6EFF   0020
        SWAP    R0,     2                       ; 6F00   0044
        SWAP    R1,     2                       ; 6F01   0045
        RLC     R3,     1                       ; 6F02   0053
        SLL     R1,     1                       ; 6F03   0049
        SWAP    R3,     2                       ; 6F04   0047
        SLL     R2,     2                       ; 6F05   004E
        SWAP    R1,     2                       ; 6F06   0045
        RLC     R2,     1                       ; 6F07   0052
        RLC     R3,     1                       ; 6F08   0053
        NEGR    R0                              ; 6F09   0020
        SWAP    R1,     1                       ; 6F0A   0041
        SLL     R2,     2                       ; 6F0B   004E
        SWAP    R0,     2                       ; 6F0C   0044
        NEGR    R0                              ; 6F0D   0020
        RLC     R0,     1                       ; 6F0E   0050
        RLC     R2,     1                       ; 6F0F   0052
        SLL     R3,     2                       ; 6F10   004F
        SWAP    R3,     2                       ; 6F11   0047
        RLC     R2,     1                       ; 6F12   0052
        SWAP    R1,     1                       ; 6F13   0041
        SLL     R1,     2                       ; 6F14   004D
        SLL     R1,     2                       ; 6F15   004D
        SWAP    R1,     2                       ; 6F16   0045
        RLC     R2,     1                       ; 6F17   0052
        RLC     R3,     1                       ; 6F18   0053
        RSWD    R2                              ; 6F19   003A
        NEGR    R0                              ; 6F1A   0020
        NEGR    R0                              ; 6F1B   0020
        SLL     R1,     2                       ; 6F1C   004D
        NEGR    R0                              ; 6F1D   0020
        RLC     R0,     2                       ; 6F1E   0054
        RLC     R2,     1                       ; 6F1F   0052
        SWAP    R1,     1                       ; 6F20   0041
        SLL     R2,     2                       ; 6F21   004E
        NEGR    R0                              ; 6F22   0020
        SWAP    R1,     1                       ; 6F23   0041
        SLL     R2,     2                       ; 6F24   004E
        SWAP    R0,     2                       ; 6F25   0044
        NEGR    R0                              ; 6F26   0020
        RLC     R2,     1                       ; 6F27   0052
        NEGR    R0                              ; 6F28   0020
        SWAP    R1,     2                       ; 6F29   0045
        NEGR    R0                              ; 6F2A   0020
        SLL     R2,     2                       ; 6F2B   004E
        SWAP    R1,     2                       ; 6F2C   0045
        RLC     R3,     2                       ; 6F2D   0057
        RLC     R3,     1                       ; 6F2E   0053
        RLC     R0,     2                       ; 6F2F   0054
        SWAP    R1,     1                       ; 6F30   0041
        SWAP    R0,     2                       ; 6F31   0044
        RLC     R0,     2                       ; 6F32   0054
        NEGR    R0                              ; 6F33   0020
        RLC     R3,     1                       ; 6F34   0053
        SLL     R3,     2                       ; 6F35   004F
        RLC     R1,     2                       ; 6F36   0055
        SLL     R2,     2                       ; 6F37   004E
        SWAP    R0,     2                       ; 6F38   0044
        NEGR    R0                              ; 6F39   0020
        SWAP    R1,     2                       ; 6F3A   0045
        SWAP    R2,     2                       ; 6F3B   0046
        SWAP    R2,     2                       ; 6F3C   0046
        SWAP    R1,     2                       ; 6F3D   0045
        SWAP    R3,     1                       ; 6F3E   0043
        RLC     R0,     2                       ; 6F3F   0054
        RLC     R3,     1                       ; 6F40   0053
        RSWD    R2                              ; 6F41   003A
        NEGR    R0                              ; 6F42   0020
        SLL     R1,     2                       ; 6F43   004D
        NEGR    R0                              ; 6F44   0020
        RLC     R1,     2                       ; 6F45   0055
        RLC     R2,     1                       ; 6F46   0052
        SWAP    R2,     1                       ; 6F47   0042
        SWAP    R1,     1                       ; 6F48   0041
        SLL     R2,     2                       ; 6F49   004E
        SLL     R1,     1                       ; 6F4A   0049
        SWAP    R1,     2                       ; 6F4B   0045
        SWAP    R3,     1                       ; 6F4C   0043
        NEGR    R0                              ; 6F4D   0020
        RLC     R0,     1                       ; 6F4E   0050
        SLL     R1,     1                       ; 6F4F   0049
        SLL     R2,     2                       ; 6F50   004E
        SWAP    R2,     1                       ; 6F51   0042
        SWAP    R1,     1                       ; 6F52   0041
        SLL     R0,     2                       ; 6F53   004C
        SLL     R0,     2                       ; 6F54   004C
        NEGR    R0                              ; 6F55   0020
        SWAP    R3,     1                       ; 6F56   0043
        SLL     R3,     2                       ; 6F57   004F
        SLL     R2,     2                       ; 6F58   004E
        RLC     R3,     1                       ; 6F59   0053
        RLC     R1,     2                       ; 6F5A   0055
        SLL     R0,     2                       ; 6F5B   004C
        RLC     R0,     2                       ; 6F5C   0054
        SWAP    R1,     1                       ; 6F5D   0041
        SLL     R2,     2                       ; 6F5E   004E
        RLC     R0,     2                       ; 6F5F   0054
        RSWD    R2                              ; 6F60   003A
        NEGR    R0                              ; 6F61   0020
        SLL     R1,     2                       ; 6F62   004D
        NEGR    R0                              ; 6F63   0020
        SWAP    R2,     1                       ; 6F64   0042
        RLC     R1,     2                       ; 6F65   0055
        SWAP    R3,     1                       ; 6F66   0043
        SLL     R0,     1                       ; 6F67   0048
        SLL     R1,     1                       ; 6F68   0049
        SWAP    R3,     2                       ; 6F69   0047
        SLL     R2,     2                       ; 6F6A   004E
        SWAP    R1,     1                       ; 6F6B   0041
        SLL     R2,     2                       ; 6F6C   004E
        SLL     R1,     1                       ; 6F6D   0049
        NEGR    R0                              ; 6F6E   0020
        SWAP    R1,     1                       ; 6F6F   0041
        SWAP    R0,     2                       ; 6F70   0044
        SWAP    R0,     2                       ; 6F71   0044
        SLL     R1,     1                       ; 6F72   0049
        RLC     R0,     2                       ; 6F73   0054
        SLL     R1,     1                       ; 6F74   0049
        SLL     R3,     2                       ; 6F75   004F
        SLL     R2,     2                       ; 6F76   004E
        SWAP    R1,     1                       ; 6F77   0041
        SLL     R0,     2                       ; 6F78   004C
        NEGR    R0                              ; 6F79   0020
        SWAP    R3,     2                       ; 6F7A   0047
        RLC     R2,     1                       ; 6F7B   0052
        SWAP    R1,     1                       ; 6F7C   0041
        RLC     R0,     1                       ; 6F7D   0050
        SLL     R0,     1                       ; 6F7E   0048
        SLL     R1,     1                       ; 6F7F   0049
        SWAP    R3,     1                       ; 6F80   0043
        RLC     R3,     1                       ; 6F81   0053
        NEGR    R0                              ; 6F82   0020
        SWAP    R2,     1                       ; 6F83   0042
        SLLC    R1,     1                       ; 6F84   0059
        RSWD    R2                              ; 6F85   003A
        NEGR    R0                              ; 6F86   0020
        RLC     R0,     1                       ; 6F87   0050
        NEGR    R0                              ; 6F88   0020
        SWAP    R0,     2                       ; 6F89   0044
        SWAP    R1,     2                       ; 6F8A   0045
        SWAP    R3,     1                       ; 6F8B   0043
        SWAP    R1,     1                       ; 6F8C   0041
        RLC     R2,     1                       ; 6F8D   0052
        SLL     R0,     2                       ; 6F8E   004C
        SLL     R1,     1                       ; 6F8F   0049
        NEGR    R0                              ; 6F90   0020
        SWAP    R1,     1                       ; 6F91   0041
        SLL     R2,     2                       ; 6F92   004E
        SWAP    R0,     2                       ; 6F93   0044
        NEGR    R0                              ; 6F94   0020
        SLL     R1,     2                       ; 6F95   004D
        NEGR    R0                              ; 6F96   0020
        SLL     R0,     2                       ; 6F97   004C
        RLC     R1,     2                       ; 6F98   0055
        SLL     R2,     1                       ; 6F99   004A
        SWAP    R1,     1                       ; 6F9A   0041
        SLL     R2,     2                       ; 6F9B   004E
        ADCR    R5                              ; 6F9C   002D
        SWAP    R2,     1                       ; 6F9D   0042
        SWAP    R1,     1                       ; 6F9E   0041
        SLL     R3,     1                       ; 6F9F   004B
        SWAP    R1,     2                       ; 6FA0   0045
        RLC     R2,     1                       ; 6FA1   0052
        SLL     R1,     1                       ; 6FA2   0049
        SLL     R2,     2                       ; 6FA3   004E
        SLL     R3,     1                       ; 6FA4   004B
        NEGR    R0                              ; 6FA5   0020
L_6FA6:
        PSHR    R5                              ; 6FA6   0275
        MVI     G_01B4, R1                      ; 6FA7   0281 01B4
        MVI     G_01AC, R0                      ; 6FA9   0280 01AC
        CMPI    #$0001, R1                      ; 6FAB   0379 0001
        BEQ     L_6FCC                          ; 6FAD   0204 001D
        BGT     L_6FDD                          ; 6FAF   020E 002C

        TSTR    R0                              ; 6FB1   0080
        BNEQ    L_6FC6                          ; 6FB2   020C 0012

        SDBD                                    ; 6FB4   0001
        MVII    #$6FEE, R4                      ; 6FB5   02BC 00EE 006F
L_6FB8:
        MVII    #$0002, R0                      ; 6FB8   02B8 0002
L_6FBA:
        MVI@    R4,     R1                      ; 6FBA   02A1
        TSTR    R1                              ; 6FBB   0089
        BNEQ    L_6FBF                          ; 6FBC   020C 0001
        PULR    R7                              ; 6FBE   02B7

L_6FBF:
        ADDI    #$0200, R1                      ; 6FBF   02F9 0200
        MVI@    R1,     R2                      ; 6FC1   028A
        XORR    R0,     R2                      ; 6FC2   01C2
        MVO@    R2,     R1                      ; 6FC3   024A
        B       L_6FBA                          ; 6FC4   0220 000B

L_6FC6:
        SDBD                                    ; 6FC6   0001
        MVII    #$6FF1, R4                      ; 6FC7   02BC 00F1 006F
        B       L_6FB8                          ; 6FCA   0220 0013

L_6FCC:
        TSTR    R0                              ; 6FCC   0080
        BNEQ    L_6FD7                          ; 6FCD   020C 0008

        SDBD                                    ; 6FCF   0001
        MVII    #$6FEE, R4                      ; 6FD0   02BC 00EE 006F
L_6FD3:
        MVII    #$0004, R0                      ; 6FD3   02B8 0004
        B       L_6FBA                          ; 6FD5   0220 001C

L_6FD7:
        SDBD                                    ; 6FD7   0001
        MVII    #$6FF1, R4                      ; 6FD8   02BC 00F1 006F
        B       L_6FD3                          ; 6FDB   0220 0009

L_6FDD:
        TSTR    R0                              ; 6FDD   0080
        BNEQ    L_6FE8                          ; 6FDE   020C 0008

        SDBD                                    ; 6FE0   0001
        MVII    #$6FEE, R4                      ; 6FE1   02BC 00EE 006F
L_6FE4:
        MVII    #$0007, R0                      ; 6FE4   02B8 0007
        B       L_6FBA                          ; 6FE6   0220 002D

L_6FE8:
        SDBD                                    ; 6FE8   0001
        MVII    #$6FF1, R4                      ; 6FE9   02BC 00F1 006F
        B       L_6FE4                          ; 6FEC   0220 0009

        DECLE   $00C9,  $00CA,  $0000           ; 6FEE   00C9 00CA 0000

        ADDR    R3,     R0                      ; 6FF1   00D8
        ADDR    R3,     R1                      ; 6FF2   00D9
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFB   0000 0000 0000 0000
        DECLE   $0000                           ; 6FFF   0000

        ORG     $D000

        PSHR    R5                              ; D000   0275
        MVI     G_01A1, R0                      ; D001   0280 01A1
        MVI     G_01B4, R1                      ; D003   0281 01B4
        CMPI    #$0001, R1                      ; D005   0379 0001
        BEQ     L_D04D                          ; D007   0204 0044
        BGT     L_D11E                          ; D009   020E 0113

        JSR     R5,     X_CLAMP                 ; D00B   0004 0114 0270
        DECLE   $0000                           ; D00E   0000

        CLRC                                    ; D00F   0006
        MOVR    R0,     R1                      ; D010   0081
        INCR    R1                              ; D011   0009
        ADDR    R7,     R1                      ; D012   00F9
        ADD@    R1,     R7                      ; D013   02CF

        SUBR    R3,     R0                      ; D014   0118
        SUBR    R3,     R0                      ; D015   0118
        SETC                                    ; D016   0007
        SUBR    R3,     R0                      ; D017   0118
        SETC                                    ; D018   0007
        SUBR    R3,     R0                      ; D019   0118
        NEGR    R2                              ; D01A   0022
L_D01B:
        SDBD                                    ; D01B   0001
        MVII    #$D173, R4                      ; D01C   02BC 0073 00D1
L_D01F:
        MVI@    R4,     R1                      ; D01F   02A1
        TSTR    R1                              ; D020   0089
        BEQ     L_D12C                          ; D021   0204 0109

        JSR     R5,     L_6D8E                  ; D023   0004 016C 018E

        CMPI    #$0001, R3                      ; D026   037B 0001
        BEQ     L_D02E                          ; D028   0204 0004

        CMPI    #$0017, R3                      ; D02A   037B 0017
        BNEQ    L_D01F                          ; D02C   022C 000E

L_D02E:
        ADDI    #$0200, R1                      ; D02E   02F9 0200
        MVI@    R1,     R0                      ; D030   0288
        XORI    #$0004, R0                      ; D031   03F8 0004
        MVO@    R0,     R1                      ; D033   0248
        B       L_D01F                          ; D034   0220 0016

        CLRR    R0                              ; D036   01C0
        MVO     R0,     G_01A1                  ; D037   0240 01A1
        SDBD                                    ; D039   0001
        MVII    #$D160, R4                      ; D03A   02BC 0060 00D1
        MVII    #$0008, R0                      ; D03D   02B8 0008

        JSR     R5,     X_RAND2                 ; D03F   0004 0114 029E

L_D042:
        MVI@    R4,     R1                      ; D042   02A1
        TSTR    R1                              ; D043   0089
        BEQ     L_D01B                          ; D044   0224 002A

        ADDI    #$0200, R1                      ; D046   02F9 0200
        MVI@    R1,     R2                      ; D048   028A
        XORR    R0,     R2                      ; D049   01C2
        MVO@    R2,     R1                      ; D04A   024A
        B       L_D042                          ; D04B   0220 000A

L_D04D:
        MVI     G_01A3, R4                      ; D04D   0284 01A3
        CMPI    #$0001, R4                      ; D04F   037C 0001
        BLT     L_D0D7                          ; D051   0205 0084
        BEQ     L_D0B3                          ; D053   0204 005E

        MVI     G_032B, R2                      ; D055   0282 032B
        MVI     G_0333, R3                      ; D057   0283 0333
        MVI     G_01A4, R1                      ; D059   0281 01A4
        CMPI    #$0010, R1                      ; D05B   0379 0010
        BGE     L_D06A                          ; D05D   020D 000B

L_D05F:
        INCR    R2                              ; D05F   000A
        DECR    R3                              ; D060   0013
L_D061:
        MVO     R2,     G_032B                  ; D061   0242 032B
        MVO     R3,     G_0333                  ; D063   0243 0333
        INCR    R1                              ; D065   0009
        MVO     R1,     G_01A4                  ; D066   0241 01A4
        B       L_D078                          ; D068   0200 000E

L_D06A:
        CMPI    #$0020, R1                      ; D06A   0379 0020
        BLE     L_D074                          ; D06C   0206 0006

        DECR    R4                              ; D06E   0014
        MVO     R4,     G_01A3                  ; D06F   0244 01A3
        CLRR    R1                              ; D071   01C9
        B       L_D05F                          ; D072   0220 0014

L_D074:
        DECR    R2                              ; D074   0012
        INCR    R3                              ; D075   000B
        B       L_D061                          ; D076   0220 0016

L_D078:
        JSR     R5,     L_DFC7                  ; D078   0004 01DC 03C7

        ADDI    #$0004, R2                      ; D07B   02FA 0004
        ADDI    #$0004, R3                      ; D07D   02FB 0004
        MVI     G_032C, R1                      ; D07F   0281 032C
        ANDI    #$00FF, R1                      ; D081   03B9 00FF
        ANDI    #$00FF, R2                      ; D083   03BA 00FF
        SUBR    R1,     R2                      ; D085   010A
        MOVR    R2,     R1                      ; D086   0091
        BPL     L_D08A                          ; D087   0203 0001

        NEGR    R1                              ; D089   0021
L_D08A:
        CMPI    #$0002, R1                      ; D08A   0379 0002
        BGT     L_D0D7                          ; D08C   020E 0049

        MVI     G_0334, R1                      ; D08E   0281 0334
        ANDI    #$007F, R1                      ; D090   03B9 007F
        ANDI    #$007F, R3                      ; D092   03BB 007F
        SUBR    R1,     R3                      ; D094   010B
        MOVR    R3,     R1                      ; D095   0099
        BPL     L_D099                          ; D096   0203 0001

        NEGR    R1                              ; D098   0021
L_D099:
        CMPI    #$0002, R1                      ; D099   0379 0002
        BGT     L_D0D7                          ; D09B   020E 003A

        JSR     R5,     L_DEE1                  ; D09D   0004 01DC 02E1

        SDBD                                    ; D0A0   0001
        MVII    #$3A98, R0                      ; D0A1   02B8 0098 003A

        JSR     R5,     L_D3D6                  ; D0A4   0004 01D0 03D6

        SDBD                                    ; D0A7   0001
        MVII    #$2710, R0                      ; D0A8   02B8 0010 0027

        JSR     R5,     L_D3D6                  ; D0AB   0004 01D0 03D6
        JSR     R5,     L_D2E9                  ; D0AE   0004 01D0 02E9

        B       L_D0B6                          ; D0B1   0200 0003

L_D0B3:
        JSR     R5,     X_STOP_SFX              ; D0B3   0004 011C 02B4

L_D0B6:
        CLRR    R4                              ; D0B6   01E4
        MVO     R4,     G_01A3                  ; D0B7   0244 01A3
        MVO     R4,     G_01A4                  ; D0B9   0244 01A4

        JSR     R5,     L_5370                  ; D0BB   0004 0150 0370
        DECLE   $0000,  $0001                   ; D0BE   0000 0001

        SDBD                                    ; D0C0   0001
        MVII    #$089E, R0                      ; D0C1   02B8 009E 0008
        MVII    #$0203, R1                      ; D0C4   02B9 0203
        MVO@    R0,     R1                      ; D0C6   0248
        MVII    #$0229, R1                      ; D0C7   02B9 0229
        MVO@    R0,     R1                      ; D0C9   0248
        SDBD                                    ; D0CA   0001
        MVII    #$089F, R0                      ; D0CB   02B8 009F 0008
        MVII    #$0216, R1                      ; D0CE   02B9 0216
        MVO@    R0,     R1                      ; D0D0   0248
        MVII    #$023C, R1                      ; D0D1   02B9 023C
        MVO@    R0,     R1                      ; D0D3   0248

        JSR     R5,     L_DF08                  ; D0D4   0004 01DC 0308

L_D0D7:
        MVI     G_01A1, R0                      ; D0D7   0280 01A1

        JSR     R5,     X_CLAMP                 ; D0D9   0004 0114 0270
        DECLE   $0000,  $0004                   ; D0DC   0000 0004

        MOVR    R0,     R1                      ; D0DE   0081
        INCR    R1                              ; D0DF   0009
        ADDR    R7,     R1                      ; D0E0   00F9
        ADD@    R1,     R7                      ; D0E1   02CF

        DECLE   $004A,  $004A,  $0005           ; D0E2   004A 004A 0005

        SLL     R2,     1                       ; D0E5   004A
L_D0E6:
        GSWD    R1                              ; D0E6   0031
L_D0E7:
        MVI     G_0194, R1                      ; D0E7   0281 0194
        TSTR    R1                              ; D0E9   0089
        BEQ     L_D0F8                          ; D0EA   0204 000C

        MVII    #$021C, R1                      ; D0EC   02B9 021C
        MVI@    R1,     R0                      ; D0EE   0288
        XORI    #$0006, R0                      ; D0EF   03F8 0006
        MVO@    R0,     R1                      ; D0F1   0248
        MVII    #$021E, R1                      ; D0F2   02B9 021E
        MVI@    R1,     R0                      ; D0F4   0288
        XORI    #$0006, R0                      ; D0F5   03F8 0006
        MVO@    R0,     R1                      ; D0F7   0248
L_D0F8:
        SDBD                                    ; D0F8   0001
        MVII    #$D178, R4                      ; D0F9   02BC 0078 00D1
L_D0FC:
        MVI@    R4,     R1                      ; D0FC   02A1
        TSTR    R1                              ; D0FD   0089
        BEQ     L_D12C                          ; D0FE   0204 002C

        JSR     R5,     L_6D8E                  ; D100   0004 016C 018E

        CMPI    #$0001, R3                      ; D103   037B 0001
        BEQ     L_D10B                          ; D105   0204 0004

        CMPI    #$0013, R3                      ; D107   037B 0013
        BNEQ    L_D0FC                          ; D109   022C 000E

L_D10B:
        ADDI    #$0200, R1                      ; D10B   02F9 0200
        MVI@    R1,     R0                      ; D10D   0288
        XORI    #$0001, R0                      ; D10E   03F8 0001
        MVO@    R0,     R1                      ; D110   0248
        B       L_D0FC                          ; D111   0220 0016

        MVII    #$0275, R1                      ; D113   02B9 0275
        MVI@    R1,     R0                      ; D115   0288
        XORI    #$0006, R0                      ; D116   03F8 0006
        MVO@    R0,     R1                      ; D118   0248
        CLRR    R0                              ; D119   01C0
        MVO     R0,     G_01A1                  ; D11A   0240 01A1
        B       L_D0E7                          ; D11C   0220 0036

L_D11E:
        JSR     R5,     X_CLAMP                 ; D11E   0004 0114 0270
        DECLE   $0000,  $0004                   ; D121   0000 0004

        MOVR    R0,     R1                      ; D123   0081
        INCR    R1                              ; D124   0009
        ADDR    R7,     R1                      ; D125   00F9
        ADD@    R1,     R7                      ; D126   02CF

        DECLE   $0005,  $0005,  $000B,  $0005   ; D127   0005 0005 000B 0005

        COMR    R3                              ; D12B   001B
L_D12C:
        MVI     G_01A1, R1                      ; D12C   0281 01A1
        INCR    R1                              ; D12E   0009
        MVO     R1,     G_01A1                  ; D12F   0241 01A1
        PULR    R7                              ; D131   02B7

        SDBD                                    ; D132   0001
        MVII    #$D188, R4                      ; D133   02BC 0088 00D1
L_D136:
        MVI@    R4,     R1                      ; D136   02A1
        TSTR    R1                              ; D137   0089
        BEQ     L_D12C                          ; D138   0224 000D

        ADDI    #$0200, R1                      ; D13A   02F9 0200
        MVI@    R1,     R0                      ; D13C   0288
        XORI    #$0006, R0                      ; D13D   03F8 0006
        MVO@    R0,     R1                      ; D13F   0248
        B       L_D136                          ; D140   0220 000B

        SDBD                                    ; D142   0001
        MVII    #$D18D, R4                      ; D143   02BC 008D 00D1
        CLRR    R0                              ; D146   01C0
        MVO     R0,     G_01A1                  ; D147   0240 01A1
        B       L_D136                          ; D149   0220 0014

L_D14B:
        PSHR    R5                              ; D14B   0275
        SDBD                                    ; D14C   0001
        MVII    #$D17F, R4                      ; D14D   02BC 007F 00D1
L_D150:
        MVI@    R4,     R0                      ; D150   02A0
        CMPI    #$0063, R0                      ; D151   0378 0063
        BNEQ    L_D156                          ; D153   020C 0001
        PULR    R7                              ; D155   02B7

L_D156:
        SDBD                                    ; D156   0001
        XORI    #$0800, R0                      ; D157   03F8 0000 0008
        MVI@    R4,     R1                      ; D15A   02A1
        ADDI    #$0200, R1                      ; D15B   02F9 0200
        MVO@    R0,     R1                      ; D15D   0248
        B       L_D150                          ; D15E   0220 000F

        ADDR    R2,     R1                      ; D160   00D1
        ADDR    R2,     R2                      ; D161   00D2
        MOVR    R7,     R5                      ; D162   00BD
        MOVR    R7,     R6                      ; D163   00BE
        MOVR    R5,     R0                      ; D164   00A8
        MOVR    R5,     R1                      ; D165   00A9
        MOVR    R5,     R2                      ; D166   00AA
        MOVR    R5,     R3                      ; D167   00AB
        MOVR    R2,     R3                      ; D168   0093
        MOVR    R2,     R4                      ; D169   0094
        MOVR    R2,     R5                      ; D16A   0095
        MOVR    R2,     R6                      ; D16B   0096
        MOVR    R2,     R7                      ; D16C   0097

        DECLE   $0098,  $007F,  $0080,  $0083   ; D16D   0098 007F 0080 0083
        DECLE   $0084,  $0000,  $0052,  $0065   ; D171   0084 0000 0052 0065
        DECLE   $0061,  $0076,  $0000,  $0003   ; D175   0061 0076 0000 0003
        DECLE   $0016,  $0029,  $003C,  $004A   ; D179   0016 0029 003C 004A
        DECLE   $005F,  $0000,  $00BE,  $0052   ; D17D   005F 0000 00BE 0052
        DECLE   $00BA,  $0065,  $000A,  $0061   ; D181   00BA 0065 000A 0061
        DECLE   $000E,  $0076,  $0063,  $0054   ; D185   000E 0076 0063 0054
        DECLE   $0056,  $005D,  $005F,  $0000   ; D189   0056 005D 005F 0000
        DECLE   $006A,  $006C,  $006F,  $0071   ; D18D   006A 006C 006F 0071
        DECLE   $0000                           ; D191   0000
L_D192:
        PSHR    R5                              ; D192   0275
        CLRR    R0                              ; D193   01C0
        MVO     R0,     G_0188                  ; D194   0240 0188
        MVO     R0,     G_0163                  ; D196   0240 0163
        MVO     R0,     G_0190                  ; D198   0240 0190
        MVO     R0,     G_0191                  ; D19A   0240 0191

        JSR     R5,     L_5370                  ; D19C   0004 0150 0370
        DECLE   $0000,  $0003                   ; D19F   0000 0003

        MVI     G_01AC, R0                      ; D1A1   0280 01AC
        TSTR    R0                              ; D1A3   0080
        BNEQ    L_D1AA                          ; D1A4   020C 0004

        MVI     G_01A8, R0                      ; D1A6   0280 01A8
        B       L_D1AC                          ; D1A8   0200 0002

L_D1AA:
        MVI     G_01A9, R0                      ; D1AA   0280 01A9
L_D1AC:
        MVO     R0,     G_0162                  ; D1AC   0240 0162
        TSTR    R0                              ; D1AE   0080
        BEQ     L_D1B8                          ; D1AF   0204 0007

        JSR     R5,     L_5370                  ; D1B1   0004 0150 0370
        DECLE   $0006,  $0000                   ; D1B4   0006 0000

        B       L_D1BD                          ; D1B6   0200 0005

L_D1B8:
        JSR     R5,     L_5370                  ; D1B8   0004 0150 0370
        DECLE   $0008,  $0000                   ; D1BB   0008 0000
L_D1BD:
        SDBD                                    ; D1BD   0001
        MVII    #$4891, R0                      ; D1BE   02B8 0091 0048
        MVII    #$0258, R1                      ; D1C1   02B9 0258
        MVO@    R0,     R1                      ; D1C3   0248
        MVII    #$025B, R1                      ; D1C4   02B9 025B
        MVO@    R0,     R1                      ; D1C6   0248
        MVII    #$0005, R0                      ; D1C7   02B8 0005
        MVO     R0,     G_0106                  ; D1C9   0240 0106

        JSR     R5,     L_D14B                  ; D1CB   0004 01D0 014B
        JSR     R5,     L_DF08                  ; D1CE   0004 01DC 0308
        JSR     R5,     L_D3A4                  ; D1D1   0004 01D0 03A4
        JSR     R5,     L_D3BD                  ; D1D4   0004 01D0 03BD

        SDBD                                    ; D1D7   0001
        MVII    #$188D, R0                      ; D1D8   02B8 008D 0018
        MVII    #$021B, R1                      ; D1DB   02B9 021B
        MVO@    R0,     R1                      ; D1DD   0248
        MVII    #$0220, R1                      ; D1DE   02B9 0220
        MVO@    R0,     R1                      ; D1E0   0248
        SDBD                                    ; D1E1   0001
        MVII    #$286E, R0                      ; D1E2   02B8 006E 0028
        MVII    #$02C9, R1                      ; D1E5   02B9 02C9
        MVO@    R0,     R1                      ; D1E7   0248
        SDBD                                    ; D1E8   0001
        MVII    #$0816, R0                      ; D1E9   02B8 0016 0008
        MVII    #$02CA, R1                      ; D1EC   02B9 02CA
        MVO@    R0,     R1                      ; D1EE   0248
        SDBD                                    ; D1EF   0001
        MVII    #$28C6, R0                      ; D1F0   02B8 00C6 0028
        MVII    #$02D8, R1                      ; D1F3   02B9 02D8
        MVO@    R0,     R1                      ; D1F5   0248
        SDBD                                    ; D1F6   0001
        MVII    #$091E, R0                      ; D1F7   02B8 001E 0009
        MVII    #$02D9, R1                      ; D1FA   02B9 02D9
        MVO@    R0,     R1                      ; D1FC   0248
        MVII    #$00A3, R0                      ; D1FD   02B8 00A3
        SWAP    R0,     1                       ; D1FF   0040
        MVO     R0,     G_0326                  ; D200   0240 0326
        MVII    #$0054, R0                      ; D202   02B8 0054
        SWAP    R0,     1                       ; D204   0040
        MVO     R0,     G_0327                  ; D205   0240 0327
        MVI     G_01AA, R2                      ; D207   0282 01AA
        TSTR    R2                              ; D209   0092
        BEQ     L_D211                          ; D20A   0204 0005

        CLRR    R2                              ; D20C   01D2
        MVO     R2,     G_01AA                  ; D20D   0242 01AA
        INCR    R7                              ; D20F   000F

L_D210:
        PSHR    R5                              ; D210   0275
L_D211:
        MVI     G_01AB, R0                      ; D211   0280 01AB
        INCR    R0                              ; D213   0008
        MVII    #$0001, R1                      ; D214   02B9 0001
        MVI     G_01AA, R2                      ; D216   0282 01AA
        TSTR    R2                              ; D218   0092
        BEQ     L_D21F                          ; D219   0204 0004

        MVII    #$0002, R3                      ; D21B   02BB 0002
        B       L_D221                          ; D21D   0200 0002

L_D21F:
        MVII    #$0007, R3                      ; D21F   02BB 0007
L_D221:
        MVII    #$0200, R4                      ; D221   02BC 0200

        JSR     R5,     X_PRNUM_RGT             ; D223   0004 0118 00C5

        MVI     G_0347, R0                      ; D226   0280 0347
        MVI     G_0348, R1                      ; D228   0281 0348
        SDBD                                    ; D22A   0001
        MVII    #$2007, R3                      ; D22B   02BB 0007 0020
        MVII    #$02DC, R4                      ; D22E   02BC 02DC

        JSR     R5,     L_D42D                  ; D230   0004 01D4 002D

        MVI     G_0349, R0                      ; D233   0280 0349
        MVI     G_034A, R1                      ; D235   0281 034A
        SDBD                                    ; D237   0001
        MVII    #$2007, R3                      ; D238   02BB 0007 0020
        MVII    #$02EA, R4                      ; D23B   02BC 02EA

        JSR     R5,     L_D42D                  ; D23D   0004 01D4 002D

        MVII    #$0192, R4                      ; D240   02BC 0192
        MVII    #$0016, R0                      ; D242   02B8 0016

        JSR     R5,     X_FILL_ZERO             ; D244   0004 0114 0338

        INCR    R7                              ; D247   000F

L_D248:
        PSHR    R5                              ; D248   0275
L_D249:
        MVI     G_018C, R1                      ; D249   0281 018C

        JSR     R5,     L_D545                  ; D24B   0004 01D4 0145

        INCR    R7                              ; D24E   000F

L_D24F:
        PSHR    R5                              ; D24F   0275
L_D250:
        MVI     G_018D, R1                      ; D250   0281 018D

        JSR     R5,     L_D537                  ; D252   0004 01D4 0137

        PULR    R7                              ; D255   02B7

L_D256:
        MVII    #$0079, R0                      ; D256   02B8 0079
        MVI     G_0328, R2                      ; D258   0282 0328
        TSTR    R2                              ; D25A   0092
        BMI     L_D25E                          ; D25B   020B 0001

        NEGR    R2                              ; D25D   0022
L_D25E:
        B       L_D268                          ; D25E   0200 0008

L_D260:
        MVII    #$0037, R0                      ; D260   02B8 0037
        MVI     G_0328, R2                      ; D262   0282 0328
        TSTR    R2                              ; D264   0092
        BPL     L_D268                          ; D265   0203 0001

        NEGR    R2                              ; D267   0022
L_D268:
        MVO     R2,     G_0328                  ; D268   0242 0328
        SWAP    R0,     1                       ; D26A   0040
        MVII    #$0027, R1                      ; D26B   02B9 0027
        SWAP    R1,     1                       ; D26D   0041
        MVO     R0,     G_0326                  ; D26E   0240 0326
        MVO     R1,     G_0327                  ; D270   0241 0327
        MVI     G_0329, R3                      ; D272   0283 0329
        TSTR    R3                              ; D274   009B
        BPL     L_D278                          ; D275   0203 0001

        NEGR    R3                              ; D277   0023
L_D278:
        MVO     R3,     G_0329                  ; D278   0243 0329
        MOVR    R5,     R7                      ; D27A   00AF

L_D27B:
        PSHR    R5                              ; D27B   0275
        MVI     G_032D, R1                      ; D27C   0281 032D
        MVI     G_032C, R0                      ; D27E   0280 032C
        ANDI    #$00FF, R0                      ; D280   03B8 00FF
        ANDI    #$00FF, R1                      ; D282   03B9 00FF
        SUBR    R0,     R1                      ; D284   0101
        MOVR    R1,     R0                      ; D285   0088
        BPL     L_D289                          ; D286   0203 0001

        NEGR    R0                              ; D288   0020
L_D289:
        CMPI    #$0005, R0                      ; D289   0378 0005
        BGT     L_D2C5                          ; D28B   020E 0038

        MVI     G_0335, R1                      ; D28D   0281 0335
        MVI     G_0334, R0                      ; D28F   0280 0334
        ANDI    #$007F, R0                      ; D291   03B8 007F
        ANDI    #$007F, R1                      ; D293   03B9 007F
        SUBR    R0,     R1                      ; D295   0101
        MOVR    R1,     R0                      ; D296   0088
        BPL     L_D29A                          ; D297   0203 0001

        NEGR    R0                              ; D299   0020
L_D29A:
        CMPI    #$0005, R0                      ; D29A   0378 0005
        BGT     L_D2C5                          ; D29C   020E 0027

        MVI     G_0196, R0                      ; D29E   0280 0196
        TSTR    R0                              ; D2A0   0080
        BNEQ    L_D2C5                          ; D2A1   020C 0022

        MVII    #$0056, R0                      ; D2A3   02B8 0056
        MVII    #$000C, R1                      ; D2A5   02B9 000C
        SWAP    R0,     1                       ; D2A7   0040
        SWAP    R1,     1                       ; D2A8   0041
        MVO     R0,     G_0326                  ; D2A9   0240 0326
        MVO     R1,     G_0327                  ; D2AB   0241 0327
        MVII    #$0064, R0                      ; D2AD   02B8 0064
        MVO     R0,     G_0195                  ; D2AF   0240 0195
        MVO     R0,     G_0196                  ; D2B1   0240 0196

        JSR     R5,     L_DF22                  ; D2B3   0004 01DC 0322

        CLRR    R0                              ; D2B6   01C0
        MVO     R0,     G_0328                  ; D2B7   0240 0328
        MVO     R0,     G_0329                  ; D2B9   0240 0329
        INCR    R0                              ; D2BB   0008
        MVO     R0,     G_015D                  ; D2BC   0240 015D
        SDBD                                    ; D2BE   0001
        MVII    #$0FA0, R0                      ; D2BF   02B8 00A0 000F

        JSR     R5,     L_D3D6                  ; D2C2   0004 01D0 03D6

L_D2C5:
        PULR    R7                              ; D2C5   02B7

L_D2C6:
        PSHR    R5                              ; D2C6   0275
        SDBD                                    ; D2C7   0001
        ADDI    #$033A, R1                      ; D2C8   02F9 003A 0003
        MVI@    R1,     R0                      ; D2CB   0288
        XORI    #$0008, R0                      ; D2CC   03F8 0008
        MVO@    R0,     R1                      ; D2CE   0248
        MVI     G_01A2, R0                      ; D2CF   0280 01A2
        DECR    R0                              ; D2D1   0010
        MVO     R0,     G_01A2                  ; D2D2   0240 01A2
        MVII    #$000A, R0                      ; D2D4   02B8 000A

        JSR     R5,     L_D3D6                  ; D2D6   0004 01D0 03D6
        JSR     R5,     L_DFB6                  ; D2D9   0004 01DC 03B6

        PULR    R7                              ; D2DC   02B7

L_D2DD:
        MVI@    R5,     R0                      ; D2DD   02A8
        ADD     G_018D, R0                      ; D2DE   02C0 018D
        CMPI    #$001E, R0                      ; D2E0   0378 001E
        BLE     L_D2E6                          ; D2E2   0206 0002

        MVII    #$001E, R0                      ; D2E4   02B8 001E
L_D2E6:
        MVO     R0,     G_018D                  ; D2E6   0240 018D
        MOVR    R5,     R7                      ; D2E8   00AF

L_D2E9:
        MVI     G_018C, R1                      ; D2E9   0281 018C
        INCR    R1                              ; D2EB   0009
        CMPI    #$0005, R1                      ; D2EC   0379 0005
        BLE     L_D2F2                          ; D2EE   0206 0002

        MVII    #$0005, R1                      ; D2F0   02B9 0005
L_D2F2:
        MVO     R1,     G_018C                  ; D2F2   0241 018C
        MOVR    R5,     R7                      ; D2F4   00AF

L_D2F5:
        PSHR    R5                              ; D2F5   0275
        MVI     G_01A5, R0                      ; D2F6   0280 01A5
        TSTR    R0                              ; D2F8   0080
        BNEQ    L_D2C5                          ; D2F9   022C 0035

        MVI     G_01A7, R1                      ; D2FB   0281 01A7
        MOVR    R1,     R0                      ; D2FD   0088
        INCR    R0                              ; D2FE   0008
        INCR    R1                              ; D2FF   0009
        ADDR    R7,     R1                      ; D300   00F9
        ADD@    R1,     R7                      ; D301   02CF

        DECLE   $0005                           ; D302   0005

        INCR    R6                              ; D303   000E
        COMR    R6                              ; D304   001E
        ADCR    R6                              ; D305   002E
        RSWD    R6                              ; D306   003E
        SDBD                                    ; D307   0001
        MVII    #$D379, R4                      ; D308   02BC 0079 00D3

        JSR     R5,     L_D351                  ; D30B   0004 01D0 0351

        B       L_D34E                          ; D30E   0200 003E

        SDBD                                    ; D310   0001
        MVII    #$D37E, R4                      ; D311   02BC 007E 00D3

        JSR     R5,     L_D351                  ; D314   0004 01D0 0351

        SDBD                                    ; D317   0001
        MVII    #$D392, R4                      ; D318   02BC 0092 00D3

        JSR     R5,     L_D361                  ; D31B   0004 01D0 0361

        B       L_D34E                          ; D31E   0200 002E

        SDBD                                    ; D320   0001
        MVII    #$D383, R4                      ; D321   02BC 0083 00D3

        JSR     R5,     L_D351                  ; D324   0004 01D0 0351

        SDBD                                    ; D327   0001
        MVII    #$D395, R4                      ; D328   02BC 0095 00D3

        JSR     R5,     L_D361                  ; D32B   0004 01D0 0361

        B       L_D34E                          ; D32E   0200 001E

        SDBD                                    ; D330   0001
        MVII    #$D388, R4                      ; D331   02BC 0088 00D3

        JSR     R5,     L_D351                  ; D334   0004 01D0 0351

        SDBD                                    ; D337   0001
        MVII    #$D398, R4                      ; D338   02BC 0098 00D3

        JSR     R5,     L_D361                  ; D33B   0004 01D0 0361

        B       L_D34E                          ; D33E   0200 000E

        SDBD                                    ; D340   0001
        MVII    #$D38D, R4                      ; D341   02BC 008D 00D3

        JSR     R5,     L_D351                  ; D344   0004 01D0 0351

        SDBD                                    ; D347   0001
        MVII    #$D39B, R4                      ; D348   02BC 009B 00D3

        JSR     R5,     L_D361                  ; D34B   0004 01D0 0361

L_D34E:
        MVO     R0,     G_01A7                  ; D34E   0240 01A7
        PULR    R7                              ; D350   02B7

L_D351:
        PSHR    R5                              ; D351   0275
L_D352:
        MVI@    R4,     R1                      ; D352   02A1
        TSTR    R1                              ; D353   0089
        BEQ     L_D360                          ; D354   0204 000A

        ADDI    #$0200, R1                      ; D356   02F9 0200
        MVI@    R4,     R2                      ; D358   02A2
        SDBD                                    ; D359   0001
        XORI    #$0800, R2                      ; D35A   03FA 0000 0008
        MVO@    R2,     R1                      ; D35D   024A
        B       L_D352                          ; D35E   0220 000D
L_D360:
        PULR    R7                              ; D360   02B7

L_D361:
        PSHR    R5                              ; D361   0275
        CLRR    R3                              ; D362   01DB
L_D363:
        MVI@    R4,     R1                      ; D363   02A1
        TSTR    R1                              ; D364   0089
        BEQ     L_D360                          ; D365   0224 0006

        ADDI    #$0200, R1                      ; D367   02F9 0200
        MVO@    R3,     R1                      ; D369   024B
        B       L_D363                          ; D36A   0220 0008

L_D36C:
        PSHR    R5                              ; D36C   0275
        MVI     G_018B, R0                      ; D36D   0280 018B
        TSTR    R0                              ; D36F   0080
        BEQ     L_D2C5                          ; D370   0224 00AC

        MVI     G_033C, R0                      ; D372   0280 033C
        XORI    #$0001, R0                      ; D374   03F8 0001
        MVO     R0,     G_033C                  ; D376   0240 033C
        PULR    R7                              ; D378   02B7

        DECLE   $0069,  $00CD,  $007D,  $00D5   ; D379   0069 00CD 007D 00D5
        DECLE   $0000,  $007F,  $00CD,  $0093   ; D37D   0000 007F 00CD 0093
        DECLE   $00D5,  $0000,  $0096,  $00CD   ; D381   00D5 0000 0096 00CD
        DECLE   $00AA,  $00D5,  $0000,  $0084   ; D385   00AA 00D5 0000 0084
        DECLE   $00B5,  $0098,  $00BD,  $0000   ; D389   00B5 0098 00BD 0000
        DECLE   $0072,  $00B5,  $0086,  $00BD   ; D38D   0072 00B5 0086 00BD
        DECLE   $0000,  $0069,  $007D,  $0000   ; D391   0000 0069 007D 0000
        DECLE   $007F,  $0093,  $0000,  $0096   ; D395   007F 0093 0000 0096
        DECLE   $00AA,  $0000,  $0084,  $0098   ; D399   00AA 0000 0084 0098
        DECLE   $0000,  $002C,  $002D,  $0000   ; D39D   0000 002C 002D 0000
        DECLE   $0036,  $0037,  $0000           ; D3A1   0036 0037 0000
L_D3A4:
        PSHR    R5                              ; D3A4   0275
        MVII    #$00C0, R0                      ; D3A5   02B8 00C0
        SWAP    R0,     1                       ; D3A7   0040
        MVII    #$02C3, R1                      ; D3A8   02B9 02C3
        MVO@    R0,     R1                      ; D3AA   0248
        SDBD                                    ; D3AB   0001
        MVII    #$D3A1, R4                      ; D3AC   02BC 00A1 00D3
L_D3AF:
        MVI@    R4,     R1                      ; D3AF   02A1
        TSTR    R1                              ; D3B0   0089
        BEQ     L_D2C5                          ; D3B1   0224 00ED

        ADDI    #$0200, R1                      ; D3B3   02F9 0200
        MVI@    R1,     R0                      ; D3B5   0288
        SDBD                                    ; D3B6   0001
        ANDI    #$F000, R0                      ; D3B7   03B8 0000 00F0
        MVO@    R0,     R1                      ; D3BA   0248
        B       L_D3AF                          ; D3BB   0220 000D

L_D3BD:
        PSHR    R5                              ; D3BD   0275
        DECLE   $02B8,  $00C0,  $0040,  $02B9   ; D3BE   02B8 00C0 0040 02B9
        DECLE   $02B8,  $0248,  $0001           ; D3C2   02B8 0248 0001

        MVII    #$009E, R4                      ; D3C5   02BC 009E
        ADDR    R2,     R3                      ; D3C7   00D3
L_D3C8:
        MVI@    R4,     R1                      ; D3C8   02A1
        TSTR    R1                              ; D3C9   0089
        BEQ     L_D2C5                          ; D3CA   0224 0106

        ADDI    #$0200, R1                      ; D3CC   02F9 0200
        MVI@    R1,     R0                      ; D3CE   0288
        SDBD                                    ; D3CF   0001
        ANDI    #$F000, R0                      ; D3D0   03B8 0000 00F0
        MVO@    R0,     R1                      ; D3D3   0248
        B       L_D3C8                          ; D3D4   0220 000D

L_D3D6:
        PSHR    R5                              ; D3D6   0275
        PSHR    R2                              ; D3D7   0272
        MVI     G_018B, R1                      ; D3D8   0281 018B
        TSTR    R1                              ; D3DA   0089
        BEQ     L_D3E3                          ; D3DB   0204 0006

        MVII    #$0002, R1                      ; D3DD   02B9 0002

        JSR     R5,     X_MPY                   ; D3DF   0004 011C 01DC

        MOVR    R2,     R0                      ; D3E2   0090
L_D3E3:
        PULR    R2                              ; D3E3   02B2
        MVI     G_01AC, R3                      ; D3E4   0283 01AC
        TSTR    R3                              ; D3E6   009B
        BNEQ    L_D3EF                          ; D3E7   020C 0006

        ADD     G_0347, R0                      ; D3E9   02C0 0347
        MVI     G_0348, R1                      ; D3EB   0281 0348
        B       L_D3F3                          ; D3ED   0200 0004

L_D3EF:
        ADD     G_0349, R0                      ; D3EF   02C0 0349
        MVI     G_034A, R1                      ; D3F1   0281 034A
L_D3F3:
        TSTR    R0                              ; D3F3   0080
        BPL     L_D3FE                          ; D3F4   0203 0008

        TSTR    R1                              ; D3F6   0089
        BEQ     L_D407                          ; D3F7   0204 000E

        ADDI    #$03E8, R0                      ; D3F9   02F8 03E8
        DECR    R1                              ; D3FB   0011
        B       L_D3F3                          ; D3FC   0220 000A

L_D3FE:
        CMPI    #$03E8, R0                      ; D3FE   0378 03E8
        BLT     L_D407                          ; D400   0205 0005

        SUBI    #$03E8, R0                      ; D402   0338 03E8
        INCR    R1                              ; D404   0009
        B       L_D3F3                          ; D405   0220 0013

L_D407:
        CMPI    #$03E7, R1                      ; D407   0379 03E7
        BLE     L_D415                          ; D409   0206 000A

        MVII    #$03E7, R0                      ; D40B   02B8 03E7
        MOVR    R0,     R1                      ; D40D   0081
        PSHR    R2                              ; D40E   0272

        JSR     R5,     L_D47B                  ; D40F   0004 01D4 007B

        PULR    R2                              ; D412   02B2
        CLRR    R0                              ; D413   01C0
        CLRR    R1                              ; D414   01C9
L_D415:
        MVI     G_01AC, R3                      ; D415   0283 01AC
        TSTR    R3                              ; D417   009B
        BEQ     L_D422                          ; D418   0204 0008

        MVO     R0,     G_0349                  ; D41A   0240 0349
        MVO     R1,     G_034A                  ; D41C   0241 034A
        MVII    #$02EA, R4                      ; D41E   02BC 02EA
        B       L_D428                          ; D420   0200 0006

L_D422:
        MVO     R0,     G_0347                  ; D422   0240 0347
        MVO     R1,     G_0348                  ; D424   0241 0348
        MVII    #$02DC, R4                      ; D426   02BC 02DC
L_D428:
        SDBD                                    ; D428   0001
        MVII    #$2007, R3                      ; D429   02BB 0007 0020
        INCR    R7                              ; D42C   000F

L_D42D:
        PSHR    R5                              ; D42D   0275
L_D42E:
        PSHR    R0                              ; D42E   0270
        MOVR    R1,     R0                      ; D42F   0088
        MVII    #$0003, R1                      ; D430   02B9 0003

        JSR     R5,     X_PRNUM_ZRO             ; D432   0004 0118 00AD

        PULR    R0                              ; D435   02B0
        ADDI    #$0003, R4                      ; D436   02FC 0003
        SDBD                                    ; D438   0001
        ANDI    #$DFFF, R3                      ; D439   03BB 00FF 00DF

        JSR     R5,     X_PRNUM_ZRO             ; D43C   0004 0118 00AD

        PULR    R7                              ; D43F   02B7

L_D440:
        PSHR    R5                              ; D440   0275

        JSR     R5,     L_D46C                  ; D441   0004 01D4 006C

        BC      L_D460                          ; D444   0201 001A

        MVII    #$0002, R3                      ; D446   02BB 0002
        MVII    #$02DE, R4                      ; D448   02BC 02DE

        JSR     R5,     X_PRINT_R5              ; D44A   0004 0118 007B
        STRING  "Hi Score"                      ; D44D  
        DECLE   $0000                           ; D455   0000

        JSR     R5,     L_D46C                  ; D456   0004 01D4 006C

        MVII    #$0002, R3                      ; D459   02BB 0002
        MVII    #$02E8, R4                      ; D45B   02BC 02E8

        JSR     R5,     L_D42D                  ; D45D   0004 01D4 002D

L_D460:
        PULR    R7                              ; D460   02B7

L_D461:
        PSHR    R5                              ; D461   0275
        MOVR    R0,     R2                      ; D462   0082
        SETC                                    ; D463   0007
        RRC     R2,     1                       ; D464   0072
        RRC     R2,     1                       ; D465   0072
        RRC     R2,     1                       ; D466   0072
        ADCR    R2                              ; D467   002A
        COMR    R1                              ; D468   0019
        ADDR    R1,     R2                      ; D469   00CA
        COMR    R1                              ; D46A   0019
        PULR    R7                              ; D46B   02B7

L_D46C:
        PSHR    R5                              ; D46C   0275
        MVI     G_035A, R0                      ; D46D   0280 035A
        MVI     G_035B, R1                      ; D46F   0281 035B

        JSR     R5,     L_D461                  ; D471   0004 01D4 0061

        CMP     G_035C, R2                      ; D474   0342 035C
        CLRC                                    ; D476   0006
        BEQ     L_D47A                          ; D477   0204 0001

        SETC                                    ; D479   0007
L_D47A:
        PULR    R7                              ; D47A   02B7

L_D47B:
        PSHR    R5                              ; D47B   0275
        MOVR    R0,     R3                      ; D47C   0083
        MOVR    R1,     R4                      ; D47D   008C

        JSR     R5,     L_D46C                  ; D47E   0004 01D4 006C

        BC      L_D48B                          ; D481   0201 0008

        CMPR    R1,     R4                      ; D483   014C
        BGT     L_D48B                          ; D484   020E 0005
        BLT     L_D496                          ; D486   0205 000E

        CMPR    R0,     R3                      ; D488   0143
        BLT     L_D496                          ; D489   0205 000B

L_D48B:
        MVO     R3,     G_035A                  ; D48B   0243 035A
        MVO     R4,     G_035B                  ; D48D   0244 035B
        MOVR    R3,     R0                      ; D48F   0098
        MOVR    R4,     R1                      ; D490   00A1

        JSR     R5,     L_D461                  ; D491   0004 01D4 0061

        MVO     R2,     G_035C                  ; D494   0242 035C
L_D496:
        PULR    R7                              ; D496   02B7

L_D497:
        PSHR    R5                              ; D497   0275
        MVI     G_01B4, R0                      ; D498   0280 01B4
        CMPI    #$0001, R0                      ; D49A   0378 0001
        BEQ     L_D4BF                          ; D49C   0204 0021
        BGT     L_D506                          ; D49E   020E 0066

        SDBD                                    ; D4A0   0001
        MVII    #$D51E, R4                      ; D4A1   02BC 001E 00D5
        B       L_D4DC                          ; D4A4   0200 0036

L_D4A6:
        MVI     G_0197, R0                      ; D4A6   0280 0197
        TSTR    R0                              ; D4A8   0080
        BNEQ    L_D4B2                          ; D4A9   020C 0007

        SDBD                                    ; D4AB   0001
        MVII    #$4891, R0                      ; D4AC   02B8 0091 0048
        MVII    #$0258, R1                      ; D4AF   02B9 0258
        MVO@    R0,     R1                      ; D4B1   0248
L_D4B2:
        MVI     G_0198, R0                      ; D4B2   0280 0198
        TSTR    R0                              ; D4B4   0080
        BNEQ    L_D4DB                          ; D4B5   020C 0024

        SDBD                                    ; D4B7   0001
        MVII    #$4891, R0                      ; D4B8   02B8 0091 0048
        MVII    #$025B, R1                      ; D4BB   02B9 025B
        MVO@    R0,     R1                      ; D4BD   0248
        PULR    R7                              ; D4BE   02B7

L_D4BF:
        SDBD                                    ; D4BF   0001
        MVII    #$D529, R4                      ; D4C0   02BC 0029 00D5
        B       L_D4DC                          ; D4C3   0200 0017

L_D4C5:
        MVII    #$0259, R2                      ; D4C5   02BA 0259
        MVII    #$026B, R3                      ; D4C7   02BB 026B
        MVII    #$026F, R4                      ; D4C9   02BC 026F
        SDBD                                    ; D4CB   0001
        MVII    #$5877, R0                      ; D4CC   02B8 0077 0058
        MVI     G_018F, R1                      ; D4CF   0281 018F
        INCR    R1                              ; D4D1   0009
        ADDR    R7,     R1                      ; D4D2   00F9
        ADD@    R1,     R7                      ; D4D3   02CF

        DECLE   $0004,  $0005                   ; D4D4   0004 0005

        CLRC                                    ; D4D6   0006
        SETC                                    ; D4D7   0007
        MVO@    R0,     R2                      ; D4D8   0250
        MVO@    R0,     R3                      ; D4D9   0258
        MVO@    R0,     R4                      ; D4DA   0260
L_D4DB:
        PULR    R7                              ; D4DB   02B7

L_D4DC:
        MVI@    R4,     R0                      ; D4DC   02A0
        CMPI    #$0064, R0                      ; D4DD   0378 0064
        BEQ     L_D4A6                          ; D4DF   0224 003A

        CMPI    #$0065, R0                      ; D4E1   0378 0065
        BEQ     L_D4C5                          ; D4E3   0224 001F

        CMPI    #$0063, R0                      ; D4E5   0378 0063
        BNEQ    L_D4EA                          ; D4E7   020C 0001
        PULR    R7                              ; D4E9   02B7

L_D4EA:
        SLL     R0,     2                       ; D4EA   004C
        SLL     R0,     1                       ; D4EB   0048
        MVI@    R4,     R1                      ; D4EC   02A1
        CMPI    #$0007, R1                      ; D4ED   0379 0007
        BGT     L_D500                          ; D4EF   020E 000F

        MVII    #$0008, R3                      ; D4F1   02BB 0008
L_D4F3:
        SWAP    R3,     1                       ; D4F3   0043
        XORR    R3,     R0                      ; D4F4   01D8
        XORR    R1,     R0                      ; D4F5   01C8
        MVI@    R4,     R1                      ; D4F6   02A1
L_D4F7:
        ADDI    #$0200, R1                      ; D4F7   02F9 0200
        MVO@    R0,     R1                      ; D4F9   0248
        MVI@    R4,     R1                      ; D4FA   02A1
        TSTR    R1                              ; D4FB   0089
        BNEQ    L_D4F7                          ; D4FC   022C 0006
        B       L_D4DC                          ; D4FE   0220 0023

L_D500:
        MVII    #$0018, R3                      ; D500   02BB 0018
        ANDI    #$0007, R1                      ; D502   03B9 0007
        B       L_D4F3                          ; D504   0220 0012

L_D506:
        MVII    #$002C, R1                      ; D506   02B9 002C

        JSR     R5,     L_6D8E                  ; D508   0004 016C 018E

L_D50B:
        SDBD                                    ; D50B   0001
        MVII    #$D532, R4                      ; D50C   02BC 0032 00D5
        SLL     R3,     2                       ; D50F   004F
        SLL     R3,     1                       ; D510   004B
        SDBD                                    ; D511   0001
        XORI    #$1805, R3                      ; D512   03FB 0005 0018
L_D515:
        MVI@    R4,     R1                      ; D515   02A1
        TSTR    R1                              ; D516   0089
        BEQ     L_D4DB                          ; D517   0224 003D

        ADDI    #$0200, R1                      ; D519   02F9 0200
        MVO@    R3,     R1                      ; D51B   024B
        B       L_D515                          ; D51C   0220 0008

        DECLE   $0028,  $000F,  $001A,  $001F   ; D51E   0028 000F 001A 001F
        DECLE   $0000                           ; D522   0000

        ADCR    R2                              ; D523   002A
        INCR    R7                              ; D524   000F

        COMR    R4                              ; D525   001C
L_D526:
        NEGR    R1                              ; D526   0021
        DECLE   $0000,  $0064,  $000D,  $0005   ; D527   0000 0064 000D 0005

        ADCR    R5                              ; D52B   002D
        ADCR    R7                              ; D52C   002F

        GSWD    R1                              ; D52D   0031
L_D52E:
        GSWD    R3                              ; D52E   0033
        DECLE   $0035,  $0000,  $0065,  $002C   ; D52F   0035 0000 0065 002C
        DECLE   $002E,  $0035,  $0037,  $0000   ; D533   002E 0035 0037 0000
L_D537:
        PSHR    R5                              ; D537   0275
        MVII    #$000A, R2                      ; D538   02BA 000A

        JSR     R5,     X_DIV                   ; D53A   0004 011C 01FB

        MVO     R0,     G_01B0                  ; D53D   0240 01B0
        MVO     R1,     G_01B1                  ; D53F   0241 01B1
        INCR    R0                              ; D541   0008
        MVO     R0,     G_01AF                  ; D542   0240 01AF
        PULR    R7                              ; D544   02B7

L_D545:
        PSHR    R5                              ; D545   0275
        MVO     R1,     G_01B3                  ; D546   0241 01B3
        INCR    R1                              ; D548   0009
        MVO     R1,     G_01B2                  ; D549   0241 01B2
        PULR    R7                              ; D54B   02B7

L_D54C:
        PSHR    R5                              ; D54C   0275
        MVI     G_01AF, R0                      ; D54D   0280 01AF
        TSTR    R0                              ; D54F   0080
        BEQ     L_D55E                          ; D550   0204 000C

        CLRR    R0                              ; D552   01C0
        MVO     R0,     G_01AF                  ; D553   0240 01AF
        MVII    #$003F, R1                      ; D555   02B9 003F
        MVI     G_01B0, R2                      ; D557   0282 01B0
        MVI     G_01B1, R3                      ; D559   0283 01B1

        JSR     R5,     L_D574                  ; D55B   0004 01D4 0174

L_D55E:
        PULR    R7                              ; D55E   02B7

L_D55F:
        PSHR    R5                              ; D55F   0275
        MVI     G_01B2, R0                      ; D560   0280 01B2
        TSTR    R0                              ; D562   0080
        BEQ     L_D573                          ; D563   0204 000E

        CLRR    R0                              ; D565   01C0
        MVO     R0,     G_01B2                  ; D566   0240 01B2
        MVII    #$003E, R1                      ; D568   02B9 003E
        MVI     G_01B3, R2                      ; D56A   0282 01B3
        SDBD                                    ; D56C   0001
        MVII    #$000A, R3                      ; D56D   02BB 000A 0000

        JSR     R5,     L_D574                  ; D570   0004 01D4 0174

L_D573:
        PULR    R7                              ; D573   02B7

L_D574:
        PSHR    R5                              ; D574   0275
        MOVR    R2,     R0                      ; D575   0090
        SLL     R0,     2                       ; D576   004C
        ADDR    R0,     R2                      ; D577   00C2
        SDBD                                    ; D578   0001
        ADDI    #$D59D, R2                      ; D579   02FA 009D 00D5
        MOVR    R3,     R0                      ; D57C   0098
        SLL     R0,     2                       ; D57D   004C
        ADDR    R0,     R3                      ; D57E   00C3
        SDBD                                    ; D57F   0001
        ADDI    #$D59D, R3                      ; D580   02FB 009D 00D5
        SLL     R1,     2                       ; D583   004D
        SLL     R1,     1                       ; D584   0049
        SDBD                                    ; D585   0001
        ADDI    #$3800, R1                      ; D586   02F9 0000 0038
        MOVR    R2,     R4                      ; D589   0094
        MOVR    R3,     R5                      ; D58A   009D
        MOVR    R6,     R3                      ; D58B   00B3
        MOVR    R1,     R6                      ; D58C   008E
        CLRR    R0                              ; D58D   01C0
        PSHR    R0                              ; D58E   0270
        PSHR    R0                              ; D58F   0270
        PSHR    R0                              ; D590   0270
        MVII    #$0005, R2                      ; D591   02BA 0005
L_D593:
        MVI@    R4,     R0                      ; D593   02A0
        SLL     R0,     2                       ; D594   004C
        SLL     R0,     2                       ; D595   004C
        XOR@    R5,     R0                      ; D596   03E8
        PSHR    R0                              ; D597   0270
        DECR    R2                              ; D598   0012
        BNEQ    L_D593                          ; D599   022C 0007

        MOVR    R3,     R6                      ; D59B   009E
        PULR    R7                              ; D59C   02B7

        DECLE   $0007,  $0005,  $0005,  $0005   ; D59D   0007 0005 0005 0005
        DECLE   $0007,  $0006,  $0002,  $0002   ; D5A1   0007 0006 0002 0002
        DECLE   $0002,  $0007,  $0007,  $0001   ; D5A5   0002 0007 0007 0001
        DECLE   $0003,  $0004,  $0007,  $0007   ; D5A9   0003 0004 0007 0007
        DECLE   $0001,  $0003,  $0001,  $0007   ; D5AD   0001 0003 0001 0007
        DECLE   $0005,  $0005,  $0007,  $0001   ; D5B1   0005 0005 0007 0001
        DECLE   $0001,  $0007,  $0004,  $0007   ; D5B5   0001 0007 0004 0007
        DECLE   $0001,  $0007,  $0007,  $0004   ; D5B9   0001 0007 0007 0004
        DECLE   $0007,  $0005,  $0007,  $0007   ; D5BD   0007 0005 0007 0007
        DECLE   $0001,  $0001,  $0001,  $0001   ; D5C1   0001 0001 0001 0001
        DECLE   $0007,  $0005,  $0007,  $0005   ; D5C5   0007 0005 0007 0005
        DECLE   $0007,  $0007,  $0005,  $0007   ; D5C9   0007 0007 0005 0007
        DECLE   $0001,  $0001,  $0000,  $0000   ; D5CD   0001 0001 0000 0000
        DECLE   $0005,  $0002,  $0005           ; D5D1   0005 0002 0005
.GFX_LIST_D5D4:
        DECLE   $00FF,  $00FF,  $00FF,  $00FE   ; D5D4  CART PIC #00
        DECLE   $00FC,  $00F8,  $00F0,  $00E0   ; D5D8  
        DECLE   $0060,  $00F0,  $00F8,  $007C   ; D5DC  CART PIC #01
        DECLE   $003E,  $001F,  $000F,  $0006   ; D5E0  
        DECLE   $0070,  $00F1,  $00EE,  $00FE   ; D5E4  CART PIC #02
        DECLE   $007C,  $00E0,  $00C0,  $00E0   ; D5E8  
        DECLE   $00E0,  $00FC,  $00FC,  $00FE   ; D5EC  CART PIC #03
        DECLE   $00FE,  $00FC,  $00FC,  $00F8   ; D5F0  
        DECLE   $0000,  $0001,  $0000,  $0002   ; D5F4  CART PIC #04
        DECLE   $0002,  $0000,  $0001,  $0000   ; D5F8  
        DECLE   $0000,  $0000,  $0020,  $0030   ; D5FC  CART PIC #05
        DECLE   $0038,  $005C,  $00A0,  $0040   ; D600  
        DECLE   $0003,  $0007,  $0007,  $0007   ; D604  CART PIC #06
        DECLE   $0007,  $0007,  $0003,  $0001   ; D608  
        DECLE   $0000,  $0001,  $0003,  $0006   ; D60C  CART PIC #07
        DECLE   $000D,  $001B,  $001C,  $000F   ; D610  
        DECLE   $0080,  $00C0,  $00E0,  $00F0   ; D614   0080 00C0 00E0 00F0
        DECLE   $00F8,  $007C,  $001F,  $0007   ; D618   00F8 007C 001F 0007
        DECLE   $0000,  $0000,  $0000,  $0000   ; D61C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0003   ; D620   0000 0000 0001 0003
        DECLE   $00C0,  $0080,  $0000,  $0000   ; D624   00C0 0080 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0003   ; D628   0000 0000 0001 0003
        DECLE   $0003,  $0001,  $0000,  $0000   ; D62C   0003 0001 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0003   ; D630   0000 0000 0001 0003
        DECLE   $003E,  $007E,  $00FC,  $00FC   ; D634   003E 007E 00FC 00FC
        DECLE   $00FE,  $00FF,  $00FF,  $00FF   ; D638   00FE 00FF 00FF 00FF
        DECLE   $0000,  $0001                   ; D63C   0000 0001

        NEGR    R2                              ; D63E   0022
        DECR    R0                              ; D63F   0010
        INCR    R0                              ; D640   0008
        INCR    R7                              ; D641   000F

        DECLE   $000F                           ; D642   000F
L_D643:
        COMR    R4                              ; D643   001C
        DECLE   $0000,  $0000,  $0006,  $0007   ; D644   0000 0000 0006 0007
        DECLE   $0003,  $0003,  $0001,  $0001   ; D648   0003 0003 0001 0001
        DECLE   $003E,  $001C,  $0000,  $001C   ; D64C   003E 001C 0000 001C
        DECLE   $0000,  $001C,  $0000,  $001C   ; D650   0000 001C 0000 001C
        DECLE   $00FF,  $00FF,  $009F,  $000E   ; D654   00FF 00FF 009F 000E
        DECLE   $0004,  $0004,  $000E,  $001F   ; D658   0004 0004 000E 001F
        DECLE   $0000,  $0000,  $0000,  $0018   ; D65C   0000 0000 0000 0018
        DECLE   $0018,  $0000,  $0000,  $0000   ; D660   0018 0000 0000 0000
        DECLE   $00C3,  $003C,  $007E,  $00FF   ; D664   00C3 003C 007E 00FF
        DECLE   $00FF,  $007E,  $003C,  $00C3   ; D668   00FF 007E 003C 00C3
        DECLE   $0000,  $0000,  $0000,  $0000   ; D66C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; D670   0000 0000 0000 003C
        DECLE   $00C1,  $00C1,  $00C1,  $00C1   ; D674   00C1 00C1 00C1 00C1
        DECLE   $00C1,  $00C1,  $00C1,  $00C1   ; D678   00C1 00C1 00C1 00C1
        DECLE   $0081,  $0081,  $0081,  $0081   ; D67C   0081 0081 0081 0081
        DECLE   $00C1,  $00C1,  $00C1,  $00C1   ; D680   00C1 00C1 00C1 00C1
        DECLE   $0000,  $0000,  $0000,  $0000   ; D684   0000 0000 0000 0000
        DECLE   $000C,  $001E,  $003F,  $007F   ; D688   000C 001E 003F 007F
        DECLE   $0060,  $00F0,  $00D8,  $006C   ; D68C   0060 00F0 00D8 006C
        DECLE   $0036,  $001B,  $000F,  $0006   ; D690   0036 001B 000F 0006
        DECLE   $00FF,  $00FE,  $00FC,  $00FC   ; D694   00FF 00FE 00FC 00FC
        DECLE   $00FC,  $00FC,  $00FE,  $00FF   ; D698   00FC 00FC 00FE 00FF
        DECLE   $0000,  $0000                   ; D69C   0000 0000

        RSWD    R4                              ; D69E   003C

        JSR     R4,     .EXEC.420               ; D69F   0004 0014 0020
        DECLE   $0040,  $0000                   ; D6A2   0040 0000
        DECLE   $0081,  $0042,  $003C,  $007E   ; D6A4  CART PIC #1A
        DECLE   $00FF,  $00C7,  $00AB,  $0046   ; D6A8  
        DECLE   $00BC,  $00EE,  $0057,  $0045   ; D6AC   00BC 00EE 0057 0045
        DECLE   $0056,  $007E,  $002C,  $00C3   ; D6B0   0056 007E 002C 00C3
        DECLE   $000E,  $000E,  $001C,  $001C   ; D6B4   000E 000E 001C 001C
        DECLE   $0038,  $0038,  $0070,  $0060   ; D6B8   0038 0038 0070 0060
        DECLE   $0001,  $0003,  $0007,  $000F   ; D6BC   0001 0003 0007 000F
        DECLE   $001F,  $003F,  $0078,  $0060   ; D6C0   001F 003F 0078 0060
        DECLE   $00FF,  $00FF,  $00FF,  $00FC   ; D6C4   00FF 00FF 00FF 00FC
        DECLE   $00E0,  $0000,  $0000,  $0000   ; D6C8   00E0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0049   ; D6CC   0000 0000 0000 0049
        DECLE   $0049,  $0049,  $0000,  $0000   ; D6D0   0049 0049 0000 0000
        DECLE   $0080,  $00C0,  $00E0,  $00F0   ; D6D4   0080 00C0 00E0 00F0
        DECLE   $00F8,  $003C,  $000F,  $0003   ; D6D8   00F8 003C 000F 0003
        DECLE   $0000,  $001C,  $003E,  $003E   ; D6DC   0000 001C 003E 003E
        DECLE   $003E,  $003E,  $003E,  $001C   ; D6E0   003E 003E 003E 001C
        DECLE   $0063,  $0035                   ; D6E4   0063 0035

        SARC    R2,     2                       ; D6E6   007E
        MOVR    R5,     R7                      ; D6E7   00AF

        DECLE   $007E,  $00B8,  $0018,  $001C   ; D6E8   007E 00B8 0018 001C
        DECLE   $003F,  $00E7,  $00BF           ; D6EC   003F 00E7 00BF

        SLL     R3,     1                       ; D6EF   004B
        INCR    R7                              ; D6F0   000F
        INCR    R7                              ; D6F1   000F

L_D6F2:
        RSWD    R2                              ; D6F2   003A
L_D6F3:
        INCR    R6                              ; D6F3   000E
        DECLE   $0000,  $0080,  $00C0,  $00C2   ; D6F4   0000 0080 00C0 00C2
        DECLE   $00C5,  $00E4,  $00EC,  $0078   ; D6F8   00C5 00E4 00EC 0078
        DECLE   $0000,  $007E,  $0000,  $0000   ; D6FC   0000 007E 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D700   0000 0000 0000 0000
        DECLE   $0000,  $0074,  $006E,  $0076   ; D704   0000 0074 006E 0076
        DECLE   $006A,  $007C,  $007E,  $0000   ; D708   006A 007C 007E 0000
        DECLE   $0000,  $002E,  $0076,  $006E   ; D70C   0000 002E 0076 006E
        DECLE   $0054,  $003E,  $007E,  $0000   ; D710   0054 003E 007E 0000
        DECLE   $0000,  $007E,  $0042,  $005A   ; D714   0000 007E 0042 005A
        DECLE   $005A,  $0018,  $007E,  $0000   ; D718   005A 0018 007E 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; D71C   0000 0000 0000 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; D720   0000 0000 0000 0000

        INCR    R7                              ; D724   000F

        COMR    R5                              ; D725   001D
L_D726:
        RSWD    R5                              ; D726   003D
        DECLE   $0076,  $003F,  $001D,  $000F   ; D727   0076 003F 001D 000F
        DECLE   $0000,  $0000,  $0030,  $0030   ; D72B   0000 0000 0030 0030
        DECLE   $0030,  $0030,  $0030,  $0030   ; D72F   0030 0030 0030 0030
        DECLE   $0000,  $0000,  $003C,  $007E   ; D733   0000 0000 003C 007E
        DECLE   $00FF,  $00FF,  $007E,  $003C   ; D737   00FF 00FF 007E 003C
        DECLE   $0000,  $001F,  $003F,  $003F   ; D73B   0000 001F 003F 003F
        DECLE   $007F,  $007F,  $00FF,  $00FF   ; D73F   007F 007F 00FF 00FF
        DECLE   $00FF,  $001E,  $003E,  $003C   ; D743   00FF 001E 003E 003C
        DECLE   $007C,  $0078,  $00F8,  $00F0   ; D747   007C 0078 00F8 00F0
        DECLE   $00E0,  $0000,  $007E,  $0000   ; D74B   00E0 0000 007E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D74F   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $007E,  $0046   ; D753   0000 003C 007E 0046
        DECLE   $0066,  $0066,  $0042,  $007E   ; D757   0066 0066 0042 007E
        DECLE   $003C,  $003C,  $007E,  $0042   ; D75B   003C 003C 007E 0042
        DECLE   $0072,  $004E,  $0042,  $007E   ; D75F   0072 004E 0042 007E
        DECLE   $003C,  $003C,  $007E,  $0042   ; D763   003C 003C 007E 0042
        DECLE   $0072,  $0062,  $0072,  $0042   ; D767   0072 0062 0072 0042
        DECLE   $003C,  $003C,  $007E,  $005E   ; D76B   003C 003C 007E 005E
        DECLE   $005E,  $005A,  $0042,  $007A   ; D76F   005E 005A 0042 007A
        DECLE   $003C,  $003C,  $0046,  $008A   ; D773   003C 003C 0046 008A
        DECLE   $0045,  $0061,  $00CE,  $001C   ; D777   0045 0061 00CE 001C
        DECLE   $0000,  $0000,  $00D0,  $008A   ; D77B   0000 0000 00D0 008A
        DECLE   $009C,  $007E,  $00FF,  $00DB   ; D77F   009C 007E 00FF 00DB
        DECLE   $0066,  $0000,  $0000,  $0080   ; D783   0066 0000 0000 0080
        DECLE   $0040,  $0080,  $0000,  $0000   ; D787   0040 0080 0000 0000
        DECLE   $0000,  $0007,  $0000,  $000E   ; D78B   0000 0007 0000 000E
        DECLE   $0000,  $001C,  $0000,  $0038   ; D78F   0000 001C 0000 0038
        DECLE   $0000,  $0070,  $0000,  $0070   ; D793   0000 0070 0000 0070
        DECLE   $0000,  $00E0,  $0000,  $0000   ; D797   0000 00E0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0070   ; D79B   0000 0000 0000 0070
        DECLE   $00F8,  $0070,  $0000,  $0000   ; D79F   00F8 0070 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D7A3   0000 0000 0000 0000
        DECLE   $00F8,  $0000,  $0000,  $0000   ; D7A7   00F8 0000 0000 0000
        DECLE   $0000,  $0080,  $0040,  $0020   ; D7AB   0000 0080 0040 0020
        DECLE   $0010,  $0038,  $0044,  $0082   ; D7AF   0010 0038 0044 0082
        DECLE   $0044,  $0000,  $0000,  $0000   ; D7B3   0044 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D7B7   0000 0000 0000 0000
        DECLE   $0000,  $00FF                   ; D7BB   0000 00FF

        TSTR    R1                              ; D7BD   0089
        TSTR    R1                              ; D7BE   0089
        TSTR    R1                              ; D7BF   0089
        TSTR    R1                              ; D7C0   0089
        TSTR    R1                              ; D7C1   0089
        TSTR    R1                              ; D7C2   0089
        MOVR    R7,     R5                      ; D7C3   00BD
        ADDR    R4,     R7                      ; D7C4   00E7

        DECLE   $00A5,  $00BD,  $0091,  $0091   ; D7C5   00A5 00BD 0091 0091
        DECLE   $0091,  $0091,  $00FF,  $0080   ; D7C9   0091 0091 00FF 0080
        DECLE   $0050,  $0038,  $007C,  $003E   ; D7CD   0050 0038 007C 003E
        DECLE   $001C,  $000A,  $0001,  $0080   ; D7D1   001C 000A 0001 0080
        DECLE   $0040,  $0020,  $0010,  $0008   ; D7D5   0040 0020 0010 0008
        DECLE   $0004,  $0002,  $0001           ; D7D9   0004 0002 0001
        DECLE   $0000,  $0000,  $0000,  $0018   ; D7DC  CART PIC #41
        DECLE   $0024,  $0000,  $0052,  $0008   ; D7E0  
        DECLE   $0052,  $0008,  $0052,  $0000   ; D7E4  CART PIC #42
        DECLE   $0024,  $0018,  $0000,  $0000   ; D7E8  
        DECLE   $0040,  $00E0,  $00E0,  $00E0   ; D7EC  CART PIC #43
        DECLE   $0040,  $0000,  $0000,  $0000   ; D7F0  
        DECLE   $0000,  $0040,  $00E0,  $00E0   ; D7F4  CART PIC #44
        DECLE   $00E0,  $0040,  $0000,  $0000   ; D7F8  
        DECLE   $0000,  $0040,  $00C0,  $00E0   ; D7FC  CART PIC #45
        DECLE   $00E0,  $00E0,  $00F0,  $0070   ; D800  
        DECLE   $0070,  $0030,  $0038,  $0018   ; D804  CART PIC #46
        DECLE   $0018,  $000C,  $000C,  $0004   ; D808  
        DECLE   $0004,  $0004,  $000C,  $0008   ; D80C  CART PIC #47
        DECLE   $0018,  $0018,  $0038,  $0030   ; D810  
        DECLE   $0070,  $0070,  $00F0,  $00E0   ; D814  CART PIC #48
        DECLE   $00E0,  $00E0,  $00C0,  $00C0   ; D818  
        DECLE   $00FF,  $00FF,  $00FF,  $00F1   ; D81C   00FF 00FF 00FF 00F1
        DECLE   $00E0,  $00E0,  $00E0,  $00F0   ; D820   00E0 00E0 00E0 00F0
        DECLE   $0000,  $0000,  $007E,  $003C   ; D824  CART PIC #4A
        DECLE   $0000,  $003C,  $0066,  $005A   ; D828  
        DECLE   $005A,  $0066,  $003C,  $0000   ; D82C  CART PIC #4B
        DECLE   $003C,  $007E,  $0000,  $0000   ; D830  
        DECLE   $00C3,  $003C,  $002A,  $005E   ; D834   00C3 003C 002A 005E
        DECLE   $00FE,  $00DA,  $000E,  $007F   ; D838   00FE 00DA 000E 007F
        DECLE   $00FE,  $00F7                   ; D83C   00FE 00F7

        ADDR    R4,     R3                      ; D83E   00E3
        ADDR    R0,     R1                      ; D83F   00C1
        ADDR    R4,     R3                      ; D840   00E3
        ADDR    R6,     R6                      ; D841   00F6
        ADDR    R7,     R6                      ; D842   00FE
        ADDR    R0,     R7                      ; D843   00C7

        DECLE   $0000,  $0011,  $002B,  $004F   ; D844   0000 0011 002B 004F
        DECLE   $004F,  $001F,  $003F,  $0003   ; D848   004F 001F 003F 0003
        DECLE   $00C1,  $00C1,  $00C1,  $00C1   ; D84C   00C1 00C1 00C1 00C1
        DECLE   $00C1,  $00C1,  $00C1,  $00E3   ; D850   00C1 00C1 00C1 00E3
        DECLE   $0000,  $0018,  $003C,  $0066   ; D854  CART PIC #50
        DECLE   $00C3,  $00BD,  $00B5,  $00B1   ; D858  
        DECLE   $00B1,  $00B5,  $00BD,  $00C3   ; D85C  CART PIC #51
        DECLE   $0066,  $003C,  $0018,  $0000   ; D860  

        SETC                                    ; D864   0007
        COMR    R5                              ; D865   001D
        MOVR    R5,     R7                      ; D866   00AF

        SARC    R0,     2                       ; D867   007C
        SAR     R2,     2                       ; D868   006E
        COMR    R6                              ; D869   001E
        RSWD    R4                              ; D86A   003C
        MOVR    R1,     R0                      ; D86B   0088
        SLLC    R2,     2                       ; D86C   005E
        RSWD    R5                              ; D86D   003D
        SARC    R2,     2                       ; D86E   007E
        SLLC    R3,     2                       ; D86F   005F
        SARC    R3,     2                       ; D870   007F
        RSWD    R6                              ; D871   003E
        NEGR    R4                              ; D872   0024
        ADDR    R5,     R7                      ; D873   00EF

        DECLE   $0000                           ; D874   0000

        RSWD    R0                              ; D875   0038
        SAR     R0,     2                       ; D876   006C
        ADDR    R7,     R6                      ; D877   00FE
        ADDR    R5,     R4                      ; D878   00EC
        COMR    R0                              ; D879   0018
        INCR    R0                              ; D87A   0008
        INCR    R4                              ; D87B   000C
        RSWD    R2                              ; D87C   003A
        SARC    R1,     2                       ; D87D   007D
        ADDR    R0,     R7                      ; D87E   00C7

        SARC    R1,     2                       ; D87F   007D
        NEGR    R5                              ; D880   0025
        RSWD    R6                              ; D881   003E
        SLR     R2,     2                       ; D882   0066
        ADDR    R4,     R7                      ; D883   00E7

        DECLE   $0000,  $0000,  $00FC,  $0002   ; D884   0000 0000 00FC 0002
        DECLE   $00FC,  $0002,  $005C,  $0003   ; D888   00FC 0002 005C 0003
        DECLE   $003C,  $0003,  $0084,  $0088   ; D88C   003C 0003 0084 0088
        DECLE   $0044,  $0086,  $0044,  $0086   ; D890   0044 0086 0044 0086
        DECLE   $0044,  $0086,  $0044,  $0006   ; D894   0044 0086 0044 0006
        DECLE   $0044,  $0006,  $0044,  $0086   ; D898   0044 0006 0044 0086
        DECLE   $0044,  $0086,  $0044,  $0086   ; D89C   0044 0086 0044 0086
        DECLE   $0044,  $0086,  $0044,  $0086   ; D8A0   0044 0086 0044 0086
        DECLE   $0074,  $0083,  $0094,  $0083   ; D8A4   0074 0083 0094 0083
        DECLE   $00FC,  $0082,  $00FC,  $0082   ; D8A8   00FC 0082 00FC 0082
        DECLE   $00FC,  $0002,  $00FC,  $0002   ; D8AC   00FC 0002 00FC 0002
        DECLE   $001C,  $0004,  $0000,  $0080   ; D8B0   001C 0004 0000 0080
        DECLE   $0025,  $0003,  $0065,  $0008   ; D8B4   0025 0003 0065 0008
        DECLE   $0047,  $0099,  $008D,  $0018   ; D8B8   0047 0099 008D 0018
        DECLE   $0057,  $0099,  $0000,  $0080   ; D8BC   0057 0099 0000 0080
        DECLE   $0000,  $0080,  $0047,  $0099   ; D8C0   0000 0080 0047 0099
        DECLE   $008D,  $0018,  $0057,  $0099   ; D8C4   008D 0018 0057 0099
        DECLE   $0015,  $0009,  $002D,  $0083   ; D8C8   0015 0009 002D 0083
        DECLE   $0074,  $0088,  $006C,  $0083   ; D8CC   0074 0088 006C 0083
        DECLE   $00B4,  $0083,  $00FC,  $0082   ; D8D0   00B4 0083 00FC 0082
        DECLE   $00FC,  $0002,  $00FC,  $0002   ; D8D4   00FC 0002 00FC 0002
        DECLE   $003C,  $0004,  $0025,  $0004   ; D8D8   003C 0004 0025 0004
        DECLE   $0000,  $0020,  $0000,  $0000   ; D8DC   0000 0020 0000 0000
        DECLE   $001D,  $0028,  $0000,  $0000   ; D8E0   001D 0028 0000 0000
        DECLE   $0000,  $0000,  $003C,  $0058   ; D8E4   0000 0000 003C 0058
        DECLE   $00EC,  $0058,  $0000,  $0000   ; D8E8   00EC 0058 0000 0000
        DECLE   $0000,  $0000,  $00CD,  $0008   ; D8EC   0000 0000 00CD 0008
        DECLE   $0000,  $0020,  $0000,  $0000   ; D8F0   0000 0020 0000 0000
        DECLE   $002D,  $00A4,  $0014,  $0084   ; D8F4   002D 00A4 0014 0084
        DECLE   $002C,  $0084,  $0014,  $0084   ; D8F8   002C 0084 0014 0084
        DECLE   $00FC,  $0002,  $00FC,  $0002   ; D8FC   00FC 0002 00FC 0002
        DECLE   $00AC,  $0003,  $00D5,  $0003   ; D900   00AC 0003 00D5 0003
        DECLE   $00F5,  $0003,  $006D,  $0009   ; D904   00F5 0003 006D 0009
        DECLE   $00DD,  $0003,  $0000,  $0000   ; D908   00DD 0003 0000 0000
        DECLE   $009E,  $0048,  $0000,  $0000   ; D90C   009E 0048 0000 0000
        DECLE   $0000,  $0000,  $009E,  $0048   ; D910   0000 0000 009E 0048
        DECLE   $0000,  $0000,  $00D5,  $0003   ; D914   0000 0000 00D5 0003
        DECLE   $0075,  $0009,  $00FD,  $0003   ; D918   0075 0009 00FD 0003
        DECLE   $00DD,  $0003,  $0044,  $0084   ; D91C   00DD 0003 0044 0084
        DECLE   $000C,  $0084,  $0034,  $0084   ; D920   000C 0084 0034 0084
        DECLE   $00FC,  $0002,  $00FC,  $0002   ; D924   00FC 0002 00FC 0002
        DECLE   $00BA,  $0008,  $0000,  $0000   ; D928   00BA 0008 0000 0000
        DECLE   $00D5,  $0083,  $00DD,  $0083   ; D92C   00D5 0083 00DD 0083
        DECLE   $0000,  $0000,  $0026,  $0048   ; D930   0000 0000 0026 0048
        DECLE   $0091,  $0048,  $00D6,  $0048   ; D934   0091 0048 00D6 0048
        DECLE   $0026,  $0048,  $0091,  $0048   ; D938   0026 0048 0091 0048
        DECLE   $00D6,  $0048,  $0000,  $0000   ; D93C   00D6 0048 0000 0000
        DECLE   $00D5,  $0083,  $00DD,  $0083   ; D940   00D5 0083 00DD 0083
        DECLE   $0000,  $0080,  $000E,  $0008   ; D944   0000 0080 000E 0008
        DECLE   $00FC,  $0002,  $00AC,  $0008   ; D948   00FC 0002 00AC 0008
        DECLE   $00FC,  $0002,  $00BE,  $0008   ; D94C   00FC 0002 00BE 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; D950   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00F7,  $0009   ; D954   0000 0000 00F7 0009
        DECLE   $0000,  $0000,  $0000,  $0000   ; D958   0000 0000 0000 0000
        DECLE   $0026,  $0009,  $0000,  $0000   ; D95C   0026 0009 0000 0000
        DECLE   $0000,  $0000,  $0026,  $0009   ; D960   0000 0000 0026 0009
        DECLE   $0000,  $0000,  $0000,  $0000   ; D964   0000 0000 0000 0000
        DECLE   $00FF,  $0009,  $0000,  $0000   ; D968   00FF 0009 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D96C   0000 0000 0000 0000
        DECLE   $000A,  $0008,  $00A4,  $0008   ; D970   000A 0008 00A4 0008
        DECLE   $00FC,  $0002,  $009C,  $0004   ; D974   00FC 0002 009C 0004
        DECLE   $003A,  $0019,  $0000,  $0080   ; D978   003A 0019 0000 0080
        DECLE   $0000,  $0080,  $0000,  $0000   ; D97C   0000 0080 0000 0000
        DECLE   $0000,  $0000,  $0048,  $0018   ; D980   0000 0000 0048 0018
        DECLE   $00F9,  $0018,  $0000,  $0000   ; D984   00F9 0018 0000 0000
        DECLE   $0000,  $0000,  $004A,  $0018   ; D988   0000 0000 004A 0018
        DECLE   $00FF,  $0018,  $0000,  $0000   ; D98C   00FF 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; D990   0000 0000 0000 0080
        DECLE   $0000,  $0080,  $004A,  $0019   ; D994   0000 0080 004A 0019
        DECLE   $0094,  $0004,  $00A4,  $0008   ; D998   0094 0004 00A4 0008
        DECLE   $00FC,  $0002,  $0000,  $0000   ; D99C   00FC 0002 0000 0000
        DECLE   $005A,  $0019,  $0000,  $0080   ; D9A0   005A 0019 0000 0080
        DECLE   $0000,  $0080,  $0000,  $0000   ; D9A4   0000 0080 0000 0000
        DECLE   $0000,  $0000,  $002D,  $0019   ; D9A8   0000 0000 002D 0019
        DECLE   $0056,  $0018,  $00F8,  $0018   ; D9AC   0056 0018 00F8 0018
        DECLE   $004E,  $0018,  $0003,  $0019   ; D9B0   004E 0018 0003 0019
        DECLE   $0034,  $0019,  $0000,  $0000   ; D9B4   0034 0019 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; D9B8   0000 0000 0000 0080
        DECLE   $0000,  $0080,  $0062,  $0019   ; D9BC   0000 0080 0062 0019
        DECLE   $0000,  $0000,  $00A4,  $0008   ; D9C0   0000 0000 00A4 0008
        DECLE   $00FC,  $0002,  $006C,  $0083   ; D9C4   00FC 0002 006C 0083
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9C8   0000 0000 0000 0000
        DECLE   $0035,  $0088,  $00AD,  $0083   ; D9CC   0035 0088 00AD 0083
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9D0   0000 0000 0000 0000

        ADCR    R7                              ; D9D4   002F

        COMR    R1                              ; D9D5   0019
L_D9D6:
        RLC     R1,     2                       ; D9D6   0055
        DECLE   $0018,  $0002,  $0019,  $0030   ; D9D7   0018 0002 0019 0030
        DECLE   $0019,  $0000,  $0000,  $0000   ; D9DB   0019 0000 0000 0000
        DECLE   $0000,  $00A5,  $0083,  $00E5   ; D9DF   0000 00A5 0083 00E5
        DECLE   $0088,  $0000,  $0000,  $0000   ; D9E3   0088 0000 0000 0000
        DECLE   $0000,  $0064,  $0083,  $00A4   ; D9E7   0000 0064 0083 00A4
        DECLE   $0008,  $00FC,  $0002,  $00FC   ; D9EB   0008 00FC 0002 00FC
        DECLE   $0002,  $008C,  $0083,  $006C   ; D9EF   0002 008C 0083 006C
        DECLE   $0083,  $0000,  $00C0,  $00B4   ; D9F3   0083 0000 00C0 00B4
        DECLE   $0003,  $00AD,  $0083,  $0000   ; D9F7   0003 00AD 0083 0000
        DECLE   $0000,  $0000,  $0000,  $005B   ; D9FB   0000 0000 0000 005B
        DECLE   $0018,  $0009,  $0019,  $0000   ; D9FF   0018 0009 0019 0000
        DECLE   $0000,  $0000,  $0000,  $00A5   ; DA03   0000 0000 0000 00A5
        DECLE   $0083,  $00BC,  $0003,  $0000   ; DA07   0083 00BC 0003 0000
        DECLE   $00C0,  $0064,  $0083,  $0084   ; DA0B   00C0 0064 0083 0084
        DECLE   $0083,  $00FC,  $0002,  $007C   ; DA0F   0083 00FC 0002 007C
        DECLE   $0008,  $00FC,  $0002,  $006E   ; DA13   0008 00FC 0002 006E
        DECLE   $0028,  $0016,  $0008,  $00FC   ; DA17   0028 0016 0008 00FC
        DECLE   $0022,  $008C,  $0083,  $006C   ; DA1B   0022 008C 0083 006C
        DECLE   $0083,  $0074,  $0003,  $0045   ; DA1F   0083 0074 0003 0045
        DECLE   $0088,  $0000,  $0080,  $002E   ; DA23   0088 0000 0080 002E
        DECLE   $0089,  $0034,  $0099,  $0000   ; DA27   0089 0034 0099 0000
        DECLE   $0080,  $00F5,  $0088,  $007C   ; DA2B   0080 00F5 0088 007C
        DECLE   $0003,  $0064,  $0083,  $0084   ; DA2F   0003 0064 0083 0084
        DECLE   $0083,  $00C6,  $0028,  $001E   ; DA33   0083 00C6 0028 001E
        DECLE   $0009,  $00FC,  $0022,  $007E   ; DA37   0009 00FC 0022 007E
        DECLE   $0009,  $0000,  $0000,  $0000   ; DA3B   0009 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA3F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA43   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0020,  $0000   ; DA47   0000 0000 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA4B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA4F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA53   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0020,  $0000   ; DA57   0000 0000 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA5B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA5F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; DA63   0000 0000 0000

        ADDR    R7,     R2                      ; DA66   00FA
        EIS                                     ; DA67   0002
        ADDR    R7,     R2                      ; DA68   00FA
        EIS                                     ; DA69   0002
        MOVR    R3,     R6                      ; DA6A   009E
        INCR    R0                              ; DA6B   0008
        SWAP    R2,     1                       ; DA6C   0042
        CLRC                                    ; DA6D   0006
        SWAP    R2,     1                       ; DA6E   0042
        CLRC                                    ; DA6F   0006
        RRC     R2,     1                       ; DA70   0072
        DIS                                     ; DA71   0003
        TSTR    R2                              ; DA72   0092
        DIS                                     ; DA73   0003
        MOVR    R7,     R2                      ; DA74   00BA
        MOVR    R0,     R3                      ; DA75   0083
        SLR     R2,     1                       ; DA76   0062
        CLRC                                    ; DA77   0006
        MOVR    R6,     R2                      ; DA78   00B2
        MOVR    R0,     R3                      ; DA79   0083
        MOVR    R3,     R2                      ; DA7A   009A
        DIS                                     ; DA7B   0003
        SARC    R2,     1                       ; DA7C   007A
        DIS                                     ; DA7D   0003
        SWAP    R2,     1                       ; DA7E   0042
        CLRC                                    ; DA7F   0006
        SWAP    R2,     1                       ; DA80   0042
        CLRC                                    ; DA81   0006
        RRC     R2,     1                       ; DA82   0072
        DIS                                     ; DA83   0003
        TSTR    R2                              ; DA84   0092
        DIS                                     ; DA85   0003
        ADDR    R7,     R2                      ; DA86   00FA
        EIS                                     ; DA87   0002
        ADDR    R7,     R2                      ; DA88   00FA
        EIS                                     ; DA89   0002
        ADDR    R7,     R2                      ; DA8A   00FA
        EIS                                     ; DA8B   0002
        ADDR    R7,     R2                      ; DA8C   00FA
        EIS                                     ; DA8D   0002
        ADDR    R7,     R2                      ; DA8E   00FA
        EIS                                     ; DA8F   0002
        MOVR    R3,     R7                      ; DA90   009F

        DECLE   $0008,  $0000,  $0000,  $0061   ; DA91   0008 0000 0000 0061
        DECLE   $0003,  $0069,  $0003,  $0000   ; DA95   0003 0069 0003 0000
        DECLE   $0080,  $0000,  $0080,  $0000   ; DA99   0080 0000 0080 0000
        DECLE   $0080,  $0000,  $0080,  $0000   ; DA9D   0080 0000 0080 0000
        DECLE   $0080,  $0000,  $0080,  $0000   ; DAA1   0080 0000 0080 0000
        DECLE   $0080,  $0001                   ; DAA5   0080 0001

        DIS                                     ; DAA7   0003
        MOVR    R6,     R1                      ; DAA8   00B1

        JSRE    R4,     L_6803                  ; DAA9   0004 0069 0003
        DECLE   $0000,  $0000,  $0012,  $0004   ; DAAC   0000 0000 0012 0004
        DECLE   $00FA,  $0002,  $00FA,  $0002   ; DAB0   00FA 0002 00FA 0002
        DECLE   $00FA,  $0002,  $009E,  $0008   ; DAB4   00FA 0002 009E 0008
        DECLE   $0000,  $0000,  $0009,  $0006   ; DAB8   0000 0000 0009 0006
        DECLE   $0011,  $0008,  $006D,  $0008   ; DABC   0011 0008 006D 0008
        DECLE   $005A,  $0018,  $006D,  $0008   ; DAC0   005A 0018 006D 0008
        DECLE   $005A,  $0018,  $006D,  $0008   ; DAC4   005A 0018 006D 0008
        DECLE   $005A,  $0018,  $006D,  $0008   ; DAC8   005A 0018 006D 0008
        DECLE   $005A,  $0018,  $006D,  $0008   ; DACC   005A 0018 006D 0008
        DECLE   $00A1,  $0008,  $00F9,  $0002   ; DAD0   00A1 0008 00F9 0002
        DECLE   $0029,  $0004,  $0032,  $0004   ; DAD4   0029 0004 0032 0004

        ADDR    R7,     R2                      ; DAD8   00FA
        EIS                                     ; DAD9   0002
        ADDR    R7,     R2                      ; DADA   00FA
        EIS                                     ; DADB   0002
        MOVR    R3,     R7                      ; DADC   009F

        DECLE   $0008,  $0000,  $0000,  $0000   ; DADD   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0071   ; DAE1   0000 0000 0000 0071
        DECLE   $0003,  $0000,  $0000,  $0000   ; DAE5   0003 0000 0000 0000
        DECLE   $0080,  $0000,  $0000,  $0000   ; DAE9   0080 0000 0000 0000
        DECLE   $0080,  $0057,  $0048,  $0000   ; DAED   0080 0057 0048 0000
        DECLE   $0080,  $0000,  $0000,  $0000   ; DAF1   0080 0000 0000 0000
        DECLE   $0080,  $0000,  $0000,  $000E   ; DAF5   0080 0000 0000 000E
        DECLE   $0008,  $00F9,  $0002,  $0029   ; DAF9   0008 00F9 0002 0029
        DECLE   $0005,  $0082,  $0004,  $003A   ; DAFD   0005 0082 0004 003A
        DECLE   $0004,  $00FA,  $0002,  $000A   ; DB01   0004 00FA 0002 000A
        DECLE   $0004,  $0000,  $0000,  $0000   ; DB05   0004 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB0D   0000 0000 0000 0000
        DECLE   $0000,  $0057,  $0048,  $001F   ; DB11   0000 0057 0048 001F

        SLL     R0,     1                       ; DB15   0048
        RRC     R3,     2                       ; DB16   0077
        SLLC    R0,     1                       ; DB17   0058
        MOVR    R5,     R7                      ; DB18   00AF

        DECLE   $0048,  $0057,  $0048,  $0000   ; DB19   0048 0057 0048 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB1D   0000 0000 0000 0000
        DECLE   $0000                           ; DB21   0000

        INCR    R7                              ; DB22   000F

        INCR    R0                              ; DB23   0008
L_DB24:
        RSWD    R1                              ; DB24   0039
        DECLE   $0004,  $003A,  $0008,  $0022   ; DB25   0004 003A 0008 0022
        DECLE   $0084,  $00FA,  $0002,  $00FA   ; DB29   0084 00FA 0002 00FA
        DECLE   $0002,  $00AA,  $0003,  $0000   ; DB2D   0002 00AA 0003 0000
        DECLE   $0000,  $0000,  $0000,  $00F5   ; DB31   0000 0000 0000 00F5
        DECLE   $0019,  $0000,  $0000,  $001F   ; DB35   0019 0000 0000 001F

        SLL     R0,     1                       ; DB39   0048
        RRC     R3,     2                       ; DB3A   0077
        SLLC    R0,     1                       ; DB3B   0058
        MOVR    R5,     R7                      ; DB3C   00AF

        DECLE   $0048,  $00BF,  $0048,  $001F   ; DB3D   0048 00BF 0048 001F

        SLL     R0,     1                       ; DB41   0048
        RRC     R3,     2                       ; DB42   0077
        SLLC    R0,     1                       ; DB43   0058
        MOVR    R5,     R7                      ; DB44   00AF

        DECLE   $0048,  $0000,  $0000,  $00FD   ; DB45   0048 0000 0000 00FD
        DECLE   $0019,  $0000,  $0000,  $0000   ; DB49   0019 0000 0000 0000
        DECLE   $0000,  $0026,  $0008,  $0002   ; DB4D   0000 0026 0008 0002
        DECLE   $0004,  $00FA,  $0002,  $00FA   ; DB51   0004 00FA 0002 00FA
        DECLE   $0002,  $00FA,  $0002,  $00AA   ; DB55   0002 00FA 0002 00AA
        DECLE   $0003,  $0000,  $0080,  $0000   ; DB59   0003 0000 0080 0000
        DECLE   $0080,  $0000,  $0000,  $0000   ; DB5D   0080 0000 0000 0000
        DECLE   $0000,  $00BF,  $0048,  $0000   ; DB61   0000 00BF 0048 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB65   0000 0000 0000 0000
        DECLE   $0000,  $00BF,  $0048,  $0000   ; DB69   0000 00BF 0048 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB71   0000 0000 0000 0000
        DECLE   $0000,  $0022,  $0004,  $00FA   ; DB75   0000 0022 0004 00FA
        DECLE   $0002,  $00FA,  $0002,  $00FA   ; DB79   0002 00FA 0002 00FA
        DECLE   $0002,  $00FA,  $0002,  $001A   ; DB7D   0002 00FA 0002 001A
        DECLE   $0084,  $0000,  $0080,  $0000   ; DB81   0084 0000 0080 0000
        DECLE   $0080,  $0000,  $0000,  $0000   ; DB85   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB95   0000 0000 0000 0000
        DECLE   $0000,  $00A5,  $0003,  $00AD   ; DB99   0000 00A5 0003 00AD
        DECLE   $0003,  $00D2,  $0003,  $00FA   ; DB9D   0003 00D2 0003 00FA
        DECLE   $0002,  $00FA,  $0002,  $00FA   ; DBA1   0002 00FA 0002 00FA
        DECLE   $0002,  $00FA,  $0002,  $003A   ; DBA5   0002 00FA 0002 003A
        DECLE   $0084,  $0000,  $0000,  $00A5   ; DBA9   0084 0000 0000 00A5
        DECLE   $0003,  $00AD,  $0003,  $0000   ; DBAD   0003 00AD 0003 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DBB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DBB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DBB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0045   ; DBBD   0000 0000 0000 0045
        DECLE   $0008,  $004D,  $0008,  $001D   ; DBC1   0008 004D 0008 001D
        DECLE   $0003,  $0062,  $0083,  $00FA   ; DBC5   0003 0062 0083 00FA
        DECLE   $0002,  $00FA,  $0002,  $00FA   ; DBC9   0002 00FA 0002 00FA
        DECLE   $0002,  $00FA,  $0002,  $008A   ; DBCD   0002 00FA 0002 008A
        DECLE   $0083,  $006A,  $0083,  $0075   ; DBD1   0083 006A 0083 0075
        DECLE   $0003,  $0095,  $0003,  $00AD   ; DBD5   0003 0095 0003 00AD
        DECLE   $0003,  $0000,  $0000,  $0000   ; DBD9   0003 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DBDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DBE1   0000 0000 0000 0000
        DECLE   $0080,  $0000,  $0080,  $0002   ; DBE5   0080 0000 0080 0002
        DECLE   $0083,  $0022,  $0083,  $0042   ; DBE9   0083 0022 0083 0042
        DECLE   $0083,  $00FA,  $0002,  $00FA   ; DBED   0083 00FA 0002 00FA
        DECLE   $0002,  $00FA,  $0002,  $00FA   ; DBF1   0002 00FA 0002 00FA
        DECLE   $0002,  $0086,  $0028,  $007E   ; DBF5   0002 0086 0028 007E
        DECLE   $0008,  $00FA,  $0022,  $008A   ; DBF9   0008 00FA 0022 008A
        DECLE   $0083,  $006A,  $0083,  $0075   ; DBFD   0083 006A 0083 0075
        DECLE   $0003,  $0065,  $0008,  $0000   ; DC01   0003 0065 0008 0000
        DECLE   $0080,  $0000,  $0080,  $0000   ; DC05   0080 0000 0080 0000
        DECLE   $0080,  $0000,  $0080,  $0000   ; DC09   0080 0000 0080 0000
        DECLE   $0080,  $0000,  $0080,  $00FA   ; DC0D   0080 0000 0080 00FA
        DECLE   $0002,  $00FA,  $0002,  $00C6   ; DC11   0002 00FA 0002 00C6
        DECLE   $0028,  $00CE,  $0008,  $00FA   ; DC15   0028 00CE 0008 00FA
        DECLE   $0022,  $00FA,  $0002,  $0000   ; DC19   0022 00FA 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC25   0000 0000 0000 0000
        DECLE   $0020,  $0000,  $0000,  $0000   ; DC29   0020 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0022   ; DC31   0000 0000 0000 0022
        DECLE   $0006,  $0000,  $0000,  $0000   ; DC35   0006 0000 0000 0000
        DECLE   $0020,  $0000,  $0000,  $0000   ; DC39   0020 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC41   0000 0000 0000 0000
        DECLE   $0000,  $00F9,  $0002,  $00F9   ; DC45   0000 00F9 0002 00F9
        DECLE   $0002,  $0059,  $0003,  $0039   ; DC49   0002 0059 0003 0039
        DECLE   $0003,  $0019,  $0003,  $00B1   ; DC4D   0003 0019 0003 00B1
        DECLE   $0003,  $00B9,  $0003,  $0002   ; DC51   0003 00B9 0003 0002
        DECLE   $0008,  $0002,  $0008,  $0002   ; DC55   0008 0002 0008 0002
        DECLE   $0008,  $0002,  $0008,  $00B1   ; DC59   0008 0002 0008 00B1
        DECLE   $0003,  $00B9,  $0003,  $0011   ; DC5D   0003 00B9 0003 0011
        DECLE   $0003,  $0031,  $0003,  $0051   ; DC61   0003 0031 0003 0051
        DECLE   $0003,  $00F9,  $0002,  $00F9   ; DC65   0003 00F9 0002 00F9
        DECLE   $0002,  $00F9,  $0002,  $00F9   ; DC69   0002 00F9 0002 00F9
        DECLE   $0002,  $00F9,  $0002,  $0019   ; DC6D   0002 00F9 0002 0019
        DECLE   $0004,  $0000,  $0000,  $0000   ; DC71   0004 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC89   0000 0000 0000 0000
        DECLE   $0000,  $0011,  $0004,  $00F9   ; DC8D   0000 0011 0004 00F9
        DECLE   $0002,  $00F9,  $0002,  $00F9   ; DC91   0002 00F9 0002 00F9
        DECLE   $0002,  $00F9,  $0002,  $0009   ; DC95   0002 00F9 0002 0009
        DECLE   $0004,  $0000,  $0000,  $0065   ; DC99   0004 0000 0000 0065
        DECLE   $0058,  $0000,  $0000,  $0065   ; DC9D   0058 0000 0000 0065
        DECLE   $0058,  $00C5,  $0003,  $008D   ; DCA1   0058 00C5 0003 008D
        DECLE   $0006,  $002A,  $0058,  $0082   ; DCA5   0006 002A 0058 0082
        DECLE   $0058,  $008D,  $0006,  $00CD   ; DCA9   0058 008D 0006 00CD
        DECLE   $0003,  $0065,  $0058,  $0000   ; DCAD   0003 0065 0058 0000
        DECLE   $0000,  $0065,  $0058,  $0000   ; DCB1   0000 0065 0058 0000
        DECLE   $0000,  $0049,  $0008,  $00F9   ; DCB5   0000 0049 0008 00F9
        DECLE   $0082,  $00F9,  $0002,  $00F9   ; DCB9   0082 00F9 0002 00F9
        DECLE   $0002,  $00F9,  $0002,  $00B9   ; DCBD   0002 00F9 0002 00B9
        DECLE   $0003,  $0000,  $0000,  $0000   ; DCC1   0003 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0000   ; DCC5   0000 0000 0080 0000
        DECLE   $0000,  $00D4,  $0003,  $005E   ; DCC9   0000 00D4 0003 005E
        DECLE   $0008,  $005E,  $0008,  $005E   ; DCCD   0008 005E 0008 005E
        DECLE   $0008,  $005E,  $0008,  $00DC   ; DCD1   0008 005E 0008 00DC
        DECLE   $0003,  $0000,  $0000,  $0000   ; DCD5   0003 0000 0000 0000
        DECLE   $0080,  $0000,  $0000,  $0000   ; DCD9   0080 0000 0000 0000
        DECLE   $0000,  $00B1,  $0003,  $00F9   ; DCDD   0000 00B1 0003 00F9
        DECLE   $0002,  $00F9,  $0002,  $00F9   ; DCE1   0002 00F9 0002 00F9
        DECLE   $0002,  $0032,  $0008,  $0000   ; DCE5   0002 0032 0008 0000
        DECLE   $0000,  $00F6,  $0009,  $0009   ; DCE9   0000 00F6 0009 0009
        DECLE   $0006,  $001C,  $0018,  $0007   ; DCED   0006 001C 0018 0007
        DECLE   $0006,  $0000,  $0080,  $0000   ; DCF1   0006 0000 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DCF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DCF9   0000 0000 0000 0000
        DECLE   $0080,  $0009,  $0006,  $001C   ; DCFD   0080 0009 0006 001C
        DECLE   $0018,  $0007,  $0006,  $00FE   ; DD01   0018 0007 0006 00FE
        DECLE   $0009,  $0000,  $0000,  $008A   ; DD05   0009 0000 0000 008A
        DECLE   $0008,  $00F9,  $0002,  $00F9   ; DD09   0008 00F9 0002 00F9
        DECLE   $0002,  $0032,  $0008,  $0000   ; DD0D   0002 0032 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0009   ; DD15   0000 0000 0080 0009
        DECLE   $0006,  $000C,  $0018,  $0007   ; DD19   0006 000C 0018 0007
        DECLE   $0006,  $0000,  $0000,  $0000   ; DD1D   0006 0000 0000 0000
        DECLE   $0000,  $0009,  $0006,  $0014   ; DD21   0000 0009 0006 0014
        DECLE   $0018,  $0007,  $0006,  $0000   ; DD25   0018 0007 0006 0000
        DECLE   $0080,  $0000,  $0000,  $0000   ; DD29   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $008A   ; DD2D   0000 0000 0000 008A
        DECLE   $0008,  $00F9,  $0002,  $00F9   ; DD31   0008 00F9 0002 00F9
        DECLE   $0002,  $0032,  $0008,  $0000   ; DD35   0002 0032 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0000   ; DD41   0000 0000 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD49   0000 0000 0000 0000
        DECLE   $0080,  $0000,  $0000,  $0000   ; DD4D   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $008A   ; DD55   0000 0000 0000 008A
        DECLE   $0008,  $00F9,  $0002,  $00F9   ; DD59   0008 00F9 0002 00F9
        DECLE   $0002,  $00D9,  $0003,  $0038   ; DD5D   0002 00D9 0003 0038
        DECLE   $0058,  $0000,  $0000,  $0000   ; DD61   0058 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD79   0000 0000 0000 0000
        DECLE   $0000,  $0038,  $0058,  $00D1   ; DD7D   0000 0038 0058 00D1
        DECLE   $0003,  $00F9,  $0002,  $00F9   ; DD81   0003 00F9 0002 00F9
        DECLE   $0002,  $00A9,  $0003,  $00BC   ; DD85   0002 00A9 0003 00BC
        DECLE   $0085,  $00AC,  $0085,  $00BC   ; DD89   0085 00AC 0085 00BC
        DECLE   $0085,  $00AC,  $0085,  $0000   ; DD8D   0085 00AC 0085 0000
        DECLE   $0080,  $0000,  $0080,  $0000   ; DD91   0080 0000 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD99   0000 0000 0000 0000
        DECLE   $0080,  $0000,  $0080,  $00A4   ; DD9D   0080 0000 0080 00A4
        DECLE   $0085,  $00B4,  $0085,  $00A4   ; DDA1   0085 00B4 0085 00A4
        DECLE   $0085,  $00B4,  $0085,  $00A1   ; DDA5   0085 00B4 0085 00A1
        DECLE   $0083,  $00F9,  $0002,  $00F9   ; DDA9   0083 00F9 0002 00F9
        DECLE   $0002,  $00F9,  $0002,  $0089   ; DDAD   0002 00F9 0002 0089
        DECLE   $0083,  $0069,  $0083,  $00BC   ; DDB1   0083 0069 0083 00BC
        DECLE   $0085,  $00AC,  $0085,  $0000   ; DDB5   0085 00AC 0085 0000
        DECLE   $0080,  $0000,  $0080,  $0000   ; DDB9   0080 0000 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDC1   0000 0000 0000 0000
        DECLE   $0080,  $0000,  $0080,  $00A4   ; DDC5   0080 0000 0080 00A4
        DECLE   $0085,  $00B4,  $0085,  $0061   ; DDC9   0085 00B4 0085 0061
        DECLE   $0083,  $0081,  $0083,  $00F9   ; DDCD   0083 0081 0083 00F9
        DECLE   $0002,  $00F9,  $0002,  $00F9   ; DDD1   0002 00F9 0002 00F9
        DECLE   $0002,  $00EE,  $0028,  $00E6   ; DDD5   0002 00EE 0028 00E6
        DECLE   $0008,  $00F9,  $0022,  $0089   ; DDD9   0008 00F9 0022 0089
        DECLE   $0003,  $0069,  $0003,  $00BC   ; DDDD   0003 0069 0003 00BC
        DECLE   $0005,  $00AC,  $0005,  $0000   ; DDE1   0005 00AC 0005 0000
        DECLE   $0080,  $0000,  $0080,  $0000   ; DDE5   0080 0000 0080 0000
        DECLE   $0080,  $0000,  $0080,  $00A4   ; DDE9   0080 0000 0080 00A4
        DECLE   $0005,  $00B4,  $0005,  $0061   ; DDED   0005 00B4 0005 0061
        DECLE   $0003,  $0081,  $0003,  $00FE   ; DDF1   0003 0081 0003 00FE
        DECLE   $0028,  $0006,  $0009,  $00F9   ; DDF5   0028 0006 0009 00F9
        DECLE   $0022,  $00F9,  $0002,  $0000   ; DDF9   0022 00F9 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE05   0000 0000 0000 0000
        DECLE   $0020,  $0000,  $0000,  $0000   ; DE09   0020 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE15   0000 0000 0000 0000
        DECLE   $0020,  $0000,  $0000,  $0000   ; DE19   0020 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; DE21   0000 0000 0000
.GRAM_INIT_DE24:
        DECLE   $0040           ; DE24  # of GRAM cards to init
        DECLE   $0021,  $00A0   ; DE25  #00-01:  CART #50-51 ----
        DECLE   $0041,  $03B0   ; DE27  #02-09:  GROM #60-67 ----
        DECLE   $0051,  $03B0   ; DE29  #0A-11:  GROM #68-6F ----
        DECLE   $0061,  $03B0   ; DE2B  #12-19:  GROM #70-77 ----
        DECLE   $0071,  $03B0   ; DE2D  #1A-21:  GROM #78-7F ----
        DECLE   $0001,  $03D0   ; DE2F  #22-29:  GROM #00-07 ----
        DECLE   $0011,  $03D0   ; DE31  #2A-31:  GROM #08-0F ----
        DECLE   $0021,  $00D0   ; DE33  #32-33:  GROM #10-11 ----
        DECLE   $0003,  $03A0   ; DE35  #34-3B:  CART #41-48 ----
        DECLE   $0015,  $00A0   ; DE37  #3C-3D:  CART #4A-4B ----
        DECLE   $0034           ; DE39  #3E   :  CART #1A    ----
        DECLE   $0001,  $0380   ; DE3A  #3F-46:  CART #00-07 ----
        DECLE   $0011,  $0300,  $001F,  $0020   ; DE3C   0011 0300 001F 0020
        DECLE   $0021,  $0280,  $0201,  $03C0   ; DE40   0021 0280 0201 03C0
        DECLE   $0211,  $02C0,  $0127,  $0040   ; DE44   0211 02C0 0127 0040
        DECLE   $0113,  $0040,  $013F,  $0040   ; DE48   0113 0040 013F 0040
        DECLE   $002D,  $0080,  $024F,  $00C0   ; DE4C   002D 0080 024F 00C0
        DECLE   $014F,  $0040,  $0153,  $0040   ; DE50   014F 0040 0153 0040
        DECLE   $0013,  $0020,  $025B,  $0040   ; DE54   0013 0020 025B 0040
        DECLE   $001E,  $0001,  $0010,  $0001   ; DE58   001E 0001 0010 0001
        DECLE   $0010,  $0073,  $0080,  $0034   ; DE5C   0010 0073 0080 0034
        DECLE   $0001,  $0080,  $0030,  $0008   ; DE60   0001 0080 0030 0008
        DECLE   $0032,  $0025,  $00A0,  $0039   ; DE64   0032 0025 00A0 0039
        DECLE   $0100,  $0026,  $003F           ; DE68   0100 0026 003F

        SUBR    R0,     R0                      ; DE6B   0100
        NEGR    R4                              ; DE6C   0024

        JSRD    R4,     .EXEC.801               ; DE6D   0004 001A 0001
        DECLE   $0010,  $0201,  $0240,  $0115   ; DE70   0010 0201 0240 0115
        DECLE   $0040,  $021F,  $0140,  $0041   ; DE74   0040 021F 0140 0041
        DECLE   $03B0,  $0051,  $03B0,  $0061   ; DE78   03B0 0051 03B0 0061
        DECLE   $0230,  $0077,  $0180,  $0034   ; DE7C   0230 0077 0180 0034
        DECLE   $004B,  $0380,  $001E,  $005B   ; DE80   004B 0380 001E 005B
        DECLE   $0300,  $020B,  $00C0,  $0035   ; DE84   0300 020B 00C0 0035
        DECLE   $0080,  $0225,  $00C0,  $0029   ; DE88   0080 0225 00C0 0029
        DECLE   $00A0,  $0001,  $0010,  $022D   ; DE8C   00A0 0001 0010 022D

        CMPR    R0,     R0                      ; DE90   0140

        JSRD    R4,     .EXEC.801               ; DE91   0004 001A 0001
        DECLE   $0010,  $0239                   ; DE94   0010 0239

        CMPR    R0,     R0                      ; DE96   0140
        SWAP    R1,     1                       ; DE97   0041
        AND@    R6,     R0                      ; DE98   03B0
        RLC     R1,     1                       ; DE99   0051
        AND@    R6,     R0                      ; DE9A   03B0
        SLR     R1,     1                       ; DE9B   0061
        MOVR    R6,     R0                      ; DE9C   00B0
L_DE9D:
        PSHR    R5                              ; DE9D   0275

        JSR     R5,     X_PLAY_SFX2             ; DE9E   0004 0118 03BE
        DECLE   $0028                           ; DEA1  SFX prio
        DECLE   $03C9                           ; DEA2  SFX data
        DECLE   $0340,  $0180                   ; DEA3  SFX data
        DECLE   $0308,  $01C8                   ; DEA5  SFX data
        DECLE   $00AB                           ; DEA7  SFX data
        DECLE   $0001,  $0388                   ; DEA8  SFX data
        DECLE   $0061,  $039E                   ; DEAA  SFX data
        DECLE   $03B2                           ; DEAC  SFX data
        DECLE   $03CA                           ; DEAD  SFX data
        DECLE   $00EB                           ; DEAE  SFX data
        DECLE   $02CF                           ; DEAF  SFX end

L_DEB0:
        PSHR    R5                              ; DEB0   0275

        JSR     R5,     X_PLAY_SFX2             ; DEB1   0004 0118 03BE
        DECLE   $0028                           ; DEB4  SFX prio
        DECLE   $0249                           ; DEB5  SFX data
        DECLE   $020D                           ; DEB6  SFX data
        DECLE   $03C0,  $0200                   ; DEB7  SFX data
        DECLE   $0388,  $01C0                   ; DEB9  SFX data
        DECLE   $03BE                           ; DEBB  SFX data
        DECLE   $026B                           ; DEBC  SFX data
        DECLE   $0340,  $0200                   ; DEBD  SFX data
        DECLE   $0288,  $01C0                   ; DEBF  SFX data
        DECLE   $03BE                           ; DEC1  SFX data
        DECLE   $026B                           ; DEC2  SFX data
        DECLE   $02CF                           ; DEC3  SFX end


        MVI     .BTAB.00,R0                     ; DEC4   0280 0200
        SKIP                                    ; DEC6   0208
        CLRR    R0                              ; DEC7   01C0
        XOR@    R1,     R6                      ; DEC8   03CE
        MVO@    R3,     R5                      ; DEC9   026B
        ADD@    R1,     R7                      ; DECA   02CF

L_DECB:
        PSHR    R5                              ; DECB   0275

        JSR     R5,     X_PLAY_SFX2             ; DECC   0004 0118 03BE
        DECLE   $0028                           ; DECF  SFX prio
        DECLE   $03C9                           ; DED0  SFX data
        DECLE   $0300,  $01C0                   ; DED1  SFX data
        DECLE   $0308,  $01B8                   ; DED3  SFX data
        DECLE   $03FE                           ; DED5  SFX data
        DECLE   $016B                           ; DED6  SFX data
        DECLE   $03C9                           ; DED7  SFX data
        DECLE   $02C8,  $0180                   ; DED8  SFX data
        DECLE   $0300,  $01B0                   ; DEDA  SFX data
        DECLE   $03FE                           ; DEDC  SFX data
        DECLE   $022B                           ; DEDD  SFX data
        DECLE   $03DE                           ; DEDE  SFX data
        DECLE   $016B                           ; DEDF  SFX data
        DECLE   $02CF                           ; DEE0  SFX end

L_DEE1:
        PSHR    R5                              ; DEE1   0275

        JSR     R5,     X_PLAY_SFX2             ; DEE2   0004 0118 03BE
        DECLE   $002A                           ; DEE5  SFX prio
        DECLE   $0389                           ; DEE6  SFX data
        DECLE   $03E0,  $0000                   ; DEE7  SFX data
        DECLE   $0398,  $0340                   ; DEE9  SFX data
        DECLE   $0354,  $0200                   ; DEEB  SFX data
        DECLE   $026B                           ; DEED  SFX data
        DECLE   $03D2                           ; DEEE  SFX data
        DECLE   $03EA                           ; DEEF  SFX data
        DECLE   $03F6                           ; DEF0  SFX data
        DECLE   $008F,  $0013                   ; DEF1  SFX data
        DECLE   $02CF                           ; DEF3  SFX end

L_DEF4:
        PSHR    R5                              ; DEF4   0275

        JSR     R5,     X_PLAY_SFX2             ; DEF5   0004 0118 03BE
        DECLE   $0028                           ; DEF8  SFX prio
        DECLE   $03C9                           ; DEF9  SFX data
        DECLE   $0340,  $0140                   ; DEFA  SFX data
        DECLE   $0348,  $0148                   ; DEFC  SFX data
        DECLE   $0141,  $0310                   ; DEFE  SFX data
        DECLE   $0141,  $0312                   ; DF00  SFX data
        DECLE   $000F,  $03FA                   ; DF02  SFX data
        DECLE   $03FE                           ; DF04  SFX data
        DECLE   $008F,  $0031                   ; DF05  SFX data
        DECLE   $02CF                           ; DF07  SFX end

L_DF08:
        PSHR    R5                              ; DF08   0275

        JSR     R5,     X_PLAY_SFX2             ; DF09   0004 0118 03BE
        DECLE   $0028                           ; DF0C  SFX prio
        DECLE   $01C9                           ; DF0D  SFX data
        DECLE   $0350,  $0000                   ; DF0E  SFX data
        DECLE   $0318,  $0007                   ; DF10  SFX data
        DECLE   $010D                           ; DF12  SFX data
        DECLE   $02D5                           ; DF13  SFX data
        DECLE   $001E                           ; DF14  SFX data
        DECLE   $00EB                           ; DF15  SFX data
        DECLE   $03BE                           ; DF16  SFX data
        DECLE   $00EB                           ; DF17  SFX data
        DECLE   $0035                           ; DF18  SFX data
        DECLE   $006B                           ; DF19  SFX data
        DECLE   $0340,  $0200                   ; DF1A  SFX data
        DECLE   $0308,  $0207                   ; DF1C  SFX data
        DECLE   $03F5                           ; DF1E  SFX data
        DECLE   $03BE                           ; DF1F  SFX data
        DECLE   $026B                           ; DF20  SFX data
        DECLE   $02CF                           ; DF21  SFX end

L_DF22:
        PSHR    R5                              ; DF22   0275

        JSR     R5,     X_PLAY_SFX2             ; DF23   0004 0118 03BE
        DECLE   $0028                           ; DF26  SFX prio
        DECLE   $0389                           ; DF27  SFX data
        DECLE   $02C0,  $002B                   ; DF28  SFX data
        DECLE   $0208,  $015A                   ; DF2A  SFX data
        DECLE   $01C4,  $00D6                   ; DF2C  SFX data
        DECLE   $0021,  $0018                   ; DF2E  SFX data
        DECLE   $0001,  $0022                   ; DF30  SFX data
        DECLE   $0001,  $03F1                   ; DF32  SFX data
        DECLE   $003C,  $01AC                   ; DF34  SFX data
        DECLE   $000B                           ; DF36  SFX data
        DECLE   $008F,  $0013                   ; DF37  SFX data
        DECLE   $02CF                           ; DF39  SFX end

L_DF3A:
        PSHR    R5                              ; DF3A   0275

        JSR     R5,     X_PLAY_SFX2             ; DF3B   0004 0118 03BE
        DECLE   $0028                           ; DF3E  SFX prio
        DECLE   $0389                           ; DF3F  SFX data
        DECLE   $004F,  $0008                   ; DF40  SFX data
        DECLE   $0290,  $0100                   ; DF42  SFX data
        DECLE   $0258,  $0105                   ; DF44  SFX data
        DECLE   $0214,  $010B                   ; DF46  SFX data
        DECLE   $004E                           ; DF48  SFX data
        DECLE   $012B                           ; DF49  SFX data
        DECLE   $03CE                           ; DF4A  SFX data
        DECLE   $00A3,  $03EC                   ; DF4B  SFX data
        DECLE   $02CF                           ; DF4D  SFX end


        PSHR    R5                              ; DF4E   0275

        JSR     R5,     X_PLAY_SFX2             ; DF4F   0004 0118 03BE
        DECLE   $002A                           ; DF52  SFX prio
        DECLE   $0389                           ; DF53  SFX data
        DECLE   $03D0,  $0000                   ; DF54  SFX data
        DECLE   $03D8,  $0007                   ; DF56  SFX data
        DECLE   $03D4,  $0200                   ; DF58  SFX data
        DECLE   $03DE                           ; DF5A  SFX data
        DECLE   $006B                           ; DF5B  SFX data
        DECLE   $02CF                           ; DF5C  SFX end

L_DF5D:
        PSHR    R5                              ; DF5D   0275

        JSR     R5,     X_PLAY_SFX2             ; DF5E   0004 0118 03BE
        DECLE   $0028                           ; DF61  SFX prio
        DECLE   $0389                           ; DF62  SFX data
        DECLE   $0340,  $0040                   ; DF63  SFX data
        DECLE   $02D8,  $0000                   ; DF65  SFX data
        DECLE   $0294,  $0200                   ; DF67  SFX data
        DECLE   $0281,  $0140                   ; DF69  SFX data
        DECLE   $0001,  $002A                   ; DF6B  SFX data
        DECLE   $0141,  $02C1                   ; DF6D  SFX data
        DECLE   $00AB                           ; DF6F  SFX data
        DECLE   $02CF                           ; DF70  SFX end

L_DF71:
        PSHR    R5                              ; DF71   0275

        JSR     R5,     X_PLAY_SFX2             ; DF72   0004 0118 03BE
        DECLE   $0026                           ; DF75  SFX prio
        DECLE   $03C9                           ; DF76  SFX data
        DECLE   $0280,  $0200                   ; DF77  SFX data
        DECLE   $02C8,  $0207                   ; DF79  SFX data
        DECLE   $00A1,  $0078                   ; DF7B  SFX data
        DECLE   $00A1,  $007A                   ; DF7D  SFX data
        DECLE   $00EB                           ; DF7F  SFX data
        DECLE   $02CF                           ; DF80  SFX end

L_DF81:
        PSHR    R5                              ; DF81   0275

        JSR     R5,     X_PLAY_SFX2             ; DF82   0004 0118 03BE
        DECLE   $0028                           ; DF85  SFX prio
        DECLE   $03C9                           ; DF86  SFX data
        DECLE   $004F,  $0008                   ; DF87  SFX data
        DECLE   $0288,  $0140                   ; DF89  SFX data
        DECLE   $0280,  $01C0                   ; DF8B  SFX data
        DECLE   $0001,  $0270                   ; DF8D  SFX data
        DECLE   $0001,  $0362                   ; DF8F  SFX data
        DECLE   $002B                           ; DF91  SFX data
        DECLE   $0001,  $00A0                   ; DF92  SFX data
        DECLE   $0001,  $0192                   ; DF94  SFX data
        DECLE   $0023,  $03D4                   ; DF96  SFX data
        DECLE   $02CF                           ; DF98  SFX end

L_DF99:
        PSHR    R5                              ; DF99   0275

        JSR     R5,     X_PLAY_SFX2             ; DF9A   0004 0118 03BE
        DECLE   $0028                           ; DF9D  SFX prio
        DECLE   $0369                           ; DF9E  SFX data
        DECLE   $020D                           ; DF9F  SFX data
        DECLE   $01C0,  $0340                   ; DFA0  SFX data
        DECLE   $0072                           ; DFA2  SFX data
        DECLE   $02EB                           ; DFA3  SFX data
        DECLE   $02CF                           ; DFA4  SFX end

L_DFA5:
        PSHR    R5                              ; DFA5   0275

        JSR     R5,     X_PLAY_SFX2             ; DFA6   0004 0118 03BE
        DECLE   $0027                           ; DFA9  SFX prio
        DECLE   $03C9                           ; DFAA  SFX data
        DECLE   $02D0,  $0340                   ; DFAB  SFX data
        DECLE   $02D8,  $0348                   ; DFAD  SFX data
        DECLE   $006B                           ; DFAF  SFX data
        DECLE   $0290,  $0300                   ; DFB0  SFX data
        DECLE   $0298,  $0308                   ; DFB2  SFX data
        DECLE   $006B                           ; DFB4  SFX data
        DECLE   $02CF                           ; DFB5  SFX end

L_DFB6:
        PSHR    R5                              ; DFB6   0275

        JSR     R5,     X_PLAY_SFX2             ; DFB7   0004 0118 03BE
        DECLE   $0029                           ; DFBA  SFX prio
        DECLE   $0389                           ; DFBB  SFX data
        DECLE   $02C0,  $0080                   ; DFBC  SFX data
        DECLE   $0308,  $0080                   ; DFBE  SFX data
        DECLE   $0344,  $0080                   ; DFC0  SFX data
        DECLE   $001E                           ; DFC2  SFX data
        DECLE   $002B                           ; DFC3  SFX data
        DECLE   $03AE                           ; DFC4  SFX data
        DECLE   $002B                           ; DFC5  SFX data
        DECLE   $02CF                           ; DFC6  SFX end

L_DFC7:
        PSHR    R5                              ; DFC7   0275

        JSR     R5,     .EXEC.7C1               ; DFC8   0004 0114 03C1
        JSR     R5,     X_PLAY_SFX2             ; DFCB   0004 0118 03BE
        DECLE   $0029                           ; DFCE  SFX prio
        DECLE   $0189                           ; DFCF  SFX data
        DECLE   $001D                           ; DFD0  SFX data
        DECLE   $0280,  $0200                   ; DFD1  SFX data
        DECLE   $02C8,  $0180                   ; DFD3  SFX data
        DECLE   $0294,  $0340                   ; DFD5  SFX data
        DECLE   $010D                           ; DFD7  SFX data
        DECLE   $0001,  $03B2                   ; DFD8  SFX data
        DECLE   $03C1,  $0140                   ; DFDA  SFX data
        DECLE   $000F,  $0004                   ; DFDC  SFX data
        DECLE   $0215                           ; DFDE  SFX data
        DECLE   $03F6                           ; DFDF  SFX data
        DECLE   $008F,  $001D                   ; DFE0  SFX data
        DECLE   $0001,  $0052                   ; DFE2  SFX data
        DECLE   $00A1,  $02B0                   ; DFE4  SFX data
        DECLE   $000F,  $03FC                   ; DFE6  SFX data
        DECLE   $0016                           ; DFE8  SFX data
        DECLE   $03C3,  $03B4                   ; DFE9  SFX data
        DECLE   $02CF                           ; DFEB  SFX end

        DECLE   $0000,  $0000,  $0000,  $0000   ; DFEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFFC   0000 0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5014       $6454  
;;  $5019       $504D   $507D  
;;  $5048       <entry>
;;  $5093       $6E5E  
;;  $50B8       $50CD  
;;  $50FA       $50FE   $512F  
;;  $5129       $5116   $511E  
;;  $5131       $6E34  
;;  $513D       $5138  
;;  $5145       $5140  
;;  $5162       $515F  
;;  $5169       $5148  
;;  $5175       $5171  
;;  $517B       $5151  
;;  $517F       $511B  
;;  $51B7       $51B5  
;;  $51BD       $5056  
;;  $51D0       $51CB  
;;  $51D6       $51D2  
;;  $51F1       $51E7  
;;  $51F6       $609C  
;;  $523B       $51D6  
;;  $526C       $5264  
;;  $5270       $526A  
;;  $5272       $523E  
;;  $5273       $51EA  
;;  $5283       $527F  
;;  $5285       $5277  
;;  $5286       $51DF  
;;  $52A5       $5292  
;;  $52AE       $52A3  
;;  $52B0       $528A   $5290  
;;  $52B1       $51E2  
;;  $52C8       $52C3  
;;  $52D3       $52BA  
;;  $5356       $5356  
;;  $535E       $535C  
;;  $5370       $5062   $64F9   $65A9   $665F   $6967   $6A0A   $D0BB   $D19C  
;;  $5370       $D1B1   $D1B8  
;;  $5377       $502C   $64A1  
;;  $537A       $5395  
;;  $537C       $5375  
;;  $5398       $552E   $5544  
;;  $53B5       $53AD   $53B1  
;;  $53BB       $5531   $5549  
;;  $53D3       $53CF  
;;  $53E2       $53DD  
;;  $53E4       $53D8  
;;  $53EF       $540F  
;;  $5403       $53FE  
;;  $540B       $5407  
;;  $5420       $5414  
;;  $543F       $543D  
;;  $5450       $5450  
;;  $545A       $545A  
;;  $5476       $53C7   $53F6  
;;  $548E       $5488   $548A  
;;  $549F       $5DEF  
;;  $54A7       $5491   $5495   $549A   $54A0  
;;  $54C5       $54BD  
;;  $54CD       $54B7  
;;  $5506       $5501  
;;  $5510       $550A  
;;  $551A       $6E45  
;;  $5539       $552C  
;;  $553F       $556D  
;;  $5555       $5547  
;;  $556F       $5537   $5542   $555C  
;;  $5570       $553F  
;;  $5580       $5576  
;;  $5581       $557C  
;;  $5585       $5555  
;;  $5592       $558C  
;;  $559A       $5597  
;;  $559E       $559B  
;;  $55A9       $55AD  
;;  $55AD       $55A7  
;;  $55B5       $5590  
;;  $55B6       $554C   $5752   $579E   $57FE   $584F  
;;  $55C2       $55BE  
;;  $55D6       $55CB  
;;  $55D7       $55C4   $55D5  
;;  $55E4       $55E2  
;;  $55F3       $55F1  
;;  $5603       $55FC  
;;  $5608       $55FF   $5604  
;;  $562B       $5628  
;;  $562F       $562C  
;;  $5648       $563A  
;;  $5652       $55BA   $55C0   $5601   $5606  
;;  $5653       $560B   $5612   $561B   $5622  
;;  $5657       $5655  
;;  $56CA       $554F  
;;  $56D6       $56CE  
;;  $56D7       $56D3  
;;  $56ED       $56DB   $56E1   $56E5  
;;  $56EE       $56D0  
;;  $5724       $56F0   $56F8   $56FA   $56FF   $5705   $5708  
;;  $5725       $6457  
;;  $572E       $5534   $5552  
;;  $579A       $574C  
;;  $57A9       $5798  
;;  $57AF       $573D   $5742  
;;  $57DB       $5732   $5737   $5747   $57AD  
;;  $584B       $57F8  
;;  $585A       $5849  
;;  $5860       $57E9   $57EE  
;;  $588C       $57DE   $57E3   $57F3   $585E  
;;  $58A5       $58A3  
;;  $58A7       $58A7  
;;  $58B9       $5AE3  
;;  $58BC       $58C6  
;;  $58C3       $58BD  
;;  $58C5       $576F   $5790   $5820   $5841   $58C1  
;;  $58C9       $551B  
;;  $58E5       $58CE   $58E2  
;;  $58F2       $6E48  
;;  $591C       $590F  
;;  $591E       $58F9   $58FE   $5907  
;;  $5939       $5936  
;;  $593D       $592C   $5931  
;;  $5944       $5940  
;;  $594B       $5947  
;;  $5952       $6451  
;;  $5959       $6E4B  
;;  $5969       $5963  
;;  $5978       $5974  
;;  $597B       $595D   $596D  
;;  $597C       $5965  
;;  $59A2       $5989   $5992  
;;  $59A5       $5980  
;;  $59A6       $5657  
;;  $59B0       $59AB  
;;  $59B6       $59B1  
;;  $59BA       $59C0  
;;  $59BD       $59C2  
;;  $59BF       $59B8  
;;  $59CE       $59C7  
;;  $5AEB       $5AE9  
;;  $5CD3       $5CD1  
;;  $5CE0       $5CE0  
;;  $5F31       $5F31  
;;  $5F43       $5F43  
;;  $60C0       $60BD  
;;  $60C3       $60C0  
;;  $60F6       $60F6  
;;  $610B       $610B  
;;  $612A       $6128  
;;  $6401       $5D79  
;;  $6436       $50DB   $5195   $65E7   $6755  
;;  $644C       $644F  
;;  $646B       $6465  
;;  $646D       $6469  
;;  $6480       $647A  
;;  $6482       $647E  
;;  $648C       $6473   $6486  
;;  $648E       $6493  
;;  $64AA       $64A7  
;;  $64B6       $64CD  
;;  $64C9       $64B0  
;;  $64CF       $64AE   $64C7  
;;  $64DB       $64F2  
;;  $64EE       $64D5  
;;  $64F4       $64D3   $64EC  
;;  $64FE       $64F7  
;;  $6507       $6507  
;;  $6524       $6510   $651A  
;;  $6537       $6533  
;;  $6561       $6E63  
;;  $6567       $65BD   $65C2  
;;  $656C       $65DA   $6610  
;;  $6571       $6619   $6628  
;;  $6576       $6632   $6650  
;;  $6581       $665D  
;;  $6589       $667B  
;;  $658C       $6585  
;;  $6594       $6698  
;;  $6599       $6590  
;;  $65A2       $65AF  
;;  $65A4       $659D  
;;  $65A5       $659F  
;;  $65B1       $6565  
;;  $65BA       $62B6   $65CD  
;;  $65BF       $65B4  
;;  $65C4       $65B8  
;;  $65CF       $656A  
;;  $65DC       $65D2  
;;  $6609       $6607  
;;  $660E       $660A  
;;  $6612       $656F  
;;  $661B       $6615  
;;  $662A       $6574  
;;  $6634       $662D  
;;  $6652       $6579  
;;  $665F       $6587  
;;  $666C       $6675  
;;  $6677       $666E  
;;  $667D       $6592  
;;  $66AA       $6EC6  
;;  $66CB       $66BC  
;;  $66D6       $66D0  
;;  $66D8       $66D4  
;;  $66E2       $66DB  
;;  $66EC       $6730  
;;  $6729       $66EA  
;;  $672C       $6750  
;;  $6735       $66E0   $6746  
;;  $6739       $66E8  
;;  $6748       $673C  
;;  $6752       $66AF  
;;  $6776       $66DD   $6729   $673F   $6749   $6D85  
;;  $6785       $677A  
;;  $6789       $67B4   $67C7  
;;  $6799       $67B2  
;;  $67B1       $67A6  
;;  $67B6       $678C  
;;  $67BD       $67BA  
;;  $67D3       $6ECD  
;;  $67E8       $67D7  
;;  $6801       $6BC1  
;;  $6803       $DAA9  
;;  $680E       $6808  
;;  $6828       $685A  
;;  $6832       $67DC   $687C   $688F   $68BD   $6965   $697B   $6980   $69CF  
;;  $6833       $6803  
;;  $6840       $683A  
;;  $685C       $6835  
;;  $6889       $68CA  
;;  $689C       $685E  
;;  $68CC       $689E  
;;  $68E1       $68D7  
;;  $68E5       $68D5   $68DF  
;;  $68ED       $6922  
;;  $68FF       $68CE  
;;  $6914       $690A  
;;  $6918       $6908   $6912  
;;  $6924       $6901  
;;  $692A       $67F9  
;;  $6935       $693B  
;;  $6939       $6933  
;;  $693D       $692F  
;;  $6947       $6944  
;;  $6950       $693F  
;;  $6956       $6977  
;;  $6971       $6952  
;;  $6979       $6973  
;;  $6998       $6992  
;;  $699E       $67F3  
;;  $69C2       $69B9  
;;  $69CD       $69C4  
;;  $69D8       $69A4  
;;  $69F6       $6A2E  
;;  $6A21       $69FE  
;;  $6A25       $69EB  
;;  $6A30       $69DA  
;;  $6A67       $6A32  
;;  $6A6B       $6928  
;;  $6A6C       $6A7B   $6A86  
;;  $6A72       $6C95  
;;  $6A76       $6A70  
;;  $6A7D       $6A77  
;;  $6A7F       $6A88  
;;  $6A8A       $6A81  
;;  $6A98       $6A92  
;;  $6A9A       $6A96  
;;  $6AAB       $6AB8  
;;  $6AAD       $6ABC   $6D00  
;;  $6AB4       $6AA9  
;;  $6ABE       $69A0  
;;  $6ACA       $6ACF  
;;  $6AE0       $6AD6  
;;  $6AF1       $6B2F   $6B33  
;;  $6AFA       $69C0   $69CB   $69D6  
;;  $6AFF       $6B09  
;;  $6B0B       $6B01  
;;  $6B35       $6AC2   $6ACC  
;;  $6B5D       $6BB4  
;;  $6B66       $6B38   $6B3C   $6B41  
;;  $6B7F       $6B88  
;;  $6B82       $6B77  
;;  $6B8A       $6B79  
;;  $6B9B       $6B80  
;;  $6B9C       $6B9A  
;;  $6BA5       $699C   $6D8C  
;;  $6BB6       $67F5  
;;  $6BBE       $67FF   $6BEE  
;;  $6BD3       $6BEA  
;;  $6BE3       $6A60   $6B0D   $6B68   $6B6D  
;;  $6BE4       $6BCD  
;;  $6BEC       $6BC8  
;;  $6BF0       $6BC5  
;;  $6BF4       $6C03  
;;  $6C00       $6C3C   $6C5A   $6C6D   $6CB0   $6CEC   $6D1E   $6D2D   $6D40  
;;  $6C00       $6D53   $6D60   $6D65  
;;  $6C01       $6BF2  
;;  $6C10       $6C83   $6C91  
;;  $6C11       $6CA3  
;;  $6C22       $6C2C  
;;  $6C2E       $6C24  
;;  $6C31       $6C38   $6C3E  
;;  $6C3A       $6C2F  
;;  $6C40       $6C33  
;;  $6C69       $6C4D  
;;  $6C77       $6C06  
;;  $6C85       $6C79  
;;  $6C93       $6C87  
;;  $6CA5       $6BB8  
;;  $6CB6       $6CC1  
;;  $6CC3       $6CB8   $6D35   $6D48   $6D59  
;;  $6CC6       $6D5C  
;;  $6CDE       $6CE7  
;;  $6CE9       $6CE1  
;;  $6D02       $6CF6  
;;  $6D04       $6D0C  
;;  $6D24       $6CA9  
;;  $6D37       $6D26  
;;  $6D4A       $6D39  
;;  $6D5B       $6CBF   $6D33   $6D46  
;;  $6D5E       $6D4C  
;;  $6D77       $6D6A  
;;  $6D88       $6D75  
;;  $6D8E       $67EA   $6871   $6877   $68B1   $68B7   $6AD1   $6CAB   $6CBA  
;;  $6D8E       $6CE3   $6D19   $6D28   $6D3B   $6D4E   $D023   $D100   $D508  
;;  $6D9D       $6DA1  
;;  $6D9F       $6D97  
;;  $6DCA       $6DC8  
;;  $6DCD       $6DCB  
;;  $6DF2       $6DF2  
;;  $6E2F       <entry>
;;  $6E33       $5120  
;;  $6E41       $6E3E  
;;  $6E44       $5123   $679F  
;;  $6E59       $508F  
;;  $6E62       <entry>
;;  $6E7C       $6E7C  
;;  $6EA3       $6E8B   $6E8F   $6E93   $6E97   $6E9B   $6E9F  
;;  $6EAD       $6E6E  
;;  $6EB7       $6E69   $6EB0  
;;  $6EC6       $6EC3  
;;  $6ECD       $6EBA  
;;  $6EDB       $6ED8  
;;  $6FA6       <entry>
;;  $6FB8       $6FCA  
;;  $6FBA       $6FC4   $6FD5   $6FE6  
;;  $6FBF       $6FBC  
;;  $6FC6       $6FB2  
;;  $6FCC       $6FAD  
;;  $6FD3       $6FDB  
;;  $6FD7       $6FCD  
;;  $6FDD       $6FAF  
;;  $6FE4       $6FEC  
;;  $6FE8       $6FDE  
;;  $D01B       $D044  
;;  $D01F       $D02C   $D034  
;;  $D02E       $D028  
;;  $D042       $D04B  
;;  $D04D       $D007  
;;  $D05F       $D072  
;;  $D061       $D076  
;;  $D06A       $D05D  
;;  $D074       $D06C  
;;  $D078       $D068  
;;  $D08A       $D087  
;;  $D099       $D096  
;;  $D0B3       $D053  
;;  $D0B6       $D0B1  
;;  $D0D7       $D051   $D08C   $D09B  
;;  $D0E6       $5E7C  
;;  $D0E7       $D11C  
;;  $D0F8       $D0EA  
;;  $D0FC       $D109   $D111  
;;  $D10B       $D105  
;;  $D11E       $D009  
;;  $D12C       $D021   $D0FE   $D138  
;;  $D136       $D140   $D149  
;;  $D14B       $6622   $D1CB  
;;  $D150       $D15E  
;;  $D156       $D153  
;;  $D192       $6735  
;;  $D1AA       $D1A4  
;;  $D1AC       $D1A8  
;;  $D1B8       $D1AF  
;;  $D1BD       $D1B6  
;;  $D210       $50DE   $5198   $65EA   $6758  
;;  $D211       $D20A   $D20F  
;;  $D21F       $D219  
;;  $D221       $D21D  
;;  $D248       $67C4   $6ED0  
;;  $D249       $D247  
;;  $D24F       $6791  
;;  $D250       $D24E  
;;  $D256       $6812  
;;  $D25E       $D25B  
;;  $D260       $6844  
;;  $D268       $D25E   $D265  
;;  $D278       $D275  
;;  $D27B       $6935  
;;  $D289       $D286  
;;  $D29A       $D297  
;;  $D2C5       $D28B   $D29C   $D2A1   $D2F9   $D370   $D3B1   $D3CA  
;;  $D2C6       $6EB4  
;;  $D2DD       $680A   $683C   $6897   $6A06   $6A43   $6B90   $6C40   $6C4F  
;;  $D2DD       $6C72   $6CF8   $6D13   $6EA9  
;;  $D2E6       $D2E2  
;;  $D2E9       $6B0F   $6B8D   $6C6F   $6D10   $6E86   $D0AE  
;;  $D2F2       $D2EE  
;;  $D2F5       $6C53  
;;  $D34E       $D30E   $D31E   $D32E   $D33E  
;;  $D351       $D30B   $D314   $D324   $D334   $D344  
;;  $D352       $D35E  
;;  $D360       $D354   $D365  
;;  $D361       $D31B   $D32B   $D33B   $D34B  
;;  $D363       $D36A  
;;  $D36C       $65ED   $6772  
;;  $D3A4       $68E1   $D1D1  
;;  $D3AF       $D3BB  
;;  $D3BD       $6914   $D1D4  
;;  $D3C8       $D3D4  
;;  $D3D6       $679B   $682C   $6869   $68A9   $6984   $69B0   $69E6   $6A3D  
;;  $D3D6       $6AAD   $6AF7   $6B47   $6B9E   $6BF6   $6C18   $6CD3   $6D08  
;;  $D3D6       $6EA3   $6EDB   $D0A4   $D0AB   $D2C2   $D2D6  
;;  $D3E3       $D3DB  
;;  $D3EF       $D3E7  
;;  $D3F3       $D3ED   $D3FC   $D405  
;;  $D3FE       $D3F4  
;;  $D407       $D3F7   $D400  
;;  $D415       $D409  
;;  $D422       $D418  
;;  $D428       $D420  
;;  $D42D       $D230   $D23D   $D45D  
;;  $D42E       $D42C  
;;  $D440       $6E2F  
;;  $D460       $D444  
;;  $D461       $D471   $D491  
;;  $D46C       $D441   $D456   $D47E  
;;  $D47A       $D477  
;;  $D47B       $6718   $671F   $D40F  
;;  $D48B       $D481   $D484  
;;  $D496       $D486   $D489  
;;  $D497       <entry>
;;  $D4A6       $D4DF  
;;  $D4B2       $D4A9  
;;  $D4BF       $D49C  
;;  $D4C5       $D4E3  
;;  $D4DB       $D4B5   $D517  
;;  $D4DC       $D4A4   $D4C3   $D4FE  
;;  $D4EA       $D4E7  
;;  $D4F3       $D504  
;;  $D4F7       $D4FC  
;;  $D500       $D4EF  
;;  $D506       $D49E  
;;  $D50B       $6D21  
;;  $D515       $D51C  
;;  $D526       $D524  
;;  $D52E       $D52C  
;;  $D537       $D252  
;;  $D545       $D24B  
;;  $D54C       $51D9  
;;  $D55E       $D550  
;;  $D55F       $51DC  
;;  $D573       $D563  
;;  $D574       $D55B   $D570  
;;  $D593       $D599  
;;  $D643       $D641  
;;  $D6F2       $D6F0  
;;  $D6F3       $D6F1  
;;  $D726       $D724  
;;  $D9D6       $D9D4  
;;  $DB24       $DB22  
;;  $DE9D       $69B3   $6BE0  
;;  $DEB0       $686C   $68AC   $6A21   $6A40   $6C1B   $6EA6  
;;  $DECB       $6AB0  
;;  $DEE1       $6BFD   $D09D  
;;  $DEF4       $599F   $68FB  
;;  $DF08       $6625   $664D   $6695   $6C45   $6C65   $D0D4   $D1CE  
;;  $DF22       $65D7   $6B5A   $D2B3  
;;  $DF3A       $6BB1  
;;  $DF5D       $6794  
;;  $DF71       $6A72  
;;  $DF81       $6AF2  
;;  $DF99       $682F  
;;  $DFA5       $5978  
;;  $DFB6       $6CD6   $D2D9  
;;  $DFC7       $D078  
;; ======================================================================== ;;
