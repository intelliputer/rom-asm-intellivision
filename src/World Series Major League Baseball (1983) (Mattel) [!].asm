
        ORG     $5000
.HEADER:
        DECLE   $0000                           ; 5000   0000

        ADDR    R2,     R0                      ; 5001   00D0
        DECLE   $0000                           ; 5002   0000

        ADDR    R6,     R0                      ; 5003   00F0
        COMR    R5                              ; 5004   001D
        ADDR    R6,     R0                      ; 5005   00F0
        MOVR    R0,     R3                      ; 5006   0083
        ADDR    R6,     R1                      ; 5007   00F1
        DECR    R2                              ; 5008   0012
        ADDR    R6,     R0                      ; 5009   00F0
L_500A:
        COMR    R2                              ; 500A   001A
        ADDR    R6,     R0                      ; 500B   00F0
        XORR    R4,     R0                      ; 500C   01E0
        DECLE   $0000,  $0000,  $0000,  $0001   ; 500D   0000 0000 0000 0001
        DECLE   $0005,  $0000,  $0000           ; 5011   0005 0000 0000

        ANDR    R0,     R0                      ; 5014   0180
        ANDR    R2,     R0                      ; 5015   0190
        ANDR    R4,     R0                      ; 5016   01A0
        ANDR    R6,     R0                      ; 5017   01B0
        CLRR    R0                              ; 5018   01C0
        XORR    R2,     R0                      ; 5019   01D0
        XORR    R4,     R0                      ; 501A   01E0
        XORR    R6,     R0                      ; 501B   01F0
        ADDR    R5,     R2                      ; 501C   00EA
        SLLC    R3,     1                       ; 501D   005B
        MOVR    R6,     R5                      ; 501E   00B5
        SLLC    R3,     1                       ; 501F   005B
        ADDR    R0,     R3                      ; 5020   00C3
        SLLC    R3,     1                       ; 5021   005B
        TSTR    R5                              ; 5022   00AD
        SLLC    R1,     1                       ; 5023   0059
        TSTR    R5                              ; 5024   00AD
        SLLC    R1,     1                       ; 5025   0059
        ADDR    R5,     R2                      ; 5026   00EA
        SLLC    R3,     1                       ; 5027   005B
        DECLE   $0000,  $0000                   ; 5028   0000 0000

        ADDR    R0,     R3                      ; 502A   00C3
        SLLC    R1,     1                       ; 502B   0059
        ADDR    R6,     R6                      ; 502C   00F6
        SLR     R3,     1                       ; 502D   0063
        ADDR    R6,     R6                      ; 502E   00F6
        SLR     R3,     1                       ; 502F   0063
        SWAP    R2,     1                       ; 5030   0042
        SLLC    R3,     2                       ; 5031   005F
        DECLE   $0000,  $0000                   ; 5032   0000 0000

        ADDR    R0,     R3                      ; 5034   00C3
        SLLC    R1,     1                       ; 5035   0059
        ADDR    R4,     R7                      ; 5036   00E7
        SLLC    R2,     2                       ; 5037   005E
        ADDR    R4,     R7                      ; 5038   00E7
        SLLC    R2,     2                       ; 5039   005E
        MOVR    R1,     R6                      ; 503A   008E
        SLR     R3,     1                       ; 503B   0063
        DECLE   $0000,  $0000                   ; 503C   0000 0000

        RLC     R1,     1                       ; 503E   0051
        SLLC    R2,     1                       ; 503F   005A
        ADDR    R6,     R6                      ; 5040   00F6
        SLR     R3,     1                       ; 5041   0063
        ADDR    R6,     R6                      ; 5042   00F6
        SLR     R3,     1                       ; 5043   0063
        MOVR    R1,     R6                      ; 5044   008E
        SLR     R3,     1                       ; 5045   0063
        DECLE   $0000,  $0000                   ; 5046   0000 0000

        ADDR    R0,     R3                      ; 5048   00C3
        SLLC    R1,     1                       ; 5049   0059
L_504A:
        ADDR    R6,     R6                      ; 504A   00F6
        SLR     R3,     1                       ; 504B   0063
        ADDR    R6,     R6                      ; 504C   00F6
        SLR     R3,     1                       ; 504D   0063
        MOVR    R1,     R6                      ; 504E   008E
        SLR     R3,     1                       ; 504F   0063
        MOVR    R2,     R6                      ; 5050   0096
        SLR     R1,     1                       ; 5051   0061
        ADDR    R0,     R3                      ; 5052   00C3
        SLLC    R1,     1                       ; 5053   0059
        ADDR    R6,     R6                      ; 5054   00F6
        SLR     R3,     1                       ; 5055   0063
        ADDR    R6,     R6                      ; 5056   00F6
        SLR     R3,     1                       ; 5057   0063
        MOVR    R1,     R6                      ; 5058   008E
        SLR     R3,     1                       ; 5059   0063
        MOVR    R2,     R6                      ; 505A   0096
        SLR     R1,     1                       ; 505B   0061
        ADDR    R0,     R3                      ; 505C   00C3
        SLLC    R1,     1                       ; 505D   0059
        ADDR    R6,     R6                      ; 505E   00F6
        SLR     R3,     1                       ; 505F   0063
        ADDR    R6,     R6                      ; 5060   00F6
        SLR     R3,     1                       ; 5061   0063
        MOVR    R7,     R1                      ; 5062   00B9
        ADDI    #$008C, R1                      ; 5063   02F9 008C
        MVII    #$0001, R2                      ; 5065   02BA 0001
        B       L_5074                          ; 5067   0200 000B

L_5069:
        JSR     R5,     G_E460                  ; 5069   0004 01E4 0060
        JSR     R5,     L_50B3                  ; 506C   0004 0150 00B3

        SDBD                                    ; 506F   0001
        MVII    #$5014, R1                      ; 5070   02B9 0014 0050
        CLRR    R2                              ; 5073   01D2
L_5074:
        PSHR    R1                              ; 5074   0271
        PSHR    R2                              ; 5075   0272
        MVII    #$0007, R0                      ; 5076   02B8 0007

        JSR     R5,     .EXEC.41C               ; 5078   0004 0114 001C
        JSR     R5,     L_587C                  ; 507B   0004 0158 007C
        JSR     R5,     L_6FDE                  ; 507E   0004 016C 03DE

        PULR    R2                              ; 5081   02B2
        PULR    R1                              ; 5082   02B1
        SDBD                                    ; 5083   0001
        ADDI    #$FA50, R2                      ; 5084   02FA 0050 00FA
        DECR    R4                              ; 5087   0014
        MVO@    R2,     R4                      ; 5088   0262
        SDBD                                    ; 5089   0001
        MVII    #$0017, R0                      ; 508A   02B8 0017 0000
        MVII    #$01AE, R4                      ; 508D   02BC 01AE

        JSR     R5,     X_FILL_ZERO             ; 508F   0004 0114 0338

        MVII    #$0087, R0                      ; 5092   02B8 0087
        MVO     R0,     G_0173                  ; 5094   0240 0173
L_5096:
        CMP     G_0173, R0                      ; 5096   0340 0173
        BEQ     L_5096                          ; 5098   0224 0003

        MVO     R1,     G_02F0                  ; 509A   0241 02F0
        DIS                                     ; 509C   0003
        MVII    #$0026, R2                      ; 509D   02BA 0026
        MVO     R2,     .ISRVEC.0               ; 509F   0242 0100
        MVII    #$0011, R2                      ; 50A1   02BA 0011
        MVO     R2,     .ISRVEC.1               ; 50A3   0242 0101
        EIS                                     ; 50A5   0002
        MVII    #$0084, R0                      ; 50A6   02B8 0084
        MVO     R0,     G_0102                  ; 50A8   0240 0102
L_50AA:
        CMP     G_0102, R0                      ; 50AA   0340 0102
        BEQ     L_50AA                          ; 50AC   0224 0003

        MVII    #$02F1, R6                      ; 50AE   02BE 02F1
        J       .EXEC.06C                       ; 50B0   0004 0310 006C

L_50B3:
        SDBD                                    ; 50B3   0001
        MVII    #$4795, R1                      ; 50B4   02B9 0095 0047
        MVI     G_0133, R0                      ; 50B7   0280 0133
        TSTR    R0                              ; 50B9   0080
        BEQ     L_50BE                          ; 50BA   0204 0002

        ADDI    #$000A, R1                      ; 50BC   02F9 000A
L_50BE:
        MVI     G_0134, R3                      ; 50BE   0283 0134
L_50C0:
        CMPI    #$0009, R3                      ; 50C0   037B 0009
        BLE     L_50C8                          ; 50C2   0206 0004

        SUBI    #$0009, R3                      ; 50C4   033B 0009
        B       L_50C0                          ; 50C6   0220 0007

L_50C8:
        DECR    R3                              ; 50C8   0013
        ADDR    R1,     R3                      ; 50C9   00CB
        MVI     G_01AD, R2                      ; 50CA   0282 01AD
        ADD     G_01AC, R2                      ; 50CC   02C2 01AC
        MOVR    R2,     R0                      ; 50CE   0090
        ADD@    R3,     R0                      ; 50CF   02D8
        MVO@    R0,     R3                      ; 50D0   0258
        ADDI    #$0009, R1                      ; 50D1   02F9 0009
        ADD@    R1,     R2                      ; 50D3   02CA
        MVO@    R2,     R1                      ; 50D4   024A
        CLRR    R1                              ; 50D5   01C9
        MVO     R1,     G_01AD                  ; 50D6   0241 01AD
        MVO     R1,     G_01AC                  ; 50D8   0241 01AC
        MOVR    R5,     R7                      ; 50DA   00AF
        RLC     R0,     1                       ; 50DB   0050
        ADDR    R2,     R2                      ; 50DC   00D2
        ADDR    R6,     R7                      ; 50DD   00F7
        RLC     R0,     1                       ; 50DE   0050
        NOP                                     ; 50DF   0034
        RLC     R1,     1                       ; 50E0   0051
        RSWD    R0                              ; 50E1   0038
        ADDR    R3,     R0                      ; 50E2   00D8
        DECR    R1                              ; 50E3   0011
        RLC     R1,     1                       ; 50E4   0051
        COMR    R2                              ; 50E5   001A
        ADDR    R6,     R0                      ; 50E6   00F0
        SUBR    R0,     R0                      ; 50E7   0100
        DECLE   $0000,  $0001,  $0000,  $0000   ; 50E8   0000 0001 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 50EC   0000 0000 0000

        ANDR    R0,     R0                      ; 50EF   0180
        ANDR    R2,     R0                      ; 50F0   0190
        ANDR    R4,     R0                      ; 50F1   01A0
        ANDR    R6,     R0                      ; 50F2   01B0
        CLRR    R0                              ; 50F3   01C0
        XORR    R2,     R0                      ; 50F4   01D0
        XORR    R4,     R0                      ; 50F5   01E0
        XORR    R6,     R0                      ; 50F6   01F0
        RRC     R1,     1                       ; 50F7   0071
        COMR    R2                              ; 50F8   001A
        DECLE   $0001                           ; 50F9   0001

        TSTR    R0                              ; 50FA   0080
        MOVR    R4,     R0                      ; 50FB   00A0
        ADDR    R4,     R3                      ; 50FC   00E3
        DECLE   $0001,  $0000                   ; 50FD   0001 0000

        RLC     R2,     2                       ; 50FF   0056
        RLC     R1,     2                       ; 5100   0055
        DECLE   $0001,  $0000                   ; 5101   0001 0000

        ADDR    R5,     R5                      ; 5103   00ED
        SLR     R1,     2                       ; 5104   0065
        DECLE   $0001,  $0000                   ; 5105   0001 0000

        SETC                                    ; 5107   0007
        SAR     R3,     1                       ; 5108   006B
        INCR    R2                              ; 5109   000A
        DECLE   $0000                           ; 510A   0000

        NEGR    R3                              ; 510B   0023
        ADDR    R5,     R3                      ; 510C   00EB
        DIS                                     ; 510D   0003
        DECLE   $0000,  $0000,  $0000           ; 510E   0000 0000 0000

        GSWD    R0                              ; 5111   0030
        DECLE   $0001                           ; 5112   0001

        AND     .STIC.A.1,R0                    ; 5113   0380 0011
        SUBR    R0,     R0                      ; 5115   0100
        BLT     L_5198                          ; 5116   0205 0080

        SLLC    R1,     1                       ; 5118   0059
        MOVR    R6,     R0                      ; 5119   00B0
        SLR     R1,     1                       ; 511A   0061
        MOVR    R6,     R0                      ; 511B   00B0
        SAR     R1,     1                       ; 511C   0069
        ANDR    R6,     R0                      ; 511D   01B0
        ADCR    R1                              ; 511E   0029
        XOR@    R2,     R0                      ; 511F   03D0
        SLL     R1,     2                       ; 5120   004D
        XOR@    R2,     R0                      ; 5121   03D0
        DECLE   $0001                           ; 5122   0001

        ADDR    R6,     R0                      ; 5123   00F0
        COMR    R1                              ; 5124   0019
        ADDR    R6,     R0                      ; 5125   00F0
        DECLE   $0001                           ; 5126   0001

        XOR     .BTAB.01,R4                     ; 5127   03C4 0201
        DECLE   $0036                           ; 5129   0036

        BC      L_5528                          ; 512A   0201 03FC
        BC      L_515C                          ; 512C   0201 002E

        XOR@    R4,     R1                      ; 512E   03E1
        XORI    #$0201, R4                      ; 512F   03FC 0201
        RSWD    R6                              ; 5131   003E
        DECLE   $0239                           ; 5132   0239

        XOR     G_00AB, R3                      ; 5133   03C3 00AB
        PSHR    R5                              ; 5135   0275
        MVII    #$00F0, R0                      ; 5136   02B8 00F0
        MVII    #$0200, R4                      ; 5138   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 513A   0004 0114 0338

        DIS                                     ; 513D   0003
        MVII    #$00E9, R1                      ; 513E   02B9 00E9
        MVO     R1,     .ISRVEC.0               ; 5140   0241 0100
        MVII    #$0053, R1                      ; 5142   02B9 0053
        MVO     R1,     .ISRVEC.1               ; 5144   0241 0101
        EIS                                     ; 5146   0002
        MVII    #$0010, R1                      ; 5147   02B9 0010
        MVO     R1,     G_015E                  ; 5149   0241 015E
        MVII    #$0003, R1                      ; 514B   02B9 0003
        MVO     R1,     G_0103                  ; 514D   0241 0103
        MVI     G_016E, R0                      ; 514F   0280 016E
        TSTR    R3                              ; 5151   009B
        BEQ     L_515D                          ; 5152   0204 0009

        TSTR    R0                              ; 5154   0080
        BNEQ    L_515E                          ; 5155   020C 0007

        INCR    R0                              ; 5157   0008
        MVO     R0,     G_0133                  ; 5158   0240 0133
        J       G_E66F                          ; 515A   0004 03E4 026F

L_515D:
        PULR    R7                              ; 515D   02B7

L_515E:
        JSR     R5,     L_53B7                  ; 515E   0004 0150 03B7

        MVI     G_0341, R0                      ; 5161   0280 0341
        MVO     R0,     G_035D                  ; 5163   0240 035D
        SDBD                                    ; 5165   0001
        MVII    #$D948, R4                      ; 5166   02BC 0048 00D9
        MVII    #$0014, R3                      ; 5169   02BB 0014
        MVO     R3,     G_0172                  ; 516B   0243 0172

        JSR     R5,     L_6DF7                  ; 516D   0004 016C 01F7

L_5170:
        MVII    #$0083, R0                      ; 5170   02B8 0083
        MVO     R0,     G_0173                  ; 5172   0240 0173
        MVII    #$0003, R0                      ; 5174   02B8 0003
        MVO     R0,     G_012D                  ; 5176   0240 012D
        AND     G_016D, R0                      ; 5178   0380 016D
        MVO     R0,     G_016D                  ; 517A   0240 016D

        JSR     R5,     L_5373                  ; 517C   0004 0150 0373

        MVII    #$002F, R0                      ; 517F   02B8 002F
        MVO     R0,     G_0173                  ; 5181   0240 0173
        SLL     R0,     1                       ; 5183   0048
        MVO     R0,     G_0135                  ; 5184   0240 0135
        MVII    #$01AE, R4                      ; 5186   02BC 01AE
        SDBD                                    ; 5188   0001
        MVII    #$0017, R0                      ; 5189   02B8 0017 0000

        JSR     R5,     X_FILL_ZERO             ; 518C   0004 0114 0338

        MVII    #$0005, R0                      ; 518F   02B8 0005

        JSR     R5,     X_RAND1                 ; 5191   0004 0114 027D

        CMPI    #$001E, R0                      ; 5194   0378 001E
        BLT     L_51A0                          ; 5196   0205 0008

L_5198:
        MVI     G_0170, R0                      ; 5198   0280 0170
        TSTR    R0                              ; 519A   0080
        BNEQ    L_51A0                          ; 519B   020C 0003

        JSR     R5,     L_51D7                  ; 519D   0004 0150 01D7

L_51A0:
        MVII    #$0008, R1                      ; 51A0   02B9 0008
        SDBD                                    ; 51A2   0001
        MVII    #$6013, R0                      ; 51A3   02B8 0013 0060
        MVII    #$031D, R4                      ; 51A6   02BC 031D

        JSR     R5,     L_6000                  ; 51A8   0004 0160 0000

        MVI     G_0131, R2                      ; 51AB   0282 0131
        MOVR    R2,     R3                      ; 51AD   0093
        XOR     G_033D, R2                      ; 51AE   03C2 033D
        MVO     R2,     G_033D                  ; 51B0   0242 033D
        MVO     R2,     G_0345                  ; 51B2   0242 0345
        XOR     G_0355, R3                      ; 51B4   03C3 0355
        MVO     R3,     G_0355                  ; 51B6   0243 0355
        MVII    #$0002, R0                      ; 51B8   02B8 0002
        SLL     R0,     2                       ; 51BA   004C
        SLL     R0,     1                       ; 51BB   0048
        SDBD                                    ; 51BC   0001
        XORI    #$1E05, R0                      ; 51BD   03F8 0005 001E
        MVO     R0,     .BTAB.62                ; 51C0   0240 0262
        MVII    #$017A, R1                      ; 51C2   02B9 017A
        MOVR    R7,     R4                      ; 51C4   00BC
        ADDI    #$000A, R4                      ; 51C5   02FC 000A
        MVII    #$0008, R0                      ; 51C7   02B8 0008

        JSR     R5,     .EXEC.730               ; 51C9   0004 0114 0330

        J       L_533F                          ; 51CC   0004 0350 033F

        SWAP    R1,     1                       ; 51CF   0041
        DECLE   $0000                           ; 51D0   0000

        RSWD    R1                              ; 51D1   0039
        ADDR    R7,     R7                      ; 51D2   00FF
        ADDR    R7,     R7                      ; 51D3   00FF
        ADDR    R7,     R7                      ; 51D4   00FF
        ADDR    R7,     R7                      ; 51D5   00FF
        ADDR    R7,     R7                      ; 51D6   00FF
L_51D7:
        PSHR    R5                              ; 51D7   0275

        JSR     R5,     G_E533                  ; 51D8   0004 01E4 0133
        DECLE   $0005                           ; 51DB   0005

        AND     G_00DF, R0                      ; 51DC   0380 00DF
        RLC     R1,     1                       ; 51DE   0051
        MVII    #$0078, R0                      ; 51DF   02B8 0078
        MVO     R0,     G_0135                  ; 51E1   0240 0135
        MVI     G_035E, R0                      ; 51E3   0280 035E
        ANDI    #$0003, R0                      ; 51E5   03B8 0003
        BEQ     L_5218                          ; 51E7   0204 002F

        MVII    #$0003, R0                      ; 51E9   02B8 0003
        MVO     R0,     G_015C                  ; 51EB   0240 015C
        MVI     G_035E, R0                      ; 51ED   0280 035E
        ANDI    #$0001, R0                      ; 51EF   03B8 0001
L_51F1:
        SLL     R0,     1                       ; 51F1   0048

        JSR     R4,     L_51F9                  ; 51F2   0004 0050 01F9

        SAR     R2,     1                       ; 51F5   006A
        RLC     R2,     1                       ; 51F6   0052
        MOVR    R1,     R2                      ; 51F7   008A
        RLC     R2,     1                       ; 51F8   0052
L_51F9:
        ADDR    R0,     R4                      ; 51F9   00C4
        SDBD                                    ; 51FA   0001
        MVI@    R4,     R0                      ; 51FB   02A0
        MVO     R0,     G_0318                  ; 51FC   0240 0318
        MOVR    R5,     R7                      ; 51FE   00AF
        MVII    #$0001, R0                      ; 51FF   02B8 0001
        INCR    R7                              ; 5201   000F
        CLRR    R0                              ; 5202   01C0
        MVI     G_015C, R1                      ; 5203   0281 015C
        DECR    R1                              ; 5205   0011
        BEQ     L_5211                          ; 5206   0204 0009

        MVO     R1,     G_015C                  ; 5208   0241 015C
        MVI     G_0171, R1                      ; 520A   0281 0171
        INCR    R1                              ; 520C   0009
        MVO     R1,     G_0171                  ; 520D   0241 0171
        B       L_51F1                          ; 520F   0220 001F

L_5211:
        SDBD                                    ; 5211   0001
        MVII    #$52C2, R0                      ; 5212   02B8 00C2 0052
        MVO     R0,     G_0318                  ; 5215   0240 0318
        MOVR    R5,     R7                      ; 5217   00AF
L_5218:
        MVII    #$0008, R0                      ; 5218   02B8 0008
        MVO     R0,     G_01E2                  ; 521A   0240 01E2
        MVI     G_035E, R0                      ; 521C   0280 035E
        SLR     R0,     2                       ; 521E   0064
        ANDI    #$0001, R0                      ; 521F   03B8 0001
        ADDI    #$0002, R0                      ; 5221   02F8 0002
        MVO     R0,     G_015B                  ; 5223   0240 015B
        MVII    #$0006, R1                      ; 5225   02B9 0006
        SUBR    R0,     R1                      ; 5227   0101
        MVO     R1,     G_015A                  ; 5228   0241 015A
        B       L_5231                          ; 522A   0200 0005

        MVI     G_015C, R0                      ; 522C   0280 015C
        DECR    R0                              ; 522E   0010
        BEQ     L_523A                          ; 522F   0204 0009

L_5231:
        MVO     R0,     G_015C                  ; 5231   0240 015C
L_5233:
        SDBD                                    ; 5233   0001
        MVII    #$52D2, R0                      ; 5234   02B8 00D2 0052
L_5237:
        MVO     R0,     G_0318                  ; 5237   0240 0318
        MOVR    R5,     R7                      ; 5239   00AF
L_523A:
        MVII    #$015A, R4                      ; 523A   02BC 015A
        MVI@    R4,     R0                      ; 523C   02A0
        DECR    R0                              ; 523D   0010
        BEQ     L_5264                          ; 523E   0204 0024

        DECR    R4                              ; 5240   0014
        MVO@    R0,     R4                      ; 5241   0260
        MVI@    R4,     R0                      ; 5242   02A0
        MVO@    R0,     R4                      ; 5243   0260
        MVI     G_0171, R0                      ; 5244   0280 0171
        INCR    R0                              ; 5246   0008
        MVO     R0,     G_0171                  ; 5247   0240 0171
        MVI     G_01E2, R0                      ; 5249   0280 01E2
        DECR    R0                              ; 524B   0010
        MVO     R0,     G_01E2                  ; 524C   0240 01E2
        B       L_5233                          ; 524E   0220 001C

        MVII    #$0006, R0                      ; 5250   02B8 0006
        MVO     R0,     G_0138                  ; 5252   0240 0138
        MVII    #$0001, R0                      ; 5254   02B8 0001
        MVO     R0,     G_0137                  ; 5256   0240 0137
        MOVR    R5,     R7                      ; 5258   00AF
        MVII    #$0007, R0                      ; 5259   02B8 0007
        MVO     R0,     G_0138                  ; 525B   0240 0138
        MVO     R0,     G_0137                  ; 525D   0240 0137
        MVII    #$00F0, R0                      ; 525F   02B8 00F0
        MVO     R0,     G_0136                  ; 5261   0240 0136
        MOVR    R5,     R7                      ; 5263   00AF
L_5264:
        SDBD                                    ; 5264   0001
        MVII    #$52F9, R0                      ; 5265   02B8 00F9 0052
        B       L_5237                          ; 5268   0220 0032

        SUB     .STIC.Y.0,R0                    ; 526A   0300 0008
        MOVR    R4,     R7                      ; 526C   00A7
        EIS                                     ; 526D   0002
        GSWD    R3                              ; 526E   0033
        NEGR    R2                              ; 526F   0022
        MOVR    R5,     R4                      ; 5270   00AC
        EIS                                     ; 5271   0002
        RSWD    R0                              ; 5272   0038
        NEGR    R2                              ; 5273   0022
        MOVR    R6,     R0                      ; 5274   00B0
        EIS                                     ; 5275   0002
        RSWD    R4                              ; 5276   003C
        NEGR    R2                              ; 5277   0022
        MOVR    R6,     R3                      ; 5278   00B3
        DECLE   $0004                           ; 5279   0004

        RSWD    R7                              ; 527A   003F
        SWAP    R0,     2                       ; 527B   0044
        MOVR    R6,     R0                      ; 527C   00B0
        EIS                                     ; 527D   0002
        RSWD    R4                              ; 527E   003C
        NEGR    R2                              ; 527F   0022
        MOVR    R6,     R3                      ; 5280   00B3
        CLRC                                    ; 5281   0006
        RSWD    R7                              ; 5282   003F
        RRC     R2,     2                       ; 5283   0076
        AND     G_0050, R0                      ; 5284   0380 0050
        RLC     R2,     1                       ; 5286   0052
        AND     .STIC.X.2,R0                    ; 5287   0380 0002
        RLC     R2,     1                       ; 5289   0052
        SUB     .STIC.Y.0,R0                    ; 528A   0300 0008
        TSTR    R7                              ; 528C   00BF
        DECLE   $0001                           ; 528D   0001

        GSWD    R3                              ; 528E   0033
        DECR    R1                              ; 528F   0011
        TSTR    R7                              ; 5290   00BF
        DECLE   $0001                           ; 5291   0001

        GSWD    R3                              ; 5292   0033
        DECR    R1                              ; 5293   0011
        TSTR    R7                              ; 5294   00BF
        DECLE   $0001                           ; 5295   0001

        GSWD    R3                              ; 5296   0033
        DECR    R1                              ; 5297   0011
        TSTR    R7                              ; 5298   00BF
        EIS                                     ; 5299   0002
        GSWD    R3                              ; 529A   0033
        NEGR    R2                              ; 529B   0022
        MOVR    R7,     R4                      ; 529C   00BC
        EIS                                     ; 529D   0002
        GSWD    R0                              ; 529E   0030
        NEGR    R2                              ; 529F   0022
        MOVR    R7,     R0                      ; 52A0   00B8
        EIS                                     ; 52A1   0002
        ADCR    R4                              ; 52A2   002C
        NEGR    R2                              ; 52A3   0022
        MOVR    R6,     R3                      ; 52A4   00B3
        EIS                                     ; 52A5   0002
        NEGR    R7                              ; 52A6   0027
        NEGR    R2                              ; 52A7   0022
        MOVR    R7,     R0                      ; 52A8   00B8
        EIS                                     ; 52A9   0002
        ADCR    R4                              ; 52AA   002C
        NEGR    R2                              ; 52AB   0022
        MOVR    R7,     R4                      ; 52AC   00BC
        EIS                                     ; 52AD   0002
        GSWD    R0                              ; 52AE   0030
        NEGR    R2                              ; 52AF   0022
        TSTR    R7                              ; 52B0   00BF
        DECLE   $0004                           ; 52B1   0004

        GSWD    R3                              ; 52B2   0033
        SWAP    R0,     2                       ; 52B3   0044
        MOVR    R7,     R4                      ; 52B4   00BC
        EIS                                     ; 52B5   0002
        GSWD    R0                              ; 52B6   0030
        NEGR    R2                              ; 52B7   0022
        TSTR    R7                              ; 52B8   00BF
        CLRC                                    ; 52B9   0006
        GSWD    R3                              ; 52BA   0033
        RRC     R2,     2                       ; 52BB   0076
        AND     G_0050, R0                      ; 52BC   0380 0050
        RLC     R2,     1                       ; 52BE   0052
        AND     .PSG1.lft_hand,R0               ; 52BF   0380 00FF
        RLC     R1,     1                       ; 52C1   0051
        GSWD    R3                              ; 52C2   0033
        CLRC                                    ; 52C3   0006
        MOVR    R6,     R1                      ; 52C4   00B1
        SLR     R2,     2                       ; 52C5   0066
        RSWD    R0                              ; 52C6   0038
        CLRC                                    ; 52C7   0006
        MOVR    R6,     R3                      ; 52C8   00B3
        CLRC                                    ; 52C9   0006
        SUBR    R6,     R0                      ; 52CA   0130
        RRC     R2,     2                       ; 52CB   0076
        AND     G_0050, R0                      ; 52CC   0380 0050
        RLC     R2,     1                       ; 52CE   0052
        AND     G_004C, R0                      ; 52CF   0380 004C
        ADDR    R4,     R5                      ; 52D1   00E5
        NEGR    R2                              ; 52D2   0022
        EIS                                     ; 52D3   0002
        MOVR    R5,     R6                      ; 52D4   00AE
        DECR    R2                              ; 52D5   0012
        AND     G_0059, R0                      ; 52D6   0380 0059
        RLC     R2,     1                       ; 52D8   0052
        SUB     .STIC.X.3,R0                    ; 52D9   0300 0003
        COMR    R5                              ; 52DB   001D
        EIS                                     ; 52DC   0002
        MOVR    R5,     R1                      ; 52DD   00A9
        DECR    R2                              ; 52DE   0012
        AND     G_0059, R0                      ; 52DF   0380 0059
        RLC     R2,     1                       ; 52E1   0052
        SUB     .STIC.X.3,R0                    ; 52E2   0300 0003
        COMR    R7                              ; 52E4   001F
        EIS                                     ; 52E5   0002
        MOVR    R5,     R3                      ; 52E6   00AB
        DECR    R2                              ; 52E7   0012
        AND     G_0059, R0                      ; 52E8   0380 0059
        RLC     R2,     1                       ; 52EA   0052
        SUB     .STIC.X.3,R0                    ; 52EB   0300 0003
        NEGR    R1                              ; 52ED   0021
        EIS                                     ; 52EE   0002
        TSTR    R5                              ; 52EF   00AD
        DECR    R2                              ; 52F0   0012
        AND     G_0059, R0                      ; 52F1   0380 0059
        RLC     R2,     1                       ; 52F3   0052
        SUB     .STIC.X.3,R0                    ; 52F4   0300 0003
        AND     .STIC.BORD,R0                   ; 52F6   0380 002C
        RLC     R2,     1                       ; 52F8   0052
        SUB     .STIC.X.1,R0                    ; 52F9   0300 0001
        AND     G_0059, R0                      ; 52FB   0380 0059
        RLC     R2,     1                       ; 52FD   0052
        SUB     .STIC.X.7,R0                    ; 52FE   0300 0007
        NEGR    R2                              ; 5300   0022
        DECLE   $0001                           ; 5301   0001

        MOVR    R4,     R6                      ; 5302   00A6
        DECLE   $0001                           ; 5303   0001

        SUBR    R2,     R6                      ; 5304   0116
        DECR    R1                              ; 5305   0011
        NEGR    R2                              ; 5306   0022
        INCR    R6                              ; 5307   000E
        MOVR    R4,     R6                      ; 5308   00A6
        INCR    R6                              ; 5309   000E
        SUBR    R2,     R6                      ; 530A   0116
        ADDR    R7,     R6                      ; 530B   00FE
        AND     G_0050, R0                      ; 530C   0380 0050
        RLC     R2,     1                       ; 530E   0052
        AND     G_004C, R0                      ; 530F   0380 004C
        ADDR    R4,     R5                      ; 5311   00E5
L_5312:
        PSHR    R5                              ; 5312   0275
        MVI     G_0351, R4                      ; 5313   0284 0351
        MVII    #$0068, R0                      ; 5315   02B8 0068

        JSR     R5,     X_FILL_ZERO             ; 5317   0004 0114 0338

        SDBD                                    ; 531A   0001
        MVII    #$4353, R1                      ; 531B   02B9 0053 0043
        MOVR    R7,     R4                      ; 531E   00BC
        ADDI    #$0079, R4                      ; 531F   02FC 0079
        MVII    #$0014, R0                      ; 5321   02B8 0014

        JSR     R5,     .EXEC.730               ; 5323   0004 0114 0330

        MVII    #$0089, R1                      ; 5326   02B9 0089
        CLRR    R5                              ; 5328   01ED
        MVII    #$0187, R4                      ; 5329   02BC 0187
        MVII    #$0006, R0                      ; 532B   02B8 0006
L_532D:
        MVO@    R1,     R4                      ; 532D   0261
        INCR    R1                              ; 532E   0009
        MVO@    R5,     R4                      ; 532F   0265
        MVO@    R5,     R4                      ; 5330   0265
        DECR    R0                              ; 5331   0010
        BNEQ    L_532D                          ; 5332   022C 0006

        MVII    #$00FA, R1                      ; 5334   02B9 00FA
        MVII    #$0004, R0                      ; 5336   02B8 0004
        MVI     G_033C, R4                      ; 5338   0284 033C

        JSR     R5,     X_FILL_MEM              ; 533A   0004 0114 0341

        INCR    R7                              ; 533D   000F
L_533E:
        PSHR    R5                              ; 533E   0275
L_533F:
        MVI     G_0354, R4                      ; 533F   0284 0354
        DECR    R4                              ; 5341   0014
        SDBD                                    ; 5342   0001
        MVII    #$4353, R5                      ; 5343   02BD 0053 0043
        MVII    #$000A, R2                      ; 5346   02BA 000A
        CLRR    R1                              ; 5348   01C9
L_5349:
        MVI@    R5,     R0                      ; 5349   02A8
        MVO@    R1,     R4                      ; 534A   0261
        MVO@    R0,     R4                      ; 534B   0260
        MVO@    R1,     R4                      ; 534C   0261
        MVI@    R5,     R0                      ; 534D   02A8
        MVO@    R0,     R4                      ; 534E   0260
        ADDI    #$0004, R4                      ; 534F   02FC 0004
        DECR    R2                              ; 5351   0012
        BNEQ    L_5349                          ; 5352   022C 000A

        SUBI    #$0048, R4                      ; 5354   033C 0048
        MVII    #$0080, R0                      ; 5356   02B8 0080
        MVO     R0,     G_0352                  ; 5358   0240 0352
        MVO@    R0,     R4                      ; 535A   0260
        SDBD                                    ; 535B   0001
        MVII    #$53AC, R4                      ; 535C   02BC 00AC 0053
        SDBD                                    ; 535F   0001
        MVII    #$4168, R1                      ; 5360   02B9 0068 0041
        MVII    #$000B, R0                      ; 5363   02B8 000B

        JSR     R5,     .EXEC.730               ; 5365   0004 0114 0330

        MVO     R0,     G_0188                  ; 5368   0240 0188
        MVO     R0,     G_0194                  ; 536A   0240 0194
        MVO     R0,     G_0197                  ; 536C   0240 0197
        MVII    #$0089, R0                      ; 536E   02B8 0089
        MVO     R0,     G_0187                  ; 5370   0240 0187
        PULR    R7                              ; 5372   02B7
L_5373:
        MVII    #$0008, R0                      ; 5373   02B8 0008
        MVI     G_01AB, R1                      ; 5375   0281 01AB
        MOVR    R1,     R2                      ; 5377   008A
        SDBD                                    ; 5378   0001
        MVII    #$000D, R3                      ; 5379   02BB 000D 0000
        MVII    #$0003, R4                      ; 537C   02BC 0003
L_537E:
        MVO     R3,     G_0175                  ; 537E   0243 0175
        ANDI    #$0003, R1                      ; 5380   03B9 0003
        BNEQ    L_5388                          ; 5382   020C 0004

        SDBD                                    ; 5384   0001
        MVII    #$0010, R1                      ; 5385   02B9 0010 0000
L_5388:
        MVO     R1,     G_0176                  ; 5388   0241 0176
        MVO     R0,     G_0174                  ; 538A   0240 0174
L_538C:
        CMP     G_0174, R0                      ; 538C   0340 0174
        BEQ     L_538C                          ; 538E   0224 0003

        INCR    R0                              ; 5390   0008
        SAR     R2,     2                       ; 5391   006E
        MOVR    R2,     R1                      ; 5392   0091
        INCR    R3                              ; 5393   000B
        DECR    R4                              ; 5394   0014
        BNEQ    L_537E                          ; 5395   022C 0018

        MOVR    R5,     R7                      ; 5397   00AF
        SLL     R2,     1                       ; 5398   004A
        NEGR    R3                              ; 5399   0023
        SLL     R1,     1                       ; 539A   0049
        INCR    R6                              ; 539B   000E
        SLLC    R1,     1                       ; 539C   0059
        ADCR    R3                              ; 539D   002B
        RLC     R3,     1                       ; 539E   0053
        DECLE   $0035,  $0036                   ; 539F   0035 0036

        ADCR    R4                              ; 53A1   002C
        RSWD    R6                              ; 53A2   003E
        DECLE   $0035                           ; 53A3   0035

        NEGR    R4                              ; 53A4   0024
        RLC     R0,     1                       ; 53A5   0050
        SLL     R1,     1                       ; 53A6   0049
        SAR     R1,     1                       ; 53A7   0069
        SAR     R2,     2                       ; 53A8   006E
        RLC     R0,     1                       ; 53A9   0050
        SLL     R0,     1                       ; 53AA   0048
        DECR    R0                              ; 53AB   0010
        DECLE   $0000,  $0000,  $0000           ; 53AC   0000 0000 0000

        SLL     R1,     1                       ; 53AF   0049
        DECLE   $0000                           ; 53B0   0000

        NEGR    R3                              ; 53B1   0023
        DECLE   $0000,  $0000,  $0000           ; 53B2   0000 0000 0000

        NEGR    R0                              ; 53B5   0020
        DECLE   $0000                           ; 53B6   0000
L_53B7:
        PSHR    R5                              ; 53B7   0275
        MVII    #$031D, R4                      ; 53B8   02BC 031D
        MVII    #$0040, R0                      ; 53BA   02B8 0040

        JSR     R5,     X_FILL_ZERO             ; 53BC   0004 0114 0338

        PULR    R5                              ; 53BF   02B5
L_53C0:
        MOVR    R7,     R4                      ; 53C0   00BC
        ADDI    #$0014, R4                      ; 53C1   02FC 0014
        MVII    #$0005, R1                      ; 53C3   02B9 0005
        MVII    #$0331, R3                      ; 53C5   02BB 0331
L_53C7:
        SDBD                                    ; 53C7   0001
        MVI@    R4,     R0                      ; 53C8   02A0
        MVO@    R0,     R3                      ; 53C9   0258
        ADDI    #$0003, R3                      ; 53CA   02FB 0003
        SDBD                                    ; 53CC   0001
        MVI@    R4,     R0                      ; 53CD   02A0
        MVO@    R0,     R3                      ; 53CE   0258
        ADDI    #$0005, R3                      ; 53CF   02FB 0005
        DECR    R1                              ; 53D1   0011
        BNEQ    L_53C7                          ; 53D2   022C 000C

        MOVR    R5,     R7                      ; 53D4   00AF
        SLR     R3,     2                       ; 53D5   0067
        SWAP    R3,     1                       ; 53D6   0043
        SLR     R3,     1                       ; 53D7   0063
        SWAP    R3,     2                       ; 53D8   0047
        MOVR    R1,     R3                      ; 53D9   008B
        SWAP    R3,     2                       ; 53DA   0047
        MOVR    R2,     R0                      ; 53DB   0090
        SWAP    R3,     2                       ; 53DC   0047
        COMR    R4                              ; 53DD   001C
        RLC     R0,     1                       ; 53DE   0050
        CLRC                                    ; 53DF   0006
        COMR    R1                              ; 53E0   0019
        RSWD    R2                              ; 53E1   003A
        RLC     R0,     1                       ; 53E2   0050
        SLL     R2,     2                       ; 53E3   004E
        RLC     R0,     1                       ; 53E4   0050
        DECLE   $0000                           ; 53E5   0000

        SWAP    R1,     1                       ; 53E6   0041
        DIS                                     ; 53E7   0003
        SWAP    R1,     1                       ; 53E8   0041
        PSHR    R5                              ; 53E9   0275
        MVI     G_0173, R0                      ; 53EA   0280 0173
        CMPI    #$0087, R0                      ; 53EC   0378 0087
        BEQ     L_5442                          ; 53EE   0204 0052

        CMPI    #$0083, R0                      ; 53F0   0378 0083
        BEQ     L_5420                          ; 53F2   0204 002C

        CMPI    #$0080, R0                      ; 53F4   0378 0080
        BNEQ    L_544F                          ; 53F6   020C 0057

        MVII    #$0319, R4                      ; 53F8   02BC 0319
        CLRR    R5                              ; 53FA   01ED
        MVII    #$0008, R3                      ; 53FB   02BB 0008
L_53FD:
        ADDI    #$0006, R4                      ; 53FD   02FC 0006
        MVI@    R4,     R0                      ; 53FF   02A0
        MVI@    R5,     R1                      ; 5400   02A9
        DECR    R5                              ; 5401   0015
        SWAP    R0,     1                       ; 5402   0040
        MVII    #$00FF, R2                      ; 5403   02BA 00FF
        ANDR    R2,     R0                      ; 5405   0190
        SWAP    R2,     1                       ; 5406   0042
        ANDR    R2,     R1                      ; 5407   0191
        XORR    R0,     R1                      ; 5408   01C1
        MVO@    R1,     R5                      ; 5409   0269
        MVI@    R4,     R0                      ; 540A   02A0
        MVI@    R3,     R1                      ; 540B   0299
        SWAP    R0,     1                       ; 540C   0040
        XORI    #$0080, R2                      ; 540D   03FA 0080
        ANDR    R2,     R1                      ; 540F   0191
        COMR    R2                              ; 5410   001A
        ANDR    R2,     R0                      ; 5411   0190
        XORR    R0,     R1                      ; 5412   01C1
        MVO@    R1,     R3                      ; 5413   0259
        INCR    R3                              ; 5414   000B
        CMPI    #$0010, R3                      ; 5415   037B 0010
        BNEQ    L_53FD                          ; 5417   022C 001B

        MVO     R3,     .STIC.VIDEN             ; 5419   0243 0020

        JSR     R5,     L_6FEC                  ; 541B   0004 016C 03EC

        B       L_5428                          ; 541E   0200 0008

L_5420:
        MVII    #$00DC, R1                      ; 5420   02B9 00DC
        CLRR    R5                              ; 5422   01ED
L_5423:
        MVO@    R1,     R5                      ; 5423   0269
        CMPI    #$0008, R5                      ; 5424   037D 0008
        BLT     L_5423                          ; 5426   0225 0004

L_5428:
        MVO     R0,     .STIC.VIDEN             ; 5428   0240 0020
        SDBD                                    ; 542A   0001
        MVII    #$4173, R4                      ; 542B   02BC 0073 0041
        MVII    #$0200, R5                      ; 542E   02BD 0200
        MVII    #$0050, R0                      ; 5430   02B8 0050
L_5432:
        SDBD                                    ; 5432   0001
        MVI@    R4,     R1                      ; 5433   02A1
        MVO@    R1,     R5                      ; 5434   0269
        SDBD                                    ; 5435   0001
        MVI@    R4,     R1                      ; 5436   02A1
        MVO@    R1,     R5                      ; 5437   0269
        SDBD                                    ; 5438   0001
        MVI@    R4,     R1                      ; 5439   02A1
        MVO@    R1,     R5                      ; 543A   0269
        DECR    R0                              ; 543B   0010
        BNEQ    L_5432                          ; 543C   022C 000B

        MVO     R0,     G_0173                  ; 543E   0240 0173
        B       L_5533                          ; 5440   0200 00F1

L_5442:
        SDBD                                    ; 5442   0001
        MVII    #$3800, R4                      ; 5443   02BC 0000 0038
        MVII    #$0200, R0                      ; 5446   02B8 0200

        JSR     R5,     X_FILL_ZERO             ; 5448   0004 0114 0338

        MVO     R5,     G_0173                  ; 544B   0245 0173
L_544D:
        B       L_5533                          ; 544D   0200 00E4

L_544F:
        MVI     G_035D, R0                      ; 544F   0280 035D
        CMP     G_034C, R0                      ; 5451   0340 034C
        BNEQ    L_54FB                          ; 5453   020C 00A6

        MVI     G_0111, R0                      ; 5455   0280 0111
        SAR     R0,     2                       ; 5457   006C
        BNEQ    L_5460                          ; 5458   020C 0006

        MVO     R0,     G_0112                  ; 545A   0240 0112
        MVO     R0,     G_0113                  ; 545C   0240 0113
        B       L_54A1                          ; 545E   0200 0041

L_5460:
        MVI     G_0181, R2                      ; 5460   0282 0181
        SAR     R0,     1                       ; 5462   0068
        ADDI    #$0020, R2                      ; 5463   02FA 0020
        SAR     R2,     2                       ; 5465   006E
        SAR     R2,     2                       ; 5466   006E
        SARC    R2,     1                       ; 5467   007A
        GSWD    R3                              ; 5468   0033
        CMPR    R2,     R0                      ; 5469   0150
        BNEQ    L_54A1                          ; 546A   020C 0035

        MVI     G_0112, R2                      ; 546C   0282 0112
        RSWD    R3                              ; 546E   003B
        BNC     L_5473                          ; 546F   0209 0002

        MVI     G_0113, R2                      ; 5471   0282 0113
L_5473:
        DECR    R2                              ; 5473   0012
        SLL     R2,     2                       ; 5474   004E
        SLL     R2,     1                       ; 5475   004A
        SDBD                                    ; 5476   0001
        ADDI    #$D250, R2                      ; 5477   02FA 0050 00D2
        MOVR    R2,     R4                      ; 547A   0094
        SDBD                                    ; 547B   0001
        MVII    #$3990, R5                      ; 547C   02BD 0090 0039
        ADDI    #$0010, R2                      ; 547F   02FA 0010
        MVI     G_0181, R1                      ; 5481   0281 0181
        ANDI    #$00F0, R1                      ; 5483   03B9 00F0
        SDBD                                    ; 5485   0001
        ADDI    #$39A0, R1                      ; 5486   02F9 00A0 0039
L_5489:
        MVI@    R4,     R0                      ; 5489   02A0
        MVO@    R0,     R5                      ; 548A   0268
        MVO@    R0,     R1                      ; 548B   0248
        INCR    R1                              ; 548C   0009
        TSTR    R0                              ; 548D   0080
        BEQ     L_5489                          ; 548E   0224 0006

L_5490:
        MVI@    R4,     R0                      ; 5490   02A0
        MVO@    R0,     R5                      ; 5491   0268
        MVO@    R0,     R1                      ; 5492   0248
        INCR    R1                              ; 5493   0009
        CMPR    R2,     R4                      ; 5494   0154
        BGE     L_54A1                          ; 5495   020D 000A

        TSTR    R0                              ; 5497   0080
        BNEQ    L_5490                          ; 5498   022C 0009

L_549A:
        MVI@    R4,     R3                      ; 549A   02A3
        MVO@    R3,     R1                      ; 549B   024B
        INCR    R1                              ; 549C   0009
        MVO@    R0,     R5                      ; 549D   0268
        CMPR    R2,     R4                      ; 549E   0154
        BLT     L_549A                          ; 549F   0225 0006

L_54A1:
        MVI     G_0181, R1                      ; 54A1   0281 0181
        ANDI    #$00F0, R1                      ; 54A3   03B9 00F0
        CMPI    #$0050, R1                      ; 54A5   0379 0050
        BGT     L_54FB                          ; 54A7   020E 0052

        ADDI    #$0020, R1                      ; 54A9   02F9 0020
        SAR     R1,     1                       ; 54AB   0069
        MOVR    R1,     R4                      ; 54AC   008C
        ADDI    #$031F, R4                      ; 54AD   02FC 031F
        SAR     R1,     1                       ; 54AF   0069
        SAR     R1,     2                       ; 54B0   006D
        MVII    #$0001, R5                      ; 54B1   02BD 0001
        MVII    #$00FF, R3                      ; 54B3   02BB 00FF
L_54B5:
        MVI@    R4,     R0                      ; 54B5   02A0
        MVI@    R1,     R2                      ; 54B6   028A
        SWAP    R0,     1                       ; 54B7   0040
        ANDR    R3,     R0                      ; 54B8   0198
        COMR    R3                              ; 54B9   001B
        ANDR    R3,     R2                      ; 54BA   019A
        XORR    R2,     R0                      ; 54BB   01D0
        MVO@    R0,     R5                      ; 54BC   0268
        MVO@    R0,     R1                      ; 54BD   0248
        COMR    R3                              ; 54BE   001B
        XORI    #$0080, R3                      ; 54BF   03FB 0080
        ADDI    #$0007, R5                      ; 54C1   02FD 0007
        ADDI    #$0008, R1                      ; 54C3   02F9 0008
        CMPI    #$0009, R5                      ; 54C5   037D 0009
        BEQ     L_54B5                          ; 54C7   0224 0013

        SUBI    #$0004, R4                      ; 54C9   033C 0004
        MVII    #$0325, R5                      ; 54CB   02BD 0325
        MVI@    R4,     R2                      ; 54CD   02A2
        SDBD                                    ; 54CE   0001
        ANDI    #$FFE8, R2                      ; 54CF   03BA 00E8 00FF
        XOR     G_0132, R2                      ; 54D2   03C2 0132
        MVO@    R2,     R5                      ; 54D4   026A
        ANDI    #$0200, R2                      ; 54D5   03BA 0200
        SUBI    #$0008, R1                      ; 54D7   0339 0008
        SLL     R2,     1                       ; 54D9   004A
        SDBD                                    ; 54DA   0001
        ANDI    #$FBFF, R0                      ; 54DB   03B8 00FF 00FB
        XORR    R2,     R0                      ; 54DE   01D0
        MVO@    R0,     R1                      ; 54DF   0248
        MVO     R0,     .STIC.Y.1               ; 54E0   0240 0009
        INCR    R4                              ; 54E2   000C
        INCR    R5                              ; 54E3   000D
        MVI@    R4,     R0                      ; 54E4   02A0
        MVO@    R0,     R5                      ; 54E5   0268
        MVI@    R4,     R0                      ; 54E6   02A0
        MVO@    R0,     R5                      ; 54E7   0268
        MVII    #$0002, R3                      ; 54E8   02BB 0002
        CMP     G_0132, R3                      ; 54EA   0343 0132
        BEQ     L_54F2                          ; 54EC   0204 0004

        SDBD                                    ; 54EE   0001
        MVII    #$1001, R3                      ; 54EF   02BB 0001 0010
L_54F2:
        MVI     .STIC.A.1,R0                    ; 54F2   0280 0011
        SDBD                                    ; 54F4   0001
        ANDI    #$EFFC, R0                      ; 54F5   03B8 00FC 00EF
        XORR    R0,     R3                      ; 54F8   01C3
        MVO     R3,     .STIC.A.1               ; 54F9   0243 0011
L_54FB:
        MVI     G_0174, R1                      ; 54FB   0281 0174
        CMPI    #$00FF, R1                      ; 54FD   0379 00FF
        BEQ     L_5528                          ; 54FF   0204 0027

        SLL     R1,     1                       ; 5501   0049
        SLL     R1,     2                       ; 5502   004D
        SDBD                                    ; 5503   0001
        ADDI    #$3800, R1                      ; 5504   02F9 0000 0038
        MVI     G_0176, R3                      ; 5507   0283 0176
        SLL     R3,     2                       ; 5509   004F
        SLL     R3,     1                       ; 550A   004B
        SDBD                                    ; 550B   0001
        ADDI    #$D878, R3                      ; 550C   02FB 0078 00D8
        MOVR    R3,     R4                      ; 550F   009C
        MVI     G_0175, R3                      ; 5510   0283 0175
        SLL     R3,     2                       ; 5512   004F
        SLL     R3,     1                       ; 5513   004B
        SDBD                                    ; 5514   0001
        ADDI    #$D878, R3                      ; 5515   02FB 0078 00D8
        MOVR    R3,     R5                      ; 5518   009D
        MVII    #$0007, R0                      ; 5519   02B8 0007
        MOVR    R1,     R2                      ; 551B   008A
L_551C:
        MVI@    R4,     R1                      ; 551C   02A1
        MVI@    R5,     R3                      ; 551D   02AB
        SLL     R3,     2                       ; 551E   004F
        SLL     R3,     2                       ; 551F   004F
        XORR    R3,     R1                      ; 5520   01D9
        MVO@    R1,     R2                      ; 5521   0251
        INCR    R2                              ; 5522   000A
        DECR    R0                              ; 5523   0010
        BGE     L_551C                          ; 5524   022D 0009

        MVO     R0,     G_0174                  ; 5526   0240 0174
L_5528:
        MVI     G_0102, R0                      ; 5528   0280 0102
        CMPI    #$0080, R0                      ; 552A   0378 0080
        BGE     L_5530                          ; 552C   020D 0002

        MVO     R0,     .STIC.VIDEN             ; 552E   0240 0020

L_5530:
        JSR     R5,     X_DEF_ISR               ; 5530   0004 0110 0126
L_5533:
        JSR     R5,     G_E474                  ; 5533   0004 01E4 0074
        JSR     R5,     G_E12C                  ; 5536   0004 01E0 012C

        MVI     G_016F, R0                      ; 5539   0280 016F
        SWAP    R0,     1                       ; 553B   0040
        BMI     L_5555                          ; 553C   020B 0017

        MVII    #$011D, R4                      ; 553E   02BC 011D
        SDBD                                    ; 5540   0001
        MVI@    R4,     R0                      ; 5541   02A0
        PSHR    R0                              ; 5542   0270

        JSR     R5,     G_7BE0                  ; 5543   0004 0178 03E0

        PULR    R0                              ; 5546   02B0
        MVO     R0,     G_011D                  ; 5547   0240 011D
        SWAP    R0,     1                       ; 5549   0040
        MVO     R0,     G_011E                  ; 554A   0240 011E
        MVII    #$0008, R0                      ; 554C   02B8 0008
        AND     G_015E, R0                      ; 554E   0380 015E
        BEQ     L_5555                          ; 5550   0204 0003

        JSR     R5,     G_7E70                  ; 5552   0004 017C 0270

L_5555:
        PULR    R7                              ; 5555   02B7
        PSHR    R5                              ; 5556   0275
        MVI     G_01B9, R0                      ; 5557   0280 01B9
        DECR    R0                              ; 5559   0010
        BMI     L_5599                          ; 555A   020B 003D

        MVI     G_016D, R1                      ; 555C   0281 016D
        MOVR    R1,     R4                      ; 555E   008C
        ANDI    #$00DF, R4                      ; 555F   03BC 00DF
        MVO     R4,     G_016D                  ; 5561   0244 016D
        MVO     R0,     G_01B9                  ; 5563   0240 01B9
        TSTR    R0                              ; 5565   0080
        BEQ     L_5577                          ; 5566   0204 000F

        ANDI    #$0020, R1                      ; 5568   03B9 0020
        BEQ     L_5599                          ; 556A   0204 002D

        MOVR    R7,     R4                      ; 556C   00BC
        ADDI    #$0004, R4                      ; 556D   02FC 0004
        B       L_5587                          ; 556F   0200 0016

        RLC     R3,     2                       ; 5571   0057
        ADCR    R3                              ; 5572   002B
        SWAP    R3,     1                       ; 5573   0043
        GSWD    R2                              ; 5574   0032
        RSWD    R3                              ; 5575   003B
        COMR    R5                              ; 5576   001D
L_5577:
        MVI     G_01B0, R3                      ; 5577   0283 01B0
        SARC    R3,     1                       ; 5579   007B
        BC      L_5583                          ; 557A   0201 0007

        MVII    #$0020, R2                      ; 557C   02BA 0020

        JSR     R5,     G_E96A                  ; 557E   0004 01E8 016A

        B       L_5599                          ; 5581   0200 0016

L_5583:
        SDBD                                    ; 5583   0001
        MVII    #$5A80, R4                      ; 5584   02BC 0080 005A
L_5587:
        MVII    #$018A, R5                      ; 5587   02BD 018A
L_5589:
        MVI@    R5,     R1                      ; 5589   02A9
        CMPI    #$0040, R1                      ; 558A   0379 0040
        BGE     L_5599                          ; 558C   020D 000B

        MOVR    R5,     R0                      ; 558E   00A8

        JSR     R5,     L_59E6                  ; 558F   0004 0158 01E6

        INCR    R5                              ; 5592   000D
        SDBD                                    ; 5593   0001
        CMPI    #$5A86, R4                      ; 5594   037C 0086 005A
        BLT     L_5589                          ; 5597   0225 000F

L_5599:
        MVI     G_035C, R1                      ; 5599   0281 035C
        MVII    #$000E, R3                      ; 559B   02BB 000E
L_559D:
        DECR    R3                              ; 559D   0013
        BMI     L_55DC                          ; 559E   020B 003C

        SARC    R1,     1                       ; 55A0   0079
        BNC     L_559D                          ; 55A1   0229 0005

        MVI     G_0351, R4                      ; 55A3   0284 0351
        MOVR    R3,     R2                      ; 55A5   009A
        SLL     R2,     2                       ; 55A6   004E
        SLL     R2,     1                       ; 55A7   004A
        ADDR    R2,     R4                      ; 55A8   00D4
        MVI@    R4,     R0                      ; 55A9   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 55AA   0004 0114 0268

        SLL     R0,     2                       ; 55AD   004C
        MOVR    R0,     R2                      ; 55AE   0082
        MVI@    R4,     R0                      ; 55AF   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 55B0   0004 0114 0268

        SLL     R0,     2                       ; 55B3   004C
        SDBD                                    ; 55B4   0001
        ADD@    R4,     R2                      ; 55B5   02E2
        SDBD                                    ; 55B6   0001
        ADD@    R4,     R0                      ; 55B7   02E0
        SUBI    #$0004, R4                      ; 55B8   033C 0004
        MVO@    R2,     R4                      ; 55BA   0262
        SWAP    R2,     1                       ; 55BB   0042
        ANDI    #$00FF, R2                      ; 55BC   03BA 00FF
        CMPI    #$00CE, R2                      ; 55BE   037A 00CE
        BLE     L_55C3                          ; 55C0   0206 0001

        CLRR    R2                              ; 55C2   01D2
L_55C3:
        CMPI    #$00A0, R2                      ; 55C3   037A 00A0
        BLT     L_55C9                          ; 55C5   0205 0002

        MVII    #$00A0, R2                      ; 55C7   02BA 00A0
L_55C9:
        MVO@    R2,     R4                      ; 55C9   0262
        MVO@    R0,     R4                      ; 55CA   0260
        SWAP    R0,     1                       ; 55CB   0040
        ANDI    #$00FF, R0                      ; 55CC   03B8 00FF
        CMPI    #$00CE, R0                      ; 55CE   0378 00CE
        BLT     L_55D3                          ; 55D0   0205 0001

        CLRR    R0                              ; 55D2   01C0
L_55D3:
        CMPI    #$00A0, R0                      ; 55D3   0378 00A0
        BLT     L_55D9                          ; 55D5   0205 0002

        MVII    #$00A0, R0                      ; 55D7   02B8 00A0
L_55D9:
        MVO@    R0,     R4                      ; 55D9   0260
        B       L_559D                          ; 55DA   0220 003E

L_55DC:
        MVII    #$0197, R1                      ; 55DC   02B9 0197
L_55DE:
        MVI@    R1,     R0                      ; 55DE   0288
        DECR    R0                              ; 55DF   0010
        BMI     L_5787                          ; 55E0   020B 01A5

        MVO@    R0,     R1                      ; 55E2   0248
        BNEQ    L_5787                          ; 55E3   020C 01A2

        PSHR    R1                              ; 55E5   0271
        DECR    R1                              ; 55E6   0011
        MVI@    R1,     R0                      ; 55E7   0288
        CMPI    #$0009, R0                      ; 55E8   0378 0009
        BGE     L_55F2                          ; 55EA   020D 0006

L_55EC:
        MOVR    R7,     R3                      ; 55EC   00BB

        JSR     R5,     L_6D4E                  ; 55ED   0004 016C 014E

        B       L_5786                          ; 55F0   0200 0194

L_55F2:
        MOVR    R0,     R1                      ; 55F2   0081
        ANDI    #$000F, R0                      ; 55F3   03B8 000F
        CMPI    #$000C, R0                      ; 55F5   0378 000C
        BGT     L_5786                          ; 55F7   020E 018D

        CMP     G_01D8, R0                      ; 55F9   0340 01D8
        BNEQ    L_5600                          ; 55FB   020C 0003

        CLRR    R5                              ; 55FD   01ED
        MVO     R5,     G_01D8                  ; 55FE   0245 01D8
L_5600:
        SUBI    #$0009, R0                      ; 5600   0338 0009
        CMPI    #$0080, R1                      ; 5602   0379 0080
        BGE     L_5663                          ; 5604   020D 005D

        CMPI    #$0040, R1                      ; 5606   0379 0040
        BGE     L_5661                          ; 5608   020D 0057

        CMPI    #$0020, R1                      ; 560A   0379 0020
        BGE     L_5632                          ; 560C   020D 0024

        CMPI    #$0010, R1                      ; 560E   0379 0010
        BLT     L_561B                          ; 5610   0205 0009

        ANDI    #$000F, R1                      ; 5612   03B9 000F

        JSR     R5,     L_64B9                  ; 5614   0004 0164 00B9

        BEQ     L_566B                          ; 5617   0204 0052
        B       L_5625                          ; 5619   0200 000A

L_561B:
        JSR     R5,     L_64B9                  ; 561B   0004 0164 00B9

        BEQ     L_566B                          ; 561E   0204 004B

        JSR     R5,     L_64B4                  ; 5620   0004 0164 00B4

        BNEQ    L_565E                          ; 5623   020C 0039

L_5625:
        SLL     R0,     1                       ; 5625   0048
        SDBD                                    ; 5626   0001
        ADDI    #$5A7E, R0                      ; 5627   02F8 007E 005A
        MOVR    R0,     R4                      ; 562A   0084
        PULR    R0                              ; 562B   02B0
        PSHR    R0                              ; 562C   0270

        JSR     R5,     L_59E6                  ; 562D   0004 0158 01E6

        B       L_5786                          ; 5630   0200 0154

L_5632:
        DECR    R0                              ; 5632   0010
        ANDI    #$000F, R1                      ; 5633   03B9 000F

        JSR     R5,     L_64B9                  ; 5635   0004 0164 00B9

        BNEQ    L_5659                          ; 5638   020C 001F

        DECR    R1                              ; 563A   0011

        JSR     R5,     L_64B9                  ; 563B   0004 0164 00B9

        INCR    R1                              ; 563E   0009
        TSTR    R5                              ; 563F   00AD
        BNEQ    L_5663                          ; 5640   020C 0021

        DECR    R5                              ; 5642   0015
L_5643:
        SUBI    #$0009, R1                      ; 5643   0339 0009
        MOVR    R1,     R2                      ; 5645   008A
        SLL     R2,     1                       ; 5646   004A
        ADDR    R1,     R2                      ; 5647   00CA
        ADDI    #$0187, R2                      ; 5648   02FA 0187
        MOVR    R2,     R4                      ; 564A   0094
        MVII    #$0002, R5                      ; 564B   02BD 0002
        SUBR    R5,     R4                      ; 564D   012C
        MVO@    R5,     R4                      ; 564E   0265
        MVI@    R2,     R4                      ; 564F   0294
        CMPI    #$0040, R4                      ; 5650   037C 0040
        BGE     L_5786                          ; 5652   020D 0132

        JSR     R5,     L_65A6                  ; 5654   0004 0164 01A6

        B       L_5786                          ; 5657   0200 012D

L_5659:
        JSR     R5,     L_64B4                  ; 5659   0004 0164 00B4

        BEQ     L_5625                          ; 565C   0224 0038

L_565E:
        MOVR    R1,     R0                      ; 565E   0088
        B       L_55EC                          ; 565F   0220 0074

L_5661:
        XORI    #$00C0, R1                      ; 5661   03F9 00C0
L_5663:
        PULR    R5                              ; 5663   02B5
        DECR    R5                              ; 5664   0015
        MVO@    R1,     R5                      ; 5665   0269
        PSHR    R5                              ; 5666   0275
        ANDI    #$000F, R1                      ; 5667   03B9 000F
        B       L_565E                          ; 5669   0220 000C

L_566B:
        PULR    R3                              ; 566B   02B3
        PSHR    R3                              ; 566C   0273
        MVI     G_01B0, R5                      ; 566D   0285 01B0
        CMPI    #$0003, R5                      ; 566F   037D 0003
        BGE     L_573E                          ; 5671   020D 00CB

        CMPI    #$0009, R1                      ; 5673   0379 0009
        BNEQ    L_5689                          ; 5675   020C 0012

        MVI     G_016D, R5                      ; 5677   0285 016D
        CMPI    #$0080, R5                      ; 5679   037D 0080
        BLT     L_5689                          ; 567B   0205 000C

        XORI    #$0080, R5                      ; 567D   03FD 0080
        MVO     R5,     G_016D                  ; 567F   0245 016D
        MVII    #$0019, R5                      ; 5681   02BD 0019
        MVO     R5,     G_0188                  ; 5683   0245 0188
        MVO     R5,     G_0187                  ; 5685   0245 0187
        B       L_5786                          ; 5687   0200 00FD

L_5689:
        MOVR    R1,     R2                      ; 5689   008A
        ANDI    #$000F, R1                      ; 568A   03B9 000F
        CMPI    #$000C, R1                      ; 568C   0379 000C
        BEQ     L_5743                          ; 568E   0204 00B3

        INCR    R1                              ; 5690   0009

        JSR     R5,     L_64B9                  ; 5691   0004 0164 00B9

        BEQ     L_5643                          ; 5694   0224 0052

        MOVR    R2,     R1                      ; 5696   0091
        ADDI    #$0002, R3                      ; 5697   02FB 0002
        MVI@    R3,     R5                      ; 5699   029D
        CMPI    #$0040, R5                      ; 569A   037D 0040
        BLT     L_573C                          ; 569C   0205 009E

        MVI     G_035D, R5                      ; 569E   0285 035D
        CMP     G_0344, R5                      ; 56A0   0345 0344
        BNEQ    L_56C0                          ; 56A2   020C 001C

        MVI     G_0181, R0                      ; 56A4   0280 0181
        ANDI    #$000F, R0                      ; 56A6   03B8 000F
        CMPR    R0,     R1                      ; 56A8   0141
        BNEQ    L_56EF                          ; 56A9   020C 0044

        INCR    R0                              ; 56AB   0008
        MVII    #$017A, R5                      ; 56AC   02BD 017A
L_56AE:
        MVI@    R5,     R4                      ; 56AE   02AC
        MOVR    R4,     R2                      ; 56AF   00A2
        ANDI    #$000F, R4                      ; 56B0   03BC 000F
        CMPR    R4,     R0                      ; 56B2   0160
        BEQ     L_56BC                          ; 56B3   0204 0007

        CMPI    #$0180, R5                      ; 56B5   037D 0180
        BLT     L_56AE                          ; 56B7   0225 000A

        MOVR    R0,     R2                      ; 56B9   0082
        MVO     R0,     G_017A                  ; 56BA   0240 017A
L_56BC:
        MVO     R2,     G_0181                  ; 56BC   0242 0181
        B       L_56EF                          ; 56BE   0200 002F

L_56C0:
        JSR     R5,     L_587C                  ; 56C0   0004 0158 007C

        MVI     G_01C1, R0                      ; 56C3   0280 01C1
        DECR    R0                              ; 56C5   0010
        MOVR    R1,     R5                      ; 56C6   008D
        SUBI    #$0008, R5                      ; 56C7   033D 0008
        ANDI    #$0003, R5                      ; 56C9   03BD 0003
        BEQ     L_56DA                          ; 56CB   0204 000D

        CMPR    R0,     R5                      ; 56CD   0145
        BEQ     L_56DA                          ; 56CE   0204 000A

        MVO     R5,     G_01D7                  ; 56D0   0245 01D7
        MVII    #$0003, R0                      ; 56D2   02B8 0003

        JSR     R5,     X_CLR_BIT               ; 56D4   0004 0114 02E6

        XORR    R2,     R3                      ; 56D7   01D3
        B       L_56EF                          ; 56D8   0200 0015

L_56DA:
        MVO     R0,     G_01D8                  ; 56DA   0240 01D8
        MVI     G_0359, R0                      ; 56DC   0280 0359
        SARC    R0,     2                       ; 56DE   007C
        BOV     L_56E9                          ; 56DF   0202 0008

        MVII    #$0004, R0                      ; 56E1   02B8 0004

        JSR     R5,     X_CLR_BIT               ; 56E3   0004 0114 02E6

        XORR    R2,     R3                      ; 56E6   01D3
        B       L_56EF                          ; 56E7   0200 0006

L_56E9:
        MVII    #$0005, R0                      ; 56E9   02B8 0005

        JSR     R5,     X_CLR_BIT               ; 56EB   0004 0114 02E6

        XORR    R2,     R3                      ; 56EE   01D3
L_56EF:
        PSHR    R1                              ; 56EF   0271
        MOVR    R1,     R4                      ; 56F0   008C
        SUBI    #$0009, R4                      ; 56F1   033C 0009
        ADD     G_033C, R4                      ; 56F3   02C4 033C
        MVI@    R4,     R0                      ; 56F5   02A0
        MVI@    R4,     R5                      ; 56F6   02A5
        SUBI    #$0002, R4                      ; 56F7   033C 0002
        CMPI    #$0009, R1                      ; 56F9   0379 0009
        BNEQ    L_56FF                          ; 56FB   020C 0002

        MVII    #$00FA, R5                      ; 56FD   02BD 00FA
L_56FF:
        MVO@    R5,     R4                      ; 56FF   0265
        MVO@    R0,     R4                      ; 5700   0260
        SLL     R1,     2                       ; 5701   004D
        SLL     R1,     1                       ; 5702   0049
        ADD     G_0351, R1                      ; 5703   02C1 0351
        MVII    #$0008, R0                      ; 5705   02B8 0008
        MOVR    R1,     R4                      ; 5707   008C
        ADDR    R0,     R1                      ; 5708   00C1
        MVII    #$0008, R0                      ; 5709   02B8 0008
L_570B:
        MVI@    R1,     R5                      ; 570B   028D
        MVI@    R4,     R2                      ; 570C   02A2
        DECR    R4                              ; 570D   0014
        MVO@    R2,     R1                      ; 570E   024A
        INCR    R1                              ; 570F   0009
        MVO@    R5,     R4                      ; 5710   0265
        DECR    R0                              ; 5711   0010
        BNEQ    L_570B                          ; 5712   022C 0008

        MVII    #$0003, R0                      ; 5714   02B8 0003
        MOVR    R3,     R2                      ; 5716   009A
        ADDI    #$0003, R3                      ; 5717   02FB 0003
L_5719:
        DECR    R3                              ; 5719   0013
        MVI@    R3,     R5                      ; 571A   029D
        DECR    R2                              ; 571B   0012
        MVI@    R2,     R4                      ; 571C   0294
        MVO@    R4,     R3                      ; 571D   025C
        MVO@    R5,     R2                      ; 571E   0255
        DECR    R0                              ; 571F   0010
        BNEQ    L_5719                          ; 5720   022C 0008

        DECR    R5                              ; 5722   0015
        MVO@    R5,     R2                      ; 5723   0255
        INCR    R4                              ; 5724   000C
        ANDI    #$000F, R4                      ; 5725   03BC 000F
        MVO@    R4,     R3                      ; 5727   025C
        PULR    R0                              ; 5728   02B0
        PSHR    R0                              ; 5729   0270
        ANDI    #$00F0, R5                      ; 572A   03BD 00F0
        XORI    #$0040, R5                      ; 572C   03FD 0040
        MOVR    R5,     R3                      ; 572E   00AB

        JSR     R5,     L_6D4E                  ; 572F   0004 016C 014E
        JSR     R5,     L_6EEF                  ; 5732   0004 016C 02EF
        JSR     R5,     L_6B07                  ; 5735   0004 0168 0307

        PULR    R0                              ; 5738   02B0
        INCR    R0                              ; 5739   0008
        B       L_55EC                          ; 573A   0220 014F

L_573C:
        SUBI    #$0002, R3                      ; 573C   033B 0002
L_573E:
        MVII    #$0001, R0                      ; 573E   02B8 0001
        MVO@    R0,     R3                      ; 5740   0258
        B       L_565E                          ; 5741   0220 00E4

L_5743:
        MVII    #$004C, R1                      ; 5743   02B9 004C
        MVO     R1,     G_0190                  ; 5745   0241 0190
        SDBD                                    ; 5747   0001
        MVII    #$4793, R4                      ; 5748   02BC 0093 0047
        MVII    #$00FA, R5                      ; 574B   02BD 00FA
        MVO@    R5,     R4                      ; 574D   0265
        SDBD                                    ; 574E   0001
        MVII    #$5A86, R4                      ; 574F   02BC 0086 005A
        MVI     G_0133, R5                      ; 5752   0285 0133
        TSTR    R5                              ; 5754   00AD
        BNEQ    L_5759                          ; 5755   020C 0002

        ADDI    #$0002, R4                      ; 5757   02FC 0002
L_5759:
        ANDI    #$000F, R1                      ; 5759   03B9 000F
        MVII    #$0191, R0                      ; 575B   02B8 0191

        JSR     R5,     L_59E6                  ; 575D   0004 0158 01E6

        MVI     G_01AC, R5                      ; 5760   0285 01AC
        INCR    R5                              ; 5762   000D
        MVO     R5,     G_01AC                  ; 5763   0245 01AC
        MVI     G_01C4, R5                      ; 5765   0285 01C4
        CLRR    R2                              ; 5767   01D2
        TSTR    R5                              ; 5768   00AD
        BEQ     L_5773                          ; 5769   0204 0008

        MVII    #$0022, R2                      ; 576B   02BA 0022
        CMPI    #$0004, R5                      ; 576D   037D 0004
        BLE     L_5773                          ; 576F   0206 0002

        MVII    #$0032, R2                      ; 5771   02BA 0032
L_5773:
        MVII    #$0006, R3                      ; 5773   02BB 0006
        MVII    #$0202, R4                      ; 5775   02BC 0202
        MVII    #$0093, R1                      ; 5777   02B9 0093

        JSR     R5,     G_E712                  ; 5779   0004 01E4 0312

        MVI@    R1,     R0                      ; 577C   0288
        MOVR    R4,     R0                      ; 577D   00A0
        MVO@    R5,     R2                      ; 577E   0255
        XORR    R1,     R6                      ; 577F   01CE
        MOVR    R6,     R2                      ; 5780   00B2
        DECR    R3                              ; 5781   0013
        SAR     R3,     2                       ; 5782   006F
        MVO     R5,     .BTAB.60                ; 5783   0245 0260
        DECLE   $0000                           ; 5785   0000
L_5786:
        PULR    R1                              ; 5786   02B1
L_5787:
        SUBI    #$0003, R1                      ; 5787   0339 0003
        CMPI    #$0187, R1                      ; 5789   0379 0187
        BGT     L_55DE                          ; 578B   022E 01AE

        MVI     G_0359, R0                      ; 578D   0280 0359
        INCR    R0                              ; 578F   0008
        MVO     R0,     G_0359                  ; 5790   0240 0359
        SARC    R0,     1                       ; 5792   0078
        BC      L_5799                          ; 5793   0201 0004

        MVII    #$017D, R5                      ; 5795   02BD 017D
        B       L_588A                          ; 5797   0200 00F1

L_5799:
        MVI     G_035C, R0                      ; 5799   0280 035C
        SARC    R0,     1                       ; 579B   0078
        BNC     L_57B6                          ; 579C   0209 0018

        SDBD                                    ; 579E   0001
        MVII    #$4171, R3                      ; 579F   02BB 0071 0041
        MVI@    R3,     R2                      ; 57A2   029A
        INCR    R3                              ; 57A3   000B
        MVI@    R3,     R0                      ; 57A4   0298
        DECR    R0                              ; 57A5   0010
        MVO@    R0,     R3                      ; 57A6   0258

        JSR     R5,     X_EXT_SIGN_LO           ; 57A7   0004 0114 0268

        ADDR    R0,     R2                      ; 57AA   00C2
        CMPI    #$00F8, R2                      ; 57AB   037A 00F8
        BLE     L_57B1                          ; 57AD   0206 0002

        MVII    #$00F8, R2                      ; 57AF   02BA 00F8
L_57B1:
        TSTR    R2                              ; 57B1   0092
        BMI     L_57B8                          ; 57B2   020B 0004

        DECR    R3                              ; 57B4   0013
        MVO@    R2,     R3                      ; 57B5   025A
L_57B6:
        B       L_5888                          ; 57B6   0200 00D0

L_57B8:
        MVI     G_01BC, R1                      ; 57B8   0281 01BC
        DECR    R1                              ; 57BA   0011
        BMI     L_57C1                          ; 57BB   020B 0004

        MVO     R1,     G_01BC                  ; 57BD   0241 01BC
        BNEQ    L_57C9                          ; 57BF   020C 0008

L_57C1:
        PSHR    R0                              ; 57C1   0270
        MVII    #$0006, R0                      ; 57C2   02B8 0006

        JSR     R5,     X_SET_BIT               ; 57C4   0004 0114 02DB

        CMPR    R5,     R5                      ; 57C7   016D
        PULR    R0                              ; 57C8   02B0
L_57C9:
        NEGR    R0                              ; 57C9   0020
        SAR     R0,     2                       ; 57CA   006C
        MVO@    R0,     R3                      ; 57CB   0258
        BEQ     L_57D3                          ; 57CC   0204 0005

        PSHR    R3                              ; 57CE   0273

        JSR     R5,     L_6E9E                  ; 57CF   0004 016C 029E

        PULR    R3                              ; 57D2   02B3
L_57D3:
        CLRR    R2                              ; 57D3   01D2
        MVO     R2,     G_01C0                  ; 57D4   0242 01C0
        DECR    R3                              ; 57D6   0013
        MVO@    R2,     R3                      ; 57D7   025A
        SUBI    #$0009, R3                      ; 57D8   033B 0009
        MVII    #$0002, R4                      ; 57DA   02BC 0002
L_57DC:
        MVI@    R3,     R0                      ; 57DC   0298

        JSR     R5,     X_EXT_SIGN_LO           ; 57DD   0004 0114 0268

        SAR     R0,     1                       ; 57E0   0068
        SLL     R0,     1                       ; 57E1   0048
        BEQ     L_57EB                          ; 57E2   0204 0007
        BPL     L_57E8                          ; 57E4   0203 0002

        ADDI    #$0004, R0                      ; 57E6   02F8 0004
L_57E8:
        SUBI    #$0002, R0                      ; 57E8   0338 0002
        MVO@    R0,     R3                      ; 57EA   0258
L_57EB:
        DECR    R4                              ; 57EB   0014
        BEQ     L_57F3                          ; 57EC   0204 0005

        INCR    R3                              ; 57EE   000B
        MOVR    R0,     R2                      ; 57EF   0082
        B       L_57DC                          ; 57F0   0220 0015

L_57F2:
        PSHR    R5                              ; 57F2   0275
L_57F3:
        MVI     G_01B0, R3                      ; 57F3   0283 01B0
        CMPI    #$0003, R3                      ; 57F5   037B 0003
        BLT     L_5800                          ; 57F7   0205 0007

        SUBI    #$0002, R3                      ; 57F9   033B 0002
        MVO     R3,     G_01B0                  ; 57FB   0243 01B0
        DECR    R3                              ; 57FD   0013
        BNEQ    L_580F                          ; 57FE   020C 000F

L_5800:
        TSTR    R2                              ; 5800   0092
        BNEQ    L_5888                          ; 5801   020C 0085

        TSTR    R0                              ; 5803   0080
        BNEQ    L_5888                          ; 5804   020C 0082

        JSR     R5,     X_SET_BIT               ; 5806   0004 0114 02DB

        CMP@    R3,     R4                      ; 5809   035C

        JSR     R5,     L_6EC4                  ; 580A   0004 016C 02C4

        B       L_5888                          ; 580D   0200 0079

L_580F:
        JSR     R5,     G_E96A                  ; 580F   0004 01E8 016A

        MVI     G_034C, R0                      ; 5812   0280 034C
        MVO     R0,     G_035D                  ; 5814   0240 035D
        MVI     G_01AB, R2                      ; 5816   0282 01AB
        ADDI    #$0010, R2                      ; 5818   02FA 0010
        CMPI    #$0030, R2                      ; 581A   037A 0030
        BLT     L_582A                          ; 581C   0205 000C

        MVI     G_01BE, R0                      ; 581E   0280 01BE
        TSTR    R0                              ; 5820   0080
        BEQ     L_582C                          ; 5821   0204 0009

        MVI     G_01AB, R2                      ; 5823   0282 01AB

        JSR     R5,     L_5E3C                  ; 5825   0004 015C 023C

        B       L_584B                          ; 5828   0200 0021

L_582A:
        MVO     R2,     G_01AB                  ; 582A   0242 01AB
L_582C:
        MVII    #$02E1, R4                      ; 582C   02BC 02E1
        MVII    #$0007, R3                      ; 582E   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 5830   0004 0118 007B

        SWAP    R2,     2                       ; 5833   0046
        SLL     R3,     2                       ; 5834   004F
        RLC     R1,     2                       ; 5835   0055
        SLL     R0,     2                       ; 5836   004C
        NEGR    R0                              ; 5837   0020
        SWAP    R2,     1                       ; 5838   0042
        SWAP    R1,     1                       ; 5839   0041
        SLL     R0,     2                       ; 583A   004C
        SLL     R0,     2                       ; 583B   004C
        DECLE   $0000                           ; 583C   0000

        MVII    #$0000, R0                      ; 583D   02B8 0000

        JSR     R5,     X_CLR_BIT               ; 583F   0004 0114 02E6

        XORR    R2,     R5                      ; 5842   01D5
        MVII    #$0029, R0                      ; 5843   02B8 0029
        MVO     R0,     G_012F                  ; 5845   0240 012F
        DECR    R0                              ; 5847   0010

        JSR     R5,     .EXEC.A62               ; 5848   0004 0118 0262
L_584B:
        JSR     R5,     L_533E                  ; 584B   0004 0150 033E

        MVI     G_034C, R0                      ; 584E   0280 034C
        MVO     R0,     G_035D                  ; 5850   0240 035D
        MVII    #$0001, R1                      ; 5852   02B9 0001
        MVO     R1,     G_031D                  ; 5854   0241 031D
        MVO     R1,     G_0325                  ; 5856   0241 0325
        MVO     R1,     G_01B0                  ; 5858   0241 01B0
        MVII    #$00FF, R0                      ; 585A   02B8 00FF
        MVO     R0,     G_0180                  ; 585C   0240 0180
        MVO     R1,     G_0181                  ; 585E   0241 0181
        MVO     R1,     G_01B3                  ; 5860   0241 01B3
        CLRR    R0                              ; 5862   01C0
        MVO     R0,     G_01C4                  ; 5863   0240 01C4
        MVII    #$0003, R0                      ; 5865   02B8 0003
        MVO     R0,     G_0173                  ; 5867   0240 0173

        JSR     R5,     L_65FA                  ; 5869   0004 0164 01FA

L_586C:
        DECR    R2                              ; 586C   0012
        BEQ     L_5873                          ; 586D   0204 0004

        CMP     G_0173, R0                      ; 586F   0340 0173
        BEQ     L_586C                          ; 5871   0224 0006

L_5873:
        MVII    #$0001, R1                      ; 5873   02B9 0001
        XOR     G_0133, R1                      ; 5875   03C1 0133
        MVII    #$0008, R0                      ; 5877   02B8 0008
        J       L_6197                          ; 5879   0004 0360 0197

L_587C:
        PSHR    R5                              ; 587C   0275
        PSHR    R0                              ; 587D   0270
        MVII    #$01D3, R5                      ; 587E   02BD 01D3
        CLRR    R0                              ; 5880   01C0
L_5881:
        MVO@    R0,     R5                      ; 5881   0268
        CMPI    #$01D7, R5                      ; 5882   037D 01D7
        BNEQ    L_5881                          ; 5884   022C 0004

        PULR    R0                              ; 5886   02B0
        PULR    R7                              ; 5887   02B7
L_5888:
        MVII    #$017A, R5                      ; 5888   02BD 017A
L_588A:
        MVI@    R5,     R0                      ; 588A   02A8
        PSHR    R5                              ; 588B   0275
        ANDI    #$000F, R0                      ; 588C   03B8 000F
        CMPI    #$000E, R0                      ; 588E   0378 000E
        BGE     L_58AB                          ; 5890   020D 0019

        SLL     R0,     2                       ; 5892   004C
        SLL     R0,     1                       ; 5893   0048
        SDBD                                    ; 5894   0001
        ADDI    #$4105, R0                      ; 5895   02F8 0005 0041
        MOVR    R0,     R4                      ; 5898   0084
        MVI@    R4,     R2                      ; 5899   02A2
        MVI     G_01C4, R1                      ; 589A   0281 01C4
        CLRR    R0                              ; 589C   01C0
        TSTR    R1                              ; 589D   0089
        BEQ     L_58A6                          ; 589E   0204 0006

        CMPI    #$0004, R1                      ; 58A0   0379 0004
        BLE     L_58A5                          ; 58A2   0206 0001

        INCR    R0                              ; 58A4   0008
L_58A5:
        INCR    R0                              ; 58A5   0008
L_58A6:
        SUBI    #$0004, R4                      ; 58A6   033C 0004

        JSR     R5,     L_58B9                  ; 58A8   0004 0158 00B9

L_58AB:
        PULR    R5                              ; 58AB   02B5
        CMPI    #$017D, R5                      ; 58AC   037D 017D
        BLT     L_588A                          ; 58AE   0225 0025
        BGT     L_58B4                          ; 58B0   020E 0002

        MVII    #$0180, R5                      ; 58B2   02BD 0180
L_58B4:
        CMPI    #$0181, R5                      ; 58B4   037D 0181
        BLT     L_588A                          ; 58B6   0225 002D

        PULR    R7                              ; 58B8   02B7
L_58B9:
        PSHR    R5                              ; 58B9   0275
        MOVR    R4,     R5                      ; 58BA   00A5
        SDBD                                    ; 58BB   0001
        MVI@    R5,     R1                      ; 58BC   02A9
        SLR     R1,     2                       ; 58BD   0065
        SAR     R1,     2                       ; 58BE   006D
        SDBD                                    ; 58BF   0001
        SUBI    #$0490, R1                      ; 58C0   0339 0090 0004
        SDBD                                    ; 58C3   0001
        MVI@    R5,     R3                      ; 58C4   02AB
        SLR     R3,     2                       ; 58C5   0067
        SAR     R3,     2                       ; 58C6   006F
        SUBI    #$00F0, R3                      ; 58C7   033B 00F0
        MVI     G_01AF, R2                      ; 58C9   0282 01AF
        TSTR    R2                              ; 58CB   0092
        BNEQ    L_597D                          ; 58CC   020C 00AF

L_58CE:
        PSHR    R5                              ; 58CE   0275
        PSHR    R3                              ; 58CF   0273
        TSTR    R0                              ; 58D0   0080
        BEQ     L_592A                          ; 58D1   0204 0057

        DECR    R0                              ; 58D3   0010
        BLE     L_5904                          ; 58D4   0206 002E

        SLL     R1,     2                       ; 58D6   004D
        SLL     R1,     2                       ; 58D7   004D
        MVII    #$01A8, R0                      ; 58D8   02B8 01A8

        JSR     R5,     G_E02B                  ; 58DA   0004 01E0 002B

        PULR    R1                              ; 58DD   02B1
        PSHR    R3                              ; 58DE   0273
        SLL     R1,     2                       ; 58DF   004D
        SLL     R1,     2                       ; 58E0   004D
        MVII    #$01A8, R0                      ; 58E1   02B8 01A8

        JSR     R5,     G_E02B                  ; 58E3   0004 01E0 002B

        CMPI    #$0036, R3                      ; 58E6   037B 0036
        BGT     L_58EE                          ; 58E8   020E 0004

        MVII    #$007F, R3                      ; 58EA   02BB 007F
        B       L_5901                          ; 58EC   0200 0013

L_58EE:
        SUBI    #$004B, R3                      ; 58EE   033B 004B
        SDBD                                    ; 58F0   0001
        MVII    #$15C0, R1                      ; 58F1   02B9 00C0 0015
        MOVR    R3,     R2                      ; 58F4   009A
        ADDI    #$0021, R2                      ; 58F5   02FA 0021

        JSR     R5,     X_DIV                   ; 58F7   0004 011C 01FB

        MOVR    R3,     R1                      ; 58FA   0099

        JSR     R5,     X_MPY                   ; 58FB   0004 011C 01DC

        SLL     R2,     2                       ; 58FE   004E
        SWAP    R2,     1                       ; 58FF   0042
        MOVR    R2,     R3                      ; 5900   0093
L_5901:
        PULR    R1                              ; 5901   02B1
        B       L_590D                          ; 5902   0200 0009

L_5904:
        SLL     R1,     2                       ; 5904   004D
        SLL     R3,     1                       ; 5905   004B
        SUBI    #$0090, R3                      ; 5906   033B 0090
        PULR    R4                              ; 5908   02B4
        SAR     R1,     2                       ; 5909   006D
        SAR     R1,     2                       ; 590A   006D
        SAR     R3,     2                       ; 590B   006F
        SAR     R3,     2                       ; 590C   006F
L_590D:
        PULR    R4                              ; 590D   02B4
        MVII    #$007C, R0                      ; 590E   02B8 007C
        ADDR    R1,     R0                      ; 5910   00C8
        MVO@    R0,     R4                      ; 5911   0260
        MVO@    R3,     R4                      ; 5912   0263
        SDBD                                    ; 5913   0001
        CMPI    #$4170, R4                      ; 5914   037C 0070 0041
        BNEQ    L_597C                          ; 5917   020C 0063

        MOVR    R3,     R2                      ; 5919   009A
        INCR    R4                              ; 591A   000C
        MVI@    R4,     R0                      ; 591B   02A0
        MVII    #$0005, R1                      ; 591C   02B9 0005

        JSR     R5,     X_MPY                   ; 591E   0004 011C 01DC

        MOVR    R2,     R1                      ; 5921   0091
        MVII    #$000C, R2                      ; 5922   02BA 000C

        JSR     R5,     X_DIV                   ; 5924   0004 011C 01FB

        MOVR    R0,     R2                      ; 5927   0082
        B       L_5978                          ; 5928   0200 004E

L_592A:
        CMPI    #$0190, R1                      ; 592A   0379 0190
        BLE     L_5933                          ; 592C   0206 0005

        CLRR    R1                              ; 592E   01C9
        CLRR    R2                              ; 592F   01D2
        PULR    R4                              ; 5930   02B4
        B       L_5965                          ; 5931   0200 0032

L_5933:
        MOVR    R1,     R3                      ; 5933   008B
        MVII    #$0003, R2                      ; 5934   02BA 0003

        JSR     R5,     X_DIV                   ; 5936   0004 011C 01FB

        MOVR    R3,     R2                      ; 5939   009A
        ADDR    R0,     R3                      ; 593A   00C3
        SLL     R2,     2                       ; 593B   004E
        SLL     R2,     1                       ; 593C   004A
        SUBR    R3,     R2                      ; 593D   011A
        MOVR    R2,     R4                      ; 593E   0094
        PULR    R1                              ; 593F   02B1
        MOVR    R1,     R3                      ; 5940   008B
        MVII    #$0003, R2                      ; 5941   02BA 0003

        JSR     R5,     X_DIV                   ; 5943   0004 011C 01FB

        MOVR    R3,     R2                      ; 5946   009A
        ADDR    R0,     R3                      ; 5947   00C3
        SLL     R2,     2                       ; 5948   004E
        SLL     R2,     1                       ; 5949   004A
        SUBR    R3,     R2                      ; 594A   011A
        MOVR    R4,     R3                      ; 594B   00A3
        SUBR    R2,     R3                      ; 594C   0113
        ADDR    R2,     R4                      ; 594D   00D4
        NEGR    R4                              ; 594E   0024
        MOVR    R3,     R1                      ; 594F   0099
        MVII    #$0003, R2                      ; 5950   02BA 0003

        JSR     R5,     X_DIV                   ; 5952   0004 011C 01FB

        MOVR    R0,     R1                      ; 5955   0081
        MOVR    R0,     R2                      ; 5956   0082
        SAR     R2,     2                       ; 5957   006E
        SUBR    R2,     R1                      ; 5958   0111
        SUBR    R1,     R4                      ; 5959   010C
        MOVR    R4,     R1                      ; 595A   00A1
        ADDI    #$02F0, R0                      ; 595B   02F8 02F0
        SAR     R1,     2                       ; 595D   006D
        SAR     R1,     2                       ; 595E   006D
        ADDI    #$0130, R1                      ; 595F   02F9 0130
        SAR     R1,     1                       ; 5961   0069
        MOVR    R0,     R2                      ; 5962   0082
        SAR     R2,     2                       ; 5963   006E
        SAR     R2,     2                       ; 5964   006E
L_5965:
        PULR    R4                              ; 5965   02B4
        MVO@    R1,     R4                      ; 5966   0261
        MVO@    R2,     R4                      ; 5967   0262
        SDBD                                    ; 5968   0001
        CMPI    #$4170, R4                      ; 5969   037C 0070 0041
        BNEQ    L_597C                          ; 596C   020C 000E

        MOVR    R2,     R3                      ; 596E   0093
        INCR    R4                              ; 596F   000C
        MVI@    R4,     R0                      ; 5970   02A0
        MVII    #$000B, R1                      ; 5971   02B9 000B

        JSR     R5,     X_MPY                   ; 5973   0004 011C 01DC

        SAR     R2,     2                       ; 5976   006E
        SAR     R2,     2                       ; 5977   006E
L_5978:
        ADDR    R2,     R3                      ; 5978   00D3
        SUBI    #$0002, R4                      ; 5979   033C 0002
        MVO@    R3,     R4                      ; 597B   0263
L_597C:
        PULR    R7                              ; 597C   02B7
L_597D:
        SLL     R2,     2                       ; 597D   004E
        SLL     R2,     1                       ; 597E   004A
        ADD     G_0354, R2                      ; 597F   02C2 0354
        DECR    R2                              ; 5981   0012
        CMPR    R2,     R4                      ; 5982   0154
        BNEQ    L_58CE                          ; 5983   022C 00B6

        PSHR    R5                              ; 5985   0275
        MOVR    R1,     R0                      ; 5986   0088
        SLL     R1,     1                       ; 5987   0049
        SAR     R0,     2                       ; 5988   006C
        SUBR    R0,     R1                      ; 5989   0101
        MOVR    R3,     R0                      ; 598A   0098
        SLL     R3,     1                       ; 598B   004B
        SAR     R0,     2                       ; 598C   006C
        SUBR    R3,     R0                      ; 598D   0118
        MOVR    R1,     R3                      ; 598E   008B
        ADDR    R0,     R1                      ; 598F   00C1
        NEGR    R3                              ; 5990   0023
        ADDR    R0,     R3                      ; 5991   00C3
        SDBD                                    ; 5992   0001
        ADDI    #$05C0, R3                      ; 5993   02FB 00C0 0005
        MVII    #$0009, R2                      ; 5996   02BA 0009

        JSR     R5,     X_DIV                   ; 5998   0004 011C 01FB

        SUBR    R0,     R3                      ; 599B   0103
        SAR     R3,     2                       ; 599C   006F
        SAR     R3,     2                       ; 599D   006F
        MVI     G_01AF, R2                      ; 599E   0282 01AF
        SAR     R0,     2                       ; 59A0   006C
        SAR     R0,     2                       ; 59A1   006C
        CMPI    #$000C, R2                      ; 59A2   037A 000C
        BGT     L_59A9                          ; 59A4   020E 0003

        NEGR    R0                              ; 59A6   0020
        ADDI    #$0008, R0                      ; 59A7   02F8 0008
L_59A9:
        PULR    R5                              ; 59A9   02B5
        MVO@    R3,     R5                      ; 59AA   026B
        MVO@    R0,     R5                      ; 59AB   0268
        PULR    R7                              ; 59AC   02B7
L_59AD:
        DECR    R0                              ; 59AD   0010
        BMI     L_59BE                          ; 59AE   020B 000E

        XOR     G_0133, R1                      ; 59B0   03C1 0133
        BEQ     L_59BF                          ; 59B2   0204 000B

        MVO     R0,     G_0181                  ; 59B4   0240 0181
        MVO     R0,     G_0173                  ; 59B6   0240 0173
        SDBD                                    ; 59B8   0001
        MVII    #$5044, R0                      ; 59B9   02B8 0044 0050
        MVO     R0,     G_035D                  ; 59BC   0240 035D
L_59BE:
        MOVR    R5,     R7                      ; 59BE   00AF
L_59BF:
        PSHR    R5                              ; 59BF   0275
        J       L_6400                          ; 59C0   0004 0364 0000

L_59C3:
        DECR    R0                              ; 59C3   0010
        BMI     L_59BE                          ; 59C4   022B 0007

        XOR     G_0133, R1                      ; 59C6   03C1 0133
        BNEQ    L_59BE                          ; 59C8   022C 000B

L_59CA:
        PSHR    R5                              ; 59CA   0275
L_59CB:
        MVI     G_01B0, R5                      ; 59CB   0285 01B0
        ANDI    #$0006, R5                      ; 59CD   03BD 0006
        BNEQ    L_5A50                          ; 59CF   020C 007F

        MOVR    R7,     R4                      ; 59D1   00BC
        ADDI    #$00B2, R4                      ; 59D2   02FC 00B2
        MVII    #$0190, R5                      ; 59D4   02BD 0190
L_59D6:
        MVI@    R5,     R1                      ; 59D6   02A9
        CMPI    #$0020, R1                      ; 59D7   0379 0020
        BGE     L_5A48                          ; 59D9   020D 006D

        MVI@    R5,     R0                      ; 59DB   02A8
        DECR    R5                              ; 59DC   0015
        TSTR    R0                              ; 59DD   0080
        BNEQ    L_5A48                          ; 59DE   020C 0068

        MOVR    R5,     R0                      ; 59E0   00A8
        ANDI    #$000F, R1                      ; 59E1   03B9 000F
        MVO     R1,     G_01D9                  ; 59E3   0241 01D9
        INCR    R7                              ; 59E5   000F
L_59E6:
        PSHR    R5                              ; 59E6   0275
L_59E7:
        ANDI    #$000F, R1                      ; 59E7   03B9 000F
        MVI@    R4,     R2                      ; 59E9   02A2
        MVI@    R4,     R3                      ; 59EA   02A3
        PSHR    R4                              ; 59EB   0274
        MOVR    R0,     R5                      ; 59EC   0085
        INCR    R5                              ; 59ED   000D
        MVI@    R5,     R4                      ; 59EE   02AC

        JSR     R5,     G_E083                  ; 59EF   0004 01E0 0083

        MOVR    R0,     R5                      ; 59F2   0085
        CMPI    #$0005, R2                      ; 59F3   037A 0005
        BGE     L_5A07                          ; 59F5   020D 0010

        PULR    R3                              ; 59F7   02B3
        PSHR    R3                              ; 59F8   0273
        SUBI    #$0002, R3                      ; 59F9   033B 0002
        MVII    #$0002, R1                      ; 59FB   02B9 0002
        MVO@    R1,     R4                      ; 59FD   0261
        MVI@    R3,     R0                      ; 59FE   0298
        MVO@    R0,     R4                      ; 59FF   0260
        MVO@    R1,     R4                      ; 5A00   0261
        INCR    R3                              ; 5A01   000B
        MVI@    R3,     R0                      ; 5A02   0298
        MVO@    R0,     R4                      ; 5A03   0260
        MVO@    R1,     R5                      ; 5A04   0269
L_5A05:
        B       L_5A46                          ; 5A05   0200 003F

L_5A07:
        MVO@    R2,     R5                      ; 5A07   026A
        MOVR    R1,     R0                      ; 5A08   0088
        CLRR    R3                              ; 5A09   01DB
        PSHR    R5                              ; 5A0A   0275
        PSHR    R0                              ; 5A0B   0270

        JSR     R5,     L_6D4E                  ; 5A0C   0004 016C 014E

        PULR    R0                              ; 5A0F   02B0
        CMPI    #$0009, R0                      ; 5A10   0378 0009
        BLT     L_5A45                          ; 5A12   0205 0031

        SDBD                                    ; 5A14   0001
        CMPI    #$6080, R3                      ; 5A15   037B 0080 0060
        BNEQ    L_5A1E                          ; 5A18   020C 0004

        CMPI    #$0009, R0                      ; 5A1A   0378 0009
        BGT     L_5A22                          ; 5A1C   020E 0004

L_5A1E:
        SUBI    #$0004, R2                      ; 5A1E   033A 0004
        B       L_5A30                          ; 5A20   0200 000E

L_5A22:
        SDBD                                    ; 5A22   0001
        ADDI    #$0013, R3                      ; 5A23   02FB 0013 0000
        MVII    #$0205, R0                      ; 5A26   02B8 0205
        MVO@    R0,     R2                      ; 5A28   0250
        INCR    R2                              ; 5A29   000A
        MVII    #$0006, R0                      ; 5A2A   02B8 0006
        MVO@    R0,     R2                      ; 5A2C   0250
        SUBI    #$0005, R2                      ; 5A2D   033A 0005
        MVO@    R3,     R2                      ; 5A2F   0253

L_5A30:
        JSR     R5,     L_6E6C                  ; 5A30   0004 016C 026C

        MVI     G_01D9, R0                      ; 5A33   0280 01D9
        SUBI    #$000A, R0                      ; 5A35   0338 000A
        BMI     L_5A45                          ; 5A37   020B 000C

        CMPI    #$0003, R0                      ; 5A39   0378 0003
        BGE     L_5A45                          ; 5A3B   020D 0008

        MVO     R0,     G_01D9                  ; 5A3D   0240 01D9
        MVII    #$0006, R0                      ; 5A3F   02B8 0006

        JSR     R5,     X_CLR_BIT               ; 5A41   0004 0114 02E6

        XORR    R2,     R3                      ; 5A44   01D3
L_5A45:
        PULR    R5                              ; 5A45   02B5
L_5A46:
        PULR    R4                              ; 5A46   02B4
        PULR    R7                              ; 5A47   02B7
L_5A48:
        SUBI    #$0002, R4                      ; 5A48   033C 0002
        SUBI    #$0004, R5                      ; 5A4A   033D 0004
        CMPI    #$0187, R5                      ; 5A4C   037D 0187
        BGE     L_59D6                          ; 5A4E   022D 0079

L_5A50:
        PULR    R7                              ; 5A50   02B7
        PSHR    R5                              ; 5A51   0275
        TSTR    R0                              ; 5A52   0080
        BLE     L_5A7D                          ; 5A53   0206 0028

        XOR     G_0133, R1                      ; 5A55   03C1 0133
        BEQ     L_59CB                          ; 5A57   0224 008D

        MVI     G_035D, R1                      ; 5A59   0281 035D
        CMP     G_0349, R1                      ; 5A5B   0341 0349
        BNEQ    L_5A7D                          ; 5A5D   020C 001E

        XOR     G_01B2, R0                      ; 5A5F   03C0 01B2
        MVO     R0,     G_01B2                  ; 5A61   0240 01B2
        MVI     G_0196, R1                      ; 5A63   0281 0196
        CMPI    #$0009, R1                      ; 5A65   0379 0009
        BGE     L_5A77                          ; 5A67   020D 000E

        MOVR    R1,     R0                      ; 5A69   0088

        JSR     R5,     L_6D40                  ; 5A6A   0004 016C 0140

        BEQ     L_5A73                          ; 5A6D   0204 0004

        MOVR    R7,     R3                      ; 5A6F   00BB

        JSR     R5,     L_6D4E                  ; 5A70   0004 016C 014E

L_5A73:
        MVII    #$00FF, R0                      ; 5A73   02B8 00FF
        MVO     R0,     G_0196                  ; 5A75   0240 0196

L_5A77:
        JSR     R5,     L_6BC7                  ; 5A77   0004 0168 03C7
        JSR     R5,     L_6C82                  ; 5A7A   0004 016C 0082

L_5A7D:
        PULR    R7                              ; 5A7D   02B7
        SLLC    R2,     2                       ; 5A7E   005E
        NEGR    R4                              ; 5A7F   0024
        SLL     R1,     1                       ; 5A80   0049
        RSWD    R1                              ; 5A81   0039
        NOP                                     ; 5A82   0034
        NEGR    R4                              ; 5A83   0024
        SLL     R1,     1                       ; 5A84   0049
        INCR    R7                              ; 5A85   000F
        ADCR    R7                              ; 5A86   002F
        DECR    R0                              ; 5A87   0010
        SLR     R0,     2                       ; 5A88   0064
        DECR    R0                              ; 5A89   0010
        PSHR    R5                              ; 5A8A   0275
        MVI     G_033A, R0                      ; 5A8B   0280 033A
        ANDI    #$000F, R0                      ; 5A8D   03B8 000F
        CMPI    #$0009, R0                      ; 5A8F   0378 0009
        BNEQ    L_5A98                          ; 5A91   020C 0005

        PSHR    R0                              ; 5A93   0270

        JSR     R5,     L_6E34                  ; 5A94   0004 016C 0234

        PULR    R0                              ; 5A97   02B0
L_5A98:
        CMPI    #$000A, R0                      ; 5A98   0378 000A
        BLT     L_5AA8                          ; 5A9A   0205 000C
        BEQ     L_5AAD                          ; 5A9C   0204 000F

        CMPI    #$000D, R0                      ; 5A9E   0378 000D
        BLT     L_5AA8                          ; 5AA0   0205 0006

        MVO     R0,     G_0332                  ; 5AA2   0240 0332
        CLRR    R0                              ; 5AA4   01C0
        J       L_5F1F                          ; 5AA5   0004 035C 031F

L_5AA8:
        MVII    #$0001, R0                      ; 5AA8   02B8 0001
        MVO     R0,     G_033B                  ; 5AAA   0240 033B
        PULR    R7                              ; 5AAC   02B7
L_5AAD:
        MVII    #$001D, R0                      ; 5AAD   02B8 001D
        MVO     R0,     G_0180                  ; 5AAF   0240 0180
        MVII    #$0006, R0                      ; 5AB1   02B8 0006

        JSR     R5,     X_CLR_BIT               ; 5AB3   0004 0114 02E6

        CMPR    R5,     R5                      ; 5AB6   016D
        MVO     R0,     G_033B                  ; 5AB7   0240 033B
        MVI     G_01B1, R4                      ; 5AB9   0284 01B1
        ADDR    R7,     R4                      ; 5ABB   00FC
        ADDI    #$00DC, R4                      ; 5ABC   02FC 00DC
        MVI@    R4,     R3                      ; 5ABE   02A3
        PSHR    R4                              ; 5ABF   0274
        PSHR    R3                              ; 5AC0   0273
        CLRR    R0                              ; 5AC1   01C0

        JSR     R5,     X_CLR_BIT               ; 5AC2   0004 0114 02E6

        CMP@    R3,     R4                      ; 5AC5   035C
        MVI     G_035E, R0                      ; 5AC6   0280 035E
        ANDI    #$0003, R0                      ; 5AC8   03B8 0003
        INCR    R0                              ; 5ACA   0008
        MVO     R0,     G_012F                  ; 5ACB   0240 012F
        SDBD                                    ; 5ACD   0001
        MVII    #$9047, R0                      ; 5ACE   02B8 0047 0090
        MVO     R0,     G_031D                  ; 5AD1   0240 031D
        MVI     G_01BA, R0                      ; 5AD3   0280 01BA
        TSTR    R0                              ; 5AD5   0080
        BNEQ    L_5AE0                          ; 5AD6   020C 0008

        MVII    #$0004, R0                      ; 5AD8   02B8 0004

        JSR     R5,     X_RAND1                 ; 5ADA   0004 0114 027D
        JSR     R5,     L_5BF8                  ; 5ADD   0004 0158 03F8

L_5AE0:
        PULR    R1                              ; 5AE0   02B1

        JSR     R5,     L_5B81                  ; 5AE1   0004 0158 0381

        MVO     R0,     G_0323                  ; 5AE4   0240 0323
        MVI     G_01BA, R5                      ; 5AE6   0285 01BA
        CLRR    R3                              ; 5AE8   01DB
        MVO     R3,     G_01BA                  ; 5AE9   0243 01BA
        MVI     G_0324, R0                      ; 5AEB   0280 0324
        MOVR    R0,     R4                      ; 5AED   0084
        CMPI    #$0001, R5                      ; 5AEE   037D 0001
        BNEQ    L_5AF8                          ; 5AF0   020C 0006

        SARC    R0,     2                       ; 5AF2   007C
        BNOV    L_5AF8                          ; 5AF3   020A 0003

        INCR    R3                              ; 5AF5   000B
        MVO     R3,     G_01BA                  ; 5AF6   0243 01BA
L_5AF8:
        DECR    R5                              ; 5AF8   0015
        BPL     L_5B04                          ; 5AF9   0203 0009

        INCR    R3                              ; 5AFB   000B
        MVO     R3,     G_01BA                  ; 5AFC   0243 01BA
        MVII    #$0002, R1                      ; 5AFE   02B9 0002
        MVII    #$0001, R2                      ; 5B00   02BA 0001
        B       L_5B12                          ; 5B02   0200 000E

L_5B04:
        ADDR    R7,     R4                      ; 5B04   00FC
        ADDI    #$0143, R4                      ; 5B05   02FC 0143
        MVI@    R4,     R1                      ; 5B07   02A1
        MOVR    R1,     R2                      ; 5B08   008A
        ANDI    #$000F, R1                      ; 5B09   03B9 000F
        SAR     R2,     2                       ; 5B0B   006E
        SAR     R2,     2                       ; 5B0C   006E
        TSTR    R5                              ; 5B0D   00AD
        BEQ     L_5B12                          ; 5B0E   0204 0002

        ADDI    #$0004, R2                      ; 5B10   02FA 0004
L_5B12:
        PULR    R4                              ; 5B12   02B4
        ADDI    #$0040, R2                      ; 5B13   02FA 0040
        MVO     R1,     G_0324                  ; 5B15   0241 0324
        MVO     R2,     G_0321                  ; 5B17   0242 0321
        B       L_5B29                          ; 5B19   0200 000E

        PSHR    R5                              ; 5B1B   0275
        MVI     G_035D, R0                      ; 5B1C   0280 035D
        SUB     G_0349, R0                      ; 5B1E   0300 0349
        BEQ     L_5BB2                          ; 5B20   0204 0090
        BGT     L_5BB4                          ; 5B22   020E 0090

        MVI     G_01B1, R4                      ; 5B24   0284 01B1
        ADDR    R7,     R4                      ; 5B26   00FC
        ADDI    #$0071, R4                      ; 5B27   02FC 0071
L_5B29:
        SDBD                                    ; 5B29   0001
        MVII    #$4168, R3                      ; 5B2A   02BB 0068 0041
        MVI@    R3,     R5                      ; 5B2D   029D
        ADD@    R4,     R5                      ; 5B2E   02E5
        MVI     G_0321, R1                      ; 5B2F   0281 0321
        CMPI    #$0040, R1                      ; 5B31   0379 0040
        BLT     L_5B3B                          ; 5B33   0205 0006

        MVI     G_0317, R1                      ; 5B35   0281 0317
        SWAP    R1,     1                       ; 5B37   0041
        ANDI    #$00FF, R1                      ; 5B38   03B9 00FF
        ADDR    R1,     R5                      ; 5B3A   00CD
L_5B3B:
        MVO@    R5,     R3                      ; 5B3B   025D
        INCR    R3                              ; 5B3C   000B
        MVI@    R3,     R1                      ; 5B3D   0299
        ADD@    R4,     R1                      ; 5B3E   02E1
        MVI     G_0321, R5                      ; 5B3F   0285 0321
        CMPI    #$0040, R5                      ; 5B41   037D 0040
        BLT     L_5B56                          ; 5B43   0205 0011

        MVI     G_01BB, R5                      ; 5B45   0285 01BB
        TSTR    R5                              ; 5B47   00AD
        BEQ     L_5B56                          ; 5B48   0204 000C

        MVII    #$0004, R2                      ; 5B4A   02BA 0004
        SUBR    R5,     R2                      ; 5B4C   012A
        MOVR    R1,     R0                      ; 5B4D   0088

        JSR     R5,     X_EXT_SIGN_LO           ; 5B4E   0004 0114 0268

L_5B51:
        SAR     R0,     1                       ; 5B51   0068
        DECR    R2                              ; 5B52   0012
        BNEQ    L_5B51                          ; 5B53   022C 0003

        ADDR    R0,     R1                      ; 5B55   00C1
L_5B56:
        MVO@    R1,     R3                      ; 5B56   0259
        ADDI    #$0009, R3                      ; 5B57   02FB 0009
        MVI@    R3,     R5                      ; 5B59   029D
        ADD@    R4,     R5                      ; 5B5A   02E5
        MVI     G_0321, R0                      ; 5B5B   0280 0321
        CMPI    #$0040, R0                      ; 5B5D   0378 0040
        BLT     L_5B73                          ; 5B5F   0205 0012

        ANDI    #$003F, R0                      ; 5B61   03B8 003F
        MVO     R0,     G_0321                  ; 5B63   0240 0321
        MVI     G_0317, R1                      ; 5B65   0281 0317
        ANDI    #$00FF, R1                      ; 5B67   03B9 00FF
        SAR     R1,     1                       ; 5B69   0069
        CMPI    #$0010, R1                      ; 5B6A   0379 0010
        BLT     L_5B70                          ; 5B6C   0205 0002

        ADDI    #$0080, R1                      ; 5B6E   02F9 0080
L_5B70:
        ADDR    R1,     R5                      ; 5B70   00CD
        SUB     G_01BB, R5                      ; 5B71   0305 01BB
L_5B73:
        MVO@    R5,     R3                      ; 5B73   025D
        MVI@    R4,     R1                      ; 5B74   02A1

        JSR     R5,     L_5B81                  ; 5B75   0004 0158 0381

        MVO     R0,     G_032B                  ; 5B78   0240 032B
        SDBD                                    ; 5B7A   0001
        SUBI    #$5B98, R4                      ; 5B7B   033C 0098 005B
        MVO     R4,     G_01B1                  ; 5B7E   0244 01B1
        PULR    R7                              ; 5B80   02B7
L_5B81:
        PSHR    R5                              ; 5B81   0275
        MVI     G_01BB, R2                      ; 5B82   0282 01BB
        CMPI    #$0003, R2                      ; 5B84   037A 0003
        BNEQ    L_5B89                          ; 5B86   020C 0001

        INCR    R2                              ; 5B88   000A
L_5B89:
        ADDI    #$0008, R2                      ; 5B89   02FA 0008
        PSHR    R2                              ; 5B8B   0272
        SLL     R1,     2                       ; 5B8C   004D
        SLL     R1,     1                       ; 5B8D   0049

        JSR     R5,     X_DIV                   ; 5B8E   0004 011C 01FB

        PULR    R2                              ; 5B91   02B2
        SAR     R2,     1                       ; 5B92   006A
        SUBR    R1,     R2                      ; 5B93   010A
        BPL     L_5B97                          ; 5B94   0203 0001

        INCR    R0                              ; 5B96   0008
L_5B97:
        PULR    R7                              ; 5B97   02B7
        DECR    R5                              ; 5B98   0015
        DECLE   $0001                           ; 5B99   0001

        ADDR    R0,     R6                      ; 5B9A   00C6

        JSR     R4,     G_0801                  ; 5B9B   0004 0008 0001
        DECLE   $0000,  $0001                   ; 5B9E   0000 0001

        CLRC                                    ; 5BA0   0006
        DECLE   $0001,  $0000,  $0001           ; 5BA1   0001 0000 0001

        INCR    R1                              ; 5BA4   0009
        COMR    R1                              ; 5BA5   0019
        CLRC                                    ; 5BA6   0006
        ADDR    R2,     R0                      ; 5BA7   00D0
        DECLE   $0005                           ; 5BA8   0005

        INCR    R1                              ; 5BA9   0009
        ADDR    R7,     R2                      ; 5BAA   00FA
        ADDR    R7,     R6                      ; 5BAB   00FE
        DECLE   $0001                           ; 5BAC   0001

        INCR    R1                              ; 5BAD   0009
        ADDR    R7,     R2                      ; 5BAE   00FA
        EIS                                     ; 5BAF   0002
        DECLE   $0001                           ; 5BB0   0001

        INCR    R1                              ; 5BB1   0009
L_5BB2:
        MVO     R0,     G_0173                  ; 5BB2   0240 0173
L_5BB4:
        PULR    R7                              ; 5BB4   02B7
        XOR     G_0133, R1                      ; 5BB5   03C1 0133
        BEQ     L_5BC2                          ; 5BB7   0204 0009

        CLRR    R1                              ; 5BB9   01C9
        CMPI    #$0002, R0                      ; 5BBA   0378 0002
        BLT     L_5BC0                          ; 5BBC   0205 0002

        MVII    #$000D, R1                      ; 5BBE   02B9 000D
L_5BC0:
        MVO     R1,     G_01B1                  ; 5BC0   0241 01B1
L_5BC2:
        MOVR    R5,     R7                      ; 5BC2   00AF
L_5BC3:
        TSTR    R0                              ; 5BC3   0080
        BLE     L_5BC2                          ; 5BC4   0226 0003

        XOR     G_0133, R1                      ; 5BC6   03C1 0133
        BNEQ    L_5BCD                          ; 5BC8   020C 0003
        J       L_59CA                          ; 5BCA   0004 0358 01CA

L_5BCD:
        MVII    #$0178, R1                      ; 5BCD   02B9 0178
        SUB     G_0133, R1                      ; 5BCF   0301 0133
        MVI@    R1,     R0                      ; 5BD1   0288
        INCR    R0                              ; 5BD2   0008
        MVO@    R0,     R1                      ; 5BD3   0248
        SDBD                                    ; 5BD4   0001
        MVII    #$5026, R2                      ; 5BD5   02BA 0026 0050
        MVO     R2,     G_035D                  ; 5BD8   0242 035D
        CLRR    R0                              ; 5BDA   01C0
        MVO     R0,     G_0352                  ; 5BDB   0240 0352
        MVO     R0,     G_0317                  ; 5BDD   0240 0317
        MVII    #$0270, R0                      ; 5BDF   02B8 0270
        MVO     R0,     G_033A                  ; 5BE1   0240 033A
        MVO     R0,     G_0332                  ; 5BE3   0240 0332
        MVII    #$0014, R0                      ; 5BE5   02B8 0014
        MVO     R0,     G_033B                  ; 5BE7   0240 033B
        MOVR    R5,     R7                      ; 5BE9   00AF
        PSHR    R5                              ; 5BEA   0275
L_5BEB:
        XOR     G_0133, R1                      ; 5BEB   03C1 0133
        BNEQ    L_5BF2                          ; 5BED   020C 0003
        J       L_63FF                          ; 5BEF   0004 0360 03FF

L_5BF2:
        TSTR    R0                              ; 5BF2   0080
        BMI     L_5C47                          ; 5BF3   020B 0052

        MVO     R1,     G_01BA                  ; 5BF5   0241 01BA
        INCR    R7                              ; 5BF7   000F
L_5BF8:
        PSHR    R5                              ; 5BF8   0275
        PSHR    R0                              ; 5BF9   0270
        MVO     R0,     G_0324                  ; 5BFA   0240 0324

        JSR     R5,     G_E0E1                  ; 5BFC   0004 01E0 00E1

        MVII    #$0003, R4                      ; 5BFF   02BC 0003
        DECR    R2                              ; 5C01   0012
        MVI@    R2,     R0                      ; 5C02   0290
        ANDR    R4,     R0                      ; 5C03   01A0
        DECR    R2                              ; 5C04   0012
        MVI@    R2,     R1                      ; 5C05   0291
        ANDR    R4,     R1                      ; 5C06   01A1
        SUBR    R4,     R5                      ; 5C07   0125
        NEGR    R5                              ; 5C08   0025
        SUBR    R5,     R1                      ; 5C09   0129
        BPL     L_5C0D                          ; 5C0A   0203 0001

        CLRR    R1                              ; 5C0C   01C9
L_5C0D:
        MVO     R1,     G_01BB                  ; 5C0D   0241 01BB
        MVII    #$000C, R1                      ; 5C0F   02B9 000C
        SUBR    R5,     R0                      ; 5C11   0128
        SUBI    #$0003, R0                      ; 5C12   0338 0003
        BEQ     L_5C21                          ; 5C14   0204 000B

        DECR    R1                              ; 5C16   0011
        INCR    R0                              ; 5C17   0008
        BEQ     L_5C21                          ; 5C18   0204 0007

        SUBI    #$0003, R1                      ; 5C1A   0339 0003
        INCR    R0                              ; 5C1C   0008
        BEQ     L_5C21                          ; 5C1D   0204 0002

        SUBI    #$0002, R1                      ; 5C1F   0339 0002
L_5C21:
        CLRR    R2                              ; 5C21   01D2
        MVII    #$0004, R0                      ; 5C22   02B8 0004

        JSR     R5,     X_RAND1                 ; 5C24   0004 0114 027D

        CMPR    R1,     R0                      ; 5C27   0148
        BLE     L_5C32                          ; 5C28   0206 0008

        MVI     G_01BA, R0                      ; 5C2A   0280 01BA
        ADDI    #$0002, R0                      ; 5C2C   02F8 0002
        MVO     R0,     G_01BA                  ; 5C2E   0240 01BA
        B       L_5C34                          ; 5C30   0200 0002

L_5C32:
        MVI     G_01BA, R0                      ; 5C32   0280 01BA
L_5C34:
        CMPI    #$0003, R0                      ; 5C34   0378 0003
        BNEQ    L_5C39                          ; 5C36   020C 0001

        DECR    R0                              ; 5C38   0010
L_5C39:
        PULR    R1                              ; 5C39   02B1
        CMPI    #$0008, R1                      ; 5C3A   0379 0008
        BGE     L_5C40                          ; 5C3C   020D 0002

        ADDI    #$0010, R1                      ; 5C3E   02F9 0010
L_5C40:
        SUBI    #$0008, R1                      ; 5C40   0339 0008

        JSR     R5,     .EXEC.629               ; 5C42   0004 0114 0229

        MVO     R0,     G_0317                  ; 5C45   0240 0317
L_5C47:
        PULR    R7                              ; 5C47   02B7
        SWAP    R1,     1                       ; 5C48   0041
        SWAP    R1,     1                       ; 5C49   0041
        SWAP    R0,     1                       ; 5C4A   0040
        NEGR    R0                              ; 5C4B   0020
        NEGR    R0                              ; 5C4C   0020
        NEGR    R0                              ; 5C4D   0020
        DECLE   $0000,  $0001,  $0001,  $0001   ; 5C4E   0000 0001 0001 0001

        EIS                                     ; 5C52   0002
        NEGR    R2                              ; 5C53   0022
        NEGR    R2                              ; 5C54   0022
        NEGR    R2                              ; 5C55   0022
        SWAP    R2,     1                       ; 5C56   0042
        SWAP    R1,     1                       ; 5C57   0041
        PSHR    R5                              ; 5C58   0275
        MVI     G_035D, R0                      ; 5C59   0280 035D
        SDBD                                    ; 5C5B   0001
        CMPI    #$5030, R0                      ; 5C5C   0378 0030 0050
        BNEQ    L_5EAB                          ; 5C5F   020C 024A

        SDBD                                    ; 5C61   0001
        ADDI    #$000A, R0                      ; 5C62   02F8 000A 0000
        MVO     R0,     G_035D                  ; 5C65   0240 035D
        MVI     G_01AC, R1                      ; 5C67   0281 01AC
        ADD     G_01AD, R1                      ; 5C69   02C1 01AD
        MVO     R1,     G_01AD                  ; 5C6B   0241 01AD
        CLRR    R1                              ; 5C6D   01C9
        MVO     R1,     G_01AC                  ; 5C6E   0241 01AC
        MVO     R1,     G_01B1                  ; 5C70   0241 01B1
        MVI     G_01AE, R3                      ; 5C72   0283 01AE
        CMPI    #$00FF, R3                      ; 5C74   037B 00FF
        BEQ     L_5E15                          ; 5C76   0204 019D

        CMPI    #$001D, R3                      ; 5C78   037B 001D
        BGT     L_5E18                          ; 5C7A   020E 019C

        MVI     G_0321, R1                      ; 5C7C   0281 0321
        MVI     G_032C, R2                      ; 5C7E   0282 032C
        SUBR    R1,     R2                      ; 5C80   010A
        BEQ     L_5CAF                          ; 5C81   0204 002C

        MVI     G_033C, R1                      ; 5C83   0281 033C
        MVI@    R1,     R4                      ; 5C85   028C
        ADDR    R4,     R4                      ; 5C86   00E4
        ADDR    R4,     R4                      ; 5C87   00E4
        SDBD                                    ; 5C88   0001
        ADDI    #$4376, R4                      ; 5C89   02FC 0076 0043
        MVI@    R4,     R2                      ; 5C8C   02A2
        MVI@    R4,     R1                      ; 5C8D   02A1
        MVI@    R4,     R4                      ; 5C8E   02A4
        ANDI    #$0007, R4                      ; 5C8F   03BC 0007
        SLL     R2,     2                       ; 5C91   004E
        ADDI    #$00F4, R1                      ; 5C92   02F9 00F4
        MOVR    R1,     R5                      ; 5C94   008D
        SUBI    #$0122, R5                      ; 5C95   033D 0122
        BMI     L_5E18                          ; 5C97   020B 017F

        PSHR    R3                              ; 5C99   0273
        MVII    #$0001, R3                      ; 5C9A   02BB 0001
        SUBI    #$001E, R5                      ; 5C9C   033D 001E
        BMI     L_5CA6                          ; 5C9E   020B 0006

        INCR    R3                              ; 5CA0   000B
        SUBI    #$0014, R5                      ; 5CA1   033D 0014
        BMI     L_5CA6                          ; 5CA3   020B 0001

        INCR    R3                              ; 5CA5   000B
L_5CA6:
        MVII    #$0003, R0                      ; 5CA6   02B8 0003

        JSR     R5,     X_RAND1                 ; 5CA8   0004 0114 027D

        CMPR    R3,     R0                      ; 5CAB   0158
        PULR    R3                              ; 5CAC   02B3
        BGE     L_5E18                          ; 5CAD   020D 0169

L_5CAF:
        MVII    #$000E, R0                      ; 5CAF   02B8 000E
        MVO     R0,     G_032B                  ; 5CB1   0240 032B
        MVI     G_016D, R0                      ; 5CB3   0280 016D
        XORI    #$0020, R0                      ; 5CB5   03F8 0020
        MVO     R0,     G_016D                  ; 5CB7   0240 016D
        PSHR    R3                              ; 5CB9   0273
        MVI     G_01BE, R0                      ; 5CBA   0280 01BE
        TSTR    R0                              ; 5CBC   0080
        BEQ     L_5CC7                          ; 5CBD   0204 0008

        MVII    #$0001, R4                      ; 5CBF   02BC 0001
        MVO     R4,     G_033B                  ; 5CC1   0244 033B
        MVII    #$0012, R4                      ; 5CC3   02BC 0012
        B       L_5D6A                          ; 5CC5   0200 00A3

L_5CC7:
        MVII    #$0003, R0                      ; 5CC7   02B8 0003

        JSR     R5,     X_RAND1                 ; 5CC9   0004 0114 027D

        MOVR    R0,     R3                      ; 5CCC   0083
        MVII    #$0001, R0                      ; 5CCD   02B8 0001

        JSR     R5,     X_RAND1                 ; 5CCF   0004 0114 027D

        ADDR    R0,     R3                      ; 5CD2   00C3
        SLL     R3,     1                       ; 5CD3   004B
        PSHR    R3                              ; 5CD4   0273
        MVI     G_0321, R3                      ; 5CD5   0283 0321
        SAR     R3,     1                       ; 5CD7   006B
        ADDR    R7,     R3                      ; 5CD8   00FB
        ADDI    #$0205, R3                      ; 5CD9   02FB 0205
        MVI@    R3,     R3                      ; 5CDB   029B
        MVO     R3,     G_0329                  ; 5CDC   0243 0329
        MVII    #$0008, R0                      ; 5CDE   02B8 0008

        JSR     R5,     X_RAND1                 ; 5CE0   0004 0114 027D

        CMPR    R2,     R0                      ; 5CE3   0150
        BLT     L_5CEB                          ; 5CE4   0205 0005

        CLRR    R0                              ; 5CE6   01C0

        JSR     R5,     X_SET_BIT               ; 5CE7   0004 0114 02DB

        SUB@    R5,     R1                      ; 5CEA   0329
L_5CEB:
        MOVR    R4,     R2                      ; 5CEB   00A2
        SLL     R2,     2                       ; 5CEC   004E
        ADDR    R4,     R2                      ; 5CED   00E2
        SLL     R2,     2                       ; 5CEE   004E
        MVII    #$0008, R0                      ; 5CEF   02B8 0008

        JSR     R5,     X_RAND1                 ; 5CF1   0004 0114 027D

        CMPR    R2,     R0                      ; 5CF4   0150
        BLT     L_5CFD                          ; 5CF5   0205 0006

        MVII    #$0001, R0                      ; 5CF7   02B8 0001

        JSR     R5,     X_SET_BIT               ; 5CF9   0004 0114 02DB

        SUB@    R5,     R1                      ; 5CFC   0329
L_5CFD:
        MVII    #$000A, R0                      ; 5CFD   02B8 000A

        JSR     R5,     X_RAND1                 ; 5CFF   0004 0114 027D

        CMPR    R1,     R0                      ; 5D02   0148
        BLT     L_5D0B                          ; 5D03   0205 0006

        MVII    #$0002, R0                      ; 5D05   02B8 0002

        JSR     R5,     X_SET_BIT               ; 5D07   0004 0114 02DB

        SUB@    R5,     R1                      ; 5D0A   0329
L_5D0B:
        PULR    R4                              ; 5D0B   02B4
        MVII    #$0001, R2                      ; 5D0C   02BA 0001
        MOVR    R4,     R1                      ; 5D0E   00A1
        SAR     R1,     1                       ; 5D0F   0069
        MOVR    R7,     R3                      ; 5D10   00BB
        ADDI    #$0053, R3                      ; 5D11   02FB 0053
        INCR    R1                              ; 5D13   0009
        ADDR    R7,     R1                      ; 5D14   00F9
        ADD@    R1,     R7                      ; 5D15   02CF
        INCR    R2                              ; 5D16   000A
        NEGR    R5                              ; 5D17   0025
        GSWD    R2                              ; 5D18   0032
        COMR    R2                              ; 5D19   001A
        NEGR    R6                              ; 5D1A   0026
        SWAP    R1,     1                       ; 5D1B   0041
        SLL     R2,     2                       ; 5D1C   004E
        SWAP    R0,     1                       ; 5D1D   0040
        GSWD    R3                              ; 5D1E   0033
        MOVR    R3,     R7                      ; 5D1F   009F
        MVO     R2,     G_01DE                  ; 5D20   0242 01DE
        MVII    #$0002, R0                      ; 5D22   02B8 0002

        JSR     R5,     X_CLR_BIT               ; 5D24   0004 0114 02E6

        XORR    R2,     R4                      ; 5D27   01D4
        MVII    #$0004, R0                      ; 5D28   02B8 0004

        JSR     R5,     X_CLR_BIT               ; 5D2A   0004 0114 02E6

        XORR    R2,     R4                      ; 5D2D   01D4
        CLRR    R1                              ; 5D2E   01C9
        MOVR    R3,     R7                      ; 5D2F   009F
        CLRR    R2                              ; 5D30   01D2
        MVO     R2,     G_01DE                  ; 5D31   0242 01DE
        MVII    #$0002, R0                      ; 5D33   02B8 0002

        JSR     R5,     X_CLR_BIT               ; 5D35   0004 0114 02E6

        XORR    R2,     R4                      ; 5D38   01D4
        CLRR    R1                              ; 5D39   01C9
        MOVR    R3,     R7                      ; 5D3A   009F
        CLRR    R2                              ; 5D3B   01D2
        MVO     R2,     G_01DD                  ; 5D3C   0242 01DD
        MVII    #$0001, R0                      ; 5D3E   02B8 0001

        JSR     R5,     X_CLR_BIT               ; 5D40   0004 0114 02E6

        XORR    R2,     R4                      ; 5D43   01D4
        MVII    #$002F, R2                      ; 5D44   02BA 002F
        CLRR    R1                              ; 5D46   01C9
        MOVR    R3,     R7                      ; 5D47   009F
        CLRR    R2                              ; 5D48   01D2
        MVO     R2,     G_01DB                  ; 5D49   0242 01DB
        MVII    #$0007, R0                      ; 5D4B   02B8 0007

        JSR     R5,     X_CLR_BIT               ; 5D4D   0004 0114 02E6

        XORR    R2,     R3                      ; 5D50   01D3
        MVII    #$002F, R2                      ; 5D51   02BA 002F
        MVII    #$0002, R1                      ; 5D53   02B9 0002
        MOVR    R3,     R7                      ; 5D55   009F
        CLRR    R2                              ; 5D56   01D2
        MVO     R2,     G_01DC                  ; 5D57   0242 01DC
        MVII    #$0000, R0                      ; 5D59   02B8 0000

        JSR     R5,     X_CLR_BIT               ; 5D5B   0004 0114 02E6

        XORR    R2,     R4                      ; 5D5E   01D4
        MVII    #$002F, R2                      ; 5D5F   02BA 002F
        MVII    #$0003, R1                      ; 5D61   02B9 0003
        MOVR    R3,     R7                      ; 5D63   009F
        MVO     R1,     G_01BC                  ; 5D64   0241 01BC
        MVO     R1,     G_01BD                  ; 5D66   0241 01BD
        MVO     R2,     G_01DF                  ; 5D68   0242 01DF
L_5D6A:
        ADDR    R7,     R4                      ; 5D6A   00FC
        ADDI    #$015F, R4                      ; 5D6B   02FC 015F
        PULR    R3                              ; 5D6D   02B3
        ADDR    R7,     R3                      ; 5D6E   00FB
        ADDI    #$013D, R3                      ; 5D6F   02FB 013D
        PSHR    R3                              ; 5D71   0273
        PSHR    R4                              ; 5D72   0274
        SDBD                                    ; 5D73   0001
        MVII    #$4168, R5                      ; 5D74   02BD 0068 0041
        MVII    #$0002, R4                      ; 5D77   02BC 0002
L_5D79:
        PULR    R2                              ; 5D79   02B2
        PULR    R3                              ; 5D7A   02B3
        MVI@    R3,     R1                      ; 5D7B   0299
        INCR    R3                              ; 5D7C   000B
        PSHR    R3                              ; 5D7D   0273
        PSHR    R2                              ; 5D7E   0272
        MVI@    R2,     R2                      ; 5D7F   0292
        MOVR    R2,     R3                      ; 5D80   0093
        XORR    R1,     R3                      ; 5D81   01CB
        PSHR    R5                              ; 5D82   0275
        MVII    #$0003, R0                      ; 5D83   02B8 0003
        CMPI    #$0001, R4                      ; 5D85   037C 0001
        BNEQ    L_5D8E                          ; 5D87   020C 0005

        CMPI    #$0030, R1                      ; 5D89   0379 0030
        BLE     L_5D93                          ; 5D8B   0206 0006

        INCR    R0                              ; 5D8D   0008

L_5D8E:
        JSR     R5,     X_RAND1                 ; 5D8E   0004 0114 027D

        SLL     R0,     1                       ; 5D91   0048
        ADDR    R0,     R1                      ; 5D92   00C1

L_5D93:
        JSR     R5,     G_E000                  ; 5D93   0004 01E0 0000

        TSTR    R0                              ; 5D96   0080
        DECLE   $0000                           ; 5D97   0000

        PULR    R5                              ; 5D98   02B5
        MOVR    R0,     R1                      ; 5D99   0081
        MVI     G_0329, R2                      ; 5D9A   0282 0329
        SARC    R2,     1                       ; 5D9C   007A
        BNC     L_5DA3                          ; 5D9D   0209 0004

        ADDI    #$0006, R1                      ; 5D9F   02F9 0006
        B       L_5DB2                          ; 5DA1   0200 000F

L_5DA3:
        TSTR    R2                              ; 5DA3   0092
        BEQ     L_5DB2                          ; 5DA4   0204 000C

        MVII    #$0002, R0                      ; 5DA6   02B8 0002
        PSHR    R5                              ; 5DA8   0275

        JSR     R5,     X_RAND1                 ; 5DA9   0004 0114 027D

        PULR    R5                              ; 5DAC   02B5
        ADDR    R0,     R1                      ; 5DAD   00C1
        SARC    R2,     1                       ; 5DAE   007A
        BEQ     L_5DB2                          ; 5DAF   0204 0001

        ADDR    R0,     R1                      ; 5DB1   00C1
L_5DB2:
        SARC    R3,     1                       ; 5DB2   007B
        BNC     L_5DB6                          ; 5DB3   0209 0001

        NEGR    R1                              ; 5DB5   0021
L_5DB6:
        MVO@    R1,     R5                      ; 5DB6   0269
        DECR    R4                              ; 5DB7   0014
        BNEQ    L_5D79                          ; 5DB8   022C 0040

        PULR    R3                              ; 5DBA   02B3
        INCR    R3                              ; 5DBB   000B
        PULR    R1                              ; 5DBC   02B1
        MVI@    R3,     R1                      ; 5DBD   0299
        MOVR    R1,     R3                      ; 5DBE   008B
        SAR     R1,     1                       ; 5DBF   0069
        MVI     G_0329, R2                      ; 5DC0   0282 0329
        SARC    R2,     1                       ; 5DC2   007A
        BNC     L_5DC7                          ; 5DC3   0209 0002

        ADDI    #$0005, R1                      ; 5DC5   02F9 0005
L_5DC7:
        SARC    R3,     1                       ; 5DC7   007B
        BNC     L_5DCB                          ; 5DC8   0209 0001

        NEGR    R1                              ; 5DCA   0021
L_5DCB:
        ADDI    #$0007, R5                      ; 5DCB   02FD 0007
        MVII    #$000A, R2                      ; 5DCD   02BA 000A
        MVO@    R2,     R5                      ; 5DCF   026A
        MVO@    R1,     R5                      ; 5DD0   0269
        MVO     R1,     G_0186                  ; 5DD1   0241 0186
        SUBI    #$000B, R5                      ; 5DD3   033D 000B
        MVII    #$0004, R4                      ; 5DD5   02BC 0004
        MVI@    R5,     R0                      ; 5DD7   02A8
        MVI@    R5,     R1                      ; 5DD8   02A9

        JSR     R5,     X_EXT_SIGN_LO           ; 5DD9   0004 0114 0268

        BPL     L_5DDF                          ; 5DDC   0203 0001

        NEGR    R0                              ; 5DDE   0020
L_5DDF:
        MOVR    R0,     R2                      ; 5DDF   0082
        MOVR    R1,     R0                      ; 5DE0   0088

        JSR     R5,     X_EXT_SIGN_LO           ; 5DE1   0004 0114 0268

        BMI     L_5DF2                          ; 5DE4   020B 000C

        CMPR    R0,     R2                      ; 5DE6   0142
        BGT     L_5DF2                          ; 5DE7   020E 0009

        DECR    R4                              ; 5DE9   0014
        MVI     G_01AB, R5                      ; 5DEA   0285 01AB
        ANDI    #$0003, R5                      ; 5DEC   03BD 0003
        MVO     R5,     G_01AB                  ; 5DEE   0245 01AB
        B       L_5DF5                          ; 5DF0   0200 0003

L_5DF2:
        JSR     R5,     L_587C                  ; 5DF2   0004 0158 007C

L_5DF5:
        MVO     R4,     G_01B0                  ; 5DF5   0244 01B0

        JSR     R5,     .EXEC.A61               ; 5DF7   0004 0118 0261

        CLRC                                    ; 5DFA   0006
        MVII    #$0001, R0                      ; 5DFB   02B8 0001
        MVI     G_0186, R1                      ; 5DFD   0281 0186
        CMPI    #$0013, R1                      ; 5DFF   0379 0013
        BLT     L_5E10                          ; 5E01   0205 000D

        CMPI    #$0080, R1                      ; 5E03   0379 0080
        BGE     L_5E10                          ; 5E05   020D 0009

        MVI     G_01B0, R3                      ; 5E07   0283 01B0
        SARC    R3,     1                       ; 5E09   007B
        BNC     L_5E10                          ; 5E0A   0209 0004

        SLL     R1,     2                       ; 5E0C   004D
        SUBI    #$001E, R1                      ; 5E0D   0339 001E
        MOVR    R1,     R0                      ; 5E0F   0088
L_5E10:
        MVO     R0,     G_01B9                  ; 5E10   0240 01B9
        J       L_6995                          ; 5E12   0004 0368 0195

L_5E15:
        MVI     G_01BA, R1                      ; 5E15   0281 01BA
        INCR    R7                              ; 5E17   000F
L_5E18:
        MOVR    R6,     R1                      ; 5E18   00B1
        MVI     G_01AB, R0                      ; 5E19   0280 01AB
        MOVR    R0,     R2                      ; 5E1B   0082
        DECR    R1                              ; 5E1C   0011
        BMI     L_5E52                          ; 5E1D   020B 0033
        BEQ     L_5E25                          ; 5E1F   0204 0004

        JSR     R5,     .EXEC.A61               ; 5E21   0004 0118 0261

        SETC                                    ; 5E24   0007
L_5E25:
        MVI     G_01AB, R0                      ; 5E25   0280 01AB
        MOVR    R0,     R2                      ; 5E27   0082
        ANDI    #$00F0, R0                      ; 5E28   03B8 00F0
        XORR    R0,     R2                      ; 5E2A   01C2
        ADDI    #$0010, R0                      ; 5E2B   02F8 0010
        CMPI    #$0030, R0                      ; 5E2D   0378 0030
        BEQ     L_5E3D                          ; 5E2F   0204 000C

        XORR    R0,     R2                      ; 5E31   01C2
        MVII    #$0002, R0                      ; 5E32   02B8 0002

        JSR     R5,     X_CLR_BIT               ; 5E34   0004 0114 02E6

        XORR    R2,     R5                      ; 5E37   01D5
        MVO     R2,     G_01AB                  ; 5E38   0242 01AB
        B       L_5EA2                          ; 5E3A   0200 0066

L_5E3C:
        PSHR    R5                              ; 5E3C   0275
L_5E3D:
        ANDI    #$0003, R2                      ; 5E3D   03BA 0003
        MVO     R2,     G_01AB                  ; 5E3F   0242 01AB
        MVII    #$0000, R0                      ; 5E41   02B8 0000

        JSR     R5,     X_CLR_BIT               ; 5E43   0004 0114 02E6

        XORR    R2,     R3                      ; 5E46   01D3
        SDBD                                    ; 5E47   0001
        MVII    #$4790, R5                      ; 5E48   02BD 0090 0047
        MVII    #$00FA, R0                      ; 5E4B   02B8 00FA
        MVO@    R0,     R5                      ; 5E4D   0268

        JSR     R5,     G_E5F1                  ; 5E4E   0004 01E4 01F1

        PULR    R7                              ; 5E51   02B7
L_5E52:
        ANDI    #$000C, R0                      ; 5E52   03B8 000C
        XORR    R0,     R2                      ; 5E54   01C2
        ADDI    #$0004, R0                      ; 5E55   02F8 0004
        CMPI    #$0010, R0                      ; 5E57   0378 0010
        BGE     L_5E64                          ; 5E59   020D 0009

        XORR    R0,     R2                      ; 5E5B   01C2
        MVII    #$0003, R0                      ; 5E5C   02B8 0003

        JSR     R5,     X_CLR_BIT               ; 5E5E   0004 0114 02E6

        XORR    R2,     R5                      ; 5E61   01D5
        B       L_5EA2                          ; 5E62   0200 003E

L_5E64:
        ANDI    #$0003, R2                      ; 5E64   03BA 0003
        MVO     R2,     G_01AB                  ; 5E66   0242 01AB
        MVII    #$0007, R0                      ; 5E68   02B8 0007

        JSR     R5,     X_CLR_BIT               ; 5E6A   0004 0114 02E6

        XORR    R2,     R4                      ; 5E6D   01D4
        MVII    #$0004, R1                      ; 5E6E   02B9 0004
        MVO     R1,     G_0179                  ; 5E70   0241 0179
        SAR     R1,     1                       ; 5E72   0069
        MVO     R1,     G_033B                  ; 5E73   0241 033B
        MVO     R1,     G_01BF                  ; 5E75   0241 01BF
        MVII    #$018A, R5                      ; 5E77   02BD 018A
        SDBD                                    ; 5E79   0001
        MVII    #$5A80, R4                      ; 5E7A   02BC 0080 005A
L_5E7D:
        MVI@    R5,     R0                      ; 5E7D   02A8
        CMPI    #$0040, R0                      ; 5E7E   0378 0040
        BGE     L_5E92                          ; 5E80   020D 0010

        DECR    R5                              ; 5E82   0015
        ANDI    #$000F, R0                      ; 5E83   03B8 000F
        MOVR    R0,     R1                      ; 5E85   0081
        XORI    #$0010, R0                      ; 5E86   03F8 0010
        MVO@    R0,     R5                      ; 5E88   0268
        MOVR    R5,     R0                      ; 5E89   00A8

        JSR     R5,     L_59E6                  ; 5E8A   0004 0158 01E6

        INCR    R5                              ; 5E8D   000D
        CMPI    #$0193, R5                      ; 5E8E   037D 0193
        BLT     L_5E7D                          ; 5E90   0225 0014

L_5E92:
        MVII    #$0022, R2                      ; 5E92   02BA 0022
        MVII    #$0001, R3                      ; 5E94   02BB 0001
        MVII    #$0093, R1                      ; 5E96   02B9 0093
        MVII    #$02E4, R4                      ; 5E98   02BC 02E4

        JSR     R5,     G_E712                  ; 5E9A   0004 01E4 0312

        ADD@    R4,     R1                      ; 5E9D   02E1
        ANDR    R1,     R3                      ; 5E9E   018B
        DECLE   $0000                           ; 5E9F   0000

        B       L_5EA8                          ; 5EA0   0200 0006

L_5EA2:
        MVO     R2,     G_01AB                  ; 5EA2   0242 01AB

        JSR     R5,     .EXEC.A61               ; 5EA4   0004 0118 0261

        EIS                                     ; 5EA7   0002

L_5EA8:
        JSR     R5,     L_5373                  ; 5EA8   0004 0150 0373

L_5EAB:
        PULR    R7                              ; 5EAB   02B7
        ADCR    R1                              ; 5EAC   0029
        DECR    R2                              ; 5EAD   0012
        ADCR    R1                              ; 5EAE   0029
        DECR    R6                              ; 5EAF   0016
        ADCR    R1                              ; 5EB0   0029
        COMR    R2                              ; 5EB1   001A
        RSWD    R7                              ; 5EB2   003F
        SWAP    R0,     1                       ; 5EB3   0040
        ADCR    R1                              ; 5EB4   0029
        SLL     R0,     2                       ; 5EB5   004C
        DECR    R5                              ; 5EB6   0015
        RLC     R2,     2                       ; 5EB7   0056
        SETC                                    ; 5EB8   0007
        SLLC    R2,     1                       ; 5EB9   005A
        DECLE   $0005                           ; 5EBA   0005

        SLR     R2,     2                       ; 5EBB   0066
        CLRC                                    ; 5EBC   0006
        SLLC    R2,     1                       ; 5EBD   005A
        DECR    R4                              ; 5EBE   0014
        RLC     R2,     2                       ; 5EBF   0056
        ADCR    R0                              ; 5EC0   0028
        SLL     R0,     2                       ; 5EC1   004C
        RSWD    R6                              ; 5EC2   003E
        SWAP    R0,     1                       ; 5EC3   0040
        NEGR    R4                              ; 5EC4   0024
        DECR    R6                              ; 5EC5   0016
        NEGR    R4                              ; 5EC6   0024
        DECR    R0                              ; 5EC7   0010
        NEGR    R6                              ; 5EC8   0026
        ADCR    R7                              ; 5EC9   002F
        MOVR    R5,     R2                      ; 5ECA   00AA
        ADCR    R0                              ; 5ECB   0028
        MOVR    R4,     R6                      ; 5ECC   00A6
        COMR    R6                              ; 5ECD   001E
        SUBR    R0,     R0                      ; 5ECE   0100
        SLR     R1,     1                       ; 5ECF   0061
        SUBR    R0,     R0                      ; 5ED0   0100
        RSWD    R0                              ; 5ED1   0038
        MOVR    R2,     R0                      ; 5ED2   0090
        DECR    R0                              ; 5ED3   0010
        MOVR    R2,     R0                      ; 5ED4   0090
        CLRC                                    ; 5ED5   0006
        SUBR    R0,     R1                      ; 5ED6   0101
        DECR    R0                              ; 5ED7   0010
        MOVR    R4,     R0                      ; 5ED8   00A0

        JSR     R5,     .IV.FIFO                ; 5ED9   0004 0100 0081

        ANDR    R0,     R0                      ; 5EDC   0180
        EIS                                     ; 5EDD   0002
        DECLE   $0001                           ; 5EDE   0001

        SETC                                    ; 5EDF   0007

        JSRD    R4,     G_0406                  ; 5EE0   0004 0006 0006

        EIS                                     ; 5EE3   0002
        DECLE   $0000                           ; 5EE4   0000

        CLRC                                    ; 5EE5   0006

        JSR     R4,     G_820B                  ; 5EE6   0004 0080 020B

        NOP                                     ; 5EE9   0034
        XOR     G_0133, R1                      ; 5EEA   03C1 0133
        BNEQ    L_5F1E                          ; 5EEC   020C 0030

        MVI     G_01BE, R2                      ; 5EEE   0282 01BE
        TSTR    R2                              ; 5EF0   0092
        BNEQ    L_5F1E                          ; 5EF1   020C 002B

        INCR    R1                              ; 5EF3   0009
        MVO     R1,     G_01BE                  ; 5EF4   0241 01BE
        MVO     R1,     G_032C                  ; 5EF6   0241 032C
        INCR    R1                              ; 5EF8   0009
        MVI     G_0323, R3                      ; 5EF9   0283 0323
        CMPI    #$0008, R3                      ; 5EFB   037B 0008
        BGT     L_5F02                          ; 5EFD   020E 0003

        MVII    #$0008, R1                      ; 5EFF   02B9 0008
        SUBR    R3,     R1                      ; 5F01   0119
L_5F02:
        MOVR    R1,     R2                      ; 5F02   008A
        SLL     R2,     1                       ; 5F03   004A
        ADDR    R2,     R1                      ; 5F04   00D1
        SLL     R1,     1                       ; 5F05   0049
        ADD     G_0324, R1                      ; 5F06   02C1 0324
        MVO     R1,     G_01AE                  ; 5F08   0241 01AE
        MVII    #$0004, R0                      ; 5F0A   02B8 0004
        MVO     R0,     G_033A                  ; 5F0C   0240 033A
        MVO     R0,     G_0342                  ; 5F0E   0240 0342
        MVO     R0,     G_034A                  ; 5F10   0240 034A
        MVII    #$0030, R1                      ; 5F12   02B9 0030
        SWAP    R1,     1                       ; 5F14   0041
        MVO     R1,     G_0338                  ; 5F15   0241 0338
        MVII    #$0088, R1                      ; 5F17   02B9 0088
        SWAP    R1,     1                       ; 5F19   0041
        MVO     R1,     G_0337                  ; 5F1A   0241 0337
        MVO     R0,     G_0179                  ; 5F1C   0240 0179
L_5F1E:
        MOVR    R5,     R7                      ; 5F1E   00AF
L_5F1F:
        MVII    #$00FF, R0                      ; 5F1F   02B8 00FF
        MVO     R0,     G_01AE                  ; 5F21   0240 01AE
        SDBD                                    ; 5F23   0001
        MVII    #$9053, R1                      ; 5F24   02B9 0053 0090
        MVO     R1,     G_0335                  ; 5F27   0241 0335
        SDBD                                    ; 5F29   0001
        MVII    #$604F, R1                      ; 5F2A   02B9 004F 0060
        MVO     R1,     G_0336                  ; 5F2D   0241 0336
        SDBD                                    ; 5F2F   0001
        MVII    #$5030, R1                      ; 5F30   02B9 0030 0050
        MVO     R1,     G_035D                  ; 5F33   0241 035D
        SDBD                                    ; 5F35   0001
        MVII    #$2205, R1                      ; 5F36   02B9 0005 0022
        MVO     R1,     .BTAB.5E                ; 5F39   0241 025E
        MVO     R1,     .BTAB.62                ; 5F3B   0241 0262
        MVO     R0,     G_0337                  ; 5F3D   0240 0337
        CLRR    R0                              ; 5F3F   01C0
        B       L_5F81                          ; 5F40   0200 003F

L_5F42:
        PSHR    R5                              ; 5F42   0275
        TSTR    R0                              ; 5F43   0080
        BMI     L_5FAA                          ; 5F44   020B 0064

        XOR     G_0133, R1                      ; 5F46   03C1 0133
        BNEQ    L_5FAA                          ; 5F48   020C 0060

        CLRR    R1                              ; 5F4A   01C9
        CMPI    #$0002, R0                      ; 5F4B   0378 0002
        BLT     L_5F5C                          ; 5F4D   0205 000D

        CMPI    #$0006, R0                      ; 5F4F   0378 0006
        BLE     L_5F5D                          ; 5F51   0206 000A

        CMPI    #$000E, R0                      ; 5F53   0378 000E
        BGE     L_5F5C                          ; 5F55   020D 0005

        CMPI    #$000A, R0                      ; 5F57   0378 000A
        BLT     L_5F5C                          ; 5F59   0205 0001

        INCR    R1                              ; 5F5B   0009
L_5F5C:
        INCR    R1                              ; 5F5C   0009
L_5F5D:
        MVO     R1,     G_032C                  ; 5F5D   0241 032C
        MVI     G_0179, R0                      ; 5F5F   0280 0179
        TSTR    R0                              ; 5F61   0080
        BNEQ    L_5FAA                          ; 5F62   020C 0046

        JSR     R5,     L_6E34                  ; 5F64   0004 016C 0234

        MVII    #$0008, R1                      ; 5F67   02B9 0008
        MVI     G_0323, R3                      ; 5F69   0283 0323
        SUBR    R3,     R1                      ; 5F6B   0119
        MOVR    R1,     R2                      ; 5F6C   008A
        SLL     R2,     1                       ; 5F6D   004A
        ADDR    R2,     R1                      ; 5F6E   00D1
        SLL     R1,     1                       ; 5F6F   0049
        ADD     G_0324, R1                      ; 5F70   02C1 0324
        ANDI    #$03FF, R1                      ; 5F72   03B9 03FF
        CMPI    #$001D, R1                      ; 5F74   0379 001D
        BLE     L_5F7A                          ; 5F76   0206 0002

        MVII    #$0093, R1                      ; 5F78   02B9 0093
L_5F7A:
        MVO     R1,     G_01AE                  ; 5F7A   0241 01AE
        INCR    R7                              ; 5F7C   000F
        PSHR    R5                              ; 5F7D   0275
        MVI     G_0179, R0                      ; 5F7E   0280 0179
        INCR    R0                              ; 5F80   0008
L_5F81:
        MVO     R0,     G_0179                  ; 5F81   0240 0179
        MVO     R0,     G_033A                  ; 5F83   0240 033A
        MVO     R0,     G_0342                  ; 5F85   0240 0342
        MOVR    R7,     R4                      ; 5F87   00BC
        ADDI    #$0069, R4                      ; 5F88   02FC 0069
        MVO     R0,     G_034A                  ; 5F8A   0240 034A
        SLL     R0,     1                       ; 5F8C   0048
        ADDR    R0,     R4                      ; 5F8D   00C4
        MVI@    R4,     R0                      ; 5F8E   02A0
        SWAP    R0,     1                       ; 5F8F   0040
        MVO     R0,     G_0338                  ; 5F90   0240 0338
        MVI@    R4,     R1                      ; 5F92   02A1
        SWAP    R1,     1                       ; 5F93   0041
        MVO     R1,     G_0337                  ; 5F94   0241 0337
        ANDI    #$000F, R1                      ; 5F96   03B9 000F
        ANDI    #$000F, R0                      ; 5F98   03B8 000F
        BEQ     L_5FA8                          ; 5F9A   0204 000C

        CLRR    R1                              ; 5F9C   01C9
        MVO     R1,     G_033A                  ; 5F9D   0241 033A
        CMPI    #$0001, R0                      ; 5F9F   0378 0001
        BEQ     L_5FAB                          ; 5FA1   0204 0008

        INCR    R0                              ; 5FA3   0008

        JSR     R5,     .EXEC.41C               ; 5FA4   0004 0114 001C

        CLRR    R1                              ; 5FA7   01C9
L_5FA8:
        MVO     R1,     G_033B                  ; 5FA8   0241 033B
L_5FAA:
        PULR    R7                              ; 5FAA   02B7
L_5FAB:
        MVI     G_01BF, R0                      ; 5FAB   0280 01BF
        TSTR    R0                              ; 5FAD   0080
        BNEQ    L_5FC2                          ; 5FAE   020C 0012

        MVI     G_01B0, R0                      ; 5FB0   0280 01B0
        TSTR    R0                              ; 5FB2   0080
        BEQ     L_5FAA                          ; 5FB3   0224 000A

        MVI     G_01BE, R0                      ; 5FB5   0280 01BE
        TSTR    R0                              ; 5FB7   0080
        BNEQ    L_5FBD                          ; 5FB8   020C 0003

        JSR     R5,     L_6E53                  ; 5FBA   0004 016C 0253

L_5FBD:
        MVI     G_01B0, R0                      ; 5FBD   0280 01B0
        SARC    R0,     1                       ; 5FBF   0078
        BNC     L_5FAA                          ; 5FC0   0229 0017

L_5FC2:
        CLRR    R0                              ; 5FC2   01C0
        MVO     R0,     G_0335                  ; 5FC3   0240 0335
        MVII    #$0206, R0                      ; 5FC5   02B8 0206
        MVO     R0,     G_0342                  ; 5FC7   0240 0342
        MVO     R0,     G_034A                  ; 5FC9   0240 034A
        MVII    #$0006, R0                      ; 5FCB   02B8 0006
        MVO     R0,     G_0343                  ; 5FCD   0240 0343
        INCR    R0                              ; 5FCF   0008
        MVO     R0,     G_012F                  ; 5FD0   0240 012F
        PULR    R7                              ; 5FD2   02B7
        PSHR    R5                              ; 5FD3   0275
        MVII    #$0009, R1                      ; 5FD4   02B9 0009
        MVI     G_01BF, R4                      ; 5FD6   0284 01BF
        TSTR    R4                              ; 5FD8   00A4
        BEQ     L_5FDD                          ; 5FD9   0204 0002

        MVII    #$0019, R1                      ; 5FDB   02B9 0019
L_5FDD:
        SDBD                                    ; 5FDD   0001
        MVII    #$5A7E, R4                      ; 5FDE   02BC 007E 005A
        MVO     R1,     G_0187                  ; 5FE1   0241 0187
        MVII    #$0188, R0                      ; 5FE3   02B8 0188

        JSR     R5,     L_59E6                  ; 5FE5   0004 0158 01E6

        DECR    R5                              ; 5FE8   0015
        MOVR    R5,     R4                      ; 5FE9   00AC
        MVI@    R5,     R0                      ; 5FEA   02A8
        SUBI    #$0005, R0                      ; 5FEB   0338 0005
        MVO@    R0,     R4                      ; 5FED   0260
        J       L_6C83                          ; 5FEE   0004 036C 0083
        BNEQ    L_5F58                          ; 5FF1   022C 009A

        ADCR    R1                              ; 5FF3   0029
        AND@    R3,     R4                      ; 5FF4   039C
        GSWD    R1                              ; 5FF5   0031
        MVI@    R1,     R2                      ; 5FF6   028A
        GSWD    R2                              ; 5FF7   0032
        ANDR    R1,     R0                      ; 5FF8   0188
        GSWD    R1                              ; 5FF9   0031
        ANDR    R0,     R7                      ; 5FFA   0187
        GSWD    R2                              ; 5FFB   0032
        MVI@    R2,     R7                      ; 5FFC   0297
        SUBR    R5,     R6                      ; 5FFD   012E
        TSTR    R3                              ; 5FFE   009B
        RLC     R0,     1                       ; 5FFF   0050
L_6000:
        PSHR    R5                              ; 6000   0275
        MOVR    R0,     R5                      ; 6001   0085
L_6002:
        SDBD                                    ; 6002   0001
        MVI@    R5,     R0                      ; 6003   02A8
        MVO@    R0,     R4                      ; 6004   0260
        SDBD                                    ; 6005   0001
        MVI@    R5,     R0                      ; 6006   02A8
        MVO@    R0,     R4                      ; 6007   0260
        SDBD                                    ; 6008   0001
        MVI@    R5,     R0                      ; 6009   02A8
        MVO@    R0,     R4                      ; 600A   0260
        SWAP    R0,     1                       ; 600B   0040
        MVO@    R0,     R4                      ; 600C   0260
        ADDI    #$0004, R4                      ; 600D   02FC 0004
        DECR    R1                              ; 600F   0011
        BNEQ    L_6002                          ; 6010   022C 000F

        PULR    R7                              ; 6012   02B7
        ADDR    R0,     R7                      ; 6013   00C7
        TSTR    R0                              ; 6014   0080
        RLC     R1,     2                       ; 6015   0055
        SLR     R0,     1                       ; 6016   0060
        RLC     R0,     2                       ; 6017   0054
        NEGR    R0                              ; 6018   0020
        RLC     R3,     1                       ; 6019   0053
        TSTR    R0                              ; 601A   0080
        SLLC    R3,     1                       ; 601B   005B
        SLR     R0,     1                       ; 601C   0060
        RLC     R0,     2                       ; 601D   0054
        NEGR    R0                              ; 601E   0020
        ADDR    R0,     R7                      ; 601F   00C7
        MOVR    R6,     R0                      ; 6020   00B0
        SLL     R1,     1                       ; 6021   0049
        SLR     R0,     1                       ; 6022   0060
        RLC     R1,     2                       ; 6023   0055
        COMR    R6                              ; 6024   001E
        ADDR    R0,     R7                      ; 6025   00C7
        MOVR    R6,     R0                      ; 6026   00B0
        SWAP    R3,     1                       ; 6027   0043
        SLR     R0,     1                       ; 6028   0060
        SWAP    R1,     2                       ; 6029   0045
        COMR    R6                              ; 602A   001E
        ADDR    R0,     R0                      ; 602B   00C0
        MOVR    R6,     R0                      ; 602C   00B0
        SLR     R1,     1                       ; 602D   0061
        SLR     R0,     1                       ; 602E   0060
        COMR    R7                              ; 602F   001F
        MOVR    R1,     R5                      ; 6030   008D
        ADDR    R0,     R0                      ; 6031   00C0
        MOVR    R6,     R0                      ; 6032   00B0
        SLR     R3,     2                       ; 6033   0067
        SLR     R0,     1                       ; 6034   0060
        ADCR    R6                              ; 6035   002E
        MOVR    R1,     R6                      ; 6036   008E
        ADDR    R0,     R7                      ; 6037   00C7
        MOVR    R6,     R2                      ; 6038   00B2
        SAR     R1,     2                       ; 6039   006D
        SLR     R0,     1                       ; 603A   0060
        ADCR    R1                              ; 603B   0029
        MOVR    R1,     R2                      ; 603C   008A
        SWAP    R0,     1                       ; 603D   0040
        TSTR    R0                              ; 603E   0080
        SAR     R1,     2                       ; 603F   006D
        SLR     R0,     1                       ; 6040   0060
        DECLE   $0000                           ; 6041   0000
L_6042:
        DECLE   $0000,  $0000,  $0000           ; 6042   0000 0000 0000

        MOVR    R1,     R2                      ; 6045   008A
        SLLC    R2,     1                       ; 6046   005A
        INCR    R6                              ; 6047   000E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6048   0000 0000 0000 0000
        DECLE   $0000                           ; 604C   0000

        INCR    R6                              ; 604D   000E
        ADCR    R1                              ; 604E   0029
        DECLE   $0000,  $0000                   ; 604F   0000 0000

        SARC    R1,     2                       ; 6051   007D
        SLLC    R3,     2                       ; 6052   005F
        CLRC                                    ; 6053   0006
        COMR    R5                              ; 6054   001D
        DECLE   $0000,  $0000                   ; 6055   0000 0000

        SLLC    R0,     1                       ; 6057   0058
        SLLC    R0,     2                       ; 6058   005C
        DECLE   $0001                           ; 6059   0001

        COMR    R3                              ; 605A   001B
        DECLE   $0000,  $0000                   ; 605B   0000 0000

        COMR    R3                              ; 605D   001B
        SLLC    R3,     1                       ; 605E   005B
        DECLE   $0001                           ; 605F   0001

        COMR    R3                              ; 6060   001B
        DECLE   $0000,  $0000                   ; 6061   0000 0000

        ADDR    R2,     R3                      ; 6063   00D3
        SLLC    R3,     2                       ; 6064   005F
        INCR    R7                              ; 6065   000F
        RLC     R1,     1                       ; 6066   0051
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6067   0000 0000 0000 0000

        INCR    R7                              ; 606B   000F
        SLR     R1,     2                       ; 606C   0065
        DECLE   $0000,  $0000                   ; 606D   0000 0000

        ADDR    R4,     R0                      ; 606F   00E0
        ADDR    R5,     R2                      ; 6070   00EA
L_6071:
        EIS                                     ; 6071   0002
        SWAP    R1,     2                       ; 6072   0045
        INCR    R4                              ; 6073   000C
        ADD@    R4,     R4                      ; 6074   02E4
        SLR     R0,     2                       ; 6075   0064
        ADD@    R4,     R4                      ; 6076   02E4
        CMPR    R4,     R4                      ; 6077   0164
        CLRR    R4                              ; 6078   01E4
        SLR     R0,     2                       ; 6079   0064
        CLRR    R4                              ; 607A   01E4
        CMPR    R4,     R4                      ; 607B   0164
        XOR@    R4,     R4                      ; 607C   03E4
        SLR     R0,     2                       ; 607D   0064
        XOR@    R4,     R4                      ; 607E   03E4
        CMPR    R4,     R4                      ; 607F   0164
        DECLE   $0000,  $0000                   ; 6080   0000 0000

        ADDR    R3,     R3                      ; 6082   00DB
        ADDR    R4,     R5                      ; 6083   00E5

        JSRE    R4,     G_780C                  ; 6084   0004 0079 000C

        ADD@    R4,     R4                      ; 6087   02E4
        SLR     R0,     2                       ; 6088   0064
        ADD@    R4,     R4                      ; 6089   02E4
        CMPR    R4,     R4                      ; 608A   0164
        CLRR    R4                              ; 608B   01E4
        SLR     R0,     2                       ; 608C   0064
        CLRR    R4                              ; 608D   01E4
        CMPR    R4,     R4                      ; 608E   0164
        XOR@    R4,     R4                      ; 608F   03E4
        SLR     R0,     2                       ; 6090   0064
        XOR@    R4,     R4                      ; 6091   03E4
        CMPR    R4,     R4                      ; 6092   0164
        DECLE   $0000,  $0000                   ; 6093   0000 0000

        ADDR    R3,     R2                      ; 6095   00DA
        SLR     R1,     2                       ; 6096   0065
        SETC                                    ; 6097   0007
        SARC    R1,     1                       ; 6098   0079
        INCR    R4                              ; 6099   000C
        ADD@    R4,     R4                      ; 609A   02E4
        SLR     R0,     2                       ; 609B   0064
        ADD@    R4,     R4                      ; 609C   02E4
        CMPR    R4,     R4                      ; 609D   0164
        CLRR    R4                              ; 609E   01E4
        SLR     R0,     2                       ; 609F   0064
        CLRR    R4                              ; 60A0   01E4
        CMPR    R4,     R4                      ; 60A1   0164
        XOR@    R4,     R4                      ; 60A2   03E4
        SLR     R0,     2                       ; 60A3   0064
        XOR@    R4,     R4                      ; 60A4   03E4
        CMPR    R4,     R4                      ; 60A5   0164
        DECLE   $0000,  $0000                   ; 60A6   0000 0000

        ADDR    R1,     R4                      ; 60A8   00CC
        SLR     R1,     2                       ; 60A9   0065
        DIS                                     ; 60AA   0003
        MOVR    R7,     R1                      ; 60AB   00B9
        DECLE   $0000,  $0000                   ; 60AC   0000 0000

        ADDR    R3,     R3                      ; 60AE   00DB
        ADDR    R4,     R5                      ; 60AF   00E5

        JSRE    R4,     G_480C                  ; 60B0   0004 0049 000C

        ADD@    R4,     R4                      ; 60B3   02E4
        SLR     R0,     2                       ; 60B4   0064
        ADD@    R4,     R4                      ; 60B5   02E4
        CMPR    R4,     R4                      ; 60B6   0164
        CLRR    R4                              ; 60B7   01E4
        SLR     R0,     2                       ; 60B8   0064
        CLRR    R4                              ; 60B9   01E4
        CMPR    R4,     R4                      ; 60BA   0164
        XOR@    R4,     R4                      ; 60BB   03E4
        SLR     R0,     2                       ; 60BC   0064
        XOR@    R4,     R4                      ; 60BD   03E4
        CMPR    R4,     R4                      ; 60BE   0164
        DECLE   $0000,  $0000                   ; 60BF   0000 0000

        ADDR    R1,     R4                      ; 60C1   00CC
        SLR     R1,     2                       ; 60C2   0065
        DIS                                     ; 60C3   0003
        MOVR    R6,     R3                      ; 60C4   00B3
        DECLE   $0000,  $0000,  $0000           ; 60C5   0000 0000 0000

        ADDR    R4,     R0                      ; 60C8   00E0
        ADDR    R5,     R2                      ; 60C9   00EA
        DECLE   $0005                           ; 60CA   0005

        MOVR    R5,     R1                      ; 60CB   00A9
        DECLE   $0000,  $0000,  $0000           ; 60CC   0000 0000 0000

        ADDR    R3,     R0                      ; 60CF   00D8
        SLR     R2,     1                       ; 60D0   0062
        CLRC                                    ; 60D1   0006
        MOVR    R2,     R7                      ; 60D2   0097
        DECLE   $0000,  $0000,  $0000           ; 60D3   0000 0000 0000

        ADDR    R3,     R0                      ; 60D6   00D8
        SLR     R2,     1                       ; 60D7   0062
        CLRC                                    ; 60D8   0006
        MOVR    R3,     R5                      ; 60D9   009D
        DECLE   $0000,  $0000,  $0000           ; 60DA   0000 0000 0000

        ADDR    R3,     R0                      ; 60DD   00D8
        SLR     R2,     1                       ; 60DE   0062
        SETC                                    ; 60DF   0007
        TSTR    R1                              ; 60E0   0089
        DECLE   $0000                           ; 60E1   0000

        SLL     R0,     1                       ; 60E2   0048
        MOVR    R2,     R0                      ; 60E3   0090
        DECR    R2                              ; 60E4   0012
        SLR     R1,     1                       ; 60E5   0061
        ADCR    R5                              ; 60E6   002D
        RLC     R2,     2                       ; 60E7   0056
        SWAP    R3,     1                       ; 60E8   0043
        MOVR    R2,     R0                      ; 60E9   0090
        COMR    R1                              ; 60EA   0019
        SLR     R1,     1                       ; 60EB   0061
        GSWD    R1                              ; 60EC   0031
        RLC     R0,     2                       ; 60ED   0054
        SWAP    R3,     1                       ; 60EE   0043
        MOVR    R2,     R0                      ; 60EF   0090
        NEGR    R0                              ; 60F0   0020
        SLR     R1,     1                       ; 60F1   0061
        GSWD    R1                              ; 60F2   0031
        RLC     R0,     1                       ; 60F3   0050
        SWAP    R3,     1                       ; 60F4   0043
        MOVR    R2,     R0                      ; 60F5   0090
        NEGR    R7                              ; 60F6   0027
        SLR     R1,     1                       ; 60F7   0061
        DECLE   $0036                           ; 60F8   0036

        SLL     R3,     1                       ; 60F9   004B
        SWAP    R3,     1                       ; 60FA   0043
        MOVR    R2,     R0                      ; 60FB   0090
        ADCR    R6                              ; 60FC   002E
        SLR     R1,     1                       ; 60FD   0061
        RSWD    R1                              ; 60FE   0039
        RLC     R3,     1                       ; 60FF   0053
        SLL     R0,     1                       ; 6100   0048
        MOVR    R2,     R0                      ; 6101   0090
        DECLE   $0035                           ; 6102   0035

        SLR     R1,     1                       ; 6103   0061
        DECLE   $0037                           ; 6104   0037

        SLL     R1,     2                       ; 6105   004D
        SLL     R0,     1                       ; 6106   0048
        MOVR    R2,     R0                      ; 6107   0090
        RSWD    R4                              ; 6108   003C
        SLR     R1,     1                       ; 6109   0061
        DECLE   $0037                           ; 610A   0037

        RLC     R1,     2                       ; 610B   0055
        ADDR    R0,     R7                      ; 610C   00C7
        MOVR    R6,     R0                      ; 610D   00B0
        SWAP    R3,     1                       ; 610E   0043
        SLR     R1,     1                       ; 610F   0061
        RSWD    R0                              ; 6110   0038
        RLC     R0,     1                       ; 6111   0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6112   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6116   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 611A   0000 0000 0000 0001

        EIS                                     ; 611E   0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 611F   0000 0000 0000 0000
        DECLE   $0000                           ; 6123   0000

        DIS                                     ; 6124   0003

        JSR     R4,     .STIC.X.0               ; 6125   0004 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6128   0000 0000 0000

        DIS                                     ; 612B   0003
        INCR    R2                              ; 612C   000A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 612D   0000 0000 0000 0000
        DECLE   $0000                           ; 6131   0000

        DIS                                     ; 6132   0003
        DECR    R0                              ; 6133   0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6134   0000 0000 0000 0000
        DECLE   $0000                           ; 6138   0000

        DIS                                     ; 6139   0003
        DECR    R6                              ; 613A   0016
        DECLE   $0000,  $0000,  $0000,  $0000   ; 613B   0000 0000 0000 0000
        DECLE   $0000                           ; 613F   0000

        DIS                                     ; 6140   0003
        COMR    R4                              ; 6141   001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6142   0000 0000 0000 0000
        DECLE   $0000                           ; 6146   0000

        DIS                                     ; 6147   0003
        NEGR    R2                              ; 6148   0022
        DECLE   $0000                           ; 6149   0000

        SLL     R0,     1                       ; 614A   0048
        MOVR    R2,     R0                      ; 614B   0090
        MOVR    R0,     R1                      ; 614C   0081
        SLR     R1,     1                       ; 614D   0061
        GSWD    R1                              ; 614E   0031
        SLL     R0,     2                       ; 614F   004C
        SWAP    R3,     1                       ; 6150   0043
        MOVR    R2,     R0                      ; 6151   0090
        MOVR    R1,     R0                      ; 6152   0088
        SLR     R1,     1                       ; 6153   0061
        GSWD    R2                              ; 6154   0032
        SLL     R2,     1                       ; 6155   004A
        SLL     R0,     1                       ; 6156   0048
        MOVR    R2,     R0                      ; 6157   0090
        SARC    R2,     1                       ; 6158   007A
        SLR     R1,     1                       ; 6159   0061
        RSWD    R1                              ; 615A   0039
        SLL     R3,     1                       ; 615B   004B
        ADDR    R0,     R7                      ; 615C   00C7
        MOVR    R6,     R0                      ; 615D   00B0
        MOVR    R1,     R7                      ; 615E   008F
        SLR     R1,     1                       ; 615F   0061
        RSWD    R0                              ; 6160   0038
        SWAP    R1,     2                       ; 6161   0045
        SWAP    R3,     1                       ; 6162   0043
        MOVR    R2,     R0                      ; 6163   0090
        ADDR    R7,     R0                      ; 6164   00F8
        ADDR    R5,     R7                      ; 6165   00EF
        DECLE   $0037                           ; 6166   0037

        SLLC    R1,     1                       ; 6167   0059
        SLL     R0,     1                       ; 6168   0048
        MOVR    R2,     R0                      ; 6169   0090
        ADDR    R4,     R6                      ; 616A   00E6
        ADDR    R7,     R7                      ; 616B   00FF
        ADCR    R6                              ; 616C   002E
        SLLC    R2,     1                       ; 616D   005A
        SWAP    R3,     1                       ; 616E   0043
        MOVR    R2,     R0                      ; 616F   0090
        ADDR    R5,     R5                      ; 6170   00ED
        ADDR    R7,     R7                      ; 6171   00FF
        GSWD    R2                              ; 6172   0032
        SLLC    R2,     1                       ; 6173   005A
        ADDR    R0,     R7                      ; 6174   00C7
        MOVR    R6,     R0                      ; 6175   00B0
        ADDR    R6,     R4                      ; 6176   00F4
        ADDR    R7,     R7                      ; 6177   00FF
        RSWD    R0                              ; 6178   0038
        RLC     R0,     2                       ; 6179   0054
        DECLE   $0000,  $0000,  $0000,  $0000   ; 617A   0000 0000 0000 0000
        DECLE   $0001                           ; 617E   0001

        ADCR    R0                              ; 617F   0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6180   0000 0000 0000 0000
        DECLE   $0000,  $0001                   ; 6184   0000 0001

        ADCR    R2                              ; 6186   002A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6187   0000 0000 0000 0000
        DECLE   $0000,  $0001                   ; 618B   0000 0001

        ADCR    R4                              ; 618D   002C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 618E   0000 0000 0000 0000
        DECLE   $0000                           ; 6192   0000

        EIS                                     ; 6193   0002
        ADCR    R6                              ; 6194   002E
        DECLE   $0000                           ; 6195   0000

        PSHR    R5                              ; 6196   0275
L_6197:
        XOR     G_0133, R1                      ; 6197   03C1 0133
        BEQ     L_61A8                          ; 6199   0204 000D

        MVI     G_01B0, R3                      ; 619B   0283 01B0
        SARC    R3,     1                       ; 619D   007B
        BEQ     L_61A2                          ; 619E   0204 0002
        BNC     L_61A8                          ; 61A0   0209 0006

L_61A2:
        CMPI    #$000A, R0                      ; 61A2   0378 000A
L_61A4:
        BLT     L_61A9                          ; 61A4   0205 0003
        BGT     L_6319                          ; 61A6   020E 0171

L_61A8:
        PULR    R7                              ; 61A8   02B7
L_61A9:
        MVI     G_035D, R4                      ; 61A9   0284 035D
        CMP     G_034C, R4                      ; 61AB   0344 034C
        BNC     L_6318                          ; 61AD   0209 0169

        MOVR    R0,     R4                      ; 61AF   0084
        SLL     R0,     1                       ; 61B0   0048
        ADDR    R0,     R4                      ; 61B1   00C4
        ADDR    R7,     R4                      ; 61B2   00FC
        ADDI    #$01B6, R4                      ; 61B3   02FC 01B6
        MVI     G_0181, R0                      ; 61B5   0280 0181
        ANDI    #$000F, R0                      ; 61B7   03B8 000F
        MVI@    R4,     R1                      ; 61B9   02A1
        MOVR    R1,     R2                      ; 61BA   008A
        SAR     R2,     2                       ; 61BB   006E
        SAR     R2,     2                       ; 61BC   006E
        ANDI    #$000F, R1                      ; 61BD   03B9 000F
        MVO     R1,     G_01C1                  ; 61BF   0241 01C1
        PSHR    R0                              ; 61C1   0270
        PSHR    R4                              ; 61C2   0274
        MOVR    R0,     R3                      ; 61C3   0083
        SLL     R3,     2                       ; 61C4   004F
        SLL     R3,     1                       ; 61C5   004B
        ADD     G_0351, R3                      ; 61C6   02C3 0351
        MVI@    R3,     R5                      ; 61C8   029D
        MVI@    R4,     R3                      ; 61C9   02A3
        CMPI    #$0039, R3                      ; 61CA   037B 0039
        BNEQ    L_61D8                          ; 61CC   020C 000A

        CMPI    #$0049, R5                      ; 61CE   037D 0049
        BLT     L_61D8                          ; 61D0   0205 0006

        MVII    #$0001, R5                      ; 61D2   02BD 0001
        XORR    R1,     R2                      ; 61D4   01CA
        XORR    R2,     R1                      ; 61D5   01D1
        XORR    R1,     R2                      ; 61D6   01CA
        INCR    R7                              ; 61D7   000F
L_61D8:
        CLRR    R5                              ; 61D8   01ED
        CMPR    R1,     R0                      ; 61D9   0148
        BNEQ    L_61DF                          ; 61DA   020C 0003

        MOVR    R2,     R1                      ; 61DC   0091
        XORI    #$0001, R5                      ; 61DD   03FD 0001
L_61DF:
        MVO     R5,     G_0334                  ; 61DF   0245 0334
        MVO     R1,     G_0324                  ; 61E1   0241 0324
        MVI@    R4,     R2                      ; 61E3   02A2
        MVII    #$0018, R4                      ; 61E4   02BC 0018

        JSR     R5,     G_E083                  ; 61E6   0004 01E0 0083

        MOVR    R2,     R0                      ; 61E9   0090
        SUBI    #$0010, R0                      ; 61EA   0338 0010
        PULR    R4                              ; 61EC   02B4
        PULR    R1                              ; 61ED   02B1
        PSHR    R4                              ; 61EE   0274
        MVI@    R4,     R3                      ; 61EF   02A3
        MVI@    R4,     R2                      ; 61F0   02A2
        MVII    #$0064, R4                      ; 61F1   02BC 0064
        MVO     R4,     G_0135                  ; 61F3   0244 0135

        JSR     R5,     G_E080                  ; 61F5   0004 01E0 0080

        PULR    R4                              ; 61F8   02B4
        PSHR    R4                              ; 61F9   0274
        CMPR    R2,     R0                      ; 61FA   0150
        MVI@    R4,     R3                      ; 61FB   02A3
        MVI@    R4,     R2                      ; 61FC   02A2
        MVII    #$0064, R4                      ; 61FD   02BC 0064
        BLE     L_6211                          ; 61FF   0206 0010

        MVII    #$0050, R4                      ; 6201   02BC 0050

        JSR     R5,     G_E080                  ; 6203   0004 01E0 0080

        CMPR    R2,     R0                      ; 6206   0150
        PULR    R4                              ; 6207   02B4
L_6208:
        PSHR    R4                              ; 6208   0274
        MVI@    R4,     R3                      ; 6209   02A3
        MVI@    R4,     R2                      ; 620A   02A2
        MVII    #$0050, R4                      ; 620B   02BC 0050
        BLE     L_6211                          ; 620D   0206 0002

        MVII    #$0032, R4                      ; 620F   02BC 0032
L_6211:
        MVO     R4,     G_01C0                  ; 6211   0244 01C0

        JSR     R5,     G_E083                  ; 6213   0004 01E0 0083

        MOVR    R0,     R5                      ; 6216   0085
        ADDI    #$0011, R0                      ; 6217   02F8 0011
        MVO     R0,     G_0197                  ; 6219   0240 0197
        MVI     G_035C, R0                      ; 621B   0280 035C
        ANDI    #$001E, R0                      ; 621D   03B8 001E
        MVO     R0,     G_035C                  ; 621F   0240 035C
        MVI     G_0324, R1                      ; 6221   0281 0324
        MVO     R1,     G_0196                  ; 6223   0241 0196
        ADDI    #$0199, R1                      ; 6225   02F9 0199
        MVI@    R1,     R0                      ; 6227   0288
        MVO     R0,     G_0198                  ; 6228   0240 0198
        CMPR    R2,     R5                      ; 622A   0155
        BGT     L_6231                          ; 622B   020E 0004

L_622D:
        CMPI    #$0003, R2                      ; 622D   037A 0003
        BGT     L_623A                          ; 622F   020E 0009

L_6231:
        PULR    R0                              ; 6231   02B0
        MVI     G_0324, R0                      ; 6232   0280 0324
        CLRR    R3                              ; 6234   01DB
        MVO     R3,     G_01C0                  ; 6235   0243 01C0
        J       L_6D4F                          ; 6237   0004 036C 014F

L_623A:
        MVI     G_0334, R5                      ; 623A   0285 0334
        MVO     R5,     G_01B2                  ; 623C   0245 01B2
        CLRR    R5                              ; 623E   01ED
        MVO     R5,     G_0194                  ; 623F   0245 0194
        SUBI    #$0002, R4                      ; 6241   033C 0002
        SDBD                                    ; 6243   0001
        MVII    #$4168, R1                      ; 6244   02B9 0068 0041
        MVII    #$0008, R0                      ; 6247   02B8 0008

        JSR     R5,     .EXEC.730               ; 6249   0004 0114 0330

        ADDI    #$0006, R2                      ; 624C   02FA 0006
        MVO     R2,     G_0323                  ; 624E   0242 0323
        MVO     R2,     G_01B8                  ; 6250   0242 01B8
        SUBI    #$0006, R2                      ; 6252   033A 0006
        MVII    #$002F, R1                      ; 6254   02B9 002F
        MVO     R1,     G_0173                  ; 6256   0241 0173
        SAR     R2,     2                       ; 6258   006E
        INCR    R5                              ; 6259   000D
        MVII    #$001E, R0                      ; 625A   02B8 001E
        MVO@    R0,     R5                      ; 625C   0268
        MVO@    R2,     R5                      ; 625D   026A
        SDBD                                    ; 625E   0001
        MVII    #$5044, R0                      ; 625F   02B8 0044 0050
        MVO     R0,     G_035D                  ; 6262   0240 035D
        SDBD                                    ; 6264   0001
        MVII    #$60DB, R1                      ; 6265   02B9 00DB 0060
        CLRR    R2                              ; 6268   01D2
        MVO     R2,     G_0325                  ; 6269   0242 0325
        MVII    #$0200, R3                      ; 626B   02BB 0200
        SUBI    #$0008, R4                      ; 626D   033C 0008
        MVI@    R4,     R0                      ; 626F   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 6270   0004 0114 0268

        XORR    R0,     R1                      ; 6273   01C1
        XORR    R1,     R0                      ; 6274   01C8
        XORR    R0,     R1                      ; 6275   01C1
        BPL     L_627A                          ; 6276   0203 0002

        NEGR    R1                              ; 6278   0021
        CLRR    R3                              ; 6279   01DB
L_627A:
        MVI     G_01C4, R5                      ; 627A   0285 01C4
        SLL     R1,     1                       ; 627C   0049
        CMP     G_0331, R1                      ; 627D   0341 0331
        BLT     L_6290                          ; 627F   0205 000F

        INCR    R4                              ; 6281   000C
        TSTR    R5                              ; 6282   00AD
        BNEQ    L_62A7                          ; 6283   020C 0022

        XORI    #$0200, R3                      ; 6285   03FB 0200
        BEQ     L_62A7                          ; 6287   0204 001E

        SDBD                                    ; 6289   0001
        SUBI    #$0007, R0                      ; 628A   0338 0007 0000
        CLRR    R3                              ; 628D   01DB
        B       L_62A7                          ; 628E   0200 0017

L_6290:
        SDBD                                    ; 6290   0001
        SUBI    #$0007, R0                      ; 6291   0338 0007 0000
        MVI@    R4,     R1                      ; 6294   02A1
        CMPI    #$0080, R1                      ; 6295   0379 0080
        BGE     L_62A4                          ; 6297   020D 000B

        TSTR    R5                              ; 6299   00AD
        BEQ     L_62A7                          ; 629A   0204 000B

L_629C:
        MVII    #$0003, R2                      ; 629C   02BA 0003
        SDBD                                    ; 629E   0001
        SUBI    #$0007, R0                      ; 629F   0338 0007 0000
        B       L_62A7                          ; 62A2   0200 0003

L_62A4:
        TSTR    R5                              ; 62A4   00AD
        BEQ     L_629C                          ; 62A5   0224 000A

L_62A7:
        MVI     G_0181, R1                      ; 62A7   0281 0181
        ANDI    #$00F0, R1                      ; 62A9   03B9 00F0
        SAR     R1,     1                       ; 62AB   0069
        ADDI    #$032D, R1                      ; 62AC   02F9 032D
        MVI@    R1,     R5                      ; 62AE   028D
        SDBD                                    ; 62AF   0001
        ANDI    #$FDFF, R5                      ; 62B0   03BD 00FF 00FD
        XORR    R3,     R5                      ; 62B3   01DD
        MVO@    R5,     R1                      ; 62B4   024D
        INCR    R1                              ; 62B5   0009
        MVO@    R0,     R1                      ; 62B6   0248
        ADDI    #$0004, R1                      ; 62B7   02F9 0004
        XORI    #$0220, R2                      ; 62B9   03FA 0220
        MVO@    R2,     R1                      ; 62BB   024A
        INCR    R1                              ; 62BC   0009
        MVII    #$000D, R2                      ; 62BD   02BA 000D
        MVO@    R2,     R1                      ; 62BF   024A
        MVI     G_0324, R0                      ; 62C0   0280 0324
        CLRR    R3                              ; 62C2   01DB

        JSR     R5,     L_6D4E                  ; 62C3   0004 016C 014E

        SDBD                                    ; 62C6   0001
        MVII    #$6055, R2                      ; 62C7   02BA 0055 0060
        MVO     R2,     G_031E                  ; 62CA   0242 031E
        SDBD                                    ; 62CC   0001
        ADDI    #$0006, R2                      ; 62CD   02FA 0006 0000
        MVO     R2,     G_0326                  ; 62D0   0242 0326
        PULR    R5                              ; 62D2   02B5
        MVI@    R5,     R1                      ; 62D3   02A9
        MVI@    R5,     R2                      ; 62D4   02AA
        J       L_6A6F                          ; 62D5   0004 0368 026F

        PSHR    R5                              ; 62D8   0275
        MVI     G_035C, R0                      ; 62D9   0280 035C
        SARC    R0,     1                       ; 62DB   0078
        SETC                                    ; 62DC   0007
        RLC     R0,     1                       ; 62DD   0050
        MVO     R0,     G_035C                  ; 62DE   0240 035C
        MVI     G_0349, R2                      ; 62E0   0282 0349
        MVO     R2,     G_035D                  ; 62E2   0242 035D
        MVII    #$001D, R2                      ; 62E4   02BA 001D
        MVO     R2,     G_0180                  ; 62E6   0242 0180
        CLRR    R0                              ; 62E8   01C0
        DECR    R0                              ; 62E9   0010
        MVO     R0,     G_0181                  ; 62EA   0240 0181
        MVII    #$0006, R0                      ; 62EC   02B8 0006
        MVO     R0,     G_032B                  ; 62EE   0240 032B

        JSR     R5,     L_6E34                  ; 62F0   0004 016C 0234

        MVII    #$0040, R0                      ; 62F3   02B8 0040
        MVO     R0,     G_0325                  ; 62F5   0240 0325
        MVO     R0,     G_031D                  ; 62F7   0240 031D
        MVI     G_01C1, R0                      ; 62F9   0280 01C1
        DECR    R0                              ; 62FB   0010
        BMI     L_630D                          ; 62FC   020B 000F

        CMPI    #$0004, R0                      ; 62FE   0378 0004
        BGE     L_630D                          ; 6300   020D 000B

        MVO     R0,     G_01DA                  ; 6302   0240 01DA

        JSR     R5,     L_587C                  ; 6304   0004 0158 007C

        MVII    #$0002, R0                      ; 6307   02B8 0002

        JSR     R5,     X_CLR_BIT               ; 6309   0004 0114 02E6

        XORR    R2,     R3                      ; 630C   01D3
L_630D:
        MVII    #$0001, R0                      ; 630D   02B8 0001

        JSR     R5,     .EXEC.41C               ; 630F   0004 0114 001C

        MVII    #$0006, R0                      ; 6312   02B8 0006

        JSR     R5,     X_CLR_BIT               ; 6314   0004 0114 02E6

        CMPR    R5,     R5                      ; 6317   016D
L_6318:
        PULR    R7                              ; 6318   02B7
L_6319:
        MVI     G_035C, R4                      ; 6319   0284 035C
        TSTR    R4                              ; 631B   00A4
        BNEQ    L_6351                          ; 631C   020C 0033

        MVI     G_0181, R1                      ; 631E   0281 0181
        ANDI    #$000F, R1                      ; 6320   03B9 000F
        BEQ     L_6358                          ; 6322   0204 0034

        DECR    R1                              ; 6324   0011
        BEQ     L_6351                          ; 6325   0204 002A

        CMPI    #$0008, R1                      ; 6327   0379 0008
        BGE     L_6351                          ; 6329   020D 0026

        MOVR    R1,     R2                      ; 632B   008A
        INCR    R1                              ; 632C   0009
        ADDR    R7,     R2                      ; 632D   00FA
        ADDI    #$0058, R2                      ; 632E   02FA 0058
        MVI@    R2,     R2                      ; 6330   0292
        SLL     R1,     1                       ; 6331   0049
        MOVR    R1,     R4                      ; 6332   008C
        SLL     R1,     2                       ; 6333   004D
        ADD     G_0354, R1                      ; 6334   02C1 0354
        SDBD                                    ; 6336   0001
        ADDI    #$4353, R4                      ; 6337   02FC 0053 0043
        MVI@    R1,     R0                      ; 633A   0288
        ADDI    #$0002, R1                      ; 633B   02F9 0002
        MVI@    R1,     R3                      ; 633D   028B
        SARC    R2,     2                       ; 633E   007E
        BC      L_6346                          ; 633F   0201 0005

        CMPR    R2,     R3                      ; 6341   0153
L_6342:
        BGE     L_6352                          ; 6342   020D 000E
        B       L_634E                          ; 6344   0200 0008
L_6346:
        BOV     L_634B                          ; 6346   0202 0003

        CMPR    R2,     R0                      ; 6348   0150
        B       L_6342                          ; 6349   0220 0008

L_634B:
        CMPR    R2,     R0                      ; 634B   0150
        BLT     L_6352                          ; 634C   0205 0004

L_634E:
        JSR     R5,     G_E44A                  ; 634E   0004 01E4 004A

L_6351:
        PULR    R7                              ; 6351   02B7
L_6352:
        MVO@    R0,     R4                      ; 6352   0260
        MVO@    R3,     R4                      ; 6353   0263

        JSR     R5,     G_E460                  ; 6354   0004 01E4 0060

        PULR    R7                              ; 6357   02B7
L_6358:
        MVI     G_033C, R4                      ; 6358   0284 033C
        MVI@    R4,     R1                      ; 635A   02A1
        CMPI    #$00FA, R1                      ; 635B   0379 00FA
        BEQ     L_6362                          ; 635D   0204 0003
        J       L_515E                          ; 635F   0004 0350 015E

L_6362:
        MVII    #$0009, R0                      ; 6362   02B8 0009
        MVO     R0,     G_016E                  ; 6364   0240 016E

        JSR     R5,     L_5069                  ; 6366   0004 0150 0069
        DECLE   $0001                           ; 6369   0001

        INCR    R7                              ; 636A   000F
        SLL     R1,     1                       ; 636B   0049
        RRC     R2,     2                       ; 636C   0076
        RLC     R0,     1                       ; 636D   0050
        NEGR    R3                              ; 636E   0023
        SLR     R3,     2                       ; 636F   0067
        SAR     R1,     1                       ; 6370   0069
        SLL     R1,     1                       ; 6371   0049
        SARC    R0,     1                       ; 6372   0078
        RLC     R0,     1                       ; 6373   0050
        SAR     R2,     2                       ; 6374   006E
        SWAP    R1,     2                       ; 6375   0045
        DECLE   $0035                           ; 6376   0035

        RSWD    R7                              ; 6377   003F
        RLC     R3,     1                       ; 6378   0053
        RSWD    R1                              ; 6379   0039
        SLL     R1,     1                       ; 637A   0049
        NEGR    R3                              ; 637B   0023
        DECLE   $0037                           ; 637C   0037

        RLC     R1,     2                       ; 637D   0055
        RLC     R0,     2                       ; 637E   0054
        NEGR    R4                              ; 637F   0024
        NOP                                     ; 6380   0034
        RLC     R0,     1                       ; 6381   0050
        NEGR    R3                              ; 6382   0023
        SLL     R1,     1                       ; 6383   0049
        EIS                                     ; 6384   0002
        NEGR    R4                              ; 6385   0024
        SLLC    R2,     2                       ; 6386   005E
        CMPR    R1,     R5                      ; 6387   014D
        MOVR    R1,     R4                      ; 6388   008C
        ADDR    R6,     R7                      ; 6389   00F7
        MOVR    R1,     R4                      ; 638A   008C
        SUBR    R3,     R0                      ; 638B   0118
        SUBR    R3,     R0                      ; 638C   0118
        SUBR    R3,     R0                      ; 638D   0118
L_638E:
        PSHR    R5                              ; 638E   0275
        XOR     G_0133, R1                      ; 638F   03C1 0133
        BEQ     L_63FF                          ; 6391   0204 006C

        MVI     G_035D, R4                      ; 6393   0284 035D
        SUB     G_0349, R4                      ; 6395   0304 0349
        BMI     L_63F5                          ; 6397   020B 005C

        CMPI    #$000A, R4                      ; 6399   037C 000A
        BEQ     L_63F5                          ; 639B   0204 0058

        MVI     G_01B3, R2                      ; 639D   0282 01B3
        MVO     R2,     G_0334                  ; 639F   0242 0334
        MOVR    R0,     R1                      ; 63A1   0081
        BMI     L_63F1                          ; 63A2   020B 004D

        ANDI    #$000F, R2                      ; 63A4   03BA 000F
        MOVR    R2,     R3                      ; 63A6   0093
        ADDI    #$0199, R2                      ; 63A7   02FA 0199
        MVI@    R2,     R0                      ; 63A9   0290
        PSHR    R0                              ; 63AA   0270
        MVI     G_01C4, R2                      ; 63AB   0282 01C4
        TSTR    R2                              ; 63AD   0092
        BNEQ    L_63B2                          ; 63AE   020C 0002

        ADDI    #$000A, R1                      ; 63B0   02F9 000A
L_63B2:
        SAR     R0,     1                       ; 63B2   0068

        JSR     R5,     .EXEC.629               ; 63B3   0004 0114 0229

        MOVR    R0,     R1                      ; 63B6   0081
        PULR    R5                              ; 63B7   02B5
        SWAP    R0,     1                       ; 63B8   0040
        NEGR    R1                              ; 63B9   0021
        PSHR    R3                              ; 63BA   0273
        SLL     R3,     2                       ; 63BB   004F
        SLL     R3,     1                       ; 63BC   004B
        ADD     G_0351, R3                      ; 63BD   02C3 0351
        MVO@    R0,     R3                      ; 63BF   0258
        INCR    R3                              ; 63C0   000B
        MVO@    R1,     R3                      ; 63C1   0259
        PULR    R0                              ; 63C2   02B0
        MVO     R0,     G_0196                  ; 63C3   0240 0196
        MVO     R5,     G_0198                  ; 63C5   0245 0198

        JSR     R5,     L_6D40                  ; 63C7   0004 016C 0140

        BNEQ    L_63D2                          ; 63CA   020C 0006

        CLRR    R3                              ; 63CC   01DB

        JSR     R5,     L_6D4E                  ; 63CD   0004 016C 014E

        B       L_63ED                          ; 63D0   0200 001B

L_63D2:
        MVI     G_0334, R1                      ; 63D2   0281 0334
        ANDI    #$00F0, R1                      ; 63D4   03B9 00F0
        SAR     R1,     1                       ; 63D6   0069
        ADDI    #$0332, R1                      ; 63D7   02F9 0332
        MVI@    R1,     R2                      ; 63D9   028A
        PSHR    R2                              ; 63DA   0272
        SUBI    #$0004, R1                      ; 63DB   0339 0004
        MVI@    R1,     R2                      ; 63DD   028A
        PSHR    R2                              ; 63DE   0272
        PSHR    R1                              ; 63DF   0271
        CLRR    R3                              ; 63E0   01DB

        JSR     R5,     L_6D4E                  ; 63E1   0004 016C 014E

        PULR    R1                              ; 63E4   02B1
        PULR    R2                              ; 63E5   02B2
        PULR    R3                              ; 63E6   02B3
        CMP@    R1,     R2                      ; 63E7   034A
        BNEQ    L_63ED                          ; 63E8   020C 0003

        ADDI    #$0004, R1                      ; 63EA   02F9 0004
        MVO@    R3,     R1                      ; 63EC   024B
L_63ED:
        MVII    #$0082, R1                      ; 63ED   02B9 0082
        B       L_63F3                          ; 63EF   0200 0002

L_63F1:
        MVII    #$0006, R1                      ; 63F1   02B9 0006
L_63F3:
        MVO     R1,     G_0197                  ; 63F3   0241 0197
L_63F5:
        PULR    R7                              ; 63F5   02B7
L_63F6:
        PSHR    R5                              ; 63F6   0275
        DECR    R0                              ; 63F7   0010
        BMI     L_63F5                          ; 63F8   022B 0004

        XOR     G_0133, R1                      ; 63FA   03C1 0133
        BNEQ    L_63F5                          ; 63FC   022C 0008

        INCR    R7                              ; 63FE   000F
L_63FF:
        CLRR    R5                              ; 63FF   01ED
L_6400:
        MVII    #$0190, R4                      ; 6400   02BC 0190
        MVI     G_01B0, R1                      ; 6402   0281 01B0
        ANDI    #$0006, R1                      ; 6404   03B9 0006
        BNEQ    L_6413                          ; 6406   020C 000B

L_6408:
        MVI@    R4,     R1                      ; 6408   02A1
        CMPI    #$0040, R1                      ; 6409   0379 0040
        BLT     L_6414                          ; 640B   0205 0007

        SUBI    #$0004, R4                      ; 640D   033C 0004
        CMPI    #$0187, R4                      ; 640F   037C 0187
        BGE     L_6408                          ; 6411   022D 000A

L_6413:
        PULR    R7                              ; 6413   02B7
L_6414:
        CMPI    #$0010, R1                      ; 6414   0379 0010
        BGE     L_6413                          ; 6416   022D 0004

        CMPI    #$0009, R1                      ; 6418   0379 0009
        BNEQ    L_641F                          ; 641A   020C 0003

        TSTR    R5                              ; 641C   00AD
        BEQ     L_6413                          ; 641D   0224 000B

L_641F:
        MOVR    R0,     R2                      ; 641F   0082
        BMI     L_644E                          ; 6420   020B 002C

        MOVR    R4,     R3                      ; 6422   00A3
        MVI@    R3,     R4                      ; 6423   029C
        DECR    R4                              ; 6424   0014
        BEQ     L_6413                          ; 6425   0224 0013

        MOVR    R1,     R0                      ; 6427   0088
        CMPI    #$0004, R2                      ; 6428   037A 0004
        BLT     L_6431                          ; 642A   0205 0005

        CMPI    #$000C, R2                      ; 642C   037A 000C
        BGE     L_6431                          ; 642E   020D 0001

        DECR    R0                              ; 6430   0010
L_6431:
        SUBI    #$0009, R0                      ; 6431   0338 0009
        BMI     L_6413                          ; 6433   022B 0021

        MOVR    R5,     R2                      ; 6435   00AA

        JSR     R5,     L_64B9                  ; 6436   0004 0164 00B9

        BEQ     L_6413                          ; 6439   0224 0027

        SLL     R0,     1                       ; 643B   0048
        SDBD                                    ; 643C   0001
        ADDI    #$5A7E, R0                      ; 643D   02F8 007E 005A
        MOVR    R0,     R4                      ; 6440   0084
        TSTR    R2                              ; 6441   0092
        BNEQ    L_645A                          ; 6442   020C 0016

        MOVR    R3,     R0                      ; 6444   0098
        MVI     G_01D8, R3                      ; 6445   0283 01D8
        CMPI    #$0009, R3                      ; 6447   037B 0009
        BGE     L_6459                          ; 6449   020D 000E
        J       L_59E7                          ; 644B   0004 0358 01E7

L_644E:
        MVII    #$0004, R0                      ; 644E   02B8 0004
        CMP@    R4,     R0                      ; 6450   0360
        BGE     L_6413                          ; 6451   022D 003F

        CMP     G_01D8, R0                      ; 6453   0340 01D8
        BLE     L_6413                          ; 6455   0226 0043

        DECR    R4                              ; 6457   0014
        MVO@    R0,     R4                      ; 6458   0260
L_6459:
        PULR    R7                              ; 6459   02B7
L_645A:
        MVII    #$0002, R5                      ; 645A   02BD 0002
L_645C:
        PSHR    R5                              ; 645C   0275
        PSHR    R3                              ; 645D   0273
        INCR    R3                              ; 645E   000B
        MVI@    R3,     R5                      ; 645F   029D
        PSHR    R4                              ; 6460   0274
        MVI@    R4,     R2                      ; 6461   02A2
        MVI@    R4,     R3                      ; 6462   02A3
        MOVR    R5,     R4                      ; 6463   00AC
        INCR    R4                              ; 6464   000C

        JSR     R5,     G_E080                  ; 6465   0004 01E0 0080

        PULR    R4                              ; 6468   02B4
        PULR    R3                              ; 6469   02B3
        PULR    R5                              ; 646A   02B5
        CMPI    #$0016, R2                      ; 646B   037A 0016
        BGT     L_6473                          ; 646D   020E 0004

        CMPI    #$0008, R2                      ; 646F   037A 0008
        BGE     L_647F                          ; 6471   020D 000C

L_6473:
        SUBI    #$0002, R4                      ; 6473   033C 0002
        SDBD                                    ; 6475   0001
        CMPI    #$5A7E, R4                      ; 6476   037C 007E 005A
        BLT     L_647E                          ; 6479   0205 0003

        DECR    R5                              ; 647B   0015
        BNEQ    L_645C                          ; 647C   022C 0021

L_647E:
        PULR    R7                              ; 647E   02B7
L_647F:
        MVO     R1,     G_01D8                  ; 647F   0241 01D8
        MOVR    R3,     R0                      ; 6481   0098
        INCR    R3                              ; 6482   000B
        MVI@    R3,     R5                      ; 6483   029D
        PSHR    R5                              ; 6484   0275
        INCR    R5                              ; 6485   000D
        MVO@    R5,     R3                      ; 6486   025D
        PSHR    R1                              ; 6487   0271

        JSR     R5,     L_59E6                  ; 6488   0004 0158 01E6

        PULR    R1                              ; 648B   02B1
L_648C:
        PULR    R0                              ; 648C   02B0
        CMPI    #$0009, R1                      ; 648D   0379 0009
        BEQ     L_64AA                          ; 648F   0204 0019

        MVO@    R0,     R5                      ; 6491   0268
        CMPI    #$000F, R2                      ; 6492   037A 000F
        BLE     L_6413                          ; 6494   0226 0082

        MVI@    R2,     R3                      ; 6496   0293
        SDBD                                    ; 6497   0001
        ADDI    #$0013, R3                      ; 6498   02FB 0013 0000
        MVO@    R3,     R2                      ; 649B   0253
        MVII    #$0220, R0                      ; 649C   02B8 0220
        ADDI    #$0004, R2                      ; 649E   02FA 0004
        MVO@    R0,     R2                      ; 64A0   0250
        INCR    R2                              ; 64A1   000A
        MVII    #$0001, R0                      ; 64A2   02B8 0001
        MVO@    R0,     R2                      ; 64A4   0250
        MVI@    R2,     R3                      ; 64A5   0293

        JSR     R5,     L_6E85                  ; 64A6   0004 016C 0285

        PULR    R7                              ; 64A9   02B7
L_64AA:
        MVO@    R0,     R5                      ; 64AA   0268
        MVI     G_016D, R0                      ; 64AB   0280 016D
        ANDI    #$007F, R0                      ; 64AD   03B8 007F
        XORI    #$0080, R0                      ; 64AF   03F8 0080
        MVO     R0,     G_016D                  ; 64B1   0240 016D
        PULR    R7                              ; 64B3   02B7
L_64B4:
        MOVR    R7,     R4                      ; 64B4   00BC
        ADDI    #$0107, R4                      ; 64B5   02FC 0107
        B       L_64BC                          ; 64B7   0200 0003

L_64B9:
        MOVR    R7,     R4                      ; 64B9   00BC
        ADDI    #$00F2, R4                      ; 64BA   02FC 00F2
L_64BC:
        PSHR    R5                              ; 64BC   0275
        PSHR    R0                              ; 64BD   0270
        NOP                                     ; 64BE   0034
        SLL     R0,     2                       ; 64BF   004C
        ADDR    R0,     R4                      ; 64C0   00C4
        PSHR    R1                              ; 64C1   0271
        SLL     R1,     2                       ; 64C2   004D
        NOP                                     ; 64C3   0034
        SLL     R1,     1                       ; 64C4   0049
        ADD     G_0354, R1                      ; 64C5   02C1 0354
        DECR    R1                              ; 64C7   0011
        MOVR    R1,     R5                      ; 64C8   008D
        SDBD                                    ; 64C9   0001
        MVI@    R5,     R0                      ; 64CA   02A8
        SAR     R0,     2                       ; 64CB   006C
        SAR     R0,     2                       ; 64CC   006C
        SAR     R0,     2                       ; 64CD   006C
        CMP@    R4,     R0                      ; 64CE   0360
        BLT     L_64DF                          ; 64CF   0205 000E

        CMP@    R4,     R0                      ; 64D1   0360
        BGT     L_64DF                          ; 64D2   020E 000B

        SDBD                                    ; 64D4   0001
        MVI@    R5,     R0                      ; 64D5   02A8
        SAR     R0,     2                       ; 64D6   006C
        SAR     R0,     2                       ; 64D7   006C
        SAR     R0,     2                       ; 64D8   006C
        CMP@    R4,     R0                      ; 64D9   0360
        BLT     L_64DF                          ; 64DA   0205 0003

        CMP@    R4,     R0                      ; 64DC   0360
        BLE     L_64E0                          ; 64DD   0206 0001

L_64DF:
        INCR    R7                              ; 64DF   000F
L_64E0:
        CLRR    R5                              ; 64E0   01ED
        PULR    R1                              ; 64E1   02B1
        PULR    R0                              ; 64E2   02B0
        PULR    R7                              ; 64E3   02B7
        PSHR    R5                              ; 64E4   0275
        MVI     G_035D, R4                      ; 64E5   0284 035D
        CMP     G_0349, R4                      ; 64E7   0344 0349
        BLE     L_6515                          ; 64E9   0206 002A

        MVI     G_0181, R2                      ; 64EB   0282 0181
        MOVR    R2,     R4                      ; 64ED   0094
        SAR     R2,     2                       ; 64EE   006E
        SAR     R2,     2                       ; 64EF   006E
        ADDI    #$0002, R2                      ; 64F0   02FA 0002
        CMPR    R3,     R2                      ; 64F2   015A
        BEQ     L_64FB                          ; 64F3   0204 0006

        CMPR    R0,     R2                      ; 64F5   0142
        BNEQ    L_6515                          ; 64F6   020C 001D

        XORR    R3,     R0                      ; 64F8   01D8
        XORR    R0,     R3                      ; 64F9   01C3
        XORR    R3,     R0                      ; 64FA   01D8
L_64FB:
        SLL     R3,     2                       ; 64FB   004F
        SLL     R3,     1                       ; 64FC   004B
        ADDI    #$031D, R3                      ; 64FD   02FB 031D
        MVO     R3,     G_0321                  ; 64FF   0243 0321
        MOVR    R4,     R3                      ; 6501   00A3
        ANDI    #$000F, R3                      ; 6502   03BB 000F
        SUBI    #$0002, R0                      ; 6504   0338 0002
        MVII    #$017F, R2                      ; 6506   02BA 017F
        SLL     R0,     2                       ; 6508   004C
        SLL     R0,     2                       ; 6509   004C
L_650A:
        MVI@    R2,     R4                      ; 650A   0294
        ANDI    #$00F0, R4                      ; 650B   03BC 00F0
        CMPR    R0,     R4                      ; 650D   0144
        BEQ     L_6516                          ; 650E   0204 0006

        DECR    R2                              ; 6510   0012
        CMPI    #$017A, R2                      ; 6511   037A 017A
        BGE     L_650A                          ; 6513   022D 000A

L_6515:
        PULR    R7                              ; 6515   02B7
L_6516:
        MVI@    R2,     R0                      ; 6516   0290
        ANDI    #$000F, R0                      ; 6517   03B8 000F
        MOVR    R0,     R1                      ; 6519   0081
        SUBI    #$0009, R0                      ; 651A   0338 0009
        BMI     L_6515                          ; 651C   022B 0008

        CMPI    #$0004, R0                      ; 651E   0378 0004
        BGE     L_6515                          ; 6520   022D 000C

        MOVR    R0,     R2                      ; 6522   0082
        ADDR    R2,     R2                      ; 6523   00D2
        ADDR    R0,     R2                      ; 6524   00C2
        ADDI    #$0187, R2                      ; 6525   02FA 0187
        MVI@    R2,     R4                      ; 6527   0294
        ANDI    #$00DF, R4                      ; 6528   03BC 00DF
        CMPI    #$0010, R4                      ; 652A   037C 0010
        BGE     L_6515                          ; 652C   022D 0018

        JSR     R5,     L_64B9                  ; 652E   0004 0164 00B9

        BEQ     L_6515                          ; 6531   0224 001D

        DECR    R0                              ; 6533   0010
        BMI     L_653B                          ; 6534   020B 0005

        JSR     R5,     L_64B9                  ; 6536   0004 0164 00B9

        BEQ     L_6515                          ; 6539   0224 0025

L_653B:
        SLL     R1,     2                       ; 653B   004D
        SLL     R1,     1                       ; 653C   0049
        ADD     G_0354, R1                      ; 653D   02C1 0354
        SLL     R3,     2                       ; 653F   004F
        SLL     R3,     1                       ; 6540   004B
        ADD     G_0354, R3                      ; 6541   02C3 0354
        MVII    #$0002, R4                      ; 6543   02BC 0002
        MOVR    R4,     R0                      ; 6545   00A0
L_6546:
        MVI@    R1,     R5                      ; 6546   028D
        INCR    R5                              ; 6547   000D
        SUB@    R3,     R5                      ; 6548   031D
        BMI     L_6515                          ; 6549   022B 0035

        CMPR    R4,     R5                      ; 654B   0165
        BGT     L_6515                          ; 654C   022E 0038

        ADDR    R4,     R1                      ; 654E   00E1
        ADDR    R4,     R3                      ; 654F   00E3
        DECR    R0                              ; 6550   0010
        BNEQ    L_6546                          ; 6551   022C 000C

        JSR     R5,     L_587C                  ; 6553   0004 0158 007C

        MVII    #$0001, R0                      ; 6556   02B8 0001

        JSR     R5,     X_CLR_BIT               ; 6558   0004 0114 02E6

        XORR    R2,     R3                      ; 655B   01D3
L_655C:
        MVI@    R2,     R1                      ; 655C   0291
        ANDI    #$000F, R1                      ; 655D   03B9 000F
        MOVR    R1,     R4                      ; 655F   008C
        SUBI    #$0008, R4                      ; 6560   033C 0008
        ADD     G_033C, R4                      ; 6562   02C4 033C
        DECR    R4                              ; 6564   0014
        MVII    #$00FA, R5                      ; 6565   02BD 00FA
        MVO@    R5,     R4                      ; 6567   0265
        MOVR    R1,     R0                      ; 6568   0088
        XORI    #$0040, R0                      ; 6569   03F8 0040
        MVO@    R0,     R2                      ; 656B   0250
        SDBD                                    ; 656C   0001
        MVII    #$5A86, R4                      ; 656D   02BC 0086 005A
        MVI     G_0133, R3                      ; 6570   0283 0133
        TSTR    R3                              ; 6572   009B
        BNEQ    L_6577                          ; 6573   020C 0002

        ADDI    #$0002, R4                      ; 6575   02FC 0002
L_6577:
        INCR    R2                              ; 6577   000A
        MOVR    R2,     R0                      ; 6578   0090
        PSHR    R5                              ; 6579   0275

        JSR     R5,     L_59E6                  ; 657A   0004 0158 01E6

        PULR    R0                              ; 657D   02B0
        MVI     G_0321, R3                      ; 657E   0283 0321
        TSTR    R3                              ; 6580   009B
        BEQ     L_65A2                          ; 6581   0204 001F

        MVI@    R3,     R1                      ; 6583   0299
        SDBD                                    ; 6584   0001
        ANDI    #$FDFF, R1                      ; 6585   03B9 00FF 00FD
        DECR    R0                              ; 6588   0010
        BMI     L_658D                          ; 6589   020B 0002

        XORI    #$0200, R1                      ; 658B   03F9 0200
L_658D:
        MVO@    R1,     R3                      ; 658D   0259
        INCR    R3                              ; 658E   000B
        SDBD                                    ; 658F   0001
        MVII    #$60C6, R0                      ; 6590   02B8 00C6 0060
        MVO@    R0,     R3                      ; 6593   0258
        MVII    #$0005, R0                      ; 6594   02B8 0005
        ADDR    R0,     R3                      ; 6596   00C3
        SLL     R0,     1                       ; 6597   0048
        MVO@    R0,     R3                      ; 6598   0258
        SAR     R0,     2                       ; 6599   006C
        DECR    R3                              ; 659A   0013
        MVO@    R0,     R3                      ; 659B   0258
        MVII    #$0001, R0                      ; 659C   02B8 0001

        JSR     R5,     X_CLR_BIT               ; 659E   0004 0114 02E6

        XORR    R2,     R3                      ; 65A1   01D3

L_65A2:
        JSR     R5,     G_E5F1                  ; 65A2   0004 01E4 01F1

        PULR    R7                              ; 65A5   02B7
L_65A6:
        PSHR    R5                              ; 65A6   0275
L_65A7:
        CLRR    R5                              ; 65A7   01ED
        MVO     R5,     G_0321                  ; 65A8   0245 0321
L_65AA:
        B       L_655C                          ; 65AA   0220 004F

        CMPR    R6,     R4                      ; 65AC   0174
        CMPR    R7,     R7                      ; 65AD   017F
        MOVR    R1,     R4                      ; 65AE   008C
        MOVR    R2,     R6                      ; 65AF   0096
        SUBR    R3,     R4                      ; 65B0   011C
        SUBR    R5,     R2                      ; 65B1   012A
        ADDR    R4,     R0                      ; 65B2   00E0
        ADDR    R5,     R0                      ; 65B3   00E8
        ADDR    R0,     R4                      ; 65B4   00C4
        ADDR    R3,     R3                      ; 65B5   00DB
        MOVR    R1,     R3                      ; 65B6   008B
        MOVR    R2,     R6                      ; 65B7   0096
        SUBR    R3,     R4                      ; 65B8   011C
        SUBR    R5,     R2                      ; 65B9   012A
        RSWD    R0                              ; 65BA   0038
        RSWD    R7                              ; 65BB   003F
        CMPR    R4,     R4                      ; 65BC   0164
        ANDR    R0,     R7                      ; 65BD   0187
        TSTR    R0                              ; 65BE   0080
        TSTR    R3                              ; 65BF   009B
        SUBR    R3,     R0                      ; 65C0   0118
        CMPR    R0,     R0                      ; 65C1   0140
        ADDR    R3,     R0                      ; 65C2   00D8
        ADDR    R6,     R0                      ; 65C3   00F0
        MOVR    R7,     R4                      ; 65C4   00BC
        ADDR    R4,     R4                      ; 65C5   00E4
        MOVR    R0,     R4                      ; 65C6   0084
        MOVR    R3,     R4                      ; 65C7   009C
        SUBR    R1,     R0                      ; 65C8   0108
        SUBR    R5,     R4                      ; 65C9   012C
        ADCR    R4                              ; 65CA   002C
        SLL     R0,     2                       ; 65CB   004C
        ADDI    #$0005, R1                      ; 65CC   02F9 0005
        MVI@    R1,     R0                      ; 65CE   0288
        ANDI    #$000F, R0                      ; 65CF   03B8 000F
        CMPI    #$0002, R0                      ; 65D1   0378 0002
        BEQ     L_65D8                          ; 65D3   0204 0003

        MVII    #$0001, R0                      ; 65D5   02B8 0001
        INCR    R1                              ; 65D7   0009
L_65D8:
        MVO@    R0,     R1                      ; 65D8   0248
        MOVR    R5,     R7                      ; 65D9   00AF
        PSHR    R5                              ; 65DA   0275
        SDBD                                    ; 65DB   0001
        MVII    #$6080, R2                      ; 65DC   02BA 0080 0060
        INCR    R1                              ; 65DF   0009
        MVO@    R2,     R1                      ; 65E0   024A
        ADDI    #$0004, R1                      ; 65E1   02F9 0004
        MVI@    R1,     R2                      ; 65E3   028A
        ANDI    #$000F, R2                      ; 65E4   03BA 000F
        CMPI    #$0006, R2                      ; 65E6   037A 0006
        BLT     L_65EC                          ; 65E8   0205 0002

        XOR@    R1,     R2                      ; 65EA   03CA
        MVO@    R2,     R1                      ; 65EB   024A
L_65EC:
        PULR    R7                              ; 65EC   02B7
        PSHR    R5                              ; 65ED   0275
        MVI     G_0173, R0                      ; 65EE   0280 0173
        CMPI    #$002F, R0                      ; 65F0   0378 002F
        BEQ     L_6647                          ; 65F2   0204 0053

        JSR     R5,     L_683B                  ; 65F4   0004 0168 003B

        BEQ     L_663E                          ; 65F7   0204 0045

        INCR    R7                              ; 65F9   000F
L_65FA:
        PSHR    R5                              ; 65FA   0275
        MVI     G_0172, R0                      ; 65FB   0280 0172
        MVI     G_01C4, R2                      ; 65FD   0282 01C4
        SLL     R2,     1                       ; 65FF   004A
        BNEQ    L_6609                          ; 6600   020C 0007

        JSR     R5,     X_CLAMP                 ; 6602   0004 0114 0270

        DECR    R3                              ; 6605   0013
        COMR    R3                              ; 6606   001B
        MVO     R0,     G_0172                  ; 6607   0240 0172
L_6609:
        MOVR    R0,     R3                      ; 6609   0083
        MOVR    R7,     R5                      ; 660A   00BD
        ADDI    #$0220, R5                      ; 660B   02FD 0220
        ADDR    R2,     R5                      ; 660D   00D5
        SDBD                                    ; 660E   0001
        MVI@    R5,     R4                      ; 660F   02AC

        JSR     R5,     L_6DF7                  ; 6610   0004 016C 01F7
        JSR     R5,     L_6B89                  ; 6613   0004 0168 0389
        JSR     R5,     L_6B07                  ; 6616   0004 0168 0307
        JSR     R5,     L_6C82                  ; 6619   0004 016C 0082

        MVI     G_0173, R0                      ; 661C   0280 0173
        SUBI    #$0003, R0                      ; 661E   0338 0003
        BNEQ    L_6639                          ; 6620   020C 0017

        SDBD                                    ; 6622   0001
        MVII    #$4106, R4                      ; 6623   02BC 0006 0041
        CLRR    R2                              ; 6626   01D2
        MVII    #$000E, R1                      ; 6627   02B9 000E
L_6629:
        MVO@    R2,     R4                      ; 6629   0262
        MVO@    R2,     R4                      ; 662A   0262
        ADDI    #$0006, R4                      ; 662B   02FC 0006
        DECR    R1                              ; 662D   0011
        BNEQ    L_6629                          ; 662E   022C 0006

        MVO     R2,     G_031F                  ; 6630   0242 031F
        MVO     R2,     G_0327                  ; 6632   0242 0327
        MVII    #$0083, R0                      ; 6634   02B8 0083
        MVO     R0,     G_0173                  ; 6636   0240 0173
        PULR    R7                              ; 6638   02B7

L_6639:
        JSR     R5,     L_6667                  ; 6639   0004 0164 0267

        MVII    #$0080, R0                      ; 663C   02B8 0080
L_663E:
        MVO     R0,     G_0173                  ; 663E   0240 0173

        JSR     R5,     G_E888                  ; 6640   0004 01E8 0088

        MVII    #$017A, R4                      ; 6643   02BC 017A
        B       L_6649                          ; 6645   0200 0002

L_6647:
        MVII    #$017F, R4                      ; 6647   02BC 017F
L_6649:
        MVI@    R4,     R0                      ; 6649   02A0
        CLRR    R3                              ; 664A   01DB

        JSR     R5,     L_6D40                  ; 664B   0004 016C 0140

        BNEQ    L_6659                          ; 664E   020C 0009

        CMP     G_01B3, R0                      ; 6650   0340 01B3
        BEQ     L_6662                          ; 6652   0204 000E

        CMPI    #$0009, R0                      ; 6654   0378 0009
        BEQ     L_6662                          ; 6656   0204 000A

        MOVR    R7,     R3                      ; 6658   00BB
L_6659:
        CMP     G_01D8, R0                      ; 6659   0340 01D8
        BEQ     L_6662                          ; 665B   0204 0005

        PSHR    R4                              ; 665D   0274

        JSR     R5,     L_6D4E                  ; 665E   0004 016C 014E

        PULR    R4                              ; 6661   02B4
L_6662:
        CMPI    #$0180, R4                      ; 6662   037C 0180
        BLT     L_6649                          ; 6664   0225 001C

        INCR    R7                              ; 6666   000F
L_6667:
        PSHR    R5                              ; 6667   0275
        MVI     G_0173, R0                      ; 6668   0280 0173
        SWAP    R0,     1                       ; 666A   0040
        BMI     L_682A                          ; 666B   020B 01BD

        MVII    #$017A, R2                      ; 666D   02BA 017A
L_666F:
        MVI@    R2,     R3                      ; 666F   0293
        MOVR    R3,     R0                      ; 6670   0098
        ANDI    #$00F0, R3                      ; 6671   03BB 00F0
        CMPI    #$0050, R3                      ; 6673   037B 0050
        BGT     L_6749                          ; 6675   020E 00D2

        XORR    R3,     R0                      ; 6677   01D8
        SAR     R3,     1                       ; 6678   006B
        ADDI    #$032F, R3                      ; 6679   02FB 032F
        CMPI    #$000D, R0                      ; 667B   0378 000D
        BGT     L_6749                          ; 667D   020E 00CA
        BNEQ    L_6683                          ; 667F   020C 0002

        MVII    #$0327, R3                      ; 6681   02BB 0327
L_6683:
        SLL     R0,     2                       ; 6683   004C
        SLL     R0,     1                       ; 6684   0048
        SDBD                                    ; 6685   0001
        ADDI    #$4105, R0                      ; 6686   02F8 0005 0041
        MOVR    R0,     R4                      ; 6689   0084
        MOVR    R3,     R5                      ; 668A   009D
        PSHR    R3                              ; 668B   0273
        PSHR    R2                              ; 668C   0272
        MVI@    R4,     R2                      ; 668D   02A2
        MVI     G_01AF, R0                      ; 668E   0280 01AF
        SLL     R0,     2                       ; 6690   004C
        SLL     R0,     1                       ; 6691   0048
        BEQ     L_66AA                          ; 6692   0204 0016

        SDBD                                    ; 6694   0001
        ADDI    #$4106, R0                      ; 6695   02F8 0006 0041
        CMPR    R4,     R0                      ; 6698   0160
        BNEQ    L_66AA                          ; 6699   020C 000F

        MVII    #$0030, R2                      ; 669B   02BA 0030
        MVI@    R4,     R0                      ; 669D   02A0
        CMPI    #$0030, R0                      ; 669E   0378 0030
        BLT     L_66A3                          ; 66A0   0205 0001

        SUBR    R2,     R0                      ; 66A2   0110
L_66A3:
        SDBD                                    ; 66A3   0001
        MVII    #$9040, R3                      ; 66A4   02BB 0040 0090
        MVI@    R4,     R2                      ; 66A7   02A2
        B       L_6702                          ; 66A8   0200 0058

L_66AA:
        MVI@    R4,     R0                      ; 66AA   02A0
        SLL     R0,     1                       ; 66AB   0048
        MVI     G_0172, R1                      ; 66AC   0281 0172
        SLL     R1,     2                       ; 66AE   004D
        SLL     R1,     1                       ; 66AF   0049
        ADDI    #$0004, R1                      ; 66B0   02F9 0004
        SUBR    R1,     R0                      ; 66B2   0108
        BPL     L_66B6                          ; 66B3   0203 0001

        CLRR    R0                              ; 66B5   01C0
L_66B6:
        CMPI    #$00C8, R0                      ; 66B6   0378 00C8
        BLT     L_66BC                          ; 66B8   0205 0002

        MVII    #$00C8, R0                      ; 66BA   02B8 00C8
L_66BC:
        PSHR    R0                              ; 66BC   0270
        MVI@    R4,     R0                      ; 66BD   02A0
        CMPI    #$00C8, R0                      ; 66BE   0378 00C8
        BLT     L_66C6                          ; 66C0   0205 0004

        SDBD                                    ; 66C2   0001
        XORI    #$FF00, R0                      ; 66C3   03F8 0000 00FF
L_66C6:
        MVI     G_01C4, R1                      ; 66C6   0281 01C4
        TSTR    R1                              ; 66C8   0089
        BEQ     L_66D2                          ; 66C9   0204 0007

        DECR    R1                              ; 66CB   0011
        CMPI    #$0004, R1                      ; 66CC   0379 0004
        BLT     L_66D2                          ; 66CE   0205 0002

        SUBI    #$0004, R1                      ; 66D0   0339 0004
L_66D2:
        SLL     R1,     2                       ; 66D2   004D
        SLL     R1,     1                       ; 66D3   0049
        PSHR    R1                              ; 66D4   0271
        SDBD                                    ; 66D5   0001
        MVII    #$B0C0, R3                      ; 66D6   02BB 00C0 00B0
        CMPI    #$0041, R2                      ; 66D9   037A 0041
        BLT     L_66E7                          ; 66DB   0205 000A

        SDBD                                    ; 66DD   0001
        XORI    #$2000, R3                      ; 66DE   03FB 0000 0020
        CMPI    #$005A, R2                      ; 66E1   037A 005A
        BLT     L_66E7                          ; 66E3   0205 0002

        XORI    #$0080, R3                      ; 66E5   03FB 0080
L_66E7:
        MOVR    R3,     R2                      ; 66E7   009A
        SDBD                                    ; 66E8   0001
        CMPI    #$4168, R4                      ; 66E9   037C 0068 0041
        BGT     L_66F4                          ; 66EC   020E 0006

        ANDI    #$0080, R2                      ; 66EE   03BA 0080
        BEQ     L_66F4                          ; 66F0   0204 0002

        SUBI    #$0008, R1                      ; 66F2   0339 0008
L_66F4:
        MOVR    R1,     R2                      ; 66F4   008A
        PULR    R1                              ; 66F5   02B1
        ADDI    #$0060, R2                      ; 66F6   02FA 0060
        SUBR    R0,     R2                      ; 66F8   0102
        BLE     L_66FF                          ; 66F9   0206 0004

        CMPI    #$006E, R2                      ; 66FB   037A 006E
        BLT     L_6701                          ; 66FD   0205 0002

L_66FF:
        MVII    #$006E, R2                      ; 66FF   02BA 006E
L_6701:
        PULR    R0                              ; 6701   02B0
L_6702:
        SWAP    R0,     1                       ; 6702   0040
        MVO@    R0,     R5                      ; 6703   0268
        SWAP    R2,     1                       ; 6704   0042
        MVO@    R2,     R5                      ; 6705   026A
        SUBI    #$0004, R5                      ; 6706   033D 0004
        MVI@    R5,     R2                      ; 6708   02AA
        SDBD                                    ; 6709   0001
        ANDI    #$0A17, R2                      ; 670A   03BA 0017 000A
        XORR    R3,     R2                      ; 670D   01DA
        DECR    R5                              ; 670E   0015
        MVO@    R2,     R5                      ; 670F   026A
        SDBD                                    ; 6710   0001
        CMPI    #$4170, R4                      ; 6711   037C 0070 0041
        BNEQ    L_6747                          ; 6714   020C 0031

        MVI@    R4,     R0                      ; 6716   02A0
        CMPI    #$00C8, R0                      ; 6717   0378 00C8
        BLT     L_671F                          ; 6719   0205 0004

        SDBD                                    ; 671B   0001
        XORI    #$FF00, R0                      ; 671C   03F8 0000 00FF
L_671F:
        MOVR    R3,     R2                      ; 671F   009A
        SDBD                                    ; 6720   0001
        ANDI    #$FF68, R2                      ; 6721   03BA 0068 00FF
        MVO     R2,     G_0325                  ; 6724   0242 0325
        XORI    #$0080, R2                      ; 6726   03FA 0080
        ANDR    R2,     R3                      ; 6728   0193
        XORI    #$0007, R3                      ; 6729   03FB 0007
        MVO     R3,     G_031D                  ; 672B   0243 031D
        ANDI    #$0080, R3                      ; 672D   03BB 0080
        BNEQ    L_6733                          ; 672F   020C 0002

        ADDI    #$0008, R1                      ; 6731   02F9 0008
L_6733:
        ADDI    #$0058, R1                      ; 6733   02F9 0058
        SUBR    R0,     R1                      ; 6735   0101
        BLE     L_673C                          ; 6736   0206 0004

        CMPI    #$006E, R1                      ; 6738   0379 006E
        BLT     L_673E                          ; 673A   0205 0002

L_673C:
        MVII    #$006E, R1                      ; 673C   02B9 006E
L_673E:
        SWAP    R1,     1                       ; 673E   0041
        SUBI    #$0002, R5                      ; 673F   033D 0002
        MVI     G_0327, R0                      ; 6741   0280 0327
        MVO     R0,     G_031F                  ; 6743   0240 031F
        MVO     R1,     G_0320                  ; 6745   0241 0320
L_6747:
        PULR    R2                              ; 6747   02B2
        PULR    R3                              ; 6748   02B3
L_6749:
        INCR    R2                              ; 6749   000A
        CMPI    #$0181, R2                      ; 674A   037A 0181
        BLT     L_666F                          ; 674C   0225 00DE

        MVI     G_0180, R0                      ; 674E   0280 0180
        MVI     G_0349, R5                      ; 6750   0285 0349
        CMP     G_035D, R5                      ; 6752   0345 035D
        BC      L_675E                          ; 6754   0201 0008

        CMPI    #$001D, R0                      ; 6756   0378 001D
        BNEQ    L_677A                          ; 6758   020C 0020

        MVO     R5,     G_035D                  ; 675A   0245 035D
        B       L_67AB                          ; 675C   0200 004D

L_675E:
        SDBD                                    ; 675E   0001
        SUBI    #$001E, R5                      ; 675F   033D 001E 0000
        CMP     G_035D, R5                      ; 6762   0345 035D
        BNEQ    L_67AB                          ; 6764   020C 0045

        MVII    #$0010, R1                      ; 6766   02B9 0010
        MVI     G_015E, R0                      ; 6768   0280 015E
        ANDR    R1,     R0                      ; 676A   0188
        BNEQ    L_67AB                          ; 676B   020C 003E

        MVO     R1,     G_015E                  ; 676D   0241 015E
        MVI     G_0161, R0                      ; 676F   0280 0161
        CMPI    #$0020, R0                      ; 6771   0378 0020
        BNEQ    L_67AB                          ; 6773   020C 0036

        MVO     R0,     G_016E                  ; 6775   0240 016E

        JSR     R5,     L_5069                  ; 6777   0004 0150 0069

L_677A:
        MVI@    R2,     R1                      ; 677A   0291
        ANDI    #$00F0, R1                      ; 677B   03B9 00F0
        CMPI    #$0060, R1                      ; 677D   0379 0060
        BGE     L_67AB                          ; 677F   020D 002A

        MVI     G_035D, R0                      ; 6781   0280 035D
        SAR     R1,     1                       ; 6783   0069
        ADDI    #$032D, R1                      ; 6784   02F9 032D
        MOVR    R1,     R4                      ; 6786   008C
        MVI@    R4,     R0                      ; 6787   02A0
        SDBD                                    ; 6788   0001
        ANDI    #$FFE8, R0                      ; 6789   03B8 00E8 00FF
        MOVR    R0,     R2                      ; 678C   0082
        XORI    #$0007, R0                      ; 678D   03F8 0007
        MVO@    R0,     R1                      ; 678F   0248
        XOR     G_0132, R2                      ; 6790   03C2 0132
        MVI@    R4,     R3                      ; 6792   02A3
        SDBD                                    ; 6793   0001
        MVII    #$605B, R0                      ; 6794   02B8 005B 0060
        SDBD                                    ; 6797   0001
        CMPI    #$60C6, R3                      ; 6798   037B 00C6 0060
        BGT     L_67AB                          ; 679B   020E 000E
        BEQ     L_67A8                          ; 679D   0204 0009

        MVO     R2,     G_0325                  ; 679F   0242 0325
        SDBD                                    ; 67A1   0001
        ADDI    #$0014, R5                      ; 67A2   02FD 0014 0000
        MVO     R5,     G_035D                  ; 67A5   0245 035D
        INCR    R7                              ; 67A7   000F
L_67A8:
        CLRR    R0                              ; 67A8   01C0
        MVO     R0,     G_0326                  ; 67A9   0240 0326
L_67AB:
        MVI     G_0359, R3                      ; 67AB   0283 0359
        MVI     G_035D, R4                      ; 67AD   0284 035D
        CMP     G_0341, R4                      ; 67AF   0344 0341
        BNEQ    L_67F6                          ; 67B1   020C 0043

        CMPI    #$0064, R3                      ; 67B3   037B 0064
        BEQ     L_67C7                          ; 67B5   0204 0010

        CMPI    #$015E, R3                      ; 67B7   037B 015E
        BNEQ    L_67F6                          ; 67B9   020C 003B

        MVI     G_0170, R0                      ; 67BB   0280 0170
        TSTR    R0                              ; 67BD   0080
        BNEQ    L_67F6                          ; 67BE   020C 0036

        PSHR    R3                              ; 67C0   0273

        JSR     R5,     L_6EC4                  ; 67C1   0004 016C 02C4

        PULR    R3                              ; 67C4   02B3
        B       L_67F6                          ; 67C5   0200 002F

L_67C7:
        MVI     G_01AB, R0                      ; 67C7   0280 01AB
        ANDI    #$0003, R0                      ; 67C9   03B8 0003
        MVO     R0,     G_01E1                  ; 67CB   0240 01E1
        MVII    #$018A, R2                      ; 67CD   02BA 018A
        CLRR    R0                              ; 67CF   01C0
L_67D0:
        MVI@    R2,     R5                      ; 67D0   0295
        CMPI    #$0040, R5                      ; 67D1   037D 0040
        BGT     L_67D6                          ; 67D3   020E 0001

        INCR    R0                              ; 67D5   0008
L_67D6:
        ADDI    #$0003, R2                      ; 67D6   02FA 0003
        CMPI    #$0190, R2                      ; 67D8   037A 0190
        BLE     L_67D0                          ; 67DA   0226 000B

        CMPI    #$0003, R0                      ; 67DC   0378 0003
        BLT     L_67E8                          ; 67DE   0205 0008

        MVII    #$0004, R0                      ; 67E0   02B8 0004

        JSR     R5,     X_CLR_BIT               ; 67E2   0004 0114 02E6

        XORR    R2,     R5                      ; 67E5   01D5
        B       L_67F0                          ; 67E6   0200 0008

L_67E8:
        MVO     R0,     G_01E0                  ; 67E8   0240 01E0
        MVII    #$0006, R0                      ; 67EA   02B8 0006

        JSR     R5,     X_CLR_BIT               ; 67EC   0004 0114 02E6

        XORR    R2,     R5                      ; 67EF   01D5
L_67F0:
        MVII    #$0007, R0                      ; 67F0   02B8 0007

        JSR     R5,     X_CLR_BIT               ; 67F2   0004 0114 02E6

        XORR    R2,     R5                      ; 67F5   01D5
L_67F6:
        SDBD                                    ; 67F6   0001
        MVII    #$47A9, R2                      ; 67F7   02BA 00A9 0047
        MVI     G_0135, R1                      ; 67FA   0281 0135
        ANDI    #$0002, R3                      ; 67FC   03BB 0002
        ADDR    R3,     R2                      ; 67FE   00DA
        MVI@    R2,     R0                      ; 67FF   0290
        DECR    R0                              ; 6800   0010
        MVO@    R0,     R2                      ; 6801   0250
        BPL     L_682A                          ; 6802   0203 0026

        MVII    #$0004, R0                      ; 6804   02B8 0004
        ADDR    R3,     R0                      ; 6806   00D8
        SUBI    #$0063, R1                      ; 6807   0339 0063
        BMI     L_680C                          ; 6809   020B 0001

        SAR     R0,     1                       ; 680B   0068
L_680C:
        MVO@    R0,     R2                      ; 680C   0250
        INCR    R2                              ; 680D   000A
        SAR     R3,     1                       ; 680E   006B
        MVI@    R2,     R0                      ; 680F   0290
        DECR    R0                              ; 6810   0010
        BPL     L_6816                          ; 6811   0203 0003

        MOVR    R3,     R0                      ; 6813   0098
        ADDI    #$0002, R0                      ; 6814   02F8 0002
L_6816:
        MVO@    R0,     R2                      ; 6816   0250
        SDBD                                    ; 6817   0001
        ADDI    #$0012, R0                      ; 6818   02F8 0012 0000
        TSTR    R1                              ; 681B   0089
        BMI     L_6820                          ; 681C   020B 0002

        ADDI    #$0004, R0                      ; 681E   02F8 0004
L_6820:
        MVO     R0,     G_0176                  ; 6820   0240 0176
        SDBD                                    ; 6822   0001
        MVII    #$0010, R0                      ; 6823   02B8 0010 0000
        MVO     R0,     G_0175                  ; 6826   0240 0175
        MVO     R3,     G_0174                  ; 6828   0243 0174
L_682A:
        PULR    R7                              ; 682A   02B7
        SLL     R0,     1                       ; 682B   0048
        ADDR    R3,     R1                      ; 682C   00D9
        NEGR    R3                              ; 682D   0023
        ADDR    R3,     R2                      ; 682E   00DA
        NEGR    R0                              ; 682F   0020
        ADDR    R3,     R2                      ; 6830   00DA
        COMR    R5                              ; 6831   001D
        ADDR    R3,     R2                      ; 6832   00DA
        COMR    R2                              ; 6833   001A
        ADDR    R3,     R2                      ; 6834   00DA
        SARC    R3,     2                       ; 6835   007F
        ADDR    R3,     R4                      ; 6836   00DC
        SLL     R0,     1                       ; 6837   0048
        ADDR    R3,     R4                      ; 6838   00DC
        DECLE   $0035                           ; 6839   0035

        ADDR    R3,     R4                      ; 683A   00DC
L_683B:
        PSHR    R5                              ; 683B   0275
        MVI     G_01B4, R2                      ; 683C   0282 01B4
        MVI     G_01B5, R0                      ; 683E   0280 01B5

        JSR     R5,     X_EXT_SIGN_LO           ; 6840   0004 0114 0268

        MOVR    R0,     R1                      ; 6843   0081
        MOVR    R2,     R0                      ; 6844   0090

        JSR     R5,     X_EXT_SIGN_LO           ; 6845   0004 0114 0268

        TSTR    R0                              ; 6848   0080
        BNEQ    L_684E                          ; 6849   020C 0003

        TSTR    R1                              ; 684B   0089
        BEQ     L_68BE                          ; 684C   0204 0070

L_684E:
        MVI     G_01B8, R5                      ; 684E   0285 01B8
        DECR    R5                              ; 6850   0015
        BMI     L_6855                          ; 6851   020B 0002

        MVO     R5,     G_01B8                  ; 6853   0245 01B8
L_6855:
        SAR     R0,     1                       ; 6855   0068
        BEQ     L_687E                          ; 6856   0204 0026

        TSTR    R1                              ; 6858   0089
        BMI     L_6868                          ; 6859   020B 000D

        CMPI    #$0002, R1                      ; 685B   0379 0002
        BLT     L_6868                          ; 685D   0205 0009

        MVI     G_01C4, R4                      ; 685F   0284 01C4
        TSTR    R4                              ; 6861   00A4
        BNEQ    L_6868                          ; 6862   020C 0004

        MVII    #$0014, R2                      ; 6864   02BA 0014
        MVO     R2,     G_0172                  ; 6866   0242 0172
L_6868:
        MVI     G_0172, R2                      ; 6868   0282 0172
        MVI     G_01B6, R3                      ; 686A   0283 01B6
        MOVR    R3,     R4                      ; 686C   009C
        ADDR    R0,     R2                      ; 686D   00C2
        MVO     R2,     G_0172                  ; 686E   0242 0172
        TSTR    R0                              ; 6870   0080
        BPL     L_6876                          ; 6871   0203 0003

        XORR    R2,     R3                      ; 6873   01D3
        XORR    R3,     R2                      ; 6874   01DA
        XORR    R2,     R3                      ; 6875   01D3
L_6876:
        CMPR    R3,     R2                      ; 6876   015A
        BLT     L_687E                          ; 6877   0205 0005

        MVO     R4,     G_0172                  ; 6879   0244 0172
        CLRR    R4                              ; 687B   01E4
        MVO     R4,     G_01B4                  ; 687C   0244 01B4
L_687E:
        MVI     G_01C4, R5                      ; 687E   0285 01C4
        SAR     R1,     1                       ; 6880   0069
        BEQ     L_6899                          ; 6881   0204 0016

        MOVR    R1,     R0                      ; 6883   0088
        MOVR    R5,     R2                      ; 6884   00AA
        MVI     G_01B7, R3                      ; 6885   0283 01B7
        MOVR    R3,     R4                      ; 6887   009C
        ADDR    R1,     R2                      ; 6888   00CA
        MVO     R2,     G_01C4                  ; 6889   0242 01C4
        TSTR    R1                              ; 688B   0089
        BPL     L_6891                          ; 688C   0203 0003

        XORR    R2,     R3                      ; 688E   01D3
        XORR    R3,     R2                      ; 688F   01DA
        XORR    R2,     R3                      ; 6890   01D3
L_6891:
        CMPR    R3,     R2                      ; 6891   015A
        BLT     L_6899                          ; 6892   0205 0005

        MVO     R4,     G_01C4                  ; 6894   0244 01C4
        CLRR    R4                              ; 6896   01E4
        MVO     R4,     G_01B5                  ; 6897   0244 01B5
L_6899:
        TSTR    R0                              ; 6899   0080
        BEQ     L_6AE2                          ; 689A   0204 0246

        MVII    #$0003, R0                      ; 689C   02B8 0003
        MVI     G_01C4, R2                      ; 689E   0282 01C4
        TSTR    R5                              ; 68A0   00AD
        BNEQ    L_68A8                          ; 68A1   020C 0005

        TSTR    R2                              ; 68A3   0092
        BEQ     L_68B9                          ; 68A4   0204 0013
        B       L_68BA                          ; 68A6   0200 0012

L_68A8:
        CMPI    #$0004, R5                      ; 68A8   037D 0004
        BGT     L_68B5                          ; 68AA   020E 0009

        TSTR    R2                              ; 68AC   0092
        BEQ     L_68BA                          ; 68AD   0204 000B

        CMPI    #$0004, R2                      ; 68AF   037A 0004
        BLE     L_68B9                          ; 68B1   0206 0006
        B       L_68BA                          ; 68B3   0200 0005

L_68B5:
        CMPI    #$0005, R2                      ; 68B5   037A 0005
        BLT     L_68BA                          ; 68B7   0205 0001

L_68B9:
        CLRR    R0                              ; 68B9   01C0
L_68BA:
        MVO     R0,     G_0173                  ; 68BA   0240 0173
        INCR    R0                              ; 68BC   0008
        PULR    R7                              ; 68BD   02B7
L_68BE:
        MVI     G_01B8, R5                      ; 68BE   0285 01B8
        DECR    R5                              ; 68C0   0015
        MVO     R5,     G_01B8                  ; 68C1   0245 01B8
        BPL     L_6AE1                          ; 68C3   0203 021C

        CLRR    R5                              ; 68C5   01ED
        MVO     R5,     G_01B8                  ; 68C6   0245 01B8
        MVI     G_0180, R0                      ; 68C8   0280 0180
        CMPI    #$001D, R0                      ; 68CA   0378 001D
        BNEQ    L_6903                          ; 68CC   020C 0035

        MVI     G_0327, R0                      ; 68CE   0280 0327
        SWAP    R0,     1                       ; 68D0   0040
        ANDI    #$00FF, R0                      ; 68D1   03B8 00FF
        CMPI    #$000A, R0                      ; 68D3   0378 000A
        BLT     L_68E8                          ; 68D5   0205 0011

        CMPI    #$009E, R0                      ; 68D7   0378 009E
        BGE     L_68E8                          ; 68D9   020D 000D

        MVI     G_0328, R0                      ; 68DB   0280 0328
        SWAP    R0,     1                       ; 68DD   0040
        ANDI    #$007F, R0                      ; 68DE   03B8 007F
        CMPI    #$000A, R0                      ; 68E0   0378 000A
        BLT     L_68E8                          ; 68E2   0205 0004

        CMPI    #$0060, R0                      ; 68E4   0378 0060
        BLT     L_6AE1                          ; 68E6   0205 01F9

L_68E8:
        SDBD                                    ; 68E8   0001
        MVII    #$416D, R4                      ; 68E9   02BC 006D 0041
        MVI@    R4,     R2                      ; 68EC   02A2
        SUBI    #$0003, R4                      ; 68ED   033C 0003
        MVI     G_01DF, R1                      ; 68EF   0281 01DF
        DECR    R1                              ; 68F1   0011
        BLE     L_692F                          ; 68F2   0206 003B

        CLRR    R1                              ; 68F4   01C9
        MVO     R1,     G_01DF                  ; 68F5   0241 01DF
        CMPI    #$0037, R2                      ; 68F7   037A 0037
        BLE     L_692F                          ; 68F9   0206 0034

        MVII    #$0003, R0                      ; 68FB   02B8 0003

        JSR     R5,     X_CLR_BIT               ; 68FD   0004 0114 02E6

        XORR    R2,     R4                      ; 6900   01D4
        B       L_692F                          ; 6901   0200 002C

L_6903:
        MVI     G_0181, R0                      ; 6903   0280 0181
        CMPI    #$00F0, R0                      ; 6905   0378 00F0
        BGE     L_6AE1                          ; 6907   020D 01D8

        MOVR    R0,     R1                      ; 6909   0081
        ANDI    #$00F0, R1                      ; 690A   03B9 00F0
        SAR     R1,     1                       ; 690C   0069
        ADDI    #$032F, R1                      ; 690D   02F9 032F
        MVI@    R1,     R2                      ; 690F   028A
        SWAP    R2,     1                       ; 6910   0042
        ANDI    #$00FF, R2                      ; 6911   03BA 00FF
        CMPI    #$0030, R2                      ; 6913   037A 0030
        BLT     L_6928                          ; 6915   0205 0011

        CMPI    #$0098, R2                      ; 6917   037A 0098
        BGE     L_6928                          ; 6919   020D 000D

        INCR    R1                              ; 691B   0009
        MVI@    R1,     R2                      ; 691C   028A
        SWAP    R2,     1                       ; 691D   0042
        ANDI    #$007F, R2                      ; 691E   03BA 007F
        CMPI    #$000E, R2                      ; 6920   037A 000E
        BLT     L_6928                          ; 6922   0205 0004

        CMPI    #$0058, R2                      ; 6924   037A 0058
        BLT     L_6AE1                          ; 6926   0205 01B9

L_6928:
        ANDI    #$000F, R0                      ; 6928   03B8 000F
        SLL     R0,     2                       ; 692A   004C
        SLL     R0,     1                       ; 692B   0048
        MOVR    R0,     R4                      ; 692C   0084
        ADD     G_0354, R4                      ; 692D   02C4 0354
L_692F:
        MVI@    R4,     R2                      ; 692F   02A2
        INCR    R4                              ; 6930   000C
        MVI@    R4,     R1                      ; 6931   02A1
        MVII    #$0010, R5                      ; 6932   02BD 0010
        MVO     R5,     G_01B8                  ; 6934   0245 01B8

        JSR     R5,     L_6A6E                  ; 6936   0004 0168 026E

        CMP     G_01B5, R0                      ; 6939   0340 01B5
        BNEQ    L_6AE1                          ; 693B   020C 01A4

        CMP     G_01B4, R0                      ; 693D   0340 01B4
        BNEQ    L_6AE1                          ; 693F   020C 01A0

        MVI     G_0180, R1                      ; 6941   0281 0180
        CMPI    #$001D, R1                      ; 6943   0379 001D
        BEQ     L_6949                          ; 6945   0204 0002

        MVI     G_0181, R1                      ; 6947   0281 0181
L_6949:
        ANDI    #$000F, R1                      ; 6949   03B9 000F
        MOVR    R1,     R0                      ; 694B   0088

        JSR     R5,     L_6D40                  ; 694C   0004 016C 0140

        BNEQ    L_6AE1                          ; 694F   020C 0190

        SLL     R1,     2                       ; 6951   004D
        SLL     R1,     1                       ; 6952   0049
        ADD     G_0354, R1                      ; 6953   02C1 0354
        MVI@    R1,     R4                      ; 6955   028C
        ADDI    #$0002, R1                      ; 6956   02F9 0002
        CLRR    R2                              ; 6958   01D2
        MVI@    R1,     R5                      ; 6959   028D
        CMPI    #$0040, R5                      ; 695A   037D 0040
        BGT     L_6960                          ; 695C   020E 0002

        MVII    #$0005, R2                      ; 695E   02BA 0005
L_6960:
        MVII    #$0014, R5                      ; 6960   02BD 0014
        SUBI    #$0049, R4                      ; 6962   033C 0049
        BMI     L_6967                          ; 6964   020B 0001

        NEGR    R5                              ; 6966   0025
L_6967:
        SUBI    #$0005, R1                      ; 6967   0339 0005
        MVO@    R5,     R1                      ; 6969   024D
        INCR    R1                              ; 696A   0009
        MVO@    R2,     R1                      ; 696B   024A
        ADDI    #$0004, R1                      ; 696C   02F9 0004
        MVI@    R1,     R5                      ; 696E   028D
        SUBI    #$000F, R5                      ; 696F   033D 000F
        TSTR    R4                              ; 6971   00A4
        BPL     L_6975                          ; 6972   0203 0001

        NEGR    R4                              ; 6974   0024
L_6975:
        CMPR    R5,     R4                      ; 6975   016C
        BLT     L_697A                          ; 6976   0205 0002

        INCR    R4                              ; 6978   000C
        MVO@    R4,     R1                      ; 6979   024C
L_697A:
        CMPI    #$000D, R0                      ; 697A   0378 000D
        BLT     L_6985                          ; 697C   0205 0007

        CLRR    R0                              ; 697E   01C0

        JSR     R5,     X_CLR_BIT               ; 697F   0004 0114 02E6

        CMP@    R3,     R4                      ; 6982   035C
        B       L_6AE1                          ; 6983   0200 015C

L_6985:
        CMPI    #$0009, R0                      ; 6985   0378 0009
        BGE     L_6AE1                          ; 6987   020D 0158

        CLRR    R3                              ; 6989   01DB
        MVII    #$000A, R2                      ; 698A   02BA 000A
        MVO     R0,     G_0193                  ; 698C   0240 0193
        MVO     R2,     G_0194                  ; 698E   0242 0194

        JSR     R5,     L_6D4E                  ; 6990   0004 016C 014E

        B       L_6AE1                          ; 6993   0200 014C

L_6995:
        SDBD                                    ; 6995   0001
        MVII    #$4168, R4                      ; 6996   02BC 0068 0041
        MVI     G_0186, R0                      ; 6999   0280 0186

        JSR     R5,     X_EXT_SIGN_LO           ; 699B   0004 0114 0268

        BPL     L_69A3                          ; 699E   0203 0003

        NEGR    R0                              ; 69A0   0020
        B       L_69AD                          ; 69A1   0200 000A

L_69A3:
        CMPI    #$0006, R0                      ; 69A3   0378 0006
        BLT     L_69B4                          ; 69A5   0205 000D

        SLL     R0,     1                       ; 69A7   0048
        CMPI    #$0014, R0                      ; 69A8   0378 0014
        BLE     L_69AD                          ; 69AA   0206 0001

        SLL     R0,     1                       ; 69AC   0048
L_69AD:
        MOVR    R0,     R3                      ; 69AD   0083
        MVII    #$00AA, R1                      ; 69AE   02B9 00AA
        MVO     R1,     G_0135                  ; 69B0   0241 0135
        B       L_69D1                          ; 69B2   0200 001D

L_69B4:
        MVI@    R4,     R0                      ; 69B4   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 69B5   0004 0114 0268

        BPL     L_69BB                          ; 69B8   0203 0001

        NEGR    R0                              ; 69BA   0020
L_69BB:
        MOVR    R0,     R1                      ; 69BB   0081
        MVI@    R4,     R0                      ; 69BC   02A0
        SUBI    #$0002, R4                      ; 69BD   033C 0002

        JSR     R5,     X_EXT_SIGN_LO           ; 69BF   0004 0114 0268

        BPL     L_69C5                          ; 69C2   0203 0001

        NEGR    R0                              ; 69C4   0020
L_69C5:
        SAR     R0,     1                       ; 69C5   0068
        SUBI    #$0008, R0                      ; 69C6   0338 0008
        MOVR    R0,     R3                      ; 69C8   0083
        CMPR    R0,     R1                      ; 69C9   0141
        BLE     L_69CD                          ; 69CA   0206 0001

        MOVR    R1,     R3                      ; 69CC   008B
L_69CD:
        SAR     R3,     1                       ; 69CD   006B
        MVO     R3,     G_01BD                  ; 69CE   0243 01BD
        SAR     R3,     1                       ; 69D0   006B
L_69D1:
        MVO     R3,     G_01B8                  ; 69D1   0243 01B8
        MVI@    R4,     R0                      ; 69D3   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 69D4   0004 0114 0268

        SLL     R0,     2                       ; 69D7   004C
        PSHR    R0                              ; 69D8   0270
        MVI@    R4,     R0                      ; 69D9   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 69DA   0004 0114 0268

        SLL     R0,     2                       ; 69DD   004C
        PULR    R1                              ; 69DE   02B1
        SDBD                                    ; 69DF   0001
        MVI@    R4,     R2                      ; 69E0   02A2
        SDBD                                    ; 69E1   0001
        MVI@    R4,     R3                      ; 69E2   02A3
        ADDI    #$0003, R4                      ; 69E3   02FC 0003
        MVI@    R4,     R5                      ; 69E5   02A5
        MVI@    R4,     R4                      ; 69E6   02A4
        CMPI    #$0080, R4                      ; 69E7   037C 0080
        BLT     L_69EF                          ; 69E9   0205 0004

        SDBD                                    ; 69EB   0001
        XORI    #$FF00, R4                      ; 69EC   03FC 0000 00FF
L_69EF:
        ADDR    R1,     R2                      ; 69EF   00CA
        ADDR    R1,     R2                      ; 69F0   00CA
        ADDR    R0,     R3                      ; 69F1   00C3
        ADDR    R0,     R3                      ; 69F2   00C3
        DECR    R4                              ; 69F3   0014
        ADDR    R4,     R5                      ; 69F4   00E5
        CMPI    #$000C, R5                      ; 69F5   037D 000C
        BLE     L_6A01                          ; 69F7   0206 0008

        CMPI    #$00F8, R5                      ; 69F9   037D 00F8
        BLE     L_69EF                          ; 69FB   0226 000D

        MVII    #$00F8, R5                      ; 69FD   02BD 00F8
        B       L_69EF                          ; 69FF   0220 0011

L_6A01:
        PSHR    R3                              ; 6A01   0273
        MVI     G_01BD, R3                      ; 6A02   0283 01BD
        SUBI    #$0002, R3                      ; 6A04   033B 0002
        BMI     L_6A1D                          ; 6A06   020B 0015

        MVO     R3,     G_01BD                  ; 6A08   0243 01BD
        MOVR    R4,     R3                      ; 6A0A   00A3
        NEGR    R3                              ; 6A0B   0023
        SAR     R3,     2                       ; 6A0C   006F
        MOVR    R3,     R4                      ; 6A0D   009C
        PULR    R3                              ; 6A0E   02B3
        SAR     R1,     1                       ; 6A0F   0069
        SLL     R1,     1                       ; 6A10   0049
        BEQ     L_6A19                          ; 6A11   0204 0006
        BPL     L_6A17                          ; 6A13   0203 0002

        ADDI    #$0004, R1                      ; 6A15   02F9 0004
L_6A17:
        SUBI    #$0002, R1                      ; 6A17   0339 0002
L_6A19:
        SUBI    #$0002, R0                      ; 6A19   0338 0002
        B       L_69EF                          ; 6A1B   0220 002D

L_6A1D:
        PULR    R3                              ; 6A1D   02B3
        SWAP    R3,     1                       ; 6A1E   0043
        ANDI    #$00FF, R3                      ; 6A1F   03BB 00FF
        CMPI    #$00DC, R3                      ; 6A21   037B 00DC
        BLE     L_6A26                          ; 6A23   0206 0001

        CLRR    R3                              ; 6A25   01DB
L_6A26:
        MVO     R3,     G_032C                  ; 6A26   0243 032C
        MOVR    R3,     R1                      ; 6A28   0099
        SWAP    R2,     1                       ; 6A29   0042
        ANDI    #$00FF, R2                      ; 6A2A   03BA 00FF
        CMPI    #$00DC, R2                      ; 6A2C   037A 00DC
        BLE     L_6A31                          ; 6A2E   0206 0001

        CLRR    R2                              ; 6A30   01D2
L_6A31:
        MVO     R2,     G_0324                  ; 6A31   0242 0324
        MVII    #$0004, R3                      ; 6A33   02BB 0004
        MOVR    R7,     R4                      ; 6A35   00BC
        ADDI    #$00AD, R4                      ; 6A36   02FC 00AD
        CMPI    #$0021, R1                      ; 6A38   0379 0021
        BLE     L_6A47                          ; 6A3A   0206 000B

        ADDR    R3,     R4                      ; 6A3C   00DC
        CMPI    #$003D, R2                      ; 6A3D   037A 003D
        BLE     L_6A47                          ; 6A3F   0206 0006

        ADDR    R3,     R4                      ; 6A41   00DC
        CMPI    #$0054, R2                      ; 6A42   037A 0054
        BLE     L_6A47                          ; 6A44   0206 0001

        ADDR    R3,     R4                      ; 6A46   00DC
L_6A47:
        MVO     R4,     G_0339                  ; 6A47   0244 0339
        ADDR    R3,     R4                      ; 6A49   00DC
        MVO     R4,     G_0334                  ; 6A4A   0244 0334

        JSR     R5,     L_6C03                  ; 6A4C   0004 016C 0003

        MVO     R1,     G_0196                  ; 6A4F   0241 0196
        MOVR    R1,     R5                      ; 6A51   008D
        ADDI    #$01A2, R5                      ; 6A52   02FD 01A2
        MVI@    R5,     R4                      ; 6A54   02AC
        MVO     R4,     G_0198                  ; 6A55   0244 0198
        MVI     G_0324, R2                      ; 6A57   0282 0324
        MVI     G_032C, R3                      ; 6A59   0283 032C

        JSR     R5,     G_E083                  ; 6A5B   0004 01E0 0083

        MVO     R2,     G_0197                  ; 6A5E   0242 0197
        MOVR    R1,     R0                      ; 6A60   0088
        CLRR    R3                              ; 6A61   01DB

        JSR     R5,     L_6D4E                  ; 6A62   0004 016C 014E

        MVI     G_0324, R2                      ; 6A65   0282 0324
        MVI     G_032C, R1                      ; 6A67   0281 032C
        MVII    #$0001, R5                      ; 6A69   02BD 0001
        MVO     R5,     G_01B2                  ; 6A6B   0245 01B2
        INCR    R7                              ; 6A6D   000F
L_6A6E:
        PSHR    R5                              ; 6A6E   0275
L_6A6F:
        CMPI    #$0014, R1                      ; 6A6F   0379 0014
        BGE     L_6A76                          ; 6A71   020D 0003

        CLRR    R1                              ; 6A73   01C9
        B       L_6A8A                          ; 6A74   0200 0014

L_6A76:
        CMPI    #$003C, R2                      ; 6A76   037A 003C
        BLT     L_6A7E                          ; 6A78   0205 0004

        CMPI    #$0057, R2                      ; 6A7A   037A 0057
        BLT     L_6A80                          ; 6A7C   0205 0002

L_6A7E:
        ADDI    #$000C, R1                      ; 6A7E   02F9 000C
L_6A80:
        ADDI    #$000A, R1                      ; 6A80   02F9 000A
        SAR     R1,     2                       ; 6A82   006D
        SAR     R1,     2                       ; 6A83   006D
        CMPI    #$0007, R1                      ; 6A84   0379 0007
        BLE     L_6A8A                          ; 6A86   0206 0002

        MVII    #$0007, R1                      ; 6A88   02B9 0007
L_6A8A:
        MVO     R1,     G_01B7                  ; 6A8A   0241 01B7
        CLRR    R0                              ; 6A8C   01C0
        CMP     G_01C4, R1                      ; 6A8D   0341 01C4
        BEQ     L_6A96                          ; 6A8F   0204 0005

        MVII    #$0002, R0                      ; 6A91   02B8 0002
        BGT     L_6A96                          ; 6A93   020E 0001

        NEGR    R0                              ; 6A95   0020
L_6A96:
        MVO     R0,     G_01B5                  ; 6A96   0240 01B5
        CMPI    #$0004, R1                      ; 6A98   0379 0004
        BGT     L_6ABA                          ; 6A9A   020E 001E

        TSTR    R1                              ; 6A9C   0089
        BNEQ    L_6AB3                          ; 6A9D   020C 0014

        MVII    #$0019, R2                      ; 6A9F   02BA 0019
        MVO     R2,     G_01B6                  ; 6AA1   0242 01B6
        CMP     G_01C4, R1                      ; 6AA3   0341 01C4
        BNEQ    L_6AD3                          ; 6AA5   020C 002C

        CLRR    R0                              ; 6AA7   01C0
        CMP     G_0172, R2                      ; 6AA8   0342 0172
        BEQ     L_6ADF                          ; 6AAA   0204 0033

        MVII    #$0004, R0                      ; 6AAC   02B8 0004
        BGT     L_6ADF                          ; 6AAE   020E 002F

        NEGR    R0                              ; 6AB0   0020
        B       L_6ADF                          ; 6AB1   0200 002C

L_6AB3:
        SUBI    #$0035, R2                      ; 6AB3   033A 0035
        BPL     L_6ACD                          ; 6AB5   0203 0016

        CLRR    R2                              ; 6AB7   01D2
        B       L_6ACD                          ; 6AB8   0200 0013

L_6ABA:
        SUBI    #$0018, R2                      ; 6ABA   033A 0018
        BPL     L_6ABF                          ; 6ABC   0203 0001

        CLRR    R2                              ; 6ABE   01D2
L_6ABF:
        CMPI    #$0096, R2                      ; 6ABF   037A 0096
        BLE     L_6AC5                          ; 6AC1   0206 0002

        MVII    #$0096, R2                      ; 6AC3   02BA 0096
L_6AC5:
        MOVR    R2,     R1                      ; 6AC5   0091
        MVII    #$0005, R2                      ; 6AC6   02BA 0005

        JSR     R5,     X_DIV                   ; 6AC8   0004 011C 01FB

        MOVR    R0,     R2                      ; 6ACB   0082
        SLL     R2,     1                       ; 6ACC   004A
L_6ACD:
        CMPI    #$0028, R2                      ; 6ACD   037A 0028
        BLE     L_6AD3                          ; 6ACF   0206 0002

        MVII    #$0028, R2                      ; 6AD1   02BA 0028
L_6AD3:
        MVO     R2,     G_01B6                  ; 6AD3   0242 01B6
        CLRR    R0                              ; 6AD5   01C0
        CMP     G_0172, R2                      ; 6AD6   0342 0172
        BEQ     L_6ADF                          ; 6AD8   0204 0005

        MVII    #$0006, R0                      ; 6ADA   02B8 0006
        BGT     L_6ADF                          ; 6ADC   020E 0001

        NEGR    R0                              ; 6ADE   0020
L_6ADF:
        MVO     R0,     G_01B4                  ; 6ADF   0240 01B4
L_6AE1:
        CLRR    R0                              ; 6AE1   01C0
L_6AE2:
        PULR    R7                              ; 6AE2   02B7
        DECLE   $0000,  $0001                   ; 6AE3   0000 0001

        EIS                                     ; 6AE5   0002

        JSR     R4,     .STIC.X.4               ; 6AE6   0004 0000 0004
        DECLE   $0005                           ; 6AE9   0005

        CLRC                                    ; 6AEA   0006
        DECLE   $0000                           ; 6AEB   0000

        DIS                                     ; 6AEC   0003
        DECLE   $0005                           ; 6AED   0005

        SETC                                    ; 6AEE   0007
        DECLE   $0000                           ; 6AEF   0000

        EIS                                     ; 6AF0   0002
        DIS                                     ; 6AF1   0003
        INCR    R0                              ; 6AF2   0008
L_6AF3:
        PSHR    R5                              ; 6AF3   0275
        MVII    #$017A, R5                      ; 6AF4   02BD 017A
L_6AF6:
        PSHR    R1                              ; 6AF6   0271
        MVI@    R5,     R1                      ; 6AF7   02A9
        ANDI    #$000F, R1                      ; 6AF8   03B9 000F
        CMPR    R0,     R1                      ; 6AFA   0141
        PULR    R1                              ; 6AFB   02B1
        BEQ     L_6B04                          ; 6AFC   0204 0006

        CMPI    #$0180, R5                      ; 6AFE   037D 0180
        BLT     L_6AF6                          ; 6B00   0225 000B

        CLRC                                    ; 6B02   0006
        PULR    R7                              ; 6B03   02B7
L_6B04:
        DECR    R5                              ; 6B04   0015
        SETC                                    ; 6B05   0007
        PULR    R7                              ; 6B06   02B7
L_6B07:
        PSHR    R5                              ; 6B07   0275
        MVI     G_035D, R0                      ; 6B08   0280 035D
        CMP     G_0344, R0                      ; 6B0A   0340 0344
        BEQ     L_6B22                          ; 6B0C   0204 0014

        MVI     G_01C4, R4                      ; 6B0E   0284 01C4
        DECR    R4                              ; 6B10   0014
        CMPI    #$0004, R4                      ; 6B11   037C 0004
        BNC     L_6B22                          ; 6B13   0209 000D

        MVII    #$0190, R1                      ; 6B15   02B9 0190
L_6B17:
        MVI@    R1,     R0                      ; 6B17   0288
        CMPI    #$0040, R0                      ; 6B18   0378 0040
        BLT     L_6B26                          ; 6B1A   0205 000A

        SUBI    #$0003, R1                      ; 6B1C   0339 0003
        CMPI    #$0187, R1                      ; 6B1E   0379 0187
L_6B20:
        BGT     L_6B17                          ; 6B20   022E 000A

L_6B22:
        CLRR    R0                              ; 6B22   01C0
        MVO     R0,     G_01AF                  ; 6B23   0240 01AF
        PULR    R7                              ; 6B25   02B7
L_6B26:
        ANDI    #$000F, R0                      ; 6B26   03B8 000F

        JSR     R5,     L_6AF3                  ; 6B28   0004 0168 02F3

        BNC     L_6B82                          ; 6B2B   0209 0055

        TSTR    R4                              ; 6B2D   00A4
        BPL     L_6B3C                          ; 6B2E   0203 000C

        MOVR    R0,     R1                      ; 6B30   0081
        SLL     R1,     2                       ; 6B31   004D
        SLL     R1,     1                       ; 6B32   0049
        SDBD                                    ; 6B33   0001
        ADDI    #$4105, R1                      ; 6B34   02F9 0005 0041
        MVI@    R1,     R5                      ; 6B37   028D
        CMPI    #$0019, R5                      ; 6B38   037D 0019
        BLE     L_6B22                          ; 6B3A   0226 0019

L_6B3C:
        CMP     G_01AF, R0                      ; 6B3C   0340 01AF
        BEQ     L_6B47                          ; 6B3E   0204 0007

        MVO     R0,     G_01AF                  ; 6B40   0240 01AF
L_6B42:
        MVII    #$0002, R0                      ; 6B42   02B8 0002
        MVO     R0,     G_012D                  ; 6B44   0240 012D
L_6B46:
        PULR    R7                              ; 6B46   02B7
L_6B47:
        MVO     R0,     G_01AF                  ; 6B47   0240 01AF
        MVI     G_01AF, R1                      ; 6B49   0281 01AF
        MVI     .BTAB.14,R5                     ; 6B4B   0285 0214
        ANDI    #$00FF, R5                      ; 6B4D   03BD 00FF
        MVI     G_035D, R4                      ; 6B4F   0284 035D
        CMP     G_0349, R4                      ; 6B51   0344 0349
        BGE     L_6B56                          ; 6B53   020D 0001

        CLRR    R4                              ; 6B55   01E4
L_6B56:
        XORR    R4,     R5                      ; 6B56   01E5
        SLL     R1,     2                       ; 6B57   004D
        BEQ     L_6B46                          ; 6B58   0224 0013

        SLL     R1,     1                       ; 6B5A   0049
        SDBD                                    ; 6B5B   0001
        ADDI    #$4106, R1                      ; 6B5C   02F9 0006 0041
        MVI@    R1,     R1                      ; 6B5F   0289
        CMPI    #$0030, R1                      ; 6B60   0379 0030
        BGT     L_6B6D                          ; 6B62   020E 0009

        CMPI    #$009B, R5                      ; 6B64   037D 009B
        BEQ     L_6B42                          ; 6B66   0224 0025

        JSR     R5,     L_6D84                  ; 6B68   0004 016C 0184

        B       L_6B74                          ; 6B6B   0200 0007

L_6B6D:
        CMPI    #$0003, R5                      ; 6B6D   037D 0003
        BEQ     L_6B42                          ; 6B6F   0224 002E

        JSR     R5,     L_6D81                  ; 6B71   0004 016C 0181

L_6B74:
        MVI     G_0173, R1                      ; 6B74   0281 0173
        MVII    #$0080, R0                      ; 6B76   02B8 0080
        MVO     R0,     G_0173                  ; 6B78   0240 0173
L_6B7A:
        CMP     G_0173, R0                      ; 6B7A   0340 0173
        BEQ     L_6B7A                          ; 6B7C   0224 0003

        MVO     R1,     G_0173                  ; 6B7E   0241 0173
        B       L_6B42                          ; 6B80   0220 003F

L_6B82:
        MVII    #$0050, R1                      ; 6B82   02B9 0050
        XORR    R0,     R1                      ; 6B84   01C1
        MVO     R1,     G_017F                  ; 6B85   0241 017F
        B       L_6B3C                          ; 6B87   0220 004C

L_6B89:
        MVI     G_0172, R2                      ; 6B89   0282 0172
        MVI     G_01C4, R1                      ; 6B8B   0281 01C4
        TSTR    R1                              ; 6B8D   0089
        BEQ     L_6BAE                          ; 6B8E   0204 001E

        MOVR    R1,     R0                      ; 6B90   0088
        MVII    #$0003, R4                      ; 6B91   02BC 0003
        MOVR    R4,     R1                      ; 6B93   00A1
        SUBI    #$000E, R2                      ; 6B94   033A 000E
        BMI     L_6BA3                          ; 6B96   020B 000B

        ADDR    R4,     R1                      ; 6B98   00E1
        SUBI    #$0007, R2                      ; 6B99   033A 0007
        BMI     L_6BA3                          ; 6B9B   020B 0006

        ADDR    R4,     R1                      ; 6B9D   00E1
        SUBI    #$0007, R2                      ; 6B9E   033A 0007
        BMI     L_6BA3                          ; 6BA0   020B 0001

        ADDR    R4,     R1                      ; 6BA2   00E1
L_6BA3:
        CMPR    R4,     R0                      ; 6BA3   0160
        BLT     L_6BAE                          ; 6BA4   0205 0008

        ADDI    #$000C, R1                      ; 6BA6   02F9 000C
        CMPI    #$0005, R0                      ; 6BA8   0378 0005
        BLT     L_6BAE                          ; 6BAA   0205 0002

        ADDI    #$000C, R1                      ; 6BAC   02F9 000C
L_6BAE:
        ADDR    R7,     R1                      ; 6BAE   00F9
        ADDI    #$00AC, R1                      ; 6BAF   02F9 00AC
        MVII    #$017A, R4                      ; 6BB1   02BC 017A
        CLRR    R0                              ; 6BB3   01C0
L_6BB4:
        MVI@    R1,     R3                      ; 6BB4   028B
        INCR    R1                              ; 6BB5   0009
        MOVR    R3,     R2                      ; 6BB6   009A
        SAR     R3,     2                       ; 6BB7   006F
        SAR     R3,     2                       ; 6BB8   006F
        ANDI    #$000F, R2                      ; 6BB9   03BA 000F
        XORR    R0,     R3                      ; 6BBB   01C3
        MVO@    R3,     R4                      ; 6BBC   0263
        ADDI    #$0010, R0                      ; 6BBD   02F8 0010
        XORR    R0,     R2                      ; 6BBF   01C2
        MVO@    R2,     R4                      ; 6BC0   0262
        ADDI    #$0010, R0                      ; 6BC1   02F8 0010
        CMPI    #$0180, R4                      ; 6BC3   037C 0180
        BLT     L_6BB4                          ; 6BC5   0225 0012

L_6BC7:
        MVII    #$017A, R4                      ; 6BC7   02BC 017A
        MVO     R4,     G_0339                  ; 6BC9   0244 0339
        ADDI    #$0006, R4                      ; 6BCB   02FC 0006
        MVO     R4,     G_0334                  ; 6BCD   0244 0334
        MVI@    R4,     R0                      ; 6BCF   02A0
        CMPI    #$001D, R0                      ; 6BD0   0378 001D
        BNEQ    L_6BEC                          ; 6BD2   020C 0018

        MVI     G_0196, R1                      ; 6BD4   0281 0196
        CMPI    #$0009, R1                      ; 6BD6   0379 0009
        BGE     L_6BFC                          ; 6BD8   020D 0022

        MVO     R1,     G_01B3                  ; 6BDA   0241 01B3
L_6BDC:
        PSHR    R5                              ; 6BDC   0275
L_6BDD:
        MVI     G_0339, R4                      ; 6BDD   0284 0339
        MOVR    R4,     R5                      ; 6BDF   00A5
L_6BE0:
        MVI@    R4,     R0                      ; 6BE0   02A0
        ANDI    #$000F, R0                      ; 6BE1   03B8 000F
        CMPR    R1,     R0                      ; 6BE3   0148
        BEQ     L_6BEB                          ; 6BE4   0204 0005

        CMP     G_0334, R4                      ; 6BE6   0344 0334
        BLT     L_6BE0                          ; 6BE8   0225 0009

        MVO@    R1,     R5                      ; 6BEA   0269
L_6BEB:
        PULR    R7                              ; 6BEB   02B7
L_6BEC:
        PSHR    R5                              ; 6BEC   0275
        MVI     G_0181, R1                      ; 6BED   0281 0181
        ANDI    #$000F, R1                      ; 6BEF   03B9 000F

        JSR     R5,     L_6BDC                  ; 6BF1   0004 0168 03DC

        DECR    R4                              ; 6BF4   0014
        CMPR    R0,     R1                      ; 6BF5   0141
        BNEQ    L_6BF9                          ; 6BF6   020C 0001

        MVI@    R4,     R1                      ; 6BF8   02A1
L_6BF9:
        MVO     R1,     G_0181                  ; 6BF9   0241 0181
        PULR    R7                              ; 6BFB   02B7
L_6BFC:
        SDBD                                    ; 6BFC   0001
        MVII    #$416B, R4                      ; 6BFD   02BC 006B 0041
        MVI@    R4,     R2                      ; 6C00   02A2
        INCR    R4                              ; 6C01   000C
        MVI@    R4,     R1                      ; 6C02   02A1
L_6C03:
        PSHR    R5                              ; 6C03   0275
        MVII    #$00FF, R3                      ; 6C04   02BB 00FF
        MVII    #$0182, R4                      ; 6C06   02BC 0182
        MOVR    R4,     R5                      ; 6C08   00A5
L_6C09:
        MVO@    R3,     R4                      ; 6C09   0263
        CMPI    #$0186, R4                      ; 6C0A   037C 0186
        BNEQ    L_6C09                          ; 6C0C   022C 0004

        MVII    #$0116, R3                      ; 6C0E   02BB 0116
        MVO     R2,     G_0324                  ; 6C10   0242 0324
        MVO     R1,     G_032C                  ; 6C12   0241 032C
        MVI     G_0339, R4                      ; 6C14   0284 0339
L_6C16:
        MVI@    R4,     R1                      ; 6C16   02A1
        ANDI    #$000F, R1                      ; 6C17   03B9 000F
        CMPI    #$0009, R1                      ; 6C19   0379 0009
        BGE     L_6C31                          ; 6C1B   020D 0014

        PSHR    R4                              ; 6C1D   0274
        MVO@    R1,     R3                      ; 6C1E   0259
        INCR    R3                              ; 6C1F   000B
        PSHR    R3                              ; 6C20   0273
        PSHR    R5                              ; 6C21   0275
        MVI     G_0324, R2                      ; 6C22   0282 0324
        MVI     G_032C, R3                      ; 6C24   0283 032C
        MOVR    R1,     R5                      ; 6C26   008D
        ADDI    #$0199, R5                      ; 6C27   02FD 0199
        MVI@    R5,     R4                      ; 6C29   02AC

        JSR     R5,     G_E080                  ; 6C2A   0004 01E0 0080

        PULR    R5                              ; 6C2D   02B5
        MVO@    R2,     R5                      ; 6C2E   026A
        PULR    R3                              ; 6C2F   02B3
        PULR    R4                              ; 6C30   02B4
L_6C31:
        CMP     G_0334, R4                      ; 6C31   0344 0334
        BLT     L_6C16                          ; 6C33   0225 001E

        MVII    #$0002, R4                      ; 6C35   02BC 0002
        MVII    #$0182, R2                      ; 6C37   02BA 0182
L_6C39:
        MVII    #$0116, R3                      ; 6C39   02BB 0116
        MVI@    R3,     R1                      ; 6C3B   0299
        MVI@    R2,     R0                      ; 6C3C   0290
        MOVR    R2,     R5                      ; 6C3D   0095
L_6C3E:
        CMP@    R2,     R0                      ; 6C3E   0350
        BLE     L_6C44                          ; 6C3F   0206 0003

        MOVR    R2,     R5                      ; 6C41   0095
        MVI@    R2,     R0                      ; 6C42   0290
        MVI@    R3,     R1                      ; 6C43   0299
L_6C44:
        INCR    R3                              ; 6C44   000B
        INCR    R2                              ; 6C45   000A
        CMPI    #$0186, R2                      ; 6C46   037A 0186
        BLT     L_6C3E                          ; 6C48   0225 000B

        MVO     R1,     G_01B3                  ; 6C4A   0241 01B3
        DECR    R4                              ; 6C4C   0014
        BEQ     L_6BDD                          ; 6C4D   0224 0071

        MVI     G_01B2, R3                      ; 6C4F   0283 01B2
        TSTR    R3                              ; 6C51   009B
        BEQ     L_6BDD                          ; 6C52   0224 0076

        SUBI    #$0004, R2                      ; 6C54   033A 0004
        MVII    #$00FF, R0                      ; 6C56   02B8 00FF
        MVO@    R0,     R5                      ; 6C58   0268
        B       L_6C39                          ; 6C59   0220 0021

        JSRE    R4,     G_281F                  ; 6C5B   0004 0029 001F
        DECLE   $0005                           ; 6C5E   0005

        SLL     R0,     2                       ; 6C5F   004C
        TSTR    R3                              ; 6C60   009B
        DECLE   $0005                           ; 6C61   0005

        RSWD    R4                              ; 6C62   003C
        MOVR    R5,     R3                      ; 6C63   00AB
        DECLE   $0005                           ; 6C64   0005

        RSWD    R1                              ; 6C65   0039
        MOVR    R5,     R3                      ; 6C66   00AB
        EIS                                     ; 6C67   0002
        RSWD    R1                              ; 6C68   0039
        MOVR    R5,     R4                      ; 6C69   00AC
L_6C6A:
        DECLE   $0005                           ; 6C6A   0005

        NOP                                     ; 6C6B   0034
        ADDR    R1,     R3                      ; 6C6C   00CB
        DECLE   $0005                           ; 6C6D   0005

        NOP                                     ; 6C6E   0034
        MOVR    R5,     R3                      ; 6C6F   00AB
L_6C70:
        DECLE   $0005                           ; 6C70   0005

        GSWD    R2                              ; 6C71   0032
        MOVR    R5,     R3                      ; 6C72   00AB
        DECLE   $0005                           ; 6C73   0005

        GSWD    R2                              ; 6C74   0032
        MOVR    R5,     R1                      ; 6C75   00A9
        SWAP    R1,     2                       ; 6C76   0045
        SLR     R3,     2                       ; 6C77   0067
        ADDR    R7,     R7                      ; 6C78   00FF
        RLC     R2,     2                       ; 6C79   0056
        DECLE   $0037                           ; 6C7A   0037

        ADDR    R7,     R7                      ; 6C7B   00FF
        SLLC    R0,     1                       ; 6C7C   0058
        DECLE   $0037                           ; 6C7D   0037

        ADDR    R7,     R7                      ; 6C7E   00FF
        ADCR    R0                              ; 6C7F   0028
        DECLE   $0037                           ; 6C80   0037

        ADDR    R7,     R7                      ; 6C81   00FF
L_6C82:
        PSHR    R5                              ; 6C82   0275
L_6C83:
        MVII    #$032F, R1                      ; 6C83   02B9 032F
        MVII    #$00AA, R0                      ; 6C85   02B8 00AA
L_6C87:
        MVO@    R0,     R1                      ; 6C87   0248
        ADDI    #$0008, R1                      ; 6C88   02F9 0008
        CMPI    #$0357, R1                      ; 6C8A   0379 0357
        BLE     L_6C87                          ; 6C8C   0226 0006

        MVII    #$017A, R4                      ; 6C8E   02BC 017A
L_6C90:
        SDBD                                    ; 6C90   0001
        MVII    #$8800, R2                      ; 6C91   02BA 0000 0088
        XOR     G_0132, R2                      ; 6C94   03C2 0132
        MVI@    R4,     R0                      ; 6C96   02A0
        MOVR    R0,     R1                      ; 6C97   0081
        ANDI    #$000F, R0                      ; 6C98   03B8 000F
        CMP     G_01B3, R0                      ; 6C9A   0340 01B3
        BNEQ    L_6CA4                          ; 6C9C   020C 0006

        SDBD                                    ; 6C9E   0001
        MVII    #$8807, R2                      ; 6C9F   02BA 0007 0088
        B       L_6CAE                          ; 6CA2   0200 000A

L_6CA4:
        CMPI    #$0009, R0                      ; 6CA4   0378 0009
        BLT     L_6CAE                          ; 6CA6   0205 0006

        SDBD                                    ; 6CA8   0001
        MVII    #$8800, R2                      ; 6CA9   02BA 0000 0088
        XOR     G_0131, R2                      ; 6CAC   03C2 0131
L_6CAE:
        CMPI    #$000E, R0                      ; 6CAE   0378 000E
        BGE     L_6D32                          ; 6CB0   020D 0080

        XORR    R0,     R1                      ; 6CB2   01C1
        SAR     R1,     1                       ; 6CB3   0069
        ADDI    #$032D, R1                      ; 6CB4   02F9 032D
        MVO@    R2,     R1                      ; 6CB6   024A
        PSHR    R1                              ; 6CB7   0271

        JSR     R5,     L_6D40                  ; 6CB8   0004 016C 0140

        BEQ     L_6D0E                          ; 6CBB   0204 0051

L_6CBD:
        MVII    #$0200, R5                      ; 6CBD   02BD 0200
        XORR    R2,     R5                      ; 6CBF   01D5
        SDBD                                    ; 6CC0   0001
        MVII    #$6080, R3                      ; 6CC1   02BB 0080 0060
        PSHR    R0                              ; 6CC4   0270
        MOVR    R0,     R2                      ; 6CC5   0082
        SLL     R2,     1                       ; 6CC6   004A
        ADDR    R2,     R0                      ; 6CC7   00D0
        SUBI    #$001B, R0                      ; 6CC8   0338 001B
        BPL     L_6CCE                          ; 6CCA   0203 0002

        MVII    #$000F, R0                      ; 6CCC   02B8 000F
L_6CCE:
        ADDI    #$0189, R0                      ; 6CCE   02F8 0189
        MOVR    R0,     R1                      ; 6CD0   0081
        MVI@    R1,     R0                      ; 6CD1   0288
        SLL     R2,     2                       ; 6CD2   004E
        ADD     G_0351, R2                      ; 6CD3   02C2 0351
        MVI@    R2,     R1                      ; 6CD5   0291
        CMPI    #$0080, R1                      ; 6CD6   0379 0080
        BLT     L_6CE1                          ; 6CD8   0205 0007

        NEGR    R1                              ; 6CDA   0021
        ANDI    #$007F, R1                      ; 6CDB   03B9 007F
        SDBD                                    ; 6CDD   0001
        ANDI    #$FDFF, R5                      ; 6CDE   03BD 00FF 00FD
L_6CE1:
        SLL     R1,     1                       ; 6CE1   0049
        CMPR    R0,     R1                      ; 6CE2   0141
        BGE     L_6CEB                          ; 6CE3   020D 0006

        XORI    #$0200, R5                      ; 6CE5   03FD 0200
        SDBD                                    ; 6CE7   0001
        ADDI    #$002C, R3                      ; 6CE8   02FB 002C 0000
L_6CEB:
        PULR    R0                              ; 6CEB   02B0
        TSTR    R0                              ; 6CEC   0080
        BNEQ    L_6CF2                          ; 6CED   020C 0003

        DECR    R0                              ; 6CEF   0010
        B       L_6CF4                          ; 6CF0   0200 0002

L_6CF2:
        CMP     G_01AF, R0                      ; 6CF2   0340 01AF
L_6CF4:
        MVI     G_01C4, R1                      ; 6CF4   0281 01C4
        MVII    #$01C0, R0                      ; 6CF6   02B8 01C0
        BEQ     L_6CFD                          ; 6CF8   0204 0003

        TSTR    R1                              ; 6CFA   0089
        BNEQ    L_6D21                          ; 6CFB   020C 0024

L_6CFD:
        XORI    #$0200, R5                      ; 6CFD   03FD 0200
        MVI@    R2,     R1                      ; 6CFF   0291
        INCR    R2                              ; 6D00   000A
        XOR@    R2,     R1                      ; 6D01   03D1
        CMPI    #$0080, R1                      ; 6D02   0379 0080
        BLT     L_6D21                          ; 6D04   0205 001B

        SDBD                                    ; 6D06   0001
        MVII    #$60AC, R3                      ; 6D07   02BB 00AC 0060
        XORI    #$0200, R5                      ; 6D0A   03FD 0200
        B       L_6D21                          ; 6D0C   0200 0013

L_6D0E:
        SDBD                                    ; 6D0E   0001
        MVII    #$606D, R3                      ; 6D0F   02BB 006D 0060
        MOVR    R2,     R5                      ; 6D12   0095
        MOVR    R0,     R2                      ; 6D13   0082
        SLL     R0,     2                       ; 6D14   004C
        SLL     R0,     2                       ; 6D15   004C
        SLL     R0,     1                       ; 6D16   0048
        CMPI    #$0009, R2                      ; 6D17   037A 0009
        BLT     L_6D21                          ; 6D19   0205 0006

        SDBD                                    ; 6D1B   0001
        ADDI    #$0026, R3                      ; 6D1C   02FB 0026 0000
        MVII    #$0004, R0                      ; 6D1F   02B8 0004
L_6D21:
        PULR    R2                              ; 6D21   02B2
        MVO@    R5,     R2                      ; 6D22   0255
        CLRR    R5                              ; 6D23   01ED
        INCR    R2                              ; 6D24   000A
        CMP@    R2,     R3                      ; 6D25   0353
        BNEQ    L_6D2C                          ; 6D26   020C 0004

        ADDI    #$0004, R2                      ; 6D28   02FA 0004
        B       L_6D32                          ; 6D2A   0200 0006

L_6D2C:
        MVO@    R3,     R2                      ; 6D2C   0253
        ADDI    #$0005, R2                      ; 6D2D   02FA 0005
        MVO@    R5,     R2                      ; 6D2F   0255
        DECR    R2                              ; 6D30   0012
        MVO@    R0,     R2                      ; 6D31   0250
L_6D32:
        CMPI    #$0180, R4                      ; 6D32   037C 0180
        BLT     L_6C90                          ; 6D34   0225 00A5

        MVII    #$00FF, R1                      ; 6D36   02B9 00FF
        MVII    #$0005, R0                      ; 6D38   02B8 0005
        MVII    #$0182, R4                      ; 6D3A   02BC 0182

        JSR     R5,     X_FILL_MEM              ; 6D3C   0004 0114 0341

        PULR    R7                              ; 6D3F   02B7
L_6D40:
        PSHR    R5                              ; 6D40   0275
        ANDI    #$000F, R0                      ; 6D41   03B8 000F
        PSHR    R0                              ; 6D43   0270
        SUBI    #$000D, R0                      ; 6D44   0338 000D
        NEGR    R0                              ; 6D46   0020

        JSR     R5,     X_POW2                  ; 6D47   0004 0114 0345

        AND     G_035C, R0                      ; 6D4A   0380 035C
        PULR    R0                              ; 6D4C   02B0
        PULR    R7                              ; 6D4D   02B7
L_6D4E:
        PSHR    R5                              ; 6D4E   0275
L_6D4F:
        MOVR    R0,     R1                      ; 6D4F   0081
        SUBI    #$000D, R0                      ; 6D50   0338 000D
        BGT     L_6D71                          ; 6D52   020E 001D

        NEGR    R0                              ; 6D54   0020
        TSTR    R3                              ; 6D55   009B
        BEQ     L_6D5E                          ; 6D56   0204 0006

        JSR     R5,     X_SET_BIT               ; 6D58   0004 0114 02DB

        CMP@    R3,     R4                      ; 6D5B   035C
        B       L_6D62                          ; 6D5C   0200 0004

L_6D5E:
        JSR     R5,     X_CLR_BIT               ; 6D5E   0004 0114 02E6

        CMP@    R3,     R4                      ; 6D61   035C
L_6D62:
        MVII    #$017A, R4                      ; 6D62   02BC 017A
        MOVR    R1,     R0                      ; 6D64   0088
L_6D65:
        MVI@    R4,     R1                      ; 6D65   02A1
        MOVR    R1,     R2                      ; 6D66   008A
        ANDI    #$000F, R2                      ; 6D67   03BA 000F
        XORR    R2,     R1                      ; 6D69   01D1
        CMPR    R2,     R0                      ; 6D6A   0150
        BEQ     L_6D72                          ; 6D6B   0204 0005

        CMPI    #$0180, R4                      ; 6D6D   037C 0180
        BLT     L_6D65                          ; 6D6F   0225 000B

L_6D71:
        PULR    R7                              ; 6D71   02B7
L_6D72:
        MOVR    R5,     R4                      ; 6D72   00AC
        SAR     R1,     1                       ; 6D73   0069
        ADDI    #$032D, R1                      ; 6D74   02F9 032D
        PSHR    R1                              ; 6D76   0271
        MVI@    R1,     R2                      ; 6D77   028A
        SDBD                                    ; 6D78   0001
        ANDI    #$FDFF, R2                      ; 6D79   03BA 00FF 00FD
        TSTR    R3                              ; 6D7C   009B
        BEQ     L_6CBD                          ; 6D7D   0224 00C1
        B       L_6D0E                          ; 6D7F   0220 0072

L_6D81:
        MVII    #$0060, R3                      ; 6D81   02BB 0060
        INCR    R7                              ; 6D83   000F
L_6D84:
        CLRR    R3                              ; 6D84   01DB
        PSHR    R5                              ; 6D85   0275
        SDBD                                    ; 6D86   0001
        MVII    #$4173, R5                      ; 6D87   02BD 0073 0041
        SDBD                                    ; 6D8A   0001
        MVII    #$DE08, R4                      ; 6D8B   02BC 0008 00DE
        MVII    #$0003, R1                      ; 6D8E   02B9 0003
L_6D90:
        PSHR    R1                              ; 6D90   0271
        MOVR    R5,     R2                      ; 6D91   00AA
        ADDI    #$000C, R2                      ; 6D92   02FA 000C
        MVI@    R4,     R1                      ; 6D94   02A1
        MOVR    R1,     R0                      ; 6D95   0088
L_6D96:
        SDBD                                    ; 6D96   0001
        ANDI    #$FFF0, R1                      ; 6D97   03B9 00F0 00FF
        CMPR    R3,     R1                      ; 6D9A   0159
        BGT     L_6DA2                          ; 6D9B   020E 0005

        INCR    R4                              ; 6D9D   000C
        MVI@    R4,     R0                      ; 6D9E   02A0
        ADDR    R0,     R1                      ; 6D9F   00C1
        B       L_6D96                          ; 6DA0   0220 000B

L_6DA2:
        PSHR    R3                              ; 6DA2   0273
        SUBR    R3,     R1                      ; 6DA3   0119
        ANDI    #$000F, R0                      ; 6DA4   03B8 000F
        XORR    R1,     R0                      ; 6DA6   01C8
L_6DA7:
        MVI@    R4,     R1                      ; 6DA7   02A1
        MOVR    R0,     R3                      ; 6DA8   0083
        ANDI    #$000F, R3                      ; 6DA9   03BB 000F
        SWAP    R3,     1                       ; 6DAB   0043
        SLL     R3,     2                       ; 6DAC   004F
        XORR    R3,     R1                      ; 6DAD   01D9
        SLR     R0,     2                       ; 6DAE   0064
        SLR     R0,     2                       ; 6DAF   0064
L_6DB0:
        CMPR    R5,     R2                      ; 6DB0   016A
        BEQ     L_6DBD                          ; 6DB1   0204 000A

        MVO@    R1,     R5                      ; 6DB3   0269
        SWAP    R1,     1                       ; 6DB4   0041
        MVO@    R1,     R5                      ; 6DB5   0269
        SWAP    R1,     1                       ; 6DB6   0041
        DECR    R0                              ; 6DB7   0010
        BNEQ    L_6DB0                          ; 6DB8   022C 0009

        MVI@    R4,     R0                      ; 6DBA   02A0
        B       L_6DA7                          ; 6DBB   0220 0015

L_6DBD:
        PULR    R3                              ; 6DBD   02B3
        PULR    R1                              ; 6DBE   02B1
        MVII    #$0030, R0                      ; 6DBF   02B8 0030
        MVO@    R0,     R5                      ; 6DC1   0268
        MVII    #$002B, R0                      ; 6DC2   02B8 002B
        MVO@    R0,     R5                      ; 6DC4   0268
        DECR    R1                              ; 6DC5   0011
        BEQ     L_6DE5                          ; 6DC6   0204 001D

        MVII    #$000D, R2                      ; 6DC8   02BA 000D
        CMPI    #$0001, R1                      ; 6DCA   0379 0001
        BEQ     L_6DD5                          ; 6DCC   0204 0007

        TSTR    R3                              ; 6DCE   009B
        BEQ     L_6DE0                          ; 6DCF   0204 000F

        SUBI    #$0002, R2                      ; 6DD1   033A 0002
        B       L_6DE0                          ; 6DD3   0200 000B

L_6DD5:
        MVII    #$0013, R2                      ; 6DD5   02BA 0013
        MVII    #$000F, R0                      ; 6DD7   02B8 000F
        DECR    R5                              ; 6DD9   0015
        MVO@    R0,     R5                      ; 6DDA   0268
        TSTR    R3                              ; 6DDB   009B
        BEQ     L_6DE0                          ; 6DDC   0204 0002

        SUBI    #$0006, R2                      ; 6DDE   033A 0006
L_6DE0:
        ADDI    #$001A, R5                      ; 6DE0   02FD 001A
        ADDR    R2,     R4                      ; 6DE2   00D4
        B       L_6D90                          ; 6DE3   0220 0054

L_6DE5:
        ADDI    #$001A, R5                      ; 6DE5   02FD 001A
        MVII    #$0006, R2                      ; 6DE7   02BA 0006
        MVII    #$0075, R0                      ; 6DE9   02B8 0075
        MVII    #$0089, R1                      ; 6DEB   02B9 0089
L_6DED:
        MVO@    R0,     R5                      ; 6DED   0268
        MVO@    R1,     R5                      ; 6DEE   0269
        DECR    R2                              ; 6DEF   0012
        BNEQ    L_6DED                          ; 6DF0   022C 0004

        MVII    #$007D, R0                      ; 6DF2   02B8 007D
        MVO@    R0,     R5                      ; 6DF4   0268
        MVO@    R1,     R5                      ; 6DF5   0269
        PULR    R7                              ; 6DF6   02B7
L_6DF7:
        PSHR    R5                              ; 6DF7   0275
        SLL     R3,     2                       ; 6DF8   004F
        SLL     R3,     2                       ; 6DF9   004F
        SDBD                                    ; 6DFA   0001
        MVII    #$4173, R5                      ; 6DFB   02BD 0073 0041
        MVII    #$000C, R0                      ; 6DFE   02B8 000C
L_6E00:
        PSHR    R0                              ; 6E00   0270
        MVI@    R4,     R0                      ; 6E01   02A0
        ADDR    R4,     R0                      ; 6E02   00E0
        PSHR    R0                              ; 6E03   0270
        CLRR    R1                              ; 6E04   01C9
L_6E05:
        MVI@    R4,     R0                      ; 6E05   02A0
        ADDR    R0,     R1                      ; 6E06   00C1
        SDBD                                    ; 6E07   0001
        ANDI    #$FFF0, R1                      ; 6E08   03B9 00F0 00FF
        CMPR    R3,     R1                      ; 6E0B   0159
        BGT     L_6E11                          ; 6E0C   020E 0003

        INCR    R4                              ; 6E0E   000C
        B       L_6E05                          ; 6E0F   0220 000B

L_6E11:
        SUBR    R3,     R1                      ; 6E11   0119
        PSHR    R3                              ; 6E12   0273
        MVII    #$0014, R2                      ; 6E13   02BA 0014
        B       L_6E19                          ; 6E15   0200 0002

L_6E17:
        MVI@    R4,     R1                      ; 6E17   02A1
        MOVR    R1,     R0                      ; 6E18   0088
L_6E19:
        ANDI    #$000F, R0                      ; 6E19   03B8 000F
        SAR     R1,     2                       ; 6E1B   006D
        SAR     R1,     2                       ; 6E1C   006D
        MVI@    R4,     R3                      ; 6E1D   02A3
        SWAP    R0,     1                       ; 6E1E   0040
        SLL     R0,     2                       ; 6E1F   004C
        XORR    R0,     R3                      ; 6E20   01C3
L_6E21:
        MVO@    R3,     R5                      ; 6E21   026B
        SWAP    R3,     1                       ; 6E22   0043
        MVO@    R3,     R5                      ; 6E23   026B
        SWAP    R3,     1                       ; 6E24   0043
        DECR    R2                              ; 6E25   0012
        BEQ     L_6E2D                          ; 6E26   0204 0005

        DECR    R1                              ; 6E28   0011
        BNEQ    L_6E21                          ; 6E29   022C 0009
        B       L_6E17                          ; 6E2B   0220 0015

L_6E2D:
        PULR    R3                              ; 6E2D   02B3
        PULR    R4                              ; 6E2E   02B4
        PULR    R0                              ; 6E2F   02B0
        DECR    R0                              ; 6E30   0010
        BNEQ    L_6E00                          ; 6E31   022C 0032

        PULR    R7                              ; 6E33   02B7
L_6E34:
        PSHR    R5                              ; 6E34   0275

        JSR     R5,     X_PLAY_SFX2             ; 6E35   0004 0118 03BE

        DECR    R4                              ; 6E38   0014
        CMPI    #$002D, R1                      ; 6E39   0379 002D
        DECLE   $0005                           ; 6E3B   0005

        SLR     R2,     1                       ; 6E3C   0062
        MOVR    R1,     R7                      ; 6E3D   008F
        DECR    R3                              ; 6E3E   0013
        AND@    R4,     R2                      ; 6E3F   03A2
        MOVR    R1,     R7                      ; 6E40   008F
        DECR    R3                              ; 6E41   0013
        ADD@    R1,     R7                      ; 6E42   02CF
L_6E43:
        PSHR    R5                              ; 6E43   0275

        JSR     R5,     X_PLAY_SFX2             ; 6E44   0004 0118 03BE

        DECR    R4                              ; 6E47   0014
        ADCR    R7                              ; 6E48   002F
        DECLE   $0279                           ; 6E49   0279

        XOR@    R1,     R5                      ; 6E4A   03CD
        INCR    R7                              ; 6E4B   000F
        XOR@    R3,     R0                      ; 6E4C   03D8
        INCR    R4                              ; 6E4D   000C
        SUBR    R5,     R4                      ; 6E4E   012C
        ANDR    R6,     R7                      ; 6E4F   01B7
        SUBR    R1,     R3                      ; 6E50   010B
        SUBR    R5,     R3                      ; 6E51   012B
        ADD@    R1,     R7                      ; 6E52   02CF
L_6E53:
        PSHR    R5                              ; 6E53   0275

        JSR     R5,     X_PLAY_SFX2             ; 6E54   0004 0118 03BE

        DECR    R4                              ; 6E57   0014
        ADCR    R7                              ; 6E58   002F
        ADDR    R7,     R1                      ; 6E59   00F9
        XOR@    R1,     R5                      ; 6E5A   03CD
        CMP@    R6,     R5                      ; 6E5B   0375
        DECR    R7                              ; 6E5C   0017
        INCR    R4                              ; 6E5D   000C
        INCR    R1                              ; 6E5E   0009
        BGE     L_6B20                          ; 6E5F   022D 0340

        SLLC    R1,     1                       ; 6E61   0059
        SUB@    R1,     R0                      ; 6E62   0308
        RSWD    R1                              ; 6E63   0039
        ADD     G_0024, R4                      ; 6E64   02C4 0024
        SLLC    R3,     1                       ; 6E66   005B
        XOR@    R1,     R6                      ; 6E67   03CE
        CMPR    R5,     R3                      ; 6E68   016B
        SARC    R1,     1                       ; 6E69   0079
        ADD@    R5,     R3                      ; 6E6A   02EB
        ADD@    R1,     R7                      ; 6E6B   02CF
L_6E6C:
        PSHR    R5                              ; 6E6C   0275

        JSR     R5,     X_PLAY_SFX2             ; 6E6D   0004 0118 03BE

        DECR    R4                              ; 6E70   0014
        ADCR    R7                              ; 6E71   002F
        CMPI    #$004F, R1                      ; 6E72   0379 004F
        INCR    R0                              ; 6E74   0008
        AND     .STIC.X.1,R0                    ; 6E75   0380 0001
        SUB@    R5,     R5                      ; 6E77   032D
        MOVR    R5,     R3                      ; 6E78   00AB
        XOR@    R1,     R5                      ; 6E79   03CD
        MOVR    R7,     R4                      ; 6E7A   00BC
        ADD@    R4,     R0                      ; 6E7B   02E0
        INCR    R3                              ; 6E7C   000B
        MOVR    R6,     R7                      ; 6E7D   00B7
        CMPI    #$002B, R1                      ; 6E7E   0379 002B
        XOR@    R5,     R1                      ; 6E80   03E9
        XORR    R0,     R3                      ; 6E81   01C3
        XOR@    R5,     R4                      ; 6E82   03EC
        ADD@    R1,     R7                      ; 6E83   02CF
        XOR@    R1,     R5                      ; 6E84   03CD
L_6E85:
        PSHR    R5                              ; 6E85   0275

        JSR     R5,     X_PLAY_SFX2             ; 6E86   0004 0118 03BE

        DECR    R4                              ; 6E89   0014
        ADCR    R7                              ; 6E8A   002F
        CMPI    #$03ED, R1                      ; 6E8B   0379 03ED
        INCR    R7                              ; 6E8D   000F
        XORI    #$0385, R6                      ; 6E8E   03FE 0385
        CMP@    R5,     R3                      ; 6E90   036B
        MVI@    R1,     R5                      ; 6E91   028D
        XOR@    R4,     R2                      ; 6E92   03E2
        AND@    R5,     R3                      ; 6E93   03AB
        ADD@    R1,     R5                      ; 6E94   02CD
L_6E95:
        GSWD    R3                              ; 6E95   0033
        SWAP    R0,     1                       ; 6E96   0040
        SUB     G_00C2, R5                      ; 6E97   0305 00C2
        DECR    R7                              ; 6E99   0017
        DECR    R4                              ; 6E9A   0014
        DIS                                     ; 6E9B   0003
        XOR@    R5,     R0                      ; 6E9C   03E8
        ADD@    R1,     R7                      ; 6E9D   02CF
L_6E9E:
        PSHR    R5                              ; 6E9E   0275

        JSR     R5,     X_PLAY_SFX2             ; 6E9F   0004 0118 03BE

        DECR    R4                              ; 6EA2   0014
        ADCR    R7                              ; 6EA3   002F
        SARC    R1,     1                       ; 6EA4   0079
        INCR    R4                              ; 6EA5   000C
        ANDR    R7,     R0                      ; 6EA6   01B8
        AND@    R6,     R7                      ; 6EA7   03B7
        CMP@    R1,     R3                      ; 6EA8   034B
        ADDR    R1,     R5                      ; 6EA9   00CD
        INCR    R7                              ; 6EAA   000F
        DECLE   $0005                           ; 6EAB   0005

        MOVR    R5,     R3                      ; 6EAC   00AB
        DECLE   $0235                           ; 6EAD   0235

        ADDR    R5,     R3                      ; 6EAE   00EB
        ADD@    R1,     R7                      ; 6EAF   02CF
L_6EB0:
        PSHR    R5                              ; 6EB0   0275

        JSR     R5,     X_PLAY_SFX2             ; 6EB1   0004 0118 03BE

        DECR    R4                              ; 6EB4   0014
        ADCR    R7                              ; 6EB5   002F
        MVO@    R1,     R1                      ; 6EB6   0249
        XOR@    R1,     R5                      ; 6EB7   03CD
        SWAP    R0,     1                       ; 6EB8   0040
        XORR    R0,     R2                      ; 6EB9   01C2
        SLL     R0,     1                       ; 6EBA   0048
        XORR    R6,     R4                      ; 6EBB   01F4
        ADDR    R3,     R3                      ; 6EBC   00DB
        INCR    R7                              ; 6EBD   000F
        XOR@    R6,     R1                      ; 6EBE   03F1
        INCR    R4                              ; 6EBF   000C
        XOR@    R5,     R0                      ; 6EC0   03E8
        INCR    R3                              ; 6EC1   000B
        MVO@    R3,     R5                      ; 6EC2   026B
        XOR@    R1,     R7                      ; 6EC3   03CF
L_6EC4:
        PSHR    R5                              ; 6EC4   0275
        MVII    #$00A0, R0                      ; 6EC5   02B8 00A0
        MVO     R0,     G_0135                  ; 6EC7   0240 0135

        JSR     R5,     X_PLAY_SFX2             ; 6EC9   0004 0118 03BE

        DECR    R3                              ; 6ECC   0013
        AND@    R1,     R1                      ; 6ECD   0389
        COMR    R5                              ; 6ECE   001D
        SUBR    R5,     R7                      ; 6ECF   012F
        SUB     .PSG0.chn_a_hi,R0               ; 6ED0   0300 01F4
        SUBR    R3,     R3                      ; 6ED2   011B
        INCR    R0                              ; 6ED3   0008
        ANDR    R2,     R0                      ; 6ED4   0190
        SUBR    R3,     R3                      ; 6ED5   011B

        JSRD    R5,     G_C11B                  ; 6ED6   0004 01C2 011B

        XOR@    R6,     R2                      ; 6ED9   03F2
        DECLE   $0001                           ; 6EDA   0001

        DECR    R0                              ; 6EDB   0010
        ADDR    R7,     R3                      ; 6EDC   00FB
        MOVR    R2,     R7                      ; 6EDD   0097
        RLC     R1,     1                       ; 6EDE   0051
        SUB@    R4,     R5                      ; 6EDF   0325
L_6EE0:
        XORI    #$0001, R2                      ; 6EE0   03FA 0001
        DECR    R2                              ; 6EE2   0012
        ADDR    R7,     R3                      ; 6EE3   00FB
        MOVR    R2,     R7                      ; 6EE4   0097
        RLC     R1,     1                       ; 6EE5   0051
        SUB@    R2,     R5                      ; 6EE6   0315
        XOR@    R6,     R6                      ; 6EE7   03F6
        DECLE   $0001                           ; 6EE8   0001

        DECR    R1                              ; 6EE9   0011
        ADDR    R7,     R3                      ; 6EEA   00FB
        MOVR    R2,     R7                      ; 6EEB   0097
        RLC     R1,     1                       ; 6EEC   0051
        DIS                                     ; 6EED   0003
        AND     .BTAB.75,R4                     ; 6EEE   0384 0275

        JSR     R5,     X_PLAY_SFX2             ; 6EF0   0004 0118 03BE

        DECR    R4                              ; 6EF3   0014
        ADCR    R7                              ; 6EF4   002F
        CMPI    #$010D, R1                      ; 6EF5   0379 010D
        INCR    R4                              ; 6EF7   000C
        XORR    R6,     R4                      ; 6EF8   01F4
        MOVR    R6,     R7                      ; 6EF9   00B7
        AND@    R1,     R3                      ; 6EFA   038B
        XORR    R5,     R3                      ; 6EFB   01EB
        ADD@    R1,     R7                      ; 6EFC   02CF
        RSWD    R6                              ; 6EFD   003E
        SUBR    R3,     R5                      ; 6EFE   011D
        XORI    #$03F1, R4                      ; 6EFF   03FC 03F1
        SWAP    R3,     1                       ; 6F01   0043
L_6F02:
        BLE     L_6F02                          ; 6F02   0226 0001

        XORR    R2,     R0                      ; 6F04   01D0
        DECLE   $023C                           ; 6F05   023C

        SARC    R2,     2                       ; 6F06   007E
        MOVR    R4,     R1                      ; 6F07   00A1
        MVI     G_018E, R0                      ; 6F08   0280 018E
        AND@    R4,     R2                      ; 6F0A   03A2
        DECLE   $0036                           ; 6F0B   0036

        CMP@    R1,     R3                      ; 6F0C   034B
L_6F0D:
        MOVR    R3,     R4                      ; 6F0D   009C
        BNOV    L_6C90                          ; 6F0E   022A 027F

        GSWD    R1                              ; 6F10   0031
        CMPR    R2,     R3                      ; 6F11   0153
        CMPR    R1,     R4                      ; 6F12   014C
        XORR    R5,     R0                      ; 6F13   01E8
        XORR    R3,     R4                      ; 6F14   01DC
        MOVR    R6,     R3                      ; 6F15   00B3
        MOVR    R3,     R2                      ; 6F16   009A
        MVI@    R3,     R7                      ; 6F17   029F
        SUBR    R6,     R6                      ; 6F18   0136
        DECLE   $0036,  $0217                   ; 6F19   0036 0217

        XOR     .BTAB.19,R0                     ; 6F1B   03C0 0219
        ANDR    R7,     R1                      ; 6F1D   01B9
        ADDR    R0,     R4                      ; 6F1E   00C4
        ADDI    #$0257, R1                      ; 6F1F   02F9 0257
        ADDR    R4,     R7                      ; 6F21   00E7
        SUBR    R2,     R0                      ; 6F22   0110
        AND     G_0399, R0                      ; 6F23   0380 0399
        DECLE   $0000                           ; 6F25   0000

        SUB@    R4,     R0                      ; 6F26   0320
        ADDI    #$03B9, R5                      ; 6F27   02FD 03B9
        ADDI    #$01F1, R1                      ; 6F29   02F9 01F1
        XOR@    R4,     R4                      ; 6F2B   03E4
        ADDR    R2,     R0                      ; 6F2C   00D0
        ADD     G_0319, R3                      ; 6F2D   02C3 0319
        BGT     L_6F75                          ; 6F2F   020E 0044

        SUBR    R0,     R0                      ; 6F31   0100
        MVII    #$02D3, R7                      ; 6F32   02BF 02D3
        ADCR    R3                              ; 6F34   002B
        XOR     .UART.3,R7                      ; 6F35   03C7 00E3
        XOR@    R5,     R4                      ; 6F37   03EC
        MVI@    R2,     R6                      ; 6F38   0296
        DECLE   $0035                           ; 6F39   0035

        SETC                                    ; 6F3A   0007
        DECLE   $0000                           ; 6F3B   0000

        MOVR    R4,     R1                      ; 6F3C   00A1
        ADDR    R7,     R0                      ; 6F3D   00F8
        BEQ     L_6FA2                          ; 6F3E   0204 0062

        SUBR    R0,     R0                      ; 6F40   0100
        BGT     L_6EE0                          ; 6F41   022E 0062

        MVO@    R0,     R2                      ; 6F43   0250
        CLRC                                    ; 6F44   0006
        ADD@    R1,     R0                      ; 6F45   02C8
        MOVR    R5,     R1                      ; 6F46   00A9
        MVI     G_018F, R5                      ; 6F47   0285 018F
        MOVR    R3,     R0                      ; 6F49   0098
        SDBD                                    ; 6F4A   0001
        MVI@    R4,     R0                      ; 6F4B   02A0
        SLR     R2,     1                       ; 6F4C   0062
        XORR    R7,     R6                      ; 6F4D   01FE
        SLR     R0,     2                       ; 6F4E   0064
        MOVR    R0,     R7                      ; 6F4F   0087
        MVO@    R0,     R5                      ; 6F50   0268
        PULR    R2                              ; 6F51   02B2
        SLR     R1,     1                       ; 6F52   0061
        RLC     R0,     2                       ; 6F53   0054
        CMPR    R6,     R3                      ; 6F54   0173
        ADDR    R5,     R1                      ; 6F55   00E9
        MVI@    R4,     R6                      ; 6F56   02A6
        SUB@    R6,     R2                      ; 6F57   0332
        ADD@    R1,     R1                      ; 6F58   02C9
        NOP                                     ; 6F59   0034
        SUB@    R4,     R1                      ; 6F5A   0321
        MVII    #$0133, R1                      ; 6F5B   02B9 0133
        CMPR    R5,     R2                      ; 6F5D   016A
        DECLE   $0219                           ; 6F5E   0219

        CMPR    R1,     R6                      ; 6F5F   014E
        XOR@    R3,     R2                      ; 6F60   03DA
        BNOV    G_723D                          ; 6F61   020A 02DA

        SARC    R0,     1                       ; 6F63   0078
        DECLE   $021C                           ; 6F64   021C

        SUBR    R1,     R4                      ; 6F65   010C
        MOVR    R3,     R7                      ; 6F66   009F
        SUB@    R2,     R7                      ; 6F67   0317
        SUB@    R1,     R4                      ; 6F68   030C
        MVII    #$020C, R6                      ; 6F69   02BE 020C
        XORR    R3,     R6                      ; 6F6B   01DE
        MVI@    R4,     R6                      ; 6F6C   02A6
        MVO     R7,     G_010A                  ; 6F6D   0247 010A
        SUB@    R4,     R4                      ; 6F6F   0324
        XORR    R3,     R7                      ; 6F70   01DF
        MOVR    R5,     R6                      ; 6F71   00AE
        SUBR    R6,     R3                      ; 6F72   0133
        CMP@    R2,     R3                      ; 6F73   0353
        B       L_6C70                          ; 6F74   0220 0305

        AND@    R4,     R2                      ; 6F76   03A2
        ANDR    R4,     R7                      ; 6F77   01A7
        MVI@    R1,     R3                      ; 6F78   028B
        MVO@    R7,     R2                      ; 6F79   0257
        AND@    R6,     R1                      ; 6F7A   03B1
        BESC    G_711F                          ; 6F7B   020F 01A2

        SLLC    R1,     1                       ; 6F7D   0059
        ADD@    R6,     R2                      ; 6F7E   02F2
        MVO@    R7,     R2                      ; 6F7F   0257
        CMPR    R1,     R3                      ; 6F80   014B
        XORI    #$0011, R6                      ; 6F81   03FE 0011
        COMR    R0                              ; 6F83   0018
        MOVR    R7,     R1                      ; 6F84   00B9
        CMPR    R0,     R0                      ; 6F85   0140
        XOR     G_0393, R6                      ; 6F86   03C6 0393
        DECLE   $0238                           ; 6F88   0238

        ADD     G_0141, R7                      ; 6F89   02C7 0141
        EIS                                     ; 6F8B   0002
        DECLE   $0000                           ; 6F8C   0000

        B       G_720F                          ; 6F8D   0200 0280

        ANDR    R6,     R2                      ; 6F8F   01B2
        ADDR    R2,     R6                      ; 6F90   00D6
L_6F91:
        DECLE   $0000                           ; 6F91   0000

        BC      G_7314                          ; 6F92   0201 0380

        ANDR    R6,     R0                      ; 6F94   01B0
        XOR@    R5,     R2                      ; 6F95   03EA
        ADDR    R7,     R7                      ; 6F96   00FF
        RSWD    R0                              ; 6F97   0038
        SUBI    #$0383, R0                      ; 6F98   0338 0383
        XORR    R3,     R4                      ; 6F9A   01DC
        ADD@    R1,     R0                      ; 6F9B   02C8
        ADD@    R2,     R1                      ; 6F9C   02D1
        GSWD    R0                              ; 6F9D   0030
        CMPI    #$0124, R0                      ; 6F9E   0378 0124
        ANDR    R5,     R6                      ; 6FA0   01AE
        XORR    R5,     R4                      ; 6FA1   01EC
L_6FA2:
        AND     G_0170, R4                      ; 6FA2   0384 0170
        INCR    R0                              ; 6FA4   0008
        ANDR    R6,     R6                      ; 6FA5   01B6
        DECR    R5                              ; 6FA6   0015
        ADDR    R3,     R3                      ; 6FA7   00DB
        CMPR    R6,     R6                      ; 6FA8   0176
        XORR    R0,     R2                      ; 6FA9   01C2
        MOVR    R7,     R0                      ; 6FAA   00B8
        SUB     G_03E2, R3                      ; 6FAB   0303 03E2
        ANDR    R5,     R5                      ; 6FAD   01AD
        SUB@    R5,     R3                      ; 6FAE   032B
        DECLE   $0218                           ; 6FAF   0218

        SARC    R3,     2                       ; 6FB0   007F
        SLL     R1,     1                       ; 6FB1   0049
        XOR@    R6,     R0                      ; 6FB2   03F0
        MVO@    R3,     R5                      ; 6FB3   026B
        ANDR    R7,     R2                      ; 6FB4   01BA
        MOVR    R2,     R1                      ; 6FB5   0091
        SLLC    R0,     2                       ; 6FB6   005C
        MVI     G_02F3, R6                      ; 6FB7   0286 02F3
        MVI@    R4,     R7                      ; 6FB9   02A7
        ANDR    R2,     R4                      ; 6FBA   0194
        MOVR    R2,     R0                      ; 6FBB   0090
        RSWD    R0                              ; 6FBC   0038
        XORR    R4,     R3                      ; 6FBD   01E3
        XORI    #$0195, R4                      ; 6FBE   03FC 0195
        SUBR    R2,     R4                      ; 6FC0   0114
        SWAP    R1,     1                       ; 6FC1   0041
        XORR    R7,     R4                      ; 6FC2   01FC
        NOP                                     ; 6FC3   0034
        SUBR    R6,     R7                      ; 6FC4   0137
        XOR@    R3,     R5                      ; 6FC5   03DD
        SWAP    R0,     2                       ; 6FC6   0044
        DECLE   $0235                           ; 6FC7   0235

        CMP     G_01BB, R5                      ; 6FC8   0345 01BB
        CMP     G_039C, R3                      ; 6FCA   0343 039C
        MVO@    R5,     R1                      ; 6FCC   024D
        RSWD    R0                              ; 6FCD   0038
        ANDR    R2,     R6                      ; 6FCE   0196
        ANDR    R0,     R0                      ; 6FCF   0180
        XORR    R3,     R6                      ; 6FD0   01DE
        AND@    R5,     R1                      ; 6FD1   03A9
        SARC    R3,     2                       ; 6FD2   007F
        ADDR    R6,     R2                      ; 6FD3   00F2
        SUB     G_0319, R0                      ; 6FD4   0300 0319
        AND@    R5,     R0                      ; 6FD6   03A8
        MVO@    R7,     R1                      ; 6FD7   024F
        EIS                                     ; 6FD8   0002
        DECLE   $0228                           ; 6FD9   0228

        MOVR    R6,     R0                      ; 6FDA   00B0
        SARC    R2,     2                       ; 6FDB   007E
        INCR    R6                              ; 6FDC   000E
        DECLE   $0000                           ; 6FDD   0000
L_6FDE:
        CLRR    R3                              ; 6FDE   01DB
L_6FDF:
        MVI     G_01C5, R4                      ; 6FDF   0284 01C5
        DECR    R3                              ; 6FE1   0013
        BEQ     L_6FE8                          ; 6FE2   0204 0004

        ANDI    #$0040, R4                      ; 6FE4   03BC 0040
        BNEQ    L_6FDF                          ; 6FE6   022C 0008

L_6FE8:
        MOVR    R5,     R7                      ; 6FE8   00AF
        EIS                                     ; 6FE9   0002
        ADDR    R6,     R1                      ; 6FEA   00F1
        DECLE   $0000                           ; 6FEB   0000
L_6FEC:
        MVII    #$0007, R0                      ; 6FEC   02B8 0007
        MVI     G_0345, R2                      ; 6FEE   0282 0345
        ANDR    R0,     R2                      ; 6FF0   0182
        COMR    R0                              ; 6FF1   0018
        AND     .STIC.A.5,R0                    ; 6FF2   0380 0015
        XORR    R0,     R2                      ; 6FF4   01C2
        MVO     R2,     .STIC.A.5               ; 6FF5   0242 0015
        MOVR    R5,     R7                      ; 6FF7   00AF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6FFC   0000 0000 0000

        SLR     R0,     1                       ; 6FFF   0060

        ORG     $D000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D000   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D004   0000 0000

        DECR    R0                              ; D006   0010
        SARC    R0,     1                       ; D007   0078
        SARC    R0,     1                       ; D008   0078
        ADDR    R6,     R4                      ; D009   00F4
        ADDR    R6,     R4                      ; D00A   00F4
        ADDR    R7,     R0                      ; D00B   00F8
        ADDR    R4,     R6                      ; D00C   00E6
        MOVR    R3,     R4                      ; D00D   009C
        DECLE   $0000,  $0000,  $0000           ; D00E   0000 0000 0000

        INCR    R4                              ; D011   000C
        COMR    R6                              ; D012   001E
        COMR    R6                              ; D013   001E
        RSWD    R6                              ; D014   003E
        ADCR    R6                              ; D015   002E
        RLC     R0,     2                       ; D016   0054
        SLLC    R2,     1                       ; D017   005A
        RSWD    R6                              ; D018   003E
        COMR    R2                              ; D019   001A
        INCR    R4                              ; D01A   000C
        DECR    R0                              ; D01B   0010
        COMR    R0                              ; D01C   0018
        COMR    R0                              ; D01D   0018
        COMR    R0                              ; D01E   0018
        DECR    R0                              ; D01F   0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; D020   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D024   0000 0000

        EIS                                     ; D026   0002
        EIS                                     ; D027   0002
        CLRC                                    ; D028   0006
        CLRC                                    ; D029   0006
        CLRC                                    ; D02A   0006
        CLRC                                    ; D02B   0006
        CLRC                                    ; D02C   0006

        JSR     R4,     G_040C                  ; D02D   0004 0004 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; D030   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D034   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D038   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D03C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D040   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D044   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D048   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D04C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D050   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D054   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D058   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D05C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D060   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D064   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D068   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D06C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D070   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D074   0000 0000 0000 0000

        ADDR    R0,     R0                      ; D078   00C0
        ADDR    R4,     R0                      ; D079   00E0
        ADDR    R6,     R0                      ; D07A   00F0
        SARC    R0,     1                       ; D07B   0078
        COMR    R4                              ; D07C   001C
        INCR    R6                              ; D07D   000E
        SETC                                    ; D07E   0007
        DIS                                     ; D07F   0003
        SWAP    R0,     1                       ; D080   0040
        SWAP    R0,     1                       ; D081   0040
        SWAP    R0,     1                       ; D082   0040
        SWAP    R0,     1                       ; D083   0040
        SWAP    R0,     1                       ; D084   0040
        DECLE   $0000                           ; D085   0000

        TSTR    R0                              ; D086   0080
        TSTR    R0                              ; D087   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; D088   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D08C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D090   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D094   0000 0000 0000 0000
        DECLE   $0000                           ; D098   0000

        DECR    R0                              ; D099   0010
        DECLE   $0000                           ; D09A   0000

        INCR    R0                              ; D09B   0008
        INCR    R4                              ; D09C   000C
        INCR    R4                              ; D09D   000C
        CLRC                                    ; D09E   0006
        CLRC                                    ; D09F   0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0A0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0A4   0000 0000 0000 0000
        DECLE   $0000                           ; D0A8   0000

        TSTR    R0                              ; D0A9   0080
        MOVR    R4,     R0                      ; D0AA   00A0
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0AB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D0AF   0000 0000 0000

        COMR    R4                              ; D0B2   001C
        SARC    R0,     1                       ; D0B3   0078
        ADDR    R7,     R0                      ; D0B4   00F8
        ADDR    R4,     R0                      ; D0B5   00E0
        RRC     R0,     1                       ; D0B6   0070
        RSWD    R4                              ; D0B7   003C
        COMR    R6                              ; D0B8   001E
        INCR    R3                              ; D0B9   000B
        DIS                                     ; D0BA   0003
        DECLE   $0001,  $0000,  $0000,  $0000   ; D0BB   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0BF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0C3   0000 0000 0000 0000

        DIS                                     ; D0C7   0003
        DIS                                     ; D0C8   0003
        DIS                                     ; D0C9   0003
        DIS                                     ; D0CA   0003
        DIS                                     ; D0CB   0003
        DECLE   $0001,  $0001,  $0001,  $0000   ; D0CC   0001 0001 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0D0   0000 0000 0000 0000
        DECLE   $0000                           ; D0D4   0000

        INCR    R0                              ; D0D5   0008
        INCR    R0                              ; D0D6   0008
        INCR    R6                              ; D0D7   000E
        COMR    R4                              ; D0D8   001C
        RSWD    R0                              ; D0D9   0038
        RSWD    R0                              ; D0DA   0038
        COMR    R4                              ; D0DB   001C
        INCR    R5                              ; D0DC   000D
        SETC                                    ; D0DD   0007
        DIS                                     ; D0DE   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0DF   0000 0000 0000 0000
        DECLE   $0001                           ; D0E3   0001

        EIS                                     ; D0E4   0002
        EIS                                     ; D0E5   0002
        DECLE   $0000                           ; D0E6   0000

        EIS                                     ; D0E7   0002
        SETC                                    ; D0E8   0007
        MOVR    R0,     R7                      ; D0E9   0087
        ADDR    R5,     R7                      ; D0EA   00EF
        ADDR    R7,     R6                      ; D0EB   00FE
        ADDR    R7,     R6                      ; D0EC   00FE
        SARC    R0,     2                       ; D0ED   007C
        COMR    R0                              ; D0EE   0018
        DECLE   $0000,  $0000,  $0000           ; D0EF   0000 0000 0000

        DECR    R0                              ; D0F2   0010
        DECR    R0                              ; D0F3   0010
        NEGR    R2                              ; D0F4   0022
        DECLE   $0000                           ; D0F5   0000

        EIS                                     ; D0F6   0002
        MOVR    R0,     R3                      ; D0F7   0083
        DIS                                     ; D0F8   0003
        DIS                                     ; D0F9   0003
        CLRC                                    ; D0FA   0006
        CLRC                                    ; D0FB   0006
        MOVR    R1,     R4                      ; D0FC   008C
        MOVR    R3,     R4                      ; D0FD   009C
        MOVR    R7,     R0                      ; D0FE   00B8
        ADDR    R7,     R0                      ; D0FF   00F8
        DECLE   $0000,  $0000                   ; D100   0000 0000

        DECR    R0                              ; D102   0010
        DECR    R0                              ; D103   0010
        EIS                                     ; D104   0002
        DECLE   $0000                           ; D105   0000

        EIS                                     ; D106   0002
        DIS                                     ; D107   0003
        SETC                                    ; D108   0007
        CLRC                                    ; D109   0006
        INCR    R6                              ; D10A   000E
        COMR    R6                              ; D10B   001E
        ADDR    R7,     R4                      ; D10C   00FC
        ADDR    R7,     R0                      ; D10D   00F8
        DECLE   $0000,  $0000                   ; D10E   0000 0000

        SARC    R0,     2                       ; D110   007C
        SARC    R2,     2                       ; D111   007E
        RSWD    R6                              ; D112   003E
        COMR    R6                              ; D113   001E
        COMR    R4                              ; D114   001C
        DECLE   $0000                           ; D115   0000

        COMR    R0                              ; D116   0018
        RSWD    R4                              ; D117   003C
        RSWD    R4                              ; D118   003C
        RSWD    R4                              ; D119   003C
        SAR     R0,     2                       ; D11A   006C
        SAR     R2,     2                       ; D11B   006E
        SLR     R2,     2                       ; D11C   0066
        ADDR    R0,     R6                      ; D11D   00C6
        ADDR    R0,     R3                      ; D11E   00C3
        MOVR    R0,     R1                      ; D11F   0081
        COMR    R4                              ; D120   001C
        RSWD    R6                              ; D121   003E
        RSWD    R6                              ; D122   003E
        COMR    R4                              ; D123   001C
        COMR    R4                              ; D124   001C
        INCR    R0                              ; D125   0008
        COMR    R0                              ; D126   0018
        COMR    R4                              ; D127   001C
        COMR    R4                              ; D128   001C
        RSWD    R4                              ; D129   003C
        DECLE   $0036,  $0036                   ; D12A   0036 0036

        NEGR    R6                              ; D12C   0026
        SLR     R2,     1                       ; D12D   0062
        SLR     R3,     1                       ; D12E   0063
        ADDR    R0,     R1                      ; D12F   00C1
        COMR    R4                              ; D130   001C
        SARC    R2,     2                       ; D131   007E
        SARC    R2,     2                       ; D132   007E
        RSWD    R4                              ; D133   003C
        COMR    R4                              ; D134   001C
        DECLE   $0000                           ; D135   0000

        COMR    R0                              ; D136   0018
        RSWD    R4                              ; D137   003C
        RSWD    R4                              ; D138   003C
        RSWD    R4                              ; D139   003C
        SLR     R2,     2                       ; D13A   0066
        SLR     R2,     2                       ; D13B   0066
        SLR     R2,     2                       ; D13C   0066
        SWAP    R2,     1                       ; D13D   0042
        ADDR    R0,     R3                      ; D13E   00C3
        MOVR    R0,     R1                      ; D13F   0081
        DECLE   $0000,  $0000                   ; D140   0000 0000

        MOVR    R1,     R0                      ; D142   0088
        DECLE   $0000,  $0000,  $0000,  $0000   ; D143   0000 0000 0000 0000

        DIS                                     ; D147   0003
        SETC                                    ; D148   0007
        INCR    R5                              ; D149   000D
        COMR    R6                              ; D14A   001E
        COMR    R7                              ; D14B   001F
        INCR    R7                              ; D14C   000F
        SETC                                    ; D14D   0007
        EIS                                     ; D14E   0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; D14F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D153   0000 0000 0000

        INCR    R0                              ; D156   0008
        COMR    R4                              ; D157   001C
        RSWD    R6                              ; D158   003E
        RSWD    R6                              ; D159   003E
        SARC    R2,     2                       ; D15A   007E
        RRC     R2,     2                       ; D15B   0076
        SLR     R3,     1                       ; D15C   0063
        DIS                                     ; D15D   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; D15E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D162   0000 0000 0000 0000
        DECLE   $0000                           ; D166   0000

        CLRC                                    ; D167   0006
        INCR    R7                              ; D168   000F
        COMR    R7                              ; D169   001F
        COMR    R3                              ; D16A   001B
        COMR    R6                              ; D16B   001E
        SETC                                    ; D16C   0007
        COMR    R3                              ; D16D   001B
        COMR    R2                              ; D16E   001A
        INCR    R0                              ; D16F   0008
        DECLE   $0000                           ; D170   0000

        INCR    R0                              ; D171   0008
        COMR    R0                              ; D172   0018
        COMR    R4                              ; D173   001C
        COMR    R4                              ; D174   001C
        COMR    R4                              ; D175   001C
        COMR    R0                              ; D176   0018
        COMR    R4                              ; D177   001C
        COMR    R4                              ; D178   001C
        DECLE   $0000                           ; D179   0000

        COMR    R4                              ; D17A   001C
        COMR    R4                              ; D17B   001C
        COMR    R4                              ; D17C   001C
        INCR    R4                              ; D17D   000C
        INCR    R4                              ; D17E   000C

        JSR     R4,     .STIC.Y.0               ; D17F   0004 0000 0008

        COMR    R0                              ; D182   0018
        COMR    R4                              ; D183   001C
        COMR    R4                              ; D184   001C
        COMR    R4                              ; D185   001C
        COMR    R0                              ; D186   0018
        COMR    R4                              ; D187   001C
        COMR    R4                              ; D188   001C
        DECLE   $0000                           ; D189   0000

        COMR    R4                              ; D18A   001C
        COMR    R4                              ; D18B   001C
        COMR    R6                              ; D18C   001E
        INCR    R6                              ; D18D   000E
        SETC                                    ; D18E   0007
        INCR    R3                              ; D18F   000B
        DECLE   $0000,  $0000,  $0000,  $0000   ; D190   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D194   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D198   0000 0000

        DIS                                     ; D19A   0003
        DIS                                     ; D19B   0003
        SETC                                    ; D19C   0007
        CLRC                                    ; D19D   0006
        SARC    R2,     2                       ; D19E   007E
        ADDR    R7,     R4                      ; D19F   00FC
        DECLE   $0000,  $0000,  $0000,  $0000   ; D1A0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D1A4   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D1A8   0000 0000

        DIS                                     ; D1AA   0003
        MOVR    R0,     R3                      ; D1AB   0083
        ADDR    R4,     R7                      ; D1AC   00E7
        SARC    R2,     2                       ; D1AD   007E
        RSWD    R4                              ; D1AE   003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; D1AF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D1B3   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D1B7   0000 0000

        TSTR    R0                              ; D1B9   0080
        ADDR    R0,     R3                      ; D1BA   00C3
        ADDR    R0,     R7                      ; D1BB   00C7
        SARC    R3,     2                       ; D1BC   007F
        RSWD    R4                              ; D1BD   003C
        COMR    R0                              ; D1BE   0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; D1BF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D1C3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D1C7   0000 0000 0000

        MOVR    R0,     R3                      ; D1CA   0083
        ADDR    R0,     R7                      ; D1CB   00C7
        SARC    R3,     2                       ; D1CC   007F
        RSWD    R4                              ; D1CD   003C
        DECR    R0                              ; D1CE   0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; D1CF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D1D3   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D1D7   0000 0000

        INCR    R4                              ; D1D9   000C
        COMR    R6                              ; D1DA   001E
        COMR    R6                              ; D1DB   001E
        SARC    R3,     2                       ; D1DC   007F
        COMR    R7                              ; D1DD   001F
        DIS                                     ; D1DE   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; D1DF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D1E3   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D1E7   0000 0000

        INCR    R0                              ; D1E9   0008
        COMR    R6                              ; D1EA   001E
        COMR    R7                              ; D1EB   001F
        COMR    R7                              ; D1EC   001F
        SARC    R3,     2                       ; D1ED   007F
        DIS                                     ; D1EE   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; D1EF   0000 0000 0000 0000

        INCR    R0                              ; D1F3   0008
        COMR    R4                              ; D1F4   001C
        COMR    R6                              ; D1F5   001E
        COMR    R6                              ; D1F6   001E
        INCR    R6                              ; D1F7   000E
        RSWD    R6                              ; D1F8   003E
        COMR    R6                              ; D1F9   001E
        INCR    R4                              ; D1FA   000C
        COMR    R0                              ; D1FB   0018

        JSR     R4,     G_0C0C                  ; D1FC   0004 000C 000C

        INCR    R0                              ; D1FF   0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; D200   0000 0000 0000 0000
        DECLE   $0000                           ; D204   0000

        COMR    R4                              ; D205   001C
        COMR    R4                              ; D206   001C
        COMR    R6                              ; D207   001E
        INCR    R6                              ; D208   000E
        RSWD    R6                              ; D209   003E
        COMR    R4                              ; D20A   001C
        INCR    R4                              ; D20B   000C
        COMR    R0                              ; D20C   0018

        JSR     R4,     G_0C08                  ; D20D   0004 000C 0008
        DECLE   $0000                           ; D210   0000

        JSRD    R4,     G_040E                  ; D211   0004 0006 000E

        COMR    R4                              ; D214   001C
        COMR    R2                              ; D215   001A
        RSWD    R6                              ; D216   003E
        INCR    R6                              ; D217   000E
        DECLE   $0000                           ; D218   0000

        INCR    R6                              ; D219   000E
        INCR    R6                              ; D21A   000E
        INCR    R4                              ; D21B   000C
        INCR    R4                              ; D21C   000C
        INCR    R4                              ; D21D   000C
        INCR    R4                              ; D21E   000C
        INCR    R4                              ; D21F   000C
        DECLE   $0000                           ; D220   0000

        JSRD    R4,     G_042E                  ; D221   0004 0006 002E

        COMR    R4                              ; D224   001C
        COMR    R2                              ; D225   001A
        COMR    R6                              ; D226   001E
        INCR    R6                              ; D227   000E
        DECLE   $0000                           ; D228   0000

        INCR    R6                              ; D229   000E
        INCR    R6                              ; D22A   000E
        INCR    R4                              ; D22B   000C
        INCR    R4                              ; D22C   000C
        INCR    R4                              ; D22D   000C
        INCR    R4                              ; D22E   000C
        INCR    R4                              ; D22F   000C
        NEGR    R0                              ; D230   0020

        JSRD    R4,     G_040E                  ; D231   0004 0006 000E

        COMR    R4                              ; D234   001C
        COMR    R2                              ; D235   001A
        COMR    R6                              ; D236   001E
        INCR    R6                              ; D237   000E
        DECLE   $0000                           ; D238   0000

        INCR    R6                              ; D239   000E
        INCR    R6                              ; D23A   000E
        INCR    R4                              ; D23B   000C
        INCR    R4                              ; D23C   000C
        INCR    R4                              ; D23D   000C
        INCR    R4                              ; D23E   000C
        INCR    R4                              ; D23F   000C
        DECLE   $0000                           ; D240   0000

        JSRD    R4,     G_042E                  ; D241   0004 0006 002E

        COMR    R4                              ; D244   001C
        COMR    R2                              ; D245   001A
        COMR    R6                              ; D246   001E
        INCR    R6                              ; D247   000E
        DECLE   $0000                           ; D248   0000

        INCR    R6                              ; D249   000E
        INCR    R6                              ; D24A   000E
        INCR    R4                              ; D24B   000C
        INCR    R4                              ; D24C   000C
        INCR    R4                              ; D24D   000C
        INCR    R4                              ; D24E   000C
        INCR    R4                              ; D24F   000C
        DECLE   $0000                           ; D250   0000

        INCR    R4                              ; D251   000C
        INCR    R6                              ; D252   000E
        INCR    R4                              ; D253   000C
        INCR    R4                              ; D254   000C
        DECLE   $0000,  $0000                   ; D255   0000 0000

        INCR    R4                              ; D257   000C
        INCR    R6                              ; D258   000E
        INCR    R6                              ; D259   000E
        DECR    R6                              ; D25A   0016
        RSWD    R2                              ; D25B   003A
        COMR    R6                              ; D25C   001E
        CLRC                                    ; D25D   0006
        INCR    R0                              ; D25E   0008
        INCR    R4                              ; D25F   000C
        DECLE   $0000                           ; D260   0000

        CLRC                                    ; D261   0006
        SETC                                    ; D262   0007
        CLRC                                    ; D263   0006
        CLRC                                    ; D264   0006
        DECLE   $0000,  $0000                   ; D265   0000 0000

        CLRC                                    ; D267   0006
        SETC                                    ; D268   0007
        SETC                                    ; D269   0007
        INCR    R3                              ; D26A   000B
        COMR    R5                              ; D26B   001D
        INCR    R7                              ; D26C   000F
        DIS                                     ; D26D   0003

        JSRD    R4,     G_0400                  ; D26E   0004 0006 0000

        CLRC                                    ; D271   0006
        CLRC                                    ; D272   0006
        CLRC                                    ; D273   0006
        CLRC                                    ; D274   0006
        DECLE   $0000,  $0000                   ; D275   0000 0000

        CLRC                                    ; D277   0006
        SETC                                    ; D278   0007
        SETC                                    ; D279   0007
        SETC                                    ; D27A   0007
        DIS                                     ; D27B   0003
        INCR    R5                              ; D27C   000D
        INCR    R7                              ; D27D   000F
        DECLE   $0000                           ; D27E   0000

        CLRC                                    ; D27F   0006
        DECLE   $0000,  $0000                   ; D280   0000 0000

        CLRC                                    ; D282   0006
        CLRC                                    ; D283   0006
        CLRC                                    ; D284   0006
        CLRC                                    ; D285   0006
        DECLE   $0000,  $0000                   ; D286   0000 0000

        CLRC                                    ; D288   0006
        SETC                                    ; D289   0007
        SETC                                    ; D28A   0007
        SETC                                    ; D28B   0007
        INCR    R3                              ; D28C   000B
        COMR    R5                              ; D28D   001D
        INCR    R7                              ; D28E   000F
        DIS                                     ; D28F   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; D290   0000 0000 0000 0000
        DECLE   $0000                           ; D294   0000

        CLRC                                    ; D295   0006
        INCR    R6                              ; D296   000E
        CLRC                                    ; D297   0006
        CLRC                                    ; D298   0006
        DECLE   $0000,  $0000                   ; D299   0000 0000

        JSRD    R4,     G_0C1F                  ; D29B   0004 000E 001F

        DECR    R7                              ; D29E   0017
        SLLC    R3,     1                       ; D29F   005B
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2A0   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D2A4   0000 0000

        CLRC                                    ; D2A6   0006
        INCR    R6                              ; D2A7   000E
        CLRC                                    ; D2A8   0006
        GSWD    R2                              ; D2A9   0032
        SLLC    R0,     1                       ; D2AA   0058
        INCR    R4                              ; D2AB   000C
        MOVR    R0,     R6                      ; D2AC   0086
        MOVR    R0,     R6                      ; D2AD   0086
        ADDR    R0,     R7                      ; D2AE   00C7
        ADDR    R0,     R7                      ; D2AF   00C7
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2B0   0000 0000 0000 0000

        CLRC                                    ; D2B4   0006
        INCR    R6                              ; D2B5   000E
        CLRC                                    ; D2B6   0006
        EIS                                     ; D2B7   0002
        DECLE   $0000                           ; D2B8   0000

        JSRD    R4,     G_0C1E                  ; D2B9   0004 000E 001E
        DECLE   $0037                           ; D2BC   0037

        NEGR    R7                              ; D2BD   0027
        MOVR    R0,     R3                      ; D2BE   0083
        MOVR    R0,     R5                      ; D2BF   0085
        DECLE   $0000,  $0000,  $0000           ; D2C0   0000 0000 0000

        INCR    R4                              ; D2C3   000C
        COMR    R4                              ; D2C4   001C
        INCR    R4                              ; D2C5   000C
        INCR    R4                              ; D2C6   000C
        DECLE   $0000                           ; D2C7   0000

        EIS                                     ; D2C8   0002
        INCR    R1                              ; D2C9   0009
        COMR    R5                              ; D2CA   001D
        RSWD    R7                              ; D2CB   003F
        ADCR    R7                              ; D2CC   002F
        ADCR    R4                              ; D2CD   002C
        COMR    R4                              ; D2CE   001C
        INCR    R4                              ; D2CF   000C
        DECLE   $0000,  $0000                   ; D2D0   0000 0000

        EIS                                     ; D2D2   0002
        COMR    R0                              ; D2D3   0018
        COMR    R2                              ; D2D4   001A
        COMR    R2                              ; D2D5   001A
        COMR    R2                              ; D2D6   001A
        EIS                                     ; D2D7   0002
        CLRC                                    ; D2D8   0006
        COMR    R4                              ; D2D9   001C
        COMR    R4                              ; D2DA   001C
        RSWD    R0                              ; D2DB   0038
        RSWD    R0                              ; D2DC   0038
        RRC     R0,     1                       ; D2DD   0070
        RRC     R0,     1                       ; D2DE   0070
        RRC     R0,     1                       ; D2DF   0070
        DECLE   $0000,  $0000                   ; D2E0   0000 0000

        NEGR    R0                              ; D2E2   0020
        SWAP    R0,     1                       ; D2E3   0040
        SLL     R0,     2                       ; D2E4   004C
        SLL     R2,     2                       ; D2E5   004E
        SLL     R0,     2                       ; D2E6   004C
        SLL     R0,     2                       ; D2E7   004C
        SLR     R0,     1                       ; D2E8   0060
        GSWD    R0                              ; D2E9   0030
        RSWD    R0                              ; D2EA   0038
        COMR    R4                              ; D2EB   001C
        COMR    R6                              ; D2EC   001E
        COMR    R5                              ; D2ED   001D
        COMR    R5                              ; D2EE   001D
        INCR    R6                              ; D2EF   000E
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2F0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2F4   0000 0000 0000 0000
        DECLE   $0000                           ; D2F8   0000

        INCR    R4                              ; D2F9   000C
        INCR    R6                              ; D2FA   000E
        INCR    R4                              ; D2FB   000C
        DECLE   $0000                           ; D2FC   0000

        INCR    R0                              ; D2FD   0008
        COMR    R4                              ; D2FE   001C
        RSWD    R6                              ; D2FF   003E
        DECLE   $0000,  $0000,  $0000,  $0000   ; D300   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D304   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D308   0000 0000 0000 0000
        DECLE   $0000                           ; D30C   0000

        CLRC                                    ; D30D   0006
        SETC                                    ; D30E   0007
        CLRC                                    ; D30F   0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; D310   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D314   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D318   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D31C   0000 0000 0000

        CLRC                                    ; D31F   0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; D320   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D324   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D328   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D32C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D330   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D334   0000 0000 0000

        NEGR    R0                              ; D337   0020
        DECLE   $0000                           ; D338   0000

        DIS                                     ; D339   0003
        SETC                                    ; D33A   0007
        INCR    R6                              ; D33B   000E
        COMR    R4                              ; D33C   001C
        RSWD    R0                              ; D33D   0038
        RRC     R0,     1                       ; D33E   0070
        ADDR    R0,     R0                      ; D33F   00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; D340   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D344   0000 0000 0000 0000

        INCR    R4                              ; D348   000C
        COMR    R4                              ; D349   001C
        COMR    R0                              ; D34A   0018
        RSWD    R0                              ; D34B   0038
        GSWD    R0                              ; D34C   0030
        RRC     R0,     1                       ; D34D   0070
        SLR     R0,     1                       ; D34E   0060
        SWAP    R0,     1                       ; D34F   0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; D350   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D354   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D358   0000 0000 0000

        RSWD    R0                              ; D35B   0038
        RSWD    R7                              ; D35C   003F
        RSWD    R0                              ; D35D   0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; D35E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D362   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D366   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D36A   0000 0000 0000 0000
        DECLE   $0000                           ; D36E   0000

        SETC                                    ; D36F   0007
        INCR    R6                              ; D370   000E
        RSWD    R4                              ; D371   003C
        ADDR    R6,     R0                      ; D372   00F0
        ADDR    R4,     R0                      ; D373   00E0
        ADDR    R0,     R0                      ; D374   00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; D375   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D379   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D37D   0000 0000

        RSWD    R4                              ; D37F   003C
        RSWD    R7                              ; D380   003F
        RSWD    R6                              ; D381   003E
        DECLE   $0000,  $0000,  $0000,  $0000   ; D382   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D386   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D38A   0000 0000

        INCR    R4                              ; D38C   000C
        COMR    R4                              ; D38D   001C
        RSWD    R4                              ; D38E   003C
        SARC    R0,     1                       ; D38F   0078
        ADDR    R4,     R0                      ; D390   00E0
        DECLE   $0000,  $0000,  $0000,  $0000   ; D391   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D395   0000 0000 0000 0000

        INCR    R4                              ; D399   000C
        INCR    R4                              ; D39A   000C
        INCR    R4                              ; D39B   000C
        INCR    R0                              ; D39C   0008
        INCR    R4                              ; D39D   000C
        INCR    R4                              ; D39E   000C
        INCR    R4                              ; D39F   000C
        INCR    R4                              ; D3A0   000C
        INCR    R4                              ; D3A1   000C
        INCR    R4                              ; D3A2   000C
        INCR    R4                              ; D3A3   000C
        INCR    R0                              ; D3A4   0008
        DECLE   $0000                           ; D3A5   0000

        DECR    R4                              ; D3A6   0014
        RSWD    R0                              ; D3A7   0038
        DECLE   $0000                           ; D3A8   0000

        CLRC                                    ; D3A9   0006
        INCR    R6                              ; D3AA   000E
        INCR    R6                              ; D3AB   000E
        COMR    R4                              ; D3AC   001C
        COMR    R4                              ; D3AD   001C
        NOP                                     ; D3AE   0034
        NOP                                     ; D3AF   0034
        COMR    R4                              ; D3B0   001C
        INCR    R4                              ; D3B1   000C
        CLRC                                    ; D3B2   0006
        DECLE   $0005                           ; D3B3   0005

        CLRC                                    ; D3B4   0006

        JSR     R4,     .STIC.C.4               ; D3B5   0004 0000 001C
        DECLE   $0000,  $0000                   ; D3B8   0000 0000

        CLRC                                    ; D3BA   0006
        INCR    R6                              ; D3BB   000E
        COMR    R6                              ; D3BC   001E
        ADCR    R6                              ; D3BD   002E
        RRC     R0,     2                       ; D3BE   0074
        SLR     R0,     2                       ; D3BF   0064
        NOP                                     ; D3C0   0034
        COMR    R4                              ; D3C1   001C
        INCR    R4                              ; D3C2   000C
        DECR    R4                              ; D3C3   0014

        JSR     R4,     G_0400                  ; D3C4   0004 0004 0000

        COMR    R4                              ; D3C7   001C
        DECLE   $0000                           ; D3C8   0000

        CLRC                                    ; D3C9   0006
        DECLE   $0000                           ; D3CA   0000

        COMR    R6                              ; D3CB   001E
        RSWD    R6                              ; D3CC   003E
        RRC     R2,     2                       ; D3CD   0076
        SLR     R0,     2                       ; D3CE   0064
        SWAP    R0,     2                       ; D3CF   0044
        SLL     R0,     2                       ; D3D0   004C
        SLL     R0,     1                       ; D3D1   0048
        ADCR    R0                              ; D3D2   0028
        SWAP    R0,     2                       ; D3D3   0044
        MOVR    R0,     R4                      ; D3D4   0084

        JSR     R4,     .STIC.C.4               ; D3D5   0004 0000 001C

        SAR     R1,     1                       ; D3D8   0069
        SARC    R1,     2                       ; D3D9   007D
        SARC    R3,     2                       ; D3DA   007F
        SLLC    R0,     1                       ; D3DB   0058
        SWAP    R2,     2                       ; D3DC   0046
        SLL     R2,     2                       ; D3DD   004E
        MOVR    R3,     R4                      ; D3DE   009C
        SLLC    R0,     1                       ; D3DF   0058
        DECR    R0                              ; D3E0   0010
        COMR    R0                              ; D3E1   0018
        INCR    R0                              ; D3E2   0008
        INCR    R0                              ; D3E3   0008
        INCR    R4                              ; D3E4   000C

        JSR     R4,     .STIC.C.4               ; D3E5   0004 0000 001C

        RRC     R1,     1                       ; D3E8   0071
        RSWD    R3                              ; D3E9   003B
        DECR    R6                              ; D3EA   0016
        INCR    R4                              ; D3EB   000C
        INCR    R2                              ; D3EC   000A
        CLRC                                    ; D3ED   0006
        INCR    R4                              ; D3EE   000C
        COMR    R4                              ; D3EF   001C
        COMR    R0                              ; D3F0   0018
        GSWD    R0                              ; D3F1   0030
        GSWD    R0                              ; D3F2   0030
        COMR    R0                              ; D3F3   0018
        INCR    R4                              ; D3F4   000C

        JSR     R4,     .STIC.C.4               ; D3F5   0004 0000 001C

        ADDR    R0,     R7                      ; D3F8   00C7
        RRC     R3,     1                       ; D3F9   0073
        RSWD    R0                              ; D3FA   0038
        DECR    R6                              ; D3FB   0016
        CLRC                                    ; D3FC   0006
        INCR    R4                              ; D3FD   000C
        INCR    R4                              ; D3FE   000C
        COMR    R0                              ; D3FF   0018
        DECR    R0                              ; D400   0010
        COMR    R0                              ; D401   0018
        INCR    R4                              ; D402   000C
        INCR    R4                              ; D403   000C
        CLRC                                    ; D404   0006
        EIS                                     ; D405   0002
        DECLE   $0000                           ; D406   0000

        INCR    R6                              ; D407   000E
        INCR    R4                              ; D408   000C
        DECLE   $0000                           ; D409   0000

        INCR    R4                              ; D40A   000C
        COMR    R6                              ; D40B   001E
        TSTR    R6                              ; D40C   00B6
        SLL     R2,     2                       ; D40D   004E
        COMR    R4                              ; D40E   001C
        RSWD    R0                              ; D40F   0038
        GSWD    R0                              ; D410   0030
        GSWD    R0                              ; D411   0030
        COMR    R0                              ; D412   0018
        INCR    R4                              ; D413   000C

        JSRD    R4,     G_0402                  ; D414   0004 0006 0002

        INCR    R4                              ; D417   000C
        GSWD    R0                              ; D418   0030
        RSWD    R0                              ; D419   0038
        DECLE   $0000                           ; D41A   0000

        RSWD    R0                              ; D41B   0038
        RSWD    R0                              ; D41C   0038
        RSWD    R4                              ; D41D   003C
        NOP                                     ; D41E   0034
        NEGR    R4                              ; D41F   0024
        NEGR    R4                              ; D420   0024
        NEGR    R4                              ; D421   0024
        NEGR    R2                              ; D422   0022
        NOP                                     ; D423   0034
        DECR    R0                              ; D424   0010
        DECLE   $0000                           ; D425   0000

        DECR    R0                              ; D426   0010
        DECLE   $0000                           ; D427   0000

        JSR     R4,     .EXEC.C00               ; D428   0004 001C 0000

        COMR    R4                              ; D42B   001C
        COMR    R4                              ; D42C   001C
        COMR    R4                              ; D42D   001C
        COMR    R2                              ; D42E   001A
        DECR    R2                              ; D42F   0012
        DECR    R2                              ; D430   0012
        DECR    R2                              ; D431   0012
        DECR    R2                              ; D432   0012
        COMR    R2                              ; D433   001A
        INCR    R1                              ; D434   0009
        EIS                                     ; D435   0002
        INCR    R0                              ; D436   0008
        DECLE   $0000                           ; D437   0000

        NEGR    R6                              ; D438   0026
        COMR    R4                              ; D439   001C
        RRC     R0,     1                       ; D43A   0070
        SLR     R0,     2                       ; D43B   0064
        DECR    R2                              ; D43C   0012
        RSWD    R0                              ; D43D   0038
        RSWD    R4                              ; D43E   003C
        INCR    R6                              ; D43F   000E
        NEGR    R0                              ; D440   0020
        RRC     R2,     1                       ; D441   0072
        SLR     R2,     1                       ; D442   0062
        SWAP    R2,     1                       ; D443   0042
        SWAP    R2,     1                       ; D444   0042
        DECLE   $0001                           ; D445   0001

        EIS                                     ; D446   0002
        DECLE   $0000,  $0000                   ; D447   0000 0000

        JSRD    R4,     G_040F                  ; D449   0004 0006 000F

        COMR    R7                              ; D44C   001F
        DECR    R3                              ; D44D   0013
        INCR    R6                              ; D44E   000E
        INCR    R4                              ; D44F   000C
        EIS                                     ; D450   0002
        INCR    R7                              ; D451   000F
        COMR    R0                              ; D452   0018
        GSWD    R1                              ; D453   0031
        SWAP    R1,     1                       ; D454   0041
        SWAP    R1,     1                       ; D455   0041
        DECLE   $0000,  $0001                   ; D456   0000 0001

        SETC                                    ; D458   0007
        CLRC                                    ; D459   0006
        DECLE   $0000                           ; D45A   0000

        INCR    R4                              ; D45B   000C
        COMR    R6                              ; D45C   001E
        ADCR    R6                              ; D45D   002E
        ADCR    R5                              ; D45E   002D
        DECR    R1                              ; D45F   0011
        INCR    R5                              ; D460   000D
        COMR    R6                              ; D461   001E
        DECR    R3                              ; D462   0013
        GSWD    R0                              ; D463   0030
        NEGR    R1                              ; D464   0021
        SWAP    R1,     1                       ; D465   0041
        DECLE   $0000                           ; D466   0000

        MOVR    R0,     R1                      ; D467   0081
        INCR    R4                              ; D468   000C
        INCR    R6                              ; D469   000E
        INCR    R4                              ; D46A   000C
        DECLE   $0000                           ; D46B   0000

        INCR    R4                              ; D46C   000C
        COMR    R6                              ; D46D   001E
        ADCR    R5                              ; D46E   002D
        SWAP    R1,     1                       ; D46F   0041
        ADCR    R5                              ; D470   002D
        COMR    R6                              ; D471   001E
        GSWD    R3                              ; D472   0033
        NEGR    R0                              ; D473   0020
        SWAP    R1,     1                       ; D474   0041
        SWAP    R1,     1                       ; D475   0041
        DECLE   $0000                           ; D476   0000

        MOVR    R0,     R1                      ; D477   0081
        INCR    R4                              ; D478   000C
        INCR    R6                              ; D479   000E
        INCR    R0                              ; D47A   0008
        DECLE   $0000                           ; D47B   0000

        INCR    R4                              ; D47C   000C
        COMR    R6                              ; D47D   001E
        ADCR    R5                              ; D47E   002D
        DECLE   $0037                           ; D47F   0037

        JSR     R4,     G_0C1E                  ; D480   0004 000C 001E

        GSWD    R2                              ; D483   0032
        NEGR    R2                              ; D484   0022
        SWAP    R0,     1                       ; D485   0040
        EIS                                     ; D486   0002
        SWAP    R0,     1                       ; D487   0040
        COMR    R0                              ; D488   0018
        COMR    R4                              ; D489   001C
        DECR    R0                              ; D48A   0010
        DECLE   $0000                           ; D48B   0000

        COMR    R0                              ; D48C   0018
        RSWD    R4                              ; D48D   003C
        SLLC    R2,     1                       ; D48E   005A
        MOVR    R3,     R1                      ; D48F   0099
        SWAP    R1,     1                       ; D490   0041
        COMR    R0                              ; D491   0018
        RSWD    R4                              ; D492   003C
        NEGR    R6                              ; D493   0026
        SLR     R2,     1                       ; D494   0062
        SWAP    R0,     1                       ; D495   0040
        EIS                                     ; D496   0002
        SWAP    R0,     1                       ; D497   0040
        DECLE   $0000                           ; D498   0000

        INCR    R4                              ; D499   000C
        INCR    R4                              ; D49A   000C
        DECLE   $0000,  $0000                   ; D49B   0000 0000

        COMR    R4                              ; D49D   001C
        ADCR    R6                              ; D49E   002E
        INCR    R6                              ; D49F   000E
        CLRC                                    ; D4A0   0006
        INCR    R4                              ; D4A1   000C
        INCR    R4                              ; D4A2   000C
        INCR    R4                              ; D4A3   000C
        INCR    R0                              ; D4A4   0008
        INCR    R0                              ; D4A5   0008
        DECLE   $0000                           ; D4A6   0000

        INCR    R0                              ; D4A7   0008
        DECLE   $0000                           ; D4A8   0000

        INCR    R4                              ; D4A9   000C
        INCR    R4                              ; D4AA   000C
        DECLE   $0000,  $0000                   ; D4AB   0000 0000

        INCR    R4                              ; D4AD   000C
        COMR    R6                              ; D4AE   001E
        ADCR    R5                              ; D4AF   002D
        DECR    R1                              ; D4B0   0011
        INCR    R4                              ; D4B1   000C
        INCR    R2                              ; D4B2   000A
        INCR    R2                              ; D4B3   000A
        INCR    R4                              ; D4B4   000C
        INCR    R0                              ; D4B5   0008
        DECLE   $0000                           ; D4B6   0000

        INCR    R0                              ; D4B7   0008
        DECLE   $0000                           ; D4B8   0000

        COMR    R0                              ; D4B9   0018
        COMR    R0                              ; D4BA   0018
        DECLE   $0000,  $0000                   ; D4BB   0000 0000

        COMR    R4                              ; D4BD   001C
        RSWD    R2                              ; D4BE   003A
        RSWD    R0                              ; D4BF   0038
        DECR    R0                              ; D4C0   0010
        COMR    R0                              ; D4C1   0018
        COMR    R0                              ; D4C2   0018
        COMR    R4                              ; D4C3   001C
        DECR    R4                              ; D4C4   0014

        JSR     R4,     .STIC.X.4               ; D4C5   0004 0000 0004
        DECLE   $0000                           ; D4C8   0000

        COMR    R0                              ; D4C9   0018
        COMR    R0                              ; D4CA   0018
        DECLE   $0000,  $0000                   ; D4CB   0000 0000

        COMR    R0                              ; D4CD   0018
        RSWD    R4                              ; D4CE   003C
        SLLC    R2,     1                       ; D4CF   005A
        SWAP    R0,     2                       ; D4D0   0044
        COMR    R0                              ; D4D1   0018
        COMR    R0                              ; D4D2   0018
        COMR    R0                              ; D4D3   0018
        INCR    R0                              ; D4D4   0008
        INCR    R0                              ; D4D5   0008
        DECLE   $0000                           ; D4D6   0000

        INCR    R0                              ; D4D7   0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4D8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4DC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D4E0   0000 0000 0000

        INCR    R4                              ; D4E3   000C
        COMR    R4                              ; D4E4   001C

        JSR     R4,     .STIC.X.0               ; D4E5   0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4E8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4EC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D4F0   0000 0000 0000

        CLRC                                    ; D4F3   0006
        INCR    R6                              ; D4F4   000E
        EIS                                     ; D4F5   0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4F6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4FA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D4FE   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D502   0000 0000

        INCR    R4                              ; D504   000C
        COMR    R4                              ; D505   001C

        JSR     R4,     .STIC.X.0               ; D506   0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D509   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D50D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D511   0000 0000 0000

        COMR    R0                              ; D514   0018
        RSWD    R0                              ; D515   0038
        INCR    R0                              ; D516   0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; D517   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D51B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D51F   0000 0000 0000 0000
        DECLE   $0000                           ; D523   0000

        COMR    R0                              ; D524   0018
        RSWD    R0                              ; D525   0038
        INCR    R0                              ; D526   0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; D527   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D52B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D52F   0000 0000 0000 0000
        DECLE   $0000                           ; D533   0000

        COMR    R0                              ; D534   0018
        RSWD    R0                              ; D535   0038
        INCR    R0                              ; D536   0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; D537   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D53B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D53F   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D543   0000 0000

        COMR    R0                              ; D545   0018
        RSWD    R0                              ; D546   0038
        INCR    R0                              ; D547   0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; D548   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D54C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D550   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D554   0000 0000

        COMR    R0                              ; D556   0018
        RSWD    R0                              ; D557   0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; D558   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D55C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D560   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D564   0000 0000 0000

        DIS                                     ; D567   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; D568   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D56C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D570   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D574   0000 0000 0000 0000

        INCR    R4                              ; D578   000C
        COMR    R6                              ; D579   001E
        RSWD    R6                              ; D57A   003E
        COMR    R4                              ; D57B   001C
        INCR    R4                              ; D57C   000C
        DECLE   $0000                           ; D57D   0000

        INCR    R4                              ; D57E   000C
        INCR    R4                              ; D57F   000C
        COMR    R0                              ; D580   0018
        DECR    R4                              ; D581   0014
        DECR    R2                              ; D582   0012
        DECR    R2                              ; D583   0012
        DECR    R0                              ; D584   0010
        CLRC                                    ; D585   0006
        GSWD    R0                              ; D586   0030
        DECLE   $0000                           ; D587   0000

        SETC                                    ; D588   0007
        INCR    R7                              ; D589   000F
        COMR    R6                              ; D58A   001E
        INCR    R6                              ; D58B   000E
        CLRC                                    ; D58C   0006
        DECLE   $0000                           ; D58D   0000

        CLRC                                    ; D58E   0006
        INCR    R6                              ; D58F   000E
        COMR    R0                              ; D590   0018
        DECR    R2                              ; D591   0012
        DECR    R1                              ; D592   0011
        DECR    R1                              ; D593   0011
        DECLE   $0000                           ; D594   0000

        DECR    R3                              ; D595   0013
        NEGR    R0                              ; D596   0020
        DECLE   $0000,  $0000                   ; D597   0000 0000

        INCR    R0                              ; D599   0008
        COMR    R4                              ; D59A   001C
        NOP                                     ; D59B   0034
        SAR     R0,     2                       ; D59C   006C
        GSWD    R0                              ; D59D   0030
        INCR    R4                              ; D59E   000C
        INCR    R4                              ; D59F   000C
        COMR    R0                              ; D5A0   0018
        DECR    R4                              ; D5A1   0014
        DECLE   $0036                           ; D5A2   0036

        NEGR    R3                              ; D5A3   0023
        NEGR    R0                              ; D5A4   0020
        DIS                                     ; D5A5   0003
        NEGR    R0                              ; D5A6   0020
        SWAP    R0,     1                       ; D5A7   0040
        DECLE   $0000                           ; D5A8   0000

        DECR    R0                              ; D5A9   0010
        RSWD    R0                              ; D5AA   0038
        SAR     R0,     1                       ; D5AB   0068
        MOVR    R3,     R0                      ; D5AC   0098
        SLR     R0,     1                       ; D5AD   0060
        COMR    R0                              ; D5AE   0018
        COMR    R0                              ; D5AF   0018
        DECR    R0                              ; D5B0   0010
        GSWD    R0                              ; D5B1   0030
        ADCR    R4                              ; D5B2   002C
        SLR     R2,     2                       ; D5B3   0066
        SWAP    R1,     1                       ; D5B4   0041
        SWAP    R2,     1                       ; D5B5   0042
        DECLE   $0000                           ; D5B6   0000

        ADDR    R0,     R0                      ; D5B7   00C0
        DECLE   $0000                           ; D5B8   0000

        COMR    R0                              ; D5B9   0018
        RSWD    R0                              ; D5BA   0038
        ADCR    R0                              ; D5BB   0028
        RLC     R0,     1                       ; D5BC   0050
        SAR     R0,     1                       ; D5BD   0068
        COMR    R0                              ; D5BE   0018
        COMR    R0                              ; D5BF   0018
        COMR    R0                              ; D5C0   0018
        GSWD    R0                              ; D5C1   0030
        ADCR    R4                              ; D5C2   002C
        SLR     R3,     2                       ; D5C3   0067
        SWAP    R0,     1                       ; D5C4   0040
        SWAP    R1,     1                       ; D5C5   0041
        DECLE   $0000                           ; D5C6   0000

        ADDR    R0,     R0                      ; D5C7   00C0
        DECLE   $0000                           ; D5C8   0000

        COMR    R0                              ; D5C9   0018
        RSWD    R4                              ; D5CA   003C
        RRC     R0,     2                       ; D5CB   0074
        ADCR    R0                              ; D5CC   0028
        DECR    R0                              ; D5CD   0010
        INCR    R0                              ; D5CE   0008
        COMR    R0                              ; D5CF   0018
        COMR    R0                              ; D5D0   0018
        GSWD    R0                              ; D5D1   0030
        ADCR    R0                              ; D5D2   0028
        SAR     R0,     2                       ; D5D3   006C
        SWAP    R3,     2                       ; D5D4   0047
        SWAP    R1,     1                       ; D5D5   0041
        DECLE   $0000                           ; D5D6   0000

        ADDR    R0,     R0                      ; D5D7   00C0
        DECLE   $0000,  $0000                   ; D5D8   0000 0000

        COMR    R0                              ; D5DA   0018
        RSWD    R4                              ; D5DB   003C
        GSWD    R2                              ; D5DC   0032
        COMR    R4                              ; D5DD   001C
        DECLE   $0000                           ; D5DE   0000

        COMR    R0                              ; D5DF   0018
        COMR    R0                              ; D5E0   0018
        GSWD    R0                              ; D5E1   0030
        ADCR    R0                              ; D5E2   0028
        SAR     R0,     2                       ; D5E3   006C
        SWAP    R3,     2                       ; D5E4   0047
        SWAP    R1,     1                       ; D5E5   0041
        DECLE   $0000                           ; D5E6   0000

        ADDR    R0,     R0                      ; D5E7   00C0
        DECR    R0                              ; D5E8   0010
        DECLE   $0000,  $0000                   ; D5E9   0000 0000

        COMR    R0                              ; D5EB   0018
        RSWD    R4                              ; D5EC   003C
        GSWD    R2                              ; D5ED   0032
        COMR    R1                              ; D5EE   0019
        DECLE   $0000                           ; D5EF   0000

        COMR    R0                              ; D5F0   0018
        GSWD    R0                              ; D5F1   0030
        SAR     R0,     1                       ; D5F2   0068
        SLL     R2,     2                       ; D5F3   004E
        SWAP    R1,     1                       ; D5F4   0041
        NEGR    R0                              ; D5F5   0020
        DECR    R0                              ; D5F6   0010
        NEGR    R0                              ; D5F7   0020
        RSWD    R0                              ; D5F8   0038
        INCR    R0                              ; D5F9   0008
        DECLE   $0000                           ; D5FA   0000

        INCR    R0                              ; D5FB   0008
        COMR    R4                              ; D5FC   001C
        SLLC    R2,     1                       ; D5FD   005A
        RSWD    R2                              ; D5FE   003A
        DECR    R4                              ; D5FF   0014
        DECLE   $0000                           ; D600   0000

        COMR    R0                              ; D601   0018
        GSWD    R2                              ; D602   0032
        NEGR    R5                              ; D603   0025
        NEGR    R0                              ; D604   0020
        DECR    R0                              ; D605   0010
        INCR    R0                              ; D606   0008
        DECR    R0                              ; D607   0010
        GSWD    R0                              ; D608   0030
        RRC     R0,     1                       ; D609   0070
        DECR    R0                              ; D60A   0010
        DECLE   $0000                           ; D60B   0000

        DECR    R0                              ; D60C   0010
        COMR    R0                              ; D60D   0018
        ADCR    R0                              ; D60E   0028
        COMR    R0                              ; D60F   0018
        DECLE   $0000                           ; D610   0000

        COMR    R0                              ; D611   0018
        GSWD    R0                              ; D612   0030
        SLLC    R0,     1                       ; D613   0058
        SLL     R0,     1                       ; D614   0048
        ADCR    R4                              ; D615   002C
        SWAP    R2,     1                       ; D616   0042

        JSR     R4,     .GROM.070               ; D617   0004 0030 0070

        DECR    R0                              ; D61A   0010
        DECLE   $0000                           ; D61B   0000

        DECR    R0                              ; D61C   0010
        COMR    R0                              ; D61D   0018
        INCR    R0                              ; D61E   0008
        RSWD    R0                              ; D61F   0038
        DECLE   $0000                           ; D620   0000

        COMR    R0                              ; D621   0018
        COMR    R2                              ; D622   001A
        COMR    R4                              ; D623   001C
        INCR    R0                              ; D624   0008
        INCR    R0                              ; D625   0008
        INCR    R0                              ; D626   0008
        DECR    R0                              ; D627   0010
        GSWD    R0                              ; D628   0030
        RRC     R0,     1                       ; D629   0070
        DECR    R0                              ; D62A   0010
        DECLE   $0000                           ; D62B   0000

        DECR    R0                              ; D62C   0010
        COMR    R0                              ; D62D   0018
        SLLC    R0,     1                       ; D62E   0058
        NOP                                     ; D62F   0034
        INCR    R0                              ; D630   0008
        COMR    R0                              ; D631   0018
        ADCR    R0                              ; D632   0028
        ADCR    R4                              ; D633   002C
        NEGR    R4                              ; D634   0024
        DECR    R4                              ; D635   0014

        JSR     R4,     G_0800                  ; D636   0004 0008 0000

        GSWD    R0                              ; D639   0030
        RRC     R0,     1                       ; D63A   0070
        DECR    R0                              ; D63B   0010
        DECLE   $0000                           ; D63C   0000

        COMR    R0                              ; D63D   0018
        MOVR    R7,     R4                      ; D63E   00BC
        SAR     R2,     1                       ; D63F   006A
        DECLE   $0000                           ; D640   0000

        COMR    R0                              ; D641   0018
        ADCR    R4                              ; D642   002C
        SWAP    R0,     2                       ; D643   0044
        SWAP    R2,     1                       ; D644   0042
        NEGR    R2                              ; D645   0022
        SWAP    R1,     1                       ; D646   0041
        EIS                                     ; D647   0002
        DECLE   $0000                           ; D648   0000

        GSWD    R0                              ; D649   0030
        RRC     R0,     1                       ; D64A   0070
        DECR    R0                              ; D64B   0010
        DECLE   $0000                           ; D64C   0000

        DECR    R0                              ; D64D   0010
        SLL     R0,     1                       ; D64E   0048
        RSWD    R0                              ; D64F   0038
        DECLE   $0000                           ; D650   0000

        INCR    R0                              ; D651   0008
        COMR    R0                              ; D652   0018
        RSWD    R0                              ; D653   0038
        ADCR    R6                              ; D654   002E
        NEGR    R2                              ; D655   0022
        NEGR    R0                              ; D656   0020
        SWAP    R0,     1                       ; D657   0040
        DECLE   $0000                           ; D658   0000

        COMR    R0                              ; D659   0018
        RSWD    R0                              ; D65A   0038
        INCR    R0                              ; D65B   0008
        DECLE   $0000                           ; D65C   0000

        RSWD    R4                              ; D65D   003C
        SLLC    R2,     1                       ; D65E   005A
        MOVR    R3,     R1                      ; D65F   0099
        DECLE   $0000                           ; D660   0000

        COMR    R0                              ; D661   0018
        RSWD    R4                              ; D662   003C
        SLR     R2,     2                       ; D663   0066
        SWAP    R2,     1                       ; D664   0042
        SWAP    R2,     1                       ; D665   0042
        DECLE   $0000                           ; D666   0000

        ADDR    R0,     R2                      ; D667   00C2
        COMR    R0                              ; D668   0018
        RSWD    R0                              ; D669   0038
        INCR    R0                              ; D66A   0008
        DECLE   $0000                           ; D66B   0000

        COMR    R0                              ; D66C   0018
        SARC    R2,     2                       ; D66D   007E
        MOVR    R3,     R1                      ; D66E   0099
        DECLE   $0000                           ; D66F   0000

        COMR    R0                              ; D670   0018
        RSWD    R0                              ; D671   0038
        ADCR    R0                              ; D672   0028
        ADCR    R0                              ; D673   0028
        COMR    R0                              ; D674   0018
        DECLE   $0000                           ; D675   0000

        COMR    R0                              ; D676   0018
        DECLE   $0000,  $0000                   ; D677   0000 0000

        COMR    R0                              ; D679   0018
        RSWD    R0                              ; D67A   0038
        INCR    R0                              ; D67B   0008
        DECLE   $0000                           ; D67C   0000

        RSWD    R4                              ; D67D   003C
        SLLC    R2,     1                       ; D67E   005A
        MOVR    R3,     R1                      ; D67F   0099
        DECLE   $0000                           ; D680   0000

        COMR    R0                              ; D681   0018
        RSWD    R4                              ; D682   003C
        NEGR    R6                              ; D683   0026
        NEGR    R2                              ; D684   0022
        NEGR    R4                              ; D685   0024
        DECLE   $0000                           ; D686   0000

        SLR     R0,     2                       ; D687   0064
        DECLE   $0000,  $0000                   ; D688   0000 0000

        SLR     R0,     1                       ; D68A   0060
        ADDR    R4,     R0                      ; D68B   00E0
        NEGR    R0                              ; D68C   0020
        DECR    R0                              ; D68D   0010
        RSWD    R0                              ; D68E   0038
        SAR     R0,     2                       ; D68F   006C
        DECLE   $0000                           ; D690   0000

        COMR    R4                              ; D691   001C
        SARC    R0,     1                       ; D692   0078
        SLL     R0,     1                       ; D693   0048
        SLL     R0,     1                       ; D694   0048
        SLL     R0,     2                       ; D695   004C
        SETC                                    ; D696   0007
        ADDR    R0,     R1                      ; D697   00C1
        DECLE   $0000                           ; D698   0000

        COMR    R0                              ; D699   0018
        RSWD    R0                              ; D69A   0038
        INCR    R0                              ; D69B   0008
        DECLE   $0000                           ; D69C   0000

        RSWD    R4                              ; D69D   003C
        SLLC    R2,     1                       ; D69E   005A
        RSWD    R4                              ; D69F   003C
        DECLE   $0000                           ; D6A0   0000

        COMR    R0                              ; D6A1   0018
        RSWD    R4                              ; D6A2   003C
        SLR     R2,     2                       ; D6A3   0066
        SWAP    R2,     1                       ; D6A4   0042
        SWAP    R2,     1                       ; D6A5   0042
        DECLE   $0000                           ; D6A6   0000

        ADDR    R0,     R2                      ; D6A7   00C2
        COMR    R0                              ; D6A8   0018
        RSWD    R0                              ; D6A9   0038
        INCR    R0                              ; D6AA   0008
        DECLE   $0000                           ; D6AB   0000

        COMR    R4                              ; D6AC   001C
        RSWD    R2                              ; D6AD   003A
        COMR    R4                              ; D6AE   001C
        DECLE   $0000                           ; D6AF   0000

        COMR    R0                              ; D6B0   0018
        RSWD    R0                              ; D6B1   0038
        ADCR    R0                              ; D6B2   0028
        ADCR    R0                              ; D6B3   0028
        COMR    R0                              ; D6B4   0018
        DECLE   $0000                           ; D6B5   0000

        COMR    R0                              ; D6B6   0018
        DECLE   $0000,  $0000                   ; D6B7   0000 0000

        COMR    R0                              ; D6B9   0018
        RSWD    R0                              ; D6BA   0038
        INCR    R0                              ; D6BB   0008
        DECLE   $0000                           ; D6BC   0000

        COMR    R4                              ; D6BD   001C
        RSWD    R6                              ; D6BE   003E
        RSWD    R1                              ; D6BF   0039
        DECLE   $0000                           ; D6C0   0000

        COMR    R0                              ; D6C1   0018
        RSWD    R4                              ; D6C2   003C
        NEGR    R6                              ; D6C3   0026
        NEGR    R2                              ; D6C4   0022
        NEGR    R4                              ; D6C5   0024
        NEGR    R0                              ; D6C6   0020
        SWAP    R0,     2                       ; D6C7   0044
        DECLE   $0000                           ; D6C8   0000

        COMR    R2                              ; D6C9   001A
        RSWD    R0                              ; D6CA   0038
        INCR    R2                              ; D6CB   000A
        EIS                                     ; D6CC   0002
        COMR    R6                              ; D6CD   001E
        RSWD    R0                              ; D6CE   0038
        SLLC    R0,     1                       ; D6CF   0058
        SWAP    R0,     1                       ; D6D0   0040
        COMR    R0                              ; D6D1   0018
        RSWD    R0                              ; D6D2   0038
        SAR     R0,     2                       ; D6D3   006C
        SWAP    R0,     2                       ; D6D4   0044
        CLRC                                    ; D6D5   0006
        SWAP    R0,     1                       ; D6D6   0040
        MOVR    R0,     R2                      ; D6D7   0082
        DECLE   $0000                           ; D6D8   0000

        GSWD    R0                              ; D6D9   0030
        RRC     R0,     1                       ; D6DA   0070
        DECR    R1                              ; D6DB   0011
        CLRC                                    ; D6DC   0006
        COMR    R4                              ; D6DD   001C
        COMR    R0                              ; D6DE   0018
        RSWD    R0                              ; D6DF   0038
        DECLE   $0000                           ; D6E0   0000

        COMR    R0                              ; D6E1   0018
        SARC    R0,     1                       ; D6E2   0078
        SLL     R0,     2                       ; D6E3   004C
        SWAP    R0,     2                       ; D6E4   0044
        SWAP    R2,     2                       ; D6E5   0046
        DECLE   $0001                           ; D6E6   0001

        ADDR    R0,     R2                      ; D6E7   00C2
        DECLE   $0000,  $0000                   ; D6E8   0000 0000

        SLR     R0,     1                       ; D6EA   0060
        ADDR    R4,     R0                      ; D6EB   00E0
        NEGR    R0                              ; D6EC   0020
        DECR    R0                              ; D6ED   0010
        RSWD    R0                              ; D6EE   0038
        ADDR    R5,     R4                      ; D6EF   00EC
        DECLE   $0000                           ; D6F0   0000

        COMR    R4                              ; D6F1   001C
        SARC    R0,     1                       ; D6F2   0078
        SLL     R0,     1                       ; D6F3   0048
        SLL     R0,     1                       ; D6F4   0048
        SLL     R0,     2                       ; D6F5   004C
        SETC                                    ; D6F6   0007
        ADDR    R0,     R1                      ; D6F7   00C1
        DECLE   $0000,  $0000                   ; D6F8   0000 0000

        SLR     R0,     1                       ; D6FA   0060
        ADDR    R4,     R0                      ; D6FB   00E0
        NEGR    R0                              ; D6FC   0020
        DECR    R0                              ; D6FD   0010
        RSWD    R0                              ; D6FE   0038
        SAR     R0,     2                       ; D6FF   006C
        DECLE   $0000                           ; D700   0000

        COMR    R4                              ; D701   001C
        SARC    R0,     1                       ; D702   0078
        SLL     R0,     1                       ; D703   0048
        SLL     R0,     1                       ; D704   0048
        SLL     R0,     2                       ; D705   004C
        SETC                                    ; D706   0007
        ADDR    R0,     R1                      ; D707   00C1
        DECLE   $0000                           ; D708   0000

        INCR    R4                              ; D709   000C
        INCR    R4                              ; D70A   000C
        DECLE   $0000                           ; D70B   0000

        SLL     R0,     1                       ; D70C   0048
        RSWD    R4                              ; D70D   003C
        COMR    R6                              ; D70E   001E
        INCR    R5                              ; D70F   000D
        INCR    R4                              ; D710   000C
        INCR    R4                              ; D711   000C
        CLRC                                    ; D712   0006
        INCR    R2                              ; D713   000A
        DECR    R2                              ; D714   0012
        DECR    R0                              ; D715   0010
        EIS                                     ; D716   0002
        DECLE   $0000,  $0000,  $0000           ; D717   0000 0000 0000

        CLRC                                    ; D71A   0006
        CLRC                                    ; D71B   0006
        DECLE   $0000                           ; D71C   0000

        JSRD    R4,     G_0C0E                  ; D71D   0004 000E 000E

        INCR    R5                              ; D720   000D
        INCR    R4                              ; D721   000C
        CLRC                                    ; D722   0006
        INCR    R2                              ; D723   000A
        INCR    R2                              ; D724   000A
        DECR    R0                              ; D725   0010
        DECR    R2                              ; D726   0012
        DECLE   $0000,  $0000,  $0000           ; D727   0000 0000 0000

        CLRC                                    ; D72A   0006
        CLRC                                    ; D72B   0006
        DECLE   $0000                           ; D72C   0000

        JSRD    R4,     G_0C0E                  ; D72D   0004 000E 000E

        INCR    R5                              ; D730   000D
        INCR    R4                              ; D731   000C
        CLRC                                    ; D732   0006
        INCR    R2                              ; D733   000A
        INCR    R2                              ; D734   000A
        DECR    R0                              ; D735   0010
        DECR    R2                              ; D736   0012
        DECLE   $0000                           ; D737   0000

        COMR    R0                              ; D738   0018
        COMR    R0                              ; D739   0018
        DECLE   $0000,  $0000                   ; D73A   0000 0000

        COMR    R0                              ; D73C   0018
        COMR    R0                              ; D73D   0018
        RSWD    R0                              ; D73E   0038
        SWAP    R0,     1                       ; D73F   0040
        INCR    R0                              ; D740   0008
        COMR    R0                              ; D741   0018
        GSWD    R0                              ; D742   0030
        ADCR    R0                              ; D743   0028
        NEGR    R4                              ; D744   0024
        SLL     R0,     1                       ; D745   0048
        DECLE   $0000,  $0000                   ; D746   0000 0000

        INCR    R4                              ; D748   000C
        INCR    R4                              ; D749   000C
        DECLE   $0000,  $0000                   ; D74A   0000 0000

        RSWD    R4                              ; D74C   003C
        SLL     R2,     2                       ; D74D   004E
        INCR    R6                              ; D74E   000E
        INCR    R4                              ; D74F   000C
        DECLE   $0000                           ; D750   0000

        INCR    R4                              ; D751   000C
        INCR    R4                              ; D752   000C
        INCR    R4                              ; D753   000C

        JSR     R4,     G_0804                  ; D754   0004 0008 0004
        DECLE   $0000                           ; D757   0000

        INCR    R4                              ; D758   000C
        INCR    R4                              ; D759   000C
        DECR    R0                              ; D75A   0010
        NEGR    R0                              ; D75B   0020
        RSWD    R4                              ; D75C   003C
        INCR    R6                              ; D75D   000E
        INCR    R5                              ; D75E   000D
        INCR    R5                              ; D75F   000D
        DECLE   $0000                           ; D760   0000

        INCR    R4                              ; D761   000C
        INCR    R4                              ; D762   000C
        INCR    R2                              ; D763   000A
        EIS                                     ; D764   0002
        INCR    R2                              ; D765   000A
        DECLE   $0000                           ; D766   0000

        EIS                                     ; D767   0002
        DECLE   $0000                           ; D768   0000

        INCR    R4                              ; D769   000C
        INCR    R4                              ; D76A   000C
        DECLE   $0000                           ; D76B   0000

        SWAP    R0,     1                       ; D76C   0040
        RSWD    R4                              ; D76D   003C
        INCR    R6                              ; D76E   000E
        INCR    R5                              ; D76F   000D
        DECLE   $0000                           ; D770   0000

        INCR    R4                              ; D771   000C
        INCR    R6                              ; D772   000E
        INCR    R2                              ; D773   000A
        INCR    R2                              ; D774   000A
        DECR    R2                              ; D775   0012
        DECLE   $0000                           ; D776   0000

        EIS                                     ; D777   0002
        DECLE   $0000,  $0000                   ; D778   0000 0000

        INCR    R4                              ; D77A   000C
        INCR    R6                              ; D77B   000E
        DECLE   $0000                           ; D77C   0000

        JSRD    R4,     G_0C0A                  ; D77D   0004 000E 000A
        JSRD    R4,     .STIC.Y.4               ; D780   0004 0002 000C

        INCR    R2                              ; D783   000A
        DECR    R2                              ; D784   0012
        EIS                                     ; D785   0002
        DECLE   $0000                           ; D786   0000

        EIS                                     ; D787   0002
        DECLE   $0000,  $0000                   ; D788   0000 0000

        INCR    R4                              ; D78A   000C
        INCR    R6                              ; D78B   000E
        DECLE   $0000                           ; D78C   0000

        JSRD    R4,     G_0C08                  ; D78D   0004 000E 0008

        CLRC                                    ; D790   0006
        DECLE   $0001                           ; D791   0001

        INCR    R6                              ; D792   000E
        INCR    R2                              ; D793   000A
        DECR    R2                              ; D794   0012
        EIS                                     ; D795   0002
        DECLE   $0000                           ; D796   0000

        EIS                                     ; D797   0002
        DECLE   $0000,  $0000,  $0000           ; D798   0000 0000 0000

        COMR    R0                              ; D79B   0018
        COMR    R0                              ; D79C   0018
        DECLE   $0000                           ; D79D   0000

        INCR    R0                              ; D79E   0008
        COMR    R4                              ; D79F   001C
        COMR    R2                              ; D7A0   001A
        ADCR    R2                              ; D7A1   002A
        ADCR    R2                              ; D7A2   002A
        DECR    R6                              ; D7A3   0016
        SAR     R0,     2                       ; D7A4   006C
        SLL     R0,     2                       ; D7A5   004C
        INCR    R2                              ; D7A6   000A
        TSTR    R0                              ; D7A7   0080
        DECLE   $0000,  $0000                   ; D7A8   0000 0000

        INCR    R4                              ; D7AA   000C
        INCR    R6                              ; D7AB   000E
        INCR    R0                              ; D7AC   0008
        DECLE   $0000                           ; D7AD   0000

        INCR    R0                              ; D7AE   0008
        COMR    R4                              ; D7AF   001C
        COMR    R2                              ; D7B0   001A
        INCR    R5                              ; D7B1   000D
        SETC                                    ; D7B2   0007
        COMR    R3                              ; D7B3   001B
        GSWD    R2                              ; D7B4   0032
        SLR     R0,     1                       ; D7B5   0060
        SWAP    R2,     1                       ; D7B6   0042
        TSTR    R0                              ; D7B7   0080
        COMR    R0                              ; D7B8   0018
        COMR    R4                              ; D7B9   001C
        DECR    R0                              ; D7BA   0010
        DECLE   $0000                           ; D7BB   0000

        COMR    R0                              ; D7BC   0018
        COMR    R7                              ; D7BD   001F
        DECR    R1                              ; D7BE   0011
        CLRC                                    ; D7BF   0006
        COMR    R0                              ; D7C0   0018
        COMR    R4                              ; D7C1   001C
        DECR    R6                              ; D7C2   0016
        GSWD    R2                              ; D7C3   0032
        SLR     R2,     1                       ; D7C4   0062
        SWAP    R0,     1                       ; D7C5   0040
        EIS                                     ; D7C6   0002
        TSTR    R0                              ; D7C7   0080
        COMR    R0                              ; D7C8   0018
        COMR    R4                              ; D7C9   001C
        DECR    R2                              ; D7CA   0012
        SETC                                    ; D7CB   0007
        COMR    R5                              ; D7CC   001D
        DECR    R2                              ; D7CD   0012
        COMR    R4                              ; D7CE   001C
        INCR    R0                              ; D7CF   0008
        COMR    R4                              ; D7D0   001C
        DECR    R6                              ; D7D1   0016
        DECR    R2                              ; D7D2   0012
        GSWD    R2                              ; D7D3   0032
        NEGR    R2                              ; D7D4   0022
        NEGR    R0                              ; D7D5   0020
        EIS                                     ; D7D6   0002
        SWAP    R0,     1                       ; D7D7   0040
        DECR    R6                              ; D7D8   0016
        INCR    R6                              ; D7D9   000E
        INCR    R2                              ; D7DA   000A
        COMR    R2                              ; D7DB   001A
        DECR    R6                              ; D7DC   0016
        COMR    R4                              ; D7DD   001C
        INCR    R4                              ; D7DE   000C
        INCR    R0                              ; D7DF   0008
        COMR    R4                              ; D7E0   001C
        DECR    R4                              ; D7E1   0014
        DECR    R4                              ; D7E2   0014
        NEGR    R4                              ; D7E3   0024
        NEGR    R4                              ; D7E4   0024
        NEGR    R0                              ; D7E5   0020
        SWAP    R0,     2                       ; D7E6   0044
        DECLE   $0000,  $0000,  $0000,  $0000   ; D7E7   0000 0000 0000 0000
        DECLE   $0000                           ; D7EB   0000

        COMR    R0                              ; D7EC   0018
        COMR    R0                              ; D7ED   0018
        DECLE   $0000,  $0000                   ; D7EE   0000 0000

        RSWD    R0                              ; D7F0   0038
        SLLC    R1,     2                       ; D7F1   005D
        SLLC    R2,     1                       ; D7F2   005A
        DECLE   $0000                           ; D7F3   0000

        COMR    R4                              ; D7F4   001C
        COMR    R2                              ; D7F5   001A
        DECLE   $0000                           ; D7F6   0000

        INCR    R0                              ; D7F7   0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; D7F8   0000 0000 0000 0000
        DECLE   $0000                           ; D7FC   0000

        COMR    R0                              ; D7FD   0018
        COMR    R0                              ; D7FE   0018
        DECLE   $0000,  $0000                   ; D7FF   0000 0000

        RSWD    R5                              ; D801   003D
        SARC    R2,     1                       ; D802   007A
        COMR    R0                              ; D803   0018
        DECLE   $0000                           ; D804   0000

        COMR    R4                              ; D805   001C
        COMR    R2                              ; D806   001A

        JSR     R4,     .STIC.X.0               ; D807   0004 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D80A   0000 0000 0000

        COMR    R0                              ; D80D   0018
        COMR    R0                              ; D80E   0018
        DECLE   $0000,  $0000                   ; D80F   0000 0000

        COMR    R2                              ; D811   001A
        RSWD    R4                              ; D812   003C
        COMR    R0                              ; D813   0018
        DECLE   $0000                           ; D814   0000

        COMR    R4                              ; D815   001C
        COMR    R2                              ; D816   001A

        JSR     R4,     .STIC.X.0               ; D817   0004 0000 0000

        INCR    R4                              ; D81A   000C
        COMR    R4                              ; D81B   001C

        JSR     R4,     G_0034                  ; D81C   0004 0000 0034

        SWAP    R2,     2                       ; D81F   0046
        DECR    R2                              ; D820   0012
        INCR    R4                              ; D821   000C
        DECLE   $0000                           ; D822   0000

        INCR    R2                              ; D823   000A
        DECLE   $0036                           ; D824   0036

        SAR     R0,     2                       ; D825   006C
        ADDR    R1,     R0                      ; D826   00C8

        JSR     R4,     .STIC.X.0               ; D827   0004 0000 0000
        DECLE   $0000                           ; D82A   0000

        CLRC                                    ; D82B   0006
        INCR    R6                              ; D82C   000E
        EIS                                     ; D82D   0002
        COMR    R0                              ; D82E   0018
        ADCR    R6                              ; D82F   002E
        SETC                                    ; D830   0007
        DECLE   $0005                           ; D831   0005

        DIS                                     ; D832   0003

        JSRD    R4,     G_041A                  ; D833   0004 0006 001A

        MOVR    R6,     R4                      ; D836   00B4
        ADDR    R0,     R6                      ; D837   00C6
        DECLE   $0000,  $0000,  $0000,  $0000   ; D838   0000 0000 0000 0000

        CLRC                                    ; D83C   0006
        INCR    R6                              ; D83D   000E
        EIS                                     ; D83E   0002
        COMR    R0                              ; D83F   0018
        ADCR    R6                              ; D840   002E
        SETC                                    ; D841   0007
        SETC                                    ; D842   0007
        DECLE   $0001                           ; D843   0001

        SETC                                    ; D844   0007
        COMR    R5                              ; D845   001D
        MOVR    R6,     R4                      ; D846   00B4
        ADDR    R4,     R7                      ; D847   00E7
        ADDR    R7,     R7                      ; D848   00FF
        ADDR    R7,     R7                      ; D849   00FF
        ADDR    R7,     R4                      ; D84A   00FC
        ADDR    R7,     R1                      ; D84B   00F9
        ADDR    R6,     R3                      ; D84C   00F3
        ADDR    R4,     R7                      ; D84D   00E7
        ADDR    R1,     R7                      ; D84E   00CF
        ADDR    R7,     R7                      ; D84F   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; D850   0000 0000 0000 0000
        DECLE   $0000                           ; D854   0000

        INCR    R7                              ; D855   000F
        DECLE   $0000,  $0000,  $0000,  $0000   ; D856   0000 0000 0000 0000
        DECLE   $0000                           ; D85A   0000

        GSWD    R3                              ; D85B   0033
        GSWD    R3                              ; D85C   0033
        DECLE   $0000                           ; D85D   0000

        SLR     R2,     2                       ; D85E   0066
        SLR     R2,     2                       ; D85F   0066
        ADDR    R7,     R7                      ; D860   00FF
        RLC     R1,     2                       ; D861   0055
        RLC     R1,     2                       ; D862   0055
        RLC     R1,     2                       ; D863   0055
        ADDR    R7,     R7                      ; D864   00FF
        RLC     R1,     2                       ; D865   0055
        RLC     R1,     2                       ; D866   0055
        RLC     R1,     2                       ; D867   0055
        COMR    R0                              ; D868   0018
        ADCR    R4                              ; D869   002C
        ADCR    R4                              ; D86A   002C
        COMR    R0                              ; D86B   0018
        RSWD    R6                              ; D86C   003E
        SARC    R3,     2                       ; D86D   007F
        ADDR    R7,     R7                      ; D86E   00FF
        ADDR    R7,     R5                      ; D86F   00FD
        SARC    R3,     1                       ; D870   007B
        MOVR    R6,     R4                      ; D871   00B4
        ADDR    R5,     R4                      ; D872   00EC
        ADDR    R1,     R4                      ; D873   00CC
        ADDR    R1,     R6                      ; D874   00CE
        ADDR    R4,     R6                      ; D875   00E6
        DECLE   $0000                           ; D876   0000

        ADDR    R4,     R6                      ; D877   00E6

        JSRD    R4,     G_080A                  ; D878   0004 000A 000A

        INCR    R2                              ; D87B   000A
        INCR    R2                              ; D87C   000A
        INCR    R2                              ; D87D   000A

        JSR     R4,     .STIC.X.4               ; D87E   0004 0000 0004

        INCR    R4                              ; D881   000C

        JSR     R4,     G_0404                  ; D882   0004 0004 0004
        JSRD    R4,     G_0C00                  ; D885   0004 000E 0000
        JSRD    R4,     G_0802                  ; D888   0004 000A 0002
        JSR     R4,     G_0808                  ; D88B   0004 0008 0008

        INCR    R6                              ; D88E   000E
        DECLE   $0000                           ; D88F   0000

        JSRD    R4,     G_0802                  ; D890   0004 000A 0002
        JSRD    R4,     .STIC.Y.2               ; D893   0004 0002 000A
        JSR     R4,     .STIC.Y.0               ; D896   0004 0000 0008

        INCR    R0                              ; D899   0008
        INCR    R2                              ; D89A   000A
        INCR    R2                              ; D89B   000A
        INCR    R6                              ; D89C   000E
        EIS                                     ; D89D   0002
        EIS                                     ; D89E   0002
        DECLE   $0000                           ; D89F   0000

        INCR    R6                              ; D8A0   000E
        INCR    R0                              ; D8A1   0008
        INCR    R4                              ; D8A2   000C
        EIS                                     ; D8A3   0002
        EIS                                     ; D8A4   0002
        INCR    R2                              ; D8A5   000A

        JSR     R4,     .STIC.X.4               ; D8A6   0004 0000 0004

        INCR    R2                              ; D8A9   000A
        INCR    R0                              ; D8AA   0008
        INCR    R4                              ; D8AB   000C
        INCR    R2                              ; D8AC   000A
        INCR    R2                              ; D8AD   000A

        JSR     R4,     .STIC.Y.6               ; D8AE   0004 0000 000E

        EIS                                     ; D8B1   0002
        EIS                                     ; D8B2   0002

        JSR     R4,     G_0408                  ; D8B3   0004 0004 0008

        INCR    R0                              ; D8B6   0008
        DECLE   $0000                           ; D8B7   0000

        JSRD    R4,     G_080A                  ; D8B8   0004 000A 000A
        JSRD    R4,     G_080A                  ; D8BB   0004 000A 000A
        JSR     R4,     .STIC.X.4               ; D8BE   0004 0000 0004

        INCR    R2                              ; D8C1   000A
        INCR    R2                              ; D8C2   000A
        CLRC                                    ; D8C3   0006
        EIS                                     ; D8C4   0002
        INCR    R2                              ; D8C5   000A

        JSR     R4,     .STIC.Y.0               ; D8C6   0004 0000 0008

        INCR    R0                              ; D8C9   0008
        INCR    R0                              ; D8CA   0008
        INCR    R0                              ; D8CB   0008
        INCR    R0                              ; D8CC   0008
        INCR    R0                              ; D8CD   0008
        INCR    R6                              ; D8CE   000E
        DECLE   $0000                           ; D8CF   0000

        INCR    R4                              ; D8D0   000C
        INCR    R2                              ; D8D1   000A
        INCR    R2                              ; D8D2   000A
        INCR    R4                              ; D8D3   000C
        INCR    R2                              ; D8D4   000A
        INCR    R2                              ; D8D5   000A
        INCR    R2                              ; D8D6   000A
        DECLE   $0000                           ; D8D7   0000

        INCR    R6                              ; D8D8   000E

        JSR     R4,     G_0404                  ; D8D9   0004 0004 0004
        JSR     R4,     G_0404                  ; D8DC   0004 0004 0004
        DECLE   $0000                           ; D8DF   0000

        INCR    R6                              ; D8E0   000E
        INCR    R2                              ; D8E1   000A
        INCR    R2                              ; D8E2   000A
        INCR    R2                              ; D8E3   000A
        INCR    R2                              ; D8E4   000A
        INCR    R2                              ; D8E5   000A
        INCR    R6                              ; D8E6   000E
        DECLE   $0000                           ; D8E7   0000

        INCR    R4                              ; D8E8   000C
        INCR    R2                              ; D8E9   000A
        INCR    R2                              ; D8EA   000A
        INCR    R4                              ; D8EB   000C
        INCR    R2                              ; D8EC   000A
        INCR    R2                              ; D8ED   000A
        INCR    R4                              ; D8EE   000C
        DECLE   $0000                           ; D8EF   0000

        JSRD    R4,     G_0808                  ; D8F0   0004 000A 0008
        JSRD    R4,     .STIC.Y.2               ; D8F3   0004 0002 000A
        JSR     R4,     .STIC.X.0               ; D8F6   0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D8F9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D8FD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D901   0000 0000 0000 0000
        DECLE   $0000                           ; D905   0000

        JSR     R4,     G_00EF                  ; D906   0004 0000 00EF

        ADDR    R0,     R6                      ; D909   00C6
        SWAP    R0,     2                       ; D90A   0044
        ADDR    R4,     R4                      ; D90B   00E4
        MOVR    R7,     R6                      ; D90C   00BE
        COMR    R3                              ; D90D   001B
        DECR    R1                              ; D90E   0011
        DECR    R1                              ; D90F   0011
        ADDR    R5,     R7                      ; D910   00EF
        ADDR    R0,     R5                      ; D911   00C5
        SWAP    R0,     1                       ; D912   0040
        ADDR    R0,     R0                      ; D913   00C0
        ADDR    R5,     R6                      ; D914   00EE
        MOVR    R7,     R3                      ; D915   00BB
        DECR    R1                              ; D916   0011
        DECR    R1                              ; D917   0011
        ADDR    R3,     R7                      ; D918   00DF
        MOVR    R1,     R5                      ; D919   008D
        INCR    R0                              ; D91A   0008
        MOVR    R1,     R0                      ; D91B   0088
        ADDR    R5,     R6                      ; D91C   00EE
        MOVR    R6,     R7                      ; D91D   00B7
        DIS                                     ; D91E   0003
        DIS                                     ; D91F   0003
        ADDR    R3,     R7                      ; D920   00DF
        MOVR    R1,     R5                      ; D921   008D
        INCR    R0                              ; D922   0008
        MOVR    R1,     R0                      ; D923   0088
        ADDR    R5,     R2                      ; D924   00EA
        MOVR    R6,     R1                      ; D925   00B1
        DECR    R1                              ; D926   0011
        DECR    R1                              ; D927   0011
        SARC    R1,     2                       ; D928   007D
        MOVR    R5,     R3                      ; D929   00AB
        ADDR    R0,     R5                      ; D92A   00C5
        SLL     R2,     1                       ; D92B   004A
        ADDR    R6,     R0                      ; D92C   00F0
        RLC     R1,     2                       ; D92D   0055
        MOVR    R5,     R0                      ; D92E   00A8
        COMR    R0                              ; D92F   0018
        MOVR    R7,     R3                      ; D930   00BB
        MOVR    R5,     R3                      ; D931   00AB
        ADDR    R0,     R7                      ; D932   00C7
        SLL     R1,     2                       ; D933   004D
        ADDR    R5,     R0                      ; D934   00E8
        MOVR    R5,     R3                      ; D935   00AB
        DECR    R1                              ; D936   0011
        DECR    R1                              ; D937   0011
        ADDR    R7,     R7                      ; D938   00FF
        ADDR    R2,     R7                      ; D939   00D7
        MOVR    R5,     R3                      ; D93A   00AB
        ADDR    R0,     R2                      ; D93B   00C2
        ADDR    R1,     R4                      ; D93C   00CC
        SAR     R2,     1                       ; D93D   006A
        MOVR    R4,     R1                      ; D93E   00A1
        DECR    R1                              ; D93F   0011
        MOVR    R7,     R3                      ; D940   00BB
        MOVR    R5,     R3                      ; D941   00AB
        ADDR    R0,     R7                      ; D942   00C7
        SLL     R1,     2                       ; D943   004D
        ADDR    R5,     R0                      ; D944   00E8
        MOVR    R4,     R5                      ; D945   00A5
        COMR    R0                              ; D946   0018
        COMR    R0                              ; D947   0018
        INCR    R6                              ; D948   000E
        CMPR    R4,     R6                      ; D949   0166
        INCR    R3                              ; D94A   000B
        DECLE   $0036                           ; D94B   0036

        DIS                                     ; D94C   0003
        SWAP    R2,     2                       ; D94D   0046
        INCR    R3                              ; D94E   000B
        NEGR    R6                              ; D94F   0026
        DIS                                     ; D950   0003
        DECR    R6                              ; D951   0016
        INCR    R3                              ; D952   000B
        ADDR    R6,     R6                      ; D953   00F6
        ADCR    R0                              ; D954   0028
        ADDR    R6,     R6                      ; D955   00F6
        DIS                                     ; D956   0003
        COMR    R2                              ; D957   001A
        CMPR    R6,     R0                      ; D958   0170
        BC      L_D96F                          ; D959   0201 0014
        BC      L_D9DD                          ; D95B   0201 0080
        BC      L_D971                          ; D95D   0201 0012

        DECLE   $0228                           ; D95F   0228

        DECR    R2                              ; D960   0012
        SWAP    R3,     2                       ; D961   0047
        DECR    R0                              ; D962   0010
        DECLE   $0000                           ; D963   0000

        DECR    R2                              ; D964   0012
        SLL     R3,     2                       ; D965   004F
        DECR    R0                              ; D966   0010
        DECLE   $0000                           ; D967   0000

        DECR    R2                              ; D968   0012
        RLC     R3,     2                       ; D969   0057
        DECR    R0                              ; D96A   0010
        DECLE   $0000                           ; D96B   0000

        RRC     R2,     1                       ; D96C   0072
        DECLE   $0228                           ; D96D   0228

        DECR    R0                              ; D96E   0010
L_D96F:
        DECLE   $0000                           ; D96F   0000

        CLRR    R0                              ; D970   01C0
L_D971:
        BC      L_D97D                          ; D971   0201 000A

        CMPR    R6,     R0                      ; D973   0170
        BC      L_D98C                          ; D974   0201 0016

        MVI@    R5,     R3                      ; D976   02AB
        CMPR    R4,     R3                      ; D977   0163
        CMP@    R4,     R1                      ; D978   0361
        DECR    R2                              ; D979   0012
        MOVR    R6,     R3                      ; D97A   00B3
        CLRR    R0                              ; D97B   01C0
        BC      L_D992                          ; D97C   0201 0014

        ANDR    R7,     R2                      ; D97E   01BA
        SUBI    #$00A8, R3                      ; D97F   033B 00A8
        BLT     L_D99D                          ; D981   0205 001A

        DECLE   $0230                           ; D983   0230

        MOVR    R1,     R0                      ; D984   0088
        BLT     L_D9A1                          ; D985   0205 001A

        SUBI    #$0012, R3                      ; D987   033B 0012
        ADD@    R4,     R5                      ; D989   02E5
        DECR    R2                              ; D98A   0012
        ADD@    R2,     R5                      ; D98B   02D5
L_D98C:
        DECR    R2                              ; D98C   0012
        ADD     .STIC.A.2,R5                    ; D98D   02C5 0012
        PULR    R5                              ; D98F   02B5
        DECLE   $0210                           ; D990   0210

        BC      L_D99F                          ; D991   0201 000C

        DECLE   $0228                           ; D993   0228

        BLT     L_D9B0                          ; D994   0205 001A

        MVO@    R5,     R3                      ; D996   025D
        ADCR    R0                              ; D997   0028
        BLT     L_D9B4                          ; D998   0205 001A

        DECLE   $0238                           ; D99A   0238

        COMR    R2                              ; D99B   001A
        DECLE   $0215                           ; D99C   0215
L_D99D:
        DECLE   $0218                           ; D99D   0218

        BLT     L_D9B2                          ; D99E   0205 0012

        DECLE   $0213                           ; D9A0   0213
L_D9A1:
        CMP@    R3,     R5                      ; D9A1   035D
        DECR    R3                              ; D9A2   0013
        CMP@    R2,     R5                      ; D9A3   0355
        NEGR    R3                              ; D9A4   0023
        CMP@    R1,     R5                      ; D9A5   034D
        NEGR    R3                              ; D9A6   0023
        SUBI    #$0021, R5                      ; D9A7   033D 0021
        BPL     L_D9BE                          ; D9A9   0203 0013

        SUBI    #$001A, R5                      ; D9AB   033D 001A
        ADD@    R2,     R3                      ; D9AD   02D3
        COMR    R2                              ; D9AE   001A
        PSHR    R3                              ; D9AF   0273
L_D9B0:
        SKIP                                    ; D9B0   0208
        BLT     L_D9C3                          ; D9B1   0205 0010
        BNOV    L_DD00                          ; D9B3   020A 034B

        DECR    R3                              ; D9B5   0013
        PSHR    R5                              ; D9B6   0275
        GSWD    R1                              ; D9B7   0031
        BPL     L_D9CD                          ; D9B8   0203 0013

        SUBI    #$001B, R7                      ; D9BA   033F 001B
        ADD@    R3,     R3                      ; D9BC   02DB
        SWAP    R1,     1                       ; D9BD   0041
L_D9BE:
        BPL     L_D9D3                          ; D9BE   0203 0013

        MVO@    R5,     R5                      ; D9C0   026D
        SKIP                                    ; D9C1   0208
        BLT     L_D9D6                          ; D9C2   0205 0012

        DECLE   $0218                           ; D9C4   0218

        BLT     L_D9DA                          ; D9C5   0205 0013

        ADD@    R4,     R5                      ; D9C7   02E5
        COMR    R2                              ; D9C8   001A
        SUBI    #$001A, R3                      ; D9C9   033B 001A
        CMP@    R1,     R3                      ; D9CB   034B
        COMR    R2                              ; D9CC   001A
L_D9CD:
        CMP@    R2,     R3                      ; D9CD   0353
        DECR    R3                              ; D9CE   0013
        PSHR    R5                              ; D9CF   0275
        SWAP    R1,     1                       ; D9D0   0041
        BPL     L_D9ED                          ; D9D1   0203 001A

L_D9D3:
        MVI@    R2,     R3                      ; D9D3   0293
        DECLE   $0278                           ; D9D4   0278

        BLT     L_D9E1                          ; D9D5   0205 000A

        MVO@    R0,     R5                      ; D9D7   0268
        BLT     L_D9ED                          ; D9D8   0205 0013

L_D9DA:
        MVI@    R2,     R5                      ; D9DA   0295
        SWAP    R1,     1                       ; D9DB   0041
        BPL     L_D9F8                          ; D9DC   0203 001A

        MVI@    R2,     R3                      ; D9DE   0293
        DECLE   $0278                           ; D9DF   0278

        BLT     L_D9EC                          ; D9E0   0205 000A

        DECLE   $0278                           ; D9E2   0278

        BLT     L_D9F8                          ; D9E3   0205 0013

        MVI@    R2,     R5                      ; D9E5   0295
        SWAP    R1,     1                       ; D9E6   0041
        BPL     L_DA03                          ; D9E7   0203 001A

        MVI@    R2,     R3                      ; D9E9   0293
        DECLE   $0278                           ; D9EA   0278

        BLT     L_DA03                          ; D9EB   0205 0016

L_D9ED:
        CMPR    R3,     R0                      ; D9ED   0158
        BLT     L_DA0A                          ; D9EE   0205 001A

        MVI@    R5,     R3                      ; D9F0   02AB
        DECR    R3                              ; D9F1   0013
        CMP@    R4,     R5                      ; D9F2   0365
        NEGR    R3                              ; D9F3   0023
        CMP@    R3,     R5                      ; D9F4   035D
        NEGR    R3                              ; D9F5   0023
        CMP@    R2,     R5                      ; D9F6   0355
        COMR    R2                              ; D9F7   001A
L_D9F8:
        PSHR    R3                              ; D9F8   0273
        ADDR    R1,     R0                      ; D9F9   00C8
        BLT     L_DA0F                          ; D9FA   0205 0013

        MVI@    R2,     R5                      ; D9FC   0295
        SWAP    R1,     1                       ; D9FD   0041
        BPL     L_DA1A                          ; D9FE   0203 001A

        MVI@    R2,     R3                      ; DA00   0293
        DECLE   $0278                           ; DA01   0278

        BLT     L_DA1A                          ; DA02   0205 0016

        CMPR    R1,     R0                      ; DA04   0148
        BLT     L_DA21                          ; DA05   0205 001A

        DECLE   $027B                           ; DA07   027B

        NEGR    R1                              ; DA08   0021
        BPL     L_DA2E                          ; DA09   0203 0023

        CMP     .STIC.MODE,R6                   ; DA0B   0346 0021
        BPL     L_DA22                          ; DA0D   0203 0013

L_DA0F:
        MVO@    R5,     R5                      ; DA0F   026D
        ADDR    R3,     R0                      ; DA10   00D8
        BLT     L_DA26                          ; DA11   0205 0013

        MVI@    R2,     R5                      ; DA13   0295
        SWAP    R1,     1                       ; DA14   0041
        BPL     L_DA31                          ; DA15   0203 001A

        MVI@    R2,     R3                      ; DA17   0293
        DECLE   $0278                           ; DA18   0278

        BLT     L_DA1D                          ; DA19   0205 0002

        XORI    #$0205, R0                      ; DA1B   03F8 0205
L_DA1D:
        EIS                                     ; DA1D   0002
        XORI    #$0205, R0                      ; DA1E   03F8 0205
L_DA20:
        EIS                                     ; DA20   0002
L_DA21:
        XORI    #$0205, R0                      ; DA21   03F8 0205
L_DA23:
        INCR    R6                              ; DA23   000E
        CMPR    R5,     R0                      ; DA24   0168
        BLT     L_DA41                          ; DA25   0205 001A

        MVI@    R5,     R3                      ; DA27   02AB
        COMR    R2                              ; DA28   001A
        MVII    #$00C3, R3                      ; DA29   02BB 00C3
        CMP@    R3,     R5                      ; DA2B   035D
        COMR    R2                              ; DA2C   001A
        ADD     .STIC.C.2,R3                    ; DA2D   02C3 001A
        PULR    R3                              ; DA2F   02B3
        CMPR    R5,     R0                      ; DA30   0168
L_DA31:
        BLT     L_DA49                          ; DA31   0205 0016

        SUBR    R5,     R0                      ; DA33   0128
        BLT     L_DA50                          ; DA34   0205 001A

        MVI@    R5,     R3                      ; DA36   02AB
        COMR    R2                              ; DA37   001A
        MVII    #$001A, R3                      ; DA38   02BB 001A
        ADD@    R1,     R3                      ; DA3A   02CB
        COMR    R2                              ; DA3B   001A
        ADD@    R3,     R3                      ; DA3C   02DB
        SUBR    R0,     R1                      ; DA3D   0101
        BPL     L_DA5A                          ; DA3E   0203 001A

        ADD@    R4,     R3                      ; DA40   02E3
L_DA41:
        COMR    R2                              ; DA41   001A
        ADD@    R2,     R3                      ; DA42   02D3
        COMR    R2                              ; DA43   001A
        ADD     .STIC.C.2,R3                    ; DA44   02C3 001A
        PULR    R3                              ; DA46   02B3
        SUBR    R5,     R0                      ; DA47   0128
        BLT     L_DA66                          ; DA48   0205 001C

        ADDR    R5,     R0                      ; DA4A   00E8
        BLT     L_DA67                          ; DA4B   0205 001A

        MVI@    R5,     R3                      ; DA4D   02AB
        COMR    R2                              ; DA4E   001A
        MVII    #$001A, R3                      ; DA4F   02BB 001A
        ADD@    R1,     R3                      ; DA51   02CB
        COMR    R2                              ; DA52   001A
        ADD@    R3,     R3                      ; DA53   02DB
        MOVR    R6,     R1                      ; DA54   00B1
        BPL     L_DA6A                          ; DA55   0203 0013

        DECLE   $021F                           ; DA57   021F

        DECR    R3                              ; DA58   0013
        MVO@    R7,     R4                      ; DA59   0267
L_DA5A:
        MOVR    R6,     R1                      ; DA5A   00B1
        BPL     L_DA77                          ; DA5B   0203 001A

        ADD@    R4,     R3                      ; DA5D   02E3
        COMR    R2                              ; DA5E   001A
        ADD@    R2,     R3                      ; DA5F   02D3
        COMR    R2                              ; DA60   001A
        ADD     .STIC.C.2,R3                    ; DA61   02C3 001A
        PULR    R3                              ; DA63   02B3
        ADDR    R5,     R0                      ; DA64   00E8
        BLT     L_DA89                          ; DA65   0205 0022

L_DA67:
        MOVR    R5,     R0                      ; DA67   00A8
        BLT     L_DA84                          ; DA68   0205 001A

L_DA6A:
        MVI@    R5,     R3                      ; DA6A   02AB
        COMR    R2                              ; DA6B   001A
        MVII    #$001A, R3                      ; DA6C   02BB 001A
        ADD@    R1,     R3                      ; DA6E   02CB
        COMR    R2                              ; DA6F   001A
        ADD@    R3,     R3                      ; DA70   02DB
        ADDR    R0,     R1                      ; DA71   00C1
        BPL     L_DA87                          ; DA72   0203 0013

        MVI@    R5,     R5                      ; DA74   02AD
        DECR    R3                              ; DA75   0013
        PULR    R5                              ; DA76   02B5
L_DA77:
        SWAP    R1,     1                       ; DA77   0041
        BPL     L_DA8D                          ; DA78   0203 0013

        MVI@    R5,     R5                      ; DA7A   02AD
        DECR    R3                              ; DA7B   0013
        PULR    R5                              ; DA7C   02B5
        ADDR    R0,     R1                      ; DA7D   00C1
        BPL     L_DA9A                          ; DA7E   0203 001A

        ADD@    R4,     R3                      ; DA80   02E3
        COMR    R2                              ; DA81   001A
        ADD@    R2,     R3                      ; DA82   02D3
        COMR    R2                              ; DA83   001A
L_DA84:
        ADD     .STIC.C.2,R3                    ; DA84   02C3 001A
        PULR    R3                              ; DA86   02B3
L_DA87:
        MOVR    R5,     R0                      ; DA87   00A8
        BLT     L_DAB4                          ; DA88   0205 002A

        SAR     R0,     1                       ; DA8A   0068
        BLT     L_DAA7                          ; DA8B   0205 001A

L_DA8D:
        MVI@    R5,     R3                      ; DA8D   02AB
        COMR    R2                              ; DA8E   001A
        MVII    #$001A, R3                      ; DA8F   02BB 001A
        ADD@    R1,     R3                      ; DA91   02CB
        COMR    R2                              ; DA92   001A
        ADD@    R3,     R3                      ; DA93   02DB
        ADDR    R0,     R1                      ; DA94   00C1
        BPL     L_DAAA                          ; DA95   0203 0013

        MVI@    R5,     R5                      ; DA97   02AD
        DECR    R3                              ; DA98   0013
        MVII    #$0013, R5                      ; DA99   02BD 0013
        ADD@    R1,     R5                      ; DA9B   02CD
        DECR    R3                              ; DA9C   0013
        ADD@    R3,     R5                      ; DA9D   02DD
        MOVR    R1,     R0                      ; DA9E   0088
        BLT     L_DAB4                          ; DA9F   0205 0013

        ADD@    R4,     R5                      ; DAA1   02E5
        DECR    R3                              ; DAA2   0013
        ADD@    R2,     R5                      ; DAA3   02D5
        DECR    R3                              ; DAA4   0013
        ADD     .STIC.A.3,R5                    ; DAA5   02C5 0013
L_DAA7:
        PULR    R5                              ; DAA7   02B5
        ADDR    R0,     R1                      ; DAA8   00C1
        BPL     L_DAC5                          ; DAA9   0203 001A

        ADD@    R4,     R3                      ; DAAB   02E3
        COMR    R2                              ; DAAC   001A
        ADD@    R2,     R3                      ; DAAD   02D3
        COMR    R2                              ; DAAE   001A
        ADD     .STIC.C.2,R3                    ; DAAF   02C3 001A
        PULR    R3                              ; DAB1   02B3
        SAR     R0,     1                       ; DAB2   0068
        BLT     L_DAE3                          ; DAB3   0205 002E

        COMR    R2                              ; DAB5   001A
        ADD@    R6,     R7                      ; DAB6   02F7
        COMR    R0                              ; DAB7   0018
        BLT     L_DAD4                          ; DAB8   0205 001A

        MVI@    R5,     R3                      ; DABA   02AB
        COMR    R2                              ; DABB   001A
        MVII    #$001A, R3                      ; DABC   02BB 001A
        ADD@    R1,     R3                      ; DABE   02CB
        COMR    R2                              ; DABF   001A
        ADD@    R3,     R3                      ; DAC0   02DB
        ADDR    R0,     R1                      ; DAC1   00C1
        BPL     L_DAD7                          ; DAC2   0203 0013

        MVI@    R5,     R5                      ; DAC4   02AD
L_DAC5:
        DECR    R3                              ; DAC5   0013
        MVII    #$0013, R5                      ; DAC6   02BD 0013
        ADD@    R1,     R5                      ; DAC8   02CD
        DECR    R3                              ; DAC9   0013
        ADD@    R3,     R5                      ; DACA   02DD
        SUBR    R1,     R0                      ; DACB   0108
        BLT     L_DAE1                          ; DACC   0205 0013

        ADD@    R4,     R5                      ; DACE   02E5
        DECR    R3                              ; DACF   0013
        ADD@    R2,     R5                      ; DAD0   02D5
        DECR    R3                              ; DAD1   0013
        ADD     .STIC.A.3,R5                    ; DAD2   02C5 0013
L_DAD4:
        PULR    R5                              ; DAD4   02B5
        ADDR    R0,     R1                      ; DAD5   00C1
        BPL     L_DAF2                          ; DAD6   0203 001A

        ADD@    R4,     R3                      ; DAD8   02E3
        COMR    R2                              ; DAD9   001A
        ADD@    R2,     R3                      ; DADA   02D3
        COMR    R2                              ; DADB   001A
        ADD     .STIC.C.2,R3                    ; DADC   02C3 001A
        PULR    R3                              ; DADE   02B3
        COMR    R0                              ; DADF   0018
        BLT     L_DAFC                          ; DAE0   0205 001A

        ADD@    R5,     R7                      ; DAE2   02EF
L_DAE3:
        DECLE   $0036                           ; DAE3   0036

        COMR    R0                              ; DAE4   0018
        BLT     L_DB01                          ; DAE5   0205 001A

        SUB@    R4,     R7                      ; DAE7   0327
        DECR    R3                              ; DAE8   0013
        SUB@    R2,     R7                      ; DAE9   0317
        DECR    R3                              ; DAEA   0013
        SUB     .STIC.A.3,R7                    ; DAEB   0307 0013
        ADD@    R6,     R7                      ; DAED   02F7
        MOVR    R4,     R1                      ; DAEE   00A1
        BPL     L_DB04                          ; DAEF   0203 0013

        MVO@    R5,     R5                      ; DAF1   026D
L_DAF2:
        DECR    R3                              ; DAF2   0013
        ADD@    R1,     R5                      ; DAF3   02CD
        DECR    R3                              ; DAF4   0013
        ADD@    R3,     R5                      ; DAF5   02DD
        MOVR    R1,     R0                      ; DAF6   0088
        BLT     L_DB13                          ; DAF7   0205 001A

        MVII    #$001A, R3                      ; DAF9   02BB 001A
        ADD@    R1,     R3                      ; DAFB   02CB
L_DAFC:
        COMR    R2                              ; DAFC   001A
        ADD@    R3,     R3                      ; DAFD   02DB
        NEGR    R3                              ; DAFE   0023
        CMP     .STIC.C.2,R6                    ; DAFF   0346 001A
L_DB01:
        ADD@    R4,     R3                      ; DB01   02E3
        COMR    R2                              ; DB02   001A
        ADD@    R2,     R3                      ; DB03   02D3
L_DB04:
        COMR    R2                              ; DB04   001A
        ADD     G_0088, R3                      ; DB05   02C3 0088
        BLT     L_DB1C                          ; DB07   0205 0013

        ADD@    R4,     R5                      ; DB09   02E5
        DECR    R3                              ; DB0A   0013
        ADD@    R2,     R5                      ; DB0B   02D5
        DECR    R3                              ; DB0C   0013
        PSHR    R5                              ; DB0D   0275
        MOVR    R4,     R1                      ; DB0E   00A1
        BPL     L_DB24                          ; DB0F   0203 0013

        ADD@    R5,     R7                      ; DB11   02EF
        DECR    R3                              ; DB12   0013
L_DB13:
        ADDI    #$0013, R7                      ; DB13   02FF 0013
        SUB@    R1,     R7                      ; DB15   030F
        COMR    R2                              ; DB16   001A
        SUB@    R3,     R7                      ; DB17   031F
        COMR    R0                              ; DB18   0018
        BLT     L_DB55                          ; DB19   0205 003A

        ADCR    R0                              ; DB1B   0028
L_DB1C:
        BLT     L_DB31                          ; DB1C   0205 0013

        ADD@    R2,     R5                      ; DB1E   02D5
        DECR    R3                              ; DB1F   0013
        ADD     .STIC.A.3,R5                    ; DB20   02C5 0013
        PULR    R5                              ; DB22   02B5
        DECR    R3                              ; DB23   0013
L_DB24:
        SUB@    R4,     R7                      ; DB24   0327
        DECR    R3                              ; DB25   0013
        SUB@    R2,     R7                      ; DB26   0317
        DECR    R3                              ; DB27   0013
        SUB     .STIC.C.3,R7                    ; DB28   0307 001B
        CMP@    R4,     R3                      ; DB2A   0363
        COMR    R3                              ; DB2B   001B
        CMP@    R5,     R3                      ; DB2C   036B
        RLC     R1,     1                       ; DB2D   0051
        BPL     L_DBE8                          ; DB2E   0203 00B8
        BLT     L_DB45                          ; DB30   0205 0013

L_DB32:
        ADD@    R2,     R5                      ; DB32   02D5
        DECR    R3                              ; DB33   0013
        ADD     .STIC.A.3,R5                    ; DB34   02C5 0013
        PULR    R5                              ; DB36   02B5
        NEGR    R1                              ; DB37   0021
        BPL     L_DB4D                          ; DB38   0203 0013

        MVI@    R5,     R5                      ; DB3A   02AD
        DECR    R3                              ; DB3B   0013
        MVII    #$0013, R5                      ; DB3C   02BD 0013
        ADD@    R1,     R5                      ; DB3E   02CD
        MOVR    R7,     R0                      ; DB3F   00B8
        BLT     L_DB93                          ; DB40   0205 0051
        BPL     L_DB5F                          ; DB42   0203 001B

        CMP@    R5,     R3                      ; DB44   036B
L_DB45:
        COMR    R3                              ; DB45   001B
        CMP@    R4,     R3                      ; DB46   0363
        DECR    R3                              ; DB47   0013
        ADDI    #$0013, R7                      ; DB48   02FF 0013
        SUB@    R1,     R7                      ; DB4A   030F
        DECR    R3                              ; DB4B   0013
        SUB@    R3,     R7                      ; DB4C   031F
L_DB4D:
        DECR    R3                              ; DB4D   0013
        MVI@    R5,     R5                      ; DB4E   02AD
        DECR    R3                              ; DB4F   0013
        MVII    #$0013, R5                      ; DB50   02BD 0013
        ADD@    R1,     R5                      ; DB52   02CD
        ADCR    R0                              ; DB53   0028
        BLT     L_DB8C                          ; DB54   0205 0036

        SLLC    R0,     1                       ; DB56   0058
        BLT     L_DB6C                          ; DB57   0205 0013

        ADD@    R4,     R5                      ; DB59   02E5
        DECR    R3                              ; DB5A   0013
        ADD@    R2,     R5                      ; DB5B   02D5
        DECR    R3                              ; DB5C   0013
        ADD     .STIC.A.3,R5                    ; DB5D   02C5 0013
L_DB5F:
        PULR    R5                              ; DB5F   02B5
        DECR    R3                              ; DB60   0013
        SUB@    R4,     R7                      ; DB61   0327
        DECR    R3                              ; DB62   0013
        SUB@    R2,     R7                      ; DB63   0317
        DECR    R3                              ; DB64   0013
        SUB     .STIC.A.3,R7                    ; DB65   0307 0013
        ADD@    R6,     R7                      ; DB67   02F7
        NEGR    R1                              ; DB68   0021
        BPL     L_DB85                          ; DB69   0203 001A

        MVI     .STIC.C.2,R3                    ; DB6B   0283 001A
        ADD     .STIC.C.2,R3                    ; DB6D   02C3 001A
        PULR    R3                              ; DB6F   02B3
        ANDR    R1,     R0                      ; DB70   0188
        BLT     L_DB8D                          ; DB71   0205 001A

        MVI@    R5,     R3                      ; DB73   02AB
        COMR    R2                              ; DB74   001A
        MVII    #$001A, R3                      ; DB75   02BB 001A
        DECLE   $027B                           ; DB77   027B

        NEGR    R1                              ; DB78   0021
        BPL     L_DB8E                          ; DB79   0203 0013

        ADD@    R5,     R7                      ; DB7B   02EF
        DECR    R3                              ; DB7C   0013
        ADDI    #$0013, R7                      ; DB7D   02FF 0013
        SUB@    R1,     R7                      ; DB7F   030F
        DECR    R3                              ; DB80   0013
        SUB@    R3,     R7                      ; DB81   031F
        DECR    R3                              ; DB82   0013
        MVI@    R5,     R5                      ; DB83   02AD
        DECR    R3                              ; DB84   0013
L_DB85:
        MVII    #$0013, R5                      ; DB85   02BD 0013
        ADD@    R1,     R5                      ; DB87   02CD
        DECR    R3                              ; DB88   0013
        ADD@    R3,     R5                      ; DB89   02DD
        SLLC    R0,     1                       ; DB8A   0058
        BLT     L_DBC7                          ; DB8B   0205 003A

L_DB8D:
        MOVR    R3,     R0                      ; DB8D   0098
L_DB8E:
        BLT     L_DBA3                          ; DB8E   0205 0013

        ADD@    R4,     R5                      ; DB90   02E5
        DECR    R3                              ; DB91   0013
        ADD@    R2,     R5                      ; DB92   02D5
L_DB93:
        DECR    R3                              ; DB93   0013
        ADD     .STIC.A.3,R5                    ; DB94   02C5 0013
        PULR    R5                              ; DB96   02B5
        DECR    R3                              ; DB97   0013
        SUB@    R4,     R7                      ; DB98   0327
        DECR    R3                              ; DB99   0013
        SUB@    R2,     R7                      ; DB9A   0317
        DECR    R3                              ; DB9B   0013
        SUB     .STIC.A.3,R7                    ; DB9C   0307 0013
        ADD@    R6,     R7                      ; DB9E   02F7
        DECR    R1                              ; DB9F   0011
        BPL     L_DBBC                          ; DBA0   0203 001A

        ADD@    R4,     R3                      ; DBA2   02E3
L_DBA3:
        COMR    R2                              ; DBA3   001A
        ADD@    R2,     R3                      ; DBA4   02D3
        COMR    R2                              ; DBA5   001A
L_DBA6:
        ADD     .STIC.C.2,R3                    ; DBA6   02C3 001A
        PULR    R3                              ; DBA8   02B3
        SUBR    R1,     R0                      ; DBA9   0108
        BLT     L_DBC6                          ; DBAA   0205 001A

        MVI@    R5,     R3                      ; DBAC   02AB
        COMR    R2                              ; DBAD   001A
        MVII    #$001A, R3                      ; DBAE   02BB 001A
        ADD@    R1,     R3                      ; DBB0   02CB
        COMR    R2                              ; DBB1   001A
        ADD@    R3,     R3                      ; DBB2   02DB
        DECR    R1                              ; DBB3   0011
        BPL     L_DBC9                          ; DBB4   0203 0013

        ADD@    R5,     R7                      ; DBB6   02EF
        DECR    R3                              ; DBB7   0013
        ADDI    #$0013, R7                      ; DBB8   02FF 0013
        SUB@    R1,     R7                      ; DBBA   030F
        DECR    R3                              ; DBBB   0013
L_DBBC:
        SUB@    R3,     R7                      ; DBBC   031F
        DECR    R3                              ; DBBD   0013
        MVI@    R5,     R5                      ; DBBE   02AD
        DECR    R3                              ; DBBF   0013
        MVII    #$0013, R5                      ; DBC0   02BD 0013
        ADD@    R1,     R5                      ; DBC2   02CD
        DECR    R3                              ; DBC3   0013
        ADD@    R3,     R5                      ; DBC4   02DD
        MOVR    R3,     R0                      ; DBC5   0098
L_DBC6:
        BLT     L_DC02                          ; DBC6   0205 003A

        ADDR    R3,     R0                      ; DBC8   00D8
L_DBC9:
        BLT     L_DBDE                          ; DBC9   0205 0013

        ADD@    R4,     R5                      ; DBCB   02E5
        DECR    R3                              ; DBCC   0013
        ADD@    R2,     R5                      ; DBCD   02D5
        DECR    R3                              ; DBCE   0013
        ADD     .STIC.A.3,R5                    ; DBCF   02C5 0013
        PULR    R5                              ; DBD1   02B5
        DECR    R3                              ; DBD2   0013
        SUB@    R4,     R7                      ; DBD3   0327
        DECR    R3                              ; DBD4   0013
        SUB@    R2,     R7                      ; DBD5   0317
        DECR    R3                              ; DBD6   0013
        SUB     .STIC.A.3,R7                    ; DBD7   0307 0013
        ADD@    R6,     R7                      ; DBD9   02F7
        DECR    R1                              ; DBDA   0011
        BPL     L_DBF7                          ; DBDB   0203 001A

        ADD@    R4,     R3                      ; DBDD   02E3
L_DBDE:
        COMR    R2                              ; DBDE   001A
        ADD@    R2,     R3                      ; DBDF   02D3
        COMR    R2                              ; DBE0   001A
        ADD     .STIC.C.2,R3                    ; DBE1   02C3 001A
        PULR    R3                              ; DBE3   02B3
        MOVR    R1,     R0                      ; DBE4   0088
        BLT     L_DC01                          ; DBE5   0205 001A

        MVI@    R5,     R3                      ; DBE7   02AB
L_DBE8:
        COMR    R2                              ; DBE8   001A
        MVII    #$001A, R3                      ; DBE9   02BB 001A
        ADD@    R1,     R3                      ; DBEB   02CB
        COMR    R2                              ; DBEC   001A
        ADD@    R3,     R3                      ; DBED   02DB
        DECR    R1                              ; DBEE   0011
        BPL     L_DC04                          ; DBEF   0203 0013

        ADD@    R5,     R7                      ; DBF1   02EF
        DECR    R3                              ; DBF2   0013
        ADDI    #$0013, R7                      ; DBF3   02FF 0013
        SUB@    R1,     R7                      ; DBF5   030F
        DECR    R3                              ; DBF6   0013
L_DBF7:
        SUB@    R3,     R7                      ; DBF7   031F
        DECR    R3                              ; DBF8   0013
        MVI@    R5,     R5                      ; DBF9   02AD
        DECR    R3                              ; DBFA   0013
        MVII    #$0013, R5                      ; DBFB   02BD 0013
        ADD@    R1,     R5                      ; DBFD   02CD
        DECR    R3                              ; DBFE   0013
        ADD@    R3,     R5                      ; DBFF   02DD
        ADDR    R3,     R0                      ; DC00   00D8
L_DC01:
        BLT     L_DC35                          ; DC01   0205 0032

        SUBR    R3,     R0                      ; DC03   0118
L_DC04:
        BLT     L_DC19                          ; DC04   0205 0013

        ADD@    R4,     R5                      ; DC06   02E5
        DECR    R3                              ; DC07   0013
        ADD@    R2,     R5                      ; DC08   02D5
        DECR    R3                              ; DC09   0013
        ADD     .STIC.A.3,R5                    ; DC0A   02C5 0013
        PULR    R5                              ; DC0C   02B5
        DECR    R3                              ; DC0D   0013
        SUB@    R4,     R7                      ; DC0E   0327
        DECR    R3                              ; DC0F   0013
L_DC10:
        SUB@    R2,     R7                      ; DC10   0317
        DECR    R3                              ; DC11   0013
        SUB     .STIC.A.3,R7                    ; DC12   0307 0013
        ADD@    R6,     R7                      ; DC14   02F7
        DECR    R1                              ; DC15   0011
        BPL     L_DC32                          ; DC16   0203 001A

        ADD@    R4,     R3                      ; DC18   02E3
L_DC19:
        COMR    R2                              ; DC19   001A
        ADD@    R2,     R3                      ; DC1A   02D3
        SWAP    R3,     1                       ; DC1B   0043
        CMP@    R3,     R5                      ; DC1C   035D
        COMR    R2                              ; DC1D   001A
        ADD@    R1,     R3                      ; DC1E   02CB
        COMR    R2                              ; DC1F   001A
        ADD@    R3,     R3                      ; DC20   02DB
        DECR    R1                              ; DC21   0011
        BPL     L_DC37                          ; DC22   0203 0013

        ADD@    R5,     R7                      ; DC24   02EF
        DECR    R3                              ; DC25   0013
        ADDI    #$0013, R7                      ; DC26   02FF 0013
        SUB@    R1,     R7                      ; DC28   030F
        DECR    R3                              ; DC29   0013
        SUB@    R3,     R7                      ; DC2A   031F
        DECR    R3                              ; DC2B   0013
        MVI@    R5,     R5                      ; DC2C   02AD
        DECR    R3                              ; DC2D   0013
        MVII    #$0013, R5                      ; DC2E   02BD 0013
        ADD@    R1,     R5                      ; DC30   02CD
        DECR    R3                              ; DC31   0013
L_DC32:
        ADD@    R3,     R5                      ; DC32   02DD
        SUBR    R3,     R0                      ; DC33   0118
        BLT     L_DC48                          ; DC34   0205 0012

        SLLC    R0,     2                       ; DC36   005C
L_DC37:
        BUSC    L_DC87                          ; DC37   0207 004E

        SUB@    R5,     R1                      ; DC39   0329
        MOVR    R3,     R4                      ; DC3A   009C
        BUSC    L_DC8B                          ; DC3B   0207 004E
        BC      L_DB32                          ; DC3D   0221 010C
        BUSC    L_DC8F                          ; DC3F   0207 004E
        BC      L_DBA6                          ; DC41   0221 009C
        BUSC    L_DC93                          ; DC43   0207 004E

        SUB@    R6,     R1                      ; DC45   0331
        ADDR    R7,     R4                      ; DC46   00FC
        BUSC    L_DC7F                          ; DC47   0207 0036

        COMR    R4                              ; DC49   001C
        BUSC    L_DC6A                          ; DC4A   0207 001E

        MVI@    R1,     R0                      ; DC4C   0288
        DECR    R2                              ; DC4D   0012
        SUBR    R5,     R1                      ; DC4E   0129
        GSWD    R0                              ; DC4F   0030
        DECLE   $0000                           ; DC50   0000

        COMR    R1                              ; DC51   0019
        SUB@    R2,     R2                      ; DC52   0312
        COMR    R1                              ; DC53   0019
        SUB@    R1,     R2                      ; DC54   030A
        COMR    R1                              ; DC55   0019
        AND@    R3,     R2                      ; DC56   039A
        COMR    R1                              ; DC57   0019
        SUB@    R5,     R2                      ; DC58   032A
        NEGR    R0                              ; DC59   0020
        DECLE   $0000                           ; DC5A   0000

        COMR    R6                              ; DC5B   001E
        MVI@    R4,     R0                      ; DC5C   02A0
        COMR    R6                              ; DC5D   001E
        SUB@    R5,     R1                      ; DC5E   0329
        SLLC    R0,     2                       ; DC5F   005C
        BUSC    L_DCA0                          ; DC60   0207 003E

        SUB@    R5,     R1                      ; DC62   0329
        SUBR    R1,     R4                      ; DC63   010C
        BUSC    L_DCA4                          ; DC64   0207 003E

        SUB@    R6,     R1                      ; DC66   0331
        SLLC    R0,     2                       ; DC67   005C
        BUSC    L_DC88                          ; DC68   0207 001E

L_DC6A:
        SUB@    R6,     R1                      ; DC6A   0331
        COMR    R6                              ; DC6B   001E
        MVI@    R3,     R0                      ; DC6C   0298
        NEGR    R0                              ; DC6D   0020
        DECLE   $0000                           ; DC6E   0000

        COMR    R1                              ; DC6F   0019
        SUB@    R2,     R2                      ; DC70   0312
        COMR    R1                              ; DC71   0019
        SUB@    R1,     R2                      ; DC72   030A
        COMR    R1                              ; DC73   0019
        CMP@    R4,     R2                      ; DC74   0362
        COMR    R1                              ; DC75   0019
        CMP@    R4,     R2                      ; DC76   0362
        GSWD    R0                              ; DC77   0030
        DECLE   $0000                           ; DC78   0000

        DECR    R2                              ; DC79   0012
        SUBR    R6,     R1                      ; DC7A   0131
        COMR    R6                              ; DC7B   001E
        MVI@    R2,     R0                      ; DC7C   0290
        COMR    R4                              ; DC7D   001C
        BUSC    L_DCBE                          ; DC7E   0207 003E

        DECR    R7                              ; DC80   0017
        CMP@    R1,     R0                      ; DC81   0348
        DECR    R3                              ; DC82   0013
        MVI@    R2,     R0                      ; DC83   0290
        DECR    R3                              ; DC84   0013
        SUB@    R5,     R1                      ; DC85   0329
        NEGR    R6                              ; DC86   0026
L_DC87:
        DIS                                     ; DC87   0003
L_DC88:
        DECR    R7                              ; DC88   0017
        MVI@    R2,     R3                      ; DC89   0293
        SWAP    R3,     2                       ; DC8A   0047
L_DC8B:
        CMP@    R2,     R7                      ; DC8B   0357
        DECR    R7                              ; DC8C   0017
        MVI@    R3,     R3                      ; DC8D   029B
        DECR    R6                              ; DC8E   0016
L_DC8F:
        INCR    R3                              ; DC8F   000B
        COMR    R6                              ; DC90   001E
        MVI@    R2,     R3                      ; DC91   0293
        COMR    R6                              ; DC92   001E
L_DC93:
        SUB@    R5,     R1                      ; DC93   0329
        COMR    R6                              ; DC94   001E
        MVI@    R1,     R0                      ; DC95   0288
        DECR    R2                              ; DC96   0012
        SUBR    R5,     R1                      ; DC97   0129
        MOVR    R2,     R0                      ; DC98   0090
        DECLE   $0000                           ; DC99   0000

        COMR    R6                              ; DC9A   001E
        MVI@    R4,     R0                      ; DC9B   02A0
        COMR    R6                              ; DC9C   001E
        SUB@    R5,     R1                      ; DC9D   0329
        SAR     R0,     2                       ; DC9E   006C
        BUSC    L_DCBF                          ; DC9F   0207 001E

        SUB@    R6,     R1                      ; DCA1   0331
        COMR    R6                              ; DCA2   001E
        MVI@    R3,     R0                      ; DCA3   0298
L_DCA4:
        MOVR    R2,     R0                      ; DCA4   0090
        DECLE   $0000                           ; DCA5   0000

        DECR    R2                              ; DCA6   0012
        SUBR    R6,     R1                      ; DCA7   0131
        COMR    R6                              ; DCA8   001E
        MVI@    R2,     R0                      ; DCA9   0290
        COMR    R6                              ; DCAA   001E
        SUB@    R6,     R1                      ; DCAB   0331
        COMR    R6                              ; DCAC   001E
        MVI@    R1,     R3                      ; DCAD   028B
        DECR    R6                              ; DCAE   0016
        DIS                                     ; DCAF   0003
        DECR    R7                              ; DCB0   0017
        MVI@    R4,     R3                      ; DCB1   02A3
        SWAP    R3,     2                       ; DCB2   0047
        CMP@    R1,     R7                      ; DCB3   034F
        DECR    R7                              ; DCB4   0017
        MVI@    R1,     R3                      ; DCB5   028B
        NEGR    R6                              ; DCB6   0026
        INCR    R3                              ; DCB7   000B
        DECR    R3                              ; DCB8   0013
        SUB@    R6,     R1                      ; DCB9   0331
        DECR    R3                              ; DCBA   0013
        MVI@    R1,     R0                      ; DCBB   0288
        DECR    R7                              ; DCBC   0017
        CMP@    R1,     R0                      ; DCBD   0348
L_DCBE:
        ADCR    R2                              ; DCBE   002A
L_DCBF:
        DECR    R5                              ; DCBF   0015
        B       L_DCD2                          ; DCC0   0200 0010

        DECLE   $0000                           ; DCC2   0000

        DECR    R2                              ; DCC3   0012
        TSTR    R3                              ; DCC4   009B
        MOVR    R4,     R6                      ; DCC5   00A6
        INCR    R3                              ; DCC6   000B
        DECR    R7                              ; DCC7   0017
        MVI@    R2,     R3                      ; DCC8   0293
        DECR    R3                              ; DCC9   0013
        MVI@    R2,     R0                      ; DCCA   0290
        DECR    R3                              ; DCCB   0013
        SUB@    R5,     R1                      ; DCCC   0329
        MOVR    R2,     R6                      ; DCCD   0096
        DIS                                     ; DCCE   0003
        COMR    R6                              ; DCCF   001E
        MVI@    R2,     R3                      ; DCD0   0293
        COMR    R6                              ; DCD1   001E
L_DCD2:
        SUB@    R5,     R1                      ; DCD2   0329
        SAR     R0,     2                       ; DCD3   006C
        BUSC    L_DCF4                          ; DCD4   0207 001E

        SUB@    R6,     R1                      ; DCD6   0331
        COMR    R6                              ; DCD7   001E
        MVI@    R1,     R3                      ; DCD8   028B
        MOVR    R2,     R6                      ; DCD9   0096
        INCR    R3                              ; DCDA   000B
        DECR    R3                              ; DCDB   0013
        SUB@    R6,     R1                      ; DCDC   0331
        DECR    R3                              ; DCDD   0013
        MVI@    R1,     R0                      ; DCDE   0288
        DECR    R7                              ; DCDF   0017
        MVI@    R1,     R3                      ; DCE0   028B
        MOVR    R4,     R6                      ; DCE1   00A6
        DIS                                     ; DCE2   0003
        DECR    R2                              ; DCE3   0012
        MOVR    R4,     R3                      ; DCE4   00A3
        DECR    R0                              ; DCE5   0010
        DECLE   $0000                           ; DCE6   0000

        DECR    R5                              ; DCE7   0015
        B       L_DD10                          ; DCE8   0200 0026

        DECR    R5                              ; DCEA   0015
        B       L_DCFF                          ; DCEB   0200 0012

        SUBR    R5,     R6                      ; DCED   012E
        DECR    R0                              ; DCEE   0010
        DECLE   $0000                           ; DCEF   0000

        DECR    R3                              ; DCF0   0013
        MVI@    R2,     R0                      ; DCF1   0290
        MOVR    R4,     R6                      ; DCF2   00A6
        DIS                                     ; DCF3   0003
L_DCF4:
        DECR    R2                              ; DCF4   0012
        MOVR    R2,     R3                      ; DCF5   0093
        DECR    R3                              ; DCF6   0013
        MVI@    R2,     R0                      ; DCF7   0290
        MOVR    R4,     R6                      ; DCF8   00A6
        INCR    R3                              ; DCF9   000B
        COMR    R6                              ; DCFA   001E
        MVI@    R2,     R3                      ; DCFB   0293
        SAR     R0,     2                       ; DCFC   006C
        BUSC    L_DD1D                          ; DCFD   0207 001E

L_DCFF:
        MVI@    R1,     R3                      ; DCFF   028B
L_DD00:
        MOVR    R4,     R6                      ; DD00   00A6
        DIS                                     ; DD01   0003
        DECR    R3                              ; DD02   0013
        MVI@    R1,     R0                      ; DD03   0288
        DECR    R2                              ; DD04   0012
        MOVR    R1,     R3                      ; DD05   008B
        MOVR    R4,     R6                      ; DD06   00A6
        INCR    R3                              ; DD07   000B
        DECR    R3                              ; DD08   0013
        MVI@    R1,     R0                      ; DD09   0288
        DECR    R0                              ; DD0A   0010
        DECLE   $0000                           ; DD0B   0000

        DECR    R2                              ; DD0C   0012
        SUBR    R6,     R6                      ; DD0D   0136
        DECR    R5                              ; DD0E   0015
        B       L_DD33                          ; DD0F   0200 0022

        DECR    R7                              ; DD11   0017
        MVI@    R2,     R3                      ; DD12   0293
        DECR    R2                              ; DD13   0012
        SUBR    R5,     R6                      ; DD14   012E
        DECR    R2                              ; DD15   0012
        MOVR    R5,     R1                      ; DD16   00A9
        DECR    R2                              ; DD17   0012
        MOVR    R7,     R1                      ; DD18   00B9
        DECR    R2                              ; DD19   0012
        CMP@    R2,     R3                      ; DD1A   0353
        SWAP    R2,     1                       ; DD1B   0042
        CMP@    R1,     R3                      ; DD1C   034B
L_DD1D:
        SLR     R2,     1                       ; DD1D   0062
        SUBI    #$0012, R3                      ; DD1E   033B 0012
        SUBI    #$01C0, R0                      ; DD20   0338 01C0
        BC      L_DD36                          ; DD22   0201 0012

        SUBI    #$0062, R0                      ; DD24   0338 0062
        SUBI    #$0042, R3                      ; DD26   033B 0042
        CMP@    R1,     R3                      ; DD28   034B
        DECR    R2                              ; DD29   0012
        CMP@    R2,     R3                      ; DD2A   0353
        DECR    R2                              ; DD2B   0012
        ADDR    R0,     R1                      ; DD2C   00C1
        DECR    R2                              ; DD2D   0012
        MOVR    R6,     R1                      ; DD2E   00B1
        DECR    R2                              ; DD2F   0012
        SUBR    R6,     R6                      ; DD30   0136
        DECR    R7                              ; DD31   0017
        MVI@    R1,     R3                      ; DD32   028B
L_DD33:
        ADCR    R2                              ; DD33   002A
        DECR    R3                              ; DD34   0013
        ADD@    R1,     R1                      ; DD35   02C9
L_DD36:
        DECR    R2                              ; DD36   0012
        SUB@    R5,     R6                      ; DD37   032E
        RRC     R0,     1                       ; DD38   0070
        BC      L_DD65                          ; DD39   0201 002A

        CMP@    R6,     R1                      ; DD3B   0371
        ADCR    R2                              ; DD3C   002A
        CMP@    R5,     R1                      ; DD3D   0369
        ADCR    R2                              ; DD3E   002A
        CMP@    R4,     R1                      ; DD3F   0361
        ADCR    R2                              ; DD40   002A
        CMP@    R3,     R1                      ; DD41   0359
        RSWD    R2                              ; DD42   003A
        CMP@    R2,     R1                      ; DD43   0351
        RSWD    R2                              ; DD44   003A
        CMP@    R1,     R1                      ; DD45   0349
        SLL     R2,     1                       ; DD46   004A
        SUBI    #$0068, R1                      ; DD47   0339 0068
        BLT     L_DD95                          ; DD49   0205 004A

        SUBI    #$003A, R1                      ; DD4B   0339 003A
        CMP@    R1,     R1                      ; DD4D   0349
        RSWD    R2                              ; DD4E   003A
        CMP@    R2,     R1                      ; DD4F   0351
        ADCR    R2                              ; DD50   002A
        CMP@    R3,     R1                      ; DD51   0359
        ADCR    R2                              ; DD52   002A
        CMP@    R4,     R1                      ; DD53   0361
        ADCR    R2                              ; DD54   002A
        CMP@    R5,     R1                      ; DD55   0369
        ADCR    R2                              ; DD56   002A
        CMP@    R6,     R1                      ; DD57   0371
        RRC     R0,     1                       ; DD58   0070
        BC      L_DD6D                          ; DD59   0201 0012

        SUB@    R6,     R6                      ; DD5B   0336
        DECR    R3                              ; DD5C   0013
        ADD@    R2,     R1                      ; DD5D   02D1
        COMR    R6                              ; DD5E   001E
        DECR    R0                              ; DD5F   0010
        BC      L_DD74                          ; DD60   0201 0012

        SUB@    R5,     R6                      ; DD62   032E
        DECR    R2                              ; DD63   0012
        MVI@    R5,     R5                      ; DD64   02AD
L_DD65:
        DECR    R2                              ; DD65   0012
        MVII    #$001A, R5                      ; DD66   02BD 001A
        CMP@    R2,     R1                      ; DD68   0351
        COMR    R2                              ; DD69   001A
        CMP@    R1,     R1                      ; DD6A   0349
        COMR    R2                              ; DD6B   001A
        SUBI    #$02E8, R1                      ; DD6C   0339 02E8
        BLT     L_DD8A                          ; DD6E   0205 001A

        SUBI    #$001A, R1                      ; DD70   0339 001A
        CMP@    R1,     R1                      ; DD72   0349
        COMR    R2                              ; DD73   001A
L_DD74:
        CMP@    R2,     R1                      ; DD74   0351
        DECR    R2                              ; DD75   0012
        ADD     .STIC.A.2,R5                    ; DD76   02C5 0012
        PULR    R5                              ; DD78   02B5
        DECR    R2                              ; DD79   0012
        SUB@    R6,     R6                      ; DD7A   0336
        DECR    R2                              ; DD7B   0012
        BC      L_DD8A                          ; DD7C   0201 000C

        DECR    R2                              ; DD7E   0012
        ADD@    R1,     R5                      ; DD7F   02CD
        COMR    R0                              ; DD80   0018
        XOR@    R4,     R7                      ; DD81   03E7
        ADCR    R0                              ; DD82   0028
        BLT     G_E0ED                          ; DD83   0205 0368
        BLT     L_DD9F                          ; DD85   0205 0018

        DECLE   $027F                           ; DD87   027F

        DECR    R2                              ; DD88   0012
        ADD@    R2,     R5                      ; DD89   02D5
L_DD8A:
        INCR    R4                              ; DD8A   000C
        ADCR    R0                              ; DD8B   0028
        BLT     L_DDA6                          ; DD8C   0205 0018

        XOR@    R4,     R7                      ; DD8E   03E7
        SLL     R0,     1                       ; DD8F   0048
        BLT     G_E0BA                          ; DD90   0205 0328
        BLT     L_DDAC                          ; DD92   0205 0018

        DECLE   $027F                           ; DD94   027F
L_DD95:
        ADCR    R0                              ; DD95   0028
        BLT     L_DDA4                          ; DD96   0205 000C

        RSWD    R0                              ; DD98   0038
        BLT     L_DDB3                          ; DD99   0205 0018

        XOR@    R4,     R7                      ; DD9B   03E7
        SAR     R0,     1                       ; DD9C   0068
        BLT     G_E087                          ; DD9D   0205 02E8
L_DD9F:
        BLT     L_DDB9                          ; DD9F   0205 0018

        DECLE   $027F                           ; DDA1   027F

        RSWD    R0                              ; DDA2   0038
        BLT     L_DDB1                          ; DDA3   0205 000C

        SLL     R0,     1                       ; DDA5   0048
L_DDA6:
        BLT     L_DDC0                          ; DDA6   0205 0018

        XOR@    R4,     R7                      ; DDA8   03E7
        MOVR    R1,     R0                      ; DDA9   0088
        BLT     G_E054                          ; DDAA   0205 02A8
L_DDAC:
        BLT     L_DDC6                          ; DDAC   0205 0018

        DECLE   $027F                           ; DDAE   027F

        SLL     R0,     1                       ; DDAF   0048
        BLT     L_DDBE                          ; DDB0   0205 000C

        SLLC    R0,     1                       ; DDB2   0058
L_DDB3:
        BLT     L_DDCD                          ; DDB3   0205 0018

        XOR@    R4,     R7                      ; DDB5   03E7
        MOVR    R5,     R0                      ; DDB6   00A8
        BLT     G_E021                          ; DDB7   0205 0268
L_DDB9:
        BLT     L_DDD3                          ; DDB9   0205 0018

        DECLE   $027F                           ; DDBB   027F

        SLLC    R0,     1                       ; DDBC   0058
        BLT     L_DDCB                          ; DDBD   0205 000C

        SAR     R0,     1                       ; DDBF   0068
L_DDC0:
        BLT     L_DDDA                          ; DDC0   0205 0018

        XOR@    R4,     R7                      ; DDC2   03E7
        ADDR    R1,     R0                      ; DDC3   00C8
        BLT     L_DFEE                          ; DDC4   0205 0228
L_DDC6:
        BLT     L_DDE0                          ; DDC6   0205 0018

        DECLE   $027F                           ; DDC8   027F

        SAR     R0,     1                       ; DDC9   0068
        BLT     L_DDD4                          ; DDCA   0205 0008

        MOVR    R2,     R6                      ; DDCC   0096
L_DDCD:
        DECLE   $0004                           ; DDCD   0004

        RLC     R3,     1                       ; DDCE   0053
        DECLE   $0228,  $0037,  $0228,  $0036   ; DDCF   0228 0037 0228 0036
L_DDD3:
        JSR     R4,     G_0896                  ; DDD3   0004 0008 0096

        INCR    R4                              ; DDD6   000C
        RLC     R3,     1                       ; DDD7   0053
        DECLE   $0228,  $0037                   ; DDD8   0228 0037
L_DDDA:
        DECLE   $0228,  $0036                   ; DDDA   0228 0036

        INCR    R4                              ; DDDC   000C
        INCR    R2                              ; DDDD   000A
        MOVR    R2,     R3                      ; DDDE   0093
        CMP@    R2,     R1                      ; DDDF   0351
L_DDE0:
        RLC     R3,     1                       ; DDE0   0053
        DECLE   $0228,  $0037,  $0228           ; DDE1   0228 0037 0228

        COMR    R2                              ; DDE4   001A
        ADDR    R0,     R1                      ; DDE5   00C1
        NEGR    R6                              ; DDE6   0026
        INCR    R4                              ; DDE7   000C
        INCR    R4                              ; DDE8   000C
        MOVR    R2,     R6                      ; DDE9   0096
        INCR    R3                              ; DDEA   000B
        RLC     R3,     1                       ; DDEB   0053
        DECLE   $0228,  $0037,  $0228           ; DDEC   0228 0037 0228

        DECR    R2                              ; DDEF   0012
        ADD     .STIC.A.2,R3                    ; DDF0   02C3 0012
        PULR    R3                              ; DDF2   02B3
        COMR    R2                              ; DDF3   001A
        ADDR    R4,     R1                      ; DDF4   00E1
        INCR    R0                              ; DDF5   0008
        MOVR    R2,     R6                      ; DDF6   0096
        DIS                                     ; DDF7   0003
        RLC     R3,     1                       ; DDF8   0053
        DECLE   $0228,  $0037,  $0228,  $0036   ; DDF9   0228 0037 0228 0036

        DIS                                     ; DDFD   0003
        INCR    R0                              ; DDFE   0008
        MOVR    R2,     R6                      ; DDFF   0096
        INCR    R3                              ; DE00   000B
        RLC     R3,     1                       ; DE01   0053
        DECLE   $0228,  $0037,  $0228,  $0036   ; DE02   0228 0037 0228 0036

        INCR    R3                              ; DE06   000B
        INCR    R6                              ; DE07   000E
        MOVR    R3,     R2                      ; DE08   009A
        CMP@    R4,     R1                      ; DE09   0361
        SLLC    R2,     1                       ; DE0A   005A
        CMP@    R4,     R0                      ; DE0B   0360
        DECR    R2                              ; DE0C   0012
        MOVR    R6,     R5                      ; DE0D   00B5
        DECR    R7                              ; DE0E   0017
        ADD@    R4,     R0                      ; DE0F   02E0
        DECR    R7                              ; DE10   0017
        ADD@    R2,     R0                      ; DE11   02D0
        DECR    R3                              ; DE12   0013
        ADD     G_0026, R1                      ; DE13   02C1 0026
        DIS                                     ; DE15   0003
        COMR    R0                              ; DE16   0018
        COMR    R2                              ; DE17   001A
        MVI@    R3,     R3                      ; DE18   029B
        COMR    R3                              ; DE19   001B
        ADD@    R3,     R3                      ; DE1A   02DB
        MOVR    R0,     R1                      ; DE1B   0081
        BPL     L_DE39                          ; DE1C   0203 001B

        ADD@    R4,     R3                      ; DE1E   02E3
        DECR    R1                              ; DE1F   0011
        XOR@    R4,     R7                      ; DE20   03E7
        DECR    R3                              ; DE21   0013
        MVI@    R3,     R5                      ; DE22   029D
        ADCR    R0                              ; DE23   0028
        BLT     L_DE38                          ; DE24   0205 0012

        ADD@    R4,     R5                      ; DE26   02E5
        DECR    R2                              ; DE27   0012
        ADD@    R2,     R5                      ; DE28   02D5
        DECR    R2                              ; DE29   0012
        ADD     .STIC.A.2,R5                    ; DE2A   02C5 0012
        PULR    R5                              ; DE2C   02B5
        DECR    R3                              ; DE2D   0013
        ADD@    R4,     R1                      ; DE2E   02E1
        DECR    R0                              ; DE2F   0010
        COMR    R0                              ; DE30   0018
        BLT     L_DE4D                          ; DE31   0205 001A

        SUBI    #$001A, R3                      ; DE33   033B 001A
        SUBI    #$008A, R7                      ; DE35   033F 008A
        SUBI    #$001A, R3                      ; DE37   033B 001A
L_DE39:
        SUBI    #$0018, R7                      ; DE39   033F 0018
        XOR@    R4,     R7                      ; DE3B   03E7
        SAR     R0,     1                       ; DE3C   0068
        BLT     L_DE51                          ; DE3D   0205 0012

        ADD@    R4,     R5                      ; DE3F   02E5
        CLRC                                    ; DE40   0006
        ADDR    R3,     R0                      ; DE41   00D8
        BLT     L_DE5C                          ; DE42   0205 0018

        XOR@    R4,     R7                      ; DE44   03E7
        SAR     R0,     1                       ; DE45   0068
        BLT     L_DE4E                          ; DE46   0205 0006

        ADDR    R5,     R0                      ; DE48   00E8
        BLT     L_DE63                          ; DE49   0205 0018

        XOR@    R4,     R7                      ; DE4B   03E7
        SLLC    R0,     1                       ; DE4C   0058
L_DE4D:
        BLT     L_DE55                          ; DE4D   0205 0006

        ADDR    R7,     R0                      ; DE4F   00F8
        BLT     L_DE6A                          ; DE50   0205 0018

        XOR@    R4,     R7                      ; DE52   03E7
        SLL     R0,     1                       ; DE53   0048
        BLT     G_E0CB                          ; DE54   0205 0275

        JSR     R5,     G_E525                  ; DE56   0004 01E4 0125

        INCR    R0                              ; DE59   0008
        AND     G_0059, R0                      ; DE5A   0380 0059
L_DE5C:
        ADDR    R3,     R7                      ; DE5C   00DF
        PULR    R5                              ; DE5D   02B5
        INCR    R7                              ; DE5E   000F
        INCR    R2                              ; DE5F   000A
        NEGR    R2                              ; DE60   0022
        INCR    R2                              ; DE61   000A
        DECR    R2                              ; DE62   0012
L_DE63:
        DECLE   $0233                           ; DE63   0233

        COMR    R5                              ; DE64   001D
        INCR    R2                              ; DE65   000A
        NEGR    R2                              ; DE66   0022
        ANDR    R6,     R0                      ; DE67   01B0
        INCR    R2                              ; DE68   000A
        INCR    R2                              ; DE69   000A
L_DE6A:
        NEGR    R2                              ; DE6A   0022
        INCR    R2                              ; DE6B   000A
        DECR    R2                              ; DE6C   0012
        SUBR    R5,     R4                      ; DE6D   012C
        DECR    R7                              ; DE6E   0017
        INCR    R2                              ; DE6F   000A
        NEGR    R2                              ; DE70   0022
        TSTR    R4                              ; DE71   00A4
        DECLE   $0001                           ; DE72   0001

        INCR    R2                              ; DE73   000A
        DECR    R2                              ; DE74   0012
        MOVR    R4,     R5                      ; DE75   00A5
        DECR    R1                              ; DE76   0011
        MOVR    R4,     R7                      ; DE77   00A7
        EIS                                     ; DE78   0002
        INCR    R2                              ; DE79   000A
        NEGR    R2                              ; DE7A   0022
        PULR    R5                              ; DE7B   02B5
        INCR    R7                              ; DE7C   000F
        INCR    R2                              ; DE7D   000A
        NEGR    R2                              ; DE7E   0022
        INCR    R2                              ; DE7F   000A
        DECR    R2                              ; DE80   0012
        DECLE   $0232                           ; DE81   0232

        COMR    R5                              ; DE82   001D
        INCR    R2                              ; DE83   000A
        NEGR    R2                              ; DE84   0022
        ANDR    R5,     R6                      ; DE85   01AE
        INCR    R2                              ; DE86   000A
        INCR    R2                              ; DE87   000A
        NEGR    R2                              ; DE88   0022
        INCR    R2                              ; DE89   000A
        DECR    R2                              ; DE8A   0012
        SUBR    R5,     R4                      ; DE8B   012C
        DECR    R7                              ; DE8C   0017
        INCR    R2                              ; DE8D   000A
        NEGR    R2                              ; DE8E   0022
        MOVR    R4,     R5                      ; DE8F   00A5
        DECLE   $0001                           ; DE90   0001

        INCR    R2                              ; DE91   000A
        DECR    R2                              ; DE92   0012
        MOVR    R4,     R7                      ; DE93   00A7
        DECR    R1                              ; DE94   0011
        MOVR    R5,     R1                      ; DE95   00A9
        EIS                                     ; DE96   0002
        INCR    R2                              ; DE97   000A
        NEGR    R2                              ; DE98   0022
        DIS                                     ; DE99   0003
        EIS                                     ; DE9A   0002
        MOVR    R1,     R7                      ; DE9B   008F
        NEGR    R2                              ; DE9C   0022
        DIS                                     ; DE9D   0003
        EIS                                     ; DE9E   0002
        MOVR    R1,     R7                      ; DE9F   008F
        NEGR    R2                              ; DEA0   0022
        CLRC                                    ; DEA1   0006
        DECLE   $0001                           ; DEA2   0001

        TSTR    R2                              ; DEA3   0092
        DECR    R1                              ; DEA4   0011
        DIS                                     ; DEA5   0003
        DECLE   $0001                           ; DEA6   0001

        MOVR    R1,     R7                      ; DEA7   008F
        DECR    R1                              ; DEA8   0011
        CLRC                                    ; DEA9   0006
        DECLE   $0001                           ; DEAA   0001

        TSTR    R2                              ; DEAB   0092
        DECR    R1                              ; DEAC   0011
        INCR    R0                              ; DEAD   0008
        DIS                                     ; DEAE   0003
        MOVR    R2,     R4                      ; DEAF   0094
        GSWD    R3                              ; DEB0   0033
        INCR    R0                              ; DEB1   0008
        EIS                                     ; DEB2   0002
        MOVR    R2,     R4                      ; DEB3   0094
        NEGR    R2                              ; DEB4   0022
        COMR    R0                              ; DEB5   0018
        DECLE   $0001                           ; DEB6   0001

        MOVR    R1,     R4                      ; DEB7   008C
        DECR    R1                              ; DEB8   0011
        COMR    R1                              ; DEB9   0019
        DECLE   $0001                           ; DEBA   0001

        MOVR    R1,     R5                      ; DEBB   008D
        DECR    R1                              ; DEBC   0011
        COMR    R2                              ; DEBD   001A
        DECLE   $0001                           ; DEBE   0001

        MOVR    R1,     R6                      ; DEBF   008E
        DECR    R1                              ; DEC0   0011
        COMR    R3                              ; DEC1   001B
        DIS                                     ; DEC2   0003
        MOVR    R1,     R7                      ; DEC3   008F
        DECR    R3                              ; DEC4   0013
        SUBR    R3,     R3                      ; DEC5   011B
        NEGR    R2                              ; DEC6   0022
        DIS                                     ; DEC7   0003
        DECLE   $0004                           ; DEC8   0004

        MOVR    R1,     R7                      ; DEC9   008F
        DECLE   $0004                           ; DECA   0004

        SUBR    R3,     R3                      ; DECB   011B
        NEGR    R2                              ; DECC   0022
        SUBR    R3,     R6                      ; DECD   011E
        DECR    R1                              ; DECE   0011
        SUBR    R3,     R3                      ; DECF   011B
        DECR    R1                              ; DED0   0011
        DIS                                     ; DED1   0003
        DECLE   $0004                           ; DED2   0004

        MOVR    R1,     R7                      ; DED3   008F

        JSRD    R5,     .EXEC.C11               ; DED4   0004 011E 0011

        SUBR    R4,     R0                      ; DED7   0120
        GSWD    R3                              ; DED8   0033
        DIS                                     ; DED9   0003
        EIS                                     ; DEDA   0002
        MOVR    R1,     R7                      ; DEDB   008F
        EIS                                     ; DEDC   0002
        SUBR    R4,     R0                      ; DEDD   0120
        NEGR    R2                              ; DEDE   0022
        INCR    R4                              ; DEDF   000C
        DECLE   $0001                           ; DEE0   0001

        MOVR    R3,     R0                      ; DEE1   0098
        DECLE   $0001                           ; DEE2   0001

        SUBR    R4,     R4                      ; DEE3   0124
        DECR    R1                              ; DEE4   0011
        INCR    R5                              ; DEE5   000D
        DECLE   $0001                           ; DEE6   0001

        MOVR    R3,     R1                      ; DEE7   0099
        DECLE   $0001                           ; DEE8   0001

        SUBR    R4,     R5                      ; DEE9   0125
        DECR    R1                              ; DEEA   0011
        INCR    R6                              ; DEEB   000E
        DECLE   $0001                           ; DEEC   0001

        MOVR    R3,     R2                      ; DEED   009A
        DECLE   $0001                           ; DEEE   0001

        SUBR    R4,     R6                      ; DEEF   0126
        DECR    R1                              ; DEF0   0011
        INCR    R7                              ; DEF1   000F
        DIS                                     ; DEF2   0003
        TSTR    R3                              ; DEF3   009B
        DIS                                     ; DEF4   0003
        SUBR    R4,     R7                      ; DEF5   0127
        DECR    R5                              ; DEF6   0015
        ANDR    R3,     R6                      ; DEF7   019E
        DECLE   $0004,  $0233                   ; DEF8   0004 0233

        EIS                                     ; DEFA   0002
        ADD@    R1,     R3                      ; DEFB   02CB
        DECR    R1                              ; DEFC   0011
        ADD@    R1,     R3                      ; DEFD   02CB
        DECR    R1                              ; DEFE   0011
        DIS                                     ; DEFF   0003
        DECLE   $0004,  $0233                   ; DF00   0004 0233

        EIS                                     ; DF02   0002
        ADD@    R1,     R3                      ; DF03   02CB
        DECR    R1                              ; DF04   0011
        ADD@    R1,     R3                      ; DF05   02CB
        DECR    R1                              ; DF06   0011
        SUBR    R4,     R5                      ; DF07   0125

        JSRD    R5,     G_A004                  ; DF08   0004 01A2 0004
        DECLE   $0236                           ; DF0B   0236

        SDBD                                    ; DF0C   0001
        ADD@    R1,     R3                      ; DF0D   02CB
        DECR    R1                              ; DF0E   0011
        DECLE   $0233                           ; DF0F   0233

        SDBD                                    ; DF10   0001
        ADD@    R1,     R3                      ; DF11   02CB
        DECR    R1                              ; DF12   0011
        INCR    R7                              ; DF13   000F

        JSRD    R6,     .GROM.401               ; DF14   0004 0236 0001

        ADD@    R1,     R3                      ; DF17   02CB
        DECR    R1                              ; DF18   0011
        DECLE   $0238                           ; DF19   0238

        DIS                                     ; DF1A   0003
        ADD@    R1,     R3                      ; DF1B   02CB
        DECR    R1                              ; DF1C   0011
        SUBR    R4,     R4                      ; DF1D   0124

        JSR     R5,     G_A004                  ; DF1E   0004 01A0 0004

        ADD@    R1,     R3                      ; DF21   02CB
        DECR    R1                              ; DF22   0011
        ADD@    R1,     R3                      ; DF23   02CB
        DECR    R1                              ; DF24   0011
        DECLE   $0238                           ; DF25   0238

        EIS                                     ; DF26   0002
        ADD@    R1,     R3                      ; DF27   02CB
        DECR    R1                              ; DF28   0011
        ADD@    R1,     R3                      ; DF29   02CB
        DECR    R1                              ; DF2A   0011
        INCR    R4                              ; DF2B   000C
        DECLE   $0001                           ; DF2C   0001

        MOVR    R3,     R0                      ; DF2D   0098
        DECLE   $0001                           ; DF2E   0001

        SUBR    R4,     R4                      ; DF2F   0124
        DECLE   $0001,  $023C                   ; DF30   0001 023C

        SDBD                                    ; DF32   0001
        ADD@    R1,     R0                      ; DF33   02C8
        DECR    R1                              ; DF34   0011
        INCR    R5                              ; DF35   000D
        DECLE   $0001                           ; DF36   0001

        MOVR    R3,     R1                      ; DF37   0099
        DECLE   $0001                           ; DF38   0001

        SUBR    R1,     R5                      ; DF39   010D
        DECLE   $0001,  $023D,  $0001           ; DF3A   0001 023D 0001

        CMPR    R1,     R1                      ; DF3D   0149
        DECR    R1                              ; DF3E   0011
        INCR    R6                              ; DF3F   000E
        DECLE   $0001                           ; DF40   0001

        MOVR    R3,     R2                      ; DF41   009A
        DECLE   $0001                           ; DF42   0001

        SUBR    R4,     R6                      ; DF43   0126
        DECLE   $0001,  $023E                   ; DF44   0001 023E

        SDBD                                    ; DF46   0001
        ADD@    R1,     R2                      ; DF47   02CA
        DECR    R1                              ; DF48   0011
        INCR    R7                              ; DF49   000F
        EIS                                     ; DF4A   0002
        TSTR    R3                              ; DF4B   009B
        EIS                                     ; DF4C   0002
        SUBR    R4,     R7                      ; DF4D   0127
        EIS                                     ; DF4E   0002
        DECLE   $023F                           ; DF4F   023F

        EIS                                     ; DF50   0002
        ADD@    R1,     R3                      ; DF51   02CB
        GSWD    R2                              ; DF52   0032
        AND     G_006D, R0                      ; DF53   0380 006D
        ADDR    R5,     R0                      ; DF55   00E8
        AND     G_004C, R0                      ; DF56   0380 004C
        ADDR    R4,     R5                      ; DF58   00E5
        MVI     G_035E, R0                      ; DF59   0280 035E
        ANDI    #$0003, R0                      ; DF5B   03B8 0003
        MVO     R0,     G_0171                  ; DF5D   0240 0171
        MOVR    R5,     R7                      ; DF5F   00AF
        MOVR    R3,     R5                      ; DF60   009D
        SUBR    R3,     R0                      ; DF61   0118
        INCR    R1                              ; DF62   0009
        DECLE   $0000                           ; DF63   0000

        RRC     R2,     1                       ; DF64   0072
        AND@    R2,     R2                      ; DF65   0392
        ADD@    R2,     R7                      ; DF66   02D7
        CMPR    R6,     R2                      ; DF67   0172
        ANDR    R2,     R1                      ; DF68   0191
        DECLE   $0000                           ; DF69   0000

        MOVR    R5,     R4                      ; DF6A   00AC
        XORR    R6,     R4                      ; DF6B   01F4
        XOR     G_0370, R0                      ; DF6C   03C0 0370
        SUB@    R4,     R1                      ; DF6E   0321
        DECLE   $0000,  $0210                   ; DF6F   0000 0210

        MVI     .PSG0.chn_a_vol,R0              ; DF71   0280 01FB
        CMP@    R2,     R0                      ; DF73   0350
        BC      L_DD65                          ; DF74   0221 0210

        DECLE   $0000,  $0000,  $0000,  $0230   ; DF76   0000 0000 0000 0230

        RSWD    R4                              ; DF7A   003C
        CMPR    R0,     R0                      ; DF7B   0140
        SUB     G_01C1, R3                      ; DF7C   0303 01C1
        SUB@    R3,     R2                      ; DF7E   031A
        XORR    R2,     R6                      ; DF7F   01D6
        ADCR    R2                              ; DF80   002A
        ANDR    R2,     R6                      ; DF81   0196
        CMPR    R3,     R6                      ; DF82   015E
        SUBR    R3,     R4                      ; DF83   011C
        AND@    R6,     R5                      ; DF84   03B5
        XORR    R1,     R4                      ; DF85   01CC
        TSTR    R7                              ; DF86   00BF
        SUBR    R1,     R4                      ; DF87   010C
        MVI@    R1,     R3                      ; DF88   028B
        ADDR    R1,     R7                      ; DF89   00CF
L_DF8A:
        SUB@    R5,     R6                      ; DF8A   032E
        MVO@    R6,     R2                      ; DF8B   0256
        ADD@    R4,     R6                      ; DF8C   02E6
        MVO@    R7,     R1                      ; DF8D   024F
        SUB@    R1,     R2                      ; DF8E   030A
        CMP     G_0067, R6                      ; DF8F   0346 0067
        SUBR    R6,     R7                      ; DF91   0137
        ANDR    R5,     R5                      ; DF92   01AD
        SUB@    R1,     R1                      ; DF93   0309
        BUSC    L_DF9A                          ; DF94   0207 0004

        SUBR    R0,     R4                      ; DF96   0104
        ANDR    R0,     R0                      ; DF97   0180
        BNC     G_E211                          ; DF98   0209 0277

L_DF9A:
        SLLC    R2,     2                       ; DF9A   005E
        SUBR    R1,     R4                      ; DF9B   010C
        B       G_E1CD                          ; DF9C   0200 022F

        DECR    R4                              ; DF9E   0014
        ANDR    R0,     R0                      ; DF9F   0180
        RSWD    R6                              ; DFA0   003E
        XOR@    R3,     R0                      ; DFA1   03D8
        AND@    R3,     R3                      ; DFA2   039B
        SUBR    R1,     R4                      ; DFA3   010C
        DECLE   $0278                           ; DFA4   0278

        SUB@    R2,     R0                      ; DFA5   0310
        CMP@    R4,     R0                      ; DFA6   0360
        COMR    R1                              ; DFA7   0019
        PULR    R5                              ; DFA8   02B5
        XOR@    R4,     R5                      ; DFA9   03E5
        ANDR    R4,     R2                      ; DFAA   01A2
        AND@    R6,     R7                      ; DFAB   03B7
        MOVR    R5,     R0                      ; DFAC   00A8
        ADD@    R2,     R7                      ; DFAD   02D7
        ANDR    R1,     R5                      ; DFAE   018D
        MOVR    R2,     R6                      ; DFAF   0096
        SUBI    #$01CE, R5                      ; DFB0   033D 01CE
        MVI@    R4,     R0                      ; DFB2   02A0
        MVII    #$0052, R4                      ; DFB3   02BC 0052
        ADDR    R0,     R3                      ; DFB5   00C3
        DECR    R1                              ; DFB6   0011
        SUBR    R0,     R0                      ; DFB7   0100
        SUB@    R1,     R0                      ; DFB8   0308
        DECLE   $0001                           ; DFB9   0001

        CMPR    R0,     R7                      ; DFBA   0147
        SUBR    R6,     R3                      ; DFBB   0133
        GSWD    R2                              ; DFBC   0032
        B       G_E1CB                          ; DFBD   0200 020C

        CMP@    R4,     R4                      ; DFBF   0364
        MVO     R5,     G_02F3                  ; DFC0   0245 02F3
        SWAP    R0,     2                       ; DFC2   0044
        B       G_E1CF                          ; DFC3   0200 020A

        RSWD    R2                              ; DFC5   003A
        ADDR    R1,     R4                      ; DFC6   00CC
        ADDR    R3,     R5                      ; DFC7   00DD
        SLL     R1,     1                       ; DFC8   0049
        DECLE   $0000,  $0001                   ; DFC9   0000 0001

        SUB     .BTAB.D0,R3                     ; DFCB   0303 02D0
        CMPR    R4,     R6                      ; DFCD   0166
        ANDR    R1,     R0                      ; DFCE   0188
        MOVR    R4,     R6                      ; DFCF   00A6
        SAR     R1,     1                       ; DFD0   0069
        ANDR    R1,     R2                      ; DFD1   018A
        ANDR    R4,     R6                      ; DFD2   01A6
        XOR     G_004D, R7                      ; DFD3   03C7 004D
        ADDR    R7,     R0                      ; DFD5   00F8
        ADD@    R4,     R3                      ; DFD6   02E3
        SUB@    R5,     R2                      ; DFD7   032A
        SUBR    R0,     R4                      ; DFD8   0104
        ADD@    R2,     R3                      ; DFD9   02D3
        CMPR    R3,     R3                      ; DFDA   015B
        MOVR    R3,     R7                      ; DFDB   009F
        MVI@    R2,     R6                      ; DFDC   0296
        CMPR    R7,     R1                      ; DFDD   0179
        ANDR    R2,     R4                      ; DFDE   0194
        MVI     G_0361, R2                      ; DFDF   0282 0361
        PULR    R3                              ; DFE1   02B3
        MVO@    R1,     R4                      ; DFE2   0261
        CMPR    R1,     R2                      ; DFE3   014A
        CMP     G_0393, R2                      ; DFE4   0342 0393
        INCR    R0                              ; DFE6   0008
        ANDR    R1,     R0                      ; DFE7   0188
        CMP@    R5,     R7                      ; DFE8   036F
        ADDR    R2,     R0                      ; DFE9   00D0
        SUB@    R1,     R1                      ; DFEA   0309
        XOR     G_03D4, R1                      ; DFEB   03C1 03D4
        CMP@    R5,     R5                      ; DFED   036D
L_DFEE:
        MOVR    R7,     R0                      ; DFEE   00B8
        MOVR    R6,     R5                      ; DFEF   00B5
        RLC     R1,     2                       ; DFF0   0055
        MVO     R7,     .BTAB.04                ; DFF1   0247 0204
        SUBR    R4,     R1                      ; DFF3   0121
        ANDR    R6,     R0                      ; DFF4   01B0
        XORR    R3,     R6                      ; DFF5   01DE
        MOVR    R4,     R5                      ; DFF6   00A5
        BNC     L_DC10                          ; DFF7   0229 03E8

        ANDI    #$000D, R3                      ; DFF9   03BB 000D
        XOR     .UART.1,R7                      ; DFFB   03C7 00E1
        DECLE   $0000,  $0000                   ; DFFD   0000 0000

        ADDR    R2,     R0                      ; DFFF   00D0

        ORG     $F000
        PSHR    R3                              ; F000   0273
        SDBD                                    ; F001   0001
        MVI@    R5,     R3                      ; F002   02AB
        CLRR    R0                              ; F003   01C0
        TSTR    R2                              ; F004   0092
        BEQ     L_F029                          ; F005   0204 0022
        BPL     L_F00B                          ; F007   0203 0002

        NEGR    R2                              ; F009   0022
        INCR    R0                              ; F00A   0008
L_F00B:
        TSTR    R1                              ; F00B   0089
        BPL     L_F010                          ; F00C   0203 0002

        NEGR    R1                              ; F00E   0021
        INCR    R0                              ; F00F   0008
L_F010:
        SARC    R0,     1                       ; F010   0078
        RRC     R3,     1                       ; F011   0073
        CLRR    R0                              ; F012   01C0
        B       L_F01E                          ; F013   0200 0009

L_F015:
        CMPR    R2,     R1                      ; F015   0151
        BLT     L_F01A                          ; F016   0205 0002

        SUBR    R2,     R1                      ; F018   0111
        SETC                                    ; F019   0007
L_F01A:
        RLC     R0,     1                       ; F01A   0050
        SARC    R3,     1                       ; F01B   007B
        BC      L_F025                          ; F01C   0201 0007

L_F01E:
        SLR     R2,     1                       ; F01E   0062
        BNEQ    L_F015                          ; F01F   022C 000B

L_F021:
        SLL     R0,     1                       ; F021   0048
        SARC    R3,     1                       ; F022   007B
        BNC     L_F021                          ; F023   0229 0003

L_F025:
        TSTR    R3                              ; F025   009B
        BEQ     L_F029                          ; F026   0204 0001

        NEGR    R0                              ; F028   0020
L_F029:
        PULR    R3                              ; F029   02B3
        MOVR    R5,     R7                      ; F02A   00AF
        PSHR    R4                              ; F02B   0274
        CLRR    R3                              ; F02C   01DB
        CLRR    R2                              ; F02D   01D2
        CLRR    R4                              ; F02E   01E4
        TSTR    R0                              ; F02F   0080
        BPL     L_F035                          ; F030   0203 0003

        NEGR    R0                              ; F032   0020
        ADDI    #$0001, R3                      ; F033   02FB 0001
L_F035:
        TSTR    R1                              ; F035   0089
        BPL     L_F03B                          ; F036   0203 0003

        NEGR    R1                              ; F038   0021
        ADDI    #$0001, R3                      ; F039   02FB 0001
L_F03B:
        PSHR    R3                              ; F03B   0273
        CLRR    R3                              ; F03C   01DB
        B       L_F044                          ; F03D   0200 0005

L_F03F:
        ADDR    R0,     R2                      ; F03F   00C2
        ADCR    R4                              ; F040   002C
        ADDR    R3,     R4                      ; F041   00DC
L_F042:
        SLLC    R0,     1                       ; F042   0058
        RLC     R3,     1                       ; F043   0053
L_F044:
        SARC    R1,     1                       ; F044   0079
        BC      L_F03F                          ; F045   0221 0007
        BNEQ    L_F042                          ; F047   022C 0006

        MOVR    R4,     R3                      ; F049   00A3
        PULR    R0                              ; F04A   02B0
        SARC    R0,     1                       ; F04B   0078
        BNC     L_F053                          ; F04C   0209 0005

        COMR    R3                              ; F04E   001B
        COMR    R2                              ; F04F   001A
        ADDI    #$0001, R2                      ; F050   02FA 0001
        ADCR    R3                              ; F052   002B
L_F053:
        PULR    R4                              ; F053   02B4
        MOVR    R5,     R7                      ; F054   00AF
        PSHR    R5                              ; F055   0275
        SUBR    R0,     R2                      ; F056   0102
        PSHR    R2                              ; F057   0272
        BPL     L_F05B                          ; F058   0203 0001

        NEGR    R2                              ; F05A   0022
L_F05B:
        SUBR    R1,     R3                      ; F05B   010B
        PSHR    R3                              ; F05C   0273
        BPL     L_F060                          ; F05D   0203 0001

        NEGR    R3                              ; F05F   0023
L_F060:
        TSTR    R2                              ; F060   0092
        BNEQ    L_F068                          ; F061   020C 0005

        TSTR    R3                              ; F063   009B
        BEQ     L_F07D                          ; F064   0204 0017
        B       L_F07C                          ; F066   0200 0014

L_F068:
        TSTR    R3                              ; F068   009B
        BEQ     L_F07D                          ; F069   0204 0012

        CMPR    R2,     R3                      ; F06B   0153
        BGT     L_F071                          ; F06C   020E 0003

        MOVR    R3,     R0                      ; F06E   0098
        MOVR    R2,     R3                      ; F06F   0093
        MOVR    R0,     R2                      ; F070   0082
L_F071:
        MOVR    R2,     R0                      ; F071   0090

        JSR     R5,     X_SQUARE                ; F072   0004 011C 01DB

        MOVR    R2,     R1                      ; F075   0091
        MOVR    R3,     R2                      ; F076   009A

        JSR     R5,     X_DIV                   ; F077   0004 011C 01FB

        SAR     R0,     1                       ; F07A   0068
        ADDR    R0,     R3                      ; F07B   00C3
L_F07C:
        MOVR    R3,     R2                      ; F07C   009A
L_F07D:
        PULR    R1                              ; F07D   02B1
        PULR    R0                              ; F07E   02B0
        PULR    R7                              ; F07F   02B7
        PSHR    R5                              ; F080   0275
        CLRR    R5                              ; F081   01ED
        INCR    R7                              ; F082   000F
        PSHR    R5                              ; F083   0275
        PSHR    R0                              ; F084   0270
        PSHR    R1                              ; F085   0271
        NOP                                     ; F086   0034
        SLL     R1,     2                       ; F087   004D
        SLL     R1,     1                       ; F088   0049
        ADD     G_0354, R1                      ; F089   02C1 0354
        MVO     R4,     G_0331                  ; F08B   0244 0331
        MOVR    R1,     R4                      ; F08D   008C
        MVI@    R4,     R0                      ; F08E   02A0
        INCR    R4                              ; F08F   000C
        MVI@    R4,     R1                      ; F090   02A1
        PSHR    R5                              ; F091   0275

        JSR     R5,     G_E055                  ; F092   0004 01E0 0055

        PULR    R5                              ; F095   02B5
        TSTR    R5                              ; F096   00AD
        BEQ     L_F0CA                          ; F097   0204 0031

        MOVR    R2,     R3                      ; F099   0093
        PSHR    R1                              ; F09A   0271
        MOVR    R0,     R1                      ; F09B   0081
        CMPR    R0,     R2                      ; F09C   0142
        BGT     L_F0A3                          ; F09D   020E 0004

        MVI     G_0331, R2                      ; F09F   0282 0331
        B       L_F0B0                          ; F0A1   0200 000D

L_F0A3:
        JSR     R5,     G_E000                  ; F0A3   0004 01E0 0000
        DECLE   $0000,  $0001                   ; F0A6   0000 0001

        MVI     G_0331, R1                      ; F0A8   0281 0331

        JSR     R5,     X_MPY                   ; F0AA   0004 011C 01DC

        SWAP    R2,     1                       ; F0AD   0042
        ANDI    #$00FF, R2                      ; F0AE   03BA 00FF
L_F0B0:
        SUBI    #$0006, R4                      ; F0B0   033C 0006
        MVO@    R2,     R4                      ; F0B2   0262
        PULR    R1                              ; F0B3   02B1
        MOVR    R3,     R2                      ; F0B4   009A
        CMPR    R1,     R2                      ; F0B5   014A
        BGT     L_F0BC                          ; F0B6   020E 0004

        MVI     G_0331, R2                      ; F0B8   0282 0331
        B       L_F0C9                          ; F0BA   0200 000D

L_F0BC:
        JSR     R5,     G_E000                  ; F0BC   0004 01E0 0000
        DECLE   $0000,  $0001                   ; F0BF   0000 0001

        MVI     G_0331, R1                      ; F0C1   0281 0331

        JSR     R5,     X_MPY                   ; F0C3   0004 011C 01DC

        SWAP    R2,     1                       ; F0C6   0042
        ANDI    #$00FF, R2                      ; F0C7   03BA 00FF
L_F0C9:
        MVO@    R2,     R4                      ; F0C9   0262
L_F0CA:
        MVII    #$0040, R1                      ; F0CA   02B9 0040
        SWAP    R1,     1                       ; F0CC   0041
        MVI     G_0331, R2                      ; F0CD   0282 0331

        JSR     R5,     X_DIV                   ; F0CF   0004 011C 01FB

        MOVR    R3,     R1                      ; F0D2   0099

        JSR     R5,     G_E02B                  ; F0D3   0004 01E0 002B

        SWAP    R2,     1                       ; F0D6   0042
        ANDI    #$00FF, R2                      ; F0D7   03BA 00FF
        TSTR    R3                              ; F0D9   009B
        BEQ     L_F0DE                          ; F0DA   0204 0002

        MVII    #$00FF, R2                      ; F0DC   02BA 00FF
L_F0DE:
        PULR    R1                              ; F0DE   02B1
        PULR    R0                              ; F0DF   02B0
        PULR    R7                              ; F0E0   02B7
        MVI     G_033C, R4                      ; F0E1   0284 033C
        DECR    R4                              ; F0E3   0014
        MVI@    R4,     R2                      ; F0E4   02A2
        SLL     R2,     2                       ; F0E5   004E
        SDBD                                    ; F0E6   0001
        ADDI    #$4372, R2                      ; F0E7   02FA 0072 0043
        PSHR    R5                              ; F0EA   0275
        PSHR    R2                              ; F0EB   0272
        MVII    #$02A5, R1                      ; F0EC   02B9 02A5
        MVI@    R2,     R4                      ; F0EE   0294
        ANDI    #$0003, R4                      ; F0EF   03BC 0003
        INCR    R4                              ; F0F1   000C
        ADDR    R4,     R4                      ; F0F2   00E4
        ADDI    #$0004, R2                      ; F0F3   02FA 0004
        MVI@    R2,     R5                      ; F0F5   0295
        CMPI    #$0018, R5                      ; F0F6   037D 0018
        BGT     L_F0FB                          ; F0F8   020E 0001

        DECR    R4                              ; F0FA   0014
L_F0FB:
        MOVR    R4,     R2                      ; F0FB   00A2
        SLL     R2,     2                       ; F0FC   004E
        SLL     R2,     2                       ; F0FD   004E
        MVII    #$0177, R4                      ; F0FE   02BC 0177
        MVI     G_0133, R5                      ; F100   0285 0133
        TSTR    R5                              ; F102   00AD
        BNEQ    L_F106                          ; F103   020C 0001

        INCR    R4                              ; F105   000C
L_F106:
        MVI@    R4,     R4                      ; F106   02A4
        MVII    #$0003, R5                      ; F107   02BD 0003
L_F109:
        CMPR    R2,     R4                      ; F109   0154
        BLT     L_F113                          ; F10A   0205 0007

        ADDI    #$0008, R2                      ; F10C   02FA 0008
        ADDI    #$0014, R1                      ; F10E   02F9 0014
        DECR    R5                              ; F110   0015
        BNEQ    L_F109                          ; F111   022C 0009

L_F113:
        PULR    R2                              ; F113   02B2
        PULR    R7                              ; F114   02B7
        PSHR    R5                              ; F115   0275
        DIS                                     ; F116   0003
        MVII    #$01C5, R4                      ; F117   02BC 01C5
        MVII    #$000E, R0                      ; F119   02B8 000E

        JSR     R5,     X_FILL_ZERO             ; F11B   0004 0114 0338

        MVII    #$0004, R0                      ; F11E   02B8 0004
        SWAP    R0,     1                       ; F120   0040
        MVO     R0,     .IV.FIFO                ; F121   0240 0081

        JSR     R5,     G_E1D8                  ; F123   0004 01E0 01D8

        TSTR    R0                              ; F126   0080
        BNEQ    L_F129                          ; F127   020C 0000

L_F129:
        EIS                                     ; F129   0002
        PULR    R7                              ; F12A   02B7
        PSHR    R5                              ; F12B   0275
        PSHR    R5                              ; F12C   0275
        DIS                                     ; F12D   0003
        MVII    #$0041, R1                      ; F12E   02B9 0041
L_F130:
        MVI     G_01C5, R0                      ; F130   0280 01C5
        MOVR    R0,     R3                      ; F132   0083
        ANDI    #$0040, R0                      ; F133   03B8 0040
        BEQ     L_F1C6                          ; F135   0204 008F

        SLR     R3,     1                       ; F137   0063
        ANDI    #$0006, R3                      ; F138   03BB 0006
        MVII    #$01CA, R4                      ; F13A   02BC 01CA
        ADDR    R3,     R4                      ; F13C   00DC
        MVII    #$01C6, R5                      ; F13D   02BD 01C6
        SDBD                                    ; F13F   0001
        MVI@    R5,     R2                      ; F140   02AA
        TSTR    R2                              ; F141   0092
        BNEQ    L_F166                          ; F142   020C 0022

        SDBD                                    ; F144   0001
        MVI@    R4,     R5                      ; F145   02A5
        SDBD                                    ; F146   0001
        MVI@    R5,     R0                      ; F147   02A8
        SUBI    #$0002, R4                      ; F148   033C 0002
        CMPI    #$0100, R0                      ; F14A   0378 0100
        BC      L_F166                          ; F14C   0201 0018

        TSTR    R0                              ; F14E   0080
        BNEQ    L_F156                          ; F14F   020C 0005

        JSR     R5,     G_E183                  ; F151   0004 01E0 0183

        B       L_F130                          ; F154   0220 0025

L_F156:
        JSR     R5,     G_E1A4                  ; F156   0004 01E0 01A4

        BC      L_F1C6                          ; F159   0201 006B

        PSHR    R1                              ; F15B   0271
        MVII    #$0001, R1                      ; F15C   02B9 0001

L_F15E:
        JSR     R5,     G_E1DD                  ; F15E   0004 01E0 01DD

        PULR    R1                              ; F161   02B1
        BC      L_F1C6                          ; F162   0201 0062
        B       L_F130                          ; F164   0220 0035

L_F166:
        PSHR    R4                              ; F166   0274
        MVII    #$01C6, R4                      ; F167   02BC 01C6
        SDBD                                    ; F169   0001
        MVI@    R4,     R2                      ; F16A   02A2
        SDBD                                    ; F16B   0001
        MVI@    R4,     R5                      ; F16C   02A5
        PULR    R4                              ; F16D   02B4
L_F16E:
        TSTR    R2                              ; F16E   0092
        BNEQ    L_F175                          ; F16F   020C 0004

        PSHR    R1                              ; F171   0271
        CLRR    R1                              ; F172   01C9
        B       L_F15E                          ; F173   0220 0016

L_F175:
        MVI     .IV.FIFO,R0                     ; F175   0280 0081
        TSTR    R0                              ; F177   0080
        BMI     L_F1BD                          ; F178   020B 0043

        DECR    R1                              ; F17A   0011
        BEQ     L_F1BD                          ; F17B   0204 0040

        MVI@    R5,     R0                      ; F17D   02A8
        MVO     R0,     .IV.FIFO                ; F17E   0240 0081
        DECR    R2                              ; F180   0012
        B       L_F16E                          ; F181   0220 0014

        PSHR    R5                              ; F183   0275
L_F184:
        CLRR    R0                              ; F184   01C0
        MVO     R0,     G_01C6                  ; F185   0240 01C6
        MVO     R0,     G_01C7                  ; F187   0240 01C7
        MVI     G_01C5, R0                      ; F189   0280 01C5
        PSHR    R0                              ; F18B   0270
        ADDI    #$0004, R0                      ; F18C   02F8 0004
        ANDI    #$000C, R0                      ; F18E   03B8 000C
        PULR    R3                              ; F190   02B3
        ANDI    #$0063, R3                      ; F191   03BB 0063
        ADDR    R0,     R3                      ; F193   00C3
        MVO     R3,     G_01C5                  ; F194   0243 01C5
        SLR     R0,     2                       ; F196   0064
        ANDI    #$0003, R3                      ; F197   03BB 0003
        CMPR    R0,     R3                      ; F199   0143
        BNEQ    L_F223                          ; F19A   020C 0087

        MVI     G_01C5, R0                      ; F19C   0280 01C5
        ANDI    #$00AF, R0                      ; F19E   03B8 00AF
        MVO     R0,     G_01C5                  ; F1A0   0240 01C5
        SETC                                    ; F1A2   0007
        PULR    R7                              ; F1A3   02B7
        PSHR    R1                              ; F1A4   0271
        MVI     G_01D2, R1                      ; F1A5   0281 01D2
        TSTR    R1                              ; F1A7   0089
        BEQ     L_F1AD                          ; F1A8   0204 0003

L_F1AA:
        SETC                                    ; F1AA   0007
        PULR    R1                              ; F1AB   02B1
        MOVR    R5,     R7                      ; F1AC   00AF
L_F1AD:
        MVI     .IV.ALD,R1                      ; F1AD   0281 0080
        TSTR    R1                              ; F1AF   0089
        BPL     L_F1AA                          ; F1B0   0223 0007

        MVO     R0,     .IV.ALD                 ; F1B2   0240 0080
        CLRC                                    ; F1B4   0006
        MVI     G_01C5, R0                      ; F1B5   0280 01C5
        ANDI    #$00EF, R0                      ; F1B7   03B8 00EF
        MVO     R0,     G_01C5                  ; F1B9   0240 01C5
        PULR    R1                              ; F1BB   02B1
        MOVR    R5,     R7                      ; F1BC   00AF
L_F1BD:
        MVII    #$01C6, R4                      ; F1BD   02BC 01C6
        MVO@    R2,     R4                      ; F1BF   0262
        SWAP    R2,     1                       ; F1C0   0042
        MVO@    R2,     R4                      ; F1C1   0262
        MOVR    R5,     R0                      ; F1C2   00A8
        MVO@    R0,     R4                      ; F1C3   0260
        SWAP    R0,     1                       ; F1C4   0040
        MVO@    R0,     R4                      ; F1C5   0260
L_F1C6:
        MVI     .IV.ALD,R0                      ; F1C6   0280 0080
        TSTR    R0                              ; F1C8   0080
        BPL     L_F1D6                          ; F1C9   0203 000B

        MVI     G_01D2, R3                      ; F1CB   0283 01D2
        TSTR    R3                              ; F1CD   009B
        BEQ     L_F1D6                          ; F1CE   0204 0006

        CLRR    R0                              ; F1D0   01C0
        MVO     R0,     .IV.ALD                 ; F1D1   0240 0080
        DECR    R3                              ; F1D3   0013
        MVO     R3,     G_01D2                  ; F1D4   0243 01D2
L_F1D6:
        EIS                                     ; F1D6   0002
        PULR    R7                              ; F1D7   02B7
        MVI     .IV.FIFO,R0                     ; F1D8   0280 0081
        ANDI    #$0200, R0                      ; F1DA   03B8 0200
        MOVR    R5,     R7                      ; F1DC   00AF
        PSHR    R5                              ; F1DD   0275
        SDBD                                    ; F1DE   0001
        MVI@    R4,     R5                      ; F1DF   02A5
        SDBD                                    ; F1E0   0001
        MVI@    R5,     R0                      ; F1E1   02A8
        SUBI    #$0002, R4                      ; F1E2   033C 0002
        TSTR    R0                              ; F1E4   0080
        BEQ     L_F184                          ; F1E5   0224 0062

        CMPI    #$0100, R0                      ; F1E7   0378 0100
        BC      L_F1F5                          ; F1E9   0201 000A

        PSHR    R0                              ; F1EB   0270
        CLRR    R0                              ; F1EC   01C0
        MVO     R0,     G_01C6                  ; F1ED   0240 01C6
        MVO     R0,     G_01C7                  ; F1EF   0240 01C7
        PULR    R0                              ; F1F1   02B0
        TSTR    R1                              ; F1F2   0089
        BEQ     L_F223                          ; F1F3   0204 002E

L_F1F5:
        PSHR    R0                              ; F1F5   0270
        MOVR    R5,     R0                      ; F1F6   00A8
        MVO@    R0,     R4                      ; F1F7   0260
        SWAP    R0,     1                       ; F1F8   0040
        MVO@    R0,     R4                      ; F1F9   0260
        SUBI    #$0002, R4                      ; F1FA   033C 0002
        SUBI    #$0002, R5                      ; F1FC   033D 0002
        PULR    R0                              ; F1FE   02B0
        CMPI    #$0100, R0                      ; F1FF   0378 0100
        BNC     L_F223                          ; F201   0209 0020

        SDBD                                    ; F203   0001
        MVI@    R5,     R0                      ; F204   02A8
        MOVR    R0,     R5                      ; F205   0085
        MVI@    R5,     R0                      ; F206   02A8
        MVO     R0,     G_01C6                  ; F207   0240 01C6
        SWAP    R0,     1                       ; F209   0040
        MVO     R0,     G_01C7                  ; F20A   0240 01C7
        MOVR    R5,     R0                      ; F20C   00A8
        MVO     R0,     G_01C8                  ; F20D   0240 01C8
        SWAP    R0,     1                       ; F20F   0040
        MVO     R0,     G_01C9                  ; F210   0240 01C9
        MVI     G_01C5, R0                      ; F212   0280 01C5
        ANDI    #$0010, R0                      ; F214   03B8 0010
        BNEQ    L_F223                          ; F216   020C 000B

        MVI     G_01D2, R0                      ; F218   0280 01D2
        INCR    R0                              ; F21A   0008
        MVO     R0,     G_01D2                  ; F21B   0240 01D2
        MVI     G_01C5, R0                      ; F21D   0280 01C5
        ADDI    #$0010, R0                      ; F21F   02F8 0010
        MVO     R0,     G_01C5                  ; F221   0240 01C5
L_F223:
        CLRC                                    ; F223   0006
        PULR    R7                              ; F224   02B7
        DIS                                     ; F225   0003
        PSHR    R5                              ; F226   0275
        PSHR    R0                              ; F227   0270
        PSHR    R1                              ; F228   0271
        MVI     G_01C5, R1                      ; F229   0281 01C5
        PSHR    R2                              ; F22B   0272
        PSHR    R3                              ; F22C   0273
        PSHR    R4                              ; F22D   0274

        JSR     R5,     G_E1D8                  ; F22E   0004 01E0 01D8

        TSTR    R0                              ; F231   0080
        BNEQ    L_F25E                          ; F232   020C 002A

        MOVR    R1,     R2                      ; F234   008A
        ANDI    #$0080, R2                      ; F235   03BA 0080
        SETC                                    ; F237   0007
        BNEQ    L_F25F                          ; F238   020C 0025

        MOVR    R1,     R2                      ; F23A   008A
        ANDI    #$0003, R2                      ; F23B   03BA 0003
        SDBD                                    ; F23D   0001
        MVII    #$01CA, R4                      ; F23E   02BC 00CA 0001
        ADDR    R2,     R4                      ; F241   00D4
        ADDR    R2,     R4                      ; F242   00D4
        MVO@    R3,     R4                      ; F243   0263
        SWAP    R3,     1                       ; F244   0043
        MVO@    R3,     R4                      ; F245   0263
        INCR    R2                              ; F246   000A
        ANDI    #$0003, R2                      ; F247   03BA 0003
        MOVR    R1,     R0                      ; F249   0088
        ANDI    #$000C, R0                      ; F24A   03B8 000C
        SLR     R0,     2                       ; F24C   0064
        CMPR    R0,     R2                      ; F24D   0142
        BNEQ    L_F254                          ; F24E   020C 0004

        ANDI    #$007F, R1                      ; F250   03B9 007F
        XORI    #$0080, R1                      ; F252   03F9 0080
L_F254:
        ANDI    #$00BC, R1                      ; F254   03B9 00BC
        XORI    #$0040, R1                      ; F256   03F9 0040
        MOVR    R2,     R4                      ; F258   0094
        COMR    R4                              ; F259   001C
        ANDR    R4,     R1                      ; F25A   01A1
        XORR    R2,     R1                      ; F25B   01D1
        MVO     R1,     G_01C5                  ; F25C   0241 01C5
L_F25E:
        CLRC                                    ; F25E   0006
L_F25F:
        PULR    R4                              ; F25F   02B4
        PULR    R3                              ; F260   02B3
        PULR    R2                              ; F261   02B2
        PULR    R1                              ; F262   02B1
        PULR    R0                              ; F263   02B0
        EIS                                     ; F264   0002
        PULR    R7                              ; F265   02B7
        MOVR    R4,     R5                      ; F266   00A5
        ADDR    R7,     R5                      ; F267   00FD
        DECLE   $0000                           ; F268   0000

        ADDR    R6,     R0                      ; F269   00F0
        RRC     R0,     1                       ; F26A   0070
        ADDR    R5,     R7                      ; F26B   00EF
        RLC     R3,     2                       ; F26C   0057
        ADDR    R6,     R0                      ; F26D   00F0
        SLR     R0,     1                       ; F26E   0060
        ADDR    R3,     R7                      ; F26F   00DF
        ADDR    R1,     R0                      ; F270   00C8
        ADDR    R5,     R5                      ; F271   00ED
        SARC    R1,     1                       ; F272   0079
        ADDR    R5,     R6                      ; F273   00EE
        SLR     R0,     1                       ; F274   0060
        ADDR    R7,     R7                      ; F275   00FF
        CLRC                                    ; F276   0006
        ADDR    R5,     R7                      ; F277   00EF
        MOVR    R3,     R0                      ; F278   0098
        ADDR    R6,     R0                      ; F279   00F0
        ADDR    R0,     R6                      ; F27A   00C6
        ADDR    R6,     R0                      ; F27B   00F0
        RSWD    R3                              ; F27C   003B
        ADDR    R6,     R1                      ; F27D   00F1
        SAR     R0,     2                       ; F27E   006C
        ADDR    R6,     R1                      ; F27F   00F1
        DECLE   $0035                           ; F280   0035

        ADDR    R7,     R6                      ; F281   00FE
        MOVR    R4,     R6                      ; F282   00A6
        ADDR    R6,     R1                      ; F283   00F1
        ADDR    R7,     R0                      ; F284   00F8
        ADDR    R6,     R1                      ; F285   00F1
        TSTR    R2                              ; F286   0092
        ADDR    R6,     R2                      ; F287   00F2
        EIS                                     ; F288   0002
        ADDR    R7,     R4                      ; F289   00FC
        NEGR    R3                              ; F28A   0023
        ADDR    R7,     R5                      ; F28B   00FD
L_F28C:
        SWAP    R1,     1                       ; F28C   0041
        ADDR    R6,     R3                      ; F28D   00F3
        ADDR    R1,     R7                      ; F28E   00CF
        ADDR    R6,     R3                      ; F28F   00F3
        MOVR    R4,     R0                      ; F290   00A0
        ADDR    R6,     R4                      ; F291   00F4
        RSWD    R4                              ; F292   003C
        ADDR    R6,     R5                      ; F293   00F5
        NEGR    R2                              ; F294   0022
        ADDR    R6,     R6                      ; F295   00F6
        MOVR    R4,     R5                      ; F296   00A5
        ADDR    R6,     R6                      ; F297   00F6
        DECLE   $0004                           ; F298   0004

        ADDR    R6,     R7                      ; F299   00F7
        ADDR    R7,     R5                      ; F29A   00FD
        SAR     R2,     2                       ; F29B   006E
        MOVR    R6,     R2                      ; F29C   00B2
        ADDR    R6,     R7                      ; F29D   00F7
        RSWD    R7                              ; F29E   003F
        ADDR    R7,     R0                      ; F29F   00F8
        MOVR    R5,     R3                      ; F2A0   00AB
        ADDR    R7,     R0                      ; F2A1   00F8
        RSWD    R4                              ; F2A2   003C
        SAR     R3,     2                       ; F2A3   006F
        SLLC    R2,     1                       ; F2A4   005A
        ADDR    R7,     R1                      ; F2A5   00F9
        ADDR    R6,     R7                      ; F2A6   00F7
        ADDR    R7,     R1                      ; F2A7   00F9
        SWAP    R0,     2                       ; F2A8   0044
        ADDR    R7,     R2                      ; F2A9   00FA
        MOVR    R0,     R7                      ; F2AA   0087
        ADDR    R7,     R2                      ; F2AB   00FA
        ADDR    R2,     R7                      ; F2AC   00D7
        ADDR    R7,     R2                      ; F2AD   00FA
        COMR    R3                              ; F2AE   001B
        ADDR    R7,     R3                      ; F2AF   00FB
        DECLE   $0001                           ; F2B0   0001

        ADDR    R7,     R6                      ; F2B1   00FE
        CLRC                                    ; F2B2   0006
        DECLE   $0000                           ; F2B3   0000

        EIS                                     ; F2B4   0002
        DECLE   $0000,  $0001,  $0000,  $0000   ; F2B5   0000 0001 0000 0000

        COMR    R0                              ; F2B9   0018
        COMR    R3                              ; F2BA   001B
        RSWD    R1                              ; F2BB   0039
        NEGR    R2                              ; F2BC   0022
        SWAP    R2,     2                       ; F2BD   0046
        SLL     R2,     2                       ; F2BE   004E
        ADCR    R5                              ; F2BF   002D
        MOVR    R0,     R7                      ; F2C0   0087
        SLLC    R1,     2                       ; F2C1   005D
        SAR     R2,     1                       ; F2C2   006A
        RRC     R3,     2                       ; F2C3   0077
        MOVR    R0,     R4                      ; F2C4   0084
        MOVR    R7,     R1                      ; F2C5   00B9
        MOVR    R5,     R3                      ; F2C6   00AB
        MOVR    R2,     R4                      ; F2C7   0094
        TSTR    R6                              ; F2C8   00B6
        TSTR    R4                              ; F2C9   00A4
        MOVR    R3,     R7                      ; F2CA   009F
        MOVR    R5,     R6                      ; F2CB   00AE
        MOVR    R6,     R1                      ; F2CC   00B1
        ADDR    R0,     R0                      ; F2CD   00C0
        ADDR    R2,     R3                      ; F2CE   00D3
        ADDR    R0,     R3                      ; F2CF   00C3
        ADDR    R1,     R3                      ; F2D0   00CB
        XORI    #$0002, R7                      ; F2D1   03FF 0002
        SWAP    R0,     1                       ; F2D3   0040
        XORI    #$0000, R7                      ; F2D4   03FF 0000
        EIS                                     ; F2D6   0002
        SWAP    R2,     1                       ; F2D7   0042
        DECLE   $0000                           ; F2D8   0000

        EIS                                     ; F2D9   0002
        SWAP    R0,     1                       ; F2DA   0040
        XORI    #$0002, R7                      ; F2DB   03FF 0002
        SWAP    R2,     2                       ; F2DD   0046
        EIS                                     ; F2DE   0002
        SLLC    R0,     1                       ; F2DF   0058
        DECLE   $0001                           ; F2E0   0001

        JSR     R4,     G_004A                  ; F2E1   0004 0000 004A

        SLL     R0,     2                       ; F2E4   004C
        SLL     R2,     2                       ; F2E5   004E
        XORI    #$0000, R7                      ; F2E6   03FF 0000
        EIS                                     ; F2E8   0002
        DECLE   $0000                           ; F2E9   0000

        SWAP    R2,     2                       ; F2EA   0046
        EIS                                     ; F2EB   0002
        SLL     R0,     1                       ; F2EC   0048
        DECLE   $0001                           ; F2ED   0001

        DIS                                     ; F2EE   0003
        SLL     R0,     2                       ; F2EF   004C
        SLL     R2,     2                       ; F2F0   004E
        RLC     R0,     1                       ; F2F1   0050
        XORI    #$0000, R7                      ; F2F2   03FF 0000
        EIS                                     ; F2F4   0002
        DECLE   $0000                           ; F2F5   0000

        RLC     R2,     1                       ; F2F6   0052
        EIS                                     ; F2F7   0002
        SWAP    R0,     2                       ; F2F8   0044
        DECLE   $0001                           ; F2F9   0001

        JSR     R4,     L_504A                  ; F2FA   0004 0050 004A

        SLL     R0,     2                       ; F2FD   004C
        SLL     R2,     2                       ; F2FE   004E
        XORI    #$0000, R7                      ; F2FF   03FF 0000
        DIS                                     ; F301   0003
        DECLE   $0000,  $0000                   ; F302   0000 0000

        SWAP    R2,     2                       ; F304   0046
        EIS                                     ; F305   0002
        RLC     R0,     2                       ; F306   0054
        XORI    #$0000, R7                      ; F307   03FF 0000
        EIS                                     ; F309   0002
        DECLE   $0000                           ; F30A   0000

        SWAP    R2,     2                       ; F30B   0046
        EIS                                     ; F30C   0002
        RLC     R0,     2                       ; F30D   0054
        EIS                                     ; F30E   0002
        RLC     R2,     2                       ; F30F   0056
        DECLE   $0001                           ; F310   0001

        JSR     R4,     L_504A                  ; F311   0004 0050 004A

        SLL     R0,     2                       ; F314   004C
        SLL     R2,     2                       ; F315   004E
        XORI    #$0002, R7                      ; F316   03FF 0002
        MOVR    R1,     R6                      ; F318   008E
        DECLE   $0000                           ; F319   0000

        EIS                                     ; F31A   0002
        DECLE   $0000                           ; F31B   0000

        SLLC    R0,     2                       ; F31C   005C
        DECLE   $0001                           ; F31D   0001

        EIS                                     ; F31E   0002
        DECLE   $0000                           ; F31F   0000

        SLR     R2,     2                       ; F320   0066
        EIS                                     ; F321   0002
        SAR     R0,     1                       ; F322   0068
        XORI    #$0002, R7                      ; F323   03FF 0002
        MOVR    R1,     R6                      ; F325   008E
        DECLE   $0000                           ; F326   0000

        EIS                                     ; F327   0002
        DECLE   $0000                           ; F328   0000

        SLLC    R0,     2                       ; F329   005C
        DECLE   $0001                           ; F32A   0001

        EIS                                     ; F32B   0002
        DECLE   $0000                           ; F32C   0000

        SLR     R2,     2                       ; F32D   0066
        EIS                                     ; F32E   0002
        SLR     R2,     1                       ; F32F   0062
        XORI    #$0002, R7                      ; F330   03FF 0002
        MOVR    R1,     R6                      ; F332   008E
        DECLE   $0000                           ; F333   0000

        EIS                                     ; F334   0002
        DECLE   $0000                           ; F335   0000

        SLLC    R0,     2                       ; F336   005C
        DECLE   $0001                           ; F337   0001

        EIS                                     ; F338   0002
        DECLE   $0000                           ; F339   0000

        SLR     R0,     1                       ; F33A   0060
        EIS                                     ; F33B   0002
        SLLC    R2,     2                       ; F33C   005E
        XORI    #$0002, R7                      ; F33D   03FF 0002
        SLLC    R2,     1                       ; F33F   005A
        XORI    #$0002, R7                      ; F340   03FF 0002
        MOVR    R1,     R6                      ; F342   008E
        DECLE   $0000                           ; F343   0000

        EIS                                     ; F344   0002
        DECLE   $0000                           ; F345   0000

        SLLC    R0,     2                       ; F346   005C
        DECLE   $0001                           ; F347   0001

        EIS                                     ; F348   0002
        DECLE   $0000                           ; F349   0000

        SLR     R2,     2                       ; F34A   0066
        EIS                                     ; F34B   0002
        SLR     R0,     2                       ; F34C   0064
        XORI    #$0000, R7                      ; F34D   03FF 0000
        EIS                                     ; F34F   0002
        RLC     R2,     1                       ; F350   0052
        DECLE   $0000                           ; F351   0000

        EIS                                     ; F352   0002
        SAR     R2,     2                       ; F353   006E
        DECLE   $0001                           ; F354   0001

        EIS                                     ; F355   0002
        RRC     R0,     1                       ; F356   0070
        RRC     R2,     2                       ; F357   0076
        XORI    #$0002, R7                      ; F358   03FF 0002
        SARC    R2,     1                       ; F35A   007A
        EIS                                     ; F35B   0002
        RRC     R2,     2                       ; F35C   0076
        XORI    #$0002, R7                      ; F35D   03FF 0002
        MOVR    R2,     R0                      ; F35F   0090
        EIS                                     ; F360   0002
        RRC     R0,     2                       ; F361   0074
        EIS                                     ; F362   0002
        SARC    R0,     1                       ; F363   0078
        XORI    #$0002, R7                      ; F364   03FF 0002
        SAR     R0,     2                       ; F366   006C
        XORI    #$0002, R7                      ; F367   03FF 0002
        SARC    R0,     2                       ; F369   007C
        XORI    #$0000, R7                      ; F36A   03FF 0000
        EIS                                     ; F36C   0002
        DECLE   $0000                           ; F36D   0000

        SARC    R0,     1                       ; F36E   0078
        XORI    #$0002, R7                      ; F36F   03FF 0002
        RRC     R2,     1                       ; F371   0072
        XORI    #$0002, R7                      ; F372   03FF 0002
        SAR     R2,     1                       ; F374   006A
        DECLE   $0000                           ; F375   0000

        EIS                                     ; F376   0002
        DECLE   $0000                           ; F377   0000

        SAR     R2,     1                       ; F378   006A
        XORI    #$0002, R7                      ; F379   03FF 0002
        MOVR    R1,     R0                      ; F37B   0088
        XORI    #$0001, R7                      ; F37C   03FF 0001
        DIS                                     ; F37E   0003
        SARC    R2,     2                       ; F37F   007E
        MOVR    R0,     R4                      ; F380   0084
        MOVR    R0,     R6                      ; F381   0086
        EIS                                     ; F382   0002
        TSTR    R0                              ; F383   0080
        XORI    #$0001, R7                      ; F384   03FF 0001
        DIS                                     ; F386   0003
        SARC    R2,     2                       ; F387   007E
        MOVR    R0,     R4                      ; F388   0084
        MOVR    R0,     R6                      ; F389   0086
        EIS                                     ; F38A   0002
        MOVR    R0,     R2                      ; F38B   0082
        XORI    #$0002, R7                      ; F38C   03FF 0002
        MOVR    R1,     R4                      ; F38E   008C
        EIS                                     ; F38F   0002
        MOVR    R1,     R6                      ; F390   008E
        EIS                                     ; F391   0002
        MOVR    R1,     R2                      ; F392   008A
        XORI    #$0003, R7                      ; F393   03FF 0003
        DECLE   $0005                           ; F395   0005

        CLRC                                    ; F396   0006
        EIS                                     ; F397   0002
        SETC                                    ; F398   0007
        INCR    R0                              ; F399   0008
        INCR    R1                              ; F39A   0009
        INCR    R2                              ; F39B   000A
        INCR    R6                              ; F39C   000E
        DECR    R6                              ; F39D   0016
        DECR    R7                              ; F39E   0017
        XORI    #$0275, R7                      ; F39F   03FF 0275
        MVI     G_01C5, R0                      ; F3A1   0280 01C5
        MOVR    R0,     R1                      ; F3A3   0081
        ANDI    #$0003, R1                      ; F3A4   03B9 0003
        SLR     R0,     2                       ; F3A6   0064
        XORR    R1,     R0                      ; F3A7   01C8
        BNEQ    L_F449                          ; F3A8   020C 009F

        MVII    #$01D3, R4                      ; F3AA   02BC 01D3
        SDBD                                    ; F3AC   0001
        MVI@    R4,     R1                      ; F3AD   02A1
        DECR    R0                              ; F3AE   0010
        TSTR    R1                              ; F3AF   0089
        BNEQ    L_F3B9                          ; F3B0   020C 0007

        SDBD                                    ; F3B2   0001
        MVI@    R4,     R1                      ; F3B3   02A1
        MVII    #$000F, R0                      ; F3B4   02B8 000F
        TSTR    R1                              ; F3B6   0089
        BEQ     L_F449                          ; F3B7   0204 0090

L_F3B9:
        PSHR    R1                              ; F3B9   0271
L_F3BA:
        INCR    R0                              ; F3BA   0008
        SARC    R1,     1                       ; F3BB   0079
        BNC     L_F3BA                          ; F3BC   0229 0003

        MOVR    R0,     R1                      ; F3BE   0081
        ANDI    #$000F, R0                      ; F3BF   03B8 000F

        JSR     R5,     X_POW2                  ; F3C1   0004 0114 0345

        COMR    R0                              ; F3C4   0018
        AND@    R6,     R0                      ; F3C5   03B0
        SUBI    #$0002, R4                      ; F3C6   033C 0002
        MVO@    R0,     R4                      ; F3C8   0260
        SWAP    R0,     1                       ; F3C9   0040
        MVO@    R0,     R4                      ; F3CA   0260
        SDBD                                    ; F3CB   0001
        MVII    #$E394, R4                      ; F3CC   02BC 0094 00E3
        MVII    #$01D7, R5                      ; F3CF   02BD 01D7
L_F3D1:
        MVI@    R4,     R0                      ; F3D1   02A0
        MVI@    R5,     R2                      ; F3D2   02AA
        CMPR    R0,     R1                      ; F3D3   0141
        BEQ     L_F3DB                          ; F3D4   0204 0005

        CMPI    #$03FF, R0                      ; F3D6   0378 03FF
        BNEQ    L_F3D1                          ; F3D8   022C 0008

        INCR    R7                              ; F3DA   000F
L_F3DB:
        PSHR    R2                              ; F3DB   0272
        SDBD                                    ; F3DC   0001
        MVII    #$E2B9, R4                      ; F3DD   02BC 00B9 00E2
        ADDR    R4,     R1                      ; F3E0   00E1
        ADD@    R1,     R4                      ; F3E1   02CC
        MVI@    R4,     R0                      ; F3E2   02A0
        CMPI    #$03FF, R0                      ; F3E3   0378 03FF
        BEQ     L_F3EE                          ; F3E5   0204 0007

        JSR     R5,     X_RAND2                 ; F3E7   0004 0114 029E

        MOVR    R0,     R1                      ; F3EA   0081
        ADDR    R4,     R1                      ; F3EB   00E1
        MOVR    R1,     R4                      ; F3EC   008C
        ADD@    R1,     R4                      ; F3ED   02CC
L_F3EE:
        SDBD                                    ; F3EE   0001
        MVII    #$4000, R3                      ; F3EF   02BB 0000 0040
L_F3F2:
        MVI@    R4,     R1                      ; F3F2   02A1
        CMPI    #$03FF, R1                      ; F3F3   0379 03FF
        BEQ     L_F433                          ; F3F5   0204 003C

        MVI@    R4,     R0                      ; F3F7   02A0
        MOVR    R0,     R2                      ; F3F8   0082
        INCR    R1                              ; F3F9   0009
        ADDR    R7,     R1                      ; F3FA   00F9
        ADD@    R1,     R7                      ; F3FB   02CF
        SETC                                    ; F3FC   0007
        INCR    R3                              ; F3FD   000B
        DIS                                     ; F3FE   0003
        MOVR    R4,     R2                      ; F3FF   00A2
        DECR    R4                              ; F400   0014
        B       L_F40A                          ; F401   0200 0007

        JSR     R5,     X_RAND2                 ; F403   0004 0114 029E

        INCR    R7                              ; F406   000F
        PULR    R0                              ; F407   02B0
        ADDR    R4,     R2                      ; F408   00E2
        ADDR    R0,     R4                      ; F409   00C4

L_F40A:
        JSR     R5,     G_E41E                  ; F40A   0004 01E4 001E

        TSTR    R0                              ; F40D   0080
        BEQ     L_F414                          ; F40E   0204 0004

L_F410:
        MOVR    R2,     R4                      ; F410   0094
        B       L_F3F2                          ; F411   0220 0020

L_F413:
        INCR    R4                              ; F413   000C
L_F414:
        PSHR    R4                              ; F414   0274

        JSR     R5,     G_E41E                  ; F415   0004 01E4 001E

        PULR    R4                              ; F418   02B4
        INCR    R0                              ; F419   0008
        BEQ     L_F410                          ; F41A   0224 000B
        B       L_F413                          ; F41C   0220 000A

        MVI@    R4,     R0                      ; F41E   02A0
        MOVR    R0,     R4                      ; F41F   0084
        PSHR    R5                              ; F420   0275
        SDBD                                    ; F421   0001
        ADDI    #$E226, R4                      ; F422   02FC 0026 00E2
        SDBD                                    ; F425   0001
        MVI@    R4,     R1                      ; F426   02A1
        DECR    R0                              ; F427   0010
        BMI     L_F432                          ; F428   020B 0008

        MOVR    R1,     R0                      ; F42A   0088
        BEQ     L_F432                          ; F42B   0204 0005

        MVO@    R1,     R3                      ; F42D   0259
        SWAP    R1,     1                       ; F42E   0041
        INCR    R3                              ; F42F   000B
        MVO@    R1,     R3                      ; F430   0259
        INCR    R3                              ; F431   000B
L_F432:
        PULR    R7                              ; F432   02B7
L_F433:
        SDBD                                    ; F433   0001
        MVII    #$6FE9, R0                      ; F434   02B8 00E9 006F
        MOVR    R3,     R4                      ; F437   009C
        MVO@    R0,     R4                      ; F438   0260
        SWAP    R0,     1                       ; F439   0040
        MVO@    R0,     R4                      ; F43A   0260
        MVII    #$0002, R0                      ; F43B   02B8 0002
        MVO@    R0,     R4                      ; F43D   0260
        CLRR    R0                              ; F43E   01C0
        MVO@    R0,     R4                      ; F43F   0260
        MVO@    R0,     R4                      ; F440   0260
        MVO@    R0,     R4                      ; F441   0260
        SDBD                                    ; F442   0001
        MVII    #$4000, R3                      ; F443   02BB 0000 0040

        JSR     R5,     G_E225                  ; F446   0004 01E0 0225

L_F449:
        PULR    R7                              ; F449   02B7
        PSHR    R5                              ; F44A   0275

        JSR     R5,     X_PLAY_SFX2             ; F44B   0004 0118 03BE

        MOVR    R6,     R5                      ; F44E   00B5
        ADCR    R7                              ; F44F   002F
        XOR@    R5,     R1                      ; F450   03E9
        CMP     G_00C8, R0                      ; F451   0340 00C8
        SDBD                                    ; F453   0001
        XOR@    R4,     R0                      ; F454   03E0
        ADD@    R5,     R3                      ; F455   02EB
        DECLE   $0005                           ; F456   0005

        CMPR    R5,     R3                      ; F457   016B
        SUBR    R5,     R7                      ; F458   012F
        CMP     G_00AA, R0                      ; F459   0340 00AA
        MOVR    R4,     R1                      ; F45B   00A1
        DECLE   $0000                           ; F45C   0000

        XOR@    R4,     R2                      ; F45D   03E2
        ADD@    R5,     R3                      ; F45E   02EB
        ADD@    R1,     R7                      ; F45F   02CF
        PSHR    R5                              ; F460   0275

        JSR     R5,     X_PLAY_SFX2             ; F461   0004 0118 03BE

        DECR    R4                              ; F464   0014
        ADCR    R7                              ; F465   002F
        XOR@    R5,     R1                      ; F466   03E9
        SUB     G_01AC, R0                      ; F467   0300 01AC
        SUBR    R5,     R3                      ; F469   012B
        SUB     G_0140, R0                      ; F46A   0300 0140
        SUBR    R5,     R3                      ; F46C   012B
        SUB     .PSG1.rgt_hand,R0               ; F46D   0300 00FE
        SUBR    R5,     R3                      ; F46F   012B
        SUB     G_00D7, R0                      ; F470   0300 00D7
        XORR    R5,     R3                      ; F472   01EB
        ADD@    R1,     R7                      ; F473   02CF
        PSHR    R5                              ; F474   0275
        MVI     G_0102, R0                      ; F475   0280 0102
        SWAP    R0,     1                       ; F477   0040
        SWAP    R0,     1                       ; F478   0040
        BMI     L_F482                          ; F479   020B 0007

        JSR     R5,     G_E489                  ; F47B   0004 01E4 0089
        JSR     R5,     G_E756                  ; F47E   0004 01E4 0356

        PULR    R7                              ; F481   02B7
L_F482:
        CLRR    R0                              ; F482   01C0
        MVII    #$00FB, R4                      ; F483   02BC 00FB
        MVO@    R0,     R4                      ; F485   0260
        MVO@    R0,     R4                      ; F486   0260
        MVO@    R0,     R4                      ; F487   0260
        PULR    R7                              ; F488   02B7
        PSHR    R5                              ; F489   0275
        MVI     G_0146, R0                      ; F48A   0280 0146
        TSTR    R0                              ; F48C   0080
        BNEQ    L_F54C                          ; F48D   020C 00BD

        MVI     G_0170, R0                      ; F48F   0280 0170
        DECR    R0                              ; F491   0010
        BMI     L_F4D1                          ; F492   020B 003D
        BEQ     L_F4D2                          ; F494   0204 003C

        MVO     R0,     G_0170                  ; F496   0240 0170
        CMPI    #$0002, R0                      ; F498   0378 0002
        BNEQ    L_F4B3                          ; F49A   020C 0017

        CLRR    R0                              ; F49C   01C0
        MVII    #$01E4, R4                      ; F49D   02BC 01E4
L_F49F:
        MOVR    R4,     R3                      ; F49F   00A3
        MVI@    R4,     R1                      ; F4A0   02A1
        DECR    R1                              ; F4A1   0011
        BMI     L_F4AE                          ; F4A2   020B 000A

        MVO@    R1,     R3                      ; F4A4   0259
        BNEQ    L_F4AE                          ; F4A5   020C 0007

        MVII    #$01EA, R5                      ; F4A7   02BD 01EA
        ADDR    R0,     R5                      ; F4A9   00C5
        MVO@    R1,     R5                      ; F4AA   0269

        JSR     R5,     G_7563                  ; F4AB   0004 0174 0163

L_F4AE:
        INCR    R0                              ; F4AE   0008
        CMPI    #$0006, R0                      ; F4AF   0378 0006
        BLT     L_F49F                          ; F4B1   0225 0013

L_F4B3:
        CLRR    R0                              ; F4B3   01C0
L_F4B4:
        SDBD                                    ; F4B4   0001
        MVII    #$E550, R5                      ; F4B5   02BD 0050 00E5
        MVII    #$01EA, R2                      ; F4B8   02BA 01EA
        ADDR    R0,     R2                      ; F4BA   00C2
        MVI@    R2,     R3                      ; F4BB   0293
        TSTR    R3                              ; F4BC   009B
        BEQ     L_F4CC                          ; F4BD   0204 000D

        ADDR    R3,     R5                      ; F4BF   00DD
        DECR    R5                              ; F4C0   0015
        MVI@    R5,     R1                      ; F4C1   02A9
        TSTR    R1                              ; F4C2   0089
        BEQ     L_F4CA                          ; F4C3   0204 0005

        JSR     R5,     G_7563                  ; F4C5   0004 0174 0163

        INCR    R3                              ; F4C8   000B
        INCR    R7                              ; F4C9   000F
L_F4CA:
        CLRR    R3                              ; F4CA   01DB
        MVO@    R3,     R2                      ; F4CB   0253
L_F4CC:
        INCR    R0                              ; F4CC   0008
        CMPI    #$0006, R0                      ; F4CD   0378 0006
        BLT     L_F4B4                          ; F4CF   0225 001C

L_F4D1:
        PULR    R7                              ; F4D1   02B7
L_F4D2:
        MVI     G_01E2, R0                      ; F4D2   0280 01E2
        MVO     R0,     G_0170                  ; F4D4   0240 0170
        MVI     G_01E3, R0                      ; F4D6   0280 01E3
        DECR    R0                              ; F4D8   0010
        MVO     R0,     G_01E3                  ; F4D9   0240 01E3
        BNEQ    L_F4B3                          ; F4DB   022C 0029

L_F4DD:
        MVI     G_0318, R4                      ; F4DD   0284 0318
        MOVR    R4,     R5                      ; F4DF   00A5
        ADDI    #$0002, R5                      ; F4E0   02FD 0002
        MVO     R5,     G_0318                  ; F4E2   0245 0318
        MVI@    R4,     R0                      ; F4E4   02A0
        CMPI    #$0380, R0                      ; F4E5   0378 0380
        BNEQ    L_F4F2                          ; F4E7   020C 0009

        INCR    R5                              ; F4E9   000D
        MVO     R5,     G_0318                  ; F4EA   0245 0318
        SDBD                                    ; F4EC   0001
        MVII    #$E4DD, R5                      ; F4ED   02BD 00DD 00E4
        SDBD                                    ; F4F0   0001
        MVI@    R4,     R7                      ; F4F1   02A7
L_F4F2:
        CMPI    #$0300, R0                      ; F4F2   0378 0300
        BNEQ    L_F4F9                          ; F4F4   020C 0003

        MVI@    R4,     R2                      ; F4F6   02A2
        B       L_F521                          ; F4F7   0200 0028

L_F4F9:
        MOVR    R0,     R1                      ; F4F9   0081
        ANDI    #$007F, R1                      ; F4FA   03B9 007F
        ADD     G_0171, R1                      ; F4FC   02C1 0171
        SLL     R1,     1                       ; F4FE   0049
        SDBD                                    ; F4FF   0001
        MVII    #$736F, R5                      ; F500   02BD 006F 0073
        ADDR    R1,     R5                      ; F503   00CD
        SDBD                                    ; F504   0001
        MVI@    R5,     R1                      ; F505   02A9
        SLL     R0,     1                       ; F506   0048
        SWAP    R0,     1                       ; F507   0040
        ANDI    #$0007, R0                      ; F508   03B8 0007

        JSR     R5,     G_7553                  ; F50A   0004 0174 0153

        MVII    #$0001, R1                      ; F50D   02B9 0001
        MVII    #$01EA, R5                      ; F50F   02BD 01EA
        ADDR    R0,     R5                      ; F511   00C5
        MVO@    R1,     R5                      ; F512   0269
        MVI@    R4,     R2                      ; F513   02A2
        MOVR    R2,     R1                      ; F514   0091
        ANDI    #$000F, R1                      ; F515   03B9 000F
        MVII    #$01E4, R5                      ; F517   02BD 01E4
        ADDR    R0,     R5                      ; F519   00C5
        MVO@    R1,     R5                      ; F51A   0269
        SLR     R2,     2                       ; F51B   0066
        SLR     R2,     2                       ; F51C   0066
        ANDI    #$000F, R2                      ; F51D   03BA 000F
        BEQ     L_F4DD                          ; F51F   0224 0043

L_F521:
        MVO     R2,     G_01E3                  ; F521   0242 01E3
        B       L_F4B3                          ; F523   0220 0071

        PSHR    R5                              ; F525   0275
        CLRR    R5                              ; F526   01ED
        MVO     R5,     G_0135                  ; F527   0245 0135
        MVII    #$00F0, R3                      ; F529   02BB 00F0

        JSR     R5,     G_75A0                  ; F52B   0004 0174 01A0

        MVII    #$0038, R0                      ; F52E   02B8 0038
        MVO     R0,     .PSG1.chan_enable       ; F530   0240 00F8
        PULR    R5                              ; F532   02B5
        MVI@    R5,     R0                      ; F533   02A8
        MVO     R0,     G_01E2                  ; F534   0240 01E2
        PSHR    R5                              ; F536   0275
        MVII    #$01F0, R3                      ; F537   02BB 01F0

        JSR     R5,     G_75A0                  ; F539   0004 0174 01A0

        MVII    #$0038, R0                      ; F53C   02B8 0038
        MVO     R0,     .PSG0.chan_enable       ; F53E   0240 01F8
        CLRR    R0                              ; F540   01C0
        MVO     R0,     G_0171                  ; F541   0240 0171
        PULR    R5                              ; F543   02B5
        INCR    R0                              ; F544   0008
        MVO     R0,     G_0170                  ; F545   0240 0170
        MVO     R0,     G_01E3                  ; F547   0240 01E3
        MVO     R5,     G_0318                  ; F549   0245 0318
        PULR    R7                              ; F54B   02B7
L_F54C:
        CLRR    R0                              ; F54C   01C0
        MVO     R0,     G_0170                  ; F54D   0240 0170
        PULR    R7                              ; F54F   02B7
        INCR    R6                              ; F550   000E
        INCR    R5                              ; F551   000D
        INCR    R4                              ; F552   000C
        INCR    R4                              ; F553   000C
        INCR    R4                              ; F554   000C
        INCR    R3                              ; F555   000B
        DECLE   $0000                           ; F556   0000
L_F557:
        JSR     R5,     L_5312                  ; F557   0004 0150 0312

        MVI     G_0133, R2                      ; F55A   0282 0133
        MVI     G_0134, R4                      ; F55C   0284 0134
        INCR    R4                              ; F55E   000C
        MVII    #$0002, R0                      ; F55F   02B8 0002
        MVII    #$0011, R1                      ; F561   02B9 0011
        XORI    #$0001, R2                      ; F563   03FA 0001
        MVO     R2,     G_0133                  ; F565   0242 0133
        BEQ     L_F56D                          ; F567   0204 0004

        DECR    R4                              ; F569   0014
        XORR    R0,     R1                      ; F56A   01C1
        XORR    R1,     R0                      ; F56B   01C8
        XORR    R0,     R1                      ; F56C   01C1
L_F56D:
        MVO     R4,     G_0134                  ; F56D   0244 0134
        MVO     R0,     G_0131                  ; F56F   0240 0131
        MVO     R1,     G_0132                  ; F571   0241 0132
        SDBD                                    ; F573   0001
        MVII    #$1240, R0                      ; F574   02B8 0040 0012
        XOR     G_0132, R0                      ; F577   03C0 0132
        SDBD                                    ; F579   0001
        MVII    #$6080, R1                      ; F57A   02B9 0080 0060
        MVII    #$0038, R2                      ; F57D   02BA 0038
        MOVR    R0,     R3                      ; F57F   0083
        ANDI    #$0002, R3                      ; F580   03BB 0002
        BNEQ    L_F58A                          ; F582   020C 0006

        XORI    #$0200, R0                      ; F584   03F8 0200
        SDBD                                    ; F586   0001
        MVII    #$A840, R2                      ; F587   02BA 0040 00A8
L_F58A:
        MVO     R0,     G_0324                  ; F58A   0240 0324
        MVO     R1,     G_032C                  ; F58C   0241 032C
        MOVR    R7,     R4                      ; F58E   00BC
        ADDI    #$01B9, R4                      ; F58F   02FC 01B9
        MVO     R2,     G_0334                  ; F591   0242 0334
        MVII    #$031D, R1                      ; F593   02B9 031D
L_F595:
        MVII    #$0010, R3                      ; F595   02BB 0010
        MOVR    R1,     R5                      ; F597   008D
        MVI     G_0324, R0                      ; F598   0280 0324
        MVO@    R0,     R5                      ; F59A   0268
        MVI     G_032C, R0                      ; F59B   0280 032C
        MVO@    R0,     R5                      ; F59D   0268
        MVI     G_0334, R0                      ; F59E   0280 0334
        ADDI    #$0002, R0                      ; F5A0   02F8 0002
        MVO     R0,     G_0334                  ; F5A2   0240 0334
        MVO@    R0,     R5                      ; F5A4   0268
        SWAP    R0,     1                       ; F5A5   0040
        MVO@    R0,     R5                      ; F5A6   0268
        INCR    R5                              ; F5A7   000D
        MVII    #$0180, R0                      ; F5A8   02B8 0180
        MVO@    R0,     R5                      ; F5AA   0268
        SDBD                                    ; F5AB   0001
        MVI@    R4,     R2                      ; F5AC   02A2

        JSR     R5,     .EXEC.9A1               ; F5AD   0004 0118 01A1

        ADDI    #$0008, R1                      ; F5B0   02F9 0008
        CMPI    #$034D, R1                      ; F5B2   0379 034D
        BLE     L_F595                          ; F5B4   0226 0020

        SDBD                                    ; F5B6   0001
        MVII    #$DDCB, R4                      ; F5B7   02BC 00CB 00DD
        CLRR    R3                              ; F5BA   01DB

        JSR     R5,     L_6DF7                  ; F5BB   0004 016C 01F7

        MVII    #$0080, R0                      ; F5BE   02B8 0080
        MVO     R0,     G_0173                  ; F5C0   0240 0173
L_F5C2:
        CMP     G_0173, R0                      ; F5C2   0340 0173
        BEQ     L_F5C2                          ; F5C4   0224 0003

        MVII    #$002F, R0                      ; F5C6   02B8 002F
        MVO     R0,     G_0173                  ; F5C8   0240 0173

        JSR     R5,     .EXEC.A61               ; F5CA   0004 0118 0261

        MOVR    R5,     R2                      ; F5CD   00AA

        JSR     R5,     L_53C0                  ; F5CE   0004 0150 03C0

        CLRR    R0                              ; F5D1   01C0
        MVO     R0,     G_01AB                  ; F5D2   0240 01AB
        MVO     R0,     G_0322                  ; F5D4   0240 0322
        MVO     R0,     G_032A                  ; F5D6   0240 032A
        J       L_584B                          ; F5D8   0004 0358 004B

        MVI     G_035D, R4                      ; F5DB   0284 035D
        CMP     G_0344, R4                      ; F5DD   0344 0344
        BNEQ    L_F5F0                          ; F5DF   020C 000F

        INCR    R1                              ; F5E1   0009
        MVI@    R1,     R0                      ; F5E2   0288
        SDBD                                    ; F5E3   0001
        SUBI    #$0013, R0                      ; F5E4   0338 0013 0000
        MVO@    R0,     R1                      ; F5E7   0248
        ADDI    #$0004, R1                      ; F5E8   02F9 0004
        MVII    #$00F0, R0                      ; F5EA   02B8 00F0
        MVO@    R0,     R1                      ; F5EC   0248
        CLRR    R0                              ; F5ED   01C0
        DECR    R1                              ; F5EE   0011
        MVO@    R0,     R1                      ; F5EF   0248
L_F5F0:
        MOVR    R5,     R7                      ; F5F0   00AF
        PSHR    R5                              ; F5F1   0275
        MVI     G_01AB, R1                      ; F5F2   0281 01AB
        INCR    R1                              ; F5F4   0009
        MVO     R1,     G_01AB                  ; F5F5   0241 01AB
        ANDI    #$0003, R1                      ; F5F7   03B9 0003
        BEQ     L_F62A                          ; F5F9   0204 002F

        MVI     G_01C2, R0                      ; F5FB   0280 01C2
        INCR    R0                              ; F5FD   0008
        MVO     R0,     G_01C2                  ; F5FE   0240 01C2
        CMPI    #$0002, R0                      ; F600   0378 0002
        BNEQ    L_F60D                          ; F602   020C 0009

        JSR     R5,     L_587C                  ; F604   0004 0158 007C

        MVII    #$0001, R0                      ; F607   02B8 0001

        JSR     R5,     X_CLR_BIT               ; F609   0004 0114 02E6

        XORR    R2,     R5                      ; F60C   01D5
L_F60D:
        PSHR    R1                              ; F60D   0271
        MVII    #$0007, R3                      ; F60E   02BB 0007
        SDBD                                    ; F610   0001
        MVII    #$0022, R2                      ; F611   02BA 0022 0000
        MVII    #$02E4, R4                      ; F614   02BC 02E4

        JSR     R5,     G_E712                  ; F616   0004 01E4 0312

        XORR    R6,     R5                      ; F619   01F5
        MVI     .STIC.X.0,R0                    ; F61A   0280 0000
        PULR    R0                              ; F61C   02B0
        MVI     G_016D, R2                      ; F61D   0282 016D
        CMPI    #$0003, R0                      ; F61F   0378 0003
        BEQ     L_F62B                          ; F621   0204 0008

        ANDI    #$00EF, R2                      ; F623   03BA 00EF
        MVO     R2,     G_016D                  ; F625   0242 016D

        JSR     R5,     L_5373                  ; F627   0004 0150 0373

L_F62A:
        PULR    R7                              ; F62A   02B7
L_F62B:
        ANDI    #$0010, R2                      ; F62B   03BA 0010
        BEQ     L_F632                          ; F62D   0204 0003

        CLRR    R2                              ; F62F   01D2
        MVO     R2,     G_01AC                  ; F630   0242 01AC
L_F632:
        SDBD                                    ; F632   0001
        MVII    #$4790, R3                      ; F633   02BB 0090 0047
        MVI@    R3,     R0                      ; F636   0298
        CMPI    #$00FA, R0                      ; F637   0378 00FA
        BEQ     L_F651                          ; F639   0204 0016

        MVI     G_0187, R0                      ; F63B   0280 0187
        CMPI    #$0089, R0                      ; F63D   0378 0089
        BNEQ    L_F651                          ; F63F   020C 0010

        SUBI    #$0005, R3                      ; F641   033B 0005
        MVI     G_0133, R0                      ; F643   0280 0133
        TSTR    R0                              ; F645   0080
        BEQ     L_F649                          ; F646   0204 0001

        INCR    R3                              ; F648   000B
L_F649:
        MVI@    R3,     R0                      ; F649   0298
        SUBI    #$0002, R0                      ; F64A   0338 0002
        BPL     L_F650                          ; F64C   0203 0002

        MVII    #$0010, R0                      ; F64E   02B8 0010
L_F650:
        MVO@    R0,     R3                      ; F650   0258
L_F651:
        MVII    #$002F, R1                      ; F651   02B9 002F
        MVO     R1,     G_0173                  ; F653   0241 0173
        MVII    #$0089, R1                      ; F655   02B9 0089
        MVII    #$000C, R0                      ; F657   02B8 000C
        MVII    #$0187, R4                      ; F659   02BC 0187

        JSR     R5,     X_FILL_MEM              ; F65B   0004 0114 0341
        JSR     R5,     .EXEC.A61               ; F65E   0004 0118 0261

        DIS                                     ; F661   0003

        JSR     R5,     L_50B3                  ; F662   0004 0150 00B3

        MVO     R1,     G_035C                  ; F665   0241 035C
        MVO     R1,     G_0146                  ; F667   0241 0146

        JSR     R5,     L_6FDE                  ; F669   0004 016C 03DE
        JSR     R5,     L_DE55                  ; F66C   0004 01DC 0255

        CLRR    R0                              ; F66F   01C0
        MVO     R0,     G_01AF                  ; F670   0240 01AF

        JSR     R5,     L_53B7                  ; F672   0004 0150 03B7

        MVI     G_0344, R0                      ; F675   0280 0344
        MVO     R0,     G_035D                  ; F677   0240 035D
        MVII    #$0014, R3                      ; F679   02BB 0014
        SDBD                                    ; F67B   0001
        MVII    #$DC35, R4                      ; F67C   02BC 0035 00DC

        JSR     R5,     L_6DF7                  ; F67F   0004 016C 01F7

        MVII    #$0080, R0                      ; F682   02B8 0080
        MVO     R0,     G_0173                  ; F684   0240 0173
L_F686:
        CMP     G_0173, R0                      ; F686   0340 0173
        BEQ     L_F686                          ; F688   0224 0003

        MVII    #$002F, R0                      ; F68A   02B8 002F
        MVO     R0,     G_0173                  ; F68C   0240 0173
        MVII    #$0032, R2                      ; F68E   02BA 0032
        MVII    #$0007, R3                      ; F690   02BB 0007
        MVII    #$021A, R4                      ; F692   02BC 021A
        MVI     G_0134, R1                      ; F694   0281 0134

        JSR     R5,     G_E712                  ; F696   0004 01E4 0312

        SUBR    R5,     R6                      ; F699   012E
        CLRR    R1                              ; F69A   01C9
        XORR    R0,     R7                      ; F69B   01C7
        DECLE   $0000                           ; F69C   0000

        MVII    #$0002, R2                      ; F69D   02BA 0002
        MVII    #$0002, R3                      ; F69F   02BB 0002
        MVII    #$0265, R4                      ; F6A1   02BC 0265
        SDBD                                    ; F6A3   0001
        MVII    #$479E, R1                      ; F6A4   02B9 009E 0047
        PSHR    R1                              ; F6A7   0271
        MVI@    R1,     R1                      ; F6A8   0289

        JSR     R5,     G_E712                  ; F6A9   0004 01E4 0312

        ADCR    R5                              ; F6AC   002D
        MOVR    R6,     R2                      ; F6AD   00B2
        SUBR    R4,     R3                      ; F6AE   0123
        ADCR    R6                              ; F6AF   002E
        INCR    R4                              ; F6B0   000C
        MOVR    R4,     R1                      ; F6B1   00A1
        ADDR    R6,     R5                      ; F6B2   00F5
        MOVR    R4,     R0                      ; F6B3   00A0
        DECLE   $0000                           ; F6B4   0000

        MVII    #$0022, R2                      ; F6B5   02BA 0022
        MVII    #$0001, R3                      ; F6B7   02BB 0001
        MVII    #$028D, R4                      ; F6B9   02BC 028D
        PULR    R1                              ; F6BB   02B1
        ADDI    #$000A, R1                      ; F6BC   02F9 000A
        MVI@    R1,     R1                      ; F6BE   0289

        JSR     R5,     G_E712                  ; F6BF   0004 01E4 0312

        XORR    R0,     R1                      ; F6C2   01C1
        MVI@    R1,     R1                      ; F6C3   0289
        XORR    R5,     R6                      ; F6C4   01EE
        ADCR    R4                              ; F6C5   002C
        INCR    R4                              ; F6C6   000C
        MOVR    R4,     R1                      ; F6C7   00A1
        ADDR    R6,     R5                      ; F6C8   00F5
        MOVR    R4,     R0                      ; F6C9   00A0
        DECLE   $0000                           ; F6CA   0000

        MVII    #$00FF, R1                      ; F6CB   02B9 00FF
        MVII    #$0019, R0                      ; F6CD   02B8 0019
        MVII    #$017A, R4                      ; F6CF   02BC 017A

        JSR     R5,     X_FILL_MEM              ; F6D1   0004 0114 0341
        JSR     R5,     .EXEC.A61               ; F6D4   0004 0118 0261

        RLC     R0,     1                       ; F6D7   0050
        MVI     G_0134, R0                      ; F6D8   0280 0134
        MVI     G_0133, R1                      ; F6DA   0281 0133
        SDBD                                    ; F6DC   0001
        MVII    #$479E, R4                      ; F6DD   02BC 009E 0047
        MVI@    R4,     R2                      ; F6E0   02A2
        ADDI    #$0009, R4                      ; F6E1   02FC 0009
        MVI@    R4,     R3                      ; F6E3   02A3
        CMPI    #$0008, R0                      ; F6E4   0378 0008
        BLE     L_F557                          ; F6E6   0226 0190

        TSTR    R1                              ; F6E8   0089
        BEQ     L_F6F0                          ; F6E9   0204 0005

        CMPR    R2,     R3                      ; F6EB   0153
        BNEQ    L_F6F3                          ; F6EC   020C 0005
        B       L_F557                          ; F6EE   0220 0198

L_F6F0:
        CMPR    R2,     R3                      ; F6F0   0153
        BLE     L_F557                          ; F6F1   0226 019B

L_F6F3:
        MVII    #$0093, R1                      ; F6F3   02B9 0093
        MVII    #$0022, R2                      ; F6F5   02BA 0022
        MVII    #$0007, R3                      ; F6F7   02BB 0007
        MVII    #$02CD, R4                      ; F6F9   02BC 02CD

        JSR     R5,     G_E712                  ; F6FB   0004 01E4 0312

        ADDR    R1,     R1                      ; F6FE   00C9
        XORR    R0,     R1                      ; F6FF   01C1
        ANDR    R0,     R0                      ; F700   0180
        MVO@    R3,     R4                      ; F701   0263
        XORR    R6,     R2                      ; F702   01F2
        MOVR    R4,     R0                      ; F703   00A0
        DECLE   $0000                           ; F704   0000
L_F705:
        JSR     R5,     .EXEC.A61               ; F705   0004 0118 0261
        DECLE   $0001                           ; F708   0001

        MVI     .PSG0.rgt_hand,R0               ; F709   0280 01FE
        XOR     .PSG0.lft_hand,R0               ; F70B   03C0 01FF
        BEQ     L_F705                          ; F70D   0224 0009
        J       X_RESET                         ; F70F   0004 0310 0000

        SWAP    R2,     1                       ; F712   0042
        XORR    R2,     R3                      ; F713   01D3
        PSHR    R2                              ; F714   0272
L_F715:
        MVI@    R5,     R0                      ; F715   02A8
        MOVR    R0,     R2                      ; F716   0082
        BEQ     L_F72E                          ; F717   0204 0015

        ANDI    #$03E0, R2                      ; F719   03BA 03E0
        SAR     R2,     2                       ; F71B   006E
        BEQ     L_F720                          ; F71C   0204 0002

        ADDI    #$0100, R2                      ; F71E   02FA 0100
L_F720:
        XORR    R3,     R2                      ; F720   01DA
        MVO@    R2,     R4                      ; F721   0262
        ANDI    #$001F, R0                      ; F722   03B8 001F
        SLL     R0,     1                       ; F724   0048
        SLL     R0,     2                       ; F725   004C
        BEQ     L_F72A                          ; F726   0204 0002

        ADDI    #$0100, R0                      ; F728   02F8 0100
L_F72A:
        XORR    R3,     R0                      ; F72A   01D8
        MVO@    R0,     R4                      ; F72B   0260
        B       L_F715                          ; F72C   0220 0018

L_F72E:
        PULR    R2                              ; F72E   02B2
        MOVR    R1,     R0                      ; F72F   0088
        PSHR    R5                              ; F730   0275
        CMPI    #$0093, R0                      ; F731   0378 0093
        BEQ     L_F747                          ; F733   0204 0012

        INCR    R4                              ; F735   000C
        PSHR    R4                              ; F736   0274
        MVII    #$0002, R1                      ; F737   02B9 0002
        SDBD                                    ; F739   0001
        MVII    #$47F0, R4                      ; F73A   02BC 00F0 0047

        JSR     R5,     X_PRNUM_RGT             ; F73D   0004 0118 00C5

        PULR    R5                              ; F740   02B5
        MVI@    R4,     R0                      ; F741   02A0
        XORR    R2,     R0                      ; F742   01D0
        MVO@    R0,     R5                      ; F743   0268
        MVI@    R4,     R0                      ; F744   02A0
        XORR    R2,     R0                      ; F745   01D0
        MVO@    R0,     R5                      ; F746   0268
L_F747:
        PULR    R7                              ; F747   02B7
        DECLE   $0035                           ; F748   0035

        DIS                                     ; F749   0003
        SWAP    R3,     1                       ; F74A   0043
        DECLE   $0000                           ; F74B   0000

        SLL     R3,     1                       ; F74C   004B
        DECLE   $0000                           ; F74D   0000

        SLLC    R0,     2                       ; F74E   005C
        RSWD    R0                              ; F74F   0038
        SWAP    R1,     2                       ; F750   0045
        ADCR    R7                              ; F751   002F
        SWAP    R0,     1                       ; F752   0040
        INCR    R4                              ; F753   000C
        SWAP    R3,     1                       ; F754   0043
        RLC     R2,     2                       ; F755   0056
        PSHR    R5                              ; F756   0275
        MVI     G_0135, R1                      ; F757   0281 0135
        TSTR    R1                              ; F759   0089
        BEQ     L_F788                          ; F75A   0204 002C

        MVI     G_0138, R5                      ; F75C   0285 0138
        CMPI    #$0006, R5                      ; F75E   037D 0006
        BGE     L_F789                          ; F760   020D 0027

        MVI     G_0136, R0                      ; F762   0280 0136
        CMPR    R0,     R1                      ; F764   0141
        BEQ     L_F781                          ; F765   0204 001A
        BGT     L_F76B                          ; F767   020E 0002

        DECR    R0                              ; F769   0010
        INCR    R7                              ; F76A   000F
L_F76B:
        INCR    R0                              ; F76B   0008
        MVO     R0,     G_0136                  ; F76C   0240 0136
        SLR     R0,     2                       ; F76E   0064
        SLR     R0,     2                       ; F76F   0064
        MVII    #$00FB, R5                      ; F770   02BD 00FB
        MVO@    R0,     R5                      ; F772   0268
        MVO@    R0,     R5                      ; F773   0268
        MVO@    R0,     R5                      ; F774   0268

        JSR     R5,     X_CLAMP                 ; F775   0004 0114 0270

        INCR    R1                              ; F778   0009
        INCR    R7                              ; F779   000F
        SUBI    #$0009, R0                      ; F77A   0338 0009
        MVII    #$001F, R1                      ; F77C   02B9 001F
        SUBR    R0,     R1                      ; F77E   0101
        MVO     R1,     .PSG1.noise             ; F77F   0241 00F9
L_F781:
        MVI     G_0137, R0                      ; F781   0280 0137
        DECR    R0                              ; F783   0010
        BEQ     L_F789                          ; F784   0204 0003

        MVO     R0,     G_0137                  ; F786   0240 0137
L_F788:
        PULR    R7                              ; F788   02B7
L_F789:
        MVI     G_0138, R1                      ; F789   0281 0138
        INCR    R1                              ; F78B   0009
        ADDR    R7,     R1                      ; F78C   00F9
        ADD@    R1,     R7                      ; F78D   02CF
        INCR    R0                              ; F78E   0008
        ADCR    R5                              ; F78F   002D
        SLL     R0,     1                       ; F790   0048
        SLLC    R1,     2                       ; F791   005D
        SARC    R3,     1                       ; F792   007B
        SARC    R3,     1                       ; F793   007B
        MOVR    R7,     R6                      ; F794   00BE
        ADDR    R2,     R5                      ; F795   00D5
L_F796:
        MVI     G_035E, R0                      ; F796   0280 035E
        ANDI    #$0001, R0                      ; F798   03B8 0001
        MVII    #$00C8, R5                      ; F79A   02BD 00C8
        CMP     G_0135, R5                      ; F79C   0345 0135
        BLE     L_F7A9                          ; F79E   0206 0009

        MVO     R0,     G_0138                  ; F7A0   0240 0138

        JSR     R5,     G_E841                  ; F7A2   0004 01E8 0041
        JSRD    R4,     G_9600                  ; F7A5   0004 0096 0200

        INCR    R1                              ; F7A8   0009
L_F7A9:
        SLL     R0,     1                       ; F7A9   0048
        INCR    R0                              ; F7AA   0008
        MVO     R0,     G_0138                  ; F7AB   0240 0138

        JSR     R5,     G_E841                  ; F7AD   0004 01E8 0041

        DIS                                     ; F7B0   0003
        INCR    R7                              ; F7B1   000F
L_F7B2:
        MVI     G_035E, R0                      ; F7B2   0280 035E
        SLR     R0,     2                       ; F7B4   0064
        ANDI    #$0003, R0                      ; F7B5   03B8 0003
        INCR    R0                              ; F7B7   0008
        MVO     R0,     G_0139                  ; F7B8   0240 0139
        PULR    R7                              ; F7BA   02B7
        MVII    #$001C, R0                      ; F7BB   02B8 001C
        MVO     R0,     .PSG1.chan_enable       ; F7BD   0240 00F8
        MVII    #$0003, R0                      ; F7BF   02B8 0003
        MVII    #$0200, R1                      ; F7C1   02B9 0200

        JSR     R5,     G_7553                  ; F7C3   0004 0174 0153

        INCR    R0                              ; F7C6   0008
        MVII    #$023A, R1                      ; F7C7   02B9 023A

        JSR     R5,     G_7553                  ; F7C9   0004 0174 0153
        JSR     R5,     G_E841                  ; F7CC   0004 01E8 0041

        DIS                                     ; F7CF   0003
        INCR    R4                              ; F7D0   000C
        MVII    #$0002, R0                      ; F7D1   02B8 0002
        MVO     R0,     G_0138                  ; F7D3   0240 0138
        PULR    R7                              ; F7D5   02B7
        MVII    #$001F, R0                      ; F7D6   02B8 001F
        MVO     R0,     .PSG1.chan_enable       ; F7D8   0240 00F8

        JSR     R5,     G_E841                  ; F7DA   0004 01E8 0041

        EIS                                     ; F7DD   0002
        INCR    R2                              ; F7DE   000A
        MVI     G_0139, R0                      ; F7DF   0280 0139
        DECR    R0                              ; F7E1   0010
        MVO     R0,     G_0139                  ; F7E2   0240 0139
        BEQ     L_F7E8                          ; F7E4   0204 0002

        MVII    #$0001, R0                      ; F7E6   02B8 0001
L_F7E8:
        MVO     R0,     G_0138                  ; F7E8   0240 0138
        PULR    R7                              ; F7EA   02B7
        CLRR    R0                              ; F7EB   01C0
        MVO     R0,     .PSG1.chn_a_hi          ; F7EC   0240 00F4
        MVII    #$001E, R0                      ; F7EE   02B8 001E
        MVO     R0,     .PSG1.chan_enable       ; F7F0   0240 00F8
        MVII    #$0004, R0                      ; F7F2   02B8 0004
        MVO     R0,     G_0138                  ; F7F4   0240 0138
        MVII    #$0019, R0                      ; F7F6   02B8 0019
        MVO     R0,     G_0139                  ; F7F8   0240 0139
        MVI     G_035E, R0                      ; F7FA   0280 035E
        MOVR    R0,     R1                      ; F7FC   0081
        ADDI    #$0002, R1                      ; F7FD   02F9 0002
        ANDI    #$000E, R1                      ; F7FF   03B9 000E
        MVO     R1,     G_013A                  ; F801   0241 013A
        ANDI    #$001F, R0                      ; F803   03B8 001F
        ADDI    #$0058, R0                      ; F805   02F8 0058
        B       L_F815                          ; F807   0200 000C

        MVI     .PSG1.chn_a_lo,R0               ; F809   0280 00F0
        SUBI    #$0003, R0                      ; F80B   0338 0003
        MVI     G_0138, R1                      ; F80D   0281 0138
        CMPI    #$0004, R1                      ; F80F   0379 0004
        BEQ     L_F815                          ; F811   0204 0002

        ADDI    #$0006, R0                      ; F813   02F8 0006
L_F815:
        MVO     R0,     .PSG1.chn_a_lo          ; F815   0240 00F0
        MVI     G_0139, R0                      ; F817   0280 0139
        DECR    R0                              ; F819   0010
        MVO     R0,     G_0139                  ; F81A   0240 0139
        BNEQ    L_F82F                          ; F81C   020C 0011

        MVI     G_013A, R0                      ; F81E   0280 013A
        DECR    R0                              ; F820   0010
        MVO     R0,     G_013A                  ; F821   0240 013A
        BEQ     L_F834                          ; F823   0204 000F
        BMI     L_F838                          ; F825   020B 0011

        XORI    #$0001, R1                      ; F827   03F9 0001
        MVO     R1,     G_0138                  ; F829   0241 0138
        MVII    #$0008, R0                      ; F82B   02B8 0008
L_F82D:
        MVO     R0,     G_0139                  ; F82D   0240 0139
L_F82F:
        MVII    #$0001, R0                      ; F82F   02B8 0001
        MVO     R0,     G_0137                  ; F831   0240 0137
        PULR    R7                              ; F833   02B7
L_F834:
        MVII    #$0012, R0                      ; F834   02B8 0012
        B       L_F82D                          ; F836   0220 000A

L_F838:
        MVII    #$001F, R0                      ; F838   02B8 001F
        MVO     R0,     .PSG1.chan_enable       ; F83A   0240 00F8
        CLRR    R0                              ; F83C   01C0
        MVO     R0,     G_0138                  ; F83D   0240 0138
        B       L_F82F                          ; F83F   0220 0011

        MVI@    R5,     R0                      ; F841   02A8
        PSHR    R5                              ; F842   0275

        JSR     R5,     X_RAND1                 ; F843   0004 0114 027D

        SLL     R0,     2                       ; F846   004C
        PULR    R5                              ; F847   02B5
        ADD@    R5,     R0                      ; F848   02E8
        MVO     R0,     G_0137                  ; F849   0240 0137
        MOVR    R5,     R7                      ; F84B   00AF
        MVI     G_0136, R0                      ; F84C   0280 0136
        ADDI    #$0003, R0                      ; F84E   02F8 0003
        CMPI    #$00FE, R0                      ; F850   0378 00FE
        BGE     L_F85F                          ; F852   020D 000B

L_F854:
        MVO     R0,     G_0136                  ; F854   0240 0136
        SLR     R0,     2                       ; F856   0064
        SLR     R0,     2                       ; F857   0064
        MVO     R0,     .PSG1.chn_c_vol         ; F858   0240 00FD
        MVII    #$001F, R0                      ; F85A   02B8 001F
        MVO     R0,     .PSG1.chan_enable       ; F85C   0240 00F8
        PULR    R7                              ; F85E   02B7
L_F85F:
        MVII    #$0007, R0                      ; F85F   02B8 0007
        MVO     R0,     G_0138                  ; F861   0240 0138
        MVI     G_0136, R0                      ; F863   0280 0136
        SUBI    #$0003, R0                      ; F865   0338 0003
        CMPI    #$008C, R0                      ; F867   0378 008C
        BLE     L_F796                          ; F869   0226 00D4
        B       L_F854                          ; F86B   0220 0018

        PSHR    R5                              ; F86D   0275
        MVII    #$00F0, R4                      ; F86E   02BC 00F0
        MVII    #$000E, R0                      ; F870   02B8 000E

        JSR     R5,     X_FILL_ZERO             ; F872   0004 0114 0338

        MVII    #$0135, R4                      ; F875   02BC 0135
        MVII    #$0078, R1                      ; F877   02B9 0078
        MVO@    R1,     R4                      ; F879   0261
        MVII    #$0005, R0                      ; F87A   02B8 0005

        JSR     R5,     X_FILL_ZERO             ; F87C   0004 0114 0338

        MVII    #$0019, R0                      ; F87F   02B8 0019
        MVO     R0,     .PSG1.noise             ; F881   0240 00F9
        MVII    #$001F, R0                      ; F883   02B8 001F
        MVO     R0,     .PSG1.chan_enable       ; F885   0240 00F8
        PULR    R7                              ; F887   02B7
        PSHR    R5                              ; F888   0275
        MVI     G_035D, R1                      ; F889   0281 035D
        CMP     G_0344, R1                      ; F88B   0341 0344
        BEQ     L_FAFC                          ; F88D   0204 026D

        CMP     G_0349, R1                      ; F88F   0341 0349
        BEQ     L_F897                          ; F891   0204 0004
        BLT     L_FAA5                          ; F893   0205 0210
        B       L_F997                          ; F895   0200 0100

L_F897:
        MVI     G_0323, R4                      ; F897   0284 0323
        TSTR    R4                              ; F899   00A4
        BNEQ    L_F9FD                          ; F89A   020C 0161

        SDBD                                    ; F89C   0001
        MVII    #$416A, R4                      ; F89D   02BC 006A 0041
        SDBD                                    ; F8A0   0001
        MVI@    R4,     R0                      ; F8A1   02A0
        SDBD                                    ; F8A2   0001
        MVI@    R4,     R5                      ; F8A3   02A5
        ADDI    #$0003, R4                      ; F8A4   02FC 0003
        MVI@    R4,     R2                      ; F8A6   02A2
        CMPI    #$0024, R2                      ; F8A7   037A 0024
        BGT     L_F9FD                          ; F8A9   020E 0152

        MVI     G_0354, R4                      ; F8AB   0284 0354
        DECR    R4                              ; F8AD   0014
L_F8AE:
        SDBD                                    ; F8AE   0001
        MVI@    R4,     R3                      ; F8AF   02A3
        SUBR    R0,     R3                      ; F8B0   0103
        GSWD    R1                              ; F8B1   0031
        BPL     L_F8B5                          ; F8B2   0203 0001

        NEGR    R3                              ; F8B4   0023
L_F8B5:
        CMPI    #$0200, R3                      ; F8B5   037B 0200
        BGT     L_F98F                          ; F8B7   020E 00D6

        SDBD                                    ; F8B9   0001
        MVI@    R4,     R3                      ; F8BA   02A3
        DECR    R4                              ; F8BB   0014
        DECR    R4                              ; F8BC   0014
        SUBR    R5,     R3                      ; F8BD   012B
        BPL     L_F8C1                          ; F8BE   0203 0001

        NEGR    R3                              ; F8C0   0023
L_F8C1:
        CMPI    #$0200, R3                      ; F8C1   037B 0200
        BGT     L_F98F                          ; F8C3   020E 00CA

        SUB     G_0351, R4                      ; F8C5   0304 0351
        MOVR    R4,     R3                      ; F8C7   00A3
        SAR     R3,     2                       ; F8C8   006F
        SAR     R3,     1                       ; F8C9   006B
        CMPI    #$0009, R3                      ; F8CA   037B 0009
        BGE     L_F98E                          ; F8CC   020D 00C0

        MVII    #$017A, R4                      ; F8CE   02BC 017A
        MOVR    R1,     R5                      ; F8D0   008D
        MVO     R3,     G_01B3                  ; F8D1   0243 01B3
L_F8D3:
        MVI@    R4,     R0                      ; F8D3   02A0
        MOVR    R0,     R1                      ; F8D4   0081
        ANDI    #$000F, R0                      ; F8D5   03B8 000F
        CMPR    R3,     R0                      ; F8D7   0158
        BEQ     L_F8E1                          ; F8D8   0204 0007

        CMPI    #$0180, R4                      ; F8DA   037C 0180
        BLT     L_F8D3                          ; F8DC   0225 000A

        XORI    #$00F0, R3                      ; F8DE   03FB 00F0
        MOVR    R3,     R1                      ; F8E0   0099
L_F8E1:
        MVO     R1,     G_0181                  ; F8E1   0241 0181
        CLRR    R0                              ; F8E3   01C0
        MVO     R0,     G_01B2                  ; F8E4   0240 01B2
        MVO     R0,     G_031D                  ; F8E6   0240 031D
        MVO     R0,     G_0325                  ; F8E8   0240 0325
        DECR    R0                              ; F8EA   0010
        MVO     R0,     G_01C3                  ; F8EB   0240 01C3
        MVO     R0,     G_0180                  ; F8ED   0240 0180
        MVII    #$0002, R0                      ; F8EF   02B8 0002
        MVO     R0,     G_012F                  ; F8F1   0240 012F
        SDBD                                    ; F8F3   0001
        MVII    #$5058, R0                      ; F8F4   02B8 0058 0050
        MVO     R0,     G_035D                  ; F8F7   0240 035D
        MVI     G_035C, R0                      ; F8F9   0280 035C
        ANDI    #$001E, R0                      ; F8FB   03B8 001E
        MVO     R0,     G_035C                  ; F8FD   0240 035C
        CMPI    #$00F0, R1                      ; F8FF   0379 00F0
        BLT     L_F90B                          ; F901   0205 0008

        JSR     R5,     L_6B89                  ; F903   0004 0168 0389
        JSR     R5,     L_6C82                  ; F906   0004 016C 0082

        MVI     G_0181, R1                      ; F909   0281 0181
L_F90B:
        ANDI    #$00F0, R1                      ; F90B   03B9 00F0
        CMPI    #$00E0, R1                      ; F90D   0379 00E0
        BGE     L_F93B                          ; F90F   020D 002A

        SAR     R1,     1                       ; F911   0069
        ADDI    #$032D, R1                      ; F912   02F9 032D
        MVI@    R1,     R0                      ; F914   0288
        SDBD                                    ; F915   0001
        ANDI    #$FDFF, R0                      ; F916   03B8 00FF 00FD
        RSWD    R5                              ; F919   003D
        BLE     L_F91E                          ; F91A   0206 0002

        XORI    #$0200, R0                      ; F91C   03F8 0200
L_F91E:
        MVI     G_01C4, R5                      ; F91E   0285 01C4
        TSTR    R5                              ; F920   00AD
        BNEQ    L_F925                          ; F921   020C 0002

        XORI    #$0200, R0                      ; F923   03F8 0200
L_F925:
        MVO@    R0,     R1                      ; F925   0248
        INCR    R1                              ; F926   0009
        SDBD                                    ; F927   0001
        MVII    #$60C6, R0                      ; F928   02B8 00C6 0060
        MVO@    R0,     R1                      ; F92B   0248
        ADDI    #$0004, R1                      ; F92C   02F9 0004
        SAR     R2,     2                       ; F92E   006E
        SAR     R2,     1                       ; F92F   006A
        CMPI    #$0005, R2                      ; F930   037A 0005
        BLT     L_F936                          ; F932   0205 0002

        MVII    #$0004, R2                      ; F934   02BA 0004
L_F936:
        MVO@    R2,     R1                      ; F936   024A
        MVII    #$0005, R2                      ; F937   02BA 0005
        INCR    R1                              ; F939   0009
        MVO@    R2,     R1                      ; F93A   024A

L_F93B:
        JSR     R5,     L_6E43                  ; F93B   0004 016C 0243

        MVII    #$00B4, R0                      ; F93E   02B8 00B4
        MVO     R0,     G_0135                  ; F940   0240 0135
        MVI     G_01B0, R0                      ; F942   0280 01B0
        CMPI    #$0003, R0                      ; F944   0378 0003
        BLT     L_FAA5                          ; F946   0205 015D

        MVII    #$0001, R0                      ; F948   02B8 0001
        MVO     R0,     G_01B0                  ; F94A   0240 01B0
        MVII    #$0020, R2                      ; F94C   02BA 0020

        JSR     R5,     G_E96A                  ; F94E   0004 01E8 016A

        MVI     G_01AB, R0                      ; F951   0280 01AB
        ANDI    #$0003, R0                      ; F953   03B8 0003
        MVO     R0,     G_01AB                  ; F955   0240 01AB
        CLRR    R4                              ; F957   01E4
        MVO     R4,     G_01B9                  ; F958   0244 01B9
        MVII    #$0187, R2                      ; F95A   02BA 0187
L_F95C:
        MVO     R4,     G_01DF                  ; F95C   0244 01DF

        JSR     R5,     L_587C                  ; F95E   0004 0158 007C

        MVII    #$0006, R0                      ; F961   02B8 0006

        JSR     R5,     X_CLR_BIT               ; F963   0004 0114 02E6

        XORR    R2,     R4                      ; F966   01D4
        J       L_65A7                          ; F967   0004 0364 01A7

        PSHR    R5                              ; F96A   0275
        SDBD                                    ; F96B   0001
        MVII    #$5A7E, R4                      ; F96C   02BC 007E 005A
        MVII    #$018A, R5                      ; F96F   02BD 018A
L_F971:
        MVI@    R5,     R1                      ; F971   02A9
        CMPI    #$0040, R1                      ; F972   0379 0040
        BGE     L_F983                          ; F974   020D 000D

        DECR    R5                              ; F976   0015
        ANDI    #$000F, R1                      ; F977   03B9 000F
        MVII    #$0020, R2                      ; F979   02BA 0020
        XORR    R1,     R2                      ; F97B   01CA
        MVO@    R2,     R5                      ; F97C   026A
        MOVR    R5,     R0                      ; F97D   00A8

        JSR     R5,     L_59E6                  ; F97E   0004 0158 01E6

        B       L_F986                          ; F981   0200 0003

L_F983:
        ADDI    #$0002, R4                      ; F983   02FC 0002
        INCR    R5                              ; F985   000D
L_F986:
        INCR    R5                              ; F986   000D
        CMPI    #$0193, R5                      ; F987   037D 0193
        BLT     L_F971                          ; F989   0225 0019

        CLRR    R0                              ; F98B   01C0
        MVO     R0,     G_01B9                  ; F98C   0240 01B9
L_F98E:
        PULR    R7                              ; F98E   02B7
L_F98F:
        ADDI    #$0006, R4                      ; F98F   02FC 0006
        SDBD                                    ; F991   0001
        CMPI    #$4148, R4                      ; F992   037C 0048 0041
        BLT     L_F8AE                          ; F995   0225 00E8

L_F997:
        MVI     G_0181, R1                      ; F997   0281 0181
        ANDI    #$000F, R1                      ; F999   03B9 000F
        CMPI    #$0008, R1                      ; F99B   0379 0008
        BGT     L_F9FD                          ; F99D   020E 005E

        MVII    #$0003, R0                      ; F99F   02B8 0003

L_F9A1:
        JSR     R5,     L_64B9                  ; F9A1   0004 0164 00B9

        BEQ     L_F9AB                          ; F9A4   0204 0005

        DECR    R0                              ; F9A6   0010
        BPL     L_F9A1                          ; F9A7   0223 0007
        B       L_F9FD                          ; F9A9   0200 0052

L_F9AB:
        MVII    #$0001, R3                      ; F9AB   02BB 0001
        MOVR    R0,     R2                      ; F9AD   0082
        SLL     R2,     1                       ; F9AE   004A
        ADDR    R0,     R2                      ; F9AF   00C2
        ADDI    #$0187, R2                      ; F9B0   02FA 0187
L_F9B2:
        MVI@    R2,     R1                      ; F9B2   0291
        CMPI    #$0040, R1                      ; F9B3   0379 0040
        BLT     L_F9C3                          ; F9B5   0205 000C

L_F9B7:
        ADDI    #$0003, R2                      ; F9B7   02FA 0003
        INCR    R0                              ; F9B9   0008
        CMPI    #$0193, R2                      ; F9BA   037A 0193
        BGE     L_F9FD                          ; F9BC   020D 003F

        DECR    R3                              ; F9BE   0013
        BEQ     L_F9B2                          ; F9BF   0224 000E
        B       L_F9FD                          ; F9C1   0200 003A

L_F9C3:
        ANDI    #$000F, R1                      ; F9C3   03B9 000F

L_F9C5:
        JSR     R5,     L_64B9                  ; F9C5   0004 0164 00B9

        BEQ     L_F9B7                          ; F9C8   0224 0012

        MVI@    R2,     R1                      ; F9CA   0291
        ANDI    #$0020, R1                      ; F9CB   03B9 0020
        BNEQ    L_F9F3                          ; F9CD   020C 0024

        MVI@    R2,     R1                      ; F9CF   0291
        ANDI    #$0010, R1                      ; F9D0   03B9 0010
        BNEQ    L_F9B7                          ; F9D2   022C 001C

        TSTR    R3                              ; F9D4   009B
        BEQ     L_F9FD                          ; F9D5   0204 0026

        MOVR    R2,     R4                      ; F9D7   0094
L_F9D8:
        SUBI    #$0003, R4                      ; F9D8   033C 0003
        CMPI    #$0187, R4                      ; F9DA   037C 0187
        BLT     L_F9E6                          ; F9DC   0205 0008

        MVI@    R4,     R5                      ; F9DE   02A5
        DECR    R4                              ; F9DF   0014
        CMPI    #$0020, R5                      ; F9E0   037D 0020
        BGE     L_F9B7                          ; F9E2   022D 002C
        B       L_F9D8                          ; F9E4   0220 000D

L_F9E6:
        MVII    #$0001, R4                      ; F9E6   02BC 0001
        TSTR    R0                              ; F9E8   0080
        BNEQ    L_F95C                          ; F9E9   022C 008E

        MVII    #$0004, R0                      ; F9EB   02B8 0004

        JSR     R5,     X_CLR_BIT               ; F9ED   0004 0114 02E6

        CMPR    R5,     R5                      ; F9F0   016D
        B       L_F95C                          ; F9F1   0220 0096

L_F9F3:
        TSTR    R3                              ; F9F3   009B
        BNEQ    L_F9B7                          ; F9F4   022C 003E

        MVII    #$0001, R4                      ; F9F6   02BC 0001
        MVI     G_01C3, R5                      ; F9F8   0285 01C3
        TSTR    R5                              ; F9FA   00AD
        BNEQ    L_F95C                          ; F9FB   022C 00A0

L_F9FD:
        MVI     G_0180, R0                      ; F9FD   0280 0180
        CMPI    #$001D, R0                      ; F9FF   0378 001D
        BNEQ    L_FA06                          ; FA01   020C 0003

        JSR     R5,     G_EA09                  ; FA03   0004 01E8 0209

L_FA06:
        MVI     G_01B3, R0                      ; FA06   0280 01B3
        INCR    R7                              ; FA08   000F
        PSHR    R5                              ; FA09   0275
        ANDI    #$000F, R0                      ; FA0A   03B8 000F
        CMPI    #$000D, R0                      ; FA0C   0378 000D
        BGT     L_FAA5                          ; FA0E   020E 0095

        JSR     R5,     L_6D40                  ; FA10   0004 016C 0140

        BEQ     L_FAA5                          ; FA13   0204 0090

        SLL     R0,     2                       ; FA15   004C
        SLL     R0,     1                       ; FA16   0048
        ADD     G_0354, R0                      ; FA17   02C0 0354
        PSHR    R0                              ; FA19   0270
        ADDI    #$0002, R0                      ; FA1A   02F8 0002
        MOVR    R0,     R3                      ; FA1C   0083
        MVI@    R3,     R1                      ; FA1D   0299
        CMPI    #$0003, R1                      ; FA1E   0379 0003
L_FA20:
        BLE     L_FA26                          ; FA20   0206 0004

        CMPI    #$00C8, R1                      ; FA22   0379 00C8
        BLT     L_FA34                          ; FA24   0205 000E

L_FA26:
        PULR    R3                              ; FA26   02B3
        MVI@    R3,     R1                      ; FA27   0299
        SUBI    #$0002, R3                      ; FA28   033B 0002
        MVII    #$000C, R0                      ; FA2A   02B8 000C
        MVO@    R0,     R3                      ; FA2C   0258
        DECR    R3                              ; FA2D   0013
        SUBI    #$0049, R1                      ; FA2E   0339 0049
        NEGR    R1                              ; FA30   0021
        MVO@    R1,     R3                      ; FA31   0259
        B       L_FA59                          ; FA32   0200 0025

L_FA34:
        MOVR    R1,     R0                      ; FA34   0088
        PULR    R3                              ; FA35   02B3
        MVI@    R3,     R1                      ; FA36   0299
        SUBI    #$0049, R1                      ; FA37   0339 0049
L_FA39:
        GSWD    R2                              ; FA39   0032
        BPL     L_FA3D                          ; FA3A   0203 0001

        NEGR    R1                              ; FA3C   0021
L_FA3D:
        CMPI    #$0012, R0                      ; FA3D   0378 0012
        BGT     L_FA43                          ; FA3F   020E 0002

        ADDI    #$0007, R1                      ; FA41   02F9 0007
L_FA43:
        SUBI    #$0005, R1                      ; FA43   0339 0005
        CMPR    R0,     R1                      ; FA45   0141
        BLT     L_FA64                          ; FA46   0205 001C

        SUBI    #$0002, R3                      ; FA48   033B 0002
        MVI@    R3,     R0                      ; FA4A   0298

        JSR     R5,     X_EXT_SIGN_LO           ; FA4B   0004 0114 0268

        SAR     R0,     2                       ; FA4E   006C
        SAR     R0,     2                       ; FA4F   006C
        MVII    #$000F, R4                      ; FA50   02BC 000F
        RSWD    R2                              ; FA52   003A
        BMI     L_FA56                          ; FA53   020B 0001

        NEGR    R4                              ; FA55   0024
L_FA56:
        MVO@    R0,     R3                      ; FA56   0258
        DECR    R3                              ; FA57   0013
        MVO@    R4,     R3                      ; FA58   025C
L_FA59:
        SDBD                                    ; FA59   0001
        CMPI    #$4168, R3                      ; FA5A   037B 0068 0041
        BLT     L_FA96                          ; FA5D   0205 0037

        JSR     R5,     L_57F2                  ; FA5F   0004 0154 03F2

        B       L_FA96                          ; FA62   0200 0032

L_FA64:
        MVI@    R3,     R0                      ; FA64   0298
        INCR    R3                              ; FA65   000B
        INCR    R3                              ; FA66   000B
        MVI@    R3,     R1                      ; FA67   0299
        MVII    #$0049, R2                      ; FA68   02BA 0049
        PSHR    R3                              ; FA6A   0273
        MVII    #$000F, R3                      ; FA6B   02BB 000F

        JSR     R5,     G_E055                  ; FA6D   0004 01E0 0055

        PULR    R4                              ; FA70   02B4
        CMPI    #$0063, R2                      ; FA71   037A 0063
        BLT     L_FAA5                          ; FA73   0205 0030

        MOVR    R4,     R3                      ; FA75   00A3
        SDBD                                    ; FA76   0001
        CMPI    #$4168, R4                      ; FA77   037C 0068 0041
        BLT     L_FA83                          ; FA7A   0205 0007

        ADDI    #$0004, R4                      ; FA7C   02FC 0004
        MVI@    R4,     R1                      ; FA7E   02A1
        CMPI    #$0024, R1                      ; FA7F   0379 0024
        BGT     L_FAA6                          ; FA81   020E 0023

L_FA83:
        SUBI    #$0004, R3                      ; FA83   033B 0004
        MVI@    R3,     R0                      ; FA85   0298

        JSR     R5,     X_EXT_SIGN_LO           ; FA86   0004 0114 0268

        NEGR    R0                              ; FA89   0020
        BPL     L_FA9F                          ; FA8A   0203 0013

        SAR     R0,     2                       ; FA8C   006C
        MVO@    R0,     R3                      ; FA8D   0258
        DECR    R3                              ; FA8E   0013
        MVI@    R3,     R0                      ; FA8F   0298

        JSR     R5,     X_EXT_SIGN_LO           ; FA90   0004 0114 0268

        NEGR    R0                              ; FA93   0020
        SAR     R0,     2                       ; FA94   006C
        MVO@    R0,     R3                      ; FA95   0258

L_FA96:
        JSR     R5,     L_6EB0                  ; FA96   0004 016C 02B0

        MVII    #$0004, R0                      ; FA99   02B8 0004
        MVO     R0,     G_0197                  ; FA9B   0240 0197
        MVO     R0,     G_0323                  ; FA9D   0240 0323
L_FA9F:
        MVII    #$0006, R0                      ; FA9F   02B8 0006

        JSR     R5,     X_SET_BIT               ; FAA1   0004 0114 02DB

        CMPR    R5,     R5                      ; FAA4   016D
L_FAA5:
        PULR    R7                              ; FAA5   02B7
L_FAA6:
        CLRR    R0                              ; FAA6   01C0
        MVO     R0,     G_0325                  ; FAA7   0240 0325
        MVO     R0,     G_031D                  ; FAA9   0240 031D
        MVII    #$00FF, R0                      ; FAAB   02B8 00FF
        MVO     R0,     G_0180                  ; FAAD   0240 0180
        MVII    #$0009, R0                      ; FAAF   02B8 0009
        MVO     R0,     G_01B8                  ; FAB1   0240 01B8
        MVO     R0,     G_0181                  ; FAB3   0240 0181
        MVII    #$0093, R1                      ; FAB5   02B9 0093
        MVII    #$0032, R2                      ; FAB7   02BA 0032
        MVII    #$0007, R3                      ; FAB9   02BB 0007
        MVII    #$0202, R4                      ; FABB   02BC 0202

        JSR     R5,     G_E712                  ; FABD   0004 01E4 0312

        XORR    R6,     R5                      ; FAC0   01F5
        MVI     G_01E6, R0                      ; FAC1   0280 01E6
        DECR    R4                              ; FAC3   0014
        SUBR    R0,     R5                      ; FAC4   0105
        DECR    R0                              ; FAC5   0010
L_FAC6:
        GSWD    R2                              ; FAC6   0032
        CMPR    R4,     R0                      ; FAC7   0160
        DECLE   $0000                           ; FAC8   0000

        MVII    #$00C8, R0                      ; FAC9   02B8 00C8
        MVO     R0,     G_0135                  ; FACB   0240 0135
        CLRR    R0                              ; FACD   01C0
        MVO     R0,     G_031D                  ; FACE   0240 031D
        MVO     R0,     G_0325                  ; FAD0   0240 0325
L_FAD2:
        MVII    #$0005, R0                      ; FAD2   02B8 0005

        JSR     R5,     X_CLR_BIT               ; FAD4   0004 0114 02E6

        XORR    R2,     R4                      ; FAD7   01D4
        MVI     G_0344, R0                      ; FAD8   0280 0344
        MVO     R0,     G_035D                  ; FADA   0240 035D
        MVO     R0,     G_0188                  ; FADC   0240 0188
        B       L_FAFC                          ; FADE   0200 001C

        INCR    R1                              ; FAE0   0009
        MVI@    R1,     R2                      ; FAE1   028A
        SDBD                                    ; FAE2   0001
        CMPI    #$606D, R2                      ; FAE3   037A 006D 0060
        BNEQ    L_FAED                          ; FAE6   020C 0005

        MVI     G_034C, R0                      ; FAE8   0280 034C
        MVO     R0,     G_035D                  ; FAEA   0240 035D
        MOVR    R5,     R7                      ; FAEC   00AF
L_FAED:
        SDBD                                    ; FAED   0001
        SUBI    #$0059, R2                      ; FAEE   033A 0059 0000
        MVO@    R2,     R1                      ; FAF1   024A
        ADDI    #$0004, R1                      ; FAF2   02F9 0004
        MVII    #$0100, R0                      ; FAF4   02B8 0100
        MVO@    R0,     R1                      ; FAF6   0248
        INCR    R1                              ; FAF7   0009
        MVII    #$0001, R0                      ; FAF8   02B8 0001
        MVO@    R0,     R1                      ; FAFA   0248
        MOVR    R5,     R7                      ; FAFB   00AF
L_FAFC:
        CLRR    R0                              ; FAFC   01C0
        MVII    #$0187, R5                      ; FAFD   02BD 0187
L_FAFF:
        MVI@    R5,     R1                      ; FAFF   02A9
        MVI@    R5,     R2                      ; FB00   02AA
        CMPI    #$0040, R1                      ; FB01   0379 0040
        BGE     L_FB18                          ; FB03   020D 0013

        MOVR    R2,     R0                      ; FB05   0090
        BNEQ    L_FB18                          ; FB06   020C 0010

        DECR    R5                              ; FB08   0015
        MOVR    R1,     R4                      ; FB09   008C
        ANDI    #$000F, R4                      ; FB0A   03BC 000F
        SUBI    #$0009, R4                      ; FB0C   033C 0009
        ADDR    R4,     R4                      ; FB0E   00E4
        SDBD                                    ; FB0F   0001
        ADDI    #$5A7E, R4                      ; FB10   02FC 007E 005A
        MOVR    R5,     R0                      ; FB13   00A8

        JSR     R5,     L_59E6                  ; FB14   0004 0158 01E6

        MOVR    R7,     R0                      ; FB17   00B8
L_FB18:
        INCR    R5                              ; FB18   000D
        CMPI    #$0193, R5                      ; FB19   037D 0193
        BLT     L_FAFF                          ; FB1B   0225 001D

        TSTR    R0                              ; FB1D   0080
        BNEQ    L_FAA5                          ; FB1E   022C 007A
        J       L_584B                          ; FB20   0004 0358 004B

        PSHR    R5                              ; FB23   0275
        MVI     G_016D, R3                      ; FB24   0283 016D
        ANDI    #$0003, R3                      ; FB26   03BB 0003
        BEQ     L_FB8E                          ; FB28   0204 0064

        MVI     G_035D, R0                      ; FB2A   0280 035D
        CMP     G_0344, R0                      ; FB2C   0340 0344
        BEQ     L_FB8E                          ; FB2E   0204 005E

        MVI     G_0133, R1                      ; FB30   0281 0133
        SUB     G_0341, R0                      ; FB32   0300 0341
        BNEQ    L_FB5E                          ; FB34   020C 0028

        CMP     G_0170, R0                      ; FB36   0340 0170
        BNEQ    L_FB8F                          ; FB38   020C 0055

        MVI     G_0359, R0                      ; FB3A   0280 0359
        CMPI    #$0032, R0                      ; FB3C   0378 0032
        BLT     L_FB8F                          ; FB3E   0205 004F

        SARC    R3,     2                       ; FB40   007F
        TSTR    R1                              ; FB41   0089
        BEQ     L_FB47                          ; FB42   0204 0003
        BOV     L_FB49                          ; FB44   0202 0003

        CLRC                                    ; FB46   0006
L_FB47:
        BNC     L_FB8E                          ; FB47   0209 0045

L_FB49:
        XORI    #$0001, R1                      ; FB49   03F9 0001
        CLRR    R3                              ; FB4B   01DB
        RSWD    R3                              ; FB4C   003B
        PSHR    R1                              ; FB4D   0271

        JSR     R5,     L_5BC3                  ; FB4E   0004 0158 03C3

        PULR    R1                              ; FB51   02B1
        MVII    #$0006, R0                      ; FB52   02B8 0006

        JSR     R5,     X_RAND1                 ; FB54   0004 0114 027D

        CMPI    #$0010, R0                      ; FB57   0378 0010
        BGE     L_FB8E                          ; FB59   020D 0033
        J       L_5BEB                          ; FB5B   0004 0358 03EB

L_FB5E:
        SDBD                                    ; FB5E   0001
        CMPI    #$0014, R0                      ; FB5F   0378 0014 0000
        BNEQ    L_FB8F                          ; FB62   020C 002B

        SARC    R3,     2                       ; FB64   007F
        TSTR    R1                              ; FB65   0089
        BNEQ    L_FB6B                          ; FB66   020C 0003
        BOV     L_FB6D                          ; FB68   0202 0003

        CLRC                                    ; FB6A   0006
L_FB6B:
        BNC     L_FB8E                          ; FB6B   0209 0021

L_FB6D:
        CLRR    R0                              ; FB6D   01C0
L_FB6E:
        MVI     G_0323, R2                      ; FB6E   0282 0323
        CMPI    #$0009, R2                      ; FB70   037A 0009
        BGT     L_FB8E                          ; FB72   020E 001A

        MVI     G_035E, R2                      ; FB74   0282 035E
        SARC    R2,     2                       ; FB76   007E
        BC      L_FB8E                          ; FB77   0201 0015

        MVI     G_01BA, R2                      ; FB79   0282 01BA
        TSTR    R2                              ; FB7B   0092
        BEQ     L_FB8E                          ; FB7C   0204 0010

        JSR     R5,     L_5F42                  ; FB7E   0004 015C 0342

        MVII    #$0008, R0                      ; FB81   02B8 0008

        JSR     R5,     X_RAND1                 ; FB83   0004 0114 027D

        CMPI    #$0010, R0                      ; FB86   0378 0010
        BLT     L_FB8E                          ; FB88   0205 0004

        MVI     G_0321, R0                      ; FB8A   0280 0321
        MVO     R0,     G_032C                  ; FB8C   0240 032C
L_FB8E:
        PULR    R7                              ; FB8E   02B7
L_FB8F:
        SDBD                                    ; FB8F   0001
        MVII    #$47AD, R4                      ; FB90   02BC 00AD 0047
        MOVR    R4,     R2                      ; FB93   00A2
        MVII    #$0010, R0                      ; FB94   02B8 0010

        JSR     R5,     X_FILL_ZERO             ; FB96   0004 0114 0338

        CLRR    R3                              ; FB99   01DB
        MVII    #$0190, R4                      ; FB9A   02BC 0190
L_FB9C:
        MVI@    R4,     R1                      ; FB9C   02A1
        CMPI    #$0040, R1                      ; FB9D   0379 0040
        BGE     L_FBD4                          ; FB9F   020D 0033

        ANDI    #$001F, R1                      ; FBA1   03B9 001F
        CMPI    #$0010, R1                      ; FBA3   0379 0010
        BGE     L_FBD4                          ; FBA5   020D 002D

        PSHR    R2                              ; FBA7   0272
        MOVR    R1,     R0                      ; FBA8   0088
        SUBI    #$0009, R0                      ; FBA9   0338 0009
L_FBAB:
        PSHR    R4                              ; FBAB   0274

        JSR     R5,     L_64B9                  ; FBAC   0004 0164 00B9

        PULR    R4                              ; FBAF   02B4
        BEQ     L_FBC9                          ; FBB0   0204 0017

        MOVR    R0,     R3                      ; FBB2   0083
        SLL     R3,     1                       ; FBB3   004B
        SDBD                                    ; FBB4   0001
        ADDI    #$5A7E, R3                      ; FBB5   02FB 007E 005A
        PSHR    R4                              ; FBB8   0274
        INCR    R4                              ; FBB9   000C
        MVI@    R4,     R4                      ; FBBA   02A4
        PSHR    R2                              ; FBBB   0272
        MVI@    R3,     R2                      ; FBBC   029A
        INCR    R3                              ; FBBD   000B
        PSHR    R3                              ; FBBE   0273
        MVI@    R3,     R3                      ; FBBF   029B

        JSR     R5,     G_E080                  ; FBC0   0004 01E0 0080

        PULR    R3                              ; FBC3   02B3
        PULR    R5                              ; FBC4   02B5
        PULR    R4                              ; FBC5   02B4
        MVO@    R2,     R5                      ; FBC6   026A
        MOVR    R5,     R2                      ; FBC7   00AA
        DECR    R2                              ; FBC8   0012
L_FBC9:
        INCR    R2                              ; FBC9   000A
        ADDI    #$0009, R0                      ; FBCA   02F8 0009
        CMPR    R0,     R1                      ; FBCC   0141
        BNEQ    L_FBD3                          ; FBCD   020C 0004

        SUBI    #$000A, R0                      ; FBCF   0338 000A
        BPL     L_FBAB                          ; FBD1   0223 0027

L_FBD3:
        PULR    R2                              ; FBD3   02B2
L_FBD4:
        SUBI    #$0004, R4                      ; FBD4   033C 0004
        ADDI    #$0002, R2                      ; FBD6   02FA 0002
        CMPI    #$0187, R4                      ; FBD8   037C 0187
        BGE     L_FB9C                          ; FBDA   022D 003F

        MVI     G_01B3, R1                      ; FBDC   0281 01B3
        MOVR    R1,     R4                      ; FBDE   008C
        ADDI    #$0199, R4                      ; FBDF   02FC 0199
        MVI@    R4,     R4                      ; FBE1   02A4
        CLRR    R0                              ; FBE2   01C0
        MVI     G_0180, R3                      ; FBE3   0283 0180
        CMPI    #$001D, R3                      ; FBE5   037B 001D
        BNEQ    L_FBFE                          ; FBE7   020C 0015

        SDBD                                    ; FBE9   0001
        MVII    #$416A, R5                      ; FBEA   02BD 006A 0041
        PSHR    R2                              ; FBED   0272
        MVI@    R5,     R2                      ; FBEE   02AA
        INCR    R5                              ; FBEF   000D
        MVI@    R5,     R3                      ; FBF0   02AB
        PSHR    R4                              ; FBF1   0274
        MVI     G_01C0, R5                      ; FBF2   0285 01C0
        TSTR    R5                              ; FBF4   00AD
        BEQ     L_FBF8                          ; FBF5   0204 0001

        MOVR    R5,     R4                      ; FBF7   00AC

L_FBF8:
        JSR     R5,     G_E080                  ; FBF8   0004 01E0 0080

        PULR    R4                              ; FBFB   02B4
        MOVR    R2,     R0                      ; FBFC   0090
        PULR    R2                              ; FBFD   02B2
L_FBFE:
        SDBD                                    ; FBFE   0001
L_FBFF:
        MVII    #$5A84, R3                      ; FBFF   02BB 0084 005A
L_FC02:
        PSHR    R4                              ; FC02   0274
        PSHR    R3                              ; FC03   0273
        PSHR    R2                              ; FC04   0272
        MVI@    R3,     R2                      ; FC05   029A
        INCR    R3                              ; FC06   000B
        MVI@    R3,     R3                      ; FC07   029B

        JSR     R5,     G_E080                  ; FC08   0004 01E0 0080

        ADDR    R0,     R2                      ; FC0B   00C2
        CMPI    #$00FF, R2                      ; FC0C   037A 00FF
        BLE     L_FC12                          ; FC0E   0206 0002

        MVII    #$00FF, R2                      ; FC10   02BA 00FF
L_FC12:
        PULR    R5                              ; FC12   02B5
        MVO@    R2,     R5                      ; FC13   026A
        PULR    R3                              ; FC14   02B3
        PSHR    R3                              ; FC15   0273
        PSHR    R5                              ; FC16   0275
        MVI@    R3,     R2                      ; FC17   029A
        INCR    R3                              ; FC18   000B
        MVI@    R3,     R3                      ; FC19   029B
        MVII    #$005A, R4                      ; FC1A   02BC 005A

        JSR     R5,     G_E080                  ; FC1C   0004 01E0 0080

        PULR    R5                              ; FC1F   02B5
        ADDR    R0,     R2                      ; FC20   00C2
        CMPI    #$00FF, R2                      ; FC21   037A 00FF
        BLE     L_FC27                          ; FC23   0206 0002

        MVII    #$00FF, R2                      ; FC25   02BA 00FF
L_FC27:
        MVO@    R2,     R5                      ; FC27   026A
        PULR    R3                              ; FC28   02B3
        SUBI    #$0002, R3                      ; FC29   033B 0002
        MOVR    R5,     R2                      ; FC2B   00AA
        PULR    R4                              ; FC2C   02B4
        SDBD                                    ; FC2D   0001
        CMPI    #$5A7E, R3                      ; FC2E   037B 007E 005A
        BGE     L_FC02                          ; FC31   022D 0030

        MVI     G_01B0, R0                      ; FC33   0280 01B0
        DECR    R0                              ; FC35   0010
        BGT     L_FCAF                          ; FC36   020E 0077

        MVI     G_016D, R0                      ; FC38   0280 016D
        SARC    R0,     2                       ; FC3A   007C
        MVI     G_0133, R1                      ; FC3B   0281 0133
        TSTR    R1                              ; FC3D   0089
        BNEQ    L_FC43                          ; FC3E   020C 0003
        BOV     L_FC45                          ; FC40   0202 0003

        CLRC                                    ; FC42   0006
L_FC43:
        BNC     L_FCAF                          ; FC43   0209 006A

L_FC45:
        SUBI    #$0010, R2                      ; FC45   033A 0010
        SUBI    #$0008, R5                      ; FC47   033D 0008
        MVII    #$0004, R1                      ; FC49   02B9 0004
        MVII    #$0190, R4                      ; FC4B   02BC 0190
L_FC4D:
        MVI@    R4,     R0                      ; FC4D   02A0
        CMPI    #$0010, R0                      ; FC4E   0378 0010
        BLT     L_FC61                          ; FC50   0205 000F

        CMPI    #$0040, R0                      ; FC52   0378 0040
        BLT     L_FCAF                          ; FC54   0205 0059

        SUBI    #$0004, R4                      ; FC56   033C 0004
        ADDI    #$0002, R2                      ; FC58   02FA 0002
        ADDI    #$0002, R5                      ; FC5A   02FD 0002
        DECR    R1                              ; FC5C   0011
        BNEQ    L_FC4D                          ; FC5D   022C 0011
        B       L_FCAF                          ; FC5F   0200 004E

L_FC61:
        MVI     G_0133, R1                      ; FC61   0281 0133
        MVI@    R2,     R3                      ; FC63   0293
        MVI@    R5,     R4                      ; FC64   02AC
        MVI@    R5,     R5                      ; FC65   02AD
        CMPI    #$0012, R3                      ; FC66   037B 0012
        BLE     L_FCA4                          ; FC68   0206 003A

        CMPR    R3,     R4                      ; FC6A   015C
        BLE     L_FC8E                          ; FC6B   0206 0021

        CMPR    R3,     R5                      ; FC6D   015D
        BLE     L_FC8E                          ; FC6E   0206 001E

        MVI     G_0180, R3                      ; FC70   0283 0180
        CMPI    #$001D, R3                      ; FC72   037B 001D
        BEQ     L_FC7C                          ; FC74   0204 0006

        MVI     G_01B3, R3                      ; FC76   0283 01B3
        CMPI    #$0005, R3                      ; FC78   037B 0005
        BLE     L_FCAF                          ; FC7A   0206 0033

L_FC7C:
        MVI     G_0196, R3                      ; FC7C   0283 0196
        CMPI    #$0005, R3                      ; FC7E   037B 0005
        BLE     L_FCAF                          ; FC80   0206 002D

L_FC82:
        JSR     R5,     L_6D40                  ; FC82   0004 016C 0140

        BNEQ    L_FCAF                          ; FC85   020C 0028

L_FC87:
        MVII    #$0001, R0                      ; FC87   02B8 0001

        JSR     R5,     L_59C3                  ; FC89   0004 0158 01C3

        B       L_FCAF                          ; FC8C   0200 0021

L_FC8E:
        MVII    #$0187, R4                      ; FC8E   02BC 0187
L_FC90:
        MVI@    R4,     R5                      ; FC90   02A5
        CMPR    R0,     R5                      ; FC91   0145
        BEQ     L_FCAF                          ; FC92   0204 001B

        CMPI    #$0040, R5                      ; FC94   037D 0040
        BGE     L_FC9E                          ; FC96   020D 0006

        ADDI    #$0002, R4                      ; FC98   02FC 0002
        CMPI    #$0190, R4                      ; FC9A   037C 0190
        BLE     L_FC90                          ; FC9C   0226 000D

L_FC9E:
        DECR    R0                              ; FC9E   0010

        JSR     R5,     L_638E                  ; FC9F   0004 0160 038E

        B       L_FCAF                          ; FCA2   0200 000B

L_FCA4:
        CMPR    R3,     R5                      ; FCA4   015D
        BGT     L_FC82                          ; FCA5   022E 0024

        CMPR    R3,     R4                      ; FCA7   015C
        BGT     L_FC82                          ; FCA8   022E 0027

        MVII    #$0001, R0                      ; FCAA   02B8 0001

        JSR     R5,     L_63F6                  ; FCAC   0004 0160 03F6

L_FCAF:
        MVI     G_035D, R0                      ; FCAF   0280 035D
        SDBD                                    ; FCB1   0001
        CMPI    #$5026, R0                      ; FCB2   0378 0026 0050
        BEQ     L_FB8E                          ; FCB5   0224 0128

        MVI     G_0133, R1                      ; FCB7   0281 0133
        MVI     G_016D, R3                      ; FCB9   0283 016D
        SARC    R3,     2                       ; FCBB   007F
        TSTR    R1                              ; FCBC   0089
        BEQ     L_FCC2                          ; FCBD   0204 0003
        BOV     L_FCC4                          ; FCBF   0202 0003

        CLRC                                    ; FCC1   0006
L_FCC2:
        BNC     L_FB8E                          ; FCC2   0229 0135

L_FCC4:
        MVI     G_0180, R0                      ; FCC4   0280 0180
        CMPI    #$001D, R0                      ; FCC6   0378 001D
        BEQ     L_FD8C                          ; FCC8   0204 00C2

        MVII    #$000C, R0                      ; FCCA   02B8 000C
        SDBD                                    ; FCCC   0001
        MVII    #$47AD, R4                      ; FCCD   02BC 00AD 0047
        MOVR    R4,     R5                      ; FCD0   00A5
        ADDI    #$0008, R5                      ; FCD1   02FD 0008
L_FCD3:
        MVI@    R4,     R2                      ; FCD3   02A2
        MVI@    R4,     R3                      ; FCD4   02A3
        CMPI    #$0006, R2                      ; FCD5   037A 0006
        BLT     L_FD75                          ; FCD7   0205 009C

        CMPI    #$0009, R0                      ; FCD9   0378 0009
        BEQ     L_FCE9                          ; FCDB   0204 000C

        CMPI    #$0006, R3                      ; FCDD   037B 0006
        BLT     L_FD75                          ; FCDF   0205 0094

        CMP@    R5,     R2                      ; FCE1   036A
        BGE     L_FD18                          ; FCE2   020D 0034

        INCR    R2                              ; FCE4   000A
        CMP@    R5,     R2                      ; FCE5   036A
        BLT     L_FD73                          ; FCE6   0205 008B

        INCR    R7                              ; FCE8   000F
L_FCE9:
        CLRR    R5                              ; FCE9   01ED
        MOVR    R0,     R2                      ; FCEA   0082
        SUBI    #$0009, R2                      ; FCEB   033A 0009
        MOVR    R2,     R3                      ; FCED   0093
        ADDR    R7,     R3                      ; FCEE   00FB
        ADDI    #$0025, R3                      ; FCEF   02FB 0025
        MVI@    R3,     R3                      ; FCF1   029B
        CMP     G_01B3, R3                      ; FCF2   0343 01B3
        BEQ     L_FD32                          ; FCF4   0204 003C

L_FCF6:
        ADDR    R7,     R2                      ; FCF6   00FA
        ADDI    #$0019, R2                      ; FCF7   02FA 0019
        MVI@    R2,     R0                      ; FCF9   0290
L_FCFA:
        MVI     G_035D, R5                      ; FCFA   0285 035D
        MVI     G_0133, R1                      ; FCFC   0281 0133
        XORI    #$0001, R1                      ; FCFE   03F9 0001
        CMP     G_0341, R5                      ; FD00   0345 0341
        BNEQ    L_FD0D                          ; FD02   020C 0009

L_FD04:
        PULR    R5                              ; FD04   02B5
        MVII    #$0001, R0                      ; FD05   02B8 0001
        MOVR    R0,     R1                      ; FD07   0081
        XOR     G_0133, R1                      ; FD08   03C1 0133
        J       L_59AD                          ; FD0A   0004 0358 01AD
L_FD0D:
        J       L_6197                          ; FD0D   0004 0360 0197

        INCR    R1                              ; FD10   0009
        DECLE   $0005                           ; FD11   0005

        SETC                                    ; FD12   0007
        DECLE   $0000                           ; FD13   0000

        EIS                                     ; FD14   0002
        DIS                                     ; FD15   0003

        JSR     R4,     .STIC.Y.5               ; FD16   0004 0000 000D

        CMP@    R5,     R3                      ; FD19   036B
        BGE     L_FD48                          ; FD1A   020D 002C

        SUBI    #$0009, R0                      ; FD1C   0338 0009
        MOVR    R0,     R3                      ; FD1E   0083
        SLL     R3,     1                       ; FD1F   004B
        ADDR    R0,     R3                      ; FD20   00C3
        ADDI    #$0009, R0                      ; FD21   02F8 0009
        ADDI    #$0184, R3                      ; FD23   02FB 0184
L_FD25:
        MVI@    R3,     R1                      ; FD25   0299
        CMPI    #$0020, R1                      ; FD26   0379 0020
        BGE     L_FD3C                          ; FD28   020D 0012

        SUBI    #$0003, R3                      ; FD2A   033B 0003
        CMPI    #$0187, R3                      ; FD2C   037B 0187
        BGE     L_FD25                          ; FD2E   022D 000A
        B       L_FCE9                          ; FD30   0220 0048

L_FD32:
        TSTR    R5                              ; FD32   00AD
        BNEQ    L_FD73                          ; FD33   020C 003E

        SLL     R2,     1                       ; FD35   004A
        SDBD                                    ; FD36   0001
        ADDI    #$5A7E, R2                      ; FD37   02FA 007E 005A
        B       L_FD52                          ; FD3A   0200 0016

L_FD3C:
        MVI@    R5,     R3                      ; FD3C   02AB
        ADDI    #$000D, R3                      ; FD3D   02FB 000D
        SLL     R3,     1                       ; FD3F   004B
        CMPR    R3,     R2                      ; FD40   015A
        BLT     L_FD48                          ; FD41   0205 0005

        MOVR    R0,     R2                      ; FD43   0082
        SUBI    #$000A, R2                      ; FD44   033A 000A
        B       L_FCF6                          ; FD46   0220 0051

L_FD48:
        SLL     R0,     1                       ; FD48   0048
        SLL     R0,     2                       ; FD49   004C
        MOVR    R0,     R4                      ; FD4A   0084
        ADD     G_0354, R4                      ; FD4B   02C4 0354
L_FD4D:
        MVI@    R4,     R2                      ; FD4D   02A2
        INCR    R4                              ; FD4E   000C
        MVI@    R4,     R3                      ; FD4F   02A3
        MVI     G_035D, R5                      ; FD50   0285 035D
L_FD52:
        MVI     G_01B3, R1                      ; FD52   0281 01B3
        MOVR    R1,     R4                      ; FD54   008C
        MVO     R1,     G_0196                  ; FD55   0241 0196
        ADDI    #$0199, R4                      ; FD57   02FC 0199
        MVI@    R4,     R4                      ; FD59   02A4
        MVO     R4,     G_0198                  ; FD5A   0244 0198
        TSTR    R5                              ; FD5C   00AD
        BNEQ    L_FD65                          ; FD5D   020C 0006

        MOVR    R2,     R4                      ; FD5F   0094
        MVII    #$0197, R0                      ; FD60   02B8 0197
        J       L_59E7                          ; FD62   0004 0358 01E7

L_FD65:
        CMP     G_0341, R5                      ; FD65   0345 0341
        BEQ     L_FD04                          ; FD67   0224 0064

        JSR     R5,     G_E083                  ; FD69   0004 01E0 0083

        MVO     R2,     G_0197                  ; FD6C   0242 0197
        MOVR    R1,     R0                      ; FD6E   0088
        CLRR    R3                              ; FD6F   01DB
        J       L_6D4F                          ; FD70   0004 036C 014F

L_FD73:
        SUBI    #$0002, R5                      ; FD73   033D 0002
L_FD75:
        ADDI    #$0002, R5                      ; FD75   02FD 0002
        DECR    R0                              ; FD77   0010
        CMPI    #$0009, R0                      ; FD78   0378 0009
        BGE     L_FCD3                          ; FD7A   022D 00A8

L_FD7C:
        MVI     G_01B3, R2                      ; FD7C   0282 01B3
        MVII    #$0008, R0                      ; FD7E   02B8 0008
        TSTR    R2                              ; FD80   0092
        BNEQ    L_FCFA                          ; FD81   022C 0088

        MVII    #$000B, R0                      ; FD83   02B8 000B
        MVI     G_035D, R5                      ; FD85   0285 035D
        CMP     G_0341, R5                      ; FD87   0345 0341
        BNEQ    L_FCFA                          ; FD89   022C 0090

        PULR    R7                              ; FD8B   02B7
L_FD8C:
        MVI     G_016D, R0                      ; FD8C   0280 016D
        ANDI    #$0040, R0                      ; FD8E   03B8 0040
        BNEQ    L_FB8E                          ; FD90   022C 0203

        MVO     R0,     G_01B2                  ; FD92   0240 01B2
        MVI     G_0196, R1                      ; FD94   0281 0196
        PSHR    R1                              ; FD96   0271
        MVII    #$00FF, R0                      ; FD97   02B8 00FF
        MVO     R0,     G_0196                  ; FD99   0240 0196

        JSR     R5,     L_6BC7                  ; FD9B   0004 0168 03C7

        PULR    R0                              ; FD9E   02B0
        CMP     G_01B3, R0                      ; FD9F   0340 01B3
        BEQ     L_FDAB                          ; FDA1   0204 0008

        CMPI    #$0009, R0                      ; FDA3   0378 0009
        BGE     L_FDAB                          ; FDA5   020D 0004

        MOVR    R7,     R3                      ; FDA7   00BB

        JSR     R5,     L_6D4E                  ; FDA8   0004 016C 014E

L_FDAB:
        SDBD                                    ; FDAB   0001
        MVII    #$416B, R4                      ; FDAC   02BC 006B 0041
        B       L_FD4D                          ; FDAF   0220 0063

        MVI     G_0133, R1                      ; FDB1   0281 0133
        MVI     G_016D, R0                      ; FDB3   0280 016D
        SARC    R0,     2                       ; FDB5   007C
        TSTR    R1                              ; FDB6   0089
        BEQ     L_FDBC                          ; FDB7   0204 0003
        BOV     L_FDBE                          ; FDB9   0202 0003

        CLRC                                    ; FDBB   0006
L_FDBC:
        BNC     L_FB8E                          ; FDBC   0229 022F

L_FDBE:
        XORI    #$0001, R1                      ; FDBE   03F9 0001
        MVI     G_0180, R0                      ; FDC0   0280 0180
        CMPI    #$001D, R0                      ; FDC2   0378 001D
        BEQ     L_FD8C                          ; FDC4   0224 0039
        B       L_FD7C                          ; FDC6   0220 004B

        MOVR    R6,     R0                      ; FDC8   00B0
        SUBR    R3,     R0                      ; FDC9   0118
        ADDR    R1,     R1                      ; FDCA   00C9
        DECLE   $0000                           ; FDCB   0000

        SWAP    R2,     1                       ; FDCC   0042
        INCR    R6                              ; FDCD   000E
        DECLE   $0238                           ; FDCE   0238

        AND@    R3,     R2                      ; FDCF   039A
        DECLE   $0211,  $0000                   ; FDD0   0211 0000

        SLR     R0,     2                       ; FDD2   0064
        SUB@    R4,     R4                      ; FDD3   0324
        BGT     L_FA39                          ; FDD4   022E 039C

        SUB@    R4,     R4                      ; FDD6   0324
        DECLE   $0000                           ; FDD7   0000

        RLC     R0,     2                       ; FDD8   0054
        XORR    R2,     R4                      ; FDD9   01D4
        MVO@    R0,     R4                      ; FDDA   0260
        ADD@    R5,     R1                      ; FDDB   02E9
        MVO     R7,     .STIC.X.0               ; FDDC   0247 0000
        INCR    R0                              ; FDDE   0008
        COMR    R0                              ; FDDF   0018
        MVI     G_0335, R6                      ; FDE0   0286 0335
        ADDR    R2,     R2                      ; FDE2   00D2
        XOR@    R5,     R4                      ; FDE3   03EC
        ADDR    R0,     R2                      ; FDE4   00C2
        MOVR    R6,     R0                      ; FDE5   00B0
        MVO     R4,     .PSG0.chn_b_lo          ; FDE6   0244 01F1
        MVO@    R0,     R1                      ; FDE8   0248
        RRC     R1,     1                       ; FDE9   0071
        CMPR    R3,     R5                      ; FDEA   015D
        ANDR    R0,     R6                      ; FDEB   0186
        RLC     R3,     2                       ; FDEC   0057
        CMP@    R6,     R3                      ; FDED   0373
        MVI@    R4,     R2                      ; FDEE   02A2
        RRC     R1,     1                       ; FDEF   0071
        INCR    R6                              ; FDF0   000E
        DECLE   $0206                           ; FDF1   0206

        PSHR    R5                              ; FDF2   0275
        ADDR    R1,     R2                      ; FDF3   00CA
        MVI@    R4,     R6                      ; FDF4   02A6
        CMPR    R4,     R2                      ; FDF5   0162
        ADDR    R2,     R4                      ; FDF6   00D4
        DECR    R0                              ; FDF7   0010
        XOR@    R4,     R7                      ; FDF8   03E7
        BGT     L_FEE8                          ; FDF9   020E 00ED

        MVO@    R7,     R1                      ; FDFB   024F
        DECLE   $0232                           ; FDFC   0232

        COMR    R6                              ; FDFD   001E
        DECLE   $0000                           ; FDFE   0000

        BNEQ    L_FF08                          ; FDFF   020C 0107

        ANDR    R0,     R4                      ; FE01   0184
        ANDR    R4,     R6                      ; FE02   01A6
        MVO@    R7,     R1                      ; FE03   024F
        MOVR    R1,     R3                      ; FE04   008B
        AND     .PSG1.noise,R2                  ; FE05   0382 00F9
        ANDR    R6,     R7                      ; FE07   01B7
        XOR@    R6,     R1                      ; FE08   03F1
        DECLE   $0216                           ; FE09   0216

        ADDR    R2,     R2                      ; FE0A   00D2
        SUBR    R5,     R4                      ; FE0B   012C
        TSTR    R2                              ; FE0C   0092
        SLLC    R0,     1                       ; FE0D   0058
        SWAP    R0,     2                       ; FE0E   0044
        ADDR    R4,     R7                      ; FE0F   00E7
        MVO@    R4,     R1                      ; FE10   024C
        MOVR    R6,     R5                      ; FE11   00B5
        XORR    R2,     R5                      ; FE12   01D5
        MOVR    R4,     R6                      ; FE13   00A6
        MVO@    R1,     R1                      ; FE14   0249
        XOR@    R6,     R2                      ; FE15   03F2
        ANDR    R4,     R2                      ; FE16   01A2
        CMPR    R6,     R2                      ; FE17   0172
        XOR@    R6,     R6                      ; FE18   03F6
        SUB     .BTAB.C5,R0                     ; FE19   0300 02C5
        ADDR    R2,     R2                      ; FE1B   00D2
        MVI@    R4,     R7                      ; FE1C   02A7
        EIS                                     ; FE1D   0002
        SLLC    R0,     2                       ; FE1E   005C
        CMP@    R2,     R5                      ; FE1F   0355
        ADD@    R4,     R6                      ; FE20   02E6
        MVO@    R6,     R1                      ; FE21   024E
        MOVR    R7,     R5                      ; FE22   00BD
        MVO@    R6,     R2                      ; FE23   0256
        MOVR    R4,     R6                      ; FE24   00A6
        SLLC    R3,     2                       ; FE25   005F
        AND     G_03C2, R0                      ; FE26   0380 03C2
        SAR     R2,     1                       ; FE28   006A
        XORR    R0,     R7                      ; FE29   01C7
        GSWD    R3                              ; FE2A   0033
        MVO@    R7,     R4                      ; FE2B   0267
        MVO@    R6,     R1                      ; FE2C   024E
        SLL     R3,     2                       ; FE2D   004F
        ADDR    R4,     R0                      ; FE2E   00E0
        SUB     G_01C0, R2                      ; FE2F   0302 01C0
        ANDR    R5,     R0                      ; FE31   01A8
        ADDR    R2,     R3                      ; FE32   00D3
        CMP@    R4,     R7                      ; FE33   0367
        MVO@    R3,     R4                      ; FE34   0263
        SLLC    R3,     1                       ; FE35   005B
        CMPR    R3,     R6                      ; FE36   015E
        XOR@    R2,     R3                      ; FE37   03D3
        RSWD    R7                              ; FE38   003F
        ADDR    R5,     R0                      ; FE39   00E8
        MVO@    R0,     R2                      ; FE3A   0250
        XORR    R6,     R2                      ; FE3B   01F2

        JSR     R4,     .BTAB.04                ; FE3C   0004 0000 0204

        CMPR    R7,     R6                      ; FE3F   017E
        BMI     L_FFE8                          ; FE40   020B 01A6

        MVI@    R4,     R3                      ; FE42   02A3
        INCR    R2                              ; FE43   000A
        ANDR    R0,     R2                      ; FE44   0182
        SAR     R2,     1                       ; FE45   006A
        ANDR    R6,     R7                      ; FE46   01B7
        ADD@    R6,     R4                      ; FE47   02F4
        DECLE   $0216                           ; FE48   0216

        ADDR    R1,     R6                      ; FE49   00CE
        SAR     R2,     2                       ; FE4A   006E
        DECLE   $0036                           ; FE4B   0036

        ADDR    R2,     R0                      ; FE4C   00D0
        SUBI    #$01E6, R3                      ; FE4D   033B 01E6
        ADD@    R1,     R5                      ; FE4F   02CD
        ADDR    R0,     R3                      ; FE50   00C3
        ADD@    R2,     R1                      ; FE51   02D1
        XORR    R4,     R6                      ; FE52   01E6
        ADDR    R1,     R7                      ; FE53   00CF
        BLT     L_FEDA                          ; FE54   0205 0084

        SUB@    R4,     R2                      ; FE56   0322
        ANDR    R2,     R7                      ; FE57   0197
        SUB@    R6,     R7                      ; FE58   0337
        XORR    R2,     R6                      ; FE59   01D6
        ADDR    R2,     R6                      ; FE5A   00D6
        AND@    R4,     R5                      ; FE5B   03A5
        RLC     R3,     2                       ; FE5C   0057
        MOVR    R2,     R4                      ; FE5D   0094
        CMPR    R0,     R5                      ; FE5E   0145
        SUB     .BTAB.CD,R0                     ; FE5F   0300 02CD
        MOVR    R7,     R3                      ; FE61   00BB
        MVO@    R0,     R2                      ; FE62   0250
        SLR     R0,     2                       ; FE63   0064
        B       L_FEA2                          ; FE64   0200 003C

        TSTR    R0                              ; FE66   0080
        ADDR    R2,     R0                      ; FE67   00D0
        XORR    R1,     R6                      ; FE68   01CE
        SWAP    R2,     2                       ; FE69   0046
        ADDR    R2,     R2                      ; FE6A   00D2
        DECLE   $0200                           ; FE6B   0200

        SUB@    R5,     R5                      ; FE6C   032D
        ADDR    R4,     R7                      ; FE6D   00E7
        SWAP    R0,     1                       ; FE6E   0040
        ADD@    R6,     R7                      ; FE6F   02F7
        CMPR    R3,     R7                      ; FE70   015F
        NEGR    R1                              ; FE71   0021
        DECLE   $0000                           ; FE72   0000

        TSTR    R3                              ; FE73   009B
        SWAP    R1,     1                       ; FE74   0041
        NEGR    R4                              ; FE75   0024
        SARC    R0,     1                       ; FE76   0078
        INCR    R6                              ; FE77   000E
        DECLE   $0000                           ; FE78   0000

        MOVR    R1,     R4                      ; FE79   008C
        SUB@    R2,     R1                      ; FE7A   0311
        XORR    R1,     R0                      ; FE7B   01C8
        DECLE   $0000                           ; FE7C   0000

        ADDR    R1,     R1                      ; FE7D   00C9
        MVI     G_01A8, R1                      ; FE7E   0281 01A8
        CMPR    R5,     R2                      ; FE80   016A
        ANDR    R0,     R5                      ; FE81   0185
        ANDR    R3,     R1                      ; FE82   0199
        INCR    R2                              ; FE83   000A
        ANDR    R4,     R7                      ; FE84   01A7
        MVO@    R2,     R3                      ; FE85   025A
        MVO@    R6,     R1                      ; FE86   024E
        DECLE   $0211                           ; FE87   0211

        ADD@    R4,     R0                      ; FE88   02E0
        INCR    R7                              ; FE89   000F
        NEGR    R0                              ; FE8A   0020
        ADDR    R1,     R4                      ; FE8B   00CC
        ADDR    R6,     R6                      ; FE8C   00F6
        ANDR    R4,     R2                      ; FE8D   01A2
        ADDR    R2,     R4                      ; FE8E   00D4
        SUB     .BTAB.D7,R4                     ; FE8F   0304 02D7
        ANDR    R1,     R2                      ; FE91   018A
        MVO@    R7,     R4                      ; FE92   0267
        ADDR    R3,     R3                      ; FE93   00DB
        SLL     R1,     1                       ; FE94   0049
        MVO@    R4,     R5                      ; FE95   026C
        ANDR    R0,     R6                      ; FE96   0186
        SAR     R1,     2                       ; FE97   006D
        SUB@    R4,     R3                      ; FE98   0323
        GSWD    R3                              ; FE99   0033
        MVO@    R5,     R1                      ; FE9A   024D
        NOP                                     ; FE9B   0034
        SUBR    R5,     R5                      ; FE9C   012D
        ADD     G_0077, R0                      ; FE9D   02C0 0077
        AND     .BTAB.9B,R2                     ; FE9F   0382 029B
        SUBR    R4,     R6                      ; FEA1   0126
L_FEA2:
        BLE     L_FC8D                          ; FEA2   0226 0216

        XOR     .BTAB.7B,R0                     ; FEA4   03C0 027B
        PULR    R5                              ; FEA6   02B5
        NEGR    R5                              ; FEA7   0025
        SUBR    R0,     R7                      ; FEA8   0107
        ADDR    R7,     R6                      ; FEA9   00FE
        SARC    R0,     1                       ; FEAA   0078
        ADD@    R4,     R3                      ; FEAB   02E3
        NEGR    R5                              ; FEAC   0025
        DECLE   $0005                           ; FEAD   0005

        AND     .STIC.X.0,R2                    ; FEAE   0382 0000
        XORR    R7,     R3                      ; FEB0   01FB
        ADDR    R7,     R5                      ; FEB1   00FD
        RLC     R2,     1                       ; FEB2   0052
        DECLE   $0000                           ; FEB3   0000

        SUB@    R2,     R1                      ; FEB4   0311
        CMP@    R4,     R5                      ; FEB5   0365
        MVO@    R7,     R4                      ; FEB6   0267
        AND@    R6,     R3                      ; FEB7   03B3
        MOVR    R3,     R1                      ; FEB8   0099
        SLLC    R2,     2                       ; FEB9   005E
        SUB     G_0375, R2                      ; FEBA   0302 0375
        MVI@    R4,     R4                      ; FEBC   02A4
        SUB@    R6,     R2                      ; FEBD   0332
        AND@    R3,     R3                      ; FEBE   039B
        SLL     R0,     1                       ; FEBF   0048
        SUBR    R5,     R7                      ; FEC0   012F
        XOR     .PSG1.noise,R1                  ; FEC1   03C1 00F9
        CMP@    R1,     R3                      ; FEC3   034B
        AND@    R3,     R1                      ; FEC4   0399
        XORR    R2,     R6                      ; FEC5   01D6
        DECLE   $0234                           ; FEC6   0234

        MVI@    R2,     R6                      ; FEC7   0296
        XOR     G_01BC, R0                      ; FEC8   03C0 01BC
        MVI@    R5,     R5                      ; FECA   02AD
        XOR@    R1,     R5                      ; FECB   03CD
        ADDR    R7,     R2                      ; FECC   00FA
        DECR    R1                              ; FECD   0011
        ANDR    R1,     R3                      ; FECE   018B
        ADDR    R0,     R0                      ; FECF   00C0
        SUB@    R5,     R6                      ; FED0   032E
        CMP@    R2,     R4                      ; FED1   0354
        CLRR    R2                              ; FED2   01D2
        XOR@    R6,     R0                      ; FED3   03F0
        XOR     .BTAB.00,R0                     ; FED4   03C0 0200
        AND     .PSG0.chn_c_lo,R7               ; FED6   0387 01F2
        DECR    R2                              ; FED8   0012
        XORR    R0,     R7                      ; FED9   01C7
L_FEDA:
        COMR    R4                              ; FEDA   001C
        MVI@    R1,     R7                      ; FEDB   028F
        MOVR    R4,     R6                      ; FEDC   00A6
        MVI@    R2,     R7                      ; FEDD   0297
        MVI     G_0067, R4                      ; FEDE   0284 0067
        RLC     R0,     1                       ; FEE0   0050
        SUBR    R2,     R7                      ; FEE1   0117
        ANDR    R5,     R5                      ; FEE2   01AD
        MVO@    R3,     R2                      ; FEE3   0253
        CMP@    R2,     R4                      ; FEE4   0354
        SUB     G_03E3, R6                      ; FEE5   0306 03E3
        XORR    R4,     R3                      ; FEE7   01E3
L_FEE8:
        MVO@    R3,     R5                      ; FEE8   026B
        PULR    R7                              ; FEE9   02B7
        SUB@    R5,     R1                      ; FEEA   0329
        ANDR    R6,     R1                      ; FEEB   01B1
        TSTR    R4                              ; FEEC   00A4
        XORI    #$02F1, R2                      ; FEED   03FA 02F1
        CMP     G_034A, R5                      ; FEEF   0345 034A
        RRC     R0,     2                       ; FEF1   0074
        TSTR    R3                              ; FEF2   009B
        SLR     R2,     1                       ; FEF3   0062
        XORI    #$0358, R5                      ; FEF4   03FD 0358
        ANDR    R4,     R2                      ; FEF6   01A2
        ANDI    #$0267, R5                      ; FEF7   03BD 0267
        XORR    R5,     R3                      ; FEF9   01EB
        XORR    R5,     R4                      ; FEFA   01EC
        RRC     R2,     2                       ; FEFB   0076
        MOVR    R0,     R7                      ; FEFC   0087
        ADD@    R6,     R1                      ; FEFD   02F1
        MVO@    R6,     R4                      ; FEFE   0266
        AND@    R2,     R2                      ; FEFF   0392
        NEGR    R7                              ; FF00   0027
        ANDI    #$0023, R7                      ; FF01   03BF 0023
        MOVR    R5,     R4                      ; FF03   00AC
        ADDR    R4,     R1                      ; FF04   00E1
        DECLE   $0000                           ; FF05   0000

        SAR     R1,     1                       ; FF06   0069
        DECLE   $0210                           ; FF07   0210
L_FF08:
        XOR@    R1,     R0                      ; FF08   03C8
        DECLE   $0000                           ; FF09   0000

        MOVR    R2,     R6                      ; FF0A   0096
        SUBR    R4,     R5                      ; FF0B   0125
        ANDR    R4,     R6                      ; FF0C   01A6
        XOR@    R3,     R0                      ; FF0D   03D8
        SLR     R0,     2                       ; FF0E   0064
        XORR    R6,     R1                      ; FF0F   01F1
        CLRC                                    ; FF10   0006
        AND@    R4,     R6                      ; FF11   03A6
        MVI@    R2,     R6                      ; FF12   0296
        MOVR    R1,     R6                      ; FF13   008E
        CMPR    R7,     R3                      ; FF14   017B
        EIS                                     ; FF15   0002
        DECLE   $0000,  $0200                   ; FF16   0000 0200

        AND     .BTAB.49,R6                     ; FF18   0386 0249
        MVI@    R1,     R5                      ; FF1A   028D
        CMPR    R0,     R6                      ; FF1B   0146
        CMP@    R2,     R0                      ; FF1C   0350
        CMPR    R0,     R6                      ; FF1D   0146
        ANDR    R5,     R5                      ; FF1E   01AD
        MOVR    R7,     R1                      ; FF1F   00B9
        DECLE   $0000                           ; FF20   0000

        SUB@    R4,     R0                      ; FF21   0320
        XORR    R6,     R1                      ; FF22   01F1
        ANDR    R1,     R3                      ; FF23   018B
        XORR    R5,     R1                      ; FF24   01E9
        INCR    R0                              ; FF25   0008
        XORI    #$02FD, R7                      ; FF26   03FF 02FD
        SUB     .BTAB.4F,R6                     ; FF28   0306 024F
        RSWD    R0                              ; FF2A   0038
        MVO     R0,     G_0389                  ; FF2B   0240 0389
        XOR     .BTAB.19,R0                     ; FF2D   03C0 0219
        ANDR    R2,     R5                      ; FF2F   0195
        RSWD    R0                              ; FF30   0038
        ANDR    R2,     R1                      ; FF31   0191
        MVI     G_007A, R1                      ; FF32   0281 007A
        AND@    R6,     R5                      ; FF34   03B5
        XOR@    R1,     R4                      ; FF35   03CC
        MOVR    R5,     R2                      ; FF36   00AA
        SUB@    R2,     R3                      ; FF37   0313
        CMP@    R1,     R1                      ; FF38   0349
        ANDR    R4,     R0                      ; FF39   01A0
        ADD@    R1,     R4                      ; FF3A   02CC
        MVO@    R4,     R2                      ; FF3B   0254
        MVI@    R4,     R6                      ; FF3C   02A6
        SLL     R1,     1                       ; FF3D   0049
        MVI@    R1,     R5                      ; FF3E   028D
        ADDR    R0,     R5                      ; FF3F   00C5
        MVO     R0,     G_01DE                  ; FF40   0240 01DE
        ANDR    R5,     R1                      ; FF42   01A9
        CMP@    R4,     R3                      ; FF43   0363
        BC      L_FBFF                          ; FF44   0221 0346

        ADDR    R0,     R2                      ; FF46   00C2
        SUBR    R6,     R0                      ; FF47   0130
        ADD@    R5,     R7                      ; FF48   02EF
        ADD@    R2,     R4                      ; FF49   02D4
        AND@    R6,     R1                      ; FF4A   03B1
        ANDR    R1,     R7                      ; FF4B   018F
        ANDR    R4,     R3                      ; FF4C   01A3
        NEGR    R1                              ; FF4D   0021
        MVI@    R3,     R0                      ; FF4E   0298
        SLLC    R1,     1                       ; FF4F   0059
        CMP@    R5,     R3                      ; FF50   036B
        XORR    R2,     R4                      ; FF51   01D4
        SUB@    R1,     R0                      ; FF52   0308
        ADD@    R4,     R1                      ; FF53   02E1
        INCR    R0                              ; FF54   0008
        CMPI    #$03A3, R6                      ; FF55   037E 03A3
        MOVR    R6,     R5                      ; FF57   00B5
        MOVR    R2,     R5                      ; FF58   0095
        SWAP    R1,     1                       ; FF59   0041
        ADD@    R5,     R1                      ; FF5A   02E9
        ADDR    R4,     R5                      ; FF5B   00E5
        MOVR    R7,     R6                      ; FF5C   00BE
        SLR     R1,     1                       ; FF5D   0061
        AND     .STIC.X.3,R1                    ; FF5E   0381 0003
        MVI     G_01B7, R2                      ; FF60   0282 01B7
        CMPR    R3,     R6                      ; FF62   015E
        AND@    R4,     R7                      ; FF63   03A7
        XORR    R6,     R0                      ; FF64   01F0
        DECR    R4                              ; FF65   0014
        XOR@    R5,     R6                      ; FF66   03EE
        CMPR    R3,     R4                      ; FF67   015C
        XORI    #$0329, R2                      ; FF68   03FA 0329
        SDBD                                    ; FF6A   0001
        AND@    R3,     R4                      ; FF6B   039C
        RLC     R0,     1                       ; FF6C   0050
        RSWD    R6                              ; FF6D   003E
        SETC                                    ; FF6E   0007
        DECLE   $0000                           ; FF6F   0000

        MOVR    R0,     R7                      ; FF70   0087
        ADDR    R6,     R5                      ; FF71   00F5
        ANDR    R0,     R6                      ; FF72   0186
        ADDR    R2,     R2                      ; FF73   00D2
        DECLE   $0200                           ; FF74   0200

        SUB@    R5,     R1                      ; FF75   0329
        SWAP    R3,     1                       ; FF76   0043
        MVI@    R2,     R2                      ; FF77   0292
        ADD@    R5,     R4                      ; FF78   02EC
        ADD     .BTAB.00,R4                     ; FF79   02C4 0200
        SLLC    R3,     1                       ; FF7B   005B
        ADDR    R1,     R5                      ; FF7C   00CD
        SUBR    R4,     R0                      ; FF7D   0120
        ADDR    R2,     R7                      ; FF7E   00D7
        ADDR    R0,     R4                      ; FF7F   00C4
        RRC     R2,     1                       ; FF80   0072
        SUB     .STIC.CS.1,R0                   ; FF81   0300 0029
        CMP@    R4,     R4                      ; FF83   0364
        SLR     R3,     2                       ; FF84   0067
        XOR@    R2,     R6                      ; FF85   03D6
        MOVR    R4,     R1                      ; FF86   00A1
        MOVR    R1,     R2                      ; FF87   008A
        XORI    #$0068, R2                      ; FF88   03FA 0068
        ADD@    R4,     R4                      ; FF8A   02E4
        DECLE   $0232                           ; FF8B   0232

        AND@    R5,     R1                      ; FF8C   03A9
        SLL     R0,     1                       ; FF8D   0048
        SUBI    #$027A, R4                      ; FF8E   033C 027A
        ADDR    R6,     R4                      ; FF90   00F4
        CMPR    R0,     R3                      ; FF91   0143
        SUB@    R3,     R2                      ; FF92   031A
        CMPR    R4,     R4                      ; FF93   0164
        DECLE   $0218                           ; FF94   0218

        SUB@    R3,     R6                      ; FF95   031E
        SLLC    R3,     1                       ; FF96   005B
        SUBI    #$01A1, R5                      ; FF97   033D 01A1
        AND@    R1,     R4                      ; FF99   038C
        MOVR    R5,     R2                      ; FF9A   00AA
        DECLE   $020B                           ; FF9B   020B

        MOVR    R2,     R1                      ; FF9C   0091
        ANDR    R1,     R7                      ; FF9D   018F
        CMPI    #$02D2, R5                      ; FF9E   037D 02D2
        XORR    R4,     R6                      ; FFA0   01E6
        MVO@    R1,     R2                      ; FFA1   0251
        MVI@    R1,     R1                      ; FFA2   0289
        ANDR    R5,     R0                      ; FFA3   01A8
        XORR    R2,     R7                      ; FFA4   01D7
        CMPR    R5,     R6                      ; FFA5   016E
        ADDR    R5,     R3                      ; FFA6   00EB
        ADD@    R6,     R3                      ; FFA7   02F3
        DECLE   $0228                           ; FFA8   0228

        SUB     .BTAB.E3,R7                     ; FFA9   0307 02E3
        ADDR    R5,     R3                      ; FFAB   00EB
        MOVR    R1,     R3                      ; FFAC   008B
        SUB@    R2,     R7                      ; FFAD   0317
        AND@    R6,     R4                      ; FFAE   03B4
        DECLE   $0203                           ; FFAF   0203

        CMPR    R6,     R4                      ; FFB0   0174
        ANDR    R0,     R2                      ; FFB1   0182
        MVO@    R0,     R4                      ; FFB2   0260
        MOVR    R0,     R4                      ; FFB3   0084
        SUB@    R3,     R4                      ; FFB4   031C
        DECLE   $0001                           ; FFB5   0001

        MOVR    R0,     R7                      ; FFB6   0087
        SUB@    R3,     R6                      ; FFB7   031E
        CMPR    R6,     R1                      ; FFB8   0171
        SUB@    R2,     R4                      ; FFB9   0314
        CMP     .STIC.MODE,R5                   ; FFBA   0345 0021
        DECLE   $023C                           ; FFBC   023C

        MVO@    R1,     R4                      ; FFBD   0261
L_FFBE:
        SUBR    R5,     R2                      ; FFBE   012A
        ADDR    R4,     R6                      ; FFBF   00E6
        SUBR    R1,     R6                      ; FFC0   010E
        XORR    R7,     R2                      ; FFC1   01FA
        TSTR    R0                              ; FFC2   0080
        CMP@    R5,     R7                      ; FFC3   036F
        MOVR    R7,     R0                      ; FFC4   00B8
        SUB@    R1,     R6                      ; FFC5   030E
        XOR@    R2,     R1                      ; FFC6   03D1
        NEGR    R4                              ; FFC7   0024
        SUBI    #$02F0, R0                      ; FFC8   0338 02F0
        SUBR    R2,     R7                      ; FFCA   0117
        ADCR    R6                              ; FFCB   002E
        SUBR    R0,     R0                      ; FFCC   0100
        CMPR    R0,     R5                      ; FFCD   0145
        DECLE   $0000                           ; FFCE   0000

        MOVR    R7,     R6                      ; FFCF   00BE
        CMPR    R0,     R2                      ; FFD0   0142
        DECLE   $0000                           ; FFD1   0000

        BNC     L_FC0F                          ; FFD2   0229 03C4

        PSHR    R1                              ; FFD4   0271
        MOVR    R7,     R3                      ; FFD5   00BB
        ADDR    R3,     R1                      ; FFD6   00D9
L_FFD7:
        DECLE   $027A,  $0201                   ; FFD7   027A 0201

        MVO@    R5,     R5                      ; FFD9   026D
        MVI@    R2,     R6                      ; FFDA   0296
        TSTR    R2                              ; FFDB   0092
        DECR    R0                              ; FFDC   0010
        XORI    #$0363, R1                      ; FFDD   03F9 0363
        DIS                                     ; FFDF   0003
        ANDR    R2,     R3                      ; FFE0   0193
        ADDR    R7,     R3                      ; FFE1   00FB
        MVI@    R1,     R7                      ; FFE2   028F
        XORR    R0,     R3                      ; FFE3   01C3
        DECR    R4                              ; FFE4   0014
        MVI@    R2,     R2                      ; FFE5   0292
        AND@    R4,     R0                      ; FFE6   03A0
        DECLE   $0201                           ; FFE7   0201
L_FFE8:
        NEGR    R0                              ; FFE8   0020
        DECLE   $0004                           ; FFE9   0004

        SUBR    R6,     R3                      ; FFEA   0133
        MVI@    R3,     R3                      ; FFEB   029B
        MOVR    R2,     R0                      ; FFEC   0090
        MVO     R5,     G_0380                  ; FFED   0245 0380
        ADD@    R6,     R5                      ; FFEF   02F5
        CMPR    R0,     R3                      ; FFF0   0143
        SLL     R1,     1                       ; FFF1   0049
        XORR    R0,     R2                      ; FFF2   01C2
        NEGR    R4                              ; FFF3   0024
        AND     .BTAB.1B,R2                     ; FFF4   0382 021B
        RRC     R0,     1                       ; FFF6   0070
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF7   0000 0000 0000 0000
        DECLE   $0000                           ; FFFB   0000

        JSRD    R4,     .GROM.000               ; FFFC   0004 0032 0000

        ADDR    R4,     R0                      ; FFFF   00E0
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;; ======================================================================== ;;
