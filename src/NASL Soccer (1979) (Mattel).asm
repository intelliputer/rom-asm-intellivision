
        ORG     $5000
.HEADER:
        BIDECLE $5662           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $506A           ; 5004  Ptr: Start of game
        BIDECLE $5396           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5358           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5032           ; 500A  Ptr: Date/Title
        DECLE   $0000           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0004,  $0004   ; 500F  Color Stack init (0, 1)
        DECLE   $0004,  $0004   ; 5011  Color Stack init (2, 3)
        DECLE   $0004           ; 5013  Border color init

        DECLE   $0180,  $0190,  $01A0,  $01B0   ; 5014   0180 0190 01A0 01B0
        DECLE   $01C0,  $01D0,  $01E0,  $01F8   ; 5018   01C0 01D0 01E0 01F8
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 501C  Timer dispatch/interval
        DECLE   $0042,  $0050,  $0001,  $0000; 5020  Timer dispatch/interval
        DECLE   $00B8,  $005A,  $0002,  $0000; 5024  Timer dispatch/interval
        DECLE   $005F,  $0050,  $0005,  $0000; 5028  Timer dispatch/interval
        DECLE   $003A,  $0050,  $0014,  $0000; 502C  Timer dispatch/interval
        BIDECLE $0000           ; 5030  End of timer table

.TITLE:
        DECLE   $004F                           ; 5032  Cartridge year
        STRING  "SOCCER"                        ; 5033  Title string
        DECLE   $0000                           ; 5039  

L_503A:
        PSHR    R5                              ; 503A   0275

        JSR     R5,     L_5A6C                  ; 503B   0004 0158 026C
        JSR     R5,     L_5BB2                  ; 503E   0004 0158 03B2

        PULR    R7                              ; 5041   02B7

L_5042:
        PSHR    R5                              ; 5042   0275
        CLRR    R0                              ; 5043   01C0
        MVO     R0,     G_0180                  ; 5044   0240 0180

        JSR     R5,     L_55B6                  ; 5046   0004 0154 01B6
        JSR     R5,     L_577A                  ; 5049   0004 0154 037A
        JSR     R5,     L_57E1                  ; 504C   0004 0154 03E1
        JSR     R5,     L_5B48                  ; 504F   0004 0158 0348
        JSR     R5,     L_5BE2                  ; 5052   0004 0158 03E2
        JSR     R5,     L_5DD5                  ; 5055   0004 015C 01D5
        JSR     R5,     .EXEC.4F1               ; 5058   0004 0114 00F1
        JSR     R5,     L_5E1D                  ; 505B   0004 015C 021D

        PULR    R7                              ; 505E   02B7

L_505F:
        PSHR    R5                              ; 505F   0275

        JSR     R5,     L_522F                  ; 5060   0004 0150 022F
        JSR     R5,     L_5A1A                  ; 5063   0004 0158 021A
        JSR     R5,     L_5FDC                  ; 5066   0004 015C 03DC

        PULR    R7                              ; 5069   02B7

.START:
        PSHR    R5                              ; 506A   0275
        MVII    #$002D, R0                      ; 506B   02B8 002D
        MVO     R0,     G_0174                  ; 506D   0240 0174
        CLRR    R0                              ; 506F   01C0
        MVO     R0,     G_0175                  ; 5070   0240 0175
        MVO     R0,     G_0177                  ; 5072   0240 0177
        MVO     R0,     G_0178                  ; 5074   0240 0178
        MVO     R0,     G_0176                  ; 5076   0240 0176
        MVO     R0,     G_017A                  ; 5078   0240 017A
        MVO     R0,     G_0173                  ; 507A   0240 0173
        MVO     R0,     G_0172                  ; 507C   0240 0172
        MVO     R0,     G_017C                  ; 507E   0240 017C
        MVO     R0,     G_017F                  ; 5080   0240 017F
        MVII    #$000A, R0                      ; 5082   02B8 000A
        MVO     R0,     G_0168                  ; 5084   0240 0168
        MVO     R0,     G_0169                  ; 5086   0240 0169
        MVII    #$0015, R2                      ; 5088   02BA 0015
        MVO     R2,     G_0167                  ; 508A   0242 0167
        CLRR    R1                              ; 508C   01C9
L_508D:
        PSHR    R1                              ; 508D   0271
        PSHR    R2                              ; 508E   0272

        JSR     R5,     L_546C                  ; 508F   0004 0154 006C

        PULR    R2                              ; 5092   02B2
        PULR    R1                              ; 5093   02B1
        INCR    R1                              ; 5094   0009
        INCR    R2                              ; 5095   000A
        CMPI    #$0014, R1                      ; 5096   0379 0014
        BLT     L_508D                          ; 5098   0225 000C

        JSR     R5,     L_50A4                  ; 509A   0004 0150 00A4

        SDBD                                    ; 509D   0001
        MVII    #$5869, R0                      ; 509E   02B8 0069 0058
        MVO     R0,     G_035D                  ; 50A1   0240 035D
        PULR    R7                              ; 50A3   02B7

L_50A4:
        PSHR    R5                              ; 50A4   0275
        SDBD                                    ; 50A5   0001
        MVII    #$5333, R1                      ; 50A6   02B9 0033 0053
        MVII    #$0355, R2                      ; 50A9   02BA 0355

        JSR     R5,     X_INIT_MOB              ; 50AB   0004 0114 02B2

        SDBD                                    ; 50AE   0001
        MVII    #$52EE, R1                      ; 50AF   02B9 00EE 0052
        MVII    #$0006, R3                      ; 50B2   02BB 0006
        MVII    #$031D, R2                      ; 50B4   02BA 031D

        JSR     R5,     L_50CD                  ; 50B6   0004 0150 00CD

        MVII    #$0017, R3                      ; 50B9   02BB 0017

        JSR     R5,     L_50CD                  ; 50BB   0004 0150 00CD
        JSR     R5,     X_INIT_MOB              ; 50BE   0004 0114 02B2

        MVI     G_034D, R0                      ; 50C1   0280 034D
        SDBD                                    ; 50C3   0001
        XORI    #$1800, R0                      ; 50C4   03F8 0000 0018
        MVO     R0,     G_034D                  ; 50C7   0240 034D

        JSR     R5,     L_5D29                  ; 50C9   0004 015C 0129

        PULR    R7                              ; 50CC   02B7

L_50CD:
        PSHR    R5                              ; 50CD   0275
        MVII    #$0003, R4                      ; 50CE   02BC 0003

L_50D0:
        JSR     R5,     X_INIT_MOB              ; 50D0   0004 0114 02B2

        MVI@    R2,     R0                      ; 50D3   0290
        XORR    R3,     R0                      ; 50D4   01D8
        MVO@    R0,     R2                      ; 50D5   0250
        ADDI    #$0008, R2                      ; 50D6   02FA 0008
        DECR    R4                              ; 50D8   0014
        BNEQ    L_50D0                          ; 50D9   022C 000A
        PULR    R7                              ; 50DB   02B7

        PSHR    R5                              ; 50DC   0275
        MOVR    R0,     R2                      ; 50DD   0082
        ADDI    #$016A, R2                      ; 50DE   02FA 016A
        MVI@    R2,     R0                      ; 50E0   0290
        ANDI    #$00DF, R0                      ; 50E1   03B8 00DF
        MVO@    R0,     R2                      ; 50E3   0250
        CMPI    #$034D, R1                      ; 50E4   0379 034D
        BNEQ    L_50EC                          ; 50E6   020C 0004

        JSR     R5,     L_5E9C                  ; 50E8   0004 015C 029C

        PULR    R7                              ; 50EB   02B7

L_50EC:
        MVI     G_0179, R0                      ; 50EC   0280 0179
        SDBD                                    ; 50EE   0001
        ANDI    #$0021, R0                      ; 50EF   03B8 0021 0000
        BNEQ    L_515D                          ; 50F2   020C 0069

        MVI     G_0179, R0                      ; 50F4   0280 0179
        SDBD                                    ; 50F6   0001
        ANDI    #$0042, R0                      ; 50F7   03B8 0042 0000
        BEQ     L_515C                          ; 50FA   0204 0060

        CLRR    R0                              ; 50FC   01C0
        ADDI    #$0004, R1                      ; 50FD   02F9 0004
        MVO@    R0,     R1                      ; 50FF   0248
        MVI     G_017B, R0                      ; 5100   0280 017B
        DECR    R0                              ; 5102   0010
        MVO     R0,     G_017B                  ; 5103   0240 017B
        BNEQ    L_515C                          ; 5105   020C 0055

        MVI     G_0179, R0                      ; 5107   0280 0179
        CMPI    #$0040, R0                      ; 5109   0378 0040
        BEQ     L_5112                          ; 510B   0204 0005

        MVII    #$0001, R0                      ; 510D   02B8 0001
        MVO     R0,     G_017A                  ; 510F   0240 017A
        PULR    R7                              ; 5111   02B7

L_5112:
        MVII    #$003C, R0                      ; 5112   02B8 003C

        JSR     R5,     .EXEC.A62               ; 5114   0004 0118 0262

        MVI     G_0176, R0                      ; 5117   0280 0176
        TSTR    R0                              ; 5119   0080
        BEQ     L_512D                          ; 511A   0204 0011

        MVI     G_0177, R0                      ; 511C   0280 0177
        CMP     G_0178, R0                      ; 511E   0340 0178
        BEQ     L_5123                          ; 5120   0204 0001
L_5122:
        DECR    R7                              ; 5122   0017

L_5123:
        MVI     G_0176, R0                      ; 5123   0280 0176
        CMPI    #$0001, R0                      ; 5125   0378 0001
        BNEQ    L_512D                          ; 5127   020C 0004

        MVO     R0,     G_017A                  ; 5129   0240 017A
        PULR    R7                              ; 512B   02B7

L_512C:
        PSHR    R5                              ; 512C   0275

L_512D:
        JSR     R5,     L_52A2                  ; 512D   0004 0150 02A2

        CLRR    R0                              ; 5130   01C0
        MVO     R0,     G_017A                  ; 5131   0240 017A
        MVII    #$002D, R1                      ; 5133   02B9 002D
        CLRR    R2                              ; 5135   01D2
        MVI     G_0176, R3                      ; 5136   0283 0176
        INCR    R3                              ; 5138   000B
        CMPI    #$0002, R3                      ; 5139   037B 0002
        BLT     L_5141                          ; 513B   0205 0004

        MVII    #$0007, R1                      ; 513D   02B9 0007
        MVII    #$001E, R2                      ; 513F   02BA 001E
L_5141:
        MVO     R1,     G_0174                  ; 5141   0241 0174
        MVO     R2,     G_0175                  ; 5143   0242 0175
        MVO     R3,     G_0176                  ; 5145   0243 0176
        CLRR    R0                              ; 5147   01C0
        SARC    R3,     1                       ; 5148   007B
        BNC     L_514D                          ; 5149   0209 0002

        MVII    #$0003, R0                      ; 514B   02B8 0003
L_514D:
        MVO     R0,     G_0173                  ; 514D   0240 0173
        MVI     G_0172, R3                      ; 514F   0283 0172
        ADDI    #$016A, R3                      ; 5151   02FB 016A
        MVI@    R3,     R1                      ; 5153   0299
        ANDI    #$007F, R1                      ; 5154   03B9 007F
        MVO     R0,     G_0172                  ; 5156   0240 0172
        MVO@    R1,     R3                      ; 5158   0259

        JSR     R5,     L_5D29                  ; 5159   0004 015C 0129

L_515C:
        PULR    R7                              ; 515C   02B7

L_515D:
        MVI     G_017A, R0                      ; 515D   0280 017A
        CMPI    #$0001, R0                      ; 515F   0378 0001
        BGE     L_51A2                          ; 5161   020D 003F

        MVII    #$0001, R0                      ; 5163   02B8 0001
        MVO     R0,     G_017A                  ; 5165   0240 017A
        ADDI    #$0004, R1                      ; 5167   02F9 0004
        CLRR    R0                              ; 5169   01C0
        MVO@    R0,     R1                      ; 516A   0248
        SUBI    #$0003, R1                      ; 516B   0339 0003
        PSHR    R1                              ; 516D   0271
        MVI     G_0179, R0                      ; 516E   0280 0179
        CMPI    #$0020, R0                      ; 5170   0378 0020
        BEQ     L_5186                          ; 5172   0204 0012

        INCR    R1                              ; 5174   0009
        MVI@    R1,     R0                      ; 5175   0288
        ADDI    #$0300, R0                      ; 5176   02F8 0300
        MVO     R0,     G_0357                  ; 5178   0240 0357
        INCR    R1                              ; 517A   0009
        MVI@    R1,     R0                      ; 517B   0288
        SUBI    #$0200, R0                      ; 517C   0338 0200
        MVO     R0,     G_0358                  ; 517E   0240 0358
        SDBD                                    ; 5180   0001
        MVII    #$5325, R0                      ; 5181   02B8 0025 0053
        B       L_518A                          ; 5184   0200 0004

L_5186:
        SDBD                                    ; 5186   0001
        MVII    #$532C, R0                      ; 5187   02B8 002C 0053
L_518A:
        PULR    R1                              ; 518A   02B1
        MVO@    R0,     R1                      ; 518B   0248
        ADDI    #$0005, R1                      ; 518C   02F9 0005
        MVII    #$0005, R0                      ; 518E   02B8 0005
        MVO@    R0,     R1                      ; 5190   0248
        DECR    R1                              ; 5191   0011
        MVII    #$03F0, R0                      ; 5192   02B8 03F0
        MVO@    R0,     R1                      ; 5194   0248
        SUBI    #$0005, R1                      ; 5195   0339 0005

        JSR     R5,     .EXEC.766               ; 5197   0004 0114 0366

        MOVR    R0,     R1                      ; 519A   0081
        ADDI    #$016A, R1                      ; 519B   02F9 016A
        MVI@    R1,     R0                      ; 519D   0288
        XORI    #$0004, R0                      ; 519E   03F8 0004
        MVO@    R0,     R1                      ; 51A0   0248
        PULR    R7                              ; 51A1   02B7

L_51A2:
        MVII    #$0002, R0                      ; 51A2   02B8 0002
        MVO     R0,     G_017A                  ; 51A4   0240 017A
        MVII    #$0004, R0                      ; 51A6   02B8 0004
        MVO     R0,     G_0179                  ; 51A8   0240 0179

        JSR     R5,     .EXEC.766               ; 51AA   0004 0114 0366

        MVO     R0,     G_0172                  ; 51AD   0240 0172
        CLRR    R2                              ; 51AF   01D2
        COMR    R2                              ; 51B0   001A
        MVO     R2,     G_0173                  ; 51B1   0242 0173
        MOVR    R0,     R2                      ; 51B3   0082
        ADDI    #$016A, R2                      ; 51B4   02FA 016A
        MVI@    R2,     R0                      ; 51B6   0290
        XORI    #$0002, R0                      ; 51B7   03F8 0002
        MVO@    R0,     R2                      ; 51B9   0250
        PULR    R7                              ; 51BA   02B7

L_51BB:
        PSHR    R5                              ; 51BB   0275
        MVI     G_0358, R5                      ; 51BC   0285 0358
        SDBD                                    ; 51BE   0001
        CMPI    #$1400, R5                      ; 51BF   037D 0000 0014
        BC      L_51C8                          ; 51C2   0201 0004

        SDBD                                    ; 51C4   0001
        MVII    #$1400, R5                      ; 51C5   02BD 0000 0014
L_51C8:
        MVO     R5,     G_0358                  ; 51C8   0245 0358
        MVII    #$0002, R5                      ; 51CA   02BD 0002
        MVO     R5,     G_017A                  ; 51CC   0245 017A
        MOVR    R0,     R2                      ; 51CE   0082
        ADDI    #$016A, R2                      ; 51CF   02FA 016A
        MVI@    R2,     R0                      ; 51D1   0290
        XORI    #$0004, R0                      ; 51D2   03F8 0004
        MVO@    R0,     R2                      ; 51D4   0250
        ADDI    #$0004, R1                      ; 51D5   02F9 0004
        MVI     G_0179, R0                      ; 51D7   0280 0179
        CMPI    #$0020, R0                      ; 51D9   0378 0020
        BEQ     L_51EB                          ; 51DB   0204 000E

        MVII    #$0032, R0                      ; 51DD   02B8 0032
        MVI     G_0358, R3                      ; 51DF   0283 0358
        SDBD                                    ; 51E1   0001
        CMPI    #$3000, R3                      ; 51E2   037B 0000 0030
        BNC     L_51E8                          ; 51E5   0209 0001

        NEGR    R0                              ; 51E7   0020
L_51E8:
        ANDI    #$00FF, R0                      ; 51E8   03B8 00FF
        MVO@    R0,     R1                      ; 51EA   0248
L_51EB:
        MVII    #$0005, R0                      ; 51EB   02B8 0005
        ADDI    #$0002, R1                      ; 51ED   02F9 0002
        MVO@    R0,     R1                      ; 51EF   0248
        ADDI    #$0002, R1                      ; 51F0   02F9 0002

        JSR     R5,     L_51F6                  ; 51F2   0004 0150 01F6

        PULR    R7                              ; 51F5   02B7

L_51F6:
        PSHR    R5                              ; 51F6   0275
        MOVR    R1,     R4                      ; 51F7   008C
        MVII    #$0355, R1                      ; 51F8   02B9 0355

        JSR     R5,     .EXEC.777               ; 51FA   0004 0114 0377

        ADDI    #$0002, R4                      ; 51FD   02FC 0002
        PSHR    R4                              ; 51FF   0274
        PSHR    R3                              ; 5200   0273
        PSHR    R2                              ; 5201   0272

        JSR     R5,     .EXEC.784               ; 5202   0004 0114 0384

        MOVR    R2,     R0                      ; 5205   0090
        PULR    R2                              ; 5206   02B2
        PULR    R3                              ; 5207   02B3
        PULR    R4                              ; 5208   02B4
        PSHR    R0                              ; 5209   0270
        ADDI    #$0008, R4                      ; 520A   02FC 0008
        PSHR    R4                              ; 520C   0274

        JSR     R5,     .EXEC.784               ; 520D   0004 0114 0384

        PULR    R1                              ; 5210   02B1
        SUBI    #$0002, R1                      ; 5211   0339 0002
        PULR    R0                              ; 5213   02B0
        CMPR    R0,     R2                      ; 5214   0142
        BLT     L_5219                          ; 5215   0205 0002

        SUBI    #$0008, R1                      ; 5217   0339 0008

L_5219:
        JSR     R5,     .EXEC.777               ; 5219   0004 0114 0377

        ADDI    #$0006, R3                      ; 521C   02FB 0006
        MOVR    R3,     R0                      ; 521E   0098

        JSR     R5,     X_CLAMP                 ; 521F   0004 0114 0270

L_5222:
        DECR    R7                              ; 5222   0017

        RLC     R1,     2                       ; 5223   0055
        SWAP    R2,     1                       ; 5224   0042
        XORR    R0,     R2                      ; 5225   01C2
        MVII    #$002D, R3                      ; 5226   02BB 002D
        MVII    #$0007, R0                      ; 5228   02B8 0007

        JSR     R5,     .EXEC.9BB               ; 522A   0004 0118 01BB

        PULR    R7                              ; 522D   02B7
        MOVR    R5,     R7                      ; 522E   00AF

