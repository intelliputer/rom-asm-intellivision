
        ORG     $5000
.HEADER:
        BIDECLE $B801           ; 5000  Ptr: MOB graphic images
        BIDECLE $4B33           ; 5002  Ptr: EXEC timer table
        DECLE   $0240,  $0100   ; 5004  Ptr: Start of game
        BIDECLE $4040           ; 5006  Ptr: Backgnd gfx list
        DECLE   $0101,  $02BE   ; 5008  Ptr: GRAM init sequence
        DECLE   $02F0,  $0004   ; 500A  Ptr: Date/Title
        DECLE   $014C           ; 500C  Key-click / flags
        DECLE   $03AA           ; 500D  Border extension
        DECLE   $02BC           ; 500E  Color Stack / FGBG
        DECLE   $031B,  $02B8   ; 500F  Color Stack init (0, 1)
        DECLE   $0047,  $0004   ; 5011  Color Stack init (2, 3)
        DECLE   $0114           ; 5013  Border color init


        SUBI    #$02BC, R0                      ; 5014   0338 02BC
        SUBR    R0,     R2                      ; 5016   0102
        MVII    #$00EE, R0                      ; 5017   02B8 00EE

        JSR     R5,     X_FILL_ZERO             ; 5019   0004 0114 0338
        DECLE   $0001,  $02B8,  $00B1,  $004F   ; 501C   0001 02B8 00B1 004F
        DECLE   $0240,  $035D,  $02B8,  $0002   ; 5020   0240 035D 02B8 0002
        DECLE   $0240,  $0115,  $0240,  $010B   ; 5024   0240 0115 0240 010B
        DECLE   $0240,  $0118,  $0001,  $02B8   ; 5028   0240 0118 0001 02B8
        DECLE   $00FF,  $00FF,  $0240,  $035E   ; 502C   00FF 00FF 0240 035E
        DECLE   $02BA,  $0008,  $0042,  $02B9   ; 5030   02BA 0008 0042 02B9
        DECLE   $0008,  $0001,  $02BC,  $00BF   ; 5034   0008 0001 02BC 00BF
        DECLE   $004D,  $02BD,  $032B,  $02A0   ; 5038   004D 02BD 032B 02A0
        DECLE   $01D0,  $0268,  $0011,  $022C   ; 503C   01D0 0268 0011 022C
        DECLE   $0005,  $0002,  $0280,  $0118   ; 5040   0005 0002 0280 0118
        DECLE   $0080,  $022C,  $0004,  $0004   ; 5044   0080 022C 0004 0004

        CMPR    R1,     R4                      ; 5048   014C
        SUB     .BTAB.80,R2                     ; 5049   0302 0280
        SUBR    R2,     R7                      ; 504B   0117

        TSTR    R0                              ; 504C   0080
        BNEQ    L_507C                          ; 504D   020C 002D

        MVII    #$0003, R0                      ; 504F   02B8 0003
        MVO     R0,     G_0117                  ; 5051   0240 0117
        SDBD                                    ; 5053   0001
        MVII    #$4DDF, R4                      ; 5054   02BC 00DF 004D
        MVII    #$016D, R3                      ; 5057   02BB 016D
L_5059:
        MVI@    R3,     R0                      ; 5059   0298

        JSR     R5,     X_EXT_SIGN_LO           ; 505A   0004 0114 0268

        TSTR    R0                              ; 505D   0080
        BMI     L_5075                          ; 505E   020B 0015
        BEQ     L_506F                          ; 5060   0204 000D

        DECR    R0                              ; 5062   0010
        BNEQ    L_5074                          ; 5063   020C 000F

        PSHR    R4                              ; 5065   0274
        PSHR    R3                              ; 5066   0273
        SDBD                                    ; 5067   0001
        MVII    #$486D, R5                      ; 5068   02BD 006D 0048
        SDBD                                    ; 506B   0001
        MVI@    R4,     R7                      ; 506C   02A7

        PULR    R3                              ; 506D   02B3
        PULR    R4                              ; 506E   02B4
L_506F:
        ADDI    #$0002, R4                      ; 506F   02FC 0002
        MVI@    R4,     R0                      ; 5071   02A0
        SUBI    #$0003, R4                      ; 5072   033C 0003
L_5074:
        MVO@    R0,     R3                      ; 5074   0258
L_5075:
        INCR    R3                              ; 5075   000B
        ADDI    #$0003, R4                      ; 5076   02FC 0003
        CMPI    #$0171, R3                      ; 5078   037B 0171
        BLT     L_5059                          ; 507A   0225 0022

L_507C:
        MVI     G_017F, R0                      ; 507C   0280 017F
        DECLE   $0080,  $020C,  $0024           ; 507E   0080 020C 0024

        CLRR    R1                              ; 5081   01C9
        DIS                                     ; 5082   0003
        MVI     G_0116, R2                      ; 5083   0282 0116
        MVO     R1,     G_0116                  ; 5085   0241 0116
        EIS                                     ; 5087   0002
        MVII    #$0333, R3                      ; 5088   02BB 0333
        RRC     R2,     1                       ; 508A   0072
        BNC     L_509D                          ; 508B   0209 0010

        MVI@    R3,     R4                      ; 508D   029C
        TSTR    R4                              ; 508E   00A4
        BEQ     L_509D                          ; 508F   0204 000C

        SDBD                                    ; 5091   0001
        MVII    #$489B, R5                      ; 5092   02BD 009B 0048
        PSHR    R2                              ; 5095   0272
        PSHR    R3                              ; 5096   0273
        SUBI    #$0333, R3                      ; 5097   033B 0333
        SDBD                                    ; 5099   0001
        MVI@    R4,     R7                      ; 509A   02A7

        PULR    R3                              ; 509B   02B3
        PULR    R2                              ; 509C   02B2
L_509D:
        INCR    R3                              ; 509D   000B
        DECLE   $037B,  $033A,  $0226,  $0017   ; 509E   037B 033A 0226 0017
        DECLE   $0004,  $0148,  $00B0,  $0004   ; 50A2   0004 0148 00B0 0004

        CMPR    R1,     R0                      ; 50A6   0148
        SUBR    R0,     R5                      ; 50A7   0105

        JSR     R5,     .EXEC.4F1               ; 50A8   0004 0114 00F1
        DECLE   $0004,  $014C,  $00C0,  $0220   ; 50AB   0004 014C 00C0 0220
        DECLE   $0065                           ; 50AF   0065

        PSHR    R5                              ; 50B0   0275
        MVII    #$0353, R3                      ; 50B1   02BB 0353
        MVII    #$031B, R2                      ; 50B3   02BA 031B
L_50B5:
        CLRR    R5                              ; 50B5   01ED
        MVI@    R2,     R0                      ; 50B6   0290
        ANDI    #$0100, R0                      ; 50B7   03B8 0100
        BNEQ    L_50BC                          ; 50B9   020C 0001

        INCR    R5                              ; 50BB   000D
L_50BC:
        ADDI    #$0018, R2                      ; 50BC   02FA 0018
        MVI@    R2,     R4                      ; 50BE   0294
        TSTR    R4                              ; 50BF   00A4
        BNEQ    L_50C3                          ; 50C0   020C 0001

        INCR    R5                              ; 50C2   000D
L_50C3:
        CLRR    R1                              ; 50C3   01C9
        MVII    #$03FF, R0                      ; 50C4   02B8 03FF
        DIS                                     ; 50C6   0003
        AND@    R3,     R0                      ; 50C7   0398
        MVO@    R1,     R3                      ; 50C8   0259
        EIS                                     ; 50C9   0002
        TSTR    R5                              ; 50CA   00AD
        BNEQ    L_50FD                          ; 50CB   020C 0030

        ADDI    #$0005, R4                      ; 50CD   02FC 0005
        MVI@    R4,     R1                      ; 50CF   02A1
        ANDR    R1,     R0                      ; 50D0   0188
        BEQ     L_50FD                          ; 50D1   0204 002A

        MVII    #$000A, R5                      ; 50D3   02BD 000A
L_50D5:
        SARC    R0,     1                       ; 50D5   0078
        BNC     L_50F5                          ; 50D6   0209 001D

        SLR     R1,     1                       ; 50D8   0061
        PSHR    R5                              ; 50D9   0275
        PSHR    R3                              ; 50DA   0273
        PSHR    R2                              ; 50DB   0272
        NOP                                     ; 50DC   0034
        PSHR    R1                              ; 50DD   0271
        PSHR    R0                              ; 50DE   0270
        SUBI    #$0333, R2                      ; 50DF   033A 0333
        NEGR    R5                              ; 50E1   0025
        MOVR    R5,     R1                      ; 50E2   00A9
        ADDI    #$000A, R1                      ; 50E3   02F9 000A
        SDBD                                    ; 50E5   0001
        MVII    #$48ED, R5                      ; 50E6   02BD 00ED 0048
        SDBD                                    ; 50E9   0001
        MVI@    R4,     R0                      ; 50EA   02A0
        PSHR    R4                              ; 50EB   0274
        MOVR    R0,     R7                      ; 50EC   0087

        PULR    R4                              ; 50ED   02B4
        PULR    R0                              ; 50EE   02B0
        PULR    R1                              ; 50EF   02B1
        PULR    R2                              ; 50F0   02B2
        PULR    R3                              ; 50F1   02B3
        PULR    R5                              ; 50F2   02B5
        B       L_50FA                          ; 50F3   0200 0005

L_50F5:
        SARC    R1,     1                       ; 50F5   0079
        BNC     L_50FA                          ; 50F6   0209 0002

        ADDI    #$0002, R4                      ; 50F8   02FC 0002
L_50FA:
        DECR    R5                              ; 50FA   0015
        BNEQ    L_50D5                          ; 50FB   022C 0027

L_50FD:
        SUBI    #$0017, R2                      ; 50FD   033A 0017
        INCR    R3                              ; 50FF   000B
        CMPI    #$035B, R3                      ; 5100   037B 035B
        BLT     L_50B5                          ; 5102   0225 004E
        PULR    R7                              ; 5104   02B7

        DECLE   $0275,  $0280,  $0119,  $0070   ; 5105   0275 0280 0119 0070
        DECLE   $0201,  $000E,  $0007,  $0050   ; 5109   0201 000E 0007 0050
        DECLE   $0240,  $0119,  $02BA,  $033B   ; 510D   0240 0119 02BA 033B
        DECLE   $02BC,  $0333,  $02B9,  $0004   ; 5111   02BC 0333 02B9 0004
        DECLE   $02B8,  $0008,  $0200,  $0012   ; 5115   02B8 0008 0200 0012
        DECLE   $0070,  $0201,  $0012,  $02B8   ; 5119   0070 0201 0012 02B8
        DECLE   $0003,  $0240,  $0119,  $02BA   ; 511D   0003 0240 0119 02BA
        DECLE   $034B,  $02BC,  $015D,  $02B9   ; 5121   034B 02BC 015D 02B9
        DECLE   $0002,  $02B8,  $0008,  $0080   ; 5125   0002 02B8 0008 0080
        DECLE   $0204,  $0003,  $0004           ; 5129   0204 0003 0004

        CMPR    R1,     R0                      ; 512C   0148
        SUBR    R5,     R7                      ; 512D   012F
        PULR    R7                              ; 512E   02B7

        PSHR    R5                              ; 512F   0275
L_5130:
        MVI@    R2,     R3                      ; 5130   0293
        DECLE   $0272,  $037A,  $034B,  $020D   ; 5131   0272 037A 034B 020D
        DECLE   $0001,  $000F,  $0001,  $02A2   ; 5135   0001 000F 0001 02A2
        DECLE   $0092,  $0204,  $0009,  $00CA   ; 5139   0092 0204 0009 00CA
        DECLE   $0292,  $0270,  $0271,  $0004   ; 513D   0292 0270 0271 0004

        CMPR    R1,     R0                      ; 5141   0148
        CMPR    R1,     R4                      ; 5142   014C
        PULR    R1                              ; 5143   02B1
        PULR    R0                              ; 5144   02B0
        PULR    R2                              ; 5145   02B2
        MVO@    R3,     R2                      ; 5146   0253
        INCR    R2                              ; 5147   000A
        DECR    R0                              ; 5148   0010
        BNEQ    L_5130                          ; 5149   022C 001A
        PULR    R7                              ; 514B   02B7

        PSHR    R5                              ; 514C   0275
        MOVR    R3,     R1                      ; 514D   0099
        ANDI    #$000F, R1                      ; 514E   03B9 000F
        MOVR    R3,     R0                      ; 5150   0098
        SWAP    R0,     1                       ; 5151   0040
        ANDI    #$003E, R0                      ; 5152   03B8 003E
        SLR     R0,     1                       ; 5154   0060
        TSTR    R0                              ; 5155   0080
        BEQ     L_5169                          ; 5156   0204 0011

        DECR    R0                              ; 5158   0010
        BNEQ    L_516E                          ; 5159   020C 0013

        TSTR    R3                              ; 515B   009B
        BPL     L_5160                          ; 515C   0203 0002

        DECR    R1                              ; 515E   0011
        INCR    R7                              ; 515F   000F

L_5160:
        INCR    R1                              ; 5160   0009
L_5161:
        TSTR    R1                              ; 5161   0089
        BMI     L_5168                          ; 5162   020B 0004

        CMPR    R2,     R1                      ; 5164   0151
        BLT     L_5169                          ; 5165   0205 0002

        CLRR    R2                              ; 5167   01D2
L_5168:
        MOVR    R2,     R1                      ; 5168   0091
L_5169:
        MOVR    R3,     R0                      ; 5169   0098
        ANDI    #$01F0, R0                      ; 516A   03B8 01F0
        SLR     R0,     2                       ; 516C   0064
        SLR     R0,     2                       ; 516D   0064
L_516E:
        SDBD                                    ; 516E   0001
        ANDI    #$81F0, R3                      ; 516F   03BB 00F0 0081
        SWAP    R0,     1                       ; 5172   0040
        SLL     R0,     1                       ; 5173   0048
        XORR    R0,     R3                      ; 5174   01C3
        XORR    R1,     R3                      ; 5175   01CB
        PULR    R7                              ; 5176   02B7

        PSHR    R5                              ; 5177   0275
        MVI     G_010C, R0                      ; 5178   0280 010C
        TSTR    R0                              ; 517A   0080
        BEQ     L_5180                          ; 517B   0204 0003

        MVO     R0,     .STIC.VIDEN             ; 517D   0240 0020
        PULR    R7                              ; 517F   02B7

L_5180:
        MVO     R0,     .STIC.VIDEN             ; 5180   0240 0020
        DECLE   $0008,  $0240,  $010C,  $0004   ; 5182   0008 0240 010C 0004

        CMPR    R1,     R0                      ; 5186   0148
        SUB@    R2,     R5                      ; 5187   0315
        MVI     G_017E, R0                      ; 5188   0280 017E
        MVO     R0,     .STIC.EDGE              ; 518A   0240 0032
        MVI     G_017F, R0                      ; 518C   0280 017F
        TSTR    R0                              ; 518E   0080
        BNEQ    L_51A6                          ; 518F   020C 0015

L_5191:
        MVII    #$0353, R3                      ; 5191   02BB 0353
        MVII    #$0018, R2                      ; 5193   02BA 0018
        CLRR    R5                              ; 5195   01ED
        MVII    #$0008, R4                      ; 5196   02BC 0008
L_5198:
        MVI@    R2,     R0                      ; 5198   0290
        MVO@    R5,     R2                      ; 5199   0255
        MVI@    R3,     R1                      ; 519A   0299
        COMR    R0                              ; 519B   0018
        COMR    R1                              ; 519C   0019
        ANDR    R0,     R1                      ; 519D   0181
        COMR    R0                              ; 519E   0018
        COMR    R1                              ; 519F   0019
        MVO@    R1,     R3                      ; 51A0   0259
        INCR    R2                              ; 51A1   000A
        INCR    R3                              ; 51A2   000B
        DECR    R4                              ; 51A3   0014
        BNEQ    L_5198                          ; 51A4   022C 000D

L_51A6:
        MVI     G_0103, R0                      ; 51A6   0280 0103
        MVO     R0,     .STIC.HDLY              ; 51A8   0240 0030
        MVI     G_0107, R0                      ; 51AA   0280 0107
        MVO     R0,     .STIC.VDLY              ; 51AC   0240 0031
        MVI     G_010D, R2                      ; 51AE   0282 010D
        SLL     R2,     1                       ; 51B0   004A
        MVII    #$033B, R4                      ; 51B1   02BC 033B
        MVII    #$0333, R5                      ; 51B3   02BD 0333
        ADDR    R2,     R4                      ; 51B5   00D4
        ADDR    R2,     R5                      ; 51B6   00D5
L_51B7:
        MVI@    R4,     R3                      ; 51B7   02A3
        ANDI    #$000F, R3                      ; 51B8   03BB 000F
        PSHR    R4                              ; 51BA   0274
        MVI@    R5,     R4                      ; 51BB   02AC
        TSTR    R4                              ; 51BC   00A4
        BEQ     L_5210                          ; 51BD   0204 0051

        PSHR    R5                              ; 51BF   0275
        MVII    #$031B, R1                      ; 51C0   02B9 031B
        ADDR    R2,     R1                      ; 51C2   00D1
        MVI@    R1,     R0                      ; 51C3   0288
        PSHR    R1                              ; 51C4   0271
        MOVR    R0,     R1                      ; 51C5   0081
        SDBD                                    ; 51C6   0001
        ANDI    #$FDFF, R0                      ; 51C7   03B8 00FF 00FD
        SDBD                                    ; 51CA   0001
        ANDI    #$0800, R1                      ; 51CB   03B9 0000 0008
        SLR     R1,     2                       ; 51CE   0065
        XORR    R1,     R0                      ; 51CF   01C8
        PULR    R1                              ; 51D0   02B1
        MVO@    R0,     R1                      ; 51D1   0248
        ADDI    #$0002, R4                      ; 51D2   02FC 0002
        SDBD                                    ; 51D4   0001
        MVII    #$4DBF, R5                      ; 51D5   02BD 00BF 004D
        ADDR    R2,     R5                      ; 51D8   00D5
        MVI@    R5,     R5                      ; 51D9   02AD
        SDBD                                    ; 51DA   0001
        ADDI    #$3800, R5                      ; 51DB   02FD 0000 0038
        MVII    #$0323, R1                      ; 51DE   02B9 0323
        ADDR    R2,     R1                      ; 51E0   00D1
        MVI@    R1,     R0                      ; 51E1   0288
        SLL     R3,     2                       ; 51E2   004F
        SLL     R3,     1                       ; 51E3   004B
        SDBD                                    ; 51E4   0001
        MVI@    R4,     R1                      ; 51E5   02A1
        MOVR    R1,     R4                      ; 51E6   008C
        ANDI    #$0080, R0                      ; 51E7   03B8 0080
        BEQ     L_51FE                          ; 51E9   0204 0013

        SLL     R3,     1                       ; 51EB   004B
        ADDR    R3,     R4                      ; 51EC   00DC
        MVI@    R4,     R0                      ; 51ED   02A0
        MVO@    R0,     R5                      ; 51EE   0268
        MVI@    R4,     R0                      ; 51EF   02A0
        MVO@    R0,     R5                      ; 51F0   0268
        MVI@    R4,     R0                      ; 51F1   02A0
        MVO@    R0,     R5                      ; 51F2   0268
        MVI@    R4,     R0                      ; 51F3   02A0
        MVO@    R0,     R5                      ; 51F4   0268
        MVI@    R4,     R0                      ; 51F5   02A0
        MVO@    R0,     R5                      ; 51F6   0268
        MVI@    R4,     R0                      ; 51F7   02A0
        MVO@    R0,     R5                      ; 51F8   0268
        MVI@    R4,     R0                      ; 51F9   02A0
        MVO@    R0,     R5                      ; 51FA   0268
        MVI@    R4,     R0                      ; 51FB   02A0
        MVO@    R0,     R5                      ; 51FC   0268
        INCR    R7                              ; 51FD   000F

L_51FE:
        ADDR    R3,     R4                      ; 51FE   00DC
L_51FF:
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
        PULR    R5                              ; 520F   02B5
L_5210:
        PULR    R4                              ; 5210   02B4
        INCR    R2                              ; 5211   000A
        MOVR    R2,     R0                      ; 5212   0090
        SARC    R0,     1                       ; 5213   0078
        BC      L_51B7                          ; 5214   0221 005E

        MVI     G_010D, R2                      ; 5216   0282 010D
        SLL     R2,     1                       ; 5218   004A
        MVII    #$034B, R4                      ; 5219   02BC 034B
        MVII    #$015D, R5                      ; 521B   02BD 015D
        ADDR    R2,     R4                      ; 521D   00D4
        SLL     R2,     1                       ; 521E   004A
        ADDR    R2,     R5                      ; 521F   00D5
        SLR     R2,     1                       ; 5220   0062
L_5221:
        MOVR    R2,     R1                      ; 5221   0091
        INCR    R1                              ; 5222   0009
L_5223:
        CMPI    #$0008, R1                      ; 5223   0379 0008
        BGT     L_5252                          ; 5225   020E 002B

        MVI@    R4,     R3                      ; 5227   02A3
        PSHR    R4                              ; 5228   0274
        SDBD                                    ; 5229   0001
        MVI@    R5,     R4                      ; 522A   02AC
        PSHR    R5                              ; 522B   0275
        ANDI    #$000F, R3                      ; 522C   03BB 000F
        SLL     R3,     2                       ; 522E   004F
        SLL     R3,     1                       ; 522F   004B
        SDBD                                    ; 5230   0001
        ADD@    R4,     R3                      ; 5231   02E3
        MOVR    R3,     R4                      ; 5232   009C
        MOVR    R2,     R1                      ; 5233   0091
        SLL     R1,     2                       ; 5234   004D
        SLL     R1,     1                       ; 5235   0049
        SDBD                                    ; 5236   0001
        ADDI    #$3800, R1                      ; 5237   02F9 0000 0038
        MOVR    R1,     R5                      ; 523A   008D
        MVI@    R4,     R0                      ; 523B   02A0
        MVO@    R0,     R5                      ; 523C   0268
        MVI@    R4,     R0                      ; 523D   02A0
        MVO@    R0,     R5                      ; 523E   0268
        MVI@    R4,     R0                      ; 523F   02A0
        MVO@    R0,     R5                      ; 5240   0268
        MVI@    R4,     R0                      ; 5241   02A0
        MVO@    R0,     R5                      ; 5242   0268
        MVI@    R4,     R0                      ; 5243   02A0
        MVO@    R0,     R5                      ; 5244   0268
        MVI@    R4,     R0                      ; 5245   02A0
        MVO@    R0,     R5                      ; 5246   0268
        MVI@    R4,     R0                      ; 5247   02A0
        MVO@    R0,     R5                      ; 5248   0268
        MVI@    R4,     R0                      ; 5249   02A0
        MVO@    R0,     R5                      ; 524A   0268
        PULR    R5                              ; 524B   02B5
        PULR    R4                              ; 524C   02B4
        INCR    R2                              ; 524D   000A
        MOVR    R2,     R0                      ; 524E   0090
        SARC    R0,     1                       ; 524F   0078
        BC      L_5221                          ; 5250   0221 0030

L_5252:
        MVI     G_017F, R0                      ; 5252   0280 017F
        DECLE   $0080,  $020C,  $003A,  $0004   ; 5254   0080 020C 003A 0004

        CMPR    R1,     R0                      ; 5258   0148
        AND@    R1,     R2                      ; 5259   038A
        CLRR    R2                              ; 525A   01D2
        MVI     G_010D, R1                      ; 525B   0281 010D
        RRC     R1,     1                       ; 525D   0071
        BC      L_5266                          ; 525E   0201 0006

        MVI     G_0106, R0                      ; 5260   0280 0106

        JSR     R5,     X_EXT_SIGN_LO           ; 5262   0004 0114 0268

        MOVR    R0,     R2                      ; 5265   0082
L_5266:
        MVII    #$00FF, R0                      ; 5266   02B8 00FF
        DECLE   $02BB,  $031B,  $02BC,  $0125   ; 5268   02BB 031B 02BC 0125
        DECLE   $0004                           ; 526C   0004

        CMPR    R1,     R0                      ; 526D   0148
        ADD@    R5,     R2                      ; 526E   02EA
        CLRR    R2                              ; 526F   01D2
        MVI     G_010D, R1                      ; 5270   0281 010D
        RRC     R1,     1                       ; 5272   0071
        BNC     L_527B                          ; 5273   0209 0006

        MVI     G_010A, R0                      ; 5275   0280 010A

        JSR     R5,     X_EXT_SIGN_LO           ; 5277   0004 0114 0268

        MOVR    R0,     R2                      ; 527A   0082
L_527B:
        MVII    #$007F, R0                      ; 527B   02B8 007F
        DECLE   $02BB,  $0323,  $02BC,  $0135   ; 527D   02BB 0323 02BC 0135
        DECLE   $0004,  $0148,  $02EA,  $02BC   ; 5281   0004 0148 02EA 02BC
        DECLE   $0100,  $0001,  $02A0,  $0001   ; 5285   0100 0001 02A0 0001
        DECLE   $0378,  $00CC,  $004B,  $020C   ; 5289   0378 00CC 004B 020C
        DECLE   $0003,  $0004                   ; 528D   0003 0004

        CMPR    R1,     R4                      ; 528F   014C
        DECR    R1                              ; 5290   0011
        MVII    #$0145, R3                      ; 5291   02BB 0145
        MVII    #$0003, R1                      ; 5293   02B9 0003
L_5295:
        MVI@    R3,     R0                      ; 5295   0298
        TSTR    R0                              ; 5296   0080
        BEQ     L_529B                          ; 5297   0204 0002

        DECR    R0                              ; 5299   0010
        MVO@    R0,     R3                      ; 529A   0258
L_529B:
        INCR    R3                              ; 529B   000B
        DECR    R1                              ; 529C   0011
        BNEQ    L_5295                          ; 529D   022C 0009

        MVI     G_019D, R0                      ; 529F   0280 019D
        TSTR    R0                              ; 52A1   0080
        BEQ     L_52AD                          ; 52A2   0204 0009

        DECR    R0                              ; 52A4   0010
        MVO     R0,     G_019D                  ; 52A5   0240 019D
        MVI     .PSG0.chn_a_lo,R0               ; 52A7   0280 01F0
        SUB     G_019E, R0                      ; 52A9   0300 019E
        MVO     R0,     .PSG0.chn_a_lo          ; 52AB   0240 01F0
L_52AD:
        MVI     G_017F, R0                      ; 52AD   0280 017F
        TSTR    R0                              ; 52AF   0080
        BNEQ    L_52CF                          ; 52B0   020C 001D

        CLRR    R1                              ; 52B2   01C9
        MVII    #$0343, R3                      ; 52B3   02BB 0343
L_52B5:
        CLRC                                    ; 52B5   0006
        MVI@    R3,     R0                      ; 52B6   0298
        TSTR    R0                              ; 52B7   0080
        BEQ     L_52BE                          ; 52B8   0204 0004

        DECR    R0                              ; 52BA   0010
        BNEQ    L_52BE                          ; 52BB   020C 0001

        SETC                                    ; 52BD   0007
L_52BE:
        RRC     R1,     1                       ; 52BE   0071
        MVO@    R0,     R3                      ; 52BF   0258
        INCR    R3                              ; 52C0   000B
        CMPI    #$034A, R3                      ; 52C1   037B 034A
        BLE     L_52B5                          ; 52C3   0226 000F

        SWAP    R1,     1                       ; 52C5   0041
        MVI     G_0116, R0                      ; 52C6   0280 0116
        COMR    R0                              ; 52C8   0018
        COMR    R1                              ; 52C9   0019
        ANDR    R0,     R1                      ; 52CA   0181
L_52CB:
        COMR    R0                              ; 52CB   0018
        COMR    R1                              ; 52CC   0019
        MVO     R1,     G_0116                  ; 52CD   0241 0116
L_52CF:
        MVI     G_0117, R0                      ; 52CF   0280 0117
        TSTR    R0                              ; 52D1   0080
        BEQ     L_52DB                          ; 52D2   0204 0007

        AND     G_0119, R0                      ; 52D4   0380 0119
        MVO     R0,     G_0119                  ; 52D6   0240 0119
        DECR    R0                              ; 52D8   0010
        MVO     R0,     G_0117                  ; 52D9   0240 0117
L_52DB:
        MVII    #$00FF, R0                      ; 52DB   02B8 00FF
        MVO     R0,     G_011D                  ; 52DD   0240 011D
L_52DF:
        MVI     G_010D, R0                      ; 52DF   0280 010D
        INCR    R0                              ; 52E1   0008
        ANDI    #$0003, R0                      ; 52E2   03B8 0003
        MVO     R0,     G_010D                  ; 52E4   0240 010D
        CLRR    R0                              ; 52E6   01C0
        MVO     R0,     G_010C                  ; 52E7   0240 010C
        PULR    R7                              ; 52E9   02B7

        PSHR    R5                              ; 52EA   0275
        MVII    #$0008, R5                      ; 52EB   02BD 0008
L_52ED:
        PSHR    R5                              ; 52ED   0275
        MVI@    R3,     R1                      ; 52EE   0299
        PSHR    R2                              ; 52EF   0272
        ANDR    R0,     R1                      ; 52F0   0181
        PSHR    R0                              ; 52F1   0270
        SWAP    R1,     1                       ; 52F2   0041
        PSHR    R4                              ; 52F3   0274
        XOR@    R4,     R1                      ; 52F4   03E1
        MVI@    R4,     R0                      ; 52F5   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 52F6   0004 0114 0268
        DECLE   $0282,  $0115,  $0004           ; 52F9   0282 0115 0004

        CMPR    R1,     R4                      ; 52FC   014C
        ANDR    R6,     R0                      ; 52FD   01B0
        ADDR    R0,     R1                      ; 52FE   00C1
        PULR    R2                              ; 52FF   02B2
        MVO@    R1,     R2                      ; 5300   0251
        SWAP    R1,     1                       ; 5301   0041
        PULR    R0                              ; 5302   02B0
        ANDR    R0,     R1                      ; 5303   0181
        MOVR    R0,     R2                      ; 5304   0082
        COMR    R2                              ; 5305   001A
        PULR    R5                              ; 5306   02B5
        AND@    R3,     R2                      ; 5307   039A
        BMI     L_530C                          ; 5308   020B 0002

        SUBR    R5,     R1                      ; 530A   0129
        ANDR    R0,     R1                      ; 530B   0181
L_530C:
        XORR    R2,     R1                      ; 530C   01D1
        MVO@    R1,     R3                      ; 530D   0259
        MOVR    R5,     R2                      ; 530E   00AA
        INCR    R3                              ; 530F   000B
        PULR    R5                              ; 5310   02B5
        DECR    R5                              ; 5311   0015
        BNEQ    L_52ED                          ; 5312   022C 0026
        PULR    R7                              ; 5314   02B7

        MVII    #$0001, R1                      ; 5315   02B9 0001
        INCR    R7                              ; 5317   000F

        CLRR    R1                              ; 5318   01C9
L_5319:
        PSHR    R5                              ; 5319   0275
        MVII    #$031B, R4                      ; 531A   02BC 031B
        CLRR    R5                              ; 531C   01ED
        ADDI    #$0002, R1                      ; 531D   02F9 0002
L_531F:
        MVI@    R4,     R0                      ; 531F   02A0
        MVO@    R0,     R5                      ; 5320   0268
        MVI@    R4,     R0                      ; 5321   02A0
        MVO@    R0,     R5                      ; 5322   0268
        MVI@    R4,     R0                      ; 5323   02A0
        MVO@    R0,     R5                      ; 5324   0268
        MVI@    R4,     R0                      ; 5325   02A0
        MVO@    R0,     R5                      ; 5326   0268
        MVI@    R4,     R0                      ; 5327   02A0
        MVO@    R0,     R5                      ; 5328   0268
        MVI@    R4,     R0                      ; 5329   02A0
        MVO@    R0,     R5                      ; 532A   0268
        MVI@    R4,     R0                      ; 532B   02A0
        MVO@    R0,     R5                      ; 532C   0268
        MVI@    R4,     R0                      ; 532D   02A0
        MVO@    R0,     R5                      ; 532E   0268
        DECR    R1                              ; 532F   0011
        BNEQ    L_531F                          ; 5330   022C 0012
        PULR    R7                              ; 5332   02B7

        DECLE   $0275,  $0003,  $0004           ; 5333   0275 0003 0004

        CMPR    R1,     R0                      ; 5336   0148
        CMP@    R1,     R6                      ; 5337   034E
        MVII    #$0020, R0                      ; 5338   02B8 0020
        CLRR    R4                              ; 533A   01E4

        JSR     R5,     X_FILL_ZERO             ; 533B   0004 0114 0338
        DECLE   $0004                           ; 533E   0004

        CMPR    R1,     R0                      ; 533F   0148
        CMP@    R5,     R4                      ; 5340   036C
        MVII    #$0077, R0                      ; 5341   02B8 0077
        MVO     R0,     .ISRVEC.0               ; 5343   0240 0100
        MVII    #$0049, R0                      ; 5345   02B8 0049
        MVO     R0,     .ISRVEC.1               ; 5347   0240 0101
        CLRR    R0                              ; 5349   01C0
        MVO     R0,     G_0118                  ; 534A   0240 0118
        EIS                                     ; 534C   0002
        PULR    R7                              ; 534D   02B7

        PSHR    R5                              ; 534E   0275
        CLRR    R0                              ; 534F   01C0
        MVO     R0,     .STIC.HDLY              ; 5350   0240 0030
        MVO     R0,     .STIC.VDLY              ; 5352   0240 0031
        SDBD                                    ; 5354   0001
        MVII    #$4DB8, R4                      ; 5355   02BC 00B8 004D
        MVI@    R4,     R0                      ; 5358   02A0
        MVII    #$0021, R1                      ; 5359   02B9 0021
        TSTR    R0                              ; 535B   0080
        BEQ     L_5360                          ; 535C   0204 0002

        MVO@    R0,     R1                      ; 535E   0248
        INCR    R7                              ; 535F   000F

L_5360:
        MVI@    R1,     R0                      ; 5360   0288
L_5361:
        MVII    #$0028, R1                      ; 5361   02B9 0028
        MVII    #$0005, R0                      ; 5363   02B8 0005

        JSR     R5,     .EXEC.730               ; 5365   0004 0114 0330

        MVI@    R4,     R0                      ; 5368   02A0
        MVO     R0,     .STIC.EDGE              ; 5369   0240 0032
        PULR    R7                              ; 536B   02B7

        DECLE   $0275,  $02B8,  $0008,  $02B9   ; 536C   0275 02B8 0008 02B9
        DECLE   $034B,  $0001,  $02BC,  $00C7   ; 5370   034B 0001 02BC 00C7
        DECLE   $004D,  $0080,  $0204,  $000E   ; 5374   004D 0080 0204 000E
        DECLE   $0004,  $0114,  $0330,  $02B8   ; 5378   0004 0114 0330 02B8
        DECLE   $0008,  $02BD,  $015D,  $02A1   ; 537C   0008 02BD 015D 02A1
        DECLE   $0269,  $02A1,  $0269,  $0010   ; 5380   0269 02A1 0269 0010
        DECLE   $022C,  $0006,  $0004           ; 5384   022C 0006 0004

        CMPR    R3,     R0                      ; 5387   0158
        CMP     .BTAB.B7,R6                     ; 5388   0346 02B7
        PSHR    R5                              ; 538A   0275
        MVII    #$0103, R4                      ; 538B   02BC 0103
        MVI     G_010D, R2                      ; 538D   0282 010D
        ANDI    #$0001, R2                      ; 538F   03BA 0001
        BEQ     L_5395                          ; 5391   0204 0002

        ADDI    #$0004, R4                      ; 5393   02FC 0004
L_5395:
        MVI@    R4,     R1                      ; 5395   02A1
        SWAP    R1,     1                       ; 5396   0041
        XOR@    R4,     R1                      ; 5397   03E1
        MVI@    R4,     R0                      ; 5398   02A0
        PSHR    R2                              ; 5399   0272

        JSR     R5,     X_EXT_SIGN_LO           ; 539A   0004 0114 0268
        DECLE   $0282,  $010B,  $0004           ; 539D   0282 010B 0004

        CMPR    R1,     R4                      ; 53A0   014C
        ANDR    R6,     R0                      ; 53A1   01B0
        PULR    R2                              ; 53A2   02B2
        ADDR    R0,     R1                      ; 53A3   00C1
        MOVR    R1,     R0                      ; 53A4   0088
        SLL     R2,     1                       ; 53A5   004A
        SAR     R0,     2                       ; 53A6   006C
        SAR     R0,     2                       ; 53A7   006C
        SAR     R0,     2                       ; 53A8   006C
        SAR     R0,     2                       ; 53A9   006C
        BMI     L_53B1                          ; 53AA   020B 0005

        CMPI    #$0007, R0                      ; 53AC   0378 0007
        BLE     L_53C2                          ; 53AE   0206 0012
        INCR    R7                              ; 53B0   000F

L_53B1:
        INCR    R2                              ; 53B1   000A
L_53B2:
        MVO     R2,     G_010E                  ; 53B2   0242 010E
        SDBD                                    ; 53B4   0001
        MVII    #$00CC, R2                      ; 53B5   02BA 00CC 0000
        MVO     R2,     .ISRVEC.0               ; 53B8   0242 0100
        SDBD                                    ; 53BA   0001
        MVII    #$004B, R2                      ; 53BB   02BA 004B 0000
        MVO     R2,     .ISRVEC.1               ; 53BE   0242 0101
        ANDI    #$0007, R0                      ; 53C0   03B8 0007
