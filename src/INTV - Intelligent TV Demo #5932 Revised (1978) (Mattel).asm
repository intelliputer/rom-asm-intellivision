
        ORG     $5000
.HEADER:
        BIDECLE $0000           ; 5000  Ptr: MOB graphic images
        BIDECLE $5050           ; 5002  Ptr: EXEC timer table
        BIDECLE $505E           ; 5004  Ptr: Start of game
        BIDECLE $0000           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $505B           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5014           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0009,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0009           ; 5013  Border color init

.TITLE:
        DECLE   $004E                           ; 5014  Cartridge year
        DECLE   $0000                           ; 5015  

.TITLECODE:
        PSHR    R5                              ; 5016   0275

        JSR     R5,     L_5288                  ; 5017   0004 0150 0288

        EIS                                     ; 501A   0002
        MVII    #$0007, R1                      ; 501B   02B9 0007
        MVII    #$0279, R4                      ; 501D   02BC 0279

        JSR     R5,     L_5094                  ; 501F   0004 0150 0094
        DECLE   $010D,  $0264,  $016B,  $0115   ; 5022   010D 0264 016B 0115
        DECLE   $0112,  $010E,  $01BC,  $035A   ; 5026   0112 010E 01BC 035A
        DECLE   $035A,  $035A,  $0348,  $01B3   ; 502A   035A 035A 0348 01B3
        DECLE   $008B,  $0168,  $00C4,  $01B3   ; 502E   008B 0168 00C4 01B3
        DECLE   $039A,  $035A,  $035A,  $035A   ; 5032   039A 035A 035A 035A
        DECLE   $0353,  $008B,  $0095,  $0112   ; 5036   0353 008B 0095 0112
        DECLE   $010E,  $01BE,  $0000           ; 503A   010E 01BE 0000

        MVII    #$00FF, R0                      ; 503D   02B8 00FF
        SWAP    R0,     1                       ; 503F   0040
L_5040:
        EIS                                     ; 5040   0002
        NOP                                     ; 5041   0034
        NOP                                     ; 5042   0034
        NOP                                     ; 5043   0034
        NOP                                     ; 5044   0034
        NOP                                     ; 5045   0034
        NOP                                     ; 5046   0034
        NOP                                     ; 5047   0034
        NOP                                     ; 5048   0034
        DECR    R0                              ; 5049   0010
        BNEQ    L_5040                          ; 504A   022C 000B

        PULR    R5                              ; 504C   02B5
        ADDI    #$0003, R5                      ; 504D   02FD 0003
        MOVR    R5,     R7                      ; 504F   00AF

.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 5050  Timer dispatch/interval
        DECLE   $005A,  $0050,  $0001,  $0000; 5054  Timer dispatch/interval
        BIDECLE $0000           ; 5058  End of timer table

L_505A:
        MOVR    R5,     R7                      ; 505A   00AF

.GRAM_INIT_505B:
        DECLE   $0001           ; 505B  # of GRAM cards to init
        DECLE   $0000           ; 505C  #00   :  CART #00    ----

        DECLE   $0000                           ; 505D   0000
.START:
        PSHR    R5                              ; 505E   0275
        EIS                                     ; 505F   0002
        MVII    #$0004, R0                      ; 5060   02B8 0004

        JSR     R5,     L_5079                  ; 5062   0004 0150 0079
        BIDECLE $512D                           ; 5065   002D 0051
        DECLE   $0006,  $0216,  $00BF,  $006D   ; 5067   0006 0216 00BF 006D
        DECLE   $0051,  $0007,  $0200,  $00BF   ; 506B   0051 0007 0200 00BF
        DECLE   $00C3,  $0051,  $0006,  $0215   ; 506F   00C3 0051 0006 0215
        DECLE   $00BF,  $00F8,  $0051,  $0000   ; 5073   00BF 00F8 0051 0000
        DECLE   $023E,  $00BF                   ; 5077   023E 00BF
L_5079:
        SDBD                                    ; 5079   0001
        MVI@    R5,     R3                      ; 507A   02AB
        MVI@    R5,     R1                      ; 507B   02A9
        MVI@    R5,     R2                      ; 507C   02AA
        PSHR    R5                              ; 507D   0275
        MVO     R0,     G_0161                  ; 507E   0240 0161

        JSR     R5,     L_5099                  ; 5080   0004 0150 0099

        PULR    R5                              ; 5083   02B5
        MVI@    R5,     R0                      ; 5084   02A8
        MVO     R5,     G_0315                  ; 5085   0245 0315

        JSR     R5,     .EXEC.A62               ; 5087   0004 0118 0262

        MVI     G_0315, R5                      ; 508A   0285 0315
        MVI     G_0161, R0                      ; 508C   0280 0161
        DECR    R0                              ; 508E   0010
        BNEQ    L_5079                          ; 508F   022C 0017
        J       L_53F4                          ; 5091   0004 0350 03F4

L_5094:
        MOVR    R5,     R3                      ; 5094   00AB

        JSR     R5,     L_50A3                  ; 5095   0004 0150 00A3

        MOVR    R3,     R7                      ; 5098   009F

L_5099:
        PSHR    R5                              ; 5099   0275
        MVII    #$00F0, R0                      ; 509A   02B8 00F0
        MVII    #$0200, R4                      ; 509C   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 509E   0004 0114 0338

        MOVR    R2,     R4                      ; 50A1   0094
        INCR    R7                              ; 50A2   000F

L_50A3:
        PSHR    R5                              ; 50A3   0275
L_50A4:
        MVO     R1,     G_0314                  ; 50A4   0241 0314
        MOVR    R4,     R0                      ; 50A6   00A0
        SUBI    #$0200, R0                      ; 50A7   0338 0200
        MVO     R0,     G_015D                  ; 50A9   0240 015D
        MVII    #$003B, R1                      ; 50AB   02B9 003B
        MVO     R1,     G_015E                  ; 50AD   0241 015E
        MVO     R1,     G_015F                  ; 50AF   0241 015F
        CLRR    R0                              ; 50B1   01C0
        MVO     R0,     G_0160                  ; 50B2   0240 0160
L_50B4:
        MVI@    R3,     R2                      ; 50B4   029A
        SLR     R2,     2                       ; 50B5   0066
        SLR     R2,     2                       ; 50B6   0066
        SLR     R2,     1                       ; 50B7   0062

        JSR     R5,     L_50C5                  ; 50B8   0004 0150 00C5

        MVI@    R3,     R2                      ; 50BB   029A
        ANDI    #$001F, R2                      ; 50BC   03BA 001F

        JSR     R5,     L_50C5                  ; 50BE   0004 0150 00C5

        INCR    R3                              ; 50C1   000B
        B       L_50B4                          ; 50C2   0220 000F
        PULR    R7                              ; 50C4   02B7

L_50C5:
        PSHR    R5                              ; 50C5   0275
        SUBI    #$001A, R2                      ; 50C6   033A 001A
        BMI     L_50F3                          ; 50C8   020B 0029

        INCR    R2                              ; 50CA   000A
        ADDR    R7,     R2                      ; 50CB   00FA
        ADD@    R2,     R7                      ; 50CC   02D7

        CLRC                                    ; 50CD   0006
        DECR    R2                              ; 50CE   0012
        INCR    R1                              ; 50CF   0009
        COMR    R4                              ; 50D0   001C
        NEGR    R3                              ; 50D1   0023
        DECR    R6                              ; 50D2   0016
        CLRR    R2                              ; 50D3   01D2
        B       L_510A                          ; 50D4   0200 0034

        MVI     G_015D, R4                      ; 50D6   0284 015D
        ADDI    #$0014, R4                      ; 50D8   02FC 0014
        MVO     R4,     G_015D                  ; 50DA   0244 015D
        ADDI    #$0200, R4                      ; 50DC   02FC 0200
        PULR    R7                              ; 50DE   02B7

        MVII    #$003B, R1                      ; 50DF   02B9 003B
        B       L_50E5                          ; 50E1   0200 0002

        MVII    #$005B, R1                      ; 50E3   02B9 005B
L_50E5:
        MVO     R1,     G_015E                  ; 50E5   0241 015E
        B       L_50ED                          ; 50E7   0200 0004

        MVI     G_015E, R1                      ; 50E9   0281 015E
        XORI    #$0060, R1                      ; 50EB   03F9 0060
L_50ED:
        MVO     R1,     G_015F                  ; 50ED   0241 015F
        PULR    R7                              ; 50EF   02B7

        MVO     R2,     G_0160                  ; 50F0   0242 0160
        PULR    R7                              ; 50F2   02B7

L_50F3:
        MVI     G_0160, R1                      ; 50F3   0281 0160
        TSTR    R1                              ; 50F5   0089
        BNEQ    L_50FC                          ; 50F6   020C 0004

        ADD     G_015F, R2                      ; 50F8   02C2 015F
        B       L_510A                          ; 50FA   0200 000E

L_50FC:
        ADDI    #$0019, R2                      ; 50FC   02FA 0019
        BPL     L_5105                          ; 50FE   0203 0005

        DECR    R6                              ; 5100   0016
        MVI     G_0314, R1                      ; 5101   0281 0314
        INCR    R3                              ; 5103   000B
        PULR    R7                              ; 5104   02B7

L_5105:
        SDBD                                    ; 5105   0001
        ADDI    #$5117, R2                      ; 5106   02FA 0017 0051
        MVI@    R2,     R2                      ; 5109   0292
L_510A:
        SLL     R2,     2                       ; 510A   004E
        SLL     R2,     1                       ; 510B   004A
        XOR     G_0314, R2                      ; 510C   03C2 0314
        MVO@    R2,     R4                      ; 510E   0262
        CLRR    R1                              ; 510F   01C9
        MVO     R1,     G_0160                  ; 5110   0241 0160
        MVI     G_015E, R1                      ; 5112   0281 015E
        MVO     R1,     G_015F                  ; 5114   0241 015F
        PULR    R7                              ; 5116   02B7

        DECLE   $000E,  $000C,  $001F,  $0001   ; 5117   000E 000C 001F 0001

        INCR    R5                              ; 511B   000D
        SETC                                    ; 511C   0007
        COMR    R2                              ; 511D   001A
        CLRC                                    ; 511E   0006
        DECR    R0                              ; 511F   0010
        DECR    R1                              ; 5120   0011
        DECR    R2                              ; 5121   0012
        DECR    R3                              ; 5122   0013
        DECR    R4                              ; 5123   0014
        DECR    R5                              ; 5124   0015
        DECR    R6                              ; 5125   0016
L_5126:
        DECR    R7                              ; 5126   0017

        DECLE   $0018,  $0019,  $003B,  $003D   ; 5127   0018 0019 003B 003D
        DECLE   $000A,  $0004,  $03C5,  $010D   ; 512B   000A 0004 03C5 010D
        DECLE   $0264,  $016B,  $0115,  $0112   ; 512F   0264 016B 0115 0112
        DECLE   $010E,  $01BE,  $00BC,  $039F   ; 5133   010E 01BE 00BC 039F
        DECLE   $035D,  $0267,  $009A,  $02A8   ; 5137   035D 0267 009A 02A8
        DECLE   $0064,  $01DA,  $00C0,  $0184   ; 513B   0064 01DA 00C0 0184
        DECLE   $039A,  $0352,  $0312,  $0264   ; 513F   039A 0352 0312 0264
        DECLE   $019A,  $0267,  $0013,  $0393   ; 5143   019A 0267 0013 0393
        DECLE   $0220,  $01B2,  $00AE,  $022C   ; 5147   0220 01B2 00AE 022C
        DECLE   $025A,  $030E,  $0291,  $039A   ; 514B   025A 030E 0291 039A
        DECLE   $0264,  $0164,  $02A8,  $0248   ; 514F   0264 0164 02A8 0248
        DECLE   $01CD,  $0352,  $0093,  $039A   ; 5153   01CD 0352 0093 039A
        DECLE   $010D,  $026E,  $0340,  $0345   ; 5157   010D 026E 0340 0345
        DECLE   $000C,  $010B,  $031C,  $0344   ; 515B   000C 010B 031C 0344
        DECLE   $01B3,  $0091,  $0260,  $010D   ; 515F   01B3 0091 0260 010D
        DECLE   $0184,  $01B3,  $039A,  $035A   ; 5163   0184 01B3 039A 035A
        DECLE   $0342,  $008D,  $0264,  $023E   ; 5167   0342 008D 0264 023E
        DECLE   $003E,  $0000,  $035A,  $035A   ; 516B   003E 0000 035A 035A
        DECLE   $035A,  $035A,  $027F,  $00E4   ; 516F   035A 035A 027F 00E4
        DECLE   $039A,  $035D,  $0180,  $0253   ; 5173   039A 035D 0180 0253
        DECLE   $0091,  $035D,  $004E,  $018F   ; 5177   0091 035D 004E 018F
        DECLE   $01CD,  $008D,  $027C,  $035A   ; 517B   01CD 008D 027C 035A
        DECLE   $035A,  $000D,  $007A,  $0244   ; 517F   035A 000D 007A 0244
        DECLE   $01E0,  $0220                   ; 5183   01E0 0220

        MVO@    R4,     R4                      ; 5185   0264
        AND     .STIC.A.1,R2                    ; 5186   0382 0011
        PSHR    R1                              ; 5188   0271
        SUBR    R0,     R3                      ; 5189   0103
        ADDR    R0,     R4                      ; 518A   00C4
        MVO@    R2,     R3                      ; 518B   025A
        GSWD    R1                              ; 518C   0031
        SUBR    R1,     R5                      ; 518D   010D
L_518E:
        ADDR    R3,     R2                      ; 518E   00DA
        DECLE   $030E,  $029C,  $039A,  $035A   ; 518F   030E 029C 039A 035A
        DECLE   $03D5,  $03B2,  $01EE,  $0233   ; 5193   03D5 03B2 01EE 0233
        DECLE   $025C,  $035A,  $035E,  $02BD   ; 5197   025C 035A 035E 02BD
        DECLE   $0002,  $0268,  $01CD,  $039A   ; 519B   0002 0268 01CD 039A
        DECLE   $035A,  $03D5,  $03A6,  $000C   ; 519F   035A 03D5 03A6 000C
        DECLE   $010D,  $00DC,  $035A,  $035E   ; 51A3   010D 00DC 035A 035E
        DECLE   $02BD,  $0253,  $0220,  $0264   ; 51A7   02BD 0253 0220 0264
        DECLE   $00D8,  $039A,  $035A,  $03D5   ; 51AB   00D8 039A 035A 03D5
        DECLE   $03AB,  $0080,  $022D,  $010D   ; 51AF   03AB 0080 022D 010D
        DECLE   $00DA,  $03A5,  $028D,  $039C   ; 51B3   00DA 03A5 028D 039C
        DECLE   $035D,  $02C8,  $0267,  $034C   ; 51B7   035D 02C8 0267 034C
        DECLE   $01D1,  $009A,  $026E,  $0342   ; 51BB   01D1 009A 026E 0342
        DECLE   $01CC,  $009E,  $009E,  $0000   ; 51BF   01CC 009E 009E 0000

        CMP@    R3,     R6                      ; 51C3   035E
        MOVR    R5,     R0                      ; 51C4   00A8
        ANDR    R6,     R3                      ; 51C5   01B3
        MOVR    R1,     R3                      ; 51C6   008B
        CMPR    R5,     R0                      ; 51C7   0168
        MVI@    R5,     R0                      ; 51C8   02A8
        MVO@    R0,     R1                      ; 51C9   0248
        XORR    R1,     R5                      ; 51CA   01CD
        XOR     G_039C, R5                      ; 51CB   03C5 039C
        XOR@    R2,     R5                      ; 51CD   03D5
        CMP@    R2,     R4                      ; 51CE   0354
        XOR@    R5,     R5                      ; 51CF   03ED
        SUBR    R2,     R0                      ; 51D0   0110
        MVI     G_035D, R4                      ; 51D1   0284 035D
        ADDR    R2,     R1                      ; 51D3   00D1
        INCR    R7                              ; 51D4   000F

        ADDR    R5,     R0                      ; 51D5   00E8
L_51D6:
        RLC     R2,     1                       ; 51D6   0052
        AND@    R3,     R4                      ; 51D7   039C
        XOR@    R2,     R5                      ; 51D8   03D5
        CMP@    R3,     R5                      ; 51D9   035D
        MOVR    R2,     R7                      ; 51DA   0097

        DECLE   $0048,  $0268,  $01A6,  $035D   ; 51DB   0048 0268 01A6 035D
        DECLE   $024E,  $028D,  $0072,  $039C   ; 51DF   024E 028D 0072 039C
        DECLE   $03D5,  $035D,  $02A8,  $02A8   ; 51E3   03D5 035D 02A8 02A8
        DECLE   $007A,  $03A2,  $01CB,  $01D1   ; 51E7   007A 03A2 01CB 01D1
        DECLE   $025C,  $039E,  $02BA,  $03A5   ; 51EB   025C 039E 02BA 03A5
        DECLE   $0012,  $027A,  $03A0,  $0053   ; 51EF   0012 027A 03A0 0053
        DECLE   $010E,  $01BA,  $035A,  $035A   ; 51F3   010E 01BA 035A 035A
        DECLE   $03C0,  $03C5,  $010D,  $0264   ; 51F7   03C0 03C5 010D 0264
        DECLE   $016B,  $0115,  $0112,  $010E   ; 51FB   016B 0115 0112 010E
        DECLE   $01BE,  $00BC,  $0393,  $03E7   ; 51FF   01BE 00BC 0393 03E7
        DECLE   $009A,  $00B4,  $0274,  $0224   ; 5203   009A 00B4 0274 0224
        DECLE   $0353,  $01C3,  $0018,  $039C   ; 5207   0353 01C3 0018 039C
        DECLE   $035D,  $02C0,  $0262,  $00FA   ; 520B   035D 02C0 0262 00FA
        DECLE   $000D,  $007A,  $0244,  $009E   ; 520F   000D 007A 0244 009E
        DECLE   $009E,  $0000                   ; 5213   009E 0000
L_5215:
        MVII    #$031D, R4                      ; 5215   02BC 031D
        CLRR    R2                              ; 5217   01D2
L_5218:
        MVI@    R5,     R1                      ; 5218   02A9
        TSTR    R1                              ; 5219   0089
        BNEQ    L_521D                          ; 521A   020C 0001
        MOVR    R5,     R7                      ; 521C   00AF

L_521D:
        SDBD                                    ; 521D   0001
        MVI@    R5,     R0                      ; 521E   02A8
        MVO@    R0,     R4                      ; 521F   0260
        SDBD                                    ; 5220   0001
        MVI@    R5,     R0                      ; 5221   02A8
        MVO@    R0,     R4                      ; 5222   0260
        MVI@    R3,     R0                      ; 5223   0298
        INCR    R3                              ; 5224   000B
        SWAP    R0,     1                       ; 5225   0040
        MVO@    R0,     R4                      ; 5226   0260
        MVI@    R3,     R0                      ; 5227   0298
        INCR    R3                              ; 5228   000B
        SWAP    R0,     1                       ; 5229   0040
        MVO@    R0,     R4                      ; 522A   0260
        MVO@    R2,     R4                      ; 522B   0262
        MVI@    R3,     R0                      ; 522C   0298
        INCR    R3                              ; 522D   000B
        MVO@    R0,     R4                      ; 522E   0260
        MVO@    R2,     R4                      ; 522F   0262
        INCR    R4                              ; 5230   000C
        DECR    R1                              ; 5231   0011
        BNEQ    L_5236                          ; 5232   020C 0002
        B       L_5218                          ; 5234   0220 001D

L_5236:
        SUBI    #$0004, R5                      ; 5236   033D 0004
        B       L_521D                          ; 5238   0220 001C

L_523A:
        MVI@    R5,     R0                      ; 523A   02A8
        MVO     R0,     G_0162                  ; 523B   0240 0162
        MVO     R5,     G_0316                  ; 523D   0245 0316
        PULR    R7                              ; 523F   02B7

L_5240:
        MVI     G_0162, R0                      ; 5240   0280 0162
        DECR    R0                              ; 5242   0010
        MVO     R0,     G_0162                  ; 5243   0240 0162
        BPL     L_5251                          ; 5245   0203 000A

        MVI     G_0316, R4                      ; 5247   0284 0316
        SDBD                                    ; 5249   0001
        MVI@    R4,     R0                      ; 524A   02A0
        MVI@    R4,     R1                      ; 524B   02A1
        MVO     R1,     G_0162                  ; 524C   0241 0162
        MVO     R4,     G_0316                  ; 524E   0244 0316
        MOVR    R0,     R7                      ; 5250   0087
L_5251:
        MOVR    R5,     R7                      ; 5251   00AF

L_5252:
        EIS                                     ; 5252   0002
        CLRR    R0                              ; 5253   01C0
L_5254:
        EIS                                     ; 5254   0002
        NOP                                     ; 5255   0034
        NOP                                     ; 5256   0034
        NOP                                     ; 5257   0034
        NOP                                     ; 5258   0034
        DECR    R0                              ; 5259   0010
        BNEQ    L_5254                          ; 525A   022C 0007

        ADDI    #$0003, R5                      ; 525C   02FD 0003
        MOVR    R5,     R7                      ; 525E   00AF

L_525F:
        SDBD                                    ; 525F   0001
        MVI@    R5,     R0                      ; 5260   02A8
        MVO     R0,     G_0318                  ; 5261   0240 0318
        SDBD                                    ; 5263   0001
        MVI@    R5,     R4                      ; 5264   02AC
        MVO     R4,     G_0317                  ; 5265   0244 0317
        MOVR    R5,     R7                      ; 5267   00AF

        PSHR    R5                              ; 5268   0275
        MVII    #$0001, R1                      ; 5269   02B9 0001
        MVO     R1,     G_0163                  ; 526B   0241 0163
L_526D:
        ADDI    #$0164, R1                      ; 526D   02F9 0164
L_526F:
        MVI@    R1,     R0                      ; 526F   0288
        DECR    R0                              ; 5270   0010
        MVO@    R0,     R1                      ; 5271   0248
        BPL     L_5280                          ; 5272   0203 000C

        MOVR    R7,     R5                      ; 5274   00BD
        ADDI    #$0004, R5                      ; 5275   02FD 0004
        MVI     G_0317, R7                      ; 5277   0287 0317

        MVI     G_0163, R1                      ; 5279   0281 0163
        ADDI    #$0164, R1                      ; 527B   02F9 0164
        MVO@    R0,     R1                      ; 527D   0248
        B       L_526F                          ; 527E   0220 0010

L_5280:
        MVI     G_0163, R1                      ; 5280   0281 0163
        DECR    R1                              ; 5282   0011
        MVO     R1,     G_0163                  ; 5283   0241 0163
        BPL     L_526D                          ; 5285   0223 0019
        PULR    R7                              ; 5287   02B7

L_5288:
        PSHR    R5                              ; 5288   0275

        JSR     R5,     L_5324                  ; 5289   0004 0150 0324
        DECLE   $03F4,  $006F,  $03F7,  $000B   ; 528C   03F4 006F 03F7 000B
        DECLE   $03F7                           ; 5290   03F7

        INCR    R7                              ; 5291   000F

        XOR@    R6,     R4                      ; 5292   03F4
L_5293:
        ADDR    R3,     R7                      ; 5293   00DF

        XOR@    R6,     R6                      ; 5294   03F6
        SUBR    R5,     R3                      ; 5295   012B
        CMPR    R5,     R0                      ; 5296   0168
        SUBR    R5,     R0                      ; 5297   0128
        XOR@    R6,     R6                      ; 5298   03F6
        CMPR    R3,     R7                      ; 5299   015F
        XOR@    R6,     R6                      ; 529A   03F6
        SUBR    R5,     R7                      ; 529B   012F

        DECLE   $006C,  $001C,  $006C,  $001C   ; 529C   006C 001C 006C 001C
        DECLE   $006C,  $001C,  $006C,  $001C   ; 52A0   006C 001C 006C 001C
        DECLE   $006C,  $001C,  $006C,  $001C   ; 52A4   006C 001C 006C 001C
        DECLE   $006C,  $001C,  $006C,  $001C   ; 52A8   006C 001C 006C 001C
        DECLE   $03F4,  $006F,  $03F7,  $000B   ; 52AC   03F4 006F 03F7 000B
        DECLE   $03F7                           ; 52B0   03F7

        INCR    R7                              ; 52B1   000F

        XOR@    R6,     R4                      ; 52B2   03F4
L_52B3:
        ADDR    R3,     R7                      ; 52B3   00DF

        XOR@    R6,     R6                      ; 52B4   03F6
        SUBR    R5,     R3                      ; 52B5   012B
        CMPR    R3,     R0                      ; 52B6   0158
        SUBR    R5,     R0                      ; 52B7   0128
        XOR@    R6,     R6                      ; 52B8   03F6
        CMPR    R5,     R7                      ; 52B9   016F
        XOR@    R6,     R6                      ; 52BA   03F6
        SUBR    R5,     R7                      ; 52BB   012F

        DECLE   $006C,  $001C,  $006C,  $001C   ; 52BC   006C 001C 006C 001C
        DECLE   $006C,  $001C,  $006C,  $001C   ; 52C0   006C 001C 006C 001C
        DECLE   $006C,  $001C,  $006C,  $001C   ; 52C4   006C 001C 006C 001C
        DECLE   $006C,  $001C,  $006C,  $001C   ; 52C8   006C 001C 006C 001C
        DECLE   $03F4,  $006F,  $03F7,  $000B   ; 52CC   03F4 006F 03F7 000B
        DECLE   $03F7                           ; 52D0   03F7

        INCR    R7                              ; 52D1   000F

        XOR@    R6,     R4                      ; 52D2   03F4