L_522F:
        PSHR    R5                              ; 522F   0275
        MVI     G_0179, R0                      ; 5230   0280 0179
        CMPI    #$0004, R0                      ; 5232   0378 0004
        BNEQ    L_5252                          ; 5234   020C 001C

        MVI     G_0175, R0                      ; 5236   0280 0175
        MVI     G_0174, R1                      ; 5238   0281 0174
        MVI     G_0176, R2                      ; 523A   0282 0176
        DECR    R0                              ; 523C   0010
        BNEQ    L_5246                          ; 523D   020C 0007

        TSTR    R1                              ; 523F   0089
        BNEQ    L_524C                          ; 5240   020C 000A

        JSR     R5,     L_52B0                  ; 5242   0004 0150 02B0

        PULR    R7                              ; 5245   02B7

L_5246:
        TSTR    R0                              ; 5246   0080
        BPL     L_524C                          ; 5247   0203 0003

        DECR    R1                              ; 5249   0011
        MVII    #$003B, R0                      ; 524A   02B8 003B
L_524C:
        MVO     R0,     G_0175                  ; 524C   0240 0175
        MVO     R1,     G_0174                  ; 524E   0241 0174
        MVO     R2,     G_0176                  ; 5250   0242 0176
L_5252:
        PULR    R7                              ; 5252   02B7

L_5253:
        PSHR    R5                              ; 5253   0275
        MVII    #$0202, R4                      ; 5254   02BC 0202
        MVI     G_0177, R0                      ; 5256   0280 0177
        MVII    #$0003, R1                      ; 5258   02B9 0003
        MVII    #$0006, R3                      ; 525A   02BB 0006

        JSR     R5,     X_PRNUM_RGT             ; 525C   0004 0118 00C5

        MVI     G_0174, R0                      ; 525F   0280 0174
        MVII    #$0002, R1                      ; 5261   02B9 0002
        MVII    #$0007, R3                      ; 5263   02BB 0007
        MVII    #$0208, R4                      ; 5265   02BC 0208

        JSR     R5,     X_PRNUM_ZRO             ; 5267   0004 0118 00AD

        MVII    #$020A, R4                      ; 526A   02BC 020A

        JSR     R5,     X_PRINT_R5              ; 526C   0004 0118 007B
        STRING  ":"                             ; 526F   003A
        DECLE   $0000                           ; 5270   0000

        MVII    #$0007, R3                      ; 5271   02BB 0007
        MVII    #$020B, R4                      ; 5273   02BC 020B
        MVI     G_0175, R0                      ; 5275   0280 0175
        MVII    #$0002, R1                      ; 5277   02B9 0002

        JSR     R5,     X_PRNUM_ZRO             ; 5279   0004 0118 00AD

        MVII    #$0001, R3                      ; 527C   02BB 0001
        MVII    #$0210, R4                      ; 527E   02BC 0210
        MVI     G_0178, R0                      ; 5280   0280 0178
        MVII    #$0003, R1                      ; 5282   02B9 0003

        JSR     R5,     X_PRNUM_LFT             ; 5284   0004 0118 009E

        SDBD                                    ; 5287   0001
        MVII    #$529F, R5                      ; 5288   02BD 009F 0052
        MVII    #$02E5, R4                      ; 528B   02BC 02E5
        MVI     G_0176, R3                      ; 528D   0283 0176
        CMPI    #$0003, R3                      ; 528F   037B 0003
        BLT     L_5295                          ; 5291   0205 0002

        MVII    #$0002, R3                      ; 5293   02BB 0002
L_5295:
        MVI@    R5,     R0                      ; 5295   02A8
        SDBD                                    ; 5296   0001
        XORI    #$0630, R0                      ; 5297   03F8 0030 0006
        MVO@    R0,     R4                      ; 529A   0260
        DECR    R3                              ; 529B   0013
        BPL     L_5295                          ; 529C   0223 0008
        PULR    R7                              ; 529E   02B7

        CLRC                                    ; 529F   0006
        CLRC                                    ; 52A0   0006
        EIS                                     ; 52A1   0002
L_52A2:
        PSHR    R5                              ; 52A2   0275
        MVII    #$0014, R0                      ; 52A3   02B8 0014
        MVII    #$0200, R4                      ; 52A5   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 52A7   0004 0114 0338

        MVII    #$02DC, R4                      ; 52AA   02BC 02DC

        JSR     R5,     X_FILL_ZERO             ; 52AC   0004 0114 0338

        PULR    R7                              ; 52AF   02B7

L_52B0:
        PSHR    R5                              ; 52B0   0275
        CLRR    R0                              ; 52B1   01C0
        MVO     R0,     G_0175                  ; 52B2   0240 0175

        JSR     R5,     L_5253                  ; 52B4   0004 0150 0253

        MVI     G_0355, R0                      ; 52B7   0280 0355
        SDBD                                    ; 52B9   0001
        XORI    #$1000, R0                      ; 52BA   03F8 0000 0010
        MVO     R0,     G_0355                  ; 52BD   0240 0355
        INCR    R7                              ; 52BF   000F

L_52C0:
        PSHR    R5                              ; 52C0   0275
L_52C1:
        MVII    #$000A, R0                      ; 52C1   02B8 000A

        JSR     R5,     X_PLAY_CHEER1           ; 52C3   0004 011C 02D5
        JSR     R5,     L_5DC8                  ; 52C6   0004 015C 01C8

        MVII    #$0040, R0                      ; 52C9   02B8 0040
        MVO     R0,     G_0179                  ; 52CB   0240 0179
        CLRR    R0                              ; 52CD   01C0
        MVO     R0,     G_017A                  ; 52CE   0240 017A
        MVO     R0,     G_015D                  ; 52D0   0240 015D

        JSR     R5,     L_559B                  ; 52D2   0004 0154 019B
        JSR     R5,     L_52A2                  ; 52D5   0004 0150 02A2
        JSR     R5,     L_5253                  ; 52D8   0004 0150 0253

        MVII    #$0019, R3                      ; 52DB   02BB 0019
        SDBD                                    ; 52DD   0001
        MVII    #$506F, R2                      ; 52DE   02BA 006F 0050
        MVII    #$0006, R0                      ; 52E1   02B8 0006
        MVO     R0,     G_017B                  ; 52E3   0240 017B
        DECR    R0                              ; 52E5   0010

L_52E6:
        JSR     R5,     .EXEC.9AD               ; 52E6   0004 0118 01AD

        SLR     R3,     1                       ; 52E9   0063
        DECR    R0                              ; 52EA   0010
        BPL     L_52E6                          ; 52EB   0223 0006
        PULR    R7                              ; 52ED   02B7

        DECLE   $0040,  $0058,  $00FE,  $0052   ; 52EE   0040 0058 00FE 0052
        DECLE   $0000,  $0054,  $0000,  $0000   ; 52F2   0000 0054 0000 0000
        DECLE   $0000,  $0000,  $00F0,  $0003   ; 52F6   0000 0000 00F0 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 52FA   0000 0000 0000 0000
        DECLE   $002E,  $0052,  $00DC,  $0050   ; 52FE   002E 0052 00DC 0050
        DECLE   $0008,  $000B,  $0006,  $0383   ; 5302   0008 000B 0006 0383
        DECLE   $015F,  $0083,  $005F,  $0283   ; 5306   015F 0083 005F 0283
        DECLE   $015F,  $002E,  $0052,  $00DC   ; 530A   015F 002E 0052 00DC
        DECLE   $0050,  $0004,  $0003,  $0006   ; 530E   0050 0004 0003 0006
        DECLE   $0383,  $015F,  $0083,  $005F   ; 5312   0383 015F 0083 005F
        DECLE   $0283,  $015F,  $002E,  $0052   ; 5316   0283 015F 002E 0052
        DECLE   $00DC,  $0050,  $0001,  $0001   ; 531A   00DC 0050 0001 0001
        DECLE   $0006,  $0383,  $015F,  $0083   ; 531E   0006 0383 015F 0083
        DECLE   $005F,  $0283,  $015F,  $002E   ; 5322   005F 0283 015F 002E
        DECLE   $0052,  $00BB,  $0051,  $0001   ; 5326   0052 00BB 0051 0001
        DECLE   $001B,  $0000,  $002E,  $0052   ; 532A   001B 0000 002E 0052
        DECLE   $00BB,  $0058,  $0003,  $001D   ; 532E   00BB 0058 0003 001D
        DECLE   $0000,  $0007,  $0048,  $0043   ; 5332   0000 0007 0048 0043
        DECLE   $0053,  $0000,  $0054,  $0000   ; 5336   0053 0000 0054 0000
        DECLE   $0034,  $0000,  $0000,  $0000   ; 533A   0034 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 533E   0000 0000 0000 0000
        DECLE   $0000,  $012E,  $0052,  $00A0   ; 5342   0000 012E 0052 00A0
        DECLE   $0059,  $0001,  $0000,  $000E   ; 5346   0059 0001 0000 000E
        DECLE   $000D,  $0059,  $000D,  $0159   ; 534A   000D 0059 000D 0159
        DECLE   $020D,  $0059,  $020D,  $0159   ; 534E   020D 0059 020D 0159
        DECLE   $010D,  $0059,  $010D,  $0159   ; 5352   010D 0059 010D 0159
        DECLE   $030D,  $0059                   ; 5356   030D 0059
.GRAM_INIT_5358:
        DECLE   $0030           ; 5358  # of GRAM cards to init
        DECLE   $005B,  $014A   ; 5359  #00   :  Algo #1
        DECLE   $0201,  $0040   ; 535B  #01-01:  GRAM #00-00 X---
        DECLE   $015B,  $0142   ; 535D  #02   :  Algo #1
        DECLE   $0205,  $0040   ; 535F  #03-03:  GRAM #02-02 X---
        DECLE   $0000           ; 5361  #04   :  CART #00    ----
        DECLE   $0200           ; 5362  #05   :  CART #00    X---
        DECLE   $0002           ; 5363  #06   :  CART #01    ----
        DECLE   $0202           ; 5364  #07   :  CART #01    X---
        DECLE   $0004           ; 5365  #08   :  CART #02    ----
        DECLE   $0204           ; 5366  #09   :  CART #02    X---
        DECLE   $0006           ; 5367  #0A   :  CART #03    ----
        DECLE   $0206           ; 5368  #0B   :  CART #03    X---
        DECLE   $0008           ; 5369  #0C   :  CART #04    ----
        DECLE   $0208           ; 536A  #0D   :  CART #04    X---
        DECLE   $0051,  $0152   ; 536B  #0E   :  Algo #1
        DECLE   $021D,  $0040   ; 536D  #0F-0F:  GRAM #0E-0E X---
        DECLE   $0061,  $021B   ; 536F  #10   :  Algo #2
        DECLE   $0221,  $0040   ; 5371  #11-11:  GRAM #10-10 X---
        DECLE   $000A           ; 5373  #12   :  CART #05    ----
        DECLE   $0225,  $0040   ; 5374  #13-13:  GRAM #12-12 X---
        DECLE   $005B,  $015A   ; 5376  #14   :  Algo #1
        DECLE   $0229,  $0040   ; 5378  #15-15:  GRAM #14-14 X---
        DECLE   $000C           ; 537A  #16   :  CART #06    ----
        DECLE   $020C           ; 537B  #17   :  CART #06    X---
        DECLE   $000E           ; 537C  #18   :  CART #07    ----
        DECLE   $020E           ; 537D  #19   :  CART #07    X---
        DECLE   $0010           ; 537E  #1A   :  CART #08    ----
        DECLE   $0210           ; 537F  #1B   :  CART #08    X---
        DECLE   $0012           ; 5380  #1C   :  CART #09    ----
        DECLE   $0212           ; 5381  #1D   :  CART #09    X---
        DECLE   $0020           ; 5382  #1E   :  CART #10    ----
        DECLE   $0220           ; 5383  #1F   :  CART #10    X---
        DECLE   $0014           ; 5384  #20   :  CART #0A    ----
        DECLE   $0214           ; 5385  #21   :  CART #0A    X---
        DECLE   $0016           ; 5386  #22   :  CART #0B    ----
        DECLE   $0216           ; 5387  #23   :  CART #0B    X---
        DECLE   $0009,  $01CA   ; 5388  #24   :  Algo #1
        DECLE   $0249,  $0040   ; 538A  #25-25:  GRAM #24-24 X---
        DECLE   $0018           ; 538C  #26   :  CART #0C    ----
        DECLE   $0218           ; 538D  #27   :  CART #0C    X---
        DECLE   $001A           ; 538E  #28   :  CART #0D    ----
        DECLE   $021A           ; 538F  #29   :  CART #0D    X---
        DECLE   $001C           ; 5390  #2A   :  CART #0E    ----
        DECLE   $021C           ; 5391  #2B   :  CART #0E    X---
        DECLE   $001E           ; 5392  #2C   :  CART #0F    ----
        DECLE   $021E           ; 5393  #2D   :  CART #0F    X---
        DECLE   $0022           ; 5394  #2E   :  CART #11    ----
        DECLE   $0222           ; 5395  #2F   :  CART #11    X---

.GFX_LIST_5396:
        DECLE   $00FF,  $0001,  $0002,  $0002   ; 5396  CART PIC #00
        DECLE   $0004,  $0004,  $0008,  $0008   ; 539A  
        DECLE   $007F,  $0040,  $0080,  $0080   ; 539E  CART PIC #01
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53A2  
        DECLE   $0007,  $0004,  $0008,  $0008   ; 53A6  CART PIC #02
        DECLE   $0010,  $0010,  $0020,  $0020   ; 53AA  
        DECLE   $0040,  $0078,  $0086,  $0081   ; 53AE  CART PIC #03
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 53B2  
        DECLE   $0000,  $001E,  $0002,  $0002   ; 53B6  CART PIC #04
        DECLE   $0003,  $0000,  $0000,  $0000   ; 53BA  
        DECLE   $0000,  $00F0,  $0010,  $0010   ; 53BE  CART PIC #05
        DECLE   $001F,  $0011,  $0026,  $0038   ; 53C2  
        DECLE   $00AC,  $0054,  $00AC,  $0054   ; 53C6  CART PIC #06
        DECLE   $00AD,  $0055,  $00AE,  $0056   ; 53CA  
        DECLE   $00AC,  $00FC,  $0008,  $0008   ; 53CE  CART PIC #07
        DECLE   $0010,  $0010,  $0020,  $0020   ; 53D2  
        DECLE   $000A,  $000F,  $0000,  $0000   ; 53D6  CART PIC #08
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53DA  
        DECLE   $0035,  $006B,  $0056,  $00AA   ; 53DE  CART PIC #09
        DECLE   $00D4,  $00FC,  $00AC,  $00D4   ; 53E2  
        DECLE   $005A,  $00B6,  $006A,  $00B6   ; 53E6  CART PIC #0A
        DECLE   $007F,  $00C1,  $0082,  $0082   ; 53EA  
        DECLE   $0000,  $0000,  $001E,  $001A   ; 53EE  CART PIC #0B
        DECLE   $0036,  $006E,  $005A,  $00AE   ; 53F2  
        DECLE   $0010,  $0010,  $002C,  $0023   ; 53F6  CART PIC #0C
        DECLE   $0040,  $0040,  $0080,  $0080   ; 53FA  
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 53FE  CART PIC #0D
        DECLE   $0003,  $0003,  $0003,  $0003   ; 5402  
        DECLE   $0003,  $0003,  $0003,  $0003   ; 5406  CART PIC #0E
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 540A  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 540E  CART PIC #0F
        DECLE   $00FF,  $0003,  $0003,  $0003   ; 5412  
        DECLE   $0001,  $0001,  $0003,  $0006   ; 5416  CART PIC #10
        DECLE   $0005,  $000A,  $0015,  $001A   ; 541A  
        DECLE   $0001,  $0001,  $0002,  $0003   ; 541E  CART PIC #11
        DECLE   $0006,  $0005,  $000A,  $000D   ; 5422  
L_5426:
        PSHR    R5                              ; 5426   0275
        MVII    #$000A, R5                      ; 5427   02BD 000A
        MOVR    R5,     R4                      ; 5429   00AC
        MVI     G_0167, R3                      ; 542A   0283 0167
        TSTR    R2                              ; 542C   0092
        BNEQ    L_543E                          ; 542D   020C 000F

        CMPI    #$0029, R3                      ; 542F   037B 0029
        BLT     L_5436                          ; 5431   0205 0003

        CLRR    R4                              ; 5433   01E4
        MVO     R4,     G_015D                  ; 5434   0244 015D
L_5436:
        INCR    R3                              ; 5436   000B
        MOVR    R3,     R2                      ; 5437   009A
        ADDI    #$0013, R2                      ; 5438   02FA 0013
        MVII    #$0013, R1                      ; 543A   02B9 0013
        B       L_5448                          ; 543C   0200 000A

L_543E:
        CMPI    #$0001, R3                      ; 543E   037B 0001
        BGT     L_5445                          ; 5440   020E 0003

        CLRR    R5                              ; 5442   01ED
        MVO     R5,     G_015D                  ; 5443   0245 015D
L_5445:
        DECR    R3                              ; 5445   0013
        MOVR    R3,     R2                      ; 5446   009A
        CLRR    R1                              ; 5447   01C9
L_5448:
        MVO     R3,     G_0167                  ; 5448   0243 0167
        PSHR    R4                              ; 544A   0274
        PSHR    R5                              ; 544B   0275

        JSR     R5,     L_546C                  ; 544C   0004 0154 006C

        PULR    R5                              ; 544F   02B5
        PULR    R4                              ; 5450   02B4
        MVO     R4,     G_0168                  ; 5451   0244 0168
        MVO     R5,     G_0169                  ; 5453   0245 0169
        MVI     G_017F, R0                      ; 5455   0280 017F
        TSTR    R0                              ; 5457   0080
        BEQ     L_546B                          ; 5458   0204 0011

        MVI     G_0167, R0                      ; 545A   0280 0167
        CMPI    #$0015, R0                      ; 545C   0378 0015
        BNEQ    L_546B                          ; 545E   020C 000B

        CLRR    R0                              ; 5460   01C0
        MVO     R0,     G_015D                  ; 5461   0240 015D
        MVO     R0,     G_017F                  ; 5463   0240 017F
        MVI     G_017E, R3                      ; 5465   0283 017E
        SWAP    R3,     1                       ; 5467   0043
        XOR     G_017D, R3                      ; 5468   03C3 017D
        MOVR    R3,     R7                      ; 546A   009F
L_546B:
        PULR    R7                              ; 546B   02B7

L_546C:
        PSHR    R5                              ; 546C   0275
        CLRR    R3                              ; 546D   01DB
        CMPI    #$001F, R2                      ; 546E   037A 001F
        BLE     L_5477                          ; 5470   0206 0005

        MVII    #$0008, R3                      ; 5472   02BB 0008
        SUBI    #$003D, R2                      ; 5474   033A 003D
        NEGR    R2                              ; 5476   0022
L_5477:
        ADDI    #$0200, R1                      ; 5477   02F9 0200
        SDBD                                    ; 5479   0001
        ADDI    #$557B, R2                      ; 547A   02FA 007B 0055
        MVI@    R2,     R4                      ; 547D   0294
        SDBD                                    ; 547E   0001
        ADDI    #$54B1, R4                      ; 547F   02FC 00B1 0054
L_5482:
        MVI@    R4,     R0                      ; 5482   02A0
        PSHR    R0                              ; 5483   0270
        ANDI    #$0200, R0                      ; 5484   03B8 0200
        PULR    R0                              ; 5486   02B0
        BEQ     L_5496                          ; 5487   0204 000D

        SDBD                                    ; 5489   0001
        XORI    #$FC00, R0                      ; 548A   03F8 0000 00FC
        CLRR    R2                              ; 548D   01D2