L_53C2:
        SUBI    #$0003, R4                      ; 53C2   033C 0003
        MOVR    R0,     R2                      ; 53C4   0082
        SUB@    R4,     R2                      ; 53C5   0322
        DECR    R4                              ; 53C6   0014
        MVO@    R0,     R4                      ; 53C7   0260
        MVO@    R1,     R4                      ; 53C8   0261
        INCR    R4                              ; 53C9   000C
        MVO@    R2,     R4                      ; 53CA   0262
        PULR    R7                              ; 53CB   02B7

        PSHR    R5                              ; 53CC   0275
        MVO     R0,     .STIC.VIDEN             ; 53CD   0240 0020
        MVI     G_010C, R0                      ; 53CF   0280 010C
        TSTR    R0                              ; 53D1   0080
        BEQ     L_53D5                          ; 53D2   0204 0001
        PULR    R7                              ; 53D4   02B7

L_53D5:
        INCR    R0                              ; 53D5   0008
        MVO     R0,     G_010C                  ; 53D6   0240 010C
        MVI     G_0103, R0                      ; 53D8   0280 0103
        MVO     R0,     .STIC.HDLY              ; 53DA   0240 0030
        MVI     G_0107, R0                      ; 53DC   0280 0107
        MVO     R0,     .STIC.VDLY              ; 53DE   0240 0031
        MVII    #$0008, R5                      ; 53E0   02BD 0008
        MVII    #$0323, R4                      ; 53E2   02BC 0323
        MVI     G_010E, R2                      ; 53E4   0282 010E
        RRC     R2,     2                       ; 53E6   0076
        BOV     L_53EB                          ; 53E7   0202 0002

        SUBR    R5,     R4                      ; 53E9   012C
        CLRR    R5                              ; 53EA   01ED
L_53EB:
        MVI@    R4,     R0                      ; 53EB   02A0
        DECLE   $0268,  $02A0,  $0268,  $02A0   ; 53EC   0268 02A0 0268 02A0
        DECLE   $0268,  $02A0,  $0268,  $02A0   ; 53F0   0268 02A0 0268 02A0
        DECLE   $0268,  $02A0,  $0268,  $02A0   ; 53F4   0268 02A0 0268 02A0
        DECLE   $0268,  $02A0,  $0268,  $0282   ; 53F8   0268 02A0 0268 0282
        DECLE   $010E,  $0004                   ; 53FC   010E 0004

        CMPR    R1,     R4                      ; 53FE   014C
        RSWD    R0                              ; 53FF   0038

        JSR     R5,     L_59F2                  ; 5400   0004 0158 01F2

        DIS                                     ; 5403   0003
        MVII    #$0077, R0                      ; 5404   02B8 0077
        MVO     R0,     .ISRVEC.0               ; 5406   0240 0100
        MVII    #$0049, R0                      ; 5408   02B8 0049
        MVO     R0,     .ISRVEC.1               ; 540A   0240 0101
        EIS                                     ; 540C   0002
        CLRR    R0                              ; 540D   01C0
        MVO     R0,     G_010C                  ; 540E   0240 010C
        PULR    R7                              ; 5410   02B7

        PSHR    R5                              ; 5411   0275
        MVII    #$0008, R5                      ; 5412   02BD 0008
        MVII    #$031B, R3                      ; 5414   02BB 031B
        MVII    #$0008, R0                      ; 5416   02B8 0008
        MVI     G_010E, R1                      ; 5418   0281 010E
        RRC     R1,     1                       ; 541A   0071
        BNC     L_541E                          ; 541B   0209 0001

        NEGR    R0                              ; 541D   0020
L_541E:
        MVII    #$00FF, R2                      ; 541E   02BA 00FF
        RRC     R1,     1                       ; 5420   0071
        BNC     L_5426                          ; 5421   0209 0003

        ADDR    R5,     R3                      ; 5423   00EB
        MVII    #$007F, R2                      ; 5424   02BA 007F
L_5426:
        MVI@    R3,     R4                      ; 5426   029C
        TSTR    R4                              ; 5427   00A4
        BPL     L_5433                          ; 5428   0203 0009

        COMR    R2                              ; 542A   001A
        ANDR    R2,     R4                      ; 542B   0194
        COMR    R2                              ; 542C   001A
        MVI@    R3,     R1                      ; 542D   0299
        ANDR    R2,     R1                      ; 542E   0191
        ADDR    R0,     R1                      ; 542F   00C1
        ANDR    R2,     R1                      ; 5430   0191
        XORR    R4,     R1                      ; 5431   01E1
        MVO@    R1,     R3                      ; 5432   0259
L_5433:
        INCR    R3                              ; 5433   000B
        DECR    R5                              ; 5434   0015
        BNEQ    L_5426                          ; 5435   022C 0010
        PULR    R7                              ; 5437   02B7

        PSHR    R5                              ; 5438   0275
        PSHR    R2                              ; 5439   0272
        RRC     R2,     1                       ; 543A   0072
        BC      L_548E                          ; 543B   0201 0051

        RRC     R2,     1                       ; 543D   0072
        BC      L_5457                          ; 543E   0201 0017

        MVII    #$0213, R3                      ; 5440   02BB 0213
        MVII    #$0212, R2                      ; 5442   02BA 0212
L_5444:
        MVII    #$0013, R1                      ; 5444   02B9 0013
L_5446:
        MVI@    R2,     R0                      ; 5446   0290
        MVO@    R0,     R3                      ; 5447   0258
        DECR    R3                              ; 5448   0013
        DECR    R2                              ; 5449   0012
        DECR    R1                              ; 544A   0011
        BNEQ    L_5446                          ; 544B   022C 0006

        ADDI    #$0027, R3                      ; 544D   02FB 0027
        ADDI    #$0027, R2                      ; 544F   02FA 0027
        CMPI    #$02F0, R2                      ; 5451   037A 02F0
        BLT     L_5444                          ; 5453   0225 0010

        PULR    R2                              ; 5455   02B2
        PULR    R7                              ; 5456   02B7

L_5457:
        MVII    #$02C8, R4                      ; 5457   02BC 02C8
        MVII    #$02DC, R5                      ; 5459   02BD 02DC
        MVII    #$0028, R1                      ; 545B   02B9 0028
        MVII    #$000B, R2                      ; 545D   02BA 000B
L_545F:
        MVI@    R4,     R0                      ; 545F   02A0
        MVO@    R0,     R5                      ; 5460   0268
        MVI@    R4,     R0                      ; 5461   02A0
        MVO@    R0,     R5                      ; 5462   0268
        MVI@    R4,     R0                      ; 5463   02A0
        MVO@    R0,     R5                      ; 5464   0268
        MVI@    R4,     R0                      ; 5465   02A0
        MVO@    R0,     R5                      ; 5466   0268
        MVI@    R4,     R0                      ; 5467   02A0
        MVO@    R0,     R5                      ; 5468   0268
        MVI@    R4,     R0                      ; 5469   02A0
        MVO@    R0,     R5                      ; 546A   0268
        MVI@    R4,     R0                      ; 546B   02A0
        MVO@    R0,     R5                      ; 546C   0268
        MVI@    R4,     R0                      ; 546D   02A0
        MVO@    R0,     R5                      ; 546E   0268
        MVI@    R4,     R0                      ; 546F   02A0
        MVO@    R0,     R5                      ; 5470   0268
        MVI@    R4,     R0                      ; 5471   02A0
        MVO@    R0,     R5                      ; 5472   0268
        MVI@    R4,     R0                      ; 5473   02A0
        MVO@    R0,     R5                      ; 5474   0268
        MVI@    R4,     R0                      ; 5475   02A0
        MVO@    R0,     R5                      ; 5476   0268
        MVI@    R4,     R0                      ; 5477   02A0
        MVO@    R0,     R5                      ; 5478   0268
        MVI@    R4,     R0                      ; 5479   02A0
        MVO@    R0,     R5                      ; 547A   0268
        MVI@    R4,     R0                      ; 547B   02A0
L_547C:
        MVO@    R0,     R5                      ; 547C   0268
        MVI@    R4,     R0                      ; 547D   02A0
        MVO@    R0,     R5                      ; 547E   0268
        MVI@    R4,     R0                      ; 547F   02A0
        MVO@    R0,     R5                      ; 5480   0268
        MVI@    R4,     R0                      ; 5481   02A0
        MVO@    R0,     R5                      ; 5482   0268
        MVI@    R4,     R0                      ; 5483   02A0
        MVO@    R0,     R5                      ; 5484   0268
        MVI@    R4,     R0                      ; 5485   02A0
        MVO@    R0,     R5                      ; 5486   0268
        SUBR    R1,     R4                      ; 5487   010C
        SUBR    R1,     R5                      ; 5488   010D
        DECR    R2                              ; 5489   0012
        BNEQ    L_545F                          ; 548A   022C 002C

        PULR    R2                              ; 548C   02B2
        PULR    R7                              ; 548D   02B7

L_548E:
        RRC     R2,     1                       ; 548E   0072
        BC      L_54A4                          ; 548F   0201 0013

        MVII    #$0200, R5                      ; 5491   02BD 0200
        MVII    #$0201, R4                      ; 5493   02BC 0201
L_5495:
        MVII    #$0013, R1                      ; 5495   02B9 0013
L_5497:
        MVI@    R4,     R0                      ; 5497   02A0
        MVO@    R0,     R5                      ; 5498   0268
        DECR    R1                              ; 5499   0011
L_549A:
        BNEQ    L_5497                          ; 549A   022C 0004

        INCR    R4                              ; 549C   000C
        INCR    R5                              ; 549D   000D
        CMPI    #$02DD, R4                      ; 549E   037C 02DD
        BLE     L_5495                          ; 54A0   0226 000C

        PULR    R2                              ; 54A2   02B2
        PULR    R7                              ; 54A3   02B7

L_54A4:
        MVII    #$0200, R5                      ; 54A4   02BD 0200
        MVII    #$0214, R4                      ; 54A6   02BC 0214
        MVII    #$00DC, R1                      ; 54A8   02B9 00DC
L_54AA:
        MVI@    R4,     R0                      ; 54AA   02A0
        MVO@    R0,     R5                      ; 54AB   0268
        DECR    R1                              ; 54AC   0011
        BNEQ    L_54AA                          ; 54AD   022C 0004

        PULR    R2                              ; 54AF   02B2
        PULR    R7                              ; 54B0   02B7

        MVII    #$010F, R4                      ; 54B1   02BC 010F
        B       L_54BB                          ; 54B3   0200 0006

        MVII    #$0111, R4                      ; 54B5   02BC 0111
        B       L_54BB                          ; 54B7   0200 0002

        MVII    #$0113, R4                      ; 54B9   02BC 0113
L_54BB:
        MVI@    R5,     R0                      ; 54BB   02A8
        MVO@    R0,     R4                      ; 54BC   0260
        MVI@    R5,     R0                      ; 54BD   02A8
        MVO@    R0,     R4                      ; 54BE   0260
        MOVR    R5,     R7                      ; 54BF   00AF

        PSHR    R5                              ; 54C0   0275
        MVII    #$010F, R4                      ; 54C1   02BC 010F
L_54C3:
        SDBD                                    ; 54C3   0001
        MVI@    R4,     R0                      ; 54C4   02A0
        TSTR    R0                              ; 54C5   0080
        BEQ     L_54CF                          ; 54C6   0204 0007

        SUBI    #$0002, R4                      ; 54C8   033C 0002
        SDBD                                    ; 54CA   0001
        MVII    #$4CCF, R5                      ; 54CB   02BD 00CF 004C
        MOVR    R0,     R7                      ; 54CE   0087

L_54CF:
        CMPI    #$0113, R4                      ; 54CF   037C 0113
        BLE     L_54C3                          ; 54D1   0226 000F
        PULR    R7                              ; 54D3   02B7

        DECLE   $0275,  $02B9,  $0002,  $0004   ; 54D4   0275 02B9 0002 0004
        DECLE   $014C,  $00F5,  $0001,  $02A0   ; 54D8   014C 00F5 0001 02A0
        DECLE   $0299,  $0001,  $03B9,  $00F8   ; 54DC   0299 0001 03B9 00F8
        DECLE   $000F,  $01C1,  $0259,  $02FB   ; 54E0   000F 01C1 0259 02FB
        DECLE   $0008,  $02B9,  $0003,  $0004   ; 54E4   0008 02B9 0003 0004

        CMPR    R1,     R4                      ; 54E8   014C
        ADDR    R6,     R5                      ; 54E9   00F5
        SUBI    #$034B, R3                      ; 54EA   033B 034B
        SLL     R3,     1                       ; 54EC   004B
        ADDI    #$0126, R3                      ; 54ED   02FB 0126
        CLRR    R0                              ; 54EF   01C0
        MVO@    R0,     R3                      ; 54F0   0258
        ADDI    #$0010, R3                      ; 54F1   02FB 0010
        MVO@    R0,     R3                      ; 54F3   0258
        PULR    R7                              ; 54F4   02B7

L_54F5:
        SDBD                                    ; 54F5   0001
        MVI@    R4,     R0                      ; 54F6   02A0
        MVO@    R0,     R3                      ; 54F7   0258
        ADDI    #$0008, R3                      ; 54F8   02FB 0008
        DECR    R1                              ; 54FA   0011
        BNEQ    L_54F5                          ; 54FB   022C 0007
        MOVR    R5,     R7                      ; 54FD   00AF

        DECLE   $0275,  $0270,  $0271,  $0004   ; 54FE   0275 0270 0271 0004
        DECLE   $014C,  $010C,  $02B1,  $02B0   ; 5502   014C 010C 02B1 02B0
        DECLE   $0272,  $0004                   ; 5506   0272 0004

        CMPR    R1,     R4                      ; 5508   014C
        SUBR    R1,     R6                      ; 5509   010E
        PULR    R1                              ; 550A   02B1
        PULR    R7                              ; 550B   02B7

        SUBI    #$0004, R0                      ; 550C   0338 0004
        PSHR    R5                              ; 550E   0275
        TSTR    R1                              ; 550F   0089
        BPL     L_5515                          ; 5510   0203 0003

        NEGR    R1                              ; 5512   0021
        ADDI    #$0008, R0                      ; 5513   02F8 0008
L_5515:
        ANDI    #$000F, R0                      ; 5515   03B8 000F
        CLRR    R3                              ; 5517   01DB
L_5518:
        CMPI    #$0004, R0                      ; 5518   0378 0004
        BLE     L_5528                          ; 551A   0206 000C

        CMPI    #$0008, R0                      ; 551C   0378 0008
        BLE     L_5525                          ; 551E   0206 0005

        SUBI    #$0008, R0                      ; 5520   0338 0008
        INCR    R3                              ; 5522   000B
        B       L_5518                          ; 5523   0220 000C

L_5525:
        NEGR    R0                              ; 5525   0020
        ADDI    #$0008, R0                      ; 5526   02F8 0008
L_5528:
        SDBD                                    ; 5528   0001
        MVII    #$4D39, R2                      ; 5529   02BA 0039 004D
        ADDR    R0,     R2                      ; 552C   00C2
        MVI@    R2,     R0                      ; 552D   0290

        JSR     R5,     X_MPY                   ; 552E   0004 011C 01DC

        SWAP    R2,     1                       ; 5531   0042
        ANDI    #$00FF, R2                      ; 5532   03BA 00FF
        TSTR    R3                              ; 5534   009B
        BNEQ    L_5538                          ; 5535   020C 0001

        NEGR    R2                              ; 5537   0022
L_5538:
        PULR    R7                              ; 5538   02B7

        DECLE   $0000                           ; 5539   0000

        SLR     R1,     1                       ; 553A   0061
        MOVR    R6,     R4                      ; 553B   00B4
        ADDR    R5,     R3                      ; 553C   00EB
        SUBR    R0,     R0                      ; 553D   0100
        CLRR    R1                              ; 553E   01C9
        CLRR    R2                              ; 553F   01D2
        MVO@    R1,     R3                      ; 5540   0259
        ADDI    #$0010, R3                      ; 5541   02FB 0010
        MVO@    R2,     R3                      ; 5543   025A
        MOVR    R5,     R7                      ; 5544   00AF

        MVI@    R4,     R0                      ; 5545   02A0
        ANDI    #$00FF, R0                      ; 5546   03B8 00FF
        ADDI    #$0007, R4                      ; 5548   02FC 0007
        MVI@    R4,     R1                      ; 554A   02A1
        ANDI    #$007F, R1                      ; 554B   03B9 007F
        PSHR    R5                              ; 554D   0275

        JSR     R5,     .EXEC.78C               ; 554E   0004 0114 038C

        MOVR    R0,     R3                      ; 5551   0083
        MOVR    R1,     R4                      ; 5552   008C
        MOVR    R2,     R1                      ; 5553   0091

        JSR     R5,     X_SQRT                  ; 5554   0004 011C 0223

        PULR    R7                              ; 5557   02B7

        MVII    #$0001, R0                      ; 5558   02B8 0001
        INCR    R7                              ; 555A   000F

        CLRR    R0                              ; 555B   01C0
L_555C:
        PSHR    R5                              ; 555C   0275
        DECLE   $0270,  $0274,  $0271,  $0004   ; 555D   0270 0274 0271 0004

        CMPR    R1,     R4                      ; 5561   014C
        CMPR    R0,     R5                      ; 5562   0145
        MOVR    R3,     R0                      ; 5563   0098
        MOVR    R2,     R3                      ; 5564   0093
        PULR    R1                              ; 5565   02B1
        PSHR    R1                              ; 5566   0271

        JSR     R5,     X_MPY                   ; 5567   0004 011C 01DC

        MOVR    R2,     R1                      ; 556A   0091
        MOVR    R3,     R2                      ; 556B   009A

        JSR     R5,     X_DIVR                  ; 556C   0004 011C 01F8

        PULR    R1                              ; 556F   02B1
L_5570:
        PSHR    R0                              ; 5570   0270
        MOVR    R4,     R0                      ; 5571   00A0
        MOVR    R1,     R4                      ; 5572   008C

        JSR     R5,     X_MPY                   ; 5573   0004 011C 01DC

        MOVR    R2,     R1                      ; 5576   0091
        MOVR    R3,     R2                      ; 5577   009A

        JSR     R5,     X_DIVR                  ; 5578   0004 011C 01F8

        PULR    R1                              ; 557B   02B1
        PULR    R2                              ; 557C   02B2
        PULR    R5                              ; 557D   02B5
        SUBI    #$031B, R2                      ; 557E   033A 031B
        PSHR    R2                              ; 5580   0272
        SLL     R2,     1                       ; 5581   004A
        ADDI    #$0126, R2                      ; 5582   02FA 0126
        MVO@    R1,     R2                      ; 5584   0251
        ADDI    #$0010, R2                      ; 5585   02FA 0010
        MVO@    R0,     R2                      ; 5587   0250
        TSTR    R5                              ; 5588   00AD
        BEQ     L_55AE                          ; 5589   0204 0023

        MOVR    R4,     R2                      ; 558B   00A2
        MOVR    R3,     R1                      ; 558C   0099
        CMPI    #$007F, R1                      ; 558D   0379 007F
        BGT     L_5597                          ; 558F   020E 0006

        SWAP    R1,     1                       ; 5591   0041

        JSR     R5,     X_DIVR                  ; 5592   0004 011C 01F8

        B       L_559B                          ; 5595   0200 0004

L_5597:
        JSR     R5,     X_DIVR                  ; 5597   0004 011C 01F8

        SWAP    R0,     1                       ; 559A   0040
L_559B:
        MVI     G_0115, R1                      ; 559B   0281 0115
        TSTR    R1                              ; 559D   0089
        BEQ     L_55A4                          ; 559E   0204 0004

L_55A0:
        SLR     R0,     1                       ; 55A0   0060
        DECR    R1                              ; 55A1   0011
        BNEQ    L_55A0                          ; 55A2   022C 0003

L_55A4:
        TSTR    R0                              ; 55A4   0080
        BNEQ    L_55A9                          ; 55A5   020C 0002

        MVII    #$0001, R0                      ; 55A7   02B8 0001
L_55A9:
        PULR    R2                              ; 55A9   02B2
        ADDI    #$0343, R2                      ; 55AA   02FA 0343
        MVO@    R0,     R2                      ; 55AC   0250
        INCR    R7                              ; 55AD   000F

L_55AE:
        PULR    R2                              ; 55AE   02B2
L_55AF:
        PULR    R7                              ; 55AF   02B7

        TSTR    R2                              ; 55B0   0092
        BEQ     L_55B7                          ; 55B1   0204 0004

L_55B3:
        SLL     R0,     1                       ; 55B3   0048
        DECR    R2                              ; 55B4   0012
        BNEQ    L_55B3                          ; 55B5   022C 0003
L_55B7:
        MOVR    R5,     R7                      ; 55B7   00AF

        DECLE   $0001,  $0001,  $0008,  $0001   ; 55B8   0001 0001 0008 0001
        DECLE   $0008,  $0000,  $0003,  $0180   ; 55BC   0008 0000 0003 0180
        DECLE   $0190,  $01A0,  $01B0,  $01C0   ; 55C0   0190 01A0 01B0 01C0
        DECLE   $01D0,  $01E0,  $01F0,  $0080   ; 55C4   01D0 01E0 01F0 0080
        DECLE   $0080,  $0080,  $0040,  $0001   ; 55C8   0080 0080 0040 0001
        DECLE   $0000,  $0080,  $0082,  $00FC   ; 55CC   0000 0080 0082 00FC
        DECLE   $004E,  $00FF                   ; 55D0   004E 00FF

        SLL     R2,     2                       ; 55D2   004E
        ADDR    R5,     R2                      ; 55D3   00EA
        SLL     R2,     2                       ; 55D4   004E
        ADDR    R4,     R7                      ; 55D5   00E7

        DECLE   $004E,  $00F0,  $004E,  $00F3   ; 55D6   004E 00F0 004E 00F3
        DECLE   $004E,  $00F6,  $004E,  $00F9   ; 55DA   004E 00F6 004E 00F9
        DECLE   $004E,  $00EB,  $004D,  $0014   ; 55DE   004E 00EB 004D 0014
        DECLE   $00FC,  $0054,  $0001,  $002E   ; 55E2   00FC 0054 0001 002E
        DECLE   $0057,  $000A,  $0051,  $0058   ; 55E6   0057 000A 0051 0058
        DECLE   $0004,  $0275,  $0281,  $017F   ; 55EA   0004 0275 0281 017F
        DECLE   $0379,  $000A,  $0204,  $0020   ; 55EE   0379 000A 0204 0020
        DECLE   $0089,  $020C,  $0003,  $0004   ; 55F2   0089 020C 0003 0004
        DECLE   $0154,  $02F4,  $0004,  $0150   ; 55F6   0154 02F4 0004 0150
        DECLE   $02A0                           ; 55FA   02A0

        MVO     R0,     G_0187                  ; 55FB   0240 0187
        CMPI    #$0004, R0                      ; 55FD   0378 0004
        BEQ     L_591F                          ; 55FF   0204 031E

        MVI     G_019C, R0                      ; 5601   0280 019C
        TSTR    R0                              ; 5603   0080
        BEQ     L_5613                          ; 5604   0204 000D

        DECR    R0                              ; 5606   0010
        MVO     R0,     G_019C                  ; 5607   0240 019C
        MVI     G_017F, R1                      ; 5609   0281 017F
        CMPI    #$0001, R1                      ; 560B   0379 0001
        BNEQ    L_5612                          ; 560D   020C 0003
        J       L_5191                          ; 560F   0004 0350 0191
L_5612:
        PULR    R7                              ; 5612   02B7

L_5613:
        MVI     G_035C, R0                      ; 5613   0280 035C
        TSTR    R0                              ; 5615   0080
        BEQ     L_5631                          ; 5616   0204 0019

        MVI     G_010B, R0                      ; 5618   0280 010B
        CMPI    #$0001, R0                      ; 561A   0378 0001
        BEQ     L_561F                          ; 561C   0204 0001

        INCR    R0                              ; 561E   0008

L_561F:
        JSR     R5,     L_56E3                  ; 561F   0004 0154 02E3
        DECLE   $02BA,  $0014,  $0242,  $019C   ; 5622   02BA 0014 0242 019C
        DECLE   $0004,  $0158,  $00F6,  $0281   ; 5626   0004 0158 00F6 0281
        DECLE   $017F,  $0089,  $020C,  $0003   ; 562A   017F 0089 020C 0003
        DECLE   $0004,  $0154,  $0373           ; 562E   0004 0154 0373
L_5631:
        PULR    R7                              ; 5631   02B7

        PSHR    R5                              ; 5632   0275
        SDBD                                    ; 5633   0001
        MVII    #$4E6B, R4                      ; 5634   02BC 006B 004E
L_5637:
        MVI@    R4,     R0                      ; 5637   02A0
        DECLE   $0378,  $00FF,  $0204,  $0021   ; 5638   0378 00FF 0204 0021
        DECLE   $0004,  $014C,  $0262,  $02F8   ; 563C   0004 014C 0262 02F8
        DECLE   $0006,  $02BA,  $0171,  $02BB   ; 5640   0006 02BA 0171 02BB
        DECLE   $0172,  $0351,  $020E,  $0016   ; 5644   0172 0351 020E 0016
        DECLE   $0358,  $020E,  $0013,  $02A0   ; 5648   0358 020E 0013 02A0
        DECLE   $0004                           ; 564C   0004

        CMPR    R1,     R4                      ; 564D   014C
        MVO@    R2,     R4                      ; 564E   0262
        ADDI    #$0006, R0                      ; 564F   02F8 0006
        CMP@    R2,     R1                      ; 5651   0351
        BLT     L_565F                          ; 5652   0205 000B

        CMP@    R3,     R0                      ; 5654   0358
        BLT     L_565F                          ; 5655   0205 0008

        MVI@    R4,     R1                      ; 5657   02A1
        SDBD                                    ; 5658   0001
        ADDI    #$4E9F, R1                      ; 5659   02F9 009F 004E
        CLRC                                    ; 565C   0006
        PULR    R7                              ; 565D   02B7

        INCR    R4                              ; 565E   000C
L_565F:
        INCR    R4                              ; 565F   000C
        B       L_5637                          ; 5660   0220 002A

        MOVR    R0,     R1                      ; 5662   0081
        ANDI    #$03E0, R0                      ; 5663   03B8 03E0
        SLR     R0,     2                       ; 5665   0064
        SLR     R0,     2                       ; 5666   0064
L_5667:
        ANDI    #$001F, R1                      ; 5667   03B9 001F
        SLL     R1,     1                       ; 5669   0049
        MOVR    R5,     R7                      ; 566A   00AF

        DECLE   $0005,  $0079,  $0000,  $0065   ; 566B   0005 0079 0000 0065
        DECLE   $00B1,  $0000,  $0071,  $00B9   ; 566F   00B1 0000 0071 00B9
        DECLE   $0003,  $00A5,  $00CC,  $0005   ; 5673   0003 00A5 00CC 0005

        MOVR    R5,     R7                      ; 5677   00AF

        ADDR    R7,     R1                      ; 5678   00F9
        SETC                                    ; 5679   0007
        ADDR    R0,     R5                      ; 567A   00C5
        CMPR    R5,     R7                      ; 567B   016F
        INCR    R2                              ; 567C   000A
        ADDR    R5,     R7                      ; 567D   00EF

        CMPR    R7,     R1                      ; 567E   0179
        INCR    R5                              ; 567F   000D
        ANDR    R0,     R5                      ; 5680   0185
        ADD@    R1,     R3                      ; 5681   02CB
        INCR    R7                              ; 5682   000F

        ANDR    R1,     R3                      ; 5683   018B
L_5684:
        PSHR    R2                              ; 5684   0272
        DECLE   $0012,  $0192,  $02D9,  $000F   ; 5685   0012 0192 02D9 000F
        DECLE   $02C5,  $034B,  $0015,  $030A   ; 5689   02C5 034B 0015 030A
        DECLE   $036C,  $0018,  $0348,  $038A   ; 568D   036C 0018 0348 038A
        DECLE   $001D,  $0352,  $0394,  $001D   ; 5691   001D 0352 0394 001D
        DECLE   $0365,  $03D4,  $0021,  $02B0   ; 5695   0365 03D4 0021 02B0
        DECLE   $0355,  $0026,  $0315,  $0357   ; 5699   0355 0026 0315 0357
        DECLE   $002A,  $00FF,  $0052,  $0029   ; 569D   002A 00FF 0052 0029
        DECLE   $01C0,  $00B9,  $00A0,  $00A1   ; 56A1   01C0 00B9 00A0 00A1
        DECLE   $0240,  $01CF,  $0265,  $0000   ; 56A5   0240 01CF 0265 0000
        DECLE   $01C5,  $006B,  $0000,  $0141   ; 56A9   01C5 006B 0000 0141
        DECLE   $02E0,  $0195,  $01C7,  $0000   ; 56AD   02E0 0195 01C7 0000
        DECLE   $0105,  $0032,  $0280,  $0189   ; 56B1   0105 0032 0280 0189
        DECLE   $02C5,  $0240,  $00E1,  $018C   ; 56B5   02C5 0240 00E1 018C
        DECLE   $004C,  $0084,  $0240,  $0169   ; 56B9   004C 0084 0240 0169
        DECLE   $008E,  $00B9,  $0000,  $012E   ; 56BD   008E 00B9 0000 012E
        DECLE   $0285,  $0274,  $012E,  $00A0   ; 56C1   0285 0274 012E 00A0
        DECLE   $0274,  $01ED,  $0023,  $0100   ; 56C5   0274 01ED 0023 0100
        DECLE   $0270,  $0185,  $00AE,  $0000   ; 56C9   0270 0185 00AE 0000

        PSHR    R5                              ; 56CD   0275
        MOVR    R1,     R5                      ; 56CE   008D
L_56CF:
        MVI@    R5,     R0                      ; 56CF   02A8
        MOVR    R0,     R1                      ; 56D0   0081
        ANDI    #$03E0, R0                      ; 56D1   03B8 03E0
        ANDI    #$001F, R1                      ; 56D3   03B9 001F
        SLR     R0,     2                       ; 56D5   0064
        BEQ     L_56E6                          ; 56D6   0204 000E

        ADDI    #$0100, R0                      ; 56D8   02F8 0100
        XORR    R3,     R0                      ; 56DA   01D8
        MVO@    R0,     R4                      ; 56DB   0260
        SLL     R1,     2                       ; 56DC   004D
        SLL     R1,     1                       ; 56DD   0049
        BEQ     L_56E6                          ; 56DE   0204 0006

        ADDI    #$0100, R1                      ; 56E0   02F9 0100
        XORR    R3,     R1                      ; 56E2   01D9
L_56E3:
        MVO@    R1,     R4                      ; 56E3   0261
        B       L_56CF                          ; 56E4   0220 0016
L_56E6:
        PULR    R7                              ; 56E6   02B7

        DECLE   $003E,  $005F,  $0002,  $00B6   ; 56E7   003E 005F 0002 00B6
        DECLE   $005E,  $0002,  $00C6,  $005E   ; 56EB   005E 0002 00C6 005E
        DECLE   $0004,  $00E6,  $005E,  $0001   ; 56EF   0004 00E6 005E 0001

        ADDR    R6,     R6                      ; 56F3   00F6
L_56F4:
        SLLC    R2,     2                       ; 56F4   005E
        DECLE   $0001                           ; 56F5   0001

        ADDR    R7,     R6                      ; 56F6   00FE
        SLLC    R2,     2                       ; 56F7   005E

        JSRD    R4,     .EXEC.C5F               ; 56F8   0004 001E 005F
        DECLE   $0004                           ; 56FB   0004

        MOVR    R2,     R6                      ; 56FC   0096
        SLLC    R2,     2                       ; 56FD   005E
        EIS                                     ; 56FE   0002
        MOVR    R4,     R6                      ; 56FF   00A6
        SLLC    R2,     2                       ; 5700   005E
        EIS                                     ; 5701   0002
        PSHR    R5                              ; 5702   0275
        MVII    #$0001, R1                      ; 5703   02B9 0001
        MVO     R1,     G_0198                  ; 5705   0241 0198
        MVO     R1,     G_010B                  ; 5707   0241 010B
        MVO     R1,     G_017F                  ; 5709   0241 017F
        MVII    #$0028, R1                      ; 570B   02B9 0028
        MVO     R1,     G_0182                  ; 570D   0241 0182
        MVII    #$01A4, R4                      ; 570F   02BC 01A4
        MVII    #$0038, R0                      ; 5711   02B8 0038
        MVII    #$00FF, R1                      ; 5713   02B9 00FF

        JSR     R5,     X_FILL_MEM              ; 5715   0004 0114 0341
        DECLE   $02BB,  $0005,  $02BC,  $0252   ; 5718   02BB 0005 02BC 0252
        DECLE   $0001,  $02B9,  $003D,  $004F   ; 571C   0001 02B9 003D 004F
        DECLE   $0004                           ; 5720   0004

        CMPR    R1,     R4                      ; 5721   014C
        ADD@    R1,     R5                      ; 5722   02CD
        MOVR    R5,     R1                      ; 5723   00A9

        JSR     R5,     X_PRINT_R1              ; 5724   0004 0118 0067

        MVII    #$027A, R4                      ; 5727   02BC 027A
        MOVR    R5,     R1                      ; 5729   00A9

        JSR     R5,     X_PRINT_R1              ; 572A   0004 0118 0067
        DECLE   $0001,  $02BA,  $0025,  $0008   ; 572D   0001 02BA 0025 0008
        DECLE   $0242,  $0281,  $02BB,  $031B   ; 5731   0242 0281 02BB 031B
        DECLE   $0001,  $02BC,  $000A,  $0053   ; 5735   0001 02BC 000A 0053
        DECLE   $0004                           ; 5739   0004

        CMPR    R1,     R4                      ; 573A   014C
        ADDR    R2,     R4                      ; 573B   00D4
        PULR    R7                              ; 573C   02B7

        DECLE   $01A9,  $0072,  $01F3,  $02B2   ; 573D   01A9 0072 01F3 02B2
        DECLE   $00E5,  $01EE,  $0000,  $0020   ; 5741   00E5 01EE 0000 0020
        DECLE   $0042,  $0059,  $0000,  $0049   ; 5745   0042 0059 0000 0049
        DECLE   $004D,  $0041,  $0047,  $0049   ; 5749   004D 0041 0047 0049
        DECLE   $0043,  $0020,  $0040,  $0020   ; 574D   0043 0020 0040 0020
        DECLE   $0031,  $0039,  $0038,  $0032   ; 5751   0031 0039 0038 0032
        DECLE   $0000                           ; 5755   0000

        PSHR    R5                              ; 5756   0275

L_5757:
        JSR     R5,     L_5B5F                  ; 5757   0004 0158 035F
        DECLE   $02B8,  $0003,  $0240,  $017E   ; 575A   02B8 0003 0240 017E
        DECLE   $0280,  $031B,  $0001,  $03B8   ; 575E   0280 031B 0001 03B8
        DECLE   $00FF,  $00FE,  $03F8,  $0100   ; 5762   00FF 00FE 03F8 0100
        DECLE   $0240,  $031B,  $02B9,  $00FF   ; 5766   0240 031B 02B9 00FF
        DECLE   $0241,  $01A2,  $0004           ; 576A   0241 01A2 0004

        CMPR    R1,     R4                      ; 576D   014C
        MOVR    R7,     R1                      ; 576E   00B9
        MOVR    R2,     R5                      ; 576F   0095
        SLLC    R3,     1                       ; 5770   005B

        JSR     R5,     L_56F4                  ; 5771   0004 0154 02F4
        DECLE   $0281,  $0179,  $0241,  $0103   ; 5774   0281 0179 0241 0103
        DECLE   $0281,  $017A,  $0241,  $0107   ; 5778   0281 017A 0241 0107
        DECLE   $0004                           ; 577C   0004

        CMPR    R1,     R4                      ; 577D   014C
        AND@    R5,     R2                      ; 577E   03AA
        MVII    #$0163, R4                      ; 577F   02BC 0163
        SDBD                                    ; 5781   0001
        MVII    #$4EED, R1                      ; 5782   02B9 00ED 004E
        MVO@    R1,     R4                      ; 5785   0261
        SWAP    R1,     1                       ; 5786   0041
        MVO@    R1,     R4                      ; 5787   0261
        MVI     G_0172, R3                      ; 5788   0283 0172
        MVII    #$0200, R4                      ; 578A   02BC 0200
        MVII    #$000C, R0                      ; 578C   02B8 000C
L_578E:
        PSHR    R0                              ; 578E   0270
        DECLE   $0273,  $0274,  $0004           ; 578F   0273 0274 0004

        CMPR    R1,     R4                      ; 5792   014C
        AND@    R4,     R6                      ; 5793   03A6
        PULR    R4                              ; 5794   02B4
        ADDI    #$0014, R4                      ; 5795   02FC 0014
        PULR    R3                              ; 5797   02B3
        INCR    R3                              ; 5798   000B
        PULR    R0                              ; 5799   02B0
        DECR    R0                              ; 579A   0010
        BNEQ    L_578E                          ; 579B   022C 000E

        MVII    #$0200, R3                      ; 579D   02BB 0200

        JSR     R5,     L_5223                  ; 579F   0004 0150 0223

        CLRR    R3                              ; 57A2   01DB
        MVO     R3,     G_017F                  ; 57A3   0243 017F
        PULR    R7                              ; 57A5   02B7

        PSHR    R5                              ; 57A6   0275
        J       L_5A14                          ; 57A7   0004 0358 0214

        MVII    #$00F0, R0                      ; 57AA   02B8 00F0
        MVII    #$0200, R4                      ; 57AC   02BC 0200
        J       X_FILL_ZERO                     ; 57AE   0004 0314 0338
        ADDR    R0,     R7                      ; 57B1   00C7

        SLL     R3,     2                       ; 57B2   004F
        RLC     R3,     1                       ; 57B3   0053
        RLC     R0,     1                       ; 57B4   0050
        MOVR    R7,     R3                      ; 57B5   00BB
        SLL     R3,     2                       ; 57B6   004F
        MOVR    R7,     R3                      ; 57B7   00BB
        SLL     R3,     2                       ; 57B8   004F
        MOVR    R7,     R3                      ; 57B9   00BB
        SLL     R3,     2                       ; 57BA   004F
        PSHR    R5                              ; 57BB   0275
        TSTR    R1                              ; 57BC   0089
        BNEQ    L_57C6                          ; 57BD   020C 0007

        CLRR    R1                              ; 57BF   01C9
        TSTR    R0                              ; 57C0   0080
        BMI     L_57C4                          ; 57C1   020B 0001

        INCR    R1                              ; 57C3   0009