L_52D3:
        ADDR    R3,     R7                      ; 52D3   00DF

        DECLE   $03F6,  $012B,  $0168,  $0128   ; 52D4   03F6 012B 0168 0128
        DECLE   $03F6,  $01BF                   ; 52D8   03F6 01BF

        XOR@    R6,     R6                      ; 52DA   03F6
        SUBR    R5,     R7                      ; 52DB   012F

        DECLE   $00BC,  $006C,  $00BC,  $006C   ; 52DC   00BC 006C 00BC 006C
        DECLE   $00BC,  $006C,  $00BC,  $006C   ; 52E0   00BC 006C 00BC 006C
        DECLE   $00BC,  $006C,  $00BC,  $006C   ; 52E4   00BC 006C 00BC 006C
        DECLE   $00BC,  $006C,  $00BC,  $006C   ; 52E8   00BC 006C 00BC 006C
        DECLE   $01BE,  $00FE,  $00BE,  $01DE   ; 52EC   01BE 00FE 00BE 01DE
        DECLE   $011E,  $00DE,  $03F4,  $01EF   ; 52F0   011E 00DE 03F4 01EF

        XOR@    R6,     R4                      ; 52F4   03F4
        SUBR    R5,     R7                      ; 52F5   012F

        DECLE   $03F4,  $00FF,  $020F,  $014F   ; 52F6   03F4 00FF 020F 014F
        DECLE   $00BF                           ; 52FA   00BF

        BGT     L_518E                          ; 52FB   022E 016E

        XOR@    R6,     R6                      ; 52FD   03F6
        ADDR    R3,     R7                      ; 52FE   00DF

        DECLE   $023E,  $017E,  $03F2,  $025E   ; 52FF   023E 017E 03F2 025E
        DECLE   $019E,  $022E,  $01EE,  $019E   ; 5303   019E 022E 01EE 019E
        DECLE   $016E,  $022C,  $012E,  $023C   ; 5307   016E 022C 012E 023C
        DECLE   $03F4,  $025F,  $03F4,  $019F   ; 530B   03F4 025F 03F4 019F

        XOR@    R6,     R4                      ; 530F   03F4
        ADDR    R3,     R7                      ; 5310   00DF

        DECLE   $03F4,  $027F,  $03F4,  $01BF   ; 5311   03F4 027F 03F4 01BF
        DECLE   $03F4,  $00BF                   ; 5315   03F4 00BF

        XOR@    R6,     R4                      ; 5317   03F4
        MVI@    R3,     R7                      ; 5318   029F

        DECLE   $03F4,  $01DF                   ; 5319   03F4 01DF

        XOR@    R6,     R4                      ; 531B   03F4
        MOVR    R1,     R7                      ; 531C   008F

        XOR@    R6,     R6                      ; 531D   03F6
        MVI@    R5,     R7                      ; 531E   02AF

        DECLE   $03F6,  $01EF,  $03F6,  $006F   ; 531F   03F6 01EF 03F6 006F
        DECLE   $0000                           ; 5323   0000
L_5324:
        MVO     R5,     G_031D                  ; 5324   0245 031D
        MVII    #$031F, R4                      ; 5326   02BC 031F
        MVII    #$0028, R1                      ; 5328   02B9 0028
        MVO@    R1,     R4                      ; 532A   0261
        MVO@    R1,     R4                      ; 532B   0261
        MVO@    R1,     R4                      ; 532C   0261

        JSR     R5,     X_PLAY_SFX1             ; 532D   0004 0118 03BB
        DECLE   $0389                           ; 5330  SFX data
        DECLE   $002B                           ; 5331  SFX data
        DECLE   $0077,  $0036,  $0053           ; 5332  SFX data
        DECLE   $02CF                           ; 5335  SFX end

UC_5336:
        MVII    #$031F, R3                      ; 5336  SLIB UCALL target
        MVII    #$01F0, R4                      ; 5338   02BC 01F0
L_533A:
        MVI@    R3,     R0                      ; 533A   0298
        SARC    R0,     1                       ; 533B   0078
        DECR    R0                              ; 533C   0010
        BNEQ    L_5348                          ; 533D   020C 0009
        BNC     L_534C                          ; 533F   0209 000B

        MOVR    R4,     R2                      ; 5341   00A2
        ADDI    #$000B, R2                      ; 5342   02FA 000B
        MVO@    R0,     R2                      ; 5344   0250
        MVII    #$0004, R0                      ; 5345   02B8 0004
        INCR    R7                              ; 5347   000F

L_5348:
        RLC     R0,     1                       ; 5348   0050
L_5349:
        MVO@    R0,     R3                      ; 5349   0258
        B       L_5374                          ; 534A   0200 0028

L_534C:
        MVI     G_031D, R5                      ; 534C   0285 031D
        MVO     R5,     G_035F                  ; 534E   0245 035F
        MVI@    R5,     R0                      ; 5350   02A8
        TSTR    R0                              ; 5351   0080
        BEQ     L_537E                          ; 5352   0204 002A

        JSR     R5,     .EXEC.AF4               ; 5354   0004 0118 02F4

        MVI     G_035F, R5                      ; 5357   0285 035F
        MVO     R5,     G_031D                  ; 5359   0245 031D
        PSHR    R1                              ; 535B   0271
        SLR     R1,     1                       ; 535C   0061
        ADD@    R6,     R1                      ; 535D   02F1
        SARC    R2,     1                       ; 535E   007A
        BNC     L_5363                          ; 535F   0209 0002

        DECR    R1                              ; 5361   0011
        DECR    R1                              ; 5362   0011
L_5363:
        RLC     R1,     1                       ; 5363   0051
        MOVR    R0,     R2                      ; 5364   0082
        BEQ     L_536A                          ; 5365   0204 0003

        MVII    #$032D, R2                      ; 5367   02BA 032D
        SUBR    R3,     R2                      ; 5369   011A
L_536A:
        MVO@    R1,     R3                      ; 536A   0259
        MOVR    R4,     R1                      ; 536B   00A1
        MVO@    R0,     R1                      ; 536C   0248
        ADDI    #$0004, R1                      ; 536D   02F9 0004
        SWAP    R0,     1                       ; 536F   0040
        MVO@    R0,     R1                      ; 5370   0248
        ADDI    #$0007, R1                      ; 5371   02F9 0007
        MVO@    R2,     R1                      ; 5373   024A
L_5374:
        INCR    R3                              ; 5374   000B
        INCR    R4                              ; 5375   000C
        CMPI    #$0322, R3                      ; 5376   037B 0322
        BNEQ    L_533A                          ; 5378   022C 003F

        MOVR    R7,     R4                      ; 537A   00BC
        SUBI    #$004A, R4                      ; 537B   033C 004A
        PULR    R7                              ; 537D   02B7

L_537E:
        MOVR    R7,     R4                      ; 537E   00BC
        SUBI    #$004A, R4                      ; 537F   033C 004A
        PULR    R7                              ; 5381   02B7

L_5382:
        PSHR    R5                              ; 5382   0275
L_5383:
        MVI@    R2,     R1                      ; 5383   0291
        SLR     R1,     2                       ; 5384   0065
        SLR     R1,     2                       ; 5385   0065

        JSR     R5,     L_5393                  ; 5386   0004 0150 0393

        MVI@    R2,     R1                      ; 5389   0291
        SLL     R1,     1                       ; 538A   0049

        JSR     R5,     L_5393                  ; 538B   0004 0150 0393

        INCR    R2                              ; 538E   000A
        DECR    R0                              ; 538F   0010
        BNEQ    L_5383                          ; 5390   022C 000E
        PULR    R7                              ; 5392   02B7

L_5393:
        PSHR    R5                              ; 5393   0275
        PSHR    R0                              ; 5394   0270
        ANDI    #$003E, R1                      ; 5395   03B9 003E
        ADDR    R3,     R1                      ; 5397   00D9
        MOVR    R1,     R5                      ; 5398   008D
        SDBD                                    ; 5399   0001
        MVI@    R5,     R0                      ; 539A   02A8
        MVO@    R0,     R4                      ; 539B   0260
        PULR    R0                              ; 539C   02B0
        PULR    R7                              ; 539D   02B7

L_539E:
        PSHR    R5                              ; 539E   0275
        MVII    #$0200, R4                      ; 539F   02BC 0200
        MVII    #$000C, R5                      ; 53A1   02BD 000C
L_53A3:
        MVI@    R1,     R0                      ; 53A3   0288
        INCR    R1                              ; 53A4   0009
        PSHR    R1                              ; 53A5   0271
        PSHR    R2                              ; 53A6   0272
        PSHR    R5                              ; 53A7   0275
        ADDR    R0,     R2                      ; 53A8   00C2
        MVII    #$000A, R0                      ; 53A9   02B8 000A

        JSR     R5,     L_5382                  ; 53AB   0004 0150 0382

        PULR    R5                              ; 53AE   02B5
        PULR    R2                              ; 53AF   02B2
        PULR    R1                              ; 53B0   02B1
        DECR    R5                              ; 53B1   0015
        BNEQ    L_53A3                          ; 53B2   022C 0010
        PULR    R7                              ; 53B4   02B7

        DECLE   $0060,  $0055,  $00DE,  $0053   ; 53B5   0060 0055 00DE 0053
        DECLE   $00FF,  $0053,  $0068,  $0056   ; 53B9   00FF 0053 0068 0056
        DECLE   $00B0,  $0056,  $00D1,  $0053   ; 53BD   00B0 0056 00D1 0053
        DECLE   $0080,  $0001,  $0000,  $0001   ; 53C1   0080 0001 0000 0001
        DECLE   $0004,  $0001,  $0001,  $0001   ; 53C5   0004 0001 0001 0001
        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 53C9   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 53CD   01B0 01A0 0190 0180
        DECLE   $004E,  $0046,  $004F,  $004F   ; 53D1   004E 0046 004F 004F
        DECLE   $0054,  $0042,  $0041,  $004C   ; 53D5   0054 0042 0041 004C
        DECLE   $004C,  $0000,  $0004,  $0350   ; 53D9   004C 0000 0004 0350
        DECLE   $0252,  $00EC,  $0053,  $0001   ; 53DD   0252 00EC 0053 0001
        DECLE   $0000,  $0068,  $0052,  $0001   ; 53E1   0000 0068 0052 0001
        DECLE   $0000,  $00FB,  $0059,  $000F   ; 53E5   0000 00FB 0059 000F
        DECLE   $0000,  $0000,  $0000           ; 53E9   0000 0000 0000

        PSHR    R5                              ; 53EC   0275

        JSR     R5,     L_5240                  ; 53ED   0004 0150 0240
        JSR     R5,     L_5990                  ; 53F0   0004 0158 0190

        PULR    R7                              ; 53F3   02B7

L_53F4:
        MVII    #$02F1, R6                      ; 53F4   02BE 02F1
        SDBD                                    ; 53F6   0001
        MVII    #$53C9, R0                      ; 53F7   02B8 00C9 0053
        MVO     R0,     G_02F0                  ; 53FA   0240 02F0
        J       .EXEC.041                       ; 53FC   0004 0310 0041

        PSHR    R5                              ; 53FF   0275
        MVII    #$0004, R0                      ; 5400   02B8 0004
        MVO     R0,     G_0103                  ; 5402   0240 0103
        SDBD                                    ; 5404   0001
        MVII    #$53E2, R1                      ; 5405   02B9 00E2 0053

        JSR     R5,     X_TIMER_STOP            ; 5408   0004 0118 0038

        MVII    #$0016, R1                      ; 540B   02B9 0016
        MVO     R1,     G_016A                  ; 540D   0241 016A
        SDBD                                    ; 540F   0001
        MVII    #$56E4, R1                      ; 5410   02B9 00E4 0056
        SDBD                                    ; 5413   0001
        MVII    #$56F0, R2                      ; 5414   02BA 00F0 0056
        SDBD                                    ; 5417   0001
        MVII    #$56BE, R3                      ; 5418   02BB 00BE 0056

        JSR     R5,     L_539E                  ; 541B   0004 0150 039E
        JSR     R5,     L_5A41                  ; 541E   0004 0158 0241
        DECLE   $02DC                           ; 5421   02DC

        JSR     R5,     L_5A71                  ; 5422   0004 0158 0271

        MVII    #$02DE, R4                      ; 5425   02BC 02DE

        JSR     R5,     L_5094                  ; 5427   0004 0150 0094
        DECLE   $03FE,  $0191,  $007E,  $0000   ; 542A   03FE 0191 007E 0000

        MOVR    R7,     R3                      ; 542E   00BB
        ADDI    #$0081, R3                      ; 542F   02FB 0081

        JSR     R5,     L_5215                  ; 5431   0004 0150 0215
        DECLE   $0001,  $0042,  $0018,  $0044   ; 5434   0001 0042 0018 0044
        DECLE   $0057,  $0003,  $0052,  $001A   ; 5438   0057 0003 0052 001A
        DECLE   $0035,  $0057,  $0001,  $0040   ; 543C   0035 0057 0001 0040
        DECLE   $001A,  $0044,  $0057,  $0003   ; 5440   001A 0044 0057 0003
        DECLE   $0051,  $0018,  $002C,  $0057   ; 5444   0051 0018 002C 0057
        DECLE   $0000                           ; 5448   0000

        JSR     R5,     L_525F                  ; 5449   0004 0150 025F
        BIDECLE $5B0E,  $5AEE                   ; 544C   000E 005B 00EE 005A

        JSR     R5,     L_523A                  ; 5450   0004 0150 023A
        DECLE   $001D,  $005D,  $0057,  $0009   ; 5453   001D 005D 0057 0009
        DECLE   $0066,  $0057,  $0000,  $00EC   ; 5457   0066 0057 0000 00EC
        DECLE   $0054,  $0000,  $00A8,  $0057   ; 545B   0054 0000 00A8 0057
        DECLE   $0000,  $00A5,  $0057,  $0000   ; 545F   0000 00A5 0057 0000
        DECLE   $00CB,  $005A,  $0004,  $00C8   ; 5463   00CB 005A 0004 00C8
        DECLE   $0054,  $0009,  $0030,  $005A   ; 5467   0054 0009 0030 005A
        DECLE   $0000,  $0054,  $005A,  $000E   ; 546B   0000 0054 005A 000E
        DECLE   $00A5,  $0057,  $0027,  $001C   ; 546F   00A5 0057 0027 001C
        DECLE   $0059,  $0000,  $00FB,  $0054   ; 5473   0059 0000 00FB 0054
        DECLE   $002A,  $000C,  $0055,  $0013   ; 5477   002A 000C 0055 0013
        DECLE   $00A8,  $0057,  $0000,  $00A5   ; 547B   00A8 0057 0000 00A5
        DECLE   $0057,  $0004,  $00DB,  $0054   ; 547F   0057 0004 00DB 0054
        DECLE   $0000,  $0019,  $0055,  $001D   ; 5483   0000 0019 0055 001D
        DECLE   $0066,  $0057,  $0027,  $005D   ; 5487   0066 0057 0027 005D
        DECLE   $0057,  $0000,  $0023,  $0055   ; 548B   0057 0000 0023 0055
        DECLE   $0000,  $002E,  $0058,  $0000   ; 548F   0000 002E 0058 0000
        DECLE   $00A8,  $0057,  $0000,  $00A5   ; 5493   00A8 0057 0000 00A5
        DECLE   $0057,  $0000,  $00CB,  $005A   ; 5497   0057 0000 00CB 005A
        DECLE   $0004,  $00C8,  $0054,  $0009   ; 549B   0004 00C8 0054 0009
        DECLE   $0030,  $005A,  $0000,  $0054   ; 549F   0030 005A 0000 0054
        DECLE   $005A,  $0027,  $001C,  $0059   ; 54A3   005A 0027 001C 0059
        DECLE   $0000,  $0009,  $0059,  $0014   ; 54A7   0000 0009 0059 0014
        DECLE   $00C2,  $0059,  $00BF           ; 54AB   00C2 0059 00BF

        SLLC    R0,     1                       ; 54AE   0058
        SLLC    R3,     1                       ; 54AF   005B
        MOVR    R0,     R5                      ; 54B0   0085
        ADCR    R4                              ; 54B1   002C
        INCR    R6                              ; 54B2   000E
        TSTR    R0                              ; 54B3   0080
        NOP                                     ; 54B4   0034
        INCR    R2                              ; 54B5   000A
        TSTR    R0                              ; 54B6   0080
        NEGR    R4                              ; 54B7   0024
        INCR    R2                              ; 54B8   000A
        SARC    R0,     1                       ; 54B9   0078
        NEGR    R6                              ; 54BA   0026
        INCR    R1                              ; 54BB   0009
        RLC     R0,     1                       ; 54BC   0050
        ADCR    R4                              ; 54BD   002C
        INCR    R6                              ; 54BE   000E
        SLLC    R0,     1                       ; 54BF   0058
        RSWD    R0                              ; 54C0   0038
        INCR    R1                              ; 54C1   0009
        SLLC    R0,     1                       ; 54C2   0058
        ADCR    R0                              ; 54C3   0028
        INCR    R1                              ; 54C4   0009
        SLLC    R0,     1                       ; 54C5   0058
        NEGR    R0                              ; 54C6   0020
        INCR    R1                              ; 54C7   0009
        PSHR    R5                              ; 54C8   0275
        SDBD                                    ; 54C9   0001
        MVII    #$56DA, R5                      ; 54CA   02BD 00DA 0056
        MVII    #$026E, R4                      ; 54CD   02BC 026E
        MVII    #$0003, R0                      ; 54CF   02B8 0003
L_54D1:
        SDBD                                    ; 54D1   0001
        MVI@    R5,     R1                      ; 54D2   02A9
        MVO@    R1,     R4                      ; 54D3   0261
        DECR    R0                              ; 54D4   0010
        BNEQ    L_54D1                          ; 54D5   022C 0005

        INCR    R4                              ; 54D7   000C
        CLRR    R1                              ; 54D8   01C9
        MVO@    R1,     R4                      ; 54D9   0261
        PULR    R7                              ; 54DA   02B7

        PSHR    R5                              ; 54DB   0275
        SDBD                                    ; 54DC   0001
        MVII    #$5718, R2                      ; 54DD   02BA 0018 0057
        SDBD                                    ; 54E0   0001
        MVII    #$56BE, R3                      ; 54E1   02BB 00BE 0056
        MVII    #$000A, R0                      ; 54E4   02B8 000A
        MVII    #$0264, R4                      ; 54E6   02BC 0264

        JSR     R5,     L_5382                  ; 54E8   0004 0150 0382

        PULR    R7                              ; 54EB   02B7

        PSHR    R5                              ; 54EC   0275

        JSR     R5,     L_5A62                  ; 54ED   0004 0158 0262

        ADD@    R3,     R7                      ; 54F0   02DF

        SLLC    R3,     2                       ; 54F1   005F
        INCR    R3                              ; 54F2   000B
        CMPR    R7,     R2                      ; 54F3   017A
        MVO@    R7,     R4                      ; 54F4   0267
        MOVR    R3,     R2                      ; 54F5   009A
        XORR    R5,     R3                      ; 54F6   01EB
        COMR    R0                              ; 54F7   0018
        XOR     G_03C0, R4                      ; 54F8   03C4 03C0
        PULR    R7                              ; 54FA   02B7

        PSHR    R5                              ; 54FB   0275

        JSR     R5,     L_5A62                  ; 54FC   0004 0158 0262
        DECLE   $02DD,  $023F                   ; 54FF   02DD 023F

        MVI@    R2,     R2                      ; 5501   0292
        ADDR    R5,     R0                      ; 5502   00E8
        ANDR    R4,     R6                      ; 5503   01A6
        CMP@    R3,     R6                      ; 5504   035E
        SUBR    R3,     R2                      ; 5505   011A
        ADCR    R3                              ; 5506   002B
        XORR    R0,     R2                      ; 5507   01C2
        CMPR    R1,     R0                      ; 5508   0148
        ANDR    R4,     R6                      ; 5509   01A6
        XOR     .BTAB.B7,R0                     ; 550A   03C0 02B7
        PSHR    R5                              ; 550C   0275

        JSR     R5,     L_5A62                  ; 550D   0004 0158 0262
        DECLE   $02E2,  $027F,  $0002,  $014B   ; 5510   02E2 027F 0002 014B
        DECLE   $010D,  $00DE,  $009E,  $0000   ; 5514   010D 00DE 009E 0000

        PULR    R7                              ; 5518   02B7

        PSHR    R5                              ; 5519   0275

        JSR     R5,     L_5A71                  ; 551A   0004 0158 0271

        MVII    #$02DE, R4                      ; 551D   02BC 02DE

        JSR     R5,     L_5A49                  ; 551F   0004 0158 0249

        PULR    R7                              ; 5522   02B7

        PSHR    R5                              ; 5523   0275

        JSR     R5,     L_5A62                  ; 5524   0004 0158 0262
        DECLE   $02E1,  $027F,  $0238           ; 5527   02E1 027F 0238

        CMP     G_034F, R0                      ; 552A   0340 034F
        DECR    R2                              ; 552C   0012
        MVO@    R2,     R3                      ; 552D   025A
        XOR     .BTAB.B7,R0                     ; 552E   03C0 02B7
        PSHR    R5                              ; 5530   0275

        JSR     R5,     .EXEC.7AE               ; 5531   0004 0114 03AE
        JSR     R5,     L_5A71                  ; 5534   0004 0158 0271
        JSR     R5,     L_596B                  ; 5537   0004 0158 016B

        MVII    #$0005, R0                      ; 553A   02B8 0005

        JSR     R5,     X_PLAY_CHEER1           ; 553C   0004 011C 02D5
        JSR     R5,     L_5A62                  ; 553F   0004 0158 0262
        DECLE   $02E2,  $027F                   ; 5542   02E2 027F

        XORR    R2,     R4                      ; 5544   01D4
        SWAP    R3,     2                       ; 5545   0047
        SAR     R2,     2                       ; 5546   006E
        ADD@    R1,     R5                      ; 5547   02CD
        XOR     G_03C0, R4                      ; 5548   03C4 03C0
        MVII    #$0002, R1                      ; 554A   02B9 0002
        MVII    #$0002, R3                      ; 554C   02BB 0002
        MVII    #$0216, R4                      ; 554E   02BC 0216
        MVII    #$0029, R0                      ; 5550   02B8 0029

        JSR     R5,     X_PRNUM_RGT             ; 5552   0004 0118 00C5

        MVII    #$0007, R1                      ; 5555   02B9 0007
        MVII    #$021B, R4                      ; 5557   02BC 021B

        JSR     R5,     L_5094                  ; 5559   0004 0150 0094

        MOVR    R3,     R7                      ; 555C   009F

        DECLE   $01A3,  $03C0,  $02B7,  $0030   ; 555D   01A3 03C0 02B7 0030
        DECLE   $0010,  $003C,  $001E,  $001A   ; 5561   0010 003C 001E 001A
        DECLE   $00FA,  $0000,  $0018,  $0018   ; 5565   00FA 0000 0018 0018
        DECLE   $003C,  $0024,  $0066,  $0043   ; 5569   003C 0024 0066 0043
        DECLE   $0041,  $00C0,  $0000,  $0060   ; 556D   0041 00C0 0000 0060
        DECLE   $0020,  $0078,  $003C,  $003E   ; 5571   0020 0078 003C 003E
        DECLE   $007A,  $0002,  $0018,  $001C   ; 5575   007A 0002 0018 001C
        DECLE   $003C,  $0024,  $0027,  $0021   ; 5579   003C 0024 0027 0021
        DECLE   $0021,  $0020,  $0060,  $0060   ; 557D   0021 0020 0060 0060
        DECLE   $0020,  $0078,  $003C,  $003C   ; 5581   0020 0078 003C 003C
        DECLE   $003C,  $007C,  $0018,  $0018   ; 5585   003C 007C 0018 0018
        DECLE   $0018,  $0018,  $001E,  $0012   ; 5589   0018 0018 001E 0012
        DECLE   $0012,  $0010,  $0030,  $0060   ; 558D   0012 0010 0030 0060
        DECLE   $0020,  $0070,  $0030,  $0030   ; 5591   0020 0070 0030 0030
        DECLE   $0030,  $0030,  $0030,  $0030   ; 5595   0030 0030 0030 0030
        DECLE   $0030,  $0030,  $003C,  $0014   ; 5599   0030 0030 003C 0014
        DECLE   $0014,  $0010,  $0030,  $0060   ; 559D   0014 0010 0030 0060
        DECLE   $0020,  $0078,  $003C,  $003C   ; 55A1   0020 0078 003C 003C
        DECLE   $003C,  $007C,  $0018,  $0038   ; 55A5   003C 007C 0018 0038
        DECLE   $007C,  $0044,  $0074,  $0014   ; 55A9   007C 0044 0074 0014
        DECLE   $0004,  $0004,  $0008,  $0060   ; 55AD   0004 0004 0008 0060
        DECLE   $0020,  $0078,  $003C,  $003E   ; 55B1   0020 0078 003C 003E
        DECLE   $007A,  $0002,  $0018,  $0038   ; 55B5   007A 0002 0018 0038
        DECLE   $00FC,  $0084,  $00E4,  $0024   ; 55B9   00FC 0084 00E4 0024
        DECLE   $0022,  $0002,  $0002,  $0030   ; 55BD   0022 0002 0002 0030
        DECLE   $0010,  $003C,  $001E,  $001A   ; 55C1   0010 003C 001E 001A
        DECLE   $00FA,  $0000,  $0018,  $0018   ; 55C5   00FA 0000 0018 0018
        DECLE   $00FC,  $0084,  $0046,  $0042   ; 55C9   00FC 0084 0046 0042
        DECLE   $0003,  $0001,  $0001,  $0030   ; 55CD   0003 0001 0001 0030
        DECLE   $0010,  $003F,  $0019,  $00F9   ; 55D1   0010 003F 0019 00F9
        DECLE   $0018,  $0000,  $0018,  $0018   ; 55D5   0018 0000 0018 0018
        DECLE   $00FC,  $0084,  $0086,  $0082   ; 55D9   00FC 0084 0086 0082
        DECLE   $0003,  $0001,  $0000,  $0018   ; 55DD   0003 0001 0000 0018
        DECLE   $0008,  $001C,  $001E,  $001A   ; 55E1   0008 001C 001E 001A
        DECLE   $002D,  $002D,  $0021,  $000D   ; 55E5   002D 002D 0021 000D
        DECLE   $000C,  $0014,  $0014,  $0012   ; 55E9   000C 0014 0014 0012
        DECLE   $0012,  $0012,  $0036,  $0000   ; 55ED   0012 0012 0036 0000
        DECLE   $0000,  $0000,  $0070,  $00F8   ; 55F1   0000 0000 0070 00F8
        DECLE   $007C,  $003A,  $0026,  $0016   ; 55F5   007C 003A 0026 0016
        DECLE   $000E,  $0006,  $0006,  $0006   ; 55F9   000E 0006 0006 0006
        DECLE   $0002,  $0002,  $0006,  $0000   ; 55FD   0002 0002 0006 0000
        DECLE   $0000,  $0018,  $0018,  $0024   ; 5601   0000 0018 0018 0024
        DECLE   $005A,  $005A,  $003C,  $0024   ; 5605   005A 005A 003C 0024
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5609   0018 0018 0018 0018
        DECLE   $0018,  $0000,  $003C,  $0000   ; 560D   0018 0000 003C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5611   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 5615   0000 0000 0000

        ADDR    R0,     R1                      ; 5618   00C1
        MOVR    R0,     R5                      ; 5619   0085
        ADDR    R0,     R7                      ; 561A   00C7

        DECLE   $00EE,  $00EA,  $00BB,  $0099   ; 561B   00EE 00EA 00BB 0099
        DECLE   $00F9,  $0000,  $0000,  $0000   ; 561F   00F9 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5623   0000 0000 0000 0000
        DECLE   $0000,  $00C3,  $0042,  $00F2   ; 5627   0000 00C3 0042 00F2
        DECLE   $007B,  $003E,  $0026,  $0026   ; 562B   007B 003E 0026 0026
        DECLE   $00E6,  $0000,  $0000,  $0000   ; 562F   00E6 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 5633   0000 0000 0000 00C0
        DECLE   $0078,  $00FC,  $0076,  $006E   ; 5637   0078 00FC 0076 006E
        DECLE   $004E,  $004A,  $004F,  $0045   ; 563B   004E 004A 004F 0045
        DECLE   $0085,  $0000,  $0000,  $0000   ; 563F   0085 0000 0000 0000
        DECLE   $0000,  $0060,  $0038,  $007C   ; 5643   0000 0060 0038 007C
        DECLE   $001E,  $001A,  $0036           ; 5647   001E 001A 0036

        SAR     R0,     2                       ; 564A   006C
        INCR    R4                              ; 564B   000C
        INCR    R4                              ; 564C   000C
        INCR    R7                              ; 564D   000F

        INCR    R1                              ; 564E   0009