L_548E:
        MVO@    R2,     R1                      ; 548E   024A
        ADDI    #$0014, R1                      ; 548F   02F9 0014
        INCR    R0                              ; 5491   0008
        BNEQ    L_548E                          ; 5492   022C 0005
        B       L_54AA                          ; 5494   0200 0014

L_5496:
        SLL     R0,     2                       ; 5496   004C
        SLL     R0,     1                       ; 5497   0048
        PSHR    R0                              ; 5498   0270
        SDBD                                    ; 5499   0001
        ANDI    #$F7FF, R0                      ; 549A   03B8 00FF 00F7
        SDBD                                    ; 549D   0001
        CMPI    #$0640, R0                      ; 549E   0378 0040 0006
        PULR    R0                              ; 54A1   02B0
        BGE     L_54A5                          ; 54A2   020D 0001

        XORR    R3,     R0                      ; 54A4   01D8
L_54A5:
        XORI    #$0007, R0                      ; 54A5   03F8 0007
        MVO@    R0,     R1                      ; 54A7   0248
        ADDI    #$0014, R1                      ; 54A8   02F9 0014
L_54AA:
        CMPI    #$02DC, R1                      ; 54AA   0379 02DC
        BLT     L_5482                          ; 54AC   0225 002B

        CLRR    R0                              ; 54AE   01C0
        MVO@    R0,     R1                      ; 54AF   0248
        PULR    R7                              ; 54B0   02B7

        DECLE   $03F6,  $010C,  $03FA,  $012E   ; 54B1   03F6 010C 03FA 012E
        DECLE   $011A,  $0110,  $0108,  $010A   ; 54B5   011A 0110 0108 010A
        DECLE   $03FC,  $011E,  $011C,  $0116   ; 54B9   03FC 011E 011C 0116
        DECLE   $0118,  $0106,  $00CC,  $00CE   ; 54BD   0118 0106 00CC 00CE
        DECLE   $03FD,  $0122,  $0120,  $0114   ; 54C1   03FD 0122 0120 0114
        DECLE   $010E,  $03FF,  $00CC,  $00CC   ; 54C5   010E 03FF 00CC 00CC
        DECLE   $00CE,  $03FE,  $0110,  $0108   ; 54C9   00CE 03FE 0110 0108
        DECLE   $0106,  $03FD,  $00CC,  $00CC   ; 54CD   0106 03FD 00CC 00CC
        DECLE   $00CE,  $03FF,  $0112,  $010E   ; 54D1   00CE 03FF 0112 010E
        DECLE   $00CC,  $00CC,  $03FD,  $00CC   ; 54D5   00CC 00CC 03FD 00CC
        DECLE   $00CC,  $00CE,  $03FF,  $00CE   ; 54D9   00CC 00CE 03FF 00CE
        DECLE   $03FF,  $00CC,  $00CC,  $03FF   ; 54DD   03FF 00CC 00CC 03FF
        DECLE   $0102,  $0100,  $03FF,  $00CC   ; 54E1   0102 0100 03FF 00CC
        DECLE   $00CE,  $03FF,  $00CE,  $03FF   ; 54E5   00CE 03FF 00CE 03FF
        DECLE   $00CC,  $0104,  $0100,  $03FD   ; 54E9   00CC 0104 0100 03FD
        DECLE   $00CC,  $00CE,  $03FF,  $00CE   ; 54ED   00CC 00CE 03FF 00CE
        DECLE   $03FF,  $00CC,  $03FB,  $00CC   ; 54F1   03FF 00CC 03FB 00CC
        DECLE   $00CE,  $03FF,  $00CE,  $03FF   ; 54F5   00CE 03FF 00CE 03FF
        DECLE   $00CC,  $03FB,  $00CC,  $00CE   ; 54F9   00CC 03FB 00CC 00CE
        DECLE   $03FF,  $00CE,  $03FF,  $00CC   ; 54FD   03FF 00CE 03FF 00CC
        DECLE   $03FD,  $0102,  $0100,  $03FF   ; 5501   03FD 0102 0100 03FF
        DECLE   $00CE,  $03FF,  $00CE,  $03FF   ; 5505   00CE 03FF 00CE 03FF
        DECLE   $00CC,  $03FF,  $0102,  $0100   ; 5509   00CC 03FF 0102 0100
        DECLE   $00B2,  $03FE,  $00CE,  $03FF   ; 550D   00B2 03FE 00CE 03FF
        DECLE   $00CE,  $03FF,  $0104,  $0126   ; 5511   00CE 03FF 0104 0126
        DECLE   $03FF,  $00B4,  $03FD,  $00CE   ; 5515   03FF 00B4 03FD 00CE
        DECLE   $03FF,  $00CE,  $03FE,  $00BA   ; 5519   03FF 00CE 03FE 00BA
        DECLE   $0124,  $00B8,  $03FD,  $00CE   ; 551D   0124 00B8 03FD 00CE
        DECLE   $03FF,  $00CE,  $03F8,  $00CE   ; 5521   03FF 00CE 03F8 00CE
        DECLE   $03FF,  $00CE,  $03F9,  $0110   ; 5525   03FF 00CE 03F9 0110
        DECLE   $00CE,  $03FF,  $00CE,  $03FB   ; 5529   00CE 03FF 00CE 03FB
        DECLE   $0110,  $0114,  $010E,  $00CE   ; 552D   0110 0114 010E 00CE
        DECLE   $03FF,  $00CE,  $03FD,  $0110   ; 5531   03FF 00CE 03FD 0110
        DECLE   $0114,  $010E,  $03FE,  $00CE   ; 5535   0114 010E 03FE 00CE
        DECLE   $03FF,  $00CE,  $03FF,  $0110   ; 5539   03FF 00CE 03FF 0110
        DECLE   $0114,  $010E,  $03FC,  $00CE   ; 553D   0114 010E 03FC 00CE
        DECLE   $03FF,  $00CE,  $0114,  $010E   ; 5541   03FF 00CE 0114 010E
        DECLE   $03FA,  $00CE,  $03FF,  $00CE   ; 5545   03FA 00CE 03FF 00CE
        DECLE   $03FE,  $00BB,  $0125,  $00B9   ; 5549   03FE 00BB 0125 00B9
        DECLE   $03FD,  $00CE,  $03FF,  $00CE   ; 554D   03FD 00CE 03FF 00CE
        DECLE   $03FE,  $00B6,  $03FF,  $00B5   ; 5551   03FE 00B6 03FF 00B5
        DECLE   $03FD,  $00CE,  $03FF,  $00CE   ; 5555   03FD 00CE 03FF 00CE
        DECLE   $03FF,  $00A6,  $03FD,  $00AD   ; 5559   03FF 00A6 03FD 00AD
        DECLE   $03FE,  $00CE,  $03FF,  $00CE   ; 555D   03FE 00CE 03FF 00CE
        DECLE   $03FF,  $00A8,  $03FD,  $00AB   ; 5561   03FF 00A8 03FD 00AB
        DECLE   $03FE,  $00CE,  $03FF,  $012C   ; 5565   03FE 00CE 03FF 012C
        DECLE   $00BD,  $0128,  $00BD,  $00BD   ; 5569   00BD 0128 00BD 00BD
        DECLE   $00BD,  $012A,  $00BD,  $00BD   ; 556D   00BD 012A 00BD 00BD
        DECLE   $012A,  $03FF,  $00CE,  $03FF   ; 5571   012A 03FF 00CE 03FF
        DECLE   $00CD,  $03FD,  $00CE,  $03FE   ; 5575   00CD 03FD 00CE 03FE
        DECLE   $00CE,  $03F5,  $00C9,  $0000   ; 5579   00CE 03F5 00C9 0000
        DECLE   $0002,  $0008,  $0010,  $0019   ; 557D   0002 0008 0010 0019
        DECLE   $0021,  $002A,  $0035           ; 5581   0021 002A 0035

        RSWD    R6                              ; 5584   003E
        SWAP    R1,     2                       ; 5585   0045
        SLL     R0,     2                       ; 5586   004C
        RLC     R1,     2                       ; 5587   0055
        SLLC    R3,     2                       ; 5588   005F
        SAR     R0,     1                       ; 5589   0068
        RRC     R0,     1                       ; 558A   0070
        RRC     R0,     2                       ; 558B   0074
        SARC    R1,     1                       ; 558C   0079
        TSTR    R0                              ; 558D   0080
        MOVR    R1,     R0                      ; 558E   0088
        MOVR    R2,     R0                      ; 558F   0090
        RRC     R0,     1                       ; 5590   0070
        RRC     R0,     1                       ; 5591   0070
        RRC     R0,     1                       ; 5592   0070
        RRC     R0,     1                       ; 5593   0070
        RRC     R0,     1                       ; 5594   0070
        MOVR    R2,     R6                      ; 5595   0096
        MOVR    R3,     R6                      ; 5596   009E
        MOVR    R4,     R6                      ; 5597   00A6
        MOVR    R5,     R6                      ; 5598   00AE
        TSTR    R6                              ; 5599   00B6
        ADDR    R0,     R1                      ; 559A   00C1
L_559B:
        MVII    #$007F, R1                      ; 559B   02B9 007F
        MVI     G_0167, R0                      ; 559D   0280 0167
        SUBI    #$0015, R0                      ; 559F   0338 0015
        BNEQ    L_55A6                          ; 55A1   020C 0003

        MVO     R0,     G_015D                  ; 55A3   0240 015D
        MOVR    R5,     R7                      ; 55A5   00AF
L_55A6:
        BPL     L_55A9                          ; 55A6   0203 0001

        NEGR    R1                              ; 55A8   0021
L_55A9:
        MVO     R1,     G_015D                  ; 55A9   0241 015D
        MOVR    R5,     R0                      ; 55AB   00A8
        MVO     R0,     G_017D                  ; 55AC   0240 017D
        SWAP    R0,     1                       ; 55AE   0040
        MVO     R0,     G_017E                  ; 55AF   0240 017E
        MVI     .PSG1.lft_hand,R0               ; 55B1   0280 00FF
        MVO     R0,     G_017F                  ; 55B3   0240 017F
        PULR    R7                              ; 55B5   02B7

L_55B6:
        PSHR    R5                              ; 55B6   0275
        MVII    #$015D, R4                      ; 55B7   02BC 015D
        MVI@    R4,     R0                      ; 55B9   02A0
        SWAP    R0,     1                       ; 55BA   0040
        SAR     R0,     2                       ; 55BB   006C
        SAR     R0,     2                       ; 55BC   006C
        SAR     R0,     1                       ; 55BD   0068
        MOVR    R4,     R3                      ; 55BE   00A3
        SDBD                                    ; 55BF   0001
        ADD@    R4,     R0                      ; 55C0   02E0
        MVO@    R0,     R3                      ; 55C1   0258
        SWAP    R0,     1                       ; 55C2   0040
        MOVR    R0,     R2                      ; 55C3   0082
        INCR    R3                              ; 55C4   000B
        SUB@    R3,     R0                      ; 55C5   0318
        MOVR    R2,     R1                      ; 55C6   0091
        ANDI    #$0007, R1                      ; 55C7   03B9 0007
        MVO@    R1,     R3                      ; 55C9   0259
        XORR    R1,     R2                      ; 55CA   01CA
        MVII    #$0163, R5                      ; 55CB   02BD 0163
        MVO@    R2,     R5                      ; 55CD   026A
        SUBR    R0,     R2                      ; 55CE   0102
        INCR    R5                              ; 55CF   000D
        MVO@    R2,     R5                      ; 55D0   026A
        MVII    #$0003, R3                      ; 55D1   02BB 0003
        MVO@    R3,     R5                      ; 55D3   026B
        MVII    #$0100, R5                      ; 55D4   02BD 0100
        SDBD                                    ; 55D6   0001
        MVI@    R5,     R0                      ; 55D7   02A8
        MVO@    R0,     R4                      ; 55D8   0260
        SWAP    R0,     1                       ; 55D9   0040
        MVO@    R0,     R4                      ; 55DA   0260
        MOVR    R7,     R0                      ; 55DB   00B8
        ADDI    #$0013, R0                      ; 55DC   02F8 0013
        MVO     R0,     .ISRVEC.0               ; 55DE   0240 0100
        SWAP    R0,     1                       ; 55E0   0040
        MVO     R0,     .ISRVEC.1               ; 55E1   0240 0101
L_55E3:
        EIS                                     ; 55E3   0002
        MVI     G_0166, R2                      ; 55E4   0282 0166
        SARC    R2,     2                       ; 55E6   007E
        BC      L_55E3                          ; 55E7   0221 0005
        BNOV    L_55EE                          ; 55E9   020A 0003

        JSR     R5,     L_5426                  ; 55EB   0004 0154 0026

L_55EE:
        PULR    R7                              ; 55EE   02B7

        PSHR    R5                              ; 55EF   0275
        MVII    #$031D, R2                      ; 55F0   02BA 031D
        CLRR    R3                              ; 55F2   01DB
L_55F3:
        MVII    #$0164, R5                      ; 55F3   02BD 0164
        MVI@    R2,     R0                      ; 55F5   0290
        SLL     R0,     1                       ; 55F6   0048
        BPL     L_55FB                          ; 55F7   0203 0002

        MVII    #$0162, R5                      ; 55F9   02BD 0162
L_55FB:
        ADDI    #$0002, R2                      ; 55FB   02FA 0002
        MVI@    R2,     R0                      ; 55FD   0290
        SDBD                                    ; 55FE   0001
        ADD@    R5,     R0                      ; 55FF   02E8
        MVO@    R0,     R2                      ; 5600   0250
        MVI@    R3,     R0                      ; 5601   0298
        MOVR    R0,     R1                      ; 5602   0081
        ANDI    #$00FF, R1                      ; 5603   03B9 00FF
        XORR    R1,     R0                      ; 5605   01C8
        DECR    R5                              ; 5606   0015
        ADD@    R5,     R1                      ; 5607   02E9
        ANDI    #$00FF, R1                      ; 5608   03B9 00FF
        XORR    R1,     R0                      ; 560A   01C8
        MVO@    R0,     R3                      ; 560B   0258
        ADDI    #$0006, R2                      ; 560C   02FA 0006
        INCR    R3                              ; 560E   000B
        CMPI    #$0008, R3                      ; 560F   037B 0008
        BNEQ    L_55F3                          ; 5611   022C 001F

        MVI     G_015F, R0                      ; 5613   0280 015F
        MVO     R0,     .STIC.HDLY              ; 5615   0240 0030
        MVO     R0,     .STIC.VIDEN             ; 5617   0240 0020
        MVII    #$0160, R4                      ; 5619   02BC 0160
        SDBD                                    ; 561B   0001
        MVI@    R4,     R0                      ; 561C   02A0
        MVO     R0,     .ISRVEC.0               ; 561D   0240 0100
        SWAP    R0,     1                       ; 561F   0040
        MVO     R0,     .ISRVEC.1               ; 5620   0240 0101
        CLRR    R2                              ; 5622   01D2
        MVI     G_0163, R0                      ; 5623   0280 0163
        SWAP    R0,     2                       ; 5625   0044
        BEQ     L_565D                          ; 5626   0204 0035
        BPL     L_5642                          ; 5628   0203 0018

        MVII    #$0200, R4                      ; 562A   02BC 0200
        MOVR    R4,     R5                      ; 562C   00A5
L_562D:
        MVI@    R4,     R0                      ; 562D   02A0
        SDBD                                    ; 562E   0001
        ANDI    #$2000, R0                      ; 562F   03B8 0000 0020
        XOR@    R4,     R0                      ; 5632   03E0
        MVO@    R0,     R5                      ; 5633   0268
        MVII    #$0012, R3                      ; 5634   02BB 0012
L_5636:
        MVI@    R4,     R0                      ; 5636   02A0
        MVO@    R0,     R5                      ; 5637   0268
        DECR    R3                              ; 5638   0013
        BNEQ    L_5636                          ; 5639   022C 0004

        INCR    R5                              ; 563B   000D
        CMPI    #$02E6, R4                      ; 563C   037C 02E6
        BLT     L_562D                          ; 563E   0225 0012
        B       L_565B                          ; 5640   0200 0019

L_5642:
        MVII    #$0212, R5                      ; 5642   02BD 0212
        MVII    #$0003, R1                      ; 5644   02B9 0003
L_5646:
        MVII    #$0012, R3                      ; 5646   02BB 0012
L_5648:
        MVI@    R5,     R0                      ; 5648   02A8
        MVO@    R0,     R5                      ; 5649   0268
        SUBR    R1,     R5                      ; 564A   010D
        DECR    R3                              ; 564B   0013
        BNEQ    L_5648                          ; 564C   022C 0005

        MVI@    R5,     R0                      ; 564E   02A8
        SDBD                                    ; 564F   0001
        ANDI    #$5FFF, R0                      ; 5650   03B8 00FF 005F
        MVO@    R0,     R5                      ; 5653   0268
        ADDI    #$0024, R5                      ; 5654   02FD 0024
        CMPI    #$02F0, R5                      ; 5656   037D 02F0
        BLT     L_5646                          ; 5658   0225 0013

        INCR    R2                              ; 565A   000A
L_565B:
        MVII    #$0002, R0                      ; 565B   02B8 0002
L_565D:
        SLL     R2,     2                       ; 565D   004E
        XORR    R0,     R2                      ; 565E   01C2
        MVO     R2,     G_0166                  ; 565F   0242 0166
        PULR    R7                              ; 5661   02B7

        DECLE   $0040,  $00A0,  $0040,  $00A0   ; 5662   0040 00A0 0040 00A0
        DECLE   $0040,  $0000,  $0000,  $0000   ; 5666   0040 0000 0000 0000
        DECLE   $000C,  $000C,  $0000,  $001E   ; 566A   000C 000C 0000 001E
        DECLE   $002D,  $001D,  $000C,  $0000   ; 566E   002D 001D 000C 0000
        DECLE   $000C,  $000A,  $000A,  $000A   ; 5672   000C 000A 000A 000A
        DECLE   $000A,  $0012,  $0010,  $001B   ; 5676   000A 0012 0010 001B
        DECLE   $0018,  $0018,  $0000,  $007C   ; 567A   0018 0018 0000 007C
        DECLE   $007C,  $005A,  $001A,  $0000   ; 567E   007C 005A 001A 0000
        DECLE   $001A,  $0018,  $0018,  $0010   ; 5682   001A 0018 0018 0010
        DECLE   $0010,  $0010,  $0000,  $0010   ; 5686   0010 0010 0000 0010
        DECLE   $0018,  $0018,  $0000,  $003C   ; 568A   0018 0018 0000 003C
        DECLE   $007E,  $005A,  $005A,  $0000   ; 568E   007E 005A 005A 0000
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5692   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0000,  $0000   ; 5696   0018 0018 0000 0000
        DECLE   $0018,  $0018,  $0000,  $003E   ; 569A   0018 0018 0000 003E
        DECLE   $003E,  $005A,  $0058,  $0000   ; 569E   003E 005A 0058 0000
        DECLE   $0058,  $0018,  $0018,  $0008   ; 56A2   0058 0018 0018 0008
        DECLE   $0008,  $0008,  $0000,  $0008   ; 56A6   0008 0008 0000 0008
        DECLE   $0018,  $0018,  $0000,  $003C   ; 56AA   0018 0018 0000 003C
        DECLE   $007E,  $005A,  $005A,  $0000   ; 56AE   007E 005A 005A 0000
        DECLE   $0018,  $0018,  $0018,  $0018   ; 56B2   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0000,  $0000   ; 56B6   0018 0018 0000 0000
        DECLE   $0006,  $0006,  $0000           ; 56BA   0006 0006 0000

        INCR    R6                              ; 56BD   000E
        INCR    R6                              ; 56BE   000E
        INCR    R6                              ; 56BF   000E
        INCR    R6                              ; 56C0   000E
        INCR    R7                              ; 56C1   000F

        INCR    R6                              ; 56C2   000E