L_57C4:
        MVO     R1,     G_0197                  ; 57C4   0241 0197
L_57C6:
        PULR    R7                              ; 57C6   02B7

        PSHR    R5                              ; 57C7   0275
        MVII    #$0197, R2                      ; 57C8   02BA 0197
        ADDR    R1,     R2                      ; 57CA   00CA
        MVI@    R2,     R2                      ; 57CB   0292
        TSTR    R2                              ; 57CC   0092
        BNEQ    L_57D1                          ; 57CD   020C 0002

        MVO     R0,     G_0193                  ; 57CF   0240 0193
L_57D1:
        TSTR    R0                              ; 57D1   0080
        DECLE   $020B,  $0010,  $0283,  $017F   ; 57D2   020B 0010 0283 017F
        DECLE   $009B,  $020C,  $0018,  $0092   ; 57D6   009B 020C 0018 0092
        DECLE   $020C,  $0016,  $0281,  $0182   ; 57DA   020C 0016 0281 0182
        DECLE   $0021,  $0004                   ; 57DE   0021 0004

        CMPR    R1,     R4                      ; 57E0   014C
        ADDR    R7,     R6                      ; 57E1   00FE
        B       L_57ED                          ; 57E2   0200 0009

        CLRR    R2                              ; 57E4   01D2
        MVII    #$0195, R3                      ; 57E5   02BB 0195
        ADDR    R1,     R3                      ; 57E7   00CB
        MVO@    R2,     R3                      ; 57E8   025A
        TSTR    R1                              ; 57E9   0089
L_57EA:
        BNEQ    L_57F1                          ; 57EA   020C 0005

        CLRR    R1                              ; 57EC   01C9
L_57ED:
        MVO     R1,     G_0105                  ; 57ED   0241 0105
        MVO     R2,     G_0109                  ; 57EF   0242 0109
L_57F1:
        PULR    R7                              ; 57F1   02B7

        MVII    #$0195, R2                      ; 57F2   02BA 0195
        ADDR    R1,     R2                      ; 57F4   00CA
        MVI@    R2,     R1                      ; 57F5   0291
        TSTR    R1                              ; 57F6   0089
        BNEQ    L_5804                          ; 57F7   020C 000B

        MVII    #$0334, R3                      ; 57F9   02BB 0334
        MVI@    R3,     R1                      ; 57FB   0299
        TSTR    R1                              ; 57FC   0089
        BEQ     L_5805                          ; 57FD   0204 0006

        INCR    R3                              ; 57FF   000B
        MVI@    R3,     R1                      ; 5800   0299
        TSTR    R1                              ; 5801   0089
        BEQ     L_5805                          ; 5802   0204 0001
L_5804:
        PULR    R7                              ; 5804   02B7

L_5805:
        MVI     G_0199, R5                      ; 5805   0285 0199
        DECLE   $00A9,  $00ED,  $00CD,  $0001   ; 5807   00A9 00ED 00CD 0001
        DECLE   $02FD,  $004A,  $0050,  $0001   ; 580B   02FD 004A 0050 0001
        DECLE   $02AC,  $02A9,  $0241,  $019E   ; 580F   02AC 02A9 0241 019E
        DECLE   $02B9,  $0001,  $0251,  $033B   ; 5813   02B9 0001 0251 033B
        DECLE   $0018,  $0273,  $0270,  $0004   ; 5817   0018 0273 0270 0004
        DECLE   $014C,  $00D4,  $02B0,  $02B9   ; 581B   014C 00D4 02B0 02B9
        DECLE   $0028,  $0004                   ; 581F   0028 0004

        CMPR    R1,     R4                      ; 5821   014C
        ADDR    R7,     R6                      ; 5822   00FE
        PULR    R3                              ; 5823   02B3
        PSHR    R1                              ; 5824   0271
        MVI     G_031B, R0                      ; 5825   0280 031B
        MVI     G_0323, R1                      ; 5827   0281 0323

        JSR     R5,     L_57EA                  ; 5829   0004 0154 03EA
        DECLE   $02B1,  $02FB,  $0020,  $02B8   ; 582C   02B1 02FB 0020 02B8
        DECLE   $0028,  $0258,  $033B,  $0343   ; 5830   0028 0258 033B 0343
        DECLE   $00DB,  $02FB,  $0126,  $0004   ; 5834   00DB 02FB 0126 0004

        CMPR    R1,     R4                      ; 5838   014C
        CMPR    R0,     R0                      ; 5839   0140
        MVII    #$0001, R0                      ; 583A   02B8 0001

        JSR     R5,     L_56E3                  ; 583C   0004 0154 02E3
        DECLE   $0280,  $019D,  $0080,  $020C   ; 583F   0280 019D 0080 020C
        DECLE   $0005,  $0004                   ; 5843   0005 0004

        CMPR    R1,     R4                      ; 5845   014C
        MOVR    R6,     R1                      ; 5846   00B1
        SWAP    R1,     1                       ; 5847   0041
        SLLC    R0,     2                       ; 5848   005C
        PULR    R7                              ; 5849   02B7

        DECR    R6                              ; 584A   0016
        RLC     R3,     1                       ; 584B   0053
        NEGR    R0                              ; 584C   0020
        NEGR    R2                              ; 584D   0022
        RLC     R3,     1                       ; 584E   0053
        SWAP    R0,     1                       ; 584F   0040
        ADCR    R6                              ; 5850   002E
        RLC     R3,     1                       ; 5851   0053
        DECR    R0                              ; 5852   0010
        PSHR    R5                              ; 5853   0275
        TSTR    R0                              ; 5854   0080
        BEQ     L_586F                          ; 5855   0204 0018

        MVI     G_035C, R2                      ; 5857   0282 035C
        TSTR    R2                              ; 5859   0092
        BEQ     L_5883                          ; 585A   0204 0027

        MVI     G_017F, R1                      ; 585C   0281 017F
        CMPI    #$000A, R1                      ; 585E   0379 000A
        BEQ     L_5875                          ; 5860   0204 0013

        CMPI    #$0002, R0                      ; 5862   0378 0002
        BGT     L_5876                          ; 5864   020E 0010

        DECR    R0                              ; 5866   0010
        CMPR    R1,     R0                      ; 5867   0148
        BEQ     L_5875                          ; 5868   0204 000B

        TSTR    R0                              ; 586A   0080
        BNEQ    L_5943                          ; 586B   020C 00D6
        B       L_5757                          ; 586D   0220 0117

L_586F:
        MVI     G_010B, R1                      ; 586F   0281 010B
        XORI    #$0003, R1                      ; 5871   03F9 0003
        MVO     R1,     G_010B                  ; 5873   0241 010B
L_5875:
        PULR    R7                              ; 5875   02B7

L_5876:
        CMPI    #$0007, R0                      ; 5876   0378 0007
        BLT     L_5875                          ; 5878   0225 0004

        CMPI    #$0009, R0                      ; 587A   0378 0009
        BGT     L_5875                          ; 587C   022E 0008

        SUBI    #$0007, R0                      ; 587E   0338 0007
        MVO     R0,     G_0199                  ; 5880   0240 0199
        PULR    R7                              ; 5882   02B7

L_5883:
        CMPI    #$0009, R0                      ; 5883   0378 0009
        BGT     L_5875                          ; 5885   022E 0011

        CMPI    #$0004, R0                      ; 5887   0378 0004
        BLT     L_5895                          ; 5889   0205 000A

        MVO     R0,     G_0183                  ; 588B   0240 0183
        CMPI    #$0007, R0                      ; 588D   0378 0007
        BLT     L_5893                          ; 588F   0205 0002

        SUBI    #$0003, R0                      ; 5891   0338 0003
L_5893:
        SUBI    #$0003, R0                      ; 5893   0338 0003
L_5895:
        MVO     R0,     G_035C                  ; 5895   0240 035C
        MVI     G_017D, R1                      ; 5897   0281 017D
        MVO     R1,     G_035E                  ; 5899   0241 035E
        CMPI    #$0003, R0                      ; 589B   0378 0003
        BNEQ    L_58DF                          ; 589D   020C 0040

        ADDI    #$0006, R1                      ; 589F   02F9 0006
        MVO     R1,     G_035C                  ; 58A1   0241 035C
        CLRR    R3                              ; 58A3   01DB
        SDBD                                    ; 58A4   0001
        MVII    #$5274, R4                      ; 58A5   02BC 0074 0052
L_58A8:
        SDBD                                    ; 58A8   0001
        MVI@    R4,     R1                      ; 58A9   02A1
        TSTR    R1                              ; 58AA   0089
        BEQ     L_58B8                          ; 58AB   0204 000B

        MVI@    R4,     R1                      ; 58AD   02A1
        ADDI    #$0002, R4                      ; 58AE   02FC 0002
        MVI@    R4,     R0                      ; 58B0   02A0

        JSR     R5,     X_RAND2                 ; 58B1   0004 0114 029E

        MVO@    R0,     R1                      ; 58B4   0248
        ADDR    R0,     R3                      ; 58B5   00C3
        B       L_58A8                          ; 58B6   0220 000F

L_58B8:
        SLL     R3,     2                       ; 58B8   004F
        MVO     R3,     G_035B                  ; 58B9   0243 035B
        MVI     G_0188, R1                      ; 58BB   0281 0188
        MVII    #$018F, R4                      ; 58BD   02BC 018F
        MOVR    R1,     R2                      ; 58BF   008A
        SLR     R2,     1                       ; 58C0   0062
        SUBR    R2,     R1                      ; 58C1   0111
        MVO@    R1,     R4                      ; 58C2   0261
        MVO@    R2,     R4                      ; 58C3   0262
        MVI     G_018B, R1                      ; 58C4   0281 018B
        MOVR    R1,     R2                      ; 58C6   008A
        SLR     R2,     1                       ; 58C7   0062
        SUBR    R2,     R1                      ; 58C8   0111
        MVO@    R1,     R4                      ; 58C9   0261
        MVO@    R2,     R4                      ; 58CA   0262
        MVII    #$003C, R0                      ; 58CB   02B8 003C

        JSR     R5,     X_RAND2                 ; 58CD   0004 0114 029E

        ADDI    #$0006, R0                      ; 58D0   02F8 0006
        MVO     R0,     G_0172                  ; 58D2   0240 0172
        MVII    #$000D, R0                      ; 58D4   02B8 000D

        JSR     R5,     X_RAND2                 ; 58D6   0004 0114 029E
        DECLE   $02F8,  $001B,  $0240,  $0171   ; 58D9   02F8 001B 0240 0171
        DECLE   $0200,  $0018                   ; 58DD   0200 0018
L_58DF:
        ADDR    R0,     R0                      ; 58DF   00C0
        SDBD                                    ; 58E0   0001
        ADDI    #$5239, R0                      ; 58E1   02F8 0039 0052
        MOVR    R0,     R5                      ; 58E4   0085
        SDBD                                    ; 58E5   0001
        MVI@    R5,     R4                      ; 58E6   02AC
        MVI@    R4,     R1                      ; 58E7   02A1
        MVO     R1,     G_035B                  ; 58E8   0241 035B
        MVII    #$0188, R1                      ; 58EA   02B9 0188
        MVII    #$000B, R0                      ; 58EC   02B8 000B

        JSR     R5,     .EXEC.730               ; 58EE   0004 0114 0330
        DECLE   $02A1,  $0241,  $0172,  $02A1   ; 58F1   02A1 0241 0172 02A1
        DECLE   $0241,  $0171,  $0004,  $0150   ; 58F5   0241 0171 0004 0150
        DECLE   $02A0                           ; 58F9   02A0

        SDBD                                    ; 58FA   0001
        MVII    #$521A, R5                      ; 58FB   02BD 001A 0052
        MVII    #$0184, R4                      ; 58FE   02BC 0184
        MVII    #$0003, R3                      ; 5900   02BB 0003
        MVI     G_0183, R1                      ; 5902   0281 0183
        TSTR    R1                              ; 5904   0089
        BEQ     L_590F                          ; 5905   0204 0008

        CMPI    #$0007, R1                      ; 5907   0379 0007
        BLT     L_590D                          ; 5909   0205 0002

        INCR    R5                              ; 590B   000D
        INCR    R0                              ; 590C   0008
L_590D:
        INCR    R5                              ; 590D   000D
        INCR    R0                              ; 590E   0008
L_590F:
        MVO     R0,     G_017C                  ; 590F   0240 017C
L_5911:
        MVI@    R5,     R0                      ; 5911   02A8
        MVO@    R0,     R4                      ; 5912   0260
        ADDI    #$0002, R5                      ; 5913   02FD 0002
        DECR    R3                              ; 5915   0013
        BNEQ    L_5911                          ; 5916   022C 0006

        CLRR    R1                              ; 5918   01C9
        MVO     R1,     G_034F                  ; 5919   0241 034F
        MVII    #$0001, R0                      ; 591B   02B8 0001
        B       L_5943                          ; 591D   0200 0024

L_591F:
        MVI     G_017F, R0                      ; 591F   0280 017F
        DECLE   $0378,  $000A,  $020C,  $0001   ; 5921   0378 000A 020C 0001
        DECLE   $02B7,  $0004,  $0150,  $02A0   ; 5925   02B7 0004 0150 02A0

        MVII    #$00FA, R1                      ; 5929   02B9 00FA
        SLL     R1,     2                       ; 592B   004D
L_592C:
        MVII    #$0004, R2                      ; 592C   02BA 0004
        SUBR    R0,     R2                      ; 592E   0102
        MOVR    R2,     R0                      ; 592F   0090

        JSR     R5,     X_MPY                   ; 5930   0004 011C 01DC

        ADD     G_035B, R2                      ; 5933   02C2 035B
        MVO     R2,     G_035B                  ; 5935   0242 035B
        MOVR    R4,     R0                      ; 5937   00A0
        MVII    #$00C8, R1                      ; 5938   02B9 00C8

        JSR     R5,     X_MPY                   ; 593A   0004 011C 01DC

        ADD     G_035B, R2                      ; 593D   02C2 035B
        MVO     R2,     G_035B                  ; 593F   0242 035B
        MVII    #$000A, R0                      ; 5941   02B8 000A
L_5943:
        MVI     G_031B, R1                      ; 5943   0281 031B
        SDBD                                    ; 5945   0001
        ANDI    #$FEFF, R1                      ; 5946   03B9 00FF 00FE
        MVO     R1,     G_031B                  ; 5949   0241 031B
        CLRR    R3                              ; 594B   01DB

        JSR     R5,     L_5223                  ; 594C   0004 0150 0223

        CLRR    R1                              ; 594F   01C9
        MVO     R1,     G_0194                  ; 5950   0241 0194
        MVO     R1,     G_0105                  ; 5952   0241 0105
        MVO     R1,     G_0109                  ; 5954   0241 0109
        MVI     G_0107, R2                      ; 5956   0282 0107
        MVO     R2,     G_017A                  ; 5958   0242 017A
        MVI     G_0103, R2                      ; 595A   0282 0103
        MVO     R2,     G_0179                  ; 595C   0242 0179
        MVO     R1,     G_0107                  ; 595E   0241 0107
        MVO     R1,     G_0103                  ; 5960   0241 0103
        MVO     R0,     G_017F                  ; 5962   0240 017F

        JSR     R5,     L_5B5F                  ; 5964   0004 0158 035F
        DECLE   $0004,  $014C,  $03AA,  $02B8   ; 5967   0004 014C 03AA 02B8
        DECLE   $0001,  $0240,  $017E,  $02BC   ; 596B   0001 0240 017E 02BC
        DECLE   $0163,  $0001,  $02B9,  $00E7   ; 596F   0163 0001 02B9 00E7
        DECLE   $004E,  $0261,  $0041,  $0261   ; 5973   004E 0261 0041 0261
        DECLE   $0001,  $02B8,  $001F,  $0008   ; 5977   0001 02B8 001F 0008
        DECLE   $02BC,  $0215,  $0260,  $0260   ; 597B   02BC 0215 0260 0260
        DECLE   $0260,  $02B9,  $000D,  $0241   ; 597F   0260 02B9 000D 0241
        DECLE   $01A1,  $02B9,  $0030,  $0241   ; 5983   01A1 02B9 0030 0241
        DECLE   $019F,  $02B9,  $0040,  $0241   ; 5987   019F 02B9 0040 0241
        DECLE   $01A2,  $0004,  $014C,  $00B9   ; 598B   01A2 0004 014C 00B9
        DECLE   $0095,  $005B,  $0001,  $02B9   ; 598F   0095 005B 0001 02B9
        DECLE   $003D,  $004F,  $02BC,  $0204   ; 5993   003D 004F 02BC 0204
        DECLE   $02BB,  $0005,  $0004           ; 5997   02BB 0005 0004

        CMPR    R1,     R4                      ; 599A   014C
        ADD@    R1,     R5                      ; 599B   02CD
        MVII    #$0224, R4                      ; 599C   02BC 0224
        MVI     G_035C, R0                      ; 599E   0280 035C
        MVII    #$0003, R1                      ; 59A0   02B9 0003

        JSR     R5,     X_PRNUM_RGT             ; 59A2   0004 0118 00C5
        DECLE   $02BC,  $0229,  $0001,  $02B9   ; 59A5   02BC 0229 0001 02B9
        DECLE   $00F6,  $0052,  $0004,  $014C   ; 59A9   00F6 0052 0004 014C
        DECLE   $02CD,  $00A9,  $02BC,  $023D   ; 59AD   02CD 00A9 02BC 023D
        DECLE   $0004                           ; 59B1   0004

        CMPR    R1,     R4                      ; 59B2   014C
        ADD@    R1,     R5                      ; 59B3   02CD
        MVII    #$0251, R4                      ; 59B4   02BC 0251
        MVI     G_017F, R1                      ; 59B6   0281 017F
        CMPI    #$000A, R1                      ; 59B8   0379 000A
        BNEQ    L_59BE                          ; 59BA   020C 0002

        ADDI    #$0008, R5                      ; 59BC   02FD 0008
L_59BE:
        MOVR    R5,     R1                      ; 59BE   00A9
        DECLE   $02BB,  $0007,  $0004           ; 59BF   02BB 0007 0004

        CMPR    R1,     R4                      ; 59C2   014C
        ADD@    R1,     R5                      ; 59C3   02CD
        ADDI    #$0005, R4                      ; 59C4   02FC 0005
        MVII    #$0004, R1                      ; 59C6   02B9 0004
        MVI     G_035B, R0                      ; 59C8   0280 035B

        JSR     R5,     X_PRNUM_RGT             ; 59CA   0004 0118 00C5

        MVI     G_017F, R1                      ; 59CD   0281 017F
        CMPI    #$000A, R1                      ; 59CF   0379 000A
        BNEQ    L_59DF                          ; 59D1   020C 000C

        MVI     G_017C, R0                      ; 59D3   0280 017C
        MVII    #$0087, R1                      ; 59D5   02B9 0087
        ADDI    #$0004, R4                      ; 59D7   02FC 0004
L_59D9:
        DECR    R0                              ; 59D9   0010
        BMI     L_59DF                          ; 59DA   020B 0003

        MVO@    R1,     R4                      ; 59DC   0261
        B       L_59D9                          ; 59DD   0220 0005

L_59DF:
        SDBD                                    ; 59DF   0001
        MVII    #$5274, R5                      ; 59E0   02BD 0074 0052
        MVII    #$0265, R4                      ; 59E3   02BC 0265
L_59E5:
        MVII    #$0005, R3                      ; 59E5   02BB 0005
        DECLE   $0001,  $02A9,  $0089,  $0204   ; 59E7   0001 02A9 0089 0204
        DECLE   $0018,  $0274,  $0275,  $0004   ; 59EB   0018 0274 0275 0004

        CMPR    R1,     R4                      ; 59EF   014C
        ADD@    R1,     R5                      ; 59F0   02CD
        PULR    R5                              ; 59F1   02B5
L_59F2:
        PULR    R4                              ; 59F2   02B4
        PSHR    R4                              ; 59F3   0274
        ADDI    #$000A, R4                      ; 59F4   02FC 000A
        MOVR    R5,     R3                      ; 59F6   00AB

        JSR     R5,     L_52CB                  ; 59F7   0004 0150 02CB

        PSHR    R3                              ; 59FA   0273

        JSR     R5,     L_52DF                  ; 59FB   0004 0150 02DF

        PULR    R5                              ; 59FE   02B5
L_59FF:
        PULR    R4                              ; 59FF   02B4
        ADDI    #$0014, R4                      ; 5A00   02FC 0014
        B       L_59E5                          ; 5A02   0220 001E

        DECLE   $0004,  $0150,  $02A0           ; 5A04   0004 0150 02A0

        MOVR    R0,     R2                      ; 5A07   0082
        MVII    #$0247, R4                      ; 5A08   02BC 0247

        JSR     R5,     L_52DF                  ; 5A0A   0004 0150 02DF
        DECLE   $0004,  $014C,  $0232           ; 5A0D   0004 014C 0232

        BC      L_5A19                          ; 5A10   0201 0007

        MVII    #$0006, R3                      ; 5A12   02BB 0006
L_5A14:
        MVII    #$0233, R4                      ; 5A14   02BC 0233
        DECLE   $0004                           ; 5A16   0004

        CMPR    R1,     R4                      ; 5A17   014C
        ADD@    R1,     R5                      ; 5A18   02CD
L_5A19:
        PULR    R7                              ; 5A19   02B7

        DECLE   $000A,  $0004,  $0000,  $000F   ; 5A1A   000A 0004 0000 000F
        DECLE   $0005,  $0001                   ; 5A1E   0005 0001

        RLC     R0,     1                       ; 5A20   0050
        ADCR    R0                              ; 5A21   0028
        COMR    R0                              ; 5A22   0018
        PSHR    R5                              ; 5A23   0275
        SLL     R3,     2                       ; 5A24   004F
        MVII    #$0333, R4                      ; 5A25   02BC 0333
        MVII    #$031B, R2                      ; 5A27   02BA 031B
        MVII    #$0008, R5                      ; 5A29   02BD 0008
L_5A2B:
        MVI@    R4,     R1                      ; 5A2B   02A1
        TSTR    R1                              ; 5A2C   0089
        BEQ     L_5A36                          ; 5A2D   0204 0007

        MVI@    R2,     R1                      ; 5A2F   0291
        SDBD                                    ; 5A30   0001
        ANDI    #$F5FF, R1                      ; 5A31   03B9 00FF 00F5
        XORR    R3,     R1                      ; 5A34   01D9
        MVO@    R1,     R2                      ; 5A35   0251
L_5A36:
        INCR    R2                              ; 5A36   000A
        DECR    R5                              ; 5A37   0015
        BNEQ    L_5A2B                          ; 5A38   022C 000E
        PULR    R7                              ; 5A3A   02B7

        DECLE   $003F,  $0052,  $004D,  $0052   ; 5A3B   003F 0052 004D 0052
        DECLE   $0190,  $000E,  $000A,  $0000   ; 5A3F   0190 000E 000A 0000
        DECLE   $0000,  $0000,  $0005,  $0001   ; 5A43   0000 0000 0005 0001
        DECLE   $0007,  $0007,  $0000,  $0000   ; 5A47   0007 0007 0000 0000
        DECLE   $000D,  $0026,  $012C,  $0016   ; 5A4B   000D 0026 012C 0016
        DECLE   $0013,  $0002,  $0004,  $0005   ; 5A4F   0013 0002 0004 0005
        DECLE   $0012,  $0002,  $000B,  $000B   ; 5A53   0012 0002 000B 000B
        DECLE   $0002,  $0002,  $003F           ; 5A57   0002 0002 003F
L_5A5A:
        DECR    R7                              ; 5A5A   0017
        ADDR    R5,     R7                      ; 5A5B   00EF

        DECLE   $01E4,  $0000,  $0000,  $0000   ; 5A5C   01E4 0000 0000 0000
        DECLE   $00C1,  $0132,  $0000,  $0000   ; 5A60   00C1 0132 0000 0000
        DECLE   $0000,  $0265,  $0249,  $01F5   ; 5A64   0000 0265 0249 01F5
        DECLE   $0260,  $0000,  $0072,  $0134   ; 5A68   0260 0000 0072 0134
        DECLE   $0123,  $002C,  $0000,  $0285   ; 5A6C   0123 002C 0000 0285
        DECLE   $024D,  $012E,  $002C,  $0000   ; 5A70   024D 012E 002C 0000
        DECLE   $00AE,  $004E,  $0188,  $0005   ; 5A74   00AE 004E 0188 0005
        DECLE   $000F,  $001A,  $00B7,  $004E   ; 5A78   000F 001A 00B7 004E
        DECLE   $018A,  $0001                   ; 5A7C   018A 0001

        EIS                                     ; 5A7E   0002
        DIS                                     ; 5A7F   0003
        MOVR    R6,     R1                      ; 5A80   00B1
        SLL     R2,     2                       ; 5A81   004E
L_5A82:
        ANDR    R1,     R1                      ; 5A82   0189
        DECLE   $0005                           ; 5A83   0005

        INCR    R7                              ; 5A84   000F

        DECR    R6                              ; 5A85   0016
L_5A86:
        MOVR    R7,     R4                      ; 5A86   00BC
        SLL     R2,     2                       ; 5A87   004E
        ANDR    R1,     R3                      ; 5A88   018B
        EIS                                     ; 5A89   0002
        DIS                                     ; 5A8A   0003
        CLRC                                    ; 5A8B   0006
        ADDR    R0,     R0                      ; 5A8C   00C0
        SLL     R2,     2                       ; 5A8D   004E
        ANDR    R1,     R4                      ; 5A8E   018C
L_5A8F:
        EIS                                     ; 5A8F   0002
        DIS                                     ; 5A90   0003
        CLRC                                    ; 5A91   0006
        MOVR    R3,     R7                      ; 5A92   009F

        DECLE   $004E,  $018E,  $0001,  $0002   ; 5A93   004E 018E 0001 0002
        DECLE   $0004,  $0002,  $0053,  $018D   ; 5A97   0004 0002 0053 018D
        DECLE   $0005,  $000E,  $0015,  $0000   ; 5A9B   0005 000E 0015 0000
        DECLE   $0000                           ; 5A9F   0000

        PSHR    R5                              ; 5AA0   0275
        SDBD                                    ; 5AA1   0001
        MVII    #$5274, R5                      ; 5AA2   02BD 0074 0052
        CLRR    R4                              ; 5AA5   01E4
        CLRR    R0                              ; 5AA6   01C0
L_5AA7:
        SDBD                                    ; 5AA7   0001
        MVI@    R5,     R1                      ; 5AA8   02A9
        TSTR    R1                              ; 5AA9   0089
        BEQ     L_5ABE                          ; 5AAA   0204 0012

L_5AAC:
        MOVR    R5,     R3                      ; 5AAC   00AB

        JSR     R5,     L_52CB                  ; 5AAD   0004 0150 02CB

        MOVR    R3,     R5                      ; 5AB0   009D
        CMPI    #$0004, R2                      ; 5AB1   037A 0004
        BNEQ    L_5AB7                          ; 5AB3   020C 0002

        ADDI    #$0006, R2                      ; 5AB5   02FA 0006
L_5AB7:
        ADDR    R2,     R0                      ; 5AB7   00D0
        TSTR    R2                              ; 5AB8   0092
        BNEQ    L_5AA7                          ; 5AB9   022C 0013

        INCR    R4                              ; 5ABB   000C
        B       L_5AA7                          ; 5ABC   0220 0016

L_5ABE:
        MOVR    R0,     R1                      ; 5ABE   0081
        MVII    #$0007, R2                      ; 5ABF   02BA 0007

        JSR     R5,     X_DIVR                  ; 5AC1   0004 011C 01F8

        CMPI    #$0004, R0                      ; 5AC4   0378 0004
        BLT     L_5ACA                          ; 5AC6   0205 0002

        MVII    #$0004, R0                      ; 5AC8   02B8 0004
L_5ACA:
        PULR    R7                              ; 5ACA   02B7

        PSHR    R5                              ; 5ACB   0275
        MOVR    R3,     R5                      ; 5ACC   009D
        MVI@    R5,     R1                      ; 5ACD   02A9
        MVI@    R1,     R1                      ; 5ACE   0289
        CLRR    R2                              ; 5ACF   01D2
        MOVR    R5,     R3                      ; 5AD0   00AB
        ADDI    #$0003, R3                      ; 5AD1   02FB 0003
        TSTR    R1                              ; 5AD3   0089
        BEQ     L_5ADE                          ; 5AD4   0204 0008

L_5AD6:
        INCR    R2                              ; 5AD6   000A
        CMPI    #$0004, R2                      ; 5AD7   037A 0004
        BEQ     L_5ADE                          ; 5AD9   0204 0003

        CMP@    R5,     R1                      ; 5ADB   0369
        BGT     L_5AD6                          ; 5ADC   022E 0007
L_5ADE:
        PULR    R7                              ; 5ADE   02B7

        DECLE   $0275,  $0093,  $0001,  $02FB   ; 5ADF   0275 0093 0001 02FB
        DECLE   $00F1,  $0052,  $029B,  $0091   ; 5AE3   00F1 0052 029B 0091
        DECLE   $004E,  $00D1,  $0001,  $02F9   ; 5AE7   004E 00D1 0001 02F9
        DECLE   $005B,  $0052,  $0004           ; 5AEB   005B 0052 0004

        CMPR    R1,     R4                      ; 5AEE   014C
        ADD@    R1,     R5                      ; 5AEF   02CD
        PULR    R7                              ; 5AF0   02B7

        DECLE   $0007,  $0001,  $0006,  $0002   ; 5AF1   0007 0001 0006 0002
        DECLE   $0004,  $018F,  $0061,  $0289   ; 5AF5   0004 018F 0061 0289
        DECLE   $01EE,  $0000,  $0274,  $0034   ; 5AF9   01EE 0000 0274 0034
        DECLE   $02B3,  $0000                   ; 5AFD   02B3 0000

        BESC    L_5DE6                          ; 5AFF   020F 02E5

        MVO     R0,     G_012E                  ; 5B01   0240 012E
        ADDR    R0,     R5                      ; 5B03   00C5
        RRC     R0,     2                       ; 5B04   0074
L_5B05:
        SUBR    R5,     R7                      ; 5B05   012F

        DECLE   $01C0,  $0049,  $018C,  $0000   ; 5B06   01C0 0049 018C 0000
        DECLE   $005B,  $0000,  $003B,  $0000   ; 5B0A   005B 0000 003B 0000
        DECLE   $0007,  $0000,  $006A,  $0053   ; 5B0E   0007 0000 006A 0053
        DECLE   $0020,  $0000,  $0000,  $0000   ; 5B12   0020 0000 0000 0000
        DECLE   $0000,  $0089,  $0000,  $0080   ; 5B16   0000 0089 0000 0080
        DECLE   $0007,  $0000,  $0072,  $0053   ; 5B1A   0007 0000 0072 0053
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5B1E   0010 0000 0000 0000
        DECLE   $0000,  $0089,  $0000,  $0080   ; 5B22   0000 0089 0000 0080
        DECLE   $0005,  $0000,  $0080,  $0053   ; 5B26   0005 0000 0080 0053
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5B2A   0010 0000 0000 0000
        DECLE   $0000,  $0089,  $0000,  $0080   ; 5B2E   0000 0089 0000 0080
        DECLE   $0007,  $0000,  $008A,  $0053   ; 5B32   0007 0000 008A 0053
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5B36   0010 0000 0000 0000
        DECLE   $0000,  $0089,  $0000,  $0080   ; 5B3A   0000 0089 0000 0080
        DECLE   $0007,  $0000,  $0092,  $0053   ; 5B3E   0007 0000 0092 0053
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5B42   0010 0000 0000 0000
        DECLE   $0000,  $0089,  $0000,  $0080   ; 5B46   0000 0089 0000 0080
        DECLE   $0003,  $0010,  $00A0,  $0053   ; 5B4A   0003 0010 00A0 0053
        DECLE   $0010,  $0000,  $00C2,  $0001   ; 5B4E   0010 0000 00C2 0001
        DECLE   $0000,  $0089,  $0000,  $0080   ; 5B52   0000 0089 0000 0080
        DECLE   $0006,  $0010,  $00A6,  $0053   ; 5B56   0006 0010 00A6 0053
        DECLE   $0020,  $0000,  $0000,  $0000   ; 5B5A   0020 0000 0000 0000
        DECLE   $0000                           ; 5B5E   0000
L_5B5F:
        TSTR    R1                              ; 5B5F   0089
        DECLE   $0000,  $0080,  $0000,  $0010   ; 5B60   0000 0080 0000 0010
        DECLE   $00AE,  $0053,  $0010,  $0000   ; 5B64   00AE 0053 0010 0000
        DECLE   $0040,  $0000,  $0000,  $0000   ; 5B68   0040 0000 0000 0000

        MOVR    R6,     R4                      ; 5B6C   00B4
        RLC     R3,     1                       ; 5B6D   0053
        EIS                                     ; 5B6E   0002
        SUBR    R0,     R0                      ; 5B6F   0100
        ADDR    R1,     R1                      ; 5B70   00C9
        RLC     R0,     2                       ; 5B71   0054
        RRC     R0,     2                       ; 5B72   0074
        RLC     R0,     2                       ; 5B73   0054
        ADDR    R0,     R4                      ; 5B74   00C4
        RLC     R3,     1                       ; 5B75   0053
        EIS                                     ; 5B76   0002
L_5B77:
        ANDR    R3,     R0                      ; 5B77   0198
        ADDR    R7,     R2                      ; 5B78   00FA
        RLC     R1,     2                       ; 5B79   0055
        ADDR    R7,     R2                      ; 5B7A   00FA
L_5B7B:
        RLC     R1,     2                       ; 5B7B   0055
        MOVR    R5,     R7                      ; 5B7C   00AF

        RLC     R1,     2                       ; 5B7D   0055
        MOVR    R0,     R6                      ; 5B7E   0086
        RLC     R1,     2                       ; 5B7F   0055
        RRC     R0,     2                       ; 5B80   0074
L_5B81:
        RLC     R0,     2                       ; 5B81   0054
        ADDR    R2,     R4                      ; 5B82   00D4
        RLC     R3,     1                       ; 5B83   0053
        EIS                                     ; 5B84   0002
        SLR     R0,     1                       ; 5B85   0060
        ADDR    R6,     R4                      ; 5B86   00F4