L_564F:
        COMR    R1                              ; 564F   0019
        DECLE   $0000,  $0000,  $0060,  $0038   ; 5650   0000 0000 0060 0038
        DECLE   $007C,  $001E,  $001E,  $00F2   ; 5654   007C 001E 001E 00F2
        DECLE   $000C,  $000C,  $003C,  $0024   ; 5658   000C 000C 003C 0024
        DECLE   $0026,  $0063,  $0001,  $0001   ; 565C   0026 0063 0001 0001
        DECLE   $0000,  $0000,  $0038,  $0000   ; 5660   0000 0000 0038 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5664   0000 0000 0000 0000
        DECLE   $007C,  $006C,  $006C,  $006C   ; 5668   007C 006C 006C 006C
        DECLE   $007C,  $0001,  $00FF,  $00FF   ; 566C   007C 0001 00FF 00FF
        DECLE   $0039,  $0019,  $0019,  $0019   ; 5670   0039 0019 0019 0019
        DECLE   $003D,  $0001,  $00FF,  $00FF   ; 5674   003D 0001 00FF 00FF
        DECLE   $00FD,  $00C1,  $00DD,  $00CD   ; 5678   00FD 00C1 00DD 00CD
        DECLE   $00FD,  $0001,  $00FF,  $00FF   ; 567C   00FD 0001 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 5680   0000 0000 0000 00C0
        DECLE   $00FC,  $006E,  $004B,  $0085   ; 5684   00FC 006E 004B 0085
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5688   0000 0000 0000 0000
        DECLE   $0003,  $0007,  $000D,  $000A   ; 568C   0003 0007 000D 000A
        DECLE   $0000,  $0000,  $0000,  $0030   ; 5690   0000 0000 0000 0030
        DECLE   $00F0,  $0060,  $0020,  $0010   ; 5694   00F0 0060 0020 0010
        DECLE   $0000,  $00C0,  $007C,  $003E   ; 5698   0000 00C0 007C 003E
        DECLE   $0016,  $000E,  $0002,  $0006   ; 569C   0016 000E 0002 0006
        DECLE   $0000                           ; 56A0   0000

        SLR     R0,     1                       ; 56A1   0060
        SARC    R0,     1                       ; 56A2   0078
L_56A3:
        RSWD    R4                              ; 56A3   003C
        DECLE   $00FC,  $001C,  $0016,  $0032   ; 56A4   00FC 001C 0016 0032
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56A8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0000   ; 56AC   0000 0000 0003 0000
        DECLE   $0010,  $005D,  $0207,  $028F   ; 56B0   0010 005D 0207 028F
        DECLE   $0361,  $0319,  $02E3,  $0103   ; 56B4   0361 0319 02E3 0103
        DECLE   $00C0,  $0001,  $0380,  $0010   ; 56B8   00C0 0001 0380 0010
        DECLE   $0217,  $00C0,  $0006,  $0000   ; 56BC   0217 00C0 0006 0000
        DECLE   $000F,  $0008,  $0027,  $0008   ; 56C0   000F 0008 0027 0008
        DECLE   $0047,  $0006,  $0007,  $0008   ; 56C4   0047 0006 0007 0008
        DECLE   $000F,  $0006,  $001F           ; 56C8   000F 0006 001F

        INCR    R0                              ; 56CB   0008
L_56CC:
        DECR    R7                              ; 56CC   0017

        DECLE   $0008,  $0037,  $0008,  $002F   ; 56CD   0008 0037 0008 002F
        DECLE   $0008,  $003F,  $0008,  $0007   ; 56D1   0008 003F 0008 0007
        DECLE   $0020,  $0059,  $0018,  $0072   ; 56D5   0020 0059 0018 0072
        DECLE   $0018,  $0049,  $0018,  $0051   ; 56D9   0018 0049 0018 0051
        DECLE   $0018,  $0042,  $0018,  $005F   ; 56DD   0018 0042 0018 005F
        DECLE   $0006,  $006F,  $0008,  $0000   ; 56E1   0006 006F 0008 0000
        DECLE   $0000,  $0014,  $0014,  $001E   ; 56E5   0000 0014 0014 001E
        DECLE   $0028,  $001E,  $0014,  $0014   ; 56E9   0028 001E 0014 0014
        DECLE   $0014,  $0032,  $0000,  $0000   ; 56ED   0014 0032 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56F1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56F5   0000 0000 0000 0000
        DECLE   $0000,  $0163,  $0063,  $0063   ; 56F9   0000 0163 0063 0063
        DECLE   $0062,  $0021,  $0021,  $0041   ; 56FD   0062 0021 0021 0041
        DECLE   $0021,  $0022,  $0021,  $0000   ; 5701   0021 0022 0021 0000
        DECLE   $0000,  $0000,  $0005,  $0000   ; 5705   0000 0000 0005 0000
        DECLE   $0000,  $00A0,  $0000,  $0005   ; 5709   0000 00A0 0000 0005
        DECLE   $0000,  $0000,  $0000,  $0000   ; 570D   0000 0000 0000 0000
        DECLE   $0005,  $0084,  $0084,  $00A4   ; 5711   0005 0084 0084 00A4
        DECLE   $0084,  $0085,  $0084,  $0000   ; 5715   0084 0085 0084 0000
        DECLE   $0000,  $0000,  $0005,  $0000   ; 5719   0000 0000 0005 0000
        DECLE   $0192,  $00A0,  $01A0,  $0005   ; 571D   0192 00A0 01A0 0005
        DECLE   $0000,  $0011,  $0231,  $0231   ; 5721   0000 0011 0231 0231
        DECLE   $022A,  $00C6,  $00C6,  $00E6   ; 5725   022A 00C6 00C6 00E6
        DECLE   $00C6,  $00C8,  $0126,  $0300   ; 5729   00C6 00C8 0126 0300
        DECLE   $0000,  $0032,  $0058,  $0008   ; 572D   0000 0032 0058 0008
        DECLE   $0000,  $0002,  $00E8,  $0058   ; 5731   0000 0002 00E8 0058
        DECLE   $0300,  $0000,  $004C,  $0058   ; 5735   0300 0000 004C 0058
        DECLE   $0008,  $0000,  $0008,  $0189   ; 5739   0008 0000 0008 0189
        DECLE   $0058,  $0189,  $0158,  $0389   ; 573D   0058 0189 0158 0389
        DECLE   $0058,  $0389,  $0158,  $0300   ; 5741   0058 0389 0158 0300
        DECLE   $0000,  $0000,  $0000,  $0008   ; 5745   0000 0000 0000 0008
        DECLE   $0000,  $0002,  $00E8,  $0058   ; 5749   0000 0002 00E8 0058
        DECLE   $0000,  $0000,  $00C7,  $0058   ; 574D   0000 0000 00C7 0058
        DECLE   $0002,  $001C,  $0000,  $0000   ; 5751   0002 001C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5755   0000 0000 0000 0001

        NEGR    R0                              ; 5759   0020
        EIS                                     ; 575A   0002
        GSWD    R0                              ; 575B   0030
        RLC     R1,     2                       ; 575C   0055
        PSHR    R5                              ; 575D   0275

        JSR     R5,     X_PLAY_SFX1             ; 575E   0004 0118 03BB
        DECLE   $03E9                           ; 5761  SFX data
        DECLE   $0380,  $0080                   ; 5762  SFX data
        DECLE   $016B                           ; 5764  SFX data
        DECLE   $02CF                           ; 5765  SFX end


        PSHR    R5                              ; 5766   0275

        JSR     R5,     X_PLAY_SFX1             ; 5767   0004 0118 03BB
        DECLE   $03E9                           ; 576A  SFX data
        DECLE   $03C0,  $0280                   ; 576B  SFX data
        DECLE   $00EB                           ; 576D  SFX data
        DECLE   $02CF                           ; 576E  SFX end

L_576F:
        PSHR    R5                              ; 576F   0275

        JSR     R5,     X_PLAY_SFX1             ; 5770   0004 0118 03BB
        DECLE   $0389                           ; 5773  SFX data
        DECLE   $0200,  $02C0                   ; 5774  SFX data
        DECLE   $0218,  $0100                   ; 5776  SFX data
        DECLE   $0214,  $0300                   ; 5778  SFX data
        DECLE   $0001,  $0303                   ; 577A  SFX data
        DECLE   $00CE                           ; 577C  SFX data
        DECLE   $00EB                           ; 577D  SFX data
        DECLE   $038E                           ; 577E  SFX data
        DECLE   $0001,  $01E3                   ; 577F  SFX data
        DECLE   $02EB                           ; 5781  SFX data
        DECLE   $02CF                           ; 5782  SFX end

L_5783:
        PSHR    R5                              ; 5783   0275

        JSR     R5,     X_PLAY_SFX1             ; 5784   0004 0118 03BB
        DECLE   $03E9                           ; 5787  SFX data
        DECLE   $02C0,  $0040                   ; 5788  SFX data
        DECLE   $0001,  $0004                   ; 578A  SFX data
        DECLE   $008F,  $012B                   ; 578C  SFX data
        DECLE   $02CF                           ; 578E  SFX end

L_578F:
        PSHR    R5                              ; 578F   0275

        JSR     R5,     X_PLAY_SFX1             ; 5790   0004 0118 03BB
        DECLE   $0079                           ; 5793  SFX data
        DECLE   $03ED                           ; 5794  SFX data
        DECLE   $03B7                           ; 5795  SFX data
        DECLE   $004C,  $0000                   ; 5796  SFX data
        DECLE   $000B                           ; 5798  SFX data
        DECLE   $03CF                           ; 5799  SFX end

        DECLE   $0000,  $0000,  $00DB,  $0057   ; 579A   0000 0000 00DB 0057
        DECLE   $0008,  $0000,  $0000           ; 579E   0008 0000 0000

        INCR    R1                              ; 57A1   0009
        INCR    R5                              ; 57A2   000D
        INCR    R2                              ; 57A3   000A
        INCR    R6                              ; 57A4   000E
        MVII    #$0004, R0                      ; 57A5   02B8 0004
        INCR    R7                              ; 57A7   000F

        CLRR    R0                              ; 57A8   01C0
L_57A9:
        PSHR    R5                              ; 57A9   0275
        MVI     G_0178, R3                      ; 57AA   0283 0178
        INCR    R3                              ; 57AC   000B
        MVO     R3,     G_0178                  ; 57AD   0243 0178
        MOVR    R7,     R4                      ; 57AF   00BC
        ADDI    #$004E, R4                      ; 57B0   02FC 004E
        SLL     R3,     1                       ; 57B2   004B
        SLL     R3,     2                       ; 57B3   004F
        ADDR    R3,     R4                      ; 57B4   00DC
L_57B5:
        MVI@    R4,     R2                      ; 57B5   02A2
        SWAP    R2,     1                       ; 57B6   0042
        ANDI    #$0003, R2                      ; 57B7   03BA 0003
        MVI@    R4,     R3                      ; 57B9   02A3
        SWAP    R3,     1                       ; 57BA   0043
        RRC     R3,     2                       ; 57BB   0077
        RLC     R2,     2                       ; 57BC   0056
        MOVR    R0,     R5                      ; 57BD   0085
        ADDI    #$016D, R5                      ; 57BE   02FD 016D
        MVO@    R2,     R5                      ; 57C0   026A
        SUBI    #$0002, R4                      ; 57C1   033C 0002
        SDBD                                    ; 57C3   0001
        MVI@    R4,     R2                      ; 57C4   02A2
        MVII    #$001E, R3                      ; 57C5   02BB 001E

        JSR     R5,     .EXEC.9AD               ; 57C7   0004 0118 01AD

        INCR    R1                              ; 57CA   0009
        MOVR    R7,     R5                      ; 57CB   00BD
        SUBI    #$0032, R5                      ; 57CC   033D 0032
        MVO@    R5,     R1                      ; 57CE   024D
        ADDI    #$0004, R1                      ; 57CF   02F9 0004
        MVII    #$03E0, R5                      ; 57D1   02BD 03E0
        MVO@    R5,     R1                      ; 57D3   024D
        INCR    R0                              ; 57D4   0008
        MOVR    R0,     R5                      ; 57D5   0085
        ANDI    #$0003, R5                      ; 57D6   03BD 0003
        BNEQ    L_57B5                          ; 57D8   022C 0024
        PULR    R7                              ; 57DA   02B7

        PSHR    R5                              ; 57DB   0275

        JSR     R5,     .EXEC.98D               ; 57DC   0004 0118 018D

        MOVR    R0,     R3                      ; 57DF   0083
        ADDI    #$016D, R3                      ; 57E0   02FB 016D
        MVI@    R3,     R3                      ; 57E2   029B
        SARC    R3,     1                       ; 57E3   007B
        BNC     L_57EA                          ; 57E4   0209 0004

        JSR     R5,     .EXEC.7AE               ; 57E6   0004 0114 03AE

        PULR    R7                              ; 57E9   02B7

L_57EA:
        MVI@    R1,     R5                      ; 57EA   028D
        SDBD                                    ; 57EB   0001
        ANDI    #$FDFF, R5                      ; 57EC   03BD 00FF 00FD
        SARC    R3,     1                       ; 57EF   007B
        BNC     L_57F4                          ; 57F0   0209 0002

        XORI    #$0200, R5                      ; 57F2   03FD 0200
L_57F4:
        MVO@    R5,     R1                      ; 57F4   024D
        ADDI    #$0007, R1                      ; 57F5   02F9 0007
        MVI@    R1,     R2                      ; 57F7   028A
        SUBI    #$0005, R1                      ; 57F8   0339 0005
        MOVR    R1,     R5                      ; 57FA   008D
        MVO@    R2,     R5                      ; 57FB   026A
        SWAP    R2,     1                       ; 57FC   0042
        MVO@    R2,     R5                      ; 57FD   026A
        CLRR    R2                              ; 57FE   01D2
        MVO@    R2,     R5                      ; 57FF   026A
        ADDR    R7,     R3                      ; 5800   00FB
        SUBI    #$0060, R3                      ; 5801   033B 0060
        MVI@    R3,     R3                      ; 5803   029B
        MVO@    R3,     R5                      ; 5804   026B
        PULR    R7                              ; 5805   02B7

        DECLE   $0330,  $0070,  $0112,  $006A   ; 5806   0330 0070 0112 006A
        DECLE   $013C,  $006A,  $0124,  $006A   ; 580A   013C 006A 0124 006A
        DECLE   $0330,  $0144,  $0114,  $0150   ; 580E   0330 0144 0114 0150
        DECLE   $0140,  $015C,  $0120,  $015C   ; 5812   0140 015C 0120 015C
        DECLE   $033E,  $014C,  $011C,  $015C   ; 5816   033E 014C 011C 015C
        DECLE   $013C,  $015C,  $0126,  $015C   ; 581A   013C 015C 0126 015C
        DECLE   $032C,  $0085,  $0234           ; 581E   032C 0085 0234

        ANDR    R0,     R0                      ; 5821   0180
        BEQ     L_56A3                          ; 5822   0224 0180

        NEGR    R6                              ; 5824   0026
        CMPR    R7,     R0                      ; 5825   0178
        SUB@    R5,     R4                      ; 5826   032C
        CMPR    R2,     R0                      ; 5827   0150
        RSWD    R0                              ; 5828   0038
        SLLC    R0,     1                       ; 5829   0058
        ADCR    R0                              ; 582A   0028
        SLLC    R0,     1                       ; 582B   0058
        NEGR    R0                              ; 582C   0020
        SLLC    R0,     1                       ; 582D   0058
        CLRR    R3                              ; 582E   01DB
        MVO     R3,     G_0178                  ; 582F   0243 0178
        MOVR    R5,     R7                      ; 5831   00AF

        PSHR    R5                              ; 5832   0275
        MVI     G_016C, R2                      ; 5833   0282 016C
        ANDI    #$0001, R2                      ; 5835   03BA 0001
        BEQ     L_5846                          ; 5837   0204 000D

        PSHR    R1                              ; 5839   0271
        CLRR    R0                              ; 583A   01C0

L_583B:
        JSR     R5,     .EXEC.772               ; 583B   0004 0114 0372

        SWAP    R2,     1                       ; 583E   0042
        XORR    R3,     R2                      ; 583F   01DA
        MVII    #$001B, R3                      ; 5840   02BB 001B
        PULR    R1                              ; 5842   02B1

        JSR     R5,     .EXEC.9A3               ; 5843   0004 0118 01A3

L_5846:
        ADDI    #$0006, R1                      ; 5846   02F9 0006
L_5848:
        MVII    #$0004, R0                      ; 5848   02B8 0004
        MVO@    R0,     R1                      ; 584A   0248
        PULR    R7                              ; 584B   02B7

        PSHR    R5                              ; 584C   0275
        MVI     G_016C, R2                      ; 584D   0282 016C
        ANDI    #$0001, R2                      ; 584F   03BA 0001
        BEQ     L_5846                          ; 5851   0224 000C

        NEGR    R2                              ; 5853   0022
        MVII    #$0004, R0                      ; 5854   02B8 0004
        MOVR    R1,     R4                      ; 5856   008C
        ADDI    #$0002, R4                      ; 5857   02FC 0002
        PSHR    R1                              ; 5859   0271
        PSHR    R2                              ; 585A   0272
L_585B:
        PSHR    R4                              ; 585B   0274
        PSHR    R2                              ; 585C   0272
        PSHR    R0                              ; 585D   0270

        JSR     R5,     .EXEC.772               ; 585E   0004 0114 0372
        JSR     R5,     X_POW2                  ; 5861   0004 0114 0345

        AND     G_016B, R0                      ; 5864   0380 016B
        NEGR    R0                              ; 5866   0020
        BNEQ    L_586D                          ; 5867   020C 0004

        JSR     R5,     .EXEC.784               ; 5869   0004 0114 0384

        MOVR    R2,     R5                      ; 586C   0095
L_586D:
        PULR    R0                              ; 586D   02B0
        PULR    R2                              ; 586E   02B2
        PULR    R4                              ; 586F   02B4
        BMI     L_5878                          ; 5870   020B 0006

        CMPR    R2,     R5                      ; 5872   0155
        BC      L_5878                          ; 5873   0201 0003

        MOVR    R5,     R2                      ; 5875   00AA
        PULR    R5                              ; 5876   02B5
        PSHR    R0                              ; 5877   0270
L_5878:
        INCR    R0                              ; 5878   0008
        CMPI    #$0007, R0                      ; 5879   0378 0007
        BLE     L_585B                          ; 587B   0226 0021

        PULR    R0                              ; 587D   02B0
        TSTR    R0                              ; 587E   0080
        BPL     L_583B                          ; 587F   0223 0045

        PULR    R1                              ; 5881   02B1
        ADDI    #$0004, R1                      ; 5882   02F9 0004
        CLRR    R0                              ; 5884   01C0
        MVO@    R0,     R1                      ; 5885   0248
        INCR    R1                              ; 5886   0009
        B       L_5848                          ; 5887   0220 0040

        PSHR    R5                              ; 5889   0275
        MVI     G_016C, R5                      ; 588A   0285 016C
        ANDI    #$0001, R5                      ; 588C   03BD 0001
        BEQ     L_58C6                          ; 588E   0204 0036

        SDBD                                    ; 5890   0001
        MVII    #$0403, R4                      ; 5891   02BC 0003 0004

        JSR     R5,     .EXEC.70F               ; 5894   0004 0114 030F

        BNC     L_58C6                          ; 5897   0209 002D

        JSR     R5,     .EXEC.766               ; 5899   0004 0114 0366

        PSHR    R3                              ; 589C   0273

        JSR     R5,     L_58A5                  ; 589D   0004 0158 00A5

        PULR    R0                              ; 58A0   02B0

        JSR     R5,     .EXEC.76C               ; 58A1   0004 0114 036C

        INCR    R7                              ; 58A4   000F

L_58A5:
        PSHR    R5                              ; 58A5   0275

L_58A6:
        JSR     R5,     X_CLR_BIT               ; 58A6   0004 0114 02E6

        CMPR    R5,     R3                      ; 58A9   016B
        INCR    R1                              ; 58AA   0009
        SDBD                                    ; 58AB   0001
        MVII    #$574D, R5                      ; 58AC   02BD 004D 0057
        MVO@    R5,     R1                      ; 58AF   024D
        ADDI    #$0003, R1                      ; 58B0   02F9 0003
        CLRR    R5                              ; 58B2   01ED
        MVO@    R5,     R1                      ; 58B3   024D
        INCR    R1                              ; 58B4   0009
        MVII    #$01E0, R5                      ; 58B5   02BD 01E0
        MVO@    R5,     R1                      ; 58B7   024D
        INCR    R1                              ; 58B8   0009
        MOVR    R0,     R2                      ; 58B9   0082
        MVII    #$0006, R0                      ; 58BA   02B8 0006
        CMPI    #$0004, R2                      ; 58BC   037A 0004
        BNEQ    L_58C1                          ; 58BE   020C 0001

        DECR    R0                              ; 58C0   0010

L_58C1:
        JSR     R5,     X_RAND1                 ; 58C1   0004 0114 027D

        INCR    R0                              ; 58C4   0008
        MVO@    R0,     R1                      ; 58C5   0248
L_58C6:
        PULR    R7                              ; 58C6   02B7

        PSHR    R5                              ; 58C7   0275
        SDBD                                    ; 58C8   0001
        MVII    #$572C, R5                      ; 58C9   02BD 002C 0057
        CMPI    #$0004, R0                      ; 58CC   0378 0004
        BEQ     L_58D8                          ; 58CE   0204 0008
        BGT     L_58DC                          ; 58D0   020E 000A

        SDBD                                    ; 58D2   0001
        MVII    #$5735, R5                      ; 58D3   02BD 0035 0057
        B       L_58DC                          ; 58D6   0200 0004

L_58D8:
        SDBD                                    ; 58D8   0001
        MVII    #$5744, R5                      ; 58D9   02BD 0044 0057