L_56C3:
        INCR    R6                              ; 56C3   000E
        DECLE   $000E,  $003C,  $0028,  $0028   ; 56C4   000E 003C 0028 0028
        DECLE   $0008,  $000C,  $0006,  $0006   ; 56C8   0008 000C 0006 0006
        DECLE   $0000,  $000C,  $001C,  $001C   ; 56CC   0000 000C 001C 001C
        DECLE   $001E,  $0018,  $001C,  $003E   ; 56D0   001E 0018 001C 003E
        DECLE   $0022,  $002E,  $0028,  $0020   ; 56D4   0022 002E 0028 0020
        DECLE   $0020,  $0010,  $000C,  $000C   ; 56D8   0020 0010 000C 000C
        DECLE   $0000,  $001C,  $003C,  $002E   ; 56DC   0000 001C 003C 002E
        DECLE   $002C,  $0000,  $001C,  $003F   ; 56E0   002C 0000 001C 003F
        DECLE   $0021,  $0027,  $0024,  $0044   ; 56E4   0021 0027 0024 0044
        DECLE   $0040,  $0040,  $000C,  $000C   ; 56E8   0040 0040 000C 000C
        DECLE   $0000,  $0078,  $0058,  $005F   ; 56EC   0000 0078 0058 005F
        DECLE   $0018,  $0000,  $0018,  $003F   ; 56F0   0018 0000 0018 003F
        DECLE   $0021,  $0062,  $0042,  $00C0   ; 56F4   0021 0062 0042 00C0
        DECLE   $0080,  $0080,  $000C,  $000C   ; 56F8   0080 0080 000C 000C
        DECLE   $0070,  $0058,  $005F,  $0018   ; 56FC   0070 0058 005F 0018
        DECLE   $0018,  $0000,  $0018,  $003F   ; 5700   0018 0000 0018 003F
        DECLE   $0021,  $0061,  $0041,  $00C0   ; 5704   0021 0061 0041 00C0
        DECLE   $0080,  $0000,  $000C,  $000C   ; 5708   0080 0000 000C 000C
        DECLE   $0000,  $0078,  $0058,  $005F   ; 570C   0000 0078 0058 005F
        DECLE   $0018,  $0000,  $0018,  $003C   ; 5710   0018 0000 0018 003C
        DECLE   $0024,  $0066,  $00C2,  $0082   ; 5714   0024 0066 00C2 0082
        DECLE   $0003,  $0000,  $0006,  $0006   ; 5718   0003 0000 0006 0006
        DECLE   $0000,  $001C,  $003C,  $002E   ; 571C   0000 001C 003C 002E
        DECLE   $002C,  $0000,  $0038,  $003C   ; 5720   002C 0000 0038 003C
        DECLE   $0024,  $00E4,  $0084,  $0084   ; 5724   0024 00E4 0084 0084
        DECLE   $0004,  $0006,  $0006,  $0006   ; 5728   0004 0006 0006 0006
        DECLE   $0000,  $000C,  $001C,  $001C   ; 572C   0000 000C 001C 001C
        DECLE   $001E,  $0018,  $0018,  $0018   ; 5730   001E 0018 0018 0018
        DECLE   $0018,  $0078,  $0048,  $0048   ; 5734   0018 0078 0048 0048
        DECLE   $0008,  $000C,  $005C,  $005C   ; 5738   0008 000C 005C 005C
        DECLE   $0044,  $003C,  $0018,  $0018   ; 573C   0044 003C 0018 0018
        DECLE   $0018,  $0000,  $0018,  $0018   ; 5740   0018 0000 0018 0018
        DECLE   $0024,  $0024,  $0024,  $0024   ; 5744   0024 0024 0024 0024
        DECLE   $0000,  $0026,  $0030,  $0030   ; 5748   0000 0026 0030 0030
        DECLE   $0000,  $0070,  $0078,  $0036   ; 574C   0000 0070 0078 0036
        DECLE   $0030,  $0000,  $0030,  $0031   ; 5750   0030 0000 0030 0031
        DECLE   $001F,  $0008,  $0008,  $0008   ; 5754   001F 0008 0008 0008
        DECLE   $0008,  $000C,  $0018,  $0018   ; 5758   0008 000C 0018 0018
        DECLE   $0000,  $0038,  $0038,  $003F   ; 575C   0000 0038 0038 003F
        DECLE   $0018,  $0000,  $0018,  $0018   ; 5760   0018 0000 0018 0018
        DECLE   $0014,  $0014,  $0012,  $0012   ; 5764   0014 0014 0012 0012
        DECLE   $0002,  $001B,  $0018,  $0018   ; 5768   0002 001B 0018 0018
        DECLE   $0000,  $0038,  $0058,  $003F   ; 576C   0000 0038 0058 003F
        DECLE   $0018,  $0000                   ; 5770   0018 0000

        COMR    R0                              ; 5772   0018
        COMR    R4                              ; 5773   001C
        INCR    R4                              ; 5774   000C
        DECR    R6                              ; 5775   0016
        NEGR    R2                              ; 5776   0022
        MOVR    R0,     R2                      ; 5777   0082
        SWAP    R2,     1                       ; 5778   0042
        DIS                                     ; 5779   0003
L_577A:
        PSHR    R5                              ; 577A   0275
        MVII    #$0321, R3                      ; 577B   02BB 0321
        MVII    #$016A, R5                      ; 577D   02BD 016A
L_577F:
        PSHR    R3                              ; 577F   0273
        MVI@    R5,     R0                      ; 5780   02A8
        PSHR    R5                              ; 5781   0275
        ANDI    #$0004, R0                      ; 5782   03B8 0004
        BNEQ    L_57C9                          ; 5784   020C 0043

        MVI@    R3,     R0                      ; 5786   0298
        SUBI    #$0004, R3                      ; 5787   033B 0004
        MVI@    R3,     R2                      ; 5789   029A
        SDBD                                    ; 578A   0001
        ANDI    #$FDFF, R2                      ; 578B   03BA 00FF 00FD
        TSTR    R0                              ; 578E   0080
        BEQ     L_57D2                          ; 578F   0204 0041

        JSR     R5,     X_UNPK_BYTES            ; 5791   0004 0114 0357
        JSR     R5,     .EXEC.A2F               ; 5794   0004 0118 022F

        MOVR    R1,     R0                      ; 5797   0088
        ANDI    #$0007, R0                      ; 5798   03B8 0007
        CMPI    #$0006, R0                      ; 579A   0378 0006
        BGE     L_57AA                          ; 579C   020D 000C

        CMPI    #$0002, R0                      ; 579E   0378 0002
        BLE     L_57AA                          ; 57A0   0206 0008

        SDBD                                    ; 57A2   0001
        MVII    #$530B, R4                      ; 57A3   02BC 000B 0053
        MVII    #$0004, R0                      ; 57A6   02B8 0004
        B       L_57B0                          ; 57A8   0200 0006

L_57AA:
        MVII    #$0008, R0                      ; 57AA   02B8 0008
        SDBD                                    ; 57AC   0001
        MVII    #$52FE, R4                      ; 57AD   02BC 00FE 0052
L_57B0:
        CMPI    #$0005, R1                      ; 57B0   0379 0005
        BLT     L_57BA                          ; 57B2   0205 0006

        CMPI    #$000B, R1                      ; 57B4   0379 000B
        BGT     L_57BA                          ; 57B6   020E 0002

L_57B8:
        XORI    #$0200, R2                      ; 57B8   03FA 0200
L_57BA:
        MVO@    R2,     R3                      ; 57BA   025A
        INCR    R3                              ; 57BB   000B
        MVO@    R4,     R3                      ; 57BC   025C
        ADDI    #$0004, R3                      ; 57BD   02FB 0004
        MVI@    R3,     R5                      ; 57BF   029D
        ANDI    #$000F, R5                      ; 57C0   03BD 000F
        CMPR    R5,     R0                      ; 57C2   0168
        BGE     L_57C9                          ; 57C3   020D 0004

        CLRR    R5                              ; 57C5   01ED
        XORI    #$03F0, R5                      ; 57C6   03FD 03F0
        MVO@    R5,     R3                      ; 57C8   025D
L_57C9:
        PULR    R5                              ; 57C9   02B5
        PULR    R3                              ; 57CA   02B3
        ADDI    #$0008, R3                      ; 57CB   02FB 0008
        CMPI    #$0359, R3                      ; 57CD   037B 0359
        BLT     L_577F                          ; 57CF   0225 0051
        PULR    R7                              ; 57D1   02B7

L_57D2:
        SDBD                                    ; 57D2   0001
        MVII    #$5318, R4                      ; 57D3   02BC 0018 0053
        ADDI    #$0002, R3                      ; 57D6   02FB 0002
        MVI@    R3,     R5                      ; 57D8   029D
        SUBI    #$0002, R3                      ; 57D9   033B 0002
        CMP     G_0357, R5                      ; 57DB   0345 0357
        BC      L_57B8                          ; 57DD   0221 0026
        B       L_57BA                          ; 57DF   0220 0026

L_57E1:
        PSHR    R5                              ; 57E1   0275
        MVI     G_0179, R0                      ; 57E2   0280 0179
        ANDI    #$0002, R0                      ; 57E4   03B8 0002
        BNEQ    L_5817                          ; 57E6   020C 002F

        MVI     G_0179, R0                      ; 57E8   0280 0179
        SDBD                                    ; 57EA   0001
        ANDI    #$0079, R0                      ; 57EB   03B8 0079 0000
        BNEQ    L_5816                          ; 57EE   020C 0026

        MVII    #$011F, R2                      ; 57F0   02BA 011F
        MVII    #$031D, R3                      ; 57F2   02BB 031D
        CLRR    R4                              ; 57F4   01E4
L_57F5:
        MVI@    R2,     R0                      ; 57F5   0290
        MOVR    R0,     R1                      ; 57F6   0081
        ANDI    #$00C0, R0                      ; 57F7   03B8 00C0
        BNEQ    L_5808                          ; 57F9   020C 000D

        MVII    #$001E, R0                      ; 57FB   02B8 001E
        CMP     G_0173, R4                      ; 57FD   0344 0173
        BNEQ    L_5803                          ; 57FF   020C 0002

        SUBI    #$000A, R0                      ; 5801   0338 000A

L_5803:
        JSR     R5,     .EXEC.629               ; 5803   0004 0114 0229

        B       L_5809                          ; 5806   0200 0001

L_5808:
        CLRR    R0                              ; 5808   01C0
L_5809:
        MOVR    R3,     R1                      ; 5809   0099
        ADDI    #$0004, R1                      ; 580A   02F9 0004
        MVO@    R0,     R1                      ; 580C   0248
        INCR    R2                              ; 580D   000A
        ADDI    #$0018, R3                      ; 580E   02FB 0018
        MVII    #$0003, R4                      ; 5810   02BC 0003
        CMPI    #$0335, R3                      ; 5812   037B 0335
        BEQ     L_57F5                          ; 5814   0224 0020
L_5816:
        PULR    R7                              ; 5816   02B7

L_5817:
        MVII    #$011F, R1                      ; 5817   02B9 011F
        MVI     G_0173, R0                      ; 5819   0280 0173
        CMPI    #$0003, R0                      ; 581B   0378 0003
        BLT     L_5820                          ; 581D   0205 0001

        INCR    R1                              ; 581F   0009
L_5820:
        MVI@    R1,     R0                      ; 5820   0288
        ANDI    #$00C0, R0                      ; 5821   03B8 00C0
        BNEQ    L_5816                          ; 5823   022C 000E

        MVI     G_017A, R0                      ; 5825   0280 017A
        CMPI    #$0001, R0                      ; 5827   0378 0001
        BNEQ    L_5816                          ; 5829   022C 0014

        MVII    #$0002, R0                      ; 582B   02B8 0002
        MVO     R0,     G_017A                  ; 582D   0240 017A
        MVI     G_0173, R1                      ; 582F   0281 0173
        ADDI    #$016A, R1                      ; 5831   02F9 016A
        MVI@    R1,     R0                      ; 5833   0288
        XORI    #$0004, R0                      ; 5834   03F8 0004
        MVO@    R0,     R1                      ; 5836   0248
        MVI     G_0173, R0                      ; 5837   0280 0173

        JSR     R5,     .EXEC.76C               ; 5839   0004 0114 036C

        MVI@    R1,     R2                      ; 583C   028A
        SDBD                                    ; 583D   0001
        ANDI    #$FDFF, R2                      ; 583E   03BA 00FF 00FD

        JSR     R5,     L_5D74                  ; 5841   0004 015C 0174

        BNC     L_5848                          ; 5844   0209 0002

        XORI    #$0200, R2                      ; 5846   03FA 0200
L_5848:
        MVO@    R2,     R1                      ; 5848   024A
        INCR    R1                              ; 5849   0009
        SDBD                                    ; 584A   0001
        MVII    #$532C, R0                      ; 584B   02B8 002C 0053
        MVO@    R0,     R1                      ; 584E   0248
        ADDI    #$0004, R1                      ; 584F   02F9 0004
        MVII    #$03F0, R0                      ; 5851   02B8 03F0
        MVO@    R0,     R1                      ; 5853   0248
        INCR    R1                              ; 5854   0009
        MVII    #$0004, R0                      ; 5855   02B8 0004
        MVO@    R0,     R1                      ; 5857   0248
        SUBI    #$0002, R1                      ; 5858   0339 0002
        MVI     G_0173, R0                      ; 585A   0280 0173

        JSR     R5,     L_5D74                  ; 585C   0004 015C 0174

        MVII    #$0019, R0                      ; 585F   02B8 0019
        BNC     L_5864                          ; 5861   0209 0001

        NEGR    R0                              ; 5863   0020
L_5864:
        ANDI    #$00FF, R0                      ; 5864   03B8 00FF
        SWAP    R0,     1                       ; 5866   0040
        MVO@    R0,     R1                      ; 5867   0248
        PULR    R7                              ; 5868   02B7

        DECLE   $0000,  $0000                   ; 5869   0000 0000

        ADDR    R7,     R1                      ; 586B   00F9
        SLLC    R0,     1                       ; 586C   0058
        RRC     R3,     1                       ; 586D   0073
        SLLC    R0,     1                       ; 586E   0058
        SARC    R1,     1                       ; 586F   0079
        SLLC    R0,     1                       ; 5870   0058
        SARC    R1,     1                       ; 5871   0079
        SLLC    R0,     1                       ; 5872   0058
        MVII    #$003C, R4                      ; 5873   02BC 003C
        MVII    #$0002, R2                      ; 5875   02BA 0002
        B       L_587D                          ; 5877   0200 0004

        MVII    #$002D, R4                      ; 5879   02BC 002D
        MVII    #$0005, R2                      ; 587B   02BA 0005
L_587D:
        PSHR    R5                              ; 587D   0275
        TSTR    R0                              ; 587E   0080
        BMI     L_58B4                          ; 587F   020B 0033

        PSHR    R1                              ; 5881   0271
        MOVR    R4,     R0                      ; 5882   00A0
        MVI     G_011F, R4                      ; 5883   0284 011F
        CLRR    R3                              ; 5885   01DB
        TSTR    R1                              ; 5886   0089
        BEQ     L_588D                          ; 5887   0204 0004

        MVI     G_0120, R4                      ; 5889   0284 0120
        MVII    #$0003, R3                      ; 588B   02BB 0003
L_588D:
        ADDI    #$016A, R3                      ; 588D   02FB 016A
        MVI@    R3,     R1                      ; 588F   0299
        PSHR    R2                              ; 5890   0272
        MOVR    R1,     R2                      ; 5891   008A
        ANDI    #$0080, R1                      ; 5892   03B9 0080
        BEQ     L_58B5                          ; 5894   0204 001F

        PULR    R5                              ; 5896   02B5
        PULR    R5                              ; 5897   02B5
        MOVR    R4,     R1                      ; 5898   00A1
        ANDI    #$00C0, R4                      ; 5899   03BC 00C0
        BNEQ    L_58B4                          ; 589B   020C 0017

        JSR     R5,     .EXEC.629               ; 589D   0004 0114 0229

        MVO     R0,     G_0359                  ; 58A0   0240 0359
        XORI    #$0080, R2                      ; 58A2   03FA 0080
        MVO@    R2,     R3                      ; 58A4   025A
        CLRR    R0                              ; 58A5   01C0
        COMR    R0                              ; 58A6   0018
        MVO     R0,     G_0173                  ; 58A7   0240 0173
        MVII    #$0001, R0                      ; 58A9   02B8 0001
        MVO     R0,     G_017A                  ; 58AB   0240 017A
        MVII    #$0005, R0                      ; 58AD   02B8 0005
        MVO     R0,     G_035B                  ; 58AF   0240 035B

        JSR     R5,     L_5FCD                  ; 58B1   0004 015C 03CD

L_58B4:
        PULR    R7                              ; 58B4   02B7

L_58B5:
        PULR    R2                              ; 58B5   02B2
        PULR    R1                              ; 58B6   02B1

        JSR     R5,     L_5E69                  ; 58B7   0004 015C 0269

        PULR    R7                              ; 58BA   02B7

        PSHR    R5                              ; 58BB   0275
        CMPI    #$0006, R0                      ; 58BC   0378 0006
        BNEQ    L_58C5                          ; 58BE   020C 0005

        JSR     R5,     L_5F38                  ; 58C0   0004 015C 0338

        B       L_58F5                          ; 58C3   0200 0030

L_58C5:
        MVII    #$0020, R5                      ; 58C5   02BD 0020
        CMP     G_0179, R5                      ; 58C7   0345 0179
        BNEQ    L_58D0                          ; 58C9   020C 0005

        JSR     R5,     L_51BB                  ; 58CB   0004 0150 01BB

        B       L_58F5                          ; 58CE   0200 0025

L_58D0:
        MOVR    R0,     R2                      ; 58D0   0082
        ADDI    #$016A, R2                      ; 58D1   02FA 016A
        MVI@    R2,     R0                      ; 58D3   0290
        XORI    #$0004, R0                      ; 58D4   03F8 0004
        MVO@    R0,     R2                      ; 58D6   0250
        CLRR    R0                              ; 58D7   01C0
        COMR    R0                              ; 58D8   0018
        MVO     R0,     G_0173                  ; 58D9   0240 0173
        MVII    #$0004, R0                      ; 58DB   02B8 0004
        MVO     R0,     G_0179                  ; 58DD   0240 0179
        MVII    #$0002, R0                      ; 58DF   02B8 0002
        MVO     R0,     G_017A                  ; 58E1   0240 017A
        MVII    #$0002, R0                      ; 58E3   02B8 0002
        MVII    #$002D, R1                      ; 58E5   02B9 002D

        JSR     R5,     X_RAND2                 ; 58E7   0004 0114 029E

        TSTR    R0                              ; 58EA   0080
        BEQ     L_58EE                          ; 58EB   0204 0001

        NEGR    R1                              ; 58ED   0021
L_58EE:
        ANDI    #$00FF, R1                      ; 58EE   03B9 00FF
        MVO     R1,     G_0359                  ; 58F0   0241 0359

        JSR     R5,     L_5DC8                  ; 58F2   0004 015C 01C8