L_5B87:
        RLC     R1,     2                       ; 5B87   0055
        DECLE   $00F4,  $0055,  $0074,  $0054   ; 5B88   00F4 0055 0074 0054
        DECLE   $00E4,  $0053,  $0001,  $0010   ; 5B8C   00E4 0053 0001 0010
        DECLE   $0010,  $0056,  $0085,  $0054   ; 5B90   0010 0056 0085 0054
        DECLE   $000C,  $0054,  $0004,  $0001   ; 5B94   000C 0054 0004 0001
        DECLE   $0018,  $0056,  $0074,  $0054   ; 5B98   0018 0056 0074 0054
        DECLE   $00EC,  $0053,  $0004,  $0000   ; 5B9C   00EC 0053 0004 0000
        DECLE   $0074,  $0054,  $005C,  $0054   ; 5BA0   0074 0054 005C 0054
        DECLE   $0003,  $0000,  $0085,  $0054   ; 5BA4   0003 0000 0085 0054
        DECLE   $0044,  $0054,  $0003,  $0001   ; 5BA8   0044 0054 0003 0001
        DECLE   $0018,  $0056,  $009A,  $0054   ; 5BAC   0018 0056 009A 0054
        DECLE   $002C,  $0054,  $0003,  $0000   ; 5BB0   002C 0054 0003 0000
        DECLE   $0040,  $00E0,  $0040,  $0000   ; 5BB4   0040 00E0 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BB8   0000 0000 0000 0000
        DECLE   $0040,  $00A0,  $0040,  $0000   ; 5BBC   0040 00A0 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BC0   0000 0000 0000 0000
        DECLE   $0080,  $00E0,  $0020,  $0000   ; 5BC4   0080 00E0 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BC8   0000 0000 0000 0000
        DECLE   $0060,  $0040,  $0040,  $00C0   ; 5BCC   0060 0040 0040 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BD0   0000 0000 0000 0000
        DECLE   $0028,  $0010,  $0028,  $0000   ; 5BD4   0028 0010 0028 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BD8   0000 0000 0000 0000
        DECLE   $0010,  $0028,  $0010,  $0000   ; 5BDC   0010 0028 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BE0   0000 0000 0000 0000
        DECLE   $0038,  $0044,  $00BA,  $00AA   ; 5BE4   0038 0044 00BA 00AA
        DECLE   $00BA,  $00AA,  $0044,  $0038   ; 5BE8   00BA 00AA 0044 0038
        DECLE   $0000,  $0000,  $0024,  $0018   ; 5BEC   0000 0000 0024 0018
        DECLE   $0018,  $0024,  $0000,  $0000   ; 5BF0   0018 0024 0000 0000
        DECLE   $0000,  $0042,  $0024,  $0000   ; 5BF4   0000 0042 0024 0000
        DECLE   $0000,  $0024,  $0042,  $0000   ; 5BF8   0000 0024 0042 0000
        DECLE   $0081,  $0042,  $0000,  $0081   ; 5BFC   0081 0042 0000 0081
        DECLE   $0042,  $0000,  $0042,  $0081   ; 5C00   0042 0000 0042 0081
        DECLE   $0081,  $0000,  $0000,  $0000   ; 5C04   0081 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0081   ; 5C08   0000 0000 0000 0081
        DECLE   $0022,  $007F,  $007F,  $00F6   ; 5C0C   0022 007F 007F 00F6
        DECLE   $0077,  $003E,  $001E,  $000C   ; 5C10   0077 003E 001E 000C
        DECLE   $002A,  $007F,  $007F,  $00F7   ; 5C14   002A 007F 007F 00F7
        DECLE   $007F,  $007E,  $003F,  $000E   ; 5C18   007F 007E 003F 000E
        DECLE   $0022,  $00FD,  $007F,  $00E6   ; 5C1C   0022 00FD 007F 00E6
        DECLE   $007F,  $003E,  $003F,  $000A   ; 5C20   007F 003E 003F 000A
        DECLE   $0002,  $003D,  $007F,  $00F6   ; 5C24   0002 003D 007F 00F6
        DECLE   $007F,  $007F,  $007F,  $0002   ; 5C28   007F 007F 007F 0002
        DECLE   $0036,  $0094,  $00FC,  $0029   ; 5C2C   0036 0094 00FC 0029
        DECLE   $00FF,  $00B8,  $002C,  $0066   ; 5C30   00FF 00B8 002C 0066
        DECLE   $0067,  $00BC,  $00FC,  $007D   ; 5C34   0067 00BC 00FC 007D
        DECLE   $006E,  $007C,  $00BC,  $0066   ; 5C38   006E 007C 00BC 0066
        DECLE   $0073,  $003E,  $00FD,  $00F7   ; 5C3C   0073 003E 00FD 00F7
        DECLE   $006F,  $00FC,  $00FE,  $00D3   ; 5C40   006F 00FC 00FE 00D3
        DECLE   $003C,  $0042,  $007E,  $0099   ; 5C44   003C 0042 007E 0099
        DECLE   $003C,  $0054,  $0024,  $0024   ; 5C48   003C 0054 0024 0024
        DECLE   $003C,  $00A5,  $007E,  $0018   ; 5C4C   003C 00A5 007E 0018
        DECLE   $003C,  $005A,  $003C,  $0018   ; 5C50   003C 005A 003C 0018
        DECLE   $0018,  $005A,  $007E,  $0018   ; 5C54   0018 005A 007E 0018
        DECLE   $003C,  $005A,  $003C,  $0018   ; 5C58   003C 005A 003C 0018
        DECLE   $003C,  $0018,  $00FF,  $003C   ; 5C5C   003C 0018 00FF 003C
        DECLE   $00FF                           ; 5C60   00FF

        RSWD    R4                              ; 5C61   003C
        SARC    R2,     2                       ; 5C62   007E
        NEGR    R4                              ; 5C63   0024
        RSWD    R4                              ; 5C64   003C
        MOVR    R3,     R1                      ; 5C65   0099
        SARC    R2,     2                       ; 5C66   007E
        MOVR    R7,     R5                      ; 5C67   00BD
        SARC    R2,     2                       ; 5C68   007E
        RSWD    R4                              ; 5C69   003C
        SARC    R2,     2                       ; 5C6A   007E
        COMR    R0                              ; 5C6B   0018
        MOVR    R3,     R1                      ; 5C6C   0099
        SLLC    R2,     1                       ; 5C6D   005A
        MOVR    R7,     R5                      ; 5C6E   00BD
        SARC    R2,     2                       ; 5C6F   007E
        RSWD    R4                              ; 5C70   003C
        SARC    R2,     2                       ; 5C71   007E
        RSWD    R4                              ; 5C72   003C
        COMR    R0                              ; 5C73   0018
        MOVR    R3,     R1                      ; 5C74   0099
        ADDI    #$0343, R1                      ; 5C75   02F9 0343
        MVI@    R1,     R1                      ; 5C77   0289
        TSTR    R1                              ; 5C78   0089
        BEQ     L_5C7C                          ; 5C79   0204 0001
        MOVR    R5,     R7                      ; 5C7B   00AF

L_5C7C:
        MVII    #$031B, R2                      ; 5C7C   02BA 031B
        ADDR    R3,     R2                      ; 5C7E   00DA
        CLRR    R0                              ; 5C7F   01C0
        MVO@    R0,     R2                      ; 5C80   0250
        ADDI    #$0018, R2                      ; 5C81   02FA 0018
        MVO@    R0,     R2                      ; 5C83   0250
        MOVR    R5,     R7                      ; 5C84   00AF

        DECLE   $0275,  $009C,  $02FC,  $031B   ; 5C85   0275 009C 02FC 031B
        DECLE   $0281,  $0187,  $004D,  $02F9   ; 5C89   0281 0187 004D 02F9
        DECLE   $0010,  $0282,  $031B,  $03BA   ; 5C8D   0010 0282 031B 03BA
        DECLE   $00FF,  $0283,  $0323,  $03BB   ; 5C91   00FF 0283 0323 03BB
        DECLE   $007F,  $0004                   ; 5C95   007F 0004

        CMPR    R1,     R4                      ; 5C97   014C
        CMPR    R3,     R3                      ; 5C98   015B
        PULR    R7                              ; 5C99   02B7

        MVI     G_0186, R0                      ; 5C9A   0280 0186
        MVO     R0,     G_034A                  ; 5C9C   0240 034A
        MVI     G_017B, R0                      ; 5C9E   0280 017B
        CMPI    #$0004, R0                      ; 5CA0   0378 0004
        BEQ     L_5CC0                          ; 5CA2   0204 001C

        INCR    R0                              ; 5CA4   0008
        MVO     R0,     G_017B                  ; 5CA5   0240 017B
        DECR    R0                              ; 5CA7   0010
        SLL     R0,     1                       ; 5CA8   0048
        SDBD                                    ; 5CA9   0001
        MVII    #$54C1, R4                      ; 5CAA   02BC 00C1 0054
        ADDR    R0,     R4                      ; 5CAD   00C4
        MVI     G_0322, R1                      ; 5CAE   0281 0322
        ANDI    #$00FF, R1                      ; 5CB0   03B9 00FF
        SWAP    R1,     1                       ; 5CB2   0041
        XOR@    R4,     R1                      ; 5CB3   03E1
        SWAP    R1,     1                       ; 5CB4   0041
        MVO     R1,     G_0322                  ; 5CB5   0241 0322
        MVI     G_032A, R1                      ; 5CB7   0281 032A
        ANDI    #$007F, R1                      ; 5CB9   03B9 007F
        SWAP    R1,     1                       ; 5CBB   0041
        XOR@    R4,     R1                      ; 5CBC   03E1
        SWAP    R1,     1                       ; 5CBD   0041
        MVO     R1,     G_032A                  ; 5CBE   0241 032A
L_5CC0:
        MOVR    R5,     R7                      ; 5CC0   00AF

        DECLE   $0089,  $0080,  $008D,  $0080   ; 5CC1   0089 0080 008D 0080
        DECLE   $008D,  $0081,  $008D,  $0082   ; 5CC5   008D 0081 008D 0082
        DECLE   $0275,  $02BB,  $0000,  $0004   ; 5CC9   0275 02BB 0000 0004

        CMPR    R2,     R4                      ; 5CCD   0154
        MVI@    R5,     R7                      ; 5CCE   02AF

        MVI@    R4,     R1                      ; 5CCF   02A1
        ANDI    #$0007, R1                      ; 5CD0   03B9 0007
        CMPI    #$0002, R1                      ; 5CD2   0379 0002
        BNEQ    L_5CDA                          ; 5CD4   020C 0004

        MVII    #$0032, R1                      ; 5CD6   02B9 0032
        B       L_5CF0                          ; 5CD8   0200 0016

L_5CDA:
        MVII    #$0001, R0                      ; 5CDA   02B8 0001
        MVO     R0,     G_019B                  ; 5CDC   0240 019B
        CMPI    #$0000, R1                      ; 5CDE   0379 0000
        BNEQ    L_5CE6                          ; 5CE0   020C 0004

        MVII    #$000A, R1                      ; 5CE2   02B9 000A
        B       L_5CF0                          ; 5CE4   0200 000A

L_5CE6:
        CMPI    #$0007, R1                      ; 5CE6   0379 0007
        BNEQ    L_5CEE                          ; 5CE8   020C 0004

        MVII    #$0005, R1                      ; 5CEA   02B9 0005
        B       L_5CF0                          ; 5CEC   0200 0002

L_5CEE:
        MVII    #$000F, R1                      ; 5CEE   02B9 000F
L_5CF0:
        MVO     R1,     G_0182                  ; 5CF0   0241 0182
        DECLE   $0280,  $0193,  $0378,  $00FF   ; 5CF2   0280 0193 0378 00FF
        DECLE   $0204,  $0003,  $0004           ; 5CF6   0204 0003 0004

        CMPR    R1,     R4                      ; 5CF9   014C
        XOR@    R3,     R4                      ; 5CFA   03DC
        PULR    R7                              ; 5CFB   02B7

        PSHR    R5                              ; 5CFC   0275
        MVI     G_035C, R0                      ; 5CFD   0280 035C
        TSTR    R0                              ; 5CFF   0080
        BNEQ    L_5D0D                          ; 5D00   020C 000B

        MVI     G_017D, R0                      ; 5D02   0280 017D
        INCR    R0                              ; 5D04   0008
        CMPI    #$00C2, R0                      ; 5D05   0378 00C2
        BLT     L_5D0A                          ; 5D07   0205 0001

        CLRR    R0                              ; 5D09   01C0
L_5D0A:
        MVO     R0,     G_017D                  ; 5D0A   0240 017D
        PULR    R7                              ; 5D0C   02B7

L_5D0D:
        MVI     G_0171, R0                      ; 5D0D   0280 0171
        MVI     G_0172, R2                      ; 5D0F   0282 0172
        SDBD                                    ; 5D11   0001
        MVII    #$557B, R5                      ; 5D12   02BD 007B 0055
L_5D15:
        MVI@    R5,     R1                      ; 5D15   02A9
        DECLE   $0089,  $0204,  $0013,  $0141   ; 5D16   0089 0204 0013 0141
        DECLE   $020C,  $000D,  $02A9,  $0151   ; 5D1A   020C 000D 02A9 0151
        DECLE   $022C,  $000A,  $0280,  $035B   ; 5D1E   022C 000A 0280 035B
        DECLE   $02F8,  $00C8,  $0240,  $035B   ; 5D22   02F8 00C8 0240 035B
        DECLE   $0004,  $0350,  $011F           ; 5D26   0004 0350 011F

        INCR    R5                              ; 5D29   000D
        B       L_5D15                          ; 5D2A   0220 0016

        MVI     G_0353, R3                      ; 5D2C   0283 0353
        ANDI    #$0100, R3                      ; 5D2E   03BB 0100
        BNEQ    L_5D6F                          ; 5D30   020C 003D

        MVII    #$0000, R3                      ; 5D32   02BB 0000

        JSR     R5,     L_5570                  ; 5D34   0004 0154 0170
        DECLE   $020C,  $0006,  $01C0,  $0240   ; 5D37   020C 0006 01C0 0240
        DECLE   $035B,  $0004,  $0350,  $011F   ; 5D3B   035B 0004 0350 011F

        CMPI    #$0014, R1                      ; 5D3F   0379 0014
        BNEQ    L_5D47                          ; 5D41   020C 0004

        MVII    #$001E, R1                      ; 5D43   02B9 001E
        B       L_5CF0                          ; 5D45   0220 0056

L_5D47:
        CMPI    #$0004, R1                      ; 5D47   0379 0004
        BNEQ    L_5D4F                          ; 5D49   020C 0004

        MVII    #$0032, R1                      ; 5D4B   02B9 0032
        B       L_5CF0                          ; 5D4D   0220 005E

L_5D4F:
        CMPI    #$0036, R1                      ; 5D4F   0379 0036
        BNEQ    L_5D57                          ; 5D51   020C 0004

        MVII    #$0032, R1                      ; 5D53   02B9 0032
        B       L_5CF0                          ; 5D55   0220 0066

L_5D57:
        MVII    #$0001, R0                      ; 5D57   02B8 0001
        MVO     R0,     G_019B                  ; 5D59   0240 019B
        CMPI    #$0000, R1                      ; 5D5B   0379 0000
        BNEQ    L_5D63                          ; 5D5D   020C 0004

        MVII    #$000A, R1                      ; 5D5F   02B9 000A
        B       L_5CF0                          ; 5D61   0220 0072

L_5D63:
        CMPI    #$0026, R1                      ; 5D63   0379 0026
        BNEQ    L_5D6B                          ; 5D65   020C 0004

        MVII    #$0005, R1                      ; 5D67   02B9 0005
        B       L_5CF0                          ; 5D69   0220 007A

L_5D6B:
        MVII    #$000F, R1                      ; 5D6B   02B9 000F
        B       L_5CF0                          ; 5D6D   0220 007E
L_5D6F:
        PULR    R7                              ; 5D6F   02B7

        DECLE   $0275,  $0004                   ; 5D70   0275 0004

        CMPR    R2,     R4                      ; 5D72   0154
        MVI@    R5,     R7                      ; 5D73   02AF

        MVI@    R4,     R1                      ; 5D74   02A1
        SWAP    R1,     1                       ; 5D75   0041
        ANDI    #$0036, R1                      ; 5D76   03B9 0036
        CMPI    #$0012, R1                      ; 5D78   0379 0012
        PULR    R7                              ; 5D7A   02B7

        ADCR    R1                              ; 5D7B   0029
        INCR    R7                              ; 5D7C   000F

        ADCR    R4                              ; 5D7D   002C
L_5D7E:
        DECR    R4                              ; 5D7E   0014
        DECLE   $002D,  $0014,  $002B,  $0016   ; 5D7F   002D 0014 002B 0016
        DECLE   $000F,  $0013,  $0000,  $0275   ; 5D83   000F 0013 0000 0275
        DECLE   $0093,  $0272,  $0004           ; 5D87   0093 0272 0004

        CMPR    R2,     R4                      ; 5D8A   0154
        MVI@    R5,     R7                      ; 5D8B   02AF

        DECLE   $00A2,  $0295,  $0001,  $02BC   ; 5D8C   00A2 0295 0001 02BC
        DECLE   $0082,  $0059,  $0001,  $02A0   ; 5D90   0082 0059 0001 02A0
        DECLE   $0080,  $0204,  $0016,  $02FC   ; 5D94   0080 0204 0016 02FC
        DECLE   $0006,  $0001,  $02A0,  $0145   ; 5D98   0006 0001 02A0 0145
        DECLE   $022C,  $000B,  $033C,  $0007   ; 5D9C   022C 000B 033C 0007
        DECLE   $0272,  $0004,  $0154,  $021D   ; 5DA0   0272 0004 0154 021D

        SDBD                                    ; 5DA4   0001
        MVI@    R4,     R0                      ; 5DA5   02A0
        PULR    R1                              ; 5DA6   02B1
        MVO@    R0,     R1                      ; 5DA7   0248
        PULR    R3                              ; 5DA8   02B3

        JSR     R5,     L_5667                  ; 5DA9   0004 0154 0267

        PULR    R7                              ; 5DAC   02B7

        PULR    R2                              ; 5DAD   02B2
        PULR    R7                              ; 5DAE   02B7

        SDBD                                    ; 5DAF   0001
        MVII    #$59DF, R4                      ; 5DB0   02BC 00DF 0059
L_5DB3:
        PSHR    R5                              ; 5DB3   0275
        MOVR    R1,     R3                      ; 5DB4   008B
        ADDI    #$0333, R3                      ; 5DB5   02FB 0333
        MVI@    R3,     R3                      ; 5DB7   029B
        TSTR    R3                              ; 5DB8   009B
        BEQ     L_5DE6                          ; 5DB9   0204 002B

        CMPI    #$0007, R1                      ; 5DBB   0379 0007
        BNEQ    L_5DC6                          ; 5DBD   020C 0007

        MVI     G_017B, R0                      ; 5DBF   0280 017B
        DECR    R0                              ; 5DC1   0010
        MVO     R0,     G_017B                  ; 5DC2   0240 017B
        BNEQ    L_5DE7                          ; 5DC4   020C 0021

L_5DC6:
        PSHR    R2                              ; 5DC6   0272
        DECLE   $0271,  $0274,  $008B,  $0004   ; 5DC7   0271 0274 008B 0004

        CMPR    R2,     R4                      ; 5DCB   0154
        MVI@    R5,     R7                      ; 5DCC   02AF

        DECLE   $02B4,  $0004,  $0154,  $021D   ; 5DCD   02B4 0004 0154 021D

        PULR    R3                              ; 5DD1   02B3
L_5DD2:
        MOVR    R3,     R5                      ; 5DD2   009D
        ADDI    #$031B, R5                      ; 5DD3   02FD 031B
        MVI@    R5,     R0                      ; 5DD5   02A8
        MVO     R0,     G_0175                  ; 5DD6   0240 0175
        ADDI    #$0007, R5                      ; 5DD8   02FD 0007
        MVI@    R5,     R0                      ; 5DDA   02A8
        ANDI    #$007F, R0                      ; 5DDB   03B8 007F
        MVO     R0,     G_0176                  ; 5DDD   0240 0176

        JSR     R5,     L_547C                  ; 5DDF   0004 0154 007C

        PULR    R3                              ; 5DE2   02B3

        JSR     R5,     L_5667                  ; 5DE3   0004 0154 0267

L_5DE6:
        PULR    R7                              ; 5DE6   02B7

L_5DE7:
        PSHR    R0                              ; 5DE7   0270
        MOVR    R2,     R3                      ; 5DE8   0093

        JSR     R5,     L_547C                  ; 5DE9   0004 0154 007C

        PULR    R0                              ; 5DEC   02B0
        DECR    R0                              ; 5DED   0010
        MVO     R0,     G_017B                  ; 5DEE   0240 017B

        JSR     R5,     L_549A                  ; 5DF0   0004 0154 009A

        PULR    R7                              ; 5DF3   02B7

        SDBD                                    ; 5DF4   0001
        MVII    #$59EB, R4                      ; 5DF5   02BC 00EB 0059
        B       L_5DB3                          ; 5DF8   0220 0046

        SDBD                                    ; 5DFA   0001
        MVII    #$5392, R0                      ; 5DFB   02B8 0092 0053
        CLRR    R4                              ; 5DFE   01E4
L_5DFF:
        PSHR    R5                              ; 5DFF   0275
        PSHR    R2                              ; 5E00   0272
        MOVR    R1,     R3                      ; 5E01   008B
        ADDI    #$0333, R1                      ; 5E02   02F9 0333
        MVI@    R1,     R1                      ; 5E04   0289
        CMPR    R0,     R1                      ; 5E05   0141
        BNEQ    L_5E0E                          ; 5E06   020C 0006

        ADD     G_035B, R4                      ; 5E08   02C4 035B
        MVO     R4,     G_035B                  ; 5E0A   0244 035B
        B       L_5DD2                          ; 5E0C   0220 003B

L_5E0E:
        PULR    R2                              ; 5E0E   02B2
        PULR    R7                              ; 5E0F   02B7

        SDBD                                    ; 5E10   0001
        MVII    #$53A6, R0                      ; 5E11   02B8 00A6 0053
        MVII    #$0004, R4                      ; 5E14   02BC 0004
        B       L_5DFF                          ; 5E16   0220 0018

        MVII    #$0001, R0                      ; 5E18   02B8 0001
        J       L_56E3                          ; 5E1A   0004 0354 02E3

        DECLE   $0275,  $0280,  $0177,  $0281   ; 5E1D   0275 0280 0177 0281
        DECLE   $0178,  $0004,  $0158,  $0159   ; 5E21   0178 0004 0158 0159
        DECLE   $0018,  $0388,  $033C,  $0006   ; 5E25   0018 0388 033C 0006
        DECLE   $0274,  $033C,  $0002,  $0348   ; 5E29   0274 033C 0002 0348
        DECLE   $0204,  $0023,  $02FC,  $0002   ; 5E2D   0204 0023 02FC 0002
        DECLE   $0248,  $02A1,  $008A,  $028B   ; 5E31   0248 02A1 008A 028B
        DECLE   $009B,  $0204,  $0018,  $0013   ; 5E35   009B 0204 0018 0013
        DECLE   $0280,  $0177,  $0004           ; 5E39   0280 0177 0004

        CMPR    R2,     R4                      ; 5E3C   0154
        XOR     .IV.ALD,R5                      ; 5E3D   03C5 0080
        BEQ     L_5E4F                          ; 5E3F   0204 000E

        MVI@    R1,     R5                      ; 5E41   028D
        TSTR    R5                              ; 5E42   00AD
        BNEQ    L_5E4B                          ; 5E43   020C 0006

        CMPI    #$0002, R0                      ; 5E45   0378 0002
        BNEQ    L_5E50                          ; 5E47   020C 0007
        B       L_5E4E                          ; 5E49   0200 0003

L_5E4B:
        MOVR    R5,     R0                      ; 5E4B   00A8
        DECR    R0                              ; 5E4C   0010
        MVO@    R0,     R1                      ; 5E4D   0248
L_5E4E:
        MOVR    R2,     R1                      ; 5E4E   0091
L_5E4F:
        MVO@    R3,     R1                      ; 5E4F   024B
L_5E50:
        SUBI    #$0003, R4                      ; 5E50   033C 0003
        PULR    R1                              ; 5E52   02B1
        MVI@    R1,     R1                      ; 5E53   0289
        SUBI    #$0188, R1                      ; 5E54   0339 0188
        SDBD                                    ; 5E56   0001
        ADDI    #$5660, R1                      ; 5E57   02F9 0060 0056
        MVI     G_035B, R5                      ; 5E5A   0285 035B
        ADD@    R1,     R5                      ; 5E5C   02CD
        MVO     R5,     G_035B                  ; 5E5D   0245 035B
        PULR    R7                              ; 5E5F   02B7

        DECLE   $0001,  $0001,  $0001,  $0001   ; 5E60   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0004,  $0275   ; 5E64   0001 0001 0004 0275
        DECLE   $0273,  $00DB,  $02FB,  $0126   ; 5E68   0273 00DB 02FB 0126
        DECLE   $0004                           ; 5E6C   0004

        CMPR    R1,     R4                      ; 5E6D   014C
        SUBR    R7,     R6                      ; 5E6E   013E
        PULR    R2                              ; 5E6F   02B2
        ADDI    #$0343, R2                      ; 5E70   02FA 0343
        MVII    #$003C, R0                      ; 5E72   02B8 003C
        MVO@    R0,     R2                      ; 5E74   0250
        SUBI    #$0010, R2                      ; 5E75   033A 0010
        SDBD                                    ; 5E77   0001
        MVII    #$539A, R0                      ; 5E78   02B8 009A 0053
        MVO@    R0,     R2                      ; 5E7B   0250
        SUBI    #$0018, R2                      ; 5E7C   033A 0018
        SDBD                                    ; 5E7E   0001
        MVII    #$FE00, R0                      ; 5E7F   02B8 0000 00FE
        AND@    R2,     R0                      ; 5E82   0390
        XOR     G_0175, R0                      ; 5E83   03C0 0175
        MVO@    R0,     R2                      ; 5E85   0250
        ADDI    #$0008, R2                      ; 5E86   02FA 0008
        SDBD                                    ; 5E88   0001
        MVII    #$FF80, R0                      ; 5E89   02B8 0080 00FF
        AND@    R2,     R0                      ; 5E8C   0390
        XOR     G_0176, R0                      ; 5E8D   03C0 0176
        ADDI    #$0002, R0                      ; 5E8F   02F8 0002
        MVO@    R0,     R2                      ; 5E91   0250

        JSR     R5,     L_5B7B                  ; 5E92   0004 0158 037B

        ANDI    #$003E, R0                      ; 5E95   03B8 003E
        MVO     R0,     .PSG0.chan_enable       ; 5E97   0240 01F8
        CLRR    R0                              ; 5E99   01C0
        MVO     R0,     .PSG0.envelope          ; 5E9A   0240 01FA
        INCR    R0                              ; 5E9C   0008
        MVO     R0,     .PSG0.chn_a_hi          ; 5E9D   0240 01F4
        MVO     R0,     G_0145                  ; 5E9F   0240 0145
        NEGR    R0                              ; 5EA1   0020
        MVO     R0,     .PSG0.chn_a_lo          ; 5EA2   0240 01F0
        MVII    #$0030, R0                      ; 5EA4   02B8 0030
        MVO     R0,     .PSG0.envlp_hi          ; 5EA6   0240 01F7
        MVO     R0,     .PSG0.chn_a_vol         ; 5EA8   0240 01FB
        MVII    #$003C, R0                      ; 5EAA   02B8 003C
        MVO     R0,     G_019D                  ; 5EAC   0240 019D
        PULR    R7                              ; 5EAE   02B7

        PSHR    R5                              ; 5EAF   0275
        ADDI    #$031B, R3                      ; 5EB0   02FB 031B
        MVII    #$00FF, R1                      ; 5EB2   02B9 00FF
        MVI@    R3,     R0                      ; 5EB4   0298
        ANDR    R1,     R0                      ; 5EB5   0188
        SUBI    #$0008, R0                      ; 5EB6   0338 0008
        BPL     L_5EBB                          ; 5EB8   0203 0001

        CLRR    R0                              ; 5EBA   01C0
L_5EBB:
        SLR     R0,     2                       ; 5EBB   0064
        SLR     R0,     1                       ; 5EBC   0060
        ADDI    #$0008, R3                      ; 5EBD   02FB 0008
        SLR     R1,     1                       ; 5EBF   0061
        MOVR    R0,     R4                      ; 5EC0   0084
        MVO     R4,     G_0177                  ; 5EC1   0244 0177
        SLL     R0,     2                       ; 5EC3   004C
        SLL     R0,     1                       ; 5EC4   0048
        ADDI    #$0008, R0                      ; 5EC5   02F8 0008
        MVO     R0,     G_0175                  ; 5EC7   0240 0175
        AND@    R3,     R1                      ; 5EC9   0399
        MVII    #$0014, R0                      ; 5ECA   02B8 0014
        SUBI    #$0008, R1                      ; 5ECC   0339 0008
        BPL     L_5ED1                          ; 5ECE   0203 0001

        CLRR    R1                              ; 5ED0   01C9
L_5ED1:
        SLR     R1,     2                       ; 5ED1   0065
        SLR     R1,     1                       ; 5ED2   0061
        MVO     R1,     G_0178                  ; 5ED3   0241 0178
        MOVR    R1,     R3                      ; 5ED5   008B
        SLL     R3,     2                       ; 5ED6   004F
        SLL     R3,     1                       ; 5ED7   004B
        ADDI    #$0008, R3                      ; 5ED8   02FB 0008
        MVO     R3,     G_0176                  ; 5EDA   0243 0176

        JSR     R5,     X_MPY                   ; 5EDC   0004 011C 01DC

        ADDR    R2,     R4                      ; 5EDF   00D4
        ADDI    #$0200, R4                      ; 5EE0   02FC 0200
        PULR    R7                              ; 5EE2   02B7

        PSHR    R5                              ; 5EE3   0275
        MVI     G_035B, R1                      ; 5EE4   0281 035B
        SUBR    R0,     R1                      ; 5EE6   0101
        BEQ     L_5EEE                          ; 5EE7   0204 0005
        BMI     L_5EEE                          ; 5EE9   020B 0003

        MVO     R1,     G_035B                  ; 5EEB   0241 035B
        PULR    R7                              ; 5EED   02B7

L_5EEE:
        CLRR    R1                              ; 5EEE   01C9
        DECLE   $0241,  $035B,  $0004,  $0350   ; 5EEF   0241 035B 0004 0350
        DECLE   $011F,  $0275,  $0281,  $035B   ; 5EF3   011F 0275 0281 035B
        DECLE   $0065,  $0241,  $019F,  $0280   ; 5EF7   0065 0241 019F 0280
        DECLE   $0171,  $0281,  $0172,  $02BA   ; 5EFB   0171 0281 0172 02BA
        DECLE   $001E,  $02BB,  $0026,  $0004   ; 5EFF   001E 02BB 0026 0004

        CMPR    R1,     R4                      ; 5F03   014C
        CMPR    R1,     R5                      ; 5F04   014D
        SLR     R2,     2                       ; 5F05   0066
        CMPI    #$0004, R2                      ; 5F06   037A 0004
        BLT     L_5F0C                          ; 5F08   0205 0002

        MVII    #$0004, R2                      ; 5F0A   02BA 0004
L_5F0C:
        MVII    #$000F, R1                      ; 5F0C   02B9 000F
        DECLE   $0111,  $0241,  $01A1,  $0004   ; 5F0E   0111 0241 01A1 0004
        DECLE   $014C,  $0232,  $0201,  $0014   ; 5F12   014C 0232 0201 0014
        DECLE   $0001,  $0379,  $00AE,  $004E   ; 5F16   0001 0379 00AE 004E
        DECLE   $020C,  $000E,  $0282,  $0194   ; 5F1A   020C 000E 0282 0194
        DECLE   $0092,  $020C,  $0008,  $000A   ; 5F1E   0092 020C 0008 000A
        DECLE   $0242,  $0194,  $0004           ; 5F22   0242 0194 0004

        CMPR    R1,     R4                      ; 5F25   014C
        MOVR    R6,     R5                      ; 5F26   00B5
        ADDR    R5,     R1                      ; 5F27   00E9
        SLLC    R3,     1                       ; 5F28   005B
        PULR    R7                              ; 5F29   02B7

        CLRR    R2                              ; 5F2A   01D2
        MVO     R2,     G_0194                  ; 5F2B   0242 0194
        PULR    R7                              ; 5F2D   02B7

        PSHR    R5                              ; 5F2E   0275
        MVI     G_017F, R0                      ; 5F2F   0280 017F
        TSTR    R0                              ; 5F31   0080
        BEQ     L_5F35                          ; 5F32   0204 0001
        PULR    R7                              ; 5F34   02B7

L_5F35:
        MVI     G_019B, R0                      ; 5F35   0280 019B
        TSTR    R0                              ; 5F37   0080
        BNEQ    L_5F43                          ; 5F38   020C 0009

        MVI     G_019A, R0                      ; 5F3A   0280 019A
        SUB     G_0185, R0                      ; 5F3C   0300 0185
        BPL     L_5F4D                          ; 5F3E   0203 000D

        CLRR    R0                              ; 5F40   01C0
        B       L_5F4D                          ; 5F41   0200 000A

L_5F43:
        CLRR    R0                              ; 5F43   01C0
        MVO     R0,     G_019B                  ; 5F44   0240 019B
        MVI     G_019A, R0                      ; 5F46   0280 019A
        CMPI    #$00C8, R0                      ; 5F48   0378 00C8
        BGT     L_5F4F                          ; 5F4A   020E 0003

        INCR    R0                              ; 5F4C   0008
L_5F4D:
        MVO     R0,     G_019A                  ; 5F4D   0240 019A
L_5F4F:
        MVI     G_019A, R0                      ; 5F4F   0280 019A
        DECLE   $0378,  $0005,  $0205,  $001A   ; 5F51   0378 0005 0205 001A
        DECLE   $02BB,  $031E,  $0001,  $02BC   ; 5F55   02BB 031E 0001 02BC
        DECLE   $003A,  $0053,  $02B9,  $0014   ; 5F59   003A 0053 02B9 0014
        DECLE   $0282,  $0336,  $0092,  $0204   ; 5F5D   0282 0336 0092 0204
        DECLE   $000A,  $0378,  $000F,  $0205   ; 5F61   000A 0378 000F 0205
        DECLE   $0009,  $0282,  $0337,  $0092   ; 5F65   0009 0282 0337 0092
        DECLE   $020C,  $0004,  $000B,  $0004   ; 5F69   020C 0004 000B 0004
        DECLE   $0154,  $038D,  $0004,  $0158   ; 5F6D   0154 038D 0004 0158
        DECLE   $000C,  $02B7,  $0275,  $02B8   ; 5F71   000C 02B7 0275 02B8

        EIS                                     ; 5F75   0002

        JSR     R5,     X_RAND1                 ; 5F76   0004 0114 027D
        DECLE   $0080,  $020C,  $0010,  $0282   ; 5F79   0080 020C 0010 0282
        DECLE   $0337,  $0092,  $020C,  $000B   ; 5F7D   0337 0092 020C 000B
        DECLE   $02BB,  $031F,  $0001,  $02BC   ; 5F81   02BB 031F 0001 02BC
        DECLE   $0052,  $0053,  $02B9,  $001E   ; 5F85   0052 0053 02B9 001E
        DECLE   $0004,  $0154,  $038D           ; 5F89   0004 0154 038D

        PULR    R7                              ; 5F8C   02B7

        PSHR    R5                              ; 5F8D   0275
        MVI     G_0187, R0                      ; 5F8E   0280 0187
        SLL     R0,     2                       ; 5F90   004C
        ADDR    R0,     R1                      ; 5F91   00C1
        PSHR    R1                              ; 5F92   0271
        PSHR    R3                              ; 5F93   0273
        MVII    #$0002, R0                      ; 5F94   02B8 0002

        JSR     R5,     X_RAND1                 ; 5F96   0004 0114 027D
        DECLE   $0085,  $00C0,  $00C5,  $0001   ; 5F99   0085 00C0 00C5 0001
        DECLE   $02FD,  $0000,  $0058,  $02A9   ; 5F9D   02FD 0000 0058 02A9
        DECLE   $0289,  $0041,  $03B9,  $0036   ; 5FA1   0289 0041 03B9 0036
        DECLE   $0379,  $0012,  $0204,  $0019   ; 5FA5   0379 0012 0204 0019
        DECLE   $0275,  $0004                   ; 5FA9   0275 0004

        CMPR    R1,     R4                      ; 5FAB   014C
        ADDR    R2,     R4                      ; 5FAC   00D4
        PULR    R5                              ; 5FAD   02B5
        PULR    R3                              ; 5FAE   02B3
        MOVR    R3,     R4                      ; 5FAF   009C
        MVI@    R5,     R0                      ; 5FB0   02A8
        MVI@    R5,     R1                      ; 5FB1   02A9

        JSR     R5,     L_57EA                  ; 5FB2   0004 0154 03EA
        DECLE   $02B1,  $0282,  $031B,  $03BA   ; 5FB5   02B1 0282 031B 03BA
        DECLE   $00FF,  $0283,  $0323,  $03BB   ; 5FB9   00FF 0283 0323 03BB
        DECLE   $007F,  $0004                   ; 5FBD   007F 0004

        CMPR    R1,     R4                      ; 5FBF   014C
        CMPR    R3,     R0                      ; 5FC0   0158
        PULR    R7                              ; 5FC1   02B7

        PULR    R1                              ; 5FC2   02B1
        PULR    R1                              ; 5FC3   02B1
        PULR    R7                              ; 5FC4   02B7

        PSHR    R5                              ; 5FC5   0275
        PSHR    R2                              ; 5FC6   0272
        MVI@    R1,     R2                      ; 5FC7   028A
        CMPI    #$0188, R1                      ; 5FC8   0379 0188
        BNEQ    L_5FD0                          ; 5FCA   020C 0004

        MVII    #$018F, R1                      ; 5FCC   02B9 018F
        B       L_5FD6                          ; 5FCE   0200 0006

L_5FD0:
        CMPI    #$018B, R1                      ; 5FD0   0379 018B
        BNEQ    L_5FE7                          ; 5FD2   020C 0013

        MVII    #$0191, R1                      ; 5FD4   02B9 0191
L_5FD6:
        MOVR    R1,     R5                      ; 5FD6   008D
        ADD     G_0171, R0                      ; 5FD7   02C0 0171
        CMPI    #$0028, R0                      ; 5FD9   0378 0028
        BLT     L_5FDE                          ; 5FDB   0205 0001

        INCR    R1                              ; 5FDD   0009
L_5FDE:
        MVII    #$0001, R0                      ; 5FDE   02B8 0001
        SUB@    R5,     R2                      ; 5FE0   032A
        SUB@    R5,     R2                      ; 5FE1   032A
        BEQ     L_5FE8                          ; 5FE2   0204 0004

        INCR    R0                              ; 5FE4   0008
        B       L_5FE8                          ; 5FE5   0200 0001

L_5FE7:
        CLRR    R0                              ; 5FE7   01C0
L_5FE8:
        PULR    R2                              ; 5FE8   02B2
        PULR    R7                              ; 5FE9   02B7

        PSHR    R5                              ; 5FEA   0275
        ANDI    #$00FF, R0                      ; 5FEB   03B8 00FF
        ANDI    #$007F, R1                      ; 5FED   03B9 007F
        MVI@    R3,     R5                      ; 5FEF   029D
        SDBD                                    ; 5FF0   0001
        ANDI    #$FF00, R5                      ; 5FF1   03BD 0000 00FF
        XORR    R0,     R5                      ; 5FF4   01C5
        MVO@    R5,     R3                      ; 5FF5   025D
        ADDI    #$0008, R3                      ; 5FF6   02FB 0008
        MVI@    R3,     R5                      ; 5FF8   029D
        SDBD                                    ; 5FF9   0001
        ANDI    #$FF80, R5                      ; 5FFA   03BD 0080 00FF
        XORR    R1,     R5                      ; 5FFD   01CD
        MVO@    R5,     R3                      ; 5FFE   025D
        PULR    R7                              ; 5FFF   02B7

        DECLE   $020A,  $0058                   ; 6000   020A 0058

        DECR    R0                              ; 6002   0010
        MVO@    R4,     R4                      ; 6003   0264
        INCR    R2                              ; 6004   000A
        GSWD    R0                              ; 6005   0030
        ADD@    R4,     R6                      ; 6006   02E6
        SLLC    R0,     1                       ; 6007   0058
        SLLC    R2,     1                       ; 6008   005A
        PSHR    R7                              ; 6009   0277
        TSTR    R3                              ; 600A   009B
        GSWD    R0                              ; 600B   0030
        PSHR    R5                              ; 600C   0275
        MVII    #$0001, R3                      ; 600D   02BB 0001
