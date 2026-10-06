
        ORG     $5000
.HEADER:
        BIDECLE $0000           ; 5000  End of timer table

        BIDECLE $5000           ; 5002  Ptr: EXEC timer table
        BIDECLE $5017           ; 5004  Ptr: Start of game
        BIDECLE $500F           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $500D           ; 5008  Ptr: GRAM init sequence
        BIDECLE $500F           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
.TITLE:
        DECLE   $0052           ; 500F  Cartridge year
        STRING  "I"                             ; 5010  Title string
        STRING  "MA"            ; 5011  Color Stack init (2, 3)
        STRING  "G"             ; 5013  Border color init

        STRING  "IC"                            ; 5014   0049 0043
        DECLE   $0000                           ; 5016  

.TITLECODE:
        DIS                                     ; 5017   0003
        SDBD                                    ; 5018   0001
        MVII    #$51F8, R0                      ; 5019   02B8 00F8 0051
        MVO     R0,     .ISRVEC.0               ; 501C   0240 0100
        SWAP    R0,     1                       ; 501E   0040
        MVO     R0,     .ISRVEC.1               ; 501F   0240 0101
        MVII    #$02F8, R6                      ; 5021   02BE 02F8
        MVII    #$00F0, R0                      ; 5023   02B8 00F0
        MVII    #$0200, R4                      ; 5025   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5027   0004 0114 0338

        MVII    #$032C, R4                      ; 502A   02BC 032C
        MVII    #$0033, R0                      ; 502C   02B8 0033

        JSR     R5,     X_FILL_ZERO             ; 502E   0004 0114 0338

        MVII    #$0102, R4                      ; 5031   02BC 0102
        MVII    #$00EE, R0                      ; 5033   02B8 00EE

        JSR     R5,     X_FILL_ZERO             ; 5035   0004 0114 0338

        SDBD                                    ; 5038   0001
        MVII    #$5E24, R0                      ; 5039   02B8 0024 005E
        MVO     R0,     G_035D                  ; 503C   0240 035D
        MVII    #$0001, R0                      ; 503E   02B8 0001
        MVO     R0,     G_0147                  ; 5040   0240 0147
        MVO     R0,     G_010F                  ; 5042   0240 010F
        SDBD                                    ; 5044   0001
        MVII    #$FFFF, R0                      ; 5045   02B8 00FF 00FF
        MVO     R0,     G_035E                  ; 5048   0240 035E
        MVII    #$0008, R2                      ; 504A   02BA 0008
        SWAP    R2,     1                       ; 504C   0042
        MVII    #$0008, R1                      ; 504D   02B9 0008
        SDBD                                    ; 504F   0001
        MVII    #$5233, R4                      ; 5050   02BC 0033 0052
        MVII    #$033C, R5                      ; 5053   02BD 033C
L_5055:
        MVI@    R4,     R0                      ; 5055   02A0
        XORR    R2,     R0                      ; 5056   01D0
        MVO@    R0,     R5                      ; 5057   0268
        DECR    R1                              ; 5058   0011
        BNEQ    L_5055                          ; 5059   022C 0005

        EIS                                     ; 505B   0002
L_505C:
        MVI     G_010F, R0                      ; 505C   0280 010F
        TSTR    R0                              ; 505E   0080
        BNEQ    L_505C                          ; 505F   022C 0004

        JSR     R5,     L_5F0F                  ; 5061   0004 015C 030F

L_5064:
        MVI     G_010E, R0                      ; 5064   0280 010E
        TSTR    R0                              ; 5066   0080
        BNEQ    L_5091                          ; 5067   020C 0028

        MVII    #$0003, R0                      ; 5069   02B8 0003
        MVO     R0,     G_010E                  ; 506B   0240 010E
        SDBD                                    ; 506D   0001
        MVII    #$524B, R4                      ; 506E   02BC 004B 0052
        MVII    #$016D, R3                      ; 5071   02BB 016D
L_5073:
        MVI@    R3,     R0                      ; 5073   0298
        TSTR    R0                              ; 5074   0080
        BEQ     L_507A                          ; 5075   0204 0003

        DECR    R0                              ; 5077   0010
        BNEQ    L_5088                          ; 5078   020C 000E

L_507A:
        MVI@    R4,     R0                      ; 507A   02A0
        MVO@    R0,     R3                      ; 507B   0258
        PSHR    R4                              ; 507C   0274
        PSHR    R3                              ; 507D   0273
        SDBD                                    ; 507E   0001
        MVII    #$5084, R5                      ; 507F   02BD 0084 0050
        SDBD                                    ; 5082   0001
        MVI@    R4,     R7                      ; 5083   02A7

        PULR    R3                              ; 5084   02B3
        PULR    R4                              ; 5085   02B4
        B       L_508A                          ; 5086   0200 0002

L_5088:
        MVO@    R0,     R3                      ; 5088   0258
        INCR    R4                              ; 5089   000C
L_508A:
        INCR    R3                              ; 508A   000B
        ADDI    #$0002, R4                      ; 508B   02FC 0002
        CMPI    #$0171, R3                      ; 508D   037B 0171
        BLT     L_5073                          ; 508F   0225 001D

L_5091:
        MVI     G_0110, R0                      ; 5091   0280 0110
        RRC     R0,     1                       ; 5093   0070
        BC      L_50A0                          ; 5094   0201 000A

        SETC                                    ; 5096   0007
        RLC     R0,     1                       ; 5097   0050
        MVO     R0,     G_0110                  ; 5098   0240 0110
        MVII    #$034C, R2                      ; 509A   02BA 034C
        MVII    #$0344, R4                      ; 509C   02BC 0344
        B       L_50AB                          ; 509E   0200 000B

L_50A0:
        RRC     R0,     1                       ; 50A0   0070
        BC      L_50B2                          ; 50A1   0201 000F

        MVII    #$0003, R0                      ; 50A3   02B8 0003
        MVO     R0,     G_0110                  ; 50A5   0240 0110
        MVII    #$0354, R2                      ; 50A7   02BA 0354
        MVII    #$015D, R4                      ; 50A9   02BC 015D
L_50AB:
        MVII    #$0002, R1                      ; 50AB   02B9 0002
        MVII    #$0008, R0                      ; 50AD   02B8 0008

        JSR     R5,     L_50BA                  ; 50AF   0004 0150 00BA
L_50B2:
        JSR     R5,     .EXEC.4F1               ; 50B2   0004 0114 00F1
        JSR     R5,     .EXEC.AAD               ; 50B5   0004 0118 02AD

        B       L_5064                          ; 50B8   0220 0055

L_50BA:
        PSHR    R5                              ; 50BA   0275
L_50BB:
        MVI@    R2,     R3                      ; 50BB   0293
        DECLE   $0272,  $037A,  $0353,  $020E   ; 50BC   0272 037A 0353 020E
        DECLE   $0001,  $000F,  $0001           ; 50C0   0001 000F 0001

        MVI@    R4,     R2                      ; 50C3   02A2
        TSTR    R2                              ; 50C4   0092
        BEQ     L_50EF                          ; 50C5   0204 0028

        ADDR    R1,     R2                      ; 50C7   00CA
        MVI@    R2,     R2                      ; 50C8   0292
        PSHR    R0                              ; 50C9   0270
        PSHR    R1                              ; 50CA   0271
        DECR    R2                              ; 50CB   0012
        MOVR    R3,     R1                      ; 50CC   0099
        ANDI    #$000F, R1                      ; 50CD   03B9 000F
        MOVR    R3,     R0                      ; 50CF   0098
        SWAP    R0,     1                       ; 50D0   0040
        ANDI    #$003E, R0                      ; 50D1   03B8 003E
        SLR     R0,     1                       ; 50D3   0060
        TSTR    R0                              ; 50D4   0080
        BEQ     L_50E0                          ; 50D5   0204 0009

        DECR    R0                              ; 50D7   0010
        BNEQ    L_50E5                          ; 50D8   020C 000B

        INCR    R1                              ; 50DA   0009
        CMPR    R2,     R1                      ; 50DB   0151
        BLE     L_50E0                          ; 50DC   0206 0002

        CLRR    R2                              ; 50DE   01D2
        MOVR    R2,     R1                      ; 50DF   0091
L_50E0:
        MOVR    R3,     R0                      ; 50E0   0098
        ANDI    #$01F0, R0                      ; 50E1   03B8 01F0
        SLR     R0,     2                       ; 50E3   0064
        SLR     R0,     2                       ; 50E4   0064
L_50E5:
        SDBD                                    ; 50E5   0001
        ANDI    #$81F0, R3                      ; 50E6   03BB 00F0 0081
        SWAP    R0,     1                       ; 50E9   0040
        SLL     R0,     1                       ; 50EA   0048
        XORR    R0,     R3                      ; 50EB   01C3
        XORR    R1,     R3                      ; 50EC   01CB
        PULR    R1                              ; 50ED   02B1
        PULR    R0                              ; 50EE   02B0
L_50EF:
        PULR    R2                              ; 50EF   02B2
        MVO@    R3,     R2                      ; 50F0   0253
        INCR    R2                              ; 50F1   000A
        DECR    R0                              ; 50F2   0010
        BNEQ    L_50BB                          ; 50F3   022C 0039
        PULR    R7                              ; 50F5   02B7

L_50F6:
        MVI     .STIC.BORD,R0                   ; 50F6   0280 002C
        MVO     R0,     G_0179                  ; 50F8   0240 0179
        MVO     R1,     .STIC.BORD              ; 50FA   0241 002C
        MVII    #$0081, R1                      ; 50FC   02B9 0081
        MVO     R1,     G_0102                  ; 50FE   0241 0102
        PULR    R7                              ; 5100   02B7

        PSHR    R5                              ; 5101   0275
        MVI     G_0103, R0                      ; 5102   0280 0103
        TSTR    R0                              ; 5104   0080
        BEQ     L_510A                          ; 5105   0204 0003

        MVO     R0,     .STIC.VIDEN             ; 5107   0240 0020
L_5109:
        PULR    R7                              ; 5109   02B7

L_510A:
        MVI     G_0102, R1                      ; 510A   0281 0102
        SUBI    #$0080, R1                      ; 510C   0339 0080
        BMI     L_511B                          ; 510E   020B 000B
        BEQ     L_50F6                          ; 5110   0224 001B

        DECR    R1                              ; 5112   0011
        BEQ     L_5109                          ; 5113   0224 000B

        MVI     G_0179, R1                      ; 5115   0281 0179
        MVO     R1,     .STIC.BORD              ; 5117   0241 002C
        MVO     R0,     G_0102                  ; 5119   0240 0102
L_511B:
        MVO     R0,     .STIC.VIDEN             ; 511B   0240 0020
        INCR    R0                              ; 511D   0008
        MVO     R0,     G_0103                  ; 511E   0240 0103
        MVII    #$032C, R4                      ; 5120   02BC 032C
        CLRR    R5                              ; 5122   01ED
        MVII    #$0003, R1                      ; 5123   02B9 0003
L_5125:
        MVI@    R4,     R0                      ; 5125   02A0
        MVO@    R0,     R5                      ; 5126   0268
        MVI@    R4,     R0                      ; 5127   02A0
        MVO@    R0,     R5                      ; 5128   0268
        MVI@    R4,     R0                      ; 5129   02A0
        MVO@    R0,     R5                      ; 512A   0268
        MVI@    R4,     R0                      ; 512B   02A0
        MVO@    R0,     R5                      ; 512C   0268
        MVI@    R4,     R0                      ; 512D   02A0
        MVO@    R0,     R5                      ; 512E   0268
        MVI@    R4,     R0                      ; 512F   02A0
        MVO@    R0,     R5                      ; 5130   0268
        MVI@    R4,     R0                      ; 5131   02A0
        MVO@    R0,     R5                      ; 5132   0268
        MVI@    R4,     R0                      ; 5133   02A0
        MVO@    R0,     R5                      ; 5134   0268
        DECR    R1                              ; 5135   0011
        BNEQ    L_5125                          ; 5136   022C 0012

        MVI     G_0104, R2                      ; 5138   0282 0104
        SLL     R2,     1                       ; 513A   004A
        MVII    #$034C, R4                      ; 513B   02BC 034C
        MVII    #$0344, R5                      ; 513D   02BD 0344
        ADDR    R2,     R4                      ; 513F   00D4
        ADDR    R2,     R5                      ; 5140   00D5
L_5141:
        MVI@    R4,     R3                      ; 5141   02A3
        ANDI    #$000F, R3                      ; 5142   03BB 000F
        PSHR    R4                              ; 5144   0274
        MVI@    R5,     R4                      ; 5145   02AC
        TSTR    R4                              ; 5146   00A4
        BEQ     L_5186                          ; 5147   0204 003D

        MVII    #$0171, R1                      ; 5149   02B9 0171
        ADDR    R2,     R1                      ; 514B   00D1
        CMP@    R1,     R3                      ; 514C   034B
        BEQ     L_5186                          ; 514D   0204 0037

        MVO@    R3,     R1                      ; 514F   024B
        PSHR    R5                              ; 5150   0275
        MVII    #$032C, R1                      ; 5151   02B9 032C
        ADDR    R2,     R1                      ; 5153   00D1
        MVI@    R1,     R0                      ; 5154   0288
        PSHR    R1                              ; 5155   0271
        MOVR    R0,     R1                      ; 5156   0081
        SDBD                                    ; 5157   0001
        ANDI    #$FDFF, R0                      ; 5158   03B8 00FF 00FD
        SDBD                                    ; 515B   0001
        ANDI    #$0800, R1                      ; 515C   03B9 0000 0008
        SLR     R1,     2                       ; 515F   0065
        XORR    R1,     R0                      ; 5160   01C8
        PULR    R1                              ; 5161   02B1
        MVO@    R0,     R1                      ; 5162   0248
        SDBD                                    ; 5163   0001
        MVII    #$5233, R5                      ; 5164   02BD 0033 0052
        ADDR    R2,     R5                      ; 5167   00D5
        MVI@    R5,     R5                      ; 5168   02AD
        SDBD                                    ; 5169   0001
        ADDI    #$3800, R5                      ; 516A   02FD 0000 0038
        MVII    #$0334, R1                      ; 516D   02B9 0334
        ADDR    R2,     R1                      ; 516F   00D1
        MVI@    R1,     R0                      ; 5170   0288
        SLL     R3,     2                       ; 5171   004F
        SLL     R3,     1                       ; 5172   004B
        SDBD                                    ; 5173   0001
        MVI@    R4,     R1                      ; 5174   02A1
        MOVR    R1,     R4                      ; 5175   008C
        MVII    #$0008, R1                      ; 5176   02B9 0008
        ANDI    #$0080, R0                      ; 5178   03B8 0080
        BEQ     L_517F                          ; 517A   0204 0003

        ADDI    #$0008, R1                      ; 517C   02F9 0008
        SLL     R3,     1                       ; 517E   004B
L_517F:
        ADDR    R3,     R4                      ; 517F   00DC
L_5180:
        MVI@    R4,     R0                      ; 5180   02A0
        MVO@    R0,     R5                      ; 5181   0268
        DECR    R1                              ; 5182   0011
        BNEQ    L_5180                          ; 5183   022C 0004

        PULR    R5                              ; 5185   02B5
L_5186:
        PULR    R4                              ; 5186   02B4
        INCR    R2                              ; 5187   000A
        MOVR    R2,     R0                      ; 5188   0090
        SARC    R0,     1                       ; 5189   0078
        BC      L_5141                          ; 518A   0221 004A

        MVI     G_0104, R2                      ; 518C   0282 0104
        SLL     R2,     1                       ; 518E   004A
        MVII    #$0354, R4                      ; 518F   02BC 0354
        MVII    #$015D, R5                      ; 5191   02BD 015D
        ADDR    R2,     R4                      ; 5193   00D4
        SLL     R2,     1                       ; 5194   004A
        ADDR    R2,     R5                      ; 5195   00D5
        SLR     R2,     1                       ; 5196   0062
L_5197:
        MVI@    R4,     R3                      ; 5197   02A3
        ANDI    #$000F, R3                      ; 5198   03BB 000F
        PSHR    R4                              ; 519A   0274
        SDBD                                    ; 519B   0001
        MVI@    R5,     R4                      ; 519C   02AC
        PSHR    R5                              ; 519D   0275
        SLL     R3,     2                       ; 519E   004F
        SLL     R3,     1                       ; 519F   004B
        SDBD                                    ; 51A0   0001
        ADD@    R4,     R3                      ; 51A1   02E3
        MOVR    R3,     R4                      ; 51A2   009C
        MOVR    R2,     R1                      ; 51A3   0091
        SLL     R1,     2                       ; 51A4   004D
        SLL     R1,     1                       ; 51A5   0049
        SDBD                                    ; 51A6   0001
        ADDI    #$3800, R1                      ; 51A7   02F9 0000 0038
        MOVR    R1,     R5                      ; 51AA   008D
        MVII    #$0008, R1                      ; 51AB   02B9 0008
L_51AD:
        MVI@    R4,     R0                      ; 51AD   02A0
        MVO@    R0,     R5                      ; 51AE   0268
        DECR    R1                              ; 51AF   0011
        BNEQ    L_51AD                          ; 51B0   022C 0004

        PULR    R5                              ; 51B2   02B5
        PULR    R4                              ; 51B3   02B4
        INCR    R2                              ; 51B4   000A
        MOVR    R2,     R0                      ; 51B5   0090
        SARC    R0,     1                       ; 51B6   0078
        BC      L_5197                          ; 51B7   0221 0021

        MVII    #$00FF, R0                      ; 51B9   02B8 00FF
        MVII    #$032C, R3                      ; 51BB   02BB 032C
        MVII    #$0125, R4                      ; 51BD   02BC 0125
        MVII    #$0008, R5                      ; 51BF   02BD 0008
L_51C1:
        PSHR    R5                              ; 51C1   0275
        MVI@    R3,     R1                      ; 51C2   0299
        ANDR    R0,     R1                      ; 51C3   0181
        PSHR    R0                              ; 51C4   0270
        SWAP    R1,     1                       ; 51C5   0041
        PSHR    R4                              ; 51C6   0274
        XOR@    R4,     R1                      ; 51C7   03E1
        MVI@    R4,     R0                      ; 51C8   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 51C9   0004 0114 0268

        SLL     R0,     2                       ; 51CC   004C
        SLL     R0,     2                       ; 51CD   004C
        ADDR    R0,     R1                      ; 51CE   00C1
        PULR    R2                              ; 51CF   02B2
        MVO@    R1,     R2                      ; 51D0   0251
        SWAP    R1,     1                       ; 51D1   0041
        PULR    R0                              ; 51D2   02B0
        ANDR    R0,     R1                      ; 51D3   0181
        MOVR    R0,     R2                      ; 51D4   0082
        COMR    R2                              ; 51D5   001A
        AND@    R3,     R2                      ; 51D6   039A
        XORR    R1,     R2                      ; 51D7   01CA
        MVO@    R2,     R3                      ; 51D8   025A
        INCR    R3                              ; 51D9   000B
        PULR    R5                              ; 51DA   02B5
        DECR    R5                              ; 51DB   0015
        BNEQ    L_51C1                          ; 51DC   022C 001C

        MVI     G_010E, R0                      ; 51DE   0280 010E
        TSTR    R0                              ; 51E0   0080
        BEQ     L_51EA                          ; 51E1   0204 0007

        AND     G_0110, R0                      ; 51E3   0380 0110
        MVO     R0,     G_0110                  ; 51E5   0240 0110
        DECR    R0                              ; 51E7   0010
        MVO     R0,     G_010E                  ; 51E8   0240 010E

L_51EA:
        JSR     R5,     X_PLAY_NOTE             ; 51EA   0004 0118 02BD

        MVI     G_0104, R0                      ; 51ED   0280 0104
        INCR    R0                              ; 51EF   0008
        ANDI    #$0003, R0                      ; 51F0   03B8 0003
        MVO     R0,     G_0104                  ; 51F2   0240 0104
        CLRR    R0                              ; 51F4   01C0
        MVO     R0,     G_0103                  ; 51F5   0240 0103
        PULR    R7                              ; 51F7   02B7

        PSHR    R5                              ; 51F8   0275
        DIS                                     ; 51F9   0003
        CLRR    R0                              ; 51FA   01C0
        MVO     R0,     .STIC.HDLY              ; 51FB   0240 0030
        MVO     R0,     .STIC.VDLY              ; 51FD   0240 0031
        INCR    R0                              ; 51FF   0008
        MVO     R0,     G_0105                  ; 5200   0240 0105
        MVII    #$0021, R1                      ; 5202   02B9 0021
        MVO@    R0,     R1                      ; 5204   0248
        MVII    #$0009, R0                      ; 5205   02B8 0009
        MVO     R0,     .STIC.BORD              ; 5207   0240 002C
        CLRR    R0                              ; 5209   01C0
        MVO     R0,     .STIC.EDGE              ; 520A   0240 0032
        MVII    #$0020, R0                      ; 520C   02B8 0020
        CLRR    R4                              ; 520E   01E4
        MVO     R4,     G_010F                  ; 520F   0244 010F

        JSR     R5,     X_FILL_ZERO             ; 5211   0004 0114 0338

        SDBD                                    ; 5214   0001
        MVII    #$523B, R4                      ; 5215   02BC 003B 0052
        MVII    #$0010, R0                      ; 5218   02B8 0010
        MVII    #$015D, R5                      ; 521A   02BD 015D
L_521C:
        MVI@    R4,     R1                      ; 521C   02A1
        MVO@    R1,     R5                      ; 521D   0269
        DECR    R0                              ; 521E   0010
        BNEQ    L_521C                          ; 521F   022C 0004

        SDBD                                    ; 5221   0001
        MVII    #$69E2, R4                      ; 5222   02BC 00E2 0069
        MVI@    R4,     R1                      ; 5225   02A1

        JSR     R5,     L_6971                  ; 5226   0004 0168 0171

        MVII    #$0001, R0                      ; 5229   02B8 0001
        MVO     R0,     .ISRVEC.0               ; 522B   0240 0100
        MVII    #$0051, R0                      ; 522D   02B8 0051
        MVO     R0,     .ISRVEC.1               ; 522F   0240 0101
        EIS                                     ; 5231   0002
        PULR    R7                              ; 5232   02B7

        ANDR    R2,     R0                      ; 5233   0190
        ANDR    R3,     R0                      ; 5234   0198
        ANDR    R4,     R0                      ; 5235   01A0
        ANDR    R6,     R0                      ; 5236   01B0
        CLRR    R0                              ; 5237   01C0
        XORR    R2,     R0                      ; 5238   01D0
        XORR    R4,     R0                      ; 5239   01E0
        XORR    R6,     R0                      ; 523A   01F0
        TSTR    R1                              ; 523B   0089
        SAR     R1,     1                       ; 523C   0069
        TSTR    R1                              ; 523D   0089
        SAR     R1,     1                       ; 523E   0069
        MOVR    R1,     R4                      ; 523F   008C
        SAR     R1,     1                       ; 5240   0069
        MOVR    R1,     R4                      ; 5241   008C
        SAR     R1,     1                       ; 5242   0069
        MOVR    R1,     R7                      ; 5243   008F

        SAR     R1,     1                       ; 5244   0069
        MOVR    R1,     R7                      ; 5245   008F

        DECLE   $0069,  $0000,  $0000,  $0000   ; 5246   0069 0000 0000 0000
        DECLE   $0000,  $0001,  $0057,  $0052   ; 524A   0000 0001 0057 0052
        DECLE   $0008,  $00FA,  $0055,  $0001   ; 524E   0008 00FA 0055 0001
        DECLE   $0037                           ; 5252   0037

        SLLC    R0,     1                       ; 5253   0058
        ADCR    R0                              ; 5254   0028
        ADDR    R1,     R6                      ; 5255   00CE
        RLC     R2,     2                       ; 5256   0056
        PSHR    R5                              ; 5257   0275
        CLRR    R0                              ; 5258   01C0

        JSR     R5,     L_527E                  ; 5259   0004 0150 027E

        MVII    #$0001, R0                      ; 525C   02B8 0001

        JSR     R5,     L_527E                  ; 525E   0004 0150 027E

        CLRR    R0                              ; 5261   01C0

        JSR     R5,     L_52DC                  ; 5262   0004 0150 02DC

        MVII    #$0001, R0                      ; 5265   02B8 0001

        JSR     R5,     L_52DC                  ; 5267   0004 0150 02DC

        CLRR    R0                              ; 526A   01C0

        JSR     R5,     L_53D6                  ; 526B   0004 0150 03D6

        MVII    #$0001, R0                      ; 526E   02B8 0001

        JSR     R5,     L_53D6                  ; 5270   0004 0150 03D6
        JSR     R5,     L_5A0D                  ; 5273   0004 0158 020D

        CLRR    R0                              ; 5276   01C0

        JSR     R5,     L_5511                  ; 5277   0004 0154 0111

        MVII    #$0001, R0                      ; 527A   02B8 0001
        B       L_5512                          ; 527C   0200 0294

L_527E:
        PSHR    R5                              ; 527E   0275
        MOVR    R0,     R2                      ; 527F   0082
        ADDI    #$01B1, R2                      ; 5280   02FA 01B1
        MVI@    R2,     R2                      ; 5282   0292
        CMPI    #$0005, R2                      ; 5283   037A 0005
        BNEQ    L_5292                          ; 5285   020C 000B

        MOVR    R0,     R1                      ; 5287   0081
        MVII    #$023C, R4                      ; 5288   02BC 023C
        TSTR    R0                              ; 528A   0080
        BEQ     L_528F                          ; 528B   0204 0002

        ADDI    #$000B, R4                      ; 528D   02FC 000B
L_528F:
        J       L_6BA1                          ; 528F   0004 0368 03A1

L_5292:
        TSTR    R2                              ; 5292   0092
        BNEQ    L_52BB                          ; 5293   020C 0026

        MVII    #$02F6, R5                      ; 5295   02BD 02F6
        MVII    #$0196, R4                      ; 5297   02BC 0196
        MVII    #$01A0, R3                      ; 5299   02BB 01A0
        ADDR    R0,     R5                      ; 529B   00C5
        ADDR    R0,     R4                      ; 529C   00C4
        ADDR    R0,     R4                      ; 529D   00C4
        ADDR    R0,     R4                      ; 529E   00C4
        ADDR    R0,     R3                      ; 529F   00C3
        MVI@    R5,     R0                      ; 52A0   02A8
        MVI@    R3,     R3                      ; 52A1   029B
        TSTR    R3                              ; 52A2   009B
        BEQ     L_52A6                          ; 52A3   0204 0001

        NEGR    R0                              ; 52A5   0020
L_52A6:
        TSTR    R0                              ; 52A6   0080
        BEQ     L_52BB                          ; 52A7   0204 0012

        MOVR    R4,     R5                      ; 52A9   00A5
        SDBD                                    ; 52AA   0001
        ADD@    R4,     R0                      ; 52AB   02E0
        MVO@    R0,     R5                      ; 52AC   0268
        SWAP    R0,     1                       ; 52AD   0040
        MVO@    R0,     R5                      ; 52AE   0268
        RLC     R3,     1                       ; 52AF   0053
        SDBD                                    ; 52B0   0001
        ADDI    #$52BC, R3                      ; 52B1   02FB 00BC 0052
        MVI@    R3,     R0                      ; 52B4   0298

        JSR     R5,     X_EXT_SIGN_LO           ; 52B5   0004 0114 0268

        ADD@    R4,     R0                      ; 52B8   02E0
        DECR    R4                              ; 52B9   0014
        MVO@    R0,     R4                      ; 52BA   0260
L_52BB:
        PULR    R7                              ; 52BB   02B7

        DECLE   $0000,  $0001,  $00FF,  $0000   ; 52BC   0000 0001 00FF 0000
L_52C0:
        MVII    #$0198, R2                      ; 52C0   02BA 0198
        ADDR    R0,     R2                      ; 52C2   00C2
        ADDR    R0,     R2                      ; 52C3   00C2
        ADDR    R0,     R2                      ; 52C4   00C2
        MVI@    R2,     R2                      ; 52C5   0292
        CLRR    R3                              ; 52C6   01DB
L_52C7:
        MVI@    R4,     R1                      ; 52C7   02A1
        TSTR    R1                              ; 52C8   0089
        BEQ     L_52D1                          ; 52C9   0204 0006

        ANDI    #$003F, R1                      ; 52CB   03B9 003F
        ADDR    R1,     R3                      ; 52CD   00CB
        CMPR    R2,     R3                      ; 52CE   0153
        BLT     L_52C7                          ; 52CF   0225 0009

L_52D1:
        DECR    R4                              ; 52D1   0014
        MOVR    R5,     R7                      ; 52D2   00AF

L_52D3:
        PSHR    R5                              ; 52D3   0275
        MVI@    R2,     R5                      ; 52D4   0295
        SDBD                                    ; 52D5   0001
        MVII    #$6473, R2                      ; 52D6   02BA 0073 0064
        ADDR    R2,     R5                      ; 52D9   00D5
        ADD@    R5,     R2                      ; 52DA   02EA
        PULR    R7                              ; 52DB   02B7

L_52DC:
        PSHR    R5                              ; 52DC   0275

        JSR     R5,     L_5FF2                  ; 52DD   0004 015C 03F2

        MVII    #$017F, R2                      ; 52E0   02BA 017F
        ADDR    R0,     R2                      ; 52E2   00C2

        JSR     R5,     L_52D3                  ; 52E3   0004 0150 02D3

        MOVR    R2,     R4                      ; 52E6   0094
        INCR    R4                              ; 52E7   000C
        PSHR    R4                              ; 52E8   0274

        JSR     R5,     L_52C0                  ; 52E9   0004 0150 02C0

        MVII    #$01A0, R1                      ; 52EC   02B9 01A0
        ADDR    R0,     R1                      ; 52EE   00C1
        MVI@    R1,     R1                      ; 52EF   0289
        TSTR    R1                              ; 52F0   0089
        BEQ     L_5315                          ; 52F1   0204 0022

        MVI@    R4,     R5                      ; 52F3   02A5
        ANDI    #$003F, R5                      ; 52F4   03BD 003F
        SUBR    R5,     R3                      ; 52F6   012B
        SUBR    R3,     R2                      ; 52F7   011A
        DECR    R4                              ; 52F8   0014
        TSTR    R3                              ; 52F9   009B
        BNEQ    L_530B                          ; 52FA   020C 000F

        MVII    #$0100, R5                      ; 52FC   02BD 0100
        CMPI    #$0001, R2                      ; 52FE   037A 0001
        BGT     L_5329                          ; 5300   020E 0027

L_5302:
        PULR    R2                              ; 5302   02B2
        MVII    #$018F, R1                      ; 5303   02B9 018F
        ADDR    R0,     R1                      ; 5305   00C1
        MVI@    R1,     R4                      ; 5306   028C
        ANDI    #$0001, R4                      ; 5307   03BC 0001
        B       L_5543                          ; 5309   0200 0238

L_530B:
        MVI@    R4,     R5                      ; 530B   02A5
        DECR    R4                              ; 530C   0014
        CMPI    #$0005, R2                      ; 530D   037A 0005
        BGE     L_5329                          ; 530F   020D 0018

        DECR    R4                              ; 5311   0014
        MVI@    R4,     R5                      ; 5312   02A5
        B       L_5329                          ; 5313   0200 0014

L_5315:
        SUBR    R2,     R3                      ; 5315   0113
        MVI@    R4,     R5                      ; 5316   02A5
        MVI@    R4,     R2                      ; 5317   02A2
        SUBI    #$0002, R4                      ; 5318   033C 0002
        TSTR    R2                              ; 531A   0092
        BNEQ    L_5324                          ; 531B   020C 0007

        MVII    #$0100, R5                      ; 531D   02BD 0100
        TSTR    R3                              ; 531F   009B
        BNEQ    L_5329                          ; 5320   020C 0007
        B       L_5302                          ; 5322   0220 0021

L_5324:
        CMPI    #$0005, R3                      ; 5324   037B 0005
        BGE     L_5329                          ; 5326   020D 0001

        MOVR    R2,     R5                      ; 5328   0095
L_5329:
        PULR    R2                              ; 5329   02B2
        PSHR    R5                              ; 532A   0275
        MOVR    R2,     R5                      ; 532B   0095
        CLRR    R3                              ; 532C   01DB
        INCR    R4                              ; 532D   000C
L_532E:
        MVI@    R5,     R2                      ; 532E   02AA
        ANDI    #$03F0, R2                      ; 532F   03BA 03F0
        CMPI    #$0100, R2                      ; 5331   037A 0100
        BNEQ    L_5336                          ; 5333   020C 0001

        INCR    R3                              ; 5335   000B
L_5336:
        CMPR    R5,     R4                      ; 5336   016C
        BNEQ    L_532E                          ; 5337   022C 000A

        DECR    R3                              ; 5339   0013
        DECR    R4                              ; 533A   0014
L_533B:
        MVI@    R5,     R2                      ; 533B   02AA
        TSTR    R2                              ; 533C   0092
        BNEQ    L_533B                          ; 533D   022C 0003

        MVI@    R4,     R2                      ; 533F   02A2
        SLR     R2,     2                       ; 5340   0066
        SLR     R2,     2                       ; 5341   0066
        SLR     R2,     2                       ; 5342   0066
        CMPI    #$0004, R2                      ; 5343   037A 0004
        BEQ     L_534B                          ; 5345   0204 0004

        TSTR    R1                              ; 5347   0089
        BNEQ    L_534B                          ; 5348   020C 0001

        INCR    R3                              ; 534A   000B
L_534B:
        ADDR    R3,     R5                      ; 534B   00DD
        MVI@    R5,     R3                      ; 534C   02AB
        MOVR    R3,     R4                      ; 534D   009C
        MVII    #$0186, R1                      ; 534E   02B9 0186
        ADDR    R0,     R1                      ; 5350   00C1
        ANDI    #$01FF, R3                      ; 5351   03BB 01FF
        MVO@    R3,     R1                      ; 5353   024B
        MVII    #$017B, R1                      ; 5354   02B9 017B
        ADDR    R0,     R1                      ; 5356   00C1
        MVI@    R1,     R3                      ; 5357   028B
        CMPR    R3,     R2                      ; 5358   015A
        BEQ     L_538B                          ; 5359   0204 0030

        MVO@    R2,     R1                      ; 535B   024A
        PSHR    R2                              ; 535C   0272
        PSHR    R0                              ; 535D   0270
        MVII    #$0023, R3                      ; 535E   02BB 0023
        ADDR    R0,     R3                      ; 5360   00C3
        PSHR    R3                              ; 5361   0273
        MOVR    R2,     R5                      ; 5362   0095
        ADDR    R5,     R5                      ; 5363   00ED
        SDBD                                    ; 5364   0001
        ADDI    #$597A, R5                      ; 5365   02FD 007A 0059
        MOVR    R5,     R3                      ; 5368   00AB
        ADD@    R5,     R3                      ; 5369   02EB
        MVII    #$01DD, R2                      ; 536A   02BA 01DD
        ADDR    R0,     R2                      ; 536C   00C2
        MVI@    R5,     R0                      ; 536D   02A8
        MVO@    R0,     R2                      ; 536E   0250
        PSHR    R3                              ; 536F   0273

        JSR     R5,     L_6922                  ; 5370   0004 0168 0122

        PULR    R0                              ; 5373   02B0
        PULR    R2                              ; 5374   02B2
        CLRR    R1                              ; 5375   01C9
        CMPI    #$0004, R2                      ; 5376   037A 0004
        BNEQ    L_537D                          ; 5378   020C 0003

        JSR     R5,     L_539F                  ; 537A   0004 0150 039F

L_537D:
        MVII    #$018F, R2                      ; 537D   02BA 018F
        ADDR    R0,     R2                      ; 537F   00C2
        MVO@    R1,     R2                      ; 5380   0251
        PSHR    R0                              ; 5381   0270

        JSR     R5,     L_6088                  ; 5382   0004 0160 0088

        PULR    R0                              ; 5385   02B0
        PSHR    R0                              ; 5386   0270

        JSR     R5,     L_61C4                  ; 5387   0004 0160 01C4

        PULR    R0                              ; 538A   02B0
L_538B:
        PULR    R2                              ; 538B   02B2
        SLR     R2,     2                       ; 538C   0066
        SLR     R2,     2                       ; 538D   0066
        SLR     R2,     2                       ; 538E   0066
        MVII    #$017D, R1                      ; 538F   02B9 017D
        ADDR    R0,     R1                      ; 5391   00C1
        MVI@    R1,     R3                      ; 5392   028B
        CMPR    R3,     R2                      ; 5393   015A
        BEQ     L_539C                          ; 5394   0204 0006

        MVO@    R2,     R1                      ; 5396   024A
        PSHR    R0                              ; 5397   0270

        JSR     R5,     L_612E                  ; 5398   0004 0160 012E

        PULR    R0                              ; 539B   02B0
L_539C:
        J       L_6200                          ; 539C   0004 0360 0200

L_539F:
        PSHR    R5                              ; 539F   0275
        PSHR    R0                              ; 53A0   0270
        MOVR    R4,     R2                      ; 53A1   00A2
        ANDI    #$01FF, R2                      ; 53A2   03BA 01FF
        MVII    #$01A0, R3                      ; 53A4   02BB 01A0
        ADDR    R0,     R3                      ; 53A6   00C3
        MVI@    R3,     R3                      ; 53A7   029B
        MOVR    R2,     R1                      ; 53A8   0091
        ADDR    R1,     R2                      ; 53A9   00CA
        ADDR    R1,     R2                      ; 53AA   00CA
        SDBD                                    ; 53AB   0001
        ADDI    #$6816, R2                      ; 53AC   02FA 0016 0068
        ANDI    #$0200, R4                      ; 53AF   03BC 0200
        BNEQ    L_53B4                          ; 53B1   020C 0001

        INCR    R2                              ; 53B3   000A
L_53B4:
        MVI@    R2,     R2                      ; 53B4   0292
        MOVR    R2,     R1                      ; 53B5   0091
        ANDI    #$001F, R1                      ; 53B6   03B9 001F
        SLR     R2,     1                       ; 53B8   0062
        SLR     R2,     2                       ; 53B9   0066
        SLR     R2,     2                       ; 53BA   0066
        TSTR    R3                              ; 53BB   009B
        BEQ     L_53C1                          ; 53BC   0204 0003

        PSHR    R1                              ; 53BE   0271
        MOVR    R2,     R1                      ; 53BF   0091
        PULR    R2                              ; 53C0   02B2
L_53C1:
        MVII    #$0194, R3                      ; 53C1   02BB 0194
        ADDR    R0,     R3                      ; 53C3   00C3
        MOVR    R1,     R0                      ; 53C4   0088
        CLRR    R1                              ; 53C5   01C9
        CMPI    #$001F, R0                      ; 53C6   0378 001F
        BEQ     L_53CD                          ; 53C8   0204 0003

        ADDI    #$0001, R1                      ; 53CA   02F9 0001
        MVO@    R0,     R3                      ; 53CC   0258
L_53CD:
        CMPI    #$001F, R2                      ; 53CD   037A 001F
        BEQ     L_53D4                          ; 53CF   0204 0003

        ADDI    #$0002, R1                      ; 53D1   02F9 0002
        MVO@    R2,     R3                      ; 53D3   025A
L_53D4:
        PULR    R0                              ; 53D4   02B0
        PULR    R7                              ; 53D5   02B7

L_53D6:
        PSHR    R5                              ; 53D6   0275

        JSR     R5,     L_5FF2                  ; 53D7   0004 015C 03F2

        MVII    #$018D, R4                      ; 53DA   02BC 018D
        MVII    #$0197, R5                      ; 53DC   02BD 0197
        ADDR    R0,     R4                      ; 53DE   00C4
        ADDR    R0,     R5                      ; 53DF   00C5
        ADDR    R0,     R5                      ; 53E0   00C5
        ADDR    R0,     R5                      ; 53E1   00C5
        MVI@    R5,     R3                      ; 53E2   02AB
        MVII    #$01A0, R1                      ; 53E3   02B9 01A0
        ADDR    R0,     R1                      ; 53E5   00C1
        MVI@    R1,     R1                      ; 53E6   0289
        TSTR    R1                              ; 53E7   0089
        BEQ     L_53ED                          ; 53E8   0204 0003

        MOVR    R3,     R1                      ; 53EA   0099
        B       L_53F0                          ; 53EB   0200 0003

L_53ED:
        MVII    #$00FF, R1                      ; 53ED   02B9 00FF
        SUBR    R3,     R1                      ; 53EF   0119

L_53F0:
        JSR     R5,     L_5FDC                  ; 53F0   0004 015C 03DC

        MVII    #$0007, R3                      ; 53F3   02BB 0007
        SUBR    R1,     R3                      ; 53F5   010B
        MOVR    R3,     R1                      ; 53F6   0099
        SLR     R1,     1                       ; 53F7   0061
        CMP@    R4,     R1                      ; 53F8   0361
        BEQ     L_544A                          ; 53F9   0204 004F

        JSR     R5,     L_6116                  ; 53FB   0004 0160 0116

        DECR    R4                              ; 53FE   0014
        MVI@    R4,     R2                      ; 53FF   02A2
        DECR    R4                              ; 5400   0014
        MVO@    R1,     R4                      ; 5401   0261
        MVII    #$018F, R3                      ; 5402   02BB 018F
        ADDR    R0,     R3                      ; 5404   00C3
        MVI@    R3,     R3                      ; 5405   029B
        TSTR    R3                              ; 5406   009B
        BNEQ    L_5470                          ; 5407   020C 0067

        PSHR    R1                              ; 5409   0271
        MOVR    R5,     R4                      ; 540A   00AC
        PSHR    R5                              ; 540B   0275
        CMPI    #$0003, R2                      ; 540C   037A 0003
        BEQ     L_5420                          ; 540E   0204 0010

        JSR     R5,     L_544B                  ; 5410   0004 0154 004B
        JSR     R5,     L_5456                  ; 5413   0004 0154 0056

        BNEQ    L_5419                          ; 5416   020C 0001

        MVO@    R1,     R3                      ; 5418   0259
L_5419:
        INCR    R2                              ; 5419   000A

        JSR     R5,     L_5456                  ; 541A   0004 0154 0056

        BNEQ    L_5420                          ; 541D   020C 0001

        MVO@    R1,     R3                      ; 541F   0259
L_5420:
        PULR    R4                              ; 5420   02B4
        PULR    R2                              ; 5421   02B2
        CLRR    R1                              ; 5422   01C9
        CMPI    #$0003, R2                      ; 5423   037A 0003
        BEQ     L_5433                          ; 5425   0204 000C

        MOVR    R2,     R1                      ; 5427   0091
        ADDI    #$0025, R1                      ; 5428   02F9 0025
        ADDR    R0,     R1                      ; 542A   00C1
        ADDR    R0,     R1                      ; 542B   00C1
        ADDR    R0,     R1                      ; 542C   00C1
        SLL     R1,     2                       ; 542D   004D
        SLL     R1,     1                       ; 542E   0049
        SDBD                                    ; 542F   0001
        XORI    #$0800, R1                      ; 5430   03F9 0000 0008

L_5433:
        JSR     R5,     L_544B                  ; 5433   0004 0154 004B

        MOVR    R1,     R0                      ; 5436   0088
        MVII    #$0002, R5                      ; 5437   02BD 0002
L_5439:
        PSHR    R5                              ; 5439   0275

        JSR     R5,     L_5456                  ; 543A   0004 0154 0056

        BNEQ    L_5445                          ; 543D   020C 0006

        XORR    R0,     R1                      ; 543F   01C1
        INCR    R4                              ; 5440   000C
        XOR@    R4,     R1                      ; 5441   03E1
        MVO@    R1,     R3                      ; 5442   0259
        SUBI    #$0002, R4                      ; 5443   033C 0002
L_5445:
        INCR    R2                              ; 5445   000A
        PULR    R5                              ; 5446   02B5
        DECR    R5                              ; 5447   0015
        BNEQ    L_5439                          ; 5448   022C 0010
L_544A:
        PULR    R7                              ; 544A   02B7

L_544B:
        ADDR    R2,     R2                      ; 544B   00D2
        SDBD                                    ; 544C   0001
        ADDI    #$5460, R2                      ; 544D   02FA 0060 0054
        TSTR    R0                              ; 5450   0080
        BEQ     L_5455                          ; 5451   0204 0002

        ADDI    #$0008, R2                      ; 5453   02FA 0008
L_5455:
        MOVR    R5,     R7                      ; 5455   00AF

L_5456:
        PSHR    R5                              ; 5456   0275
        MVI@    R4,     R1                      ; 5457   02A1
        SWAP    R1,     1                       ; 5458   0041
        MVI@    R2,     R3                      ; 5459   0293
        MVI@    R3,     R5                      ; 545A   029D
        SDBD                                    ; 545B   0001
        ANDI    #$C000, R5                      ; 545C   03BD 0000 00C0
        PULR    R7                              ; 545F   02B7

        DECLE   $023E,  $0242,  $0265,  $026B   ; 5460   023E 0242 0265 026B
        DECLE   $028C,  $0294,  $023C           ; 5464   028C 0294 023C

        MVO     R4,     .BTAB.49                ; 5467   0244 0249
        MVO@    R5,     R1                      ; 5469   024D
        PSHR    R0                              ; 546A   0270
        PSHR    R6                              ; 546B   0276
        MVI@    R2,     R7                      ; 546C   0297
        MVI@    R3,     R7                      ; 546D   029F

        MVO     R7,     .BTAB.4E                ; 546E   0247 024E
L_5470:
        PSHR    R3                              ; 5470   0273
        PSHR    R1                              ; 5471   0271
        CMPI    #$0003, R2                      ; 5472   037A 0003
        BEQ     L_5487                          ; 5474   0204 0011

        CLRR    R1                              ; 5476   01C9
        MVI@    R5,     R3                      ; 5477   02AB
        SWAP    R3,     1                       ; 5478   0043
        PSHR    R5                              ; 5479   0275
        PSHR    R2                              ; 547A   0272

        JSR     R5,     L_54A6                  ; 547B   0004 0154 00A6

        PULR    R2                              ; 547E   02B2
        PULR    R5                              ; 547F   02B5
        MVI@    R5,     R3                      ; 5480   02AB
        SWAP    R3,     1                       ; 5481   0043
        MVII    #$0001, R1                      ; 5482   02B9 0001

        JSR     R5,     L_54A6                  ; 5484   0004 0154 00A6

L_5487:
        PULR    R1                              ; 5487   02B1
        PULR    R3                              ; 5488   02B3
        CMPI    #$0003, R1                      ; 5489   0379 0003
        BEQ     L_54A0                          ; 548B   0204 0013

        MOVR    R1,     R2                      ; 548D   008A
        CMPI    #$0001, R3                      ; 548E   037B 0001
        BEQ     L_54A1                          ; 5490   0204 000F

        PSHR    R3                              ; 5492   0273
        PSHR    R2                              ; 5493   0272
        CLRR    R1                              ; 5494   01C9
        MVII    #$0000, R3                      ; 5495   02BB 0000

        JSR     R5,     L_54A6                  ; 5497   0004 0154 00A6

        PULR    R2                              ; 549A   02B2
        PULR    R3                              ; 549B   02B3
        CMPI    #$0002, R3                      ; 549C   037B 0002
        BNEQ    L_54A1                          ; 549E   020C 0001
L_54A0:
        PULR    R7                              ; 54A0   02B7

L_54A1:
        MVII    #$0001, R1                      ; 54A1   02B9 0001
        MVII    #$0000, R3                      ; 54A3   02BB 0000
        INCR    R7                              ; 54A5   000F

L_54A6:
        PSHR    R5                              ; 54A6   0275
L_54A7:
        ADDR    R2,     R2                      ; 54A7   00D2
        ADDR    R1,     R2                      ; 54A8   00CA
        SDBD                                    ; 54A9   0001
        ADDI    #$54CA, R2                      ; 54AA   02FA 00CA 0054
        MOVR    R2,     R1                      ; 54AD   0091
        ADD@    R2,     R1                      ; 54AE   02D1
L_54AF:
        MVI@    R1,     R2                      ; 54AF   028A
        TSTR    R2                              ; 54B0   0092
        BEQ     L_54C9                          ; 54B1   0204 0016

        TSTR    R0                              ; 54B3   0080
        BEQ     L_54B8                          ; 54B4   0204 0002

        ADDI    #$000B, R2                      ; 54B6   02FA 000B
L_54B8:
        MVI@    R2,     R4                      ; 54B8   0294
        SDBD                                    ; 54B9   0001
        ANDI    #$C000, R4                      ; 54BA   03BC 0000 00C0
        BNEQ    L_54C6                          ; 54BD   020C 0007

        MVI@    R2,     R4                      ; 54BF   0294
        SDBD                                    ; 54C0   0001
        ANDI    #$09FF, R4                      ; 54C1   03BC 00FF 0009
        XORR    R3,     R4                      ; 54C4   01DC
        MVO@    R4,     R2                      ; 54C5   0254
L_54C6:
        INCR    R1                              ; 54C6   0009
        B       L_54AF                          ; 54C7   0220 0019
L_54C9:
        PULR    R7                              ; 54C9   02B7

        DECLE   $0006,  $000A,  $000E,  $0014   ; 54CA   0006 000A 000E 0014
        DECLE   $001A,  $001E,  $023C,  $023D   ; 54CE   001A 001E 023C 023D
        DECLE   $023E,  $023F,  $0000,  $0241   ; 54D2   023E 023F 0000 0241
        DECLE   $0242,  $0243,  $0244,  $0000   ; 54D6   0242 0243 0244 0000
        DECLE   $0250,  $0251,  $0252,  $0264   ; 54DA   0250 0251 0252 0264
        DECLE   $0265,  $0266,  $0000,  $0256   ; 54DE   0265 0266 0000 0256
        DECLE   $0257,  $0258,  $026A,  $026B   ; 54E2   0257 0258 026A 026B
        DECLE   $026C,  $0000,  $028C,  $028D   ; 54E6   026C 0000 028C 028D
        DECLE   $02A0,  $02B4,  $0000           ; 54EA   02A0 02B4 0000

        MVI@    R2,     R3                      ; 54ED   0293
        MVI@    R2,     R4                      ; 54EE   0294
        MVI@    R5,     R0                      ; 54EF   02A8
        MVII    #$0000, R4                      ; 54F0   02BC 0000
L_54F2:
        PSHR    R5                              ; 54F2   0275
        MVII    #$0186, R5                      ; 54F3   02BD 0186
        ADDR    R0,     R5                      ; 54F5   00C5
        MVI@    R5,     R1                      ; 54F6   02A9

        JSR     R5,     L_52D3                  ; 54F7   0004 0150 02D3

        INCR    R2                              ; 54FA   000A
        MOVR    R2,     R4                      ; 54FB   0094
L_54FC:
        MVI@    R4,     R3                      ; 54FC   02A3
        TSTR    R3                              ; 54FD   009B
        BNEQ    L_54FC                          ; 54FE   022C 0003

        CLRR    R5                              ; 5500   01ED
L_5501:
        INCR    R5                              ; 5501   000D
        MVI@    R4,     R3                      ; 5502   02A3
        ANDI    #$01FF, R3                      ; 5503   03BB 01FF
        CMPR    R3,     R1                      ; 5505   0159
        BNEQ    L_5501                          ; 5506   022C 0006

        DECR    R4                              ; 5508   0014
        MVI@    R4,     R3                      ; 5509   02A3
        ANDI    #$0200, R3                      ; 550A   03BB 0200
        BEQ     L_5510                          ; 550C   0204 0002

        MVII    #$0001, R3                      ; 550E   02BB 0001
L_5510:
        PULR    R7                              ; 5510   02B7

L_5511:
        PSHR    R5                              ; 5511   0275
L_5512:
        MVII    #$032C, R1                      ; 5512   02B9 032C
        ADDR    R0,     R1                      ; 5514   00C1
        MVI@    R1,     R1                      ; 5515   0289
        ANDI    #$00FF, R1                      ; 5516   03B9 00FF
        CLRR    R2                              ; 5518   01D2
        TSTR    R0                              ; 5519   0080
        BEQ     L_5520                          ; 551A   0204 0004

        ADDI    #$000B, R2                      ; 551C   02FA 000B
        SUBI    #$0058, R1                      ; 551E   0339 0058
L_5520:
        ADDI    #$02B4, R2                      ; 5520   02FA 02B4
        CLRR    R4                              ; 5522   01E4
        SDBD                                    ; 5523   0001
        MVII    #$0858, R3                      ; 5524   02BB 0058 0008
        MVII    #$0008, R5                      ; 5527   02BD 0008
        CMPI    #$00F0, R1                      ; 5529   0379 00F0
        BGT     L_553B                          ; 552B   020E 000E

        CMPR    R5,     R1                      ; 552D   0169
        BLT     L_553B                          ; 552E   0205 000B

        MVII    #$0041, R5                      ; 5530   02BD 0041
        CMPR    R5,     R1                      ; 5532   0169
        BGE     L_5536                          ; 5533   020D 0001
        PULR    R7                              ; 5535   02B7

L_5536:
        ADDI    #$0008, R2                      ; 5536   02FA 0008
        ADDI    #$0010, R3                      ; 5538   02FB 0010
        INCR    R4                              ; 553A   000C
L_553B:
        CMP@    R2,     R3                      ; 553B   0353
        BNEQ    L_55B0                          ; 553C   020C 0072

        JSR     R5,     L_5FFD                  ; 553E   0004 015C 03FD

        BPL     L_55C1                          ; 5541   0203 007E

L_5543:
        PSHR    R4                              ; 5543   0274
        MVII    #$0194, R2                      ; 5544   02BA 0194
        MVII    #$017F, R5                      ; 5546   02BD 017F
        ADDR    R0,     R2                      ; 5548   00C2
        ADDR    R0,     R5                      ; 5549   00C5
        MVI@    R2,     R3                      ; 554A   0293
        MVO@    R3,     R5                      ; 554B   026B

        JSR     R5,     L_54F2                  ; 554C   0004 0154 00F2

        PULR    R4                              ; 554F   02B4
        XORR    R4,     R3                      ; 5550   01E3
        MVII    #$01A0, R1                      ; 5551   02B9 01A0
        ADDR    R0,     R1                      ; 5553   00C1
        XOR@    R1,     R3                      ; 5554   03CB
        MVO@    R3,     R1                      ; 5555   024B
        PSHR    R4                              ; 5556   0274
        CLRR    R4                              ; 5557   01E4
L_5558:
        MVI@    R2,     R3                      ; 5558   0293
        ANDI    #$03C0, R3                      ; 5559   03BB 03C0
        CMPI    #$0100, R3                      ; 555B   037B 0100
        BNEQ    L_5562                          ; 555D   020C 0003

        DECR    R5                              ; 555F   0015
        BEQ     L_5569                          ; 5560   0204 0007

L_5562:
        MVI@    R2,     R3                      ; 5562   0293
        ANDI    #$003F, R3                      ; 5563   03BB 003F
        ADDR    R3,     R4                      ; 5565   00DC
        INCR    R2                              ; 5566   000A
        B       L_5558                          ; 5567   0220 0010

L_5569:
        MVI@    R2,     R3                      ; 5569   0293
        ANDI    #$003F, R3                      ; 556A   03BB 003F
        SLR     R3,     1                       ; 556C   0063
        ADDR    R3,     R4                      ; 556D   00DC
        MVII    #$0196, R5                      ; 556E   02BD 0196
        ADDR    R0,     R5                      ; 5570   00C5
        ADDR    R0,     R5                      ; 5571   00C5
        ADDR    R0,     R5                      ; 5572   00C5
        CLRR    R2                              ; 5573   01D2
        MVO@    R2,     R5                      ; 5574   026A
        MVO@    R2,     R5                      ; 5575   026A
        MVO@    R4,     R5                      ; 5576   026C
        PSHR    R0                              ; 5577   0270
        MOVR    R0,     R2                      ; 5578   0082

        JSR     R5,     L_5B0E                  ; 5579   0004 0158 030E
        DECLE   $02B0,  $02B1,  $02F9,  $0002   ; 557C   02B0 02B1 02F9 0002
        DECLE   $02BC,  $01B1,  $00C4,  $0261   ; 5580   02BC 01B1 00C4 0261
        DECLE   $0270,  $0004,  $0168,  $0269   ; 5584   0270 0004 0168 0269

        PULR    R0                              ; 5588   02B0
        MVII    #$02F6, R5                      ; 5589   02BD 02F6
        ADDR    R0,     R5                      ; 558B   00C5
        MVI@    R5,     R2                      ; 558C   02AA
        B       L_5591                          ; 558D   0200 0002

L_558F:
        PSHR    R5                              ; 558F   0275
L_5590:
        CLRR    R2                              ; 5590   01D2
L_5591:
        MVII    #$0126, R1                      ; 5591   02B9 0126
        ADDR    R0,     R1                      ; 5593   00C1
        ADDR    R0,     R1                      ; 5594   00C1
        CLRR    R3                              ; 5595   01DB
        MVO@    R3,     R1                      ; 5596   024B
        MVII    #$002C, R4                      ; 5597   02BC 002C
        TSTR    R0                              ; 5599   0080
        BEQ     L_559E                          ; 559A   0204 0002

        ADDI    #$0058, R4                      ; 559C   02FC 0058
L_559E:
        MVII    #$032C, R1                      ; 559E   02B9 032C
        ADDR    R0,     R1                      ; 55A0   00C1
        MVI@    R1,     R3                      ; 55A1   028B
        SDBD                                    ; 55A2   0001
        ANDI    #$FF00, R3                      ; 55A3   03BB 0000 00FF
        XORR    R4,     R3                      ; 55A6   01E3
        MVO@    R3,     R1                      ; 55A7   024B
        MVII    #$02F6, R5                      ; 55A8   02BD 02F6
        ADDR    R0,     R5                      ; 55AA   00C5
        MVO@    R2,     R5                      ; 55AB   026A

        JSR     R5,     L_6045                  ; 55AC   0004 0160 0045

        PULR    R7                              ; 55AF   02B7

L_55B0:
        TSTR    R0                              ; 55B0   0080
        BEQ     L_55B5                          ; 55B1   0204 0002

        ADDI    #$0058, R5                      ; 55B3   02FD 0058
L_55B5:
        MOVR    R5,     R4                      ; 55B5   00AC
        MVII    #$02F6, R5                      ; 55B6   02BD 02F6
        ADDR    R0,     R5                      ; 55B8   00C5
        MVI@    R5,     R2                      ; 55B9   02AA
        SUBI    #$0080, R2                      ; 55BA   033A 0080
        BPL     L_559E                          ; 55BC   0223 001F
        B       L_5590                          ; 55BE   0220 002F

L_55C0:
        PSHR    R5                              ; 55C0   0275

L_55C1:
        JSR     R5,     L_5FF2                  ; 55C1   0004 015C 03F2

        MVI     G_01AE, R5                      ; 55C4   0285 01AE
        TSTR    R5                              ; 55C6   00AD
        BEQ     L_55F9                          ; 55C7   0204 0030

        PSHR    R0                              ; 55C9   0270

        JSR     R5,     L_558F                  ; 55CA   0004 0154 018F

        PULR    R2                              ; 55CD   02B2
        PSHR    R2                              ; 55CE   0272

        JSR     R5,     L_5B0E                  ; 55CF   0004 0158 030E

        PULR    R0                              ; 55D2   02B0
        MVII    #$01B1, R5                      ; 55D3   02BD 01B1
        ADDR    R0,     R5                      ; 55D5   00C5
        MVII    #$0014, R1                      ; 55D6   02B9 0014
        MVO@    R1,     R5                      ; 55D8   0269
        MVII    #$0001, R3                      ; 55D9   02BB 0001
        PSHR    R0                              ; 55DB   0270

        JSR     R5,     L_57D7                  ; 55DC   0004 0154 03D7

        PULR    R1                              ; 55DF   02B1
        MVII    #$0006, R0                      ; 55E0   02B8 0006

        JSR     R5,     X_RAND2                 ; 55E2   0004 0114 029E

        ADDI    #$0005, R0                      ; 55E5   02F8 0005
        MOVR    R0,     R2                      ; 55E7   0082
        NEGR    R2                              ; 55E8   0022

        JSR     R5,     L_6E5A                  ; 55E9   0004 016C 025A
        JSR     R5,     X_PLAY_SFX2             ; 55EC   0004 0118 03BE
        DECLE   $00A5                           ; 55EF  SFX prio
        DECLE   $0079                           ; 55F0  SFX data
        DECLE   $03B7                           ; 55F1  SFX data
        DECLE   $000B                           ; 55F2  SFX data
        DECLE   $03ED                           ; 55F3  SFX data
        DECLE   $00CC,  $0000                   ; 55F4  SFX data
        DECLE   $008F,  $0064                   ; 55F6  SFX data
        DECLE   $02CF                           ; 55F8  SFX end

L_55F9:
        PULR    R7                              ; 55F9   02B7

        PSHR    R5                              ; 55FA   0275
        MVI     G_01AE, R0                      ; 55FB   0280 01AE
        TSTR    R0                              ; 55FD   0080
        BNEQ    L_5609                          ; 55FE   020C 0009

        MVI     G_01AD, R0                      ; 5600   0280 01AD
        TSTR    R0                              ; 5602   0080
        BNEQ    L_5696                          ; 5603   020C 0091

        MVII    #$00F0, R0                      ; 5605   02B8 00F0
        MVO     R0,     G_011D                  ; 5607   0240 011D
L_5609:
        CLRR    R0                              ; 5609   01C0

        JSR     R5,     L_569D                  ; 560A   0004 0154 029D

        MVII    #$0001, R0                      ; 560D   02B8 0001

        JSR     R5,     L_569D                  ; 560F   0004 0154 029D

        MVII    #$0188, R1                      ; 5612   02B9 0188
        MVI@    R1,     R0                      ; 5614   0288
        ADDI    #$0005, R0                      ; 5615   02F8 0005
        MVO@    R0,     R1                      ; 5617   0248
        CMPI    #$003C, R0                      ; 5618   0378 003C
        BNEQ    L_5680                          ; 561A   020C 0064

        PSHR    R1                              ; 561C   0271
        CLRR    R0                              ; 561D   01C0

        JSR     R5,     L_57BF                  ; 561E   0004 0154 03BF

        MVII    #$0001, R0                      ; 5621   02B8 0001

        JSR     R5,     L_57BF                  ; 5623   0004 0154 03BF

        PULR    R1                              ; 5626   02B1
        CLRR    R0                              ; 5627   01C0
        MVO@    R0,     R1                      ; 5628   0248
        INCR    R1                              ; 5629   0009
        MVI@    R1,     R0                      ; 562A   0288
        INCR    R0                              ; 562B   0008
        MVO@    R0,     R1                      ; 562C   0248
        CMPI    #$0018, R0                      ; 562D   0378 0018
        BNEQ    L_5662                          ; 562F   020C 0031

        CLRR    R0                              ; 5631   01C0
        MVO@    R0,     R1                      ; 5632   0248
        INCR    R1                              ; 5633   0009
        MVI@    R1,     R2                      ; 5634   028A
        INCR    R2                              ; 5635   000A
        MVO@    R2,     R1                      ; 5636   024A
        PSHR    R2                              ; 5637   0272
L_5638:
        SUBI    #$000A, R2                      ; 5638   033A 000A
        BMI     L_5647                          ; 563A   020B 000B
        BNEQ    L_5638                          ; 563C   022C 0005

        MVI     G_01AE, R2                      ; 563E   0282 01AE
        CMPI    #$0002, R2                      ; 5640   037A 0002
        BNEQ    L_5647                          ; 5642   020C 0003

        JSR     R5,     L_6F3B                  ; 5644   0004 016C 033B

L_5647:
        CLRR    R0                              ; 5647   01C0

        JSR     R5,     L_5786                  ; 5648   0004 0154 0386

        MVII    #$0001, R0                      ; 564B   02B8 0001

        JSR     R5,     L_5786                  ; 564D   0004 0154 0386

        PULR    R2                              ; 5650   02B2
        MVI     G_01AF, R0                      ; 5651   0280 01AF
        MVI     G_01AE, R3                      ; 5653   0283 01AE
        CMPI    #$0001, R3                      ; 5655   037B 0001
        BNEQ    L_565B                          ; 5657   020C 0002

        MVII    #$003C, R0                      ; 5659   02B8 003C
L_565B:
        CMPR    R0,     R2                      ; 565B   0142
        BLT     L_5661                          ; 565C   0205 0003

        JSR     R5,     L_57E8                  ; 565E   0004 0154 03E8

L_5661:
        CLRR    R0                              ; 5661   01C0
L_5662:
        SLR     R0,     2                       ; 5662   0064
        MOVR    R0,     R1                      ; 5663   0081
        SDBD                                    ; 5664   0001
        ADDI    #$5697, R1                      ; 5665   02F9 0097 0056
        MVI@    R1,     R1                      ; 5668   0289
        CMP     G_0183, R1                      ; 5669   0341 0183
        BEQ     L_5675                          ; 566B   0204 0008

        MVI     G_019E, R0                      ; 566D   0280 019E
        XORI    #$0002, R0                      ; 566F   03F8 0002
        ANDI    #$00FE, R0                      ; 5671   03B8 00FE
        MVO     R0,     G_019E                  ; 5673   0240 019E
L_5675:
        MVO     R1,     G_0183                  ; 5675   0241 0183
        CLRR    R0                              ; 5677   01C0

        JSR     R5,     L_612E                  ; 5678   0004 0160 012E

        MVII    #$0001, R0                      ; 567B   02B8 0001

        JSR     R5,     L_612E                  ; 567D   0004 0160 012E

L_5680:
        MVI     G_01B1, R0                      ; 5680   0280 01B1
        CMPI    #$000C, R0                      ; 5682   0378 000C
        BNEQ    L_568B                          ; 5684   020C 0005

        MVII    #$023C, R4                      ; 5686   02BC 023C

        JSR     R5,     L_6CD2                  ; 5688   0004 016C 00D2

L_568B:
        MVI     G_01B2, R0                      ; 568B   0280 01B2
        CMPI    #$000C, R0                      ; 568D   0378 000C
        BNEQ    L_5696                          ; 568F   020C 0005

        MVII    #$0247, R4                      ; 5691   02BC 0247

        JSR     R5,     L_6CD2                  ; 5693   0004 016C 00D2

L_5696:
        PULR    R7                              ; 5696   02B7

        DECLE   $0000                           ; 5697   0000

        GSWD    R0                              ; 5698   0030
        DECR    R0                              ; 5699   0010
        DECR    R2                              ; 569A   0012
        GSWD    R2                              ; 569B   0032
        DECR    R4                              ; 569C   0014
L_569D:
        PSHR    R5                              ; 569D   0275

        JSR     R5,     L_603E                  ; 569E   0004 0160 003E

        TSTR    R1                              ; 56A1   0089
        BEQ     L_5761                          ; 56A2   0204 00BD

        MVII    #$02F6, R5                      ; 56A4   02BD 02F6
        ADDR    R0,     R5                      ; 56A6   00C5
        MVI@    R5,     R3                      ; 56A7   02AB
        DECR    R5                              ; 56A8   0015
        TSTR    R3                              ; 56A9   009B
        BEQ     L_5761                          ; 56AA   0204 00B5

        SWAP    R3,     1                       ; 56AC   0043
        ANDI    #$00FF, R3                      ; 56AD   03BB 00FF
        SLR     R3,     1                       ; 56AF   0063
        SDBD                                    ; 56B0   0001
        ADDI    #$56C8, R3                      ; 56B1   02FB 00C8 0056
        MVI@    R3,     R3                      ; 56B4   029B
        MVII    #$0181, R4                      ; 56B5   02BC 0181
        ADDR    R0,     R4                      ; 56B7   00C4
        ADD@    R4,     R3                      ; 56B8   02E3
        DECR    R4                              ; 56B9   0014
        MVO@    R3,     R4                      ; 56BA   0263
        SWAP    R3,     1                       ; 56BB   0043
        ANDI    #$0001, R3                      ; 56BC   03BB 0001
        SUBR    R3,     R1                      ; 56BE   0119
        MVO@    R1,     R2                      ; 56BF   0251
        TSTR    R1                              ; 56C0   0089
        BNEQ    L_56C7                          ; 56C1   020C 0004

        MVO@    R1,     R5                      ; 56C3   0269

        JSR     R5,     L_6045                  ; 56C4   0004 0160 0045

L_56C7:
        PULR    R7                              ; 56C7   02B7

        DECLE   $0001,  $0001,  $0001,  $0002   ; 56C8   0001 0001 0001 0002
        DECLE   $0004                           ; 56CC   0004

        INCR    R0                              ; 56CD   0008
        PSHR    R5                              ; 56CE   0275
        CLRR    R0                              ; 56CF   01C0

        JSR     R5,     L_56D6                  ; 56D0   0004 0154 02D6

        MVII    #$0001, R0                      ; 56D3   02B8 0001
        INCR    R7                              ; 56D5   000F

L_56D6:
        PSHR    R5                              ; 56D6   0275

L_56D7:
        JSR     R5,     L_5FF2                  ; 56D7   0004 015C 03F2

        MVI     G_01AE, R2                      ; 56DA   0282 01AE
        TSTR    R2                              ; 56DC   0092
        BEQ     L_5760                          ; 56DD   0204 0081

        PSHR    R0                              ; 56DF   0270
        MVII    #$02F6, R5                      ; 56E0   02BD 02F6
        ADDR    R0,     R5                      ; 56E2   00C5
        MVI@    R5,     R1                      ; 56E3   02A9
        SLR     R1,     2                       ; 56E4   0065
        SLR     R1,     2                       ; 56E5   0065
        MVII    #$01DD, R5                      ; 56E6   02BD 01DD
        ADDR    R0,     R5                      ; 56E8   00C5
        SUB@    R5,     R1                      ; 56E9   0329
        MVII    #$01DF, R3                      ; 56EA   02BB 01DF
        ADDR    R0,     R3                      ; 56EC   00C3
        MVI@    R3,     R2                      ; 56ED   029A
        TSTR    R1                              ; 56EE   0089
        BEQ     L_5752                          ; 56EF   0204 0061
        BMI     L_5752                          ; 56F1   020B 005F

        SLR     R1,     2                       ; 56F3   0065
        SLR     R1,     2                       ; 56F4   0065
        INCR    R1                              ; 56F5   0009
        MVO     R1,     G_01E1                  ; 56F6   0241 01E1
        ADDR    R2,     R1                      ; 56F8   00D1
        MVO@    R1,     R3                      ; 56F9   0259
        CMPI    #$003C, R1                      ; 56FA   0379 003C
        BLT     L_5758                          ; 56FC   0205 005A

        CMPI    #$0043, R1                      ; 56FE   0379 0043
        BLT     L_5704                          ; 5700   0205 0002

        MVII    #$0043, R1                      ; 5702   02B9 0043
L_5704:
        MVO@    R1,     R3                      ; 5704   0259
        MVII    #$0002, R2                      ; 5705   02BA 0002
        MVII    #$0330, R3                      ; 5707   02BB 0330
        SDBD                                    ; 5709   0001
        MVII    #$641D, R4                      ; 570A   02BC 001D 0064
        PULR    R0                              ; 570D   02B0
        PSHR    R0                              ; 570E   0270
        TSTR    R0                              ; 570F   0080
        BEQ     L_5718                          ; 5710   0204 0006

        ADDI    #$0002, R3                      ; 5712   02FB 0002
        SDBD                                    ; 5714   0001
        ADDI    #$0010, R4                      ; 5715   02FC 0010 0000

L_5718:
        JSR     R5,     L_5FB5                  ; 5718   0004 015C 03B5

        PULR    R1                              ; 571B   02B1
        MVII    #$01DF, R3                      ; 571C   02BB 01DF
        ADDR    R1,     R3                      ; 571E   00CB
        MVI@    R3,     R2                      ; 571F   029A
        CMPI    #$0043, R2                      ; 5720   037A 0043
        BNEQ    L_5760                          ; 5722   020C 003C

        CLRR    R0                              ; 5724   01C0
        MVO@    R0,     R3                      ; 5725   0258
        MVI     G_01E1, R2                      ; 5726   0282 01E1
        SLL     R2,     1                       ; 5728   004A
        NEGR    R2                              ; 5729   0022
        PSHR    R1                              ; 572A   0271

        JSR     R5,     L_6E5A                  ; 572B   0004 016C 025A

        PULR    R0                              ; 572E   02B0
        PSHR    R0                              ; 572F   0270

        JSR     R5,     L_558F                  ; 5730   0004 0154 018F

        PULR    R2                              ; 5733   02B2
        PSHR    R2                              ; 5734   0272

        JSR     R5,     L_5B0E                  ; 5735   0004 0158 030E

        PULR    R0                              ; 5738   02B0
        MVII    #$01B1, R5                      ; 5739   02BD 01B1
        ADDR    R0,     R5                      ; 573B   00C5
        MVII    #$0015, R1                      ; 573C   02B9 0015
        MVO@    R1,     R5                      ; 573E   0269
        MVII    #$0004, R0                      ; 573F   02B8 0004

        JSR     R5,     X_PLAY_SFX2             ; 5741   0004 0118 03BE
        DECLE   $00D1                           ; 5744  SFX prio
        DECLE   $03E9                           ; 5745  SFX data
        DECLE   $0380,  $006A                   ; 5746  SFX data
        DECLE   $008F,  $000E                   ; 5748  SFX data
        DECLE   $0380,  $0097                   ; 574A  SFX data
        DECLE   $008F,  $000E                   ; 574C  SFX data
        DECLE   $0023,  $03D4                   ; 574E  SFX data
        DECLE   $02CF                           ; 5750  SFX end


        PULR    R7                              ; 5751   02B7

L_5752:
        SUBI    #$0005, R2                      ; 5752   033A 0005
        BPL     L_5757                          ; 5754   0203 0001

        CLRR    R2                              ; 5756   01D2
L_5757:
        MVO@    R2,     R3                      ; 5757   025A
L_5758:
        PULR    R0                              ; 5758   02B0
        CLRR    R4                              ; 5759   01E4
L_575A:
        MVII    #$0330, R5                      ; 575A   02BD 0330
        ADDR    R0,     R5                      ; 575C   00C5
        ADDR    R0,     R5                      ; 575D   00C5
        MVO@    R4,     R5                      ; 575E   026C
        MVO@    R4,     R5                      ; 575F   026C
L_5760:
        PULR    R7                              ; 5760   02B7

L_5761:
        JSR     R5,     L_57A7                  ; 5761   0004 0154 03A7

        BNEQ    L_5785                          ; 5764   020C 001F

        JSR     R5,     L_603E                  ; 5766   0004 0160 003E

        CMPI    #$0004, R1                      ; 5769   0379 0004
        BEQ     L_5785                          ; 576B   0204 0018

        MVII    #$02F4, R5                      ; 576D   02BD 02F4
        ADDR    R0,     R5                      ; 576F   00C5
        MVI@    R5,     R3                      ; 5770   02AB
        TSTR    R3                              ; 5771   009B
        BNEQ    L_5777                          ; 5772   020C 0003

        TSTR    R1                              ; 5774   0089
        BNEQ    L_5785                          ; 5775   020C 000E

L_5777:
        INCR    R1                              ; 5777   0009
        MVO@    R1,     R2                      ; 5778   0251
        MVII    #$0181, R1                      ; 5779   02B9 0181
        ADDR    R0,     R1                      ; 577B   00C1
        CLRR    R2                              ; 577C   01D2
        MVO@    R2,     R1                      ; 577D   024A
        MOVR    R0,     R1                      ; 577E   0081
        MVII    #$0003, R2                      ; 577F   02BA 0003
        NEGR    R2                              ; 5781   0022

        JSR     R5,     L_6E5A                  ; 5782   0004 016C 025A

L_5785:
        PULR    R7                              ; 5785   02B7

L_5786:
        PSHR    R5                              ; 5786   0275
        MVI     G_01AE, R5                      ; 5787   0285 01AE
        TSTR    R5                              ; 5789   00AD
        BEQ     L_57A6                          ; 578A   0204 001A

        MVI     G_01B1, R5                      ; 578C   0285 01B1
        CMPI    #$00FE, R5                      ; 578E   037D 00FE
        BEQ     L_57A6                          ; 5790   0204 0014

        PSHR    R0                              ; 5792   0270
        MVII    #$0001, R3                      ; 5793   02BB 0001

        JSR     R5,     L_57D7                  ; 5795   0004 0154 03D7

        PULR    R1                              ; 5798   02B1
        PSHR    R1                              ; 5799   0271
        MVII    #$0002, R0                      ; 579A   02B8 0002

        JSR     R5,     L_5E9B                  ; 579C   0004 015C 029B

        PULR    R0                              ; 579F   02B0

        JSR     R5,     L_603E                  ; 57A0   0004 0160 003E

        TSTR    R1                              ; 57A3   0089
        BEQ     L_5777                          ; 57A4   0224 002E
L_57A6:
        PULR    R7                              ; 57A6   02B7

L_57A7:
        MVII    #$01B1, R1                      ; 57A7   02B9 01B1
        ADDR    R0,     R1                      ; 57A9   00C1
        MVI@    R1,     R1                      ; 57AA   0289
        CMPI    #$0009, R1                      ; 57AB   0379 0009
        BEQ     L_57B3                          ; 57AD   0204 0004

        CMPI    #$000A, R1                      ; 57AF   0379 000A
        BNEQ    L_57BE                          ; 57B1   020C 000B

L_57B3:
        PSHR    R5                              ; 57B3   0275
        MVII    #$023C, R4                      ; 57B4   02BC 023C
        TSTR    R0                              ; 57B6   0080
        BEQ     L_57BB                          ; 57B7   0204 0002

        ADDI    #$000B, R4                      ; 57B9   02FC 000B
L_57BB:
        SUBI    #$0009, R1                      ; 57BB   0339 0009
        TSTR    R1                              ; 57BD   0089
L_57BE:
        PULR    R7                              ; 57BE   02B7

L_57BF:
        PSHR    R5                              ; 57BF   0275
        MVII    #$0001, R3                      ; 57C0   02BB 0001
        NEGR    R3                              ; 57C2   0023
        INCR    R7                              ; 57C3   000F

        PSHR    R5                              ; 57C4   0275

L_57C5:
        JSR     R5,     L_57A7                  ; 57C5   0004 0154 03A7

        BEQ     L_57D6                          ; 57C8   0204 000C

        JSR     R5,     L_57D7                  ; 57CA   0004 0154 03D7

        SDBD                                    ; 57CD   0001
        MVII    #$2007, R3                      ; 57CE   02BB 0007 0020
        MVII    #$0001, R1                      ; 57D1   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 57D3   0004 0118 00C5

L_57D6:
        PULR    R7                              ; 57D6   02B7

L_57D7:
        PSHR    R5                              ; 57D7   0275
        MVII    #$0184, R1                      ; 57D8   02B9 0184
        ADDR    R0,     R1                      ; 57DA   00C1
        MVI@    R1,     R0                      ; 57DB   0288
        ADDR    R3,     R0                      ; 57DC   00D8
        BPL     L_57E0                          ; 57DD   0203 0001

        CLRR    R0                              ; 57DF   01C0
L_57E0:
        CMPI    #$0005, R0                      ; 57E0   0378 0005
        BLE     L_57E6                          ; 57E2   0206 0002

        MVII    #$0005, R0                      ; 57E4   02B8 0005
L_57E6:
        MVO@    R0,     R1                      ; 57E6   0248
        PULR    R7                              ; 57E7   02B7

L_57E8:
        PSHR    R5                              ; 57E8   0275
        MVI     G_01AE, R5                      ; 57E9   0285 01AE
        TSTR    R5                              ; 57EB   00AD
        BEQ     L_5836                          ; 57EC   0204 0048

        MVI     G_01B1, R5                      ; 57EE   0285 01B1
        CMPI    #$00FE, R5                      ; 57F0   037D 00FE
        BEQ     L_5836                          ; 57F2   0204 0042

        CLRR    R5                              ; 57F4   01ED
        MVII    #$02F6, R4                      ; 57F5   02BC 02F6
        MVO@    R5,     R4                      ; 57F7   0265
        MVO@    R5,     R4                      ; 57F8   0265
        MVII    #$01B1, R4                      ; 57F9   02BC 01B1
        MVO@    R5,     R4                      ; 57FB   0265
        MVO@    R5,     R4                      ; 57FC   0265
        PSHR    R0                              ; 57FD   0270

        JSR     R5,     L_6AE4                  ; 57FE   0004 0168 02E4

        PULR    R0                              ; 5801   02B0
        MVI     G_01AE, R1                      ; 5802   0281 01AE
        MVO     R1,     G_0146                  ; 5804   0241 0146
        DECR    R1                              ; 5806   0011
        BNEQ    L_581C                          ; 5807   020C 0013

        MVII    #$0264, R4                      ; 5809   02BC 0264
        TSTR    R0                              ; 580B   0080
        BEQ     L_5810                          ; 580C   0204 0002

        ADDI    #$000B, R4                      ; 580E   02FC 000B
L_5810:
        MVII    #$0007, R3                      ; 5810   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 5812   0004 0118 007B
        STRING  "WINNER"                        ; 5815  
        DECLE   $0000                           ; 581B   0000
L_581C:
        MVII    #$01B1, R4                      ; 581C   02BC 01B1
        MVII    #$00FE, R0                      ; 581E   02B8 00FE
        MVO@    R0,     R4                      ; 5820   0260
        MVO@    R0,     R4                      ; 5821   0260

        JSR     R5,     X_PLAY_MUS3             ; 5822   0004 0118 0395
        DECLE   $03F4,  $0190                   ; 5825  Note (long)
        DECLE   $0163                           ; 5827  Note (short)
        DECLE   $0172                           ; 5828  Note (short)
        DECLE   $03F4,  $0190                   ; 5829  Note (long)
        DECLE   $03F4,  $0128                   ; 582B  Note (long)
        DECLE   $0142                           ; 582D  Note (short)
        DECLE   $0162                           ; 582E  Note (short)
        DECLE   $0172                           ; 582F  Note (short)
        DECLE   $0192                           ; 5830  Note (short)
        DECLE   $017A                           ; 5831  Note (short)
        DECLE   $016A                           ; 5832  Note (short)
        DECLE   $03F2,  $0148                   ; 5833  Note (long)
        DECLE   $0000                           ; 5835  End of music
L_5836:
        PULR    R7                              ; 5836   02B7

        PSHR    R5                              ; 5837   0275
        CLRR    R0                              ; 5838   01C0

        JSR     R5,     L_583F                  ; 5839   0004 0158 003F

        MVII    #$0001, R0                      ; 583C   02B8 0001
        INCR    R7                              ; 583E   000F

L_583F:
        PSHR    R5                              ; 583F   0275
L_5840:
        MVII    #$01B1, R1                      ; 5840   02B9 01B1
        ADDR    R0,     R1                      ; 5842   00C1
        MVI@    R1,     R2                      ; 5843   028A
        MVII    #$0191, R3                      ; 5844   02BB 0191
        ADDR    R0,     R3                      ; 5846   00C3
        MVI@    R3,     R4                      ; 5847   029C
        CMPI    #$0014, R2                      ; 5848   037A 0014
        BEQ     L_58D4                          ; 584A   0204 0088

        CMPI    #$0015, R2                      ; 584C   037A 0015
        BEQ     L_5901                          ; 584E   0204 00B1

        CMPI    #$0002, R2                      ; 5850   037A 0002
        BLT     L_58D3                          ; 5852   0205 007F

        CMPI    #$0003, R2                      ; 5854   037A 0003
        BGT     L_58D3                          ; 5856   020E 007B

        MVO     R2,     G_0193                  ; 5858   0242 0193
        MVII    #$017B, R2                      ; 585A   02BA 017B
        ADDR    R0,     R2                      ; 585C   00C2
        MVII    #$0004, R5                      ; 585D   02BD 0004
        MVO@    R5,     R2                      ; 585F   0255
        CMPI    #$0052, R4                      ; 5860   037C 0052
        BEQ     L_590C                          ; 5862   0204 00A8

        MVII    #$023C, R5                      ; 5864   02BD 023C
        TSTR    R0                              ; 5866   0080
        BEQ     L_586B                          ; 5867   0204 0002

        ADDI    #$000B, R5                      ; 5869   02FD 000B
L_586B:
        MVII    #$0003, R2                      ; 586B   02BA 0003
        MOVR    R4,     R1                      ; 586D   00A1
        PSHR    R3                              ; 586E   0273
L_586F:
        PSHR    R0                              ; 586F   0270
        NOP                                     ; 5870   0034
        PSHR    R1                              ; 5871   0271
        PSHR    R2                              ; 5872   0272
        PSHR    R5                              ; 5873   0275

        JSR     R5,     X_DIV                   ; 5874   0004 011C 01FB

        PULR    R5                              ; 5877   02B5
        PSHR    R5                              ; 5878   0275
        TSTR    R1                              ; 5879   0089
        BNEQ    L_58C5                          ; 587A   020C 0049

        PSHR    R0                              ; 587C   0270
        MOVR    R5,     R1                      ; 587D   00A9

        JSR     R5,     L_593C                  ; 587E   0004 0158 013C

        PULR    R3                              ; 5881   02B3
        PULR    R4                              ; 5882   02B4
        PULR    R2                              ; 5883   02B2
        PULR    R1                              ; 5884   02B1
        PULR    R0                              ; 5885   02B0
        PSHR    R0                              ; 5886   0270
        PSHR    R1                              ; 5887   0271
        PSHR    R2                              ; 5888   0272
        PSHR    R4                              ; 5889   0274
        SUBI    #$0003, R2                      ; 588A   033A 0003
        MOVR    R2,     R4                      ; 588C   0094
        SLL     R2,     2                       ; 588D   004E
        SLL     R2,     1                       ; 588E   004A
        ADDR    R4,     R2                      ; 588F   00E2
        SDBD                                    ; 5890   0001
        ADDI    #$5958, R4                      ; 5891   02FC 0058 0059
        SUB@    R4,     R3                      ; 5894   0323
        BEQ     L_58B1                          ; 5895   0204 001A
        BMI     L_58B1                          ; 5897   020B 0018

        DECR    R3                              ; 5899   0013
        MVI     G_0193, R1                      ; 589A   0281 0193
        CMPI    #$0003, R1                      ; 589C   0379 0003
        BEQ     L_58A4                          ; 589E   0204 0004

        MVII    #$0008, R1                      ; 58A0   02B9 0008
        SUBR    R3,     R1                      ; 58A2   0119
        MOVR    R1,     R3                      ; 58A3   008B
L_58A4:
        ADDR    R3,     R2                      ; 58A4   00DA
        SDBD                                    ; 58A5   0001
        ADDI    #$62D9, R2                      ; 58A6   02FA 00D9 0062
        MVI@    R2,     R1                      ; 58A9   0291
        PSHR    R5                              ; 58AA   0275

        JSR     R5,     L_60E8                  ; 58AB   0004 0160 00E8

        PULR    R5                              ; 58AE   02B5
        B       L_58B4                          ; 58AF   0200 0003

L_58B1:
        MVII    #$0010, R1                      ; 58B1   02B9 0010
        SWAP    R1,     1                       ; 58B3   0041
L_58B4:
        MVO@    R1,     R5                      ; 58B4   0269
        PULR    R1                              ; 58B5   02B1
        PULR    R2                              ; 58B6   02B2
        PSHR    R2                              ; 58B7   0272
        PSHR    R1                              ; 58B8   0271
        CMPI    #$0003, R2                      ; 58B9   037A 0003
        BNEQ    L_58C5                          ; 58BB   020C 0008

        SUBI    #$0014, R1                      ; 58BD   0339 0014

        JSR     R5,     L_593C                  ; 58BF   0004 0158 013C

        MVI     .BTAB.00,R1                     ; 58C2   0281 0200
        MVO@    R1,     R5                      ; 58C4   0269
L_58C5:
        PULR    R5                              ; 58C5   02B5
        ADDI    #$0014, R5                      ; 58C6   02FD 0014
        PULR    R2                              ; 58C8   02B2
        PULR    R1                              ; 58C9   02B1
        PULR    R0                              ; 58CA   02B0
        INCR    R2                              ; 58CB   000A
        CMPI    #$000A, R2                      ; 58CC   037A 000A
        BNEQ    L_586F                          ; 58CE   022C 0060

        PULR    R3                              ; 58D0   02B3
        INCR    R1                              ; 58D1   0009
        MVO@    R1,     R3                      ; 58D2   0259
L_58D3:
        PULR    R7                              ; 58D3   02B7

L_58D4:
        CMPI    #$0064, R4                      ; 58D4   037C 0064
        BEQ     L_590C                          ; 58D6   0204 0034

        INCR    R4                              ; 58D8   000C
        MVO@    R4,     R3                      ; 58D9   025C
        CMPI    #$000E, R4                      ; 58DA   037C 000E
        BGE     L_58D3                          ; 58DC   022D 000A

        ADDR    R4,     R4                      ; 58DE   00E4
        SDBD                                    ; 58DF   0001
        ADDI    #$595E, R4                      ; 58E0   02FC 005E 0059
        MVII    #$0002, R5                      ; 58E3   02BD 0002
L_58E5:
        MVI@    R4,     R1                      ; 58E5   02A1
        MVII    #$0078, R2                      ; 58E6   02BA 0078
        SARC    R1,     1                       ; 58E8   0079
        BNC     L_58ED                          ; 58E9   0209 0002

        MVII    #$01E0, R2                      ; 58EB   02BA 01E0
L_58ED:
        TSTR    R0                              ; 58ED   0080
        BEQ     L_58F2                          ; 58EE   0204 0002

        ADDI    #$000B, R1                      ; 58F0   02F9 000B
L_58F2:
        ADDI    #$0200, R1                      ; 58F2   02F9 0200
        MVI@    R1,     R3                      ; 58F4   028B
        SDBD                                    ; 58F5   0001
        ANDI    #$3600, R3                      ; 58F6   03BB 0000 0036
        XORI    #$0007, R3                      ; 58F9   03FB 0007
        XORR    R3,     R2                      ; 58FB   01DA
        MVO@    R2,     R1                      ; 58FC   024A
        DECR    R5                              ; 58FD   0015
        BNEQ    L_58E5                          ; 58FE   022C 001A
L_5900:
        PULR    R7                              ; 5900   02B7

L_5901:
        INCR    R4                              ; 5901   000C
        MVO@    R4,     R3                      ; 5902   025C
        CMPI    #$0052, R4                      ; 5903   037C 0052
        BNEQ    L_5900                          ; 5905   022C 0006

        CLRR    R4                              ; 5907   01E4
        MVO@    R4,     R1                      ; 5908   024C
        MVO@    R4,     R3                      ; 5909   025C
        B       L_575A                          ; 590A   0220 01B1

L_590C:
        CLRR    R4                              ; 590C   01E4
        MVO@    R4,     R1                      ; 590D   024C
        MVO@    R4,     R3                      ; 590E   025C
L_590F:
        MVII    #$017F, R2                      ; 590F   02BA 017F
        ADDR    R0,     R2                      ; 5911   00C2

        JSR     R5,     L_54F2                  ; 5912   0004 0154 00F2

        DECR    R4                              ; 5915   0014
        MOVR    R4,     R1                      ; 5916   00A1
        MVI@    R1,     R4                      ; 5917   028C

        JSR     R5,     L_539F                  ; 5918   0004 0150 039F

        MVII    #$018F, R2                      ; 591B   02BA 018F
        ADDR    R0,     R2                      ; 591D   00C2
        MVO@    R1,     R2                      ; 591E   0251
        MVII    #$017D, R2                      ; 591F   02BA 017D
        ADDR    R0,     R2                      ; 5921   00C2
        MVII    #$00FF, R1                      ; 5922   02B9 00FF
        MVO@    R1,     R2                      ; 5924   0251
        MVII    #$017B, R2                      ; 5925   02BA 017B
        ADDR    R0,     R2                      ; 5927   00C2
        MVO@    R1,     R2                      ; 5928   0251
        PSHR    R0                              ; 5929   0270

        JSR     R5,     L_52DC                  ; 592A   0004 0150 02DC

        PULR    R0                              ; 592D   02B0
        MVII    #$0334, R1                      ; 592E   02B9 0334
        ADDR    R0,     R1                      ; 5930   00C1
        MVII    #$0150, R5                      ; 5931   02BD 0150
        MVO@    R5,     R1                      ; 5933   024D
        PSHR    R0                              ; 5934   0270

        JSR     R5,     L_61D7                  ; 5935   0004 0160 01D7

        PULR    R0                              ; 5938   02B0
        J       L_5B3A                          ; 5939   0004 0358 033A

L_593C:
        PSHR    R5                              ; 593C   0275
        MVII    #$0008, R2                      ; 593D   02BA 0008
        MOVR    R1,     R5                      ; 593F   008D
        MOVR    R1,     R4                      ; 5940   008C
        MVI     G_0193, R3                      ; 5941   0283 0193
        CMPI    #$0003, R3                      ; 5943   037B 0003
        BEQ     L_5951                          ; 5945   0204 000A

        MVI@    R5,     R3                      ; 5947   02AB
L_5948:
        MVI@    R5,     R1                      ; 5948   02A9
        DECR    R5                              ; 5949   0015
        MVO@    R3,     R5                      ; 594A   026B
        MOVR    R1,     R3                      ; 594B   008B
        DECR    R2                              ; 594C   0012
        BNEQ    L_5948                          ; 594D   022C 0006

        MOVR    R4,     R5                      ; 594F   00A5
        PULR    R7                              ; 5950   02B7

L_5951:
        INCR    R4                              ; 5951   000C
L_5952:
        MVI@    R4,     R1                      ; 5952   02A1
        MVO@    R1,     R5                      ; 5953   0269
        DECR    R2                              ; 5954   0012
        BNEQ    L_5952                          ; 5955   022C 0004
        PULR    R7                              ; 5957   02B7

        DECLE   $0012,  $000B,  $0007,  $0004   ; 5958   0012 000B 0007 0004
        DECLE   $0002,  $0001,  $0000           ; 595C   0002 0001 0000

        RLC     R1,     2                       ; 595F   0055
        SLLC    R2,     1                       ; 5960   005A
        SLLC    R1,     2                       ; 5961   005D
        SARC    R0,     2                       ; 5962   007C
        SARC    R3,     2                       ; 5963   007F
        TSTR    R0                              ; 5964   0080
        MOVR    R0,     R7                      ; 5965   0087

        MOVR    R4,     R2                      ; 5966   00A2
        MOVR    R5,     R1                      ; 5967   00A9
        MOVR    R5,     R6                      ; 5968   00AE
        MOVR    R6,     R1                      ; 5969   00B1
        ADDR    R1,     R0                      ; 596A   00C8
        ADDR    R1,     R3                      ; 596B   00CB
        ADDR    R2,     R3                      ; 596C   00D3
        ADDR    R2,     R4                      ; 596D   00D4
        ADDR    R6,     R5                      ; 596E   00F5
        ADDR    R7,     R2                      ; 596F   00FA
        ADDR    R7,     R5                      ; 5970   00FD
        SUBR    R3,     R4                      ; 5971   011C
        SUBR    R3,     R7                      ; 5972   011F

        SUBR    R4,     R0                      ; 5973   0120
        SUBR    R4,     R7                      ; 5974   0127

        DECLE   $0142,  $0149,  $0151,  $0168   ; 5975   0142 0149 0151 0168
        DECLE   $0173,  $0022,  $006F,  $0020   ; 5979   0173 0022 006F 0020
        DECLE   $006F,  $0016,  $0046,  $001C   ; 597D   006F 0016 0046 001C
        DECLE   $006F,  $0012,  $0046,  $0018   ; 5981   006F 0012 0046 0018
        DECLE   $006F,  $0016,  $006F,  $0004   ; 5985   006F 0016 006F 0004
        DECLE   $0032,  $0012,  $006F,  $0007   ; 5989   0032 0012 006F 0007
        DECLE   $0000,  $0067,  $0014,  $0036   ; 598D   0000 0067 0014 0036
        DECLE   $0141,  $0076,  $0000,  $0007   ; 5991   0141 0076 0000 0007
        DECLE   $0000,  $0077,  $0014,  $0066   ; 5995   0000 0077 0014 0066
        DECLE   $0111,  $0066,  $0000,  $0007   ; 5999   0111 0066 0000 0007
        DECLE   $0000,  $0077,  $0044,  $0066   ; 599D   0000 0077 0044 0066
        DECLE   $0111,  $0066,  $0000           ; 59A1   0111 0066 0000
L_59A4:
        PULR    R1                              ; 59A4   02B1
        PULR    R2                              ; 59A5   02B2
        PSHR    R2                              ; 59A6   0272
        PSHR    R1                              ; 59A7   0271
        PSHR    R5                              ; 59A8   0275
        PSHR    R3                              ; 59A9   0273

        JSR     R5,     L_5B4C                  ; 59AA   0004 0158 034C

        CMPI    #$00FF, R3                      ; 59AD   037B 00FF
        BEQ     L_59F8                          ; 59AF   0204 0047

        MVI     G_02F1, R2                      ; 59B1   0282 02F1
        MVII    #$01B1, R5                      ; 59B3   02BD 01B1
        CMPI    #$000B, R3                      ; 59B5   037B 000B
        BLT     L_59BC                          ; 59B7   0205 0003

        MVI     G_02F2, R2                      ; 59B9   0282 02F2
        INCR    R5                              ; 59BB   000D
L_59BC:
        MVI@    R5,     R4                      ; 59BC   02AC
        TSTR    R4                              ; 59BD   00A4
        BNEQ    L_59F6                          ; 59BE   020C 0036

        MVO     R2,     G_02F3                  ; 59C0   0242 02F3
        MOVR    R1,     R5                      ; 59C2   008D
        MVI@    R5,     R1                      ; 59C3   02A9
        MVI@    R5,     R2                      ; 59C4   02AA
        MVI@    R5,     R4                      ; 59C5   02AC
        ADDR    R3,     R4                      ; 59C6   00DC
        MVI@    R5,     R3                      ; 59C7   02AB
L_59C8:
        PSHR    R1                              ; 59C8   0271
        PSHR    R4                              ; 59C9   0274
        PSHR    R2                              ; 59CA   0272
L_59CB:
        MVI@    R5,     R3                      ; 59CB   02AB
        CMPI    #$0010, R3                      ; 59CC   037B 0010
        BNEQ    L_59D3                          ; 59CE   020C 0003

        INCR    R4                              ; 59D0   000C
        B       L_59EB                          ; 59D1   0200 0018

L_59D3:
        PSHR    R4                              ; 59D3   0274
        MOVR    R3,     R4                      ; 59D4   009C
        ANDI    #$000F, R4                      ; 59D5   03BC 000F
        ANDI    #$03F0, R3                      ; 59D7   03BB 03F0
        SLR     R3,     1                       ; 59D9   0063
        ADDR    R4,     R4                      ; 59DA   00E4
        SDBD                                    ; 59DB   0001
        ADDI    #$5D48, R4                      ; 59DC   02FC 0048 005D
        SDBD                                    ; 59DF   0001
        MVI@    R4,     R1                      ; 59E0   02A1
        PULR    R4                              ; 59E1   02B4
        SLLC    R1,     1                       ; 59E2   0059
        SLR     R1,     1                       ; 59E3   0061
        BNC     L_59E7                          ; 59E4   0209 0001

        XORR    R0,     R1                      ; 59E6   01C1
L_59E7:
        XORR    R1,     R3                      ; 59E7   01CB
        XOR     G_02F3, R3                      ; 59E8   03C3 02F3
        MVO@    R3,     R4                      ; 59EA   0263
L_59EB:
        DECR    R2                              ; 59EB   0012
        BNEQ    L_59CB                          ; 59EC   022C 0022

        PULR    R2                              ; 59EE   02B2
        PULR    R4                              ; 59EF   02B4
        ADDI    #$0014, R4                      ; 59F0   02FC 0014
        PULR    R1                              ; 59F2   02B1
        DECR    R1                              ; 59F3   0011
        BNEQ    L_59C8                          ; 59F4   022C 002D

L_59F6:
        MVI     G_01A3, R3                      ; 59F6   0283 01A3
L_59F8:
        PULR    R2                              ; 59F8   02B2
        PSHR    R2                              ; 59F9   0272
        PSHR    R3                              ; 59FA   0273

        JSR     R5,     L_5B0E                  ; 59FB   0004 0158 030E

        PULR    R3                              ; 59FE   02B3
        PULR    R2                              ; 59FF   02B2
        MVII    #$01A5, R1                      ; 5A00   02B9 01A5
        ADDR    R2,     R1                      ; 5A02   00D1
        MVO@    R3,     R1                      ; 5A03   024B
        ADDI    #$02F1, R2                      ; 5A04   02FA 02F1
        MVI@    R2,     R3                      ; 5A06   0293
        SDBD                                    ; 5A07   0001
        XORI    #$C000, R3                      ; 5A08   03FB 0000 00C0
        MVO@    R3,     R2                      ; 5A0B   0253
        PULR    R7                              ; 5A0C   02B7

L_5A0D:
        PSHR    R5                              ; 5A0D   0275
        MVI     G_019E, R3                      ; 5A0E   0283 019E
        MVII    #$017F, R5                      ; 5A10   02BD 017F
        MVI@    R5,     R1                      ; 5A12   02A9
        CMP@    R5,     R1                      ; 5A13   0369
        BEQ     L_5A6B                          ; 5A14   0204 0055

L_5A16:
        SARC    R3,     1                       ; 5A16   007B
        BNC     L_5A3B                          ; 5A17   0209 0022

        MVII    #$0197, R5                      ; 5A19   02BD 0197
        MVII    #$01A0, R4                      ; 5A1B   02BC 01A0
        SARC    R3,     1                       ; 5A1D   007B
        BNC     L_5A29                          ; 5A1E   0209 0009

        ADDI    #$0005, R5                      ; 5A20   02FD 0005
        INCR    R4                              ; 5A22   000C
        SDBD                                    ; 5A23   0001
        MVI@    R5,     R1                      ; 5A24   02A9
        SUBI    #$0004, R5                      ; 5A25   033D 0004
        B       L_5A2D                          ; 5A27   0200 0004

L_5A29:
        SDBD                                    ; 5A29   0001
        MVI@    R5,     R1                      ; 5A2A   02A9
        ADDI    #$0003, R5                      ; 5A2B   02FD 0003
L_5A2D:
        XOR@    R4,     R3                      ; 5A2D   03E3
        MVO     R3,     G_01A2                  ; 5A2E   0243 01A2
        SDBD                                    ; 5A30   0001
        SUB@    R5,     R1                      ; 5A31   0329
        MOVR    R1,     R2                      ; 5A32   008A
        BPL     L_5A36                          ; 5A33   0203 0001

        NEGR    R1                              ; 5A35   0021
L_5A36:
        SLR     R1,     1                       ; 5A36   0061
        CMPI    #$00FF, R1                      ; 5A37   0379 00FF
        BLE     L_5A85                          ; 5A39   0206 004A

L_5A3B:
        MVI     G_019E, R3                      ; 5A3B   0283 019E
        ANDI    #$00FE, R3                      ; 5A3D   03BB 00FE
        XORI    #$0005, R3                      ; 5A3F   03FB 0005
        PSHR    R3                              ; 5A41   0273
        MVII    #$019C, R5                      ; 5A42   02BD 019C
        MVII    #$0197, R4                      ; 5A44   02BC 0197
        MVII    #$01A0, R2                      ; 5A46   02BA 01A0
        SARC    R3,     2                       ; 5A48   007F
        BNOV    L_5A4E                          ; 5A49   020A 0003

        ADDI    #$0003, R4                      ; 5A4B   02FC 0003
        INCR    R2                              ; 5A4D   000A
L_5A4E:
        PULR    R3                              ; 5A4E   02B3
        SDBD                                    ; 5A4F   0001
        MVI@    R4,     R1                      ; 5A50   02A1
        MVI@    R2,     R2                      ; 5A51   0292
        TSTR    R2                              ; 5A52   0092
        BEQ     L_5A5B                          ; 5A53   0204 0006

        SUBI    #$01FC, R1                      ; 5A55   0339 01FC
        BMI     L_5B07                          ; 5A57   020B 00AE
        B       L_5A5D                          ; 5A59   0200 0002

L_5A5B:
        ADDI    #$01FC, R1                      ; 5A5B   02F9 01FC
L_5A5D:
        MVO@    R1,     R5                      ; 5A5D   0269
        SWAP    R1,     1                       ; 5A5E   0041
        MVO@    R1,     R5                      ; 5A5F   0269
        MVO     R3,     G_019E                  ; 5A60   0243 019E
        MVII    #$0006, R0                      ; 5A62   02B8 0006

        JSR     R5,     X_RAND2                 ; 5A64   0004 0114 029E

        MVO     R0,     G_019F                  ; 5A67   0240 019F
        B       L_5B07                          ; 5A69   0200 009C

L_5A6B:
        MVII    #$0197, R5                      ; 5A6B   02BD 0197
        SDBD                                    ; 5A6D   0001
        MVI@    R5,     R1                      ; 5A6E   02A9
        INCR    R5                              ; 5A6F   000D
        SDBD                                    ; 5A70   0001
        SUB@    R5,     R1                      ; 5A71   0329
        MOVR    R1,     R2                      ; 5A72   008A
        BPL     L_5A76                          ; 5A73   0203 0001

        NEGR    R1                              ; 5A75   0021
L_5A76:
        SLR     R1,     1                       ; 5A76   0061
        CMPI    #$00FF, R1                      ; 5A77   0379 00FF
        BGT     L_5A16                          ; 5A79   022E 0064

        ANDI    #$00FE, R3                      ; 5A7B   03BB 00FE
        MVO     R3,     G_019E                  ; 5A7D   0243 019E
        MVI     G_01A0, R3                      ; 5A7F   0283 01A0
        XOR     G_01A1, R3                      ; 5A81   03C3 01A1
        MVO     R3,     G_01A2                  ; 5A83   0243 01A2

L_5A85:
        JSR     R5,     L_5FDC                  ; 5A85   0004 015C 03DC

        MVO     R1,     G_01A3                  ; 5A88   0241 01A3
        MVII    #$0001, R4                      ; 5A8A   02BC 0001

        JSR     R5,     L_5BDB                  ; 5A8C   0004 0158 03DB

        CLRR    R4                              ; 5A8F   01E4

        JSR     R5,     L_5BDB                  ; 5A90   0004 0158 03DB

        PSHR    R2                              ; 5A93   0272
        PSHR    R1                              ; 5A94   0271

        JSR     R5,     L_5C56                  ; 5A95   0004 015C 0056

        CLRR    R3                              ; 5A98   01DB

        JSR     R5,     L_59A4                  ; 5A99   0004 0158 01A4

        MVII    #$0001, R3                      ; 5A9C   02BB 0001

        JSR     R5,     L_59A4                  ; 5A9E   0004 0158 01A4

        MVI     G_01A9, R1                      ; 5AA1   0281 01A9
        MVO     R1,     G_01A7                  ; 5AA3   0241 01A7
        MVI     G_01AA, R1                      ; 5AA5   0281 01AA
        MVO     R1,     G_01A8                  ; 5AA7   0241 01A8
        MVI     G_019E, R1                      ; 5AA9   0281 019E
        SARC    R1,     1                       ; 5AAB   0079
        BC      L_5AB3                          ; 5AAC   0201 0005

        MVI     G_01A2, R1                      ; 5AAE   0281 01A2
        TSTR    R1                              ; 5AB0   0089
        BEQ     L_5ABC                          ; 5AB1   0204 0009

L_5AB3:
        CLRR    R0                              ; 5AB3   01C0

        JSR     R5,     L_6A8D                  ; 5AB4   0004 0168 028D

        MVII    #$0001, R0                      ; 5AB7   02B8 0001

        JSR     R5,     L_6A8D                  ; 5AB9   0004 0168 028D

L_5ABC:
        PULR    R1                              ; 5ABC   02B1
        PULR    R2                              ; 5ABD   02B2
        MVI     G_01A3, R0                      ; 5ABE   0280 01A3
        TSTR    R0                              ; 5AC0   0080
        BEQ     L_5AC7                          ; 5AC1   0204 0004

        CLRR    R0                              ; 5AC3   01C0
        MVO     R0,     G_01DC                  ; 5AC4   0240 01DC
        PULR    R7                              ; 5AC6   02B7

L_5AC7:
        MVI     G_01DC, R0                      ; 5AC7   0280 01DC
        TSTR    R0                              ; 5AC9   0080
        BNEQ    L_5B06                          ; 5ACA   020C 003A

        MVI     G_019E, R0                      ; 5ACC   0280 019E
        SARC    R0,     1                       ; 5ACE   0078
        BNC     L_5AE4                          ; 5ACF   0209 0013

        ANDI    #$0001, R0                      ; 5AD1   03B8 0001
        MOVR    R0,     R4                      ; 5AD3   0084

        JSR     R5,     L_5C25                  ; 5AD4   0004 015C 0025

        CLRR    R1                              ; 5AD7   01C9

        JSR     R5,     L_5C16                  ; 5AD8   0004 015C 0016

        SUB     G_01A7, R5                      ; 5ADB   0305 01A7
        MOVR    R5,     R1                      ; 5ADD   00A9

        JSR     R5,     L_5B44                  ; 5ADE   0004 0158 0344

        BMI     L_5AFF                          ; 5AE1   020B 001C
        PULR    R7                              ; 5AE3   02B7

L_5AE4:
        MVI     G_01A7, R0                      ; 5AE4   0280 01A7
        MVI     G_01A8, R1                      ; 5AE6   0281 01A8
        SUBI    #$000B, R1                      ; 5AE8   0339 000B
        MVI     G_01A2, R5                      ; 5AEA   0285 01A2
        TSTR    R5                              ; 5AEC   00AD
        BEQ     L_5AF3                          ; 5AED   0204 0004

        MVII    #$0008, R5                      ; 5AEF   02BD 0008
        SUBR    R0,     R5                      ; 5AF1   0105
        MOVR    R5,     R0                      ; 5AF2   00A8
L_5AF3:
        SUBR    R0,     R1                      ; 5AF3   0101

        JSR     R5,     L_5B44                  ; 5AF4   0004 0158 0344

        BPL     L_5B06                          ; 5AF7   0203 000D

        CLRR    R0                              ; 5AF9   01C0

        JSR     R5,     L_55C0                  ; 5AFA   0004 0154 01C0

        MVII    #$0001, R0                      ; 5AFD   02B8 0001

L_5AFF:
        JSR     R5,     L_55C0                  ; 5AFF   0004 0154 01C0

        MVII    #$0001, R0                      ; 5B02   02B8 0001
        MVO     R0,     G_01DC                  ; 5B04   0240 01DC
L_5B06:
        PULR    R7                              ; 5B06   02B7

L_5B07:
        CLRR    R2                              ; 5B07   01D2

        JSR     R5,     L_5B0E                  ; 5B08   0004 0158 030E

        MVII    #$0001, R2                      ; 5B0B   02BA 0001
        INCR    R7                              ; 5B0D   000F

L_5B0E:
        PSHR    R5                              ; 5B0E   0275
L_5B0F:
        MOVR    R2,     R0                      ; 5B0F   0090

        JSR     R5,     L_5FF2                  ; 5B10   0004 015C 03F2

        ADDI    #$01A5, R2                      ; 5B13   02FA 01A5
        MVI@    R2,     R2                      ; 5B15   0292
        CMPI    #$0007, R2                      ; 5B16   037A 0007
        BGT     L_5B43                          ; 5B18   020E 0029

        SDBD                                    ; 5B1A   0001
        MVII    #$5D28, R5                      ; 5B1B   02BD 0028 005D
        ADDR    R2,     R5                      ; 5B1E   00D5
        ADDR    R2,     R5                      ; 5B1F   00D5
        SDBD                                    ; 5B20   0001
        MVI@    R5,     R1                      ; 5B21   02A9
        MVII    #$02F1, R2                      ; 5B22   02BA 02F1
        ADDR    R0,     R2                      ; 5B24   00C2
        MVI@    R2,     R2                      ; 5B25   0292
        MVII    #$01A7, R5                      ; 5B26   02BD 01A7
        ADDR    R0,     R5                      ; 5B28   00C5
        MVI@    R5,     R4                      ; 5B29   02AC
        TSTR    R0                              ; 5B2A   0080
        BEQ     L_5B2F                          ; 5B2B   0204 0002

        SUBI    #$000B, R4                      ; 5B2D   033C 000B
L_5B2F:
        PSHR    R0                              ; 5B2F   0270

        JSR     R5,     L_6091                  ; 5B30   0004 0160 0091

        PULR    R0                              ; 5B33   02B0
        MVII    #$01A5, R5                      ; 5B34   02BD 01A5
        ADDR    R0,     R5                      ; 5B36   00C5
        MVII    #$00FF, R2                      ; 5B37   02BA 00FF
        MVO@    R2,     R5                      ; 5B39   026A
L_5B3A:
        MVII    #$0003, R2                      ; 5B3A   02BA 0003
        MVII    #$018D, R4                      ; 5B3C   02BC 018D
        ADDR    R0,     R4                      ; 5B3E   00C4
        MVO@    R2,     R4                      ; 5B3F   0262

        JSR     R5,     L_53D6                  ; 5B40   0004 0150 03D6

L_5B43:
        PULR    R7                              ; 5B43   02B7

L_5B44:
        PSHR    R5                              ; 5B44   0275
        TSTR    R1                              ; 5B45   0089
        BPL     L_5B49                          ; 5B46   0203 0001

        NEGR    R1                              ; 5B48   0021
L_5B49:
        SUBI    #$0003, R1                      ; 5B49   0339 0003
        PULR    R7                              ; 5B4B   02B7

L_5B4C:
        PSHR    R5                              ; 5B4C   0275
        MVI     G_019E, R0                      ; 5B4D   0280 019E
        SARC    R0,     1                       ; 5B4F   0078
        BNC     L_5B62                          ; 5B50   0209 0010

        ANDI    #$0001, R0                      ; 5B52   03B8 0001
        XORR    R3,     R0                      ; 5B54   01D8
        BNEQ    L_5BD3                          ; 5B55   020C 007C

        MVII    #$0024, R0                      ; 5B57   02B8 0024
        SWAP    R0,     1                       ; 5B59   0040
        PSHR    R0                              ; 5B5A   0270
        MVI     G_019E, R0                      ; 5B5B   0280 019E
        SARC    R0,     2                       ; 5B5D   007C
        BOV     L_5B6D                          ; 5B5E   0202 000D
        B       L_5B6B                          ; 5B60   0200 0009

L_5B62:
        MVII    #$0010, R0                      ; 5B62   02B8 0010
        TSTR    R3                              ; 5B64   009B
        BNEQ    L_5B69                          ; 5B65   020C 0002

        MVII    #$0014, R0                      ; 5B67   02B8 0014
L_5B69:
        SWAP    R0,     1                       ; 5B69   0040
        PSHR    R0                              ; 5B6A   0270
L_5B6B:
        MVI     G_01A0, R0                      ; 5B6B   0280 01A0
L_5B6D:
        MVI     G_01A2, R5                      ; 5B6D   0285 01A2
        TSTR    R5                              ; 5B6F   00AD
        BNEQ    L_5B94                          ; 5B70   020C 0022

        TSTR    R1                              ; 5B72   0089
        BEQ     L_5B7D                          ; 5B73   0204 0008

        TSTR    R2                              ; 5B75   0092
        BMI     L_5B7A                          ; 5B76   020B 0002

        XORI    #$0001, R0                      ; 5B78   03F8 0001
L_5B7A:
        XORR    R3,     R0                      ; 5B7A   01D8
        BNEQ    L_5BA1                          ; 5B7B   020C 0024

L_5B7D:
        MOVR    R3,     R0                      ; 5B7D   0098
        CLRR    R2                              ; 5B7E   01D2
        PSHR    R3                              ; 5B7F   0273
        PSHR    R1                              ; 5B80   0271

        JSR     R5,     L_60C8                  ; 5B81   0004 0160 00C8

        PULR    R1                              ; 5B84   02B1
        PULR    R3                              ; 5B85   02B3
        MVII    #$01A9, R4                      ; 5B86   02BC 01A9
        ADDR    R3,     R4                      ; 5B88   00DC
        MVI@    R4,     R3                      ; 5B89   02A3
        SDBD                                    ; 5B8A   0001
        MVII    #$5D28, R5                      ; 5B8B   02BD 0028 005D
        ADDR    R1,     R5                      ; 5B8E   00CD
        ADDR    R1,     R5                      ; 5B8F   00CD
        SDBD                                    ; 5B90   0001
        MVI@    R5,     R1                      ; 5B91   02A9
        PULR    R0                              ; 5B92   02B0
        PULR    R7                              ; 5B93   02B7

L_5B94:
        TSTR    R1                              ; 5B94   0089
        BEQ     L_5BA1                          ; 5B95   0204 000A

        ADDI    #$0008, R1                      ; 5B97   02F9 0008
        TSTR    R2                              ; 5B99   0092
        BMI     L_5B9E                          ; 5B9A   020B 0002

        XORI    #$0001, R0                      ; 5B9C   03F8 0001
L_5B9E:
        TSTR    R0                              ; 5B9E   0080
        BEQ     L_5B7D                          ; 5B9F   0224 0023

L_5BA1:
        PULR    R0                              ; 5BA1   02B0
        MVI     G_019E, R2                      ; 5BA2   0282 019E
        SARC    R2,     1                       ; 5BA4   007A
        BNC     L_5BAA                          ; 5BA5   0209 0003

        ANDI    #$0001, R2                      ; 5BA7   03BA 0001
        MOVR    R2,     R3                      ; 5BA9   0093
L_5BAA:
        MOVR    R3,     R1                      ; 5BAA   0099
        ADDI    #$01A9, R1                      ; 5BAB   02F9 01A9
        MVI@    R1,     R1                      ; 5BAD   0289
        MVII    #$0203, R5                      ; 5BAE   02BD 0203
        TSTR    R3                              ; 5BB0   009B
        BEQ     L_5BB7                          ; 5BB1   0204 0004

        ADDI    #$000B, R5                      ; 5BB3   02FD 000B
        SUBI    #$000B, R1                      ; 5BB5   0339 000B
L_5BB7:
        SLR     R1,     1                       ; 5BB7   0061
        CMPI    #$0002, R1                      ; 5BB8   0379 0002
        BLE     L_5BBE                          ; 5BBA   0206 0002

        MVII    #$0002, R1                      ; 5BBC   02B9 0002
L_5BBE:
        MOVR    R3,     R2                      ; 5BBE   009A
        ADDI    #$01AB, R2                      ; 5BBF   02FA 01AB
        CMP@    R2,     R1                      ; 5BC1   0351
        MVO@    R1,     R2                      ; 5BC2   0251
        BNEQ    L_5BD3                          ; 5BC3   020C 000E

        ADDR    R1,     R5                      ; 5BC5   00CD
        SDBD                                    ; 5BC6   0001
        MVII    #$C8A8, R3                      ; 5BC7   02BB 00A8 00C8
        MVI     G_01A2, R1                      ; 5BCA   0281 01A2
        SLL     R1,     2                       ; 5BCC   004D
        SLL     R1,     1                       ; 5BCD   0049
        SUBR    R1,     R3                      ; 5BCE   010B
        XORR    R0,     R3                      ; 5BCF   01C3
        MVO@    R3,     R5                      ; 5BD0   026B
        B       L_5BD8                          ; 5BD1   0200 0005

L_5BD3:
        MOVR    R3,     R0                      ; 5BD3   0098
        CLRR    R2                              ; 5BD4   01D2

        JSR     R5,     L_60C8                  ; 5BD5   0004 0160 00C8

L_5BD8:
        MVII    #$00FF, R3                      ; 5BD8   02BB 00FF
        PULR    R7                              ; 5BDA   02B7

L_5BDB:
        PSHR    R5                              ; 5BDB   0275
        PSHR    R1                              ; 5BDC   0271
        MVI     G_019E, R3                      ; 5BDD   0283 019E
        SARC    R3,     1                       ; 5BDF   007B
        BNC     L_5BFA                          ; 5BE0   0209 0018

        MVI     G_019F, R3                      ; 5BE2   0283 019F
        SLL     R3,     2                       ; 5BE4   004F
        SDBD                                    ; 5BE5   0001
        ADDI    #$5C3E, R3                      ; 5BE6   02FB 003E 005C
        MOVR    R1,     R5                      ; 5BE9   008D
        MOVR    R1,     R0                      ; 5BEA   0088
        SLR     R0,     1                       ; 5BEB   0060
        ADDR    R0,     R3                      ; 5BEC   00C3
        MVI@    R3,     R3                      ; 5BED   029B
        MOVR    R3,     R0                      ; 5BEE   0098
        ANDI    #$000F, R0                      ; 5BEF   03B8 000F
        SLR     R3,     2                       ; 5BF1   0067
        SLR     R3,     2                       ; 5BF2   0067
        ANDI    #$0001, R5                      ; 5BF3   03BD 0001
        BEQ     L_5BFF                          ; 5BF5   0204 0008

        MOVR    R0,     R3                      ; 5BF7   0083
        B       L_5BFF                          ; 5BF8   0200 0005

L_5BFA:
        JSR     R5,     L_5C25                  ; 5BFA   0004 015C 0025

        XORI    #$0001, R4                      ; 5BFD   03FC 0001
L_5BFF:
        MVI     G_01A2, R5                      ; 5BFF   0285 01A2
        TSTR    R5                              ; 5C01   00AD
        BEQ     L_5C08                          ; 5C02   0204 0004

        MVII    #$0008, R5                      ; 5C04   02BD 0008
        SUBR    R3,     R5                      ; 5C06   011D
        MOVR    R5,     R3                      ; 5C07   00AB

L_5C08:
        JSR     R5,     L_5C16                  ; 5C08   0004 015C 0016

        MVII    #$01A9, R1                      ; 5C0B   02B9 01A9
        ADDR    R4,     R1                      ; 5C0D   00E1
        TSTR    R4                              ; 5C0E   00A4
        BEQ     L_5C13                          ; 5C0F   0204 0002

        ADDI    #$000B, R5                      ; 5C11   02FD 000B
L_5C13:
        MVO@    R5,     R1                      ; 5C13   024D
        PULR    R1                              ; 5C14   02B1
        PULR    R7                              ; 5C15   02B7

L_5C16:
        PSHR    R5                              ; 5C16   0275
        SDBD                                    ; 5C17   0001
        ADDI    #$5C36, R1                      ; 5C18   02F9 0036 005C
        MVI@    R1,     R1                      ; 5C1B   0289
        CLRR    R5                              ; 5C1C   01ED
L_5C1D:
        SARC    R1,     1                       ; 5C1D   0079
        BNC     L_5C21                          ; 5C1E   0209 0001

        INCR    R5                              ; 5C20   000D
L_5C21:
        DECR    R3                              ; 5C21   0013
        BPL     L_5C1D                          ; 5C22   0223 0006
        PULR    R7                              ; 5C24   02B7

L_5C25:
        PSHR    R5                              ; 5C25   0275
        MVII    #$032C, R3                      ; 5C26   02BB 032C
        ADDR    R4,     R3                      ; 5C28   00E3
        MVI@    R3,     R3                      ; 5C29   029B
        ANDI    #$00FF, R3                      ; 5C2A   03BB 00FF
        TSTR    R4                              ; 5C2C   00A4
        BEQ     L_5C31                          ; 5C2D   0204 0002

        SUBI    #$0058, R3                      ; 5C2F   033B 0058
L_5C31:
        ADDI    #$0003, R3                      ; 5C31   02FB 0003
        SLR     R3,     2                       ; 5C33   0067
        SLR     R3,     1                       ; 5C34   0063
        PULR    R7                              ; 5C35   02B7

        DECLE   $01DE,  $016C,  $016C,  $0154   ; 5C36   01DE 016C 016C 0154
        DECLE   $00A8,  $00A8,  $0090,  $0090   ; 5C3A   00A8 00A8 0090 0090
        DECLE   $0022,  $0022,  $0022,  $0022   ; 5C3E   0022 0022 0022 0022
        DECLE   $0066,  $0066,  $0066,  $0066   ; 5C42   0066 0066 0066 0066
        DECLE   $0001,  $0024,  $0065,  $0066   ; 5C46   0001 0024 0065 0066
        DECLE   $0024,  $0068,  $0035,  $0033   ; 5C4A   0024 0068 0035 0033
        DECLE   $0001                           ; 5C4E   0001

        NEGR    R4                              ; 5C4F   0024
        SLR     R0,     2                       ; 5C50   0064
        GSWD    R3                              ; 5C51   0033
        NEGR    R4                              ; 5C52   0024
        SAR     R0,     1                       ; 5C53   0068
        NOP                                     ; 5C54   0034
        SLR     R3,     2                       ; 5C55   0067
L_5C56:
        PSHR    R5                              ; 5C56   0275
        SDBD                                    ; 5C57   0001
        ADDI    #$5C77, R1                      ; 5C58   02F9 0077 005C
        MVI@    R1,     R5                      ; 5C5B   028D
        MVI     G_01A2, R0                      ; 5C5C   0280 01A2
        TSTR    R0                              ; 5C5E   0080
        BEQ     L_5C63                          ; 5C5F   0204 0002

        ADDI    #$0003, R5                      ; 5C61   02FD 0003
L_5C63:
        MVII    #$01A4, R1                      ; 5C63   02B9 01A4
        CMP@    R1,     R5                      ; 5C65   034D
        BEQ     L_5C76                          ; 5C66   0204 000E

        MVO@    R5,     R1                      ; 5C68   024D
        SDBD                                    ; 5C69   0001
        ADDI    #$5C7E, R5                      ; 5C6A   02FD 007E 005C
        MOVR    R5,     R1                      ; 5C6D   00A9
        ADD@    R5,     R1                      ; 5C6E   02E9
        MVII    #$002B, R0                      ; 5C6F   02B8 002B
        PSHR    R0                              ; 5C71   0270
        PSHR    R1                              ; 5C72   0271

        JSR     R5,     L_6922                  ; 5C73   0004 0168 0122

L_5C76:
        PULR    R7                              ; 5C76   02B7

        DECLE   $0003,  $0001,  $0001,  $0002   ; 5C77   0003 0001 0001 0002
        DECLE   $0003,  $0003,  $0003,  $0003   ; 5C7B   0003 0003 0003 0003
        DECLE   $0006,  $0023,  $003B,  $0055   ; 5C7F   0006 0023 003B 0055
        DECLE   $0078,  $008D,  $001D,  $0100   ; 5C83   0078 008D 001D 0100
        DECLE   $0136,  $0300,  $0100,  $0080   ; 5C87   0136 0300 0100 0080
        DECLE   $00E0,  $0080,  $0200,  $0100   ; 5C8B   00E0 0080 0200 0100
        DECLE   $0001,  $0007,  $0001           ; 5C8F   0001 0007 0001

        B       L_5E14                          ; 5C92   0200 0180

        MOVR    R0,     R1                      ; 5C94   0081
        MOVR    R0,     R7                      ; 5C95   0087

        DECLE   $0081,  $0280,  $0101,  $0081   ; 5C96   0081 0280 0101 0081
        DECLE   $00E1,  $0081,  $0201,  $02BF   ; 5C9A   00E1 0081 0201 02BF
        DECLE   $00C0,  $03FF,  $02FD,  $0003   ; 5C9E   00C0 03FF 02FD 0003
        DECLE   $03FF                           ; 5CA2   03FF

        COMR    R0                              ; 5CA3   0018
        SUBR    R0,     R0                      ; 5CA4   0100
        SUBR    R6,     R6                      ; 5CA5   0136
        SUB     .ISRVEC.0,R0                    ; 5CA6   0300 0100
        TSTR    R0                              ; 5CA8   0080
        ADDR    R4,     R0                      ; 5CA9   00E0
        TSTR    R0                              ; 5CAA   0080
        B       L_5DAD                          ; 5CAB   0200 0100

        DECLE   $0001,  $0007,  $0001,  $0200   ; 5CAD   0001 0007 0001 0200
        DECLE   $0218,  $0099,  $00DB,  $0099   ; 5CB1   0218 0099 00DB 0099
        DECLE   $0118,  $01BD,  $00C3,  $03FF   ; 5CB5   0118 01BD 00C3 03FF
        DECLE   $00FF,  $0318,  $0318,  $001A   ; 5CB9   00FF 0318 0318 001A
        DECLE   $00FF,  $00F0,  $02C0,  $0200   ; 5CBD   00FF 00F0 02C0 0200
        DECLE   $00FF,  $000F,  $0203,  $0200   ; 5CC1   00FF 000F 0203 0200
        DECLE   $0201,  $0051,  $0001,  $0005   ; 5CC5   0201 0051 0001 0005
        DECLE   $0101,  $0200,  $000A,  $0000   ; 5CC9   0101 0200 000A 0000
        DECLE   $0040,  $0100,  $0005           ; 5CCD   0040 0100 0005

        CLRC                                    ; 5CD0   0006
        SUBR    R0,     R7                      ; 5CD1   0107

        DECLE   $03FF,  $00A0,  $0060,  $01E0   ; 5CD2   03FF 00A0 0060 01E0
        DECLE   $03FF,  $0023,  $0300,  $0100   ; 5CD6   03FF 0023 0300 0100
        DECLE   $01FF,  $003E,  $0041,  $0055   ; 5CDA   01FF 003E 0041 0055
        DECLE   $0041,  $005D,  $0022,  $003E   ; 5CDE   0041 005D 0022 003E
        DECLE   $001C,  $0018,  $003C,  $007E   ; 5CE2   001C 0018 003C 007E
        DECLE   $003C,  $0018,  $0200,  $011E   ; 5CE6   003C 0018 0200 011E
        DECLE   $0100,  $0070,  $00F8,  $0070   ; 5CEA   0100 0070 00F8 0070
        DECLE   $0000,  $0178,  $0100,  $000E   ; 5CEE   0000 0178 0100 000E
        DECLE   $001F,  $000E,  $0000,  $00FF   ; 5CF2   001F 000E 0000 00FF
        DECLE   $00A5,  $0081,  $02A5,  $0081   ; 5CF6   00A5 0081 02A5 0081
        DECLE   $00A5,  $0015,  $0300,  $0100   ; 5CFA   00A5 0015 0300 0100
        DECLE   $01FF                           ; 5CFE   01FF

        RSWD    R6                              ; 5CFF   003E
        SWAP    R1,     1                       ; 5D00   0041
        RLC     R1,     2                       ; 5D01   0055
        SWAP    R1,     1                       ; 5D02   0041
        SLLC    R1,     2                       ; 5D03   005D
        NEGR    R2                              ; 5D04   0022
        RSWD    R6                              ; 5D05   003E
        COMR    R4                              ; 5D06   001C
        COMR    R0                              ; 5D07   0018
        RSWD    R4                              ; 5D08   003C
        SARC    R2,     2                       ; 5D09   007E
        RSWD    R4                              ; 5D0A   003C
        COMR    R0                              ; 5D0B   0018
        B       L_5D0E                          ; 5D0C   0200 0000

L_5D0E:
        MOVR    R0,     R1                      ; 5D0E   0081
        DECLE   $0100,  $03FF,  $0016,  $0300   ; 5D0F   0100 03FF 0016 0300
        DECLE   $0100,  $01FF,  $0180,  $00C0   ; 5D13   0100 01FF 0180 00C0
        DECLE   $00E0,  $00F0,  $00BF,  $001F   ; 5D17   00E0 00F0 00BF 001F
        DECLE   $00BF,  $0001                   ; 5D1B   00BF 0001

        NEGR    R1                              ; 5D1D   0021
        RRC     R3,     1                       ; 5D1E   0073
        RRC     R3,     2                       ; 5D1F   0077
        ADCR    R7                              ; 5D20   002F

        ADDR    R7,     R5                      ; 5D21   00FD
L_5D22:
        ADDR    R7,     R0                      ; 5D22   00F8
        DECLE   $00FD,  $0000,  $0081,  $0100   ; 5D23   00FD 0000 0081 0100
        DECLE   $03FF,  $0077,  $005D,  $00A9   ; 5D27   03FF 0077 005D 00A9
        DECLE   $005D,  $008D,  $005D,  $007D   ; 5D2B   005D 008D 005D 007D
        DECLE   $005D,  $006D,  $005D,  $006D   ; 5D2F   005D 006D 005D 006D
        DECLE   $005D,  $0068,  $005D,  $0068   ; 5D33   005D 0068 005D 0068
        DECLE   $005D,  $0077,  $005D,  $00C9   ; 5D37   005D 0077 005D 00C9
        DECLE   $005D,  $00E9,  $005D,  $0005   ; 5D3B   005D 00E9 005D 0005
        DECLE   $005E,  $0015,  $005E,  $0015   ; 5D3F   005E 0015 005E 0015
        DECLE   $005E,  $001F,  $005E,  $001F   ; 5D43   005E 001F 005E 001F
        DECLE   $005E,  $0000,  $0080,  $0000   ; 5D47   005E 0000 0080 0000
        DECLE   $0088,  $0007,  $0088,  $0002   ; 5D4B   0088 0007 0088 0002
        DECLE   $0088,  $0005,  $0088,  $0000   ; 5D4F   0088 0005 0088 0000
        DECLE   $000E,  $0000,  $0006,  $0000   ; 5D53   000E 0000 0006 0000
        DECLE   $0022,  $0000,  $0032,  $0005   ; 5D57   0022 0000 0032 0005
        DECLE   $003A,  $0007,  $002A,  $0000   ; 5D5B   003A 0007 002A 0000
        DECLE   $002A,  $0000,  $0018,  $0000   ; 5D5F   002A 0000 0018 0000
        DECLE   $003A,  $0000,  $000A,  $0005   ; 5D63   003A 0000 000A 0005
        DECLE   $000A,  $0001,  $0001,  $023F   ; 5D67   000A 0001 0001 023F
        DECLE   $0003,  $0141,  $0003,  $0002   ; 5D6B   0003 0141 0003 0002
        DECLE   $023E,  $0002,  $02D1,  $02E1   ; 5D6F   023E 0002 02D1 02E1
        DECLE   $02D1,  $02E1,  $02F1,  $0301   ; 5D73   02D1 02E1 02F1 0301
        DECLE   $0001,  $0002,  $02B4,  $0036   ; 5D77   0001 0002 02B4 0036
        DECLE   $02B1,  $02C1,  $0004,  $0003   ; 5D7B   02B1 02C1 0004 0003
        DECLE   $023D,  $0001,  $02B2,  $02E3   ; 5D7F   023D 0001 02B2 02E3
        DECLE   $02B2,  $02C3,  $0303,  $02D3   ; 5D83   02B2 02C3 0303 02D3
        DECLE   $02B2,  $02E3,  $02B2,  $0006   ; 5D87   02B2 02E3 02B2 0006
        DECLE   $02F1,  $0006,  $0006,  $0004   ; 5D8B   02F1 0006 0006 0004
        DECLE   $023C,  $0000,  $02B2,  $02F3   ; 5D8F   023C 0000 02B2 02F3
        DECLE   $02E3,  $02B2,  $02C3,  $01B3   ; 5D93   02E3 02B2 02C3 01B3
        DECLE   $01C3,  $02D3,  $02C3,  $02F3   ; 5D97   01C3 02D3 02C3 02F3
        DECLE   $02E3,  $02D3,  $0000,  $01B3   ; 5D9B   02E3 02D3 0000 01B3
        DECLE   $01C3,  $0000,  $02B2,  $02F3   ; 5D9F   01C3 0000 02B2 02F3
        DECLE   $02E3,  $02B2,  $0006,  $0301   ; 5DA3   02E3 02B2 0006 0301
        DECLE   $0311,  $0006,  $0007,  $0004   ; 5DA7   0311 0006 0007 0004
        DECLE   $023C,  $0000                   ; 5DAB   023C 0000
L_5DAD:
        PULR    R2                              ; 5DAD   02B2
        DECLE   $02F3,  $02E3,  $02B2,  $02C3   ; 5DAE   02F3 02E3 02B2 02C3
        DECLE   $01B3,  $01C3,  $02D3,  $0000   ; 5DB2   01B3 01C3 02D3 0000
        DECLE   $01B3,  $01C3,  $0000,  $02C3   ; 5DB6   01B3 01C3 0000 02C3
        DECLE   $02F3,  $02E3,  $02D3,  $0000   ; 5DBA   02F3 02E3 02D3 0000
        DECLE   $01B3,  $01C3,  $0000,  $02B2   ; 5DBE   01B3 01C3 0000 02B2
        DECLE   $02F3,  $02E3,  $02B2,  $0006   ; 5DC2   02F3 02E3 02B2 0006
        DECLE   $0301,  $0311,  $0006,  $0007   ; 5DC6   0301 0311 0006 0007
        DECLE   $0004,  $023C,  $0000,  $01A2   ; 5DCA   0004 023C 0000 01A2
        DECLE   $01A2,  $01A2,  $01A2,  $02B4   ; 5DCE   01A2 01A2 01A2 02B4
        DECLE   $02B4,  $02B4,  $02B4,  $00E9   ; 5DD2   02B4 02B4 02B4 00E9
        DECLE   $0008,  $02CD,  $00C9,  $02BB   ; 5DD6   0008 02CD 00C9 02BB
        DECLE   $009B,  $009B,  $02BB,  $02DA   ; 5DDA   009B 009B 02BB 02DA
        DECLE   $013B,  $013B,  $02DA,  $0006   ; 5DDE   013B 013B 02DA 0006
        DECLE   $02E5,  $02F5,  $0006,  $030C   ; 5DE2   02E5 02F5 0006 030C
        DECLE   $0010,  $0010,  $030C,  $0006   ; 5DE6   0010 0010 030C 0006
        DECLE   $0004,  $023C,  $0000,  $01A2   ; 5DEA   0004 023C 0000 01A2
        DECLE   $01A2,  $01A2,  $01A2,  $02B4   ; 5DEE   01A2 01A2 01A2 02B4
        DECLE   $02B4,  $02B4,  $02B4,  $00E9   ; 5DF2   02B4 02B4 02B4 00E9
        DECLE   $0008,  $02CD,  $00C9,  $02DA   ; 5DF6   0008 02CD 00C9 02DA
        DECLE   $009B,  $009B,  $02DA,  $0006   ; 5DFA   009B 009B 02DA 0006
        DECLE   $02E5,  $02F5,  $0006,  $030C   ; 5DFE   02E5 02F5 0006 030C
        DECLE   $0010,  $0010,  $030C,  $0004   ; 5E02   0010 0010 030C 0004
        DECLE   $0003,  $023D,  $0001           ; 5E06   0003 023D 0001

        PULR    R4                              ; 5E09   02B4
        PULR    R4                              ; 5E0A   02B4
        PULR    R4                              ; 5E0B   02B4
        ADDR    R5,     R7                      ; 5E0C   00EF

        ADD@    R1,     R6                      ; 5E0D   02CE
        ADDR    R1,     R7                      ; 5E0E   00CF

        ADD@    R3,     R2                      ; 5E0F   02DA
        TSTR    R3                              ; 5E10   009B
        ADD@    R3,     R2                      ; 5E11   02DA
        CMPR    R5,     R4                      ; 5E12   016C
        ADD@    R5,     R4                      ; 5E13   02EC
L_5E14:
        MOVR    R5,     R4                      ; 5E14   00AC
        DECLE   $0003,  $0002,  $023E           ; 5E15   0003 0002 023E

        EIS                                     ; 5E18   0002
        PULR    R4                              ; 5E19   02B4
        PULR    R4                              ; 5E1A   02B4
        ADD@    R1,     R7                      ; 5E1B   02CF
        ADD@    R3,     R7                      ; 5E1C   02DF

        DECLE   $016C,  $00AC,  $0001,  $0001   ; 5E1D   016C 00AC 0001 0001
        DECLE   $023F                           ; 5E21   023F

        DIS                                     ; 5E22   0003
        CMPR    R2,     R1                      ; 5E23   0151
        ADCR    R6                              ; 5E24   002E
        SLLC    R2,     2                       ; 5E25   005E
        MOVR    R7,     R2                      ; 5E26   00BA
        SAR     R2,     1                       ; 5E27   006A
        TSTR    R3                              ; 5E28   009B
        SLLC    R2,     2                       ; 5E29   005E
        SAR     R0,     2                       ; 5E2A   006C
        SAR     R3,     2                       ; 5E2B   006F
        ADDR    R0,     R1                      ; 5E2C   00C1
        SAR     R3,     2                       ; 5E2D   006F
        PSHR    R5                              ; 5E2E   0275
        TSTR    R0                              ; 5E2F   0080
        BMI     L_5E91                          ; 5E30   020B 005F

        MVII    #$01B1, R3                      ; 5E32   02BB 01B1
        ADDR    R1,     R3                      ; 5E34   00CB
        MVI@    R3,     R4                      ; 5E35   029C
        TSTR    R4                              ; 5E36   00A4
        BNEQ    L_5E91                          ; 5E37   020C 0058

        MVI     G_01AE, R4                      ; 5E39   0284 01AE
        TSTR    R4                              ; 5E3B   00A4
        BEQ     L_5E91                          ; 5E3C   0204 0053

        CMPI    #$0008, R0                      ; 5E3E   0378 0008
        BLE     L_5E74                          ; 5E40   0206 0032

        CMPI    #$000B, R0                      ; 5E42   0378 000B
        BLT     L_5E91                          ; 5E44   0205 004B

        CMPI    #$000D, R0                      ; 5E46   0378 000D
        BGT     L_5E91                          ; 5E48   020E 0047

        MVII    #$017B, R5                      ; 5E4A   02BD 017B
        ADDR    R1,     R5                      ; 5E4C   00CD
        MVI@    R5,     R4                      ; 5E4D   02AC
        CMPI    #$0004, R4                      ; 5E4E   037C 0004
        BNEQ    L_5E91                          ; 5E50   020C 003F

        MOVR    R1,     R0                      ; 5E52   0088

        JSR     R5,     L_5FFD                  ; 5E53   0004 015C 03FD

        BMI     L_5E5B                          ; 5E56   020B 0003
        J       L_55C1                          ; 5E58   0004 0354 01C1

L_5E5B:
        MVI@    R5,     R2                      ; 5E5B   02AA
        TSTR    R2                              ; 5E5C   0092
        BEQ     L_5E91                          ; 5E5D   0204 0032

        PSHR    R3                              ; 5E5F   0273
        ADDI    #$01A0, R1                      ; 5E60   02F9 01A0
        MVI@    R1,     R3                      ; 5E62   028B
        XORI    #$0001, R3                      ; 5E63   03FB 0001
        MVO@    R3,     R1                      ; 5E65   024B
        CLRR    R2                              ; 5E66   01D2

        JSR     R5,     L_5B0E                  ; 5E67   0004 0158 030E

        MVII    #$0001, R2                      ; 5E6A   02BA 0001

        JSR     R5,     L_5B0E                  ; 5E6C   0004 0158 030E

        PULR    R3                              ; 5E6F   02B3
        MVII    #$0002, R4                      ; 5E70   02BC 0002
        MVO@    R4,     R3                      ; 5E72   025C
        PULR    R7                              ; 5E73   02B7

L_5E74:
        SDBD                                    ; 5E74   0001
        MVII    #$5E92, R3                      ; 5E75   02BB 0092 005E
        ADDR    R0,     R3                      ; 5E78   00C3
        MVI@    R3,     R0                      ; 5E79   0298
        MVII    #$0126, R3                      ; 5E7A   02BB 0126
        ADDR    R1,     R3                      ; 5E7C   00CB
        ADDR    R1,     R3                      ; 5E7D   00CB
        MVII    #$02F6, R5                      ; 5E7E   02BD 02F6
        ADDR    R1,     R5                      ; 5E80   00CD
        MVI@    R5,     R1                      ; 5E81   02A9
        MOVR    R1,     R2                      ; 5E82   008A
        TSTR    R1                              ; 5E83   0089
        BEQ     L_5E90                          ; 5E84   0204 000A

        SWAP    R1,     1                       ; 5E86   0041
        ANDI    #$00FF, R1                      ; 5E87   03B9 00FF
        INCR    R1                              ; 5E89   0009

        JSR     R5,     X_EXT_SIGN_LO           ; 5E8A   0004 0114 0268
        JSR     R5,     X_MPY                   ; 5E8D   0004 011C 01DC

L_5E90:
        MVO@    R2,     R3                      ; 5E90   025A
L_5E91:
        PULR    R7                              ; 5E91   02B7

        DECLE   $0003,  $0003,  $0003,  $0000   ; 5E92   0003 0003 0003 0000
        DECLE   $0000,  $0000                   ; 5E96   0000 0000

        ADDR    R7,     R5                      ; 5E98   00FD
        ADDR    R7,     R5                      ; 5E99   00FD
        ADDR    R7,     R5                      ; 5E9A   00FD
L_5E9B:
        PSHR    R5                              ; 5E9B   0275
        TSTR    R0                              ; 5E9C   0080
        BMI     L_5F01                          ; 5E9D   020B 0062

        MOVR    R0,     R3                      ; 5E9F   0083
        MVI     G_01AE, R0                      ; 5EA0   0280 01AE
        TSTR    R0                              ; 5EA2   0080
        BNEQ    L_5EC0                          ; 5EA3   020C 001B

        MVI     G_01AD, R0                      ; 5EA5   0280 01AD
        TSTR    R0                              ; 5EA7   0080
        BEQ     L_5F01                          ; 5EA8   0204 0057

        MVI     G_01DB, R0                      ; 5EAA   0280 01DB
        INCR    R0                              ; 5EAC   0008
        ANDI    #$000F, R0                      ; 5EAD   03B8 000F
        MVO     R0,     G_01DB                  ; 5EAF   0240 01DB
        BNEQ    L_5F01                          ; 5EB1   020C 004E

        MVI     G_01AF, R0                      ; 5EB3   0280 01AF
        INCR    R0                              ; 5EB5   0008
        CMPI    #$003C, R0                      ; 5EB6   0378 003C
        BLE     L_5EBC                          ; 5EB8   0206 0002

        MVII    #$0001, R0                      ; 5EBA   02B8 0001
L_5EBC:
        MVO     R0,     G_01AF                  ; 5EBC   0240 01AF
        B       L_5F02                          ; 5EBE   0200 0042

L_5EC0:
        MOVR    R1,     R0                      ; 5EC0   0088

        JSR     R5,     L_5FF2                  ; 5EC1   0004 015C 03F2

        MOVR    R1,     R0                      ; 5EC4   0088

        JSR     R5,     L_603E                  ; 5EC5   0004 0160 003E

        TSTR    R1                              ; 5EC8   0089
        BEQ     L_5F01                          ; 5EC9   0204 0036

        MVII    #$02F6, R5                      ; 5ECB   02BD 02F6
        ADDR    R0,     R5                      ; 5ECD   00C5
        PSHR    R3                              ; 5ECE   0273
        MVII    #$0184, R2                      ; 5ECF   02BA 0184
        ADDR    R0,     R2                      ; 5ED1   00C2
        MVI@    R2,     R2                      ; 5ED2   0292
        SWAP    R2,     1                       ; 5ED3   0042
        SLL     R2,     1                       ; 5ED4   004A
        SDBD                                    ; 5ED5   0001
        MVII    #$0BDF, R4                      ; 5ED6   02BC 00DF 000B
        SUBR    R2,     R4                      ; 5ED9   0114
        MVI@    R5,     R1                      ; 5EDA   02A9
        CMPR    R4,     R1                      ; 5EDB   0161
        BLT     L_5EE1                          ; 5EDC   0205 0003

        MOVR    R4,     R1                      ; 5EDE   00A1
        B       L_5EE7                          ; 5EDF   0200 0006

L_5EE1:
        CMPI    #$0002, R3                      ; 5EE1   037B 0002
        BEQ     L_5EE7                          ; 5EE3   0204 0002

        ADDI    #$0020, R1                      ; 5EE5   02F9 0020
L_5EE7:
        DECR    R5                              ; 5EE7   0015
        MVO@    R1,     R5                      ; 5EE8   0269
        PSHR    R0                              ; 5EE9   0270

        JSR     R5,     L_6045                  ; 5EEA   0004 0160 0045

        PULR    R0                              ; 5EED   02B0
        PULR    R3                              ; 5EEE   02B3
        CMPI    #$0001, R3                      ; 5EEF   037B 0001
        BNEQ    L_5F01                          ; 5EF1   020C 000E

        MVO     R0,     G_01DA                  ; 5EF3   0240 01DA

        JSR     R5,     X_PLAY_SFX2             ; 5EF5   0004 0118 03BE
        DECLE   $0070                           ; 5EF8  SFX prio
        DECLE   $03E9                           ; 5EF9  SFX data
        DECLE   $0330,  $03FF                   ; 5EFA  SFX data
        DECLE   $0001,  $03C0                   ; 5EFC  SFX data
        DECLE   $008F,  $0064                   ; 5EFE  SFX data
        DECLE   $02CF                           ; 5F00  SFX end

L_5F01:
        PULR    R7                              ; 5F01   02B7

L_5F02:
        MVII    #$02A0, R4                      ; 5F02   02BC 02A0
        MVII    #$0005, R3                      ; 5F04   02BB 0005

        JSR     R5,     L_6CB3                  ; 5F06   0004 016C 00B3

        MVII    #$02AB, R4                      ; 5F09   02BC 02AB

        JSR     R5,     L_6CB3                  ; 5F0B   0004 016C 00B3

        PULR    R7                              ; 5F0E   02B7

L_5F0F:
        SDBD                                    ; 5F0F   0001
        MVII    #$06E0, R0                      ; 5F10   02B8 00E0 0006
L_5F13:
        PSHR    R5                              ; 5F13   0275
        PSHR    R0                              ; 5F14   0270
        MVII    #$017B, R4                      ; 5F15   02BC 017B
        MVII    #$006D, R0                      ; 5F17   02B8 006D

        JSR     R5,     X_FILL_ZERO             ; 5F19   0004 0114 0338

        MVII    #$017D, R4                      ; 5F1C   02BC 017D
        MVII    #$00FF, R1                      ; 5F1E   02B9 00FF
        MVO@    R1,     R4                      ; 5F20   0261
        MVO@    R1,     R4                      ; 5F21   0261
        SDBD                                    ; 5F22   0001
        MVII    #$6344, R1                      ; 5F23   02B9 0044 0063
        MVII    #$0200, R4                      ; 5F26   02BC 0200

        JSR     R5,     L_6281                  ; 5F28   0004 0160 0281

        PULR    R0                              ; 5F2B   02B0
        MVO     R0,     G_02F7                  ; 5F2C   0240 02F7
        MVII    #$0001, R0                      ; 5F2E   02B8 0001
        MVO     R0,     G_0197                  ; 5F30   0240 0197
        MVO     R0,     G_019A                  ; 5F32   0240 019A
        CLRR    R0                              ; 5F34   01C0

        JSR     R5,     L_52DC                  ; 5F35   0004 0150 02DC

        MVII    #$0001, R0                      ; 5F38   02B8 0001

        JSR     R5,     L_52DC                  ; 5F3A   0004 0150 02DC

        CLRR    R0                              ; 5F3D   01C0

        JSR     R5,     L_61D7                  ; 5F3E   0004 0160 01D7

        MVII    #$0001, R0                      ; 5F41   02B8 0001

        JSR     R5,     L_61D7                  ; 5F43   0004 0160 01D7

        CLRR    R0                              ; 5F46   01C0
        MVO     R0,     G_02F6                  ; 5F47   0240 02F6

        JSR     R5,     L_6045                  ; 5F49   0004 0160 0045

        MVII    #$0001, R0                      ; 5F4C   02B8 0001

        JSR     R5,     L_6045                  ; 5F4E   0004 0160 0045

        MVII    #$0002, R2                      ; 5F51   02BA 0002
        MVII    #$032C, R3                      ; 5F53   02BB 032C
        SDBD                                    ; 5F55   0001
        MVII    #$68F4, R4                      ; 5F56   02BC 00F4 0068

        JSR     R5,     L_5FB5                  ; 5F59   0004 015C 03B5

        MVII    #$00FF, R1                      ; 5F5C   02B9 00FF
        MVO     R1,     G_01A4                  ; 5F5E   0241 01A4
        MVO     R1,     G_01A5                  ; 5F60   0241 01A5
        MVO     R1,     G_01A6                  ; 5F62   0241 01A6
        MVII    #$01B1, R5                      ; 5F64   02BD 01B1
        MVO@    R1,     R5                      ; 5F66   0269
        MVII    #$0032, R1                      ; 5F67   02B9 0032
        MVO     R1,     G_02F4                  ; 5F69   0241 02F4
        MVO     R1,     G_02F5                  ; 5F6B   0241 02F5
        MVII    #$0005, R1                      ; 5F6D   02B9 0005
        MVO     R1,     G_01AF                  ; 5F6F   0241 01AF
        MVII    #$0080, R1                      ; 5F71   02B9 0080
        SWAP    R1,     1                       ; 5F73   0041
        MVO     R1,     G_02F1                  ; 5F74   0241 02F1
        MVO     R1,     G_02F2                  ; 5F76   0241 02F2
        MVII    #$0070, R1                      ; 5F78   02B9 0070
        MVO     R1,     G_0350                  ; 5F7A   0241 0350
        MVO     R1,     G_0352                  ; 5F7C   0241 0352
        MVII    #$0251, R4                      ; 5F7E   02BC 0251
        MVII    #$0007, R3                      ; 5F80   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 5F82   0004 0118 007B
        STRING  "TRUCKIN"                       ; 5F85  
        DECLE   $0000                           ; 5F8C   0000

        ADDI    #$000D, R4                      ; 5F8D   02FC 000D

        JSR     R5,     X_PRINT_R5              ; 5F8F   0004 0118 007B
        STRING  " BY"                           ; 5F92   0020 0042 0059
        DECLE   $0000                           ; 5F95   0000

        SDBD                                    ; 5F96   0001
        MVII    #$08EA, R1                      ; 5F97   02B9 00EA 0008
        MVO@    R1,     R4                      ; 5F9A   0261
        ADDI    #$0008, R1                      ; 5F9B   02F9 0008
        MVO@    R1,     R4                      ; 5F9D   0261
        ADDI    #$0008, R1                      ; 5F9E   02F9 0008
        MVO@    R1,     R4                      ; 5FA0   0261
        CLRR    R1                              ; 5FA1   01C9
        MVO@    R1,     R4                      ; 5FA2   0261
        ADDI    #$000D, R4                      ; 5FA3   02FC 000D
        SDBD                                    ; 5FA5   0001
        MVII    #$087F, R1                      ; 5FA6   02B9 007F 0008
        MVO@    R1,     R4                      ; 5FA9   0261

        JSR     R5,     X_PRINT_R5              ; 5FAA   0004 0118 007B
        STRING  "  1983"                        ; 5FAD  
        DECLE   $0000                           ; 5FB3   0000

        PULR    R7                              ; 5FB4   02B7

L_5FB5:
        DECR    R2                              ; 5FB5   0012
        INCR    R7                              ; 5FB6   000F

L_5FB7:
        CLRR    R2                              ; 5FB7   01D2
L_5FB8:
        SDBD                                    ; 5FB8   0001
        MVI@    R4,     R0                      ; 5FB9   02A0
        MVO@    R0,     R3                      ; 5FBA   0258
        ADDI    #$0008, R3                      ; 5FBB   02FB 0008
        SDBD                                    ; 5FBD   0001
        MVI@    R4,     R0                      ; 5FBE   02A0
        MVO@    R0,     R3                      ; 5FBF   0258
        ADDI    #$0008, R3                      ; 5FC0   02FB 0008
        SDBD                                    ; 5FC2   0001
        MVI@    R4,     R0                      ; 5FC3   02A0
        MVI@    R3,     R1                      ; 5FC4   0299
        SDBD                                    ; 5FC5   0001
        ANDI    #$0FF8, R1                      ; 5FC6   03B9 00F8 000F
        XORR    R0,     R1                      ; 5FC9   01C1
        MVO@    R1,     R3                      ; 5FCA   0259
        ADDI    #$0008, R3                      ; 5FCB   02FB 0008
        SDBD                                    ; 5FCD   0001
        MVI@    R4,     R0                      ; 5FCE   02A0
        MVO@    R0,     R3                      ; 5FCF   0258
        SUBI    #$0344, R3                      ; 5FD0   033B 0344
        MVII    #$0171, R1                      ; 5FD2   02B9 0171
        ADDR    R3,     R1                      ; 5FD4   00D9
        MVO@    R1,     R1                      ; 5FD5   0249
        ADDI    #$032D, R3                      ; 5FD6   02FB 032D
        DECR    R2                              ; 5FD8   0012
        BPL     L_5FB8                          ; 5FD9   0223 0022
        MOVR    R5,     R7                      ; 5FDB   00AF

L_5FDC:
        PSHR    R5                              ; 5FDC   0275
        SDBD                                    ; 5FDD   0001
        MVII    #$5FEA, R5                      ; 5FDE   02BD 00EA 005F
L_5FE1:
        CMP@    R5,     R1                      ; 5FE1   0369
        BGT     L_5FE1                          ; 5FE2   022E 0002

        SDBD                                    ; 5FE4   0001
        SUBI    #$5FEB, R5                      ; 5FE5   033D 00EB 005F
        MOVR    R5,     R1                      ; 5FE8   00A9
        PULR    R7                              ; 5FE9   02B7

        DECLE   $000D,  $0014,  $0023,  $003C   ; 5FEA   000D 0014 0023 003C
        DECLE   $005A,  $007E,  $00B5,  $00FF   ; 5FEE   005A 007E 00B5 00FF
L_5FF2:
        PSHR    R1                              ; 5FF2   0271
        MVII    #$01B1, R1                      ; 5FF3   02B9 01B1
        ADDR    R0,     R1                      ; 5FF5   00C1
        MVI@    R1,     R1                      ; 5FF6   0289
        TSTR    R1                              ; 5FF7   0089
        PULR    R1                              ; 5FF8   02B1
        BEQ     L_5FFC                          ; 5FF9   0204 0001
        PULR    R7                              ; 5FFB   02B7
L_5FFC:
        MOVR    R5,     R7                      ; 5FFC   00AF

L_5FFD:
        PSHR    R5                              ; 5FFD   0275
        MVII    #$02F6, R5                      ; 5FFE   02BD 02F6
        ADDR    R0,     R5                      ; 6000   00C5
        MVI@    R5,     R2                      ; 6001   02AA
        DECR    R5                              ; 6002   0015
        SUBI    #$0301, R2                      ; 6003   033A 0301
        PULR    R7                              ; 6005   02B7

L_6006:
        PSHR    R5                              ; 6006   0275
        MVII    #$032E, R3                      ; 6007   02BB 032E
        ADDR    R0,     R3                      ; 6009   00C3
        SDBD                                    ; 600A   0001
        MVII    #$6904, R4                      ; 600B   02BC 0004 0069
        TSTR    R0                              ; 600E   0080
        BEQ     L_6015                          ; 600F   0204 0004

        SDBD                                    ; 6011   0001
        ADDI    #$0008, R4                      ; 6012   02FC 0008 0000
L_6015:
        PSHR    R0                              ; 6015   0270

        JSR     R5,     L_5FB7                  ; 6016   0004 015C 03B7

        PULR    R0                              ; 6019   02B0
        MVII    #$017F, R2                      ; 601A   02BA 017F
        ADDR    R0,     R2                      ; 601C   00C2
        PSHR    R0                              ; 601D   0270

        JSR     R5,     L_54F2                  ; 601E   0004 0154 00F2

        PULR    R0                              ; 6021   02B0
        MVII    #$01A0, R2                      ; 6022   02BA 01A0
        ADDR    R0,     R2                      ; 6024   00C2
        MVI@    R2,     R2                      ; 6025   0292
        CMPR    R2,     R3                      ; 6026   0153
        BEQ     L_6035                          ; 6027   0204 000C

        MVII    #$0200, R1                      ; 6029   02B9 0200
        SLL     R1,     1                       ; 602B   0049
        TSTR    R3                              ; 602C   009B
        BNEQ    L_6030                          ; 602D   020C 0001

        SLL     R1,     1                       ; 602F   0049
L_6030:
        MVII    #$0336, R2                      ; 6030   02BA 0336
        ADDR    R0,     R2                      ; 6032   00C2
        XOR@    R2,     R1                      ; 6033   03D1
        MVO@    R1,     R2                      ; 6034   0251
L_6035:
        SLL     R3,     2                       ; 6035   004F
        SLL     R3,     1                       ; 6036   004B
        ADDI    #$01F0, R3                      ; 6037   02FB 01F0
        MVII    #$033E, R2                      ; 6039   02BA 033E
        ADDR    R0,     R2                      ; 603B   00C2
        MVO@    R3,     R2                      ; 603C   0253
        PULR    R7                              ; 603D   02B7

L_603E:
        MVII    #$0354, R2                      ; 603E   02BA 0354
        ADDR    R0,     R2                      ; 6040   00C2
        MVI@    R2,     R1                      ; 6041   0291
        ANDI    #$000F, R1                      ; 6042   03B9 000F
        MOVR    R5,     R7                      ; 6044   00AF

L_6045:
        PSHR    R5                              ; 6045   0275
        MVII    #$02CE, R4                      ; 6046   02BC 02CE
        TSTR    R0                              ; 6048   0080
        BEQ     L_604D                          ; 6049   0204 0002

        ADDI    #$000B, R4                      ; 604B   02FC 000B
L_604D:
        MVII    #$02F6, R5                      ; 604D   02BD 02F6
        ADDR    R0,     R5                      ; 604F   00C5
        MVI@    R5,     R1                      ; 6050   02A9
        PSHR    R1                              ; 6051   0271
        SLR     R1,     2                       ; 6052   0065
        SLR     R1,     2                       ; 6053   0065
        SLR     R1,     1                       ; 6054   0061
        PSHR    R0                              ; 6055   0270
        MOVR    R1,     R0                      ; 6056   0088
        SDBD                                    ; 6057   0001
        MVII    #$1206, R3                      ; 6058   02BB 0006 0012
        MVII    #$0002, R1                      ; 605B   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 605D   0004 0118 00C5

        PULR    R0                              ; 6060   02B0
        PULR    R1                              ; 6061   02B1
        TSTR    R1                              ; 6062   0089
        BEQ     L_606E                          ; 6063   0204 0009

        SWAP    R1,     1                       ; 6065   0041
        ANDI    #$00FF, R1                      ; 6066   03B9 00FF
        SLR     R1,     1                       ; 6068   0061
        SDBD                                    ; 6069   0001
        ADDI    #$6082, R1                      ; 606A   02F9 0082 0060
        MVI@    R1,     R1                      ; 606D   0289
L_606E:
        MVII    #$0358, R2                      ; 606E   02BA 0358
        ADDR    R0,     R2                      ; 6070   00C2
        MVI@    R2,     R3                      ; 6071   0293
        SDBD                                    ; 6072   0001
        ANDI    #$FE0F, R3                      ; 6073   03BB 000F 00FE
        XORR    R1,     R3                      ; 6076   01CB
        MVO@    R3,     R2                      ; 6077   0253
        SUBI    #$0002, R2                      ; 6078   033A 0002
        MVI@    R2,     R3                      ; 607A   0293
        SDBD                                    ; 607B   0001
        ANDI    #$FE0F, R3                      ; 607C   03BB 000F 00FE
        XORR    R1,     R3                      ; 607F   01CB
        MVO@    R3,     R2                      ; 6080   0253
        PULR    R7                              ; 6081   02B7

        RLC     R0,     1                       ; 6082   0050
        SWAP    R0,     1                       ; 6083   0040
        GSWD    R0                              ; 6084   0030
        NEGR    R0                              ; 6085   0020
        DECR    R0                              ; 6086   0010
        DECR    R0                              ; 6087   0010
L_6088:
        CLRR    R4                              ; 6088   01E4
        SDBD                                    ; 6089   0001
        MVII    #$62D5, R1                      ; 608A   02B9 00D5 0062
        SDBD                                    ; 608D   0001
        MVII    #$C000, R2                      ; 608E   02BA 0000 00C0
L_6091:
        PSHR    R5                              ; 6091   0275
        PSHR    R2                              ; 6092   0272
        MOVR    R1,     R5                      ; 6093   008D
        MVI@    R5,     R1                      ; 6094   02A9
        MVI@    R5,     R2                      ; 6095   02AA
        MVI@    R5,     R3                      ; 6096   02AB
        ADDR    R4,     R3                      ; 6097   00E3
        ADD@    R5,     R4                      ; 6098   02EC
        SDBD                                    ; 6099   0001
        ADDI    #$62D9, R4                      ; 609A   02FC 00D9 0062
        TSTR    R0                              ; 609D   0080
        BEQ     L_60A2                          ; 609E   0204 0002

        ADDI    #$000B, R3                      ; 60A0   02FB 000B
L_60A2:
        PULR    R5                              ; 60A2   02B5
L_60A3:
        PSHR    R1                              ; 60A3   0271
        PSHR    R2                              ; 60A4   0272
        PSHR    R3                              ; 60A5   0273
        PSHR    R4                              ; 60A6   0274
L_60A7:
        MVI@    R3,     R1                      ; 60A7   0299
        ANDR    R5,     R1                      ; 60A8   01A9
        BNEQ    L_60B4                          ; 60A9   020C 0009

        MVI@    R4,     R1                      ; 60AB   02A1
        PSHR    R5                              ; 60AC   0275

        JSR     R5,     L_60E8                  ; 60AD   0004 0160 00E8

        PULR    R5                              ; 60B0   02B5
        MVO@    R1,     R3                      ; 60B1   0259
        B       L_60B5                          ; 60B2   0200 0001

L_60B4:
        INCR    R4                              ; 60B4   000C
L_60B5:
        INCR    R3                              ; 60B5   000B
        DECR    R2                              ; 60B6   0012
        BNEQ    L_60A7                          ; 60B7   022C 0011

        PULR    R4                              ; 60B9   02B4
        ADDI    #$0009, R4                      ; 60BA   02FC 0009
        PULR    R3                              ; 60BC   02B3
        ADDI    #$0014, R3                      ; 60BD   02FB 0014
        PULR    R2                              ; 60BF   02B2
        PULR    R1                              ; 60C0   02B1
        DECR    R1                              ; 60C1   0011
        BNEQ    L_60A3                          ; 60C2   022C 0020

        MVII    #$0080, R2                      ; 60C4   02BA 0080
        SWAP    R2,     1                       ; 60C6   0042
        INCR    R7                              ; 60C7   000F

L_60C8:
        PSHR    R5                              ; 60C8   0275
L_60C9:
        MVII    #$0203, R3                      ; 60C9   02BB 0203
        TSTR    R0                              ; 60CB   0080
        BEQ     L_60D0                          ; 60CC   0204 0002

        ADDI    #$000B, R3                      ; 60CE   02FB 000B
L_60D0:
        MVII    #$0059, R1                      ; 60D0   02B9 0059

        JSR     R5,     L_60DD                  ; 60D2   0004 0160 00DD

        MVII    #$0090, R1                      ; 60D5   02B9 0090

        JSR     R5,     L_60DD                  ; 60D7   0004 0160 00DD

        MVII    #$006A, R1                      ; 60DA   02B9 006A
        INCR    R7                              ; 60DC   000F

L_60DD:
        PSHR    R5                              ; 60DD   0275
L_60DE:
        MVI@    R3,     R5                      ; 60DE   029D
        ANDR    R5,     R2                      ; 60DF   01AA
        BNEQ    L_60E6                          ; 60E0   020C 0004

        JSR     R5,     L_60E8                  ; 60E2   0004 0160 00E8

        MVO@    R1,     R3                      ; 60E5   0259
L_60E6:
        INCR    R3                              ; 60E6   000B
        PULR    R7                              ; 60E7   02B7

L_60E8:
        PSHR    R5                              ; 60E8   0275
        PSHR    R2                              ; 60E9   0272

        JSR     R5,     L_6116                  ; 60EA   0004 0160 0116

        MOVR    R1,     R2                      ; 60ED   008A
        ANDI    #$0003, R2                      ; 60EE   03BA 0003
        BNEQ    L_6104                          ; 60F0   020C 0012

        TSTR    R1                              ; 60F2   0089
        BEQ     L_6114                          ; 60F3   0204 001F

        TSTR    R0                              ; 60F5   0080
        BEQ     L_60FE                          ; 60F6   0204 0006

        CMPI    #$0090, R1                      ; 60F8   0379 0090
        BEQ     L_60FE                          ; 60FA   0204 0002

        ADDI    #$0008, R1                      ; 60FC   02F9 0008
L_60FE:
        SDBD                                    ; 60FE   0001
        XORI    #$0807, R1                      ; 60FF   03F9 0007 0008
        B       L_6114                          ; 6102   0200 0010

L_6104:
        CMPI    #$0001, R2                      ; 6104   037A 0001
        MVI@    R5,     R2                      ; 6106   02AA
        BEQ     L_610A                          ; 6107   0204 0001

        MVI@    R5,     R2                      ; 6109   02AA
L_610A:
        SWAP    R2,     1                       ; 610A   0042
        ANDI    #$01F8, R1                      ; 610B   03B9 01F8
        BEQ     L_6113                          ; 610D   0204 0004

        SDBD                                    ; 610F   0001
        XORI    #$0800, R1                      ; 6110   03F9 0000 0008
L_6113:
        XORR    R2,     R1                      ; 6113   01D1
L_6114:
        PULR    R2                              ; 6114   02B2
        PULR    R7                              ; 6115   02B7

L_6116:
        PSHR    R5                              ; 6116   0275
        MVII    #$017B, R2                      ; 6117   02BA 017B
        TSTR    R0                              ; 6119   0080
        BEQ     L_611D                          ; 611A   0204 0001

        INCR    R2                              ; 611C   000A
L_611D:
        MVI@    R2,     R2                      ; 611D   0292
        CMPI    #$00FF, R2                      ; 611E   037A 00FF
        BNEQ    L_6124                          ; 6120   020C 0002

        MVII    #$0004, R2                      ; 6122   02BA 0004
L_6124:
        SDBD                                    ; 6124   0001
        ADDI    #$6662, R2                      ; 6125   02FA 0062 0066
        SDBD                                    ; 6128   0001
        MVII    #$666B, R5                      ; 6129   02BD 006B 0066
        ADD@    R2,     R5                      ; 612C   02D5
        PULR    R7                              ; 612D   02B7

L_612E:
        PSHR    R5                              ; 612E   0275
        MVII    #$0200, R4                      ; 612F   02BC 0200
        TSTR    R0                              ; 6131   0080
        BEQ     L_6136                          ; 6132   0204 0002

        ADDI    #$000B, R4                      ; 6134   02FC 000B
L_6136:
        MVI     G_0183, R1                      ; 6136   0281 0183
        SWAP    R1,     1                       ; 6138   0041
        MVII    #$0001, R2                      ; 6139   02BA 0001

        JSR     R5,     L_61B7                  ; 613B   0004 0160 01B7

        INCR    R4                              ; 613E   000C
        MVII    #$0001, R2                      ; 613F   02BA 0001

        JSR     R5,     L_61B7                  ; 6141   0004 0160 01B7

        ADDI    #$0003, R4                      ; 6144   02FC 0003
        MVII    #$0003, R2                      ; 6146   02BA 0003

        JSR     R5,     L_61B7                  ; 6148   0004 0160 01B7

        ADDI    #$000B, R4                      ; 614B   02FC 000B
        MVII    #$0009, R2                      ; 614D   02BA 0009

        JSR     R5,     L_61B7                  ; 614F   0004 0160 01B7

        ADDI    #$000B, R4                      ; 6152   02FC 000B
        MVII    #$0009, R2                      ; 6154   02BA 0009

        JSR     R5,     L_61B7                  ; 6156   0004 0160 01B7

        SUBI    #$0009, R4                      ; 6159   033C 0009
        MVII    #$01B1, R2                      ; 615B   02BA 01B1
        MVII    #$017D, R1                      ; 615D   02B9 017D
        TSTR    R0                              ; 615F   0080
        BEQ     L_6164                          ; 6160   0204 0002

        INCR    R1                              ; 6162   0009
        INCR    R2                              ; 6163   000A
L_6164:
        MVI@    R2,     R2                      ; 6164   0292
        TSTR    R2                              ; 6165   0092
        BEQ     L_616C                          ; 6166   0204 0004

        CMPI    #$00FF, R2                      ; 6168   037A 00FF
        BNEQ    L_61B6                          ; 616A   020C 004A

L_616C:
        MVI@    R1,     R1                      ; 616C   0289
        SDBD                                    ; 616D   0001
        ADDI    #$6735, R1                      ; 616E   02F9 0035 0067
        SDBD                                    ; 6171   0001
        MVII    #$673E, R5                      ; 6172   02BD 003E 0067
        ADD@    R1,     R5                      ; 6175   02CD
        MVI@    R5,     R2                      ; 6176   02AA
        SDBD                                    ; 6177   0001
        ADDI    #$679A, R2                      ; 6178   02FA 009A 0067
        MVII    #$0169, R1                      ; 617B   02B9 0169
        ADDR    R0,     R1                      ; 617D   00C1
        ADDR    R0,     R1                      ; 617E   00C1
        MVO@    R2,     R1                      ; 617F   024A
        SWAP    R2,     1                       ; 6180   0042
        INCR    R1                              ; 6181   0009
        MVO@    R2,     R1                      ; 6182   024A
        MVII    #$035A, R1                      ; 6183   02B9 035A
        ADDR    R0,     R1                      ; 6185   00C1
        MVII    #$0040, R2                      ; 6186   02BA 0040
        MVO@    R2,     R1                      ; 6188   024A
        MOVR    R0,     R1                      ; 6189   0081
        ADDI    #$0006, R1                      ; 618A   02F9 0006
        SLL     R1,     2                       ; 618C   004D
        SLL     R1,     1                       ; 618D   0049
        SDBD                                    ; 618E   0001
        XORI    #$0800, R1                      ; 618F   03F9 0000 0008
        MVI     G_0183, R2                      ; 6192   0282 0183
        SWAP    R2,     1                       ; 6194   0042
        XORR    R2,     R1                      ; 6195   01D1
        MOVR    R1,     R2                      ; 6196   008A
        ADDI    #$00D8, R2                      ; 6197   02FA 00D8
        XOR@    R5,     R2                      ; 6199   03EA
        PSHR    R2                              ; 619A   0272
        XOR@    R5,     R1                      ; 619B   03E9
        MVI@    R5,     R2                      ; 619C   02AA
        PSHR    R2                              ; 619D   0272
        PSHR    R0                              ; 619E   0270
        MVII    #$0021, R2                      ; 619F   02BA 0021
        ADDR    R0,     R2                      ; 61A1   00C2
        PSHR    R2                              ; 61A2   0272
        PSHR    R5                              ; 61A3   0275

        JSR     R5,     L_6922                  ; 61A4   0004 0168 0122

        PULR    R0                              ; 61A7   02B0
        MVII    #$0009, R3                      ; 61A8   02BB 0009
        PULR    R0                              ; 61AA   02B0
        PULR    R2                              ; 61AB   02B2
L_61AC:
        SARC    R0,     1                       ; 61AC   0078
        BC      L_61B2                          ; 61AD   0201 0003

        MVO@    R1,     R4                      ; 61AF   0261
        B       L_61B3                          ; 61B0   0200 0001

L_61B2:
        MVO@    R2,     R4                      ; 61B2   0262
L_61B3:
        DECR    R3                              ; 61B3   0013
        BNEQ    L_61AC                          ; 61B4   022C 0009
L_61B6:
        PULR    R7                              ; 61B6   02B7

L_61B7:
        PSHR    R5                              ; 61B7   0275
L_61B8:
        MVI@    R4,     R5                      ; 61B8   02A5
        SDBD                                    ; 61B9   0001
        ANDI    #$09FF, R5                      ; 61BA   03BD 00FF 0009
        XORR    R1,     R5                      ; 61BD   01CD
        DECR    R4                              ; 61BE   0014
        MVO@    R5,     R4                      ; 61BF   0265
        DECR    R2                              ; 61C0   0012
        BNEQ    L_61B8                          ; 61C1   022C 000A
        PULR    R7                              ; 61C3   02B7

L_61C4:
        PSHR    R5                              ; 61C4   0275

        JSR     R5,     L_6116                  ; 61C5   0004 0160 0116

        SDBD                                    ; 61C8   0001
        ADDI    #$0004, R5                      ; 61C9   02FD 0004 0000
        MVII    #$0025, R3                      ; 61CC   02BB 0025
        ADDR    R0,     R3                      ; 61CE   00C3
        ADDR    R0,     R3                      ; 61CF   00C3
        ADDR    R0,     R3                      ; 61D0   00C3
        PSHR    R3                              ; 61D1   0273
        PSHR    R5                              ; 61D2   0275

        JSR     R5,     L_6922                  ; 61D3   0004 0168 0122

        PULR    R7                              ; 61D6   02B7

L_61D7:
        PSHR    R5                              ; 61D7   0275
        PSHR    R0                              ; 61D8   0270

        JSR     R5,     L_6006                  ; 61D9   0004 0160 0006

        PULR    R0                              ; 61DC   02B0
        MVII    #$0231, R4                      ; 61DD   02BC 0231
        TSTR    R0                              ; 61DF   0080
        BEQ     L_61E4                          ; 61E0   0204 0002

        ADDI    #$0078, R4                      ; 61E2   02FC 0078
L_61E4:
        MVII    #$017F, R2                      ; 61E4   02BA 017F
        ADDR    R0,     R2                      ; 61E6   00C2

        JSR     R5,     L_52D3                  ; 61E7   0004 0150 02D3

        MVI@    R2,     R0                      ; 61EA   0290
        MVII    #$0207, R3                      ; 61EB   02BB 0207
        CMPI    #$0065, R0                      ; 61ED   0378 0065
        BNEQ    L_61F9                          ; 61EF   020C 0008

        MVII    #$0080, R0                      ; 61F1   02B8 0080
        XORR    R3,     R0                      ; 61F3   01D8
        MVO@    R0,     R4                      ; 61F4   0260
        ADDI    #$0008, R0                      ; 61F5   02F8 0008
        MVO@    R0,     R4                      ; 61F7   0260
        PULR    R7                              ; 61F8   02B7

L_61F9:
        MVII    #$0002, R1                      ; 61F9   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 61FB   0004 0118 00C5

        PULR    R7                              ; 61FE   02B7

        PSHR    R5                              ; 61FF   0275
L_6200:
        MVII    #$0209, R4                      ; 6200   02BC 0209
        TSTR    R0                              ; 6202   0080
        BEQ     L_6207                          ; 6203   0204 0002

        MVII    #$0281, R4                      ; 6205   02BC 0281
L_6207:
        MVII    #$0186, R1                      ; 6207   02B9 0186
        ADDR    R0,     R1                      ; 6209   00C1
        MVI@    R1,     R1                      ; 620A   0289
        MVII    #$0012, R3                      ; 620B   02BB 0012
        SWAP    R3,     1                       ; 620D   0043
        MVII    #$017B, R2                      ; 620E   02BA 017B
        ADDR    R0,     R2                      ; 6210   00C2
        MVI@    R2,     R2                      ; 6211   0292
        CMPI    #$0004, R2                      ; 6212   037A 0004
        BNEQ    L_625A                          ; 6214   020C 0044

        XORI    #$0007, R3                      ; 6216   03FB 0007
        PSHR    R1                              ; 6218   0271
        PSHR    R3                              ; 6219   0273
        SDBD                                    ; 621A   0001
        CMPI    #$0042, R1                      ; 621B   0379 0042 0000
        BNEQ    L_6234                          ; 621E   020C 0014

        PSHR    R4                              ; 6220   0274
        SDBD                                    ; 6221   0001
        MVII    #$08EF, R3                      ; 6222   02BB 00EF 0008
        MVII    #$022B, R4                      ; 6225   02BC 022B
        TSTR    R0                              ; 6227   0080
        BEQ     L_622C                          ; 6228   0204 0002

        ADDI    #$000B, R4                      ; 622A   02FC 000B
L_622C:
        MVO@    R3,     R4                      ; 622C   0263
        ADDI    #$0008, R3                      ; 622D   02FB 0008
        MVO@    R3,     R4                      ; 622F   0263
        ADDI    #$0008, R3                      ; 6230   02FB 0008
        MVO@    R3,     R4                      ; 6232   0263
        PULR    R4                              ; 6233   02B4
L_6234:
        MVI     G_01AE, R3                      ; 6234   0283 01AE
        DECR    R3                              ; 6236   0013
        BNEQ    L_6256                          ; 6237   020C 001D

        MOVR    R1,     R3                      ; 6239   008B

        JSR     R5,     L_6273                  ; 623A   0004 0160 0273

        BNEQ    L_6256                          ; 623D   020C 0017

        MOVR    R5,     R1                      ; 623F   00A9
        ADDR    R0,     R1                      ; 6240   00C1
        MVO@    R2,     R1                      ; 6241   024A
        MVII    #$01BE, R1                      ; 6242   02B9 01BE
        ADDR    R0,     R1                      ; 6244   00C1
        MVII    #$0008, R2                      ; 6245   02BA 0008
L_6247:
        MVI@    R1,     R3                      ; 6247   028B
        TSTR    R3                              ; 6248   009B
        BEQ     L_6256                          ; 6249   0204 000B

        ADDI    #$0003, R1                      ; 624B   02F9 0003
        DECR    R2                              ; 624D   0012
        BNEQ    L_6247                          ; 624E   022C 0008

        JSR     R5,     L_57E8                  ; 6250   0004 0154 03E8

        PULR    R3                              ; 6253   02B3
        PULR    R1                              ; 6254   02B1
        PULR    R7                              ; 6255   02B7

L_6256:
        PULR    R3                              ; 6256   02B3
        PULR    R1                              ; 6257   02B1
        INCR    R7                              ; 6258   000F

L_6259:
        PSHR    R5                              ; 6259   0275
L_625A:
        MOVR    R1,     R2                      ; 625A   008A
        ADDR    R2,     R1                      ; 625B   00D1
        ADDR    R2,     R1                      ; 625C   00D1
        SDBD                                    ; 625D   0001
        ADDI    #$6815, R1                      ; 625E   02F9 0015 0068
        MVI@    R1,     R1                      ; 6261   0289
        MOVR    R1,     R2                      ; 6262   008A
        ANDI    #$03E0, R1                      ; 6263   03B9 03E0
        SLR     R1,     2                       ; 6265   0065
        ADDI    #$0108, R1                      ; 6266   02F9 0108
        ANDI    #$001F, R2                      ; 6268   03BA 001F
        SLL     R2,     1                       ; 626A   004A
        SLL     R2,     2                       ; 626B   004E
        ADDI    #$0108, R2                      ; 626C   02FA 0108
        XORR    R3,     R1                      ; 626E   01D9
        XORR    R3,     R2                      ; 626F   01DA
        MVO@    R1,     R4                      ; 6270   0261
        MVO@    R2,     R4                      ; 6271   0262
        PULR    R7                              ; 6272   02B7

L_6273:
        PSHR    R5                              ; 6273   0275
        MVII    #$01BD, R5                      ; 6274   02BD 01BD
L_6276:
        CMP@    R5,     R3                      ; 6276   036B
        BEQ     L_6280                          ; 6277   0204 0007

        ADDI    #$0002, R5                      ; 6279   02FD 0002
        CMPI    #$01D5, R5                      ; 627B   037D 01D5
        BNEQ    L_6276                          ; 627D   022C 0008

        INCR    R5                              ; 627F   000D
L_6280:
        PULR    R7                              ; 6280   02B7

L_6281:
        PSHR    R5                              ; 6281   0275
        MVO     R0,     G_01D9                  ; 6282   0240 01D9
        MOVR    R1,     R5                      ; 6284   008D
        MVI@    R5,     R1                      ; 6285   02A9
        MVI@    R5,     R2                      ; 6286   02AA
L_6287:
        PSHR    R4                              ; 6287   0274
        PSHR    R2                              ; 6288   0272
L_6289:
        MVI@    R5,     R0                      ; 6289   02A8
        PSHR    R5                              ; 628A   0275
        PSHR    R2                              ; 628B   0272
        MOVR    R0,     R3                      ; 628C   0083
        ANDI    #$0007, R3                      ; 628D   03BB 0007
        INCR    R3                              ; 628F   000B
        SLR     R0,     2                       ; 6290   0064
        SLR     R0,     1                       ; 6291   0060
        SDBD                                    ; 6292   0001
        MVII    #$6318, R5                      ; 6293   02BD 0018 0063
L_6296:
        CMP@    R5,     R0                      ; 6296   0368
        BLT     L_629C                          ; 6297   0205 0003

        INCR    R5                              ; 6299   000D
        B       L_6296                          ; 629A   0220 0005

L_629C:
        MVI@    R5,     R2                      ; 629C   02AA
        SWAP    R2,     1                       ; 629D   0042
        MOVR    R0,     R5                      ; 629E   0085
        SDBD                                    ; 629F   0001
        ADDI    #$6328, R5                      ; 62A0   02FD 0028 0063
        MVI@    R5,     R0                      ; 62A3   02A8
        SARC    R0,     1                       ; 62A4   0078
        BC      L_62AB                          ; 62A5   0201 0004

        SDBD                                    ; 62A7   0001
        XORI    #$0800, R0                      ; 62A8   03F8 0000 0008
L_62AB:
        XORR    R2,     R0                      ; 62AB   01D0
        MVI     G_01D9, R2                      ; 62AC   0282 01D9
        TSTR    R2                              ; 62AE   0092
        BEQ     L_62BE                          ; 62AF   0204 000D

        MOVR    R0,     R2                      ; 62B1   0082
        SLLC    R2,     1                       ; 62B2   005A
        BNC     L_62B9                          ; 62B3   0209 0004

        SDBD                                    ; 62B5   0001
        ADDI    #$0400, R0                      ; 62B6   02F8 0000 0004
L_62B9:
        SLLC    R2,     1                       ; 62B9   005A
        BNC     L_62BE                          ; 62BA   0209 0002

        ADDI    #$0018, R0                      ; 62BC   02F8 0018
L_62BE:
        PULR    R2                              ; 62BE   02B2
        SDBD                                    ; 62BF   0001
        ANDI    #$3FFF, R0                      ; 62C0   03B8 00FF 003F
L_62C3:
        MVO@    R0,     R4                      ; 62C3   0260
        DECR    R2                              ; 62C4   0012
        DECR    R3                              ; 62C5   0013
        BNEQ    L_62C3                          ; 62C6   022C 0004

        PULR    R5                              ; 62C8   02B5
        DECR    R1                              ; 62C9   0011
        TSTR    R2                              ; 62CA   0092
        BNEQ    L_6289                          ; 62CB   022C 0043

        PULR    R2                              ; 62CD   02B2
        PULR    R4                              ; 62CE   02B4
        ADDI    #$0014, R4                      ; 62CF   02FC 0014
        TSTR    R1                              ; 62D1   0089
        BNEQ    L_6287                          ; 62D2   022C 004C
        PULR    R7                              ; 62D4   02B7

        DECLE   $0007,  $0009,  $023C,  $0000   ; 62D5   0007 0009 023C 0000
        DECLE   $0001,  $0001,  $0001,  $0059   ; 62D9   0001 0001 0001 0059
        DECLE   $0090,  $006A,  $0002,  $0002   ; 62DD   0090 006A 0002 0002
        DECLE   $0002,  $0001,  $0001,  $0061   ; 62E1   0002 0001 0001 0061
        DECLE   $0000,  $0010,  $0000,  $0072   ; 62E5   0000 0010 0000 0072
        DECLE   $0002,  $0002,  $0001,  $0001   ; 62E9   0002 0002 0001 0001
        DECLE   $0059,  $0000,  $0010,  $0000   ; 62ED   0059 0000 0010 0000
        DECLE   $006A,  $0002,  $0002,  $0001   ; 62F1   006A 0002 0002 0001
        DECLE   $0061,  $0000,  $0000,  $0010   ; 62F5   0061 0000 0000 0010
        DECLE   $0000,  $0000,  $0072,  $0002   ; 62F9   0000 0000 0072 0002
        DECLE   $0001,  $0059,  $0000,  $0000   ; 62FD   0001 0059 0000 0000
        DECLE   $0010,  $0000,  $0000,  $006A   ; 6301   0010 0000 0000 006A
        DECLE   $0002,  $0061,  $0000,  $0000   ; 6305   0002 0061 0000 0000
        DECLE   $0000,  $0020,  $0000,  $0000   ; 6309   0000 0020 0000 0000
        DECLE   $0000,  $0072,  $0059,  $0000   ; 630D   0000 0072 0059 0000
        DECLE   $0000,  $0000,  $0020,  $0000   ; 6311   0000 0000 0020 0000
        DECLE   $0000,  $0000                   ; 6315   0000 0000

        SAR     R2,     1                       ; 6317   006A
        INCR    R3                              ; 6318   000B
        DECR    R2                              ; 6319   0012
        INCR    R7                              ; 631A   000F

        DECLE   $0000                           ; 631B   0000
L_631C:
        DECR    R0                              ; 631C   0010
        DECLE   $0022,  $0012,  $0016,  $0016   ; 631D   0022 0012 0016 0016
        DECLE   $0090,  $0018,  $0062,  $001B   ; 6321   0090 0018 0062 001B
        DECLE   $00D0,  $001C,  $0040,  $0001   ; 6325   00D0 001C 0040 0001
        DECLE   $0084,  $0112,  $0102,  $025D   ; 6329   0084 0112 0102 025D
        DECLE   $026D,  $000C,  $001C,  $01AE   ; 632D   026D 000C 001C 01AE
        DECLE   $01BE,  $01CE,  $0001,  $012E   ; 6331   01BE 01CE 0001 012E
        DECLE   $023E,  $024E,  $0001,  $0200   ; 6335   023E 024E 0001 0200
        DECLE   $020A,  $01D2,  $01E2,  $01F2   ; 6339   020A 01D2 01E2 01F2
        DECLE   $0001,  $0268,  $0270,  $0250   ; 633D   0001 0268 0270 0250
        DECLE   $0268,  $025A,  $0266,  $0042   ; 6341   0268 025A 0266 0042
        DECLE   $0014,  $0058,  $0068,  $0048   ; 6345   0014 0058 0068 0048
        DECLE   $005A,  $0050,  $005C,  $0070   ; 6349   005A 0050 005C 0070
        DECLE   $0048,  $005A,  $0050,  $0059   ; 634D   0048 005A 0050 0059
        DECLE   $005A,  $0042,  $005A,  $0009   ; 6351   005A 0042 005A 0009
        DECLE   $005A,  $0042,  $005A,  $005F   ; 6355   005A 0042 005A 005F
        DECLE   $005F,  $005B,  $005F,  $0058   ; 6359   005F 005B 005F 0058
        DECLE   $0010,  $0018,  $005F,  $0058   ; 635D   0010 0018 005F 0058
        DECLE   $005F,  $0058,  $0001,  $005F   ; 6361   005F 0058 0001 005F
        DECLE   $0058,  $005F,  $0058,  $0001   ; 6365   0058 005F 0058 0001
        DECLE   $005F,  $0058,  $005F,  $005F   ; 6369   005F 0058 005F 005F
        DECLE   $005B,  $005F,  $0058,  $0009   ; 636D   005B 005F 0058 0009
        DECLE   $005F,  $0058,  $005F,  $005F   ; 6371   005F 0058 005F 005F
        DECLE   $005B,  $005F,  $0058,  $0010   ; 6375   005B 005F 0058 0010
        DECLE   $0018,  $005F,  $0058,  $0000   ; 6379   0018 005F 0058 0000
        DECLE   $0020,  $0030,  $0028,  $0007   ; 637D   0020 0030 0028 0007
        DECLE   $0020,  $0038,  $0028,  $0004   ; 6381   0020 0038 0028 0004
        DECLE   $0007,  $0007,  $0003,  $0009   ; 6385   0007 0007 0003 0009
        DECLE   $00E3,  $0000,  $00FF,  $0000   ; 6389   00E3 0000 00FF 0000
        DECLE   $03FF,  $007E,  $0142,  $037E   ; 638D   03FF 007E 0142 037E
        DECLE   $00FF,  $0012,  $00E3,  $0000   ; 6391   00FF 0012 00E3 0000
        DECLE   $00FF,  $0000,  $03FF,  $001C   ; 6395   00FF 0000 03FF 001C
        DECLE   $0072,  $0094,  $003A,  $0051   ; 6399   0072 0094 003A 0051
        DECLE   $009C,  $0032,  $0051,  $0100   ; 639D   009C 0032 0051 0100
        DECLE   $007F,  $0041,  $017F,  $0141   ; 63A1   007F 0041 017F 0141
        DECLE   $0010,  $0008,  $0059,  $0090   ; 63A5   0010 0008 0059 0090
        DECLE   $0098,  $00A0,  $00AA,  $0059   ; 63A9   0098 00A0 00AA 0059
        DECLE   $00AD,  $0080,  $0058,  $00C0   ; 63AD   00AD 0080 0058 00C0
        DECLE   $0080,  $0059,  $0081,  $005B   ; 63B1   0080 0059 0081 005B
        DECLE   $00D9,  $0059,  $001E,  $0009   ; 63B5   00D9 0059 001E 0009
        DECLE   $007F,  $0078,  $007D,  $00B0   ; 63B9   007F 0078 007D 00B0
        DECLE   $0079,  $0079,  $00B0,  $0090   ; 63BD   0079 0079 00B0 0090
        DECLE   $0098,  $00A0,  $00C8,  $00A9   ; 63C1   0098 00A0 00C8 00A9
        DECLE   $0079,  $00B0,  $00A9,  $00C9   ; 63C5   0079 00B0 00A9 00C9
        DECLE   $00A9,  $00B0,  $0088,  $00B0   ; 63C9   00A9 00B0 0088 00B0
        DECLE   $00D0,  $0088,  $00B1,  $0089   ; 63CD   00D0 0088 00B1 0089
        DECLE   $00B2,  $00B9,  $00B2,  $0078   ; 63D1   00B2 00B9 00B2 0078
        DECLE   $007F,  $0078,  $0010,  $000C   ; 63D5   007F 0078 0010 000C
        DECLE   $00B5,  $0001,  $0000,  $0030   ; 63D9   00B5 0001 0000 0030
        DECLE   $00F7,  $0063,  $003E,  $0008   ; 63DD   00F7 0063 003E 0008
        DECLE   $00CA,  $0000,  $0005,  $0000   ; 63E1   00CA 0000 0005 0000
        DECLE   $00FA,  $0063,  $0068,  $000C   ; 63E5   00FA 0063 0068 000C
        DECLE   $00B5,  $0001,  $0002,  $0030   ; 63E9   00B5 0001 0002 0030
        DECLE   $00F7,  $0063,  $0096,  $0008   ; 63ED   00F7 0063 0096 0008
        DECLE   $00CA,  $0000,  $0005,  $0000   ; 63F1   00CA 0000 0005 0000
        DECLE   $00FA,  $0063,  $00FD,  $0063   ; 63F5   00FA 0063 00FD 0063
        DECLE   $0001,  $000D,  $0064,  $0001   ; 63F9   0001 000D 0064 0001
        DECLE   $0004,  $001E,  $003E,  $007E   ; 63FD   0004 001E 003E 007E
        DECLE   $0046,  $0056,  $00D6,  $00F6   ; 6401   0046 0056 00D6 00F6
        DECLE   $00D6,  $00FE,  $00FE,  $003F   ; 6405   00D6 00FE 00FE 003F
        DECLE   $001F,  $000F,  $0007,  $0000   ; 6409   001F 000F 0007 0000
        DECLE   $0040,  $0020,  $0020,  $0010   ; 640D   0040 0020 0020 0010
        DECLE   $0070,  $0050,  $0050,  $0070   ; 6411   0070 0050 0050 0070
        DECLE   $0030,  $0050,  $0050,  $0048   ; 6415   0030 0050 0050 0048
        DECLE   $0048,  $0048,  $0048,  $0030   ; 6419   0048 0048 0048 0030
        DECLE   $0028,  $0008,  $0088,  $0000   ; 641D   0028 0008 0088 0000
        DECLE   $0007,  $0000,  $003D,  $0064   ; 6421   0007 0000 003D 0064
        DECLE   $0028,  $0008,  $0088,  $0000   ; 6425   0028 0008 0088 0000
        DECLE   $0001,  $0000,  $0040,  $0064   ; 6429   0001 0000 0040 0064
        DECLE   $0080,  $0008,  $0088,  $0000   ; 642D   0080 0008 0088 0000
        DECLE   $0007,  $0000,  $003D,  $0064   ; 6431   0007 0000 003D 0064
        DECLE   $0080,  $0008,  $0088,  $0000   ; 6435   0080 0008 0088 0000
        DECLE   $0001,  $0000,  $0040,  $0064   ; 6439   0001 0000 0040 0064
        DECLE   $0043,  $0064,  $0002,  $0063   ; 643D   0043 0064 0002 0063
        DECLE   $0064,  $0001,  $0000,  $0000   ; 6441   0064 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6445   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0081   ; 6449   0000 0000 0000 0081
        DECLE   $0081,  $0024,  $007E,  $0024   ; 644D   0081 0024 007E 0024
        DECLE   $0000,  $0000,  $0018,  $0000   ; 6451   0000 0000 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6455   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0081   ; 6459   0000 0000 0000 0081
        DECLE   $0081,  $0024,  $007E,  $0024   ; 645D   0081 0024 007E 0024
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6461   0000 0000 0000 0000
        DECLE   $007E,  $007E,  $0042,  $00C3   ; 6465   007E 007E 0042 00C3
        DECLE   $00CB,  $00CB,  $00FF,  $00FF   ; 6469   00CB 00CB 00FF 00FF
        DECLE   $003C,  $00FF,  $0081,  $0081   ; 646D   003C 00FF 0081 0081
        DECLE   $0081,  $0081,  $0015,  $0034   ; 6471   0081 0081 0015 0034
        DECLE   $004D,  $0062,  $0073,  $0094   ; 6475   004D 0062 0073 0094
        DECLE   $009E,  $00C3,  $00E2,  $0104   ; 6479   009E 00C3 00E2 0104
        DECLE   $010E,  $0125,  $012C,  $013F   ; 647D   010E 0125 012C 013F
        DECLE   $0155,  $016A,  $0189,  $0199   ; 6481   0155 016A 0189 0199
        DECLE   $01B6,  $01C8,  $01E4,  $0005   ; 6485   01B6 01C8 01E4 0005
        DECLE   $0103,  $0006,  $0105,  $0142   ; 6489   0103 0006 0105 0142
        DECLE   $0082,  $00C2,  $0183,  $0102   ; 648D   0082 00C2 0183 0102
        DECLE   $01C4,  $00C2,  $0183,  $0102   ; 6491   01C4 00C2 0183 0102
        DECLE   $00C5,  $014B,  $0103,  $00C3   ; 6495   00C5 014B 0103 00C3
        DECLE   $0102,  $0003,  $0103,  $0004   ; 6499   0102 0003 0103 0004
        DECLE   $0103,  $0000,  $0000           ; 649D   0103 0000 0000

        EIS                                     ; 64A0   0002
        DECR    R3                              ; 64A1   0013
        DIS                                     ; 64A2   0003

        JSR     R4,     .EXEC.011               ; 64A3   0004 0010 0011
        DECLE   $0012,  $0001,  $0103,  $0145   ; 64A6   0012 0001 0103 0145
        DECLE   $0088,  $01C4,  $0102,  $00D0   ; 64AA   0088 01C4 0102 00D0
        DECLE   $01C6,  $0102,  $01CD,  $0018   ; 64AE   01C6 0102 01CD 0018
        DECLE   $0105,  $0010,  $0105,  $0145   ; 64B2   0105 0010 0105 0145
        DECLE   $0085,  $01C4,  $0102,  $0000   ; 64B6   0085 01C4 0102 0000
        DECLE   $0212,  $021D,  $020B,  $0209   ; 64BA   0212 021D 020B 0209
        DECLE   $020A,  $020C,  $0065,  $0102   ; 64BE   020A 020C 0065 0102
        DECLE   $0004                           ; 64C2   0004

        CMPR    R0,     R5                      ; 64C3   0145
        ADDR    R0,     R7                      ; 64C4   00C7

        DECLE   $0144,  $0102,  $0081,  $0102   ; 64C5   0144 0102 0081 0102
        DECLE   $0181,  $0104,  $014B,  $000D   ; 64C9   0181 0104 014B 000D
        DECLE   $0147,  $0102,  $0000,  $0016   ; 64CD   0147 0102 0000 0016
        DECLE   $0044,  $0043,  $0001,  $0210   ; 64D1   0044 0043 0001 0210

        SLLC    R2,     2                       ; 64D5   005E
        SUBR    R0,     R2                      ; 64D6   0102
        XORR    R0,     R3                      ; 64D7   01C3
        ADDR    R0,     R6                      ; 64D8   00C6
        XORR    R0,     R2                      ; 64D9   01C2
        ADDR    R1,     R7                      ; 64DA   00CF

        XORR    R1,     R2                      ; 64DB   01CA
        SUBR    R0,     R3                      ; 64DC   0103
L_64DD:
        ADDR    R0,     R3                      ; 64DD   00C3
        DECLE   $0102,  $00C4,  $0102,  $0000   ; 64DE   0102 00C4 0102 0000
        DECLE   $021F,  $0235,  $0236,  $0237   ; 64E2   021F 0235 0236 0237

        RLC     R0,     1                       ; 64E6   0050
        SUBR    R0,     R3                      ; 64E7   0103
        ADDR    R0,     R3                      ; 64E8   00C3
        SUBR    R0,     R2                      ; 64E9   0102
        MOVR    R0,     R4                      ; 64EA   0084
        EIS                                     ; 64EB   0002
        CMPR    R0,     R3                      ; 64EC   0143
        RLC     R0,     1                       ; 64ED   0050
        SUBR    R0,     R2                      ; 64EE   0102
        XORR    R0,     R3                      ; 64EF   01C3
        MOVR    R0,     R7                      ; 64F0   0087

        DECLE   $0203,  $0102,  $0211           ; 64F1   0203 0102 0211

        SUBR    R0,     R2                      ; 64F4   0102
        ADDR    R0,     R6                      ; 64F5   00C6
        SUBR    R0,     R6                      ; 64F6   0106
        ANDR    R0,     R1                      ; 64F7   0181
        SUBR    R0,     R7                      ; 64F8   0107

        DECLE   $018C,  $0102,  $0181,  $0106   ; 64F9   018C 0102 0181 0106
        DECLE   $0000,  $0201,  $0203,  $0221   ; 64FD   0000 0201 0203 0221
        DECLE   $0226,  $0233,  $0205,  $0208   ; 6501   0226 0233 0205 0208
        DECLE   $020E,  $020D,  $0008,  $0102   ; 6505   020E 020D 0008 0102
        DECLE   $0181,  $0102,  $004A,  $0102   ; 6509   0181 0102 004A 0102
        DECLE   $0000,  $0200,  $0219,  $001A   ; 650D   0000 0200 0219 001A
        DECLE   $000A,  $0102,  $0181,  $0105   ; 6511   000A 0102 0181 0105
        DECLE   $0182,  $0102,  $004C,  $0102   ; 6515   0182 0102 004C 0102
        DECLE   $0042,  $0102,  $004E,  $0102   ; 6519   0042 0102 004E 0102
        DECLE   $01C3,  $0102,  $018A,  $0103   ; 651D   01C3 0102 018A 0103
        DECLE   $018A,  $0147,  $0003,  $0102   ; 6521   018A 0147 0003 0102
        DECLE   $0006,  $0146,  $0102,  $0142   ; 6525   0006 0146 0102 0142
        DECLE   $0102,  $0000,  $0216,  $0202   ; 6529   0102 0000 0216 0202
        DECLE   $0215,  $021B,  $021A,  $0223   ; 652D   0215 021B 021A 0223
        DECLE   $0229,  $022B,  $022D,  $023D   ; 6531   0229 022B 022D 023D
        DECLE   $023E                           ; 6535   023E

        INCR    R7                              ; 6536   000F

        SUBR    R0,     R2                      ; 6537   0102
L_6538:
        CMPR    R0,     R3                      ; 6538   0143
        DECLE   $0102,  $0042,  $0102,  $0046   ; 6539   0102 0042 0102 0046
        DECLE   $0102,  $0046,  $01C9,  $0102   ; 653D   0102 0046 01C9 0102
        DECLE   $0002,  $0102,  $0003,  $0142   ; 6541   0002 0102 0003 0142
        DECLE   $0102,  $01C9,  $0102,  $0148   ; 6545   0102 01C9 0102 0148
        DECLE   $01C8,  $0102,  $0000,  $0019   ; 6549   01C8 0102 0000 0019
        DECLE   $0015,  $0014,  $0027,  $0022   ; 654D   0015 0014 0027 0022
        DECLE   $0021,  $0020,  $001E,  $001D   ; 6551   0021 0020 001E 001D
        DECLE   $0028,  $0103,  $0044,  $0102   ; 6555   0028 0103 0044 0102
        DECLE   $004A,  $01C3,  $0102,  $0146   ; 6559   004A 01C3 0102 0146
        DECLE   $0086,  $0102,  $0086,  $0189   ; 655D   0086 0102 0086 0189
        DECLE   $0103,  $00C4,  $0144,  $01C4   ; 6561   0103 00C4 0144 01C4
        DECLE   $0102,  $014B,  $0103,  $0082   ; 6565   0102 014B 0103 0082
        DECLE   $0102,  $0084,  $0146,  $0102   ; 6569   0102 0084 0146 0102
        DECLE   $0000,  $0213,  $0214,  $021C   ; 656D   0000 0213 0214 021C
        DECLE   $0224,  $022A,  $0230,  $023B   ; 6571   0224 022A 0230 023B
        DECLE   $0241,  $0239,  $0054,  $0102   ; 6575   0241 0239 0054 0102
        DECLE   $0084,  $014A,  $0001,  $0144   ; 6579   0084 014A 0001 0144
        DECLE   $0102,  $0000                   ; 657D   0102 0000

        BEQ     L_67A1                          ; 657F   0204 0220

        SLLC    R2,     1                       ; 6581   005A
        SUBR    R0,     R3                      ; 6582   0103
        MOVR    R0,     R7                      ; 6583   0087

        DECLE   $014A,  $0102,  $0147,  $0102   ; 6584   014A 0102 0147 0102
        DECLE   $01C4,  $0143,  $0102,  $00C5   ; 6588   01C4 0143 0102 00C5
        DECLE   $01C6,  $0210,  $0102,  $00C5   ; 658C   01C6 0210 0102 00C5
        DECLE   $0102,  $0000,  $0211,  $021E   ; 6590   0102 0000 0211 021E
        DECLE   $001F,  $0228,  $0234,  $0036   ; 6594   001F 0228 0234 0036
        DECLE   $0011,  $0102,  $0086,  $0102   ; 6598   0011 0102 0086 0102
        DECLE   $0000                           ; 659C   0000

        COMR    R3                              ; 659D   001B
        COMR    R4                              ; 659E   001C
        COMR    R1                              ; 659F   0019
        SUBR    R0,     R2                      ; 65A0   0102
        SWAP    R1,     2                       ; 65A1   0045
        CMPR    R0,     R3                      ; 65A2   0143
        SUBR    R0,     R2                      ; 65A3   0102
        CMPR    R0,     R7                      ; 65A4   0147
        MOVR    R0,     R7                      ; 65A5   0087

        DECLE   $0102,  $01C5,  $0102,  $0205   ; 65A6   0102 01C5 0102 0205
        DECLE   $0143,  $0102,  $0000,  $0023   ; 65AA   0143 0102 0000 0023
        DECLE   $0024,  $0025,  $0026,  $0028   ; 65AE   0024 0025 0026 0028
        DECLE   $0023,  $0102,  $0188,  $0104   ; 65B2   0023 0102 0188 0104
        DECLE   $00C6,  $0102,  $0209,  $0102   ; 65B6   00C6 0102 0209 0102
        DECLE   $0207,  $0102,  $0205,  $0102   ; 65BA   0207 0102 0205 0102
        DECLE   $00C3,  $0103,  $0000           ; 65BE   00C3 0103 0000

        ADCR    R3                              ; 65C1   002B
        ADCR    R4                              ; 65C2   002C
        ADCR    R2                              ; 65C3   002A
        ADCR    R7                              ; 65C4   002F

        GSWD    R3                              ; 65C5   0033
L_65C6:
        NOP                                     ; 65C6   0034
        DECLE   $0035,  $0037,  $0102,  $0002   ; 65C7   0035 0037 0102 0002
        DECLE   $0145,  $0102,  $0147,  $0102   ; 65CB   0145 0102 0147 0102
        DECLE   $0149,  $0103,  $00C6,  $0183   ; 65CF   0149 0103 00C6 0183
        DECLE   $0104,  $0003,  $0103,  $0000   ; 65D3   0104 0003 0103 0000
        DECLE   $002D,  $002E,  $0030,  $0031   ; 65D7   002D 002E 0030 0031
        DECLE   $0005,  $0037                   ; 65DB   0005 0037

        SLL     R3,     1                       ; 65DD   004B
        SUBR    R0,     R2                      ; 65DE   0102
        INCR    R0                              ; 65DF   0008
        SUBR    R0,     R2                      ; 65E0   0102
        EIS                                     ; 65E1   0002
        CMPR    R0,     R7                      ; 65E2   0147
        SUBR    R0,     R2                      ; 65E3   0102
        CMPR    R1,     R0                      ; 65E4   0148
        ANDR    R0,     R2                      ; 65E5   0182
        SUBR    R0,     R3                      ; 65E6   0103
        MOVR    R0,     R7                      ; 65E7   0087

        DECLE   $0102,  $0144,  $01C4,  $0102   ; 65E8   0102 0144 01C4 0102
        DECLE   $0187,  $0102,  $0181,  $0104   ; 65EC   0187 0102 0181 0104
        DECLE   $0004,  $0104,  $0000,  $0240   ; 65F0   0004 0104 0000 0240
        DECLE   $003F,  $003D,  $003C,  $003B   ; 65F4   003F 003D 003C 003B
        DECLE   $0032,  $0008,  $0006,  $0009   ; 65F8   0032 0008 0006 0009
        DECLE   $0051,  $0102,  $0145,  $008C   ; 65FC   0051 0102 0145 008C
        DECLE   $0102,  $0185,  $0102,  $0145   ; 6600   0102 0185 0102 0145
        DECLE   $0085,  $000A,  $0102,  $0000   ; 6604   0085 000A 0102 0000

        SWAP    R1,     1                       ; 6608   0041
        INCR    R7                              ; 6609   000F

        INCR    R6                              ; 660A   000E
L_660B:
        INCR    R2                              ; 660B   000A
        DECLE   $005F,  $0102,  $000A,  $0102   ; 660C   005F 0102 000A 0102
        DECLE   $0005,  $0145,  $0102,  $0144   ; 6610   0005 0145 0102 0144
        DECLE   $0102,  $0147,  $0104,  $0181   ; 6614   0102 0147 0104 0181
        DECLE   $0106,  $0181,  $0106,  $000A   ; 6618   0106 0181 0106 000A
        DECLE   $0104,  $0006,  $0102,  $0000   ; 661C   0104 0006 0102 0000
        DECLE   $0040,  $003E,  $003A,  $0039   ; 6620   0040 003E 003A 0039
        DECLE   $0018,  $0038,  $000D,  $0007   ; 6624   0018 0038 000D 0007
        DECLE   $000C,  $0014,  $0102,  $018B   ; 6628   000C 0014 0102 018B
        DECLE   $0105,  $0186,  $0146,  $0102   ; 662C   0105 0186 0146 0102
        DECLE   $0149,  $0182,  $0104,  $0149   ; 6630   0149 0182 0104 0149
        DECLE   $0102,  $0000,  $0029,  $022C   ; 6634   0102 0000 0029 022C
        DECLE   $022E,  $023C,  $023A           ; 6638   022E 023C 023A

        SWAP    R2,     2                       ; 663B   0046
        SUBR    R0,     R2                      ; 663C   0102
        XORR    R0,     R4                      ; 663D   01C4
        CMPR    R0,     R3                      ; 663E   0143
        MOVR    R0,     R3                      ; 663F   0083
        SUBR    R0,     R3                      ; 6640   0103
        BNEQ    L_67C7                          ; 6641   020C 0184

        SUBR    R0,     R3                      ; 6643   0103
        ADDR    R0,     R7                      ; 6644   00C7

        DECLE   $0103,  $00CC,  $0102,  $0188   ; 6645   0103 00CC 0102 0188
        DECLE   $0106,  $0185,  $0102,  $0181   ; 6649   0106 0185 0102 0181
        DECLE   $0106,  $0000,  $0222,  $0225   ; 664D   0106 0000 0222 0225
        DECLE   $022F,  $0231,  $0232,  $0217   ; 6651   022F 0231 0232 0217
        DECLE   $020F,  $0238,  $0009,  $0102   ; 6655   020F 0238 0009 0102
        DECLE   $0001,  $0081,  $0102,  $0001   ; 6659   0001 0081 0102 0001
        DECLE   $0102,  $0000,  $0244,  $0242   ; 665D   0102 0000 0244 0242
        DECLE   $0243,  $0000,  $0018,  $002D   ; 6661   0243 0000 0018 002D
        DECLE   $0045,  $005D,  $006F,  $0089   ; 6665   0045 005D 006F 0089
        DECLE   $00A0,  $00B9,  $0002,  $0006   ; 6669   00A0 00B9 0002 0006
        DECLE   $0001,  $0002,  $0013,  $0100   ; 666D   0001 0002 0013 0100
        DECLE   $001C,  $0008,  $0300,  $0000   ; 6671   001C 0008 0300 0000
        DECLE   $0038,  $007C,  $0010,  $0012   ; 6675   0038 007C 0010 0012
        DECLE   $0016,  $0100,  $003C,  $007E   ; 6679   0016 0100 003C 007E
        DECLE   $00FF                           ; 667D   00FF

        DECR    R0                              ; 667E   0010
        DECR    R1                              ; 667F   0011
L_6680:
        DECR    R7                              ; 6680   0017

        DECR    R1                              ; 6681   0011
L_6682:
        DECR    R7                              ; 6682   0017

        DECLE   $0006,  $0006,  $0004           ; 6683   0006 0006 0004

        JSR     R4,     .EXEC.300               ; 6686   0004 0010 0300

        SUBR    R0,     R0                      ; 6689   0100
        DECR    R0                              ; 668A   0010
        RSWD    R0                              ; 668B   0038
        SUB     .STIC.A.4,R0                    ; 668C   0300 0014
        RSWD    R4                              ; 668E   003C
        RSWD    R0                              ; 668F   0038
L_6690:
        COMR    R0                              ; 6690   0018
        DECLE   $0010,  $001A,  $009A,  $00DE   ; 6691   0010 001A 009A 00DE
        DECLE   $007C,  $0018,  $011A,  $0026   ; 6695   007C 0018 011A 0026
        DECLE   $0026,  $0004,  $0004,  $0013   ; 6699   0026 0004 0004 0013
        DECLE   $0300,  $0000,  $0010,  $0038   ; 669D   0300 0000 0010 0038
        DECLE   $0010,  $0100,  $0038,  $007C   ; 66A1   0010 0100 0038 007C
        DECLE   $00FE,  $007C,  $0110,  $002C   ; 66A5   00FE 007C 0110 002C
        DECLE   $007E,  $00FF,  $007E,  $00FF   ; 66A9   007E 00FF 007E 00FF
        DECLE   $005A,  $0018,  $003C,  $0034   ; 66AD   005A 0018 003C 0034
        DECLE   $0034,  $0000,  $0000           ; 66B1   0034 0000 0000

        DECR    R3                              ; 66B4   0013
        SUB     .STIC.X.0,R0                    ; 66B5   0300 0000
        DECR    R0                              ; 66B7   0010
        RSWD    R0                              ; 66B8   0038
        DECR    R0                              ; 66B9   0010
        B       L_66C4                          ; 66BA   0200 0008

        RLC     R0,     1                       ; 66BC   0050
        RSWD    R0                              ; 66BD   0038
        DECR    R4                              ; 66BE   0014
        RSWD    R0                              ; 66BF   0038
        SWAP    R0,     1                       ; 66C0   0040
        SWAP    R2,     2                       ; 66C1   0046
        ADCR    R0                              ; 66C2   0028
        COMR    R0                              ; 66C3   0018
L_66C4:
        NOP                                     ; 66C4   0034
        DECLE   $00D2,  $003A,  $007C,  $0010   ; 66C5   00D2 003A 007C 0010
        DECLE   $0010,  $0000,  $0000,  $000D   ; 66C9   0010 0000 0000 000D
        DECLE   $0300,  $0100,  $0030,  $0010   ; 66CD   0300 0100 0030 0010
        DECLE   $0300,  $0070,  $0050,  $0110   ; 66D1   0300 0070 0050 0110
        DECLE   $0078,  $0048,  $00E8,  $0048   ; 66D5   0078 0048 00E8 0048
        DECLE   $0308,  $0034,  $0034,  $0005   ; 66D9   0308 0034 0034 0005
        DECLE   $0005,  $0015,  $0300,  $0000   ; 66DD   0005 0015 0300 0000
        DECLE   $0010,  $0038,  $0010,  $0000   ; 66E1   0010 0038 0010 0000
        DECLE   $0000,  $0010,  $0038,  $001C   ; 66E5   0000 0010 0038 001C
        DECLE   $0038,  $007C,  $0010,  $0010   ; 66E9   0038 007C 0010 0010
        DECLE   $0038,  $001C,  $0038,  $007E   ; 66ED   0038 001C 0038 007E
        DECLE   $00FF,  $007E,  $0018,  $0016   ; 66F1   00FF 007E 0018 0016
        DECLE   $0016,  $0000,  $0000           ; 66F5   0016 0000 0000

        DECR    R2                              ; 66F8   0012
        SUB     .STIC.X.0,R0                    ; 66F9   0300 0000
        INCR    R0                              ; 66FB   0008
        GSWD    R0                              ; 66FC   0030
        DECR    R0                              ; 66FD   0010
        B       L_670F                          ; 66FE   0200 000F

        DECLE   $007B,  $0052,  $0012,  $003A   ; 6700   007B 0052 0012 003A
        DECLE   $001C,  $007F,  $00F7,  $00E2   ; 6704   001C 007F 00F7 00E2
        DECLE   $00C2,  $0142,  $00F2,  $0022   ; 6708   00C2 0142 00F2 0022
        DECLE   $0022,  $0000,  $0000           ; 670C   0022 0000 0000
L_670F:
        DECR    R4                              ; 670F   0014
        DECLE   $0300,  $0000,  $0010,  $003C   ; 6710   0300 0000 0010 003C
        DECLE   $0014,  $0100,  $00A0,  $0040   ; 6714   0014 0100 00A0 0040
        DECLE   $00C0,  $0078,  $007C,  $0028   ; 6718   00C0 0078 007C 0028
        DECLE   $00A8,  $0050,  $0060,  $00E0   ; 671C   00A8 0050 0060 00E0
        DECLE   $003E,  $003F,  $0066,  $0055   ; 6720   003E 003F 0066 0055
        DECLE   $0024,  $0024,  $0000,  $0000   ; 6724   0024 0024 0000 0000

        INCR    R4                              ; 6728   000C
        SUB     .ISRVEC.0,R0                    ; 6729   0300 0100
        RSWD    R0                              ; 672B   0038
        DECR    R0                              ; 672C   0010
        B       L_6759                          ; 672D   0200 002A

        DECLE   $003E,  $0208,  $0099,  $00FF   ; 672F   003E 0208 0099 00FF
        DECLE   $0318,  $0118,  $0000,  $000A   ; 6733   0318 0118 0000 000A
        DECLE   $0012,  $001D,  $0026,  $0032   ; 6737   0012 001D 0026 0032
        DECLE   $003C,  $0047,  $0053,  $0006   ; 673B   003C 0047 0053 0006
        DECLE   $0006,  $0001,  $01F0,  $0005   ; 673F   0006 0001 01F0 0005
        DECLE   $0300,  $0000,  $0030,  $007C   ; 6743   0300 0000 0030 007C
        DECLE   $00FF,  $000F,  $0003,  $0004   ; 6747   00FF 000F 0003 0004
        DECLE   $0196,  $0003,  $0300,  $0200   ; 674B   0196 0003 0300 0200
        DECLE   $00FF,  $0012,  $0007,  $0007   ; 674F   00FF 0012 0007 0007
        DECLE   $009C,  $0006,  $0200,  $0030   ; 6753   009C 0006 0200 0030

        SARC    R0,     1                       ; 6757   0078
        SAR     R0,     2                       ; 6758   006C
L_6759:
        ADDR    R2,     R6                      ; 6759   00D6
        DECLE   $00BF,  $0000,  $0004,  $0000   ; 675A   00BF 0000 0004 0000
        DECLE   $0177,  $0004,  $0300,  $0100   ; 675E   0177 0004 0300 0100
        DECLE   $00AA,  $00FF,  $0003,  $0000   ; 6762   00AA 00FF 0003 0000
        DECLE   $0006,  $010C,  $0007,  $007C   ; 6766   0006 010C 0007 007C
        DECLE   $0054,  $007C,  $0054,  $007C   ; 676A   0054 007C 0054 007C
        DECLE   $0054,  $01FF,  $0015,  $0004   ; 676E   0054 01FF 0015 0004
        DECLE   $0004,  $0159,  $0005,  $0300   ; 6772   0004 0159 0005 0300
        DECLE   $0000,  $0010,  $0038,  $0010   ; 6776   0000 0010 0038 0010
        DECLE   $000C,  $0000,  $0000,  $00D6   ; 677A   000C 0000 0000 00D6
        DECLE   $0006,  $00AA,  $0010,  $0222   ; 677E   0006 00AA 0010 0222
        DECLE   $007F,  $0055,  $007F,  $0009   ; 6782   007F 0055 007F 0009
        DECLE   $0000,  $0004,  $0189,  $0007   ; 6786   0000 0004 0189 0007
        DECLE   $0100,  $00A0,  $0040,  $00C0   ; 678A   0100 00A0 0040 00C0
        DECLE   $0078,  $007C,  $0028,  $0018   ; 678E   0078 007C 0028 0018
        DECLE   $0006,  $0002,  $017B,  $0004   ; 6792   0006 0002 017B 0004

        B       L_67DC                          ; 6796   0200 0044

        TSTR    R1                              ; 6798   0089
        MVI@    R5,     R2                      ; 6799   02AA
        MOVR    R6,     R5                      ; 679A   00B5
        SLR     R3,     2                       ; 679B   0067
        EIS                                     ; 679C   0002
        ADDR    R0,     R5                      ; 679D   00C5
        SLR     R3,     2                       ; 679E   0067
        DIS                                     ; 679F   0003
        ADDR    R3,     R5                      ; 67A0   00DD
L_67A1:
        SLR     R3,     2                       ; 67A1   0067
        DECLE   $0002,  $0005,  $0068,  $0001   ; 67A2   0002 0005 0068 0001
        DECLE   $00ED,  $0067,  $0002,  $00FD   ; 67A6   00ED 0067 0002 00FD
        DECLE   $0067,  $0001,  $0005,  $0068   ; 67AA   0067 0001 0005 0068
        DECLE   $0001,  $00E4,  $0066,  $0001   ; 67AE   0001 00E4 0066 0001
        DECLE   $000D,  $0068,  $0001,  $0000   ; 67B2   000D 0068 0001 0000
        DECLE   $0040,  $007C,  $0050,  $0010   ; 67B6   0040 007C 0050 0010
        DECLE   $0010,  $0010,  $0038,  $0000   ; 67BA   0010 0010 0038 0000
        DECLE   $0000,  $007C,  $0010,  $0010   ; 67BE   0000 007C 0010 0010
        DECLE   $0010,  $0010,  $0038,  $0000   ; 67C2   0010 0010 0038 0000

        COMR    R4                              ; 67C6   001C
L_67C7:
        ADDR    R2,     R4                      ; 67C7   00D4
        DECLE   $00FC,  $00F4,  $00DC,  $00FE   ; 67C8   00FC 00F4 00DC 00FE
        DECLE   $007F,  $0000                   ; 67CC   007F 0000

        COMR    R4                              ; 67CE   001C
        ADDR    R2,     R4                      ; 67CF   00D4
        ADDR    R7,     R4                      ; 67D0   00FC
        ADDR    R6,     R4                      ; 67D1   00F4
        ADDR    R3,     R4                      ; 67D2   00DC
        ADDR    R7,     R6                      ; 67D3   00FE
        ADDR    R5,     R7                      ; 67D4   00EF

        DECLE   $0000                           ; 67D5   0000

        COMR    R4                              ; 67D6   001C
        ADDR    R2,     R4                      ; 67D7   00D4
        ADDR    R7,     R4                      ; 67D8   00FC
        ADDR    R6,     R4                      ; 67D9   00F4
        ADDR    R3,     R4                      ; 67DA   00DC
        ADDR    R7,     R6                      ; 67DB   00FE
L_67DC:
        ADDR    R7,     R5                      ; 67DC   00FD
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67DD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00E6,  $00FF   ; 67E1   0000 0000 00E6 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67E5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0038,  $00FF   ; 67E9   0000 0000 0038 00FF
        DECLE   $0000,  $0000,  $0000           ; 67ED   0000 0000 0000

        ADDR    R0,     R0                      ; 67F0   00C0
        RSWD    R0                              ; 67F1   0038
L_67F2:
        DECR    R7                              ; 67F2   0017

        DECLE   $0013,  $003A,  $0000,  $0000   ; 67F3   0013 003A 0000 0000
        DECLE   $0000,  $0007,  $003B,  $00D2   ; 67F7   0000 0007 003B 00D2
        DECLE   $0012,  $003A,  $0000,  $0000   ; 67FB   0012 003A 0000 0000
        DECLE   $0000,  $0020,  $00B0,  $0060   ; 67FF   0000 0020 00B0 0060
        DECLE   $0022,  $00FF,  $0000,  $0008   ; 6803   0022 00FF 0000 0008
        DECLE   $001C,  $003E,  $006F,  $00D5   ; 6807   001C 003E 006F 00D5
        DECLE   $00BA,  $00FF,  $0000,  $0000   ; 680B   00BA 00FF 0000 0000
        DECLE   $0008,  $007F,  $001C,  $001C   ; 680F   0008 007F 001C 001C
        DECLE   $0008,  $0008,  $0243,  $001F   ; 6813   0008 0008 0243 001F
        DECLE   $03E5,  $0245,  $0042,  $03E4   ; 6817   03E5 0245 0042 03E4
        DECLE   $0160,  $0000,  $00C6,  $0240   ; 681B   0160 0000 00C6 0240
        DECLE   $0000,  $0084,  $01EE,  $0000   ; 681F   0000 0084 01EE 0000
        DECLE   $03E9,  $0047,  $01CE,  $0084   ; 6823   03E9 0047 01CE 0084
        DECLE   $0064,  $01EF,  $03FF,  $002E   ; 6827   0064 01EF 03FF 002E
        DECLE   $0231,  $03FF,  $0263,  $01EF   ; 682B   0231 03FF 0263 01EF
        DECLE   $0084,  $026E,  $03EF,  $0021   ; 682F   0084 026E 03EF 0021
        DECLE   $018E,  $03F0,  $0021,  $02C8   ; 6833   018E 03F0 0021 02C8
        DECLE   $03FF,  $0021,  $0014,  $03F1   ; 6837   03FF 0021 0014 03F1
        DECLE   $003F,  $01B8,  $0231,  $009F   ; 683B   003F 01B8 0231 009F
        DECLE   $0242,  $0210,  $0084,  $00E0   ; 683F   0242 0210 0084 00E0
        DECLE   $0210,  $0273,  $0260,  $0000   ; 6843   0210 0273 0260 0000
        DECLE   $005F,  $0244,  $0000,  $03EA   ; 6847   005F 0244 0000 03EA
        DECLE   $02A0,  $03E0,  $03E1,  $002A   ; 684B   02A0 03E0 03E1 002A
        DECLE   $0000                           ; 684F   0000

        XOR@    R5,     R0                      ; 6850   03E8
        NEGR    R0                              ; 6851   0020
        ADDR    R4,     R7                      ; 6852   00E7

        DECLE   $0108,  $0241,  $00E7,  $00C6   ; 6853   0108 0241 00E7 00C6
        DECLE   $00EE,  $005F,  $03E6,  $01F3   ; 6857   00EE 005F 03E6 01F3
        DECLE   $03FF,  $0273,  $002B,  $0231   ; 685B   03FF 0273 002B 0231
        DECLE   $03FF,  $0082,  $00FF,  $00A5   ; 685F   03FF 0082 00FF 00A5
        DECLE   $0274,  $03E5,  $00C6,  $01E7   ; 6863   0274 03E5 00C6 01E7
        DECLE   $017F,  $00C6,  $00AB,  $03EB   ; 6867   017F 00C6 00AB 03EB
        DECLE   $0108,  $0040,  $03E7           ; 686B   0108 0040 03E7

        NEGR    R1                              ; 686E   0021
        NOP                                     ; 686F   0034
        ADDR    R4,     R7                      ; 6870   00E7

        CMPR    R1,     R2                      ; 6871   014A
        ADCR    R0                              ; 6872   0028
        CMPR    R1,     R2                      ; 6873   014A
        XOR@    R4,     R3                      ; 6874   03E3
        XORR    R4,     R2                      ; 6875   01E2
        ADDR    R4,     R7                      ; 6876   00E7

        DECLE   $013F                           ; 6877   013F

        MVO@    R3,     R1                      ; 6878   024B
        ADDR    R4,     R7                      ; 6879   00E7

        MOVR    R0,     R4                      ; 687A   0084
        XORR    R6,     R1                      ; 687B   01F1
        ADDR    R4,     R7                      ; 687C   00E7

        XOR@    R6,     R3                      ; 687D   03F3
        MOVR    R1,     R7                      ; 687E   008F

        DECLE   $019F,  $00C6,  $0001           ; 687F   019F 00C6 0001

        ANDR    R1,     R4                      ; 6882   018C
        SUBR    R1,     R0                      ; 6883   0108
        RRC     R1,     2                       ; 6884   0075
        ANDR    R1,     R4                      ; 6885   018C
        PSHR    R3                              ; 6886   0273
        SLLC    R0,     1                       ; 6887   0058
        ANDR    R1,     R4                      ; 6888   018C
        MOVR    R0,     R4                      ; 6889   0084
        CMPR    R6,     R5                      ; 688A   0175
        ADDR    R4,     R7                      ; 688B   00E7

        DECLE   $03FF,  $0025,  $03EC,  $014A   ; 688C   03FF 0025 03EC 014A
        DECLE   $01E4,  $025F,  $00C6,  $01CA   ; 6890   01E4 025F 00C6 01CA
        DECLE   $01AD,  $0108,  $0253,  $01BF   ; 6894   01AD 0108 0253 01BF
        DECLE   $00C6,  $0060,  $01AD,  $0252   ; 6898   00C6 0060 01AD 0252
        DECLE   $01AE,  $01DF,  $00C6,  $0120   ; 689C   01AE 01DF 00C6 0120
        DECLE   $01CE,  $0252,  $0142,  $01AD   ; 68A0   01CE 0252 0142 01AD
        DECLE   $0273,  $0184,  $01CE,  $0108   ; 68A4   0273 0184 01CE 0108
        DECLE   $0252,  $01CE,  $0273,  $0048   ; 68A8   0252 01CE 0273 0048
        DECLE   $01EF,  $0273,  $006C,  $01AD   ; 68AC   01EF 0273 006C 01AD
        DECLE   $0084,  $000B,  $01AD,  $014A   ; 68B0   0084 000B 01AD 014A
        DECLE   $0188,  $03ED,  $0063,  $0180   ; 68B4   0188 03ED 0063 0180
        DECLE   $03EA,  $0063,  $018B,  $03EE   ; 68B8   03EA 0063 018B 03EE
        DECLE   $007F,  $01E3,  $0231,  $027F   ; 68BC   007F 01E3 0231 027F

        B       L_6690                          ; 68C0   0220 0231
        SUBR    R3,     R7                      ; 68C2   011F

        DECLE   $00B1,  $0231,  $025F,  $014D   ; 68C3   00B1 0231 025F 014D
        DECLE   $01EF,  $0108,  $0013,  $01EF   ; 68C7   01EF 0108 0013 01EF
        DECLE   $0252,  $026B,  $01EF,  $00C6   ; 68CB   0252 026B 01EF 00C6
        DECLE   $0120,  $0231,  $00DF,  $024F   ; 68CF   0120 0231 00DF 024F
        DECLE   $01FF,  $03FF,  $018C,  $023F   ; 68D3   01FF 03FF 018C 023F
        DECLE   $01FF,  $0015,  $021F           ; 68D7   01FF 0015 021F

        SUBR    R1,     R0                      ; 68DA   0108
        BMI     L_64DD                          ; 68DB   022B 03FF

        XOR@    R6,     R4                      ; 68DD   03F4
        MVO@    R1,     R1                      ; 68DE   0249
        SWAP    R2,     1                       ; 68DF   0042
        MVI@    R3,     R7                      ; 68E0   029F

        MVO@    R1,     R3                      ; 68E1   0259
        SWAP    R2,     1                       ; 68E2   0042
        MVI@    R3,     R7                      ; 68E3   029F

        DECLE   $0058,  $0042,  $0071,  $0046   ; 68E4   0058 0042 0071 0046
        DECLE   $0028,  $0068,  $0071,  $0081   ; 68E8   0028 0068 0071 0081
        DECLE   $0023,  $0027,  $0075,  $0073   ; 68EC   0023 0027 0075 0073
        DECLE   $0015,  $0064,  $0043,  $0032   ; 68F0   0015 0064 0043 0032
        DECLE   $0018,  $000C,  $0050,  $0001   ; 68F4   0018 000C 0050 0001
        DECLE   $0000                           ; 68F8   0000

        DECR    R0                              ; 68F9   0010
L_68FA:
        DECR    R7                              ; 68FA   0017

        DECLE   $0069,  $0092,  $000C,  $0050   ; 68FB   0069 0092 000C 0050
        DECLE   $0001,  $0002,  $0010,  $0014   ; 68FF   0001 0002 0010 0014
        DECLE   $0069,  $0051,  $0008,  $0024   ; 6903   0069 0051 0008 0024
        DECLE   $0000,  $0007,  $0000,  $0014   ; 6907   0000 0007 0000 0014
        DECLE   $0069,  $0058,  $0008,  $0054   ; 690B   0069 0058 0008 0054
        DECLE   $0000,  $0007,  $0000,  $0014   ; 690F   0000 0007 0000 0014
        DECLE   $0069,  $001A,  $0069,  $0001   ; 6913   0069 001A 0069 0001
        DECLE   $001A,  $0069,  $0001,  $0000   ; 6917   001A 0069 0001 0000
        DECLE   $003C,  $007E,  $007E,  $007E   ; 691B   003C 007E 007E 007E
        DECLE   $00FF,  $00FF,  $00FF           ; 691F   00FF 00FF 00FF
L_6922:
        MVII    #$01E3, R2                      ; 6922   02BA 01E3
L_6924:
        MVI@    R2,     R0                      ; 6924   0290
        TSTR    R0                              ; 6925   0080
        BEQ     L_6930                          ; 6926   0204 0008

        ADDI    #$0003, R2                      ; 6928   02FA 0003
        CMPI    #$01EF, R2                      ; 692A   037A 01EF
        BEQ     L_6922                          ; 692C   0224 000B
        B       L_6924                          ; 692E   0220 000B

L_6930:
        INCR    R2                              ; 6930   000A
        PULR    R0                              ; 6931   02B0
        MVO@    R0,     R2                      ; 6932   0250
        INCR    R2                              ; 6933   000A
        SWAP    R0,     1                       ; 6934   0040
        MVO@    R0,     R2                      ; 6935   0250
        SUBI    #$0002, R2                      ; 6936   033A 0002
        PULR    R0                              ; 6938   02B0
        PSHR    R5                              ; 6939   0275
        DIS                                     ; 693A   0003
        MVO@    R0,     R2                      ; 693B   0250
        SDBD                                    ; 693C   0001
        MVII    #$6944, R0                      ; 693D   02B8 0044 0069

        JSR     R5,     L_6969                  ; 6940   0004 0168 0169

        PULR    R7                              ; 6943   02B7

        MVO     R0,     .STIC.VIDEN             ; 6944   0240 0020
        MVII    #$0004, R1                      ; 6946   02B9 0004
L_6948:
        DECR    R1                              ; 6948   0011
        BMI     L_6965                          ; 6949   020B 001A

        MVI     G_01E2, R2                      ; 694B   0282 01E2
        INCR    R2                              ; 694D   000A
        ANDI    #$0003, R2                      ; 694E   03BA 0003
        MVO     R2,     G_01E2                  ; 6950   0242 01E2
        SLL     R2,     1                       ; 6952   004A
        ADD     G_01E2, R2                      ; 6953   02C2 01E2
        ADDI    #$01E3, R2                      ; 6955   02FA 01E3
        MVI@    R2,     R0                      ; 6957   0290
        TSTR    R0                              ; 6958   0080
        BEQ     L_6948                          ; 6959   0224 0012

        PSHR    R5                              ; 695B   0275
        MOVR    R2,     R5                      ; 695C   0095
        MVI@    R5,     R1                      ; 695D   02A9
        SDBD                                    ; 695E   0001
        MVI@    R5,     R4                      ; 695F   02AC

        JSR     R5,     L_6971                  ; 6960   0004 0168 0171

        MVO@    R0,     R2                      ; 6963   0250
        PULR    R7                              ; 6964   02B7

L_6965:
        SDBD                                    ; 6965   0001
        MVII    #$5101, R0                      ; 6966   02B8 0001 0051
L_6969:
        DIS                                     ; 6969   0003
        MVO     R0,     .ISRVEC.0               ; 696A   0240 0100
        SWAP    R0,     1                       ; 696C   0040
        MVO     R0,     .ISRVEC.1               ; 696D   0240 0101
        EIS                                     ; 696F   0002
        MOVR    R5,     R7                      ; 6970   00AF

L_6971:
        PSHR    R5                              ; 6971   0275
        SLL     R1,     2                       ; 6972   004D
        SLL     R1,     1                       ; 6973   0049
        SDBD                                    ; 6974   0001
        ADDI    #$3800, R1                      ; 6975   02F9 0000 0038
        MOVR    R1,     R5                      ; 6978   008D
        MVI@    R4,     R0                      ; 6979   02A0
L_697A:
        MVI@    R4,     R1                      ; 697A   02A1
        MOVR    R1,     R3                      ; 697B   008B
        SWAP    R3,     1                       ; 697C   0043
        ANDI    #$0003, R3                      ; 697D   03BB 0003
        ANDI    #$00FF, R1                      ; 697F   03B9 00FF
L_6981:
        MVO@    R1,     R5                      ; 6981   0269
        DECR    R3                              ; 6982   0013
        BPL     L_6981                          ; 6983   0223 0003

        DECR    R0                              ; 6985   0010
        BNEQ    L_697A                          ; 6986   022C 000D
        PULR    R7                              ; 6988   02B7

        DECLE   $00BA,  $0069,  $0005,  $0092   ; 6989   00BA 0069 0005 0092
        DECLE   $0069,  $0003,  $00AA,  $0069   ; 698D   0069 0003 00AA 0069
        DECLE   $0002,  $0008,  $0008,  $0008   ; 6991   0002 0008 0008 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6995   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; 6999   0000 0000 0000 0008
        DECLE   $0008,  $0008,  $0000,  $0000   ; 699D   0008 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69A1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0008   ; 69A5   0000 0000 0008 0008
        DECLE   $0008,  $0008,  $0008,  $0000   ; 69A9   0008 0008 0008 0000
        DECLE   $0008,  $0008,  $0008,  $0008   ; 69AD   0008 0008 0008 0008
        DECLE   $0008,  $0000,  $0000,  $0000   ; 69B1   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0000   ; 69B5   0000 0000 0008 0000
        DECLE   $0008,  $0010,  $0010,  $0020   ; 69B9   0008 0010 0010 0020
        DECLE   $0020,  $0040,  $0040,  $0081   ; 69BD   0020 0040 0040 0081
        DECLE   $00FF,  $0010,  $0010,  $0010   ; 69C1   00FF 0010 0010 0010
        DECLE   $0020,  $0020,  $0020,  $0081   ; 69C5   0020 0020 0020 0081
        DECLE   $00FF,  $0010,  $0010,  $0010   ; 69C9   00FF 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0081   ; 69CD   0010 0010 0010 0081
        DECLE   $00FF,  $0008,  $0008,  $0008   ; 69D1   00FF 0008 0008 0008
        DECLE   $0004,  $0004,  $0004,  $0081   ; 69D5   0004 0004 0004 0081
        DECLE   $00FF,  $0008,  $0008,  $0004   ; 69D9   00FF 0008 0008 0004
        DECLE   $0004,  $0002,  $0002,  $0081   ; 69DD   0004 0002 0002 0081
        DECLE   $00FF,  $0008,  $0085,  $0000   ; 69E1   00FF 0008 0085 0000
        DECLE   $0000                           ; 69E5   0000

        MOVR    R0,     R1                      ; 69E6   0081
        ADDR    R0,     R3                      ; 69E7   00C3
        ADDR    R4,     R7                      ; 69E8   00E7

        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 69E9   00FF 00FF 00FF 0000
        DECLE   $00FF,  $0081,  $00FF,  $0081   ; 69ED   00FF 0081 00FF 0081
        DECLE   $00FF,  $0081,  $00FF,  $0000   ; 69F1   00FF 0081 00FF 0000
        DECLE   $0080,  $0000,  $00FF           ; 69F5   0080 0000 00FF

        ADDR    R6,     R2                      ; 69F8   00F2
        ADDR    R6,     R4                      ; 69F9   00F4
        ADDR    R6,     R2                      ; 69FA   00F2
        ADDR    R6,     R4                      ; 69FB   00F4
        SUBR    R3,     R7                      ; 69FC   011F

        DECLE   $013F,  $017F,  $01FF           ; 69FD   013F 017F 01FF

        SUBR    R0,     R1                      ; 6A00   0101
        SUBR    R0,     R3                      ; 6A01   0103
        SUBR    R0,     R7                      ; 6A02   0107
        SUBR    R1,     R7                      ; 6A03   010F

        DECLE   $01F8,  $01FC,  $01FE,  $01FF   ; 6A04   01F8 01FC 01FE 01FF
        DECLE   $0180,  $01C0,  $01E0,  $01F0   ; 6A08   0180 01C0 01E0 01F0
        DECLE   $003C,  $0042,  $0099,  $01A1   ; 6A0C   003C 0042 0099 01A1
        DECLE   $0099,  $0042,  $003C,  $00FF   ; 6A10   0099 0042 003C 00FF
        DECLE   $00FC,  $00F0,  $00C0,  $0300   ; 6A14   00FC 00F0 00C0 0300
        DECLE   $00FF,  $003F                   ; 6A18   00FF 003F

        INCR    R7                              ; 6A1A   000F

        DIS                                     ; 6A1B   0003
L_6A1C:
        SUB     .STIC.X.0,R0                    ; 6A1C   0300 0000
        DECLE   $0008,  $0000,  $0008,  $0000   ; 6A1E   0008 0000 0008 0000
        DECLE   $0008,  $0000,  $0008,  $0081   ; 6A22   0008 0000 0008 0081
        DECLE   $00FF,  $0081,  $00FF,  $0081   ; 6A26   00FF 0081 00FF 0081
        DECLE   $00FF,  $0081,  $00FF,  $0300   ; 6A2A   00FF 0081 00FF 0300
        DECLE   $0100,  $0024,  $003C,  $0100   ; 6A2E   0100 0024 003C 0100
        DECLE   $007E,  $0034,  $0100,  $013C   ; 6A32   007E 0034 0100 013C
        DECLE   $0000,  $0001,  $0000,  $00FF   ; 6A36   0000 0001 0000 00FF
        DECLE   $004F,  $002F,  $004F,  $002F   ; 6A3A   004F 002F 004F 002F
        DECLE   $0300,  $0300,  $0300,  $0300   ; 6A3E   0300 0300 0300 0300
        DECLE   $0300,  $0300,  $00FF,  $0300   ; 6A42   0300 0300 00FF 0300
        DECLE   $0200,  $0301,  $0301,  $0380   ; 6A46   0200 0301 0301 0380
        DECLE   $0380,  $0000,  $003F,  $0057   ; 6A4A   0380 0000 003F 0057
        DECLE   $0052,  $0055,  $0057,  $003F   ; 6A4E   0052 0055 0057 003F
        DECLE   $0000,  $0000,  $00FF,  $0044   ; 6A52   0000 0000 00FF 0044
        DECLE   $0055,  $0045,  $0054,  $00FF   ; 6A56   0055 0045 0054 00FF
        DECLE   $0000,  $0000                   ; 6A5A   0000 0000

        ADDR    R7,     R6                      ; 6A5C   00FE
        RLC     R1,     1                       ; 6A5D   0051
        ADDR    R2,     R7                      ; 6A5E   00D7

        DECLE   $0057,  $0051,  $00FE,  $0000   ; 6A5F   0057 0051 00FE 0000
        DECLE   $0081,  $0018,  $003C,  $0019   ; 6A63   0081 0018 003C 0019
        DECLE   $00C3,  $02FF,  $0275           ; 6A67   00C3 02FF 0275

        MVII    #$0058, R0                      ; 6A6A   02B8 0058

        JSR     R5,     X_PLAY_SFX1             ; 6A6C   0004 0118 03BB
        DECLE   $0389                           ; 6A6F  SFX data
        DECLE   $0340,  $00D0                   ; 6A70  SFX data
        DECLE   $0348,  $00A8                   ; 6A72  SFX data
        DECLE   $0344,  $00C0                   ; 6A74  SFX data
        DECLE   $021B                           ; 6A76  SFX data
        DECLE   $0023,  $03DC                   ; 6A77  SFX data
        DECLE   $03B7                           ; 6A79  SFX data
        DECLE   $000C,  $0100                   ; 6A7A  SFX data
        DECLE   $000B                           ; 6A7C  SFX data
        DECLE   $008F,  $0064                   ; 6A7D  SFX data
        DECLE   $02CF                           ; 6A7F  SFX end

L_6A80:
        PSHR    R5                              ; 6A80   0275
        MVI     G_0146, R3                      ; 6A81   0283 0146
        TSTR    R3                              ; 6A83   009B
        BNEQ    L_6A8C                          ; 6A84   020C 0006

        JSR     R5,     X_PLAY_MUS3             ; 6A86   0004 0118 0395
        DECLE   $03F4,  $02DB                   ; 6A89  Note (long)
        DECLE   $0000                           ; 6A8B  End of music
L_6A8C:
        PULR    R7                              ; 6A8C   02B7

L_6A8D:
        PSHR    R5                              ; 6A8D   0275
        MVII    #$01A5, R1                      ; 6A8E   02B9 01A5
        ADDR    R0,     R1                      ; 6A90   00C1
        MVI@    R1,     R1                      ; 6A91   0289
        CMPI    #$0002, R1                      ; 6A92   0379 0002
        BNEQ    L_6A9E                          ; 6A94   020C 0008

        MVII    #$02F6, R5                      ; 6A96   02BD 02F6
        ADDR    R0,     R5                      ; 6A98   00C5
        MVI@    R5,     R0                      ; 6A99   02A8
        CMPI    #$03FF, R0                      ; 6A9A   0378 03FF
        BGT     L_6A9F                          ; 6A9C   020E 0001
L_6A9E:
        PULR    R7                              ; 6A9E   02B7

L_6A9F:
        MVII    #$0020, R0                      ; 6A9F   02B8 0020

        JSR     R5,     X_PLAY_SFX2             ; 6AA1   0004 0118 03BE
        DECLE   $0091                           ; 6AA4  SFX prio
        DECLE   $0389                           ; 6AA5  SFX data
        DECLE   $0080,  $0100                   ; 6AA6  SFX data
        DECLE   $0088,  $0200                   ; 6AA8  SFX data
        DECLE   $0084,  $0200                   ; 6AAA  SFX data
        DECLE   $002E                           ; 6AAC  SFX data
        DECLE   $008F,  $0018                   ; 6AAD  SFX data
        DECLE   $0001,  $00E3                   ; 6AAF  SFX data
        DECLE   $0023,  $03F0                   ; 6AB1  SFX data
        DECLE   $03B7                           ; 6AB3  SFX data
        DECLE   $004C,  $0000                   ; 6AB4  SFX data
        DECLE   $000B                           ; 6AB6  SFX data
        DECLE   $008F,  $003C                   ; 6AB7  SFX data
        DECLE   $02CF                           ; 6AB9  SFX end


        PSHR    R5                              ; 6ABA   0275
        MVI     G_01AE, R3                      ; 6ABB   0283 01AE
        TSTR    R3                              ; 6ABD   009B
        BNEQ    L_6AEF                          ; 6ABE   020C 002F

        MVI     G_01AD, R2                      ; 6AC0   0282 01AD
        TSTR    R2                              ; 6AC2   0092
        BEQ     L_6ACA                          ; 6AC3   0204 0005

        CMPI    #$0001, R0                      ; 6AC5   0378 0001
        BEQ     L_6AEF                          ; 6AC7   0204 0026
L_6AC9:
        PULR    R7                              ; 6AC9   02B7

L_6ACA:
        TSTR    R0                              ; 6ACA   0080
        BEQ     L_6AEF                          ; 6ACB   0204 0022

        CMPI    #$0002, R0                      ; 6ACD   0378 0002
        BGT     L_6AC9                          ; 6ACF   022E 0007

        PSHR    R0                              ; 6AD1   0270
        CLRR    R0                              ; 6AD2   01C0

        JSR     R5,     L_5F13                  ; 6AD3   0004 015C 0313

        PULR    R0                              ; 6AD6   02B0
        MVO     R0,     G_01AD                  ; 6AD7   0240 01AD
        CMPI    #$0001, R0                      ; 6AD9   0378 0001
        BNEQ    L_6AE5                          ; 6ADB   020C 0008

        MVII    #$0096, R0                      ; 6ADD   02B8 0096
        MVO     R0,     G_02F4                  ; 6ADF   0240 02F4
        MVO     R0,     G_02F5                  ; 6AE1   0240 02F5
        INCR    R7                              ; 6AE3   000F

L_6AE4:
        PSHR    R5                              ; 6AE4   0275
L_6AE5:
        CLRR    R1                              ; 6AE5   01C9
        MVII    #$000B, R0                      ; 6AE6   02B8 000B

        JSR     R5,     L_6AF7                  ; 6AE8   0004 0168 02F7

        MVII    #$0001, R1                      ; 6AEB   02B9 0001
        MVII    #$000B, R0                      ; 6AED   02B8 000B
L_6AEF:
        B       L_6AF8                          ; 6AEF   0200 0007

        DECLE   $00FE,  $0002,  $0003,  $0014   ; 6AF1   00FE 0002 0003 0014
        DECLE   $0015,  $0000                   ; 6AF5   0015 0000
L_6AF7:
        PSHR    R5                              ; 6AF7   0275
L_6AF8:
        MVII    #$01B1, R2                      ; 6AF8   02BA 01B1
        ADDR    R1,     R2                      ; 6AFA   00CA
        MVI@    R2,     R3                      ; 6AFB   0293
        SDBD                                    ; 6AFC   0001
        MVII    #$6AF1, R5                      ; 6AFD   02BD 00F1 006A
L_6B00:
        MVI@    R5,     R4                      ; 6B00   02AC
        TSTR    R4                              ; 6B01   00A4
        BEQ     L_6B08                          ; 6B02   0204 0004

        CMPR    R4,     R3                      ; 6B04   0163
        BNEQ    L_6B00                          ; 6B05   022C 0006
        PULR    R7                              ; 6B07   02B7

L_6B08:
        MVII    #$02F6, R5                      ; 6B08   02BD 02F6
        ADDR    R1,     R5                      ; 6B0A   00CD
        MVI@    R5,     R4                      ; 6B0B   02AC
        SDBD                                    ; 6B0C   0001
        MVII    #$6B12, R5                      ; 6B0D   02BD 0012 006B
        ADDR    R0,     R5                      ; 6B10   00C5
        ADD@    R5,     R7                      ; 6B11   02EF

        INCR    R4                              ; 6B12   000C
        ADCR    R6                              ; 6B13   002E
        ADCR    R5                              ; 6B14   002D
        SUBR    R7,     R6                      ; 6B15   013E
        SLLC    R2,     2                       ; 6B16   005E
        BMI     L_6D24                          ; 6B17   020B 020B

        SARC    R3,     2                       ; 6B19   007F
        ADD@    R1,     R0                      ; 6B1A   02C8
        ADD@    R1,     R0                      ; 6B1B   02C8
        ADDR    R6,     R5                      ; 6B1C   00F5
        CMPR    R6,     R7                      ; 6B1D   0177
        SLL     R1,     1                       ; 6B1E   0049
        XOR     G_019E, R1                      ; 6B1F   03C1 019E
        SARC    R1,     2                       ; 6B21   007D
        BOV     L_6B2E                          ; 6B22   0202 000A

        MVI     G_019F, R0                      ; 6B24   0280 019F
        CMPI    #$0002, R0                      ; 6B26   0378 0002
        BGE     L_6B2E                          ; 6B28   020D 0004

        XORI    #$0001, R0                      ; 6B2A   03F8 0001
        MVO     R0,     G_019F                  ; 6B2C   0240 019F
L_6B2E:
        MVII    #$0002, R0                      ; 6B2E   02B8 0002

        JSR     R5,     X_PLAY_SFX2             ; 6B30   0004 0118 03BE
        DECLE   $0095                           ; 6B33  SFX prio
        DECLE   $03D0,  $014D                   ; 6B34  SFX data
        DECLE   $03D8,  $01F4                   ; 6B36  SFX data
        DECLE   $03C9                           ; 6B38  SFX data
        DECLE   $008F,  $0028                   ; 6B39  SFX data
        DECLE   $03F9                           ; 6B3B  SFX data
        DECLE   $0203,  $03D8                   ; 6B3C  SFX data
        DECLE   $02CF                           ; 6B3E  SFX end


        PULR    R7                              ; 6B3F   02B7

        TSTR    R3                              ; 6B40   009B
        BEQ     L_6B6F                          ; 6B41   0204 002C

        MVI     G_01AE, R3                      ; 6B43   0283 01AE
        TSTR    R3                              ; 6B45   009B
        BNEQ    L_6B61                          ; 6B46   020C 0019

        MVI     G_01AD, R3                      ; 6B48   0283 01AD
        MVO     R3,     G_01AE                  ; 6B4A   0243 01AE
        PSHR    R1                              ; 6B4C   0271
        CMPI    #$0002, R3                      ; 6B4D   037B 0002
        BNEQ    L_6B54                          ; 6B4F   020C 0003

        JSR     R5,     L_6F5A                  ; 6B51   0004 016C 035A

L_6B54:
        MVII    #$01BD, R4                      ; 6B54   02BC 01BD
        MVI     G_01B0, R3                      ; 6B56   0283 01B0
L_6B58:
        MVO@    R3,     R4                      ; 6B58   0263
        ADDI    #$0002, R4                      ; 6B59   02FC 0002
        INCR    R3                              ; 6B5B   000B
        CMPI    #$01D5, R4                      ; 6B5C   037C 01D5
        BNEQ    L_6B58                          ; 6B5E   022C 0007

        PULR    R1                              ; 6B60   02B1
L_6B61:
        CLRR    R4                              ; 6B61   01E4
        MVO@    R4,     R2                      ; 6B62   0254

        JSR     R5,     L_6F10                  ; 6B63   0004 016C 0310

        MOVR    R1,     R0                      ; 6B66   0088
        PSHR    R0                              ; 6B67   0270

        JSR     R5,     L_61C4                  ; 6B68   0004 0160 01C4

        PULR    R0                              ; 6B6B   02B0
        J       L_590F                          ; 6B6C   0004 0358 010F
L_6B6F:
        PULR    R7                              ; 6B6F   02B7

        MVI     G_01AE, R5                      ; 6B70   0285 01AE
        CMPI    #$0001, R5                      ; 6B72   037D 0001
        BEQ     L_6B8F                          ; 6B74   0204 0019

        MVII    #$0186, R3                      ; 6B76   02BB 0186
        ADDR    R1,     R3                      ; 6B78   00CB
        MVI@    R3,     R3                      ; 6B79   029B

        JSR     R5,     L_6273                  ; 6B7A   0004 0160 0273

        BNEQ    L_6B8F                          ; 6B7D   020C 0010

        CLRR    R3                              ; 6B7F   01DB
L_6B80:
        SUBI    #$0003, R5                      ; 6B80   033D 0003
        CMPI    #$01BE, R5                      ; 6B82   037D 01BE
        BLT     L_6B89                          ; 6B84   0205 0003

        INCR    R3                              ; 6B86   000B
        B       L_6B80                          ; 6B87   0220 0008

L_6B89:
        MVII    #$01D7, R5                      ; 6B89   02BD 01D7
        ADDR    R1,     R5                      ; 6B8B   00CD
        MVO@    R3,     R5                      ; 6B8C   026B
        B       L_6B91                          ; 6B8D   0200 0002
L_6B8F:
        PULR    R7                              ; 6B8F   02B7

        PSHR    R5                              ; 6B90   0275
L_6B91:
        TSTR    R4                              ; 6B91   00A4
        BNEQ    L_6BEA                          ; 6B92   020C 0056

        MVII    #$017B, R3                      ; 6B94   02BB 017B
        ADDR    R1,     R3                      ; 6B96   00CB
        MVI@    R3,     R3                      ; 6B97   029B
        CMPI    #$0004, R3                      ; 6B98   037B 0004
        BNEQ    L_6BEA                          ; 6B9A   020C 004E

        INCR    R0                              ; 6B9C   0008
        MVO@    R0,     R2                      ; 6B9D   0250

L_6B9E:
        JSR     R5,     L_6F10                  ; 6B9E   0004 016C 0310

L_6BA1:
        PSHR    R1                              ; 6BA1   0271
        ADDI    #$01D7, R1                      ; 6BA2   02F9 01D7
        MVI@    R1,     R3                      ; 6BA4   028B
        ADD@    R1,     R3                      ; 6BA5   02CB
        ADD@    R1,     R3                      ; 6BA6   02CB
        ADDI    #$01BD, R3                      ; 6BA7   02FB 01BD
        MVI@    R3,     R1                      ; 6BA9   0299
        MVII    #$0007, R3                      ; 6BAA   02BB 0007

        JSR     R5,     L_6259                  ; 6BAC   0004 0160 0259

        PULR    R1                              ; 6BAF   02B1
        PSHR    R1                              ; 6BB0   0271
        MVII    #$01D7, R2                      ; 6BB1   02BA 01D7
        ADDR    R1,     R2                      ; 6BB3   00CA
        MVI@    R2,     R5                      ; 6BB4   0295
        MOVR    R5,     R2                      ; 6BB5   00AA
        ADDR    R2,     R5                      ; 6BB6   00D5
        ADDR    R2,     R5                      ; 6BB7   00D5
        ADDI    #$01BE, R5                      ; 6BB8   02FD 01BE
        MVI@    R5,     R2                      ; 6BBA   02AA
        PSHR    R5                              ; 6BBB   0275

        JSR     R5,     L_6F09                  ; 6BBC   0004 016C 0309

        ADDI    #$0026, R4                      ; 6BBF   02FC 0026

        JSR     R5,     L_6EE2                  ; 6BC1   0004 016C 02E2

        PULR    R5                              ; 6BC4   02B5
        MVI@    R5,     R2                      ; 6BC5   02AA

        JSR     R5,     L_6F09                  ; 6BC6   0004 016C 0309
        JSR     R5,     L_6EE2                  ; 6BC9   0004 016C 02E2

        PULR    R1                              ; 6BCC   02B1
        PSHR    R1                              ; 6BCD   0271
        MVII    #$0267, R4                      ; 6BCE   02BC 0267
        TSTR    R1                              ; 6BD0   0089
        BEQ     L_6BD5                          ; 6BD1   0204 0002

        ADDI    #$000B, R4                      ; 6BD3   02FC 000B
L_6BD5:
        SDBD                                    ; 6BD5   0001
        MVII    #$6BEB, R1                      ; 6BD6   02B9 00EB 006B
        MVII    #$0005, R3                      ; 6BD9   02BB 0005
        MVII    #$0004, R2                      ; 6BDB   02BA 0004

L_6BDD:
        JSR     R5,     X_PRINT_R1              ; 6BDD   0004 0118 0067

        ADDI    #$000E, R4                      ; 6BE0   02FC 000E
        MOVR    R5,     R1                      ; 6BE2   00A9
        DECR    R2                              ; 6BE3   0012
        BNEQ    L_6BDD                          ; 6BE4   022C 0008

        PULR    R1                              ; 6BE6   02B1

        JSR     R5,     L_6EC2                  ; 6BE7   0004 016C 02C2

L_6BEA:
        PULR    R7                              ; 6BEA   02B7

        DECLE   $0047,  $0052,  $0041,  $0056   ; 6BEB   0047 0052 0041 0056
        DECLE   $0045,  $004C,  $0000,  $0043   ; 6BEF   0045 004C 0000 0043
        DECLE   $004F,  $0052,  $004E,  $0020   ; 6BF3   004F 0052 004E 0020
        DECLE   $0020,  $0000,  $004D,  $0049   ; 6BF7   0020 0000 004D 0049
        DECLE   $004C,  $004B,  $0020,  $0020   ; 6BFB   004C 004B 0020 0020
        DECLE   $0000,  $0043,  $0041,  $0054   ; 6BFF   0000 0043 0041 0054
        DECLE   $0054,  $004C,  $0045,  $0000   ; 6C03   0054 004C 0045 0000

        TSTR    R4                              ; 6C07   00A4
        BNEQ    L_6C4F                          ; 6C08   020C 0045

        INCR    R0                              ; 6C0A   0008
        MVO@    R0,     R2                      ; 6C0B   0250
        PSHR    R1                              ; 6C0C   0271

        JSR     R5,     L_6F10                  ; 6C0D   0004 016C 0310

        PSHR    R4                              ; 6C10   0274

        JSR     R5,     L_6EA2                  ; 6C11   0004 016C 02A2

        PULR    R4                              ; 6C14   02B4
        MVII    #$0007, R3                      ; 6C15   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 6C17   0004 0118 007B
        STRING  "CITIES"                        ; 6C1A  
        DECLE   $0000                           ; 6C20   0000

        ADDI    #$0022, R4                      ; 6C21   02FC 0022
        MVII    #$01BD, R5                      ; 6C23   02BD 01BD
        CLRR    R1                              ; 6C25   01C9
        PULR    R0                              ; 6C26   02B0
L_6C27:
        PSHR    R1                              ; 6C27   0271
        PSHR    R0                              ; 6C28   0270
        MVI@    R5,     R1                      ; 6C29   02A9
        PSHR    R5                              ; 6C2A   0275
        ADDR    R0,     R5                      ; 6C2B   00C5
        MVI@    R5,     R0                      ; 6C2C   02A8
        MVII    #$0005, R3                      ; 6C2D   02BB 0005
        MVI     G_01AE, R5                      ; 6C2F   0285 01AE
        CMPI    #$0001, R5                      ; 6C31   037D 0001
        BNEQ    L_6C3A                          ; 6C33   020C 0005

        TSTR    R0                              ; 6C35   0080
        BEQ     L_6C3A                          ; 6C36   0204 0002

        MVII    #$0007, R3                      ; 6C38   02BB 0007
L_6C3A:
        INCR    R1                              ; 6C3A   0009

        JSR     R5,     L_6EFA                  ; 6C3B   0004 016C 02FA

        PULR    R5                              ; 6C3E   02B5
        ADDI    #$0002, R5                      ; 6C3F   02FD 0002
        PULR    R0                              ; 6C41   02B0
        PULR    R1                              ; 6C42   02B1
        INCR    R1                              ; 6C43   0009
        MOVR    R1,     R2                      ; 6C44   008A
        ANDI    #$0003, R2                      ; 6C45   03BA 0003
        BNEQ    L_6C4B                          ; 6C47   020C 0002

        SUBI    #$004D, R4                      ; 6C49   033C 004D
L_6C4B:
        CMPI    #$0008, R1                      ; 6C4B   0379 0008
        BNEQ    L_6C27                          ; 6C4D   022C 0027
L_6C4F:
        PULR    R7                              ; 6C4F   02B7

        TSTR    R4                              ; 6C50   00A4
        BNEQ    L_6C88                          ; 6C51   020C 0035

        INCR    R0                              ; 6C53   0008
        MVO@    R0,     R2                      ; 6C54   0250

        JSR     R5,     L_6F10                  ; 6C55   0004 016C 0310

        MVII    #$0007, R3                      ; 6C58   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 6C5A   0004 0118 007B
        STRING  "TRUCK"                         ; 6C5D  
        DECLE   $0000                           ; 6C62   0000

        ADDI    #$0023, R4                      ; 6C63   02FC 0023
        MVII    #$01B3, R5                      ; 6C65   02BD 01B3
        TSTR    R1                              ; 6C67   0089
        BEQ     L_6C6C                          ; 6C68   0204 0002

        ADDI    #$0005, R5                      ; 6C6A   02FD 0005
L_6C6C:
        PSHR    R5                              ; 6C6C   0275
        MVI@    R5,     R2                      ; 6C6D   02AA
        MVI@    R5,     R1                      ; 6C6E   02A9
        PSHR    R5                              ; 6C6F   0275

        JSR     R5,     L_6EE2                  ; 6C70   0004 016C 02E2

        PULR    R5                              ; 6C73   02B5
        MVI@    R5,     R2                      ; 6C74   02AA
        MVI@    R5,     R1                      ; 6C75   02A9

        JSR     R5,     L_6EE2                  ; 6C76   0004 016C 02E2

        SUBI    #$004D, R4                      ; 6C79   033C 004D
        PULR    R5                              ; 6C7B   02B5
        MVI@    R5,     R2                      ; 6C7C   02AA
        MVI@    R5,     R1                      ; 6C7D   02A9
        PSHR    R5                              ; 6C7E   0275

        JSR     R5,     L_6E81                  ; 6C7F   0004 016C 0281

        PULR    R5                              ; 6C82   02B5
        MVI@    R5,     R2                      ; 6C83   02AA
        MVI@    R5,     R1                      ; 6C84   02A9

        JSR     R5,     L_6E81                  ; 6C85   0004 016C 0281

L_6C88:
        PULR    R7                              ; 6C88   02B7

        TSTR    R4                              ; 6C89   00A4
        BNEQ    L_6CB2                          ; 6C8A   020C 0026

        INCR    R0                              ; 6C8C   0008
        MVO@    R0,     R2                      ; 6C8D   0250
        PSHR    R1                              ; 6C8E   0271

        JSR     R5,     L_6F10                  ; 6C8F   0004 016C 0310
        JSR     R5,     L_6CD2                  ; 6C92   0004 016C 00D2

        ADDI    #$003C, R4                      ; 6C95   02FC 003C

        JSR     R5,     X_PRINT_R5              ; 6C97   0004 0118 007B
        STRING  "GAME: "                        ; 6C9A  
        DECLE   $0000                           ; 6CA0   0000

        INCR    R4                              ; 6CA1   000C
        MVI     G_01AD, R0                      ; 6CA2   0280 01AD
        MVII    #$0001, R1                      ; 6CA4   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 6CA6   0004 0118 00C5

        ADDI    #$000D, R4                      ; 6CA9   02FC 000D

        JSR     R5,     L_6CB3                  ; 6CAB   0004 016C 00B3

        PULR    R1                              ; 6CAE   02B1
        CLRR    R2                              ; 6CAF   01D2
        B       L_6E5B                          ; 6CB0   0200 01A9
L_6CB2:
        PULR    R7                              ; 6CB2   02B7

L_6CB3:
        PSHR    R5                              ; 6CB3   0275
        MVI     G_01AD, R1                      ; 6CB4   0281 01AD
        DECR    R1                              ; 6CB6   0011
        BEQ     L_6CCC                          ; 6CB7   0204 0013

        JSR     R5,     X_PRINT_R5              ; 6CB9   0004 0118 007B
        STRING  "DAYS: "                        ; 6CBC  
        DECLE   $0000                           ; 6CC2   0000

        MVI     G_01AF, R0                      ; 6CC3   0280 01AF
        MVII    #$0002, R1                      ; 6CC5   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 6CC7   0004 0118 00C5

        ADDI    #$000E, R4                      ; 6CCA   02FC 000E
L_6CCC:
        MVI     G_01B0, R1                      ; 6CCC   0281 01B0

        JSR     R5,     L_6259                  ; 6CCE   0004 0160 0259

        PULR    R7                              ; 6CD1   02B7

L_6CD2:
        PSHR    R5                              ; 6CD2   0275
        PSHR    R4                              ; 6CD3   0274
        MVII    #$0005, R3                      ; 6CD4   02BB 0005
        MVI     G_018A, R2                      ; 6CD6   0282 018A
        INCR    R2                              ; 6CD8   000A
        CMPI    #$001E, R2                      ; 6CD9   037A 001E
        BGT     L_6CE8                          ; 6CDB   020E 000B

        JSR     R5,     X_PRINT_R5              ; 6CDD   0004 0118 007B
        STRING  "JUNE "                         ; 6CE0  
        DECLE   $0000                           ; 6CE5   0000

        B       L_6CF3                          ; 6CE6   0200 000B

L_6CE8:
        SUBI    #$001E, R2                      ; 6CE8   033A 001E

        JSR     R5,     X_PRINT_R5              ; 6CEA   0004 0118 007B
        STRING  "JULY "                         ; 6CED  
        DECLE   $0000                           ; 6CF2   0000
L_6CF3:
        MOVR    R2,     R0                      ; 6CF3   0090
        MVII    #$0002, R1                      ; 6CF4   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 6CF6   0004 0118 00C5

        PULR    R4                              ; 6CF9   02B4
        ADDI    #$0014, R4                      ; 6CFA   02FC 0014
        PSHR    R4                              ; 6CFC   0274
        MVI     G_0189, R0                      ; 6CFD   0280 0189
        MVII    #$0002, R1                      ; 6CFF   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 6D01   0004 0118 00C5

        ADDI    #$0002, R4                      ; 6D04   02FC 0002
        MVII    #$00D5, R0                      ; 6D06   02B8 00D5
        MVO@    R0,     R4                      ; 6D08   0260
        MVI     G_0188, R0                      ; 6D09   0280 0188
        CMPI    #$000A, R0                      ; 6D0B   0378 000A
        BGE     L_6D16                          ; 6D0D   020D 0007

        MVII    #$0085, R1                      ; 6D0F   02B9 0085
        MVO@    R1,     R4                      ; 6D11   0261
        MVII    #$0001, R1                      ; 6D12   02B9 0001
        B       L_6D18                          ; 6D14   0200 0002

L_6D16:
        MVII    #$0002, R1                      ; 6D16   02B9 0002

L_6D18:
        JSR     R5,     X_PRNUM_RGT             ; 6D18   0004 0118 00C5

        PULR    R4                              ; 6D1B   02B4
        PULR    R7                              ; 6D1C   02B7

        CMPI    #$0005, R3                      ; 6D1D   037B 0005
        BNEQ    L_6DD5                          ; 6D1F   020C 00B4

        PSHR    R0                              ; 6D21   0270
        MVII    #$0186, R3                      ; 6D22   02BB 0186
L_6D24:
        ADDR    R1,     R3                      ; 6D24   00CB
        MVI@    R3,     R3                      ; 6D25   029B

        JSR     R5,     L_6273                  ; 6D26   0004 0160 0273

        MOVR    R5,     R3                      ; 6D29   00AB
        MVII    #$01D5, R2                      ; 6D2A   02BA 01D5
        ADDR    R1,     R2                      ; 6D2C   00CA
        MVI@    R2,     R5                      ; 6D2D   0295
        MOVR    R5,     R0                      ; 6D2E   00A8
        SLR     R0,     1                       ; 6D2F   0060
        ADDR    R0,     R3                      ; 6D30   00C3
        PSHR    R5                              ; 6D31   0275
        MVI@    R3,     R2                      ; 6D32   029A
        MVI@    R3,     R4                      ; 6D33   029C
        ANDI    #$0001, R5                      ; 6D34   03BD 0001
        BNEQ    L_6D3E                          ; 6D36   020C 0006

        ANDI    #$000F, R2                      ; 6D38   03BA 000F
        ANDI    #$00F0, R4                      ; 6D3A   03BC 00F0
        B       L_6D42                          ; 6D3C   0200 0004

L_6D3E:
        SLR     R2,     2                       ; 6D3E   0066
        SLR     R2,     2                       ; 6D3F   0066
        ANDI    #$000F, R4                      ; 6D40   03BC 000F
L_6D42:
        PULR    R5                              ; 6D42   02B5
        PULR    R0                              ; 6D43   02B0
        CMPI    #$0005, R0                      ; 6D44   0378 0005
        BEQ     L_6D7C                          ; 6D46   0204 0034

        TSTR    R2                              ; 6D48   0092
        BEQ     L_6DD5                          ; 6D49   0204 008A

        PSHR    R5                              ; 6D4B   0275
        PSHR    R1                              ; 6D4C   0271
        PSHR    R2                              ; 6D4D   0272
        CLRR    R0                              ; 6D4E   01C0
        MVII    #$01B3, R5                      ; 6D4F   02BD 01B3
        TSTR    R1                              ; 6D51   0089
        BEQ     L_6D56                          ; 6D52   0204 0002

        ADDI    #$0005, R5                      ; 6D54   02FD 0005
L_6D56:
        MVII    #$0004, R2                      ; 6D56   02BA 0004
L_6D58:
        MVI@    R5,     R1                      ; 6D58   02A9
        SLR     R1,     2                       ; 6D59   0065
        SLR     R1,     2                       ; 6D5A   0065
        ADDR    R1,     R0                      ; 6D5B   00C8
        DECR    R2                              ; 6D5C   0012
        BNEQ    L_6D58                          ; 6D5D   022C 0006

        PULR    R2                              ; 6D5F   02B2
        PULR    R1                              ; 6D60   02B1
        PULR    R5                              ; 6D61   02B5
        INCR    R5                              ; 6D62   000D
        ADDR    R5,     R0                      ; 6D63   00E8
        CMPI    #$0004, R0                      ; 6D64   0378 0004
        BGT     L_6DD5                          ; 6D66   020E 006D

        MVO@    R4,     R3                      ; 6D68   025C
        MOVR    R5,     R3                      ; 6D69   00AB
        SLL     R3,     2                       ; 6D6A   004F
        SLL     R3,     2                       ; 6D6B   004F
        XORR    R3,     R2                      ; 6D6C   01DA
        MVII    #$01B3, R4                      ; 6D6D   02BC 01B3
        TSTR    R1                              ; 6D6F   0089
        BEQ     L_6D74                          ; 6D70   0204 0002

        ADDI    #$0005, R4                      ; 6D72   02FC 0005
L_6D74:
        MVI@    R4,     R0                      ; 6D74   02A0
        TSTR    R0                              ; 6D75   0080
        BNEQ    L_6D74                          ; 6D76   022C 0003

        DECR    R4                              ; 6D78   0014
        MVO@    R2,     R4                      ; 6D79   0262
        B       L_6B9E                          ; 6D7A   0220 01DD

L_6D7C:
        MVII    #$01B3, R4                      ; 6D7C   02BC 01B3
        TSTR    R1                              ; 6D7E   0089
        BEQ     L_6D83                          ; 6D7F   0204 0002

        ADDI    #$0005, R4                      ; 6D81   02FC 0005
L_6D83:
        PSHR    R2                              ; 6D83   0272
        PSHR    R1                              ; 6D84   0271
        PSHR    R3                              ; 6D85   0273
        MVII    #$0186, R2                      ; 6D86   02BA 0186
        ADDR    R1,     R2                      ; 6D88   00CA
        MVI@    R2,     R2                      ; 6D89   0292
        CLRR    R3                              ; 6D8A   01DB
        MVII    #$01BD, R1                      ; 6D8B   02B9 01BD
L_6D8D:
        CMP@    R1,     R2                      ; 6D8D   034A
        BEQ     L_6D95                          ; 6D8E   0204 0005

        ADDI    #$0003, R1                      ; 6D90   02F9 0003
        INCR    R3                              ; 6D92   000B
        B       L_6D8D                          ; 6D93   0220 0007

L_6D95:
        CLRR    R1                              ; 6D95   01C9
        MVII    #$0004, R0                      ; 6D96   02B8 0004
        INCR    R5                              ; 6D98   000D
L_6D99:
        MVI@    R4,     R2                      ; 6D99   02A2
        SLR     R2,     2                       ; 6D9A   0066
        SLR     R2,     2                       ; 6D9B   0066
        CMPR    R2,     R5                      ; 6D9C   0155
        BNEQ    L_6DB8                          ; 6D9D   020C 0019

        DECR    R4                              ; 6D9F   0014
        MOVR    R4,     R1                      ; 6DA0   00A1
        MVI@    R4,     R2                      ; 6DA1   02A2
        ANDI    #$000F, R2                      ; 6DA2   03BA 000F
        DECR    R2                              ; 6DA4   0012
        CMPR    R2,     R3                      ; 6DA5   0153
        BNEQ    L_6DB8                          ; 6DA6   020C 0010

        CLRR    R4                              ; 6DA8   01E4
        MVO@    R4,     R1                      ; 6DA9   024C
        PULR    R3                              ; 6DAA   02B3
        PULR    R1                              ; 6DAB   02B1
        PULR    R2                              ; 6DAC   02B2
        SDBD                                    ; 6DAD   0001
        ADDI    #$6DD5, R5                      ; 6DAE   02FD 00D5 006D
        MVI@    R5,     R2                      ; 6DB1   02AA

        JSR     R5,     L_6E5A                  ; 6DB2   0004 016C 025A

        J       L_6B9E                          ; 6DB5   0004 0368 039E

L_6DB8:
        DECR    R0                              ; 6DB8   0010
        BNEQ    L_6D99                          ; 6DB9   022C 0021

        PULR    R3                              ; 6DBB   02B3
        PULR    R2                              ; 6DBC   02B2
        PULR    R0                              ; 6DBD   02B0
        TSTR    R0                              ; 6DBE   0080
        BNEQ    L_6DD5                          ; 6DBF   020C 0014

        TSTR    R1                              ; 6DC1   0089
        BEQ     L_6DD5                          ; 6DC2   0204 0011

        MVI@    R1,     R0                      ; 6DC4   0288
        CLRR    R4                              ; 6DC5   01E4
        MVO@    R4,     R1                      ; 6DC6   024C
        ANDI    #$000F, R0                      ; 6DC7   03B8 000F
        ANDI    #$0001, R5                      ; 6DC9   03BD 0001
        BNEQ    L_6DCF                          ; 6DCB   020C 0002

        SLL     R0,     2                       ; 6DCD   004C
        SLL     R0,     2                       ; 6DCE   004C
L_6DCF:
        XOR@    R3,     R0                      ; 6DCF   03D8
        MVO@    R0,     R3                      ; 6DD0   0258
        MOVR    R2,     R1                      ; 6DD1   0091
        J       L_6B9E                          ; 6DD2   0004 0368 039E
L_6DD5:
        PULR    R7                              ; 6DD5   02B7

        DECLE   $001C,  $0035                   ; 6DD6   001C 0035

        SLL     R0,     2                       ; 6DD8   004C
        SLR     R0,     2                       ; 6DD9   0064
        TSTR    R4                              ; 6DDA   00A4
        BNEQ    L_6DF2                          ; 6DDB   020C 0015

        INCR    R0                              ; 6DDD   0008
        CMP@    R2,     R0                      ; 6DDE   0350
        BEQ     L_6DF2                          ; 6DDF   0204 0011

        MVII    #$017B, R3                      ; 6DE1   02BB 017B
        ADDR    R1,     R3                      ; 6DE3   00CB
        MVI@    R3,     R3                      ; 6DE4   029B
        SDBD                                    ; 6DE5   0001
        ADDI    #$6E51, R3                      ; 6DE6   02FB 0051 006E
        MVI@    R3,     R3                      ; 6DE9   029B
        CMPI    #$0009, R0                      ; 6DEA   0378 0009
        BNEQ    L_6DF3                          ; 6DEC   020C 0005

        CMPI    #$0002, R3                      ; 6DEE   037B 0002
        BEQ     L_6E03                          ; 6DF0   0204 0011
L_6DF2:
        PULR    R7                              ; 6DF2   02B7

L_6DF3:
        CMPI    #$0001, R3                      ; 6DF3   037B 0001
        BEQ     L_6E03                          ; 6DF5   0204 000C

        PSHR    R2                              ; 6DF7   0272
        PSHR    R0                              ; 6DF8   0270
        MVII    #$0003, R2                      ; 6DF9   02BA 0003
        NEGR    R2                              ; 6DFB   0022

        JSR     R5,     L_6E5A                  ; 6DFC   0004 016C 025A

        PULR    R0                              ; 6DFF   02B0
        PULR    R2                              ; 6E00   02B2
        MVII    #$0001, R3                      ; 6E01   02BB 0001
L_6E03:
        MVO@    R0,     R2                      ; 6E03   0250
        MOVR    R3,     R2                      ; 6E04   009A
        PSHR    R2                              ; 6E05   0272
        PSHR    R1                              ; 6E06   0271
        MVII    #$0025, R3                      ; 6E07   02BB 0025
        ADDR    R1,     R3                      ; 6E09   00CB
        ADDR    R1,     R3                      ; 6E0A   00CB
        ADDR    R1,     R3                      ; 6E0B   00CB
        SDBD                                    ; 6E0C   0001
        MVII    #$6388, R1                      ; 6E0D   02B9 0088 0063
        CMPI    #$0002, R2                      ; 6E10   037A 0002
        BEQ     L_6E16                          ; 6E12   0204 0002

        ADDI    #$000A, R1                      ; 6E14   02F9 000A
L_6E16:
        PSHR    R3                              ; 6E16   0273
        PSHR    R1                              ; 6E17   0271

        JSR     R5,     L_6922                  ; 6E18   0004 0168 0122

        PULR    R1                              ; 6E1B   02B1

        JSR     R5,     L_6F10                  ; 6E1C   0004 016C 0310

        PULR    R2                              ; 6E1F   02B2
        MVII    #$0330, R3                      ; 6E20   02BB 0330
        ADDR    R1,     R3                      ; 6E22   00CB
        ADDR    R1,     R3                      ; 6E23   00CB
        SDBD                                    ; 6E24   0001
        MVII    #$63D7, R4                      ; 6E25   02BC 00D7 0063
        TSTR    R1                              ; 6E28   0089
        BEQ     L_6E2D                          ; 6E29   0204 0002

        ADDI    #$0010, R4                      ; 6E2B   02FC 0010
L_6E2D:
        PSHR    R1                              ; 6E2D   0271
        PSHR    R2                              ; 6E2E   0272

        JSR     R5,     L_5FB5                  ; 6E2F   0004 015C 03B5

        PULR    R2                              ; 6E32   02B2
        PULR    R1                              ; 6E33   02B1
        MVII    #$023C, R4                      ; 6E34   02BC 023C
        TSTR    R1                              ; 6E36   0089
        BEQ     L_6E3B                          ; 6E37   0204 0002

        ADDI    #$000B, R4                      ; 6E39   02FC 000B
L_6E3B:
        PSHR    R1                              ; 6E3B   0271
        MOVR    R1,     R0                      ; 6E3C   0088
        SDBD                                    ; 6E3D   0001
        MVII    #$63B7, R1                      ; 6E3E   02B9 00B7 0063
        CMPI    #$0001, R2                      ; 6E41   037A 0001
        BEQ     L_6E49                          ; 6E43   0204 0004

        SUBI    #$0012, R1                      ; 6E45   0339 0012
        ADDI    #$0029, R4                      ; 6E47   02FC 0029

L_6E49:
        JSR     R5,     L_6281                  ; 6E49   0004 0160 0281

        PULR    R0                              ; 6E4C   02B0
        CLRR    R3                              ; 6E4D   01DB
        J       L_57C5                          ; 6E4E   0004 0354 03C5

        DECLE   $0003,  $0003,  $0003,  $0003   ; 6E51   0003 0003 0003 0003
        DECLE   $0002,  $0001,  $0002,  $0001   ; 6E55   0002 0001 0002 0001

        DIS                                     ; 6E59   0003
L_6E5A:
        PSHR    R5                              ; 6E5A   0275
L_6E5B:
        PSHR    R1                              ; 6E5B   0271
        MVII    #$02F4, R5                      ; 6E5C   02BD 02F4
        ADDR    R1,     R5                      ; 6E5E   00CD
        ADD@    R5,     R2                      ; 6E5F   02EA
        BPL     L_6E63                          ; 6E60   0203 0001

        CLRR    R2                              ; 6E62   01D2
L_6E63:
        MOVR    R2,     R0                      ; 6E63   0090
        DECR    R5                              ; 6E64   0015
        MVO@    R2,     R5                      ; 6E65   026A
        MVII    #$02DD, R4                      ; 6E66   02BC 02DD
        TSTR    R1                              ; 6E68   0089
        BEQ     L_6E6D                          ; 6E69   0204 0002

        ADDI    #$000B, R4                      ; 6E6B   02FC 000B
L_6E6D:
        MVII    #$0006, R3                      ; 6E6D   02BB 0006
        MVII    #$0026, R1                      ; 6E6F   02B9 0026
        MVO@    R1,     R4                      ; 6E71   0261
        MVII    #$0004, R1                      ; 6E72   02B9 0004

        JSR     R5,     X_PRNUM_RGT             ; 6E74   0004 0118 00C5

        ADDI    #$0004, R4                      ; 6E77   02FC 0004
        MVII    #$0086, R1                      ; 6E79   02B9 0086
        MVO@    R1,     R4                      ; 6E7B   0261

        JSR     R5,     L_6A80                  ; 6E7C   0004 0168 0280

        PULR    R1                              ; 6E7F   02B1
        PULR    R7                              ; 6E80   02B7

L_6E81:
        PSHR    R5                              ; 6E81   0275
        SLR     R1,     2                       ; 6E82   0065
        SLR     R1,     2                       ; 6E83   0065
        SLR     R2,     2                       ; 6E84   0066
        SLR     R2,     2                       ; 6E85   0066
        PSHR    R1                              ; 6E86   0271

        JSR     R5,     L_6E8C                  ; 6E87   0004 016C 028C

        PULR    R2                              ; 6E8A   02B2
        INCR    R7                              ; 6E8B   000F

L_6E8C:
        PSHR    R5                              ; 6E8C   0275
L_6E8D:
        DECR    R2                              ; 6E8D   0012
        BMI     L_6E9F                          ; 6E8E   020B 000F

        MOVR    R2,     R1                      ; 6E90   0091
        SLL     R1,     2                       ; 6E91   004D
        SLL     R1,     1                       ; 6E92   0049
        SUBR    R2,     R1                      ; 6E93   0111
        SDBD                                    ; 6E94   0001
        ADDI    #$6BEB, R1                      ; 6E95   02F9 00EB 006B
        MVII    #$0005, R3                      ; 6E98   02BB 0005

        JSR     R5,     X_PRINT_R1              ; 6E9A   0004 0118 0067

        SUBI    #$0006, R4                      ; 6E9D   033C 0006
L_6E9F:
        ADDI    #$0014, R4                      ; 6E9F   02FC 0014
        PULR    R7                              ; 6EA1   02B7

L_6EA2:
        MVII    #$01FE, R0                      ; 6EA2   02B8 01FE
        B       L_6EA7                          ; 6EA4   0200 0001

L_6EA6:
        CLRR    R0                              ; 6EA6   01C0
L_6EA7:
        PSHR    R5                              ; 6EA7   0275
        MVII    #$01D7, R2                      ; 6EA8   02BA 01D7
        ADDR    R1,     R2                      ; 6EAA   00CA
        MVI@    R2,     R2                      ; 6EAB   0292
        MOVR    R2,     R3                      ; 6EAC   0093
        SLR     R2,     2                       ; 6EAD   0066
        ANDI    #$0003, R3                      ; 6EAE   03BB 0003
        MOVR    R2,     R5                      ; 6EB0   0095
        ADDR    R5,     R2                      ; 6EB1   00EA
        ADDR    R5,     R2                      ; 6EB2   00EA
        SLL     R3,     2                       ; 6EB3   004F
        MOVR    R3,     R5                      ; 6EB4   009D
        SLL     R3,     2                       ; 6EB5   004F
        ADDR    R5,     R3                      ; 6EB6   00EB
        ADDR    R2,     R3                      ; 6EB7   00D3
        MVII    #$0266, R4                      ; 6EB8   02BC 0266
        TSTR    R1                              ; 6EBA   0089
        BEQ     L_6EBF                          ; 6EBB   0204 0002

        ADDI    #$000B, R4                      ; 6EBD   02FC 000B
L_6EBF:
        ADDR    R3,     R4                      ; 6EBF   00DC
        MVO@    R0,     R4                      ; 6EC0   0260
        PULR    R7                              ; 6EC1   02B7

L_6EC2:
        MVII    #$01FE, R0                      ; 6EC2   02B8 01FE
        B       L_6EC7                          ; 6EC4   0200 0001

L_6EC6:
        CLRR    R0                              ; 6EC6   01C0
L_6EC7:
        PSHR    R5                              ; 6EC7   0275
        MVII    #$01D5, R2                      ; 6EC8   02BA 01D5
        ADDR    R1,     R2                      ; 6ECA   00CA
        MVI@    R2,     R2                      ; 6ECB   0292
        SLL     R2,     2                       ; 6ECC   004E
        MOVR    R2,     R3                      ; 6ECD   0093
        SLL     R2,     2                       ; 6ECE   004E
        ADDR    R3,     R2                      ; 6ECF   00DA
        MVII    #$0266, R4                      ; 6ED0   02BC 0266
        TSTR    R1                              ; 6ED2   0089
        BEQ     L_6ED7                          ; 6ED3   0204 0002

        ADDI    #$000B, R4                      ; 6ED5   02FC 000B
L_6ED7:
        ADDR    R2,     R4                      ; 6ED7   00D4
        MVII    #$01B1, R3                      ; 6ED8   02BB 01B1
        ADDR    R1,     R3                      ; 6EDA   00CB
        MVI@    R3,     R3                      ; 6EDB   029B
        CMPI    #$0005, R3                      ; 6EDC   037B 0005
        BNEQ    L_6EE1                          ; 6EDE   020C 0001

        MVO@    R0,     R4                      ; 6EE0   0260
L_6EE1:
        PULR    R7                              ; 6EE1   02B7

L_6EE2:
        PSHR    R5                              ; 6EE2   0275
        ANDI    #$000F, R1                      ; 6EE3   03B9 000F
        ANDI    #$000F, R2                      ; 6EE5   03BA 000F
        PSHR    R1                              ; 6EE7   0271
        MOVR    R2,     R1                      ; 6EE8   0091

        JSR     R5,     L_6EF2                  ; 6EE9   0004 016C 02F2

        PULR    R1                              ; 6EEC   02B1
        MOVR    R1,     R2                      ; 6EED   008A

        JSR     R5,     L_6EF2                  ; 6EEE   0004 016C 02F2

        PULR    R7                              ; 6EF1   02B7

L_6EF2:
        ADDR    R2,     R1                      ; 6EF2   00D1
        ADDR    R2,     R1                      ; 6EF3   00D1
        BEQ     L_6EFA                          ; 6EF4   0204 0004

        ADDI    #$01BA, R1                      ; 6EF6   02F9 01BA
        MVI@    R1,     R1                      ; 6EF8   0289
        INCR    R1                              ; 6EF9   0009
L_6EFA:
        PSHR    R5                              ; 6EFA   0275
        TSTR    R1                              ; 6EFB   0089
        BNEQ    L_6F02                          ; 6EFC   020C 0004

        MVO@    R1,     R4                      ; 6EFE   0261
        MVO@    R1,     R4                      ; 6EFF   0261
        B       L_6F06                          ; 6F00   0200 0004

L_6F02:
        DECR    R1                              ; 6F02   0011

        JSR     R5,     L_6259                  ; 6F03   0004 0160 0259

L_6F06:
        ADDI    #$0012, R4                      ; 6F06   02FC 0012
        PULR    R7                              ; 6F08   02B7

L_6F09:
        PSHR    R5                              ; 6F09   0275
        MOVR    R2,     R1                      ; 6F0A   0091
        SLR     R1,     2                       ; 6F0B   0065
        SLR     R1,     2                       ; 6F0C   0065
        ANDI    #$000F, R2                      ; 6F0D   03BA 000F
        PULR    R7                              ; 6F0F   02B7

L_6F10:
        PSHR    R5                              ; 6F10   0275
        PSHR    R1                              ; 6F11   0271
        MOVR    R1,     R0                      ; 6F12   0088
        ADDI    #$0334, R1                      ; 6F13   02F9 0334
        CLRR    R3                              ; 6F15   01DB
        MVO@    R3,     R1                      ; 6F16   024B
        ADDI    #$0004, R1                      ; 6F17   02F9 0004
        ADDR    R0,     R1                      ; 6F19   00C1
        MVO@    R3,     R1                      ; 6F1A   024B
        INCR    R1                              ; 6F1B   0009
        MVO@    R3,     R1                      ; 6F1C   024B

        JSR     R5,     L_6006                  ; 6F1D   0004 0160 0006

        PULR    R1                              ; 6F20   02B1
        CLRR    R3                              ; 6F21   01DB
        MVII    #$023C, R4                      ; 6F22   02BC 023C
        TSTR    R1                              ; 6F24   0089
        BEQ     L_6F29                          ; 6F25   0204 0002

        ADDI    #$000B, R4                      ; 6F27   02FC 000B
L_6F29:
        PSHR    R4                              ; 6F29   0274
        MVII    #$0007, R2                      ; 6F2A   02BA 0007
L_6F2C:
        PSHR    R4                              ; 6F2C   0274
        MVII    #$0009, R5                      ; 6F2D   02BD 0009
L_6F2F:
        MVO@    R3,     R4                      ; 6F2F   0263
        DECR    R5                              ; 6F30   0015
        BNEQ    L_6F2F                          ; 6F31   022C 0003

        PULR    R4                              ; 6F33   02B4
        ADDI    #$0014, R4                      ; 6F34   02FC 0014
        DECR    R2                              ; 6F36   0012
        BNEQ    L_6F2C                          ; 6F37   022C 000C

        PULR    R4                              ; 6F39   02B4
        PULR    R7                              ; 6F3A   02B7

L_6F3B:
        PSHR    R5                              ; 6F3B   0275
        MVII    #$01BD, R4                      ; 6F3C   02BC 01BD
L_6F3E:
        MVI@    R4,     R3                      ; 6F3E   02A3
        MVI@    R4,     R1                      ; 6F3F   02A1
        ADD@    R4,     R1                      ; 6F40   02E1
        BNEQ    L_6F55                          ; 6F41   020C 0012

L_6F43:
        INCR    R3                              ; 6F43   000B
        SDBD                                    ; 6F44   0001
        CMPI    #$003B, R3                      ; 6F45   037B 003B 0000
        BLT     L_6F4B                          ; 6F48   0205 0001

        CLRR    R3                              ; 6F4A   01DB

L_6F4B:
        JSR     R5,     L_6273                  ; 6F4B   0004 0160 0273

        BEQ     L_6F43                          ; 6F4E   0224 000C

        SUBI    #$0003, R4                      ; 6F50   033C 0003
        MVO@    R3,     R4                      ; 6F52   0263
        ADDI    #$0002, R4                      ; 6F53   02FC 0002
L_6F55:
        CMPI    #$01D5, R4                      ; 6F55   037C 01D5
        BNEQ    L_6F3E                          ; 6F57   022C 001A
        INCR    R7                              ; 6F59   000F

L_6F5A:
        PSHR    R5                              ; 6F5A   0275
L_6F5B:
        MVII    #$0008, R3                      ; 6F5B   02BB 0008
        SDBD                                    ; 6F5D   0001
        MVII    #$68E4, R5                      ; 6F5E   02BD 00E4 0068
        MVII    #$01BE, R4                      ; 6F61   02BC 01BE
L_6F63:
        MVI@    R5,     R1                      ; 6F63   02A9
        MVO@    R1,     R4                      ; 6F64   0261
        MVI@    R5,     R1                      ; 6F65   02A9
        MVO@    R1,     R4                      ; 6F66   0261
        INCR    R4                              ; 6F67   000C
        DECR    R3                              ; 6F68   0013
        BNEQ    L_6F63                          ; 6F69   022C 0007
        PULR    R7                              ; 6F6B   02B7

        PSHR    R5                              ; 6F6C   0275
L_6F6D:
        TSTR    R0                              ; 6F6D   0080
        BMI     L_6FC0                          ; 6F6E   020B 0050

        MVI     G_01AE, R0                      ; 6F70   0280 01AE
        TSTR    R0                              ; 6F72   0080
        BNEQ    L_6F92                          ; 6F73   020C 001D

        MVI     G_01AD, R0                      ; 6F75   0280 01AD
        TSTR    R0                              ; 6F77   0080
        BEQ     L_6FC0                          ; 6F78   0204 0046

        MVI     G_01DB, R0                      ; 6F7A   0280 01DB
        INCR    R0                              ; 6F7C   0008
        ANDI    #$000F, R0                      ; 6F7D   03B8 000F
        MVO     R0,     G_01DB                  ; 6F7F   0240 01DB
        BNEQ    L_6FC0                          ; 6F81   020C 003D

        MVI     G_01B0, R0                      ; 6F83   0280 01B0
        INCR    R0                              ; 6F85   0008
        SDBD                                    ; 6F86   0001
        CMPI    #$003B, R0                      ; 6F87   0378 003B 0000
        BLT     L_6F8D                          ; 6F8A   0205 0001

        CLRR    R0                              ; 6F8C   01C0
L_6F8D:
        MVO     R0,     G_01B0                  ; 6F8D   0240 01B0
        J       L_5F02                          ; 6F8F   0004 035C 0302

L_6F92:
        MVII    #$02F6, R5                      ; 6F92   02BD 02F6
        ADDR    R1,     R5                      ; 6F94   00CD
        MVI@    R5,     R0                      ; 6F95   02A8
        TSTR    R0                              ; 6F96   0080
        BEQ     L_6FC0                          ; 6F97   0204 0027
        BPL     L_6FAA                          ; 6F99   0203 000F

        ADDI    #$0040, R0                      ; 6F9B   02F8 0040
        BMI     L_6FAE                          ; 6F9D   020B 000F

L_6F9F:
        CLRR    R0                              ; 6F9F   01C0
        MVII    #$0126, R3                      ; 6FA0   02BB 0126
        TSTR    R1                              ; 6FA2   0089
        BEQ     L_6FA7                          ; 6FA3   0204 0002

        ADDI    #$0002, R3                      ; 6FA5   02FB 0002
L_6FA7:
        MVO@    R0,     R3                      ; 6FA7   0258
        B       L_6FAE                          ; 6FA8   0200 0004

L_6FAA:
        SUBI    #$0040, R0                      ; 6FAA   0338 0040
        BMI     L_6F9F                          ; 6FAC   022B 000E

L_6FAE:
        DECR    R5                              ; 6FAE   0015
        MVO@    R0,     R5                      ; 6FAF   0268
        MOVR    R1,     R0                      ; 6FB0   0088
        PSHR    R0                              ; 6FB1   0270

        JSR     R5,     L_6045                  ; 6FB2   0004 0160 0045

        PULR    R0                              ; 6FB5   02B0
        CMP     G_01DA, R0                      ; 6FB6   0340 01DA
        BNEQ    L_6FC0                          ; 6FB8   020C 0006

        JSR     R5,     X_PLAY_SFX2             ; 6FBA   0004 0118 03BE
        DECLE   $0072                           ; 6FBD  SFX prio
        DECLE   $03F9                           ; 6FBE  SFX data
        DECLE   $02CF                           ; 6FBF  SFX end

L_6FC0:
        PULR    R7                              ; 6FC0   02B7

        PSHR    R5                              ; 6FC1   0275
        MVII    #$01B1, R2                      ; 6FC2   02BA 01B1
        ADDR    R1,     R2                      ; 6FC4   00CA
        MVI@    R2,     R2                      ; 6FC5   0292
        TSTR    R2                              ; 6FC6   0092
        BEQ     L_6F6D                          ; 6FC7   0224 005B

        CMPI    #$0001, R0                      ; 6FC9   0378 0001
        BNEQ    L_6FF9                          ; 6FCB   020C 002C

        CMPI    #$0005, R2                      ; 6FCD   037A 0005
        BNEQ    L_6FE2                          ; 6FCF   020C 0011

        PSHR    R1                              ; 6FD1   0271

        JSR     R5,     L_6EC6                  ; 6FD2   0004 016C 02C6

        PULR    R1                              ; 6FD5   02B1
        MVII    #$01D5, R2                      ; 6FD6   02BA 01D5
        ADDR    R1,     R2                      ; 6FD8   00CA
        MVI@    R2,     R3                      ; 6FD9   0293
        INCR    R3                              ; 6FDA   000B
        ANDI    #$0003, R3                      ; 6FDB   03BB 0003
        MVO@    R3,     R2                      ; 6FDD   0253

        JSR     R5,     L_6EC2                  ; 6FDE   0004 016C 02C2

        PULR    R7                              ; 6FE1   02B7

L_6FE2:
        CMPI    #$000B, R2                      ; 6FE2   037A 000B
        BNEQ    L_6FF9                          ; 6FE4   020C 0013

        PSHR    R1                              ; 6FE6   0271

        JSR     R5,     L_6EA6                  ; 6FE7   0004 016C 02A6

        PULR    R1                              ; 6FEA   02B1
        MVII    #$01D7, R2                      ; 6FEB   02BA 01D7
        ADDR    R1,     R2                      ; 6FED   00CA
        MVI@    R2,     R3                      ; 6FEE   0293
        INCR    R3                              ; 6FEF   000B
        CMPI    #$0008, R3                      ; 6FF0   037B 0008
        BNEQ    L_6FF5                          ; 6FF2   020C 0001

        CLRR    R3                              ; 6FF4   01DB
L_6FF5:
        MVO@    R3,     R2                      ; 6FF5   0253

        JSR     R5,     L_6EA2                  ; 6FF6   0004 016C 02A2

L_6FF9:
        PULR    R7                              ; 6FF9   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6FFE   0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5017       <entry>
;;  $5055       $5059  
;;  $505C       $505F  
;;  $5064       $50B8  
;;  $5073       $508F  
;;  $507A       $5075  
;;  $5088       $5078  
;;  $508A       $5086  
;;  $5091       $5067  
;;  $50A0       $5094  
;;  $50AB       $509E  
;;  $50B2       $50A1  
;;  $50BA       $50AF  
;;  $50BB       $50F3  
;;  $50E0       $50D5   $50DC  
;;  $50E5       $50D8  
;;  $50EF       $50C5  
;;  $50F6       $5110  
;;  $5109       $5113  
;;  $510A       $5105  
;;  $511B       $510E  
;;  $5125       $5136  
;;  $5141       $518A  
;;  $517F       $517A  
;;  $5180       $5183  
;;  $5186       $5147   $514D  
;;  $5197       $51B7  
;;  $51AD       $51B0  
;;  $51C1       $51DC  
;;  $51EA       $51E1  
;;  $521C       $521F  
;;  $527E       $5259   $525E  
;;  $528F       $528B  
;;  $5292       $5285  
;;  $52A6       $52A3  
;;  $52BB       $5293   $52A7  
;;  $52C0       $52E9  
;;  $52C7       $52CF  
;;  $52D1       $52C9  
;;  $52D3       $52E3   $54F7   $61E7  
;;  $52DC       $5262   $5267   $592A   $5F35   $5F3A  
;;  $5302       $5322  
;;  $530B       $52FA  
;;  $5315       $52F1  
;;  $5324       $531B  
;;  $5329       $5300   $530F   $5313   $5320   $5326  
;;  $532E       $5337  
;;  $5336       $5333  
;;  $533B       $533D  
;;  $534B       $5345   $5348  
;;  $537D       $5378  
;;  $538B       $5359  
;;  $539C       $5394  
;;  $539F       $537A   $5918  
;;  $53B4       $53B1  
;;  $53C1       $53BC  
;;  $53CD       $53C8  
;;  $53D4       $53CF  
;;  $53D6       $526B   $5270   $5B40  
;;  $53ED       $53E8  
;;  $53F0       $53EB  
;;  $5419       $5416  
;;  $5420       $540E   $541D  
;;  $5433       $5425  
;;  $5439       $5448  
;;  $5445       $543D  
;;  $544A       $53F9  
;;  $544B       $5410   $5433  
;;  $5455       $5451  
;;  $5456       $5413   $541A   $543A  
;;  $5470       $5407  
;;  $5487       $5474  
;;  $54A0       $548B  
;;  $54A1       $5490   $549E  
;;  $54A6       $547B   $5484   $5497  
;;  $54A7       $54A5  
;;  $54AF       $54C7  
;;  $54B8       $54B4  
;;  $54C6       $54BD  
;;  $54C9       $54B1  
;;  $54F2       $554C   $5912   $601E  
;;  $54FC       $54FE  
;;  $5501       $5506  
;;  $5510       $550C  
;;  $5511       $5277  
;;  $5512       $527C  
;;  $5520       $551A  
;;  $5536       $5533  
;;  $553B       $552B   $552E  
;;  $5543       $5309  
;;  $5558       $5567  
;;  $5562       $555D  
;;  $5569       $5560  
;;  $558F       $55CA   $5730  
;;  $5590       $55BE  
;;  $5591       $558D  
;;  $559E       $559A   $55BC  
;;  $55B0       $553C  
;;  $55B5       $55B1  
;;  $55C0       $5AFA   $5AFF  
;;  $55C1       $5541   $5E58  
;;  $55F9       $55C7  
;;  $5609       $55FE  
;;  $5638       $563C  
;;  $5647       $563A   $5642  
;;  $565B       $5657  
;;  $5661       $565C  
;;  $5662       $562F  
;;  $5675       $566B  
;;  $5680       $561A  
;;  $568B       $5684  
;;  $5696       $5603   $568F  
;;  $569D       $560A   $560F  
;;  $56C7       $56C1  
;;  $56D6       $56D0  
;;  $56D7       $56D5  
;;  $5704       $5700  
;;  $5718       $5710  
;;  $5752       $56EF   $56F1  
;;  $5757       $5754  
;;  $5758       $56FC  
;;  $575A       $590A  
;;  $5760       $56DD   $5722  
;;  $5761       $56A2   $56AA  
;;  $5777       $5772   $57A4  
;;  $5785       $5764   $576B   $5775  
;;  $5786       $5648   $564D  
;;  $57A6       $578A   $5790  
;;  $57A7       $5761   $57C5  
;;  $57B3       $57AD  
;;  $57BB       $57B7  
;;  $57BE       $57B1  
;;  $57BF       $561E   $5623  
;;  $57C5       $57C3   $6E4E  
;;  $57D6       $57C8  
;;  $57D7       $55DC   $5795   $57CA  
;;  $57E0       $57DD  
;;  $57E6       $57E2  
;;  $57E8       $565E   $6250  
;;  $5810       $580C  
;;  $581C       $5807  
;;  $5836       $57EC   $57F2  
;;  $583F       $5839  
;;  $5840       $583E  
;;  $586B       $5867  
;;  $586F       $58CE  
;;  $58A4       $589E  
;;  $58B1       $5895   $5897  
;;  $58B4       $58AF  
;;  $58C5       $587A   $58BB  
;;  $58D3       $5852   $5856   $58DC  
;;  $58D4       $584A  
;;  $58E5       $58FE  
;;  $58ED       $58E9  
;;  $58F2       $58EE  
;;  $5900       $5905  
;;  $5901       $584E  
;;  $590C       $5862   $58D6  
;;  $590F       $6B6C  
;;  $593C       $587E   $58BF  
;;  $5948       $594D  
;;  $5951       $5945  
;;  $5952       $5955  
;;  $59A4       $5A99   $5A9E  
;;  $59BC       $59B7  
;;  $59C8       $59F4  
;;  $59CB       $59EC  
;;  $59D3       $59CE  
;;  $59E7       $59E4  
;;  $59EB       $59D1  
;;  $59F6       $59BE  
;;  $59F8       $59AF  
;;  $5A0D       $5273  
;;  $5A16       $5A79  
;;  $5A29       $5A1E  
;;  $5A2D       $5A27  
;;  $5A36       $5A33  
;;  $5A3B       $5A17  
;;  $5A4E       $5A49  
;;  $5A5B       $5A53  
;;  $5A5D       $5A59  
;;  $5A6B       $5A14  
;;  $5A76       $5A73  
;;  $5A85       $5A39  
;;  $5AB3       $5AAC  
;;  $5ABC       $5AB1  
;;  $5AC7       $5AC1  
;;  $5AE4       $5ACF  
;;  $5AF3       $5AED  
;;  $5AFF       $5AE1  
;;  $5B06       $5ACA   $5AF7  
;;  $5B07       $5A57   $5A69  
;;  $5B0E       $5579   $55CF   $5735   $59FB   $5B08   $5E67   $5E6C  
;;  $5B0F       $5B0D  
;;  $5B2F       $5B2B  
;;  $5B3A       $5939  
;;  $5B43       $5B18  
;;  $5B44       $5ADE   $5AF4  
;;  $5B49       $5B46  
;;  $5B4C       $59AA  
;;  $5B62       $5B50  
;;  $5B69       $5B65  
;;  $5B6B       $5B60  
;;  $5B6D       $5B5E  
;;  $5B7A       $5B76  
;;  $5B7D       $5B73   $5B9F  
;;  $5B94       $5B70  
;;  $5B9E       $5B9A  
;;  $5BA1       $5B7B   $5B95  
;;  $5BAA       $5BA5  
;;  $5BB7       $5BB1  
;;  $5BBE       $5BBA  
;;  $5BD3       $5B55   $5BC3  
;;  $5BD8       $5BD1  
;;  $5BDB       $5A8C   $5A90  
;;  $5BFA       $5BE0  
;;  $5BFF       $5BF5   $5BF8  
;;  $5C08       $5C02  
;;  $5C13       $5C0F  
;;  $5C16       $5AD8   $5C08  
;;  $5C1D       $5C22  
;;  $5C21       $5C1E  
;;  $5C25       $5AD4   $5BFA  
;;  $5C31       $5C2D  
;;  $5C56       $5A95  
;;  $5C63       $5C5F  
;;  $5C76       $5C66  
;;  $5D0E       $5D0C  
;;  $5D22       $5D20  
;;  $5DAD       $5CAB  
;;  $5E14       $5C92  
;;  $5E5B       $5E56  
;;  $5E74       $5E40  
;;  $5E90       $5E84  
;;  $5E91       $5E30   $5E37   $5E3C   $5E44   $5E48   $5E50   $5E5D  
;;  $5E9B       $579C  
;;  $5EBC       $5EB8  
;;  $5EC0       $5EA3  
;;  $5EE1       $5EDC  
;;  $5EE7       $5EDF   $5EE3  
;;  $5F01       $5E9D   $5EA8   $5EB1   $5EC9   $5EF1  
;;  $5F02       $5EBE   $6F8F  
;;  $5F0F       $5061  
;;  $5F13       $6AD3  
;;  $5FB5       $5718   $5F59   $6E2F  
;;  $5FB7       $6016  
;;  $5FB8       $5FB6   $5FD9  
;;  $5FDC       $53F0   $5A85  
;;  $5FE1       $5FE2  
;;  $5FF2       $52DD   $53D7   $55C1   $56D7   $5B10   $5EC1  
;;  $5FFC       $5FF9  
;;  $5FFD       $553E   $5E53  
;;  $6006       $61D9   $6F1D  
;;  $6015       $600F  
;;  $6030       $602D  
;;  $6035       $6027  
;;  $603E       $569E   $5766   $57A0   $5EC5  
;;  $6045       $55AC   $56C4   $5EEA   $5F49   $5F4E   $6FB2  
;;  $604D       $6049  
;;  $606E       $6063  
;;  $6088       $5382  
;;  $6091       $5B30  
;;  $60A2       $609E  
;;  $60A3       $60C2  
;;  $60A7       $60B7  
;;  $60B4       $60A9  
;;  $60B5       $60B2  
;;  $60C8       $5B81   $5BD5  
;;  $60C9       $60C7  
;;  $60D0       $60CC  
;;  $60DD       $60D2   $60D7  
;;  $60DE       $60DC  
;;  $60E6       $60E0  
;;  $60E8       $58AB   $60AD   $60E2  
;;  $60FE       $60F6   $60FA  
;;  $6104       $60F0  
;;  $610A       $6107  
;;  $6113       $610D  
;;  $6114       $60F3   $6102  
;;  $6116       $53FB   $60EA   $61C5  
;;  $611D       $611A  
;;  $6124       $6120  
;;  $612E       $5398   $5678   $567D  
;;  $6136       $6132  
;;  $6164       $6160  
;;  $616C       $6166  
;;  $61AC       $61B4  
;;  $61B2       $61AD  
;;  $61B3       $61B0  
;;  $61B6       $616A  
;;  $61B7       $613B   $6141   $6148   $614F   $6156  
;;  $61B8       $61C1  
;;  $61C4       $5387   $6B68  
;;  $61D7       $5935   $5F3E   $5F43  
;;  $61E4       $61E0  
;;  $61F9       $61EF  
;;  $6200       $539C  
;;  $6207       $6203  
;;  $622C       $6228  
;;  $6234       $621E  
;;  $6247       $624E  
;;  $6256       $6237   $623D   $6249  
;;  $6259       $6BAC   $6CCE   $6F03  
;;  $625A       $6214   $6258  
;;  $6273       $623A   $6B7A   $6D26   $6F4B  
;;  $6276       $627D  
;;  $6280       $6277  
;;  $6281       $5F28   $6E49  
;;  $6287       $62D2  
;;  $6289       $62CB  
;;  $6296       $629A  
;;  $629C       $6297  
;;  $62AB       $62A5  
;;  $62B9       $62B3  
;;  $62BE       $62AF   $62BA  
;;  $62C3       $62C6  
;;  $631C       $631A  
;;  $64DD       $68DB  
;;  $6538       $6536  
;;  $65C6       $65C4  
;;  $660B       $6609  
;;  $6680       $6680  
;;  $6682       $6682  
;;  $6690       $68C0  
;;  $66C4       $66BA  
;;  $670F       $66FE  
;;  $6759       $672D  
;;  $67A1       $657F  
;;  $67C7       $6641  
;;  $67DC       $6796  
;;  $67F2       $67F2  
;;  $68FA       $68FA  
;;  $6922       $5370   $5C73   $61A4   $61D3   $692C   $6E18  
;;  $6924       $692E  
;;  $6930       $6926  
;;  $6948       $6959  
;;  $6965       $6949  
;;  $6969       $6940  
;;  $6971       $5226   $6960  
;;  $697A       $6986  
;;  $6981       $6983  
;;  $6A1C       $6A1A  
;;  $6A80       $6E7C  
;;  $6A8C       $6A84  
;;  $6A8D       $5AB4   $5AB9  
;;  $6A9E       $6A94  
;;  $6A9F       $6A9C  
;;  $6AC9       $6ACF  
;;  $6ACA       $6AC3  
;;  $6AE4       $57FE  
;;  $6AE5       $6ADB   $6AE3  
;;  $6AEF       $6ABE   $6AC7   $6ACB  
;;  $6AF7       $6AE8  
;;  $6AF8       $6AEF  
;;  $6B00       $6B05  
;;  $6B08       $6B02  
;;  $6B2E       $6B22   $6B28  
;;  $6B54       $6B4F  
;;  $6B58       $6B5E  
;;  $6B61       $6B46  
;;  $6B6F       $6B41  
;;  $6B80       $6B87  
;;  $6B89       $6B84  
;;  $6B8F       $6B74   $6B7D  
;;  $6B91       $6B8D  
;;  $6B9E       $6D7A   $6DB5   $6DD2  
;;  $6BA1       $528F  
;;  $6BD5       $6BD1  
;;  $6BDD       $6BE4  
;;  $6BEA       $6B92   $6B9A  
;;  $6C27       $6C4D  
;;  $6C3A       $6C33   $6C36  
;;  $6C4B       $6C47  
;;  $6C4F       $6C08  
;;  $6C6C       $6C68  
;;  $6C88       $6C51  
;;  $6CB2       $6C8A  
;;  $6CB3       $5F06   $5F0B   $6CAB  
;;  $6CCC       $6CB7  
;;  $6CD2       $5688   $5693   $6C92  
;;  $6CE8       $6CDB  
;;  $6CF3       $6CE6  
;;  $6D16       $6D0D  
;;  $6D18       $6D14  
;;  $6D24       $6B17  
;;  $6D3E       $6D36  
;;  $6D42       $6D3C  
;;  $6D56       $6D52  
;;  $6D58       $6D5D  
;;  $6D74       $6D70   $6D76  
;;  $6D7C       $6D46  
;;  $6D83       $6D7F  
;;  $6D8D       $6D93  
;;  $6D95       $6D8E  
;;  $6D99       $6DB9  
;;  $6DB8       $6D9D   $6DA6  
;;  $6DCF       $6DCB  
;;  $6DD5       $6D1F   $6D49   $6D66   $6DBF   $6DC2  
;;  $6DF2       $6DDB   $6DDF  
;;  $6DF3       $6DEC  
;;  $6E03       $6DF0   $6DF5  
;;  $6E16       $6E12  
;;  $6E2D       $6E29  
;;  $6E3B       $6E37  
;;  $6E49       $6E43  
;;  $6E5A       $55E9   $572B   $5782   $6DB2   $6DFC  
;;  $6E5B       $6CB0  
;;  $6E63       $6E60  
;;  $6E6D       $6E69  
;;  $6E81       $6C7F   $6C85  
;;  $6E8C       $6E87  
;;  $6E8D       $6E8B  
;;  $6E9F       $6E8E  
;;  $6EA2       $6C11   $6FF6  
;;  $6EA6       $6FE7  
;;  $6EA7       $6EA4  
;;  $6EBF       $6EBB  
;;  $6EC2       $6BE7   $6FDE  
;;  $6EC6       $6FD2  
;;  $6EC7       $6EC4  
;;  $6ED7       $6ED3  
;;  $6EE1       $6EDE  
;;  $6EE2       $6BC1   $6BC9   $6C70   $6C76  
;;  $6EF2       $6EE9   $6EEE  
;;  $6EFA       $6C3B   $6EF4  
;;  $6F02       $6EFC  
;;  $6F06       $6F00  
;;  $6F09       $6BBC   $6BC6  
;;  $6F10       $6B63   $6B9E   $6C0D   $6C55   $6C8F   $6E1C  
;;  $6F29       $6F25  
;;  $6F2C       $6F37  
;;  $6F2F       $6F31  
;;  $6F3B       $5644  
;;  $6F3E       $6F57  
;;  $6F43       $6F4E  
;;  $6F4B       $6F48  
;;  $6F55       $6F41  
;;  $6F5A       $6B51  
;;  $6F5B       $6F59  
;;  $6F63       $6F69  
;;  $6F6D       $6FC7  
;;  $6F8D       $6F8A  
;;  $6F92       $6F73  
;;  $6F9F       $6FAC  
;;  $6FA7       $6FA3  
;;  $6FAA       $6F99  
;;  $6FAE       $6F9D   $6FA8  
;;  $6FC0       $6F6E   $6F78   $6F81   $6F97   $6FB8  
;;  $6FE2       $6FCF  
;;  $6FF5       $6FF2  
;;  $6FF9       $6FCB   $6FE4  
;; ======================================================================== ;;