L_58F5:
        JSR     R5,     L_5FCD                  ; 58F5   0004 015C 03CD

        PULR    R7                              ; 58F8   02B7

        PSHR    R5                              ; 58F9   0275
        MVI     G_0179, R5                      ; 58FA   0285 0179
        CMPI    #$0040, R5                      ; 58FC   037D 0040
        BNEQ    L_590C                          ; 58FE   020C 000C

        MVI     G_017A, R5                      ; 5900   0285 017A
        TSTR    R5                              ; 5902   00AD
        BEQ     L_590C                          ; 5903   0204 0007

        CMPI    #$0003, R0                      ; 5905   0378 0003
        BNEQ    L_590C                          ; 5907   020C 0003

        JSR     R5,     L_512C                  ; 5909   0004 0150 012C

L_590C:
        PULR    R7                              ; 590C   02B7

        PSHR    R5                              ; 590D   0275
        CMP     G_0173, R3                      ; 590E   0343 0173
        BEQ     L_599F                          ; 5910   0204 008D

        MVI     G_0179, R0                      ; 5912   0280 0179
        SDBD                                    ; 5914   0001
        ANDI    #$007B, R0                      ; 5915   03B8 007B 0000
        BNEQ    L_599F                          ; 5918   020C 0085

        MVI     G_017A, R0                      ; 591A   0280 017A
        TSTR    R0                              ; 591C   0080
        BEQ     L_5924                          ; 591D   0204 0005

        MVI     G_0172, R2                      ; 591F   0282 0172
        CMPR    R3,     R2                      ; 5921   015A
        BEQ     L_599F                          ; 5922   0204 007B

L_5924:
        MOVR    R3,     R2                      ; 5924   009A
        ADDI    #$016A, R2                      ; 5925   02FA 016A
        MVI@    R2,     R0                      ; 5927   0290
        ANDI    #$0020, R0                      ; 5928   03B8 0020
        BNEQ    L_599F                          ; 592A   020C 0073

        CMPI    #$0006, R3                      ; 592C   037B 0006
        BEQ     L_599F                          ; 592E   0204 006F

        MVI     G_0173, R2                      ; 5930   0282 0173
        MOVR    R3,     R0                      ; 5932   0098

        JSR     R5,     .EXEC.76C               ; 5933   0004 0114 036C

        ADDI    #$0003, R1                      ; 5936   02F9 0003
        MVI@    R1,     R0                      ; 5938   0288
        MVI     G_0358, R4                      ; 5939   0284 0358
        CMPR    R4,     R0                      ; 593B   0160
        BC      L_599F                          ; 593C   0201 0061

        CMPI    #$0003, R3                      ; 593E   037B 0003
        BGE     L_5948                          ; 5940   020D 0006

        CLRR    R0                              ; 5942   01C0
        COMR    R0                              ; 5943   0018
        MVO     R0,     G_0180                  ; 5944   0240 0180
        B       L_5955                          ; 5946   0200 000D

L_5948:
        MVI     G_0180, R0                      ; 5948   0280 0180
        TSTR    R0                              ; 594A   0080
        BEQ     L_5955                          ; 594B   0204 0008

        MVII    #$0001, R0                      ; 594D   02B8 0001

        JSR     R5,     X_RAND1                 ; 594F   0004 0114 027D

        TSTR    R0                              ; 5952   0080
        BNEQ    L_599F                          ; 5953   020C 004A

L_5955:
        CMPI    #$00FF, R2                      ; 5955   037A 00FF
        BEQ     L_595F                          ; 5957   0204 0006

        ADDI    #$016A, R2                      ; 5959   02FA 016A
        MVI@    R2,     R0                      ; 595B   0290
        ANDI    #$007F, R0                      ; 595C   03B8 007F
        MVO@    R0,     R2                      ; 595E   0250
L_595F:
        MOVR    R3,     R2                      ; 595F   009A
        ADDI    #$016A, R2                      ; 5960   02FA 016A
        MVI@    R2,     R0                      ; 5962   0290
        XORI    #$0020, R0                      ; 5963   03F8 0020
        MVO@    R0,     R2                      ; 5965   0250
        PSHR    R1                              ; 5966   0271
        ADDI    #$0003, R1                      ; 5967   02F9 0003
        MVII    #$0002, R0                      ; 5969   02B8 0002
        MVO@    R0,     R1                      ; 596B   0248
        PULR    R1                              ; 596C   02B1
        MVII    #$031F, R2                      ; 596D   02BA 031F
        CMPI    #$0003, R3                      ; 596F   037B 0003
        BLT     L_5975                          ; 5971   0205 0002

        MVII    #$0337, R2                      ; 5973   02BA 0337
L_5975:
        MVI@    R2,     R0                      ; 5975   0290
        PSHR    R0                              ; 5976   0270
        INCR    R2                              ; 5977   000A
        MVI@    R2,     R0                      ; 5978   0290
        PSHR    R0                              ; 5979   0270
        MVI@    R1,     R0                      ; 597A   0288
        MVO@    R0,     R2                      ; 597B   0250
        PULR    R0                              ; 597C   02B0
        MVO@    R0,     R1                      ; 597D   0248
        DECR    R1                              ; 597E   0011
        DECR    R2                              ; 597F   0012
        MVI@    R1,     R0                      ; 5980   0288
        MVO@    R0,     R2                      ; 5981   0250
        PULR    R0                              ; 5982   02B0
        MVO@    R0,     R1                      ; 5983   0248
        MOVR    R2,     R1                      ; 5984   0091
        SUBI    #$0002, R1                      ; 5985   0339 0002

        JSR     R5,     .EXEC.766               ; 5987   0004 0114 0366

        MVO     R0,     G_0173                  ; 598A   0240 0173
        MVO     R0,     G_0172                  ; 598C   0240 0172
        MOVR    R0,     R1                      ; 598E   0081
        ADDI    #$016A, R1                      ; 598F   02F9 016A
        MVI@    R1,     R0                      ; 5991   0288
        XORI    #$0080, R0                      ; 5992   03F8 0080
        MVO@    R0,     R1                      ; 5994   0248
        CLRR    R0                              ; 5995   01C0
        MVO     R0,     G_017A                  ; 5996   0240 017A
        MVII    #$0001, R0                      ; 5998   02B8 0001
        MVO     R0,     G_035B                  ; 599A   0240 035B

        JSR     R5,     L_5FCD                  ; 599C   0004 015C 03CD

L_599F:
        PULR    R7                              ; 599F   02B7

        PSHR    R5                              ; 59A0   0275
        MVI     G_0179, R0                      ; 59A1   0280 0179
        CMPI    #$0008, R0                      ; 59A3   0378 0008
        BEQ     L_59FD                          ; 59A5   0204 0056

        CMPI    #$0010, R0                      ; 59A7   0378 0010
        BNEQ    L_59AF                          ; 59A9   020C 0004

        JSR     R5,     L_5EDD                  ; 59AB   0004 015C 02DD

        PULR    R7                              ; 59AE   02B7

L_59AF:
        SDBD                                    ; 59AF   0001
        ANDI    #$0063, R0                      ; 59B0   03B8 0063 0000
        BNEQ    L_59FC                          ; 59B3   020C 0047

        MVI     G_0173, R0                      ; 59B5   0280 0173
        CMPI    #$00FF, R0                      ; 59B7   0378 00FF
        BEQ     L_59ED                          ; 59B9   0204 0032

        JSR     R5,     .EXEC.76C               ; 59BB   0004 0114 036C

        PSHR    R1                              ; 59BE   0271
        ADDI    #$0001, R1                      ; 59BF   02F9 0001
        MVI@    R1,     R2                      ; 59C1   028A
        MVII    #$0200, R0                      ; 59C2   02B8 0200
        SDBD                                    ; 59C4   0001
        CMPI    #$530B, R2                      ; 59C5   037A 000B 0053
        PULR    R1                              ; 59C8   02B1
        BEQ     L_59D8                          ; 59C9   0204 000D

        SDBD                                    ; 59CB   0001
        MVII    #$FE00, R0                      ; 59CC   02B8 0000 00FE
        MVI@    R1,     R2                      ; 59CF   028A
        ANDI    #$0200, R2                      ; 59D0   03BA 0200
        BNEQ    L_59D8                          ; 59D2   020C 0004

        SDBD                                    ; 59D4   0001
        MVII    #$0700, R0                      ; 59D5   02B8 0000 0007
L_59D8:
        ADDI    #$0002, R1                      ; 59D8   02F9 0002
        ADD@    R1,     R0                      ; 59DA   02C8
        MVII    #$0357, R4                      ; 59DB   02BC 0357
        MVO@    R0,     R4                      ; 59DD   0260
        INCR    R1                              ; 59DE   0009
        MVI@    R1,     R0                      ; 59DF   0288
        SDBD                                    ; 59E0   0001
        ADDI    #$0500, R0                      ; 59E1   02F8 0000 0005
        MVO@    R0,     R4                      ; 59E4   0260
        INCR    R1                              ; 59E5   0009
        MVI@    R1,     R0                      ; 59E6   0288
        MVO     R0,     G_0359                  ; 59E7   0240 0359
        MVII    #$0001, R0                      ; 59E9   02B8 0001
        MVO     R0,     G_035B                  ; 59EB   0240 035B
L_59ED:
        MVI     G_0179, R0                      ; 59ED   0280 0179
        CMPI    #$0001, R0                      ; 59EF   0378 0001
        BEQ     L_59FC                          ; 59F1   0204 0009

        MVI     G_017A, R0                      ; 59F3   0280 017A
        CMPI    #$0001, R0                      ; 59F5   0378 0001
        BNEQ    L_59FC                          ; 59F7   020C 0003

        CLRR    R0                              ; 59F9   01C0
        MVO     R0,     G_017A                  ; 59FA   0240 017A
L_59FC:
        PULR    R7                              ; 59FC   02B7

L_59FD:
        MVI     G_0176, R0                      ; 59FD   0280 0176
        CMPI    #$0002, R0                      ; 59FF   0378 0002
        BLT     L_5A07                          ; 5A01   0205 0004

        JSR     R5,     L_52C0                  ; 5A03   0004 0150 02C0

        PULR    R7                              ; 5A06   02B7

L_5A07:
        CLRR    R1                              ; 5A07   01C9

        JSR     R5,     L_5CF5                  ; 5A08   0004 015C 00F5

        BC      L_5A0F                          ; 5A0B   0201 0002

        MVII    #$0003, R1                      ; 5A0D   02B9 0003
L_5A0F:
        MVO     R1,     G_0173                  ; 5A0F   0241 0173
        MVO     R1,     G_0172                  ; 5A11   0241 0172

        JSR     R5,     L_559B                  ; 5A13   0004 0154 019B
        JSR     R5,     L_5D29                  ; 5A16   0004 015C 0129

        PULR    R7                              ; 5A19   02B7

L_5A1A:
        PSHR    R5                              ; 5A1A   0275
        MVI     G_0179, R0                      ; 5A1B   0280 0179
        SDBD                                    ; 5A1D   0001
        ANDI    #$0021, R0                      ; 5A1E   03B8 0021 0000
        BNEQ    L_5A5D                          ; 5A21   020C 003A

        MVI     G_0179, R0                      ; 5A23   0280 0179
        SDBD                                    ; 5A25   0001
        ANDI    #$004A, R0                      ; 5A26   03B8 004A 0000
        BNEQ    L_5A67                          ; 5A29   020C 003C

        MVI     G_0357, R2                      ; 5A2B   0282 0357
        MVI     G_0359, R0                      ; 5A2D   0280 0359

        JSR     R5,     X_UNPK_BYTES            ; 5A2F   0004 0114 0357

        SDBD                                    ; 5A32   0001
        CMPI    #$4000, R2                      ; 5A33   037A 0000 0040
        BC      L_5A49                          ; 5A36   0201 0011

        MVI     G_0169, R5                      ; 5A38   0285 0169
        TSTR    R5                              ; 5A3A   00AD
        BEQ     L_5A5D                          ; 5A3B   0204 0020

        TSTR    R0                              ; 5A3D   0080
        BNEQ    L_5A45                          ; 5A3E   020C 0005

        MVII    #$0032, R0                      ; 5A40   02B8 0032
        NEGR    R0                              ; 5A42   0020
        B       L_5A5E                          ; 5A43   0200 0019
L_5A45:
        BPL     L_5A5D                          ; 5A45   0203 0016
        B       L_5A5E                          ; 5A47   0200 0015

L_5A49:
        SDBD                                    ; 5A49   0001
        CMPI    #$7000, R2                      ; 5A4A   037A 0000 0070
        BNC     L_5A5D                          ; 5A4D   0209 000E

        MVI     G_0168, R5                      ; 5A4F   0285 0168
        TSTR    R5                              ; 5A51   00AD
        BEQ     L_5A5D                          ; 5A52   0204 0009

        TSTR    R0                              ; 5A54   0080
        BNEQ    L_5A5B                          ; 5A55   020C 0004

        MVII    #$0032, R0                      ; 5A57   02B8 0032
        B       L_5A5E                          ; 5A59   0200 0003
L_5A5B:
        BPL     L_5A5E                          ; 5A5B   0203 0001

L_5A5D:
        CLRR    R0                              ; 5A5D   01C0
L_5A5E:
        NEGR    R0                              ; 5A5E   0020
        MVO     R0,     G_015D                  ; 5A5F   0240 015D
        TSTR    R0                              ; 5A61   0080
        BNEQ    L_5A68                          ; 5A62   020C 0004

        JSR     R5,     L_5253                  ; 5A64   0004 0150 0253

L_5A67:
        PULR    R7                              ; 5A67   02B7

L_5A68:
        JSR     R5,     L_52A2                  ; 5A68   0004 0150 02A2

        PULR    R7                              ; 5A6B   02B7

L_5A6C:
        PSHR    R5                              ; 5A6C   0275
        MVI     G_0173, R0                      ; 5A6D   0280 0173
        CMPI    #$00FF, R0                      ; 5A6F   0378 00FF
        BNEQ    L_5A85                          ; 5A71   020C 0012

        MVI     G_0359, R0                      ; 5A73   0280 0359

        JSR     R5,     X_UNPK_BYTES            ; 5A75   0004 0114 0357

        MOVR    R0,     R2                      ; 5A78   0082
        MOVR    R1,     R3                      ; 5A79   008B
        SAR     R0,     2                       ; 5A7A   006C
        SAR     R1,     2                       ; 5A7B   006D
        NEGR    R0                              ; 5A7C   0020
        NEGR    R1                              ; 5A7D   0021
        ADDR    R2,     R0                      ; 5A7E   00D0
        ADDR    R3,     R1                      ; 5A7F   00D9

        JSR     R5,     X_PACK_BYTES            ; 5A80   0004 0114 034F

        MVO     R0,     G_0359                  ; 5A83   0240 0359
L_5A85:
        PULR    R7                              ; 5A85   02B7

L_5A86:
        PSHR    R5                              ; 5A86   0275

        JSR     R5,     .EXEC.777               ; 5A87   0004 0114 0377

        ADDI    #$0004, R3                      ; 5A8A   02FB 0004
        MVII    #$0357, R4                      ; 5A8C   02BC 0357

        JSR     R5,     .EXEC.784               ; 5A8E   0004 0114 0384
        JSR     R5,     .EXEC.A2F               ; 5A91   0004 0118 022F

        MOVR    R1,     R0                      ; 5A94   0088
        PULR    R7                              ; 5A95   02B7

L_5A96:
        PSHR    R5                              ; 5A96   0275
        MVI     G_0359, R0                      ; 5A97   0280 0359

        JSR     R5,     X_UNPK_BYTES            ; 5A99   0004 0114 0357
        JSR     R5,     .EXEC.A2F               ; 5A9C   0004 0118 022F

        MOVR    R1,     R0                      ; 5A9F   0088
        PULR    R7                              ; 5AA0   02B7

L_5AA1:
        PSHR    R5                              ; 5AA1   0275
        MVI     G_0359, R0                      ; 5AA2   0280 0359

        JSR     R5,     X_UNPK_BYTES            ; 5AA4   0004 0114 0357

        TSTR    R0                              ; 5AA7   0080
        BPL     L_5AAB                          ; 5AA8   0203 0001

        NEGR    R0                              ; 5AAA   0020
L_5AAB:
        TSTR    R1                              ; 5AAB   0089
        BPL     L_5AAF                          ; 5AAC   0203 0001

        NEGR    R1                              ; 5AAE   0021
L_5AAF:
        MOVR    R0,     R2                      ; 5AAF   0082
        CMPR    R0,     R1                      ; 5AB0   0141
        BLT     L_5AB4                          ; 5AB1   0205 0001

        MOVR    R1,     R2                      ; 5AB3   008A
L_5AB4:
        ADDR    R1,     R0                      ; 5AB4   00C8
        ADDR    R2,     R0                      ; 5AB5   00D0
        SAR     R0,     1                       ; 5AB6   0068
        PULR    R7                              ; 5AB7   02B7

L_5AB8:
        PSHR    R5                              ; 5AB8   0275
        MVI     G_0179, R0                      ; 5AB9   0280 0179
        CMPI    #$0004, R0                      ; 5ABB   0378 0004
        BNEQ    L_5ACF                          ; 5ABD   020C 0010

        MVI     G_0173, R0                      ; 5ABF   0280 0173
        CMPI    #$00FF, R0                      ; 5AC1   0378 00FF
        BNEQ    L_5ACF                          ; 5AC3   020C 000A

        MVII    #$0325, R1                      ; 5AC5   02B9 0325

        JSR     R5,     L_5AD0                  ; 5AC7   0004 0158 02D0

        MVII    #$033D, R1                      ; 5ACA   02B9 033D

        JSR     R5,     L_5AD0                  ; 5ACC   0004 0158 02D0

L_5ACF:
        PULR    R7                              ; 5ACF   02B7

L_5AD0:
        PSHR    R5                              ; 5AD0   0275
        MVII    #$0002, R2                      ; 5AD1   02BA 0002
L_5AD3:
        PSHR    R2                              ; 5AD3   0272
        PSHR    R1                              ; 5AD4   0271

        JSR     R5,     L_5AA1                  ; 5AD5   0004 0158 02A1

        SDBD                                    ; 5AD8   0001
        MVII    #$0064, R1                      ; 5AD9   02B9 0064 0000
        SLL     R0,     2                       ; 5ADC   004C
        SLL     R0,     1                       ; 5ADD   0048
        CMPR    R0,     R1                      ; 5ADE   0141
        BGT     L_5B27                          ; 5ADF   020E 0046

        MVII    #$0002, R2                      ; 5AE1   02BA 0002
L_5AE3:
        SAR     R0,     1                       ; 5AE3   0068
        CMPR    R0,     R1                      ; 5AE4   0141
        BGE     L_5AEA                          ; 5AE5   020D 0003

        DECR    R2                              ; 5AE7   0012
        BNEQ    L_5AE3                          ; 5AE8   022C 0006