L_600F:
        MVII    #$0333, R4                      ; 600F   02BC 0333
        ADDR    R3,     R4                      ; 6011   00DC
        MVI@    R4,     R0                      ; 6012   02A0
        TSTR    R0                              ; 6013   0080
        BEQ     L_6033                          ; 6014   0204 001D

        SUBI    #$0019, R4                      ; 6016   033C 0019
        MVI@    R4,     R0                      ; 6018   02A0
        ANDI    #$00FF, R0                      ; 6019   03B8 00FF
        CMPI    #$0008, R0                      ; 601B   0378 0008
        BLT     L_6030                          ; 601D   0205 0011

        CMPI    #$00A0, R0                      ; 601F   0378 00A0
        BGT     L_6030                          ; 6021   020E 000D

        ADDI    #$0007, R4                      ; 6023   02FC 0007
        MVI@    R4,     R0                      ; 6025   02A0
        ANDI    #$007F, R0                      ; 6026   03B8 007F
        CMPI    #$0008, R0                      ; 6028   0378 0008
        BLT     L_6030                          ; 602A   0205 0004

        CMPI    #$0060, R0                      ; 602C   0378 0060
        BLT     L_6033                          ; 602E   0205 0003

L_6030:
        JSR     R5,     L_547C                  ; 6030   0004 0154 007C

L_6033:
        INCR    R3                              ; 6033   000B
        CMPI    #$0008, R3                      ; 6034   037B 0008
        BNEQ    L_600F                          ; 6036   022C 0028

        MVII    #$0003, R3                      ; 6038   02BB 0003

        JSR     R5,     L_5570                  ; 603A   0004 0154 0170

        BNEQ    L_6044                          ; 603D   020C 0005

        MVII    #$0003, R3                      ; 603F   02BB 0003

        JSR     R5,     L_547C                  ; 6041   0004 0154 007C

L_6044:
        MVII    #$0004, R3                      ; 6044   02BB 0004

        JSR     R5,     L_5570                  ; 6046   0004 0154 0170

        BNEQ    L_6050                          ; 6049   020C 0005

        MVII    #$0004, R3                      ; 604B   02BB 0004

        JSR     R5,     L_547C                  ; 604D   0004 0154 007C

L_6050:
        PULR    R7                              ; 6050   02B7

        PSHR    R5                              ; 6051   0275
        MVI     G_017F, R1                      ; 6052   0281 017F
        TSTR    R1                              ; 6054   0089
        BNEQ    L_60EB                          ; 6055   020C 0094

        MVI     G_01A3, R1                      ; 6057   0281 01A3
        MVII    #$0014, R0                      ; 6059   02B8 0014

        JSR     R5,     X_MPY                   ; 605B   0004 011C 01DC

        ADDI    #$0200, R2                      ; 605E   02FA 0200
        CLRR    R0                              ; 6060   01C0
L_6061:
        SDBD                                    ; 6061   0001
        MVII    #$5982, R4                      ; 6062   02BC 0082 0059
        MVI@    R2,     R3                      ; 6065   0293
        PSHR    R3                              ; 6066   0273
        PSHR    R2                              ; 6067   0272
        PSHR    R0                              ; 6068   0270
L_6069:
        SDBD                                    ; 6069   0001
        MVI@    R4,     R1                      ; 606A   02A1
        TSTR    R1                              ; 606B   0089
        BEQ     L_6075                          ; 606C   0204 0007

        CMPR    R1,     R3                      ; 606E   014B
        BEQ     L_607E                          ; 606F   0204 000D

        ADDI    #$0008, R4                      ; 6071   02FC 0008
        B       L_6069                          ; 6073   0220 000B

L_6075:
        SDBD                                    ; 6075   0001
        MVI@    R4,     R1                      ; 6076   02A1
        SDBD                                    ; 6077   0001
        ANDI    #$B600, R3                      ; 6078   03BB 0000 00B6
        CMPR    R1,     R3                      ; 607B   014B
        BNEQ    L_60A7                          ; 607C   020C 0029

L_607E:
        MVI@    R4,     R1                      ; 607E   02A1
        DECLE   $0004                           ; 607F   0004

        CMPR    R2,     R4                      ; 6080   0154
        XOR     .BTAB.8B,R5                     ; 6081   03C5 028B
        TSTR    R3                              ; 6083   009B
        BNEQ    L_608A                          ; 6084   020C 0004

        CMPI    #$0002, R0                      ; 6086   0378 0002
        BNEQ    L_60A7                          ; 6088   020C 001D

L_608A:
        PULR    R0                              ; 608A   02B0
        DECLE   $0270,  $0281,  $01A3,  $0004   ; 608B   0270 0281 01A3 0004
        DECLE   $0158,  $0159,  $0388,  $0204   ; 608F   0158 0159 0388 0204
        DECLE   $0013,  $02B0,  $02B2,  $02B3   ; 6093   0013 02B0 02B2 02B3
        DECLE   $0291,  $014B,  $020C,  $000F   ; 6097   0291 014B 020C 000F
        DECLE   $0001                           ; 609B   0001

        MVI@    R4,     R1                      ; 609C   02A1
        CMPI    #$0001, R1                      ; 609D   0379 0001
        BEQ     L_60C2                          ; 609F   0204 0021

        TSTR    R1                              ; 60A1   0089
        BEQ     L_60B2                          ; 60A2   0204 000E

        MVO@    R1,     R2                      ; 60A4   0251
        B       L_60AA                          ; 60A5   0200 0003

L_60A7:
        PULR    R0                              ; 60A7   02B0
        PULR    R2                              ; 60A8   02B2
        PULR    R3                              ; 60A9   02B3
L_60AA:
        INCR    R0                              ; 60AA   0008
        CMPI    #$0014, R0                      ; 60AB   0378 0014
        BEQ     L_60EB                          ; 60AD   0204 003C

        INCR    R2                              ; 60AF   000A
        B       L_6061                          ; 60B0   0220 0050

L_60B2:
        SDBD                                    ; 60B2   0001
        MVII    #$535E, R4                      ; 60B3   02BC 005E 0053
        MVII    #$033A, R3                      ; 60B6   02BB 033A
        MVI@    R3,     R1                      ; 60B8   0299
        TSTR    R1                              ; 60B9   0089
        BNEQ    L_60AA                          ; 60BA   022C 0011

        MVII    #$0001, R1                      ; 60BC   02B9 0001
        MVO     R1,     G_017B                  ; 60BE   0241 017B
        B       L_60D1                          ; 60C0   0200 000F

L_60C2:
        MVII    #$0338, R3                      ; 60C2   02BB 0338
        SDBD                                    ; 60C4   0001
        MVII    #$5346, R4                      ; 60C5   02BC 0046 0053
        MVI@    R3,     R1                      ; 60C8   0299
        TSTR    R1                              ; 60C9   0089
        BEQ     L_60D1                          ; 60CA   0204 0005

        INCR    R3                              ; 60CC   000B
        MVI@    R3,     R1                      ; 60CD   0299
        TSTR    R1                              ; 60CE   0089
        BNEQ    L_60AA                          ; 60CF   022C 0026

L_60D1:
        SUBI    #$0018, R3                      ; 60D1   033B 0018
        DECLE   $0270,  $0273,  $0004           ; 60D3   0270 0273 0004

        CMPR    R1,     R4                      ; 60D6   014C
        ADDR    R2,     R4                      ; 60D7   00D4
        PULR    R3                              ; 60D8   02B3
        PULR    R0                              ; 60D9   02B0
        PSHR    R0                              ; 60DA   0270
        SLL     R0,     2                       ; 60DB   004C
        SLL     R0,     1                       ; 60DC   0048
        ADDI    #$0008, R0                      ; 60DD   02F8 0008
        MVI     G_01A3, R1                      ; 60DF   0281 01A3
        SLL     R1,     2                       ; 60E1   004D
        SLL     R1,     1                       ; 60E2   0049
        ADDI    #$0008, R1                      ; 60E3   02F9 0008

        JSR     R5,     L_57EA                  ; 60E5   0004 0154 03EA

        PULR    R0                              ; 60E8   02B0
        B       L_60AA                          ; 60E9   0220 0040

L_60EB:
        MVI     G_01A3, R1                      ; 60EB   0281 01A3
        INCR    R1                              ; 60ED   0009
        CMPI    #$000C, R1                      ; 60EE   0379 000C
        BNEQ    L_60F3                          ; 60F0   020C 0001

        CLRR    R1                              ; 60F2   01C9
L_60F3:
        MVO     R1,     G_01A3                  ; 60F3   0241 01A3
        PULR    R7                              ; 60F5   02B7

        PSHR    R5                              ; 60F6   0275
        SDBD                                    ; 60F7   0001
        MVII    #$5274, R4                      ; 60F8   02BC 0074 0052
        CLRR    R3                              ; 60FB   01DB
L_60FC:
        SDBD                                    ; 60FC   0001
        MVI@    R4,     R0                      ; 60FD   02A0
        TSTR    R0                              ; 60FE   0080
        BEQ     L_612B                          ; 60FF   0204 002A

        PSHR    R3                              ; 6101   0273
        PSHR    R4                              ; 6102   0274
        MOVR    R4,     R3                      ; 6103   00A3

        JSR     R5,     L_52CB                  ; 6104   0004 0150 02CB

        TSTR    R2                              ; 6107   0092
        BEQ     L_6124                          ; 6108   0204 001A

        MVII    #$0004, R0                      ; 610A   02B8 0004
        SUBR    R2,     R0                      ; 610C   0110
        ADD     G_0184, R0                      ; 610D   02C0 0184

        JSR     R5,     X_RAND2                 ; 610F   0004 0114 029E

        TSTR    R0                              ; 6112   0080
        BNEQ    L_6124                          ; 6113   020C 000F

        PULR    R4                              ; 6115   02B4
        PULR    R3                              ; 6116   02B3
        PSHR    R3                              ; 6117   0273
        PSHR    R4                              ; 6118   0274
        MVI@    R4,     R2                      ; 6119   02A2
        MVI@    R2,     R0                      ; 611A   0290
        INCR    R0                              ; 611B   0008
        CMPI    #$0100, R0                      ; 611C   0378 0100
        BEQ     L_6124                          ; 611E   0204 0004

        MVO@    R0,     R2                      ; 6120   0250

        JSR     R5,     L_592C                  ; 6121   0004 0158 012C

L_6124:
        PULR    R4                              ; 6124   02B4
        ADDI    #$0004, R4                      ; 6125   02FC 0004
        PULR    R3                              ; 6127   02B3
        INCR    R3                              ; 6128   000B
        B       L_60FC                          ; 6129   0220 002E
L_612B:
        PULR    R7                              ; 612B   02B7

        PSHR    R5                              ; 612C   0275
        SLL     R3,     1                       ; 612D   004B
        SDBD                                    ; 612E   0001
        ADDI    #$594B, R3                      ; 612F   02FB 004B 0059
        MVI@    R3,     R5                      ; 6132   029D
        INCR    R3                              ; 6133   000B
        MVI@    R3,     R3                      ; 6134   029B
L_6135:
        MVI@    R5,     R2                      ; 6135   02AA
        CMPI    #$00FF, R2                      ; 6136   037A 00FF
        BNEQ    L_613E                          ; 6138   020C 0004

        DECR    R3                              ; 613A   0013
        BNEQ    L_6135                          ; 613B   022C 0007
        PULR    R7                              ; 613D   02B7

L_613E:
        MVII    #$0001, R3                      ; 613E   02BB 0001
L_6140:
        SARC    R2,     1                       ; 6140   007A
        BNC     L_6146                          ; 6141   0209 0003

        SLL     R3,     1                       ; 6143   004B
        B       L_6140                          ; 6144   0220 0005

L_6146:
        DECR    R5                              ; 6146   0015
        MOVR    R5,     R2                      ; 6147   00AA
        XOR@    R2,     R3                      ; 6148   03D3
        MVO@    R3,     R2                      ; 6149   0253
        PULR    R7                              ; 614A   02B7

        ANDR    R4,     R4                      ; 614B   01A4
        INCR    R7                              ; 614C   000F

        ANDR    R7,     R2                      ; 614D   01BA
L_614E:
        INCR    R1                              ; 614E   0009
        XORR    R0,     R6                      ; 614F   01C6
        INCR    R2                              ; 6150   000A
        ANDR    R6,     R3                      ; 6151   01B3
        SETC                                    ; 6152   0007
        XORR    R0,     R3                      ; 6153   01C3
        DIS                                     ; 6154   0003
        XORR    R3,     R2                      ; 6155   01DA
        EIS                                     ; 6156   0002
        XORR    R2,     R0                      ; 6157   01D0
        INCR    R2                              ; 6158   000A
        PSHR    R5                              ; 6159   0275
        ADD     G_0172, R1                      ; 615A   02C1 0172
        ADD     G_0171, R0                      ; 615C   02C0 0171
        SUB@    R4,     R1                      ; 615E   0321
        SUB@    R4,     R0                      ; 615F   0320
        MVI@    R4,     R2                      ; 6160   02A2
        PSHR    R0                              ; 6161   0270

        JSR     R5,     X_DIV                   ; 6162   0004 011C 01FB

        PULR    R1                              ; 6165   02B1
        PSHR    R0                              ; 6166   0270
        MVI@    R4,     R2                      ; 6167   02A2

        JSR     R5,     X_DIV                   ; 6168   0004 011C 01FB

        PULR    R1                              ; 616B   02B1

        JSR     R5,     X_MPY                   ; 616C   0004 011C 01DC

        MOVR    R2,     R1                      ; 616F   0091
        MVII    #$0008, R2                      ; 6170   02BA 0008

        JSR     R5,     X_DIV                   ; 6172   0004 011C 01FB

        MVII    #$0001, R2                      ; 6175   02BA 0001
L_6177:
        TSTR    R1                              ; 6177   0089
        BEQ     L_617E                          ; 6178   0204 0004

        DECR    R1                              ; 617A   0011
        SLL     R2,     1                       ; 617B   004A
        B       L_6177                          ; 617C   0220 0006

L_617E:
        MOVR    R0,     R1                      ; 617E   0081
        ADD@    R4,     R1                      ; 617F   02E1
        MOVR    R2,     R0                      ; 6180   0090
        PULR    R7                              ; 6181   02B7

        DECLE   $0003,  $00AC,  $0188,  $0024   ; 6182   0003 00AC 0188 0024
        DECLE   $0014,  $0002,  $0004,  $01A4   ; 6186   0014 0002 0004 01A4
        DECLE   $0000,  $00AC,  $0045,  $00AA   ; 618A   0000 00AC 0045 00AA
        DECLE   $018B,  $003F,  $0019,  $0001   ; 618E   018B 003F 0019 0001
        DECLE   $0004,  $01B3,  $0043,  $00AA   ; 6192   0004 01B3 0043 00AA
        DECLE   $0046,  $00AC,  $018A,  $003C   ; 6196   0046 00AC 018A 003C
        DECLE   $001E,  $0001,  $0001,  $01BA   ; 619A   001E 0001 0001 01BA
        DECLE   $0043,  $00AC,  $003E,  $00AC   ; 619E   0043 00AC 003E 00AC
        DECLE   $018C,  $0043,  $0014,  $0002   ; 61A2   018C 0043 0014 0002
        DECLE   $0004,  $01C3,  $003A,  $00AC   ; 61A6   0004 01C3 003A 00AC
        DECLE   $0050,  $000C,  $0189,  $000C   ; 61AA   0050 000C 0189 000C
        DECLE   $0014,  $0004,  $0008,  $01C6   ; 61AE   0014 0004 0008 01C6
        DECLE   $0050,  $0098,  $005E,  $000C   ; 61B2   0050 0098 005E 000C
        DECLE   $0189,  $000C,  $0014,  $0004   ; 61B6   0189 000C 0014 0004
        DECLE   $0008,  $01C6,  $005E,  $0098   ; 61BA   0008 01C6 005E 0098
        DECLE   $005C,  $000C,  $0189,  $000C   ; 61BE   005C 000C 0189 000C
        DECLE   $0014,  $0004,  $0008,  $01C6   ; 61C2   0014 0004 0008 01C6
        DECLE   $005C,  $0098,  $0053,  $000C   ; 61C6   005C 0098 0053 000C
        DECLE   $0189,  $000C,  $0014,  $0004   ; 61CA   0189 000C 0014 0004
        DECLE   $0008,  $01C6,  $0053,  $0098   ; 61CE   0008 01C6 0053 0098
        DECLE   $0057,  $000C,  $0189,  $000C   ; 61D2   0057 000C 0189 000C
        DECLE   $0014,  $0004,  $0008,  $01C6   ; 61D6   0014 0004 0008 01C6
        DECLE   $0057,  $0098,  $0018,  $0098   ; 61DA   0057 0098 0018 0098
        DECLE   $018E,  $000C,  $0018,  $0004   ; 61DE   018E 000C 0018 0004
        DECLE   $0008,  $01DA,  $0000,  $0000   ; 61E2   0008 01DA 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0014   ; 61E6   0000 0000 0000 0014
        DECLE   $018D,  $000C,  $0014,  $0004   ; 61EA   018D 000C 0014 0004
        DECLE   $0008,  $01D0,  $0001,  $0000   ; 61EE   0008 01D0 0001 0000

        PSHR    R5                              ; 61F2   0275
        CMPI    #$0002, R2                      ; 61F3   037A 0002
        BLT     L_61FB                          ; 61F5   0205 0004

        JSR     R5,     L_59FF                  ; 61F7   0004 0158 01FF

        PULR    R7                              ; 61FA   02B7

L_61FB:
        JSR     R5,     L_5B05                  ; 61FB   0004 0158 0305

        PULR    R7                              ; 61FE   02B7

        PSHR    R5                              ; 61FF   0275
        MVI     G_0172, R3                      ; 6200   0283 0172
        CMPI    #$0002, R2                      ; 6202   037A 0002
        BEQ     L_6208                          ; 6204   0204 0002

        INCR    R3                              ; 6206   000B
        INCR    R7                              ; 6207   000F

L_6208:
        DECR    R3                              ; 6208   0013
L_6209:
        MVO     R3,     G_0172                  ; 6209   0243 0172
        MVII    #$0200, R4                      ; 620B   02BC 0200
        RRC     R2,     1                       ; 620D   0072
        BNC     L_6214                          ; 620E   0209 0004

        ADDI    #$00DC, R4                      ; 6210   02FC 00DC
        ADDI    #$000B, R3                      ; 6212   02FB 000B
L_6214:
        MVI     G_0171, R2                      ; 6214   0282 0171
        MVII    #$0014, R0                      ; 6216   02B8 0014
        PSHR    R0                              ; 6218   0270
        MVO     R2,     G_0173                  ; 6219   0242 0173
        MVO     R3,     G_0174                  ; 621B   0243 0174

        JSR     R5,     L_5A8F                  ; 621D   0004 0158 028F
        DECLE   $0204,  $0021,  $0004           ; 6220   0204 0021 0004

        CMPR    R3,     R0                      ; 6223   0158
        MVO@    R1,     R3                      ; 6224   0259
L_6225:
        MVI@    R1,     R2                      ; 6225   028A

        JSR     R5,     L_5AAC                  ; 6226   0004 0158 02AC

        MVO@    R2,     R4                      ; 6229   0262
        PULR    R0                              ; 622A   02B0
        DECR    R0                              ; 622B   0010
        BEQ     L_6242                          ; 622C   0204 0014

        PSHR    R0                              ; 622E   0270
        MVI     G_0173, R2                      ; 622F   0282 0173
        INCR    R2                              ; 6231   000A
        MVO     R2,     G_0173                  ; 6232   0242 0173

        JSR     R5,     L_5A8F                  ; 6234   0004 0158 028F

        BEQ     L_6243                          ; 6237   0204 000A

        DECR    R3                              ; 6239   0013
        BNEQ    L_6225                          ; 623A   022C 0016

        INCR    R1                              ; 623C   0009

        JSR     R5,     L_5A82                  ; 623D   0004 0158 0282

        B       L_6225                          ; 6240   0220 001C
L_6242:
        PULR    R7                              ; 6242   02B7

L_6243:
        SDBD                                    ; 6243   0001
        MVII    #$1200, R1                      ; 6244   02B9 0000 0012
        MVO@    R1,     R4                      ; 6247   0261
        MVI     G_0173, R2                      ; 6248   0282 0173
        INCR    R2                              ; 624A   000A
        MVO     R2,     G_0173                  ; 624B   0242 0173
        PULR    R0                              ; 624D   02B0
        DECR    R0                              ; 624E   0010
        BEQ     L_6242                          ; 624F   0224 000E

        PSHR    R0                              ; 6251   0270

        JSR     R5,     L_5A8F                  ; 6252   0004 0158 028F
        DECLE   $0224,  $0013,  $0220,  $0036   ; 6255   0224 0013 0220 0036

        PSHR    R5                              ; 6259   0275
        SUBI    #$0014, R2                      ; 625A   033A 0014
        SUBI    #$000C, R3                      ; 625C   033B 000C
        SDBD                                    ; 625E   0001
        MVII    #$5E94, R5                      ; 625F   02BD 0094 005E
        CLRR    R1                              ; 6262   01C9
L_6263:
        MVI@    R5,     R0                      ; 6263   02A8
        CMPR    R0,     R3                      ; 6264   0143
        BLT     L_626D                          ; 6265   0205 0006

        SDBD                                    ; 6267   0001
        ADDI    #$0400, R1                      ; 6268   02F9 0000 0004
        B       L_6263                          ; 626B   0220 0009

L_626D:
        SDBD                                    ; 626D   0001
        ADDI    #$5C5B, R3                      ; 626E   02FB 005B 005C
        ADD@    R3,     R1                      ; 6271   02D9
        SDBD                                    ; 6272   0001
        ADDI    #$600A, R1                      ; 6273   02F9 000A 0060

L_6276:
        JSR     R5,     L_5A82                  ; 6276   0004 0158 0282

        CMPR    R2,     R3                      ; 6279   0153
        BGT     L_6280                          ; 627A   020E 0004

        SUBR    R3,     R2                      ; 627C   011A
        INCR    R1                              ; 627D   0009
        B       L_6276                          ; 627E   0220 0009

L_6280:
        SUBR    R2,     R3                      ; 6280   0113
        PULR    R7                              ; 6281   02B7

        MVI@    R1,     R3                      ; 6282   028B
        CMPI    #$03E0, R3                      ; 6283   037B 03E0
        BLT     L_628B                          ; 6285   0205 0004

        ANDI    #$001F, R3                      ; 6287   03BB 001F
        B       L_628D                          ; 6289   0200 0002

L_628B:
        ANDI    #$0001, R3                      ; 628B   03BB 0001
L_628D:
        INCR    R3                              ; 628D   000B
        MOVR    R5,     R7                      ; 628E   00AF

        PSHR    R5                              ; 628F   0275
        PSHR    R2                              ; 6290   0272
        PSHR    R3                              ; 6291   0273
        MVI     G_0173, R2                      ; 6292   0282 0173
        MVI     G_0174, R3                      ; 6294   0283 0174
        CLRR    R0                              ; 6296   01C0
        CMPI    #$0014, R2                      ; 6297   037A 0014
        BLT     L_62A8                          ; 6299   0205 000D

        CMPI    #$003C, R2                      ; 629B   037A 003C
        BGE     L_62A8                          ; 629D   020D 0009

        CMPI    #$000C, R3                      ; 629F   037B 000C
        BLT     L_62A8                          ; 62A1   0205 0005

        CMPI    #$0048, R3                      ; 62A3   037B 0048
        BGE     L_62A8                          ; 62A5   020D 0001

        INCR    R0                              ; 62A7   0008
L_62A8:
        PULR    R3                              ; 62A8   02B3
        PULR    R2                              ; 62A9   02B2
        TSTR    R0                              ; 62AA   0080
        PULR    R7                              ; 62AB   02B7

        PSHR    R5                              ; 62AC   0275
        PSHR    R0                              ; 62AD   0270
        SLR     R2,     1                       ; 62AE   0062
        CMPI    #$01F0, R2                      ; 62AF   037A 01F0
        BLT     L_62B7                          ; 62B1   0205 0004

        SDBD                                    ; 62B3   0001
        MVII    #$016B, R2                      ; 62B4   02BA 006B 0001
L_62B7:
        SDBD                                    ; 62B7   0001
        MVII    #$5E7A, R5                      ; 62B8   02BD 007A 005E
L_62BB:
        MVI@    R5,     R0                      ; 62BB   02A8
        CMPR    R0,     R2                      ; 62BC   0142
        BLT     L_62C2                          ; 62BD   0205 0003

        INCR    R5                              ; 62BF   000D
        B       L_62BB                          ; 62C0   0220 0006

L_62C2:
        MVI@    R5,     R0                      ; 62C2   02A8
        SWAP    R0,     1                       ; 62C3   0040
        SDBD                                    ; 62C4   0001
        ADDI    #$5C97, R2                      ; 62C5   02FA 0097 005C
        MVI@    R2,     R2                      ; 62C8   0292
        SDBD                                    ; 62C9   0001
        MVII    #$0800, R5                      ; 62CA   02BD 0000 0008
        CMPI    #$0001, R2                      ; 62CD   037A 0001
        BNEQ    L_62D3                          ; 62CF   020C 0002

        CLRR    R2                              ; 62D1   01D2
        CLRR    R5                              ; 62D2   01ED
L_62D3:
        SARC    R2,     1                       ; 62D3   007A
        RRC     R0,     1                       ; 62D4   0070
        XORR    R0,     R2                      ; 62D5   01C2
        XORR    R5,     R2                      ; 62D6   01EA
        SDBD                                    ; 62D7   0001
        XORI    #$8000, R2                      ; 62D8   03FA 0000 0080
        BMI     L_6303                          ; 62DB   020B 0026

        MVII    #$0004, R0                      ; 62DD   02B8 0004
        SUB     G_0187, R0                      ; 62DF   0300 0187
        SLL     R0,     1                       ; 62E1   0048
        PSHR    R2                              ; 62E2   0272

L_62E3:
        JSR     R5,     X_RAND1                 ; 62E3   0004 0114 027D

        PULR    R2                              ; 62E6   02B2
        TSTR    R0                              ; 62E7   0080
        BNEQ    L_6303                          ; 62E8   020C 0019

        MOVR    R2,     R0                      ; 62EA   0090
        SDBD                                    ; 62EB   0001
        ANDI    #$FE00, R2                      ; 62EC   03BA 0000 00FE
        ANDI    #$01F8, R0                      ; 62EF   03B8 01F8
        CMPI    #$0050, R0                      ; 62F1   0378 0050
        BEQ     L_6301                          ; 62F3   0204 000C

        CMPI    #$0068, R0                      ; 62F5   0378 0068
        BEQ     L_6301                          ; 62F7   0204 0008

        CMPI    #$0070, R0                      ; 62F9   0378 0070
        BEQ     L_6301                          ; 62FB   0204 0004

        XORI    #$0017, R2                      ; 62FD   03FA 0017
        B       L_6303                          ; 62FF   0200 0002

L_6301:
        XORI    #$000F, R2                      ; 6301   03FA 000F
L_6303:
        PULR    R0                              ; 6303   02B0
        PULR    R7                              ; 6304   02B7

        PSHR    R5                              ; 6305   0275
        MVI     G_0171, R3                      ; 6306   0283 0171
        TSTR    R2                              ; 6308   0092
        BEQ     L_630D                          ; 6309   0204 0002

        INCR    R3                              ; 630B   000B
        INCR    R7                              ; 630C   000F

L_630D:
        DECR    R3                              ; 630D   0013
L_630E:
        MVO     R3,     G_0171                  ; 630E   0243 0171
        MVII    #$0200, R4                      ; 6310   02BC 0200
        RRC     R2,     1                       ; 6312   0072
        BNC     L_6319                          ; 6313   0209 0004

        ADDI    #$0013, R4                      ; 6315   02FC 0013
        ADDI    #$0013, R3                      ; 6317   02FB 0013
L_6319:
        MVII    #$000C, R0                      ; 6319   02B8 000C
        MOVR    R3,     R2                      ; 631B   009A
        MVI     G_0172, R3                      ; 631C   0283 0172
        MVO     R2,     G_0173                  ; 631E   0242 0173
        MVO     R3,     G_0174                  ; 6320   0243 0174
L_6322:
        MVI     G_0174, R3                      ; 6322   0283 0174
        MVI     G_0173, R2                      ; 6324   0282 0173
        PSHR    R0                              ; 6326   0270

        JSR     R5,     L_5A8F                  ; 6327   0004 0158 028F
        DECLE   $020C,  $0006                   ; 632A   020C 0006

        SDBD                                    ; 632C   0001
        MVII    #$1200, R2                      ; 632D   02BA 0000 0012
        B       L_6339                          ; 6330   0200 0007

        DECLE   $0004                           ; 6332   0004

        CMPR    R3,     R0                      ; 6333   0158
        MVO@    R1,     R3                      ; 6334   0259
        MVI@    R1,     R2                      ; 6335   028A

        JSR     R5,     L_5AAC                  ; 6336   0004 0158 02AC

L_6339:
        MVO@    R2,     R4                      ; 6339   0262
        ADDI    #$0013, R4                      ; 633A   02FC 0013
        MVI     G_0174, R3                      ; 633C   0283 0174
        INCR    R3                              ; 633E   000B
        MVO     R3,     G_0174                  ; 633F   0243 0174
        PULR    R0                              ; 6341   02B0
        DECR    R0                              ; 6342   0010
        BNEQ    L_6322                          ; 6343   022C 0022
        PULR    R7                              ; 6345   02B7

        PSHR    R5                              ; 6346   0275
        SDBD                                    ; 6347   0001
        MVII    #$5F4E, R4                      ; 6348   02BC 004E 005F
        MVI@    R4,     R5                      ; 634B   02A5
        SDBD                                    ; 634C   0001
        ADDI    #$3800, R5                      ; 634D   02FD 0000 0038
        MVI@    R4,     R0                      ; 6350   02A0
L_6351:
        MVI@    R4,     R1                      ; 6351   02A1
        MOVR    R1,     R2                      ; 6352   008A
        SLR     R1,     2                       ; 6353   0065
        ANDI    #$0003, R2                      ; 6354   03BA 0003
        INCR    R2                              ; 6356   000A
L_6357:
        MVO@    R1,     R5                      ; 6357   0269
        DECR    R2                              ; 6358   0012
        BNEQ    L_6357                          ; 6359   022C 0003

        DECR    R0                              ; 635B   0010
        BNEQ    L_6351                          ; 635C   022C 000C
        PULR    R7                              ; 635E   02B7

        PSHR    R5                              ; 635F   0275
        PSHR    R4                              ; 6360   0274

        JSR     R5,     .EXEC.A83               ; 6361   0004 0118 0283

        MVII    #$003F, R0                      ; 6364   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 6366   0240 01F8
        MVII    #$010F, R4                      ; 6368   02BC 010F
        MVII    #$0006, R3                      ; 636A   02BB 0006
        CLRR    R0                              ; 636C   01C0
L_636D:
        MVO@    R0,     R4                      ; 636D   0260
        DECR    R3                              ; 636E   0013
        BNEQ    L_636D                          ; 636F   022C 0003

        PULR    R4                              ; 6371   02B4
        PULR    R7                              ; 6372   02B7

L_6373:
        CLRR    R0                              ; 6373   01C0
        MVO@    R0,     R4                      ; 6374   0260
        MVO@    R0,     R4                      ; 6375   0260
        PULR    R7                              ; 6376   02B7

L_6377:
        MVO@    R0,     R4                      ; 6377   0260
        SWAP    R0,     1                       ; 6378   0040
        MVO@    R0,     R4                      ; 6379   0260
        MOVR    R5,     R7                      ; 637A   00AF

        MVII    #$01FB, R2                      ; 637B   02BA 01FB
        MVII    #$0009, R1                      ; 637D   02B9 0009
        B       L_638B                          ; 637F   0200 000A

        MVII    #$01FC, R2                      ; 6381   02BA 01FC
        MVII    #$0012, R1                      ; 6383   02B9 0012
        B       L_638B                          ; 6385   0200 0004

        MVII    #$01FD, R2                      ; 6387   02BA 01FD
        MVII    #$0024, R1                      ; 6389   02B9 0024
L_638B:
        CLRR    R0                              ; 638B   01C0
        MVO@    R0,     R2                      ; 638C   0250
        MVI     .PSG0.chan_enable,R0            ; 638D   0280 01F8
        COMR    R1                              ; 638F   0019
        COMR    R0                              ; 6390   0018
        ANDR    R1,     R0                      ; 6391   0188
        COMR    R1                              ; 6392   0019
        COMR    R0                              ; 6393   0018
        MOVR    R5,     R7                      ; 6394   00AF

        PSHR    R5                              ; 6395   0275
        CLRR    R0                              ; 6396   01C0
        MVO     R0,     .PSG0.chn_c_vol         ; 6397   0240 01FD
        MVO     R0,     G_0147                  ; 6399   0240 0147

        JSR     R5,     L_5B87                  ; 639B   0004 0158 0387

        ANDI    #$003B, R0                      ; 639E   03B8 003B
        MVO     R0,     .PSG0.chan_enable       ; 63A0   0240 01F8
        MVI     G_01A2, R0                      ; 63A2   0280 01A2
        MVO     R0,     .PSG0.chn_c_lo          ; 63A4   0240 01F2
        MVO     R0,     .PSG0.chn_c_hi          ; 63A6   0240 01F6
        INCR    R7                              ; 63A8   000F

        PSHR    R5                              ; 63A9   0275
L_63AA:
        MVI     G_0147, R0                      ; 63AA   0280 0147
        TSTR    R0                              ; 63AC   0080
        BNEQ    L_63DB                          ; 63AD   020C 002C

        MVI     G_01A1, R0                      ; 63AF   0280 01A1
        ANDI    #$000F, R0                      ; 63B1   03B8 000F
        MVO     R0,     .PSG0.chn_c_vol         ; 63B3   0240 01FD
        MVII    #$0006, R0                      ; 63B5   02B8 0006
        MVO     R0,     G_0147                  ; 63B7   0240 0147
        INCR    R7                              ; 63B9   000F

        PSHR    R5                              ; 63BA   0275
L_63BB:
        MVI     G_0147, R0                      ; 63BB   0280 0147
        TSTR    R0                              ; 63BD   0080
        BNEQ    L_63E1                          ; 63BE   020C 0021

        MVI     G_01A0, R0                      ; 63C0   0280 01A0
        TSTR    R0                              ; 63C2   0080
        BEQ     L_63CE                          ; 63C3   0204 0009

        CLRR    R0                              ; 63C5   01C0
        MVO     R0,     .PSG0.chn_c_vol         ; 63C6   0240 01FD
        MVO     R0,     G_01A0                  ; 63C8   0240 01A0
        MVI     G_019F, R0                      ; 63CA   0280 019F
        B       L_63D9                          ; 63CC   0200 000B

L_63CE:
        MVI     .PSG0.chn_c_vol,R0              ; 63CE   0280 01FD
        ANDI    #$000F, R0                      ; 63D0   03B8 000F
        SLR     R0,     1                       ; 63D2   0060
        MVO     R0,     .PSG0.chn_c_vol         ; 63D3   0240 01FD
        MVII    #$0006, R0                      ; 63D5   02B8 0006
        MVO     R0,     G_01A0                  ; 63D7   0240 01A0
L_63D9:
        MVO     R0,     G_0147                  ; 63D9   0240 0147
L_63DB:
        SDBD                                    ; 63DB   0001
        MVII    #$5BA9, R0                      ; 63DC   02B8 00A9 005B
        B       L_63E5                          ; 63DF   0200 0004

L_63E1:
        SDBD                                    ; 63E1   0001
        MVII    #$5BBA, R0                      ; 63E2   02B8 00BA 005B

L_63E5:
        JSR     R5,     L_5B77                  ; 63E5   0004 0158 0377

        PULR    R7                              ; 63E8   02B7

        PSHR    R5                              ; 63E9   0275

        JSR     R5,     L_5B81                  ; 63EA   0004 0158 0381

        ANDI    #$002F, R0                      ; 63ED   03B8 002F
        MVO     R0,     .PSG0.chan_enable       ; 63EF   0240 01F8
        CLRR    R0                              ; 63F1   01C0
        MVO     R0,     .PSG0.noise             ; 63F2   0240 01F9
        MVO     R0,     .PSG0.chn_b_vol         ; 63F4   0240 01FC
        MVII    #$000C, R0                      ; 63F6   02B8 000C
        MVO     R0,     G_0146                  ; 63F8   0240 0146
        B       L_6416                          ; 63FA   0200 001A

        PSHR    R5                              ; 63FC   0275
        MVI     G_0146, R0                      ; 63FD   0280 0146
        TSTR    R0                              ; 63FF   0080
        BNEQ    L_6416                          ; 6400   020C 0014

        MVI     G_0194, R0                      ; 6402   0280 0194
        TSTR    R0                              ; 6404   0080
        BEQ     L_643C                          ; 6405   0204 0035

        MVII    #$000C, R0                      ; 6407   02B8 000C
        MVO     R0,     G_0146                  ; 6409   0240 0146
        MVI     .PSG0.chn_b_vol,R0              ; 640B   0280 01FC
        ANDI    #$000F, R0                      ; 640D   03B8 000F
        INCR    R0                              ; 640F   0008
        CMPI    #$000C, R0                      ; 6410   0378 000C
        BGT     L_6427                          ; 6412   020E 0013

        MVO     R0,     .PSG0.chn_b_vol         ; 6414   0240 01FC
L_6416:
        SDBD                                    ; 6416   0001
        MVII    #$5BFC, R0                      ; 6417   02B8 00FC 005B
        B       L_6439                          ; 641A   0200 001D

        PSHR    R5                              ; 641C   0275
        MVI     G_0146, R0                      ; 641D   0280 0146
        TSTR    R0                              ; 641F   0080
        BNEQ    L_6435                          ; 6420   020C 0013

        MVI     G_0194, R0                      ; 6422   0280 0194
        TSTR    R0                              ; 6424   0080
        BEQ     L_643C                          ; 6425   0204 0015

