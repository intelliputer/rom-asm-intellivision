
        ORG     $5000
.HEADER:
        BIDECLE $0000           ; 5000  Ptr: MOB graphic images
        BIDECLE $0000           ; 5002  Ptr: EXEC timer table
        BIDECLE $0000           ; 5004  Ptr: Start of game
        BIDECLE $A894           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $500D           ; 5008  Ptr: GRAM init sequence
        BIDECLE $500E           ; 500A  Ptr: Date/Title
        DECLE   $00C0           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
.TITLE:
        DECLE   $0057           ; 500E  Cartridge year
        STRING  "GO"            ; 500F  Title string
        STRING  "LF"            ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  

.TITLECODE:
        EIS                                     ; 5014   0002

        JSR     R5,     L_5225                  ; 5015   0004 0150 0225

        DIS                                     ; 5018   0003
        MVII    #$02F1, R6                      ; 5019   02BE 02F1
        CLRR    R0                              ; 501B   01C0
        CLRR    R5                              ; 501C   01ED
L_501D:
        MVO@    R0,     R5                      ; 501D   0268
        CMPI    #$035D, R5                      ; 501E   037D 035D
        BNEQ    L_501D                          ; 5020   022C 0004

        MVII    #$0010, R0                      ; 5022   02B8 0010
        MVII    #$00FF, R1                      ; 5024   02B9 00FF
        MVII    #$010B, R4                      ; 5026   02BC 010B

        JSR     R5,     X_FILL_MEM              ; 5028   0004 0114 0341

        MVII    #$003F, R0                      ; 502B   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 502D   0240 01F8

        JSR     R5,     L_5244                  ; 502F   0004 0150 0244
        DECLE   $0337,  $00B3,  $0050,  $0000   ; 5032   0337 00B3 0050 0000
        DECLE   $0004                           ; 5036   0004

        ANDR    R5,     R4                      ; 5037   01AC
        MVI@    R2,     R2                      ; 5038   0292
        SDBD                                    ; 5039   0001
        MVII    #$5014, R0                      ; 503A   02B8 0014 0050
        MVO     R0,     G_02F0                  ; 503D   0240 02F0

        JSR     R5,     L_521D                  ; 503F   0004 0150 021D
        BIDECLE $673F                           ; 5042   003F 0067

        JSR     R5,     L_5218                  ; 5044   0004 0150 0218
        BIDECLE $5059                           ; 5047   0059 0050

        JSR     R5,     L_5FE5                  ; 5049   0004 015C 03E5

        MVII    #$0004, R0                      ; 504C   02B8 0004
        MVO     R0,     G_0103                  ; 504E   0240 0103

        JSR     R5,     L_5BF9                  ; 5050   0004 0158 03F9
        DECLE   $02B8,  $0005,  $0004           ; 5053   02B8 0005 0004

        ANDR    R4,     R0                      ; 5056   01A0
L_5057:
        BGT     L_5057                          ; 5057   022E 0001

        JSR     R5,     L_524D                  ; 5059   0004 0150 024D

        MVI     G_01B6, R2                      ; 505C   0282 01B6
        MOVR    R2,     R1                      ; 505E   0091
        INCR    R2                              ; 505F   000A
        ADDR    R7,     R2                      ; 5060   00FA
        ADD@    R2,     R7                      ; 5061   02D7

        COMR    R2                              ; 5062   001A
        DECR    R0                              ; 5063   0010
        DECR    R0                              ; 5064   0010
        DECR    R0                              ; 5065   0010
        COMR    R5                              ; 5066   001D
        NEGR    R5                              ; 5067   0025
        NEGR    R5                              ; 5068   0025
        NEGR    R5                              ; 5069   0025
        DECR    R0                              ; 506A   0010
        DECR    R0                              ; 506B   0010
        DECR    R0                              ; 506C   0010
        COMR    R5                              ; 506D   001D
        NEGR    R5                              ; 506E   0025
        COMR    R5                              ; 506F   001D
        DECR    R2                              ; 5070   0012
        DECR    R0                              ; 5071   0010
        B       L_50A5                          ; 5072   0200 0031

        JSR     R5,     L_69A7                  ; 5074   0004 0168 01A7
        JSR     R5,     L_69FC                  ; 5077   0004 0168 01FC

        B       L_507F                          ; 507A   0200 0003

        JSR     R5,     L_5C40                  ; 507C   0004 015C 0040
L_507F:
        JSR     R5,     L_6974                  ; 507F   0004 0168 0174
        JSR     R5,     L_51FD                  ; 5082   0004 0150 01FD

        B       L_50A5                          ; 5085   0200 001E

        JSR     R5,     L_6974                  ; 5087   0004 0168 0174
        JSR     R5,     L_5883                  ; 508A   0004 0158 0083
        JSR     R5,     L_5A07                  ; 508D   0004 0158 0207
        DECLE   $0004,  $01A0,  $03D7           ; 5090   0004 01A0 03D7

        JSR     R5,     L_5B0F                  ; 5093   0004 0158 030F
        JSR     R5,     L_5BC3                  ; 5096   0004 0158 03C3

        MVI     G_01B6, R0                      ; 5099   0280 01B6
        CMPI    #$0007, R0                      ; 509B   0378 0007
        BNEQ    L_50A5                          ; 509D   020C 0006

        JSR     R5,     L_68C9                  ; 509F   0004 0168 00C9
        JSR     R5,     L_68FE                  ; 50A2   0004 0168 00FE
L_50A5:
        JSR     R5,     L_50B9                  ; 50A5   0004 0150 00B9
        DECLE   $0004                           ; 50A8   0004

        ANDR    R5,     R4                      ; 50A9   01AC
        ANDR    R6,     R4                      ; 50AA   01B4
        MVII    #$0001, R0                      ; 50AB   02B8 0001

        JSR     R5,     X_RAND1                 ; 50AD   0004 0114 027D
        JSR     R5,     L_5254                  ; 50B0   0004 0150 0254

        RLC     R2,     1                       ; 50B3   0052
        SLR     R2,     1                       ; 50B4   0062
        MOVR    R5,     R0                      ; 50B5   00A8
        SLR     R1,     1                       ; 50B6   0061
        SARC    R0,     2                       ; 50B7   007C
        SLR     R0,     1                       ; 50B8   0060
L_50B9:
        MVI     G_01DA, R0                      ; 50B9   0280 01DA
        DECR    R0                              ; 50BB   0010
        MVO     R0,     G_01DA                  ; 50BC   0240 01DA
        MOVR    R5,     R7                      ; 50BE   00AF

        PSHR    R5                              ; 50BF   0275
L_50C0:
        MVI     G_01DC, R0                      ; 50C0   0280 01DC
        CMPI    #$0001, R0                      ; 50C2   0378 0001
        BEQ     L_5196                          ; 50C4   0204 00D0

        MVI     G_015D, R0                      ; 50C6   0280 015D
        MVI     G_01D3, R1                      ; 50C8   0281 01D3
        MVI     G_01D4, R2                      ; 50CA   0282 01D4
        CMPI    #$0002, R0                      ; 50CC   0378 0002
        BEQ     L_50D1                          ; 50CE   0204 0001

        MOVR    R1,     R2                      ; 50D0   008A
L_50D1:
        MVI     G_01DB, R0                      ; 50D1   0280 01DB
        CMPR    R1,     R2                      ; 50D3   014A
        BEQ     L_50E4                          ; 50D4   0204 000E

        CMPI    #$0001, R1                      ; 50D6   0379 0001
        BGT     L_50EC                          ; 50D8   020E 0012

        CMPI    #$0001, R2                      ; 50DA   037A 0001
        BGT     L_50EC                          ; 50DC   020E 000E

L_50DE:
        CMPI    #$0002, R0                      ; 50DE   0378 0002
        BNEQ    L_5145                          ; 50E0   020C 0063
        B       L_50F0                          ; 50E2   0200 000C

L_50E4:
        CMPI    #$0000, R1                      ; 50E4   0379 0000
        BEQ     L_5154                          ; 50E6   0204 006C

        CMPI    #$0001, R1                      ; 50E8   0379 0001
        BEQ     L_50DE                          ; 50EA   0224 000D

L_50EC:
        CMPI    #$0001, R0                      ; 50EC   0378 0001
        BNEQ    L_514A                          ; 50EE   020C 005A

L_50F0:
        MVI     G_01D3, R1                      ; 50F0   0281 01D3
        MVI     G_01D4, R2                      ; 50F2   0282 01D4
        MVII    #$0001, R3                      ; 50F4   02BB 0001
        MVI     G_015D, R0                      ; 50F6   0280 015D
        CMPI    #$0001, R0                      ; 50F8   0378 0001
        BEQ     L_5108                          ; 50FA   0204 000C

        CMPI    #$0002, R1                      ; 50FC   0379 0002
        BEQ     L_510E                          ; 50FE   0204 000E

        CMPI    #$0002, R2                      ; 5100   037A 0002
        BNEQ    L_511F                          ; 5102   020C 001B

L_5104:
        MVO     R3,     G_015E                  ; 5104   0243 015E
        B       L_5122                          ; 5106   0200 001A

L_5108:
        CMPI    #$0002, R1                      ; 5108   0379 0002
        BNEQ    L_511F                          ; 510A   020C 0013
        B       L_5122                          ; 510C   0200 0014

L_510E:
        CMPI    #$0002, R2                      ; 510E   037A 0002
        BEQ     L_5116                          ; 5110   0204 0004

L_5112:
        MVII    #$0000, R3                      ; 5112   02BB 0000
        B       L_5104                          ; 5114   0220 0011

L_5116:
        MVI     G_01B4, R1                      ; 5116   0281 01B4
        MVI     G_01B5, R2                      ; 5118   0282 01B5
        CMPR    R1,     R2                      ; 511A   014A
        BLT     L_5104                          ; 511B   0225 0018
        B       L_5112                          ; 511D   0220 000C

L_511F:
        JSR     R5,     L_6DD9                  ; 511F   0004 016C 01D9

L_5122:
        MVI     G_015E, R1                      ; 5122   0281 015E
        MOVR    R1,     R2                      ; 5124   008A
        ADDI    #$01D3, R1                      ; 5125   02F9 01D3
        MVI@    R1,     R0                      ; 5127   0288
        CMPI    #$0002, R0                      ; 5128   0378 0002
        BEQ     L_5136                          ; 512A   0204 000A

        ADDI    #$01C6, R2                      ; 512C   02FA 01C6
        MVI@    R2,     R0                      ; 512E   0290
        CMPI    #$000D, R0                      ; 512F   0378 000D
        BNEQ    L_5136                          ; 5131   020C 0003

        MVII    #$0000, R0                      ; 5133   02B8 0000
        MVO@    R0,     R2                      ; 5135   0250

L_5136:
        JSR     R5,     L_594C                  ; 5136   0004 0158 014C
        JSR     R5,     L_6D4A                  ; 5139   0004 016C 014A
        BIDECLE $0011                           ; 513C   0011 0000

        JSR     R5,     L_684E                  ; 513E   0004 0168 004E
        JSR     R5,     L_68C9                  ; 5141   0004 0168 00C9

        PULR    R7                              ; 5144   02B7

L_5145:
        JSR     R5,     L_6C14                  ; 5145   0004 016C 0014

        B       L_50F0                          ; 5148   0220 0059

L_514A:
        JSR     R5,     L_6D4A                  ; 514A   0004 016C 014A
        BIDECLE $1E1F                           ; 514D   001F 001E

        JSR     R5,     L_57AB                  ; 514F   0004 0154 03AB

        B       L_50F0                          ; 5152   0220 0063

L_5154:
        JSR     R5,     L_560F                  ; 5154   0004 0154 020F

        MVI     G_0162, R0                      ; 5157   0280 0162
        MVII    #$0009, R1                      ; 5159   02B9 0009
        MVI     G_0161, R2                      ; 515B   0282 0161
        CMPI    #$0000, R0                      ; 515D   0378 0000
        BEQ     L_5163                          ; 515F   0204 0002

        ADDI    #$0009, R1                      ; 5161   02F9 0009
L_5163:
        INCR    R2                              ; 5163   000A
        CMPR    R1,     R2                      ; 5164   014A
        BGT     L_5172                          ; 5165   020E 000B

        MVO     R2,     G_0161                  ; 5167   0242 0161
        MVI     G_01DC, R0                      ; 5169   0280 01DC
        CMPI    #$0002, R0                      ; 516B   0378 0002
        BEQ     L_51D9                          ; 516D   0204 006A
        J       L_64C1                          ; 516F   0004 0364 00C1

L_5172:
        JSR     R5,     L_54C8                  ; 5172   0004 0154 00C8
        DECLE   $02B8,  $000F,  $0240,  $01B6   ; 5175   02B8 000F 0240 01B6
        DECLE   $02B8,  $0007,  $0004           ; 5179   02B8 0007 0004

        ANDR    R4,     R0                      ; 517C   01A0
L_517D:
        BGT     L_517D                          ; 517D   022E 0001

        MOVR    R7,     R4                      ; 517F   00BC
        ADDI    #$0005, R4                      ; 5180   02FC 0005
        J       L_580E                          ; 5182   0004 0358 000E

        SETC                                    ; 5185   0007
        BLE     L_51CF                          ; 5186   0206 0047

        SWAP    R1,     1                       ; 5188   0041
        SLL     R1,     2                       ; 5189   004D
        SWAP    R1,     2                       ; 518A   0045
        NEGR    R0                              ; 518B   0020
        SLL     R3,     2                       ; 518C   004F
        RLC     R2,     2                       ; 518D   0056
        SWAP    R1,     2                       ; 518E   0045
        RLC     R2,     1                       ; 518F   0052
        EIS                                     ; 5190   0002
        PSHR    R5                              ; 5191   0275
L_5192:
        CLRR    R0                              ; 5192   01C0
        J       L_6350                          ; 5193   0004 0360 0350

L_5196:
        JSR     R5,     L_6D77                  ; 5196   0004 016C 0177

        MVO     R0,     G_015F                  ; 5199   0240 015F
        SWAP    R0,     1                       ; 519B   0040
        MVO     R0,     G_0160                  ; 519C   0240 0160
        MVI     G_015E, R1                      ; 519E   0281 015E
        XORI    #$0001, R1                      ; 51A0   03F9 0001
        MVO     R1,     G_015E                  ; 51A2   0241 015E
        BNEQ    L_51C6                          ; 51A4   020C 0020

        JSR     R5,     L_6F66                  ; 51A6   0004 016C 0366

        MVI     G_01EB, R0                      ; 51A9   0280 01EB
        DECR    R0                              ; 51AB   0010
        MVO     R0,     G_01EB                  ; 51AC   0240 01EB
        BNEQ    L_51C6                          ; 51AE   020C 0016

        JSR     R5,     L_548C                  ; 51B0   0004 0154 008C
        JSR     R5,     L_6924                  ; 51B3   0004 0168 0124

        MVII    #$0002, R0                      ; 51B6   02B8 0002
        MVO     R0,     G_01EB                  ; 51B8   0240 01EB

        JSR     R5,     L_5644                  ; 51BA   0004 0154 0244

        MVII    #$0006, R0                      ; 51BD   02B8 0006
        MVII    #$0002, R1                      ; 51BF   02B9 0002
        MVII    #$01D3, R4                      ; 51C1   02BC 01D3

        JSR     R5,     X_FILL_MEM              ; 51C3   0004 0114 0341
L_51C6:
        JSR     R5,     L_6D4A                  ; 51C6   0004 016C 014A
        BIDECLE $0C19                           ; 51C9   0019 000C

        JSR     R5,     L_51EF                  ; 51CB   0004 0150 01EF
        DECLE   $0028                           ; 51CE   0028
L_51CF:
        JSR     R5,     L_594C                  ; 51CF   0004 0158 014C
        JSR     R5,     L_684E                  ; 51D2   0004 0168 004E
        JSR     R5,     L_68C9                  ; 51D5   0004 0168 00C9

        PULR    R7                              ; 51D8   02B7

L_51D9:
        JSR     R5,     L_549C                  ; 51D9   0004 0154 009C

        SDBD                                    ; 51DC   0001
        MVII    #$9000, R3                      ; 51DD   02BB 0000 0090

        JSR     R5,     L_5349                  ; 51E0   0004 0150 0349
        DECLE   $0037                           ; 51E3   0037

        JSR     R5,     L_698D                  ; 51E4   0004 0168 018D
        JSR     R5,     L_6F7E                  ; 51E7   0004 016C 037E
        JSR     R5,     L_6DAA                  ; 51EA   0004 016C 01AA

        B       L_51C6                          ; 51ED   0220 0028

L_51EF:
        MVI     G_01B6, R0                      ; 51EF   0280 01B6
        MVO     R0,     G_01B7                  ; 51F1   0240 01B7
        MVII    #$000D, R0                      ; 51F3   02B8 000D
        MVO     R0,     G_01B6                  ; 51F5   0240 01B6
        MVI@    R5,     R0                      ; 51F7   02A8
        MVO     R0,     G_01E5                  ; 51F8   0240 01E5
        MVO     R5,     G_035A                  ; 51FA   0245 035A
        PULR    R7                              ; 51FC   02B7

L_51FD:
        PSHR    R5                              ; 51FD   0275
        MVI     G_01E5, R0                      ; 51FE   0280 01E5
        DECR    R0                              ; 5200   0010
        BMI     L_520D                          ; 5201   020B 000A

        MVO     R0,     G_01E5                  ; 5203   0240 01E5
        BNEQ    L_520D                          ; 5205   020C 0006

        MVI     G_01B7, R0                      ; 5207   0280 01B7
        MVO     R0,     G_01B6                  ; 5209   0240 01B6
        MVI     G_035A, R7                      ; 520B   0287 035A
L_520D:
        PULR    R7                              ; 520D   02B7

        MVI@    R5,     R4                      ; 520E   02AC
        MVO     R4,     G_0109                  ; 520F   0244 0109
        ADDI    #$0006, R4                      ; 5211   02FC 0006
        MVI@    R4,     R4                      ; 5213   02A4
        MVO     R4,     G_010A                  ; 5214   0244 010A
L_5216:
        MOVR    R5,     R7                      ; 5216   00AF

        DECLE   $0000                           ; 5217   0000
L_5218:
        SDBD                                    ; 5218   0001
        MVI@    R5,     R0                      ; 5219   02A8
        MVO     R0,     G_0336                  ; 521A   0240 0336
        MOVR    R5,     R7                      ; 521C   00AF

L_521D:
        SDBD                                    ; 521D   0001
        MVI@    R5,     R0                      ; 521E   02A8
        MVO     R0,     .ISRVEC.0               ; 521F   0240 0100
        SWAP    R0,     1                       ; 5221   0040
        MVO     R0,     .ISRVEC.1               ; 5222   0240 0101
        MOVR    R5,     R7                      ; 5224   00AF

L_5225:
        PSHR    R5                              ; 5225   0275
        MVI     .ISRVEC.0,R1                    ; 5226   0281 0100
        SWAP    R1,     1                       ; 5228   0041
        XOR     .ISRVEC.1,R1                    ; 5229   03C1 0101
        MOVR    R7,     R0                      ; 522B   00B8
        ADDI    #$0008, R0                      ; 522C   02F8 0008
        MVO     R0,     .ISRVEC.0               ; 522E   0240 0100
        SWAP    R0,     1                       ; 5230   0040
        MVO     R0,     .ISRVEC.1               ; 5231   0240 0101
L_5233:
        DECR    R7                              ; 5233   0017

        SUBI    #$0008, R6                      ; 5234   033E 0008
        MVO     R1,     .ISRVEC.1               ; 5236   0241 0101
        SWAP    R1,     1                       ; 5238   0041
        MVO     R1,     .ISRVEC.0               ; 5239   0241 0100
        PULR    R7                              ; 523B   02B7

L_523C:
        MVI@    R5,     R1                      ; 523C   02A9
        TSTR    R1                              ; 523D   0089
        BEQ     L_5216                          ; 523E   0224 0029

        MVI@    R5,     R0                      ; 5240   02A8
        MVO@    R0,     R1                      ; 5241   0248
L_5242:
        B       L_523C                          ; 5242   0220 0007

L_5244:
        MVI@    R5,     R1                      ; 5244   02A9
        DECLE   $0089,  $0224,  $0031,  $0001   ; 5245   0089 0224 0031 0001

        MVI@    R5,     R0                      ; 5249   02A8
        MVO@    R0,     R1                      ; 524A   0248
        B       L_5244                          ; 524B   0220 0008

L_524D:
        EIS                                     ; 524D   0002
        MVI     G_0102, R0                      ; 524E   0280 0102
        DECR    R0                              ; 5250   0010
        BPL     L_524D                          ; 5251   0223 0005
        MOVR    R5,     R7                      ; 5253   00AF

L_5254:
        MVII    #$0001, R0                      ; 5254   02B8 0001
        MVO     R0,     G_0102                  ; 5256   0240 0102
        MVI     G_0336, R7                      ; 5258   0287 0336

L_525A:
        MVI@    R5,     R0                      ; 525A   02A8
L_525B:
        INCR    R0                              ; 525B   0008
        MVO     R0,     G_0107                  ; 525C   0240 0107
L_525E:
        EIS                                     ; 525E   0002
        MVI     G_0107, R0                      ; 525F   0280 0107
        TSTR    R0                              ; 5261   0080
        BNEQ    L_525E                          ; 5262   022C 0005
        MOVR    R5,     R7                      ; 5264   00AF

L_5265:
        PSHR    R5                              ; 5265   0275
        MOVR    R1,     R5                      ; 5266   008D
L_5267:
        MVI@    R4,     R1                      ; 5267   02A1
        MVO@    R1,     R5                      ; 5268   0269
        MVI@    R4,     R1                      ; 5269   02A1
        MVO@    R1,     R5                      ; 526A   0269
        MVI@    R4,     R1                      ; 526B   02A1
        MVO@    R1,     R5                      ; 526C   0269
        MVI@    R4,     R1                      ; 526D   02A1
        MVO@    R1,     R5                      ; 526E   0269
        MVI@    R4,     R1                      ; 526F   02A1
        MVO@    R1,     R5                      ; 5270   0269
        MVI@    R4,     R1                      ; 5271   02A1
        MVO@    R1,     R5                      ; 5272   0269
        MVI@    R4,     R1                      ; 5273   02A1
        MVO@    R1,     R5                      ; 5274   0269
        MVI@    R4,     R1                      ; 5275   02A1
        MVO@    R1,     R5                      ; 5276   0269
        DECR    R0                              ; 5277   0010
        BPL     L_5267                          ; 5278   0223 0012
        PULR    R7                              ; 527A   02B7

L_527B:
        PSHR    R5                              ; 527B   0275
        CLRR    R2                              ; 527C   01D2
        CLRR    R3                              ; 527D   01DB
        CMPI    #$000A, R1                      ; 527E   0379 000A
        BLT     L_5298                          ; 5280   0205 0016

        CMPI    #$0064, R1                      ; 5282   0379 0064
        BLT     L_528F                          ; 5284   0205 0009

L_5286:
        SUBI    #$0064, R1                      ; 5286   0339 0064
        BMI     L_528D                          ; 5288   020B 0003

        INCR    R3                              ; 528A   000B
        B       L_5286                          ; 528B   0220 0006

L_528D:
        ADDI    #$0064, R1                      ; 528D   02F9 0064
L_528F:
        SUBI    #$000A, R1                      ; 528F   0339 000A
        BMI     L_5296                          ; 5291   020B 0003

        INCR    R2                              ; 5293   000A
        B       L_528F                          ; 5294   0220 0006

L_5296:
        ADDI    #$000A, R1                      ; 5296   02F9 000A
L_5298:
        TSTR    R0                              ; 5298   0080
        BEQ     L_529E                          ; 5299   0204 0003

        PSHR    R3                              ; 529B   0273
        SLL     R3,     2                       ; 529C   004F
        ADD@    R6,     R3                      ; 529D   02F3
L_529E:
        PSHR    R2                              ; 529E   0272
        SLL     R2,     2                       ; 529F   004E
        ADD@    R6,     R2                      ; 52A0   02F2
        PSHR    R1                              ; 52A1   0271
        SLL     R1,     2                       ; 52A2   004D
        ADD@    R6,     R1                      ; 52A3   02F1
        SDBD                                    ; 52A4   0001
        ADDI    #$A659, R1                      ; 52A5   02F9 0059 00A6
        SDBD                                    ; 52A8   0001
        ADDI    #$A659, R2                      ; 52A9   02FA 0059 00A6
        TSTR    R0                              ; 52AC   0080
        BEQ     L_52BD                          ; 52AD   0204 000E

        SDBD                                    ; 52AF   0001
        ADDI    #$A659, R3                      ; 52B0   02FB 0059 00A6
        SDBD                                    ; 52B3   0001
        CMPI    #$A659, R3                      ; 52B4   037B 0059 00A6
        BNEQ    L_52C7                          ; 52B7   020C 000E

        SDBD                                    ; 52B9   0001
        MVII    #$A7D6, R3                      ; 52BA   02BB 00D6 00A7
L_52BD:
        SDBD                                    ; 52BD   0001
        CMPI    #$A659, R2                      ; 52BE   037A 0059 00A6
        BNEQ    L_52C7                          ; 52C1   020C 0004

        SDBD                                    ; 52C3   0001
        MVII    #$A7D6, R2                      ; 52C4   02BA 00D6 00A7
L_52C7:
        SDBD                                    ; 52C7   0001
        CMPI    #$3800, R4                      ; 52C8   037C 0000 0038
        BLT     L_52CE                          ; 52CB   0205 0001

        INCR    R4                              ; 52CD   000C
L_52CE:
        MVII    #$0005, R5                      ; 52CE   02BD 0005
        TSTR    R0                              ; 52D0   0080
        BEQ     L_52E3                          ; 52D1   0204 0010

L_52D3:
        MVI@    R3,     R0                      ; 52D3   0298
        MVO@    R0,     R4                      ; 52D4   0260
        INCR    R3                              ; 52D5   000B
        DECR    R5                              ; 52D6   0015
        BNEQ    L_52D3                          ; 52D7   022C 0005

        SDBD                                    ; 52D9   0001
        CMPI    #$3800, R4                      ; 52DA   037C 0000 0038
        BLT     L_52E1                          ; 52DD   0205 0002

        ADDI    #$0003, R4                      ; 52DF   02FC 0003
L_52E1:
        MVII    #$0005, R5                      ; 52E1   02BD 0005
L_52E3:
        MVI@    R2,     R0                      ; 52E3   0290
        SLL     R0,     2                       ; 52E4   004C
        SLL     R0,     2                       ; 52E5   004C
        XORI    #$000F, R0                      ; 52E6   03F8 000F
        AND@    R1,     R0                      ; 52E8   0388
        MVO@    R0,     R4                      ; 52E9   0260
        INCR    R2                              ; 52EA   000A
        INCR    R1                              ; 52EB   0009
        DECR    R5                              ; 52EC   0015
        BNEQ    L_52E3                          ; 52ED   022C 000B

        SDBD                                    ; 52EF   0001
        CMPI    #$3800, R4                      ; 52F0   037C 0000 0038
        BLT     L_52F7                          ; 52F3   0205 0002

        ADDI    #$0002, R4                      ; 52F5   02FC 0002
L_52F7:
        PULR    R7                              ; 52F7   02B7

L_52F8:
        PSHR    R5                              ; 52F8   0275
        MVII    #$00FF, R3                      ; 52F9   02BB 00FF
        MOVR    R1,     R5                      ; 52FB   008D
L_52FC:
        MVO@    R3,     R4                      ; 52FC   0263
        MVI@    R5,     R1                      ; 52FD   02A9
        MVO@    R1,     R4                      ; 52FE   0261
        MVI@    R5,     R1                      ; 52FF   02A9
        MVO@    R1,     R4                      ; 5300   0261
        MVI@    R5,     R1                      ; 5301   02A9
        MVO@    R1,     R4                      ; 5302   0261
        MVI@    R5,     R1                      ; 5303   02A9
        MVO@    R1,     R4                      ; 5304   0261
        MVI@    R5,     R1                      ; 5305   02A9
        MVO@    R1,     R4                      ; 5306   0261
        MVO@    R3,     R4                      ; 5307   0263
        MVO@    R3,     R4                      ; 5308   0263
        DECR    R0                              ; 5309   0010
        BNEQ    L_52FC                          ; 530A   022C 000F

        MOVR    R5,     R1                      ; 530C   00A9
        PULR    R7                              ; 530D   02B7

L_530E:
        PSHR    R5                              ; 530E   0275
        MVII    #$0163, R1                      ; 530F   02B9 0163
        MVII    #$0181, R2                      ; 5311   02BA 0181
L_5313:
        PSHR    R2                              ; 5313   0272
        MVII    #$0009, R2                      ; 5314   02BA 0009
        CLRR    R4                              ; 5316   01E4
L_5317:
        MVI@    R1,     R0                      ; 5317   0288
        INCR    R1                              ; 5318   0009

        JSR     R5,     L_5476                  ; 5319   0004 0154 0076
        JSR     R5,     L_5331                  ; 531C   0004 0150 0331

        EIS                                     ; 531F   0002
        ADDR    R3,     R4                      ; 5320   00DC
        DECR    R2                              ; 5321   0012
        BNEQ    L_5317                          ; 5322   022C 000C

        PULR    R2                              ; 5324   02B2
        MVO@    R4,     R2                      ; 5325   0254
        INCR    R2                              ; 5326   000A
        CMPI    #$0182, R2                      ; 5327   037A 0182
        BLE     L_5313                          ; 5329   0226 0017

        SUBI    #$0002, R2                      ; 532B   033A 0002
        ADD@    R2,     R4                      ; 532D   02D4
        MVO     R4,     G_0183                  ; 532E   0244 0183
        PULR    R7                              ; 5330   02B7

L_5331:
        PSHR    R5                              ; 5331   0275

        JSR     R5,     L_54B7                  ; 5332   0004 0154 00B7

        PULR    R5                              ; 5335   02B5
        MVI     G_01E2, R3                      ; 5336   0283 01E2
L_5338:
        DECR    R3                              ; 5338   0013
        BMI     L_533F                          ; 5339   020B 0004

        SUBI    #$0021, R0                      ; 533B   0338 0021
        B       L_5338                          ; 533D   0220 0006

L_533F:
        SDBD                                    ; 533F   0001
        MVII    #$9081, R3                      ; 5340   02BB 0081 0090
L_5343:
        DECR    R0                              ; 5343   0010
        BMI     L_5349                          ; 5344   020B 0003

        ADD@    R3,     R3                      ; 5346   02DB
        B       L_5343                          ; 5347   0220 0005

L_5349:
        MVI@    R5,     R0                      ; 5349   02A8
        PSHR    R5                              ; 534A   0275
        CMPI    #$0037, R0                      ; 534B   0378 0037
        BEQ     L_5361                          ; 534D   0204 0012

        ADDR    R0,     R3                      ; 534F   00C3
        CMPI    #$0012, R0                      ; 5350   0378 0012
        BEQ     L_535D                          ; 5352   0204 0009

        CMPI    #$0009, R0                      ; 5354   0378 0009
        BEQ     L_535D                          ; 5356   0204 0005

        MVI@    R3,     R3                      ; 5358   029B
        CMPI    #$0002, R0                      ; 5359   0378 0002
        BEQ     L_535E                          ; 535B   0204 0001
L_535D:
        PULR    R7                              ; 535D   02B7

L_535E:
        ANDI    #$0007, R3                      ; 535E   03BB 0007
        PULR    R7                              ; 5360   02B7

L_5361:
        INCR    R3                              ; 5361   000B
        MVII    #$0175, R4                      ; 5362   02BC 0175
        MVI@    R3,     R0                      ; 5364   0298
        MVO@    R0,     R4                      ; 5365   0260
        SWAP    R0,     1                       ; 5366   0040
        MVO@    R0,     R4                      ; 5367   0260
        INCR    R3                              ; 5368   000B
        MVI@    R3,     R0                      ; 5369   0298
        MOVR    R0,     R2                      ; 536A   0082
        ANDI    #$0007, R0                      ; 536B   03B8 0007
        XORR    R0,     R2                      ; 536D   01C2
        SLR     R2,     2                       ; 536E   0066
        SLR     R2,     1                       ; 536F   0062
        MVO@    R0,     R4                      ; 5370   0260
        MVO@    R2,     R4                      ; 5371   0262
        MVII    #$0002, R2                      ; 5372   02BA 0002
L_5374:
        INCR    R3                              ; 5374   000B
        MVI@    R3,     R0                      ; 5375   0298
        MVO@    R0,     R4                      ; 5376   0260
        DECR    R2                              ; 5377   0012
        BNEQ    L_5374                          ; 5378   022C 0005

        PSHR    R4                              ; 537A   0274
        MVII    #$0002, R2                      ; 537B   02BA 0002
        MVII    #$0354, R4                      ; 537D   02BC 0354
L_537F:
        INCR    R3                              ; 537F   000B
        MVI@    R3,     R0                      ; 5380   0298
        SWAP    R0,     1                       ; 5381   0040
        MVO@    R0,     R4                      ; 5382   0260
        DECR    R2                              ; 5383   0012
        BNEQ    L_537F                          ; 5384   022C 0006

        MVII    #$0002, R2                      ; 5386   02BA 0002
        MVI     G_01DC, R1                      ; 5388   0281 01DC
L_538A:
        INCR    R3                              ; 538A   000B
        MVII    #$0006, R0                      ; 538B   02B8 0006
        CMPI    #$0000, R1                      ; 538D   0379 0000
        BEQ     L_539A                          ; 538F   0204 0009

        MVII    #$0009, R0                      ; 5391   02B8 0009
        CMPI    #$0002, R1                      ; 5393   0379 0002
        BEQ     L_539A                          ; 5395   0204 0003

        CLRR    R0                              ; 5397   01C0
        B       L_539D                          ; 5398   0200 0003

L_539A:
        JSR     R5,     X_RAND2                 ; 539A   0004 0114 029E

L_539D:
        ADD@    R3,     R0                      ; 539D   02D8
        SWAP    R0,     1                       ; 539E   0040
        MVO@    R0,     R4                      ; 539F   0260
        DECR    R2                              ; 53A0   0012
        BNEQ    L_538A                          ; 53A1   022C 0018

        PULR    R4                              ; 53A3   02B4
        INCR    R3                              ; 53A4   000B
        MVO@    R3,     R4                      ; 53A5   0263
        SWAP    R3,     1                       ; 53A6   0043
        MVO@    R3,     R4                      ; 53A7   0263
        SWAP    R3,     1                       ; 53A8   0043
        ADDI    #$0009, R3                      ; 53A9   02FB 0009
        MVO@    R3,     R4                      ; 53AB   0263
        SWAP    R3,     1                       ; 53AC   0043
        MVO@    R3,     R4                      ; 53AD   0263
        MVI     G_01E2, R0                      ; 53AE   0280 01E2
        CMPI    #$0001, R0                      ; 53B0   0378 0001
        BLT     L_541D                          ; 53B2   0205 0069
        BNEQ    L_53E6                          ; 53B4   020C 0030

        MVII    #$0178, R1                      ; 53B6   02B9 0178
        MVI@    R1,     R0                      ; 53B8   0288
        ADDI    #$0010, R0                      ; 53B9   02F8 0010
        ANDI    #$001F, R0                      ; 53BB   03B8 001F
        MVO@    R0,     R1                      ; 53BD   0248
        MVII    #$0179, R1                      ; 53BE   02B9 0179
        MVII    #$00EF, R2                      ; 53C0   02BA 00EF
        SUB@    R1,     R2                      ; 53C2   030A
        SUBI    #$002A, R2                      ; 53C3   033A 002A
        MVO@    R2,     R1                      ; 53C5   024A
        INCR    R1                              ; 53C6   0009
        MVII    #$00EF, R2                      ; 53C7   02BA 00EF
        SUB@    R1,     R2                      ; 53C9   030A
        SUBI    #$0067, R2                      ; 53CA   033A 0067
        MVO@    R2,     R1                      ; 53CC   024A
        MVII    #$0002, R0                      ; 53CD   02B8 0002
        MVII    #$0354, R1                      ; 53CF   02B9 0354
L_53D1:
        MVI@    R1,     R3                      ; 53D1   028B
        SWAP    R3,     1                       ; 53D2   0043
        MVII    #$00AF, R2                      ; 53D3   02BA 00AF
        SUBR    R3,     R2                      ; 53D5   011A
        SWAP    R2,     1                       ; 53D6   0042
        MVO@    R2,     R1                      ; 53D7   024A
        INCR    R1                              ; 53D8   0009
        MVI@    R1,     R3                      ; 53D9   028B
        SWAP    R3,     1                       ; 53DA   0043
        MVII    #$006F, R2                      ; 53DB   02BA 006F
        SUBR    R3,     R2                      ; 53DD   011A
        SWAP    R2,     1                       ; 53DE   0042
        MVO@    R2,     R1                      ; 53DF   024A
        INCR    R1                              ; 53E0   0009
        DECR    R0                              ; 53E1   0010
        BNEQ    L_53D1                          ; 53E2   022C 0012
        B       L_541D                          ; 53E4   0200 0037

L_53E6:
        MVII    #$0178, R3                      ; 53E6   02BB 0178
        MVI@    R3,     R2                      ; 53E8   029A
        SLR     R2,     2                       ; 53E9   0066
        SDBD                                    ; 53EA   0001
        ADDI    #$5429, R2                      ; 53EB   02FA 0029 0054
        MVI@    R2,     R2                      ; 53EE   0292
        MVO@    R2,     R3                      ; 53EF   025A
        MVII    #$0179, R3                      ; 53F0   02BB 0179
        MVI@    R3,     R0                      ; 53F2   0298

        JSR     R5,     L_6D5E                  ; 53F3   0004 016C 015E

        MVII    #$006F, R1                      ; 53F6   02B9 006F
        SUBR    R2,     R1                      ; 53F8   0111

        JSR     R5,     L_6D6B                  ; 53F9   0004 016C 016B

        SUBI    #$0028, R0                      ; 53FC   0338 0028
        MVO@    R0,     R3                      ; 53FE   0258
        INCR    R3                              ; 53FF   000B
        MVI@    R3,     R0                      ; 5400   0298

        JSR     R5,     L_6D5E                  ; 5401   0004 016C 015E

        MVII    #$006F, R1                      ; 5404   02B9 006F
        SUBR    R2,     R1                      ; 5406   0111

        JSR     R5,     L_6D6B                  ; 5407   0004 016C 016B

        SUBI    #$0064, R0                      ; 540A   0338 0064
        MVO@    R0,     R3                      ; 540C   0258
        MVII    #$0355, R3                      ; 540D   02BB 0355
        MVII    #$0002, R4                      ; 540F   02BC 0002
L_5411:
        MVI@    R3,     R0                      ; 5411   0298
        SWAP    R0,     1                       ; 5412   0040
        MVII    #$006F, R1                      ; 5413   02B9 006F
        SUBR    R0,     R1                      ; 5415   0101
        SWAP    R1,     1                       ; 5416   0041
        MVO@    R1,     R3                      ; 5417   0259
        ADDI    #$0002, R3                      ; 5418   02FB 0002
        DECR    R4                              ; 541A   0014
        BNEQ    L_5411                          ; 541B   022C 000B

L_541D:
        MVI     G_0179, R0                      ; 541D   0280 0179

        JSR     R5,     L_6D5E                  ; 541F   0004 016C 015E

        SLL     R0,     2                       ; 5422   004C
        SLL     R2,     2                       ; 5423   004E
        MVO     R0,     G_0358                  ; 5424   0240 0358
        MVO     R2,     G_0359                  ; 5426   0242 0359
        PULR    R7                              ; 5428   02B7

        DECLE   $0000,  $001C,  $0018,  $0014   ; 5429   0000 001C 0018 0014
        DECLE   $0010,  $000C,  $0008,  $0004   ; 542D   0010 000C 0008 0004
L_5431:
        PSHR    R5                              ; 5431   0275
        MVO     R0,     G_0162                  ; 5432   0240 0162
        MVII    #$0012, R1                      ; 5434   02B9 0012
        MVII    #$0163, R2                      ; 5436   02BA 0163
        CMPI    #$0002, R0                      ; 5438   0378 0002
        BEQ     L_5444                          ; 543A   0204 0008

        MVII    #$0009, R1                      ; 543C   02B9 0009
        CMPI    #$0000, R0                      ; 543E   0378 0000
        BEQ     L_5444                          ; 5440   0204 0002

        ADDI    #$0009, R2                      ; 5442   02FA 0009
L_5444:
        MVI@    R2,     R0                      ; 5444   0290
        TSTR    R0                              ; 5445   0080
        BEQ     L_544E                          ; 5446   0204 0006

        INCR    R2                              ; 5448   000A
        DECR    R1                              ; 5449   0011
        BNEQ    L_5444                          ; 544A   022C 0007

        CLRC                                    ; 544C   0006
        PULR    R7                              ; 544D   02B7

L_544E:
        SUBI    #$0163, R2                      ; 544E   033A 0163
        INCR    R2                              ; 5450   000A
        MVII    #$0002, R3                      ; 5451   02BB 0002
        MVII    #$02DD, R4                      ; 5453   02BC 02DD

        JSR     R5,     X_PRINT_R5              ; 5455   0004 0118 007B
        STRING  "Hole"                          ; 5458   0048 006F 006C 0065
        DECLE   $0000                           ; 545C   0000

        INCR    R4                              ; 545D   000C
        MVII    #$0002, R1                      ; 545E   02B9 0002
        MOVR    R2,     R0                      ; 5460   0090

        JSR     R5,     X_PRNUM_RGT             ; 5461   0004 0118 00C5

        ADDI    #$0003, R4                      ; 5464   02FC 0003

        JSR     R5,     X_PRINT_R5              ; 5466   0004 0118 007B
        STRING  "not saved."                    ; 5469  
        DECLE   $0000                           ; 5473   0000

        SETC                                    ; 5474   0007
        PULR    R7                              ; 5475   02B7

L_5476:
        PSHR    R5                              ; 5476   0275
        PSHR    R0                              ; 5477   0270

        JSR     R5,     L_54B7                  ; 5478   0004 0154 00B7

        CLRR    R5                              ; 547B   01ED
        CMPI    #$0021, R0                      ; 547C   0378 0021
        BLE     L_5488                          ; 547E   0206 0008

        MVII    #$0001, R5                      ; 5480   02BD 0001
        CMPI    #$0042, R0                      ; 5482   0378 0042
        BLE     L_5488                          ; 5484   0206 0002

        MVII    #$0002, R5                      ; 5486   02BD 0002
L_5488:
        MVO     R5,     G_01E2                  ; 5488   0245 01E2
        PULR    R0                              ; 548A   02B0
        PULR    R7                              ; 548B   02B7

L_548C:
        PSHR    R5                              ; 548C   0275
        MVII    #$0003, R0                      ; 548D   02B8 0003

        JSR     R5,     X_RAND1                 ; 548F   0004 0114 027D

        MVO     R0,     G_01E9                  ; 5492   0240 01E9
        MVII    #$0005, R0                      ; 5494   02B8 0005

        JSR     R5,     X_RAND2                 ; 5496   0004 0114 029E

        MVO     R0,     G_01EA                  ; 5499   0240 01EA
        PULR    R7                              ; 549B   02B7

L_549C:
        PSHR    R5                              ; 549C   0275
        MVII    #$0003, R0                      ; 549D   02B8 0003

        JSR     R5,     X_RAND1                 ; 549F   0004 0114 027D

        MVO     R0,     G_017F                  ; 54A2   0240 017F
        PULR    R7                              ; 54A4   02B7

        DECLE   $0008,  $0000,  $0010,  $0019   ; 54A5   0008 0000 0010 0019
        DECLE   $0018,  $0032,  $0029,  $03F0   ; 54A9   0018 0032 0029 03F0
        DECLE   $003A,  $0000,  $004B,  $0010   ; 54AD   003A 0000 004B 0010
        DECLE   $0053,  $03CE,  $005B,  $03E7   ; 54B1   0053 03CE 005B 03E7
        DECLE   $0063,  $0000                   ; 54B5   0063 0000
L_54B7:
        PSHR    R5                              ; 54B7   0275
        PSHR    R1                              ; 54B8   0271
        MOVR    R0,     R1                      ; 54B9   0081
        SDBD                                    ; 54BA   0001
        MVII    #$54A5, R5                      ; 54BB   02BD 00A5 0054
L_54BE:
        CMP@    R5,     R1                      ; 54BE   0369
        MVI@    R5,     R0                      ; 54BF   02A8
        BGT     L_54BE                          ; 54C0   022E 0003

        JSR     R5,     X_EXT_SIGN_LO           ; 54C2   0004 0114 0268

        ADDR    R1,     R0                      ; 54C5   00C8
        PULR    R1                              ; 54C6   02B1
        PULR    R7                              ; 54C7   02B7

L_54C8:
        PSHR    R5                              ; 54C8   0275
        CLRR    R0                              ; 54C9   01C0
        MVO     R0,     G_033C                  ; 54CA   0240 033C
        MVII    #$0008, R0                      ; 54CC   02B8 0008
        MVO     R0,     G_01B6                  ; 54CE   0240 01B6

        JSR     R5,     L_682B                  ; 54D0   0004 0168 002B
        JSR     R5,     L_6D41                  ; 54D3   0004 016C 0141

        MVII    #$0000, R0                      ; 54D6   02B8 0000
        MVO     R0,     G_0104                  ; 54D8   0240 0104

        JSR     R5,     L_5225                  ; 54DA   0004 0150 0225

        DIS                                     ; 54DD   0003
        MVII    #$00FF, R1                      ; 54DE   02B9 00FF
        SDBD                                    ; 54E0   0001
        MVII    #$3800, R4                      ; 54E1   02BC 0000 0038
        MVII    #$01F8, R0                      ; 54E4   02B8 01F8

        JSR     R5,     X_FILL_MEM              ; 54E6   0004 0114 0341

        SDBD                                    ; 54E9   0001
        MVII    #$5868, R0                      ; 54EA   02B8 0068 0058
        MVO     R0,     G_0339                  ; 54ED   0240 0339
        SDBD                                    ; 54EF   0001
        MVII    #$5581, R1                      ; 54F0   02B9 0081 0055

        JSR     R5,     L_5656                  ; 54F3   0004 0154 0256

        MVI     G_015D, R0                      ; 54F6   0280 015D
        CMPI    #$0002, R0                      ; 54F8   0378 0002
        BNEQ    L_54FF                          ; 54FA   020C 0003

        JSR     R5,     L_5656                  ; 54FC   0004 0154 0256

L_54FF:
        MVII    #$0163, R1                      ; 54FF   02B9 0163
        MVII    #$022E, R4                      ; 5501   02BC 022E
        MVII    #$0012, R2                      ; 5503   02BA 0012
L_5505:
        MVI@    R1,     R0                      ; 5505   0288

        JSR     R5,     L_5476                  ; 5506   0004 0154 0076

        INCR    R1                              ; 5509   0009

        JSR     R5,     L_5331                  ; 550A   0004 0150 0331

        EIS                                     ; 550D   0002
        SLL     R3,     2                       ; 550E   004F
        SLL     R3,     1                       ; 550F   004B
        SDBD                                    ; 5510   0001
        XORI    #$3A00, R3                      ; 5511   03FB 0000 003A
        MVO@    R3,     R4                      ; 5514   0263
        CMPI    #$0237, R4                      ; 5515   037C 0237
        BNEQ    L_551B                          ; 5517   020C 0002

        MVII    #$02A6, R4                      ; 5519   02BC 02A6
L_551B:
        DECR    R2                              ; 551B   0012
        BNEQ    L_5505                          ; 551C   022C 0018

        MVI     G_0161, R1                      ; 551E   0281 0161
        ADDI    #$0163, R1                      ; 5520   02F9 0163
        DECR    R1                              ; 5522   0011
        MVI@    R1,     R0                      ; 5523   0288

        JSR     R5,     L_5476                  ; 5524   0004 0154 0076

        MVII    #$0256, R4                      ; 5527   02BC 0256
        MVII    #$0190, R5                      ; 5529   02BD 0190
        SDBD                                    ; 552B   0001
        MVII    #$2C00, R3                      ; 552C   02BB 0000 002C
L_552F:
        MVII    #$0009, R0                      ; 552F   02B8 0009
L_5531:
        MVI@    R5,     R2                      ; 5531   02AA
        SLL     R2,     2                       ; 5532   004E
        SLL     R2,     1                       ; 5533   004A
        XORR    R3,     R2                      ; 5534   01DA
        MVO@    R2,     R4                      ; 5535   0262
        DECR    R0                              ; 5536   0010
        BNEQ    L_5531                          ; 5537   022C 0007

        CMPI    #$02EA, R4                      ; 5539   037C 02EA
        BGT     L_5553                          ; 553B   020E 0016

        CMPI    #$0275, R4                      ; 553D   037C 0275
        BGT     L_5545                          ; 553F   020E 0004

        ADDI    #$006F, R4                      ; 5541   02FC 006F
        B       L_552F                          ; 5543   0220 0015

L_5545:
        MVI     G_015D, R0                      ; 5545   0280 015D
        CMPI    #$0002, R0                      ; 5547   0378 0002
        BNEQ    L_5553                          ; 5549   020C 0008

        SDBD                                    ; 554B   0001
        MVII    #$3C00, R3                      ; 554C   02BB 0000 003C
        MVII    #$026A, R4                      ; 554F   02BC 026A
        B       L_552F                          ; 5551   0220 0023

L_5553:
        MVII    #$0029, R0                      ; 5553   02B8 0029
        SDBD                                    ; 5555   0001
        MVII    #$3800, R4                      ; 5556   02BC 0000 0038
        SDBD                                    ; 5559   0001
        MVII    #$A659, R1                      ; 555A   02B9 0059 00A6

        JSR     R5,     L_52F8                  ; 555D   0004 0150 02F8

        SDBD                                    ; 5560   0001
        MVII    #$3948, R4                      ; 5561   02BC 0048 0039
        MVII    #$0181, R5                      ; 5564   02BD 0181
L_5566:
        MVII    #$0000, R0                      ; 5566   02B8 0000
        MVI@    R5,     R1                      ; 5568   02A9
        PSHR    R5                              ; 5569   0275

        JSR     R5,     L_527B                  ; 556A   0004 0150 027B

        PULR    R5                              ; 556D   02B5
        CMPI    #$0183, R5                      ; 556E   037D 0183
        BLE     L_5566                          ; 5570   0226 000B

L_5572:
        MVII    #$0001, R0                      ; 5572   02B8 0001
        SDBD                                    ; 5574   0001
        MVI@    R5,     R1                      ; 5575   02A9
        PSHR    R5                              ; 5576   0275

        JSR     R5,     L_527B                  ; 5577   0004 0150 027B

        PULR    R5                              ; 557A   02B5
        CMPI    #$018E, R5                      ; 557B   037D 018E
        BLE     L_5572                          ; 557D   0226 000C

        EIS                                     ; 557F   0002
        PULR    R7                              ; 5580   02B7

        DECLE   $03B0,  $0015,  $026A,  $027A   ; 5581   03B0 0015 026A 027A
        DECLE   $028A,  $03D0,  $03D0,  $001A   ; 5585   028A 03D0 03D0 001A
        DECLE   $002A,  $003A,  $004A,  $005A   ; 5589   002A 003A 004A 005A
        DECLE   $006A,  $007A,  $008A,  $009A   ; 558D   006A 007A 008A 009A
        DECLE   $000A,  $01FA,  $03B0,  $0029   ; 5591   000A 01FA 03B0 0029
        DECLE   $01A1,  $01B1,  $03B0,  $0038   ; 5595   01A1 01B1 03B0 0038
        DECLE   $0291,  $03B0,  $003D,  $03FE   ; 5599   0291 03B0 003D 03FE
        DECLE   $021A,  $025A,  $021A,  $03B0   ; 559D   021A 025A 021A 03B0
        DECLE   $0051,  $01C4,  $01D4,  $01E4   ; 55A1   0051 01C4 01D4 01E4
        DECLE   $0014,  $0284,  $03B0,  $005F   ; 55A5   0014 0284 03B0 005F
        DECLE   $02C4,  $02D4,  $03B0,  $008D   ; 55A9   02C4 02D4 03B0 008D
        DECLE   $026A,  $027A,  $028A,  $03D0   ; 55AD   026A 027A 028A 03D0
        DECLE   $03D0,  $00AA,  $00BA,  $00CA   ; 55B1   03D0 00AA 00BA 00CA
        DECLE   $00DA,  $00EA,  $00FA,  $010A   ; 55B5   00DA 00EA 00FA 010A
        DECLE   $011A,  $012A,  $03D0,  $020A   ; 55B9   011A 012A 03D0 020A
        DECLE   $022A,  $023A,  $024A,  $03B0   ; 55BD   022A 023A 024A 03B0
        DECLE   $00A1,  $01A1,  $01B1,  $03B0   ; 55C1   00A1 01A1 01B1 03B0
        DECLE   $00B0,  $02A1,  $03D0,  $02B1   ; 55C5   00B0 02A1 03D0 02B1
        DECLE   $03B0,  $00B5,  $03FE,  $021A   ; 55C9   03B0 00B5 03FE 021A
        DECLE   $025A,  $021A,  $025A,  $021A   ; 55CD   025A 021A 025A 021A
        DECLE   $021A                           ; 55D1   021A

        AND@    R6,     R0                      ; 55D2   03B0
        ADDR    R1,     R1                      ; 55D3   00C9
        XORR    R0,     R4                      ; 55D4   01C4
        XORR    R2,     R4                      ; 55D5   01D4
        CLRR    R4                              ; 55D6   01E4
        DECR    R4                              ; 55D7   0014
        MVI     G_03B0, R4                      ; 55D8   0284 03B0
        ADDR    R2,     R7                      ; 55DA   00D7

        DECLE   $02E4,  $02F4,  $03B0,  $00D9   ; 55DB   02E4 02F4 03B0 00D9
        DECLE   $0344,  $0354,  $0000           ; 55DF   0344 0354 0000

        AND@    R6,     R0                      ; 55E2   03B0
        SLR     R1,     2                       ; 55E3   0065
        CLRR    R1                              ; 55E4   01C9
        XORR    R3,     R1                      ; 55E5   01D9
        XORR    R5,     R1                      ; 55E6   01E9
        ADCR    R1                              ; 55E7   0029
        MVI@    R1,     R1                      ; 55E8   0289
        AND@    R6,     R0                      ; 55E9   03B0
        RRC     R3,     1                       ; 55EA   0073
        SUB@    R1,     R1                      ; 55EB   0309
        SUB@    R3,     R1                      ; 55EC   0319
        AND@    R6,     R0                      ; 55ED   03B0
        ADDR    R3,     R5                      ; 55EE   00DD
        CLRR    R1                              ; 55EF   01C9
        XORR    R3,     R1                      ; 55F0   01D9
        XORR    R5,     R1                      ; 55F1   01E9
        ADCR    R1                              ; 55F2   0029
        MVI@    R1,     R1                      ; 55F3   0289
        AND@    R6,     R0                      ; 55F4   03B0
        ADDR    R5,     R3                      ; 55F5   00EB
        SUB@    R5,     R1                      ; 55F6   0329
        SUBI    #$03B0, R1                      ; 55F7   0339 03B0
        ADDR    R5,     R5                      ; 55F9   00ED
        CMP@    R5,     R1                      ; 55FA   0369
        CMPI    #$0000, R1                      ; 55FB   0379 0000
L_55FD:
        PSHR    R5                              ; 55FD   0275
L_55FE:
        MVI     G_015E, R1                      ; 55FE   0281 015E
        ADDI    #$01B4, R1                      ; 5600   02F9 01B4
        MVI@    R1,     R0                      ; 5602   0288
        INCR    R0                              ; 5603   0008
        CMPI    #$0019, R0                      ; 5604   0378 0019
        BGT     L_560E                          ; 5606   020E 0006

        MVO@    R0,     R1                      ; 5608   0248

        JSR     R5,     L_6D4A                  ; 5609   0004 016C 014A
        BIDECLE $0400                           ; 560C   0000 0004
L_560E:
        PULR    R7                              ; 560E   02B7

L_560F:
        PSHR    R5                              ; 560F   0275
        MVII    #$01B4, R4                      ; 5610   02BC 01B4
        MVII    #$0190, R3                      ; 5612   02BB 0190
        ADD     G_0161, R3                      ; 5614   02C3 0161
        DECR    R3                              ; 5616   0013
        MVII    #$0002, R0                      ; 5617   02B8 0002
L_5619:
        MVI@    R4,     R1                      ; 5619   02A1
        MVO@    R1,     R3                      ; 561A   0259
        ADDI    #$0012, R3                      ; 561B   02FB 0012
        DECR    R0                              ; 561D   0010
        BNEQ    L_5619                          ; 561E   022C 0006

        MVII    #$0190, R4                      ; 5620   02BC 0190
        MVII    #$0184, R5                      ; 5622   02BD 0184
        MVII    #$0004, R1                      ; 5624   02B9 0004
L_5626:
        MVII    #$0009, R0                      ; 5626   02B8 0009
        CLRR    R3                              ; 5628   01DB
L_5629:
        ADD@    R4,     R3                      ; 5629   02E3
        DECR    R0                              ; 562A   0010
        BNEQ    L_5629                          ; 562B   022C 0003

        MVO@    R3,     R5                      ; 562D   026B
        SWAP    R3,     1                       ; 562E   0043
        MVO@    R3,     R5                      ; 562F   026B
        DECR    R1                              ; 5630   0011
        BNEQ    L_5626                          ; 5631   022C 000C

        MVII    #$0184, R4                      ; 5633   02BC 0184
        MVII    #$018C, R5                      ; 5635   02BD 018C
        MVII    #$0002, R0                      ; 5637   02B8 0002
L_5639:
        SDBD                                    ; 5639   0001
        MVI@    R4,     R3                      ; 563A   02A3
        SDBD                                    ; 563B   0001
        ADD@    R4,     R3                      ; 563C   02E3
        MVO@    R3,     R5                      ; 563D   026B
        SWAP    R3,     1                       ; 563E   0043
        MVO@    R3,     R5                      ; 563F   026B
        DECR    R0                              ; 5640   0010
        BNEQ    L_5639                          ; 5641   022C 0009
        PULR    R7                              ; 5643   02B7

L_5644:
        PSHR    R5                              ; 5644   0275
        MVII    #$0181, R4                      ; 5645   02BC 0181
        MVII    #$0035, R0                      ; 5647   02B8 0035

        JSR     R5,     X_FILL_ZERO             ; 5649   0004 0114 0338

        PULR    R7                              ; 564C   02B7

L_564D:
        PSHR    R5                              ; 564D   0275
        MVII    #$0163, R4                      ; 564E   02BC 0163
        MVII    #$0012, R0                      ; 5650   02B8 0012

        JSR     R5,     X_FILL_ZERO             ; 5652   0004 0114 0338

        PULR    R7                              ; 5655   02B7

L_5656:
        PSHR    R5                              ; 5656   0275
        CLRR    R0                              ; 5657   01C0
        MVO     R0,     G_01E4                  ; 5658   0240 01E4
        MVI     G_01E3, R5                      ; 565A   0285 01E3
        CMPI    #$0001, R5                      ; 565C   037D 0001
        BNEQ    L_566E                          ; 565E   020C 000E

        MVI     G_01E2, R5                      ; 5660   0285 01E2
        CMPI    #$0001, R5                      ; 5662   037D 0001
        BLT     L_566E                          ; 5664   0205 0008
        BNEQ    L_566C                          ; 5666   020C 0004

        MVII    #$02EF, R4                      ; 5668   02BC 02EF
        B       L_566E                          ; 566A   0200 0002

L_566C:
        MVII    #$02DC, R4                      ; 566C   02BC 02DC
L_566E:
        MVI@    R1,     R2                      ; 566E   028A
        INCR    R1                              ; 566F   0009
        TSTR    R2                              ; 5670   0092
        BEQ     L_5682                          ; 5671   0204 000F

        JSR     R5,     L_5683                  ; 5673   0004 0154 0283

        CMPI    #$01D0, R2                      ; 5676   037A 01D0
        BGE     L_56DE                          ; 5678   020D 0064

L_567A:
        JSR     R5,     L_5689                  ; 567A   0004 0154 0289
        JSR     R5,     L_56BD                  ; 567D   0004 0154 02BD

        B       L_566E                          ; 5680   0220 0013
L_5682:
        PULR    R7                              ; 5682   02B7

L_5683:
        MOVR    R2,     R3                      ; 5683   0093
        ANDI    #$000F, R3                      ; 5684   03BB 000F
        XORR    R3,     R2                      ; 5686   01DA
        SLR     R2,     1                       ; 5687   0062
        MOVR    R5,     R7                      ; 5688   00AF

L_5689:
        PSHR    R5                              ; 5689   0275
        PSHR    R3                              ; 568A   0273
        ADD     G_0339, R3                      ; 568B   02C3 0339
        MVI@    R3,     R3                      ; 568D   029B
        SLL     R3,     1                       ; 568E   004B
        SWAP    R3,     1                       ; 568F   0043
        MVI     G_01E3, R5                      ; 5690   0285 01E3
        CMPI    #$0001, R5                      ; 5692   037D 0001
        BNEQ    L_56BA                          ; 5694   020C 0024

        MVI     G_01E2, R5                      ; 5696   0285 01E2
        CMPI    #$0001, R5                      ; 5698   037D 0001
        BLT     L_56BA                          ; 569A   0205 001E

        MOVR    R2,     R5                      ; 569C   0095
        SDBD                                    ; 569D   0001
        ANDI    #$0800, R5                      ; 569E   03BD 0000 0008
        BNEQ    L_56BA                          ; 56A1   020C 0017

        CMPI    #$00F0, R2                      ; 56A3   037A 00F0
        BGE     L_56BA                          ; 56A5   020D 0013

        SLR     R2,     2                       ; 56A7   0066
        SLR     R2,     1                       ; 56A8   0062
        MVI     G_01E2, R5                      ; 56A9   0285 01E2
        CMPI    #$0001, R5                      ; 56AB   037D 0001
        BNEQ    L_56B5                          ; 56AD   020C 0006

        SDBD                                    ; 56AF   0001
        ADDI    #$584A, R2                      ; 56B0   02FA 004A 0058
        B       L_56B9                          ; 56B3   0200 0004

L_56B5:
        SDBD                                    ; 56B5   0001
        ADDI    #$582C, R2                      ; 56B6   02FA 002C 0058
L_56B9:
        MVI@    R2,     R2                      ; 56B9   0292
L_56BA:
        XORR    R3,     R2                      ; 56BA   01DA
        PULR    R3                              ; 56BB   02B3
        PULR    R7                              ; 56BC   02B7

L_56BD:
        PSHR    R5                              ; 56BD   0275
        MVO@    R2,     R4                      ; 56BE   0262
        MVI     G_01E3, R5                      ; 56BF   0285 01E3
        CMPI    #$0001, R5                      ; 56C1   037D 0001
        BNEQ    L_56DD                          ; 56C3   020C 0018

        MVI     G_01E2, R5                      ; 56C5   0285 01E2
        CMPI    #$0001, R5                      ; 56C7   037D 0001
        BLT     L_56DD                          ; 56C9   0205 0012
        BNEQ    L_56D1                          ; 56CB   020C 0004

        SUBI    #$0002, R4                      ; 56CD   033C 0002
        B       L_56DD                          ; 56CF   0200 000C

L_56D1:
        MVI     G_01E4, R5                      ; 56D1   0285 01E4
        INCR    R5                              ; 56D3   000D
        CMPI    #$0014, R5                      ; 56D4   037D 0014
        BLT     L_56DB                          ; 56D6   0205 0003

        SUBI    #$0028, R4                      ; 56D8   033C 0028
        CLRR    R5                              ; 56DA   01ED
L_56DB:
        MVO     R5,     G_01E4                  ; 56DB   0245 01E4
L_56DD:
        PULR    R7                              ; 56DD   02B7

L_56DE:
        CMPI    #$01E0, R2                      ; 56DE   037A 01E0
        BEQ     L_5703                          ; 56E0   0204 0021

        CMPI    #$01E8, R2                      ; 56E2   037A 01E8
        BEQ     L_571D                          ; 56E4   0204 0037

        CMPI    #$01F0, R2                      ; 56E6   037A 01F0
        BEQ     L_5723                          ; 56E8   0204 0039

        CMPI    #$01F8, R2                      ; 56EA   037A 01F8
        BEQ     L_572B                          ; 56EC   0204 003D

        CMPI    #$01D8, R2                      ; 56EE   037A 01D8
        BEQ     L_56F8                          ; 56F0   0204 0006

        CMPI    #$01D0, R2                      ; 56F2   037A 01D0
        BEQ     L_56FE                          ; 56F4   0204 0008
        B       L_566E                          ; 56F6   0220 0089

L_56F8:
        MVI@    R1,     R4                      ; 56F8   028C
        INCR    R1                              ; 56F9   0009
        ADDI    #$0200, R4                      ; 56FA   02FC 0200
        B       L_566E                          ; 56FC   0220 008F

L_56FE:
        MVI@    R1,     R2                      ; 56FE   028A
        INCR    R1                              ; 56FF   0009
        ADDR    R2,     R4                      ; 5700   00D4
        B       L_566E                          ; 5701   0220 0094

L_5703:
        MVII    #$0178, R2                      ; 5703   02BA 0178
        MVI     G_0339, R1                      ; 5705   0281 0339
        SDBD                                    ; 5707   0001
        MVII    #$571C, R0                      ; 5708   02B8 001C 0057
        MVO     R0,     G_0339                  ; 570B   0240 0339

        JSR     R5,     L_5689                  ; 570D   0004 0154 0289

        MVO     R1,     G_0339                  ; 5710   0241 0339
        MOVR    R2,     R1                      ; 5712   0091
        MVII    #$00F0, R0                      ; 5713   02B8 00F0
        MVII    #$0200, R4                      ; 5715   02BC 0200

        JSR     R5,     X_FILL_MEM              ; 5717   0004 0114 0341

        B       L_5682                          ; 571A   0220 0099

        DECLE   $0216                           ; 571C   0216
L_571D:
        SDBD                                    ; 571D   0001
        MVII    #$0800, R2                      ; 571E   02BA 0000 0008
        B       L_567A                          ; 5721   0220 00A8

L_5723:
        JSR     R5,     L_5753                  ; 5723   0004 0154 0353
        JSR     R5,     L_56BD                  ; 5726   0004 0154 02BD

        B       L_566E                          ; 5729   0220 00BC

L_572B:
        MOVR    R3,     R0                      ; 572B   0098
        MVI@    R1,     R2                      ; 572C   028A
        INCR    R1                              ; 572D   0009

        JSR     R5,     L_5683                  ; 572E   0004 0154 0283

        CMPI    #$01F0, R2                      ; 5731   037A 01F0
        BEQ     L_5748                          ; 5733   0204 0013

        CMPI    #$01E8, R2                      ; 5735   037A 01E8
        BNEQ    L_573D                          ; 5737   020C 0004

        SDBD                                    ; 5739   0001
        MVII    #$0800, R2                      ; 573A   02BA 0000 0008

L_573D:
        JSR     R5,     L_5689                  ; 573D   0004 0154 0289
L_5740:
        JSR     R5,     L_56BD                  ; 5740   0004 0154 02BD

        DECR    R0                              ; 5743   0010
        BNEQ    L_5740                          ; 5744   022C 0005
        B       L_566E                          ; 5746   0220 00D9

L_5748:
        JSR     R5,     L_5753                  ; 5748   0004 0154 0353
        JSR     R5,     L_56BD                  ; 574B   0004 0154 02BD

        DECR    R0                              ; 574E   0010
        BNEQ    L_5748                          ; 574F   022C 0008
        B       L_566E                          ; 5751   0220 00E4

L_5753:
        PSHR    R5                              ; 5753   0275
        PSHR    R0                              ; 5754   0270
        MVII    #$0005, R0                      ; 5755   02B8 0005

        JSR     R5,     X_RAND1                 ; 5757   0004 0114 027D

        MOVR    R0,     R2                      ; 575A   0082
        SLR     R0,     1                       ; 575B   0060
        ANDI    #$0001, R2                      ; 575C   03BA 0001
        BNEQ    L_577F                          ; 575E   020C 001F

        SDBD                                    ; 5760   0001
        MVII    #$0800, R2                      ; 5761   02BA 0000 0008

L_5764:
        JSR     R5,     L_5689                  ; 5764   0004 0154 0289

        CMPI    #$000C, R3                      ; 5767   037B 000C
        BEQ     L_579D                          ; 5769   0204 0032

        SDBD                                    ; 576B   0001
        ANDI    #$C9FF, R2                      ; 576C   03BA 00FF 00C9
        SDBD                                    ; 576F   0001
        XORI    #$2000, R2                      ; 5770   03FA 0000 0020
        CMPI    #$0000, R3                      ; 5773   037B 0000
        BEQ     L_5779                          ; 5775   0204 0002

        XORI    #$0200, R2                      ; 5777   03FA 0200
L_5779:
        B       L_579D                          ; 5779   0200 0022

L_577B:
        MVII    #$00F0, R2                      ; 577B   02BA 00F0
        B       L_5764                          ; 577D   0220 001A

L_577F:
        CMPI    #$000C, R3                      ; 577F   037B 000C
        BEQ     L_577B                          ; 5781   0224 0007

        MOVR    R0,     R2                      ; 5783   0082
        SLR     R0,     2                       ; 5784   0064
        ANDI    #$0003, R2                      ; 5785   03BA 0003
        SDBD                                    ; 5787   0001
        ADDI    #$57A7, R2                      ; 5788   02FA 00A7 0057
        MVI@    R2,     R2                      ; 578B   0292

        JSR     R5,     L_5689                  ; 578C   0004 0154 0289

        SDBD                                    ; 578F   0001
        ANDI    #$C9FF, R2                      ; 5790   03BA 00FF 00C9
        ANDI    #$0003, R0                      ; 5793   03B8 0003
        SLL     R0,     1                       ; 5795   0048
        SDBD                                    ; 5796   0001
        MVII    #$579F, R5                      ; 5797   02BD 009F 0057
        ADDR    R0,     R5                      ; 579A   00C5
        SDBD                                    ; 579B   0001
        XOR@    R5,     R2                      ; 579C   03EA
L_579D:
        PULR    R0                              ; 579D   02B0
        PULR    R7                              ; 579E   02B7

        DECLE   $0000,  $0000,  $0000,  $0024   ; 579F   0000 0000 0000 0024
        DECLE   $0000,  $0034,  $0000           ; 57A3   0000 0034 0000

        NEGR    R2                              ; 57A6   0022
        SUBR    R2,     R0                      ; 57A7   0110
        SUBR    R1,     R0                      ; 57A8   0108
        SUBR    R0,     R0                      ; 57A9   0100
        SUBR    R3,     R0                      ; 57AA   0118
L_57AB:
        PSHR    R5                              ; 57AB   0275
L_57AC:
        MVII    #$0001, R0                      ; 57AC   02B8 0001
        MVO     R0,     G_01DB                  ; 57AE   0240 01DB
        SDBD                                    ; 57B0   0001
        MVII    #$08CE, R0                      ; 57B1   02B8 00CE 0008
        MVI     G_01B6, R1                      ; 57B4   0281 01B6
        CMPI    #$0004, R1                      ; 57B6   0379 0004
        BEQ     L_57BE                          ; 57B8   0204 0004

        SDBD                                    ; 57BA   0001
        MVII    #$1E1F, R0                      ; 57BB   02B8 001F 001E

L_57BE:
        JSR     R5,     L_6D4C                  ; 57BE   0004 016C 014C

        MVII    #$0014, R0                      ; 57C1   02B8 0014
        MVO     R0,     G_01EC                  ; 57C3   0240 01EC
        MVII    #$0000, R0                      ; 57C5   02B8 0000
        MVI     G_01DC, R1                      ; 57C7   0281 01DC
        CMPI    #$0000, R1                      ; 57C9   0379 0000
        BEQ     L_57CF                          ; 57CB   0204 0002

        MVII    #$0001, R0                      ; 57CD   02B8 0001

L_57CF:
        JSR     R5,     L_525B                  ; 57CF   0004 0150 025B
        JSR     R5,     L_6D41                  ; 57D2   0004 016C 0141
        JSR     R5,     L_57D9                  ; 57D5   0004 0154 03D9

        PULR    R7                              ; 57D8   02B7

L_57D9:
        PSHR    R5                              ; 57D9   0275

        JSR     R5,     L_6D59                  ; 57DA   0004 016C 0159

        MVII    #$017D, R4                      ; 57DD   02BC 017D
        SDBD                                    ; 57DF   0001
        MVI@    R4,     R1                      ; 57E0   02A1
        SDBD                                    ; 57E1   0001
        MVII    #$5873, R0                      ; 57E2   02B8 0073 0058
        MVO     R0,     G_0339                  ; 57E5   0240 0339
        MVII    #$0001, R0                      ; 57E7   02B8 0001
        MVO     R0,     G_01E3                  ; 57E9   0240 01E3
        MVII    #$0200, R4                      ; 57EB   02BC 0200

        JSR     R5,     L_5656                  ; 57ED   0004 0154 0256

        CLRR    R0                              ; 57F0   01C0
        MVO     R0,     G_01E3                  ; 57F1   0240 01E3
        MVI     G_017A, R0                      ; 57F3   0280 017A
        MVO     R0,     G_01C0                  ; 57F5   0240 01C0

        JSR     R5,     L_5A40                  ; 57F7   0004 0158 0240
        JSR     R5,     L_6924                  ; 57FA   0004 0168 0124
        JSR     R5,     L_68C9                  ; 57FD   0004 0168 00C9

        MVI     G_01B6, R0                      ; 5800   0280 01B6
        CMPI    #$0004, R0                      ; 5802   0378 0004
        BEQ     L_580C                          ; 5804   0204 0006

        JSR     R5,     L_594C                  ; 5806   0004 0158 014C
        JSR     R5,     L_684E                  ; 5809   0004 0168 004E

L_580C:
        PULR    R7                              ; 580C   02B7

L_580D:
        PSHR    R5                              ; 580D   0275
L_580E:
        MVI@    R4,     R3                      ; 580E   02A3
L_580F:
        MVI@    R4,     R5                      ; 580F   02A5
L_5810:
        MVI@    R4,     R0                      ; 5810   02A0
        SUBI    #$0020, R0                      ; 5811   0338 0020
        BMI     L_581B                          ; 5813   020B 0006

        SLL     R0,     2                       ; 5815   004C
        SLL     R0,     1                       ; 5816   0048
        XORR    R3,     R0                      ; 5817   01D8
        MVO@    R0,     R5                      ; 5818   0268
        B       L_5810                          ; 5819   0220 000A

L_581B:
        ADDI    #$0020, R0                      ; 581B   02F8 0020
        BEQ     L_580F                          ; 581D   0224 000F

        DECR    R0                              ; 581F   0010
        BEQ     L_580E                          ; 5820   0224 0013

        MVI@    R4,     R0                      ; 5822   02A0
        MVO     R0,     G_01E1                  ; 5823   0240 01E1
        SDBD                                    ; 5825   0001
        SUBI    #$5C7F, R4                      ; 5826   033C 007F 005C
        MVO     R4,     G_01DF                  ; 5829   0244 01DF
        PULR    R7                              ; 582B   02B7

        DECLE   $0018,  $0010,  $0008,  $0000   ; 582C   0018 0010 0008 0000
        DECLE   $0038,  $0030,  $0028,  $0020   ; 5830   0038 0030 0028 0020
        DECLE   $0058,  $0050,  $0048,  $0040   ; 5834   0058 0050 0048 0040
        DECLE   $0078,  $0070,  $0068,  $0060   ; 5838   0078 0070 0068 0060
        DECLE   $0090,  $0088,  $0080,  $0098   ; 583C   0090 0088 0080 0098
        DECLE   $00B0,  $00A8,  $00A0,  $00B8   ; 5840   00B0 00A8 00A0 00B8
        DECLE   $00D0,  $00C8,  $00C0,  $00D8   ; 5844   00D0 00C8 00C0 00D8
        DECLE   $00E8,  $00E0,  $0010,  $0018   ; 5848   00E8 00E0 0010 0018
        DECLE   $0000,  $0008,  $0030,  $0038   ; 584C   0000 0008 0030 0038
        DECLE   $0020,  $0028,  $0050,  $0058   ; 5850   0020 0028 0050 0058
        DECLE   $0040,  $0048,  $0070,  $0078   ; 5854   0040 0048 0070 0078
        DECLE   $0060,  $0068,  $0090,  $0098   ; 5858   0060 0068 0090 0098
        DECLE   $0080,  $0088,  $00B0,  $00B8   ; 585C   0080 0088 00B0 00B8
        DECLE   $00A0,  $00A8,  $00D0,  $00D8   ; 5860   00A0 00A8 00D0 00D8
        DECLE   $00C0,  $00C8,  $00E8,  $00E0   ; 5864   00C0 00C8 00E8 00E0
        DECLE   $0004,  $0005                   ; 5868   0004 0005

        SETC                                    ; 586A   0007
        DECR    R5                              ; 586B   0015
        DECR    R6                              ; 586C   0016
L_586D:
        DECR    R7                              ; 586D   0017

        DECLE   $000D,  $001C,  $001D,  $001E   ; 586E   000D 001C 001D 001E
        DECLE   $001F,  $0204,  $0284,  $0207   ; 5872   001F 0204 0284 0207
        DECLE   $0287,  $0194,  $0294,  $0195   ; 5876   0287 0194 0294 0195
        DECLE   $0215,  $0216,  $018D,  $020D   ; 587A   0215 0216 018D 020D
        DECLE   $028D,  $038D,  $019E,  $021E   ; 587E   028D 038D 019E 021E

        MVI@    R3,     R6                      ; 5882   029E
L_5883:
        PSHR    R5                              ; 5883   0275
        MVI     G_01C3, R1                      ; 5884   0281 01C3
        DECR    R1                              ; 5886   0011
        BMI     L_591C                          ; 5887   020B 0093

        MVO     R1,     G_01C3                  ; 5889   0241 01C3
        MVI     G_01CA, R2                      ; 588B   0282 01CA
        CMPI    #$00FF, R2                      ; 588D   037A 00FF
        BNEQ    L_58A9                          ; 588F   020C 0018

        MVII    #$01C4, R3                      ; 5891   02BB 01C4
        MVI     G_01C2, R0                      ; 5893   0280 01C2
        CMPI    #$0000, R0                      ; 5895   0378 0000
        BEQ     L_589A                          ; 5897   0204 0001

        INCR    R3                              ; 5899   000B
L_589A:
        MVI@    R3,     R4                      ; 589A   029C
        INCR    R4                              ; 589B   000C
        MVO@    R4,     R3                      ; 589C   025C
        TSTR    R0                              ; 589D   0080
        BNEQ    L_58A9                          ; 589E   020C 0009

        MVI     G_01C4, R4                      ; 58A0   0284 01C4
        MVO     R4,     G_01D0                  ; 58A2   0244 01D0
        MVI     G_01CF, R2                      ; 58A4   0282 01CF
        CMPR    R2,     R4                      ; 58A6   0154
        BGT     L_58E2                          ; 58A7   020E 0039

L_58A9:
        TSTR    R1                              ; 58A9   0089
        DECLE   $020C,  $0070,  $0283,  $01C1   ; 58AA   020C 0070 0283 01C1
        DECLE   $0080,  $0204,  $002B,  $037B   ; 58AE   0080 0204 002B 037B
        DECLE   $0070,  $020C,  $001C,  $02B8   ; 58B2   0070 020C 001C 02B8
        DECLE   $0001,  $0240,  $01C8,  $0280   ; 58B6   0001 0240 01C8 0280
        DECLE   $01B6,  $0378,  $0007,  $0204   ; 58BA   01B6 0378 0007 0204
        DECLE   $0012,  $0273,  $0004           ; 58BE   0012 0273 0004

        ANDR    R4,     R0                      ; 58C1   01A0
        SUB@    R1,     R6                      ; 58C2   030E

        JSR     R5,     L_6FAD                  ; 58C3   0004 016C 03AD
        JSR     R5,     L_68FE                  ; 58C6   0004 0168 00FE

        PULR    R3                              ; 58C9   02B3
        MVII    #$0007, R0                      ; 58CA   02B8 0007
        MVO     R0,     G_01B6                  ; 58CC   0240 01B6
        CLRR    R0                              ; 58CE   01C0
        MVO     R0,     G_031C                  ; 58CF   0240 031C
        ADDI    #$0010, R3                      ; 58D1   02FB 0010
        MVI     G_01CC, R2                      ; 58D3   0282 01CC
        CMPR    R2,     R3                      ; 58D5   0153
        BGT     L_591D                          ; 58D6   020E 0045

        MVI     G_01CE, R2                      ; 58D8   0282 01CE
        B       L_58EE                          ; 58DA   0200 0012

        SUBI    #$0010, R3                      ; 58DC   033B 0010
        MVI     G_01CD, R2                      ; 58DE   0282 01CD
        B       L_58EE                          ; 58E0   0200 000C

L_58E2:
        MVII    #$000C, R0                      ; 58E2   02B8 000C

        JSR     R5,     X_RAND2                 ; 58E4   0004 0114 029E

        ADDI    #$0019, R0                      ; 58E7   02F8 0019
        MVO     R0,     G_01C4                  ; 58E9   0240 01C4
        J       L_6209                          ; 58EB   0004 0360 0209

L_58EE:
        MOVR    R3,     R0                      ; 58EE   0098
        SLR     R3,     2                       ; 58EF   0067
        SLR     R3,     1                       ; 58F0   0063
        SDBD                                    ; 58F1   0001
        ADDI    #$59D1, R3                      ; 58F2   02FB 00D1 0059
        MVI@    R3,     R4                      ; 58F5   029C
        INCR    R3                              ; 58F6   000B
        MVI@    R3,     R5                      ; 58F7   029D
        MVI     G_031A, R1                      ; 58F8   0281 031A
        ANDI    #$00FF, R1                      ; 58FA   03B9 00FF
        ADDR    R4,     R1                      ; 58FC   00E1
        ANDI    #$00FF, R1                      ; 58FD   03B9 00FF
        MVI     G_0319, R4                      ; 58FF   0284 0319
        SDBD                                    ; 5901   0001
        ANDI    #$FF00, R4                      ; 5902   03BC 0000 00FF
        XORR    R1,     R4                      ; 5905   01CC
        MVI     G_0322, R1                      ; 5906   0281 0322
        ANDI    #$007F, R1                      ; 5908   03B9 007F
        ADDR    R5,     R1                      ; 590A   00E9
        ANDI    #$007F, R1                      ; 590B   03B9 007F
        MVI     G_0321, R5                      ; 590D   0285 0321
        SDBD                                    ; 590F   0001
        ANDI    #$FF80, R5                      ; 5910   03BD 0080 00FF
        XORR    R1,     R5                      ; 5913   01CD
        MVO     R4,     G_0319                  ; 5914   0244 0319
        MVO     R5,     G_0321                  ; 5916   0245 0321
        MVO     R0,     G_01C1                  ; 5918   0240 01C1
        MVO     R2,     G_01C3                  ; 591A   0242 01C3
L_591C:
        PULR    R7                              ; 591C   02B7

L_591D:
        MVI     G_01CA, R0                      ; 591D   0280 01CA
        CMPI    #$00FF, R0                      ; 591F   0378 00FF
        BNEQ    L_5940                          ; 5921   020C 001D

        MVII    #$000C, R0                      ; 5923   02B8 000C

        JSR     R5,     X_RAND2                 ; 5925   0004 0114 029E

        MOVR    R0,     R1                      ; 5928   0081
        ADDI    #$000C, R1                      ; 5929   02F9 000C
        TSTR    R0                              ; 592B   0080
        BEQ     L_5936                          ; 592C   0204 0008

        ANDI    #$0001, R0                      ; 592E   03B8 0001
        BEQ     L_593A                          ; 5930   0204 0008

        MVII    #$0002, R0                      ; 5932   02B8 0002
        B       L_593C                          ; 5934   0200 0006

L_5936:
        MVII    #$0001, R0                      ; 5936   02B8 0001
        B       L_593C                          ; 5938   0200 0002

L_593A:
        MVII    #$0000, R0                      ; 593A   02B8 0000
L_593C:
        MVO     R0,     G_01C9                  ; 593C   0240 01C9
        MVO     R1,     G_01CA                  ; 593E   0241 01CA
L_5940:
        MVII    #$01C6, R2                      ; 5940   02BA 01C6
        DECLE   $02C2,  $015E,  $0293,  $037B   ; 5942   02C2 015E 0293 037B
        DECLE   $000C,  $0204,  $0087,  $0004   ; 5946   000C 0204 0087 0004

        AND@    R4,     R4                      ; 594A   03A4
        XORR    R6,     R1                      ; 594B   01F1
L_594C:
        PSHR    R5                              ; 594C   0275
L_594D:
        SDBD                                    ; 594D   0001
        MVII    #$F7FF, R0                      ; 594E   02B8 00FF 00F7
        MVO     R0,     G_033A                  ; 5951   0240 033A
        MVII    #$0070, R0                      ; 5953   02B8 0070
        MVO     R0,     G_01CC                  ; 5955   0240 01CC
        MVO     R0,     G_01C1                  ; 5957   0240 01C1
        MVII    #$00FF, R0                      ; 5959   02B8 00FF
        MVO     R0,     G_01C9                  ; 595B   0240 01C9
        MVO     R0,     G_01CA                  ; 595D   0240 01CA
        MVII    #$0000, R0                      ; 595F   02B8 0000
        MVO     R0,     G_01C2                  ; 5961   0240 01C2
        MVII    #$0000, R0                      ; 5963   02B8 0000
        MVO     R0,     G_01C8                  ; 5965   0240 01C8
        MVII    #$0000, R0                      ; 5967   02B8 0000
        MVO     R0,     G_01C4                  ; 5969   0240 01C4
        MVO     R0,     G_01D0                  ; 596B   0240 01D0
        MVO     R0,     G_01C5                  ; 596D   0240 01C5
        MVO     R0,     G_01C3                  ; 596F   0240 01C3
        MVO     R0,     G_0124                  ; 5971   0240 0124
        MVII    #$0016, R0                      ; 5973   02B8 0016
        MVO     R0,     G_01DD                  ; 5975   0240 01DD
        MVII    #$0001, R0                      ; 5977   02B8 0001
        MVO     R0,     G_01DE                  ; 5979   0240 01DE

        JSR     R5,     L_5244                  ; 597B   0004 0150 0244
        DECLE   $0331,  $00ED,  $0059,  $0332   ; 597E   0331 00ED 0059 0332
        DECLE   $00F3,  $0059,  $0333,  $00F9   ; 5982   00F3 0059 0333 00F9
        DECLE   $0059,  $0000                   ; 5986   0059 0000

        MVII    #$0005, R0                      ; 5988   02B8 0005
        MVO     R0,     G_01B6                  ; 598A   0240 01B6
        MVI     G_01C0, R0                      ; 598C   0280 01C0

        JSR     R5,     L_6D5E                  ; 598E   0004 016C 015E

        MOVR    R0,     R1                      ; 5991   0081
        ADDI    #$000C, R0                      ; 5992   02F8 000C
        ADDI    #$0005, R1                      ; 5994   02F9 0005
        ADDI    #$0013, R2                      ; 5996   02FA 0013
        MVII    #$0319, R4                      ; 5998   02BC 0319
        XORI    #$0200, R0                      ; 599A   03F8 0200
        MVO@    R0,     R4                      ; 599C   0260
        XORI    #$0200, R1                      ; 599D   03F9 0200
        MVO@    R1,     R4                      ; 599F   0261
        MVO@    R1,     R4                      ; 59A0   0261
        ADDI    #$000E, R1                      ; 59A1   02F9 000E
        MVO@    R1,     R4                      ; 59A3   0261
        ADDI    #$0004, R4                      ; 59A4   02FC 0004
        XORI    #$0180, R2                      ; 59A6   03FA 0180
        MVO@    R2,     R4                      ; 59A8   0262
        MVO@    R2,     R4                      ; 59A9   0262
        MVO@    R2,     R4                      ; 59AA   0262
        ADDI    #$000F, R2                      ; 59AB   02FA 000F
        XORI    #$0080, R2                      ; 59AD   03FA 0080
        MVO@    R2,     R4                      ; 59AF   0262
        ADDI    #$0004, R4                      ; 59B0   02FC 0004
        SDBD                                    ; 59B2   0001
        MVII    #$19B0, R0                      ; 59B3   02B8 00B0 0019
        MVO@    R0,     R4                      ; 59B6   0260
        SDBD                                    ; 59B7   0001
        MVII    #$09C3, R0                      ; 59B8   02B8 00C3 0009
        MVO@    R0,     R4                      ; 59BB   0260
        SDBD                                    ; 59BC   0001
        MVII    #$09D2, R0                      ; 59BD   02B8 00D2 0009
        MVI     G_015E, R1                      ; 59C0   0281 015E
        CMPI    #$0001, R1                      ; 59C2   0379 0001
        BNEQ    L_59CA                          ; 59C4   020C 0004

        SDBD                                    ; 59C6   0001
        MVII    #$19D2, R0                      ; 59C7   02B8 00D2 0019
L_59CA:
        MVO@    R0,     R4                      ; 59CA   0260
        SDBD                                    ; 59CB   0001
        MVII    #$0977, R0                      ; 59CC   02B8 0077 0009
        MVO@    R0,     R4                      ; 59CF   0260
        PULR    R7                              ; 59D0   02B7

        DECLE   $03FD,  $03F9,  $03FD,  $03F9   ; 59D1   03FD 03F9 03FD 03F9
        DECLE   $03FD,  $03F9,  $03FD,  $03F9   ; 59D5   03FD 03F9 03FD 03F9
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59D9   0000 0000 0000 0000
        DECLE   $0007,  $0000,  $0007,  $0000   ; 59DD   0007 0000 0007 0000
        DECLE   $0007,  $0000,  $0007,  $0000   ; 59E1   0007 0000 0007 0000
        DECLE   $0007,  $0000,  $03FD,  $03F8   ; 59E5   0007 0000 03FD 03F8
        DECLE   $0002,  $0000,  $0002,  $0000   ; 59E9   0002 0000 0002 0000
        DECLE   $0063,  $00A9,  $0001,  $01C1   ; 59ED   0063 00A9 0001 01C1
        DECLE   $00B0,  $0039,  $0043,  $00AA   ; 59F1   00B0 0039 0043 00AA
        DECLE   $0001,  $01C1,  $00C0,  $0039   ; 59F5   0001 01C1 00C0 0039
        DECLE   $0073,  $00AB,  $0001           ; 59F9   0073 00AB 0001

        XORR    R0,     R1                      ; 59FC   01C1
        ADDR    R2,     R0                      ; 59FD   00D0
        RSWD    R1                              ; 59FE   0039
        ADDR    R2,     R0                      ; 59FF   00D0
        ADDR    R0,     R0                      ; 5A00   00C0
        MOVR    R6,     R0                      ; 5A01   00B0
        MOVR    R4,     R0                      ; 5A02   00A0
        MOVR    R2,     R0                      ; 5A03   0090
        TSTR    R0                              ; 5A04   0080
        TSTR    R0                              ; 5A05   0080
        TSTR    R0                              ; 5A06   0080
L_5A07:
        PSHR    R5                              ; 5A07   0275
        CLRR    R2                              ; 5A08   01D2
        MOVR    R2,     R3                      ; 5A09   0093
        MVI     G_01B6, R0                      ; 5A0A   0280 01B6
        CMPI    #$000C, R0                      ; 5A0C   0378 000C
        BEQ     L_5A34                          ; 5A0E   0204 0024

        MVI     G_033A, R0                      ; 5A10   0280 033A
        COMR    R0                              ; 5A12   0018
        ANDI    #$0004, R0                      ; 5A13   03B8 0004
        BNEQ    L_5A3F                          ; 5A15   020C 0028

        SDBD                                    ; 5A17   0001
        MVII    #$0800, R0                      ; 5A18   02B8 0000 0008
        CLRR    R1                              ; 5A1B   01C9
        MVI     G_01D0, R4                      ; 5A1C   0284 01D0
L_5A1E:
        SLLC    R0,     1                       ; 5A1E   0058
        RLC     R1,     1                       ; 5A1F   0051
        SUBI    #$0003, R4                      ; 5A20   033C 0003
        BPL     L_5A1E                          ; 5A22   0223 0005

        MOVR    R0,     R2                      ; 5A24   0082
        MOVR    R1,     R3                      ; 5A25   008B
        MVI     G_01C5, R4                      ; 5A26   0284 01C5
        SUBI    #$0002, R4                      ; 5A28   033C 0002
        BMI     L_5A34                          ; 5A2A   020B 0008

L_5A2C:
        SARC    R1,     1                       ; 5A2C   0079
        RRC     R0,     1                       ; 5A2D   0070
        SUBI    #$0002, R4                      ; 5A2E   033C 0002
        BPL     L_5A2C                          ; 5A30   0223 0005

        XORR    R0,     R2                      ; 5A32   01C2
        XORR    R1,     R3                      ; 5A33   01CB
L_5A34:
        COMR    R2                              ; 5A34   001A
        COMR    R3                              ; 5A35   001B
        MVO     R2,     G_033A                  ; 5A36   0242 033A
        MVO     R3,     G_033B                  ; 5A38   0243 033B

        JSR     R5,     L_6D4A                  ; 5A3A   0004 016C 014A
        BIDECLE $1000                           ; 5A3D   0000 0010
L_5A3F:
        PULR    R7                              ; 5A3F   02B7

L_5A40:
        PSHR    R5                              ; 5A40   0275
L_5A41:
        SDBD                                    ; 5A41   0001
        DECLE   $02B8,  $0068,  $0058,  $0240   ; 5A42   02B8 0068 0058 0240
        DECLE   $0339,  $0283,  $01C0,  $037B   ; 5A46   0339 0283 01C0 037B
        DECLE   $0089,  $020D,  $0049,  $02BC   ; 5A4A   0089 020D 0049 02BC
        DECLE   $0200,  $00DC,  $0283,  $01B6   ; 5A4E   0200 00DC 0283 01B6
        DECLE   $037B,  $0004,  $0204,  $000E   ; 5A52   037B 0004 0204 000E

        CMPI    #$000B, R3                      ; 5A56   037B 000B
        BEQ     L_5A8F                          ; 5A58   0204 0035

        CMPI    #$000E, R3                      ; 5A5A   037B 000E
        BEQ     L_5A89                          ; 5A5C   0204 002B

        SDBD                                    ; 5A5E   0001
        MVII    #$5A97, R1                      ; 5A5F   02B9 0097 005A
        B       L_5A93                          ; 5A62   0200 002F

        DECLE   $0001                           ; 5A64   0001

        MVII    #$00B6, R1                      ; 5A65   02B9 00B6
        SLLC    R2,     1                       ; 5A67   005A

        JSR     R5,     L_5656                  ; 5A68   0004 0154 0256

        MVI     G_01B9, R1                      ; 5A6B   0281 01B9
        ADD     G_01C0, R1                      ; 5A6D   02C1 01C0
        ADDI    #$0200, R1                      ; 5A6F   02F9 0200
        MVII    #$0004, R0                      ; 5A71   02B8 0004
L_5A73:
        MVI@    R1,     R2                      ; 5A73   028A
        MOVR    R2,     R3                      ; 5A74   0093
        SDBD                                    ; 5A75   0001
        ANDI    #$0800, R3                      ; 5A76   03BB 0000 0008
        BEQ     L_5A84                          ; 5A79   0204 0009

        SDBD                                    ; 5A7B   0001
        ANDI    #$C9FF, R2                      ; 5A7C   03BA 00FF 00C9
        SDBD                                    ; 5A7F   0001
        XORI    #$2600, R2                      ; 5A80   03FA 0000 0026
        MVO@    R2,     R1                      ; 5A83   024A
L_5A84:
        INCR    R1                              ; 5A84   0009
        DECR    R0                              ; 5A85   0010
        BNEQ    L_5A73                          ; 5A86   022C 0014
        PULR    R7                              ; 5A88   02B7

L_5A89:
        SDBD                                    ; 5A89   0001
        MVII    #$5AF2, R1                      ; 5A8A   02B9 00F2 005A
        B       L_5A93                          ; 5A8D   0200 0004

L_5A8F:
        SDBD                                    ; 5A8F   0001
        MVII    #$5AD5, R1                      ; 5A90   02B9 00D5 005A

L_5A93:
        JSR     R5,     L_5656                  ; 5A93   0004 0154 0256

        PULR    R7                              ; 5A96   02B7

        DECLE   $0306,  $0326,  $0336,  $0346   ; 5A97   0306 0326 0336 0346
        DECLE   $03A0,  $0010,  $03D0,  $0284   ; 5A9B   03A0 0010 03D0 0284
        DECLE   $03D0,  $0299,  $03A0,  $0010   ; 5A9F   03D0 0299 03A0 0010
        DECLE   $03F4,  $03D0,  $03A0,  $0010   ; 5AA3   03F4 03D0 03A0 0010
        DECLE   $03F4,  $03D0,  $03A0,  $0010   ; 5AA7   03F4 03D0 03A0 0010
        DECLE   $02D3,  $02C3,  $02B3,  $02A3   ; 5AAB   02D3 02C3 02B3 02A3
        DECLE   $03A0,  $0010,  $0269,  $0279   ; 5AAF   03A0 0010 0269 0279
        DECLE   $03D0,  $0319,  $0000,  $0326   ; 5AB3   03D0 0319 0000 0326
        DECLE   $0336,  $03D0,  $0346,  $03A0   ; 5AB7   0336 03D0 0346 03A0
        DECLE   $0010,  $03F4,  $03D0,  $03A0   ; 5ABB   0010 03F4 03D0 03A0
        DECLE   $0010,  $0262,  $0272,  $0282   ; 5ABF   0010 0262 0272 0282
        DECLE   $0302,  $03A0,  $0010,  $0292   ; 5AC3   0302 03A0 0010 0292
        DECLE   $02A2,  $0282,  $02D2,  $03A0   ; 5AC7   02A2 0282 02D2 03A0
        DECLE   $0010,  $03F4,  $03D0,  $03A0   ; 5ACB   0010 03F4 03D0 03A0
        DECLE   $0010,  $03D0,  $02B2,  $02C2   ; 5ACF   0010 03D0 02B2 02C2
        DECLE   $03D0,  $0000,  $03F4,  $03D0   ; 5AD3   03D0 0000 03F4 03D0
        DECLE   $03A0,  $0010,  $03D0,  $0325   ; 5AD7   03A0 0010 03D0 0325
        DECLE   $0335,  $0395,  $03A0,  $0010   ; 5ADB   0335 0395 03A0 0010
        DECLE   $03F4,  $03D0,  $03A0,  $0010   ; 5ADF   03F4 03D0 03A0 0010
        DECLE   $03D0,  $0375,  $0345,  $03D0   ; 5AE3   03D0 0375 0345 03D0
        DECLE   $03A0,  $0010,  $03D0,  $0385   ; 5AE7   03A0 0010 03D0 0385
        DECLE   $0355,  $0365,  $03A0,  $0010   ; 5AEB   0355 0365 03A0 0010
        DECLE   $03F4,  $03D0,  $0000,  $03F4   ; 5AEF   03F4 03D0 0000 03F4
        DECLE   $03D0,  $03A0,  $0010,  $03D0   ; 5AF3   03D0 03A0 0010 03D0
        DECLE   $0315,  $0325,  $0385,  $03A0   ; 5AF7   0315 0325 0385 03A0
        DECLE   $0010,  $03F4,  $03D0,  $03A0   ; 5AFB   0010 03F4 03D0 03A0
        DECLE   $0010,  $03D0,  $0365,  $0335   ; 5AFF   0010 03D0 0365 0335
        DECLE   $0345,  $03A0,  $0010,  $03D0   ; 5B03   0345 03A0 0010 03D0
        DECLE   $0375,  $0395,  $0355,  $03A0   ; 5B07   0375 0395 0355 03A0
        DECLE   $0010,  $03F4,  $03D0,  $0000   ; 5B0B   0010 03F4 03D0 0000
L_5B0F:
        PSHR    R5                              ; 5B0F   0275
        MVI     G_01DD, R0                      ; 5B10   0280 01DD
        DECR    R0                              ; 5B12   0010
        BMI     L_5B6D                          ; 5B13   020B 0058

        MVO     R0,     G_01DD                  ; 5B15   0240 01DD
        BNEQ    L_5B6D                          ; 5B17   020C 0054

        MVII    #$0200, R1                      ; 5B19   02B9 0200
        ADD     G_01C0, R1                      ; 5B1B   02C1 01C0
        ADDI    #$0015, R1                      ; 5B1D   02F9 0015
        SDBD                                    ; 5B1F   0001
        MVII    #$A400, R4                      ; 5B20   02BC 0000 00A4
        MVI     G_015E, R0                      ; 5B23   0280 015E
        TSTR    R0                              ; 5B25   0080
        BEQ     L_5B2E                          ; 5B26   0204 0006

        ADDI    #$0002, R1                      ; 5B28   02F9 0002
        SDBD                                    ; 5B2A   0001
        MVII    #$B400, R4                      ; 5B2B   02BC 0000 00B4
L_5B2E:
        MVI@    R1,     R0                      ; 5B2E   0288
        TSTR    R0                              ; 5B2F   0080
        BMI     L_5B36                          ; 5B30   020B 0004

        SDBD                                    ; 5B32   0001
        MVII    #$A600, R4                      ; 5B33   02BC 0000 00A6
L_5B36:
        SDBD                                    ; 5B36   0001
        ANDI    #$C9FF, R0                      ; 5B37   03B8 00FF 00C9
        XORR    R4,     R0                      ; 5B3A   01E0
        MVO@    R0,     R1                      ; 5B3B   0248
        MVI     G_01DE, R0                      ; 5B3C   0280 01DE
        CMPI    #$0001, R0                      ; 5B3E   0378 0001
        BNEQ    L_5B4A                          ; 5B40   020C 0008

        MVI     G_015E, R1                      ; 5B42   0281 015E
        ADDI    #$031D, R1                      ; 5B44   02F9 031D
        MVI@    R1,     R0                      ; 5B46   0288
        XORI    #$0200, R0                      ; 5B47   03F8 0200
        MVO@    R0,     R1                      ; 5B49   0248
L_5B4A:
        MVII    #$0016, R0                      ; 5B4A   02B8 0016
        MVO     R0,     G_01DD                  ; 5B4C   0240 01DD
        MVI     G_01B6, R0                      ; 5B4E   0280 01B6
        CMPI    #$000C, R0                      ; 5B50   0378 000C
        BNEQ    L_5B6D                          ; 5B52   020C 0019

        MVI     G_01DF, R0                      ; 5B54   0280 01DF
        DECR    R0                              ; 5B56   0010
        BEQ     L_5B6E                          ; 5B57   0204 0015

        MVO     R0,     G_01DF                  ; 5B59   0240 01DF
        MVI     G_01C0, R1                      ; 5B5B   0281 01C0
        ADDI    #$0200, R1                      ; 5B5D   02F9 0200
        ADDI    #$0064, R1                      ; 5B5F   02F9 0064
        MVII    #$0004, R3                      ; 5B61   02BB 0004
L_5B63:
        MVI@    R1,     R0                      ; 5B63   0288
        SDBD                                    ; 5B64   0001
        XORI    #$1200, R0                      ; 5B65   03F8 0000 0012
        MVO@    R0,     R1                      ; 5B68   0248
        INCR    R1                              ; 5B69   0009
        DECR    R3                              ; 5B6A   0013
        BNEQ    L_5B63                          ; 5B6B   022C 0009
L_5B6D:
        PULR    R7                              ; 5B6D   02B7

L_5B6E:
        MVII    #$0005, R0                      ; 5B6E   02B8 0005
        MVO     R0,     G_01B6                  ; 5B70   0240 01B6

        JSR     R5,     L_6D4A                  ; 5B72   0004 016C 014A
        BIDECLE $0200                           ; 5B75   0000 0002

        JSR     R5,     L_5A40                  ; 5B77   0004 0158 0240

        J       L_50C0                          ; 5B7A   0004 0350 00C0

L_5B7D:
        PSHR    R5                              ; 5B7D   0275

        JSR     R5,     L_5A40                  ; 5B7E   0004 0158 0240

        MVI     G_01C0, R4                      ; 5B81   0284 01C0
        ADDI    #$0200, R4                      ; 5B83   02FC 0200
        ADDI    #$0050, R4                      ; 5B85   02FC 0050
        SDBD                                    ; 5B87   0001
        MVII    #$5B8F, R1                      ; 5B88   02B9 008F 005B

        JSR     R5,     L_5656                  ; 5B8B   0004 0154 0256

        PULR    R7                              ; 5B8E   02B7

        DECLE   $03F4,  $03D0,  $03A0,  $0010   ; 5B8F   03F4 03D0 03A0 0010
        DECLE   $02A0,  $02B0,  $02C0,  $02D0   ; 5B93   02A0 02B0 02C0 02D0
        DECLE   $0000                           ; 5B97   0000

        PSHR    R5                              ; 5B98   0275
L_5B99:
        MVII    #$000C, R0                      ; 5B99   02B8 000C
        MVO     R0,     G_01B6                  ; 5B9B   0240 01B6

        JSR     R5,     L_6D4A                  ; 5B9D   0004 016C 014A
        BIDECLE $0200                           ; 5BA0   0000 0002

        MVII    #$0016, R0                      ; 5BA2   02B8 0016
        MVO     R0,     G_01DD                  ; 5BA4   0240 01DD
L_5BA6:
        MVII    #$0008, R0                      ; 5BA6   02B8 0008
        MVO     R0,     G_01DF                  ; 5BA8   0240 01DF

        JSR     R5,     L_5B7D                  ; 5BAA   0004 0158 037D
        DECLE   $02B8,  $0002,  $0004           ; 5BAD   02B8 0002 0004

        ANDR    R4,     R0                      ; 5BB0   01A0
        BGT     L_5BA6                          ; 5BB1   022E 000C

        MVII    #$015F, R4                      ; 5BB3   02BC 015F
        SDBD                                    ; 5BB5   0001
        MVI@    R4,     R0                      ; 5BB6   02A0
        CMPI    #$0021, R0                      ; 5BB7   0378 0021
        BLT     L_5BC2                          ; 5BB9   0205 0007

        MVII    #$0028, R0                      ; 5BBB   02B8 0028
        MVO     R0,     G_0124                  ; 5BBD   0240 0124
        CLRR    R0                              ; 5BBF   01C0
        MVO     R0,     G_0125                  ; 5BC0   0240 0125
L_5BC2:
        PULR    R7                              ; 5BC2   02B7

L_5BC3:
        PSHR    R5                              ; 5BC3   0275
        MVI     G_0124, R0                      ; 5BC4   0280 0124
        DECR    R0                              ; 5BC6   0010
        BMI     L_5BEC                          ; 5BC7   020B 0023

        MVO     R0,     G_0124                  ; 5BC9   0240 0124
        BNEQ    L_5BEC                          ; 5BCB   020C 001F

        MVI     G_0125, R0                      ; 5BCD   0280 0125
        ADDI    #$0010, R0                      ; 5BCF   02F8 0010
        CMPI    #$0050, R0                      ; 5BD1   0378 0050
        BGT     L_5BEC                          ; 5BD3   020E 0017

        MVO     R0,     G_0125                  ; 5BD5   0240 0125
        MVII    #$0009, R0                      ; 5BD7   02B8 0009
        MVO     R0,     G_0124                  ; 5BD9   0240 0124
        CLRR    R0                              ; 5BDB   01C0
        MVO     R0,     G_0319                  ; 5BDC   0240 0319

        JSR     R5,     L_5244                  ; 5BDE   0004 0150 0244
        DECLE   $0332,  $00ED,  $005B,  $0333   ; 5BE1   0332 00ED 005B 0333
        DECLE   $00F3,  $005B,  $0000           ; 5BE5   00F3 005B 0000

        MVII    #$0009, R0                      ; 5BE8   02B8 0009
        MVO     R0,     G_0124                  ; 5BEA   0240 0124
L_5BEC:
        PULR    R7                              ; 5BEC   02B7

        DECLE   $0013,  $00AB,  $0001,  $0125   ; 5BED   0013 00AB 0001 0125
        DECLE   $00C0,  $0039,  $0043,  $00AC   ; 5BF1   00C0 0039 0043 00AC
        DECLE   $0001                           ; 5BF5   0001

        SUBR    R4,     R5                      ; 5BF6   0125
        ADDR    R2,     R0                      ; 5BF7   00D0
        RSWD    R1                              ; 5BF8   0039
L_5BF9:
        PSHR    R5                              ; 5BF9   0275
L_5BFA:
        MVII    #$0004, R0                      ; 5BFA   02B8 0004
        MVO     R0,     G_0103                  ; 5BFC   0240 0103
        MVII    #$0014, R0                      ; 5BFE   02B8 0014
        MVO     R0,     G_01EC                  ; 5C00   0240 01EC
        MVII    #$0004, R0                      ; 5C02   02B8 0004
        MVO     R0,     G_0104                  ; 5C04   0240 0104
        MVII    #$0001, R0                      ; 5C06   02B8 0001
        MVO     R0,     G_01DB                  ; 5C08   0240 01DB
        MVII    #$0001, R0                      ; 5C0A   02B8 0001
        MVO     R0,     G_0161                  ; 5C0C   0240 0161
        SDBD                                    ; 5C0E   0001
        MVII    #$9CC7, R3                      ; 5C0F   02BB 00C7 009C

        JSR     R5,     L_5349                  ; 5C12   0004 0150 0349
        DECLE   $0037                           ; 5C15   0037

        JSR     R5,     L_6F66                  ; 5C16   0004 016C 0366
        JSR     R5,     L_6F74                  ; 5C19   0004 016C 0374

        MVII    #$0001, R0                      ; 5C1C   02B8 0001
        MVO     R0,     G_015D                  ; 5C1E   0240 015D
        MVII    #$0002, R0                      ; 5C20   02B8 0002
        MVO     R0,     G_01D3                  ; 5C22   0240 01D3

        JSR     R5,     L_525A                  ; 5C24   0004 0150 025A
        DECLE   $0000                           ; 5C27   0000

        MVII    #$000E, R0                      ; 5C28   02B8 000E
        MVO     R0,     G_033D                  ; 5C2A   0240 033D

        JSR     R5,     L_6D41                  ; 5C2C   0004 016C 0141
        JSR     R5,     L_57D9                  ; 5C2F   0004 0154 03D9
        JSR     R5,     L_5A07                  ; 5C32   0004 0158 0207
        JSR     R5,     L_6D4A                  ; 5C35   0004 016C 014A
        BIDECLE $1E1F                           ; 5C38   001F 001E

        MVII    #$0000, R0                      ; 5C3A   02B8 0000
        MVO     R0,     G_01B6                  ; 5C3C   0240 01B6
        B       L_5C5B                          ; 5C3E   0200 001B

L_5C40:
        PSHR    R5                              ; 5C40   0275
        MVI     G_01E0, R0                      ; 5C41   0280 01E0
        DECR    R0                              ; 5C43   0010
        BMI     L_5C7E                          ; 5C44   020B 0038

        MVO     R0,     G_01E0                  ; 5C46   0240 01E0
        BNEQ    L_5C7E                          ; 5C48   020C 0034

        MVI     G_01E1, R0                      ; 5C4A   0280 01E1
        TSTR    R0                              ; 5C4C   0080
        BNEQ    L_5C67                          ; 5C4D   020C 0018

        MVI     G_01DF, R4                      ; 5C4F   0284 01DF
        SDBD                                    ; 5C51   0001
        ADDI    #$5C7F, R4                      ; 5C52   02FC 007F 005C
        SDBD                                    ; 5C55   0001
        CMPI    #$5CD4, R4                      ; 5C56   037C 00D4 005C
        BLT     L_5C5F                          ; 5C59   0205 0004

L_5C5B:
        SDBD                                    ; 5C5B   0001
        MVII    #$5C7F, R4                      ; 5C5C   02BC 007F 005C
L_5C5F:
        MVI@    R4,     R0                      ; 5C5F   02A0
        MVO     R0,     G_01E0                  ; 5C60   0240 01E0
        SDBD                                    ; 5C62   0001
        MVI@    R4,     R3                      ; 5C63   02A3
        J       L_580F                          ; 5C64   0004 0358 000F

L_5C67:
        MVO     R0,     G_01E0                  ; 5C67   0240 01E0
        CLRR    R0                              ; 5C69   01C0
        MVO     R0,     G_01E1                  ; 5C6A   0240 01E1
        MVII    #$0208, R4                      ; 5C6C   02BC 0208
        SDBD                                    ; 5C6E   0001
        MVII    #$2007, R1                      ; 5C6F   02B9 0007 0020
        MVII    #$0003, R3                      ; 5C72   02BB 0003
L_5C74:
        MVII    #$0009, R0                      ; 5C74   02B8 0009

        JSR     R5,     X_FILL_MEM              ; 5C76   0004 0114 0341

        ADDI    #$001F, R4                      ; 5C79   02FC 001F
        DECR    R3                              ; 5C7B   0013
        BNEQ    L_5C74                          ; 5C7C   022C 0009
L_5C7E:
        PULR    R7                              ; 5C7E   02B7

        DECLE   $009B,  $0007,  $0020,  $0209   ; 5C7F   009B 0007 0020 0209
        DECLE   $0043,  $0020,  $0048,  $0020   ; 5C83   0043 0020 0048 0020
        DECLE   $0049,  $0020,  $0050,  $0000   ; 5C87   0049 0020 0050 0000
        DECLE   $0231,  $0053,  $0020,  $0048   ; 5C8B   0231 0053 0020 0048
        DECLE   $0020,  $004F,  $0020,  $0054   ; 5C8F   0020 004F 0020 0054
        DECLE   $0002,  $0028,  $0064,  $0007   ; 5C93   0002 0028 0064 0007
        DECLE   $0020,  $0208,  $0053,  $0020   ; 5C97   0020 0208 0053 0020
        DECLE   $0055,  $0020,  $0050,  $0020   ; 5C9B   0055 0020 0050 0020
        DECLE   $0045,  $0020,  $0052,  $0000   ; 5C9F   0045 0020 0052 0000
        DECLE   $0232,  $0050,  $0020,  $0052   ; 5CA3   0232 0050 0020 0052
        DECLE   $0020,  $004F,  $0000,  $0259   ; 5CA7   0020 004F 0000 0259
        DECLE   $0047,  $0020,  $004F,  $0020   ; 5CAB   0047 0020 004F 0020
        DECLE   $004C,  $0020,  $0046,  $0002   ; 5CAF   004C 0020 0046 0002
        DECLE   $0028,  $005F,  $0007,  $0020   ; 5CB3   0028 005F 0007 0020
        DECLE   $0208,  $0043,  $004F,  $0050   ; 5CB7   0208 0043 004F 0050
        DECLE   $0059,  $0052,  $0049,  $0047   ; 5CBB   0059 0052 0049 0047
        DECLE   $0048,  $0054,  $0000,  $0232   ; 5CBF   0048 0054 0000 0232
        DECLE   $0031,  $0039,  $0038,  $0037   ; 5CC3   0031 0039 0038 0037
        DECLE   $0000                           ; 5CC7   0000

        MVO@    R0,     R3                      ; 5CC8   0258
        SLL     R1,     1                       ; 5CC9   0049
        SLL     R2,     2                       ; 5CCA   004E
        RLC     R0,     2                       ; 5CCB   0054
        RLC     R2,     2                       ; 5CCC   0056
        NEGR    R0                              ; 5CCD   0020
        SWAP    R3,     1                       ; 5CCE   0043
        SLL     R3,     2                       ; 5CCF   004F
        RLC     R2,     1                       ; 5CD0   0052
        RLC     R0,     1                       ; 5CD1   0050
        EIS                                     ; 5CD2   0002
        DECR    R4                              ; 5CD3   0014
L_5CD4:
        PSHR    R5                              ; 5CD4   0275
L_5CD5:
        CLRR    R0                              ; 5CD5   01C0
        MVO     R0,     G_0103                  ; 5CD6   0240 0103
        MVO     R0,     G_015D                  ; 5CD8   0240 015D

        JSR     R5,     L_682B                  ; 5CDA   0004 0168 002B
        JSR     R5,     L_6D41                  ; 5CDD   0004 016C 0141

        MVII    #$0000, R0                      ; 5CE0   02B8 0000
        MVO     R0,     G_0104                  ; 5CE2   0240 0104
        MVII    #$0001, R0                      ; 5CE4   02B8 0001
        MVO     R0,     G_01B6                  ; 5CE6   0240 01B6

        JSR     R5,     L_5D04                  ; 5CE8   0004 015C 0104

        PULR    R7                              ; 5CEB   02B7

        PSHR    R5                              ; 5CEC   0275
L_5CED:
        CLRR    R0                              ; 5CED   01C0
        MVO     R0,     G_0103                  ; 5CEE   0240 0103
        MVO     R0,     G_015D                  ; 5CF0   0240 015D

        JSR     R5,     L_6D41                  ; 5CF2   0004 016C 0141

        MVII    #$0000, R0                      ; 5CF5   02B8 0000
        MVO     R0,     G_0104                  ; 5CF7   0240 0104
        CLRR    R0                              ; 5CF9   01C0
        MVO     R0,     G_01BC                  ; 5CFA   0240 01BC
        MVII    #$0002, R0                      ; 5CFC   02B8 0002
        MVO     R0,     G_01B6                  ; 5CFE   0240 01B6

        JSR     R5,     L_5D11                  ; 5D00   0004 015C 0111

        PULR    R7                              ; 5D03   02B7

L_5D04:
        PSHR    R5                              ; 5D04   0275
        MOVR    R7,     R4                      ; 5D05   00BC
        ADDI    #$012A, R4                      ; 5D06   02FC 012A

        JSR     R5,     L_580D                  ; 5D08   0004 0158 000D

        MVI     G_01BB, R0                      ; 5D0B   0280 01BB
        MVII    #$0228, R1                      ; 5D0D   02B9 0228
        B       L_5D23                          ; 5D0F   0200 0012

L_5D11:
        PSHR    R5                              ; 5D11   0275
        MOVR    R7,     R4                      ; 5D12   00BC
        ADDI    #$01CD, R4                      ; 5D13   02FC 01CD

        JSR     R5,     L_580D                  ; 5D15   0004 0158 000D

        MVII    #$02DC, R4                      ; 5D18   02BC 02DC
        MVII    #$0014, R0                      ; 5D1A   02B8 0014

        JSR     R5,     X_FILL_ZERO             ; 5D1C   0004 0114 0338

        MVI     G_01BC, R0                      ; 5D1F   0280 01BC
        MVII    #$0228, R1                      ; 5D21   02B9 0228
L_5D23:
        MVII    #$0014, R2                      ; 5D23   02BA 0014
L_5D25:
        DECR    R0                              ; 5D25   0010
        BMI     L_5D2B                          ; 5D26   020B 0003

        ADDR    R2,     R1                      ; 5D28   00D1
        B       L_5D25                          ; 5D29   0220 0005

L_5D2B:
        MVI@    R1,     R0                      ; 5D2B   0288
        SDBD                                    ; 5D2C   0001
        ANDI    #$FFF8, R0                      ; 5D2D   03B8 00F8 00FF
        XORI    #$0007, R0                      ; 5D30   03F8 0007
        MVO@    R0,     R1                      ; 5D32   0248
        INCR    R1                              ; 5D33   0009
        DECR    R2                              ; 5D34   0012
        BNEQ    L_5D2B                          ; 5D35   022C 000B
        PULR    R7                              ; 5D37   02B7

        PSHR    R5                              ; 5D38   0275
L_5D39:
        MVII    #$0003, R0                      ; 5D39   02B8 0003
        MVO     R0,     G_01B6                  ; 5D3B   0240 01B6
        CLRR    R0                              ; 5D3D   01C0
        MVO     R0,     G_015D                  ; 5D3E   0240 015D
        MOVR    R7,     R4                      ; 5D40   00BC
        ADDI    #$0207, R4                      ; 5D41   02FC 0207

        JSR     R5,     L_580D                  ; 5D43   0004 0158 000D

        PULR    R7                              ; 5D46   02B7

        PSHR    R5                              ; 5D47   0275

L_5D48:
        JSR     R5,     L_6D41                  ; 5D48   0004 016C 0141

        MVII    #$0009, R0                      ; 5D4B   02B8 0009
        MVO     R0,     G_01B6                  ; 5D4D   0240 01B6
        MOVR    R7,     R4                      ; 5D4F   00BC
        ADDI    #$001F, R4                      ; 5D50   02FC 001F

        JSR     R5,     L_580D                  ; 5D52   0004 0158 000D

        PULR    R7                              ; 5D55   02B7

        PSHR    R5                              ; 5D56   0275
L_5D57:
        CLRR    R0                              ; 5D57   01C0
        DECLE   $0240,  $0103,  $0240,  $0104   ; 5D58   0240 0103 0240 0104
        DECLE   $0240,  $01E0,  $0004           ; 5D5C   0240 01E0 0004

        ANDR    R4,     R0                      ; 5D5F   01A0
L_5D60:
        BGT     L_5D60                          ; 5D60   022E 0001

        JSR     R5,     L_6D41                  ; 5D62   0004 016C 0141
        JSR     R5,     L_682B                  ; 5D65   0004 0168 002B

        MOVR    R7,     R4                      ; 5D68   00BC
        ADDI    #$01F1, R4                      ; 5D69   02FC 01F1

        JSR     R5,     L_580D                  ; 5D6B   0004 0158 000D

        PULR    R7                              ; 5D6E   02B7

        DECLE   $0003,  $0201,  $0041,  $0069   ; 5D6F   0003 0201 0041 0069
        DECLE   $006D,  $0020,  $0053,  $0068   ; 5D73   006D 0020 0053 0068
        DECLE   $006F,  $0074,  $0000,  $0229   ; 5D77   006F 0074 0000 0229
        DECLE   $0043,  $0068,  $006F,  $006F   ; 5D7B   0043 0068 006F 006F
        DECLE   $0073,  $0065,  $0020,  $0043   ; 5D7F   0073 0065 0020 0043
        DECLE   $006C,  $0075,  $0062,  $0000   ; 5D83   006C 0075 0062 0000
        DECLE   $0251,  $0053,  $0074,  $0061   ; 5D87   0251 0053 0074 0061
        DECLE   $0072,  $0074,  $0020,  $0042   ; 5D8B   0072 0074 0020 0042
        DECLE   $0061,  $0063,  $006B,  $0073   ; 5D8F   0061 0063 006B 0073
        DECLE   $0077,  $0069,  $006E,  $0067   ; 5D93   0077 0069 006E 0067
        DECLE   $0000,  $0279,  $0053,  $0074   ; 5D97   0000 0279 0053 0074
        DECLE   $0061,  $0072,  $0074,  $0020   ; 5D9B   0061 0072 0074 0020
        DECLE   $0046,  $0072,  $006F,  $006E   ; 5D9F   0046 0072 006F 006E
        DECLE   $0074,  $0073,  $0077,  $0069   ; 5DA3   0074 0073 0077 0069
        DECLE   $006E,  $0067,  $0000           ; 5DA7   006E 0067 0000

        MVI@    R4,     R1                      ; 5DAA   02A1
        SLL     R0,     1                       ; 5DAB   0048
        SAR     R3,     2                       ; 5DAC   006F
        SAR     R3,     2                       ; 5DAD   006F
        SAR     R3,     1                       ; 5DAE   006B
        ADCR    R7                              ; 5DAF   002F

        RLC     R3,     1                       ; 5DB0   0053
L_5DB1:
        RRC     R0,     2                       ; 5DB1   0074
        RRC     R2,     1                       ; 5DB2   0072
        SLR     R1,     1                       ; 5DB3   0061
        SAR     R1,     1                       ; 5DB4   0069
        SLR     R3,     2                       ; 5DB5   0067
        SAR     R0,     1                       ; 5DB6   0068
        RRC     R0,     2                       ; 5DB7   0074
        ADCR    R7                              ; 5DB8   002F

        RLC     R3,     1                       ; 5DB9   0053
L_5DBA:
        SAR     R0,     2                       ; 5DBA   006C
        DECLE   $0069,  $0063,  $0065,  $0001   ; 5DBB   0069 0063 0065 0001
        DECLE   $0005,  $0216                   ; 5DBF   0005 0216

        SAR     R0,     2                       ; 5DC1   006C
        SLR     R1,     2                       ; 5DC2   0065
        SLR     R2,     2                       ; 5DC3   0066
        RRC     R0,     2                       ; 5DC4   0074
        ADCR    R7                              ; 5DC5   002F

        RRC     R2,     1                       ; 5DC6   0072
L_5DC7:
        SAR     R1,     1                       ; 5DC7   0069
        DECLE   $0067,  $0068,  $0074,  $0020   ; 5DC8   0067 0068 0074 0020
        DECLE   $0077,  $0068,  $0065,  $0065   ; 5DCC   0077 0068 0065 0065
        DECLE   $006C,  $0000,  $023E           ; 5DD0   006C 0000 023E

        RRC     R0,     2                       ; 5DD3   0074
        SAR     R3,     2                       ; 5DD4   006F
        RRC     R0,     1                       ; 5DD5   0070
        ADCR    R7                              ; 5DD6   002F

        SLR     R2,     1                       ; 5DD7   0062
L_5DD8:
        SAR     R3,     2                       ; 5DD8   006F
        DECLE   $0074,  $0074,  $006F,  $006D   ; 5DD9   0074 0074 006F 006D
        DECLE   $0020,  $0077,  $0068,  $0065   ; 5DDD   0020 0077 0068 0065
        DECLE   $0065,  $006C,  $0000,  $0266   ; 5DE1   0065 006C 0000 0266
        DECLE   $0070,  $0072,  $0065,  $0073   ; 5DE5   0070 0072 0065 0073
        DECLE   $0073,  $0020,  $0073,  $0069   ; 5DE9   0073 0020 0073 0069
        DECLE   $0064,  $0065,  $0020,  $006B   ; 5DED   0064 0065 0020 006B
        DECLE   $0065,  $0079,  $0000,  $028E   ; 5DF1   0065 0079 0000 028E
        DECLE   $0072,  $0065,  $006C,  $0065   ; 5DF5   0072 0065 006C 0065
        DECLE   $0061,  $0073,  $0065,  $0020   ; 5DF9   0061 0073 0065 0020
        DECLE   $0073,  $0069,  $0064,  $0065   ; 5DFD   0073 0069 0064 0065
        DECLE   $0020,  $006B,  $0065,  $0079   ; 5E01   0020 006B 0065 0079
        DECLE   $0000,  $02B6,  $0068,  $0069   ; 5E05   0000 02B6 0068 0069
        DECLE   $0074,  $0020,  $0073,  $0069   ; 5E09   0074 0020 0073 0069
        DECLE   $0064,  $0065,  $0020,  $006B   ; 5E0D   0064 0065 0020 006B
        DECLE   $0065,  $0079,  $0020,  $0061   ; 5E11   0065 0079 0020 0061
        DECLE   $0067,  $0061,  $0069,  $006E   ; 5E15   0067 0061 0069 006E
        DECLE   $0000                           ; 5E19   0000

        ADD@    R1,     R2                      ; 5E1A   02CA
        SLR     R2,     1                       ; 5E1B   0062
        SLR     R1,     2                       ; 5E1C   0065
        SLR     R2,     2                       ; 5E1D   0066
        SAR     R3,     2                       ; 5E1E   006F
        RRC     R2,     1                       ; 5E1F   0072
        SLR     R1,     2                       ; 5E20   0065
        ADCR    R7                              ; 5E21   002F

        SLR     R1,     1                       ; 5E22   0061
L_5E23:
        RRC     R0,     2                       ; 5E23   0074
        ADCR    R7                              ; 5E24   002F

        SLR     R1,     1                       ; 5E25   0061
L_5E26:
        SLR     R2,     2                       ; 5E26   0066
        DECLE   $0074,  $0065,  $0072,  $0000   ; 5E27   0074 0065 0072 0000
        DECLE   $02DE,  $0074,  $0065,  $0065   ; 5E2B   02DE 0074 0065 0065
        DECLE   $0002,  $0005,  $0203,  $0047   ; 5E2F   0002 0005 0203 0047
        DECLE   $004F,  $004C,  $0046,  $0020   ; 5E33   004F 004C 0046 0020
        DECLE   $004D,  $0041,  $0049,  $004E   ; 5E37   004D 0041 0049 004E
        DECLE   $0020,  $004D,  $0045,  $004E   ; 5E3B   0020 004D 0045 004E
        DECLE   $0055,  $0001,  $0003,  $0229   ; 5E3F   0055 0001 0003 0229
        DECLE   $0049,  $004E,  $0054,  $0056   ; 5E43   0049 004E 0054 0056
        DECLE   $0020,  $0054,  $006F,  $0075   ; 5E47   0020 0054 006F 0075
        DECLE   $0072,  $006E,  $0065,  $0079   ; 5E4B   0072 006E 0065 0079
        DECLE   $0000,  $023D,  $0043,  $006C   ; 5E4F   0000 023D 0043 006C
        DECLE   $0061,  $0073,  $0073,  $0069   ; 5E53   0061 0073 0073 0069
        DECLE   $0063,  $0020,  $0043,  $006F   ; 5E57   0063 0020 0043 006F
        DECLE   $0075,  $0072,  $0073,  $0065   ; 5E5B   0075 0072 0073 0065
        DECLE   $0000,  $0251,  $0049,  $006E   ; 5E5F   0000 0251 0049 006E
        DECLE   $0076,  $0069,  $0074,  $0061   ; 5E63   0076 0069 0074 0061
        DECLE   $0074,  $0069,  $006F,  $006E   ; 5E67   0074 0069 006F 006E
        DECLE   $0061,  $006C,  $0020,  $004F   ; 5E6B   0061 006C 0020 004F
        DECLE   $0070,  $0065,  $006E,  $0000   ; 5E6F   0070 0065 006E 0000
        DECLE   $0265,  $0043,  $0065,  $006C   ; 5E73   0265 0043 0065 006C
        DECLE   $0065,  $0062,  $0072,  $0069   ; 5E77   0065 0062 0072 0069
        DECLE   $0074,  $0079,  $0020,  $0050   ; 5E7B   0074 0079 0020 0050
        DECLE   $0072,  $006F,  $002D,  $0041   ; 5E7F   0072 006F 002D 0041
        DECLE   $006D,  $0000,  $0279,  $0054   ; 5E83   006D 0000 0279 0054
        DECLE   $0072,  $0061,  $0069,  $006C   ; 5E87   0072 0061 0069 006C
        DECLE   $0020,  $004F,  $0066,  $0020   ; 5E8B   0020 004F 0066 0020
        DECLE   $0054,  $0065,  $0061,  $0072   ; 5E8F   0054 0065 0061 0072
        DECLE   $0073,  $0000,  $028D,  $0050   ; 5E93   0073 0000 028D 0050
        DECLE   $006C,  $0061,  $0079,  $0020   ; 5E97   006C 0061 0079 0020
        DECLE   $0053,  $0061,  $006D,  $0065   ; 5E9B   0053 0061 006D 0065
        DECLE   $0020,  $0043,  $006F,  $0075   ; 5E9F   0020 0043 006F 0075
        DECLE   $0072,  $0073,  $0065,  $0000   ; 5EA3   0072 0073 0065 0000
        DECLE   $02A1,  $0044,  $0065,  $0073   ; 5EA7   02A1 0044 0065 0073
        DECLE   $0069,  $0067,  $006E,  $0020   ; 5EAB   0069 0067 006E 0020
        DECLE   $0059,  $006F,  $0075,  $0072   ; 5EAF   0059 006F 0075 0072
        DECLE   $0020,  $004F,  $0077,  $006E   ; 5EB3   0020 004F 0077 006E
        DECLE   $0000,  $02B5,  $0044,  $0072   ; 5EB7   0000 02B5 0044 0072
        DECLE   $0069,  $0076,  $0069,  $006E   ; 5EBB   0069 0076 0069 006E
        DECLE   $0067,  $0020,  $0052,  $0061   ; 5EBF   0067 0020 0052 0061
        DECLE   $006E,  $0067,  $0065,  $0000   ; 5EC3   006E 0067 0065 0000
        DECLE   $02C9,  $0050,  $0075,  $0074   ; 5EC7   02C9 0050 0075 0074
        DECLE   $0074,  $0069,  $006E,  $0067   ; 5ECB   0074 0069 006E 0067
        DECLE   $0020,  $0047,  $0072,  $0065   ; 5ECF   0020 0047 0072 0065
        DECLE   $0065,  $006E,  $0000,  $02DD   ; 5ED3   0065 006E 0000 02DD
        DECLE   $0050,  $0072,  $006F,  $0020   ; 5ED7   0050 0072 006F 0020
        DECLE   $0053,  $0068,  $006F,  $0070   ; 5EDB   0053 0068 006F 0070
        DECLE   $0002,  $0005,  $0203,  $0042   ; 5EDF   0002 0005 0203 0042
        DECLE   $0045,  $0047,  $0049,  $004E   ; 5EE3   0045 0047 0049 004E
        DECLE   $0020,  $0047,  $004F,  $004C   ; 5EE7   0020 0047 004F 004C
        DECLE   $0046,  $0020,  $004D,  $0045   ; 5EEB   0046 0020 004D 0045
        DECLE   $004E,  $0055,  $0001,  $0003   ; 5EEF   004E 0055 0001 0003
        DECLE   $0229,  $0050,  $006C,  $0061   ; 5EF3   0229 0050 006C 0061
        DECLE   $0079,  $0020,  $0041,  $006C   ; 5EF7   0079 0020 0041 006C
        DECLE   $006C,  $0020,  $0031,  $0038   ; 5EFB   006C 0020 0031 0038
        DECLE   $0020,  $0048,  $006F,  $006C   ; 5EFF   0020 0048 006F 006C
        DECLE   $0065,  $0073,  $0000,  $023D   ; 5F03   0065 0073 0000 023D
        DECLE   $0050,  $006C,  $0061,  $0079   ; 5F07   0050 006C 0061 0079
        DECLE   $0020,  $0046,  $0072,  $006F   ; 5F0B   0020 0046 0072 006F
        DECLE   $006E,  $0074,  $0020,  $0039   ; 5F0F   006E 0074 0020 0039
        DECLE   $0020,  $0048,  $006F,  $006C   ; 5F13   0020 0048 006F 006C
        DECLE   $0065,  $0073,  $0000,  $0251   ; 5F17   0065 0073 0000 0251
        DECLE   $0050,  $006C,  $0061,  $0079   ; 5F1B   0050 006C 0061 0079
        DECLE   $0020,  $0042,  $0061,  $0063   ; 5F1F   0020 0042 0061 0063
        DECLE   $006B,  $0020,  $0039,  $0020   ; 5F23   006B 0020 0039 0020
        DECLE   $0048,  $006F,  $006C,  $0065   ; 5F27   0048 006F 006C 0065
        DECLE   $0073,  $0000,  $0265,  $0050   ; 5F2B   0073 0000 0265 0050
        DECLE   $0072,  $0065,  $0076,  $0069   ; 5F2F   0072 0065 0076 0069
        DECLE   $0065,  $0077,  $0020,  $0043   ; 5F33   0065 0077 0020 0043
        DECLE   $006F,  $0075,  $0072,  $0073   ; 5F37   006F 0075 0072 0073
        DECLE   $0065,  $0000,  $0279,  $004D   ; 5F3B   0065 0000 0279 004D
        DECLE   $0061,  $0069,  $006E,  $0020   ; 5F3F   0061 0069 006E 0020
        DECLE   $004D,  $0065,  $006E,  $0075   ; 5F43   004D 0065 006E 0075
        DECLE   $0002,  $0001,  $02DD,  $0031   ; 5F47   0002 0001 02DD 0031
        DECLE   $0020,  $006F,  $0072,  $0020   ; 5F4B   0020 006F 0072 0020
        DECLE   $0032,  $0020,  $0047,  $006F   ; 5F4F   0032 0020 0047 006F
        DECLE   $006C,  $0066,  $0065,  $0072   ; 5F53   006C 0066 0065 0072
        DECLE   $0073,  $003F,  $0002,  $0003   ; 5F57   0073 003F 0002 0003
        DECLE   $0215,  $0048,  $0065,  $0061   ; 5F5B   0215 0048 0065 0061
        DECLE   $0064,  $0020,  $0050,  $0072   ; 5F5F   0064 0020 0050 0072
        DECLE   $006F,  $002C,  $0020,  $0044   ; 5F63   006F 002C 0020 0044
        DECLE   $0065,  $0073,  $0069,  $0067   ; 5F67   0065 0073 0069 0067
        DECLE   $006E,  $0065,  $0072,  $002C   ; 5F6B   006E 0065 0072 002C
        DECLE   $0000,  $0229,  $0050,  $0072   ; 5F6F   0000 0229 0050 0072
        DECLE   $006F,  $0067,  $0072,  $0061   ; 5F73   006F 0067 0072 0061
        DECLE   $006D,  $006D,  $0065,  $0072   ; 5F77   006D 006D 0065 0072
        DECLE   $003A,  $0000,  $0265,  $0047   ; 5F7B   003A 0000 0265 0047
        DECLE   $0072,  $006F,  $0075,  $006E   ; 5F7F   0072 006F 0075 006E
        DECLE   $0064,  $0073,  $006B,  $0065   ; 5F83   0064 0073 006B 0065
        DECLE   $0065,  $0070,  $0065,  $0072   ; 5F87   0065 0070 0065 0072
        DECLE   $002C,  $0000,  $0279,  $0047   ; 5F8B   002C 0000 0279 0047
        DECLE   $0072,  $0061,  $0070,  $0068   ; 5F8F   0072 0061 0070 0068
        DECLE   $0069,  $0063,  $0073,  $003A   ; 5F93   0069 0063 0073 003A
        DECLE   $0000,  $02B5,  $0043,  $0061   ; 5F97   0000 02B5 0043 0061
        DECLE   $0064,  $0064,  $0079,  $002C   ; 5F9B   0064 0064 0079 002C
        DECLE   $0020,  $0050,  $0072,  $006F   ; 5F9F   0020 0050 0072 006F
        DECLE   $0067,  $0072,  $0061,  $006D   ; 5FA3   0067 0072 0061 006D
        DECLE   $006D,  $0065,  $0072,  $002C   ; 5FA7   006D 0065 0072 002C
        DECLE   $0000,  $02C9,  $0050,  $0072   ; 5FAB   0000 02C9 0050 0072
        DECLE   $006F,  $0064,  $0075,  $0063   ; 5FAF   006F 0064 0075 0063
        DECLE   $0065,  $0072,  $003A,  $0001   ; 5FB3   0065 0072 003A 0001
        DECLE   $0005,  $0241,  $0053,  $0074   ; 5FB7   0005 0241 0053 0074
        DECLE   $0065,  $0076,  $0065,  $0020   ; 5FBB   0065 0076 0065 0020
        DECLE   $0045,  $0074,  $0074,  $0069   ; 5FBF   0045 0074 0074 0069
        DECLE   $006E,  $0067,  $0065,  $0072   ; 5FC3   006E 0067 0065 0072
        DECLE   $0000,  $0291,  $0043,  $006F   ; 5FC7   0000 0291 0043 006F
        DECLE   $006E,  $006E,  $0069,  $0065   ; 5FCB   006E 006E 0069 0065
        DECLE   $0020,  $0047,  $006F,  $006C   ; 5FCF   0020 0047 006F 006C
        DECLE   $0064,  $006D,  $0061,  $006E   ; 5FD3   0064 006D 0061 006E
        DECLE   $0000                           ; 5FD7   0000

        ADD@    R4,     R1                      ; 5FD8   02E1
        SWAP    R0,     2                       ; 5FD9   0044
        SLR     R1,     1                       ; 5FDA   0061
        RRC     R2,     2                       ; 5FDB   0076
        SLR     R1,     2                       ; 5FDC   0065
        NEGR    R0                              ; 5FDD   0020
        RLC     R3,     2                       ; 5FDE   0057
        SLR     R1,     1                       ; 5FDF   0061
        RRC     R2,     1                       ; 5FE0   0072
        SAR     R0,     1                       ; 5FE1   0068
        SAR     R3,     2                       ; 5FE2   006F
        SAR     R0,     2                       ; 5FE3   006C
        EIS                                     ; 5FE4   0002
L_5FE5:
        MVI     .PSG0.lft_hand,R0               ; 5FE5   0280 01FF
        CMPI    #$009E, R0                      ; 5FE7   0378 009E
        BNEQ    L_6008                          ; 5FE9   020C 001D

        MVI     .PSG0.rgt_hand,R0               ; 5FEB   0280 01FE
        CMPI    #$009C, R0                      ; 5FED   0378 009C
        BNEQ    L_6008                          ; 5FEF   020C 0017

        MVII    #$0031, R0                      ; 5FF1   02B8 0031
        MVO     R0,     G_01C0                  ; 5FF3   0240 01C0
        CLRR    R0                              ; 5FF5   01C0
        MVO     R0,     G_0103                  ; 5FF6   0240 0103

        JSR     R5,     L_6D41                  ; 5FF8   0004 016C 0141
        JSR     R5,     L_594C                  ; 5FFB   0004 0158 014C

        MOVR    R7,     R4                      ; 5FFE   00BC
        ADDI    #$000A, R4                      ; 5FFF   02FC 000A

        JSR     R5,     L_580D                  ; 6001   0004 0158 000D

        MVO     R6,     G_0102                  ; 6004   0246 0102
        EIS                                     ; 6006   0002
L_6007:
        DECR    R7                              ; 6007   0017
L_6008:
        MOVR    R5,     R7                      ; 6008   00AF

        DECLE   $0003,  $0218,  $0054,  $006F   ; 6009   0003 0218 0054 006F
        DECLE   $0020,  $004D,  $0079,  $0020   ; 600D   0020 004D 0079 0020
        DECLE   $0046,  $0061,  $006D,  $0069   ; 6011   0046 0061 006D 0069
        DECLE   $006C,  $0079,  $0000,  $022D   ; 6015   006C 0079 0000 022D
        DECLE   $0057,  $0069,  $0074,  $0068   ; 6019   0057 0069 0074 0068
        DECLE   $0020,  $004C,  $006F,  $0076   ; 601D   0020 004C 006F 0076
        DECLE   $0065,  $003A,  $0001,  $0006   ; 6021   0065 003A 0001 0006
        DECLE   $0251,  $004B,  $0079,  $006C   ; 6025   0251 004B 0079 006C
        DECLE   $0065,  $0000,  $0265,  $0053   ; 6029   0065 0000 0265 0053
        DECLE   $0074,  $0065,  $0076,  $0065   ; 602D   0074 0065 0076 0065
        DECLE   $006E,  $0000,  $0279,  $0045   ; 6031   006E 0000 0279 0045
        DECLE   $0074,  $0074,  $0069,  $006E   ; 6035   0074 0074 0069 006E
        DECLE   $0067,  $0065,  $0072,  $0001   ; 6039   0067 0065 0072 0001
        DECLE   $0005,  $025C,  $0052,  $0075   ; 603D   0005 025C 0052 0075
        DECLE   $0073,  $0073,  $0065,  $006C   ; 6041   0073 0073 0065 006C
        DECLE   $006C,  $0000,  $0270,  $0045   ; 6045   006C 0000 0270 0045
        DECLE   $0064,  $0077,  $0061,  $0072   ; 6049   0064 0077 0061 0072
        DECLE   $0064,  $0000,  $0284,  $0045   ; 604D   0064 0000 0284 0045
        DECLE   $0074,  $0074,  $0069,  $006E   ; 6051   0074 0074 0069 006E
        DECLE   $0067,  $0065,  $0072,  $0001   ; 6055   0067 0065 0072 0001
        DECLE   $0001,  $02A5,  $004C,  $0069   ; 6059   0001 02A5 004C 0069
        DECLE   $006E,  $0064,  $0061,  $0000   ; 605D   006E 0064 0061 0000
        DECLE   $02BA,  $004D,  $0069,  $0063   ; 6061   02BA 004D 0069 0063
        DECLE   $0068,  $0069,  $0065,  $0000   ; 6065   0068 0069 0065 0000
        DECLE   $02CF,  $0041,  $0073,  $0061   ; 6069   02CF 0041 0073 0061
        DECLE   $007A,  $0061,  $0077,  $0061   ; 606D   007A 0061 0077 0061
        DECLE   $0000,  $02E4,  $0045,  $0074   ; 6071   0000 02E4 0045 0074
        DECLE   $0074,  $0069,  $006E,  $0067   ; 6075   0074 0069 006E 0067
        DECLE   $0065,  $0072,  $0002,  $0275   ; 6079   0065 0072 0002 0275
        DECLE   $0004                           ; 607D   0004

        ANDR    R5,     R4                      ; 607E   01AC
        CMPR    R4,     R3                      ; 607F   0163
        MVI     G_01B6, R2                      ; 6080   0282 01B6
        MOVR    R2,     R1                      ; 6082   0091
        INCR    R2                              ; 6083   000A
        ADDR    R7,     R2                      ; 6084   00FA
        ADD@    R2,     R7                      ; 6085   02D7

        DECR    R1                              ; 6086   0011
        MOVR    R2,     R1                      ; 6087   0091
        MOVR    R2,     R1                      ; 6088   0091
        DECR    R0                              ; 6089   0010
        COMR    R0                              ; 608A   0018
        MOVR    R7,     R0                      ; 608B   00B8
        DECR    R0                              ; 608C   0010
        DECR    R0                              ; 608D   0010
        DECR    R0                              ; 608E   0010
        DECR    R1                              ; 608F   0011
        DECR    R0                              ; 6090   0010
        DECR    R0                              ; 6091   0010
        DECR    R0                              ; 6092   0010
        DECR    R0                              ; 6093   0010
        DECR    R0                              ; 6094   0010
        DECR    R0                              ; 6095   0010
        PULR    R7                              ; 6096   02B7

        JSR     R5,     L_6D54                  ; 6097   0004 016C 0154
        JSR     R5,     L_5CD4                  ; 609A   0004 015C 00D4

L_609D:
        PULR    R7                              ; 609D   02B7

        MVII    #$0001, R4                      ; 609E   02BC 0001
        MOVR    R0,     R1                      ; 60A0   0081
        INCR    R1                              ; 60A1   0009
        ADDR    R7,     R1                      ; 60A2   00F9
        ADD@    R1,     R7                      ; 60A3   02CF

        DECR    R2                              ; 60A4   0012
        DECR    R2                              ; 60A5   0012
        DECR    R0                              ; 60A6   0010
        SWAP    R3,     2                       ; 60A7   0047
        SWAP    R3,     2                       ; 60A8   0047
        SWAP    R3,     2                       ; 60A9   0047
        DECR    R0                              ; 60AA   0010
        DECR    R1                              ; 60AB   0011
        DECR    R1                              ; 60AC   0011
        DECR    R1                              ; 60AD   0011
        DECR    R0                              ; 60AE   0010
        RLC     R3,     1                       ; 60AF   0053
        RLC     R3,     1                       ; 60B0   0053
        RLC     R3,     1                       ; 60B1   0053
        DECR    R0                              ; 60B2   0010
        DECR    R2                              ; 60B3   0012
        PULR    R7                              ; 60B4   02B7

        NEGR    R4                              ; 60B5   0024
        MVI     G_01B9, R0                      ; 60B6   0280 01B9
        CMPI    #$0064, R0                      ; 60B8   0378 0064
        BEQ     L_609D                          ; 60BA   0224 001E

        MVII    #$0012, R3                      ; 60BC   02BB 0012
        MVII    #$0161, R1                      ; 60BE   02B9 0161
        CMPI    #$0028, R0                      ; 60C0   0378 0028
        BEQ     L_60C8                          ; 60C2   0204 0004

        MVII    #$0063, R3                      ; 60C4   02BB 0063
        MVII    #$01BA, R1                      ; 60C6   02B9 01BA
L_60C8:
        MVI@    R1,     R0                      ; 60C8   0288
        ADDR    R4,     R0                      ; 60C9   00E0
        BEQ     L_60D3                          ; 60CA   0204 0007
        BMI     L_60D3                          ; 60CC   020B 0005

        CMPR    R3,     R0                      ; 60CE   0158
        BGT     L_60D6                          ; 60CF   020E 0005
        B       L_60D8                          ; 60D1   0200 0005

L_60D3:
        MOVR    R3,     R0                      ; 60D3   0098
        B       L_60D8                          ; 60D4   0200 0002

L_60D6:
        MVII    #$0001, R0                      ; 60D6   02B8 0001
L_60D8:
        MVO@    R0,     R1                      ; 60D8   0248
        MVII    #$011F, R4                      ; 60D9   02BC 011F
        MVI     G_01BA, R1                      ; 60DB   0281 01BA
        CLRR    R0                              ; 60DD   01C0

        JSR     R5,     L_527B                  ; 60DE   0004 0150 027B
        JSR     R5,     L_6D4A                  ; 60E1   0004 016C 014A
        BIDECLE $0080                           ; 60E4   0080 0000
        DECLE   $0004,  $01A0,  $022E,  $0004   ; 60E6   0004 01A0 022E 0004

        PULR    R7                              ; 60EA   02B7

        MVI     G_01B9, R0                      ; 60EB   0280 01B9
        CMPI    #$0028, R0                      ; 60ED   0378 0028
        BEQ     L_610B                          ; 60EF   0204 001A

        CMPI    #$003C, R0                      ; 60F1   0378 003C
        BEQ     L_6103                          ; 60F3   0204 000E
        B       L_6107                          ; 60F5   0200 0010

        MVI     G_01B9, R0                      ; 60F7   0280 01B9
        CMPI    #$0028, R0                      ; 60F9   0378 0028
        BEQ     L_6107                          ; 60FB   0204 000A

        CMPI    #$003C, R0                      ; 60FD   0378 003C
        BEQ     L_610B                          ; 60FF   0204 000A
        B       L_6103                          ; 6101   0200 0000

L_6103:
        MVII    #$0028, R0                      ; 6103   02B8 0028
        B       L_610D                          ; 6105   0200 0006

L_6107:
        MVII    #$003C, R0                      ; 6107   02B8 003C
        B       L_610D                          ; 6109   0200 0002

L_610B:
        MVII    #$0064, R0                      ; 610B   02B8 0064
L_610D:
        MVO     R0,     G_01B9                  ; 610D   0240 01B9

        JSR     R5,     L_5A40                  ; 610F   0004 0158 0240
        DECLE   $0004,  $01A0,  $022E,  $0005   ; 6112   0004 01A0 022E 0005

        PULR    R7                              ; 6116   02B7

        MVII    #$01BB, R2                      ; 6117   02BA 01BB
        MVII    #$0009, R3                      ; 6119   02BB 0009
        CMPI    #$0001, R1                      ; 611B   0379 0001
        BEQ     L_6122                          ; 611D   0204 0003

        INCR    R2                              ; 611F   000A
        MVII    #$0004, R3                      ; 6120   02BB 0004
L_6122:
        MVII    #$0001, R4                      ; 6122   02BC 0001
        CMPI    #$0005, R0                      ; 6124   0378 0005
        BGT     L_6129                          ; 6126   020E 0001

        NEGR    R4                              ; 6128   0024

L_6129:
        JSR     R5,     L_6199                  ; 6129   0004 0160 0199

L_612C:
        PSHR    R1                              ; 612C   0271
        DECLE   $0004,  $01A0,  $022E,  $0005   ; 612D   0004 01A0 022E 0005

        PULR    R1                              ; 6131   02B1
        CMPI    #$0001, R1                      ; 6132   0379 0001
        BNEQ    L_613A                          ; 6134   020C 0004

        JSR     R5,     L_5D04                  ; 6136   0004 015C 0104

        PULR    R7                              ; 6139   02B7

L_613A:
        JSR     R5,     L_5D11                  ; 613A   0004 015C 0111

        PULR    R7                              ; 613D   02B7

        MVII    #$0000, R4                      ; 613E   02BC 0000
        MVO     R4,     G_01DE                  ; 6140   0244 01DE
        MVI     G_015E, R2                      ; 6142   0282 015E
        MVII    #$0001, R4                      ; 6144   02BC 0001
        MOVR    R0,     R1                      ; 6146   0081
        INCR    R1                              ; 6147   0009
        ADDR    R7,     R1                      ; 6148   00F9
        ADD@    R1,     R7                      ; 6149   02CF

        DECR    R1                              ; 614A   0011
        DECR    R1                              ; 614B   0011
        DECR    R0                              ; 614C   0010
        COMR    R2                              ; 614D   001A
        COMR    R2                              ; 614E   001A
        COMR    R2                              ; 614F   001A
        DECR    R0                              ; 6150   0010
        DECR    R2                              ; 6151   0012
        DECR    R2                              ; 6152   0012
        DECR    R2                              ; 6153   0012
        DECR    R0                              ; 6154   0010
        COMR    R3                              ; 6155   001B
        COMR    R3                              ; 6156   001B
        COMR    R3                              ; 6157   001B
        DECR    R0                              ; 6158   0010
        DECR    R1                              ; 6159   0011
L_615A:
        PULR    R7                              ; 615A   02B7

        NEGR    R4                              ; 615B   0024
        MVII    #$0004, R5                      ; 615C   02BD 0004
        MVII    #$001F, R3                      ; 615E   02BB 001F
        ADDI    #$01D1, R2                      ; 6160   02FA 01D1
        B       L_617B                          ; 6162   0200 0017

        NEGR    R4                              ; 6164   0024
        MVII    #$0005, R5                      ; 6165   02BD 0005
        MVI     G_01DB, R0                      ; 6167   0280 01DB
        CMPI    #$0002, R0                      ; 6169   0378 0002
        BEQ     L_615A                          ; 616B   0224 0012

        MVII    #$000D, R3                      ; 616D   02BB 000D
        ADDI    #$01C6, R2                      ; 616F   02FA 01C6
        MVI     G_015E, R1                      ; 6171   0281 015E
        ADDI    #$01D3, R1                      ; 6173   02F9 01D3
        MVI@    R1,     R0                      ; 6175   0288
        CMPI    #$0002, R0                      ; 6176   0378 0002
        BEQ     L_617B                          ; 6178   0204 0001

        DECR    R3                              ; 617A   0013
L_617B:
        PSHR    R5                              ; 617B   0275

        JSR     R5,     L_6199                  ; 617C   0004 0160 0199
        JSR     R5,     L_68C9                  ; 617F   0004 0168 00C9
        JSR     R5,     L_684E                  ; 6182   0004 0168 004E
        JSR     R5,     L_6D4A                  ; 6185   0004 016C 014A
        BIDECLE $0010                           ; 6188   0010 0000
        DECLE   $02B5,  $037D,  $0004,  $020C   ; 618A   02B5 037D 0004 020C
        DECLE   $0005,  $0004,  $01A0,  $022E   ; 618E   0005 0004 01A0 022E
        DECLE   $0004                           ; 6192   0004

        PULR    R7                              ; 6193   02B7

        DECLE   $0004,  $01A0,  $022E,  $0005   ; 6194   0004 01A0 022E 0005

        PULR    R7                              ; 6198   02B7

L_6199:
        MVI@    R2,     R0                      ; 6199   0290
        ADDR    R4,     R0                      ; 619A   00E0
        BMI     L_61A2                          ; 619B   020B 0005

        CMPR    R3,     R0                      ; 619D   0158
        BGT     L_61A5                          ; 619E   020E 0005
        B       L_61A6                          ; 61A0   0200 0004

L_61A2:
        MOVR    R3,     R0                      ; 61A2   0098
        B       L_61A6                          ; 61A3   0200 0001

L_61A5:
        CLRR    R0                              ; 61A5   01C0
L_61A6:
        MVO@    R0,     R2                      ; 61A6   0250
        MOVR    R5,     R7                      ; 61A7   00AF

        DECLE   $0275,  $0284,  $01B6,  $037C   ; 61A8   0275 0284 01B6 037C
        DECLE   $0006,  $0204,  $004E,  $0004   ; 61AC   0006 0204 004E 0004

        ANDR    R5,     R4                      ; 61B0   01AC
        CMPR    R4,     R3                      ; 61B1   0163
        INCR    R4                              ; 61B2   000C
        ADDR    R7,     R4                      ; 61B3   00FC
        ADD@    R4,     R7                      ; 61B4   02E7

        DECR    R1                              ; 61B5   0011
        DECR    R0                              ; 61B6   0010
        DECR    R0                              ; 61B7   0010
        DECR    R0                              ; 61B8   0010
        DECR    R0                              ; 61B9   0010
L_61BA:
        DECR    R7                              ; 61BA   0017

        SLL     R0,     1                       ; 61BB   0048
        RRC     R3,     2                       ; 61BC   0077
        DECR    R0                              ; 61BD   0010
        DECR    R1                              ; 61BE   0011
        DECR    R0                              ; 61BF   0010
        DECR    R0                              ; 61C0   0010
        DECR    R0                              ; 61C1   0010
        DECR    R0                              ; 61C2   0010
        DECR    R0                              ; 61C3   0010
        DECR    R1                              ; 61C4   0011
L_61C5:
        PULR    R7                              ; 61C5   02B7

        JSR     R5,     L_6D54                  ; 61C6   0004 016C 0154

        J       L_5CD5                          ; 61C9   0004 035C 00D5

        MVII    #$0006, R0                      ; 61CC   02B8 0006
        MVII    #$0004, R1                      ; 61CE   02B9 0004
        MVII    #$002F, R2                      ; 61D0   02BA 002F
        MVII    #$01C6, R3                      ; 61D2   02BB 01C6
        ADD     G_015E, R3                      ; 61D4   02C3 015E
        MVI@    R3,     R3                      ; 61D6   029B
        CMPI    #$000C, R3                      ; 61D7   037B 000C
        BNEQ    L_61E1                          ; 61D9   020C 0006

        MVII    #$000C, R0                      ; 61DB   02B8 000C
        MVII    #$0008, R1                      ; 61DD   02B9 0008
        MVII    #$002F, R2                      ; 61DF   02BA 002F
L_61E1:
        MVO     R0,     G_01C3                  ; 61E1   0240 01C3
        MVO     R0,     G_01CD                  ; 61E3   0240 01CD
        MVO     R1,     G_01CE                  ; 61E5   0241 01CE
        MVO     R2,     G_01CF                  ; 61E7   0242 01CF
        MVII    #$0006, R0                      ; 61E9   02B8 0006
        MVO     R0,     G_01B6                  ; 61EB   0240 01B6
        CLRR    R0                              ; 61ED   01C0
        MVO     R0,     G_01DD                  ; 61EE   0240 01DD
        MVO     R0,     G_0353                  ; 61F0   0240 0353
        MVO     R0,     G_01DE                  ; 61F2   0240 01DE

        JSR     R5,     L_68C9                  ; 61F4   0004 0168 00C9
        JSR     R5,     L_5A40                  ; 61F7   0004 0158 0240

        J       L_55FE                          ; 61FA   0004 0354 01FE

        DECLE   $0284,  $01C2,  $037C,  $0000   ; 61FD   0284 01C2 037C 0000
        DECLE   $020C,  $0029,  $0358,  $0224   ; 6201   020C 0029 0358 0224
        DECLE   $0040,  $0004                   ; 6205   0040 0004

        ANDR    R5,     R4                      ; 6207   01AC
        CMPR    R5,     R2                      ; 6208   016A
L_6209:
        MVI     G_01C1, R1                      ; 6209   0281 01C1
        SLR     R1,     2                       ; 620B   0065
        SLR     R1,     2                       ; 620C   0065
        MVO     R1,     G_01CB                  ; 620D   0241 01CB
        SDBD                                    ; 620F   0001
        ADDI    #$59FF, R1                      ; 6210   02F9 00FF 0059
        MVI@    R1,     R0                      ; 6213   0288
        MVO     R0,     G_01CC                  ; 6214   0240 01CC
        MVII    #$0001, R0                      ; 6216   02B8 0001
        MVO     R0,     G_01C2                  ; 6218   0240 01C2
        MVI     G_01CE, R0                      ; 621A   0280 01CE
        MVO     R0,     G_01C3                  ; 621C   0240 01C3
        MVI     G_015E, R1                      ; 621E   0281 015E
        ADDI    #$01C6, R1                      ; 6220   02F9 01C6
        MVI@    R1,     R0                      ; 6222   0288
L_6223:
        CMPI    #$000C, R0                      ; 6223   0378 000C
        DECLE   $0204,  $0004,  $0004           ; 6225   0204 0004 0004

        ANDR    R4,     R0                      ; 6228   01A0
        BGT     L_6223                          ; 6229   022E 0007
        PULR    R7                              ; 622B   02B7

        DECLE   $0004                           ; 622C   0004

        ANDR    R5,     R4                      ; 622D   01AC
        CMPR    R4,     R3                      ; 622E   0163
        MVI     G_01CA, R0                      ; 622F   0280 01CA
        CMPI    #$00FF, R0                      ; 6231   0378 00FF
        BNEQ    L_61C5                          ; 6233   022C 006F

        MVI     G_01D0, R0                      ; 6235   0280 01D0
        MVI     G_01C5, R1                      ; 6237   0281 01C5
        SLL     R0,     1                       ; 6239   0048
        PSHR    R1                              ; 623A   0271
        SLL     R1,     1                       ; 623B   0049
        ADD@    R6,     R1                      ; 623C   02F1
        SUBR    R0,     R1                      ; 623D   0101
        BEQ     L_6247                          ; 623E   0204 0007
        BPL     L_624B                          ; 6240   0203 0009

        NEGR    R1                              ; 6242   0021
        MVII    #$0000, R0                      ; 6243   02B8 0000
        B       L_624D                          ; 6245   0200 0006

L_6247:
        MVII    #$0001, R0                      ; 6247   02B8 0001
        B       L_624D                          ; 6249   0200 0002

L_624B:
        MVII    #$0002, R0                      ; 624B   02B8 0002
L_624D:
        MVO     R0,     G_01C9                  ; 624D   0240 01C9
        MVO     R1,     G_01CA                  ; 624F   0241 01CA
        PULR    R7                              ; 6251   02B7

        DECLE   $0275,  $0284,  $01B6,  $037C   ; 6252   0275 0284 01B6 037C
        DECLE   $0003,  $0204,  $0007,  $037C   ; 6256   0003 0204 0007 037C
        DECLE   $0000,  $0204,  $0003,  $0004   ; 625A   0000 0204 0003 0004

        ANDR    R5,     R4                      ; 625E   01AC
        CMPR    R4,     R3                      ; 625F   0163
        INCR    R4                              ; 6260   000C
        ADDR    R7,     R4                      ; 6261   00FC
        ADD@    R4,     R7                      ; 6262   02E7

        DECR    R1                              ; 6263   0011
        ADCR    R1                              ; 6264   0029
        XORR    R2,     R6                      ; 6265   01D6
        BUSC    L_612C                          ; 6266   0227 013B

        CLRR    R0                              ; 6268   01C0
        DECR    R0                              ; 6269   0010
        DECR    R0                              ; 626A   0010
        SUBR    R3,     R7                      ; 626B   011F

        DECR    R1                              ; 626C   0011
        DECR    R0                              ; 626D   0010
        TSTR    R5                              ; 626E   00AD
        DECR    R0                              ; 626F   0010
        DECR    R0                              ; 6270   0010
        ADDR    R3,     R7                      ; 6271   00DF

        DECR    R0                              ; 6272   0010
        PULR    R7                              ; 6273   02B7

        CMPI    #$00FF, R0                      ; 6274   0378 00FF
        BEQ     L_6289                          ; 6276   0204 0011

        CMPI    #$0000, R0                      ; 6278   0378 0000
        BEQ     L_6283                          ; 627A   0204 0007

        JSR     R5,     L_6D54                  ; 627C   0004 016C 0154

        J       L_5CD5                          ; 627F   0004 035C 00D5
L_6282:
        PULR    R7                              ; 6282   02B7

L_6283:
        CMP@    R3,     R0                      ; 6283   0358
        BEQ     L_6282                          ; 6284   0224 0003
        J       L_5D57                          ; 6286   0004 035C 0157
L_6289:
        J       L_5BFA                          ; 6289   0004 0358 03FA

        DECLE   $0378,  $000B,  $022C,  $000D   ; 628C   0378 000B 022C 000D
        DECLE   $0004,  $01A0,  $022E,  $0000   ; 6290   0004 01A0 022E 0000

        MVI     G_01BB, R1                      ; 6294   0281 01BB
        MOVR    R1,     R0                      ; 6296   0088
        INCR    R1                              ; 6297   0009
        ADDR    R7,     R1                      ; 6298   00F9
        ADD@    R1,     R7                      ; 6299   02CF

        SLR     R2,     1                       ; 629A   0062
        SLR     R2,     1                       ; 629B   0062
        SLR     R2,     1                       ; 629C   0062
        SLR     R2,     1                       ; 629D   0062
        SLR     R2,     1                       ; 629E   0062
        RRC     R0,     2                       ; 629F   0074
        XORR    R0,     R6                      ; 62A0   01C6
        INCR    R2                              ; 62A1   000A
        GSWD    R3                              ; 62A2   0033
        SLLC    R3,     2                       ; 62A3   005F
        MVII    #$0004, R0                      ; 62A4   02B8 0004
        MVO     R0,     G_0103                  ; 62A6   0240 0103
        MVII    #$0005, R0                      ; 62A8   02B8 0005
        MVO     R0,     G_01B6                  ; 62AA   0240 01B6
        MVII    #$0004, R0                      ; 62AC   02B8 0004
        MVO     R0,     G_0104                  ; 62AE   0240 0104
        MVII    #$0001, R0                      ; 62B0   02B8 0001
        MVO     R0,     G_01DC                  ; 62B2   0240 01DC
        MVII    #$0002, R0                      ; 62B4   02B8 0002
        MVO     R0,     G_01EB                  ; 62B6   0240 01EB
        CLRR    R0                              ; 62B8   01C0
        MVO     R0,     G_0161                  ; 62B9   0240 0161
        MVO     R0,     G_01E2                  ; 62BB   0240 01E2
        MVO     R0,     G_0177                  ; 62BD   0240 0177
        MVII    #$0002, R0                      ; 62BF   02B8 0002
        MVO     R0,     G_015D                  ; 62C1   0240 015D
        SDBD                                    ; 62C3   0001
        MVII    #$9000, R3                      ; 62C4   02BB 0000 0090

        JSR     R5,     L_5349                  ; 62C7   0004 0150 0349
        DECLE   $0037                           ; 62CA   0037

        B       L_64D7                          ; 62CB   0200 020A

        MVII    #$0002, R0                      ; 62CD   02B8 0002
        MVO     R0,     G_01DC                  ; 62CF   0240 01DC
        SDBD                                    ; 62D1   0001
        MVII    #$9000, R3                      ; 62D2   02BB 0000 0090

        JSR     R5,     L_5349                  ; 62D5   0004 0150 0349
        DECLE   $0037                           ; 62D8   0037

        CLRR    R0                              ; 62D9   01C0
        MVO     R0,     G_01E2                  ; 62DA   0240 01E2
        MVO     R0,     G_0177                  ; 62DC   0240 0177
        MVII    #$0001, R0                      ; 62DE   02B8 0001
        MVO     R0,     G_0161                  ; 62E0   0240 0161
        MVII    #$0002, R0                      ; 62E2   02B8 0002
        MVO     R0,     G_0162                  ; 62E4   0240 0162
        MVII    #$0002, R0                      ; 62E6   02B8 0002
        MVO     R0,     G_015D                  ; 62E8   0240 015D

        JSR     R5,     L_5644                  ; 62EA   0004 0154 0244
        JSR     R5,     L_564D                  ; 62ED   0004 0154 024D
        JSR     R5,     L_549C                  ; 62F0   0004 0154 009C
        JSR     R5,     L_6F7E                  ; 62F3   0004 016C 037E

        J       L_6C15                          ; 62F6   0004 036C 0015
        J       L_5D48                          ; 62F9   0004 035C 0148

        SLL     R0,     1                       ; 62FC   0048
        PSHR    R0                              ; 62FD   0270
        SLL     R0,     2                       ; 62FE   004C
        SLL     R0,     1                       ; 62FF   0048
        ADD@    R6,     R0                      ; 6300   02F0
        SDBD                                    ; 6301   0001
        MVII    #$A2B4, R4                      ; 6302   02BC 00B4 00A2
        ADDR    R0,     R4                      ; 6305   00C4
        MVII    #$0163, R5                      ; 6306   02BD 0163
L_6308:
        MVI@    R4,     R0                      ; 6308   02A0
        MVO@    R0,     R5                      ; 6309   0268
        CMPI    #$0175, R5                      ; 630A   037D 0175
        BLT     L_6308                          ; 630C   0225 0005
        B       L_633F                          ; 630E   0200 002F

        DECLE   $0378,  $0000,  $0204,  $0005   ; 6310   0378 0000 0204 0005
        DECLE   $0378,  $000B,  $0204,  $0017   ; 6314   0378 000B 0204 0017
        DECLE   $02B7,  $0004,  $01A0,  $022E   ; 6318   02B7 0004 01A0 022E
        DECLE   $0000                           ; 631C   0000

        MVII    #$000C, R0                      ; 631D   02B8 000C
        MVO     R0,     G_033C                  ; 631F   0240 033C
        MVI     G_01B7, R0                      ; 6321   0280 01B7
        MVO     R0,     G_01B6                  ; 6323   0240 01B6
        CMPI    #$0005, R0                      ; 6325   0378 0005
        BNEQ    L_632C                          ; 6327   020C 0003

        JSR     R5,     L_594C                  ; 6329   0004 0158 014C

L_632C:
        J       L_5A41                          ; 632C   0004 0358 0241

        DECLE   $0004,  $01A0,  $022E,  $0000   ; 632F   0004 01A0 022E 0000

        JSR     R5,     L_682B                  ; 6333   0004 0168 002B

        MVI     G_01B7, R0                      ; 6336   0280 01B7
        CMPI    #$0004, R0                      ; 6338   0378 0004
        BEQ     L_633F                          ; 633A   0204 0003
        J       L_5CD5                          ; 633C   0004 035C 00D5
L_633F:
        J       L_5CED                          ; 633F   0004 035C 00ED

        CMPI    #$0000, R0                      ; 6342   0378 0000
        BEQ     L_634A                          ; 6344   0204 0004

        CMPI    #$000B, R0                      ; 6346   0378 000B
        BNEQ    L_6282                          ; 6348   022C 00C7

L_634A:
        PSHR    R0                              ; 634A   0270
        DECLE   $0004,  $01A0,  $022E,  $0000   ; 634B   0004 01A0 022E 0000

        PULR    R0                              ; 634F   02B0
L_6350:
        MVI     G_015E, R4                      ; 6350   0284 015E
        MVII    #$01D5, R1                      ; 6352   02B9 01D5
        MVII    #$01D3, R2                      ; 6354   02BA 01D3
        ADDR    R4,     R1                      ; 6356   00E1
        ADDR    R4,     R2                      ; 6357   00E2
        ADDR    R4,     R4                      ; 6358   00E4
        MOVR    R4,     R5                      ; 6359   00A5
        ADDI    #$0346, R4                      ; 635A   02FC 0346
        ADDI    #$0342, R5                      ; 635C   02FD 0342
        CMPI    #$0000, R0                      ; 635E   0378 0000
        BEQ     L_6366                          ; 6360   0204 0004

        MVII    #$034A, R4                      ; 6362   02BC 034A
        MVII    #$01D7, R1                      ; 6364   02B9 01D7
L_6366:
        MVI@    R4,     R0                      ; 6366   02A0
        MVO@    R0,     R5                      ; 6367   0268
        MVI@    R4,     R0                      ; 6368   02A0
        MVO@    R0,     R5                      ; 6369   0268
        MVI@    R1,     R0                      ; 636A   0288
        MVO@    R0,     R2                      ; 636B   0250

        JSR     R5,     L_6D4A                  ; 636C   0004 016C 014A
        BIDECLE $0004                           ; 636F   0004 0000

        MVII    #$0005, R0                      ; 6371   02B8 0005
        MVO     R0,     G_01B6                  ; 6373   0240 01B6

        JSR     R5,     L_5A40                  ; 6375   0004 0158 0240
        JSR     R5,     L_51EF                  ; 6378   0004 0150 01EF
        DECLE   $0008                           ; 637B   0008

        JSR     R5,     L_55FD                  ; 637C   0004 0154 01FD

        J       L_50C0                          ; 637F   0004 0350 00C0

        DECLE   $0378,  $0000,  $022C,  $0103   ; 6382   0378 0000 022C 0103
        DECLE   $0004,  $01A0,  $022E,  $0000   ; 6386   0004 01A0 022E 0000

        MVI     G_01DB, R0                      ; 638A   0280 01DB
        CMPI    #$0002, R0                      ; 638C   0378 0002
        BEQ     L_639B                          ; 638E   0204 000B

        MVII    #$0004, R0                      ; 6390   02B8 0004
        MVO     R0,     G_0104                  ; 6392   0240 0104
        MVII    #$0005, R0                      ; 6394   02B8 0005
        MVO     R0,     G_01B6                  ; 6396   0240 01B6
        B       L_64F9                          ; 6398   0200 015F
        PULR    R7                              ; 639A   02B7
L_639B:
        J       L_6C15                          ; 639B   0004 036C 0015

        MVI     G_01B9, R2                      ; 639E   0282 01B9
        CMPI    #$000A, R0                      ; 63A0   0378 000A
        BEQ     L_63A9                          ; 63A2   0204 0005

        CMPI    #$000B, R0                      ; 63A4   0378 000B
        BEQ     L_63C2                          ; 63A6   0204 001A
        PULR    R7                              ; 63A8   02B7

L_63A9:
        MVI     G_01B6, R0                      ; 63A9   0280 01B6
        MVO     R0,     G_01B7                  ; 63AB   0240 01B7
        MVII    #$000B, R0                      ; 63AD   02B8 000B
        MVO     R0,     G_01B6                  ; 63AF   0240 01B6
        MVII    #$0020, R0                      ; 63B1   02B8 0020
        MVO     R0,     G_033C                  ; 63B3   0240 033C

        JSR     R5,     L_683C                  ; 63B5   0004 0168 003C
        JSR     R5,     L_5A40                  ; 63B8   0004 0158 0240
        DECLE   $02B8,  $0002,  $0004,  $01A0   ; 63BB   02B8 0002 0004 01A0
        DECLE   $022E,  $0003                   ; 63BF   022E 0003

        PULR    R7                              ; 63C1   02B7

L_63C2:
        CMPI    #$0064, R2                      ; 63C2   037A 0064
        BEQ     L_640F                          ; 63C4   0204 0049

        MVII    #$0012, R3                      ; 63C6   02BB 0012
        MVII    #$0161, R1                      ; 63C8   02B9 0161
        CMPI    #$0028, R2                      ; 63CA   037A 0028
        BEQ     L_63D2                          ; 63CC   0204 0004

        MVII    #$0063, R3                      ; 63CE   02BB 0063
        MVII    #$01BA, R1                      ; 63D0   02B9 01BA
L_63D2:
        MVI@    R1,     R0                      ; 63D2   0288
        TSTR    R0                              ; 63D3   0080
        BEQ     L_63DE                          ; 63D4   0204 0008

        CMPR    R3,     R0                      ; 63D6   0158
        BGT     L_63DB                          ; 63D7   020E 0002
        B       L_63E0                          ; 63D9   0200 0005

L_63DB:
        MOVR    R3,     R0                      ; 63DB   0098
        B       L_63E0                          ; 63DC   0200 0002

L_63DE:
        MVII    #$0001, R0                      ; 63DE   02B8 0001
L_63E0:
        MVO@    R0,     R1                      ; 63E0   0248
        MOVR    R0,     R3                      ; 63E1   0083
        CMPI    #$0028, R2                      ; 63E2   037A 0028
        BNEQ    L_63EF                          ; 63E4   020C 0009

        MVII    #$0163, R1                      ; 63E6   02B9 0163
        DECR    R0                              ; 63E8   0010
        ADDR    R0,     R1                      ; 63E9   00C1
        MVI@    R1,     R0                      ; 63EA   0288
        TSTR    R0                              ; 63EB   0080
        BEQ     L_63EF                          ; 63EC   0204 0001

        MOVR    R0,     R3                      ; 63EE   0083
L_63EF:
        MVO     R3,     G_01BF                  ; 63EF   0243 01BF

        JSR     R5,     L_5476                  ; 63F1   0004 0154 0076
        JSR     R5,     L_5331                  ; 63F4   0004 0150 0331
        DECLE   $0037                           ; 63F7   0037

        MVII    #$0014, R0                      ; 63F8   02B8 0014
        MVO     R0,     G_01EC                  ; 63FA   0240 01EC

        JSR     R5,     L_6F66                  ; 63FC   0004 016C 0366
        JSR     R5,     L_6F74                  ; 63FF   0004 016C 0374
        JSR     R5,     L_57D9                  ; 6402   0004 0154 03D9
        JSR     R5,     L_6D4A                  ; 6405   0004 016C 014A
        BIDECLE $010C                           ; 6408   000C 0001
        DECLE   $0004,  $01A0,  $022E,  $0000   ; 640A   0004 01A0 022E 0000

        PULR    R7                              ; 640E   02B7

L_640F:
        MVII    #$0163, R1                      ; 640F   02B9 0163
        ADD     G_0161, R1                      ; 6411   02C1 0161
        DECR    R1                              ; 6413   0011
        MVI     G_01BA, R0                      ; 6414   0280 01BA
        MVO@    R0,     R1                      ; 6416   0248
        MVII    #$0028, R0                      ; 6417   02B8 0028
        MVO     R0,     G_01B9                  ; 6419   0240 01B9

        JSR     R5,     L_5A40                  ; 641B   0004 0158 0240
        DECLE   $0004,  $01A0,  $022E,  $0000   ; 641E   0004 01A0 022E 0000

        PULR    R7                              ; 6422   02B7

        CMPI    #$000A, R0                      ; 6423   0378 000A
        BEQ     L_63A9                          ; 6425   0224 007D

        CMPI    #$0000, R0                      ; 6427   0378 0000
        BEQ     L_642C                          ; 6429   0204 0001
        PULR    R7                              ; 642B   02B7

L_642C:
        MVI     G_01DC, R0                      ; 642C   0280 01DC
        DECLE   $0378,  $0001,  $0224,  $01AF   ; 642E   0378 0001 0224 01AF
        DECLE   $0004,  $01A0,  $022E,  $0000   ; 6432   0004 01A0 022E 0000
        DECLE   $0004,  $0354,  $00C9,  $0378   ; 6436   0004 0354 00C9 0378
        DECLE   $000B,  $022C,  $01BA,  $0004   ; 643A   000B 022C 01BA 0004
        DECLE   $01A0,  $022E,  $0000           ; 643E   01A0 022E 0000

        MVI     G_01BC, R1                      ; 6441   0281 01BC
        INCR    R1                              ; 6443   0009
        ADDR    R7,     R1                      ; 6444   00F9
        ADD@    R1,     R7                      ; 6445   02CF

        DECLE   $000D,  $0005                   ; 6446   000D 0005

        INCR    R1                              ; 6448   0009
        COMR    R5                              ; 6449   001D
L_644A:
        DECR    R7                              ; 644A   0017

        MVII    #$0000, R0                      ; 644B   02B8 0000
        B       L_6455                          ; 644D   0200 0006

        MVII    #$0001, R0                      ; 644F   02B8 0001
        B       L_6455                          ; 6451   0200 0002

        MVII    #$0002, R0                      ; 6453   02B8 0002

L_6455:
        JSR     R5,     L_5431                  ; 6455   0004 0154 0031

        BC      L_6282                          ; 6458   0221 01D7
        J       L_5D39                          ; 645A   0004 035C 0139
        J       L_5CD5                          ; 645D   0004 035C 00D5

        JSR     R5,     L_564D                  ; 6460   0004 0154 024D

        MVII    #$0004, R0                      ; 6463   02B8 0004
        MVO     R0,     G_0103                  ; 6465   0240 0103
        MVII    #$0000, R0                      ; 6467   02B8 0000
        MVO     R0,     G_0104                  ; 6469   0240 0104
        MVII    #$0004, R0                      ; 646B   02B8 0004
        MVO     R0,     G_01B6                  ; 646D   0240 01B6
        MVII    #$0000, R0                      ; 646F   02B8 0000
        MVO     R0,     G_01DC                  ; 6471   0240 01DC
        MVII    #$0028, R0                      ; 6473   02B8 0028
        MVO     R0,     G_01B9                  ; 6475   0240 01B9
        MVII    #$0001, R0                      ; 6477   02B8 0001
        MVO     R0,     G_0161                  ; 6479   0240 0161
        MVO     R0,     G_01BA                  ; 647B   0240 01BA
        MOVR    R0,     R1                      ; 647D   0081
        CLRR    R0                              ; 647E   01C0
        MVII    #$011F, R4                      ; 647F   02BC 011F

        JSR     R5,     L_527B                  ; 6481   0004 0150 027B

        MVII    #$0001, R0                      ; 6484   02B8 0001
        MVO     R0,     G_015D                  ; 6486   0240 015D
        B       L_64C1                          ; 6488   0200 0037

        DECLE   $0378,  $0001,  $0204,  $006E   ; 648A   0378 0001 0204 006E
        DECLE   $0378,  $0002,  $0204,  $006A   ; 648E   0378 0002 0204 006A
        DECLE   $0378,  $000B,  $022C,  $0213   ; 6492   0378 000B 022C 0213
        DECLE   $0280,  $015D,  $0080,  $0224   ; 6496   0280 015D 0080 0224
        DECLE   $0218,  $0004,  $01A0,  $022E   ; 649A   0218 0004 01A0 022E
        DECLE   $0000                           ; 649E   0000

        MVII    #$0004, R0                      ; 649F   02B8 0004
        MVO     R0,     G_0103                  ; 64A1   0240 0103

        JSR     R5,     L_5644                  ; 64A3   0004 0154 0244
        JSR     R5,     L_530E                  ; 64A6   0004 0150 030E

        MVII    #$0000, R0                      ; 64A9   02B8 0000
        MVO     R0,     G_01DC                  ; 64AB   0240 01DC
        MVII    #$0005, R0                      ; 64AD   02B8 0005
        MVO     R0,     G_01B6                  ; 64AF   0240 01B6
        MVII    #$0001, R0                      ; 64B1   02B8 0001
        MVI     G_0162, R1                      ; 64B3   0281 0162
        CMPI    #$0001, R1                      ; 64B5   0379 0001
        BNEQ    L_64BB                          ; 64B7   020C 0002

        MVII    #$000A, R0                      ; 64B9   02B8 000A
L_64BB:
        MVO     R0,     G_0161                  ; 64BB   0240 0161
        MVII    #$0004, R0                      ; 64BD   02B8 0004
        MVO     R0,     G_0104                  ; 64BF   0240 0104
L_64C1:
        MVII    #$0163, R1                      ; 64C1   02B9 0163
        ADD     G_0161, R1                      ; 64C3   02C1 0161
        DECR    R1                              ; 64C5   0011
        BMI     L_6282                          ; 64C6   022B 0245

        MVI@    R1,     R0                      ; 64C8   0288
        MOVR    R0,     R1                      ; 64C9   0081
        TSTR    R1                              ; 64CA   0089
        BNEQ    L_64CE                          ; 64CB   020C 0001

        INCR    R1                              ; 64CD   0009
L_64CE:
        MVO     R1,     G_01BF                  ; 64CE   0241 01BF

        JSR     R5,     L_5476                  ; 64D0   0004 0154 0076
        JSR     R5,     L_5331                  ; 64D3   0004 0150 0331
        DECLE   $0037                           ; 64D6   0037
L_64D7:
        JSR     R5,     L_548C                  ; 64D7   0004 0154 008C
        JSR     R5,     L_549C                  ; 64DA   0004 0154 009C
        JSR     R5,     L_6F66                  ; 64DD   0004 016C 0366
        JSR     R5,     L_6F74                  ; 64E0   0004 016C 0374
        JSR     R5,     L_6DAA                  ; 64E3   0004 016C 01AA
        JSR     R5,     L_6FB9                  ; 64E6   0004 016C 03B9
        DECLE   $000D                           ; 64E9   000D

        MVI     G_0178, R0                      ; 64EA   0280 0178
        MVO     R0,     G_01D1                  ; 64EC   0240 01D1
        MVO     R0,     G_01D2                  ; 64EE   0240 01D2
        MVII    #$0006, R0                      ; 64F0   02B8 0006
        MVII    #$0002, R1                      ; 64F2   02B9 0002
        MVII    #$01D3, R4                      ; 64F4   02BC 01D3

        JSR     R5,     X_FILL_MEM              ; 64F6   0004 0114 0341

L_64F9:
        J       L_57AC                          ; 64F9   0004 0354 03AC

        MVO     R0,     G_015D                  ; 64FC   0240 015D
        MVII    #$0001, R1                      ; 64FE   02B9 0001
        MVII    #$0001, R3                      ; 6500   02BB 0001
        MVII    #$02ED, R4                      ; 6502   02BC 02ED

        JSR     R5,     X_PRNUM_RGT             ; 6504   0004 0118 00C5

        PULR    R7                              ; 6507   02B7

L_6508:
        PSHR    R5                              ; 6508   0275
        MVI     G_033C, R0                      ; 6509   0280 033C
        ANDI    #$0001, R0                      ; 650B   03B8 0001
        BEQ     L_6523                          ; 650D   0204 0014

        COMR    R0                              ; 650F   0018
        AND     G_033C, R0                      ; 6510   0380 033C
        MVO     R0,     G_033C                  ; 6512   0240 033C
        MVII    #$015F, R4                      ; 6514   02BC 015F
        SDBD                                    ; 6516   0001
        MVI@    R4,     R1                      ; 6517   02A1
        MVII    #$0001, R0                      ; 6518   02B8 0001
        SDBD                                    ; 651A   0001
        MVII    #$3930, R4                      ; 651B   02BC 0030 0039

        JSR     R5,     L_527B                  ; 651E   0004 0150 027B

        SETC                                    ; 6521   0007
        PULR    R7                              ; 6522   02B7

L_6523:
        MVI     G_033C, R0                      ; 6523   0280 033C
        ANDI    #$0002, R0                      ; 6525   03B8 0002
        BEQ     L_6550                          ; 6527   0204 0027

        COMR    R0                              ; 6529   0018
        AND     G_033C, R0                      ; 652A   0380 033C
        MVO     R0,     G_033C                  ; 652C   0240 033C
        SDBD                                    ; 652E   0001
        MVII    #$3970, R1                      ; 652F   02B9 0070 0039
        SDBD                                    ; 6532   0001
        MVII    #$ACA3, R4                      ; 6533   02BC 00A3 00AC
        CLRR    R0                              ; 6536   01C0

        JSR     R5,     L_5265                  ; 6537   0004 0150 0265

        SDBD                                    ; 653A   0001
        MVII    #$3978, R4                      ; 653B   02BC 0078 0039
        MVI     G_01BF, R1                      ; 653E   0281 01BF
        CLRR    R0                              ; 6540   01C0

        JSR     R5,     L_527B                  ; 6541   0004 0150 027B

        SDBD                                    ; 6544   0001
        MVII    #$39E0, R1                      ; 6545   02B9 00E0 0039
        SDBD                                    ; 6548   0001
        MVII    #$ACAB, R4                      ; 6549   02BC 00AB 00AC
        CLRR    R0                              ; 654C   01C0

        JSR     R5,     L_5265                  ; 654D   0004 0150 0265

L_6550:
        MVI     G_033C, R0                      ; 6550   0280 033C
        ANDI    #$0004, R0                      ; 6552   03B8 0004
        BEQ     L_6578                          ; 6554   0204 0022

        COMR    R0                              ; 6556   0018
        AND     G_033C, R0                      ; 6557   0380 033C
        MVO     R0,     G_033C                  ; 6559   0240 033C
        MVII    #$0175, R4                      ; 655B   02BC 0175
        SDBD                                    ; 655D   0001
        MVI@    R4,     R1                      ; 655E   02A1
        MVII    #$0001, R0                      ; 655F   02B8 0001
        SDBD                                    ; 6561   0001
        MVII    #$3990, R4                      ; 6562   02BC 0090 0039

        JSR     R5,     L_527B                  ; 6565   0004 0150 027B

        MVI     G_0177, R1                      ; 6568   0281 0177
        PSHR    R1                              ; 656A   0271
        SLL     R1,     2                       ; 656B   004D
        ADD@    R6,     R1                      ; 656C   02F1
        SDBD                                    ; 656D   0001
        ADDI    #$A659, R1                      ; 656E   02F9 0059 00A6
        MVII    #$0001, R0                      ; 6571   02B8 0001

        JSR     R5,     L_52F8                  ; 6573   0004 0150 02F8

        SETC                                    ; 6576   0007
        PULR    R7                              ; 6577   02B7

L_6578:
        MVI     G_033C, R0                      ; 6578   0280 033C
        ANDI    #$0008, R0                      ; 657A   03B8 0008
        BEQ     L_658F                          ; 657C   0204 0011

        COMR    R0                              ; 657E   0018
        AND     G_033C, R0                      ; 657F   0380 033C
        MVO     R0,     G_033C                  ; 6581   0240 033C
        SDBD                                    ; 6583   0001
        MVII    #$3980, R4                      ; 6584   02BC 0080 0039
        MVI     G_0161, R1                      ; 6587   0281 0161
        CLRR    R0                              ; 6589   01C0

        JSR     R5,     L_527B                  ; 658A   0004 0150 027B

        SETC                                    ; 658D   0007
        PULR    R7                              ; 658E   02B7

L_658F:
        MVI     G_033C, R0                      ; 658F   0280 033C
        ANDI    #$0010, R0                      ; 6591   03B8 0010
        BEQ     L_65B1                          ; 6593   0204 001C

        COMR    R0                              ; 6595   0018
        AND     G_033C, R0                      ; 6596   0380 033C
        MVO     R0,     G_033C                  ; 6598   0240 033C
        MVII    #$01C6, R2                      ; 659A   02BA 01C6
        ADD     G_015E, R2                      ; 659C   02C2 015E
        MVI@    R2,     R1                      ; 659E   0291
        PSHR    R1                              ; 659F   0271
        SLL     R1,     2                       ; 65A0   004D
        ADD@    R6,     R1                      ; 65A1   02F1
        SDBD                                    ; 65A2   0001
        ADDI    #$A84E, R1                      ; 65A3   02F9 004E 00A8
        SDBD                                    ; 65A6   0001
        MVII    #$3988, R4                      ; 65A7   02BC 0088 0039
        MVII    #$0001, R0                      ; 65AA   02B8 0001

        JSR     R5,     L_52F8                  ; 65AC   0004 0150 02F8

        SETC                                    ; 65AF   0007
        PULR    R7                              ; 65B0   02B7

L_65B1:
        MVI     G_033C, R0                      ; 65B1   0280 033C
        ANDI    #$0020, R0                      ; 65B3   03B8 0020
        BEQ     L_65D2                          ; 65B5   0204 001B

        COMR    R0                              ; 65B7   0018
        AND     G_033C, R0                      ; 65B8   0380 033C
        MVO     R0,     G_033C                  ; 65BA   0240 033C
        SDBD                                    ; 65BC   0001
        MVII    #$3990, R4                      ; 65BD   02BC 0090 0039
        SDBD                                    ; 65C0   0001
        MVII    #$A73A, R1                      ; 65C1   02B9 003A 00A7
        MVII    #$0007, R0                      ; 65C4   02B8 0007

        JSR     R5,     L_52F8                  ; 65C6   0004 0150 02F8

        PSHR    R4                              ; 65C9   0274
        MOVR    R1,     R4                      ; 65CA   008C
        PULR    R1                              ; 65CB   02B1
        CLRR    R0                              ; 65CC   01C0

        JSR     R5,     L_5265                  ; 65CD   0004 0150 0265

        SETC                                    ; 65D0   0007
        PULR    R7                              ; 65D1   02B7

L_65D2:
        MVI     G_033C, R0                      ; 65D2   0280 033C
        ANDI    #$0040, R0                      ; 65D4   03B8 0040
        BEQ     L_65EA                          ; 65D6   0204 0012

        COMR    R0                              ; 65D8   0018
        AND     G_033C, R0                      ; 65D9   0380 033C
        MVO     R0,     G_033C                  ; 65DB   0240 033C
        SDBD                                    ; 65DD   0001
        MVII    #$3930, R4                      ; 65DE   02BC 0030 0039
        SDBD                                    ; 65E1   0001
        MVII    #$A717, R1                      ; 65E2   02B9 0017 00A7
        MVII    #$0007, R0                      ; 65E5   02B8 0007

        JSR     R5,     L_52F8                  ; 65E7   0004 0150 02F8

L_65EA:
        MVI     G_033C, R0                      ; 65EA   0280 033C
        ANDI    #$0080, R0                      ; 65EC   03B8 0080
        BEQ     L_660A                          ; 65EE   0204 001A

        COMR    R0                              ; 65F0   0018
        AND     G_033C, R0                      ; 65F1   0380 033C
        MVO     R0,     G_033C                  ; 65F3   0240 033C
        SDBD                                    ; 65F5   0001
        MVII    #$3980, R4                      ; 65F6   02BC 0080 0039
        MVI     G_0161, R1                      ; 65F9   0281 0161
        CLRR    R0                              ; 65FB   01C0

        JSR     R5,     L_527B                  ; 65FC   0004 0150 027B

        SDBD                                    ; 65FF   0001
        MVII    #$3968, R4                      ; 6600   02BC 0068 0039
        MVII    #$011F, R1                      ; 6603   02B9 011F
        MVII    #$0001, R0                      ; 6605   02B8 0001

        JSR     R5,     L_52F8                  ; 6607   0004 0150 02F8

L_660A:
        MVI     G_033C, R0                      ; 660A   0280 033C
        ANDI    #$0100, R0                      ; 660C   03B8 0100
        BEQ     L_661F                          ; 660E   0204 000F

        COMR    R0                              ; 6610   0018
        AND     G_033C, R0                      ; 6611   0380 033C
        MVO     R0,     G_033C                  ; 6613   0240 033C
        SDBD                                    ; 6615   0001
        MVII    #$3978, R4                      ; 6616   02BC 0078 0039
        MVI     G_01BF, R1                      ; 6619   0281 01BF
        CLRR    R0                              ; 661B   01C0

        JSR     R5,     L_527B                  ; 661C   0004 0150 027B

L_661F:
        MVI     G_033C, R0                      ; 661F   0280 033C
        ANDI    #$0200, R0                      ; 6621   03B8 0200
        BEQ     L_668A                          ; 6623   0204 0065

        COMR    R0                              ; 6625   0018
        AND     G_033C, R0                      ; 6626   0380 033C
        MVO     R0,     G_033C                  ; 6628   0240 033C
        MVI     G_01B6, R0                      ; 662A   0280 01B6
        CMPI    #$000C, R0                      ; 662C   0378 000C
        BEQ     L_6651                          ; 662E   0204 0021

        SDBD                                    ; 6630   0001
        MVII    #$3950, R4                      ; 6631   02BC 0050 0039
        SDBD                                    ; 6634   0001
        MVII    #$A83A, R1                      ; 6635   02B9 003A 00A8
        MVII    #$0004, R0                      ; 6638   02B8 0004

        JSR     R5,     L_52F8                  ; 663A   0004 0150 02F8

        MVII    #$015F, R4                      ; 663D   02BC 015F
        SDBD                                    ; 663F   0001
        MVI@    R4,     R0                      ; 6640   02A0
        MVII    #$0175, R4                      ; 6641   02BC 0175
        SDBD                                    ; 6643   0001
        MVI@    R4,     R1                      ; 6644   02A1
        CMPR    R0,     R1                      ; 6645   0141
        BEQ     L_6550                          ; 6646   0224 00F7

        SDBD                                    ; 6648   0001
        MVII    #$395B, R4                      ; 6649   02BC 005B 0039
        MVII    #$00FF, R1                      ; 664C   02B9 00FF
        MVO@    R1,     R4                      ; 664E   0261
        SETC                                    ; 664F   0007
        PULR    R7                              ; 6650   02B7

L_6651:
        MVI     G_01DC, R0                      ; 6651   0280 01DC
        CMPI    #$0002, R0                      ; 6653   0378 0002
        BEQ     L_667D                          ; 6655   0204 0026

        MVII    #$01B4, R1                      ; 6657   02B9 01B4
        ADD     G_015E, R1                      ; 6659   02C1 015E
        MVI     G_0177, R3                      ; 665B   0283 0177
        MVI@    R1,     R0                      ; 665D   0288
        SDBD                                    ; 665E   0001
        MVII    #$A786, R1                      ; 665F   02B9 0086 00A7
        CMPI    #$0001, R0                      ; 6662   0378 0001
        BEQ     L_6681                          ; 6664   0204 001B

L_6666:
        CMPI    #$0005, R3                      ; 6666   037B 0005
        BGE     L_666F                          ; 6668   020D 0005

        ADDI    #$0014, R1                      ; 666A   02F9 0014
        INCR    R3                              ; 666C   000B
        B       L_6666                          ; 666D   0220 0008

L_666F:
        DECR    R0                              ; 666F   0010
L_6670:
        ADDI    #$0014, R1                      ; 6670   02F9 0014
        SDBD                                    ; 6672   0001
        CMPI    #$A812, R1                      ; 6673   0379 0012 00A8
        BGE     L_667D                          ; 6676   020D 0005

        DECR    R0                              ; 6678   0010
        BNEQ    L_6670                          ; 6679   022C 000A
        B       L_6681                          ; 667B   0200 0004

L_667D:
        SDBD                                    ; 667D   0001
        MVII    #$A812, R1                      ; 667E   02B9 0012 00A8
L_6681:
        SDBD                                    ; 6681   0001
        MVII    #$3950, R4                      ; 6682   02BC 0050 0039
        MVII    #$0004, R0                      ; 6685   02B8 0004

        JSR     R5,     L_52F8                  ; 6687   0004 0150 02F8

L_668A:
        MVI     G_033C, R0                      ; 668A   0280 033C
        SDBD                                    ; 668C   0001
        ANDI    #$0400, R0                      ; 668D   03B8 0000 0004
        BEQ     L_66A9                          ; 6690   0204 0017

        COMR    R0                              ; 6692   0018
        AND     G_033C, R0                      ; 6693   0380 033C
        MVO     R0,     G_033C                  ; 6695   0240 033C
        SDBD                                    ; 6697   0001
        MVII    #$3940, R4                      ; 6698   02BC 0040 0039
        MVI     G_01B4, R1                      ; 669B   0281 01B4
        CLRR    R0                              ; 669D   01C0

        JSR     R5,     L_527B                  ; 669E   0004 0150 027B

        MVI     G_01B5, R1                      ; 66A1   0281 01B5
        CLRR    R0                              ; 66A3   01C0

        JSR     R5,     L_527B                  ; 66A4   0004 0150 027B

        SETC                                    ; 66A7   0007
        PULR    R7                              ; 66A8   02B7

L_66A9:
        MVI     G_033C, R0                      ; 66A9   0280 033C
        SDBD                                    ; 66AB   0001
        ANDI    #$0800, R0                      ; 66AC   03B8 0000 0008
        BEQ     L_66D1                          ; 66AF   0204 0020

        COMR    R0                              ; 66B1   0018
        AND     G_033C, R0                      ; 66B2   0380 033C
        MVO     R0,     G_033C                  ; 66B4   0240 033C
        MVI     G_017F, R1                      ; 66B6   0281 017F
        SLL     R1,     2                       ; 66B8   004D
        SLL     R1,     1                       ; 66B9   0049
        SDBD                                    ; 66BA   0001
        MVII    #$A923, R4                      ; 66BB   02BC 0023 00A9
        ADDR    R1,     R4                      ; 66BE   00CC
        MVI     G_01DB, R0                      ; 66BF   0280 01DB
        SDBD                                    ; 66C1   0001
        MVII    #$3910, R1                      ; 66C2   02B9 0010 0039
        CMPI    #$0002, R0                      ; 66C5   0378 0002
        BEQ     L_66CD                          ; 66C7   0204 0004

        SDBD                                    ; 66C9   0001
        MVII    #$3928, R1                      ; 66CA   02B9 0028 0039
L_66CD:
        CLRR    R0                              ; 66CD   01C0

        JSR     R5,     L_5265                  ; 66CE   0004 0150 0265

L_66D1:
        MVI     G_033C, R0                      ; 66D1   0280 033C
        SDBD                                    ; 66D3   0001
        ANDI    #$1000, R0                      ; 66D4   03B8 0000 0010
        BEQ     L_66F5                          ; 66D7   0204 001C

        COMR    R0                              ; 66D9   0018
        AND     G_033C, R0                      ; 66DA   0380 033C
        MVO     R0,     G_033C                  ; 66DC   0240 033C
        MVII    #$033A, R4                      ; 66DE   02BC 033A
        SDBD                                    ; 66E0   0001
        MVII    #$3956, R5                      ; 66E1   02BD 0056 0039
        MVII    #$0002, R1                      ; 66E4   02B9 0002
L_66E6:
        MVI@    R4,     R0                      ; 66E6   02A0
        MVO@    R0,     R5                      ; 66E7   0268
        MVO@    R0,     R5                      ; 66E8   0268
        SWAP    R0,     1                       ; 66E9   0040
        ADDI    #$0006, R5                      ; 66EA   02FD 0006
        MVO@    R0,     R5                      ; 66EC   0268
        MVO@    R0,     R5                      ; 66ED   0268
        ADDI    #$0006, R5                      ; 66EE   02FD 0006
        DECR    R1                              ; 66F0   0011
        BNEQ    L_66E6                          ; 66F1   022C 000C

        SETC                                    ; 66F3   0007
        PULR    R7                              ; 66F4   02B7

L_66F5:
        MVI     G_033C, R0                      ; 66F5   0280 033C
        SDBD                                    ; 66F7   0001
        ANDI    #$2000, R0                      ; 66F8   03B8 0000 0020
        BEQ     L_6722                          ; 66FB   0204 0025

        COMR    R0                              ; 66FD   0018
        AND     G_033C, R0                      ; 66FE   0380 033C
        MVO     R0,     G_033C                  ; 6700   0240 033C
        SDBD                                    ; 6702   0001
        MVII    #$3988, R4                      ; 6703   02BC 0088 0039
        SDBD                                    ; 6706   0001
        MVII    #$A76D, R1                      ; 6707   02B9 006D 00A7
        MVII    #$0005, R0                      ; 670A   02B8 0005

        JSR     R5,     L_52F8                  ; 670C   0004 0150 02F8

        SDBD                                    ; 670F   0001
        MVII    #$A753, R1                      ; 6710   02B9 0053 00A7
        MVII    #$0002, R0                      ; 6713   02B8 0002

        JSR     R5,     L_52F8                  ; 6715   0004 0150 02F8

        PSHR    R4                              ; 6718   0274
        MOVR    R1,     R4                      ; 6719   008C
        PULR    R1                              ; 671A   02B1
        MVII    #$0001, R0                      ; 671B   02B8 0001

        JSR     R5,     L_5265                  ; 671D   0004 0150 0265

        SETC                                    ; 6720   0007
        PULR    R7                              ; 6721   02B7

L_6722:
        MVI     G_033C, R0                      ; 6722   0280 033C
        SDBD                                    ; 6724   0001
        ANDI    #$4000, R0                      ; 6725   03B8 0000 0040
        BEQ     L_673D                          ; 6728   0204 0013

        COMR    R0                              ; 672A   0018
        AND     G_033C, R0                      ; 672B   0380 033C
        MVO     R0,     G_033C                  ; 672D   0240 033C
        SDBD                                    ; 672F   0001
        MVII    #$ACB3, R4                      ; 6730   02BC 00B3 00AC
        ADD     G_01E1, R4                      ; 6733   02C4 01E1
        SDBD                                    ; 6735   0001
        MVII    #$39E0, R1                      ; 6736   02B9 00E0 0039
        CLRR    R0                              ; 6739   01C0

        JSR     R5,     L_5265                  ; 673A   0004 0150 0265

L_673D:
        CLRC                                    ; 673D   0006
        PULR    R7                              ; 673E   02B7

        PSHR    R5                              ; 673F   0275
        MVI     G_0102, R0                      ; 6740   0280 0102
        DECR    R0                              ; 6742   0010
        BMI     L_679C                          ; 6743   020B 0057

        MVO     R0,     G_0102                  ; 6745   0240 0102
        MVII    #$0319, R4                      ; 6747   02BC 0319
        CLRR    R5                              ; 6749   01ED
        MVI@    R4,     R0                      ; 674A   02A0
        MVO@    R0,     R5                      ; 674B   0268
        MVI@    R4,     R0                      ; 674C   02A0
        MVO@    R0,     R5                      ; 674D   0268
        MVI@    R4,     R0                      ; 674E   02A0
        MVO@    R0,     R5                      ; 674F   0268
        MVI@    R4,     R0                      ; 6750   02A0
        MVO@    R0,     R5                      ; 6751   0268
        MVI@    R4,     R0                      ; 6752   02A0
        MVO@    R0,     R5                      ; 6753   0268
        MVI@    R4,     R0                      ; 6754   02A0
        MVO@    R0,     R5                      ; 6755   0268
        MVI@    R4,     R0                      ; 6756   02A0
        MVO@    R0,     R5                      ; 6757   0268
        MVI@    R4,     R0                      ; 6758   02A0
        MVO@    R0,     R5                      ; 6759   0268
        MVI@    R4,     R0                      ; 675A   02A0
        MVO@    R0,     R5                      ; 675B   0268
        MVI@    R4,     R0                      ; 675C   02A0
        MVO@    R0,     R5                      ; 675D   0268
        MVI@    R4,     R0                      ; 675E   02A0
        MVO@    R0,     R5                      ; 675F   0268
        MVI@    R4,     R0                      ; 6760   02A0
        MVO@    R0,     R5                      ; 6761   0268
        MVI@    R4,     R0                      ; 6762   02A0
        MVO@    R0,     R5                      ; 6763   0268
        MVI@    R4,     R0                      ; 6764   02A0
        MVO@    R0,     R5                      ; 6765   0268
        MVI@    R4,     R0                      ; 6766   02A0
        MVO@    R0,     R5                      ; 6767   0268
        MVI@    R4,     R0                      ; 6768   02A0
        MVO@    R0,     R5                      ; 6769   0268
        MVI@    R4,     R0                      ; 676A   02A0
        MVO@    R0,     R5                      ; 676B   0268
        MVI@    R4,     R0                      ; 676C   02A0
        MVO@    R0,     R5                      ; 676D   0268
        MVI@    R4,     R0                      ; 676E   02A0
        MVO@    R0,     R5                      ; 676F   0268
        MVI@    R4,     R0                      ; 6770   02A0
        MVO@    R0,     R5                      ; 6771   0268
        MVI@    R4,     R0                      ; 6772   02A0
        MVO@    R0,     R5                      ; 6773   0268
        MVI@    R4,     R0                      ; 6774   02A0
        MVO@    R0,     R5                      ; 6775   0268
        MVI@    R4,     R0                      ; 6776   02A0
        MVO@    R0,     R5                      ; 6777   0268
        MVI@    R4,     R0                      ; 6778   02A0
        MVO@    R0,     R5                      ; 6779   0268
        MVI     .STIC.C.6,R0                    ; 677A   0280 001E
        SWAP    R0,     1                       ; 677C   0040
        ANDI    #$0001, R0                      ; 677D   03B8 0001
        MVO     R0,     G_01D9                  ; 677F   0240 01D9
        CLRR    R0                              ; 6781   01C0
        MVO     R0,     .STIC.C.6               ; 6782   0240 001E
        MVI     G_0103, R0                      ; 6784   0280 0103
        MVO     R0,     .STIC.EDGE              ; 6786   0240 0032
        MVO     R0,     .STIC.MODE              ; 6788   0240 0021
        ANDI    #$0004, R0                      ; 678A   03B8 0004
        BNEQ    L_6790                          ; 678C   020C 0002

        MVI     .STIC.MODE,R0                   ; 678E   0280 0021
L_6790:
        MVI     G_0105, R0                      ; 6790   0280 0105
        MVO     R0,     .STIC.HDLY              ; 6792   0240 0030
        MVI     G_0106, R0                      ; 6794   0280 0106
        MVO     R0,     .STIC.VDLY              ; 6796   0240 0031
        MVI     G_0104, R0                      ; 6798   0280 0104
        MVO     R0,     .STIC.BORD              ; 679A   0240 002C
L_679C:
        MVI     G_0107, R4                      ; 679C   0284 0107
        ADDR    R4,     R4                      ; 679E   00E4
        BEQ     L_67E0                          ; 679F   0204 003F

        CLRR    R0                              ; 67A1   01C0
        MVO     R0,     .STIC.BORD              ; 67A2   0240 002C
        SDBD                                    ; 67A4   0001
        ADDI    #$AF5A, R4                      ; 67A5   02FC 005A 00AF
        SDBD                                    ; 67A8   0001
        MVI@    R4,     R5                      ; 67A9   02A5
        MVO     R6,     G_0338                  ; 67AA   0246 0338
        SDBD                                    ; 67AC   0001
        MVII    #$10EF, R1                      ; 67AD   02B9 00EF 0010
        MVI@    R1,     R1                      ; 67B0   0289
        CMPI    #$0004, R1                      ; 67B1   0379 0004
        BNEQ    L_67B7                          ; 67B3   020C 0002

        MVII    #$0200, R6                      ; 67B5   02BE 0200

L_67B7:
        JSRD    R4,     X_NEW_GRAM_INIT         ; 67B7   0004 001E 0335

        MVI     G_0338, R6                      ; 67BA   0286 0338
        CLRR    R0                              ; 67BC   01C0
        MVO     R0,     G_0107                  ; 67BD   0240 0107
        MVII    #$00FF, R1                      ; 67BF   02B9 00FF
        SDBD                                    ; 67C1   0001
        MVII    #$3930, R4                      ; 67C2   02BC 0030 0039
        MVII    #$0080, R0                      ; 67C5   02B8 0080

        JSR     R5,     X_FILL_MEM              ; 67C7   0004 0114 0341

        MVI     G_01DC, R0                      ; 67CA   0280 01DC
        CMPI    #$0001, R0                      ; 67CC   0378 0001
        BNEQ    L_67DD                          ; 67CE   020C 000D

        SDBD                                    ; 67D0   0001
        MVII    #$A8EC, R1                      ; 67D1   02B9 00EC 00A8
        SDBD                                    ; 67D4   0001
        MVII    #$3848, R4                      ; 67D5   02BC 0048 0038
        MVII    #$000B, R0                      ; 67D8   02B8 000B

        JSR     R5,     L_52F8                  ; 67DA   0004 0150 02F8

L_67DD:
        EIS                                     ; 67DD   0002
        B       L_67F6                          ; 67DE   0200 0016

L_67E0:
        JSR     R5,     L_6508                  ; 67E0   0004 0164 0108

        MVI     G_01EC, R0                      ; 67E3   0280 01EC
        TSTR    R0                              ; 67E5   0080
        BEQ     L_67F4                          ; 67E6   0204 000C

        CMPI    #$00FF, R0                      ; 67E8   0378 00FF
        BEQ     L_67EF                          ; 67EA   0204 0003

        DECR    R0                              ; 67EC   0010
        MVO     R0,     G_01EC                  ; 67ED   0240 01EC
L_67EF:
        CLRR    R0                              ; 67EF   01C0
        MVO     R0,     .STIC.BORD              ; 67F0   0240 002C
        B       L_67F6                          ; 67F2   0200 0002

L_67F4:
        MVO     R0,     .STIC.VIDEN             ; 67F4   0240 0020
L_67F6:
        MVII    #$0004, R2                      ; 67F6   02BA 0004
        MVII    #$0331, R4                      ; 67F8   02BC 0331
L_67FA:
        MVI@    R4,     R5                      ; 67FA   02A5
        TSTR    R5                              ; 67FB   00AD
        BEQ     L_680A                          ; 67FC   0204 000C

        PSHR    R4                              ; 67FE   0274
        SDBD                                    ; 67FF   0001
        MVI@    R5,     R4                      ; 6800   02AC
        MVI@    R5,     R0                      ; 6801   02A8
        MVI@    R5,     R3                      ; 6802   02AB
        ADD@    R3,     R4                      ; 6803   02DC
        SDBD                                    ; 6804   0001
        MVI@    R5,     R1                      ; 6805   02A9

        JSR     R5,     L_5265                  ; 6806   0004 0150 0265

        PULR    R4                              ; 6809   02B4
L_680A:
        DECR    R2                              ; 680A   0012
        BPL     L_67FA                          ; 680B   0223 0012

        MVI     .PSG0.lft_hand,R0               ; 680D   0280 01FF
        CMP     G_0119, R0                      ; 680F   0340 0119
        MVO     R0,     G_0119                  ; 6811   0240 0119
        BNEQ    L_6817                          ; 6813   020C 0002

        MVO     R0,     G_010E                  ; 6815   0240 010E
L_6817:
        MVI     .PSG0.rgt_hand,R0               ; 6817   0280 01FE
        CMP     G_011A, R0                      ; 6819   0340 011A
        MVO     R0,     G_011A                  ; 681B   0240 011A
        BNEQ    L_6821                          ; 681D   020C 0002

        MVO     R0,     G_0112                  ; 681F   0240 0112
L_6821:
        MVI     G_01EC, R0                      ; 6821   0280 01EC
        CMPI    #$00FF, R0                      ; 6823   0378 00FF
        BEQ     L_682A                          ; 6825   0204 0003

        JSR     R5,     X_PLAY_NOTE             ; 6827   0004 0118 02BD

L_682A:
        PULR    R7                              ; 682A   02B7

L_682B:
        CLRR    R0                              ; 682B   01C0
        MVO     R0,     G_031F                  ; 682C   0240 031F
        MVO     R0,     G_031D                  ; 682E   0240 031D
        NOP                                     ; 6830   0034
        MVO     R0,     G_031E                  ; 6831   0240 031E
        MVO     R0,     G_032D                  ; 6833   0240 032D
        MVO     R0,     G_032E                  ; 6835   0240 032E
        NOP                                     ; 6837   0034
        MVO     R0,     G_0320                  ; 6838   0240 0320
        MVO     R0,     G_0334                  ; 683A   0240 0334
L_683C:
        CLRR    R0                              ; 683C   01C0
        MVO     R0,     G_0319                  ; 683D   0240 0319
        MVO     R0,     G_031A                  ; 683F   0240 031A
        MVO     R0,     G_031B                  ; 6841   0240 031B
        NOP                                     ; 6843   0034
        MVO     R0,     G_031C                  ; 6844   0240 031C
        MVO     R0,     G_0331                  ; 6846   0240 0331
        NOP                                     ; 6848   0034
        MVO     R0,     G_0332                  ; 6849   0240 0332
        MVO     R0,     G_0333                  ; 684B   0240 0333
        MOVR    R5,     R7                      ; 684D   00AF

L_684E:
        PSHR    R5                              ; 684E   0275
L_684F:
        MVII    #$0342, R2                      ; 684F   02BA 0342
        MVII    #$01D1, R3                      ; 6851   02BB 01D1
        MVI     G_015E, R0                      ; 6853   0280 015E
        ADDR    R0,     R3                      ; 6855   00C3
        SLL     R0,     1                       ; 6856   0048
        ADDR    R0,     R2                      ; 6857   00C2

        JSR     R5,     L_6A5D                  ; 6858   0004 0168 025D

        MVI@    R3,     R4                      ; 685B   029C
        ADDR    R4,     R4                      ; 685C   00E4
        SDBD                                    ; 685D   0001
        MVII    #$6889, R5                      ; 685E   02BD 0089 0068
        ADDR    R4,     R5                      ; 6861   00E5
        ADD@    R5,     R0                      ; 6862   02E8
        ANDI    #$00FF, R0                      ; 6863   03B8 00FF
        ADD@    R5,     R1                      ; 6865   02E9
        ANDI    #$007F, R1                      ; 6866   03B9 007F

        JSR     R5,     L_6A3E                  ; 6868   0004 0168 023E

        BC      L_6881                          ; 686B   0201 0014

        XORI    #$0200, R0                      ; 686D   03F8 0200
        XORI    #$0100, R1                      ; 686F   03F9 0100
        SDBD                                    ; 6871   0001
        MVII    #$09E7, R2                      ; 6872   02BA 00E7 0009
        MVO     R0,     G_031F                  ; 6875   0240 031F
        MVO     R1,     G_0327                  ; 6877   0241 0327
        MVO     R2,     G_032F                  ; 6879   0242 032F

        JSR     R5,     L_6D4A                  ; 687B   0004 016C 014A
        BIDECLE $0002                           ; 687E   0002 0000

        PULR    R7                              ; 6880   02B7

L_6881:
        MOVR    R4,     R0                      ; 6881   00A0
        SLR     R0,     1                       ; 6882   0060
        INCR    R0                              ; 6883   0008
        ANDI    #$001F, R0                      ; 6884   03B8 001F
        MVO@    R0,     R3                      ; 6886   0258
        B       L_684F                          ; 6887   0220 0039

        DECLE   $000B,  $03FF,  $000B,  $03FD   ; 6889   000B 03FF 000B 03FD
        DECLE   $000A,  $03FA,  $0009,  $03F8   ; 688D   000A 03FA 0009 03F8
        DECLE   $0008,  $03F6,  $0006,  $03F5   ; 6891   0008 03F6 0006 03F5
        DECLE   $0004,  $03F4,  $0001,  $03F3   ; 6895   0004 03F4 0001 03F3
        DECLE   $03FF,  $03F3,  $03FD,  $03F3   ; 6899   03FF 03F3 03FD 03F3
        DECLE   $03FB,  $03F4,  $03F9,  $03F5   ; 689D   03FB 03F4 03F9 03F5
        DECLE   $03F7,  $03F6,  $03F6,  $03F8   ; 68A1   03F7 03F6 03F6 03F8
        DECLE   $03F5,  $03FA,  $03F4,  $03FD   ; 68A5   03F5 03FA 03F4 03FD
        DECLE   $03F4,  $03FF,  $03F4,  $0001   ; 68A9   03F4 03FF 03F4 0001
        DECLE   $03F5,  $0003,  $03F6,  $0005   ; 68AD   03F5 0003 03F6 0005
        DECLE   $03F7,  $0007,  $03F9,  $0008   ; 68B1   03F7 0007 03F9 0008
        DECLE   $03FB,  $0009,  $03FD,  $000A   ; 68B5   03FB 0009 03FD 000A
        DECLE   $03FF,  $000A,  $0001,  $000A   ; 68B9   03FF 000A 0001 000A
        DECLE   $0004,  $0009,  $0006,  $0008   ; 68BD   0004 0009 0006 0008
        DECLE   $0008,  $0007,  $0009,  $0005   ; 68C1   0008 0007 0009 0005
        DECLE   $000A,  $0003,  $000B,  $0001   ; 68C5   000A 0003 000B 0001
L_68C9:
        MVI     G_015D, R4                      ; 68C9   0284 015D
        MVII    #$0342, R2                      ; 68CB   02BA 0342
        MVII    #$031D, R3                      ; 68CD   02BB 031D
L_68CF:
        PSHR    R5                              ; 68CF   0275

L_68D0:
        JSR     R5,     L_6A5D                  ; 68D0   0004 0168 025D

        XORI    #$0200, R0                      ; 68D3   03F8 0200
        MVO@    R0,     R3                      ; 68D5   0258
        ADDI    #$0008, R3                      ; 68D6   02FB 0008
        XORI    #$0100, R1                      ; 68D8   03F9 0100
        MVO@    R1,     R3                      ; 68DA   0259
        ADDI    #$0008, R3                      ; 68DB   02FB 0008
        SDBD                                    ; 68DD   0001
        MVII    #$0977, R1                      ; 68DE   02B9 0077 0009
        MVO@    R1,     R3                      ; 68E1   0259
        ADDI    #$0002, R2                      ; 68E2   02FA 0002
        SUBI    #$000F, R3                      ; 68E4   033B 000F
        DECR    R4                              ; 68E6   0014
        BNEQ    L_68D0                          ; 68E7   022C 0018

        MVII    #$01D3, R4                      ; 68E9   02BC 01D3
        MVII    #$031D, R1                      ; 68EB   02B9 031D
L_68ED:
        MVI@    R4,     R0                      ; 68ED   02A0
        CMPI    #$0000, R0                      ; 68EE   0378 0000
        BNEQ    L_68F8                          ; 68F0   020C 0006

        MVI@    R1,     R3                      ; 68F2   028B
        SDBD                                    ; 68F3   0001
        ANDI    #$FDFF, R3                      ; 68F4   03BB 00FF 00FD
        MVO@    R3,     R1                      ; 68F7   024B
L_68F8:
        INCR    R1                              ; 68F8   0009
        CMPI    #$031E, R1                      ; 68F9   0379 031E
        BLE     L_68ED                          ; 68FB   0226 000F
        PULR    R7                              ; 68FD   02B7

L_68FE:
        PSHR    R5                              ; 68FE   0275
        MVII    #$034C, R2                      ; 68FF   02BA 034C

        JSR     R5,     L_6A5D                  ; 6901   0004 0168 025D

        XORI    #$0300, R0                      ; 6904   03F8 0300
        XORI    #$0100, R1                      ; 6906   03F9 0100
        SDBD                                    ; 6908   0001
        MVII    #$0970, R2                      ; 6909   02BA 0070 0009
        MVO     R1,     G_0327                  ; 690C   0241 0327
        MVO     R2,     G_032F                  ; 690E   0242 032F
        MVII    #$01D3, R1                      ; 6910   02B9 01D3
        ADD     G_015E, R1                      ; 6912   02C1 015E
        MVI@    R1,     R2                      ; 6914   028A
        CMPI    #$0000, R2                      ; 6915   037A 0000
        BNEQ    L_6921                          ; 6917   020C 0008

        MVI     G_01DB, R1                      ; 6919   0281 01DB
        CMPI    #$0002, R1                      ; 691B   0379 0002
        BNEQ    L_6921                          ; 691D   020C 0002

        XORI    #$0200, R0                      ; 691F   03F8 0200
L_6921:
        MVO     R0,     G_031F                  ; 6921   0240 031F
        PULR    R7                              ; 6923   02B7

L_6924:
        PSHR    R5                              ; 6924   0275
        MVII    #$0356, R2                      ; 6925   02BA 0356

        JSR     R5,     L_6A5D                  ; 6927   0004 0168 025D

        MVI     G_01DC, R3                      ; 692A   0283 01DC
        CMPI    #$0001, R3                      ; 692C   037B 0001
        BNEQ    L_6932                          ; 692E   020C 0002

        ADDI    #$005D, R0                      ; 6930   02F8 005D
L_6932:
        SUBI    #$0007, R1                      ; 6932   0339 0007
        MVI     G_01E9, R4                      ; 6934   0284 01E9
        ADDR    R4,     R4                      ; 6936   00E4
        SDBD                                    ; 6937   0001
        ADDI    #$695E, R4                      ; 6938   02FC 005E 0069
        MVI@    R4,     R2                      ; 693B   02A2
        CMPI    #$0004, R2                      ; 693C   037A 0004
        BNEQ    L_6944                          ; 693E   020C 0004

        SDBD                                    ; 6940   0001
        XORI    #$0400, R1                      ; 6941   03F9 0000 0004
L_6944:
        SUBR    R2,     R0                      ; 6944   0110
        MVI@    R4,     R3                      ; 6945   02A3
        XORI    #$0200, R0                      ; 6946   03F8 0200
        XORI    #$0080, R1                      ; 6948   03F9 0080
        SDBD                                    ; 694A   0001
        MVII    #$09F2, R2                      ; 694B   02BA 00F2 0009
        MVO     R3,     G_0180                  ; 694E   0243 0180
        MVO     R0,     G_0320                  ; 6950   0240 0320
        MVO     R1,     G_0328                  ; 6952   0241 0328
        MVO     R2,     G_0330                  ; 6954   0242 0330
        SDBD                                    ; 6956   0001
        MVII    #$696E, R0                      ; 6957   02B8 006E 0069
        MVO     R0,     G_0334                  ; 695A   0240 0334
        B       L_6984                          ; 695C   0200 0026

        DECLE   $0003,  $0000,  $0003,  $0020   ; 695E   0003 0000 0003 0020
        DECLE   $0003,  $0040,  $0004,  $0020   ; 6962   0003 0040 0004 0020
        DECLE   $0004,  $0000,  $0004,  $0060   ; 6966   0004 0000 0004 0060
        DECLE   $0003,  $0080,  $0003,  $0060   ; 696A   0003 0080 0003 0060
        DECLE   $00C3,  $00AC,  $0001           ; 696E   00C3 00AC 0001

        ANDR    R0,     R0                      ; 6971   0180
        ADDR    R6,     R0                      ; 6972   00F0
        RSWD    R1                              ; 6973   0039
L_6974:
        PSHR    R5                              ; 6974   0275
        MVI     G_01E6, R0                      ; 6975   0280 01E6
        DECR    R0                              ; 6977   0010
        BMI     L_698C                          ; 6978   020B 0012

        MVO     R0,     G_01E6                  ; 697A   0240 01E6
        BNEQ    L_698C                          ; 697C   020C 000E

        MVI     G_0180, R0                      ; 697E   0280 0180
        XORI    #$0010, R0                      ; 6980   03F8 0010
        MVO     R0,     G_0180                  ; 6982   0240 0180
L_6984:
        MVI     G_01EA, R0                      ; 6984   0280 01EA
        SLL     R0,     2                       ; 6986   004C
        MVII    #$0020, R1                      ; 6987   02B9 0020
        SUBR    R0,     R1                      ; 6989   0101
        MVO     R1,     G_01E6                  ; 698A   0241 01E6
L_698C:
        PULR    R7                              ; 698C   02B7

L_698D:
        PSHR    R5                              ; 698D   0275
        CLRR    R0                              ; 698E   01C0
        MVO     R0,     G_0334                  ; 698F   0240 0334
        MVII    #$0356, R2                      ; 6991   02BA 0356

        JSR     R5,     L_6A5D                  ; 6993   0004 0168 025D

        SDBD                                    ; 6996   0001
        XORI    #$0600, R0                      ; 6997   03F8 0000 0006
        XORI    #$0200, R1                      ; 699A   03F9 0200
        SDBD                                    ; 699C   0001
        MVII    #$1973, R2                      ; 699D   02BA 0073 0019
        MVO     R0,     G_0320                  ; 69A0   0240 0320
        MVO     R1,     G_0328                  ; 69A2   0241 0328
        MVO     R2,     G_0330                  ; 69A4   0242 0330
        PULR    R7                              ; 69A6   02B7

L_69A7:
        PSHR    R5                              ; 69A7   0275
        MVI     G_01E0, R0                      ; 69A8   0280 01E0
        DECR    R0                              ; 69AA   0010
        BMI     L_69CC                          ; 69AB   020B 001F

        MVO     R0,     G_01E0                  ; 69AD   0240 01E0
        BNEQ    L_69CC                          ; 69AF   020C 001B

        MVI     G_015E, R2                      ; 69B1   0282 015E
        MVII    #$031D, R3                      ; 69B3   02BB 031D
        ADDR    R2,     R3                      ; 69B5   00D3
        ADDR    R2,     R2                      ; 69B6   00D2
        ADDI    #$0346, R2                      ; 69B7   02FA 0346
        MVI     G_01E1, R0                      ; 69B9   0280 01E1
        XORI    #$0001, R0                      ; 69BB   03F8 0001
        MVO     R0,     G_01E1                  ; 69BD   0240 01E1
        BEQ     L_69C3                          ; 69BF   0204 0002

        MVII    #$034A, R2                      ; 69C1   02BA 034A
L_69C3:
        MVII    #$0001, R4                      ; 69C3   02BC 0001

        JSR     R5,     L_68CF                  ; 69C5   0004 0168 00CF

        MVII    #$0032, R0                      ; 69C8   02B8 0032
        MVO     R0,     G_01E0                  ; 69CA   0240 01E0
L_69CC:
        PULR    R7                              ; 69CC   02B7

        PSHR    R5                              ; 69CD   0275
L_69CE:
        MVI     G_015E, R1                      ; 69CE   0281 015E
        ADDI    #$031D, R1                      ; 69D0   02F9 031D
        CLRR    R0                              ; 69D2   01C0
        MVO@    R0,     R1                      ; 69D3   0248
        MVII    #$031F, R1                      ; 69D4   02B9 031F
L_69D6:
        MVI@    R1,     R0                      ; 69D6   0288
        SUBI    #$0003, R0                      ; 69D7   0338 0003
        MVO@    R0,     R1                      ; 69D9   0248
        ADDI    #$0008, R1                      ; 69DA   02F9 0008
        CMPI    #$032F, R1                      ; 69DC   0379 032F
        BLT     L_69D6                          ; 69DE   0225 0009

        SDBD                                    ; 69E0   0001
        MVII    #$09E7, R0                      ; 69E1   02B8 00E7 0009
        MVO@    R0,     R1                      ; 69E4   0248
        CLRR    R0                              ; 69E5   01C0
        MVO     R0,     G_01E1                  ; 69E6   0240 01E1
        MVO     R0,     G_01E0                  ; 69E8   0240 01E0
        MVII    #$000A, R0                      ; 69EA   02B8 000A
        MVO     R0,     G_01DF                  ; 69EC   0240 01DF

        JSR     R5,     L_6D4A                  ; 69EE   0004 016C 014A
        BIDECLE $4000                           ; 69F1   0000 0040
        DECLE   $02B8,  $000E,  $0240,  $01B6   ; 69F3   02B8 000E 0240 01B6
        DECLE   $0004,  $01A0,  $022E,  $0006   ; 69F7   0004 01A0 022E 0006

        PULR    R7                              ; 69FB   02B7

L_69FC:
        PSHR    R5                              ; 69FC   0275
        MVI     G_01DF, R0                      ; 69FD   0280 01DF
        DECR    R0                              ; 69FF   0010
        BMI     L_6A19                          ; 6A00   020B 0017

        MVO     R0,     G_01DF                  ; 6A02   0240 01DF
        BNEQ    L_6A19                          ; 6A04   020C 0013

        MVI     G_01E1, R0                      ; 6A06   0280 01E1
        ADDI    #$0008, R0                      ; 6A08   02F8 0008
        CMPI    #$0010, R0                      ; 6A0A   0378 0010
        BGE     L_6A1A                          ; 6A0C   020D 000C

        MVO     R0,     G_01E1                  ; 6A0E   0240 01E1

        JSR     R5,     L_6D4A                  ; 6A10   0004 016C 014A
        BIDECLE $4000                           ; 6A13   0000 0040

        MVII    #$000A, R0                      ; 6A15   02B8 000A
        MVO     R0,     G_01DF                  ; 6A17   0240 01DF
L_6A19:
        PULR    R7                              ; 6A19   02B7

L_6A1A:
        CLRR    R0                              ; 6A1A   01C0
        MVO     R0,     G_031F                  ; 6A1B   0240 031F

        JSR     R5,     L_51EF                  ; 6A1D   0004 0150 01EF
        DECLE   $002F                           ; 6A20   002F

        MVII    #$0001, R0                      ; 6A21   02B8 0001
        MVO     R0,     G_01E0                  ; 6A23   0240 01E0
        CLRR    R0                              ; 6A25   01C0
        MVO     R0,     G_01DF                  ; 6A26   0240 01DF
        MVO     R0,     G_01E1                  ; 6A28   0240 01E1
        SDBD                                    ; 6A2A   0001
        MVII    #$2000, R0                      ; 6A2B   02B8 0000 0020
        MVO     R0,     G_033C                  ; 6A2E   0240 033C

        JSR     R5,     L_683C                  ; 6A30   0004 0168 003C

        J       L_5A41                          ; 6A33   0004 0358 0241

        INCR    R0                              ; 6A36   0008
        SLR     R3,     2                       ; 6A37   0067
        INCR    R0                              ; 6A38   0008
        MOVR    R4,     R7                      ; 6A39   00A7

        INCR    R0                              ; 6A3A   0008
        SLR     R3,     2                       ; 6A3B   0067
        SWAP    R0,     1                       ; 6A3C   0040
        MOVR    R3,     R7                      ; 6A3D   009F

L_6A3E:
        PSHR    R5                              ; 6A3E   0275
        PSHR    R0                              ; 6A3F   0270
        SDBD                                    ; 6A40   0001
        MVII    #$6A36, R5                      ; 6A41   02BD 0036 006A
        MVI     G_01DB, R0                      ; 6A44   0280 01DB
        CMPI    #$0002, R0                      ; 6A46   0378 0002
        BNEQ    L_6A4C                          ; 6A48   020C 0002

        ADDI    #$0004, R5                      ; 6A4A   02FD 0004
L_6A4C:
        PULR    R0                              ; 6A4C   02B0
        CMP@    R5,     R1                      ; 6A4D   0369
        BLT     L_6A5B                          ; 6A4E   0205 000B

        CMP@    R5,     R1                      ; 6A50   0369
        BGT     L_6A5B                          ; 6A51   020E 0008

        CMP@    R5,     R0                      ; 6A53   0368
        BLT     L_6A5B                          ; 6A54   0205 0005

        CMP@    R5,     R0                      ; 6A56   0368
        BGT     L_6A5B                          ; 6A57   020E 0002

        CLRC                                    ; 6A59   0006
        PULR    R7                              ; 6A5A   02B7

L_6A5B:
        SETC                                    ; 6A5B   0007
        PULR    R7                              ; 6A5C   02B7

L_6A5D:
        PSHR    R5                              ; 6A5D   0275
        MVI@    R2,     R0                      ; 6A5E   0290
        INCR    R2                              ; 6A5F   000A
        MVI@    R2,     R1                      ; 6A60   0291
        DECR    R2                              ; 6A61   0012
        MVI     G_01DB, R5                      ; 6A62   0285 01DB
        CMPI    #$0002, R5                      ; 6A64   037D 0002
        BEQ     L_6A6F                          ; 6A66   0204 0007

        SWAP    R0,     1                       ; 6A68   0040
        ANDI    #$00FF, R0                      ; 6A69   03B8 00FF
        SWAP    R1,     1                       ; 6A6B   0041
        ANDI    #$007F, R1                      ; 6A6C   03B9 007F
        PULR    R7                              ; 6A6E   02B7

L_6A6F:
        SLR     R0,     2                       ; 6A6F   0064
        SLR     R0,     2                       ; 6A70   0064
        NOP                                     ; 6A71   0034
        SLR     R0,     2                       ; 6A72   0064
        SLR     R1,     2                       ; 6A73   0065
        SLR     R1,     2                       ; 6A74   0065
        NOP                                     ; 6A75   0034
        SLR     R1,     2                       ; 6A76   0065
        SUB     G_0358, R0                      ; 6A77   0300 0358
        SUB     G_0359, R1                      ; 6A79   0301 0359
        ADDI    #$0040, R0                      ; 6A7B   02F8 0040
        ADDI    #$0008, R1                      ; 6A7D   02F9 0008
        ANDI    #$00FF, R0                      ; 6A7F   03B8 00FF
        ANDI    #$007F, R1                      ; 6A81   03B9 007F
        PULR    R7                              ; 6A83   02B7

        DECLE   $0100,  $0100,  $0098,  $0050   ; 6A84   0100 0100 0098 0050
        DECLE   $0100,  $0000,  $0108,  $0110   ; 6A88   0100 0000 0108 0110
        DECLE   $0060,  $0108,  $0110,  $0108   ; 6A8C   0060 0108 0110 0108
        DECLE   $0028,  $0110,  $0108,  $0110   ; 6A90   0028 0110 0108 0110
        DECLE   $0058,  $0090,  $0100,  $0100   ; 6A94   0058 0090 0100 0100
        DECLE   $0108,  $0110,  $0008,  $0100   ; 6A98   0108 0110 0008 0100
        DECLE   $0110,  $0108,  $0110,  $0068   ; 6A9C   0110 0108 0110 0068
        DECLE   $0108,  $0110,  $0108,  $0020   ; 6AA0   0108 0110 0108 0020
        DECLE   $0110,  $0108,  $0110,  $0030   ; 6AA4   0110 0108 0110 0030
        DECLE   $0108,  $0110,  $0108,  $0078   ; 6AA8   0108 0110 0108 0078
        DECLE   $0110,  $0108,  $0010,  $0100   ; 6AAC   0110 0108 0010 0100
        DECLE   $0048,  $0080,  $0100,  $0100   ; 6AB0   0048 0080 0100 0100
        DECLE   $0038,  $0108,  $0110,  $0108   ; 6AB4   0038 0108 0110 0108
        DECLE   $0070,  $0110,  $0108,  $0110   ; 6AB8   0070 0110 0108 0110
        DECLE   $0100,  $0018,  $0110,  $0108   ; 6ABC   0100 0018 0110 0108
        DECLE   $0100,  $0100,  $0088,  $0040   ; 6AC0   0100 0100 0088 0040
        DECLE   $0100,  $0100,  $0098,  $0050   ; 6AC4   0100 0100 0098 0050
        DECLE   $0098,  $00A0,  $0108,  $0110   ; 6AC8   0098 00A0 0108 0110
        DECLE   $0110,  $0108,  $0110,  $0108   ; 6ACC   0110 0108 0110 0108
        DECLE   $0108,  $0110,  $0108,  $0110   ; 6AD0   0108 0110 0108 0110
        DECLE   $0058,  $0090,  $0100,  $0100   ; 6AD4   0058 0090 0100 0100
        DECLE   $0108,  $0110,  $00A8,  $0090   ; 6AD8   0108 0110 00A8 0090
        DECLE   $0110,  $0108,  $0110,  $0108   ; 6ADC   0110 0108 0110 0108
        DECLE   $0108,  $0110,  $0108,  $0110   ; 6AE0   0108 0110 0108 0110
        DECLE   $0110,  $0108,  $0110,  $0108   ; 6AE4   0110 0108 0110 0108
        DECLE   $0108,  $0110,  $0108,  $0110   ; 6AE8   0108 0110 0108 0110
        DECLE   $0110,  $0108,  $00B8,  $0080   ; 6AEC   0110 0108 00B8 0080
        DECLE   $0048,  $0080,  $0100,  $0100   ; 6AF0   0048 0080 0100 0100
        DECLE   $0110,  $0108,  $0110,  $0108   ; 6AF4   0110 0108 0110 0108
        DECLE   $0108,  $0110,  $0108,  $0110   ; 6AF8   0108 0110 0108 0110
        DECLE   $0088,  $00B0,  $0110,  $0108   ; 6AFC   0088 00B0 0110 0108
        DECLE   $0100,  $0100,  $0088,  $0040   ; 6B00   0100 0100 0088 0040
        DECLE   $0110,  $0108,  $00F8,  $0048   ; 6B04   0110 0108 00F8 0048
        DECLE   $0048,  $0080,  $0100,  $0100   ; 6B08   0048 0080 0100 0100
        DECLE   $0100,  $0100,  $0100,  $0100   ; 6B0C   0100 0100 0100 0100
        DECLE   $0100,  $0100,  $0100,  $0100   ; 6B10   0100 0100 0100 0100
        DECLE   $0040,  $00F0,  $0110,  $0108   ; 6B14   0040 00F0 0110 0108
        DECLE   $0100,  $0100,  $0088,  $0040   ; 6B18   0100 0100 0088 0040
        DECLE   $0100,  $0100,  $0100,  $0100   ; 6B1C   0100 0100 0100 0100
        DECLE   $0100,  $0100,  $0100,  $0100   ; 6B20   0100 0100 0100 0100
        DECLE   $0100,  $0100,  $0100,  $0100   ; 6B24   0100 0100 0100 0100
        DECLE   $0100,  $0100,  $0100,  $0100   ; 6B28   0100 0100 0100 0100
        DECLE   $0100,  $0100,  $0098,  $0050   ; 6B2C   0100 0100 0098 0050
        DECLE   $0050,  $00E0,  $0108,  $0110   ; 6B30   0050 00E0 0108 0110
        DECLE   $0100,  $0100,  $0100,  $0100   ; 6B34   0100 0100 0100 0100
        DECLE   $0100,  $0100,  $0100,  $0100   ; 6B38   0100 0100 0100 0100
        DECLE   $0058,  $0090,  $0100,  $0100   ; 6B3C   0058 0090 0100 0100
        DECLE   $0108,  $0110,  $00E8,  $0058   ; 6B40   0108 0110 00E8 0058
        DECLE   $0008,  $0100,  $0100,  $0000   ; 6B44   0008 0100 0100 0000
        DECLE   $0108,  $00E8,  $00E0,  $0110   ; 6B48   0108 00E8 00E0 0110
        DECLE   $0110,  $0108,  $0110,  $0108   ; 6B4C   0110 0108 0110 0108
        DECLE   $0108,  $0110,  $0108,  $0110   ; 6B50   0108 0110 0108 0110
        DECLE   $0110,  $0108,  $0110,  $0010   ; 6B54   0110 0108 0110 0010
        DECLE   $0108,  $0110,  $00D8,  $0100   ; 6B58   0108 0110 00D8 0100
        DECLE   $0110,  $0108,  $00C8,  $0100   ; 6B5C   0110 0108 00C8 0100
        DECLE   $0108,  $0110,  $0108,  $0008   ; 6B60   0108 0110 0108 0008
        DECLE   $0110,  $0108,  $0110,  $0108   ; 6B64   0110 0108 0110 0108
        DECLE   $0108,  $0110,  $0108,  $0110   ; 6B68   0108 0110 0108 0110
        DECLE   $0110,  $00F8,  $00F0,  $0108   ; 6B6C   0110 00F8 00F0 0108
        DECLE   $0010,  $0100,  $0100,  $0018   ; 6B70   0010 0100 0100 0018
        DECLE   $0018,  $0108,  $0110,  $0108   ; 6B74   0018 0108 0110 0108
        DECLE   $0100,  $00D0,  $0108,  $0110   ; 6B78   0100 00D0 0108 0110
        DECLE   $0100,  $00C0,  $0110,  $0108   ; 6B7C   0100 00C0 0110 0108
        DECLE   $0000,  $0110,  $0108,  $0110   ; 6B80   0000 0110 0108 0110
        DECLE   $0018,  $0108,  $0110,  $0010   ; 6B84   0018 0108 0110 0010
        DECLE   $0100,  $0088,  $0080,  $0100   ; 6B88   0100 0088 0080 0100
        DECLE   $0100,  $0100,  $0100,  $0100   ; 6B8C   0100 0100 0100 0100
        DECLE   $0100,  $0100,  $0100,  $0100   ; 6B90   0100 0100 0100 0100
        DECLE   $0100,  $0100,  $0100,  $0000   ; 6B94   0100 0100 0100 0000
        DECLE   $0100,  $0100,  $0060,  $0110   ; 6B98   0100 0100 0060 0110
        DECLE   $0100,  $0100,  $0070,  $0108   ; 6B9C   0100 0100 0070 0108
        DECLE   $0100,  $0100,  $0100,  $0018   ; 6BA0   0100 0100 0100 0018
        DECLE   $0100,  $0100,  $0100,  $0100   ; 6BA4   0100 0100 0100 0100
        DECLE   $0100,  $0100,  $0100,  $0100   ; 6BA8   0100 0100 0100 0100
        DECLE   $0100,  $0098,  $0090,  $0100   ; 6BAC   0100 0098 0090 0100
        DECLE   $0000,  $0110,  $0108,  $0008   ; 6BB0   0000 0110 0108 0008
        DECLE   $0008,  $0100,  $0100,  $0100   ; 6BB4   0008 0100 0100 0100
        DECLE   $0108,  $0068,  $0100,  $0100   ; 6BB8   0108 0068 0100 0100
        DECLE   $0110,  $0078,  $0100,  $0100   ; 6BBC   0110 0078 0100 0100
        DECLE   $0010,  $0100,  $0100,  $0100   ; 6BC0   0010 0100 0100 0100
        DECLE   $0100,  $0100,  $0100,  $0100   ; 6BC4   0100 0100 0100 0100
        DECLE   $0100,  $0098,  $0090,  $0100   ; 6BC8   0100 0098 0090 0100
        DECLE   $0000,  $0108,  $0110,  $0008   ; 6BCC   0000 0108 0110 0008
        DECLE   $00C0,  $0110,  $0108,  $00C8   ; 6BD0   00C0 0110 0108 00C8
        DECLE   $00E8,  $0008,  $0100,  $0100   ; 6BD4   00E8 0008 0100 0100
        DECLE   $0108,  $0110,  $0068,  $0100   ; 6BD8   0108 0110 0068 0100
        DECLE   $0110,  $0108,  $0078,  $0100   ; 6BDC   0110 0108 0078 0100
        DECLE   $00F8,  $0010,  $0100,  $0100   ; 6BE0   00F8 0010 0100 0100
        DECLE   $00D0,  $0108,  $0110,  $00D8   ; 6BE4   00D0 0108 0110 00D8
        DECLE   $0018,  $0110,  $0108,  $0010   ; 6BE8   0018 0110 0108 0010
        DECLE   $0100,  $0088,  $0080,  $0100   ; 6BEC   0100 0088 0080 0100
        DECLE   $0100,  $0100,  $0100,  $0100   ; 6BF0   0100 0100 0100 0100
        DECLE   $0100,  $0100,  $0000           ; 6BF4   0100 0100 0000

        ADDR    R4,     R0                      ; 6BF7   00E0
        SUBR    R0,     R0                      ; 6BF8   0100
        SLR     R0,     1                       ; 6BF9   0060
        SUBR    R1,     R0                      ; 6BFA   0108
        SUBR    R2,     R0                      ; 6BFB   0110
        SUBR    R0,     R0                      ; 6BFC   0100
        RRC     R0,     1                       ; 6BFD   0070
        SUBR    R2,     R0                      ; 6BFE   0110
        SUBR    R1,     R0                      ; 6BFF   0108
        SUBR    R0,     R0                      ; 6C00   0100
        SUBR    R0,     R0                      ; 6C01   0100
        COMR    R0                              ; 6C02   0018
        ADDR    R6,     R0                      ; 6C03   00F0
        SUBR    R2,     R0                      ; 6C04   0110
        SUBR    R1,     R0                      ; 6C05   0108
        SUBR    R2,     R0                      ; 6C06   0110
        SUBR    R1,     R0                      ; 6C07   0108
        SUBR    R1,     R0                      ; 6C08   0108
        SUBR    R2,     R0                      ; 6C09   0110
        SUBR    R1,     R0                      ; 6C0A   0108
        SUBR    R2,     R0                      ; 6C0B   0110
        SUBR    R2,     R0                      ; 6C0C   0110
        SUBR    R1,     R0                      ; 6C0D   0108
        SUBR    R2,     R0                      ; 6C0E   0110
        SUBR    R1,     R0                      ; 6C0F   0108
        SUBR    R1,     R0                      ; 6C10   0108
        SUBR    R2,     R0                      ; 6C11   0110
        SUBR    R1,     R0                      ; 6C12   0108
        SUBR    R2,     R0                      ; 6C13   0110
L_6C14:
        PSHR    R5                              ; 6C14   0275
L_6C15:
        MVII    #$0005, R0                      ; 6C15   02B8 0005
        MVO     R0,     G_01EC                  ; 6C17   0240 01EC

        JSR     R5,     L_6D4A                  ; 6C19   0004 016C 014A
        BIDECLE $0800                           ; 6C1C   0000 0008

        MVII    #$0002, R0                      ; 6C1E   02B8 0002
        MVO     R0,     G_01DB                  ; 6C20   0240 01DB
        MVII    #$0005, R0                      ; 6C22   02B8 0005
        MVO     R0,     G_01B6                  ; 6C24   0240 01B6
        MVII    #$0004, R0                      ; 6C26   02B8 0004
        MVO     R0,     G_0103                  ; 6C28   0240 0103
        MVII    #$0000, R0                      ; 6C2A   02B8 0000
        MVO     R0,     G_0104                  ; 6C2C   0240 0104

        JSR     R5,     L_525A                  ; 6C2E   0004 0150 025A
        DECLE   $0002                           ; 6C31   0002

        JSR     R5,     L_6D41                  ; 6C32   0004 016C 0141

        SDBD                                    ; 6C35   0001
        MVII    #$5873, R0                      ; 6C36   02B8 0073 0058
        MVO     R0,     G_0339                  ; 6C39   0240 0339
        SDBD                                    ; 6C3B   0001
        MVII    #$6CEE, R1                      ; 6C3C   02B9 00EE 006C

        JSR     R5,     L_5656                  ; 6C3F   0004 0154 0256

        MVII    #$017B, R4                      ; 6C42   02BC 017B
        SDBD                                    ; 6C44   0001
        MVI@    R4,     R1                      ; 6C45   02A1
        SDBD                                    ; 6C46   0001
        MVII    #$6CD3, R2                      ; 6C47   02BA 00D3 006C
        MVI     G_01E2, R0                      ; 6C4A   0280 01E2
        PSHR    R0                              ; 6C4C   0270
        SLL     R0,     2                       ; 6C4D   004C
        SLL     R0,     1                       ; 6C4E   0048
        ADD@    R6,     R0                      ; 6C4F   02F0
        ADDR    R0,     R2                      ; 6C50   00C2
        MVII    #$0009, R0                      ; 6C51   02B8 0009
L_6C53:
        MVI@    R2,     R4                      ; 6C53   0294
        INCR    R2                              ; 6C54   000A
        PSHR    R2                              ; 6C55   0272
        PSHR    R0                              ; 6C56   0270
        MVI@    R1,     R2                      ; 6C57   028A
        INCR    R1                              ; 6C58   0009
        MOVR    R2,     R3                      ; 6C59   0093
        ANDI    #$000F, R3                      ; 6C5A   03BB 000F
        XORR    R3,     R2                      ; 6C5C   01DA
        MVI     G_01E2, R0                      ; 6C5D   0280 01E2
        CMPI    #$0001, R0                      ; 6C5F   0378 0001
        BLT     L_6C74                          ; 6C61   0205 0011

        SLR     R2,     2                       ; 6C63   0066
        SLR     R2,     2                       ; 6C64   0066
        CMPI    #$0001, R0                      ; 6C65   0378 0001
        BNEQ    L_6C6F                          ; 6C67   020C 0006

        SDBD                                    ; 6C69   0001
        ADDI    #$6D0F, R2                      ; 6C6A   02FA 000F 006D
        B       L_6C73                          ; 6C6D   0200 0004

L_6C6F:
        SDBD                                    ; 6C6F   0001
        ADDI    #$6D28, R2                      ; 6C70   02FA 0028 006D
L_6C73:
        MVI@    R2,     R2                      ; 6C73   0292
L_6C74:
        SDBD                                    ; 6C74   0001
        ADDI    #$6A84, R2                      ; 6C75   02FA 0084 006A
        ADD     G_0339, R3                      ; 6C78   02C3 0339
        MVI@    R3,     R0                      ; 6C7A   0298
        SLL     R0,     1                       ; 6C7B   0048
        SWAP    R0,     1                       ; 6C7C   0040

        JSR     R5,     L_6E1D                  ; 6C7D   0004 016C 021D

        MVII    #$0004, R5                      ; 6C80   02BD 0004
L_6C82:
        MVII    #$0004, R3                      ; 6C82   02BB 0004
L_6C84:
        MVI@    R2,     R0                      ; 6C84   0290
        INCR    R2                              ; 6C85   000A
        MVO     R0,     G_0340                  ; 6C86   0240 0340
        CMPI    #$0108, R0                      ; 6C88   0378 0108
        BGE     L_6C90                          ; 6C8A   020D 0004

        MVI     G_0341, R0                      ; 6C8C   0280 0341
        B       L_6CA3                          ; 6C8E   0200 0013

L_6C90:
        MVI     G_033E, R0                      ; 6C90   0280 033E
        SDBD                                    ; 6C92   0001
        CMPI    #$3400, R0                      ; 6C93   0378 0000 0034
        BEQ     L_6C9D                          ; 6C96   0204 0005

        CLRR    R0                              ; 6C98   01C0
        MVO     R0,     G_0340                  ; 6C99   0240 0340
        B       L_6CA3                          ; 6C9B   0200 0006

L_6C9D:
        MVI     G_0341, R0                      ; 6C9D   0280 0341
        XORI    #$0005, R0                      ; 6C9F   03F8 0005
        B       L_6CA5                          ; 6CA1   0200 0002

L_6CA3:
        XOR     G_033F, R0                      ; 6CA3   03C0 033F
L_6CA5:
        XOR     G_033E, R0                      ; 6CA5   03C0 033E
        XOR     G_0340, R0                      ; 6CA7   03C0 0340
        MVO@    R0,     R4                      ; 6CA9   0260
        DECR    R3                              ; 6CAA   0013
        BNEQ    L_6C84                          ; 6CAB   022C 0028

        ADDI    #$0010, R4                      ; 6CAD   02FC 0010
        DECR    R5                              ; 6CAF   0015
        BNEQ    L_6C82                          ; 6CB0   022C 002F

        PULR    R0                              ; 6CB2   02B0
        PULR    R2                              ; 6CB3   02B2
        DECR    R0                              ; 6CB4   0010
        BNEQ    L_6C53                          ; 6CB5   022C 0063

        MVII    #$003D, R0                      ; 6CB7   02B8 003D
        MVO     R0,     G_01C0                  ; 6CB9   0240 01C0

        JSR     R5,     L_6FB9                  ; 6CBB   0004 016C 03B9
        DECLE   $000C                           ; 6CBE   000C

        JSR     R5,     L_698D                  ; 6CBF   0004 0168 018D
        JSR     R5,     L_68C9                  ; 6CC2   0004 0168 00C9
        JSR     R5,     L_684E                  ; 6CC5   0004 0168 004E
        JSR     R5,     L_6D4A                  ; 6CC8   0004 016C 014A
        BIDECLE $1E1F                           ; 6CCB   001F 001E

        JSR     R5,     L_5A40                  ; 6CCD   0004 0158 0240

        J       L_594D                          ; 6CD0   0004 0358 014D

        DECLE   $0207,  $020B                   ; 6CD3   0207 020B

        BESC    L_6F2E                          ; 6CD5   020F 0257

        MVO@    R3,     R3                      ; 6CD7   025B
        MVO@    R7,     R3                      ; 6CD8   025F
        MVI@    R4,     R7                      ; 6CD9   02A7

        MVI@    R5,     R3                      ; 6CDA   02AB
        MVI@    R5,     R7                      ; 6CDB   02AF
        MVI@    R5,     R7                      ; 6CDC   02AF

        MVI@    R5,     R3                      ; 6CDD   02AB
        MVI@    R4,     R7                      ; 6CDE   02A7

        DECLE   $025F,  $025B,  $0257,  $020F   ; 6CDF   025F 025B 0257 020F
        DECLE   $020B,  $0207                   ; 6CE3   020B 0207

        MVI@    R4,     R7                      ; 6CE5   02A7

        MVI@    R5,     R3                      ; 6CE6   02AB
        MVI@    R5,     R7                      ; 6CE7   02AF

        DECLE   $0257,  $025B,  $025F,  $0207   ; 6CE8   0257 025B 025F 0207
        DECLE   $020B,  $020F,  $03B0,  $0028   ; 6CEC   020B 020F 03B0 0028
        DECLE   $03F6,  $03D7,  $03A0,  $000E   ; 6CF0   03F6 03D7 03A0 000E
        DECLE   $03F6,  $03D7,  $03A0,  $000E   ; 6CF4   03F6 03D7 03A0 000E
        DECLE   $03F6,  $03D7,  $03A0,  $000E   ; 6CF8   03F6 03D7 03A0 000E
        DECLE   $03F6,  $03D7,  $03A0,  $000E   ; 6CFC   03F6 03D7 03A0 000E
        DECLE   $03F6,  $03D7,  $03A0,  $000E   ; 6D00   03F6 03D7 03A0 000E
        DECLE   $03F6,  $03D7,  $03A0,  $000E   ; 6D04   03F6 03D7 03A0 000E
        DECLE   $03F6,  $03D7,  $03A0,  $000E   ; 6D08   03F6 03D7 03A0 000E
        DECLE   $03F6,  $03D7,  $0000,  $0020   ; 6D0C   03F6 03D7 0000 0020
        DECLE   $0030,  $0000,  $0010,  $0060   ; 6D10   0030 0000 0010 0060
        DECLE   $0070,  $0040,  $0050,  $00A0   ; 6D14   0070 0040 0050 00A0
        DECLE   $00B0,  $0080,  $0090,  $00E0   ; 6D18   00B0 0080 0090 00E0
        DECLE   $00F0,  $00C0,  $00D0,  $0120   ; 6D1C   00F0 00C0 00D0 0120
        DECLE   $0130,  $0100,  $0110,  $0160   ; 6D20   0130 0100 0110 0160
        DECLE   $0170,  $0140,  $0150,  $0180   ; 6D24   0170 0140 0150 0180
        DECLE   $0030,  $0020,  $0010,  $0000   ; 6D28   0030 0020 0010 0000

        RRC     R0,     1                       ; 6D2C   0070
        SLR     R0,     1                       ; 6D2D   0060
        RLC     R0,     1                       ; 6D2E   0050
        SWAP    R0,     1                       ; 6D2F   0040
        MOVR    R6,     R0                      ; 6D30   00B0
        MOVR    R4,     R0                      ; 6D31   00A0
        MOVR    R2,     R0                      ; 6D32   0090
        TSTR    R0                              ; 6D33   0080
        ADDR    R4,     R0                      ; 6D34   00E0
        ADDR    R2,     R0                      ; 6D35   00D0
        ADDR    R0,     R0                      ; 6D36   00C0
        ADDR    R6,     R0                      ; 6D37   00F0
        SUBR    R4,     R0                      ; 6D38   0120
        SUBR    R2,     R0                      ; 6D39   0110
        SUBR    R0,     R0                      ; 6D3A   0100
        SUBR    R6,     R0                      ; 6D3B   0130
        CMPR    R4,     R0                      ; 6D3C   0160
        CMPR    R2,     R0                      ; 6D3D   0150
        CMPR    R0,     R0                      ; 6D3E   0140
        CMPR    R6,     R0                      ; 6D3F   0170
        ANDR    R0,     R0                      ; 6D40   0180
L_6D41:
        PSHR    R5                              ; 6D41   0275
        MVII    #$0200, R4                      ; 6D42   02BC 0200
        MVII    #$00F0, R0                      ; 6D44   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 6D46   0004 0114 0338

        PULR    R7                              ; 6D49   02B7

L_6D4A:
        SDBD                                    ; 6D4A   0001
        MVI@    R5,     R0                      ; 6D4B   02A8
L_6D4C:
        MOVR    R0,     R1                      ; 6D4C   0081
        COMR    R1                              ; 6D4D   0019
        AND     G_033C, R1                      ; 6D4E   0381 033C
        XORR    R0,     R1                      ; 6D50   01C1
        MVO     R1,     G_033C                  ; 6D51   0241 033C
        MOVR    R5,     R7                      ; 6D53   00AF

L_6D54:
        MVI     G_035E, R0                      ; 6D54   0280 035E
        MVO     R0,     G_033D                  ; 6D56   0240 033D
        MOVR    R5,     R7                      ; 6D58   00AF

L_6D59:
        MVI     G_033D, R0                      ; 6D59   0280 033D
        MVO     R0,     G_035E                  ; 6D5B   0240 035E
        MOVR    R5,     R7                      ; 6D5D   00AF

L_6D5E:
        CLRR    R2                              ; 6D5E   01D2
L_6D5F:
        INCR    R2                              ; 6D5F   000A
        SUBI    #$0014, R0                      ; 6D60   0338 0014
        BPL     L_6D5F                          ; 6D62   0223 0004

        ADDI    #$0015, R0                      ; 6D64   02F8 0015
        SLL     R0,     2                       ; 6D66   004C
        SLL     R0,     1                       ; 6D67   0048
        SLL     R2,     2                       ; 6D68   004E
        SLL     R2,     1                       ; 6D69   004A
        MOVR    R5,     R7                      ; 6D6A   00AF

L_6D6B:
        SLR     R0,     2                       ; 6D6B   0064
        SLR     R0,     1                       ; 6D6C   0060
        SLR     R1,     2                       ; 6D6D   0065
        SLR     R1,     1                       ; 6D6E   0061
        DECR    R0                              ; 6D6F   0010
        DECR    R1                              ; 6D70   0011
        SLL     R1,     2                       ; 6D71   004D
        PSHR    R1                              ; 6D72   0271
        SLL     R1,     2                       ; 6D73   004D
        ADD@    R6,     R1                      ; 6D74   02F1
        ADDR    R1,     R0                      ; 6D75   00C8
        MOVR    R5,     R7                      ; 6D76   00AF

L_6D77:
        PSHR    R5                              ; 6D77   0275
        MVI     G_015E, R1                      ; 6D78   0281 015E
        SLL     R1,     1                       ; 6D7A   0049
        ADDI    #$0342, R1                      ; 6D7B   02F9 0342
        MVI@    R1,     R0                      ; 6D7D   0288
        SWAP    R0,     1                       ; 6D7E   0040
        ANDI    #$00FF, R0                      ; 6D7F   03B8 00FF
        INCR    R1                              ; 6D81   0009
        MVI@    R1,     R3                      ; 6D82   028B
        SWAP    R3,     1                       ; 6D83   0043
        ANDI    #$007F, R3                      ; 6D84   03BB 007F
        MVI     G_0356, R1                      ; 6D86   0281 0356
        SWAP    R1,     1                       ; 6D88   0041
        ANDI    #$00FF, R1                      ; 6D89   03B9 00FF
        SUBR    R1,     R0                      ; 6D8B   0108

        JSR     R5,     X_SQUARE                ; 6D8C   0004 011C 01DB

        MVI     G_0357, R1                      ; 6D8F   0281 0357
        SWAP    R1,     1                       ; 6D91   0041
        ANDI    #$007F, R1                      ; 6D92   03B9 007F
        SUBR    R1,     R3                      ; 6D94   010B
        MOVR    R3,     R0                      ; 6D95   0098
        MOVR    R2,     R3                      ; 6D96   0093

        JSR     R5,     X_SQUARE                ; 6D97   0004 011C 01DB

        ADDR    R2,     R3                      ; 6D9A   00D3
        MOVR    R3,     R1                      ; 6D9B   0099

        JSR     R5,     X_SQRT                  ; 6D9C   0004 011C 0223

        MVII    #$000D, R0                      ; 6D9F   02B8 000D
        MOVR    R2,     R1                      ; 6DA1   0091
        SLL     R1,     2                       ; 6DA2   004D

        JSR     R5,     X_MPY                   ; 6DA3   0004 011C 01DC

        SLR     R2,     2                       ; 6DA6   0066
        SLR     R2,     2                       ; 6DA7   0066
        MOVR    R2,     R0                      ; 6DA8   0090
        PULR    R7                              ; 6DA9   02B7

L_6DAA:
        CLRR    R0                              ; 6DAA   01C0
        MVI     G_015D, R1                      ; 6DAB   0281 015D
        CMPI    #$0001, R1                      ; 6DAD   0379 0001
        BEQ     L_6DCA                          ; 6DAF   0204 0019

        MVI     G_0161, R1                      ; 6DB1   0281 0161
        CMPI    #$0001, R1                      ; 6DB3   0379 0001
        BEQ     L_6DCA                          ; 6DB5   0204 0013

        SUBI    #$0002, R1                      ; 6DB7   0339 0002
        BMI     L_6DCA                          ; 6DB9   020B 000F

        MVII    #$0190, R2                      ; 6DBB   02BA 0190
        MVII    #$0190, R3                      ; 6DBD   02BB 0190
        ADDI    #$0012, R3                      ; 6DBF   02FB 0012
        ADDR    R1,     R2                      ; 6DC1   00CA
        ADDR    R1,     R3                      ; 6DC2   00CB
L_6DC3:
        MVI@    R2,     R4                      ; 6DC3   0294
        CMP@    R3,     R4                      ; 6DC4   035C
        BEQ     L_6DD2                          ; 6DC5   0204 000B
        BLT     L_6DCA                          ; 6DC7   0205 0001

        INCR    R0                              ; 6DC9   0008
L_6DCA:
        MVO     R0,     G_015E                  ; 6DCA   0240 015E
        CLRR    R0                              ; 6DCC   01C0
        MVO     R0,     G_01B4                  ; 6DCD   0240 01B4
        MVO     R0,     G_01B5                  ; 6DCF   0240 01B5
        MOVR    R5,     R7                      ; 6DD1   00AF

L_6DD2:
        DECR    R2                              ; 6DD2   0012
        DECR    R3                              ; 6DD3   0013
        DECR    R1                              ; 6DD4   0011
        BPL     L_6DC3                          ; 6DD5   0223 0013
        B       L_6DCA                          ; 6DD7   0220 000E

L_6DD9:
        PSHR    R5                              ; 6DD9   0275
        MVII    #$0000, R3                      ; 6DDA   02BB 0000
        MVI     G_015D, R1                      ; 6DDC   0281 015D
        CMPI    #$0001, R1                      ; 6DDE   0379 0001
        BEQ     L_6DFD                          ; 6DE0   0204 001B

        MVI     G_01D3, R1                      ; 6DE2   0281 01D3
        MVI     G_01D4, R2                      ; 6DE4   0282 01D4
        CMPI    #$0000, R1                      ; 6DE6   0379 0000
        BEQ     L_6DFC                          ; 6DE8   0204 0012

        CMPI    #$0000, R2                      ; 6DEA   037A 0000
        BEQ     L_6DFD                          ; 6DEC   0204 000F

        CMPI    #$0001, R1                      ; 6DEE   0379 0001
        BEQ     L_6DF8                          ; 6DF0   0204 0006

        CMPI    #$0001, R2                      ; 6DF2   037A 0001
        BEQ     L_6DFD                          ; 6DF4   0204 0007
        B       L_6E08                          ; 6DF6   0200 0010

L_6DF8:
        CMPI    #$0001, R2                      ; 6DF8   037A 0001
        BEQ     L_6E08                          ; 6DFA   0204 000C

L_6DFC:
        INCR    R3                              ; 6DFC   000B
L_6DFD:
        MVO     R3,     G_015E                  ; 6DFD   0243 015E

        JSR     R5,     L_6D77                  ; 6DFF   0004 016C 0177

        MVO     R0,     G_015F                  ; 6E02   0240 015F
        SWAP    R0,     1                       ; 6E04   0040
        MVO     R0,     G_0160                  ; 6E05   0240 0160
        PULR    R7                              ; 6E07   02B7

L_6E08:
        MVO     R3,     G_015E                  ; 6E08   0243 015E

        JSR     R5,     L_6D77                  ; 6E0A   0004 016C 0177

        MOVR    R0,     R4                      ; 6E0D   0084
        MVII    #$0001, R3                      ; 6E0E   02BB 0001
        MVO     R3,     G_015E                  ; 6E10   0243 015E

        JSR     R5,     L_6D77                  ; 6E12   0004 016C 0177

        MVII    #$0000, R3                      ; 6E15   02BB 0000
        CMPR    R0,     R4                      ; 6E17   0144
        BGE     L_6DFD                          ; 6E18   022D 001C

        MOVR    R0,     R4                      ; 6E1A   0084
        B       L_6DFC                          ; 6E1B   0220 0020

L_6E1D:
        PSHR    R5                              ; 6E1D   0275
        MOVR    R0,     R5                      ; 6E1E   0085
        SDBD                                    ; 6E1F   0001
        ANDI    #$3600, R0                      ; 6E20   03B8 0000 0036
        MVO     R0,     G_033E                  ; 6E23   0240 033E
        MOVR    R5,     R0                      ; 6E25   00A8
        ANDI    #$0007, R0                      ; 6E26   03B8 0007
        MVO     R0,     G_033F                  ; 6E28   0240 033F
        MOVR    R5,     R0                      ; 6E2A   00A8
        ANDI    #$01F8, R0                      ; 6E2B   03B8 01F8
        MVO     R0,     G_0340                  ; 6E2D   0240 0340
        MOVR    R5,     R0                      ; 6E2F   00A8
        SDBD                                    ; 6E30   0001
        ANDI    #$0800, R0                      ; 6E31   03B8 0000 0008
        MVO     R0,     G_0341                  ; 6E34   0240 0341
        MOVR    R5,     R0                      ; 6E36   00A8
        PULR    R7                              ; 6E37   02B7

L_6E38:
        PSHR    R5                              ; 6E38   0275
        MVII    #$034C, R2                      ; 6E39   02BA 034C

        JSR     R5,     L_6A5D                  ; 6E3B   0004 0168 025D
        JSR     R5,     L_6A3E                  ; 6E3E   0004 0168 023E

        BNC     L_6E55                          ; 6E41   0209 0012

        MVII    #$0007, R0                      ; 6E43   02B8 0007
        MVI     G_01DC, R1                      ; 6E45   0281 01DC
        CMPI    #$0002, R1                      ; 6E47   0379 0002
        BEQ     L_6F47                          ; 6E49   0204 00FC

        MVI     G_01DB, R1                      ; 6E4B   0281 01DB
        CMPI    #$0002, R1                      ; 6E4D   0379 0002
        BNEQ    L_6F47                          ; 6E4F   020C 00F6

        MVII    #$000D, R0                      ; 6E51   02B8 000D
        B       L_6F47                          ; 6E53   0200 00F2

L_6E55:
        MVII    #$0356, R2                      ; 6E55   02BA 0356

        JSR     R5,     L_6A5D                  ; 6E57   0004 0168 025D

        MOVR    R0,     R3                      ; 6E5A   0083
        MOVR    R1,     R4                      ; 6E5B   008C
        MVII    #$034C, R2                      ; 6E5C   02BA 034C

        JSR     R5,     L_6A5D                  ; 6E5E   0004 0168 025D

        MVI     G_01DB, R2                      ; 6E61   0282 01DB
        CMPR    R0,     R3                      ; 6E63   0143
        BEQ     L_6E6E                          ; 6E64   0204 0008

        CMPI    #$0001, R2                      ; 6E66   037A 0001
        BEQ     L_6E8B                          ; 6E68   0204 0021

        INCR    R3                              ; 6E6A   000B
        CMPR    R0,     R3                      ; 6E6B   0143
        BNEQ    L_6E8B                          ; 6E6C   020C 001D

L_6E6E:
        CMPR    R1,     R4                      ; 6E6E   014C
        BEQ     L_6E79                          ; 6E6F   0204 0008

        CMPI    #$0001, R2                      ; 6E71   037A 0001
        BEQ     L_6E8B                          ; 6E73   0204 0016

        INCR    R4                              ; 6E75   000C
        CMPR    R1,     R4                      ; 6E76   014C
        BNEQ    L_6E8B                          ; 6E77   020C 0012

L_6E79:
        MVII    #$0006, R0                      ; 6E79   02B8 0006
        MVI     G_01DC, R1                      ; 6E7B   0281 01DC
        CMPI    #$0001, R1                      ; 6E7D   0379 0001
        BEQ     L_6F47                          ; 6E7F   0204 00C6

        MVI     G_034F, R0                      ; 6E81   0280 034F
        CMPI    #$0021, R0                      ; 6E83   0378 0021
        BGT     L_6EC6                          ; 6E85   020E 003F

        MVII    #$0000, R0                      ; 6E87   02B8 0000
        B       L_6F47                          ; 6E89   0200 00BC

L_6E8B:
        MVII    #$034C, R2                      ; 6E8B   02BA 034C

        JSR     R5,     L_6A5D                  ; 6E8D   0004 0168 025D
        JSR     R5,     L_6D6B                  ; 6E90   0004 016C 016B

        MVII    #$0200, R1                      ; 6E93   02B9 0200
        ADDR    R0,     R1                      ; 6E95   00C1
        MVI@    R1,     R0                      ; 6E96   0288

        JSR     R5,     L_6E1D                  ; 6E97   0004 016C 021D

        MVI     G_0340, R0                      ; 6E9A   0280 0340
        CMPI    #$0130, R0                      ; 6E9C   0378 0130
        BGE     L_6EA9                          ; 6E9E   020D 0009

        MVI     G_033E, R1                      ; 6EA0   0281 033E
        TSTR    R0                              ; 6EA2   0080
        BNEQ    L_6EAD                          ; 6EA3   020C 0008

        CMPI    #$0000, R1                      ; 6EA5   0379 0000
        BNEQ    L_6EAD                          ; 6EA7   020C 0004

L_6EA9:
        MVII    #$0008, R0                      ; 6EA9   02B8 0008
        B       L_6F47                          ; 6EAB   0200 009A

L_6EAD:
        MVI     G_01DB, R0                      ; 6EAD   0280 01DB
        CMPI    #$0002, R0                      ; 6EAF   0378 0002
        BEQ     L_6F4F                          ; 6EB1   0204 009C

        MVI     G_033E, R0                      ; 6EB3   0280 033E
        SDBD                                    ; 6EB5   0001
        CMPI    #$3400, R0                      ; 6EB6   0378 0000 0034
        BNEQ    L_6ECA                          ; 6EB9   020C 000F

        MVI     G_01D9, R0                      ; 6EBB   0280 01D9
        TSTR    R0                              ; 6EBD   0080
        BNEQ    L_6ECA                          ; 6EBE   020C 000A

        MVI     G_0340, R0                      ; 6EC0   0280 0340
        CMPI    #$0100, R0                      ; 6EC2   0378 0100
        BGE     L_6ECA                          ; 6EC4   020D 0004

L_6EC6:
        MVII    #$0001, R0                      ; 6EC6   02B8 0001
        B       L_6F47                          ; 6EC8   0200 007D

L_6ECA:
        MVI     G_0340, R0                      ; 6ECA   0280 0340
        CMPI    #$0100, R0                      ; 6ECC   0378 0100
        BLT     L_6EE1                          ; 6ECE   0205 0011

        CMPI    #$0118, R0                      ; 6ED0   0378 0118
        BGT     L_6EE1                          ; 6ED2   020E 000D

        MVI     G_01D9, R1                      ; 6ED4   0281 01D9
        TSTR    R1                              ; 6ED6   0089
        BNEQ    L_6EE1                          ; 6ED7   020C 0008

        SUBI    #$0100, R0                      ; 6ED9   0338 0100
        SLR     R0,     2                       ; 6EDB   0064
        SLR     R0,     1                       ; 6EDC   0060
        ADDI    #$0009, R0                      ; 6EDD   02F8 0009
        B       L_6F47                          ; 6EDF   0200 0066

L_6EE1:
        MVI     G_033E, R0                      ; 6EE1   0280 033E
        SDBD                                    ; 6EE3   0001
        CMPI    #$1200, R0                      ; 6EE4   0378 0000 0012
        BNEQ    L_6EF8                          ; 6EE7   020C 000F

        MVI     G_0340, R0                      ; 6EE9   0280 0340
        CMPI    #$00F0, R0                      ; 6EEB   0378 00F0
        BEQ     L_6EF4                          ; 6EED   0204 0005

        MVI     G_01D9, R0                      ; 6EEF   0280 01D9
        TSTR    R0                              ; 6EF1   0080
        BNEQ    L_6EF8                          ; 6EF2   020C 0004

L_6EF4:
        MVII    #$0005, R0                      ; 6EF4   02B8 0005
        B       L_6F47                          ; 6EF6   0200 004F

L_6EF8:
        MVI     G_033E, R1                      ; 6EF8   0281 033E
        MVI     G_033F, R2                      ; 6EFA   0282 033F
        MVI     G_01D9, R0                      ; 6EFC   0280 01D9
        TSTR    R0                              ; 6EFE   0080
        BNEQ    L_6F09                          ; 6EFF   020C 0008

        SDBD                                    ; 6F01   0001
        CMPI    #$0600, R1                      ; 6F02   0379 0000 0006
        BEQ     L_6F0D                          ; 6F05   0204 0006
        B       L_6F11                          ; 6F07   0200 0008

L_6F09:
        CMPI    #$0003, R2                      ; 6F09   037A 0003
        BNEQ    L_6F11                          ; 6F0B   020C 0004

L_6F0D:
        MVII    #$0004, R0                      ; 6F0D   02B8 0004
        B       L_6F47                          ; 6F0F   0200 0036

L_6F11:
        TSTR    R0                              ; 6F11   0080
        BNEQ    L_6F1C                          ; 6F12   020C 0008

        SDBD                                    ; 6F14   0001
        CMPI    #$2200, R1                      ; 6F15   0379 0000 0022
        BEQ     L_6F26                          ; 6F18   0204 000C
        B       L_6F2A                          ; 6F1A   0200 000E

L_6F1C:
        CMPI    #$0005, R2                      ; 6F1C   037A 0005
        BNEQ    L_6F2A                          ; 6F1E   020C 000A

        MVI     G_0340, R3                      ; 6F20   0283 0340
        CMPI    #$00F0, R3                      ; 6F22   037B 00F0
        BEQ     L_6F39                          ; 6F24   0204 0013

L_6F26:
        MVII    #$0003, R0                      ; 6F26   02B8 0003
        B       L_6F47                          ; 6F28   0200 001D

L_6F2A:
        TSTR    R0                              ; 6F2A   0080
        DECLE   $020C,  $0008,  $0001           ; 6F2B   020C 0008 0001
L_6F2E:
        CMPI    #$0000, R1                      ; 6F2E   0379 0000
        NEGR    R0                              ; 6F30   0020
        BEQ     L_6F39                          ; 6F31   0204 0006
        B       L_6F45                          ; 6F33   0200 0010

        CMPI    #$0004, R2                      ; 6F35   037A 0004
        BNEQ    L_6F45                          ; 6F37   020C 000C

L_6F39:
        MVII    #$0006, R0                      ; 6F39   02B8 0006
        MVI     G_01DC, R3                      ; 6F3B   0283 01DC
        CMPI    #$0002, R3                      ; 6F3D   037B 0002
        BNEQ    L_6F47                          ; 6F3F   020C 0006

        MVII    #$0007, R0                      ; 6F41   02B8 0007
        B       L_6F47                          ; 6F43   0200 0002

L_6F45:
        MVII    #$0003, R0                      ; 6F45   02B8 0003
L_6F47:
        MVO     R0,     G_01D8                  ; 6F47   0240 01D8
        MVII    #$01D3, R1                      ; 6F49   02B9 01D3
        ADD     G_015E, R1                      ; 6F4B   02C1 015E
        MVO@    R0,     R1                      ; 6F4D   0248
        PULR    R7                              ; 6F4E   02B7

L_6F4F:
        MVII    #$0001, R0                      ; 6F4F   02B8 0001
        MVI     G_033E, R1                      ; 6F51   0281 033E
        SDBD                                    ; 6F53   0001
        CMPI    #$3400, R1                      ; 6F54   0379 0000 0034
        BNEQ    L_6EE1                          ; 6F57   022C 0077

        MVI     G_01D9, R1                      ; 6F59   0281 01D9
        TSTR    R1                              ; 6F5B   0089
        BEQ     L_6F47                          ; 6F5C   0224 0016

        MVI     G_0340, R1                      ; 6F5E   0281 0340
        CMPI    #$0110, R1                      ; 6F60   0379 0110
        BEQ     L_6F47                          ; 6F62   0224 001C
        B       L_6EE1                          ; 6F64   0220 0084

L_6F66:
        MVII    #$0005, R0                      ; 6F66   02B8 0005
        MVII    #$0342, R4                      ; 6F68   02BC 0342
        MVI     G_0354, R1                      ; 6F6A   0281 0354
        MVI     G_0355, R2                      ; 6F6C   0282 0355
L_6F6E:
        MVO@    R1,     R4                      ; 6F6E   0261
        MVO@    R2,     R4                      ; 6F6F   0262
        DECR    R0                              ; 6F70   0010
        BNEQ    L_6F6E                          ; 6F71   022C 0004
        MOVR    R5,     R7                      ; 6F73   00AF

L_6F74:
        MVII    #$0175, R4                      ; 6F74   02BC 0175
        SDBD                                    ; 6F76   0001
        MVI@    R4,     R0                      ; 6F77   02A0
        MVO     R0,     G_015F                  ; 6F78   0240 015F
        SWAP    R0,     1                       ; 6F7A   0040
        MVO     R0,     G_0160                  ; 6F7B   0240 0160
        MOVR    R5,     R7                      ; 6F7D   00AF

L_6F7E:
        PSHR    R5                              ; 6F7E   0275
        MVII    #$0006, R0                      ; 6F7F   02B8 0006
        MVII    #$0001, R1                      ; 6F81   02B9 0001
        MVII    #$01D3, R4                      ; 6F83   02BC 01D3

        JSR     R5,     X_FILL_MEM              ; 6F85   0004 0114 0341

        MVI     G_0354, R1                      ; 6F88   0281 0354
        MVI     G_0355, R2                      ; 6F8A   0282 0355
        SDBD                                    ; 6F8C   0001
        SUBI    #$0400, R1                      ; 6F8D   0339 0000 0004
        SDBD                                    ; 6F90   0001
        SUBI    #$0500, R2                      ; 6F91   033A 0000 0005
        MVII    #$0011, R0                      ; 6F94   02B8 0011

        JSR     R5,     X_RAND2                 ; 6F96   0004 0114 029E

        SWAP    R0,     1                       ; 6F99   0040
        ADDR    R0,     R1                      ; 6F9A   00C1
        MVII    #$0011, R0                      ; 6F9B   02B8 0011

        JSR     R5,     X_RAND2                 ; 6F9D   0004 0114 029E

        SWAP    R0,     1                       ; 6FA0   0040
        ADDR    R0,     R2                      ; 6FA1   00C2
        MVII    #$0342, R4                      ; 6FA2   02BC 0342
        MVII    #$0004, R0                      ; 6FA4   02B8 0004

        JSR     R5,     L_6F6E                  ; 6FA6   0004 016C 036E
        JSR     R5,     L_6DD9                  ; 6FA9   0004 016C 01D9

        PULR    R7                              ; 6FAC   02B7

L_6FAD:
        MVI     G_015E, R4                      ; 6FAD   0284 015E
        ADDR    R4,     R4                      ; 6FAF   00E4
        ADDI    #$0342, R4                      ; 6FB0   02FC 0342
        MVI@    R4,     R0                      ; 6FB2   02A0
        MVO     R0,     G_034C                  ; 6FB3   0240 034C
        MVI@    R4,     R0                      ; 6FB5   02A0
        MVO     R0,     G_034D                  ; 6FB6   0240 034D
        MOVR    R5,     R7                      ; 6FB8   00AF

L_6FB9:
        MVI@    R5,     R0                      ; 6FB9   02A8
        MVII    #$01C6, R1                      ; 6FBA   02B9 01C6
        MVO@    R0,     R1                      ; 6FBC   0248
        INCR    R1                              ; 6FBD   0009
        MVO@    R0,     R1                      ; 6FBE   0248
        MOVR    R5,     R7                      ; 6FBF   00AF

        CMPI    #$00B7, R1                      ; 6FC0   0379 00B7
        INCR    R4                              ; 6FC2   000C
        AND     G_004D, R4                      ; 6FC3   0384 004D
        DECR    R3                              ; 6FC5   0013
        DECR    R4                              ; 6FC6   0014
        INCR    R3                              ; 6FC7   000B
L_6FC8:
        DECR    R7                              ; 6FC8   0017

        NEGR    R1                              ; 6FC9   0021
        DIS                                     ; 6FCA   0003
        XOR@    R5,     R4                      ; 6FCB   03EC
        MVO@    R5,     R5                      ; 6FCC   026D
        COMR    R4                              ; 6FCD   001C
        SUB@    R1,     R0                      ; 6FCE   0308
        INCR    R3                              ; 6FCF   000B
        XORR    R5,     R3                      ; 6FD0   01EB
        INCR    R4                              ; 6FD1   000C
        AND     G_004D, R4                      ; 6FD2   0384 004D
        DECR    R3                              ; 6FD4   0013
        COMR    R4                              ; 6FD5   001C
        INCR    R3                              ; 6FD6   000B
L_6FD7:
        DECR    R7                              ; 6FD7   0017

        ADCR    R1                              ; 6FD8   0029
        DIS                                     ; 6FD9   0003
        XOR@    R5,     R4                      ; 6FDA   03EC
        ADD@    R1,     R7                      ; 6FDB   02CF

        XOR@    R1,     R1                      ; 6FDC   03C9
        INCR    R4                              ; 6FDD   000C
        SUBR    R5,     R4                      ; 6FDE   012C
        SWAP    R0,     1                       ; 6FDF   0040
        ADDR    R1,     R0                      ; 6FE0   00C8
        SLL     R0,     1                       ; 6FE1   0048
        ADDR    R2,     R4                      ; 6FE2   00D4
        TSTR    R3                              ; 6FE3   009B
        INCR    R3                              ; 6FE4   000B
        MOVR    R1,     R7                      ; 6FE5   008F

        COMR    R5                              ; 6FE6   001D
        RRC     R3,     2                       ; 6FE7   0077
        ADDR    R5,     R3                      ; 6FE8   00EB
        SAR     R3,     2                       ; 6FE9   006F
        ADD@    R1,     R7                      ; 6FEA   02CF

        MVI     G_01DC, R0                      ; 6FEB   0280 01DC
        CMPI    #$0002, R0                      ; 6FED   0378 0002
        BEQ     L_6FF5                          ; 6FEF   0204 0004

        SDBD                                    ; 6FF1   0001
        MVII    #$1ED9, R4                      ; 6FF2   02BC 00D9 001E
L_6FF5:
        PULR    R7                              ; 6FF5   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6FFE   0000 0000

        ORG     $D000
        DECLE   $0081,  $0000,  $0000,  $006A   ; D000   0081 0000 0000 006A
        DECLE   $003D,  $003F,  $0038,  $003F   ; D004   003D 003F 0038 003F

        RSWD    R0                              ; D008   0038
        ANDR    R1,     R6                      ; D009   018E
        ANDR    R1,     R6                      ; D00A   018E
        ANDR    R1,     R6                      ; D00B   018E
        ANDR    R1,     R6                      ; D00C   018E
        ANDR    R1,     R6                      ; D00D   018E
        ANDR    R1,     R6                      ; D00E   018E
        ANDR    R1,     R6                      ; D00F   018E
        ANDR    R1,     R6                      ; D010   018E
        ANDR    R1,     R6                      ; D011   018E
        XORI    #$03E0, R0                      ; D012   03F8 03E0
        MOVR    R2,     R7                      ; D014   0097
        MOVR    R4,     R7                      ; D015   00A7

        DECLE   $00B7                           ; D016   00B7

        ADDR    R0,     R7                      ; D017   00C7
        ADDR    R2,     R7                      ; D018   00D7
        MOVR    R4,     R7                      ; D019   00A7
        ADDR    R4,     R7                      ; D01A   00E7

        DECLE   $00F7                           ; D01B   00F7

        SUBR    R0,     R7                      ; D01C   0107
        SUBR    R2,     R7                      ; D01D   0117
        SUBR    R4,     R7                      ; D01E   0127

        DECLE   $0137                           ; D01F   0137

        XORI    #$03E0, R2                      ; D020   03FA 03E0
        XOR@    R6,     R2                      ; D022   03F2
        XOR@    R2,     R5                      ; D023   03D5
        RLC     R1,     2                       ; D024   0055
        XOR@    R6,     R6                      ; D025   03F6
        MOVR    R0,     R5                      ; D026   0085
        RRC     R3,     2                       ; D027   0077
        XORI    #$03E0, R1                      ; D028   03F9 03E0
        XOR@    R2,     R5                      ; D02A   03D5
        RLC     R1,     2                       ; D02B   0055
        SLR     R1,     2                       ; D02C   0065
        XORI    #$03D7, R0                      ; D02D   03F8 03D7
        XOR@    R4,     R0                      ; D02F   03E0
        XOR@    R6,     R4                      ; D030   03F4
        XOR@    R2,     R0                      ; D031   03D0
        XOR@    R6,     R2                      ; D032   03F2
        XOR@    R4,     R0                      ; D033   03E0
        XOR@    R2,     R5                      ; D034   03D5
        RLC     R1,     2                       ; D035   0055
        SLR     R1,     2                       ; D036   0065
        XORI    #$03D7, R2                      ; D037   03FA 03D7
        XOR@    R4,     R0                      ; D039   03E0
        XOR@    R6,     R4                      ; D03A   03F4
        XOR@    R2,     R0                      ; D03B   03D0
        XOR@    R2,     R5                      ; D03C   03D5
        RLC     R1,     2                       ; D03D   0055
        SLR     R1,     2                       ; D03E   0065
        XORI    #$03D7, R4                      ; D03F   03FC 03D7
        XOR@    R4,     R0                      ; D041   03E0
        XOR@    R6,     R4                      ; D042   03F4
        XOR@    R2,     R0                      ; D043   03D0
        XOR@    R2,     R5                      ; D044   03D5
        INCR    R7                              ; D045   000F

        DECLE   $001F                           ; D046   001F
L_D047:
        XORI    #$03D7, R4                      ; D047   03FC 03D7
        DECLE   $03E0,  $03F4,  $03D0,  $03D5   ; D049   03E0 03F4 03D0 03D5
        DECLE   $003F,  $002F                   ; D04D   003F 002F

        XORI    #$03D7, R4                      ; D04F   03FC 03D7
        XOR@    R4,     R0                      ; D051   03E0
        XOR@    R6,     R4                      ; D052   03F4
        XOR@    R2,     R0                      ; D053   03D0
        XOR@    R2,     R5                      ; D054   03D5
        SWAP    R1,     2                       ; D055   0045
        RRC     R1,     2                       ; D056   0075
        XORI    #$03D7, R4                      ; D057   03FC 03D7
        XOR@    R4,     R0                      ; D059   03E0
        XOR@    R6,     R4                      ; D05A   03F4
        XOR@    R2,     R0                      ; D05B   03D0
        XOR@    R6,     R2                      ; D05C   03F2
        XOR@    R4,     R0                      ; D05D   03E0
        XOR@    R2,     R5                      ; D05E   03D5
        SWAP    R1,     2                       ; D05F   0045
        RRC     R1,     2                       ; D060   0075
        XORI    #$03D7, R2                      ; D061   03FA 03D7
        XORI    #$03E0, R1                      ; D063   03F9 03E0
        XOR@    R2,     R5                      ; D065   03D5
        SWAP    R1,     2                       ; D066   0045
        RRC     R1,     2                       ; D067   0075
        XORI    #$03D7, R0                      ; D068   03F8 03D7
        XORI    #$03E0, R2                      ; D06A   03FA 03E0
        XOR@    R6,     R2                      ; D06C   03F2
        XOR@    R2,     R5                      ; D06D   03D5
        SWAP    R1,     2                       ; D06E   0045
        XOR@    R6,     R6                      ; D06F   03F6
        MOVR    R0,     R7                      ; D070   0087

        SLR     R3,     2                       ; D071   0067
        XORI    #$03E0, R0                      ; D072   03F8 03E0
        MOVR    R2,     R7                      ; D074   0097
        MOVR    R4,     R7                      ; D075   00A7

        DECLE   $00B7                           ; D076   00B7

        ADDR    R0,     R7                      ; D077   00C7
        ADDR    R2,     R7                      ; D078   00D7
        MOVR    R4,     R7                      ; D079   00A7
        ADDR    R4,     R7                      ; D07A   00E7

        DECLE   $00F7                           ; D07B   00F7

        SUBR    R0,     R7                      ; D07C   0107
        SUBR    R2,     R7                      ; D07D   0117
        SUBR    R4,     R7                      ; D07E   0127

        DECLE   $0137,  $0000,  $0013,  $0000   ; D07F   0137 0000 0013 0000
        DECLE   $0000,  $0000,  $0002,  $0000   ; D083   0000 0000 0002 0000
        DECLE   $0000,  $0001,  $0001,  $0000   ; D087   0000 0001 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D08B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D08F   0000 0000 0000 0000
        DECLE   $03C0,  $008D,  $00C0,  $0043   ; D093   03C0 008D 00C0 0043
        DECLE   $0031,  $0001,  $0060,  $005C   ; D097   0031 0001 0060 005C
        DECLE   $0056,  $001F,  $00AE,  $00BE   ; D09B   0056 001F 00AE 00BE
        DECLE   $0184,  $003E,  $018E,  $015E   ; D09F   0184 003E 018E 015E
        DECLE   $018A,  $018A,  $00EA,  $03FE   ; D0A3   018A 018A 00EA 03FE
        DECLE   $03E0,  $015A,  $011A,  $03FD   ; D0A7   03E0 015A 011A 03FD
        DECLE   $03E0,  $0124,  $01F4,  $0218   ; D0AB   03E0 0124 01F4 0218

        XOR@    R2,     R5                      ; D0AF   03D5
        BGT     L_D487                          ; D0B0   020E 03D5

        XOR@    R3,     R2                      ; D0B2   03DA
        XORI    #$03E0, R4                      ; D0B3   03FC 03E0
        SUBR    R4,     R4                      ; D0B5   0124
        ADDR    R5,     R6                      ; D0B6   00EE
        ADDR    R7,     R6                      ; D0B7   00FE
        XORR    R6,     R4                      ; D0B8   01F4
        XORR    R6,     R4                      ; D0B9   01F4
        XOR@    R2,     R5                      ; D0BA   03D5
        B       L_D1F7                          ; D0BB   0200 013A

        CMPR    R7,     R2                      ; D0BD   017A
        XORI    #$03E0, R3                      ; D0BE   03FB 03E0
        SUBR    R0,     R4                      ; D0C0   0104
        RSWD    R6                              ; D0C1   003E
        XOR@    R3,     R6                      ; D0C2   03DE
        ANDR    R3,     R6                      ; D0C3   019E
        XOR@    R2,     R5                      ; D0C4   03D5
        B       L_D221                          ; D0C5   0200 015A

        SUBR    R3,     R2                      ; D0C7   011A
        XORI    #$03E0, R4                      ; D0C8   03FC 03E0
        INCR    R2                              ; D0CA   000A
        XOR@    R6,     R2                      ; D0CB   03F2
        XOR@    R3,     R2                      ; D0CC   03DA
        SUBR    R5,     R2                      ; D0CD   012A
        COMR    R2                              ; D0CE   001A
        SAR     R2,     1                       ; D0CF   006A
        CMPR    R7,     R2                      ; D0D0   017A
        MOVR    R7,     R2                      ; D0D1   00BA
        SARC    R2,     1                       ; D0D2   007A
        ADD@    R6,     R7                      ; D0D3   02F7

L_D0D4:
        MVO@    R5,     R2                      ; D0D4   0255
        DECLE   $03F7,  $03E0,  $03D5,  $006A   ; D0D5   03F7 03E0 03D5 006A
        DECLE   $03F3,  $03DA,  $010A,  $03DA   ; D0D9   03F3 03DA 010A 03DA
        DECLE   $002A,  $03F2,  $03E0,  $005A   ; D0DD   002A 03F2 03E0 005A
        DECLE   $001A,  $03F4,  $03E0,  $016A   ; D0E1   001A 03F4 03E0 016A
        DECLE   $03F2,  $03E0,  $00EA,  $015A   ; D0E5   03F2 03E0 00EA 015A
        DECLE   $004A,  $003B,  $03F2,  $03DA   ; D0E9   004A 003B 03F2 03DA
        DECLE   $00AB,  $00CB,  $0135,  $03F3   ; D0ED   00AB 00CB 0135 03F3
        DECLE   $03E0,  $003A,  $007A,  $03E0   ; D0F1   03E0 003A 007A 03E0
        DECLE   $00FA,  $006A,  $012A,  $010A   ; D0F5   00FA 006A 012A 010A
        DECLE   $00AA,  $00CA,  $03D5,  $0115   ; D0F9   00AA 00CA 03D5 0115
        DECLE   $03F4,  $03D7,  $0155,  $03F5   ; D0FD   03F4 03D7 0155 03F5
        DECLE   $03E0,  $005A,  $007A,  $00DA   ; D101   03E0 005A 007A 00DA
        DECLE   $00CA,  $03E0,  $014A,  $03F4   ; D105   00CA 03E0 014A 03F4
        DECLE   $03E0,  $0015,  $03F4,  $03D7   ; D109   03E0 0015 03F4 03D7
        DECLE   $03F6,  $03E0,  $003A,  $03F9   ; D10D   03F6 03E0 003A 03F9
        DECLE   $03E0,  $0075,  $03F2,  $03D7   ; D111   03E0 0075 03F2 03D7
        DECLE   $0065,  $03FF,  $03E0,  $03F2   ; D115   0065 03FF 03E0 03F2
        DECLE   $03E0,  $01B7,  $0197,  $03FF   ; D119   03E0 01B7 0197 03FF
        DECLE   $03E0,  $03FD,  $03E0,  $0000   ; D11D   03E0 03FD 03E0 0000

        SAR     R3,     2                       ; D121   006F
        ADDR    R0,     R3                      ; D122   00C3
        MOVR    R0,     R3                      ; D123   0083
        MOVR    R1,     R7                      ; D124   008F
        INCR    R7                              ; D125   000F

        SLR     R3,     2                       ; D126   0067
L_D127:
        SWAP    R3,     1                       ; D127   0043
        DECLE   $0029,  $0049,  $0182,  $012D   ; D128   0029 0049 0182 012D
        DECLE   $0182,  $011D,  $018E,  $015D   ; D12C   0182 011D 018E 015D
        DECLE   $00B9,  $010D,  $00A9,  $03FF   ; D130   00B9 010D 00A9 03FF
        DECLE   $03E0,  $03F7                   ; D134   03E0 03F7

        XOR@    R4,     R0                      ; D136   03E0
        ADD@    R6,     R7                      ; D137   02F7

        DECLE   $0255,  $03FF,  $03E0,  $03FF   ; D138   0255 03FF 03E0 03FF
        DECLE   $03E0,  $03FF,  $03E0,  $03FC   ; D13C   03E0 03FF 03E0 03FC
        DECLE   $03E0,  $00E2,  $0082,  $0072   ; D140   03E0 00E2 0082 0072
        DECLE   $03E0,  $0002,  $0072,  $00E2   ; D144   03E0 0002 0072 00E2
        DECLE   $00F2,  $03FB,  $03E0,  $0002   ; D148   00F2 03FB 03E0 0002
        DECLE   $03F3,  $03D2,  $0102,  $03F4   ; D14C   03F3 03D2 0102 03F4
        DECLE   $03D2,  $0092,  $00F2,  $03F8   ; D150   03D2 0092 00F2 03F8
        DECLE   $03E0,  $0162,  $03FB,  $03D2   ; D154   03E0 0162 03FB 03D2
        DECLE   $0192,  $03F5,  $03E0,  $00E2   ; D158   0192 03F5 03E0 00E2
        DECLE   $0082,  $0169,  $03F4,  $03D2   ; D15C   0082 0169 03F4 03D2
        DECLE   $016D,  $03F2,  $03D2,  $00E9   ; D160   016D 03F2 03D2 00E9
        DECLE   $00F9,  $0169,  $0112,  $0157   ; D164   00F9 0169 0112 0157
        DECLE   $0177,  $00E2,  $0082,  $0092   ; D168   0177 00E2 0082 0092
        DECLE   $0082,  $0009,  $0109,  $03EC   ; D16C   0082 0009 0109 03EC
        DECLE   $0169,  $03F2,  $03D2,  $015D   ; D170   0169 03F2 03D2 015D
        DECLE   $03DE,  $019D,  $0009,  $03F3   ; D174   03DE 019D 0009 03F3
        DECLE   $03EC,  $0079,  $0102,  $00E9   ; D178   03EC 0079 0102 00E9
        DECLE   $0089,  $0109,  $0099,  $0089   ; D17C   0089 0109 0099 0089
        DECLE   $03F4,  $03EC,  $0109,  $0099   ; D180   03F4 03EC 0109 0099
        DECLE   $00F9,  $014D,  $00E9,  $03FF   ; D184   00F9 014D 00E9 03FF
        DECLE   $03EC,  $03FF,  $03EC,  $03FF   ; D188   03EC 03FF 03EC 03FF
        DECLE   $03EC,  $03F9,  $03EC,  $0000   ; D18C   03EC 03F9 03EC 0000

        RRC     R2,     2                       ; D190   0076
        TSTR    R3                              ; D191   009B
        ADDR    R4,     R3                      ; D192   00E3
        MOVR    R2,     R6                      ; D193   0096
        INCR    R7                              ; D194   000F

        RSWD    R0                              ; D195   0038
L_D196:
        RSWD    R3                              ; D196   003B
        DECLE   $0061,  $0049,  $00DA,  $014E   ; D197   0061 0049 00DA 014E
        DECLE   $0122,  $00D9,  $018F,  $0102   ; D19B   0122 00D9 018F 0102
        DECLE   $018A,  $010E,  $0185,  $03F7   ; D19F   018A 010E 0185 03F7
        DECLE   $03E0,  $003A,  $001A,  $03FA   ; D1A3   03E0 003A 001A 03FA
        DECLE   $03E0,  $03F8,  $03E0,  $03D5   ; D1A7   03E0 03F8 03E0 03D5
        DECLE   $003A,  $001A,  $03F9,  $03E0   ; D1AB   003A 001A 03F9 03E0
        DECLE   $03F7,  $03E0,  $03D5,  $0220   ; D1AF   03F7 03E0 03D5 0220
        DECLE   $03D5,  $003A,  $001A,  $03D5   ; D1B3   03D5 003A 001A 03D5
        DECLE   $03FF,  $03E0,  $03D5,  $0218   ; D1B7   03FF 03E0 03D5 0218
        DECLE   $03D5,  $003A,  $001A,  $03F7   ; D1BB   03D5 003A 001A 03F7

        XOR@    R4,     R0                      ; D1BF   03E0
        XORI    #$03E0, R2                      ; D1C0   03FA 03E0
        XOR@    R2,     R5                      ; D1C2   03D5
        ADDR    R4,     R7                      ; D1C3   00E7

        MOVR    R5,     R3                      ; D1C4   00AB
        XORI    #$03E0, R5                      ; D1C5   03FD 03E0
        XOR@    R6,     R3                      ; D1C7   03F3
        XOR@    R2,     R5                      ; D1C8   03D5
        ADDR    R4,     R7                      ; D1C9   00E7
        MOVR    R0,     R7                      ; D1CA   0087

        DECLE   $03D7,  $008B,  $03FC,  $03E0   ; D1CB   03D7 008B 03FC 03E0
        DECLE   $03D5,  $0157,  $0177,  $0007   ; D1CF   03D5 0157 0177 0007
        DECLE   $03F2,  $03D7,  $000B,  $002A   ; D1D3   03F2 03D7 000B 002A
        DECLE   $03FD,  $03E0,  $03D5,  $0115   ; D1D7   03FD 03E0 03D5 0115
        DECLE   $03F3,  $03D7                   ; D1DB   03F3 03D7

        SUBR    R3,     R2                      ; D1DD   011A
        ANDR    R1,     R6                      ; D1DE   018E
        CMPR    R4,     R2                      ; D1DF   0162
        XORI    #$03E0, R0                      ; D1E0   03F8 03E0
        ADD@    R6,     R7                      ; D1E2   02F7

        DECLE   $0255,  $03F3,  $03E0,  $03D5   ; D1E3   0255 03F3 03E0 03D5
        DECLE   $0037,  $03F2,  $03D7,  $0119   ; D1E7   0037 03F2 03D7 0119
        DECLE   $03DE,  $0142,  $03FE,  $03E0   ; D1EB   03DE 0142 03FE 03E0
        DECLE   $03D5,  $0037,  $03D7,  $03DA   ; D1EF   03D5 0037 03D7 03DA
        DECLE   $014E,  $03D5,  $03FF           ; D1F3   014E 03D5 03FF

        XOR@    R4,     R0                      ; D1F6   03E0
L_D1F7:
        XOR@    R2,     R5                      ; D1F7   03D5
        DECLE   $0037,  $003B,  $009A,  $00FA   ; D1F8   0037 003B 009A 00FA
        DECLE   $03FF,  $03E0,  $03F3,  $03E0   ; D1FC   03FF 03E0 03F3 03E0
        DECLE   $00DA,  $00BA,  $001A,  $03F6   ; D200   00DA 00BA 001A 03F6
        DECLE   $03E0,  $0000,  $0058,  $00A6   ; D204   03E0 0000 0058 00A6
        DECLE   $0023,  $0022,  $007B,  $005B   ; D208   0023 0022 007B 005B
        DECLE   $0040,  $0081,  $0019,  $004A   ; D20C   0040 0081 0019 004A
        DECLE   $015A,  $017A,  $000D,  $018E   ; D210   015A 017A 000D 018E
        DECLE   $013E,  $010D,  $00F9,  $00CA   ; D214   013E 010D 00F9 00CA
        DECLE   $03FF,  $03E0,  $03FF           ; D218   03FF 03E0 03FF

        XOR@    R4,     R0                      ; D21B   03E0
        XOR@    R6,     R3                      ; D21C   03F3
        XOR@    R4,     R0                      ; D21D   03E0
        ADDR    R5,     R2                      ; D21E   00EA
        MOVR    R1,     R2                      ; D21F   008A
        ANDR    R3,     R2                      ; D220   019A
L_D221:
        ANDR    R7,     R2                      ; D221   01BA
        DECLE   $001A,  $03FE,  $03E0,  $000A   ; D222   001A 03FE 03E0 000A
        DECLE   $0119,  $000D,  $03DE,  $017E   ; D226   0119 000D 03DE 017E
        DECLE   $013A,  $03FD,  $03E0,  $000A   ; D22A   013A 03FD 03E0 000A
        DECLE   $0129,  $0119,  $014D,  $0139   ; D22E   0129 0119 014D 0139
        DECLE   $010A,  $002A,  $03FD,  $03E0   ; D232   010A 002A 03FD 03E0
        DECLE   $03DA,  $0079,  $0039,  $0129   ; D236   03DA 0079 0039 0129
        DECLE   $03DA,  $002A,  $03FE,  $03E0   ; D23A   03DA 002A 03FE 03E0
        DECLE   $003A,  $03DA,  $0079,  $0069   ; D23E   003A 03DA 0079 0069
        DECLE   $002A,  $03FE,  $03E0,  $0167   ; D242   002A 03FE 03E0 0167
        DECLE   $03D5,  $003A,  $03DA,  $002A   ; D246   03D5 003A 03DA 002A
        DECLE   $03FF,  $03E0,  $0147,  $03FF   ; D24A   03FF 03E0 0147 03FF
        DECLE   $03E0,  $03FF,  $03E0,  $03FF   ; D24E   03E0 03FF 03E0 03FF
        DECLE   $03E0,  $03FF,  $03E0,  $03FF   ; D252   03E0 03FF 03E0 03FF

        XOR@    R4,     R0                      ; D256   03E0
        XORI    #$03E0, R0                      ; D257   03F8 03E0
        ADD@    R6,     R7                      ; D259   02F7

        DECLE   $0255,  $03F4,  $03E0,  $0000   ; D25A   0255 03F4 03E0 0000

        SLLC    R2,     1                       ; D25E   005A
        ADDR    R0,     R0                      ; D25F   00C0
        SLR     R3,     1                       ; D260   0063
        SAR     R1,     1                       ; D261   0069
        INCR    R7                              ; D262   000F

        RRC     R0,     2                       ; D263   0074
L_D264:
        RLC     R0,     1                       ; D264   0050
        DECLE   $003A,  $0039,  $0112,  $000D   ; D265   003A 0039 0112 000D
        DECLE   $013F,  $0185,  $018E,  $013F   ; D269   013F 0185 018E 013F

        ANDR    R0,     R5                      ; D26D   0185
        SUBR    R1,     R6                      ; D26E   010E
        INCR    R3                              ; D26F   000B
        XOR@    R6,     R2                      ; D270   03F2
        XOR@    R4,     R0                      ; D271   03E0
        ADD@    R6,     R7                      ; D272   02F7

        DECLE   $0255,  $03FF,  $03E0,  $03FF   ; D273   0255 03FF 03E0 03FF
        DECLE   $03E0,  $03FF,  $03E0,  $03FF   ; D277   03E0 03FF 03E0 03FF
        DECLE   $03E0,  $03FF,  $03E0,  $03F7   ; D27B   03E0 03FF 03E0 03F7
        DECLE   $03E0,  $0124,  $03FF           ; D27F   03E0 0124 03FF

        XOR@    R4,     R0                      ; D282   03E0
        XOR@    R6,     R3                      ; D283   03F3
        XOR@    R4,     R0                      ; D284   03E0
        CMPR    R2,     R2                      ; D285   0152
        INCR    R5                              ; D286   000D
        CMPR    R7,     R7                      ; D287   017F
        MOVR    R2,     R7                      ; D288   0097

        DECLE   $00F7,  $03FF                   ; D289   00F7 03FF

        XOR@    R4,     R0                      ; D28B   03E0
        B       L_D66C                          ; D28C   0200 03DE

        DECLE   $017F,  $03F2,  $03D7,  $0097   ; D28E   017F 03F2 03D7 0097
        DECLE   $00F7,  $03FE,  $03E0,  $014E   ; D292   00F7 03FE 03E0 014E
        DECLE   $000B,  $03F2,  $03DA,  $009B   ; D296   000B 03F2 03DA 009B
        DECLE   $00FB,  $0177,  $03FD,  $03E0   ; D29A   00FB 0177 03FD 03E0
        DECLE   $000A,  $03F5,  $03DA,  $001A   ; D29E   000A 03F5 03DA 001A
        DECLE   $0167,  $03FB,  $03E0,  $000A   ; D2A2   0167 03FB 03E0 000A
        DECLE   $03F7,  $03DA,  $0147,  $03FA   ; D2A6   03F7 03DA 0147 03FA
        DECLE   $03E0,  $006A,  $03F7,  $03DA   ; D2AA   03E0 006A 03F7 03DA
        DECLE   $002A,  $03FA,  $03E0,  $006A   ; D2AE   002A 03FA 03E0 006A
        DECLE   $03F7,  $03DA,  $004A,  $03F8   ; D2B2   03F7 03DA 004A 03F8
        DECLE   $03E0,  $0000,  $0075,  $00D5   ; D2B6   03E0 0000 0075 00D5
        DECLE   $00E3,  $0095,  $000F,  $0027   ; D2BA   00E3 0095 000F 0027
        DECLE   $0027,  $005C,  $0046,  $00D9   ; D2BE   0027 005C 0046 00D9
        DECLE   $004D,  $001E,  $00D9,  $018E   ; D2C2   004D 001E 00D9 018E
        DECLE   $002E,  $00DA,  $010E,  $00AA   ; D2C6   002E 00DA 010E 00AA
        DECLE   $03F4,  $03EC,  $001A,  $03FF   ; D2CA   03F4 03EC 001A 03FF

        XOR@    R4,     R0                      ; D2CE   03E0
        XOR@    R6,     R5                      ; D2CF   03F5
        XOR@    R5,     R4                      ; D2D0   03EC
        COMR    R2                              ; D2D1   001A
        XORI    #$03E0, R6                      ; D2D2   03FE 03E0
        XOR@    R6,     R2                      ; D2D4   03F2
        XOR@    R5,     R4                      ; D2D5   03EC
        SLL     R2,     1                       ; D2D6   004A
        ADDR    R3,     R2                      ; D2D7   00DA
        MOVR    R7,     R2                      ; D2D8   00BA
        ADCR    R2                              ; D2D9   002A
        XORI    #$03E0, R6                      ; D2DA   03FE 03E0
        XOR@    R6,     R2                      ; D2DC   03F2
        XOR@    R5,     R4                      ; D2DD   03EC
        XOR@    R2,     R5                      ; D2DE   03D5
        SETC                                    ; D2DF   0007
L_D2E0:
        DECR    R7                              ; D2E0   0017

        DECLE   $03D5,  $000A,  $03F2,  $03EC   ; D2E1   03D5 000A 03F2 03EC
        DECLE   $009A,  $00FA,  $03F9,  $03E0   ; D2E5   009A 00FA 03F9 03E0
        DECLE   $03F2,  $03EC,  $03D5,  $0037   ; D2E9   03F2 03EC 03D5 0037
        DECLE   $0027,  $006A,  $03F5,  $03EC   ; D2ED   0027 006A 03F5 03EC
        DECLE   $009A,  $00FA,  $03F7,  $03E0   ; D2F1   009A 00FA 03F7 03E0
        DECLE   $03F2,  $03EC,  $007A,  $03D5   ; D2F5   03F2 03EC 007A 03D5
        DECLE   $006A,  $03F8,  $03EC,  $001A   ; D2F9   006A 03F8 03EC 001A
        DECLE   $03F6,  $03E0,  $03FA,  $03EC   ; D2FD   03F6 03E0 03FA 03EC
        DECLE   $0129,  $03F3,  $03EC,  $03F6   ; D301   0129 03F3 03EC 03F6
        DECLE   $03E0,  $03F9,  $03EC,  $0119   ; D305   03E0 03F9 03EC 0119
        DECLE   $008D,  $001E,  $005A,  $002A   ; D309   008D 001E 005A 002A
        DECLE   $03F6,  $03E0,  $03F9,  $03EC   ; D30D   03F6 03E0 03F9 03EC
        DECLE   $0119,  $03DE,  $002E,  $03D5   ; D311   0119 03DE 002E 03D5
        DECLE   $03F7                           ; D315   03F7

        XOR@    R4,     R0                      ; D316   03E0
        XORI    #$03EC, R1                      ; D317   03F9 03EC
        SUBR    R3,     R2                      ; D319   011A
        CMPR    R1,     R6                      ; D31A   014E
        ADDR    R5,     R2                      ; D31B   00EA
        MOVR    R1,     R2                      ; D31C   008A
        COMR    R2                              ; D31D   001A
        XOR@    R6,     R6                      ; D31E   03F6
        XOR@    R4,     R0                      ; D31F   03E0
        XORI    #$03EC, R6                      ; D320   03FE 03EC
        XOR@    R6,     R3                      ; D322   03F3
        XOR@    R4,     R0                      ; D323   03E0
        ADD@    R6,     R7                      ; D324   02F7

        DECLE   $0255,  $03E0,  $03FD,  $03EC   ; D325   0255 03E0 03FD 03EC
        DECLE   $002A,  $03F6,  $03E0,  $0000   ; D329   002A 03F6 03E0 0000

        RRC     R3,     1                       ; D32D   0073
        MOVR    R2,     R1                      ; D32E   0091
        MOVR    R4,     R3                      ; D32F   00A3
        MOVR    R2,     R0                      ; D330   0090
        INCR    R5                              ; D331   000D
        RLC     R0,     2                       ; D332   0054
        ADCR    R0                              ; D333   0028
        GSWD    R3                              ; D334   0033
        SWAP    R2,     2                       ; D335   0046
        SUBR    R3,     R5                      ; D336   011D
        SLLC    R1,     2                       ; D337   005D
        MOVR    R7,     R5                      ; D338   00BD
        ADDR    R1,     R1                      ; D339   00C9
        SARC    R3,     2                       ; D33A   007F
        SAR     R3,     2                       ; D33B   006F
        RSWD    R2                              ; D33C   003A
        ADDR    R1,     R3                      ; D33D   00CB
        ADDR    R1,     R3                      ; D33E   00CB
        XOR@    R6,     R2                      ; D33F   03F2
        XOR@    R4,     R0                      ; D340   03E0
        SLLC    R2,     1                       ; D341   005A
L_D342:
        SARC    R2,     1                       ; D342   007A
        DECLE   $03FD,  $03E0,  $03F6,  $03E0   ; D343   03FD 03E0 03F6 03E0
        DECLE   $005A,  $007A,  $03FC,  $03E0   ; D347   005A 007A 03FC 03E0
        DECLE   $03F7                           ; D34B   03F7

        XOR@    R4,     R0                      ; D34C   03E0
        SLLC    R2,     1                       ; D34D   005A
        SARC    R2,     1                       ; D34E   007A
        XORI    #$03E0, R3                      ; D34F   03FB 03E0
        XORI    #$03E0, R0                      ; D351   03F8 03E0
        RSWD    R2                              ; D353   003A
        XOR@    R3,     R2                      ; D354   03DA
        COMR    R2                              ; D355   001A
        XOR@    R4,     R0                      ; D356   03E0
L_D357:
        CMPR    R4,     R7                      ; D357   0167
        DECLE   $03F2,  $03E0,  $000A,  $03FC   ; D358   03F2 03E0 000A 03FC
        DECLE   $03E0,  $000A,  $002A,  $003A   ; D35C   03E0 000A 002A 003A
        DECLE   $007A,  $0147,  $03E0,  $000A   ; D360   007A 0147 03E0 000A
        DECLE   $002A,  $03FB,  $03E0,  $000A   ; D364   002A 03FB 03E0 000A
        DECLE   $002A,  $0208,  $0217,  $003A   ; D368   002A 0208 0217 003A
        DECLE   $001A,  $000A,  $002A,  $03FB   ; D36C   001A 000A 002A 03FB
        DECLE   $03E0,  $000A,  $00A9,  $00B4   ; D370   03E0 000A 00A9 00B4
        DECLE   $03F3,  $03E0,  $003A,  $002A   ; D374   03F3 03E0 003A 002A
        DECLE   $03FC,  $03E0,  $0119,  $015D   ; D378   03FC 03E0 0119 015D
        DECLE   $009D,  $00FD,  $0012,  $0210   ; D37C   009D 00FD 0012 0210
        DECLE   $03FE,  $03E0,  $003A,  $0109   ; D380   03FE 03E0 003A 0109
        DECLE   $00BF,  $00AF,  $0109,  $03FF   ; D384   00BF 00AF 0109 03FF
        DECLE   $03E0,  $03E0,  $003A,  $03F2   ; D388   03E0 03E0 003A 03F2
        DECLE   $010B,  $002A,  $03FF,  $03E0   ; D38C   010B 002A 03FF 03E0
        DECLE   $03E0,  $000A,  $002A,  $03FF   ; D390   03E0 000A 002A 03FF

        XOR@    R4,     R0                      ; D394   03E0
        XOR@    R6,     R2                      ; D395   03F2
        XOR@    R4,     R0                      ; D396   03E0
        INCR    R2                              ; D397   000A
        ADCR    R2                              ; D398   002A
        XOR@    R6,     R6                      ; D399   03F6
        XOR@    R4,     R0                      ; D39A   03E0
        ADD@    R6,     R7                      ; D39B   02F7

        DECLE   $0255,  $03F7,  $03E0,  $0000   ; D39C   0255 03F7 03E0 0000

        SAR     R1,     1                       ; D3A0   0069
        TSTR    R5                              ; D3A1   00AD
        SWAP    R3,     1                       ; D3A2   0043
        RLC     R0,     2                       ; D3A3   0054
        INCR    R7                              ; D3A4   000F

        SWAP    R0,     2                       ; D3A5   0044
L_D3A6:
        SLR     R0,     1                       ; D3A6   0060
        DECLE   $0035,  $002D,  $00DA,  $000E   ; D3A7   0035 002D 00DA 000E
        DECLE   $001E,  $00D9,  $003D,  $00DD   ; D3AB   001E 00D9 003D 00DD
        DECLE   $018A,  $00C9,  $018A,  $03FF   ; D3AF   018A 00C9 018A 03FF
        DECLE   $03E0,  $03FF,  $03E0,  $03FC   ; D3B3   03E0 03FF 03E0 03FC
        DECLE   $03E0,  $000A,  $007A,  $005A   ; D3B7   03E0 000A 007A 005A
        DECLE   $03F3,  $03DA,  $001A,  $03FC   ; D3BB   03F3 03DA 001A 03FC
        DECLE   $03E0,  $000A,  $03F2,  $03DA   ; D3BF   03E0 000A 03F2 03DA
        DECLE   $007A,  $005A,  $012A,  $03F2   ; D3C3   007A 005A 012A 03F2
        DECLE   $03DA,  $001A,  $03FB,  $03E0   ; D3C7   03DA 001A 03FB 03E0
        DECLE   $03F3,  $03DA,  $011A,  $000E   ; D3CB   03F3 03DA 011A 000E
        DECLE   $001E,  $013A,  $03F2,  $03DA   ; D3CF   001E 013A 03F2 03DA
        DECLE   $001A,  $03FA,  $03E0,  $003A   ; D3D3   001A 03FA 03E0 003A
        DECLE   $03F2,  $03DA,  $0119,  $003D   ; D3D7   03F2 03DA 0119 003D
        DECLE   $011D,  $0139,  $03F3,  $03DA   ; D3DB   011D 0139 03F3 03DA
        DECLE   $001A,  $03FA,  $03E0,  $003A   ; D3DF   001A 03FA 03E0 003A
        DECLE   $03F2,  $03DA,  $0109,  $03F6   ; D3E3   03F2 03DA 0109 03F6
        DECLE   $03DA,  $03FB,  $03E0,  $003A   ; D3E7   03DA 03FB 03E0 003A
        DECLE   $03F8,  $03DA,  $03FC,  $03E0   ; D3EB   03F8 03DA 03FC 03E0
        DECLE   $003A,  $03F6,  $03DA,  $002A   ; D3EF   003A 03F6 03DA 002A
        DECLE   $03FD,  $03E0,  $003A,  $03F4   ; D3F3   03FD 03E0 003A 03F4
        DECLE   $03DA,  $002A,  $03FF,  $03E0   ; D3F7   03DA 002A 03FF 03E0
        DECLE   $03E0,  $0167,  $03FF,  $03E0   ; D3FB   03E0 0167 03FF 03E0
        DECLE   $03F4,  $03E0,  $0147,  $03F7   ; D3FF   03F4 03E0 0147 03F7

        XOR@    R4,     R0                      ; D403   03E0
        ADD@    R6,     R7                      ; D404   02F7

        DECLE   $0255,  $03F3,  $03E0,  $0000   ; D405   0255 03F3 03E0 0000

        MOVR    R2,     R0                      ; D409   0090
        ANDR    R6,     R1                      ; D40A   01B1
        TSTR    R4                              ; D40B   00A4
        MOVR    R1,     R6                      ; D40C   008E
        MOVR    R0,     R7                      ; D40D   0087

        DECLE   $009C,  $001F,  $001E,  $0046   ; D40E   009C 001F 001E 0046
        DECLE   $000F,  $001F,  $0187,  $003F   ; D412   000F 001F 0187 003F
        DECLE   $018F,  $0187,  $0037           ; D416   018F 0187 0037

        SUBR    R1,     R7                      ; D419   010F

        NEGR    R6                              ; D41A   0026
        XORI    #$03E0, R6                      ; D41B   03FE 03E0
        RSWD    R2                              ; D41D   003A
        XOR@    R6,     R3                      ; D41E   03F3
        XOR@    R5,     R4                      ; D41F   03EC
        ADCR    R2                              ; D420   002A
        XORI    #$03E0, R1                      ; D421   03F9 03E0
        ADDR    R4,     R2                      ; D423   00E2
        ADDR    R6,     R2                      ; D424   00F2
        ADDR    R4,     R7                      ; D425   00E7

        DECLE   $00F7                           ; D426   00F7

        XOR@    R6,     R3                      ; D427   03F3
        XOR@    R4,     R0                      ; D428   03E0
        SLLC    R2,     1                       ; D429   005A
        XOR@    R5,     R4                      ; D42A   03EC
        ADCR    R2                              ; D42B   002A
        XOR@    R6,     R3                      ; D42C   03F3
        XOR@    R4,     R0                      ; D42D   03E0
        ADD@    R6,     R7                      ; D42E   02F7

        DECLE   $0255,  $03F4,  $03E0,  $0002   ; D42F   0255 03F4 03E0 0002
        DECLE   $0043,  $03F3,  $03D7,  $0097   ; D433   0043 03F3 03D7 0097
        DECLE   $03F2,  $03D5,  $006A,  $004A   ; D437   03F2 03D5 006A 004A
        DECLE   $03D5,  $0167,  $03F7,  $03E0   ; D43B   03D5 0167 03F7 03E0
        DECLE   $0062,  $0043,  $03F4,  $03D7   ; D43F   0062 0043 03F4 03D7
        DECLE   $0027                           ; D443   0027

        XOR@    R2,     R5                      ; D444   03D5
        CMPR    R5,     R2                      ; D445   016A
        CMPR    R1,     R2                      ; D446   014A
        XOR@    R6,     R2                      ; D447   03F2
        XOR@    R2,     R5                      ; D448   03D5
        CMPR    R0,     R7                      ; D449   0147
        XOR@    R6,     R5                      ; D44A   03F5
        XOR@    R4,     R0                      ; D44B   03E0
        ADDR    R4,     R7                      ; D44C   00E7
        MOVR    R0,     R7                      ; D44D   0087

        DECLE   $0143,  $03F4,  $03D7,  $0047   ; D44E   0143 03F4 03D7 0047
        DECLE   $03D5,  $006A,  $03F2,  $03EC   ; D452   03D5 006A 03F2 03EC
        DECLE   $007A,  $03D5,  $03F5,  $03E0   ; D456   007A 03D5 03F5 03E0
        DECLE   $0062,  $0173,  $03F3,  $03D7   ; D45A   0062 0173 03F3 03D7
        DECLE   $00A7,  $00B7,  $0027,  $03D5   ; D45E   00A7 00B7 0027 03D5
        DECLE   $006A,  $03F5,  $03EC,  $010A   ; D462   006A 03F5 03EC 010A
        DECLE   $03EC,  $020E,  $0162,  $01B2   ; D466   03EC 020E 0162 01B2
        DECLE   $0043,  $03F2,  $03D7           ; D46A   0043 03F2 03D7

        MOVR    R4,     R7                      ; D46D   00A7
        ADDR    R0,     R7                      ; D46E   00C7

        DECLE   $03F3,  $03E0,  $006A,  $03F8   ; D46F   03F3 03E0 006A 03F8
        DECLE   $03EC,  $0062,  $0043,  $000F   ; D473   03EC 0062 0043 000F
        DECLE   $001F,  $03D7,  $000B,  $03FE   ; D477   001F 03D7 000B 03FE
        DECLE   $03EC,  $0052,  $0073,  $003F   ; D47B   03EC 0052 0073 003F
        DECLE   $03DE,  $03D7,  $03FF           ; D47F   03DE 03D7 03FF

        XOR@    R5,     R4                      ; D482   03EC
        B       L_D342                          ; D483   0220 0142

        DECLE   $0037                           ; D485   0037

        CMPR    R1,     R7                      ; D486   014F
L_D487:
        NEGR    R6                              ; D487   0026
        DECLE   $0139,  $03FE,  $03EC,  $03F3   ; D488   0139 03FE 03EC 03F3
        DECLE   $03E0,  $0152,  $0042,  $03D5   ; D48C   03E0 0152 0042 03D5
        DECLE   $005A,  $03FD,  $03EC,  $03F7   ; D490   005A 03FD 03EC 03F7
        DECLE   $03E0,  $003A,  $03FC,  $03EC   ; D494   03E0 003A 03FC 03EC
        DECLE   $0000                           ; D498   0000

        MOVR    R0,     R5                      ; D499   0085
        CMPR    R7,     R7                      ; D49A   017F
        TSTR    R4                              ; D49B   00A4
        SLR     R1,     2                       ; D49C   0065
        MOVR    R0,     R7                      ; D49D   0087

        RRC     R3,     1                       ; D49E   0073
L_D49F:
        DECR    R7                              ; D49F   0017

        COMR    R5                              ; D4A0   001D
        RSWD    R5                              ; D4A1   003D
        EIS                                     ; D4A2   0002
        CMPR    R2,     R2                      ; D4A3   0152
        SUBR    R4,     R7                      ; D4A4   0127

        SUBR    R0,     R2                      ; D4A5   0102
        INCR    R6                              ; D4A6   000E
        ADDR    R3,     R7                      ; D4A7   00DF

        ANDR    R0,     R5                      ; D4A8   0185
        RSWD    R6                              ; D4A9   003E
        ADCR    R7                              ; D4AA   002F

        XOR@    R6,     R4                      ; D4AB   03F4
L_D4AC:
        XOR@    R4,     R0                      ; D4AC   03E0
        ADD@    R6,     R7                      ; D4AD   02F7

        DECLE   $0255,  $03FF,  $03E0,  $03FB   ; D4AE   0255 03FF 03E0 03FB
        DECLE   $03E0,  $03D5,  $0187,  $03FF   ; D4B2   03E0 03D5 0187 03FF
        DECLE   $03E0,  $03F2,  $03E0,  $0230   ; D4B6   03E0 03F2 03E0 0230
        DECLE   $03D5,  $0147,  $03FF,  $03E0   ; D4BA   03D5 0147 03FF 03E0
        DECLE   $03F2,  $03E0,  $03F3,  $03D5   ; D4BE   03F2 03E0 03F3 03D5
        DECLE   $03FF,  $03E0,  $0210           ; D4C2   03FF 03E0 0210

        BGT     L_D0D4                          ; D4C5   022E 03F2

        XOR@    R2,     R5                      ; D4C7   03D5
        XORI    #$03E0, R0                      ; D4C8   03F8 03E0
        EIS                                     ; D4CA   0002
        ANDR    R2,     R2                      ; D4CB   0192
        CMPR    R4,     R7                      ; D4CC   0167
        B       L_D631                          ; D4CD   0200 0162

        DECLE   $03F2,  $03E0,  $0044,  $0192   ; D4CF   03F2 03E0 0044 0192
        DECLE   $03F3,  $03D5,  $03F7           ; D4D3   03F3 03D5 03F7

        XOR@    R4,     R0                      ; D4D6   03E0
        XORR    R6,     R4                      ; D4D7   01F4
        CMPR    R0,     R2                      ; D4D8   0142
        INCR    R6                              ; D4D9   000E
        SUBR    R3,     R7                      ; D4DA   011F

        RRC     R3,     2                       ; D4DB   0077
        RLC     R2,     1                       ; D4DC   0052
        ANDR    R2,     R2                      ; D4DD   0192
        SWAP    R0,     2                       ; D4DE   0044
        ADDR    R4,     R6                      ; D4DF   00E6
        MOVR    R0,     R7                      ; D4E0   0087
L_D4E1:
        DECR    R7                              ; D4E1   0017

        DECLE   $03F2,  $03D5,  $03F8,  $03E0   ; D4E2   03F2 03D5 03F8 03E0
        DECLE   $01E5,  $003E,  $002F,  $03D7   ; D4E6   01E5 003E 002F 03D7
L_D4EA:
        DECR    R7                              ; D4EA   0017

        DECLE   $0228,  $0006,  $03F2,  $03D7   ; D4EB   0228 0006 03F2 03D7
        DECLE   $0027,  $0114,  $0242,  $03F9   ; D4EF   0027 0114 0242 03F9
        DECLE   $03E0,  $01E5,  $0037,  $03F2   ; D4F3   03E0 01E5 0037 03F2
        DECLE   $03D7,  $0107,  $03F2,  $03D7   ; D4F7   03D7 0107 03F2 03D7
        DECLE   $0027                           ; D4FB   0027

        XOR@    R2,     R5                      ; D4FC   03D5
        XORR    R6,     R4                      ; D4FD   01F4
        XOR@    R2,     R5                      ; D4FE   03D5
        XORI    #$03E0, R2                      ; D4FF   03FA 03E0
        XORR    R4,     R5                      ; D501   01E5
        ADDR    R2,     R7                      ; D502   00D7

        DECLE   $00B7,  $03F2,  $03D7,  $0047   ; D503   00B7 03F2 03D7 0047
        DECLE   $01F4,  $0044,  $0192,  $01F4   ; D507   01F4 0044 0192 01F4
        DECLE   $03FB,  $03E0,  $03F2,  $01E5   ; D50B   03FB 03E0 03F2 01E5
        DECLE   $0037,  $0027,  $0044,  $0242   ; D50F   0037 0027 0044 0242
        DECLE   $0142,  $03FE,  $03E0,  $01E5   ; D513   0142 03FE 03E0 01E5
        DECLE   $01F4,  $0200,  $0142,  $01F4   ; D517   01F4 0200 0142 01F4
        DECLE   $03FA,  $03E0,  $0000           ; D51B   03FA 03E0 0000

        MOVR    R5,     R0                      ; D51E   00A8
        ANDR    R2,     R2                      ; D51F   0192
        ADDR    R4,     R4                      ; D520   00E4
        MOVR    R3,     R2                      ; D521   009A
        DECR    R0                              ; D522   0010
L_D523:
        DECR    R7                              ; D523   0017

        DECLE   $000C,  $0081,  $004C,  $0187   ; D524   000C 0081 004C 0187
        DECLE   $0143,  $00E6,  $017E,  $00CD   ; D528   0143 00E6 017E 00CD
        DECLE   $013D,  $0185,  $016E,  $0014   ; D52C   013D 0185 016E 0014
        DECLE   $03E0,  $01B7,  $0197           ; D530   03E0 01B7 0197

        ADDR    R4,     R7                      ; D533   00E7
        MOVR    R0,     R7                      ; D534   0087

        DECLE   $03F2,  $03D7                   ; D535   03F2 03D7
L_D537:
        DECR    R7                              ; D537   0017

        ADDR    R3,     R2                      ; D538   00DA
        MOVR    R7,     R2                      ; D539   00BA
        XOR@    R6,     R3                      ; D53A   03F3
        XOR@    R5,     R4                      ; D53B   03EC
        MOVR    R3,     R2                      ; D53C   009A
        ADDR    R7,     R2                      ; D53D   00FA
        XOR@    R6,     R6                      ; D53E   03F6
        XOR@    R4,     R0                      ; D53F   03E0
        ADDR    R4,     R7                      ; D540   00E7
        MOVR    R0,     R7                      ; D541   0087

        DECLE   $03F5,  $03D7                   ; D542   03F5 03D7

        RRC     R3,     2                       ; D544   0077
        SKIP                                    ; D545   0208
        SLLC    R2,     1                       ; D546   005A
        XOR@    R6,     R4                      ; D547   03F4
        XOR@    R5,     R4                      ; D548   03EC
        COMR    R2                              ; D549   001A
        XOR@    R6,     R4                      ; D54A   03F4
        XOR@    R4,     R0                      ; D54B   03E0
        SETC                                    ; D54C   0007
        XORI    #$03D7, R0                      ; D54D   03F8 03D7
L_D54F:
        DECR    R7                              ; D54F   0017

        DECLE   $006A,  $03F4,  $03EC,  $002A   ; D550   006A 03F4 03EC 002A
        DECLE   $03F4,  $03E0,  $0037,  $03F6   ; D554   03F4 03E0 0037 03F6
        DECLE   $03D7,  $0201,  $00EB,  $008B   ; D558   03D7 0201 00EB 008B
        DECLE   $03F3,  $03EC,  $00AA,  $00CA   ; D55C   03F3 03EC 00AA 00CA
        DECLE   $03F6,  $03E0,  $0057,  $03F3   ; D560   03F6 03E0 0057 03F3
        DECLE   $03D7                           ; D564   03D7

        BC      L_D652                          ; D565   0201 00EB

        MOVR    R1,     R3                      ; D567   008B
        XOR@    R6,     R3                      ; D568   03F3
        XOR@    R5,     R4                      ; D569   03EC
        MOVR    R5,     R3                      ; D56A   00AB
        ADDR    R1,     R3                      ; D56B   00CB
L_D56C:
        DECR    R7                              ; D56C   0017

        DECLE   $03F8,  $03E0,  $0037,  $03D7   ; D56D   03F8 03E0 0037 03D7
        DECLE   $00EB,  $008B,  $03F3,  $03EC   ; D571   00EB 008B 03F3 03EC
        DECLE   $00AB,  $00CB,  $00EB,  $00FB   ; D575   00AB 00CB 00EB 00FB
        DECLE   $03D7,  $0055,  $03F8,  $03E0   ; D579   03D7 0055 03F8 03E0
        DECLE   $000A,  $03F4,  $03EC,  $004B   ; D57D   000A 03F4 03EC 004B
        DECLE   $024B,  $000B,  $03EC,  $002B   ; D581   024B 000B 03EC 002B
        DECLE   $03F2,  $03D7,  $0035,  $03F6   ; D585   03F2 03D7 0035 03F6
        DECLE   $03E0,  $015A,  $03F5,  $03EC   ; D589   03E0 015A 03F5 03EC
        DECLE   $007B,  $006B,  $00AB,  $00CB   ; D58D   007B 006B 00AB 00CB
        DECLE   $03F3,  $03D7,  $0183,  $0126   ; D591   03F3 03D7 0183 0126
        DECLE   $0135,  $03F5,  $03E0,  $00DA   ; D595   0135 03F5 03E0 00DA
        DECLE   $00BA,  $03F5,  $03EC,  $00FB   ; D599   00BA 03F5 03EC 00FB
        DECLE   $03F3,  $03D7,  $01BF,  $010D   ; D59D   03F3 03D7 01BF 010D
        DECLE   $017D,  $0134,  $03F7           ; D5A1   017D 0134 03F7

        XOR@    R4,     R0                      ; D5A4   03E0
        ADDR    R3,     R2                      ; D5A5   00DA
        MOVR    R7,     R2                      ; D5A6   00BA
        XOR@    R6,     R4                      ; D5A7   03F4
        XOR@    R5,     R4                      ; D5A8   03EC
        TSTR    R3                              ; D5A9   009B
        ADDR    R7,     R3                      ; D5AA   00FB
        MOVR    R4,     R7                      ; D5AB   00A7
        ADDR    R0,     R7                      ; D5AC   00C7

        DECLE   $01AE,  $0014,  $0134,  $03F9   ; D5AD   01AE 0014 0134 03F9
        DECLE   $03E0,  $00DA,  $00BA,  $03F4   ; D5B1   03E0 00DA 00BA 03F4
        DECLE   $03EC,  $009A,  $00FA,  $03D5   ; D5B5   03EC 009A 00FA 03D5
        DECLE   $03F7                           ; D5B9   03F7

        XOR@    R4,     R0                      ; D5BA   03E0
        ADD@    R6,     R7                      ; D5BB   02F7

        DECLE   $0255,  $03F4,  $03E0,  $005A   ; D5BC   0255 03F4 03E0 005A
        DECLE   $03F5,  $03EC,  $001A,  $03F4   ; D5C0   03F5 03EC 001A 03F4
        DECLE   $03E0,  $0000,  $0081,  $0174   ; D5C4   03E0 0000 0081 0174
        DECLE   $0004,  $0036,  $0003,  $002C   ; D5C8   0004 0036 0003 002C
        DECLE   $0058,  $007D,  $0024,  $0069   ; D5CC   0058 007D 0024 0069
        DECLE   $0079,  $018A,  $000D,  $018E   ; D5D0   0079 018A 000D 018E
        DECLE   $001F,  $003D,  $002D,  $016D   ; D5D4   001F 003D 002D 016D
        DECLE   $03F7                           ; D5D8   03F7

        XOR@    R4,     R0                      ; D5D9   03E0
        XORI    #$03E0, R1                      ; D5DA   03F9 03E0
        ADD@    R6,     R7                      ; D5DC   02F7

        DECLE   $0255,  $03F9,  $03E0,  $03FF   ; D5DD   0255 03F9 03E0 03FF
        DECLE   $03E0,  $03FA,  $03E0,  $000A   ; D5E1   03E0 03FA 03E0 000A
        DECLE   $03EC,  $00A9,  $00B9,  $03F2   ; D5E5   03EC 00A9 00B9 03F2
        DECLE   $03EC,  $001A,  $03FD,  $03E0   ; D5E9   03EC 001A 03FD 03E0
        DECLE   $03EC,  $0049,  $000D,  $03DE   ; D5ED   03EC 0049 000D 03DE
        DECLE   $001F,  $005B,  $03EC,  $03FD   ; D5F1   001F 005B 03EC 03FD
        DECLE   $03E0,  $01DB,  $0033,  $003D   ; D5F5   03E0 01DB 0033 003D
        DECLE   $002D,  $01AD,  $03D7,  $03EC   ; D5F9   002D 01AD 03D7 03EC
        DECLE   $03FD,  $03E0,  $03EC,  $019B   ; D5FD   03FD 03E0 03EC 019B
        DECLE   $0096,  $0086,  $0106,  $006B   ; D601   0096 0086 0106 006B
        DECLE   $03EC,  $03FC,  $03E0,  $006A   ; D605   03EC 03FC 03E0 006A
        DECLE   $011B,  $0126,  $03F2,  $03D7   ; D609   011B 0126 03F2 03D7
        DECLE   $006B,  $03F2,  $03EC,  $03FA   ; D60D   006B 03F2 03EC 03FA
        DECLE   $03E0,  $03D5,  $022E,  $00BB   ; D611   03E0 03D5 022E 00BB
        DECLE   $03EC,  $0019,  $0036,  $006B   ; D615   03EC 0019 0036 006B
        DECLE   $03F3,  $03EC,  $03FA,  $03E0   ; D619   03F3 03EC 03FA 03E0
        DECLE   $03E0,  $0208,  $0137           ; D61D   03E0 0208 0137

        ADDR    R3,     R3                      ; D620   00DB
        MOVR    R7,     R3                      ; D621   00BB
        XOR@    R6,     R5                      ; D622   03F5
        XOR@    R5,     R4                      ; D623   03EC
        XOR@    R6,     R5                      ; D624   03F5
        XOR@    R4,     R0                      ; D625   03E0
        CMPR    R4,     R7                      ; D626   0167
        XOR@    R2,     R5                      ; D627   03D5
        SETC                                    ; D628   0007
        XORI    #$03D7, R0                      ; D629   03F8 03D7
        SLLC    R3,     1                       ; D62B   005B
        XOR@    R6,     R3                      ; D62C   03F3
        XOR@    R5,     R4                      ; D62D   03EC
        XOR@    R6,     R5                      ; D62E   03F5
        XOR@    R4,     R0                      ; D62F   03E0
        CMPR    R0,     R7                      ; D630   0147
L_D631:
        XOR@    R2,     R5                      ; D631   03D5
        DECLE   $0037,  $03F2,  $03D7,  $00EB   ; D632   0037 03F2 03D7 00EB
        DECLE   $03F3,  $01CB,  $00FB,  $03D7   ; D636   03F3 01CB 00FB 03D7
        DECLE   $006B,  $03F2,  $03EC,  $002A   ; D63A   006B 03F2 03EC 002A
        DECLE   $03F7,  $03E0,  $01BA,  $03FA   ; D63E   03F7 03E0 01BA 03FA
        DECLE   $03EC,  $002A,  $03F2,  $03E0   ; D642   03EC 002A 03F2 03E0
        DECLE   $0000,  $00AB,  $019F           ; D646   0000 00AB 019F

        SLR     R0,     2                       ; D649   0064
        RSWD    R6                              ; D64A   003E
        INCR    R7                              ; D64B   000F

        MOVR    R2,     R4                      ; D64C   0094
L_D64D:
        SLLC    R0,     1                       ; D64D   0058
        COMR    R5                              ; D64E   001D
        NEGR    R3                              ; D64F   0023
        INCR    R6                              ; D650   000E
        SLLC    R3,     2                       ; D651   005F
L_D652:
        RLC     R3,     2                       ; D652   0057
        DECLE   $016F,  $016F,  $0187,  $0097   ; D653   016F 016F 0187 0097
        DECLE   $0143,  $0187,  $03F3,  $03EC   ; D657   0143 0187 03F3 03EC
        DECLE   $0129,  $03FF                   ; D65B   0129 03FF

        XOR@    R5,     R4                      ; D65D   03EC
        XOR@    R6,     R3                      ; D65E   03F3
        XOR@    R5,     R4                      ; D65F   03EC
        ADCR    R1                              ; D660   0029
        SUBR    R4,     R2                      ; D661   0122
        ANDR    R0,     R4                      ; D662   0184
        CMPR    R1,     R1                      ; D663   0149
        SLLC    R1,     1                       ; D664   0059
        SUBR    R5,     R1                      ; D665   0129
        XORI    #$03EC, R5                      ; D666   03FD 03EC
        ADCR    R1                              ; D668   0029

        JSRD    R5,     L_5242                  ; D669   0004 0152 0242

L_D66C:
        SUBR    R6,     R2                      ; D66C   0132
        DECLE   $0042,  $0052,  $0139,  $03FB   ; D66D   0042 0052 0139 03FB
        DECLE   $03EC,  $0149,  $0004           ; D671   03EC 0149 0004

        INCR    R6                              ; D674   000E
        MOVR    R3,     R7                      ; D675   009F
        MOVR    R2,     R7                      ; D676   0097

        DECLE   $00F6,  $0012,  $0152,  $0039   ; D677   00F6 0012 0152 0039
        DECLE   $0129,  $03FA,  $03EC,  $0142   ; D67B   0129 03FA 03EC 0142
        DECLE   $0157,  $03F2,  $01AF,  $03F2   ; D67F   0157 03F2 01AF 03F2
        DECLE   $03D7,  $0076,  $0072,  $0142   ; D683   03D7 0076 0072 0142
        DECLE   $0052,  $01A9,  $0059,  $03F8   ; D687   0052 01A9 0059 03F8
        DECLE   $03EC,  $0200,  $0242,  $00D7   ; D68B   03EC 0200 0242 00D7
        DECLE   $0183,  $03F3,  $03D7,  $0076   ; D68F   0183 03F3 03D7 0076
        DECLE   $0192,  $01F4,  $0142,  $0052   ; D693   0192 01F4 0142 0052
        DECLE   $0039,  $03F7,  $03EC,  $03F2   ; D697   0039 03F7 03EC 03F2
        DECLE   $03E0,  $01F4,  $0032,  $0013   ; D69B   03E0 01F4 0032 0013
        DECLE   $03F4,  $03D7                   ; D69F   03F4 03D7
L_D6A1:
        DECR    R7                              ; D6A1   0017

        DECLE   $01F4,  $0228,  $0052,  $0059   ; D6A2   01F4 0228 0052 0059
        DECLE   $03DA,  $03F5,  $03EC,  $03F4   ; D6A6   03DA 03F5 03EC 03F4
        DECLE   $03E0,  $0142,  $0057,  $03F4   ; D6AA   03E0 0142 0057 03F4
        DECLE   $03D7                           ; D6AE   03D7
L_D6AF:
        DECR    R7                              ; D6AF   0017

        DECLE   $03F2,  $03E0,  $0132,  $0139   ; D6B0   03F2 03E0 0132 0139
        DECLE   $0049,  $0184,  $0059,  $03F2   ; D6B4   0049 0184 0059 03F2
        DECLE   $03EC,  $03F4,  $03E0,  $00E2   ; D6B8   03EC 03F4 03E0 00E2
        DECLE   $0242,  $0037,  $03F4,  $03D7   ; D6BC   0242 0037 03F4 03D7

        XOR@    R2,     R5                      ; D6C0   03D5
        ADDR    R4,     R2                      ; D6C1   00E2
        SAR     R1,     1                       ; D6C2   0069
        SUBR    R3,     R1                      ; D6C3   0119
        SWAP    R2,     1                       ; D6C4   0042
        B       L_D719                          ; D6C5   0200 0052

        ADDR    R3,     R1                      ; D6C7   00D9
        MOVR    R7,     R1                      ; D6C8   00B9
        XOR@    R6,     R4                      ; D6C9   03F4
        XOR@    R4,     R0                      ; D6CA   03E0
        ANDR    R4,     R2                      ; D6CB   01A2
        XOR@    R6,     R2                      ; D6CC   03F2
        XOR@    R4,     R0                      ; D6CD   03E0
        ADDR    R2,     R7                      ; D6CE   00D7

        DECLE   $00B7,  $03D7,  $0027,  $0152   ; D6CF   00B7 03D7 0027 0152
        DECLE   $01B9,  $03F2,  $03DA,  $017A   ; D6D3   01B9 03F2 03DA 017A
        DECLE   $03D5,  $0167,  $00D2,  $03D2   ; D6D7   03D5 0167 00D2 03D2
        DECLE   $0200,  $02F7,  $0255,  $03F8   ; D6DB   0200 02F7 0255 03F8
        DECLE   $03E0,  $0162,  $0132,  $0139   ; D6DF   03E0 0162 0132 0139
        DECLE   $0049,  $0172,  $03D5,  $01A7   ; D6E3   0049 0172 03D5 01A7
        DECLE   $0200,  $01A2,  $03FB,  $03E0   ; D6E7   0200 01A2 03FB 03E0
        DECLE   $0132,  $0069,  $0029,  $01B4   ; D6EB   0132 0069 0029 01B4
        DECLE   $03F5,  $03E0,  $0000,  $0086   ; D6EF   03F5 03E0 0000 0086
        DECLE   $01AC,  $00A4,  $00A2,  $0001   ; D6F3   01AC 00A4 00A2 0001
        DECLE   $0090,  $0013,  $001D,  $0055   ; D6F7   0090 0013 001D 0055
        DECLE   $0122,  $0007,  $0187,  $000D   ; D6FB   0122 0007 0187 000D
        DECLE   $001F,  $0187,  $003D,  $006F   ; D6FF   001F 0187 003D 006F
        DECLE   $0067,  $03F6,  $03E0,  $03FF   ; D703   0067 03F6 03E0 03FF
        DECLE   $03E0,  $03FF,  $03E0,  $01B7   ; D707   03E0 03FF 03E0 01B7
        DECLE   $0197                           ; D70B   0197

        XORI    #$03E0, R3                      ; D70C   03FB 03E0
        XOR@    R6,     R2                      ; D70E   03F2
        XORR    R4,     R5                      ; D70F   01E5
        EIS                                     ; D710   0002
        MVO     R2,     .BTAB.20                ; D711   0242 0220
        XOR@    R6,     R4                      ; D713   03F4
        XOR@    R2,     R5                      ; D714   03D5
        XORI    #$03E0, R2                      ; D715   03FA 03E0
        XOR@    R6,     R2                      ; D717   03F2
        XORR    R4,     R5                      ; D718   01E5
L_D719:
        CMPR    R2,     R2                      ; D719   0152
        NEGR    R2                              ; D71A   0022
        XOR@    R6,     R2                      ; D71B   03F2
        XOR@    R2,     R5                      ; D71C   03D5
        XORR    R6,     R4                      ; D71D   01F4
        XOR@    R6,     R2                      ; D71E   03F2
        XOR@    R2,     R5                      ; D71F   03D5
        XORI    #$03E0, R5                      ; D720   03FD 03E0
        ADDR    R4,     R7                      ; D722   00E7

        DECLE   $00F7                           ; D723   00F7

        ANDR    R6,     R2                      ; D724   01B2
        MVO     R2,     G_03F2                  ; D725   0242 03F2
        XOR@    R2,     R5                      ; D727   03D5
        XORI    #$03E0, R3                      ; D728   03FB 03E0
        ADDR    R4,     R7                      ; D72A   00E7

        DECLE   $00F7                           ; D72B   00F7

        SLR     R3,     2                       ; D72C   0067
        BC      L_D357                          ; D72D   0221 03D7
L_D72F:
        DECR    R7                              ; D72F   0017

        XOR@    R2,     R5                      ; D730   03D5
        XORR    R6,     R4                      ; D731   01F4
        XORI    #$03E0, R0                      ; D732   03F8 03E0
        ADDR    R4,     R2                      ; D734   00E2
        B       L_D72F                          ; D735   0220 0007

        DECLE   $0153,  $0243,  $01F6,  $03F3   ; D737   0153 0243 01F6 03F3
        DECLE   $03D7,  $0027,  $01F4,  $03D5   ; D73B   03D7 0027 01F4 03D5
        DECLE   $03F7                           ; D73F   03F7

        XOR@    R4,     R0                      ; D740   03E0
        CMPR    R2,     R2                      ; D741   0152
        NEGR    R2                              ; D742   0022
        ADDR    R4,     R7                      ; D743   00E7

        DECLE   $03F6,  $03D7,  $0027,  $03F2   ; D744   03F6 03D7 0027 03F2
        DECLE   $01E5,  $03F8,  $03E0,  $0162   ; D748   01E5 03F8 03E0 0162
        DECLE   $0007,  $03F4,  $03D7,  $0211   ; D74C   0007 03F4 03D7 0211

        MOVR    R4,     R7                      ; D750   00A7
        ADDR    R0,     R7                      ; D751   00C7

        DECLE   $03FA,  $03E0,  $0002,  $000D   ; D752   03FA 03E0 0002 000D
        DECLE   $001F,  $03F3,  $03D7,  $0221   ; D756   001F 03F3 03D7 0221
        DECLE   $0027                           ; D75A   0027

        XOR@    R6,     R2                      ; D75B   03F2
        XORR    R4,     R5                      ; D75C   01E5
        XORI    #$03E0, R2                      ; D75D   03FA 03E0
        GSWD    R2                              ; D75F   0032
        RSWD    R5                              ; D760   003D
        MOVR    R5,     R7                      ; D761   00AF
        MOVR    R4,     R7                      ; D762   00A7
        ADDR    R0,     R7                      ; D763   00C7
        ADDR    R2,     R7                      ; D764   00D7
        ADDR    R0,     R7                      ; D765   00C7

        DECLE   $03F2,  $01E5,  $03F7           ; D766   03F2 01E5 03F7

        XOR@    R4,     R0                      ; D769   03E0
        ADD@    R6,     R7                      ; D76A   02F7

        DECLE   $0255,  $03F3,  $03E0,  $01A2   ; D76B   0255 03F3 03E0 01A2
        DECLE   $03F2,  $03E0,  $03F2,  $01E5   ; D76F   03F2 03E0 03F2 01E5
        DECLE   $03E0,  $01E5,  $03FB,  $03E0   ; D773   03E0 01E5 03FB 03E0
        DECLE   $0000                           ; D777   0000

        MOVR    R3,     R6                      ; D778   009E
        ANDR    R7,     R6                      ; D779   01BE
        MOVR    R0,     R4                      ; D77A   0084
        MOVR    R6,     R5                      ; D77B   00B5
        INCR    R7                              ; D77C   000F

        MOVR    R3,     R4                      ; D77D   009C
L_D77E:
        RLC     R1,     1                       ; D77E   0051
        DECLE   $0018,  $0054,  $017E,  $005F   ; D77F   0018 0054 017E 005F
        DECLE   $0187,  $011E,  $002F,  $0027   ; D783   0187 011E 002F 0027

        ANDR    R0,     R5                      ; D787   0185
        SUBR    R0,     R7                      ; D788   0107

        MOVR    R5,     R2                      ; D789   00AA
        COMR    R2                              ; D78A   001A
        XOR@    R6,     R6                      ; D78B   03F6
        XOR@    R4,     R0                      ; D78C   03E0
        ADD@    R6,     R7                      ; D78D   02F7

        DECLE   $0255,  $03FB,  $03E0,  $003A   ; D78E   0255 03FB 03E0 003A
        DECLE   $010A,  $012A,  $001A,  $03FA   ; D792   010A 012A 001A 03FA
        DECLE   $03E0,  $008A,  $03F8,  $03E0   ; D796   03E0 008A 03F8 03E0
        DECLE   $005A,  $001A,  $03F7           ; D79A   005A 001A 03F7

        XOR@    R4,     R0                      ; D79D   03E0
        INCR    R2                              ; D79E   000A
        CMPR    R7,     R2                      ; D79F   017A
        ANDR    R5,     R2                      ; D7A0   01AA
        XORI    #$03E0, R1                      ; D7A1   03F9 03E0
        RSWD    R2                              ; D7A3   003A
        SARC    R2,     1                       ; D7A4   007A
        ADDR    R5,     R2                      ; D7A5   00EA
        CMPR    R7,     R2                      ; D7A6   017A
        CMPR    R5,     R2                      ; D7A7   016A
        XOR@    R6,     R2                      ; D7A8   03F2
        XOR@    R4,     R0                      ; D7A9   03E0
        SAR     R2,     1                       ; D7AA   006A
        SLL     R2,     1                       ; D7AB   004A
        XORI    #$03E0, R4                      ; D7AC   03FC 03E0
        ADDR    R3,     R2                      ; D7AE   00DA
        ADDR    R1,     R2                      ; D7AF   00CA
        SKIP                                    ; D7B0   0208
        MOVR    R7,     R2                      ; D7B1   00BA
        SARC    R2,     1                       ; D7B2   007A
        INCR    R2                              ; D7B3   000A
        SLL     R2,     1                       ; D7B4   004A
        XORI    #$03E0, R6                      ; D7B5   03FE 03E0
        ADDR    R4,     R7                      ; D7B7   00E7

        DECLE   $01C7,  $00F7,  $003A,  $03EC   ; D7B8   01C7 00F7 003A 03EC
        DECLE   $007A,  $03FC,  $03E0,  $0007   ; D7BC   007A 03FC 03E0 0007
        DECLE   $0211,  $03F3,  $03D7           ; D7C0   0211 03F3 03D7
L_D7C3:
        DECR    R7                              ; D7C3   0017

        SLLC    R2,     1                       ; D7C4   005A
        XOR@    R5,     R4                      ; D7C5   03EC
        COMR    R2                              ; D7C6   001A
        XORI    #$03E0, R1                      ; D7C7   03F9 03E0
        ADDR    R4,     R7                      ; D7C9   00E7
        MOVR    R0,     R7                      ; D7CA   0087

        DECLE   $03F5,  $03D7,  $0027,  $006A   ; D7CB   03F5 03D7 0027 006A
        DECLE   $03EC,  $03EC,  $00FA,  $03F7   ; D7CF   03EC 03EC 00FA 03F7
        DECLE   $03E0,  $0157,  $03F5,  $03D7   ; D7D3   03E0 0157 03F5 03D7
        DECLE   $0027                           ; D7D7   0027

        MVO     R2,     G_006A                  ; D7D8   0242 006A
        XOR@    R6,     R4                      ; D7DA   03F4
        XOR@    R5,     R4                      ; D7DB   03EC
        CMPR    R7,     R2                      ; D7DC   017A
        XOR@    R6,     R3                      ; D7DD   03F3
        XOR@    R2,     R5                      ; D7DE   03D5
        CMPR    R4,     R7                      ; D7DF   0167
        XOR@    R6,     R2                      ; D7E0   03F2
        XOR@    R4,     R0                      ; D7E1   03E0
        ANDR    R7,     R6                      ; D7E2   01BE
        MOVR    R3,     R7                      ; D7E3   009F

        DECLE   $03D7,  $0047,  $01B2,  $0242   ; D7E4   03D7 0047 01B2 0242
        DECLE   $0242,  $0200,  $03F5,  $03EC   ; D7E8   0242 0200 03F5 03EC
        DECLE   $00FA,  $03F3,  $03D5,  $01A7   ; D7EC   00FA 03F3 03D5 01A7
        DECLE   $03F2,  $03E0,  $015E,  $002F   ; D7F0   03F2 03E0 015E 002F
        DECLE   $0027,  $0208,  $016A,  $01F4   ; D7F4   0027 0208 016A 01F4
        DECLE   $0227,  $006A,  $03F3,  $03EC   ; D7F8   0227 006A 03F3 03EC
        DECLE   $012A,  $03F2,  $03EC,  $009A   ; D7FC   012A 03F2 03EC 009A
        DECLE   $008A,  $009A,  $00FA,  $03D5   ; D800   008A 009A 00FA 03D5
        DECLE   $03F2,  $03E0,  $0147,  $00EA   ; D804   03F2 03E0 0147 00EA
        DECLE   $008A,  $03EC,  $009A,  $008A   ; D808   008A 03EC 009A 008A
        DECLE   $03F2,  $03EC,  $00AA,  $00CA   ; D80C   03F2 03EC 00AA 00CA
        DECLE   $03D5,  $005A,  $03F5,  $03EC   ; D810   03D5 005A 03F5 03EC
        DECLE   $010A,  $0000                   ; D814   010A 0000

        MOVR    R1,     R6                      ; D816   008E
        XORR    R2,     R1                      ; D817   01D1
        NEGR    R4                              ; D818   0024
        MOVR    R1,     R0                      ; D819   0088
        TSTR    R0                              ; D81A   0080
        INCR    R7                              ; D81B   000F

        SWAP    R0,     2                       ; D81C   0044
L_D81D:
        MOVR    R1,     R6                      ; D81D   008E
        DECLE   $003D,  $000F,  $001F,  $0187   ; D81E   003D 000F 001F 0187
        DECLE   $003F,  $006F,  $0187,  $0097   ; D822   003F 006F 0187 0097
        DECLE   $0077,  $0027,  $03F4,  $03E0   ; D826   0077 0027 03F4 03E0
        DECLE   $0124,  $03FF,  $03E0,  $03F3   ; D82A   0124 03FF 03E0 03F3
        DECLE   $03E0,  $0044,  $03D2,  $0072   ; D82E   03E0 0044 03D2 0072
        DECLE   $0007,  $03F6,  $03D7,  $00EB   ; D832   0007 03F6 03D7 00EB
        DECLE   $008B,  $03DA,  $001A,  $03F6   ; D836   008B 03DA 001A 03F6
        DECLE   $03E0,  $0076,  $03F2,  $03D2   ; D83A   03E0 0076 03F2 03D2
        DECLE   $0073,  $03F5,  $03D7,  $000B   ; D83E   0073 03F5 03D7 000B
        DECLE   $03F4,  $03DA,  $03F5,  $03E0   ; D842   03F4 03DA 03F5 03E0
        DECLE   $0025,  $03D7,  $0076,  $03F2   ; D846   0025 03D7 0076 03F2
        DECLE   $03D2,  $0073,  $03F4,  $03D7   ; D84A   03D2 0073 03F4 03D7
        DECLE   $03F4,  $03DA,  $002A,  $03F4   ; D84E   03F4 03DA 002A 03F4
        DECLE   $03E0,  $0025,  $03F3,  $03D7   ; D852   03E0 0025 03F3 03D7

        DECR    R6                              ; D856   0016
        XOR@    R6,     R2                      ; D857   03F2
        XOR@    R2,     R2                      ; D858   03D2
        DECR    R3                              ; D859   0013
        MOVR    R4,     R7                      ; D85A   00A7

        DECLE   $00B7,  $006B,  $03F3,  $03DA   ; D85B   00B7 006B 03F3 03DA
        DECLE   $0029,  $0134,  $03F4,  $03E0   ; D85F   0029 0134 03F4 03E0
        DECLE   $03F5,  $03D7,  $00F6,  $03D2   ; D863   03F5 03D7 00F6 03D2
        DECLE   $0022,  $03F2,  $03E0,  $003A   ; D867   0022 03F2 03E0 003A
        DECLE   $03F2,  $03DA,  $0029,  $0006   ; D86B   03F2 03DA 0029 0006
        DECLE   $03F2,  $03D7                   ; D86F   03F2 03D7
L_D871:
        DECR    R7                              ; D871   0017

        DECLE   $03F2,  $03E0,  $0015,  $03F4   ; D872   03F2 03E0 0015 03F4
        DECLE   $03D7,  $0047,  $03F5,  $03E0   ; D876   03D7 0047 03F5 03E0
        DECLE   $003A,  $0029,  $0043,  $03D7   ; D87A   003A 0029 0043 03D7
        DECLE   $000F,  $001F,  $03D7,  $03E0   ; D87E   000F 001F 03D7 03E0
        DECLE   $0115,  $0135,  $0015,  $03D7   ; D882   0115 0135 0015 03D7

        MOVR    R4,     R7                      ; D886   00A7
        ADDR    R0,     R7                      ; D887   00C7

        DECLE   $03F7                           ; D888   03F7

        XOR@    R4,     R0                      ; D889   03E0
        SUBR    R0,     R4                      ; D88A   0104
        ADDR    R2,     R7                      ; D88B   00D7

        DECLE   $00B7,  $003F,  $00AF,  $03D7   ; D88C   00B7 003F 00AF 03D7

        XORI    #$03E0, R5                      ; D890   03FD 03E0
        XOR@    R6,     R4                      ; D892   03F4
        XOR@    R4,     R0                      ; D893   03E0
        ADDR    R2,     R7                      ; D894   00D7

        DECLE   $00B7,  $0027,  $03FF,  $03E0   ; D895   00B7 0027 03FF 03E0
        DECLE   $03FF,  $03E0,  $03FF           ; D899   03FF 03E0 03FF

        XOR@    R4,     R0                      ; D89C   03E0
        XORI    #$03E0, R4                      ; D89D   03FC 03E0
        ADD@    R6,     R7                      ; D89F   02F7

        DECLE   $0255,  $03F2,  $03E0,  $0000   ; D8A0   0255 03F2 03E0 0000

        MOVR    R2,     R6                      ; D8A4   0096
        ANDR    R7,     R0                      ; D8A5   01B8
        ADDR    R4,     R4                      ; D8A6   00E4
        MOVR    R6,     R0                      ; D8A7   00B0
        INCR    R7                              ; D8A8   000F

        COMR    R0                              ; D8A9   0018
L_D8AA:
        DECR    R4                              ; D8AA   0014
        DECLE   $0090,  $0053,  $0187           ; D8AB   0090 0053 0187
L_D8AE:
        DECR    R7                              ; D8AE   0017

        ANDR    R0,     R5                      ; D8AF   0185
        CMPR    R7,     R7                      ; D8B0   017F
        SLLC    R1,     2                       ; D8B1   005D
        DECR    R2                              ; D8B2   0012
        CMPR    R6,     R3                      ; D8B3   0173
L_D8B4:
        CMPR    R5,     R5                      ; D8B4   016D
        NEGR    R2                              ; D8B5   0022
        XORI    #$03E0, R1                      ; D8B6   03F9 03E0
        ADD@    R6,     R7                      ; D8B8   02F7

        DECLE   $0255,  $03FA,  $03E0,  $01B7   ; D8B9   0255 03FA 03E0 01B7
        DECLE   $0197,  $0208,  $03FF           ; D8BD   0197 0208 03FF

        XOR@    R4,     R0                      ; D8C0   03E0
        XOR@    R6,     R2                      ; D8C1   03F2
        XOR@    R4,     R0                      ; D8C2   03E0
        BUSC    L_DC9A                          ; D8C3   0207 03D5
        ADDR    R4,     R7                      ; D8C5   00E7

        DECLE   $00F7                           ; D8C6   00F7

        B       L_DAF7                          ; D8C7   0200 022E

        XORI    #$03E0, R6                      ; D8C9   03FE 03E0
        XOR@    R2,     R5                      ; D8CB   03D5
        MOVR    R0,     R7                      ; D8CC   0087

        DECLE   $03F2,  $03D7,  $0097,  $00F7   ; D8CD   03F2 03D7 0097 00F7
        DECLE   $0237,  $0210,  $03FC,  $03E0   ; D8D1   0237 0210 03FC 03E0
        DECLE   $01B7,  $03F5,  $03D7,  $0097   ; D8D5   01B7 03F5 03D7 0097
        DECLE   $00F7                           ; D8D9   00F7

        SUBR    R4,     R4                      ; D8DA   0124
        XOR@    R6,     R2                      ; D8DB   03F2
        XOR@    R4,     R0                      ; D8DC   03E0
        TSTR    R4                              ; D8DD   00A4
        MOVR    R6,     R4                      ; D8DE   00B4
        XOR@    R6,     R6                      ; D8DF   03F6
        XOR@    R4,     R0                      ; D8E0   03E0
        MOVR    R3,     R2                      ; D8E1   009A
        ADDR    R7,     R2                      ; D8E2   00FA
        ADDR    R2,     R7                      ; D8E3   00D7

        DECLE   $00B7,  $03F5,  $03D7           ; D8E4   00B7 03F5 03D7

        MOVR    R2,     R6                      ; D8E7   0096
        ADDR    R6,     R6                      ; D8E8   00F6
        ADDR    R4,     R6                      ; D8E9   00E6
        MOVR    R0,     R6                      ; D8EA   0086
        DECR    R6                              ; D8EB   0016
        SUBR    R6,     R4                      ; D8EC   0134
        XOR@    R6,     R5                      ; D8ED   03F5
        XOR@    R4,     R0                      ; D8EE   03E0
        XOR@    R6,     R2                      ; D8EF   03F2
        XOR@    R5,     R4                      ; D8F0   03EC
        MOVR    R3,     R2                      ; D8F1   009A
        ADDR    R7,     R2                      ; D8F2   00FA
        ADDR    R2,     R7                      ; D8F3   00D7

        DECLE   $00B7                           ; D8F4   00B7

        XORI    #$03D7, R0                      ; D8F5   03F8 03D7
        MOVR    R2,     R7                      ; D8F7   0097

        DECLE   $00F7                           ; D8F8   00F7

        XOR@    R6,     R4                      ; D8F9   03F4
        XOR@    R4,     R0                      ; D8FA   03E0
        XOR@    R6,     R4                      ; D8FB   03F4
        XOR@    R5,     R4                      ; D8FC   03EC
        MOVR    R3,     R2                      ; D8FD   009A
        ADDR    R7,     R2                      ; D8FE   00FA
        ADDR    R2,     R7                      ; D8FF   00D7

        DECLE   $00B7                           ; D900   00B7

        MOVR    R4,     R7                      ; D901   00A7
        ADDR    R0,     R7                      ; D902   00C7
        ADDR    R2,     R7                      ; D903   00D7

        DECLE   $00B7,  $03F4,  $03D7           ; D904   00B7 03F4 03D7
L_D907:
        DECR    R7                              ; D907   0017

        XOR@    R6,     R3                      ; D908   03F3
        XOR@    R4,     R0                      ; D909   03E0
        XOR@    R6,     R6                      ; D90A   03F6
        XOR@    R5,     R4                      ; D90B   03EC
        SUBR    R1,     R2                      ; D90C   010A
        MOVR    R3,     R2                      ; D90D   009A
        MOVR    R1,     R2                      ; D90E   008A
        MOVR    R3,     R2                      ; D90F   009A
        MOVR    R1,     R2                      ; D910   008A
        ANDR    R3,     R2                      ; D911   019A
        ADDR    R2,     R7                      ; D912   00D7

        DECLE   $00B7,  $03F3,  $03D7           ; D913   00B7 03F3 03D7
L_D916:
        DECR    R7                              ; D916   0017

        DECLE   $03F2,  $03E0,  $03F9,  $03EC   ; D917   03F2 03E0 03F9 03EC
        DECLE   $00AA,  $00CA,  $0227,  $03F2   ; D91B   00AA 00CA 0227 03F2
        DECLE   $0242,  $00D7,  $03D7,  $01BF   ; D91F   0242 00D7 03D7 01BF
        DECLE   $009D,  $0012,  $0200,  $03F8   ; D923   009D 0012 0200 03F8
        DECLE   $03EC,  $011A,  $03F6,  $03E0   ; D927   03EC 011A 03F6 03E0
        DECLE   $0037                           ; D92B   0037

        ANDR    R6,     R3                      ; D92C   01B3
        ANDR    R5,     R5                      ; D92D   01AD
        NEGR    R2                              ; D92E   0022
        B       L_DD2A                          ; D92F   0200 03F9

        DECLE   $03EC,  $009A,  $03F6,  $03E0   ; D931   03EC 009A 03F6 03E0
        DECLE   $0218,  $022E,  $0237,  $03E0   ; D935   0218 022E 0237 03E0
        DECLE   $0000,  $0063,  $0146,  $0004   ; D939   0000 0063 0146 0004
        DECLE   $005F,  $0001,  $002C,  $0047   ; D93D   005F 0001 002C 0047
        DECLE   $008C,  $0034,  $0002,  $0152   ; D941   008C 0034 0002 0152
        DECLE   $0122,  $017D,  $018E,  $001D   ; D945   0122 017D 018E 001D
        DECLE   $0163,  $003F,  $002D,  $03F5   ; D949   0163 003F 002D 03F5
        DECLE   $03E0,  $03FF,  $03E0,  $03F5   ; D94D   03E0 03FF 03E0 03F5
        DECLE   $03E0,  $03FF,  $03E0,  $03F5   ; D951   03E0 03FF 03E0 03F5
        DECLE   $03E0,  $03FF,  $03E0,  $03F5   ; D955   03E0 03FF 03E0 03F5
        DECLE   $03E0,  $03FF,  $03E0,  $03FF   ; D959   03E0 03FF 03E0 03FF
        DECLE   $03E0,  $0002,  $0192,  $0162   ; D95D   03E0 0002 0192 0162
        DECLE   $03F7,  $03E0,  $03F9,  $03E0   ; D961   03F7 03E0 03F9 03E0
        DECLE   $0002,  $01BD,  $03DE,  $001D   ; D965   0002 01BD 03DE 001D
        DECLE   $0172,  $03F9,  $03E0,  $03D5   ; D969   0172 03F9 03E0 03D5
        DECLE   $0007,  $03F2,  $03D7,  $0097   ; D96D   0007 03F2 03D7 0097
        DECLE   $00F7,  $03F2,  $01A3,  $003F   ; D971   00F7 03F2 01A3 003F
        DECLE   $002D,  $0172,  $03F5,  $03E0   ; D975   002D 0172 03F5 03E0
        DECLE   $0167,  $03F4,  $03D5,  $0037   ; D979   0167 03F4 03D5 0037
        DECLE   $03F5,  $03D7                   ; D97D   03F5 03D7

        ANDR    R6,     R3                      ; D97F   01B3
        SUBR    R0,     R3                      ; D980   0103
        NEGR    R2                              ; D981   0022
        XOR@    R6,     R6                      ; D982   03F6
        XOR@    R4,     R0                      ; D983   03E0
        CMPR    R0,     R7                      ; D984   0147
        XOR@    R6,     R5                      ; D985   03F5
        XOR@    R2,     R5                      ; D986   03D5
        ADDR    R2,     R7                      ; D987   00D7

        DECLE   $00B7,  $03F3,  $03D7,  $0027   ; D988   00B7 03F3 03D7 0027
        DECLE   $03FF,  $03E0,  $0210,  $00D7   ; D98C   03FF 03E0 0210 00D7
        DECLE   $01D7,  $00C7,  $03FF           ; D990   01D7 00C7 03FF

        XOR@    R4,     R0                      ; D993   03E0
        XOR@    R6,     R6                      ; D994   03F6
L_D995:
        XOR@    R4,     R0                      ; D995   03E0
        ADD@    R6,     R7                      ; D996   02F7

        DECLE   $0255,  $03FE,  $03E0,  $03F8   ; D997   0255 03FE 03E0 03F8
        DECLE   $03E0,  $0000,  $0094,  $01D3   ; D99B   03E0 0000 0094 01D3
        DECLE   $00A4,  $00A2,  $0003,  $0093   ; D99F   00A4 00A2 0003 0093
        DECLE   $0018,  $001D,  $0055,  $0122   ; D9A3   0018 001D 0055 0122
        DECLE   $0007,  $0187,  $000D,  $001F   ; D9A7   0007 0187 000D 001F
        DECLE   $0187                           ; D9AB   0187

        RSWD    R5                              ; D9AC   003D
        SAR     R2,     2                       ; D9AD   006E
        RRC     R3,     2                       ; D9AE   0077
        XORI    #$03E0, R2                      ; D9AF   03FA 03E0
        ADD@    R6,     R7                      ; D9B1   02F7

        DECLE   $0255,  $03F4,  $03E0,  $006A   ; D9B2   0255 03F4 03E0 006A
        DECLE   $004A,  $03F9,  $03E0,  $03F8   ; D9B6   004A 03F9 03E0 03F8
        DECLE   $03E0,  $03D5,  $014A,  $0167   ; D9BA   03E0 03D5 014A 0167
        DECLE   $03F9,  $03E0,  $03F7,  $03E0   ; D9BE   03F9 03E0 03F7 03E0
        DECLE   $000A,  $004A,  $03D5,  $0147   ; D9C2   000A 004A 03D5 0147
        DECLE   $03FF,  $03E0,  $03E0,  $005A   ; D9C6   03FF 03E0 03E0 005A
        DECLE   $007A,  $03F2,  $03D5,  $03F9   ; D9CA   007A 03F2 03D5 03F9
        DECLE   $03E0,  $03F8,  $03E0,  $005A   ; D9CE   03E0 03F8 03E0 005A
        DECLE   $007A,  $03FA,  $03E0,  $03F7   ; D9D2   007A 03FA 03E0 03F7

        XOR@    R4,     R0                      ; D9D6   03E0
        SLR     R3,     2                       ; D9D7   0067
L_D9D8:
        DECR    R7                              ; D9D8   0017

        DECLE   $003A,  $009A,  $00FA,  $03FE   ; D9D9   003A 009A 00FA 03FE
        DECLE   $03E0,  $0007,  $03F2,  $03D7   ; D9DD   03E0 0007 03F2 03D7
        DECLE   $0200,  $003A                   ; D9E1   0200 003A

        XOR@    R3,     R2                      ; D9E3   03DA
        COMR    R2                              ; D9E4   001A
        XOR@    R6,     R4                      ; D9E5   03F4
        XOR@    R4,     R0                      ; D9E6   03E0
        ADDR    R4,     R7                      ; D9E7   00E7

        DECLE   $03F2,  $01C7,  $00F7,  $00E7   ; D9E8   03F2 01C7 00F7 00E7
        DECLE   $01C7,  $00F7,  $0218,  $00E7   ; D9EC   01C7 00F7 0218 00E7
        DECLE   $03F2,  $03D7,  $0027,  $03F2   ; D9F0   03F2 03D7 0027 03F2
        DECLE   $03E0,  $03F2,  $03DA,  $03F2   ; D9F4   03E0 03F2 03DA 03F2
        DECLE   $03E0,  $0162,  $0007,  $03FA   ; D9F8   03E0 0162 0007 03FA
        DECLE   $03D7,  $0047,  $03F2,  $03E0   ; D9FC   03D7 0047 03F2 03E0
        DECLE   $006A,  $03F2,  $03DA,  $03E0   ; DA00   006A 03F2 03DA 03E0
        DECLE   $0152,  $000D,  $001F,  $03F9   ; DA04   0152 000D 001F 03F9
        DECLE   $03D7,  $0027,  $023E,  $00EA   ; DA08   03D7 0027 023E 00EA
        DECLE   $008A,  $03F3,  $03DA,  $03E0   ; DA0C   008A 03F3 03DA 03E0
        DECLE   $0152,  $003D,  $00AE,  $00B7   ; DA10   0152 003D 00AE 00B7
        DECLE   $00A6,  $01D6,  $00B6,  $03D7   ; DA14   00A6 01D6 00B6 03D7

        MOVR    R4,     R6                      ; DA18   00A6
        XOR@    R6,     R2                      ; DA19   03F2
        XORR    R2,     R6                      ; DA1A   01D6
        ADDR    R0,     R6                      ; DA1B   00C6
        MVO     R2,     .STIC.Y.2               ; DA1C   0242 000A
        XOR@    R6,     R5                      ; DA1E   03F5
        XOR@    R3,     R2                      ; DA1F   03DA
        XOR@    R6,     R2                      ; DA20   03F2
        XOR@    R4,     R0                      ; DA21   03E0
        CMPR    R0,     R2                      ; DA22   0142
        XOR@    R6,     R2                      ; DA23   03F2
        XOR@    R4,     R0                      ; DA24   03E0
        SUBR    R0,     R4                      ; DA25   0104
        DECR    R4                              ; DA26   0014
        NEGR    R2                              ; DA27   0022
        B       L_D995                          ; DA28   0220 0094

        DECLE   $01C4,  $0084,  $0104,  $006A   ; DA2A   01C4 0084 0104 006A
        DECLE   $03F6,  $03DA,  $0000           ; DA2E   03F6 03DA 0000

        TSTR    R0                              ; DA31   0080
        ANDR    R7,     R0                      ; DA32   01B8
        ADDR    R4,     R4                      ; DA33   00E4
        SLL     R3,     1                       ; DA34   004B
        SARC    R1,     1                       ; DA35   0079
        DECR    R3                              ; DA36   0013
L_DA37:
        DECR    R7                              ; DA37   0017

        DECLE   $0086,  $002D,  $00D4,  $012D   ; DA38   0086 002D 00D4 012D
        DECLE   $0012,  $000E,  $018E,  $0182   ; DA3C   0012 000E 018E 0182
        DECLE   $003E,  $002E,  $00C4,  $03FF   ; DA40   003E 002E 00C4 03FF
        DECLE   $03E0,  $03F6,  $03E0,  $0167   ; DA44   03E0 03F6 03E0 0167
        DECLE   $03D5,  $03FF,  $03E0,  $03F3   ; DA48   03D5 03FF 03E0 03F3
        DECLE   $03E0,  $0147,  $000A,  $03F6   ; DA4C   03E0 0147 000A 03F6
        DECLE   $03DA,  $009A,  $00FA,  $03FA   ; DA50   03DA 009A 00FA 03FA
        DECLE   $03E0,  $000A,  $03F9,  $03DA   ; DA54   03E0 000A 03F9 03DA
        DECLE   $007A,  $03F3,  $03E0,  $0114   ; DA58   007A 03F3 03E0 0114
        DECLE   $016D,  $0012,  $03F2,  $03E0   ; DA5C   016D 0012 03F2 03E0
        DECLE   $000A,  $03DA,  $004A,  $00B7   ; DA60   000A 03DA 004A 00B7
        DECLE   $03F3,  $03D7                   ; DA64   03F3 03D7

        GSWD    R3                              ; DA66   0033
        ADDR    R3,     R1                      ; DA67   00D9
        MOVR    R7,     R1                      ; DA68   00B9
        XOR@    R6,     R3                      ; DA69   03F3
        XOR@    R3,     R2                      ; DA6A   03DA
        COMR    R2                              ; DA6B   001A
        MVO     R2,     .STIC.Y.6               ; DA6C   0242 000E
        XOR@    R3,     R6                      ; DA6E   03DE
        XOR@    R2,     R2                      ; DA6F   03D2
        XOR@    R6,     R2                      ; DA70   03F2
        XOR@    R4,     R0                      ; DA71   03E0
        XOR@    R3,     R2                      ; DA72   03DA
        SLL     R2,     1                       ; DA73   004A
        XOR@    R6,     R2                      ; DA74   03F2
        XOR@    R4,     R0                      ; DA75   03E0
        ADDR    R2,     R7                      ; DA76   00D7

        DECLE   $00B7,  $03F2,  $03D7,  $00D3   ; DA77   00B7 03F2 03D7 00D3
        DECLE   $00B3,  $00D9,  $00B9,  $03F2   ; DA7B   00B3 00D9 00B9 03F2
        DECLE   $03DA,  $007A,  $003E,  $002E   ; DA7F   03DA 007A 003E 002E
        DECLE   $0104,  $006A,  $03DA,  $004A   ; DA83   0104 006A 03DA 004A
        DECLE   $03F4,  $03E0,  $0208,  $0015   ; DA87   03F4 03E0 0208 0015
        DECLE   $03F4,  $03D7,  $0106,  $00DB   ; DA8B   03F4 03D7 0106 00DB
        DECLE   $00BB,  $03F5,  $03DA,  $00AA   ; DA8F   00BB 03F5 03DA 00AA
        DECLE   $03F6,  $03E0,  $0242,  $0243   ; DA93   03F6 03E0 0242 0243
        DECLE   $03F6,  $03D7,  $00DB,  $00BA   ; DA97   03F6 03D7 00DB 00BA
        DECLE   $03DA,  $00AA,  $00CA,  $03F8   ; DA9B   03DA 00AA 00CA 03F8
        DECLE   $03E0,  $0037,  $03F6,  $03D7   ; DA9F   03E0 0037 03F6 03D7
        DECLE   $0027,  $03FF,  $03E0,  $03FF   ; DAA3   0027 03FF 03E0 03FF
        DECLE   $03E0,  $03FF                   ; DAA7   03E0 03FF

        XOR@    R4,     R0                      ; DAA9   03E0
        XORI    #$03E0, R5                      ; DAAA   03FD 03E0
        ADD@    R6,     R7                      ; DAAC   02F7

        DECLE   $0255,  $03F5,  $03E0,  $0000   ; DAAD   0255 03F5 03E0 0000
        DECLE   $007C,  $01AC,  $00A4,  $0066   ; DAB1   007C 01AC 00A4 0066
        DECLE   $0009,  $0098,  $0034,  $001E   ; DAB5   0009 0098 0034 001E
        DECLE   $0035                           ; DAB9   0035

        INCR    R6                              ; DABA   000E
        SLLC    R2,     2                       ; DABB   005E
        MOVR    R4,     R7                      ; DABC   00A7

        DECLE   $007E,  $006F,  $0187,  $0152   ; DABD   007E 006F 0187 0152
        DECLE   $0037                           ; DAC1   0037

        SUBR    R4,     R3                      ; DAC2   0123
        XOR@    R6,     R2                      ; DAC3   03F2
        XOR@    R4,     R0                      ; DAC4   03E0
        ADD@    R6,     R7                      ; DAC5   02F7

        DECLE   $0255,  $03FF,  $03E0,  $03FF   ; DAC6   0255 03FF 03E0 03FF
L_DACA:
        XOR@    R4,     R0                      ; DACA   03E0
        DECLE   $03FF,  $03E0,  $03FF,  $03E0   ; DACB   03FF 03E0 03FF 03E0
        DECLE   $03FF,  $03E0,  $03F2,  $03E0   ; DACF   03FF 03E0 03F2 03E0
        DECLE   $0162,  $0210                   ; DAD3   0162 0210

        ANDR    R6,     R2                      ; DAD5   01B2
        XOR@    R6,     R2                      ; DAD6   03F2
        MVO     R2,     G_03FB                  ; DAD7   0242 03FB
        XOR@    R4,     R0                      ; DAD9   03E0
        XORR    R4,     R5                      ; DADA   01E5
        XOR@    R6,     R3                      ; DADB   03F3
        XOR@    R4,     R0                      ; DADC   03E0
        ANDR    R4,     R2                      ; DADD   01A2
        INCR    R6                              ; DADE   000E
        MOVR    R3,     R6                      ; DADF   009E
        ADDR    R4,     R7                      ; DAE0   00E7

        DECLE   $00F7,  $03F9,  $03E0,  $03F2   ; DAE1   00F7 03F9 03E0 03F2
        DECLE   $01E5,  $01B7,  $0197           ; DAE5   01E5 01B7 0197

        XOR@    R6,     R3                      ; DAE8   03F3
        XOR@    R4,     R0                      ; DAE9   03E0
        MOVR    R7,     R6                      ; DAEA   00BE
        MOVR    R5,     R7                      ; DAEB   00AF

        DECLE   $03F2,  $03D7,  $0097,  $00F7   ; DAEC   03F2 03D7 0097 00F7
        DECLE   $023E,  $0242,  $01F4,  $0218   ; DAF0   023E 0242 01F4 0218
        DECLE   $03F7                           ; DAF4   03F7

        XORR    R4,     R5                      ; DAF5   01E5
        XOR@    R6,     R2                      ; DAF6   03F2
L_DAF7:
        XOR@    R4,     R0                      ; DAF7   03E0
        DECLE   $0002,  $0192,  $0037,  $0163   ; DAF8   0002 0192 0037 0163
        DECLE   $03F3,  $03D7                   ; DAFC   03F3 03D7
L_DAFE:
        DECR    R7                              ; DAFE   0017
        B       L_DEF3                          ; DAFF   0200 03F2

        DECLE   $0242,  $0007,  $03F2,  $03D7   ; DB01   0242 0007 03F2 03D7
L_DB05:
        DECR    R7                              ; DB05   0017

        XOR@    R6,     R3                      ; DB06   03F3
        XORR    R4,     R5                      ; DB07   01E5
        XOR@    R6,     R2                      ; DB08   03F2
        XOR@    R4,     R0                      ; DB09   03E0
L_DB0A:
        CMPR    R0,     R2                      ; DB0A   0142
        DECLE   $03F2,  $03E0,  $0032,  $0243   ; DB0B   03F2 03E0 0032 0243
        DECLE   $00B7,  $03F2,  $03D7,  $0077   ; DB0F   00B7 03F2 03D7 0077
        DECLE   $01F4,  $0067,  $03F3,  $03D7   ; DB13   01F4 0067 03F3 03D7
        DECLE   $0027,  $03F2,  $01E5,  $03F9   ; DB17   0027 03F2 01E5 03F9
        DECLE   $03E0,  $0095,  $00B7,  $03F4   ; DB1B   03E0 0095 00B7 03F4
        DECLE   $03D7                           ; DB1F   03D7

        MOVR    R4,     R7                      ; DB20   00A7
        ADDR    R0,     R7                      ; DB21   00C7

        DECLE   $03FE,  $03E0,  $0037,  $03D7   ; DB22   03FE 03E0 0037 03D7

        MOVR    R4,     R7                      ; DB26   00A7
        ADDR    R0,     R7                      ; DB27   00C7

        DECLE   $03FF,  $03E0,  $03FC,  $03E0   ; DB28   03FF 03E0 03FC 03E0
        DECLE   $0000,  $0081,  $01B4,  $0004   ; DB2C   0000 0081 01B4 0004
        DECLE   $0088,  $0001,  $0014,  $0048   ; DB30   0088 0001 0014 0048
        DECLE   $0095,  $003D,  $0153,  $004F   ; DB34   0095 003D 0153 004F
        DECLE   $001F,  $0187,  $003F,  $006F   ; DB38   001F 0187 003F 006F
        DECLE   $0173,  $0166,  $00C3,  $03F5   ; DB3C   0173 0166 00C3 03F5
        DECLE   $03E0,  $03FF,  $03E0,  $03F5   ; DB40   03E0 03FF 03E0 03F5
        DECLE   $03E0,  $03FF                   ; DB44   03E0 03FF

        XOR@    R4,     R0                      ; DB46   03E0
        XOR@    R6,     R5                      ; DB47   03F5
        XOR@    R4,     R0                      ; DB48   03E0
        XORI    #$03E0, R4                      ; DB49   03FC 03E0
        ADD@    R6,     R7                      ; DB4B   02F7

        DECLE   $0255,  $03F6,  $03E0,  $03FF   ; DB4C   0255 03F6 03E0 03FF
        DECLE   $03E0,  $03F5,  $03E0,  $03FF   ; DB50   03E0 03F5 03E0 03FF

        XOR@    R4,     R0                      ; DB54   03E0
        XORI    #$03E0, R3                      ; DB55   03FB 03E0
        ADDR    R4,     R7                      ; DB57   00E7

        DECLE   $03F2,  $01C7,  $00F7           ; DB58   03F2 01C7 00F7

        ANDR    R0,     R2                      ; DB5B   0182
        ADDR    R4,     R7                      ; DB5C   00E7

        DECLE   $01C7,  $00F7                   ; DB5D   01C7 00F7

        XOR@    R6,     R4                      ; DB5F   03F4
        XOR@    R4,     R0                      ; DB60   03E0
        RSWD    R2                              ; DB61   003A
        CMPR    R7,     R2                      ; DB62   017A
        XOR@    R6,     R2                      ; DB63   03F2
        XOR@    R4,     R0                      ; DB64   03E0
        ADDR    R4,     R7                      ; DB65   00E7

        DECLE   $01C7,  $0087,  $03F5,  $03D7   ; DB66   01C7 0087 03F5 03D7

        RLC     R3,     1                       ; DB6A   0053
        ANDR    R2,     R3                      ; DB6B   0193
        MOVR    R1,     R7                      ; DB6C   008F

        DECLE   $001F                           ; DB6D   001F
L_DB6E:
        DECR    R7                              ; DB6E   0017
        BGT     L_DCD8                          ; DB6F   020E 0167

        XOR@    R2,     R5                      ; DB71   03D5
        ANDR    R1,     R2                      ; DB72   018A
        XOR@    R2,     R5                      ; DB73   03D5
        ADDR    R4,     R7                      ; DB74   00E7
        MOVR    R0,     R7                      ; DB75   0087

        DECLE   $03FA,  $03D7,  $003F,  $00AF   ; DB76   03FA 03D7 003F 00AF
        DECLE   $0027,  $03D5,  $01A7,  $000A   ; DB7A   0027 03D5 01A7 000A
        DECLE   $004A,  $0007,  $03F4,  $03D7   ; DB7E   004A 0007 03F4 03D7
        DECLE   $0183,  $03D7,  $0163,  $03F4   ; DB82   0183 03D7 0163 03F4
        DECLE   $03D7,  $01B3,  $01A6,  $0103   ; DB86   03D7 01B3 01A6 0103
        DECLE   $0192,  $03D5,  $0210,  $003A   ; DB8A   0192 03D5 0210 003A
        DECLE   $007A,  $0037,  $00A7,  $01D7   ; DB8E   007A 0037 00A7 01D7
        DECLE   $00B7                           ; DB92   00B7

        SLR     R3,     1                       ; DB93   0063
        NEGR    R3                              ; DB94   0023
        DIS                                     ; DB95   0003
        SUBR    R2,     R3                      ; DB96   0113
        MOVR    R4,     R7                      ; DB97   00A7

        DECLE   $03F3,  $01D7,  $00C7,  $0142   ; DB98   03F3 01D7 00C7 0142
        DECLE   $01A2,  $03F4,  $03E0,  $003A   ; DB9C   01A2 03F4 03E0 003A
        DECLE   $007A,  $03F3,  $03E0,  $0142   ; DBA0   007A 03F3 03E0 0142
        DECLE   $0147,  $01A2,  $0142,  $03FC   ; DBA4   0147 01A2 0142 03FC
        DECLE   $03E0,  $005A,  $001A,  $03FE   ; DBA8   03E0 005A 001A 03FE
        DECLE   $03E0,  $0000,  $0088,  $01BD   ; DBAC   03E0 0000 0088 01BD
        DECLE   $0064,  $0079,  $0010,  $009C   ; DBB0   0064 0079 0010 009C
        DECLE   $0058,  $0019,  $0045,  $00A2   ; DBB4   0058 0019 0045 00A2
        DECLE   $00B2,  $009A,  $000D,  $018E   ; DBB8   00B2 009A 000D 018E
        DECLE   $001E,  $003E,  $018E,  $006E   ; DBBC   001E 003E 018E 006E
        DECLE   $03FF,  $03E0,  $03FF,  $03E0   ; DBC0   03FF 03E0 03FF 03E0
        DECLE   $03FF                           ; DBC4   03FF

        XOR@    R4,     R0                      ; DBC5   03E0
        ADD@    R6,     R7                      ; DBC6   02F7

        DECLE   $0255,  $03FF,  $03E0,  $008A   ; DBC7   0255 03FF 03E0 008A
        DECLE   $009A,  $00FA,  $03FF,  $03E0   ; DBCB   009A 00FA 03FF 03E0
        DECLE   $03D5,  $0217,  $03F3,  $03DA   ; DBCF   03D5 0217 03F3 03DA
        DECLE   $009A,  $03FE,  $03E0,  $0228   ; DBD3   009A 03FE 03E0 0228

        XOR@    R2,     R5                      ; DBD7   03D5
        RSWD    R2                              ; DBD8   003A
        XOR@    R6,     R3                      ; DBD9   03F3
        XOR@    R3,     R2                      ; DBDA   03DA
        XOR@    R2,     R5                      ; DBDB   03D5
        SUBR    R4,     R4                      ; DBDC   0124
        ADDR    R4,     R7                      ; DBDD   00E7
        MOVR    R0,     R7                      ; DBDE   0087

        DECLE   $03F3,  $03D7,  $0097,  $00F7   ; DBDF   03F3 03D7 0097 00F7
        DECLE   $03F5,  $03E0,  $020E,  $00E2   ; DBE3   03F5 03E0 020E 00E2
        DECLE   $00F2,  $00DA,  $03DA,  $004A   ; DBE7   00F2 00DA 03DA 004A
        DECLE   $0114,  $0086,  $03F7,  $03D7   ; DBEB   0114 0086 03F7 03D7
L_DBEF:
        DECR    R7                              ; DBEF   0017

        DECLE   $03F4,  $03E0,  $0152,  $000D   ; DBF0   03F4 03E0 0152 000D
        DECLE   $03DE,  $001E,  $01AA,  $0007   ; DBF4   03DE 001E 01AA 0007
        DECLE   $03F3,  $03D7                   ; DBF8   03F3 03D7

        MOVR    R4,     R7                      ; DBFA   00A7
        ADDR    R0,     R7                      ; DBFB   00C7

        XOR@    R6,     R2                      ; DBFC   03F2
        XOR@    R2,     R5                      ; DBFD   03D5
        ADDR    R2,     R7                      ; DBFE   00D7

        DECLE   $00B7,  $0027                   ; DBFF   00B7 0027

        XOR@    R2,     R5                      ; DC01   03D5
        XOR@    R6,     R4                      ; DC02   03F4
        XOR@    R4,     R0                      ; DC03   03E0
        RSWD    R6                              ; DC04   003E
        XOR@    R3,     R6                      ; DC05   03DE
        MOVR    R5,     R6                      ; DC06   00AE
        INCR    R2                              ; DC07   000A
        ADDR    R2,     R7                      ; DC08   00D7

        DECLE   $00B7                           ; DC09   00B7

        MOVR    R4,     R7                      ; DC0A   00A7
        ADDR    R0,     R7                      ; DC0B   00C7

        DECLE   $03F3,  $03E0,  $03D5,  $0210   ; DC0C   03F3 03E0 03D5 0210
        DECLE   $03F5,  $03D5,  $03F2,  $03E0   ; DC10   03F5 03D5 03F2 03E0
        DECLE   $0142,  $01F4,  $006A,  $03DA   ; DC14   0142 01F4 006A 03DA
        DECLE   $007A,  $03F2,  $03D5,  $03F7   ; DC18   007A 03F2 03D5 03F7

        XOR@    R4,     R0                      ; DC1C   03E0
        SKIP                                    ; DC1D   0208
        XOR@    R6,     R2                      ; DC1E   03F2
        XOR@    R2,     R5                      ; DC1F   03D5
        CMPR    R4,     R7                      ; DC20   0167
        BGT     L_DFF8                          ; DC21   020E 03D5
        B       L_DACA                          ; DC23   0220 015A

        DECLE   $03F5,  $03DA,  $001A,  $03F8   ; DC25   03F5 03DA 001A 03F8
        DECLE   $03E0,  $03D5,  $0147,  $03D5   ; DC29   03E0 03D5 0147 03D5
        DECLE   $0208,  $03D5,  $020E,  $013A   ; DC2D   0208 03D5 020E 013A
        DECLE   $03F5,  $03DA,  $03FB,  $03E0   ; DC31   03F5 03DA 03FB 03E0
        DECLE   $0000                           ; DC35   0000

        MOVR    R2,     R1                      ; DC36   0091
        XORR    R0,     R6                      ; DC37   01C6
        MOVR    R0,     R4                      ; DC38   0084
L_DC39:
        DECR    R7                              ; DC39   0017
        INCR    R7                              ; DC3A   000F
        MOVR    R0,     R7                      ; DC3B   0087

L_DC3C:
        SLL     R0,     2                       ; DC3C   004C
        ADCR    R6                              ; DC3D   002E
        DECR    R5                              ; DC3E   0015
        SUBR    R2,     R2                      ; DC3F   0112
        INCR    R5                              ; DC40   000D
        COMR    R5                              ; DC41   001D
        SUBR    R2,     R2                      ; DC42   0112
        ANDR    R1,     R6                      ; DC43   018E
        ADCR    R7                              ; DC44   002F

        ANDR    R0,     R5                      ; DC45   0185
L_DC46:
        SUBR    R1,     R7                      ; DC46   010F

        DECLE   $0187                           ; DC47   0187

        XOR@    R6,     R4                      ; DC48   03F4
        XOR@    R4,     R0                      ; DC49   03E0
        EIS                                     ; DC4A   0002
        DECR    R2                              ; DC4B   0012
        XORI    #$03E0, R5                      ; DC4C   03FD 03E0
        XOR@    R6,     R4                      ; DC4E   03F4
        XOR@    R4,     R0                      ; DC4F   03E0
        CMPR    R2,     R2                      ; DC50   0152
        INCR    R5                              ; DC51   000D
        COMR    R5                              ; DC52   001D
        ANDR    R2,     R2                      ; DC53   0192
        XOR@    R6,     R3                      ; DC54   03F3
        XOR@    R4,     R0                      ; DC55   03E0
        ADD@    R6,     R7                      ; DC56   02F7

        MVO@    R5,     R2                      ; DC57   0255
        XORI    #$03E0, R3                      ; DC58   03FB 03E0
        CMPR    R2,     R2                      ; DC5A   0152
        XOR@    R3,     R6                      ; DC5B   03DE
        ADCR    R7                              ; DC5C   002F
L_DC5D:
        DECR    R7                              ; DC5D   0017

L_DC5E:
        XORI    #$03E0, R4                      ; DC5E   03FC 03E0
        DECLE   $03F4,  $03E0,  $023E,  $014F   ; DC60   03F4 03E0 023E 014F
        DECLE   $03F2,  $03D7,  $0182,  $03FF   ; DC64   03F2 03D7 0182 03FF
        DECLE   $03E0,  $0067,  $03D7,  $0201   ; DC68   03E0 0067 03D7 0201
        DECLE   $0026,  $0022,  $03F6,  $03E0   ; DC6C   0026 0022 03F6 03E0
        DECLE   $000A,  $03F7,  $03E0,  $0007   ; DC70   000A 03F7 03E0 0007
        DECLE   $03F2,  $03D7,  $0046,  $0042   ; DC74   03F2 03D7 0046 0042
        DECLE   $0002,  $0242,  $03F4,  $03E0   ; DC78   0002 0242 03F4 03E0
        DECLE   $016A,  $01AA,  $03F7,  $03E0   ; DC7C   016A 01AA 03F7 03E0
        DECLE   $03F3,  $03D7,  $0076,  $0072   ; DC80   03F3 03D7 0076 0072
        DECLE   $01A2,  $03E0,  $0210,  $03F2   ; DC84   01A2 03E0 0210 03F2
        DECLE   $03E0,  $000A,  $002A,  $03F8   ; DC88   03E0 000A 002A 03F8
        DECLE   $03E0,  $0037,  $03F3,  $03D7   ; DC8C   03E0 0037 03F3 03D7

        RRC     R2,     2                       ; DC90   0076
        CMPR    R6,     R2                      ; DC91   0172
        XOR@    R4,     R0                      ; DC92   03E0
        B       L_D8B4                          ; DC93   0220 03E0

        SAR     R2,     1                       ; DC95   006A
        ADCR    R2                              ; DC96   002A
        XORI    #$03E0, R0                      ; DC97   03F8 03E0
        CMPR    R2,     R2                      ; DC99   0152
L_DC9A:
        MVO     R2,     G_0037                  ; DC9A   0242 0037
        DECLE   $03F3,  $03D7                   ; DC9C   03F3 03D7
L_DC9E:
        DECR    R7                              ; DC9E   0017

        DECLE   $0218,  $03D5,  $000A,  $004A   ; DC9F   0218 03D5 000A 004A
        DECLE   $03F3,  $03D5,  $01B7,  $0177   ; DCA3   03F3 03D5 01B7 0177
        DECLE   $03F6,  $03E0,  $0152,  $0056   ; DCA7   03F6 03E0 0152 0056
        DECLE   $03F3,  $03D7,  $03D5,  $015A   ; DCAB   03F3 03D7 03D5 015A
        DECLE   $011A,  $03F4,  $03D5,  $03F9   ; DCAF   011A 03F4 03D5 03F9
        DECLE   $03E0,  $0074,  $0036,  $03D7   ; DCB3   03E0 0074 0036 03D7
        DECLE   $0027,  $03F2,  $03D5,  $003A   ; DCB7   0027 03F2 03D5 003A
        DECLE   $001A,  $03FD,  $03E0,  $0142   ; DCBB   001A 03FD 03E0 0142
        DECLE   $03D5,  $03F3,  $03E0,  $006A   ; DCBF   03D5 03F3 03E0 006A
        DECLE   $002A,  $03F8,  $03E0,  $0000   ; DCC3   002A 03F8 03E0 0000
        DECLE   $0069,  $0166,  $0004,  $0087   ; DCC7   0069 0166 0004 0087
        DECLE   $0002,  $001F,  $0043,  $008B   ; DCCB   0002 001F 0043 008B
        DECLE   $0043,  $0104,  $014D,  $0132   ; DCCF   0043 0104 014D 0132
        DECLE   $017D,  $018F                   ; DCD3   017D 018F

        COMR    R6                              ; DCD5   001E
        ANDR    R0,     R2                      ; DCD6   0182
        RSWD    R5                              ; DCD7   003D
L_DCD8:
        ADCR    R6                              ; DCD8   002E
        DECLE   $03F6,  $03E0,  $03FF,  $03E0   ; DCD9   03F6 03E0 03FF 03E0
        DECLE   $03F5,  $03E0,  $03FF           ; DCDD   03F5 03E0 03FF

        XOR@    R4,     R0                      ; DCE0   03E0
        XORI    #$03E0, R2                      ; DCE1   03FA 03E0
        ADD@    R6,     R7                      ; DCE3   02F7

        DECLE   $0255,  $03FD,  $03E0,  $03FF   ; DCE4   0255 03FD 03E0 03FF
        DECLE   $03E0,  $03F5,  $03E0,  $03FF   ; DCE8   03E0 03F5 03E0 03FF
        DECLE   $03E0,  $03FF                   ; DCEC   03E0 03FF

        XOR@    R4,     R0                      ; DCEE   03E0
        CMPR    R4,     R2                      ; DCEF   0162
        XORI    #$03E0, R3                      ; DCF0   03FB 03E0
        ANDR    R0,     R2                      ; DCF2   0182
        MOVR    R0,     R7                      ; DCF3   0087
        MOVR    R2,     R7                      ; DCF4   0097

        MOVR    R6,     R5                      ; DCF5   00B5
        B       L_DCFF                          ; DCF6   0200 0007

        DIS                                     ; DCF8   0003
        CMPR    R0,     R4                      ; DCF9   0144
        ANDR    R1,     R5                      ; DCFA   018D
        CMPR    R6,     R2                      ; DCFB   0172
        XOR@    R6,     R4                      ; DCFC   03F4
        XOR@    R4,     R0                      ; DCFD   03E0
        CMPR    R2,     R7                      ; DCFE   0157
L_DCFF:
        CMPR    R6,     R7                      ; DCFF   0177
        XOR@    R2,     R5                      ; DD00   03D5
        MOVR    R0,     R7                      ; DD01   0087

        DECLE   $03D7,  $0145,  $0053,  $0173   ; DD02   03D7 0145 0053 0173
        DECLE   $03F2,  $03D7,  $0145,  $03D7   ; DD06   03F2 03D7 0145 03D7
        DECLE   $03D2,  $01BD,  $03DE,  $001E   ; DD0A   03D2 01BD 03DE 001E
        DECLE   $03F6,  $03E0,  $03D5,  $00B7   ; DD0E   03F6 03E0 03D5 00B7
        DECLE   $03F8,  $03D7,  $0033,  $03D2   ; DD12   03F8 03D7 0033 03D2
        DECLE   $003D,  $002E,  $03F8,  $03E0   ; DD16   003D 002E 03F8 03E0
        DECLE   $0095,  $00B7,  $03F5,  $03D7   ; DD1A   0095 00B7 03F5 03D7
        DECLE   $0155,  $0228,  $0032,  $03D2   ; DD1E   0155 0228 0032 03D2
        DECLE   $0172,  $03FA,  $03E0,  $0095   ; DD22   0172 03FA 03E0 0095
        DECLE   $01D7,  $00B7                   ; DD26   01D7 00B7

        CMPR    R2,     R3                      ; DD28   0153
        CMPR    R6,     R3                      ; DD29   0173
L_DD2A:
        MOVR    R4,     R7                      ; DD2A   00A7

        DECLE   $03FF,  $03E0,  $03FB,  $03E0   ; DD2B   03FF 03E0 03FB 03E0
        DECLE   $0000,  $0083,  $0234           ; DD2F   0000 0083 0234

        NEGR    R5                              ; DD32   0025
        ADDR    R0,     R4                      ; DD33   00C4
        SARC    R1,     1                       ; DD34   0079
        DECR    R3                              ; DD35   0013
        ADCR    R0                              ; DD36   0028
        TSTR    R2                              ; DD37   0092
        SLLC    R1,     1                       ; DD38   0059
        CMPR    R2,     R3                      ; DD39   0153
        SUBR    R5,     R7                      ; DD3A   012F

        TSTR    R3                              ; DD3B   009B
        CMPR    R7,     R7                      ; DD3C   017F
        ANDR    R1,     R6                      ; DD3D   018E
        CMPR    R3,     R7                      ; DD3E   015F
        COMR    R3                              ; DD3F   001B
        SUBR    R1,     R7                      ; DD40   010F

        SUBR    R2,     R3                      ; DD41   0113
        XOR@    R6,     R3                      ; DD42   03F3
        XOR@    R4,     R0                      ; DD43   03E0
        INCR    R2                              ; DD44   000A
        XOR@    R6,     R4                      ; DD45   03F4
        XOR@    R5,     R4                      ; DD46   03EC
        COMR    R2                              ; DD47   001A
        XORI    #$03E0, R0                      ; DD48   03F8 03E0
        ADD@    R6,     R7                      ; DD4A   02F7

        DECLE   $0255,  $03F3,  $03E0,  $000A   ; DD4B   0255 03F3 03E0 000A
        DECLE   $03F5,  $03EC,  $0049,  $0006   ; DD4F   03F5 03EC 0049 0006
        DECLE   $03F5,  $03D7,  $03F2,  $0243   ; DD53   03F5 03D7 03F2 0243
        DECLE   $0017,  $03F4,  $03E0,  $003A   ; DD57   0017 03F4 03E0 003A
        DECLE   $03F5,  $03EC,  $0079,  $0036   ; DD5B   03F5 03EC 0079 0036
        DECLE   $03F6,  $03D7                   ; DD5F   03F6 03D7

        MOVR    R4,     R7                      ; DD61   00A7
        ADDR    R0,     R7                      ; DD62   00C7

        DECLE   $03F3,  $03E0,  $0167,  $03D5   ; DD63   03F3 03E0 0167 03D5
        DECLE   $03F6,  $03EC,  $0099,  $0136   ; DD67   03F6 03EC 0099 0136
        DECLE   $0221,  $0126,  $03D7           ; DD6B   0221 0126 03D7

        MOVR    R4,     R7                      ; DD6E   00A7
        ADDR    R0,     R7                      ; DD6F   00C7

        XOR@    R6,     R2                      ; DD70   03F2
        XOR@    R2,     R5                      ; DD71   03D5
        XOR@    R6,     R2                      ; DD72   03F2
        XOR@    R4,     R0                      ; DD73   03E0
        SARC    R2,     1                       ; DD74   007A
        CMPR    R0,     R7                      ; DD75   0147
        SAR     R2,     1                       ; DD76   006A
        XORI    #$03EC, R0                      ; DD77   03F8 03EC
        SUBR    R1,     R3                      ; DD79   010B
        ADDR    R7,     R1                      ; DD7A   00F9
        DECR    R2                              ; DD7B   0012
        XOR@    R6,     R5                      ; DD7C   03F5
        XOR@    R2,     R5                      ; DD7D   03D5
        XOR@    R4,     R0                      ; DD7E   03E0
        XORI    #$03EC, R5                      ; DD7F   03FD 03EC
        COMR    R1                              ; DD81   0019
        DECR    R2                              ; DD82   0012
        XOR@    R6,     R2                      ; DD83   03F2
        XOR@    R2,     R5                      ; DD84   03D5
        ADDR    R4,     R7                      ; DD85   00E7

        DECLE   $00C5,  $03E1,  $03FE,  $03EC   ; DD86   00C5 03E1 03FE 03EC
        DECLE   $0109,  $011B,  $03F3,  $03D7   ; DD8A   0109 011B 03F3 03D7
        DECLE   $0211,  $03EC,  $03FF,  $03EC   ; DD8E   0211 03EC 03FF 03EC
        DECLE   $009B,  $00FB,  $03D7,  $03E1   ; DD92   009B 00FB 03D7 03E1
        DECLE   $03EC,  $03FF,  $03EC,  $012B   ; DD96   03EC 03FF 03EC 012B
        DECLE   $03EC,  $009B,  $00FB,  $03FF   ; DD9A   03EC 009B 00FB 03FF
        DECLE   $03EC,  $0049,  $0193,  $016F   ; DD9E   03EC 0049 0193 016F
        DECLE   $00DB,  $00CB,  $03FF,  $03EC   ; DDA2   00DB 00CB 03FF 03EC
        DECLE   $0079,  $01BF,  $03DE,  $019F   ; DDA6   0079 01BF 03DE 019F
        DECLE   $03D7,  $03EC,  $03FF,  $03EC   ; DDAA   03D7 03EC 03FF 03EC
        DECLE   $001B,  $014F,  $0153,  $0193   ; DDAE   001B 014F 0153 0193
        DECLE   $0000                           ; DDB2   0000

        TSTR    R1                              ; DDB3   0089
        MVO@    R4,     R4                      ; DDB4   0264
        ADDR    R4,     R5                      ; DDB5   00E5
        INCR    R5                              ; DDB6   000D
        CLRC                                    ; DDB7   0006
        INCR    R7                              ; DDB8   000F

        DECR    R3                              ; DDB9   0013
L_DDBA:
        SARC    R1,     1                       ; DDBA   0079
        DECR    R1                              ; DDBB   0011
        NEGR    R5                              ; DDBC   0025
        CMPR    R1,     R7                      ; DDBD   014F
L_DDBE:
        DECR    R7                              ; DDBE   0017

        DECLE   $017F,  $018E,  $015F,  $0037   ; DDBF   017F 018E 015F 0037
        DECLE   $016F,  $000B,  $03FD,  $03E0   ; DDC3   016F 000B 03FD 03E0
        DECLE   $0025,  $018F                   ; DDC7   0025 018F
L_DDC9:
        DECR    R7                              ; DDC9   0017

        DECLE   $03F4,  $03E0,  $0157,  $0177   ; DDCA   03F4 03E0 0157 0177
        DECLE   $022E,  $03FA,  $03E0,  $01BF   ; DDCE   022E 03FA 03E0 01BF
        DECLE   $03DE,  $019F                   ; DDD2   03DE 019F
L_DDD4:
        DECR    R7                              ; DDD4   0017

        XOR@    R6,     R4                      ; DDD5   03F4
        XOR@    R4,     R0                      ; DDD6   03E0
        SETC                                    ; DDD7   0007
L_DDD8:
        DECR    R7                              ; DDD8   0017

        DECLE   $0220,  $03F9,  $03E0,  $0037   ; DDD9   0220 03F9 03E0 0037
        DECLE   $01AF,  $000B,  $03DA,  $019A   ; DDDD   01AF 000B 03DA 019A
        DECLE   $03F3,  $03E0,  $03F2,  $03D7   ; DDE1   03F3 03E0 03F2 03D7
        DECLE   $03D5,  $03F9,  $03E0,  $01BA   ; DDE5   03D5 03F9 03E0 01BA
        DECLE   $009B,  $00AA,  $00CA,  $03F4   ; DDE9   009B 00AA 00CA 03F4
        DECLE   $03E0,  $03F2,  $03D7,  $0077   ; DDED   03E0 03F2 03D7 0077
        DECLE   $03FA,  $03E0,  $01AA,  $0007   ; DDF1   03FA 03E0 01AA 0007
        DECLE   $03D7                           ; DDF5   03D7
L_DDF6:
        DECR    R7                              ; DDF6   0017

        DECLE   $03F3,  $03E0,  $03F3,  $03D7   ; DDF7   03F3 03E0 03F3 03D7
        DECLE   $0077,  $0208,  $03F8,  $03E0   ; DDFB   0077 0208 03F8 03E0
        DECLE   $0025,  $03F3,  $03D7,  $03F3   ; DDFF   0025 03F3 03D7 03F3
        DECLE   $03E0,  $0037,  $03F3,  $03D7   ; DE03   03E0 0037 03F3 03D7
        DECLE   $0077,  $03F7,  $03E0,  $0025   ; DE07   0077 03F7 03E0 0025
        DECLE   $03F3,  $03D7,  $0027,  $03F4   ; DE0B   03F3 03D7 0027 03F4
        DECLE   $03E0,  $0037,  $03F3,  $03D7   ; DE0F   03E0 0037 03F3 03D7
        DECLE   $0077,  $03F5,  $03E0,  $0007   ; DE13   0077 03F5 03E0 0007
        DECLE   $03F3,  $03D7,  $0027,  $03F6   ; DE17   03F3 03D7 0027 03F6
        DECLE   $03E0,  $0037,  $03F3,  $03D7   ; DE1B   03E0 0037 03F3 03D7

        XOR@    R6,     R5                      ; DE1F   03F5
        SUBR    R0,     R7                      ; DE20   0107

        DECLE   $03F3,  $03D7,  $0027,  $03F8   ; DE21   03F3 03D7 0027 03F8
        DECLE   $03E0,  $0037,  $03F5,  $03D7   ; DE25   03E0 0037 03F5 03D7
        DECLE   $0127,  $03F3,  $03D7,  $0027   ; DE29   0127 03F3 03D7 0027
        DECLE   $03FA,  $03E0,  $0037,  $03F3   ; DE2D   03FA 03E0 0037 03F3
        DECLE   $03D7,  $0027,  $03FF           ; DE31   03D7 0027 03FF

        XOR@    R4,     R0                      ; DE34   03E0
        XORI    #$03E0, R1                      ; DE35   03F9 03E0
        ADD@    R6,     R7                      ; DE37   02F7

        DECLE   $0255,  $03F4,  $03E0,  $0000   ; DE38   0255 03F4 03E0 0000
        DECLE   $00A6,  $01DA,  $0005           ; DE3C   00A6 01DA 0005

        ADDR    R0,     R2                      ; DE3F   00C2
        SARC    R1,     1                       ; DE40   0079
        COMR    R3                              ; DE41   001B
L_DE42:
        DECR    R7                              ; DE42   0017

        DECLE   $0084,  $0055,  $0116,  $004F   ; DE43   0084 0055 0116 004F
        DECLE   $005F,  $0182,  $007D,  $002D   ; DE47   005F 0182 007D 002D
        DECLE   $0092,  $0072,  $0022,  $03F2   ; DE4B   0092 0072 0022 03F2
        DECLE   $03E0,  $005A,  $03F3,  $03EC   ; DE4F   03E0 005A 03F3 03EC
        DECLE   $001A,  $03FF,  $03E0,  $0167   ; DE53   001A 03FF 03E0 0167
        DECLE   $003A,  $03F3,  $03EC,  $007A   ; DE57   003A 03F3 03EC 007A
        DECLE   $03D5,  $0007,  $03F2,  $03D7   ; DE5B   03D5 0007 03F2 03D7
        DECLE   $0097,  $00F7,  $03F8,  $03E0   ; DE5F   0097 00F7 03F8 03E0
        DECLE   $0147,  $03D5,  $005A,  $03F3   ; DE63   0147 03D5 005A 03F3
        DECLE   $03EC,  $017A,  $0037,  $03F4   ; DE67   03EC 017A 0037 03F4
        DECLE   $03D7,  $0097,  $00F7           ; DE6B   03D7 0097 00F7

        XORI    #$03E0, R0                      ; DE6E   03F8 03E0
        SAR     R2,     1                       ; DE70   006A
        XOR@    R6,     R3                      ; DE71   03F3
        XOR@    R5,     R4                      ; DE72   03EC
        SARC    R2,     1                       ; DE73   007A
        CMPR    R5,     R2                      ; DE74   016A
        B       L_DECE                          ; DE75   0200 0057

        DECLE   $03F4,  $03D7                   ; DE77   03F4 03D7
L_DE79:
        DECR    R7                              ; DE79   0017

        DECLE   $03F7,  $03E0,  $03F6,  $03EC   ; DE7A   03F7 03E0 03F6 03EC
        DECLE   $017A,  $0208,  $0057,  $03F4   ; DE7E   017A 0208 0057 03F4
        DECLE   $03D7                           ; DE82   03D7
L_DE83:
        DECR    R7                              ; DE83   0017

        DECLE   $0162,  $03F5,  $03E0,  $003A   ; DE84   0162 03F5 03E0 003A
        DECLE   $03F4,  $03EC,  $002A,  $03F4   ; DE88   03F4 03EC 002A 03F4
        DECLE   $03E0,  $0218,  $0057,  $03D7   ; DE8C   03E0 0218 0057 03D7
        DECLE   $0221,  $0176,  $03F6,  $03E0   ; DE90   0221 0176 03F6 03E0
        DECLE   $03F3,  $03EC,  $004A,  $03F5   ; DE94   03F3 03EC 004A 03F5
        DECLE   $03E0,  $0002,  $0134,  $03D7   ; DE98   03E0 0002 0134 03D7
        DECLE   $0116,  $0022,  $03F6,  $03E0   ; DE9C   0116 0022 03F6 03E0
        DECLE   $03F2,  $03EC,  $011A,  $03F6   ; DEA0   03F2 03EC 011A 03F6
        DECLE   $03E0,  $0132,  $0025,  $03F2   ; DEA4   03E0 0132 0025 03F2
        DECLE   $03D7,  $0177,  $03F6,  $03E0   ; DEA8   03D7 0177 03F6 03E0
        DECLE   $03F3,  $03EC,  $019A,  $03F4   ; DEAC   03F3 03EC 019A 03F4
        DECLE   $03E0,  $0082,  $03D2,  $0136   ; DEB0   03E0 0082 03D2 0136
        DECLE   $03F2,  $03D7                   ; DEB4   03F2 03D7

        CMPR    R6,     R7                      ; DEB6   0177
        ANDR    R6,     R2                      ; DEB7   01B2
        XOR@    R6,     R5                      ; DEB8   03F5
        XOR@    R4,     R0                      ; DEB9   03E0
        XOR@    R6,     R2                      ; DEBA   03F2
        XOR@    R5,     R4                      ; DEBB   03EC
        SLL     R2,     1                       ; DEBC   004A
        XOR@    R6,     R5                      ; DEBD   03F5
        XOR@    R4,     R0                      ; DEBE   03E0
        SUBR    R6,     R2                      ; DEBF   0132
        CMPR    R2,     R6                      ; DEC0   0156
        MOVR    R1,     R7                      ; DEC1   008F
        MOVR    R3,     R7                      ; DEC2   009F

        DECLE   $0027                           ; DEC3   0027

        EIS                                     ; DEC4   0002
        MVO     R2,     G_03F5                  ; DEC5   0242 03F5
        XOR@    R4,     R0                      ; DEC7   03E0
        XOR@    R5,     R4                      ; DEC8   03EC
        ADCR    R2                              ; DEC9   002A
        XOR@    R6,     R6                      ; DECA   03F6
        XOR@    R4,     R0                      ; DECB   03E0
        GSWD    R2                              ; DECC   0032
        XOR@    R2,     R2                      ; DECD   03D2
L_DECE:
        MOVR    R7,     R5                      ; DECE   00BD
        ADCR    R5                              ; DECF   002D
        ANDR    R2,     R2                      ; DED0   0192
        CMPR    R0,     R2                      ; DED1   0142
        XOR@    R6,     R6                      ; DED2   03F6
        XOR@    R4,     R0                      ; DED3   03E0
        SLL     R2,     1                       ; DED4   004A
        XOR@    R6,     R3                      ; DED5   03F3
        XOR@    R4,     R0                      ; DED6   03E0
        ADD@    R6,     R7                      ; DED7   02F7

        DECLE   $0255,  $03F3,  $03E0,  $00D2   ; DED8   0255 03F3 03E0 00D2
        DECLE   $00B2,  $0022,  $0152,  $0242   ; DEDC   00B2 0022 0152 0242
        DECLE   $03E0,  $0000                   ; DEE0   03E0 0000

        MOVR    R1,     R2                      ; DEE2   008A
        BGE     L_DF8A                          ; DEE3   020D 00A5

        MOVR    R6,     R5                      ; DEE5   00B5
        RRC     R3,     1                       ; DEE6   0073
        MOVR    R4,     R3                      ; DEE7   00A3
        INCR    R7                              ; DEE8   000F

        DECR    R6                              ; DEE9   0016
L_DEEA:
        RLC     R1,     2                       ; DEEA   0055
        DECLE   $004F,  $005F,  $0187,  $003D   ; DEEB   004F 005F 0187 003D
        DECLE   $018E,  $013F                   ; DEEF   018E 013F

        GSWD    R3                              ; DEF1   0033
        CMPR    R2,     R3                      ; DEF2   0153
L_DEF3:
        NEGR    R6                              ; DEF3   0026
        DECLE   $03FF,  $03E0,  $03F4,  $03D5   ; DEF4   03FF 03E0 03F4 03D5
        DECLE   $0187,  $03F6,  $03E0,  $0162   ; DEF8   0187 03F6 03E0 0162
        DECLE   $0182,  $021E,  $01C7,  $00F7   ; DEFC   0182 021E 01C7 00F7

        B       L_DB0A                          ; DF00   0220 03F7

        XOR@    R2,     R5                      ; DF02   03D5
        CMPR    R0,     R7                      ; DF03   0147
        XOR@    R4,     R0                      ; DF04   03E0
        ADD@    R6,     R7                      ; DF05   02F7

        DECLE   $0255,  $03F2,  $03E0,  $0182   ; DF06   0255 03F2 03E0 0182
        DECLE   $0132,  $0133,  $0173,  $03F2   ; DF0A   0132 0133 0173 03F2
        DECLE   $03D7,  $0097,  $03F3,  $03D5   ; DF0E   03D7 0097 03F3 03D5
        DECLE   $00EA,  $008A,  $03F3,  $03EC   ; DF12   00EA 008A 03F3 03EC
        DECLE   $03F5,  $03E0,  $0032,  $0033   ; DF16   03F5 03E0 0032 0033
        DECLE   $0143,  $03F3,  $03D7,  $0027   ; DF1A   0143 03F3 03D7 0027
        DECLE   $03D5,  $00EA,  $008A,  $03F5   ; DF1E   03D5 00EA 008A 03F5
        DECLE   $03EC,  $03F5,  $03E0,  $0007   ; DF22   03EC 03F5 03E0 0007
        DECLE   $0215,  $03F3,  $03D7,  $0047   ; DF26   0215 03F3 03D7 0047
        DECLE   $00EA,  $008A,  $03F7,  $03EC   ; DF2A   00EA 008A 03F7 03EC
        DECLE   $03F4,  $03E0,  $0067,  $0201   ; DF2E   03F4 03E0 0067 0201
        DECLE   $03F3,  $03D7,  $0211,  $006A   ; DF32   03F3 03D7 0211 006A
        DECLE   $03F9,  $03EC,  $03F3,  $03E0   ; DF36   03F9 03EC 03F3 03E0
        DECLE   $0007,  $03F4,  $03D7,  $0047   ; DF3A   0007 03F4 03D7 0047
        DECLE   $006A,  $03FA,  $03EC,  $03F2   ; DF3E   006A 03FA 03EC 03F2
        DECLE   $03E0,  $0067,  $03F4,  $03D7   ; DF42   03E0 0067 03F4 03D7
        DECLE   $0221,  $006A,  $03FB,  $03EC   ; DF46   0221 006A 03FB 03EC
        DECLE   $0152,  $0123,  $0013,  $03F3   ; DF4A   0152 0123 0013 03F3
        DECLE   $03D7                           ; DF4E   03D7

        DIS                                     ; DF4F   0003
        INCR    R1                              ; DF50   0009
        XORI    #$03EC, R4                      ; DF51   03FC 03EC
        SETC                                    ; DF53   0007
        MOVR    R1,     R7                      ; DF54   008F
        MOVR    R3,     R7                      ; DF55   009F

        DECLE   $03F2,  $03D7,  $0063,  $0009   ; DF56   03F2 03D7 0063 0009
        DECLE   $03FD,  $03EC,  $0153,  $003D   ; DF5A   03FD 03EC 0153 003D
        DECLE   $03DE,  $017F,  $0003,  $0069   ; DF5E   03DE 017F 0003 0069
        DECLE   $03FE,  $03EC,  $0037,  $0033   ; DF62   03FE 03EC 0037 0033
        DECLE   $0193,  $0026,  $0009,  $03FF   ; DF66   0193 0026 0009 03FF
        DECLE   $03EC,  $0000,  $00CC,  $025F   ; DF6A   03EC 0000 00CC 025F
        DECLE   $00E5,  $0037                   ; DF6E   00E5 0037

        MOVR    R1,     R0                      ; DF70   0088
        DECR    R3                              ; DF71   0013
L_DF72:
        DECR    R7                              ; DF72   0017

        DECLE   $008E,  $001D,  $0187           ; DF73   008E 001D 0187

        INCR    R7                              ; DF76   000F

        COMR    R6                              ; DF77   001E
L_DF78:
        INCR    R7                              ; DF78   000F

        ADDR    R5,     R5                      ; DF79   00ED
L_DF7A:
        ANDR    R1,     R6                      ; DF7A   018E
        DECLE   $003D,  $00CD,  $002E,  $03F5   ; DF7B   003D 00CD 002E 03F5
        DECLE   $03E0,  $000A,  $03F2,  $03DA   ; DF7F   03E0 000A 03F2 03DA
        DECLE   $0049,  $0043,  $03D7,  $0221   ; DF83   0049 0043 03D7 0221

        SLLC    R3,     1                       ; DF87   005B
        XOR@    R6,     R2                      ; DF88   03F2
        XOR@    R3,     R2                      ; DF89   03DA
L_DF8A:
        SLL     R2,     1                       ; DF8A   004A
        XOR@    R4,     R0                      ; DF8B   03E0
        ADD@    R6,     R7                      ; DF8C   02F7

        DECLE   $0255,  $03F2,  $03E0,  $0187   ; DF8D   0255 03F2 03E0 0187
        DECLE   $03F2,  $03D5,  $000A,  $03F3   ; DF91   03F2 03D5 000A 03F3
        DECLE   $03DA,  $0023,  $03D7,  $01B3   ; DF95   03DA 0023 03D7 01B3
        DECLE   $0193,  $0211,  $03DA,  $004B   ; DF99   0193 0211 03DA 004B
        DECLE   $0035,  $03F5,  $03E0,  $0147   ; DF9D   0035 03F5 03E0 0147
        DECLE   $03F2,  $03D5,  $003A,  $03F2   ; DFA1   03F2 03D5 003A 03F2
        DECLE   $03DA,  $004B,  $03F3,  $03D7   ; DFA5   03DA 004B 03F3 03D7
        DECLE   $0211,  $0235,  $03DA,  $0201   ; DFA9   0211 0235 03DA 0201
        DECLE   $03D7                           ; DFAD   03D7

        INCR    R7                              ; DFAE   000F

        COMR    R6                              ; DFAF   001E
L_DFB0:
        XOR@    R6,     R3                      ; DFB0   03F3
        DECLE   $03E0,  $03F2,  $03D5,  $0208   ; DFB1   03E0 03F2 03D5 0208
        DECLE   $0220,  $03F2,  $03DA,  $0201   ; DFB5   0220 03F2 03DA 0201
        DECLE   $03D7,  $01F6,  $03D7,  $022F   ; DFB9   03D7 01F6 03D7 022F
        DECLE   $0211                           ; DFBD   0211

        XOR@    R3,     R2                      ; DFBE   03DA
        DECR    R3                              ; DFBF   0013
        INCR    R7                              ; DFC0   000F

        SUBR    R5,     R5                      ; DFC1   012D
L_DFC2:
        XOR@    R3,     R6                      ; DFC2   03DE
        DECLE   $03F3,  $03E0,  $000A,  $001A   ; DFC3   03F3 03E0 000A 001A
        DECLE   $023E,  $006A,  $03F2,  $03DA   ; DFC7   023E 006A 03F2 03DA
        DECLE   $03F4,  $03D7,  $0201,  $006B   ; DFCB   03F4 03D7 0201 006B
        DECLE   $03DA,  $0079,  $003D,  $010D   ; DFCF   03DA 0079 003D 010D
        DECLE   $002E,  $03F2,  $03E0,  $000A   ; DFD3   002E 03F2 03E0 000A
        DECLE   $03F5,  $03DA,  $002B,  $03D7   ; DFD7   03F5 03DA 002B 03D7
        DECLE   $0003,  $0173,  $0221,  $01BB   ; DFDB   0003 0173 0221 01BB
        DECLE   $03F3,  $03DA,  $0079,  $0022   ; DFDF   03F3 03DA 0079 0022
        DECLE   $03F3,  $03E0,  $03F4,  $03DA   ; DFE3   03F3 03E0 03F4 03DA
        DECLE   $002B,  $023F,  $03D7,  $0153   ; DFE7   002B 023F 03D7 0153
        DECLE   $0023,  $03D7,  $01F6,  $03D7   ; DFEB   0023 03D7 01F6 03D7
        DECLE   $00B3,  $0059,  $03F8,  $03DA   ; DFEF   00B3 0059 03F8 03DA
        DECLE   $0029,  $0173,  $0231           ; DFF3   0029 0173 0231

        XORI    #$03D7, R0                      ; DFF6   03F8 03D7
L_DFF8:
        GSWD    R3                              ; DFF8   0033
        RSWD    R1                              ; DFF9   0039
        XOR@    R6,     R6                      ; DFFA   03F6
        XOR@    R3,     R2                      ; DFFB   03DA
        SLL     R1,     1                       ; DFFC   0049
        SWAP    R3,     1                       ; DFFD   0043
        XOR@    R6,     R2                      ; DFFE   03F2
        DECLE   $03D7                           ; DFFF   03D7

        ORG     $F000
        DECLE   $00C6,  $00D6,  $03F3,  $03D7   ; F000   00C6 00D6 03F3 03D7
        DECLE   $0003,  $0193,  $03D7,  $0243   ; F004   0003 0193 03D7 0243
        DECLE   $0033,  $0059,  $03F5,  $03DA   ; F008   0033 0059 03F5 03DA
        DECLE   $0143,  $03F3,  $03D7,  $00B3   ; F00C   0143 03F3 03D7 00B3
        DECLE   $0069,  $009B,  $0163,  $03D7   ; F010   0069 009B 0163 03D7
        DECLE   $0106,  $03F3,  $03D7,  $0063   ; F014   0106 03F3 03D7 0063
        DECLE   $0069,  $03F5,  $03DA,  $0163   ; F018   0069 03F5 03DA 0163
        DECLE   $03D7,  $01F6,  $03D7,  $006B   ; F01C   03D7 01F6 03D7 006B
        DECLE   $03F2,  $03DA,  $0079,  $0073   ; F020   03F2 03DA 0079 0073
        DECLE   $03F2,  $03D7,  $0243,  $0063   ; F024   03F2 03D7 0243 0063
        DECLE   $0069,  $03F6,  $03DA,  $0079   ; F028   0069 03F6 03DA 0079
        DECLE   $0073,  $03D7,  $006B,  $03F4   ; F02C   0073 03D7 006B 03F4
        DECLE   $03DA,  $0099,  $03F3,  $01C9   ; F030   03DA 0099 03F3 01C9
        DECLE   $0089,  $03F6,  $03DA,  $0000   ; F034   0089 03F6 03DA 0000

        ADDR    R0,     R4                      ; F038   00C4
        MVI@    R2,     R6                      ; F039   0296
        ADDR    R0,     R5                      ; F03A   00C5
        NEGR    R4                              ; F03B   0024
        CLRC                                    ; F03C   0006
        COMR    R3                              ; F03D   001B
L_F03E:
        DECR    R7                              ; F03E   0017

        DECLE   $0094,  $0015,  $0122,  $004E   ; F03F   0094 0015 0122 004E
        DECLE   $001E,  $011D,  $00ED,  $002E   ; F043   001E 011D 00ED 002E
        DECLE   $0032,  $0124,  $0152,  $03FA   ; F047   0032 0124 0152 03FA
        DECLE   $03E0,  $008A,  $001A,  $03FA   ; F04B   03E0 008A 001A 03FA
        DECLE   $03E0,  $0167,  $03F2,  $03E0   ; F04F   03E0 0167 03F2 03E0
        DECLE   $03F5,  $0220                   ; F053   03F5 0220

        XOR@    R6,     R2                      ; F055   03F2
        XOR@    R3,     R2                      ; F056   03DA
        MOVR    R3,     R2                      ; F057   009A
        ADDR    R7,     R2                      ; F058   00FA
L_F059:
        XOR@    R6,     R2                      ; F059   03F2
        DECLE   $03E0,  $0162,  $008E,  $001E   ; F05A   03E0 0162 008E 001E
        DECLE   $03F2,  $03E0,  $03D5,  $0147   ; F05E   03F2 03E0 03D5 0147
        DECLE   $03D5,  $03D5,  $03F5,  $0208   ; F062   03D5 03D5 03F5 0208
        DECLE   $03F4,  $03DA,  $001A,  $01B2   ; F066   03F4 03DA 001A 01B2
        DECLE   $015D,  $012D,  $002E,  $03E0   ; F06A   015D 012D 002E 03E0
        DECLE   $03DA,  $001A,  $03F3,  $03D5   ; F06E   03DA 001A 03F3 03D5
        DECLE   $03F5,  $021E                   ; F072   03F5 021E

        XOR@    R6,     R2                      ; F074   03F2
        XOR@    R3,     R2                      ; F075   03DA
        ADDR    R1,     R2                      ; F076   00CA
        SLLC    R2,     1                       ; F077   005A
        XOR@    R3,     R2                      ; F078   03DA
        COMR    R2                              ; F079   001A
        GSWD    R2                              ; F07A   0032
        CMPR    R4,     R4                      ; F07B   0164
        ANDR    R2,     R2                      ; F07C   0192
        XOR@    R4,     R0                      ; F07D   03E0
        XOR@    R6,     R2                      ; F07E   03F2
        XOR@    R3,     R2                      ; F07F   03DA
        COMR    R2                              ; F080   001A
        XOR@    R2,     R5                      ; F081   03D5
        SKIP                                    ; F082   0208
        XOR@    R6,     R5                      ; F083   03F5
L_F084:
        XOR@    R4,     R0                      ; F084   03E0
        DECLE   $03F2,  $03DA,  $001A,  $0152   ; F085   03F2 03DA 001A 0152
        DECLE   $0059,  $03DA,  $001A,  $03F2   ; F089   0059 03DA 001A 03F2
        DECLE   $03D5,  $03E0,  $03F3,  $03DA   ; F08D   03D5 03E0 03F3 03DA
        DECLE   $001A,  $020E,  $03F5,  $03E0   ; F091   001A 020E 03F5 03E0
        DECLE   $03F3,  $03DA,  $0218           ; F095   03F3 03DA 0218

        DECR    R4                              ; F098   0014
        SLLC    R1,     1                       ; F099   0059
        XOR@    R3,     R2                      ; F09A   03DA
        COMR    R2                              ; F09B   001A
        XOR@    R6,     R2                      ; F09C   03F2
        XOR@    R4,     R0                      ; F09D   03E0
        XOR@    R6,     R3                      ; F09E   03F3
        XOR@    R3,     R2                      ; F09F   03DA
        MOVR    R5,     R2                      ; F0A0   00AA
        XOR@    R2,     R5                      ; F0A1   03D5
        XOR@    R6,     R3                      ; F0A2   03F3
        XOR@    R4,     R0                      ; F0A3   03E0
        INCR    R2                              ; F0A4   000A
        XOR@    R6,     R3                      ; F0A5   03F3
        XOR@    R3,     R2                      ; F0A6   03DA
        ADCR    R2                              ; F0A7   002A
        B       L_F084                          ; F0A8   0220 0025

        GSWD    R3                              ; F0AA   0033
        RSWD    R1                              ; F0AB   0039
        XOR@    R6,     R5                      ; F0AC   03F5
        XOR@    R3,     R2                      ; F0AD   03DA
        SUBR    R3,     R2                      ; F0AE   011A
        ADDR    R4,     R2                      ; F0AF   00E2
        MOVR    R0,     R7                      ; F0B0   0087
        MOVR    R2,     R7                      ; F0B1   0097
        MOVR    R0,     R7                      ; F0B2   0087

        DECLE   $0055,  $013A,  $03F2,  $03DA   ; F0B3   0055 013A 03F2 03DA
        DECLE   $002A,  $00A5,  $00C5,  $03F2   ; F0B7   002A 00A5 00C5 03F2
        DECLE   $03D7,  $0096,  $01C6,  $0086   ; F0BB   03D7 0096 01C6 0086
        DECLE   $03E0,  $03F2,  $03DA,  $0049   ; F0BF   03E0 03F2 03DA 0049
        DECLE   $0006,  $03F4,  $03D7,  $013B   ; F0C3   0006 03F4 03D7 013B
        DECLE   $03DA,  $002A,  $0045,  $03F6   ; F0C7   03DA 002A 0045 03F6
        DECLE   $03D7,  $0065,  $03E0,  $03F2   ; F0CB   03D7 0065 03E0 03F2
        DECLE   $03DA,  $0079,  $0073,  $03F3   ; F0CF   03DA 0079 0073 03F3
        DECLE   $03D7,  $015B,  $03DA,  $011A   ; F0D3   03D7 015B 03DA 011A
        DECLE   $03D5,  $03F5,  $03D7,  $00E5   ; F0D7   03D5 03F5 03D7 00E5
        DECLE   $0085,  $03F2,  $03E0,  $03F3   ; F0DB   0085 03F2 03E0 03F3
        DECLE   $03DA,  $0079,  $0073,  $03F2   ; F0DF   03DA 0079 0073 03F2
        DECLE   $03D7,  $006B,  $03DA,  $002A   ; F0E3   03D7 006B 03DA 002A
        DECLE   $03D5,  $0075,  $03F2,  $03D7   ; F0E7   03D5 0075 03F2 03D7

        ADDR    R4,     R5                      ; F0EB   00E5
        MOVR    R0,     R5                      ; F0EC   0085
        XOR@    R6,     R4                      ; F0ED   03F4
        XOR@    R4,     R0                      ; F0EE   03E0
        XOR@    R6,     R4                      ; F0EF   03F4
        XOR@    R3,     R2                      ; F0F0   03DA
        SUBR    R1,     R1                      ; F0F1   0109
        TSTR    R3                              ; F0F2   009B
        MOVR    R1,     R3                      ; F0F3   008B
        XOR@    R3,     R2                      ; F0F4   03DA
        ADCR    R2                              ; F0F5   002A
        XORI    #$03E0, R0                      ; F0F6   03F8 03E0
        ADD@    R6,     R7                      ; F0F8   02F7

        DECLE   $0255,  $03E0,  $0000           ; F0F9   0255 03E0 0000

        MOVR    R4,     R0                      ; F0FC   00A0
        BGT     L_F059                          ; F0FD   022E 00A5

        DECR    R5                              ; F0FF   0015
        SARC    R0,     1                       ; F100   0078
        TSTR    R3                              ; F101   009B
        ADCR    R0                              ; F102   0028
        COMR    R2                              ; F103   001A
        COMR    R1                              ; F104   0019
        MOVR    R1,     R3                      ; F105   008B
        CMPR    R1,     R7                      ; F106   014F
        TSTR    R3                              ; F107   009B
        COMR    R3                              ; F108   001B
        ANDR    R1,     R6                      ; F109   018E
        CMPR    R3,     R7                      ; F10A   015F
        ADDR    R3,     R3                      ; F10B   00DB
        CMPR    R5,     R7                      ; F10C   016F
        MOVR    R5,     R3                      ; F10D   00AB
        XORI    #$03EC, R5                      ; F10E   03FD 03EC
        SARC    R2,     1                       ; F110   007A
        XOR@    R6,     R2                      ; F111   03F2
        XOR@    R4,     R0                      ; F112   03E0
        ADD@    R6,     R7                      ; F113   02F7

        DECLE   $0255,  $03F2,  $03E0,  $03EC   ; F114   0255 03F2 03E0 03EC
        DECLE   $00CB,  $018F,  $00DB,  $03F5   ; F118   00CB 018F 00DB 03F5
        DECLE   $03EC,  $004B,  $005B,  $03F3   ; F11C   03EC 004B 005B 03F3
        DECLE   $03EC,  $007A,  $03F5,  $03E0   ; F120   03EC 007A 03F5 03E0
        DECLE   $03EC,  $001B,  $03DE,  $019F   ; F124   03EC 001B 03DE 019F
        DECLE   $013B,  $03F3,  $03EC,  $004B   ; F128   013B 03F3 03EC 004B
        DECLE   $03D7,  $006B,  $03F4,  $03EC   ; F12C   03D7 006B 03F4 03EC
        DECLE   $007A,  $03D5,  $03F3,  $03E0   ; F130   007A 03D5 03F3 03E0
        DECLE   $03EC,  $011B,  $01AF,  $00EB   ; F134   03EC 011B 01AF 00EB
        DECLE   $03F4,  $03EC,  $007B,  $006B   ; F138   03F4 03EC 007B 006B
        DECLE   $03F6,  $03EC,  $007A,  $03D5   ; F13C   03F6 03EC 007A 03D5
        DECLE   $0187,  $03E0,  $03F3,  $03EC   ; F140   0187 03E0 03F3 03EC
        DECLE   $0049,  $0043,  $005B,  $03FB   ; F144   0049 0043 005B 03FB
        DECLE   $03EC,  $007A,  $01A7,  $03E0   ; F148   03EC 007A 01A7 03E0
        DECLE   $03F3,  $03EC,  $0043,  $03F2   ; F14C   03F3 03EC 0043 03F2
        DECLE   $03D7,  $005B,  $03F2,  $03EC   ; F150   03D7 005B 03F2 03EC
        DECLE   $004B,  $03D7,  $005B,  $03F6   ; F154   004B 03D7 005B 03F6
        DECLE   $03EC,  $007A,  $03E0,  $03F7   ; F158   03EC 007A 03E0 03F7
        DECLE   $03D7,  $005B,  $03EC,  $007B   ; F15C   03D7 005B 03EC 007B
        DECLE   $03D7,  $01BB,  $03F7,  $03EC   ; F160   03D7 01BB 03F7 03EC
        DECLE   $007A,  $03F5,  $03E1,  $03F3   ; F164   007A 03F5 03E1 03F3
        DECLE   $03D7,  $005B,  $03EC,  $007B   ; F168   03D7 005B 03EC 007B
        DECLE   $006B,  $03EC,  $0049,  $0059   ; F16C   006B 03EC 0049 0059
        DECLE   $03F5,  $03EC,  $03F5,  $03E1   ; F170   03F5 03EC 03F5 03E1
        DECLE   $03F4,  $03D7,  $003B,  $03F2   ; F174   03F4 03D7 003B 03F2
        DECLE   $03EC,  $002B,  $03D7,  $0053   ; F178   03EC 002B 03D7 0053
        DECLE   $0059,  $03F3,  $03EC,  $002A   ; F17C   0059 03F3 03EC 002A
        DECLE   $03F6,  $03E1,  $03F9,  $03D7   ; F180   03F6 03E1 03F9 03D7
        DECLE   $0053,  $0059,  $03EC,  $002A   ; F184   0053 0059 03EC 002A
        DECLE   $03E0,  $03F7,  $03E1,  $03F9   ; F188   03E0 03F7 03E1 03F9
        DECLE   $03D7,  $0053,  $0054,  $03F2   ; F18C   03D7 0053 0054 03F2
        DECLE   $03E0,  $03F9,  $03E1,  $00A6   ; F190   03E0 03F9 03E1 00A6
        DECLE   $01D6,  $00B6,  $03F5,  $03E1   ; F194   01D6 00B6 03F5 03E1
        DECLE   $0053,  $0054,  $03E0,  $0000   ; F198   0053 0054 03E0 0000
        DECLE   $0092,  $027F,  $0005,  $000A   ; F19C   0092 027F 0005 000A
        DECLE   $0016,  $0023,  $0058,  $0062   ; F1A0   0016 0023 0058 0062
        DECLE   $0015,  $0007,  $0123,  $0187   ; F1A4   0015 0007 0123 0187
        DECLE   $017F,  $005D,  $0153,  $001B   ; F1A8   017F 005D 0153 001B
        DECLE   $007F,  $015F,  $03F9,  $03E0   ; F1AC   007F 015F 03F9 03E0
        DECLE   $016A,  $0007,  $0163,  $03D7   ; F1B0   016A 0007 0163 03D7
L_F1B4:
        DECR    R7                              ; F1B4   0017

        DECLE   $00A5,  $01D5,  $00B5,  $03FB   ; F1B5   00A5 01D5 00B5 03FB
        DECLE   $03E0,  $015A,  $011B,  $01BF   ; F1B9   03E0 015A 011B 01BF
        DECLE   $009D,  $0193,  $03F5,  $03D7   ; F1BD   009D 0193 03F5 03D7
L_F1C1:
        DECR    R7                              ; F1C1   0017

        DECLE   $03FA,  $03E0,  $03DA,  $001B   ; F1C2   03FA 03E0 03DA 001B
        DECLE   $00BF,  $019F,  $00E5,  $00F5   ; F1C6   00BF 019F 00E5 00F5
        DECLE   $024B,  $03F3,  $03D7,  $0177   ; F1CA   024B 03F3 03D7 0177
        DECLE   $03F7                           ; F1CE   03F7

        XOR@    R4,     R0                      ; F1CF   03E0
        ADD@    R6,     R7                      ; F1D0   02F7

        DECLE   $0255,  $005A,  $002A,  $03F3   ; F1D1   0255 005A 002A 03F3
        DECLE   $03E0,  $0208,  $015A,  $024B   ; F1D5   03E0 0208 015A 024B
        DECLE   $03D7,  $01F6,  $0177,  $03FE   ; F1D9   03D7 01F6 0177 03FE
        DECLE   $03E0,  $020E,  $000A,  $03F3   ; F1DD   03E0 020E 000A 03F3
        DECLE   $024B,  $001A,  $03FD,  $03E0   ; F1E1   024B 001A 03FD 03E0
        DECLE   $0210,  $000A,  $011A,  $0195   ; F1E5   0210 000A 011A 0195
        DECLE   $03D7,  $015B,  $03DA,  $03FC   ; F1E9   03D7 015B 03DA 03FC
        DECLE   $03E0,  $016A,  $00EA,  $03DA   ; F1ED   03E0 016A 00EA 03DA
        DECLE   $011B,  $03F2,  $03D7,  $01B5   ; F1F1   011B 03F2 03D7 01B5
        DECLE   $013A,  $03FB,  $03E0,  $015A   ; F1F5   013A 03FB 03E0 015A
        DECLE   $03DA,  $00AB,  $00CB,  $014B   ; F1F9   03DA 00AB 00CB 014B
        DECLE   $03F2,  $03D7,  $000B,  $002A   ; F1FD   03F2 03D7 000B 002A
        DECLE   $03F7,  $03E0,  $0228,  $023E   ; F201   03F7 03E0 0228 023E
        DECLE   $0217,  $0200,  $00E7,  $014B   ; F205   0217 0200 00E7 014B
        DECLE   $03F4,  $03D7,  $00EB,  $03DA   ; F209   03F4 03D7 00EB 03DA
        DECLE   $001A,  $03F3,  $03E0,  $0187   ; F20D   001A 03F3 03E0 0187

        XOR@    R2,     R5                      ; F211   03D5
        XOR@    R6,     R5                      ; F212   03F5
        XORR    R4,     R5                      ; F213   01E5
        MOVR    R0,     R7                      ; F214   0087

        DECLE   $03F4,  $03D7,  $00EB,  $008B   ; F215   03F4 03D7 00EB 008B
        DECLE   $03F3,  $03DA,  $03F3,  $03E0   ; F219   03F3 03DA 03F3 03E0
        DECLE   $01A7,  $03D5,  $03F5,  $01E5   ; F21D   01A7 03D5 03F5 01E5
        DECLE   $0037,  $03F3,  $03D7,  $000B   ; F221   0037 03F3 03D7 000B
        DECLE   $03F5,  $03DA,  $03FD,  $03E0   ; F225   03F5 03DA 03FD 03E0
        DECLE   $0147,  $003A,  $03F5,  $03DA   ; F229   0147 003A 03F5 03DA
        DECLE   $0000                           ; F22D   0000

        MVI@    R5,     R4                      ; F22E   02AC
        PSHR    R5                              ; F22F   0275
        MVII    #$0001, R5                      ; F230   02BD 0001
        MVO     R5,     G_0147                  ; F232   0245 0147
        ADDR    R4,     R4                      ; F234   00E4
        SDBD                                    ; F235   0001
        ADDI    #$A23E, R4                      ; F236   02FC 003E 00A2
        SDBD                                    ; F239   0001
        MVI@    R4,     R5                      ; F23A   02A5
        J       X_PLAY_SFX1                     ; F23B   0004 0318 03BB

        DECLE   $000E,  $0016,  $00D9,  $001E   ; F23E   000E 0016 00D9 001E
        DECLE   $00C8,  $001E,  $0021,  $001F   ; F242   00C8 001E 0021 001F
        DECLE   $0058,  $00A2,  $0062,  $00A2   ; F246   0058 00A2 0062 00A2
        DECLE   $006C,  $00A2,  $008B,  $00A2   ; F24A   006C 00A2 008B 00A2
        DECLE   $007D,  $00A2,  $00A9,  $00A2   ; F24E   007D 00A2 00A9 00A2
        DECLE   $00C0,  $006F,  $00A1,  $00A2   ; F252   00C0 006F 00A1 00A2
        DECLE   $00DC,  $006F,  $03E9,  $0005   ; F256   00DC 006F 03E9 0005
        DECLE   $000C,  $0080,  $002B,  $0040   ; F25A   000C 0080 002B 0040
        DECLE   $001D,  $000B,  $012B,  $03CF   ; F25E   001D 000B 012B 03CF
        DECLE   $03E9,  $0005,  $000C,  $0080   ; F262   03E9 0005 000C 0080
        DECLE   $002B,  $0040,  $0028,  $000B   ; F266   002B 0040 0028 000B
        DECLE   $012B,  $03CF,  $012F,  $0379   ; F26A   012B 03CF 012F 0379
        DECLE   $0205,  $0132,  $00AD,  $006B   ; F26E   0205 0132 00AD 006B
        DECLE   $02D2,  $02AD,  $00AB,  $0062   ; F272   02D2 02AD 00AB 0062
        DECLE   $000F                           ; F276   000F

        XORI    #$026B, R4                      ; F277   03FC 026B
        AND     .BTAB.6B,R2                     ; F279   0382 026B
        XORI    #$02CF, R1                      ; F27B   03F9 02CF
        CMPI    #$00B7, R1                      ; F27D   0379 00B7
        COMR    R4                              ; F27F   001C
        XOR@    R2,     R0                      ; F280   03D0
        SLL     R1,     2                       ; F281   004D
        INCR    R3                              ; F282   000B
        ADCR    R3                              ; F283   002B
        XOR@    R1,     R5                      ; F284   03CD
        SAR     R3,     1                       ; F285   006B
        MOVR    R1,     R5                      ; F286   008D
        INCR    R7                              ; F287   000F

        EIS                                     ; F288   0002
L_F289:
        SUBR    R5,     R3                      ; F289   012B
        ADD@    R1,     R7                      ; F28A   02CF

        DECLE   $02E9,  $0140,  $01FA,  $0001   ; F28B   02E9 0140 01FA 0001
        DECLE   $03DC,  $036D,  $000F           ; F28F   03DC 036D 000F

        XORI    #$0165, R6                      ; F292   03FE 0165
        DECR    R2                              ; F294   0012
        ADCR    R2                              ; F295   002A
        MOVR    R1,     R7                      ; F296   008F

        DECLE   $001A,  $0001                   ; F297   001A 0001

        ADCR    R0                              ; F299   0028
        INCR    R7                              ; F29A   000F

        DECLE   $0004                           ; F29B   0004
L_F29C:
        XOR@    R5,     R2                      ; F29C   03EA
        XOR@    R6,     R2                      ; F29D   03F2
        MOVR    R1,     R7                      ; F29E   008F

        COMR    R5                              ; F29F   001D
        ADD@    R1,     R7                      ; F2A0   02CF

        MOVR    R1,     R5                      ; F2A1   008D
        INCR    R7                              ; F2A2   000F

        DECLE   $03FF                           ; F2A3   03FF
L_F2A4:
        SUB     G_03C2, R5                      ; F2A4   0305 03C2
        CMPI    #$01EB, R1                      ; F2A6   0379 01EB
        ADD@    R1,     R7                      ; F2A8   02CF

        DECLE   $0389,  $0040,  $0046,  $0048   ; F2A9   0389 0040 0046 0048
        DECLE   $002D,  $0044,  $005B,  $000C   ; F2AD   002D 0044 005B 000C
        DECLE   $0190,  $000B,  $03CF,  $0048   ; F2B1   0190 000B 03CF 0048
        DECLE   $001D,  $0046,  $0005,  $0057   ; F2B5   001D 0046 0005 0057
        DECLE   $000A,  $004E,  $001F,  $002A   ; F2B9   000A 004E 001F 002A
        DECLE   $0044,  $0013,  $0040,  $0038   ; F2BD   0044 0013 0040 0038
        DECLE   $0047,  $0001,  $004B,  $005C   ; F2C1   0047 0001 004B 005C
        DECLE   $0034,  $003F,  $0026,  $0056   ; F2C5   0034 003F 0026 0056
        DECLE   $0011,  $0019,  $0036,  $0002   ; F2C9   0011 0019 0036 0002
        DECLE   $0022,  $004D,  $0043,  $0027   ; F2CD   0022 004D 0043 0027

        INCR    R3                              ; F2D1   000B
        ADCR    R1                              ; F2D2   0029
        RLC     R0,     2                       ; F2D3   0054
        SLL     R2,     1                       ; F2D4   004A
        INCR    R6                              ; F2D5   000E
        ADCR    R3                              ; F2D6   002B
        SLL     R3,     2                       ; F2D7   004F
        RSWD    R2                              ; F2D8   003A
        CLRC                                    ; F2D9   0006
        ADCR    R0                              ; F2DA   0028
        GSWD    R3                              ; F2DB   0033
        SLLC    R2,     2                       ; F2DC   005E
        ADCR    R4                              ; F2DD   002C
        INCR    R5                              ; F2DE   000D
        SLLC    R0,     1                       ; F2DF   0058
        ADCR    R7                              ; F2E0   002F

        NEGR    R5                              ; F2E1   0025
L_F2E2:
        RLC     R2,     1                       ; F2E2   0052
        DECLE   $0020,  $0037                   ; F2E3   0020 0037

        DIS                                     ; F2E5   0003
        NEGR    R4                              ; F2E6   0024
        RLC     R1,     1                       ; F2E7   0051
L_F2E8:
        DECR    R7                              ; F2E8   0017

        RSWD    R3                              ; F2E9   003B
        SLLC    R1,     1                       ; F2EA   0059
        GSWD    R0                              ; F2EB   0030
        DECR    R4                              ; F2EC   0014
        RSWD    R4                              ; F2ED   003C
        SLL     R0,     2                       ; F2EE   004C
        INCR    R7                              ; F2EF   000F

        GSWD    R2                              ; F2F0   0032
L_F2F1:
        RSWD    R6                              ; F2F1   003E
        DECLE   $005D,  $0035                   ; F2F2   005D 0035

        SLR     R3,     1                       ; F2F4   0063
        RSWD    R5                              ; F2F5   003D
        SWAP    R1,     2                       ; F2F6   0045
        DECR    R5                              ; F2F7   0015
        SLR     R0,     1                       ; F2F8   0060
        GSWD    R1                              ; F2F9   0031
        COMR    R0                              ; F2FA   0018
        ADCR    R6                              ; F2FB   002E
        NEGR    R1                              ; F2FC   0021
        SLLC    R3,     1                       ; F2FD   005B
        SLL     R1,     1                       ; F2FE   0049
        DECR    R0                              ; F2FF   0010
        SWAP    R2,     1                       ; F300   0042
        COMR    R6                              ; F301   001E
        DECR    R6                              ; F302   0016
        RSWD    R1                              ; F303   0039
        SLLC    R2,     1                       ; F304   005A
        NEGR    R3                              ; F305   0023
        ADCR    R5                              ; F306   002D
        INCR    R4                              ; F307   000C
        SWAP    R1,     1                       ; F308   0041
        COMR    R2                              ; F309   001A
        RLC     R1,     2                       ; F30A   0055
        SETC                                    ; F30B   0007
        SLR     R1,     1                       ; F30C   0061
        COMR    R3                              ; F30D   001B
        PSHR    R5                              ; F30E   0275
        MVI     G_015E, R1                      ; F30F   0281 015E
        MOVR    R1,     R2                      ; F311   008A
        ADDI    #$01D3, R2                      ; F312   02FA 01D3
        MVI@    R2,     R2                      ; F314   0292
        MVO     R2,     G_01D8                  ; F315   0242 01D8
        ADDI    #$01C6, R1                      ; F317   02F9 01C6
        MVI@    R1,     R1                      ; F319   0289
        PSHR    R1                              ; F31A   0271
        MVII    #$0001, R5                      ; F31B   02BD 0001
        CMPI    #$000C, R1                      ; F31D   0379 000C
        BNEQ    L_F323                          ; F31F   020C 0002

        XORI    #$0004, R5                      ; F321   03FD 0004
L_F323:
        MVO     R5,     G_01E7                  ; F323   0245 01E7
        DECLE   $0001,  $02F9,  $00A5,  $00AE   ; F325   0001 02F9 00A5 00AE
        DECLE   $0289,  $0280,  $01C4,  $0004   ; F329   0289 0280 01C4 0004
        DECLE   $01A4,  $0209,  $0004,  $01A4   ; F32D   01A4 0209 0004 01A4
        DECLE   $0235,  $02B1,  $0001           ; F331   0235 02B1 0001

        ADDI    #$00B3, R1                      ; F334   02F9 00B3
        MOVR    R5,     R6                      ; F336   00AE
        MVI@    R1,     R1                      ; F337   0289
        MOVR    R0,     R3                      ; F338   0083
        MVI     G_01D8, R2                      ; F339   0282 01D8
        INCR    R2                              ; F33B   000A
        ADDR    R7,     R2                      ; F33C   00FA
        ADD@    R2,     R7                      ; F33D   02D7

        DECLE   $0036,  $0036,  $0033,  $0036   ; F33E   0036 0036 0033 0036
        DECLE   $000D,  $0036,  $002E,  $0036   ; F342   000D 0036 002E 0036
        DECLE   $0036,  $001F,  $001F,  $001F   ; F346   0036 001F 001F 001F
        DECLE   $001F                           ; F34A   001F

        SLR     R3,     2                       ; F34B   0067
        PSHR    R0                              ; F34C   0270
        PSHR    R1                              ; F34D   0271
        PSHR    R3                              ; F34E   0273

        JSR     R5,     L_6D77                  ; F34F   0004 016C 0177

        CMPI    #$0032, R0                      ; F352   0378 0032
        PULR    R3                              ; F354   02B3
        PULR    R1                              ; F355   02B1
        PULR    R0                              ; F356   02B0
        BLT     L_F35A                          ; F357   0205 0001

        SLR     R3,     1                       ; F359   0063
L_F35A:
        SUBR    R3,     R0                      ; F35A   0118
        B       L_F374                          ; F35B   0200 0017

        PSHR    R0                              ; F35D   0270
        MVII    #$0007, R0                      ; F35E   02B8 0007

        JSR     R5,     X_RAND2                 ; F360   0004 0114 029E

        SUBI    #$0003, R0                      ; F363   0338 0003
        ADDR    R0,     R1                      ; F365   00C1
        TSTR    R1                              ; F366   0089
        BGT     L_F36B                          ; F367   020E 0002

        MVII    #$0001, R1                      ; F369   02B9 0001
L_F36B:
        PULR    R0                              ; F36B   02B0
        SLR     R3,     2                       ; F36C   0067
        SLR     R3,     2                       ; F36D   0067
        SUBR    R3,     R0                      ; F36E   0118
        B       L_F374                          ; F36F   0200 0003

        SLR     R3,     2                       ; F371   0067
        SLR     R3,     2                       ; F372   0067
        ADDR    R3,     R0                      ; F373   00D8
L_F374:
        MVO     R0,     G_0350                  ; F374   0240 0350
        DECLE   $0241,  $01E8,  $0004           ; F376   0241 01E8 0004

        ANDR    R4,     R4                      ; F379   01A4
        ANDR    R4,     R4                      ; F37A   01A4
        CLRR    R0                              ; F37B   01C0
        MVO     R0,     G_0351                  ; F37C   0240 0351
        MVI     G_015E, R4                      ; F37E   0284 015E
        ADDI    #$01D1, R4                      ; F380   02FC 01D1
        MVI@    R4,     R4                      ; F382   02A4
        SDBD                                    ; F383   0001
        ADDI    #$AEC1, R4                      ; F384   02FC 00C1 00AE
        MVI@    R4,     R0                      ; F387   02A0
        MVI     G_01D8, R1                      ; F388   0281 01D8
        CMPI    #$0006, R1                      ; F38A   0379 0006
        BNEQ    L_F39D                          ; F38C   020C 000F

        PSHR    R0                              ; F38E   0270
        MVII    #$001F, R0                      ; F38F   02B8 001F

        JSR     R5,     X_RAND2                 ; F391   0004 0114 029E

        SUBI    #$000F, R0                      ; F394   0338 000F
        ADD@    R6,     R0                      ; F396   02F0
        CMPI    #$0168, R0                      ; F397   0378 0168
        BLT     L_F39D                          ; F399   0205 0002

        SUBI    #$0168, R0                      ; F39B   0338 0168
L_F39D:
        SLL     R0,     2                       ; F39D   004C
        DECLE   $004C,  $004C,  $0240,  $0352   ; F39E   004C 004C 0240 0352
        DECLE   $02BB,  $0004,  $02BC,  $0342   ; F3A2   02BB 0004 02BC 0342
        DECLE   $02BD,  $0346,  $02A0,  $0268   ; F3A6   02BD 0346 02A0 0268
        DECLE   $0013,  $022C,  $0004,  $0280   ; F3AA   0013 022C 0004 0280
        DECLE   $01D3,  $0240,  $01D5,  $0280   ; F3AE   01D3 0240 01D5 0280
        DECLE   $01D4,  $0240,  $01D6,  $0281   ; F3B2   01D4 0240 01D6 0281
        DECLE   $015E,  $008C,  $02F9,  $01D3   ; F3B6   015E 008C 02F9 01D3
        DECLE   $0288,  $0240,  $01D7,  $00E4   ; F3BA   0288 0240 01D7 00E4
        DECLE   $00A5,  $02FC,  $0342,  $02FD   ; F3BE   00A5 02FC 0342 02FD
        DECLE   $034A,  $02A0,  $0268,  $02A0   ; F3C2   034A 02A0 0268 02A0
        DECLE   $0268,  $0280,  $01E7,  $03B8   ; F3C6   0268 0280 01E7 03B8
        DECLE   $0004,  $020C,  $0005,  $0004   ; F3CA   0004 020C 0005 0004
        DECLE   $01A0,  $022E                   ; F3CE   01A0 022E

        INCR    R0                              ; F3D0   0008
        PULR    R7                              ; F3D1   02B7

        DECLE   $0004,  $01A0,  $022E           ; F3D2   0004 01A0 022E

        INCR    R1                              ; F3D5   0009
        PULR    R7                              ; F3D6   02B7

        PSHR    R5                              ; F3D7   0275
        MVI     G_01B6, R0                      ; F3D8   0280 01B6
        CMPI    #$0007, R0                      ; F3DA   0378 0007
        BNEQ    L_F5A3                          ; F3DC   020C 01C5

        MVI     G_01DA, R0                      ; F3DE   0280 01DA
        ANDI    #$0001, R0                      ; F3E0   03B8 0001
        BNEQ    L_F5A3                          ; F3E2   020C 01BF

        MVI     G_01E7, R0                      ; F3E4   0280 01E7
        ANDI    #$0001, R0                      ; F3E6   03B8 0001
        BNEQ    L_F549                          ; F3E8   020C 015F

        JSR     R5,     L_6E38                  ; F3EA   0004 016C 0238
        DECLE   $0004                           ; F3ED   0004

        ANDR    R4,     R4                      ; F3EE   01A4
        XORR    R0,     R4                      ; F3EF   01C4
        MVI     G_01D8, R4                      ; F3F0   0284 01D8
        CMPI    #$0005, R4                      ; F3F2   037C 0005
        BEQ     L_F40A                          ; F3F4   0204 0014

        CMPI    #$000D, R4                      ; F3F6   037C 000D
        BEQ     L_F40A                          ; F3F8   0204 0010

        CMPI    #$0008, R4                      ; F3FA   037C 0008
        BEQ     L_F40A                          ; F3FC   0204 000C

        MVI     G_034C, R0                      ; F3FE   0280 034C
        MVO     R0,     G_034A                  ; F400   0240 034A
        MVI     G_034D, R0                      ; F402   0280 034D
        MVO     R0,     G_034B                  ; F404   0240 034B
        MVI     G_01D8, R0                      ; F406   0280 01D8
        MVO     R0,     G_01D7                  ; F408   0240 01D7
L_F40A:
        MVI     G_0351, R0                      ; F40A   0280 0351
        TSTR    R0                              ; F40C   0080
        BLE     L_F488                          ; F40D   0206 0079

        CMPI    #$0007, R4                      ; F40F   037C 0007
        BEQ     L_F4DA                          ; F411   0204 00C7

        CMPI    #$0009, R4                      ; F413   037C 0009
        BLT     L_F549                          ; F415   0205 0132

        CMPI    #$000C, R4                      ; F417   037C 000C
        BGT     L_F549                          ; F419   020E 012E

        MVI     G_01E7, R0                      ; F41B   0280 01E7
        ANDI    #$0002, R0                      ; F41D   03B8 0002
        BNEQ    L_F549                          ; F41F   020C 0128

        MOVR    R4,     R3                      ; F421   00A3
        SUBI    #$0009, R4                      ; F422   033C 0009
        ADDR    R4,     R4                      ; F424   00E4
        SDBD                                    ; F425   0001
        ADDI    #$AE9D, R4                      ; F426   02FC 009D 00AE
        MVI     G_0351, R0                      ; F429   0280 0351
        SAR     R0,     2                       ; F42B   006C
        SAR     R0,     2                       ; F42C   006C
        NOP                                     ; F42D   0034
        SAR     R0,     2                       ; F42E   006C
        CMP@    R4,     R0                      ; F42F   0360
        BLT     L_F549                          ; F430   0205 0117

        CMP@    R4,     R0                      ; F432   0360
        BGT     L_F549                          ; F433   020E 0114

L_F435:
        MVI     G_01E7, R0                      ; F435   0280 01E7
        DECLE   $03F8,  $0002,  $0240,  $01E7   ; F437   03F8 0002 0240 01E7
        DECLE   $0273,  $0004                   ; F43B   0273 0004

        ANDR    R4,     R0                      ; F43D   01A0
        BGT     L_F435                          ; F43E   022E 000A

        PULR    R3                              ; F440   02B3
        CMPI    #$0009, R3                      ; F441   037B 0009
        BEQ     L_F45B                          ; F443   0204 0016

        CMPI    #$000C, R3                      ; F445   037B 000C
        BNEQ    L_F451                          ; F447   020C 0008

        MVII    #$0001, R0                      ; F449   02B8 0001

        JSR     R5,     X_RAND1                 ; F44B   0004 0114 027D

        TSTR    R0                              ; F44E   0080
        BEQ     L_F45B                          ; F44F   0204 000A

L_F451:
        CLRR    R0                              ; F451   01C0
        MVO     R0,     G_034F                  ; F452   0240 034F
        MVII    #$005A, R0                      ; F454   02B8 005A
        NEGR    R0                              ; F456   0020
        MVO     R0,     G_034E                  ; F457   0240 034E
        B       L_F549                          ; F459   0200 00EE

L_F45B:
        MVI     G_01E7, R0                      ; F45B   0280 01E7
        XORI    #$0010, R0                      ; F45D   03F8 0010
        MVO     R0,     G_01E7                  ; F45F   0240 01E7
        MVI     G_034F, R0                      ; F461   0280 034F
        SLR     R0,     1                       ; F463   0060
        MVO     R0,     G_034F                  ; F464   0240 034F
        MVI     G_034E, R0                      ; F466   0280 034E
        TSTR    R0                              ; F468   0080
        BMI     L_F46E                          ; F469   020B 0003

        CLRR    R0                              ; F46B   01C0
        MVO     R0,     G_034E                  ; F46C   0240 034E
L_F46E:
        MVII    #$005B, R0                      ; F46E   02B8 005B

        JSR     R5,     X_RAND2                 ; F470   0004 0114 029E

        ADDI    #$00E1, R0                      ; F473   02F8 00E1
        SLL     R0,     2                       ; F475   004C
        SLL     R0,     2                       ; F476   004C
        SLL     R0,     2                       ; F477   004C
        ADD     G_0352, R0                      ; F478   02C0 0352
        SDBD                                    ; F47A   0001
        CMPI    #$5A00, R0                      ; F47B   0378 0000 005A
        BLT     L_F484                          ; F47E   0205 0004

        SDBD                                    ; F480   0001
        SUBI    #$5A00, R0                      ; F481   0338 0000 005A
L_F484:
        MVO     R0,     G_0352                  ; F484   0240 0352
        B       L_F549                          ; F486   0200 00C1

L_F488:
        CLRR    R0                              ; F488   01C0
        MVO     R0,     G_0351                  ; F489   0240 0351
        MVI     G_01E7, R0                      ; F48B   0280 01E7
        MOVR    R0,     R1                      ; F48D   0081
        ANDI    #$0010, R1                      ; F48E   03B9 0010
        BNEQ    L_F496                          ; F490   020C 0004

        ANDI    #$0002, R0                      ; F492   03B8 0002
        BNEQ    L_F508                          ; F494   020C 0072

L_F496:
        MVI     G_0350, R0                      ; F496   0280 0350
        DECR    R0                              ; F498   0010
        MVI     G_01E7, R5                      ; F499   0285 01E7
        ANDI    #$0004, R5                      ; F49B   03BD 0004
        BNEQ    L_F4A8                          ; F49D   020C 0009

        INCR    R0                              ; F49F   0008
        SLR     R0,     2                       ; F4A0   0064
        MVI     G_01E8, R1                      ; F4A1   0281 01E8
        MOVR    R1,     R2                      ; F4A3   008A
        SLR     R2,     2                       ; F4A4   0066
        SUBR    R2,     R1                      ; F4A5   0111
        MVO     R1,     G_01E8                  ; F4A6   0241 01E8
L_F4A8:
        MVO     R0,     G_0350                  ; F4A8   0240 0350
        MVI     G_01D8, R1                      ; F4AA   0281 01D8
        INCR    R1                              ; F4AC   0009
        ADDR    R7,     R1                      ; F4AD   00F9
        ADD@    R1,     R7                      ; F4AE   02CF

        NEGR    R2                              ; F4AF   0022
        MOVR    R0,     R7                      ; F4B0   0087
        MOVR    R0,     R7                      ; F4B1   0087
        MOVR    R0,     R7                      ; F4B2   0087

        DECLE   $003D,  $0034,  $0037           ; F4B3   003D 0034 0037

        ADCR    R3                              ; F4B6   002B
        ADCR    R3                              ; F4B7   002B
        SLLC    R1,     1                       ; F4B8   0059
        SLLC    R1,     1                       ; F4B9   0059
        SLLC    R1,     1                       ; F4BA   0059
        SLLC    R1,     1                       ; F4BB   0059
        INCR    R6                              ; F4BC   000E
        MVI     G_015E, R4                      ; F4BD   0284 015E
        ADDR    R4,     R4                      ; F4BF   00E4
        ADDI    #$0342, R4                      ; F4C0   02FC 0342
        MVI     G_034A, R0                      ; F4C2   0280 034A
        MVO@    R0,     R4                      ; F4C4   0260
        MVI     G_034B, R0                      ; F4C5   0280 034B
        MVO@    R0,     R4                      ; F4C7   0260
        MVI     G_01D7, R0                      ; F4C8   0280 01D7
        MVI     G_015E, R1                      ; F4CA   0281 015E
        ADDI    #$01D3, R1                      ; F4CC   02F9 01D3
        MVO@    R0,     R1                      ; F4CE   0248
        B       L_F53F                          ; F4CF   0200 006E

        JSR     R5,     L_68FE                  ; F4D1   0004 0168 00FE
        JSR     R5,     L_68C9                  ; F4D4   0004 0168 00C9

        J       L_5B99                          ; F4D7   0004 0358 0399

L_F4DA:
        MVII    #$0001, R0                      ; F4DA   02B8 0001
        DECLE   $0004                           ; F4DC   0004
L_F4DD:
        ANDR    R4,     R0                      ; F4DD   01A0
        BGT     L_F4DD                          ; F4DE   022E 0002
        J       L_5192                          ; F4E0   0004 0350 0192
        J       L_69CE                          ; F4E3   0004 0368 01CE

        DECLE   $0280,  $01E7,  $03B8,  $0004   ; F4E6   0280 01E7 03B8 0004
        DECLE   $0204,  $0053,  $0280,  $01E7   ; F4EA   0204 0053 0280 01E7
        DECLE   $03B8,  $0004,  $0204,  $0010   ; F4EE   03B8 0004 0204 0010

        MVI     G_0350, R0                      ; F4F2   0280 0350
        SUBI    #$0003, R0                      ; F4F4   0338 0003
        BPL     L_F4F9                          ; F4F6   0203 0001

        CLRR    R0                              ; F4F8   01C0
L_F4F9:
        MVO     R0,     G_0350                  ; F4F9   0240 0350
        DECLE   $01C0,  $0240,  $035B,  $0240   ; F4FB   01C0 0240 035B 0240
        DECLE   $035C,  $0200,  $0034,  $0004   ; F4FF   035C 0200 0034 0004
        DECLE   $01A0,  $022E,  $000B           ; F503   01A0 022E 000B

        B       L_F53F                          ; F506   0200 0037

L_F508:
        MVI     G_01E7, R0                      ; F508   0280 01E7
        DECLE   $03B8,  $00FD,  $03F8,  $0002   ; F50A   03B8 00FD 03F8 0002
        DECLE   $0240,  $01E7,  $0281,  $015E   ; F50E   0240 01E7 0281 015E
        DECLE   $00C9,  $02F9,  $0343,  $0289   ; F512   00C9 02F9 0343 0289
        DECLE   $0041,  $03B9,  $0007,  $0379   ; F516   0041 03B9 0007 0379
        DECLE   $0007,  $0204,  $0022,  $02B8   ; F51A   0007 0204 0022 02B8
        DECLE   $003C,  $0240,  $0350,  $01C0   ; F51E   003C 0240 0350 01C0
        DECLE   $0240,  $01E8,  $0004           ; F522   0240 01E8 0004

        ANDR    R4,     R4                      ; F525   01A4
        ANDR    R4,     R4                      ; F526   01A4
        SDBD                                    ; F527   0001
        MVII    #$1680, R0                      ; F528   02B8 0080 0016
        MVO     R0,     G_0352                  ; F52B   0240 0352
        CLRR    R0                              ; F52D   01C0
        MVO     R0,     G_01CA                  ; F52E   0240 01CA
        MVO     R0,     G_035B                  ; F530   0240 035B
        MVO     R0,     G_035C                  ; F532   0240 035C
        B       L_F549                          ; F534   0200 0013

        DECLE   $0004                           ; F536   0004

        ANDR    R4,     R4                      ; F537   01A4
        ANDR    R4,     R4                      ; F538   01A4
        MVI     G_0350, R0                      ; F539   0280 0350
        CMPI    #$0001, R0                      ; F53B   0378 0001
        BGT     L_F549                          ; F53D   020E 000A

L_F53F:
        JSR     R5,     L_68FE                  ; F53F   0004 0168 00FE
        JSR     R5,     L_51EF                  ; F542   0004 0150 01EF
        DECLE   $001C                           ; F545   001C

        J       L_50C0                          ; F546   0004 0350 00C0

L_F549:
        MVI     G_01E7, R0                      ; F549   0280 01E7
        DECLE   $03B8,  $00FE,  $0240,  $01E7   ; F54B   03B8 00FE 0240 01E7
        DECLE   $0280,  $0352,  $0064,  $0064   ; F54F   0280 0352 0064 0064
        DECLE   $0034,  $0064,  $0270,  $0004   ; F553   0034 0064 0270 0004
        DECLE   $01A4,  $023D,  $0281,  $034F   ; F557   01A4 023D 0281 034F
        DECLE   $0004,  $01A4,  $0209,  $0004   ; F55B   0004 01A4 0209 0004
        DECLE   $01A4,  $0233,  $0281,  $015E   ; F55F   01A4 0233 0281 015E
        DECLE   $00C9,  $02F9,  $0342,  $02C8   ; F563   00C9 02F9 0342 02C8
        DECLE   $02C0,  $035B,  $0248,  $0240   ; F567   02C0 035B 0248 0240
        DECLE   $034C,  $02B0,  $0009,  $0271   ; F56B   034C 02B0 0009 0271
        DECLE   $0004,  $01A4,  $023F,  $0281   ; F56F   0004 01A4 023F 0281
        DECLE   $034F,  $0004,  $01A4,  $0209   ; F573   034F 0004 01A4 0209
        DECLE   $0004,  $01A4,  $0233           ; F577   0004 01A4 0233

        ADD     G_034D, R0                      ; F57A   02C0 034D
        ADD     G_035C, R0                      ; F57C   02C0 035C
        MVO     R0,     G_034D                  ; F57E   0240 034D
        MVI     G_0351, R0                      ; F580   0280 0351
        ADD     G_034E, R0                      ; F582   02C0 034E
        MVO     R0,     G_0351                  ; F584   0240 0351
        MVI     G_034E, R0                      ; F586   0280 034E
        SUBI    #$0001, R0                      ; F588   0338 0001
        MVO     R0,     G_034E                  ; F58A   0240 034E
        MVI     G_034D, R0                      ; F58C   0280 034D
        SUB     G_0351, R0                      ; F58E   0300 0351
        PULR    R1                              ; F590   02B1
        MVO@    R0,     R1                      ; F591   0248
        SDBD                                    ; F592   0001
        MVII    #$5A00, R4                      ; F593   02BC 0000 005A
        MVI     G_0353, R5                      ; F596   0285 0353
        ADD     G_0352, R5                      ; F598   02C5 0352
        BPL     L_F59D                          ; F59A   0203 0001

        ADDR    R4,     R5                      ; F59C   00E5
L_F59D:
        CMPR    R4,     R5                      ; F59D   0165
        BLT     L_F5A1                          ; F59E   0205 0001

        SUBR    R4,     R5                      ; F5A0   0125
L_F5A1:
        MVO     R5,     G_0352                  ; F5A1   0245 0352
L_F5A3:
        PULR    R7                              ; F5A3   02B7

        DECLE   $0275,  $0280,  $01E8,  $0004   ; F5A4   0275 0280 01E8 0004
        DECLE   $01A4,  $023F,  $0281,  $0350   ; F5A8   01A4 023F 0281 0350
        DECLE   $0004,  $01A4,  $0209,  $0004   ; F5AC   0004 01A4 0209 0004
        DECLE   $01A4,  $0233,  $0240,  $034E   ; F5B0   01A4 0233 0240 034E
        DECLE   $0280,  $01E8,  $0004,  $01A4   ; F5B4   0280 01E8 0004 01A4
        DECLE   $023D,  $0281,  $0350,  $0004   ; F5B8   023D 0281 0350 0004
        DECLE   $01A4,  $0209,  $0004,  $01A4   ; F5BC   01A4 0209 0004 01A4
        DECLE   $0233                           ; F5C0   0233

        MVO     R0,     G_034F                  ; F5C1   0240 034F
        PULR    R7                              ; F5C3   02B7

        PSHR    R5                              ; F5C4   0275
        MVI     G_01EA, R0                      ; F5C5   0280 01EA
        SLL     R0,     1                       ; F5C7   0048
        MVI     G_01E9, R4                      ; F5C8   0284 01E9
        MVI     G_01D8, R5                      ; F5CA   0285 01D8
        CMPI    #$0001, R5                      ; F5CC   037D 0001
        BNEQ    L_F5D9                          ; F5CE   020C 0009

        MVI     G_0351, R5                      ; F5D0   0285 0351
        TSTR    R5                              ; F5D2   00AD
        BGT     L_F5D9                          ; F5D3   020E 0004

        MVII    #$0006, R0                      ; F5D5   02B8 0006
        MVI     G_017F, R4                      ; F5D7   0284 017F
L_F5D9:
        ADDR    R4,     R4                      ; F5D9   00E4
        ADDR    R4,     R4                      ; F5DA   00E4
        SDBD                                    ; F5DB   0001
        ADDI    #$AEE1, R4                      ; F5DC   02FC 00E1 00AE
        PSHR    R0                              ; F5DF   0270
        SDBD                                    ; F5E0   0001
        MVI@    R4,     R1                      ; F5E1   02A1

        JSR     R5,     X_MPY                   ; F5E2   0004 011C 01DC

        MVO     R2,     G_035B                  ; F5E5   0242 035B
        PULR    R0                              ; F5E7   02B0
        SDBD                                    ; F5E8   0001
        MVI@    R4,     R1                      ; F5E9   02A1

        JSR     R5,     X_MPY                   ; F5EA   0004 011C 01DC

        MVO     R2,     G_035C                  ; F5ED   0242 035C
        PULR    R7                              ; F5EF   02B7

        PSHR    R5                              ; F5F0   0275
        MVI     G_01CA, R0                      ; F5F1   0280 01CA
        CMPI    #$0020, R0                      ; F5F3   0378 0020
        BLE     L_F5F9                          ; F5F5   0206 0002

        MVII    #$0020, R0                      ; F5F7   02B8 0020
L_F5F9:
        SLR     R0,     1                       ; F5F9   0060
        MVII    #$0002, R1                      ; F5FA   02B9 0002

        JSR     R5,     X_MPY                   ; F5FC   0004 011C 01DC

        MVI     G_01C9, R0                      ; F5FF   0280 01C9
        CMPI    #$0000, R0                      ; F601   0378 0000
        BNEQ    L_F606                          ; F603   020C 0001

        NEGR    R2                              ; F605   0022
L_F606:
        MVO     R2,     G_0353                  ; F606   0242 0353
        PULR    R7                              ; F608   02B7

        PSHR    R5                              ; F609   0275
        CLRR    R3                              ; F60A   01DB
        TSTR    R0                              ; F60B   0080
        BPL     L_F610                          ; F60C   0203 0002

        INCR    R3                              ; F60E   000B
        NEGR    R0                              ; F60F   0020
L_F610:
        TSTR    R1                              ; F610   0089
        BPL     L_F615                          ; F611   0203 0002

        DECR    R3                              ; F613   0013
        NEGR    R1                              ; F614   0021
L_F615:
        CLRR    R2                              ; F615   01D2
        CLRR    R4                              ; F616   01E4
        CLRR    R5                              ; F617   01ED
        TSTR    R0                              ; F618   0080
        BEQ     L_F630                          ; F619   0204 0015

        TSTR    R1                              ; F61B   0089
        BEQ     L_F630                          ; F61C   0204 0012

L_F61E:
        SARC    R0,     1                       ; F61E   0078
        BNC     L_F625                          ; F61F   0209 0004

        CLRC                                    ; F621   0006
        ADDR    R1,     R4                      ; F622   00CC
        ADCR    R5                              ; F623   002D
        ADDR    R2,     R5                      ; F624   00D5
L_F625:
        CLRC                                    ; F625   0006
        SLLC    R1,     1                       ; F626   0059
        RLC     R2,     1                       ; F627   0052
        TSTR    R0                              ; F628   0080
        BNEQ    L_F61E                          ; F629   022C 000C

        TSTR    R3                              ; F62B   009B
        BEQ     L_F630                          ; F62C   0204 0002

        NEGR    R4                              ; F62E   0024
        COMR    R5                              ; F62F   001D
L_F630:
        MOVR    R4,     R0                      ; F630   00A0
        MOVR    R5,     R1                      ; F631   00A9
        PULR    R7                              ; F632   02B7

        SARC    R1,     2                       ; F633   007D
        RRC     R0,     2                       ; F634   0074
        SARC    R1,     2                       ; F635   007D
        RRC     R0,     2                       ; F636   0074
        NOP                                     ; F637   0034
        SARC    R1,     2                       ; F638   007D
        RRC     R0,     2                       ; F639   0074
        SARC    R1,     2                       ; F63A   007D
        RRC     R0,     2                       ; F63B   0074
        MOVR    R5,     R7                      ; F63C   00AF

        ADDI    #$005A, R0                      ; F63D   02F8 005A
        PSHR    R5                              ; F63F   0275
        MVII    #$005A, R5                      ; F640   02BD 005A
        CLRR    R1                              ; F642   01C9
        DECR    R1                              ; F643   0011
L_F644:
        INCR    R1                              ; F644   0009
        SUBR    R5,     R0                      ; F645   0128
        BPL     L_F644                          ; F646   0223 0003

        ADDR    R5,     R0                      ; F648   00E8
        SARC    R1,     1                       ; F649   0079
        BNC     L_F64E                          ; F64A   0209 0002

        SUBR    R0,     R5                      ; F64C   0105
        INCR    R7                              ; F64D   000F

L_F64E:
        MOVR    R0,     R5                      ; F64E   0085
L_F64F:
        SDBD                                    ; F64F   0001
        ADDI    #$AF01, R5                      ; F650   02FD 0001 00AF
        MVI@    R5,     R0                      ; F653   02A8
        SARC    R1,     1                       ; F654   0079
        BNC     L_F658                          ; F655   0209 0001

        NEGR    R0                              ; F657   0020
L_F658:
        PULR    R7                              ; F658   02B7

        DECLE   $00F1,  $00F5,  $00F5,  $00F5   ; F659   00F1 00F5 00F5 00F5
        DECLE   $00F1,  $00FD,  $00F9,  $00FD   ; F65D   00F1 00FD 00F9 00FD
        DECLE   $00FD,  $00FD,  $00F1,  $00FD   ; F661   00FD 00FD 00F1 00FD
        DECLE   $00F1,  $00F7,  $00F1,  $00F1   ; F665   00F1 00F7 00F1 00F1
        DECLE   $00FD,  $00F9,  $00FD,  $00F1   ; F669   00FD 00F9 00FD 00F1
        DECLE   $00F5,  $00F5,  $00F1,  $00FD   ; F66D   00F5 00F5 00F1 00FD
        DECLE   $00FD,  $00F1,  $00F7,  $00F1   ; F671   00FD 00F1 00F7 00F1
        DECLE   $00FD,  $00F1,  $00F7,  $00F7   ; F675   00FD 00F1 00F7 00F7

        ADDR    R6,     R1                      ; F679   00F1
        ADDR    R6,     R5                      ; F67A   00F5
        ADDR    R6,     R1                      ; F67B   00F1
        ADDR    R6,     R1                      ; F67C   00F1
        ADDR    R7,     R5                      ; F67D   00FD
        ADDR    R7,     R3                      ; F67E   00FB
        ADDR    R7,     R3                      ; F67F   00FB
        ADDR    R7,     R3                      ; F680   00FB
        ADDR    R6,     R1                      ; F681   00F1
        ADDR    R6,     R5                      ; F682   00F5
        ADDR    R6,     R1                      ; F683   00F1
        ADDR    R6,     R5                      ; F684   00F5
        ADDR    R6,     R1                      ; F685   00F1
        ADDR    R6,     R1                      ; F686   00F1
        ADDR    R6,     R5                      ; F687   00F5
        ADDR    R6,     R1                      ; F688   00F1
        ADDR    R7,     R5                      ; F689   00FD
        ADDR    R7,     R5                      ; F68A   00FD
        ADDR    R2,     R1                      ; F68B   00D1
        MOVR    R2,     R5                      ; F68C   0095
        ADDR    R2,     R5                      ; F68D   00D5
        ADDR    R2,     R5                      ; F68E   00D5
        ADDR    R2,     R1                      ; F68F   00D1
        ADDR    R5,     R5                      ; F690   00ED
        ADDR    R1,     R1                      ; F691   00C9
        ADDR    R5,     R5                      ; F692   00ED
        ADDR    R5,     R5                      ; F693   00ED
        ADDR    R5,     R5                      ; F694   00ED
        ADDR    R2,     R1                      ; F695   00D1
        MOVR    R3,     R5                      ; F696   009D
        ADDR    R2,     R1                      ; F697   00D1
        ADDR    R2,     R7                      ; F698   00D7

        ADDR    R2,     R1                      ; F699   00D1
        ADDR    R2,     R1                      ; F69A   00D1
        MOVR    R3,     R5                      ; F69B   009D
        ADDR    R3,     R1                      ; F69C   00D9
        ADDR    R3,     R5                      ; F69D   00DD
        ADDR    R2,     R1                      ; F69E   00D1
        ADDR    R2,     R5                      ; F69F   00D5
        MOVR    R2,     R5                      ; F6A0   0095
        ADDR    R2,     R1                      ; F6A1   00D1
        ADDR    R3,     R5                      ; F6A2   00DD
        ADDR    R3,     R5                      ; F6A3   00DD
        ADDR    R2,     R1                      ; F6A4   00D1
        MOVR    R2,     R7                      ; F6A5   0097

        ADDR    R2,     R1                      ; F6A6   00D1
        ADDR    R3,     R5                      ; F6A7   00DD
        ADDR    R2,     R1                      ; F6A8   00D1
        ADDR    R2,     R7                      ; F6A9   00D7
        MOVR    R2,     R7                      ; F6AA   0097

        DECLE   $00D1,  $00D5,  $00D1,  $00D1   ; F6AB   00D1 00D5 00D1 00D1
        DECLE   $009D,  $00DB,  $00DB,  $00DB   ; F6AF   009D 00DB 00DB 00DB
        DECLE   $00D1,  $0095,  $00D1,  $00D5   ; F6B3   00D1 0095 00D1 00D5
        DECLE   $00D1,  $00D1,  $0095,  $00D1   ; F6B7   00D1 00D1 0095 00D1
        DECLE   $00DD,  $00DD,  $0091,  $00D5   ; F6BB   00DD 00DD 0091 00D5
        DECLE   $0095,  $00B5,  $0091,  $008D   ; F6BF   0095 00B5 0091 008D
        DECLE   $00E9,  $008D,  $00BD,  $008D   ; F6C3   00E9 008D 00BD 008D
        DECLE   $0091,  $00DD,  $0091,  $00B7   ; F6C7   0091 00DD 0091 00B7

        MOVR    R2,     R1                      ; F6CB   0091
        MOVR    R2,     R1                      ; F6CC   0091
        ADDR    R3,     R5                      ; F6CD   00DD
        MOVR    R3,     R1                      ; F6CE   0099
        MOVR    R7,     R5                      ; F6CF   00BD
        MOVR    R2,     R1                      ; F6D0   0091
        MOVR    R2,     R5                      ; F6D1   0095
        ADDR    R2,     R5                      ; F6D2   00D5
        MOVR    R2,     R1                      ; F6D3   0091
        MOVR    R7,     R5                      ; F6D4   00BD
        MOVR    R3,     R5                      ; F6D5   009D
        MOVR    R2,     R1                      ; F6D6   0091
        ADDR    R2,     R7                      ; F6D7   00D7

        DECLE   $0091,  $00BD,  $0091,  $0011   ; F6D8   0091 00BD 0091 0011
        DECLE   $0055,  $0011,  $0075,  $0075   ; F6DC   0055 0011 0075 0075
        DECLE   $001F,  $0057,  $003F           ; F6E0   001F 0057 003F

        RLC     R3,     2                       ; F6E3   0057
        SLLC    R3,     2                       ; F6E4   005F
L_F6E5:
        DECR    R7                              ; F6E5   0017

        RLC     R3,     2                       ; F6E6   0057
L_F6E7:
        DECR    R7                              ; F6E7   0017

        DECLE   $0077,  $0071,  $0015,  $0055   ; F6E8   0077 0071 0015 0055
        DECLE   $0011,  $005B,  $005B,  $0011   ; F6EC   0011 005B 005B 0011
        DECLE   $0075,  $0033,  $0075,  $0015   ; F6F0   0075 0033 0075 0015
        DECLE   $0051,  $005B,  $005B,  $005B   ; F6F4   0051 005B 005B 005B
        DECLE   $001B,  $00AD,  $00A5,  $00A1   ; F6F8   001B 00AD 00A5 00A1
        DECLE   $00A9,  $00AD,  $0000,  $00FF   ; F6FC   00A9 00AD 0000 00FF
        DECLE   $00FF,  $00FF,  $00FF           ; F700   00FF 00FF 00FF

        ADDR    R6,     R1                      ; F703   00F1
        ADDR    R7,     R3                      ; F704   00FB
        ADDR    R7,     R3                      ; F705   00FB
        ADDR    R7,     R3                      ; F706   00FB
        ADDR    R7,     R3                      ; F707   00FB
        DECR    R1                              ; F708   0011
        SLLC    R3,     1                       ; F709   005B
        SLLC    R3,     1                       ; F70A   005B
        SLLC    R3,     1                       ; F70B   005B
        COMR    R3                              ; F70C   001B
L_F70D:
        DECR    R7                              ; F70D   0017

        RLC     R3,     2                       ; F70E   0057
L_F70F:
        DECR    R7                              ; F70F   0017

        DECLE   $0057,  $0051,  $00F0,  $00FF   ; F710   0057 0051 00F0 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0051   ; F714   00FF 00FF 00FF 0051
        DECLE   $0055,  $0015,  $0055,  $0051   ; F718   0055 0015 0055 0051
        DECLE   $0071,  $0077,  $0073,  $0077   ; F71C   0071 0077 0073 0077
        DECLE   $0011,  $00FF,  $00BF,  $00FF   ; F720   0011 00FF 00BF 00FF
        DECLE   $00BF,  $00FF                   ; F724   00BF 00FF

        DECR    R1                              ; F726   0011
        RRC     R3,     2                       ; F727   0077
L_F728:
        DECR    R7                              ; F728   0017
        ADDR    R2,     R7                      ; F729   00D7

        DECLE   $0011,  $0016,  $0052,  $0010   ; F72A   0011 0016 0052 0010
        DECLE   $0054,  $0056,  $0011,  $0075   ; F72E   0054 0056 0011 0075
        DECLE   $0011,  $00D5,  $0015,  $0051   ; F732   0011 00D5 0015 0051
        DECLE   $0057,  $0053,  $0057,  $00B1   ; F736   0057 0053 0057 00B1
        DECLE   $0015,  $0075,  $003B,  $0075   ; F73A   0015 0075 003B 0075
        DECLE   $0015,  $0047,  $006F,  $006F   ; F73E   0015 0047 006F 006F
        DECLE   $006F,  $006F,  $0068,  $002A   ; F742   006F 006F 0068 002A
        DECLE   $000A,  $004A,  $0068,  $0051   ; F746   000A 004A 0068 0051
        DECLE   $0057,  $0013,  $00B7,  $00B1   ; F74A   0057 0013 00B7 00B1
        DECLE   $001F,  $007F,  $001F,  $00DF   ; F74E   001F 007F 001F 00DF
        DECLE   $001F,  $001F,  $0053,  $005F   ; F752   001F 001F 0053 005F
        DECLE   $0053,  $001F,  $001F,  $0073   ; F756   0053 001F 001F 0073
        DECLE   $003F,  $0073,  $001F,  $001F   ; F75A   003F 0073 001F 001F

        SLLC    R3,     2                       ; F75E   005F
        ADDR    R3,     R7                      ; F75F   00DF

        DECLE   $00BF,  $00BF,  $00FF,  $00BF   ; F760   00BF 00BF 00FF 00BF
        DECLE   $00FF,  $00FF,  $005F,  $005F   ; F764   00FF 00FF 005F 005F
        DECLE   $001F,  $0053,  $005B,  $00F7   ; F768   001F 0053 005B 00F7
        DECLE   $00F3,  $0071,  $007B,  $007B   ; F76C   00F3 0071 007B 007B
        DECLE   $007B,  $0011,  $001F,  $007F   ; F770   007B 0011 001F 007F
        DECLE   $003F,  $007F,  $001F           ; F774   003F 007F 001F
L_F777:
        DECR    R7                              ; F777   0017

        DECLE   $0057,  $0057,  $0057,  $0011   ; F778   0057 0057 0057 0011
        DECLE   $003F,  $005F,  $005F,  $005F   ; F77C   003F 005F 005F 005F
        DECLE   $003F,  $001F,  $005F,  $005F   ; F780   003F 001F 005F 005F
        DECLE   $005F,  $001F                   ; F784   005F 001F

        RLC     R1,     1                       ; F786   0051
        RLC     R1,     2                       ; F787   0055
        DECR    R5                              ; F788   0015
        RLC     R1,     2                       ; F789   0055
        RLC     R1,     1                       ; F78A   0051
        RRC     R1,     1                       ; F78B   0071
        RRC     R3,     2                       ; F78C   0077
        RRC     R3,     1                       ; F78D   0073
        RRC     R3,     2                       ; F78E   0077
        DECR    R1                              ; F78F   0011
        ADDR    R2,     R6                      ; F790   00D6
        ADDR    R2,     R2                      ; F791   00D2
        ADDR    R2,     R0                      ; F792   00D0
        ADDR    R2,     R4                      ; F793   00D4
        ADDR    R2,     R6                      ; F794   00D6
        ADDR    R5,     R5                      ; F795   00ED
        ADDR    R1,     R5                      ; F796   00CD
        ADDR    R5,     R5                      ; F797   00ED
        ADDR    R5,     R7                      ; F798   00EF

        DECLE   $00ED,  $0033,  $0055,  $0053   ; F799   00ED 0033 0055 0053
        DECLE   $0055,  $0033,  $0078,  $007B   ; F79D   0055 0033 0078 007B
        DECLE   $0079,  $007B,  $0018,  $0088   ; F7A1   0079 007B 0018 0088
        DECLE   $00AB,  $008B,  $00AA,  $00A8   ; F7A5   00AB 008B 00AA 00A8
        DECLE   $00B8,  $00BB,  $00B9,  $00BB   ; F7A9   00B8 00BB 00B9 00BB
        DECLE   $0088,  $00FE,  $00FE,  $00FE   ; F7AD   0088 00FE 00FE 00FE
        DECLE   $00FE,  $00FE,  $0022,  $00EA   ; F7B1   00FE 00FE 0022 00EA
        DECLE   $0062,  $00EA,  $002A,  $002E   ; F7B5   0062 00EA 002A 002E
        DECLE   $00EE,  $00AE,  $00AE,  $0022   ; F7B9   00EE 00AE 00AE 0022
        DECLE   $003F,  $00FF,  $007F,  $00FF   ; F7BD   003F 00FF 007F 00FF
        DECLE   $003F,  $00FE,  $00FE,  $00FE   ; F7C1   003F 00FE 00FE 00FE
        DECLE   $00FE,  $00FE,  $0068,  $00AA   ; F7C5   00FE 00FE 0068 00AA
        DECLE   $0069,  $00AA,  $006A,  $009A   ; F7C9   0069 00AA 006A 009A
        DECLE   $00AA,  $00AA,  $00AA,  $009A   ; F7CD   00AA 00AA 00AA 009A
        DECLE   $003F,  $00FF,  $007F,  $00FF   ; F7D1   003F 00FF 007F 00FF
        DECLE   $003F,  $00FF,  $00FF,  $00FF   ; F7D5   003F 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00E2,  $00EA   ; F7D9   00FF 00FF 00E2 00EA
        DECLE   $00E2,  $00EE,  $00EE,  $0023   ; F7DD   00E2 00EE 00EE 0023
        DECLE   $00AB,  $0027,  $00AB,  $00AB   ; F7E1   00AB 0027 00AB 00AB
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; F7E5   00FF 00FF 00FF 00FF
        DECLE   $00FF                           ; F7E9   00FF

        ADDR    R7,     R6                      ; F7EA   00FE
        ADDR    R7,     R6                      ; F7EB   00FE
        ADDR    R7,     R6                      ; F7EC   00FE
        ADDR    R7,     R6                      ; F7ED   00FE
        ADDR    R7,     R6                      ; F7EE   00FE
        SLR     R2,     1                       ; F7EF   0062
        MOVR    R5,     R2                      ; F7F0   00AA
        SAR     R2,     1                       ; F7F1   006A
        MOVR    R5,     R2                      ; F7F2   00AA
        SLR     R2,     1                       ; F7F3   0062
        NEGR    R2                              ; F7F4   0022
        ADDR    R5,     R6                      ; F7F5   00EE
        MOVR    R4,     R6                      ; F7F6   00A6
        MOVR    R5,     R7                      ; F7F7   00AF

        DECLE   $0023,  $00BF,  $00BF,  $003F   ; F7F8   0023 00BF 00BF 003F

        SARC    R3,     2                       ; F7FC   007F
        SARC    R3,     2                       ; F7FD   007F
        GSWD    R3                              ; F7FE   0033
        RLC     R1,     2                       ; F7FF   0055
        RLC     R3,     1                       ; F800   0053
        RLC     R1,     2                       ; F801   0055
        GSWD    R3                              ; F802   0033
        SARC    R1,     1                       ; F803   0079
        SARC    R2,     1                       ; F804   007A
        SARC    R1,     1                       ; F805   0079
        SARC    R2,     1                       ; F806   007A
        COMR    R1                              ; F807   0019
        MOVR    R1,     R0                      ; F808   0088
        MOVR    R5,     R3                      ; F809   00AB
        MOVR    R5,     R3                      ; F80A   00AB
        MOVR    R5,     R2                      ; F80B   00AA
        MOVR    R1,     R0                      ; F80C   0088
        MOVR    R1,     R2                      ; F80D   008A
        MOVR    R7,     R2                      ; F80E   00BA
        MOVR    R3,     R0                      ; F80F   0098
        MOVR    R7,     R5                      ; F810   00BD
        MOVR    R1,     R5                      ; F811   008D
        ADDR    R4,     R2                      ; F812   00E2
        ADDR    R6,     R6                      ; F813   00F6
        ADDR    R6,     R6                      ; F814   00F6
        ADDR    R6,     R6                      ; F815   00F6
        ADDR    R4,     R2                      ; F816   00E2
        ADDR    R3,     R5                      ; F817   00DD
        SLLC    R1,     2                       ; F818   005D
        COMR    R4                              ; F819   001C
        MOVR    R3,     R5                      ; F81A   009D
        ADDR    R3,     R5                      ; F81B   00DD
        SWAP    R1,     2                       ; F81C   0045
        RLC     R1,     2                       ; F81D   0055
        RLC     R1,     2                       ; F81E   0055
        RLC     R1,     2                       ; F81F   0055
        SWAP    R0,     2                       ; F820   0044
        ADDR    R0,     R7                      ; F821   00C7
        ADDR    R3,     R7                      ; F822   00DF
        ADDR    R1,     R7                      ; F823   00CF
        ADDR    R3,     R7                      ; F824   00DF

        SWAP    R3,     2                       ; F825   0047
        DECR    R1                              ; F826   0011
        RRC     R1,     2                       ; F827   0075
        RRC     R1,     1                       ; F828   0071
        RLC     R1,     2                       ; F829   0055
        DECR    R5                              ; F82A   0015
        RLC     R1,     1                       ; F82B   0051
L_F82C:
        DECR    R7                              ; F82C   0017

        DECLE   $0053,  $0057,  $0051,  $008A   ; F82D   0053 0057 0051 008A
        DECLE   $00AA,  $00AA,  $00AA,  $008D   ; F831   00AA 00AA 00AA 008D
        DECLE   $0088,  $00BA,  $0099,  $00BA   ; F835   0088 00BA 0099 00BA
        DECLE   $008A,  $00FF,  $00FF,  $00FF   ; F839   008A 00FF 00FF 00FF
        DECLE   $0003,  $0057,  $00FF,  $00FF   ; F83D   0003 0057 00FF 00FF
        DECLE   $00EF,  $0000,  $0055,  $00FF   ; F841   00EF 0000 0055 00FF
        DECLE   $00FF,  $00FF,  $0000,  $0055   ; F845   00FF 00FF 0000 0055
        DECLE   $00FF,  $00FF,  $00FF           ; F849   00FF 00FF 00FF

        ADDR    R4,     R0                      ; F84C   00E0
        ADDR    R6,     R5                      ; F84D   00F5
        DECR    R5                              ; F84E   0015
        ADDR    R2,     R5                      ; F84F   00D5
        MOVR    R2,     R5                      ; F850   0095
        ADDR    R2,     R1                      ; F851   00D1
        DECR    R5                              ; F852   0015
        ADDR    R2,     R1                      ; F853   00D1
        TSTR    R3                              ; F854   009B
        ADDR    R3,     R3                      ; F855   00DB
        ADDR    R3,     R3                      ; F856   00DB
        ADDR    R2,     R1                      ; F857   00D1
        DECR    R1                              ; F858   0011
        ADDR    R3,     R3                      ; F859   00DB
        COMR    R3                              ; F85A   001B
        SARC    R3,     1                       ; F85B   007B
        DECR    R1                              ; F85C   0011
        DECR    R1                              ; F85D   0011
        ADDR    R3,     R3                      ; F85E   00DB
        TSTR    R3                              ; F85F   009B
        ADDR    R3,     R3                      ; F860   00DB
        DECR    R1                              ; F861   0011
        RLC     R1,     1                       ; F862   0051
        SLLC    R3,     1                       ; F863   005B
        COMR    R3                              ; F864   001B
        ADDR    R3,     R3                      ; F865   00DB
        ADDR    R2,     R1                      ; F866   00D1
        DECR    R1                              ; F867   0011
        SARC    R3,     1                       ; F868   007B
        COMR    R3                              ; F869   001B
        ADDR    R3,     R3                      ; F86A   00DB
        DECR    R1                              ; F86B   0011
        RRC     R1,     1                       ; F86C   0071
        SARC    R3,     1                       ; F86D   007B
        COMR    R3                              ; F86E   001B
        SLLC    R3,     1                       ; F86F   005B
        DECR    R1                              ; F870   0011
        DECR    R1                              ; F871   0011
        ADDR    R3,     R3                      ; F872   00DB
        MOVR    R7,     R3                      ; F873   00BB
        MOVR    R7,     R3                      ; F874   00BB
        MOVR    R6,     R1                      ; F875   00B1
        DECR    R1                              ; F876   0011
        SLLC    R3,     1                       ; F877   005B
        COMR    R3                              ; F878   001B
        SLLC    R3,     1                       ; F879   005B
        DECR    R1                              ; F87A   0011
        DECR    R1                              ; F87B   0011
        SLLC    R3,     1                       ; F87C   005B
        COMR    R3                              ; F87D   001B
        ADDR    R3,     R3                      ; F87E   00DB
        ADDR    R2,     R1                      ; F87F   00D1
        DECR    R5                              ; F880   0015
        RLC     R1,     2                       ; F881   0055
        DECR    R5                              ; F882   0015
        RRC     R1,     1                       ; F883   0071
        RRC     R1,     2                       ; F884   0075
        DECR    R5                              ; F885   0015
        RRC     R1,     2                       ; F886   0075
        DECR    R5                              ; F887   0015
        ADDR    R2,     R1                      ; F888   00D1
        DECR    R5                              ; F889   0015
        ADDR    R0,     R7                      ; F88A   00C7
        ADDR    R2,     R7                      ; F88B   00D7
        ADDR    R0,     R7                      ; F88C   00C7
        ADDR    R3,     R7                      ; F88D   00DF
        ADDR    R3,     R7                      ; F88E   00DF

        DECLE   $0031,  $0055,  $0053,  $0055   ; F88F   0031 0055 0053 0055
        DECLE   $0035,  $00FF,  $00FC,  $00F0   ; F893   0035 00FF 00FC 00F0
        DECLE   $00E0,  $00C0,  $00C0,  $0080   ; F897   00E0 00C0 00C0 0080
        DECLE   $0080,  $00FF,  $00FC,  $00E0   ; F89B   0080 00FF 00FC 00E0
        DECLE   $0080,  $0000,  $0000,  $0000   ; F89F   0080 0000 0000 0000
        DECLE   $0000,  $00FF,  $007E,  $003C   ; F8A3   0000 00FF 007E 003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; F8A7   0000 0000 0000 0000
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; F8AB   0000 00FF 00FF 00FF
        DECLE   $00C3,  $0081,  $0081,  $0000   ; F8AF   00C3 0081 0081 0000
        DECLE   $0000,  $0001,  $0024,  $0000   ; F8B3   0000 0001 0024 0000
        DECLE   $0000,  $0000,  $0082,  $0028   ; F8B7   0000 0000 0082 0028
        DECLE   $0000,  $0000,  $0000,  $0018   ; F8BB   0000 0000 0000 0018
        DECLE   $003C,  $001E,  $0006,  $0000   ; F8BF   003C 001E 0006 0000
        DECLE   $0000,  $00F7,  $00FB,  $00E5   ; F8C3   0000 00F7 00FB 00E5
        DECLE   $00CB,  $00E1,  $00D2,  $00A5   ; F8C7   00CB 00E1 00D2 00A5
        DECLE   $00F7,  $00EB,  $00C5,  $00AA   ; F8CB   00F7 00EB 00C5 00AA
        DECLE   $0091,  $004A,  $0095,  $00E3   ; F8CF   0091 004A 0095 00E3
        DECLE   $00F7                           ; F8D3   00F7

        ADDR    R7,     R5                      ; F8D4   00FD
        ADDR    R3,     R5                      ; F8D5   00DD
        ADDR    R1,     R2                      ; F8D6   00CA
        MOVR    R0,     R4                      ; F8D7   0084
        RLC     R2,     1                       ; F8D8   0052
        MOVR    R4,     R5                      ; F8D9   00A5
        SLLC    R1,     2                       ; F8DA   005D
        ADDR    R3,     R7                      ; F8DB   00DF

        DECLE   $00F7                           ; F8DC   00F7

        ADDR    R5,     R3                      ; F8DD   00EB
        ADDR    R2,     R7                      ; F8DE   00D7

        DECLE   $00E3,  $00E5,  $00D2,  $00A5   ; F8DF   00E3 00E5 00D2 00A5
        DECLE   $00F7,  $00FF,  $009B,  $0001   ; F8E3   00F7 00FF 009B 0001
        DECLE   $0000,  $0000                   ; F8E7   0000 0000

        INCR    R0                              ; F8E9   0008
        INCR    R5                              ; F8EA   000D
        MOVR    R3,     R7                      ; F8EB   009F

        DECLE   $00F1,  $00F7,  $00F1,  $00FD   ; F8EC   00F1 00F7 00F1 00FD
        DECLE   $00F1,  $001F,  $005F,  $005F   ; F8F0   00F1 001F 005F 005F
        DECLE   $005F,  $001F                   ; F8F4   005F 001F

        ADDR    R5,     R0                      ; F8F6   00E8
        ADDR    R1,     R2                      ; F8F7   00CA
        ADDR    R5,     R2                      ; F8F8   00EA
        ADDR    R5,     R2                      ; F8F9   00EA
        ADDR    R5,     R0                      ; F8FA   00E8
        MOVR    R1,     R7                      ; F8FB   008F
        MOVR    R5,     R7                      ; F8FC   00AF
        MOVR    R5,     R7                      ; F8FD   00AF
        MOVR    R5,     R7                      ; F8FE   00AF
        MOVR    R1,     R7                      ; F8FF   008F

        ADDR    R2,     R1                      ; F900   00D1
        MOVR    R2,     R7                      ; F901   0097

        DECLE   $00D1,  $00DD,  $00D1,  $0011   ; F902   00D1 00DD 00D1 0011
        DECLE   $00D5,  $0015,  $0075,  $0011   ; F906   00D5 0015 0075 0011
        DECLE   $001E,  $005F,  $005E,  $005E   ; F90A   001E 005F 005E 005E
        DECLE   $001E,  $0022,  $00AE,  $0022   ; F90E   001E 0022 00AE 0022
        DECLE   $00FA,  $0022,  $003E,  $00BF   ; F912   00FA 0022 003E 00BF
        DECLE   $00BF,  $00BF,  $003E,  $0022   ; F916   00BF 00BF 003E 0022
        DECLE   $00AA,  $002A,  $00AA,  $0022   ; F91A   00AA 002A 00AA 0022
        DECLE   $003F,  $00BF,  $00BF,  $00BF   ; F91E   003F 00BF 00BF 00BF
        DECLE   $003F,  $0020,  $0010,  $0008   ; F922   003F 0020 0010 0008
        DECLE   $000C,  $0008,  $0010,  $0020   ; F926   000C 0008 0010 0020
        DECLE   $0000,  $0000,  $00B0,  $000C   ; F92A   0000 0000 00B0 000C
        DECLE   $0004,  $0002,  $0002,  $0000   ; F92E   0004 0002 0002 0000
        DECLE   $0002,  $0000,  $0000,  $0010   ; F932   0002 0000 0000 0010
        DECLE   $0038,  $0044,  $0082,  $0000   ; F936   0038 0044 0082 0000
        DECLE   $0000,  $0000,  $001A,  $0060   ; F93A   0000 0000 001A 0060
        DECLE   $0040,  $0080,  $0080,  $0000   ; F93E   0040 0080 0080 0000
        DECLE   $0080,  $0004,  $0008,  $0010   ; F942   0080 0004 0008 0010
        DECLE   $0030,  $0010,  $0008,  $0004   ; F946   0030 0010 0008 0004
        DECLE   $0000,  $0080,  $0000,  $0080   ; F94A   0000 0080 0000 0080
        DECLE   $0080,  $0040,  $0060,  $001A   ; F94E   0080 0040 0060 001A
        DECLE   $0000,  $0000,  $0000,  $0082   ; F952   0000 0000 0000 0082
        DECLE   $0044,  $0038,  $0010,  $0000   ; F956   0044 0038 0010 0000
        DECLE   $0000,  $0002,  $0000,  $0002   ; F95A   0000 0002 0000 0002
        DECLE   $0002,  $0004,  $000C,  $00B0   ; F95E   0002 0004 000C 00B0
        DECLE   $0000,  $0000,  $0000,  $0000   ; F962   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0003   ; F966   0000 0000 0000 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; F96A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F96E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F972   0000 0000 0000 0000
        DECLE   $0000,  $0006,  $0004,  $0004   ; F976   0000 0006 0004 0004
        DECLE   $0008,  $0008,  $0000,  $0000   ; F97A   0008 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F97E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F982   0000 0000 0000 0000
        DECLE   $0000,  $00C0,  $0080,  $0040   ; F986   0000 00C0 0080 0040
        DECLE   $0020,  $0010,  $0008,  $0000   ; F98A   0020 0010 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F98E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F992   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F996   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F99A   0000 0000 0000 0000
        DECLE   $0000,  $00C0,  $0030,  $0000   ; F99E   0000 00C0 0030 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F9A2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F9A6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0020,  $0020   ; F9AA   0000 0000 0020 0020
        DECLE   $0040,  $00C0,  $0000,  $0000   ; F9AE   0040 00C0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F9B2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F9B6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0004   ; F9BA   0000 0000 0004 0004
        DECLE   $0004,  $0004,  $000C,  $0000   ; F9BE   0004 0004 000C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F9C2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F9C6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F9CA   0000 0000 0000 0000
        DECLE   $0080,  $0040,  $0060,  $0000   ; F9CE   0080 0040 0060 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F9D2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F9D6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0040   ; F9DA   0000 0000 0080 0040
        DECLE   $0020,  $0010,  $0008,  $0004   ; F9DE   0020 0010 0008 0004
        DECLE   $0003,  $0000,  $0000,  $0000   ; F9E2   0003 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F9E6   0000 0000 0000 0000
        DECLE   $0080,  $0040,  $0020,  $0010   ; F9EA   0080 0040 0020 0010
        DECLE   $000C,  $0000,  $0000,  $0000   ; F9EE   000C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F9F2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0060   ; F9F6   0000 0000 0000 0060
        DECLE   $0018,  $0000,  $0000,  $0000   ; F9FA   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F9FE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00C0   ; FA02   0000 0000 0000 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; FA06   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FA0A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FA0E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FA12   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0030   ; FA16   0000 0000 0000 0030
        DECLE   $0008,  $0004,  $0000,  $0000   ; FA1A   0008 0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FA1E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; FA22   0000 0000 0000 0040
        DECLE   $0020,  $0010,  $0010,  $0000   ; FA26   0020 0010 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FA2A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FA2E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $0020   ; FA32   0000 0000 0040 0020
        DECLE   $0010,  $0008,  $0004,  $0002   ; FA36   0010 0008 0004 0002
        DECLE   $0001,  $0001,  $0000,  $0000   ; FA3A   0001 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FA3E   0000 0000 0000 0000
        DECLE   $0000,  $0064,  $00FC,  $00B0   ; FA42   0000 0064 00FC 00B0
        DECLE   $0078,  $0018,  $0000,  $0000   ; FA46   0078 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FA4A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; FA4E   0000 0000 0000 000C
        DECLE   $0038,  $0004,  $000C,  $0048   ; FA52   0038 0004 000C 0048
        DECLE   $00E0,  $0078,  $0000,  $0000   ; FA56   00E0 0078 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FA5A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; FA5E   0000 0000 0000 000C
        DECLE   $0038,  $0004,  $000C,  $0008   ; FA62   0038 0004 000C 0008
        DECLE   $0040,  $0038,  $0030,  $0000   ; FA66   0040 0038 0030 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FA6A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; FA6E   0000 0000 0000 000C
        DECLE   $0038,  $0004,  $000C,  $0008   ; FA72   0038 0004 000C 0008
        DECLE   $0000,  $0058,  $0078,  $0060   ; FA76   0000 0058 0078 0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; FA7A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; FA7E   0000 0000 0000 000C
        DECLE   $0038,  $0004,  $000C,  $0008   ; FA82   0038 0004 000C 0008
        DECLE   $0000,  $0018,  $001C,  $003C   ; FA86   0000 0018 001C 003C
        DECLE   $0038,  $0020,  $0000,  $0000   ; FA8A   0038 0020 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; FA8E   0000 0000 0000 000C
        DECLE   $0038,  $0004,  $000C,  $0000   ; FA92   0038 0004 000C 0000
        DECLE   $0000,  $0008,  $000C,  $001C   ; FA96   0000 0008 000C 001C
        DECLE   $001C,  $000C,  $0008,  $0000   ; FA9A   001C 000C 0008 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; FA9E   0000 0000 0000 000C
        DECLE   $0038,  $0004,  $000C,  $0000   ; FAA2   0038 0004 000C 0000
        DECLE   $0000,  $0018,  $0018,  $0018   ; FAA6   0000 0018 0018 0018
        DECLE   $000C,  $000C,  $0004,  $0002   ; FAAA   000C 000C 0004 0002
        DECLE   $0000,  $0000,  $0000,  $000C   ; FAAE   0000 0000 0000 000C
        DECLE   $0038,  $0004,  $000C,  $0000   ; FAB2   0038 0004 000C 0000
        DECLE   $0000,  $0018,  $0018,  $000C   ; FAB6   0000 0018 0018 000C
        DECLE   $000C,  $0006,  $0000,  $0000   ; FABA   000C 0006 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; FABE   0000 0000 0000 000C
        DECLE   $0038,  $0004,  $000C,  $0000   ; FAC2   0038 0004 000C 0000
        DECLE   $0000,  $001C,  $000E,  $0006   ; FAC6   0000 001C 000E 0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; FACA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FACE   0000 0000 0000 0000
        DECLE   $003C,  $0004,  $000C,  $0000   ; FAD2   003C 0004 000C 0000
        DECLE   $0000,  $000E,  $0007,  $0000   ; FAD6   0000 000E 0007 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FADA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FADE   0000 0000 0000 0000
        DECLE   $003C,  $0002,  $0006,  $0000   ; FAE2   003C 0002 0006 0000
        DECLE   $0006,  $0003,  $0000,  $0000   ; FAE6   0006 0003 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FAEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0030   ; FAEE   0000 0000 0000 0030
        DECLE   $003C,  $0002,  $0002,  $0000   ; FAF2   003C 0002 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FAF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FAFA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; FAFE   0000 0000 0000 0006
        DECLE   $003E,  $0070,  $0060,  $0020   ; FB02   003E 0070 0060 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; FB06   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FB0A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; FB0E   0000 0000 0000 0002
        DECLE   $0036,  $0034,  $0060,  $0040   ; FB12   0036 0034 0060 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; FB16   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FB1A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; FB1E   0000 0000 0000 0001
        DECLE   $0033,  $0000,  $0008,  $0018   ; FB22   0033 0000 0008 0018
        DECLE   $0000,  $0000,  $0064,  $0078   ; FB26   0000 0000 0064 0078
        DECLE   $0004,  $0002,  $0000,  $0000   ; FB2A   0004 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FB2E   0000 0000 0000 0000
        DECLE   $0031,  $0000,  $0000,  $0000   ; FB32   0031 0000 0000 0000
        DECLE   $0000,  $0010,  $0018,  $0000   ; FB36   0000 0010 0018 0000
        DECLE   $00C0,  $0070,  $0018,  $0000   ; FB3A   00C0 0070 0018 0000
        DECLE   $0001,  $0000,  $0000,  $0040   ; FB3E   0001 0000 0000 0040
        DECLE   $0023,  $0000,  $0000,  $0000   ; FB42   0023 0000 0000 0000
        DECLE   $0000,  $0000,  $0020,  $0030   ; FB46   0000 0000 0020 0030
        DECLE   $0000,  $0000,  $0080,  $00C0   ; FB4A   0000 0000 0080 00C0
        DECLE   $00C0,  $0066,  $0020,  $0002   ; FB4E   00C0 0066 0020 0002
        DECLE   $00C3,  $0000,  $0000,  $0000   ; FB52   00C3 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FB56   0000 0000 0000 0000
        DECLE   $0020,  $0030,  $0000,  $00C4   ; FB5A   0020 0030 0000 00C4
        DECLE   $00C2,  $0060,  $0020,  $0002   ; FB5E   00C2 0060 0020 0002
        DECLE   $0082,  $0000,  $0000,  $0000   ; FB62   0082 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FB66   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0000,  $004C   ; FB6A   0000 0010 0000 004C
        DECLE   $0080,  $0000,  $0000,  $0081   ; FB6E   0080 0000 0000 0081
        DECLE   $0081,  $0008,  $001C,  $00FC   ; FB72   0081 0008 001C 00FC
        DECLE   $007C,  $007C,  $007C,  $00F0   ; FB76   007C 007C 007C 00F0
        DECLE   $00F0,  $00F8,  $007C,  $003E   ; FB7A   00F0 00F8 007C 003E
        DECLE   $003E,  $003C,  $0038,  $0030   ; FB7E   003E 003C 0038 0030
        DECLE   $0000,  $0008,  $001C,  $0078   ; FB82   0000 0008 001C 0078
        DECLE   $007C,  $007C,  $007C,  $00F0   ; FB86   007C 007C 007C 00F0
        DECLE   $00F0,  $00F8,  $007C,  $003E   ; FB8A   00F0 00F8 007C 003E
        DECLE   $003E,  $003C,  $0038,  $0030   ; FB8E   003E 003C 0038 0030
        DECLE   $0000,  $0008,  $000C,  $0038   ; FB92   0000 0008 000C 0038
        DECLE   $007C,  $007C,  $00F8,  $00F0   ; FB96   007C 007C 00F8 00F0
        DECLE   $00F0,  $00F8,  $007C,  $003C   ; FB9A   00F0 00F8 007C 003C
        DECLE   $003C,  $003C,  $0038,  $0030   ; FB9E   003C 003C 0038 0030
        DECLE   $0000,  $0008,  $000C,  $0038   ; FBA2   0000 0008 000C 0038
        DECLE   $007C,  $007C,  $00F8,  $00F0   ; FBA6   007C 007C 00F8 00F0
        DECLE   $00F0,  $00F8,  $007C,  $003C   ; FBAA   00F0 00F8 007C 003C
        DECLE   $003C,  $003C,  $0038,  $0030   ; FBAE   003C 003C 0038 0030
        DECLE   $0000,  $0008,  $000C,  $0038   ; FBB2   0000 0008 000C 0038
        DECLE   $003C,  $007C,  $0078,  $00F0   ; FBB6   003C 007C 0078 00F0
        DECLE   $00F0,  $00F8,  $0078,  $003C   ; FBBA   00F0 00F8 0078 003C
        DECLE   $003C,  $003C,  $0038,  $0030   ; FBBE   003C 003C 0038 0030
        DECLE   $0000,  $0008,  $000C,  $0038   ; FBC2   0000 0008 000C 0038
        DECLE   $003C,  $007C,  $0078,  $00F0   ; FBC6   003C 007C 0078 00F0
        DECLE   $00F0,  $00F8,  $007C,  $003C   ; FBCA   00F0 00F8 007C 003C
        DECLE   $003C,  $003C,  $0038,  $0030   ; FBCE   003C 003C 0038 0030
        DECLE   $0000,  $0008,  $0010,  $0038   ; FBD2   0000 0008 0010 0038
        DECLE   $0078,  $007C,  $00F8,  $00E0   ; FBD6   0078 007C 00F8 00E0
        DECLE   $00E0,  $0070,  $0070,  $0078   ; FBDA   00E0 0070 0070 0078
        DECLE   $0038,  $0038,  $0038,  $0030   ; FBDE   0038 0038 0038 0030
        DECLE   $0000,  $0008,  $0010,  $0038   ; FBE2   0000 0008 0010 0038
        DECLE   $0078,  $0078,  $00F8,  $00E0   ; FBE6   0078 0078 00F8 00E0
        DECLE   $00E0,  $00F0,  $0070,  $0078   ; FBEA   00E0 00F0 0070 0078
        DECLE   $0038,  $0038,  $0038,  $0030   ; FBEE   0038 0038 0038 0030
        DECLE   $0000,  $0008,  $0010,  $0038   ; FBF2   0000 0008 0010 0038
        DECLE   $0078,  $007C,  $00FC,  $00F0   ; FBF6   0078 007C 00FC 00F0
        DECLE   $00F0,  $0070,  $0078,  $0038   ; FBFA   00F0 0070 0078 0038
        DECLE   $0038,  $0038,  $0038,  $0038   ; FBFE   0038 0038 0038 0038
        DECLE   $0000,  $0008,  $0010,  $0038   ; FC02   0000 0008 0010 0038
        DECLE   $0038,  $007C,  $007C,  $00F0   ; FC06   0038 007C 007C 00F0
        DECLE   $00F0,  $0078,  $0078,  $0038   ; FC0A   00F0 0078 0078 0038
        DECLE   $0038,  $0038,  $0038,  $0038   ; FC0E   0038 0038 0038 0038
        DECLE   $0000,  $0006,  $000E,  $001E   ; FC12   0000 0006 000E 001E
        DECLE   $003E,  $007C,  $0078,  $00F0   ; FC16   003E 007C 0078 00F0
        DECLE   $00F0,  $00F8,  $0078,  $0038   ; FC1A   00F0 00F8 0078 0038
        DECLE   $003C,  $003C,  $003C,  $003C   ; FC1E   003C 003C 003C 003C
        DECLE   $0000,  $0006,  $003E,  $007E   ; FC22   0000 0006 003E 007E
        DECLE   $007C,  $007C,  $00F8,  $00F0   ; FC26   007C 007C 00F8 00F0
        DECLE   $00F0,  $00F8,  $0078,  $007C   ; FC2A   00F0 00F8 0078 007C
        DECLE   $003C,  $003C,  $003C,  $003C   ; FC2E   003C 003C 003C 003C
        DECLE   $0000,  $0006,  $003E,  $003C   ; FC32   0000 0006 003E 003C
        DECLE   $003E,  $003E,  $003C,  $0078   ; FC36   003E 003E 003C 0078
        DECLE   $0078,  $0078,  $0078,  $007C   ; FC3A   0078 0078 0078 007C
        DECLE   $003C,  $003C,  $001E,  $001E   ; FC3E   003C 003C 001E 001E
        DECLE   $0000,  $0006,  $003E,  $003C   ; FC42   0000 0006 003E 003C
        DECLE   $003E,  $003E,  $003C,  $003C   ; FC46   003E 003E 003C 003C
        DECLE   $0078,  $0078,  $007C,  $007C   ; FC4A   0078 0078 007C 007C
        DECLE   $006C,  $0066,  $0066,  $0062   ; FC4E   006C 0066 0066 0062
        DECLE   $0000,  $0000,  $0000,  $0010   ; FC52   0000 0000 0000 0010
        DECLE   $0038,  $007C,  $007C,  $0070   ; FC56   0038 007C 007C 0070
        DECLE   $0070,  $0070,  $0078,  $003C   ; FC5A   0070 0070 0078 003C
        DECLE   $001D,  $000D,  $001D,  $0038   ; FC5E   001D 000D 001D 0038
        DECLE   $0018,  $0000,  $0000,  $0000   ; FC62   0018 0000 0000 0000
        DECLE   $0000,  $0010,  $0038,  $0078   ; FC66   0000 0010 0038 0078
        DECLE   $0078,  $0070,  $0070,  $0070   ; FC6A   0078 0070 0070 0070
        DECLE   $0077,  $0037,  $003B,  $007B   ; FC6E   0077 0037 003B 007B
        DECLE   $007B,  $0000,  $0000,  $0000   ; FC72   007B 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; FC76   0000 0000 0000 0010
        DECLE   $00F8,  $00F8,  $0078,  $00F0   ; FC7A   00F8 00F8 0078 00F0
        DECLE   $00F0,  $00F4,  $0037,  $0073   ; FC7E   00F0 00F4 0037 0073
        DECLE   $00F0,  $0000,  $0000,  $0000   ; FC82   00F0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC86   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $007C,  $00FC   ; FC8A   0000 0000 007C 00FC
        DECLE   $00F8,  $00FC,  $007E,  $0077   ; FC8E   00F8 00FC 007E 0077
        DECLE   $0067,  $0000,  $0000,  $0000   ; FC92   0067 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC96   0000 0000 0000 0000
        DECLE   $0000,  $0030,  $007C,  $00FC   ; FC9A   0000 0030 007C 00FC
        DECLE   $00F8,  $00FC,  $006E,  $0067   ; FC9E   00F8 00FC 006E 0067
        DECLE   $0043,  $0080,  $0000,  $0000   ; FCA2   0043 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCA6   0000 0000 0000 0000
        DECLE   $0000,  $00A0,  $0040,  $00A0   ; FCAA   0000 00A0 0040 00A0
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCAE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0028,  $0000   ; FCB2   0000 0000 0028 0000
        DECLE   $0054,  $0020,  $0008,  $0000   ; FCB6   0054 0020 0008 0000
        DECLE   $0000,  $0050,  $0002,  $0080   ; FCBA   0000 0050 0002 0080
        DECLE   $0012,  $0000,  $0042,  $0008   ; FCBE   0012 0000 0042 0008
        DECLE   $0000,  $0000,  $0010,  $001C   ; FCC2   0000 0000 0010 001C
        DECLE   $001E,  $0019,  $0010,  $0010   ; FCC6   001E 0019 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; FCCA   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; FCCE   0010 0010 0010 0010
        DECLE   $0010,  $0000,  $0010,  $001A   ; FCD2   0010 0000 0010 001A
        DECLE   $001C,  $0010,  $0010,  $0010   ; FCD6   001C 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; FCDA   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; FCDE   0010 0010 0010 0010
        DECLE   $0010,  $0000,  $0012,  $001C   ; FCE2   0010 0000 0012 001C
        DECLE   $001C,  $0018,  $0010,  $0010   ; FCE6   001C 0018 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; FCEA   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; FCEE   0010 0010 0010 0010
        DECLE   $0010,  $0002,  $0014,  $001C   ; FCF2   0010 0002 0014 001C
        DECLE   $0018,  $0018,  $0010,  $0010   ; FCF6   0018 0018 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; FCFA   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; FCFE   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0030,  $0010   ; FD02   0010 0010 0030 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; FD06   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; FD0A   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; FD0E   0010 0010 0010 0010
        DECLE   $0010,  $0000,  $0010,  $0018   ; FD12   0010 0000 0010 0018
        DECLE   $0018,  $0018,  $0010,  $0010   ; FD16   0018 0018 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; FD1A   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; FD1E   0010 0010 0010 0010
        DECLE   $0010,  $0000,  $0010,  $0018   ; FD22   0010 0000 0010 0018
        DECLE   $001C,  $001C,  $0012,  $0010   ; FD26   001C 001C 0012 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; FD2A   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; FD2E   0010 0010 0010 0010
        DECLE   $0010,  $0000,  $0010,  $0018   ; FD32   0010 0000 0010 0018
        DECLE   $0018,  $001C,  $0014,  $0012   ; FD36   0018 001C 0014 0012
        DECLE   $0010,  $0010,  $0010,  $0010   ; FD3A   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; FD3E   0010 0010 0010 0010
        DECLE   $0010,  $0000,  $0010,  $0010   ; FD42   0010 0000 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0030   ; FD46   0010 0010 0010 0030
        DECLE   $0010,  $0010,  $0010,  $0010   ; FD4A   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; FD4E   0010 0010 0010 0010
        DECLE   $0010,  $0000                   ; FD52   0010 0000

        DECR    R0                              ; FD54   0010
        DECR    R0                              ; FD55   0010
        COMR    R0                              ; FD56   0018
        COMR    R0                              ; FD57   0018
        COMR    R0                              ; FD58   0018
        DECR    R0                              ; FD59   0010
        DECR    R0                              ; FD5A   0010
        DECR    R0                              ; FD5B   0010
        DECR    R0                              ; FD5C   0010
        DECR    R0                              ; FD5D   0010
        DECR    R0                              ; FD5E   0010
        DECR    R0                              ; FD5F   0010
        DECR    R0                              ; FD60   0010
        DECR    R0                              ; FD61   0010
        DECR    R0                              ; FD62   0010
        CMP@    R3,     R0                      ; FD63   0358
        BEQ     L_FD7B                          ; FD64   0204 0015

        CMPI    #$00FF, R0                      ; FD66   0378 00FF
        BEQ     L_FD7B                          ; FD68   0204 0011

        PSHR    R5                              ; FD6A   0275
        MVI     G_015D, R5                      ; FD6B   0285 015D
        DECR    R5                              ; FD6D   0015
        BLE     L_FD7B                          ; FD6E   0206 000B

        MVI     G_01DC, R5                      ; FD70   0285 01DC
        CMPI    #$0000, R5                      ; FD72   037D 0000
        BNEQ    L_FD7B                          ; FD74   020C 0005

        CMP     G_015E, R1                      ; FD76   0341 015E
        BEQ     L_FD7B                          ; FD78   0204 0001

        PULR    R5                              ; FD7A   02B5
L_FD7B:
        PULR    R7                              ; FD7B   02B7

        DECLE   $0001,  $0012,  $0006,  $0000   ; FD7C   0001 0012 0006 0000
        DECLE   $000A,  $0004,  $0008,  $0002   ; FD80   000A 0004 0008 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000A   ; FD88   0000 0000 0000 000A
        DECLE   $0000,  $0000,  $0000,  $0007   ; FD8C   0000 0000 0000 0007
        DECLE   $0000,  $0004,  $0001,  $0000   ; FD90   0000 0004 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0007   ; FD94   0000 0000 0000 0007
        DECLE   $0000,  $0000,  $000B,  $0008   ; FD98   0000 0000 000B 0008
        DECLE   $0000,  $0003,  $0000,  $0004   ; FD9C   0000 0003 0000 0004

        INCR    R7                              ; FDA0   000F

        DECR    R0                              ; FDA1   0010
L_FDA2:
        INCR    R4                              ; FDA2   000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDA3   0000 0000 0000 0000
        DECLE   $0006,  $0000,  $0000,  $000A   ; FDA7   0006 0000 0000 000A
        DECLE   $0009,  $0000,  $0002,  $0000   ; FDAB   0009 0000 0002 0000
        DECLE   $0005,  $000E,  $0001,  $000D   ; FDAF   0005 000E 0001 000D
        DECLE   $0000,  $0275,  $02BC,  $0128   ; FDB3   0000 0275 02BC 0128
        DECLE   $00A5,  $0001,  $02A0,  $0010   ; FDB7   00A5 0001 02A0 0010
        DECLE   $020B,  $00B6,  $0268,  $0040   ; FDBB   020B 00B6 0268 0040
        DECLE   $0268,  $0280,  $010E,  $0378   ; FDBF   0268 0280 010E 0378
        DECLE   $005A,  $0204,  $00AD,  $0280   ; FDC3   005A 0204 00AD 0280
        DECLE   $0112,  $0378,  $005A,  $0204   ; FDC7   0112 0378 005A 0204
        DECLE   $00A7,  $0004,  $01AC,  $01D3   ; FDCB   00A7 0004 01AC 01D3
        DECLE   $0004,  $01AC,  $021D,  $02B7   ; FDCF   0004 01AC 021D 02B7
        DECLE   $0275,  $0280,  $010E,  $02BC   ; FDD3   0275 0280 010E 02BC
        DECLE   $010B,  $0004                   ; FDD7   010B 0004

        ANDR    R5,     R4                      ; FDD9   01AC
        XORR    R4,     R0                      ; FDDA   01E0
        MVI     G_0112, R0                      ; FDDB   0280 0112
        MVII    #$010F, R4                      ; FDDD   02BC 010F
        INCR    R7                              ; FDDF   000F

        PSHR    R5                              ; FDE0   0275
L_FDE1:
        MOVR    R0,     R1                      ; FDE1   0081
        DECLE   $0065,  $0065,  $0061,  $0001   ; FDE2   0065 0065 0061 0001
        DECLE   $02F9,  $007C,  $00AD,  $0289   ; FDE6   02F9 007C 00AD 0289
        DECLE   $0079,  $0201,  $001B,  $0079   ; FDEA   0079 0201 001B 0079
        DECLE   $0201,  $001C,  $0082,  $03B8   ; FDEE   0201 001C 0082 03B8
        DECLE   $0010,  $0204,  $0013,  $03BA   ; FDF2   0010 0204 0013 03BA
        DECLE   $000F,  $0001                   ; FDF6   000F 0001

        ADDI    #$0084, R2                      ; FDF8   02FA 0084
        TSTR    R5                              ; FDFA   00AD
        ADD@    R2,     R1                      ; FDFB   02D1
        CMPI    #$000A, R1                      ; FDFC   0379 000A
        BLE     L_FE0A                          ; FDFE   0206 000A

        SUBI    #$000B, R1                      ; FE00   0339 000B
        BEQ     L_FE0A                          ; FE02   0204 0006

        ADDI    #$000A, R1                      ; FE04   02F9 000A
        B       L_FE0A                          ; FE06   0200 0002

        MVII    #$00FF, R1                      ; FE08   02B9 00FF
L_FE0A:
        MVO@    R1,     R4                      ; FE0A   0261
        PULR    R7                              ; FE0B   02B7

        MVII    #$00FF, R2                      ; FE0C   02BA 00FF
        MVO@    R2,     R4                      ; FE0E   0262
        XORI    #$00FF, R1                      ; FE0F   03F9 00FF
        MVO@    R1,     R4                      ; FE11   0261
        MOVR    R0,     R1                      ; FE12   0081
        ANDI    #$001F, R1                      ; FE13   03B9 001F
        SDBD                                    ; FE15   0001
        ADDI    #$AD94, R1                      ; FE16   02F9 0094 00AD
        MVI@    R1,     R1                      ; FE19   0289
        DECR    R1                              ; FE1A   0011
        MVO@    R1,     R4                      ; FE1B   0261
        PULR    R7                              ; FE1C   02B7

        DECLE   $0275,  $01C9,  $02BA,  $010B   ; FE1D   0275 01C9 02BA 010B
        DECLE   $02BB,  $0113,  $0284,  $0337   ; FE21   02BB 0113 0284 0337
        DECLE   $0004,  $01AC,  $0231           ; FE25   0004 01AC 0231

        MVII    #$0001, R1                      ; FE28   02B9 0001
        MVII    #$010F, R2                      ; FE2A   02BA 010F
        MVII    #$0116, R3                      ; FE2C   02BB 0116
        MVI     G_0337, R4                      ; FE2E   0284 0337
        INCR    R7                              ; FE30   000F

        PSHR    R5                              ; FE31   0275
L_FE32:
        MVII    #$0002, R5                      ; FE32   02BD 0002
L_FE34:
        PSHR    R5                              ; FE34   0275
        MVI@    R2,     R0                      ; FE35   0290
        CMP@    R3,     R0                      ; FE36   0358
        BNEQ    L_FE50                          ; FE37   020C 0017

        CMPI    #$00FF, R0                      ; FE39   0378 00FF
        BEQ     L_FE68                          ; FE3B   0204 002B

        TSTR    R5                              ; FE3D   00AD
        BNEQ    L_FE57                          ; FE3E   020C 0017

        PSHR    R1                              ; FE40   0271
        ADDI    #$0126, R1                      ; FE41   02F9 0126
        MVI@    R1,     R5                      ; FE43   028D
        DECR    R5                              ; FE44   0015
        MVO@    R5,     R1                      ; FE45   024D
        PULR    R1                              ; FE46   02B1
        BPL     L_FE57                          ; FE47   0203 000E

        MVII    #$00FF, R5                      ; FE49   02BD 00FF
        MVO@    R5,     R3                      ; FE4B   025D
        MVII    #$0003, R5                      ; FE4C   02BD 0003
        B       L_FE52                          ; FE4E   0200 0002

L_FE50:
        MVII    #$001E, R5                      ; FE50   02BD 001E
L_FE52:
        PSHR    R1                              ; FE52   0271
        ADDI    #$0126, R1                      ; FE53   02F9 0126
        MVO@    R5,     R1                      ; FE55   024D
        PULR    R1                              ; FE56   02B1
L_FE57:
        PSHR    R4                              ; FE57   0274
        PSHR    R3                              ; FE58   0273
        PSHR    R2                              ; FE59   0272
        NOP                                     ; FE5A   0034
        PSHR    R1                              ; FE5B   0271
        MOVR    R7,     R5                      ; FE5C   00BD
        ADDI    #$0004, R5                      ; FE5D   02FD 0004
        SDBD                                    ; FE5F   0001
        MVI@    R4,     R7                      ; FE60   02A7

        DECLE   $0004                           ; FE61   0004

        ANDR    R5,     R4                      ; FE62   01AC
        MVI@    R2,     R2                      ; FE63   0292
        PULR    R1                              ; FE64   02B1
        PULR    R2                              ; FE65   02B2
        PULR    R3                              ; FE66   02B3
        PULR    R4                              ; FE67   02B4
L_FE68:
        MVI@    R2,     R0                      ; FE68   0290
        MVO@    R0,     R3                      ; FE69   0258
        INCR    R2                              ; FE6A   000A
        INCR    R3                              ; FE6B   000B
        ADDI    #$0002, R4                      ; FE6C   02FC 0002
        PULR    R5                              ; FE6E   02B5
        DECR    R5                              ; FE6F   0015
        BPL     L_FE34                          ; FE70   0223 003D
        PULR    R7                              ; FE72   02B7

        MVII    #$00FF, R3                      ; FE73   02BB 00FF
        MVO     R3,     G_01EC                  ; FE75   0243 01EC
        CLRR    R3                              ; FE77   01DB
        MVII    #$01FB, R4                      ; FE78   02BC 01FB
        MOVR    R4,     R5                      ; FE7A   00A5
        MVI@    R4,     R0                      ; FE7B   02A0
        MVO@    R3,     R5                      ; FE7C   026B
        MVI@    R4,     R1                      ; FE7D   02A1
        MVO@    R3,     R5                      ; FE7E   026B
        MVI@    R4,     R2                      ; FE7F   02A2
        MVO@    R3,     R5                      ; FE80   026B
        PSHR    R2                              ; FE81   0272

        JSR     R5,     .EXEC.4C3               ; FE82   0004 0114 00C3
        DECLE   $02B2,  $02BC,  $01FB,  $0260   ; FE85   02B2 02BC 01FB 0260
        DECLE   $0261,  $0262,  $0004           ; FE89   0261 0262 0004

        ANDR    R5,     R4                      ; FE8C   01AC
        MVI@    R2,     R2                      ; FE8D   0292
        CLRR    R0                              ; FE8E   01C0
        MVO     R0,     G_01EC                  ; FE8F   0240 01EC
        PULR    R7                              ; FE91   02B7

        PSHR    R5                              ; FE92   0275
        SDBD                                    ; FE93   0001
        MVII    #$2A30, R0                      ; FE94   02B8 0030 002A
        MVO     R0,     G_0128                  ; FE97   0240 0128
        SWAP    R0,     1                       ; FE99   0040
        MVO     R0,     G_0129                  ; FE9A   0240 0129
        PULR    R7                              ; FE9C   02B7

        DECLE   $0006,  $0019,  $0005           ; FE9D   0006 0019 0005

        NEGR    R5                              ; FEA0   0025

        JSRD    R4,     .EXEC.008               ; FEA1   0004 0012 0008

        COMR    R6                              ; FEA4   001E
        ADDR    R6,     R0                      ; FEA5   00F0
        ADDR    R4,     R4                      ; FEA6   00E4
        ADDR    R2,     R0                      ; FEA7   00D0
        ADDR    R0,     R0                      ; FEA8   00C0
        MOVR    R6,     R0                      ; FEA9   00B0
        TSTR    R4                              ; FEAA   00A4
        MOVR    R3,     R4                      ; FEAB   009C
        MOVR    R2,     R4                      ; FEAC   0094
        MOVR    R1,     R4                      ; FEAD   008C
        MOVR    R1,     R0                      ; FEAE   0088
        MOVR    R0,     R4                      ; FEAF   0084
        TSTR    R0                              ; FEB0   0080
        MOVR    R0,     R7                      ; FEB1   0087

        CMPR    R2,     R4                      ; FEB2   0154
        DECR    R2                              ; FEB3   0012
        DECR    R1                              ; FEB4   0011
        DECR    R4                              ; FEB5   0014
L_FEB6:
        DECR    R7                              ; FEB6   0017

        DECLE   $001B,  $001F,  $0023,  $0027   ; FEB7   001B 001F 0023 0027
        DECLE   $002B,  $002F,  $0033,  $0037   ; FEBB   002B 002F 0033 0037
        DECLE   $0000,  $000A,  $0000,  $015D   ; FEBF   0000 000A 0000 015D
        DECLE   $0152,  $0146,  $013B,  $0130   ; FEC3   0152 0146 013B 0130
        DECLE   $0125,  $0119,  $010E,  $0103   ; FEC7   0125 0119 010E 0103
        DECLE   $00F8,  $00EC,  $00E1,  $00D6   ; FECB   00F8 00EC 00E1 00D6
        DECLE   $00CB,  $00BF                   ; FECF   00CB 00BF

        MOVR    R6,     R4                      ; FED1   00B4
        MOVR    R5,     R1                      ; FED2   00A9
        MOVR    R3,     R6                      ; FED3   009E
        TSTR    R2                              ; FED4   0092
        MOVR    R0,     R7                      ; FED5   0087

        SARC    R0,     2                       ; FED6   007C
        RRC     R1,     1                       ; FED7   0071
        SLR     R1,     2                       ; FED8   0065
        SLLC    R2,     1                       ; FED9   005A
        SLL     R3,     2                       ; FEDA   004F
        SWAP    R0,     2                       ; FEDB   0044
        RSWD    R0                              ; FEDC   0038
        ADCR    R5                              ; FEDD   002D
        NEGR    R2                              ; FEDE   0022
L_FEDF:
        DECR    R7                              ; FEDF   0017

        DECLE   $000B,  $0002,  $0000,  $0000   ; FEE0   000B 0002 0000 0000
        DECLE   $0000,  $0001,  $0000,  $00FF   ; FEE4   0000 0001 0000 00FF
        DECLE   $00FF,  $0000,  $0000,  $00FE   ; FEE8   00FF 0000 0000 00FE
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; FEEC   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FE,  $00FF,  $0000   ; FEF0   00FF 00FE 00FF 0000
        DECLE   $0000,  $00FF,  $00FF,  $0001   ; FEF4   0000 00FF 00FF 0001
        DECLE   $0000,  $0000,  $0000,  $0002   ; FEF8   0000 0000 0000 0002
        DECLE   $0000,  $0001,  $0000,  $0001   ; FEFC   0000 0001 0000 0001
        DECLE   $0000,  $0000,  $0004,  $0009   ; FF00   0000 0000 0004 0009
        DECLE   $000D,  $0012,  $0016,  $001B   ; FF04   000D 0012 0016 001B
        DECLE   $001F,  $0024,  $0028,  $002C   ; FF08   001F 0024 0028 002C
        DECLE   $0031,  $0035                   ; FF0C   0031 0035

        RSWD    R2                              ; FF0E   003A
        RSWD    R6                              ; FF0F   003E
        SWAP    R2,     1                       ; FF10   0042
        SWAP    R3,     2                       ; FF11   0047
        SLL     R3,     1                       ; FF12   004B
        SLL     R3,     2                       ; FF13   004F
        RLC     R3,     1                       ; FF14   0053
        SLLC    R0,     1                       ; FF15   0058
        SLLC    R0,     2                       ; FF16   005C
        SLR     R0,     1                       ; FF17   0060
        SLR     R0,     2                       ; FF18   0064
        SAR     R0,     1                       ; FF19   0068
        SAR     R0,     2                       ; FF1A   006C
        RRC     R0,     1                       ; FF1B   0070
        RRC     R0,     2                       ; FF1C   0074
        SARC    R0,     1                       ; FF1D   0078
        SARC    R0,     2                       ; FF1E   007C
        TSTR    R0                              ; FF1F   0080
        MOVR    R0,     R4                      ; FF20   0084
        MOVR    R1,     R0                      ; FF21   0088
        MOVR    R1,     R3                      ; FF22   008B
        MOVR    R1,     R7                      ; FF23   008F

        MOVR    R2,     R3                      ; FF24   0093
        MOVR    R2,     R6                      ; FF25   0096
        MOVR    R3,     R2                      ; FF26   009A
        MOVR    R3,     R6                      ; FF27   009E
        MOVR    R4,     R1                      ; FF28   00A1
        MOVR    R4,     R5                      ; FF29   00A5
        MOVR    R5,     R0                      ; FF2A   00A8
        MOVR    R5,     R3                      ; FF2B   00AB
        MOVR    R5,     R7                      ; FF2C   00AF

        MOVR    R6,     R2                      ; FF2D   00B2
        MOVR    R6,     R5                      ; FF2E   00B5
        MOVR    R7,     R0                      ; FF2F   00B8
        MOVR    R7,     R3                      ; FF30   00BB
        MOVR    R7,     R6                      ; FF31   00BE
        ADDR    R0,     R1                      ; FF32   00C1
        ADDR    R0,     R4                      ; FF33   00C4
        ADDR    R0,     R7                      ; FF34   00C7

        ADDR    R1,     R2                      ; FF35   00CA
        ADDR    R1,     R4                      ; FF36   00CC
        ADDR    R1,     R7                      ; FF37   00CF

        ADDR    R2,     R2                      ; FF38   00D2
        ADDR    R2,     R4                      ; FF39   00D4
        ADDR    R2,     R7                      ; FF3A   00D7

        ADDR    R3,     R1                      ; FF3B   00D9
        ADDR    R3,     R3                      ; FF3C   00DB
        ADDR    R3,     R6                      ; FF3D   00DE
        ADDR    R4,     R0                      ; FF3E   00E0
        ADDR    R4,     R2                      ; FF3F   00E2
        ADDR    R4,     R4                      ; FF40   00E4
        ADDR    R4,     R6                      ; FF41   00E6
        ADDR    R5,     R0                      ; FF42   00E8
        ADDR    R5,     R2                      ; FF43   00EA
        ADDR    R5,     R4                      ; FF44   00EC
        ADDR    R5,     R5                      ; FF45   00ED
        ADDR    R5,     R7                      ; FF46   00EF

        DECLE   $00F1,  $00F2,  $00F3,  $00F5   ; FF47   00F1 00F2 00F3 00F5
        DECLE   $00F6,  $00F7,  $00F8,  $00F9   ; FF4B   00F6 00F7 00F8 00F9
        DECLE   $00FA,  $00FB,  $00FC,  $00FD   ; FF4F   00FA 00FB 00FC 00FD
        DECLE   $00FE,  $00FE,  $00FF,  $00FF   ; FF53   00FE 00FE 00FF 00FF
        DECLE   $00FF                           ; FF57   00FF

        SUBR    R0,     R0                      ; FF58   0100
        SUBR    R0,     R0                      ; FF59   0100
        SUBR    R0,     R0                      ; FF5A   0100
        SUBR    R0,     R0                      ; FF5B   0100
        SLR     R2,     1                       ; FF5C   0062
        MOVR    R5,     R7                      ; FF5D   00AF

        MOVR    R3,     R5                      ; FF5E   009D
        MOVR    R5,     R7                      ; FF5F   00AF

        MOVR    R6,     R5                      ; FF60   00B5
        MOVR    R5,     R7                      ; FF61   00AF

        DECLE   $0025,  $0000,  $0001,  $0048   ; FF62   0025 0000 0001 0048
        DECLE   $0003,  $0048,  $0005           ; FF66   0003 0048 0005

        SLL     R0,     1                       ; FF69   0048
        MOVR    R0,     R1                      ; FF6A   0081
        SWAP    R0,     1                       ; FF6B   0040
        MOVR    R0,     R3                      ; FF6C   0083
        SWAP    R0,     1                       ; FF6D   0040
        MOVR    R0,     R5                      ; FF6E   0085
        SWAP    R0,     1                       ; FF6F   0040
        MOVR    R0,     R7                      ; FF70   0087

        DECLE   $0040,  $0002,  $0211,  $0040   ; FF71   0040 0002 0211 0040
        DECLE   $0113,  $0040,  $0215           ; FF75   0113 0040 0215

        SWAP    R0,     1                       ; FF78   0040
        MOVR    R2,     R1                      ; FF79   0091
        SWAP    R0,     1                       ; FF7A   0040
        MOVR    R2,     R3                      ; FF7B   0093
        SWAP    R0,     1                       ; FF7C   0040
        MOVR    R2,     R5                      ; FF7D   0095
        SWAP    R0,     1                       ; FF7E   0040
        MOVR    R2,     R7                      ; FF7F   0097

        DECLE   $0040,  $0004                   ; FF80   0040 0004

        NEGR    R1                              ; FF82   0021
        SLL     R0,     1                       ; FF83   0048
        NEGR    R3                              ; FF84   0023
        SLL     R0,     1                       ; FF85   0048
        NEGR    R5                              ; FF86   0025
        SLL     R0,     1                       ; FF87   0048
        MOVR    R4,     R1                      ; FF88   00A1
        SWAP    R0,     1                       ; FF89   0040
        MOVR    R4,     R3                      ; FF8A   00A3
        SWAP    R0,     1                       ; FF8B   0040
        MOVR    R4,     R5                      ; FF8C   00A5
        SWAP    R0,     1                       ; FF8D   0040
        MOVR    R4,     R7                      ; FF8E   00A7

        DECLE   $0040,  $0006,  $0031,  $0048   ; FF8F   0040 0006 0031 0048
        DECLE   $0033,  $0048,  $0035,  $0048   ; FF93   0033 0048 0035 0048
        DECLE   $0201,  $03FC,  $01FF,  $0004   ; FF97   0201 03FC 01FF 0004
        DECLE   $0009,  $0300,  $0024,  $0000   ; FF9B   0009 0300 0024 0000
        DECLE   $0001,  $0048,  $0003,  $0048   ; FF9F   0001 0048 0003 0048
        DECLE   $0005,  $0048,  $0202,  $0109   ; FFA3   0005 0048 0202 0109
        DECLE   $0040,  $0082,  $010D,  $0040   ; FFA7   0040 0082 010D 0040
        DECLE   $01FF,  $0004,  $0065,  $0380   ; FFAB   01FF 0004 0065 0380
        DECLE   $0075,  $0380,  $0005,  $0320   ; FFAF   0075 0380 0005 0320
        DECLE   $000D,  $0180,  $0022,  $0263   ; FFB3   000D 0180 0022 0263
        DECLE   $03DC,  $0001,  $0048,  $0003   ; FFB7   03DC 0001 0048 0003
        DECLE   $0048,  $0005                   ; FFBB   0048 0005

        SLL     R0,     1                       ; FFBD   0048
        MVI@    R1,     R7                      ; FFBE   028F

        DECLE   $01F2,  $0209,  $0040,  $0109   ; FFBF   01F2 0209 0040 0109
        DECLE   $0040,  $010B,  $0040,  $000D   ; FFC3   0040 010B 0040 000D
        DECLE   $0048,  $0211,  $0040,  $0111   ; FFC7   0048 0211 0040 0111
        DECLE   $0040,  $0113,  $0040,  $021D   ; FFCB   0040 0113 0040 021D
        DECLE   $02AF,  $0219,  $0040,  $0119   ; FFCF   02AF 0219 0040 0119
        DECLE   $0040,  $011B,  $0040,  $001B   ; FFD3   0040 011B 0040 001B
        DECLE   $0048,  $0221,  $0040,  $0121   ; FFD7   0048 0221 0040 0121
        DECLE   $0040,  $0123,  $0040,  $005F   ; FFDB   0040 0123 0040 005F
        DECLE   $0030,  $0229,  $0040,  $0129   ; FFDF   0030 0229 0040 0129
        DECLE   $0040,  $012B,  $0040,  $0241   ; FFE3   0040 012B 0040 0241
        DECLE   $0092,  $0231,  $0040,  $0131   ; FFE7   0092 0231 0040 0131
        DECLE   $0040,  $0133,  $0040,  $0035   ; FFEB   0040 0133 0040 0035
        DECLE   $0048,  $0239,  $0040,  $0139   ; FFEF   0048 0239 0040 0139
        DECLE   $0040,  $013B,  $0040,  $003F   ; FFF3   0040 013B 0040 003F
        DECLE   $0030,  $0001                   ; FFF7   0030 0001

        DECR    R0                              ; FFF9   0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFFA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; FFFE   0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5014       <entry>
;;  $501D       $5020  
;;  $5057       $5057  
;;  $507F       $507A  
;;  $50A5       $5072   $5085   $509D  
;;  $50B9       $50A5  
;;  $50C0       $5B7A   $637F   $F546  
;;  $50D1       $50CE  
;;  $50DE       $50EA  
;;  $50E4       $50D4  
;;  $50EC       $50D8   $50DC  
;;  $50F0       $50E2   $5148   $5152  
;;  $5104       $5114   $511B  
;;  $5108       $50FA  
;;  $510E       $50FE  
;;  $5112       $511D  
;;  $5116       $5110  
;;  $511F       $5102   $510A  
;;  $5122       $5106   $510C  
;;  $5136       $512A   $5131  
;;  $5145       $50E0  
;;  $514A       $50EE  
;;  $5154       $50E6  
;;  $5163       $515F  
;;  $5172       $5165  
;;  $517D       $517D  
;;  $5192       $F4E0  
;;  $5196       $50C4  
;;  $51C6       $51A4   $51AE   $51ED  
;;  $51CF       $5186  
;;  $51D9       $516D  
;;  $51EF       $51CB   $6378   $6A1D   $F542  
;;  $51FD       $5082  
;;  $520D       $5201   $5205  
;;  $5216       $523E  
;;  $5218       $5044  
;;  $521D       $503F  
;;  $5225       $5015   $54DA  
;;  $5233       $5233  
;;  $523C       $5242  
;;  $5242       $D669  
;;  $5244       $502F   $524B   $597B   $5BDE  
;;  $524D       $5059   $5251  
;;  $5254       $50B0  
;;  $525A       $5C24   $6C2E  
;;  $525B       $57CF  
;;  $525E       $5262  
;;  $5265       $6537   $654D   $65CD   $66CE   $671D   $673A   $6806  
;;  $5267       $5278  
;;  $527B       $556A   $5577   $60DE   $6481   $651E   $6541   $6565   $658A  
;;  $527B       $65FC   $661C   $669E   $66A4  
;;  $5286       $528B  
;;  $528D       $5288  
;;  $528F       $5284   $5294  
;;  $5296       $5291  
;;  $5298       $5280  
;;  $529E       $5299  
;;  $52BD       $52AD  
;;  $52C7       $52B7   $52C1  
;;  $52CE       $52CB  
;;  $52D3       $52D7  
;;  $52E1       $52DD  
;;  $52E3       $52D1   $52ED  
;;  $52F7       $52F3  
;;  $52F8       $555D   $6573   $65AC   $65C6   $65E7   $6607   $663A   $6687  
;;  $52F8       $670C   $6715   $67DA  
;;  $52FC       $530A  
;;  $530E       $64A6  
;;  $5313       $5329  
;;  $5317       $5322  
;;  $5331       $531C   $550A   $63F4   $64D3  
;;  $5338       $533D  
;;  $533F       $5339  
;;  $5343       $5347  
;;  $5349       $51E0   $5344   $5C12   $62C7   $62D5  
;;  $535D       $5352   $5356  
;;  $535E       $535B  
;;  $5361       $534D  
;;  $5374       $5378  
;;  $537F       $5384  
;;  $538A       $53A1  
;;  $539A       $538F   $5395  
;;  $539D       $5398  
;;  $53D1       $53E2  
;;  $53E6       $53B4  
;;  $5411       $541B  
;;  $541D       $53B2   $53E4  
;;  $5431       $6455  
;;  $5444       $543A   $5440   $544A  
;;  $544E       $5446  
;;  $5476       $5319   $5506   $5524   $63F1   $64D0  
;;  $5488       $547E   $5484  
;;  $548C       $51B0   $64D7  
;;  $549C       $51D9   $62F0   $64DA  
;;  $54B7       $5332   $5478  
;;  $54BE       $54C0  
;;  $54C8       $5172  
;;  $54FF       $54FA  
;;  $5505       $551C  
;;  $551B       $5517  
;;  $552F       $5543   $5551  
;;  $5531       $5537  
;;  $5545       $553F  
;;  $5553       $553B   $5549  
;;  $5566       $5570  
;;  $5572       $557D  
;;  $55FD       $637C  
;;  $55FE       $61FA  
;;  $560E       $5606  
;;  $560F       $5154  
;;  $5619       $561E  
;;  $5626       $5631  
;;  $5629       $562B  
;;  $5639       $5641  
;;  $5644       $51BA   $62EA   $64A3  
;;  $564D       $62ED   $6460  
;;  $5656       $54F3   $54FC   $57ED   $5A68   $5A93   $5B8B   $6C3F  
;;  $566C       $5666  
;;  $566E       $565E   $5664   $566A   $5680   $56F6   $56FC   $5701   $5729  
;;  $566E       $5746   $5751  
;;  $567A       $5721  
;;  $5682       $5671   $571A  
;;  $5683       $5673   $572E  
;;  $5689       $567A   $570D   $573D   $5764   $578C  
;;  $56B5       $56AD  
;;  $56B9       $56B3  
;;  $56BA       $5694   $569A   $56A1   $56A5  
;;  $56BD       $567D   $5726   $5740   $574B  
;;  $56D1       $56CB  
;;  $56DB       $56D6  
;;  $56DD       $56C3   $56C9   $56CF  
;;  $56DE       $5678  
;;  $56F8       $56F0  
;;  $56FE       $56F4  
;;  $5703       $56E0  
;;  $571D       $56E4  
;;  $5723       $56E8  
;;  $572B       $56EC  
;;  $573D       $5737  
;;  $5740       $5744  
;;  $5748       $5733   $574F  
;;  $5753       $5723   $5748  
;;  $5764       $577D  
;;  $5779       $5775  
;;  $577B       $5781  
;;  $577F       $575E  
;;  $579D       $5769   $5779  
;;  $57AB       $514F  
;;  $57AC       $64F9  
;;  $57BE       $57B8  
;;  $57CF       $57CB  
;;  $57D9       $57D5   $5C2F   $6402  
;;  $580C       $5804  
;;  $580D       $5D08   $5D15   $5D43   $5D52   $5D6B   $6001  
;;  $580E       $5182   $5820  
;;  $580F       $581D   $5C64  
;;  $5810       $5819  
;;  $581B       $5813  
;;  $586D       $586D  
;;  $5883       $508A  
;;  $589A       $5897  
;;  $58A9       $588F   $589E  
;;  $58E2       $58A7  
;;  $58EE       $58DA   $58E0  
;;  $591C       $5887  
;;  $591D       $58D6  
;;  $5936       $592C  
;;  $593A       $5930  
;;  $593C       $5934   $5938  
;;  $5940       $5921  
;;  $594C       $5136   $51CF   $5806   $5FFB   $6329  
;;  $594D       $6CD0  
;;  $59CA       $59C4  
;;  $5A07       $508D   $5C32  
;;  $5A1E       $5A22  
;;  $5A2C       $5A30  
;;  $5A34       $5A0E   $5A2A  
;;  $5A3F       $5A15  
;;  $5A40       $57F7   $5B77   $5B7E   $610F   $61F7   $6375   $63B8   $641B  
;;  $5A40       $6CCD  
;;  $5A41       $632C   $6A33  
;;  $5A73       $5A86  
;;  $5A84       $5A79  
;;  $5A89       $5A5C  
;;  $5A8F       $5A58  
;;  $5A93       $5A62   $5A8D  
;;  $5B0F       $5093  
;;  $5B2E       $5B26  
;;  $5B36       $5B30  
;;  $5B4A       $5B40  
;;  $5B63       $5B6B  
;;  $5B6D       $5B13   $5B17   $5B52  
;;  $5B6E       $5B57  
;;  $5B7D       $5BAA  
;;  $5B99       $F4D7  
;;  $5BA6       $5BB1  
;;  $5BC2       $5BB9  
;;  $5BC3       $5096  
;;  $5BEC       $5BC7   $5BCB   $5BD3  
;;  $5BF9       $5050  
;;  $5BFA       $6289  
;;  $5C40       $507C  
;;  $5C5B       $5C3E  
;;  $5C5F       $5C59  
;;  $5C67       $5C4D  
;;  $5C74       $5C7C  
;;  $5C7E       $5C44   $5C48  
;;  $5CD4       $609A  
;;  $5CD5       $61C9   $627F   $633C   $645D  
;;  $5CED       $633F  
;;  $5D04       $5CE8   $6136  
;;  $5D11       $5D00   $613A  
;;  $5D23       $5D0F  
;;  $5D25       $5D29  
;;  $5D2B       $5D26   $5D35  
;;  $5D39       $645A  
;;  $5D48       $62F9  
;;  $5D57       $6286  
;;  $5D60       $5D60  
;;  $5DB1       $5DAF  
;;  $5DBA       $5DB8  
;;  $5DC7       $5DC5  
;;  $5DD8       $5DD6  
;;  $5E23       $5E21  
;;  $5E26       $5E24  
;;  $5FE5       $5049  
;;  $6007       $6007  
;;  $6008       $5FE9   $5FEF  
;;  $609D       $60BA  
;;  $60C8       $60C2  
;;  $60D3       $60CA   $60CC  
;;  $60D6       $60CF  
;;  $60D8       $60D1   $60D4  
;;  $6103       $60F3   $6101  
;;  $6107       $60F5   $60FB  
;;  $610B       $60EF   $60FF  
;;  $610D       $6105   $6109  
;;  $6122       $611D  
;;  $6129       $6126  
;;  $612C       $6266  
;;  $613A       $6134  
;;  $615A       $616B  
;;  $617B       $6162   $6178  
;;  $6199       $6129   $617C  
;;  $61A2       $619B  
;;  $61A5       $619E  
;;  $61A6       $61A0   $61A3  
;;  $61BA       $61BA  
;;  $61C5       $6233  
;;  $61E1       $61D9  
;;  $6209       $58EB  
;;  $6223       $6229  
;;  $6247       $623E  
;;  $624B       $6240  
;;  $624D       $6245   $6249  
;;  $6282       $6284   $6348   $6458   $64C6  
;;  $6283       $627A  
;;  $6289       $6276  
;;  $6308       $630C  
;;  $632C       $6327  
;;  $633F       $630E   $633A  
;;  $634A       $6344  
;;  $6350       $5193  
;;  $6366       $6360  
;;  $639B       $638E  
;;  $63A9       $63A2   $6425  
;;  $63C2       $63A6  
;;  $63D2       $63CC  
;;  $63DB       $63D7  
;;  $63DE       $63D4  
;;  $63E0       $63D9   $63DC  
;;  $63EF       $63E4   $63EC  
;;  $640F       $63C4  
;;  $642C       $6429  
;;  $644A       $644A  
;;  $6455       $644D   $6451  
;;  $64BB       $64B7  
;;  $64C1       $516F   $6488  
;;  $64CE       $64CB  
;;  $64D7       $62CB  
;;  $64F9       $6398  
;;  $6508       $67E0  
;;  $6523       $650D  
;;  $6550       $6527   $6646  
;;  $6578       $6554  
;;  $658F       $657C  
;;  $65B1       $6593  
;;  $65D2       $65B5  
;;  $65EA       $65D6  
;;  $660A       $65EE  
;;  $661F       $660E  
;;  $6651       $662E  
;;  $6666       $666D  
;;  $666F       $6668  
;;  $6670       $6679  
;;  $667D       $6655   $6676  
;;  $6681       $6664   $667B  
;;  $668A       $6623  
;;  $66A9       $6690  
;;  $66CD       $66C7  
;;  $66D1       $66AF  
;;  $66E6       $66F1  
;;  $66F5       $66D7  
;;  $6722       $66FB  
;;  $673D       $6728  
;;  $6790       $678C  
;;  $679C       $6743  
;;  $67B7       $67B3  
;;  $67DD       $67CE  
;;  $67E0       $679F  
;;  $67EF       $67EA  
;;  $67F4       $67E6  
;;  $67F6       $67DE   $67F2  
;;  $67FA       $680B  
;;  $680A       $67FC  
;;  $6817       $6813  
;;  $6821       $681D  
;;  $682A       $6825  
;;  $682B       $54D0   $5CDA   $5D65   $6333  
;;  $683C       $63B5   $6A30  
;;  $684E       $513E   $51D2   $5809   $6182   $6CC5  
;;  $684F       $6887  
;;  $6881       $686B  
;;  $68C9       $509F   $5141   $51D5   $57FD   $617F   $61F4   $6CC2   $F4D4  
;;  $68CF       $69C5  
;;  $68D0       $68E7  
;;  $68ED       $68FB  
;;  $68F8       $68F0  
;;  $68FE       $50A2   $58C6   $F4D1   $F53F  
;;  $6921       $6917   $691D  
;;  $6924       $51B3   $57FA  
;;  $6932       $692E  
;;  $6944       $693E  
;;  $6974       $507F   $5087  
;;  $6984       $695C  
;;  $698C       $6978   $697C  
;;  $698D       $51E4   $6CBF  
;;  $69A7       $5074  
;;  $69C3       $69BF  
;;  $69CC       $69AB   $69AF  
;;  $69CE       $F4E3  
;;  $69D6       $69DE  
;;  $69FC       $5077  
;;  $6A19       $6A00   $6A04  
;;  $6A1A       $6A0C  
;;  $6A3E       $6868   $6E3E  
;;  $6A4C       $6A48  
;;  $6A5B       $6A4E   $6A51   $6A54   $6A57  
;;  $6A5D       $6858   $68D0   $6901   $6927   $6993   $6E3B   $6E57   $6E5E  
;;  $6A5D       $6E8D  
;;  $6A6F       $6A66  
;;  $6C14       $5145  
;;  $6C15       $62F6   $639B  
;;  $6C53       $6CB5  
;;  $6C6F       $6C67  
;;  $6C73       $6C6D  
;;  $6C74       $6C61  
;;  $6C82       $6CB0  
;;  $6C84       $6CAB  
;;  $6C90       $6C8A  
;;  $6C9D       $6C96  
;;  $6CA3       $6C8E   $6C9B  
;;  $6CA5       $6CA1  
;;  $6D41       $54D3   $57D2   $5C2C   $5CDD   $5CF2   $5D48   $5D62   $5FF8  
;;  $6D41       $6C32  
;;  $6D4A       $5139   $514A   $51C6   $5609   $5A3A   $5B72   $5B9D   $5C35  
;;  $6D4A       $60E1   $6185   $636C   $6405   $687B   $69EE   $6A10   $6C19  
;;  $6D4A       $6CC8  
;;  $6D4C       $57BE  
;;  $6D54       $6097   $61C6   $627C  
;;  $6D59       $57DA  
;;  $6D5E       $53F3   $5401   $541F   $598E  
;;  $6D5F       $6D62  
;;  $6D6B       $53F9   $5407   $6E90  
;;  $6D77       $5196   $6DFF   $6E0A   $6E12   $F34F  
;;  $6DAA       $51EA   $64E3  
;;  $6DC3       $6DD5  
;;  $6DCA       $6DAF   $6DB5   $6DB9   $6DC7   $6DD7  
;;  $6DD2       $6DC5  
;;  $6DD9       $511F   $6FA9  
;;  $6DF8       $6DF0  
;;  $6DFC       $6DE8   $6E1B  
;;  $6DFD       $6DE0   $6DEC   $6DF4   $6E18  
;;  $6E08       $6DF6   $6DFA  
;;  $6E1D       $6C7D   $6E97  
;;  $6E38       $F3EA  
;;  $6E55       $6E41  
;;  $6E6E       $6E64  
;;  $6E79       $6E6F  
;;  $6E8B       $6E68   $6E6C   $6E73   $6E77  
;;  $6EA9       $6E9E  
;;  $6EAD       $6EA3   $6EA7  
;;  $6EC6       $6E85  
;;  $6ECA       $6EB9   $6EBE   $6EC4  
;;  $6EE1       $6ECE   $6ED2   $6ED7   $6F57   $6F64  
;;  $6EF4       $6EED  
;;  $6EF8       $6EE7   $6EF2  
;;  $6F09       $6EFF  
;;  $6F0D       $6F05  
;;  $6F11       $6F07   $6F0B  
;;  $6F1C       $6F12  
;;  $6F26       $6F18  
;;  $6F2A       $6F1A   $6F1E  
;;  $6F2E       $6CD5  
;;  $6F39       $6F24   $6F31  
;;  $6F45       $6F33   $6F37  
;;  $6F47       $6E49   $6E4F   $6E53   $6E7F   $6E89   $6EAB   $6EC8   $6EDF  
;;  $6F47       $6EF6   $6F0F   $6F28   $6F3F   $6F43   $6F5C   $6F62  
;;  $6F4F       $6EB1  
;;  $6F66       $51A6   $5C16   $63FC   $64DD  
;;  $6F6E       $6F71   $6FA6  
;;  $6F74       $5C19   $63FF   $64E0  
;;  $6F7E       $51E7   $62F3  
;;  $6FAD       $58C3  
;;  $6FB9       $64E6   $6CBB  
;;  $6FC8       $6FC8  
;;  $6FD7       $6FD7  
;;  $6FF5       $6FEF  
;;  $D047       $D045  
;;  $D0D4       $D4C5  
;;  $D127       $D125  
;;  $D196       $D194  
;;  $D1F7       $D0BB  
;;  $D221       $D0C5  
;;  $D264       $D262  
;;  $D2E0       $D2E0  
;;  $D342       $D483  
;;  $D357       $D72D  
;;  $D3A6       $D3A4  
;;  $D487       $D0B0  
;;  $D49F       $D49F  
;;  $D4AC       $D4AA  
;;  $D4E1       $D4E1  
;;  $D4EA       $D4EA  
;;  $D523       $D523  
;;  $D537       $D537  
;;  $D54F       $D54F  
;;  $D56C       $D56C  
;;  $D631       $D4CD  
;;  $D64D       $D64B  
;;  $D652       $D565  
;;  $D66C       $D28C  
;;  $D6A1       $D6A1  
;;  $D6AF       $D6AF  
;;  $D719       $D6C5  
;;  $D72F       $D72F   $D735  
;;  $D77E       $D77C  
;;  $D7C3       $D7C3  
;;  $D81D       $D81B  
;;  $D871       $D871  
;;  $D8AA       $D8A8  
;;  $D8AE       $D8AE  
;;  $D8B4       $DC93  
;;  $D907       $D907  
;;  $D916       $D916  
;;  $D995       $DA28  
;;  $D9D8       $D9D8  
;;  $DA37       $DA37  
;;  $DACA       $DC23  
;;  $DAF7       $D8C7  
;;  $DAFE       $DAFE  
;;  $DB05       $DB05  
;;  $DB0A       $DF00  
;;  $DB6E       $DB6E  
;;  $DBEF       $DBEF  
;;  $DC39       $DC39  
;;  $DC3C       $DC3A  
;;  $DC46       $DC44  
;;  $DC5D       $DC5D  
;;  $DC5E       $DC5C  
;;  $DC9A       $D8C3  
;;  $DC9E       $DC9E  
;;  $DCD8       $DB6F  
;;  $DCFF       $DCF6  
;;  $DD2A       $D92F  
;;  $DDBA       $DDB8  
;;  $DDBE       $DDBE  
;;  $DDC9       $DDC9  
;;  $DDD4       $DDD4  
;;  $DDD8       $DDD8  
;;  $DDF6       $DDF6  
;;  $DE42       $DE42  
;;  $DE79       $DE79  
;;  $DE83       $DE83  
;;  $DECE       $DE75  
;;  $DEEA       $DEE8  
;;  $DEF3       $DAFF  
;;  $DF72       $DF72  
;;  $DF78       $DF76  
;;  $DF7A       $DF78  
;;  $DF8A       $DEE3  
;;  $DFB0       $DFAE  
;;  $DFC2       $DFC0  
;;  $DFF8       $DC21  
;;  $F03E       $F03E  
;;  $F059       $F0FD  
;;  $F084       $F0A8  
;;  $F1B4       $F1B4  
;;  $F1C1       $F1C1  
;;  $F289       $F287  
;;  $F29C       $F29A  
;;  $F2A4       $F2A2  
;;  $F2E2       $F2E0  
;;  $F2E8       $F2E8  
;;  $F2F1       $F2EF  
;;  $F323       $F31F  
;;  $F35A       $F357  
;;  $F36B       $F367  
;;  $F374       $F35B   $F36F  
;;  $F39D       $F38C   $F399  
;;  $F40A       $F3F4   $F3F8   $F3FC  
;;  $F435       $F43E  
;;  $F451       $F447  
;;  $F45B       $F443   $F44F  
;;  $F46E       $F469  
;;  $F484       $F47E  
;;  $F488       $F40D  
;;  $F496       $F490  
;;  $F4A8       $F49D  
;;  $F4DA       $F411  
;;  $F4DD       $F4DE  
;;  $F4F9       $F4F6  
;;  $F508       $F494  
;;  $F53F       $F4CF   $F506  
;;  $F549       $F3E8   $F415   $F419   $F41F   $F430   $F433   $F459   $F486  
;;  $F549       $F534   $F53D  
;;  $F59D       $F59A  
;;  $F5A1       $F59E  
;;  $F5A3       $F3DC   $F3E2  
;;  $F5D9       $F5CE   $F5D3  
;;  $F5F9       $F5F5  
;;  $F606       $F603  
;;  $F610       $F60C  
;;  $F615       $F611  
;;  $F61E       $F629  
;;  $F625       $F61F  
;;  $F630       $F619   $F61C   $F62C  
;;  $F644       $F646  
;;  $F64E       $F64A  
;;  $F64F       $F64D  
;;  $F658       $F655  
;;  $F6E5       $F6E5  
;;  $F6E7       $F6E7  
;;  $F70D       $F70D  
;;  $F70F       $F70F  
;;  $F728       $F728  
;;  $F777       $F777  
;;  $F82C       $F82C  
;;  $FD7B       $FD64   $FD68   $FD6E   $FD74   $FD78  
;;  $FDA2       $FDA0  
;;  $FDE1       $FDDF  
;;  $FE0A       $FDFE   $FE02   $FE06  
;;  $FE32       $FE30  
;;  $FE34       $FE70  
;;  $FE50       $FE37  
;;  $FE52       $FE4E  
;;  $FE57       $FE3E   $FE47  
;;  $FE68       $FE3B  
;;  $FEB6       $FEB6  
;;  $FEDF       $FEDF  
;; ======================================================================== ;;