L_5AEA:
        ADDI    #$0002, R2                      ; 5AEA   02FA 0002
        PSHR    R2                              ; 5AEC   0272

        JSR     R5,     L_5A96                  ; 5AED   0004 0158 0296

        PULR    R2                              ; 5AF0   02B2
        PULR    R1                              ; 5AF1   02B1
        PSHR    R1                              ; 5AF2   0271
        PSHR    R2                              ; 5AF3   0272
        PSHR    R0                              ; 5AF4   0270

        JSR     R5,     L_5A86                  ; 5AF5   0004 0158 0286
        JSR     R5,     L_5B3C                  ; 5AF8   0004 0158 033C

        CMP@    R6,     R0                      ; 5AFB   0370
        BGT     L_5B2E                          ; 5AFC   020E 0030

        TSTR    R0                              ; 5AFE   0080
        BEQ     L_5B27                          ; 5AFF   0204 0026

        JSR     R5,     L_5A96                  ; 5B01   0004 0158 0296

        ADDI    #$0004, R0                      ; 5B04   02F8 0004
        ANDI    #$000F, R0                      ; 5B06   03B8 000F
        PULR    R1                              ; 5B08   02B1
        PSHR    R1                              ; 5B09   0271
        PSHR    R0                              ; 5B0A   0270
        PSHR    R0                              ; 5B0B   0270

        JSR     R5,     L_5A86                  ; 5B0C   0004 0158 0286
        JSR     R5,     L_5B3C                  ; 5B0F   0004 0158 033C

        PULR    R1                              ; 5B12   02B1
        CMPI    #$0004, R0                      ; 5B13   0378 0004
        BGT     L_5B1B                          ; 5B15   020E 0004

        ADDI    #$0008, R1                      ; 5B17   02F9 0008
        ANDI    #$000F, R1                      ; 5B19   03B9 000F
L_5B1B:
        MVII    #$0019, R0                      ; 5B1B   02B8 0019

        JSR     R5,     .EXEC.629               ; 5B1D   0004 0114 0229

        PULR    R1                              ; 5B20   02B1
        PSHR    R1                              ; 5B21   0271
        ADDI    #$0004, R1                      ; 5B22   02F9 0004
        MVO@    R0,     R1                      ; 5B24   0248
        B       L_5B34                          ; 5B25   0200 000D

L_5B27:
        PULR    R1                              ; 5B27   02B1
        PSHR    R1                              ; 5B28   0271

        JSR     R5,     L_5B9C                  ; 5B29   0004 0158 039C

        B       L_5B34                          ; 5B2C   0200 0006

L_5B2E:
        PULR    R1                              ; 5B2E   02B1
        PSHR    R1                              ; 5B2F   0271
        ADDI    #$0004, R1                      ; 5B30   02F9 0004
        CLRR    R0                              ; 5B32   01C0
        MVO@    R0,     R1                      ; 5B33   0248
L_5B34:
        PULR    R1                              ; 5B34   02B1
        PULR    R2                              ; 5B35   02B2
        ADDI    #$0008, R1                      ; 5B36   02F9 0008
        DECR    R2                              ; 5B38   0012
        BNEQ    L_5AD3                          ; 5B39   022C 0067
        PULR    R7                              ; 5B3B   02B7

L_5B3C:
        SUB@    R6,     R0                      ; 5B3C   0330
        BPL     L_5B40                          ; 5B3D   0203 0001

        NEGR    R0                              ; 5B3F   0020
L_5B40:
        CMPI    #$0008, R0                      ; 5B40   0378 0008
        BLE     L_5B47                          ; 5B42   0206 0003

        SUBI    #$0010, R0                      ; 5B44   0338 0010
        NEGR    R0                              ; 5B46   0020
L_5B47:
        MOVR    R5,     R7                      ; 5B47   00AF

L_5B48:
        PSHR    R5                              ; 5B48   0275
        MVII    #$031F, R1                      ; 5B49   02B9 031F
        CLRR    R2                              ; 5B4B   01D2
L_5B4C:
        PSHR    R1                              ; 5B4C   0271
        PSHR    R2                              ; 5B4D   0272
        MVI@    R1,     R0                      ; 5B4E   0288
        SDBD                                    ; 5B4F   0001
        CMPI    #$1000, R0                      ; 5B50   0378 0000 0010
        BC      L_5B5A                          ; 5B53   0201 0005

        JSR     R5,     L_5B6D                  ; 5B55   0004 0158 036D

        B       L_5B63                          ; 5B58   0200 0009

L_5B5A:
        SDBD                                    ; 5B5A   0001
        CMPI    #$A800, R0                      ; 5B5B   0378 0000 00A8
        BNC     L_5B63                          ; 5B5E   0209 0003

        JSR     R5,     L_5B73                  ; 5B60   0004 0158 0373

L_5B63:
        PULR    R2                              ; 5B63   02B2
        PULR    R1                              ; 5B64   02B1
        INCR    R2                              ; 5B65   000A
        ADDI    #$0008, R1                      ; 5B66   02F9 0008
        CMPI    #$034F, R1                      ; 5B68   0379 034F
        BLT     L_5B4C                          ; 5B6A   0225 001F
        PULR    R7                              ; 5B6C   02B7

L_5B6D:
        SDBD                                    ; 5B6D   0001
        MVII    #$10A7, R3                      ; 5B6E   02BB 00A7 0010
        B       L_5B77                          ; 5B71   0200 0004

L_5B73:
        SDBD                                    ; 5B73   0001
        MVII    #$A710, R3                      ; 5B74   02BB 0010 00A7
L_5B77:
        MVI     G_0179, R0                      ; 5B77   0280 0179
        SDBD                                    ; 5B79   0001
        ANDI    #$0035, R0                      ; 5B7A   03B8 0035 0000
        BEQ     L_5B99                          ; 5B7D   0204 001A

        MVI     G_0167, R0                      ; 5B7F   0280 0167
        CMPI    #$0006, R0                      ; 5B81   0378 0006
        BLT     L_5B9A                          ; 5B83   0205 0015

        CMPI    #$0022, R0                      ; 5B85   0378 0022
        BGT     L_5B9A                          ; 5B87   020E 0011

        CMP     G_0173, R2                      ; 5B89   0342 0173
        BEQ     L_5B9A                          ; 5B8B   0204 000D

        MVI     G_0357, R0                      ; 5B8D   0280 0357
        SUB@    R1,     R0                      ; 5B8F   0308
        BPL     L_5B93                          ; 5B90   0203 0001

        NEGR    R0                              ; 5B92   0020
L_5B93:
        SDBD                                    ; 5B93   0001
        CMPI    #$5000, R0                      ; 5B94   0378 0000 0050
        BLT     L_5B9A                          ; 5B97   0205 0001

L_5B99:
        SWAP    R3,     1                       ; 5B99   0043
L_5B9A:
        MVO@    R3,     R1                      ; 5B9A   024B
        MOVR    R5,     R7                      ; 5B9B   00AF

L_5B9C:
        PSHR    R5                              ; 5B9C   0275
        PSHR    R1                              ; 5B9D   0271
        MVII    #$0007, R0                      ; 5B9E   02B8 0007

        JSR     R5,     .EXEC.772               ; 5BA0   0004 0114 0372

        SUBI    #$0004, R3                      ; 5BA3   033B 0004
        SUBI    #$0004, R2                      ; 5BA5   033A 0004
        SWAP    R2,     1                       ; 5BA7   0042
        XORR    R3,     R2                      ; 5BA8   01DA
        MVII    #$0019, R3                      ; 5BA9   02BB 0019
        PULR    R1                              ; 5BAB   02B1

        JSR     R5,     .EXEC.9A3               ; 5BAC   0004 0118 01A3

        ADDI    #$0006, R1                      ; 5BAF   02F9 0006
        PULR    R7                              ; 5BB1   02B7

L_5BB2:
        PSHR    R5                              ; 5BB2   0275
        MVI     G_0179, R0                      ; 5BB3   0280 0179
        CMPI    #$0004, R0                      ; 5BB5   0378 0004
        BNEQ    L_5BE1                          ; 5BB7   020C 0028

        MVI     G_0173, R0                      ; 5BB9   0280 0173
        CMPI    #$00FF, R0                      ; 5BBB   0378 00FF
        BEQ     L_5BE1                          ; 5BBD   0204 0022

        MVII    #$0329, R2                      ; 5BBF   02BA 0329
L_5BC1:
        CMPI    #$0339, R2                      ; 5BC1   037A 0339
        BEQ     L_5BDB                          ; 5BC3   0204 0016

        CLRR    R0                              ; 5BC5   01C0
        MVO@    R0,     R2                      ; 5BC6   0250
        MVII    #$0001, R0                      ; 5BC7   02B8 0001

        JSR     R5,     X_RAND1                 ; 5BC9   0004 0114 027D

        TSTR    R0                              ; 5BCC   0080
        BNEQ    L_5BDB                          ; 5BCD   020C 000C

        MVII    #$0010, R0                      ; 5BCF   02B8 0010

        JSR     R5,     X_RAND2                 ; 5BD1   0004 0114 029E

        MOVR    R0,     R1                      ; 5BD4   0081
        MVII    #$0019, R0                      ; 5BD5   02B8 0019

        JSR     R5,     .EXEC.629               ; 5BD7   0004 0114 0229

        MVO@    R0,     R2                      ; 5BDA   0250
L_5BDB:
        ADDI    #$0008, R2                      ; 5BDB   02FA 0008
        CMPI    #$0351, R2                      ; 5BDD   037A 0351
        BLT     L_5BC1                          ; 5BDF   0225 001F
L_5BE1:
        PULR    R7                              ; 5BE1   02B7

L_5BE2:
        PSHR    R5                              ; 5BE2   0275
        MVII    #$031D, R1                      ; 5BE3   02B9 031D
L_5BE5:
        PSHR    R1                              ; 5BE5   0271
        MVI     G_0167, R0                      ; 5BE6   0280 0167
        CMPI    #$0022, R0                      ; 5BE8   0378 0022
        BLT     L_5BFA                          ; 5BEA   0205 000E

        JSR     R5,     L_5CCF                  ; 5BEC   0004 015C 00CF
        DECLE   $0002,  $0000,  $00FF,  $00FF   ; 5BEF   0002 0000 00FF 00FF

        MOVR    R3,     R6                      ; 5BF3   009E
        ADDR    R7,     R4                      ; 5BF4   00FC
        BNC     L_5BFA                          ; 5BF5   0209 0003

        JSR     R5,     L_5CC3                  ; 5BF7   0004 015C 00C3

L_5BFA:
        PULR    R1                              ; 5BFA   02B1
        PSHR    R1                              ; 5BFB   0271
        MVI     G_0167, R0                      ; 5BFC   0280 0167
        CMPI    #$0007, R0                      ; 5BFE   0378 0007
        BGT     L_5C10                          ; 5C00   020E 000E

        JSR     R5,     L_5CCF                  ; 5C02   0004 015C 00CF
        DECLE   $0002,  $0000,  $0001,  $0000   ; 5C05   0002 0000 0001 0000
        DECLE   $0070,  $00FF                   ; 5C09   0070 00FF

        BC      L_5C10                          ; 5C0B   0201 0003

        JSR     R5,     L_5CC3                  ; 5C0D   0004 015C 00C3

L_5C10:
        PULR    R1                              ; 5C10   02B1
        ADDI    #$0008, R1                      ; 5C11   02F9 0008
        CMPI    #$034D, R1                      ; 5C13   0379 034D
        BLE     L_5BE5                          ; 5C15   0226 0031

        MVI     G_0179, R0                      ; 5C17   0280 0179
        CMPI    #$0008, R0                      ; 5C19   0378 0008
        BEQ     L_5CC2                          ; 5C1B   0204 00A5

        MVI     G_0179, R0                      ; 5C1D   0280 0179
        ANDI    #$0004, R0                      ; 5C1F   03B8 0004
        BEQ     L_5CC2                          ; 5C21   0204 009F

        MVI     G_0173, R0                      ; 5C23   0280 0173
        CMPI    #$00FF, R0                      ; 5C25   0378 00FF
        BNEQ    L_5C82                          ; 5C27   020C 0059

        MVII    #$0355, R1                      ; 5C29   02B9 0355

        JSR     R5,     L_5CCF                  ; 5C2B   0004 015C 00CF
        DECLE   $0002,  $0000,  $0001,  $0000   ; 5C2E   0002 0000 0001 0000
        DECLE   $0074,  $00FF                   ; 5C32   0074 00FF

        BNC     L_5C43                          ; 5C34   0209 000D

        MVII    #$0355, R1                      ; 5C36   02B9 0355

        JSR     R5,     L_5CCF                  ; 5C38   0004 015C 00CF
        DECLE   $0002,  $0000,  $00FF,  $00FF   ; 5C3B   0002 0000 00FF 00FF

        MOVR    R1,     R6                      ; 5C3F   008E
        ADDR    R7,     R4                      ; 5C40   00FC
        BNC     L_5C82                          ; 5C41   0209 003F

L_5C43:
        MVII    #$0355, R1                      ; 5C43   02B9 0355

        JSR     R5,     L_5D02                  ; 5C45   0004 015C 0102

        ADCR    R4                              ; 5C48   002C
        RSWD    R6                              ; 5C49   003E
        BNC     L_5C50                          ; 5C4A   0209 0004

        JSR     R5,     L_5D90                  ; 5C4C   0004 015C 0190

        PULR    R7                              ; 5C4F   02B7

L_5C50:
        JSR     R5,     X_PLAY_WHST1            ; 5C50   0004 011C 031B

        CLRR    R1                              ; 5C53   01C9
        MVI     G_0172, R0                      ; 5C54   0280 0172
        TSTR    R0                              ; 5C56   0080
        BEQ     L_5C5A                          ; 5C57   0204 0001

        INCR    R1                              ; 5C59   0009

L_5C5A:
        JSR     R5,     L_5CF5                  ; 5C5A   0004 015C 00F5

        ADCR    R1                              ; 5C5D   0029
        DECR    R1                              ; 5C5E   0011
        BEQ     L_5C65                          ; 5C5F   0204 0004

        JSR     R5,     L_5EC6                  ; 5C61   0004 015C 02C6

        PULR    R7                              ; 5C64   02B7

L_5C65:
        MVII    #$0020, R0                      ; 5C65   02B8 0020
        CMP     G_0179, R0                      ; 5C67   0340 0179
        BEQ     L_5CC2                          ; 5C69   0204 0057

        MVO     R0,     G_0179                  ; 5C6B   0240 0179
        SDBD                                    ; 5C6D   0001
        MVII    #$5C7E, R4                      ; 5C6E   02BC 007E 005C
        MVI     G_0167, R0                      ; 5C71   0280 0167
        CMPI    #$0015, R0                      ; 5C73   0378 0015
        BLT     L_5C79                          ; 5C75   0205 0002

        ADDI    #$0002, R4                      ; 5C77   02FC 0002

L_5C79:
        JSR     R5,     L_5F60                  ; 5C79   0004 015C 0360

        B       L_5C98                          ; 5C7C   0200 001A

        RSWD    R6                              ; 5C7E   003E
        DECR    R5                              ; 5C7F   0015
        CLRR    R0                              ; 5C80   01C0
        DECR    R5                              ; 5C81   0015
L_5C82:
        MVI     G_0179, R0                      ; 5C82   0280 0179
        CMPI    #$0001, R0                      ; 5C84   0378 0001
        BEQ     L_5CC2                          ; 5C86   0204 003A

        MVII    #$0355, R1                      ; 5C88   02B9 0355

        JSR     R5,     L_5D02                  ; 5C8A   0004 015C 0102

        DECR    R2                              ; 5C8D   0012
        SLLC    R1,     2                       ; 5C8E   005D
        BC      L_5CC2                          ; 5C8F   0201 0031

        JSR     R5,     X_PLAY_WHST1            ; 5C91   0004 011C 031B

        MVII    #$0001, R0                      ; 5C94   02B8 0001
        MVO     R0,     G_0179                  ; 5C96   0240 0179
L_5C98:
        CLRR    R0                              ; 5C98   01C0
        MVO     R0,     G_017A                  ; 5C99   0240 017A
        MVO     R0,     G_0359                  ; 5C9B   0240 0359

        JSR     R5,     L_5F6E                  ; 5C9D   0004 015C 036E

        MVII    #$0007, R0                      ; 5CA0   02B8 0007

        JSR     R5,     .EXEC.772               ; 5CA2   0004 0114 0372

        SUBI    #$0006, R3                      ; 5CA5   033B 0006
        SWAP    R2,     1                       ; 5CA7   0042
        XORR    R3,     R2                      ; 5CA8   01DA
        MVII    #$0019, R3                      ; 5CA9   02BB 0019
        MVII    #$031D, R1                      ; 5CAB   02B9 031D
        MVI     G_0172, R0                      ; 5CAD   0280 0172
        CMPI    #$0003, R0                      ; 5CAF   0378 0003
        BGE     L_5CB5                          ; 5CB1   020D 0002

        MVII    #$0335, R1                      ; 5CB3   02B9 0335

L_5CB5:
        JSR     R5,     .EXEC.9A8               ; 5CB5   0004 0118 01A8
        JSR     R5,     .EXEC.766               ; 5CB8   0004 0114 0366

        ADDI    #$016A, R0                      ; 5CBB   02F8 016A
        MOVR    R0,     R1                      ; 5CBD   0081
        MVI@    R1,     R0                      ; 5CBE   0288
        XORI    #$0002, R0                      ; 5CBF   03F8 0002
        MVO@    R0,     R1                      ; 5CC1   0248
L_5CC2:
        PULR    R7                              ; 5CC2   02B7

L_5CC3:
        MVI     G_0167, R2                      ; 5CC3   0282 0167
        SLL     R2,     2                       ; 5CC5   004E
        SLL     R2,     1                       ; 5CC6   004A
        SUBR    R2,     R0                      ; 5CC7   0110
        PULR    R1                              ; 5CC8   02B1
        PSHR    R1                              ; 5CC9   0271
        ADDI    #$0002, R1                      ; 5CCA   02F9 0002
        SWAP    R0,     1                       ; 5CCC   0040
        MVO@    R0,     R1                      ; 5CCD   0248
        MOVR    R5,     R7                      ; 5CCE   00AF

L_5CCF:
        MOVR    R5,     R4                      ; 5CCF   00AC

        JSR     R5,     .EXEC.777               ; 5CD0   0004 0114 0377

        MVI     G_0167, R1                      ; 5CD3   0281 0167
        SLL     R1,     2                       ; 5CD5   004D
        SLL     R1,     1                       ; 5CD6   0049
        SDBD                                    ; 5CD7   0001
        MVI@    R4,     R0                      ; 5CD8   02A0
        PSHR    R0                              ; 5CD9   0270
        ADDR    R2,     R1                      ; 5CDA   00D1

        JSR     R5,     X_MPY                   ; 5CDB   0004 011C 01DC

        MOVR    R3,     R1                      ; 5CDE   0099
        SDBD                                    ; 5CDF   0001
        MVI@    R4,     R0                      ; 5CE0   02A0
        MOVR    R2,     R3                      ; 5CE1   0093

        JSR     R5,     X_MPY                   ; 5CE2   0004 011C 01DC

        SDBD                                    ; 5CE5   0001
        ADD@    R4,     R2                      ; 5CE6   02E2
        MOVR    R2,     R1                      ; 5CE7   0091
        ADDR    R2,     R3                      ; 5CE8   00D3
        PULR    R2                              ; 5CE9   02B2
        NEGR    R1                              ; 5CEA   0021

        JSR     R5,     X_DIV                   ; 5CEB   0004 011C 01FB

        TSTR    R3                              ; 5CEE   009B
        BMI     L_5CF3                          ; 5CEF   020B 0002

        SETC                                    ; 5CF1   0007
        MOVR    R4,     R7                      ; 5CF2   00A7

L_5CF3:
        CLRC                                    ; 5CF3   0006
        MOVR    R4,     R7                      ; 5CF4   00A7

L_5CF5:
        PSHR    R5                              ; 5CF5   0275
        MVI     G_0167, R5                      ; 5CF6   0285 0167
        CLRR    R0                              ; 5CF8   01C0
        CMPI    #$0015, R5                      ; 5CF9   037D 0015
        BGT     L_5CFE                          ; 5CFB   020E 0001

        INCR    R0                              ; 5CFD   0008