L_58DC:
        INCR    R1                              ; 58DC   0009
        MVO@    R5,     R1                      ; 58DD   024D

        JSR     R5,     X_SET_BIT               ; 58DE   0004 0114 02DB

        CMPR    R5,     R3                      ; 58E1   016B
        ADDI    #$0005, R1                      ; 58E2   02F9 0005
        ANDI    #$0003, R0                      ; 58E4   03B8 0003
        MVO@    R0,     R1                      ; 58E6   0248
        PULR    R7                              ; 58E7   02B7

        PSHR    R5                              ; 58E8   0275
        MVI     G_016C, R5                      ; 58E9   0285 016C
        ANDI    #$0001, R5                      ; 58EB   03BD 0001
        BEQ     L_58C6                          ; 58ED   0224 0028

        CMPI    #$0003, R0                      ; 58EF   0378 0003
        BLE     L_58C6                          ; 58F1   0226 002C

        SDBD                                    ; 58F3   0001
        MVII    #$0403, R4                      ; 58F4   02BC 0003 0004

        JSR     R5,     .EXEC.70F               ; 58F7   0004 0114 030F

        BNC     L_58C6                          ; 58FA   0229 0035

        JSR     R5,     L_596B                  ; 58FC   0004 0158 016B

        MVII    #$000D, R0                      ; 58FF   02B8 000D
        ADDI    #$0005, R1                      ; 5901   02F9 0005
        MVO@    R0,     R1                      ; 5903   0248
        MVII    #$000B, R0                      ; 5904   02B8 000B
        MVO     R0,     G_0322                  ; 5906   0240 0322
        PULR    R7                              ; 5908   02B7

        PSHR    R5                              ; 5909   0275
        SDBD                                    ; 590A   0001
        MVII    #$1C44, R2                      ; 590B   02BA 0044 001C
        MVII    #$0325, R1                      ; 590E   02B9 0325
        MVII    #$001B, R3                      ; 5910   02BB 001B

        JSR     R5,     .EXEC.9A1               ; 5912   0004 0118 01A1

        INCR    R1                              ; 5915   0009
        SDBD                                    ; 5916   0001
        MVII    #$5744, R0                      ; 5917   02B8 0044 0057
        MVO@    R0,     R1                      ; 591A   0248
        PULR    R7                              ; 591B   02B7

        PSHR    R5                              ; 591C   0275
        MVII    #$0164, R5                      ; 591D   02BD 0164
        CLRR    R0                              ; 591F   01C0
        MVO     R0,     G_016B                  ; 5920   0240 016B
        MVO@    R0,     R5                      ; 5922   0268
        MVO@    R0,     R5                      ; 5923   0268

        JSR     R5,     L_576F                  ; 5924   0004 0154 036F
        JSR     R5,     L_5936                  ; 5927   0004 0158 0136
        DECLE   $0001                           ; 592A   0001
        BIDECLE $5744                           ; 592B   0044 0057
        DECLE   $0003,  $0035,  $0057,  $0001   ; 592D   0003 0035 0057 0001

        SWAP    R0,     2                       ; 5931   0044
        RLC     R3,     2                       ; 5932   0057
        DIS                                     ; 5933   0003
        ADCR    R4                              ; 5934   002C
        RLC     R3,     2                       ; 5935   0057
L_5936:
        MVII    #$031E, R1                      ; 5936   02B9 031E
        MVII    #$0004, R0                      ; 5938   02B8 0004
L_593A:
        MVI@    R5,     R3                      ; 593A   02AB
        SDBD                                    ; 593B   0001
        MVI@    R5,     R2                      ; 593C   02AA
L_593D:
        MVO@    R2,     R1                      ; 593D   024A
        ADDI    #$0005, R1                      ; 593E   02F9 0005
        MVO@    R3,     R1                      ; 5940   024B
        ADDI    #$0003, R1                      ; 5941   02F9 0003
        DECR    R3                              ; 5943   0013
        BNEQ    L_593D                          ; 5944   022C 0008

        DECR    R0                              ; 5946   0010
        BNEQ    L_593A                          ; 5947   022C 000E

        MVII    #$0001, R0                      ; 5949   02B8 0001
        MVO     R0,     G_016C                  ; 594B   0240 016C
        SDBD                                    ; 594D   0001
        MVII    #$53E2, R1                      ; 594E   02B9 00E2 0053

        JSR     R5,     X_TIMER_START           ; 5951   0004 0118 0044

        PULR    R7                              ; 5954   02B7

        PSHR    R5                              ; 5955   0275
        SDBD                                    ; 5956   0001
        MVII    #$53E2, R1                      ; 5957   02B9 00E2 0053

        JSR     R5,     X_TIMER_STOP            ; 595A   0004 0118 0038

        CLRR    R0                              ; 595D   01C0
        MVO     R0,     G_016C                  ; 595E   0240 016C
        MVII    #$0008, R1                      ; 5960   02B9 0008
        MVII    #$0321, R2                      ; 5962   02BA 0321
L_5964:
        MVO@    R0,     R2                      ; 5964   0250
        ADDI    #$0008, R2                      ; 5965   02FA 0008
        DECR    R1                              ; 5967   0011
        BNEQ    L_5964                          ; 5968   022C 0005
        PULR    R7                              ; 596A   02B7

L_596B:
        PSHR    R5                              ; 596B   0275
        PSHR    R1                              ; 596C   0271

        JSR     R5,     X_PLAY_WHST1            ; 596D   0004 011C 031B

        SDBD                                    ; 5970   0001
        MVII    #$53E2, R1                      ; 5971   02B9 00E2 0053

        JSR     R5,     X_TIMER_STOP            ; 5974   0004 0118 0038

        PULR    R1                              ; 5977   02B1
        MVII    #$0321, R4                      ; 5978   02BC 0321
        MVII    #$0008, R2                      ; 597A   02BA 0008
        CLRR    R0                              ; 597C   01C0
        MVO     R0,     G_016C                  ; 597D   0240 016C
        MVI     G_016B, R3                      ; 597F   0283 016B
L_5981:
        MVO@    R0,     R4                      ; 5981   0260
        SARC    R3,     1                       ; 5982   007B
        BNC     L_5987                          ; 5983   0209 0002

        MVO@    R0,     R4                      ; 5985   0260
        INCR    R7                              ; 5986   000F

L_5987:
        MVO@    R2,     R4                      ; 5987   0262
L_5988:
        MVO@    R0,     R4                      ; 5988   0260
        ADDI    #$0005, R4                      ; 5989   02FC 0005
        CMPI    #$035D, R4                      ; 598B   037C 035D
        BMI     L_5981                          ; 598D   022B 000D
        PULR    R7                              ; 598F   02B7

L_5990:
        MVII    #$031D, R1                      ; 5990   02B9 031D
        MVI     G_016C, R3                      ; 5992   0283 016C
        TSTR    R3                              ; 5994   009B
        BEQ     L_5999                          ; 5995   0204 0002

        MVI     G_016B, R3                      ; 5997   0283 016B
L_5999:
        MOVR    R1,     R4                      ; 5999   008C
        ADDI    #$0004, R4                      ; 599A   02FC 0004
        MVI@    R1,     R2                      ; 599C   028A
        SDBD                                    ; 599D   0001
        ANDI    #$FDFF, R2                      ; 599E   03BA 00FF 00FD
        MVI@    R4,     R0                      ; 59A1   02A0
        TSTR    R0                              ; 59A2   0080
        BEQ     L_59AD                          ; 59A3   0204 0008
        BMI     L_59A9                          ; 59A5   020B 0002

        XORI    #$0200, R2                      ; 59A7   03FA 0200
L_59A9:
        MVO@    R2,     R1                      ; 59A9   024A
        MVII    #$03E0, R2                      ; 59AA   02BA 03E0
        INCR    R7                              ; 59AC   000F

L_59AD:
        CLRR    R2                              ; 59AD   01D2
L_59AE:
        MVI@    R4,     R0                      ; 59AE   02A0
        DECR    R4                              ; 59AF   0014
        SDBD                                    ; 59B0   0001
        ANDI    #$FC0F, R0                      ; 59B1   03B8 000F 00FC
        SARC    R3,     1                       ; 59B4   007B
        BNC     L_59B9                          ; 59B5   0209 0002

        MVII    #$01F0, R2                      ; 59B7   02BA 01F0
L_59B9:
        XORR    R2,     R0                      ; 59B9   01D0
        MVO@    R0,     R4                      ; 59BA   0260
        ADDI    #$0008, R1                      ; 59BB   02F9 0008
        CMPI    #$035D, R1                      ; 59BD   0379 035D
        BMI     L_5999                          ; 59BF   022B 0027
        MOVR    R5,     R7                      ; 59C1   00AF

        PSHR    R5                              ; 59C2   0275

        JSR     R5,     L_5783                  ; 59C3   0004 0154 0383

        MVII    #$0327, R1                      ; 59C6   02B9 0327
        MVII    #$031F, R2                      ; 59C8   02BA 031F
        MVI@    R1,     R0                      ; 59CA   0288
        MVI@    R2,     R3                      ; 59CB   0293
        MVO@    R3,     R1                      ; 59CC   024B
        MVO@    R0,     R2                      ; 59CD   0250
        INCR    R1                              ; 59CE   0009
        INCR    R2                              ; 59CF   000A
        MVI@    R1,     R0                      ; 59D0   0288
        MVI@    R2,     R3                      ; 59D1   0293
        MVO@    R3,     R1                      ; 59D2   024B
        MVO@    R0,     R2                      ; 59D3   0250
        MVII    #$0037, R3                      ; 59D4   02BB 0037
        MVII    #$0325, R1                      ; 59D6   02B9 0325
        SDBD                                    ; 59D8   0001
        MVII    #$1C24, R2                      ; 59D9   02BA 0024 001C

        JSR     R5,     .EXEC.9A3               ; 59DC   0004 0118 01A3

        SDBD                                    ; 59DF   0001
        MVII    #$0862, R0                      ; 59E0   02B8 0062 0008
        MVO     R0,     .BTAB.75                ; 59E3   0240 0275
        MVII    #$0325, R5                      ; 59E5   02BD 0325
        SDBD                                    ; 59E7   0001
        MVII    #$1887, R0                      ; 59E8   02B8 0087 0018
        MVO@    R0,     R5                      ; 59EB   0268
        SDBD                                    ; 59EC   0001
        MVII    #$5754, R0                      ; 59ED   02B8 0054 0057
        MVO@    R0,     R5                      ; 59F0   0268
        MVII    #$032A, R5                      ; 59F1   02BD 032A
        CLRR    R0                              ; 59F3   01C0
        MVO@    R0,     R5                      ; 59F4   0268
        MVO@    R0,     R5                      ; 59F5   0268
        INCR    R0                              ; 59F6   0008

        JSR     R5,     .EXEC.41C               ; 59F7   0004 0114 001C

        PULR    R7                              ; 59FA   02B7

        PSHR    R5                              ; 59FB   0275
        MVI     G_016A, R0                      ; 59FC   0280 016A
        TSTR    R0                              ; 59FE   0080
        BEQ     L_5A0F                          ; 59FF   0204 000E

        DECR    R0                              ; 5A01   0010
        MVO     R0,     G_016A                  ; 5A02   0240 016A
        BNEQ    L_5A09                          ; 5A04   020C 0003

        JSR     R5,     L_578F                  ; 5A06   0004 0154 038F

L_5A09:
        MVI     G_0177, R1                      ; 5A09   0281 0177
        ANDI    #$0010, R1                      ; 5A0B   03B9 0010
        BNEQ    L_5A1D                          ; 5A0D   020C 000E
L_5A0F:
        PULR    R7                              ; 5A0F   02B7

L_5A10:
        PSHR    R5                              ; 5A10   0275
        MVI     G_0177, R1                      ; 5A11   0281 0177
        SDBD                                    ; 5A13   0001
        ANDI    #$FFEF, R1                      ; 5A14   03B9 00EF 00FF
        XORI    #$0010, R1                      ; 5A17   03F9 0010
        MVO     R1,     G_0177                  ; 5A19   0241 0177
        MVI     G_016A, R0                      ; 5A1B   0280 016A
L_5A1D:
        MVII    #$0002, R1                      ; 5A1D   02B9 0002
        MVII    #$0007, R3                      ; 5A1F   02BB 0007
        MVII    #$0209, R4                      ; 5A21   02BC 0209

        JSR     R5,     X_PRNUM_ZRO             ; 5A23   0004 0118 00AD

        MOVR    R3,     R1                      ; 5A26   0099
        MVII    #$0207, R4                      ; 5A27   02BC 0207

        JSR     R5,     L_5094                  ; 5A29   0004 0150 0094
        DECLE   $03C9,  $03C7                   ; 5A2C   03C9 03C7

        XOR     .BTAB.B7,R0                     ; 5A2E   03C0 02B7
        PSHR    R5                              ; 5A30   0275
        MVI     G_0177, R1                      ; 5A31   0281 0177
        SDBD                                    ; 5A33   0001
        ANDI    #$FFEF, R1                      ; 5A34   03B9 00EF 00FF
        MVO     R1,     G_0177                  ; 5A37   0241 0177
        MVII    #$0004, R0                      ; 5A39   02B8 0004
        MVII    #$0207, R4                      ; 5A3B   02BC 0207

        JSR     R5,     X_FILL_ZERO             ; 5A3D   0004 0114 0338

        PULR    R7                              ; 5A40   02B7

L_5A41:
        MVI@    R5,     R1                      ; 5A41   02A9
        MVI@    R1,     R0                      ; 5A42   0288
        SDBD                                    ; 5A43   0001
        XORI    #$2000, R0                      ; 5A44   03F8 0000 0020
        MVO@    R0,     R1                      ; 5A47   0248
        MOVR    R5,     R7                      ; 5A48   00AF

L_5A49:
        PSHR    R5                              ; 5A49   0275
        MVII    #$0007, R1                      ; 5A4A   02B9 0007

        JSR     R5,     L_5094                  ; 5A4C   0004 0150 0094
        DECLE   $03FE,  $01B3,  $00FE,  $0000   ; 5A4F   03FE 01B3 00FE 0000

        PULR    R7                              ; 5A53   02B7

        PSHR    R5                              ; 5A54   0275
        MVII    #$0248, R0                      ; 5A55   02B8 0248
        SLL     R0,     1                       ; 5A57   0048
        MVO     R0,     .BTAB.0C                ; 5A58   0240 020C
        ADDI    #$0007, R0                      ; 5A5A   02F8 0007
        MVO     R0,     .BTAB.0B                ; 5A5C   0240 020B
        INCR    R0                              ; 5A5E   0008
        MVO     R0,     .BTAB.02                ; 5A5F   0240 0202
        PULR    R7                              ; 5A61   02B7

L_5A62:
        PSHR    R5                              ; 5A62   0275
        MVII    #$02DD, R4                      ; 5A63   02BC 02DD
        MVII    #$0012, R0                      ; 5A65   02B8 0012
        MVI     .BTAB.EF,R1                     ; 5A67   0281 02EF

        JSR     R5,     X_FILL_MEM              ; 5A69   0004 0114 0341

        PULR    R5                              ; 5A6C   02B5
        MVI@    R5,     R4                      ; 5A6D   02AC
        J       L_5094                          ; 5A6E   0004 0350 0094

L_5A71:
        PSHR    R5                              ; 5A71   0275
        MVII    #$0200, R4                      ; 5A72   02BC 0200
        MVII    #$0028, R0                      ; 5A74   02B8 0028

        JSR     R5,     X_FILL_ZERO             ; 5A76   0004 0114 0338
        JSR     R5,     L_5A41                  ; 5A79   0004 0158 0241
        DECLE   $0228                           ; 5A7C   0228

        MVII    #$0002, R1                      ; 5A7D   02B9 0002
        MVII    #$0201, R4                      ; 5A7F   02BC 0201

        JSR     R5,     L_5094                  ; 5A81   0004 0150 0094
        DECLE   $00FF,  $01CC,  $009E,  $0000   ; 5A84   00FF 01CC 009E 0000

        MVII    #$0216, R4                      ; 5A88   02BC 0216

        JSR     R5,     L_5094                  ; 5A8A   0004 0150 0094

        XOR@    R1,     R4                      ; 5A8D   03CC
        XOR@    R1,     R5                      ; 5A8E   03CD
        XOR     G_01C9, R0                      ; 5A8F   03C0 01C9
        MVII    #$020C, R4                      ; 5A91   02BC 020C

        JSR     R5,     L_5094                  ; 5A93   0004 0150 0094
        DECLE   $02BF                           ; 5A96   02BF

        SUBR    R2,     R2                      ; 5A97   0112
        SUBR    R2,     R3                      ; 5A98   0113
L_5A99:
        XORR    R2,     R1                      ; 5A99   01D1
        XOR     .BTAB.BC,R0                     ; 5A9A   03C0 02BC
        BPL     L_5A99                          ; 5A9C   0223 0004

        CMPR    R2,     R0                      ; 5A9E   0150
        MOVR    R2,     R4                      ; 5A9F   0094
        XOR@    R1,     R4                      ; 5AA0   03CC
        XOR@    R2,     R1                      ; 5AA1   03D1
        XOR     .BTAB.BC,R0                     ; 5AA2   03C0 02BC
        ADD@    R3,     R5                      ; 5AA4   02DD
        MVII    #$0012, R0                      ; 5AA5   02B8 0012

        JSR     R5,     X_FILL_ZERO             ; 5AA7   0004 0114 0338

        MVII    #$02E2, R4                      ; 5AAA   02BC 02E2
        MVII    #$0007, R1                      ; 5AAC   02B9 0007

        JSR     R5,     L_5094                  ; 5AAE   0004 0150 0094
        DECLE   $03E0,  $01A3,  $035A,  $03A6   ; 5AB1   03E0 01A3 035A 03A6
        DECLE   $034E,  $01BE,  $0000           ; 5AB5   034E 01BE 0000

        CLRR    R1                              ; 5AB8   01C9
        MVII    #$02ED, R4                      ; 5AB9   02BC 02ED

        JSR     R5,     L_5094                  ; 5ABB   0004 0150 0094
        DECLE   $03CD,  $03C0,  $02BC,  $021B   ; 5ABE   03CD 03C0 02BC 021B

        JSR     R5,     L_5A49                  ; 5AC2   0004 0158 0249

        MVII    #$0223, R4                      ; 5AC5   02BC 0223

        JSR     R5,     L_5A10                  ; 5AC7   0004 0158 0210

        PULR    R7                              ; 5ACA   02B7

        PSHR    R5                              ; 5ACB   0275
        SDBD                                    ; 5ACC   0001
        MVII    #$56FA, R2                      ; 5ACD   02BA 00FA 0056
        SDBD                                    ; 5AD0   0001
        MVII    #$56BE, R3                      ; 5AD1   02BB 00BE 0056
        MVII    #$0214, R4                      ; 5AD4   02BC 0214
        MVII    #$000A, R0                      ; 5AD6   02B8 000A

        JSR     R5,     L_5382                  ; 5AD8   0004 0150 0382
        JSR     R5,     L_5A41                  ; 5ADB   0004 0158 0241
        DECLE   $0228                           ; 5ADE   0228

        MVII    #$0004, R0                      ; 5ADF   02B8 0004
        MVII    #$0201, R4                      ; 5AE1   02BC 0201

        JSR     R5,     X_FILL_ZERO             ; 5AE3   0004 0114 0338

        MVII    #$0007, R0                      ; 5AE6   02B8 0007
        MVII    #$020C, R4                      ; 5AE8   02BC 020C

        JSR     R5,     X_FILL_ZERO             ; 5AEA   0004 0114 0338

        PULR    R7                              ; 5AED   02B7

        PSHR    R5                              ; 5AEE   0275
        MVI     G_0318, R4                      ; 5AEF   0284 0318
        MVI@    R4,     R0                      ; 5AF1   02A0
        MVO     R4,     G_0318                  ; 5AF2   0244 0318
        MOVR    R0,     R1                      ; 5AF4   0081
        ANDI    #$0200, R0                      ; 5AF5   03B8 0200
        BEQ     L_5B02                          ; 5AF7   0204 0009

        PSHR    R1                              ; 5AF9   0271
        SLR     R1,     2                       ; 5AFA   0065
        SLR     R1,     2                       ; 5AFB   0065
        SLR     R1,     1                       ; 5AFC   0061

        JSR     R5,     .EXEC.628               ; 5AFD   0004 0114 0228

        COMR    R1                              ; 5B00   0019
        PULR    R1                              ; 5B01   02B1
L_5B02:
        MVI     G_0163, R2                      ; 5B02   0282 0163
        SLL     R2,     2                       ; 5B04   004E
        SLL     R2,     2                       ; 5B05   004E
        SLL     R2,     1                       ; 5B06   004A
        ADDI    #$0321, R2                      ; 5B07   02FA 0321
        MVO@    R0,     R2                      ; 5B09   0250
        ANDI    #$001F, R1                      ; 5B0A   03B9 001F
        MOVR    R1,     R0                      ; 5B0C   0088
        PULR    R7                              ; 5B0D   02B7

        DECLE   $0209,  $03B5,  $03F0,  $0345   ; 5B0E   0209 03B5 03F0 0345
        DECLE   $03A7,  $0305,  $02CA,  $033F   ; 5B12   03A7 0305 02CA 033F
        DECLE   $001F,  $0274,  $0213,  $0003   ; 5B16   001F 0274 0213 0003
        DECLE   $03E9,  $031E,  $03BE,  $0038   ; 5B1A   03E9 031E 03BE 0038
        DECLE   $005D,  $004A,  $005B,  $0063   ; 5B1E   005D 004A 005B 0063
        DECLE   $005B,  $0018,  $005E,  $00D8   ; 5B22   005B 0018 005E 00D8
        DECLE   $005E,  $0034,  $005B,  $0080   ; 5B26   005E 0034 005B 0080
        DECLE   $0000,  $0001,  $0000,  $0000   ; 5B2A   0000 0001 0000 0000
        DECLE   $0000,  $0000,  $0006,  $01F0   ; 5B2E   0000 0000 0006 01F0
        DECLE   $01E0,  $01D0,  $004E,  $0042   ; 5B32   01E0 01D0 004E 0042
        DECLE   $004C,  $0041,  $0043,  $004B   ; 5B36   004C 0041 0043 004B
        DECLE   $004A,  $0041,  $0043,  $004B   ; 5B3A   004A 0041 0043 004B
        DECLE   $0020,  $0026,  $0020,  $0050   ; 5B3E   0020 0026 0020 0050
        DECLE   $004F,  $004B,  $0045,  $0052   ; 5B42   004F 004B 0045 0052
        DECLE   $0000,  $0004,  $0350,  $0252   ; 5B46   0000 0004 0350 0252
        DECLE   $0071,  $001A,  $0001,  $0080   ; 5B4A   0071 001A 0001 0080
        DECLE   $0040,  $0052,  $0001,  $0000   ; 5B4E   0040 0052 0001 0000
        DECLE   $00F5,  $005B,  $0005,  $0000   ; 5B52   00F5 005B 0005 0000
        DECLE   $0000,  $0000                   ; 5B56   0000 0000

        SDBD                                    ; 5B58   0001
        MVII    #$5B31, R0                      ; 5B59   02B8 0031 005B
        MVO     R0,     G_02F0                  ; 5B5C   0240 02F0
        MVII    #$02F1, R6                      ; 5B5E   02BE 02F1
        J       .EXEC.041                       ; 5B60   0004 0310 0041

        PSHR    R5                              ; 5B63   0275
        SDBD                                    ; 5B64   0001
        MVII    #$5EFA, R1                      ; 5B65   02B9 00FA 005E
        SDBD                                    ; 5B68   0001
        MVII    #$5F28, R2                      ; 5B69   02BA 0028 005F
        SDBD                                    ; 5B6C   0001
        MVII    #$5F06, R3                      ; 5B6D   02BB 0006 005F

        JSR     R5,     L_539E                  ; 5B70   0004 0150 039E

        SDBD                                    ; 5B73   0001
        MVII    #$2320, R0                      ; 5B74   02B8 0020 0023
        MVO     R0,     .BTAB.50                ; 5B77   0240 0250
        SUBI    #$0098, R0                      ; 5B79   0338 0098
        MVO     R0,     .BTAB.8C                ; 5B7B   0240 028C
        ADDI    #$0008, R0                      ; 5B7D   02F8 0008
        MVO     R0,     .BTAB.C8                ; 5B7F   0240 02C8

        JSR     R5,     L_5A62                  ; 5B81   0004 0158 0262
        DECLE   $02DE,  $0047,  $01CE,  $0244   ; 5B84   02DE 0047 01CE 0244
        DECLE   $0358,  $01D4,  $023A,  $00C0   ; 5B88   0358 01D4 023A 00C0
        DECLE   $0184,  $03C0,  $0004,  $015C   ; 5B8C   0184 03C0 0004 015C
        DECLE   $00F0,  $0006,  $0224,  $0003   ; 5B90   00F0 0006 0224 0003
        DECLE   $031E,  $007E,  $0000           ; 5B94   031E 007E 0000

        MVII    #$035C, R0                      ; 5B97   02B8 035C
        MVO     R0,     G_0359                  ; 5B99   0240 0359
        SDBD                                    ; 5B9B   0001
        MVII    #$5F64, R0                      ; 5B9C   02B8 0064 005F
        MVO     R0,     G_035B                  ; 5B9F   0240 035B
        SDBD                                    ; 5BA1   0001
        MVII    #$0BD7, R0                      ; 5BA2   02B8 00D7 000B

        JSR     R5,     L_5C4E                  ; 5BA5   0004 015C 004E

        MOVR    R7,     R3                      ; 5BA8   00BB
        ADDI    #$0043, R3                      ; 5BA9   02FB 0043

        JSR     R5,     L_5215                  ; 5BAB   0004 0150 0215
        DECLE   $0001,  $0040,  $0010,  $000E   ; 5BAE   0001 0040 0010 000E
        DECLE   $0060,  $0001,  $0040,  $0010   ; 5BB2   0060 0001 0040 0010
        DECLE   $0015,  $0060,  $0000           ; 5BB6   0015 0060 0000

        JSR     R5,     L_523A                  ; 5BB9   0004 0150 023A
        DECLE   $0028,  $00FE,  $005B,  $0036   ; 5BBC   0028 00FE 005B 0036

        SLLC    R1,     1                       ; 5BC0   0059
        SLLC    R0,     2                       ; 5BC1   005C
        COMR    R0                              ; 5BC2   0018
        RRC     R3,     2                       ; 5BC3   0077
        SLLC    R0,     2                       ; 5BC4   005C
        COMR    R0                              ; 5BC5   0018
        SARC    R3,     1                       ; 5BC6   007B
        SLLC    R0,     2                       ; 5BC7   005C
        COMR    R5                              ; 5BC8   001D
        MOVR    R0,     R3                      ; 5BC9   0083
        SLLC    R0,     2                       ; 5BCA   005C
        SWAP    R0,     1                       ; 5BCB   0040
        MOVR    R4,     R0                      ; 5BCC   00A0
        SLLC    R0,     2                       ; 5BCD   005C
        RSWD    R3                              ; 5BCE   003B
        MOVR    R6,     R1                      ; 5BCF   00B1
        SLLC    R0,     2                       ; 5BD0   005C
        DECR    R3                              ; 5BD1   0013
        MOVR    R7,     R3                      ; 5BD2   00BB
        SLLC    R0,     2                       ; 5BD3   005C
        COMR    R5                              ; 5BD4   001D
        ADDR    R0,     R7                      ; 5BD5   00C7

        DECLE   $005C,  $0027,  $00D8,  $005C   ; 5BD6   005C 0027 00D8 005C
        DECLE   $0027,  $00E1,  $005C,  $0027   ; 5BDA   0027 00E1 005C 0027
        DECLE   $00E5,  $005C,  $0009,  $0027   ; 5BDE   00E5 005C 0009 0027
        DECLE   $005C,  $0027,  $000D,  $005C   ; 5BE2   005C 0027 000D 005C
        DECLE   $0004,  $0037,  $005C,  $0063   ; 5BE6   0004 0037 005C 0063
        DECLE   $00C0,  $0060,  $0034,  $0010   ; 5BEA   00C0 0060 0034 0010
        DECLE   $0000,  $0030,  $0020,  $0000   ; 5BEE   0000 0030 0020 0000
        DECLE   $0035,  $0023,  $0000           ; 5BF2   0035 0023 0000

        MVI     G_0359, R1                      ; 5BF5   0281 0359
        MVI@    R1,     R0                      ; 5BF7   0288
        SDBD                                    ; 5BF8   0001
        XORI    #$087D, R0                      ; 5BF9   03F8 007D 0008
        MVO@    R0,     R1                      ; 5BFC   0248
        MOVR    R5,     R7                      ; 5BFD   00AF

        PSHR    R5                              ; 5BFE   0275

        JSR     R5,     L_5CF0                  ; 5BFF   0004 015C 00F0
        DECLE   $0009,  $002B,  $0002,  $0149   ; 5C02   0009 002B 0002 0149
        DECLE   $0002,  $015E,  $0000           ; 5C06   0002 015E 0000

        JSR     R5,     L_602B                  ; 5C09   0004 0160 002B

        PULR    R7                              ; 5C0C   02B7

        PSHR    R5                              ; 5C0D   0275
        MVII    #$035C, R0                      ; 5C0E   02B8 035C
        MVO     R0,     G_0359                  ; 5C10   0240 0359

        JSR     R5,     L_6050                  ; 5C12   0004 0160 0050

        MVII    #$000A, R0                      ; 5C15   02B8 000A
        SLR     R0,     1                       ; 5C17   0060
        MVO     R0,     G_0322                  ; 5C18   0240 0322
        CLRR    R0                              ; 5C1A   01C0
        MVO     R0,     G_0323                  ; 5C1B   0240 0323

        JSR     R5,     L_5CF0                  ; 5C1D   0004 015C 00F0
        DECLE   $0007,  $030E,  $029A,  $02C8   ; 5C20   0007 030E 029A 02C8
        DECLE   $01BE,  $0000                   ; 5C24   01BE 0000

        PULR    R7                              ; 5C26   02B7

        PSHR    R5                              ; 5C27   0275

        JSR     R5,     L_5A62                  ; 5C28   0004 0158 0262

        ADD@    R3,     R5                      ; 5C2B   02DD
        SWAP    R0,     1                       ; 5C2C   0040
        MVO@    R0,     R1                      ; 5C2D   0248
        ANDR    R5,     R6                      ; 5C2E   01AE
        CMP     .BTAB.8D,R5                     ; 5C2F   0345 028D
        CMP     .BTAB.7A,R0                     ; 5C31   0340 027A
        ADDR    R5,     R6                      ; 5C33   00EE
        ANDR    R0,     R4                      ; 5C34   0184
        XOR     .BTAB.B7,R0                     ; 5C35   03C0 02B7
        PSHR    R5                              ; 5C37   0275
        SDBD                                    ; 5C38   0001
        MVII    #$23BA, R0                      ; 5C39   02B8 00BA 0023
        MVO     R0,     .BTAB.A0                ; 5C3C   0240 02A0
        MVII    #$029C, R5                      ; 5C3E   02BD 029C
        MVII    #$0022, R0                      ; 5C40   02B8 0022
        SWAP    R0,     1                       ; 5C42   0040
        MVO@    R0,     R5                      ; 5C43   0268
        MVO@    R0,     R5                      ; 5C44   0268
        MVO@    R0,     R5                      ; 5C45   0268
        SDBD                                    ; 5C46   0001
        MVII    #$0C45, R0                      ; 5C47   02B8 0045 000C

        JSR     R5,     L_5C4E                  ; 5C4A   0004 015C 004E

        PULR    R7                              ; 5C4D   02B7