L_6427:
        MVII    #$000C, R0                      ; 6427   02B8 000C
        MVO     R0,     G_0146                  ; 6429   0240 0146
        MVI     .PSG0.chn_b_vol,R0              ; 642B   0280 01FC
        ANDI    #$000F, R0                      ; 642D   03B8 000F
        TSTR    R0                              ; 642F   0080
        BEQ     L_6416                          ; 6430   0224 001B

        DECR    R0                              ; 6432   0010
        MVO     R0,     .PSG0.chn_b_vol         ; 6433   0240 01FC
L_6435:
        SDBD                                    ; 6435   0001
        MVII    #$5C1C, R0                      ; 6436   02B8 001C 005C
L_6439:
        PULR    R5                              ; 6439   02B5
        B       L_6377                          ; 643A   0220 00C4

L_643C:
        JSR     R5,     L_5B81                  ; 643C   0004 0158 0381

        B       L_6373                          ; 643F   0220 00CD

        PSHR    R5                              ; 6441   0275

        JSR     R5,     L_5B7B                  ; 6442   0004 0158 037B

        ANDI    #$003E, R0                      ; 6445   03B8 003E
        MVO     R0,     .PSG0.chan_enable       ; 6447   0240 01F8
        MVII    #$00A9, R0                      ; 6449   02B8 00A9
        MVO     R0,     .PSG0.chn_a_lo          ; 644B   0240 01F0
        MVO     R0,     .PSG0.chn_a_hi          ; 644D   0240 01F4
        MVO     R0,     .PSG0.envelope          ; 644F   0240 01FA
        MVII    #$0010, R0                      ; 6451   02B8 0010
        MVO     R0,     .PSG0.envlp_hi          ; 6453   0240 01F7
        MVII    #$0030, R0                      ; 6455   02B8 0030
        MVO     R0,     .PSG0.chn_a_vol         ; 6457   0240 01FB
        B       L_6373                          ; 6459   0220 00E7

        DECLE   $0000                           ; 645B   0000

        COMR    R0                              ; 645C   0018
        GSWD    R3                              ; 645D   0033
        RLC     R0,     1                       ; 645E   0050
        SAR     R1,     2                       ; 645F   006D
        MOVR    R1,     R3                      ; 6460   008B
        MOVR    R4,     R7                      ; 6461   00A7

        DECLE   $00C5,  $00E1,  $0101,  $0120   ; 6462   00C5 00E1 0101 0120
        DECLE   $0140,  $0161,  $0180,  $019D   ; 6466   0140 0161 0180 019D
        DECLE   $01BA,  $01D5,  $01EE,  $0207   ; 646A   01BA 01D5 01EE 0207
        DECLE   $0224,  $0240,  $025D,  $0279   ; 646E   0224 0240 025D 0279
        DECLE   $0299,  $02BB,  $02DF,  $0304   ; 6472   0299 02BB 02DF 0304
        DECLE   $032A,  $034E,  $036F,  $0393   ; 6476   032A 034E 036F 0393
        DECLE   $03B7,  $03DF,  $0005           ; 647A   03B7 03DF 0005

        ADCR    R3                              ; 647D   002B
        RLC     R0,     1                       ; 647E   0050
        RRC     R2,     2                       ; 647F   0076
        MOVR    R3,     R2                      ; 6480   009A
        ADDR    R0,     R0                      ; 6481   00C0
        ADDR    R4,     R7                      ; 6482   00E7

        DECLE   $010B,  $0132,  $0159,  $017F   ; 6483   010B 0132 0159 017F
        DECLE   $01A3,  $01C8,  $01EC,  $0212   ; 6487   01A3 01C8 01EC 0212
        DECLE   $0236,  $0259,  $027F           ; 648B   0236 0259 027F

        MVI@    R4,     R6                      ; 648E   02A6
        ADD@    R1,     R5                      ; 648F   02CD
        ADD@    R6,     R1                      ; 6490   02F1
        SUB@    R2,     R7                      ; 6491   0317

        DECLE   $033C,  $0363,  $0389,  $03AE   ; 6492   033C 0363 0389 03AE
        DECLE   $03D4,  $00B1,  $00A1,  $01A0   ; 6496   03D4 00B1 00A1 01A0
        DECLE   $0140,  $0150,  $0001,  $00DE   ; 649A   0140 0150 0001 00DE
        DECLE   $014E,  $0090,  $00D0,  $015C   ; 649E   014E 0090 00D0 015C
        DECLE   $00AD,  $00BF                   ; 64A2   00AD 00BF

        ADDR    R4,     R0                      ; 64A4   00E0
        ADDR    R1,     R6                      ; 64A5   00CE
        CMPR    R3,     R6                      ; 64A6   015E
        MOVR    R1,     R6                      ; 64A7   008E
        MOVR    R3,     R6                      ; 64A8   009E
        ANDR    R2,     R0                      ; 64A9   0190
        MOVR    R5,     R7                      ; 64AA   00AF

        ANDR    R5,     R6                      ; 64AB   01AE
        SUBR    R1,     R6                      ; 64AC   010E
        SUBR    R7,     R6                      ; 64AD   013E
        CMPR    R5,     R6                      ; 64AE   016E
        XORR    R1,     R6                      ; 64AF   01CE
        ADDR    R6,     R0                      ; 64B0   00F0
        ANDR    R3,     R6                      ; 64B1   019E
        ADDR    R5,     R6                      ; 64B2   00EE
        SUBR    R5,     R6                      ; 64B3   012E
        CMPR    R0,     R6                      ; 64B4   0146
        PULR    R0                              ; 64B5   02B0
        ANDR    R0,     R0                      ; 64B6   0180
        ADDR    R0,     R0                      ; 64B7   00C0
        SUBR    R2,     R0                      ; 64B8   0110
        SUBR    R4,     R0                      ; 64B9   0120
        B       L_677C                          ; 64BA   0200 02C0

        MVO@    R0,     R4                      ; 64BC   0260
        ADD@    R1,     R4                      ; 64BD   02CC
        MVI@    R4,     R0                      ; 64BE   02A0
        ADDR    R5,     R4                      ; 64BF   00EC
        XORR    R6,     R0                      ; 64C0   01F0
        ADDR    R3,     R4                      ; 64C1   00DC
        B       L_62E3                          ; 64C2   0220 01E0

        DECLE   $0210,  $00BD,  $00FC,  $00CC   ; 64C4   0210 00BD 00FC 00CC
        DECLE   $0070,  $0060,  $0230           ; 64C8   0070 0060 0230

        SUBR    R6,     R0                      ; 64CB   0130
        MVO@    R4,     R3                      ; 64CC   025C
        ANDR    R3,     R4                      ; 64CD   019C
        ANDR    R1,     R4                      ; 64CE   018C
        XORR    R3,     R4                      ; 64CF   01DC
        CMPR    R1,     R4                      ; 64D0   014C
        MVO     R0,     G_01EC                  ; 64D1   0240 01EC
        ADD@    R3,     R4                      ; 64D3   02DC
        ADD@    R4,     R0                      ; 64D4   02E0
        ADD@    R5,     R4                      ; 64D5   02EC
        MOVR    R7,     R1                      ; 64D6   00B9
        ANDR    R3,     R0                      ; 64D7   0198
        BNEQ    L_6583                          ; 64D8   020C 00A9

        ADDR    R2,     R6                      ; 64DA   00D6
        ADD@    R3,     R0                      ; 64DB   02D8
        ANDR    R0,     R6                      ; 64DC   0186
        CMPR    R3,     R0                      ; 64DD   0158
        MOVR    R4,     R7                      ; 64DE   00A7

        DECLE   $00B7,  $0196,  $0116,  $0126   ; 64DF   00B7 0196 0116 0126
        DECLE   $0106,  $0256,  $00D2,  $01D0   ; 64E3   0106 0256 00D2 01D0
        DECLE   $0226,  $00C6,  $0138,  $0118   ; 64E7   0226 00C6 0138 0118
        DECLE   $00D8,  $00A3,  $01F6,  $0100   ; 64EB   00D8 00A3 01F6 0100
        DECLE   $00C8,  $0290,  $0156,  $01D6   ; 64EF   00C8 0290 0156 01D6
        DECLE   $00F6,  $011C,  $012C,  $014A   ; 64F3   00F6 011C 012C 014A
        DECLE   $00BB,  $021C                   ; 64F7   00BB 021C

        MOVR    R5,     R3                      ; 64F9   00AB
        ADDR    R3,     R2                      ; 64FA   00DA
        ADD@    R3,     R2                      ; 64FB   02DA
        ANDR    R3,     R2                      ; 64FC   019A
        ADDR    R5,     R2                      ; 64FD   00EA
        MVI@    R3,     R4                      ; 64FE   029C
        XORR    R7,     R4                      ; 64FF   01FC
        XORR    R2,     R0                      ; 6500   01D0
        XORR    R4,     R0                      ; 6501   01E0
        CMPR    R2,     R0                      ; 6502   0150
        MOVR    R2,     R0                      ; 6503   0090
        ADDR    R2,     R0                      ; 6504   00D0
        MOVR    R6,     R1                      ; 6505   00B1
        ANDR    R4,     R0                      ; 6506   01A0
        MOVR    R4,     R1                      ; 6507   00A1
        B       L_668A                          ; 6508   0200 0180

        DECLE   $00C0,  $011E,  $012E,  $0190   ; 650A   00C0 011E 012E 0190
        DECLE   $00E0,  $0001                   ; 650E   00E0 0001

        SUBR    R2,     R4                      ; 6510   0114
        CMPR    R0,     R0                      ; 6511   0140
        MOVR    R4,     R7                      ; 6512   00A7

        DECLE   $00E4,  $02E4,  $0144,  $00B5   ; 6513   00E4 02E4 0144 00B5
        DECLE   $00A5,  $0134,  $0194,  $0204   ; 6517   00A5 0134 0194 0204
        DECLE   $00F4,  $02B0,  $02D4,  $0120   ; 651B   00F4 02B0 02D4 0120
        DECLE   $0104,  $0154,  $02A4,  $01B0   ; 651F   0104 0154 02A4 01B0
        DECLE   $00AD,  $00D4,  $00BD,  $01AC   ; 6523   00AD 00D4 00BD 01AC
        DECLE   $02BC,  $0184,  $025C,  $0234   ; 6527   02BC 0184 025C 0234
        DECLE   $00C4,  $0250,  $0130,  $02C0   ; 652B   00C4 0250 0130 02C0
        DECLE   $00DC,  $02AC,  $02C4,  $014C   ; 652F   00DC 02AC 02C4 014C
        DECLE   $02A0,  $0260,  $02CC,  $018C   ; 6533   02A0 0260 02CC 018C
        DECLE   $023C,  $00FC,  $0210,  $00CC   ; 6537   023C 00FC 0210 00CC
        DECLE   $015C,  $019C,  $01F0,  $0100   ; 653B   015C 019C 01F0 0100
        DECLE   $0240,  $0110,  $02D0,  $0186   ; 653F   0240 0110 02D0 0186
        DECLE   $00D6,  $00F6,  $00B7,  $0146   ; 6543   00D6 00F6 00B7 0146
        DECLE   $0156,  $00A9,  $00B9,  $00B3   ; 6547   0156 00A9 00B9 00B3
        DECLE   $02D2,  $00A3,  $01D8,  $01E8   ; 654B   02D2 00A3 01D8 01E8
        DECLE   $0158,  $0152,  $0118,  $0148   ; 654F   0158 0152 0118 0148
        DECLE   $02D8,  $00AB,  $018A,  $014A   ; 6553   02D8 00AB 018A 014A
        DECLE   $00BB,  $029C,  $0124,  $00C8   ; 6557   00BB 029C 0124 00C8
        DECLE   $01DA,  $019A,  $0214,  $0138   ; 655B   01DA 019A 0214 0138
        DECLE   $00DA,  $0070,  $0060,  $00E1   ; 655F   00DA 0070 0060 00E1
        DECLE   $00C1,  $0250,  $00F1,  $00D1   ; 6563   00C1 0250 00F1 00D1
        DECLE   $0210                           ; 6567   0210

        XORR    R2,     R0                      ; 6568   01D0
        XORR    R4,     R0                      ; 6569   01E0
        MOVR    R4,     R1                      ; 656A   00A1
        MOVR    R6,     R1                      ; 656B   00B1
        SUBR    R6,     R0                      ; 656C   0130
        SUBR    R0,     R0                      ; 656D   0100
        SUBR    R1,     R4                      ; 656E   010C
        ADDR    R4,     R7                      ; 656F   00E7

        MVO@    R6,     R4                      ; 6570   0266
        ADDR    R1,     R7                      ; 6571   00CF
        ADDR    R5,     R7                      ; 6572   00EF

        DECLE   $0140,  $01C0,  $0150,  $010E   ; 6573   0140 01C0 0150 010E
        DECLE   $013E,  $0001                   ; 6577   013E 0001

        CMPR    R5,     R6                      ; 6579   016E
        PSHR    R6                              ; 657A   0276
        SUBR    R6,     R6                      ; 657B   0136
        SUBR    R2,     R6                      ; 657C   0116
        XORR    R6,     R0                      ; 657D   01F0
        ANDR    R0,     R0                      ; 657E   0180
        ADDR    R2,     R5                      ; 657F   00D5
        ANDR    R1,     R6                      ; 6580   018E
        MVO@    R6,     R2                      ; 6581   0256
        PULR    R0                              ; 6582   02B0
L_6583:
        ADD     G_00DF, R0                      ; 6583   02C0 00DF
        CMPR    R2,     R4                      ; 6585   0154
        ADD@    R4,     R6                      ; 6586   02E6
        ADDR    R0,     R7                      ; 6587   00C7

        DECLE   $01E6,  $02A0,  $02BE,  $011E   ; 6588   01E6 02A0 02BE 011E
        DECLE   $0200,  $0290,  $0224,  $0260   ; 658C   0200 0290 0224 0260
        DECLE   $0220,  $026E,  $0120,  $0110   ; 6590   0220 026E 0120 0110
        DECLE   $02E4,  $0156,  $00DD,  $02E0   ; 6594   02E4 0156 00DD 02E0
        DECLE   $02DC,  $02EC,  $0230,  $0234   ; 6598   02DC 02EC 0230 0234
        DECLE   $01FC,  $019C,  $00ED,  $00FD   ; 659C   01FC 019C 00ED 00FD
        DECLE   $00AD,  $023C,  $020C,  $00BD   ; 65A0   00AD 023C 020C 00BD
        DECLE   $012C,  $024C,  $00CD,  $014C   ; 65A4   012C 024C 00CD 014C
        DECLE   $018C,  $01EC,  $022C,  $015C   ; 65A8   018C 01EC 022C 015C
        DECLE   $0186,  $01DC,  $02D6,  $01F6   ; 65AC   0186 01DC 02D6 01F6
        DECLE   $0190,  $01E4,  $00B7,  $0294   ; 65B0   0190 01E4 00B7 0294
        DECLE   $0292,  $0146,  $0126,  $0296   ; 65B4   0292 0146 0126 0296
        DECLE   $025C,  $02A2,  $01D4,  $02B4   ; 65B8   025C 02A2 01D4 02B4
        DECLE   $02EA,  $013A,  $02AC,  $02F0   ; 65BC   02EA 013A 02AC 02F0
        DECLE   $025E,  $026E,  $027E,  $018E   ; 65C0   025E 026E 027E 018E
        DECLE   $0001,  $011C,  $01EE,  $012E   ; 65C4   0001 011C 01EE 012E
        DECLE   $010E,  $014E,  $02BE,  $0196   ; 65C8   010E 014E 02BE 0196
        DECLE   $028C,  $01AC,  $02AE,  $0296   ; 65CC   028C 01AC 02AE 0296
        DECLE   $0114,  $0134,  $0106,  $0194   ; 65D0   0114 0134 0106 0194
        DECLE   $012C,  $0104,  $00B4,  $00FC   ; 65D4   012C 0104 00B4 00FC
        DECLE   $021C,  $0001,  $023C,  $019C   ; 65D8   021C 0001 023C 019C
        DECLE   $00A4,  $00F4,  $01FC,  $0234   ; 65DC   00A4 00F4 01FC 0234
        DECLE   $018C,  $026C,  $022C,  $00E4   ; 65E0   018C 026C 022C 00E4
        DECLE   $020C,  $0148,  $024C,  $0228   ; 65E4   020C 0148 024C 0228
        DECLE   $0238,  $0188,  $02A8,  $010C   ; 65E8   0238 0188 02A8 010C
        DECLE   $0128,  $02CC,  $01DC,  $013C   ; 65EC   0128 02CC 01DC 013C
        DECLE   $00CC,  $029C,  $01F6,  $0226   ; 65F0   00CC 029C 01F6 0226
        DECLE   $0216,  $0232,  $02B4,  $00E8   ; 65F4   0216 0232 02B4 00E8
        DECLE   $0218,  $00A8,  $0132,  $0258   ; 65F8   0218 00A8 0132 0258
        DECLE   $02DA,  $024A,  $026A,  $02EC   ; 65FC   02DA 024A 026A 02EC
        DECLE   $029A,  $014C,  $0001,  $0216   ; 6600   029A 014C 0001 0216
        DECLE   $02E6,  $01F6,  $0206,  $0226   ; 6604   02E6 01F6 0206 0226
        DECLE   $0186,  $0236                   ; 6608   0186 0236

        MVO@    R6,     R4                      ; 660A   0266
        PSHR    R6                              ; 660B   0276
        MVO@    R6,     R2                      ; 660C   0256
        MVI@    R2,     R6                      ; 660D   0296
        XORR    R0,     R6                      ; 660E   01C6
        ANDR    R4,     R6                      ; 660F   01A6
        SUBR    R2,     R6                      ; 6610   0116
        CMPR    R0,     R6                      ; 6611   0146
        CMPR    R2,     R6                      ; 6612   0156
        SUBR    R6,     R6                      ; 6613   0136
        SUBR    R4,     R6                      ; 6614   0126
        MVO@    R0,     R2                      ; 6615   0250
        MVO@    R0,     R4                      ; 6616   0260
        PSHR    R0                              ; 6617   0270
        MVI@    R2,     R0                      ; 6618   0290
        XORR    R6,     R0                      ; 6619   01F0
        B       L_682C                          ; 661A   0200 0210

        DECLE   $02A0,  $01F0,  $0200,  $0266   ; 661C   02A0 01F0 0200 0266
        DECLE   $0276,  $0001,  $0250,  $0260   ; 6620   0276 0001 0250 0260
        DECLE   $0270,  $00C0,  $0120,  $0256   ; 6624   0270 00C0 0120 0256
        DECLE   $0146,  $0001,  $01FE,  $022E   ; 6628   0146 0001 01FE 022E
        DECLE   $020E,  $021E,  $019E,  $025E   ; 662C   020E 021E 019E 025E
        DECLE   $026E,  $027E,  $0292,  $0250   ; 6630   026E 027E 0292 0250
        DECLE   $0210,  $00EE,  $0120,  $01DC   ; 6634   0210 00EE 0120 01DC
        DECLE   $00EC,  $013C,  $02B0,  $00C0   ; 6638   00EC 013C 02B0 00C0
        DECLE   $011C,  $012C,  $02DC,  $021C   ; 663C   011C 012C 02DC 021C
        DECLE   $01FA,  $022A,  $025C,  $020A   ; 6640   01FA 022A 025C 020A
        DECLE   $023A,  $02EC,  $0110,  $0130   ; 6644   023A 02EC 0110 0130
        DECLE   $0001                           ; 6648   0001

        CMPR    R2,     R0                      ; 6649   0150
        XORR    R4,     R0                      ; 664A   01E0
        CLRC                                    ; 664B   0006
        SUBR    R0,     R0                      ; 664C   0100
        ADDR    R0,     R0                      ; 664D   00C0
        CLRR    R0                              ; 664E   01C0
        SUBR    R0,     R4                      ; 664F   0104
        XORR    R6,     R0                      ; 6650   01F0
        SUBR    R4,     R0                      ; 6651   0120
        SUBR    R6,     R4                      ; 6652   0134
        B       L_6865                          ; 6653   0200 0210

        DECLE   $02A0,  $007C,  $007C,  $008C   ; 6655   02A0 007C 007C 008C
        DECLE   $02BE,  $02C6,  $0001,  $0000   ; 6659   02BE 02C6 0001 0000
        DECLE   $02AE,  $0216,  $0228           ; 665D   02AE 0216 0228

        B       L_6427                          ; 6660   0220 023A

        SUBR    R2,     R0                      ; 6662   0110
        XORR    R2,     R4                      ; 6663   01D4
        XORR    R4,     R6                      ; 6664   01E6
        MOVR    R1,     R2                      ; 6665   008A
        SUBR    R6,     R0                      ; 6666   0130
        XORR    R6,     R0                      ; 6667   01F0
        ADDR    R6,     R0                      ; 6668   00F0
        B       L_690B                          ; 6669   0200 02A0

        DECLE   $012C,  $0001,  $0270,  $0230   ; 666B   012C 0001 0270 0230
        DECLE   $0100,  $0240,  $02C0,  $0104   ; 666F   0100 0240 02C0 0104
        DECLE   $0290,  $0202,  $0110,  $01F0   ; 6673   0290 0202 0110 01F0
        DECLE   $0030,  $005C,  $004C,  $0069   ; 6677   0030 005C 004C 0069
        DECLE   $0008,  $00CB,  $006C,  $0129   ; 667B   0008 00CB 006C 0129
        DECLE   $0028,  $016B,  $0000           ; 667F   0028 016B 0000

        ANDR    R0,     R6                      ; 6682   0186
        NEGR    R4                              ; 6683   0024
        ANDR    R2,     R2                      ; 6684   0192
        SLL     R0,     2                       ; 6685   004C
        ANDR    R6,     R0                      ; 6686   01B0
        INCR    R4                              ; 6687   000C
        XORR    R0,     R2                      ; 6688   01C2
        SLL     R0,     1                       ; 6689   0048
L_668A:
        XORR    R1,     R4                      ; 668A   01CC
        DECLE   $0004,  $01D5,  $0044,  $01E0   ; 668B   0004 01D5 0044 01E0
        DECLE   $0040,  $01E1,  $0020,  $01E3   ; 668F   0040 01E1 0020 01E3
        DECLE   $0060,  $0021,  $00FF,  $0000   ; 6693   0060 0021 00FF 0000
        DECLE   $0018,  $003C,  $007E,  $007E   ; 6697   0018 003C 007E 007E
        DECLE   $003C,  $0018,  $0000,  $0000   ; 669B   003C 0018 0000 0000
        DECLE   $0000,  $0018,  $003C,  $003C   ; 669F   0000 0018 003C 003C
        DECLE   $0018,  $0000,  $0000,  $00C0   ; 66A3   0018 0000 0000 00C0
        DECLE   $0080,  $003C,  $007C,  $0068   ; 66A7   0080 003C 007C 0068
        DECLE   $0038,  $0001,  $0003,  $00C0   ; 66AB   0038 0001 0003 00C0
        DECLE   $00C0,  $0038,  $006C,  $0078   ; 66AF   00C0 0038 006C 0078
        DECLE   $0078,  $0033,  $0003,  $0003   ; 66B3   0078 0033 0003 0003
        DECLE   $0001,  $003C,  $003E,  $0016   ; 66B7   0001 003C 003E 0016
        DECLE   $001C,  $0080,  $00C0,  $0003   ; 66BB   001C 0080 00C0 0003
        DECLE   $0003,  $001C,  $0036           ; 66BF   0003 001C 0036

        COMR    R6                              ; 66C2   001E
        COMR    R6                              ; 66C3   001E
        ADDR    R1,     R4                      ; 66C4   00CC
        ADDR    R0,     R0                      ; 66C5   00C0
        MOVR    R7,     R5                      ; 66C6   00BD
        ADDR    R1,     R3                      ; 66C7   00CB
        MOVR    R6,     R5                      ; 66C8   00B5
        RRC     R2,     2                       ; 66C9   0076
        ADDR    R4,     R7                      ; 66CA   00E7
        ADDR    R5,     R7                      ; 66CB   00EF
        ADDR    R5,     R7                      ; 66CC   00EF
        ADDR    R2,     R7                      ; 66CD   00D7

        MOVR    R7,     R5                      ; 66CE   00BD
        ADDR    R5,     R3                      ; 66CF   00EB
        MOVR    R7,     R5                      ; 66D0   00BD
        RRC     R2,     2                       ; 66D1   0076
        ADDR    R4,     R7                      ; 66D2   00E7
        ADDR    R5,     R7                      ; 66D3   00EF
        ADDR    R5,     R7                      ; 66D4   00EF
        ADDR    R2,     R7                      ; 66D5   00D7

        DECLE   $00BD,  $00CB,  $00F7,  $0076   ; 66D6   00BD 00CB 00F7 0076
        DECLE   $00F7                           ; 66DA   00F7

        ADDR    R5,     R7                      ; 66DB   00EF
        ADDR    R5,     R7                      ; 66DC   00EF
        ADDR    R2,     R7                      ; 66DD   00D7

        DECLE   $00FF,  $00CB,  $00BD,  $00F7   ; 66DE   00FF 00CB 00BD 00F7

        ADDR    R4,     R7                      ; 66E2   00E7
        ADDR    R5,     R7                      ; 66E3   00EF

        DECLE   $00FF,  $00D7,  $007F,  $007F   ; 66E4   00FF 00D7 007F 007F
        DECLE   $007F,  $003E,  $0000,  $0000   ; 66E8   007F 003E 0000 0000
        DECLE   $0000,  $0000,  $007E,  $00C3   ; 66EC   0000 0000 007E 00C3
        DECLE   $009D,  $00A1,  $00A1,  $009D   ; 66F0   009D 00A1 00A1 009D
        DECLE   $00C3,  $007E,  $0000,  $0000   ; 66F4   00C3 007E 0000 0000
        DECLE   $0000,  $0000                   ; 66F8   0000 0000

        RSWD    R6                              ; 66FA   003E
        SARC    R3,     2                       ; 66FB   007F
        SARC    R3,     2                       ; 66FC   007F
        SARC    R3,     2                       ; 66FD   007F
        DIS                                     ; 66FE   0003
        INCR    R7                              ; 66FF   000F

        RSWD    R4                              ; 6700   003C
L_6701:
        ADDR    R6,     R0                      ; 6701   00F0
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 6702   00C0 0000 0000 0000
        DECLE   $0003,  $0007,  $0006,  $00E3   ; 6706   0003 0007 0006 00E3
        DECLE   $00F0,  $0010,  $0000,  $0000   ; 670A   00F0 0010 0000 0000
        DECLE   $0001,  $0001,  $0001,  $0081   ; 670E   0001 0001 0001 0081
        DECLE   $0080,  $0080,  $0080,  $0000   ; 6712   0080 0080 0080 0000
        DECLE   $0003,  $0007,  $0006,  $00E3   ; 6716   0003 0007 0006 00E3
        DECLE   $00F0,  $0010,  $0000,  $0000   ; 671A   00F0 0010 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 671E   0000 0000 0000

        DIS                                     ; 6721   0003
        INCR    R7                              ; 6722   000F

        RSWD    R4                              ; 6723   003C
L_6724:
        ADDR    R6,     R0                      ; 6724   00F0
        DECLE   $00C0,  $0000,  $0000           ; 6725   00C0 0000 0000

        INCR    R0                              ; 6728   0008
        INCR    R7                              ; 6729   000F
        ADDR    R0,     R7                      ; 672A   00C7

L_672B:
        SLR     R0,     1                       ; 672B   0060
        DECLE   $00E0,  $00C0,  $0000,  $0001   ; 672C   00E0 00C0 0000 0001
        DECLE   $0001,  $0001,  $0081,  $0080   ; 6730   0001 0001 0081 0080
        DECLE   $0080,  $0080,  $0000,  $0000   ; 6734   0080 0080 0000 0000

        INCR    R0                              ; 6738   0008
        INCR    R7                              ; 6739   000F
        ADDR    R0,     R7                      ; 673A   00C7

L_673B:
        SLR     R0,     1                       ; 673B   0060
        DECLE   $00E0,  $00C0,  $0000,  $0000   ; 673C   00E0 00C0 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $0000   ; 6740   0000 0000 00FF 0000
        DECLE   $0000,  $0000,  $0000           ; 6744   0000 0000 0000

        NEGR    R0                              ; 6747   0020
        NEGR    R0                              ; 6748   0020
        ADCR    R0                              ; 6749   0028
        ADDR    R3,     R7                      ; 674A   00DF

        DECLE   $0010,  $0000,  $0000,  $0040   ; 674B   0010 0000 0000 0040
        DECLE   $00BA,  $0000,  $0060,  $00F0   ; 674F   00BA 0000 0060 00F0
        DECLE   $01F9,  $00F0,  $0060,  $0000   ; 6753   01F9 00F0 0060 0000
        DECLE   $0001,  $0060,  $00F1,  $0060   ; 6757   0001 0060 00F1 0060
        DECLE   $0001,  $03C0,  $0380,  $0300   ; 675B   0001 03C0 0380 0300
        DECLE   $0200,  $0004,  $000C,  $001C   ; 675F   0200 0004 000C 001C
        DECLE   $003C,  $003C,  $001C,  $000C   ; 6763   003C 003C 001C 000C
        DECLE   $0004,  $0100,  $0300,  $0380   ; 6767   0004 0100 0300 0380
        DECLE   $03C0,  $003C,  $001C,  $000C   ; 676B   03C0 003C 001C 000C
        DECLE   $0004,  $0003,  $0003,  $0004   ; 676F   0004 0003 0003 0004

        INCR    R4                              ; 6773   000C
        COMR    R4                              ; 6774   001C
        RSWD    R4                              ; 6775   003C
        XOR     G_0380, R0                      ; 6776   03C0 0380
        SUB     .BTAB.00,R0                     ; 6778   0300 0200
        DIS                                     ; 677A   0003
        DIS                                     ; 677B   0003
L_677C:
        B       L_6A7E                          ; 677C   0200 0300

        DECLE   $0380,  $03C0,  $03FC,  $00FC   ; 677E   0380 03C0 03FC 00FC
        DECLE   $003C,  $000C,  $0003,  $0003   ; 6782   003C 000C 0003 0003
        DECLE   $000C,  $003C,  $00FC,  $03FC   ; 6786   000C 003C 00FC 03FC
        DECLE   $0003,  $0300,  $03C0,  $03F0   ; 678A   0003 0300 03C0 03F0
        DECLE   $03FC,  $03FC,  $03F0,  $03C0   ; 678E   03FC 03FC 03F0 03C0
        DECLE   $0300,  $0003,  $0003,  $03FF   ; 6792   0300 0003 0003 03FF
        DECLE   $03FF                           ; 6796   03FF

        DIS                                     ; 6797   0003
        XORI    #$0003, R5                      ; 6798   03FD 0003
        XORI    #$030F, R5                      ; 679A   03FD 030F
        SUB@    R1,     R7                      ; 679C   030F

        DECLE   $003F,  $003F,  $03C3,  $03C3   ; 679D   003F 003F 03C3 03C3
        DECLE   $03FC,  $01F8,  $00F0,  $0001   ; 67A1   03FC 01F8 00F0 0001
        DECLE   $00F0,  $01F8,  $03FC,  $0004   ; 67A5   00F0 01F8 03FC 0004
        DECLE   $000C,  $001F,  $000C,  $0004   ; 67A9   000C 001F 000C 0004

        B       L_6AAF                          ; 67AD   0200 0300

        AND     G_0300, R3                      ; 67AF   0383 0300
        B       L_6BB2                          ; 67B1   0200 03FF

        DECLE   $03F0,  $03C0,  $0300,  $0000   ; 67B3   03F0 03C0 0300 0000
        DECLE   $03FF,  $00FC,  $003C,  $000C   ; 67B7   03FF 00FC 003C 000C
        DECLE   $0000,  $0006,  $000E,  $001D   ; 67BB   0000 0006 000E 001D
        DECLE   $001C,  $003E,  $007E,  $00FC   ; 67BF   001C 003E 007E 00FC
        DECLE   $00FD,  $01FE,  $03FE,  $0202   ; 67C3   00FD 01FE 03FE 0202
        DECLE   $0302,  $0381,  $0380,  $03C2   ; 67C7   0302 0381 0380 03C2
        DECLE   $03E2,  $03F0,  $03F1,  $03FA   ; 67CB   03E2 03F0 03F1 03FA
        DECLE   $03FE,  $01FE,  $00FE,  $007D   ; 67CF   03FE 01FE 00FE 007D
        DECLE   $007C,  $003E,  $001E,  $000C   ; 67D3   007C 003E 001E 000C
        DECLE   $000D,  $0006,  $0002,  $01FD   ; 67D7   000D 0006 0002 01FD
        DECLE   $00F8,  $0001,  $00F8,  $01FD   ; 67DB   00F8 0001 00F8 01FD
        DECLE   $03F9,  $03F1,  $03E0,  $03C0   ; 67DF   03F9 03F1 03E0 03C0
        DECLE   $0300,  $0000,  $0201,  $0301   ; 67E3   0300 0000 0201 0301
        DECLE   $0380,  $03C0,  $03F0,  $03FC   ; 67E7   0380 03C0 03F0 03FC
        DECLE   $03FC,  $03F0,  $03C0,  $0380   ; 67EB   03FC 03F0 03C0 0380
        DECLE   $0301,  $0201,  $03FC,  $00FC   ; 67EF   0301 0201 03FC 00FC
        DECLE   $003C,  $001C,  $000D,  $0005   ; 67F3   003C 001C 000D 0005
        DECLE   $0000,  $000C,  $003C,  $007C   ; 67F7   0000 000C 003C 007C
        DECLE   $00FD,  $01FD,  $0000,  $0300   ; 67FB   00FD 01FD 0000 0300
        DECLE   $03C0,  $03E0,  $03F1,  $03F9   ; 67FF   03C0 03E0 03F1 03F9
        DECLE   $03EC,  $023C                   ; 6803   03EC 023C

        ADD@    R5,     R5                      ; 6805   02ED
        XORI    #$0254, R4                      ; 6806   03FC 0254
        ADD@    R1,     R4                      ; 6808   02CC
        MVO@    R4,     R2                      ; 6809   0254
        XOR@    R4,     R4                      ; 680A   03E4
        ADD@    R3,     R0                      ; 680B   02D8
        SUB@    R4,     R4                      ; 680C   0324
        SUB@    R4,     R6                      ; 680D   0326
        SUB@    R1,     R4                      ; 680E   030C
        ADDR    R2,     R2                      ; 680F   00D2
        ADDR    R2,     R4                      ; 6810   00D4
        XOR     G_03C0, R1                      ; 6811   03C1 03C0
        ADDR    R2,     R2                      ; 6813   00D2
        ADDR    R2,     R4                      ; 6814   00D4
        XOR     G_00D2, R0                      ; 6815   03C0 00D2
        ADDR    R2,     R4                      ; 6817   00D4
        XOR     G_03C1, R1                      ; 6818   03C1 03C1
        ADDR    R2,     R2                      ; 681A   00D2
        ADDR    R2,     R7                      ; 681B   00D7

        DECLE   $00D4,  $03C1,  $0252,  $0328   ; 681C   00D4 03C1 0252 0328
        DECLE   $02DA,  $03E7                   ; 6820   02DA 03E7

        XOR@    R4,     R3                      ; 6822   03E3
        ADD@    R3,     R4                      ; 6823   02DC
        SUB@    R4,     R5                      ; 6824   0325
        SUB@    R5,     R2                      ; 6825   032A
        SUB@    R1,     R6                      ; 6826   030E
        ADDR    R3,     R1                      ; 6827   00D9
        ADDR    R3,     R2                      ; 6828   00DA
        ADDR    R3,     R4                      ; 6829   00DC
        ADDR    R3,     R6                      ; 682A   00DE
        ADDR    R3,     R1                      ; 682B   00D9
L_682C:
        ADDR    R3,     R0                      ; 682C   00D8
        DECLE   $00DC,  $00D8,  $00DC,  $00E0   ; 682D   00DC 00D8 00DC 00E0
        DECLE   $00DC,  $00E0,  $00DC,  $03C1   ; 6831   00DC 00E0 00DC 03C1
        DECLE   $00E0,  $00DC,  $00E2,  $0254   ; 6835   00E0 00DC 00E2 0254
        DECLE   $0310,  $0324,  $02DA,  $03E6   ; 6839   0310 0324 02DA 03E6
        DECLE   $03E3,  $02DE,  $0325,  $032C   ; 683D   03E3 02DE 0325 032C
        DECLE   $00E0,  $00DC,  $00E0,  $03C0   ; 6841   00E0 00DC 00E0 03C0
        DECLE   $00E0,  $03C0,  $00E0,  $0000   ; 6845   00E0 03C0 00E0 0000
        DECLE   $00E0,  $03C0,  $0000,  $00E0   ; 6849   00E0 03C0 0000 00E0
        DECLE   $0000                           ; 684D   0000

        XOR     G_00DC, R0                      ; 684E   03C0 00DC
        ADDR    R4,     R0                      ; 6850   00E0
        ADDR    R3,     R4                      ; 6851   00DC
        ADDR    R4,     R0                      ; 6852   00E0
        ADDR    R3,     R4                      ; 6853   00DC
        ADDR    R4,     R0                      ; 6854   00E0
        XOR     .BTAB.56,R0                     ; 6855   03C0 0256
        SUB@    R2,     R2                      ; 6857   0312
        SUB@    R4,     R5                      ; 6858   0325
        XOR@    R4,     R6                      ; 6859   03E6
        XOR@    R4,     R3                      ; 685A   03E3
        ADD@    R3,     R0                      ; 685B   02D8
        SUB@    R4,     R4                      ; 685C   0324
        SUB@    R4,     R6                      ; 685D   0326
        SUB@    R1,     R4                      ; 685E   030C
        ADDR    R3,     R4                      ; 685F   00DC
        ADDR    R4,     R0                      ; 6860   00E0
        ADDR    R3,     R4                      ; 6861   00DC
        XOR     G_00DC, R0                      ; 6862   03C0 00DC
        ADDR    R4,     R0                      ; 6864   00E0
