
        ORG     $5000
.HEADER:
        BIDECLE $0000           ; 5000  Ptr: MOB graphic images
        BIDECLE $0000           ; 5002  Ptr: EXEC timer table
        BIDECLE $0000           ; 5004  Ptr: Start of game
        BIDECLE $9000           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $517D           ; 5008  Ptr: GRAM init sequence
        BIDECLE $500D           ; 500A  Ptr: Date/Title
        DECLE   $00C0           ; 500C  Key-click / flags
.TITLE:
        DECLE   $0056           ; 500D  Cartridge year
        STRING  "H"             ; 500E  Title string
        STRING  "F"             ; 500F  Color Stack init (0, 1)
.TITLECODE:
        CLRR    R0              ; 5011  Color Stack init (2, 3)
        DECLE   $0161           ; 5013  Border color init


        MVO     R0,     G_0357                  ; 5014   0240 0357
        MVO     R0,     G_0358                  ; 5016   0240 0358
        INCR    R0                              ; 5018   0008
        MVO     R0,     G_0102                  ; 5019   0240 0102
        MVII    #$02F1, R6                      ; 501B   02BE 02F1

        JSR     R5,     L_6D87                  ; 501D   0004 016C 0187
        JSR     R5,     L_5F4B                  ; 5020   0004 015C 034B
L_5023:
        JSR     R5,     L_5218                  ; 5023   0004 0150 0218
        BIDECLE $551D                           ; 5026   001D 0055

        JSR     R5,     L_6BD5                  ; 5028   0004 0168 03D5
        DECLE   $0004                           ; 502B   0004

        ANDR    R7,     R4                      ; 502C   01BC
        COMR    R0                              ; 502D   0018

        JSR     R5,     L_6DBB                  ; 502E   0004 016C 01BB

L_5031:
        EIS                                     ; 5031   0002
        DECLE   $0280,  $0102,  $0010,  $0223   ; 5032   0280 0102 0010 0223
        DECLE   $0005,  $0280,  $0166,  $03B8   ; 5036   0005 0280 0166 03B8
        DECLE   $0001,  $0204,  $0014,  $0004   ; 503A   0001 0204 0014 0004

        XORR    R2,     R0                      ; 503E   01D0
        MOVR    R3,     R7                      ; 503F   009F

        DECLE   $0335,  $0020,  $00F8,  $0093   ; 5040   0335 0020 00F8 0093
        DECLE   $0338,  $0008,  $0240,  $0335   ; 5044   0338 0008 0240 0335
        DECLE   $0004                           ; 5048   0004

        XORR    R2,     R0                      ; 5049   01D0
        MOVR    R3,     R7                      ; 504A   009F

        SUB@    R6,     R6                      ; 504B   0336
        SWAP    R0,     1                       ; 504C   0040
        MOVR    R6,     R0                      ; 504D   00B0
        MOVR    R2,     R3                      ; 504E   0093
        MVO     R0,     G_0336                  ; 504F   0240 0336

        JSR     R5,     L_5153                  ; 5051   0004 0150 0153

        MVI     .PSG0.rgt_hand,R0               ; 5054   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 5056   0380 01FF
        CMPI    #$00FF, R0                      ; 5058   0378 00FF
        BNEQ    L_5063                          ; 505A   020C 0007

        MVI     G_0161, R0                      ; 505C   0280 0161
        TSTR    R0                              ; 505E   0080
        BEQ     L_5031                          ; 505F   0224 002F
        B       L_5078                          ; 5061   0200 0015

L_5063:
        CMPI    #$00B7, R0                      ; 5063   0378 00B7
        BNEQ    L_5074                          ; 5065   020C 000D

        JSR     R5,     L_523B                  ; 5067   0004 0150 023B
        JSR     R5,     L_DDF0                  ; 506A   0004 01DC 01F0

        SLR     R3,     2                       ; 506D   0067
        ADDR    R3,     R6                      ; 506E   00DE
        CLRR    R0                              ; 506F   01C0
        MVO     R0,     G_0161                  ; 5070   0240 0161
        B       L_5023                          ; 5072   0220 0050

L_5074:
        MVO     R6,     G_0161                  ; 5074   0246 0161
        B       L_5031                          ; 5076   0220 0046

L_5078:
        JSR     R5,     L_523B                  ; 5078   0004 0150 023B
        JSR     R5,     L_6BE6                  ; 507B   0004 0168 03E6
        JSR     R5,     L_5220                  ; 507E   0004 0150 0220
        JSR     R5,     L_5F8D                  ; 5081   0004 015C 038D
        JSR     R5,     L_60A2                  ; 5084   0004 0160 00A2

        MVII    #$017B, R4                      ; 5087   02BC 017B
        MVII    #$0006, R0                      ; 5089   02B8 0006

        JSR     R5,     X_FILL_ZERO             ; 508B   0004 0114 0338

        CLRR    R0                              ; 508E   01C0
        MVO     R0,     G_0168                  ; 508F   0240 0168
L_5091:
        MVI     G_0102, R0                      ; 5091   0280 0102
        DECR    R0                              ; 5093   0010
        BPL     L_5091                          ; 5094   0223 0004

        JSR     R5,     L_5196                  ; 5096   0004 0150 0196
        JSR     R5,     L_618A                  ; 5099   0004 0160 018A
        JSR     R5,     L_5153                  ; 509C   0004 0150 0153
        JSR     R5,     .EXEC.AAD               ; 509F   0004 0118 02AD

        B       L_5091                          ; 50A2   0220 0012

L_50A4:
        EIS                                     ; 50A4   0002
        MVI     G_0102, R0                      ; 50A5   0280 0102
        DECR    R0                              ; 50A7   0010
        BPL     L_50A4                          ; 50A8   0223 0005

        JSR     R5,     L_50D3                  ; 50AA   0004 0150 00D3
        JSR     R5,     L_5129                  ; 50AD   0004 0150 0129
        JSR     R5,     L_618A                  ; 50B0   0004 0160 018A
        JSR     R5,     L_D16A                  ; 50B3   0004 01D0 016A
        JSR     R5,     L_D0E4                  ; 50B6   0004 01D0 00E4
        JSR     R5,     L_D040                  ; 50B9   0004 01D0 0040
        JSR     R5,     L_5196                  ; 50BC   0004 0150 0196
        DECLE   $0004,  $01D4,  $004F,  $0004   ; 50BF   0004 01D4 004F 0004

        XORR    R2,     R4                      ; 50C3   01D4
        MVII    #$0004, R3                      ; 50C4   02BB 0004
        CMPR    R2,     R0                      ; 50C6   0150
        MVO@    R0,     R1                      ; 50C7   0248

        JSR     R5,     .EXEC.AAD               ; 50C8   0004 0118 02AD
        JSR     R5,     L_5153                  ; 50CB   0004 0150 0153
        JSR     R5,     L_6B9A                  ; 50CE   0004 0168 039A

        B       L_50A4                          ; 50D1   0220 002E

L_50D3:
        PSHR    R5                              ; 50D3   0275
        DECLE   $0280,  $0166,  $03B8,  $0003   ; 50D4   0280 0166 03B8 0003
        DECLE   $020C,  $0009,  $0004           ; 50D8   020C 0009 0004

        XORR    R2,     R0                      ; 50DB   01D0
        MOVR    R3,     R7                      ; 50DC   009F

        DECLE   $0335,  $0020,  $0000           ; 50DD   0335 0020 0000

        MOVR    R2,     R3                      ; 50E0   0093
        MVO     R0,     G_0335                  ; 50E1   0240 0335
        PULR    R7                              ; 50E3   02B7

L_50E4:
        EIS                                     ; 50E4   0002
        MVI     G_0102, R0                      ; 50E5   0280 0102
        DECR    R0                              ; 50E7   0010
        BPL     L_50E4                          ; 50E8   0223 0005

        JSR     R5,     L_5129                  ; 50EA   0004 0150 0129
        JSR     R5,     L_5248                  ; 50ED   0004 0150 0248
        JSR     R5,     L_618A                  ; 50F0   0004 0160 018A
        JSR     R5,     L_D16A                  ; 50F3   0004 01D0 016A
        JSR     R5,     L_D0E4                  ; 50F6   0004 01D0 00E4
        JSR     R5,     L_5196                  ; 50F9   0004 0150 0196
        JSR     R5,     L_6A5E                  ; 50FC   0004 0168 025E
        JSR     R5,     L_6808                  ; 50FF   0004 0168 0008
        JSR     R5,     L_66D6                  ; 5102   0004 0164 02D6
        JSR     R5,     L_511C                  ; 5105   0004 0150 011C
        JSR     R5,     L_6A0F                  ; 5108   0004 0168 020F
        DECLE   $0004,  $01D4,  $004F,  $0004   ; 510B   0004 01D4 004F 0004

        XORR    R2,     R4                      ; 510F   01D4
        MVII    #$0004, R3                      ; 5110   02BB 0004
        SUBR    R3,     R0                      ; 5112   0118
        MVI@    R5,     R5                      ; 5113   02AD

        JSR     R5,     L_5153                  ; 5114   0004 0150 0153
        JSR     R5,     L_6B9A                  ; 5117   0004 0168 039A

        B       L_50E4                          ; 511A   0220 0037

L_511C:
        PSHR    R5                              ; 511C   0275
        DECLE   $0004                           ; 511D   0004

        XORR    R2,     R0                      ; 511E   01D0
        MOVR    R3,     R7                      ; 511F   009F

        SUB@    R6,     R6                      ; 5120   0336
        COMR    R0                              ; 5121   0018
        COMR    R0                              ; 5122   0018
        MOVR    R2,     R4                      ; 5123   0094
        SUBI    #$0008, R0                      ; 5124   0338 0008
        MVO     R0,     G_0336                  ; 5126   0240 0336
L_5128:
        PULR    R7                              ; 5128   02B7

L_5129:
        PSHR    R5                              ; 5129   0275
        MVI     G_0177, R1                      ; 512A   0281 0177
        CMPI    #$0078, R1                      ; 512C   0379 0078
        BGE     L_5144                          ; 512E   020D 0014

        MVII    #$016E, R4                      ; 5130   02BC 016E
        SDBD                                    ; 5132   0001
        MVI@    R4,     R1                      ; 5133   02A1
        TSTR    R1                              ; 5134   0089
        BMI     L_5144                          ; 5135   020B 000D

        MVI     G_0166, R0                      ; 5137   0280 0166
        ANDI    #$001F, R0                      ; 5139   03B8 001F
        BNEQ    L_5128                          ; 513B   022C 0014

        DECR    R1                              ; 513D   0011
        MVO     R1,     G_016E                  ; 513E   0241 016E
        SWAP    R1,     1                       ; 5140   0041
        MVO     R1,     G_016F                  ; 5141   0241 016F
        PULR    R7                              ; 5143   02B7

L_5144:
        MVII    #$0001, R0                      ; 5144   02B8 0001
        MVO     R0,     G_01D7                  ; 5146   0240 01D7
        MVII    #$000E, R0                      ; 5148   02B8 000E
        MVO     R0,     G_0168                  ; 514A   0240 0168

        JSR     R5,     L_5F8D                  ; 514C   0004 015C 038D

        DECR    R6                              ; 514F   0016
        J       L_57E5                          ; 5150   0004 0354 03E5

L_5153:
        PSHR    R5                              ; 5153   0275
        MVII    #$0001, R0                      ; 5154   02B8 0001

        JSR     R5,     X_RAND1                 ; 5156   0004 0114 027D

        MVI     G_0166, R4                      ; 5159   0284 0166
        DECR    R4                              ; 515B   0014
        MVO     R4,     G_0166                  ; 515C   0244 0166
        MVI     G_0103, R1                      ; 515E   0281 0103
        MVO     R1,     G_0102                  ; 5160   0241 0102
        MVI     G_01C3, R0                      ; 5162   0280 01C3
        DECR    R0                              ; 5164   0010
        BPL     L_5169                          ; 5165   0203 0002

        MVII    #$0008, R0                      ; 5167   02B8 0008
L_5169:
        MVO     R0,     G_01C3                  ; 5169   0240 01C3
        MVI     G_0166, R0                      ; 516B   0280 0166
        RRC     R0,     1                       ; 516D   0070
        BC      L_5179                          ; 516E   0201 0009

        MVI     G_01D5, R0                      ; 5170   0280 01D5
        DECR    R0                              ; 5172   0010
        BPL     L_5177                          ; 5173   0203 0002

        MVII    #$0003, R0                      ; 5175   02B8 0003
L_5177:
        MVO     R0,     G_01D5                  ; 5177   0240 01D5

L_5179:
        JSR     R5,     L_51EA                  ; 5179   0004 0150 01EA

        PULR    R7                              ; 517C   02B7

.GRAM_INIT_517D:
        DECLE   $0030           ; 517D  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 517E  #00-07:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 5180  #08-0F:  CART #08-0F ----
        DECLE   $0021,  $0380   ; 5182  #10-17:  CART #10-17 ----
        DECLE   $0031,  $0300   ; 5184  #18-1E:  CART #18-1E ----
        DECLE   $03B5,  $0319   ; 5186  #1F   :  Algo #2
        DECLE   $0311,  $023B   ; 5188  #20   :  Algo #2
        DECLE   $0003,  $0004   ; 518A  #21   :  4x4 tile
        DECLE   $0201,  $000C   ; 518C  #22   :  4x4 tile
        DECLE   $000D,  $03C1   ; 518E  #23   :  Algo #2
        DECLE   $0231,  $03C0   ; 5190  #24-2B:  GRAM #18-1F X---
        DECLE   $0241,  $00C0   ; 5192  #2C-2D:  GRAM #20-21 X---
        DECLE   $003D,  $00A0   ; 5194  #2E-2F:  CART #5E-5F ----

L_5196:
        MVII    #$005A, R2                      ; 5196   02BA 005A
        CMP     .PSG0.rgt_hand,R2               ; 5198   0342 01FE
        BEQ     L_51AD                          ; 519A   0204 0011

        CMP     .PSG0.lft_hand,R2               ; 519C   0342 01FF
        BEQ     L_51AD                          ; 519E   0204 000D

        MVI     G_0166, R0                      ; 51A0   0280 0166
        ANDI    #$007F, R0                      ; 51A2   03B8 007F
        BNEQ    L_523A                          ; 51A4   020C 0094

        MVI     G_0160, R0                      ; 51A6   0280 0160
        DECR    R0                              ; 51A8   0010
        MVO     R0,     G_0160                  ; 51A9   0240 0160
        BNEQ    L_523A                          ; 51AB   020C 008D

L_51AD:
        PSHR    R5                              ; 51AD   0275

        JSR     R5,     L_55BB                  ; 51AE   0004 0154 01BB

        MVI     .STIC.BORD,R0                   ; 51B1   0280 002C
        PSHR    R0                              ; 51B3   0270
        CLRR    R0                              ; 51B4   01C0
        MVO     R0,     .STIC.BORD              ; 51B5   0240 002C

        JSR     R5,     L_5218                  ; 51B7   0004 0150 0218
        BIDECLE $523A                           ; 51BA   003A 0052

        MVII    #$01FB, R4                      ; 51BC   02BC 01FB
        MOVR    R4,     R5                      ; 51BE   00A5
        CLRR    R3                              ; 51BF   01DB
        MVI@    R4,     R0                      ; 51C0   02A0
        MVO@    R3,     R5                      ; 51C1   026B
        MVI@    R4,     R1                      ; 51C2   02A1
        MVO@    R3,     R5                      ; 51C3   026B
        MVI@    R4,     R2                      ; 51C4   02A2
        MVO@    R3,     R5                      ; 51C5   026B
        PSHR    R0                              ; 51C6   0270
        PSHR    R1                              ; 51C7   0271
        PSHR    R2                              ; 51C8   0272
L_51C9:
        MVI     .PSG0.rgt_hand,R0               ; 51C9   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 51CB   0380 01FF
        CMPI    #$00FF, R0                      ; 51CD   0378 00FF
        BNEQ    L_51C9                          ; 51CF   022C 0007

        JSR     R5,     L_5220                  ; 51D1   0004 0150 0220
        JSR     R5,     L_55BB                  ; 51D4   0004 0154 01BB

        PULR    R2                              ; 51D7   02B2
        PULR    R1                              ; 51D8   02B1
        PULR    R0                              ; 51D9   02B0
        MVII    #$01FB, R5                      ; 51DA   02BD 01FB
        MVO@    R0,     R5                      ; 51DC   0268
        MVO@    R1,     R5                      ; 51DD   0269
        MVO@    R2,     R5                      ; 51DE   026A
        PULR    R0                              ; 51DF   02B0
        MVO     R0,     .STIC.BORD              ; 51E0   0240 002C
        MVO     R0,     .STIC.VIDEN             ; 51E2   0240 0020

        JSR     R5,     L_5218                  ; 51E4   0004 0150 0218
        BIDECLE $551D                           ; 51E7   001D 0055

        PULR    R7                              ; 51E9   02B7

L_51EA:
        MVI     G_0166, R0                      ; 51EA   0280 0166
        ANDI    #$000F, R0                      ; 51EC   03B8 000F
        BNEQ    L_51F7                          ; 51EE   020C 0007

        MVI     G_01D8, R0                      ; 51F0   0280 01D8
        DECR    R0                              ; 51F2   0010
        BMI     L_51F8                          ; 51F3   020B 0003

        MVO     R0,     G_01D8                  ; 51F5   0240 01D8
L_51F7:
        MOVR    R5,     R7                      ; 51F7   00AF

L_51F8:
        MVI     G_0178, R0                      ; 51F8   0280 0178
        CMPI    #$0028, R0                      ; 51FA   0378 0028
        BLT     L_51F7                          ; 51FC   0225 0006

        MVI     G_035E, R1                      ; 51FE   0281 035E
        MOVR    R1,     R2                      ; 5200   008A
        ANDI    #$0008, R2                      ; 5201   03BA 0008
        BNEQ    L_51F7                          ; 5203   022C 000D

        MVO     R1,     G_01D9                  ; 5205   0241 01D9
        ANDI    #$0007, R1                      ; 5207   03B9 0007
        INCR    R1                              ; 5209   0009
        CMPI    #$0078, R0                      ; 520A   0378 0078
        BGE     L_5214                          ; 520C   020D 0006

        SLR     R1,     1                       ; 520E   0061
        CMPI    #$0050, R0                      ; 520F   0378 0050
        BGE     L_5214                          ; 5211   020D 0001

        SLR     R1,     1                       ; 5213   0061
L_5214:
        INCR    R1                              ; 5214   0009
        MVO     R1,     G_01D8                  ; 5215   0241 01D8
        MOVR    R5,     R7                      ; 5217   00AF

L_5218:
        SDBD                                    ; 5218   0001
        MVI@    R5,     R1                      ; 5219   02A9
        MVO     R1,     .ISRVEC.0               ; 521A   0241 0100
        SWAP    R1,     1                       ; 521C   0041
        MVO     R1,     .ISRVEC.1               ; 521D   0241 0101
        MOVR    R5,     R7                      ; 521F   00AF

L_5220:
        MVII    #$01FE, R2                      ; 5220   02BA 01FE
        MVII    #$01FF, R3                      ; 5222   02BB 01FF
        MVII    #$00FF, R4                      ; 5224   02BC 00FF
L_5226:
        MVII    #$03FF, R1                      ; 5226   02B9 03FF
L_5228:
        MVI@    R3,     R0                      ; 5228   0298
        AND@    R2,     R0                      ; 5229   0390
        CMPR    R4,     R0                      ; 522A   0160
        BEQ     L_5226                          ; 522B   0224 0006

        DECR    R1                              ; 522D   0011
        BNEQ    L_5228                          ; 522E   022C 0007

L_5230:
        MVII    #$03FF, R1                      ; 5230   02B9 03FF
L_5232:
        MVI@    R3,     R0                      ; 5232   0298
        AND@    R2,     R0                      ; 5233   0390
        CMPR    R4,     R0                      ; 5234   0160
        BNEQ    L_5230                          ; 5235   022C 0006

        DECR    R1                              ; 5237   0011
        BNEQ    L_5232                          ; 5238   022C 0007
L_523A:
        MOVR    R5,     R7                      ; 523A   00AF

L_523B:
        PSHR    R5                              ; 523B   0275
        PSHR    R0                              ; 523C   0270

        JSR     R5,     X_STOP_SFX              ; 523D   0004 011C 02B4

        CLRR    R0                              ; 5240   01C0
        MVO     R0,     G_0146                  ; 5241   0240 0146

        JSR     R5,     .EXEC.A83               ; 5243   0004 0118 0283

        PULR    R0                              ; 5246   02B0
        PULR    R7                              ; 5247   02B7

L_5248:
        PSHR    R5                              ; 5248   0275
        MVII    #$0187, R1                      ; 5249   02B9 0187
        MVI@    R1,     R0                      ; 524B   0288
        MOVR    R0,     R2                      ; 524C   0082
        MVI     G_015D, R3                      ; 524D   0283 015D
        SWAP    R2,     2                       ; 524F   0046
        BMI     L_5259                          ; 5250   020B 0007

        CMPI    #$00FC, R3                      ; 5252   037B 00FC
        BNEQ    L_525E                          ; 5254   020C 0008

        CLRR    R0                              ; 5256   01C0
        B       L_525E                          ; 5257   0200 0005

L_5259:
        CMPI    #$00F0, R3                      ; 5259   037B 00F0
        BNEQ    L_525E                          ; 525B   020C 0001

        CLRR    R0                              ; 525D   01C0
L_525E:
        MVO@    R0,     R1                      ; 525E   0248
        MVII    #$018A, R1                      ; 525F   02B9 018A
        MVI@    R1,     R0                      ; 5261   0288
        MOVR    R0,     R2                      ; 5262   0082
        MVI     G_015E, R3                      ; 5263   0283 015E
        SWAP    R2,     2                       ; 5265   0046
        BMI     L_526F                          ; 5266   020B 0007

        CMPI    #$00FF, R3                      ; 5268   037B 00FF
        BNEQ    L_5274                          ; 526A   020C 0008

        CLRR    R0                              ; 526C   01C0
        B       L_5274                          ; 526D   0200 0005

L_526F:
        CMPI    #$00F6, R3                      ; 526F   037B 00F6
        BNEQ    L_5274                          ; 5271   020C 0001

        CLRR    R0                              ; 5273   01C0
L_5274:
        MVO@    R0,     R1                      ; 5274   0248
        MVII    #$0187, R4                      ; 5275   02BC 0187
        MVII    #$018D, R5                      ; 5277   02BD 018D
L_5279:
        MVI@    R4,     R0                      ; 5279   02A0
        SWAP    R0,     1                       ; 527A   0040
        SAR     R0,     2                       ; 527B   006C
        SAR     R0,     2                       ; 527C   006C
        SAR     R0,     1                       ; 527D   0068
        MOVR    R4,     R3                      ; 527E   00A3
        SDBD                                    ; 527F   0001
        ADD@    R4,     R0                      ; 5280   02E0
        MVO@    R0,     R3                      ; 5281   0258
        SWAP    R0,     1                       ; 5282   0040
        MOVR    R0,     R2                      ; 5283   0082
        MOVR    R0,     R1                      ; 5284   0081
        INCR    R3                              ; 5285   000B
        SUB@    R3,     R0                      ; 5286   0318
        ANDI    #$0007, R1                      ; 5287   03B9 0007
        MVO@    R1,     R3                      ; 5289   0259
        XORR    R1,     R2                      ; 528A   01CA
        MVO@    R2,     R5                      ; 528B   026A
        INCR    R5                              ; 528C   000D
        SUBR    R0,     R2                      ; 528D   0102
        MVO@    R2,     R5                      ; 528E   026A
        SUBI    #$0002, R5                      ; 528F   033D 0002
        CMPI    #$018F, R5                      ; 5291   037D 018F
        BNEQ    L_5279                          ; 5293   022C 001B

        MVI     G_0187, R0                      ; 5295   0280 0187

        JSR     R5,     X_EXT_SIGN_LO           ; 5297   0004 0114 0268

        NEGR    R0                              ; 529A   0020
        ADD     G_0340, R0                      ; 529B   02C0 0340
        MVO     R0,     G_0340                  ; 529D   0240 0340
        MVI     G_018A, R0                      ; 529F   0280 018A

        JSR     R5,     X_EXT_SIGN_LO           ; 52A1   0004 0114 0268

        NEGR    R0                              ; 52A4   0020
        ADD     G_0341, R0                      ; 52A5   02C0 0341
        MVO     R0,     G_0341                  ; 52A7   0240 0341
        MVI     G_0168, R2                      ; 52A9   0282 0168
        CMPI    #$0007, R2                      ; 52AB   037A 0007
        BNEQ    L_52B1                          ; 52AD   020C 0002
        B       L_52F2                          ; 52AF   0200 0041

L_52B1:
        JSR     R5,     L_5403                  ; 52B1   0004 0154 0003
        JSR     R5,     L_55BB                  ; 52B4   0004 0154 01BB

        CLRR    R4                              ; 52B7   01E4
        MVII    #$0319, R2                      ; 52B8   02BA 0319
        CLRR    R0                              ; 52BA   01C0

        JSR     R5,     L_D0BE                  ; 52BB   0004 01D0 00BE

        MVI     G_0189, R0                      ; 52BE   0280 0189
        MVO     R0,     .STIC.HDLY              ; 52C0   0240 0030
        MVI     G_018C, R0                      ; 52C2   0280 018C
        MVO     R0,     .STIC.VDLY              ; 52C4   0240 0031
        MVO     R0,     .STIC.VIDEN             ; 52C6   0240 0020
        MVI     G_018D, R0                      ; 52C8   0280 018D
        TSTR    R0                              ; 52CA   0080
        BEQ     L_52D2                          ; 52CB   0204 0005

        MVI     G_018E, R3                      ; 52CD   0283 018E
        TSTR    R3                              ; 52CF   009B
        BNEQ    L_52DA                          ; 52D0   020C 0008

L_52D2:
        JSR     R5,     L_530F                  ; 52D2   0004 0150 030F
        JSR     R5,     L_5376                  ; 52D5   0004 0150 0376

        B       L_52F2                          ; 52D8   0200 0018

L_52DA:
        SWAP    R3,     2                       ; 52DA   0047
        BMI     L_52E8                          ; 52DB   020B 000B

        MVII    #$0001, R1                      ; 52DD   02B9 0001
        SWAP    R0,     2                       ; 52DF   0044
        BPL     L_52E3                          ; 52E0   0203 0001

        NEGR    R1                              ; 52E2   0021

L_52E3:
        JSR     R5,     L_5380                  ; 52E3   0004 0150 0380

        B       L_52F2                          ; 52E6   0200 000A

L_52E8:
        MVII    #$0213, R4                      ; 52E8   02BC 0213
        SWAP    R0,     2                       ; 52EA   0044
        BPL     L_52EF                          ; 52EB   0203 0002

        ADDI    #$0002, R4                      ; 52ED   02FC 0002

L_52EF:
        JSR     R5,     L_53E7                  ; 52EF   0004 0150 03E7
L_52F2:
        JSR     R5,     X_PLAY_NOTE             ; 52F2   0004 0118 02BD

        MVI     G_018D, R1                      ; 52F5   0281 018D
        CLRR    R2                              ; 52F7   01D2
        SWAP    R1,     2                       ; 52F8   0045
        BEQ     L_5301                          ; 52F9   0204 0006
        BMI     L_52FE                          ; 52FB   020B 0001

        INCR    R2                              ; 52FD   000A

L_52FE:
        JSR     R5,     L_542B                  ; 52FE   0004 0154 002B

L_5301:
        MVI     G_018E, R1                      ; 5301   0281 018E
        MVII    #$0002, R2                      ; 5303   02BA 0002
        SWAP    R1,     2                       ; 5305   0045
        BEQ     L_530E                          ; 5306   0204 0006
        BMI     L_530B                          ; 5308   020B 0001

        INCR    R2                              ; 530A   000A

L_530B:
        JSR     R5,     L_542B                  ; 530B   0004 0154 002B

L_530E:
        PULR    R7                              ; 530E   02B7

L_530F:
        PSHR    R5                              ; 530F   0275
        MVI     G_018D, R0                      ; 5310   0280 018D
        SWAP    R0,     2                       ; 5312   0044
        BEQ     L_5375                          ; 5313   0204 0060
        BPL     L_5345                          ; 5315   0203 002E

        MVII    #$0200, R5                      ; 5317   02BD 0200
        MVII    #$0201, R4                      ; 5319   02BC 0201
        CLRR    R2                              ; 531B   01D2
L_531C:
        CLRR    R3                              ; 531C   01DB
        INCR    R3                              ; 531D   000B
L_531E:
        MVI@    R4,     R0                      ; 531E   02A0
        MVO@    R0,     R5                      ; 531F   0268
        NOP                                     ; 5320   0034
        MVI@    R4,     R0                      ; 5321   02A0
        MVO@    R0,     R5                      ; 5322   0268
        NOP                                     ; 5323   0034
        MVI@    R4,     R0                      ; 5324   02A0
        MVO@    R0,     R5                      ; 5325   0268
        NOP                                     ; 5326   0034
        MVI@    R4,     R0                      ; 5327   02A0
        MVO@    R0,     R5                      ; 5328   0268
        NOP                                     ; 5329   0034
        MVI@    R4,     R0                      ; 532A   02A0
        MVO@    R0,     R5                      ; 532B   0268
        NOP                                     ; 532C   0034
        MVI@    R4,     R0                      ; 532D   02A0
        MVO@    R0,     R5                      ; 532E   0268
        NOP                                     ; 532F   0034
        MVI@    R4,     R0                      ; 5330   02A0
        MVO@    R0,     R5                      ; 5331   0268
        NOP                                     ; 5332   0034
        MVI@    R4,     R0                      ; 5333   02A0
        MVO@    R0,     R5                      ; 5334   0268
        NOP                                     ; 5335   0034
        MVI@    R4,     R0                      ; 5336   02A0
        MVO@    R0,     R5                      ; 5337   0268
        NOP                                     ; 5338   0034
        MVI@    R4,     R0                      ; 5339   02A0
        MVO@    R0,     R5                      ; 533A   0268
        NOP                                     ; 533B   0034
        NEGR    R3                              ; 533C   0023
        TSTR    R3                              ; 533D   009B
        BMI     L_531E                          ; 533E   022B 0021

        CMPI    #$02E6, R4                      ; 5340   037C 02E6
        BLT     L_531C                          ; 5342   0225 0027
        PULR    R7                              ; 5344   02B7

L_5345:
        MVII    #$0212, R5                      ; 5345   02BD 0212
        MVII    #$0003, R1                      ; 5347   02B9 0003
        CLRR    R2                              ; 5349   01D2
L_534A:
        CLRR    R3                              ; 534A   01DB
        INCR    R3                              ; 534B   000B
L_534C:
        MVI@    R5,     R0                      ; 534C   02A8
        MVO@    R0,     R5                      ; 534D   0268
        SUBR    R1,     R5                      ; 534E   010D
        MVI@    R5,     R0                      ; 534F   02A8
        MVO@    R0,     R5                      ; 5350   0268
        SUBR    R1,     R5                      ; 5351   010D
        MVI@    R5,     R0                      ; 5352   02A8
        MVO@    R0,     R5                      ; 5353   0268
        SUBR    R1,     R5                      ; 5354   010D
        MVI@    R5,     R0                      ; 5355   02A8
        MVO@    R0,     R5                      ; 5356   0268
        SUBR    R1,     R5                      ; 5357   010D
        MVI@    R5,     R0                      ; 5358   02A8
        MVO@    R0,     R5                      ; 5359   0268
        SUBR    R1,     R5                      ; 535A   010D
        MVI@    R5,     R0                      ; 535B   02A8
        MVO@    R0,     R5                      ; 535C   0268
        SUBR    R1,     R5                      ; 535D   010D
        MVI@    R5,     R0                      ; 535E   02A8
        MVO@    R0,     R5                      ; 535F   0268
        SUBR    R1,     R5                      ; 5360   010D
        MVI@    R5,     R0                      ; 5361   02A8
        MVO@    R0,     R5                      ; 5362   0268
        SUBR    R1,     R5                      ; 5363   010D
        MVI@    R5,     R0                      ; 5364   02A8
        MVO@    R0,     R5                      ; 5365   0268
        SUBR    R1,     R5                      ; 5366   010D
        MVI@    R5,     R0                      ; 5367   02A8
        MVO@    R0,     R5                      ; 5368   0268
        SUBR    R1,     R5                      ; 5369   010D
        NEGR    R3                              ; 536A   0023
        TSTR    R3                              ; 536B   009B
        BMI     L_534C                          ; 536C   022B 0021

        ADDI    #$0028, R5                      ; 536E   02FD 0028
        CMPI    #$02F0, R5                      ; 5370   037D 02F0
        BLT     L_534A                          ; 5372   0225 0029

        INCR    R2                              ; 5374   000A
L_5375:
        PULR    R7                              ; 5375   02B7

L_5376:
        PSHR    R5                              ; 5376   0275
        MVI     G_018E, R0                      ; 5377   0280 018E
        SWAP    R0,     2                       ; 5379   0044
        BEQ     L_5402                          ; 537A   0204 0086
        BMI     L_53E4                          ; 537C   020B 0066

        CLRR    R1                              ; 537E   01C9
        INCR    R7                              ; 537F   000F

L_5380:
        PSHR    R5                              ; 5380   0275
L_5381:
        MVII    #$0214, R5                      ; 5381   02BD 0214
        MVII    #$0001, R3                      ; 5383   02BB 0001
L_5385:
        MVII    #$0200, R4                      ; 5385   02BC 0200
        TSTR    R3                              ; 5387   009B
        BMI     L_538C                          ; 5388   020B 0002

        ADDI    #$00DC, R4                      ; 538A   02FC 00DC
L_538C:
        MVII    #$0001, R2                      ; 538C   02BA 0001
L_538E:
        MVI@    R5,     R0                      ; 538E   02A8
        MVO@    R0,     R4                      ; 538F   0260
        NOP                                     ; 5390   0034
        MVI@    R5,     R0                      ; 5391   02A8
        MVO@    R0,     R4                      ; 5392   0260
        NOP                                     ; 5393   0034
        MVI@    R5,     R0                      ; 5394   02A8
        MVO@    R0,     R4                      ; 5395   0260
        NOP                                     ; 5396   0034
        MVI@    R5,     R0                      ; 5397   02A8
        MVO@    R0,     R4                      ; 5398   0260
        NOP                                     ; 5399   0034
        MVI@    R5,     R0                      ; 539A   02A8
        MVO@    R0,     R4                      ; 539B   0260
        NOP                                     ; 539C   0034
        MVI@    R5,     R0                      ; 539D   02A8
        MVO@    R0,     R4                      ; 539E   0260
        NOP                                     ; 539F   0034
        MVI@    R5,     R0                      ; 53A0   02A8
        MVO@    R0,     R4                      ; 53A1   0260
        NOP                                     ; 53A2   0034
        MVI@    R5,     R0                      ; 53A3   02A8
        MVO@    R0,     R4                      ; 53A4   0260
        NOP                                     ; 53A5   0034
        MVI@    R5,     R0                      ; 53A6   02A8
        MVO@    R0,     R4                      ; 53A7   0260
        NOP                                     ; 53A8   0034
        MVI@    R5,     R0                      ; 53A9   02A8
        MVO@    R0,     R4                      ; 53AA   0260
        NOP                                     ; 53AB   0034
        NEGR    R2                              ; 53AC   0022
        TSTR    R2                              ; 53AD   0092
        BMI     L_538E                          ; 53AE   022B 0021

        SUBI    #$0014, R5                      ; 53B0   033D 0014
        MVII    #$0200, R4                      ; 53B2   02BC 0200
        SUBR    R1,     R4                      ; 53B4   010C
        TSTR    R3                              ; 53B5   009B
        BPL     L_53BA                          ; 53B6   0203 0002

        ADDI    #$00DC, R4                      ; 53B8   02FC 00DC
L_53BA:
        MVI@    R4,     R0                      ; 53BA   02A0
        MVO@    R0,     R5                      ; 53BB   0268
        NOP                                     ; 53BC   0034
        MVI@    R4,     R0                      ; 53BD   02A0
        MVO@    R0,     R5                      ; 53BE   0268
        NOP                                     ; 53BF   0034
        MVI@    R4,     R0                      ; 53C0   02A0
        MVO@    R0,     R5                      ; 53C1   0268
        NOP                                     ; 53C2   0034
        MVI@    R4,     R0                      ; 53C3   02A0
        MVO@    R0,     R5                      ; 53C4   0268
        NOP                                     ; 53C5   0034
        MVI@    R4,     R0                      ; 53C6   02A0
        MVO@    R0,     R5                      ; 53C7   0268
        NOP                                     ; 53C8   0034
        MVI@    R4,     R0                      ; 53C9   02A0
        MVO@    R0,     R5                      ; 53CA   0268
        NOP                                     ; 53CB   0034
        MVI@    R4,     R0                      ; 53CC   02A0
        MVO@    R0,     R5                      ; 53CD   0268
        NOP                                     ; 53CE   0034
        MVI@    R4,     R0                      ; 53CF   02A0
        MVO@    R0,     R5                      ; 53D0   0268
        NOP                                     ; 53D1   0034
        MVI@    R4,     R0                      ; 53D2   02A0
        MVO@    R0,     R5                      ; 53D3   0268
        NOP                                     ; 53D4   0034
        MVI@    R4,     R0                      ; 53D5   02A0
        MVO@    R0,     R5                      ; 53D6   0268
        NOP                                     ; 53D7   0034
        NEGR    R2                              ; 53D8   0022
        TSTR    R2                              ; 53D9   0092
        BMI     L_53BA                          ; 53DA   022B 0021

        NEGR    R3                              ; 53DC   0023
        CMPI    #$02EF, R5                      ; 53DD   037D 02EF
        BLT     L_5385                          ; 53DF   0225 005B

        MVII    #$0003, R2                      ; 53E1   02BA 0003
        PULR    R7                              ; 53E3   02B7

L_53E4:
        MVII    #$0214, R4                      ; 53E4   02BC 0214
        INCR    R7                              ; 53E6   000F

L_53E7:
        PSHR    R5                              ; 53E7   0275
L_53E8:
        MVII    #$0200, R5                      ; 53E8   02BD 0200
L_53EA:
        MVI@    R4,     R0                      ; 53EA   02A0
        MVO@    R0,     R5                      ; 53EB   0268
        NOP                                     ; 53EC   0034
        MVI@    R4,     R0                      ; 53ED   02A0
        MVO@    R0,     R5                      ; 53EE   0268
        NOP                                     ; 53EF   0034
        MVI@    R4,     R0                      ; 53F0   02A0
        MVO@    R0,     R5                      ; 53F1   0268
        NOP                                     ; 53F2   0034
        MVI@    R4,     R0                      ; 53F3   02A0
        MVO@    R0,     R5                      ; 53F4   0268
        NOP                                     ; 53F5   0034
        MVI@    R4,     R0                      ; 53F6   02A0
        MVO@    R0,     R5                      ; 53F7   0268
        NOP                                     ; 53F8   0034
        MVI@    R4,     R0                      ; 53F9   02A0
        MVO@    R0,     R5                      ; 53FA   0268
        NOP                                     ; 53FB   0034
        CMPI    #$02DC, R5                      ; 53FC   037D 02DC
        BLT     L_53EA                          ; 53FE   0225 0015

L_5400:
        MVII    #$0002, R2                      ; 5400   02BA 0002
L_5402:
        PULR    R7                              ; 5402   02B7

L_5403:
        PSHR    R5                              ; 5403   0275
        MVII    #$0319, R2                      ; 5404   02BA 0319
L_5406:
        MVII    #$018F, R5                      ; 5406   02BD 018F
        MVI@    R2,     R0                      ; 5408   0290
        MOVR    R0,     R1                      ; 5409   0081
        SLL     R1,     1                       ; 540A   0049
        BPL     L_540F                          ; 540B   0203 0002

        MVII    #$018D, R5                      ; 540D   02BD 018D
L_540F:
        MOVR    R0,     R1                      ; 540F   0081
        ANDI    #$00FF, R1                      ; 5410   03B9 00FF
        XORR    R1,     R0                      ; 5412   01C8
        ADD@    R5,     R1                      ; 5413   02E9
        ANDI    #$00FF, R1                      ; 5414   03B9 00FF
        XORR    R1,     R0                      ; 5416   01C8
        MVO@    R0,     R2                      ; 5417   0250
        ADDI    #$0008, R2                      ; 5418   02FA 0008
        MVI@    R2,     R0                      ; 541A   0290
        MOVR    R0,     R1                      ; 541B   0081
        ANDI    #$007F, R1                      ; 541C   03B9 007F
        XORR    R1,     R0                      ; 541E   01C8
        ADD@    R5,     R1                      ; 541F   02E9
        ANDI    #$007F, R1                      ; 5420   03B9 007F
        XORR    R1,     R0                      ; 5422   01C8
        MVO@    R0,     R2                      ; 5423   0250
        SUBI    #$0007, R2                      ; 5424   033A 0007
        CMPI    #$0321, R2                      ; 5426   037A 0321
        BLT     L_5406                          ; 5428   0225 0023
        PULR    R7                              ; 542A   02B7

L_542B:
        PSHR    R5                              ; 542B   0275
        MVII    #$0200, R4                      ; 542C   02BC 0200
        MVI     G_015D, R0                      ; 542E   0280 015D
        MVI     G_015E, R1                      ; 5430   0281 015E
        CLRR    R3                              ; 5432   01DB
        INCR    R2                              ; 5433   000A
        ADDR    R7,     R2                      ; 5434   00FA
        ADD@    R2,     R7                      ; 5435   02D7

        DECLE   $0005                           ; 5436   0005

        INCR    R2                              ; 5437   000A
        NEGR    R4                              ; 5438   0024
        ADCR    R2                              ; 5439   002A
        PULR    R7                              ; 543A   02B7

        ADDI    #$0002, R0                      ; 543B   02F8 0002
        MVII    #$0013, R3                      ; 543D   02BB 0013
        ADDR    R3,     R4                      ; 543F   00DC
        DECR    R0                              ; 5440   0010
        MVO     R0,     G_015D                  ; 5441   0240 015D
        MVI     G_0168, R2                      ; 5443   0282 0168
        CMPI    #$0007, R2                      ; 5445   037A 0007
        BEQ     L_530E                          ; 5447   0224 013A

        ADDR    R3,     R0                      ; 5449   00D8
        MVII    #$000D, R3                      ; 544A   02BB 000D
        CLRR    R5                              ; 544C   01ED
        MVI     G_018E, R2                      ; 544D   0282 018E
        SWAP    R2,     2                       ; 544F   0046
        BEQ     L_5470                          ; 5450   0204 001E
        BMI     L_5457                          ; 5452   020B 0003

        DECR    R1                              ; 5454   0011
        B       L_5470                          ; 5455   0200 0019

L_5457:
        INCR    R1                              ; 5457   0009
        B       L_5470                          ; 5458   0200 0016

        ADDI    #$0002, R1                      ; 545A   02F9 0002
        ADDI    #$00DC, R4                      ; 545C   02FC 00DC
        MVII    #$000B, R3                      ; 545E   02BB 000B
        DECR    R1                              ; 5460   0011
        MVO     R1,     G_015E                  ; 5461   0241 015E
        MVI     G_0168, R2                      ; 5463   0282 0168
        CMPI    #$0007, R2                      ; 5465   037A 0007
        BEQ     L_530E                          ; 5467   0224 015A

        ADDR    R3,     R1                      ; 5469   00D9
        INCR    R7                              ; 546A   000F

L_546B:
        PSHR    R5                              ; 546B   0275
L_546C:
        MVII    #$0015, R3                      ; 546C   02BB 0015
        MVII    #$0008, R5                      ; 546E   02BD 0008
L_5470:
        MVO     R5,     G_015F                  ; 5470   0245 015F
        B       L_548C                          ; 5472   0200 0018

L_5474:
        JSR     R5,     L_54FE                  ; 5474   0004 0154 00FE

        ADD     G_015F, R7                      ; 5477   02C7 015F

        ADDI    #$0010, R2                      ; 5479   02FA 0010
        ADDI    #$0013, R4                      ; 547B   02FC 0013
        INCR    R1                              ; 547D   0009
        MOVR    R1,     R5                      ; 547E   008D
        B       L_5488                          ; 547F   0200 0007

        MOVR    R0,     R5                      ; 5481   0085
        ANDI    #$0001, R5                      ; 5482   03BD 0001
        ADDR    R5,     R5                      ; 5484   00ED
        ADDR    R5,     R2                      ; 5485   00EA
        INCR    R0                              ; 5486   0008
        MOVR    R0,     R5                      ; 5487   0085
L_5488:
        ANDI    #$000F, R5                      ; 5488   03BD 000F
        BNEQ    L_548F                          ; 548A   020C 0003

L_548C:
        JSR     R5,     L_54C5                  ; 548C   0004 0154 00C5

L_548F:
        DECR    R3                              ; 548F   0013
        BNEQ    L_5474                          ; 5490   022C 001D

        PSHR    R0                              ; 5492   0270
        PSHR    R1                              ; 5493   0271
        PSHR    R2                              ; 5494   0272
        PSHR    R4                              ; 5495   0274
        MVII    #$0001, R3                      ; 5496   02BB 0001
        MVI     G_015F, R5                      ; 5498   0285 015F
        TSTR    R5                              ; 549A   00AD
        BEQ     L_54AF                          ; 549B   0204 0012

        MVI     G_015D, R0                      ; 549D   0280 015D
        MVO     R0,     G_0191                  ; 549F   0240 0191
        MVO     R1,     G_0192                  ; 54A1   0241 0192
        SUBI    #$0014, R4                      ; 54A3   033C 0014
        ANDI    #$000F, R0                      ; 54A5   03B8 000F
        CMPI    #$000C, R0                      ; 54A7   0378 000C
        BLE     L_54AC                          ; 54A9   0206 0001

        INCR    R3                              ; 54AB   000B
L_54AC:
        INCR    R3                              ; 54AC   000B
        DECLE   $0200,  $000E                   ; 54AD   0200 000E
L_54AF:
        MVI     G_015E, R1                      ; 54AF   0281 015E
        DECLE   $0241,  $0192,  $0240,  $0191   ; 54B1   0241 0192 0240 0191
        DECLE   $033C,  $00F0,  $03B9,  $000F   ; 54B5   033C 00F0 03B9 000F
        DECLE   $0379,  $0004,  $022E,  $0010   ; 54B9   0379 0004 022E 0010
        DECLE   $0004,  $01BC,  $0209,  $02B4   ; 54BD   0004 01BC 0209 02B4

        PULR    R2                              ; 54C1   02B2
        PULR    R1                              ; 54C2   02B1
        PULR    R0                              ; 54C3   02B0
        PULR    R7                              ; 54C4   02B7

L_54C5:
        PSHR    R5                              ; 54C5   0275
        ANDI    #$00FF, R0                      ; 54C6   03B8 00FF
        ANDI    #$00FF, R1                      ; 54C8   03B9 00FF
        PSHR    R0                              ; 54CA   0270
        PSHR    R1                              ; 54CB   0271
        PSHR    R3                              ; 54CC   0273
        PSHR    R4                              ; 54CD   0274
        MOVR    R0,     R2                      ; 54CE   0082
        SLR     R2,     2                       ; 54CF   0066
        SLR     R2,     2                       ; 54D0   0066
        MOVR    R1,     R3                      ; 54D1   008B
        SLR     R3,     1                       ; 54D2   0063
        ANDI    #$00F8, R3                      ; 54D3   03BB 00F8
        MOVR    R2,     R4                      ; 54D5   0094
        ANDI    #$0001, R4                      ; 54D6   03BC 0001
        SLR     R2,     1                       ; 54D8   0062
        ADDR    R3,     R2                      ; 54D9   00DA
        ANDI    #$000F, R0                      ; 54DA   03B8 000F
        ANDI    #$000F, R1                      ; 54DC   03B9 000F
        SLR     R0,     1                       ; 54DE   0060
        SLL     R1,     2                       ; 54DF   004D
        SLL     R1,     1                       ; 54E0   0049
        ADDR    R0,     R1                      ; 54E1   00C1
        SLL     R1,     1                       ; 54E2   0049
        ANDI    #$007F, R2                      ; 54E3   03BA 007F
        SDBD                                    ; 54E5   0001
        ADDI    #$9C98, R2                      ; 54E6   02FA 0098 009C
        MVI@    R2,     R0                      ; 54E9   0290
        TSTR    R4                              ; 54EA   00A4
        BNEQ    L_54F0                          ; 54EB   020C 0003

        SLR     R0,     2                       ; 54ED   0064
        SLR     R0,     2                       ; 54EE   0064
        SLR     R0,     1                       ; 54EF   0060
L_54F0:
        ANDI    #$001F, R0                      ; 54F0   03B8 001F
        SDBD                                    ; 54F2   0001
        MVII    #$9D18, R2                      ; 54F3   02BA 0018 009D
        SWAP    R0,     1                       ; 54F6   0040
        ADDR    R0,     R2                      ; 54F7   00C2
        ADDR    R1,     R2                      ; 54F8   00CA
        PULR    R4                              ; 54F9   02B4
        PULR    R3                              ; 54FA   02B3
        PULR    R1                              ; 54FB   02B1
        PULR    R0                              ; 54FC   02B0
        PULR    R7                              ; 54FD   02B7

L_54FE:
        PSHR    R5                              ; 54FE   0275
        PSHR    R0                              ; 54FF   0270
        PSHR    R3                              ; 5500   0273
        PSHR    R4                              ; 5501   0274
        MOVR    R2,     R4                      ; 5502   0094
        SDBD                                    ; 5503   0001
        MVI@    R4,     R3                      ; 5504   02A3
        SARC    R0,     1                       ; 5505   0078
        BC      L_5509                          ; 5506   0201 0001

        SWAP    R3,     1                       ; 5508   0043
L_5509:
        ANDI    #$00FF, R3                      ; 5509   03BB 00FF
        SLL     R3,     1                       ; 550B   004B
        MOVR    R3,     R4                      ; 550C   009C
        SDBD                                    ; 550D   0001
        ADDI    #$9AA2, R4                      ; 550E   02FC 00A2 009A
        SDBD                                    ; 5511   0001
        MVI@    R4,     R5                      ; 5512   02A5
        PULR    R4                              ; 5513   02B4
        PULR    R3                              ; 5514   02B3
        PULR    R0                              ; 5515   02B0
        MVO@    R5,     R4                      ; 5516   0265
        PULR    R7                              ; 5517   02B7

L_5518:
        JSR     R5,     L_563A                  ; 5518   0004 0154 023A

        B       L_55AB                          ; 551B   0200 008E

        PSHR    R5                              ; 551D   0275
        MVI     G_0102, R3                      ; 551E   0283 0102
        DECR    R3                              ; 5520   0013
        BMI     L_5518                          ; 5521   022B 000A

        MVO     R3,     G_0102                  ; 5523   0243 0102
        CLRR    R4                              ; 5525   01E4
        MVII    #$0319, R5                      ; 5526   02BD 0319
        MVI@    R5,     R0                      ; 5528   02A8
        MVO@    R0,     R4                      ; 5529   0260
        MVI@    R5,     R0                      ; 552A   02A8
        MVO@    R0,     R4                      ; 552B   0260
        MVI@    R5,     R0                      ; 552C   02A8
        MVO@    R0,     R4                      ; 552D   0260
        MVI@    R5,     R0                      ; 552E   02A8
        MVO@    R0,     R4                      ; 552F   0260
        MVI@    R5,     R0                      ; 5530   02A8
        MVO@    R0,     R4                      ; 5531   0260
        MVI@    R5,     R0                      ; 5532   02A8
        MVO@    R0,     R4                      ; 5533   0260
        MVI@    R5,     R0                      ; 5534   02A8
        MVO@    R0,     R4                      ; 5535   0260
        MVI@    R5,     R0                      ; 5536   02A8
        MVO@    R0,     R4                      ; 5537   0260
        MVI@    R5,     R0                      ; 5538   02A8
        MVO@    R0,     R4                      ; 5539   0260
        MVI@    R5,     R0                      ; 553A   02A8
        MVO@    R0,     R4                      ; 553B   0260
        MVI@    R5,     R0                      ; 553C   02A8
        MVO@    R0,     R4                      ; 553D   0260
        MVI@    R5,     R0                      ; 553E   02A8
        MVO@    R0,     R4                      ; 553F   0260
        MVI@    R5,     R0                      ; 5540   02A8
        MVO@    R0,     R4                      ; 5541   0260
        MVI@    R5,     R0                      ; 5542   02A8
        MVO@    R0,     R4                      ; 5543   0260
        MVI@    R5,     R0                      ; 5544   02A8
        MVO@    R0,     R4                      ; 5545   0260
        MVI@    R5,     R0                      ; 5546   02A8
        MVO@    R0,     R4                      ; 5547   0260
        MVI@    R5,     R0                      ; 5548   02A8
        MVO@    R0,     R4                      ; 5549   0260
        MVI@    R5,     R0                      ; 554A   02A8
        MVO@    R0,     R4                      ; 554B   0260
        MVI@    R5,     R0                      ; 554C   02A8
        MVO@    R0,     R4                      ; 554D   0260
        MVI@    R5,     R0                      ; 554E   02A8
        MVO@    R0,     R4                      ; 554F   0260
        MVI@    R5,     R0                      ; 5550   02A8
        MVO@    R0,     R4                      ; 5551   0260
        MVI@    R5,     R0                      ; 5552   02A8
        MVO@    R0,     R4                      ; 5553   0260
        MVI@    R5,     R0                      ; 5554   02A8
        MVO@    R0,     R4                      ; 5555   0260
        MVI@    R5,     R0                      ; 5556   02A8
        MVO@    R0,     R4                      ; 5557   0260

        JSR     R5,     L_563A                  ; 5558   0004 0154 023A

        MVI     G_0166, R1                      ; 555B   0281 0166
        ANDI    #$0001, R1                      ; 555D   03B9 0001
        BEQ     L_5563                          ; 555F   0204 0002

        MVII    #$0006, R1                      ; 5561   02B9 0006
L_5563:
        MVII    #$0331, R3                      ; 5563   02BB 0331
        ADDR    R1,     R3                      ; 5565   00CB
        SDBD                                    ; 5566   0001
        MVII    #$3940, R4                      ; 5567   02BC 0040 0039
        SLL     R1,     2                       ; 556A   004D
        SLL     R1,     2                       ; 556B   004D
        ADDR    R1,     R4                      ; 556C   00CC
        MVII    #$0006, R2                      ; 556D   02BA 0006
L_556F:
        MVI@    R3,     R5                      ; 556F   029D
        TSTR    R5                              ; 5570   00AD
        BEQ     L_5599                          ; 5571   0204 0026

        MVI@    R5,     R0                      ; 5573   02A8
        MVO@    R0,     R4                      ; 5574   0260
        MVI@    R5,     R0                      ; 5575   02A8
        MVO@    R0,     R4                      ; 5576   0260
        MVI@    R5,     R0                      ; 5577   02A8
        MVO@    R0,     R4                      ; 5578   0260
        MVI@    R5,     R0                      ; 5579   02A8
        MVO@    R0,     R4                      ; 557A   0260
        MVI@    R5,     R0                      ; 557B   02A8
        MVO@    R0,     R4                      ; 557C   0260
        MVI@    R5,     R0                      ; 557D   02A8
        MVO@    R0,     R4                      ; 557E   0260
        MVI@    R5,     R0                      ; 557F   02A8
        MVO@    R0,     R4                      ; 5580   0260
        MVI@    R5,     R0                      ; 5581   02A8
        MVO@    R0,     R4                      ; 5582   0260
        MVI@    R5,     R0                      ; 5583   02A8
        MVO@    R0,     R4                      ; 5584   0260
        MVI@    R5,     R0                      ; 5585   02A8
        MVO@    R0,     R4                      ; 5586   0260
        MVI@    R5,     R0                      ; 5587   02A8
        MVO@    R0,     R4                      ; 5588   0260
        MVI@    R5,     R0                      ; 5589   02A8
        MVO@    R0,     R4                      ; 558A   0260
        MVI@    R5,     R0                      ; 558B   02A8
        MVO@    R0,     R4                      ; 558C   0260
        MVI@    R5,     R0                      ; 558D   02A8
        MVO@    R0,     R4                      ; 558E   0260
        MVI@    R5,     R0                      ; 558F   02A8
        MVO@    R0,     R4                      ; 5590   0260
        MVI@    R5,     R0                      ; 5591   02A8
        MVO@    R0,     R4                      ; 5592   0260
L_5593:
        INCR    R3                              ; 5593   000B
        DECR    R2                              ; 5594   0012
        BNEQ    L_556F                          ; 5595   022C 0027
        B       L_559D                          ; 5597   0200 0004

L_5599:
        ADDI    #$0010, R4                      ; 5599   02FC 0010
        B       L_5593                          ; 559B   0220 0009

L_559D:
        MVI     G_0168, R0                      ; 559D   0280 0168
        CMPI    #$0007, R0                      ; 559F   0378 0007
        BNEQ    L_55A9                          ; 55A1   020C 0006

        JSR     R5,     L_6920                  ; 55A3   0004 0168 0120
        JSR     R5,     L_68AD                  ; 55A6   0004 0168 00AD

L_55A9:
        INCR    R7                              ; 55A9   000F

        PSHR    R5                              ; 55AA   0275
L_55AB:
        MVI     .PSG0.rgt_hand,R2               ; 55AB   0282 01FE
        AND     .PSG0.lft_hand,R2               ; 55AD   0382 01FF
        MVII    #$0162, R1                      ; 55AF   02B9 0162

        JSR     R5,     L_55DE                  ; 55B1   0004 0154 01DE
        JSR     R5,     X_PLAY_NOTE             ; 55B4   0004 0118 02BD
        JSR     R5,     L_6EE0                  ; 55B7   0004 016C 02E0

        PULR    R7                              ; 55BA   02B7

L_55BB:
        PSHR    R5                              ; 55BB   0275
        PSHR    R2                              ; 55BC   0272
        MVI     .ISRVEC.0,R1                    ; 55BD   0281 0100
        MVI     .ISRVEC.1,R2                    ; 55BF   0282 0101
        MOVR    R7,     R0                      ; 55C1   00B8
        SDBD                                    ; 55C2   0001
        ADDI    #$000A, R0                      ; 55C3   02F8 000A 0000
        MVO     R0,     .ISRVEC.0               ; 55C6   0240 0100
        SWAP    R0,     1                       ; 55C8   0040
        MVO     R0,     .ISRVEC.1               ; 55C9   0240 0101
L_55CB:
        DECR    R7                              ; 55CB   0017

        SUBI    #$0008, R6                      ; 55CC   033E 0008
        MVO     R1,     .ISRVEC.0               ; 55CE   0241 0100
        MVO     R2,     .ISRVEC.1               ; 55D0   0242 0101
        PULR    R2                              ; 55D2   02B2
L_55D3:
        PULR    R7                              ; 55D3   02B7

L_55D4:
        MVO@    R2,     R1                      ; 55D4   024A
        INCR    R1                              ; 55D5   0009
        MVII    #$0002, R0                      ; 55D6   02B8 0002
        MVO@    R0,     R1                      ; 55D8   0248
        MVII    #$00FF, R0                      ; 55D9   02B8 00FF
        MVO     R0,     G_0160                  ; 55DB   0240 0160
        PULR    R7                              ; 55DD   02B7

L_55DE:
        PSHR    R5                              ; 55DE   0275
        ADDI    #$0002, R1                      ; 55DF   02F9 0002
        CMP@    R1,     R2                      ; 55E1   034A
        BNEQ    L_55D4                          ; 55E2   022C 000F

        INCR    R1                              ; 55E4   0009
        MVI@    R1,     R0                      ; 55E5   0288
        DECR    R0                              ; 55E6   0010
        BMI     L_55D3                          ; 55E7   022B 0015

        MVO@    R0,     R1                      ; 55E9   0248
        BNEQ    L_55D3                          ; 55EA   022C 0018

        MOVR    R2,     R3                      ; 55EC   0093
        SLR     R3,     1                       ; 55ED   0063
        SLR     R3,     2                       ; 55EE   0067
        SLR     R3,     2                       ; 55EF   0067
        SDBD                                    ; 55F0   0001
        ADDI    #$5676, R3                      ; 55F1   02FB 0076 0056
        MVI@    R3,     R0                      ; 55F4   0298
        DECR    R0                              ; 55F5   0010
        BMI     L_55D3                          ; 55F6   022B 0024

        CMPI    #$0004, R0                      ; 55F8   0378 0004
        BLT     L_5614                          ; 55FA   0205 0018

        SUBI    #$0002, R1                      ; 55FC   0339 0002
        MOVR    R0,     R3                      ; 55FE   0083
        SUBI    #$0003, R3                      ; 55FF   033B 0003
        MVO@    R3,     R1                      ; 5601   024B
        DECR    R1                              ; 5602   0011
        ANDI    #$001F, R2                      ; 5603   03BA 001F
        SDBD                                    ; 5605   0001
        ADDI    #$5648, R2                      ; 5606   02FA 0048 0056
        MVI@    R2,     R0                      ; 5609   0290
        DECR    R0                              ; 560A   0010
        BPL     L_5638                          ; 560B   0203 002B

L_560D:
        MVI@    R1,     R0                      ; 560D   0288
        ANDI    #$00BF, R0                      ; 560E   03B8 00BF
        XORI    #$0040, R0                      ; 5610   03F8 0040
        MVO@    R0,     R1                      ; 5612   0248
        PULR    R7                              ; 5613   02B7

L_5614:
        CLRR    R5                              ; 5614   01ED
        DECLE   $0339,  $0002,  $024D,  $0011   ; 5615   0339 0002 024D 0011
        DECLE   $0080,  $0224,  $0018,  $0093   ; 5619   0080 0224 0018 0093
        DECLE   $03BB,  $0010,  $0224,  $0013   ; 561D   03BB 0010 0224 0013
        DECLE   $03BA,  $000F,  $0001           ; 5621   03BA 000F 0001

        ADDI    #$0067, R2                      ; 5624   02FA 0067
        RLC     R2,     2                       ; 5626   0056
        MVI@    R2,     R3                      ; 5627   0293
        DECR    R3                              ; 5628   0013
        BMI     L_560D                          ; 5629   022B 001D

        ADDR    R3,     R0                      ; 562B   00D8
        CMPI    #$000B, R0                      ; 562C   0378 000B
        BNEQ    L_5631                          ; 562E   020C 0001

        CLRR    R0                              ; 5630   01C0
L_5631:
        CMPI    #$000C, R0                      ; 5631   0378 000C
        BNEQ    L_5636                          ; 5633   020C 0001

        DECR    R0                              ; 5635   0010
L_5636:
        XORI    #$0080, R0                      ; 5636   03F8 0080
L_5638:
        MVO@    R0,     R1                      ; 5638   0248
        PULR    R7                              ; 5639   02B7

L_563A:
        MVI     G_01D4, R0                      ; 563A   0280 01D4
        DECR    R0                              ; 563C   0010
        BMI     L_5645                          ; 563D   020B 0006

        MVO     R0,     G_01D4                  ; 563F   0240 01D4
        ANDI    #$0001, R0                      ; 5641   03B8 0001
        BNEQ    L_5647                          ; 5643   020C 0002

L_5645:
        MVO     R4,     .STIC.VIDEN             ; 5645   0244 0020
L_5647:
        MOVR    R5,     R7                      ; 5647   00AF

        DECLE   $0000,  $0000,  $0000,  $0007   ; 5648   0000 0000 0000 0007
        DECLE   $0000,  $0000,  $000B,  $0008   ; 564C   0000 0000 000B 0008
        DECLE   $0000,  $0003,  $0000,  $0004   ; 5650   0000 0003 0000 0004

        INCR    R7                              ; 5654   000F

        DECR    R0                              ; 5655   0010
L_5656:
        INCR    R4                              ; 5656   000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5657   0000 0000 0000 0000
        DECLE   $0006,  $0000,  $0000,  $000A   ; 565B   0006 0000 0000 000A
        DECLE   $0009,  $0000,  $0002,  $0000   ; 565F   0009 0000 0002 0000
        DECLE   $0005,  $000E,  $0001,  $000D   ; 5663   0005 000E 0001 000D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5667   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000A   ; 566B   0000 0000 0000 000A
        DECLE   $0000,  $0000,  $0000,  $0007   ; 566F   0000 0000 0000 0007
        DECLE   $0000,  $0004,  $0001,  $0000   ; 5673   0000 0004 0001 0000
        DECLE   $0007,  $0005,  $0002,  $0006   ; 5677   0007 0005 0002 0006
        DECLE   $0003,  $0004,  $0001           ; 567B   0003 0004 0001
L_567E:
        EIS                                     ; 567E   0002
        MVI     G_0102, R0                      ; 567F   0280 0102
        DECR    R0                              ; 5681   0010
        BPL     L_567E                          ; 5682   0223 0005

        MVI     G_0168, R1                      ; 5684   0281 0168
        INCR    R1                              ; 5686   0009
        ADDR    R7,     R1                      ; 5687   00F9
        ADD@    R1,     R7                      ; 5688   02CF

        DECLE   $0020,  $002B,  $0035,  $003A   ; 5689   0020 002B 0035 003A
        DECLE   $003F                           ; 568D   003F

        SWAP    R0,     2                       ; 568E   0044
        INCR    R7                              ; 568F   000F
        INCR    R7                              ; 5690   000F

L_5691:
        SLL     R1,     1                       ; 5691   0049
L_5692:
        SLLC    R3,     2                       ; 5692   005F
        SLR     R3,     2                       ; 5693   0067
        SAR     R3,     2                       ; 5694   006F
        SAR     R3,     2                       ; 5695   006F
        RLC     R3,     1                       ; 5696   0053
        SLL     R2,     2                       ; 5697   004E

L_5698:
        JSR     R5,     L_5196                  ; 5698   0004 0150 0196
        JSR     R5,     .EXEC.AAD               ; 569B   0004 0118 02AD
        JSR     R5,     L_5153                  ; 569E   0004 0150 0153
        JSR     R5,     L_66D6                  ; 56A1   0004 0164 02D6
        JSR     R5,     L_5B93                  ; 56A4   0004 0158 0393

        B       L_567E                          ; 56A7   0220 002A

        MVI     G_0169, R1                      ; 56A9   0281 0169
        DECR    R1                              ; 56AB   0011
        BEQ     L_56B2                          ; 56AC   0204 0004

        MVO     R1,     G_0169                  ; 56AE   0241 0169
        B       L_5698                          ; 56B0   0220 0019
L_56B2:
        MVI     G_033D, R7                      ; 56B2   0287 033D

        MVII    #$023C, R3                      ; 56B4   02BB 023C

        JSR     R5,     L_5BAF                  ; 56B6   0004 0158 03AF

        TSTR    R0                              ; 56B9   0080
        BNEQ    L_5698                          ; 56BA   022C 0023
        B       L_5705                          ; 56BC   0200 0047

        JSR     R5,     L_5BE6                  ; 56BE   0004 0158 03E6

        B       L_5698                          ; 56C1   0220 002A

        JSR     R5,     L_5C29                  ; 56C3   0004 015C 0029

        B       L_5698                          ; 56C6   0220 002F

        JSR     R5,     L_5C8A                  ; 56C8   0004 015C 008A

        B       L_5698                          ; 56CB   0220 0034

        JSR     R5,     L_5CCE                  ; 56CD   0004 015C 00CE

        B       L_5698                          ; 56D0   0220 0039

        JSR     R5,     L_5CE1                  ; 56D2   0004 015C 00E1

        B       L_5698                          ; 56D5   0220 003E

        JSR     R5,     L_5CF4                  ; 56D7   0004 015C 00F4

        B       L_5698                          ; 56DA   0220 0043

        MVI     G_016D, R1                      ; 56DC   0281 016D
        DECR    R1                              ; 56DE   0011
        BEQ     L_56B2                          ; 56DF   0224 002E

        MVO     R1,     G_016D                  ; 56E1   0241 016D

        JSR     R5,     L_5C8A                  ; 56E3   0004 015C 008A

        B       L_5698                          ; 56E6   0220 004F

        JSR     R5,     L_5C8A                  ; 56E8   0004 015C 008A
        JSR     R5,     L_5C29                  ; 56EB   0004 015C 0029

        B       L_5698                          ; 56EE   0220 0057

        JSR     R5,     L_5C8A                  ; 56F0   0004 015C 008A
        JSR     R5,     L_5BE6                  ; 56F3   0004 0158 03E6

        B       L_5698                          ; 56F6   0220 005F

        JSR     R5,     L_5C8A                  ; 56F8   0004 015C 008A

        MVII    #$0214, R3                      ; 56FB   02BB 0214

        JSR     R5,     L_5BAF                  ; 56FD   0004 0158 03AF

        TSTR    R0                              ; 5700   0080
        BNEQ    L_5698                          ; 5701   022C 006A
        B       L_5705                          ; 5703   0200 0000
L_5705:
        MVI     G_033D, R7                      ; 5705   0287 033D

L_5707:
        MVII    #$0001, R0                      ; 5707   02B8 0001
        MVO     R0,     G_016A                  ; 5709   0240 016A
        MVII    #$0003, R0                      ; 570B   02B8 0003
        MVO     R0,     G_016B                  ; 570D   0240 016B

        JSR     R5,     L_6EBD                  ; 570F   0004 016C 02BD

        MVII    #$0177, R4                      ; 5712   02BC 0177
        MVII    #$0004, R0                      ; 5714   02B8 0004

        JSR     R5,     X_FILL_ZERO             ; 5716   0004 0114 0338
        JSR     R5,     L_5A56                  ; 5719   0004 0158 0256

        CLRR    R0                              ; 571C   01C0
        MVO     R0,     G_01D8                  ; 571D   0240 01D8
        MVO     R0,     G_0168                  ; 571F   0240 0168

        JSR     R5,     L_63FB                  ; 5721   0004 0160 03FB

        MVII    #$0032, R0                      ; 5724   02B8 0032
        MVO     R0,     G_0169                  ; 5726   0240 0169
        MOVR    R7,     R3                      ; 5728   00BB
        ADDI    #$0005, R3                      ; 5729   02FB 0005
        CLRR    R0                              ; 572B   01C0
        B       L_57DF                          ; 572C   0200 00B1

        JSR     R5,     L_60E1                  ; 572E   0004 0160 00E1

        MVII    #$008C, R0                      ; 5731   02B8 008C
        MVO     R0,     G_0169                  ; 5733   0240 0169
        MOVR    R7,     R3                      ; 5735   00BB
        ADDI    #$0005, R3                      ; 5736   02FB 0005
        CLRR    R0                              ; 5738   01C0
        B       L_57DF                          ; 5739   0200 00A4

        MVII    #$0001, R0                      ; 573B   02B8 0001
        MVO     R0,     G_0168                  ; 573D   0240 0168

        JSR     R5,     L_63FB                  ; 573F   0004 0160 03FB

        MVII    #$003C, R0                      ; 5742   02B8 003C
        MVO     R0,     G_0169                  ; 5744   0240 0169
        MOVR    R7,     R3                      ; 5746   00BB
        ADDI    #$0005, R3                      ; 5747   02FB 0005
        CLRR    R0                              ; 5749   01C0
        B       L_57DF                          ; 574A   0200 0093

        JSR     R5,     L_6674                  ; 574C   0004 0164 0274
        JSR     R5,     L_5A77                  ; 574F   0004 0158 0277

        MVII    #$0064, R0                      ; 5752   02B8 0064
        MVO     R0,     G_0159                  ; 5754   0240 0159
        MOVR    R7,     R3                      ; 5756   00BB
        ADDI    #$0006, R3                      ; 5757   02FB 0006
        MVII    #$0001, R0                      ; 5759   02B8 0001
        B       L_57DF                          ; 575B   0200 0082

        JSR     R5,     L_6602                  ; 575D   0004 0164 0202
        JSR     R5,     L_5AAB                  ; 5760   0004 0158 02AB

        CLRR    R0                              ; 5763   01C0
        MVO     R0,     G_016D                  ; 5764   0240 016D
        MVII    #$0010, R0                      ; 5766   02B8 0010
        MVO     R0,     G_0181                  ; 5768   0240 0181
        MOVR    R7,     R3                      ; 576A   00BB
        ADDI    #$0006, R3                      ; 576B   02FB 0006
        MVII    #$0002, R0                      ; 576D   02B8 0002
        B       L_57DF                          ; 576F   0200 006E

        JSR     R5,     L_65E3                  ; 5771   0004 0164 01E3
        JSR     R5,     L_5ACA                  ; 5774   0004 0158 02CA

        CLRR    R0                              ; 5777   01C0
        MVO     R0,     G_016D                  ; 5778   0240 016D
        MOVR    R7,     R3                      ; 577A   00BB
        ADDI    #$0006, R3                      ; 577B   02FB 0006
        MVII    #$0003, R0                      ; 577D   02B8 0003
        B       L_57DF                          ; 577F   0200 005E

        JSR     R5,     L_65D1                  ; 5781   0004 0164 01D1

        MVII    #$016E, R5                      ; 5784   02BD 016E
        MVII    #$012C, R3                      ; 5786   02BB 012C
        MVO@    R3,     R5                      ; 5788   026B
        SWAP    R3,     1                       ; 5789   0043
        MVO@    R3,     R5                      ; 578A   026B
        MVII    #$012C, R3                      ; 578B   02BB 012C
        MVO@    R3,     R5                      ; 578D   026B
        SWAP    R3,     1                       ; 578E   0043
        MVO@    R3,     R5                      ; 578F   026B
        MVII    #$012C, R3                      ; 5790   02BB 012C
        MVO@    R3,     R5                      ; 5792   026B
        SWAP    R3,     1                       ; 5793   0043
        MVO@    R3,     R5                      ; 5794   026B

        JSR     R5,     L_6A0F                  ; 5795   0004 0168 020F
        JSR     R5,     L_55BB                  ; 5798   0004 0154 01BB
        JSR     R5,     L_68AD                  ; 579B   0004 0168 00AD

        MVO     R0,     .STIC.VIDEN             ; 579E   0240 0020

        JSR     R5,     L_6496                  ; 57A0   0004 0164 0096
        JSR     R5,     L_64D2                  ; 57A3   0004 0164 00D2

        CLRR    R0                              ; 57A6   01C0
        MVO     R0,     G_01D3                  ; 57A7   0240 01D3
        MVII    #$0005, R0                      ; 57A9   02B8 0005
        MVO     R0,     G_01D2                  ; 57AB   0240 01D2

        JSR     R5,     L_5AFD                  ; 57AD   0004 0158 02FD

        MVII    #$0007, R0                      ; 57B0   02B8 0007
        MVO     R0,     G_0182                  ; 57B2   0240 0182
        MVII    #$0007, R0                      ; 57B4   02B8 0007
        MVO     R0,     G_0169                  ; 57B6   0240 0169
        MOVR    R7,     R3                      ; 57B8   00BB
        ADDI    #$0006, R3                      ; 57B9   02FB 0006
        MVII    #$0004, R0                      ; 57BB   02B8 0004
        B       L_57DF                          ; 57BD   0200 0020

        JSR     R5,     L_63FB                  ; 57BF   0004 0160 03FB
        JSR     R5,     L_5B0A                  ; 57C2   0004 0158 030A

        MVII    #$0032, R0                      ; 57C5   02B8 0032
        MVO     R0,     G_0169                  ; 57C7   0240 0169
        CLRR    R0                              ; 57C9   01C0
        MVO     R0,     G_016D                  ; 57CA   0240 016D
        MOVR    R7,     R3                      ; 57CC   00BB
        ADDI    #$0006, R3                      ; 57CD   02FB 0006
        MVII    #$0005, R0                      ; 57CF   02B8 0005
        B       L_57DF                          ; 57D1   0200 000C

        JSR     R5,     X_STOP_SFX              ; 57D3   0004 011C 02B4
        JSR     R5,     L_5FD0                  ; 57D6   0004 015C 03D0
        JSR     R5,     L_6DBB                  ; 57D9   0004 016C 01BB

        J       L_50A4                          ; 57DC   0004 0350 00A4

L_57DF:
        MVO     R3,     G_033D                  ; 57DF   0243 033D
        MVO     R0,     G_0168                  ; 57E1   0240 0168
        B       L_5698                          ; 57E3   0220 014C

L_57E5:
        JSR     R5,     L_63FB                  ; 57E5   0004 0160 03FB

        MVII    #$000E, R0                      ; 57E8   02B8 000E
        MVO     R0,     G_0168                  ; 57EA   0240 0168

        JSR     R5,     L_5B0A                  ; 57EC   0004 0158 030A
        JSR     R5,     L_6A0F                  ; 57EF   0004 0168 020F

        CLRR    R0                              ; 57F2   01C0
        MVO     R0,     G_016D                  ; 57F3   0240 016D
        MVO     R0,     G_01D3                  ; 57F5   0240 01D3
        INCR    R0                              ; 57F7   0008
        MVO     R0,     G_01D2                  ; 57F8   0240 01D2
        MVO     R0,     G_0169                  ; 57FA   0240 0169
        MOVR    R7,     R0                      ; 57FC   00B8
        ADDI    #$0009, R0                      ; 57FD   02F8 0009
        MVO     R0,     G_033D                  ; 57FF   0240 033D

        JSR     R5,     L_6EA7                  ; 5801   0004 016C 02A7

        B       L_5698                          ; 5804   0220 016D

        CLRR    R0                              ; 5806   01C0
        MVO     R0,     G_01D2                  ; 5807   0240 01D2
        MVO     R0,     G_0168                  ; 5809   0240 0168

        JSR     R5,     L_63FB                  ; 580B   0004 0160 03FB
        JSR     R5,     L_6451                  ; 580E   0004 0164 0051
        JSR     R5,     L_64D2                  ; 5811   0004 0164 00D2
        JSR     R5,     L_6496                  ; 5814   0004 0164 0096
        JSR     R5,     L_D000                  ; 5817   0004 01D0 0000
        JSR     R5,     X_STOP_SFX              ; 581A   0004 011C 02B4

        MVII    #$0046, R0                      ; 581D   02B8 0046
        MVO     R0,     G_0169                  ; 581F   0240 0169
        MOVR    R7,     R3                      ; 5821   00BB
        ADDI    #$00BC, R3                      ; 5822   02FB 00BC
        MVO     R3,     G_033D                  ; 5824   0243 033D
        B       L_5698                          ; 5826   0220 018F

L_5828:
        JSR     R5,     L_63FB                  ; 5828   0004 0160 03FB
        JSR     R5,     L_5B0A                  ; 582B   0004 0158 030A
        JSR     R5,     L_6A0F                  ; 582E   0004 0168 020F

        CLRR    R0                              ; 5831   01C0
        MVO     R0,     G_016D                  ; 5832   0240 016D
        MVO     R0,     G_01D3                  ; 5834   0240 01D3
        MVII    #$0001, R0                      ; 5836   02B8 0001
        MVO     R0,     G_01D2                  ; 5838   0240 01D2
        SDBD                                    ; 583A   0001
        MVII    #$960A, R0                      ; 583B   02B8 000A 0096
        MVO     R0,     G_0331                  ; 583E   0240 0331
        MVII    #$0007, R0                      ; 5840   02B8 0007
        MVO     R0,     G_0169                  ; 5842   0240 0169
        MOVR    R7,     R0                      ; 5844   00B8
        ADDI    #$0006, R0                      ; 5845   02F8 0006
        MVO     R0,     G_033D                  ; 5847   0240 033D
        B       L_5698                          ; 5849   0220 01B2

        JSR     R5,     L_55BB                  ; 584B   0004 0154 01BB
        JSR     R5,     L_5A56                  ; 584E   0004 0158 0256

        MVO     R0,     .STIC.VIDEN             ; 5851   0240 0020
        MVII    #$000D, R0                      ; 5853   02B8 000D
        MVO     R0,     G_0168                  ; 5855   0240 0168
        MVII    #$0028, R0                      ; 5857   02B8 0028
        MVO     R0,     G_016D                  ; 5859   0240 016D
        MVII    #$0001, R0                      ; 585B   02B8 0001
        MVO     R0,     G_0182                  ; 585D   0240 0182
        MVII    #$00C8, R0                      ; 585F   02B8 00C8
        MVO     R0,     G_0169                  ; 5861   0240 0169
        SDBD                                    ; 5863   0001
        MVII    #$972A, R0                      ; 5864   02B8 002A 0097
        MVO     R0,     G_0339                  ; 5867   0240 0339

        JSR     R5,     L_65E3                  ; 5869   0004 0164 01E3
        JSR     R5,     L_5ACA                  ; 586C   0004 0158 02CA
        JSR     R5,     L_65D1                  ; 586F   0004 0164 01D1
        JSR     R5,     L_5AFD                  ; 5872   0004 0158 02FD
        JSR     R5,     L_6674                  ; 5875   0004 0164 0274

        MOVR    R7,     R0                      ; 5878   00B8
        ADDI    #$0006, R0                      ; 5879   02F8 0006
        MVO     R0,     G_033D                  ; 587B   0240 033D
        B       L_5698                          ; 587D   0220 01E6

        MVII    #$0009, R0                      ; 587F   02B8 0009
        MVO     R0,     G_0168                  ; 5881   0240 0168
        CLRR    R0                              ; 5883   01C0
        MVO     R0,     G_016D                  ; 5884   0240 016D
        CLRR    R0                              ; 5886   01C0
        MVO     R0,     G_01D2                  ; 5887   0240 01D2

        JSR     R5,     L_6451                  ; 5889   0004 0164 0051

        MOVR    R7,     R0                      ; 588C   00B8
        ADDI    #$0006, R0                      ; 588D   02F8 0006
        MVO     R0,     G_033D                  ; 588F   0240 033D
        B       L_5698                          ; 5891   0220 01FA

        MVII    #$000A, R0                      ; 5893   02B8 000A
        MVO     R0,     G_0168                  ; 5895   0240 0168
        CLRR    R0                              ; 5897   01C0
        MVO     R0,     G_016D                  ; 5898   0240 016D
        MVII    #$0010, R0                      ; 589A   02B8 0010
        MVO     R0,     G_0181                  ; 589C   0240 0181

        JSR     R5,     L_6602                  ; 589E   0004 0164 0202
        JSR     R5,     L_5AAB                  ; 58A1   0004 0158 02AB
        JSR     R5,     L_6EBD                  ; 58A4   0004 016C 02BD

        MOVR    R7,     R0                      ; 58A7   00B8
        ADDI    #$0006, R0                      ; 58A8   02F8 0006
        MVO     R0,     G_033D                  ; 58AA   0240 033D
        B       L_5698                          ; 58AC   0220 0215

        MVII    #$000B, R0                      ; 58AE   02B8 000B
        MVO     R0,     G_0168                  ; 58B0   0240 0168

        JSR     R5,     L_6650                  ; 58B2   0004 0164 0250

        MVII    #$000A, R0                      ; 58B5   02B8 000A
        MVO     R0,     G_0169                  ; 58B7   0240 0169

        JSR     R5,     L_5A77                  ; 58B9   0004 0158 0277

        MVII    #$0078, R0                      ; 58BC   02B8 0078
        MVO     R0,     G_0159                  ; 58BE   0240 0159
        MOVR    R7,     R0                      ; 58C0   00B8
        ADDI    #$0006, R0                      ; 58C1   02F8 0006
        MVO     R0,     G_033D                  ; 58C3   0240 033D
        B       L_5698                          ; 58C5   0220 022E

        CLRR    R0                              ; 58C7   01C0
        MVO     R0,     G_0168                  ; 58C8   0240 0168

        JSR     R5,     L_63FB                  ; 58CA   0004 0160 03FB
        JSR     R5,     L_D000                  ; 58CD   0004 01D0 0000
        JSR     R5,     X_STOP_SFX              ; 58D0   0004 011C 02B4

        MVII    #$0046, R0                      ; 58D3   02B8 0046
        MVO     R0,     G_0169                  ; 58D5   0240 0169
        MOVR    R7,     R3                      ; 58D7   00BB
        ADDI    #$0006, R3                      ; 58D8   02FB 0006
        MVO     R3,     G_033D                  ; 58DA   0243 033D
        B       L_5698                          ; 58DC   0220 0245

        CLRR    R0                              ; 58DE   01C0

        JSR     R5,     L_6A87                  ; 58DF   0004 0168 0287

        CLRR    R0                              ; 58E2   01C0

        JSR     R5,     L_6AC6                  ; 58E3   0004 0168 02C6

        CLRR    R0                              ; 58E6   01C0

        JSR     R5,     L_6AE7                  ; 58E7   0004 0168 02E7

        MVII    #$0046, R0                      ; 58EA   02B8 0046
        MVO     R0,     G_0169                  ; 58EC   0240 0169
        MOVR    R7,     R3                      ; 58EE   00BB
        ADDI    #$0006, R3                      ; 58EF   02FB 0006
        MVO     R3,     G_033D                  ; 58F1   0243 033D
        B       L_5698                          ; 58F3   0220 025C

        MOVR    R6,     R0                      ; 58F5   00B0

        JSR     R5,     L_6A87                  ; 58F6   0004 0168 0287

        MVII    #$0046, R0                      ; 58F9   02B8 0046
        MVO     R0,     G_0169                  ; 58FB   0240 0169
        MOVR    R7,     R3                      ; 58FD   00BB
        ADDI    #$0006, R3                      ; 58FE   02FB 0006
        MVO     R3,     G_033D                  ; 5900   0243 033D
        B       L_5698                          ; 5902   0220 026B

        MOVR    R6,     R0                      ; 5904   00B0

        JSR     R5,     L_6AC6                  ; 5905   0004 0168 02C6

        MVII    #$0046, R0                      ; 5908   02B8 0046
        MVO     R0,     G_0169                  ; 590A   0240 0169
        MOVR    R7,     R3                      ; 590C   00BB
        ADDI    #$0006, R3                      ; 590D   02FB 0006
        MVO     R3,     G_033D                  ; 590F   0243 033D
        B       L_5698                          ; 5911   0220 027A

        MOVR    R6,     R0                      ; 5913   00B0

        JSR     R5,     L_6AE7                  ; 5914   0004 0168 02E7

        MVI     G_01D7, R0                      ; 5917   0280 01D7
        TSTR    R0                              ; 5919   0080
        BNEQ    L_59F0                          ; 591A   020C 00D4

        JSR     R5,     L_6F63                  ; 591C   0004 016C 0363
        DECLE   $0080,  $0204,  $0011           ; 591F   0080 0204 0011

        MVI     G_016B, R0                      ; 5922   0280 016B
        DECR    R0                              ; 5924   0010
        MVO     R0,     G_016B                  ; 5925   0240 016B
        MVII    #$0072, R0                      ; 5927   02B8 0072
        MVO     R0,     G_0169                  ; 5929   0240 0169
        SDBD                                    ; 592B   0001
        MVII    #$570F, R3                      ; 592C   02BB 000F 0057
        MVO     R3,     G_033D                  ; 592F   0243 033D
        B       L_5698                          ; 5931   0220 029A

        DECLE   $0004                           ; 5933   0004

        ANDR    R7,     R4                      ; 5934   01BC
        XORR    R3,     R4                      ; 5935   01DC
        MVO     R0,     G_0358                  ; 5936   0240 0358
        ADD     G_0357, R0                      ; 5938   02C0 0357
        MVO     R0,     G_0357                  ; 593A   0240 0357

        JSR     R5,     L_D025                  ; 593C   0004 01D0 0025

        MVI     G_016A, R0                      ; 593F   0280 016A
        INCR    R0                              ; 5941   0008
        MVO     R0,     G_016A                  ; 5942   0240 016A
        MVI     G_016C, R4                      ; 5944   0284 016C
        INCR    R4                              ; 5946   000C
        CMPI    #$001A, R4                      ; 5947   037C 001A
        BLE     L_594D                          ; 5949   0206 0002

        MVII    #$0012, R4                      ; 594B   02BC 0012
L_594D:
        MVO     R4,     G_016C                  ; 594D   0244 016C
        DECLE   $0004                           ; 594F   0004

        ANDR    R7,     R4                      ; 5950   01BC
        ADDR    R6,     R3                      ; 5951   00F3
        MVII    #$0003, R0                      ; 5952   02B8 0003
        MVO     R0,     G_016B                  ; 5954   0240 016B
        MVII    #$0174, R4                      ; 5956   02BC 0174
        MVII    #$0003, R0                      ; 5958   02B8 0003

        JSR     R5,     X_FILL_ZERO             ; 595A   0004 0114 0338

        MVII    #$007D, R0                      ; 595D   02B8 007D
        MVO     R0,     G_0169                  ; 595F   0240 0169
        MOVR    R7,     R3                      ; 5961   00BB
        ADDI    #$0006, R3                      ; 5962   02FB 0006
        MVO     R3,     G_033D                  ; 5964   0243 033D
        B       L_5698                          ; 5966   0220 02CF

        JSR     R5,     L_63FB                  ; 5968   0004 0160 03FB

        MVII    #$0002, R3                      ; 596B   02BB 0002
        MVII    #$0279, R4                      ; 596D   02BC 0279

        JSR     R5,     X_PRINT_R5              ; 596F   0004 0118 007B
        STRING  "Mission"                       ; 5972  
        DECLE   $0000                           ; 5979   0000

        MVII    #$028D, R4                      ; 597A   02BC 028D

        JSR     R5,     X_PRINT_R5              ; 597C   0004 0118 007B
        STRING  "Complete"                      ; 597F  
        DECLE   $0000                           ; 5987   0000

        MVII    #$00C8, R0                      ; 5988   02B8 00C8
        MVO     R0,     G_0169                  ; 598A   0240 0169
        MOVR    R7,     R3                      ; 598C   00BB
        ADDI    #$0006, R3                      ; 598D   02FB 0006
        MVO     R3,     G_033D                  ; 598F   0243 033D
        B       L_5698                          ; 5991   0220 02FA

        JSR     R5,     L_63FB                  ; 5993   0004 0160 03FB

        MVII    #$0001, R3                      ; 5996   02BB 0001
        MVII    #$0251, R4                      ; 5998   02BC 0251

        JSR     R5,     X_PRINT_R5              ; 599A   0004 0118 007B
        STRING  "Mission"                       ; 599D  
        DECLE   $0000                           ; 59A4   0000

        MVII    #$0265, R4                      ; 59A5   02BC 0265

        JSR     R5,     X_PRINT_R5              ; 59A7   0004 0118 007B
        STRING  "Rating:"                       ; 59AA  
        DECLE   $0000                           ; 59B1   0000

        MVII    #$028D, R4                      ; 59B2   02BC 028D

        JSR     R5,     X_PRINT_R5              ; 59B4   0004 0118 007B
        STRING  "Total"                         ; 59B7  
        DECLE   $0000                           ; 59BC   0000

        MVII    #$02A1, R4                      ; 59BD   02BC 02A1

        JSR     R5,     X_PRINT_R5              ; 59BF   0004 0118 007B
        STRING  "Rating:"                       ; 59C2  
        DECLE   $0000                           ; 59C9   0000

        MVI     G_0357, R1                      ; 59CA   0281 0357
        MVI     G_016A, R2                      ; 59CC   0282 016A
        DECR    R2                              ; 59CE   0012

        JSR     R5,     X_DIV                   ; 59CF   0004 011C 01FB

        MVII    #$0002, R3                      ; 59D2   02BB 0002
        MVII    #$0003, R1                      ; 59D4   02B9 0003
        MVII    #$02B9, R4                      ; 59D6   02BC 02B9

        JSR     R5,     X_PRNUM_RGT             ; 59D8   0004 0118 00C5

        MVI     G_0358, R0                      ; 59DB   0280 0358
        MVII    #$0003, R1                      ; 59DD   02B9 0003
        MVII    #$027D, R4                      ; 59DF   02BC 027D

        JSR     R5,     X_PRNUM_RGT             ; 59E1   0004 0118 00C5

        MVII    #$00C8, R0                      ; 59E4   02B8 00C8
        MVO     R0,     G_0169                  ; 59E6   0240 0169
        SDBD                                    ; 59E8   0001
        MVII    #$570F, R3                      ; 59E9   02BB 000F 0057
        MVO     R3,     G_033D                  ; 59EC   0243 033D
        B       L_5698                          ; 59EE   0220 0357

L_59F0:
        MVII    #$008C, R0                      ; 59F0   02B8 008C
        DECLE   $0240,  $0169,  $0004           ; 59F2   0240 0169 0004

        ANDR    R7,     R4                      ; 59F5   01BC
        XORR    R3,     R4                      ; 59F6   01DC
        ADD     G_0357, R0                      ; 59F7   02C0 0357
        MOVR    R0,     R1                      ; 59F9   0081
        MVI     G_016A, R2                      ; 59FA   0282 016A

        JSR     R5,     X_DIV                   ; 59FC   0004 011C 01FB

        MVO     R0,     G_0357                  ; 59FF   0240 0357
        MOVR    R7,     R3                      ; 5A01   00BB
        ADDI    #$0006, R3                      ; 5A02   02FB 0006
        MVO     R3,     G_033D                  ; 5A04   0243 033D
        B       L_5698                          ; 5A06   0220 036F

        CLRR    R0                              ; 5A08   01C0
        MVO     R0,     G_0168                  ; 5A09   0240 0168

        JSR     R5,     L_63FB                  ; 5A0B   0004 0160 03FB

        MVII    #$000F, R0                      ; 5A0E   02B8 000F
        MVO     R0,     G_0169                  ; 5A10   0240 0169
        MOVR    R7,     R3                      ; 5A12   00BB
        ADDI    #$0006, R3                      ; 5A13   02FB 0006
        MVO     R3,     G_033D                  ; 5A15   0243 033D
        B       L_5698                          ; 5A17   0220 0380

        MVII    #$0002, R3                      ; 5A19   02BB 0002
        MVII    #$0253, R4                      ; 5A1B   02BC 0253

        JSR     R5,     X_PRINT_R5              ; 5A1D   0004 0118 007B
        STRING  "Game"                          ; 5A20   0047 0061 006D 0065
        DECLE   $0000                           ; 5A24   0000

        MVII    #$0267, R4                      ; 5A25   02BC 0267

        JSR     R5,     X_PRINT_R5              ; 5A27   0004 0118 007B
        STRING  "Over"                          ; 5A2A   004F 0076 0065 0072
        DECLE   $0000                           ; 5A2E   0000

        MVII    #$0001, R3                      ; 5A2F   02BB 0001
        MVII    #$028E, R4                      ; 5A31   02BC 028E

        JSR     R5,     X_PRINT_R5              ; 5A33   0004 0118 007B
        STRING  "Rating"                        ; 5A36  
        DECLE   $0000                           ; 5A3C   0000

        MVI     G_0357, R0                      ; 5A3D   0280 0357
        MVII    #$0002, R3                      ; 5A3F   02BB 0002
        MVII    #$0003, R1                      ; 5A41   02B9 0003
        MVII    #$02A3, R4                      ; 5A43   02BC 02A3

        JSR     R5,     X_PRNUM_RGT             ; 5A45   0004 0118 00C5

        MVO     R6,     G_01DB                  ; 5A48   0246 01DB
        MVII    #$000F, R0                      ; 5A4A   02B8 000F
        MVO     R0,     G_0169                  ; 5A4C   0240 0169
        SDBD                                    ; 5A4E   0001
        MVII    #$5A08, R3                      ; 5A4F   02BB 0008 005A
        MVO     R3,     G_033D                  ; 5A52   0243 033D
        B       L_5698                          ; 5A54   0220 03BD

L_5A56:
        PSHR    R5                              ; 5A56   0275

        JSR     R5,     L_D000                  ; 5A57   0004 01D0 0000
        DECLE   $0001,  $02B8,  $000A,  $0096   ; 5A5A   0001 02B8 000A 0096
        DECLE   $0240,  $0331,  $0004           ; 5A5E   0240 0331 0004

        XORR    R2,     R0                      ; 5A61   01D0
        MOVR    R2,     R5                      ; 5A62   0095
        SUB@    R6,     R5                      ; 5A63   0335
        SAR     R2,     1                       ; 5A64   006A
        MOVR    R2,     R6                      ; 5A65   0096
        MOVR    R3,     R2                      ; 5A66   009A
        MOVR    R2,     R6                      ; 5A67   0096
        COMR    R2                              ; 5A68   001A
        MOVR    R2,     R6                      ; 5A69   0096
        ADDR    R1,     R2                      ; 5A6A   00CA
        MOVR    R2,     R6                      ; 5A6B   0096
        ADDR    R7,     R2                      ; 5A6C   00FA
        MOVR    R2,     R6                      ; 5A6D   0096
        SLLC    R2,     1                       ; 5A6E   005A
        MOVR    R2,     R7                      ; 5A6F   0097

        MOVR    R1,     R2                      ; 5A70   008A
        MOVR    R2,     R7                      ; 5A71   0097

        DECLE   $004A,  $0096,  $0000,  $0000   ; 5A72   004A 0096 0000 0000

        PULR    R7                              ; 5A76   02B7

L_5A77:
        PSHR    R5                              ; 5A77   0275
        MVII    #$0319, R4                      ; 5A78   02BC 0319

        JSR     R5,     L_D0AE                  ; 5A7A   0004 01D0 00AE
        DECLE   $0014,  $0002,  $00B5,  $0000   ; 5A7D   0014 0002 00B5 0000

        MOVR    R0,     R6                      ; 5A81   0086
        INCR    R1                              ; 5A82   0009

        JSR     R5,     L_D0AE                  ; 5A83   0004 01D0 00AE
        DECLE   $0014,  $0002,  $00B5,  $0000   ; 5A86   0014 0002 00B5 0000

        TSTR    R2                              ; 5A8A   0092
        INCR    R1                              ; 5A8B   0009
        MVI     G_0168, R0                      ; 5A8C   0280 0168
        CMPI    #$000B, R0                      ; 5A8E   0378 000B
        BNEQ    L_5AAA                          ; 5A90   020C 0018

        MVII    #$0319, R1                      ; 5A92   02B9 0319
L_5A94:
        MVI@    R1,     R0                      ; 5A94   0288
        ADDI    #$0028, R0                      ; 5A95   02F8 0028
        MVO@    R0,     R1                      ; 5A97   0248
        INCR    R1                              ; 5A98   0009
        CMPI    #$031B, R1                      ; 5A99   0379 031B
        BLT     L_5A94                          ; 5A9B   0225 0008

        MVII    #$0321, R1                      ; 5A9D   02B9 0321
L_5A9F:
        MVI@    R1,     R0                      ; 5A9F   0288
        SDBD                                    ; 5AA0   0001
        XORI    #$0400, R0                      ; 5AA1   03F8 0000 0004
        MVO@    R0,     R1                      ; 5AA4   0248
        INCR    R1                              ; 5AA5   0009
        CMPI    #$0323, R1                      ; 5AA6   0379 0323
        BLT     L_5A9F                          ; 5AA8   0225 000A
L_5AAA:
        PULR    R7                              ; 5AAA   02B7

L_5AAB:
        PSHR    R5                              ; 5AAB   0275
        MVII    #$031B, R4                      ; 5AAC   02BC 031B

        JSR     R5,     L_D0AE                  ; 5AAE   0004 01D0 00AE
        DECLE   $0014,  $0006,  $00D1,  $0000   ; 5AB1   0014 0006 00D1 0000

        MOVR    R4,     R0                      ; 5AB5   00A0
        INCR    R1                              ; 5AB6   0009

        JSR     R5,     L_D0AE                  ; 5AB7   0004 01D0 00AE
        DECLE   $0012,  $0006,  $00CB,  $0001   ; 5ABA   0012 0006 00CB 0001
        DECLE   $00B7                           ; 5ABE   00B7

        INCR    R1                              ; 5ABF   0009

        JSR     R5,     L_D0AE                  ; 5AC0   0004 01D0 00AE
        DECLE   $0025,  $0000                   ; 5AC3   0025 0000

        ADDR    R2,     R7                      ; 5AC5   00D7

        DECLE   $0000                           ; 5AC6   0000

        ADDR    R0,     R6                      ; 5AC7   00C6
        INCR    R1                              ; 5AC8   0009
        PULR    R7                              ; 5AC9   02B7

L_5ACA:
        PSHR    R5                              ; 5ACA   0275
        MVII    #$031E, R4                      ; 5ACB   02BC 031E

        JSR     R5,     L_D0AE                  ; 5ACD   0004 01D0 00AE
        DECLE   $002E,  $0004,  $00CA,  $0001   ; 5AD0   002E 0004 00CA 0001

        ADDR    R2,     R6                      ; 5AD4   00D6
        INCR    R1                              ; 5AD5   0009

        JSR     R5,     L_D0AE                  ; 5AD6   0004 01D0 00AE
        DECLE   $002E,  $0006,  $00D0,  $0001   ; 5AD9   002E 0006 00D0 0001

        ADDR    R4,     R0                      ; 5ADD   00E0
        INCR    R1                              ; 5ADE   0009
        MVI     G_0168, R0                      ; 5ADF   0280 0168
        CMPI    #$0009, R0                      ; 5AE1   0378 0009
        BLT     L_5AAA                          ; 5AE3   0225 003A

        MVII    #$0020, R0                      ; 5AE5   02B8 0020
        MVI     G_033A, R1                      ; 5AE7   0281 033A
        MVI     G_033B, R2                      ; 5AE9   0282 033B
        ADDR    R0,     R1                      ; 5AEB   00C1
        ADDR    R0,     R2                      ; 5AEC   00C2
        MVO     R1,     G_033A                  ; 5AED   0241 033A
        MVO     R2,     G_033B                  ; 5AEF   0242 033B
        MVII    #$031E, R1                      ; 5AF1   02B9 031E

        JSR     R5,     L_5F45                  ; 5AF3   0004 015C 0345

        MVI     G_0326, R1                      ; 5AF6   0281 0326
        ADDI    #$0006, R1                      ; 5AF8   02F9 0006
        MVO     R1,     G_0326                  ; 5AFA   0241 0326
        PULR    R7                              ; 5AFC   02B7

L_5AFD:
        PSHR    R5                              ; 5AFD   0275
        MVII    #$0320, R4                      ; 5AFE   02BC 0320

        JSR     R5,     L_D0AE                  ; 5B00   0004 01D0 00AE
        DECLE   $003F                           ; 5B03   003F

        CLRC                                    ; 5B04   0006
        ADDR    R0,     R0                      ; 5B05   00C0
        EIS                                     ; 5B06   0002
        ADDR    R6,     R2                      ; 5B07   00F2
        INCR    R1                              ; 5B08   0009
        PULR    R7                              ; 5B09   02B7

L_5B0A:
        PSHR    R5                              ; 5B0A   0275

        JSR     R5,     L_D000                  ; 5B0B   0004 01D0 0000
        DECLE   $0004                           ; 5B0E   0004

        XORR    R2,     R0                      ; 5B0F   01D0
        MOVR    R2,     R5                      ; 5B10   0095
        SUB@    R6,     R7                      ; 5B11   0337

        DECLE   $00EA,  $0095,  $006A,  $0094   ; 5B12   00EA 0095 006A 0094
        DECLE   $00EA,  $0094,  $006A,  $0095   ; 5B16   00EA 0094 006A 0095
        DECLE   $0000,  $0000                   ; 5B1A   0000 0000

        MVII    #$0319, R4                      ; 5B1C   02BC 0319

        JSR     R5,     L_D0AE                  ; 5B1E   0004 01D0 00AE
        DECLE   $0013,  $0006,  $00D0,  $0001   ; 5B21   0013 0006 00D0 0001

        MOVR    R6,     R2                      ; 5B25   00B2
        INCR    R1                              ; 5B26   0009

        JSR     R5,     L_D0AE                  ; 5B27   0004 01D0 00AE
        DECLE   $0023,  $0002,  $00D0,  $0001   ; 5B2A   0023 0002 00D0 0001

        ADDR    R0,     R2                      ; 5B2E   00C2
        INCR    R1                              ; 5B2F   0009

        JSR     R5,     L_D0AE                  ; 5B30   0004 01D0 00AE
        DECLE   $002B,  $0002,  $00D0,  $0001   ; 5B33   002B 0002 00D0 0001

        ADDR    R2,     R2                      ; 5B37   00D2
        INCR    R1                              ; 5B38   0009

        JSR     R5,     L_D0AE                  ; 5B39   0004 01D0 00AE
        DECLE   $0033,  $0002,  $00D0,  $0005   ; 5B3C   0033 0002 00D0 0005

        ADDR    R0,     R2                      ; 5B40   00C2
        INCR    R1                              ; 5B41   0009

        JSR     R5,     L_D0AE                  ; 5B42   0004 01D0 00AE
        DECLE   $003A,  $0006,  $00D0,  $0005   ; 5B45   003A 0006 00D0 0005

        MOVR    R6,     R2                      ; 5B49   00B2
        INCR    R1                              ; 5B4A   0009

        JSR     R5,     L_D0AE                  ; 5B4B   0004 01D0 00AE

        COMR    R0                              ; 5B4E   0018
        CLRC                                    ; 5B4F   0006
        SWAP    R0,     1                       ; 5B50   0040
        DIS                                     ; 5B51   0003
        MOVR    R4,     R6                      ; 5B52   00A6
        COMR    R1                              ; 5B53   0019

        JSR     R5,     L_D0AE                  ; 5B54   0004 01D0 00AE
        DECLE   $002C,  $0006,  $0058,  $0001   ; 5B57   002C 0006 0058 0001

        MOVR    R4,     R5                      ; 5B5B   00A5
        COMR    R1                              ; 5B5C   0019

        JSR     R5,     L_D0AE                  ; 5B5D   0004 01D0 00AE

        SWAP    R0,     1                       ; 5B60   0040
        EIS                                     ; 5B61   0002
        RLC     R0,     1                       ; 5B62   0050
        EIS                                     ; 5B63   0002
        MOVR    R4,     R3                      ; 5B64   00A3
        INCR    R1                              ; 5B65   0009
        MVI     G_0168, R0                      ; 5B66   0280 0168
        CMPI    #$0008, R0                      ; 5B68   0378 0008
        BGE     L_5B6D                          ; 5B6A   020D 0001
        PULR    R7                              ; 5B6C   02B7

L_5B6D:
        MVII    #$0337, R1                      ; 5B6D   02B9 0337
        MVI@    R1,     R0                      ; 5B6F   0288
        ADDI    #$0018, R0                      ; 5B70   02F8 0018
        MVO@    R0,     R1                      ; 5B72   0248
        INCR    R1                              ; 5B73   0009
L_5B74:
        MVI@    R1,     R0                      ; 5B74   0288
        ADDI    #$0070, R0                      ; 5B75   02F8 0070
        MVO@    R0,     R1                      ; 5B77   0248
        INCR    R1                              ; 5B78   0009
        CMPI    #$033B, R1                      ; 5B79   0379 033B
        BLT     L_5B74                          ; 5B7B   0225 0008

        MVII    #$031E, R1                      ; 5B7D   02B9 031E

L_5B7F:
        JSR     R5,     L_5F45                  ; 5B7F   0004 015C 0345

        INCR    R1                              ; 5B82   0009
        CMPI    #$0320, R1                      ; 5B83   0379 0320
        BLE     L_5B7F                          ; 5B85   0226 0007

        MVII    #$0321, R1                      ; 5B87   02B9 0321
L_5B89:
        MVI@    R1,     R0                      ; 5B89   0288
        SUBI    #$0014, R0                      ; 5B8A   0338 0014
        MVO@    R0,     R1                      ; 5B8C   0248
        INCR    R1                              ; 5B8D   0009
        CMPI    #$0326, R1                      ; 5B8E   0379 0326
        BLT     L_5B89                          ; 5B90   0225 0008
        PULR    R7                              ; 5B92   02B7

L_5B93:
        MVI     G_01DB, R0                      ; 5B93   0280 01DB
        TSTR    R0                              ; 5B95   0080
        BEQ     L_5BA8                          ; 5B96   0204 0010

        MVI     .PSG0.rgt_hand,R0               ; 5B98   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 5B9A   0380 01FF
        CMPI    #$005F, R0                      ; 5B9C   0378 005F
        BEQ     L_5BA9                          ; 5B9E   0204 0009

        CMPI    #$003F, R0                      ; 5BA0   0378 003F
        BEQ     L_5BA9                          ; 5BA2   0204 0005

        CMPI    #$009F, R0                      ; 5BA4   0378 009F
        BEQ     L_5BA9                          ; 5BA6   0204 0001
L_5BA8:
        MOVR    R5,     R7                      ; 5BA8   00AF

L_5BA9:
        JSR     R5,     L_5220                  ; 5BA9   0004 0150 0220

        J       X_RESET                         ; 5BAC   0004 0310 0000

L_5BAF:
        PSHR    R5                              ; 5BAF   0275
        MVI     G_0166, R1                      ; 5BB0   0281 0166
        ANDI    #$0003, R1                      ; 5BB2   03B9 0003
        BNEQ    L_5BE5                          ; 5BB4   020C 002F

        MVI     G_0168, R2                      ; 5BB6   0282 0168
        MVII    #$0319, R1                      ; 5BB8   02B9 0319
        MVI@    R1,     R0                      ; 5BBA   0288
        CMPR    R3,     R0                      ; 5BBB   0158
        BEQ     L_5BE1                          ; 5BBC   0204 0023

        CMPI    #$0001, R2                      ; 5BBE   037A 0001
        BEQ     L_5BC6                          ; 5BC0   0204 0004

        SUBI    #$0002, R0                      ; 5BC2   0338 0002
        B       L_5BC8                          ; 5BC4   0200 0002

L_5BC6:
        ADDI    #$0002, R0                      ; 5BC6   02F8 0002
L_5BC8:
        MVO@    R0,     R1                      ; 5BC8   0248
        DECLE   $0009,  $0379,  $031B,  $0225   ; 5BC9   0009 0379 031B 0225
        DECLE   $0013,  $0004                   ; 5BCD   0013 0004

        XORR    R2,     R0                      ; 5BCF   01D0
        MOVR    R3,     R7                      ; 5BD0   009F

        DECLE   $0335,  $0030,  $006A,  $0096   ; 5BD1   0335 0030 006A 0096
        DECLE   $0240,  $0335,  $0004           ; 5BD5   0240 0335 0004

        XORR    R2,     R0                      ; 5BD8   01D0
        MOVR    R3,     R7                      ; 5BD9   009F

        SUB@    R6,     R6                      ; 5BDA   0336
        GSWD    R0                              ; 5BDB   0030
        MOVR    R3,     R2                      ; 5BDC   009A
        MOVR    R2,     R6                      ; 5BDD   0096
        MVO     R0,     G_0336                  ; 5BDE   0240 0336
        PULR    R7                              ; 5BE0   02B7

L_5BE1:
        CLRR    R0                              ; 5BE1   01C0
        MVO@    R0,     R1                      ; 5BE2   0248
        INCR    R1                              ; 5BE3   0009
        MVO@    R0,     R1                      ; 5BE4   0248
L_5BE5:
        PULR    R7                              ; 5BE5   02B7

L_5BE6:
        PSHR    R5                              ; 5BE6   0275
        MVI     G_0166, R1                      ; 5BE7   0281 0166
        ANDI    #$0007, R1                      ; 5BE9   03B9 0007
        BNEQ    L_5BE5                          ; 5BEB   022C 0007

        MVI     G_0181, R0                      ; 5BED   0280 0181

        JSR     R5,     X_EXT_SIGN_LO           ; 5BEF   0004 0114 0268

        MVI     G_016D, R1                      ; 5BF2   0281 016D
        MOVR    R1,     R3                      ; 5BF4   008B
        INCR    R1                              ; 5BF5   0009
        ADDR    R7,     R1                      ; 5BF6   00F9
        ADD@    R1,     R7                      ; 5BF7   02CF

        INCR    R6                              ; 5BF8   000E
        INCR    R6                              ; 5BF9   000E
        DECR    R5                              ; 5BFA   0015
        COMR    R4                              ; 5BFB   001C
        COMR    R4                              ; 5BFC   001C
        NEGR    R3                              ; 5BFD   0023
        NEGR    R3                              ; 5BFE   0023
        NEGR    R3                              ; 5BFF   0023
        COMR    R4                              ; 5C00   001C
        DECR    R5                              ; 5C01   0015
        INCR    R6                              ; 5C02   000E
        INCR    R6                              ; 5C03   000E
        MVO@    R3,     R4                      ; 5C04   0263
        PULR    R7                              ; 5C05   02B7

        MVII    #$0337, R1                      ; 5C06   02B9 0337

        JSR     R5,     L_5F37                  ; 5C08   0004 015C 0337

        B       L_5C25                          ; 5C0B   0200 0018

        MVII    #$031D, R1                      ; 5C0D   02B9 031D

        JSR     R5,     L_5F45                  ; 5C0F   0004 015C 0345

        B       L_5C25                          ; 5C12   0200 0011

        MVII    #$0339, R1                      ; 5C14   02B9 0339

        JSR     R5,     L_5F40                  ; 5C16   0004 015C 0340

        B       L_5C25                          ; 5C19   0200 000A

        NEGR    R0                              ; 5C1B   0020
        MVO     R0,     G_0181                  ; 5C1C   0240 0181
        MVII    #$0339, R1                      ; 5C1E   02B9 0339

        JSR     R5,     L_5F40                  ; 5C20   0004 015C 0340

        B       L_5C25                          ; 5C23   0200 0000

L_5C25:
        INCR    R3                              ; 5C25   000B
        MVO     R3,     G_016D                  ; 5C26   0243 016D
        PULR    R7                              ; 5C28   02B7

L_5C29:
        PSHR    R5                              ; 5C29   0275
        MVI     G_0166, R1                      ; 5C2A   0281 0166
        ANDI    #$0007, R1                      ; 5C2C   03B9 0007
        BNEQ    L_5BE5                          ; 5C2E   022C 004A

        MVI     G_016D, R1                      ; 5C30   0281 016D
        MOVR    R1,     R3                      ; 5C32   008B
        MVII    #$0003, R4                      ; 5C33   02BC 0003
        MVII    #$0010, R0                      ; 5C35   02B8 0010
        MVI     G_0168, R2                      ; 5C37   0282 0168
        CMPI    #$0009, R2                      ; 5C39   037A 0009
        BNEQ    L_5C4A                          ; 5C3B   020C 000D

        NEGR    R4                              ; 5C3D   0024
        NEGR    R0                              ; 5C3E   0020
        INCR    R1                              ; 5C3F   0009
        ADDR    R7,     R1                      ; 5C40   00F9
        ADD@    R1,     R7                      ; 5C41   02CF

        DECLE   $0021,  $0021,  $002E,  $001A   ; 5C42   0021 0021 002E 001A
        DECLE   $001A,  $0013,  $0219           ; 5C46   001A 0013 0219

        PULR    R7                              ; 5C49   02B7

L_5C4A:
        INCR    R1                              ; 5C4A   0009
        ADDR    R7,     R1                      ; 5C4B   00F9
        ADD@    R1,     R7                      ; 5C4C   02CF

        DECLE   $0008,  $000F,  $000F,  $0036   ; 5C4D   0008 000F 000F 0036

        DECR    R6                              ; 5C51   0016
        DECR    R6                              ; 5C52   0016
        BGT     L_5F0C                          ; 5C53   020E 02B7

        MVII    #$031E, R1                      ; 5C55   02B9 031E

        JSR     R5,     L_5F45                  ; 5C57   0004 015C 0345

        B       L_5C25                          ; 5C5A   0220 0036

        MVII    #$033A, R1                      ; 5C5C   02B9 033A

        JSR     R5,     L_5F40                  ; 5C5E   0004 015C 0340

        B       L_5C25                          ; 5C61   0220 003D

        MVII    #$033B, R1                      ; 5C63   02B9 033B

        JSR     R5,     L_5F40                  ; 5C65   0004 015C 0340

        MVII    #$0326, R1                      ; 5C68   02B9 0326
        MOVR    R4,     R0                      ; 5C6A   00A0

        JSR     R5,     L_5F40                  ; 5C6B   0004 015C 0340

        B       L_5C25                          ; 5C6E   0220 004A

        INCR    R3                              ; 5C70   000B
        MVO     R3,     G_016D                  ; 5C71   0243 016D
        MVI     G_0168, R0                      ; 5C73   0280 0168
        PSHR    R0                              ; 5C75   0270
        CLRR    R0                              ; 5C76   01C0
        MVO     R0,     G_0168                  ; 5C77   0240 0168

        JSR     R5,     L_64D2                  ; 5C79   0004 0164 00D2
        JSR     R5,     L_6496                  ; 5C7C   0004 0164 0096

        PULR    R0                              ; 5C7F   02B0
        MVO     R0,     G_0168                  ; 5C80   0240 0168
        PULR    R7                              ; 5C82   02B7

        INCR    R3                              ; 5C83   000B
        MVO     R3,     G_016D                  ; 5C84   0243 016D

        JSR     R5,     L_6EEE                  ; 5C86   0004 016C 02EE

        PULR    R7                              ; 5C89   02B7

L_5C8A:
        PSHR    R5                              ; 5C8A   0275
        MVI     G_0166, R0                      ; 5C8B   0280 0166
        MVI     G_0182, R2                      ; 5C8D   0282 0182
        ANDR    R2,     R0                      ; 5C8F   0190
        BNEQ    L_5BE5                          ; 5C90   022C 00AC

        JSR     R5,     L_5CB8                  ; 5C92   0004 015C 00B8

        MVI     G_0169, R1                      ; 5C95   0281 0169
        DECR    R1                              ; 5C97   0011
        BEQ     L_5C9D                          ; 5C98   0204 0003

        MVO     R1,     G_0169                  ; 5C9A   0241 0169
        PULR    R7                              ; 5C9C   02B7

L_5C9D:
        MVI     G_0182, R2                      ; 5C9D   0282 0182
        MVI     G_0168, R0                      ; 5C9F   0280 0168
        CMPI    #$0009, R0                      ; 5CA1   0378 0009
        BLT     L_5CAE                          ; 5CA3   0205 0009

        SLL     R2,     1                       ; 5CA5   004A
        XORI    #$0001, R2                      ; 5CA6   03FA 0001
        CMPI    #$000F, R2                      ; 5CA8   037A 000F
        BEQ     L_5E5B                          ; 5CAA   0204 01AF
        B       L_5CB1                          ; 5CAC   0200 0003

L_5CAE:
        SLR     R2,     1                       ; 5CAE   0062
        BEQ     L_5E5B                          ; 5CAF   0204 01AA

L_5CB1:
        MVO     R2,     G_0182                  ; 5CB1   0242 0182
        MVII    #$0014, R0                      ; 5CB3   02B8 0014
        MVO     R0,     G_0169                  ; 5CB5   0240 0169
        PULR    R7                              ; 5CB7   02B7

L_5CB8:
        PSHR    R5                              ; 5CB8   0275
        DECLE   $0004                           ; 5CB9   0004

        XORR    R2,     R0                      ; 5CBA   01D0
        MOVR    R3,     R7                      ; 5CBB   009F

        DECLE   $0331,  $0010,  $0012,  $0096   ; 5CBC   0331 0010 0012 0096
        DECLE   $0338,  $0008,  $0240,  $0331   ; 5CC0   0338 0008 0240 0331
        DECLE   $0004                           ; 5CC4   0004

        XORR    R2,     R0                      ; 5CC5   01D0
        MOVR    R3,     R7                      ; 5CC6   009F

        SUBI    #$0020, R4                      ; 5CC7   033C 0020
        SLL     R2,     1                       ; 5CC9   004A
        MOVR    R2,     R6                      ; 5CCA   0096
        MVO     R0,     G_033C                  ; 5CCB   0240 033C
        PULR    R7                              ; 5CCD   02B7

L_5CCE:
        PSHR    R5                              ; 5CCE   0275
        MVI     G_0166, R0                      ; 5CCF   0280 0166
        ANDI    #$0001, R0                      ; 5CD1   03B8 0001
        BNEQ    L_5BE5                          ; 5CD3   022C 00EF

        MVI     G_016D, R1                      ; 5CD5   0281 016D
        INCR    R1                              ; 5CD7   0009
        ADDR    R7,     R1                      ; 5CD8   00F9
        ADD@    R1,     R7                      ; 5CD9   02CF

        DECLE   $002E,  $003F                   ; 5CDA   002E 003F

        MOVR    R7,     R1                      ; 5CDC   00B9
        ADDR    R6,     R6                      ; 5CDD   00F6
        SUBR    R6,     R3                      ; 5CDE   0133
        CMPR    R6,     R2                      ; 5CDF   0172
        PULR    R7                              ; 5CE0   02B7

L_5CE1:
        PSHR    R5                              ; 5CE1   0275
        MVI     G_0166, R0                      ; 5CE2   0280 0166
        ANDI    #$0001, R0                      ; 5CE4   03B8 0001
        BNEQ    L_5BE5                          ; 5CE6   022C 0102

        MVI     G_016D, R1                      ; 5CE8   0281 016D
        INCR    R1                              ; 5CEA   0009
        ADDR    R7,     R1                      ; 5CEB   00F9
        ADD@    R1,     R7                      ; 5CEC   02CF

        SUBR    R4,     R0                      ; 5CED   0120
        ADDR    R4,     R3                      ; 5CEE   00E3
        MOVR    R4,     R6                      ; 5CEF   00A6
        ADCR    R4                              ; 5CF0   002C
        COMR    R3                              ; 5CF1   001B
        CMPR    R5,     R6                      ; 5CF2   016E
        PULR    R7                              ; 5CF3   02B7

L_5CF4:
        PSHR    R5                              ; 5CF4   0275
        MVI     G_0166, R0                      ; 5CF5   0280 0166
        ANDI    #$0001, R0                      ; 5CF7   03B8 0001
        BNEQ    L_5BE5                          ; 5CF9   022C 0115

        MVI     G_016D, R1                      ; 5CFB   0281 016D
        INCR    R1                              ; 5CFD   0009
        ADDR    R7,     R1                      ; 5CFE   00F9
        ADD@    R1,     R7                      ; 5CFF   02CF

        SUBR    R1,     R5                      ; 5D00   010D
        ADDR    R2,     R0                      ; 5D01   00D0
        MOVR    R2,     R3                      ; 5D02   0093
        COMR    R1                              ; 5D03   0019
        CMPR    R3,     R6                      ; 5D04   015E
        XORR    R6,     R1                      ; 5D05   01F1
        CMPR    R3,     R3                      ; 5D06   015B
        PULR    R7                              ; 5D07   02B7

        JSR     R5,     L_5F1A                  ; 5D08   0004 015C 031A

        MVI     G_0169, R0                      ; 5D0B   0280 0169
        DECR    R0                              ; 5D0D   0010
        BEQ     L_5D13                          ; 5D0E   0204 0003

        MVO     R0,     G_0169                  ; 5D10   0240 0169
        PULR    R7                              ; 5D12   02B7

L_5D13:
        MVI     G_016D, R0                      ; 5D13   0280 016D
        INCR    R0                              ; 5D15   0008
        MVO     R0,     G_016D                  ; 5D16   0240 016D
        PULR    R7                              ; 5D18   02B7

        MVI     G_0168, R0                      ; 5D19   0280 0168
        CMPI    #$000E, R0                      ; 5D1B   0378 000E
        BEQ     L_5D2A                          ; 5D1D   0204 000B

        JSR     R5,     L_5F1A                  ; 5D1F   0004 015C 031A

        MVI     G_0169, R0                      ; 5D22   0280 0169
        DECR    R0                              ; 5D24   0010
        BEQ     L_5D2A                          ; 5D25   0204 0003

        MVO     R0,     G_0169                  ; 5D27   0240 0169
        PULR    R7                              ; 5D29   02B7

L_5D2A:
        MVII    #$0002, R0                      ; 5D2A   02B8 0002
        MVO     R0,     G_0169                  ; 5D2C   0240 0169
        MVII    #$0321, R1                      ; 5D2E   02B9 0321
        MVII    #$0001, R0                      ; 5D30   02B8 0001
        MVI     G_0168, R2                      ; 5D32   0282 0168
        CMPI    #$0005, R2                      ; 5D34   037A 0005
        BEQ     L_5D3C                          ; 5D36   0204 0004

        MVII    #$0050, R3                      ; 5D38   02BB 0050
        B       L_5D3F                          ; 5D3A   0200 0003

L_5D3C:
        NEGR    R0                              ; 5D3C   0020
        MVII    #$003C, R3                      ; 5D3D   02BB 003C
L_5D3F:
        MVI@    R1,     R2                      ; 5D3F   028A
        MOVR    R2,     R4                      ; 5D40   0094
        ANDI    #$007F, R4                      ; 5D41   03BC 007F
        XORR    R4,     R2                      ; 5D43   01E2
        ADDR    R0,     R4                      ; 5D44   00C4
        XORR    R4,     R2                      ; 5D45   01E2
        MVO@    R2,     R1                      ; 5D46   024A
        INCR    R1                              ; 5D47   0009
        CMPI    #$0326, R1                      ; 5D48   0379 0326
        BLT     L_5D3F                          ; 5D4A   0225 000C

        ANDI    #$007F, R2                      ; 5D4C   03BA 007F
        CMPR    R3,     R2                      ; 5D4E   015A
        BEQ     L_5D52                          ; 5D4F   0204 0001
        PULR    R7                              ; 5D51   02B7

L_5D52:
        MVI     G_0168, R0                      ; 5D52   0280 0168
        CMPI    #$000E, R0                      ; 5D54   0378 000E
        BEQ     L_5D66                          ; 5D56   0204 000E

        CMPI    #$0008, R0                      ; 5D58   0378 0008
        BLT     L_5D60                          ; 5D5A   0205 0004

        MVII    #$0014, R0                      ; 5D5C   02B8 0014
        MVO     R0,     G_0169                  ; 5D5E   0240 0169
L_5D60:
        MVI     G_016D, R0                      ; 5D60   0280 016D
        INCR    R0                              ; 5D62   0008
L_5D63:
        MVO     R0,     G_016D                  ; 5D63   0240 016D
        PULR    R7                              ; 5D65   02B7

L_5D66:
        MVII    #$0005, R0                      ; 5D66   02B8 0005
        DECLE   $0240,  $0169,  $0004,  $01D0   ; 5D68   0240 0169 0004 01D0
        DECLE   $0095,  $0338,  $00D2,  $0099   ; 5D6C   0095 0338 00D2 0099
        DECLE   $00F2,  $0099,  $0012,  $009A   ; 5D70   00F2 0099 0012 009A
        DECLE   $0032,  $009A,  $0052,  $009A   ; 5D74   0032 009A 0052 009A
        DECLE   $0000,  $0000                   ; 5D78   0000 0000

        MVI     G_0325, R0                      ; 5D7A   0280 0325
        SDBD                                    ; 5D7C   0001
        XORI    #$0400, R0                      ; 5D7D   03F8 0000 0004
        MVO     R0,     G_0325                  ; 5D80   0240 0325
        SDBD                                    ; 5D82   0001
        MVII    #$09E2, R0                      ; 5D83   02B8 00E2 0009
        MVO     R0,     G_032C                  ; 5D86   0240 032C
        SDBD                                    ; 5D88   0001
        MVII    #$09F2, R0                      ; 5D89   02B8 00F2 0009
        MVO     R0,     G_032D                  ; 5D8C   0240 032D

        JSR     R5,     L_6E4D                  ; 5D8E   0004 016C 024D

        B       L_5D60                          ; 5D91   0220 0032

        MVI     G_0169, R0                      ; 5D93   0280 0169
        DECR    R0                              ; 5D95   0010
        BEQ     L_5D9B                          ; 5D96   0204 0003

        MVO     R0,     G_0169                  ; 5D98   0240 0169
        PULR    R7                              ; 5D9A   02B7

L_5D9B:
        MVII    #$0337, R1                      ; 5D9B   02B9 0337
        MVII    #$0010, R3                      ; 5D9D   02BB 0010
        NOP                                     ; 5D9F   0034
        SDBD                                    ; 5DA0   0001
        MVII    #$95BA, R4                      ; 5DA1   02BC 00BA 0095
        MVII    #$0008, R0                      ; 5DA4   02B8 0008
        MVI     G_0168, R2                      ; 5DA6   0282 0168
        CMPI    #$0008, R2                      ; 5DA8   037A 0008
        BLT     L_5DB0                          ; 5DAA   0205 0004

        NEGR    R0                              ; 5DAC   0020
        NEGR    R3                              ; 5DAD   0023
        SUBI    #$0040, R4                      ; 5DAE   033C 0040

L_5DB0:
        JSR     R5,     L_5F40                  ; 5DB0   0004 015C 0340

        INCR    R1                              ; 5DB3   0009
        MOVR    R3,     R0                      ; 5DB4   0098

        JSR     R5,     L_5F37                  ; 5DB5   0004 015C 0337

        INCR    R1                              ; 5DB8   0009

        JSR     R5,     L_5F40                  ; 5DB9   0004 015C 0340

        CMPR    R2,     R4                      ; 5DBC   0154
        BEQ     L_5DCA                          ; 5DBD   0204 000B

        MVI     G_0168, R0                      ; 5DBF   0280 0168
        CMPI    #$000E, R0                      ; 5DC1   0378 000E
        BEQ     L_5E37                          ; 5DC3   0204 0072

        MVII    #$0005, R0                      ; 5DC5   02B8 0005
        MVO     R0,     G_0169                  ; 5DC7   0240 0169
        PULR    R7                              ; 5DC9   02B7

L_5DCA:
        MVI     G_016D, R0                      ; 5DCA   0280 016D
        INCR    R0                              ; 5DCC   0008
        MVO     R0,     G_016D                  ; 5DCD   0240 016D
        PULR    R7                              ; 5DCF   02B7

        MVI     G_0169, R0                      ; 5DD0   0280 0169
        DECR    R0                              ; 5DD2   0010
        BNEQ    L_5E0A                          ; 5DD3   020C 0035

        MVII    #$031E, R1                      ; 5DD5   02B9 031E

L_5DD7:
        JSR     R5,     L_5F45                  ; 5DD7   0004 015C 0345

        INCR    R1                              ; 5DDA   0009
        CMPI    #$0320, R1                      ; 5DDB   0379 0320
        BLE     L_5DD7                          ; 5DDD   0226 0007

        MVII    #$0338, R1                      ; 5DDF   02B9 0338
        MVII    #$0010, R0                      ; 5DE1   02B8 0010
        MVI     G_0168, R2                      ; 5DE3   0282 0168
        CMPI    #$0008, R2                      ; 5DE5   037A 0008
        BLT     L_5DEA                          ; 5DE7   0205 0001

        NEGR    R0                              ; 5DE9   0020

L_5DEA:
        JSR     R5,     L_5F37                  ; 5DEA   0004 015C 0337

        INCR    R1                              ; 5DED   0009

        JSR     R5,     L_5F40                  ; 5DEE   0004 015C 0340

        MVI     G_016D, R0                      ; 5DF1   0280 016D
        INCR    R0                              ; 5DF3   0008
        MVO     R0,     G_016D                  ; 5DF4   0240 016D
        MVI     G_0168, R0                      ; 5DF6   0280 0168
        CMPI    #$000E, R0                      ; 5DF8   0378 000E
        BEQ     L_5E37                          ; 5DFA   0204 003B

        MVII    #$0005, R0                      ; 5DFC   02B8 0005
        MVO     R0,     G_0169                  ; 5DFE   0240 0169
        MVI     G_0168, R0                      ; 5E00   0280 0168
        CMPI    #$000E, R0                      ; 5E02   0378 000E
        BNEQ    L_5E09                          ; 5E04   020C 0003

        JSR     R5,     X_STOP_SFX              ; 5E06   0004 011C 02B4

L_5E09:
        PULR    R7                              ; 5E09   02B7

L_5E0A:
        MVO     R0,     G_0169                  ; 5E0A   0240 0169
        PULR    R7                              ; 5E0C   02B7

        MVI     G_0169, R0                      ; 5E0D   0280 0169
        DECR    R0                              ; 5E0F   0010
        BNEQ    L_5E0A                          ; 5E10   022C 0007

        SDBD                                    ; 5E12   0001
        MVII    #$95DA, R3                      ; 5E13   02BB 00DA 0095
        MVII    #$0338, R1                      ; 5E16   02B9 0338
        MVII    #$0010, R0                      ; 5E18   02B8 0010
        MVI     G_0168, R2                      ; 5E1A   0282 0168
        CMPI    #$0008, R2                      ; 5E1C   037A 0008
        BLT     L_5E23                          ; 5E1E   0205 0003

        NEGR    R0                              ; 5E20   0020
        SUBI    #$0020, R3                      ; 5E21   033B 0020

L_5E23:
        JSR     R5,     L_5F37                  ; 5E23   0004 015C 0337

        INCR    R1                              ; 5E26   0009

        JSR     R5,     L_5F40                  ; 5E27   0004 015C 0340

        CMPR    R3,     R2                      ; 5E2A   015A
        BEQ     L_5E3C                          ; 5E2B   0204 000F

        MVI     G_0168, R0                      ; 5E2D   0280 0168
        CMPI    #$000E, R0                      ; 5E2F   0378 000E
        BEQ     L_5E37                          ; 5E31   0204 0004

        MVII    #$0005, R0                      ; 5E33   02B8 0005
        B       L_5E39                          ; 5E35   0200 0002

L_5E37:
        MVII    #$0001, R0                      ; 5E37   02B8 0001
L_5E39:
        MVO     R0,     G_0169                  ; 5E39   0240 0169
        PULR    R7                              ; 5E3B   02B7

L_5E3C:
        MVI     G_016D, R0                      ; 5E3C   0280 016D
        INCR    R0                              ; 5E3E   0008
        MVO     R0,     G_016D                  ; 5E3F   0240 016D
        MVI     G_0168, R0                      ; 5E41   0280 0168
        CMPI    #$000E, R0                      ; 5E43   0378 000E
        BEQ     L_5E37                          ; 5E45   0224 000F

        MVII    #$0005, R0                      ; 5E47   02B8 0005
        MVO     R0,     G_0169                  ; 5E49   0240 0169
        PULR    R7                              ; 5E4B   02B7

        MVI     G_0169, R0                      ; 5E4C   0280 0169
        DECR    R0                              ; 5E4E   0010
        BNEQ    L_5E0A                          ; 5E4F   022C 0046

        JSR     R5,     L_5FD0                  ; 5E51   0004 015C 03D0

        DECR    R6                              ; 5E54   0016

        JSR     R5,     L_6DBB                  ; 5E55   0004 016C 01BB

        J       L_50A4                          ; 5E58   0004 0350 00A4

L_5E5B:
        DECR    R6                              ; 5E5B   0016
        MVI     G_033D, R7                      ; 5E5C   0287 033D

        MVI     G_0169, R0                      ; 5E5E   0280 0169
        DECR    R0                              ; 5E60   0010
        BNEQ    L_5E0A                          ; 5E61   022C 0058

        MVII    #$0338, R1                      ; 5E63   02B9 0338
        MVII    #$0010, R0                      ; 5E65   02B8 0010

        JSR     R5,     L_5F37                  ; 5E67   0004 015C 0337

        INCR    R1                              ; 5E6A   0009

        JSR     R5,     L_5F37                  ; 5E6B   0004 015C 0337

        INCR    R1                              ; 5E6E   0009

        JSR     R5,     L_5F40                  ; 5E6F   0004 015C 0340

        MVII    #$0019, R0                      ; 5E72   02B8 0019
        MVO     R0,     G_0169                  ; 5E74   0240 0169
        SDBD                                    ; 5E76   0001
        MVII    #$28B9, R1                      ; 5E77   02B9 00B9 0028
        MVO     R1,     .BTAB.A1                ; 5E7A   0241 02A1
        MVO     R1,     .BTAB.A4                ; 5E7C   0241 02A4
        MVO     R1,     .BTAB.A5                ; 5E7E   0241 02A5
        MVO     R1,     .BTAB.B5                ; 5E80   0241 02B5
        MVO     R1,     .BTAB.BC                ; 5E82   0241 02BC
        MVO     R1,     .BTAB.C9                ; 5E84   0241 02C9
        MVO     R1,     .BTAB.D0                ; 5E86   0241 02D0
        MVI     .BTAB.BD,R3                     ; 5E88   0283 02BD
        SDBD                                    ; 5E8A   0001
        XORI    #$2000, R3                      ; 5E8B   03FB 0000 0020
        MVO     R3,     .BTAB.BD                ; 5E8E   0243 02BD
        MVI     .BTAB.D1,R3                     ; 5E90   0283 02D1
        SDBD                                    ; 5E92   0001
        XORI    #$2000, R3                      ; 5E93   03FB 0000 0020
        MVO     R3,     .BTAB.D1                ; 5E96   0243 02D1
        SDBD                                    ; 5E98   0001
        MVII    #$390E, R0                      ; 5E99   02B8 000E 0039
        MVO     R0,     .BTAB.A2                ; 5E9C   0240 02A2
        MVO     R0,     .BTAB.B6                ; 5E9E   0240 02B6
        MVO     R0,     .BTAB.CA                ; 5EA0   0240 02CA
        ADDI    #$0008, R0                      ; 5EA2   02F8 0008
        SDBD                                    ; 5EA4   0001
        XORI    #$2000, R0                      ; 5EA5   03F8 0000 0020
        MVO     R0,     .BTAB.A3                ; 5EA8   0240 02A3
        MVO     R0,     .BTAB.B7                ; 5EAA   0240 02B7
        MVO     R0,     .BTAB.CB                ; 5EAC   0240 02CB
        SDBD                                    ; 5EAE   0001
        MVII    #$191D, R0                      ; 5EAF   02B8 001D 0019
        MVO     R0,     .BTAB.CC                ; 5EB2   0240 02CC
        ADDI    #$0008, R0                      ; 5EB4   02F8 0008
        MVO     R0,     .BTAB.CD                ; 5EB6   0240 02CD
        ADDI    #$0008, R0                      ; 5EB8   02F8 0008
        MVO     R0,     .BTAB.CE                ; 5EBA   0240 02CE
        SDBD                                    ; 5EBC   0001
        MVII    #$0933, R0                      ; 5EBD   02B8 0033 0009
        MVO     R0,     .BTAB.BB                ; 5EC0   0240 02BB
        ADDI    #$0008, R0                      ; 5EC2   02F8 0008
        MVO     R0,     .BTAB.CF                ; 5EC4   0240 02CF
        MVII    #$031E, R4                      ; 5EC6   02BC 031E

        JSR     R5,     L_D0AE                  ; 5EC8   0004 01D0 00AE

        COMR    R4                              ; 5ECB   001C
        CLRC                                    ; 5ECC   0006
        ADDR    R0,     R0                      ; 5ECD   00C0
        EIS                                     ; 5ECE   0002
        MOVR    R0,     R6                      ; 5ECF   0086
        INCR    R1                              ; 5ED0   0009

        JSR     R5,     L_D0AE                  ; 5ED1   0004 01D0 00AE
        DECLE   $0027                           ; 5ED4   0027

        CLRC                                    ; 5ED5   0006
        MOVR    R4,     R0                      ; 5ED6   00A0
        DIS                                     ; 5ED7   0003
        MOVR    R2,     R6                      ; 5ED8   0096
        INCR    R1                              ; 5ED9   0009

        JSR     R5,     L_D0AE                  ; 5EDA   0004 01D0 00AE
        DECLE   $0031,  $0006,  $00C0,  $0002   ; 5EDD   0031 0006 00C0 0002
        DECLE   $00A6,  $0009,  $0004,  $01D0   ; 5EE1   00A6 0009 0004 01D0
        DECLE   $0095,  $0335,  $0072,  $009A   ; 5EE5   0095 0335 0072 009A
        DECLE   $0082,  $009A,  $0092,  $009A   ; 5EE9   0082 009A 0092 009A
        DECLE   $0000,  $0000                   ; 5EED   0000 0000

        B       L_5D60                          ; 5EEF   0220 0190

        DECLE   $0280,  $0166,  $03B8,  $000F   ; 5EF1   0280 0166 03B8 000F
        DECLE   $022C,  $0311,  $0004           ; 5EF5   022C 0311 0004

        XORR    R2,     R0                      ; 5EF8   01D0
        MOVR    R3,     R7                      ; 5EF9   009F

        DECLE   $0335,  $0030,  $0072,  $009A   ; 5EFA   0335 0030 0072 009A
        DECLE   $0240,  $0335,  $0004           ; 5EFE   0240 0335 0004

        XORR    R2,     R0                      ; 5F01   01D0
        MOVR    R3,     R7                      ; 5F02   009F

        DECLE   $0336,  $0030,  $0072,  $009A   ; 5F03   0336 0030 0072 009A
        DECLE   $0240,  $0336,  $0004           ; 5F07   0240 0336 0004

        XORR    R2,     R0                      ; 5F0A   01D0
        MOVR    R3,     R7                      ; 5F0B   009F
L_5F0C:
        SUB@    R6,     R7                      ; 5F0C   0337

        GSWD    R0                              ; 5F0D   0030
        RRC     R2,     1                       ; 5F0E   0072
        MOVR    R3,     R2                      ; 5F0F   009A
        MVO     R0,     G_0337                  ; 5F10   0240 0337
        MVI     G_0169, R0                      ; 5F12   0280 0169
        DECR    R0                              ; 5F14   0010
        MVO     R0,     G_0169                  ; 5F15   0240 0169
        BEQ     L_5DCA                          ; 5F17   0224 014E
        PULR    R7                              ; 5F19   02B7

L_5F1A:
        PSHR    R5                              ; 5F1A   0275
        DECLE   $0004                           ; 5F1B   0004

        XORR    R2,     R0                      ; 5F1C   01D0
        MOVR    R3,     R7                      ; 5F1D   009F

        DECLE   $0338,  $0020,  $006A,  $0094   ; 5F1E   0338 0020 006A 0094
        DECLE   $0240,  $0338,  $0004           ; 5F22   0240 0338 0004

        XORR    R2,     R0                      ; 5F25   01D0
        MOVR    R3,     R7                      ; 5F26   009F

        DECLE   $0339,  $0020,  $00EA,  $0094   ; 5F27   0339 0020 00EA 0094
        DECLE   $0240,  $0339,  $0004           ; 5F2B   0240 0339 0004

        XORR    R2,     R0                      ; 5F2E   01D0
        MOVR    R3,     R7                      ; 5F2F   009F

        SUBI    #$0020, R2                      ; 5F30   033A 0020
        SAR     R2,     1                       ; 5F32   006A
        MOVR    R2,     R5                      ; 5F33   0095
        MVO     R0,     G_033A                  ; 5F34   0240 033A
        PULR    R7                              ; 5F36   02B7

L_5F37:
        PSHR    R5                              ; 5F37   0275
        MVI@    R1,     R2                      ; 5F38   028A
        ADDR    R0,     R2                      ; 5F39   00C2
        MVO@    R2,     R1                      ; 5F3A   024A
        INCR    R1                              ; 5F3B   0009
        MVI@    R1,     R2                      ; 5F3C   028A
        ADDR    R0,     R2                      ; 5F3D   00C2
        MVO@    R2,     R1                      ; 5F3E   024A
        PULR    R7                              ; 5F3F   02B7

L_5F40:
        PSHR    R5                              ; 5F40   0275
        MVI@    R1,     R2                      ; 5F41   028A
        ADDR    R0,     R2                      ; 5F42   00C2
        MVO@    R2,     R1                      ; 5F43   024A
        PULR    R7                              ; 5F44   02B7

L_5F45:
        PSHR    R5                              ; 5F45   0275
        MVI@    R1,     R4                      ; 5F46   028C
        XORI    #$0200, R4                      ; 5F47   03FC 0200
        MVO@    R4,     R1                      ; 5F49   024C
        PULR    R7                              ; 5F4A   02B7

L_5F4B:
        PSHR    R5                              ; 5F4B   0275

        JSR     R5,     L_D018                  ; 5F4C   0004 01D0 0018
        JSRE    R5,     L_55BB                  ; 5F4F   0004 0155 01BB
        DECLE   $0004,  $01D0,  $000F           ; 5F52   0004 01D0 000F

        MVO     R0,     .STIC.MODE              ; 5F55   0240 0021
        MVII    #$0000, R0                      ; 5F57   02B8 0000
        MVO     R0,     .STIC.BORD              ; 5F59   0240 002C

        JSR     R5,     L_D000                  ; 5F5B   0004 01D0 0000
        DECLE   $0004,  $01D0,  $0095,  $0335   ; 5F5E   0004 01D0 0095 0335
        DECLE   $00F0,  $0093,  $00B0,  $0093   ; 5F62   00F0 0093 00B0 0093
        DECLE   $00F0,  $0092,  $00F8,  $0092   ; 5F66   00F0 0092 00F8 0092
        DECLE   $004A,  $0099,  $0000,  $0000   ; 5F6A   004A 0099 0000 0000

        MVO     R0,     .STIC.VIDEN             ; 5F6E   0240 0020
        MVII    #$0001, R0                      ; 5F70   02B8 0001
        MVO     R0,     G_0103                  ; 5F72   0240 0103
        MVII    #$008E, R0                      ; 5F74   02B8 008E
        MVO     R0,     G_015D                  ; 5F76   0240 015D
        MVII    #$0007, R0                      ; 5F78   02B8 0007
        MVO     R0,     G_015E                  ; 5F7A   0240 015E
        SDBD                                    ; 5F7C   0001
        MVII    #$9720, R0                      ; 5F7D   02B8 0020 0097
        MVO     R0,     G_0340                  ; 5F80   0240 0340
        SDBD                                    ; 5F82   0001
        MVII    #$0C80, R0                      ; 5F83   02B8 0080 000C
        MVO     R0,     G_0341                  ; 5F86   0240 0341
        MVII    #$0002, R0                      ; 5F88   02B8 0002
        MVO     R0,     G_0189                  ; 5F8A   0240 0189
        PULR    R7                              ; 5F8C   02B7

L_5F8D:
        PSHR    R5                              ; 5F8D   0275

        JSR     R5,     L_55BB                  ; 5F8E   0004 0154 01BB
        JSR     R5,     L_D018                  ; 5F91   0004 01D0 0018

        CLRR    R0                              ; 5F94   01C0
        MVO     R0,     .STIC.BORD              ; 5F95   0240 002C
        MVI     .STIC.MODE,R0                   ; 5F97   0280 0021
        MVII    #$0030, R4                      ; 5F99   02BC 0030
        MVII    #$0002, R0                      ; 5F9B   02B8 0002

        JSR     R5,     X_FILL_ZERO             ; 5F9D   0004 0114 0338

        MVII    #$0002, R0                      ; 5FA0   02B8 0002
        MVO     R0,     .STIC.EDGE              ; 5FA2   0240 0032
        SDBD                                    ; 5FA4   0001
        MVII    #$6140, R5                      ; 5FA5   02BD 0040 0061

        JSRD    R4,     X_NEW_GRAM_INIT         ; 5FA8   0004 001E 0335
        DECLE   $0004,  $01D0,  $000F           ; 5FAB   0004 01D0 000F

        JSR     R5,     L_6A0F                  ; 5FAE   0004 0168 020F
        JSR     R5,     L_68AD                  ; 5FB1   0004 0168 00AD

        EIS                                     ; 5FB4   0002

        JSR     R5,     L_55BB                  ; 5FB5   0004 0154 01BB
        DECLE   $0001,  $02BB,  $008F,  $0060   ; 5FB8   0001 02BB 008F 0060
        DECLE   $0004                           ; 5FBC   0004

        XORR    R2,     R0                      ; 5FBD   01D0
        GSWD    R1                              ; 5FBE   0031

        JSR     R5,     L_D000                  ; 5FBF   0004 01D0 0000
        JSR     R5,     L_6094                  ; 5FC2   0004 0160 0094
        JSR     R5,     L_63FB                  ; 5FC5   0004 0160 03FB

        CLRR    R0                              ; 5FC8   01C0
        MVO     R0,     G_0187                  ; 5FC9   0240 0187
        MVO     R0,     G_018A                  ; 5FCB   0240 018A
        MVO     R0,     G_01D2                  ; 5FCD   0240 01D2
        PULR    R7                              ; 5FCF   02B7

L_5FD0:
        PSHR    R5                              ; 5FD0   0275

        JSR     R5,     L_55BB                  ; 5FD1   0004 0154 01BB

        SDBD                                    ; 5FD4   0001
        MVII    #$3800, R4                      ; 5FD5   02BC 0000 0038
        MVII    #$0200, R0                      ; 5FD8   02B8 0200

        JSR     R5,     X_FILL_ZERO             ; 5FDA   0004 0114 0338

        MVII    #$0006, R0                      ; 5FDD   02B8 0006
        MVO     R0,     G_0168                  ; 5FDF   0240 0168

        JSR     R5,     L_D018                  ; 5FE1   0004 01D0 0018

        SDBD                                    ; 5FE4   0001
        MVII    #$6159, R5                      ; 5FE5   02BD 0059 0061

        JSRD    R4,     X_NEW_GRAM_INIT         ; 5FE8   0004 001E 0335
        JSR     R5,     L_D000                  ; 5FEB   0004 01D0 0000

        MVO     R0,     .STIC.MODE              ; 5FEE   0240 0021
        MVII    #$0003, R0                      ; 5FF0   02B8 0003
        MVO     R0,     .STIC.EDGE              ; 5FF2   0240 0032
        MVII    #$0002, R0                      ; 5FF4   02B8 0002
        MVO     R0,     .STIC.BORD              ; 5FF6   0240 002C
        MVII    #$000C, R2                      ; 5FF8   02BA 000C
        MVII    #$0200, R4                      ; 5FFA   02BC 0200
        MVI     G_015D, R0                      ; 5FFC   0280 015D
        MVI     G_015E, R1                      ; 5FFE   0281 015E
        PSHR    R2                              ; 6000   0272

        JSR     R5,     L_546B                  ; 6001   0004 0154 006B
        DECLE   $02B2,  $0338,  $0014,  $0009   ; 6004   02B2 0338 0014 0009
        DECLE   $0241,  $015E,  $0012,  $022C   ; 6008   0241 015E 0012 022C
        DECLE   $000C,  $0281,  $015E,  $0339   ; 600C   000C 0281 015E 0339
        DECLE   $000C,  $0241,  $015E,  $02BC   ; 6010   000C 0241 015E 02BC
        DECLE   $0030,  $0280,  $0189,  $0281   ; 6014   0030 0280 0189 0281
        DECLE   $018C,  $0260,  $0261,  $0002   ; 6018   018C 0260 0261 0002
        DECLE   $0004                           ; 601C   0004

        XORR    R2,     R0                      ; 601D   01D0
        MOVR    R2,     R5                      ; 601E   0095
        SUB@    R6,     R4                      ; 601F   0334
        MOVR    R7,     R2                      ; 6020   00BA
        MOVR    R2,     R7                      ; 6021   0097

        DECLE   $0000,  $0093,  $0000,  $0000   ; 6022   0000 0093 0000 0000

        MVII    #$0319, R4                      ; 6026   02BC 0319

        JSR     R5,     L_D0AE                  ; 6028   0004 01D0 00AE
        DECLE   $0054,  $0006,  $00B4,  $0001   ; 602B   0054 0006 00B4 0001

        MOVR    R0,     R2                      ; 602F   0082
        INCR    R1                              ; 6030   0009
        MVI     G_0319, R0                      ; 6031   0280 0319
        SUB     G_0189, R0                      ; 6033   0300 0189
        MVO     R0,     G_0319                  ; 6035   0240 0319
        MVI     G_0321, R0                      ; 6037   0280 0321
        SUB     G_018C, R0                      ; 6039   0300 018C
        MVO     R0,     G_0321                  ; 603B   0240 0321
        PULR    R7                              ; 603D   02B7

L_603E:
        PSHR    R5                              ; 603E   0275

        JSR     R5,     L_55BB                  ; 603F   0004 0154 01BB

        MVII    #$0007, R0                      ; 6042   02B8 0007
        MVO     R0,     G_0168                  ; 6044   0240 0168
        MVII    #$0008, R0                      ; 6046   02B8 0008
        MVO     R0,     .STIC.BORD              ; 6048   0240 002C
        SDBD                                    ; 604A   0001
        MVII    #$6123, R5                      ; 604B   02BD 0023 0061

        JSRD    R4,     X_NEW_GRAM_INIT         ; 604E   0004 001E 0335
        DECLE   $0003,  $0004,  $01D0,  $000F   ; 6051   0003 0004 01D0 000F

        JSR     R5,     L_6A0F                  ; 6055   0004 0168 020F

        MVI     .STIC.MODE,R0                   ; 6058   0280 0021
        MVII    #$0030, R4                      ; 605A   02BC 0030
        MVII    #$0002, R0                      ; 605C   02B8 0002

        JSR     R5,     X_FILL_ZERO             ; 605E   0004 0114 0338

        MVII    #$0002, R0                      ; 6061   02B8 0002
        MVO     R0,     .STIC.EDGE              ; 6063   0240 0032

        JSR     R5,     L_D000                  ; 6065   0004 01D0 0000

        SDBD                                    ; 6068   0001
        MVII    #$9410, R0                      ; 6069   02B8 0010 0094
        MVO     R0,     G_0336                  ; 606C   0240 0336
        SDBD                                    ; 606E   0001
        MVII    #$9428, R0                      ; 606F   02B8 0028 0094
        MVO     R0,     G_0337                  ; 6072   0240 0337
        CLRR    R0                              ; 6074   01C0
        MVO     R0,     G_01D3                  ; 6075   0240 01D3
        MVII    #$0001, R0                      ; 6077   02B8 0001
        MVO     R0,     G_01D2                  ; 6079   0240 01D2

        JSR     R5,     L_6094                  ; 607B   0004 0160 0094
        JSR     R5,     L_64FC                  ; 607E   0004 0164 00FC
        DECLE   $0001,  $02BB,  $008A,  $0060   ; 6081   0001 02BB 008A 0060
        DECLE   $0004                           ; 6085   0004

        XORR    R2,     R0                      ; 6086   01D0
        GSWD    R1                              ; 6087   0031
        EIS                                     ; 6088   0002
        PULR    R7                              ; 6089   02B7

        DECLE   $0001,  $000E,  $0001,  $0000   ; 608A   0001 000E 0001 0000
        DECLE   $0008,  $0000,  $0009,  $0001   ; 608E   0008 0000 0009 0001

        INCR    R0                              ; 6092   0008
        INCR    R0                              ; 6093   0008
L_6094:
        PSHR    R5                              ; 6094   0275

        JSR     R5,     L_6B06                  ; 6095   0004 0168 0306
        JSR     R5,     L_6451                  ; 6098   0004 0164 0051
        JSR     R5,     L_6496                  ; 609B   0004 0164 0096
        JSR     R5,     L_64D2                  ; 609E   0004 0164 00D2

        PULR    R7                              ; 60A1   02B7

L_60A2:
        PSHR    R5                              ; 60A2   0275
        MVII    #$0002, R3                      ; 60A3   02BB 0002
        MVII    #$0252, R4                      ; 60A5   02BC 0252

        JSR     R5,     X_PRINT_R5              ; 60A7   0004 0118 007B
        STRING  "Level?"                        ; 60AA  
        DECLE   $0000                           ; 60B0   0000

        MVII    #$0001, R3                      ; 60B1   02BB 0001
        ADDI    #$0022, R4                      ; 60B3   02FC 0022

        JSR     R5,     X_PRINT_R5              ; 60B5   0004 0118 007B
        STRING  "Cadet"                         ; 60B8  
        DECLE   $0000                           ; 60BD   0000

        ADDI    #$000F, R4                      ; 60BE   02FC 000F

        JSR     R5,     X_PRINT_R5              ; 60C0   0004 0118 007B
        STRING  "Ranger"                        ; 60C3  
        DECLE   $0000                           ; 60C9   0000

        ADDI    #$000E, R4                      ; 60CA   02FC 000E

        JSR     R5,     X_PRINT_R5              ; 60CC   0004 0118 007B
        STRING  "Ace"                           ; 60CF   0041 0063 0065
        DECLE   $0000                           ; 60D2   0000

        ADDI    #$0027, R4                      ; 60D3   02FC 0027
        MVII    #$0005, R3                      ; 60D5   02BB 0005

        JSR     R5,     X_PRINT_R5              ; 60D7   0004 0118 007B
        STRING  "enter"                         ; 60DA  
        DECLE   $0000                           ; 60DF   0000

        PULR    R7                              ; 60E0   02B7

L_60E1:
        PSHR    R5                              ; 60E1   0275
        MVII    #$0001, R3                      ; 60E2   02BB 0001
        MVII    #$0251, R4                      ; 60E4   02BC 0251

        JSR     R5,     X_PRINT_R5              ; 60E6   0004 0118 007B
        STRING  "Mission:"                      ; 60E9  
        DECLE   $0000                           ; 60F1   0000

        MVII    #$0002, R3                      ; 60F2   02BB 0002
        MVI     G_016A, R0                      ; 60F4   0280 016A
        MVII    #$0003, R1                      ; 60F6   02B9 0003
        MVII    #$0269, R4                      ; 60F8   02BC 0269

        JSR     R5,     X_PRNUM_ZRO             ; 60FA   0004 0118 00AD

        MVII    #$0001, R3                      ; 60FD   02BB 0001
        MVII    #$028D, R4                      ; 60FF   02BC 028D

        JSR     R5,     X_PRINT_R5              ; 6101   0004 0118 007B
        STRING  "Flights"                       ; 6104  
        DECLE   $0000                           ; 610B   0000

        MVII    #$02A1, R4                      ; 610C   02BC 02A1

        JSR     R5,     X_PRINT_R5              ; 610E   0004 0118 007B
        STRING  "Left:"                         ; 6111  
        DECLE   $0000                           ; 6116   0000

        MVII    #$0002, R3                      ; 6117   02BB 0002
        MVI     G_016B, R0                      ; 6119   0280 016B
        MVII    #$0003, R1                      ; 611B   02B9 0003
        MVII    #$02B9, R4                      ; 611D   02BC 02B9

        JSR     R5,     X_PRNUM_ZRO             ; 611F   0004 0118 00AD

        PULR    R7                              ; 6122   02B7

        DECLE   $002A,  $003F,  $0380,  $004F   ; 6123   002A 003F 0380 004F
        DECLE   $0380,  $005F,  $0100,  $0223   ; 6127   0380 005F 0100 0223
        DECLE   $00C0,  $02C1,  $019E,  $0059   ; 612B   00C0 02C1 019E 0059
        DECLE   $0046,  $006D,  $0380,  $007D   ; 612F   0046 006D 0380 007D
        DECLE   $0080,  $0261,  $005E,  $0241   ; 6133   0080 0261 005E 0241
        DECLE   $00C0,  $03F1,  $031B,  $028B   ; 6137   00C0 03F1 031B 028B
        DECLE   $03A6,  $0267,  $03FC,  $004D   ; 613B   03A6 0267 03FC 004D
        DECLE   $0148,  $0028,  $003F,  $0380   ; 613F   0148 0028 003F 0380
        DECLE   $004F,  $0380,  $005F,  $0100   ; 6143   004F 0380 005F 0100
        DECLE   $0223,  $00C0,  $02C1,  $019E   ; 6147   0223 00C0 02C1 019E
        DECLE   $0059,  $0046,  $003F,  $0030   ; 614B   0059 0046 003F 0030
        DECLE   $001F,  $0070,  $0031,  $0148   ; 614F   001F 0070 0031 0148
        DECLE   $00B7                           ; 6153   00B7

        SWAP    R0,     1                       ; 6154   0040
        SLR     R1,     2                       ; 6155   0065
        ANDR    R0,     R0                      ; 6156   0180
        ADCR    R7                              ; 6157   002F

        SUB@    R4,     R0                      ; 6158   0320
L_6159:
        ADCR    R6                              ; 6159   002E
        SDBD                                    ; 615A   0001
        SUB@    R4,     R0                      ; 615B   0320
        ADCR    R1                              ; 615C   0029
        SUBR    R0,     R1                      ; 615D   0101
        INCR    R5                              ; 615E   000D
        ADD@    R1,     R0                      ; 615F   02C8
        INCR    R7                              ; 6160   000F

        MOVR    R4,     R0                      ; 6161   00A0
L_6162:
        MVI     G_0036, R1                      ; 6162   0281 0036
        DECLE   $0013,  $0020,  $0223,  $0040   ; 6164   0013 0020 0223 0040
        DECLE   $0123,  $00C0,  $02F1,  $01DE   ; 6168   0123 00C0 02F1 01DE
        DECLE   $022B,  $0040,  $012B,  $00C0   ; 616C   022B 0040 012B 00C0
        DECLE   $0015,  $0020,  $0233           ; 6170   0015 0020 0233

        SWAP    R0,     1                       ; 6173   0040
L_6174:
        DECR    R7                              ; 6174   0017

        DECLE   $0120,  $023B,  $0040,  $001D   ; 6175   0120 023B 0040 001D
        DECLE   $0020,  $004B,  $0050,  $0001   ; 6179   0020 004B 0050 0001
        DECLE   $0070,  $0019,  $0070,  $001F   ; 617D   0070 0019 0070 001F
        DECLE   $0070,  $001F                   ; 6181   0070 001F

        MOVR    R4,     R0                      ; 6183   00A0
        MVO@    R3,     R1                      ; 6184   024B
        SWAP    R0,     1                       ; 6185   0040
        COMR    R3                              ; 6186   001B
        RRC     R0,     1                       ; 6187   0070
        NEGR    R3                              ; 6188   0023
        MVI@    R4,     R0                      ; 6189   02A0
L_618A:
        PSHR    R5                              ; 618A   0275
        MVI     G_0162, R1                      ; 618B   0281 0162
        MOVR    R1,     R0                      ; 618D   0088
        MVI     G_0167, R5                      ; 618E   0285 0167
        MVO     R0,     G_0167                  ; 6190   0240 0167
        ANDI    #$0040, R0                      ; 6192   03B8 0040
        BNEQ    L_61E1                          ; 6194   020C 004B

        MOVR    R1,     R0                      ; 6196   0088
        ANDI    #$0080, R0                      ; 6197   03B8 0080
        BNEQ    L_62C5                          ; 6199   020C 012A

        MVI     G_0168, R3                      ; 619B   0283 0168
        TSTR    R3                              ; 619D   009B
        BEQ     L_62C4                          ; 619E   0204 0124

        MVII    #$0001, R0                      ; 61A0   02B8 0001
        ADDI    #$0008, R1                      ; 61A2   02F9 0008
        ADD     G_01D8, R1                      ; 61A4   02C1 01D8
        MVI     G_01D9, R5                      ; 61A6   0285 01D9
        ANDI    #$0080, R5                      ; 61A8   03BD 0080
        BEQ     L_61B0                          ; 61AA   0204 0004

        SUB     G_01D8, R1                      ; 61AC   0301 01D8
        SUB     G_01D8, R1                      ; 61AE   0301 01D8

L_61B0:
        JSR     R5,     .EXEC.629               ; 61B0   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 61B3   0004 0114 0357

        MOVR    R0,     R3                      ; 61B6   0083
        MVI     G_018A, R0                      ; 61B7   0280 018A

        JSR     R5,     X_EXT_SIGN_LO           ; 61B9   0004 0114 0268

        ADDR    R0,     R1                      ; 61BC   00C1
        MVI     G_0187, R0                      ; 61BD   0280 0187

        JSR     R5,     X_EXT_SIGN_LO           ; 61BF   0004 0114 0268

        ADDR    R3,     R0                      ; 61C2   00D8
        MVII    #$0001, R3                      ; 61C3   02BB 0001
L_61C5:
        CLRR    R4                              ; 61C5   01E4
        TSTR    R0                              ; 61C6   0080
        BPL     L_61CB                          ; 61C7   0203 0002

        NEGR    R0                              ; 61C9   0020
        COMR    R4                              ; 61CA   001C

L_61CB:
        JSR     R5,     X_CLAMP                 ; 61CB   0004 0114 0270
        DECLE   $0000                           ; 61CE   0000

        RLC     R1,     2                       ; 61CF   0055
        TSTR    R4                              ; 61D0   00A4
        BPL     L_61D4                          ; 61D1   0203 0001

        NEGR    R0                              ; 61D3   0020
L_61D4:
        PSHR    R0                              ; 61D4   0270
        MOVR    R1,     R0                      ; 61D5   0088
        DECR    R3                              ; 61D6   0013
        BPL     L_61C5                          ; 61D7   0223 0013

        PULR    R1                              ; 61D9   02B1
        PULR    R0                              ; 61DA   02B0
        MVO     R0,     G_0187                  ; 61DB   0240 0187
        MVO     R1,     G_018A                  ; 61DD   0241 018A
        B       L_61E1                          ; 61DF   0200 0000

L_61E1:
        MVI     G_0163, R3                      ; 61E1   0283 0163
        DECR    R3                              ; 61E3   0013
        BMI     L_62C4                          ; 61E4   020B 00DE

        MVI     G_0168, R0                      ; 61E6   0280 0168
        CMPI    #$0006, R0                      ; 61E8   0378 0006
        BNEQ    L_62C4                          ; 61EA   020C 00D8

        MVI     G_01C6, R0                      ; 61EC   0280 01C6
        TSTR    R0                              ; 61EE   0080
        BNEQ    L_62C4                          ; 61EF   020C 00D3

        MVI     G_031A, R0                      ; 61F1   0280 031A
        ANDI    #$0200, R0                      ; 61F3   03B8 0200
        BNEQ    L_62C4                          ; 61F5   020C 00CD

        MVI     G_0179, R0                      ; 61F7   0280 0179
        CMPI    #$0078, R0                      ; 61F9   0378 0078
        BGE     L_62C4                          ; 61FB   020D 00C7

        CMPI    #$0028, R0                      ; 61FD   0378 0028
        BLT     L_6215                          ; 61FF   0205 0014

        MVI     G_035E, R1                      ; 6201   0281 035E
        CMPI    #$0050, R0                      ; 6203   0378 0050
        BGT     L_620F                          ; 6205   020E 0008

        ANDI    #$0003, R1                      ; 6207   03B9 0003
        BNEQ    L_6215                          ; 6209   020C 000A

        MVII    #$0002, R4                      ; 620B   02BC 0002
        B       L_62BE                          ; 620D   0200 00AF

L_620F:
        ANDI    #$0001, R1                      ; 620F   03B9 0001
        MVII    #$0002, R4                      ; 6211   02BC 0002
        BEQ     L_62BE                          ; 6213   0204 00A9

L_6215:
        MVII    #$031A, R4                      ; 6215   02BC 031A
        TSTR    R3                              ; 6217   009B
        BEQ     L_6248                          ; 6218   0204 002E

        MVII    #$0172, R5                      ; 621A   02BD 0172
        SDBD                                    ; 621C   0001
        MVI@    R5,     R0                      ; 621D   02A8
        TSTR    R0                              ; 621E   0080
        BEQ     L_62C4                          ; 621F   0204 00A3

        SUBI    #$000D, R0                      ; 6221   0338 000D
        BPL     L_6226                          ; 6223   0203 0001

        CLRR    R0                              ; 6225   01C0
L_6226:
        MVO     R0,     G_0172                  ; 6226   0240 0172
        SWAP    R0,     1                       ; 6228   0040
        MVO     R0,     G_0173                  ; 6229   0240 0173

        JSR     R5,     L_D0AE                  ; 622B   0004 01D0 00AE
        DECLE   $0008,  $0042,  $00E4,  $0000   ; 622E   0008 0042 00E4 0000

        MOVR    R2,     R1                      ; 6232   0091
        COMR    R1                              ; 6233   0019

        JSR     R5,     L_D0AE                  ; 6234   0004 01D0 00AE

        MOVR    R2,     R7                      ; 6237   0097

        DECLE   $0042,  $00E4,  $0004           ; 6238   0042 00E4 0004

        MOVR    R2,     R1                      ; 623B   0091
        COMR    R1                              ; 623C   0019

        JSR     R5,     L_6E3B                  ; 623D   0004 016C 023B

        SDBD                                    ; 6240   0001
        MVII    #$9320, R1                      ; 6241   02B9 0020 0093
        MVII    #$0001, R4                      ; 6244   02BC 0001
        B       L_6274                          ; 6246   0200 002C

L_6248:
        MVII    #$0170, R5                      ; 6248   02BD 0170
        SDBD                                    ; 624A   0001
        MVI@    R5,     R0                      ; 624B   02A8
        TSTR    R0                              ; 624C   0080
        BEQ     L_62C4                          ; 624D   0204 0075

        SUBI    #$0008, R0                      ; 624F   0338 0008
        BPL     L_6254                          ; 6251   0203 0001

        CLRR    R0                              ; 6253   01C0
L_6254:
        MVO     R0,     G_0170                  ; 6254   0240 0170
        SWAP    R0,     1                       ; 6256   0040
        MVO     R0,     G_0171                  ; 6257   0240 0171

        JSR     R5,     L_D0AE                  ; 6259   0004 01D0 00AE
        DECLE   $00FE,  $0046,  $00E4,  $0000   ; 625C   00FE 0046 00E4 0000

        TSTR    R2                              ; 6260   0092
        INCR    R1                              ; 6261   0009

        JSR     R5,     L_D0AE                  ; 6262   0004 01D0 00AE
        DECLE   $0099,  $0046,  $00E4,  $0004   ; 6265   0099 0046 00E4 0004

        TSTR    R2                              ; 6269   0092
        INCR    R1                              ; 626A   0009

        JSR     R5,     L_6E24                  ; 626B   0004 016C 0224

        SDBD                                    ; 626E   0001
        MVII    #$9350, R1                      ; 626F   02B9 0050 0093
        MVII    #$0000, R4                      ; 6272   02BC 0000
L_6274:
        MVO     R1,     G_0336                  ; 6274   0241 0336
        MVI     G_0340, R0                      ; 6276   0280 0340
        MVO     R0,     G_0342                  ; 6278   0240 0342
        MVI     G_0341, R0                      ; 627A   0280 0341
        MVO     R0,     G_0343                  ; 627C   0240 0343
        MVII    #$0003, R0                      ; 627E   02B8 0003
        MVO     R0,     G_0169                  ; 6280   0240 0169
        MVII    #$026D, R3                      ; 6282   02BB 026D
        MVII    #$0008, R2                      ; 6284   02BA 0008
        MVI     G_015D, R5                      ; 6286   0285 015D
        MVI     G_0189, R1                      ; 6288   0281 0189
        CMPI    #$0005, R1                      ; 628A   0379 0005
        BGE     L_629C                          ; 628C   020D 000E

        INCR    R3                              ; 628E   000B
        INCR    R2                              ; 628F   000A
        MVI     G_031A, R0                      ; 6290   0280 031A
        ADDI    #$0008, R0                      ; 6292   02F8 0008
        MVO     R0,     G_031A                  ; 6294   0240 031A
        MVI     G_031B, R0                      ; 6296   0280 031B
        ADDI    #$0008, R0                      ; 6298   02F8 0008
        MVO     R0,     G_031B                  ; 629A   0240 031B
L_629C:
        ADDR    R2,     R5                      ; 629C   00D5
        MVO     R5,     G_01C8                  ; 629D   0245 01C8
        MVII    #$0004, R2                      ; 629F   02BA 0004
        MVI     G_015E, R5                      ; 62A1   0285 015E
        MVI     G_018C, R1                      ; 62A3   0281 018C
        CMPI    #$0004, R1                      ; 62A5   0379 0004
        BGE     L_62B8                          ; 62A7   020D 000F

        ADDI    #$0014, R3                      ; 62A9   02FB 0014
        INCR    R2                              ; 62AB   000A
        MVI     G_0322, R0                      ; 62AC   0280 0322
        ADDI    #$0008, R0                      ; 62AE   02F8 0008
        MVO     R0,     G_0322                  ; 62B0   0240 0322
        MVI     G_0323, R0                      ; 62B2   0280 0323
        ADDI    #$0008, R0                      ; 62B4   02F8 0008
        MVO     R0,     G_0323                  ; 62B6   0240 0323
L_62B8:
        ADDR    R2,     R5                      ; 62B8   00D5
        MVO     R5,     G_01C9                  ; 62B9   0245 01C9
        MVI@    R3,     R0                      ; 62BB   0298
        MVO     R0,     G_033F                  ; 62BC   0240 033F
L_62BE:
        MVO     R4,     G_01C7                  ; 62BE   0244 01C7
        MVII    #$000B, R0                      ; 62C0   02B8 000B
        MVO     R0,     G_01C6                  ; 62C2   0240 01C6
L_62C4:
        PULR    R7                              ; 62C4   02B7

L_62C5:
        MVO     R1,     G_0167                  ; 62C5   0241 0167
        CMPR    R1,     R5                      ; 62C7   014D
        BEQ     L_61E1                          ; 62C8   0224 00E8

        ANDI    #$000F, R1                      ; 62CA   03B9 000F
        MVI     G_0168, R3                      ; 62CC   0283 0168
        TSTR    R3                              ; 62CE   009B
        BEQ     L_62DB                          ; 62CF   0204 000A

        CMPI    #$0006, R3                      ; 62D1   037B 0006
        BEQ     L_6314                          ; 62D3   0204 003F

        CMPI    #$0007, R3                      ; 62D5   037B 0007
        BEQ     L_6314                          ; 62D7   0204 003B
        B       L_61E1                          ; 62D9   0220 00F9

L_62DB:
        CMPI    #$000B, R1                      ; 62DB   0379 000B
        BEQ     L_6335                          ; 62DD   0204 0056

        CMPI    #$0004, R1                      ; 62DF   0379 0004
        BGE     L_61E1                          ; 62E1   022D 0101

        TSTR    R1                              ; 62E3   0089
        BEQ     L_61E1                          ; 62E4   0224 0104

        SDBD                                    ; 62E6   0001
        MVII    #$6311, R3                      ; 62E7   02BB 0011 0063
L_62EA:
        MVII    #$0200, R4                      ; 62EA   02BC 0200
        ADD@    R3,     R4                      ; 62EC   02DC
        MOVR    R4,     R5                      ; 62ED   00A5
L_62EE:
        MVI@    R4,     R2                      ; 62EE   02A2
        TSTR    R2                              ; 62EF   0092
        BEQ     L_62FB                          ; 62F0   0204 0009

        SDBD                                    ; 62F2   0001
        ANDI    #$FFF8, R2                      ; 62F3   03BA 00F8 00FF
        XORI    #$0001, R2                      ; 62F6   03FA 0001
        MVO@    R2,     R5                      ; 62F8   026A
        B       L_62EE                          ; 62F9   0220 000C

L_62FB:
        INCR    R3                              ; 62FB   000B
        CMPI    #$02A2, R4                      ; 62FC   037C 02A2
        BLT     L_62EA                          ; 62FE   0225 0015

        SUBI    #$0004, R3                      ; 6300   033B 0004
        MVO     R1,     G_016C                  ; 6302   0241 016C
        ADDR    R1,     R3                      ; 6304   00CB
        MVII    #$0200, R4                      ; 6305   02BC 0200
        ADD@    R3,     R4                      ; 6307   02DC
        MOVR    R4,     R5                      ; 6308   00A5
L_6309:
        MVI@    R4,     R2                      ; 6309   02A2
        TSTR    R2                              ; 630A   0092
        BEQ     L_61E1                          ; 630B   0224 012B

        INCR    R2                              ; 630D   000A
        MVO@    R2,     R5                      ; 630E   026A
        B       L_6309                          ; 630F   0220 0007

        SARC    R2,     1                       ; 6311   007A
        MOVR    R1,     R6                      ; 6312   008E
        MOVR    R4,     R2                      ; 6313   00A2
L_6314:
        TSTR    R1                              ; 6314   0089
        DECLE   $0204,  $0009                   ; 6315   0204 0009

        CMPI    #$000A, R1                      ; 6317   0379 000A
        BEQ     L_63AD                          ; 6319   0204 0092

        CMPI    #$000B, R1                      ; 631B   0379 000B
        BEQ     L_6350                          ; 631D   0204 0031
        PULR    R7                              ; 631F   02B7

        DECLE   $0004,  $01D0,  $000F           ; 6320   0004 01D0 000F

        ANDI    #$0001, R3                      ; 6323   03BB 0001
        BNEQ    L_632E                          ; 6325   020C 0007

        JSR     R5,     L_603E                  ; 6327   0004 0160 003E

        DECR    R6                              ; 632A   0016
        J       L_50E4                          ; 632B   0004 0350 00E4

L_632E:
        JSR     R5,     L_5FD0                  ; 632E   0004 015C 03D0

        DECR    R6                              ; 6331   0016
        J       L_50A4                          ; 6332   0004 0350 00A4

L_6335:
        MVI     G_016C, R5                      ; 6335   0285 016C
        DECLE   $0015,  $022B,  $0158,  $0001   ; 6337   0015 022B 0158 0001
        DECLE   $02FD,  $00D9,  $00BD,  $02A8   ; 633B   02FD 00D9 00BD 02A8
        DECLE   $0240,  $016C,  $0084,  $0004   ; 633F   0240 016C 0084 0004

        ANDR    R7,     R4                      ; 6343   01BC
        ADDR    R6,     R3                      ; 6344   00F3
        DECR    R6                              ; 6345   0016
        MVI     G_035E, R0                      ; 6346   0280 035E
        MVO     R0,     G_033E                  ; 6348   0240 033E

        JSR     R5,     L_D025                  ; 634A   0004 01D0 0025

        J       L_5707                          ; 634D   0004 0354 0307

L_6350:
        CLRR    R3                              ; 6350   01DB
        MVI     G_015D, R0                      ; 6351   0280 015D
        MVI     G_015E, R1                      ; 6353   0281 015E
        CMPI    #$008D, R0                      ; 6355   0378 008D
        BLT     L_63AC                          ; 6357   0205 0053

        CMPI    #$008F, R0                      ; 6359   0378 008F
        BGT     L_63AC                          ; 635B   020E 004F

        CMPI    #$0006, R1                      ; 635D   0379 0006
        BLT     L_63AC                          ; 635F   0205 004B

        CMPI    #$0008, R1                      ; 6361   0379 0008
        BGT     L_6367                          ; 6363   020E 0002
        B       L_6370                          ; 6365   0200 0009

L_6367:
        CMPI    #$000C, R1                      ; 6367   0379 000C
        BLT     L_63AC                          ; 6369   0205 0041

        CMPI    #$000E, R1                      ; 636B   0379 000E
        BGT     L_63AC                          ; 636D   020E 003D

        INCR    R3                              ; 636F   000B
L_6370:
        TSTR    R3                              ; 6370   009B
        BNEQ    L_637B                          ; 6371   020C 0008

        SDBD                                    ; 6373   0001
        MVII    #$0C80, R0                      ; 6374   02B8 0080 000C
        MVII    #$0007, R1                      ; 6377   02B9 0007
        B       L_6381                          ; 6379   0200 0006

L_637B:
        SDBD                                    ; 637B   0001
        MVII    #$1260, R0                      ; 637C   02B8 0060 0012
        MVII    #$000D, R1                      ; 637F   02B9 000D
L_6381:
        SDBD                                    ; 6381   0001
        MVII    #$9720, R3                      ; 6382   02BB 0020 0097
        MVO     R3,     G_0340                  ; 6385   0243 0340
        MVO     R0,     G_0341                  ; 6387   0240 0341
        MVII    #$008E, R3                      ; 6389   02BB 008E
        MVO     R3,     G_015D                  ; 638B   0243 015D
        MVO     R1,     G_015E                  ; 638D   0241 015E
        MVII    #$0002, R0                      ; 638F   02B8 0002
        MVO     R0,     G_0189                  ; 6391   0240 0189
        CLRR    R0                              ; 6393   01C0
        MVO     R0,     G_018C                  ; 6394   0240 018C

        JSR     R5,     L_6F63                  ; 6396   0004 016C 0363

        TSTR    R0                              ; 6399   0080
        BEQ     L_63A1                          ; 639A   0204 0005

        MVI     G_016B, R0                      ; 639C   0280 016B
        DECR    R0                              ; 639E   0010
        BEQ     L_63CD                          ; 639F   0204 002C

L_63A1:
        MVII    #$0008, R0                      ; 63A1   02B8 0008
        MVO     R0,     G_0168                  ; 63A3   0240 0168

        JSR     R5,     L_5F8D                  ; 63A5   0004 015C 038D

        DECR    R6                              ; 63A8   0016
        J       L_5828                          ; 63A9   0004 0358 0028
L_63AC:
        PULR    R7                              ; 63AC   02B7

L_63AD:
        MVI     G_0178, R0                      ; 63AD   0280 0178
        CMPI    #$0078, R0                      ; 63AF   0378 0078
        BGE     L_63CC                          ; 63B1   020D 0019

        CMPI    #$0028, R0                      ; 63B3   0378 0028
        BLT     L_63C7                          ; 63B5   0205 0010

        MVI     G_035E, R1                      ; 63B7   0281 035E
        CMPI    #$0050, R0                      ; 63B9   0378 0050
        BGT     L_63C3                          ; 63BB   020E 0006

        ANDI    #$0001, R1                      ; 63BD   03B9 0001
        BNEQ    L_63C7                          ; 63BF   020C 0006
        B       L_63CC                          ; 63C1   0200 0009

L_63C3:
        ANDI    #$0003, R1                      ; 63C3   03B9 0003
        BNEQ    L_63CC                          ; 63C5   020C 0005

L_63C7:
        CLRR    R0                              ; 63C7   01C0
        MVO     R0,     G_0187                  ; 63C8   0240 0187
        MVO     R0,     G_018A                  ; 63CA   0240 018A
L_63CC:
        PULR    R7                              ; 63CC   02B7

L_63CD:
        MVII    #$0001, R0                      ; 63CD   02B8 0001
        MVO     R0,     G_01D7                  ; 63CF   0240 01D7
        MVII    #$000E, R0                      ; 63D1   02B8 000E
        MVO     R0,     G_0168                  ; 63D3   0240 0168

        JSR     R5,     L_5F8D                  ; 63D5   0004 015C 038D

        DECR    R6                              ; 63D8   0016
        J       L_57E5                          ; 63D9   0004 0354 03E5

L_63DC:
        PSHR    R5                              ; 63DC   0275
        PSHR    R0                              ; 63DD   0270
L_63DE:
        SDBD                                    ; 63DE   0001
        ANDI    #$1007, R3                      ; 63DF   03BB 0007 0010
        MVI@    R4,     R2                      ; 63E2   02A2
        RRC     R2,     1                       ; 63E3   0072
        BNC     L_63EA                          ; 63E4   0209 0004

        SDBD                                    ; 63E6   0001
        XORI    #$0800, R3                      ; 63E7   03FB 0000 0008
L_63EA:
        RRC     R2,     1                       ; 63EA   0072
        BNC     L_63F1                          ; 63EB   0209 0004

        SDBD                                    ; 63ED   0001
        XORI    #$2000, R3                      ; 63EE   03FB 0000 0020
L_63F1:
        SLL     R2,     2                       ; 63F1   004E
        SLL     R2,     1                       ; 63F2   004A
        XORR    R2,     R3                      ; 63F3   01D3
        MVO@    R3,     R1                      ; 63F4   024B
        INCR    R1                              ; 63F5   0009
        DECR    R0                              ; 63F6   0010
        BNEQ    L_63DE                          ; 63F7   022C 001A

        PULR    R0                              ; 63F9   02B0
        PULR    R7                              ; 63FA   02B7

L_63FB:
        PSHR    R5                              ; 63FB   0275
        MVII    #$0200, R4                      ; 63FC   02BC 0200
        SDBD                                    ; 63FE   0001
        MVII    #$DFFF, R3                      ; 63FF   02BB 00FF 00DF
L_6402:
        MVI@    R4,     R0                      ; 6402   02A0
        TSTR    R0                              ; 6403   0080
        BNEQ    L_640C                          ; 6404   020C 0006

L_6406:
        CMPI    #$02F0, R4                      ; 6406   037C 02F0
        BLT     L_6402                          ; 6408   0225 0007
        B       L_6411                          ; 640A   0200 0005

L_640C:
        DECR    R4                              ; 640C   0014
        ANDR    R3,     R0                      ; 640D   0198
        MVO@    R0,     R4                      ; 640E   0260
        B       L_6406                          ; 640F   0220 000A

L_6411:
        SDBD                                    ; 6411   0001
        MVII    #$18C5, R1                      ; 6412   02B9 00C5 0018
        MVII    #$0008, R0                      ; 6415   02B8 0008
        MVII    #$0229, R4                      ; 6417   02BC 0229

        JSR     R5,     X_FILL_MEM              ; 6419   0004 0114 0341

        ADDI    #$0010, R1                      ; 641C   02F9 0010
        MVII    #$02DD, R4                      ; 641E   02BC 02DD

        JSR     R5,     X_FILL_MEM              ; 6420   0004 0114 0341

        ADDI    #$0008, R1                      ; 6423   02F9 0008
        MVII    #$023C, R4                      ; 6425   02BC 023C

        JSR     R5,     L_6448                  ; 6427   0004 0164 0048

        SUBI    #$0010, R1                      ; 642A   0339 0010
        MVII    #$0245, R4                      ; 642C   02BC 0245

        JSR     R5,     L_6448                  ; 642E   0004 0164 0048

        MVI     G_0168, R1                      ; 6431   0281 0168
        TSTR    R1                              ; 6433   0089
        BEQ     L_643B                          ; 6434   0204 0005

        SDBD                                    ; 6436   0001
        MVII    #$08B9, R1                      ; 6437   02B9 00B9 0008
        INCR    R7                              ; 643A   000F

L_643B:
        CLRR    R1                              ; 643B   01C9
L_643C:
        MVII    #$023D, R4                      ; 643C   02BC 023D

L_643E:
        JSR     R5,     X_FILL_MEM              ; 643E   0004 0114 0341

        ADDI    #$000C, R4                      ; 6441   02FC 000C
        CMPI    #$02D0, R4                      ; 6443   037C 02D0
        BLT     L_643E                          ; 6445   0225 0008
        PULR    R7                              ; 6447   02B7

L_6448:
        PSHR    R0                              ; 6448   0270
L_6449:
        MVO@    R1,     R4                      ; 6449   0261
        ADDI    #$0013, R4                      ; 644A   02FC 0013
        DECR    R0                              ; 644C   0010
        BNEQ    L_6449                          ; 644D   022C 0005

        PULR    R0                              ; 644F   02B0
        MOVR    R5,     R7                      ; 6450   00AF

L_6451:
        PSHR    R5                              ; 6451   0275
        SDBD                                    ; 6452   0001
        MVII    #$0679, R1                      ; 6453   02B9 0079 0006
        MVII    #$0009, R0                      ; 6456   02B8 0009
        MVII    #$0232, R4                      ; 6458   02BC 0232

        JSR     R5,     X_FILL_MEM              ; 645A   0004 0114 0341

        MVII    #$0282, R4                      ; 645D   02BC 0282

        JSR     R5,     X_FILL_MEM              ; 645F   0004 0114 0341

        MOVR    R1,     R3                      ; 6462   008B
        SDBD                                    ; 6463   0001
        MVII    #$6480, R4                      ; 6464   02BC 0080 0064
        MVII    #$0248, R1                      ; 6467   02B9 0248
        MVII    #$0008, R0                      ; 6469   02B8 0008

        JSR     R5,     L_63DC                  ; 646B   0004 0160 03DC

        MVII    #$025C, R1                      ; 646E   02B9 025C

        JSR     R5,     L_63DC                  ; 6470   0004 0160 03DC

        MVII    #$0299, R1                      ; 6473   02B9 0299
        MVII    #$0003, R0                      ; 6475   02B8 0003

        JSR     R5,     L_63DC                  ; 6477   0004 0160 03DC

        MVII    #$02AD, R1                      ; 647A   02B9 02AD

        JSR     R5,     L_63DC                  ; 647C   0004 0160 03DC

        PULR    R7                              ; 647F   02B7

        DECLE   $0055,  $0021,  $0025,  $0029   ; 6480   0055 0021 0025 0029
        DECLE   $0029,  $032C,  $032C,  $002D   ; 6484   0029 032C 032C 002D
        DECLE   $0031,  $0035,  $0039,  $0039   ; 6488   0031 0035 0039 0039
        DECLE   $0330,  $0000,  $0000           ; 648C   0330 0000 0000

        SLLC    R1,     1                       ; 648F   0059
        SWAP    R1,     2                       ; 6490   0045
        RSWD    R5                              ; 6491   003D
        SLL     R1,     2                       ; 6492   004D
        SLL     R1,     1                       ; 6493   0049
        SWAP    R1,     1                       ; 6494   0041
        RLC     R1,     1                       ; 6495   0051
L_6496:
        PSHR    R5                              ; 6496   0275
        MVI     G_0168, R0                      ; 6497   0280 0168
        TSTR    R0                              ; 6499   0080
        BEQ     L_64A2                          ; 649A   0204 0006

        SDBD                                    ; 649C   0001
        MVII    #$1000, R3                      ; 649D   02BB 0000 0010
        B       L_64A4                          ; 64A0   0200 0002

L_64A2:
        MVII    #$0001, R3                      ; 64A2   02BB 0001
L_64A4:
        MVII    #$0002, R0                      ; 64A4   02B8 0002
        SDBD                                    ; 64A6   0001
        MVII    #$64C9, R4                      ; 64A7   02BC 00C9 0064
        MVII    #$0270, R1                      ; 64AA   02B9 0270

        JSR     R5,     L_63DC                  ; 64AC   0004 0160 03DC

        ADDI    #$0003, R1                      ; 64AF   02F9 0003
        DECR    R0                              ; 64B1   0010

        JSR     R5,     L_63DC                  ; 64B2   0004 0160 03DC

        MVII    #$02C0, R1                      ; 64B5   02B9 02C0
        ADDI    #$0002, R0                      ; 64B7   02F8 0002

        JSR     R5,     L_63DC                  ; 64B9   0004 0160 03DC

        MVII    #$02D4, R1                      ; 64BC   02B9 02D4
        DECR    R0                              ; 64BE   0010

        JSR     R5,     L_63DC                  ; 64BF   0004 0160 03DC

        ADDI    #$0003, R1                      ; 64C2   02F9 0003
        DECR    R0                              ; 64C4   0010

        JSR     R5,     L_63DC                  ; 64C5   0004 0160 03DC

        PULR    R7                              ; 64C8   02B7

        DECLE   $0001,  $0005                   ; 64C9   0001 0005

        INCR    R1                              ; 64CB   0009
        INCR    R5                              ; 64CC   000D
        DECR    R1                              ; 64CD   0011
        DECR    R5                              ; 64CE   0015
        COMR    R1                              ; 64CF   0019
        COMR    R5                              ; 64D0   001D
        INCR    R1                              ; 64D1   0009
L_64D2:
        PSHR    R5                              ; 64D2   0275
        MVI     G_0168, R0                      ; 64D3   0280 0168
        TSTR    R0                              ; 64D5   0080
        BEQ     L_64DE                          ; 64D6   0204 0006

        SDBD                                    ; 64D8   0001
        MVII    #$1002, R3                      ; 64D9   02BB 0002 0010
        B       L_64E0                          ; 64DC   0200 0002

L_64DE:
        MVII    #$0001, R3                      ; 64DE   02BB 0001
L_64E0:
        MVII    #$0002, R0                      ; 64E0   02B8 0002
        SDBD                                    ; 64E2   0001
        MVII    #$64F6, R4                      ; 64E3   02BC 00F6 0064
        MVII    #$0273, R1                      ; 64E6   02B9 0273

        JSR     R5,     L_63DC                  ; 64E8   0004 0160 03DC

        MVII    #$02C3, R1                      ; 64EB   02B9 02C3

        JSR     R5,     L_63DC                  ; 64ED   0004 0160 03DC

        MVII    #$02D7, R1                      ; 64F0   02B9 02D7

        JSR     R5,     L_63DC                  ; 64F2   0004 0160 03DC

        PULR    R7                              ; 64F5   02B7

        MOVR    R5,     R1                      ; 64F6   00A9
        TSTR    R5                              ; 64F7   00AD
        MOVR    R6,     R1                      ; 64F8   00B1
        MOVR    R6,     R5                      ; 64F9   00B5
        MOVR    R7,     R1                      ; 64FA   00B9
        MOVR    R7,     R5                      ; 64FB   00BD
L_64FC:
        PSHR    R5                              ; 64FC   0275
        SDBD                                    ; 64FD   0001
        MVII    #$22F8, R3                      ; 64FE   02BB 00F8 0022
        MVII    #$020F, R4                      ; 6501   02BC 020F
        MVO@    R3,     R4                      ; 6503   0263
        MVO@    R3,     R4                      ; 6504   0263
        MVO@    R3,     R4                      ; 6505   0263
        MVII    #$023B, R4                      ; 6506   02BC 023B
        MVO@    R3,     R4                      ; 6508   0263
        MVO@    R3,     R4                      ; 6509   0263
        MVII    #$02C6, R4                      ; 650A   02BC 02C6
        MVO@    R3,     R4                      ; 650C   0263
        MVO@    R3,     R4                      ; 650D   0263
        MVO@    R3,     R4                      ; 650E   0263
        MVII    #$0004, R3                      ; 650F   02BB 0004
        SDBD                                    ; 6511   0001
        MVII    #$6589, R4                      ; 6512   02BC 0089 0065
        MVII    #$023D, R1                      ; 6515   02B9 023D
        MVII    #$0009, R0                      ; 6517   02B8 0009

L_6519:
        JSR     R5,     L_63DC                  ; 6519   0004 0160 03DC

        ADDI    #$000B, R1                      ; 651C   02F9 000B
        CMPI    #$02D1, R1                      ; 651E   0379 02D1
        BLT     L_6519                          ; 6520   0225 0008

        MVII    #$0319, R4                      ; 6522   02BC 0319

        JSR     R5,     L_D0AE                  ; 6524   0004 01D0 00AE
        DECLE   $0000,  $0002,  $0000,  $0000   ; 6527   0000 0002 0000 0000

        MOVR    R2,     R7                      ; 652B   0097

        INCR    R1                              ; 652C   0009

        JSR     R5,     L_D0AE                  ; 652D   0004 01D0 00AE

        GSWD    R0                              ; 6530   0030
        EIS                                     ; 6531   0002
        MOVR    R3,     R7                      ; 6532   009F

        EIS                                     ; 6533   0002
        TSTR    R6                              ; 6534   00B6
        INCR    R1                              ; 6535   0009

        JSR     R5,     L_D0AE                  ; 6536   0004 01D0 00AE
        DECLE   $0030,  $0002,  $00BF           ; 6539   0030 0002 00BF

        EIS                                     ; 653C   0002
        ADDR    R0,     R6                      ; 653D   00C6
        INCR    R1                              ; 653E   0009

        JSR     R5,     L_D0AE                  ; 653F   0004 01D0 00AE

        GSWD    R0                              ; 6542   0030
        EIS                                     ; 6543   0002
        MOVR    R3,     R7                      ; 6544   009F

        EIS                                     ; 6545   0002
        ADDR    R2,     R2                      ; 6546   00D2
        INCR    R1                              ; 6547   0009

        JSR     R5,     L_D0AE                  ; 6548   0004 01D0 00AE
        DECLE   $0030,  $0002,  $00BF           ; 654B   0030 0002 00BF

        EIS                                     ; 654E   0002
        ADDR    R4,     R2                      ; 654F   00E2
        INCR    R1                              ; 6550   0009

        JSR     R5,     L_D0AE                  ; 6551   0004 01D0 00AE

        GSWD    R1                              ; 6554   0031
        EIS                                     ; 6555   0002
        MOVR    R4,     R0                      ; 6556   00A0
        DIS                                     ; 6557   0003
        MOVR    R4,     R7                      ; 6558   00A7

        INCR    R1                              ; 6559   0009
        MVI     G_017A, R0                      ; 655A   0280 017A
        CMPI    #$0028, R0                      ; 655C   0378 0028
        BLT     L_657F                          ; 655E   0205 001F

        CMPI    #$0050, R0                      ; 6560   0378 0050
        BLT     L_6576                          ; 6562   0205 0012

        CMPI    #$0078, R0                      ; 6564   0378 0078
        BLT     L_656D                          ; 6566   0205 0005

        MVII    #$0319, R1                      ; 6568   02B9 0319

        JSR     R5,     L_5F45                  ; 656A   0004 015C 0345

L_656D:
        MVII    #$031A, R1                      ; 656D   02B9 031A

        JSR     R5,     L_5F45                  ; 656F   0004 015C 0345

        INCR    R1                              ; 6572   0009

        JSR     R5,     L_5F45                  ; 6573   0004 015C 0345

L_6576:
        MVII    #$031C, R1                      ; 6576   02B9 031C

        JSR     R5,     L_5F45                  ; 6578   0004 015C 0345

        INCR    R1                              ; 657B   0009

        JSR     R5,     L_5F45                  ; 657C   0004 015C 0345

L_657F:
        CLRR    R1                              ; 657F   01C9
        MVI     G_0340, R0                      ; 6580   0280 0340
        TSTR    R0                              ; 6582   0080
        BMI     L_6586                          ; 6583   020B 0001

        INCR    R1                              ; 6585   0009
L_6586:
        MVO     R1,     G_016D                  ; 6586   0241 016D
        PULR    R7                              ; 6588   02B7

        DECLE   $01E2,  $01A0,  $01A4,  $01E4   ; 6589   01E2 01A0 01A4 01E4
        DECLE   $0238                           ; 658D   0238

        PSHR    R4                              ; 658E   0274
        ANDR    R2,     R0                      ; 658F   0190
        XORR    R1,     R4                      ; 6590   01CC
        EIS                                     ; 6591   0002
        SLLC    R3,     2                       ; 6592   005F
        XORR    R1,     R0                      ; 6593   01C8
        MOVR    R3,     R7                      ; 6594   009F

        SLR     R3,     1                       ; 6595   0063
        SLR     R1,     2                       ; 6596   0065
        SAR     R1,     1                       ; 6597   0069
        CMPR    R7,     R4                      ; 6598   017C
        SLR     R1,     1                       ; 6599   0061
        EIS                                     ; 659A   0002
        XORR    R4,     R2                      ; 659B   01E2
        CLRR    R0                              ; 659C   01C0
        CMPR    R7,     R4                      ; 659D   017C
        CMPR    R7,     R4                      ; 659E   017C
        MVO@    R4,     R5                      ; 659F   026C
        MVO@    R0,     R5                      ; 65A0   0268
        MOVR    R4,     R7                      ; 65A1   00A7

        CMPR    R7,     R6                      ; 65A2   017E
        EIS                                     ; 65A3   0002
        SAR     R3,     2                       ; 65A4   006F
        CMPR    R7,     R4                      ; 65A5   017C
        CMPR    R7,     R4                      ; 65A6   017C
        TSTR    R3                              ; 65A7   009B
        MOVR    R3,     R5                      ; 65A8   009D
        CMPR    R7,     R4                      ; 65A9   017C
        CMPR    R7,     R4                      ; 65AA   017C
        RRC     R3,     1                       ; 65AB   0073
        EIS                                     ; 65AC   0002
        RRC     R3,     2                       ; 65AD   0077
        CMPR    R7,     R4                      ; 65AE   017C
        CMPR    R7,     R4                      ; 65AF   017C
        MOVR    R4,     R7                      ; 65B0   00A7

        MOVR    R4,     R1                      ; 65B1   00A1
        CMPR    R7,     R4                      ; 65B2   017C
        MOVR    R2,     R3                      ; 65B3   0093
        SARC    R1,     1                       ; 65B4   0079
        EIS                                     ; 65B5   0002
        CMPR    R7,     R6                      ; 65B6   017E
        MOVR    R4,     R7                      ; 65B7   00A7
        MOVR    R0,     R7                      ; 65B8   0087

        DECLE   $008D,  $017C,  $017C,  $00A5   ; 65B9   008D 017C 017C 00A5
        DECLE   $01CC,  $0002,  $0083,  $017C   ; 65BD   01CC 0002 0083 017C
        DECLE   $007D,  $0260,  $0089,  $0081   ; 65C1   007D 0260 0089 0081
        DECLE   $00A3,  $007F,  $0002,  $0000   ; 65C5   00A3 007F 0002 0000
        DECLE   $0238,  $0095,  $023C,  $0000   ; 65C9   0238 0095 023C 0000
        DECLE   $0248,  $023C,  $0000           ; 65CD   0248 023C 0000

        EIS                                     ; 65D0   0002
L_65D1:
        PSHR    R5                              ; 65D1   0275
        SDBD                                    ; 65D2   0001
        MVII    #$18BA, R3                      ; 65D3   02BB 00BA 0018
        MVII    #$02A7, R4                      ; 65D6   02BC 02A7
        MVO@    R3,     R4                      ; 65D8   0263
        MVO@    R3,     R4                      ; 65D9   0263
        ADDI    #$0012, R4                      ; 65DA   02FC 0012
        MVO@    R3,     R4                      ; 65DC   0263
        MVO@    R3,     R4                      ; 65DD   0263
        ADDI    #$0012, R4                      ; 65DE   02FC 0012
        MVO@    R3,     R4                      ; 65E0   0263
        MVO@    R3,     R4                      ; 65E1   0263
        PULR    R7                              ; 65E2   02B7

L_65E3:
        PSHR    R5                              ; 65E3   0275
        MVII    #$0005, R3                      ; 65E4   02BB 0005
        SDBD                                    ; 65E6   0001
        MVII    #$65FC, R4                      ; 65E7   02BC 00FC 0065
        MVII    #$02A5, R1                      ; 65EA   02B9 02A5
        MVII    #$0002, R0                      ; 65EC   02B8 0002

        JSR     R5,     L_63DC                  ; 65EE   0004 0160 03DC

        ADDI    #$0012, R1                      ; 65F1   02F9 0012

        JSR     R5,     L_63DC                  ; 65F3   0004 0160 03DC

        ADDI    #$0012, R1                      ; 65F6   02F9 0012

        JSR     R5,     L_63DC                  ; 65F8   0004 0160 03DC

        PULR    R7                              ; 65FB   02B7

        SLLC    R1,     2                       ; 65FC   005D
        RRC     R1,     1                       ; 65FD   0071
        SLLC    R1,     2                       ; 65FE   005D
        RRC     R1,     1                       ; 65FF   0071
        SLLC    R1,     2                       ; 6600   005D
        RRC     R1,     1                       ; 6601   0071
L_6602:
        PSHR    R5                              ; 6602   0275
        SDBD                                    ; 6603   0001
        MVII    #$2000, R2                      ; 6604   02BA 0000 0020
        SDBD                                    ; 6607   0001
        MVII    #$28E1, R0                      ; 6608   02B8 00E1 0028
        SDBD                                    ; 660B   0001
        MVII    #$08B9, R1                      ; 660C   02B9 00B9 0008
        MVII    #$02A1, R4                      ; 660F   02BC 02A1
        MVO@    R1,     R4                      ; 6611   0261
        XORR    R2,     R1                      ; 6612   01D1
        MVO@    R1,     R4                      ; 6613   0261
        MVO@    R1,     R4                      ; 6614   0261
        MVO@    R0,     R4                      ; 6615   0260
        ADDI    #$0004, R4                      ; 6616   02FC 0004
        MVI@    R4,     R3                      ; 6618   02A3
        XORR    R2,     R3                      ; 6619   01D3
        DECR    R4                              ; 661A   0014
        MVO@    R3,     R4                      ; 661B   0263
        ADDI    #$000B, R4                      ; 661C   02FC 000B
        XORR    R2,     R1                      ; 661E   01D1
        MVO@    R1,     R4                      ; 661F   0261
        ADDI    #$000A, R0                      ; 6620   02F8 000A
        MVO@    R0,     R4                      ; 6622   0260
        XORR    R2,     R1                      ; 6623   01D1
        MVO@    R1,     R4                      ; 6624   0261
        SUBI    #$000A, R0                      ; 6625   0338 000A
        MVO@    R0,     R4                      ; 6627   0260
        ADDI    #$0004, R4                      ; 6628   02FC 0004
        MVI@    R4,     R3                      ; 662A   02A3
        XORR    R2,     R3                      ; 662B   01D3
        DECR    R4                              ; 662C   0014
        MVO@    R3,     R4                      ; 662D   0263
        SDBD                                    ; 662E   0001
        MVII    #$28B8, R5                      ; 662F   02BD 00B8 0028
        ADDI    #$0008, R4                      ; 6632   02FC 0008
        MVO@    R5,     R4                      ; 6634   0265
        MVO@    R5,     R4                      ; 6635   0265
        SUBI    #$0001, R0                      ; 6636   0338 0001
        MVO@    R0,     R4                      ; 6638   0260
        SDBD                                    ; 6639   0001
        MVII    #$08F2, R1                      ; 663A   02B9 00F2 0008
        MVO@    R1,     R4                      ; 663D   0261
        ADDI    #$0008, R1                      ; 663E   02F9 0008
        MVO@    R1,     R4                      ; 6640   0261
        ADDI    #$0008, R1                      ; 6641   02F9 0008
        MVO@    R1,     R4                      ; 6643   0261
        SDBD                                    ; 6644   0001
        MVII    #$08DB, R3                      ; 6645   02BB 00DB 0008
        MVO@    R3,     R4                      ; 6648   0263
        ADDI    #$0004, R4                      ; 6649   02FC 0004
        MVI@    R4,     R3                      ; 664B   02A3
        XORR    R2,     R3                      ; 664C   01D3
        DECR    R4                              ; 664D   0014
        MVO@    R3,     R4                      ; 664E   0263
        PULR    R7                              ; 664F   02B7

L_6650:
        PSHR    R5                              ; 6650   0275
        MVII    #$02F9, R3                      ; 6651   02BB 02F9
        MVII    #$02A1, R1                      ; 6653   02B9 02A1
L_6655:
        MVII    #$0004, R0                      ; 6655   02B8 0004
L_6657:
        MVI@    R1,     R2                      ; 6657   028A
        SDBD                                    ; 6658   0001
        ANDI    #$2000, R2                      ; 6659   03BA 0000 0020
        XORR    R3,     R2                      ; 665C   01DA
        MVO@    R2,     R1                      ; 665D   024A
        INCR    R1                              ; 665E   0009
        CMPI    #$02CC, R1                      ; 665F   0379 02CC
        BGT     L_666A                          ; 6661   020E 0007

        DECR    R0                              ; 6663   0010
        BNEQ    L_6657                          ; 6664   022C 000E

        ADDI    #$0010, R1                      ; 6666   02F9 0010
        B       L_6655                          ; 6668   0220 0014

L_666A:
        MVII    #$031B, R1                      ; 666A   02B9 031B

        JSR     R5,     L_5F45                  ; 666C   0004 015C 0345

        INCR    R1                              ; 666F   0009

        JSR     R5,     L_5F45                  ; 6670   0004 015C 0345

        PULR    R7                              ; 6673   02B7

L_6674:
        PSHR    R5                              ; 6674   0275
        SDBD                                    ; 6675   0001
        MVII    #$2000, R2                      ; 6676   02BA 0000 0020
        SDBD                                    ; 6679   0001
        MVII    #$18B8, R1                      ; 667A   02B9 00B8 0018
        MVII    #$023D, R4                      ; 667D   02BC 023D
        MVII    #$0008, R0                      ; 667F   02B8 0008

        JSR     R5,     X_FILL_MEM              ; 6681   0004 0114 0341

        ADDI    #$000C, R4                      ; 6684   02FC 000C
        MVO@    R1,     R4                      ; 6686   0261
        SDBD                                    ; 6687   0001
        MVII    #$08B9, R1                      ; 6688   02B9 00B9 0008
        MVO@    R1,     R4                      ; 668B   0261
        MVO@    R1,     R4                      ; 668C   0261
        XORR    R2,     R1                      ; 668D   01D1
        MVO@    R1,     R4                      ; 668E   0261
        SDBD                                    ; 668F   0001
        MVII    #$2942, R1                      ; 6690   02B9 0042 0029
        MVO@    R1,     R4                      ; 6693   0261
        MVO@    R1,     R4                      ; 6694   0261
        XORR    R2,     R1                      ; 6695   01D1
        MVO@    R1,     R4                      ; 6696   0261
        MVO@    R1,     R4                      ; 6697   0261
        MVI@    R4,     R3                      ; 6698   02A3
        XORR    R2,     R3                      ; 6699   01D3
        DECR    R4                              ; 669A   0014
        MVO@    R3,     R4                      ; 669B   0263
        ADDI    #$000B, R4                      ; 669C   02FC 000B
        SDBD                                    ; 669E   0001
        MVII    #$18B8, R1                      ; 669F   02B9 00B8 0018
        MVO@    R1,     R4                      ; 66A2   0261
        SDBD                                    ; 66A3   0001
        MVII    #$08B9, R1                      ; 66A4   02B9 00B9 0008
        MVO@    R1,     R4                      ; 66A7   0261
        MVO@    R1,     R4                      ; 66A8   0261
        XORR    R2,     R1                      ; 66A9   01D1
        MVO@    R1,     R4                      ; 66AA   0261
        MVO@    R1,     R4                      ; 66AB   0261
        SDBD                                    ; 66AC   0001
        MVII    #$38B8, R1                      ; 66AD   02B9 00B8 0038
        MVO@    R1,     R4                      ; 66B0   0261
        SDBD                                    ; 66B1   0001
        MVII    #$088A, R1                      ; 66B2   02B9 008A 0008
        MVO@    R1,     R4                      ; 66B5   0261
        SUBI    #$0010, R1                      ; 66B6   0339 0010
        MVO@    R1,     R4                      ; 66B8   0261
        MVI@    R4,     R3                      ; 66B9   02A3
        XORR    R2,     R3                      ; 66BA   01D3
        DECR    R4                              ; 66BB   0014
        MVO@    R3,     R4                      ; 66BC   0263
        MVII    #$0279, R4                      ; 66BD   02BC 0279
        MVII    #$0006, R0                      ; 66BF   02B8 0006

        JSR     R5,     X_FILL_ZERO             ; 66C1   0004 0114 0338

        ADDI    #$0018, R1                      ; 66C4   02F9 0018
        MVO@    R1,     R4                      ; 66C6   0261
        SUBI    #$0010, R1                      ; 66C7   0339 0010
        MVO@    R1,     R4                      ; 66C9   0261
        SDBD                                    ; 66CA   0001
        MVII    #$18C5, R1                      ; 66CB   02B9 00C5 0018
        MVII    #$0008, R0                      ; 66CE   02B8 0008
        ADDI    #$000C, R4                      ; 66D0   02FC 000C

        JSR     R5,     X_FILL_MEM              ; 66D2   0004 0114 0341

        PULR    R7                              ; 66D5   02B7

L_66D6:
        PSHR    R5                              ; 66D6   0275
        MVI     G_0168, R0                      ; 66D7   0280 0168
        CMPI    #$0007, R0                      ; 66D9   0378 0007
        BEQ     L_66E3                          ; 66DB   0204 0006

        MVI     G_0166, R0                      ; 66DD   0280 0166
        ANDI    #$0003, R0                      ; 66DF   03B8 0003
        BNEQ    L_68AC                          ; 66E1   020C 01C9

L_66E3:
        MVI     G_01D2, R0                      ; 66E3   0280 01D2
        DECR    R0                              ; 66E5   0010
        BMI     L_68AC                          ; 66E6   020B 01C4

        MVO     R0,     G_01D2                  ; 66E8   0240 01D2
        BNEQ    L_6791                          ; 66EA   020C 00A5

        MVI     G_0177, R1                      ; 66EC   0281 0177
        MVI     G_0178, R2                      ; 66EE   0282 0178
        MVI     G_0179, R3                      ; 66F0   0283 0179
        MVI     G_01D3, R0                      ; 66F2   0280 01D3
        XORI    #$0001, R0                      ; 66F4   03F8 0001
        MVO     R0,     G_01D3                  ; 66F6   0240 01D3
        BEQ     L_6736                          ; 66F8   0204 003C

        MVII    #$0008, R0                      ; 66FA   02B8 0008
        MVO     R0,     G_01D2                  ; 66FC   0240 01D2
        CMPI    #$0028, R1                      ; 66FE   0379 0028
        BLE     L_670E                          ; 6700   0206 000C

        CMPI    #$0050, R1                      ; 6702   0379 0050
        BLE     L_670A                          ; 6704   0206 0004

        MVII    #$0002, R0                      ; 6706   02B8 0002
        B       L_6710                          ; 6708   0200 0006

L_670A:
        MVII    #$0006, R0                      ; 670A   02B8 0006
        B       L_6710                          ; 670C   0200 0002

L_670E:
        MVII    #$0005, R0                      ; 670E   02B8 0005
L_6710:
        CMPI    #$0028, R2                      ; 6710   037A 0028
        BLE     L_6720                          ; 6712   0206 000C

        CMPI    #$0050, R2                      ; 6714   037A 0050
        BLE     L_671C                          ; 6716   0206 0004

        MVII    #$0002, R1                      ; 6718   02B9 0002
        B       L_6722                          ; 671A   0200 0006

L_671C:
        MVII    #$0006, R1                      ; 671C   02B9 0006
        B       L_6722                          ; 671E   0200 0002

L_6720:
        MVII    #$0005, R1                      ; 6720   02B9 0005
L_6722:
        CMPI    #$0028, R3                      ; 6722   037B 0028
        BLE     L_6732                          ; 6724   0206 000C

        CMPI    #$0050, R3                      ; 6726   037B 0050
        BLE     L_672E                          ; 6728   0206 0004

        MVII    #$0002, R2                      ; 672A   02BA 0002
        B       L_6754                          ; 672C   0200 0026

L_672E:
        MVII    #$0006, R2                      ; 672E   02BA 0006
        B       L_6754                          ; 6730   0200 0022

L_6732:
        MVII    #$0005, R2                      ; 6732   02BA 0005
        B       L_6754                          ; 6734   0200 001E

L_6736:
        MVII    #$000C, R0                      ; 6736   02B8 000C
        MVO     R0,     G_01D2                  ; 6738   0240 01D2
        MVII    #$0001, R0                      ; 673A   02B8 0001
        CMPI    #$0078, R1                      ; 673C   0379 0078
        BLT     L_6742                          ; 673E   0205 0002

        MVII    #$0002, R0                      ; 6740   02B8 0002
L_6742:
        MVII    #$0001, R1                      ; 6742   02B9 0001
        CMPI    #$0078, R2                      ; 6744   037A 0078
        BLT     L_674A                          ; 6746   0205 0002

        MVII    #$0002, R1                      ; 6748   02B9 0002
L_674A:
        MVII    #$0001, R2                      ; 674A   02BA 0001
        CMPI    #$0078, R3                      ; 674C   037B 0078
        BLT     L_6754                          ; 674E   0205 0004

        MVII    #$0002, R2                      ; 6750   02BA 0002
        B       L_6754                          ; 6752   0200 0000

L_6754:
        MVII    #$024A, R3                      ; 6754   02BB 024A
        MVI@    R3,     R4                      ; 6756   029C
        SDBD                                    ; 6757   0001
        ANDI    #$FFF8, R4                      ; 6758   03BC 00F8 00FF
        XORR    R0,     R4                      ; 675B   01C4
        MVO@    R4,     R3                      ; 675C   025C
        INCR    R3                              ; 675D   000B
        MVI@    R3,     R4                      ; 675E   029C
        SDBD                                    ; 675F   0001
        ANDI    #$FFF8, R4                      ; 6760   03BC 00F8 00FF
        XORR    R0,     R4                      ; 6763   01C4
        MVO@    R4,     R3                      ; 6764   025C
        INCR    R3                              ; 6765   000B
        MVI@    R3,     R4                      ; 6766   029C
        SDBD                                    ; 6767   0001
        ANDI    #$FFF8, R4                      ; 6768   03BC 00F8 00FF
        XORR    R0,     R4                      ; 676B   01C4
        MVO@    R4,     R3                      ; 676C   025C
        ADDI    #$0003, R3                      ; 676D   02FB 0003
        MVI@    R3,     R4                      ; 676F   029C
        SDBD                                    ; 6770   0001
        ANDI    #$FFF8, R4                      ; 6771   03BC 00F8 00FF
        XORR    R1,     R4                      ; 6774   01CC
        MVO@    R4,     R3                      ; 6775   025C
        ADDI    #$0014, R3                      ; 6776   02FB 0014
        MVI@    R3,     R4                      ; 6778   029C
        SDBD                                    ; 6779   0001
        ANDI    #$FFF8, R4                      ; 677A   03BC 00F8 00FF
        XORR    R1,     R4                      ; 677D   01CC
        MVO@    R4,     R3                      ; 677E   025C
        ADDI    #$0036, R3                      ; 677F   02FB 0036
        MVI@    R3,     R4                      ; 6781   029C
        SDBD                                    ; 6782   0001
        ANDI    #$FFF8, R4                      ; 6783   03BC 00F8 00FF
        XORR    R2,     R4                      ; 6786   01D4
        MVO@    R4,     R3                      ; 6787   025C
        ADDI    #$0002, R3                      ; 6788   02FB 0002
        MVI@    R3,     R4                      ; 678A   029C
        SDBD                                    ; 678B   0001
        ANDI    #$FFF8, R4                      ; 678C   03BC 00F8 00FF
        XORR    R2,     R4                      ; 678F   01D4
        MVO@    R4,     R3                      ; 6790   025C
L_6791:
        MVI     G_0166, R0                      ; 6791   0280 0166
        ANDI    #$0007, R0                      ; 6793   03B8 0007
        BNEQ    L_68AC                          ; 6795   020C 0115

        MVII    #$0270, R1                      ; 6797   02B9 0270
        MVI@    R1,     R0                      ; 6799   0288
        SDBD                                    ; 679A   0001
        XORI    #$8000, R0                      ; 679B   03F8 0000 0080
        MVO@    R0,     R1                      ; 679E   0248
        TSTR    R0                              ; 679F   0080
        BMI     L_67D4                          ; 67A0   020B 0032

        SDBD                                    ; 67A2   0001
        MVII    #$1000, R3                      ; 67A3   02BB 0000 0010
        MVII    #$016E, R4                      ; 67A6   02BC 016E
        SDBD                                    ; 67A8   0001
        MVI@    R4,     R0                      ; 67A9   02A0
        TSTR    R0                              ; 67AA   0080
        BPL     L_67AF                          ; 67AB   0203 0002

        MVII    #$0002, R3                      ; 67AD   02BB 0002

L_67AF:
        JSR     R5,     L_67F9                  ; 67AF   0004 0164 03F9

        ADDI    #$004D, R1                      ; 67B2   02F9 004D
        SDBD                                    ; 67B4   0001
        MVII    #$1000, R3                      ; 67B5   02BB 0000 0010
        SDBD                                    ; 67B8   0001
        MVI@    R4,     R0                      ; 67B9   02A0
        TSTR    R0                              ; 67BA   0080
        BNEQ    L_67BF                          ; 67BB   020C 0002

        MVII    #$0002, R3                      ; 67BD   02BB 0002

L_67BF:
        JSR     R5,     L_67F9                  ; 67BF   0004 0164 03F9

        ADDI    #$0011, R1                      ; 67C2   02F9 0011
        SDBD                                    ; 67C4   0001
        MVII    #$1000, R3                      ; 67C5   02BB 0000 0010
        SDBD                                    ; 67C8   0001
        MVI@    R4,     R0                      ; 67C9   02A0
        TSTR    R0                              ; 67CA   0080
        BNEQ    L_67CF                          ; 67CB   020C 0002

        MVII    #$0002, R3                      ; 67CD   02BB 0002

L_67CF:
        JSR     R5,     L_67F9                  ; 67CF   0004 0164 03F9

        B       L_68AC                          ; 67D2   0200 00D8

L_67D4:
        MVII    #$0002, R3                      ; 67D4   02BB 0002
        MVII    #$016E, R4                      ; 67D6   02BC 016E
        SDBD                                    ; 67D8   0001
        MVI@    R4,     R0                      ; 67D9   02A0
        CMPI    #$0032, R0                      ; 67DA   0378 0032
        BGT     L_67E1                          ; 67DC   020E 0003

        JSR     R5,     L_67F9                  ; 67DE   0004 0164 03F9

L_67E1:
        SDBD                                    ; 67E1   0001
        MVI@    R4,     R0                      ; 67E2   02A0
        CMPI    #$0032, R0                      ; 67E3   0378 0032
        BGT     L_67EC                          ; 67E5   020E 0005

        MVII    #$02C0, R1                      ; 67E7   02B9 02C0

        JSR     R5,     L_67F9                  ; 67E9   0004 0164 03F9

L_67EC:
        SDBD                                    ; 67EC   0001
        MVI@    R4,     R0                      ; 67ED   02A0
        CMPI    #$0032, R0                      ; 67EE   0378 0032
        BGT     L_68AC                          ; 67F0   020E 00BA

        MVII    #$02D4, R1                      ; 67F2   02B9 02D4

        JSR     R5,     L_67F9                  ; 67F4   0004 0164 03F9

        B       L_68AC                          ; 67F7   0200 00B3

L_67F9:
        PSHR    R5                              ; 67F9   0275
        MVII    #$0003, R0                      ; 67FA   02B8 0003
L_67FC:
        MVI@    R1,     R2                      ; 67FC   028A
        SDBD                                    ; 67FD   0001
        ANDI    #$EFF8, R2                      ; 67FE   03BA 00F8 00EF
        XORR    R3,     R2                      ; 6801   01DA
        MVO@    R2,     R1                      ; 6802   024A
        INCR    R1                              ; 6803   0009
        DECR    R0                              ; 6804   0010
        BNEQ    L_67FC                          ; 6805   022C 000A
        PULR    R7                              ; 6807   02B7

L_6808:
        PSHR    R5                              ; 6808   0275
        MVI     G_031E, R1                      ; 6809   0281 031E
        MVI     G_016D, R3                      ; 680B   0283 016D
        TSTR    R3                              ; 680D   009B
        BEQ     L_6819                          ; 680E   0204 0009

        SUBI    #$0002, R1                      ; 6810   0339 0002
        CMPI    #$0210, R1                      ; 6812   0379 0210
        BGT     L_6822                          ; 6814   020E 000C

        DECR    R3                              ; 6816   0013
        B       L_6824                          ; 6817   0200 000B

L_6819:
        ADDI    #$0002, R1                      ; 6819   02F9 0002
        CMPI    #$024F, R1                      ; 681B   0379 024F
        BLT     L_6822                          ; 681D   0205 0003

        INCR    R3                              ; 681F   000B
        B       L_6824                          ; 6820   0200 0002

L_6822:
        MVO     R1,     G_031E                  ; 6822   0241 031E
L_6824:
        MVO     R3,     G_016D                  ; 6824   0243 016D
        MOVR    R1,     R2                      ; 6826   008A
        SARC    R2,     2                       ; 6827   007E
        BNC     L_68AC                          ; 6828   0209 0082
        BNOV    L_68AC                          ; 682A   020A 0080

        MVII    #$0183, R4                      ; 682C   02BC 0183
        MVII    #$0004, R0                      ; 682E   02B8 0004

        JSR     R5,     X_FILL_ZERO             ; 6830   0004 0114 0338

        ANDI    #$00FF, R1                      ; 6833   03B9 00FF
        TSTR    R3                              ; 6835   009B
        BEQ     L_683A                          ; 6836   0204 0002

        SUBI    #$0004, R1                      ; 6838   0339 0004
L_683A:
        INCR    R1                              ; 683A   0009
        MVII    #$031A, R4                      ; 683B   02BC 031A
        MVII    #$0004, R0                      ; 683D   02B8 0004

        JSR     R5,     X_FILL_MEM              ; 683F   0004 0114 0341

        SLR     R1,     2                       ; 6842   0065
        SUBI    #$0004, R1                      ; 6843   0339 0004
        MVII    #$0124, R4                      ; 6845   02BC 0124
        SLL     R1,     1                       ; 6847   0049
        ADDR    R1,     R4                      ; 6848   00CC
        SDBD                                    ; 6849   0001
        MVI@    R4,     R0                      ; 684A   02A0
        MVO     R0,     G_0185                  ; 684B   0240 0185
        SWAP    R0,     1                       ; 684D   0040
        MVO     R0,     G_0186                  ; 684E   0240 0186
        SLR     R1,     1                       ; 6850   0061
        SWAP    R1,     1                       ; 6851   0041
        SLR     R1,     1                       ; 6852   0061
        MOVR    R1,     R2                      ; 6853   008A
        ADDI    #$0080, R2                      ; 6854   02FA 0080
        MVII    #$0347, R4                      ; 6856   02BC 0347
        CLRR    R3                              ; 6858   01DB
L_6859:
        MVI@    R4,     R0                      ; 6859   02A0
        SLR     R0,     2                       ; 685A   0064
        SLR     R0,     2                       ; 685B   0064
        NOP                                     ; 685C   0034
        SLR     R0,     1                       ; 685D   0060
        CMPR    R1,     R0                      ; 685E   0148
        BLT     L_6885                          ; 685F   0205 0024

        CMPR    R2,     R0                      ; 6861   0150
        BGE     L_6885                          ; 6862   020D 0021

        PSHR    R1                              ; 6864   0271
        MOVR    R4,     R1                      ; 6865   00A1
        DECR    R1                              ; 6866   0011
        SUBI    #$0347, R1                      ; 6867   0339 0347
        PSHR    R1                              ; 6869   0271
        SLL     R1,     1                       ; 686A   0049
        ADD@    R6,     R1                      ; 686B   02F1
        ADDI    #$0193, R1                      ; 686C   02F9 0193
        INCR    R1                              ; 686E   0009
        MVI@    R1,     R5                      ; 686F   028D
        PULR    R1                              ; 6870   02B1
        TSTR    R5                              ; 6871   00AD
        BEQ     L_6885                          ; 6872   0204 0011

        MVI@    R4,     R0                      ; 6874   02A0
        SLR     R0,     2                       ; 6875   0064
        SLR     R0,     2                       ; 6876   0064
        NOP                                     ; 6877   0034
        SLR     R0,     1                       ; 6878   0060
        SLL     R0,     1                       ; 6879   0048
        SWAP    R0,     1                       ; 687A   0040
        ANDI    #$000F, R0                      ; 687B   03B8 000F

        JSR     R5,     X_POW2                  ; 687D   0004 0114 0345

        COMR    R0                              ; 6880   0018
        ANDR    R0,     R3                      ; 6881   0183
        COMR    R0                              ; 6882   0018
        XORR    R0,     R3                      ; 6883   01C3
        INCR    R7                              ; 6884   000F

L_6885:
        INCR    R4                              ; 6885   000C
L_6886:
        CMPI    #$0357, R4                      ; 6886   037C 0357
        BLT     L_6859                          ; 6888   0225 0030

        MVO     R3,     G_0183                  ; 688A   0243 0183
        SWAP    R3,     1                       ; 688C   0043
        MVO     R3,     G_0184                  ; 688D   0243 0184
        MVI     G_017A, R0                      ; 688F   0280 017A
        CMPI    #$0028, R0                      ; 6891   0378 0028
        BLT     L_689A                          ; 6893   0205 0005

        CMPI    #$0050, R0                      ; 6895   0378 0050
        BLT     L_68A3                          ; 6897   0205 000A
        PULR    R7                              ; 6899   02B7

L_689A:
        MVII    #$031C, R1                      ; 689A   02B9 031C

        JSR     R5,     L_5F45                  ; 689C   0004 015C 0345

        INCR    R1                              ; 689F   0009

        JSR     R5,     L_5F45                  ; 68A0   0004 015C 0345

L_68A3:
        MVII    #$031A, R1                      ; 68A3   02B9 031A

        JSR     R5,     L_5F45                  ; 68A5   0004 015C 0345

        INCR    R1                              ; 68A8   0009

        JSR     R5,     L_5F45                  ; 68A9   0004 015C 0345

L_68AC:
        PULR    R7                              ; 68AC   02B7

L_68AD:
        PSHR    R5                              ; 68AD   0275
        MVII    #$0200, R1                      ; 68AE   02B9 0200
        CLRR    R2                              ; 68B0   01D2
        SDBD                                    ; 68B1   0001
        MVII    #$3950, R4                      ; 68B2   02BC 0050 0039
        SDBD                                    ; 68B5   0001
        MVII    #$3958, R5                      ; 68B6   02BD 0058 0039
        MVO@    R2,     R4                      ; 68B9   0262
        MVO@    R2,     R5                      ; 68BA   026A
        MVI@    R1,     R0                      ; 68BB   0288
        MVO@    R0,     R4                      ; 68BC   0260
        SWAP    R0,     1                       ; 68BD   0040
        MVO@    R0,     R5                      ; 68BE   0268
        INCR    R1                              ; 68BF   0009
        MVI@    R1,     R0                      ; 68C0   0288
        MVO@    R0,     R4                      ; 68C1   0260
        SWAP    R0,     1                       ; 68C2   0040
        MVO@    R0,     R5                      ; 68C3   0268
        INCR    R1                              ; 68C4   0009
        MVI@    R1,     R0                      ; 68C5   0288
        MVO@    R0,     R4                      ; 68C6   0260
        SWAP    R0,     1                       ; 68C7   0040
        MVO@    R0,     R5                      ; 68C8   0268
        INCR    R1                              ; 68C9   0009
        MVI@    R1,     R0                      ; 68CA   0288
        MVO@    R0,     R4                      ; 68CB   0260
        SWAP    R0,     1                       ; 68CC   0040
        MVO@    R0,     R5                      ; 68CD   0268
        INCR    R1                              ; 68CE   0009
        MVI@    R1,     R0                      ; 68CF   0288
        MVO@    R0,     R4                      ; 68D0   0260
        SWAP    R0,     1                       ; 68D1   0040
        MVO@    R0,     R5                      ; 68D2   0268
        INCR    R1                              ; 68D3   0009
        MVO@    R2,     R4                      ; 68D4   0262
        MVO@    R2,     R5                      ; 68D5   026A
        MVO@    R2,     R4                      ; 68D6   0262
        MVO@    R2,     R5                      ; 68D7   026A
        MVO@    R2,     R4                      ; 68D8   0262
        MVO@    R2,     R5                      ; 68D9   026A
        ADDI    #$0008, R4                      ; 68DA   02FC 0008
        ADDI    #$0008, R5                      ; 68DC   02FD 0008
        MVI@    R1,     R0                      ; 68DE   0288
        MVO@    R0,     R4                      ; 68DF   0260
        SWAP    R0,     1                       ; 68E0   0040
        MVO@    R0,     R5                      ; 68E1   0268
        INCR    R1                              ; 68E2   0009
        MVI@    R1,     R0                      ; 68E3   0288
        MVO@    R0,     R4                      ; 68E4   0260
        SWAP    R0,     1                       ; 68E5   0040
        MVO@    R0,     R5                      ; 68E6   0268
        INCR    R1                              ; 68E7   0009
        MVI@    R1,     R0                      ; 68E8   0288
        MVO@    R0,     R4                      ; 68E9   0260
        SWAP    R0,     1                       ; 68EA   0040
        MVO@    R0,     R5                      ; 68EB   0268
        INCR    R1                              ; 68EC   0009
        MVI@    R1,     R0                      ; 68ED   0288
        MVO@    R0,     R4                      ; 68EE   0260
        SWAP    R0,     1                       ; 68EF   0040
        MVO@    R0,     R5                      ; 68F0   0268
        INCR    R1                              ; 68F1   0009
        MVI@    R1,     R0                      ; 68F2   0288
        MVO@    R0,     R4                      ; 68F3   0260
        SWAP    R0,     1                       ; 68F4   0040
        MVO@    R0,     R5                      ; 68F5   0268
        INCR    R1                              ; 68F6   0009
        MVO@    R2,     R4                      ; 68F7   0262
        MVO@    R2,     R5                      ; 68F8   026A
        MVO@    R2,     R4                      ; 68F9   0262
        MVO@    R2,     R5                      ; 68FA   026A
        MVO@    R2,     R4                      ; 68FB   0262
        MVO@    R2,     R5                      ; 68FC   026A
        ADDI    #$0008, R4                      ; 68FD   02FC 0008
        ADDI    #$0008, R5                      ; 68FF   02FD 0008
        MVI@    R1,     R0                      ; 6901   0288
        MVO@    R0,     R4                      ; 6902   0260
        SWAP    R0,     1                       ; 6903   0040
        MVO@    R0,     R5                      ; 6904   0268
        INCR    R1                              ; 6905   0009
        MVI@    R1,     R0                      ; 6906   0288
        MVO@    R0,     R4                      ; 6907   0260
        SWAP    R0,     1                       ; 6908   0040
        MVO@    R0,     R5                      ; 6909   0268
        INCR    R1                              ; 690A   0009
        MVI@    R1,     R0                      ; 690B   0288
        MVO@    R0,     R4                      ; 690C   0260
        SWAP    R0,     1                       ; 690D   0040
        MVO@    R0,     R5                      ; 690E   0268
        INCR    R1                              ; 690F   0009
        MVI@    R1,     R0                      ; 6910   0288
        MVO@    R0,     R4                      ; 6911   0260
        SWAP    R0,     1                       ; 6912   0040
        MVO@    R0,     R5                      ; 6913   0268
        INCR    R1                              ; 6914   0009
        MVI@    R1,     R0                      ; 6915   0288
        MVO@    R0,     R4                      ; 6916   0260
        SWAP    R0,     1                       ; 6917   0040
        MVO@    R0,     R5                      ; 6918   0268
        INCR    R1                              ; 6919   0009
        MVO@    R2,     R4                      ; 691A   0262
        MVO@    R2,     R5                      ; 691B   026A
        MVO@    R2,     R4                      ; 691C   0262
        MVO@    R2,     R5                      ; 691D   026A
        MVO@    R2,     R4                      ; 691E   0262
        PULR    R7                              ; 691F   02B7

L_6920:
        PSHR    R5                              ; 6920   0275
        SDBD                                    ; 6921   0001
        MVII    #$39B0, R5                      ; 6922   02BD 00B0 0039
        CLRR    R1                              ; 6925   01C9
        MVII    #$00E0, R2                      ; 6926   02BA 00E0
        MVII    #$0183, R4                      ; 6928   02BC 0183
        SDBD                                    ; 692A   0001
        MVI@    R4,     R0                      ; 692B   02A0
        MVO@    R1,     R5                      ; 692C   0269
        MVO@    R1,     R5                      ; 692D   0269
        RRC     R0,     1                       ; 692E   0070
        BNC     L_6933                          ; 692F   0209 0002

        DECR    R5                              ; 6931   0015
        MVO@    R2,     R5                      ; 6932   026A
L_6933:
        MVO@    R1,     R5                      ; 6933   0269
        MVO@    R1,     R5                      ; 6934   0269
        RRC     R0,     1                       ; 6935   0070
        BNC     L_693A                          ; 6936   0209 0002

        DECR    R5                              ; 6938   0015
        MVO@    R2,     R5                      ; 6939   026A
L_693A:
        MVO@    R1,     R5                      ; 693A   0269
        MVO@    R1,     R5                      ; 693B   0269
        RRC     R0,     1                       ; 693C   0070
        BNC     L_6941                          ; 693D   0209 0002

        DECR    R5                              ; 693F   0015
        MVO@    R2,     R5                      ; 6940   026A
L_6941:
        MVO@    R1,     R5                      ; 6941   0269
        MVO@    R1,     R5                      ; 6942   0269
        RRC     R0,     1                       ; 6943   0070
        BNC     L_6948                          ; 6944   0209 0002

        DECR    R5                              ; 6946   0015
        MVO@    R2,     R5                      ; 6947   026A
L_6948:
        MVO@    R1,     R5                      ; 6948   0269
        MVO@    R1,     R5                      ; 6949   0269
        RRC     R0,     1                       ; 694A   0070
        BNC     L_694F                          ; 694B   0209 0002

        DECR    R5                              ; 694D   0015
        MVO@    R2,     R5                      ; 694E   026A
L_694F:
        MVO@    R1,     R5                      ; 694F   0269
        MVO@    R1,     R5                      ; 6950   0269
        RRC     R0,     1                       ; 6951   0070
        BNC     L_6956                          ; 6952   0209 0002

        DECR    R5                              ; 6954   0015
        MVO@    R2,     R5                      ; 6955   026A
L_6956:
        MVO@    R1,     R5                      ; 6956   0269
        MVO@    R1,     R5                      ; 6957   0269
        RRC     R0,     1                       ; 6958   0070
        BNC     L_695D                          ; 6959   0209 0002

        DECR    R5                              ; 695B   0015
        MVO@    R2,     R5                      ; 695C   026A
L_695D:
        MVO@    R1,     R5                      ; 695D   0269
        MVO@    R1,     R5                      ; 695E   0269
        RRC     R0,     1                       ; 695F   0070
        BNC     L_6964                          ; 6960   0209 0002

        DECR    R5                              ; 6962   0015
        MVO@    R2,     R5                      ; 6963   026A
L_6964:
        MVO@    R1,     R5                      ; 6964   0269
        MVO@    R1,     R5                      ; 6965   0269
        RRC     R0,     1                       ; 6966   0070
        BNC     L_696B                          ; 6967   0209 0002

        DECR    R5                              ; 6969   0015
        MVO@    R2,     R5                      ; 696A   026A
L_696B:
        MVO@    R1,     R5                      ; 696B   0269
        MVO@    R1,     R5                      ; 696C   0269
        RRC     R0,     1                       ; 696D   0070
        BNC     L_6972                          ; 696E   0209 0002

        DECR    R5                              ; 6970   0015
        MVO@    R2,     R5                      ; 6971   026A
L_6972:
        MVO@    R1,     R5                      ; 6972   0269
        MVO@    R1,     R5                      ; 6973   0269
        RRC     R0,     1                       ; 6974   0070
        BNC     L_6979                          ; 6975   0209 0002

        DECR    R5                              ; 6977   0015
        MVO@    R2,     R5                      ; 6978   026A
L_6979:
        MVO@    R1,     R5                      ; 6979   0269
        MVO@    R1,     R5                      ; 697A   0269
        RRC     R0,     1                       ; 697B   0070
        BNC     L_6980                          ; 697C   0209 0002

        DECR    R5                              ; 697E   0015
        MVO@    R2,     R5                      ; 697F   026A
L_6980:
        MVO@    R1,     R5                      ; 6980   0269
        MVO@    R1,     R5                      ; 6981   0269
        RRC     R0,     1                       ; 6982   0070
        BNC     L_6987                          ; 6983   0209 0002

        DECR    R5                              ; 6985   0015
        MVO@    R2,     R5                      ; 6986   026A
L_6987:
        MVO@    R1,     R5                      ; 6987   0269
        MVO@    R1,     R5                      ; 6988   0269
        RRC     R0,     1                       ; 6989   0070
        BNC     L_698E                          ; 698A   0209 0002

        DECR    R5                              ; 698C   0015
        MVO@    R2,     R5                      ; 698D   026A
L_698E:
        MVO@    R1,     R5                      ; 698E   0269
        MVO@    R1,     R5                      ; 698F   0269
        RRC     R0,     1                       ; 6990   0070
        BNC     L_6995                          ; 6991   0209 0002

        DECR    R5                              ; 6993   0015
        MVO@    R2,     R5                      ; 6994   026A
L_6995:
        MVO@    R1,     R5                      ; 6995   0269
        MVO@    R1,     R5                      ; 6996   0269
        RRC     R0,     1                       ; 6997   0070
        BNC     L_699C                          ; 6998   0209 0002

        DECR    R5                              ; 699A   0015
        MVO@    R2,     R5                      ; 699B   026A
L_699C:
        MVO@    R1,     R5                      ; 699C   0269
        SDBD                                    ; 699D   0001
        MVI@    R4,     R0                      ; 699E   02A0
        MVO@    R1,     R5                      ; 699F   0269
        RRC     R0,     1                       ; 69A0   0070
        BNC     L_69A5                          ; 69A1   0209 0002

        DECR    R5                              ; 69A3   0015
        MVO@    R2,     R5                      ; 69A4   026A
L_69A5:
        MVO@    R1,     R5                      ; 69A5   0269
        MVO@    R1,     R5                      ; 69A6   0269
        RRC     R0,     1                       ; 69A7   0070
        BNC     L_69AC                          ; 69A8   0209 0002

        DECR    R5                              ; 69AA   0015
        MVO@    R2,     R5                      ; 69AB   026A
L_69AC:
        MVO@    R1,     R5                      ; 69AC   0269
        MVO@    R1,     R5                      ; 69AD   0269
        RRC     R0,     1                       ; 69AE   0070
        BNC     L_69B3                          ; 69AF   0209 0002

        DECR    R5                              ; 69B1   0015
        MVO@    R2,     R5                      ; 69B2   026A
L_69B3:
        MVO@    R1,     R5                      ; 69B3   0269
        MVO@    R1,     R5                      ; 69B4   0269
        RRC     R0,     1                       ; 69B5   0070
        BNC     L_69BA                          ; 69B6   0209 0002

        DECR    R5                              ; 69B8   0015
        MVO@    R2,     R5                      ; 69B9   026A
L_69BA:
        MVO@    R1,     R5                      ; 69BA   0269
        MVO@    R1,     R5                      ; 69BB   0269
        RRC     R0,     1                       ; 69BC   0070
        BNC     L_69C1                          ; 69BD   0209 0002

        DECR    R5                              ; 69BF   0015
        MVO@    R2,     R5                      ; 69C0   026A
L_69C1:
        MVO@    R1,     R5                      ; 69C1   0269
        MVO@    R1,     R5                      ; 69C2   0269
        RRC     R0,     1                       ; 69C3   0070
        BNC     L_69C8                          ; 69C4   0209 0002

        DECR    R5                              ; 69C6   0015
        MVO@    R2,     R5                      ; 69C7   026A
L_69C8:
        MVO@    R1,     R5                      ; 69C8   0269
        MVO@    R1,     R5                      ; 69C9   0269
        RRC     R0,     1                       ; 69CA   0070
        BNC     L_69CF                          ; 69CB   0209 0002

        DECR    R5                              ; 69CD   0015
        MVO@    R2,     R5                      ; 69CE   026A
L_69CF:
        MVO@    R1,     R5                      ; 69CF   0269
        MVO@    R1,     R5                      ; 69D0   0269
        RRC     R0,     1                       ; 69D1   0070
        BNC     L_69D6                          ; 69D2   0209 0002

        DECR    R5                              ; 69D4   0015
        MVO@    R2,     R5                      ; 69D5   026A
L_69D6:
        MVO@    R1,     R5                      ; 69D6   0269
        MVO@    R1,     R5                      ; 69D7   0269
        RRC     R0,     1                       ; 69D8   0070
        BNC     L_69DD                          ; 69D9   0209 0002

        DECR    R5                              ; 69DB   0015
        MVO@    R2,     R5                      ; 69DC   026A
L_69DD:
        MVO@    R1,     R5                      ; 69DD   0269
        MVO@    R1,     R5                      ; 69DE   0269
        RRC     R0,     1                       ; 69DF   0070
        BNC     L_69E4                          ; 69E0   0209 0002

        DECR    R5                              ; 69E2   0015
        MVO@    R2,     R5                      ; 69E3   026A
L_69E4:
        MVO@    R1,     R5                      ; 69E4   0269
        MVO@    R1,     R5                      ; 69E5   0269
        RRC     R0,     1                       ; 69E6   0070
        BNC     L_69EB                          ; 69E7   0209 0002

        DECR    R5                              ; 69E9   0015
        MVO@    R2,     R5                      ; 69EA   026A
L_69EB:
        MVO@    R1,     R5                      ; 69EB   0269
        MVO@    R1,     R5                      ; 69EC   0269
        RRC     R0,     1                       ; 69ED   0070
        BNC     L_69F2                          ; 69EE   0209 0002

        DECR    R5                              ; 69F0   0015
        MVO@    R2,     R5                      ; 69F1   026A
L_69F2:
        MVO@    R1,     R5                      ; 69F2   0269
        MVO@    R1,     R5                      ; 69F3   0269
        RRC     R0,     1                       ; 69F4   0070
        BNC     L_69F9                          ; 69F5   0209 0002

        DECR    R5                              ; 69F7   0015
        MVO@    R2,     R5                      ; 69F8   026A
L_69F9:
        MVO@    R1,     R5                      ; 69F9   0269
        MVO@    R1,     R5                      ; 69FA   0269
        RRC     R0,     1                       ; 69FB   0070
        BNC     L_6A00                          ; 69FC   0209 0002

        DECR    R5                              ; 69FE   0015
        MVO@    R2,     R5                      ; 69FF   026A
L_6A00:
        MVO@    R1,     R5                      ; 6A00   0269
        MVO@    R1,     R5                      ; 6A01   0269
        RRC     R0,     1                       ; 6A02   0070
        BNC     L_6A07                          ; 6A03   0209 0002

        DECR    R5                              ; 6A05   0015
        MVO@    R2,     R5                      ; 6A06   026A
L_6A07:
        MVO@    R1,     R5                      ; 6A07   0269
        MVO@    R1,     R5                      ; 6A08   0269
        RRC     R0,     1                       ; 6A09   0070
        BNC     L_6A0E                          ; 6A0A   0209 0002

        DECR    R5                              ; 6A0C   0015
        MVO@    R2,     R5                      ; 6A0D   026A
L_6A0E:
        PULR    R7                              ; 6A0E   02B7

L_6A0F:
        PSHR    R5                              ; 6A0F   0275
        MVII    #$016E, R5                      ; 6A10   02BD 016E
        MVII    #$0200, R4                      ; 6A12   02BC 0200
L_6A14:
        SDBD                                    ; 6A14   0001
        MVI@    R5,     R0                      ; 6A15   02A8
        CLRR    R1                              ; 6A16   01C9
L_6A17:
        SUBI    #$0064, R0                      ; 6A17   0338 0064
        BMI     L_6A1E                          ; 6A19   020B 0003

        INCR    R1                              ; 6A1B   0009
        B       L_6A17                          ; 6A1C   0220 0006

L_6A1E:
        ADDI    #$0064, R0                      ; 6A1E   02F8 0064
        CLRR    R2                              ; 6A20   01D2
L_6A21:
        SUBI    #$000A, R0                      ; 6A21   0338 000A
        BMI     L_6A28                          ; 6A23   020B 0003

        INCR    R2                              ; 6A25   000A
        B       L_6A21                          ; 6A26   0220 0006

L_6A28:
        ADDI    #$000A, R0                      ; 6A28   02F8 000A
        CLRR    R3                              ; 6A2A   01DB
L_6A2B:
        SUBI    #$0001, R0                      ; 6A2B   0338 0001
        BMI     L_6A32                          ; 6A2D   020B 0003

        INCR    R3                              ; 6A2F   000B
        B       L_6A2B                          ; 6A30   0220 0006

L_6A32:
        PSHR    R1                              ; 6A32   0271
        SLL     R1,     2                       ; 6A33   004D
        ADD@    R6,     R1                      ; 6A34   02F1
        PSHR    R2                              ; 6A35   0272
        SLL     R2,     2                       ; 6A36   004E
        ADD@    R6,     R2                      ; 6A37   02F2
        PSHR    R3                              ; 6A38   0273
        SLL     R3,     2                       ; 6A39   004F
        ADD@    R6,     R3                      ; 6A3A   02F3
        SDBD                                    ; 6A3B   0001
        MVII    #$9438, R0                      ; 6A3C   02B8 0038 0094
        ADDR    R0,     R1                      ; 6A3F   00C1
        ADDR    R0,     R2                      ; 6A40   00C2
        ADDR    R0,     R3                      ; 6A41   00C3
        MVII    #$0005, R0                      ; 6A42   02B8 0005
L_6A44:
        PSHR    R0                              ; 6A44   0270
        PSHR    R1                              ; 6A45   0271
        MVI@    R1,     R0                      ; 6A46   0288
        SWAP    R0,     1                       ; 6A47   0040
        SLL     R0,     2                       ; 6A48   004C
        MVI@    R2,     R1                      ; 6A49   0291
        SWAP    R1,     1                       ; 6A4A   0041
        SLR     R1,     2                       ; 6A4B   0065
        SLR     R1,     1                       ; 6A4C   0061
        XORR    R1,     R0                      ; 6A4D   01C8
        PULR    R1                              ; 6A4E   02B1
        XOR@    R3,     R0                      ; 6A4F   03D8
        SWAP    R0,     1                       ; 6A50   0040
        MVO@    R0,     R4                      ; 6A51   0260
        INCR    R1                              ; 6A52   0009
        INCR    R2                              ; 6A53   000A
        INCR    R3                              ; 6A54   000B
        PULR    R0                              ; 6A55   02B0
        DECR    R0                              ; 6A56   0010
        BNEQ    L_6A44                          ; 6A57   022C 0014

        CMPI    #$020F, R4                      ; 6A59   037C 020F
        BLT     L_6A14                          ; 6A5B   0225 0048
        PULR    R7                              ; 6A5D   02B7

L_6A5E:
        PSHR    R5                              ; 6A5E   0275
        MVI     G_015D, R0                      ; 6A5F   0280 015D
        MVI     G_015E, R1                      ; 6A61   0281 015E
        ADDI    #$0004, R0                      ; 6A63   02F8 0004
        INCR    R1                              ; 6A65   0009
        ANDI    #$00FF, R0                      ; 6A66   03B8 00FF
        ANDI    #$00FF, R1                      ; 6A68   03B9 00FF
        SLR     R0,     2                       ; 6A6A   0064
        SLR     R1,     2                       ; 6A6B   0065
        SUBI    #$0001, R0                      ; 6A6C   0338 0001
        ADDI    #$0010, R0                      ; 6A6E   02F8 0010
        ADDI    #$0020, R1                      ; 6A70   02F9 0020
        MVI     G_0319, R3                      ; 6A72   0283 0319
        SDBD                                    ; 6A74   0001
        ANDI    #$FF00, R3                      ; 6A75   03BB 0000 00FF
        ADDR    R0,     R3                      ; 6A78   00C3
        MVO     R3,     G_0319                  ; 6A79   0243 0319
        MVI     G_0321, R3                      ; 6A7B   0283 0321
        SDBD                                    ; 6A7D   0001
        ANDI    #$FF80, R3                      ; 6A7E   03BB 0080 00FF
        ANDI    #$007F, R1                      ; 6A81   03B9 007F
        ADDR    R1,     R3                      ; 6A83   00CB
        MVO     R3,     G_0321                  ; 6A84   0243 0321
        PULR    R7                              ; 6A86   02B7

L_6A87:
        PSHR    R5                              ; 6A87   0275
        TSTR    R0                              ; 6A88   0080
        BNEQ    L_6A8F                          ; 6A89   020C 0004

        MVII    #$0001, R3                      ; 6A8B   02BB 0001
        B       L_6AB9                          ; 6A8D   0200 002A

L_6A8F:
        MVII    #$0005, R3                      ; 6A8F   02BB 0005
        MVI     G_0174, R1                      ; 6A91   0281 0174
        MVII    #$000A, R2                      ; 6A93   02BA 000A

        JSR     R5,     X_DIV                   ; 6A95   0004 011C 01FB

        MOVR    R0,     R2                      ; 6A98   0082
        MOVR    R1,     R0                      ; 6A99   0088
        MVII    #$0001, R1                      ; 6A9A   02B9 0001
        MVII    #$026B, R4                      ; 6A9C   02BC 026B

        JSR     R5,     X_PRNUM_RGT             ; 6A9E   0004 0118 00C5

        DECR    R4                              ; 6AA1   0014
        MVII    #$0075, R0                      ; 6AA2   02B8 0075
        MVO@    R0,     R4                      ; 6AA4   0260
        MVII    #$0268, R4                      ; 6AA5   02BC 0268
        MVII    #$0002, R1                      ; 6AA7   02B9 0002
        MOVR    R2,     R0                      ; 6AA9   0090

        JSR     R5,     X_PRNUM_RGT             ; 6AAA   0004 0118 00C5

        MVII    #$0025, R0                      ; 6AAD   02B8 0025
        MOVR    R4,     R1                      ; 6AAF   00A1
        MVI@    R4,     R2                      ; 6AB0   02A2
        SDBD                                    ; 6AB1   0001
        ANDI    #$FFF8, R2                      ; 6AB2   03BA 00F8 00FF
        BEQ     L_6AB8                          ; 6AB5   0204 0001

        DECR    R1                              ; 6AB7   0011
L_6AB8:
        MVO@    R0,     R1                      ; 6AB8   0248
L_6AB9:
        MVII    #$0252, R4                      ; 6AB9   02BC 0252

        JSR     R5,     X_PRINT_R5              ; 6ABB   0004 0118 007B
        STRING  "Damage"                        ; 6ABE  
        DECLE   $0000                           ; 6AC4   0000

        PULR    R7                              ; 6AC5   02B7

L_6AC6:
        PSHR    R5                              ; 6AC6   0275
        TSTR    R0                              ; 6AC7   0080
        BNEQ    L_6ACE                          ; 6AC8   020C 0004

        MVII    #$0001, R3                      ; 6ACA   02BB 0001
        B       L_6ADB                          ; 6ACC   0200 000D

L_6ACE:
        MVII    #$0002, R3                      ; 6ACE   02BB 0002
        MVI     G_0175, R0                      ; 6AD0   0280 0175
        MVII    #$017D, R4                      ; 6AD2   02BC 017D
        MVII    #$0003, R1                      ; 6AD4   02B9 0003
        MVII    #$0291, R4                      ; 6AD6   02BC 0291

        JSR     R5,     X_PRNUM_RGT             ; 6AD8   0004 0118 00C5

L_6ADB:
        MVII    #$027A, R4                      ; 6ADB   02BC 027A

        JSR     R5,     X_PRINT_R5              ; 6ADD   0004 0118 007B
        STRING  "Fires"                         ; 6AE0  
        DECLE   $0000                           ; 6AE5   0000

        PULR    R7                              ; 6AE6   02B7

L_6AE7:
        PSHR    R5                              ; 6AE7   0275
        TSTR    R0                              ; 6AE8   0080
        BNEQ    L_6AEF                          ; 6AE9   020C 0004

        MVII    #$0001, R3                      ; 6AEB   02BB 0001
        B       L_6AFA                          ; 6AED   0200 000B

L_6AEF:
        MVII    #$0006, R3                      ; 6AEF   02BB 0006
        MVI     G_0176, R0                      ; 6AF1   0280 0176
        MVII    #$0003, R1                      ; 6AF3   02B9 0003
        MVII    #$02B9, R4                      ; 6AF5   02BC 02B9

        JSR     R5,     X_PRNUM_RGT             ; 6AF7   0004 0118 00C5

L_6AFA:
        MVII    #$02A2, R4                      ; 6AFA   02BC 02A2

        JSR     R5,     X_PRINT_R5              ; 6AFC   0004 0118 007B
        STRING  "Enemy"                         ; 6AFF  
        DECLE   $0000                           ; 6B04   0000

        PULR    R7                              ; 6B05   02B7

L_6B06:
        PSHR    R5                              ; 6B06   0275
        MVI     G_0168, R0                      ; 6B07   0280 0168
        CMPI    #$0006, R0                      ; 6B09   0378 0006
        BEQ     L_6B49                          ; 6B0B   0204 003C

        MVII    #$017B, R4                      ; 6B0D   02BC 017B
        SDBD                                    ; 6B0F   0001
        MVI@    R4,     R1                      ; 6B10   02A1
        MVII    #$000A, R2                      ; 6B11   02BA 000A

        JSR     R5,     X_DIV                   ; 6B13   0004 011C 01FB

        MOVR    R0,     R2                      ; 6B16   0082
        MOVR    R1,     R0                      ; 6B17   0088
        MVII    #$021B, R4                      ; 6B18   02BC 021B
        MVII    #$0005, R3                      ; 6B1A   02BB 0005
        MVII    #$0001, R1                      ; 6B1C   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 6B1E   0004 0118 00C5

        DECR    R4                              ; 6B21   0014
        MVII    #$0075, R0                      ; 6B22   02B8 0075
        MVO@    R0,     R4                      ; 6B24   0260
        MVII    #$0216, R4                      ; 6B25   02BC 0216
        MVII    #$0004, R1                      ; 6B27   02B9 0004
        MOVR    R2,     R0                      ; 6B29   0090

        JSR     R5,     X_PRNUM_ZRO             ; 6B2A   0004 0118 00AD

        MVII    #$0025, R0                      ; 6B2D   02B8 0025
        DECR    R4                              ; 6B2F   0014
        MVO@    R0,     R4                      ; 6B30   0260
        MVII    #$017D, R4                      ; 6B31   02BC 017D
        SDBD                                    ; 6B33   0001
        MVI@    R4,     R0                      ; 6B34   02A0
        MVII    #$0002, R3                      ; 6B35   02BB 0002
        MVII    #$0004, R1                      ; 6B37   02B9 0004
        MVII    #$021D, R4                      ; 6B39   02BC 021D

        JSR     R5,     X_PRNUM_ZRO             ; 6B3B   0004 0118 00AD

        MVII    #$017F, R4                      ; 6B3E   02BC 017F
        SDBD                                    ; 6B40   0001
        MVI@    R4,     R0                      ; 6B41   02A0
        MVII    #$0006, R3                      ; 6B42   02BB 0006
        MVII    #$0222, R4                      ; 6B44   02BC 0222

        JSR     R5,     L_6B4A                  ; 6B46   0004 0168 034A

L_6B49:
        PULR    R7                              ; 6B49   02B7

L_6B4A:
        PSHR    R5                              ; 6B4A   0275
        CLRR    R1                              ; 6B4B   01C9
L_6B4C:
        CMPI    #$03E8, R0                      ; 6B4C   0378 03E8
        BNC     L_6B55                          ; 6B4E   0209 0005

        SUBI    #$03E8, R0                      ; 6B50   0338 03E8
        INCR    R1                              ; 6B52   0009
        B       L_6B4C                          ; 6B53   0220 0008

L_6B55:
        PSHR    R0                              ; 6B55   0270
        MOVR    R1,     R0                      ; 6B56   0088
        MVII    #$0002, R1                      ; 6B57   02B9 0002

        JSR     R5,     X_PRNUM_ZRO             ; 6B59   0004 0118 00AD

        PULR    R0                              ; 6B5C   02B0
        INCR    R1                              ; 6B5D   0009
        ADDI    #$0002, R4                      ; 6B5E   02FC 0002

        JSR     R5,     X_PRNUM_ZRO             ; 6B60   0004 0118 00AD

        PULR    R7                              ; 6B63   02B7

        ADDI    #$0177, R3                      ; 6B64   02FB 0177
        MVI@    R3,     R2                      ; 6B66   029A
        ADDR    R0,     R2                      ; 6B67   00C2
        CMPI    #$00FF, R2                      ; 6B68   037A 00FF
        BLE     L_6B6E                          ; 6B6A   0206 0002

        MVII    #$00FF, R2                      ; 6B6C   02BA 00FF
L_6B6E:
        MVO@    R2,     R3                      ; 6B6E   025A
        MOVR    R5,     R7                      ; 6B6F   00AF

        PSHR    R5                              ; 6B70   0275
L_6B71:
        MVII    #$0174, R1                      ; 6B71   02B9 0174
        MVII    #$017B, R2                      ; 6B73   02BA 017B
        B       L_6B85                          ; 6B75   0200 000E

        PSHR    R5                              ; 6B77   0275
        MVII    #$0175, R1                      ; 6B78   02B9 0175
        MVII    #$017D, R2                      ; 6B7A   02BA 017D
        B       L_6B85                          ; 6B7C   0200 0007

        PSHR    R5                              ; 6B7E   0275
        MVII    #$0176, R1                      ; 6B7F   02B9 0176
        MVII    #$017F, R2                      ; 6B81   02BA 017F
        B       L_6B85                          ; 6B83   0200 0000

L_6B85:
        MVI@    R1,     R3                      ; 6B85   028B
        ADDR    R0,     R3                      ; 6B86   00C3
        CMPI    #$00FF, R3                      ; 6B87   037B 00FF
        BLE     L_6B8D                          ; 6B89   0206 0002

        MVII    #$00FF, R3                      ; 6B8B   02BB 00FF
L_6B8D:
        MVO@    R3,     R1                      ; 6B8D   024B
        MOVR    R2,     R4                      ; 6B8E   0094
        SDBD                                    ; 6B8F   0001
        MVI@    R4,     R3                      ; 6B90   02A3
        ADDR    R0,     R3                      ; 6B91   00C3
        MVO@    R3,     R2                      ; 6B92   0253
        SWAP    R3,     1                       ; 6B93   0043
        INCR    R2                              ; 6B94   000A
        MVO@    R3,     R2                      ; 6B95   0253

        JSR     R5,     L_6B06                  ; 6B96   0004 0168 0306

        PULR    R7                              ; 6B99   02B7

L_6B9A:
        PSHR    R5                              ; 6B9A   0275
        MVI     G_0166, R0                      ; 6B9B   0280 0166
        ANDI    #$003F, R0                      ; 6B9D   03B8 003F
        BNEQ    L_6B49                          ; 6B9F   022C 0057

        MVI     G_01D6, R0                      ; 6BA1   0280 01D6
        DECR    R0                              ; 6BA3   0010
        ANDI    #$000F, R0                      ; 6BA4   03B8 000F
        MVO     R0,     G_01D6                  ; 6BA6   0240 01D6
        INCR    R7                              ; 6BA8   000F

        PSHR    R5                              ; 6BA9   0275
L_6BAA:
        SLL     R0,     1                       ; 6BAA   0048
        ADDI    #$0124, R0                      ; 6BAB   02F8 0124
        MOVR    R0,     R5                      ; 6BAD   0085
        SDBD                                    ; 6BAE   0001
        MVI@    R5,     R1                      ; 6BAF   02A9
        CLRR    R0                              ; 6BB0   01C0
        CLRC                                    ; 6BB1   0006
L_6BB2:
        ADCR    R0                              ; 6BB2   0028
        SLLC    R1,     1                       ; 6BB3   0059
        BNEQ    L_6BB2                          ; 6BB4   022C 0003

        ADCR    R0                              ; 6BB6   0028
        BNEQ    L_6B71                          ; 6BB7   022C 0047
        PULR    R7                              ; 6BB9   02B7

L_6BBA:
        PSHR    R5                              ; 6BBA   0275

        JSR     R5,     L_55BB                  ; 6BBB   0004 0154 01BB
        DECLE   $0001,  $02BB,  $0000,  $0050   ; 6BBE   0001 02BB 0000 0050
        DECLE   $0004                           ; 6BC2   0004

        XORR    R2,     R0                      ; 6BC3   01D0
        GSWD    R1                              ; 6BC4   0031
        MVI     .STIC.MODE,R0                   ; 6BC5   0280 0021
        CLRR    R0                              ; 6BC7   01C0
        MVO     R0,     .STIC.HDLY              ; 6BC8   0240 0030
        MVO     R0,     .STIC.VDLY              ; 6BCA   0240 0031
        MVO     R0,     .STIC.EDGE              ; 6BCC   0240 0032

        JSR     R5,     L_D000                  ; 6BCE   0004 01D0 0000
        DECLE   $0004                           ; 6BD1   0004

        XORR    R2,     R0                      ; 6BD2   01D0
        INCR    R7                              ; 6BD3   000F
        PULR    R7                              ; 6BD4   02B7

L_6BD5:
        PSHR    R5                              ; 6BD5   0275

        JSR     R5,     L_55BB                  ; 6BD6   0004 0154 01BB
        DECLE   $0240,  $0021,  $01C0,  $0240   ; 6BD9   0240 0021 01C0 0240
        DECLE   $0030,  $0240,  $0031,  $0240   ; 6BDD   0030 0240 0031 0240
        DECLE   $0032,  $0004                   ; 6BE1   0032 0004

        XORR    R2,     R0                      ; 6BE3   01D0
        INCR    R7                              ; 6BE4   000F
        PULR    R7                              ; 6BE5   02B7

L_6BE6:
        PSHR    R5                              ; 6BE6   0275

        JSR     R5,     L_6BBA                  ; 6BE7   0004 0168 03BA

        MOVR    R7,     R4                      ; 6BEA   00BC
        ADDI    #$0017, R4                      ; 6BEB   02FC 0017
L_6BED:
        MVI@    R4,     R3                      ; 6BED   02A3
L_6BEE:
        MVI@    R4,     R5                      ; 6BEE   02A5
L_6BEF:
        MVI@    R4,     R0                      ; 6BEF   02A0
        SUBI    #$0020, R0                      ; 6BF0   0338 0020
        BMI     L_6BFA                          ; 6BF2   020B 0006

        SLL     R0,     2                       ; 6BF4   004C
        SLL     R0,     1                       ; 6BF5   0048
        XORR    R3,     R0                      ; 6BF6   01D8
        MVO@    R0,     R5                      ; 6BF7   0268
        B       L_6BEF                          ; 6BF8   0220 000A

L_6BFA:
        ADDI    #$0020, R0                      ; 6BFA   02F8 0020
        BEQ     L_6BEE                          ; 6BFC   0224 000F

        DECR    R0                              ; 6BFE   0010
        BEQ     L_6BED                          ; 6BFF   0224 0013
        PULR    R7                              ; 6C01   02B7

        DECLE   $0002,  $0201,  $004C,  $0061   ; 6C02   0002 0201 004C 0061
        DECLE   $0073,  $0065,  $0072,  $0020   ; 6C06   0073 0065 0072 0020
        DECLE   $0043,  $0061,  $006E,  $006E   ; 6C0A   0043 0061 006E 006E
        DECLE   $006F,  $006E,  $0073,  $0000   ; 6C0E   006F 006E 0073 0000
        DECLE   $0229,  $0057,  $0061,  $0074   ; 6C12   0229 0057 0061 0074
        DECLE   $0065,  $0072,  $0020,  $0043   ; 6C16   0065 0072 0020 0043
        DECLE   $0061,  $006E,  $006E,  $006F   ; 6C1A   0061 006E 006E 006F
        DECLE   $006E,  $0073,  $0000,  $0251   ; 6C1E   006E 0073 0000 0251
        DECLE   $0046,  $006C,  $0069,  $0067   ; 6C22   0046 006C 0069 0067
        DECLE   $0068,  $0074,  $0020,  $0043   ; 6C26   0068 0074 0020 0043
        DECLE   $006F,  $006E,  $0074,  $0072   ; 6C2A   006F 006E 0074 0072
        DECLE   $006F,  $006C,  $006C,  $0065   ; 6C2E   006F 006C 006C 0065
        DECLE   $0072,  $0000,  $0279,  $0041   ; 6C32   0072 0000 0279 0041
        DECLE   $0069,  $0072,  $0020,  $0042   ; 6C36   0069 0072 0020 0042
        DECLE   $0072,  $0061,  $006B,  $0065   ; 6C3A   0072 0061 006B 0065
        DECLE   $0073,  $0000,  $02A1,  $0052   ; 6C3E   0073 0000 02A1 0052
        DECLE   $0061,  $0064,  $0061,  $0072   ; 6C42   0061 0064 0061 0072
        DECLE   $0020,  $0053,  $0063,  $0072   ; 6C46   0020 0053 0063 0072
        DECLE   $0065,  $0065,  $006E,  $0000   ; 6C4A   0065 0065 006E 0000

        ADD@    R1,     R1                      ; 6C4E   02C9
        SLL     R0,     2                       ; 6C4F   004C
        SLR     R1,     1                       ; 6C50   0061
        SAR     R2,     2                       ; 6C51   006E
        SLR     R0,     2                       ; 6C52   0064
        ADCR    R7                              ; 6C53   002F

        RLC     R2,     1                       ; 6C54   0052
L_6C55:
        SLR     R1,     2                       ; 6C55   0065
        DECLE   $0066,  $0075,  $0065,  $006C   ; 6C56   0066 0075 0065 006C
        DECLE   $0001,  $0001,  $0219,  $0055   ; 6C5A   0001 0001 0219 0055
        DECLE   $0070,  $0070,  $0065,  $0072   ; 6C5E   0070 0070 0065 0072
        DECLE   $0020,  $0053,  $0069,  $0064   ; 6C62   0020 0053 0069 0064
        DECLE   $0065,  $0020,  $004B,  $0065   ; 6C66   0065 0020 004B 0065
        DECLE   $0079,  $0073,  $0000,  $0241   ; 6C6A   0079 0073 0000 0241
        DECLE   $004C,  $006F,  $0077,  $0065   ; 6C6E   004C 006F 0077 0065
        DECLE   $0072,  $0020,  $0053,  $0069   ; 6C72   0072 0020 0053 0069
        DECLE   $0064,  $0065,  $0020,  $004B   ; 6C76   0064 0065 0020 004B
        DECLE   $0065,  $0079,  $0073,  $0000   ; 6C7A   0065 0079 0073 0000
        DECLE   $0269,  $0057,  $0068,  $0065   ; 6C7E   0269 0057 0068 0065
        DECLE   $0065,  $006C,  $0000,  $0291   ; 6C82   0065 006C 0000 0291
        DECLE   $0043,  $006C,  $0065,  $0061   ; 6C86   0043 006C 0065 0061
        DECLE   $0072,  $0020,  $004B,  $0065   ; 6C8A   0072 0020 004B 0065
        DECLE   $0079,  $0000,  $02B9,  $005A   ; 6C8E   0079 0000 02B9 005A
        DECLE   $0065,  $0072,  $006F,  $0020   ; 6C92   0065 0072 006F 0020
        DECLE   $004B,  $0065,  $0079,  $0000   ; 6C96   004B 0065 0079 0000

        ADD@    R4,     R1                      ; 6C9A   02E1
        SWAP    R1,     2                       ; 6C9B   0045
        SAR     R2,     2                       ; 6C9C   006E
        RRC     R0,     2                       ; 6C9D   0074
        SLR     R1,     2                       ; 6C9E   0065
        RRC     R2,     1                       ; 6C9F   0072
        NEGR    R0                              ; 6CA0   0020
        SLL     R3,     1                       ; 6CA1   004B
        SLR     R1,     2                       ; 6CA2   0065
        SARC    R1,     1                       ; 6CA3   0079
        EIS                                     ; 6CA4   0002
L_6CA5:
        PSHR    R5                              ; 6CA5   0275

        JSR     R5,     L_6BBA                  ; 6CA6   0004 0168 03BA

        SDBD                                    ; 6CA9   0001
        MVII    #$0679, R1                      ; 6CAA   02B9 0079 0006
        MVII    #$0009, R0                      ; 6CAD   02B8 0009
        MVII    #$02A5, R4                      ; 6CAF   02BC 02A5

        JSR     R5,     X_FILL_MEM              ; 6CB1   0004 0114 0341

        MOVR    R1,     R3                      ; 6CB4   008B
        SDBD                                    ; 6CB5   0001
        MVII    #$6480, R4                      ; 6CB6   02BC 0080 0064
        MVII    #$02BB, R1                      ; 6CB9   02B9 02BB
        MVII    #$0008, R0                      ; 6CBB   02B8 0008

        JSR     R5,     L_63DC                  ; 6CBD   0004 0160 03DC

        MVII    #$02CF, R1                      ; 6CC0   02B9 02CF

        JSR     R5,     L_63DC                  ; 6CC2   0004 0160 03DC

        MOVR    R7,     R4                      ; 6CC5   00BC
        ADDI    #$0004, R4                      ; 6CC6   02FC 0004
        B       L_6BED                          ; 6CC8   0220 00DC

        DECLE   $0005,  $0216,  $0041,  $0020   ; 6CCA   0005 0216 0041 0020
        DECLE   $0053,  $0070,  $0065,  $0063   ; 6CCE   0053 0070 0065 0063
        DECLE   $0069,  $0061,  $006C,  $0020   ; 6CD2   0069 0061 006C 0020
        DECLE   $0053,  $0063,  $0072,  $0065   ; 6CD6   0053 0063 0072 0065
        DECLE   $0065,  $006E,  $0000,  $022D   ; 6CDA   0065 006E 0000 022D
        DECLE   $004A,  $0075,  $0073,  $0074   ; 6CDE   004A 0075 0073 0074
        DECLE   $0020,  $0046,  $006F,  $0072   ; 6CE2   0020 0046 006F 0072
        DECLE   $003A,  $0001,  $0002,  $0251   ; 6CE6   003A 0001 0002 0251
        DECLE   $0052,  $0075,  $0073,  $0073   ; 6CEA   0052 0075 0073 0073
        DECLE   $0065,  $006C,  $006C,  $0000   ; 6CEE   0065 006C 006C 0000
        DECLE   $0265,  $0045,  $0064,  $0077   ; 6CF2   0265 0045 0064 0077
        DECLE   $0061,  $0072,  $0064,  $0000   ; 6CF6   0061 0072 0064 0000
        DECLE   $0279,  $0045,  $0074,  $0074   ; 6CFA   0279 0045 0074 0074
        DECLE   $0069,  $006E,  $0067,  $0065   ; 6CFE   0069 006E 0067 0065
        DECLE   $0072,  $0001,  $0006,  $025B   ; 6D02   0072 0001 0006 025B
        DECLE   $004B,  $0079,  $006C,  $0065   ; 6D06   004B 0079 006C 0065
        DECLE   $0000                           ; 6D0A   0000

        MVO@    R7,     R5                      ; 6D0B   026F
L_6D0C:
        RLC     R3,     1                       ; 6D0C   0053
        DECLE   $0074,  $0065,  $0076,  $0065   ; 6D0D   0074 0065 0076 0065
        DECLE   $006E,  $0000                   ; 6D11   006E 0000

        MVI     G_0045, R3                      ; 6D13   0283 0045
        RRC     R0,     2                       ; 6D15   0074
        RRC     R0,     2                       ; 6D16   0074
        SAR     R1,     1                       ; 6D17   0069
        SAR     R2,     2                       ; 6D18   006E
        SLR     R3,     2                       ; 6D19   0067
        SLR     R1,     2                       ; 6D1A   0065
        RRC     R2,     1                       ; 6D1B   0072
        EIS                                     ; 6D1C   0002
L_6D1D:
        PSHR    R5                              ; 6D1D   0275

        JSR     R5,     L_6BBA                  ; 6D1E   0004 0168 03BA

        MOVR    R7,     R4                      ; 6D21   00BC
        ADDI    #$0004, R4                      ; 6D22   02FC 0004
        B       L_6BED                          ; 6D24   0220 0138

        DECLE   $0001,  $0216,  $0053,  $0070   ; 6D26   0001 0216 0053 0070
        DECLE   $0065,  $0063,  $0069,  $0061   ; 6D2A   0065 0063 0069 0061
        DECLE   $006C,  $0020,  $0054,  $0068   ; 6D2E   006C 0020 0054 0068
        DECLE   $0061,  $006E,  $006B,  $0073   ; 6D32   0061 006E 006B 0073
        DECLE   $0020,  $0054,  $006F,  $0001   ; 6D36   0020 0054 006F 0001
        DECLE   $0002,  $0241,  $004C,  $0069   ; 6D3A   0002 0241 004C 0069
        DECLE   $006E,  $0064,  $0061,  $0000   ; 6D3E   006E 0064 0061 0000
        DECLE   $0256,  $004D,  $0069,  $0063   ; 6D42   0256 004D 0069 0063
        DECLE   $0068,  $0069,  $0065,  $0000   ; 6D46   0068 0069 0065 0000
        DECLE   $026B,  $0041,  $0073,  $0061   ; 6D4A   026B 0041 0073 0061
        DECLE   $007A,  $0061,  $0077,  $0061   ; 6D4E   007A 0061 0077 0061
        DECLE   $0000,  $0280,  $0045,  $0074   ; 6D52   0000 0280 0045 0074
        DECLE   $0074,  $0069,  $006E,  $0067   ; 6D56   0074 0069 006E 0067
        DECLE   $0065,  $0072,  $0001,  $0005   ; 6D5A   0065 0072 0001 0005

        MVI@    R4,     R1                      ; 6D5E   02A1
        SLL     R1,     1                       ; 6D5F   0049
        NEGR    R0                              ; 6D60   0020
        SLR     R3,     1                       ; 6D61   0063
        SAR     R3,     2                       ; 6D62   006F
        RRC     R1,     2                       ; 6D63   0075
        SAR     R0,     2                       ; 6D64   006C
        SLR     R0,     2                       ; 6D65   0064
        NEGR    R0                              ; 6D66   0020
        SAR     R2,     2                       ; 6D67   006E
        SLR     R1,     2                       ; 6D68   0065
        RRC     R2,     2                       ; 6D69   0076
        SLR     R1,     2                       ; 6D6A   0065
        RRC     R2,     1                       ; 6D6B   0072
        NEGR    R0                              ; 6D6C   0020
        SAR     R0,     1                       ; 6D6D   0068
        SLR     R1,     1                       ; 6D6E   0061
        RRC     R2,     2                       ; 6D6F   0076
        SLR     R1,     2                       ; 6D70   0065
        NEGR    R0                              ; 6D71   0020
        NEGR    R0                              ; 6D72   0020
        SLR     R0,     2                       ; 6D73   0064
        SAR     R3,     2                       ; 6D74   006F
        SAR     R2,     2                       ; 6D75   006E
        SLR     R1,     2                       ; 6D76   0065
        NEGR    R0                              ; 6D77   0020
        SAR     R1,     1                       ; 6D78   0069
        RRC     R0,     2                       ; 6D79   0074
        NEGR    R0                              ; 6D7A   0020
        RRC     R3,     2                       ; 6D7B   0077
        SAR     R1,     1                       ; 6D7C   0069
        RRC     R0,     2                       ; 6D7D   0074
        SAR     R0,     1                       ; 6D7E   0068
        SAR     R3,     2                       ; 6D7F   006F
        RRC     R1,     2                       ; 6D80   0075
        RRC     R0,     2                       ; 6D81   0074
        NEGR    R0                              ; 6D82   0020
        SARC    R1,     1                       ; 6D83   0079
        SAR     R3,     2                       ; 6D84   006F
        RRC     R1,     2                       ; 6D85   0075
        EIS                                     ; 6D86   0002
L_6D87:
        MVI     .PSG0.lft_hand,R0               ; 6D87   0280 01FF
        CMPI    #$009E, R0                      ; 6D89   0378 009E
        BNEQ    L_6DB7                          ; 6D8B   020C 002A

        MVI     .PSG0.rgt_hand,R0               ; 6D8D   0280 01FE
        CMPI    #$009C, R0                      ; 6D8F   0378 009C
        BNEQ    L_6DB7                          ; 6D91   020C 0024

        SDBD                                    ; 6D93   0001
        MVII    #$6140, R5                      ; 6D94   02BD 0040 0061

        JSRD    R4,     X_NEW_GRAM_INIT         ; 6D97   0004 001E 0335
        JSR     R5,     L_5218                  ; 6D9A   0004 0150 0218
        BIDECLE $6DB8                           ; 6D9D   00B8 006D
L_6D9F:
        EIS                                     ; 6D9F   0002

        JSR     R5,     L_6CA5                  ; 6DA0   0004 016C 00A5
        JSR     R5,     L_6DAE                  ; 6DA3   0004 016C 01AE
        JSR     R5,     L_6D1D                  ; 6DA6   0004 016C 011D
        JSR     R5,     L_6DAE                  ; 6DA9   0004 016C 01AE

        B       L_6D9F                          ; 6DAC   0220 000E

L_6DAE:
        MVII    #$0005, R0                      ; 6DAE   02B8 0005
        CLRR    R1                              ; 6DB0   01C9
L_6DB1:
        DECR    R1                              ; 6DB1   0011
        BNEQ    L_6DB1                          ; 6DB2   022C 0002

        DECR    R0                              ; 6DB4   0010
        BNEQ    L_6DB1                          ; 6DB5   022C 0005
L_6DB7:
        MOVR    R5,     R7                      ; 6DB7   00AF

        MVO     R0,     .STIC.VIDEN             ; 6DB8   0240 0020
        MOVR    R5,     R7                      ; 6DBA   00AF

L_6DBB:
        PSHR    R5                              ; 6DBB   0275

        JSR     R5,     X_PLAY_SFX2             ; 6DBC   0004 0118 03BE
        DECLE   $0014                           ; 6DBF  SFX prio
        DECLE   $002F                           ; 6DC0  SFX data
        DECLE   $0249                           ; 6DC1  SFX data
        DECLE   $0015                           ; 6DC2  SFX data
        DECLE   $001D                           ; 6DC3  SFX data
        DECLE   $0240,  $000E                   ; 6DC4  SFX data
        DECLE   $0001,  $0004                   ; 6DC6  SFX data
        DECLE   $0048,  $0384                   ; 6DC8  SFX data
        DECLE   $018D                           ; 6DCA  SFX data
        DECLE   $000F,  $0012                   ; 6DCB  SFX data
        DECLE   $0077,  $00D8,  $006D           ; 6DCD  SFX data
        DECLE   $0269                           ; 6DD0  SFX data
        DECLE   $01C5                           ; 6DD1  SFX data
        DECLE   $004D                           ; 6DD2  SFX data
        DECLE   $010B                           ; 6DD3  SFX data
        DECLE   $0023,  $03FB                   ; 6DD4  SFX data
        DECLE   $0003,  $03A3                   ; 6DD6  SFX data
UC_6DD8:
        MVI     G_0187, R0                      ; 6DD8  SLIB UCALL target
        SWAP    R0,     2                       ; 6DDA   0044
        BPL     L_6DDE                          ; 6DDB   0203 0001

        NEGR    R0                              ; 6DDD   0020
L_6DDE:
        ANDI    #$00FF, R0                      ; 6DDE   03B8 00FF
        MVI     G_018A, R1                      ; 6DE0   0281 018A
        SWAP    R1,     2                       ; 6DE2   0045
        BPL     L_6DE6                          ; 6DE3   0203 0001

        NEGR    R1                              ; 6DE5   0021
L_6DE6:
        ANDI    #$00FF, R1                      ; 6DE6   03B9 00FF
        ADDR    R1,     R0                      ; 6DE8   00C8
        CMPI    #$007F, R0                      ; 6DE9   0378 007F
        BLE     L_6DEF                          ; 6DEB   0206 0002

        MVII    #$007F, R0                      ; 6DED   02B8 007F
L_6DEF:
        SDBD                                    ; 6DEF   0001
        MVII    #$6E1C, R5                      ; 6DF0   02BD 001C 006E
L_6DF3:
        MVI@    R5,     R1                      ; 6DF3   02A9
        CMP@    R5,     R0                      ; 6DF4   0368
        BLT     L_6DF3                          ; 6DF5   0225 0003

        MVO     R1,     G_015C                  ; 6DF7   0241 015C
        SWAP    R1,     1                       ; 6DF9   0041
        NOP                                     ; 6DFA   0034
        SLR     R1,     1                       ; 6DFB   0061
        MVO     R1,     .PSG0.envlp_lo          ; 6DFC   0241 01F3
        NOP                                     ; 6DFE   0034
        SWAP    R1,     1                       ; 6DFF   0041
        MVO     R1,     .PSG0.envlp_hi          ; 6E00   0241 01F7
        MVI     G_0168, R0                      ; 6E02   0280 0168
        CMPI    #$0007, R0                      ; 6E04   0378 0007
        BEQ     L_6E0C                          ; 6E06   0204 0004

        SDBD                                    ; 6E08   0001
        MVII    #$6DD3, R4                      ; 6E09   02BC 00D3 006D
L_6E0C:
        PULR    R7                              ; 6E0C   02B7

        SDBD                                    ; 6E0D   0001
        MVII    #$6DC0, R4                      ; 6E0E   02BC 00C0 006D
        MVI     G_0168, R5                      ; 6E11   0285 0168
        CMPI    #$000E, R5                      ; 6E13   037D 000E
        BNEQ    L_6E1B                          ; 6E15   020C 0004

        SDBD                                    ; 6E17   0001
        MVII    #$6F2F, R4                      ; 6E18   02BC 002F 006F
L_6E1B:
        PULR    R7                              ; 6E1B   02B7

        DECLE   $0005,  $0064,  $0006,  $0041   ; 6E1C   0005 0064 0006 0041
        DECLE   $0007,  $001E,  $0008,  $0000   ; 6E20   0007 001E 0008 0000
L_6E24:
        PSHR    R5                              ; 6E24   0275

        JSR     R5,     X_PLAY_SFX2             ; 6E25   0004 0118 03BE
        DECLE   $0014                           ; 6E28  SFX prio
        DECLE   $0389,  $0340,  $000A,  $0348   ; 6E29   0389 0340 000A 0348
        DECLE   $000E,  $0344,  $0013,  $0001   ; 6E2D   000E 0344 0013 0001
        DECLE   $000B,  $006B,  $0001           ; 6E31   000B 006B 0001

        XORR    R4,     R3                      ; 6E34   01E3
        SUBR    R5,     R3                      ; 6E35   012B
        ANDI    #$01AB, R6                      ; 6E36   03BE 01AB
        RRC     R3,     2                       ; 6E38   0077
        INCR    R5                              ; 6E39   000D
        SAR     R2,     2                       ; 6E3A   006E
L_6E3B:
        PSHR    R5                              ; 6E3B   0275

        JSR     R5,     X_PLAY_SFX2             ; 6E3C   0004 0118 03BE
        DECLE   $0014                           ; 6E3F  SFX prio

        SARC    R1,     1                       ; 6E40   0079
        INCR    R5                              ; 6E41   000D
        INCR    R7                              ; 6E42   000F

        DIS                                     ; 6E43   0003
L_6E44:
        PULR    R5                              ; 6E44   02B5
        SLLC    R2,     2                       ; 6E45   005E
        CMPR    R5,     R3                      ; 6E46   016B
        XOR@    R3,     R6                      ; 6E47   03DE
        MOVR    R1,     R7                      ; 6E48   008F

        COMR    R5                              ; 6E49   001D
        RRC     R3,     2                       ; 6E4A   0077
        INCR    R5                              ; 6E4B   000D
        SAR     R2,     2                       ; 6E4C   006E
L_6E4D:
        PSHR    R5                              ; 6E4D   0275

        JSR     R5,     X_PLAY_SFX2             ; 6E4E   0004 0118 03BE
        DECLE   $0014                           ; 6E51  SFX prio
        DECLE   $0013,  $0027                   ; 6E52   0013 0027

        MVO@    R7,     R1                      ; 6E54   024F
        INCR    R0                              ; 6E55   0008
        DIS                                     ; 6E56   0003
        SLL     R1,     1                       ; 6E57   0049
        PSHR    R5                              ; 6E58   0275

        JSR     R5,     X_PLAY_SFX2             ; 6E59   0004 0118 03BE
        DECLE   $0014                           ; 6E5C  SFX prio

        DECR    R3                              ; 6E5D   0013
        COMR    R3                              ; 6E5E   001B
        MVO@    R7,     R1                      ; 6E5F   024F
        INCR    R0                              ; 6E60   0008
        DIS                                     ; 6E61   0003
        COMR    R5                              ; 6E62   001D
        PSHR    R5                              ; 6E63   0275

        JSR     R5,     X_PLAY_SFX2             ; 6E64   0004 0118 03BE
        DECLE   $0014                           ; 6E67  SFX prio

        MOVR    R7,     R5                      ; 6E68   00BD
        ADDR    R7,     R5                      ; 6E69   00FD
        INCR    R1                              ; 6E6A   0009
        XOR@    R6,     R0                      ; 6E6B   03F0
        AND@    R4,     R0                      ; 6E6C   03A0
        XORI    #$0080, R0                      ; 6E6D   03F8 0080
        XOR@    R6,     R4                      ; 6E6F   03F4
        SUBI    #$03CD, R4                      ; 6E70   033C 03CD
        AND@    R1,     R6                      ; 6E72   038E
L_6E73:
        DECR    R7                              ; 6E73   0017

        DECLE   $0024,  $03F5,  $0003,  $0005   ; 6E74   0024 03F5 0003 0005
        DECLE   $0235,  $0057,  $0000,  $0003   ; 6E78   0235 0057 0000 0003
        DECLE   $03B7                           ; 6E7C   03B7

        RLC     R3,     2                       ; 6E7D   0057
        SLR     R3,     1                       ; 6E7E   0063
        XOR@    R5,     R6                      ; 6E7F   03EE
        DIS                                     ; 6E80   0003
        INCR    R1                              ; 6E81   0009
        DIS                                     ; 6E82   0003
        INCR    R3                              ; 6E83   000B
        MOVR    R1,     R7                      ; 6E84   008F

        COMR    R0                              ; 6E85   0018
        RRC     R3,     2                       ; 6E86   0077
        INCR    R5                              ; 6E87   000D
        SAR     R2,     2                       ; 6E88   006E
        PSHR    R5                              ; 6E89   0275

        JSR     R5,     X_PLAY_SFX2             ; 6E8A   0004 0118 03BE
        DECLE   $0014                           ; 6E8D  SFX prio

        SARC    R1,     1                       ; 6E8E   0079
        SARC    R1,     2                       ; 6E8F   007D
        DIS                                     ; 6E90   0003
        COMR    R3                              ; 6E91   001B
        PSHR    R5                              ; 6E92   0275

        JSR     R5,     X_PLAY_SFX2             ; 6E93   0004 0118 03BE
        DECLE   $0014                           ; 6E96  SFX prio

        CMPI    #$0375, R1                      ; 6E97   0379 0375
        MVI@    R1,     R5                      ; 6E99   028D
        INCR    R7                              ; 6E9A   000F

        XOR@    R6,     R6                      ; 6E9B   03F6
L_6E9C:
        SAR     R3,     1                       ; 6E9C   006B
        DECLE   $001E,  $026B,  $03FE,  $000F   ; 6E9D   001E 026B 03FE 000F
        DECLE   $0001                           ; 6EA1   0001

        MOVR    R1,     R7                      ; 6EA2   008F

        NEGR    R2                              ; 6EA3   0022
        RRC     R3,     2                       ; 6EA4   0077
        INCR    R5                              ; 6EA5   000D
        SAR     R2,     2                       ; 6EA6   006E
L_6EA7:
        PSHR    R5                              ; 6EA7   0275

        JSR     R5,     X_PLAY_SFX2             ; 6EA8   0004 0118 03BE
        DECLE   $0014                           ; 6EAB  SFX prio

        ADCR    R7                              ; 6EAC   002F

        AND@    R1,     R1                      ; 6EAD   0389
L_6EAE:
        SUB     G_006E, R0                      ; 6EAE   0300 006E
        DECLE   $0001,  $0008,  $0308,  $0046   ; 6EB0   0001 0008 0308 0046
        DECLE   $0001,  $000A,  $0304,  $002D   ; 6EB4   0001 000A 0304 002D
        DECLE   $0001                           ; 6EB8   0001

        DECR    R5                              ; 6EB9   0015
        MOVR    R1,     R7                      ; 6EBA   008F
        ADDR    R0,     R7                      ; 6EBB   00C7
        ADD@    R1,     R7                      ; 6EBC   02CF

L_6EBD:
        PSHR    R5                              ; 6EBD   0275

        JSR     R5,     X_PLAY_SFX2             ; 6EBE   0004 0118 03BE
        DECLE   $0014                           ; 6EC1  SFX prio
        DECLE   $007D,  $001D,  $0064,  $01C4   ; 6EC2   007D 001D 0064 01C4
        DECLE   $002D,  $000C,  $012C,  $002B   ; 6EC6   002D 000C 012C 002B
        DECLE   $0189,  $0280,  $01F4,  $0288   ; 6ECA   0189 0280 01F4 0288
        DECLE   $021C,  $0001,  $03D0,  $0001   ; 6ECE   021C 0001 03D0 0001
        DECLE   $03BA,  $02AB,  $0001,  $0003   ; 6ED2   03BA 02AB 0001 0003
        DECLE   $03AB,  $0001,  $0030,  $0001   ; 6ED6   03AB 0001 0030 0001
        DECLE   $004A,  $02AB,  $0001,  $0003   ; 6EDA   004A 02AB 0001 0003
        DECLE   $01E3,  $03BF                   ; 6EDE   01E3 03BF
L_6EE0:
        MVI     G_0159, R0                      ; 6EE0   0280 0159
        DECR    R0                              ; 6EE2   0010
        BMI     L_6EED                          ; 6EE3   020B 0008

        MVO     R0,     G_0159                  ; 6EE5   0240 0159
        ANDI    #$0007, R0                      ; 6EE7   03B8 0007
        BNEQ    L_6EED                          ; 6EE9   020C 0002

        MVO     R0,     .PSG0.envelope          ; 6EEB   0240 01FA
L_6EED:
        MOVR    R5,     R7                      ; 6EED   00AF

L_6EEE:
        PSHR    R5                              ; 6EEE   0275

        JSR     R5,     X_PLAY_SFX2             ; 6EEF   0004 0118 03BE
        DECLE   $0014                           ; 6EF2  SFX prio
        DECLE   $002F,  $0389,  $0035,  $0200   ; 6EF3   002F 0389 0035 0200
        DECLE   $006E,  $0001,  $03FC,  $02EB   ; 6EF7   006E 0001 03FC 02EB
        DECLE   $0248,  $0046,  $0001,  $03FE   ; 6EFB   0248 0046 0001 03FE
        DECLE   $008F,  $0011,  $0284,  $002D   ; 6EFF   008F 0011 0284 002D
        DECLE   $0001,  $03FD,  $008F,  $0019   ; 6F03   0001 03FD 008F 0019
        DECLE   $0001                           ; 6F07   0001

        DIS                                     ; 6F08   0003
        SUB@    R1,     R1                      ; 6F09   0309
        CLRR    R5                              ; 6F0A   01ED
        AND@    R5,     R3                      ; 6F0B   03AB
        INCR    R1                              ; 6F0C   0009
        SAR     R0,     1                       ; 6F0D   0068
        XORR    R0,     R4                      ; 6F0E   01C4
        RLC     R0,     2                       ; 6F0F   0054
        XOR@    R2,     R0                      ; 6F10   03D0
        INCR    R4                              ; 6F11   000C
        SLR     R0,     2                       ; 6F12   0064
        MVO@    R7,     R1                      ; 6F13   024F
        INCR    R4                              ; 6F14   000C
        CMP@    R1,     R7                      ; 6F15   034F
        INCR    R4                              ; 6F16   000C
        CMP@    R1,     R3                      ; 6F17   034B
        MOVR    R5,     R3                      ; 6F18   00AB
        INCR    R3                              ; 6F19   000B
        SAR     R3,     1                       ; 6F1A   006B
        NEGR    R3                              ; 6F1B   0023
        XORI    #$0077, R3                      ; 6F1C   03FB 0077
        NEGR    R0                              ; 6F1E   0020
        SAR     R3,     2                       ; 6F1F   006F
        MVI     G_015B, R0                      ; 6F20   0280 015B
        DECR    R0                              ; 6F22   0010
        BNEQ    L_6F26                          ; 6F23   020C 0001

        INCR    R0                              ; 6F25   0008
L_6F26:
        MVO     R0,     G_015B                  ; 6F26   0240 015B
        MVO     R0,     G_015C                  ; 6F28   0240 015C
        SDBD                                    ; 6F2A   0001
        MVII    #$6F17, R4                      ; 6F2B   02BC 0017 006F
        PULR    R7                              ; 6F2E   02B7
        ADD@    R1,     R7                      ; 6F2F   02CF

        PSHR    R5                              ; 6F30   0275

        JSR     R5,     L_6F45                  ; 6F31   0004 016C 0345

        BC      L_6F44                          ; 6F34   0201 000E

        MVO@    R0,     R4                      ; 6F36   0260
        MVII    #$0001, R0                      ; 6F37   02B8 0001
        MVO@    R0,     R4                      ; 6F39   0260
        SLL     R1,     2                       ; 6F3A   004D
        SLL     R1,     2                       ; 6F3B   004D
        NOP                                     ; 6F3C   0034
        SLL     R1,     1                       ; 6F3D   0049
        MVO@    R1,     R5                      ; 6F3E   0269
        SLL     R2,     2                       ; 6F3F   004E
        NOP                                     ; 6F40   0034
        SLL     R2,     2                       ; 6F41   004E
        SLL     R2,     1                       ; 6F42   004A
        MVO@    R2,     R5                      ; 6F43   026A
L_6F44:
        PULR    R7                              ; 6F44   02B7

L_6F45:
        PSHR    R5                              ; 6F45   0275
        PSHR    R0                              ; 6F46   0270
        PSHR    R1                              ; 6F47   0271
        MVII    #$0347, R5                      ; 6F48   02BD 0347
        MVII    #$0193, R4                      ; 6F4A   02BC 0193
        MVII    #$0194, R3                      ; 6F4C   02BB 0194
        MVII    #$0008, R1                      ; 6F4E   02B9 0008
L_6F50:
        MVI@    R3,     R0                      ; 6F50   0298
        TSTR    R0                              ; 6F51   0080
        BEQ     L_6F5F                          ; 6F52   0204 000B

        ADDI    #$0006, R3                      ; 6F54   02FB 0006
        ADDI    #$0006, R4                      ; 6F56   02FC 0006
        ADDI    #$0002, R5                      ; 6F58   02FD 0002
        DECR    R1                              ; 6F5A   0011
        BNEQ    L_6F50                          ; 6F5B   022C 000C

        SETC                                    ; 6F5D   0007
        INCR    R7                              ; 6F5E   000F

L_6F5F:
        CLRC                                    ; 6F5F   0006
L_6F60:
        PULR    R1                              ; 6F60   02B1
        PULR    R0                              ; 6F61   02B0
        PULR    R7                              ; 6F62   02B7

L_6F63:
        PSHR    R5                              ; 6F63   0275
        CLRR    R0                              ; 6F64   01C0
        MVII    #$0194, R3                      ; 6F65   02BB 0194
        MVII    #$0008, R4                      ; 6F67   02BC 0008
L_6F69:
        MVI@    R3,     R5                      ; 6F69   029D
        TSTR    R5                              ; 6F6A   00AD
        BEQ     L_6F6E                          ; 6F6B   0204 0001

        INCR    R0                              ; 6F6D   0008
L_6F6E:
        ADDI    #$0006, R3                      ; 6F6E   02FB 0006
        DECR    R4                              ; 6F70   0014
        BNEQ    L_6F69                          ; 6F71   022C 0009
        PULR    R7                              ; 6F73   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F7C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FBC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FCC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFC   0000 0000 0000 0000

        ORG     $D000
L_D000:
        RSWD    R0                              ; D000   0038
        RSWD    R1                              ; D001   0039
        RSWD    R3                              ; D002   003B
        RSWD    R3                              ; D003   003B
L_D004:
        RSWD    R3                              ; D004   003B
        DECLE   $00BB,  $00BB,  $003B,  $003B   ; D005   00BB 00BB 003B 003B
        DECLE   $003B,  $0039,  $0038,  $0000   ; D009   003B 0039 0038 0000
        DECLE   $0000,  $0000,  $0000           ; D00D   0000 0000 0000

        ADDR    R5,     R6                      ; D010   00EE
        ADDR    R5,     R7                      ; D011   00EF
        ADDR    R0,     R7                      ; D012   00C7

        MOVR    R0,     R3                      ; D013   0083
        MOVR    R0,     R3                      ; D014   0083
        MOVR    R0,     R3                      ; D015   0083
        MOVR    R0,     R3                      ; D016   0083
        MOVR    R0,     R3                      ; D017   0083
L_D018:
        MOVR    R0,     R3                      ; D018   0083
        ADDR    R0,     R7                      ; D019   00C7
        ADDR    R5,     R7                      ; D01A   00EF

        DECLE   $00EE,  $0000,  $0000,  $0000   ; D01B   00EE 0000 0000 0000
        DECLE   $0000                           ; D01F   0000

        RSWD    R0                              ; D020   0038
        RSWD    R0                              ; D021   0038
        MOVR    R7,     R0                      ; D022   00B8
        MOVR    R7,     R0                      ; D023   00B8
        MOVR    R7,     R0                      ; D024   00B8
L_D025:
        MOVR    R7,     R0                      ; D025   00B8
        MOVR    R7,     R0                      ; D026   00B8
        MOVR    R3,     R5                      ; D027   009D
        MOVR    R3,     R5                      ; D028   009D
        MOVR    R1,     R7                      ; D029   008F

        DECLE   $000F,  $0007,  $0000,  $0000   ; D02A   000F 0007 0000 0000
        DECLE   $0000,  $0000,  $00F7,  $00F7   ; D02E   0000 0000 00F7 00F7

        ADDR    R4,     R0                      ; D032   00E0
        ADDR    R4,     R0                      ; D033   00E0
        ADDR    R4,     R0                      ; D034   00E0
        ADDR    R4,     R7                      ; D035   00E7
        ADDR    R4,     R7                      ; D036   00E7

        DECLE   $00C0,  $00FF,  $00FF,  $0000   ; D037   00C0 00FF 00FF 0000
        DECLE   $0000,  $0000                   ; D03B   0000 0000

        ADDR    R4,     R7                      ; D03D   00E7
        ADDR    R4,     R7                      ; D03E   00E7

        DECLE   $0000                           ; D03F   0000
L_D040:
        ADDR    R0,     R0                      ; D040   00C0
        DECLE   $00E0,  $0070,  $0030,  $0070   ; D041   00E0 0070 0030 0070
        DECLE   $00E0,  $00E0,  $00F0,  $001C   ; D045   00E0 00E0 00F0 001C
        DECLE   $001C,  $001C,  $001C,  $001C   ; D049   001C 001C 001C 001C
        DECLE   $001D,  $001D,  $001C,  $001C   ; D04D   001D 001D 001C 001C
        DECLE   $001C,  $001C,  $001C,  $0000   ; D051   001C 001C 001C 0000
        DECLE   $0000,  $0000,  $0000,  $001F   ; D055   0000 0000 0000 001F
        DECLE   $001F,  $001C,  $001C,  $001C   ; D059   001F 001C 001C 001C
        DECLE   $001F,  $001F                   ; D05D   001F 001F

        COMR    R4                              ; D05F   001C
        ADDR    R4,     R3                      ; D060   00E3
        ADDR    R4,     R7                      ; D061   00E7
        INCR    R7                              ; D062   000F

        INCR    R6                              ; D063   000E
L_D064:
        INCR    R6                              ; D064   000E
        MOVR    R1,     R6                      ; D065   008E
        MOVR    R1,     R6                      ; D066   008E
        INCR    R6                              ; D067   000E
        INCR    R6                              ; D068   000E
        INCR    R7                              ; D069   000F

        SETC                                    ; D06A   0007
L_D06B:
        DIS                                     ; D06B   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; D06C   0000 0000 0000 0000
        DECLE   $00BF,  $00BF,  $001E,  $000E   ; D070   00BF 00BF 001E 000E
        DECLE   $000E,  $000E,  $000E,  $000E   ; D074   000E 000E 000E 000E
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D078   00FF 00FF 00FF 00FF
        DECLE   $007F,  $003F                   ; D07C   007F 003F

        MOVR    R3,     R7                      ; D07E   009F
        ADDR    R1,     R7                      ; D07F   00CF

        DECLE   $00F8,  $00FC,  $000E,  $0006   ; D080   00F8 00FC 000E 0006
        DECLE   $000E,  $00FC,  $00FC,  $001E   ; D084   000E 00FC 00FC 001E
        DECLE   $003B,  $007B,  $00F1,  $00E0   ; D088   003B 007B 00F1 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; D08C   00E0 00E0 00E0 00E0
        DECLE   $00E0,  $00F1,  $007B,  $003B   ; D090   00E0 00F1 007B 003B
        DECLE   $0000,  $0000,  $0000,  $0000   ; D094   0000 0000 0000 0000

        MOVR    R1,     R7                      ; D098   008F
        ADDR    R1,     R7                      ; D099   00CF

        DECLE   $00E0,  $00E0,  $0000,  $000F   ; D09A   00E0 00E0 0000 000F
        DECLE   $000F,  $0000                   ; D09E   000F 0000

        ADDR    R4,     R0                      ; D0A0   00E0
        ADDR    R4,     R0                      ; D0A1   00E0
        ADDR    R1,     R7                      ; D0A2   00CF
        MOVR    R1,     R7                      ; D0A3   008F

        DECLE   $0000,  $0000,  $0000,  $0000   ; D0A4   0000 0000 0000 0000
        DECLE   $00E0,  $00E0,  $0000,  $0000   ; D0A8   00E0 00E0 0000 0000
        DECLE   $0000                           ; D0AC   0000

        ADDR    R0,     R0                      ; D0AD   00C0
L_D0AE:
        ADDR    R0,     R0                      ; D0AE   00C0
        DECLE   $0000,  $0000,  $0000,  $00E0   ; D0AF   0000 0000 0000 00E0
        DECLE   $00E0,  $0000,  $0000,  $0000   ; D0B3   00E0 0000 0000 0000
        DECLE   $0000                           ; D0B7   0000

        RSWD    R4                              ; D0B8   003C
        SWAP    R2,     1                       ; D0B9   0042
        MOVR    R3,     R1                      ; D0BA   0099
        MOVR    R4,     R1                      ; D0BB   00A1
        MOVR    R3,     R1                      ; D0BC   0099
        SWAP    R2,     1                       ; D0BD   0042
L_D0BE:
        RSWD    R4                              ; D0BE   003C
        DECLE   $0000,  $00E7,  $00D3,  $0099   ; D0BF   0000 00E7 00D3 0099
        DECLE   $008C,  $0006,  $0003,  $0001   ; D0C3   008C 0006 0003 0001
        DECLE   $0000,  $0070,  $0070,  $0070   ; D0C7   0000 0070 0070 0070
        DECLE   $0070,  $0000,  $0000,  $0000   ; D0CB   0070 0000 0000 0000
        DECLE   $0000,  $0000,  $003F,  $0001   ; D0CF   0000 0000 003F 0001
        DECLE   $0080,  $0080,  $00C0,  $00F0   ; D0D3   0080 0080 00C0 00F0
        DECLE   $00FC,  $00FF                   ; D0D7   00FC 00FF

        ADDR    R5,     R3                      ; D0D9   00EB
        MOVR    R7,     R6                      ; D0DA   00BE
        ADDR    R4,     R3                      ; D0DB   00E3
        SWAP    R1,     1                       ; D0DC   0041
        ADDR    R4,     R3                      ; D0DD   00E3
        MOVR    R7,     R6                      ; D0DE   00BE
        ADDR    R5,     R3                      ; D0DF   00EB
        ADDR    R7,     R2                      ; D0E0   00FA
        ADDR    R6,     R4                      ; D0E1   00F4
        ADDR    R5,     R1                      ; D0E2   00E9
        ADDR    R2,     R3                      ; D0E3   00D3
L_D0E4:
        MOVR    R4,     R7                      ; D0E4   00A7

        SLL     R3,     2                       ; D0E5   004F
        MOVR    R3,     R7                      ; D0E6   009F

        DECLE   $003F,  $007F,  $003F           ; D0E7   003F 007F 003F

        MOVR    R3,     R7                      ; D0EA   009F
        ADDR    R1,     R7                      ; D0EB   00CF

        DECLE   $0067,  $0033,  $0019,  $000C   ; D0EC   0067 0033 0019 000C
        DECLE   $0030,  $0098,  $00CC,  $00E6   ; D0F0   0030 0098 00CC 00E6
        DECLE   $00F3,  $00F9,  $00FC,  $00FE   ; D0F4   00F3 00F9 00FC 00FE
        DECLE   $0000,  $00EA,  $008A,  $00CA   ; D0F8   0000 00EA 008A 00CA
        DECLE   $008A,  $008E,  $0000,  $0000   ; D0FC   008A 008E 0000 0000
        DECLE   $0000,  $00E8,  $0088,  $00C8   ; D100   0000 00E8 0088 00C8
        DECLE   $0088,  $00EE,  $0000,  $0000   ; D104   0088 00EE 0000 0000
        DECLE   $0000,  $0001,  $0001,  $0005   ; D108   0000 0001 0001 0005
        DECLE   $006D,  $006D,  $0020,  $0060   ; D10C   006D 006D 0020 0060
        DECLE   $0000,  $008E,  $008A,  $008E   ; D110   0000 008E 008A 008E
        DECLE   $008A,  $00EA,  $0000,  $0000   ; D114   008A 00EA 0000 0000
        DECLE   $0000,  $00EE,  $0088,  $00EC   ; D118   0000 00EE 0088 00EC
        DECLE   $0028,  $00EE,  $0000,  $0000   ; D11C   0028 00EE 0000 0000
        DECLE   $0000,  $00E0,  $00A0,  $00C0   ; D120   0000 00E0 00A0 00C0
        DECLE   $00A0,  $00A0,  $0000,  $0000   ; D124   00A0 00A0 0000 0000
        DECLE   $0000,  $00A0,  $00A0,  $00E0   ; D128   0000 00A0 00A0 00E0
        DECLE   $00AC,  $00A4,  $0008,  $000C   ; D12C   00AC 00A4 0008 000C
        DECLE   $0000,  $00E0,  $00A0,  $00A0   ; D130   0000 00E0 00A0 00A0
        DECLE   $00A0,  $00E0,  $0000,  $0000   ; D134   00A0 00E0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0007   ; D138   0000 0000 0000 0007
        DECLE   $0038,  $00C0,  $0003,  $00FC   ; D13C   0038 00C0 0003 00FC
        DECLE   $0018,  $003C,  $00FF,  $00FF   ; D140   0018 003C 00FF 00FF
        DECLE   $007F,  $00FF,  $00FF,  $00FC   ; D144   007F 00FF 00FF 00FC
        DECLE   $0000,  $0000,  $00E0,  $00DE   ; D148   0000 0000 00E0 00DE
        DECLE   $00BD,  $00BD,  $00FF,  $00FF   ; D14C   00BD 00BD 00FF 00FF
        DECLE   $0000,  $0000                   ; D150   0000 0000

        DIS                                     ; D152   0003
        INCR    R7                              ; D153   000F

        RSWD    R6                              ; D154   003E
L_D155:
        ADDR    R7,     R4                      ; D155   00FC
        DECLE   $0098,  $0008,  $0006,  $0003   ; D156   0098 0008 0006 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; D15A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $009C   ; D15E   0000 0000 0008 009C
        DECLE   $007F,  $0000,  $0000,  $001F   ; D162   007F 0000 0000 001F
        DECLE   $0000,  $0000,  $007F,  $00FF   ; D166   0000 0000 007F 00FF
L_D16A:
        ADDR    R7,     R0                      ; D16A   00F8
        DECLE   $00E0,  $0070,  $00FF,  $0000   ; D16B   00E0 0070 00FF 0000
        DECLE   $0000,  $0018,  $003C,  $0042   ; D16F   0000 0018 003C 0042
        DECLE   $00BD,  $007E,  $00FF,  $007E   ; D173   00BD 007E 00FF 007E
        DECLE   $0000,  $00BD,  $00DB,  $0000   ; D177   0000 00BD 00DB 0000
        DECLE   $0042,  $0081,  $0000,  $0000   ; D17B   0042 0081 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D17F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000C,  $000A   ; D183   0000 0000 000C 000A
        DECLE   $0006,  $0001,  $0000,  $0001   ; D187   0006 0001 0000 0001
        DECLE   $0002,  $001F,  $000F,  $0000   ; D18B   0002 001F 000F 0000
        DECLE   $0000,  $00FF,  $00FF,  $00C0   ; D18F   0000 00FF 00FF 00C0
        DECLE   $00C0,  $00C0,  $00FF,  $00FF   ; D193   00C0 00C0 00FF 00FF
        DECLE   $00FF                           ; D197   00FF

        SETC                                    ; D198   0007
        MOVR    R5,     R7                      ; D199   00AF

        DECLE   $001F,  $001C,  $003C,  $002F   ; D19A   001F 001C 003C 002F
        DECLE   $002F,  $0000,  $00DC,  $00E3   ; D19E   002F 0000 00DC 00E3
        DECLE   $00E3,  $0076,  $0076,  $00FB   ; D1A2   00E3 0076 0076 00FB
        DECLE   $00FB,  $0000,  $0000,  $0055   ; D1A6   00FB 0000 0000 0055
        DECLE   $0000,  $0080,  $00C0,  $00F0   ; D1AA   0000 0080 00C0 00F0
        DECLE   $00F0,  $0000,  $000F,  $00FF   ; D1AE   00F0 0000 000F 00FF
        DECLE   $000F,  $00FF,  $0003,  $0000   ; D1B2   000F 00FF 0003 0000
        DECLE   $0000,  $0000,  $00E0,  $00FF   ; D1B6   0000 0000 00E0 00FF
        DECLE   $00E0,  $00FF,  $00E0,  $00F0   ; D1BA   00E0 00FF 00E0 00F0
        DECLE   $00FE,  $00FF,  $0007,  $00FF   ; D1BE   00FE 00FF 0007 00FF
        DECLE   $0003,  $00FF,  $0003,  $0001   ; D1C2   0003 00FF 0003 0001
        DECLE   $0000,  $0000,  $00C0,  $00FF   ; D1C6   0000 0000 00C0 00FF
        DECLE   $00C0,  $00FF,  $00C0,  $0081   ; D1CA   00C0 00FF 00C0 0081
        DECLE   $0001,  $0003,  $000F,  $000F   ; D1CE   0001 0003 000F 000F
        DECLE   $000F,  $000F,  $000F,  $00FF   ; D1D2   000F 000F 000F 00FF
        DECLE   $00FF                           ; D1D6   00FF

        INCR    R7                              ; D1D7   000F

        ADDR    R7,     R6                      ; D1D8   00FE
L_D1D9:
        ADDR    R7,     R4                      ; D1D9   00FC
        DECLE   $00F0,  $00C0,  $00C0,  $00FF   ; D1DA   00F0 00C0 00C0 00FF
        DECLE   $00FF,  $00C0,  $000F,  $00FF   ; D1DE   00FF 00C0 000F 00FF
        DECLE   $00FF,  $000F,  $000F,  $001F   ; D1E2   00FF 000F 000F 001F
        DECLE   $003F,  $007F,  $00C0,  $00FF   ; D1E6   003F 007F 00C0 00FF
        DECLE   $00FF,  $00C0,  $0080,  $0000   ; D1EA   00FF 00C0 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D1EE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $0000   ; D1F2   0000 0000 00FF 0000
        DECLE   $00FF,  $0000,  $00FF,  $007F   ; D1F6   00FF 0000 00FF 007F
        DECLE   $000F,  $0007,  $00FF,  $0007   ; D1FA   000F 0007 00FF 0007
        DECLE   $00FF,  $0007,  $00E8,  $00E8   ; D1FE   00FF 0007 00E8 00E8
        DECLE   $00E2,  $00E2,  $00E8,  $00E8   ; D202   00E2 00E2 00E8 00E8
        DECLE   $00E0,  $00E0,  $00E9,  $00E9   ; D206   00E0 00E0 00E9 00E9
        DECLE   $00E2,  $00E2,  $00E4,  $00E4   ; D20A   00E2 00E2 00E4 00E4
        DECLE   $00E8,  $00E8,  $00FC,  $00FC   ; D20E   00E8 00E8 00FC 00FC
        DECLE   $00F8,  $00F8,  $00F2,  $00F2   ; D212   00F8 00F8 00F2 00F2
        DECLE   $00E0,  $00E0,  $0000,  $0054   ; D216   00E0 00E0 0000 0054
        DECLE   $0001,  $00A9,  $0003,  $0013   ; D21A   0001 00A9 0003 0013
        DECLE   $0007,  $0007,  $000F,  $004F   ; D21E   0007 0007 000F 004F
        DECLE   $001F,  $009F,  $003F,  $003F   ; D222   001F 009F 003F 003F
        DECLE   $007F,  $007F,  $0000,  $0052   ; D226   007F 007F 0000 0052
        DECLE   $0000,  $00A4,  $0000,  $0000   ; D22A   0000 00A4 0000 0000
        DECLE   $0009,  $0000,  $00FF,  $0080   ; D22E   0009 0000 00FF 0080
        DECLE   $00BF,  $00A0,  $00A0,  $00A0   ; D232   00BF 00A0 00A0 00A0
        DECLE   $00A0,  $00A0,  $0000,  $0000   ; D236   00A0 00A0 0000 0000
        DECLE   $0000,  $0080,  $0000,  $0000   ; D23A   0000 0080 0000 0000
        DECLE   $0000,  $0080,  $0022,  $0000   ; D23E   0000 0080 0022 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D242   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FC   ; D246   0000 0000 00FF 00FC
        DECLE   $00F0,  $00C0,  $00C0,  $0000   ; D24A   00F0 00C0 00C0 0000
        DECLE   $0000,  $0000,  $0001,  $0043   ; D24E   0000 0000 0001 0043
        DECLE   $00F7,  $002D,  $00D9,  $0031   ; D252   00F7 002D 00D9 0031
        DECLE   $0061,  $00E3,  $00FF,  $00C1   ; D256   0061 00E3 00FF 00C1
        DECLE   $00A2,  $0094,  $0088,  $0094   ; D25A   00A2 0094 0088 0094
        DECLE   $00A2,  $00C1,  $0000,  $0022   ; D25E   00A2 00C1 0000 0022
        DECLE   $00FF,  $0044,  $00FF,  $0088   ; D262   00FF 0044 00FF 0088
        DECLE   $0000,  $0000,  $0001,  $0003   ; D266   0000 0000 0001 0003
        DECLE   $0007,  $000D,  $0019,  $0031   ; D26A   0007 000D 0019 0031
        DECLE   $0061,  $00E3,  $00F3,  $00C5   ; D26E   0061 00E3 00F3 00C5
        DECLE   $0061,  $0080,  $0010,  $0003   ; D272   0061 0080 0010 0003
        DECLE   $00A1,  $00DB,  $00FF,  $0000   ; D276   00A1 00DB 00FF 0000
        DECLE   $0018,  $0024,  $0024,  $0018   ; D27A   0018 0024 0024 0018
        DECLE   $0000,  $00FF,  $0000,  $00C0   ; D27E   0000 00FF 0000 00C0
        DECLE   $0020,  $0010,  $0010,  $0020   ; D282   0020 0010 0010 0020
        DECLE   $00C0,  $0000,  $0050,  $008C   ; D286   00C0 0000 0050 008C
        DECLE   $001E,  $00AC,  $003A,  $001C   ; D28A   001E 00AC 003A 001C
        DECLE   $00B0,  $0040,  $0000           ; D28E   00B0 0040 0000

        NOP                                     ; D291   0034
        SARC    R2,     2                       ; D292   007E
        RSWD    R6                              ; D293   003E
        SARC    R2,     1                       ; D294   007A
        RSWD    R4                              ; D295   003C
        SLL     R2,     1                       ; D296   004A
        MOVR    R5,     R1                      ; D297   00A9
        INCR    R4                              ; D298   000C
        RSWD    R2                              ; D299   003A
        MOVR    R3,     R6                      ; D29A   009E
        SARC    R3,     2                       ; D29B   007F
        ADDR    R5,     R7                      ; D29C   00EF

        DECLE   $00FC,  $005E,  $0024,  $0040   ; D29D   00FC 005E 0024 0040
        DECLE   $0080,  $0008,  $009C,  $0014   ; D2A1   0080 0008 009C 0014
        DECLE   $0008,  $0080,  $0040,  $0000   ; D2A5   0008 0080 0040 0000
        DECLE   $0000,  $0008,  $003C,  $0078   ; D2A9   0000 0008 003C 0078
        DECLE   $003C,  $004A,  $0028,  $0000   ; D2AD   003C 004A 0028 0000
        DECLE   $0000,  $0010,  $002C,  $003C   ; D2B1   0000 0010 002C 003C
        DECLE   $0018,  $0000,  $0000,  $00FF   ; D2B5   0018 0000 0000 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00CC   ; D2B9   00FF 00FF 00FF 00CC
        DECLE   $00CC,  $00CC,  $00CC,  $00FC   ; D2BD   00CC 00CC 00CC 00FC
        DECLE   $00FC,  $00FC,  $00FC,  $00CC   ; D2C1   00FC 00FC 00FC 00CC
        DECLE   $00CC,  $00CC,  $00CC,  $0000   ; D2C5   00CC 00CC 00CC 0000
        DECLE   $0000,  $000F,  $000C,  $000F   ; D2C9   0000 000F 000C 000F
        DECLE   $000C,  $000F,  $000C,  $0000   ; D2CD   000C 000F 000C 0000
        DECLE   $0000,  $00FF,  $00CC,  $00FF   ; D2D1   0000 00FF 00CC 00FF
        DECLE   $00CC,  $00FF,  $00CC,  $0000   ; D2D5   00CC 00FF 00CC 0000
        DECLE   $0000,  $00C0,  $00C0,  $00C0   ; D2D9   0000 00C0 00C0 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $0000   ; D2DD   00C0 00C0 00C0 0000
        DECLE   $0000,  $0000,  $0000           ; D2E1   0000 0000 0000

        ADDR    R7,     R6                      ; D2E4   00FE
        ADDR    R7,     R6                      ; D2E5   00FE
        MOVR    R5,     R2                      ; D2E6   00AA
        MOVR    R5,     R2                      ; D2E7   00AA
        ADDR    R7,     R6                      ; D2E8   00FE
        ADDR    R7,     R6                      ; D2E9   00FE
        MOVR    R5,     R2                      ; D2EA   00AA
        MOVR    R5,     R2                      ; D2EB   00AA
        ADDR    R7,     R6                      ; D2EC   00FE
        ADDR    R7,     R6                      ; D2ED   00FE
        MOVR    R5,     R2                      ; D2EE   00AA
        MOVR    R5,     R2                      ; D2EF   00AA
        ADDR    R0,     R0                      ; D2F0   00C0
        TSTR    R0                              ; D2F1   0080
        MOVR    R0,     R7                      ; D2F2   0087

        DECLE   $0007,  $0000,  $0000,  $0000   ; D2F3   0007 0000 0000 0000
        DECLE   $0000,  $000E,  $001E,  $00BC   ; D2F7   0000 000E 001E 00BC
        DECLE   $00B8,  $0000,  $0000,  $0000   ; D2FB   00B8 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; D2FF   0000 0000 0000 0010
        DECLE   $0010,  $0010,  $0038,  $0044   ; D303   0010 0010 0038 0044
        DECLE   $00C6,  $0044,  $0038,  $0010   ; D307   00C6 0044 0038 0010
        DECLE   $0010,  $0010,  $0000,  $0000   ; D30B   0010 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; D30F   0000 0000 0000 0010
        DECLE   $0010,  $0010,  $0038,  $0044   ; D313   0010 0010 0038 0044
        DECLE   $00D6,  $0044,  $0038,  $0010   ; D317   00D6 0044 0038 0010
        DECLE   $0010,  $0010,  $0000,  $0000   ; D31B   0010 0010 0000 0000
        DECLE   $0000                           ; D31F   0000

        INCR    R6                              ; D320   000E
        COMR    R3                              ; D321   001B
        DECR    R1                              ; D322   0011
        GSWD    R1                              ; D323   0031
        SARC    R1,     2                       ; D324   007D
        ADDR    R2,     R7                      ; D325   00D7

        DECLE   $009B,  $008E,  $0082,  $0082   ; D326   009B 008E 0082 0082
        DECLE   $0082,  $00C6,  $007C,  $0038   ; D32A   0082 00C6 007C 0038
        DECLE   $0000,  $0000,  $0002,  $0005   ; D32E   0000 0000 0002 0005
        DECLE   $000D,  $0012,  $0012,  $0032   ; D332   000D 0012 0012 0032
        DECLE   $005C,  $0088,  $0088,  $0088   ; D336   005C 0088 0088 0088
        DECLE   $0050,  $0020,  $0000,  $0000   ; D33A   0050 0020 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0004   ; D33E   0000 0000 0001 0004
        DECLE   $0001,  $0004                   ; D342   0001 0004

        INCR    R2                              ; D344   000A

        JSR     R4,     .EXEC.028               ; D345   0004 0010 0028
        DECLE   $0028,  $0010,  $0000,  $0000   ; D348   0028 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D34C   0000 0000 0000 0000

        INCR    R6                              ; D350   000E
        COMR    R3                              ; D351   001B
        DECR    R1                              ; D352   0011
        GSWD    R1                              ; D353   0031
        SARC    R1,     2                       ; D354   007D
        ADDR    R2,     R7                      ; D355   00D7

        DECLE   $009B,  $008E,  $0082,  $0082   ; D356   009B 008E 0082 0082
        DECLE   $0082,  $00C6,  $007C,  $0038   ; D35A   0082 00C6 007C 0038
        DECLE   $0000,  $0000,  $0002,  $0005   ; D35E   0000 0000 0002 0005
        DECLE   $000D,  $0016,  $0012,  $0012   ; D362   000D 0016 0012 0012
        DECLE   $000C,  $0000,  $0000,  $0000   ; D366   000C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D36A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0003   ; D36E   0000 0000 0003 0003
        DECLE   $0003,  $0000,  $0000,  $0000   ; D372   0003 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D376   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D37A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D37E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; D382   0000 0000 0000 0018
        DECLE   $0024,  $005A,  $005A,  $0024   ; D386   0024 005A 005A 0024
        DECLE   $0018,  $0000,  $0000,  $0000   ; D38A   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D38E   0000 0000 0000 0000
        DECLE   $0000,  $0021,  $0018,  $0042   ; D392   0000 0021 0018 0042
        DECLE   $0098,  $0024,  $0024,  $0019   ; D396   0098 0024 0024 0019
        DECLE   $0042,  $0018,  $0084,  $0020   ; D39A   0042 0018 0084 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; D39E   0000 0000 0000 0000
        DECLE   $0020,  $0004,  $0080,  $0000   ; D3A2   0020 0004 0080 0000
        DECLE   $0001,  $0000,  $0000,  $0080   ; D3A6   0001 0000 0000 0080
        DECLE   $0001,  $0000,  $0020,  $0004   ; D3AA   0001 0000 0020 0004
        DECLE   $0000,  $0000,  $0000,  $0008   ; D3AE   0000 0000 0000 0008
        DECLE   $0008,  $0008,  $0008,  $0008   ; D3B2   0008 0008 0008 0008
        DECLE   $0008,  $0008,  $000C,  $000C   ; D3B6   0008 0008 000C 000C
        DECLE   $000C,  $001C,  $003C,  $001E   ; D3BA   000C 001C 003C 001E
        DECLE   $007F,  $007F,  $0000,  $0008   ; D3BE   007F 007F 0000 0008
        DECLE   $0008,  $0008,  $0008,  $0008   ; D3C2   0008 0008 0008 0008
        DECLE   $0008,  $0008,  $0008,  $000C   ; D3C6   0008 0008 0008 000C
        DECLE   $001C,  $001C,  $001C,  $0036   ; D3CA   001C 001C 001C 0036
        DECLE   $007F,  $007F,  $0000,  $0008   ; D3CE   007F 007F 0000 0008
        DECLE   $0008,  $0008,  $0008,  $0008   ; D3D2   0008 0008 0008 0008
        DECLE   $0008,  $0008,  $0008,  $0018   ; D3D6   0008 0008 0008 0018
        DECLE   $001C,  $001C,  $001E,  $003C   ; D3DA   001C 001C 001E 003C
        DECLE   $007F,  $007F,  $0000,  $0008   ; D3DE   007F 007F 0000 0008
        DECLE   $0008,  $0008,  $0008,  $0008   ; D3E2   0008 0008 0008 0008
        DECLE   $0008,  $0008,  $0018,  $0018   ; D3E6   0008 0008 0018 0018
        DECLE   $0018,  $001C,  $001C,  $003E   ; D3EA   0018 001C 001C 003E
        DECLE   $007F,  $007F,  $0000,  $00FF   ; D3EE   007F 007F 0000 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D3F2   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D3F6   00FF 00FF 00FF 00FF
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; D3FA   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D3FE   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $0000,  $00FF,  $00FF   ; D402   00FF 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; D406   00FF 00FF 00FF 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D40A   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0020,  $0050   ; D40E   00FF 00FF 0020 0050
        DECLE   $0088,  $0020,  $0088,  $0050   ; D412   0088 0020 0088 0050
        DECLE   $0020,  $0000,  $0020,  $0010   ; D416   0020 0000 0020 0010
        DECLE   $0088,  $00A8,  $0088,  $0040   ; D41A   0088 00A8 0088 0040
        DECLE   $0020,  $0000,  $0020,  $0040   ; D41E   0020 0000 0020 0040
        DECLE   $0088,  $00A8,  $0088,  $0010   ; D422   0088 00A8 0088 0010
        DECLE   $0020,  $0000                   ; D426   0020 0000

        TSTR    R0                              ; D428   0080
        TSTR    R0                              ; D429   0080
        TSTR    R0                              ; D42A   0080
        TSTR    R0                              ; D42B   0080
        TSTR    R0                              ; D42C   0080
        TSTR    R0                              ; D42D   0080
        TSTR    R0                              ; D42E   0080
        TSTR    R0                              ; D42F   0080
        TSTR    R0                              ; D430   0080
        TSTR    R0                              ; D431   0080
        TSTR    R0                              ; D432   0080
        TSTR    R0                              ; D433   0080
        TSTR    R0                              ; D434   0080
        TSTR    R0                              ; D435   0080
        TSTR    R0                              ; D436   0080
        TSTR    R0                              ; D437   0080
        COMR    R4                              ; D438   001C
        DECR    R4                              ; D439   0014
        DECR    R4                              ; D43A   0014
        DECR    R4                              ; D43B   0014
        COMR    R4                              ; D43C   001C
        INCR    R0                              ; D43D   0008
        INCR    R0                              ; D43E   0008
        INCR    R0                              ; D43F   0008
        INCR    R0                              ; D440   0008
        INCR    R0                              ; D441   0008
        COMR    R4                              ; D442   001C

        JSR     R4,     .EXEC.C10               ; D443   0004 001C 0010

        COMR    R4                              ; D446   001C
        COMR    R4                              ; D447   001C

        JSR     R4,     .EXEC.C04               ; D448   0004 001C 0004
        DECLE   $001C,  $0014,  $0014,  $001C   ; D44B   001C 0014 0014 001C
        DECLE   $0004                           ; D44F   0004

        JSR     R4,     .EXEC.C10               ; D450   0004 001C 0010

        COMR    R4                              ; D453   001C

        JSR     R4,     .EXEC.C10               ; D454   0004 001C 0010
        DECLE   $0010,  $001C,  $0014,  $001C   ; D457   0010 001C 0014 001C
        DECLE   $001C,  $0004,  $0008,  $0008   ; D45B   001C 0004 0008 0008
        DECLE   $0008,  $001C,  $0014,  $001C   ; D45F   0008 001C 0014 001C
        DECLE   $0014,  $001C,  $001C,  $0014   ; D463   0014 001C 001C 0014
        DECLE   $001C,  $0004,  $0004,  $00FF   ; D467   001C 0004 0004 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; D46B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D46F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D473   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D477   0000 0000 0000 0000
        DECLE   $00FF,  $0000,  $0000,  $0000   ; D47B   00FF 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D47F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D483   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D487   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D48B   0000 0000 0000

        INCR    R7                              ; D48E   000F

        RRC     R0,     1                       ; D48F   0070
L_D490:
        TSTR    R0                              ; D490   0080
        DECLE   $0080,  $0070,  $000F,  $0000   ; D491   0080 0070 000F 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D495   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D499   0000 0000 0000 0000
        DECLE   $0007,  $0018,  $0060,  $0080   ; D49D   0007 0018 0060 0080
        DECLE   $0080,  $0060,  $0018,  $0007   ; D4A1   0080 0060 0018 0007
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4A5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D4A9   0000 0000 0000 0001
        DECLE   $000E,  $0030,  $0040,  $0080   ; D4AD   000E 0030 0040 0080
        DECLE   $0080,  $0080,  $0040,  $0030   ; D4B1   0080 0080 0040 0030
        DECLE   $000E,  $0001,  $0000,  $0000   ; D4B5   000E 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D4B9   0000 0000 0000 0001
        DECLE   $0006,  $0008,  $0010,  $0020   ; D4BD   0006 0008 0010 0020
        DECLE   $0020,  $0020,  $0020,  $0010   ; D4C1   0020 0020 0020 0010
        DECLE   $0008,  $0006,  $0001,  $0000   ; D4C5   0008 0006 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4C9   0000 0000 0000 0000
        DECLE   $0001,  $0002,  $0002,  $0004   ; D4CD   0001 0002 0002 0004
        DECLE   $0004,  $0004,  $0004,  $0002   ; D4D1   0004 0004 0004 0002
        DECLE   $0002,  $0001,  $0000,  $0000   ; D4D5   0002 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4D9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4DD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4E1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4E5   0000 0000 0000 0000
        DECLE   $0000,  $00FF,  $0000,  $0000   ; D4E9   0000 00FF 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4ED   0000 0000 0000 0000
        DECLE   $000C,  $000A,  $0006,  $0001   ; D4F1   000C 000A 0006 0001
        DECLE   $0000,  $0001,  $0002,  $001F   ; D4F5   0000 0001 0002 001F
        DECLE   $000F,  $0000,  $00FF,  $0000   ; D4F9   000F 0000 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4FD   0000 0000 0000 0000
        DECLE   $000C,  $000A,  $0006,  $0001   ; D501   000C 000A 0006 0001
        DECLE   $0000,  $0001,  $0002,  $001F   ; D505   0000 0001 0002 001F
        DECLE   $000F,  $0000,  $0000,  $0000   ; D509   000F 0000 0000 0000
        DECLE   $00FF,  $0000,  $0000,  $0000   ; D50D   00FF 0000 0000 0000
        DECLE   $000C,  $000A,  $0006,  $00F1   ; D511   000C 000A 0006 00F1
        DECLE   $0000,  $0001,  $000F,  $0003   ; D515   0000 0001 000F 0003
        DECLE   $0000,  $0000,  $0003,  $00FC   ; D519   0000 0000 0003 00FC
        DECLE   $0000,  $0000,  $0000,  $0000   ; D51D   0000 0000 0000 0000
        DECLE   $000C,  $000A,  $0006,  $0001   ; D521   000C 000A 0006 0001
        DECLE   $00F8,  $0001,  $000F,  $0003   ; D525   00F8 0001 000F 0003
        DECLE   $0000,  $0000,  $0007,  $00F8   ; D529   0000 0000 0007 00F8
        DECLE   $0000,  $0000,  $0000,  $0000   ; D52D   0000 0000 0000 0000
        DECLE   $000C,  $000A,  $000E,  $0006   ; D531   000C 000A 000E 0006
        DECLE   $0000,  $00CD,  $0006,  $0003   ; D535   0000 00CD 0006 0003
        DECLE   $0001,  $0000,  $001F,  $00E0   ; D539   0001 0000 001F 00E0
        DECLE   $0000,  $0000,  $0000,  $0000   ; D53D   0000 0000 0000 0000
        DECLE   $0000,  $0006,  $0002,  $000C   ; D541   0000 0006 0002 000C
        DECLE   $000C,  $0007,  $00E6,  $001B   ; D545   000C 0007 00E6 001B
        DECLE   $0003,  $0001,  $001E,  $00E0   ; D549   0003 0001 001E 00E0
        DECLE   $0000,  $0006,  $0006,  $0007   ; D54D   0000 0006 0006 0007
        DECLE   $0006,  $0006,  $0006,  $0007   ; D551   0006 0006 0006 0007
        DECLE   $0006,  $0006,  $00E0,  $001E   ; D555   0006 0006 00E0 001E
        DECLE   $0001,  $0000,  $0000,  $0007   ; D559   0001 0000 0000 0007
        DECLE   $0018,  $0023,  $0043,  $0083   ; D55D   0018 0023 0043 0083
        DECLE   $0083,  $0083,  $0083,  $0043   ; D561   0083 0083 0083 0043
        DECLE   $0020,  $0018,  $0007,  $0000   ; D565   0020 0018 0007 0000
        DECLE   $0000,  $00FF,  $0000,  $0018   ; D569   0000 00FF 0000 0018
        DECLE   $003C,  $0042,  $00BD,  $007E   ; D56D   003C 0042 00BD 007E
        DECLE   $00FF,  $007E,  $0000,  $00BD   ; D571   00FF 007E 0000 00BD
        DECLE   $00DB,  $0000,  $0042,  $0081   ; D575   00DB 0000 0042 0081
        DECLE   $0000,  $0000,  $00FF,  $0018   ; D579   0000 0000 00FF 0018
        DECLE   $003C,  $0042,  $00BD,  $007E   ; D57D   003C 0042 00BD 007E
        DECLE   $00FF,  $007E,  $0000,  $00BD   ; D581   00FF 007E 0000 00BD
        DECLE   $00DB,  $0000,  $0042,  $0081   ; D585   00DB 0000 0042 0081
        DECLE   $0000,  $0000,  $0000,  $0000   ; D589   0000 0000 0000 0000
        DECLE   $00FF,  $0000,  $0042,  $00BD   ; D58D   00FF 0000 0042 00BD
        DECLE   $007E,  $00FF                   ; D591   007E 00FF

        SWAP    R2,     1                       ; D593   0042
        MOVR    R7,     R5                      ; D594   00BD
        ADDR    R3,     R3                      ; D595   00DB
        NEGR    R4                              ; D596   0024
        SWAP    R2,     1                       ; D597   0042
        ADDR    R0,     R3                      ; D598   00C3
        ADDR    R4,     R7                      ; D599   00E7

        DECLE   $0000,  $00FF,  $0000,  $0000   ; D59A   0000 00FF 0000 0000
        DECLE   $0000,  $0042,  $00BD,  $007E   ; D59E   0000 0042 00BD 007E
        DECLE   $00FF                           ; D5A2   00FF

        SWAP    R2,     1                       ; D5A3   0042
        MOVR    R7,     R5                      ; D5A4   00BD
        ADDR    R3,     R3                      ; D5A5   00DB
        NEGR    R4                              ; D5A6   0024
        SLLC    R2,     1                       ; D5A7   005A
        ADDR    R0,     R3                      ; D5A8   00C3
        ADDR    R4,     R7                      ; D5A9   00E7

        DECLE   $0000,  $00FF,  $0000,  $0000   ; D5AA   0000 00FF 0000 0000
        DECLE   $0000,  $003C,  $0042,  $00BD   ; D5AE   0000 003C 0042 00BD
        DECLE   $00BD,  $0042,  $00FF,  $00FF   ; D5B2   00BD 0042 00FF 00FF
        DECLE   $005A,  $0081,  $007E,  $0081   ; D5B6   005A 0081 007E 0081
        DECLE   $00FF,  $0000,  $0000,  $0000   ; D5BA   00FF 0000 0000 0000
        DECLE   $0000                           ; D5BE   0000

        RSWD    R4                              ; D5BF   003C
        SWAP    R2,     1                       ; D5C0   0042
        MOVR    R7,     R5                      ; D5C1   00BD
        MOVR    R7,     R5                      ; D5C2   00BD
        SLLC    R2,     1                       ; D5C3   005A
        ADDR    R4,     R7                      ; D5C4   00E7

        DECLE   $00FF,  $003C,  $0099,  $0018   ; D5C5   00FF 003C 0099 0018
        DECLE   $007E,  $00FF,  $0000,  $0000   ; D5C9   007E 00FF 0000 0000
        DECLE   $0018,  $003C,  $0042,  $00BD   ; D5CD   0018 003C 0042 00BD
        DECLE   $007E,  $007E,  $00BD,  $001C   ; D5D1   007E 007E 00BD 001C
        DECLE   $0008,  $0008,  $003E,  $0008   ; D5D5   0008 0008 003E 0008
        DECLE   $00F7,  $0000,  $00FF,  $0000   ; D5D9   00F7 0000 00FF 0000
        DECLE   $0000,  $0018,  $0024,  $00BD   ; D5DD   0000 0018 0024 00BD
        DECLE   $007E,  $00BD,  $0018,  $0008   ; D5E1   007E 00BD 0018 0008
        DECLE   $0008,  $001C,  $0008,  $00F7   ; D5E5   0008 001C 0008 00F7
        DECLE   $0000,  $0000,  $0000,  $00FE   ; D5E9   0000 0000 0000 00FE
        DECLE   $00AA,  $00FE,  $00AA,  $00FE   ; D5ED   00AA 00FE 00AA 00FE
        DECLE   $00AA,  $0000,  $0000,  $0000   ; D5F1   00AA 0000 0000 0000
        DECLE   $00FE,  $00AA,  $00FE,  $00AA   ; D5F5   00FE 00AA 00FE 00AA
        DECLE   $00FE,  $0000,  $0000,  $0000   ; D5F9   00FE 0000 0000 0000
        DECLE   $0000,  $00FE,  $00AA,  $00FE   ; D5FD   0000 00FE 00AA 00FE
        DECLE   $00AA,  $0000,  $0000,  $0000   ; D601   00AA 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FE   ; D605   0000 0000 0000 00FE
        DECLE   $00AA,  $0000,  $0000,  $0000   ; D609   00AA 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D60D   0000 0000 0000 0000
        DECLE   $00FF,  $0000,  $0000,  $0000   ; D611   00FF 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; D615   0000 0000 0000 00FF
        DECLE   $0000,  $00B0,  $00A0,  $00F6   ; D619   0000 00B0 00A0 00F6
        DECLE   $00A8,  $00A8,  $0008,  $000A   ; D61D   00A8 00A8 0008 000A
        DECLE   $000B,  $0007,  $0007,  $0005   ; D621   000B 0007 0007 0005
        DECLE   $0007,  $000C,  $000E,  $000C   ; D625   0007 000C 000E 000C
        DECLE   $0000,  $0060,  $0040,  $00EE   ; D629   0000 0060 0040 00EE
        DECLE   $0050,  $0050,  $0010,  $0014   ; D62D   0050 0050 0010 0014
        DECLE   $0016,  $000E,  $000E,  $000A   ; D631   0016 000E 000E 000A
        DECLE   $001E,  $0018,  $001C,  $0008   ; D635   001E 0018 001C 0008
        DECLE   $0000,  $00C0,  $0080,  $00DC   ; D639   0000 00C0 0080 00DC
        DECLE   $00A2,  $00A2,  $0022,  $002A   ; D63D   00A2 00A2 0022 002A
        DECLE   $003C,  $001C,  $001E,  $0016   ; D641   003C 001C 001E 0016
        DECLE   $003E,  $0034,  $003C,  $0018   ; D645   003E 0034 003C 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; D649   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $00FF   ; D64D   0000 0000 0010 00FF
        DECLE   $0010,  $0010,  $0030,  $0030   ; D651   0010 0010 0030 0030
        DECLE   $0038,  $007C,  $0058,  $00FF   ; D655   0038 007C 0058 00FF
        DECLE   $00FF,  $0000,  $0000,  $0000   ; D659   00FF 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $0010   ; D65D   0000 0000 00FF 0010
        DECLE   $0010,  $0010,  $0018,  $0018   ; D661   0010 0010 0018 0018
        DECLE   $0038,  $007C,  $0034,  $00FE   ; D665   0038 007C 0034 00FE
        DECLE   $00FF,  $000C,  $000C,  $0008   ; D669   00FF 000C 000C 0008
        DECLE   $000C,  $0040,  $0080,  $0001   ; D66D   000C 0040 0080 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; D671   0000 0000 0000 0000
        DECLE   $00E0,  $0082,  $0002,  $0002   ; D675   00E0 0082 0002 0002
        DECLE   $0002,  $000C,  $000C,  $0008   ; D679   0002 000C 000C 0008
        DECLE   $000C,  $0000,  $0000,  $0020   ; D67D   000C 0000 0000 0020
        DECLE   $0011,  $0000,  $0000,  $0008   ; D681   0011 0000 0000 0008
        DECLE   $0014,  $0014,  $0008,  $0008   ; D685   0014 0014 0008 0008
        DECLE   $0008,  $0006,  $0006,  $0004   ; D689   0008 0006 0006 0004
        DECLE   $0006,  $0000,  $0000,  $0000   ; D68D   0006 0000 0000 0000
        DECLE   $000C,  $0000,  $0000,  $0000   ; D691   000C 0000 0000 0000
        DECLE   $0011,  $0022,  $0022,  $0020   ; D695   0011 0022 0022 0020
        DECLE   $0020,  $0000,  $0000,  $0000   ; D699   0020 0000 0000 0000
        DECLE   $003C,  $007C,  $001E,  $000A   ; D69D   003C 007C 001E 000A
        DECLE   $0010,  $0018,  $001C,  $0014   ; D6A1   0010 0018 001C 0014
        DECLE   $0076,  $0002,  $0002,  $0002   ; D6A5   0076 0002 0002 0002
        DECLE   $0002,  $0000,  $0000,  $0000   ; D6A9   0002 0000 0000 0000
        DECLE   $001C,  $003E,  $003E,  $002A   ; D6AD   001C 003E 003E 002A
        DECLE   $0010,  $0018,  $001E,  $000E   ; D6B1   0010 0018 001E 000E
        DECLE   $0014,  $0014,  $0008,  $0008   ; D6B5   0014 0014 0008 0008
        DECLE   $0008,  $0000,  $0000,  $0000   ; D6B9   0008 0000 0000 0000

        CLRC                                    ; D6BD   0006
        INCR    R7                              ; D6BE   000F

        DECLE   $001F                           ; D6BF   001F
L_D6C0:
        DECR    R6                              ; D6C0   0016
        DECLE   $0018,  $000C,  $000E,  $000B   ; D6C1   0018 000C 000E 000B
        DECLE   $0011,  $0022,  $0022,  $0020   ; D6C5   0011 0022 0022 0020
        DECLE   $0020,  $0018,  $003C,  $007E   ; D6C9   0020 0018 003C 007E
        DECLE   $007E,  $00FF,  $00FF,  $00FC   ; D6CD   007E 00FF 00FF 00FC
        DECLE   $00F8,  $00F8,  $00F8,  $0078   ; D6D1   00F8 00F8 00F8 0078
        DECLE   $0078,  $0030,  $0000,  $0000   ; D6D5   0078 0030 0000 0000
        DECLE   $0000,  $0018,  $003C,  $007E   ; D6D9   0000 0018 003C 007E
        DECLE   $007E,  $00FF,  $00FF,  $00F8   ; D6DD   007E 00FF 00FF 00F8
        DECLE   $00F0,  $00F0,  $00F0,  $00F0   ; D6E1   00F0 00F0 00F0 00F0
        DECLE   $0070,  $0060,  $0000,  $0000   ; D6E5   0070 0060 0000 0000
        DECLE   $0000,  $0018,  $003C,  $007E   ; D6E9   0000 0018 003C 007E
        DECLE   $007E,  $00FF,  $00FF,  $00F1   ; D6ED   007E 00FF 00FF 00F1
        DECLE   $00E1,  $00E1,  $00E0,  $00E0   ; D6F1   00E1 00E1 00E0 00E0
        DECLE   $00E0,  $0040,  $0000,  $0000   ; D6F5   00E0 0040 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D6F9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D6FD   0000 0000 0000 0000

        COMR    R0                              ; D701   0018
        COMR    R0                              ; D702   0018
        COMR    R0                              ; D703   0018
        COMR    R0                              ; D704   0018
        GSWD    R0                              ; D705   0030
        GSWD    R0                              ; D706   0030
        SAR     R2,     2                       ; D707   006E
        SARC    R1,     1                       ; D708   0079
        ADDR    R5,     R7                      ; D709   00EF

        DECLE   $0000,  $0000,  $0000,  $0000   ; D70A   0000 0000 0000 0000

        COMR    R0                              ; D70E   0018
        COMR    R0                              ; D70F   0018
        COMR    R0                              ; D710   0018
        COMR    R0                              ; D711   0018
        GSWD    R0                              ; D712   0030
        GSWD    R0                              ; D713   0030
        SAR     R2,     2                       ; D714   006E
        SARC    R1,     1                       ; D715   0079
        ADDR    R5,     R7                      ; D716   00EF

        ADDR    R0,     R1                      ; D717   00C1
        ADDR    R1,     R7                      ; D718   00CF

        DECLE   $00E1,  $0000                   ; D719   00E1 0000

        COMR    R0                              ; D71B   0018
        COMR    R0                              ; D71C   0018
        COMR    R0                              ; D71D   0018
        COMR    R0                              ; D71E   0018
        GSWD    R0                              ; D71F   0030
        GSWD    R0                              ; D720   0030
        SAR     R2,     2                       ; D721   006E
        SARC    R1,     1                       ; D722   0079
        ADDR    R5,     R7                      ; D723   00EF

        ADDR    R0,     R1                      ; D724   00C1
        ADDR    R1,     R7                      ; D725   00CF

        ADDR    R4,     R1                      ; D726   00E1
        ADDR    R5,     R7                      ; D727   00EF

        DECLE   $0034,  $0000,  $0000,  $0000   ; D728   0034 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D72C   0000 0000 0000 0000
        DECLE   $0004,  $0004,  $0004,  $0006   ; D730   0004 0004 0004 0006
        DECLE   $0006,  $0036                   ; D734   0006 0036

        SARC    R3,     2                       ; D736   007F
        SLLC    R3,     2                       ; D737   005F
        ADDR    R1,     R7                      ; D738   00CF
        ADDR    R3,     R7                      ; D739   00DF

        DECLE   $0000,  $0000,  $0000,  $0004   ; D73A   0000 0000 0000 0004
        DECLE   $0004,  $0004,  $0006,  $0006   ; D73E   0004 0004 0006 0006
        DECLE   $0006,  $0037                   ; D742   0006 0037

        SARC    R3,     2                       ; D744   007F
        SLLC    R3,     2                       ; D745   005F
        ADDR    R1,     R7                      ; D746   00CF
        ADDR    R3,     R7                      ; D747   00DF

        DECLE   $007E,  $003C,  $0004,  $0004   ; D748   007E 003C 0004 0004
        DECLE   $0004,  $0006,  $0006,  $0006   ; D74C   0004 0006 0006 0006
        DECLE   $0037                           ; D750   0037

        SARC    R3,     2                       ; D751   007F
        SLLC    R3,     2                       ; D752   005F
        ADDR    R1,     R7                      ; D753   00CF
        ADDR    R1,     R7                      ; D754   00CF

        DECLE   $005E,  $007E,  $003C,  $001A   ; D755   005E 007E 003C 001A
        DECLE   $001F,  $0000,  $0000,  $0000   ; D759   001F 0000 0000 0000
        DECLE   $0024,  $0029,  $003A,  $0000   ; D75D   0024 0029 003A 0000
        DECLE   $0080,  $0000,  $0000,  $0000   ; D761   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D765   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0020,  $0024   ; D769   0000 0000 0020 0024
        DECLE   $0029,  $002A,  $003C,  $0041   ; D76D   0029 002A 003C 0041
        DECLE   $0080,  $0080,  $0000,  $0000   ; D771   0080 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D775   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D779   0000 0000 0000 0000
        DECLE   $0014,  $003E,  $003F,  $005F   ; D77D   0014 003E 003F 005F
        DECLE   $001E,  $0048,  $0020,  $0000   ; D781   001E 0048 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D785   0000 0000 0000 0000
        DECLE   $0000,  $003E,  $007F,  $003E   ; D789   0000 003E 007F 003E
        DECLE   $0000,  $0014,  $0014,  $0014   ; D78D   0000 0014 0014 0014
        DECLE   $0014,  $0014,  $0014,  $0014   ; D791   0014 0014 0014 0014
        DECLE   $0014,  $0014,  $003E,  $007F   ; D795   0014 0014 003E 007F
        DECLE   $007F,  $0000,  $0000,  $0000   ; D799   007F 0000 0000 0000
        DECLE   $003E,  $007F,  $003E,  $0000   ; D79D   003E 007F 003E 0000
        DECLE   $0014,  $0014,  $0014,  $0014   ; D7A1   0014 0014 0014 0014
        DECLE   $0014,  $0014,  $003E,  $007F   ; D7A5   0014 0014 003E 007F
        DECLE   $007F,  $0000,  $0000,  $0000   ; D7A9   007F 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003E   ; D7AD   0000 0000 0000 003E
        DECLE   $007F,  $003E,  $0000,  $0014   ; D7B1   007F 003E 0000 0014
        DECLE   $0014,  $0014,  $003E,  $007F   ; D7B5   0014 0014 003E 007F
        DECLE   $007F,  $0000,  $0009,  $005A   ; D7B9   007F 0000 0009 005A
        DECLE   $002E,  $0098,  $007C,  $0038   ; D7BD   002E 0098 007C 0038
        DECLE   $0000,  $0025,  $0002,  $0026   ; D7C1   0000 0025 0002 0026
        DECLE   $005A,  $007D,  $0036,  $0038   ; D7C5   005A 007D 0036 0038
        DECLE   $0000,  $0010,  $0000,  $0009   ; D7C9   0000 0010 0000 0009
        DECLE   $005A,  $003E,  $006C,  $0030   ; D7CD   005A 003E 006C 0030
        DECLE   $0000,  $0000,  $0000,  $000A   ; D7D1   0000 0000 0000 000A
        DECLE   $0018,  $0054,  $0038,  $0030   ; D7D5   0018 0054 0038 0030
        DECLE   $0000,  $0000,  $0000,  $0008   ; D7D9   0000 0000 0000 0008
        DECLE   $0024,  $0042,  $0042,  $0081   ; D7DD   0024 0042 0042 0081
        DECLE   $0080,  $0099,  $0019,  $0081   ; D7E1   0080 0099 0019 0081
        DECLE   $0042,  $0042,  $0024,  $0010   ; D7E5   0042 0042 0024 0010
        DECLE   $0000,  $0000,  $0000,  $0010   ; D7E9   0000 0000 0000 0010
        DECLE   $0024,  $0042,  $0042,  $0081   ; D7ED   0024 0042 0042 0081
        DECLE   $0081,  $0018,  $0099,  $0081   ; D7F1   0081 0018 0099 0081
        DECLE   $0042,  $0042,  $0024,  $0008   ; D7F5   0042 0042 0024 0008
        DECLE   $0000,  $0000,  $0000,  $0018   ; D7F9   0000 0000 0000 0018
        DECLE   $0020,  $0042,  $0042,  $0081   ; D7FD   0020 0042 0042 0081
        DECLE   $0001                           ; D801   0001

        MOVR    R3,     R1                      ; D802   0099
        MOVR    R3,     R0                      ; D803   0098
        MOVR    R0,     R1                      ; D804   0081
        SWAP    R2,     1                       ; D805   0042
        SWAP    R2,     1                       ; D806   0042

        JSR     R4,     .EXEC.800               ; D807   0004 0018 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; D80A   0000 0000 0018 003C
        DECLE   $007C,  $007E,  $007F,  $00FF   ; D80E   007C 007E 007F 00FF
        DECLE   $00FF,  $00FF,  $00FE,  $007E   ; D812   00FF 00FF 00FE 007E
        DECLE   $003E,  $003C,  $0018,  $0000   ; D816   003E 003C 0018 0000
        DECLE   $0000,  $0010,  $0038,  $0010   ; D81A   0000 0010 0038 0010
        DECLE   $0010,  $0010,  $0010,  $0091   ; D81E   0010 0010 0010 0091
        DECLE   $0091,  $00AD,  $00BD,  $00BD   ; D822   0091 00AD 00BD 00BD
        DECLE   $00A5,  $0024,  $0018,  $0018   ; D826   00A5 0024 0018 0018
        DECLE   $0000,  $0000,  $0018,  $003C   ; D82A   0000 0000 0018 003C
        DECLE   $007C,  $007E,  $007F,  $00FF   ; D82E   007C 007E 007F 00FF
        DECLE   $00FF,  $00FF,  $00FE,  $007E   ; D832   00FF 00FF 00FE 007E
        DECLE   $003E,  $003C,  $0018,  $0000   ; D836   003E 003C 0018 0000
        DECLE   $0000,  $0000,  $0018,  $0024   ; D83A   0000 0000 0018 0024
        DECLE   $0002,  $0040,  $0081,  $0089   ; D83E   0002 0040 0081 0089
        DECLE   $0089,  $0089,  $0081,  $0002   ; D842   0089 0089 0081 0002
        DECLE   $0040,  $0024,  $0018,  $0000   ; D846   0040 0024 0018 0000
        DECLE   $0000,  $0000,  $0018,  $0004   ; D84A   0000 0000 0018 0004
        DECLE   $0042,  $0042,  $0080,  $0089   ; D84E   0042 0042 0080 0089
        DECLE   $0089,  $0089,  $0001,  $0042   ; D852   0089 0089 0001 0042
        DECLE   $0042,  $0020,  $0018,  $0000   ; D856   0042 0020 0018 0000
        DECLE   $0000,  $0000,  $0008,  $0024   ; D85A   0000 0000 0008 0024
        DECLE   $0042,  $0042,  $0081,  $0088   ; D85E   0042 0042 0081 0088
        DECLE   $0089,  $0009,  $0081,  $0042   ; D862   0089 0009 0081 0042
        DECLE   $0042,  $0024,  $0010,  $0000   ; D866   0042 0024 0010 0000
        DECLE   $0000,  $0000,  $0000,  $001E   ; D86A   0000 0000 0000 001E
        DECLE   $0000,  $0000,  $000E,  $005D   ; D86E   0000 0000 000E 005D
        DECLE   $00FD,  $0055,  $000E,  $0000   ; D872   00FD 0055 000E 0000
        DECLE   $0000,  $001E,  $0000,  $0000   ; D876   0000 001E 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0020   ; D87A   0000 0000 0018 0020
        DECLE   $0042,  $0042,  $0081,  $0001   ; D87E   0042 0042 0081 0001

        MOVR    R2,     R1                      ; D882   0091
        MOVR    R1,     R0                      ; D883   0088
        MOVR    R0,     R1                      ; D884   0081
        SWAP    R2,     1                       ; D885   0042
        SWAP    R2,     1                       ; D886   0042

        JSR     R4,     .EXEC.800               ; D887   0004 0018 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; D88A   0000 0000 0018 003C
        DECLE   $007C,  $007E,  $007F,  $00FF   ; D88E   007C 007E 007F 00FF
        DECLE   $00FF,  $00FF,  $00FE,  $007E   ; D892   00FF 00FF 00FE 007E
        DECLE   $003E,  $003C,  $0018,  $0000   ; D896   003E 003C 0018 0000
        DECLE   $0000,  $0000,  $0018,  $0024   ; D89A   0000 0000 0018 0024
        DECLE   $0002,  $0040,  $0081,  $0081   ; D89E   0002 0040 0081 0081
        DECLE   $0091,  $0089,  $0081,  $0002   ; D8A2   0091 0089 0081 0002
        DECLE   $0040,  $0024,  $0018,  $0000   ; D8A6   0040 0024 0018 0000
        DECLE   $0000,  $0000,  $0018,  $0004   ; D8AA   0000 0000 0018 0004
        DECLE   $0042,  $0042,  $0080,  $0081   ; D8AE   0042 0042 0080 0081
        DECLE   $0091,  $0089,  $0001,  $0042   ; D8B2   0091 0089 0001 0042
        DECLE   $0042,  $0020,  $0018,  $0000   ; D8B6   0042 0020 0018 0000
        DECLE   $0000,  $0005,  $0022,  $0046   ; D8BA   0000 0005 0022 0046
        DECLE   $008D,  $0018,  $0068,  $00F0   ; D8BE   008D 0018 0068 00F0
        DECLE   $00B2,  $00D4,  $00E8,  $0040   ; D8C2   00B2 00D4 00E8 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; D8C6   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; D8CA   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; D8CE   0000 0000 0000 0080
        DECLE   $0080,  $0000,  $0000,  $0000   ; D8D2   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D8D6   0000 0000 0000 0001
        DECLE   $0004,  $0002,  $0001,  $0000   ; D8DA   0004 0002 0001 0000
        DECLE   $0000,  $0000,  $00C0,  $0020   ; D8DE   0000 0000 00C0 0020
        DECLE   $0060,  $0040,  $0000,  $0000   ; D8E2   0060 0040 0000 0000
        DECLE   $0000,  $0000,  $0006,  $0000   ; D8E6   0000 0000 0006 0000
        DECLE   $0000,  $0003,  $0003,  $0004   ; D8EA   0000 0003 0003 0004
        DECLE   $0008,  $0000,  $0000,  $0030   ; D8EE   0008 0000 0000 0030
        DECLE   $0058,  $0058,  $0040,  $0000   ; D8F2   0058 0058 0040 0000
        DECLE   $0004,  $000C,  $0000,  $0000   ; D8F6   0004 000C 0000 0000
        DECLE   $0008,  $001C,  $0008,  $0008   ; D8FA   0008 001C 0008 0008
        DECLE   $0008,  $0008,  $0008,  $0000   ; D8FE   0008 0008 0008 0000
        DECLE   $0000,  $0020,  $0030,  $0068   ; D902   0000 0020 0030 0068
        DECLE   $0078,  $0048,  $0030,  $0030   ; D906   0078 0048 0030 0030
        DECLE   $0080,  $0000,  $0000,  $0000   ; D90A   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D90E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D912   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D916   0000 0000 0000 0001
        DECLE   $0000,  $0040,  $0040,  $00A0   ; D91A   0000 0040 0040 00A0
        DECLE   $0000,  $0000,  $0000,  $0000   ; D91E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D922   0000 0000 0000 0000
        DECLE   $0005,  $0002,  $0002,  $0000   ; D926   0005 0002 0002 0000
        DECLE   $0000,  $0088,  $0050,  $0020   ; D92A   0000 0088 0050 0020
        DECLE   $0020,  $0020,  $0000,  $0000   ; D92E   0020 0020 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0004   ; D932   0000 0000 0004 0004
        DECLE   $0004,  $000A,  $0011,  $0000   ; D936   0004 000A 0011 0000
        DECLE   $0010,  $0010,  $0010,  $0010   ; D93A   0010 0010 0010 0010
        DECLE   $0010,  $00F0,  $0008,  $0004   ; D93E   0010 00F0 0008 0004

        NEGR    R0                              ; D942   0020
        DECR    R0                              ; D943   0010
        INCR    R7                              ; D944   000F

        INCR    R0                              ; D945   0008
L_D946:
        INCR    R0                              ; D946   0008
        DECLE   $0008,  $0008,  $0008,  $0000   ; D947   0008 0008 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D94B   0000 0000 0000 0001
        DECLE   $0003,  $0006,  $000C,  $0082   ; D94F   0003 0006 000C 0082
        DECLE   $0044,  $0028,  $0010,  $0028   ; D953   0044 0028 0010 0028
        DECLE   $0044,  $0082,  $0000,  $0010   ; D957   0044 0082 0000 0010
        DECLE   $0010,  $0010,  $00FE,  $0010   ; D95B   0010 0010 00FE 0010
        DECLE   $0010,  $0010,  $0000,  $0000   ; D95F   0010 0010 0000 0000
        DECLE   $0044,  $0028,  $0010,  $0028   ; D963   0044 0028 0010 0028
        DECLE   $0044,  $0000,  $0000,  $0000   ; D967   0044 0000 0000 0000
        DECLE   $0010,  $0010,  $007C,  $0010   ; D96B   0010 0010 007C 0010
        DECLE   $0010,  $0000,  $0000,  $0000   ; D96F   0010 0000 0000 0000
        DECLE   $0000,  $0028,  $0010,  $0028   ; D973   0000 0028 0010 0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; D977   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0038,  $0010   ; D97B   0000 0010 0038 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; D97F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0000   ; D983   0000 0000 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D987   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0000   ; D98B   0000 0000 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D98F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0000   ; D993   0000 0000 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D997   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0038,  $0010   ; D99B   0000 0010 0038 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; D99F   0000 0000 0000 0000
        DECLE   $0000,  $0028,  $0010,  $0028   ; D9A3   0000 0028 0010 0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9A7   0000 0000 0000 0000
        DECLE   $0010,  $0010,  $007C,  $0010   ; D9AB   0010 0010 007C 0010
        DECLE   $0010,  $0000,  $0000,  $0000   ; D9AF   0010 0000 0000 0000
        DECLE   $0044,  $0028,  $0010,  $0028   ; D9B3   0044 0028 0010 0028
        DECLE   $0044,  $0000,  $0000,  $0010   ; D9B7   0044 0000 0000 0010
        DECLE   $0010,  $0010,  $00FE,  $0010   ; D9BB   0010 0010 00FE 0010
        DECLE   $0010,  $0010,  $0000,  $0082   ; D9BF   0010 0010 0000 0082
        DECLE   $0044,  $0028,  $0010,  $0028   ; D9C3   0044 0028 0010 0028
        DECLE   $0044,  $0082,  $0000,  $0092   ; D9C7   0044 0082 0000 0092
        DECLE   $0044,  $0000,  $0092,  $0000   ; D9CB   0044 0000 0092 0000
        DECLE   $0044,  $0092,  $0000,  $0000   ; D9CF   0044 0092 0000 0000
        DECLE   $0000,  $00FF,  $0300,  $0003   ; D9D3   0000 00FF 0300 0003
        DECLE   $030C,  $0030,  $0000,  $0000   ; D9D7   030C 0030 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9DB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; D9DF   0000 0000 0000 00FF
        DECLE   $0300,  $0000,  $0000,  $0000   ; D9E3   0300 0000 0000 0000
        DECLE   $0001,  $0102,  $0204,  $0008   ; D9E7   0001 0102 0204 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9EB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9EF   0000 0000 0000 0000
        DECLE   $0000,  $00FF,  $03F0,  $0000   ; D9F3   0000 00FF 03F0 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; D9F7   0000 0000 0000 000C
        DECLE   $000A,  $0206,  $0201,  $0100   ; D9FB   000A 0206 0201 0100
        DECLE   $0001,  $0102,  $021F,  $00FF   ; D9FF   0001 0102 021F 00FF
        DECLE   $0300,  $000F,  $0330,  $00C0   ; DA03   0300 000F 0330 00C0
        DECLE   $0000,  $0000,  $000C,  $000A   ; DA07   0000 0000 000C 000A
        DECLE   $0206,  $0201,  $0100,  $0001   ; DA0B   0206 0201 0100 0001
        DECLE   $0102,  $021F,  $030F,  $0000   ; DA0F   0102 021F 030F 0000
        DECLE   $0000,  $00FF,  $0018,  $003C   ; DA13   0000 00FF 0018 003C
        DECLE   $0042,  $00AD,  $0076,  $00D9   ; DA17   0042 00AD 0076 00D9
        DECLE   $005C,  $0000,  $00BD,  $00DB   ; DA1B   005C 0000 00BD 00DB
        DECLE   $0000,  $0042,  $0081,  $0000   ; DA1F   0000 0042 0081 0000
        DECLE   $00C7,  $03FF,  $0318,  $003C   ; DA23   00C7 03FF 0318 003C
        DECLE   $0042,  $02AD,  $0166,  $02CB   ; DA27   0042 02AD 0166 02CB
        DECLE   $035C,  $0000,  $00BC,  $00D9   ; DA2B   035C 0000 00BC 00D9
        DECLE   $0103,  $0342,  $0281,  $0000   ; DA2F   0103 0342 0281 0000
        DECLE   $0007,  $00FF,  $0060,  $0080   ; DA33   0007 00FF 0060 0080
        DECLE   $0000,  $0000,  $0000,  $000C   ; DA37   0000 0000 0000 000C
        DECLE   $000A,  $0006,  $0001,  $0000   ; DA3B   000A 0006 0001 0000
        DECLE   $00E1,  $00F2,  $0000,  $001F   ; DA3F   00E1 00F2 0000 001F
        DECLE   $0020,  $004F,  $00F0,  $0000   ; DA43   0020 004F 00F0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA47   0000 0000 0000 0000
        DECLE   $000C,  $000A,  $0006,  $0001   ; DA4B   000C 000A 0006 0001
        DECLE   $0000,  $0001,  $0002,  $0000   ; DA4F   0000 0001 0002 0000
        DECLE   $0000                           ; DA53   0000

        ADDR    R0,     R0                      ; DA54   00C0
        RSWD    R0                              ; DA55   0038
        MOVR    R0,     R7                      ; DA56   0087

        DECLE   $0040,  $0020,  $0010,  $0008   ; DA57   0040 0020 0010 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA5B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA5F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00C0   ; DA63   0000 0000 0000 00C0
        DECLE   $0030,  $004C,  $0043,  $0040   ; DA67   0030 004C 0043 0040
        DECLE   $0040,  $0040,  $0000,  $0000   ; DA6B   0040 0040 0000 0000
        DECLE   $0000,  $0040,  $00E0,  $0000   ; DA6F   0000 0040 00E0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA73   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0010   ; DA77   0000 0000 0008 0010
        DECLE   $0008,  $000C,  $0014,  $0014   ; DA7B   0008 000C 0014 0014
        DECLE   $0035,  $002D,  $002F,  $0000   ; DA7F   0035 002D 002F 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; DA83   0000 0000 0000 0008
        DECLE   $0008,  $0008,  $000C,  $0014   ; DA87   0008 0008 000C 0014
        DECLE   $0014,  $0035,  $002D,  $0029   ; DA8B   0014 0035 002D 0029
        DECLE   $003A,  $003E,  $001C,  $0010   ; DA8F   003A 003E 001C 0010
        DECLE   $0008,  $0008,  $000C,  $000C   ; DA93   0008 0008 000C 000C
        DECLE   $0014,  $0014,  $0035,  $0029   ; DA97   0014 0014 0035 0029
        DECLE   $0029,  $003B,  $003E,  $001E   ; DA9B   0029 003B 003E 001E
        DECLE   $001C,  $003C,  $0038,  $0000   ; DA9F   001C 003C 0038 0000
        DECLE   $0000,  $0000,  $0002,  $0000   ; DAA3   0000 0000 0002 0000
        DECLE   $0006,  $0000,  $0020,  $0000   ; DAA7   0006 0000 0020 0000
        DECLE   $0022,  $0000,  $0010,  $0000   ; DAAB   0022 0000 0010 0000
        DECLE   $0012,  $0000,  $0032,  $0000   ; DAAF   0012 0000 0032 0000
        DECLE   $000A,  $0000,  $0028,  $0000   ; DAB3   000A 0000 0028 0000
        DECLE   $003C,  $0001,  $0028,  $0001   ; DAB7   003C 0001 0028 0001
        DECLE   $001E,  $0001,  $003A,  $0003   ; DABB   001E 0001 003A 0003
        DECLE   $002A,  $0004                   ; DABF   002A 0004

        ADCR    R2                              ; DAC1   002A

        JSRD    R4,     .EXEC.C06               ; DAC2   0004 001E 0006
        DECLE   $003C,  $0009,  $0028,  $0009   ; DAC5   003C 0009 0028 0009
        DECLE   $003A,  $000B,  $002A,  $000C   ; DAC9   003A 000B 002A 000C
        DECLE   $002A,  $000E,  $003C,  $0010   ; DACD   002A 000E 003C 0010
        DECLE   $003A,  $0010,  $003C,  $0011   ; DAD1   003A 0010 003C 0011
        DECLE   $0028,  $0011,  $003A,  $0013   ; DAD5   0028 0011 003A 0013
        DECLE   $002A,  $0014,  $002A,  $0014   ; DAD9   002A 0014 002A 0014
        DECLE   $001E,  $0015,  $001E,  $0018   ; DADD   001E 0015 001E 0018
        DECLE   $002A,  $0018,  $003A,  $0018   ; DAE1   002A 0018 003A 0018
        DECLE   $003C,  $0019,  $0028,  $0019   ; DAE5   003C 0019 0028 0019
        DECLE   $001A,  $0019,  $003A,  $0019   ; DAE9   001A 0019 003A 0019
        DECLE   $001E,  $001B,  $002A,  $001B   ; DAED   001E 001B 002A 001B
        DECLE   $003C,  $001C,  $002A,  $001C   ; DAF1   003C 001C 002A 001C
        DECLE   $003C,  $0020,  $0028,  $0020   ; DAF5   003C 0020 0028 0020
        DECLE   $002A,  $0020,  $003A,  $0020   ; DAF9   002A 0020 003A 0020
        DECLE   $003C,  $0023,  $002A,  $0024   ; DAFD   003C 0023 002A 0024
        DECLE   $002A,  $0028,  $0028,  $0028   ; DB01   002A 0028 0028 0028
        DECLE   $002A,  $0028,  $001E,  $0028   ; DB05   002A 0028 001E 0028
        DECLE   $003C,  $0029,  $0028,  $0029   ; DB09   003C 0029 0028 0029
        DECLE   $003A,  $0029,  $001E,  $002B   ; DB0D   003A 0029 001E 002B
        DECLE   $002A,  $002C,  $002A,  $002E   ; DB11   002A 002C 002A 002E
        DECLE   $003C,  $0031,  $001A,  $0033   ; DB15   003C 0031 001A 0033
        DECLE   $0018,  $0033,  $001A,  $0034   ; DB19   0018 0033 001A 0034
        DECLE   $0018,  $0034,  $001A,  $0035   ; DB1D   0018 0034 001A 0035

        INCR    R6                              ; DB21   000E
        RSWD    R0                              ; DB22   0038
        INCR    R2                              ; DB23   000A
        RSWD    R1                              ; DB24   0039
        INCR    R0                              ; DB25   0008
        RSWD    R1                              ; DB26   0039
        COMR    R2                              ; DB27   001A
        RSWD    R3                              ; DB28   003B
        INCR    R0                              ; DB29   0008
        RSWD    R3                              ; DB2A   003B
        INCR    R2                              ; DB2B   000A
        RSWD    R3                              ; DB2C   003B
        COMR    R0                              ; DB2D   0018
        RSWD    R3                              ; DB2E   003B
        COMR    R2                              ; DB2F   001A
        RSWD    R4                              ; DB30   003C
        ADCR    R2                              ; DB31   002A
        RSWD    R4                              ; DB32   003C
        COMR    R0                              ; DB33   0018
        RSWD    R4                              ; DB34   003C
        COMR    R2                              ; DB35   001A
        RSWD    R5                              ; DB36   003D
        INCR    R6                              ; DB37   000E
        SWAP    R3,     1                       ; DB38   0043
        COMR    R0                              ; DB39   0018
        SWAP    R3,     1                       ; DB3A   0043
        COMR    R2                              ; DB3B   001A
        SWAP    R0,     2                       ; DB3C   0044
        COMR    R0                              ; DB3D   0018
        SWAP    R0,     2                       ; DB3E   0044
        COMR    R2                              ; DB3F   001A
        SWAP    R1,     2                       ; DB40   0045
        INCR    R6                              ; DB41   000E
        SLL     R3,     1                       ; DB42   004B
        COMR    R0                              ; DB43   0018
        SLL     R3,     1                       ; DB44   004B
        COMR    R2                              ; DB45   001A
        SLL     R0,     2                       ; DB46   004C
        COMR    R0                              ; DB47   0018
        SLL     R0,     2                       ; DB48   004C
        COMR    R2                              ; DB49   001A
        SLL     R1,     2                       ; DB4A   004D
        INCR    R6                              ; DB4B   000E
        RLC     R1,     1                       ; DB4C   0051
        COMR    R2                              ; DB4D   001A
        RLC     R3,     1                       ; DB4E   0053
        COMR    R0                              ; DB4F   0018
        RLC     R3,     1                       ; DB50   0053
        COMR    R2                              ; DB51   001A
        RLC     R0,     2                       ; DB52   0054
        COMR    R0                              ; DB53   0018
        RLC     R0,     2                       ; DB54   0054
        COMR    R2                              ; DB55   001A
        RLC     R1,     2                       ; DB56   0055
        INCR    R6                              ; DB57   000E
        SLLC    R1,     1                       ; DB58   0059
        COMR    R2                              ; DB59   001A
        SLLC    R3,     1                       ; DB5A   005B
        COMR    R0                              ; DB5B   0018
        SLLC    R3,     1                       ; DB5C   005B
        COMR    R2                              ; DB5D   001A
        SLLC    R0,     2                       ; DB5E   005C
        ADCR    R2                              ; DB5F   002A
        SLLC    R0,     2                       ; DB60   005C
        COMR    R0                              ; DB61   0018
        SLLC    R0,     2                       ; DB62   005C
        COMR    R2                              ; DB63   001A
        SLLC    R1,     2                       ; DB64   005D
        INCR    R6                              ; DB65   000E
        SLR     R1,     1                       ; DB66   0061
        COMR    R2                              ; DB67   001A
        SLR     R3,     1                       ; DB68   0063
        COMR    R0                              ; DB69   0018
        SLR     R3,     1                       ; DB6A   0063
        COMR    R2                              ; DB6B   001A
        SLR     R0,     2                       ; DB6C   0064
        COMR    R0                              ; DB6D   0018
        SLR     R0,     2                       ; DB6E   0064
        COMR    R2                              ; DB6F   001A
        SLR     R1,     2                       ; DB70   0065
        INCR    R6                              ; DB71   000E
        SAR     R1,     1                       ; DB72   0069
        INCR    R0                              ; DB73   0008
        SAR     R3,     1                       ; DB74   006B
        COMR    R0                              ; DB75   0018
        SAR     R3,     1                       ; DB76   006B
        COMR    R2                              ; DB77   001A
        SAR     R0,     2                       ; DB78   006C
        COMR    R0                              ; DB79   0018
        SAR     R0,     2                       ; DB7A   006C
        COMR    R2                              ; DB7B   001A
        SAR     R1,     2                       ; DB7C   006D
        INCR    R6                              ; DB7D   000E
        RRC     R1,     1                       ; DB7E   0071
        INCR    R0                              ; DB7F   0008
        RRC     R3,     1                       ; DB80   0073
        ADCR    R2                              ; DB81   002A
        SARC    R1,     1                       ; DB82   0079
        INCR    R0                              ; DB83   0008
        SARC    R3,     1                       ; DB84   007B
        ADCR    R0                              ; DB85   0028
        TSTR    R0                              ; DB86   0080
        INCR    R2                              ; DB87   000A
        TSTR    R0                              ; DB88   0080
        ADCR    R0                              ; DB89   0028
        TSTR    R0                              ; DB8A   0080
        ADCR    R2                              ; DB8B   002A
        TSTR    R0                              ; DB8C   0080
        COMR    R0                              ; DB8D   0018
        MOVR    R0,     R1                      ; DB8E   0081
        COMR    R0                              ; DB8F   0018
        MOVR    R0,     R4                      ; DB90   0084
        INCR    R2                              ; DB91   000A
        MOVR    R0,     R4                      ; DB92   0084
        COMR    R0                              ; DB93   0018
        MOVR    R0,     R5                      ; DB94   0085
        INCR    R6                              ; DB95   000E
        MOVR    R0,     R5                      ; DB96   0085
        ADCR    R0                              ; DB97   0028
        MOVR    R1,     R0                      ; DB98   0088
        ADCR    R0                              ; DB99   0028
        MOVR    R1,     R0                      ; DB9A   0088
        ADCR    R2                              ; DB9B   002A
        TSTR    R1                              ; DB9C   0089
        ADCR    R0                              ; DB9D   0028
        TSTR    R1                              ; DB9E   0089
        INCR    R6                              ; DB9F   000E
        TSTR    R1                              ; DBA0   0089
        ADCR    R2                              ; DBA1   002A
        MOVR    R1,     R3                      ; DBA2   008B
        INCR    R2                              ; DBA3   000A
        MOVR    R1,     R3                      ; DBA4   008B
        ADCR    R0                              ; DBA5   0028
        MOVR    R1,     R3                      ; DBA6   008B
        ADCR    R2                              ; DBA7   002A
        MOVR    R1,     R4                      ; DBA8   008C
        INCR    R0                              ; DBA9   0008
        MOVR    R1,     R4                      ; DBAA   008C
        INCR    R2                              ; DBAB   000A
        MOVR    R1,     R4                      ; DBAC   008C
        ADCR    R2                              ; DBAD   002A
        MOVR    R1,     R5                      ; DBAE   008D
        INCR    R0                              ; DBAF   0008
        MOVR    R1,     R5                      ; DBB0   008D
        INCR    R2                              ; DBB1   000A
        MOVR    R1,     R5                      ; DBB2   008D
        INCR    R6                              ; DBB3   000E
        MOVR    R1,     R5                      ; DBB4   008D
        ADCR    R0                              ; DBB5   0028
        MOVR    R2,     R0                      ; DBB6   0090
        ADCR    R0                              ; DBB7   0028
        MOVR    R2,     R0                      ; DBB8   0090
        ADCR    R2                              ; DBB9   002A
        MOVR    R2,     R1                      ; DBBA   0091
        INCR    R6                              ; DBBB   000E
        MOVR    R2,     R1                      ; DBBC   0091
        ADCR    R0                              ; DBBD   0028
        MOVR    R2,     R1                      ; DBBE   0091
        ADCR    R2                              ; DBBF   002A
        MOVR    R2,     R3                      ; DBC0   0093
        INCR    R2                              ; DBC1   000A
        MOVR    R2,     R3                      ; DBC2   0093
        ADCR    R0                              ; DBC3   0028
        MOVR    R2,     R3                      ; DBC4   0093
        ADCR    R2                              ; DBC5   002A
        MOVR    R2,     R4                      ; DBC6   0094
        INCR    R0                              ; DBC7   0008
        MOVR    R2,     R4                      ; DBC8   0094
        INCR    R2                              ; DBC9   000A
        MOVR    R2,     R4                      ; DBCA   0094
        ADCR    R2                              ; DBCB   002A
        MOVR    R2,     R5                      ; DBCC   0095
        INCR    R0                              ; DBCD   0008
        MOVR    R2,     R5                      ; DBCE   0095
        INCR    R2                              ; DBCF   000A
        MOVR    R2,     R5                      ; DBD0   0095
        INCR    R6                              ; DBD1   000E
        MOVR    R2,     R5                      ; DBD2   0095
        ADCR    R0                              ; DBD3   0028
        MOVR    R3,     R0                      ; DBD4   0098
        ADCR    R0                              ; DBD5   0028
        MOVR    R3,     R1                      ; DBD6   0099
        INCR    R6                              ; DBD7   000E
        MOVR    R3,     R1                      ; DBD8   0099
        ADCR    R0                              ; DBD9   0028
        MOVR    R3,     R1                      ; DBDA   0099
        ADCR    R2                              ; DBDB   002A
        TSTR    R3                              ; DBDC   009B
        INCR    R2                              ; DBDD   000A
        TSTR    R3                              ; DBDE   009B
        ADCR    R2                              ; DBDF   002A
        MOVR    R3,     R4                      ; DBE0   009C
        INCR    R0                              ; DBE1   0008
        MOVR    R3,     R4                      ; DBE2   009C
        INCR    R2                              ; DBE3   000A
        MOVR    R3,     R4                      ; DBE4   009C
        ADCR    R2                              ; DBE5   002A
        MOVR    R3,     R5                      ; DBE6   009D
        INCR    R0                              ; DBE7   0008
        MOVR    R3,     R5                      ; DBE8   009D
        INCR    R2                              ; DBE9   000A
        MOVR    R3,     R5                      ; DBEA   009D
        INCR    R6                              ; DBEB   000E
        MOVR    R3,     R5                      ; DBEC   009D
        ADCR    R0                              ; DBED   0028
        MOVR    R4,     R0                      ; DBEE   00A0
        ADCR    R0                              ; DBEF   0028
        MOVR    R4,     R0                      ; DBF0   00A0
        ADCR    R2                              ; DBF1   002A
        MOVR    R4,     R1                      ; DBF2   00A1
        INCR    R6                              ; DBF3   000E
        MOVR    R4,     R1                      ; DBF4   00A1
        ADCR    R0                              ; DBF5   0028
        MOVR    R4,     R1                      ; DBF6   00A1
        ADCR    R2                              ; DBF7   002A
        MOVR    R4,     R3                      ; DBF8   00A3
        INCR    R2                              ; DBF9   000A
        MOVR    R4,     R3                      ; DBFA   00A3
        ADCR    R2                              ; DBFB   002A
        TSTR    R4                              ; DBFC   00A4
        INCR    R0                              ; DBFD   0008
        TSTR    R4                              ; DBFE   00A4
        INCR    R2                              ; DBFF   000A
        TSTR    R4                              ; DC00   00A4
        ADCR    R2                              ; DC01   002A
        MOVR    R4,     R5                      ; DC02   00A5
        INCR    R0                              ; DC03   0008
        MOVR    R4,     R5                      ; DC04   00A5
        INCR    R2                              ; DC05   000A
        MOVR    R4,     R5                      ; DC06   00A5
        INCR    R6                              ; DC07   000E
        MOVR    R4,     R5                      ; DC08   00A5
        ADCR    R0                              ; DC09   0028
        MOVR    R5,     R0                      ; DC0A   00A8
        ADCR    R2                              ; DC0B   002A
        MOVR    R5,     R3                      ; DC0C   00AB
        INCR    R2                              ; DC0D   000A
        MOVR    R5,     R4                      ; DC0E   00AC
        INCR    R0                              ; DC0F   0008
        MOVR    R5,     R4                      ; DC10   00AC
        INCR    R6                              ; DC11   000E
        MOVR    R5,     R4                      ; DC12   00AC
        ADCR    R2                              ; DC13   002A
        TSTR    R5                              ; DC14   00AD
        INCR    R2                              ; DC15   000A
        TSTR    R5                              ; DC16   00AD
        INCR    R6                              ; DC17   000E
        MOVR    R5,     R7                      ; DC18   00AF

        DECLE   $000E,  $00B0,  $002A,  $00B3   ; DC19   000E 00B0 002A 00B3
        DECLE   $000A,  $00B4,  $0008,  $00B4   ; DC1D   000A 00B4 0008 00B4
        DECLE   $000E,  $00B5,  $000A,  $00B5   ; DC21   000E 00B5 000A 00B5
        DECLE   $000E,  $00B7,  $000E,  $00B8   ; DC25   000E 00B7 000E 00B8
        DECLE   $002A,  $00BB,  $000A,  $00BB   ; DC29   002A 00BB 000A 00BB
        DECLE   $002A,  $00BC,  $0008,  $00BC   ; DC2D   002A 00BC 0008 00BC
        DECLE   $000E,  $00BC,  $002A,  $00BD   ; DC31   000E 00BC 002A 00BD
        DECLE   $000A,  $00BD,  $000E,  $00BF   ; DC35   000A 00BD 000E 00BF

        INCR    R6                              ; DC39   000E
        ADDR    R0,     R0                      ; DC3A   00C0
        ADCR    R2                              ; DC3B   002A
        ADDR    R0,     R3                      ; DC3C   00C3
        INCR    R2                              ; DC3D   000A
        ADDR    R0,     R4                      ; DC3E   00C4
        INCR    R0                              ; DC3F   0008
        ADDR    R0,     R4                      ; DC40   00C4
        INCR    R6                              ; DC41   000E
        ADDR    R0,     R4                      ; DC42   00C4
        ADCR    R2                              ; DC43   002A
        ADDR    R0,     R5                      ; DC44   00C5
        INCR    R2                              ; DC45   000A
        ADDR    R0,     R5                      ; DC46   00C5
        INCR    R6                              ; DC47   000E
        ADDR    R0,     R7                      ; DC48   00C7

        DECLE   $000E,  $00CE,  $0008,  $00CE   ; DC49   000E 00CE 0008 00CE
        DECLE   $001E,  $00D6,  $0008,  $00D6   ; DC4D   001E 00D6 0008 00D6
        DECLE   $001E,  $00DB,  $000A,  $00DB   ; DC51   001E 00DB 000A 00DB
        DECLE   $002A,  $00DE,  $0008,  $00DE   ; DC55   002A 00DE 0008 00DE
        DECLE   $001E,  $00E3,  $0008,  $00E3   ; DC59   001E 00E3 0008 00E3
        DECLE   $001E,  $00EB,  $000A,  $00EB   ; DC5D   001E 00EB 000A 00EB
        DECLE   $002A,  $00EE,  $0008,  $00F1   ; DC61   002A 00EE 0008 00F1
        DECLE   $001E,  $00F3,  $000A,  $00F3   ; DC65   001E 00F3 000A 00F3
        DECLE   $002A,  $00F6,  $0008,  $00F8   ; DC69   002A 00F6 0008 00F8
        DECLE   $0028,  $00FC,  $000E,  $00FC   ; DC6D   0028 00FC 000E 00FC
        DECLE   $002C,  $00FC,  $001E,  $00FC   ; DC71   002C 00FC 001E 00FC
        DECLE   $003C,  $00FD,  $000E,  $00FD   ; DC75   003C 00FD 000E 00FD
        DECLE   $0028,  $00FD,  $002C,  $00FD   ; DC79   0028 00FD 002C 00FD
        DECLE   $001E,  $0000,  $0029,  $0001   ; DC7D   001E 0000 0029 0001
        DECLE   $0019,  $0004,  $002B,  $0005   ; DC81   0019 0004 002B 0005
        DECLE   $000F,  $0005,  $0029,  $000B   ; DC85   000F 0005 0029 000B
        DECLE   $002B,  $000B,  $0019,  $0013   ; DC89   002B 000B 0019 0013
        DECLE   $002B,  $001B,  $002B,  $0023   ; DC8D   002B 001B 002B 0023
        DECLE   $0019,  $002B,  $0019,  $0033   ; DC91   0019 002B 0019 0033
        DECLE   $0019,  $003B,  $0019,  $0273   ; DC95   0019 003B 0019 0273
        DECLE   $0324,  $009A,  $0273,  $033D   ; DC99   0324 009A 0273 033D
        DECLE   $0353,  $0279,  $009A,  $0279   ; DC9D   0353 0279 009A 0279
        DECLE   $0100,  $002A,  $0353,  $039E   ; DCA1   0100 002A 0353 039E
        DECLE   $00D3,  $0328,  $017B,  $022D   ; DCA5   00D3 0328 017B 022D
        DECLE   $01CE,  $01CE,  $0191,  $022D   ; DCA9   01CE 01CE 0191 022D
        DECLE   $0191,  $01AE,  $0191,  $027C   ; DCAD   0191 01AE 0191 027C
        DECLE   $00A9,  $0302,  $0144,  $035C   ; DCB1   00A9 0302 0144 035C
        DECLE   $0379,  $0100,  $015A,  $0273   ; DCB5   0379 0100 015A 0273
        DECLE   $0328,  $0003,  $0041,  $0144   ; DCB9   0328 0003 0041 0144
        DECLE   $0088,  $0058,  $0046,  $0279   ; DCBD   0088 0058 0046 0279
        DECLE   $0103,  $0041,  $0003,  $0041   ; DCC1   0103 0041 0003 0041
        DECLE   $0061,  $0001,  $0066,  $0267   ; DCC5   0061 0001 0066 0267
        DECLE   $0040,  $0062,  $0040,  $0062   ; DCC9   0040 0062 0040 0062
        DECLE   $0003,  $0042,  $017B,  $0250   ; DCCD   0003 0042 017B 0250
        DECLE   $0061,  $0002,  $0074,  $02A1   ; DCD1   0061 0002 0074 02A1
        DECLE   $0002,  $0061,  $01F2,  $0250   ; DCD5   0002 0061 01F2 0250
        DECLE   $0003,  $0041,  $0016,  $02E3   ; DCD9   0003 0041 0016 02E3
        DECLE   $0041,  $0003,  $01F2,  $0328   ; DCDD   0041 0003 01F2 0328
        DECLE   $0040,  $0062,  $0061,  $0001   ; DCE1   0040 0062 0061 0001
        DECLE   $0003,  $0165,  $0373,  $00E1   ; DCE5   0003 0165 0373 00E1
        DECLE   $0018,  $0043,  $0020,  $0043   ; DCE9   0018 0043 0020 0043
        DECLE   $0020,  $00D9,  $009A,  $00E3   ; DCED   0020 00D9 009A 00E3
        DECLE   $0040,  $0165,  $00A5,  $0120   ; DCF1   0040 0165 00A5 0120
        DECLE   $0041,  $0148,  $017B,  $0389   ; DCF5   0041 0148 017B 0389
        DECLE   $002B,  $0379,  $0084,  $010B   ; DCF9   002B 0379 0084 010B
        DECLE   $00A9,  $0301,  $00D3,  $022D   ; DCFD   00A9 0301 00D3 022D
        DECLE   $01CC,  $022D,  $01CE,  $01CC   ; DD01   01CC 022D 01CE 01CC
        DECLE   $022D,  $01CE,  $0191,  $027C   ; DD05   022D 01CE 0191 027C
        DECLE   $012A,  $0088,  $000B,  $00BB   ; DD09   012A 0088 000B 00BB
        DECLE   $027C,  $012B,  $0373,  $0273   ; DD0D   027C 012B 0373 0273
        DECLE   $0385,  $00A5,  $00BB,  $0273   ; DD11   0385 00A5 00BB 0273
        DECLE   $0273,  $039B,  $0273,  $0000   ; DD15   0273 039B 0273 0000
        DECLE   $0000                           ; DD19   0000

        SUBR    R7,     R3                      ; DD1A   013B
L_DD1B:
        DECR    R7                              ; DD1B   0017

        DECLE   $0145,  $0145,  $014B,  $0145   ; DD1C   0145 0145 014B 0145
        DECLE   $0070,  $0070,  $0018,  $0070   ; DD20   0070 0070 0018 0070
        DECLE   $0148,  $013D,  $0000,  $014D   ; DD24   0148 013D 0000 014D
        DECLE   $001A,  $0000,  $0169,  $010D   ; DD28   001A 0000 0169 010D
        DECLE   $0105,  $0105,  $0150,  $0105   ; DD2C   0105 0105 0150 0105
        DECLE   $0019,  $0000,  $0111,  $001B   ; DD30   0019 0000 0111 001B
        DECLE   $0105,  $016B,  $014F,  $0158   ; DD34   0105 016B 014F 0158
        DECLE   $010D,  $006E,  $0163,  $010D   ; DD38   010D 006E 0163 010D
        DECLE   $0105,  $015C,  $0150,  $0105   ; DD3C   0105 015C 0150 0105
        DECLE   $010B,  $0000                   ; DD40   010B 0000

        SUBR    R2,     R1                      ; DD42   0111
        SUBR    R1,     R6                      ; DD43   010E
        CMPR    R2,     R2                      ; DD44   0152
        CMPR    R5,     R3                      ; DD45   016B
        CMPR    R3,     R2                      ; DD46   015A
        NEGR    R6                              ; DD47   0026
        SUBR    R1,     R5                      ; DD48   010D
        SAR     R2,     2                       ; DD49   006E
        SUBR    R6,     R5                      ; DD4A   0135
        DECR    R3                              ; DD4B   0013
        CMPR    R4,     R3                      ; DD4C   0163
        SUBR    R0,     R7                      ; DD4D   0107

        DECLE   $0156,  $015C,  $010B,  $0000   ; DD4E   0156 015C 010B 0000
        DECLE   $0111,  $010E,  $0152,  $016B   ; DD52   0111 010E 0152 016B
        DECLE   $001F,  $0131,  $010D,  $006E   ; DD56   001F 0131 010D 006E
        DECLE   $0142,  $013A,  $0135,  $0013   ; DD5A   0142 013A 0135 0013
        DECLE   $0024,  $0135,  $010B,  $0000   ; DD5E   0024 0135 010B 0000
        DECLE   $0111,  $010E,  $0158,  $0165   ; DD62   0111 010E 0158 0165
        DECLE   $002A,  $0134,  $010D,  $006E   ; DD66   002A 0134 010D 006E
        DECLE   $015B,  $0162,  $015B,  $015B   ; DD6A   015B 0162 015B 015B
        DECLE   $0155,  $015B,  $010B,  $0000   ; DD6E   0155 015B 010B 0000
        DECLE   $0016,  $010E,  $0027,  $0139   ; DD72   0016 010E 0027 0139
        DECLE   $0000,  $014F,  $0013,  $006E   ; DD76   0000 014F 0013 006E
        DECLE   $0135,  $0135,  $0135,  $0135   ; DD7A   0135 0135 0135 0135
        DECLE   $0024,  $0135,  $010B,  $0000   ; DD7E   0024 0135 010B 0000
        DECLE   $0137,  $0014,  $002E,  $0137   ; DD82   0137 0014 002E 0137
        DECLE   $0000,  $015A,  $0072,  $0000   ; DD86   0000 015A 0072 0000
        DECLE   $0072,  $0072,  $0072,  $0072   ; DD8A   0072 0072 0072 0072
        DECLE   $0072,  $0072,  $0012,  $0000   ; DD8E   0072 0072 0012 0000
        DECLE   $0034,  $0034,  $0034,  $0034   ; DD92   0034 0034 0034 0034
        DECLE   $0000,  $0022,  $0070,  $0000   ; DD96   0000 0022 0070 0000
        DECLE   $0070,  $0070,  $0018,  $0070   ; DD9A   0070 0070 0018 0070
        DECLE   $014A,  $013F,  $0072,  $014F   ; DD9E   014A 013F 0072 014F
        DECLE   $0072,  $0072,  $0072,  $0072   ; DDA2   0072 0072 0072 0072
        DECLE   $0000,  $0072,  $0019,  $006E   ; DDA6   0000 0072 0019 006E
        DECLE   $0149,  $013E,  $0111,  $001B   ; DDAA   0149 013E 0111 001B
        DECLE   $0102,  $016D,  $0000,  $0154   ; DDAE   0102 016D 0000 0154
        DECLE   $0070,  $0070,  $0070,  $0070   ; DDB2   0070 0070 0070 0070
        DECLE   $0000,  $0000,  $010B,  $006E   ; DDB6   0000 0000 010B 006E
        DECLE   $0106,  $016C,  $0111,  $010E   ; DDBA   0106 016C 0111 010E
        DECLE   $0102,  $016D,  $001A,  $0154   ; DDBE   0102 016D 001A 0154
        DECLE   $0145,  $013B,  $0145,  $0145   ; DDC2   0145 013B 0145 0145
        DECLE   $0000,  $014B,  $010B,  $006E   ; DDC6   0000 014B 010B 006E
        DECLE   $0106,  $016C,  $0111,  $010E   ; DDCA   0106 016C 0111 010E
        DECLE   $0161,  $0167,  $010D,  $015A   ; DDCE   0161 0167 010D 015A
        DECLE   $0105,  $0169,  $0105,  $0105   ; DDD2   0105 0169 0105 0105
        DECLE   $0000,  $0150,  $010B,  $006E   ; DDD6   0000 0150 010B 006E
        DECLE   $0106,  $016C,  $0016,  $010E   ; DDDA   0106 016C 0016 010E
        DECLE   $0139,  $0139,  $010D,  $0021   ; DDDE   0139 0139 010D 0021
        DECLE   $0105,  $0169,  $0105,  $0105   ; DDE2   0105 0169 0105 0105
        DECLE   $0000,  $0150,  $010B,  $006E   ; DDE6   0000 0150 010B 006E
        DECLE   $0160,  $0166,  $0137,  $0014   ; DDEA   0160 0166 0137 0014
        DECLE   $0137,  $0137                   ; DDEE   0137 0137
L_DDF0:
        SUBR    R1,     R5                      ; DDF0   010D
        DECLE   $002B,  $015C,  $0163,  $015C   ; DDF1   002B 015C 0163 015C
        DECLE   $015C,  $0000,  $0156,  $0012   ; DDF5   015C 0000 0156 0012
        DECLE   $006E,  $0034,  $0034,  $0034   ; DDF9   006E 0034 0034 0034
        DECLE   $0034,  $0022,  $0034,  $0013   ; DDFD   0034 0022 0034 0013
        DECLE   $0000,  $0035,  $0035,  $0035   ; DE01   0000 0035 0035 0035
        DECLE   $0035,  $0000,  $0024,  $0072   ; DE05   0035 0000 0024 0072
        DECLE   $0000,  $0072,  $0072,  $0072   ; DE09   0000 0072 0072 0072
        DECLE   $0072,  $0072,  $0072,  $0072   ; DE0D   0072 0072 0072 0072
        DECLE   $0000,  $0072,  $0072,  $0072   ; DE11   0000 0072 0072 0072
        DECLE   $0072,  $0000,  $0072,  $0070   ; DE15   0072 0000 0072 0070
        DECLE   $0000,  $0018,  $0070,  $0145   ; DE19   0000 0018 0070 0145
        DECLE   $013B,  $0145,  $0145,  $0145   ; DE1D   013B 0145 0145 0145
        DECLE   $0145,  $0145,  $0145,  $014B   ; DE21   0145 0145 0145 014B
        DECLE   $0145,  $0000,  $0070,  $0070   ; DE25   0145 0000 0070 0070
        DECLE   $0000,  $000A,  $0070,  $0105   ; DE29   0000 000A 0070 0105
        DECLE   $0169,  $0105,  $0028,  $0028   ; DE2D   0169 0105 0028 0028
        DECLE   $0138,  $0028,  $0105,  $0150   ; DE31   0138 0028 0105 0150
        DECLE   $0105,  $0000,  $0070,  $001A   ; DE35   0105 0000 0070 001A
        DECLE   $006E,  $0111,  $013E,  $0105   ; DE39   006E 0111 013E 0105
        DECLE   $0169,  $0105,  $0009,  $0009   ; DE3D   0169 0105 0009 0009
        DECLE   $0070,  $0009,  $0105,  $0150   ; DE41   0070 0009 0105 0150
        DECLE   $0105,  $0000,  $014F,  $010D   ; DE45   0105 0000 014F 010D
        DECLE   $006E,  $0111,  $016C,  $015C   ; DE49   006E 0111 016C 015C
        DECLE   $0163,  $015C,  $015C,  $015C   ; DE4D   0163 015C 015C 015C
        DECLE   $015C,  $015C,  $015C,  $0156   ; DE51   015C 015C 015C 0156
        DECLE   $015C,  $0000,  $0154,  $010D   ; DE55   015C 0000 0154 010D
        DECLE   $006E,  $0016,  $016C,  $0139   ; DE59   006E 0016 016C 0139
        DECLE   $0139,  $0139,  $0139,  $0139   ; DE5D   0139 0139 0139 0139
        DECLE   $0139,  $0139,  $0139,  $0027   ; DE61   0139 0139 0139 0027
        DECLE   $0139,  $0000,  $0154,  $010D   ; DE65   0139 0000 0154 010D
        DECLE   $006E,  $0160,  $0166,  $0160   ; DE69   006E 0160 0166 0160
        DECLE   $0160,  $0000,  $0159,  $010B   ; DE6D   0160 0000 0159 010B
        DECLE   $006E,  $0137,  $0014,  $002E   ; DE71   006E 0137 0014 002E
        DECLE   $0137,  $0000,  $015A,  $0013   ; DE75   0137 0000 015A 0013
        DECLE   $006E,  $0135,  $0135,  $0135   ; DE79   006E 0135 0135 0135
        DECLE   $0135,  $0000,  $0024,  $0012   ; DE7D   0135 0000 0024 0012
        DECLE   $006E,  $0134,  $0134,  $0134   ; DE81   006E 0134 0134 0134
        DECLE   $0134,  $0000,  $0022,  $0072   ; DE85   0134 0000 0022 0072
        DECLE   $0000,  $0072,  $0072,  $0072   ; DE89   0000 0072 0072 0072
        DECLE   $0072,  $0000,  $0072,  $0072   ; DE8D   0072 0000 0072 0072
        DECLE   $0000,  $0072,  $0072,  $0072   ; DE91   0000 0072 0072 0072
        DECLE   $0072,  $0000,  $0072,  $0070   ; DE95   0072 0000 0072 0070
        DECLE   $0000                           ; DE99   0000

        RRC     R0,     1                       ; DE9A   0070
        RRC     R0,     1                       ; DE9B   0070
        RRC     R0,     1                       ; DE9C   0070
        RRC     R0,     1                       ; DE9D   0070
        SUBR    R7,     R3                      ; DE9E   013B
L_DE9F:
        DECR    R7                              ; DE9F   0017

        DECLE   $0145,  $0145,  $0145,  $0145   ; DEA0   0145 0145 0145 0145
        DECLE   $0145,  $0145,  $014B,  $0145   ; DEA4   0145 0145 014B 0145
        DECLE   $001A,  $006E,  $0149,  $013E   ; DEA8   001A 006E 0149 013E
        DECLE   $001A,  $0149,  $0169,  $010D   ; DEAC   001A 0149 0169 010D
        DECLE   $0023,  $0105,  $0023,  $0105   ; DEB0   0023 0105 0023 0105
        DECLE   $0023,  $0105,  $0150,  $0105   ; DEB4   0023 0105 0150 0105
        DECLE   $010D,  $006E,  $0106,  $016C   ; DEB8   010D 006E 0106 016C
        DECLE   $010D,  $0106,  $0169,  $010D   ; DEBC   010D 0106 0169 010D
        DECLE   $0008,  $0105,  $0008,  $0105   ; DEC0   0008 0105 0008 0105
        DECLE   $0008,  $0105,  $0150,  $0105   ; DEC4   0008 0105 0150 0105
        DECLE   $010D,  $006E,  $0106,  $016C   ; DEC8   010D 006E 0106 016C
        DECLE   $010D,  $0106,  $0163,  $010D   ; DECC   010D 0106 0163 010D
        DECLE   $015C,  $015C,  $015C,  $015C   ; DED0   015C 015C 015C 015C
        DECLE   $015C,  $015C,  $0156,  $015C   ; DED4   015C 015C 0156 015C
        DECLE   $010D,  $006E,  $0106,  $016C   ; DED8   010D 006E 0106 016C
        DECLE   $010D,  $0106,  $0135,  $0013   ; DEDC   010D 0106 0135 0013
        DECLE   $0135,  $0135,  $0135,  $0135   ; DEE0   0135 0135 0135 0135
        DECLE   $0135,  $0135,  $0020,  $0135   ; DEE4   0135 0135 0020 0135
        DECLE   $010D,  $006E,  $0160,  $0166   ; DEE8   010D 006E 0160 0166
        DECLE   $0013,  $0160,  $0135,  $0135   ; DEEC   0013 0160 0135 0135
        DECLE   $006E,  $002C,  $0167,  $010B   ; DEF0   006E 002C 0167 010B
        DECLE   $0161,  $0161,  $0000,  $015A   ; DEF4   0161 0161 0000 015A
        DECLE   $0013,  $006E,  $0135,  $0135   ; DEF8   0013 006E 0135 0135
        DECLE   $0135,  $0135,  $0024,  $0135   ; DEFC   0135 0135 0024 0135
        DECLE   $006E,  $0000,  $0134,  $0012   ; DF00   006E 0000 0134 0012
        DECLE   $0134,  $0134,  $0000,  $0022   ; DF04   0134 0134 0000 0022
        DECLE   $0072,  $0000,  $0072,  $0072   ; DF08   0072 0000 0072 0072
        DECLE   $0072,  $0072,  $0072,  $0072   ; DF0C   0072 0072 0072 0072
        DECLE   $0000,  $0000,  $0072,  $0072   ; DF10   0000 0000 0072 0072
        DECLE   $0072,  $0072,  $0000,  $0072   ; DF14   0072 0072 0000 0072
        DECLE   $0070,  $0000,  $0018,  $0070   ; DF18   0070 0000 0018 0070
        DECLE   $014A,  $013F,  $014F,  $014A   ; DF1C   014A 013F 014F 014A
        DECLE   $0070,  $0070,  $0070,  $0070   ; DF20   0070 0070 0070 0070
        DECLE   $0070,  $0070,  $0000,  $0070   ; DF24   0070 0070 0000 0070
        DECLE   $0019,  $006E,  $0111,  $001B   ; DF28   0019 006E 0111 001B
        DECLE   $0102,  $016D,  $0154,  $0102   ; DF2C   0102 016D 0154 0102
        DECLE   $013C,  $0019,  $0146,  $0146   ; DF30   013C 0019 0146 0146
        DECLE   $0146,  $0146,  $0000,  $014C   ; DF34   0146 0146 0000 014C
        DECLE   $010B,  $006E,  $0111,  $010E   ; DF38   010B 006E 0111 010E
        DECLE   $0102,  $016D,  $0154,  $0102   ; DF3C   0102 016D 0154 0102
        DECLE   $016A,  $000B,  $0106,  $0106   ; DF40   016A 000B 0106 0106
        DECLE   $0106,  $0106,  $0000,  $0151   ; DF44   0106 0106 0000 0151
        DECLE   $010B,  $006E,  $0111,  $010E   ; DF48   010B 006E 0111 010E
        DECLE   $0161,  $0167,  $015A,  $0161   ; DF4C   0161 0167 015A 0161
        DECLE   $016A,  $000B,  $0106,  $0106   ; DF50   016A 000B 0106 0106
        DECLE   $0106,  $0106,  $0000,  $0151   ; DF54   0106 0106 0000 0151
        DECLE   $010B,  $006E,  $0016,  $010E   ; DF58   010B 006E 0016 010E
        DECLE   $0139,  $0139,  $0021,  $0139   ; DF5C   0139 0139 0021 0139
        DECLE   $016A,  $000B,  $0106,  $0106   ; DF60   016A 000B 0106 0106
        DECLE   $0106,  $0106,  $0000,  $0151   ; DF64   0106 0106 0000 0151
        DECLE   $010B,  $006E,  $0137,  $0014   ; DF68   010B 006E 0137 0014
        DECLE   $0137,  $0137,  $002B,  $0137   ; DF6C   0137 0137 002B 0137
        DECLE   $0164,  $000B,  $015D,  $015D   ; DF70   0164 000B 015D 015D
        DECLE   $015D,  $015D,  $0000,  $0157   ; DF74   015D 015D 0000 0157
        DECLE   $0012,  $006E,  $0134,  $0134   ; DF78   0012 006E 0134 0134
        DECLE   $0134,  $0134,  $0000,  $0022   ; DF7C   0134 0134 0000 0022
        DECLE   $0134,  $0012,  $0134,  $0134   ; DF80   0134 0012 0134 0134
        DECLE   $0134,  $0134,  $0000,  $0022   ; DF84   0134 0134 0000 0022
        DECLE   $0072,  $0000,  $0072,  $0072   ; DF88   0072 0000 0072 0072
        DECLE   $0072,  $0072,  $0000,  $0072   ; DF8C   0072 0072 0000 0072
        DECLE   $0072,  $0072,  $0072,  $0072   ; DF90   0072 0072 0072 0072
        DECLE   $0072,  $0072,  $0000,  $0072   ; DF94   0072 0072 0000 0072
        DECLE   $0070,  $0000,  $0070,  $0070   ; DF98   0070 0000 0070 0070
        DECLE   $0070,  $0070,  $0070,  $0070   ; DF9C   0070 0070 0070 0070
        DECLE   $0070,  $0070,  $013F,  $0018   ; DFA0   0070 0070 013F 0018
        DECLE   $014A,  $014A,  $014F,  $014A   ; DFA4   014A 014A 014F 014A
        DECLE   $001A,  $006E,  $013B,  $001A   ; DFA8   001A 006E 013B 001A
        DECLE   $0145,  $0145,  $0000,  $014B   ; DFAC   0145 0145 0000 014B
        DECLE   $001B,  $0019,  $016D,  $0111   ; DFB0   001B 0019 016D 0111
        DECLE   $0133,  $0033,  $0154,  $0029   ; DFB4   0133 0033 0154 0029
        DECLE   $010D,  $006E,  $0169,  $010D   ; DFB8   010D 006E 0169 010D
        DECLE   $0105,  $0105,  $0000           ; DFBC   0105 0105 0000

        CMPR    R2,     R0                      ; DFBF   0150
        SUBR    R1,     R6                      ; DFC0   010E
        SUBR    R1,     R3                      ; DFC1   010B
        CMPR    R5,     R5                      ; DFC2   016D
        SUBR    R2,     R1                      ; DFC3   0111
        SUBR    R6,     R1                      ; DFC4   0131
        SUBR    R6,     R1                      ; DFC5   0131
        CMPR    R2,     R4                      ; DFC6   0154
        ADCR    R7                              ; DFC7   002F

        SUBR    R1,     R5                      ; DFC8   010D
L_DFC9:
        SAR     R2,     2                       ; DFC9   006E
        DECLE   $0169,  $010D,  $0105,  $0105   ; DFCA   0169 010D 0105 0105
        DECLE   $0000,  $0150,  $010E,  $010B   ; DFCE   0000 0150 010E 010B
        DECLE   $0167,  $0111,  $0161,  $0161   ; DFD2   0167 0111 0161 0161
        DECLE   $015A,  $0161,  $010D,  $006E   ; DFD6   015A 0161 010D 006E
        DECLE   $0163,  $010D,  $015C,  $015C   ; DFDA   0163 010D 015C 015C
        DECLE   $0000,  $0156,  $010E,  $010B   ; DFDE   0000 0156 010E 010B
        DECLE   $0139,  $0016,  $0139,  $0139   ; DFE2   0139 0016 0139 0139
        DECLE   $0021,  $0139,  $010D,  $006E   ; DFE6   0021 0139 010D 006E
        DECLE   $0135,  $0013,  $0135,  $0135   ; DFEA   0135 0013 0135 0135
        DECLE   $0000,  $0024,  $0014,  $010B   ; DFEE   0000 0024 0014 010B
        DECLE   $0137,  $0137,  $0137,  $0137   ; DFF2   0137 0137 0137 0137
        DECLE   $002B,  $0137,  $0013,  $006E   ; DFF6   002B 0137 0013 006E
        DECLE   $0135,  $0135,  $0135,  $0135   ; DFFA   0135 0135 0135 0135
        DECLE   $0000                           ; DFFE   0000

        NEGR    R4                              ; DFFF   0024

        ORG     $F000
        DECLE   $0134,  $0012,  $0134,  $0134   ; F000   0134 0012 0134 0134
        DECLE   $0134,  $0134,  $0000,  $0022   ; F004   0134 0134 0000 0022
        DECLE   $0072,  $0000,  $0072,  $0072   ; F008   0072 0000 0072 0072
        DECLE   $0072,  $0072,  $0000,  $0072   ; F00C   0072 0072 0000 0072
        DECLE   $0072,  $0072,  $0072,  $0072   ; F010   0072 0072 0072 0072
        DECLE   $0072,  $0072,  $0000,  $0072   ; F014   0072 0072 0000 0072
        DECLE   $0000,  $0000,  $0070,  $0000   ; F018   0000 0000 0070 0000
        DECLE   $0070,  $0070,  $0070,  $0070   ; F01C   0070 0070 0070 0070
        DECLE   $0070,  $0070,  $0070,  $0070   ; F020   0070 0070 0070 0070
        DECLE   $0070,  $0070,  $0000,  $0000   ; F024   0070 0070 0000 0000
        DECLE   $0000,  $0000,  $0041,  $0000   ; F028   0000 0000 0041 0000
        DECLE   $0041,  $0041,  $0041,  $0041   ; F02C   0041 0041 0041 0041
        DECLE   $0041,  $0041,  $0041,  $0041   ; F030   0041 0041 0041 0041
        DECLE   $0041,  $0041,  $0000,  $0000   ; F034   0041 0041 0000 0000
        DECLE   $0000,  $0000,  $0070,  $0000   ; F038   0000 0000 0070 0000
        DECLE   $0018,  $0070,  $014A,  $013F   ; F03C   0018 0070 014A 013F
        DECLE   $014A,  $014A,  $014A,  $014A   ; F040   014A 014A 014A 014A
        DECLE   $014A,  $014A,  $014F,  $014A   ; F044   014A 014A 014F 014A
        DECLE   $0000,  $0000,  $0070,  $0000   ; F048   0000 0000 0070 0000

        SUBR    R2,     R1                      ; F04C   0111
        COMR    R0                              ; F04D   0018
        SUBR    R6,     R0                      ; F04E   0130
        CMPR    R5,     R5                      ; F04F   016D
        CMPR    R5,     R5                      ; F050   016D
        COMR    R4                              ; F051   001C
        SUBR    R0,     R2                      ; F052   0102
        SUBR    R0,     R2                      ; F053   0102
        SUBR    R0,     R2                      ; F054   0102
        SUBR    R0,     R2                      ; F055   0102
        CMPR    R2,     R4                      ; F056   0154
        SUBR    R0,     R2                      ; F057   0102
        SAR     R0,     1                       ; F058   0068
        SAR     R2,     2                       ; F059   006E
        COMR    R1                              ; F05A   0019
        SAR     R2,     2                       ; F05B   006E
        SUBR    R2,     R1                      ; F05C   0111
        SUBR    R1,     R6                      ; F05D   010E
        SUBR    R2,     R0                      ; F05E   0110
        CMPR    R5,     R5                      ; F05F   016D
        CMPR    R5,     R5                      ; F060   016D
        SUBR    R1,     R7                      ; F061   010F

        SUBR    R0,     R2                      ; F062   0102
        SUBR    R0,     R2                      ; F063   0102
        SUBR    R0,     R2                      ; F064   0102
        SUBR    R0,     R2                      ; F065   0102
        CMPR    R2,     R4                      ; F066   0154
        SUBR    R0,     R2                      ; F067   0102
        SAR     R0,     1                       ; F068   0068
        SAR     R2,     2                       ; F069   006E
        SUBR    R1,     R3                      ; F06A   010B
        SAR     R2,     2                       ; F06B   006E
        SUBR    R2,     R1                      ; F06C   0111
        SUBR    R1,     R6                      ; F06D   010E
        SUBR    R2,     R0                      ; F06E   0110
        CMPR    R5,     R5                      ; F06F   016D
        CMPR    R5,     R5                      ; F070   016D
        SUBR    R1,     R7                      ; F071   010F

        SUBR    R0,     R2                      ; F072   0102
        SUBR    R0,     R2                      ; F073   0102
        SUBR    R0,     R2                      ; F074   0102
        SUBR    R0,     R2                      ; F075   0102
        CMPR    R2,     R4                      ; F076   0154
        SUBR    R0,     R2                      ; F077   0102
        SAR     R0,     1                       ; F078   0068
        SAR     R2,     2                       ; F079   006E
        SUBR    R1,     R3                      ; F07A   010B
        SAR     R2,     2                       ; F07B   006E
        SUBR    R2,     R1                      ; F07C   0111
        DECR    R4                              ; F07D   0014
        SUBR    R2,     R0                      ; F07E   0110
        CMPR    R5,     R5                      ; F07F   016D
        CMPR    R5,     R5                      ; F080   016D
        SUBR    R1,     R7                      ; F081   010F

        CMPR    R4,     R1                      ; F082   0161
        SUBR    R0,     R2                      ; F083   0102
        CMPR    R4,     R1                      ; F084   0161
        CMPR    R4,     R1                      ; F085   0161
        CMPR    R2,     R4                      ; F086   0154
        SUBR    R0,     R2                      ; F087   0102
        SAR     R0,     1                       ; F088   0068
        SAR     R2,     2                       ; F089   006E
        DECR    R2                              ; F08A   0012
        SAR     R2,     2                       ; F08B   006E
        SUBR    R2,     R1                      ; F08C   0111
        SUBR    R6,     R4                      ; F08D   0134
        SUBR    R6,     R2                      ; F08E   0132
        CMPR    R5,     R5                      ; F08F   016D
        CMPR    R5,     R5                      ; F090   016D
        SUBR    R1,     R7                      ; F091   010F

        SUBR    R6,     R0                      ; F092   0130
        CMPR    R2,     R4                      ; F093   0154
        COMR    R4                              ; F094   001C
        SUBR    R6,     R0                      ; F095   0130
        CMPR    R2,     R4                      ; F096   0154
        CMPR    R5,     R5                      ; F097   016D
        SAR     R0,     1                       ; F098   0068
        SAR     R2,     2                       ; F099   006E
        RRC     R2,     1                       ; F09A   0072
        SAR     R2,     2                       ; F09B   006E
        SUBR    R2,     R1                      ; F09C   0111
        RRC     R2,     1                       ; F09D   0072
        RRC     R2,     1                       ; F09E   0072
        CMPR    R5,     R5                      ; F09F   016D
        CMPR    R5,     R5                      ; F0A0   016D
        SUBR    R1,     R7                      ; F0A1   010F

        CMPR    R1,     R0                      ; F0A2   0148
        CMPR    R2,     R4                      ; F0A3   0154
        SUBR    R1,     R7                      ; F0A4   010F

        CMPR    R1,     R5                      ; F0A5   014D
        CMPR    R2,     R4                      ; F0A6   0154
        CMPR    R5,     R5                      ; F0A7   016D
        SAR     R0,     1                       ; F0A8   0068
        SAR     R2,     2                       ; F0A9   006E
        RRC     R0,     1                       ; F0AA   0070
        SAR     R2,     2                       ; F0AB   006E
        SUBR    R2,     R1                      ; F0AC   0111
        RRC     R0,     1                       ; F0AD   0070
        RRC     R0,     1                       ; F0AE   0070
        CMPR    R5,     R5                      ; F0AF   016D
        CMPR    R5,     R5                      ; F0B0   016D
        SUBR    R1,     R7                      ; F0B1   010F

        SUBR    R0,     R5                      ; F0B2   0105
        CMPR    R2,     R4                      ; F0B3   0154
        SUBR    R1,     R7                      ; F0B4   010F

        CMPR    R2,     R2                      ; F0B5   0152
        CMPR    R2,     R4                      ; F0B6   0154
        CMPR    R5,     R5                      ; F0B7   016D
        SAR     R0,     1                       ; F0B8   0068
        SAR     R2,     2                       ; F0B9   006E
        COMR    R1                              ; F0BA   0019
        SAR     R2,     2                       ; F0BB   006E
        SUBR    R2,     R1                      ; F0BC   0111
        COMR    R3                              ; F0BD   001B
        COMR    R5                              ; F0BE   001D
        CMPR    R5,     R5                      ; F0BF   016D
        CMPR    R5,     R5                      ; F0C0   016D
        SUBR    R1,     R7                      ; F0C1   010F

        SUBR    R0,     R5                      ; F0C2   0105
        CMPR    R2,     R4                      ; F0C3   0154
        SUBR    R1,     R7                      ; F0C4   010F

        CMPR    R2,     R2                      ; F0C5   0152
        CMPR    R2,     R4                      ; F0C6   0154
        CMPR    R5,     R5                      ; F0C7   016D
        SAR     R0,     1                       ; F0C8   0068
        SAR     R2,     2                       ; F0C9   006E
        SUBR    R1,     R3                      ; F0CA   010B
        SAR     R2,     2                       ; F0CB   006E
        SUBR    R2,     R1                      ; F0CC   0111
        SUBR    R1,     R6                      ; F0CD   010E
        CMPR    R4,     R1                      ; F0CE   0161
        CMPR    R4,     R7                      ; F0CF   0167
        CMPR    R4,     R1                      ; F0D0   0161
        CMPR    R4,     R1                      ; F0D1   0161
        SUBR    R0,     R5                      ; F0D2   0105
        CMPR    R3,     R2                      ; F0D3   015A
        SUBR    R1,     R7                      ; F0D4   010F

        DECLE   $0152,  $015A,  $0167,  $0068   ; F0D5   0152 015A 0167 0068
        DECLE   $006E,  $010B,  $006E,  $0016   ; F0D9   006E 010B 006E 0016
        DECLE   $010E,  $0139,  $0139,  $0139   ; F0DD   010E 0139 0139 0139
        DECLE   $0139,  $015F,  $0029,  $0015   ; F0E1   0139 015F 0029 0015
        DECLE   $0158,  $0021,  $0139,  $0068   ; F0E5   0158 0021 0139 0068
        DECLE   $006E,  $010B,  $006E,  $0137   ; F0E9   006E 010B 006E 0137
        DECLE   $0014,  $0137,  $0137,  $0137   ; F0ED   0014 0137 0137 0137
        DECLE   $0137,  $0137,  $0137,  $0137   ; F0F1   0137 0137 0137 0137
        DECLE   $0137,  $002B,  $0137,  $0068   ; F0F5   0137 002B 0137 0068
        DECLE   $006E,  $0012,  $006E,  $0134   ; F0F9   006E 0012 006E 0134
        DECLE   $0134,  $0022,  $0134,  $006E   ; F0FD   0134 0022 0134 006E
        DECLE   $0000,  $006E,  $0068,  $0134   ; F101   0000 006E 0068 0134
        DECLE   $0012,  $0000,  $0022,  $0000   ; F105   0012 0000 0022 0000
        DECLE   $0000,  $0072,  $0000,  $0072   ; F109   0000 0072 0000 0072
        DECLE   $0072,  $0072,  $0072,  $0000   ; F10D   0072 0072 0072 0000
        DECLE   $0000,  $0000,  $0000,  $0072   ; F111   0000 0000 0000 0072
        DECLE   $0072,  $0000,  $0072,  $0001   ; F115   0072 0000 0072 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F119   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F11D   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F121   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F125   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F129   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F12D   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F131   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F135   0001 0001 0001 0001
        DECLE   $0001,  $007E,  $00B5,  $0002   ; F139   0001 007E 00B5 0002
        DECLE   $0002,  $0002,  $0002,  $0002   ; F13D   0002 0002 0002 0002
        DECLE   $0002,  $0002,  $0002,  $00BD   ; F141   0002 0002 0002 00BD
        DECLE   $008C,  $0001,  $0001,  $007E   ; F145   008C 0001 0001 007E
        DECLE   $00B5,  $0002,  $0002,  $0002   ; F149   00B5 0002 0002 0002
        DECLE   $0002,  $0002,  $0002,  $0002   ; F14D   0002 0002 0002 0002
        DECLE   $0002,  $0002,  $0002,  $0002   ; F151   0002 0002 0002 0002
        DECLE   $0002,  $00BD,  $008C,  $0002   ; F155   0002 00BD 008C 0002
        DECLE   $0002,  $00BA,  $0002,  $00BA   ; F159   0002 00BA 0002 00BA
        DECLE   $00C1,  $0004,  $0082,  $0091   ; F15D   00C1 0004 0082 0091
        DECLE   $0004,  $00BA,  $00C1,  $0002   ; F161   0004 00BA 00C1 0002
        DECLE   $00C1,  $0002,  $0002,  $0098   ; F165   00C1 0002 0002 0098
        DECLE   $0003,  $0004,  $0004,  $0004   ; F169   0003 0004 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; F16D   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; F171   0004 0004 0004 0004
        DECLE   $0004,  $0003,  $0089,  $0000   ; F175   0004 0003 0089 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F179   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F17D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F181   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0070   ; F185   0000 0000 0000 0070
        DECLE   $0000,  $0018,  $0070,  $0148   ; F189   0000 0018 0070 0148
        DECLE   $013D,  $0070,  $014D,  $0070   ; F18D   013D 0070 014D 0070
        DECLE   $0070,  $0070,  $0070,  $013F   ; F191   0070 0070 0070 013F
        DECLE   $0018,  $014F,  $014A,  $0019   ; F195   0018 014F 014A 0019
        DECLE   $006E,  $0111,  $001B,  $0105   ; F199   006E 0111 001B 0105
        DECLE   $016B,  $014F,  $0158,  $013E   ; F19D   016B 014F 0158 013E
        DECLE   $0019,  $001B,  $0149,  $016D   ; F1A1   0019 001B 0149 016D
        DECLE   $0111,  $0154,  $0102,  $010B   ; F1A5   0111 0154 0102 010B
        DECLE   $006E,  $0111,  $010E,  $0152   ; F1A9   006E 0111 010E 0152
        DECLE   $016B,  $015A,  $0027,  $016C   ; F1AD   016B 015A 0027 016C
        DECLE   $000B,  $010E,  $0106,  $016D   ; F1B1   000B 010E 0106 016D
        DECLE   $0111,  $0154,  $0102,  $010B   ; F1B5   0111 0154 0102 010B
        DECLE   $006E,  $0111,  $010E,  $0152   ; F1B9   006E 0111 010E 0152
        DECLE   $016B,  $001F,  $0131,  $016C   ; F1BD   016B 001F 0131 016C
        DECLE   $010B,  $010E,  $0106,  $016D   ; F1C1   010B 010E 0106 016D
        DECLE   $0111,  $0154,  $0102,  $010B   ; F1C5   0111 0154 0102 010B
        DECLE   $006E,  $0111,  $010E,  $0158   ; F1C9   006E 0111 010E 0158
        DECLE   $0165,  $002A,  $0134,  $016C   ; F1CD   0165 002A 0134 016C
        DECLE   $010B,  $010E,  $0106,  $0167   ; F1D1   010B 010E 0106 0167
        DECLE   $0111,  $015A,  $0161,  $010B   ; F1D5   0111 015A 0161 010B
        DECLE   $006E,  $0016,  $010E,  $0027   ; F1D9   006E 0016 010E 0027
        DECLE   $0139,  $0000,  $014F,  $016C   ; F1DD   0139 0000 014F 016C
        DECLE   $010B,  $010E,  $0106,  $0139   ; F1E1   010B 010E 0106 0139
        DECLE   $0016,  $0021,  $0139,  $010B   ; F1E5   0016 0021 0139 010B
        DECLE   $006E,  $0137,  $0014,  $002E   ; F1E9   006E 0137 0014 002E
        DECLE   $0137,  $0000,  $015A,  $0166   ; F1ED   0137 0000 015A 0166
        DECLE   $010B,  $0014,  $0160,  $0137   ; F1F1   010B 0014 0160 0137
        DECLE   $0137,  $002B,  $0137,  $0012   ; F1F5   0137 002B 0137 0012
        DECLE   $006E,  $0134,  $0134,  $0134   ; F1F9   006E 0134 0134 0134
        DECLE   $0134,  $0000,  $0022,  $0134   ; F1FD   0134 0000 0022 0134
        DECLE   $0012,  $0134,  $0134,  $0134   ; F201   0012 0134 0134 0134
        DECLE   $0134,  $0000,  $0022,  $0072   ; F205   0134 0000 0022 0072
        DECLE   $0000,  $0072,  $0072,  $0072   ; F209   0000 0072 0072 0072
        DECLE   $0072,  $0000,  $0072,  $0072   ; F20D   0072 0000 0072 0072
        DECLE   $0072,  $0072,  $0072,  $0072   ; F211   0072 0072 0072 0072
        DECLE   $0072,  $0000,  $0072,  $0070   ; F215   0072 0000 0072 0070
        DECLE   $0000,  $0070,  $0070,  $0018   ; F219   0000 0070 0070 0018
        DECLE   $0070,  $014A,  $013F,  $0070   ; F21D   0070 014A 013F 0070
        DECLE   $014F,  $0018,  $0070,  $0148   ; F221   014F 0018 0070 0148
        DECLE   $013D,  $0000,  $014D,  $0019   ; F225   013D 0000 014D 0019
        DECLE   $006E,  $0149,  $013E,  $0111   ; F229   006E 0149 013E 0111
        DECLE   $001B,  $0102,  $016D,  $0019   ; F22D   001B 0102 016D 0019
        DECLE   $0154,  $0111,  $001B,  $0105   ; F231   0154 0111 001B 0105
        DECLE   $016B,  $014F,  $0158,  $010B   ; F235   016B 014F 0158 010B
        DECLE   $006E,  $0106,  $016C,  $0111   ; F239   006E 0106 016C 0111
        DECLE   $010E,  $0102,  $016D,  $000B   ; F23D   010E 0102 016D 000B
        DECLE   $0154,  $0111,  $010E,  $0152   ; F241   0154 0111 010E 0152
        DECLE   $016B,  $015A,  $0027,  $010B   ; F245   016B 015A 0027 010B
        DECLE   $006E,  $0106,  $016C,  $0111   ; F249   006E 0106 016C 0111
        DECLE   $010E,  $0102,  $016D,  $000B   ; F24D   010E 0102 016D 000B
        DECLE   $0154,  $0111,  $010E,  $0152   ; F251   0154 0111 010E 0152
        DECLE   $016B,  $001F,  $0131,  $010B   ; F255   016B 001F 0131 010B
        DECLE   $006E,  $0106,  $016C,  $0111   ; F259   006E 0106 016C 0111
        DECLE   $010E,  $0161,  $0167,  $000B   ; F25D   010E 0161 0167 000B
        DECLE   $015A,  $0111,  $010E,  $0158   ; F261   015A 0111 010E 0158
        DECLE   $0165,  $002A,  $0134,  $010B   ; F265   0165 002A 0134 010B
        DECLE   $006E,  $0106,  $016C,  $0016   ; F269   006E 0106 016C 0016
        DECLE   $010E,  $0139,  $0139,  $010B   ; F26D   010E 0139 0139 010B
        DECLE   $0021,  $0016,  $010E,  $0027   ; F271   0021 0016 010E 0027
        DECLE   $0139,  $0000,  $014F,  $010B   ; F275   0139 0000 014F 010B
        DECLE   $006E,  $0160,  $0166,  $0137   ; F279   006E 0160 0166 0137
        DECLE   $0014,  $0137,  $0137,  $010B   ; F27D   0014 0137 0137 010B
        DECLE   $002B,  $0137,  $0014,  $002E   ; F281   002B 0137 0014 002E
        DECLE   $0137,  $0000,  $015A,  $0012   ; F285   0137 0000 015A 0012
        DECLE   $006E,  $0134,  $0134,  $0134   ; F289   006E 0134 0134 0134
        DECLE   $0134,  $0022,  $0134,  $0012   ; F28D   0134 0022 0134 0012
        DECLE   $0000,  $0134,  $0134,  $0134   ; F291   0000 0134 0134 0134
        DECLE   $0134,  $0000,  $0022,  $0072   ; F295   0134 0000 0022 0072
        DECLE   $0000,  $0072,  $0072,  $0072   ; F299   0000 0072 0072 0072
        DECLE   $0072,  $0072,  $0072,  $0072   ; F29D   0072 0072 0072 0072
        DECLE   $0000,  $0072,  $0072,  $0072   ; F2A1   0000 0072 0072 0072
        DECLE   $0072,  $0000,  $0072,  $0070   ; F2A5   0072 0000 0072 0070
        DECLE   $0000,  $0070,  $0070,  $0070   ; F2A9   0000 0070 0070 0070
        DECLE   $0070,  $0070,  $0070,  $0070   ; F2AD   0070 0070 0070 0070
        DECLE   $0070,  $0070,  $0070,  $0070   ; F2B1   0070 0070 0070 0070
        DECLE   $0070,  $0000,  $0070,  $0003   ; F2B5   0070 0000 0070 0003
        DECLE   $00A5,  $0003,  $0003,  $0003   ; F2B9   00A5 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; F2BD   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; F2C1   0003 0003 0003 0003
        DECLE   $0003,  $00B3,  $0003,  $007A   ; F2C5   0003 00B3 0003 007A
        DECLE   $009E,  $007A,  $007A,  $007A   ; F2C9   009E 007A 007A 007A
        DECLE   $007A,  $00A5,  $007A,  $007A   ; F2CD   007A 00A5 007A 007A
        DECLE   $00B3,  $007A,  $007A,  $007A   ; F2D1   00B3 007A 007A 007A
        DECLE   $007A,  $00AC,  $007A,  $0002   ; F2D5   007A 00AC 007A 0002
        DECLE   $0002,  $00CA,  $0002,  $00CA   ; F2D9   0002 00CA 0002 00CA
        DECLE   $00D2,  $0004,  $009E,  $00AC   ; F2DD   00D2 0004 009E 00AC
        DECLE   $0004,  $00CA,  $00D2,  $0002   ; F2E1   0004 00CA 00D2 0002
        DECLE   $00D2,  $0002,  $0002,  $009A   ; F2E5   00D2 0002 0002 009A
        DECLE   $00C4,  $0002,  $0002,  $0002   ; F2E9   00C4 0002 0002 0002
        DECLE   $0002,  $0002,  $0002,  $0002   ; F2ED   0002 0002 0002 0002
        DECLE   $0002,  $0002,  $0002,  $0002   ; F2F1   0002 0002 0002 0002
        DECLE   $0002,  $00CD,  $00A8,  $0001   ; F2F5   0002 00CD 00A8 0001
        DECLE   $0001,  $009A,  $00C4,  $0002   ; F2F9   0001 009A 00C4 0002
        DECLE   $0002,  $0002,  $0002,  $0002   ; F2FD   0002 0002 0002 0002
        DECLE   $0002,  $0002,  $0002,  $00CD   ; F301   0002 0002 0002 00CD
        DECLE   $00A8,  $0001,  $0001,  $0001   ; F305   00A8 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F309   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F30D   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F311   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0004   ; F315   0001 0001 0001 0004
        DECLE   $006E,  $0004,  $0004,  $0004   ; F319   006E 0004 0004 0004
        DECLE   $0004,  $008C,  $00A4,  $0001   ; F31D   0004 008C 00A4 0001
        DECLE   $00BD,  $0001,  $0001,  $0001   ; F321   00BD 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0000   ; F325   0001 0001 0001 0000

        SAR     R2,     2                       ; F329   006E
        SUBR    R7,     R3                      ; F32A   013B
L_F32B:
        DECR    R7                              ; F32B   0017

        DECLE   $0145,  $0145,  $0092,  $014B   ; F32C   0145 0145 0092 014B
        DECLE   $008C,  $0090,  $0001,  $0001   ; F330   008C 0090 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F334   0001 0001 0001 0001
        DECLE   $001A,  $006E,  $0163,  $010D   ; F338   001A 006E 0163 010D
        DECLE   $0105,  $015C,  $0000,  $0150   ; F33C   0105 015C 0000 0150
        DECLE   $0002,  $0003,  $0001,  $009D   ; F340   0002 0003 0001 009D
        DECLE   $0001,  $0001,  $0001,  $0001   ; F344   0001 0001 0001 0001

        SUBR    R1,     R5                      ; F348   010D
        SAR     R2,     2                       ; F349   006E
        SUBR    R6,     R5                      ; F34A   0135
        DECR    R3                              ; F34B   0013
        CMPR    R4,     R3                      ; F34C   0163
        SUBR    R0,     R7                      ; F34D   0107

        DECLE   $0000,  $0156,  $00BF,  $0003   ; F34E   0000 0156 00BF 0003
        DECLE   $008C,  $0002,  $0001,  $0001   ; F352   008C 0002 0001 0001
        DECLE   $0001,  $0001,  $010D,  $006E   ; F356   0001 0001 010D 006E
        DECLE   $0142,  $013A,  $0135,  $0013   ; F35A   0142 013A 0135 0013
        DECLE   $0000,  $0024,  $00F0,  $0003   ; F35E   0000 0024 00F0 0003
        DECLE   $0002,  $0002,  $0001,  $0001   ; F362   0002 0002 0001 0001
        DECLE   $0001,  $0001,  $010D,  $006E   ; F366   0001 0001 010D 006E
        DECLE   $015B,  $0162,  $015B,  $015B   ; F36A   015B 0162 015B 015B
        DECLE   $0000,  $0155,  $00F0,  $0003   ; F36E   0000 0155 00F0 0003
        DECLE   $0002,  $0002,  $0001,  $0001   ; F372   0002 0002 0001 0001
        DECLE   $0001,  $0001,  $0013,  $006E   ; F376   0001 0001 0013 006E
        DECLE   $0135,  $0135,  $0135,  $0135   ; F37A   0135 0135 0135 0135
        DECLE   $0000,  $0024,  $0004,  $0003   ; F37E   0000 0024 0004 0003
        DECLE   $0002,  $0002,  $0001,  $0001   ; F382   0002 0002 0001 0001
        DECLE   $0001,  $0001,  $0072,  $006E   ; F386   0001 0001 0072 006E
        DECLE   $0072,  $0072,  $0072,  $0072   ; F38A   0072 0072 0072 0072
        DECLE   $0000,  $0072,  $0004,  $0003   ; F38E   0000 0072 0004 0003
        DECLE   $0002,  $0002,  $0001,  $0001   ; F392   0002 0002 0001 0001
        DECLE   $0001,  $0001,  $001A,  $006E   ; F396   0001 0001 001A 006E
        DECLE   $0145,  $013B,  $0145,  $0145   ; F39A   0145 013B 0145 0145
        DECLE   $0000,  $014B,  $0004,  $0003   ; F39E   0000 014B 0004 0003
        DECLE   $0002,  $0002,  $0001,  $0001   ; F3A2   0002 0002 0001 0001
        DECLE   $0001,  $0001,  $010D,  $006E   ; F3A6   0001 0001 010D 006E
        DECLE   $0105,  $0169,  $0105,  $0105   ; F3AA   0105 0169 0105 0105
        DECLE   $0000,  $0150,  $0004,  $0003   ; F3AE   0000 0150 0004 0003
        DECLE   $0002,  $0002,  $0001,  $0001   ; F3B2   0002 0002 0001 0001
        DECLE   $0001,  $0001,  $010D,  $006E   ; F3B6   0001 0001 010D 006E
        DECLE   $0105,  $0169,  $0105,  $0105   ; F3BA   0105 0169 0105 0105
        DECLE   $0000,  $0150,  $00F0,  $0003   ; F3BE   0000 0150 00F0 0003
        DECLE   $0002,  $0002,  $0001,  $0001   ; F3C2   0002 0002 0001 0001
        DECLE   $0001,  $0001,  $010D,  $006E   ; F3C6   0001 0001 010D 006E
        DECLE   $015C,  $0163,  $015C,  $015C   ; F3CA   015C 0163 015C 015C
        DECLE   $0000,  $0156,  $00F0,  $0003   ; F3CE   0000 0156 00F0 0003
        DECLE   $0002,  $0002,  $0001,  $0001   ; F3D2   0002 0002 0001 0001
        DECLE   $0001,  $0001,  $0013,  $006E   ; F3D6   0001 0001 0013 006E
        DECLE   $0135,  $0135,  $0135,  $0135   ; F3DA   0135 0135 0135 0135
        DECLE   $0000                           ; F3DE   0000

        NEGR    R4                              ; F3DF   0024
        ADDR    R1,     R7                      ; F3E0   00CF

        DECLE   $0094,  $00A8,  $0002,  $0001   ; F3E1   0094 00A8 0002 0001
        DECLE   $0001,  $0001,  $0001,  $0072   ; F3E5   0001 0001 0001 0072
        DECLE   $006E,  $0072,  $0072,  $0072   ; F3E9   006E 0072 0072 0072
        DECLE   $0072,  $00B0,  $0072,  $0002   ; F3ED   0072 00B0 0072 0002
        DECLE   $00AC,  $0001,  $0080,  $0001   ; F3F1   00AC 0001 0080 0001
        DECLE   $0001,  $0001,  $0001,  $0047   ; F3F5   0001 0001 0001 0047
        DECLE   $006E,  $0047,  $0047,  $007A   ; F3F9   006E 0047 0047 007A
        DECLE   $007A,  $0088,  $007A,  $00CD   ; F3FD   007A 0088 007A 00CD
        DECLE   $00A8,  $0001,  $0001,  $0001   ; F401   00A8 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0004   ; F405   0001 0001 0001 0004
        DECLE   $006E,  $0004,  $0004,  $00A4   ; F409   006E 0004 0004 00A4
        DECLE   $0004,  $0080,  $0002,  $0001   ; F40D   0004 0080 0002 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F411   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F415   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F419   0001 0001 0001 0001
        DECLE   $0001,  $00B5,  $0001,  $00B2   ; F41D   0001 00B5 0001 00B2
        DECLE   $007E,  $0004,  $0004,  $0004   ; F421   007E 0004 0004 0004
        DECLE   $0004,  $0000,  $0004,  $0001   ; F425   0004 0000 0004 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F429   0001 0001 0001 0001
        DECLE   $0001,  $0081,  $007E,  $0000   ; F42D   0001 0081 007E 0000

        MOVR    R0,     R3                      ; F431   0083
        SUBR    R7,     R3                      ; F432   013B
L_F433:
        DECR    R7                              ; F433   0017

        DECLE   $0145,  $0145,  $0000,  $014B   ; F434   0145 0145 0000 014B
        DECLE   $0001,  $0001,  $0001,  $0001   ; F438   0001 0001 0001 0001
        DECLE   $00AB,  $0001,  $0003,  $0002   ; F43C   00AB 0001 0003 0002
        DECLE   $001A,  $0000,  $0163,  $010D   ; F440   001A 0000 0163 010D
        DECLE   $0105,  $015C,  $0000,  $0150   ; F444   0105 015C 0000 0150
        DECLE   $0001,  $0001,  $0001,  $0001   ; F448   0001 0001 0001 0001
        DECLE   $0002,  $007E,  $0003,  $00B7   ; F44C   0002 007E 0003 00B7
        DECLE   $010D,  $0000                   ; F450   010D 0000

        SUBR    R6,     R5                      ; F452   0135
        DECR    R3                              ; F453   0013
        CMPR    R4,     R3                      ; F454   0163
        SUBR    R0,     R7                      ; F455   0107

        DECLE   $0000,  $0156,  $0001,  $0001   ; F456   0000 0156 0001 0001
        DECLE   $0001,  $0001,  $0002,  $0002   ; F45A   0001 0001 0002 0002
        DECLE   $0003,  $00F2,  $010D,  $0000   ; F45E   0003 00F2 010D 0000
        DECLE   $0142,  $013A,  $0135,  $0013   ; F462   0142 013A 0135 0013
        DECLE   $0000,  $0024,  $0001,  $0001   ; F466   0000 0024 0001 0001
        DECLE   $0001,  $0001,  $0002,  $0002   ; F46A   0001 0001 0002 0002
        DECLE   $0003,  $00F2,  $010D,  $0000   ; F46E   0003 00F2 010D 0000
        DECLE   $015B,  $0162,  $015B,  $015B   ; F472   015B 0162 015B 015B
        DECLE   $0000,  $0155,  $0001,  $0001   ; F476   0000 0155 0001 0001
        DECLE   $0001,  $0001,  $0002,  $0002   ; F47A   0001 0001 0002 0002
        DECLE   $0003,  $0004,  $0013,  $0000   ; F47E   0003 0004 0013 0000
        DECLE   $0135,  $0135,  $0135,  $0135   ; F482   0135 0135 0135 0135
        DECLE   $0000,  $0024,  $0001,  $0001   ; F486   0000 0024 0001 0001
        DECLE   $0001,  $0001,  $0002,  $0002   ; F48A   0001 0001 0002 0002
        DECLE   $0003,  $0004,  $0072,  $0000   ; F48E   0003 0004 0072 0000
        DECLE   $0072,  $0072,  $0072,  $0072   ; F492   0072 0072 0072 0072
        DECLE   $0000,  $0072,  $0001,  $0001   ; F496   0000 0072 0001 0001
        DECLE   $0001,  $0001                   ; F49A   0001 0001

        EIS                                     ; F49C   0002
        EIS                                     ; F49D   0002
        DIS                                     ; F49E   0003

        JSRD    R4,     .EXEC.800               ; F49F   0004 001A 0000
        DECLE   $0145,  $013B,  $0145,  $0145   ; F4A2   0145 013B 0145 0145
        DECLE   $0000,  $014B,  $0001,  $0001   ; F4A6   0000 014B 0001 0001
        DECLE   $0001,  $0001,  $0002,  $0002   ; F4AA   0001 0001 0002 0002
        DECLE   $0003,  $0004,  $010D,  $0000   ; F4AE   0003 0004 010D 0000
        DECLE   $0105,  $0169,  $0105,  $0105   ; F4B2   0105 0169 0105 0105
        DECLE   $0000,  $0150,  $0001,  $0001   ; F4B6   0000 0150 0001 0001
        DECLE   $0001,  $0001,  $0002,  $0002   ; F4BA   0001 0001 0002 0002
        DECLE   $0003,  $00F2,  $010D,  $0000   ; F4BE   0003 00F2 010D 0000
        DECLE   $0105,  $0169,  $0105,  $0105   ; F4C2   0105 0169 0105 0105
        DECLE   $0000,  $0150,  $0001,  $0001   ; F4C6   0000 0150 0001 0001
        DECLE   $0001,  $0001,  $0002,  $0002   ; F4CA   0001 0001 0002 0002
        DECLE   $0003,  $00F2,  $010D,  $0000   ; F4CE   0003 00F2 010D 0000
        DECLE   $015C,  $0163,  $015C,  $015C   ; F4D2   015C 0163 015C 015C
        DECLE   $0000,  $0156,  $0001,  $0001   ; F4D6   0000 0156 0001 0001
        DECLE   $0001,  $0001                   ; F4DA   0001 0001

        EIS                                     ; F4DC   0002
        MOVR    R3,     R2                      ; F4DD   009A
        MOVR    R0,     R5                      ; F4DE   0085
        ADDR    R0,     R7                      ; F4DF   00C7

        DECLE   $0013,  $0000,  $0135,  $0135   ; F4E0   0013 0000 0135 0135
        DECLE   $0135,  $0135,  $0000,  $0024   ; F4E4   0135 0135 0000 0024
        DECLE   $0001,  $0001,  $0001,  $0001   ; F4E8   0001 0001 0001 0001
        DECLE   $008F,  $0001,  $009E,  $0002   ; F4EC   008F 0001 009E 0002
        DECLE   $0072,  $00A2,  $0072,  $0072   ; F4F0   0072 00A2 0072 0072
        DECLE   $0072,  $0072,  $0000,  $0072   ; F4F4   0072 0072 0000 0072
        DECLE   $0001,  $0001,  $0001,  $0001   ; F4F8   0001 0001 0001 0001
        DECLE   $0001,  $0001                   ; F4FC   0001 0001

        MOVR    R3,     R2                      ; F4FE   009A
        ADDR    R0,     R4                      ; F4FF   00C4
        SARC    R2,     1                       ; F500   007A
        MOVR    R2,     R7                      ; F501   0097

        DECLE   $007A,  $007A,  $0047,  $0047   ; F502   007A 007A 0047 0047
        DECLE   $0000,  $0047,  $0001,  $0001   ; F506   0000 0047 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F50A   0001 0001 0001 0001
        DECLE   $0001,  $0001                   ; F50E   0001 0001

        EIS                                     ; F510   0002
        MOVR    R1,     R7                      ; F511   008F

        DECLE   $0004,  $00B2,  $0004,  $0004   ; F512   0004 00B2 0004 0004
        DECLE   $0000,  $0004,  $0001,  $0001   ; F516   0000 0004 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F51A   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0097,  $0001   ; F51E   0001 0001 0097 0001
        DECLE   $0004,  $0004,  $0004,  $0004   ; F522   0004 0004 0004 0004
        DECLE   $0000,  $00AF,  $0001,  $0001   ; F526   0000 00AF 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F52A   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0002,  $00AB   ; F52E   0001 0001 0002 00AB
        DECLE   $0004,  $0004,  $0004,  $0004   ; F532   0004 0004 0004 0004
        DECLE   $0000,  $0003,  $0001,  $0001   ; F536   0000 0003 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F53A   0001 0001 0001 0001
        DECLE   $007E,  $0001,  $0002,  $0002   ; F53E   007E 0001 0002 0002
        DECLE   $0004,  $0004,  $0004,  $0004   ; F542   0004 0004 0004 0004
        DECLE   $0000,  $0003,  $0001,  $0001   ; F546   0000 0003 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F54A   0001 0001 0001 0001
        DECLE   $0002,  $00AB,  $00B2,  $0002   ; F54E   0002 00AB 00B2 0002
        DECLE   $0004,  $0004,  $0004,  $0004   ; F552   0004 0004 0004 0004
        DECLE   $0000,  $0003,  $0002,  $0002   ; F556   0000 0003 0002 0002
        DECLE   $0002,  $0002,  $0002,  $0002   ; F55A   0002 0002 0002 0002
        DECLE   $0002,  $0002,  $0004,  $00B2   ; F55E   0002 0002 0004 00B2
        DECLE   $0004,  $0004,  $0004,  $0004   ; F562   0004 0004 0004 0004
        DECLE   $0000,  $0003,  $0003,  $0003   ; F566   0000 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; F56A   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; F56E   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; F572   0003 0003 0003 0003
        DECLE   $0000,  $0003,  $0000,  $0000   ; F576   0000 0003 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F57A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F57E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F582   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0070,  $0000   ; F586   0000 0000 0070 0000

        SUBR    R7,     R3                      ; F58A   013B
L_F58B:
        DECR    R7                              ; F58B   0017

        CMPR    R1,     R3                      ; F58C   014B
        CMPR    R0,     R5                      ; F58D   0145
        RRC     R0,     1                       ; F58E   0070
        RRC     R0,     1                       ; F58F   0070
        SUBR    R7,     R3                      ; F590   013B
L_F591:
        DECR    R7                              ; F591   0017

        DECLE   $0145,  $0145,  $0145,  $0145   ; F592   0145 0145 0145 0145
        DECLE   $0000,  $014B,  $001A,  $006E   ; F596   0000 014B 001A 006E
        DECLE   $0169,  $010D,  $0150,  $0105   ; F59A   0169 010D 0150 0105
        DECLE   $001A,  $0000,  $0163,  $010D   ; F59E   001A 0000 0163 010D
        DECLE   $015C,  $015C,  $0105,  $0105   ; F5A2   015C 015C 0105 0105
        DECLE   $0000,  $0150,  $010D,  $006E   ; F5A6   0000 0150 010D 006E
        DECLE   $0169,  $010D,  $0150,  $0105   ; F5AA   0169 010D 0150 0105
        DECLE   $010D,  $0000                   ; F5AE   010D 0000

        SUBR    R6,     R5                      ; F5B0   0135
        DECR    R3                              ; F5B1   0013
        SUBR    R0,     R7                      ; F5B2   0107

        DECLE   $0135,  $0005,  $0169,  $0000   ; F5B3   0135 0005 0169 0000
        DECLE   $0150,  $0013,  $006E,  $0169   ; F5B7   0150 0013 006E 0169
        DECLE   $010D,  $0150,  $0105,  $0013   ; F5BB   010D 0150 0105 0013
        DECLE   $0000                           ; F5BF   0000

        SUBR    R6,     R5                      ; F5C0   0135
        SUBR    R6,     R5                      ; F5C1   0135
        SUBR    R1,     R5                      ; F5C2   010D
        SUBR    R0,     R7                      ; F5C3   0107

        DECLE   $0105,  $0169,  $0000,  $0150   ; F5C4   0105 0169 0000 0150
        DECLE   $0072,  $006E,  $0169,  $010D   ; F5C8   0072 006E 0169 010D
        DECLE   $0105,  $0105,  $0145,  $0145   ; F5CC   0105 0105 0145 0145
        DECLE   $0072,  $014B,  $010D,  $010D   ; F5D0   0072 014B 010D 010D
        DECLE   $0105,  $0169,  $0000,  $0150   ; F5D4   0105 0169 0000 0150
        DECLE   $001A,  $006E,  $0163,  $010D   ; F5D8   001A 006E 0163 010D
        DECLE   $015C,  $015C,  $015C,  $015C   ; F5DC   015C 015C 015C 015C
        DECLE   $0000,  $0156,  $010D,  $010D   ; F5E0   0000 0156 010D 010D
        DECLE   $015C,  $0163,  $0000,  $0156   ; F5E4   015C 0163 0000 0156
        DECLE   $010D,  $006E,  $0135,  $0013   ; F5E8   010D 006E 0135 0013
        DECLE   $0135,  $0135,  $0135,  $0135   ; F5EC   0135 0135 0135 0135
        DECLE   $0000,  $0024,  $0013,  $010D   ; F5F0   0000 0024 0013 010D
        DECLE   $0135,  $0135,  $0000,  $0024   ; F5F4   0135 0135 0000 0024
        DECLE   $0013,  $006E,  $0135,  $0135   ; F5F8   0013 006E 0135 0135
        DECLE   $0000,  $0024,  $0135,  $0013   ; F5FC   0000 0024 0135 0013
        DECLE   $0000,  $0024,  $0135,  $0013   ; F600   0000 0024 0135 0013
        DECLE   $0135,  $0135,  $0000,  $0024   ; F604   0135 0135 0000 0024
        DECLE   $0072,  $0000,  $0072,  $0072   ; F608   0072 0000 0072 0072
        DECLE   $0000,  $0072,  $0072,  $0072   ; F60C   0000 0072 0072 0072
        DECLE   $0000,  $0072,  $0072,  $0072   ; F610   0000 0072 0072 0072
        DECLE   $0072,  $0072,  $0000,  $0072   ; F614   0072 0072 0000 0072
        DECLE   $0000,  $0000,  $0000,  $0000   ; F618   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F61C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F620   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F624   0000 0000 0000 0000
        DECLE   $0070,  $0000                   ; F628   0070 0000

        SUBR    R7,     R3                      ; F62A   013B
L_F62B:
        DECR    R7                              ; F62B   0017

        CMPR    R1,     R3                      ; F62C   014B
        CMPR    R0,     R5                      ; F62D   0145
        RRC     R0,     1                       ; F62E   0070
        RRC     R0,     1                       ; F62F   0070
        SUBR    R7,     R3                      ; F630   013B
L_F631:
        DECR    R7                              ; F631   0017

        DECLE   $0145,  $0145,  $0145,  $0145   ; F632   0145 0145 0145 0145
        DECLE   $0000,  $014B,  $001A,  $006E   ; F636   0000 014B 001A 006E
        DECLE   $0169,  $010D,  $0150,  $0105   ; F63A   0169 010D 0150 0105
        DECLE   $001A,  $0000,  $0163,  $010D   ; F63E   001A 0000 0163 010D
        DECLE   $015C,  $015C,  $0105,  $0105   ; F642   015C 015C 0105 0105
        DECLE   $0000,  $0150,  $010D,  $006E   ; F646   0000 0150 010D 006E
        DECLE   $0169,  $010D,  $0150,  $0105   ; F64A   0169 010D 0150 0105
        DECLE   $010D,  $0000                   ; F64E   010D 0000

        SUBR    R6,     R5                      ; F650   0135
        DECR    R3                              ; F651   0013
        SUBR    R0,     R7                      ; F652   0107

        DECLE   $0135,  $0105,  $0169,  $0000   ; F653   0135 0105 0169 0000
        DECLE   $0150,  $0013,  $006E,  $0169   ; F657   0150 0013 006E 0169
        DECLE   $010D,  $0150,  $0105,  $0013   ; F65B   010D 0150 0105 0013
        DECLE   $0000                           ; F65F   0000

        SUBR    R6,     R5                      ; F660   0135
        SUBR    R6,     R5                      ; F661   0135
        SUBR    R1,     R5                      ; F662   010D
        SUBR    R0,     R7                      ; F663   0107

        DECLE   $0105,  $0169,  $0000,  $0150   ; F664   0105 0169 0000 0150
        DECLE   $0072,  $006E,  $0169,  $010D   ; F668   0072 006E 0169 010D
        DECLE   $0105,  $0105,  $0145,  $0145   ; F66C   0105 0105 0145 0145
        DECLE   $0072,  $014B,  $010D,  $010D   ; F670   0072 014B 010D 010D
        DECLE   $0105,  $0169,  $0000,  $0150   ; F674   0105 0169 0000 0150
        DECLE   $001A,  $006E,  $0163,  $010D   ; F678   001A 006E 0163 010D
        DECLE   $015C,  $015C,  $015C,  $015C   ; F67C   015C 015C 015C 015C
        DECLE   $0000,  $0156,  $010D,  $010D   ; F680   0000 0156 010D 010D
        DECLE   $015C,  $0163,  $0000,  $0156   ; F684   015C 0163 0000 0156
        DECLE   $010D,  $006E,  $0135,  $0013   ; F688   010D 006E 0135 0013
        DECLE   $0135,  $0135,  $0135,  $0135   ; F68C   0135 0135 0135 0135
        DECLE   $0000,  $0024,  $0013,  $010D   ; F690   0000 0024 0013 010D
        DECLE   $0135,  $0135,  $0000,  $0024   ; F694   0135 0135 0000 0024
        DECLE   $0013,  $006E,  $0135,  $0135   ; F698   0013 006E 0135 0135
        DECLE   $0000,  $0024,  $0135,  $0013   ; F69C   0000 0024 0135 0013
        DECLE   $0000,  $0024,  $0135,  $0013   ; F6A0   0000 0024 0135 0013
        DECLE   $0135,  $0135,  $0000,  $0024   ; F6A4   0135 0135 0000 0024
        DECLE   $0072,  $0000,  $0072,  $0072   ; F6A8   0072 0000 0072 0072
        DECLE   $0000,  $0072,  $0072,  $0072   ; F6AC   0000 0072 0072 0072
        DECLE   $0000,  $0072,  $0072,  $0072   ; F6B0   0000 0072 0072 0072
        DECLE   $0072,  $0072,  $0000,  $0072   ; F6B4   0072 0072 0000 0072
        DECLE   $007A,  $007A,  $007A,  $007A   ; F6B8   007A 007A 007A 007A
        DECLE   $007A,  $007A,  $007A,  $007A   ; F6BC   007A 007A 007A 007A
        DECLE   $007A,  $007A,  $0047,  $007A   ; F6C0   007A 007A 0047 007A
        DECLE   $0047,  $0047,  $0000,  $0003   ; F6C4   0047 0047 0000 0003
        DECLE   $0004,  $0004,  $0004,  $0004   ; F6C8   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; F6CC   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; F6D0   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0000,  $0003   ; F6D4   0004 0004 0000 0003
        DECLE   $0002,  $0002,  $0002,  $0002   ; F6D8   0002 0002 0002 0002
        DECLE   $0002,  $0002,  $0002,  $0002   ; F6DC   0002 0002 0002 0002
        DECLE   $0004,  $0097,  $0004,  $0004   ; F6E0   0004 0097 0004 0004
        DECLE   $0004,  $0004,  $0000,  $0003   ; F6E4   0004 0004 0000 0003
        DECLE   $0001,  $0001,  $0001,  $0001   ; F6E8   0001 0001 0001 0001
        DECLE   $0001,  $0001                   ; F6EC   0001 0001

        EIS                                     ; F6EE   0002
        MOVR    R1,     R7                      ; F6EF   008F
        MOVR    R2,     R7                      ; F6F0   0097

        DECLE   $0002,  $0004,  $0004,  $0004   ; F6F1   0002 0004 0004 0004
        DECLE   $0004,  $0000,  $0003,  $0001   ; F6F5   0004 0000 0003 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F6F9   0001 0001 0001 0001
        DECLE   $0001,  $009A,  $0001,  $0002   ; F6FD   0001 009A 0001 0002
        DECLE   $0002,  $0004,  $0004,  $0004   ; F701   0002 0004 0004 0004
        DECLE   $0004,  $0000,  $0003,  $0001   ; F705   0004 0000 0003 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F709   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001           ; F70D   0001 0001 0001

        MOVR    R6,     R2                      ; F710   00B2
        MOVR    R1,     R7                      ; F711   008F

        DECLE   $0004,  $0004,  $0004,  $0004   ; F712   0004 0004 0004 0004
        DECLE   $0000,  $0094,  $00A1,  $006E   ; F716   0000 0094 00A1 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; F71A   0004 0004 0004 0004
        DECLE   $0001,  $0088,  $0001,  $0001   ; F71E   0001 0088 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F722   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0003,  $006E   ; F726   0001 0001 0003 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; F72A   0004 0004 0004 0004
        DECLE   $009D,  $0002,  $0001,  $0001   ; F72E   009D 0002 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F732   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0003,  $006E   ; F736   0001 0001 0003 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; F73A   0004 0004 0004 0004
        DECLE   $0002,  $0002,  $0001,  $008C   ; F73E   0002 0002 0001 008C
        DECLE   $0001,  $0001,  $0001,  $0001   ; F742   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0003,  $006E   ; F746   0001 0001 0003 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; F74A   0004 0004 0004 0004
        DECLE   $0002,  $00A4,  $009D,  $0002   ; F74E   0002 00A4 009D 0002
        DECLE   $0001,  $0001,  $0001,  $0001   ; F752   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0003,  $006E   ; F756   0001 0001 0003 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; F75A   0004 0004 0004 0004
        DECLE   $00A4,  $0004,  $0002,  $0002   ; F75E   00A4 0004 0002 0002
        DECLE   $0002,  $0002,  $0002,  $0002   ; F762   0002 0002 0002 0002
        DECLE   $0002,  $0002,  $0003,  $006E   ; F766   0002 0002 0003 006E
        DECLE   $0003,  $0003,  $0003,  $0003   ; F76A   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; F76E   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; F772   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0000,  $0000   ; F776   0003 0003 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F77A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F77E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F782   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0070,  $0000   ; F786   0000 0000 0070 0000

        SUBR    R7,     R3                      ; F78A   013B
L_F78B:
        DECR    R7                              ; F78B   0017

        CMPR    R0,     R5                      ; F78C   0145
        CMPR    R0,     R5                      ; F78D   0145
        CMPR    R0,     R5                      ; F78E   0145
        CMPR    R0,     R5                      ; F78F   0145
        RRC     R0,     1                       ; F790   0070
        CMPR    R1,     R3                      ; F791   014B
L_F792:
        DECR    R7                              ; F792   0017

        DECLE   $0070,  $0145,  $013B,  $0000   ; F793   0070 0145 013B 0000
        DECLE   $014B,  $001A,  $006E,  $0169   ; F797   014B 001A 006E 0169
        DECLE   $010D,  $0105,  $0105,  $015C   ; F79B   010D 0105 0105 015C
        DECLE   $015C,  $0000,  $0156,  $010D   ; F79F   015C 0000 0156 010D
        DECLE   $001A,  $0105,  $0169,  $0000   ; F7A3   001A 0105 0169 0000
        DECLE   $0150,  $010D,  $006E,  $0169   ; F7A7   0150 010D 006E 0169
        DECLE   $010D,  $0150,  $0105,  $0135   ; F7AB   010D 0150 0105 0135
        DECLE   $0135,  $0000,  $0020,  $010D   ; F7AF   0135 0000 0020 010D
        DECLE   $010D,  $0105,  $0169,  $0000   ; F7B3   010D 0105 0169 0000
        DECLE   $0150,  $010D,  $006E,  $0169   ; F7B7   0150 010D 006E 0169
        DECLE   $010D,  $0150,  $0105,  $0135   ; F7BB   010D 0150 0105 0135
        DECLE   $0135,  $0000,  $002C,  $010D   ; F7BF   0135 0000 002C 010D
        DECLE   $010D,  $0105,  $0169,  $0000   ; F7C3   010D 0105 0169 0000

        CMPR    R2,     R0                      ; F7C7   0150
        SUBR    R1,     R5                      ; F7C8   010D
        SAR     R2,     2                       ; F7C9   006E
        CMPR    R5,     R1                      ; F7CA   0169
        SUBR    R1,     R5                      ; F7CB   010D
        CMPR    R2,     R0                      ; F7CC   0150
        SUBR    R0,     R5                      ; F7CD   0105
        RRC     R2,     1                       ; F7CE   0072
        RRC     R2,     1                       ; F7CF   0072
        SUBR    R7,     R3                      ; F7D0   013B
L_F7D1:
        DECR    R7                              ; F7D1   0017

        DECLE   $0145,  $0145,  $0105,  $0105   ; F7D2   0145 0145 0105 0105
        DECLE   $0000,  $0150,  $010D,  $006E   ; F7D6   0000 0150 010D 006E
        DECLE   $0163,  $010D,  $0156,  $015C   ; F7DA   0163 010D 0156 015C
        DECLE   $001A,  $0000,  $0163,  $010D   ; F7DE   001A 0000 0163 010D
        DECLE   $015C,  $015C,  $015C,  $015C   ; F7E2   015C 015C 015C 015C
        DECLE   $0000,  $0156,  $010D,  $006E   ; F7E6   0000 0156 010D 006E
        DECLE   $0135,  $0013,  $0024,  $0135   ; F7EA   0135 0013 0024 0135
        DECLE   $010D,  $0000,  $0135,  $0013   ; F7EE   010D 0000 0135 0013
        DECLE   $0135,  $0135,  $0135,  $0135   ; F7F2   0135 0135 0135 0135
        DECLE   $0000,  $0024,  $0013,  $006E   ; F7F6   0000 0024 0013 006E
        DECLE   $0135,  $0135,  $0024,  $0135   ; F7FA   0135 0135 0024 0135
        DECLE   $0013,  $0000,  $0135,  $0135   ; F7FE   0013 0000 0135 0135
        DECLE   $0000,  $0024,  $0135,  $0013   ; F802   0000 0024 0135 0013
        DECLE   $0000,  $0024,  $0072,  $0000   ; F806   0000 0024 0072 0000
        DECLE   $0072,  $0072,  $0072,  $0072   ; F80A   0072 0072 0072 0072
        DECLE   $0072,  $0000,  $0072,  $0072   ; F80E   0072 0000 0072 0072
        DECLE   $0000,  $0072,  $0072,  $0072   ; F812   0000 0072 0072 0072
        DECLE   $0000,  $0072,  $0070,  $0000   ; F816   0000 0072 0070 0000
        DECLE   $0070,  $0070,  $0070,  $0070   ; F81A   0070 0070 0070 0070
        DECLE   $0070,  $0070,  $0070,  $0070   ; F81E   0070 0070 0070 0070
        DECLE   $0070,  $0070,  $0070,  $0070   ; F822   0070 0070 0070 0070
        DECLE   $0000,  $0070,  $0070,  $0000   ; F826   0000 0070 0070 0000

        SUBR    R7,     R3                      ; F82A   013B
L_F82B:
        DECR    R7                              ; F82B   0017

        CMPR    R0,     R5                      ; F82C   0145
        CMPR    R0,     R5                      ; F82D   0145
        CMPR    R0,     R5                      ; F82E   0145
        CMPR    R0,     R5                      ; F82F   0145
        RRC     R0,     1                       ; F830   0070
        CMPR    R1,     R3                      ; F831   014B
L_F832:
        DECR    R7                              ; F832   0017

        DECLE   $0070,  $0145,  $013B,  $0000   ; F833   0070 0145 013B 0000
        DECLE   $014B,  $001A,  $006E,  $0169   ; F837   014B 001A 006E 0169
        DECLE   $010D,  $0105,  $0105,  $015C   ; F83B   010D 0105 0105 015C
        DECLE   $015C,  $0000,  $0156,  $010D   ; F83F   015C 0000 0156 010D
        DECLE   $001A,  $0105,  $0169,  $0000   ; F843   001A 0105 0169 0000
        DECLE   $0150,  $010D,  $006E,  $0169   ; F847   0150 010D 006E 0169
        DECLE   $010D,  $0150,  $0105,  $0135   ; F84B   010D 0150 0105 0135
        DECLE   $0135,  $0000,  $0020,  $010D   ; F84F   0135 0000 0020 010D
        DECLE   $010D,  $0105,  $0169,  $0000   ; F853   010D 0105 0169 0000
        DECLE   $0150,  $010D,  $006E,  $0169   ; F857   0150 010D 006E 0169
        DECLE   $010D,  $0150,  $0105,  $0135   ; F85B   010D 0150 0105 0135
        DECLE   $0135,  $0000,  $002C,  $010D   ; F85F   0135 0000 002C 010D
        DECLE   $010D,  $0105,  $0169,  $0000   ; F863   010D 0105 0169 0000

        CMPR    R2,     R0                      ; F867   0150
        SUBR    R1,     R5                      ; F868   010D
        SAR     R2,     2                       ; F869   006E
        CMPR    R5,     R1                      ; F86A   0169
        SUBR    R1,     R5                      ; F86B   010D
        CMPR    R2,     R0                      ; F86C   0150
        SUBR    R0,     R5                      ; F86D   0105
        RRC     R2,     1                       ; F86E   0072
        RRC     R2,     1                       ; F86F   0072
        SUBR    R7,     R3                      ; F870   013B
L_F871:
        DECR    R7                              ; F871   0017

        DECLE   $0145,  $0145,  $0105,  $0105   ; F872   0145 0145 0105 0105
        DECLE   $0000,  $0150,  $010D,  $006E   ; F876   0000 0150 010D 006E
        DECLE   $0163,  $010D,  $0156,  $015C   ; F87A   0163 010D 0156 015C
        DECLE   $001A,  $0000,  $0163,  $010D   ; F87E   001A 0000 0163 010D
        DECLE   $015C,  $015C,  $015C,  $015C   ; F882   015C 015C 015C 015C
        DECLE   $0000,  $0156,  $010D,  $006E   ; F886   0000 0156 010D 006E
        DECLE   $0135,  $0013,  $0024,  $0135   ; F88A   0135 0013 0024 0135
        DECLE   $010D,  $0000,  $0135,  $0013   ; F88E   010D 0000 0135 0013
        DECLE   $0135,  $0135,  $0135,  $0135   ; F892   0135 0135 0135 0135
        DECLE   $0000,  $0024,  $0013,  $006E   ; F896   0000 0024 0013 006E
        DECLE   $0135,  $0135,  $0024,  $0135   ; F89A   0135 0135 0024 0135
        DECLE   $0013,  $0000,  $0135,  $0135   ; F89E   0013 0000 0135 0135
        DECLE   $0000,  $0024,  $0135,  $0013   ; F8A2   0000 0024 0135 0013
        DECLE   $0000,  $0024,  $0072,  $006E   ; F8A6   0000 0024 0072 006E
        DECLE   $0072,  $0072,  $0072,  $0072   ; F8AA   0072 0072 0072 0072
        DECLE   $0072,  $0000,  $0072,  $0072   ; F8AE   0072 0000 0072 0072
        DECLE   $0000,  $0072,  $0072,  $0072   ; F8B2   0000 0072 0072 0072
        DECLE   $0000,  $0072,  $0003,  $006E   ; F8B6   0000 0072 0003 006E
        DECLE   $0047,  $0047,  $007A,  $0047   ; F8BA   0047 0047 007A 0047
        DECLE   $007A,  $007A,  $007A,  $007A   ; F8BE   007A 007A 007A 007A
        DECLE   $007A,  $007A,  $007A,  $007A   ; F8C2   007A 007A 007A 007A
        DECLE   $007A,  $007A,  $0003,  $006E   ; F8C6   007A 007A 0003 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; F8CA   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; F8CE   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; F8D2   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0003,  $006E   ; F8D6   0004 0004 0003 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; F8DA   0004 0004 0004 0004
        DECLE   $0088,  $0004,  $0002,  $0002   ; F8DE   0088 0004 0002 0002
        DECLE   $0002,  $0002,  $0002,  $0002   ; F8E2   0002 0002 0002 0002
        DECLE   $0002,  $0002,  $0003,  $006E   ; F8E6   0002 0002 0003 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; F8EA   0004 0004 0004 0004
        DECLE   $0002,  $0088,  $0080,  $0002   ; F8EE   0002 0088 0080 0002
        DECLE   $0001,  $0001,  $0001,  $0001   ; F8F2   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0003,  $006E   ; F8F6   0001 0001 0003 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; F8FA   0004 0004 0004 0004
        DECLE   $0002,  $0002,  $0001,  $00A8   ; F8FE   0002 0002 0001 00A8
        DECLE   $0001,  $0001,  $0001,  $0001   ; F902   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0085,  $006E   ; F906   0001 0001 0085 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; F90A   0004 0004 0004 0004
        DECLE   $0080,  $00A4,  $0001,  $0001   ; F90E   0080 00A4 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F912   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0004,  $006E   ; F916   0001 0001 0004 006E
        DECLE   $0004,  $0004,  $00AA,  $0004   ; F91A   0004 0004 00AA 0004
        DECLE   $0001,  $00D1,  $0001,  $0001   ; F91E   0001 00D1 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F922   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0004,  $006E   ; F926   0001 0001 0004 006E
        DECLE   $0004,  $0004,  $0001,  $00D1   ; F92A   0004 0004 0001 00D1
        DECLE   $0001,  $0001,  $0001,  $0001   ; F92E   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F932   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0004,  $006E   ; F936   0001 0001 0004 006E
        DECLE   $0004,  $0004,  $0001,  $00A3   ; F93A   0004 0004 0001 00A3
        DECLE   $00DE,  $0001,  $01D8,  $01D8   ; F93E   00DE 0001 01D8 01D8
        DECLE   $01D8,  $01D8,  $00E2,  $01D8   ; F942   01D8 01D8 00E2 01D8
        DECLE   $01D8,  $00DE,  $01DD,  $01DC   ; F946   01D8 00DE 01DD 01DC
        DECLE   $01DD,  $01DD,  $01DD,  $01DD   ; F94A   01DD 01DD 01DD 01DD
        DECLE   $01D5,  $01DD,  $01DB,  $01DB   ; F94E   01D5 01DD 01DB 01DB
        DECLE   $01DB,  $01DB,  $01D7           ; F952   01DB 01DB 01D7

        CLRR    R3                              ; F955   01DB
        CLRR    R3                              ; F956   01DB
        XORR    R2,     R5                      ; F957   01D5
        SWAP    R3,     2                       ; F958   0047
        SAR     R2,     2                       ; F959   006E
        SWAP    R3,     2                       ; F95A   0047
        SWAP    R3,     2                       ; F95B   0047
        MOVR    R2,     R0                      ; F95C   0090
        MOVR    R2,     R4                      ; F95D   0094
        XORR    R3,     R0                      ; F95E   01D8
        XORR    R3,     R0                      ; F95F   01D8
        SWAP    R0,     2                       ; F960   0044
        TSTR    R0                              ; F961   0080
        SWAP    R0,     2                       ; F962   0044
        SWAP    R0,     2                       ; F963   0044
        XORR    R3,     R0                      ; F964   01D8
        MOVR    R1,     R7                      ; F965   008F

        DECLE   $0080,  $01D8,  $0004,  $006E   ; F966   0080 01D8 0004 006E
        DECLE   $0004,  $0004,  $00A5,  $0004   ; F96A   0004 0004 00A5 0004
        DECLE   $0081,  $0090,  $0041,  $008A   ; F96E   0081 0090 0041 008A
        DECLE   $0041,  $0041,  $0090,  $007B   ; F972   0041 0041 0090 007B
        DECLE   $008A,  $0081,  $0004,  $006E   ; F976   008A 0081 0004 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; F97A   0004 0004 0004 0004
        DECLE   $00AA,  $0004,  $0001,  $00D1   ; F97E   00AA 0004 0001 00D1
        DECLE   $0001,  $0001,  $009C,  $00C9   ; F982   0001 0001 009C 00C9
        DECLE   $00D1,  $00AA,  $0004,  $006E   ; F986   00D1 00AA 0004 006E
        DECLE   $0004,  $0004,  $00AA,  $0004   ; F98A   0004 0004 00AA 0004
        DECLE   $0001,  $00D1,  $0001,  $0001   ; F98E   0001 00D1 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F992   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0004,  $006E   ; F996   0001 0001 0004 006E
        DECLE   $0004,  $0004,  $0001,  $00D1   ; F99A   0004 0004 0001 00D1
        DECLE   $0001,  $0001,  $0001,  $0001   ; F99E   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; F9A2   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0004,  $006E   ; F9A6   0001 0001 0004 006E
        DECLE   $0004,  $0004,  $0001,  $00A3   ; F9AA   0004 0004 0001 00A3
        DECLE   $0001,  $0001,  $0001,  $0001   ; F9AE   0001 0001 0001 0001

        XORR    R3,     R0                      ; F9B2   01D8
        ADDR    R3,     R6                      ; F9B3   00DE
        XORR    R3,     R0                      ; F9B4   01D8
        XORR    R3,     R0                      ; F9B5   01D8
        XORR    R3,     R0                      ; F9B6   01D8
        XORR    R3,     R0                      ; F9B7   01D8
        XORR    R3,     R5                      ; F9B8   01DD
        XORR    R3,     R4                      ; F9B9   01DC
        XORR    R3,     R5                      ; F9BA   01DD
        XORR    R3,     R5                      ; F9BB   01DD
        XORR    R3,     R5                      ; F9BC   01DD
        XORR    R3,     R5                      ; F9BD   01DD
        XORR    R3,     R5                      ; F9BE   01DD
        XORR    R3,     R5                      ; F9BF   01DD
        XORR    R3,     R5                      ; F9C0   01DD
        XORR    R3,     R5                      ; F9C1   01DD
        CLRR    R3                              ; F9C2   01DB
        XORR    R2,     R5                      ; F9C3   01D5
        CLRR    R3                              ; F9C4   01DB
        CLRR    R3                              ; F9C5   01DB
        CLRR    R3                              ; F9C6   01DB
        CLRR    R3                              ; F9C7   01DB
        SWAP    R3,     2                       ; F9C8   0047
        SAR     R2,     2                       ; F9C9   006E
        SWAP    R3,     2                       ; F9CA   0047
        SWAP    R3,     2                       ; F9CB   0047
        SWAP    R3,     2                       ; F9CC   0047
        SWAP    R3,     2                       ; F9CD   0047
        MOVR    R2,     R4                      ; F9CE   0094
        SWAP    R3,     2                       ; F9CF   0047
        XORR    R3,     R0                      ; F9D0   01D8
        MOVR    R2,     R0                      ; F9D1   0090
        TSTR    R0                              ; F9D2   0080
        XORR    R3,     R0                      ; F9D3   01D8
        SWAP    R0,     2                       ; F9D4   0044
        SWAP    R0,     2                       ; F9D5   0044
        MOVR    R1,     R7                      ; F9D6   008F

        DECLE   $0044,  $0004,  $006E,  $0004   ; F9D7   0044 0004 006E 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; F9DB   0004 0004 0004 0004
        DECLE   $0004,  $0090,  $00A5,  $008A   ; F9DF   0004 0090 00A5 008A
        DECLE   $0081,  $0041,  $0041,  $007B   ; F9E3   0081 0041 0041 007B
        DECLE   $0041,  $0004,  $006E,  $0004   ; F9E7   0041 0004 006E 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; F9EB   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0004,  $00D1   ; F9EF   0004 0004 0004 00D1
        DECLE   $00AA,  $0001,  $0001,  $00C9   ; F9F3   00AA 0001 0001 00C9
        DECLE   $0001,  $0004,  $006E,  $0004   ; F9F7   0001 0004 006E 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; F9FB   0004 0004 0004 0004
        DECLE   $0004,  $00D1,  $0087,  $0001   ; F9FF   0004 00D1 0087 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FA03   0001 0001 0001 0001
        DECLE   $0001,  $0004,  $006E,  $0004   ; FA07   0001 0004 006E 0004
        DECLE   $0004,  $0004,  $0004,  $00AA   ; FA0B   0004 0004 0004 00AA
        DECLE   $0004,  $0001,  $0001,  $0001   ; FA0F   0004 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FA13   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FA17   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FA1B   0001 0001 0001 0001
        DECLE   $0001,  $00C9,  $0001,  $0004   ; FA1F   0001 00C9 0001 0004
        DECLE   $009C,  $0004,  $0004,  $0000   ; FA23   009C 0004 0004 0000
        DECLE   $0004,  $0001,  $0001,  $0001   ; FA27   0004 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FA2B   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $00C9   ; FA2F   0001 0001 0001 00C9
        DECLE   $0001,  $0004,  $0004,  $0000   ; FA33   0001 0004 0004 0000
        DECLE   $0004,  $01D8,  $01D8,  $00DE   ; FA37   0004 01D8 01D8 00DE
        DECLE   $00E2,  $01D8,  $01D8,  $01D8   ; FA3B   00E2 01D8 01D8 01D8
        DECLE   $01D8,  $00E2,  $01D8,  $00B1   ; FA3F   01D8 00E2 01D8 00B1
        DECLE   $0001,  $0004,  $0004,  $0000   ; FA43   0001 0004 0004 0000
        DECLE   $0004,  $01DB,  $01DB,  $01D5   ; FA47   0004 01DB 01DB 01D5
        DECLE   $01D7,  $01DB,  $01DB,  $01DB   ; FA4B   01D7 01DB 01DB 01DB
        DECLE   $01DB,  $01D7                   ; FA4F   01DB 01D7

        CLRR    R3                              ; FA51   01DB
        XORR    R3,     R5                      ; FA52   01DD
        XORR    R3,     R5                      ; FA53   01DD
        XORR    R3,     R5                      ; FA54   01DD
        XORR    R3,     R5                      ; FA55   01DD
        XORR    R3,     R4                      ; FA56   01DC
        XORR    R3,     R5                      ; FA57   01DD
        MOVR    R1,     R7                      ; FA58   008F

        SWAP    R0,     2                       ; FA59   0044
        XORR    R3,     R0                      ; FA5A   01D8
        XORR    R3,     R0                      ; FA5B   01D8
        SWAP    R0,     2                       ; FA5C   0044
        TSTR    R0                              ; FA5D   0080
        SWAP    R0,     2                       ; FA5E   0044
        SWAP    R0,     2                       ; FA5F   0044
        XORR    R3,     R0                      ; FA60   01D8
        MOVR    R1,     R7                      ; FA61   008F

        DECLE   $0081,  $01D9,  $0047,  $0085   ; FA62   0081 01D9 0047 0085
        DECLE   $0000,  $0047,  $007B,  $0041   ; FA66   0000 0047 007B 0041
        DECLE   $0081,  $0090,  $0041,  $008A   ; FA6A   0081 0090 0041 008A
        DECLE   $007B,  $0041,  $0090,  $0003   ; FA6E   007B 0041 0090 0003
        DECLE   $00B3,  $0081,  $0004,  $0004   ; FA72   00B3 0081 0004 0004
        DECLE   $0000,  $0004,  $00C9,  $0001   ; FA76   0000 0004 00C9 0001
        DECLE   $00AA,  $009C,  $0001,  $00D1   ; FA7A   00AA 009C 0001 00D1
        DECLE   $00C9,  $0001,  $0004,  $009C   ; FA7E   00C9 0001 0004 009C
        DECLE   $0004,  $0004,  $0004,  $0004   ; FA82   0004 0004 0004 0004
        DECLE   $0000,  $0004,  $0001,  $0001   ; FA86   0000 0004 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FA8A   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $00C9,  $0001   ; FA8E   0001 0001 00C9 0001
        DECLE   $0004,  $009C,  $0004,  $0004   ; FA92   0004 009C 0004 0004
        DECLE   $0000,  $0004,  $0001,  $0001   ; FA96   0000 0004 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FA9A   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FA9E   0001 0001 0001 0001
        DECLE   $00C9,  $0001,  $0004,  $0004   ; FAA2   00C9 0001 0004 0004
        DECLE   $0000,  $0004,  $01D8,  $01D8   ; FAA6   0000 0004 01D8 01D8
        DECLE   $01D8,  $01D8,  $00E2,  $01D8   ; FAAA   01D8 01D8 00E2 01D8
        DECLE   $0001,  $0001,  $0001,  $0001   ; FAAE   0001 0001 0001 0001
        DECLE   $00B1,  $0001,  $0004,  $0004   ; FAB2   00B1 0001 0004 0004
        DECLE   $0000,  $0004,  $01DB,  $01DB   ; FAB6   0000 0004 01DB 01DB
        DECLE   $01DB,  $01DB,  $01D7           ; FABA   01DB 01DB 01D7

        CLRR    R3                              ; FABD   01DB
        XORR    R3,     R5                      ; FABE   01DD
        XORR    R3,     R5                      ; FABF   01DD
        XORR    R3,     R5                      ; FAC0   01DD
        XORR    R3,     R5                      ; FAC1   01DD
        XORR    R3,     R5                      ; FAC2   01DD
        XORR    R3,     R5                      ; FAC3   01DD
        XORR    R3,     R5                      ; FAC4   01DD
        XORR    R3,     R5                      ; FAC5   01DD
        XORR    R3,     R4                      ; FAC6   01DC
        XORR    R3,     R5                      ; FAC7   01DD
        SWAP    R0,     2                       ; FAC8   0044
        TSTR    R0                              ; FAC9   0080
        SWAP    R0,     2                       ; FACA   0044
        SWAP    R0,     2                       ; FACB   0044
        XORR    R3,     R0                      ; FACC   01D8
        MOVR    R1,     R7                      ; FACD   008F

        DECLE   $0081,  $01D8,  $0047,  $0085   ; FACE   0081 01D8 0047 0085
        DECLE   $0047,  $0047,  $0047,  $0047   ; FAD2   0047 0047 0047 0047
        DECLE   $0000,  $0047,  $0041,  $008A   ; FAD6   0000 0047 0041 008A
        DECLE   $0041,  $0041,  $0090,  $007B   ; FADA   0041 0041 0090 007B
        DECLE   $00B3,  $0081,  $0004,  $0004   ; FADE   00B3 0081 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; FAE2   0004 0004 0004 0004
        DECLE   $0000,  $0004,  $0001,  $00D1   ; FAE6   0000 0004 0001 00D1
        DECLE   $0001,  $0001,  $009C,  $00C9   ; FAEA   0001 0001 009C 00C9
        DECLE   $0004,  $0004,  $0004,  $0004   ; FAEE   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; FAF2   0004 0004 0004 0004
        DECLE   $0000,  $0004,  $0001,  $0001   ; FAF6   0000 0004 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FAFA   0001 0001 0001 0001
        DECLE   $0096,  $00C9,  $0004,  $0004   ; FAFE   0096 00C9 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; FB02   0004 0004 0004 0004
        DECLE   $0000,  $0004,  $0001,  $0001   ; FB06   0000 0004 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FB0A   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0004,  $009C   ; FB0E   0001 0001 0004 009C
        DECLE   $0004,  $0004,  $0004,  $0004   ; FB12   0004 0004 0004 0004
        DECLE   $0000,  $0004,  $0070,  $0000   ; FB16   0000 0004 0070 0000
        DECLE   $0070,  $0070,  $0070,  $0070   ; FB1A   0070 0070 0070 0070
        DECLE   $0070,  $0070,  $0070,  $0070   ; FB1E   0070 0070 0070 0070
        DECLE   $0070,  $0070,  $0070,  $0070   ; FB22   0070 0070 0070 0070
        DECLE   $0000,  $0070,  $0003,  $006E   ; FB26   0000 0070 0003 006E
        DECLE   $0003,  $0003,  $0003,  $0003   ; FB2A   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; FB2E   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; FB32   0003 0003 0003 0003
        DECLE   $0000,  $0003,  $0003,  $006E   ; FB36   0000 0003 0003 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; FB3A   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; FB3E   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; FB42   0004 0004 0004 0004
        DECLE   $0000,  $0003,  $01DD,  $01DC   ; FB46   0000 0003 01DD 01DC
        DECLE   $01DD,  $01DD,  $01DD,  $01DD   ; FB4A   01DD 01DD 01DD 01DD
        DECLE   $01DD,  $01DD,  $01DD,  $01DD   ; FB4E   01DD 01DD 01DD 01DD
        DECLE   $01DD,  $01DD,  $01DD,  $01DD   ; FB52   01DD 01DD 01DD 01DD
        DECLE   $01DC,  $01DD,  $0003,  $006E   ; FB56   01DC 01DD 0003 006E
        DECLE   $0047,  $0047,  $013F,  $001E   ; FB5A   0047 0047 013F 001E
        DECLE   $014F,  $014A,  $0047,  $0047   ; FB5E   014F 014A 0047 0047
        DECLE   $0047,  $0047,  $0047,  $0047   ; FB62   0047 0047 0047 0047
        DECLE   $0000,  $0003,  $0003,  $006E   ; FB66   0000 0003 0003 006E
        DECLE   $0004,  $0004,  $016D,  $010C   ; FB6A   0004 0004 016D 010C
        DECLE   $0154,  $0102,  $001E,  $0004   ; FB6E   0154 0102 001E 0004
        DECLE   $014B,  $013B,  $0004,  $0004   ; FB72   014B 013B 0004 0004
        DECLE   $0000,  $0003,  $0003,  $006E   ; FB76   0000 0003 0003 006E
        DECLE   $0004                           ; FB7A   0004

        JSRE    R5,     L_6D0C                  ; FB7B   0004 016D 010C

        CMPR    R2,     R4                      ; FB7E   0154
        SUBR    R0,     R2                      ; FB7F   0102
        SUBR    R1,     R4                      ; FB80   010C

        JSRD    R5,     L_5563                  ; FB81   0004 0156 0163
        DECLE   $0004,  $0004,  $0000,  $0003   ; FB84   0004 0004 0000 0003
        DECLE   $0003,  $006E,  $0004,  $0004   ; FB88   0003 006E 0004 0004
        DECLE   $0167,  $010C,  $015A,  $0161   ; FB8C   0167 010C 015A 0161
        DECLE   $000C,  $0004,  $0025,  $0136   ; FB90   000C 0004 0025 0136
        DECLE   $0004,  $0004,  $0000,  $0003   ; FB94   0004 0004 0000 0003
        DECLE   $0003,  $006E,  $0004,  $0004   ; FB98   0003 006E 0004 0004
        DECLE   $0136,  $000C,  $0025,  $0136   ; FB9C   0136 000C 0025 0136
        DECLE   $007A,  $0004,  $007A,  $007A   ; FBA0   007A 0004 007A 007A
        DECLE   $0004,  $0004,  $0000,  $0003   ; FBA4   0004 0004 0000 0003
        DECLE   $0003,  $006E,  $0004,  $0004   ; FBA8   0003 006E 0004 0004
        DECLE   $007A,  $007A,  $007A,  $007A   ; FBAC   007A 007A 007A 007A
        DECLE   $0004,  $0004,  $0004,  $0004   ; FBB0   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0000,  $0003   ; FBB4   0004 0004 0000 0003
        DECLE   $01DD,  $01DC,  $01DD,  $01DD   ; FBB8   01DD 01DC 01DD 01DD
        DECLE   $01DD,  $01DD,  $01DD,  $01DD   ; FBBC   01DD 01DD 01DD 01DD
        DECLE   $01DD,  $01DD,  $01DD,  $01DD   ; FBC0   01DD 01DD 01DD 01DD
        DECLE   $01DD,  $01DD,  $01DC,  $01DD   ; FBC4   01DD 01DD 01DC 01DD
        DECLE   $0003,  $006E,  $001E,  $0047   ; FBC8   0003 006E 001E 0047
        DECLE   $014B,  $013B,  $001E,  $0047   ; FBCC   014B 013B 001E 0047
        DECLE   $0145,  $013B,  $0145,  $0145   ; FBD0   0145 013B 0145 0145
        DECLE   $0047,  $014B,  $0000           ; FBD4   0047 014B 0000

        DIS                                     ; FBD7   0003
        DIS                                     ; FBD8   0003
        SAR     R2,     2                       ; FBD9   006E
        SUBR    R1,     R4                      ; FBDA   010C

        JSR     R5,     L_5169                  ; FBDB   0004 0150 0169
        DECLE   $010C,  $0004,  $0105,  $0169   ; FBDE   010C 0004 0105 0169
        DECLE   $0105,  $0105,  $0004,  $0150   ; FBE2   0105 0105 0004 0150
        DECLE   $0000                           ; FBE6   0000

        DIS                                     ; FBE7   0003
        DIS                                     ; FBE8   0003
        SAR     R2,     2                       ; FBE9   006E
        SUBR    R1,     R4                      ; FBEA   010C

        JSRD    R5,     L_5563                  ; FBEB   0004 0156 0163

        SUBR    R1,     R4                      ; FBEE   010C

        JSR     R5,     L_5D63                  ; FBEF   0004 015C 0163

        CMPR    R3,     R4                      ; FBF2   015C
        CMPR    R3,     R4                      ; FBF3   015C

        JSRD    R5,     L_5400                  ; FBF4   0004 0156 0000
        DECLE   $0003,  $0003,  $006E,  $000C   ; FBF7   0003 0003 006E 000C
        DECLE   $0003,  $0025,  $0136,  $000C   ; FBFB   0003 0025 0136 000C
        DECLE   $0003,  $0136,  $0136,  $0136   ; FBFF   0003 0136 0136 0136
        DECLE   $0136,  $0003,  $0025,  $0000   ; FC03   0136 0003 0025 0000
        DECLE   $0003,  $0073,  $0000,  $0073   ; FC07   0003 0073 0000 0073
        DECLE   $0073,  $0073,  $0073,  $0073   ; FC0B   0073 0073 0073 0073
        DECLE   $0073,  $0073,  $0073,  $0073   ; FC0F   0073 0073 0073 0073
        DECLE   $0073,  $0073,  $0073,  $0000   ; FC13   0073 0073 0073 0000
        DECLE   $0073,  $0004,  $006E,  $0004   ; FC17   0073 0004 006E 0004
        DECLE   $0004,  $0004,  $0004,  $0001   ; FC1B   0004 0004 0004 0001
        DECLE   $0004,  $0001,  $0001,  $0001   ; FC1F   0004 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FC23   0001 0001 0001 0001
        DECLE   $0001,  $0004,  $006E,  $0004   ; FC27   0001 0004 006E 0004
        DECLE   $0004,  $0004,  $0004,  $0001   ; FC2B   0004 0004 0004 0001
        DECLE   $00AA,  $0001,  $0001,  $0001   ; FC2F   00AA 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FC33   0001 0001 0001 0001
        DECLE   $0001,  $0004,  $006E,  $0004   ; FC37   0001 0004 006E 0004

        JSRE    R4,     L_D004                  ; FC3B   0004 00D1 0004
        DECLE   $0001,  $0001,  $0001,  $0001   ; FC3E   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FC42   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0004,  $006E   ; FC46   0001 0001 0004 006E
        DECLE   $0004,  $0004,  $00A3,  $0004   ; FC4A   0004 0004 00A3 0004
        DECLE   $0001,  $0001,  $0001,  $0001   ; FC4E   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FC52   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0004,  $006E   ; FC56   0001 0001 0004 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; FC5A   0004 0004 0004 0004
        DECLE   $00C0,  $008E,  $0001,  $0001   ; FC5E   00C0 008E 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FC62   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0004,  $006E   ; FC66   0001 0001 0004 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; FC6A   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0001,  $008E   ; FC6E   0004 0004 0001 008E
        DECLE   $0001,  $0001,  $0001,  $0001   ; FC72   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0004,  $006E   ; FC76   0001 0001 0004 006E
        DECLE   $0004,  $0004                   ; FC7A   0004 0004

        XORR    R3,     R1                      ; FC7C   01D9
        ADDR    R3,     R7                      ; FC7D   00DF

        DECLE   $01D8,  $01D9,  $01D8,  $01D8   ; FC7E   01D8 01D9 01D8 01D8
        DECLE   $00DE,  $00E2,  $00DE,  $00E2   ; FC82   00DE 00E2 00DE 00E2
        DECLE   $01D8,  $01D8,  $0074,  $0000   ; FC86   01D8 01D8 0074 0000
        DECLE   $0074,  $0074,  $0043,  $0043   ; FC8A   0074 0074 0043 0043
        DECLE   $0043,  $0043,  $0043,  $0043   ; FC8E   0043 0043 0043 0043
        DECLE   $0043,  $0043,  $0043,  $0043   ; FC92   0043 0043 0043 0043
        DECLE   $0043,  $0043,  $0070,  $0000   ; FC96   0043 0043 0070 0000
        DECLE   $0070,  $0070,  $01DA,  $00E0   ; FC9A   0070 0070 01DA 00E0
        DECLE   $01DA,  $01DA,  $01DA,  $01DA   ; FC9E   01DA 01DA 01DA 01DA
        DECLE   $00E0,  $00E4,  $00E0,  $00E4   ; FCA2   00E0 00E4 00E0 00E4
        DECLE   $01DA,  $01DA,  $0047,  $006E   ; FCA6   01DA 01DA 0047 006E
        DECLE   $00A5,  $0047,  $0078,  $0078   ; FCAA   00A5 0047 0078 0078
        DECLE   $0075,  $0075,  $0075,  $0075   ; FCAE   0075 0075 0075 0075
        DECLE   $0005,  $0075,  $0075,  $0005   ; FCB2   0005 0075 0075 0005
        DECLE   $0075,  $0075,  $0004,  $006E   ; FCB6   0075 0075 0004 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; FCBA   0004 0004 0004 0004
        DECLE   $00C0,  $008E,  $0040,  $0040   ; FCBE   00C0 008E 0040 0040
        DECLE   $0001,  $0001,  $0001,  $0001   ; FCC2   0001 0001 0001 0001
        DECLE   $0040,  $0040,  $0004,  $006E   ; FCC6   0040 0040 0004 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; FCCA   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $008E,  $0004   ; FCCE   0004 0004 008E 0004
        DECLE   $0001,  $00C0,  $0001,  $0001   ; FCD2   0001 00C0 0001 0001
        DECLE   $0001,  $0001,  $0004,  $006E   ; FCD6   0001 0001 0004 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; FCDA   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; FCDE   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0001,  $008E   ; FCE2   0004 0004 0001 008E
        DECLE   $0001,  $0001,  $0004,  $006E   ; FCE6   0001 0001 0004 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; FCEA   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; FCEE   0004 0004 0004 0004
        DECLE   $00AA,  $0004,  $0001,  $00D1   ; FCF2   00AA 0004 0001 00D1
        DECLE   $0001,  $0001,  $0004,  $006E   ; FCF6   0001 0001 0004 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; FCFA   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0087,  $0004   ; FCFE   0004 0004 0087 0004
        DECLE   $0001,  $00D1,  $0001,  $0001   ; FD02   0001 00D1 0001 0001
        DECLE   $0001,  $0001,  $0004,  $006E   ; FD06   0001 0001 0004 006E
        DECLE   $0004,  $0004,  $0004,  $0004   ; FD0A   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0001,  $00AA   ; FD0E   0004 0004 0001 00AA
        DECLE   $0001,  $0001,  $0001,  $0001   ; FD12   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FD16   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FD1A   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0004,  $0001   ; FD1E   0001 0001 0004 0001
        DECLE   $0004,  $0004,  $0004,  $0004   ; FD22   0004 0004 0004 0004
        DECLE   $0000,  $0004,  $0001,  $0001   ; FD26   0000 0004 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FD2A   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $009C,  $0001   ; FD2E   0001 0001 009C 0001
        DECLE   $0004,  $0004,  $0004,  $0004   ; FD32   0004 0004 0004 0004
        DECLE   $0000,  $0004,  $0001,  $0001   ; FD36   0000 0004 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FD3A   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FD3E   0001 0001 0001 0001
        DECLE   $0004,  $00C9,  $0004,  $0004   ; FD42   0004 00C9 0004 0004
        DECLE   $0000,  $0004,  $0001,  $0001   ; FD46   0000 0004 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FD4A   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FD4E   0001 0001 0001 0001
        DECLE   $0004,  $00B1,  $0004,  $0004   ; FD52   0004 00B1 0004 0004
        DECLE   $0000,  $0004,  $0001,  $0001   ; FD56   0000 0004 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FD5A   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $007F,  $00B9   ; FD5E   0001 0001 007F 00B9
        DECLE   $0004,  $0004,  $0004,  $0004   ; FD62   0004 0004 0004 0004
        DECLE   $0000,  $0004,  $0001,  $0001   ; FD66   0000 0004 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FD6A   0001 0001 0001 0001
        DECLE   $007F,  $0001,  $0004,  $0004   ; FD6E   007F 0001 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; FD72   0004 0004 0004 0004
        DECLE   $0000,  $0004,  $01D8,  $01D8   ; FD76   0000 0004 01D8 01D8
        DECLE   $00DE,  $00E2,  $00DE,  $00E2   ; FD7A   00DE 00E2 00DE 00E2
        DECLE   $01D8,  $01D8,  $01D9,  $01D8   ; FD7E   01D8 01D8 01D9 01D8
        DECLE   $00E3,  $01D9,  $0004,  $0004   ; FD82   00E3 01D9 0004 0004
        DECLE   $0000,  $0004,  $0043,  $0043   ; FD86   0000 0004 0043 0043
        DECLE   $0043,  $0043,  $0043,  $0043   ; FD8A   0043 0043 0043 0043
        DECLE   $0043,  $0043,  $0043,  $0043   ; FD8E   0043 0043 0043 0043
        DECLE   $0043,  $0043,  $0074,  $0074   ; FD92   0043 0043 0074 0074
        DECLE   $0000,  $0074,  $01DA,  $01DA   ; FD96   0000 0074 01DA 01DA
        DECLE   $00E0,  $00E4,  $00E0,  $00E4   ; FD9A   00E0 00E4 00E0 00E4
        DECLE   $01DA,  $01DA,  $01DA,  $01DA   ; FD9E   01DA 01DA 01DA 01DA
        DECLE   $00E4,  $01DA,  $0070,  $0070   ; FDA2   00E4 01DA 0070 0070
        DECLE   $0000,  $0070,  $0075,  $0075   ; FDA6   0000 0070 0075 0075
        DECLE   $0005,  $0075,  $0075,  $0005   ; FDAA   0005 0075 0075 0005
        DECLE   $0075,  $0075,  $0075,  $0075   ; FDAE   0075 0075 0075 0075
        DECLE   $0078,  $0078,  $0047,  $00B3   ; FDB2   0078 0078 0047 00B3
        DECLE   $0000,  $0047,  $0040,  $0040   ; FDB6   0000 0047 0040 0040
        DECLE   $0001,  $0001,  $0001,  $0001   ; FDBA   0001 0001 0001 0001
        DECLE   $0040,  $0040,  $007F,  $00B9   ; FDBE   0040 0040 007F 00B9
        DECLE   $0004,  $0004,  $0004,  $0004   ; FDC2   0004 0004 0004 0004
        DECLE   $0000,  $0004,  $0001,  $0001   ; FDC6   0000 0004 0001 0001
        DECLE   $0001,  $0001,  $00B9,  $0001   ; FDCA   0001 0001 00B9 0001
        DECLE   $0004,  $007F,  $0004,  $0004   ; FDCE   0004 007F 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; FDD2   0004 0004 0004 0004
        DECLE   $0000,  $0004,  $0001,  $0001   ; FDD6   0000 0004 0001 0001
        DECLE   $007F,  $0001,  $0004,  $0004   ; FDDA   007F 0001 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; FDDE   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; FDE2   0004 0004 0004 0004
        DECLE   $0000,  $0004,  $0001,  $0001   ; FDE6   0000 0004 0001 0001
        DECLE   $00C9,  $0001,  $0004,  $009C   ; FDEA   00C9 0001 0004 009C
        DECLE   $0004,  $0004,  $0004,  $0004   ; FDEE   0004 0004 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; FDF2   0004 0004 0004 0004
        DECLE   $0000,  $0004,  $0001,  $0001   ; FDF6   0000 0004 0001 0001
        DECLE   $0001,  $0001,  $00C9,  $0001   ; FDFA   0001 0001 00C9 0001
        DECLE   $0004,  $0096,  $0004,  $0004   ; FDFE   0004 0096 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; FE02   0004 0004 0004 0004
        DECLE   $0000,  $0004,  $0001,  $0001   ; FE06   0000 0004 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FE0A   0001 0001 0001 0001
        DECLE   $009C,  $0001,  $0004,  $0004   ; FE0E   009C 0001 0004 0004
        DECLE   $0004,  $0004,  $0004,  $0004   ; FE12   0004 0004 0004 0004
        DECLE   $0000,  $0004,  $0001,  $0001   ; FE16   0000 0004 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FE1A   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FE1E   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FE22   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FE26   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FE2A   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FE2E   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FE32   0001 0001 0001 0001
        DECLE   $0001,  $0001                   ; FE36   0001 0001

        ADDR    R3,     R0                      ; FE38   00D8
        ADDR    R3,     R0                      ; FE39   00D8
        ADDR    R3,     R0                      ; FE3A   00D8
        ADDR    R3,     R0                      ; FE3B   00D8
        ADDR    R3,     R6                      ; FE3C   00DE
        ADDR    R4,     R2                      ; FE3D   00E2
        ADDR    R3,     R0                      ; FE3E   00D8
        ADDR    R3,     R0                      ; FE3F   00D8
        ADDR    R3,     R0                      ; FE40   00D8
        ADDR    R3,     R0                      ; FE41   00D8
        ADDR    R4,     R2                      ; FE42   00E2
        ADDR    R3,     R0                      ; FE43   00D8
        ADDR    R3,     R0                      ; FE44   00D8
        ADDR    R3,     R6                      ; FE45   00DE
        ADDR    R3,     R0                      ; FE46   00D8
        ADDR    R3,     R0                      ; FE47   00D8
        ADDR    R3,     R3                      ; FE48   00DB
        ADDR    R3,     R3                      ; FE49   00DB
        ADDR    R3,     R3                      ; FE4A   00DB
        ADDR    R3,     R3                      ; FE4B   00DB
        ADDR    R2,     R5                      ; FE4C   00D5
        ADDR    R2,     R7                      ; FE4D   00D7

        ADDR    R3,     R3                      ; FE4E   00DB
        ADDR    R3,     R3                      ; FE4F   00DB
        ADDR    R3,     R3                      ; FE50   00DB
        ADDR    R3,     R3                      ; FE51   00DB
        ADDR    R2,     R7                      ; FE52   00D7

        ADDR    R3,     R3                      ; FE53   00DB
        ADDR    R3,     R3                      ; FE54   00DB
        ADDR    R2,     R5                      ; FE55   00D5
        ADDR    R3,     R3                      ; FE56   00DB
        ADDR    R3,     R3                      ; FE57   00DB
        SWAP    R0,     2                       ; FE58   0044
        SWAP    R0,     2                       ; FE59   0044
        MOVR    R1,     R7                      ; FE5A   008F

        SWAP    R0,     2                       ; FE5B   0044
        ADDR    R3,     R0                      ; FE5C   00D8
        ADDR    R3,     R0                      ; FE5D   00D8
        SWAP    R0,     2                       ; FE5E   0044
        TSTR    R0                              ; FE5F   0080
        SWAP    R0,     2                       ; FE60   0044
        SWAP    R0,     2                       ; FE61   0044
        ADDR    R3,     R0                      ; FE62   00D8
        MOVR    R1,     R7                      ; FE63   008F

        DECLE   $0080,  $00D8,  $0044,  $0044   ; FE64   0080 00D8 0044 0044
        DECLE   $0041,  $0041,  $007B,  $0041   ; FE68   0041 0041 007B 0041
        DECLE   $0081,  $0090,  $0041,  $008A   ; FE6C   0081 0090 0041 008A
        DECLE   $0041,  $0041,  $0090,  $007B   ; FE70   0041 0041 0090 007B
        DECLE   $008A,  $0081,  $0041,  $0041   ; FE74   008A 0081 0041 0041
        DECLE   $0001,  $0001,  $00C9,  $0001   ; FE78   0001 0001 00C9 0001
        DECLE   $00AA,  $009C,  $0001,  $00D1   ; FE7C   00AA 009C 0001 00D1
        DECLE   $0001,  $0001,  $009C,  $00C9   ; FE80   0001 0001 009C 00C9
        DECLE   $00D1,  $00AA,  $0001,  $0001   ; FE84   00D1 00AA 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FE88   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FE8C   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FE90   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FE94   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FE98   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FE9C   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FEA0   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FEA4   0001 0001 0001 0001

        ADDR    R3,     R6                      ; FEA8   00DE
        ADDR    R4,     R2                      ; FEA9   00E2
        ADDR    R3,     R0                      ; FEAA   00D8
        ADDR    R3,     R0                      ; FEAB   00D8
        ADDR    R3,     R0                      ; FEAC   00D8
        ADDR    R3,     R0                      ; FEAD   00D8
        ADDR    R4,     R2                      ; FEAE   00E2
        ADDR    R3,     R0                      ; FEAF   00D8
        ADDR    R3,     R0                      ; FEB0   00D8
        ADDR    R3,     R6                      ; FEB1   00DE
        ADDR    R3,     R0                      ; FEB2   00D8
        ADDR    R3,     R0                      ; FEB3   00D8
        ADDR    R3,     R0                      ; FEB4   00D8
        ADDR    R3,     R0                      ; FEB5   00D8
        ADDR    R3,     R6                      ; FEB6   00DE
        ADDR    R4,     R2                      ; FEB7   00E2
        ADDR    R2,     R5                      ; FEB8   00D5
        ADDR    R2,     R7                      ; FEB9   00D7

        ADDR    R3,     R3                      ; FEBA   00DB
        ADDR    R3,     R3                      ; FEBB   00DB
        ADDR    R3,     R3                      ; FEBC   00DB
        ADDR    R3,     R3                      ; FEBD   00DB
        ADDR    R2,     R7                      ; FEBE   00D7

        ADDR    R3,     R3                      ; FEBF   00DB
        ADDR    R3,     R3                      ; FEC0   00DB
        ADDR    R2,     R5                      ; FEC1   00D5
        ADDR    R3,     R3                      ; FEC2   00DB
        ADDR    R3,     R3                      ; FEC3   00DB
        ADDR    R3,     R3                      ; FEC4   00DB
        ADDR    R3,     R3                      ; FEC5   00DB
        ADDR    R2,     R5                      ; FEC6   00D5
        ADDR    R2,     R7                      ; FEC7   00D7

        ADDR    R3,     R0                      ; FEC8   00D8
        ADDR    R3,     R0                      ; FEC9   00D8
        SWAP    R0,     2                       ; FECA   0044
        TSTR    R0                              ; FECB   0080
        SWAP    R0,     2                       ; FECC   0044
        SWAP    R0,     2                       ; FECD   0044
        ADDR    R3,     R0                      ; FECE   00D8
        MOVR    R1,     R7                      ; FECF   008F

        TSTR    R0                              ; FED0   0080
        ADDR    R3,     R0                      ; FED1   00D8
        SWAP    R0,     2                       ; FED2   0044
        SWAP    R0,     2                       ; FED3   0044
        MOVR    R1,     R7                      ; FED4   008F

        DECLE   $0044,  $00D8,  $00D8,  $0081   ; FED5   0044 00D8 00D8 0081
        DECLE   $0090,  $0041,  $008A,  $0041   ; FED9   0090 0041 008A 0041
        DECLE   $0041,  $0090,  $007B,  $008A   ; FEDD   0041 0090 007B 008A
        DECLE   $0081,  $0041,  $0041,  $007B   ; FEE1   0081 0041 0041 007B
        DECLE   $0041,  $0081,  $0090,  $00AA   ; FEE5   0041 0081 0090 00AA
        DECLE   $009C,  $0001,  $00D1,  $0001   ; FEE9   009C 0001 00D1 0001
        DECLE   $0001,  $009C,  $00C9,  $00D1   ; FEED   0001 009C 00C9 00D1
        DECLE   $00AA,  $0001,  $0001,  $00C9   ; FEF1   00AA 0001 0001 00C9
        DECLE   $0001,  $00AA,  $009C,  $0001   ; FEF5   0001 00AA 009C 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FEF9   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FEFD   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF01   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF05   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF09   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF0D   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF11   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF15   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF19   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF1D   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF21   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF25   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF29   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF2D   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF31   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF35   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF39   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF3D   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF41   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF45   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF49   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF4D   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF51   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF55   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF59   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF5D   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF61   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF65   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF69   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF6D   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF71   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $00D8   ; FF75   0001 0001 0001 00D8
        DECLE   $00D8,  $00E2,  $00D8,  $0001   ; FF79   00D8 00E2 00D8 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FF7D   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $00D8   ; FF81   0001 0001 0001 00D8
        DECLE   $00DE,  $00D8,  $00D8,  $0043   ; FF85   00DE 00D8 00D8 0043
        DECLE   $0043,  $0043,  $0043,  $0043   ; FF89   0043 0043 0043 0043
        DECLE   $0043,  $0043,  $0043,  $0043   ; FF8D   0043 0043 0043 0043
        DECLE   $0043,  $0043,  $0043,  $0043   ; FF91   0043 0043 0043 0043
        DECLE   $0043,  $0043,  $0043,  $00DA   ; FF95   0043 0043 0043 00DA
        DECLE   $00DA,  $00E4,  $00DA,  $0070   ; FF99   00DA 00E4 00DA 0070
        DECLE   $0070,  $0070,  $0070,  $0070   ; FF9D   0070 0070 0070 0070
        DECLE   $0070,  $0070,  $0070,  $00DA   ; FFA1   0070 0070 0070 00DA
        DECLE   $00E0,  $00DA,  $00DA,  $0075   ; FFA5   00E0 00DA 00DA 0075
        DECLE   $0075,  $0075,  $0075,  $0005   ; FFA9   0075 0075 0075 0005
        DECLE   $0005,  $0075,  $0075,  $0075   ; FFAD   0005 0075 0075 0075
        DECLE   $0075,  $0005,  $0005,  $0075   ; FFB1   0075 0005 0005 0075
        DECLE   $0075,  $0075,  $0075,  $0040   ; FFB5   0075 0075 0075 0040
        DECLE   $0040,  $0001,  $0040,  $0001   ; FFB9   0040 0001 0040 0001
        DECLE   $0001,  $0040,  $0001,  $0001   ; FFBD   0001 0040 0001 0001
        DECLE   $0040,  $0001,  $0001,  $0040   ; FFC1   0040 0001 0001 0040
        DECLE   $0001                           ; FFC5   0001

        SWAP    R0,     1                       ; FFC6   0040
        SWAP    R0,     1                       ; FFC7   0040
        DECLE   $0001,  $0001,  $0001,  $0001   ; FFC8   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FFCC   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FFD0   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FFD4   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FFD8   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FFDC   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FFE0   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FFE4   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FFE8   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FFEC   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FFF0   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FFF4   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FFF8   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FFFC   0001 0001 0001 0001
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5011       <entry>
;;  $5023       $5072  
;;  $5031       $505F   $5076  
;;  $5063       $505A  
;;  $5074       $5065  
;;  $5078       $5061  
;;  $5091       $5094   $50A2  
;;  $50A4       $50A8   $50D1   $57DC   $5E58   $6332  
;;  $50D3       $50AA  
;;  $50E4       $50E8   $511A   $632B  
;;  $511C       $5105  
;;  $5128       $513B  
;;  $5129       $50AD   $50EA  
;;  $5144       $512E   $5135  
;;  $5153       $5051   $509C   $50CB   $5114   $569E  
;;  $5169       $5165   $FBDB  
;;  $5177       $5173  
;;  $5179       $516E  
;;  $5196       $5096   $50BC   $50F9   $5698  
;;  $51AD       $519A   $519E  
;;  $51C9       $51CF  
;;  $51EA       $5179  
;;  $51F7       $51EE   $51FC   $5203  
;;  $51F8       $51F3  
;;  $5214       $520C   $5211  
;;  $5218       $5023   $51B7   $51E4   $6D9A  
;;  $5220       $507E   $51D1   $5BA9  
;;  $5226       $522B  
;;  $5228       $522E  
;;  $5230       $5235  
;;  $5232       $5238  
;;  $523A       $51A4   $51AB  
;;  $523B       $5067   $5078  
;;  $5248       $50ED  
;;  $5259       $5250  
;;  $525E       $5254   $5257   $525B  
;;  $526F       $5266  
;;  $5274       $526A   $526D   $5271  
;;  $5279       $5293  
;;  $52B1       $52AD  
;;  $52D2       $52CB  
;;  $52DA       $52D0  
;;  $52E3       $52E0  
;;  $52E8       $52DB  
;;  $52EF       $52EB  
;;  $52F2       $52AF   $52D8   $52E6  
;;  $52FE       $52FB  
;;  $5301       $52F9  
;;  $530B       $5308  
;;  $530E       $5306   $5447   $5467  
;;  $530F       $52D2  
;;  $531C       $5342  
;;  $531E       $533E  
;;  $5345       $5315  
;;  $534A       $5372  
;;  $534C       $536C  
;;  $5375       $5313  
;;  $5376       $52D5  
;;  $5380       $52E3  
;;  $5381       $537F  
;;  $5385       $53DF  
;;  $538C       $5388  
;;  $538E       $53AE  
;;  $53BA       $53B6   $53DA  
;;  $53E4       $537C  
;;  $53E7       $52EF  
;;  $53E8       $53E6  
;;  $53EA       $53FE  
;;  $5400       $FBF4  
;;  $5402       $537A  
;;  $5403       $52B1  
;;  $5406       $5428  
;;  $540F       $540B  
;;  $542B       $52FE   $530B  
;;  $5457       $5452  
;;  $546B       $6001  
;;  $546C       $546A  
;;  $5470       $5450   $5455   $5458  
;;  $5474       $5490  
;;  $5488       $547F  
;;  $548C       $5472  
;;  $548F       $548A  
;;  $54AC       $54A9  
;;  $54AF       $549B  
;;  $54C5       $548C  
;;  $54F0       $54EB  
;;  $54FE       $5474  
;;  $5509       $5506  
;;  $5518       $5521  
;;  $5563       $555F   $FB81   $FBEB  
;;  $556F       $5595  
;;  $5593       $559B  
;;  $5599       $5571  
;;  $559D       $5597  
;;  $55A9       $55A1  
;;  $55AB       $551B   $55A9  
;;  $55BB       $51AE   $51D4   $52B4   $5798   $584B   $5F4F   $5F8E   $5FB5  
;;  $55BB       $5FD1   $603F   $6BBB   $6BD6  
;;  $55CB       $55CB  
;;  $55D3       $55E7   $55EA   $55F6  
;;  $55D4       $55E2  
;;  $55DE       $55B1  
;;  $560D       $5629  
;;  $5614       $55FA  
;;  $5631       $562E  
;;  $5636       $5633  
;;  $5638       $560B  
;;  $563A       $5518   $5558  
;;  $5645       $563D  
;;  $5647       $5643  
;;  $5656       $5654  
;;  $567E       $5682   $56A7  
;;  $5691       $568F  
;;  $5692       $5690  
;;  $5698       $56B0   $56BA   $56C1   $56C6   $56CB   $56D0   $56D5   $56DA  
;;  $5698       $56E6   $56EE   $56F6   $5701   $57E3   $5804   $5826   $5849  
;;  $5698       $587D   $5891   $58AC   $58C5   $58DC   $58F3   $5902   $5911  
;;  $5698       $5931   $5966   $5991   $59EE   $5A06   $5A17   $5A54  
;;  $56B2       $56AC   $56DF  
;;  $5705       $56BC   $5703  
;;  $5707       $634D  
;;  $57DF       $572C   $5739   $574A   $575B   $576F   $577F   $57BD   $57D1  
;;  $57E5       $5150   $63D9  
;;  $5828       $63A9  
;;  $594D       $5949  
;;  $59F0       $591A  
;;  $5A56       $5719   $584E  
;;  $5A77       $574F   $58B9  
;;  $5A94       $5A9B  
;;  $5A9F       $5AA8  
;;  $5AAA       $5A90   $5AE3  
;;  $5AAB       $5760   $58A1  
;;  $5ACA       $5774   $586C  
;;  $5AFD       $57AD   $5872  
;;  $5B0A       $57C2   $57EC   $582B  
;;  $5B6D       $5B6A  
;;  $5B74       $5B7B  
;;  $5B7F       $5B85  
;;  $5B89       $5B90  
;;  $5B93       $56A4  
;;  $5BA8       $5B96  
;;  $5BA9       $5B9E   $5BA2   $5BA6  
;;  $5BAF       $56B6   $56FD  
;;  $5BC6       $5BC0  
;;  $5BC8       $5BC4  
;;  $5BE1       $5BBC  
;;  $5BE5       $5BB4   $5BEB   $5C2E   $5C90   $5CD3   $5CE6   $5CF9  
;;  $5BE6       $56BE   $56F3  
;;  $5C25       $5C0B   $5C12   $5C19   $5C23   $5C5A   $5C61   $5C6E  
;;  $5C29       $56C3   $56EB  
;;  $5C4A       $5C3B  
;;  $5C8A       $56C8   $56E3   $56E8   $56F0   $56F8  
;;  $5C9D       $5C98  
;;  $5CAE       $5CA3  
;;  $5CB1       $5CAC  
;;  $5CB8       $5C92  
;;  $5CCE       $56CD  
;;  $5CE1       $56D2  
;;  $5CF4       $56D7  
;;  $5D13       $5D0E  
;;  $5D2A       $5D1D   $5D25  
;;  $5D3C       $5D36  
;;  $5D3F       $5D3A   $5D4A  
;;  $5D52       $5D4F  
;;  $5D60       $5D5A   $5D91   $5EEF  
;;  $5D63       $FBEF  
;;  $5D66       $5D56  
;;  $5D9B       $5D96  
;;  $5DB0       $5DAA  
;;  $5DCA       $5DBD   $5F17  
;;  $5DD7       $5DDD  
;;  $5DEA       $5DE7  
;;  $5E09       $5E04  
;;  $5E0A       $5DD3   $5E10   $5E4F   $5E61  
;;  $5E23       $5E1E  
;;  $5E37       $5DC3   $5DFA   $5E31   $5E45  
;;  $5E39       $5E35  
;;  $5E3C       $5E2B  
;;  $5E5B       $5CAA   $5CAF  
;;  $5F0C       $5C53  
;;  $5F1A       $5D08   $5D1F  
;;  $5F37       $5C08   $5DB5   $5DEA   $5E23   $5E67   $5E6B  
;;  $5F40       $5C16   $5C20   $5C5E   $5C65   $5C6B   $5DB0   $5DB9   $5DEE  
;;  $5F40       $5E27   $5E6F  
;;  $5F45       $5AF3   $5B7F   $5C0F   $5C57   $5DD7   $656A   $656F   $6573  
;;  $5F45       $6578   $657C   $666C   $6670   $689C   $68A0   $68A5   $68A9  
;;  $5F4B       $5020  
;;  $5F8D       $5081   $514C   $63A5   $63D5  
;;  $5FD0       $57D6   $5E51   $632E  
;;  $603E       $6327  
;;  $6094       $5FC2   $607B  
;;  $60A2       $5084  
;;  $60E1       $572E  
;;  $6159       $6157  
;;  $6162       $6160  
;;  $6174       $6174  
;;  $618A       $5099   $50B0   $50F0  
;;  $61B0       $61AA  
;;  $61C5       $61D7  
;;  $61CB       $61C7  
;;  $61D4       $61D1  
;;  $61E1       $6194   $61DF   $62C8   $62D9   $62E1   $62E4   $630B  
;;  $620F       $6205  
;;  $6215       $61FF   $6209  
;;  $6226       $6223  
;;  $6248       $6218  
;;  $6254       $6251  
;;  $6274       $6246  
;;  $629C       $628C  
;;  $62B8       $62A7  
;;  $62BE       $620D   $6213  
;;  $62C4       $619E   $61E4   $61EA   $61EF   $61F5   $61FB   $621F   $624D  
;;  $62C5       $6199  
;;  $62DB       $62CF  
;;  $62EA       $62FE  
;;  $62EE       $62F9  
;;  $62FB       $62F0  
;;  $6309       $630F  
;;  $6314       $62D3   $62D7  
;;  $632E       $6325  
;;  $6335       $62DD  
;;  $6350       $631D  
;;  $6367       $6363  
;;  $6370       $6365  
;;  $637B       $6371  
;;  $6381       $6379  
;;  $63A1       $639A  
;;  $63AC       $6357   $635B   $635F   $6369   $636D  
;;  $63AD       $6319  
;;  $63C3       $63BB  
;;  $63C7       $63B5   $63BF  
;;  $63CC       $63B1   $63C1   $63C5  
;;  $63CD       $639F  
;;  $63DC       $646B   $6470   $6477   $647C   $64AC   $64B2   $64B9   $64BF  
;;  $63DC       $64C5   $64E8   $64ED   $64F2   $6519   $65EE   $65F3   $65F8  
;;  $63DC       $6CBD   $6CC2  
;;  $63DE       $63F7  
;;  $63EA       $63E4  
;;  $63F1       $63EB  
;;  $63FB       $5721   $573F   $57BF   $57E5   $580B   $5828   $58CA   $5968  
;;  $63FB       $5993   $5A0B   $5FC5  
;;  $6402       $6408  
;;  $6406       $640F  
;;  $640C       $6404  
;;  $6411       $640A  
;;  $643B       $6434  
;;  $643C       $643A  
;;  $643E       $6445  
;;  $6448       $6427   $642E  
;;  $6449       $644D  
;;  $6451       $580E   $5889   $6098  
;;  $6496       $57A0   $5814   $5C7C   $609B  
;;  $64A2       $649A  
;;  $64A4       $64A0  
;;  $64D2       $57A3   $5811   $5C79   $609E  
;;  $64DE       $64D6  
;;  $64E0       $64DC  
;;  $64FC       $607E  
;;  $6519       $6520  
;;  $656D       $6566  
;;  $6576       $6562  
;;  $657F       $655E  
;;  $6586       $6583  
;;  $65D1       $5781   $586F  
;;  $65E3       $5771   $5869  
;;  $6602       $575D   $589E  
;;  $6650       $58B2  
;;  $6655       $6668  
;;  $6657       $6664  
;;  $666A       $6661  
;;  $6674       $574C   $5875  
;;  $66D6       $5102   $56A1  
;;  $66E3       $66DB  
;;  $670A       $6704  
;;  $670E       $6700  
;;  $6710       $6708   $670C  
;;  $671C       $6716  
;;  $6720       $6712  
;;  $6722       $671A   $671E  
;;  $672E       $6728  
;;  $6732       $6724  
;;  $6736       $66F8  
;;  $6742       $673E  
;;  $674A       $6746  
;;  $6754       $672C   $6730   $6734   $674E   $6752  
;;  $6791       $66EA  
;;  $67AF       $67AB  
;;  $67BF       $67BB  
;;  $67CF       $67CB  
;;  $67D4       $67A0  
;;  $67E1       $67DC  
;;  $67EC       $67E5  
;;  $67F9       $67AF   $67BF   $67CF   $67DE   $67E9   $67F4  
;;  $67FC       $6805  
;;  $6808       $50FF  
;;  $6819       $680E  
;;  $6822       $6814   $681D  
;;  $6824       $6817   $6820  
;;  $683A       $6836  
;;  $6859       $6888  
;;  $6885       $685F   $6862   $6872  
;;  $6886       $6884  
;;  $689A       $6893  
;;  $68A3       $6897  
;;  $68AC       $66E1   $66E6   $6795   $67D2   $67F0   $67F7   $6828   $682A  
;;  $68AD       $55A6   $579B   $5FB1  
;;  $6920       $55A3  
;;  $6933       $692F  
;;  $693A       $6936  
;;  $6941       $693D  
;;  $6948       $6944  
;;  $694F       $694B  
;;  $6956       $6952  
;;  $695D       $6959  
;;  $6964       $6960  
;;  $696B       $6967  
;;  $6972       $696E  
;;  $6979       $6975  
;;  $6980       $697C  
;;  $6987       $6983  
;;  $698E       $698A  
;;  $6995       $6991  
;;  $699C       $6998  
;;  $69A5       $69A1  
;;  $69AC       $69A8  
;;  $69B3       $69AF  
;;  $69BA       $69B6  
;;  $69C1       $69BD  
;;  $69C8       $69C4  
;;  $69CF       $69CB  
;;  $69D6       $69D2  
;;  $69DD       $69D9  
;;  $69E4       $69E0  
;;  $69EB       $69E7  
;;  $69F2       $69EE  
;;  $69F9       $69F5  
;;  $6A00       $69FC  
;;  $6A07       $6A03  
;;  $6A0E       $6A0A  
;;  $6A0F       $5108   $5795   $57EF   $582E   $5FAE   $6055  
;;  $6A14       $6A5B  
;;  $6A17       $6A1C  
;;  $6A1E       $6A19  
;;  $6A21       $6A26  
;;  $6A28       $6A23  
;;  $6A2B       $6A30  
;;  $6A32       $6A2D  
;;  $6A44       $6A57  
;;  $6A5E       $50FC  
;;  $6A87       $58DF   $58F6  
;;  $6A8F       $6A89  
;;  $6AB8       $6AB5  
;;  $6AB9       $6A8D  
;;  $6AC6       $58E3   $5905  
;;  $6ACE       $6AC8  
;;  $6ADB       $6ACC  
;;  $6AE7       $58E7   $5914  
;;  $6AEF       $6AE9  
;;  $6AFA       $6AED  
;;  $6B06       $6095   $6B96  
;;  $6B49       $6B0B   $6B9F  
;;  $6B4A       $6B46  
;;  $6B4C       $6B53  
;;  $6B55       $6B4E  
;;  $6B6E       $6B6A  
;;  $6B71       $6BB7  
;;  $6B85       $6B75   $6B7C   $6B83  
;;  $6B8D       $6B89  
;;  $6B9A       $50CE   $5117  
;;  $6BAA       $6BA8  
;;  $6BB2       $6BB4  
;;  $6BBA       $6BE7   $6CA6   $6D1E  
;;  $6BD5       $5028   $6BD3  
;;  $6BE6       $507B   $6BE4  
;;  $6BED       $6BFF   $6CC8   $6D24  
;;  $6BEE       $6BFC  
;;  $6BEF       $6BF8  
;;  $6BFA       $6BF2  
;;  $6C55       $6C53  
;;  $6CA5       $6DA0  
;;  $6D0C       $FB7B  
;;  $6D1D       $6DA6  
;;  $6D87       $501D  
;;  $6D9F       $6DAC  
;;  $6DAE       $6DA3   $6DA9  
;;  $6DB1       $6DB2   $6DB5  
;;  $6DB7       $6D8B   $6D91  
;;  $6DBB       $502E   $57D9   $5E55  
;;  $6DD8       <entry>
;;  $6DDE       $6DDB  
;;  $6DE6       $6DE3  
;;  $6DEF       $6DEB  
;;  $6DF3       $6DF5  
;;  $6E0C       $6E06  
;;  $6E1B       $6E15  
;;  $6E24       $626B  
;;  $6E3B       $623D  
;;  $6E44       $6E42  
;;  $6E4D       $5D8E  
;;  $6E73       $6E73  
;;  $6E9C       $6E9A  
;;  $6EA7       $5801  
;;  $6EAE       $6EAC  
;;  $6EBD       $570F   $58A4  
;;  $6EE0       $55B7  
;;  $6EED       $6EE3   $6EE9  
;;  $6EEE       $5C86  
;;  $6F26       $6F23  
;;  $6F44       $6F34  
;;  $6F45       $6F31  
;;  $6F50       $6F5B  
;;  $6F5F       $6F52  
;;  $6F60       $6F5E  
;;  $6F63       $591C   $6396  
;;  $6F69       $6F71  
;;  $6F6E       $6F6B  
;;  $D000       $5817   $58CD   $5A57   $5B0B   $5F5B   $5FBF   $5FEB   $6065  
;;  $D000       $6BCE  
;;  $D004       $FC3B  
;;  $D018       $5F4C   $5F91   $5FE1  
;;  $D025       $593C   $634A  
;;  $D040       $50B9  
;;  $D064       $D062  
;;  $D06B       $D069  
;;  $D0AE       $5A7A   $5A83   $5AAE   $5AB7   $5AC0   $5ACD   $5AD6   $5B00  
;;  $D0AE       $5B1E   $5B27   $5B30   $5B39   $5B42   $5B4B   $5B54   $5B5D  
;;  $D0AE       $5EC8   $5ED1   $5EDA   $6028   $622B   $6234   $6259   $6262  
;;  $D0AE       $6524   $652D   $6536   $653F   $6548   $6551  
;;  $D0BE       $52BB  
;;  $D0E4       $50B6   $50F6  
;;  $D155       $D153  
;;  $D16A       $50B3   $50F3  
;;  $D1D9       $D1D7  
;;  $D490       $D48E  
;;  $D6C0       $D6BE  
;;  $D946       $D944  
;;  $DD1B       $DD1B  
;;  $DDF0       $506A  
;;  $DE9F       $DE9F  
;;  $DFC9       $DFC7  
;;  $F32B       $F32B  
;;  $F433       $F433  
;;  $F58B       $F58B  
;;  $F591       $F591  
;;  $F62B       $F62B  
;;  $F631       $F631  
;;  $F78B       $F78B  
;;  $F792       $F792  
;;  $F7D1       $F7D1  
;;  $F82B       $F82B  
;;  $F832       $F832  
;;  $F871       $F871  
;; ======================================================================== ;;