L_5C4E:
        MVII    #$0004, R1                      ; 5C4E   02B9 0004
        SDBD                                    ; 5C50   0001
        MVII    #$2200, R3                      ; 5C51   02BB 0000 0022
        MVII    #$02AF, R4                      ; 5C54   02BC 02AF
        J       X_PRNUM_RGT                     ; 5C56   0004 0318 00C5

        PSHR    R5                              ; 5C59   0275

        JSR     R5,     L_6049                  ; 5C5A   0004 0160 0049
        JSR     R5,     L_5CF0                  ; 5C5D   0004 015C 00F0
        DECLE   $0004,  $0024,  $027E,  $007E   ; 5C60   0004 0024 027E 007E
        DECLE   $0000                           ; 5C64   0000

        MVII    #$02A0, R0                      ; 5C65   02B8 02A0
        MVO     R0,     G_0359                  ; 5C67   0240 0359

        JSR     R5,     L_5A62                  ; 5C69   0004 0158 0262
        DECLE   $02DE,  $01EB,  $0002,  $009A   ; 5C6C   02DE 01EB 0002 009A
        DECLE   $030E,  $0291,  $0341,  $0093   ; 5C70   030E 0291 0341 0093
        DECLE   $025E,  $0000                   ; 5C74   025E 0000

        PULR    R7                              ; 5C76   02B7

        MVII    #$029E, R4                      ; 5C77   02BC 029E
        B       L_5C7D                          ; 5C79   0200 0002

        MVII    #$029D, R4                      ; 5C7B   02BC 029D
L_5C7D:
        SDBD                                    ; 5C7D   0001
        MVII    #$22A8, R0                      ; 5C7E   02B8 00A8 0022
        MVO@    R0,     R4                      ; 5C81   0260
L_5C82:
        MOVR    R5,     R7                      ; 5C82   00AF

        PSHR    R5                              ; 5C83   0275

        JSR     R5,     L_5C97                  ; 5C84   0004 015C 0097

        MVII    #$035C, R0                      ; 5C87   02B8 035C
        MVO     R0,     G_0359                  ; 5C89   0240 0359

        JSR     R5,     L_5CF0                  ; 5C8B   0004 015C 00F0
        DECLE   $0000                           ; 5C8E   0000

        MVII    #$0004, R0                      ; 5C8F   02B8 0004
        MVO     R0,     G_016A                  ; 5C91   0240 016A

        JSR     R5,     L_5F84                  ; 5C93   0004 015C 0384

        PULR    R7                              ; 5C96   02B7

L_5C97:
        MVII    #$0012, R0                      ; 5C97   02B8 0012
        MVI     .BTAB.EF,R1                     ; 5C99   0281 02EF
        MVII    #$02DC, R4                      ; 5C9B   02BC 02DC
        J       X_FILL_MEM                      ; 5C9D   0004 0314 0341

        PSHR    R5                              ; 5CA0   0275

        JSR     R5,     L_6049                  ; 5CA1   0004 0160 0049

        MVII    #$02A0, R0                      ; 5CA4   02B8 02A0
        MVO     R0,     G_0359                  ; 5CA6   0240 0359

        JSR     R5,     L_5CF0                  ; 5CA8   0004 015C 00F0
        DECLE   $0004,  $00E8,  $027E,  $007E   ; 5CAB   0004 00E8 027E 007E
        DECLE   $0000                           ; 5CAF   0000

        PULR    R7                              ; 5CB0   02B7

        PSHR    R5                              ; 5CB1   0275

        JSR     R5,     L_5CF0                  ; 5CB2   0004 015C 00F0

        CLRC                                    ; 5CB5   0006
        SAR     R2,     2                       ; 5CB6   006E
        MVI     G_0164, R1                      ; 5CB7   0281 0164
        XOR     .BTAB.B7,R0                     ; 5CB9   03C0 02B7
        MVII    #$006E, R0                      ; 5CBB   02B8 006E
        MVII    #$0003, R1                      ; 5CBD   02B9 0003
        MVII    #$0022, R3                      ; 5CBF   02BB 0022
        SWAP    R3,     1                       ; 5CC1   0043
        MVII    #$029C, R4                      ; 5CC2   02BC 029C
        J       X_PRNUM_RGT                     ; 5CC4   0004 0318 00C5

        PSHR    R5                              ; 5CC7   0275
        MVII    #$0005, R0                      ; 5CC8   02B8 0005
        MVO     R0,     G_016B                  ; 5CCA   0240 016B

        JSR     R5,     L_5CF0                  ; 5CCC   0004 015C 00F0
        DECLE   $0000                           ; 5CCF   0000

        MVII    #$0001, R0                      ; 5CD0   02B8 0001
        MVO     R0,     G_016A                  ; 5CD2   0240 016A

        JSR     R5,     L_5F84                  ; 5CD4   0004 015C 0384

        PULR    R7                              ; 5CD7   02B7

        MVII    #$0264, R0                      ; 5CD8   02B8 0264
        MVO     R0,     G_0359                  ; 5CDA   0240 0359
        MVII    #$0251, R4                      ; 5CDC   02BC 0251
        J       L_5FF8                          ; 5CDE   0004 035C 03F8

        MVII    #$0004, R0                      ; 5CE1   02B8 0004
        B       L_5CE7                          ; 5CE3   0200 0002

        MVII    #$0006, R0                      ; 5CE5   02B8 0006
L_5CE7:
        MVO     R0,     G_016B                  ; 5CE7   0240 016B
        MVII    #$0001, R0                      ; 5CE9   02B8 0001
        MVO     R0,     G_016A                  ; 5CEB   0240 016A
        J       L_5F84                          ; 5CED   0004 035C 0384

L_5CF0:
        PSHR    R5                              ; 5CF0   0275
        MVII    #$021C, R4                      ; 5CF1   02BC 021C
        MVII    #$0209, R5                      ; 5CF3   02BD 0209
        MVII    #$0231, R1                      ; 5CF5   02B9 0231
        MVII    #$0024, R0                      ; 5CF7   02B8 0024
        SWAP    R0,     1                       ; 5CF9   0040
        MVII    #$000B, R3                      ; 5CFA   02BB 000B
L_5CFC:
        MVO@    R0,     R4                      ; 5CFC   0260
        MVO@    R0,     R5                      ; 5CFD   0268
        MVO@    R0,     R1                      ; 5CFE   0248
        INCR    R1                              ; 5CFF   0009
        DECR    R3                              ; 5D00   0013
        BNEQ    L_5CFC                          ; 5D01   022C 0006

        MVO@    R0,     R4                      ; 5D03   0260
        PULR    R5                              ; 5D04   02B5
        XOR@    R5,     R3                      ; 5D05   03EB
        BEQ     L_5C82                          ; 5D06   0224 0085

        PSHR    R5                              ; 5D08   0275
        MVII    #$0026, R0                      ; 5D09   02B8 0026
        SWAP    R0,     1                       ; 5D0B   0040
        MVII    #$020A, R4                      ; 5D0C   02BC 020A
        MVII    #$0232, R5                      ; 5D0E   02BD 0232
L_5D10:
        MVO@    R0,     R4                      ; 5D10   0260
        MVO@    R0,     R5                      ; 5D11   0268
        DECR    R3                              ; 5D12   0013
        BNEQ    L_5D10                          ; 5D13   022C 0004

        SDBD                                    ; 5D15   0001
        MVII    #$2CEF, R1                      ; 5D16   02B9 00EF 002C
        MVII    #$0008, R2                      ; 5D19   02BA 0008
        MVO@    R1,     R4                      ; 5D1B   0261
        ADDI    #$0013, R4                      ; 5D1C   02FC 0013
        MVO@    R0,     R4                      ; 5D1E   0260
        ADDR    R2,     R1                      ; 5D1F   00D1
        MVO@    R1,     R5                      ; 5D20   0269
        MVII    #$0209, R4                      ; 5D21   02BC 0209
        ADDR    R2,     R1                      ; 5D23   00D1
        MVO@    R1,     R4                      ; 5D24   0261
        ADDI    #$0012, R4                      ; 5D25   02FC 0012
        ADDR    R2,     R1                      ; 5D27   00D1
        MVO@    R1,     R4                      ; 5D28   0261
        MVO@    R0,     R4                      ; 5D29   0260
        ADDI    #$0013, R4                      ; 5D2A   02FC 0013
        ADDR    R2,     R1                      ; 5D2C   00D1
        MVO@    R1,     R4                      ; 5D2D   0261
        PULR    R5                              ; 5D2E   02B5
        SDBD                                    ; 5D2F   0001
        MVII    #$2600, R1                      ; 5D30   02B9 0000 0026
        MVII    #$021E, R4                      ; 5D33   02BC 021E
        J       L_5094                          ; 5D35   0004 0350 0094

        DECLE   $0000,  $00E7,  $0000,  $004A   ; 5D38   0000 00E7 0000 004A
        DECLE   $004A,  $0008,  $0008,  $0008   ; 5D3C   004A 0008 0008 0008
        DECLE   $0018,  $0000,  $00E7,  $0000   ; 5D40   0018 0000 00E7 0000
        DECLE   $003C,  $0000,  $0018,  $0000   ; 5D44   003C 0000 0018 0000
        DECLE   $0000,  $00E7,  $0000,  $00CE   ; 5D48   0000 00E7 0000 00CE
        DECLE   $008C,  $0008,  $0008,  $0008   ; 5D4C   008C 0008 0008 0008
        DECLE   $0018,  $0000,  $00E7,  $0000   ; 5D50   0018 0000 00E7 0000
        DECLE   $003C,  $0000,  $0018,  $0000   ; 5D54   003C 0000 0018 0000
        DECLE   $0000,  $00E7,  $0000,  $004A   ; 5D58   0000 00E7 0000 004A
        DECLE   $004A,  $0008,  $0008,  $0008   ; 5D5C   004A 0008 0008 0008
        DECLE   $0018,  $0000,  $00E7,  $0000   ; 5D60   0018 0000 00E7 0000
        DECLE   $003C,  $0000,  $0018,  $0000   ; 5D64   003C 0000 0018 0000
        DECLE   $0000,  $00E7,  $0000,  $006B   ; 5D68   0000 00E7 0000 006B
        DECLE   $0029,  $0008,  $0008,  $0008   ; 5D6C   0029 0008 0008 0008
        DECLE   $0018,  $0000,  $00E7,  $0000   ; 5D70   0018 0000 00E7 0000
        DECLE   $003C,  $0000,  $0018,  $0000   ; 5D74   003C 0000 0018 0000
        DECLE   $0066,  $00C3,  $0081,  $004A   ; 5D78   0066 00C3 0081 004A
        DECLE   $004A,  $0008,  $0008,  $0008   ; 5D7C   004A 0008 0008 0008
        DECLE   $0018,  $0000,  $00E7,  $0000   ; 5D80   0018 0000 00E7 0000
        DECLE   $0042,  $003C,  $0018,  $0000   ; 5D84   0042 003C 0018 0000
        DECLE   $0081,  $00C3,  $0066,  $004A   ; 5D88   0081 00C3 0066 004A
        DECLE   $004A,  $0008,  $0008,  $0008   ; 5D8C   004A 0008 0008 0008
        DECLE   $0018,  $0000,  $00E7,  $0000   ; 5D90   0018 0000 00E7 0000
        DECLE   $003C,  $0042,  $0018,  $0000   ; 5D94   003C 0042 0018 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 5D98   0000 0000 0000 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5D9C   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5DA0   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5DA4   00FF 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0038   ; 5DA8   0000 0000 0010 0038
        DECLE   $0078,  $00FC,  $00FC,  $00FE   ; 5DAC   0078 00FC 00FC 00FE
        DECLE   $007E,  $007F,  $003F,  $003F   ; 5DB0   007E 007F 003F 003F
        DECLE   $001E,  $001C,  $0008,  $0000   ; 5DB4   001E 001C 0008 0000
        DECLE   $0000,  $003C,  $003C,  $003C   ; 5DB8   0000 003C 003C 003C
        DECLE   $003C,  $003C,  $003C,  $003C   ; 5DBC   003C 003C 003C 003C
        DECLE   $003C,  $003C,  $003C,  $003C   ; 5DC0   003C 003C 003C 003C
        DECLE   $003C,  $003C,  $003C,  $0000   ; 5DC4   003C 003C 003C 0000
        DECLE   $0000,  $0008,  $001C,  $001E   ; 5DC8   0000 0008 001C 001E
        DECLE   $003F,  $003F,  $007F,  $007E   ; 5DCC   003F 003F 007F 007E
        DECLE   $00FE,  $00FC,  $00FC,  $0078   ; 5DD0   00FE 00FC 00FC 0078
        DECLE   $0038,  $0010,  $0000,  $0000   ; 5DD4   0038 0010 0000 0000
        DECLE   $0040,  $0060,  $006F,  $0025   ; 5DD8   0040 0060 006F 0025
        DECLE   $0025,  $0035,  $0021,  $0021   ; 5DDC   0025 0035 0021 0021
        DECLE   $00A1,  $00A1,  $0023,  $003F   ; 5DE0   00A1 00A1 0023 003F
        DECLE   $007F,  $007F,  $00FF,  $00FF   ; 5DE4   007F 007F 00FF 00FF
        DECLE   $0040,  $0040,  $0020,  $0020   ; 5DE8   0040 0040 0020 0020
        DECLE   $0010,  $0010,  $001F,  $0012   ; 5DEC   0010 0010 001F 0012
        DECLE   $0092,  $0096,  $0020,  $0020   ; 5DF0   0092 0096 0020 0020
        DECLE   $0040,  $0040,  $00F1,  $00FF   ; 5DF4   0040 0040 00F1 00FF
        DECLE   $007F,  $0061,  $0021,  $002D   ; 5DF8   007F 0061 0021 002D
        DECLE   $0021,  $0021,  $0021,  $00A1   ; 5DFC   0021 0021 0021 00A1
        DECLE   $00A1,  $003F,  $007F,  $007F   ; 5E00   00A1 003F 007F 007F
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 5E04   007F 00FF 00FF 00FF
        DECLE   $0040,  $0040,  $0020,  $0020   ; 5E08   0040 0040 0020 0020
        DECLE   $0010,  $0010,  $001F,  $0012   ; 5E0C   0010 0010 001F 0012
        DECLE   $0092,  $0096,  $0020,  $0020   ; 5E10   0092 0096 0020 0020
        DECLE   $0040,  $0040,  $00F1,  $00FF   ; 5E14   0040 0040 00F1 00FF
        DECLE   $00C0,  $0080,  $00BF,  $00B3   ; 5E18   00C0 0080 00BF 00B3
        DECLE   $00B3,  $00BF,  $00B3,  $0080   ; 5E1C   00B3 00BF 00B3 0080
        DECLE   $00C0,  $0080,  $00BF,  $0083   ; 5E20   00C0 0080 00BF 0083
        DECLE   $00BF,  $00B0,  $00BF,  $0080   ; 5E24   00BF 00B0 00BF 0080
        DECLE   $00C0,  $0080,  $00B3,  $00B3   ; 5E28   00C0 0080 00B3 00B3
        DECLE   $00B3,  $00BF,  $0083,  $0080   ; 5E2C   00B3 00BF 0083 0080
        DECLE   $00C0,  $0080,  $00BF,  $0083   ; 5E30   00C0 0080 00BF 0083
        DECLE   $0086,  $008C,  $0098,  $0080   ; 5E34   0086 008C 0098 0080
        DECLE   $00C0,  $0080,  $0083,  $0083   ; 5E38   00C0 0080 0083 0083
        DECLE   $0083,  $00B3,  $00BF,  $0080   ; 5E3C   0083 00B3 00BF 0080
        DECLE   $00C0,  $0080,  $00BF,  $00B3   ; 5E40   00C0 0080 00BF 00B3
        DECLE   $00B3,  $00B7,  $00BF,  $0082   ; 5E44   00B3 00B7 00BF 0082
        DECLE   $0080,  $0081,  $0081,  $0081   ; 5E48   0080 0081 0081 0081
        DECLE   $0080,  $0080,  $0080,  $00C0   ; 5E4C   0080 0080 0080 00C0
        DECLE   $00D9,  $00FD,  $00FD,  $00FD   ; 5E50   00D9 00FD 00FD 00FD
        DECLE   $00F9,  $0071,  $0021,  $0003   ; 5E54   00F9 0071 0021 0003
        DECLE   $0080,  $0080,  $0080,  $0080   ; 5E58   0080 0080 0080 0080
        DECLE   $0081,  $0081,  $0080,  $00C0   ; 5E5C   0081 0081 0080 00C0
        DECLE   $0021,  $0021,  $0071,  $00F9   ; 5E60   0021 0021 0071 00F9
        DECLE   $00DD,  $00AD,  $0021,  $0003   ; 5E64   00DD 00AD 0021 0003
        DECLE   $0080,  $0080,  $0080,  $0081   ; 5E68   0080 0080 0080 0081
        DECLE   $0080,  $0080,  $0080,  $00C0   ; 5E6C   0080 0080 0080 00C0
        DECLE   $0021,  $0071,  $00F9,  $00FD   ; 5E70   0021 0071 00F9 00FD
        DECLE   $00F9,  $0071,  $0021,  $0003   ; 5E74   00F9 0071 0021 0003
        DECLE   $0003,  $0001,  $0001,  $0001   ; 5E78   0003 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 5E7C   0001 0001 0001 0001
        DECLE   $00CC,  $0055,  $00CC,  $0055   ; 5E80   00CC 0055 00CC 0055
        DECLE   $00CC,  $0055,  $00CC,  $0055   ; 5E84   00CC 0055 00CC 0055
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 5E88   00FF 00FF 00FF 0000
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; 5E8C   0000 00FF 00FF 00FF
        DECLE   $0020,  $0030,  $0038,  $007E   ; 5E90   0020 0030 0038 007E
        DECLE   $0038,  $0030,  $0020,  $0000   ; 5E94   0038 0030 0020 0000
        DECLE   $03C0,  $0380,  $0300,  $031F   ; 5E98   03C0 0380 0300 031F
        DECLE   $033F,  $033F,  $033F,  $033F   ; 5E9C   033F 033F 033F 033F
        DECLE   $03FE,  $03FE,  $03FE,  $03FE   ; 5EA0   03FE 03FE 03FE 03FE
        DECLE   $03FE,  $03FF,  $03FF,  $03FF   ; 5EA4   03FE 03FF 03FF 03FF
        DECLE   $033F,  $03BF,  $03BF,  $03FF   ; 5EA8   033F 03BF 03BF 03FF
        DECLE   $037F,  $037F,  $037F,  $030F   ; 5EAC   037F 037F 037F 030F
        DECLE   $00FC,  $00FC,  $00F8,  $00F8   ; 5EB0   00FC 00FC 00F8 00F8
        DECLE   $00E4,  $00C2,  $0081,  $0000   ; 5EB4   00E4 00C2 0081 0000
        DECLE   $008C,  $0053,  $0027,  $000A   ; 5EB8   008C 0053 0027 000A
        DECLE   $0002,  $00C2,  $0082,  $0080   ; 5EBC   0002 00C2 0082 0080
        DECLE   $0080,  $00C0,  $00E0,  $0000   ; 5EC0   0080 00C0 00E0 0000
        DECLE   $0000,  $00FC,  $00FE,  $00FF   ; 5EC4   0000 00FC 00FE 00FF
        DECLE   $0002,  $0004                   ; 5EC8   0002 0004

        INCR    R0                              ; 5ECA   0008
        RRC     R0,     1                       ; 5ECB   0070
        TSTR    R1                              ; 5ECC   0089

        JSRD    R4,     L_60FF                  ; 5ECD   0004 0062 00FF
        DECLE   $0300,  $0300,  $0303,  $030F   ; 5ED0   0300 0300 0303 030F
        DECLE   $033F,  $03F8,  $0300,  $0300   ; 5ED4   033F 03F8 0300 0300
        DECLE   $0022,  $0001,  $0280,  $000D   ; 5ED8   0022 0001 0280 000D
        DECLE   $0280,  $0019,  $0200,  $0221   ; 5EDC   0280 0019 0200 0221
        DECLE   $0040,  $0023,  $0080,  $0227   ; 5EE0   0040 0023 0080 0227
        DECLE   $0040,  $0225,  $0040,  $0027   ; 5EE4   0040 0225 0040 0027
        DECLE   $0080,  $022F,  $0040,  $022D   ; 5EE8   0080 022F 0040 022D
        DECLE   $0040,  $002B,  $0080,  $0235   ; 5EEC   0040 002B 0080 0235
        DECLE   $0040,  $0381,  $0001,  $0381   ; 5EF0   0040 0381 0001 0381
        DECLE   $0003,  $0281,  $0003,  $002E   ; 5EF4   0003 0281 0003 002E
        DECLE   $0281,  $0001,  $0000,  $000A   ; 5EF8   0281 0001 0000 000A
        DECLE   $0014,  $001E,  $0028,  $0028   ; 5EFC   0014 001E 0028 0028
        DECLE   $0032,  $0028,  $0028,  $0032   ; 5F00   0032 0028 0028 0032
        DECLE   $0028,  $0028,  $0000,  $0024   ; 5F04   0028 0028 0000 0024
        DECLE   $0075,  $002E,  $0007,  $0022   ; 5F08   0075 002E 0007 0022
        DECLE   $0086,  $0008,  $008E,  $0008   ; 5F0C   0086 0008 008E 0008
        DECLE   $0096,  $0008,  $009E,  $0008   ; 5F10   0096 0008 009E 0008
        DECLE   $00A6,  $0008,  $00AE,  $0008   ; 5F14   00A6 0008 00AE 0008
        DECLE   $00B6,  $002E,  $00B8,  $002E   ; 5F18   00B6 002E 00B8 002E
        DECLE   $00C0,  $002E,  $00CE,  $002E   ; 5F1C   00C0 002E 00CE 002E
        DECLE   $00D5,  $002E,  $0000,  $0026   ; 5F20   00D5 002E 0000 0026
        DECLE   $00D8,  $002E,  $00E5,  $002E   ; 5F24   00D8 002E 00E5 002E
        DECLE   $0000,  $0000,  $0003,  $0080   ; 5F28   0000 0000 0003 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F30   0000 0000 0000 0000
        DECLE   $00A6,  $00E8,  $0000,  $0000   ; 5F34   00A6 00E8 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $012A,  $016C   ; 5F3C   0000 0000 012A 016C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F40   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5F44   0000 0000

        NEGR    R1                              ; 5F46   0021
        NEGR    R1                              ; 5F47   0021
        ANDR    R5,     R6                      ; 5F48   01AE
        XORR    R6,     R0                      ; 5F49   01F0
        NEGR    R1                              ; 5F4A   0021
        NEGR    R1                              ; 5F4B   0021
        NEGR    R1                              ; 5F4C   0021
        NEGR    R1                              ; 5F4D   0021
        NEGR    R1                              ; 5F4E   0021
        NEGR    R1                              ; 5F4F   0021
        SWAP    R2,     1                       ; 5F50   0042
        SWAP    R2,     1                       ; 5F51   0042
        SWAP    R2,     1                       ; 5F52   0042
        SWAP    R2,     1                       ; 5F53   0042
        SWAP    R2,     1                       ; 5F54   0042
        SWAP    R2,     1                       ; 5F55   0042
        SWAP    R2,     1                       ; 5F56   0042
        SWAP    R2,     1                       ; 5F57   0042
        SWAP    R2,     1                       ; 5F58   0042
        SWAP    R2,     1                       ; 5F59   0042
        NEGR    R1                              ; 5F5A   0021
        NEGR    R1                              ; 5F5B   0021
        NEGR    R1                              ; 5F5C   0021
        NEGR    R1                              ; 5F5D   0021
        NEGR    R1                              ; 5F5E   0021
        NEGR    R1                              ; 5F5F   0021
        NEGR    R1                              ; 5F60   0021
        NEGR    R1                              ; 5F61   0021
        NEGR    R1                              ; 5F62   0021
        NEGR    R1                              ; 5F63   0021
        SAR     R1,     1                       ; 5F64   0069
        SAR     R1,     1                       ; 5F65   0069
        SAR     R1,     1                       ; 5F66   0069
        SAR     R1,     1                       ; 5F67   0069
        COMR    R2                              ; 5F68   001A
        SLR     R2,     1                       ; 5F69   0062
        RLC     R2,     1                       ; 5F6A   0052
        SLLC    R2,     1                       ; 5F6B   005A
        INCR    R0                              ; 5F6C   0008
        SLR     R0,     1                       ; 5F6D   0060
        SWAP    R0,     1                       ; 5F6E   0040
        SLL     R0,     1                       ; 5F6F   0048
        DECR    R2                              ; 5F70   0012
        SLR     R2,     1                       ; 5F71   0062
        GSWD    R2                              ; 5F72   0032
        RSWD    R2                              ; 5F73   003A
        ADCR    R0                              ; 5F74   0028
        SLR     R0,     1                       ; 5F75   0060
        SWAP    R0,     1                       ; 5F76   0040
        SLL     R0,     1                       ; 5F77   0048
        EIS                                     ; 5F78   0002
        SLR     R2,     1                       ; 5F79   0062
        GSWD    R2                              ; 5F7A   0032
        RSWD    R2                              ; 5F7B   003A
        NEGR    R2                              ; 5F7C   0022
        SLR     R2,     1                       ; 5F7D   0062
        GSWD    R2                              ; 5F7E   0032
        RSWD    R2                              ; 5F7F   003A
        COMR    R0                              ; 5F80   0018
        SLR     R0,     1                       ; 5F81   0060
        SWAP    R0,     1                       ; 5F82   0040
        SLL     R0,     1                       ; 5F83   0048