L_6865:
        ADDR    R3,     R4                      ; 6865   00DC
        DECLE   $0002,  $0004,  $0000,  $0002   ; 6866   0002 0004 0000 0002
        DECLE   $0000,  $0002,  $0000,  $0002   ; 686A   0000 0002 0000 0002
        DECLE   $00DC,  $00E0,  $03C1,  $00DC   ; 686E   00DC 00E0 03C1 00DC
        DECLE   $03C1,  $0252,  $0328,  $0324   ; 6872   03C1 0252 0328 0324
        DECLE   $03E6,  $03E2,  $02DC,  $0325   ; 6876   03E6 03E2 02DC 0325
        DECLE   $032A,  $030E,  $00E0,  $00DC   ; 687A   032A 030E 00E0 00DC
        DECLE   $00E0,  $00DC,  $00E0,  $03C0   ; 687E   00E0 00DC 00E0 03C0
        DECLE   $00E0,  $0000,  $0004,  $0002   ; 6882   00E0 0000 0004 0002
        DECLE   $0004,  $0002,  $0000           ; 6886   0004 0002 0000

        EIS                                     ; 6889   0002
        XOR     G_00DC, R1                      ; 688A   03C1 00DC
        ADDR    R2,     R7                      ; 688C   00D7

        DECLE   $00E0,  $00DC,  $00E2,  $0258   ; 688D   00E0 00DC 00E2 0258
        DECLE   $032E,  $0324,  $02E0,  $03E5   ; 6891   032E 0324 02E0 03E5
        DECLE   $03E2,  $02E2,  $0325,  $032C   ; 6895   03E2 02E2 0325 032C
        DECLE   $00DC,  $00DE,  $00E0,  $00DC   ; 6899   00DC 00DE 00E0 00DC
        DECLE   $03C0,  $00DC,  $03C1,  $0002   ; 689D   03C0 00DC 03C1 0002
        DECLE   $0000,  $03C1,  $03C1,  $0000   ; 68A1   0000 03C1 03C1 0000
        DECLE   $03C1,  $0002,  $0000           ; 68A5   03C1 0002 0000

        EIS                                     ; 68A8   0002
        ADDR    R4,     R4                      ; 68A9   00E4
        ADDR    R4,     R0                      ; 68AA   00E0
        ADDR    R3,     R4                      ; 68AB   00DC
        MVO@    R4,     R2                      ; 68AC   0254
        SUB@    R5,     R6                      ; 68AD   032E
        SUB@    R4,     R4                      ; 68AE   0324
        ADD@    R4,     R4                      ; 68AF   02E4
        XOR@    R4,     R5                      ; 68B0   03E5
        XOR@    R4,     R2                      ; 68B1   03E2
        ADD@    R4,     R2                      ; 68B2   02E2
        SUB@    R4,     R5                      ; 68B3   0325
        SUB@    R2,     R4                      ; 68B4   0314
        XOR     .UART.0,R0                      ; 68B5   03C0 00E0
        ADDR    R3,     R4                      ; 68B7   00DC
        ADDR    R4,     R0                      ; 68B8   00E0
        XOR     .UART.0,R0                      ; 68B9   03C0 00E0
        ADDR    R3,     R7                      ; 68BB   00DF

        DECLE   $00DC,  $0002,  $0000,  $0002   ; 68BC   00DC 0002 0000 0002
        DECLE   $0000,  $0002,  $0006,  $0000   ; 68C0   0000 0002 0006 0000
        DECLE   $0002,  $0000,  $0002,  $025A   ; 68C4   0002 0000 0002 025A
        DECLE   $00DC,  $00E6,  $00E0,  $00DC   ; 68C8   00DC 00E6 00E0 00DC
        DECLE   $0312,  $0325,  $03E5,  $03E2   ; 68CC   0312 0325 03E5 03E2
        DECLE   $02E6,  $0325,  $0330,  $0316   ; 68D0   02E6 0325 0330 0316
        DECLE   $00DE,  $00E0,  $03C0,  $00E0   ; 68D4   00DE 00E0 03C0 00E0
        DECLE   $00DC,  $03C1,  $00E0,  $0000   ; 68D8   00DC 03C1 00E0 0000
        DECLE   $0005,  $0002,  $0000,  $0008   ; 68DC   0005 0002 0000 0008
        DECLE   $03C0,  $0000,  $0002,  $025B   ; 68E0   03C0 0000 0002 025B
        DECLE   $025A,  $00DC,  $00E8,  $00EA   ; 68E4   025A 00DC 00E8 00EA
        DECLE   $0325,  $0324,  $03E5,  $03E2   ; 68E8   0325 0324 03E5 03E2
        DECLE   $02E8,  $0325,  $0332,  $0318   ; 68EC   02E8 0325 0332 0318
        DECLE   $00E0,  $00DC,  $00E0,  $00DC   ; 68F0   00E0 00DC 00E0 00DC
        DECLE   $00E0,  $00DC,  $00E0,  $00DC   ; 68F4   00E0 00DC 00E0 00DC
        DECLE   $0002,  $0000,  $0196,  $0198   ; 68F8   0002 0000 0196 0198
        DECLE   $019A,  $000A,  $0000           ; 68FC   019A 000A 0000

        EIS                                     ; 68FF   0002
        MVO@    R2,     R3                      ; 6900   025A
        MVO@    R4,     R3                      ; 6901   025C
        CMP@    R4,     R0                      ; 6902   0360
        CMP@    R4,     R2                      ; 6903   0362
        INCR    R4                              ; 6904   000C
        INCR    R6                              ; 6905   000E
        AND     G_0386, R4                      ; 6906   0384 0386
        SUB@    R4,     R5                      ; 6908   0325
        ADD@    R4,     R4                      ; 6909   02E4
        XOR@    R4,     R4                      ; 690A   03E4
L_690B:
        XOR@    R4,     R3                      ; 690B   03E3
        DECLE   $02EA,  $0324,  $0334,  $031A   ; 690C   02EA 0324 0334 031A
        DECLE   $03C1,  $00DC,  $00E0,  $03C0   ; 6910   03C1 00DC 00E0 03C0
        DECLE   $00DC,  $00E6,  $00E0,  $03C0   ; 6914   00DC 00E6 00E0 03C0
        DECLE   $0002,  $019C,  $019E,  $01A0   ; 6918   0002 019C 019E 01A0
        DECLE   $0010,  $0012,  $0000,  $0015   ; 691C   0010 0012 0000 0015
        DECLE   $0014,  $0016,  $000C,  $0018   ; 6920   0014 0016 000C 0018
        DECLE   $0388,  $038A,  $0325,  $0324   ; 6924   0388 038A 0325 0324
        DECLE   $02E0,  $03E3,  $03E3,  $02E6   ; 6928   02E0 03E3 03E3 02E6
        DECLE   $0325,  $0330,  $0316,  $03C1   ; 692C   0325 0330 0316 03C1
        DECLE   $01A2,  $01A4,  $01A6,  $01A8   ; 6930   01A2 01A4 01A6 01A8
        DECLE   $00DC,  $03C0,  $0000,  $01A6   ; 6934   00DC 03C0 0000 01A6
        DECLE   $03C0,  $001A,  $0012,  $01AA   ; 6938   03C0 001A 0012 01AA
        DECLE   $01AC,  $01AA,  $01AE,  $000A   ; 693C   01AC 01AA 01AE 000A
        DECLE   $0014,  $001C,  $001E,  $038C   ; 6940   0014 001C 001E 038C
        DECLE   $0336,  $0324,  $01B0,  $01B2   ; 6944   0336 0324 01B0 01B2
        DECLE   $02E4,  $03E3,  $03E3,  $02E8   ; 6948   02E4 03E3 03E3 02E8
        DECLE   $0325,  $01B4,  $01B6,  $01AC   ; 694C   0325 01B4 01B6 01AC
        DECLE   $01A6,  $01B9,  $01A8,  $0196   ; 6950   01A6 01B9 01A8 0196
        DECLE   $00EC,  $01A2,  $01A6,  $0000   ; 6954   00EC 01A2 01A6 0000

        EIS                                     ; 6958   0002
        DECR    R2                              ; 6959   0012
        MVO@    R2,     R3                      ; 695A   025A
        ANDR    R7,     R2                      ; 695B   01BA
        ANDR    R7,     R4                      ; 695C   01BC
        ANDR    R4,     R6                      ; 695D   01A6
        EIS                                     ; 695E   0002
        NEGR    R0                              ; 695F   0020
        NEGR    R2                              ; 6960   0022
        ANDR    R3,     R4                      ; 6961   019C
        ANDR    R7,     R6                      ; 6962   01BE
        CLRR    R0                              ; 6963   01C0
        XORR    R0,     R2                      ; 6964   01C2
        XORR    R0,     R4                      ; 6965   01C4
        XORR    R0,     R2                      ; 6966   01C2
        XORR    R0,     R6                      ; 6967   01C6
        SUB@    R4,     R4                      ; 6968   0324
        ADD@    R4,     R0                      ; 6969   02E0
        XOR@    R4,     R2                      ; 696A   03E2
        XOR@    R4,     R4                      ; 696B   03E4
        XORR    R1,     R0                      ; 696C   01C8
        XORR    R1,     R2                      ; 696D   01CA
        ANDR    R7,     R1                      ; 696E   01B9
        MVO@    R6,     R3                      ; 696F   025E
        SUB@    R3,     R4                      ; 6970   031C
        MVO@    R0,     R4                      ; 6971   0260
        XOR     G_0196, R0                      ; 6972   03C0 0196
        XORR    R1,     R4                      ; 6974   01CC
        ADDR    R5,     R6                      ; 6975   00EE
        XOR     G_01CE, R0                      ; 6976   03C0 01CE
        NEGR    R4                              ; 6978   0024
        INCR    R2                              ; 6979   000A
        NEGR    R6                              ; 697A   0026
        COMR    R0                              ; 697B   0018
        XORR    R2,     R0                      ; 697C   01D0
        NEGR    R6                              ; 697D   0026
        COMR    R0                              ; 697E   0018
        ADCR    R1                              ; 697F   0029
        NEGR    R2                              ; 6980   0022
        NEGR    R6                              ; 6981   0026
        ANDR    R6,     R4                      ; 6982   01B4
        XORR    R0,     R3                      ; 6983   01C3
        CLRR    R2                              ; 6984   01D2
        XORR    R0,     R2                      ; 6985   01C2
        XORR    R2,     R4                      ; 6986   01D4
        SUB@    R4,     R4                      ; 6987   0324
        ADD@    R4,     R4                      ; 6988   02E4
        XOR@    R4,     R2                      ; 6989   03E2
        XOR@    R4,     R4                      ; 698A   03E4
        ADD@    R5,     R0                      ; 698B   02E8
        SUB@    R4,     R4                      ; 698C   0324
        XORR    R2,     R6                      ; 698D   01D6
        XORR    R0,     R2                      ; 698E   01C2
        XORR    R3,     R0                      ; 698F   01D8
        MVO@    R2,     R4                      ; 6990   0262
        SUB@    R3,     R6                      ; 6991   031E
        SUB@    R3,     R4                      ; 6992   031C
        XORR    R3,     R2                      ; 6993   01DA
        MVO@    R4,     R4                      ; 6994   0264
        ADDR    R6,     R0                      ; 6995   00F0
        MVO@    R4,     R4                      ; 6996   0264
        XORR    R1,     R6                      ; 6997   01CE
        NEGR    R4                              ; 6998   0024
        INCR    R2                              ; 6999   000A
        COMR    R4                              ; 699A   001C
        NEGR    R6                              ; 699B   0026
        XORR    R3,     R5                      ; 699C   01DD
        INCR    R7                              ; 699D   000F

        XORR    R3,     R5                      ; 699E   01DD
L_699F:
        XORR    R0,     R3                      ; 699F   01C3
        XORR    R0,     R3                      ; 69A0   01C3
        CLRR    R2                              ; 69A1   01D2
        XORR    R3,     R6                      ; 69A2   01DE
        XORR    R4,     R0                      ; 69A3   01E0
        XORR    R4,     R2                      ; 69A4   01E2
        ADD@    R5,     R4                      ; 69A5   02EC
        XOR@    R4,     R2                      ; 69A6   03E2
        XOR@    R4,     R5                      ; 69A7   03E5
        ADD@    R5,     R2                      ; 69A8   02EA
        CLRR    R4                              ; 69A9   01E4
        ANDR    R3,     R0                      ; 69AA   0198
        XORR    R0,     R2                      ; 69AB   01C2
        ANDR    R7,     R0                      ; 69AC   01B8
        ANDR    R3,     R0                      ; 69AD   0198
        ANDR    R7,     R4                      ; 69AE   01BC
        XORR    R1,     R6                      ; 69AF   01CE
        MVO@    R2,     R3                      ; 69B0   025A
        ADDR    R6,     R0                      ; 69B1   00F0
        MVO@    R2,     R3                      ; 69B2   025A
        XORR    R1,     R6                      ; 69B3   01CE
        COMR    R2                              ; 69B4   001A
        INCR    R2                              ; 69B5   000A
        MVO@    R2,     R3                      ; 69B6   025A
        XORR    R4,     R6                      ; 69B7   01E6
        XORR    R0,     R2                      ; 69B8   01C2
        XORR    R5,     R0                      ; 69B9   01E8
        NEGR    R6                              ; 69BA   0026
        ADCR    R2                              ; 69BB   002A
        ADCR    R4                              ; 69BC   002C
        ADCR    R7                              ; 69BD   002F

        ADCR    R6                              ; 69BE   002E
L_69BF:
        ADCR    R2                              ; 69BF   002A
        DECLE   $002C,  $0018,  $0324,  $03E5   ; 69C0   002C 0018 0324 03E5
        DECLE   $03E5,  $02E6,  $0338,  $01C2   ; 69C4   03E5 02E6 0338 01C2
        DECLE   $01A6,  $01A8,  $01A6,  $01C2   ; 69C8   01A6 01A8 01A6 01C2
        DECLE   $0198,  $025A,  $00F0,  $025A   ; 69CC   0198 025A 00F0 025A
        DECLE   $01CE,  $000B,  $025A,  $01DA   ; 69D0   01CE 000B 025A 01DA
        DECLE   $01C2,  $0030,  $0018,  $0266   ; 69D4   01C2 0030 0018 0266
        DECLE   $03C3,  $03C3,  $03C3,  $03C2   ; 69D8   03C3 03C3 03C3 03C2
        DECLE   $0324,  $02EE,  $03E4,  $03E5   ; 69DC   0324 02EE 03E4 03E5
        DECLE   $02E8,  $0268,  $01CC,  $025A   ; 69E0   02E8 0268 01CC 025A
        DECLE   $0196,  $01C3,  $01A6,  $01CE   ; 69E4   0196 01C3 01A6 01CE
        DECLE   $00F0,  $025A,  $01CE,  $0032   ; 69E8   00F0 025A 01CE 0032
        DECLE   $000A,  $025A,  $01B4,  $01E8   ; 69EC   000A 025A 01B4 01E8
        DECLE   $0035,  $025A,  $026B,  $026B   ; 69F0   0035 025A 026B 026B
        DECLE   $026A,  $026D,  $02F0,  $03E5   ; 69F4   026A 026D 02F0 03E5
        DECLE   $03E6,  $0268,  $01A8,  $0002   ; 69F8   03E6 0268 01A8 0002
        DECLE   $019C,  $01A8,  $01C3,  $01EA   ; 69FC   019C 01A8 01C3 01EA
        DECLE   $00F0,  $01EC,  $01CE,  $0024   ; 6A00   00F0 01EC 01CE 0024
        DECLE   $0012,  $0007,  $001C,  $0036   ; 6A04   0012 0007 001C 0036

        NEGR    R6                              ; 6A08   0026
        MVO@    R6,     R5                      ; 6A09   026E
        XOR     G_03C5, R5                      ; 6A0A   03C5 03C5
        XOR     G_03C4, R5                      ; 6A0C   03C5 03C4
        SUB@    R4,     R4                      ; 6A0E   0324
        ADD@    R5,     R6                      ; 6A0F   02EE
        XOR@    R4,     R4                      ; 6A10   03E4
        XOR@    R4,     R6                      ; 6A11   03E6
        MVO@    R0,     R5                      ; 6A12   0268
        NEGR    R4                              ; 6A13   0024
        ANDR    R5,     R0                      ; 6A14   01A8
        ANDR    R4,     R6                      ; 6A15   01A6
        ANDR    R3,     R4                      ; 6A16   019C
        XORR    R0,     R2                      ; 6A17   01C2
        ANDR    R4,     R6                      ; 6A18   01A6
        ANDR    R7,     R0                      ; 6A19   01B8
        ADDR    R6,     R0                      ; 6A1A   00F0
        ANDR    R7,     R0                      ; 6A1B   01B8
        ANDR    R5,     R0                      ; 6A1C   01A8
        COMR    R2                              ; 6A1D   001A
        XORR    R5,     R6                      ; 6A1E   01EE
        XORR    R0,     R2                      ; 6A1F   01C2
        XORR    R6,     R0                      ; 6A20   01F0
        MVO@    R4,     R2                      ; 6A21   0254
        COMR    R0                              ; 6A22   0018
        COMR    R4                              ; 6A23   001C
        COMR    R6                              ; 6A24   001E
        ADCR    R0                              ; 6A25   0028
        COMR    R0                              ; 6A26   0018
        COMR    R6                              ; 6A27   001E
        NEGR    R6                              ; 6A28   0026
        ADCR    R0                              ; 6A29   0028
        NEGR    R6                              ; 6A2A   0026
        COMR    R0                              ; 6A2B   0018
        SUB@    R4,     R4                      ; 6A2C   0324
        XOR@    R4,     R5                      ; 6A2D   03E5
        XOR@    R4,     R5                      ; 6A2E   03E5
        ADD@    R3,     R4                      ; 6A2F   02DC
        MVO@    R0,     R5                      ; 6A30   0268
        NEGR    R4                              ; 6A31   0024
        EIS                                     ; 6A32   0002
        ANDR    R5,     R0                      ; 6A33   01A8
        MVO@    R3,     R3                      ; 6A34   025B
        MVO@    R2,     R3                      ; 6A35   025A
        ADDR    R5,     R6                      ; 6A36   00EE
        ADDR    R3,     R2                      ; 6A37   00DA
        ADDR    R3,     R4                      ; 6A38   00DC
        COMR    R2                              ; 6A39   001A
        DECR    R2                              ; 6A3A   0012
        XORR    R6,     R2                      ; 6A3B   01F2
        ANDR    R3,     R4                      ; 6A3C   019C
        ANDR    R3,     R6                      ; 6A3D   019E
        ANDR    R3,     R4                      ; 6A3E   019C
        XORR    R6,     R4                      ; 6A3F   01F4
        COMR    R0                              ; 6A40   0018
        NEGR    R6                              ; 6A41   0026
        INCR    R7                              ; 6A42   000F

        RSWD    R0                              ; 6A43   0038
L_6A44:
        ADCR    R0                              ; 6A44   0028
        DECLE   $0019,  $0026,  $0320,  $02E0   ; 6A45   0019 0026 0320 02E0
        DECLE   $03E4,  $03E5,  $02DE,  $033A   ; 6A49   03E4 03E5 02DE 033A
        DECLE   $0002,  $0000,  $01A6,  $0198   ; 6A4D   0002 0000 01A6 0198
        DECLE   $025B,  $00F2,  $0008,  $001A   ; 6A51   025B 00F2 0008 001A
        DECLE   $0012,  $00F4,  $00DC,  $00E6   ; 6A55   0012 00F4 00DC 00E6
        DECLE   $01A8,  $01BC,  $019E,  $01B8   ; 6A59   01A8 01BC 019E 01B8
        DECLE   $01F6,  $01F8,  $01E0,  $00F6   ; 6A5D   01F6 01F8 01E0 00F6
        DECLE   $0322,  $003B,  $003A,  $033C   ; 6A61   0322 003B 003A 033C
        DECLE   $02EE,  $03E4,  $02F2,  $02F5   ; 6A65   02EE 03E4 02F2 02F5
        DECLE   $02F5,  $02F4,  $0270,  $001A   ; 6A69   02F5 02F4 0270 001A
        DECLE   $000B,  $0012,  $01DC,  $0007   ; 6A6D   000B 0012 01DC 0007
        DECLE   $00F8,  $003C,  $0012,  $0007   ; 6A71   00F8 003C 0012 0007
        DECLE   $0000                           ; 6A75   0000

        ADDR    R7,     R2                      ; 6A76   00FA
        ADDR    R4,     R6                      ; 6A77   00E6
        ADDR    R2,     R7                      ; 6A78   00D7

        ADDR    R2,     R6                      ; 6A79   00D6
        MVO@    R2,     R3                      ; 6A7A   025A
        ADDR    R4,     R0                      ; 6A7B   00E0
        ADDR    R6,     R4                      ; 6A7C   00F4
        XORR    R4,     R0                      ; 6A7D   01E0
L_6A7E:
        ADD@    R3,     R2                      ; 6A7E   02DA
        ADD@    R6,     R7                      ; 6A7F   02F7

        DECLE   $02F6,  $02F8,  $03E5,  $025B   ; 6A80   02F6 02F8 03E5 025B
        DECLE   $025B,  $0272,  $0008,  $0002   ; 6A84   025B 0272 0008 0002
        DECLE   $0274,  $01A6,  $025A,  $0196   ; 6A88   0274 01A6 025A 0196
        DECLE   $01F8,  $025A,  $00EE,  $00E2   ; 6A8C   01F8 025A 00EE 00E2
        DECLE   $000A,  $003E,  $00D2,  $00D4   ; 6A90   000A 003E 00D2 00D4
        DECLE   $0024,  $000A,  $0007,  $0032   ; 6A94   0024 000A 0007 0032
        DECLE   $00FD,  $00FE,  $0100,  $01FA   ; 6A98   00FD 00FE 0100 01FA
        DECLE   $01FD,  $01FD,  $01FD,  $0324   ; 6A9C   01FD 01FD 01FD 0324
        DECLE   $02F5,  $02FA,  $02D6,  $0024   ; 6AA0   02F5 02FA 02D6 0024
        DECLE   $0006,  $0000                   ; 6AA4   0006 0000

        COMR    R2                              ; 6AA6   001A
        DECR    R2                              ; 6AA7   0012
        SUBR    R0,     R2                      ; 6AA8   0102
        ADDR    R2,     R6                      ; 6AA9   00D6
        ANDR    R4,     R6                      ; 6AAA   01A6
        ADDR    R6,     R5                      ; 6AAB   00F5
        ANDR    R3,     R6                      ; 6AAC   019E
        ADDR    R3,     R4                      ; 6AAD   00DC
        ADDR    R5,     R6                      ; 6AAE   00EE
L_6AAF:
        ADDR    R3,     R2                      ; 6AAF   00DA
        DECLE   $025A,  $000A,  $0104,  $00F1   ; 6AB0   025A 000A 0104 00F1
        DECLE   $0106,  $000A,  $0000,  $025B   ; 6AB4   0106 000A 0000 025B
        DECLE   $025B,  $0032,  $00FD,  $00FC   ; 6AB8   025B 0032 00FD 00FC
        DECLE   $0108,  $00E6,  $025A,  $01A8   ; 6ABC   0108 00E6 025A 01A8
        DECLE   $01A6,  $025B,  $025A,  $0276   ; 6AC0   01A6 025B 025A 0276
        DECLE   $033E,  $025B,  $001A,  $0012   ; 6AC4   033E 025B 001A 0012
        DECLE   $00EE,  $00DA,  $0196,  $01FE   ; 6AC8   00EE 00DA 0196 01FE
        DECLE   $0364,  $0366,  $0198,  $00F0   ; 6ACC   0364 0366 0198 00F0
        DECLE   $00E4,  $010A,  $00DA,  $000A   ; 6AD0   00E4 010A 00DA 000A
        DECLE   $0278                           ; 6AD4   0278

        ADDR    R6,     R0                      ; 6AD5   00F0
        SUBR    R1,     R4                      ; 6AD6   010C
        DECR    R3                              ; 6AD7   0013
        ADDR    R6,     R4                      ; 6AD8   00F4
        SUBR    R1,     R6                      ; 6AD9   010E
        ADDR    R6,     R1                      ; 6ADA   00F1
        SUBR    R2,     R0                      ; 6ADB   0110
        SUBR    R2,     R2                      ; 6ADC   0112
        SETC                                    ; 6ADD   0007
        GSWD    R2                              ; 6ADE   0032
        SUBR    R2,     R4                      ; 6ADF   0114
        ADDR    R4,     R6                      ; 6AE0   00E6
        MVO@    R0,     R2                      ; 6AE1   0250
        B       L_6C9C                          ; 6AE2   0200 01B8

        DECLE   $01A8,  $00E0,  $00F4,  $0116   ; 6AE4   01A8 00E0 00F4 0116
        DECLE   $025A,  $025A,  $001A,  $0012   ; 6AE8   025A 025A 001A 0012
        DECLE   $00EE,  $00DA,  $0196,  $0202   ; 6AEC   00EE 00DA 0196 0202
        DECLE   $0118,  $0369,  $0204,  $00F0   ; 6AF0   0118 0369 0204 00F0
        DECLE   $011A,  $00FC,  $001A,  $000A   ; 6AF4   011A 00FC 001A 000A
        DECLE   $0040,  $00F0,  $000A,  $003E   ; 6AF8   0040 00F0 000A 003E
        DECLE   $025B,  $003C,  $0042,  $0044   ; 6AFC   025B 003C 0042 0044
        DECLE   $00FA,  $00F0,  $025A,  $025C   ; 6B00   00FA 00F0 025A 025C
        DECLE   $027A,  $0032,  $00FD,  $00FC   ; 6B04   027A 0032 00FD 00FC
        DECLE   $0108,  $00F0,  $00E6,  $00D6   ; 6B08   0108 00F0 00E6 00D6
        DECLE   $00E0,  $025A,  $0024,  $0012   ; 6B0C   00E0 025A 0024 0012
        DECLE   $00EE,  $00DA,  $0196,  $0202   ; 6B10   00EE 00DA 0196 0202
        DECLE   $0118,  $011C,  $011E,  $011C   ; 6B14   0118 011C 011E 011C
        DECLE   $0120,  $00F0,  $0122,  $0046   ; 6B18   0120 00F0 0122 0046
        DECLE   $027C,  $0044,  $000A,  $00F0   ; 6B1C   027C 0044 000A 00F0
        DECLE   $000A,  $0040,  $000A,  $0048   ; 6B20   000A 0040 000A 0048
        DECLE   $000A,  $003C,  $0040,  $027E   ; 6B24   000A 003C 0040 027E
        DECLE   $00F0,  $0360,  $0368,  $0124   ; 6B28   00F0 0360 0368 0124
        DECLE   $036A,  $027A,  $025B,  $0126   ; 6B2C   036A 027A 025B 0126
        DECLE   $00E6,  $0206,  $0198,  $025B   ; 6B30   00E6 0206 0198 025B
        DECLE   $00EC,  $00F0,  $00DA,  $0196   ; 6B34   00EC 00F0 00DA 0196
        DECLE   $0202,  $0118,  $011C,  $0368   ; 6B38   0202 0118 011C 0368
        DECLE   $011E,  $00F0,  $011A,  $0108   ; 6B3C   011E 00F0 011A 0108
        DECLE   $0128,  $012A,  $012C,  $012E   ; 6B40   0128 012A 012C 012E
        DECLE   $027C,  $00F0,  $000B,  $000B   ; 6B44   027C 00F0 000B 000B
        DECLE   $000B,  $000A,  $004A,  $00F0   ; 6B48   000B 000A 004A 00F0
        DECLE   $004C,  $0124,  $011C,  $011E   ; 6B4C   004C 0124 011C 011E
        DECLE   $0368,  $036C,  $0280,  $004E   ; 6B50   0368 036C 0280 004E
        DECLE   $00FD,  $0208,  $01A8,  $025A   ; 6B54   00FD 0208 01A8 025A
        DECLE   $025B,  $0196,  $0202,  $0368   ; 6B58   025B 0196 0202 0368
        DECLE   $011C,  $0118,  $0368,  $0120   ; 6B5C   011C 0118 0368 0120
        DECLE   $0130,  $0050,  $0208,  $00F1   ; 6B60   0130 0050 0208 00F1
        DECLE   $00F1,  $012A,  $00F0,  $000B   ; 6B64   00F1 012A 00F0 000B
        DECLE   $000B,  $000B,  $000A,  $0052   ; 6B68   000B 000B 000A 0052
        DECLE   $0132,  $0134,  $011C,  $0118   ; 6B6C   0132 0134 011C 0118
        DECLE   $011C,  $0118,  $011C,  $036C   ; 6B70   011C 0118 011C 036C
        DECLE   $0280,  $025B,  $025A,  $01F2   ; 6B74   0280 025B 025A 01F2
        DECLE   $025A,  $025A,  $0196,  $020A   ; 6B78   025A 025A 0196 020A
        DECLE   $0118,  $0137,  $011C,  $0120   ; 6B7C   0118 0137 011C 0120
        DECLE   $0130,  $0050,  $0054,  $020C   ; 6B80   0130 0050 0054 020C
        DECLE   $0138,  $00F1,  $00F0,  $013A   ; 6B84   0138 00F1 00F0 013A
        DECLE   $00F0,  $000A,  $0044,  $0032   ; 6B88   00F0 000A 0044 0032
        DECLE   $000B,  $000B,  $0046,  $0282   ; 6B8C   000B 000B 0046 0282
        DECLE   $0108,  $013C,  $011C,  $0368   ; 6B90   0108 013C 011C 0368
        DECLE   $013E,  $0140,  $011C,  $036C   ; 6B94   013E 0140 011C 036C
        DECLE   $0280,  $0284,  $025A,  $01F2   ; 6B98   0280 0284 025A 01F2
        DECLE   $019A,  $01D6,  $01C2,  $020A   ; 6B9C   019A 01D6 01C2 020A
        DECLE   $011C,  $0369,  $0118,  $0136   ; 6BA0   011C 0369 0118 0136
        DECLE   $013E,  $000A,  $0368,  $020C   ; 6BA4   013E 000A 0368 020C
        DECLE   $01A8,  $00F1,  $00F0,  $00E2   ; 6BA8   01A8 00F1 00F0 00E2
        DECLE   $00F0,  $0056,  $0058,  $027E   ; 6BAC   00F0 0056 0058 027E
L_6BB0:
        GSWD    R2                              ; 6BB0   0032
        INCR    R3                              ; 6BB1   000B
L_6BB2:
        DECR    R2                              ; 6BB2   0012
        DECLE   $005A,  $036E,  $000A,  $0142   ; 6BB3   005A 036E 000A 0142
        DECLE   $0118,  $011C,  $013E,  $0368   ; 6BB7   0118 011C 013E 0368
        DECLE   $0118,  $0368,  $0286,  $025B   ; 6BBB   0118 0368 0286 025B
        DECLE   $01C2,  $01CE,  $0206,  $01C2   ; 6BBF   01C2 01CE 0206 01C2
        DECLE   $020A,  $0016,  $011C,  $011E   ; 6BC3   020A 0016 011C 011E
        DECLE   $011C,  $0368,  $013E,  $000A   ; 6BC7   011C 0368 013E 000A
        DECLE   $0368,  $0288,  $01A6,  $00F0   ; 6BCB   0368 0288 01A6 00F0
        DECLE   $0138,  $0192,  $0144,  $00F0   ; 6BCF   0138 0192 0144 00F0
        DECLE   $0056,  $000A,  $0040,  $027E   ; 6BD3   0056 000A 0040 027E
        DECLE   $0032,  $0012,  $028A,  $028C   ; 6BD7   0032 0012 028A 028C
        DECLE   $0368,  $000A,  $0140,  $0146   ; 6BDB   0368 000A 0140 0146
        DECLE   $0148,  $0146,  $0118,  $011C   ; 6BDF   0148 0146 0118 011C
        DECLE   $0368,  $014A,  $0198,  $01C2   ; 6BE3   0368 014A 0198 01C2
        DECLE   $01A6,  $01CE,  $0206,  $01C2   ; 6BE7   01A6 01CE 0206 01C2
        DECLE   $020A,  $005C,  $0016,  $0368   ; 6BEB   020A 005C 0016 0368
        DECLE   $0118,  $0368,  $013E,  $005E   ; 6BEF   0118 0368 013E 005E
        DECLE   $0060,  $0288,  $01A8,  $014C   ; 6BF3   0060 0288 01A8 014C
        DECLE   $010A,  $00F0,  $014E,  $0194   ; 6BF7   010A 00F0 014E 0194
        DECLE   $0056,  $027C,  $027E,  $0062   ; 6BFB   0056 027C 027E 0062
        DECLE   $027E,  $0064,  $001A,  $003E   ; 6BFF   027E 0064 001A 003E
        DECLE   $036E,  $000A,  $0118,  $011C   ; 6C03   036E 000A 0118 011C
        DECLE   $0149,  $0118,  $0142,  $0136   ; 6C07   0149 0118 0142 0136
        DECLE   $0142,  $020E,  $01C3,  $01CE   ; 6C0B   0142 020E 01C3 01CE
        DECLE   $028E,  $0210                   ; 6C0F   028E 0210

        BNOV    L_6C29                          ; 6C11   020A 0016

L_6C13:
        SLLC    R0,     2                       ; 6C13   005C
        DECR    R4                              ; 6C14   0014
        SUBR    R1,     R0                      ; 6C15   0108
        SUBR    R3,     R0                      ; 6C16   0118
        SUBR    R3,     R4                      ; 6C17   011C
        SUBR    R3,     R0                      ; 6C18   0118
        INCR    R2                              ; 6C19   000A
        MVI@    R1,     R0                      ; 6C1A   0288
        ANDR    R4,     R6                      ; 6C1B   01A6
        SUBR    R7,     R2                      ; 6C1C   013A
        ADDR    R6,     R1                      ; 6C1D   00F1
        ADDR    R6,     R0                      ; 6C1E   00F0
        CMPR    R1,     R4                      ; 6C1F   014C
        SLR     R2,     2                       ; 6C20   0066
        MVI@    R2,     R0                      ; 6C21   0290
        SWAP    R0,     1                       ; 6C22   0040
        SAR     R0,     1                       ; 6C23   0068
        SWAP    R0,     1                       ; 6C24   0040
        INCR    R3                              ; 6C25   000B
        RSWD    R6                              ; 6C26   003E
        MVI     .STIC.Y.2,R2                    ; 6C27   0282 000A
L_6C29:
        CMP@    R5,     R0                      ; 6C29   0368
        DECLE   $014A,  $0118,  $011C,  $0368   ; 6C2A   014A 0118 011C 0368
        DECLE   $0140,  $0368,  $014A,  $0212   ; 6C2E   0140 0368 014A 0212
        DECLE   $01C2,  $01A8,  $01EA,  $0292   ; 6C32   01C2 01A8 01EA 0292
        DECLE   $0214,  $0216,  $005C,  $0014   ; 6C36   0214 0216 005C 0014
        DECLE   $0016,  $005C,  $0016,  $0118   ; 6C3A   0016 005C 0016 0118
        DECLE   $013E,  $000A,  $0288,  $01CE   ; 6C3E   013E 000A 0288 01CE
        DECLE   $0116,  $0138,  $00F1,  $00F0   ; 6C42   0116 0138 00F1 00F0
        DECLE   $012E,  $0056,  $027E,  $0032   ; 6C46   012E 0056 027E 0032
        DECLE   $000B,  $000A,  $003E,  $0368   ; 6C4A   000B 000A 003E 0368
        DECLE   $005E,  $006A,  $014A,  $011C   ; 6C4E   005E 006A 014A 011C
        DECLE   $0118,  $011C,  $0149,  $0118   ; 6C52   0118 011C 0149 0118
        DECLE   $0218,  $021A,  $019E,  $025A   ; 6C56   0218 021A 019E 025A
        DECLE   $0292,  $021C,  $021E,  $0368   ; 6C5A   0292 021C 021E 0368
        DECLE   $005C,  $0368,  $006C,  $005C   ; 6C5E   005C 0368 006C 005C
        DECLE   $011C,  $013E,  $000A,  $0288   ; 6C62   011C 013E 000A 0288
        DECLE   $01CE,  $0116,  $025A,  $0138   ; 6C66   01CE 0116 025A 0138
        DECLE   $00F1,  $00F0,  $0066,  $0040   ; 6C6A   00F1 00F0 0066 0040
        DECLE   $027E,  $0032,  $000B,  $003E   ; 6C6E   027E 0032 000B 003E
        DECLE   $0282,  $006C,  $0104,  $0118   ; 6C72   0282 006C 0104 0118
        DECLE   $0136,  $011C,  $0368,  $011C   ; 6C76   0136 011C 0368 011C
        DECLE   $0118,  $006E,  $020C,  $0368   ; 6C7A   0118 006E 020C 0368
        DECLE   $0286,  $025A,  $0294,  $0212   ; 6C7E   0286 025A 0294 0212

        B       L_6C13                          ; 6C82   0220 0070

        DECR    R6                              ; 6C84   0016
        CMP@    R5,     R0                      ; 6C85   0368
        RLC     R1,     1                       ; 6C86   0051
        SAR     R0,     2                       ; 6C87   006C
        SLLC    R0,     2                       ; 6C88   005C
        INCR    R2                              ; 6C89   000A
        MVI@    R2,     R6                      ; 6C8A   0296
        XORR    R1,     R6                      ; 6C8B   01CE
        ADDR    R6,     R0                      ; 6C8C   00F0
        MVI     G_00EC, R4                      ; 6C8D   0284 00EC
        ADDR    R6,     R1                      ; 6C8F   00F1
        ADDR    R6,     R0                      ; 6C90   00F0
        SUBR    R5,     R2                      ; 6C91   012A
        INCR    R2                              ; 6C92   000A
        SLR     R2,     2                       ; 6C93   0066
        INCR    R3                              ; 6C94   000B
        INCR    R2                              ; 6C95   000A
        SLLC    R2,     1                       ; 6C96   005A
        CMP@    R5,     R0                      ; 6C97   0368
        DECR    R6                              ; 6C98   0016
        SUBR    R0,     R4                      ; 6C99   0104
        SUBR    R3,     R4                      ; 6C9A   011C
        CMP@    R5,     R0                      ; 6C9B   0368