L_5CFE:
        XOR     G_0176, R0                      ; 5CFE   03C0 0176
        SARC    R0,     1                       ; 5D00   0078
        PULR    R7                              ; 5D01   02B7

L_5D02:
        MOVR    R5,     R4                      ; 5D02   00AC

        JSR     R5,     .EXEC.777               ; 5D03   0004 0114 0377

        MVI@    R4,     R0                      ; 5D06   02A0
        CMPR    R0,     R3                      ; 5D07   0143
        BLT     L_5D10                          ; 5D08   0205 0006

        MVI@    R4,     R0                      ; 5D0A   02A0
        CMPR    R0,     R3                      ; 5D0B   0143
        BGT     L_5D11                          ; 5D0C   020E 0003

        SETC                                    ; 5D0E   0007
        MOVR    R4,     R7                      ; 5D0F   00A7

L_5D10:
        INCR    R4                              ; 5D10   000C
L_5D11:
        CLRC                                    ; 5D11   0006
        MOVR    R4,     R7                      ; 5D12   00A7

L_5D13:
        PSHR    R5                              ; 5D13   0275
        SDBD                                    ; 5D14   0001
        ADDI    #$5D78, R4                      ; 5D15   02FC 0078 005D
        MVII    #$0003, R5                      ; 5D18   02BD 0003
        MVII    #$0019, R3                      ; 5D1A   02BB 0019
L_5D1C:
        SDBD                                    ; 5D1C   0001
        MVI@    R4,     R2                      ; 5D1D   02A2
        PSHR    R5                              ; 5D1E   0275

        JSR     R5,     .EXEC.9AD               ; 5D1F   0004 0118 01AD

        SLR     R3,     1                       ; 5D22   0063
        INCR    R0                              ; 5D23   0008
        PULR    R5                              ; 5D24   02B5
        DECR    R5                              ; 5D25   0015
        BNEQ    L_5D1C                          ; 5D26   022C 000B
        PULR    R7                              ; 5D28   02B7

L_5D29:
        PSHR    R5                              ; 5D29   0275
        MVII    #$0002, R0                      ; 5D2A   02B8 0002
        MVO     R0,     G_0179                  ; 5D2C   0240 0179
        CLRR    R0                              ; 5D2E   01C0
        MVO     R0,     G_017A                  ; 5D2F   0240 017A
        MVO     R0,     G_0359                  ; 5D31   0240 0359
        MVII    #$0005, R0                      ; 5D33   02B8 0005

        JSR     R5,     X_PLAY_CHEER1           ; 5D35   0004 011C 02D5

        MVII    #$0054, R0                      ; 5D38   02B8 0054
        SWAP    R0,     1                       ; 5D3A   0040
        MVO     R0,     G_0357                  ; 5D3B   0240 0357
        MVII    #$0034, R0                      ; 5D3D   02B8 0034
        SWAP    R0,     1                       ; 5D3F   0040
        MVO     R0,     G_0358                  ; 5D40   0240 0358
        MVI     G_0355, R0                      ; 5D42   0280 0355
        SDBD                                    ; 5D44   0001
        XORI    #$1000, R0                      ; 5D45   03F8 0000 0010
        MVO     R0,     G_0355                  ; 5D48   0240 0355
        MVII    #$0003, R0                      ; 5D4A   02B8 0003
        MVI     G_0173, R1                      ; 5D4C   0281 0173
        CMPI    #$0003, R1                      ; 5D4E   0379 0003
        BLT     L_5D53                          ; 5D50   0205 0001

        SWAP    R0,     1                       ; 5D52   0040

L_5D53:
        JSR     R5,     X_UNPK_BYTES            ; 5D53   0004 0114 0357

        PSHR    R1                              ; 5D56   0271
        PSHR    R0                              ; 5D57   0270

        JSR     R5,     L_5D74                  ; 5D58   0004 015C 0174

        CLRR    R4                              ; 5D5B   01E4
        BNC     L_5D60                          ; 5D5C   0209 0002

        MVII    #$0006, R4                      ; 5D5E   02BC 0006
L_5D60:
        PULR    R0                              ; 5D60   02B0
        PSHR    R4                              ; 5D61   0274

        JSR     R5,     L_5D13                  ; 5D62   0004 015C 0113

        PULR    R4                              ; 5D65   02B4
        ADDI    #$000C, R4                      ; 5D66   02FC 000C
        PULR    R0                              ; 5D68   02B0

        JSR     R5,     L_5D13                  ; 5D69   0004 015C 0113

        MVII    #$0006, R0                      ; 5D6C   02B8 0006
        MVO     R0,     G_017B                  ; 5D6E   0240 017B

        JSR     R5,     L_5253                  ; 5D70   0004 0150 0253

        PULR    R7                              ; 5D73   02B7

L_5D74:
        XOR     G_0176, R0                      ; 5D74   03C0 0176
        SARC    R0,     1                       ; 5D76   0078
        MOVR    R5,     R7                      ; 5D77   00AF

        GSWD    R0                              ; 5D78   0030
        SLL     R0,     1                       ; 5D79   0048
        COMR    R4                              ; 5D7A   001C
        SLL     R0,     1                       ; 5D7B   0048
        RSWD    R6                              ; 5D7C   003E
        SLL     R0,     1                       ; 5D7D   0048
        GSWD    R0                              ; 5D7E   0030
        SLLC    R0,     1                       ; 5D7F   0058
        COMR    R4                              ; 5D80   001C
        SLLC    R0,     1                       ; 5D81   0058
        RSWD    R6                              ; 5D82   003E
        SLLC    R0,     1                       ; 5D83   0058
        GSWD    R0                              ; 5D84   0030
        TSTR    R0                              ; 5D85   0080
        COMR    R4                              ; 5D86   001C
        SAR     R0,     1                       ; 5D87   0068
        RSWD    R6                              ; 5D88   003E
        SAR     R0,     1                       ; 5D89   0068
        GSWD    R0                              ; 5D8A   0030
        ADCR    R1                              ; 5D8B   0029
        COMR    R4                              ; 5D8C   001C
        SWAP    R0,     1                       ; 5D8D   0040
        RSWD    R6                              ; 5D8E   003E
        SWAP    R0,     1                       ; 5D8F   0040
L_5D90:
        PSHR    R5                              ; 5D90   0275
        MVII    #$0008, R0                      ; 5D91   02B8 0008
        CMP     G_0179, R0                      ; 5D93   0340 0179
        BEQ     L_5DC7                          ; 5D95   0204 0030

        MVO     R0,     G_0179                  ; 5D97   0240 0179
        CLRR    R0                              ; 5D99   01C0
        MVO     R0,     G_017A                  ; 5D9A   0240 017A
        MVO     R0,     G_0359                  ; 5D9C   0240 0359

        JSR     R5,     L_5F6E                  ; 5D9E   0004 015C 036E

        MVI     G_0355, R0                      ; 5DA1   0280 0355
        SDBD                                    ; 5DA3   0001
        XORI    #$1000, R0                      ; 5DA4   03F8 0000 0010
        MVO     R0,     G_0355                  ; 5DA7   0240 0355

        JSR     R5,     L_5DC8                  ; 5DA9   0004 015C 01C8

        MVII    #$0028, R0                      ; 5DAC   02B8 0028
        MVO     R0,     G_035B                  ; 5DAE   0240 035B
        MVII    #$0177, R1                      ; 5DB0   02B9 0177

        JSR     R5,     L_5CF5                  ; 5DB2   0004 015C 00F5

        BNC     L_5DB9                          ; 5DB5   0209 0002

        MVII    #$0178, R1                      ; 5DB7   02B9 0178
L_5DB9:
        MVI@    R1,     R0                      ; 5DB9   0288
        INCR    R0                              ; 5DBA   0008
        MVO@    R0,     R1                      ; 5DBB   0248

        JSR     R5,     L_52A2                  ; 5DBC   0004 0150 02A2
        JSR     R5,     L_5253                  ; 5DBF   0004 0150 0253

        MVII    #$0005, R0                      ; 5DC2   02B8 0005

        JSR     R5,     X_PLAY_CHEER1           ; 5DC4   0004 011C 02D5

L_5DC7:
        PULR    R7                              ; 5DC7   02B7

L_5DC8:
        MVI     G_031D, R0                      ; 5DC8   0280 031D
        XORI    #$0014, R0                      ; 5DCA   03F8 0014
        MVO     R0,     G_031D                  ; 5DCC   0240 031D
        MVI     G_0335, R0                      ; 5DCE   0280 0335
        XORI    #$0002, R0                      ; 5DD0   03F8 0002
        MVO     R0,     G_0335                  ; 5DD2   0240 0335
        MOVR    R5,     R7                      ; 5DD4   00AF

L_5DD5:
        PSHR    R5                              ; 5DD5   0275
        MVI     G_0179, R0                      ; 5DD6   0280 0179
        SDBD                                    ; 5DD8   0001
        ANDI    #$004A, R0                      ; 5DD9   03B8 004A 0000
        BNEQ    L_5DFC                          ; 5DDC   020C 001E

        MVII    #$031D, R1                      ; 5DDE   02B9 031D
        MVII    #$016A, R4                      ; 5DE0   02BC 016A
L_5DE2:
        MVI@    R4,     R0                      ; 5DE2   02A0
        ANDI    #$0002, R0                      ; 5DE3   03B8 0002
        BNEQ    L_5DF6                          ; 5DE5   020C 000F

        PSHR    R1                              ; 5DE7   0271
        PSHR    R4                              ; 5DE8   0274

        JSR     R5,     L_5D02                  ; 5DE9   0004 015C 0102

        INCR    R7                              ; 5DEC   000F

        RLC     R0,     2                       ; 5DED   0054
L_5DEE:
        BC      L_5DF4                          ; 5DEE   0201 0004

        ADDI    #$0003, R1                      ; 5DF0   02F9 0003
        SWAP    R0,     1                       ; 5DF2   0040
        MVO@    R0,     R1                      ; 5DF3   0248
L_5DF4:
        PULR    R4                              ; 5DF4   02B4
        PULR    R1                              ; 5DF5   02B1
L_5DF6:
        ADDI    #$0008, R1                      ; 5DF6   02F9 0008
        CMPI    #$034D, R1                      ; 5DF8   0379 034D
        BLE     L_5DE2                          ; 5DFA   0226 0019
L_5DFC:
        PULR    R7                              ; 5DFC   02B7

L_5DFD:
        PSHR    R5                              ; 5DFD   0275
        SDBD                                    ; 5DFE   0001
        MVII    #$1806, R1                      ; 5DFF   02B9 0006 0018

        JSR     R5,     L_5CF5                  ; 5E02   0004 015C 00F5

        BC      L_5E09                          ; 5E05   0201 0002

        XORI    #$0011, R1                      ; 5E07   03F9 0011
L_5E09:
        MVI     G_0167, R0                      ; 5E09   0280 0167
        CMPI    #$0015, R0                      ; 5E0B   0378 0015
        BLT     L_5E11                          ; 5E0D   0205 0002

        XORI    #$0200, R1                      ; 5E0F   03F9 0200
L_5E11:
        MVI     G_034D, R0                      ; 5E11   0280 034D
        XORR    R1,     R0                      ; 5E13   01C8
        MVO     R0,     G_034D                  ; 5E14   0240 034D
        MVI     G_017C, R0                      ; 5E16   0280 017C
        XORI    #$0001, R0                      ; 5E18   03F8 0001
        MVO     R0,     G_017C                  ; 5E1A   0240 017C
        PULR    R7                              ; 5E1C   02B7

L_5E1D:
        PSHR    R5                              ; 5E1D   0275
        MVI     G_017C, R0                      ; 5E1E   0280 017C
        ANDI    #$0001, R0                      ; 5E20   03B8 0001
        BNEQ    L_5E44                          ; 5E22   020C 0020

        MVI     G_0167, R0                      ; 5E24   0280 0167
        CMPI    #$0004, R0                      ; 5E26   0378 0004
        BLE     L_5E32                          ; 5E28   0206 0008

        CMPI    #$0024, R0                      ; 5E2A   0378 0024
        BLE     L_5E43                          ; 5E2C   0206 0015

        MVII    #$01CB, R1                      ; 5E2E   02B9 01CB
        B       L_5E34                          ; 5E30   0200 0002

L_5E32:
        MVII    #$002E, R1                      ; 5E32   02B9 002E
L_5E34:
        SLL     R0,     2                       ; 5E34   004C
        SLL     R0,     1                       ; 5E35   0048
        NEGR    R0                              ; 5E36   0020
        ADDR    R1,     R0                      ; 5E37   00C8
        SWAP    R0,     1                       ; 5E38   0040
        MVO     R0,     G_034F                  ; 5E39   0240 034F
        MVII    #$0034, R0                      ; 5E3B   02B8 0034
        SWAP    R0,     1                       ; 5E3D   0040
        MVO     R0,     G_0350                  ; 5E3E   0240 0350

        JSR     R5,     L_5DFD                  ; 5E40   0004 015C 01FD

L_5E43:
        PULR    R7                              ; 5E43   02B7

L_5E44:
        MVI     G_0167, R0                      ; 5E44   0280 0167
        CMPI    #$0004, R0                      ; 5E46   0378 0004
        BLE     L_5E56                          ; 5E48   0206 000C

        CMPI    #$0025, R0                      ; 5E4A   0378 0025
        BGE     L_5E56                          ; 5E4C   020D 0008

        JSR     R5,     L_5DFD                  ; 5E4E   0004 015C 01FD

        CLRR    R0                              ; 5E51   01C0
        MVO     R0,     G_017C                  ; 5E52   0240 017C
        MVO     R0,     G_0351                  ; 5E54   0240 0351
L_5E56:
        PULR    R7                              ; 5E56   02B7

L_5E57:
        MVI@    R5,     R3                      ; 5E57   02AB
L_5E58:
        PSHR    R5                              ; 5E58   0275
        MVI@    R1,     R2                      ; 5E59   028A
        MVI     G_0167, R0                      ; 5E5A   0280 0167
        SLL     R0,     2                       ; 5E5C   004C
        SLL     R0,     1                       ; 5E5D   0048
        NEGR    R0                              ; 5E5E   0020
        ADDR    R0,     R2                      ; 5E5F   00C2
        SWAP    R2,     1                       ; 5E60   0042
        INCR    R1                              ; 5E61   0009
        XOR@    R1,     R2                      ; 5E62   03CA
        MVII    #$0006, R0                      ; 5E63   02B8 0006

        JSR     R5,     .EXEC.9B9               ; 5E65   0004 0118 01B9

        PULR    R7                              ; 5E68   02B7

L_5E69:
        PSHR    R5                              ; 5E69   0275
        MVI     G_0179, R0                      ; 5E6A   0280 0179
        CMPI    #$0004, R0                      ; 5E6C   0378 0004
        BNEQ    L_5E9B                          ; 5E6E   020C 002B

        MVI     G_017C, R0                      ; 5E70   0280 017C
        ANDI    #$0001, R0                      ; 5E72   03B8 0001
        BEQ     L_5E9B                          ; 5E74   0204 0025

        JSR     R5,     L_5CF5                  ; 5E76   0004 015C 00F5

        ADCR    R1                              ; 5E79   0029
        DECR    R1                              ; 5E7A   0011
        BNEQ    L_5E9B                          ; 5E7B   020C 001E

        SDBD                                    ; 5E7D   0001
        MVII    #$5EBA, R1                      ; 5E7E   02B9 00BA 005E
        MVI     G_0167, R0                      ; 5E81   0280 0167
        CMPI    #$0015, R0                      ; 5E83   0378 0015
        BLT     L_5E89                          ; 5E85   0205 0002

        ADDI    #$0006, R1                      ; 5E87   02F9 0006
L_5E89:
        CMPI    #$0005, R2                      ; 5E89   037A 0005
        BNEQ    L_5E8F                          ; 5E8B   020C 0002

        ADDI    #$0004, R1                      ; 5E8D   02F9 0004

L_5E8F:
        JSR     R5,     L_5E57                  ; 5E8F   0004 015C 0257
        DECLE   $0032                           ; 5E92   0032

        MVI     G_017C, R0                      ; 5E93   0280 017C
        ANDI    #$00FD, R0                      ; 5E95   03B8 00FD
        XORI    #$0002, R0                      ; 5E97   03F8 0002
        MVO     R0,     G_017C                  ; 5E99   0240 017C
L_5E9B:
        PULR    R7                              ; 5E9B   02B7

L_5E9C:
        PSHR    R5                              ; 5E9C   0275
        MVI     G_0179, R0                      ; 5E9D   0280 0179
        CMPI    #$0010, R0                      ; 5E9F   0378 0010
        BEQ     L_5F01                          ; 5EA1   0204 005E

        MVI     G_017C, R0                      ; 5EA3   0280 017C
        ANDI    #$0001, R0                      ; 5EA5   03B8 0001
        BEQ     L_5EB7                          ; 5EA7   0204 000E

        CLRR    R0                              ; 5EA9   01C0
        MVO     R0,     G_0351                  ; 5EAA   0240 0351
        MVI     G_017C, R0                      ; 5EAC   0280 017C
        ANDI    #$0002, R0                      ; 5EAE   03B8 0002
        BEQ     L_5EB5                          ; 5EB0   0204 0003

        JSR     R5,     L_5F43                  ; 5EB2   0004 015C 0343

L_5EB5:
        MVII    #$0001, R0                      ; 5EB5   02B8 0001
L_5EB7:
        MVO     R0,     G_017C                  ; 5EB7   0240 017C
        PULR    R7                              ; 5EB9   02B7

        NOP                                     ; 5EBA   0034
        ADCR    R0                              ; 5EBB   0028
        ADCR    R6                              ; 5EBC   002E
        NOP                                     ; 5EBD   0034
        ADCR    R0                              ; 5EBE   0028
        SWAP    R0,     1                       ; 5EBF   0040
        XORR    R0,     R5                      ; 5EC0   01C5
        ADCR    R0                              ; 5EC1   0028
        XORR    R1,     R3                      ; 5EC2   01CB
        NOP                                     ; 5EC3   0034
        XORR    R2,     R0                      ; 5EC4   01D0
        SWAP    R0,     1                       ; 5EC5   0040
L_5EC6:
        PSHR    R5                              ; 5EC6   0275
        CLRR    R0                              ; 5EC7   01C0
        MVO     R0,     G_0359                  ; 5EC8   0240 0359
        MVO     R0,     G_0351                  ; 5ECA   0240 0351
        MVO     R0,     G_0353                  ; 5ECC   0240 0353
        MVII    #$0010, R0                      ; 5ECE   02B8 0010
        MVO     R0,     G_0179                  ; 5ED0   0240 0179
        CLRR    R0                              ; 5ED2   01C0
        MVO     R0,     G_017A                  ; 5ED3   0240 017A
        MVII    #$001E, R0                      ; 5ED5   02B8 001E
        MVO     R0,     G_035B                  ; 5ED7   0240 035B

        JSR     R5,     L_5F6E                  ; 5ED9   0004 015C 036E

        PULR    R7                              ; 5EDC   02B7

L_5EDD:
        PSHR    R5                              ; 5EDD   0275
        SDBD                                    ; 5EDE   0001
        MVII    #$5EF9, R3                      ; 5EDF   02BB 00F9 005E
        SDBD                                    ; 5EE2   0001
        MVII    #$5EFD, R4                      ; 5EE3   02BC 00FD 005E
        MVI     G_0167, R0                      ; 5EE6   0280 0167
        CMPI    #$0015, R0                      ; 5EE8   0378 0015
        BLT     L_5EF0                          ; 5EEA   0205 0004

        ADDI    #$0002, R3                      ; 5EEC   02FB 0002
        ADDI    #$0002, R4                      ; 5EEE   02FC 0002