L_5F84:
        PSHR    R5                              ; 5F84   0275

        JSR     R5,     L_5F98                  ; 5F85   0004 015C 0398
        DECLE   $0200,  $0032,  $0150,  $0010   ; 5F88   0200 0032 0150 0010
        DECLE   $0041,  $0010,  $001C,  $0060   ; 5F8C   0041 0010 001C 0060
        DECLE   $0000,  $0035,  $0000,  $0023   ; 5F90   0000 0035 0000 0023
        DECLE   $0000,  $0000                   ; 5F94   0000 0000

        ADDR    R6,     R0                      ; 5F96   00F0
        DIS                                     ; 5F97   0003
L_5F98:
        MVII    #$0322, R4                      ; 5F98   02BC 0322
        MVII    #$0001, R1                      ; 5F9A   02B9 0001
L_5F9C:
        MVI@    R5,     R0                      ; 5F9C   02A8
        MVO@    R0,     R4                      ; 5F9D   0260
        MVI@    R5,     R0                      ; 5F9E   02A8
        MVO@    R0,     R4                      ; 5F9F   0260
        ADDI    #$0006, R4                      ; 5FA0   02FC 0006
        DECR    R1                              ; 5FA2   0011
        BPL     L_5F9C                          ; 5FA3   0223 0008

        SUBI    #$0005, R4                      ; 5FA5   033C 0005
        MOVR    R4,     R2                      ; 5FA7   00A2
        MOVR    R5,     R1                      ; 5FA8   00A9

        JSR     R5,     X_INIT_MOB              ; 5FA9   0004 0114 02B2

        MVI     G_016B, R2                      ; 5FAC   0282 016B
        INCR    R2                              ; 5FAE   000A
        MVO     R2,     G_016B                  ; 5FAF   0242 016B
        DECR    R2                              ; 5FB1   0012
        SARC    R2,     1                       ; 5FB2   007A
        CLRR    R0                              ; 5FB3   01C0
        RLC     R0,     1                       ; 5FB4   0050
        BEQ     L_5FB9                          ; 5FB5   0204 0002

        MVII    #$0018, R0                      ; 5FB7   02B8 0018
L_5FB9:
        SLL     R2,     2                       ; 5FB9   004E
        SLL     R2,     2                       ; 5FBA   004E
        SWAP    R2,     1                       ; 5FBB   0042
        SDBD                                    ; 5FBC   0001
        ADDI    #$162C, R2                      ; 5FBD   02FA 002C 0016
        ADDR    R0,     R2                      ; 5FC0   00C2
        MVII    #$032D, R1                      ; 5FC1   02B9 032D
        MVII    #$0028, R3                      ; 5FC3   02BB 0028

        JSR     R5,     .EXEC.9A8               ; 5FC5   0004 0118 01A8

L_5FC8:
        PULR    R7                              ; 5FC8   02B7

        PSHR    R5                              ; 5FC9   0275

        JSR     R5,     .EXEC.7AE               ; 5FCA   0004 0114 03AE
        JSR     R5,     L_5FE6                  ; 5FCD   0004 015C 03E6
        JSR     R5,     X_PLAY_SFX1             ; 5FD0   0004 0118 03BB
        DECLE   $0079                           ; 5FD3  SFX data
        DECLE   $03B7                           ; 5FD4  SFX data
        DECLE   $000C,  $0080                   ; 5FD5  SFX data
        DECLE   $010D                           ; 5FD7  SFX data
        DECLE   $010B                           ; 5FD8  SFX data
        DECLE   $01AB                           ; 5FD9  SFX data
        DECLE   $01CF                           ; 5FDA  SFX end


        MVI     G_016A, R0                      ; 5FDB   0280 016A
        DECR    R0                              ; 5FDD   0010
        MVO     R0,     G_016A                  ; 5FDE   0240 016A
        BEQ     L_5FC8                          ; 5FE0   0224 0019

        PULR    R5                              ; 5FE2   02B5
        J       L_5F84                          ; 5FE3   0004 035C 0384

L_5FE6:
        MVI     G_0334, R0                      ; 5FE6   0280 0334
        MOVR    R0,     R1                      ; 5FE8   0081
        SWAP    R0,     1                       ; 5FE9   0040
        ANDI    #$00F8, R0                      ; 5FEA   03B8 00F8
        ANDI    #$00F8, R1                      ; 5FEC   03B9 00F8
        SLR     R0,     1                       ; 5FEE   0060
        SLR     R0,     2                       ; 5FEF   0064
        SLL     R1,     1                       ; 5FF0   0049
        PSHR    R1                              ; 5FF1   0271
        SLR     R1,     2                       ; 5FF2   0065
        ADD@    R6,     R1                      ; 5FF3   02F1
        ADDR    R0,     R1                      ; 5FF4   00C1
        ADDI    #$01EB, R1                      ; 5FF5   02F9 01EB
        MOVR    R1,     R4                      ; 5FF7   008C
L_5FF8:
        PSHR    R5                              ; 5FF8   0275
        MVI     G_035B, R5                      ; 5FF9   0285 035B
        MVII    #$002E, R1                      ; 5FFB   02B9 002E
        SWAP    R1,     1                       ; 5FFD   0041
        MVII    #$0001, R2                      ; 5FFE   02BA 0001
L_6000:
        MVI@    R5,     R0                      ; 6000   02A8
        XORR    R1,     R0                      ; 6001   01C8
        MVO@    R0,     R4                      ; 6002   0260
        MVI@    R5,     R0                      ; 6003   02A8
        XORR    R1,     R0                      ; 6004   01C8
        MVO@    R0,     R4                      ; 6005   0260
        ADDI    #$0012, R4                      ; 6006   02FC 0012
        DECR    R2                              ; 6008   0012
        BPL     L_6000                          ; 6009   0223 000A

        MVO     R5,     G_035B                  ; 600B   0245 035B
        PULR    R7                              ; 600D   02B7

        DECLE   $0000,  $0000,  $0027,  $0060   ; 600E   0000 0000 0027 0060
        DECLE   $0004,  $0000,  $0000,  $0000   ; 6012   0004 0000 0000 0000
        DECLE   $0000                           ; 6016   0000

        NEGR    R3                              ; 6017   0023
        SLR     R0,     1                       ; 6018   0060

        JSR     R4,     .EXEC.400               ; 6019   0004 0014 0000
        DECLE   $0000,  $0000,  $00C9,  $005F   ; 601C   0000 0000 00C9 005F
        DECLE   $0004,  $000C,  $0000           ; 6020   0004 000C 0000

        CLRR    R0                              ; 6023   01C0
        MVO     R0,     G_032A                  ; 6024   0240 032A
        MOVR    R5,     R7                      ; 6026   00AF

        CLRR    R0                              ; 6027   01C0
        MVO     R0,     G_0322                  ; 6028   0240 0322
        MOVR    R5,     R7                      ; 602A   00AF

L_602B:
        PSHR    R5                              ; 602B   0275

        JSR     R5,     X_PLAY_SFX1             ; 602C   0004 0118 03BB
        DECLE   $011D                           ; 602F  SFX data
        DECLE   $015D                           ; 6030  SFX data
        DECLE   $0079                           ; 6031  SFX data
        DECLE   $03B7                           ; 6032  SFX data
        DECLE   $008D                           ; 6033  SFX data
        DECLE   $020B                           ; 6034  SFX data
        DECLE   $000C,  $0070                   ; 6035  SFX data
        DECLE   $00EB                           ; 6037  SFX data
        DECLE   $000C,  $0068                   ; 6038  SFX data
        DECLE   $00EB                           ; 603A  SFX data
        DECLE   $000C,  $0060                   ; 603B  SFX data
        DECLE   $00EB                           ; 603D  SFX data
        DECLE   $000C,  $0058                   ; 603E  SFX data
        DECLE   $016B                           ; 6040  SFX data
        DECLE   $000C,  $0050                   ; 6041  SFX data
        DECLE   $00C3,  $03B2                   ; 6043  SFX data
        DECLE   $0035                           ; 6045  SFX data
        DECLE   $03C3,  $03A0                   ; 6046  SFX data
        DECLE   $02CF                           ; 6048  SFX end

L_6049:
        PSHR    R5                              ; 6049   0275

        JSR     R5,     X_PLAY_MUS3             ; 604A   0004 0118 0395
        DECLE   $00CF                           ; 604D  Note (short)
        DECLE   $0000                           ; 604E  End of music

        PULR    R7                              ; 604F   02B7

L_6050:
        PSHR    R5                              ; 6050   0275

        JSR     R5,     X_PLAY_SFX1             ; 6051   0004 0118 03BB
        DECLE   $0389                           ; 6054  SFX data
        DECLE   $0040,  $0058                   ; 6055  SFX data
        DECLE   $0048,  $0028                   ; 6057  SFX data
        DECLE   $0044,  $0010                   ; 6059  SFX data
        DECLE   $000C,  $0200                   ; 605B  SFX data
        DECLE   $029D                           ; 605D  SFX data
        DECLE   $000B                           ; 605E  SFX data
        DECLE   $00C3,  $03F4                   ; 605F  SFX data
        DECLE   $03CF                           ; 6061  SFX end

        DECLE   $00B2,  $0062,  $00B2,  $0060   ; 6062   00B2 0062 00B2 0060
        DECLE   $00CB,  $0060,  $004A,  $0062   ; 6066   00CB 0060 004A 0062
        DECLE   $00AD,  $0060,  $007E,  $0060   ; 606A   00AD 0060 007E 0060
        DECLE   $0080,  $0000,  $0000,  $0005   ; 606E   0080 0000 0000 0005
        DECLE   $0001,  $0005,  $0003,  $0001   ; 6072   0001 0005 0003 0001
        DECLE   $0180,  $0190,  $01A0,  $01B0   ; 6076   0180 0190 01A0 01B0
        DECLE   $01C0,  $01D0,  $01E0,  $01F0   ; 607A   01C0 01D0 01E0 01F0
        DECLE   $004E,  $0041,  $0052,  $004D   ; 607E   004E 0041 0052 004D
        DECLE   $004F,  $0052,  $0020,  $0042   ; 6082   004F 0052 0020 0042
        DECLE   $0041,  $0054,  $0054,  $004C   ; 6086   0041 0054 0054 004C
        DECLE   $0045,  $0000                   ; 608A   0045 0000

        MVI     .PSG0.rgt_hand,R0               ; 608C   0280 01FE
        CMPI    #$00DB, R0                      ; 608E   0378 00DB
        BNEQ    L_60AA                          ; 6090   020C 0018

        MVI     .PSG0.lft_hand,R0               ; 6092   0280 01FF
        CMPI    #$00DE, R0                      ; 6094   0378 00DE
        BNEQ    L_60AA                          ; 6096   020C 0012

        PSHR    R5                              ; 6098   0275
        MVII    #$0007, R1                      ; 6099   02B9 0007
        MVII    #$0290, R4                      ; 609B   02BC 0290

        JSR     R5,     L_5094                  ; 609D   0004 0150 0094
        DECLE   $035A,  $0343,  $03C1,  $009E   ; 60A0   035A 0343 03C1 009E
        DECLE   $0028,  $03C1,  $035A,  $035E   ; 60A4   0028 03C1 035A 035E
        DECLE   $0000                           ; 60A8   0000

        PULR    R5                              ; 60A9   02B5
L_60AA:
        J       L_5252                          ; 60AA   0004 0350 0252

        DECLE   $000D,  $0001                   ; 60AD   000D 0001

        AND     .STIC.A.1,R0                    ; 60AF   0380 0011
        B       L_6124                          ; 60B1   0200 0071

        DECLE   $001A,  $0001,  $0080,  $0068   ; 60B3   001A 0001 0080 0068
        DECLE   $0052,  $0001,  $0000,  $0040   ; 60B7   0052 0001 0000 0040
        DECLE   $0052,  $0001,  $0000,  $0000   ; 60BB   0052 0001 0000 0000
        DECLE   $0000                           ; 60BF   0000

        SDBD                                    ; 60C0   0001
        MVII    #$6076, R0                      ; 60C1   02B8 0076 0060
        MVO     R0,     G_02F0                  ; 60C4   0240 02F0
        MVII    #$02F1, R6                      ; 60C6   02BE 02F1
        J       .EXEC.041                       ; 60C8   0004 0310 0041

        PSHR    R5                              ; 60CB   0275
        MVII    #$0004, R0                      ; 60CC   02B8 0004
        MVO     R0,     G_0103                  ; 60CE   0240 0103
        SDBD                                    ; 60D0   0001
        MVII    #$64D5, R2                      ; 60D1   02BA 00D5 0064
        SDBD                                    ; 60D4   0001
        MVII    #$6472, R3                      ; 60D5   02BB 0072 0064
        MVII    #$0078, R0                      ; 60D8   02B8 0078
        MVII    #$0200, R4                      ; 60DA   02BC 0200

        JSR     R5,     L_5382                  ; 60DC   0004 0150 0382

        MVII    #$0058, R0                      ; 60DF   02B8 0058
        MVO     R0,     G_0118                  ; 60E1   0240 0118
        MOVR    R7,     R3                      ; 60E3   00BB
        ADDI    #$00BA, R3                      ; 60E4   02FB 00BA

        JSR     R5,     L_5215                  ; 60E6   0004 0150 0215
        DECLE   $0002                           ; 60E9   0002

        SWAP    R1,     1                       ; 60EA   0041
        DECR    R0                              ; 60EB   0010
        ADDR    R2,     R7                      ; 60EC   00D7

        SLR     R1,     1                       ; 60ED   0061
        EIS                                     ; 60EE   0002
        SWAP    R0,     1                       ; 60EF   0040
        DECR    R0                              ; 60F0   0010
        ADDR    R2,     R7                      ; 60F1   00D7

        DECLE   $0061,  $0001,  $0041,  $0030   ; 60F2   0061 0001 0041 0030
        DECLE   $00D0,  $0061,  $0001,  $0040   ; 60F6   00D0 0061 0001 0040
        DECLE   $0030,  $00D0,  $0061,  $0002   ; 60FA   0030 00D0 0061 0002
        DECLE   $0000                           ; 60FE   0000
L_60FF:
        DECR    R0                              ; 60FF   0010
        DECLE   $0000,  $0000,  $0000           ; 6100   0000 0000 0000

        MVII    #$0001, R0                      ; 6103   02B8 0001

        JSR     R5,     .EXEC.6CF               ; 6105   0004 0114 02CF

        MVII    #$0003, R0                      ; 6108   02B8 0003

        JSR     R5,     .EXEC.6CF               ; 610A   0004 0114 02CF

        MVII    #$0008, R0                      ; 610D   02B8 0008
        SWAP    R0,     1                       ; 610F   0040
        MVO     R0,     G_0329                  ; 6110   0240 0329
        MVO     R0,     G_0339                  ; 6112   0240 0339

        JSR     R5,     L_525F                  ; 6114   0004 0150 025F
        BIDECLE $6687,  $61E5                   ; 6117   0087 0066 00E5 0061

        SDBD                                    ; 611B   0001
        MVII    #$666B, R0                      ; 611C   02B8 006B 0066
        MVO     R0,     G_0324                  ; 611F   0240 0324

        JSR     R5,     L_6613                  ; 6121   0004 0164 0213
L_6124:
        JSR     R5,     L_523A                  ; 6124   0004 0150 023A
        DECLE   $0013,  $0043,  $0061,  $0031   ; 6127   0013 0043 0061 0031
        DECLE   $0054,  $0061,  $007C,  $0071   ; 612B   0054 0061 007C 0071
        DECLE   $0061,  $004F,  $0064,  $0061   ; 612F   0061 004F 0064 0061
        DECLE   $0018,  $0071,  $0061,  $004A   ; 6133   0018 0071 0061 004A
        DECLE   $007C,  $0061,  $0068,  $0071   ; 6137   007C 0061 0068 0071
        DECLE   $0061,  $0027                   ; 613B   0061 0027

        MOVR    R1,     R5                      ; 613D   008D
        SLR     R1,     1                       ; 613E   0061
        SLLC    R1,     2                       ; 613F   005D
        MOVR    R6,     R0                      ; 6140   00B0
        SLR     R1,     1                       ; 6141   0061
        MOVR    R2,     R6                      ; 6142   0096
        PSHR    R5                              ; 6143   0275

        JSR     R5,     L_5A62                  ; 6144   0004 0158 0262
        DECLE   $02DD,  $0267,  $009A,  $008D   ; 6147   02DD 0267 009A 008D
        DECLE   $008C,  $031A,  $010D,  $02A0   ; 614B   008C 031A 010D 02A0
        DECLE   $0064,  $025E,  $009E,  $0000   ; 614F   0064 025E 009E 0000

        PULR    R7                              ; 6153   02B7

        PSHR    R5                              ; 6154   0275

        JSR     R5,     L_5A62                  ; 6155   0004 0158 0262
        DECLE   $02DD,  $030E,  $029A,  $004E   ; 6158   02DD 030E 029A 004E
        DECLE   $028D,  $0264,  $0220,  $0273   ; 615C   028D 0264 0220 0273
        DECLE   $0002,  $015E,  $0000           ; 6160   0002 015E 0000

        PULR    R7                              ; 6163   02B7

        PSHR    R5                              ; 6164   0275

        JSR     R5,     L_5A62                  ; 6165   0004 0158 0262
        DECLE   $02E1,  $02C0,  $0262,  $00FA   ; 6168   02E1 02C0 0262 00FA
        DECLE   $01D4,  $027E,  $009E,  $0000   ; 616C   01D4 027E 009E 0000

        PULR    R7                              ; 6170   02B7

        PSHR    R5                              ; 6171   0275
        MVII    #$0014, R0                      ; 6172   02B8 0014
        MVII    #$0001, R1                      ; 6174   02B9 0001
        MVII    #$02DC, R4                      ; 6176   02BC 02DC

        JSR     R5,     X_FILL_ZERO             ; 6178   0004 0114 0338

        PULR    R7                              ; 617B   02B7

        PSHR    R5                              ; 617C   0275

        JSR     R5,     L_5A62                  ; 617D   0004 0158 0262
        DECLE   $02DD,  $00E4,  $03C6,  $025A   ; 6180   02DD 00E4 03C6 025A
        DECLE   $002E,  $00C6,  $0083,  $0343   ; 6184   002E 00C6 0083 0343
        DECLE   $01D6,  $01BE,  $009E,  $0000   ; 6188   01D6 01BE 009E 0000

        PULR    R7                              ; 618C   02B7

        PSHR    R5                              ; 618D   0275

        JSR     R5,     L_5A62                  ; 618E   0004 0158 0262

        ADD@    R3,     R5                      ; 6191   02DD
        SUB@    R1,     R6                      ; 6192   030E
        MVI@    R3,     R6                      ; 6193   029E
        ADDR    R2,     R1                      ; 6194   00D1
        MOVR    R3,     R2                      ; 6195   009A
        MVI@    R5,     R0                      ; 6196   02A8
        RLC     R3,     1                       ; 6197   0053
        XORR    R2,     R1                      ; 6198   01D1
        SUBR    R1,     R6                      ; 6199   010E
        MVI@    R2,     R2                      ; 619A   0292
        XOR     G_03C0, R4                      ; 619B   03C4 03C0
        PULR    R7                              ; 619D   02B7

        DECLE   $0014,  $000C,  $0000,  $001C   ; 619E   0014 000C 0000 001C
        DECLE   $000C,  $0000,  $008A,  $0057   ; 61A2   000C 0000 008A 0057
        DECLE   $0000,  $0092,  $0057,  $0000   ; 61A6   0000 0092 0057 0000
        DECLE   $0014,  $003E,  $0000,  $008A   ; 61AA   0014 003E 0000 008A
        DECLE   $0025,  $0000                   ; 61AE   0025 0000

        PSHR    R5                              ; 61B0   0275

        JSR     R5,     L_661F                  ; 61B1   0004 0164 021F

        MVII    #$00EF, R0                      ; 61B4   02B8 00EF
        MVII    #$0200, R4                      ; 61B6   02BC 0200
        MVII    #$0020, R1                      ; 61B8   02B9 0020
        SWAP    R1,     1                       ; 61BA   0041
        MVO@    R1,     R4                      ; 61BB   0261

        JSR     R5,     X_FILL_ZERO             ; 61BC   0004 0114 0338

        SDBD                                    ; 61BF   0001
        MVII    #$60B6, R1                      ; 61C0   02B9 00B6 0060

        JSR     R5,     X_TIMER_STOP            ; 61C3   0004 0118 0038
        JSR     R5,     .EXEC.7B3               ; 61C6   0004 0114 03B3
        JSR     R5,     .EXEC.A61               ; 61C9   0004 0118 0261

        SLR     R0,     2                       ; 61CC   0064
        J       X_RESET                         ; 61CD   0004 0310 0000

        DECLE   $0300,  $0000,  $0000,  $0000   ; 61D0   0300 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $03DC   ; 61D4   0001 0000 0000 03DC
        DECLE   $0013,  $0000,  $0000,  $0009   ; 61D8   0013 0000 0000 0009
        DECLE   $0002,  $0000,  $03DC,  $0013   ; 61DC   0002 0000 03DC 0013
        DECLE   $0000,  $0000,  $0009,  $0014   ; 61E0   0000 0000 0009 0014
        DECLE   $0000                           ; 61E4   0000

        PSHR    R5                              ; 61E5   0275
        MVI     G_0318, R3                      ; 61E6   0283 0318
        MVI@    R3,     R0                      ; 61E8   0298
        MVI     G_0163, R4                      ; 61E9   0284 0163
        ADDI    #$016F, R4                      ; 61EB   02FC 016F
        MVO@    R0,     R4                      ; 61ED   0260
        DECR    R4                              ; 61EE   0014
        PSHR    R4                              ; 61EF   0274
        ANDI    #$0200, R0                      ; 61F0   03B8 0200
        BEQ     L_6208                          ; 61F2   0204 0014

        MVI     G_0163, R1                      ; 61F4   0281 0163
        SLL     R1,     1                       ; 61F6   0049
        SLL     R1,     2                       ; 61F7   004D
        MOVR    R1,     R2                      ; 61F8   008A
        SLL     R1,     1                       ; 61F9   0049
        ADDI    #$031F, R1                      ; 61FA   02F9 031F
        ADDI    #$033F, R2                      ; 61FC   02FA 033F
        MVI@    R1,     R0                      ; 61FE   0288
        MVI@    R2,     R4                      ; 61FF   0294
        MVO@    R4,     R1                      ; 6200   024C
        MVO@    R0,     R2                      ; 6201   0250
        INCR    R2                              ; 6202   000A
        INCR    R1                              ; 6203   0009
        MVI@    R1,     R0                      ; 6204   0288
        MVI@    R2,     R4                      ; 6205   0294
        MVO@    R4,     R1                      ; 6206   024C
        MVO@    R0,     R2                      ; 6207   0250