L_6C9C:
        CMPR    R1,     R2                      ; 6C9C   014A
        DECLE   $0368,  $014A,  $011C,  $006E   ; 6C9D   0368 014A 011C 006E
        DECLE   $020C,  $0369,  $0284,  $0292   ; 6CA1   020C 0369 0284 0292
        DECLE   $0222,  $0070,  $0016,  $005C   ; 6CA5   0222 0070 0016 005C
        DECLE   $0369,  $005E,  $0072,  $005C   ; 6CA9   0369 005E 0072 005C
        DECLE   $0054,  $0288,  $01CE,  $00F0   ; 6CAD   0054 0288 01CE 00F0
        DECLE   $0284,  $0150,  $010E,  $0152   ; 6CB1   0284 0150 010E 0152
        DECLE   $0154,  $0284,  $000A,  $0074   ; 6CB5   0154 0284 000A 0074
        DECLE   $000B,  $0052,  $028E,  $0368   ; 6CB9   000B 0052 028E 0368
        DECLE   $006E,  $0104,  $0118,  $011C   ; 6CBD   006E 0104 0118 011C
        DECLE   $014A,  $011C,  $0118,  $0368   ; 6CC1   014A 011C 0118 0368
        DECLE   $005C,  $020C,  $0224,  $0368   ; 6CC5   005C 020C 0224 0368
        DECLE   $0284,  $0292,  $0222,  $0368   ; 6CC9   0284 0292 0222 0368
        DECLE   $005C,  $0016,  $005C,  $0016   ; 6CCD   005C 0016 005C 0016
        DECLE   $0072,  $0368,  $0016,  $0368   ; 6CD1   0072 0368 0016 0368
        DECLE   $0288,  $01CE,  $00F0,  $0284   ; 6CD5   0288 01CE 00F0 0284
        DECLE   $00D2,  $00D6,  $0008,  $0058   ; 6CD9   00D2 00D6 0008 0058
        DECLE   $0284,  $000A,  $0284,  $027C   ; 6CDD   0284 000A 0284 027C
        DECLE   $0006,  $0298,  $029A,  $0368   ; 6CE1   0006 0298 029A 0368
        DECLE   $006E,  $0368,  $011C,  $0118   ; 6CE5   006E 0368 011C 0118
        DECLE   $0137,  $005C,  $0014,  $0016   ; 6CE9   0137 005C 0014 0016
        DECLE   $0368,  $0226,  $0224,  $0296   ; 6CED   0368 0226 0224 0296
        DECLE   $0292,  $0222,  $0368,  $0016   ; 6CF1   0292 0222 0368 0016
        DECLE   $005C,  $0014,  $0076,  $0368   ; 6CF5   005C 0014 0076 0368
        DECLE   $0016,  $005C,  $0078,  $0286   ; 6CF9   0016 005C 0078 0286
        DECLE   $01A8,  $00F0,  $012C,  $0154   ; 6CFD   01A8 00F0 012C 0154
        DECLE   $0285,  $007A,  $0040,  $0012   ; 6D01   0285 007A 0040 0012
        DECLE   $0000,  $029C,  $0285,  $0282   ; 6D05   0000 029C 0285 0282
        DECLE   $0016,  $0073,  $0072,  $005C   ; 6D09   0016 0073 0072 005C
        DECLE   $0015,  $0016,  $0368,  $005C   ; 6D0D   0015 0016 0368 005C
        DECLE   $0076,  $0368,  $0226,  $0288   ; 6D11   0076 0368 0226 0288
        DECLE   $0292,  $0222,  $0016,  $005C   ; 6D15   0292 0222 0016 005C
        DECLE   $0369,  $0370,  $005C,  $006E   ; 6D19   0369 0370 005C 006E
        DECLE   $006C,  $0014,  $029E,  $00E0   ; 6D1D   006C 0014 029E 00E0
        DECLE   $01A8,  $00F0,  $00E6,  $0284   ; 6D21   01A8 00F0 00E6 0284
        DECLE   $00D2,  $0058,  $0056,  $003E   ; 6D25   00D2 0058 0056 003E
        DECLE   $0024,  $03AA,  $02A0,  $028E   ; 6D29   0024 03AA 02A0 028E
        DECLE   $0368,  $005C,  $0370,  $005C   ; 6D2D   0368 005C 0370 005C
        DECLE   $0368,  $0016,  $0368,  $0016   ; 6D31   0368 0016 0368 0016
        DECLE   $005C,  $0014,  $0016,  $005E   ; 6D35   005C 0014 0016 005E
        DECLE   $0368,  $020C,  $0288,  $0292   ; 6D39   0368 020C 0288 0292
        DECLE   $0222,  $005C,  $0016,  $005C   ; 6D3D   0222 005C 0016 005C
        DECLE   $007C,  $005C,  $0016,  $005C   ; 6D41   007C 005C 0016 005C
        DECLE   $0076,  $006C,  $0368,  $00E4   ; 6D45   0076 006C 0368 00E4
        DECLE   $00E0,  $01A8,  $00F0,  $012C   ; 6D49   00E0 01A8 00F0 012C
        DECLE   $0154,  $007A,  $000A,  $0040   ; 6D4D   0154 007A 000A 0040
        DECLE   $001A,  $007E,  $02A2,  $029A   ; 6D51   001A 007E 02A2 029A
        DECLE   $0368,  $0016,  $0368,  $0016   ; 6D55   0368 0016 0368 0016
        DECLE   $0073,  $0072,  $005C,  $0016   ; 6D59   0073 0072 005C 0016
        DECLE   $005C,  $0014,  $0016,  $0368   ; 6D5D   005C 0014 0016 0368
        DECLE   $020C,  $0288,  $0294,  $0218   ; 6D61   020C 0288 0294 0218
        DECLE   $0016,  $0368,  $006C,  $0014   ; 6D65   0016 0368 006C 0014
        DECLE   $0016,  $005C,  $0016,  $005C   ; 6D69   0016 005C 0016 005C
        DECLE   $0016,  $0372,  $00E5,  $00E0   ; 6D6D   0016 0372 00E5 00E0
        DECLE   $01A8,  $00F0,  $00E6,  $0284   ; 6D71   01A8 00F0 00E6 0284
        DECLE   $000A,  $0046,  $02A4,  $0080   ; 6D75   000A 0046 02A4 0080
        DECLE   $03AC,  $0294,  $0368,  $0370   ; 6D79   03AC 0294 0368 0370
        DECLE   $0072,  $005C,  $0370,  $005C   ; 6D7D   0072 005C 0370 005C
        DECLE   $0369,  $006E,  $0368,  $005C   ; 6D81   0369 006E 0368 005C
        DECLE   $0016,  $0078,  $020C,  $0288   ; 6D85   0016 0078 020C 0288
        DECLE   $0292,  $0016,  $0218,  $0229   ; 6D89   0292 0016 0218 0229
        DECLE   $0229,  $0228,  $0082,  $0368   ; 6D8D   0229 0228 0082 0368
        DECLE   $0340,  $0342,  $0156,  $0158   ; 6D91   0340 0342 0156 0158
        DECLE   $015A,  $01DE,  $01F0,  $00F0   ; 6D95   015A 01DE 01F0 00F0
        DECLE   $003C,  $000A,  $005A,  $02A4   ; 6D99   003C 000A 005A 02A4
        DECLE   $0084,  $03AA,  $02A6,  $02A8   ; 6D9D   0084 03AA 02A6 02A8
        DECLE   $0374,  $0368,  $0370,  $0073   ; 6DA1   0374 0368 0370 0073
        DECLE   $005C,  $0016,  $005C,  $0014   ; 6DA5   005C 0016 005C 0014
        DECLE   $0016,  $0369,  $020C,  $0288   ; 6DA9   0016 0369 020C 0288
        DECLE   $0292,  $005C,  $0016,  $0218   ; 6DAD   0292 005C 0016 0218
        DECLE   $0212,  $0369,  $020C,  $0340   ; 6DB1   0212 0369 020C 0340
        DECLE   $0344,  $0325,  $015C,  $0156   ; 6DB5   0344 0325 015C 0156
        DECLE   $00F6,  $0324,  $022A,  $00F0   ; 6DB9   00F6 0324 022A 00F0
        DECLE   $000A,  $0086,  $0284,  $03AE   ; 6DBD   000A 0086 0284 03AE
        DECLE   $007E,  $0084,  $0088,  $03AA   ; 6DC1   007E 0084 0088 03AA
        DECLE   $03B0,  $029D,  $02AA,  $02AC   ; 6DC5   03B0 029D 02AA 02AC
        DECLE   $0368,  $006E,  $0368,  $0370   ; 6DC9   0368 006E 0368 0370
        DECLE   $0072,  $0376,  $022C,  $0212   ; 6DCD   0072 0376 022C 0212
        DECLE   $0378,  $0292,  $0368,  $006E   ; 6DD1   0378 0292 0368 006E
        DECLE   $0368,  $02AE,  $02B0,  $01EC   ; 6DD5   0368 02AE 02B0 01EC
        DECLE   $022E,  $00F6,  $015C,  $00F6   ; 6DD9   022E 00F6 015C 00F6
        DECLE   $015C,  $00F6,  $015E,  $015A   ; 6DDD   015C 00F6 015E 015A
        DECLE   $00F1,  $00F0,  $000A,  $008A   ; 6DE1   00F1 00F0 000A 008A
        DECLE   $0338,  $03B2,  $03AA,  $007E   ; 6DE5   0338 03B2 03AA 007E
        DECLE   $0084,  $007E,  $008D,  $0084   ; 6DE9   0084 007E 008D 0084
        DECLE   $007E,  $03B4,  $02AC,  $005C   ; 6DED   007E 03B4 02AC 005C
        DECLE   $0015,  $0015,  $01EE,  $0216   ; 6DF1   0015 0015 01EE 0216
        DECLE   $037A,  $02B2,  $0374,  $006E   ; 6DF5   037A 02B2 0374 006E
        DECLE   $02B4,  $0284,  $0346,  $0230   ; 6DF9   02B4 0284 0346 0230
        DECLE   $0324,  $015C,  $00F6,  $0325   ; 6DFD   0324 015C 00F6 0325
        DECLE   $015C,  $0160,  $00F6,  $015C   ; 6E01   015C 0160 00F6 015C
        DECLE   $022A,  $00F0,  $000A,  $008A   ; 6E05   022A 00F0 000A 008A
        DECLE   $0348,  $0284,  $03AA,  $0084   ; 6E09   0348 0284 03AA 0084
        DECLE   $03AA,  $0162,  $0164,  $03AA   ; 6E0D   03AA 0162 0164 03AA
        DECLE   $007E,  $03B6,  $007E,  $03B4   ; 6E11   007E 03B6 007E 03B4
        DECLE   $037C,  $0368,  $006F,  $006E   ; 6E15   037C 0368 006F 006E
        DECLE   $020C,  $02B4,  $0284,  $0285   ; 6E19   020C 02B4 0284 0285
        DECLE   $0000,  $0284,  $02B6,  $0324   ; 6E1D   0000 0284 02B6 0324
        DECLE   $022A,  $0324,  $008E,  $0090   ; 6E21   022A 0324 008E 0090
        DECLE   $0161,  $0160,  $00F6,  $0090   ; 6E25   0161 0160 00F6 0090
        DECLE   $008E,  $022A,  $00F0,  $000A   ; 6E29   008E 022A 00F0 000A
        DECLE   $008A,  $0324,  $02B8,  $03AA   ; 6E2D   008A 0324 02B8 03AA
        DECLE   $007E,  $0084,  $0164,  $0162   ; 6E31   007E 0084 0164 0162
        DECLE   $0164,  $0162,  $007E,  $0084   ; 6E35   0164 0162 007E 0084
        DECLE   $007E,  $02A6,  $0284,  $003F   ; 6E39   007E 02A6 0284 003F
        DECLE   $003E,  $0232,  $0285,  $02FC   ; 6E3D   003E 0232 0285 02FC
        DECLE   $025A,  $0024,  $025A,  $02BA   ; 6E41   025A 0024 025A 02BA
        DECLE   $0324,  $022A,  $0092,  $0090   ; 6E45   0324 022A 0092 0090
        DECLE   $008E,  $003B,  $0090,  $0094   ; 6E49   008E 003B 0090 0094
        DECLE   $0096,  $0098,  $01E0,  $00F0   ; 6E4D   0096 0098 01E0 00F0
        DECLE   $000A,  $009A,  $0324,  $033A   ; 6E51   000A 009A 0324 033A
        DECLE   $03AA,  $0084,  $007E,  $00FC   ; 6E55   03AA 0084 007E 00FC
        DECLE   $0108,  $00FC,  $008D,  $000A   ; 6E59   0108 00FC 008D 000A
        DECLE   $008D,  $0008,  $009D,  $0012   ; 6E5D   008D 0008 009D 0012
        DECLE   $0232,  $0285,  $02FE,  $009E   ; 6E61   0232 0285 02FE 009E
        DECLE   $0002,  $0000,  $008E,  $0090   ; 6E65   0002 0000 008E 0090
        DECLE   $022A,  $008E,  $0324,  $008E   ; 6E69   022A 008E 0324 008E
        DECLE   $003A,  $0090,  $008E,  $034A   ; 6E6D   003A 0090 008E 034A
        DECLE   $034C,  $00A0,  $0234,  $000B   ; 6E71   034C 00A0 0234 000B
        DECLE   $00A2,  $0270,  $03B8,  $03AA   ; 6E75   00A2 0270 03B8 03AA
        DECLE   $007E,  $008D,  $00A4,  $000A   ; 6E79   007E 008D 00A4 000A
        DECLE   $00A6,  $0088,  $00A8,  $03AA   ; 6E7D   00A6 0088 00A8 03AA
        DECLE   $03BA,  $00AA,  $0166,  $0168   ; 6E81   03BA 00AA 0166 0168
        DECLE   $02BC,  $0232,  $019A,  $0284   ; 6E85   02BC 0232 019A 0284
        DECLE   $0300,  $025A,  $0000,  $0024   ; 6E89   0300 025A 0000 0024
        DECLE   $038E,  $008E,  $0236,  $0234   ; 6E8D   038E 008E 0236 0234
        DECLE   $008E,  $003A,  $0238,  $008E   ; 6E91   008E 003A 0238 008E
        DECLE   $034E,  $0382,  $0016,  $00AC   ; 6E95   034E 0382 0016 00AC
        DECLE   $019E,  $010E,  $000A,  $0110   ; 6E99   019E 010E 000A 0110
        DECLE   $00AE,  $00B0,  $00A4,  $000A   ; 6E9D   00AE 00B0 00A4 000A
        DECLE   $00A6,  $000A,  $0088,  $03AB   ; 6EA1   00A6 000A 0088 03AB
        DECLE   $03AA,  $007E,  $03AA,  $0390   ; 6EA5   03AA 007E 03AA 0390
        DECLE   $0166,  $016A,  $0388,  $023A   ; 6EA9   0166 016A 0388 023A
        DECLE   $0196,  $01EA,  $0302,  $02D6   ; 6EAD   0196 01EA 0302 02D6
        DECLE   $025A,  $0024,  $0002,  $038E   ; 6EB1   025A 0024 0002 038E
        DECLE   $01FA,  $023C,  $023E,  $01D0   ; 6EB5   01FA 023C 023E 01D0
        DECLE   $0236,  $022A,  $0240,  $0242   ; 6EB9   0236 022A 0240 0242
        DECLE   $0082,  $005C,  $0052,  $01CE   ; 6EBD   0082 005C 0052 01CE
        DECLE   $00B2,  $000A,  $00F0,  $027C   ; 6EC1   00B2 000A 00F0 027C
        DECLE   $0088,  $016C,  $016E,  $03AA   ; 6EC5   0088 016C 016E 03AA
        DECLE   $000A,  $007E,  $008C,  $016C   ; 6EC9   000A 007E 008C 016C
        DECLE   $0171,  $0170,  $0172,  $016A   ; 6ECD   0171 0170 0172 016A
        DECLE   $0166,  $0388,  $0244,  $01A6   ; 6ED1   0166 0388 0244 01A6
        DECLE   $01A0,  $02D6,  $02D6,  $025A   ; 6ED5   01A0 02D6 02D6 025A
        DECLE   $0024,  $0000,  $008E,  $0090   ; 6ED9   0024 0000 008E 0090
        DECLE   $00B5,  $0398,  $039A,  $0236   ; 6EDD   00B5 0398 039A 0236
        DECLE   $022A,  $0350,  $005C,  $0016   ; 6EE1   022A 0350 005C 0016
        DECLE   $0046,  $01CE,  $001A,  $02BE   ; 6EE5   0046 01CE 001A 02BE
        DECLE   $00F1,  $00F0,  $0174,  $0177   ; 6EE9   00F1 00F0 0174 0177
        DECLE   $00FC,  $0176,  $00FC,  $0178   ; 6EED   00FC 0176 00FC 0178
        DECLE   $03AA,  $03BC,  $02C0,  $0392   ; 6EF1   03AA 03BC 02C0 0392
        DECLE   $0166,  $0389,  $023A           ; 6EF5   0166 0389 023A

        ANDR    R3,     R0                      ; 6EF8   0198
        MVI     .BTAB.D6,R4                     ; 6EF9   0284 02D6
        ADD@    R2,     R6                      ; 6EFB   02D6
        MVO@    R2,     R3                      ; 6EFC   025A
        NEGR    R4                              ; 6EFD   0024
        EIS                                     ; 6EFE   0002
        AND@    R1,     R6                      ; 6EFF   038E
        TSTR    R6                              ; 6F00   00B6
        MOVR    R1,     R6                      ; 6F01   008E
        CMP@    R2,     R2                      ; 6F02   0352
        AND@    R3,     R5                      ; 6F03   039D
        CMP@    R2,     R4                      ; 6F04   0354
        BNOV    L_6BB0                          ; 6F05   022A 0356

        CMPR    R1,     R2                      ; 6F07   014A
        AND     G_0046, R2                      ; 6F08   0382 0046
        XORR    R1,     R6                      ; 6F0A   01CE
        INCR    R2                              ; 6F0B   000A
        MVO@    R2,     R3                      ; 6F0C   025A
        ADDR    R6,     R0                      ; 6F0D   00F0
        ADDR    R4,     R4                      ; 6F0E   00E4
        ADD     G_008D, R2                      ; 6F0F   02C2 008D
        MOVR    R1,     R4                      ; 6F11   008C
        INCR    R2                              ; 6F12   000A
        SARC    R2,     2                       ; 6F13   007E
        MOVR    R4,     R6                      ; 6F14   00A6
        ANDI    #$02C4, R4                      ; 6F15   03BC 02C4
        AND@    R3,     R6                      ; 6F17   039E
        AND@    R3,     R4                      ; 6F18   039C
        AND@    R2,     R4                      ; 6F19   0394
        CMPR    R5,     R2                      ; 6F1A   016A
        AND@    R2,     R6                      ; 6F1B   0396
        ADD     .PSG0.chn_c_lo,R6               ; 6F1C   02C6 01F2
        ANDR    R4,     R6                      ; 6F1E   01A6
        ANDR    R3,     R2                      ; 6F1F   019A
        ADD@    R2,     R6                      ; 6F20   02D6
        ADD@    R2,     R6                      ; 6F21   02D6
        MVO@    R2,     R3                      ; 6F22   025A
        NEGR    R4                              ; 6F23   0024
        CLRC                                    ; 6F24   0006
        MOVR    R0,     R6                      ; 6F25   0086
        MOVR    R7,     R0                      ; 6F26   00B8
        MOVR    R6,     R4                      ; 6F27   00B4
        CMP@    R3,     R0                      ; 6F28   0358
        CMPR    R7,     R2                      ; 6F29   017A
        CMPR    R7,     R4                      ; 6F2A   017C
        CMP@    R3,     R2                      ; 6F2B   035A
        XORR    R1,     R6                      ; 6F2C   01CE
        MVI     G_0118, R2                      ; 6F2D   0282 0118
        AND     G_037A, R2                      ; 6F2F   0382 037A
        XORR    R1,     R6                      ; 6F31   01CE
        INCR    R2                              ; 6F32   000A
        SUBR    R0,     R2                      ; 6F33   0102
        ADDR    R6,     R2                      ; 6F34   00F2
        SUBR    R7,     R2                      ; 6F35   013A
        ADD@    R1,     R0                      ; 6F36   02C8
        SARC    R2,     2                       ; 6F37   007E
        MOVR    R1,     R5                      ; 6F38   008D
        MOVR    R0,     R4                      ; 6F39   0084
        AND@    R5,     R2                      ; 6F3A   03AA
        ANDI    #$02CA, R6                      ; 6F3B   03BE 02CA
        AND@    R3,     R4                      ; 6F3D   039C
        CMPR    R7,     R2                      ; 6F3E   017A
        CMPR    R7,     R7                      ; 6F3F   017F
        ADDR    R3,     R4                      ; 6F40   00DC
        ADDR    R2,     R7                      ; 6F41   00D7

        DECLE   $0206,  $01A6,  $01EA,  $02D6   ; 6F42   0206 01A6 01EA 02D6
        DECLE   $02D6,  $0066,  $0002,  $00BA   ; 6F46   02D6 0066 0002 00BA
        DECLE   $00BC,  $0094,  $003A,  $00BE   ; 6F4A   00BC 0094 003A 00BE
        DECLE   $00C0,  $0180,  $02CC,  $01A8   ; 6F4E   00C0 0180 02CC 01A8
        DECLE   $0224,  $011C,  $0182,  $012C   ; 6F52   0224 011C 0182 012C
        DECLE   $00F2,  $000A,  $00F0,  $027C   ; 6F56   00F2 000A 00F0 027C
        DECLE   $0184,  $0186,  $0178,  $007E   ; 6F5A   0184 0186 0178 007E
        DECLE   $00A6,  $03AA,  $03BC,  $02C0   ; 6F5E   00A6 03AA 03BC 02C0
        DECLE   $0188,  $017A,  $00C0,  $039C   ; 6F62   0188 017A 00C0 039C
        DECLE   $03A0,  $0285,  $00E0,  $0284   ; 6F66   03A0 0285 00E0 0284
        DECLE   $019C,  $01A0,  $02D6,  $02D6   ; 6F6A   019C 01A0 02D6 02D6
        DECLE   $0024,  $00C2,  $037E,  $0362   ; 6F6E   0024 00C2 037E 0362
        DECLE   $035C,  $035E,  $03A2,  $00C4   ; 6F72   035C 035E 03A2 00C4
        DECLE   $018A,  $0180,  $012C,  $00F0   ; 6F76   018A 0180 012C 00F0
        DECLE   $00F2,  $00FC,  $018C,  $0012   ; 6F7A   00F2 00FC 018C 0012
        DECLE   $000A,  $00F0,  $025A,  $0044   ; 6F7E   000A 00F0 025A 0044
        DECLE   $0184,  $0186,  $0171,  $018E   ; 6F82   0184 0186 0171 018E
        DECLE   $00F0,  $0190,  $017E,  $010C   ; 6F86   00F0 0190 017E 010C
        DECLE   $00C6,  $00C8,  $03A4,  $0285   ; 6F8A   00C6 00C8 03A4 0285
        DECLE   $00DC,  $00D6,  $01A6,  $019A   ; 6F8E   00DC 00D6 01A6 019A
        DECLE   $02D6,  $0304,  $0024,  $037C   ; 6F92   02D6 0304 0024 037C
        DECLE   $0363,  $0372,  $025A,  $02CE   ; 6F96   0363 0372 025A 02CE
        DECLE   $00C0,  $00C4,  $00C0,  $0068   ; 6F9A   00C0 00C4 00C0 0068
        DECLE   $000B,  $0246,  $0248,  $01CE   ; 6F9E   000B 0246 0248 01CE
        DECLE   $000A,  $00F0,  $025C,  $027A   ; 6FA2   000A 00F0 025C 027A
        DECLE   $004E,  $00FA,  $00FD,  $00FC   ; 6FA6   004E 00FA 00FD 00FC
        DECLE   $010C,  $00C6,  $00C0,  $00C6   ; 6FAA   010C 00C6 00C0 00C6
        DECLE   $024A,  $024C,  $0198,  $01BC   ; 6FAE   024A 024C 0198 01BC
        DECLE   $01A4,  $01EC,  $00EE,  $01C2   ; 6FB2   01A4 01EC 00EE 01C2
        DECLE   $01EA,  $02D6,  $0306,  $0002   ; 6FB6   01EA 02D6 0306 0002
        DECLE   $025A,  $02A8,  $0374,  $036C   ; 6FBA   025A 02A8 0374 036C
        DECLE   $027A                           ; 6FBE   027A

        MVO@    R2,     R3                      ; 6FBF   025A
        AND@    R4,     R6                      ; 6FC0   03A6
        AND@    R3,     R4                      ; 6FC1   039C
        ADDR    R1,     R2                      ; 6FC2   00CA
        CMPI    #$0363, R6                      ; 6FC3   037E 0363
        MVO@    R6,     R1                      ; 6FC5   024E
        XORR    R7,     R6                      ; 6FC6   01FE
        BOV     L_6FD3                          ; 6FC7   0202 000A

        ADDR    R6,     R0                      ; 6FC9   00F0
        CMPI    #$0362, R6                      ; 6FCA   037E 0362
        ADD@    R2,     R0                      ; 6FCC   02D0
        SLL     R2,     2                       ; 6FCD   004E
        SETC                                    ; 6FCE   0007
        CLRC                                    ; 6FCF   0006
        PSHR    R4                              ; 6FD0   0274
        AND@    R4,     R6                      ; 6FD1   03A6
        ADDR    R1,     R4                      ; 6FD2   00CC
L_6FD3:
        MOVR    R7,     R2                      ; 6FD3   00BA
        DECLE   $03A8,  $02D2,  $0284,  $0200   ; 6FD4   03A8 02D2 0284 0200
        DECLE   $01F6,  $01A6,  $00F0,  $01A6   ; 6FD8   01F6 01A6 00F0 01A6
        DECLE   $01A0,  $02D6,  $0308,  $0000   ; 6FDC   01A0 02D6 0308 0000

        MVO@    R3,     R3                      ; 6FE0   025B
        MVO@    R2,     R3                      ; 6FE1   025A
        CMPI    #$037E, R4                      ; 6FE2   037C 037E
        CMP@    R5,     R2                      ; 6FE4   036A
        ADD@    R2,     R4                      ; 6FE5   02D4
        CMP@    R4,     R0                      ; 6FE6   0360
        SAR     R0,     2                       ; 6FE7   006C
        CMP@    R4,     R3                      ; 6FE8   0363
        CMP@    R4,     R2                      ; 6FE9   0362
        CMPI    #$0363, R6                      ; 6FEA   037E 0363
        INCR    R2                              ; 6FEC   000A
        ADDR    R6,     R0                      ; 6FED   00F0
        CMP@    R4,     R3                      ; 6FEE   0363
        CMP@    R4,     R3                      ; 6FEF   0363
        CMP@    R4,     R2                      ; 6FF0   0362
        AND     G_0363, R0                      ; 6FF1   0380 0363
        ADDR    R1,     R6                      ; 6FF3   00CE
        ADDR    R2,     R0                      ; 6FF4   00D0
        AND     G_0362, R0                      ; 6FF5   0380 0362
        ADD@    R2,     R0                      ; 6FF7   02D0
        MVI     .BTAB.84,R5                     ; 6FF8   0285 0284
        CLRR    R4                              ; 6FFA   01E4
        CMPR    R2,     R2                      ; 6FFB   0152
        CMPR    R2,     R4                      ; 6FFC   0154
        MVI     G_030A, R4                      ; 6FFD   0284 030A
        DECLE   $0000                           ; 6FFF   0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5059       $507A  
;;  $506F       $5060  
;;  $5074       $5063  
;;  $5075       $505E  
;;  $507C       $504D  
;;  $509D       $508B   $508F  
;;  $50B5       $5102  
;;  $50BC       $50B9  
;;  $50C3       $50C0  
;;  $50D5       $50FB  
;;  $50F5       $50D6  
;;  $50FA       $50F3   $50F6  
;;  $50FD       $50CB   $50D1  
;;  $5130       $5149  
;;  $5160       $515C  
;;  $5161       $515F  
;;  $5168       $5162  
;;  $5169       $5156   $5165  
;;  $516E       $5159  
;;  $5180       $517B  
;;  $5191       $560F  
;;  $5198       $51A4  
;;  $51A6       $518F  
;;  $51B7       $5214  
;;  $51FE       $51E9  
;;  $51FF       $51FD  
;;  $5210       $51BD  
;;  $5221       $5250  
;;  $5223       $579F   $594C  
;;  $5252       $5225  
;;  $5266       $525E  
;;  $527B       $5273  
;;  $5295       $529D  
;;  $529B       $5297  
;;  $52AD       $52A2  
;;  $52B5       $52C3  
;;  $52BE       $52B8   $52BB  
;;  $52CB       $59F7   $5AAD   $6104  
;;  $52CF       $52B0  
;;  $52DB       $52D2  
;;  $52DF       $59FB   $5A0A  
;;  $52ED       $5312  
;;  $530C       $5308  
;;  $5319       $5317  
;;  $531F       $5330  
;;  $5360       $535C  
;;  $5361       $535F  
;;  $5395       $5391  
;;  $53B1       $53AA  
;;  $53B2       $53B0  
;;  $53C2       $53AE  
;;  $53D5       $53D2  
;;  $53EB       $53E7  
;;  $541E       $541B  
;;  $5426       $5421   $5435  
;;  $5433       $5428  
;;  $5444       $5453  
;;  $5446       $544B  
;;  $5457       $543E  
;;  $545F       $548A  
;;  $547C       $5DDF   $5DE9   $6030   $6041   $604D  
;;  $548E       $543B  
;;  $5495       $54A0  
;;  $5497       $549A  
;;  $549A       $5DF0  
;;  $54A4       $548F  
;;  $54AA       $54AD  
;;  $54BB       $54B3   $54B7  
;;  $54C3       $54D1  
;;  $54CF       $54C6  
;;  $54F5       $54FB  
;;  $5515       $5510  
;;  $5518       $5523  
;;  $5525       $551E  
;;  $5528       $551A  
;;  $5538       $5535  
;;  $555C       $555A  
;;  $5570       $5D34   $603A   $6046  
;;  $5597       $558F  
;;  $559B       $5595  
;;  $55A0       $55A2  
;;  $55A4       $559E  
;;  $55A9       $55A5  
;;  $55AE       $5589  
;;  $55AF       $55AD  
;;  $55B3       $55B5  
;;  $55B7       $55B1  
;;  $5612       $560D  
;;  $5613       $5604  
;;  $561F       $561C  
;;  $5631       $5616  
;;  $5637       $5660  
;;  $565F       $5652   $5655  
;;  $5667       $5DA9   $5DE3  
;;  $5684       $5682  
;;  $56CF       $56E4  
;;  $56E3       $561F   $583C   $5E1A  
;;  $56E6       $56D6   $56DE  
;;  $56F4       $5771  
;;  $5757       $586D  
;;  $578E       $579B  
;;  $57C4       $57C1  
;;  $57C6       $57BD  
;;  $57D1       $57CD  
;;  $57EA       $5829   $5FB2   $60E5  
;;  $57ED       $57E2  
;;  $57F1       $57EA  
;;  $5804       $57F7  
;;  $5805       $57FD   $5802  
;;  $586F       $5855  
;;  $5875       $5860   $5868   $5878   $587C   $5885  
;;  $5876       $5864  
;;  $5883       $585A  
;;  $5893       $588F  
;;  $5895       $5889  
;;  $58A8       $58B6  
;;  $58B8       $58AB  
;;  $58DF       $589D  
;;  $590D       $5909  
;;  $590F       $5905  
;;  $5911       $5916  
;;  $591F       $55FF  
;;  $592C       $6121  
;;  $5943       $586B   $591D  
;;  $59BE       $59BA  
;;  $59D9       $59DD  
;;  $59DF       $59D1   $59DA  
;;  $59E5       $5A02  
;;  $59F2       $5400  
;;  $59FF       $61F7  
;;  $5A14       $57A7  
;;  $5A19       $5A10  
;;  $5A2B       $5A38  
;;  $5A36       $5A2D  
;;  $5A5A       $5A5A  
;;  $5A82       $623D   $6276  
;;  $5A86       $5A84  
;;  $5A8F       $621D   $6234   $6252   $6327  
;;  $5AA7       $5AB9   $5ABC  
;;  $5AAC       $6226   $6336  
;;  $5AB7       $5AB3  
;;  $5ABE       $5AAA  
;;  $5ACA       $5AC6  
;;  $5AD6       $5ADC  
;;  $5ADE       $5AD4   $5AD9  
;;  $5B05       $61FB  
;;  $5B5F       $5757   $5964  
;;  $5B77       $63E5  
;;  $5B7B       $5E92   $6442  
;;  $5B81       $63EA   $643C  
;;  $5B87       $639B  
;;  $5C7C       $5C79  
;;  $5CC0       $5CA2  
;;  $5CDA       $5CD4  
;;  $5CE6       $5CE0  
;;  $5CEE       $5CE8  
;;  $5CF0       $5CD8   $5CE4   $5CEC   $5D45   $5D4D   $5D55   $5D61   $5D69  
;;  $5CF0       $5D6D  
;;  $5D0A       $5D07  
;;  $5D0D       $5D00  
;;  $5D15       $5D2A  
;;  $5D47       $5D41  
;;  $5D4F       $5D49  
;;  $5D57       $5D51  
;;  $5D63       $5D5D  
;;  $5D6B       $5D65  
;;  $5D6F       $5D30  
;;  $5D7E       $5D7C  
;;  $5DB3       $5DF8  
;;  $5DC6       $5DBD  
;;  $5DD2       $5E0C  
;;  $5DE6       $5AFF   $5DB9  
;;  $5DE7       $5DC4  
;;  $5DFF       $5E16  
;;  $5E0E       $5E06  
;;  $5E4B       $5E43  
;;  $5E4E       $5E49  
;;  $5E4F       $5E3F  
;;  $5E50       $5E47  
;;  $5EBB       $5EB8  
;;  $5ED1       $5ECE  
;;  $5EEE       $5EE7   $5EE9  
;;  $5F0C       $5F08  
;;  $5F35       $5F32  
;;  $5F43       $5F38  
;;  $5F4D       $5F3E   $5F41  
;;  $5F4F       $5F4A  
;;  $5FD0       $5FCA  
;;  $5FD6       $5FCE  
;;  $5FDE       $5FDB  
;;  $5FE7       $5FD2  
;;  $5FE8       $5FE2   $5FE5  
;;  $600F       $6036  
;;  $6030       $601D   $6021   $602A  
;;  $6033       $6014   $602E  
;;  $6044       $603D  
;;  $6050       $6049  
;;  $6061       $60B0  
;;  $6069       $6073  
;;  $6075       $606C  
;;  $607E       $606F  
;;  $608A       $6084  
;;  $60A7       $607C   $6088  
;;  $60AA       $60A5   $60BA   $60CF   $60E9  
;;  $60B2       $60A2  
;;  $60C2       $609F  
;;  $60D1       $60C0   $60CA  
;;  $60EB       $6055   $60AD  
;;  $60F3       $60F0  
;;  $60FC       $6129  
;;  $6124       $6108   $6113   $611E  
;;  $612B       $60FF  
;;  $6135       $613B  
;;  $613E       $6138  
;;  $6140       $6144  
;;  $6146       $6141  
;;  $614E       $614C  
;;  $6177       $617C  
;;  $617E       $6178  
;;  $61FB       $61F5  
;;  $6208       $6204  
;;  $6209       $6207  
;;  $6214       $620E  
;;  $6225       $623A   $6240  
;;  $6242       $622C   $624F  
;;  $6243       $6237  
;;  $6263       $626B  
;;  $626D       $6265  
;;  $6276       $627E  
;;  $6280       $627A  
;;  $628B       $6285  
;;  $628D       $6289  
;;  $62A8       $6299   $629D   $62A1   $62A5  
;;  $62B7       $62B1  
;;  $62BB       $62C0  
;;  $62C2       $62BD  
;;  $62D3       $62CF  
;;  $62E3       $64C2  
;;  $6301       $62F3   $62F7   $62FB  
;;  $6303       $62DB   $62E8   $62FF  
;;  $630D       $6309  
;;  $630E       $630C  
;;  $6319       $6313  
;;  $6322       $6343  
;;  $6339       $6330  
;;  $6351       $635C  
;;  $6357       $6359  
;;  $636D       $636F  
;;  $6373       $643F   $6459  
;;  $6377       $643A  
;;  $638B       $637F   $6385  
;;  $63AA       $63A8  
;;  $63BB       $63B9  
;;  $63CE       $63C3  
;;  $63D9       $63CC  
;;  $63DB       $63AD  
;;  $63E1       $63BE  
;;  $63E5       $63DF  
;;  $6416       $63FA   $6400   $6430  
;;  $6427       $6412   $6660  
;;  $6435       $6420  
;;  $6439       $641A  
;;  $643C       $6405   $6425  
;;  $6583       $64D8  
;;  $668A       $6508  
;;  $6701       $66FF  
;;  $6724       $6722  
;;  $672B       $6729  
;;  $673B       $6739  
;;  $677C       $64BA  
;;  $682C       $661A  
;;  $6865       $6653  
;;  $690B       $6669  
;;  $699F       $699D  
;;  $69BF       $69BD  
;;  $6A44       $6A42  
;;  $6A7E       $677C  
;;  $6AAF       $67AD  
;;  $6BB0       $6F05  
;;  $6BB2       $67B1  
;;  $6C13       $6C82  
;;  $6C29       $6C11  
;;  $6C9C       $6AE2  
;;  $6FD3       $6FC7  
;; ======================================================================== ;;