L_5EF0:
        JSR     R5,     L_5F60                  ; 5EF0   0004 015C 0360

        MOVR    R3,     R1                      ; 5EF3   0099

        JSR     R5,     L_5E57                  ; 5EF4   0004 015C 0257
        DECLE   $0019                           ; 5EF7   0019

        PULR    R7                              ; 5EF8   02B7

        SLL     R0,     1                       ; 5EF9   0048
        NOP                                     ; 5EFA   0034
        ANDR    R6,     R1                      ; 5EFB   01B1
        NOP                                     ; 5EFC   0034
        SLL     R0,     1                       ; 5EFD   0048
        RSWD    R3                              ; 5EFE   003B
        ANDR    R6,     R5                      ; 5EFF   01B5
        RSWD    R3                              ; 5F00   003B
L_5F01:
        CLRR    R0                              ; 5F01   01C0
        MVO     R0,     G_0351                  ; 5F02   0240 0351
        MVI     G_017A, R0                      ; 5F04   0280 017A
        TSTR    R0                              ; 5F06   0080
        BEQ     L_5F11                          ; 5F07   0204 0008

        MVII    #$0004, R0                      ; 5F09   02B8 0004
        MVO     R0,     G_0179                  ; 5F0B   0240 0179
        CLRR    R0                              ; 5F0D   01C0
        MVO     R0,     G_017A                  ; 5F0E   0240 017A
        PULR    R7                              ; 5F10   02B7

L_5F11:
        MVII    #$0001, R0                      ; 5F11   02B8 0001
        MVO     R0,     G_017A                  ; 5F13   0240 017A
        MVII    #$03F1, R0                      ; 5F15   02B8 03F1
        MVO     R0,     G_0352                  ; 5F17   0240 0352
        MVII    #$0004, R0                      ; 5F19   02B8 0004
        MVO     R0,     G_0353                  ; 5F1B   0240 0353
        MVI     G_0170, R0                      ; 5F1D   0280 0170
        XORI    #$0004, R0                      ; 5F1F   03F8 0004
        MVO     R0,     G_0170                  ; 5F21   0240 0170
        SDBD                                    ; 5F23   0001
        MVII    #$532C, R0                      ; 5F24   02B8 002C 0053
        MVO     R0,     G_034E                  ; 5F27   0240 034E
        MVII    #$007F, R0                      ; 5F29   02B8 007F
        MVI     G_0167, R1                      ; 5F2B   0281 0167
        CMPI    #$0015, R1                      ; 5F2D   0379 0015
        BLT     L_5F32                          ; 5F2F   0205 0001

        NEGR    R0                              ; 5F31   0020
L_5F32:
        ANDI    #$00FF, R0                      ; 5F32   03B8 00FF
        SWAP    R0,     1                       ; 5F34   0040
        MVO     R0,     G_0359                  ; 5F35   0240 0359
        PULR    R7                              ; 5F37   02B7

L_5F38:
        PSHR    R5                              ; 5F38   0275

        JSR     R5,     L_5F43                  ; 5F39   0004 015C 0343

        MVI     G_0170, R0                      ; 5F3C   0280 0170
        XORI    #$0004, R0                      ; 5F3E   03F8 0004
        MVO     R0,     G_0170                  ; 5F40   0240 0170
        PULR    R7                              ; 5F42   02B7

L_5F43:
        PSHR    R5                              ; 5F43   0275
        SDBD                                    ; 5F44   0001
        MVII    #$5EBC, R1                      ; 5F45   02B9 00BC 005E
        MVI     G_0167, R0                      ; 5F48   0280 0167
        CMPI    #$0015, R0                      ; 5F4A   0378 0015
        BLT     L_5F50                          ; 5F4C   0205 0002

        ADDI    #$0006, R1                      ; 5F4E   02F9 0006
L_5F50:
        SDBD                                    ; 5F50   0001
        MVII    #$000C, R3                      ; 5F51   02BB 000C 0000
        MVI     G_0179, R0                      ; 5F54   0280 0179
        CMPI    #$0010, R0                      ; 5F56   0378 0010
        BEQ     L_5F5C                          ; 5F58   0204 0002

        MVII    #$0032, R3                      ; 5F5A   02BB 0032

L_5F5C:
        JSR     R5,     L_5E58                  ; 5F5C   0004 015C 0258

        PULR    R7                              ; 5F5F   02B7

L_5F60:
        MVI     G_0167, R0                      ; 5F60   0280 0167
        SLL     R0,     2                       ; 5F62   004C
        SLL     R0,     1                       ; 5F63   0048
        NEGR    R0                              ; 5F64   0020
        ADD@    R4,     R0                      ; 5F65   02E0
        SWAP    R0,     1                       ; 5F66   0040
        MVO     R0,     G_0357                  ; 5F67   0240 0357
        MVI@    R4,     R0                      ; 5F69   02A0
        SWAP    R0,     1                       ; 5F6A   0040
        MVO     R0,     G_0358                  ; 5F6B   0240 0358
        MOVR    R5,     R7                      ; 5F6D   00AF

L_5F6E:
        MVII    #$0321, R1                      ; 5F6E   02B9 0321
        MVII    #$016A, R2                      ; 5F70   02BA 016A
        CLRR    R0                              ; 5F72   01C0
L_5F73:
        MVO@    R0,     R1                      ; 5F73   0248
        ADDI    #$0002, R1                      ; 5F74   02F9 0002
        MVO@    R0,     R1                      ; 5F76   0248
        MVI@    R2,     R4                      ; 5F77   0294
        ANDI    #$00DF, R4                      ; 5F78   03BC 00DF
        MVO@    R4,     R2                      ; 5F7A   0254
        INCR    R2                              ; 5F7B   000A
        ADDI    #$0006, R1                      ; 5F7C   02F9 0006
        CMPI    #$0351, R1                      ; 5F7E   0379 0351
        BNEQ    L_5F73                          ; 5F80   022C 000E
        MOVR    R5,     R7                      ; 5F82   00AF

        PSHR    R5                              ; 5F83   0275
        MVI     G_0179, R5                      ; 5F84   0285 0179
        CMPI    #$0004, R5                      ; 5F86   037D 0004
        BNEQ    L_5FCC                          ; 5F88   020C 0042

        CMPI    #$0006, R0                      ; 5F8A   0378 0006
        BNEQ    L_5FCC                          ; 5F8C   020C 003E

        CMPI    #$0007, R3                      ; 5F8E   037B 0007
        BEQ     L_5F96                          ; 5F90   0204 0004

        CMP     G_0173, R3                      ; 5F92   0343 0173
        BNEQ    L_5FCC                          ; 5F94   020C 0036

L_5F96:
        MVI     G_0172, R1                      ; 5F96   0281 0172
        ADDI    #$016A, R1                      ; 5F98   02F9 016A
        MVI@    R1,     R0                      ; 5F9A   0288
        ANDI    #$007F, R0                      ; 5F9B   03B8 007F
        MVO@    R0,     R1                      ; 5F9D   0248
        CLRR    R5                              ; 5F9E   01ED
        MVII    #$033B, R3                      ; 5F9F   02BB 033B
        MVII    #$016D, R2                      ; 5FA1   02BA 016D
        MVII    #$0325, R1                      ; 5FA3   02B9 0325

        JSR     R5,     L_5CF5                  ; 5FA5   0004 015C 00F5

        BC      L_5FB2                          ; 5FA8   0201 0008

        MVII    #$033D, R1                      ; 5FAA   02B9 033D
        MVII    #$0323, R3                      ; 5FAC   02BB 0323
        MVII    #$0003, R5                      ; 5FAE   02BD 0003
        MVII    #$016A, R2                      ; 5FB0   02BA 016A
L_5FB2:
        MVO     R5,     G_0172                  ; 5FB2   0245 0172
        MVII    #$0003, R5                      ; 5FB4   02BD 0003
        MVII    #$0014, R4                      ; 5FB6   02BC 0014
L_5FB8:
        MVI@    R2,     R0                      ; 5FB8   0290
        ANDI    #$00DF, R0                      ; 5FB9   03B8 00DF
        XORI    #$0020, R0                      ; 5FBB   03F8 0020
        MVO@    R0,     R2                      ; 5FBD   0250
        MVO@    R4,     R3                      ; 5FBE   025C
        ADDI    #$0008, R3                      ; 5FBF   02FB 0008
        INCR    R2                              ; 5FC1   000A
        DECR    R5                              ; 5FC2   0015
        BNEQ    L_5FB8                          ; 5FC3   022C 000C

        JSR     R5,     L_51F6                  ; 5FC5   0004 0150 01F6

        CLRR    R0                              ; 5FC8   01C0
        COMR    R0                              ; 5FC9   0018
        MVO     R0,     G_0173                  ; 5FCA   0240 0173
L_5FCC:
        PULR    R7                              ; 5FCC   02B7

L_5FCD:
        PSHR    R5                              ; 5FCD   0275

        JSR     R5,     X_PLAY_SFX2             ; 5FCE   0004 0118 03BE
        DECLE   $0078                           ; 5FD1  SFX prio
        DECLE   $0048,  $0328                   ; 5FD2  SFX data
        DECLE   $001B                           ; 5FD4  SFX data
        DECLE   $0040,  $0340                   ; 5FD5  SFX data
        DECLE   $03C9                           ; 5FD7  SFX data
        DECLE   $000C,  $0108                   ; 5FD8  SFX data
        DECLE   $000B                           ; 5FDA  SFX data
        DECLE   $03CF                           ; 5FDB  SFX end

L_5FDC:
        PSHR    R5                              ; 5FDC   0275
        MVI     G_0179, R0                      ; 5FDD   0280 0179
        CMPI    #$0004, R0                      ; 5FDF   0378 0004
        BNEQ    L_5FF9                          ; 5FE1   020C 0016

        MVI     G_0173, R0                      ; 5FE3   0280 0173
        CMPI    #$00FF, R0                      ; 5FE5   0378 00FF
        BEQ     L_5FF9                          ; 5FE7   0204 0010

        MVI     G_0359, R0                      ; 5FE9   0280 0359
        TSTR    R0                              ; 5FEB   0080
        BEQ     L_5FF9                          ; 5FEC   0204 000B

        MVII    #$0001, R0                      ; 5FEE   02B8 0001

        JSR     R5,     X_RAND1                 ; 5FF0   0004 0114 027D

        TSTR    R0                              ; 5FF3   0080
        BNEQ    L_5FF9                          ; 5FF4   020C 0003

        JSR     R5,     L_5FCD                  ; 5FF6   0004 015C 03CD

L_5FF9:
        PULR    R7                              ; 5FF9   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5FFE   0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $503A       <entry>
;;  $5042       <entry>
;;  $505F       <entry>
;;  $506A       <entry>
;;  $508D       $5098  
;;  $50A4       $509A  
;;  $50CD       $50B6   $50BB  
;;  $50D0       $50D9  
;;  $50EC       $50E6  
;;  $5112       $510B  
;;  $5122       $5122  
;;  $5123       $5120  
;;  $512C       $5909  
;;  $512D       $511A   $5127  
;;  $5141       $513B  
;;  $514D       $5149  
;;  $515C       $50FA   $5105  
;;  $515D       $50F2  
;;  $5186       $5172  
;;  $518A       $5184  
;;  $51A2       $5161  
;;  $51BB       $58CB  
;;  $51C8       $51C2  
;;  $51E8       $51E5  
;;  $51EB       $51DB  
;;  $51F6       $51F2   $5FC5  
;;  $5219       $5215  
;;  $5222       $5222  
;;  $522F       $5060  
;;  $5246       $523D  
;;  $524C       $5240   $5247  
;;  $5252       $5234  
;;  $5253       $52B4   $52D8   $5A64   $5D70   $5DBF  
;;  $5295       $5291   $529C  
;;  $52A2       $512D   $52D5   $5A68   $5DBC  
;;  $52B0       $5242  
;;  $52C0       $5A03  
;;  $52C1       $52BF  
;;  $52E6       $52EB  
;;  $5426       $55EB  
;;  $5436       $5431  
;;  $543E       $542D  
;;  $5445       $5440  
;;  $5448       $543C  
;;  $546B       $5458   $545E  
;;  $546C       $508F   $544C  
;;  $5477       $5470  
;;  $5482       $54AC  
;;  $548E       $5492  
;;  $5496       $5487  
;;  $54A5       $54A2  
;;  $54AA       $5494  
;;  $559B       $52D2   $5A13  
;;  $55A6       $55A1  
;;  $55A9       $55A6  
;;  $55B6       $5046  
;;  $55E3       $55E7  
;;  $55EE       $55E9  
;;  $55F3       $5611  
;;  $55FB       $55F7  
;;  $562D       $563E  
;;  $5636       $5639  
;;  $5642       $5628  
;;  $5646       $5658  
;;  $5648       $564C  
;;  $565B       $5640  
;;  $565D       $5626  
;;  $56C3       $56C1  
;;  $577A       $5049  
;;  $577F       $57CF  
;;  $57AA       $579C   $57A0  
;;  $57B0       $57A8  
;;  $57B8       $57DD  
;;  $57BA       $57B2   $57B6   $57DF  
;;  $57C9       $5784   $57C3  
;;  $57D2       $578F  
;;  $57E1       $504C  
;;  $57F5       $5814  
;;  $5803       $57FF  
;;  $5808       $57F9  
;;  $5809       $5806  
;;  $5816       $57EE   $5823   $5829  
;;  $5817       $57E6  
;;  $5820       $581D  
;;  $5848       $5844  
;;  $5864       $5861  
;;  $587D       $5877  
;;  $588D       $5887  
;;  $58B4       $587F   $589B  
;;  $58B5       $5894  
;;  $58C5       $58BE  
;;  $58D0       $58C9  
;;  $58EE       $58EB  
;;  $58F5       $58C3   $58CE  
;;  $590C       $58FE   $5903   $5907  
;;  $5924       $591D  
;;  $5948       $5940  
;;  $5955       $5946   $594B  
;;  $595F       $5957  
;;  $5975       $5971  
;;  $599F       $5910   $5918   $5922   $592A   $592E   $593C   $5953  
;;  $59AF       $59A9  
;;  $59D8       $59C9   $59D2  
;;  $59ED       $59B9  
;;  $59FC       $59B3   $59F1   $59F7  
;;  $59FD       $59A5  
;;  $5A07       $5A01  
;;  $5A0F       $5A0B  
;;  $5A1A       $5063  
;;  $5A45       $5A3E  
;;  $5A49       $5A36  
;;  $5A5B       $5A55  
;;  $5A5D       $5A21   $5A3B   $5A45   $5A4D   $5A52  
;;  $5A5E       $5A43   $5A47   $5A59   $5A5B  
;;  $5A67       $5A29  
;;  $5A68       $5A62  
;;  $5A6C       $503B  
;;  $5A85       $5A71  
;;  $5A86       $5AF5   $5B0C  
;;  $5A96       $5AED   $5B01  
;;  $5AA1       $5AD5  
;;  $5AAB       $5AA8  
;;  $5AAF       $5AAC  
;;  $5AB4       $5AB1  
;;  $5AB8       <entry>
;;  $5ACF       $5ABD   $5AC3  
;;  $5AD0       $5AC7   $5ACC  
;;  $5AD3       $5B39  
;;  $5AE3       $5AE8  
;;  $5AEA       $5AE5  
;;  $5B1B       $5B15  
;;  $5B27       $5ADF   $5AFF  
;;  $5B2E       $5AFC  
;;  $5B34       $5B25   $5B2C  
;;  $5B3C       $5AF8   $5B0F  
;;  $5B40       $5B3D  
;;  $5B47       $5B42  
;;  $5B48       $504F  
;;  $5B4C       $5B6A  
;;  $5B5A       $5B53  
;;  $5B63       $5B58   $5B5E  
;;  $5B6D       $5B55  
;;  $5B73       $5B60  
;;  $5B77       $5B71  
;;  $5B93       $5B90  
;;  $5B99       $5B7D  
;;  $5B9A       $5B83   $5B87   $5B8B   $5B97  
;;  $5B9C       $5B29  
;;  $5BB2       $503E  
;;  $5BC1       $5BDF  
;;  $5BDB       $5BC3   $5BCD  
;;  $5BE1       $5BB7   $5BBD  
;;  $5BE2       $5052  
;;  $5BE5       $5C15  
;;  $5BFA       $5BEA   $5BF5  
;;  $5C10       $5C00   $5C0B  
;;  $5C43       $5C34  
;;  $5C50       $5C4A  
;;  $5C5A       $5C57  
;;  $5C65       $5C5F  
;;  $5C79       $5C75  
;;  $5C82       $5C27   $5C41  
;;  $5C98       $5C7C  
;;  $5CB5       $5CB1  
;;  $5CC2       $5C1B   $5C21   $5C69   $5C86   $5C8F  
;;  $5CC3       $5BF7   $5C0D  
;;  $5CCF       $5BEC   $5C02   $5C2B   $5C38  
;;  $5CF3       $5CEF  
;;  $5CF5       $5A08   $5C5A   $5DB2   $5E02   $5E76   $5FA5  
;;  $5CFE       $5CFB  
;;  $5D02       $5C45   $5C8A   $5DE9  
;;  $5D10       $5D08  
;;  $5D11       $5D0C  
;;  $5D13       $5D62   $5D69  
;;  $5D1C       $5D26  
;;  $5D29       $50C9   $5159   $5A16  
;;  $5D53       $5D50  
;;  $5D60       $5D5C  
;;  $5D74       $5841   $585C   $5D58  
;;  $5D90       $5C4C  
;;  $5DB9       $5DB5  
;;  $5DC7       $5D95  
;;  $5DC8       $52C6   $58F2   $5DA9  
;;  $5DD5       $5055  
;;  $5DE2       $5DFA  
;;  $5DEE       $5DEC  
;;  $5DF4       $5DEE  
;;  $5DF6       $5DE5  
;;  $5DFC       $5DDC  
;;  $5DFD       $5E40   $5E4E  
;;  $5E09       $5E05  
;;  $5E11       $5E0D  
;;  $5E1D       $505B  
;;  $5E32       $5E28  
;;  $5E34       $5E30  
;;  $5E43       $5E2C  
;;  $5E44       $5E22  
;;  $5E56       $5E48   $5E4C  
;;  $5E57       $5E8F   $5EF4  
;;  $5E58       $5F5C  
;;  $5E69       $58B7  
;;  $5E89       $5E85  
;;  $5E8F       $5E8B  
;;  $5E9B       $5E6E   $5E74   $5E7B  
;;  $5E9C       $50E8  
;;  $5EB5       $5EB0  
;;  $5EB7       $5EA7  
;;  $5EC6       $5C61  
;;  $5EDD       $59AB  
;;  $5EF0       $5EEA  
;;  $5F01       $5EA1  
;;  $5F11       $5F07  
;;  $5F32       $5F2F  
;;  $5F38       $58C0  
;;  $5F43       $5EB2   $5F39  
;;  $5F50       $5F4C  
;;  $5F5C       $5F58  
;;  $5F60       $5C79   $5EF0  
;;  $5F6E       $5C9D   $5D9E   $5ED9  
;;  $5F73       $5F80  
;;  $5F96       $5F90  
;;  $5FB2       $5FA8  
;;  $5FB8       $5FC3  
;;  $5FCC       $5F88   $5F8C   $5F94  
;;  $5FCD       $58B1   $58F5   $599C   $5FF6  
;;  $5FDC       $5066  
;;  $5FF9       $5FE1   $5FE7   $5FEC   $5FF4  
;; ======================================================================== ;;
