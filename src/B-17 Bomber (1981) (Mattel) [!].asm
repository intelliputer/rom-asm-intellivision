
        ORG     $5000
.HEADER:
        BIDECLE $59BD           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $6835           ; 5004  Ptr: Start of game
        BIDECLE $5EB2           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $6E9D           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5030           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0001,  $0004   ; 500F  Color Stack init (0, 1)
        DECLE   $0001,  $0004   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TIMER:
        DECLE   $00F0,  $0062,  $0001,  $0000; 501C  Timer dispatch/interval
        DECLE   $00F5,  $0066,  $0002,  $0000; 5020  Timer dispatch/interval
        DECLE   $00B9,  $0063,  $0014,  $0000; 5024  Timer dispatch/interval
        DECLE   $00AD,  $006E,  $0001,  $0000; 5028  Timer dispatch/interval
        BIDECLE $0000           ; 502C  End of timer table

        DECLE   $0000,  $0000                   ; 502E   0000 0000
.TITLE:
        DECLE   $0051                           ; 5030  Cartridge year
        STRING  "B-17 BOMBER"                   ; 5031  Title string
        DECLE   $0000                           ; 503C  

.TITLECODE:
        PSHR    R5                              ; 503D   0275

        JSRD    R5,     L_5FC2                  ; 503E   0004 015E 03C2

        MOVR    R7,     R3                      ; 5041   00BB
        ADDI    #$0006, R3                      ; 5042   02FB 0006

        JSR     R5,     L_60E7                  ; 5044   0004 0160 00E7

        PULR    R7                              ; 5047   02B7

        DECLE   $0006,  $0000,  $0002,  $0000   ; 5048   0006 0000 0002 0000

        SLL     R2,     2                       ; 504C   004E
        ADDR    R3,     R6                      ; 504D   00DE
        ADDR    R6,     R5                      ; 504E   00F5
        ADDR    R3,     R7                      ; 504F   00DF

        DECLE   $0000,  $0000                   ; 5050   0000 0000

        SWAP    R3,     1                       ; 5052   0043
        GSWD    R1                              ; 5053   0031
        RSWD    R1                              ; 5054   0039
        RSWD    R0                              ; 5055   0038
        GSWD    R1                              ; 5056   0031
        SLL     R1,     2                       ; 5057   004D
        SWAP    R1,     1                       ; 5058   0041
        RLC     R0,     2                       ; 5059   0054
        RLC     R0,     2                       ; 505A   0054
        SWAP    R1,     2                       ; 505B   0045
        SLL     R0,     2                       ; 505C   004C
        PSHR    R5                              ; 505D   0275

        JSR     R5,     L_5115                  ; 505E   0004 0150 0115

        MVII    #$000C, R2                      ; 5061   02BA 000C

        JSR     R5,     L_50BA                  ; 5063   0004 0150 00BA

        MOVR    R7,     R0                      ; 5066   00B8
        ADDI    #$0047, R0                      ; 5067   02F8 0047
        MVO     R0,     G_035D                  ; 5069   0240 035D
        MVII    #$031D, R2                      ; 506B   02BA 031D
        SDBD                                    ; 506D   0001
        MVII    #$5623, R1                      ; 506E   02B9 0023 0056

        JSR     R5,     L_699B                  ; 5071   0004 0168 019B

        MVI     G_0177, R0                      ; 5074   0280 0177
        ANDI    #$0020, R0                      ; 5076   03B8 0020
        BEQ     L_5080                          ; 5078   0204 0006

        MVI@    R2,     R0                      ; 507A   0290
        SDBD                                    ; 507B   0001
        XORI    #$1000, R0                      ; 507C   03F8 0000 0010
        MVO@    R0,     R2                      ; 507F   0250
L_5080:
        MVII    #$00FD, R0                      ; 5080   02B8 00FD
        MVO     R0,     G_01AF                  ; 5082   0240 01AF
        MVII    #$0003, R0                      ; 5084   02B8 0003
        MVO     R0,     G_0160                  ; 5086   0240 0160
        MVI     G_01AA, R0                      ; 5088   0280 01AA
        CMP     G_015D, R0                      ; 508A   0340 015D
        MVO     R0,     G_015D                  ; 508C   0240 015D
        BEQ     L_50AD                          ; 508E   0204 001D

        MVI     G_016F, R0                      ; 5090   0280 016F
        CMPI    #$000B, R0                      ; 5092   0378 000B
        BEQ     L_50AD                          ; 5094   0204 0017

        JSR     R5,     L_5C4D                  ; 5096   0004 015C 004D

        MVII    #$0010, R0                      ; 5099   02B8 0010

        JSR     R5,     X_RAND2                 ; 509B   0004 0114 029E

        MOVR    R0,     R1                      ; 509E   0081
        ADDI    #$01F9, R1                      ; 509F   02F9 01F9
        MOVR    R7,     R0                      ; 50A1   00B8
        ADDI    #$0016, R0                      ; 50A2   02F8 0016

        JSR     R5,     L_614A                  ; 50A4   0004 0160 014A

        MVII    #$0000, R0                      ; 50A7   02B8 0000

        JSR     R5,     X_CLR_BIT               ; 50A9   0004 0114 02E6

        XORR    R4,     R3                      ; 50AC   01E3
L_50AD:
        PULR    R7                              ; 50AD   02B7

        DECLE   $0044,  $0051,  $00D8,  $0068   ; 50AE   0044 0051 00D8 0068
        DECLE   $0052,  $0051,  $0052,  $0051   ; 50B2   0052 0051 0052 0051
        DECLE   $0052,  $0051,  $0000           ; 50B6   0052 0051 0000

        ADDR    R5,     R7                      ; 50B9   00EF

L_50BA:
        PSHR    R5                              ; 50BA   0275
        MOVR    R7,     R4                      ; 50BB   00BC
        ADDI    #$0013, R4                      ; 50BC   02FC 0013
        MVI     G_01BD, R0                      ; 50BE   0280 01BD
        SLL     R0,     1                       ; 50C0   0048
        ADDR    R0,     R7                      ; 50C1   00C7

        ADDI    #$000D, R4                      ; 50C2   02FC 000D
        MVII    #$0200, R1                      ; 50C4   02B9 0200

L_50C6:
        JSR     R5,     L_50E9                  ; 50C6   0004 0150 00E9

        ADDI    #$0014, R1                      ; 50C9   02F9 0014
        DECR    R2                              ; 50CB   0012
        BNEQ    L_50C6                          ; 50CC   022C 0007
        PULR    R7                              ; 50CE   02B7

        DECLE   $006A,  $00DC,  $002A,  $0035   ; 50CF   006A 00DC 002A 0035
        DECLE   $002C,  $002B,  $0035,  $002B   ; 50D3   002C 002B 0035 002B
        DECLE   $002B,  $0020,  $00E1,  $002A   ; 50D7   002B 0020 00E1 002A
        DECLE   $03FF,  $0035,  $000F,  $000B   ; 50DB   03FF 0035 000F 000B
        DECLE   $0035                           ; 50DF   0035
L_50E0:
        DECR    R7                              ; 50E0   0017

        DECLE   $000B,  $0035,  $001F,  $000B   ; 50E1   000B 0035 001F 000B
        DECLE   $0035,  $0027,  $000B,  $03FF   ; 50E5   0035 0027 000B 03FF
L_50E9:
        PSHR    R5                              ; 50E9   0275

        JSR     R5,     .EXEC.7C1               ; 50EA   0004 0114 03C1

        MVI     G_034C, R0                      ; 50ED   0280 034C
        CMPI    #$0190, R0                      ; 50EF   0378 0190
        BLT     L_5111                          ; 50F1   0205 001E

        PSHR    R4                              ; 50F3   0274
L_50F4:
        PULR    R4                              ; 50F4   02B4
        MVI@    R4,     R0                      ; 50F5   02A0
        CMPI    #$03FF, R0                      ; 50F6   0378 03FF
        BEQ     L_5114                          ; 50F8   0204 001A

        SDBD                                    ; 50FA   0001
        MVI@    R4,     R3                      ; 50FB   02A3
        PSHR    R4                              ; 50FC   0274

        JSR     R5,     X_RAND2                 ; 50FD   0004 0114 029E

        SLR     R0,     2                       ; 5100   0064
        SLR     R0,     2                       ; 5101   0064
        MOVR    R0,     R2                      ; 5102   0082
L_5103:
        TSTR    R2                              ; 5103   0092
        BEQ     L_50F4                          ; 5104   0224 0011

        MVII    #$0014, R0                      ; 5106   02B8 0014

        JSR     R5,     X_RAND2                 ; 5108   0004 0114 029E

        MOVR    R1,     R4                      ; 510B   008C
        ADDR    R0,     R4                      ; 510C   00C4
        MVO@    R3,     R4                      ; 510D   0263
        DECR    R2                              ; 510E   0012
        B       L_5103                          ; 510F   0220 000D

L_5111:
        JSR     R5,     L_6942                  ; 5111   0004 0168 0142

L_5114:
        PULR    R7                              ; 5114   02B7

L_5115:
        PSHR    R5                              ; 5115   0275

        JSR     R5,     L_512F                  ; 5116   0004 0150 012F
        JSR     R5,     L_5120                  ; 5119   0004 0150 0120
        JSR     R5,     L_6943                  ; 511C   0004 0168 0143

        PULR    R7                              ; 511F   02B7

L_5120:
        PSHR    R5                              ; 5120   0275
        MVI     G_01BC, R1                      ; 5121   0281 01BC
        SLR     R1,     1                       ; 5123   0061
        SLL     R1,     1                       ; 5124   0049
        INCR    R1                              ; 5125   0009
        SWAP    R1,     1                       ; 5126   0041
        SLL     R1,     2                       ; 5127   004D
        SLL     R1,     2                       ; 5128   004D
        SLLC    R1,     2                       ; 5129   005D
        NOP                                     ; 512A   0034
        SLR     R1,     1                       ; 512B   0061
        RRC     R1,     2                       ; 512C   0075
        SLR     R1,     2                       ; 512D   0065
        PULR    R7                              ; 512E   02B7

L_512F:
        PSHR    R5                              ; 512F   0275
        MOVR    R7,     R0                      ; 5130   00B8
        ADDI    #$000B, R0                      ; 5131   02F8 000B

        JSR     R5,     L_6B89                  ; 5133   0004 0168 0389

L_5136:
        MVI     G_01BE, R0                      ; 5136   0280 01BE
        TSTR    R0                              ; 5138   0080
        BNEQ    L_5136                          ; 5139   022C 0004
        PULR    R7                              ; 513B   02B7

        PSHR    R5                              ; 513C   0275

        JSR     R5,     L_6B95                  ; 513D   0004 0168 0395
        JSRD    R5,     L_5C56                  ; 5140   0004 015E 0056

        PULR    R7                              ; 5143   02B7

        PSHR    R5                              ; 5144   0275
        MVII    #$0005, R1                      ; 5145   02B9 0005
        MVII    #$0321, R2                      ; 5147   02BA 0321

        JSR     R5,     L_6AF7                  ; 5149   0004 0168 02F7

        SDBD                                    ; 514C   0001
        ANDI    #$FF00, R0                      ; 514D   03B8 0000 00FF
        MVO@    R0,     R2                      ; 5150   0250
        PULR    R7                              ; 5151   02B7

        PSHR    R5                              ; 5152   0275
        DECR    R0                              ; 5153   0010
        BNEQ    L_51D9                          ; 5154   020C 0083

        ADD     .BTAB.EF,R0                     ; 5156   02C0 02EF
        BEQ     L_51D9                          ; 5158   0204 007F

        MVII    #$0160, R1                      ; 515A   02B9 0160

        JSR     R5,     L_6C09                  ; 515C   0004 016C 0009

        TSTR    R1                              ; 515F   0089
        BEQ     L_51D9                          ; 5160   0204 0077

        MVI     G_0161, R0                      ; 5162   0280 0161
        TSTR    R0                              ; 5164   0080
        BEQ     L_51D9                          ; 5165   0204 0072

        DECR    R0                              ; 5167   0010
        MVO     R0,     G_0161                  ; 5168   0240 0161
        PSHR    R1                              ; 516A   0271
        MOVR    R1,     R2                      ; 516B   008A
        SDBD                                    ; 516C   0001
        MVII    #$562A, R1                      ; 516D   02B9 002A 0056

        JSR     R5,     L_699B                  ; 5170   0004 0168 019B

        MOVR    R2,     R3                      ; 5173   0093
        ANDI    #$0008, R3                      ; 5174   03BB 0008
        SLL     R3,     1                       ; 5176   004B
        SLL     R3,     2                       ; 5177   004F
        ADDI    #$0030, R3                      ; 5178   02FB 0030
        SWAP    R3,     1                       ; 517A   0043
        ADDI    #$0002, R2                      ; 517B   02FA 0002
        MVO@    R3,     R2                      ; 517D   0253
        MOVR    R2,     R4                      ; 517E   0094
        CLRR    R0                              ; 517F   01C0

        JSR     R5,     .EXEC.772               ; 5180   0004 0114 0372

        MVI     G_01B0, R0                      ; 5183   0280 01B0

        JSR     R5,     L_51DA                  ; 5185   0004 0150 01DA

        ADDR    R0,     R2                      ; 5188   00C2
        ADD     G_034C, R0                      ; 5189   02C0 034C
        SWAP    R0,     1                       ; 518B   0040
        ANDI    #$0070, R0                      ; 518C   03B8 0070

        JSR     R5,     L_51DA                  ; 518E   0004 0150 01DA

        ADDR    R0,     R3                      ; 5191   00C3
        PULR    R1                              ; 5192   02B1
        PSHR    R2                              ; 5193   0272
        PSHR    R3                              ; 5194   0273
        PSHR    R1                              ; 5195   0271
        MOVR    R2,     R1                      ; 5196   0091
        SWAP    R1,     1                       ; 5197   0041
L_5198:
        XORR    R3,     R1                      ; 5198   01D9
        PSHR    R1                              ; 5199   0271

        JSR     R5,     .EXEC.7A3               ; 519A   0004 0114 03A3

        SLR     R2,     1                       ; 519D   0062
        SLR     R2,     2                       ; 519E   0066
        MOVR    R2,     R3                      ; 519F   0093
        PULR    R2                              ; 51A0   02B2
        PULR    R1                              ; 51A1   02B1
        PSHR    R1                              ; 51A2   0271

        JSR     R5,     .EXEC.9A3               ; 51A3   0004 0118 01A3
        JSR     R5,     .EXEC.766               ; 51A6   0004 0114 0366
        JSR     R5,     L_51DF                  ; 51A9   0004 0150 01DF

        PULR    R1                              ; 51AC   02B1
        PULR    R3                              ; 51AD   02B3
        PULR    R2                              ; 51AE   02B2
        MVI     G_01AC, R0                      ; 51AF   0280 01AC
        TSTR    R0                              ; 51B1   0080
        BNEQ    L_51BF                          ; 51B2   020C 000B

        SUB     G_01C5, R3                      ; 51B4   0303 01C5

        JSR     R5,     L_6B4E                  ; 51B6   0004 0168 034E

        ADDI    #$0200, R3                      ; 51B9   02FB 0200
        MVI@    R3,     R0                      ; 51BB   0298
        TSTR    R0                              ; 51BC   0080
        BPL     L_51CA                          ; 51BD   0203 000B

L_51BF:
        JSR     R5,     L_56DD                  ; 51BF   0004 0154 02DD

        MVI     G_0171, R0                      ; 51C2   0280 0171
        MVO     R0,     G_0173                  ; 51C4   0240 0173
        MVI     G_0172, R0                      ; 51C6   0280 0172
        MVO     R0,     G_0174                  ; 51C8   0240 0174

L_51CA:
        JSR     R5,     L_6A53                  ; 51CA   0004 0168 0253

        MVI     G_0160, R1                      ; 51CD   0281 0160
        CMPI    #$0083, R1                      ; 51CF   0379 0083
        BNEQ    L_51D9                          ; 51D1   020C 0006

        MVII    #$0003, R0                      ; 51D3   02B8 0003

        JSR     R5,     X_CLR_BIT               ; 51D5   0004 0114 02E6

        XORR    R4,     R3                      ; 51D8   01E3
L_51D9:
        PULR    R7                              ; 51D9   02B7

L_51DA:
        SLR     R0,     2                       ; 51DA   0064
        SLR     R0,     1                       ; 51DB   0060
        J       L_69E8                          ; 51DC   0004 0368 01E8

L_51DF:
        PSHR    R5                              ; 51DF   0275
        MOVR    R1,     R2                      ; 51E0   008A
        ADDI    #$0005, R2                      ; 51E1   02FA 0005
        MVI@    R2,     R3                      ; 51E3   0293
        SDBD                                    ; 51E4   0001
        ADDI    #$0400, R3                      ; 51E5   02FB 0000 0004
        MVO@    R3,     R2                      ; 51E8   0253
        SWAP    R3,     1                       ; 51E9   0043
        SLR     R3,     2                       ; 51EA   0067
        ANDI    #$003F, R3                      ; 51EB   03BB 003F
        CMPI    #$0007, R3                      ; 51ED   037B 0007
        BGT     L_5217                          ; 51EF   020E 0026

        MOVR    R3,     R4                      ; 51F1   009C
        ADDR    R4,     R4                      ; 51F2   00E4
        ADDR    R7,     R4                      ; 51F3   00FC
        ADDI    #$005E, R4                      ; 51F4   02FC 005E
        MVI@    R4,     R2                      ; 51F6   02A2
        MOVR    R2,     R3                      ; 51F7   0093
        ANDI    #$00F0, R3                      ; 51F8   03BB 00F0
        SWAP    R3,     1                       ; 51FA   0043
        RLC     R3,     1                       ; 51FB   0053
        SLR     R3,     2                       ; 51FC   0067
        SLR     R3,     2                       ; 51FD   0067
        NOP                                     ; 51FE   0034
        RRC     R3,     1                       ; 51FF   0073
        SLR     R3,     2                       ; 5200   0067
        MVI@    R1,     R5                      ; 5201   028D
        SDBD                                    ; 5202   0001
        ANDI    #$DE3F, R5                      ; 5203   03BD 003F 00DE
        XORR    R3,     R5                      ; 5206   01DD
        MVO@    R5,     R1                      ; 5207   024D
        ADDI    #$0005, R1                      ; 5208   02F9 0005
        MVI@    R1,     R3                      ; 520A   028B
        SDBD                                    ; 520B   0001
        ANDI    #$FC00, R3                      ; 520C   03BB 0000 00FC
        ANDI    #$000F, R2                      ; 520F   03BA 000F
        ADDR    R3,     R2                      ; 5211   00DA
        MVO@    R2,     R1                      ; 5212   024A
        INCR    R1                              ; 5213   0009
        MVI@    R4,     R2                      ; 5214   02A2
        MVO@    R2,     R1                      ; 5215   024A
        PULR    R7                              ; 5216   02B7

L_5217:
        MOVR    R1,     R4                      ; 5217   008C
        SDBD                                    ; 5218   0001
        MVII    #$78D8, R2                      ; 5219   02BA 00D8 0078
        MVO@    R2,     R4                      ; 521C   0262
        SDBD                                    ; 521D   0001
        MVII    #$56A7, R2                      ; 521E   02BA 00A7 0056
        MVO@    R2,     R4                      ; 5221   0262
        MVII    #$0008, R1                      ; 5222   02B9 0008
        SWAP    R1,     1                       ; 5224   0041
        NEGR    R1                              ; 5225   0021
        MOVR    R1,     R2                      ; 5226   008A
        ADD@    R4,     R1                      ; 5227   02E1
        DECR    R4                              ; 5228   0014
        MVO@    R1,     R4                      ; 5229   0261
        ADD@    R4,     R2                      ; 522A   02E2
        DECR    R4                              ; 522B   0014
        MVO@    R2,     R4                      ; 522C   0262
        CLRR    R2                              ; 522D   01D2
        MVO@    R2,     R4                      ; 522E   0262
        MVII    #$0003, R2                      ; 522F   02BA 0003
        MVO@    R2,     R4                      ; 5231   0262
        MVO@    R2,     R4                      ; 5232   0262

        JSR     R5,     L_6A69                  ; 5233   0004 0168 0269

        PULR    R7                              ; 5236   02B7

L_5237:
        MOVR    R1,     R2                      ; 5237   008A
        SDBD                                    ; 5238   0001
        MVII    #$56C3, R1                      ; 5239   02B9 00C3 0056

        JSR     R5,     L_697C                  ; 523C   0004 0168 017C

        MVI@    R2,     R1                      ; 523F   0291
        INCR    R1                              ; 5240   0009
        SUB     G_01BD, R1                      ; 5241   0301 01BD

        JSR     R5,     L_6C70                  ; 5243   0004 016C 0070

        XORR    R0,     R1                      ; 5246   01C1
        MVO@    R1,     R2                      ; 5247   0251
        ADDI    #$0002, R2                      ; 5248   02FA 0002
        MVI@    R2,     R0                      ; 524A   0290
        ADDI    #$0200, R0                      ; 524B   02F8 0200
        MVO@    R0,     R2                      ; 524D   0250
        INCR    R2                              ; 524E   000A
        MVI@    R2,     R0                      ; 524F   0290
        ADDI    #$0200, R0                      ; 5250   02F8 0200
        MVO@    R0,     R2                      ; 5252   0250
        PULR    R7                              ; 5253   02B7

        DECLE   $00D0,  $0006,  $0030,  $0006   ; 5254   00D0 0006 0030 0006
        DECLE   $0031,  $0005,  $0012,  $0005   ; 5258   0031 0005 0012 0005
        DECLE   $0006,  $0004,  $0007,  $0004   ; 525C   0006 0004 0007 0004

        INCR    R0                              ; 5260   0008
        DIS                                     ; 5261   0003
        PSHR    R5                              ; 5262   0275
        MVI     G_0192, R0                      ; 5263   0280 0192
        NEGR    R0                              ; 5265   0020
        INCR    R0                              ; 5266   0008
        BPL     L_52D1                          ; 5267   0203 0068

        ADDI    #$000C, R0                      ; 5269   02F8 000C

        JSR     R5,     X_RAND2                 ; 526B   0004 0114 029E

        TSTR    R0                              ; 526E   0080
        BNEQ    L_52D1                          ; 526F   020C 0060

        PSHR    R1                              ; 5271   0271
        MOVR    R3,     R0                      ; 5272   0098

        JSR     R5,     .EXEC.76C               ; 5273   0004 0114 036C

        MOVR    R1,     R2                      ; 5276   008A
        ADDI    #$0007, R2                      ; 5277   02FA 0007
        MVI@    R2,     R2                      ; 5279   0292
        SDBD                                    ; 527A   0001
        MVII    #$0404, R4                      ; 527B   02BC 0004 0004

        JSR     R5,     .EXEC.6F7               ; 527E   0004 0114 02F7

        PULR    R1                              ; 5281   02B1
        BNC     L_52D1                          ; 5282   0209 004D

        MVI@    R1,     R0                      ; 5284   0288
        XORI    #$0002, R0                      ; 5285   03F8 0002
        ADDI    #$0002, R1                      ; 5287   02F9 0002
        MVI@    R1,     R2                      ; 5289   028A
        INCR    R1                              ; 528A   0009
        MVI@    R1,     R3                      ; 528B   028B
        SDBD                                    ; 528C   0001
        MVII    #$5663, R1                      ; 528D   02B9 0063 0056
        MVII    #$034D, R4                      ; 5290   02BC 034D
        MVO@    R0,     R4                      ; 5292   0260
        MVO@    R1,     R4                      ; 5293   0261
        MVO@    R2,     R4                      ; 5294   0262
        MVO@    R3,     R4                      ; 5295   0263
        INCR    R4                              ; 5296   000C
        MVII    #$003F, R0                      ; 5297   02B8 003F
        SLL     R0,     2                       ; 5299   004C
        SLL     R0,     2                       ; 529A   004C
        MVO@    R0,     R4                      ; 529B   0260
        MVII    #$032D, R3                      ; 529C   02BB 032D
L_529E:
        MVI@    R3,     R0                      ; 529E   0298
        SDBD                                    ; 529F   0001
        ANDI    #$77FF, R0                      ; 52A0   03B8 00FF 0077
        MVO@    R0,     R3                      ; 52A3   0258
        ADDI    #$0004, R3                      ; 52A4   02FB 0004
        MVI     G_0198, R0                      ; 52A6   0280 0198
        SWAP    R0,     1                       ; 52A8   0040
        XOR     G_0197, R0                      ; 52A9   03C0 0197
        MVO@    R0,     R3                      ; 52AB   0258
        ADDI    #$0004, R3                      ; 52AC   02FB 0004
        CMPI    #$034D, R3                      ; 52AE   037B 034D
        BLE     L_529E                          ; 52B0   0226 0013

        MVII    #$0028, R0                      ; 52B2   02B8 0028
        MVO     R0,     G_0323                  ; 52B4   0240 0323

        JSR     R5,     L_6A33                  ; 52B6   0004 0168 0233
        JSR     R5,     L_52D2                  ; 52B9   0004 0150 02D2

        MVII    #$00FE, R0                      ; 52BC   02B8 00FE
        MVO     R0,     G_01A1                  ; 52BE   0240 01A1
        MVII    #$0002, R0                      ; 52C0   02B8 0002

        JSR     R5,     L_5701                  ; 52C2   0004 0154 0301

        MVI     G_0163, R0                      ; 52C5   0280 0163
        ADDI    #$0002, R0                      ; 52C7   02F8 0002
        MVO     R0,     G_0163                  ; 52C9   0240 0163
        MVII    #$0006, R0                      ; 52CB   02B8 0006

        JSR     R5,     X_SET_BIT               ; 52CD   0004 0114 02DB

        XORR    R4,     R3                      ; 52D0   01E3
L_52D1:
        PULR    R7                              ; 52D1   02B7

L_52D2:
        MVI     G_01A1, R0                      ; 52D2   0280 01A1
        CMPI    #$00FE, R0                      ; 52D4   0378 00FE
        BNEQ    L_52E6                          ; 52D6   020C 000E

        MVII    #$0331, R3                      ; 52D8   02BB 0331
L_52DA:
        MVI@    R3,     R0                      ; 52DA   0298
        SWAP    R0,     1                       ; 52DB   0040
        ADDI    #$0200, R0                      ; 52DC   02F8 0200
        SWAP    R0,     1                       ; 52DE   0040
        MVO@    R0,     R3                      ; 52DF   0258
        ADDI    #$0008, R3                      ; 52E0   02FB 0008
        CMPI    #$0351, R3                      ; 52E2   037B 0351
        BLE     L_52DA                          ; 52E4   0226 000B
L_52E6:
        MOVR    R5,     R7                      ; 52E6   00AF

        PSHR    R5                              ; 52E7   0275
        MVII    #$000C, R0                      ; 52E8   02B8 000C
        MVO     R0,     G_0115                  ; 52EA   0240 0115
        MOVR    R7,     R0                      ; 52EC   00B8
        ADDI    #$0085, R0                      ; 52ED   02F8 0085

        JSR     R5,     L_6B89                  ; 52EF   0004 0168 0389

L_52F2:
        MVI     G_01BE, R0                      ; 52F2   0280 01BE
        TSTR    R0                              ; 52F4   0080
        BNEQ    L_52F2                          ; 52F5   022C 0004

        EIS                                     ; 52F7   0002
        MVII    #$00F0, R3                      ; 52F8   02BB 00F0
        MVII    #$0200, R0                      ; 52FA   02B8 0200

        JSR     R5,     L_540D                  ; 52FC   0004 0154 000D

        SDBD                                    ; 52FF   0001
        MVII    #$2070, R0                      ; 5300   02B8 0070 0020
        MVO     R0,     .BTAB.2E                ; 5303   0240 022E
        MVI     G_01B6, R0                      ; 5305   0280 01B6
        TSTR    R0                              ; 5307   0080
        BNEQ    L_5328                          ; 5308   020C 001E

        SDBD                                    ; 530A   0001
        MVII    #$2000, R3                      ; 530B   02BB 0000 0020
        MVII    #$025B, R4                      ; 530E   02BC 025B

        JSR     R5,     X_PRINT_R5              ; 5310   0004 0118 007B
        STRING  "EUROPE"                        ; 5313  
        DECLE   $0000                           ; 5319   0000

        MVII    #$0270, R4                      ; 531A   02BC 0270

        JSR     R5,     X_PRINT_R5              ; 531C   0004 0118 007B
        STRING  "1943"                          ; 531F   0031 0039 0034 0033
        DECLE   $0000                           ; 5323   0000

        MVII    #$000A, R0                      ; 5324   02B8 000A
        B       L_532C                          ; 5326   0200 0004

L_5328:
        JSR     R5,     L_5388                  ; 5328   0004 0150 0388

        CLRR    R0                              ; 532B   01C0
L_532C:
        ADDR    R7,     R0                      ; 532C   00F8
        ADDI    #$0031, R0                      ; 532D   02F8 0031
        MVO     R0,     G_035D                  ; 532F   0240 035D
        MVII    #$0003, R0                      ; 5331   02B8 0003
        SDBD                                    ; 5333   0001
        MVII    #$5607, R1                      ; 5334   02B9 0007 0056
        MVII    #$031D, R2                      ; 5337   02BA 031D

        JSR     R5,     L_69A6                  ; 5339   0004 0168 01A6

        MVI     G_016C, R1                      ; 533C   0281 016C

        JSR     R5,     L_694C                  ; 533E   0004 0168 014C

        MVII    #$0327, R4                      ; 5341   02BC 0327
        SWAP    R0,     1                       ; 5343   0040
        MVO@    R0,     R4                      ; 5344   0260
        SWAP    R1,     1                       ; 5345   0041
        MVO@    R1,     R4                      ; 5346   0261
        MVII    #$032F, R4                      ; 5347   02BC 032F
        SDBD                                    ; 5349   0001
        MVII    #$016D, R5                      ; 534A   02BD 006D 0001
        MVI@    R5,     R0                      ; 534D   02A8
        SWAP    R0,     1                       ; 534E   0040
        MVO@    R0,     R4                      ; 534F   0260
        MVI@    R5,     R0                      ; 5350   02A8
        SWAP    R0,     1                       ; 5351   0040
        MVO@    R0,     R4                      ; 5352   0260
        CLRR    R3                              ; 5353   01DB

        JSR     R5,     L_64DD                  ; 5354   0004 0164 00DD

        MVII    #$01A8, R4                      ; 5357   02BC 01A8
        SDBD                                    ; 5359   0001
        ADD@    R4,     R3                      ; 535A   02E3
        BNEQ    L_549F                          ; 535B   020C 0142
        PULR    R7                              ; 535D   02B7

        SLLC    R0,     1                       ; 535E   0058
        RLC     R0,     2                       ; 535F   0054
        ADDR    R3,     R0                      ; 5360   00D8
        SAR     R0,     1                       ; 5361   0068
        SAR     R3,     1                       ; 5362   006B
        RLC     R0,     2                       ; 5363   0054
        SAR     R3,     1                       ; 5364   006B
        RLC     R0,     2                       ; 5365   0054
        SAR     R3,     1                       ; 5366   006B
        RLC     R0,     2                       ; 5367   0054
        RLC     R3,     1                       ; 5368   0053
        SAR     R0,     1                       ; 5369   0068
        RLC     R1,     2                       ; 536A   0055
        SAR     R0,     1                       ; 536B   0068
        RLC     R3,     1                       ; 536C   0053
        SAR     R0,     1                       ; 536D   0068
        RLC     R3,     1                       ; 536E   0053
        SAR     R0,     1                       ; 536F   0068
        RLC     R3,     1                       ; 5370   0053
        SAR     R0,     1                       ; 5371   0068
        DIS                                     ; 5372   0003
        PSHR    R5                              ; 5373   0275

        JSR     R5,     L_6B95                  ; 5374   0004 0168 0395

        EIS                                     ; 5377   0002
        SDBD                                    ; 5378   0001
        MVII    #$5EB2, R4                      ; 5379   02BC 00B2 005E
        MVII    #$0038, R1                      ; 537C   02B9 0038
        SWAP    R1,     1                       ; 537E   0041
        MVII    #$00D8, R0                      ; 537F   02B8 00D8

        JSR     R5,     .EXEC.730               ; 5381   0004 0114 0330

        EIS                                     ; 5384   0002
        J       .EXEC.14E                       ; 5385   0004 0310 014E

L_5388:
        PSHR    R5                              ; 5388   0275
        SDBD                                    ; 5389   0001
        MVII    #$0907, R0                      ; 538A   02B8 0007 0009
        MOVR    R7,     R4                      ; 538D   00BC
        ADDI    #$003B, R4                      ; 538E   02FC 003B
        MVII    #$0168, R3                      ; 5390   02BB 0168

        JSR     R5,     L_53AD                  ; 5392   0004 0150 03AD

        MVII    #$016A, R3                      ; 5395   02BB 016A

        JSR     R5,     L_53AD                  ; 5397   0004 0150 03AD

        SDBD                                    ; 539A   0001
        MVII    #$08FB, R0                      ; 539B   02B8 00FB 0008
        MVII    #$0166, R3                      ; 539E   02BB 0166

        JSR     R5,     L_53AD                  ; 53A0   0004 0150 03AD

        SDBD                                    ; 53A3   0001
        MVII    #$08E8, R0                      ; 53A4   02B8 00E8 0008
        MVII    #$0164, R3                      ; 53A7   02BB 0164

        JSR     R5,     L_53AD                  ; 53A9   0004 0150 03AD

L_53AC:
        PULR    R7                              ; 53AC   02B7

L_53AD:
        PSHR    R5                              ; 53AD   0275
        MOVR    R3,     R5                      ; 53AE   009D
        SDBD                                    ; 53AF   0001
        MVI@    R5,     R3                      ; 53B0   02AB
L_53B1:
        MVI@    R4,     R1                      ; 53B1   02A1
        CMPI    #$03FF, R1                      ; 53B2   0379 03FF
        BEQ     L_53AC                          ; 53B4   0224 0009

        SLLC    R3,     1                       ; 53B6   005B
        BNC     L_53B1                          ; 53B7   0229 0007

        MVI@    R1,     R2                      ; 53B9   028A
        SDBD                                    ; 53BA   0001
        ANDI    #$3600, R2                      ; 53BB   03BA 0000 0036
        MOVR    R2,     R5                      ; 53BE   0095
        XORR    R0,     R2                      ; 53BF   01C2
        ANDI    #$0200, R5                      ; 53C0   03BD 0200
        BEQ     L_53C6                          ; 53C2   0204 0002

        ADDI    #$0008, R2                      ; 53C4   02FA 0008
L_53C6:
        MVO@    R2,     R1                      ; 53C6   024A
        B       L_53B1                          ; 53C7   0220 0017
        B       L_5198                          ; 53C9   0220 0232

        DECLE   $0233,  $0235,  $0237,  $0238   ; 53CB   0233 0235 0237 0238
        DECLE   $0245,  $0246,  $0248,  $0249   ; 53CF   0245 0246 0248 0249
        DECLE   $024B,  $0258,  $0259,  $025B   ; 53D3   024B 0258 0259 025B
        DECLE   $025E,  $025F,  $03FF,  $026B   ; 53D7   025E 025F 03FF 026B
        DECLE   $026E,  $0271,  $027C,  $027D   ; 53DB   026E 0271 027C 027D
        DECLE   $027E                           ; 53DF   027E

        MVI     .BTAB.82,R1                     ; 53E0   0281 0282
        MVI     .BTAB.85,R3                     ; 53E2   0283 0285
        MVI     .BTAB.87,R6                     ; 53E4   0286 0287
        MVI@    R2,     R2                      ; 53E6   0292
        MVI@    R2,     R3                      ; 53E7   0293
        MVI@    R2,     R4                      ; 53E8   0294
        MVI@    R4,     R7                      ; 53E9   02A7

        DECLE   $03FF,  $0220,  $0232,  $0234   ; 53EA   03FF 0220 0232 0234
        DECLE   $0245,  $0247,  $024A,  $025A   ; 53EE   0245 0247 024A 025A
        DECLE   $026B,  $026C,  $026D,  $0270   ; 53F2   026B 026C 026D 0270
        DECLE   $0272,  $027D,  $027F,  $0291   ; 53F6   0272 027D 027F 0291
        DECLE   $02A5,  $03FF,  $020F,  $0233   ; 53FA   02A5 03FF 020F 0233
        DECLE   $0236,  $0250,  $0259,  $025C   ; 53FE   0236 0250 0259 025C
        DECLE   $025D,  $026F,  $0273,  $027C   ; 5402   025D 026F 0273 027C
        DECLE   $0280,  $0284,  $028E,  $02A0   ; 5406   0280 0284 028E 02A0
        DECLE   $02A2,  $02A6,  $03FF           ; 540A   02A2 02A6 03FF
L_540D:
        PSHR    R5                              ; 540D   0275
        SDBD                                    ; 540E   0001
        MVII    #$5E62, R4                      ; 540F   02BC 0062 005E
        MOVR    R0,     R5                      ; 5412   0085
        ADDR    R5,     R3                      ; 5413   00EB
        MVII    #$001F, R2                      ; 5414   02BA 001F
L_5416:
        CMPR    R3,     R5                      ; 5416   015D
        BGE     L_5443                          ; 5417   020D 002A

        PSHR    R5                              ; 5419   0275

        JSR     R5,     L_5444                  ; 541A   0004 0154 0044

        PULR    R5                              ; 541D   02B5
        CMPI    #$001E, R0                      ; 541E   0378 001E
        BEQ     L_542B                          ; 5420   0204 0009

        SLL     R0,     2                       ; 5422   004C
        SLL     R0,     1                       ; 5423   0048
        SDBD                                    ; 5424   0001
        XORI    #$0A04, R0                      ; 5425   03F8 0004 000A
        MVO@    R0,     R5                      ; 5428   0268
        B       L_5416                          ; 5429   0220 0014

L_542B:
        PSHR    R5                              ; 542B   0275

        JSR     R5,     L_5444                  ; 542C   0004 0154 0044

        PULR    R5                              ; 542F   02B5
        MOVR    R0,     R1                      ; 5430   0081
        SDBD                                    ; 5431   0001
        MVII    #$2000, R0                      ; 5432   02B8 0000 0020
        CMPI    #$0014, R1                      ; 5435   0379 0014
        BLT     L_543D                          ; 5437   0205 0004

        SUBI    #$0014, R1                      ; 5439   0339 0014
        MVII    #$0200, R0                      ; 543B   02B8 0200
L_543D:
        MVO@    R0,     R5                      ; 543D   0268
        DECR    R1                              ; 543E   0011
        BGT     L_543D                          ; 543F   022E 0003
        B       L_5416                          ; 5441   0220 002C
L_5443:
        PULR    R7                              ; 5443   02B7

L_5444:
        CMPI    #$001F, R2                      ; 5444   037A 001F
        BEQ     L_544C                          ; 5446   0204 0004

        MOVR    R2,     R0                      ; 5448   0090
        MVII    #$001F, R2                      ; 5449   02BA 001F
        MOVR    R5,     R7                      ; 544B   00AF

L_544C:
        MVI@    R4,     R0                      ; 544C   02A0
        MOVR    R0,     R2                      ; 544D   0082
        ANDI    #$001F, R2                      ; 544E   03BA 001F
        SLR     R0,     2                       ; 5450   0064
        SLR     R0,     2                       ; 5451   0064
        SLR     R0,     1                       ; 5452   0060
        CMPI    #$001F, R0                      ; 5453   0378 001F
        BEQ     L_5444                          ; 5455   0224 0012
        MOVR    R5,     R7                      ; 5457   00AF

        PSHR    R5                              ; 5458   0275
        MVII    #$0010, R1                      ; 5459   02B9 0010
        MVII    #$0329, R2                      ; 545B   02BA 0329

        JSR     R5,     L_6AF7                  ; 545D   0004 0168 02F7

        MVII    #$0325, R1                      ; 5460   02B9 0325

        JSR     R5,     .EXEC.777               ; 5462   0004 0114 0377
        JSR     R5,     L_6B4E                  ; 5465   0004 0168 034E

        MVO     R3,     G_016C                  ; 5468   0243 016C
        PULR    R7                              ; 546A   02B7

        PSHR    R5                              ; 546B   0275
        DECR    R0                              ; 546C   0010
        BNEQ    L_54A4                          ; 546D   020C 0035

        MVII    #$0002, R0                      ; 546F   02B8 0002
        MVII    #$032F, R1                      ; 5471   02B9 032F
        MVII    #$0327, R4                      ; 5473   02BC 0327

        JSR     R5,     .EXEC.730               ; 5475   0004 0114 0330

        MVII    #$0325, R1                      ; 5478   02B9 0325

        JSR     R5,     .EXEC.777               ; 547A   0004 0114 0377

        MVO     R2,     G_016D                  ; 547D   0242 016D
        MVO     R3,     G_016E                  ; 547F   0243 016E
        SWAP    R2,     1                       ; 5481   0042
        XORR    R3,     R2                      ; 5482   01DA
        MVII    #$0028, R3                      ; 5483   02BB 0028
        MVII    #$031D, R1                      ; 5485   02B9 031D

        JSR     R5,     .EXEC.9A1               ; 5487   0004 0118 01A1

        MVII    #$0321, R3                      ; 548A   02BB 0321
        MVI@    R3,     R0                      ; 548C   0298
        MVO     R0,     G_01A5                  ; 548D   0240 01A5
        SWAP    R0,     1                       ; 548F   0040
        MVO     R0,     G_01A2                  ; 5490   0240 01A2
        CLRR    R0                              ; 5492   01C0
        MVO@    R0,     R3                      ; 5493   0258
        MVII    #$0323, R3                      ; 5494   02BB 0323
        MVI@    R3,     R0                      ; 5496   0298
        SLL     R0,     2                       ; 5497   004C
        SLL     R0,     2                       ; 5498   004C
        SLL     R0,     2                       ; 5499   004C
        MVII    #$01A8, R4                      ; 549A   02BC 01A8
        MVO@    R0,     R4                      ; 549C   0260
        SWAP    R0,     1                       ; 549D   0040
        MVO@    R0,     R4                      ; 549E   0260
L_549F:
        MVII    #$0002, R0                      ; 549F   02B8 0002
        MVII    #$0323, R3                      ; 54A1   02BB 0323
        MVO@    R0,     R3                      ; 54A3   0258
L_54A4:
        PULR    R7                              ; 54A4   02B7

        PSHR    R5                              ; 54A5   0275
        MOVR    R7,     R1                      ; 54A6   00B9
        ADDI    #$0043, R1                      ; 54A7   02F9 0043

        JSR     R5,     L_69B3                  ; 54A9   0004 0168 01B3

        MVI     G_01B8, R0                      ; 54AC   0280 01B8
        TSTR    R0                              ; 54AE   0080
        BEQ     L_54C1                          ; 54AF   0204 0010

        MVII    #$02CB, R4                      ; 54B1   02BC 02CB
        MVII    #$0007, R3                      ; 54B3   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 54B5   0004 0118 007B
        STRING  "Practice"                      ; 54B8  
        DECLE   $0000                           ; 54C0   0000
L_54C1:
        MOVR    R7,     R2                      ; 54C1   00BA
        ADDI    #$001B, R2                      ; 54C2   02FA 001B

        JSR     R5,     L_69C2                  ; 54C4   0004 0168 01C2

        MOVR    R2,     R0                      ; 54C7   0090
        MVII    #$02AC, R4                      ; 54C8   02BC 02AC

        JSR     R5,     X_PRNUM_RGT             ; 54CA   0004 0118 00C5

        MOVR    R7,     R0                      ; 54CD   00B8
        ADDI    #$0005, R0                      ; 54CE   02F8 0005
        MVO     R0,     G_035D                  ; 54D0   0240 035D
        PULR    R7                              ; 54D2   02B7

        DECLE   $0000,  $0000,  $00D8,  $0068   ; 54D3   0000 0000 00D8 0068
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54D7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0163,  $01AE   ; 54DB   0000 0000 0163 01AE
        DECLE   $0235                           ; 54DF   0235

        CMPR    R3,     R6                      ; 54E0   015E
        ANDR    R5,     R3                      ; 54E1   01AB
        MVO@    R4,     R3                      ; 54E2   025C
        ANDR    R6,     R0                      ; 54E3   01B0
        MOVR    R4,     R7                      ; 54E4   00A7

        DECLE   $0284,  $0175,  $01FB,  $02D4   ; 54E5   0284 0175 01FB 02D4
        DECLE   $03FF,  $0007,  $0201,  $0053   ; 54E9   03FF 0007 0201 0053
        DECLE   $0043,  $004F,  $0052,  $0045   ; 54ED   0043 004F 0052 0045
        DECLE   $0000,  $0007,  $02A3,  $004D   ; 54F1   0000 0007 02A3 004D
        DECLE   $0069,  $0073,  $0073,  $0069   ; 54F5   0069 0073 0073 0069
        DECLE   $006F,  $006E,  $0000,  $0007   ; 54F9   006F 006E 0000 0007
        DECLE   $02CB,  $0047,  $0061,  $006D   ; 54FD   02CB 0047 0061 006D
        DECLE   $0065,  $0000,  $0001,  $022B   ; 5501   0065 0000 0001 022B
        DECLE   $0042,  $0061,  $006E,  $0064   ; 5505   0042 0061 006E 0064
        DECLE   $0069,  $0074,  $0073,  $0000   ; 5509   0069 0074 0073 0000
        DECLE   $0001,  $0253,  $0054,  $0061   ; 550D   0001 0253 0054 0061
        DECLE   $0072,  $0067,  $0065,  $0074   ; 5511   0072 0067 0065 0074
        DECLE   $0000,  $0002,  $027B,  $0042   ; 5515   0000 0002 027B 0042
        DECLE   $0031,  $0037,  $0020,  $0048   ; 5519   0031 0037 0020 0048
        DECLE   $0069,  $0074,  $0073,  $0000   ; 551D   0069 0074 0073 0000
        DECLE   $03FF                           ; 5521   03FF

        PSHR    R5                              ; 5522   0275
        MVI     G_016C, R0                      ; 5523   0280 016C

        JSR     R5,     L_55B5                  ; 5525   0004 0154 01B5
        JSR     R5,     L_558D                  ; 5528   0004 0154 018D

        MVI     G_016C, R1                      ; 552B   0281 016C

        JSR     R5,     L_694C                  ; 552D   0004 0168 014C

        MOVR    R0,     R2                      ; 5530   0082
        MOVR    R1,     R3                      ; 5531   008B

        JSR     R5,     L_6B10                  ; 5532   0004 0168 0310
        JSR     R5,     L_5115                  ; 5535   0004 0150 0115

        SDBD                                    ; 5538   0001
        MVII    #$54D3, R0                      ; 5539   02B8 00D3 0054
        MVO     R0,     G_035D                  ; 553C   0240 035D
        MVI     G_016F, R0                      ; 553E   0280 016F

        JSR     R5,     L_5C4D                  ; 5540   0004 015C 004D

        SDBD                                    ; 5543   0001
        MVII    #$50B8, R0                      ; 5544   02B8 00B8 0050
        MVII    #$0251, R1                      ; 5547   02B9 0251

        JSR     R5,     L_614A                  ; 5549   0004 0160 014A

        MVII    #$021A, R4                      ; 554C   02BC 021A
        MVII    #$0022, R3                      ; 554E   02BB 0022
        MVI     G_01BC, R0                      ; 5550   0280 01BC
        CMPI    #$0001, R0                      ; 5552   0378 0001
        BNEQ    L_5558                          ; 5554   020C 0002

        MVII    #$0002, R3                      ; 5556   02BB 0002
L_5558:
        SWAP    R3,     1                       ; 5558   0043

        JSR     R5,     X_PRINT_R5              ; 5559   0004 0118 007B
        STRING  "VALUE "                        ; 555C  
        DECLE   $0000                           ; 5562   0000

        MVI     G_0162, R0                      ; 5563   0280 0162

        JSR     R5,     X_EXT_SIGN_LO           ; 5565   0004 0114 0268

        MVII    #$0003, R1                      ; 5568   02B9 0003

        JSR     R5,     X_PRNUM_LFT             ; 556A   0004 0118 009E

        MVI     G_01A3, R2                      ; 556D   0282 01A3
        MVI     G_01A6, R3                      ; 556F   0283 01A6

        JSR     R5,     L_6B10                  ; 5571   0004 0168 0310
        JSR     R5,     L_6512                  ; 5574   0004 0164 0112

        PULR    R7                              ; 5577   02B7

L_5578:
        PSHR    R5                              ; 5578   0275
        ADDI    #$0200, R0                      ; 5579   02F8 0200
        PSHR    R4                              ; 557B   0274
L_557C:
        MVI@    R4,     R1                      ; 557C   02A1
        CMPI    #$03FF, R1                      ; 557D   0379 03FF
        BEQ     L_558A                          ; 557F   0204 0009

        SLLC    R3,     1                       ; 5581   005B
        BNC     L_557C                          ; 5582   0229 0007

        CMPR    R0,     R1                      ; 5584   0141
        BNEQ    L_557C                          ; 5585   022C 000A

        DECR    R4                              ; 5587   0014
        SUB@    R6,     R4                      ; 5588   0334
        PULR    R7                              ; 5589   02B7

L_558A:
        PULR    R4                              ; 558A   02B4
        MOVR    R1,     R4                      ; 558B   008C
        PULR    R7                              ; 558C   02B7

L_558D:
        PSHR    R5                              ; 558D   0275
        SDBD                                    ; 558E   0001
        MVII    #$53FC, R4                      ; 558F   02BC 00FC 0053
        MVII    #$0164, R5                      ; 5592   02BD 0164
        SDBD                                    ; 5594   0001
        MVI@    R5,     R3                      ; 5595   02AB
        PSHR    R0                              ; 5596   0270

        JSR     R5,     L_5578                  ; 5597   0004 0154 0178

        PULR    R0                              ; 559A   02B0
        CMPI    #$03FF, R4                      ; 559B   037C 03FF
        BEQ     L_55EF                          ; 559D   0204 0050

        MVII    #$0164, R3                      ; 559F   02BB 0164
        MVO     R3,     G_0171                  ; 55A1   0243 0171
        MVO     R4,     G_0172                  ; 55A3   0244 0172
        SDBD                                    ; 55A5   0001
        ADDI    #$5E42, R4                      ; 55A6   02FC 0042 005E
        MVI@    R4,     R3                      ; 55A9   02A3
        SDBD                                    ; 55AA   0001
        ADDI    #$000F, R4                      ; 55AB   02FC 000F 0000
        MVI@    R4,     R1                      ; 55AE   02A1
        MVO     R1,     G_0162                  ; 55AF   0241 0162
        MVO     R3,     G_016F                  ; 55B1   0243 016F
        B       L_55E9                          ; 55B3   0200 0034

L_55B5:
        PSHR    R5                              ; 55B5   0275
        PSHR    R0                              ; 55B6   0270

        JSR     R5,     L_6571                  ; 55B7   0004 0164 0171

        PULR    R0                              ; 55BA   02B0
        CLRR    R2                              ; 55BB   01D2
        BNC     L_55C0                          ; 55BC   0209 0002

        MVII    #$00CE, R2                      ; 55BE   02BA 00CE
L_55C0:
        MVO     R2,     G_0170                  ; 55C0   0242 0170
        SDBD                                    ; 55C2   0001
        MVII    #$55F0, R5                      ; 55C3   02BD 00F0 0055
L_55C6:
        MVI@    R5,     R4                      ; 55C6   02AC
        MVO     R4,     G_0171                  ; 55C7   0244 0171
        MVII    #$000B, R3                      ; 55C9   02BB 000B
        MVI     G_0170, R2                      ; 55CB   0282 0170
        TSTR    R4                              ; 55CD   00A4
        BEQ     L_55E3                          ; 55CE   0204 0013

        SDBD                                    ; 55D0   0001
        MVI@    R4,     R3                      ; 55D1   02A3
        SDBD                                    ; 55D2   0001
        MVI@    R5,     R4                      ; 55D3   02AC
        PSHR    R0                              ; 55D4   0270
        PSHR    R5                              ; 55D5   0275

        JSR     R5,     L_5578                  ; 55D6   0004 0154 0178

        PULR    R5                              ; 55D9   02B5
        PULR    R0                              ; 55DA   02B0
        MVI@    R5,     R2                      ; 55DB   02AA
        MVI@    R5,     R3                      ; 55DC   02AB
        CLRR    R1                              ; 55DD   01C9
        CMPI    #$03FF, R4                      ; 55DE   037C 03FF
        BEQ     L_55C6                          ; 55E0   0224 001B

        INCR    R1                              ; 55E2   0009
L_55E3:
        MVO     R2,     G_0162                  ; 55E3   0242 0162
        MVO     R3,     G_016F                  ; 55E5   0243 016F
        MVO     R4,     G_0172                  ; 55E7   0244 0172
L_55E9:
        CMP     G_01AA, R0                      ; 55E9   0340 01AA
        BNEQ    L_55EF                          ; 55EB   020C 0002

        MVO     R1,     G_01AD                  ; 55ED   0241 01AD
L_55EF:
        PULR    R7                              ; 55EF   02B7

        DECLE   $0166,  $00EB,  $0053,  $0005   ; 55F0   0166 00EB 0053 0005
        DECLE   $0005,  $0168,  $00C9,  $0053   ; 55F4   0005 0168 00C9 0053
        DECLE   $0001,  $0000,  $016A,  $00DA   ; 55F8   0001 0000 016A 00DA
        DECLE   $0053,  $0001,  $0000,  $0000   ; 55FC   0053 0001 0000 0000

        INCR    R7                              ; 5600   000F

        SWAP    R0,     1                       ; 5601   0040
L_5602:
        INCR    R0                              ; 5602   0008
        MOVR    R1,     R3                      ; 5603   008B
        RLC     R2,     2                       ; 5604   0056
        RLC     R3,     1                       ; 5605   0053
        GSWD    R3                              ; 5606   0033
        NEGR    R3                              ; 5607   0023
        MOVR    R0,     R7                      ; 5608   0087

        DECLE   $0018,  $0092,  $0056,  $0002   ; 5609   0018 0092 0056 0002
        DECLE   $0000,  $0003,  $0091,  $0018   ; 560D   0000 0003 0091 0018
        DECLE   $0092,  $0056,  $0063,  $0086   ; 5611   0092 0056 0063 0086
        DECLE   $0018,  $0092,  $0056,  $0001   ; 5615   0018 0092 0056 0001
        DECLE   $0000,  $0004,  $0000,  $000F   ; 5619   0000 0004 0000 000F
        DECLE   $0000                           ; 561D   0000

        GSWD    R1                              ; 561E   0031
        MOVR    R5,     R6                      ; 561F   00AE
        RLC     R2,     2                       ; 5620   0056
        RLC     R3,     2                       ; 5621   0057
        GSWD    R3                              ; 5622   0033
        INCR    R7                              ; 5623   000F

        TSTR    R0                              ; 5624   0080
L_5625:
        COMR    R0                              ; 5625   0018
        MOVR    R3,     R1                      ; 5626   0099
        RLC     R2,     2                       ; 5627   0056
        RLC     R3,     1                       ; 5628   0053
        SWAP    R0,     1                       ; 5629   0040
        INCR    R7                              ; 562A   000F

        ADDR    R0,     R0                      ; 562B   00C0
L_562C:
        COMR    R0                              ; 562C   0018
        MOVR    R4,     R0                      ; 562D   00A0
        RLC     R2,     2                       ; 562E   0056
        RLC     R3,     1                       ; 562F   0053
        RLC     R1,     2                       ; 5630   0055
        ADCR    R7                              ; 5631   002F

        TSTR    R0                              ; 5632   0080
L_5633:
        COMR    R0                              ; 5633   0018
        DECLE   $00B5,  $0056,  $002A,  $0067   ; 5634   00B5 0056 002A 0067
        DECLE   $0000                           ; 5638   0000

        EIS                                     ; 5639   0002
        EIS                                     ; 563A   0002
        SAR     R2,     1                       ; 563B   006A
        RLC     R2,     2                       ; 563C   0056
        EIS                                     ; 563D   0002
        RRC     R1,     2                       ; 563E   0075
        RLC     R2,     2                       ; 563F   0056
        EIS                                     ; 5640   0002
        TSTR    R0                              ; 5641   0080
        RLC     R2,     2                       ; 5642   0056
        EIS                                     ; 5643   0002
        TSTR    R0                              ; 5644   0080
        RLC     R2,     2                       ; 5645   0056
        EIS                                     ; 5646   0002
        TSTR    R0                              ; 5647   0080
        RLC     R2,     2                       ; 5648   0056
        ADCR    R7                              ; 5649   002F
        MOVR    R0,     R7                      ; 564A   0087

L_564B:
        GSWD    R0                              ; 564B   0030
        DECLE   $0092,  $0056,  $0010,  $0033   ; 564C   0092 0056 0010 0033
        DECLE   $0003,  $0000                   ; 5650   0003 0000

        ADCR    R3                              ; 5652   002B
        MOVR    R0,     R7                      ; 5653   0087

        DECLE   $0010,  $0092,  $0056,  $005F   ; 5654   0010 0092 0056 005F
        DECLE   $0004,  $0000                   ; 5658   0004 0000

        ADCR    R7                              ; 565A   002F
        MOVR    R0,     R7                      ; 565B   0087

L_565C:
        GSWD    R0                              ; 565C   0030
        TSTR    R2                              ; 565D   0092
        RLC     R2,     2                       ; 565E   0056
        MOVR    R2,     R7                      ; 565F   0097

        DECLE   $0033,  $0005,  $0000,  $0100   ; 5660   0033 0005 0000 0100
        DECLE   $0000,  $0000,  $0000,  $0002   ; 5664   0000 0000 0000 0002
        DECLE   $001D,  $0000,  $0100,  $0000   ; 5668   001D 0000 0100 0000
        DECLE   $0000,  $0000,  $000D,  $002A   ; 566C   0000 0000 000D 002A
        DECLE   $0004,  $0062,  $0152,  $0362   ; 5670   0004 0062 0152 0362
        DECLE   $0152,  $0100,  $0000,  $0000   ; 5674   0152 0100 0000 0000
        DECLE   $0000,  $000C,  $0039,  $0004   ; 5678   0000 000C 0039 0004
        DECLE   $0062,  $0152,  $0362,  $0152   ; 567C   0062 0152 0362 0152
        DECLE   $0100,  $0000,  $0000,  $0000   ; 5680   0100 0000 0000 0000
        DECLE   $0006,  $0045,  $0004,  $0062   ; 5684   0006 0045 0004 0062
        DECLE   $0152                           ; 5688   0152

        CMP@    R4,     R2                      ; 5689   0362
        CMPR    R2,     R2                      ; 568A   0152
        PSHR    R6                              ; 568B   0276
        SLR     R2,     2                       ; 568C   0066
        MOVR    R1,     R7                      ; 568D   008F

        DECLE   $0066,  $0009,  $000F,  $0000   ; 568E   0066 0009 000F 0000
        DECLE   $0200,  $0000,  $0004,  $006B   ; 5692   0200 0000 0004 006B
        DECLE   $0006,  $0000,  $0000,  $0200   ; 5696   0006 0000 0000 0200
        DECLE   $0000,  $0000,  $0000,  $0001   ; 569A   0000 0000 0000 0001
        DECLE   $0002,  $0000,  $0100,  $0000   ; 569E   0002 0000 0100 0000
        DECLE   $00DF,  $0051,  $0008,  $0006   ; 56A2   00DF 0051 0008 0006
        DECLE   $0000,  $0100,  $0000           ; 56A6   0000 0100 0000

        MOVR    R1,     R7                      ; 56A9   008F

        SLR     R2,     2                       ; 56AA   0066
        INCR    R1                              ; 56AB   0009
        INCR    R7                              ; 56AC   000F

        DECLE   $0000                           ; 56AD   0000
L_56AE:
        B       L_56B0                          ; 56AE   0200 0000

L_56B0:
        NEGR    R0                              ; 56B0   0020
        DECLE   $0062,  $0001,  $001F,  $0000   ; 56B1   0062 0001 001F 0000
        DECLE   $0100,  $0000,  $0039,  $0058   ; 56B5   0100 0000 0039 0058
        DECLE   $0006,  $0020,  $0000,  $0100   ; 56B9   0006 0020 0000 0100
        DECLE   $0000                           ; 56BD   0000

        MOVR    R5,     R6                      ; 56BE   00AE
L_56BF:
        DECR    R7                              ; 56BF   0017

        DECLE   $0001,  $0025,  $0000,  $0003   ; 56C0   0001 0025 0000 0003
        DECLE   $0040,  $0050,  $00C8,  $0056   ; 56C4   0040 0050 00C8 0056
        DECLE   $0100,  $0000,  $0000,  $0000   ; 56C8   0100 0000 0000 0000
        DECLE   $0002,  $0026,  $0000           ; 56CC   0002 0026 0000

        INCR    R7                              ; 56CF   000F

        ADDR    R2,     R0                      ; 56D0   00D0
L_56D1:
        GSWD    R0                              ; 56D1   0030
        DECLE   $00D6,  $0056,  $0028,  $0033   ; 56D2   00D6 0056 0028 0033
        DECLE   $0100,  $0000,  $0000,  $0000   ; 56D6   0100 0000 0000 0000
        DECLE   $0001,  $0028,  $0000           ; 56DA   0001 0028 0000
L_56DD:
        PSHR    R5                              ; 56DD   0275
        PSHR    R4                              ; 56DE   0274
        MVII    #$015E, R4                      ; 56DF   02BC 015E
        MVI     G_0162, R0                      ; 56E1   0280 0162

        JSR     R5,     X_EXT_SIGN_LO           ; 56E3   0004 0114 0268

        PSHR    R0                              ; 56E6   0270
        CLRR    R5                              ; 56E7   01ED
        SLLC    R0,     1                       ; 56E8   0058
        ADCR    R5                              ; 56E9   002D
        MVO     R5,     G_01D0                  ; 56EA   0245 01D0
        MVII    #$0004, R0                      ; 56EC   02B8 0004

        JSR     R5,     X_CLR_BIT               ; 56EE   0004 0114 02E6

        XORR    R4,     R3                      ; 56F1   01E3
        PULR    R0                              ; 56F2   02B0
        SDBD                                    ; 56F3   0001
        ADD@    R4,     R0                      ; 56F4   02E0
        MVO     R0,     G_015E                  ; 56F5   0240 015E
        SWAP    R0,     1                       ; 56F7   0040
        MVO     R0,     G_015F                  ; 56F8   0240 015F
        MVI     G_0162, R0                      ; 56FA   0280 0162

        JSR     R5,     X_EXT_SIGN_LO           ; 56FC   0004 0114 0268

        B       L_5703                          ; 56FF   0200 0002

L_5701:
        PSHR    R5                              ; 5701   0275
        PSHR    R4                              ; 5702   0274
L_5703:
        MVII    #$0175, R4                      ; 5703   02BC 0175
        SDBD                                    ; 5705   0001
        ADD@    R4,     R0                      ; 5706   02E0
        MVO     R0,     G_0175                  ; 5707   0240 0175
        SWAP    R0,     1                       ; 5709   0040
        MVO     R0,     G_0176                  ; 570A   0240 0176
        PULR    R4                              ; 570C   02B4
        PULR    R7                              ; 570D   02B7

L_570E:
        PSHR    R5                              ; 570E   0275

        JSR     R5,     .EXEC.7C1               ; 570F   0004 0114 03C1

        MOVR    R0,     R1                      ; 5712   0081
        ADD     G_01B0, R1                      ; 5713   02C1 01B0
        MVO     R1,     G_01B0                  ; 5715   0241 01B0
        MOVR    R0,     R1                      ; 5717   0081
        NEGR    R0                              ; 5718   0020

        JSR     R5,     L_5701                  ; 5719   0004 0154 0301

        DECR    R1                              ; 571C   0011
        BNEQ    L_5749                          ; 571D   020C 002A

        MVII    #$0005, R0                      ; 571F   02B8 0005

        JSR     R5,     X_RAND2                 ; 5721   0004 0114 029E

        TSTR    R0                              ; 5724   0080
        BNEQ    L_5746                          ; 5725   020C 001F

        MVII    #$0006, R0                      ; 5727   02B8 0006

        JSR     R5,     X_RAND2                 ; 5729   0004 0114 029E

        MOVR    R0,     R2                      ; 572C   0082
        MVI     G_01A1, R1                      ; 572D   0281 01A1
        SDBD                                    ; 572F   0001
        ADDI    #$574A, R1                      ; 5730   02F9 004A 0057
        MVI@    R1,     R1                      ; 5733   0289

        JSR     R5,     X_POW2                  ; 5734   0004 0114 0345

        ANDR    R0,     R1                      ; 5737   0181
        BEQ     L_5746                          ; 5738   0204 000C

        MOVR    R0,     R3                      ; 573A   0083
        AND     G_0177, R0                      ; 573B   0380 0177
        BNEQ    L_5746                          ; 573D   020C 0007

        XOR     G_0177, R3                      ; 573F   03C3 0177
        MVO     R3,     G_0177                  ; 5741   0243 0177
        J       L_6ACA                          ; 5743   0004 0368 02CA

L_5746:
        JSR     R5,     L_6ABF                  ; 5746   0004 0168 02BF

L_5749:
        PULR    R7                              ; 5749   02B7

        NEGR    R1                              ; 574A   0021
        EIS                                     ; 574B   0002
        INCR    R4                              ; 574C   000C
        INCR    R4                              ; 574D   000C
L_574E:
        PSHR    R5                              ; 574E   0275

        JSR     R5,     .EXEC.7C1               ; 574F   0004 0114 03C1

        CMPI    #$0005, R2                      ; 5752   037A 0005
        BEQ     L_579E                          ; 5754   0204 0048

        PSHR    R0                              ; 5756   0270
        MOVR    R2,     R3                      ; 5757   0093
        SDBD                                    ; 5758   0001
        ADDI    #$579A, R2                      ; 5759   02FA 009A 0057
        MVI     G_01BA, R1                      ; 575C   0281 01BA
        CMP@    R2,     R1                      ; 575E   0351
        BNEQ    L_5798                          ; 575F   020C 0037

        MOVR    R0,     R4                      ; 5761   0084

        JSR     R5,     .EXEC.76C               ; 5762   0004 0114 036C

        MOVR    R1,     R2                      ; 5765   008A
        SDBD                                    ; 5766   0001
        MVII    #$56CF, R1                      ; 5767   02B9 00CF 0056

        JSR     R5,     L_699B                  ; 576A   0004 0168 019B
        JSR     R5,     L_6C70                  ; 576D   0004 016C 0070

        XOR@    R2,     R0                      ; 5770   03D0
        MVO@    R0,     R2                      ; 5771   0250
        ADDI    #$0002, R2                      ; 5772   02FA 0002
        MVI@    R2,     R0                      ; 5774   0290
        INCR    R2                              ; 5775   000A
        MVI@    R2,     R1                      ; 5776   0291
        SLL     R3,     2                       ; 5777   004F
        SUBI    #$0006, R3                      ; 5778   033B 0006
        SWAP    R3,     1                       ; 577A   0043
        ADDR    R3,     R1                      ; 577B   00D9
        ADDR    R3,     R0                      ; 577C   00D8
        SLL     R3,     1                       ; 577D   004B
        CMPI    #$0007, R4                      ; 577E   037C 0007
        BNEQ    L_5784                          ; 5780   020C 0002

        MVII    #$0002, R4                      ; 5782   02BC 0002
L_5784:
        TSTR    R4                              ; 5784   00A4
        BEQ     L_578F                          ; 5785   0204 0008

        SDBD                                    ; 5787   0001
        ADDI    #$2800, R0                      ; 5788   02F8 0000 0028
        ADDR    R3,     R1                      ; 578B   00D9
        DECR    R4                              ; 578C   0014
        B       L_5784                          ; 578D   0220 000A

L_578F:
        MVO@    R1,     R2                      ; 578F   0251
        DECR    R2                              ; 5790   0012
        MVO@    R0,     R2                      ; 5791   0250
        SDBD                                    ; 5792   0001
        MVII    #$54D3, R0                      ; 5793   02B8 00D3 0054
        MVO     R0,     G_035D                  ; 5796   0240 035D
L_5798:
        PULR    R0                              ; 5798   02B0
        PULR    R7                              ; 5799   02B7

        DECLE   $0002,  $0000                   ; 579A   0002 0000

        INCR    R1                              ; 579C   0009
        SETC                                    ; 579D   0007
L_579E:
        MVI     G_01BA, R1                      ; 579E   0281 01BA
        CMPI    #$0003, R1                      ; 57A0   0379 0003
        BNEQ    L_57AC                          ; 57A2   020C 0008

        MVI     G_031D, R1                      ; 57A4   0281 031D
        SDBD                                    ; 57A6   0001
        ANDI    #$EFFF, R1                      ; 57A7   03B9 00FF 00EF
        MVO     R1,     G_031D                  ; 57AA   0241 031D
L_57AC:
        PULR    R7                              ; 57AC   02B7

L_57AD:
        PSHR    R5                              ; 57AD   0275
        MVI     G_017F, R0                      ; 57AE   0280 017F
        SUBI    #$0002, R0                      ; 57B0   0338 0002
        MOVR    R0,     R2                      ; 57B2   0082

        JSR     R5,     X_POW2                  ; 57B3   0004 0114 0345

        AND     G_0177, R0                      ; 57B6   0380 0177
        BEQ     L_57C7                          ; 57B8   0204 000D

        CLRR    R0                              ; 57BA   01C0

        JSR     R5,     L_574E                  ; 57BB   0004 0154 034E

        INCR    R0                              ; 57BE   0008

        JSR     R5,     L_574E                  ; 57BF   0004 0154 034E

        MVII    #$0007, R0                      ; 57C2   02B8 0007

        JSR     R5,     L_574E                  ; 57C4   0004 0154 034E

L_57C7:
        PULR    R7                              ; 57C7   02B7

        PSHR    R5                              ; 57C8   0275
        MVI     G_017D, R1                      ; 57C9   0281 017D
        TSTR    R1                              ; 57CB   0089
        BNEQ    L_5811                          ; 57CC   020C 0043

        TSTR    R0                              ; 57CE   0080
        BMI     L_5811                          ; 57CF   020B 0040

        MVII    #$0325, R2                      ; 57D1   02BA 0325
        INCR    R2                              ; 57D3   000A
        MVI@    R2,     R0                      ; 57D4   0290
        TSTR    R0                              ; 57D5   0080
        BEQ     L_57DF                          ; 57D6   0204 0007

        MVII    #$0355, R2                      ; 57D8   02BA 0355
        INCR    R2                              ; 57DA   000A
        MVI@    R2,     R0                      ; 57DB   0290
        TSTR    R0                              ; 57DC   0080
        BNEQ    L_580D                          ; 57DD   020C 002E

L_57DF:
        DECR    R2                              ; 57DF   0012
        MVI     G_017F, R1                      ; 57E0   0281 017F
        MOVR    R1,     R3                      ; 57E2   008B
        ADDI    #$0177, R1                      ; 57E3   02F9 0177
        MVI@    R1,     R0                      ; 57E5   0288
        TSTR    R0                              ; 57E6   0080
        BEQ     L_580D                          ; 57E7   0204 0024

        DECR    R0                              ; 57E9   0010
        MVO@    R0,     R1                      ; 57EA   0248

        JSR     R5,     L_59AF                  ; 57EB   0004 0158 01AF

        SDBD                                    ; 57EE   0001
        MVII    #$5631, R1                      ; 57EF   02B9 0031 0056

        JSR     R5,     L_699B                  ; 57F2   0004 0168 019B

        MVI     G_0178, R3                      ; 57F5   0283 0178
        XORI    #$0001, R3                      ; 57F7   03FB 0001
        MVO     R3,     G_0178                  ; 57F9   0243 0178
        BEQ     L_5804                          ; 57FB   0204 0007

        MOVR    R2,     R1                      ; 57FD   0091
        ADDI    #$0002, R1                      ; 57FE   02F9 0002
        MVII    #$007F, R0                      ; 5800   02B8 007F
        SWAP    R0,     1                       ; 5802   0040
        MVO@    R0,     R1                      ; 5803   0248
L_5804:
        MOVR    R2,     R1                      ; 5804   0091
        MVI     G_017F, R0                      ; 5805   0280 017F

        JSR     R5,     L_5812                  ; 5807   0004 0158 0012
        JSR     R5,     L_6A26                  ; 580A   0004 0168 0226

L_580D:
        MVII    #$0006, R1                      ; 580D   02B9 0006
        MVO     R1,     G_017D                  ; 580F   0241 017D
L_5811:
        PULR    R7                              ; 5811   02B7

L_5812:
        PSHR    R5                              ; 5812   0275
        MOVR    R1,     R4                      ; 5813   008C
        PSHR    R1                              ; 5814   0271
        SLR     R0,     2                       ; 5815   0064
        BEQ     L_581E                          ; 5816   0204 0006

        ADDI    #$0002, R1                      ; 5818   02F9 0002
        MVII    #$0053, R0                      ; 581A   02B8 0053
        SWAP    R0,     1                       ; 581C   0040
        MVO@    R0,     R1                      ; 581D   0248
L_581E:
        MVII    #$031D, R1                      ; 581E   02B9 031D

        JSR     R5,     .EXEC.777               ; 5820   0004 0114 0377

        ADDI    #$0003, R2                      ; 5823   02FA 0003
        ADDI    #$0003, R3                      ; 5825   02FB 0003
        PSHR    R3                              ; 5827   0273
        PSHR    R2                              ; 5828   0272
        ADDI    #$0002, R4                      ; 5829   02FC 0002

        JSR     R5,     .EXEC.7A3               ; 582B   0004 0114 03A3

        SLR     R2,     1                       ; 582E   0062
        MOVR    R2,     R3                      ; 582F   0093
        PULR    R0                              ; 5830   02B0
        SWAP    R0,     1                       ; 5831   0040
        XOR@    R6,     R0                      ; 5832   03F0
        MOVR    R0,     R2                      ; 5833   0082
        PULR    R1                              ; 5834   02B1

        JSR     R5,     .EXEC.9A8               ; 5835   0004 0118 01A8

        PULR    R7                              ; 5838   02B7

        PSHR    R5                              ; 5839   0275
        MOVR    R1,     R4                      ; 583A   008C
        ADDI    #$0007, R1                      ; 583B   02F9 0007
        MVI@    R1,     R0                      ; 583D   0288

        JSR     R5,     X_UNPK_BYTES            ; 583E   0004 0114 0357

        SWAP    R0,     1                       ; 5841   0040
        SWAP    R1,     1                       ; 5842   0041
        INCR    R4                              ; 5843   000C
        SDBD                                    ; 5844   0001
        MVII    #$56BC, R2                      ; 5845   02BA 00BC 0056
        MVO@    R2,     R4                      ; 5848   0262
        MVO@    R0,     R4                      ; 5849   0260
        MVO@    R1,     R4                      ; 584A   0261
        CLRR    R0                              ; 584B   01C0
        MVO@    R0,     R4                      ; 584C   0260
        INCR    R0                              ; 584D   0008
        MVO@    R0,     R4                      ; 584E   0260
        INCR    R0                              ; 584F   0008
        MVO@    R0,     R4                      ; 5850   0260
        PULR    R7                              ; 5851   02B7

        PSHR    R5                              ; 5852   0275
        MOVR    R7,     R1                      ; 5853   00B9
        ADDI    #$000F, R1                      ; 5854   02F9 000F

        JSR     R5,     L_69B3                  ; 5856   0004 0168 01B3

        SDBD                                    ; 5859   0001
        MVII    #$6773, R0                      ; 585A   02B8 0073 0067
        MVO     R0,     G_035D                  ; 585D   0240 035D

        JSR     R5,     L_590A                  ; 585F   0004 0158 010A

        PULR    R7                              ; 5862   02B7

        DECLE   $0007,  $0207,  $0047,  $0041   ; 5863   0007 0207 0047 0041
        DECLE   $0055,  $0047,  $0045,  $0053   ; 5867   0055 0047 0045 0053
        DECLE   $0000,  $0007,  $0229,  $0053   ; 586B   0000 0007 0229 0053
        DECLE   $0070,  $0065,  $0065,  $0064   ; 586F   0070 0065 0065 0064
        DECLE   $0000,  $0002,  $0239,  $006D   ; 5873   0000 0002 0239 006D
        DECLE   $0070,  $0068,  $0000,  $0007   ; 5877   0070 0068 0000 0007
        DECLE   $023D,  $0041,  $006C,  $0074   ; 587B   023D 0041 006C 0074
        DECLE   $0069,  $0074,  $0075,  $0064   ; 587F   0069 0074 0075 0064
        DECLE   $0065,  $0000,  $0002,  $024B   ; 5883   0065 0000 0002 024B
        DECLE   $0030,  $0020,  $0066,  $0074   ; 5887   0030 0020 0066 0074
        DECLE   $0000,  $0007,  $0251,  $0050   ; 588B   0000 0007 0251 0050
        DECLE   $0069,  $0074,  $0063,  $0068   ; 588F   0069 0074 0063 0068
        DECLE   $0000,  $0007,  $025C,  $0052   ; 5893   0000 0007 025C 0052
        DECLE   $006F,  $006C,  $006C,  $0000   ; 5897   006F 006C 006C 0000
        DECLE   $0007,  $02C9,  $0042,  $006F   ; 589B   0007 02C9 0042 006F
        DECLE   $006D,  $0062,  $0073,  $0000   ; 589F   006D 0062 0073 0000
        DECLE   $0002,  $02D2,  $0078,  $0020   ; 58A3   0002 02D2 0078 0020
        DECLE   $0031,  $0030,  $0030,  $0030   ; 58A7   0031 0030 0030 0030
        DECLE   $0020,  $006C,  $0062,  $0000   ; 58AB   0020 006C 0062 0000
        DECLE   $0007,  $028D,  $0046,  $0075   ; 58AF   0007 028D 0046 0075
        DECLE   $0065,  $006C,  $0000,  $0002   ; 58B3   0065 006C 0000 0002
        DECLE   $029D,  $0067,  $0061,  $006C   ; 58B7   029D 0067 0061 006C
        DECLE   $0000,  $0007,  $0279,  $0045   ; 58BB   0000 0007 0279 0045
        DECLE   $006E,  $0067,  $0069,  $006E   ; 58BF   006E 0067 0069 006E
        DECLE   $0065,  $0000                   ; 58C3   0065 0000

        EIS                                     ; 58C5   0002
        MVI     .STIC.HDLY,R7                   ; 58C6   0287 0030

        DECLE   $0020,  $0072,  $0070,  $006D   ; 58C8   0020 0072 0070 006D
        DECLE   $0000,  $03FF                   ; 58CC   0000 03FF

        PSHR    R5                              ; 58CE   0275
        MVI     G_01B7, R1                      ; 58CF   0281 01B7
        TSTR    R1                              ; 58D1   0089
        BEQ     L_58FA                          ; 58D2   0204 0026

        DECR    R0                              ; 58D4   0010
        BNEQ    L_58F9                          ; 58D5   020C 0022

        XOR     G_01B8, R0                      ; 58D7   03C0 01B8
        BNEQ    L_58F9                          ; 58D9   020C 001E

        MVI     G_0161, R0                      ; 58DB   0280 0161
        INCR    R0                              ; 58DD   0008
        INCR    R7                              ; 58DE   000F

L_58DF:
        PSHR    R5                              ; 58DF   0275
L_58E0:
        MVO     R0,     G_0161                  ; 58E0   0240 0161
        MVO     R0,     G_017E                  ; 58E2   0240 017E
        SDBD                                    ; 58E4   0001
        MVII    #$5DC0, R3                      ; 58E5   02BB 00C0 005D
        MVI     G_01B8, R1                      ; 58E8   0281 01B8
        TSTR    R1                              ; 58EA   0089
        BNEQ    L_58F7                          ; 58EB   020C 000A

        MVII    #$014E, R1                      ; 58ED   02B9 014E
        SLL     R1,     2                       ; 58EF   004D

        JSR     R5,     X_MPY                   ; 58F0   0004 011C 01DC

        CLRR    R0                              ; 58F3   01C0
        SUBR    R2,     R3                      ; 58F4   0113
        BMI     L_58E0                          ; 58F5   022B 0016

L_58F7:
        MVO     R3,     G_0334                  ; 58F7   0243 0334
L_58F9:
        PULR    R7                              ; 58F9   02B7

L_58FA:
        INCR    R0                              ; 58FA   0008
        BEQ     L_58F9                          ; 58FB   0224 0003

        XORI    #$0003, R0                      ; 58FD   03F8 0003
        SLL     R0,     2                       ; 58FF   004C
        SLL     R0,     2                       ; 5900   004C
        SLL     R0,     2                       ; 5901   004C
        NEGR    R0                              ; 5902   0020
        ADD     G_0334, R0                      ; 5903   02C0 0334
        MVO     R0,     G_0334                  ; 5905   0240 0334
        PULR    R7                              ; 5907   02B7
        B       L_590A                          ; 5908   0200 0000

L_590A:
        PSHR    R5                              ; 590A   0275
        MVI     G_01BA, R0                      ; 590B   0280 01BA
        CMPI    #$0004, R0                      ; 590D   0378 0004
        BNEQ    L_592F                          ; 590F   020C 001E

        MOVR    R7,     R2                      ; 5911   00BA
        ADDI    #$001E, R2                      ; 5912   02FA 001E

        JSR     R5,     L_69C2                  ; 5914   0004 0168 01C2

        MVI     G_01B3, R0                      ; 5917   0280 01B3

        JSR     R5,     X_EXT_SIGN_LO           ; 5919   0004 0114 0268

        MVII    #$0003, R1                      ; 591C   02B9 0003
        MVII    #$0002, R3                      ; 591E   02BB 0002
        MVII    #$0257, R4                      ; 5920   02BC 0257

        JSR     R5,     X_PRNUM_ZRO             ; 5922   0004 0118 00AD

        MVII    #$01C0, R5                      ; 5925   02BD 01C0
        SDBD                                    ; 5927   0001
        MVI@    R5,     R0                      ; 5928   02A8
        SAR     R0,     2                       ; 5929   006C
        MVII    #$0261, R4                      ; 592A   02BC 0261

        JSR     R5,     X_PRNUM_ZRO             ; 592C   0004 0118 00AD

L_592F:
        PULR    R7                              ; 592F   02B7

        DECLE   $019E,  $00AE,  $0230,  $0324   ; 5930   019E 00AE 0230 0324
        DECLE   $00AE,  $0235                   ; 5934   00AE 0235

        CMP@    R1,     R4                      ; 5936   034C
        MOVR    R1,     R7                      ; 5937   008F

        MVO     R7,     G_0161                  ; 5938   0247 0161
        MOVR    R5,     R6                      ; 593A   00AE
        ADD@    R1,     R6                      ; 593B   02CE
        SUB@    R6,     R4                      ; 593C   0334
        MOVR    R1,     R7                      ; 593D   008F

        MVI@    R3,     R0                      ; 593E   0298
        ANDR    R6,     R2                      ; 593F   01B2
        MOVR    R5,     R6                      ; 5940   00AE
        MVI     G_03FF, R4                      ; 5941   0284 03FF
L_5943:
        PSHR    R5                              ; 5943   0275
        MVO     R0,     G_035D                  ; 5944   0240 035D

        JSR     R5,     L_6DA2                  ; 5946   0004 016C 01A2

        MVII    #$0005, R0                      ; 5949   02B8 0005
        MVII    #$032D, R2                      ; 594B   02BA 032D
        SDBD                                    ; 594D   0001
        MVII    #$563A, R1                      ; 594E   02B9 003A 0056

        JSR     R5,     L_69A6                  ; 5951   0004 0168 01A6

        MVII    #$0083, R0                      ; 5954   02B8 0083
        MVO     R0,     G_01AF                  ; 5956   0240 01AF

        JSR     R5,     L_6489                  ; 5958   0004 0164 0089

        BNC     L_5966                          ; 595B   0209 0009

        MVII    #$0006, R0                      ; 595D   02B8 0006

        JSR     R5,     X_CLR_BIT               ; 595F   0004 0114 02E6

        XORR    R4,     R3                      ; 5962   01E3

        JSR     R5,     L_6229                  ; 5963   0004 0160 0229

L_5966:
        PULR    R7                              ; 5966   02B7

        PSHR    R5                              ; 5967   0275
        MOVR    R7,     R0                      ; 5968   00B8
        ADDI    #$003C, R0                      ; 5969   02F8 003C

        JSR     R5,     L_5943                  ; 596B   0004 0158 0143

        MVI     G_017F, R1                      ; 596E   0281 017F
        ADDI    #$0177, R1                      ; 5970   02F9 0177
        MVI@    R1,     R0                      ; 5972   0288

        JSR     R5,     L_59AF                  ; 5973   0004 0158 01AF

        MVI     G_017F, R0                      ; 5976   0280 017F
        MOVR    R0,     R1                      ; 5978   0081
        ADDR    R7,     R1                      ; 5979   00F9
        ADDI    #$0025, R1                      ; 597A   02F9 0025
        MVI@    R1,     R0                      ; 597C   0288
        MVII    #$0002, R1                      ; 597D   02B9 0002
        CLRR    R3                              ; 597F   01DB
        MVII    #$0205, R4                      ; 5980   02BC 0205

        JSR     R5,     X_PRNUM_RGT             ; 5982   0004 0118 00C5

        MVII    #$0208, R4                      ; 5985   02BC 0208
        MVII    #$0000, R3                      ; 5987   02BB 0000

        JSR     R5,     X_PRINT_R5              ; 5989   0004 0118 007B
        STRING  "O'Clock"                       ; 598C  
        DECLE   $0000                           ; 5993   0000

        MVII    #$031D, R2                      ; 5994   02BA 031D
        SDBD                                    ; 5996   0001
        MVII    #$561C, R1                      ; 5997   02B9 001C 0056

        JSR     R5,     L_699B                  ; 599A   0004 0168 019B
        JSR     R5,     L_57AD                  ; 599D   0004 0154 03AD

        PULR    R7                              ; 59A0   02B7

        INCR    R4                              ; 59A1   000C
        CLRC                                    ; 59A2   0006
        DIS                                     ; 59A3   0003
        INCR    R1                              ; 59A4   0009
        ADCR    R0                              ; 59A5   0028
        SLR     R1,     1                       ; 59A6   0061
        ADDR    R3,     R0                      ; 59A7   00D8
        SAR     R0,     1                       ; 59A8   0068
        ADDR    R1,     R0                      ; 59A9   00C8
        RLC     R3,     2                       ; 59AA   0057
        ADDR    R1,     R0                      ; 59AB   00C8
        RLC     R3,     2                       ; 59AC   0057
        ADDR    R1,     R0                      ; 59AD   00C8
        RLC     R3,     2                       ; 59AE   0057
L_59AF:
        PSHR    R5                              ; 59AF   0275
        SLL     R0,     1                       ; 59B0   0048
        PSHR    R0                              ; 59B1   0270
        SLL     R0,     2                       ; 59B2   004C
        ADD@    R6,     R0                      ; 59B3   02F0
        MVII    #$0003, R1                      ; 59B4   02B9 0003
        MVII    #$0002, R3                      ; 59B6   02BB 0002
        MVII    #$0211, R4                      ; 59B8   02BC 0211
        J       .EXEC.89F                       ; 59BA   0004 0318 009F

        DECLE   $00FE,  $0082,  $00BA,  $00AA   ; 59BD   00FE 0082 00BA 00AA
        DECLE   $00BA,  $0082,  $00FE,  $0000   ; 59C1   00BA 0082 00FE 0000
        DECLE   $00C6,  $00C6,  $0000,  $0010   ; 59C5   00C6 00C6 0000 0010
        DECLE   $0000,  $00C6,  $00C6,  $0000   ; 59C9   0000 00C6 00C6 0000
        DECLE   $0010,  $0010,  $0010,  $00EE   ; 59CD   0010 0010 0010 00EE
        DECLE   $0010,  $0010,  $0010,  $0000   ; 59D1   0010 0010 0010 0000
        DECLE   $0027,  $0067,  $0045,  $00F5   ; 59D5   0027 0067 0045 00F5
        DECLE   $00F7,  $0047,  $0064,  $0024   ; 59D9   00F7 0047 0064 0024
        DECLE   $0000,  $00C3,  $0066,  $0066   ; 59DD   0000 00C3 0066 0066
        DECLE   $003C,  $003C,  $0018,  $0018   ; 59E1   003C 003C 0018 0018
        DECLE   $0004                           ; 59E5   0004

        SWAP    R2,     2                       ; 59E6   0046
        ADDR    R4,     R2                      ; 59E7   00E2
        ADDR    R5,     R7                      ; 59E8   00EF
        MOVR    R5,     R7                      ; 59E9   00AF

        ADDR    R4,     R2                      ; 59EA   00E2
        MOVR    R4,     R6                      ; 59EB   00A6

        JSR     R4,     .EXEC.83C               ; 59EC   0004 0018 003C
        DECLE   $007E,  $007E,  $007E,  $007E   ; 59EF   007E 007E 007E 007E
        DECLE   $007E,  $007E,  $007E,  $007E   ; 59F3   007E 007E 007E 007E
        DECLE   $007E,  $003C,  $007E,  $0099   ; 59F7   007E 003C 007E 0099
        DECLE   $00DB,  $00FF,  $001C,  $003E   ; 59FB   00DB 00FF 001C 003E
        DECLE   $003E,  $003E,  $003E,  $003E   ; 59FF   003E 003E 003E 003E
        DECLE   $003E,  $001C,  $002A,  $003E   ; 5A03   003E 001C 002A 003E
        DECLE   $003E,  $0000,  $0000,  $0000   ; 5A07   003E 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $001C   ; 5A0B   0000 0000 0008 001C
        DECLE   $001C,  $001C,  $001C,  $001C   ; 5A0F   001C 001C 001C 001C
        DECLE   $001C,  $001C,  $001C,  $001C   ; 5A13   001C 001C 001C 001C
        DECLE   $0008,  $001C,  $001C,  $001C   ; 5A17   0008 001C 001C 001C
        DECLE   $0000,  $0000,  $0018,  $0018   ; 5A1B   0000 0000 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0000   ; 5A1F   0018 0018 0018 0000
        DECLE   $0018,  $0018,  $0008,  $0008   ; 5A23   0018 0018 0008 0008
        DECLE   $0008,  $0008,  $0000,  $0008   ; 5A27   0008 0008 0000 0008
        DECLE   $0000,  $0000,  $0008,  $0000   ; 5A2B   0000 0000 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A2F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A33   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; 5A37   0000 0000 0000 0040
        DECLE   $002C,  $0054,  $001A,  $0024   ; 5A3B   002C 0054 001A 0024
        DECLE   $001A,  $0004,  $0000,  $0000   ; 5A3F   001A 0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A43   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0058   ; 5A47   0000 0000 0000 0058
        DECLE   $002C,  $0040,  $0072,  $0024   ; 5A4B   002C 0040 0072 0024
        DECLE   $001A,  $0024,  $0000,  $003E   ; 5A4F   001A 0024 0000 003E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A53   0000 0000 0000 0000
        DECLE   $0000,  $007C,  $0000,  $005A   ; 5A57   0000 007C 0000 005A
        DECLE   $002C,  $0058,  $007A,  $003C   ; 5A5B   002C 0058 007A 003C
        DECLE   $001A,  $0065,  $0000,  $003E   ; 5A5F   001A 0065 0000 003E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A63   0000 0000 0000 0000
        DECLE   $0000,  $007C,  $00F0,  $007A   ; 5A67   0000 007C 00F0 007A
        DECLE   $00FC,  $0058,  $007A,  $007C   ; 5A6B   00FC 0058 007A 007C
        DECLE   $00DA,  $00E5,  $0040,  $007E   ; 5A6F   00DA 00E5 0040 007E
        DECLE   $00A4,  $0008,  $0000,  $003A   ; 5A73   00A4 0008 0000 003A
        DECLE   $0000,  $007C,  $00FF,  $00FE   ; 5A77   0000 007C 00FF 00FE
        DECLE   $00BE,  $003E,  $007F,  $007C   ; 5A7B   00BE 003E 007F 007C
        DECLE   $00DE,  $00E5,  $0040,  $007E   ; 5A7F   00DE 00E5 0040 007E
        DECLE   $00A4,  $0008,  $0000,  $003A   ; 5A83   00A4 0008 0000 003A
        DECLE   $0000,  $007C,  $00FF,  $00FE   ; 5A87   0000 007C 00FF 00FE
        DECLE   $00BE,  $003E,  $007F,  $007C   ; 5A8B   00BE 003E 007F 007C
        DECLE   $00FE,  $00BD,  $0074,  $007F   ; 5A8F   00FE 00BD 0074 007F
        DECLE   $00A5,  $0009,  $002B,  $003A   ; 5A93   00A5 0009 002B 003A
        DECLE   $0001,  $007F,  $00FF,  $00FE   ; 5A97   0001 007F 00FF 00FE
        DECLE   $00FE,  $00FE,  $00FF,  $00FE   ; 5A9B   00FE 00FE 00FF 00FE
        DECLE   $00BE,  $00BD,  $0074,  $007F   ; 5A9F   00BE 00BD 0074 007F
        DECLE   $00A5,  $0009,  $0020,  $0004   ; 5AA3   00A5 0009 0020 0004
        DECLE   $0040,  $0090,  $0030,  $004C   ; 5AA7   0040 0090 0030 004C
        DECLE   $000C,  $008E,  $0002,  $0060   ; 5AAB   000C 008E 0002 0060
        DECLE   $0048,  $0000,  $009A,  $000C   ; 5AAF   0048 0000 009A 000C
        DECLE   $000C,  $002D,  $0010,  $0010   ; 5AB3   000C 002D 0010 0010
        DECLE   $0000,  $00C6,  $0000,  $0010   ; 5AB7   0000 00C6 0000 0010
        DECLE   $0010,  $0000,  $0000,  $002A   ; 5ABB   0010 0000 0000 002A
        DECLE   $0054,  $002A,  $0054,  $002A   ; 5ABF   0054 002A 0054 002A
        DECLE   $0054,  $0000,  $0000,  $0008   ; 5AC3   0054 0000 0000 0008
        DECLE   $0014,  $002A,  $0054,  $0028   ; 5AC7   0014 002A 0054 0028
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5ACB   0010 0000 0000 0000
        DECLE   $0014,  $0028,  $0014,  $0028   ; 5ACF   0014 0028 0014 0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AD3   0000 0000 0000 0000
        DECLE   $0010,  $0028,  $0014,  $0008   ; 5AD7   0010 0028 0014 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ADB   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0010,  $0000   ; 5ADF   0000 0008 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AE3   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0000,  $0000   ; 5AE7   0000 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AEB   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $001A,  $003E   ; 5AEF   0000 0008 001A 003E
        DECLE   $001C,  $003E,  $0038,  $007C   ; 5AF3   001C 003E 0038 007C
        DECLE   $00FE,  $00DE,  $004C,  $0004   ; 5AF7   00FE 00DE 004C 0004
        DECLE   $0000,  $0000,  $0040,  $0022   ; 5AFB   0000 0000 0040 0022
        DECLE   $0024,  $0018,  $00BC,  $007D   ; 5AFF   0024 0018 00BC 007D
        DECLE   $007E,  $007E,  $007E,  $003E   ; 5B03   007E 007E 007E 003E
        DECLE   $005C,  $00A8,  $0024,  $0044   ; 5B07   005C 00A8 0024 0044
        DECLE   $0042,  $0002,  $0000,  $0000   ; 5B0B   0042 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B0F   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0000,  $0000   ; 5B13   0000 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B17   0000 0000 0000 0000
        DECLE   $0000,  $001C,  $0000,  $0000   ; 5B1B   0000 001C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B1F   0000 0000 0000 0000
        DECLE   $0008,  $007F,  $0000,  $0000   ; 5B23   0008 007F 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B27   0000 0000 0000 0000
        DECLE   $0001,  $001F,  $0000,  $0000   ; 5B2B   0001 001F 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0001   ; 5B2F   0000 0000 0001 0001
        DECLE   $0061,  $001F,  $0008,  $0008   ; 5B33   0061 001F 0008 0008
        DECLE   $0014,  $0036,  $001C,  $00FF   ; 5B37   0014 0036 001C 00FF
        DECLE   $0000,  $0008,  $0000,  $0000   ; 5B3B   0000 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; 5B3F   0000 0000 0000 0008
        DECLE   $0008,  $0008,  $0014,  $0077   ; 5B43   0008 0008 0014 0077
        DECLE   $001C,  $00FF,  $00FF,  $0000   ; 5B47   001C 00FF 00FF 0000
        DECLE   $0008,  $0000,  $0000,  $0000   ; 5B4B   0008 0000 0000 0000
        DECLE   $0000,  $0010,  $0010,  $0019   ; 5B4F   0000 0010 0010 0019
        DECLE   $001E,  $0035,  $0037,  $005F   ; 5B53   001E 0035 0037 005F
        DECLE   $003C,  $00F0,  $00C4,  $0080   ; 5B57   003C 00F0 00C4 0080
        DECLE   $0000,  $0000,  $0020,  $0071   ; 5B5B   0000 0000 0020 0071
        DECLE   $0073,  $007B,  $003F,  $001F   ; 5B5F   0073 007B 003F 001F
        DECLE   $003F,  $003F,  $007E,  $00FC   ; 5B63   003F 003F 007E 00FC
        DECLE   $00FB,  $00F3,  $00E6,  $0084   ; 5B67   00FB 00F3 00E6 0084
        DECLE   $000C,  $0008,  $0030,  $0038   ; 5B6B   000C 0008 0030 0038
        DECLE   $003C,  $003D,  $003F,  $001F   ; 5B6F   003C 003D 003F 001F
        DECLE   $000F,  $001F,  $001F,  $003F   ; 5B73   000F 001F 001F 003F
        DECLE   $007F,  $00FD,  $00F8,  $00F0   ; 5B77   007F 00FD 00F8 00F0
        DECLE   $00C0,  $0080,  $0000,  $0010   ; 5B7B   00C0 0080 0000 0010
        DECLE   $0038,  $003C,  $003F,  $001F   ; 5B7F   0038 003C 003F 001F
        DECLE   $000F,  $0007,  $0000,  $0000   ; 5B83   000F 0007 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0080   ; 5B87   0000 0000 0080 0080
        DECLE   $00C0,  $00FC,  $0000,  $0000   ; 5B8B   00C0 00FC 0000 0000
        DECLE   $0000,  $0080,  $00C0,  $0040   ; 5B8F   0000 0080 00C0 0040
        DECLE   $00C3,  $00FC,  $0000,  $0000   ; 5B93   00C3 00FC 0000 0000
        DECLE   $0000,  $000C,  $0070,  $0080   ; 5B97   0000 000C 0070 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B9B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0003,  $001F   ; 5B9F   0000 0000 0003 001F
        DECLE   $00FC,  $00E0,  $0001,  $0003   ; 5BA3   00FC 00E0 0001 0003
        DECLE   $0006,  $000C,  $001C,  $0038   ; 5BA7   0006 000C 001C 0038
        DECLE   $0070,  $00E0,  $0080,  $0000   ; 5BAB   0070 00E0 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BAF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BB3   0000 0000 0000 0000
        DECLE   $0004,  $000C,  $000C,  $001C   ; 5BB7   0004 000C 000C 001C
        DECLE   $0038,  $0038,  $0078,  $0070   ; 5BBB   0038 0038 0078 0070
        DECLE   $00F0,  $00E0,  $00E0,  $00C0   ; 5BBF   00F0 00E0 00E0 00C0
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 5BC3   00C0 0000 0000 0000
        DECLE   $0000,  $0002,  $0006,  $0006   ; 5BC7   0000 0002 0006 0006
        DECLE   $000E,  $001C,  $001C,  $0038   ; 5BCB   000E 001C 001C 0038
        DECLE   $0038,  $0070,  $00F0,  $00E0   ; 5BCF   0038 0070 00F0 00E0
        DECLE   $00E0,  $00C0,  $0000,  $0003   ; 5BD3   00E0 00C0 0000 0003
        DECLE   $0007,  $0007,  $000E,  $001E   ; 5BD7   0007 0007 000E 001E
        DECLE   $001C,  $003C,  $003C,  $0078   ; 5BDB   001C 003C 003C 0078
        DECLE   $00F8,  $00F8,  $00F8,  $00F0   ; 5BDF   00F8 00F8 00F8 00F0
        DECLE   $00F0,  $00E0,  $0010,  $0030   ; 5BE3   00F0 00E0 0010 0030
        DECLE   $0020,  $0060,  $00C0,  $00C0   ; 5BE7   0020 0060 00C0 00C0
        DECLE   $00A0,  $0080,  $0000,  $0000   ; 5BEB   00A0 0080 0000 0000
        DECLE   $0000,  $0000,  $0060,  $007C   ; 5BEF   0000 0000 0060 007C
        DECLE   $001F,  $0003,  $0000,  $0000   ; 5BF3   001F 0003 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0007   ; 5BF7   0000 0000 0000 0007
        DECLE   $003F,  $0078,  $0001           ; 5BFB   003F 0078 0001

        DIS                                     ; 5BFE   0003
        SETC                                    ; 5BFF   0007
        INCR    R7                              ; 5C00   000F

        DECLE   $001F                           ; 5C01   001F
L_5C02:
        RSWD    R4                              ; 5C02   003C
        DECLE   $0030,  $0000,  $0007,  $0007   ; 5C03   0030 0000 0007 0007
        DECLE   $0007,  $000F,  $000F,  $001F   ; 5C07   0007 000F 000F 001F
        DECLE   $001F,  $003E,  $003C,  $003C   ; 5C0B   001F 003E 003C 003C
        DECLE   $0078,  $0070,  $00F0,  $00E0   ; 5C0F   0078 0070 00F0 00E0
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 5C13   00C0 0000 0000 0000
        DECLE   $0001                           ; 5C17   0001

        DIS                                     ; 5C18   0003
        SETC                                    ; 5C19   0007
        INCR    R7                              ; 5C1A   000F

        COMR    R6                              ; 5C1B   001E
L_5C1C:
        COMR    R0                              ; 5C1C   0018
        DECLE   $0000,  $0000,  $0000,  $0018   ; 5C1D   0000 0000 0000 0018
        DECLE   $0007,  $0000,  $0000,  $0000   ; 5C21   0007 0000 0000 0000
        DECLE   $00C0,  $0080,  $0000,  $0080   ; 5C25   00C0 0080 0000 0080
        DECLE   $0080,  $00D0,  $00CC,  $0078   ; 5C29   0080 00D0 00CC 0078
        DECLE   $0030,  $0060,  $0060,  $00C0   ; 5C2D   0030 0060 0060 00C0
        DECLE   $0080,  $0000,  $0000,  $0000   ; 5C31   0080 0000 0000 0000
        DECLE   $00E0,  $00E0,  $00F0,  $00F8   ; 5C35   00E0 00E0 00F0 00F8
        DECLE   $00B8,  $001C,  $000E,  $0006   ; 5C39   00B8 001C 000E 0006
        DECLE   $0003,  $0001,  $0000,  $0001   ; 5C3D   0003 0001 0000 0001
        DECLE   $0001,  $0003,  $0003,  $0000   ; 5C41   0001 0003 0003 0000
        DECLE   $0000,  $0080,  $0080,  $0000   ; 5C45   0000 0080 0080 0000
        DECLE   $0040,  $0080,  $0080,  $0000   ; 5C49   0040 0080 0080 0000
L_5C4D:
        MOVR    R0,     R1                      ; 5C4D   0081
        ADDR    R7,     R1                      ; 5C4E   00F9
        ADDI    #$01E7, R1                      ; 5C4F   02F9 01E7
        MVI@    R1,     R4                      ; 5C51   028C
        ADDR    R7,     R4                      ; 5C52   00FC
        ADDI    #$016D, R4                      ; 5C53   02FC 016D
        MOVR    R5,     R7                      ; 5C55   00AF

L_5C56:
        PSHR    R5                              ; 5C56   0275
        MOVR    R7,     R1                      ; 5C57   00B9
        ADDI    #$0152, R1                      ; 5C58   02F9 0152
        ADD     G_016F, R1                      ; 5C5A   02C1 016F
        MOVR    R7,     R4                      ; 5C5C   00BC
        ADDI    #$000D, R4                      ; 5C5D   02FC 000D
        ADD@    R1,     R4                      ; 5C5F   02CC
        MVII    #$0068, R0                      ; 5C60   02B8 0068
        MVII    #$0038, R1                      ; 5C62   02B9 0038
        SWAP    R1,     1                       ; 5C64   0041

        JSR     R5,     .EXEC.730               ; 5C65   0004 0114 0330

        EIS                                     ; 5C68   0002
        PULR    R7                              ; 5C69   02B7

        DECLE   $00FF,  $0080,  $0080,  $0098   ; 5C6A   00FF 0080 0080 0098
        DECLE   $0098,  $0080,  $0080,  $0099   ; 5C6E   0098 0080 0080 0099
        DECLE   $00FF,  $0000,  $0000,  $00C6   ; 5C72   00FF 0000 0000 00C6
        DECLE   $00C6,  $0000,  $0000,  $00FF   ; 5C76   00C6 0000 0000 00FF
        DECLE   $00FF,  $0001,  $0001,  $0031   ; 5C7A   00FF 0001 0001 0031
        DECLE   $0031,  $0001,  $0001,  $00FF   ; 5C7E   0031 0001 0001 00FF
        DECLE   $0099,  $0081,  $0081,  $0099   ; 5C82   0099 0081 0081 0099
        DECLE   $0099,  $0081,  $0081,  $00FF   ; 5C86   0099 0081 0081 00FF
        DECLE   $0000,  $0080,  $00C0,  $00C0   ; 5C8A   0000 0080 00C0 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 5C8E   00C0 00C0 00C0 00C0
        DECLE   $00FF,  $00FF,  $00C0,  $00C0   ; 5C92   00FF 00FF 00C0 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 5C96   00C0 00C0 00C0 00C0
        DECLE   $00FF,  $00FF,  $0000,  $00A4   ; 5C9A   00FF 00FF 0000 00A4
        DECLE   $0008,  $0000,  $0000,  $0000   ; 5C9E   0008 0000 0000 0000
        DECLE   $00C0,  $00C0,  $0000,  $0050   ; 5CA2   00C0 00C0 0000 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CA6   0000 0000 0000 0000
        DECLE   $007F,  $003F,  $0000,  $0000   ; 5CAA   007F 003F 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CAE   0000 0000 0000 0000
        DECLE   $000F,  $000F,  $000F,  $0000   ; 5CB2   000F 000F 000F 0000
        DECLE   $0000                           ; 5CB6   0000

        INCR    R7                              ; 5CB7   000F
        INCR    R7                              ; 5CB8   000F
L_5CB9:
        INCR    R7                              ; 5CB9   000F

L_5CBA:
        ADDR    R6,     R0                      ; 5CBA   00F0
L_5CBB:
        RRC     R0,     1                       ; 5CBB   0070
        DECLE   $0030,  $0010,  $0010,  $0090   ; 5CBC   0030 0010 0010 0090
        DECLE   $00D0,  $0070,  $00F0,  $00F0   ; 5CC0   00D0 0070 00F0 00F0
        DECLE   $00F0,  $00F0,  $00F0,  $00F0   ; 5CC4   00F0 00F0 00F0 00F0
        DECLE   $00F0,  $00F0,  $0030,  $0010   ; 5CC8   00F0 00F0 0030 0010
        DECLE   $0010,  $0090,  $00D0,  $00F0   ; 5CCC   0010 0090 00D0 00F0
        DECLE   $00F0,  $00F0,  $0000,  $00C0   ; 5CD0   00F0 00F0 0000 00C0
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 5CD4   00E0 00E0 00E0 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 5CD8   00E0 00E0 00E0 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 5CDC   00E0 00E0 00E0 00E0
        DECLE   $00E0,  $00E0,  $007F,  $003F   ; 5CE0   00E0 00E0 007F 003F
        DECLE   $0006,  $0000,  $0000,  $0000   ; 5CE4   0006 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00BF   ; 5CE8   0000 0000 00FF 00BF
        DECLE   $0006,  $0000,  $0000,  $0000   ; 5CEC   0006 0000 0000 0000
        DECLE   $0000,  $0000,  $00E0,  $0086   ; 5CF0   0000 0000 00E0 0086
        DECLE   $0000,  $0030,  $00C0,  $0030   ; 5CF4   0000 0030 00C0 0030
        DECLE   $0000,  $0000,  $0003,  $0001   ; 5CF8   0000 0000 0003 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CFC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00AA,  $00AA   ; 5D00   0000 0000 00AA 00AA
        DECLE   $00AA,  $00AA,  $00AA,  $00AA   ; 5D04   00AA 00AA 00AA 00AA
        DECLE   $00AA,  $00AA,  $0000,  $009A   ; 5D08   00AA 00AA 0000 009A
        DECLE   $00C4,  $00C0,  $00D4,  $00C0   ; 5D0C   00C4 00C0 00D4 00C0
        DECLE   $00C0,  $00C0,  $0000,  $0054   ; 5D10   00C0 00C0 0000 0054
        DECLE   $0038,  $00B8,  $004E,  $0064   ; 5D14   0038 00B8 004E 0064
        DECLE   $0008,  $0000,  $0000,  $0080   ; 5D18   0008 0000 0000 0080
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 5D1C   00C0 00C0 00C0 00C0
        DECLE   $00C0,  $00C0,  $00FF,  $007F   ; 5D20   00C0 00C0 00FF 007F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 5D28   0000 0000 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00C0,  $00C0   ; 5D30   0000 0000 00C0 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00CC,  $00CC   ; 5D38   0000 0000 00CC 00CC
        DECLE   $00C4,  $00C4,  $00CC,  $00CC   ; 5D3C   00C4 00C4 00CC 00CC
        DECLE   $00CC,  $00CC,  $0000,  $0000   ; 5D40   00CC 00CC 0000 0000
        DECLE   $001E,  $003F,  $003F,  $003F   ; 5D44   001E 003F 003F 003F
        DECLE   $001E,  $0000,  $0018,  $003C   ; 5D48   001E 0000 0018 003C
        DECLE   $0018,  $0000,  $0018,  $003C   ; 5D4C   0018 0000 0018 003C
        DECLE   $0018,  $0000                   ; 5D50   0018 0000

        ADDR    R4,     R7                      ; 5D52   00E7
        ADDR    R4,     R7                      ; 5D53   00E7

        DECLE   $00C3,  $00C3,  $0081,  $00A5   ; 5D54   00C3 00C3 0081 00A5
        DECLE   $003C,  $003C,  $0000,  $0000   ; 5D58   003C 003C 0000 0000
        DECLE   $0018,  $0024,  $0042,  $005A   ; 5D5C   0018 0024 0042 005A
        DECLE   $005A,  $0042,  $005A,  $005A   ; 5D60   005A 0042 005A 005A
        DECLE   $005A,  $0042,  $0024,  $0018   ; 5D64   005A 0042 0024 0018
        DECLE   $0000,  $0000                   ; 5D68   0000 0000

        RSWD    R4                              ; 5D6A   003C
        RSWD    R4                              ; 5D6B   003C
        MOVR    R4,     R5                      ; 5D6C   00A5
        MOVR    R0,     R1                      ; 5D6D   0081
        MOVR    R0,     R1                      ; 5D6E   0081
        MOVR    R0,     R1                      ; 5D6F   0081
        ADDR    R0,     R3                      ; 5D70   00C3
        ADDR    R0,     R3                      ; 5D71   00C3
        ADDR    R3,     R7                      ; 5D72   00DF
        ADDR    R3,     R7                      ; 5D73   00DF
        MOVR    R1,     R7                      ; 5D74   008F

        DECLE   $0007,  $0027                   ; 5D75   0007 0027

        RRC     R3,     2                       ; 5D77   0077
        SETC                                    ; 5D78   0007
        RRC     R3,     2                       ; 5D79   0077
        RLC     R3,     2                       ; 5D7A   0057
        RLC     R3,     2                       ; 5D7B   0057
        RRC     R3,     2                       ; 5D7C   0077
        SETC                                    ; 5D7D   0007
        RLC     R3,     2                       ; 5D7E   0057
        RLC     R3,     2                       ; 5D7F   0057
        SETC                                    ; 5D80   0007
        MOVR    R1,     R7                      ; 5D81   008F

        DECLE   $0011,  $0015,  $0011,  $0015   ; 5D82   0011 0015 0011 0015
        DECLE   $0011,  $0015,  $0011,  $0015   ; 5D86   0011 0015 0011 0015
        DECLE   $0000,  $000A,  $0000,  $00E5   ; 5D8A   0000 000A 0000 00E5
        DECLE   $0010,  $005A,  $0058,  $001C   ; 5D8E   0010 005A 0058 001C
        DECLE   $005C,  $005E,  $001C,  $0019   ; 5D92   005C 005E 001C 0019
        DECLE   $00F8,  $0078,  $0038,  $0000   ; 5D96   00F8 0078 0038 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D9A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0001   ; 5D9E   0000 0000 0001 0001
        DECLE   $003F,  $003F,  $003F,  $003F   ; 5DA2   003F 003F 003F 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 5DA6   003F 003F 003F 003F
        DECLE   $00D0,  $0000,  $0098,  $0048   ; 5DAA   00D0 0000 0098 0048
        DECLE   $00D0,  $0118,  $0108,  $00E8   ; 5DAE   00D0 0118 0108 00E8
        DECLE   $00E8,  $0108,  $0098,  $038F   ; 5DB2   00E8 0108 0098 038F
        DECLE   $0215,  $000C,  $038C,  $0015   ; 5DB6   0215 000C 038C 0015
        DECLE   $0395,  $018F                   ; 5DBA   0395 018F

        AND     G_0388, R4                      ; 5DBC   0384 0388
        MVI@    R1,     R4                      ; 5DBE   028C
        MOVR    R1,     R4                      ; 5DBF   008C
        EIS                                     ; 5DC0   0002
        INCR    R1                              ; 5DC1   0009
        EIS                                     ; 5DC2   0002
        SWAP    R0,     2                       ; 5DC3   0044
        SWAP    R0,     2                       ; 5DC4   0044
        SWAP    R0,     2                       ; 5DC5   0044
        DIS                                     ; 5DC6   0003
        INCR    R7                              ; 5DC7   000F

        DECLE   $000F                           ; 5DC8   000F
L_5DC9:
        INCR    R4                              ; 5DC9   000C
        DECLE   $0000                           ; 5DCA   0000

        NEGR    R0                              ; 5DCB   0020
        SWAP    R0,     1                       ; 5DCC   0040
        MOVR    R0,     R1                      ; 5DCD   0081
        SLR     R0,     1                       ; 5DCE   0060
        MOVR    R4,     R2                      ; 5DCF   00A2
        ADDR    R0,     R2                      ; 5DD0   00C2
        ADDR    R4,     R2                      ; 5DD1   00E2
        SUBR    R0,     R2                      ; 5DD2   0102
        ADDR    R4,     R2                      ; 5DD3   00E2
        DIS                                     ; 5DD4   0003
        INCR    R7                              ; 5DD5   000F
        INCR    R7                              ; 5DD6   000F
L_5DD7:
        INCR    R7                              ; 5DD7   000F

L_5DD8:
        DIS                                     ; 5DD8   0003
L_5DD9:
        DIS                                     ; 5DD9   0003
        NEGR    R4                              ; 5DDA   0024
        SWAP    R0,     2                       ; 5DDB   0044
        DIS                                     ; 5DDC   0003
        DIS                                     ; 5DDD   0003
        DIS                                     ; 5DDE   0003
        SLR     R0,     2                       ; 5DDF   0064
        MOVR    R0,     R4                      ; 5DE0   0084
        TSTR    R4                              ; 5DE1   00A4
        TSTR    R4                              ; 5DE2   00A4
        ADDR    R0,     R4                      ; 5DE3   00C4
        DIS                                     ; 5DE4   0003
        INCR    R7                              ; 5DE5   000F

        DECLE   $000F                           ; 5DE6   000F
L_5DE7:
        INCR    R7                              ; 5DE7   000F

        DECLE   $0005                           ; 5DE8   0005
L_5DE9:
        NEGR    R6                              ; 5DE9   0026
        SWAP    R2,     2                       ; 5DEA   0046
        MOVR    R0,     R4                      ; 5DEB   0084
        SUBR    R4,     R4                      ; 5DEC   0124
        SLR     R2,     2                       ; 5DED   0066
        SWAP    R2,     2                       ; 5DEE   0046
        TSTR    R4                              ; 5DEF   00A4
        SUBR    R4,     R4                      ; 5DF0   0124
        ADDR    R0,     R4                      ; 5DF1   00C4
        ADDR    R4,     R4                      ; 5DF2   00E4
        SUBR    R0,     R4                      ; 5DF3   0104
        DIS                                     ; 5DF4   0003
        INCR    R7                              ; 5DF5   000F
        INCR    R7                              ; 5DF6   000F

L_5DF7:
        INCR    R6                              ; 5DF7   000E
L_5DF8:
        SWAP    R2,     1                       ; 5DF8   0042
        DECLE   $0007,  $0007,  $0007,  $0042   ; 5DF9   0007 0007 0007 0042
        DECLE   $0007,  $0023,  $0023,  $0023   ; 5DFD   0007 0023 0023 0023
        DECLE   $0023,  $0023,  $0008,  $0006   ; 5E01   0023 0023 0008 0006
        DECLE   $0006,  $0006,  $0007,  $0007   ; 5E05   0006 0006 0007 0007
        DECLE   $0007,  $0007,  $0006,  $0008   ; 5E09   0007 0007 0006 0008
        DECLE   $0089,  $0008,  $0089,  $0003   ; 5E0D   0089 0008 0089 0003
        DECLE   $0022,  $0003,  $0042,  $0008   ; 5E11   0022 0003 0042 0008
        DECLE   $0003,  $0008,  $0022,  $0003   ; 5E15   0003 0008 0022 0003
        DECLE   $0008,  $0042,  $0003,  $0008   ; 5E19   0008 0042 0003 0008
        DECLE   $0069,  $0008,  $0069,  $0002   ; 5E1D   0069 0008 0069 0002
        DECLE   $0004,  $0004,  $000A,  $002A   ; 5E21   0004 0004 000A 002A
        DECLE   $0004,  $0004,  $0004,  $0004   ; 5E25   0004 0004 0004 0004
        DECLE   $0004,  $000A,  $0022,  $0042   ; 5E29   0004 000A 0022 0042
        DECLE   $006A,  $0003,  $0004,  $0004   ; 5E2D   006A 0003 0004 0004
        DECLE   $0004,  $000A,  $002A,  $002A   ; 5E31   0004 000A 002A 002A
        DECLE   $0000,  $0000,  $0006,  $0014   ; 5E35   0000 0000 0006 0014
        DECLE   $0024,  $0034,  $0043,  $0060   ; 5E39   0024 0034 0043 0060
        DECLE   $0065,  $0065,  $006E,  $0014   ; 5E3D   0065 0065 006E 0014
        DECLE   $0075,  $0007,  $0004,  $0003   ; 5E41   0075 0007 0004 0003
        DECLE   $0006,  $000A,  $0001,  $0002   ; 5E45   0006 000A 0001 0002
        DECLE   $000A,  $0003,  $0001,  $0003   ; 5E49   000A 0003 0001 0003
        DECLE   $0004,  $0009,  $0007,  $0007   ; 5E4D   0004 0009 0007 0007
        DECLE   $0001                           ; 5E51   0001

        COMR    R6                              ; 5E52   001E
        COMR    R1                              ; 5E53   0019
        GSWD    R2                              ; 5E54   0032
        INCR    R7                              ; 5E55   000F

        DECR    R4                              ; 5E56   0014
L_5E57:
        GSWD    R2                              ; 5E57   0032
        DECLE   $003C,  $0032,  $0078,  $0019   ; 5E58   003C 0032 0078 0019
        DECLE   $0028,  $0064,  $0014,  $0019   ; 5E5C   0028 0064 0014 0019
        DECLE   $0019,  $003C,  $001E,  $0024   ; 5E60   0019 003C 001E 0024
        DECLE   $03D5,  $00BE,  $0024,  $03D8   ; 5E64   03D5 00BE 0024 03D8
        DECLE   $00A4,  $013E,  $0333,  $0022   ; 5E68   00A4 013E 0333 0022
        DECLE   $007E,  $02A6,  $03C1,  $02FE   ; 5E6C   007E 02A6 03C1 02FE
        DECLE   $02D1,  $0194,  $03C1,  $00EB   ; 5E70   02D1 0194 03C1 00EB
        DECLE   $018D,  $02CD,  $03C1,  $03D7   ; 5E74   018D 02CD 03C1 03D7
        DECLE   $0027,  $03C2,  $015E,  $02B4   ; 5E78   0027 03C2 015E 02B4
        DECLE   $03CA,  $03D6,  $02A6,  $0048   ; 5E7C   03CA 03D6 02A6 0048
        DECLE   $0109,  $027E,  $017F,  $03DB   ; 5E80   0109 027E 017F 03DB
        DECLE   $027E,  $019F,  $03D6,  $022C   ; 5E84   027E 019F 03D6 022C
        DECLE   $024C,  $01BE,  $01BF,  $03D6   ; 5E88   024C 01BE 01BF 03D6
        DECLE   $020F,  $03D0,  $03D8,  $01DE   ; 5E8C   020F 03D0 03D8 01DE
        DECLE   $0158,  $005E,  $007F,  $03D8   ; 5E90   0158 005E 007F 03D8
        DECLE   $001E,  $0137,  $03D5,  $002F   ; 5E94   001E 0137 03D5 002F

        XOR     G_03D8, R2                      ; 5E98   03C2 03D8
        MOVR    R7,     R6                      ; 5E9A   00BE
        ADDR    R7,     R0                      ; 5E9B   00F8
        XOR     G_034B, R2                      ; 5E9C   03C2 034B
        XOR@    R2,     R5                      ; 5E9E   03D5
        SUB@    R5,     R7                      ; 5E9F   032F

        DECLE   $0191,  $018C,  $01BE,  $0078   ; 5EA0   0191 018C 01BE 0078
        DECLE   $0048,  $007E,  $02B9,  $01FE   ; 5EA4   0048 007E 02B9 01FE
        DECLE   $005A,  $017E,  $02BF,  $03C7   ; 5EA8   005A 017E 02BF 03C7

        ADDI    #$0312, R6                      ; 5EAC   02FE 0312
        XOR@    R2,     R6                      ; 5EAE   03D6
        SUB@    R5,     R7                      ; 5EAF   032F

        DECLE   $03C2,  $035F                   ; 5EB0   03C2 035F
.GFX_LIST_5EB2:
        DECLE   $0007,  $0005,  $000B,  $0003   ; 5EB2  CART PIC #00
        DECLE   $0009,  $0007,  $0003,  $0001   ; 5EB6  
        DECLE   $0000,  $0003,  $0007,  $001F   ; 5EBA  CART PIC #01
        DECLE   $002F,  $001F,  $002C,  $0001   ; 5EBE  
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5EC2  CART PIC #02
        DECLE   $00FF,  $00FD,  $00C8,  $0000   ; 5EC6  
        DECLE   $00FF,  $00FE,  $00FD,  $00FC   ; 5ECA  CART PIC #03
        DECLE   $00C8,  $0080,  $0000,  $0000   ; 5ECE  
        DECLE   $00FF,  $00FD,  $00FE,  $00FA   ; 5ED2  CART PIC #04
        DECLE   $00FC,  $00FE,  $00FC,  $00FE   ; 5ED6  
        DECLE   $0003,  $0001,  $0003,  $0007   ; 5EDA  CART PIC #05
        DECLE   $0003,  $0001,  $0003,  $0001   ; 5EDE  
        DECLE   $0000,  $0003,  $0007,  $000F   ; 5EE2  CART PIC #06
        DECLE   $003F,  $00FF,  $0016,  $0000   ; 5EE6  
        DECLE   $0001,  $00CB,  $00FF,  $00FF   ; 5EEA  CART PIC #07
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5EEE  
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5EF2  CART PIC #08
        DECLE   $00DF,  $0036,  $0004,  $0000   ; 5EF6  
        DECLE   $0023,  $00CE,  $00F8,  $00FC   ; 5EFA  CART PIC #09
        DECLE   $00E8,  $0080,  $0000,  $0000   ; 5EFE  
        DECLE   $0078,  $00FC,  $00FE,  $00FC   ; 5F02  CART PIC #0A
        DECLE   $00F8,  $00B0,  $00C0,  $0080   ; 5F06  
        DECLE   $0000,  $00C0,  $00E0,  $00F1   ; 5F0A  CART PIC #0B
        DECLE   $00F4,  $00FF,  $00FE,  $00FF   ; 5F0E  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F12  CART PIC #0C
        DECLE   $0000,  $0000,  $00C4,  $00BF   ; 5F16  
        DECLE   $0001,  $0003,  $0005,  $0007   ; 5F1A  CART PIC #0D
        DECLE   $002F,  $00FF,  $00FF,  $00FF   ; 5F1E  
        DECLE   $00FF,  $007F,  $003F,  $003F   ; 5F22  CART PIC #0E
        DECLE   $001F,  $001F,  $000F,  $000F   ; 5F26  
        DECLE   $00FF,  $00FF,  $00FF,  $003F   ; 5F2A  CART PIC #0F
        DECLE   $0017,  $0003,  $0007,  $0003   ; 5F2E  
        DECLE   $007F,  $001B,  $0000,  $0000   ; 5F32  CART PIC #10
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F36  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F3A  CART PIC #11
        DECLE   $0000,  $0000,  $0003,  $0007   ; 5F3E  
        DECLE   $0000,  $0008,  $0018,  $003C   ; 5F42  CART PIC #12
        DECLE   $003E,  $003E,  $007F,  $00FF   ; 5F46  
        DECLE   $0000,  $0000,  $0003,  $000F   ; 5F4A  CART PIC #13
        DECLE   $000F,  $001F,  $007F,  $00FF   ; 5F4E  
        DECLE   $0007,  $000F,  $0003,  $0003   ; 5F52  CART PIC #14
        DECLE   $0031,  $0071,  $00F3,  $00FB   ; 5F56  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F5A  CART PIC #15
        DECLE   $0000,  $001D,  $006B,  $0080   ; 5F5E  
        DECLE   $00C0,  $00FC,  $00FE,  $00FF   ; 5F62  CART PIC #16
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5F66  
        DECLE   $00FE,  $00FC,  $00F8,  $00E0   ; 5F6A  CART PIC #17
        DECLE   $00E0,  $00E0,  $00F0,  $00FC   ; 5F6E  
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5F72  CART PIC #18
        DECLE   $00FF,  $00F3,  $00C1,  $0080   ; 5F76  
        DECLE   $00FF,  $003F,  $001F,  $0005   ; 5F7A  CART PIC #19
        DECLE   $0001,  $0000,  $0000,  $0000   ; 5F7E  
        DECLE   $0080,  $00E8,  $00FC,  $00FF   ; 5F82  CART PIC #1A
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5F86  
        DECLE   $0080,  $001A,  $0038,  $001C   ; 5F8A  CART PIC #1B
        DECLE   $003C,  $0018,  $00C4,  $0000   ; 5F8E  
        DECLE   $003C,  $007E,  $00FF,  $00FF   ; 5F92  CART PIC #1C
        DECLE   $00FF,  $007E,  $007C,  $0000   ; 5F96  
        DECLE   $0000,  $00A8,  $0054,  $00AA   ; 5F9A  CART PIC #1D
        DECLE   $00AA,  $00FE,  $00AA,  $00FE   ; 5F9E  
        DECLE   $0000,  $0000,  $0000,  $0004   ; 5FA2  CART PIC #1E
        DECLE   $004E,  $00FF,  $007E,  $0000   ; 5FA6  
        DECLE   $000C,  $000C,  $008C,  $00FF   ; 5FAA  CART PIC #1F
        DECLE   $008C,  $000C,  $000C,  $0000   ; 5FAE  
        DECLE   $0020,  $0050,  $0070,  $0050   ; 5FB2  CART PIC #20
        DECLE   $0004,  $000A,  $000E,  $000A   ; 5FB6  
        DECLE   $0000,  $0090,  $0060,  $0000   ; 5FBA  CART PIC #21
        DECLE   $0011,  $000E,  $0040,  $0000   ; 5FBE  
L_5FC2:
        PSHR    R5                              ; 5FC2   0275
        DIS                                     ; 5FC3   0003
        MVII    #$0184, R4                      ; 5FC4   02BC 0184
        MVII    #$000E, R0                      ; 5FC6   02B8 000E

        JSR     R5,     X_FILL_ZERO             ; 5FC8   0004 0114 0338

        MVII    #$0004, R0                      ; 5FCB   02B8 0004
        SWAP    R0,     1                       ; 5FCD   0040
        MVO     R0,     .IV.FIFO                ; 5FCE   0240 0081

        JSR     R5,     L_609A                  ; 5FD0   0004 0160 009A

        TSTR    R0                              ; 5FD3   0080
        BNEQ    L_5FE2                          ; 5FD4   020C 000C

L_5FD6:
        SDBD                                    ; 5FD6   0001
        MVII    #$00E4, R0                      ; 5FD7   02B8 00E4 0000
        MVO     R0,     .ISRVEC.0               ; 5FDA   0240 0100
        SDBD                                    ; 5FDC   0001
        MVII    #$005F, R0                      ; 5FDD   02B8 005F 0000
        MVO     R0,     .ISRVEC.1               ; 5FE0   0240 0101
L_5FE2:
        EIS                                     ; 5FE2   0002
        PULR    R7                              ; 5FE3   02B7

        DIS                                     ; 5FE4   0003

        JSR     R5,     X_DEF_ISR               ; 5FE5   0004 0110 0126

        MVII    #$0041, R1                      ; 5FE8   02B9 0041
L_5FEA:
        MVI     G_0184, R0                      ; 5FEA   0280 0184
        MOVR    R0,     R3                      ; 5FEC   0083
        ANDI    #$0040, R0                      ; 5FED   03B8 0040
        BEQ     L_6080                          ; 5FEF   0204 008F

        SLR     R3,     1                       ; 5FF1   0063
        ANDI    #$0006, R3                      ; 5FF2   03BB 0006
        MVII    #$0189, R4                      ; 5FF4   02BC 0189
        ADDR    R3,     R4                      ; 5FF6   00DC
        MVII    #$0185, R5                      ; 5FF7   02BD 0185
        SDBD                                    ; 5FF9   0001
        MVI@    R5,     R2                      ; 5FFA   02AA
        TSTR    R2                              ; 5FFB   0092
        BNEQ    L_6020                          ; 5FFC   020C 0022

        SDBD                                    ; 5FFE   0001
        MVI@    R4,     R5                      ; 5FFF   02A5
        SDBD                                    ; 6000   0001
        MVI@    R5,     R0                      ; 6001   02A8
        SUBI    #$0002, R4                      ; 6002   033C 0002
        CMPI    #$0100, R0                      ; 6004   0378 0100
        BC      L_6020                          ; 6006   0201 0018

        TSTR    R0                              ; 6008   0080
        BNEQ    L_6010                          ; 6009   020C 0005

        JSR     R5,     L_603D                  ; 600B   0004 0160 003D

        B       L_5FEA                          ; 600E   0220 0025

L_6010:
        JSR     R5,     L_605E                  ; 6010   0004 0160 005E

        BC      L_6080                          ; 6013   0201 006B

        PSHR    R1                              ; 6015   0271
        MVII    #$0001, R1                      ; 6016   02B9 0001

L_6018:
        JSR     R5,     L_609F                  ; 6018   0004 0160 009F

        PULR    R1                              ; 601B   02B1
        BC      L_6080                          ; 601C   0201 0062
        B       L_5FEA                          ; 601E   0220 0035

L_6020:
        PSHR    R4                              ; 6020   0274
        MVII    #$0185, R4                      ; 6021   02BC 0185
        SDBD                                    ; 6023   0001
        MVI@    R4,     R2                      ; 6024   02A2
        SDBD                                    ; 6025   0001
        MVI@    R4,     R5                      ; 6026   02A5
        PULR    R4                              ; 6027   02B4
L_6028:
        TSTR    R2                              ; 6028   0092
        BNEQ    L_602F                          ; 6029   020C 0004

        PSHR    R1                              ; 602B   0271
        CLRR    R1                              ; 602C   01C9
        B       L_6018                          ; 602D   0220 0016

L_602F:
        MVI     .IV.FIFO,R0                     ; 602F   0280 0081
        TSTR    R0                              ; 6031   0080
        BMI     L_6077                          ; 6032   020B 0043

        DECR    R1                              ; 6034   0011
        BEQ     L_6077                          ; 6035   0204 0040

        MVI@    R5,     R0                      ; 6037   02A8
        MVO     R0,     .IV.FIFO                ; 6038   0240 0081
        DECR    R2                              ; 603A   0012
        B       L_6028                          ; 603B   0220 0014

L_603D:
        PSHR    R5                              ; 603D   0275
L_603E:
        CLRR    R0                              ; 603E   01C0
        MVO     R0,     G_0185                  ; 603F   0240 0185
        MVO     R0,     G_0186                  ; 6041   0240 0186
        MVI     G_0184, R0                      ; 6043   0280 0184
        PSHR    R0                              ; 6045   0270
        ADDI    #$0004, R0                      ; 6046   02F8 0004
        ANDI    #$000C, R0                      ; 6048   03B8 000C
        PULR    R3                              ; 604A   02B3
        ANDI    #$0063, R3                      ; 604B   03BB 0063
        ADDR    R0,     R3                      ; 604D   00C3
        MVO     R3,     G_0184                  ; 604E   0243 0184
        SLR     R0,     2                       ; 6050   0064
        ANDI    #$0003, R3                      ; 6051   03BB 0003
        CMPR    R0,     R3                      ; 6053   0143
        BNEQ    L_60E5                          ; 6054   020C 008F

        MVI     G_0184, R0                      ; 6056   0280 0184
        ANDI    #$00AF, R0                      ; 6058   03B8 00AF
        MVO     R0,     G_0184                  ; 605A   0240 0184
        SETC                                    ; 605C   0007
        PULR    R7                              ; 605D   02B7

L_605E:
        PSHR    R1                              ; 605E   0271
        MVI     G_0191, R1                      ; 605F   0281 0191
        TSTR    R1                              ; 6061   0089
        BEQ     L_6067                          ; 6062   0204 0003

L_6064:
        SETC                                    ; 6064   0007
        PULR    R1                              ; 6065   02B1
        MOVR    R5,     R7                      ; 6066   00AF

L_6067:
        MVI     .IV.ALD,R1                      ; 6067   0281 0080
        TSTR    R1                              ; 6069   0089
        BPL     L_6064                          ; 606A   0223 0007

        MVO     R0,     .IV.ALD                 ; 606C   0240 0080
        CLRC                                    ; 606E   0006
        MVI     G_0184, R0                      ; 606F   0280 0184
        ANDI    #$00EF, R0                      ; 6071   03B8 00EF
        MVO     R0,     G_0184                  ; 6073   0240 0184
        PULR    R1                              ; 6075   02B1
        MOVR    R5,     R7                      ; 6076   00AF

L_6077:
        MVII    #$0185, R4                      ; 6077   02BC 0185
        MVO@    R2,     R4                      ; 6079   0262
        SWAP    R2,     1                       ; 607A   0042
        MVO@    R2,     R4                      ; 607B   0262
        MOVR    R5,     R0                      ; 607C   00A8
        MVO@    R0,     R4                      ; 607D   0260
        SWAP    R0,     1                       ; 607E   0040
        MVO@    R0,     R4                      ; 607F   0260
L_6080:
        MVI     .IV.ALD,R0                      ; 6080   0280 0080
        TSTR    R0                              ; 6082   0080
        BPL     L_6090                          ; 6083   0203 000B

        MVI     G_0191, R3                      ; 6085   0283 0191
        TSTR    R3                              ; 6087   009B
        BEQ     L_6090                          ; 6088   0204 0006

        CLRR    R0                              ; 608A   01C0
        MVO     R0,     .IV.ALD                 ; 608B   0240 0080
        DECR    R3                              ; 608D   0013
        MVO     R3,     G_0191                  ; 608E   0243 0191
L_6090:
        PULR    R5                              ; 6090   02B5
        PULR    R4                              ; 6091   02B4
        PULR    R3                              ; 6092   02B3
        PULR    R2                              ; 6093   02B2
        PULR    R1                              ; 6094   02B1
        PULR    R0                              ; 6095   02B0
        RSWD    R0                              ; 6096   0038
        PULR    R0                              ; 6097   02B0
        EIS                                     ; 6098   0002
        PULR    R7                              ; 6099   02B7

L_609A:
        MVI     .IV.FIFO,R0                     ; 609A   0280 0081
        ANDI    #$0200, R0                      ; 609C   03B8 0200
        MOVR    R5,     R7                      ; 609E   00AF

L_609F:
        PSHR    R5                              ; 609F   0275
        SDBD                                    ; 60A0   0001
        MVI@    R4,     R5                      ; 60A1   02A5
        SDBD                                    ; 60A2   0001
        MVI@    R5,     R0                      ; 60A3   02A8
        SUBI    #$0002, R4                      ; 60A4   033C 0002
        TSTR    R0                              ; 60A6   0080
        BEQ     L_603E                          ; 60A7   0224 006A

        CMPI    #$0100, R0                      ; 60A9   0378 0100
        BC      L_60B7                          ; 60AB   0201 000A

        PSHR    R0                              ; 60AD   0270
        CLRR    R0                              ; 60AE   01C0
        MVO     R0,     G_0185                  ; 60AF   0240 0185
        MVO     R0,     G_0186                  ; 60B1   0240 0186
        PULR    R0                              ; 60B3   02B0
        TSTR    R1                              ; 60B4   0089
        BEQ     L_60E5                          ; 60B5   0204 002E

L_60B7:
        PSHR    R0                              ; 60B7   0270
        MOVR    R5,     R0                      ; 60B8   00A8
        MVO@    R0,     R4                      ; 60B9   0260
        SWAP    R0,     1                       ; 60BA   0040
        MVO@    R0,     R4                      ; 60BB   0260
        SUBI    #$0002, R4                      ; 60BC   033C 0002
        SUBI    #$0002, R5                      ; 60BE   033D 0002
        PULR    R0                              ; 60C0   02B0
        CMPI    #$0100, R0                      ; 60C1   0378 0100
        BNC     L_60E5                          ; 60C3   0209 0020

        SDBD                                    ; 60C5   0001
        MVI@    R5,     R0                      ; 60C6   02A8
        MOVR    R0,     R5                      ; 60C7   0085
        MVI@    R5,     R0                      ; 60C8   02A8
        MVO     R0,     G_0185                  ; 60C9   0240 0185
        SWAP    R0,     1                       ; 60CB   0040
        MVO     R0,     G_0186                  ; 60CC   0240 0186
        MOVR    R5,     R0                      ; 60CE   00A8
        MVO     R0,     G_0187                  ; 60CF   0240 0187
        SWAP    R0,     1                       ; 60D1   0040
        MVO     R0,     G_0188                  ; 60D2   0240 0188
        MVI     G_0184, R0                      ; 60D4   0280 0184
        ANDI    #$0010, R0                      ; 60D6   03B8 0010
        BNEQ    L_60E5                          ; 60D8   020C 000B

        MVI     G_0191, R0                      ; 60DA   0280 0191
        INCR    R0                              ; 60DC   0008
        MVO     R0,     G_0191                  ; 60DD   0240 0191
        MVI     G_0184, R0                      ; 60DF   0280 0184
        ADDI    #$0010, R0                      ; 60E1   02F8 0010
        MVO     R0,     G_0184                  ; 60E3   0240 0184
L_60E5:
        CLRC                                    ; 60E5   0006
        PULR    R7                              ; 60E6   02B7

L_60E7:
        DIS                                     ; 60E7   0003
        PSHR    R5                              ; 60E8   0275
        PSHR    R0                              ; 60E9   0270
        PSHR    R1                              ; 60EA   0271
        PSHR    R2                              ; 60EB   0272
        PSHR    R3                              ; 60EC   0273
        PSHR    R4                              ; 60ED   0274

        JSR     R5,     L_609A                  ; 60EE   0004 0160 009A

        TSTR    R0                              ; 60F1   0080
        BNEQ    L_6120                          ; 60F2   020C 002C

        MVI     G_0184, R1                      ; 60F4   0281 0184
        MOVR    R1,     R2                      ; 60F6   008A
        ANDI    #$0080, R2                      ; 60F7   03BA 0080
        SETC                                    ; 60F9   0007
        BNEQ    L_6121                          ; 60FA   020C 0025

        MOVR    R1,     R2                      ; 60FC   008A
        ANDI    #$0003, R2                      ; 60FD   03BA 0003
        SDBD                                    ; 60FF   0001
        MVII    #$0189, R4                      ; 6100   02BC 0089 0001
        ADDR    R2,     R4                      ; 6103   00D4
        ADDR    R2,     R4                      ; 6104   00D4
        MVO@    R3,     R4                      ; 6105   0263
        SWAP    R3,     1                       ; 6106   0043
        MVO@    R3,     R4                      ; 6107   0263
        INCR    R2                              ; 6108   000A
        ANDI    #$0003, R2                      ; 6109   03BA 0003
        MOVR    R1,     R0                      ; 610B   0088
        ANDI    #$000C, R0                      ; 610C   03B8 000C
        SLR     R0,     2                       ; 610E   0064
        CMPR    R0,     R2                      ; 610F   0142
        BNEQ    L_6116                          ; 6110   020C 0004

        ANDI    #$007F, R1                      ; 6112   03B9 007F
        XORI    #$0080, R1                      ; 6114   03F9 0080
L_6116:
        ANDI    #$00BC, R1                      ; 6116   03B9 00BC
        XORI    #$0040, R1                      ; 6118   03F9 0040
        MOVR    R2,     R4                      ; 611A   0094
        COMR    R4                              ; 611B   001C
        ANDR    R4,     R1                      ; 611C   01A1
        XORR    R2,     R1                      ; 611D   01D1
        MVO     R1,     G_0184                  ; 611E   0241 0184
L_6120:
        CLRC                                    ; 6120   0006
L_6121:
        PULR    R4                              ; 6121   02B4
        PULR    R3                              ; 6122   02B3
        PULR    R2                              ; 6123   02B2
        PULR    R1                              ; 6124   02B1
        PULR    R0                              ; 6125   02B0
        EIS                                     ; 6126   0002
        PULR    R7                              ; 6127   02B7

        PSHR    R5                              ; 6128   0275
        MVII    #$0321, R2                      ; 6129   02BA 0321
        TSTR    R0                              ; 612B   0080
        BMI     L_6134                          ; 612C   020B 0006

        MVII    #$0018, R1                      ; 612E   02B9 0018

        JSR     R5,     L_6AF7                  ; 6130   0004 0168 02F7

        PULR    R7                              ; 6133   02B7

L_6134:
        CLRR    R0                              ; 6134   01C0
        MVO@    R0,     R2                      ; 6135   0250
        PULR    R7                              ; 6136   02B7

L_6137:
        PSHR    R5                              ; 6137   0275
        SDBD                                    ; 6138   0001
        ADDI    #$613E, R1                      ; 6139   02F9 003E 0061
        MVI@    R1,     R0                      ; 613C   0288
        PULR    R7                              ; 613D   02B7

        DECLE   $0003,  $03FF,  $0002,  $03FF   ; 613E   0003 03FF 0002 03FF
        DECLE   $03FF,  $0000,  $03FF,  $0005   ; 6142   03FF 0000 03FF 0005
        DECLE   $0001,  $0004,  $03FF,  $03FF   ; 6146   0001 0004 03FF 03FF
L_614A:
        PSHR    R5                              ; 614A   0275
        MVO     R0,     G_0319                  ; 614B   0240 0319
        MOVR    R4,     R3                      ; 614D   00A3
        MVI@    R4,     R0                      ; 614E   02A0
        PSHR    R0                              ; 614F   0270
        ADDR    R0,     R4                      ; 6150   00C4
        SUBI    #$0014, R1                      ; 6151   0339 0014
        PSHR    R1                              ; 6153   0271
L_6154:
        PULR    R1                              ; 6154   02B1
        ADDI    #$0014, R1                      ; 6155   02F9 0014
        PULR    R0                              ; 6157   02B0
        DECR    R0                              ; 6158   0010
        BMI     L_618F                          ; 6159   020B 0034

        PSHR    R0                              ; 615B   0270
        PSHR    R1                              ; 615C   0271
        INCR    R3                              ; 615D   000B
        MVI@    R3,     R2                      ; 615E   029A
        SLL     R2,     2                       ; 615F   004E
        SLL     R2,     2                       ; 6160   004E
        NOP                                     ; 6161   0034
        SLL     R2,     2                       ; 6162   004E
L_6163:
        SLLC    R2,     1                       ; 6163   005A
        INCR    R1                              ; 6164   0009
        BNC     L_6188                          ; 6165   0209 0021

        PSHR    R1                              ; 6167   0271
        MVI@    R4,     R0                      ; 6168   02A0
        MOVR    R0,     R1                      ; 6169   0081
        ANDI    #$03E0, R0                      ; 616A   03B8 03E0
        SLR     R0,     2                       ; 616C   0064
        ANDI    #$001F, R1                      ; 616D   03B9 001F
        SDBD                                    ; 616F   0001
        ADDI    #$5DB5, R1                      ; 6170   02F9 00B5 005D
        MVI@    R1,     R1                      ; 6173   0289
        SLL     R1,     1                       ; 6174   0049
        SWAP    R1,     1                       ; 6175   0041
        ADDR    R1,     R0                      ; 6176   00C8
        PULR    R1                              ; 6177   02B1
        SUBI    #$0200, R1                      ; 6178   0339 0200
        MVI     G_0319, R5                      ; 617A   0285 0319
        CMP@    R5,     R1                      ; 617C   0369
        BLT     L_6154                          ; 617D   0225 002A

        CMP@    R5,     R1                      ; 617F   0369
        BGT     L_6154                          ; 6180   022E 002D

        SLL     R0,     1                       ; 6182   0048
        SETC                                    ; 6183   0007
        RRC     R0,     1                       ; 6184   0070
        ADDI    #$0200, R1                      ; 6185   02F9 0200
        MVO@    R0,     R1                      ; 6187   0248
L_6188:
        TSTR    R2                              ; 6188   0092
        BEQ     L_6154                          ; 6189   0224 0036
        B       L_6163                          ; 618B   0220 0029

        PULR    R0                              ; 618D   02B0
        PULR    R0                              ; 618E   02B0
L_618F:
        PULR    R7                              ; 618F   02B7

        DECLE   $0000,  $0003,  $0006,  $0009   ; 6190   0000 0003 0006 0009
        DECLE   $000E,  $0013,  $001A,  $0021   ; 6194   000E 0013 001A 0021
        DECLE   $0028,  $0031,  $003A,  $0001   ; 6198   0028 0031 003A 0001
        DECLE   $0127,  $0000,  $0001,  $0127   ; 619C   0127 0000 0001 0127
        DECLE   $0002,  $0001,  $0127,  $0004   ; 61A0   0002 0001 0127 0004

        EIS                                     ; 61A4   0002
        MOVR    R4,     R7                      ; 61A5   00A7

        DECLE   $0006,  $01A7,  $0000           ; 61A6   0006 01A7 0000

        EIS                                     ; 61A9   0002
        MOVR    R4,     R7                      ; 61AA   00A7

        DECLE   $0008,  $01A7,  $0002,  $0003   ; 61AB   0008 01A7 0002 0003
        DECLE   $0128,  $000A,  $0228,  $0004   ; 61AF   0128 000A 0228 0004
        DECLE   $0028,  $000E,  $0003,  $0125   ; 61B3   0028 000E 0003 0125
        DECLE   $0007,  $0227,  $0006,  $0027   ; 61B7   0007 0227 0006 0027
        DECLE   $0002,  $0003,  $0125,  $0009   ; 61BB   0002 0003 0125 0009
        DECLE   $0225,  $0005,  $0029,  $0004   ; 61BF   0225 0005 0029 0004
        DECLE   $0004,  $0126,  $000B,  $0220   ; 61C3   0004 0126 000B 0220
        DECLE   $0007,  $004A,  $0006,  $0228   ; 61C7   0007 004A 0006 0228
        DECLE   $0018,  $0004                   ; 61CB   0018 0004

        SUBR    R0,     R5                      ; 61CD   0105
        INCR    R5                              ; 61CE   000D
        B       L_61DA                          ; 61CF   0200 0009

        DECLE   $000A,  $000C,  $0208,  $0009   ; 61D1   000A 000C 0208 0009
        DECLE   $0005                           ; 61D5   0005

        ADDR    R0,     R4                      ; 61D6   00C4
        COMR    R4                              ; 61D7   001C
        CLRR    R0                              ; 61D8   01C0
        INCR    R3                              ; 61D9   000B
L_61DA:
        ADDR    R1,     R0                      ; 61DA   00C8
        DECLE   $0005,  $01C8,  $000B,  $02CA   ; 61DB   0005 01C8 000B 02CA
        DECLE   $0000                           ; 61DF   0000
L_61E0:
        PSHR    R5                              ; 61E0   0275
        MVI     G_0192, R4                      ; 61E1   0284 0192
        MOVR    R4,     R0                      ; 61E3   00A0
        MOVR    R7,     R5                      ; 61E4   00BD
        ADDI    #$00A8, R5                      ; 61E5   02FD 00A8
        ADDR    R5,     R4                      ; 61E7   00EC
        MVI@    R4,     R1                      ; 61E8   02A1
        CMPI    #$03FF, R1                      ; 61E9   0379 03FF
        BEQ     L_621A                          ; 61EB   0204 002D

        MVO     R1,     G_0196                  ; 61ED   0241 0196
        SUBR    R5,     R4                      ; 61EF   012C
        MVO     R4,     G_0192                  ; 61F0   0244 0192
        PSHR    R0                              ; 61F2   0270

        JSR     R5,     L_6A8D                  ; 61F3   0004 0168 028D

        MVI     .PSG0.chn_a_vol,R0              ; 61F6   0280 01FB
        ANDI    #$000F, R0                      ; 61F8   03B8 000F
        NEGR    R0                              ; 61FA   0020
        MVI     G_01B9, R1                      ; 61FB   0281 01B9
        SLR     R1,     1                       ; 61FD   0061
        SUBR    R1,     R0                      ; 61FE   0108
        ADDI    #$0015, R0                      ; 61FF   02F8 0015
        BPL     L_6204                          ; 6201   0203 0001

        CLRR    R0                              ; 6203   01C0

L_6204:
        JSR     R5,     X_RAND2                 ; 6204   0004 0114 029E

        TSTR    R0                              ; 6207   0080
        BNEQ    L_620E                          ; 6208   020C 0004

        INCR    R0                              ; 620A   0008

        JSR     R5,     L_570E                  ; 620B   0004 0154 030E

L_620E:
        PULR    R0                              ; 620E   02B0
        MVI     G_0193, R1                      ; 620F   0281 0193

        JSR     R5,     .EXEC.629               ; 6211   0004 0114 0229

        MVO     R0,     G_0197                  ; 6214   0240 0197
        SWAP    R0,     1                       ; 6216   0040
        MVO     R0,     G_0198                  ; 6217   0240 0198
        PULR    R7                              ; 6219   02B7

L_621A:
        JSR     R5,     L_6489                  ; 621A   0004 0164 0089

        BNC     L_6224                          ; 621D   0209 0005
        INCR    R7                              ; 621F   000F

        PSHR    R5                              ; 6220   0275

L_6221:
        JSR     R5,     L_62E5                  ; 6221   0004 0160 02E5

L_6224:
        MVII    #$00FF, R0                      ; 6224   02B8 00FF
        MVO     R0,     G_01A1                  ; 6226   0240 01A1
        PULR    R7                              ; 6228   02B7

L_6229:
        PSHR    R5                              ; 6229   0275
        MVII    #$0007, R0                      ; 622A   02B8 0007

        JSR     R5,     X_SET_BIT               ; 622C   0004 0114 02DB

        XORR    R4,     R3                      ; 622F   01E3

        JSR     R5,     L_62E5                  ; 6230   0004 0160 02E5

        MVI     G_0192, R0                      ; 6233   0280 0192
        DECR    R0                              ; 6235   0010
        MVII    #$0194, R4                      ; 6236   02BC 0194
        SDBD                                    ; 6238   0001
        MVI@    R4,     R3                      ; 6239   02A3
        SDBD                                    ; 623A   0001
        MVII    #$6190, R1                      ; 623B   02B9 0090 0061
        ADDR    R0,     R1                      ; 623E   00C1
        MVI@    R1,     R4                      ; 623F   028C
        SDBD                                    ; 6240   0001
        ADDI    #$619B, R4                      ; 6241   02FC 009B 0061
        MVII    #$0199, R2                      ; 6244   02BA 0199

        JSR     R5,     L_6C23                  ; 6246   0004 016C 0023

        PULR    R7                              ; 6249   02B7

L_624A:
        PSHR    R5                              ; 624A   0275
        MVII    #$0053, R0                      ; 624B   02B8 0053

        JSR     R5,     X_RAND2                 ; 624D   0004 0114 029E

        ADDI    #$0029, R0                      ; 6250   02F8 0029
        MVO     R0,     G_019A                  ; 6252   0240 019A
        MVII    #$004D, R0                      ; 6254   02B8 004D

        JSR     R5,     X_RAND2                 ; 6256   0004 0114 029E

        ADDI    #$0019, R0                      ; 6259   02F8 0019
        MVO     R0,     G_019C                  ; 625B   0240 019C
        CLRR    R0                              ; 625D   01C0
        MVO     R0,     G_0192                  ; 625E   0240 0192
        SDBD                                    ; 6260   0001
        MVII    #$9810, R2                      ; 6261   02BA 0010 0098
        INCR    R0                              ; 6264   0008

        JSR     R5,     X_RAND1                 ; 6265   0004 0114 027D

        SLL     R0,     2                       ; 6268   004C
        ADDR    R0,     R7                      ; 6269   00C7

        SDBD                                    ; 626A   0001
        XORI    #$2080, R2                      ; 626B   03FA 0080 0020
        MVII    #$0003, R0                      ; 626E   02B8 0003

        JSR     R5,     X_RAND2                 ; 6270   0004 0114 029E

        ADDI    #$0005, R0                      ; 6273   02F8 0005
        MOVR    R0,     R1                      ; 6275   0081
        MVII    #$0001, R0                      ; 6276   02B8 0001

        JSR     R5,     X_RAND1                 ; 6278   0004 0114 027D

        TSTR    R0                              ; 627B   0080
        BEQ     L_6282                          ; 627C   0204 0004

        XORI    #$0200, R2                      ; 627E   03FA 0200
        SUBI    #$0004, R1                      ; 6280   0339 0004
L_6282:
        MVO     R1,     G_0193                  ; 6282   0241 0193
        MVO     R2,     G_0194                  ; 6284   0242 0194
        SWAP    R2,     1                       ; 6286   0042
        MVO     R2,     G_0195                  ; 6287   0242 0195

        JSR     R5,     L_61E0                  ; 6289   0004 0160 01E0

        PULR    R7                              ; 628C   02B7

        DECLE   $0028,  $0032,  $0006,  $0006   ; 628D   0028 0032 0006 0006
        DECLE   $0006,  $0006,  $0006,  $0006   ; 6291   0006 0006 0006 0006
        DECLE   $0006,  $0006,  $0014,  $03FF   ; 6295   0006 0006 0014 03FF
L_6299:
        PSHR    R5                              ; 6299   0275

        JSR     R5,     L_62A2                  ; 629A   0004 0160 02A2

        MVII    #$0003, R0                      ; 629D   02B8 0003
        MVO     R0,     G_0102                  ; 629F   0240 0102
        PULR    R7                              ; 62A1   02B7

L_62A2:
        PSHR    R5                              ; 62A2   0275
        MVI     G_01A1, R0                      ; 62A3   0280 01A1
        CMPI    #$00FE, R0                      ; 62A5   0378 00FE
        BGE     L_62E4                          ; 62A7   020D 003B

        MVII    #$0197, R5                      ; 62A9   02BD 0197
        SDBD                                    ; 62AB   0001
        MVI@    R5,     R0                      ; 62AC   02A8
        SDBD                                    ; 62AD   0001
        MVI@    R5,     R1                      ; 62AE   02A9
        SDBD                                    ; 62AF   0001
        MVI@    R5,     R2                      ; 62B0   02AA

        JSR     R5,     .EXEC.477               ; 62B1   0004 0114 0077

        MVII    #$00FF, R4                      ; 62B4   02BC 00FF
        MVII    #$0199, R5                      ; 62B6   02BD 0199
        MVO@    R1,     R5                      ; 62B8   0269
        SWAP    R1,     1                       ; 62B9   0041
        MVO@    R1,     R5                      ; 62BA   0269
        ANDR    R4,     R1                      ; 62BB   01A1
        CMPI    #$00A8, R1                      ; 62BC   0379 00A8
        MVO@    R2,     R5                      ; 62BE   026A
        SWAP    R2,     1                       ; 62BF   0042
        BMI     L_621A                          ; 62C0   022B 00A7

        MVO@    R2,     R5                      ; 62C2   026A
        ANDR    R4,     R2                      ; 62C3   01A2
        CMPI    #$0068, R2                      ; 62C4   037A 0068
        BGT     L_621A                          ; 62C6   022E 00AD

        MVI     G_0196, R0                      ; 62C8   0280 0196
        DECR    R0                              ; 62CA   0010
        PSHR    R0                              ; 62CB   0270
        MVO     R0,     G_0196                  ; 62CC   0240 0196
        BNEQ    L_62D3                          ; 62CE   020C 0003

        JSR     R5,     L_61E0                  ; 62D0   0004 0160 01E0
L_62D3:
        JSR     R5,     L_6489                  ; 62D3   0004 0164 0089

        BNC     L_62DB                          ; 62D6   0209 0003

        JSR     R5,     L_6229                  ; 62D8   0004 0160 0229

L_62DB:
        PULR    R0                              ; 62DB   02B0
        TSTR    R0                              ; 62DC   0080
        BNEQ    L_62E4                          ; 62DD   020C 0005

        MVII    #$0002, R0                      ; 62DF   02B8 0002

        JSR     R5,     .EXEC.41C               ; 62E1   0004 0114 001C

L_62E4:
        PULR    R7                              ; 62E4   02B7

L_62E5:
        CLRR    R0                              ; 62E5   01C0
        MVII    #$032D, R1                      ; 62E6   02B9 032D
L_62E8:
        MVO@    R0,     R1                      ; 62E8   0248
        ADDI    #$0008, R1                      ; 62E9   02F9 0008
        CMPI    #$0355, R1                      ; 62EB   0379 0355
        BLT     L_62E8                          ; 62ED   0225 0006
        MOVR    R5,     R7                      ; 62EF   00AF

L_62F0:
        PSHR    R5                              ; 62F0   0275
        MVI     G_017D, R0                      ; 62F1   0280 017D
        DECR    R0                              ; 62F3   0010
        BMI     L_62F8                          ; 62F4   020B 0002

        MVO     R0,     G_017D                  ; 62F6   0240 017D

L_62F8:
        JSR     R5,     L_6299                  ; 62F8   0004 0160 0299
        JSR     R5,     L_6DE3                  ; 62FB   0004 016C 01E3
        JSR     R5,     L_671B                  ; 62FE   0004 0164 031B
        JSR     R5,     .EXEC.4F1               ; 6301   0004 0114 00F1
        JSR     R5,     L_695C                  ; 6304   0004 0168 015C
        JSR     R5,     L_631A                  ; 6307   0004 0160 031A
        JSR     R5,     L_6597                  ; 630A   0004 0164 0197
        JSR     R5,     L_52D2                  ; 630D   0004 0150 02D2
        JSR     R5,     L_69F1                  ; 6310   0004 0168 01F1
        JSR     R5,     L_680F                  ; 6313   0004 0168 000F
        JSR     R5,     L_590A                  ; 6316   0004 0158 010A

        PULR    R7                              ; 6319   02B7

L_631A:
        PSHR    R5                              ; 631A   0275
        MVI     G_017F, R0                      ; 631B   0280 017F
        SWAP    R0,     2                       ; 631D   0044
        BMI     L_6337                          ; 631E   020B 0017

        MVII    #$031D, R1                      ; 6320   02B9 031D

        JSR     R5,     .EXEC.777               ; 6322   0004 0114 0377

        MVII    #$031F, R4                      ; 6325   02BC 031F
        MOVR    R2,     R0                      ; 6327   0090

        JSR     R5,     X_CLAMP                 ; 6328   0004 0114 0270

        DECR    R0                              ; 632B   0010
        MOVR    R3,     R1                      ; 632C   0099
        SWAP    R0,     1                       ; 632D   0040
        MVO@    R0,     R4                      ; 632E   0260
        MOVR    R3,     R0                      ; 632F   0098

        JSR     R5,     X_CLAMP                 ; 6330   0004 0114 0270

        INCR    R0                              ; 6333   0008
        SLLC    R2,     1                       ; 6334   005A
        SWAP    R0,     1                       ; 6335   0040
        MVO@    R0,     R4                      ; 6336   0260
L_6337:
        MVI     G_019E, R1                      ; 6337   0281 019E
        MVI     G_0344, R0                      ; 6339   0280 0344
        SLR     R0,     2                       ; 633B   0064
        SLR     R0,     2                       ; 633C   0064
        SLR     R0,     2                       ; 633D   0064
        SLR     R0,     1                       ; 633E   0060
        MVO     R0,     G_0324                  ; 633F   0240 0324
        SUBR    R0,     R1                      ; 6341   0101
        SAR     R1,     1                       ; 6342   0069
        ADD     G_0344, R1                      ; 6343   02C1 0344
        MVO     R1,     G_0344                  ; 6345   0241 0344
        SLR     R0,     1                       ; 6347   0060
        SLR     R0,     2                       ; 6348   0064
        MVO     R0,     G_01C5                  ; 6349   0240 01C5
        CLRR    R1                              ; 634B   01C9
        MVI     G_019F, R0                      ; 634C   0280 019F

        JSR     R5,     X_EXT_SIGN_LO           ; 634E   0004 0114 0268

        SAR     R0,     1                       ; 6351   0068
        PSHR    R0                              ; 6352   0270
        SAR     R0,     1                       ; 6353   0068
        BMI     L_6358                          ; 6354   020B 0002

        COMR    R1                              ; 6356   0019
        SLR     R3,     1                       ; 6357   0063
L_6358:
        ADD     G_034C, R0                      ; 6358   02C0 034C
        BPL     L_6367                          ; 635A   0203 000B

        MOVR    R1,     R0                      ; 635C   0088
        BNEQ    L_6367                          ; 635D   020C 0008

        CLRR    R0                              ; 635F   01C0
        MVO     R0,     G_019F                  ; 6360   0240 019F
        PULR    R5                              ; 6362   02B5
        PSHR    R0                              ; 6363   0270

        JSR     R5,     L_6396                  ; 6364   0004 0160 0396

L_6367:
        MVO     R0,     G_034C                  ; 6367   0240 034C
        MVI     G_0344, R0                      ; 6369   0280 0344
        SUB@    R6,     R0                      ; 636B   0330
        MVO     R0,     G_0344                  ; 636C   0240 0344
        MVI     G_01B8, R5                      ; 636E   0285 01B8
        TSTR    R5                              ; 6370   00AD
        BNEQ    L_6395                          ; 6371   020C 0022

        MVI     G_0334, R1                      ; 6373   0281 0334
        TSTR    R1                              ; 6375   0089
        BEQ     L_6393                          ; 6376   0204 001B

        MVI     G_01B2, R0                      ; 6378   0280 01B2

        JSR     R5,     X_SQUARE                ; 637A   0004 011C 01DB

        SLR     R2,     2                       ; 637D   0066
        SLR     R2,     2                       ; 637E   0066
        MOVR    R2,     R1                      ; 637F   0091
        SLR     R1,     2                       ; 6380   0065
        SLR     R1,     1                       ; 6381   0061
        ADD     G_019D, R1                      ; 6382   02C1 019D
        MVO     R1,     G_019D                  ; 6384   0241 019D
        SWAP    R1,     1                       ; 6386   0041
        ANDI    #$00FF, R1                      ; 6387   03B9 00FF
        NEGR    R1                              ; 6389   0021
        ADD     G_0334, R1                      ; 638A   02C1 0334
        CMPI    #$0000, R1                      ; 638C   0379 0000
        BGT     L_6393                          ; 638E   020E 0003

        CLRR    R1                              ; 6390   01C9
        MVO     R1,     G_01B2                  ; 6391   0241 01B2
L_6393:
        MVO     R1,     G_0334                  ; 6393   0241 0334
L_6395:
        PULR    R7                              ; 6395   02B7

L_6396:
        PSHR    R5                              ; 6396   0275
        MVI     G_01AC, R0                      ; 6397   0280 01AC
        TSTR    R0                              ; 6399   0080
        BNEQ    L_63B8                          ; 639A   020C 001C

        XOR     G_01B6, R0                      ; 639C   03C0 01B6
        BEQ     L_63B8                          ; 639E   0204 0018

        MVII    #$000B, R0                      ; 63A0   02B8 000B

        JSR     R5,     L_68D8                  ; 63A2   0004 0168 00D8

        MVII    #$0007, R1                      ; 63A5   02B9 0007
L_63A7:
        PSHR    R1                              ; 63A7   0271

        JSR     R5,     L_6AAD                  ; 63A8   0004 0168 02AD

        PULR    R1                              ; 63AB   02B1
        MVII    #$000E, R0                      ; 63AC   02B8 000E

        JSR     R5,     X_RAND1                 ; 63AE   0004 0114 027D

L_63B1:
        DECR    R0                              ; 63B1   0010
        BNEQ    L_63B1                          ; 63B2   022C 0002

        DECR    R1                              ; 63B4   0011
        BNEQ    L_63A7                          ; 63B5   022C 000F
L_63B7:
        DECR    R7                              ; 63B7   0017
L_63B8:
        PULR    R7                              ; 63B8   02B7

L_63B9:
        PSHR    R5                              ; 63B9   0275

        JSR     R5,     L_64A1                  ; 63BA   0004 0164 00A1

        MVI     G_01A4, R2                      ; 63BD   0282 01A4
        MVI     G_01A7, R3                      ; 63BF   0283 01A7

        JSR     R5,     L_6B10                  ; 63C1   0004 0168 0310
        JSR     R5,     L_6582                  ; 63C4   0004 0164 0182
        JSR     R5,     L_6512                  ; 63C7   0004 0164 0112
        JSR     R5,     L_6443                  ; 63CA   0004 0164 0043
        JSR     R5,     L_63D1                  ; 63CD   0004 0160 03D1

        PULR    R7                              ; 63D0   02B7

L_63D1:
        SDBD                                    ; 63D1   0001
        MVII    #$7530, R3                      ; 63D2   02BB 0030 0075
        MVI     G_01B8, R4                      ; 63D5   0284 01B8
        TSTR    R4                              ; 63D7   00A4
        BNEQ    L_63EB                          ; 63D8   020C 0011

        MVI     G_0161, R0                      ; 63DA   0280 0161

        JSR     R5,     X_CLAMP                 ; 63DC   0004 0114 0270
        DECLE   $0000                           ; 63DF   0000

        DECR    R2                              ; 63E0   0012
        SWAP    R0,     1                       ; 63E1   0040
        SLL     R0,     2                       ; 63E2   004C
        ADDR    R0,     R3                      ; 63E3   00C3
        MVI     G_0334, R0                      ; 63E4   0280 0334
        SLR     R0,     2                       ; 63E6   0064
        PSHR    R0                              ; 63E7   0270
        SLL     R0,     1                       ; 63E8   0048
        ADD@    R6,     R0                      ; 63E9   02F0
        ADDR    R0,     R3                      ; 63EA   00C3
L_63EB:
        MVO     R3,     G_033C                  ; 63EB   0243 033C
        SDBD                                    ; 63ED   0001
        MVII    #$3938, R1                      ; 63EE   02B9 0038 0039
        MOVR    R3,     R2                      ; 63F1   009A
        SWAP    R2,     1                       ; 63F2   0042
        SLR     R2,     1                       ; 63F3   0062
        ANDI    #$007F, R2                      ; 63F4   03BA 007F

        JSR     R5,     X_DIV                   ; 63F6   0004 011C 01FB

        MVI     G_01B2, R1                      ; 63F9   0281 01B2

        JSR     R5,     X_MPY                   ; 63FB   0004 011C 01DC

        SWAP    R2,     1                       ; 63FE   0042
        ANDI    #$00FF, R2                      ; 63FF   03BA 00FF
        MOVR    R2,     R0                      ; 6401   0090
        SUB     G_01B0, R0                      ; 6402   0300 01B0

        JSR     R5,     X_CLAMP                 ; 6404   0004 0114 0270
        DECLE   $0000,  $00FF                   ; 6407   0000 00FF

        MVO     R0,     G_019E                  ; 6409   0240 019E
        MVI     G_01B3, R0                      ; 640B   0280 01B3

        JSR     R5,     X_EXT_SIGN_LO           ; 640D   0004 0114 0268

        MVI     G_0344, R1                      ; 6410   0281 0344
        MVII    #$0001, R3                      ; 6412   02BB 0001
        MVII    #$0380, R2                      ; 6414   02BA 0380
        SDBD                                    ; 6416   0001
        CMPI    #$2D00, R1                      ; 6417   0379 0000 002D
        BMI     L_643A                          ; 641A   020B 001E

        SLR     R1,     2                       ; 641C   0065
        SLR     R1,     2                       ; 641D   0065
        SLR     R1,     2                       ; 641E   0065

        JSR     R5,     X_MPY                   ; 641F   0004 011C 01DC

        TSTR    R2                              ; 6422   0092
        BMI     L_6433                          ; 6423   020B 000E

        ANDI    #$00FF, R2                      ; 6425   03BA 00FF
        CLRR    R0                              ; 6427   01C0
        COMR    R0                              ; 6428   0018
        SLR     R0,     1                       ; 6429   0060
        SUB     G_034C, R0                      ; 642A   0300 034C
        SWAP    R0,     1                       ; 642C   0040
        ANDI    #$00FF, R0                      ; 642D   03B8 00FF
        MOVR    R2,     R1                      ; 642F   0091

        JSR     R5,     X_MPY                   ; 6430   0004 011C 01DC

L_6433:
        SWAP    R2,     1                       ; 6433   0042
        MVI     G_01B2, R5                      ; 6434   0285 01B2
        TSTR    R5                              ; 6436   00AD
        BEQ     L_643A                          ; 6437   0204 0001

        CLRR    R3                              ; 6439   01DB
L_643A:
        MVO     R2,     G_019F                  ; 643A   0242 019F
        MVI     G_01AC, R5                      ; 643C   0285 01AC
        COMR    R5                              ; 643E   001D
        ANDR    R5,     R3                      ; 643F   01AB
        MVO     R3,     G_01A0                  ; 6440   0243 01A0
        PULR    R7                              ; 6442   02B7

L_6443:
        PSHR    R5                              ; 6443   0275
        MVI     G_01AE, R0                      ; 6444   0280 01AE
        AND     G_01BD, R0                      ; 6446   0380 01BD
        BNEQ    L_6488                          ; 6448   020C 003E

        JSR     R5,     L_653E                  ; 644A   0004 0164 013E

        MOVR    R2,     R0                      ; 644D   0090
        MVI     G_01A1, R3                      ; 644E   0283 01A1
        CMPI    #$00FE, R3                      ; 6450   037B 00FE
        BEQ     L_6488                          ; 6452   0204 0034

        MVII    #$00FF, R4                      ; 6454   02BC 00FF
        CMPR    R4,     R3                      ; 6456   0163
        BEQ     L_645B                          ; 6457   0204 0002

        MVII    #$0001, R0                      ; 6459   02B8 0001
L_645B:
        NEGR    R0                              ; 645B   0020
        ADDI    #$0005, R0                      ; 645C   02F8 0005
        BMI     L_6467                          ; 645E   020B 0007

        INCR    R0                              ; 6460   0008

        JSR     R5,     X_RAND1                 ; 6461   0004 0114 027D

        TSTR    R0                              ; 6464   0080
        BNEQ    L_6488                          ; 6465   020C 0021

L_6467:
        MVII    #$0002, R0                      ; 6467   02B8 0002

        JSR     R5,     X_RAND1                 ; 6469   0004 0114 027D

        CMPR    R4,     R3                      ; 646C   0163
        BNEQ    L_647E                          ; 646D   020C 000F

        MVO     R0,     G_01A1                  ; 646F   0240 01A1

        JSR     R5,     L_6489                  ; 6471   0004 0164 0089

        BNC     L_6478                          ; 6474   0209 0002
        B       L_6467                          ; 6476   0220 0010

L_6478:
        CMPR    R4,     R3                      ; 6478   0163
        BNEQ    L_647E                          ; 6479   020C 0003

        JSR     R5,     L_624A                  ; 647B   0004 0160 024A

L_647E:
        MVI     G_01A1, R0                      ; 647E   0280 01A1
        MVO     R0,     G_01CF                  ; 6480   0240 01CF
        MVII    #$0007, R0                      ; 6482   02B8 0007

        JSR     R5,     X_CLR_BIT               ; 6484   0004 0114 02E6

        XORR    R4,     R3                      ; 6487   01E3
L_6488:
        PULR    R7                              ; 6488   02B7

L_6489:
        PSHR    R5                              ; 6489   0275
        MVI     G_017F, R5                      ; 648A   0285 017F
        SUBI    #$0002, R5                      ; 648C   033D 0002
        MVI     G_01BA, R0                      ; 648E   0280 01BA
        DECR    R0                              ; 6490   0010
        BNEQ    L_6494                          ; 6491   020C 0001

        CLRR    R5                              ; 6493   01ED
L_6494:
        MVI     G_01A1, R0                      ; 6494   0280 01A1
        CMPI    #$00FE, R0                      ; 6496   0378 00FE
        BGE     L_649F                          ; 6498   020D 0005

        CMPR    R5,     R0                      ; 649A   0168
        BNEQ    L_649F                          ; 649B   020C 0002

        SETC                                    ; 649D   0007
        PULR    R7                              ; 649E   02B7

L_649F:
        CLRC                                    ; 649F   0006
        PULR    R7                              ; 64A0   02B7

L_64A1:
        PSHR    R5                              ; 64A1   0275
        MVI     G_0344, R3                      ; 64A2   0283 0344
        SWAP    R3,     1                       ; 64A4   0043
        ANDI    #$00FF, R3                      ; 64A5   03BB 00FF
        ADDI    #$0010, R3                      ; 64A7   02FB 0010
        SLR     R3,     2                       ; 64A9   0067
        SLR     R3,     2                       ; 64AA   0067
        SLR     R3,     1                       ; 64AB   0063

        JSR     R5,     L_64DD                  ; 64AC   0004 0164 00DD

        SDBD                                    ; 64AF   0001
        MVI@    R4,     R0                      ; 64B0   02A0
        TSTR    R0                              ; 64B1   0080
        BEQ     L_64F7                          ; 64B2   0204 0043

        SUBR    R3,     R0                      ; 64B4   0118
        MVO     R0,     G_01A8                  ; 64B5   0240 01A8
        SWAP    R0,     1                       ; 64B7   0040
        MVO     R0,     G_01A9                  ; 64B8   0240 01A9
        SWAP    R0,     1                       ; 64BA   0040
        CMPI    #$0000, R0                      ; 64BB   0378 0000
        BGT     L_64F7                          ; 64BD   020E 0038

        MVII    #$0002, R0                      ; 64BF   02B8 0002

        JSR     R5,     X_CLR_BIT               ; 64C1   0004 0114 02E6

        XORR    R4,     R3                      ; 64C4   01E3
        CLRR    R3                              ; 64C5   01DB
        MVII    #$01A2, R4                      ; 64C6   02BC 01A2
        MVO@    R3,     R4                      ; 64C8   0263
        MVO@    R3,     R4                      ; 64C9   0263
        MVI     G_016D, R0                      ; 64CA   0280 016D
        MVO@    R0,     R4                      ; 64CC   0260
        MVO@    R3,     R4                      ; 64CD   0263
        MVO@    R3,     R4                      ; 64CE   0263
        MVI     G_016E, R0                      ; 64CF   0280 016E
        MVO@    R0,     R4                      ; 64D1   0260
        MVO@    R3,     R4                      ; 64D2   0263
        MVO@    R3,     R4                      ; 64D3   0263
        MVO     R3,     G_0323                  ; 64D4   0243 0323
        MVII    #$000C, R0                      ; 64D6   02B8 000C

        JSR     R5,     X_CLR_BIT               ; 64D8   0004 0114 02E6

        SUB@    R3,     R5                      ; 64DB   031D
        INCR    R7                              ; 64DC   000F

L_64DD:
        PSHR    R5                              ; 64DD   0275
L_64DE:
        SLL     R3,     2                       ; 64DE   004F
        ADD     G_01AC, R7                      ; 64DF   02C7 01AC

        SAR     R3,     1                       ; 64E1   006B
        MVII    #$01A2, R2                      ; 64E2   02BA 01A2

        JSR     R5,     L_64F8                  ; 64E4   0004 0164 00F8

        PSHR    R0                              ; 64E7   0270
        MOVR    R4,     R2                      ; 64E8   00A2

        JSR     R5,     L_64F8                  ; 64E9   0004 0164 00F8

        PULR    R1                              ; 64EC   02B1
        MVI     G_01BA, R2                      ; 64ED   0282 01BA
        CMPI    #$000A, R2                      ; 64EF   037A 000A
        BNEQ    L_64F7                          ; 64F1   020C 0004

        MVII    #$031F, R5                      ; 64F3   02BD 031F
        MVO@    R1,     R5                      ; 64F5   0269
        MVO@    R0,     R5                      ; 64F6   0268
L_64F7:
        PULR    R7                              ; 64F7   02B7

L_64F8:
        PSHR    R5                              ; 64F8   0275
        PSHR    R2                              ; 64F9   0272
        MOVR    R2,     R4                      ; 64FA   0094
        MVI@    R4,     R0                      ; 64FB   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 64FC   0004 0114 0268

        MOVR    R3,     R1                      ; 64FF   0099

        JSR     R5,     X_MPY                   ; 6500   0004 011C 01DC

        MOVR    R2,     R0                      ; 6503   0090
        ADDI    #$0004, R0                      ; 6504   02F8 0004
        SAR     R0,     2                       ; 6506   006C
        SAR     R0,     1                       ; 6507   0068
        PULR    R2                              ; 6508   02B2
        SDBD                                    ; 6509   0001
        ADD@    R4,     R0                      ; 650A   02E0
        INCR    R2                              ; 650B   000A
        MOVR    R2,     R4                      ; 650C   0094
        MVO@    R0,     R4                      ; 650D   0260
        SWAP    R0,     1                       ; 650E   0040
        MVO@    R0,     R4                      ; 650F   0260
        SWAP    R0,     1                       ; 6510   0040
        PULR    R7                              ; 6511   02B7

L_6512:
        PSHR    R5                              ; 6512   0275
        MVI     G_01A4, R2                      ; 6513   0282 01A4
        MVI     G_01A7, R3                      ; 6515   0283 01A7

        JSR     R5,     L_6B4E                  ; 6517   0004 0168 034E

        MVO     R3,     G_01AA                  ; 651A   0243 01AA
        MOVR    R3,     R0                      ; 651C   0098

        JSR     R5,     L_55B5                  ; 651D   0004 0154 01B5
        JSR     R5,     L_558D                  ; 6520   0004 0154 018D

        MVI     G_01AB, R0                      ; 6523   0280 01AB
        AND     G_01AE, R0                      ; 6525   0380 01AE
        MVO     R0,     G_01AB                  ; 6527   0240 01AB
        COMR    R0                              ; 6529   0018
        AND     G_01AC, R0                      ; 652A   0380 01AC
        BEQ     L_653D                          ; 652C   0204 000F

        JSR     R5,     L_686E                  ; 652E   0004 0168 006E

        MVII    #$00B0, R0                      ; 6531   02B8 00B0
        MVO     R0,     G_0146                  ; 6533   0240 0146

        JSR     R5,     X_PLAY_MUS2             ; 6535   0004 0118 035D
        DECLE   $018F                           ; 6538  Note (short)
        DECLE   $00CD                           ; 6539  Note (short)
        DECLE   $015E                           ; 653A  Note (short)
        DECLE   $011F                           ; 653B  Note (short)
        DECLE   $0000                           ; 653C  End of music
L_653D:
        PULR    R7                              ; 653D   02B7

L_653E:
        PSHR    R5                              ; 653E   0275
        CLRR    R2                              ; 653F   01D2
        MVII    #$0166, R5                      ; 6540   02BD 0166
        SDBD                                    ; 6542   0001
        MVI@    R5,     R3                      ; 6543   02AB
        SDBD                                    ; 6544   0001
        MVII    #$53EB, R4                      ; 6545   02BC 00EB 0053
L_6548:
        MVI@    R4,     R1                      ; 6548   02A1
        CMPI    #$03FF, R1                      ; 6549   0379 03FF
        BEQ     L_6563                          ; 654B   0204 0016

        SLLC    R3,     1                       ; 654D   005B
        BNC     L_6548                          ; 654E   0229 0007

        SUBI    #$0200, R1                      ; 6550   0339 0200
        PSHR    R2                              ; 6552   0272

        JSR     R5,     L_694C                  ; 6553   0004 0168 014C

        PULR    R2                              ; 6556   02B2
        SWAP    R0,     1                       ; 6557   0040
        XORR    R1,     R0                      ; 6558   01C8
        SDBD                                    ; 6559   0001
        MVII    #$1010, R1                      ; 655A   02B9 0010 0010

        JSR     R5,     L_6564                  ; 655D   0004 0164 0164

        ADCR    R2                              ; 6560   002A
        B       L_6548                          ; 6561   0220 001A
L_6563:
        PULR    R7                              ; 6563   02B7

L_6564:
        PSHR    R5                              ; 6564   0275

        JSR     R5,     .EXEC.7C1               ; 6565   0004 0114 03C1

        MVI     G_01A4, R2                      ; 6568   0282 01A4
        MVI     G_01A7, R3                      ; 656A   0283 01A7
L_656C:
        MOVR    R1,     R4                      ; 656C   008C
        PSHR    R0                              ; 656D   0270
        J       .EXEC.6FC                       ; 656E   0004 0314 02FC

L_6571:
        PSHR    R5                              ; 6571   0275
        MOVR    R0,     R1                      ; 6572   0081

        JSR     R5,     L_694C                  ; 6573   0004 0168 014C

        MOVR    R0,     R2                      ; 6576   0082
        MOVR    R1,     R3                      ; 6577   008B
        SDBD                                    ; 6578   0001
        MVII    #$2414, R0                      ; 6579   02B8 0014 0024
        SDBD                                    ; 657C   0001
        MVII    #$2010, R1                      ; 657D   02B9 0010 0020
        B       L_656C                          ; 6580   0220 0015

L_6582:
        PSHR    R5                              ; 6582   0275
        SDBD                                    ; 6583   0001
        MVII    #$2414, R0                      ; 6584   02B8 0014 0024
        SDBD                                    ; 6587   0001
        MVII    #$2010, R1                      ; 6588   02B9 0010 0020

        JSR     R5,     L_6564                  ; 658B   0004 0164 0164

        CLRR    R0                              ; 658E   01C0
        ADCR    R0                              ; 658F   0028
        MVO     R0,     G_01AE                  ; 6590   0240 01AE
        AND     G_01BD, R0                      ; 6592   0380 01BD
        MVO     R0,     G_01AC                  ; 6594   0240 01AC
        PULR    R7                              ; 6596   02B7

L_6597:
        PSHR    R5                              ; 6597   0275
        MVI     G_034C, R0                      ; 6598   0280 034C
        SWAP    R0,     1                       ; 659A   0040
        ANDI    #$0070, R0                      ; 659B   03B8 0070
        SLR     R0,     2                       ; 659D   0064
        SLR     R0,     2                       ; 659E   0064
        ADDI    #$0004, R0                      ; 659F   02F8 0004
        MVI     G_01A1, R1                      ; 65A1   0281 01A1
        CMPI    #$00FF, R1                      ; 65A3   0379 00FF
        BEQ     L_65AC                          ; 65A5   0204 0005

        CMPI    #$00FE, R1                      ; 65A7   0379 00FE
        BEQ     L_665D                          ; 65A9   0204 00B2

        SLL     R0,     2                       ; 65AB   004C
L_65AC:
        MVI     G_01AD, R1                      ; 65AC   0281 01AD
        TSTR    R1                              ; 65AE   0089
        BNEQ    L_65BA                          ; 65AF   020C 0009

        SLL     R0,     2                       ; 65B1   004C
        SLL     R0,     1                       ; 65B2   0048
        MVI     G_01AE, R1                      ; 65B3   0281 01AE
        COMR    R1                              ; 65B5   0019
        AND     G_01BD, R1                      ; 65B6   0381 01BD
        BEQ     L_665D                          ; 65B8   0204 00A3

L_65BA:
        JSR     R5,     X_RAND2                 ; 65BA   0004 0114 029E

        TSTR    R0                              ; 65BD   0080
        BNEQ    L_665D                          ; 65BE   020C 009D

        MVII    #$0032, R0                      ; 65C0   02B8 0032

        JSR     R5,     X_RAND2                 ; 65C2   0004 0114 029E

        TSTR    R0                              ; 65C5   0080
        BNEQ    L_65CE                          ; 65C6   020C 0006

        MVII    #$0000, R0                      ; 65C8   02B8 0000

        JSR     R5,     X_CLR_BIT               ; 65CA   0004 0114 02E6

        CLRR    R4                              ; 65CD   01E4
L_65CE:
        MVI     G_01B9, R0                      ; 65CE   0280 01B9
        SLL     R0,     1                       ; 65D0   0048
        SLL     R0,     2                       ; 65D1   004C
        NEGR    R0                              ; 65D2   0020
        ADDI    #$0064, R0                      ; 65D3   02F8 0064
        BPL     L_65D8                          ; 65D5   0203 0001

        CLRR    R0                              ; 65D7   01C0

L_65D8:
        JSR     R5,     X_RAND2                 ; 65D8   0004 0114 029E

        TSTR    R0                              ; 65DB   0080
        BEQ     L_6661                          ; 65DC   0204 0083

        JSR     R5,     L_6489                  ; 65DE   0004 0164 0089

        BC      L_665E                          ; 65E1   0201 007B

        MVI     G_01BA, R1                      ; 65E3   0281 01BA
        CMPI    #$0001, R1                      ; 65E5   0379 0001
        BEQ     L_65F6                          ; 65E7   0204 000D

        CMPI    #$0003, R1                      ; 65E9   0379 0003
        BEQ     L_65F6                          ; 65EB   0204 0009

        MVI     G_017F, R0                      ; 65ED   0280 017F
        CMPI    #$00FF, R0                      ; 65EF   0378 00FF
        BEQ     L_665E                          ; 65F1   0204 006B

        SLR     R0,     1                       ; 65F3   0060
        BEQ     L_665E                          ; 65F4   0204 0068

L_65F6:
        MVI     G_01BA, R0                      ; 65F6   0280 01BA
        MVII    #$01AF, R1                      ; 65F8   02B9 01AF

        JSR     R5,     L_6C09                  ; 65FA   0004 016C 0009

        TSTR    R1                              ; 65FD   0089
        BEQ     L_665D                          ; 65FE   0204 005D

        MOVR    R1,     R2                      ; 6600   008A
        SDBD                                    ; 6601   0001
        MVII    #$5600, R1                      ; 6602   02B9 0000 0056

        JSR     R5,     L_699B                  ; 6605   0004 0168 019B

        MOVR    R2,     R1                      ; 6608   0091
        MVI@    R1,     R2                      ; 6609   028A

        JSR     R5,     L_6C70                  ; 660A   0004 016C 0070

        BNC     L_6613                          ; 660D   0209 0004

        SDBD                                    ; 660F   0001
        XORI    #$2080, R2                      ; 6610   03FA 0080 0020
L_6613:
        XORR    R2,     R0                      ; 6613   01D0
        MVO@    R0,     R1                      ; 6614   0248
        MVII    #$0067, R0                      ; 6615   02B8 0067

        JSR     R5,     X_RAND2                 ; 6617   0004 0114 029E

        MOVR    R0,     R3                      ; 661A   0083
        MVII    #$00A7, R0                      ; 661B   02B8 00A7

        JSR     R5,     X_RAND2                 ; 661D   0004 0114 029E

        MOVR    R0,     R2                      ; 6620   0082
        MVI     G_01BA, R0                      ; 6621   0280 01BA
        CMPI    #$0001, R0                      ; 6623   0378 0001
        BEQ     L_664C                          ; 6625   0204 0025

        CMPI    #$0002, R0                      ; 6627   0378 0002
        BEQ     L_664C                          ; 6629   0204 0021

        MOVR    R1,     R4                      ; 662B   008C
        ADDI    #$0002, R4                      ; 662C   02FC 0002
        SWAP    R2,     1                       ; 662E   0042
        MVO@    R2,     R4                      ; 662F   0262
        SWAP    R3,     1                       ; 6630   0043
        MVO@    R3,     R4                      ; 6631   0263
        TSTR    R0                              ; 6632   0080
        BEQ     L_6648                          ; 6633   0204 0013

        JSR     R5,     L_66E3                  ; 6635   0004 0164 02E3

        SLL     R3,     1                       ; 6638   004B
        CMPI    #$0003, R0                      ; 6639   0378 0003
        BEQ     L_663E                          ; 663B   0204 0001

        SWAP    R3,     1                       ; 663D   0043
L_663E:
        CMPI    #$0007, R0                      ; 663E   0378 0007
        BNEQ    L_6643                          ; 6640   020C 0001

        NEGR    R3                              ; 6642   0023
L_6643:
        SUBI    #$0000, R4                      ; 6643   033C 0000
        MVO@    R3,     R4                      ; 6645   0263
        B       L_6690                          ; 6646   0200 0048

L_6648:
        MVII    #$0053, R2                      ; 6648   02BA 0053
        MVII    #$0033, R3                      ; 664A   02BB 0033
L_664C:
        SWAP    R2,     1                       ; 664C   0042
        XORR    R3,     R2                      ; 664D   01DA

        JSR     R5,     L_66E3                  ; 664E   0004 0164 02E3
        JSR     R5,     .EXEC.9A3               ; 6651   0004 0118 01A3

        ADDI    #$0006, R1                      ; 6654   02F9 0006
        MVII    #$000C, R0                      ; 6656   02B8 000C

        JSR     R5,     X_RAND2                 ; 6658   0004 0114 029E

        INCR    R0                              ; 665B   0008
        MVO@    R0,     R1                      ; 665C   0248
L_665D:
        PULR    R7                              ; 665D   02B7
L_665E:
        J       L_6A7E                          ; 665E   0004 0368 027E

L_6661:
        JSR     R5,     L_6AAD                  ; 6661   0004 0168 02AD

        MVII    #$0002, R0                      ; 6664   02B8 0002

        JSR     R5,     X_RAND1                 ; 6666   0004 0114 027D

        ADDI    #$0002, R0                      ; 6669   02F8 0002

        JSR     R5,     L_570E                  ; 666B   0004 0154 030E

        MVI     G_01B0, R0                      ; 666E   0280 01B0
        SLR     R0,     1                       ; 6670   0060
        ADDI    #$000A, R0                      ; 6671   02F8 000A
        MVO     R0,     G_01B1                  ; 6673   0240 01B1
        PULR    R7                              ; 6675   02B7

        PSHR    R5                              ; 6676   0275

L_6677:
        JSR     R5,     .EXEC.766               ; 6677   0004 0114 0366
        JSR     R5,     X_POW2                  ; 667A   0004 0114 0345

        COMR    R0                              ; 667D   0018
        AND     G_01AF, R0                      ; 667E   0380 01AF
        MVO     R0,     G_01AF                  ; 6680   0240 01AF
        CLRR    R0                              ; 6682   01C0
        INCR    R1                              ; 6683   0009
        MVO@    R0,     R1                      ; 6684   0248
        DECR    R1                              ; 6685   0011
        PULR    R7                              ; 6686   02B7

L_6687:
        MVI@    R1,     R0                      ; 6687   0288
        ANDI    #$0008, R0                      ; 6688   03B8 0008
        BEQ     L_6677                          ; 668A   0224 0014
        J       L_5237                          ; 668C   0004 0350 0237

        PSHR    R5                              ; 668F   0275
L_6690:
        MVII    #$0010, R3                      ; 6690   02BB 0010
        SWAP    R3,     1                       ; 6692   0043
        MOVR    R1,     R2                      ; 6693   008A
        ADDI    #$0005, R2                      ; 6694   02FA 0005
        MVI@    R2,     R0                      ; 6696   0290
        TSTR    R0                              ; 6697   0080
        BMI     L_66BE                          ; 6698   020B 0024
        BNEQ    L_66A9                          ; 669A   020C 000D

        MVI@    R1,     R4                      ; 669C   028C
        XORR    R3,     R4                      ; 669D   01DC
        MVO@    R4,     R1                      ; 669E   024C

        JSR     R5,     L_6A7A                  ; 669F   0004 0168 027A

        MVI     G_01BA, R4                      ; 66A2   0284 01BA
        TSTR    R4                              ; 66A4   00A4
        BNEQ    L_66A9                          ; 66A5   020C 0002

        MVII    #$0006, R0                      ; 66A7   02B8 0006
L_66A9:
        INCR    R0                              ; 66A9   0008
        CMPI    #$0006, R0                      ; 66AA   0378 0006
        BLE     L_66D9                          ; 66AC   0206 002B

        SLL     R3,     2                       ; 66AE   004F
        SLL     R3,     1                       ; 66AF   004B
        SUBI    #$0002, R0                      ; 66B0   0338 0002
        XORR    R3,     R0                      ; 66B2   01D8
        MVI@    R1,     R3                      ; 66B3   028B
        ANDI    #$0008, R3                      ; 66B4   03BB 0008
        BEQ     L_66D9                          ; 66B6   0204 0021

        MVI@    R1,     R3                      ; 66B8   028B
        XORI    #$0010, R3                      ; 66B9   03FB 0010
        MVO@    R3,     R1                      ; 66BB   024B
        B       L_66D9                          ; 66BC   0200 001B

L_66BE:
        RLC     R0,     1                       ; 66BE   0050
        BEQ     L_6687                          ; 66BF   0224 0039

        RRC     R0,     1                       ; 66C1   0070
        DECR    R0                              ; 66C2   0010
        MVI     G_01BA, R3                      ; 66C3   0283 01BA
        TSTR    R3                              ; 66C5   009B
        BNEQ    L_66D9                          ; 66C6   020C 0011

        PSHR    R2                              ; 66C8   0272
        PSHR    R0                              ; 66C9   0270
        SDBD                                    ; 66CA   0001
        MVII    #$5333, R2                      ; 66CB   02BA 0033 0053
        SDBD                                    ; 66CE   0001
        MVII    #$0C10, R4                      ; 66CF   02BC 0010 000C

        JSR     R5,     .EXEC.6F7               ; 66D2   0004 0114 02F7

        PULR    R0                              ; 66D5   02B0
        PULR    R2                              ; 66D6   02B2
        BC      L_6677                          ; 66D7   0221 0061

L_66D9:
        MVO@    R0,     R2                      ; 66D9   0250
        INCR    R2                              ; 66DA   000A
        MVII    #$0003, R4                      ; 66DB   02BC 0003
        TSTR    R0                              ; 66DD   0080
        BMI     L_66E1                          ; 66DE   020B 0001

        DECR    R4                              ; 66E0   0014
L_66E1:
        MVO@    R4,     R2                      ; 66E1   0254
        PULR    R7                              ; 66E2   02B7

L_66E3:
        PSHR    R5                              ; 66E3   0275
        MVI     G_0344, R3                      ; 66E4   0283 0344
        SWAP    R3,     1                       ; 66E6   0043
        ANDI    #$00FF, R3                      ; 66E7   03BB 00FF
        SLR     R3,     2                       ; 66E9   0067
        INCR    R3                              ; 66EA   000B
        MVI@    R1,     R5                      ; 66EB   028D
        ANDI    #$0080, R5                      ; 66EC   03BD 0080
        BEQ     L_66F4                          ; 66EE   0204 0004

        SLL     R3,     1                       ; 66F0   004B
        TSTR    R0                              ; 66F1   0080
        BEQ     L_6677                          ; 66F2   0224 007C
L_66F4:
        PULR    R7                              ; 66F4   02B7

L_66F5:
        PSHR    R5                              ; 66F5   0275
        MVI     G_0344, R0                      ; 66F6   0280 0344
        TSTR    R0                              ; 66F8   0080
        BEQ     L_671A                          ; 66F9   0204 001F

        SUBI    #$0002, R4                      ; 66FB   033C 0002
        SWAP    R3,     1                       ; 66FD   0043
        SLL     R3,     2                       ; 66FE   004F

        JSR     R5,     L_6489                  ; 66FF   0004 0164 0089

        ADCR    R7                              ; 6702   002F

        SLR     R3,     2                       ; 6703   0067
L_6704:
        MVO@    R3,     R4                      ; 6704   0263
        MVI     G_01B0, R0                      ; 6705   0280 01B0
        SLR     R0,     2                       ; 6707   0064
        SLR     R0,     2                       ; 6708   0064
        ADDI    #$0002, R0                      ; 6709   02F8 0002
        PSHR    R0                              ; 670B   0270

        JSR     R5,     L_69E8                  ; 670C   0004 0168 01E8

        MOVR    R0,     R1                      ; 670F   0081
        PULR    R0                              ; 6710   02B0

        JSR     R5,     L_69E8                  ; 6711   0004 0168 01E8
        JSR     R5,     L_67EC                  ; 6714   0004 0164 03EC
        JSR     R5,     L_6DA2                  ; 6717   0004 016C 01A2

L_671A:
        PULR    R7                              ; 671A   02B7

L_671B:
        PSHR    R5                              ; 671B   0275
        MVI     G_01B1, R0                      ; 671C   0280 01B1
        MOVR    R0,     R1                      ; 671E   0081
        BEQ     L_673D                          ; 671F   0204 001C

        JSR     R5,     X_RAND2                 ; 6721   0004 0114 029E

        MVI     G_01BA, R2                      ; 6724   0282 01BA
        DECR    R1                              ; 6726   0011
        MVO     R1,     G_01B1                  ; 6727   0241 01B1
        BEQ     L_673E                          ; 6729   0204 0013

        MOVR    R0,     R2                      ; 672B   0082
        MVI     G_035E, R3                      ; 672C   0283 035E
        ANDI    #$0001, R3                      ; 672E   03BB 0001
        SDBD                                    ; 6730   0001
        MVII    #$674B, R0                      ; 6731   02B8 004B 0067

        JSR     R5,     L_6B89                  ; 6734   0004 0168 0389

L_6737:
        EIS                                     ; 6737   0002
        MVI     G_01BE, R0                      ; 6738   0280 01BE
        TSTR    R0                              ; 673A   0080
        BNEQ    L_6737                          ; 673B   022C 0005
L_673D:
        PULR    R7                              ; 673D   02B7

L_673E:
        CMPI    #$0003, R2                      ; 673E   037A 0003
        BEQ     L_673D                          ; 6740   0224 0004

        MVII    #$0001, R0                      ; 6742   02B8 0001

        JSR     R5,     X_CLR_BIT               ; 6744   0004 0114 02E6

        CLRR    R4                              ; 6747   01E4
        J       L_6B9D                          ; 6748   0004 0368 039D

        DIS                                     ; 674B   0003
        PSHR    R5                              ; 674C   0275

        JSR     R5,     L_6B95                  ; 674D   0004 0168 0395

        MVII    #$0030, R1                      ; 6750   02B9 0030
        ADDR    R3,     R1                      ; 6752   00D9
        MVO@    R2,     R1                      ; 6753   024A
        PULR    R5                              ; 6754   02B5
        EIS                                     ; 6755   0002
        MVII    #$0100, R4                      ; 6756   02BC 0100
        SDBD                                    ; 6758   0001
        MVI@    R4,     R7                      ; 6759   02A7

        PSHR    R5                              ; 675A   0275
        MOVR    R7,     R0                      ; 675B   00B8
        ADDI    #$0017, R0                      ; 675C   02F8 0017

        JSR     R5,     L_5943                  ; 675E   0004 0158 0143

        MVII    #$0002, R0                      ; 6761   02B8 0002
        SDBD                                    ; 6763   0001
        MVII    #$5649, R1                      ; 6764   02B9 0049 0056
        MVII    #$031D, R2                      ; 6767   02BA 031D

        JSR     R5,     L_69A6                  ; 6769   0004 0168 01A6

        MOVR    R5,     R1                      ; 676C   00A9
        MVII    #$0355, R2                      ; 676D   02BA 0355

        JSR     R5,     L_699B                  ; 676F   0004 0168 019B

        PULR    R7                              ; 6772   02B7

        MOVR    R7,     R5                      ; 6773   00BD
        SLR     R3,     2                       ; 6774   0067
        ADDR    R3,     R0                      ; 6775   00D8
        SAR     R0,     1                       ; 6776   0068
        ADDR    R1,     R6                      ; 6777   00CE
        SLLC    R0,     1                       ; 6778   0058
        SARC    R1,     2                       ; 6779   007D
        SLR     R3,     2                       ; 677A   0067
        MOVR    R1,     R7                      ; 677B   008F

        SLR     R3,     2                       ; 677C   0067
        MVI     G_01B7, R2                      ; 677D   0282 01B7
        DECR    R2                              ; 677F   0012
        BNEQ    L_678C                          ; 6780   020C 000A

        MVO     R2,     G_01B7                  ; 6782   0242 01B7
        MVO     R2,     G_0163                  ; 6784   0242 0163
        MVO     R2,     G_015E                  ; 6786   0242 015E
        MVO     R2,     G_015F                  ; 6788   0242 015F
        MVO     R2,     G_01B0                  ; 678A   0242 01B0
L_678C:
        MVII    #$0001, R1                      ; 678C   02B9 0001
        ADDR    R1,     R7                      ; 678E   00CF

        CLRR    R1                              ; 678F   01C9
        PSHR    R5                              ; 6790   0275
        MVI     G_0334, R2                      ; 6791   0282 0334
        TSTR    R2                              ; 6793   0092
        BEQ     L_67BC                          ; 6794   0204 0026

        INCR    R0                              ; 6796   0008
        BEQ     L_67BC                          ; 6797   0204 0023

        XORI    #$0003, R0                      ; 6799   03F8 0003
        ADDR    R1,     R7                      ; 679B   00CF

        NEGR    R0                              ; 679C   0020
        ADD     G_01B2, R0                      ; 679D   02C0 01B2
        BMI     L_67BC                          ; 679F   020B 001B

        JSR     R5,     X_CLAMP                 ; 67A1   0004 0114 0270
        DECLE   $0000                           ; 67A4   0000

        ADDR    R7,     R2                      ; 67A5   00FA
        MVII    #$003C, R1                      ; 67A6   02B9 003C
        CMPR    R1,     R0                      ; 67A8   0148
        BGE     L_67B1                          ; 67A9   020D 0006

        SLR     R1,     1                       ; 67AB   0061
        CMPR    R1,     R0                      ; 67AC   0148
        CLRR    R0                              ; 67AD   01C0
        ADCR    R7                              ; 67AE   002F

        MOVR    R1,     R0                      ; 67AF   0088
L_67B0:
        SLL     R0,     1                       ; 67B0   0048
L_67B1:
        MVO     R0,     G_01B2                  ; 67B1   0240 01B2
        MVI     G_01BA, R0                      ; 67B3   0280 01BA
        CMPI    #$0004, R0                      ; 67B5   0378 0004
        BNEQ    L_67BC                          ; 67B7   020C 0003

        JSR     R5,     L_590A                  ; 67B9   0004 0158 010A

L_67BC:
        PULR    R7                              ; 67BC   02B7

        PSHR    R5                              ; 67BD   0275
        TSTR    R0                              ; 67BE   0080
        BMI     L_67D6                          ; 67BF   020B 0015

        PSHR    R0                              ; 67C1   0270
        MOVR    R0,     R1                      ; 67C2   0081

        JSR     R5,     L_67D7                  ; 67C3   0004 0164 03D7

        NEGR    R0                              ; 67C6   0020
        SAR     R0,     1                       ; 67C7   0068
        MOVR    R0,     R4                      ; 67C8   0084
        PULR    R1                              ; 67C9   02B1
        ADDI    #$0004, R1                      ; 67CA   02F9 0004

        JSR     R5,     L_67D7                  ; 67CC   0004 0164 03D7

        MOVR    R4,     R1                      ; 67CF   00A1

        JSR     R5,     L_67EC                  ; 67D0   0004 0164 03EC
        JSR     R5,     L_6DA2                  ; 67D3   0004 016C 01A2

L_67D6:
        PULR    R7                              ; 67D6   02B7

L_67D7:
        MOVR    R1,     R2                      ; 67D7   008A
        ANDI    #$0007, R1                      ; 67D8   03B9 0007
        ADDR    R7,     R1                      ; 67DA   00F9
        ADDI    #$0009, R1                      ; 67DB   02F9 0009
        MVI@    R1,     R0                      ; 67DD   0288
        ANDI    #$0008, R2                      ; 67DE   03BA 0008
        BEQ     L_67E3                          ; 67E0   0204 0001

        NEGR    R0                              ; 67E2   0020
L_67E3:
        MOVR    R5,     R7                      ; 67E3   00AF

        DECLE   $0000,  $0001,  $0002,  $0004   ; 67E4   0000 0001 0002 0004
        DECLE   $0004,  $0004,  $0002,  $0001   ; 67E8   0004 0004 0002 0001
L_67EC:
        PSHR    R5                              ; 67EC   0275
        MVII    #$01C0, R5                      ; 67ED   02BD 01C0
        SDBD                                    ; 67EF   0001
        ADD@    R5,     R0                      ; 67F0   02E8
        ADDI    #$00A0, R0                      ; 67F1   02F8 00A0

        JSR     R5,     X_CLAMP                 ; 67F3   0004 0114 0270
        DECLE   $0000                           ; 67F6   0000

        CMPR    R0,     R0                      ; 67F7   0140
        SUBI    #$00A0, R0                      ; 67F8   0338 00A0
        MVO     R0,     G_01C0                  ; 67FA   0240 01C0
        SWAP    R0,     1                       ; 67FC   0040
        MVO     R0,     G_01C1                  ; 67FD   0240 01C1
        MOVR    R1,     R0                      ; 67FF   0088
        ADD     G_01C2, R0                      ; 6800   02C0 01C2

        JSR     R5,     X_CLAMP                 ; 6802   0004 0114 0270
        DECLE   $0000,  $00FF                   ; 6805   0000 00FF

        MVO     R0,     G_01C2                  ; 6807   0240 01C2
        SUBI    #$0080, R0                      ; 6809   0338 0080
        SAR     R0,     2                       ; 680B   006C
        MVO     R0,     G_01B3                  ; 680C   0240 01B3
        PULR    R7                              ; 680E   02B7

L_680F:
        PSHR    R5                              ; 680F   0275
        MVI     G_01BA, R0                      ; 6810   0280 01BA
        DECR    R0                              ; 6812   0010
        BNEQ    L_6834                          ; 6813   020C 001F

        MVI     G_0344, R1                      ; 6815   0281 0344
        SDBD                                    ; 6817   0001
        ADDI    #$1700, R1                      ; 6818   02F9 0000 0017
        MVO     R1,     G_0327                  ; 681B   0241 0327
        MVI     G_01B3, R0                      ; 681D   0280 01B3

        JSR     R5,     X_EXT_SIGN_LO           ; 681F   0004 0114 0268

        ADDI    #$0038, R0                      ; 6822   02F8 0038
        SWAP    R0,     1                       ; 6824   0040
        MVO     R0,     G_0320                  ; 6825   0240 0320
        MVI     G_034C, R0                      ; 6827   0280 034C
        SLR     R0,     2                       ; 6829   0064
        PSHR    R0                              ; 682A   0270
        SLL     R0,     1                       ; 682B   0048
        ADD@    R6,     R0                      ; 682C   02F0
        NEGR    R0                              ; 682D   0020
        SDBD                                    ; 682E   0001
        ADDI    #$6000, R0                      ; 682F   02F8 0000 0060
        MVO     R0,     G_0358                  ; 6832   0240 0358
L_6834:
        PULR    R7                              ; 6834   02B7

.START:
        PSHR    R5                              ; 6835   0275
        MVII    #$0090, R0                      ; 6836   02B8 0090
        MVO     R0,     G_01C2                  ; 6838   0240 01C2
        MVO     R0,     G_0334                  ; 683A   0240 0334
        MVII    #$0164, R4                      ; 683C   02BC 0164
        CLRR    R3                              ; 683E   01DB
L_683F:
        MVII    #$0008, R0                      ; 683F   02B8 0008

        JSR     R5,     X_RAND1                 ; 6841   0004 0114 027D

        MVO@    R0,     R4                      ; 6844   0260
        INCR    R3                              ; 6845   000B
        CMPI    #$0007, R3                      ; 6846   037B 0007
        BLE     L_683F                          ; 6848   0226 000A

        MVII    #$000A, R0                      ; 684A   02B8 000A
        MVO     R0,     G_0103                  ; 684C   0240 0103
        COMR    R0                              ; 684E   0018
        MVO     R0,     G_016C                  ; 684F   0240 016C
        B       L_6877                          ; 6851   0200 0024

L_6853:
        MVII    #$0004, R0                      ; 6853   02B8 0004
        CLRR    R1                              ; 6855   01C9
        DECR    R0                              ; 6856   0010
        BNEQ    L_685E                          ; 6857   020C 0005

        INCR    R1                              ; 6859   0009
        MVII    #$00C8, R0                      ; 685A   02B8 00C8
        B       L_686A                          ; 685C   0200 000C
L_685E:
        BMI     L_6853                          ; 685E   022B 000C

        CMPI    #$0005, R0                      ; 6860   0378 0005
        BGT     L_6853                          ; 6862   022E 0010

        SLL     R0,     1                       ; 6864   0048
        MVO     R0,     G_01B9                  ; 6865   0240 01B9
        SUBI    #$000C, R0                      ; 6867   0338 000C
        NEGR    R0                              ; 6869   0020
L_686A:
        MVO     R1,     G_01B8                  ; 686A   0241 01B8
        MVO     R0,     G_017E                  ; 686C   0240 017E
L_686E:
        PSHR    R5                              ; 686E   0275
        MVII    #$002E, R0                      ; 686F   02B8 002E
        MVO     R0,     G_016C                  ; 6871   0240 016C
        MVII    #$0001, R0                      ; 6873   02B8 0001
        MVO     R0,     G_01B6                  ; 6875   0240 01B6
L_6877:
        MVII    #$0179, R5                      ; 6877   02BD 0179
        MVII    #$004B, R0                      ; 6879   02B8 004B
        MVO@    R0,     R5                      ; 687B   0268
        MVO@    R0,     R5                      ; 687C   0268
        MVII    #$004B, R0                      ; 687D   02B8 004B
        MVO@    R0,     R5                      ; 687F   0268
        MVO@    R0,     R5                      ; 6880   0268
        CLRR    R0                              ; 6881   01C0
        MVO     R0,     G_0177                  ; 6882   0240 0177
        MVO     R0,     G_01B2                  ; 6884   0240 01B2
        MVO     R0,     G_016D                  ; 6886   0240 016D
        MVO     R0,     G_016E                  ; 6888   0240 016E
        MVO     R0,     G_0344                  ; 688A   0240 0344
        MVO     R0,     G_034C                  ; 688C   0240 034C
        INCR    R0                              ; 688E   0008
        MVO     R0,     G_01B7                  ; 688F   0240 01B7
        MVO     R0,     G_01AB                  ; 6891   0240 01AB
        ADD     G_01B9, R0                      ; 6893   02C0 01B9
        MVO     R0,     G_01B9                  ; 6895   0240 01B9
        MVI     G_017E, R0                      ; 6897   0280 017E

        JSR     R5,     L_58DF                  ; 6899   0004 0158 00DF
        JSR     R5,     L_68B6                  ; 689C   0004 0168 00B6

        MVII    #$0038, R0                      ; 689F   02B8 0038
        MVO     R0,     G_01A4                  ; 68A1   0240 01A4
        MVII    #$0018, R0                      ; 68A3   02B8 0018
        MVO     R0,     G_01A7                  ; 68A5   0240 01A7
        MVII    #$015E, R4                      ; 68A7   02BC 015E
        SDBD                                    ; 68A9   0001
        MVI@    R4,     R0                      ; 68AA   02A0

        JSR     R5,     L_5701                  ; 68AB   0004 0154 0301

        MVII    #$00FF, R0                      ; 68AE   02B8 00FF
        MVO     R0,     G_01A1                  ; 68B0   0240 01A1
        MVII    #$000A, R0                      ; 68B2   02B8 000A
        B       L_68DD                          ; 68B4   0200 0027

L_68B6:
        PSHR    R5                              ; 68B6   0275
        MVII    #$0164, R4                      ; 68B7   02BC 0164
L_68B9:
        CMPI    #$016A, R4                      ; 68B9   037C 016A
        BGT     L_68D7                          ; 68BB   020E 001A

        SDBD                                    ; 68BD   0001
        MVI@    R4,     R2                      ; 68BE   02A2
        COMR    R2                              ; 68BF   001A
        BEQ     L_68B9                          ; 68C0   0224 0008

        COMR    R2                              ; 68C2   001A
L_68C3:
        MVII    #$0004, R0                      ; 68C3   02B8 0004

        JSR     R5,     X_RAND1                 ; 68C5   0004 0114 027D
        JSR     R5,     X_POW2                  ; 68C8   0004 0114 0345

        MOVR    R0,     R1                      ; 68CB   0081
        ANDR    R2,     R0                      ; 68CC   0190
        BNEQ    L_68C3                          ; 68CD   022C 000B

        XORR    R2,     R1                      ; 68CF   01D1
        SUBI    #$0002, R4                      ; 68D0   033C 0002
        MVO@    R1,     R4                      ; 68D2   0261
        SWAP    R1,     1                       ; 68D3   0041
        MVO@    R1,     R4                      ; 68D4   0261
        B       L_68B9                          ; 68D5   0220 001D
L_68D7:
        PULR    R7                              ; 68D7   02B7

L_68D8:
        PSHR    R5                              ; 68D8   0275
        CMP     G_01BA, R0                      ; 68D9   0340 01BA
        BEQ     L_6941                          ; 68DB   0204 0064

L_68DD:
        CMPI    #$0008, R0                      ; 68DD   0378 0008
        BEQ     L_6941                          ; 68DF   0204 0060

        CMPI    #$0005, R0                      ; 68E1   0378 0005
        BEQ     L_6941                          ; 68E3   0204 005C

        MVI     G_01A1, R1                      ; 68E5   0281 01A1
        CMPI    #$00FE, R1                      ; 68E7   0379 00FE
        BNEQ    L_68EE                          ; 68E9   020C 0003

        INCR    R1                              ; 68EB   0009
        MVO     R1,     G_01A1                  ; 68EC   0241 01A1
L_68EE:
        MVO     R0,     G_01BA                  ; 68EE   0240 01BA
        PSHR    R0                              ; 68F0   0270
        MOVR    R0,     R1                      ; 68F1   0081

        JSR     R5,     L_6137                  ; 68F2   0004 0160 0137

        MVO     R0,     G_017F                  ; 68F5   0240 017F
        MVI     G_0173, R4                      ; 68F7   0284 0173
        MVI     G_0174, R0                      ; 68F9   0280 0174
        NEGR    R0                              ; 68FB   0020
        ADDI    #$000F, R0                      ; 68FC   02F8 000F
        TSTR    R4                              ; 68FE   00A4
        BEQ     L_6911                          ; 68FF   0204 0010

        ADDI    #$0100, R4                      ; 6901   02FC 0100

        JSR     R5,     X_POW2                  ; 6903   0004 0114 0345

        COMR    R0                              ; 6906   0018
        SDBD                                    ; 6907   0001
        AND@    R4,     R0                      ; 6908   03A0
        SUBI    #$0002, R4                      ; 6909   033C 0002
        MVO@    R0,     R4                      ; 690B   0260
        SWAP    R0,     1                       ; 690C   0040
        MVO@    R0,     R4                      ; 690D   0260
        CLRR    R0                              ; 690E   01C0
        MVO     R0,     G_0173                  ; 690F   0240 0173

L_6911:
        JSR     R5,     .EXEC.7B3               ; 6911   0004 0114 03B3

        PULR    R0                              ; 6914   02B0
        MVII    #$000E, R2                      ; 6915   02BA 000E
        MVO     R2,     G_0115                  ; 6917   0242 0115
        MVO     R2,     G_01C3                  ; 6919   0242 01C3

        JSR     R5,     L_6B9C                  ; 691B   0004 0168 039C
        JSR     R5,     L_6942                  ; 691E   0004 0168 0142

        MVI     G_01BA, R4                      ; 6921   0284 01BA
        PULR    R5                              ; 6923   02B5
        INCR    R4                              ; 6924   000C
        ADDR    R4,     R4                      ; 6925   00E4
        ADDR    R7,     R4                      ; 6926   00FC
        SDBD                                    ; 6927   0001
        MVI@    R4,     R7                      ; 6928   02A7

        SLR     R3,     2                       ; 6929   0067
        SLLC    R1,     1                       ; 692A   0059
        SLLC    R2,     1                       ; 692B   005A
        SLR     R3,     2                       ; 692C   0067
        SLR     R3,     2                       ; 692D   0067
        SLLC    R1,     1                       ; 692E   0059
        SLLC    R1,     2                       ; 692F   005D
        RLC     R0,     1                       ; 6930   0050
        RLC     R2,     1                       ; 6931   0052
        SLLC    R0,     1                       ; 6932   0058
        MOVR    R4,     R5                      ; 6933   00A5
        RLC     R0,     2                       ; 6934   0054
        NEGR    R2                              ; 6935   0022
        RLC     R1,     2                       ; 6936   0055
        SLR     R3,     2                       ; 6937   0067
        SLLC    R1,     1                       ; 6938   0059
        MOVR    R4,     R5                      ; 6939   00A5
        RLC     R0,     2                       ; 693A   0054
        SLR     R3,     2                       ; 693B   0067
        SLLC    R1,     1                       ; 693C   0059
        ADDR    R4,     R7                      ; 693D   00E7

        RLC     R2,     1                       ; 693E   0052
        MOVR    R4,     R5                      ; 693F   00A5
        RLC     R0,     2                       ; 6940   0054
L_6941:
        PULR    R7                              ; 6941   02B7

L_6942:
        CLRR    R1                              ; 6942   01C9
L_6943:
        PSHR    R5                              ; 6943   0275
        MVII    #$0200, R4                      ; 6944   02BC 0200
        MVII    #$00F0, R0                      ; 6946   02B8 00F0

        JSR     R5,     X_FILL_MEM              ; 6948   0004 0114 0341

        PULR    R7                              ; 694B   02B7

L_694C:
        PSHR    R5                              ; 694C   0275
        MVII    #$0014, R2                      ; 694D   02BA 0014

        JSR     R5,     X_DIV                   ; 694F   0004 011C 01FB

        INCR    R0                              ; 6952   0008
        SLL     R0,     2                       ; 6953   004C
        SLL     R0,     1                       ; 6954   0048
        INCR    R1                              ; 6955   0009
        SLL     R1,     2                       ; 6956   004D
        SLL     R1,     1                       ; 6957   0049
        PSHR    R0                              ; 6958   0270
        MOVR    R1,     R0                      ; 6959   0088
        PULR    R1                              ; 695A   02B1
        PULR    R7                              ; 695B   02B7

L_695C:
        PSHR    R5                              ; 695C   0275
        MVI     G_035D, R4                      ; 695D   0284 035D
        SDBD                                    ; 695F   0001
        MVI@    R4,     R3                      ; 6960   02A3
        TSTR    R3                              ; 6961   009B
        BEQ     L_697B                          ; 6962   0204 0017

        INCR    R3                              ; 6964   000B
        CLRR    R1                              ; 6965   01C9
        MVI     G_011F, R0                      ; 6966   0280 011F
        MOVR    R0,     R2                      ; 6968   0082
        ANDI    #$003F, R0                      ; 6969   03B8 003F
        ANDI    #$00C0, R2                      ; 696B   03BA 00C0
        BNEQ    L_6970                          ; 696D   020C 0001
        MOVR    R3,     R7                      ; 696F   009F

L_6970:
        INCR    R1                              ; 6970   0009
        MVI     G_0120, R0                      ; 6971   0280 0120
        MOVR    R0,     R2                      ; 6973   0082
        ANDI    #$003F, R0                      ; 6974   03B8 003F
        ANDI    #$00C0, R2                      ; 6976   03BA 00C0
        BNEQ    L_697B                          ; 6978   020C 0001
        MOVR    R3,     R7                      ; 697A   009F
L_697B:
        PULR    R7                              ; 697B   02B7

L_697C:
        PSHR    R5                              ; 697C   0275

L_697D:
        JSR     R5,     .EXEC.7C1               ; 697D   0004 0114 03C1

        MOVR    R1,     R4                      ; 6980   008C
        MOVR    R2,     R5                      ; 6981   0095
        MVI@    R4,     R3                      ; 6982   02A3
        MVII    #$00F3, R2                      ; 6983   02BA 00F3
L_6985:
        SARC    R3,     1                       ; 6985   007B
        BC      L_698C                          ; 6986   0201 0004

        SARC    R2,     1                       ; 6988   007A
        INCR    R5                              ; 6989   000D
        B       L_6996                          ; 698A   0200 000A

L_698C:
        SARC    R2,     1                       ; 698C   007A
        BNC     L_6993                          ; 698D   0209 0004

        SDBD                                    ; 698F   0001
        MVI@    R4,     R0                      ; 6990   02A0
        B       L_6995                          ; 6991   0200 0002

L_6993:
        MVI@    R4,     R0                      ; 6993   02A0
        SWAP    R0,     1                       ; 6994   0040
L_6995:
        MVO@    R0,     R5                      ; 6995   0268
L_6996:
        TSTR    R3                              ; 6996   009B
        BNEQ    L_6985                          ; 6997   022C 0013

        MOVR    R4,     R5                      ; 6999   00A5
        PULR    R7                              ; 699A   02B7

L_699B:
        PSHR    R5                              ; 699B   0275
        PSHR    R4                              ; 699C   0274
        MOVR    R2,     R4                      ; 699D   0094
        MVII    #$0007, R0                      ; 699E   02B8 0007

        JSR     R5,     X_FILL_ZERO             ; 69A0   0004 0114 0338

        PULR    R4                              ; 69A3   02B4
        B       L_697D                          ; 69A4   0220 0028

L_69A6:
        PSHR    R5                              ; 69A6   0275
L_69A7:
        PSHR    R0                              ; 69A7   0270

        JSR     R5,     L_699B                  ; 69A8   0004 0168 019B

        MOVR    R5,     R1                      ; 69AB   00A9
        ADDI    #$0008, R2                      ; 69AC   02FA 0008
        PULR    R0                              ; 69AE   02B0
        DECR    R0                              ; 69AF   0010
        BNEQ    L_69A7                          ; 69B0   022C 000A
        PULR    R7                              ; 69B2   02B7

L_69B3:
        PSHR    R5                              ; 69B3   0275
        MOVR    R1,     R5                      ; 69B4   008D
L_69B5:
        MVI@    R5,     R3                      ; 69B5   02AB
        CMPI    #$03FF, R3                      ; 69B6   037B 03FF
        BEQ     L_69C1                          ; 69B8   0204 0007

        MVI@    R5,     R4                      ; 69BA   02AC
        MOVR    R5,     R1                      ; 69BB   00A9

        JSR     R5,     X_PRINT_R1              ; 69BC   0004 0118 0067

        B       L_69B5                          ; 69BF   0220 000B
L_69C1:
        PULR    R7                              ; 69C1   02B7

L_69C2:
        PSHR    R5                              ; 69C2   0275
        PSHR    R2                              ; 69C3   0272
        CLRR    R2                              ; 69C4   01D2
L_69C5:
        PULR    R5                              ; 69C5   02B5
        DECLE   $02AC,  $037C,  $03FF,  $0204   ; 69C6   02AC 037C 03FF 0204
        DECLE   $001C,  $02A9,  $008B,  $03B9   ; 69CA   001C 02A9 008B 03B9
        DECLE   $0003,  $0009,  $0067,  $007B   ; 69CE   0003 0009 0067 007B
        DECLE   $002F,  $0001                   ; 69D2   002F 0001

        MVI@    R4,     R0                      ; 69D4   02A0
        SARC    R3,     1                       ; 69D5   007B
        ADCR    R7                              ; 69D6   002F

        NEGR    R0                              ; 69D7   0020
L_69D8:
        SARC    R3,     1                       ; 69D8   007B
        ADCR    R7                              ; 69D9   002F

        ADDR    R0,     R2                      ; 69DA   00C2
L_69DB:
        SARC    R3,     1                       ; 69DB   007B
        BC      L_69E0                          ; 69DC   0201 0002

        SLR     R0,     2                       ; 69DE   0064
        SLR     R0,     1                       ; 69DF   0060
L_69E0:
        MVI@    R5,     R4                      ; 69E0   02AC
        PSHR    R5                              ; 69E1   0275

        JSR     R5,     X_PRNUM_RGT             ; 69E2   0004 0118 00C5

        B       L_69C5                          ; 69E5   0220 0021
        PULR    R7                              ; 69E7   02B7

L_69E8:
        PSHR    R5                              ; 69E8   0275
        SLL     R0,     1                       ; 69E9   0048

        JSR     R5,     X_RAND2                 ; 69EA   0004 0114 029E

        SARC    R0,     1                       ; 69ED   0078
        ADCR    R7                              ; 69EE   002F

        NEGR    R0                              ; 69EF   0020
L_69F0:
        PULR    R7                              ; 69F0   02B7

L_69F1:
        PSHR    R5                              ; 69F1   0275

        JSR     R5,     .EXEC.7C1               ; 69F2   0004 0114 03C1
        JSR     R5,     X_PLAY_SFX1             ; 69F5   0004 0118 03BB
        DECLE   $0369                           ; 69F8  SFX data
        DECLE   $0285                           ; 69F9  SFX data
        DECLE   $0077,  $00FF,  $0069           ; 69FA  SFX data
        DECLE   $03ED                           ; 69FD  SFX data
        DECLE   $03CF                           ; 69FE  SFX end

UC_69FF:
        MVI     G_01A0, R0                      ; 69FF  SLIB UCALL target
        TSTR    R0                              ; 6A01   0080
        BEQ     L_6A0E                          ; 6A02   0204 000A

        MVII    #$000F, R0                      ; 6A04   02B8 000F
        MVO     R0,     .PSG0.chn_a_vol         ; 6A06   0240 01FB
        MVI     G_034C, R0                      ; 6A08   0280 034C
        SLR     R0,     2                       ; 6A0A   0064
        SLR     R0,     1                       ; 6A0B   0060
        B       L_6A1D                          ; 6A0C   0200 000F

L_6A0E:
        MVI     G_01B2, R0                      ; 6A0E   0280 01B2
        TSTR    R0                              ; 6A10   0080
        BEQ     L_6A23                          ; 6A11   0204 0010

        SDBD                                    ; 6A13   0001
        MVII    #$6D3D, R1                      ; 6A14   02B9 003D 006D
        MOVR    R0,     R2                      ; 6A17   0082

        JSR     R5,     X_DIV                   ; 6A18   0004 011C 01FB

        SLL     R0,     2                       ; 6A1B   004C
        SLL     R0,     1                       ; 6A1C   0048
L_6A1D:
        MVO     R0,     .PSG0.chn_a_lo          ; 6A1D   0240 01F0
        SWAP    R0,     1                       ; 6A1F   0040
        MVO     R0,     .PSG0.chn_a_hi          ; 6A20   0240 01F4
        PULR    R7                              ; 6A22   02B7

L_6A23:
        MVO     R0,     .PSG0.chn_a_vol         ; 6A23   0240 01FB
        PULR    R7                              ; 6A25   02B7

L_6A26:
        PSHR    R5                              ; 6A26   0275

        JSR     R5,     X_PLAY_SFX2             ; 6A27   0004 0118 03BE
        DECLE   $0082                           ; 6A2A  SFX prio
        DECLE   $02F9,  $0137,  $03ED,  $010C   ; 6A2B   02F9 0137 03ED 010C
        DECLE   $0000,  $000B,  $026B,  $03CF   ; 6A2F   0000 000B 026B 03CF
L_6A33:
        PSHR    R5                              ; 6A33   0275

        JSR     R5,     X_PLAY_SFX2             ; 6A34   0004 0118 03BE
        DECLE   $00A0                           ; 6A37  SFX prio
        DECLE   $03ED,  $0079,  $010C,  $0000   ; 6A38   03ED 0079 010C 0000
        DECLE   $03B7                           ; 6A3C   03B7

        INCR    R3                              ; 6A3D   000B
        MOVR    R1,     R7                      ; 6A3E   008F

        SLLC    R1,     1                       ; 6A3F   0059
        RRC     R3,     2                       ; 6A40   0077
        SWAP    R0,     2                       ; 6A41   0044
        SAR     R2,     1                       ; 6A42   006A
        ADD@    R1,     R7                      ; 6A43   02CF

        MVII    #$0001, R0                      ; 6A44   02B8 0001

        JSR     R5,     X_RAND1                 ; 6A46   0004 0114 027D

        TSTR    R0                              ; 6A49   0080
        BEQ     L_6A52                          ; 6A4A   0204 0006

        MVII    #$0005, R0                      ; 6A4C   02B8 0005

        JSR     R5,     X_CLR_BIT               ; 6A4E   0004 0114 02E6

        XORR    R4,     R3                      ; 6A51   01E3
L_6A52:
        PULR    R7                              ; 6A52   02B7

L_6A53:
        PSHR    R5                              ; 6A53   0275

        JSR     R5,     .EXEC.7C1               ; 6A54   0004 0114 03C1
        JSR     R5,     X_PLAY_SFX2             ; 6A57   0004 0118 03BE
        DECLE   $0084                           ; 6A5A  SFX prio
        DECLE   $03C8,  $000A,  $03C4,  $0064   ; 6A5B   03C8 000A 03C4 0064
        DECLE   $0399,  $0011,  $001A,  $0001   ; 6A5F   0399 0011 001A 0001

        DECR    R5                              ; 6A63   0015
        XORI    #$03F6, R2                      ; 6A64   03FA 03F6
        MOVR    R1,     R7                      ; 6A66   008F

        SLLC    R1,     1                       ; 6A67   0059
        ADD@    R1,     R7                      ; 6A68   02CF

L_6A69:
        PSHR    R5                              ; 6A69   0275

        JSR     R5,     .EXEC.7C1               ; 6A6A   0004 0114 03C1
        JSR     R5,     X_PLAY_SFX2             ; 6A6D   0004 0118 03BE
        DECLE   $0090                           ; 6A70  SFX prio

        ADDR    R7,     R1                      ; 6A71   00F9
        XOR@    R5,     R5                      ; 6A72   03ED
        XOR@    R4,     R5                      ; 6A73   03E5
        SUB@    R2,     R5                      ; 6A74   0315
        XOR@    R5,     R2                      ; 6A75   03EA
        XOR@    R6,     R6                      ; 6A76   03F6
        MOVR    R1,     R7                      ; 6A77   008F

        ADCR    R4                              ; 6A78   002C
        ADD@    R1,     R7                      ; 6A79   02CF

L_6A7A:
        PSHR    R5                              ; 6A7A   0275

        JSR     R5,     .EXEC.7C1               ; 6A7B   0004 0114 03C1
L_6A7E:
        JSR     R5,     X_PLAY_SFX2             ; 6A7E   0004 0118 03BE
        DECLE   $0082                           ; 6A81  SFX prio

        CMP@    R5,     R1                      ; 6A82   0369
        XOR@    R6,     R0                      ; 6A83   03F0
        SUBI    #$028D, R4                      ; 6A84   033C 028D
        GSWD    R1                              ; 6A86   0031
        ADCR    R0                              ; 6A87   0028
        INCR    R7                              ; 6A88   000F

        EIS                                     ; 6A89   0002
L_6A8A:
        XOR@    R4,     R2                      ; 6A8A   03E2
        AND@    R5,     R3                      ; 6A8B   03AB
        ADD@    R1,     R7                      ; 6A8C   02CF

L_6A8D:
        PSHR    R5                              ; 6A8D   0275

        JSR     R5,     .EXEC.7C1               ; 6A8E   0004 0114 03C1
        JSR     R5,     X_PLAY_SFX2             ; 6A91   0004 0118 03BE
        DECLE   $0081                           ; 6A94  SFX prio
        DECLE   $0369,  $0000,  $0000           ; 6A95   0369 0000 0000

        CLRR    R5                              ; 6A98   01ED
        RRC     R3,     2                       ; 6A99   0077
        MOVR    R3,     R7                      ; 6A9A   009F

        SAR     R2,     1                       ; 6A9B   006A
        ADDR    R2,     R7                      ; 6A9C   00D7

        SARC    R0,     2                       ; 6A9D   007C
        ADD@    R1,     R7                      ; 6A9E   02CF

        MVI     G_0159, R0                      ; 6A9F   0280 0159
        ADDI    #$0008, R0                      ; 6AA1   02F8 0008
        CMPI    #$000F, R0                      ; 6AA3   0378 000F
        BLE     L_6AAA                          ; 6AA5   0206 0003

        NEGR    R0                              ; 6AA7   0020
        ADDI    #$001E, R0                      ; 6AA8   02F8 001E
L_6AAA:
        MVO     R0,     .PSG0.chn_a_vol         ; 6AAA   0240 01FB
        PULR    R7                              ; 6AAC   02B7

L_6AAD:
        PSHR    R5                              ; 6AAD   0275

        JSR     R5,     X_PLAY_SFX2             ; 6AAE   0004 0118 03BE
        DECLE   $0090                           ; 6AB1  SFX prio
        DECLE   $0239,  $0004,  $0000,  $028D   ; 6AB2   0239 0004 0000 028D
        DECLE   $000F,  $0001,  $03B7           ; 6AB6   000F 0001 03B7

        CMPR    R3,     R4                      ; 6AB9   015C
        B       L_6AC7                          ; 6ABA   0200 000B
        MOVR    R1,     R7                      ; 6ABC   008F

        DECLE   $003B,  $03CF                   ; 6ABD   003B 03CF
L_6ABF:
        PSHR    R5                              ; 6ABF   0275
        MVII    #$0007, R0                      ; 6AC0   02B8 0007

        JSR     R5,     X_PLAY_SFX2             ; 6AC2   0004 0118 03BE
        DECLE   $0082                           ; 6AC5  SFX prio

        CMPR    R3,     R5                      ; 6AC6   015D
L_6AC7:
        DIS                                     ; 6AC7   0003
        DECLE   $0036                           ; 6AC8   0036

        PSHR    R5                              ; 6AC9   0275
L_6ACA:
        CLRR    R0                              ; 6ACA   01C0
        MVO     R2,     G_01BB                  ; 6ACB   0242 01BB
L_6ACD:
        MVI     G_01BB, R2                      ; 6ACD   0282 01BB

        JSR     R5,     L_574E                  ; 6ACF   0004 0154 034E
        JSR     R5,     X_PLAY_SFX2             ; 6AD2   0004 0118 03BE
        DECLE   $00B0                           ; 6AD5  SFX prio

        MVI@    R1,     R1                      ; 6AD6   0289
        AND     G_00C8, R0                      ; 6AD7   0380 00C8
        XOR@    R1,     R0                      ; 6AD9   03C8
        SLR     R0,     2                       ; 6ADA   0064
        ADD     G_0320, R4                      ; 6ADB   02C4 0320
        XOR@    R1,     R5                      ; 6ADD   03CD
        SAR     R3,     1                       ; 6ADE   006B
        MOVR    R4,     R1                      ; 6ADF   00A1
        XOR@    R3,     R3                      ; 6AE0   03DB
        SUBR    R5,     R3                      ; 6AE1   012B
        XORI    #$012B, R6                      ; 6AE2   03FE 012B
        RLC     R1,     1                       ; 6AE4   0051
        SARC    R3,     1                       ; 6AE5   007B
        MOVR    R1,     R7                      ; 6AE6   008F

        DECR    R3                              ; 6AE7   0013
        ADDR    R1,     R7                      ; 6AE8   00CF

        MVI     G_0159, R0                      ; 6AE9   0280 0159
        INCR    R0                              ; 6AEB   0008
        CMPI    #$0001, R0                      ; 6AEC   0378 0001
        BLE     L_6ACD                          ; 6AEE   0226 0022

        ADDI    #$0005, R0                      ; 6AF0   02F8 0005
        CMPI    #$0007, R0                      ; 6AF2   0378 0007
        BLE     L_6ACD                          ; 6AF4   0226 0028
        PULR    R7                              ; 6AF6   02B7

L_6AF7:
        PSHR    R5                              ; 6AF7   0275
        INCR    R0                              ; 6AF8   0008
        BEQ     L_6AFF                          ; 6AF9   0204 0004

        DECR    R0                              ; 6AFB   0010
        PSHR    R0                              ; 6AFC   0270
        MOVR    R1,     R0                      ; 6AFD   0088
        PULR    R1                              ; 6AFE   02B1

L_6AFF:
        JSR     R5,     .EXEC.629               ; 6AFF   0004 0114 0229

        MVO@    R0,     R2                      ; 6B02   0250
        PULR    R7                              ; 6B03   02B7

        MVI@    R1,     R0                      ; 6B04   0288
        SDBD                                    ; 6B05   0001
        XORI    #$1000, R0                      ; 6B06   03F8 0000 0010
        MVO@    R0,     R1                      ; 6B09   0248
        ADDI    #$0006, R1                      ; 6B0A   02F9 0006
        MVII    #$0006, R0                      ; 6B0C   02B8 0006
        MVO@    R0,     R1                      ; 6B0E   0248
        MOVR    R5,     R7                      ; 6B0F   00AF

L_6B10:
        PSHR    R5                              ; 6B10   0275
        PSHR    R2                              ; 6B11   0272
        PSHR    R3                              ; 6B12   0273

        JSR     R5,     L_6B4E                  ; 6B13   0004 0168 034E

        SDBD                                    ; 6B16   0001
        MVII    #$1000, R0                      ; 6B17   02B8 0000 0010
        INCR    R3                              ; 6B1A   000B

        JSR     R5,     L_540D                  ; 6B1B   0004 0154 000D

        PULR    R3                              ; 6B1E   02B3
        ADDI    #$0003, R3                      ; 6B1F   02FB 0003
        PULR    R2                              ; 6B21   02B2
        ADDI    #$0003, R2                      ; 6B22   02FA 0003
        MOVR    R0,     R1                      ; 6B24   0081
        SDBD                                    ; 6B25   0001
        ANDI    #$0800, R1                      ; 6B26   03B9 0000 0008
        BEQ     L_6B4A                          ; 6B29   0204 001F

        ANDI    #$0007, R3                      ; 6B2B   03BB 0007
        ANDI    #$01F8, R0                      ; 6B2D   03B8 01F8
        ADDR    R0,     R3                      ; 6B2F   00C3
        SDBD                                    ; 6B30   0001
        ADDI    #$5EB2, R3                      ; 6B31   02FB 00B2 005E
        MVI@    R3,     R1                      ; 6B34   0299
        SWAP    R1,     1                       ; 6B35   0041
        ANDI    #$0007, R2                      ; 6B36   03BA 0007
        INCR    R2                              ; 6B38   000A
L_6B39:
        SLLC    R1,     1                       ; 6B39   0059
        DECR    R2                              ; 6B3A   0012
        BNEQ    L_6B39                          ; 6B3B   022C 0003

L_6B3D:
        MVII    #$0001, R0                      ; 6B3D   02B8 0001
        CLRR    R1                              ; 6B3F   01C9
        BNC     L_6B45                          ; 6B40   0209 0003

        MVII    #$0004, R0                      ; 6B42   02B8 0004
        INCR    R1                              ; 6B44   0009
L_6B45:
        MVO     R0,     G_01BC                  ; 6B45   0240 01BC
        MVO     R1,     G_01BD                  ; 6B47   0241 01BD
        PULR    R7                              ; 6B49   02B7

L_6B4A:
        SLL     R0,     2                       ; 6B4A   004C
        SLLC    R0,     1                       ; 6B4B   0058
        B       L_6B3D                          ; 6B4C   0220 0010

L_6B4E:
        ADDI    #$0003, R2                      ; 6B4E   02FA 0003
        ADDI    #$0003, R3                      ; 6B50   02FB 0003
        SLR     R2,     2                       ; 6B52   0066
        SLR     R2,     1                       ; 6B53   0062
        DECR    R2                              ; 6B54   0012
        BPL     L_6B58                          ; 6B55   0203 0001

        CLRR    R2                              ; 6B57   01D2
L_6B58:
        SLR     R3,     2                       ; 6B58   0067
        SLR     R3,     1                       ; 6B59   0063
        DECR    R3                              ; 6B5A   0013
        BPL     L_6B5E                          ; 6B5B   0203 0001

        CLRR    R3                              ; 6B5D   01DB
L_6B5E:
        SLL     R3,     2                       ; 6B5E   004F
        PSHR    R3                              ; 6B5F   0273
        SLL     R3,     2                       ; 6B60   004F
        ADD@    R6,     R3                      ; 6B61   02F3
        ADDR    R2,     R3                      ; 6B62   00D3
        MOVR    R5,     R7                      ; 6B63   00AF

L_6B64:
        PSHR    R5                              ; 6B64   0275
        MVII    #$0014, R0                      ; 6B65   02B8 0014

        JSR     R5,     L_5120                  ; 6B67   0004 0150 0120

        MVII    #$0200, R4                      ; 6B6A   02BC 0200

        JSR     R5,     X_FILL_MEM              ; 6B6C   0004 0114 0341

        MVII    #$0001, R2                      ; 6B6F   02BA 0001

        JSR     R5,     L_50BA                  ; 6B71   0004 0150 00BA

        CLRR    R0                              ; 6B74   01C0
        MVII    #$0068, R2                      ; 6B75   02BA 0068
        SWAP    R2,     1                       ; 6B77   0042
        MVII    #$0328, R1                      ; 6B78   02B9 0328
L_6B7A:
        ADDI    #$0008, R1                      ; 6B7A   02F9 0008
        CMP@    R1,     R2                      ; 6B7C   034A
        BGE     L_6B84                          ; 6B7D   020D 0005

        SUBI    #$0002, R1                      ; 6B7F   0339 0002
        MVO@    R0,     R1                      ; 6B81   0248
        ADDI    #$0002, R1                      ; 6B82   02F9 0002
L_6B84:
        CMPI    #$0358, R1                      ; 6B84   0379 0358
        BLE     L_6B7A                          ; 6B86   0226 000D
        PULR    R7                              ; 6B88   02B7

L_6B89:
        DIS                                     ; 6B89   0003
        MVO     R0,     .ISRVEC.0               ; 6B8A   0240 0100
        SWAP    R0,     1                       ; 6B8C   0040
        MVO     R0,     .ISRVEC.1               ; 6B8D   0240 0101
        MVII    #$0001, R0                      ; 6B8F   02B8 0001
        MVO     R0,     G_01BE                  ; 6B91   0240 01BE
        EIS                                     ; 6B93   0002
        MOVR    R5,     R7                      ; 6B94   00AF

L_6B95:
        PSHR    R5                              ; 6B95   0275
        CLRR    R0                              ; 6B96   01C0
        MVO     R0,     G_01BE                  ; 6B97   0240 01BE
        J       L_5FD6                          ; 6B99   0004 035C 03D6

L_6B9C:
        PSHR    R5                              ; 6B9C   0275
L_6B9D:
        SDBD                                    ; 6B9D   0001
        MVII    #$6BAB, R0                      ; 6B9E   02B8 00AB 006B

        JSR     R5,     L_6B89                  ; 6BA1   0004 0168 0389

L_6BA4:
        EIS                                     ; 6BA4   0002
        MVI     G_01BE, R0                      ; 6BA5   0280 01BE
        TSTR    R0                              ; 6BA7   0080
        BNEQ    L_6BA4                          ; 6BA8   022C 0005
        PULR    R7                              ; 6BAA   02B7

        DIS                                     ; 6BAB   0003
        PSHR    R5                              ; 6BAC   0275

        JSR     R5,     L_6B95                  ; 6BAD   0004 0168 0395

        MVII    #$0008, R0                      ; 6BB0   02B8 0008
        CLRR    R4                              ; 6BB2   01E4

        JSR     R5,     X_FILL_ZERO             ; 6BB3   0004 0114 0338

        MVI     G_01BA, R1                      ; 6BB6   0281 01BA
        ADDR    R7,     R1                      ; 6BB8   00F9
        ADDI    #$0044, R1                      ; 6BB9   02F9 0044
        MVI@    R1,     R4                      ; 6BBB   028C
        ADDR    R7,     R4                      ; 6BBC   00FC
        ADDI    #$0039, R4                      ; 6BBD   02FC 0039
        MVII    #$0004, R0                      ; 6BBF   02B8 0004
        MVII    #$0028, R1                      ; 6BC1   02B9 0028

        JSR     R5,     .EXEC.730               ; 6BC3   0004 0114 0330

        CLRR    R2                              ; 6BC6   01D2
        MVI     G_01BA, R1                      ; 6BC7   0281 01BA
        CMPI    #$000A, R1                      ; 6BC9   0379 000A
        BEQ     L_6BE4                          ; 6BCB   0204 0017

        INCR    R2                              ; 6BCD   000A
        CMPI    #$0006, R1                      ; 6BCE   0379 0006
        BEQ     L_6BE4                          ; 6BD0   0204 0012

        CMPI    #$0003, R1                      ; 6BD2   0379 0003
        BEQ     L_6BE2                          ; 6BD4   0204 000C

        MVO     R0,     G_0105                  ; 6BD6   0240 0105
        MVI     .STIC.MODE,R0                   ; 6BD8   0280 0021
        CMPI    #$0001, R1                      ; 6BDA   0379 0001
        BNEQ    L_6BE9                          ; 6BDC   020C 000B

        MVII    #$0003, R2                      ; 6BDE   02BA 0003
        B       L_6BE9                          ; 6BE0   0200 0007

L_6BE2:
        MVII    #$0003, R2                      ; 6BE2   02BA 0003
L_6BE4:
        INCR    R0                              ; 6BE4   0008
        MVO     R0,     .STIC.MODE              ; 6BE5   0240 0021
        MVO     R0,     G_0105                  ; 6BE7   0240 0105
L_6BE9:
        MVO     R2,     .STIC.EDGE              ; 6BE9   0242 0032
        CLRR    R0                              ; 6BEB   01C0
        MVO     R0,     .STIC.VDLY              ; 6BEC   0240 0031
        MVO     R0,     .STIC.HDLY              ; 6BEE   0240 0030
        PULR    R5                              ; 6BF0   02B5
        EIS                                     ; 6BF1   0002
        MVII    #$0100, R4                      ; 6BF2   02BC 0100
        SDBD                                    ; 6BF4   0001
        MVI@    R4,     R7                      ; 6BF5   02A7

        DECLE   $0001,  $000D,  $0001,  $000D   ; 6BF6   0001 000D 0001 000D
        DECLE   $000D,  $000D,  $0000,  $0000   ; 6BFA   000D 000D 0000 0000
        DECLE   $0003,  $0000,  $0006,  $0006   ; 6BFE   0003 0000 0006 0006
        DECLE   $0006,  $0006,  $0000,  $0006   ; 6C02   0006 0006 0000 0006
        DECLE   $0000                           ; 6C06   0000

        CLRC                                    ; 6C07   0006
        CLRC                                    ; 6C08   0006
L_6C09:
        PSHR    R5                              ; 6C09   0275
        MVII    #$0080, R3                      ; 6C0A   02BB 0080
        CLRR    R0                              ; 6C0C   01C0
L_6C0D:
        MOVR    R3,     R2                      ; 6C0D   009A
        AND@    R1,     R2                      ; 6C0E   038A
        BNEQ    L_6C1B                          ; 6C0F   020C 000A

        MOVR    R3,     R2                      ; 6C11   009A
        XOR@    R1,     R2                      ; 6C12   03CA
        MVO@    R2,     R1                      ; 6C13   024A
        NEGR    R0                              ; 6C14   0020
        ADDI    #$0007, R0                      ; 6C15   02F8 0007

        JSR     R5,     .EXEC.76C               ; 6C17   0004 0114 036C

        PULR    R7                              ; 6C1A   02B7

L_6C1B:
        SLR     R3,     1                       ; 6C1B   0063
        INCR    R0                              ; 6C1C   0008
        CMPI    #$0007, R0                      ; 6C1D   0378 0007
        BLE     L_6C0D                          ; 6C1F   0226 0013

        CLRR    R1                              ; 6C21   01C9
        PULR    R7                              ; 6C22   02B7

L_6C23:
        PSHR    R5                              ; 6C23   0275
        MVI@    R4,     R1                      ; 6C24   02A1
        ADDR    R1,     R1                      ; 6C25   00C9
        ADDR    R4,     R1                      ; 6C26   00E1
        PSHR    R1                              ; 6C27   0271
        MVII    #$0002, R0                      ; 6C28   02B8 0002

        JSR     R5,     .EXEC.76C               ; 6C2A   0004 0114 036C

        MOVR    R1,     R5                      ; 6C2D   008D
L_6C2E:
        MVI@    R4,     R0                      ; 6C2E   02A0
        PULR    R1                              ; 6C2F   02B1
        PSHR    R1                              ; 6C30   0271
        CMPR    R1,     R4                      ; 6C31   014C
        BGT     L_6C6E                          ; 6C32   020E 003A

        MVI@    R4,     R1                      ; 6C34   02A1
        PSHR    R3                              ; 6C35   0273
        SARC    R1,     1                       ; 6C36   0079
        BNC     L_6C3B                          ; 6C37   0209 0002

        XORI    #$0040, R3                      ; 6C39   03FB 0040
L_6C3B:
        MVO@    R3,     R5                      ; 6C3B   026B
        INCR    R5                              ; 6C3C   000D
        PULR    R3                              ; 6C3D   02B3
        PSHR    R1                              ; 6C3E   0271
        MOVR    R0,     R1                      ; 6C3F   0081
        PSHR    R4                              ; 6C40   0274
        MOVR    R2,     R4                      ; 6C41   0094
        SLR     R1,     2                       ; 6C42   0065
        SLR     R1,     2                       ; 6C43   0065
        SLR     R1,     1                       ; 6C44   0061
        SWAP    R1,     1                       ; 6C45   0041
        PSHR    R3                              ; 6C46   0273
        SDBD                                    ; 6C47   0001
        ANDI    #$2000, R3                      ; 6C48   03BB 0000 0020
        BEQ     L_6C4E                          ; 6C4B   0204 0001

        ADDR    R1,     R1                      ; 6C4D   00C9
L_6C4E:
        PULR    R3                              ; 6C4E   02B3
        PSHR    R3                              ; 6C4F   0273
        ANDI    #$0200, R3                      ; 6C50   03BB 0200
        BEQ     L_6C55                          ; 6C52   0204 0001

        NEGR    R1                              ; 6C54   0021
L_6C55:
        PULR    R3                              ; 6C55   02B3
        SDBD                                    ; 6C56   0001
        ADD@    R4,     R1                      ; 6C57   02E1
        MVO@    R1,     R5                      ; 6C58   0269
        ANDI    #$001F, R0                      ; 6C59   03B8 001F
        SWAP    R0,     1                       ; 6C5B   0040
        PSHR    R3                              ; 6C5C   0273
        ANDI    #$0080, R3                      ; 6C5D   03BB 0080
        BEQ     L_6C62                          ; 6C5F   0204 0001

        ADDR    R0,     R0                      ; 6C61   00C0
L_6C62:
        PULR    R3                              ; 6C62   02B3
        SDBD                                    ; 6C63   0001
        ADD@    R4,     R0                      ; 6C64   02E0
        MVO@    R0,     R5                      ; 6C65   0268
        PULR    R4                              ; 6C66   02B4
        PULR    R0                              ; 6C67   02B0
        INCR    R5                              ; 6C68   000D
        MVO@    R0,     R5                      ; 6C69   0268
        ADDI    #$0002, R5                      ; 6C6A   02FD 0002
        B       L_6C2E                          ; 6C6C   0220 003F

L_6C6E:
        PULR    R1                              ; 6C6E   02B1
        PULR    R7                              ; 6C6F   02B7

L_6C70:
        PSHR    R5                              ; 6C70   0275
        MVII    #$0003, R0                      ; 6C71   02B8 0003

        JSR     R5,     X_RAND1                 ; 6C73   0004 0114 027D

        SARC    R0,     1                       ; 6C76   0078
        SWAP    R0,     1                       ; 6C77   0040
        SLL     R0,     1                       ; 6C78   0048
        PULR    R7                              ; 6C79   02B7

L_6C7A:
        PSHR    R5                              ; 6C7A   0275
        SWAP    R1,     1                       ; 6C7B   0041
        MVO     R1,     G_01C4                  ; 6C7C   0241 01C4
        SWAP    R1,     1                       ; 6C7E   0041
        PSHR    R1                              ; 6C7F   0271
        SAR     R1,     1                       ; 6C80   0069
        ADDR    R0,     R1                      ; 6C81   00C1
        SDBD                                    ; 6C82   0001
        ADDI    #$0FB0, R1                      ; 6C83   02F9 00B0 000F
        MOVR    R1,     R4                      ; 6C86   008C
        PULR    R1                              ; 6C87   02B1
        TSTR    R1                              ; 6C88   0089
        BPL     L_6C8C                          ; 6C89   0203 0001

        NEGR    R1                              ; 6C8B   0021
L_6C8C:
        SWAP    R1,     1                       ; 6C8C   0041
        SLR     R1,     1                       ; 6C8D   0061
        MVII    #$0014, R2                      ; 6C8E   02BA 0014

        JSR     R5,     X_DIV                   ; 6C90   0004 011C 01FB

        SLL     R0,     1                       ; 6C93   0048
        MVO     R0,     G_0324                  ; 6C94   0240 0324
        ADDI    #$0080, R0                      ; 6C96   02F8 0080
        SWAP    R0,     1                       ; 6C98   0040
        ANDI    #$00FF, R0                      ; 6C99   03B8 00FF
        CMP     G_01C3, R0                      ; 6C9B   0340 01C3
        BEQ     L_6CA4                          ; 6C9D   0204 0005

        MVO     R0,     G_01C3                  ; 6C9F   0240 01C3

        JSR     R5,     L_6D18                  ; 6CA1   0004 016C 0118

L_6CA4:
        MVI     G_0324, R2                      ; 6CA4   0282 0324
        NEGR    R2                              ; 6CA6   0022
        CLRR    R3                              ; 6CA7   01DB
L_6CA8:
        ADD     G_0324, R2                      ; 6CA8   02C2 0324
        MOVR    R2,     R0                      ; 6CAA   0090
        SWAP    R0,     1                       ; 6CAB   0040
        ANDI    #$00FF, R0                      ; 6CAC   03B8 00FF
        MVI     G_01C4, R1                      ; 6CAE   0281 01C4
        TSTR    R1                              ; 6CB0   0089
        BNEQ    L_6CB4                          ; 6CB1   020C 0001

        NEGR    R0                              ; 6CB3   0020
L_6CB4:
        ADDR    R4,     R0                      ; 6CB4   00E0
        MOVR    R0,     R1                      ; 6CB5   0081
        ANDI    #$0007, R0                      ; 6CB6   03B8 0007
        NEGR    R0                              ; 6CB8   0020
        ADDI    #$0007, R0                      ; 6CB9   02F8 0007
        SLL     R0,     2                       ; 6CBB   004C
        SLL     R0,     2                       ; 6CBC   004C
        XOR     G_01BC, R0                      ; 6CBD   03C0 01BC
        SDBD                                    ; 6CBF   0001
        XORI    #$0800, R0                      ; 6CC0   03F8 0000 0008
        ADDI    #$0008, R0                      ; 6CC3   02F8 0008
        SLR     R1,     2                       ; 6CC5   0065
        SLR     R1,     1                       ; 6CC6   0061
        SUBI    #$0200, R1                      ; 6CC7   0339 0200
        SLL     R1,     2                       ; 6CC9   004D
        PSHR    R1                              ; 6CCA   0271
        SLL     R1,     2                       ; 6CCB   004D
        ADD@    R6,     R1                      ; 6CCC   02F1
        ADDR    R3,     R1                      ; 6CCD   00D9
        ADDI    #$0200, R1                      ; 6CCE   02F9 0200

        JSR     R5,     L_6D0D                  ; 6CD0   0004 016C 010D

        SUBI    #$0008, R0                      ; 6CD3   0338 0008
        SUBI    #$0014, R1                      ; 6CD5   0339 0014

        JSR     R5,     L_6D0D                  ; 6CD7   0004 016C 010D

        SDBD                                    ; 6CDA   0001
        ANDI    #$F807, R0                      ; 6CDB   03B8 0007 00F8
        SUBI    #$0014, R1                      ; 6CDE   0339 0014

        JSR     R5,     L_6D0D                  ; 6CE0   0004 016C 010D

        MVII    #$000D, R0                      ; 6CE3   02B8 000D

        JSR     R5,     X_CLR_BIT               ; 6CE5   0004 0114 02E6
        DECLE   $0214                           ; 6CE8   0214

        MVII    #$02F8, R0                      ; 6CE9   02B8 02F8
        XOR     G_01BC, R0                      ; 6CEB   03C0 01BC
        ADDI    #$003C, R1                      ; 6CED   02F9 003C

        JSR     R5,     L_6D0D                  ; 6CEF   0004 016C 010D

L_6CF2:
        ADDI    #$0014, R1                      ; 6CF2   02F9 0014

        JSR     R5,     L_6D0D                  ; 6CF4   0004 016C 010D

        CMPI    #$02F0, R1                      ; 6CF7   0379 02F0
        BLT     L_6CF2                          ; 6CF9   0225 0008

        INCR    R3                              ; 6CFB   000B
        CMPI    #$0013, R3                      ; 6CFC   037B 0013
        BLE     L_6CA8                          ; 6CFE   0226 0057

        MVI     .BTAB.EF,R0                     ; 6D00   0280 02EF
        ANDI    #$0200, R0                      ; 6D02   03B8 0200
        BEQ     L_6D0C                          ; 6D04   0204 0006

        MVII    #$000D, R0                      ; 6D06   02B8 000D

        JSR     R5,     X_CLR_BIT               ; 6D08   0004 0114 02E6

        ADD@    R5,     R7                      ; 6D0B   02EF
L_6D0C:
        PULR    R7                              ; 6D0C   02B7

L_6D0D:
        PSHR    R5                              ; 6D0D   0275
        CMPI    #$0214, R1                      ; 6D0E   0379 0214
        BLT     L_6D17                          ; 6D10   0205 0005

        CMPI    #$02F0, R1                      ; 6D12   0379 02F0
        BGE     L_6D17                          ; 6D14   020D 0001

        MVO@    R0,     R1                      ; 6D16   0248
L_6D17:
        PULR    R7                              ; 6D17   02B7

L_6D18:
        PSHR    R5                              ; 6D18   0275
        SDBD                                    ; 6D19   0001
        MVII    #$6D27, R0                      ; 6D1A   02B8 0027 006D

        JSR     R5,     L_6B89                  ; 6D1D   0004 0168 0389

L_6D20:
        EIS                                     ; 6D20   0002
        MVI     G_01BE, R0                      ; 6D21   0280 01BE
        TSTR    R0                              ; 6D23   0080
        BNEQ    L_6D20                          ; 6D24   022C 0005
        PULR    R7                              ; 6D26   02B7

        DIS                                     ; 6D27   0003
        PSHR    R5                              ; 6D28   0275

        JSR     R5,     L_6B95                  ; 6D29   0004 0168 0395

        MVI     G_01C3, R1                      ; 6D2C   0281 01C3
        MVI     G_01C4, R2                      ; 6D2E   0282 01C4
        SDBD                                    ; 6D30   0001
        MVII    #$3800, R4                      ; 6D31   02BC 0000 0038
        MVII    #$0010, R0                      ; 6D34   02B8 0010

        JSR     R5,     X_FILL_ZERO             ; 6D36   0004 0114 0338

        MOVR    R4,     R5                      ; 6D39   00A5
        TSTR    R1                              ; 6D3A   0089
        BEQ     L_6D5D                          ; 6D3B   0204 0020

        SUBR    R1,     R5                      ; 6D3D   010D
        SDBD                                    ; 6D3E   0001
        MVII    #$6D7E, R4                      ; 6D3F   02BC 007E 006D
        DECR    R1                              ; 6D42   0011
        BEQ     L_6D49                          ; 6D43   0204 0004

L_6D45:
        ADDR    R1,     R4                      ; 6D45   00CC
        DECR    R1                              ; 6D46   0011
        BNEQ    L_6D45                          ; 6D47   022C 0003

L_6D49:
        MVI@    R4,     R0                      ; 6D49   02A0
        TSTR    R2                              ; 6D4A   0092
        BEQ     L_6D56                          ; 6D4B   0204 0009

        RRC     R0,     2                       ; 6D4D   0074
        RLC     R1,     2                       ; 6D4E   0055
        RRC     R0,     2                       ; 6D4F   0074
        RLC     R1,     2                       ; 6D50   0055
        RRC     R0,     2                       ; 6D51   0074
        RLC     R1,     2                       ; 6D52   0055
        RRC     R0,     2                       ; 6D53   0074
        RLC     R1,     2                       ; 6D54   0055
        MOVR    R1,     R0                      ; 6D55   0088
L_6D56:
        MVO@    R0,     R5                      ; 6D56   0268
        SDBD                                    ; 6D57   0001
        CMPI    #$3810, R5                      ; 6D58   037D 0010 0038
        BLT     L_6D49                          ; 6D5B   0225 0013

L_6D5D:
        MVII    #$0001, R1                      ; 6D5D   02B9 0001
L_6D5F:
        SDBD                                    ; 6D5F   0001
        MVII    #$3800, R4                      ; 6D60   02BC 0000 0038
        ADDR    R1,     R4                      ; 6D63   00CC
L_6D64:
        MVI@    R4,     R0                      ; 6D64   02A0
        MVO@    R0,     R5                      ; 6D65   0268
        SDBD                                    ; 6D66   0001
        CMPI    #$3810, R4                      ; 6D67   037C 0010 0038
        BLT     L_6D64                          ; 6D6A   0225 0007

        MVII    #$00FF, R0                      ; 6D6C   02B8 00FF
        MOVR    R1,     R2                      ; 6D6E   008A
L_6D6F:
        MVO@    R0,     R5                      ; 6D6F   0268
        DECR    R2                              ; 6D70   0012
        BNEQ    L_6D6F                          ; 6D71   022C 0003

        INCR    R1                              ; 6D73   0009
        CMPI    #$0007, R1                      ; 6D74   0379 0007
        BLE     L_6D5F                          ; 6D76   0226 0018

        PULR    R5                              ; 6D78   02B5
        EIS                                     ; 6D79   0002
        MVII    #$0100, R4                      ; 6D7A   02BC 0100
        SDBD                                    ; 6D7C   0001
        MVI@    R4,     R7                      ; 6D7D   02A7

        DECLE   $000F,  $0003,  $003F,  $0001   ; 6D7E   000F 0003 003F 0001
        DECLE   $000F,  $007F,  $0001,  $0003   ; 6D82   000F 007F 0001 0003
        DECLE   $001F,  $007F,  $0001           ; 6D86   001F 007F 0001

        DIS                                     ; 6D89   0003
        INCR    R7                              ; 6D8A   000F

        DECLE   $003F                           ; 6D8B   003F
L_6D8C:
        SARC    R3,     2                       ; 6D8C   007F
        DECLE   $0001,  $0003,  $0007,  $001F   ; 6D8D   0001 0003 0007 001F
        DECLE   $003F,  $007F,  $0001,  $0003   ; 6D91   003F 007F 0001 0003
        DECLE   $0007,  $000F,  $001F,  $003F   ; 6D95   0007 000F 001F 003F
        DECLE   $007F,  $0001,  $0003,  $0007   ; 6D99   007F 0001 0003 0007
        DECLE   $000F,  $001F,  $003F,  $007F   ; 6D9D   000F 001F 003F 007F
        DECLE   $00FF                           ; 6DA1   00FF
L_6DA2:
        PSHR    R5                              ; 6DA2   0275
        MVI     G_01BA, R1                      ; 6DA3   0281 01BA
        MOVR    R1,     R0                      ; 6DA5   0088
        CMPI    #$0001, R0                      ; 6DA6   0378 0001
        BEQ     L_6DB1                          ; 6DA8   0204 0007

        MVI     G_017F, R0                      ; 6DAA   0280 017F
        CMPI    #$00FF, R0                      ; 6DAC   0378 00FF
        BEQ     L_6DC9                          ; 6DAE   0204 0019

        DECR    R0                              ; 6DB0   0010
L_6DB1:
        DECR    R0                              ; 6DB1   0010
        BMI     L_6DC9                          ; 6DB2   020B 0015

        MVII    #$01C0, R5                      ; 6DB4   02BD 01C0
        SDBD                                    ; 6DB6   0001
        MVI@    R5,     R1                      ; 6DB7   02A9
        MVI     G_01C2, R2                      ; 6DB8   0282 01C2
        CMPI    #$0001, R0                      ; 6DBA   0378 0001
        BGT     L_6DCA                          ; 6DBC   020E 000C

        TSTR    R0                              ; 6DBE   0080
        BEQ     L_6DC5                          ; 6DBF   0204 0004

        NEGR    R1                              ; 6DC1   0021
        NEGR    R2                              ; 6DC2   0022
        ADDI    #$00FF, R2                      ; 6DC3   02FA 00FF
L_6DC5:
        MOVR    R2,     R0                      ; 6DC5   0090

L_6DC6:
        JSR     R5,     L_6C7A                  ; 6DC6   0004 016C 007A

L_6DC9:
        PULR    R7                              ; 6DC9   02B7

L_6DCA:
        SAR     R1,     1                       ; 6DCA   0069
        MOVR    R0,     R4                      ; 6DCB   0084
        SUBI    #$0002, R4                      ; 6DCC   033C 0002
        MVI     G_01B3, R0                      ; 6DCE   0280 01B3
        SWAP    R0,     1                       ; 6DD0   0040
        SAR     R0,     2                       ; 6DD1   006C
        SAR     R0,     2                       ; 6DD2   006C
        SAR     R0,     2                       ; 6DD3   006C
        TSTR    R4                              ; 6DD4   00A4
        BEQ     L_6DD9                          ; 6DD5   0204 0002

        NEGR    R1                              ; 6DD7   0021
        NEGR    R0                              ; 6DD8   0020
L_6DD9:
        NEGR    R1                              ; 6DD9   0021
        ADD     G_01C2, R1                      ; 6DDA   02C1 01C2
        PSHR    R1                              ; 6DDC   0271
        MOVR    R0,     R1                      ; 6DDD   0081
        ADDR    R4,     R7                      ; 6DDE   00E7

        NEGR    R0                              ; 6DDF   0020
        ADD@    R6,     R0                      ; 6DE0   02F0
        B       L_6DC6                          ; 6DE1   0220 001C

L_6DE3:
        PSHR    R5                              ; 6DE3   0275
        MVI     G_01BA, R0                      ; 6DE4   0280 01BA
        CMPI    #$0003, R0                      ; 6DE6   0378 0003
        BNEQ    L_6E19                          ; 6DE8   020C 002F

        MVII    #$01C5, R4                      ; 6DEA   02BC 01C5
        MVI@    R4,     R0                      ; 6DEC   02A0
        SWAP    R0,     1                       ; 6DED   0040
        SAR     R0,     2                       ; 6DEE   006C
        SAR     R0,     2                       ; 6DEF   006C
        SAR     R0,     1                       ; 6DF0   0068
        MOVR    R4,     R3                      ; 6DF1   00A3
        SDBD                                    ; 6DF2   0001
        ADD@    R4,     R0                      ; 6DF3   02E0
        MVO@    R0,     R3                      ; 6DF4   0258
        SWAP    R0,     1                       ; 6DF5   0040
        MOVR    R0,     R2                      ; 6DF6   0082
        INCR    R3                              ; 6DF7   000B
        SUB@    R3,     R0                      ; 6DF8   0318
        MOVR    R2,     R1                      ; 6DF9   0091
        ANDI    #$0007, R1                      ; 6DFA   03B9 0007
        MVO@    R1,     R3                      ; 6DFC   0259
        XORR    R1,     R2                      ; 6DFD   01CA
        MVII    #$01CB, R5                      ; 6DFE   02BD 01CB
        MVO@    R2,     R5                      ; 6E00   026A
        SUBR    R0,     R2                      ; 6E01   0102
        INCR    R5                              ; 6E02   000D
        MVO@    R2,     R5                      ; 6E03   026A
        MVII    #$0003, R3                      ; 6E04   02BB 0003
        MVO@    R3,     R5                      ; 6E06   026B
        SDBD                                    ; 6E07   0001
        MVII    #$6E1A, R0                      ; 6E08   02B8 001A 006E

        JSR     R5,     L_6B89                  ; 6E0B   0004 0168 0389

L_6E0E:
        EIS                                     ; 6E0E   0002
        MVI     G_01CE, R2                      ; 6E0F   0282 01CE
        SARC    R2,     2                       ; 6E11   007E
        BC      L_6E0E                          ; 6E12   0221 0005
        BNOV    L_6E19                          ; 6E14   020A 0003

        JSR     R5,     L_6B64                  ; 6E16   0004 0168 0364

L_6E19:
        PULR    R7                              ; 6E19   02B7

        PSHR    R5                              ; 6E1A   0275
        MVII    #$031D, R2                      ; 6E1B   02BA 031D
        MVII    #$0008, R3                      ; 6E1D   02BB 0008
L_6E1F:
        MVII    #$01CA, R5                      ; 6E1F   02BD 01CA
        MVI@    R2,     R0                      ; 6E21   0290
        SLL     R0,     1                       ; 6E22   0048
        BMI     L_6E27                          ; 6E23   020B 0002

        MVII    #$01CC, R5                      ; 6E25   02BD 01CC
L_6E27:
        ADDI    #$0003, R2                      ; 6E27   02FA 0003
        MVI@    R2,     R0                      ; 6E29   0290
        SDBD                                    ; 6E2A   0001
        ADD@    R5,     R0                      ; 6E2B   02E8
        MVO@    R0,     R2                      ; 6E2C   0250
        MVI@    R3,     R0                      ; 6E2D   0298
        MOVR    R0,     R1                      ; 6E2E   0081
        ANDI    #$007F, R1                      ; 6E2F   03B9 007F
        XORR    R1,     R0                      ; 6E31   01C8
        DECR    R5                              ; 6E32   0015
        ADD@    R5,     R1                      ; 6E33   02E9
        ANDI    #$007F, R1                      ; 6E34   03B9 007F
        XORR    R1,     R0                      ; 6E36   01C8
        MVO@    R0,     R3                      ; 6E37   0258
        ADDI    #$0005, R2                      ; 6E38   02FA 0005
        INCR    R3                              ; 6E3A   000B
        CMPI    #$0010, R3                      ; 6E3B   037B 0010
        BNEQ    L_6E1F                          ; 6E3D   022C 001F

        MVI     G_01C7, R0                      ; 6E3F   0280 01C7
        MVO     R0,     .STIC.VDLY              ; 6E41   0240 0031
        MVO     R0,     .STIC.VIDEN             ; 6E43   0240 0020

        JSR     R5,     L_6B95                  ; 6E45   0004 0168 0395

        CLRR    R2                              ; 6E48   01D2
        MVI     G_01CB, R0                      ; 6E49   0280 01CB
        SWAP    R0,     2                       ; 6E4B   0044
        BEQ     L_6E95                          ; 6E4C   0204 0047

        MVII    #$02DC, R5                      ; 6E4E   02BD 02DC
        MVII    #$0214, R4                      ; 6E50   02BC 0214
        MVII    #$0200, R2                      ; 6E52   02BA 0200
        MVII    #$0014, R1                      ; 6E54   02B9 0014
        MVII    #$000A, R0                      ; 6E56   02B8 000A
L_6E58:
        PSHR    R0                              ; 6E58   0270
        MVII    #$0004, R3                      ; 6E59   02BB 0004
L_6E5B:
        MVI@    R4,     R0                      ; 6E5B   02A0
        MVO@    R0,     R5                      ; 6E5C   0268
        MVI@    R4,     R0                      ; 6E5D   02A0
        MVO@    R0,     R5                      ; 6E5E   0268
        MVI@    R4,     R0                      ; 6E5F   02A0
        MVO@    R0,     R5                      ; 6E60   0268
        MVI@    R4,     R0                      ; 6E61   02A0
        MVO@    R0,     R5                      ; 6E62   0268
        MVI@    R4,     R0                      ; 6E63   02A0
        MVO@    R0,     R5                      ; 6E64   0268
        DECR    R3                              ; 6E65   0013
        BNEQ    L_6E5B                          ; 6E66   022C 000C

        SUBR    R1,     R4                      ; 6E68   010C
        SUBR    R1,     R5                      ; 6E69   010D
        XORR    R2,     R5                      ; 6E6A   01D5
        XORR    R5,     R2                      ; 6E6B   01EA
        XORR    R2,     R5                      ; 6E6C   01D5
        MVII    #$0004, R3                      ; 6E6D   02BB 0004
L_6E6F:
        MVI@    R5,     R0                      ; 6E6F   02A8
        MVO@    R0,     R4                      ; 6E70   0260
        MVI@    R5,     R0                      ; 6E71   02A8
        MVO@    R0,     R4                      ; 6E72   0260
        MVI@    R5,     R0                      ; 6E73   02A8
        MVO@    R0,     R4                      ; 6E74   0260
        MVI@    R5,     R0                      ; 6E75   02A8
        MVO@    R0,     R4                      ; 6E76   0260
        MVI@    R5,     R0                      ; 6E77   02A8
        MVO@    R0,     R4                      ; 6E78   0260
        DECR    R3                              ; 6E79   0013
        BNEQ    L_6E6F                          ; 6E7A   022C 000C

        SUBR    R1,     R5                      ; 6E7C   010D
        PULR    R0                              ; 6E7D   02B0
        DECR    R0                              ; 6E7E   0010
        BNEQ    L_6E58                          ; 6E7F   022C 0028

        XORR    R2,     R5                      ; 6E81   01D5
        XORR    R5,     R2                      ; 6E82   01EA
        XORR    R2,     R5                      ; 6E83   01D5
        MVII    #$0004, R3                      ; 6E84   02BB 0004
L_6E86:
        MVI@    R5,     R0                      ; 6E86   02A8
        MVO@    R0,     R4                      ; 6E87   0260
        MVI@    R5,     R0                      ; 6E88   02A8
        MVO@    R0,     R4                      ; 6E89   0260
        MVI@    R5,     R0                      ; 6E8A   02A8
        MVO@    R0,     R4                      ; 6E8B   0260
        MVI@    R5,     R0                      ; 6E8C   02A8
        MVO@    R0,     R4                      ; 6E8D   0260
        MVI@    R5,     R0                      ; 6E8E   02A8
        MVO@    R0,     R4                      ; 6E8F   0260
        DECR    R3                              ; 6E90   0013
        BNEQ    L_6E86                          ; 6E91   022C 000C

        MVII    #$0002, R0                      ; 6E93   02B8 0002
L_6E95:
        SLL     R2,     2                       ; 6E95   004E
        XORR    R0,     R2                      ; 6E96   01C2
        MVO     R2,     G_01CE                  ; 6E97   0242 01CE
        EIS                                     ; 6E99   0002
        J       .EXEC.14E                       ; 6E9A   0004 0310 014E

.GRAM_INIT_6E9D:
        DECLE   $0026           ; 6E9D  # of GRAM cards to init
        DECLE   $0081,  $0380   ; 6E9E  #00-07:  CART #00-07 --I-
        DECLE   $0091,  $0380   ; 6EA0  #08-0F:  CART #08-0F --I-
        DECLE   $00A1,  $0380   ; 6EA2  #10-17:  CART #10-17 --I-
        DECLE   $00B1,  $0100   ; 6EA4  #18-1A:  CART #18-1A --I-
        DECLE   $0037,  $0300   ; 6EA6  #1B-21:  CART #1B-21 ----
        DECLE   $0242           ; 6EA8  #22   :  CART #21    X---
        DECLE   $0142           ; 6EA9  #23   :  CART #21    -Y--
        DECLE   $0342           ; 6EAA  #24   :  CART #21    XY--
        DECLE   $003F,  $0030   ; 6EAB  #25-25:  GROM #5F-5F ----

L_6EAD:
        PSHR    R5                              ; 6EAD   0275

        JSR     R5,     L_671B                  ; 6EAE   0004 0164 031B

        MVI     G_0184, R0                      ; 6EB1   0280 0184
        MOVR    R0,     R1                      ; 6EB3   0081
        ANDI    #$0003, R1                      ; 6EB4   03B9 0003
        SLR     R0,     2                       ; 6EB6   0064
        CMPR    R0,     R1                      ; 6EB7   0141
        BNEQ    L_6F51                          ; 6EB8   020C 0097

        CLRR    R0                              ; 6EBA   01C0
        MVI     G_01A0, R1                      ; 6EBB   0281 01A0
        TSTR    R1                              ; 6EBD   0089
        BNEQ    L_6ED3                          ; 6EBE   020C 0013

        MVII    #$01E3, R5                      ; 6EC0   02BD 01E3
        SDBD                                    ; 6EC2   0001
        MVI@    R5,     R1                      ; 6EC3   02A9
        DECR    R0                              ; 6EC4   0010
        TSTR    R1                              ; 6EC5   0089
        BEQ     L_6F51                          ; 6EC6   0204 0089

        PSHR    R1                              ; 6EC8   0271
L_6EC9:
        INCR    R0                              ; 6EC9   0008
        SARC    R1,     1                       ; 6ECA   0079
        BNC     L_6EC9                          ; 6ECB   0229 0003

        MOVR    R0,     R1                      ; 6ECD   0081

        JSR     R5,     X_POW2                  ; 6ECE   0004 0114 0345

        COMR    R0                              ; 6ED1   0018
        AND@    R6,     R0                      ; 6ED2   03B0
L_6ED3:
        MVO     R0,     G_01E3                  ; 6ED3   0240 01E3
        SWAP    R0,     1                       ; 6ED5   0040
        MVO     R0,     G_01E4                  ; 6ED6   0240 01E4
        CMPI    #$0007, R1                      ; 6ED8   0379 0007
        BNEQ    L_6EE0                          ; 6EDA   020C 0004

        MVI     G_01CF, R2                      ; 6EDC   0282 01CF
        B       L_6EE7                          ; 6EDE   0200 0007

L_6EE0:
        CMPI    #$0004, R1                      ; 6EE0   0379 0004
        BNEQ    L_6EE8                          ; 6EE2   020C 0004

        MVI     G_01D0, R2                      ; 6EE4   0282 01D0
        PSHR    R2                              ; 6EE6   0272
L_6EE7:
        PSHR    R2                              ; 6EE7   0272
L_6EE8:
        SDBD                                    ; 6EE8   0001
        MVII    #$6F9F, R4                      ; 6EE9   02BC 009F 006F
        ADDR    R4,     R1                      ; 6EEC   00E1
        ADD@    R1,     R4                      ; 6EED   02CC
        MVI@    R4,     R0                      ; 6EEE   02A0
        CMPI    #$03FF, R0                      ; 6EEF   0378 03FF
        BEQ     L_6EFA                          ; 6EF1   0204 0007

        JSR     R5,     X_RAND2                 ; 6EF3   0004 0114 029E

        MOVR    R0,     R1                      ; 6EF6   0081
        ADDR    R4,     R1                      ; 6EF7   00E1
        MOVR    R1,     R4                      ; 6EF8   008C
        ADD@    R1,     R4                      ; 6EF9   02CC
L_6EFA:
        MVII    #$01D1, R3                      ; 6EFA   02BB 01D1
L_6EFC:
        MVI@    R4,     R1                      ; 6EFC   02A1
        CMPI    #$03FF, R1                      ; 6EFD   0379 03FF
        BEQ     L_6F3D                          ; 6EFF   0204 003C

        MVI@    R4,     R0                      ; 6F01   02A0
        MOVR    R0,     R2                      ; 6F02   0082
        INCR    R1                              ; 6F03   0009
        ADDR    R7,     R1                      ; 6F04   00F9
        ADD@    R1,     R7                      ; 6F05   02CF

        SETC                                    ; 6F06   0007
        INCR    R3                              ; 6F07   000B
        DIS                                     ; 6F08   0003
        MOVR    R4,     R2                      ; 6F09   00A2
        DECR    R4                              ; 6F0A   0014
        B       L_6F14                          ; 6F0B   0200 0007

        JSR     R5,     X_RAND2                 ; 6F0D   0004 0114 029E

        INCR    R7                              ; 6F10   000F

        PULR    R0                              ; 6F11   02B0
L_6F12:
        ADDR    R4,     R2                      ; 6F12   00E2
        ADDR    R0,     R4                      ; 6F13   00C4

L_6F14:
        JSR     R5,     L_6F28                  ; 6F14   0004 016C 0328

        TSTR    R0                              ; 6F17   0080
        BEQ     L_6F1E                          ; 6F18   0204 0004

L_6F1A:
        MOVR    R2,     R4                      ; 6F1A   0094
        B       L_6EFC                          ; 6F1B   0220 0020

L_6F1D:
        INCR    R4                              ; 6F1D   000C
L_6F1E:
        PSHR    R4                              ; 6F1E   0274

        JSR     R5,     L_6F28                  ; 6F1F   0004 016C 0328

        PULR    R4                              ; 6F22   02B4
        INCR    R0                              ; 6F23   0008
        BEQ     L_6F1A                          ; 6F24   0224 000B
        B       L_6F1D                          ; 6F26   0220 000A

L_6F28:
        PSHR    R5                              ; 6F28   0275
        MVI@    R4,     R0                      ; 6F29   02A0
        MOVR    R0,     R4                      ; 6F2A   0084
        SDBD                                    ; 6F2B   0001
        ADDI    #$6F12, R4                      ; 6F2C   02FC 0012 006F
        SDBD                                    ; 6F2F   0001
        MVI@    R4,     R1                      ; 6F30   02A1
        DECR    R0                              ; 6F31   0010
        BMI     L_6F3C                          ; 6F32   020B 0008

        MOVR    R1,     R0                      ; 6F34   0088
        BEQ     L_6F3C                          ; 6F35   0204 0005

        MVO@    R1,     R3                      ; 6F37   0259
        SWAP    R1,     1                       ; 6F38   0041
        INCR    R3                              ; 6F39   000B
        MVO@    R1,     R3                      ; 6F3A   0259
        INCR    R3                              ; 6F3B   000B
L_6F3C:
        PULR    R7                              ; 6F3C   02B7

L_6F3D:
        SDBD                                    ; 6F3D   0001
        MVII    #$DFF5, R0                      ; 6F3E   02B8 00F5 00DF
        MOVR    R3,     R4                      ; 6F41   009C
        MVO@    R0,     R4                      ; 6F42   0260
        SWAP    R0,     1                       ; 6F43   0040
        MVO@    R0,     R4                      ; 6F44   0260
        MVII    #$0002, R0                      ; 6F45   02B8 0002
        MVO@    R0,     R4                      ; 6F47   0260
        CLRR    R0                              ; 6F48   01C0
        MVO@    R0,     R4                      ; 6F49   0260
        MVO@    R0,     R4                      ; 6F4A   0260
        MVO@    R0,     R4                      ; 6F4B   0260
        MVII    #$01D1, R3                      ; 6F4C   02BB 01D1

        JSR     R5,     L_60E7                  ; 6F4E   0004 0160 00E7

L_6F51:
        PULR    R7                              ; 6F51   02B7

        ADDR    R7,     R0                      ; 6F52   00F8
        ADDR    R3,     R7                      ; 6F53   00DF

        DECLE   $0001,  $0000,  $0000           ; 6F54   0001 0000 0000

        ADDR    R2,     R0                      ; 6F57   00D0
        SLLC    R0,     2                       ; 6F58   005C
        ADDR    R2,     R0                      ; 6F59   00D0
        MOVR    R6,     R3                      ; 6F5A   00B3
        ADDR    R2,     R0                      ; 6F5B   00D0
        SARC    R2,     2                       ; 6F5C   007E
        ADDR    R2,     R1                      ; 6F5D   00D1
        ADDR    R0,     R7                      ; 6F5E   00C7

        DECLE   $00D1,  $0008,  $00D2,  $0060   ; 6F5F   00D1 0008 00D2 0060
        DECLE   $00D2,  $00A1,  $00D2,  $00EB   ; 6F63   00D2 00A1 00D2 00EB
        DECLE   $00D2,  $00A8,  $00D3,  $003B   ; 6F67   00D2 00A8 00D3 003B
        DECLE   $00D4,  $0005                   ; 6F6B   00D4 0005

        ADDR    R2,     R5                      ; 6F6D   00D5
        MOVR    R6,     R5                      ; 6F6E   00B5
        ADDR    R2,     R5                      ; 6F6F   00D5
        SLR     R1,     2                       ; 6F70   0065
        ADDR    R2,     R7                      ; 6F71   00D7

        DECLE   $00FF                           ; 6F72   00FF

        ADDR    R2,     R7                      ; 6F73   00D7

        MOVR    R0,     R1                      ; 6F74   0081
        ADDR    R3,     R0                      ; 6F75   00D8
        ADDR    R5,     R4                      ; 6F76   00EC
        ADDR    R3,     R0                      ; 6F77   00D8
        MOVR    R0,     R3                      ; 6F78   0083
        ADDR    R3,     R1                      ; 6F79   00D9
        SLR     R2,     1                       ; 6F7A   0062
        ADDR    R3,     R3                      ; 6F7B   00DB
        MOVR    R1,     R7                      ; 6F7C   008F

        DECLE   $00DC,  $0020,  $00DA,  $0083   ; 6F7D   00DC 0020 00DA 0083
        DECLE   $00DA,  $0052,  $00DD,  $00D4   ; 6F81   00DA 0052 00DD 00D4
        DECLE   $00DD,  $00F9,  $00DA,  $0000   ; 6F85   00DD 00F9 00DA 0000
        DECLE   $0000,  $0042,  $0060,  $0062   ; 6F89   0000 0042 0060 0062
        DECLE   $0000,  $0000,  $004C,  $004E   ; 6F8D   0000 0000 004C 004E
        DECLE   $0000,  $0000,  $0044,  $004E   ; 6F91   0000 0000 0044 004E
        DECLE   $0000,  $0000,  $0050,  $0052   ; 6F95   0000 0000 0050 0052
        DECLE   $0040,  $0000,  $0000,  $0044   ; 6F99   0040 0000 0000 0044
        DECLE   $0052,  $0000,  $000A,  $0025   ; 6F9D   0052 0000 000A 0025
        DECLE   $0013,  $001C,  $002A,  $001F   ; 6FA1   0013 001C 002A 001F
        DECLE   $004B,  $003E,  $0054,  $0039   ; 6FA5   004B 003E 0054 0039
        DECLE   $03FF,  $0002,  $005A,  $0002   ; 6FA9   03FF 0002 005A 0002
        DECLE   $0040,  $0000,  $0002,  $0058   ; 6FAD   0040 0000 0002 0058
        DECLE   $0062,  $03FF,  $0002,  $0056   ; 6FB1   0062 03FF 0002 0056
        DECLE   $0002,  $0040,  $0000,  $0002   ; 6FB5   0002 0040 0000 0002
        DECLE   $0058,  $0062,  $03FF,  $0002   ; 6FB9   0058 0062 03FF 0002
        DECLE   $005C,  $03FF,  $0000,  $0003   ; 6FBD   005C 03FF 0000 0003
        DECLE   $0000,  $007B,  $0048,  $03FF   ; 6FC1   0000 007B 0048 03FF
        DECLE   $0002,  $0042,  $0002,  $0054   ; 6FC5   0002 0042 0002 0054
        DECLE   $03FF,  $0001,  $0002,  $0042   ; 6FC9   03FF 0001 0002 0042
        DECLE   $0066,  $0002,  $0060,  $0002   ; 6FCD   0066 0002 0060 0002
        DECLE   $0040,  $0001,  $0002,  $005E   ; 6FD1   0040 0001 0002 005E
        DECLE   $0064,  $0002,  $005A,  $03FF   ; 6FD5   0064 0002 005A 03FF
        DECLE   $0000,  $0002,  $0076,  $0000   ; 6FD9   0000 0002 0076 0000
        DECLE   $03FF,  $0000,  $0002,  $0068   ; 6FDD   03FF 0000 0002 0068
        DECLE   $006A,  $0001,  $0004,  $0072   ; 6FE1   006A 0001 0004 0072
        DECLE   $006E,  $006C,  $0070,  $0002   ; 6FE5   006E 006C 0070 0002
        DECLE   $0074,  $03FF,  $0000,  $0005   ; 6FE9   0074 03FF 0000 0005
        DECLE   $007F,  $0066,  $0000,  $0083   ; 6FED   007F 0066 0000 0083
        DECLE   $0088,  $03FF,  $0002,  $0002   ; 6FF1   0088 03FF 0002 0002
        DECLE   $0008,  $0000                   ; 6FF5   0008 0000

        DIS                                     ; 6FF7   0003
        SWAP    R0,     2                       ; 6FF8   0044
        MOVR    R0,     R3                      ; 6FF9   0083
        MOVR    R1,     R0                      ; 6FFA   0088
        EIS                                     ; 6FFB   0002
        SLL     R2,     1                       ; 6FFC   004A
        EIS                                     ; 6FFD   0002
        SWAP    R2,     2                       ; 6FFE   0046
        DECLE   $03FF                           ; 6FFF   03FF

        ORG     $D000

        SLLC    R3,     1                       ; D000   005B
        COMR    R0                              ; D001   0018
        SUBR    R1,     R5                      ; D002   010D
        CMPR    R6,     R0                      ; D003   0170
        ADDR    R7,     R6                      ; D004   00FE
        ADDR    R0,     R7                      ; D005   00C7

        CMPR    R0,     R3                      ; D006   0143
        XOR@    R3,     R5                      ; D007   03DD
        MVI@    R1,     R5                      ; D008   028D
        CMPR    R5,     R7                      ; D009   016F
        ANDR    R3,     R4                      ; D00A   019C
        MVI@    R3,     R4                      ; D00B   029C
        XOR@    R6,     R0                      ; D00C   03F0
        ADDR    R3,     R7                      ; D00D   00DF

        RRC     R2,     2                       ; D00E   0076
        SUBR    R7,     R6                      ; D00F   013E
        TSTR    R0                              ; D010   0080
        MOVR    R1,     R4                      ; D011   008C
        ADDR    R0,     R6                      ; D012   00C6
        AND@    R1,     R5                      ; D013   038D
L_D014:
        XORR    R2,     R4                      ; D014   01D4
        DECLE   $02FD,  $00C7,  $02A3,  $000A   ; D015   02FD 00C7 02A3 000A
        DECLE   $0108,  $028D,  $0094,  $036F   ; D019   0108 028D 0094 036F
        DECLE   $0000,  $0000,  $0002,  $0217   ; D01D   0000 0000 0002 0217
        DECLE   $0190,  $03CC,  $038C,  $00FF   ; D021   0190 03CC 038C 00FF
        DECLE   $0078,  $03A3,  $0301,  $01D7   ; D025   0078 03A3 0301 01D7
        DECLE   $0397                           ; D029   0397

        AND@    R1,     R4                      ; D02A   038C
        ANDR    R1,     R2                      ; D02B   018A
        SUB     .BTAB.86,R6                     ; D02C   0306 0286
        SUB@    R4,     R2                      ; D02E   0322
        MVI@    R3,     R7                      ; D02F   029F

        DECLE   $005E,  $01EB,  $01AD,  $0268   ; D030   005E 01EB 01AD 0268
        DECLE   $03CB,  $0057,  $0068,  $01F9   ; D034   03CB 0057 0068 01F9
        DECLE   $009A,  $0187,  $01B6,  $010D   ; D038   009A 0187 01B6 010D
        DECLE   $0167,  $02FE,  $0104,  $0343   ; D03C   0167 02FE 0104 0343
        DECLE   $02FE,  $01EA,  $02AE,  $01AD   ; D040   02FE 01EA 02AE 01AD
        DECLE   $03DE,  $038A,  $005F,  $0036   ; D044   03DE 038A 005F 0036
        DECLE   $01CD,  $003E,  $01AC,  $03AD   ; D048   01CD 003E 01AC 03AD
        DECLE   $01FD,  $0062,  $0100,  $001E   ; D04C   01FD 0062 0100 001E
        DECLE   $0006,  $0034,  $037A,  $0284   ; D050   0006 0034 037A 0284
        DECLE   $0000,  $0044,  $004D,  $00F8   ; D054   0000 0044 004D 00F8
        DECLE   $03F8,  $007D,  $000E,  $0000   ; D058   03F8 007D 000E 0000
        DECLE   $0056,  $0318,  $0089,  $0000   ; D05C   0056 0318 0089 0000
        DECLE   $00BA,  $00A0,  $0230,  $01B6   ; D060   00BA 00A0 0230 01B6
        DECLE   $015C,  $0380,  $03E0,  $0039   ; D064   015C 0380 03E0 0039
        DECLE   $026A,  $0313,  $0099,  $0248   ; D068   026A 0313 0099 0248
        DECLE   $0022,  $027D,  $02F5,  $024D   ; D06C   0022 027D 02F5 024D
        DECLE   $01AA,  $01F3,  $012E,  $02BF   ; D070   01AA 01F3 012E 02BF
        DECLE   $02C0,  $03BC,  $01FE,  $00C2   ; D074   02C0 03BC 01FE 00C2
        DECLE   $0103,  $026D,  $0192,  $0391   ; D078   0103 026D 0192 0391
        DECLE   $020D,  $0392,  $01DD,  $0070   ; D07C   020D 0392 01DD 0070
        DECLE   $0256,  $02AA,  $02F3,  $012E   ; D080   0256 02AA 02F3 012E
        DECLE   $0141,  $03D2,  $0310,  $02CB   ; D084   0141 03D2 0310 02CB
        DECLE   $02F9,  $01B3,  $026F,  $023B   ; D088   02F9 01B3 026F 023B
        DECLE   $0029,  $0248,  $019E,  $00F8   ; D08C   0029 0248 019E 00F8
        DECLE   $0366,  $0271,  $022F,  $0109   ; D090   0366 0271 022F 0109
        DECLE   $03C0,  $0103,  $0300,  $008A   ; D094   03C0 0103 0300 008A
        DECLE   $01BC,  $0363,  $0142,  $027F   ; D098   01BC 0363 0142 027F
        DECLE   $0071,  $0311,  $02AB,  $023C   ; D09C   0071 0311 02AB 023C
        DECLE   $01F3,  $006B,  $01BA,  $03EA   ; D0A0   01F3 006B 01BA 03EA
        DECLE   $0023,  $03A3,  $00F8,  $03A2   ; D0A4   0023 03A3 00F8 03A2
        DECLE   $0269,  $022C,  $027F,  $0034   ; D0A8   0269 022C 027F 0034
        DECLE   $01C0,  $0008,  $03FA,  $028F   ; D0AC   01C0 0008 03FA 028F
        DECLE   $02FC,  $030F,  $0001,  $00CA   ; D0B0   02FC 030F 0001 00CA
        DECLE   $0118,  $03CD,  $00E6,  $00FD   ; D0B4   0118 03CD 00E6 00FD
        DECLE   $0187,  $0094,  $034E,  $017B   ; D0B8   0187 0094 034E 017B
        DECLE   $0161,  $019F,  $01DE,  $0227   ; D0BC   0161 019F 01DE 0227
        DECLE   $00E0,  $007A,  $03ED,  $0219   ; D0C0   00E0 007A 03ED 0219
        DECLE   $013F                           ; D0C4   013F

        MOVR    R4,     R5                      ; D0C5   00A5
        CMP@    R1,     R5                      ; D0C6   034D
        CMPR    R0,     R2                      ; D0C7   0142
        XORR    R7,     R1                      ; D0C8   01F9
        ADD     G_00C3, R7                      ; D0C9   02C7 00C3
        SUB@    R3,     R7                      ; D0CB   031F

        DECLE   $01EC,  $004A,  $01B5,  $0268   ; D0CC   01EC 004A 01B5 0268
        DECLE   $0349,  $00F7,  $0258,  $01EF   ; D0D0   0349 00F7 0258 01EF
        DECLE   $0099,  $01AB,  $029C,  $03CC   ; D0D4   0099 01AB 029C 03CC
        DECLE   $00CA,  $01FF,  $0343,  $0222   ; D0D8   00CA 01FF 0343 0222
        DECLE   $03BF                           ; D0DC   03BF

        CMP@    R4,     R2                      ; D0DD   0362
        CMP@    R4,     R7                      ; D0DE   0367
        ANDR    R4,     R5                      ; D0DF   01A5
        CMP@    R5,     R0                      ; D0E0   0368
        XOR@    R5,     R0                      ; D0E1   03E8
        SAR     R3,     2                       ; D0E2   006F
        MVO@    R2,     R5                      ; D0E3   026A
        XORI    #$005B, R0                      ; D0E4   03F8 005B
        ADDR    R2,     R7                      ; D0E6   00D7

        DECLE   $00C3,  $0065,  $001E,  $0010   ; D0E7   00C3 0065 001E 0010
        DECLE   $0010,  $0011,  $00CB,  $014D   ; D0EB   0010 0011 00CB 014D
        DECLE   $00FF,  $03FF                   ; D0EF   00FF 03FF

        CMPR    R0,     R5                      ; D0F1   0145
        CMP@    R2,     R3                      ; D0F2   0353
        SUB@    R1,     R6                      ; D0F3   030E
        ADD@    R5,     R4                      ; D0F4   02EC
        XORR    R5,     R1                      ; D0F5   01E9
        ANDR    R4,     R5                      ; D0F6   01A5
        CMP@    R5,     R2                      ; D0F7   036A
        ADDR    R0,     R7                      ; D0F8   00C7

        DECLE   $00A8,  $0256,  $01EA,  $0213   ; D0F9   00A8 0256 01EA 0213
        DECLE   $0187                           ; D0FD   0187

        MVI@    R4,     R3                      ; D0FE   02A3
        XORR    R1,     R5                      ; D0FF   01CD
        ADDR    R5,     R5                      ; D100   00ED
        CLRC                                    ; D101   0006
        ADDR    R0,     R7                      ; D102   00C7

        ADDR    R0,     R3                      ; D103   00C3
        CMPI    #$02F9, R6                      ; D104   037E 02F9
        CMPR    R1,     R0                      ; D106   0148
        ANDR    R5,     R5                      ; D107   01AD
        COMR    R2                              ; D108   001A
        MOVR    R0,     R7                      ; D109   0087

        DECLE   $0128,  $0278                   ; D10A   0128 0278

        XORR    R1,     R5                      ; D10C   01CD
        MVI     G_019F, R0                      ; D10D   0280 019F
        AND@    R2,     R0                      ; D10F   0390
        XORR    R1,     R4                      ; D110   01CC
        CMPR    R2,     R0                      ; D111   0150
        ADDR    R7,     R5                      ; D112   00FD
        MOVR    R0,     R7                      ; D113   0087

        SUBR    R6,     R3                      ; D114   0133
        SUB@    R5,     R6                      ; D115   032E
        SUB     G_0069, R1                      ; D116   0301 0069
        ANDR    R3,     R5                      ; D118   019D
        MVI@    R3,     R0                      ; D119   0298
        ADD@    R5,     R1                      ; D11A   02E9
        SUBR    R4,     R7                      ; D11B   0127

        DECLE   $0054,  $03BA,  $013E,  $016C   ; D11C   0054 03BA 013E 016C
        DECLE   $0399,  $003D,  $0211,  $0014   ; D120   0399 003D 0211 0014
        DECLE   $0000,  $0000,  $0000,  $020C   ; D124   0000 0000 0000 020C
        DECLE   $02A5,  $0000,  $0254,  $0110   ; D128   02A5 0000 0254 0110
        DECLE   $00FC,  $01F8,  $0309,  $0001   ; D12C   00FC 01F8 0309 0001
        DECLE   $0098,  $000E,  $0250,  $01F0   ; D130   0098 000E 0250 01F0
        DECLE   $031B,  $01E6,  $01F4,  $028B   ; D134   031B 01E6 01F4 028B
        DECLE   $0366,  $027E,  $01E1,  $0096   ; D138   0366 027E 01E1 0096
        DECLE   $035A,  $03D8,  $038D,  $017F   ; D13C   035A 03D8 038D 017F
        DECLE   $00F8,  $03D7,  $0238,  $028E   ; D140   00F8 03D7 0238 028E
        DECLE   $0162,  $029B,  $019E,  $03FE   ; D144   0162 029B 019E 03FE
        DECLE   $020A,  $0086,  $01DF,  $02D1   ; D148   020A 0086 01DF 02D1
        DECLE   $02D5,  $035B,  $03DC,  $014C   ; D14C   02D5 035B 03DC 014C
        DECLE   $01D0,  $0114,  $03E7,  $0232   ; D150   01D0 0114 03E7 0232

        AND@    R6,     R6                      ; D154   03B6
        CMPR    R4,     R2                      ; D155   0162
        CMP@    R1,     R3                      ; D156   034B
        MVO@    R5,     R2                      ; D157   0255
        SUB@    R4,     R3                      ; D158   0323
        CMPI    #$0207, R5                      ; D159   037D 0207
        SAR     R1,     2                       ; D15B   006D
        MVI@    R3,     R2                      ; D15C   029A
        MVI@    R3,     R6                      ; D15D   029E
        XORR    R7,     R4                      ; D15E   01FC
        MVI@    R1,     R6                      ; D15F   028E
        MVO@    R0,     R1                      ; D160   0248
        SUB@    R3,     R7                      ; D161   031F

        DECLE   $02D9,  $035E,  $033B,  $02D4   ; D162   02D9 035E 033B 02D4
        DECLE   $029A,  $02BF,  $0114,  $03DB   ; D166   029A 02BF 0114 03DB
        DECLE   $03B1,  $0376,  $0180,  $0399   ; D16A   03B1 0376 0180 0399
        DECLE   $0045,  $03FB,  $0289,  $0008   ; D16E   0045 03FB 0289 0008
        DECLE   $00FF                           ; D172   00FF

        ADDR    R4,     R5                      ; D173   00E5
        SUB@    R3,     R3                      ; D174   031B
        AND@    R3,     R3                      ; D175   039B
        MOVR    R4,     R7                      ; D176   00A7

        INCR    R6                              ; D177   000E
        TSTR    R0                              ; D178   0080
        ANDR    R6,     R3                      ; D179   01B3
        AND     G_0065, R6                      ; D17A   0386 0065
        SUB@    R1,     R7                      ; D17C   030F

        DECLE   $0001,  $0048,  $0218,  $0089   ; D17D   0001 0048 0218 0089
        DECLE   $0000,  $0097,  $039A,  $01E7   ; D181   0000 0097 039A 01E7
        DECLE   $03B2,  $0292,  $0001,  $0152   ; D185   03B2 0292 0001 0152
        DECLE   $003A,  $0370,  $0370,  $0334   ; D189   003A 0370 0370 0334
        DECLE   $0057,  $03D5,  $0015,  $008D   ; D18D   0057 03D5 0015 008D
        DECLE   $003E,  $0382,  $02AD,  $0274   ; D191   003E 0382 02AD 0274
        DECLE   $0331,  $03A4,  $0102,  $0110   ; D195   0331 03A4 0102 0110
        DECLE   $03BE,  $025B,  $028B,  $027D   ; D199   03BE 025B 028B 027D

        SUBR    R6,     R5                      ; D19D   0135
        ADCR    R3                              ; D19E   002B
        XOR@    R3,     R5                      ; D19F   03DD
        SUBR    R3,     R7                      ; D1A0   011F

        DECLE   $0306,  $03AF,  $0217,  $032D   ; D1A1   0306 03AF 0217 032D
        DECLE   $0294,  $0161,  $0321,  $03FD   ; D1A5   0294 0161 0321 03FD
        DECLE   $00D0,  $01FC,  $00FF,  $03B0   ; D1A9   00D0 01FC 00FF 03B0
        DECLE   $02F8,  $0034,  $001B,  $03E5   ; D1AD   02F8 0034 001B 03E5
        DECLE   $021E,  $02C6,  $02F9,  $038B   ; D1B1   021E 02C6 02F9 038B
        DECLE   $029E,  $0277,  $00DC,  $03E0   ; D1B5   029E 0277 00DC 03E0
        DECLE   $0081,  $01F9,  $0185,  $0292   ; D1B9   0081 01F9 0185 0292
        DECLE   $02F9,  $0322,  $027B,  $01A0   ; D1BD   02F9 0322 027B 01A0
        DECLE   $025A,  $0201,  $0200,  $0285   ; D1C1   025A 0201 0200 0285
        DECLE   $00E1,  $0000                   ; D1C5   00E1 0000

        SWAP    R0,     1                       ; D1C7   0040
        COMR    R0                              ; D1C8   0018
        CMPR    R1,     R5                      ; D1C9   014D
        ADDR    R2,     R7                      ; D1CA   00D7

        DECLE   $01FB,  $0147,  $0094,  $00FF   ; D1CB   01FB 0147 0094 00FF
        DECLE   $0066,  $03C5,  $019E,  $01EE   ; D1CF   0066 03C5 019E 01EE
        DECLE   $03C8,  $00F7,  $0056,  $03F2   ; D1D3   03C8 00F7 0056 03F2
        DECLE   $0214,  $0187                   ; D1D7   0214 0187

        MVI@    R3,     R6                      ; D1D9   029E
        XORR    R1,     R5                      ; D1DA   01CD
        ADDR    R4,     R7                      ; D1DB   00E7

        DECLE   $02FD,  $0347,  $0243,  $02EF   ; D1DC   02FD 0347 0243 02EF
        DECLE   $03EC,  $016E,  $01AD,  $03EA   ; D1E0   03EC 016E 01AD 03EA
        DECLE   $00A6,  $00E8,  $0034,  $03F9   ; D1E4   00A6 00E8 0034 03F9
        DECLE   $0196,  $01CF,  $03AF,  $0065   ; D1E8   0196 01CF 03AF 0065
        DECLE   $0000                           ; D1EC   0000

        SUBR    R1,     R6                      ; D1ED   010E
        CMP@    R2,     R3                      ; D1EE   0353
        ADD@    R6,     R0                      ; D1EF   02F0
        CMP@    R1,     R6                      ; D1F0   034E
        XOR@    R4,     R5                      ; D1F1   03E5
        SUBR    R3,     R4                      ; D1F2   011C
        ADDR    R7,     R2                      ; D1F3   00FA
        SLLC    R1,     1                       ; D1F4   0059
        SUB     G_0034, R7                      ; D1F5   0307 0034

        XOR@    R1,     R5                      ; D1F7   03CD
        SUBR    R1,     R2                      ; D1F8   010A
        ADDR    R7,     R3                      ; D1F9   00FB
        ANDR    R0,     R5                      ; D1FA   0185
        MOVR    R6,     R4                      ; D1FB   00B4
        ADCR    R6                              ; D1FC   002E
        XOR@    R6,     R6                      ; D1FD   03F6
        AND@    R5,     R3                      ; D1FE   03AB
        XOR     G_0047, R5                      ; D1FF   03C5 0047
        CLRC                                    ; D201   0006
        MOVR    R7,     R0                      ; D202   00B8
        SUBR    R0,     R1                      ; D203   0101
L_D204:
        EIS                                     ; D204   0002
        DECLE   $0222,  $0387,  $0000,  $0057   ; D205   0222 0387 0000 0057
        DECLE   $0318,  $038C,  $018A,  $0106   ; D209   0318 038C 018A 0106
        DECLE   $0147,  $0213,  $03BF           ; D20D   0147 0213 03BF

        XOR@    R4,     R6                      ; D210   03E6
        ANDR    R5,     R3                      ; D211   01AB
        ANDR    R1,     R5                      ; D212   018D
        XOR@    R3,     R0                      ; D213   03D8
        XOR@    R1,     R4                      ; D214   03CC
        MOVR    R1,     R7                      ; D215   008F

        DECLE   $025C,  $019F,  $03D1,  $001E   ; D216   025C 019F 03D1 001E
        DECLE   $00EC,  $034D,  $019E,  $0205   ; D21A   00EC 034D 019E 0205
        DECLE   $0342,  $02F2,  $000C,  $02FA   ; D21E   0342 02F2 000C 02FA
        DECLE   $0388,  $0195,  $00C8,  $006D   ; D222   0388 0195 00C8 006D
        DECLE   $0120,  $0222,  $01EC,  $0057   ; D226   0120 0222 01EC 0057
        DECLE   $0123,  $02AB,  $0264,  $0020   ; D22A   0123 02AB 0264 0020
        DECLE   $0022,  $03C9,  $0304,  $02AB   ; D22E   0022 03C9 0304 02AB
        DECLE   $0064,  $00FE,  $007E,  $0048   ; D232   0064 00FE 007E 0048
        DECLE   $010C,  $020F,  $03E4,  $00C1   ; D236   010C 020F 03E4 00C1
        DECLE   $01E0,  $003B,  $020F,  $021E   ; D23A   01E0 003B 020F 021E
        DECLE   $02A4,  $00F8,  $0000,  $0001   ; D23E   02A4 00F8 0000 0001
        DECLE   $021E                           ; D242   021E

        BUSC    L_D591                          ; D243   0207 034C

        ANDR    R0,     R1                      ; D245   0181
        XORR    R7,     R6                      ; D246   01FE
        CMP@    R1,     R1                      ; D247   0349
        ADD     .STIC.Y.4,R3                    ; D248   02C3 000C
        SUBR    R0,     R2                      ; D24A   0102
        CLRR    R5                              ; D24B   01ED
        ANDR    R1,     R4                      ; D24C   018C
        MOVR    R5,     R0                      ; D24D   00A8
        MVI@    R5,     R5                      ; D24E   02AD
        ADDR    R4,     R7                      ; D24F   00E7

        DECLE   $028A,  $019C,  $0040,  $0190   ; D250   028A 019C 0040 0190
        DECLE   $0292,  $014C,  $01B1,  $0000   ; D254   0292 014C 01B1 0000

        SUBR    R0,     R7                      ; D258   0107

        CMP@    R6,     R3                      ; D259   0373
        SUB@    R1,     R7                      ; D25A   030F

        DECLE   $0064,  $03EB,  $03BC,  $01C3   ; D25B   0064 03EB 03BC 01C3
        DECLE   $0000                           ; D25F   0000

        SWAP    R0,     1                       ; D260   0040
        COMR    R0                              ; D261   0018
        AND@    R1,     R5                      ; D262   038D
        XORR    R6,     R5                      ; D263   01F5
        DIS                                     ; D264   0003
        SUB     G_03A2, R7                      ; D265   0307 03A2

        DECLE   $03FB,  $0009,  $036C,  $01AC   ; D267   03FB 0009 036C 01AC
        DECLE   $03BC,  $014C,  $00F0,  $0266   ; D26B   03BC 014C 00F0 0266
        DECLE   $0000,  $03D3,  $016E,  $03A0   ; D26F   0000 03D3 016E 03A0
        DECLE   $03CC,  $0181,  $01FB,  $0305   ; D273   03CC 0181 01FB 0305
        DECLE   $01C2,  $001B,  $0306,  $03AB   ; D277   01C2 001B 0306 03AB
        DECLE   $01AC,  $035A,  $000A,  $00D8   ; D27B   01AC 035A 000A 00D8
        DECLE   $025A,  $0004,  $03DA,  $018A   ; D27F   025A 0004 03DA 018A
        DECLE   $01A1,  $010D,  $0133,  $0106   ; D283   01A1 010D 0133 0106
        DECLE   $00C9,  $0212,  $037F,  $0360   ; D287   00C9 0212 037F 0360
        DECLE   $01EA,  $00AD,  $0361,  $0041   ; D28B   01EA 00AD 0361 0041
        DECLE   $011C,  $003E,  $01E9,  $00A9   ; D28F   011C 003E 01E9 00A9
        DECLE   $0357,  $01C7,  $0220,  $03E0   ; D293   0357 01C7 0220 03E0
        DECLE   $0020,  $03DE,  $0245,  $000B   ; D297   0020 03DE 0245 000B
        DECLE   $03A8,  $00E0,  $01C1,  $0232   ; D29B   03A8 00E0 01C1 0232
        DECLE   $0387,  $0000,  $0049,  $0218   ; D29F   0387 0000 0049 0218

        ANDR    R1,     R5                      ; D2A3   018D
        ADDR    R3,     R7                      ; D2A4   00DF

        DECLE   $0101,  $0345,  $01B2,  $026F   ; D2A5   0101 0345 01B2 026F
        DECLE   $00F0,  $01CD,  $00BD,  $0041   ; D2A9   00F0 01CD 00BD 0041
        DECLE   $0001,  $0104,  $03DF           ; D2AD   0001 0104 03DF

        SUB@    R1,     R7                      ; D2B0   030F

        ANDR    R6,     R1                      ; D2B1   01B1
        ADDR    R3,     R6                      ; D2B2   00DE
        MVI     G_0048, R7                      ; D2B3   0287 0048

        DECLE   $004A,  $03F3,  $0194,  $01EF   ; D2B5   004A 03F3 0194 01EF
        DECLE   $03B6,  $0025,  $0002,  $0012   ; D2B9   03B6 0025 0002 0012
        DECLE   $0038,  $03E7                   ; D2BD   0038 03E7

        XORR    R7,     R6                      ; D2BF   01FE
        AND@    R1,     R5                      ; D2C0   038D
        SUBR    R0,     R2                      ; D2C1   0102
        SUBR    R2,     R5                      ; D2C2   0115
        INCR    R1                              ; D2C3   0009
        CMP@    R4,     R1                      ; D2C4   0361
        SUB@    R3,     R7                      ; D2C5   031F

        DECLE   $0264,  $026D,  $01AD,  $00CE   ; D2C6   0264 026D 01AD 00CE
        DECLE   $0369,  $00B7,  $004A,  $0387   ; D2CA   0369 00B7 004A 0387
        DECLE   $00BE,  $01AC,  $03AC,  $014C   ; D2CE   00BE 01AC 03AC 014C
        DECLE   $0122,  $0115,  $0249,  $0041   ; D2D2   0122 0115 0249 0041
        DECLE   $038F,  $00DE,  $006C,  $01B5   ; D2D6   038F 00DE 006C 01B5
        DECLE   $03BA,  $01A8,  $0098,  $0068   ; D2DA   03BA 01A8 0098 0068
        DECLE   $03E8,  $03D8,  $018A,  $02A0   ; D2DE   03E8 03D8 018A 02A0
        DECLE   $027D,  $0072,  $0000,  $0126   ; D2E2   027D 0072 0000 0126
        DECLE   $0045,  $0258,  $00F0,  $001C   ; D2E6   0045 0258 00F0 001C
        DECLE   $0000,  $00BC,  $0118,  $038D   ; D2EA   0000 00BC 0118 038D
        DECLE   $0125,  $03FE,  $037E,  $01B2   ; D2EE   0125 03FE 037E 01B2
        DECLE   $004D,  $008C,  $030C,  $01AC   ; D2F2   004D 008C 030C 01AC
        DECLE   $03F6,  $00A8,  $00D8,  $026E   ; D2F6   03F6 00A8 00D8 026E
        DECLE   $03DB,  $0214,  $0187           ; D2FA   03DB 0214 0187

        MVI@    R5,     R0                      ; D2FD   02A8
        ADD@    R1,     R4                      ; D2FE   02CC
        ADDR    R2,     R7                      ; D2FF   00D7

        DECLE   $030C,  $0186,  $0393,  $01FE   ; D300   030C 0186 0393 01FE
        DECLE   $03F2,  $00AE,  $00BD,  $03C1   ; D304   03F2 00AE 00BD 03C1
        DECLE   $0200,  $0100,  $0002,  $0020   ; D308   0200 0100 0002 0020
        DECLE   $00B0,  $0001,  $0041,  $013C   ; D30C   00B0 0001 0041 013C
        DECLE   $0180,  $03B0,  $00B8,  $0019   ; D310   0180 03B0 00B8 0019
        DECLE   $0006,  $00EB,  $0162,  $0390   ; D314   0006 00EB 0162 0390
        DECLE   $00B0,  $001F,  $0382,  $031F   ; D318   00B0 001F 0382 031F
        DECLE   $0361,  $03C0,  $01AE,  $036C   ; D31C   0361 03C0 01AE 036C
        DECLE   $01A6,  $0120,  $005A,  $01FE   ; D320   01A6 0120 005A 01FE
        DECLE   $028C,  $01E7,  $0293,  $0264   ; D324   028C 01E7 0293 0264
        DECLE   $0007,  $0292,  $003F,  $011C   ; D328   0007 0292 003F 011C
        DECLE   $0016,  $03A5,  $00FF,  $0080   ; D32C   0016 03A5 00FF 0080
        DECLE   $03C9,  $00FC,  $031E,  $018C   ; D330   03C9 00FC 031E 018C
        DECLE   $0125,  $0305,  $0288,  $0072   ; D334   0125 0305 0288 0072
        DECLE   $03AE,  $017F,  $036B,  $01A4   ; D338   03AE 017F 036B 01A4
        DECLE   $029C,  $0189,  $0128,  $0276   ; D33C   029C 0189 0128 0276
        DECLE   $01CB,  $02FF                   ; D340   01CB 02FF

        CMPR    R2,     R3                      ; D342   0153
        MVI@    R3,     R7                      ; D343   029F

        DECLE   $010C,  $0161,  $03EB,  $0102   ; D344   010C 0161 03EB 0102
        DECLE   $01A3,  $002A,  $0178,  $03C1   ; D348   01A3 002A 0178 03C1
        DECLE   $0198,  $00CE,  $01AA,  $0120   ; D34C   0198 00CE 01AA 0120
        DECLE   $027C                           ; D350   027C

        XORR    R4,     R5                      ; D351   01E5
        ADDR    R0,     R7                      ; D352   00C7
        MOVR    R5,     R7                      ; D353   00AF

        DECLE   $01D9,  $03CC,  $00F6,  $020D   ; D354   01D9 03CC 00F6 020D
        DECLE   $0186,  $03F4,  $011E,  $02F2   ; D358   0186 03F4 011E 02F2
        DECLE   $03EB,  $01B4,  $01F6,  $01A7   ; D35C   03EB 01B4 01F6 01A7

        ADDR    R4,     R0                      ; D360   00E0
        MVO@    R6,     R2                      ; D361   0256
        XOR@    R3,     R5                      ; D362   03DD
        MVO@    R2,     R1                      ; D363   024A
        CMPR    R5,     R7                      ; D364   016F
        MVI@    R4,     R4                      ; D365   02A4
        SUB@    R4,     R4                      ; D366   0324
        ADDR    R4,     R1                      ; D367   00E1
        SARC    R0,     2                       ; D368   007C
        RRC     R3,     2                       ; D369   0077
        SUB     G_034E, R5                      ; D36A   0305 034E
        SUBR    R4,     R5                      ; D36C   0125
        ADDR    R4,     R6                      ; D36D   00E6
        CMPR    R6,     R0                      ; D36E   0170
        GSWD    R1                              ; D36F   0031
        SUB@    R4,     R0                      ; D370   0320
        CMP@    R3,     R4                      ; D371   035C
        XORR    R1,     R4                      ; D372   01CC
        SUBR    R2,     R7                      ; D373   0117

        DECLE   $0004                           ; D374   0004

        CMPR    R0,     R5                      ; D375   0145
        MOVR    R4,     R3                      ; D376   00A3
        CMPR    R5,     R7                      ; D377   016F
        XORR    R6,     R2                      ; D378   01F2
        CMPR    R5,     R4                      ; D379   016C
        MOVR    R7,     R5                      ; D37A   00BD
        MOVR    R3,     R7                      ; D37B   009F

        DECLE   $0000                           ; D37C   0000

        SUB     G_0061, R4                      ; D37D   0304 0061
        CMP@    R2,     R0                      ; D37F   0350
        ANDR    R3,     R6                      ; D380   019E
        MVO@    R2,     R5                      ; D381   026A
        AND@    R1,     R1                      ; D382   0389
        MOVR    R5,     R7                      ; D383   00AF

        DECLE   $026C,  $03E4,  $0248,  $0173   ; D384   026C 03E4 0248 0173
        DECLE   $03AC,  $0025,  $01E7,  $0000   ; D388   03AC 0025 01E7 0000
        DECLE   $0050,  $0201,  $02B3,  $0264   ; D38C   0050 0201 02B3 0264
        DECLE   $000E,  $038E,  $0008,  $02FD   ; D390   000E 038E 0008 02FD
        DECLE   $01E8,  $018D,  $01D2,  $03FE   ; D394   01E8 018D 01D2 03FE
        DECLE   $0102,  $0233,  $001F,  $01FC   ; D398   0102 0233 001F 01FC
        DECLE   $034D,  $018C,  $023C,  $0170   ; D39C   034D 018C 023C 0170
        DECLE   $0088,  $006A,  $01F5,  $0246   ; D3A0   0088 006A 01F5 0246
        DECLE   $01B3,  $0197,  $0038,  $0000   ; D3A4   01B3 0197 0038 0000
        DECLE   $0092,  $0310,  $0189,  $0001   ; D3A8   0092 0310 0189 0001
        DECLE   $0086,  $011B,  $01A0,  $03EA   ; D3AC   0086 011B 01A0 03EA
        DECLE   $0346,  $0120,  $0204,  $01D5   ; D3B0   0346 0120 0204 01D5
        DECLE   $0259,  $00D2,  $027B,  $0132   ; D3B4   0259 00D2 027B 0132
        DECLE   $00D0,  $0102,  $01EA,  $01AA   ; D3B8   00D0 0102 01EA 01AA
        DECLE   $0273,  $013B,  $0099,  $027A   ; D3BC   0273 013B 0099 027A
        DECLE   $0082,  $0175,  $02C6,  $0036   ; D3C0   0082 0175 02C6 0036
        DECLE   $029D,  $0014,  $002B,  $0240   ; D3C4   029D 0014 002B 0240
        DECLE   $01FD,  $0372,  $0291,  $0001   ; D3C8   01FD 0372 0291 0001

        SWAP    R0,     2                       ; D3CC   0044
        MVO@    R2,     R1                      ; D3CD   024A
        SUBR    R5,     R7                      ; D3CE   012F

        DECLE   $03E0,  $0122,  $0003,  $01EC   ; D3CF   03E0 0122 0003 01EC
        DECLE   $0074,  $02DD,  $0161,  $0116   ; D3D3   0074 02DD 0161 0116
        DECLE   $00C3,  $0029,  $0238,  $0239   ; D3D7   00C3 0029 0238 0239
        DECLE   $035C,  $03D4,  $00CA,  $0251   ; D3DB   035C 03D4 00CA 0251
        DECLE   $0030,  $033C,  $03AD,  $00B5   ; D3DF   0030 033C 03AD 00B5
        DECLE   $03D3,  $0082,  $03F4,  $0221   ; D3E3   03D3 0082 03F4 0221
        DECLE   $00C0,  $0021,  $0208,  $0204   ; D3E7   00C0 0021 0208 0204
        DECLE   $023E,  $01CF,  $0258,  $0125   ; D3EB   023E 01CF 0258 0125
        DECLE   $0138,  $002C,  $018E,  $0399   ; D3EF   0138 002C 018E 0399
        DECLE   $00E2,  $03A6,  $01D2,  $0098   ; D3F3   00E2 03A6 01D2 0098
        DECLE   $03F9,  $01D1,  $01CD,  $0271   ; D3F7   03F9 01D1 01CD 0271
        DECLE   $0332,  $00A9,  $024C,  $03F5   ; D3FB   0332 00A9 024C 03F5
        DECLE   $035B,  $0380,  $0395,  $0005   ; D3FF   035B 0380 0395 0005
        DECLE   $0008,  $0000,  $00AC,  $0336   ; D403   0008 0000 00AC 0336
        DECLE   $03B9,  $0054,  $0026,  $017E   ; D407   03B9 0054 0026 017E
        DECLE   $0075,  $037B,  $021A,  $01E5   ; D40B   0075 037B 021A 01E5
        DECLE   $002A,  $0093,  $033E,  $0019   ; D40F   002A 0093 033E 0019
        DECLE   $01C9,  $038D,  $00FE,  $0215   ; D413   01C9 038D 00FE 0215
        DECLE   $0049,  $03BF,  $028D,  $035E   ; D417   0049 03BF 028D 035E
        DECLE   $0232                           ; D41B   0232

        RRC     R0,     1                       ; D41C   0070
        MVO@    R7,     R1                      ; D41D   024F
        SKIP                                    ; D41E   0208
        ADD@    R6,     R1                      ; D41F   02F1
        XORR    R6,     R2                      ; D420   01F2
        TSTR    R2                              ; D421   0092
L_D422:
        XORI    #$0258, R6                      ; D422   03FE 0258
        DECLE   $0376,  $02E6,  $0292,  $0205   ; D424   0376 02E6 0292 0205
        DECLE   $0226,  $013F                   ; D428   0226 013F

        CMPR    R4,     R7                      ; D42A   0167
        CMPR    R5,     R0                      ; D42B   0168
        CMPR    R2,     R3                      ; D42C   0153
        SLL     R0,     2                       ; D42D   004C
        SUB     .BTAB.C3,R1                     ; D42E   0301 02C3
        ADD     .BTAB.83,R7                     ; D430   02C7 0283

        DECLE   $02D6,  $014F,  $001C,  $0120   ; D432   02D6 014F 001C 0120
        DECLE   $0226,  $01F4,  $0044,  $021F   ; D436   0226 01F4 0044 021F
        DECLE   $0003,  $00C9,  $0318,  $03CD   ; D43A   0003 00C9 0318 03CD
        DECLE   $00DE,  $020D,  $030B,  $03C3   ; D43E   00DE 020D 030B 03C3
        DECLE   $01BF,  $0168,  $0189,  $00BD   ; D442   01BF 0168 0189 00BD
        DECLE   $038F,  $0207,  $032B,  $0281   ; D446   038F 0207 032B 0281
        DECLE   $013F,  $01CF,  $02E8,  $0085   ; D44A   013F 01CF 02E8 0085
        DECLE   $0130,  $008E,  $03FD,  $0188   ; D44E   0130 008E 03FD 0188
        DECLE   $014B,  $01AE,  $0066,  $011E   ; D452   014B 01AE 0066 011E
        DECLE   $000E,  $03D0,  $021A,  $0320   ; D456   000E 03D0 021A 0320
        DECLE   $018E,  $00A3,  $010B,  $01C9   ; D45A   018E 00A3 010B 01C9
        DECLE   $03B4,  $00BE,  $0274,  $020C   ; D45E   03B4 00BE 0274 020C
        DECLE   $00CD                           ; D462   00CD

        XOR@    R2,     R3                      ; D463   03D3
        CMP@    R2,     R1                      ; D464   0351
        SUB@    R3,     R7                      ; D465   031F

        DECLE   $03FC,  $022F,  $01D8,  $03CA   ; D466   03FC 022F 01D8 03CA
        DECLE   $0184,  $00D0,  $008C,  $03CE   ; D46A   0184 00D0 008C 03CE
        DECLE   $0015,  $00E3,  $03BF,  $034E   ; D46E   0015 00E3 03BF 034E
        DECLE   $0099,  $0101,  $0345,  $02D3   ; D472   0099 0101 0345 02D3
        DECLE   $02DE,  $035E,  $03E6,  $00D5   ; D476   02DE 035E 03E6 00D5
        DECLE   $03E5,  $0047,  $0000           ; D47A   03E5 0047 0000

        XOR@    R4,     R0                      ; D47D   03E0
        SUB@    R2,     R0                      ; D47E   0310
        ADDR    R1,     R7                      ; D47F   00CF

        DECLE   $005F,  $0383,  $0118,  $0261   ; D480   005F 0383 0118 0261
        DECLE   $0396,  $01B9,  $013A,  $0265   ; D484   0396 01B9 013A 0265
        DECLE   $0088,  $0078,  $01DC,  $018C   ; D488   0088 0078 01DC 018C
        DECLE   $0153,  $01A7,  $01FD,  $00C2   ; D48C   0153 01A7 01FD 00C2
        DECLE   $0100,  $0236,  $0046,  $027E   ; D490   0100 0236 0046 027E
        DECLE   $00F0,  $01A5,  $0000,  $0064   ; D494   00F0 01A5 0000 0064
        DECLE   $00CC,  $016C,  $00E2,  $030D   ; D498   00CC 016C 00E2 030D
        DECLE   $00B7,  $0315,  $0306,  $0343   ; D49C   00B7 0315 0306 0343
        DECLE   $02AE,  $026E,  $01CB,  $01AD   ; D4A0   02AE 026E 01CB 01AD
        DECLE   $00F6,  $0285,  $0040,  $028A   ; D4A4   00F6 0285 0040 028A
        DECLE   $0004,  $01D7                   ; D4A8   0004 01D7

        XORR    R1,     R3                      ; D4AA   01CB
        ANDR    R5,     R5                      ; D4AB   01AD
        NEGR    R5                              ; D4AC   0025
        XOR     .STIC.A.7,R2                    ; D4AD   03C2 0017
        ANDI    #$00F4, R0                      ; D4AF   03B8 00F4
        ADCR    R7                              ; D4B1   002F

        ANDR    R1,     R6                      ; D4B2   018E
L_D4B3:
        MOVR    R4,     R3                      ; D4B3   00A3
        DECLE   $0104,  $01C7                   ; D4B4   0104 01C7

        CMPR    R4,     R4                      ; D4B6   0164
        MVO@    R7,     R5                      ; D4B7   026F
        SAR     R0,     2                       ; D4B8   006C
        AND@    R1,     R4                      ; D4B9   038C
        XORR    R2,     R5                      ; D4BA   01D5
        CMPR    R3,     R6                      ; D4BB   015E
        MOVR    R4,     R5                      ; D4BC   00A5
        ADDR    R4,     R0                      ; D4BD   00E0
        MOVR    R3,     R6                      ; D4BE   009E
        XORR    R4,     R5                      ; D4BF   01E5
        BMI     L_D695                          ; D4C0   020B 01D3

        ANDR    R7,     R4                      ; D4C2   01BC
        ANDR    R4,     R6                      ; D4C3   01A6
        SUBR    R4,     R2                      ; D4C4   0122
        INCR    R6                              ; D4C5   000E
        DECR    R0                              ; D4C6   0010
        BPL     L_D8C0                          ; D4C7   0203 03F7

        ANDR    R1,     R5                      ; D4C9   018D
        ADDR    R4,     R7                      ; D4CA   00E7

        DECLE   $0205,  $0186,  $0184,  $018F   ; D4CB   0205 0186 0184 018F

        ADD@    R6,     R2                      ; D4CF   02F2
        SUB@    R1,     R6                      ; D4D0   030E
        ANDR    R7,     R5                      ; D4D1   01BD
        CMP@    R3,     R4                      ; D4D2   035C
        MOVR    R4,     R7                      ; D4D3   00A7

        DECLE   $0050,  $028C,  $03D4,  $02C3   ; D4D4   0050 028C 03D4 02C3
        DECLE   $019F,  $03BC,  $018D,  $0122   ; D4D8   019F 03BC 018D 0122
        DECLE   $010A,  $02C5,  $03A3,  $00CE   ; D4DC   010A 02C5 03A3 00CE
        DECLE   $0070,  $036C,  $01AD,  $014A   ; D4E0   0070 036C 01AD 014A
        DECLE   $008A,  $00E8,  $0034,  $03DE   ; D4E4   008A 00E8 0034 03DE
        DECLE   $0397,  $0022,  $00EA,  $01CD   ; D4E8   0397 0022 00EA 01CD
        DECLE   $016A,  $0105,  $0109,  $03C3   ; D4EC   016A 0105 0109 03C3
        DECLE   $00FE,  $0170,  $020C,  $01A5   ; D4F0   00FE 0170 020C 01A5
        DECLE   $01BC,  $00CD,  $01A0,  $0244   ; D4F4   01BC 00CD 01A0 0244
        DECLE   $01DD,  $0188,  $014F,  $03B5   ; D4F8   01DD 0188 014F 03B5
        DECLE   $013C,  $0052,  $0000,  $032E   ; D4FC   013C 0052 0000 032E
        DECLE   $0024,  $025C,  $00F5,  $001C   ; D500   0024 025C 00F5 001C
        DECLE   $0000,  $00AF,  $0310,  $0109   ; D504   0000 00AF 0310 0109
        DECLE   $0001,  $00DA,  $0026,  $0130   ; D508   0001 00DA 0026 0130
        DECLE   $001A,  $00E0,  $0303,  $01E4   ; D50C   001A 00E0 0303 01E4
        DECLE   $01ED,  $02C0,  $006F,  $0033   ; D510   01ED 02C0 006F 0033
        DECLE   $030D,  $0024,  $0035,  $02C3   ; D514   030D 0024 0035 02C3
        DECLE   $0033,  $017B,  $004A,  $0278   ; D518   0033 017B 004A 0278

        SUB@    R4,     R0                      ; D51C   0320
        INCR    R7                              ; D51D   000F

        DECLE   $0004                           ; D51E   0004
L_D51F:
        CLRR    R1                              ; D51F   01C9
        DECLE   $027F,  $0100,  $03A0,  $001F   ; D520   027F 0100 03A0 001F

        CMP@    R1,     R2                      ; D524   034A
        XORR    R7,     R4                      ; D525   01FC
        XOR@    R3,     R0                      ; D526   03D8
        ADDR    R6,     R3                      ; D527   00F3
        COMR    R4                              ; D528   001C
        XOR@    R1,     R2                      ; D529   03CA
        ADDI    #$01FC, R5                      ; D52A   02FD 01FC
        ADDR    R6,     R0                      ; D52C   00F0
        XOR@    R5,     R0                      ; D52D   03E8
L_D52E:
        CMPR    R1,     R2                      ; D52E   014A
        CMPI    #$002F, R5                      ; D52F   037D 002F
        RRC     R0,     1                       ; D531   0070
        INCR    R2                              ; D532   000A
L_D533:
        ADDR    R1,     R2                      ; D533   00CA
        DECLE   $00FE,  $0224,  $01D1,  $03EA   ; D534   00FE 0224 01D1 03EA
        DECLE   $034A,  $007F,  $0100,  $007E   ; D538   034A 007F 0100 007E
        DECLE   $0202,  $03CB,  $020C,  $0200   ; D53C   0202 03CB 020C 0200
        DECLE   $0302,  $023F,  $014B,  $0031   ; D540   0302 023F 014B 0031
        DECLE   $03D4,  $00E1,  $0000,  $029C   ; D544   03D4 00E1 0000 029C
        DECLE   $010C,  $004C,  $018D,  $03A0   ; D548   010C 004C 018D 03A0
        DECLE   $0397,  $01C4,  $0065,  $001F   ; D54C   0397 01C4 0065 001F
        DECLE   $0010,  $0030,  $02F2,  $0025   ; D550   0010 0030 02F2 0025
        DECLE   $00C1,  $0004,  $03D7,  $001B   ; D554   00C1 0004 03D7 001B
        DECLE   $03E6,  $02C1,  $0005,  $003F   ; D558   03E6 02C1 0005 003F
        DECLE   $0039,  $03CE,  $0089,  $0311   ; D55C   0039 03CE 0089 0311
        DECLE   $0349,  $025E,  $02DD,  $0158   ; D560   0349 025E 02DD 0158
        DECLE   $03C7,  $0248,  $0093,  $0083   ; D564   03C7 0248 0093 0083
        DECLE   $0347,  $0186,  $016A,  $01F3   ; D568   0347 0186 016A 01F3
        DECLE   $032B,  $004B,  $0231           ; D56C   032B 004B 0231

        ADDR    R7,     R3                      ; D56F   00FB
        MOVR    R3,     R7                      ; D570   009F

        DECLE   $02B6,  $02F9,  $0094,  $01C1   ; D571   02B6 02F9 0094 01C1
        DECLE   $0319,  $0279,  $0031,  $033C   ; D575   0319 0279 0031 033C
        DECLE   $0078,  $034B,  $0192,  $039C   ; D579   0078 034B 0192 039C
        DECLE   $035D,  $01A6,  $00AD,  $0043   ; D57D   035D 01A6 00AD 0043
        DECLE   $03C0,  $013F,  $03A5,  $01B8   ; D581   03C0 013F 03A5 01B8
        DECLE   $00AA,  $0227,  $01E8,  $03D8   ; D585   00AA 0227 01E8 03D8
        DECLE   $01C3,  $0310,  $00DE,  $01E7   ; D589   01C3 0310 00DE 01E7
        DECLE   $0243,  $00F8,  $0005           ; D58D   0243 00F8 0005

        XOR@    R6,     R3                      ; D590   03F3
L_D591:
        MOVR    R5,     R6                      ; D591   00AE
        SUB@    R4,     R7                      ; D592   0327

        DECLE   $03BB,  $000F,  $03FE,  $0080   ; D593   03BB 000F 03FE 0080
        DECLE   $0324,  $03E3,  $03F1,  $02C8   ; D597   0324 03E3 03F1 02C8
        DECLE   $007F,  $0128,  $0135,  $03F0   ; D59B   007F 0128 0135 03F0
        DECLE   $0000,  $0008,  $0068,  $0217   ; D59F   0000 0008 0068 0217
        DECLE   $00D1,  $005C,  $0282,  $02F7   ; D5A3   00D1 005C 0282 02F7
        DECLE   $0295,  $0234,  $037B,  $0094   ; D5A7   0295 0234 037B 0094
        DECLE   $0135,  $0381,  $00BB,  $0172   ; D5AB   0135 0381 00BB 0172
        DECLE   $0392,  $0000,  $0170,  $0340   ; D5AF   0392 0000 0170 0340
        DECLE   $021E,  $0003,  $01AF,  $0218   ; D5B3   021E 0003 01AF 0218

        XORR    R1,     R5                      ; D5B7   01CD
        RRC     R2,     2                       ; D5B8   0076
        SUB     G_0349, R6                      ; D5B9   0306 0349
        NEGR    R3                              ; D5BB   0023
        CMP@    R1,     R7                      ; D5BC   034F
        ADD@    R4,     R0                      ; D5BD   02E0
        BNEQ    L_D422                          ; D5BE   022C 019D

        MVO@    R6,     R3                      ; D5C0   025E
        MOVR    R5,     R1                      ; D5C1   00A9
        ADDR    R6,     R0                      ; D5C2   00F0
        SAR     R0,     1                       ; D5C3   0068
        XORI    #$0057, R1                      ; D5C4   03F9 0057
        XORR    R0,     R3                      ; D5C6   01C3
        MOVR    R6,     R3                      ; D5C7   00B3
        XOR@    R1,     R5                      ; D5C8   03CD
        SUBR    R2,     R6                      ; D5C9   0116
        SUBR    R2,     R5                      ; D5CA   0115
        SUB@    R1,     R1                      ; D5CB   0309
        CMPR    R0,     R3                      ; D5CC   0143
        CMPI    #$0362, R7                      ; D5CD   037F 0362
        ADD@    R5,     R5                      ; D5CF   02ED
        MOVR    R4,     R5                      ; D5D0   00A5
        MVI@    R1,     R3                      ; D5D1   028B
        XORR    R0,     R1                      ; D5D2   01C1
        XOR@    R4,     R0                      ; D5D3   03E0
        MOVR    R0,     R5                      ; D5D4   0085
        B       L_D52E                          ; D5D5   0220 00A8

        MOVR    R2,     R3                      ; D5D7   0093
        SWAP    R0,     1                       ; D5D8   0040
        SUB@    R4,     R0                      ; D5D9   0320
        SUBI    #$03D8, R7                      ; D5DA   033F 03D8

        ANDR    R7,     R0                      ; D5DC   01B8
        ADDR    R3,     R2                      ; D5DD   00DA
        MVI@    R4,     R7                      ; D5DE   02A7

        DECLE   $0128,  $0268,  $03E1,  $0095   ; D5DF   0128 0268 03E1 0095
        DECLE   $016F,  $02BE,  $01CD,  $00DA   ; D5E3   016F 02BE 01CD 00DA
        DECLE   $0216,  $0109,  $0023,  $03CF   ; D5E7   0216 0109 0023 03CF
        DECLE   $0360,  $038A,  $01C5,  $01CA   ; D5EB   0360 038A 01C5 01CA
        DECLE   $02A6,  $0128,  $006A,  $03E1   ; D5EF   02A6 0128 006A 03E1
        DECLE   $005C,  $01B3,  $00B4,  $010E   ; D5F3   005C 01B3 00B4 010E
        DECLE   $00CE,  $031E,  $0149,  $0053   ; D5F7   00CE 031E 0149 0053
        DECLE   $023E,  $01E6,  $026E,  $01AD   ; D5FB   023E 01E6 026E 01AD
        DECLE   $01CA,  $0386,  $0130,  $006A   ; D5FF   01CA 0386 0130 006A
        DECLE   $01C4,  $010A,  $01CF,  $03B4   ; D603   01C4 010A 01CF 03B4
        DECLE   $038D,  $00CD,  $0302,  $0349   ; D607   038D 00CD 0302 0349
        DECLE   $0183,  $032E,  $025C,  $0145   ; D60B   0183 032E 025C 0145
        DECLE   $00AE,  $03ED,  $018A,  $01E0   ; D60F   00AE 03ED 018A 01E0
        DECLE   $0340,  $0368,  $01CD,  $013C   ; D613   0340 0368 01CD 013C
        DECLE   $00A6,  $00D8,  $027A,  $03CD   ; D617   00A6 00D8 027A 03CD
        DECLE   $035D,  $007A,  $02D2,  $038D   ; D61B   035D 007A 02D2 038D
        DECLE   $00C9,  $0205,  $0386,  $0193   ; D61F   00C9 0205 0386 0193
        DECLE   $02CE,  $01E0,  $0065,  $01CE   ; D623   02CE 01E0 0065 01CE
        DECLE   $0148,  $0086,  $00A0,  $027C   ; D627   0148 0086 00A0 027C

        XOR@    R2,     R2                      ; D62B   03D2
        MOVR    R2,     R0                      ; D62C   0090
        MOVR    R2,     R7                      ; D62D   0097
        ADD     G_01CD, R7                      ; D62E   02C7 01CD

        DECLE   $00E2,  $0116,  $018B,  $0354   ; D630   00E2 0116 018B 0354
        DECLE   $030E,  $0068,  $014A,  $0195   ; D634   030E 0068 014A 0195
        DECLE   $015C,  $0368,  $0118,  $028A   ; D638   015C 0368 0118 028A
        DECLE   $03F2,  $00D2,  $0077,  $03D3   ; D63C   03F2 00D2 0077 03D3
        DECLE   $01C8,  $0001                   ; D640   01C8 0001

        ADDR    R1,     R0                      ; D642   00C8
        SUB@    R2,     R7                      ; D643   0317

        DECLE   $0298,  $0398,  $017B,  $02C6   ; D644   0298 0398 017B 02C6
        DECLE   $0251,  $028B,  $03A4,  $00B1   ; D648   0251 028B 03A4 00B1
        DECLE   $0197,  $0373,  $0334,  $00CE   ; D64C   0197 0373 0334 00CE
        DECLE   $0177,  $0162,  $0090,  $0335   ; D650   0177 0162 0090 0335
        DECLE   $02E5,  $024E,  $02A3,  $0258   ; D654   02E5 024E 02A3 0258
        DECLE   $01E6,  $0249,  $0186,  $02A3   ; D658   01E6 0249 0186 02A3
        DECLE   $0139,  $01E7                   ; D65C   0139 01E7

        GSWD    R1                              ; D65E   0031
        SUB@    R4,     R5                      ; D65F   0325
        ADDR    R2,     R2                      ; D660   00D2
        SUBR    R5,     R6                      ; D661   012E
        SLR     R2,     1                       ; D662   0062
        MOVR    R2,     R4                      ; D663   0094
        SUBR    R4,     R4                      ; D664   0124
        ADDR    R5,     R1                      ; D665   00E9
        MVO@    R3,     R5                      ; D666   026B
        MOVR    R5,     R3                      ; D667   00AB
        SLLC    R1,     1                       ; D668   0059
        ADDR    R4,     R7                      ; D669   00E7

        MVO     R5,     .BTAB.06                ; D66A   0245 0206
        ANDR    R4,     R3                      ; D66C   01A3
        ANDR    R5,     R1                      ; D66D   01A9
        CMPR    R3,     R7                      ; D66E   015F
        MVI@    R5,     R7                      ; D66F   02AF

        SLR     R3,     1                       ; D670   0063
        ADDR    R4,     R7                      ; D671   00E7
        MOVR    R4,     R7                      ; D672   00A7

        RLC     R2,     1                       ; D673   0052
        MOVR    R3,     R0                      ; D674   0098
        ADCR    R5                              ; D675   002D
        ADDR    R6,     R1                      ; D676   00F1
        BMI     L_D926                          ; D677   020B 02AD

        ADD@    R3,     R0                      ; D679   02D8
        XOR@    R4,     R6                      ; D67A   03E6
        SWAP    R0,     2                       ; D67B   0044
        INCR    R7                              ; D67C   000F

        MOVR    R4,     R1                      ; D67D   00A1
L_D67E:
        ADD     G_01E7, R1                      ; D67E   02C1 01E7
        DECLE   $032E,  $02C5,  $00D2,  $0024   ; D680   032E 02C5 00D2 0024
        DECLE   $03D2,  $007B,  $0325,  $00BF   ; D684   03D2 007B 0325 00BF

        SLR     R0,     1                       ; D688   0060
        PULR    R4                              ; D689   02B4
        MVO@    R6,     R2                      ; D68A   0256
        XOR@    R4,     R6                      ; D68B   03E6
        MVO     R0,     G_037E                  ; D68C   0240 037E
        MOVR    R0,     R3                      ; D68E   0083
        XORI    #$03FD, R1                      ; D68F   03F9 03FD
        CMP     .BTAB.76,R3                     ; D691   0343 0276
        ADDR    R3,     R2                      ; D693   00DA
        SLR     R2,     2                       ; D694   0066
L_D695:
        XORR    R6,     R2                      ; D695   01F2
        DECLE   $0044,  $012D,  $02F6,  $01EF   ; D696   0044 012D 02F6 01EF
        DECLE   $00E5,  $03D3,  $0186,  $003F   ; D69A   00E5 03D3 0186 003F
        DECLE   $028A,  $0224,  $0340,  $01DF   ; D69E   028A 0224 0340 01DF
        DECLE   $01AF,  $0325,  $00D6,  $03EE   ; D6A2   01AF 0325 00D6 03EE
        DECLE   $0051,  $006C,  $022F,  $00EC   ; D6A6   0051 006C 022F 00EC
        DECLE   $0268,  $00AD,  $005F,  $01E7   ; D6AA   0268 00AD 005F 01E7
        DECLE   $023D,  $01FE,  $01E3,  $0259   ; D6AE   023D 01FE 01E3 0259
        DECLE   $002E,  $037C,  $03D5,  $00D2   ; D6B2   002E 037C 03D5 00D2
        DECLE   $03AF                           ; D6B6   03AF

        XOR@    R4,     R1                      ; D6B7   03E1
        MOVR    R2,     R7                      ; D6B8   0097

        DECLE   $0235                           ; D6B9   0235

        ADD@    R6,     R0                      ; D6BA   02F0
        MVI@    R1,     R6                      ; D6BB   028E
        MOVR    R7,     R3                      ; D6BC   00BB
        ADD@    R3,     R7                      ; D6BD   02DF

        DECLE   $01E6,  $003D,  $027F,  $03A4   ; D6BE   01E6 003D 027F 03A4
        DECLE   $0219,  $0187                   ; D6C2   0219 0187

        CMP@    R6,     R5                      ; D6C4   0375
        XOR@    R4,     R5                      ; D6C5   03E5
        ADDR    R3,     R2                      ; D6C6   00DA
        MOVR    R5,     R7                      ; D6C7   00AF

        XOR@    R4,     R2                      ; D6C8   03E2
        MOVR    R2,     R7                      ; D6C9   0097

        RSWD    R6                              ; D6CA   003E
        XORR    R4,     R5                      ; D6CB   01E5
        ADD@    R5,     R0                      ; D6CC   02E8
        PULR    R5                              ; D6CD   02B5
        ADDR    R3,     R7                      ; D6CE   00DF
        MVI     .BTAB.3D,R7                     ; D6CF   0287 023D

        DECLE   $037F,  $00E4,  $00C2,  $00BF   ; D6D1   037F 00E4 00C2 00BF
        DECLE   $0137,  $03E5,  $0262,  $020B   ; D6D5   0137 03E5 0262 020B
        DECLE   $0023,  $0180,  $00FF,  $0098   ; D6D9   0023 0180 00FF 0098
        DECLE   $0257,  $0000,  $00E0,  $0100   ; D6DD   0257 0000 00E0 0100
        DECLE   $01A0,  $0194,  $0257,  $0005   ; D6E1   01A0 0194 0257 0005
        DECLE   $0300,  $0381,  $02D0,  $0174   ; D6E5   0300 0381 02D0 0174
        DECLE   $0264,  $0011,  $00E0,  $0300   ; D6E9   0264 0011 00E0 0300
        DECLE   $01F0,  $0080,  $0264,  $0011   ; D6ED   01F0 0080 0264 0011
        DECLE   $01E3,  $030E,  $0243,  $036B   ; D6F1   01E3 030E 0243 036B
        DECLE   $0040,  $0328,  $020E,  $0000   ; D6F5   0040 0328 020E 0000
        DECLE   $0000                           ; D6F9   0000

        SUB@    R4,     R0                      ; D6FA   0320
        ANDR    R1,     R0                      ; D6FB   0188
        ADDR    R3,     R6                      ; D6FC   00DE
        AND@    R4,     R4                      ; D6FD   03A4
        ADDR    R3,     R7                      ; D6FE   00DF

        DECLE   $028E,  $01D5,  $0246,  $0173   ; D6FF   028E 01D5 0246 0173
        DECLE   $00BB,  $01A6,  $01C1,  $0012   ; D703   00BB 01A6 01C1 0012
        DECLE   $0090,  $0211,  $0298,  $0265   ; D707   0090 0211 0298 0265
        DECLE   $0021,  $0074,  $03D1,  $02F5   ; D70B   0021 0074 03D1 02F5
        DECLE   $00C3,  $0025,  $0025,  $000C   ; D70F   00C3 0025 0025 000C
        DECLE   $003F,  $021E,  $00DB,  $03A5   ; D713   003F 021E 00DB 03A5
        DECLE   $00FB,  $007E,  $0038,  $030C   ; D717   00FB 007E 0038 030C
        DECLE   $0316,  $01CD,  $008A,  $01FD   ; D71B   0316 01CD 008A 01FD
        DECLE   $03C7                           ; D71F   03C7

        ADDR    R2,     R4                      ; D720   00D4
        SUBR    R3,     R7                      ; D721   011F

        ADDR    R5,     R6                      ; D722   00EE
        XORR    R5,     R3                      ; D723   01EB
        XORR    R1,     R5                      ; D724   01CD
        CMPR    R1,     R6                      ; D725   014E
        XOR     G_012F, R4                      ; D726   03C4 012F
        MOVR    R3,     R6                      ; D728   009E
        XOR@    R4,     R6                      ; D729   03E6
        XOR@    R2,     R6                      ; D72A   03D6
        SLL     R2,     1                       ; D72B   004A
        ADDR    R3,     R7                      ; D72C   00DF

        DECLE   $034D,  $008A,  $00FF,  $03C9   ; D72D   034D 008A 00FF 03C9
        DECLE   $0094,  $006F,  $02F0,  $03CA   ; D731   0094 006F 02F0 03CA
        DECLE   $00BD,  $0001,  $0000,  $031C   ; D735   00BD 0001 0000 031C
        DECLE   $0023,  $02E8,  $01B0,  $015E   ; D739   0023 02E8 01B0 015E
        DECLE   $0064,  $0120,  $029C,  $01F7   ; D73D   0064 0120 029C 01F7

        CMPR    R0,     R6                      ; D741   0146
        SUBR    R3,     R3                      ; D742   011B
        ADD     G_010F, R3                      ; D743   02C3 010F
        MOVR    R1,     R7                      ; D745   008F

        DECLE   $000B,  $0349,  $02F4,  $020F   ; D746   000B 0349 02F4 020F
        DECLE   $0164,  $0144,  $01CE,  $024C   ; D74A   0164 0144 01CE 024C
        DECLE   $01C4,  $0110,  $029C,  $03FD   ; D74E   01C4 0110 029C 03FD
        DECLE   $000F,  $00CB,  $02C4,  $010E   ; D752   000F 00CB 02C4 010E
        DECLE   $009A,  $000D,  $0389,  $02C4   ; D756   009A 000D 0389 02C4
        DECLE   $017F,  $00E8,  $00AC,  $0095   ; D75A   017F 00E8 00AC 0095
        DECLE   $00B3,  $0038,  $021C,  $00C0   ; D75E   00B3 0038 021C 00C0
        DECLE   $0070,  $030E,  $0001,  $0099   ; D762   0070 030E 0001 0099
        DECLE   $0010,  $03CD,  $010A,  $0313   ; D766   0010 03CD 010A 0313
        DECLE   $0189,  $03B0,  $033C,  $02DE   ; D76A   0189 03B0 033C 02DE
        DECLE   $01E6,  $0079,  $0193,  $00A3   ; D76E   01E6 0079 0193 00A3
        DECLE   $01C8,  $017E,  $016F,  $01F9   ; D772   01C8 017E 016F 01F9
        DECLE   $01CF                           ; D776   01CF

        CLRR    R4                              ; D777   01E4
        ADDR    R4,     R4                      ; D778   00E4
        SUBR    R7,     R4                      ; D779   013C
        ANDR    R3,     R1                      ; D77A   0199
        SETC                                    ; D77B   0007
        ADDR    R4,     R3                      ; D77C   00E3
        ADDI    #$0146, R6                      ; D77D   02FE 0146
        MVO@    R3,     R2                      ; D77F   0253
        NOP                                     ; D780   0034
        MVO     R7,     G_01E1                  ; D781   0247 01E1
        GSWD    R0                              ; D783   0030
        ADD@    R1,     R7                      ; D784   02CF

        DECLE   $0276,  $0131,  $039A,  $0383   ; D785   0276 0131 039A 0383
        DECLE   $0049,  $0236                   ; D789   0049 0236

        CMPR    R5,     R3                      ; D78B   016B
        SUBI    #$0190, R3                      ; D78C   033B 0190
        XOR@    R1,     R4                      ; D78E   03CC
        RLC     R1,     1                       ; D78F   0051
        SDBD                                    ; D790   0001
        SUB@    R4,     R7                      ; D791   0327

        DECLE   $02B2,  $009D,  $03E3,  $0040   ; D792   02B2 009D 03E3 0040
        DECLE   $0104,  $01E0,  $0197,  $03BE   ; D796   0104 01E0 0197 03BE
        DECLE   $03E5,  $0230,  $0014,  $0194   ; D79A   03E5 0230 0014 0194
        DECLE   $025F,  $0252,  $01E0,  $0000   ; D79E   025F 0252 01E0 0000

        AND@    R1,     R6                      ; D7A2   038E
        CLRR    R0                              ; D7A3   01C0
        ADDR    R2,     R4                      ; D7A4   00D4
        MVO@    R4,     R4                      ; D7A5   0264
        XORR    R4,     R2                      ; D7A6   01E2
        SUBR    R2,     R4                      ; D7A7   0114
        ADDI    #$00AF, R1                      ; D7A8   02F9 00AF
        ADD@    R4,     R3                      ; D7AA   02E3
        MVO@    R1,     R5                      ; D7AB   0269
        SUBR    R5,     R7                      ; D7AC   012F

        DECLE   $00F1,  $0278,  $01F8,  $00EE   ; D7AD   00F1 0278 01F8 00EE
        DECLE   $02B6,  $0395,  $00FF,  $03C1   ; D7B1   02B6 0395 00FF 03C1
        DECLE   $01D8,  $0391,  $0138,  $0267   ; D7B5   01D8 0391 0138 0267
        DECLE   $0098,  $013C,  $01BE,  $0134   ; D7B9   0098 013C 01BE 0134
        DECLE   $014B,  $014B,  $0000,  $0104   ; D7BD   014B 014B 0000 0104
        DECLE   $01EC,  $0256,  $029B,  $012C   ; D7C1   01EC 0256 029B 012C
        DECLE   $0214                           ; D7C5   0214

        SUBR    R3,     R7                      ; D7C6   011F

        CMPR    R7,     R6                      ; D7C7   017E
        MOVR    R2,     R7                      ; D7C8   0097

        DECLE   $03E4,  $01CD,  $0092,  $0303   ; D7C9   03E4 01CD 0092 0303
        DECLE   $024F,  $013F,  $029E,  $025E   ; D7CD   024F 013F 029E 025E
        DECLE   $00C6,  $0249,  $0381,  $0247   ; D7D1   00C6 0249 0381 0247
        DECLE   $03DF                           ; D7D5   03DF

        NEGR    R5                              ; D7D6   0025
        XORR    R7,     R2                      ; D7D7   01FA
        MVO@    R3,     R4                      ; D7D8   0263
        NEGR    R4                              ; D7D9   0024
        AND     .BTAB.C3,R5                     ; D7DA   0385 02C3
        ANDI    #$03F2, R3                      ; D7DC   03BB 03F2
        ADDI    #$0321, R5                      ; D7DE   02FD 0321
        ANDR    R2,     R2                      ; D7E0   0192
        XOR@    R4,     R1                      ; D7E1   03E1
        CMP@    R3,     R1                      ; D7E2   0359
        XORR    R7,     R3                      ; D7E3   01FB
        INCR    R7                              ; D7E4   000F

        CMPR    R5,     R6                      ; D7E5   016E
L_D7E6:
        XOR     G_0383, R2                      ; D7E6   03C2 0383
        DECLE   $0000,  $0387,  $0140,  $002E   ; D7E8   0000 0387 0140 002E
        DECLE   $0306,  $000F,  $037C,  $0361   ; D7EC   0306 000F 037C 0361
        DECLE   $0154,  $03C9,  $02B0,  $038C   ; D7F0   0154 03C9 02B0 038C
        DECLE   $02E9,  $0084,  $01AF,  $019C   ; D7F4   02E9 0084 01AF 019C
        DECLE   $01A5,  $01D8,  $03DA,  $013E   ; D7F8   01A5 01D8 03DA 013E
        DECLE   $037F,  $0387,  $0000,  $0081   ; D7FC   037F 0387 0000 0081
        DECLE   $0018,  $038D,  $00D2,  $030E   ; D800   0018 038D 00D2 030E
        DECLE   $034A,  $02F3,  $011D,  $03F2   ; D804   034A 02F3 011D 03F2
        DECLE   $01CB,  $019D,  $026A,  $01A6   ; D808   01CB 019D 026A 01A6
        DECLE   $0118,  $008C,  $03CA,  $01D9   ; D80C   0118 008C 03CA 01D9
        DECLE   $017B,  $03B3,  $0025,  $03FA   ; D810   017B 03B3 0025 03FA
        DECLE   $0393,  $00FF,  $020C,  $032A   ; D814   0393 00FF 020C 032A
        DECLE   $0025,  $033D,  $0005,  $00B8   ; D818   0025 033D 0005 00B8
        DECLE   $0310,  $0226,  $014E,  $00A3   ; D81C   0310 0226 014E 00A3
        DECLE   $0202,  $038B,  $0283,  $028F   ; D820   0202 038B 0283 028F
        DECLE   $02F2,  $018F                   ; D824   02F2 018F

        ANDR    R6,     R5                      ; D826   01B5
        XOR@    R3,     R6                      ; D827   03DE
        SLR     R0,     2                       ; D828   0064
        CMPR    R6,     R0                      ; D829   0170
        SARC    R0,     2                       ; D82A   007C
        XOR@    R3,     R5                      ; D82B   03DD
        ADD     G_01DF, R7                      ; D82C   02C7 01DF
        MVI@    R5,     R7                      ; D82E   02AF

        DECLE   $034E,  $00A2,  $020A,  $014B   ; D82F   034E 00A2 020A 014B
        DECLE   $0264,  $03AF,  $02F2,  $01CE   ; D833   0264 03AF 02F2 01CE
        DECLE   $013D,  $0006,  $0320,  $0005   ; D837   013D 0006 0320 0005

        XORR    R6,     R5                      ; D83B   01F5
        MVI@    R1,     R5                      ; D83C   028D
        ANDR    R3,     R5                      ; D83D   019D
        XOR     G_0037, R4                      ; D83E   03C4 0037
        ADD@    R4,     R7                      ; D840   02E7

        DECLE   $002C,  $021A                   ; D841   002C 021A

        MOVR    R1,     R5                      ; D843   008D
        CMPR    R7,     R4                      ; D844   017C
        ANDR    R1,     R3                      ; D845   018B
        MOVR    R7,     R2                      ; D846   00BA
        ADD@    R6,     R3                      ; D847   02F3
        SUBR    R6,     R1                      ; D848   0131
        MVI@    R2,     R7                      ; D849   0297

        DECLE   $0180,  $01B9,  $0364,  $0073   ; D84A   0180 01B9 0364 0073
        DECLE   $01EC,  $0291,  $0136,  $02F9   ; D84E   01EC 0291 0136 02F9
        DECLE   $0018,  $0323,  $008D,  $007B   ; D852   0018 0323 008D 007B
        DECLE   $0393,  $02AD,  $02D4,  $0194   ; D856   0393 02AD 02D4 0194
        DECLE   $011C,  $0000                   ; D85A   011C 0000

        SUBR    R1,     R0                      ; D85C   0108
        MVI     .BTAB.A6,R7                     ; D85D   0287 02A6

        DECLE   $0361,  $031C,  $0182,  $01F1   ; D85F   0361 031C 0182 01F1
        DECLE   $0366,  $0247,  $00FD,  $02A9   ; D863   0366 0247 00FD 02A9
        DECLE   $0235,  $0049,  $0055,  $0236   ; D867   0235 0049 0055 0236
        DECLE   $0193,  $01BD,  $01AA,  $019C   ; D86B   0193 01BD 01AA 019C
        DECLE   $0277,  $0329,  $01A5,  $0183   ; D86F   0277 0329 01A5 0183
        DECLE   $0231                           ; D873   0231

        XOR@    R5,     R6                      ; D874   03EE
        RSWD    R3                              ; D875   003B
L_D876:
        XORI    #$02CC, R6                      ; D876   03FE 02CC
        DECLE   $0025,  $0005,  $03A8,  $005C   ; D878   0025 0005 03A8 005C
        DECLE   $0083,  $0322,  $03F5,  $0070   ; D87C   0083 0322 03F5 0070
        DECLE   $0000,  $006A,  $0118,  $01C9   ; D880   0000 006A 0118 01C9
        DECLE   $0000,  $00DC,  $0227,  $0300   ; D884   0000 00DC 0227 0300
        DECLE   $0184,  $039B,  $018B,  $003A   ; D888   0184 039B 018B 003A
        DECLE   $0093,  $0263,  $021F,  $01B9   ; D88C   0093 0263 021F 01B9
        DECLE   $0098,  $019A,  $03DA,  $0003   ; D890   0098 019A 03DA 0003
        DECLE   $03C0,  $0084,  $0011,  $0390   ; D894   03C0 0084 0011 0390
        DECLE   $0098,  $028C,  $01D0,  $0098   ; D898   0098 028C 01D0 0098
        DECLE   $0001                           ; D89C   0001

        AND@    R6,     R2                      ; D89D   03B2
        BLT     L_D533                          ; D89E   0225 036C

        SUB@    R3,     R2                      ; D8A0   031A
        ANDR    R5,     R4                      ; D8A1   01AC
        COMR    R4                              ; D8A2   001C
        MVI@    R2,     R3                      ; D8A3   0293
        AND@    R4,     R6                      ; D8A4   03A6
        SUBR    R3,     R0                      ; D8A5   0118
        CLRR    R4                              ; D8A6   01E4
        ADDR    R2,     R7                      ; D8A7   00D7

        DECLE   $039B,  $019C,  $038E,  $02E0   ; D8A8   039B 019C 038E 02E0
        DECLE   $00F8,  $03B2,  $00B5,  $030E   ; D8AC   00F8 03B2 00B5 030E
        DECLE   $0358,  $029B,  $01EC,  $021C   ; D8B0   0358 029B 01EC 021C
        DECLE   $0397,  $0227,  $015D,  $02C5   ; D8B4   0397 0227 015D 02C5
        DECLE   $0259,  $01BA,  $016A,  $0000   ; D8B8   0259 01BA 016A 0000

        SWAP    R0,     1                       ; D8BC   0040
        XORR    R0,     R4                      ; D8BD   01C4
        ANDR    R7,     R6                      ; D8BE   01BE
        CMPR    R5,     R6                      ; D8BF   016E
L_D8C0:
        XORI    #$0011, R2                      ; D8C0   03FA 0011
        DECLE   $01C0,  $0084,  $01EE,  $015F   ; D8C2   01C0 0084 01EE 015F
        DECLE   $03C6,  $0001,  $0038,  $00C4   ; D8C6   03C6 0001 0038 00C4
        DECLE   $0380,  $0151,  $02FE,  $0071   ; D8CA   0380 0151 02FE 0071
        DECLE   $0048,  $03B8,  $03A2,  $0350   ; D8CE   0048 03B8 03A2 0350
        DECLE   $0274,  $014E,  $02E1,  $0118   ; D8D2   0274 014E 02E1 0118
        DECLE   $03B4,  $0124,  $02AE,  $014A   ; D8D6   03B4 0124 02AE 014A
        DECLE   $0213,  $0000,  $0172,  $0346   ; D8DA   0213 0000 0172 0346
        DECLE   $02B1,  $032C,  $0326,  $0000   ; D8DE   02B1 032C 0326 0000
        DECLE   $03F4,  $027C,  $0323,  $0308   ; D8E2   03F4 027C 0323 0308
        DECLE   $016F,  $0100,  $039E,  $016F   ; D8E6   016F 0100 039E 016F
        DECLE   $0309,  $0001,  $0096,  $0118   ; D8EA   0309 0001 0096 0118
        DECLE   $03CD,  $0128,  $01E5,  $0383   ; D8EE   03CD 0128 01E5 0383
        DECLE   $0263,  $006D,  $0390,  $02AC   ; D8F2   0263 006D 0390 02AC
        DECLE   $01AC,  $02AA,  $0148,  $00B7   ; D8F6   01AC 02AA 0148 00B7
        DECLE   $007C,  $01B5,  $0180,  $01BC   ; D8FA   007C 01B5 0180 01BC
        DECLE   $0091,  $034D,  $00F6,  $0016   ; D8FE   0091 034D 00F6 0016
        DECLE   $01CB,  $0094,  $02AE,  $016C   ; D902   01CB 0094 02AE 016C
        DECLE   $008B,  $01A5,  $03EC,  $02E5   ; D906   008B 01A5 03EC 02E5
        DECLE   $01A8,  $008C,  $01D3,  $011B   ; D90A   01A8 008C 01D3 011B
        DECLE   $01AF                           ; D90E   01AF

        MVI@    R4,     R7                      ; D90F   02A7

        XOR@    R4,     R5                      ; D910   03E5
        XOR@    R3,     R5                      ; D911   03DD
        XOR@    R6,     R1                      ; D912   03F1
        ADCR    R7                              ; D913   002F

        SUBR    R1,     R5                      ; D914   010D
L_D915:
        CMP@    R3,     R7                      ; D915   035F
        MVO@    R5,     R4                      ; D916   0265
        XORR    R7,     R2                      ; D917   01FA
        ADDR    R7,     R6                      ; D918   00FE
        SLLC    R0,     1                       ; D919   0058
        SUB@    R1,     R1                      ; D91A   0309
        SUBR    R0,     R3                      ; D91B   0103
        XOR@    R4,     R6                      ; D91C   03E6
        COMR    R5                              ; D91D   001D
        AND     G_0048, R2                      ; D91E   0382 0048
        XOR@    R6,     R1                      ; D920   03F1
L_D921:
        DECR    R7                              ; D921   0017

        DECLE   $0026,  $0021,  $0080,  $0000   ; D922   0026 0021 0080 0000
L_D926:
        SUB     G_0116, R2                      ; D926   0302 0116
        DECLE   $0266,  $00C0,  $007E,  $03F8   ; D928   0266 00C0 007E 03F8
        DECLE   $00FF,  $00FF,  $01E6,  $0064   ; D92C   00FF 00FF 01E6 0064
        DECLE   $0012,  $03C8,  $0011,  $00E8   ; D930   0012 03C8 0011 00E8
        DECLE   $03E6,  $00C4,  $0070,  $03E8   ; D934   03E6 00C4 0070 03E8
        DECLE   $012C,  $0246,  $034D,  $00C2   ; D938   012C 0246 034D 00C2
        DECLE   $021D,  $0184,  $0043,  $03DF   ; D93C   021D 0184 0043 03DF
        DECLE   $0166,  $028D,  $00B5,  $0021   ; D940   0166 028D 00B5 0021
        DECLE   $02FD,  $0004,  $01C2,  $0108   ; D944   02FD 0004 01C2 0108
        DECLE   $01B8,  $0358,  $0185,  $00E0   ; D948   01B8 0358 0185 00E0
        DECLE   $007C,  $01D9,  $01D5,  $01D7   ; D94C   007C 01D9 01D5 01D7

        AND@    R6,     R6                      ; D950   03B6
        CMPR    R1,     R5                      ; D951   014D
        MOVR    R6,     R2                      ; D952   00B2
        SUB@    R1,     R4                      ; D953   030C
        ANDR    R0,     R6                      ; D954   0186
        MOVR    R6,     R4                      ; D955   00B4
        ADDR    R7,     R6                      ; D956   00FE
        ADD@    R6,     R0                      ; D957   02F0
        XORR    R1,     R4                      ; D958   01CC
        SUBR    R4,     R5                      ; D959   0125
        CLRC                                    ; D95A   0006
        CMP@    R4,     R0                      ; D95B   0360
        CLRC                                    ; D95C   0006
        ADD@    R6,     R1                      ; D95D   02F1
        CMP     G_035E, R2                      ; D95E   0342 035E
        MOVR    R2,     R7                      ; D960   0097

        DECLE   $0003,  $0180,  $01B2,  $01FC   ; D961   0003 0180 01B2 01FC
        DECLE   $03A6,  $01AE,  $0358,  $02E5   ; D965   03A6 01AE 0358 02E5
        DECLE   $0118,  $028E,  $01C4,  $0154   ; D969   0118 028E 01C4 0154
        DECLE   $01CB,  $019F                   ; D96D   01CB 019F
L_D96F:
        XOR@    R1,     R6                      ; D96F   03CE
        MOVR    R5,     R6                      ; D970   00AE
        SUBR    R2,     R7                      ; D971   0117

        DECLE   $01C9,  $00B4,  $01BE,  $006C   ; D972   01C9 00B4 01BE 006C
        DECLE   $00CC,  $01C5,  $034E,  $01A5   ; D976   00CC 01C5 034E 01A5
        DECLE   $0118,  $008C,  $03CC,  $020B   ; D97A   0118 008C 03CC 020B
        DECLE   $017F                           ; D97E   017F

        ANDR    R4,     R3                      ; D97F   01A3
        XOR     .BTAB.1F,R6                     ; D980   03C6 021F
        DIS                                     ; D982   0003
        MOVR    R3,     R4                      ; D983   009C
        SUB@    R2,     R0                      ; D984   0310
        AND@    R1,     R4                      ; D985   038C
        ADDR    R2,     R5                      ; D986   00D5
        SUBR    R0,     R7                      ; D987   0107

        DECLE   $014B,  $02BC,  $000A,  $0184   ; D988   014B 02BC 000A 0184
        DECLE   $03C6,  $0270,  $0016,  $00E2   ; D98C   03C6 0270 0016 00E2
        DECLE   $03E8,  $0185,  $00E8,  $0263   ; D990   03E8 0185 00E8 0263
        DECLE   $0035,  $0342,  $00F2,  $0034   ; D994   0035 0342 00F2 0034
        DECLE   $02BB,  $0294,  $0161,  $0319   ; D998   02BB 0294 0161 0319
        DECLE   $0104,  $0068,  $0218,  $0161   ; D99C   0104 0068 0218 0161
        DECLE   $014A,  $034E,  $0091,  $0249   ; D9A0   014A 034E 0091 0249
        DECLE   $0083,  $0320,  $03D0,  $014A   ; D9A4   0083 0320 03D0 014A
        DECLE   $0361,  $0318,  $029E,  $0202   ; D9A8   0361 0318 029E 0202
        DECLE   $0190,  $03DC,  $03C4,  $0089   ; D9AC   0190 03DC 03C4 0089
        DECLE   $002C,  $0186,  $025C,  $00CA   ; D9B0   002C 0186 025C 00CA
        DECLE   $00ED,  $0112,  $00FC,  $0316   ; D9B4   00ED 0112 00FC 0316
        DECLE   $02C6,  $014D,  $0265,  $0013   ; D9B8   02C6 014D 0265 0013
        DECLE   $0089,  $007C,  $020A,  $01E1   ; D9BC   0089 007C 020A 01E1
        DECLE   $02D5,  $0191,  $03FB,  $0007   ; D9C0   02D5 0191 03FB 0007
        DECLE   $003D,  $03C0,  $0133,  $01F7   ; D9C4   003D 03C0 0133 01F7
        DECLE   $0024,  $023E,  $0303,  $00F0   ; D9C8   0024 023E 0303 00F0
        DECLE   $035B,  $0299,  $0093,  $006C   ; D9CC   035B 0299 0093 006C
        DECLE   $0288,  $0361,  $0378,  $03A9   ; D9D0   0288 0361 0378 03A9
        DECLE   $038C,  $0058,  $020C,  $018D   ; D9D4   038C 0058 020C 018D
        DECLE   $02EC,  $03FA,  $0089,  $0222   ; D9D8   02EC 03FA 0089 0222
        DECLE   $01A7,  $01BE,  $0346,  $01B0   ; D9DC   01A7 01BE 0346 01B0
        DECLE   $0228,  $017D,  $021C,  $00D6   ; D9E0   0228 017D 021C 00D6
        DECLE   $015F,  $0364,  $0064,  $0014   ; D9E4   015F 0364 0064 0014
        DECLE   $00BF,  $012B,  $032D,  $003B   ; D9E8   00BF 012B 032D 003B
        DECLE   $000C,  $01C3,  $01C8,  $026A   ; D9EC   000C 01C3 01C8 026A
        DECLE   $022B,  $011A,  $0020,  $0207   ; D9F0   022B 011A 0020 0207
        DECLE   $035B,  $02B4,  $0233,  $0135   ; D9F4   035B 02B4 0233 0135
        DECLE   $0021,  $032B,  $0285,  $03AE   ; D9F8   0021 032B 0285 03AE
        DECLE   $0371,  $004A,  $02C0,  $02B9   ; D9FC   0371 004A 02C0 02B9
        DECLE   $038F,  $0253,  $0219,  $02B2   ; DA00   038F 0253 0219 02B2
        DECLE   $021A,  $0291,  $0095,  $009A   ; DA04   021A 0291 0095 009A
        DECLE   $0218                           ; DA08   0218

        SUB@    R1,     R5                      ; DA09   030D
        CMPR    R2,     R0                      ; DA0A   0150
        ADCR    R4                              ; DA0B   002C
        SUB     .BTAB.B0,R6                     ; DA0C   0306 02B0
        ADDR    R5,     R2                      ; DA0E   00EA
        XORR    R4,     R6                      ; DA0F   01E6
        ANDR    R4,     R6                      ; DA10   01A6
        MOVR    R4,     R0                      ; DA11   00A0
        BGT     L_DC5B                          ; DA12   020E 0247

L_DA14:
        CMP@    R5,     R7                      ; DA14   036F
        INCR    R4                              ; DA15   000C
        SARC    R3,     1                       ; DA16   007B
        RRC     R3,     1                       ; DA17   0073
        MVO@    R5,     R1                      ; DA18   024D
        ADD@    R1,     R0                      ; DA19   02C8
        AND@    R6,     R2                      ; DA1A   03B2
        MVI@    R4,     R7                      ; DA1B   02A7

        DECLE   $0216,  $003C,  $0007,  $0000   ; DA1C   0216 003C 0007 0000

        SLR     R2,     1                       ; DA20   0062
        ADDR    R6,     R3                      ; DA21   00F3
        MOVR    R0,     R6                      ; DA22   0086
        GSWD    R2                              ; DA23   0032
        B       L_DA58                          ; DA24   0200 0032

        DECLE   $000A,  $024A,  $02EE,  $03A6   ; DA26   000A 024A 02EE 03A6
        DECLE   $027A,  $0200,  $0283,  $01B9   ; DA2A   027A 0200 0283 01B9
        DECLE   $014F,  $00F3,  $01A6,  $00DA   ; DA2E   014F 00F3 01A6 00DA
        DECLE   $00DE,  $0003,  $0074,  $0222   ; DA32   00DE 0003 0074 0222
        DECLE   $03E2,  $024B,  $00A3,  $02D3   ; DA36   03E2 024B 00A3 02D3
        DECLE   $02E6,  $024E,  $036E,  $0264   ; DA3A   02E6 024E 036E 0264
        DECLE   $01D9,  $03FE,  $03FB,  $03B3   ; DA3E   01D9 03FE 03FB 03B3
        DECLE   $0256,  $01D6,  $0004           ; DA42   0256 01D6 0004

        MOVR    R0,     R2                      ; DA45   0082
        CMPR    R4,     R1                      ; DA46   0161
        SARC    R3,     2                       ; DA47   007F
        ADDR    R3,     R5                      ; DA48   00DD
        ADDR    R4,     R4                      ; DA49   00E4
        ADD@    R4,     R2                      ; DA4A   02E2
        RRC     R3,     2                       ; DA4B   0077
        BNEQ    L_D876                          ; DA4C   022C 01D7

        CMP     .BTAB.53,R1                     ; DA4E   0341 0253
        SLR     R3,     1                       ; DA50   0063
        ADDR    R0,     R7                      ; DA51   00C7

        MVO     R7,     .BTAB.81                ; DA52   0247 0281
        CMPR    R4,     R3                      ; DA54   0163
        ADDR    R3,     R1                      ; DA55   00D9
        ADDR    R2,     R7                      ; DA56   00D7

        XORR    R7,     R0                      ; DA57   01F8
L_DA58:
        XOR     G_00E6, R3                      ; DA58   03C3 00E6
        DECLE   $0125,  $0052,  $0074,  $0324   ; DA5A   0125 0052 0074 0324
        DECLE   $01F6,  $0325,  $00B1,  $03D2   ; DA5E   01F6 0325 00B1 03D2
        DECLE   $0032,  $0094,  $0280,  $0204   ; DA62   0032 0094 0280 0204
        DECLE   $020C,  $02F0,  $00C6,  $0271   ; DA66   020C 02F0 00C6 0271
        DECLE   $0206,  $01C4,  $0361,  $0067   ; DA6A   0206 01C4 0361 0067
        DECLE   $01FA,  $0137,  $00D2,  $02E5   ; DA6E   01FA 0137 00D2 02E5
        DECLE   $00D4,  $0074,  $032E,  $02FE   ; DA72   00D4 0074 032E 02FE
        DECLE   $0363,  $02E9,  $0247,  $03E6   ; DA76   0363 02E9 0247 03E6
        DECLE   $02C6,  $0286,  $02C4,  $03E1   ; DA7A   02C6 0286 02C4 03E1
        DECLE   $007F,  $03FB,  $00F6,  $0386   ; DA7E   007F 03FB 00F6 0386
        DECLE   $0000,  $0075,  $0118,  $00CA   ; DA82   0000 0075 0118 00CA
        DECLE   $0000,  $00EB,  $0216,  $0168   ; DA86   0000 00EB 0216 0168
        DECLE   $01D0,  $0291,  $0000,  $0082   ; DA8A   01D0 0291 0000 0082
        DECLE   $0044,  $02D2,  $0398,  $0332   ; DA8E   0044 02D2 0398 0332
        DECLE   $02ED,  $0034,  $0224,  $024E   ; DA92   02ED 0034 0224 024E
        DECLE   $01B9,  $03D8,  $0228           ; DA96   01B9 03D8 0228

        MVI@    R2,     R5                      ; DA99   0295
        CMPR    R7,     R1                      ; DA9A   0179
        SUB@    R2,     R6                      ; DA9B   0316
        AND     G_01A8, R0                      ; DA9C   0380 01A8
        SUB@    R6,     R4                      ; DA9E   0334
        SUB@    R3,     R7                      ; DA9F   031F

        DECLE   $020D,  $02A1,  $0133,  $028B   ; DAA0   020D 02A1 0133 028B
        DECLE   $0014,  $011C,  $024D,  $0379   ; DAA4   0014 011C 024D 0379
        DECLE   $03C0,  $0338,  $0294,  $03A9   ; DAA8   03C0 0338 0294 03A9
        DECLE   $0298,  $0380,  $01A8,  $0366   ; DAAC   0298 0380 01A8 0366
        DECLE   $003D,  $035E,  $0299,  $0332   ; DAB0   003D 035E 0299 0332
        DECLE   $026B,  $0010,  $0225,  $01CE   ; DAB4   026B 0010 0225 01CE
        DECLE   $007C,  $03C9,  $033A,  $02B4   ; DAB8   007C 03C9 033A 02B4
        DECLE   $03BC,  $0303,  $03B1,  $03F9   ; DABC   03BC 0303 03B1 03F9
        DECLE   $0083,  $023D,  $03B1,  $0113   ; DAC0   0083 023D 03B1 0113
        DECLE   $0180,  $0111,  $03EC,  $0243   ; DAC4   0180 0111 03EC 0243
        DECLE   $038E,  $028D,  $0334,  $02CB   ; DAC8   038E 028D 0334 02CB
        DECLE   $0010,  $0125,  $020D,  $01BC   ; DACC   0010 0125 020D 01BC
        DECLE   $01C9,  $01B7,  $0234,  $03FC   ; DAD0   01C9 01B7 0234 03FC
        DECLE   $0000,  $0090,  $0182,  $0320   ; DAD4   0000 0090 0182 0320
        DECLE   $027F,  $0161,  $021E,  $00A0   ; DAD8   027F 0161 021E 00A0
        DECLE   $01A9,  $03B4,  $0221,  $022E   ; DADC   01A9 03B4 0221 022E
        DECLE   $028D,  $0233                   ; DAE0   028D 0233

        MOVR    R2,     R7                      ; DAE2   0097

        DECR    R1                              ; DAE3   0011
        SUBR    R2,     R3                      ; DAE4   0113
        BMI     L_DD24                          ; DAE5   020B 023D

        XOR@    R4,     R0                      ; DAE7   03E0
        SUB@    R5,     R5                      ; DAE8   032D
        CMP@    R6,     R4                      ; DAE9   0374
        SUBR    R5,     R7                      ; DAEA   012F

        DECLE   $000C,  $0160,  $0226,  $0218   ; DAEB   000C 0160 0226 0218
        DECLE   $020D,  $028E,  $0008,  $02C0   ; DAEF   020D 028E 0008 02C0
        DECLE   $01CD,  $0029,  $0192,  $003D   ; DAF3   01CD 0029 0192 003D
        DECLE   $0007,  $0000,  $0068,  $0118   ; DAF7   0007 0000 0068 0118
        DECLE   $01CD,  $010A,  $0206,  $0345   ; DAFB   01CD 010A 0206 0345
        DECLE   $0212,  $03CF,  $0362,  $00AE   ; DAFF   0212 03CF 0362 00AE
        DECLE   $01A5,  $025A,  $03C7,  $00B7   ; DB03   01A5 025A 03C7 00B7
        DECLE   $005A,  $0197                   ; DB07   005A 0197

        AND     G_018F, R0                      ; DB09   0380 018F
        ANDR    R5,     R1                      ; DB0B   01A9
        XORR    R1,     R5                      ; DB0C   01CD
        SUBR    R0,     R1                      ; DB0D   0101
        XORR    R7,     R5                      ; DB0E   01FD
        MVO@    R1,     R1                      ; DB0F   0249
        ADD@    R4,     R1                      ; DB10   02E1
        XOR@    R1,     R4                      ; DB11   03CC
        RRC     R3,     2                       ; DB12   0077
        SLR     R2,     2                       ; DB13   0066
        ANDR    R6,     R6                      ; DB14   01B6
        BNOV    L_DE5E                          ; DB15   020A 0347
        ADDR    R3,     R7                      ; DB17   00DF

        DECLE   $0266,  $03B2,  $01C2,  $015C   ; DB18   0266 03B2 01C2 015C
        DECLE   $019F,  $0149,  $0000,  $005B   ; DB1C   019F 0149 0000 005B
        DECLE   $0210,  $02E7,  $0180,  $031B   ; DB20   0210 02E7 0180 031B
        DECLE   $018B,  $03FA,  $020E,  $0325   ; DB24   018B 03FA 020E 0325
        DECLE   $0318,  $01F7,  $03D4,  $037A   ; DB28   0318 01F7 03D4 037A
        DECLE   $02B4,  $024A,  $0150,  $00D4   ; DB2C   02B4 024A 0150 00D4
        DECLE   $03F3,  $03B6,  $029D,  $015C   ; DB30   03F3 03B6 029D 015C
        DECLE   $029C,  $012D,  $002A,  $028E   ; DB34   029C 012D 002A 028E
        DECLE   $0246,  $035D,  $01C5,  $0156   ; DB38   0246 035D 01C5 0156
        DECLE   $01AB,  $02C2,  $016F,  $0291   ; DB3C   01AB 02C2 016F 0291
        DECLE   $0240,  $0242,  $03A1,  $019C   ; DB40   0240 0242 03A1 019C
        DECLE   $00C8,  $01D0,  $00F4,  $03E2   ; DB44   00C8 01D0 00F4 03E2
        DECLE   $022A,  $030E,  $0376,  $004B   ; DB48   022A 030E 0376 004B
        DECLE   $0254,  $0003,  $001E,  $0022   ; DB4C   0254 0003 001E 0022
        DECLE   $004C,  $031B,  $0234           ; DB50   004C 031B 0234

        XORR    R7,     R0                      ; DB53   01F8
        BGT     L_DBBC                          ; DB54   020E 0066
        ADDR    R3,     R7                      ; DB56   00DF

        XOR@    R3,     R5                      ; DB57   03DD
        ADD@    R2,     R7                      ; DB58   02D7

        DECLE   $03BB,  $00A3,  $0005,  $0150   ; DB59   03BB 00A3 0005 0150
        DECLE   $0252,  $0074,  $03C5,  $030E   ; DB5D   0252 0074 03C5 030E
        DECLE   $0001                           ; DB61   0001

        MOVR    R3,     R1                      ; DB62   0099
        SUB@    R3,     R0                      ; DB63   0318
        AND@    R1,     R4                      ; DB64   038C
        MOVR    R4,     R2                      ; DB65   00A2
        ADDR    R7,     R4                      ; DB66   00FC
        CMP@    R1,     R1                      ; DB67   0349
        CMP     .BTAB.6E,R2                     ; DB68   0342 026E
        ADDR    R5,     R6                      ; DB6A   00EE
        SUBR    R5,     R3                      ; DB6B   012B
        MOVR    R2,     R5                      ; DB6C   0095
        CMPR    R1,     R5                      ; DB6D   014D
        XOR     G_031F, R1                      ; DB6E   03C1 031F
        XOR     G_00B8, R1                      ; DB70   03C1 00B8
        ANDR    R5,     R2                      ; DB72   01AA
        XOR@    R5,     R0                      ; DB73   03E8
        XOR     G_00E7, R5                      ; DB74   03C5 00E7
        RLC     R2,     2                       ; DB76   0056
        XOR@    R1,     R5                      ; DB77   03CD
        MVI     G_013B, R5                      ; DB78   0285 013B
        ANDR    R6,     R5                      ; DB7A   01B5
        MVI@    R4,     R4                      ; DB7B   02A4
        ADDR    R7,     R2                      ; DB7C   00FA
        AND     .STIC.Y.7,R2                    ; DB7D   0382 000F
        SUBR    R0,     R3                      ; DB7F   0103
        SUB@    R3,     R7                      ; DB80   031F

        DECLE   $0065,  $01FE,  $008E,  $0078   ; DB81   0065 01FE 008E 0078
        DECLE   $03F4,  $03F1,  $038C,  $008E   ; DB85   03F4 03F1 038C 008E
        DECLE   $0305,  $0106,  $0142,  $024F   ; DB89   0305 0106 0142 024F
        DECLE   $01F0,  $0389,  $00C5,  $03E1   ; DB8D   01F0 0389 00C5 03E1
        DECLE   $01C0,  $0000,  $0020,  $02F8   ; DB91   01C0 0000 0020 02F8
        DECLE   $00A0,  $03FF,  $0247,  $0207   ; DB95   00A0 03FF 0247 0207
        DECLE   $0261,  $0210,  $00D8,  $0023   ; DB99   0261 0210 00D8 0023
        DECLE   $0000                           ; DB9D   0000

        SUBR    R4,     R0                      ; DB9E   0120
        SUB@    R4,     R2                      ; DB9F   0322
        SUBI    #$018E, R7                      ; DBA0   033F 018E

        MVO@    R6,     R1                      ; DBA2   024E
        ANDR    R0,     R4                      ; DBA3   0184
        MOVR    R4,     R0                      ; DBA4   00A0
        RLC     R2,     2                       ; DBA5   0056
        XORR    R2,     R6                      ; DBA6   01D6
        ADD     G_0177, R7                      ; DBA7   02C7 0177

        DECLE   $02AC,  $03E5,  $0022,  $0080   ; DBA9   02AC 03E5 0022 0080
        DECLE   $03C1,  $02E0,  $03F7           ; DBAD   03C1 02E0 03F7

        CMP@    R1,     R4                      ; DBB0   034C
        TSTR    R5                              ; DBB1   00AD
        XORI    #$0302, R5                      ; DBB2   03FD 0302
        CMPR    R2,     R1                      ; DBB4   0151
        CMPI    #$0383, R6                      ; DBB5   037E 0383
        SAR     R2,     1                       ; DBB7   006A
        ADDR    R1,     R5                      ; DBB8   00CD
        MOVR    R3,     R7                      ; DBB9   009F
        B       L_DBC3                          ; DBBA   0200 0007

L_DBBC:
        MVII    #$0240, R6                      ; DBBC   02BE 0240
        DECLE   $01A6,  $023C,  $00A8,  $00E8   ; DBBE   01A6 023C 00A8 00E8
        DECLE   $027C                           ; DBC2   027C
L_DBC3:
        XORR    R0,     R6                      ; DBC3   01C6
        DECLE   $0341,  $01A7,  $0197,  $018D   ; DBC4   0341 01A7 0197 018D
        DECLE   $011A,  $0105,  $0105,  $00E2   ; DBC8   011A 0105 0105 00E2
        DECLE   $00AE,  $03F6,  $034D,  $019C   ; DBCC   00AE 03F6 034D 019C
        DECLE   $01BC,  $008E,  $00E0,  $0020   ; DBD0   01BC 008E 00E0 0020
        DECLE   $01EC,  $021C,  $01B7,  $00A0   ; DBD4   01EC 021C 01B7 00A0
        DECLE   $030D,  $021D                   ; DBD8   030D 021D

        SUB     G_0046, R6                      ; DBDA   0306 0046
        CMPR    R2,     R2                      ; DBDC   0152
        SUBI    #$0270, R7                      ; DBDD   033F 0270

        DECLE   $03ED,  $03B4,  $01ED,  $0291   ; DBDF   03ED 03B4 01ED 0291
        DECLE   $0000,  $0212,  $0040,  $03F1   ; DBE3   0000 0212 0040 03F1
        DECLE   $037C,  $0324,  $0000,  $024C   ; DBE7   037C 0324 0000 024C
        DECLE   $0080,  $03E5,  $0341,  $0057   ; DBEB   0080 03E5 0341 0057
        DECLE   $0001,  $02C8,  $03E9,  $0005   ; DBEF   0001 02C8 03E9 0005

        PULR    R3                              ; DBF3   02B3
        MOVR    R4,     R7                      ; DBF4   00A7

        EIS                                     ; DBF5   0002
        TSTR    R0                              ; DBF6   0080
        XORR    R2,     R5                      ; DBF7   01D5
        AND@    R2,     R0                      ; DBF8   0390
        SWAP    R1,     2                       ; DBF9   0045
        SUB@    R1,     R7                      ; DBFA   030F

        DECLE   $0001                           ; DBFB   0001

        TSTR    R2                              ; DBFC   0092
        SUBR    R3,     R0                      ; DBFD   0118
        CMP@    R1,     R5                      ; DBFE   034D
        MOVR    R6,     R2                      ; DBFF   00B2
        XORR    R7,     R5                      ; DC00   01FD
        SUBR    R0,     R5                      ; DC01   0105
        XORR    R0,     R2                      ; DC02   01C2
        ADDR    R3,     R6                      ; DC03   00DE
        ADDR    R6,     R6                      ; DC04   00F6
        SUBR    R5,     R5                      ; DC05   012D
        ANDR    R5,     R5                      ; DC06   01AD
        ADDR    R5,     R0                      ; DC07   00E8
        AND@    R4,     R5                      ; DC08   03A5
        MOVR    R5,     R7                      ; DC09   00AF

        DECLE   $0046,  $01CE,  $02C5,  $013F   ; DC0A   0046 01CE 02C5 013F
        DECLE   $00BA,  $02E6,  $003A,  $0380   ; DC0E   00BA 02E6 003A 0380
        DECLE   $0008,  $0010,  $03E1,  $014D   ; DC12   0008 0010 03E1 014D
        DECLE   $008B,  $0206,  $0107,  $02C3   ; DC16   008B 0206 0107 02C3
        DECLE   $01DE,  $016E,  $01AC,  $00BD   ; DC1A   01DE 016E 01AC 00BD
        DECLE   $03D5,  $0007,  $02FC,  $0045   ; DC1E   03D5 0007 02FC 0045
        DECLE   $01F8,  $01B0,  $005A,  $00A4   ; DC22   01F8 01B0 005A 00A4
        DECLE   $00F0,  $0066,  $03E4,  $01D5   ; DC26   00F0 0066 03E4 01D5
        DECLE   $01BB,  $01A7                   ; DC2A   01BB 01A7

        CMPR    R1,     R5                      ; DC2C   014D
        MOVR    R0,     R6                      ; DC2D   0086
        XORR    R7,     R6                      ; DC2E   01FE
        ADDR    R0,     R7                      ; DC2F   00C7

        SUBR    R6,     R2                      ; DC30   0132
        CMP@    R1,     R7                      ; DC31   034F
        ADDR    R5,     R4                      ; DC32   00EC
        ADDR    R1,     R5                      ; DC33   00CD
        ANDR    R5,     R5                      ; DC34   01AD
        CMPR    R3,     R6                      ; DC35   015E
        TSTR    R4                              ; DC36   00A4
        ADDR    R7,     R0                      ; DC37   00F8
        SARC    R2,     1                       ; DC38   007A
        XORR    R5,     R4                      ; DC39   01EC
        XORR    R3,     R2                      ; DC3A   01DA
        XORR    R2,     R3                      ; DC3B   01D3
        AND@    R4,     R3                      ; DC3C   03A3
        CMPR    R1,     R5                      ; DC3D   014D
        MOVR    R2,     R3                      ; DC3E   0093
        SUB     G_0347, R5                      ; DC3F   0305 0347
        CMPR    R6,     R3                      ; DC41   0173
        ADD@    R5,     R7                      ; DC42   02EF

        DECLE   $016E,  $00EC,  $01C5,  $00EA   ; DC43   016E 00EC 01C5 00EA
        DECLE   $03A5,  $00F7                   ; DC47   03A5 00F7

        MVO@    R6,     R2                      ; DC49   0256
        XOR@    R5,     R2                      ; DC4A   03EA
        XORR    R2,     R5                      ; DC4B   01D5
        SUBR    R3,     R7                      ; DC4C   011F

        DECLE   $00B5,  $038D,  $00BE,  $02FE   ; DC4D   00B5 038D 00BE 02FE
        DECLE   $00C5,  $0322,  $038F           ; DC51   00C5 0322 038F

        ADD@    R5,     R4                      ; DC54   02EC
        ANDR    R5,     R2                      ; DC55   01AA
        ANDR    R4,     R5                      ; DC56   01A5
        CMPR    R1,     R6                      ; DC57   014E
        XOR     G_00A7, R6                      ; DC58   03C6 00A7
        NEGR    R6                              ; DC5A   0026
L_DC5B:
        ANDR    R5,     R6                      ; DC5B   01AE
        DECLE   $007F,  $0138,  $00AD,  $014D   ; DC5C   007F 0138 00AD 014D
        DECLE   $0105,  $01F7,  $0083,  $03A2   ; DC60   0105 01F7 0083 03A2
        DECLE   $002C,  $028A,  $024D,  $00A4   ; DC64   002C 028A 024D 00A4
        DECLE   $00A1,  $0240,  $01C0,  $03E0   ; DC68   00A1 0240 01C0 03E0
        DECLE   $0228,  $01A7,  $014C,  $03EA   ; DC6C   0228 01A7 014C 03EA
        DECLE   $00F7                           ; DC70   00F7

        SLL     R0,     2                       ; DC71   004C
        XORR    R1,     R6                      ; DC72   01CE
        SUB     G_0187, R0                      ; DC73   0300 0187
        MOVR    R4,     R2                      ; DC75   00A2
        XOR@    R4,     R5                      ; DC76   03E5
        ADDR    R5,     R6                      ; DC77   00EE
        XORI    #$0040, R6                      ; DC78   03FE 0040
        SUBR    R3,     R6                      ; DC7A   011E
        SUB@    R1,     R7                      ; DC7B   030F

        DECLE   $03CC,  $01CD,  $0105,  $0105   ; DC7C   03CC 01CD 0105 0105
        DECLE   $0302,  $02DF,  $0378,  $02ED   ; DC80   0302 02DF 0378 02ED
        DECLE   $019C,  $02BA,  $00B0,  $00A0   ; DC84   019C 02BA 00B0 00A0
        DECLE   $004A,  $0200                   ; DC88   004A 0200

        CMP@    R3,     R3                      ; DC8A   035B
        ANDR    R5,     R3                      ; DC8B   01AB
L_DC8C:
        ANDR    R2,     R6                      ; DC8C   0196
        DECLE   $0038,  $0000,  $00C2,  $0118   ; DC8D   0038 0000 00C2 0118
        DECLE   $0049,  $0000,  $0097,  $0111   ; DC91   0049 0000 0097 0111
        DECLE   $0156,  $03F2,  $0279,  $0186   ; DC95   0156 03F2 0279 0186
        DECLE   $0259,  $027F                   ; DC99   0259 027F

        ANDR    R4,     R4                      ; DC9B   01A4
        ANDR    R2,     R1                      ; DC9C   0191
        SUBR    R5,     R7                      ; DC9D   012F

        ADD@    R6,     R0                      ; DC9E   02F0
        AND@    R4,     R4                      ; DC9F   03A4
        ADDR    R1,     R6                      ; DCA0   00CE
        XORR    R5,     R6                      ; DCA1   01EE
        XOR@    R6,     R2                      ; DCA2   03F2
        MOVR    R2,     R7                      ; DCA3   0097

        SUB@    R5,     R5                      ; DCA4   032D
        ADD     G_0380, R6                      ; DCA5   02C6 0380
        MOVR    R5,     R7                      ; DCA7   00AF

        CMP@    R3,     R2                      ; DCA8   035A
        ANDR    R4,     R6                      ; DCA9   01A6
        RLC     R1,     1                       ; DCAA   0051
        ADDI    #$01A4, R7                      ; DCAB   02FF 01A4

        SUB     G_01AF, R1                      ; DCAD   0301 01AF
        XORR    R6,     R1                      ; DCAF   01F1
        CMP@    R2,     R5                      ; DCB0   0355
        MVO@    R2,     R2                      ; DCB1   0252
        XORR    R2,     R0                      ; DCB2   01D0
        XOR     G_0105, R0                      ; DCB3   03C0 0105
        MVI@    R3,     R7                      ; DCB5   029F

        AND     G_00CC, R0                      ; DCB6   0380 00CC
        ADD@    R5,     R7                      ; DCB8   02EF

        XOR@    R2,     R2                      ; DCB9   03D2
        MOVR    R2,     R3                      ; DCBA   0093
        SUBR    R5,     R4                      ; DCBB   012C
        ADD@    R5,     R1                      ; DCBC   02E9
        SUB     .BTAB.A5,R7                     ; DCBD   0307 02A5

        XORR    R3,     R5                      ; DCBF   01DD
        ANDR    R4,     R6                      ; DCC0   01A6
        MVO     R5,     G_02FE                  ; DCC1   0245 02FE
        ANDR    R4,     R4                      ; DCC3   01A4
        CMPR    R3,     R1                      ; DCC4   0159
        ADDR    R0,     R7                      ; DCC5   00C7

        MOVR    R7,     R0                      ; DCC6   00B8
        ADD     G_00D2, R6                      ; DCC7   02C6 00D2
        ADDR    R5,     R7                      ; DCC9   00EF

        RLC     R2,     1                       ; DCCA   0052
        RRC     R0,     1                       ; DCCB   0070
        SUB@    R6,     R6                      ; DCCC   0336
        ADDR    R5,     R2                      ; DCCD   00EA
        CMP@    R4,     R4                      ; DCCE   0364
        ADDR    R7,     R1                      ; DCCF   00F9
        XORR    R2,     R1                      ; DCD0   01D1
        XORR    R4,     R6                      ; DCD1   01E6
        MVO     R7,     .BTAB.01                ; DCD2   0247 0201
        ADD     .BTAB.C9,R3                     ; DCD4   02C3 02C9
        ADDR    R0,     R7                      ; DCD6   00C7

        DECLE   $027B,  $0217                   ; DCD7   027B 0217

        ADDR    R1,     R6                      ; DCD9   00CE
        ADDR    R4,     R7                      ; DCDA   00E7

        SWAP    R2,     1                       ; DCDB   0042
        SAR     R0,     2                       ; DCDC   006C
        SUBR    R6,     R6                      ; DCDD   0136
        ADDR    R6,     R3                      ; DCDE   00F3
        CMP     G_00D5, R2                      ; DCDF   0342 00D5
        CMPR    R2,     R2                      ; DCE1   0152
        CLRR    R4                              ; DCE2   01E4
        B       L_DD18                          ; DCE3   0200 0033

        DECLE   $0204,  $0167,  $02F3,  $014D   ; DCE5   0204 0167 02F3 014D
        DECLE   $00A6,  $0005,  $0387,  $02A3   ; DCE9   00A6 0005 0387 02A3
        DECLE   $00EE,  $03F4,  $00E9,  $00AD   ; DCED   00EE 03F4 00E9 00AD
        DECLE   $00A1,  $027F,  $0300,  $01C3   ; DCF1   00A1 027F 0300 01C3
        DECLE   $0240,  $01AE,  $03D8,  $0384   ; DCF5   0240 01AE 03D8 0384
        DECLE   $00EF,  $005A,  $03CF,  $0282   ; DCF9   00EF 005A 03CF 0282
        DECLE   $0157,  $02A6,  $034C,  $00AE   ; DCFD   0157 02A6 034C 00AE
        DECLE   $01FA,  $0349,  $02A2,  $020E   ; DD01   01FA 0349 02A2 020E

        ADD@    R5,     R6                      ; DD05   02EE
        INCR    R5                              ; DD06   000D
        ANDR    R5,     R5                      ; DD07   01AD
        MVO@    R0,     R3                      ; DD08   0258
        SUB@    R4,     R5                      ; DD09   0325
        SUBR    R5,     R7                      ; DD0A   012F

        DECLE   $025A,  $01D5,  $019A,  $01BB   ; DD0B   025A 01D5 019A 01BB
        DECLE   $01A0,  $02E5,  $021F           ; DD0F   01A0 02E5 021F

        MVI     G_0036, R4                      ; DD12   0284 0036
        SUB@    R1,     R6                      ; DD14   030E
        XOR@    R5,     R1                      ; DD15   03E9
        XORR    R1,     R4                      ; DD16   01CC
        TSTR    R6                              ; DD17   00B6
L_DD18:
        SKIP                                    ; DD18   0208
        AND@    R1,     R1                      ; DD19   0389
        ADD     .BTAB.EE,R2                     ; DD1A   02C2 02EE
        CMP@    R5,     R4                      ; DD1C   036C
        AND@    R5,     R6                      ; DD1D   03AE
        MOVR    R3,     R4                      ; DD1E   009C
        AND@    R3,     R5                      ; DD1F   039D
        AND     G_03E7, R1                      ; DD20   0381 03E7
        SUBI    #$0098, R7                      ; DD22   033F 0098

L_DD24:
        ANDR    R7,     R1                      ; DD24   01B9
        DECLE   $004E,  $0265,  $00D8,  $004C   ; DD25   004E 0265 00D8 004C
        DECLE   $01CD,  $020F,  $016B,  $02A4   ; DD29   01CD 020F 016B 02A4
        DECLE   $01CD,  $00A6,  $020D,  $0147   ; DD2D   01CD 00A6 020D 0147
        DECLE   $0183,  $013E,  $01F2,  $00CA   ; DD31   0183 013E 01F2 00CA
        DECLE   $0195,  $01BE,  $0126,  $0128   ; DD35   0195 01BE 0126 0128
        DECLE   $027A,  $0013,  $020D,  $0173   ; DD39   027A 0013 020D 0173
        DECLE   $029B,  $01A4,  $027E,  $0010   ; DD3D   029B 01A4 027E 0010
        DECLE   $03D1,  $0005,  $00D9,  $02A5   ; DD41   03D1 0005 00D9 02A5
        DECLE   $00CC,  $0070,  $003F,  $0112   ; DD45   00CC 0070 003F 0112
        DECLE   $025C,  $0189,  $0000,  $00EB   ; DD49   025C 0189 0000 00EB
        DECLE   $0085,  $0197,  $021A,  $0070   ; DD4D   0085 0197 021A 0070
        DECLE   $0000,  $0081,  $0018,  $018D   ; DD51   0000 0081 0018 018D
        DECLE   $0105,  $0205,  $00C4,  $0062   ; DD55   0105 0205 00C4 0062
        DECLE   $039E,  $0203,  $026D,  $01A4   ; DD59   039E 0203 026D 01A4
        DECLE   $035C,  $0086,  $0130,  $026E   ; DD5D   035C 0086 0130 026E
        DECLE   $03E1,  $011D,  $0183,  $01A1   ; DD61   03E1 011D 0183 01A1
        DECLE   $014D,  $00BB,  $0205,  $0389   ; DD65   014D 00BB 0205 0389
        DECLE   $0232                           ; DD69   0232

        CMP@    R3,     R6                      ; DD6A   035E
        CMP@    R5,     R0                      ; DD6B   0368
        MVI@    R5,     R0                      ; DD6C   02A8
        TSTR    R5                              ; DD6D   00AD
        SUB@    R3,     R7                      ; DD6E   031F

        DECLE   $03CF,  $0103,  $0222,  $03C7   ; DD6F   03CF 0103 0222 03C7
        DECLE   $00BA,  $0037,  $0201           ; DD73   00BA 0037 0201

        SUB     G_033D, R0                      ; DD76   0300 033D
        RLC     R0,     1                       ; DD78   0050
        XORR    R3,     R0                      ; DD79   01D8
        XOR@    R3,     R6                      ; DD7A   03DE
        MVI@    R4,     R3                      ; DD7B   02A3
        SUBR    R5,     R0                      ; DD7C   0128
        SAR     R2,     1                       ; DD7D   006A
        XOR@    R2,     R3                      ; DD7E   03D3
        ADDR    R2,     R6                      ; DD7F   00D6
        CMPR    R5,     R7                      ; DD80   016F
        MOVR    R6,     R2                      ; DD81   00B2
        XOR@    R1,     R6                      ; DD82   03CE
        MOVR    R0,     R6                      ; DD83   0086
        SUBR    R1,     R5                      ; DD84   010D
        ANDR    R1,     R1                      ; DD85   0189
        CMPR    R0,     R3                      ; DD86   0143
        ADD@    R5,     R6                      ; DD87   02EE
        CMPR    R5,     R2                      ; DD88   016A
        ADCR    R0                              ; DD89   0028
        XORR    R0,     R6                      ; DD8A   01C6
        XOR@    R3,     R2                      ; DD8B   03DA
        ANDR    R4,     R3                      ; DD8C   01A3
        SUBR    R4,     R0                      ; DD8D   0120
        MVO@    R2,     R3                      ; DD8E   025A
        XORR    R1,     R2                      ; DD8F   01CA
        SUBR    R2,     R3                      ; DD90   0113
        ADDR    R3,     R7                      ; DD91   00DF

        DECLE   $03CA,  $03CD,  $00A2,  $0105   ; DD92   03CA 03CD 00A2 0105
        DECLE   $0349,  $0252,  $020E           ; DD96   0349 0252 020E

        XOR@    R5,     R6                      ; DD99   03EE
        INCR    R0                              ; DD9A   0008
        ANDR    R4,     R6                      ; DD9B   01A6
        MVO@    R6,     R3                      ; DD9C   025E
        MOVR    R0,     R5                      ; DD9D   0085
        SUBR    R4,     R0                      ; DD9E   0120
        SLLC    R0,     1                       ; DD9F   0058
        XOR     .BTAB.48,R4                     ; DDA0   03C4 0248
        SUBR    R3,     R7                      ; DDA2   011F

        DECLE   $03BB,  $03A4,  $0025,  $00F0   ; DDA3   03BB 03A4 0025 00F0
        DECLE   $005F,  $010A,  $021F           ; DDA7   005F 010A 021F

        SUB@    R1,     R5                      ; DDAA   030D
        ADDR    R4,     R2                      ; DDAB   00E2
        ADDR    R7,     R5                      ; DDAC   00FD
        SUBR    R0,     R7                      ; DDAD   0107

        ANDR    R6,     R2                      ; DDAE   01B2
        MOVR    R3,     R6                      ; DDAF   009E
        ADD@    R6,     R6                      ; DDB0   02F6
        MVO@    R2,     R1                      ; DDB1   024A
        ANDR    R4,     R5                      ; DDB2   01A5
        XORR    R3,     R0                      ; DDB3   01D8
        MOVR    R5,     R1                      ; DDB4   00A9
        ADDR    R5,     R0                      ; DDB5   00E8
        MVO@    R2,     R3                      ; DDB6   025A
        XORR    R2,     R5                      ; DDB7   01D5
        ADD     G_017B, R4                      ; DDB8   02C4 017B
        MOVR    R4,     R7                      ; DDBA   00A7

        DECLE   $02E5,  $000C,  $0080,  $0040   ; DDBB   02E5 000C 0080 0040
        DECLE   $010D,  $0216,  $030C,  $0199   ; DDBF   010D 0216 030C 0199
        DECLE   $00FD,  $0089,  $02B2,  $002E   ; DDC3   00FD 0089 02B2 002E
        DECLE   $0076,  $012A,  $019D,  $019A   ; DDC7   0076 012A 019D 019A
        DECLE   $006D,  $0110,  $0264,  $01EA   ; DDCB   006D 0110 0264 01EA
        DECLE   $01C4,  $010B,  $01AF,  $0038   ; DDCF   01C4 010B 01AF 0038
        DECLE   $0000,  $0079,  $0218,  $0089   ; DDD3   0000 0079 0218 0089
        DECLE   $0000,  $0058,  $008A,  $01E8   ; DDD7   0000 0058 008A 01E8
        DECLE   $03A2,  $0092,  $0000,  $00EC   ; DDDB   03A2 0092 0000 00EC
        DECLE   $011C,  $016F,  $0301,  $0036   ; DDDF   011C 016F 0301 0036
        DECLE   $0347,  $03D0,  $0109,  $0309   ; DDE3   0347 03D0 0109 0309
        DECLE   $002E,  $0018,  $02B6,  $0273   ; DDE7   002E 0018 02B6 0273
        DECLE   $0139,  $0315,  $03BE,  $0178   ; DDEB   0139 0315 03BE 0178
        DECLE   $03A0,  $0069,  $021C,  $0299   ; DDEF   03A0 0069 021C 0299
        DECLE   $0136,  $025B,  $03D8,  $0326   ; DDF3   0136 025B 03D8 0326
        DECLE   $004B,  $03BD,  $038B,  $0031   ; DDF7   004B 03BD 038B 0031
        DECLE   $02D5,  $0179,  $0011,  $00C0   ; DDFB   02D5 0179 0011 00C0
        DECLE   $0179,  $039A,  $027F,  $031C   ; DDFF   0179 039A 027F 031C
        DECLE   $0295,  $0336,  $0209,  $03DC   ; DE03   0295 0336 0209 03DC
        DECLE   $0225,  $008D,  $02BE,  $019B   ; DE07   0225 008D 02BE 019B
        DECLE   $033A,  $0354,  $03B4,  $033B   ; DE0B   033A 0354 03B4 033B
        DECLE   $0001,  $0101,  $0303,  $0343   ; DE0F   0001 0101 0303 0343
        DECLE   $0369,  $0291,  $00A0,  $01A9   ; DE13   0369 0291 00A0 01A9
        DECLE   $02B6,  $0113,  $01BE,  $02D9   ; DE17   02B6 0113 01BE 02D9
        DECLE   $0135,  $02AB,  $0014,  $0125   ; DE1B   0135 02AB 0014 0125
        DECLE   $004D,  $033D,  $018B,  $03B0   ; DE1F   004D 033D 018B 03B0
        DECLE   $02D5,  $0329,  $0219,  $0080   ; DE23   02D5 0329 0219 0080
        DECLE   $0169,  $021A,  $0003,  $018F   ; DE27   0169 021A 0003 018F
        DECLE   $02C5,  $0334,  $0007,  $0031   ; DE2B   02C5 0334 0007 0031
        DECLE   $0125,  $004D,  $03FC,  $0182   ; DE2F   0125 004D 03FC 0182
        DECLE   $023B,  $0274,  $02F1,  $0226   ; DE33   023B 0274 02F1 0226
        DECLE   $00A2,  $0111,  $0362,  $005D   ; DE37   00A2 0111 0362 005D
        DECLE   $020C                           ; DE3B   020C

        MVI@    R4,     R1                      ; DE3C   02A1
        MOVR    R2,     R3                      ; DE3D   0093
        SUBR    R5,     R4                      ; DE3E   012C
        SETC                                    ; DE3F   0007
        ADD@    R5,     R1                      ; DE40   02E9
        XOR@    R2,     R4                      ; DE41   03D4
        AND     G_0336, R5                      ; DE42   0385 0336
        PULR    R5                              ; DE44   02B5
        RSWD    R1                              ; DE45   0039
        SUBR    R4,     R5                      ; DE46   0125
        INCR    R7                              ; DE47   000F

        DECLE   $003F                           ; DE48   003F
L_DE49:
        CMPR    R6,     R3                      ; DE49   0173
        DECLE   $022F,  $0034,  $0007,  $0000   ; DE4A   022F 0034 0007 0000

        ANDR    R4,     R6                      ; DE4E   01A6
        DECR    R0                              ; DE4F   0010
        SUB@    R1,     R5                      ; DE50   030D
L_DE51:
        ADDR    R7,     R6                      ; DE51   00FE
        DECLE   $021A                           ; DE52   021A

        AND@    R1,     R5                      ; DE53   038D
        ADD@    R2,     R0                      ; DE54   02D0
        ADD@    R5,     R4                      ; DE55   02EC
        MVO@    R4,     R2                      ; DE56   0254
        CMP@    R4,     R6                      ; DE57   0366
        MOVR    R0,     R7                      ; DE58   0087

        DECLE   $030D,  $0187                   ; DE59   030D 0187

        ADD@    R5,     R0                      ; DE5B   02E8
        CMPR    R5,     R6                      ; DE5C   016E
        SUBR    R5,     R2                      ; DE5D   012A
L_DE5E:
        INCR    R1                              ; DE5E   0009
        DECLE   $01FE,  $0000,  $014C,  $00C0   ; DE5F   01FE 0000 014C 00C0
        DECLE   $0373,  $0139,  $0383,  $0013   ; DE63   0373 0139 0383 0013
        DECLE   $02EC,  $00BF,  $0295,  $0379   ; DE67   02EC 00BF 0295 0379
        DECLE   $029E,  $03E1,  $0009,  $0396   ; DE6B   029E 03E1 0009 0396
        DECLE   $006D,  $032A,  $02B8,  $030D   ; DE6F   006D 032A 02B8 030D
        DECLE   $0360,  $0000,  $03D6,  $022B   ; DE73   0360 0000 03D6 022B
        DECLE   $01AD,  $005C,  $01A7,  $01B8   ; DE77   01AD 005C 01A7 01B8
        DECLE   $01F8,  $0375,  $007E,  $025C   ; DE7B   01F8 0375 007E 025C
        DECLE   $03E1,  $00E4,  $0382,  $03A1   ; DE7F   03E1 00E4 0382 03A1
        DECLE   $026B,  $023E,  $03FC,  $001B   ; DE83   026B 023E 03FC 001B
        DECLE   $0210                           ; DE87   0210

        ADDR    R1,     R4                      ; DE88   00CC
        ADCR    R6                              ; DE89   002E
        ANDR    R4,     R4                      ; DE8A   01A4
        MOVR    R1,     R4                      ; DE8B   008C
        SUBR    R1,     R7                      ; DE8C   010F

        DECLE   $00BE,  $001C,  $0336,  $03DF   ; DE8D   00BE 001C 0336 03DF

        DECR    R1                              ; DE91   0011
        CLRR    R0                              ; DE92   01C0
        MOVR    R5,     R0                      ; DE93   00A8
        MVO@    R2,     R5                      ; DE94   026A
        PULR    R6                              ; DE95   02B6
        SUBR    R4,     R1                      ; DE96   0121
        MVO     R4,     .STIC.X.7               ; DE97   0244 0007
        ADD@    R3,     R7                      ; DE99   02DF

        DECLE   $03DF,  $0233,  $03CB,  $0028   ; DE9A   03DF 0233 03CB 0028
        DECLE   $012D,  $02C1,  $00EA,  $0028   ; DE9E   012D 02C1 00EA 0028
        DECLE   $031A,  $0205,  $0024,  $011A   ; DEA2   031A 0205 0024 011A
        DECLE   $0322,  $009E,  $01B1,  $03C9   ; DEA6   0322 009E 01B1 03C9
        DECLE   $0000,  $00B9,  $0292,  $013F   ; DEAA   0000 00B9 0292 013F

        ADCR    R2                              ; DEAE   002A
        CMPR    R0,     R0                      ; DEAF   0140
        XOR@    R4,     R6                      ; DEB0   03E6
        ADDI    #$002D, R0                      ; DEB1   02F8 002D
        XORR    R4,     R0                      ; DEB3   01E0
        NOP                                     ; DEB4   0034
        AND@    R6,     R5                      ; DEB5   03B5
        DIS                                     ; DEB6   0003
        ADDR    R4,     R0                      ; DEB7   00E0
        ADDR    R2,     R4                      ; DEB8   00D4
        MOVR    R7,     R6                      ; DEB9   00BE
        CLRR    R4                              ; DEBA   01E4
        ADDR    R6,     R0                      ; DEBB   00F0
        EIS                                     ; DEBC   0002
        ADDR    R4,     R3                      ; DEBD   00E3
        CMPR    R5,     R3                      ; DEBE   016B
        MVO@    R3,     R5                      ; DEBF   026B
        CMPI    #$00F1, R3                      ; DEC0   037B 00F1
        MOVR    R1,     R2                      ; DEC2   008A
        SUBR    R0,     R1                      ; DEC3   0101
        ADD@    R6,     R3                      ; DEC4   02F3
        PULR    R7                              ; DEC5   02B7

        DECLE   $0094,  $0380,  $01B7,  $0124   ; DEC6   0094 0380 01B7 0124
        DECLE   $003C,  $0234,  $03BD,  $0044   ; DECA   003C 0234 03BD 0044
        DECLE   $002B,  $02C5,  $02FA,  $035B   ; DECE   002B 02C5 02FA 035B
        DECLE   $03C9,  $0003,  $0104,  $0300   ; DED2   03C9 0003 0104 0300
        DECLE   $0017,  $021A,  $01ED,  $0210   ; DED6   0017 021A 01ED 0210
        DECLE   $0296,  $0321,  $017B,  $00B5   ; DEDA   0296 0321 017B 00B5
        DECLE   $030D,  $010D,  $0124,  $00C6   ; DEDE   030D 010D 0124 00C6
        DECLE   $0280,  $011C,  $01EA,  $03E6   ; DEE2   0280 011C 01EA 03E6
        DECLE   $0286,  $0284,  $0085,  $0330   ; DEE6   0286 0284 0085 0330
        DECLE   $0116,  $00F1,  $02E3,  $013D   ; DEEA   0116 00F1 02E3 013D
        DECLE   $0382,  $00D2,  $01AC,  $00AB   ; DEEE   0382 00D2 01AC 00AB
        DECLE   $02B6,  $033C,  $0303,  $001F   ; DEF2   02B6 033C 0303 001F
        DECLE   $020A,  $02BE,  $02E9,  $021F   ; DEF6   020A 02BE 02E9 021F

        CMPR    R0,     R2                      ; DEFA   0142
        CMP@    R2,     R1                      ; DEFB   0351
        CMP@    R1,     R7                      ; DEFC   034F
        MVO@    R7,     R2                      ; DEFD   0257
        CMP@    R3,     R2                      ; DEFE   035A
        CMPI    #$028F, R0                      ; DEFF   0378 028F
        PULR    R0                              ; DF01   02B0
        AND@    R5,     R4                      ; DF02   03AC
        MVI@    R1,     R5                      ; DF03   028D
        TSTR    R0                              ; DF04   0080
        ANDR    R4,     R0                      ; DF05   01A0
        SUBR    R7,     R2                      ; DF06   013A
        SLL     R1,     1                       ; DF07   0049
        ANDR    R4,     R0                      ; DF08   01A0
        XOR@    R3,     R0                      ; DF09   03D8
        XORR    R4,     R0                      ; DF0A   01E0
        CMP@    R2,     R0                      ; DF0B   0350
        XOR@    R3,     R6                      ; DF0C   03DE
        SUBR    R4,     R7                      ; DF0D   0127

        DECLE   $0005,  $021C,  $026C,  $029E   ; DF0E   0005 021C 026C 029E
        DECLE   $01E9,  $0221,  $01A2,  $0391   ; DF12   01E9 0221 01A2 0391
        DECLE   $0333,  $0357,  $012B,  $037E   ; DF16   0333 0357 012B 037E
        DECLE   $0013,  $0048,  $0300,  $038F   ; DF1A   0013 0048 0300 038F
        DECLE   $00EC,  $034F,  $0351,  $03E8   ; DF1E   00EC 034F 0351 03E8
        DECLE   $03AC,  $01AF,  $009D,  $0079   ; DF22   03AC 01AF 009D 0079
        DECLE   $01C0,  $013C,  $0206,  $01AF   ; DF26   01C0 013C 0206 01AF
        DECLE   $02EC,  $0086,  $0159,  $020A   ; DF2A   02EC 0086 0159 020A
        DECLE   $03F9,  $02D9,  $026A,  $004E   ; DF2E   03F9 02D9 026A 004E
        DECLE   $00E0,  $0380,  $001F,  $0268   ; DF32   00E0 0380 001F 0268
        DECLE   $000B,  $0341,  $0014,  $01AB   ; DF36   000B 0341 0014 01AB
        DECLE   $0254,  $020E,  $0220,  $0080   ; DF3A   0254 020E 0220 0080
        DECLE   $01EE,  $0268,  $0001,  $0020   ; DF3E   01EE 0268 0001 0020
        DECLE   $0000                           ; DF42   0000

        SUB     G_00EB, R1                      ; DF43   0301 00EB
        ADD@    R3,     R7                      ; DF45   02DF

        SUBR    R2,     R3                      ; DF46   0113
        ADDR    R6,     R0                      ; DF47   00F0
        SUBR    R1,     R4                      ; DF48   010C
        XORR    R3,     R1                      ; DF49   01D9
        ANDR    R5,     R1                      ; DF4A   01A9
        MVO@    R3,     R5                      ; DF4B   026B
        INCR    R2                              ; DF4C   000A
        SLL     R2,     1                       ; DF4D   004A
        RRC     R2,     2                       ; DF4E   0076
        ADDI    #$0370, R5                      ; DF4F   02FD 0370
        MVI@    R2,     R5                      ; DF51   0295
        MVI@    R2,     R3                      ; DF52   0293
        COMR    R6                              ; DF53   001E
        ANDI    #$0060, R2                      ; DF54   03BA 0060
        ADCR    R7                              ; DF56   002F

        SUBR    R6,     R4                      ; DF57   0134
L_DF58:
        SUBR    R6,     R3                      ; DF58   0133
        INCR    R5                              ; DF59   000D
        SUBR    R4,     R2                      ; DF5A   0122
        PSHR    R3                              ; DF5B   0273
        MOVR    R5,     R2                      ; DF5C   00AA
        GSWD    R0                              ; DF5D   0030
        CMPI    #$02C6, R3                      ; DF5E   037B 02C6
        SARC    R1,     1                       ; DF60   0079
        AND@    R1,     R1                      ; DF61   0389
        MOVR    R4,     R5                      ; DF62   00A5
        RRC     R0,     1                       ; DF63   0070
        SUBR    R2,     R6                      ; DF64   0116
        SAR     R3,     2                       ; DF65   006F
        ADD@    R6,     R3                      ; DF66   02F3
        SUBR    R7,     R0                      ; DF67   0138
        AND     G_00D2, R2                      ; DF68   0382 00D2
        MOVR    R5,     R0                      ; DF6A   00A8
        ADD     .BTAB.76,R7                     ; DF6B   02C7 0276

        DECLE   $01A9,  $029C,  $0325,  $0070   ; DF6D   01A9 029C 0325 0070
        DECLE   $0296,  $007B,  $033B,  $00D4   ; DF71   0296 007B 033B 00D4
        DECLE   $030E,  $03C1,  $0034,  $034C   ; DF75   030E 03C1 0034 034C
        DECLE   $023C                           ; DF79   023C

        ANDR    R4,     R5                      ; DF7A   01A5
        SAR     R2,     1                       ; DF7B   006A
        MOVR    R0,     R7                      ; DF7C   0087

        DECLE   $0159,  $021E,  $019E,  $0398   ; DF7D   0159 021E 019E 0398
        DECLE   $0262,  $023F,  $0100,  $038E   ; DF81   0262 023F 0100 038E
        DECLE   $0120,  $00D4,  $002E,  $0244   ; DF85   0120 00D4 002E 0244
        DECLE   $00B0,  $020E                   ; DF89   00B0 020E

        ADD@    R2,     R2                      ; DF8B   02D2
        XORR    R1,     R6                      ; DF8C   01CE
        RRC     R1,     1                       ; DF8D   0071
L_DF8E:
        DECR    R7                              ; DF8E   0017

        DECLE   $00D2,  $0248,  $010A,  $0069   ; DF8F   00D2 0248 010A 0069
        DECLE   $02F6,  $0098,  $0124,  $0239   ; DF93   02F6 0098 0124 0239

        MVO@    R7,     R3                      ; DF97   025F
        XOR     G_0393, R3                      ; DF98   03C3 0393
        SUB@    R3,     R3                      ; DF9A   031B
        INCR    R7                              ; DF9B   000F

        DECLE   $0204                           ; DF9C   0204
L_DF9D:
        SAR     R3,     1                       ; DF9D   006B
        DECLE   $0334,  $0119,  $0099,  $0011   ; DF9E   0334 0119 0099 0011
        DECLE   $0245,  $0031,  $017B,  $0349   ; DFA2   0245 0031 017B 0349
        DECLE   $0207,  $011F,  $0070,  $01E8   ; DFA6   0207 011F 0070 01E8
        DECLE   $004C,  $0206,  $0000,  $0000   ; DFAA   004C 0206 0000 0000
        DECLE   $03E4,  $031A,  $02F3,  $023C   ; DFAE   03E4 031A 02F3 023C

        ANDR    R1,     R5                      ; DFB2   018D
        XORI    #$0015, R1                      ; DFB3   03F9 0015
        SUB     G_03CC, R4                      ; DFB5   0304 03CC
        ANDR    R1,     R5                      ; DFB7   018D
        SUB@    R3,     R7                      ; DFB8   031F

        DECLE   $028A,  $03CE,  $003A,  $00F2   ; DFB9   028A 03CE 003A 00F2
        DECLE   $03B2,  $0070,  $0040,  $0038   ; DFBD   03B2 0070 0040 0038
        DECLE   $02F9,  $02E6,  $00D6,  $02FE   ; DFC1   02F9 02E6 00D6 02FE
        DECLE   $0246,  $035F,  $03CD,  $007B   ; DFC5   0246 035F 03CD 007B
        DECLE   $01E3,  $016D,  $0304,  $0352   ; DFC9   01E3 016D 0304 0352
        DECLE   $0067,  $0243,  $02F9,  $0321   ; DFCD   0067 0243 02F9 0321
        DECLE   $0336,  $0304,  $0370,  $0239   ; DFD1   0336 0304 0370 0239
        DECLE   $0245,  $032B,  $0074,  $039E   ; DFD5   0245 032B 0074 039E
        DECLE   $025D,  $0354,  $02F8,  $0301   ; DFD9   025D 0354 02F8 0301
        DECLE   $00A0,  $0135,  $023F,  $0300   ; DFDD   00A0 0135 023F 0300
        DECLE   $01E3,  $0088,  $00FD,  $000F   ; DFE1   01E3 0088 00FD 000F
        DECLE   $00E4,  $021E,  $00A8,  $0115   ; DFE5   00E4 021E 00A8 0115
        DECLE   $01C7,  $0300,  $0063,  $0188   ; DFE9   01C7 0300 0063 0188
        DECLE   $031A,  $0054,  $0151,  $019E   ; DFED   031A 0054 0151 019E
        DECLE   $03C9,  $03CE,  $0386,  $0000   ; DFF1   03C9 03CE 0386 0000
        DECLE   $0002,  $00F1,  $0000           ; DFF5   0002 00F1 0000

        JSR     R4,     L_D014                  ; DFF8   0004 00D0 0014

        ADDR    R4,     R1                      ; DFFB   00E1
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFFC   0000 0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $503D       <entry>
;;  $5080       $5078  
;;  $50AD       $508E   $5094  
;;  $50BA       $5063   $6B71  
;;  $50C6       $50CC  
;;  $50E0       $50E0  
;;  $50E9       $50C6  
;;  $50F4       $5104  
;;  $5103       $510F  
;;  $5111       $50F1  
;;  $5114       $50F8  
;;  $5115       $505E   $5535  
;;  $5120       $5119   $6B67  
;;  $512F       $5116  
;;  $5136       $5139  
;;  $5198       $53C9  
;;  $51BF       $51B2  
;;  $51CA       $51BD  
;;  $51D9       $5154   $5158   $5160   $5165   $51D1  
;;  $51DA       $5185   $518E  
;;  $51DF       $51A9  
;;  $5217       $51EF  
;;  $5237       $668C  
;;  $529E       $52B0  
;;  $52D1       $5267   $526F   $5282  
;;  $52D2       $52B9   $630D  
;;  $52DA       $52E4  
;;  $52E6       $52D6  
;;  $52F2       $52F5  
;;  $5328       $5308  
;;  $532C       $5326  
;;  $5388       $5328  
;;  $53AC       $53B4  
;;  $53AD       $5392   $5397   $53A0   $53A9  
;;  $53B1       $53B7   $53C7  
;;  $53C6       $53C2  
;;  $540D       $52FC   $6B1B  
;;  $5416       $5429   $5441  
;;  $542B       $5420  
;;  $543D       $5437   $543F  
;;  $5443       $5417  
;;  $5444       $541A   $542C   $5455  
;;  $544C       $5446  
;;  $549F       $535B  
;;  $54A4       $546D  
;;  $54C1       $54AF  
;;  $5558       $5554  
;;  $5578       $5597   $55D6  
;;  $557C       $5582   $5585  
;;  $558A       $557F  
;;  $558D       $5528   $6520  
;;  $55B5       $5525   $651D  
;;  $55C0       $55BC  
;;  $55C6       $55E0  
;;  $55E3       $55CE  
;;  $55E9       $55B3  
;;  $55EF       $559D   $55EB  
;;  $5602       $5600  
;;  $5625       $5623  
;;  $562C       $562A  
;;  $5633       $5631  
;;  $564B       $5649  
;;  $565C       $565A  
;;  $56AE       $56AC  
;;  $56B0       $56AE  
;;  $56BF       $56BF  
;;  $56D1       $56CF  
;;  $56DD       $51BF  
;;  $5701       $52C2   $5719   $68AB  
;;  $5703       $56FF  
;;  $570E       $620B   $666B  
;;  $5746       $5725   $5738   $573D  
;;  $5749       $571D  
;;  $574E       $57BB   $57BF   $57C4   $6ACF  
;;  $5784       $5780   $578D  
;;  $578F       $5785  
;;  $5798       $575F  
;;  $579E       $5754  
;;  $57AC       $57A2  
;;  $57AD       $599D  
;;  $57C7       $57B8  
;;  $57DF       $57D6  
;;  $5804       $57FB  
;;  $580D       $57DD   $57E7  
;;  $5811       $57CC   $57CF  
;;  $5812       $5807  
;;  $581E       $5816  
;;  $58DF       $6899  
;;  $58E0       $58DE   $58F5  
;;  $58F7       $58EB  
;;  $58F9       $58D5   $58D9   $58FB  
;;  $58FA       $58D2  
;;  $590A       $585F   $5908   $6316   $67B9  
;;  $592F       $590F  
;;  $5943       $596B   $675E  
;;  $5966       $595B  
;;  $59AF       $57EB   $5973  
;;  $5C02       $5C00  
;;  $5C1C       $5C1A  
;;  $5C4D       $5096   $5540  
;;  $5C56       $5140  
;;  $5CB9       $5CB7  
;;  $5CBA       $5CB8  
;;  $5CBB       $5CB9  
;;  $5DC9       $5DC7  
;;  $5DD7       $5DD5  
;;  $5DD8       $5DD6  
;;  $5DD9       $5DD7  
;;  $5DE7       $5DE5  
;;  $5DE9       $5DE7  
;;  $5DF7       $5DF5  
;;  $5DF8       $5DF6  
;;  $5E57       $5E55  
;;  $5FC2       $503E  
;;  $5FD6       $6B99  
;;  $5FE2       $5FD4  
;;  $5FEA       $600E   $601E  
;;  $6010       $6009  
;;  $6018       $602D  
;;  $6020       $5FFC   $6006  
;;  $6028       $603B  
;;  $602F       $6029  
;;  $603D       $600B  
;;  $603E       $60A7  
;;  $605E       $6010  
;;  $6064       $606A  
;;  $6067       $6062  
;;  $6077       $6032   $6035  
;;  $6080       $5FEF   $6013   $601C  
;;  $6090       $6083   $6088  
;;  $609A       $5FD0   $60EE  
;;  $609F       $6018  
;;  $60B7       $60AB  
;;  $60E5       $6054   $60B5   $60C3   $60D8  
;;  $60E7       $5044   $6F4E  
;;  $6116       $6110  
;;  $6120       $60F2  
;;  $6121       $60FA  
;;  $6134       $612C  
;;  $6137       $68F2  
;;  $614A       $50A4   $5549  
;;  $6154       $617D   $6180   $6189  
;;  $6163       $618B  
;;  $6188       $6165  
;;  $618F       $6159  
;;  $61DA       $61CF  
;;  $61E0       $6289   $62D0  
;;  $6204       $6201  
;;  $620E       $6208  
;;  $621A       $61EB   $62C0   $62C6  
;;  $6221       $621F  
;;  $6224       $621D  
;;  $6229       $5963   $62D8  
;;  $624A       $647B  
;;  $6282       $627C  
;;  $6299       $62F8  
;;  $62A2       $629A  
;;  $62D3       $62CE  
;;  $62DB       $62D6  
;;  $62E4       $62A7   $62DD  
;;  $62E5       $6221   $6230  
;;  $62E8       $62ED  
;;  $62F0       <entry>
;;  $62F8       $62F4  
;;  $631A       $6307  
;;  $6337       $631E  
;;  $6358       $6354  
;;  $6367       $635A   $635D  
;;  $6393       $6376   $638E  
;;  $6395       $6371  
;;  $6396       $6364  
;;  $63A7       $63B5  
;;  $63B1       $63B2  
;;  $63B7       $63B7  
;;  $63B8       $639A   $639E  
;;  $63B9       <entry>
;;  $63D1       $63CD  
;;  $63EB       $63D8  
;;  $6433       $6423  
;;  $643A       $641A   $6437  
;;  $6443       $63CA  
;;  $645B       $6457  
;;  $6467       $645E   $6476  
;;  $6478       $6474  
;;  $647E       $646D   $6479  
;;  $6488       $6448   $6452   $6465  
;;  $6489       $5958   $621A   $62D3   $6471   $65DE   $66FF  
;;  $6494       $6491  
;;  $649F       $6498   $649B  
;;  $64A1       $63BA  
;;  $64DD       $5354   $64AC  
;;  $64DE       $64DC  
;;  $64F7       $64B2   $64BD   $64F1  
;;  $64F8       $64E4   $64E9  
;;  $6512       $5574   $63C7  
;;  $653D       $652C  
;;  $653E       $644A  
;;  $6548       $654E   $6561  
;;  $6563       $654B  
;;  $6564       $655D   $658B  
;;  $656C       $6580  
;;  $6571       $55B7  
;;  $6582       $63C4  
;;  $6597       $630A  
;;  $65AC       $65A5  
;;  $65BA       $65AF  
;;  $65CE       $65C6  
;;  $65D8       $65D5  
;;  $65F6       $65E7   $65EB  
;;  $6613       $660D  
;;  $663E       $663B  
;;  $6643       $6640  
;;  $6648       $6633  
;;  $664C       $6625   $6629  
;;  $665D       $65A9   $65B8   $65BE   $65FE  
;;  $665E       $65E1   $65F1   $65F4  
;;  $6661       $65DC  
;;  $6677       $668A   $66D7   $66F2  
;;  $6687       $66BF  
;;  $6690       $6646  
;;  $66A9       $669A   $66A5  
;;  $66BE       $6698  
;;  $66D9       $66AC   $66B6   $66BC   $66C6  
;;  $66E1       $66DE  
;;  $66E3       $6635   $664E  
;;  $66F4       $66EE  
;;  $66F5       <entry>
;;  $6704       $6702  
;;  $671A       $66F9  
;;  $671B       $62FE   $6EAE  
;;  $6737       $673B  
;;  $673D       $671F   $6740  
;;  $673E       $6729  
;;  $678C       $6780  
;;  $67B0       $67AE  
;;  $67B1       $67A9  
;;  $67BC       $6794   $6797   $679F   $67B7  
;;  $67D6       $67BF  
;;  $67D7       $67C3   $67CC  
;;  $67E3       $67E0  
;;  $67EC       $6714   $67D0  
;;  $680F       $6313  
;;  $6834       $6813  
;;  $6835       <entry>
;;  $683F       $6848  
;;  $6853       $685E   $6862  
;;  $685E       $6857  
;;  $686A       $685C  
;;  $686E       $652E  
;;  $6877       $6851  
;;  $68B6       $689C  
;;  $68B9       $68C0   $68D5  
;;  $68C3       $68CD  
;;  $68D7       $68BB  
;;  $68D8       $63A2  
;;  $68DD       $68B4  
;;  $68EE       $68E9  
;;  $6911       $68FF  
;;  $6941       $68DB   $68DF   $68E3  
;;  $6942       $5111   $691E  
;;  $6943       $511C  
;;  $694C       $533E   $552D   $6553   $6573  
;;  $695C       $6304  
;;  $6970       $696D  
;;  $697B       $6962   $6978  
;;  $697C       $523C  
;;  $697D       $69A4  
;;  $6985       $6997  
;;  $698C       $6986  
;;  $6993       $698D  
;;  $6995       $6991  
;;  $6996       $698A  
;;  $699B       $5071   $5170   $576A   $57F2   $599A   $6605   $676F   $69A8  
;;  $69A6       $5339   $5951   $6769  
;;  $69A7       $69B0  
;;  $69B3       $54A9   $5856  
;;  $69B5       $69BF  
;;  $69C1       $69B8  
;;  $69C2       $54C4   $5914  
;;  $69C5       $69E5  
;;  $69D8       $69D6  
;;  $69DB       $69D9  
;;  $69E0       $69DC  
;;  $69E8       $51DC   $670C   $6711  
;;  $69F0       $69EE  
;;  $69F1       $6310  
;;  $69FF       <entry>
;;  $6A0E       $6A02  
;;  $6A1D       $6A0C  
;;  $6A23       $6A11  
;;  $6A26       $580A  
;;  $6A33       $52B6  
;;  $6A52       $6A4A  
;;  $6A53       $51CA  
;;  $6A69       $5233  
;;  $6A7A       $669F  
;;  $6A7E       $665E  
;;  $6A8A       $6A88  
;;  $6A8D       $61F3  
;;  $6AAA       $6AA5  
;;  $6AAD       $63A8   $6661  
;;  $6ABF       $5746  
;;  $6AC7       $6ABA  
;;  $6ACA       $5743  
;;  $6ACD       $6AEE   $6AF4  
;;  $6AF7       $5149   $545D   $6130  
;;  $6AFF       $6AF9  
;;  $6B10       $5532   $5571   $63C1  
;;  $6B39       $6B3B  
;;  $6B3D       $6B4C  
;;  $6B45       $6B40  
;;  $6B4A       $6B29  
;;  $6B4E       $51B6   $5465   $6517   $6B13  
;;  $6B58       $6B55  
;;  $6B5E       $6B5B  
;;  $6B64       $6E16  
;;  $6B7A       $6B86  
;;  $6B84       $6B7D  
;;  $6B89       $5133   $52EF   $6734   $6BA1   $6D1D   $6E0B  
;;  $6B95       $513D   $5374   $674D   $6BAD   $6D29   $6E45  
;;  $6B9C       $691B  
;;  $6B9D       $6748  
;;  $6BA4       $6BA8  
;;  $6BE2       $6BD4  
;;  $6BE4       $6BCB   $6BD0  
;;  $6BE9       $6BDC   $6BE0  
;;  $6C09       $515C   $65FA  
;;  $6C0D       $6C1F  
;;  $6C1B       $6C0F  
;;  $6C23       $6246  
;;  $6C2E       $6C6C  
;;  $6C3B       $6C37  
;;  $6C4E       $6C4B  
;;  $6C55       $6C52  
;;  $6C62       $6C5F  
;;  $6C6E       $6C32  
;;  $6C70       $5243   $576D   $660A  
;;  $6C7A       $6DC6  
;;  $6C8C       $6C89  
;;  $6CA4       $6C9D  
;;  $6CA8       $6CFE  
;;  $6CB4       $6CB1  
;;  $6CF2       $6CF9  
;;  $6D0C       $6D04  
;;  $6D0D       $6CD0   $6CD7   $6CE0   $6CEF   $6CF4  
;;  $6D17       $6D10   $6D14  
;;  $6D18       $6CA1  
;;  $6D20       $6D24  
;;  $6D45       $6D47  
;;  $6D49       $6D43   $6D5B  
;;  $6D56       $6D4B  
;;  $6D5D       $6D3B  
;;  $6D5F       $6D76  
;;  $6D64       $6D6A  
;;  $6D6F       $6D71  
;;  $6D8C       $6D8A  
;;  $6DA2       $5946   $6717   $67D3  
;;  $6DB1       $6DA8  
;;  $6DC5       $6DBF  
;;  $6DC6       $6DE1  
;;  $6DC9       $6DAE   $6DB2  
;;  $6DCA       $6DBC  
;;  $6DD9       $6DD5  
;;  $6DE3       $62FB  
;;  $6E0E       $6E12  
;;  $6E19       $6DE8   $6E14  
;;  $6E1F       $6E3D  
;;  $6E27       $6E23  
;;  $6E58       $6E7F  
;;  $6E5B       $6E66  
;;  $6E6F       $6E7A  
;;  $6E86       $6E91  
;;  $6E95       $6E4C  
;;  $6EAD       <entry>
;;  $6EC9       $6ECB  
;;  $6ED3       $6EBE  
;;  $6EE0       $6EDA  
;;  $6EE7       $6EDE  
;;  $6EE8       $6EE2  
;;  $6EFA       $6EF1  
;;  $6EFC       $6F1B  
;;  $6F12       $6F10  
;;  $6F14       $6F0B  
;;  $6F1A       $6F24  
;;  $6F1D       $6F26  
;;  $6F1E       $6F18  
;;  $6F28       $6F14   $6F1F  
;;  $6F3C       $6F32   $6F35  
;;  $6F3D       $6EFF  
;;  $6F51       $6EB8   $6EC6  
;;  $D014       $DFF8  
;;  $D204       $D5DA  
;;  $D422       $D5BE  
;;  $D4B3       $D4B1  
;;  $D51F       $D51D  
;;  $D52E       $D5D5  
;;  $D533       $D89E  
;;  $D591       $D243  
;;  $D67E       $D67C  
;;  $D695       $D4C0  
;;  $D7E6       $D7E4  
;;  $D876       $DA4C  
;;  $D8C0       $D4C7  
;;  $D915       $D913  
;;  $D921       $D921  
;;  $D926       $D677  
;;  $D96F       $DBDD  
;;  $DA14       $DBA0  
;;  $DA58       $DA24  
;;  $DBBC       $DB54  
;;  $DBC3       $DBBA  
;;  $DC5B       $DA12  
;;  $DC8C       $DD22  
;;  $DD18       $DCE3  
;;  $DD24       $DAE5  
;;  $DE49       $DE47  
;;  $DE51       $DCAB  
;;  $DE5E       $DB15  
;;  $DF58       $DF56  
;;  $DF8E       $DF8E  
;;  $DF9D       $DF9B  
;; ======================================================================== ;;