L_6208:
        MVI@    R3,     R0                      ; 6208   0298
        ANDI    #$0100, R0                      ; 6209   03B8 0100
        SLR     R0,     1                       ; 620B   0060
        SLR     R0,     2                       ; 620C   0064
        MVI     G_0163, R1                      ; 620D   0281 0163
        SLL     R1,     2                       ; 620F   004D
        SLL     R1,     2                       ; 6210   004D
        ADDI    #$031D, R1                      ; 6211   02F9 031D
        MVI@    R1,     R2                      ; 6213   028A
        SDBD                                    ; 6214   0001
        ANDI    #$FFDF, R2                      ; 6215   03BA 00DF 00FF
        XORR    R0,     R2                      ; 6218   01C2
        MVO@    R2,     R1                      ; 6219   024A
        ADDI    #$0008, R1                      ; 621A   02F9 0008
        MVO@    R2,     R1                      ; 621C   024A
        INCR    R3                              ; 621D   000B
        MVI@    R3,     R0                      ; 621E   0298
        ANDI    #$0100, R0                      ; 621F   03B8 0100
        BEQ     L_622A                          ; 6221   0204 0007

        PSHR    R3                              ; 6223   0273
        MVI     G_0163, R1                      ; 6224   0281 0163

        JSR     R5,     L_654D                  ; 6226   0004 0164 014D

        PULR    R3                              ; 6229   02B3
L_622A:
        PULR    R4                              ; 622A   02B4
        MVI@    R4,     R1                      ; 622B   02A1
        MVI     G_0163, R2                      ; 622C   0282 0163
        SLL     R2,     2                       ; 622E   004E
        SLL     R2,     2                       ; 622F   004E
        ADDI    #$031D, R2                      ; 6230   02FA 031D
        PSHR    R1                              ; 6232   0271
        PSHR    R3                              ; 6233   0273

        JSR     R5,     L_64A0                  ; 6234   0004 0164 00A0

        PULR    R3                              ; 6237   02B3
        PULR    R1                              ; 6238   02B1
        SUBI    #$000D, R2                      ; 6239   033A 000D
        MOVR    R1,     R0                      ; 623B   0088
        ANDI    #$0070, R0                      ; 623C   03B8 0070
        SLR     R0,     2                       ; 623E   0064

        JSR     R5,     L_6629                  ; 623F   0004 0164 0229

        ADDI    #$0004, R2                      ; 6242   02FA 0004
        MVO@    R0,     R2                      ; 6244   0250
        MVI@    R3,     R0                      ; 6245   0298
        INCR    R3                              ; 6246   000B
        MVO     R3,     G_0318                  ; 6247   0243 0318
        PULR    R7                              ; 6249   02B7

        DECLE   $003F,  $007F,  $00FF,  $00FF   ; 624A   003F 007F 00FF 00FF
        DECLE   $00AA,  $00FF,  $00AA,  $00FF   ; 624E   00AA 00FF 00AA 00FF
        DECLE   $00E0,  $00E0,  $00E0,  $00A0   ; 6252   00E0 00E0 00E0 00A0
        DECLE   $00E0,  $00A0,  $00C0,  $0080   ; 6256   00E0 00A0 00C0 0080
        DECLE   $003F,  $00CF,  $00F3,  $00FC   ; 625A   003F 00CF 00F3 00FC
        DECLE   $00FE,  $003E,  $000E,  $0002   ; 625E   00FE 003E 000E 0002
        DECLE   $00FC,  $00F0,  $00CC,  $003C   ; 6262   00FC 00F0 00CC 003C
        DECLE   $00FC,  $00FC,  $00F0,  $00C0   ; 6266   00FC 00FC 00F0 00C0
        DECLE   $00FE,  $003E,  $000E,  $0000   ; 626A   00FE 003E 000E 0000
        DECLE   $0000,  $000F,  $003F,  $00FF   ; 626E   0000 000F 003F 00FF
        DECLE   $00FC,  $00F0,  $00C0,  $0000   ; 6272   00FC 00F0 00C0 0000
        DECLE   $0000,  $0000,  $00C0,  $00F0   ; 6276   0000 0000 00C0 00F0
        DECLE   $0003,  $000F,  $003F,  $00FF   ; 627A   0003 000F 003F 00FF

        SARC    R3,     2                       ; 627E   007F
        ADDR    R1,     R7                      ; 627F   00CF

        DECLE   $00F3,  $00FC,  $0080,  $00E0   ; 6280   00F3 00FC 0080 00E0
        DECLE   $00F8,  $00FE,  $00FE,  $00FA   ; 6284   00F8 00FE 00FE 00FA
        DECLE   $00CE,  $003E,  $006C,  $00FE   ; 6288   00CE 003E 006C 00FE
        DECLE   $005C,  $0001,  $00B4,  $007E   ; 628C   005C 0001 00B4 007E
        DECLE   $00DE,  $007F,  $00B4,  $007E   ; 6290   00DE 007F 00B4 007E
        DECLE   $00DE,  $007F,  $00FE,  $00FA   ; 6294   00DE 007F 00FE 00FA
        DECLE   $007C,  $0038,  $003C,  $005E   ; 6298   007C 0038 003C 005E
        DECLE   $00FF                           ; 629C   00FF

        ADDR    R6,     R6                      ; 629D   00F6
        SARC    R0,     2                       ; 629E   007C
        DECR    R0                              ; 629F   0010
        DECR    R0                              ; 62A0   0010
        DECR    R0                              ; 62A1   0010
        ADDR    R7,     R6                      ; 62A2   00FE
        ADDR    R7,     R2                      ; 62A3   00FA
        SARC    R0,     2                       ; 62A4   007C
        RSWD    R0                              ; 62A5   0038
        DECR    R0                              ; 62A6   0010
        DECR    R0                              ; 62A7   0010
        DECR    R0                              ; 62A8   0010
        DECR    R0                              ; 62A9   0010
        SWAP    R2,     1                       ; 62AA   0042
        SARC    R2,     2                       ; 62AB   007E
        ADDR    R7,     R1                      ; 62AC   00F9
        MOVR    R3,     R7                      ; 62AD   009F

        DECLE   $00F0,  $003D,  $00F8,  $006F   ; 62AE   00F0 003D 00F8 006F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62B2   0000 0000 0000 0000
        DECLE   $0070,  $007F,  $0030,  $0070   ; 62B6   0070 007F 0030 0070
        DECLE   $00FE,  $00FE,  $00FE,  $007C   ; 62BA   00FE 00FE 00FE 007C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62BE   0000 0000 0000 0000
        DECLE   $0000,  $0030,  $003F,  $003C   ; 62C2   0000 0030 003F 003C
        DECLE   $0038,  $0038,  $0039,  $0009   ; 62C6   0038 0038 0039 0009
        DECLE   $003E,  $003E,  $003E,  $003E   ; 62CA   003E 003E 003E 003E
        DECLE   $0031,  $0031,  $0001,  $0001   ; 62CE   0031 0031 0001 0001
        DECLE   $0000,  $0001                   ; 62D2   0000 0001

        INCR    R7                              ; 62D4   000F

        SLLC    R0,     1                       ; 62D5   0058
L_62D6:
        SARC    R0,     1                       ; 62D6   0078
        SAR     R0,     1                       ; 62D7   0068
        SLLC    R0,     2                       ; 62D8   005C
        RLC     R0,     2                       ; 62D9   0054
        ADCR    R7                              ; 62DA   002F

        ADCR    R3                              ; 62DB   002B
L_62DC:
        DECR    R7                              ; 62DC   0017
L_62DD:
        DECR    R7                              ; 62DD   0017

        DECLE   $000B,  $000A,  $0006,  $0004   ; 62DE   000B 000A 0006 0004
        DECLE   $0007,  $0008,  $0010,  $0010   ; 62E2   0007 0008 0010 0010
        DECLE   $0050,  $00E8,  $00B4,  $009B   ; 62E6   0050 00E8 00B4 009B
        DECLE   $008D,  $0046,  $0023,  $0011   ; 62EA   008D 0046 0023 0011
        DECLE   $0008,  $0004,  $0002,  $0001   ; 62EE   0008 0004 0002 0001
        DECLE   $0000,  $0000,  $000E,  $001F   ; 62F2   0000 0000 000E 001F

        DECR    R1                              ; 62F6   0011
        NEGR    R0                              ; 62F7   0020
        NEGR    R4                              ; 62F8   0024
        RSWD    R4                              ; 62F9   003C
        SWAP    R3,     2                       ; 62FA   0047
        MOVR    R7,     R0                      ; 62FB   00B8
        MOVR    R0,     R7                      ; 62FC   0087

        DECLE   $0080,  $0040,  $0038,  $0007   ; 62FD   0080 0040 0038 0007
        DECLE   $0000,  $0000                   ; 6301   0000 0000

        INCR    R7                              ; 6303   000F

        GSWD    R0                              ; 6304   0030
L_6305:
        SWAP    R0,     1                       ; 6305   0040
        DECLE   $0040,  $0040,  $0060,  $0070   ; 6306   0040 0040 0060 0070
        DECLE   $007F,  $007F,  $007F,  $0080   ; 630A   007F 007F 007F 0080
        DECLE   $0080,  $0080,  $0040,  $003F   ; 630E   0080 0080 0040 003F
        DECLE   $0000,  $0000,  $0000,  $0007   ; 6312   0000 0000 0000 0007
        DECLE   $0018,  $0020,  $0060,  $00E0   ; 6316   0018 0020 0060 00E0
        DECLE   $00F1,  $007F,  $003C,  $001B   ; 631A   00F1 007F 003C 001B
        DECLE   $000C,  $0004,  $0004,  $0003   ; 631E   000C 0004 0004 0003
        DECLE   $0000,  $0000                   ; 6322   0000 0000

        CLRC                                    ; 6324   0006
        INCR    R7                              ; 6325   000F

        DECR    R0                              ; 6326   0010
L_6327:
        NEGR    R0                              ; 6327   0020
        DECLE   $0060,  $00E0,  $00F1,  $00FF   ; 6328   0060 00E0 00F1 00FF
        DECLE   $00FE,  $006D,  $0007,  $0001   ; 632C   00FE 006D 0007 0001
        DECLE   $0001,  $0000,  $0010,  $001C   ; 6330   0001 0000 0010 001C
        DECLE   $003D,  $003E,  $0070,  $0061   ; 6334   003D 003E 0070 0061
        DECLE   $00E1,  $00E1,  $00F3,  $00FF   ; 6338   00E1 00E1 00F3 00FF
        DECLE   $00FF,  $00FF,  $004F,  $0007   ; 633C   00FF 00FF 004F 0007
        DECLE   $0001,  $0001,  $0001,  $0001   ; 6340   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0031,  $003B   ; 6344   0001 0001 0031 003B
        DECLE   $003B,  $000B,  $0038,  $0038   ; 6348   003B 000B 0038 0038
        DECLE   $003C,  $003F,  $003F,  $003F   ; 634C   003C 003F 003F 003F
        DECLE   $0030,  $0030,  $0000,  $0030   ; 6350   0030 0030 0000 0030
        DECLE   $00F8,  $0078,  $0038,  $0038   ; 6354   00F8 0078 0038 0038
        DECLE   $0038,  $0060,  $00F8,  $00F8   ; 6358   0038 0060 00F8 00F8
        DECLE   $00F8,  $00F8,  $0018,  $0018   ; 635C   00F8 00F8 0018 0018
        DECLE   $0000,  $0000,  $0000,  $0080   ; 6360   0000 0000 0000 0080
        DECLE   $00C0,  $00C0,  $00E0,  $00E0   ; 6364   00C0 00C0 00E0 00E0
        DECLE   $00F0,  $00F0,  $0078,  $0078   ; 6368   00F0 00F0 0078 0078
        DECLE   $0098,  $0048,  $0020,  $0020   ; 636C   0098 0048 0020 0020
        DECLE   $0010,  $0010,  $0080,  $00C0   ; 6370   0010 0010 0080 00C0
        DECLE   $0060,  $0070,  $0078,  $003C   ; 6374   0060 0070 0078 003C
        DECLE   $009E,  $00CA,  $00E8,  $00FC   ; 6378   009E 00CA 00E8 00FC
        DECLE   $0066,  $00C3,  $0081,  $0080   ; 637C   0066 00C3 0081 0080
        DECLE   $0080,  $0000,  $0000,  $0000   ; 6380   0080 0000 0000 0000
        DECLE   $0000,  $00C0,  $00F8,  $00F8   ; 6384   0000 00C0 00F8 00F8
        DECLE   $00F8,  $0018,  $00E0,  $00FC   ; 6388   00F8 0018 00E0 00FC
        DECLE   $00C3,  $0080,  $0000,  $0000   ; 638C   00C3 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00F0   ; 6390   0000 0000 0000 00F0
        DECLE   $00F8,  $0070,  $0070,  $000E   ; 6394   00F8 0070 0070 000E
        DECLE   $0070,  $00F0,  $00F0,  $00F0   ; 6398   0070 00F0 00F0 00F0
        DECLE   $00F0,  $0008,  $0004,  $0004   ; 639C   00F0 0008 0004 0004
        DECLE   $0008,  $00F0,  $0000,  $0000   ; 63A0   0008 00F0 0000 0000
        DECLE   $0007,  $0018,  $00E0,  $00E0   ; 63A4   0007 0018 00E0 00E0
        DECLE   $0080,  $00FC,  $00E2,  $001D   ; 63A8   0080 00FC 00E2 001D
        DECLE   $00E1,  $0001,  $0002,  $001C   ; 63AC   00E1 0001 0002 001C
        DECLE   $00E0,  $0000,  $0008,  $0018   ; 63B0   00E0 0000 0008 0018
        DECLE   $0030,  $00E0,  $0040,  $00E4   ; 63B4   0030 00E0 0040 00E4
        DECLE   $00EE,  $00DA,  $00B2,  $0062   ; 63B8   00EE 00DA 00B2 0062
        DECLE   $00C4,  $0088,  $0010,  $0020   ; 63BC   00C4 0088 0010 0020
        DECLE   $0040,  $0080,  $0040,  $0080   ; 63C0   0040 0080 0040 0080
        DECLE   $0080,  $0030,  $00E8,  $00E8   ; 63C4   0080 0030 00E8 00E8
        DECLE   $00C8,  $00D0,  $0090,  $00A0   ; 63C8   00C8 00D0 0090 00A0
        DECLE   $0020,  $0040,  $0040,  $0080   ; 63CC   0020 0040 0040 0080
        DECLE   $0080,  $0000,  $0000,  $0000   ; 63D0   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0098   ; 63D4   0000 0000 0018 0098
        DECLE   $00B8,  $00A0,  $0038,  $0038   ; 63D8   00B8 00A0 0038 0038
        DECLE   $0078,  $00F8,  $00F8,  $00F8   ; 63DC   0078 00F8 00F8 00F8
        DECLE   $0018,  $0018,  $0000,  $0000   ; 63E0   0018 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63E4   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $0018,  $0018   ; 63E8   0018 0018 0018 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63EC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0000   ; 63F0   0000 0000 0080 0000
        DECLE   $0002,  $0000,  $0000,  $0020   ; 63F4   0002 0000 0000 0020
        DECLE   $0018,  $0018,  $0000,  $0004   ; 63F8   0018 0018 0000 0004
        DECLE   $0020,  $0000,  $0000,  $0000   ; 63FC   0020 0000 0000 0000
        DECLE   $0080,  $0000,  $0081,  $0000   ; 6400   0080 0000 0081 0000
        DECLE   $0000,  $0000,  $0040,  $0018   ; 6404   0000 0000 0040 0018
        DECLE   $0024,  $0024,  $0024,  $0024   ; 6408   0024 0024 0024 0024
        DECLE   $0018,  $0000,  $0002,  $0000   ; 640C   0018 0000 0002 0000
        DECLE   $0040,  $0000,  $0000,  $0000   ; 6410   0040 0000 0000 0000
        DECLE   $0080,  $0000,  $003C,  $0042   ; 6414   0080 0000 003C 0042
        DECLE   $0042,  $0042,  $004A,  $0042   ; 6418   0042 0042 004A 0042
        DECLE   $0042,  $003C,  $0000,  $0000   ; 641C   0042 003C 0000 0000
        DECLE   $0000,  $0081,  $0000,  $0000   ; 6420   0000 0081 0000 0000
        DECLE   $0018,  $0024,  $0042,  $0042   ; 6424   0018 0024 0042 0042
        DECLE   $0081,  $0089,  $0081,  $0081   ; 6428   0081 0089 0081 0081
        DECLE   $0046,  $0042,  $0024,  $0018   ; 642C   0046 0042 0024 0018
        DECLE   $0000,  $0000,  $0018,  $0024   ; 6430   0000 0000 0018 0024
        DECLE   $0042,  $0042,  $0085,  $0081   ; 6434   0042 0042 0085 0081
        DECLE   $0081,  $0081,  $0091,  $0081   ; 6438   0081 0081 0091 0081
        DECLE   $0081,  $0042,  $0042,  $0025   ; 643C   0081 0042 0042 0025
        DECLE   $0018,  $0000,  $0024,  $0042   ; 6440   0018 0000 0024 0042
        DECLE   $0081,  $0083,  $0000,  $0000   ; 6444   0081 0083 0000 0000
        DECLE   $0010,  $0008,  $0000,  $0000   ; 6448   0010 0008 0000 0000
        DECLE   $0020,  $0081,  $0081,  $0042   ; 644C   0020 0081 0081 0042
        DECLE   $0024,  $0024,  $0063,  $0042   ; 6450   0024 0024 0063 0042
        DECLE   $0081,  $0000,  $0020,  $0004   ; 6454   0081 0000 0020 0004
        DECLE   $0000,  $0010,  $0010,  $0000   ; 6458   0000 0010 0010 0000
        DECLE   $0004,  $0000,  $0040,  $0001   ; 645C   0004 0000 0040 0001
        DECLE   $0081,  $00C2,  $0000,  $0000   ; 6460   0081 00C2 0000 0000
        DECLE   $0030,  $001C,  $0004,  $000C   ; 6464   0030 001C 0004 000C
        DECLE   $0018,  $0070,  $00E6,  $00E9   ; 6468   0018 0070 00E6 00E9
        DECLE   $00D1,  $0021,  $0042,  $00FC   ; 646C   00D1 0021 0042 00FC
        DECLE   $0000,  $0000,  $0003,  $0018   ; 6470   0000 0000 0003 0018
        DECLE   $000B,  $0018,  $0013,  $0018   ; 6474   000B 0018 0013 0018
        DECLE   $001B,  $0018,  $0023,  $0018   ; 6478   001B 0018 0023 0018
        DECLE   $002B,  $0018,  $0033,  $0018   ; 647C   002B 0018 0033 0018
        DECLE   $003B,  $0018,  $0044,  $0008   ; 6480   003B 0018 0044 0008
        DECLE   $004C,  $0008,  $0054,  $0008   ; 6484   004C 0008 0054 0008
        DECLE   $005C,  $0008,  $0065,  $0018   ; 6488   005C 0008 0065 0018
        DECLE   $0000,  $0000                   ; 648C   0000 0000

        ADDR    R7,     R3                      ; 648E   00FB
        EIS                                     ; 648F   0002
        SLR     R3,     1                       ; 6490   0063
        DIS                                     ; 6491   0003
        SAR     R3,     1                       ; 6492   006B
        DIS                                     ; 6493   0003
        RRC     R3,     1                       ; 6494   0073
        DIS                                     ; 6495   0003
        SARC    R3,     1                       ; 6496   007B
        DIS                                     ; 6497   0003
        MOVR    R0,     R3                      ; 6498   0083
        DIS                                     ; 6499   0003
        MOVR    R1,     R3                      ; 649A   008B
        DIS                                     ; 649B   0003
        MOVR    R2,     R3                      ; 649C   0093
        DIS                                     ; 649D   0003
        TSTR    R3                              ; 649E   009B
        DIS                                     ; 649F   0003
L_64A0:
        PSHR    R5                              ; 64A0   0275
        SUBI    #$0005, R1                      ; 64A1   0339 0005
        ANDI    #$000F, R1                      ; 64A3   03B9 000F
        MVI@    R2,     R0                      ; 64A5   0290
        SDBD                                    ; 64A6   0001
        ANDI    #$FDFF, R0                      ; 64A7   03B8 00FF 00FD
        SDBD                                    ; 64AA   0001
        MVII    #$61DE, R5                      ; 64AB   02BD 00DE 0061
        SDBD                                    ; 64AE   0001
        MVII    #$61D7, R3                      ; 64AF   02BB 00D7 0061
        CMPI    #$0008, R1                      ; 64B2   0379 0008
        BPL     L_64BB                          ; 64B4   0203 0005

        XORR    R3,     R5                      ; 64B6   01DD
        XORR    R5,     R3                      ; 64B7   01EB
        XORR    R3,     R5                      ; 64B8   01DD
        XORI    #$0200, R0                      ; 64B9   03F8 0200
L_64BB:
        MVO@    R0,     R2                      ; 64BB   0250
        INCR    R2                              ; 64BC   000A
        MVO@    R3,     R2                      ; 64BD   0253
        ADDI    #$0007, R2                      ; 64BE   02FA 0007
        MVO@    R0,     R2                      ; 64C0   0250
        INCR    R2                              ; 64C1   000A
        MVO@    R5,     R2                      ; 64C2   0255
        ADDI    #$0009, R1                      ; 64C3   02F9 0009
        ANDI    #$000F, R1                      ; 64C5   03B9 000F
        CMPI    #$0009, R1                      ; 64C7   0379 0009
        BMI     L_64CE                          ; 64C9   020B 0003

        NEGR    R1                              ; 64CB   0021
        ANDI    #$000F, R1                      ; 64CC   03B9 000F
L_64CE:
        SUBI    #$0004, R2                      ; 64CE   033A 0004
        MVO@    R1,     R2                      ; 64D0   0251
        ADDI    #$0008, R2                      ; 64D1   02FA 0008
        MVO@    R1,     R2                      ; 64D3   0251
        PULR    R7                              ; 64D4   02B7

        DECLE   $01AD,  $01AD,  $01AC,  $018D   ; 64D5   01AD 01AD 01AC 018D
        DECLE   $01AD,  $01AD,  $01AD,  $01AD   ; 64D9   01AD 01AD 01AD 01AD
        DECLE   $01AA,  $0128,  $01AD,  $01AD   ; 64DD   01AA 0128 01AD 01AD
        DECLE   $01AC,  $018C,  $018C,  $018C   ; 64E1   01AC 018C 018C 018C
        DECLE   $018C,  $018D,  $01AD,  $016A   ; 64E5   018C 018D 01AD 016A
        DECLE   $01AD,  $01AD,  $01AC,  $018C   ; 64E9   01AD 01AD 01AC 018C
        DECLE   $018C,  $018C,  $018C,  $018C   ; 64ED   018C 018C 018C 018C
        DECLE   $01AD,  $01AD,  $01AD,  $01AD   ; 64F1   01AD 01AD 01AD 01AD
        DECLE   $01AD,  $018C,  $018C,  $018C   ; 64F5   01AD 018C 018C 018C
        DECLE   $018C,  $018C,  $018D,  $01AD   ; 64F9   018C 018C 018D 01AD
        DECLE   $01CE,  $0290,  $01AD,  $01AD   ; 64FD   01CE 0290 01AD 01AD
        DECLE   $018C,  $018C,  $018C,  $01AD   ; 6501   018C 018C 018C 01AD
        DECLE   $01AD,  $01AD,  $01AD,  $0235   ; 6505   01AD 01AD 01AD 0235

        MVI@    R2,     R0                      ; 6509   0290
        ANDR    R5,     R5                      ; 650A   01AD
        ANDR    R5,     R5                      ; 650B   01AD
        ANDR    R1,     R4                      ; 650C   018C
        ANDR    R5,     R5                      ; 650D   01AD
        ANDR    R5,     R5                      ; 650E   01AD
        ADDR    R0,     R7                      ; 650F   00C7

        DECLE   $01AD,  $01AD,  $01AD,  $0235   ; 6510   01AD 01AD 01AD 0235

        MVI@    R2,     R0                      ; 6514   0290
        ANDR    R5,     R5                      ; 6515   01AD
        ANDR    R5,     R5                      ; 6516   01AD
        ANDR    R5,     R5                      ; 6517   01AD
        ADDR    R0,     R7                      ; 6518   00C7

        DECLE   $0085,  $01AD,  $01AD,  $01AD   ; 6519   0085 01AD 01AD 01AD
        DECLE   $01F3,  $02D2,  $01AD,  $0129   ; 651D   01F3 02D2 01AD 0129
        DECLE   $01AD,  $0085,  $0043,  $01AD   ; 6521   01AD 0085 0043 01AD
        DECLE   $01AD,  $01F3,  $02D2,  $01AD   ; 6525   01AD 01F3 02D2 01AD
        DECLE   $01AD,  $0108,  $01AD,  $0043   ; 6529   01AD 0108 01AD 0043
        DECLE   $01AD,  $01AD,  $01F3,  $02D2   ; 652D   01AD 01AD 01F3 02D2
        DECLE   $01AD,  $01AD,  $0108,  $0109   ; 6531   01AD 01AD 0108 0109
        DECLE   $01AD,  $0001                   ; 6535   01AD 0001

        ANDR    R5,     R5                      ; 6537   01AD
        ANDR    R5,     R0                      ; 6538   01A8
        ADD@    R2,     R2                      ; 6539   02D2
        ANDR    R5,     R5                      ; 653A   01AD
        ANDR    R5,     R5                      ; 653B   01AD
        SUBR    R5,     R1                      ; 653C   0129
        SUBR    R5,     R1                      ; 653D   0129
        SUBR    R1,     R0                      ; 653E   0108
        ANDR    R5,     R5                      ; 653F   01AD
        ANDR    R5,     R5                      ; 6540   01AD
        ANDR    R5,     R5                      ; 6541   01AD
        SUBR    R1,     R0                      ; 6542   0108
        ANDR    R5,     R5                      ; 6543   01AD
        ANDR    R5,     R5                      ; 6544   01AD
        ANDR    R5,     R5                      ; 6545   01AD
        ANDR    R5,     R5                      ; 6546   01AD
        ANDR    R5,     R5                      ; 6547   01AD
        ANDR    R5,     R5                      ; 6548   01AD
        ANDR    R5,     R5                      ; 6549   01AD
        ANDR    R5,     R5                      ; 654A   01AD
        ANDR    R5,     R5                      ; 654B   01AD
        ANDR    R5,     R5                      ; 654C   01AD
L_654D:
        PSHR    R5                              ; 654D   0275
        MOVR    R1,     R3                      ; 654E   008B
        SLL     R1,     1                       ; 654F   0049
        SLL     R1,     2                       ; 6550   004D
        ADDI    #$034D, R1                      ; 6551   02F9 034D
        MOVR    R1,     R2                      ; 6553   008A
        SDBD                                    ; 6554   0001
        MVII    #$65CE, R1                      ; 6555   02B9 00CE 0065

        JSR     R5,     X_INIT_MOB              ; 6558   0004 0114 02B2

        MOVR    R3,     R1                      ; 655B   0099
        SLL     R1,     2                       ; 655C   004D
        SLL     R1,     2                       ; 655D   004D
        ADDI    #$031F, R1                      ; 655E   02F9 031F
        MVI@    R1,     R0                      ; 6560   0288
        ADDI    #$03FF, R0                      ; 6561   02F8 03FF
        ADDI    #$0002, R2                      ; 6563   02FA 0002
        MVO@    R0,     R2                      ; 6565   0250
        INCR    R1                              ; 6566   0009
        INCR    R2                              ; 6567   000A
        MVI@    R1,     R0                      ; 6568   0288
        SUBI    #$0100, R0                      ; 6569   0338 0100
        MVO@    R0,     R2                      ; 656B   0250
        MVI     G_0324, R4                      ; 656C   0284 0324
        MVI@    R4,     R1                      ; 656E   02A1
        MVII    #$003F, R0                      ; 656F   02B8 003F

        JSR     R5,     L_6629                  ; 6571   0004 0164 0229

        INCR    R2                              ; 6574   000A
        MVO@    R0,     R2                      ; 6575   0250
        INCR    R2                              ; 6576   000A
        CLRR    R0                              ; 6577   01C0
        MVO@    R0,     R2                      ; 6578   0250
        MVI@    R4,     R0                      ; 6579   02A0
        MVO     R4,     G_0324                  ; 657A   0244 0324
        ADDI    #$0002, R2                      ; 657C   02FA 0002
        MVO@    R0,     R2                      ; 657E   0250
        ANDI    #$001F, R0                      ; 657F   03B8 001F
        DECR    R2                              ; 6581   0012
        MVO@    R0,     R2                      ; 6582   0250

        JSR     R5,     L_65E3                  ; 6583   0004 0164 01E3

L_6586:
        PULR    R7                              ; 6586   02B7

        PSHR    R5                              ; 6587   0275
        ADDI    #$0007, R1                      ; 6588   02F9 0007
        MVI@    R1,     R2                      ; 658A   028A
        MVII    #$0100, R0                      ; 658B   02B8 0100
        MVO@    R0,     R1                      ; 658D   0248
        MOVR    R2,     R3                      ; 658E   0093
        SWAP    R2,     1                       ; 658F   0042
        ANDI    #$0003, R2                      ; 6590   03BA 0003
        BEQ     L_6586                          ; 6592   0224 000D

        ADDR    R7,     R2                      ; 6594   00FA
        ADD@    R2,     R7                      ; 6595   02D7

        CLRC                                    ; 6596   0006
        INCR    R4                              ; 6597   000C
        DIS                                     ; 6598   0003

        JSR     R5,     L_6638                  ; 6599   0004 0164 0238

        MVI     G_031B, R1                      ; 659C   0281 031B

        JSR     R5,     .EXEC.7AE               ; 659E   0004 0114 03AE

        PULR    R7                              ; 65A1   02B7

        JSR     R5,     L_65F4                  ; 65A2   0004 0164 01F4

        MVI     G_031B, R2                      ; 65A5   0282 031B
        MVI@    R2,     R0                      ; 65A7   0290
        XORI    #$0002, R0                      ; 65A8   03F8 0002
        MVO@    R0,     R2                      ; 65AA   0250
        ADDI    #$0004, R2                      ; 65AB   02FA 0004
        CLRR    R0                              ; 65AD   01C0
        MVO@    R0,     R2                      ; 65AE   0250
        INCR    R2                              ; 65AF   000A
        MVII    #$03E0, R0                      ; 65B0   02B8 03E0
        MVO@    R0,     R2                      ; 65B2   0250
        MVII    #$0012, R0                      ; 65B3   02B8 0012
        INCR    R2                              ; 65B5   000A
        MVO@    R0,     R2                      ; 65B6   0250
        PULR    R7                              ; 65B7   02B7

        SDBD                                    ; 65B8   0001
        MVII    #$1040, R0                      ; 65B9   02B8 0040 0010
        MVO@    R0,     R1                      ; 65BC   0248
        ADDI    #$0002, R1                      ; 65BD   02F9 0002
        MVI@    R1,     R0                      ; 65BF   0288
        ADDI    #$03FF, R0                      ; 65C0   02F8 03FF
        MVO@    R0,     R1                      ; 65C2   0248
        INCR    R1                              ; 65C3   0009
        MVI@    R1,     R0                      ; 65C4   0288
        ADDI    #$03FF, R0                      ; 65C5   02F8 03FF
        MVO@    R0,     R1                      ; 65C7   0248
        ADDI    #$0002, R1                      ; 65C8   02F9 0002
        MVII    #$0007, R0                      ; 65CA   02B8 0007
        MVO@    R0,     R1                      ; 65CC   0248
        MOVR    R5,     R7                      ; 65CD   00AF

        DECLE   $0040,  $0010,  $00DC,  $0065   ; 65CE   0040 0010 00DC 0065
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65D2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65D6   0000 0000 0000 0000
        DECLE   $0002,  $0000                   ; 65DA   0002 0000

        MVI@    R5,     R6                      ; 65DC   02AE
L_65DD:
        DECR    R7                              ; 65DD   0017
        MOVR    R0,     R7                      ; 65DE   0087

        DECLE   $0065,  $0008,  $0026,  $0000   ; 65DF   0065 0008 0026 0000
L_65E3:
        PSHR    R5                              ; 65E3   0275

        JSR     R5,     X_PLAY_SFX2             ; 65E4   0004 0118 03BE
        DECLE   $00B2                           ; 65E7  SFX prio
        DECLE   $0379,  $006C,  $0000,  $0035   ; 65E8   0379 006C 0000 0035
        DECLE   $00B7                           ; 65EC   00B7

        SUB@    R1,     R5                      ; 65ED   030D
        INCR    R3                              ; 65EE   000B
        MOVR    R1,     R7                      ; 65EF   008F

        DECLE   $0013,  $01CF                   ; 65F0   0013 01CF

        B       L_6613                          ; 65F2   0200 001F

L_65F4:
        PSHR    R5                              ; 65F4   0275

        JSR     R5,     X_PLAY_SFX2             ; 65F5   0004 0118 03BE
        DECLE   $00BC                           ; 65F8  SFX prio
        DECLE   $0079,  $00AC,  $0000,  $03B7   ; 65F9   0079 00AC 0000 03B7

        SUB@    R1,     R5                      ; 65FD   030D
        INCR    R3                              ; 65FE   000B
        MOVR    R1,     R7                      ; 65FF   008F

        DECLE   $003F,  $01CF                   ; 6600   003F 01CF

        B       L_6613                          ; 6602   0200 000F

L_6604:
        PSHR    R5                              ; 6604   0275

        JSR     R5,     X_PLAY_SFX2             ; 6605   0004 0118 03BE
        DECLE   $00C6                           ; 6608  SFX prio
        DECLE   $0079,  $020C,  $0000,  $03B7   ; 6609   0079 020C 0000 03B7

        XOR@    R5,     R5                      ; 660D   03ED
        INCR    R3                              ; 660E   000B
        MOVR    R1,     R7                      ; 660F   008F
        MOVR    R1,     R7                      ; 6610   008F

        DECLE   $01CF                           ; 6611   01CF

        INCR    R7                              ; 6612   000F

L_6613:
        PSHR    R5                              ; 6613   0275

L_6614:
        JSR     R5,     X_PLAY_SFX2             ; 6614   0004 0118 03BE
        DECLE   $008A                           ; 6617  SFX prio
        DECLE   $0369,  $0120,  $0200,  $03ED   ; 6618   0369 0120 0200 03ED
        DECLE   $0032,  $03EB,  $03CF           ; 661C   0032 03EB 03CF
L_661F:
        PSHR    R5                              ; 661F   0275

        JSR     R5,     X_PLAY_SFX2             ; 6620   0004 0118 03BE
        DECLE   $008A                           ; 6623  SFX prio

        XOR@    R5,     R5                      ; 6624   03ED
        MVI     G_03D2, R5                      ; 6625   0285 03D2
        XOR@    R5,     R3                      ; 6627   03EB
        ADD@    R1,     R7                      ; 6628   02CF

L_6629:
        PSHR    R5                              ; 6629   0275

        JSR     R5,     .EXEC.629               ; 662A   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 662D   0004 0114 0357

        PSHR    R1                              ; 6630   0271
        SLL     R1,     2                       ; 6631   004D
        SUB@    R6,     R1                      ; 6632   0331
        SAR     R1,     2                       ; 6633   006D
        PULR    R5                              ; 6634   02B5
        J       X_PACK_BYTES                    ; 6635   0004 0314 034F

L_6638:
        PSHR    R5                              ; 6638   0275
        SLR     R3,     2                       ; 6639   0067
        ANDI    #$0038, R3                      ; 663A   03BB 0038
        ADDI    #$031D, R3                      ; 663C   02FB 031D
        MOVR    R3,     R4                      ; 663E   009C
        SDBD                                    ; 663F   0001
        MVII    #$30C0, R0                      ; 6640   02B8 00C0 0030
        MVO@    R0,     R4                      ; 6643   0260
        SDBD                                    ; 6644   0001
        MVII    #$6664, R0                      ; 6645   02B8 0064 0066
        MVO@    R0,     R4                      ; 6648   0260
        INCR    R4                              ; 6649   000C
        MVI@    R4,     R0                      ; 664A   02A0
        DECR    R4                              ; 664B   0014
        SUBI    #$03FF, R0                      ; 664C   0338 03FF
        MVO@    R0,     R4                      ; 664E   0260
        CLRR    R0                              ; 664F   01C0
        MVO@    R0,     R4                      ; 6650   0260
        MVII    #$03F0, R0                      ; 6651   02B8 03F0
        MVO@    R0,     R4                      ; 6653   0260
        MVII    #$0013, R0                      ; 6654   02B8 0013
        MVO@    R0,     R4                      ; 6656   0260
        INCR    R4                              ; 6657   000C
        CMPI    #$033D, R4                      ; 6658   037C 033D
        BPL     L_6660                          ; 665A   0203 0004

        MOVR    R4,     R1                      ; 665C   00A1

        JSR     R5,     .EXEC.7AE               ; 665D   0004 0114 03AE
L_6660:
        JSR     R5,     L_6604                  ; 6660   0004 0164 0204

        PULR    R7                              ; 6663   02B7

        DECLE   $0100,  $0000,  $00B8,  $0065   ; 6664   0100 0000 00B8 0065
        DECLE   $0008,  $0028,  $0000,  $000D   ; 6668   0008 0028 0000 000D
        DECLE   $0211,  $000D,  $0207,  $0007   ; 666C   0211 000D 0207 0007
        DECLE   $0113,  $000D,  $03A7,  $0005   ; 6670   0113 000D 03A7 0005
        DECLE   $0207,  $000A,  $0113,  $0002   ; 6674   0207 000A 0113 0002
        DECLE   $0113,  $0009,  $020F,  $0008   ; 6678   0113 0009 020F 0008
        DECLE   $038F,  $0002,  $0213,  $000A   ; 667C   038F 0002 0213 000A
        DECLE   $0113,  $0002,  $0213,  $000A   ; 6680   0113 0002 0213 000A
        DECLE   $0213,  $0002,  $0353,  $0008   ; 6684   0213 0002 0353 0008
        DECLE   $0014,  $0000                   ; 6688   0014 0000

        ADCR    R0                              ; 668A   0028
        CMPR    R1,     R1                      ; 668B   0149
        DECR    R6                              ; 668C   0016
        SLL     R3,     2                       ; 668D   004F
        SETC                                    ; 668E   0007
        CMPR    R1,     R0                      ; 668F   0148
        COMR    R4                              ; 6690   001C
        SLL     R2,     2                       ; 6691   004E
        SETC                                    ; 6692   0007
        SLL     R1,     2                       ; 6693   004D
        NEGR    R4                              ; 6694   0024
        SUBR    R5,     R0                      ; 6695   0128
        GSWD    R3                              ; 6696   0033
        INCR    R6                              ; 6697   000E
        SUBR    R1,     R2                      ; 6698   010A
        SLL     R1,     2                       ; 6699   004D
        INCR    R1                              ; 669A   0009
        SARC    R1,     2                       ; 669B   007D
        DECR    R2                              ; 669C   0012
        SUBR    R0,     R7                      ; 669D   0107

        SETC                                    ; 669E   0007
        INCR    R4                              ; 669F   000C
        SUBR    R1,     R2                      ; 66A0   010A
        SUBR    R0,     R6                      ; 66A1   0106
        SUBR    R2,     R4                      ; 66A2   0114
        INCR    R5                              ; 66A3   000D
        INCR    R2                              ; 66A4   000A
        INCR    R6                              ; 66A5   000E
        SUBR    R1,     R0                      ; 66A6   0108
        SUBR    R0,     R5                      ; 66A7   0105
        DIS                                     ; 66A8   0003
        SUBR    R0,     R5                      ; 66A9   0105
        SUBR    R0,     R2                      ; 66AA   0102
        SKIP                                    ; 66AB   0208
        CLRC                                    ; 66AC   0006
        INCR    R7                              ; 66AD   000F

        INCR    R0                              ; 66AE   0008
L_66AF:
        COMR    R0                              ; 66AF   0018
        DECLE   $0015,  $000E,  $0008,  $004F   ; 66B0   0015 000E 0008 004F
        DECLE   $0008,  $0000,  $0005,  $0009   ; 66B4   0008 0000 0005 0009
        DECLE   $0007,  $0001,  $0007,  $000A   ; 66B8   0007 0001 0007 000A
        DECLE   $0007,  $0002,  $0007,  $0009   ; 66BC   0007 0002 0007 0009
        DECLE   $0110,  $0003,  $0129,  $0019   ; 66C0   0110 0003 0129 0019
        DECLE   $0028,  $0044,  $001A,  $0008   ; 66C4   0028 0044 001A 0008
        DECLE   $0126,  $0045,  $0005           ; 66C8   0126 0045 0005

        SWAP    R0,     2                       ; 66CB   0044

        JSR     R4,     .EXEC.409               ; 66CC   0004 0014 0009

        DECR    R3                              ; 66CF   0013
        INCR    R1                              ; 66D0   0009
        SETC                                    ; 66D1   0007
        SUBR    R1,     R2                      ; 66D2   010A
        EIS                                     ; 66D3   0002
        INCR    R2                              ; 66D4   000A
L_66D5:
        DECR    R7                              ; 66D5   0017

        DECR    R4                              ; 66D6   0014
        B       L_66E3                          ; 66D7   0200 000A

        SLL     R3,     2                       ; 66D9   004F
        SETC                                    ; 66DA   0007
        COMR    R0                              ; 66DB   0018
        DECR    R4                              ; 66DC   0014
        SLL     R2,     2                       ; 66DD   004E
        SETC                                    ; 66DE   0007
        SARC    R1,     2                       ; 66DF   007D
        INCR    R2                              ; 66E0   000A
        SLL     R2,     2                       ; 66E1   004E
        SETC                                    ; 66E2   0007
L_66E3:
        COMR    R1                              ; 66E3   0019
        DECLE   $0050,  $004F,  $0007,  $0100   ; 66E4   0050 004F 0007 0100
        DECLE   $0007,  $0101,  $0007,  $0102   ; 66E8   0007 0101 0007 0102
        DECLE   $0023,  $0103,  $0119,  $000A   ; 66EC   0023 0103 0119 000A
        DECLE   $000B,  $0102,  $001A,  $0009   ; 66F0   000B 0102 001A 0009
        DECLE   $0115,  $000A,  $0005,  $0103   ; 66F4   0115 000A 0005 0103
        DECLE   $0119,  $001B,  $001F,  $0102   ; 66F8   0119 001B 001F 0102
        DECLE   $0015,  $000A,  $0005           ; 66FC   0015 000A 0005

        INCR    R3                              ; 66FF   000B
        ANDR    R2,     R6                      ; 6700   0196
        SUBR    R0,     R1                      ; 6701   0101
        SUBR    R1,     R6                      ; 6702   010E
        SUBR    R0,     R2                      ; 6703   0102
        MOVR    R0,     R2                      ; 6704   0082
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6705   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6709   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 670D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6711   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6715   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6719   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 671D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6721   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6725   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6729   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 672D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6731   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6735   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6739   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 673D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6741   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6745   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6749   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 674D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6751   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6755   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6759   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 675D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6761   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6765   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6769   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 676D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6771   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6775   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6779   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 677D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6781   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6785   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6789   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 678D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6791   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6795   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6799   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 679D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67A1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67A5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67A9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67AD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67B1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67B5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67B9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67BD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67C1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67C5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67C9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67CD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67D1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67D5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67D9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67DD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67E1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67E5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67E9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67ED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67F1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67F5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67F9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67FD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6801   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6805   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6809   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 680D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6811   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6815   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6819   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 681D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6821   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6825   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6829   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 682D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6831   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6835   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6839   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 683D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6841   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6845   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6849   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 684D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6851   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6855   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6859   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 685D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6861   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6865   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6869   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 686D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6871   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6875   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6879   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 687D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6881   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6885   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6889   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 688D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6891   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6895   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6899   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 689D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68A1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68A5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68A9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68AD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68B1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68B5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68B9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68BD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68C1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68C5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68C9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68CD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68D1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68D5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68D9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68DD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68E1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68E5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68E9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68ED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68F1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68F5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68F9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68FD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6901   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6905   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6909   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 690D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6911   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6915   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6919   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 691D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6921   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6925   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6929   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 692D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6931   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6935   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6939   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 693D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6941   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6945   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6949   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 694D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6951   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6955   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6959   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 695D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6961   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6965   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6969   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 696D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6971   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6975   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6979   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 697D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6981   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6985   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6989   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 698D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6991   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6995   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6999   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 699D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69A1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69A5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69A9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69AD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69BD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69C1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69C5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69C9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69CD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69D1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69D5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69D9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69DD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69ED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69FD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ABD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ACD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ADD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ECD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB9   0000 0000 0000 0000
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
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5016       <entry>
;;  $5040       $504A  
;;  $505A       <entry>
;;  $505E       <entry>
;;  $5079       $5062   $508F  
;;  $5094       $501F   $5427   $5559   $5A29   $5A4C   $5A6E   $5A81   $5A8A  
;;  $5094       $5A93   $5AAE   $5ABB   $5D35   $609D  
;;  $5099       $5080  
;;  $50A3       $5095  
;;  $50A4       $50A2  
;;  $50B4       $50C2  
;;  $50C5       $50B8   $50BE  
;;  $50E5       $50E1  
;;  $50ED       $50E7  
;;  $50F3       $50C8  
;;  $50FC       $50F6  
;;  $5105       $50FE  
;;  $510A       $50D4   $50FA  
;;  $5126       $5126  
;;  $518E       $52FB  
;;  $51D6       $51D4  
;;  $5215       $5431   $5BAB   $60E6  
;;  $5218       $5234  
;;  $521D       $521A   $5238  
;;  $5236       $5232  
;;  $523A       $5450   $5BB9   $6124  
;;  $5240       $53ED  
;;  $5251       $5245  
;;  $5252       $60AA  
;;  $5254       $525A  
;;  $525F       $5449   $6114  
;;  $526D       $5285  
;;  $526F       $527E  
;;  $5280       $5272  
;;  $5288       $5017  
;;  $5293       $5291  
;;  $52B3       $52B1  
;;  $52D3       $52D1  
;;  $5324       $5289  
;;  $5336       <entry>
;;  $533A       $5378  
;;  $5348       $533D  
;;  $5349       $5347  
;;  $534C       $533F  
;;  $5363       $535F  
;;  $536A       $5365  
;;  $5374       $534A  
;;  $537E       $5352  
;;  $5382       $53AB   $54E8   $5AD8   $60DC  
;;  $5383       $5390  
;;  $5393       $5386   $538B  
;;  $539E       $541B   $5B70  
;;  $53A3       $53B2  
;;  $53F4       $5091  
;;  $54D1       $54D5  
;;  $564F       $564D  
;;  $56A3       $5822  
;;  $56CC       $56CC  
;;  $576F       $5924  
;;  $5783       $59C3  
;;  $578F       $5A06  
;;  $57A9       $57A7  
;;  $57B5       $57D8  
;;  $57EA       $57E4  
;;  $57F4       $57F0  
;;  $583B       $587F  
;;  $5846       $5837   $5851  
;;  $5848       $5887  
;;  $585B       $587B  
;;  $586D       $5867  
;;  $5878       $5870   $5873  
;;  $58A5       $589D  
;;  $58A6       $58A4  
;;  $58C1       $58BE  
;;  $58C6       $588E   $5897   $58ED   $58F1   $58FA  
;;  $58D8       $58CE  
;;  $58DC       $58D0   $58D6  
;;  $5936       $5927  
;;  $593A       $5947  
;;  $593D       $5944  
;;  $5964       $5968  
;;  $596B       $5537   $58FC  
;;  $5981       $598D  
;;  $5987       $5983  
;;  $5988       $5986  
;;  $5990       $53F0  
;;  $5999       $5995   $59BF  
;;  $59A9       $59A5  
;;  $59AD       $59A3  
;;  $59AE       $59AC  
;;  $59B9       $59B5  
;;  $5A09       $5A04  
;;  $5A0F       $59FF  
;;  $5A10       $5AC7  
;;  $5A1D       $5A0D  
;;  $5A41       $541E   $5A79   $5ADB  
;;  $5A49       $551F   $5AC2  
;;  $5A62       $54ED   $54FC   $550D   $5524   $553F   $5B81   $5C28   $5C69  
;;  $5A62       $6144   $6155   $6165   $617D   $618E  
;;  $5A71       $5422   $551A   $5534  
;;  $5A99       $5A9C  
;;  $5B02       $5AF7  
;;  $5C4E       $5BA5   $5C4A  
;;  $5C7D       $5C79  
;;  $5C82       $5D06  
;;  $5C97       $5C84  
;;  $5CE7       $5CE3  
;;  $5CF0       $5BFF   $5C1D   $5C5D   $5C8B   $5CA8   $5CB2   $5CCC  
;;  $5CFC       $5D01  
;;  $5D10       $5D13  
;;  $5F84       $5C93   $5CD4   $5CED   $5FE3  
;;  $5F98       $5F85  
;;  $5F9C       $5FA3  
;;  $5FB9       $5FB5  
;;  $5FC8       $5FE0  
;;  $5FE6       $5FCD  
;;  $5FF8       $5CDE  
;;  $6000       $6009  
;;  $602B       $5C09  
;;  $6049       $5C5A   $5CA1  
;;  $6050       $5C12  
;;  $60AA       $6090   $6096  
;;  $60FF       $5ECD  
;;  $6124       $60B1  
;;  $6208       $61F2  
;;  $622A       $6221  
;;  $62D6       $62D4  
;;  $62DC       $62DA   $62DC  
;;  $62DD       $62DD  
;;  $6305       $6303  
;;  $6327       $6325  
;;  $64A0       $6234  
;;  $64BB       $64B4  
;;  $64CE       $64C9  
;;  $654D       $6226  
;;  $6586       $6592  
;;  $65DD       $65DD  
;;  $65E3       $6583  
;;  $65F4       $65A2  
;;  $6604       $6660  
;;  $6613       $6121   $65F2   $6602  
;;  $6614       $6612  
;;  $661F       $61B1  
;;  $6629       $623F   $6571  
;;  $6638       $6599  
;;  $6660       $665A  
;;  $66AF       $66AD  
;;  $66D5       $66D5  
;;  $66E3       $66D7  
;; ======================================================================== ;;
