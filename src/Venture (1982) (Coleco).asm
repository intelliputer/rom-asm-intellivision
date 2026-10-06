
        ORG     $5000
.HEADER:
        BIDECLE $0001           ; 5000  Ptr: MOB graphic images
.TITLE:
        DECLE   $0000           ; 5002  Cartridge year
        DECLE   $0000                           ; 5003  

.TITLECODE:
        J       L_500D          ; 5004  Ptr: Start of game
        BIDECLE $000D           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5000           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5002           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
L_500D:
        DECLE   $0003           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $02B8,  $00E5   ; 500F  Color Stack init (0, 1)
        DECLE   $0057,  $0240   ; 5011  Color Stack init (2, 3)
        DECLE   $0100           ; 5013  Border color init


        SWAP    R0,     1                       ; 5014   0040
        MVO     R0,     .ISRVEC.1               ; 5015   0240 0101
        MVII    #$02F0, R6                      ; 5017   02BE 02F0

        JSR     R5,     L_5214                  ; 5019   0004 0150 0214
        DECLE   $0102,  $00FC                   ; 501C   0102 00FC

        JSR     R5,     L_5214                  ; 501E   0004 0150 0214
        DECLE   $0200,  $0180                   ; 5021   0200 0180

        INCR    R0                              ; 5023   0008
        MVO     R0,     G_0103                  ; 5024   0240 0103
        MVII    #$0038, R0                      ; 5026   02B8 0038
        MVO     R0,     .PSG0.chan_enable       ; 5028   0240 01F8
        MVII    #$0026, R0                      ; 502A   02B8 0026
        MVO     R0,     G_0104                  ; 502C   0240 0104
        MVII    #$0008, R0                      ; 502E   02B8 0008
        MVO     R0,     G_0105                  ; 5030   0240 0105
        MVII    #$0005, R0                      ; 5032   02B8 0005
        MVO     R0,     G_0106                  ; 5034   0240 0106

        JSRE    R5,     L_5961                  ; 5036   0004 0159 0161
        DECLE   $0004                           ; 5039   0004

        JSR     R5,     L_6215                  ; 503A   0004 0160 0215
        BIDECLE $65F6                           ; 503D   00F6 0065
        DECLE   $0007,  $0066,  $0010,  $0066   ; 503F   0007 0066 0010 0066
        DECLE   $0000,  $0000                   ; 5043   0000 0000
L_5045:
        MVI     .PSG0.rgt_hand,R0               ; 5045   0280 01FE
        XOR     .PSG0.lft_hand,R0               ; 5047   03C0 01FF
        BEQ     L_5045                          ; 5049   0224 0005

        JSR     R5,     L_5214                  ; 504B   0004 0150 0214
        DECLE   $0200,  $00F0                   ; 504E   0200 00F0

        JSR     R5,     L_6215                  ; 5050   0004 0160 0215
        BIDECLE $665C                           ; 5053   005C 0066
        DECLE   $006D,  $0066,  $0000,  $0000   ; 5055   006D 0066 0000 0000

        SDBD                                    ; 5059   0001
        MVII    #$5000, R1                      ; 505A   02B9 0000 0050
        MVO     R1,     G_0323                  ; 505D   0241 0323
        CLRR    R1                              ; 505F   01C9
L_5060:
        MVI     .PSG0.rgt_hand,R0               ; 5060   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 5062   0380 01FF
        CMPI    #$00D7, R0                      ; 5064   0378 00D7
        BNEQ    L_506B                          ; 5066   020C 0003

        TSTR    R1                              ; 5068   0089
        BNEQ    L_50A0                          ; 5069   020C 0035

L_506B:
        CMPI    #$00BE, R0                      ; 506B   0378 00BE
        BEQ     L_5088                          ; 506D   0204 0019

        CMPI    #$007E, R0                      ; 506F   0378 007E
        BNEQ    L_5060                          ; 5071   022C 0012

        MVII    #$0002, R1                      ; 5073   02B9 0002
        MVO     R1,     G_0338                  ; 5075   0241 0338
        MVO     R1,     G_0339                  ; 5077   0241 0339
        SDBD                                    ; 5079   0001
        MVII    #$8002, R1                      ; 507A   02B9 0002 0080
        MVO     R1,     G_033A                  ; 507D   0241 033A
        CLRR    R1                              ; 507F   01C9
        MVO     R1,     G_0107                  ; 5080   0241 0107
        MVII    #$008E, R1                      ; 5082   02B9 008E
        MVO     R1,     .BTAB.4E                ; 5084   0241 024E
        B       L_5060                          ; 5086   0220 0027

L_5088:
        SDBD                                    ; 5088   0001
        MVII    #$4002, R1                      ; 5089   02B9 0002 0040
        MVO     R1,     G_0338                  ; 508C   0241 0338
        MVO     R1,     G_0339                  ; 508E   0241 0339
        SDBD                                    ; 5090   0001
        MVII    #$C002, R1                      ; 5091   02B9 0002 00C0
        MVO     R1,     G_033A                  ; 5094   0241 033A
        MVI     G_0106, R1                      ; 5096   0281 0106
        MVO     R1,     G_0107                  ; 5098   0241 0107
        MVII    #$0096, R1                      ; 509A   02B9 0096
        MVO     R1,     .BTAB.4E                ; 509C   0241 024E
        B       L_5060                          ; 509E   0220 003F

L_50A0:
        CLRR    R1                              ; 50A0   01C9
L_50A1:
        MVI     .PSG0.rgt_hand,R0               ; 50A1   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 50A3   0380 01FF
        CMPI    #$00D7, R0                      ; 50A5   0378 00D7
        BNEQ    L_50AC                          ; 50A7   020C 0003

        TSTR    R1                              ; 50A9   0089
        BNEQ    L_5115                          ; 50AA   020C 0069

L_50AC:
        CMPI    #$007E, R0                      ; 50AC   0378 007E
        BEQ     L_50D4                          ; 50AE   0204 0024

        CMPI    #$00BE, R0                      ; 50B0   0378 00BE
        BEQ     L_50CC                          ; 50B2   0204 0018

        CMPI    #$00DE, R0                      ; 50B4   0378 00DE
        BEQ     L_50C4                          ; 50B6   0204 000C

        CMPI    #$007D, R0                      ; 50B8   0378 007D
        BNEQ    L_50A1                          ; 50BA   022C 001A

        MVII    #$00A6, R1                      ; 50BC   02B9 00A6
        MVO     R1,     .BTAB.9D                ; 50BE   0241 029D
        MVII    #$0003, R0                      ; 50C0   02B8 0003
        B       L_50D9                          ; 50C2   0200 0015

L_50C4:
        MVII    #$009E, R1                      ; 50C4   02B9 009E
        MVO     R1,     .BTAB.9D                ; 50C6   0241 029D
        MVII    #$0002, R0                      ; 50C8   02B8 0002
        B       L_50D9                          ; 50CA   0200 000D

L_50CC:
        MVII    #$0096, R1                      ; 50CC   02B9 0096
        MVO     R1,     .BTAB.9D                ; 50CE   0241 029D
        MVII    #$0001, R0                      ; 50D0   02B8 0001
        B       L_50D9                          ; 50D2   0200 0005

L_50D4:
        MVII    #$008E, R1                      ; 50D4   02B9 008E
        MVO     R1,     .BTAB.9D                ; 50D6   0241 029D
        CLRR    R0                              ; 50D8   01C0
L_50D9:
        MVO     R0,     G_010C                  ; 50D9   0240 010C
        B       L_50A1                          ; 50DB   0220 003B

L_50DD:
        MVII    #$0006, R0                      ; 50DD   02B8 0006
        MVO     R0,     G_0112                  ; 50DF   0240 0112
        MVI     G_0338, R0                      ; 50E1   0280 0338
        SLLC    R0,     2                       ; 50E3   005C
        BNOV    L_5115                          ; 50E4   020A 002F

        MVI     G_0106, R0                      ; 50E6   0280 0106
        BC      L_50EC                          ; 50E8   0201 0002

        MVI     G_0107, R0                      ; 50EA   0280 0107
L_50EC:
        TSTR    R0                              ; 50EC   0080
        BEQ     L_5115                          ; 50ED   0204 0026

        MVI     G_0338, R0                      ; 50EF   0280 0338
        MVII    #$0322, R1                      ; 50F1   02B9 0322
        MVII    #$0323, R2                      ; 50F3   02BA 0323
        MVII    #$0330, R3                      ; 50F5   02BB 0330
        TSTR    R0                              ; 50F7   0080
        BMI     L_5100                          ; 50F8   020B 0006

        MVI@    R3,     R0                      ; 50FA   0298
        MVO@    R0,     R1                      ; 50FB   0248
        MVI@    R2,     R0                      ; 50FC   0290
        MVO@    R0,     R3                      ; 50FD   0258
        B       L_5104                          ; 50FE   0200 0004

L_5100:
        MVI@    R3,     R0                      ; 5100   0298
        MVO@    R0,     R2                      ; 5101   0250
        MVI@    R1,     R0                      ; 5102   0288
        MVO@    R0,     R3                      ; 5103   0258
L_5104:
        MVI     G_0338, R0                      ; 5104   0280 0338
        MVII    #$0339, R1                      ; 5106   02B9 0339
        MVII    #$033A, R2                      ; 5108   02BA 033A
        TSTR    R0                              ; 510A   0080
        BMI     L_5111                          ; 510B   020B 0004

        MVO@    R0,     R1                      ; 510D   0248
        MVI@    R2,     R0                      ; 510E   0290
        B       L_5113                          ; 510F   0200 0002

L_5111:
        MVO@    R0,     R2                      ; 5111   0250
        MVI@    R1,     R0                      ; 5112   0288
L_5113:
        MVO     R0,     G_0338                  ; 5113   0240 0338

L_5115:
        JSR     R5,     L_5214                  ; 5115   0004 0150 0214
        DECLE   $0200,  $00F0                   ; 5118   0200 00F0

        JSR     R5,     L_5961                  ; 511A   0004 0158 0161
        DECLE   $0004                           ; 511D   0004

        JSR     R5,     L_5214                  ; 511E   0004 0150 0214
        DECLE   $0340,  $0020                   ; 5121   0340 0020

        ADD     G_0112, R7                      ; 5123   02C7 0112

        SDBD                                    ; 5125   0001
        MVII    #$5000, R0                      ; 5126   02B8 0000 0050
        MVO     R0,     G_0330                  ; 5129   0240 0330

        JSR     R5,     L_6B8C                  ; 512B   0004 0168 038C

        MVII    #$0106, R4                      ; 512E   02BC 0106
        SDBD                                    ; 5130   0001
        MVI@    R4,     R0                      ; 5131   02A0
        TSTR    R0                              ; 5132   0080
        BNEQ    L_5138                          ; 5133   020C 0003

        INCR    R0                              ; 5135   0008
        MVO     R0,     G_0113                  ; 5136   0240 0113

L_5138:
        JSR     R5,     L_57CC                  ; 5138   0004 0154 03CC

        SDBD                                    ; 513B   0001
        MVII    #$083E, R0                      ; 513C   02B8 003E 0008
        MVI     G_0106, R1                      ; 513F   0281 0106
        TSTR    R1                              ; 5141   0089
        BEQ     L_514A                          ; 5142   0204 0006

        MVII    #$0216, R4                      ; 5144   02BC 0216
L_5146:
        MVO@    R0,     R4                      ; 5146   0260
        DECR    R1                              ; 5147   0011
        BNEQ    L_5146                          ; 5148   022C 0003

L_514A:
        MVI     G_0107, R1                      ; 514A   0281 0107
        TSTR    R1                              ; 514C   0089
        BEQ     L_5155                          ; 514D   0204 0006

        MVII    #$021F, R4                      ; 514F   02BC 021F
L_5151:
        MVO@    R0,     R4                      ; 5151   0260
        DECR    R1                              ; 5152   0011
        BNEQ    L_5151                          ; 5153   022C 0003

L_5155:
        SDBD                                    ; 5155   0001
        MVII    #$61DF, R4                      ; 5156   02BC 00DF 0061

        JSR     R5,     L_622C                  ; 5159   0004 0160 022C
        DECLE   $0280,  $0338,  $005C,  $020A   ; 515C   0280 0338 005C 020A
        DECLE   $0007,  $0001                   ; 5160   0007 0001

        MVII    #$00C9, R4                      ; 5162   02BC 00C9
        SLR     R1,     1                       ; 5164   0061

        JSR     R5,     L_622C                  ; 5165   0004 0160 022C

        MVII    #$0318, R2                      ; 5168   02BA 0318
        MVII    #$0241, R3                      ; 516A   02BB 0241

        JSR     R5,     L_51EF                  ; 516C   0004 0150 01EF

        MVII    #$031B, R2                      ; 516F   02BA 031B
        MVII    #$02A5, R3                      ; 5171   02BB 02A5

        JSR     R5,     L_51EF                  ; 5173   0004 0150 01EF

        MVI     G_0113, R0                      ; 5176   0280 0113
        TSTR    R0                              ; 5178   0080
        BEQ     L_5183                          ; 5179   0204 0008

        JSR     R5,     L_6215                  ; 517B   0004 0160 0215
        BIDECLE $667B                           ; 517E   007B 0066
        DECLE   $0000,  $0000                   ; 5180   0000 0000
L_5182:
        DECR    R7                              ; 5182   0017

L_5183:
        SDBD                                    ; 5183   0001
        MVII    #$0832, R0                      ; 5184   02B8 0032 0008
        MVO     R0,     .BTAB.CA                ; 5187   0240 02CA

        JSR     R5,     L_6B46                  ; 5189   0004 0168 0346
        DECLE   $0002                           ; 518C   0002

        CLRR    R1                              ; 518D   01C9
        MVI     G_0338, R0                      ; 518E   0280 0338
        SLLC    R0,     1                       ; 5190   0058
        BNC     L_5197                          ; 5191   0209 0004

        MVII    #$021F, R2                      ; 5193   02BA 021F
        B       L_5199                          ; 5195   0200 0002

L_5197:
        MVII    #$0216, R2                      ; 5197   02BA 0216
L_5199:
        MVI@    R2,     R0                      ; 5199   0290
        MVO@    R1,     R2                      ; 519A   0251
        MVO     R0,     .BTAB.CB                ; 519B   0240 02CB

        JSR     R5,     L_6B11                  ; 519D   0004 0168 0311
        JSR     R5,     L_6B46                  ; 51A0   0004 0168 0346
        DECLE   $0004                           ; 51A3   0004

        MVI     G_0338, R0                      ; 51A4   0280 0338
        ANDI    #$0006, R0                      ; 51A6   03B8 0006
        SUBI    #$0002, R0                      ; 51A8   0338 0002
        MVO     R0,     G_0111                  ; 51AA   0240 0111
        SLR     R0,     1                       ; 51AC   0060
        SDBD                                    ; 51AD   0001
        MVII    #$5240, R1                      ; 51AE   02B9 0040 0052
        ADDR    R0,     R1                      ; 51B1   00C1
        MVI@    R1,     R2                      ; 51B2   028A
        MVO     R2,     G_0120                  ; 51B3   0242 0120
        MVII    #$0001, R0                      ; 51B5   02B8 0001
        MVO     R0,     G_0123                  ; 51B7   0240 0123
        MVO     R0,     G_0110                  ; 51B9   0240 0110
        MVII    #$0358, R0                      ; 51BB   02B8 0358
        MVO     R0,     G_0348                  ; 51BD   0240 0348
        MVII    #$0064, R0                      ; 51BF   02B8 0064
        MVO     R0,     G_0349                  ; 51C1   0240 0349

        JSR     R5,     L_56BF                  ; 51C3   0004 0154 02BF

        CLRR    R1                              ; 51C6   01C9
        MVO     R1,     G_0112                  ; 51C7   0241 0112
        MVO     R1,     G_010F                  ; 51C9   0241 010F
        MVII    #$0334, R4                      ; 51CB   02BC 0334
        SDBD                                    ; 51CD   0001
        MVII    #$05A0, R0                      ; 51CE   02B8 00A0 0005
        MVO@    R0,     R4                      ; 51D1   0260
        MVO@    R0,     R4                      ; 51D2   0260
        MVO@    R0,     R4                      ; 51D3   0260
        MVO@    R0,     R4                      ; 51D4   0260
        MVII    #$0005, R0                      ; 51D5   02B8 0005
        MVO     R0,     G_0102                  ; 51D7   0240 0102
        J       L_554F                          ; 51D9   0004 0354 014F

L_51DC:
        PSHR    R5                              ; 51DC   0275
        SDBD                                    ; 51DD   0001
        MVII    #$5243, R4                      ; 51DE   02BC 0043 0052
        ADD     G_0111, R4                      ; 51E1   02C4 0111
        SDBD                                    ; 51E3   0001
        MVI@    R4,     R5                      ; 51E4   02A5
        MVII    #$000C, R1                      ; 51E5   02B9 000C
        MVII    #$034C, R4                      ; 51E7   02BC 034C
L_51E9:
        MVI@    R5,     R0                      ; 51E9   02A8
        MVO@    R0,     R4                      ; 51EA   0260
        DECR    R1                              ; 51EB   0011
        BNEQ    L_51E9                          ; 51EC   022C 0004
        PULR    R7                              ; 51EE   02B7

L_51EF:
        PSHR    R5                              ; 51EF   0275
        MVII    #$0003, R5                      ; 51F0   02BD 0003
L_51F2:
        MVII    #$000C, R1                      ; 51F2   02B9 000C
        SDBD                                    ; 51F4   0001
        MVII    #$5249, R4                      ; 51F5   02BC 0049 0052
        MVI@    R2,     R0                      ; 51F8   0290
        SLL     R0,     2                       ; 51F9   004C
        SLL     R0,     2                       ; 51FA   004C
L_51FB:
        RLC     R0,     1                       ; 51FB   0050
        BNC     L_5205                          ; 51FC   0209 0007

        PSHR    R5                              ; 51FE   0275
        SDBD                                    ; 51FF   0001
        MVI@    R4,     R5                      ; 5200   02A5
        MVO@    R5,     R3                      ; 5201   025D
        PULR    R5                              ; 5202   02B5
        SUBI    #$0002, R4                      ; 5203   033C 0002
L_5205:
        ADDI    #$0002, R4                      ; 5205   02FC 0002
        INCR    R3                              ; 5207   000B
        DECR    R1                              ; 5208   0011
        BNEQ    L_51FB                          ; 5209   022C 000F

        INCR    R2                              ; 520B   000A
        DECR    R5                              ; 520C   0015
        BEQ     L_5213                          ; 520D   0204 0004

        ADDI    #$0008, R3                      ; 520F   02FB 0008
        B       L_51F2                          ; 5211   0220 0020
L_5213:
        PULR    R7                              ; 5213   02B7

L_5214:
        MVI@    R5,     R4                      ; 5214   02AC
        MVI@    R5,     R1                      ; 5215   02A9
        CLRR    R0                              ; 5216   01C0
L_5217:
        MVO@    R0,     R4                      ; 5217   0260
        DECR    R1                              ; 5218   0011
        BNEQ    L_5217                          ; 5219   022C 0003
        MOVR    R5,     R7                      ; 521B   00AF

        SUB@    R2,     R2                      ; 521C   0312
        INCR    R2                              ; 521D   000A
        CMP     .STIC.A.0,R0                    ; 521E   0340 0010
        CMP     .STIC.CS.0,R0                   ; 5220   0340 0028
        CMP@    R1,     R0                      ; 5222   0348
        SWAP    R0,     1                       ; 5223   0040
        CMP@    R4,     R0                      ; 5224   0360
        SWAP    R0,     1                       ; 5225   0040
        AND@    R4,     R0                      ; 5226   03A0
        COMR    R0                              ; 5227   0018
        SUB@    R3,     R0                      ; 5228   0318
        RSWD    R0                              ; 5229   0038
        CMP     .STIC.CS.0,R0                   ; 522A   0340 0028
        CMPI    #$0030, R0                      ; 522C   0378 0030
        CMP@    R6,     R0                      ; 522E   0370
        DECR    R0                              ; 522F   0010
        AND@    R2,     R0                      ; 5230   0390
        RSWD    R0                              ; 5231   0038
        AND@    R3,     R0                      ; 5232   0398
        SLR     R0,     1                       ; 5233   0060
        SUB@    R3,     R0                      ; 5234   0318
        DECR    R0                              ; 5235   0010
        CMP@    R1,     R0                      ; 5236   0348
        DECR    R0                              ; 5237   0010
        SUB@    R4,     R0                      ; 5238   0320
        GSWD    R0                              ; 5239   0030
        SUB@    R4,     R0                      ; 523A   0320
        SLLC    R0,     1                       ; 523B   0058
        CMP@    R5,     R0                      ; 523C   0368
        RLC     R0,     1                       ; 523D   0050
        AND@    R4,     R0                      ; 523E   03A0
        SLLC    R0,     1                       ; 523F   0058
        INCR    R6                              ; 5240   000E
        INCR    R7                              ; 5241   000F

        INCR    R5                              ; 5242   000D
L_5243:
        COMR    R4                              ; 5243   001C
        RLC     R2,     1                       ; 5244   0052
        ADCR    R0                              ; 5245   0028
        RLC     R2,     1                       ; 5246   0052
        NOP                                     ; 5247   0034
        RLC     R2,     1                       ; 5248   0052
        COMR    R6                              ; 5249   001E
        ADCR    R0                              ; 524A   0028
        NEGR    R6                              ; 524B   0026
        INCR    R0                              ; 524C   0008
        DECR    R6                              ; 524D   0016
        INCR    R0                              ; 524E   0008
        ADCR    R6                              ; 524F   002E
        INCR    R0                              ; 5250   0008
        ADDR    R4,     R6                      ; 5251   00E6
        INCR    R0                              ; 5252   0008
        ADDR    R3,     R6                      ; 5253   00DE
        INCR    R0                              ; 5254   0008
        ADDR    R5,     R6                      ; 5255   00EE
        INCR    R0                              ; 5256   0008
        ADDR    R6,     R6                      ; 5257   00F6
        INCR    R0                              ; 5258   0008
        SAR     R2,     2                       ; 5259   006E
        INCR    R1                              ; 525A   0009
        RRC     R2,     2                       ; 525B   0076
        INCR    R1                              ; 525C   0009
        SLR     R2,     2                       ; 525D   0066
        INCR    R1                              ; 525E   0009
        SLLC    R2,     2                       ; 525F   005E
        INCR    R1                              ; 5260   0009
L_5261:
        MVI     G_0338, R0                      ; 5261   0280 0338
        SARC    R0,     1                       ; 5263   0078
        BNC     L_52F9                          ; 5264   0209 0093

        MVI     G_0341, R0                      ; 5266   0280 0341
        MVI     G_0174, R1                      ; 5268   0281 0174
        TSTR    R1                              ; 526A   0089
        BEQ     L_5274                          ; 526B   0204 0007

        ANDI    #$01F8, R0                      ; 526D   03B8 01F8
        TSTR    R0                              ; 526F   0080
        BEQ     L_52F9                          ; 5270   0204 0087
        B       L_5280                          ; 5272   0200 000C

L_5274:
        MOVR    R0,     R1                      ; 5274   0081
        MVI     G_010E, R2                      ; 5275   0282 010E
        SARC    R2,     1                       ; 5277   007A
        BC      L_527C                          ; 5278   0201 0002

        ANDI    #$037F, R1                      ; 527A   03B9 037F
L_527C:
        ANDI    #$01C0, R1                      ; 527C   03B9 01C0
        BEQ     L_528E                          ; 527E   0204 000E

L_5280:
        CLRR    R0                              ; 5280   01C0
        MVO     R0,     G_0359                  ; 5281   0240 0359
        MVO     R0,     G_0144                  ; 5283   0240 0144
        MVO     R0,     G_0145                  ; 5285   0240 0145
        MVO     R0,     G_010D                  ; 5287   0240 010D

        JSR     R5,     L_6B07                  ; 5289   0004 0168 0307

        B       L_52F9                          ; 528C   0200 006B

L_528E:
        MVII    #$0008, R3                      ; 528E   02BB 0008
        MVII    #$035B, R2                      ; 5290   02BA 035B
        SDBD                                    ; 5292   0001
        MVII    #$39E0, R4                      ; 5293   02BC 00E0 0039
        SARC    R0,     2                       ; 5296   007C
        SARC    R0,     2                       ; 5297   007C
        BOV     L_52A4                          ; 5298   0202 000A

        SARC    R0,     1                       ; 529A   0078
        BC      L_52A2                          ; 529B   0201 0005

        SARC    R0,     1                       ; 529D   0078
        BNC     L_52F9                          ; 529E   0209 0059

        INCR    R2                              ; 52A0   000A
        ADDR    R3,     R4                      ; 52A1   00DC
L_52A2:
        INCR    R2                              ; 52A2   000A
        ADDR    R3,     R4                      ; 52A3   00DC
L_52A4:
        CLRR    R0                              ; 52A4   01C0
        DECLE   $0240,  $0104,  $0001,  $02BD   ; 52A5   0240 0104 0001 02BD
        DECLE   $00F5,  $0061,  $0280,  $0338   ; 52A9   00F5 0061 0280 0338
        DECLE   $03B8,  $001E,  $00C5,  $0001   ; 52AD   03B8 001E 00C5 0001
        DECLE   $02AB,  $00A0,  $03B8,  $01F8   ; 52B1   02AB 00A0 03B8 01F8
        DECLE   $0291,  $0001                   ; 52B5   0291 0001

        ANDI    #$0007, R1                      ; 52B7   03B9 0007
        RSWD    R0                              ; 52B9   0038
        XORR    R0,     R1                      ; 52BA   01C1
        MVO@    R1,     R2                      ; 52BB   0251
        MVO     R3,     G_0321                  ; 52BC   0243 0321
        MVO     R4,     G_0320                  ; 52BE   0244 0320
        SUBI    #$035B, R2                      ; 52C0   033A 035B
        ADDI    #$0188, R2                      ; 52C2   02FA 0188
        MVI@    R2,     R0                      ; 52C4   0290
        CLRR    R3                              ; 52C5   01DB
        SWAP    R0,     1                       ; 52C6   0040
        SWAP    R0,     1                       ; 52C7   0040
        BPL     L_52CB                          ; 52C8   0203 0001

        INCR    R3                              ; 52CA   000B
L_52CB:
        COMR    R0                              ; 52CB   0018
        ANDI    #$007F, R0                      ; 52CC   03B8 007F
        COMR    R0                              ; 52CE   0018
        MVO@    R0,     R2                      ; 52CF   0250

        JSR     R5,     L_5961                  ; 52D0   0004 0158 0161
        DECLE   $0006                           ; 52D3   0006

        CLRR    R0                              ; 52D4   01C0
        MVO     R0,     G_0144                  ; 52D5   0240 0144
        MVO     R0,     G_0145                  ; 52D7   0240 0145
        MVO     R0,     G_010D                  ; 52D9   0240 010D

        JSR     R5,     L_6B07                  ; 52DB   0004 0168 0307

        TSTR    R3                              ; 52DE   009B
        BNEQ    L_52F5                          ; 52DF   020C 0014

        MVI     G_0338, R0                      ; 52E1   0280 0338
        MOVR    R0,     R1                      ; 52E3   0081
        ANDI    #$0006, R0                      ; 52E4   03B8 0006
        SLR     R0,     1                       ; 52E6   0060
        ANDI    #$0060, R1                      ; 52E7   03B9 0060
        SLR     R1,     2                       ; 52E9   0065
        SLR     R1,     1                       ; 52EA   0061
        XORR    R1,     R0                      ; 52EB   01C8
        SDBD                                    ; 52EC   0001
        MVII    #$6B62, R4                      ; 52ED   02BC 0062 006B
        ADDR    R0,     R4                      ; 52F0   00C4
        MVI@    R4,     R0                      ; 52F1   02A0

        JSR     R5,     L_5794                  ; 52F2   0004 0154 0394

L_52F5:
        MVII    #$0005, R0                      ; 52F5   02B8 0005
        MVO     R0,     G_0102                  ; 52F7   0240 0102

L_52F9:
        JSR     R5,     L_6D44                  ; 52F9   0004 016C 0144

        MVI     G_0340, R0                      ; 52FC   0280 0340
        MVI     G_0348, R3                      ; 52FE   0283 0348
        MVI     G_0349, R4                      ; 5300   0284 0349
        MVI     G_0338, R2                      ; 5302   0282 0338
        SARC    R2,     1                       ; 5304   007A
        BNC     L_5450                          ; 5305   0209 0149

        MVI     G_010E, R3                      ; 5307   0283 010E
        RRC     R3,     1                       ; 5309   0073
        BC      L_5341                          ; 530A   0201 0035

        MVI     G_0331, R3                      ; 530C   0283 0331
        TSTR    R3                              ; 530E   009B
        BNEQ    L_5341                          ; 530F   020C 0030

        JSR     R5,     L_6B30                  ; 5311   0004 0168 0330

        MVI     G_010E, R3                      ; 5314   0283 010E
        INCR    R3                              ; 5316   000B
        MVO     R3,     G_010E                  ; 5317   0243 010E
        MVI     G_012D, R3                      ; 5319   0283 012D
        ANDI    #$00FD, R3                      ; 531B   03BB 00FD
        MVO     R3,     G_012D                  ; 531D   0243 012D
        SDBD                                    ; 531F   0001
        MVII    #$186C, R3                      ; 5320   02BB 006C 0018
        MVI     G_0174, R1                      ; 5323   0281 0174
        TSTR    R1                              ; 5325   0089
        BEQ     L_5334                          ; 5326   0204 000C

        MVO     R3,     G_035E                  ; 5328   0243 035E
        MVII    #$0108, R3                      ; 532A   02BB 0108
        MVO     R3,     G_0355                  ; 532C   0243 0355
        ADDI    #$0200, R3                      ; 532E   02FB 0200
        MVO     R3,     G_0354                  ; 5330   0243 0354
        B       L_533E                          ; 5332   0200 000A

L_5334:
        MVO     R3,     G_035F                  ; 5334   0243 035F
        MVII    #$0108, R3                      ; 5336   02BB 0108
        MVO     R3,     G_0357                  ; 5338   0243 0357
        ADDI    #$0200, R3                      ; 533A   02FB 0200
        MVO     R3,     G_0356                  ; 533C   0243 0356
L_533E:
        CLRR    R3                              ; 533E   01DB
        MVO     R3,     G_0341                  ; 533F   0243 0341
L_5341:
        MVII    #$00B8, R3                      ; 5341   02BB 00B8
        MVI     G_010E, R1                      ; 5343   0281 010E
        AND     G_0174, R1                      ; 5345   0381 0174
        SARC    R1,     1                       ; 5347   0079
        BNC     L_534C                          ; 5348   0209 0002

        XORI    #$0040, R3                      ; 534A   03FB 0040
L_534C:
        ANDR    R3,     R0                      ; 534C   0198
        BNEQ    L_567F                          ; 534D   020C 0330

        MVI     G_010E, R1                      ; 534F   0281 010E
        RRC     R1,     2                       ; 5351   0075
        BOV     L_53BB                          ; 5352   0202 0067

        MVII    #$000F, R3                      ; 5354   02BB 000F
        ANDR    R2,     R3                      ; 5356   0193
        CMPI    #$0003, R3                      ; 5357   037B 0003
        BNEQ    L_5394                          ; 5359   020C 0039

        MVI     G_0348, R1                      ; 535B   0281 0348
        ANDI    #$00FF, R1                      ; 535D   03B9 00FF
        CMPI    #$0050, R1                      ; 535F   0379 0050
        BGT     L_5394                          ; 5361   020E 0031

        CLRR    R4                              ; 5363   01E4
        MVO     R4,     .BTAB.5F                ; 5364   0244 025F
        MVO     R4,     .BTAB.60                ; 5366   0244 0260
        MVO     R4,     .BTAB.61                ; 5368   0244 0261
        MVO     R4,     .BTAB.73                ; 536A   0244 0273
        MVO     R4,     .BTAB.74                ; 536C   0244 0274
        MVO     R4,     .BTAB.75                ; 536E   0244 0275
        MVO     R4,     .BTAB.87                ; 5370   0244 0287
        MVO     R4,     .BTAB.88                ; 5372   0244 0288
        MVO     R4,     .BTAB.89                ; 5374   0244 0289
        MVO     R4,     .BTAB.9B                ; 5376   0244 029B
        MVO     R4,     .BTAB.9C                ; 5378   0244 029C
        MVO     R4,     .BTAB.9D                ; 537A   0244 029D
        MVII    #$035B, R4                      ; 537C   02BC 035B
        SDBD                                    ; 537E   0001
        MVII    #$19AF, R1                      ; 537F   02B9 00AF 0019
        MVO@    R1,     R4                      ; 5382   0261
        MVO@    R1,     R4                      ; 5383   0261
        MVO@    R1,     R4                      ; 5384   0261
        MVII    #$034E, R4                      ; 5385   02BC 034E
        SDBD                                    ; 5387   0001
        MVII    #$5679, R5                      ; 5388   02BD 0079 0056
        MVII    #$0006, R2                      ; 538B   02BA 0006
L_538D:
        MVI@    R5,     R1                      ; 538D   02A9
        MVO@    R1,     R4                      ; 538E   0261
        DECR    R2                              ; 538F   0012
        BNEQ    L_538D                          ; 5390   022C 0004
        B       L_53B5                          ; 5392   0200 0021

L_5394:
        CMPI    #$000A, R3                      ; 5394   037B 000A
        BNEQ    L_53BB                          ; 5396   020C 0023

        MVI     G_0332, R1                      ; 5398   0281 0332
        SDBD                                    ; 539A   0001
        CMPI    #$0474, R1                      ; 539B   0379 0074 0004
        BGE     L_53BB                          ; 539E   020D 001B

        CLRR    R1                              ; 53A0   01C9
        MVO     R1,     .BTAB.2C                ; 53A1   0241 022C
        MVO     R1,     .BTAB.40                ; 53A3   0241 0240
        MVO     R1,     .BTAB.55                ; 53A5   0241 0255
        MVO     R1,     .BTAB.56                ; 53A7   0241 0256
        MVO     R1,     .BTAB.5E                ; 53A9   0241 025E
        MVO     R1,     .BTAB.5F                ; 53AB   0241 025F
        MVO     R1,     .BTAB.6E                ; 53AD   0241 026E
        MVO     R1,     .BTAB.97                ; 53AF   0241 0297
        MVO     R1,     .BTAB.98                ; 53B1   0241 0298
        MVO     R1,     .BTAB.99                ; 53B3   0241 0299
L_53B5:
        MVI     G_010E, R1                      ; 53B5   0281 010E
        XORI    #$0002, R1                      ; 53B7   03F9 0002
        MVO     R1,     G_010E                  ; 53B9   0241 010E
L_53BB:
        MVI     G_0342, R0                      ; 53BB   0280 0342
        SWAP    R0,     1                       ; 53BD   0040
        SLLC    R0,     2                       ; 53BE   005C
        BNOV    L_5443                          ; 53BF   020A 0082

        MVI     G_0338, R1                      ; 53C1   0281 0338
        SWAP    R1,     1                       ; 53C3   0041
        SLLC    R1,     1                       ; 53C4   0059
        BC      L_5443                          ; 53C5   0201 007C

        MVI     G_0174, R1                      ; 53C7   0281 0174
        AND     G_010E, R1                      ; 53C9   0381 010E
        SARC    R1,     1                       ; 53CB   0079
        BC      L_5443                          ; 53CC   0201 0075

        CMPI    #$000E, R3                      ; 53CE   037B 000E
        BNEQ    L_53EC                          ; 53D0   020C 001A

        MVII    #$035B, R4                      ; 53D2   02BC 035B
        SDBD                                    ; 53D4   0001
        MVII    #$0946, R1                      ; 53D5   02B9 0046 0009
        MVO@    R1,     R4                      ; 53D8   0261
        MVO@    R1,     R4                      ; 53D9   0261
        CLRR    R1                              ; 53DA   01C9
        MVO@    R1,     R4                      ; 53DB   0261
        MVII    #$034E, R4                      ; 53DC   02BC 034E
        SDBD                                    ; 53DE   0001
        MVII    #$566F, R5                      ; 53DF   02BD 006F 0056
        MVII    #$0004, R2                      ; 53E2   02BA 0004
L_53E4:
        MVI@    R5,     R1                      ; 53E4   02A9
        MVO@    R1,     R4                      ; 53E5   0261
        DECR    R2                              ; 53E6   0012
        BNEQ    L_53E4                          ; 53E7   022C 0004

        CLRR    R1                              ; 53E9   01C9
        MVO     R1,     G_0184                  ; 53EA   0241 0184
L_53EC:
        CMPI    #$0007, R3                      ; 53EC   037B 0007
        BNEQ    L_53FE                          ; 53EE   020C 000E

        MVII    #$035B, R4                      ; 53F0   02BC 035B
        MOVR    R4,     R5                      ; 53F2   00A5
        MVII    #$0003, R0                      ; 53F3   02B8 0003
L_53F5:
        MVI@    R4,     R1                      ; 53F5   02A1
        SDBD                                    ; 53F6   0001
        XORI    #$1007, R1                      ; 53F7   03F9 0007 0010
        MVO@    R1,     R5                      ; 53FA   0269
        DECR    R0                              ; 53FB   0010
        BNEQ    L_53F5                          ; 53FC   022C 0008

L_53FE:
        CMPI    #$0002, R3                      ; 53FE   037B 0002
        BNEQ    L_541A                          ; 5400   020C 0018

        MVII    #$035B, R4                      ; 5402   02BC 035B
        SDBD                                    ; 5404   0001
        MVII    #$1912, R1                      ; 5405   02B9 0012 0019
        MVO@    R1,     R4                      ; 5408   0261
        MVO@    R1,     R4                      ; 5409   0261
        ADDI    #$0008, R1                      ; 540A   02F9 0008
        MVO@    R1,     R4                      ; 540C   0261
        MVII    #$034E, R4                      ; 540D   02BC 034E
        SDBD                                    ; 540F   0001
        MVII    #$5673, R5                      ; 5410   02BD 0073 0056
        MVII    #$0006, R2                      ; 5413   02BA 0006
L_5415:
        MVI@    R5,     R1                      ; 5415   02A9
        MVO@    R1,     R4                      ; 5416   0261
        DECR    R2                              ; 5417   0012
        BNEQ    L_5415                          ; 5418   022C 0004

L_541A:
        MVII    #$0003, R3                      ; 541A   02BB 0003
        MVI     G_0338, R2                      ; 541C   0282 0338
        SLR     R2,     1                       ; 541E   0062
        ANDR    R2,     R3                      ; 541F   0193
        DECR    R3                              ; 5420   0013
        SDBD                                    ; 5421   0001
        ADDI    #$5664, R3                      ; 5422   02FB 0064 0056
        MVII    #$0030, R1                      ; 5425   02B9 0030
        ANDR    R2,     R1                      ; 5427   0191
        SLR     R1,     2                       ; 5428   0065
        ADDR    R3,     R1                      ; 5429   00D9
        SLL     R2,     1                       ; 542A   004A
        XORI    #$0081, R2                      ; 542B   03FA 0081
        MVO     R2,     G_0338                  ; 542D   0242 0338
        MVI@    R1,     R0                      ; 542F   0288
        MVO     R0,     G_010F                  ; 5430   0240 010F
        SDBD                                    ; 5432   0001
        MVII    #$6893, R2                      ; 5433   02BA 0093 0068
        MVO     R2,     G_010A                  ; 5436   0242 010A
        SWAP    R2,     1                       ; 5438   0042
        MVO     R2,     G_010B                  ; 5439   0242 010B
        CLRR    R2                              ; 543B   01D2
        MVO     R2,     G_035E                  ; 543C   0242 035E
        INCR    R2                              ; 543E   000A
        MVO     R2,     G_0108                  ; 543F   0242 0108
        MVO     R2,     G_0109                  ; 5441   0242 0109
L_5443:
        MVI     G_0340, R0                      ; 5443   0280 0340
        MVI     G_0348, R3                      ; 5445   0283 0348
        ADDI    #$0004, R3                      ; 5447   02FB 0004
        MVI     G_0349, R4                      ; 5449   0284 0349
        ADDI    #$0004, R4                      ; 544B   02FC 0004
        CLRR    R2                              ; 544D   01D2
        B       L_5455                          ; 544E   0200 0005

L_5450:
        MVII    #$00FC, R1                      ; 5450   02B9 00FC
        ANDR    R0,     R1                      ; 5452   0181
        BNEQ    L_567F                          ; 5453   020C 022A

L_5455:
        SWAP    R0,     1                       ; 5455   0040
        RRC     R0,     1                       ; 5456   0070
        BNC     L_56BC                          ; 5457   0209 0263

        MOVR    R4,     R1                      ; 5459   00A1
        SLR     R1,     2                       ; 545A   0065
        SLR     R1,     1                       ; 545B   0061
        DECR    R1                              ; 545C   0011
        ANDI    #$000F, R1                      ; 545D   03B9 000F
        CLRR    R0                              ; 545F   01C0
L_5460:
        DECR    R1                              ; 5460   0011
        BMI     L_5467                          ; 5461   020B 0004

        ADDI    #$0014, R0                      ; 5463   02F8 0014
        B       L_5460                          ; 5465   0220 0006

L_5467:
        MOVR    R3,     R1                      ; 5467   0099
        SLR     R1,     2                       ; 5468   0065
        SLR     R1,     1                       ; 5469   0061
        DECR    R1                              ; 546A   0011
        ANDI    #$001F, R1                      ; 546B   03B9 001F
        ADDR    R0,     R1                      ; 546D   00C1
        MOVR    R1,     R0                      ; 546E   0088
        ADDI    #$0200, R1                      ; 546F   02F9 0200
        MVI@    R1,     R3                      ; 5471   028B
        ANDI    #$0007, R3                      ; 5472   03BB 0007
        CMPI    #$0007, R3                      ; 5474   037B 0007
        BNEQ    L_56BC                          ; 5476   020C 0244

        TSTR    R2                              ; 5478   0092
        BEQ     L_554F                          ; 5479   0204 00D4

        ANDI    #$0003, R2                      ; 547B   03BA 0003
        DECR    R2                              ; 547D   0012
        SWAP    R2,     1                       ; 547E   0042
        SLR     R2,     2                       ; 547F   0066
        MOVR    R2,     R4                      ; 5480   0094
        SLR     R2,     1                       ; 5481   0062
        ADDR    R2,     R4                      ; 5482   00D4
        SDBD                                    ; 5483   0001
        ADDI    #$6278, R4                      ; 5484   02FC 0078 0062
        CLRR    R1                              ; 5487   01C9
L_5488:
        CMP@    R4,     R0                      ; 5488   0360
        BEQ     L_5492                          ; 5489   0204 0007

        INCR    R1                              ; 548B   0009
        CMPI    #$0008, R1                      ; 548C   0379 0008
        BLT     L_5488                          ; 548E   0225 0007
        B       L_56BC                          ; 5490   0200 022A

L_5492:
        CLRR    R3                              ; 5492   01DB
        MVO     R3,     G_0184                  ; 5493   0243 0184
        PSHR    R4                              ; 5495   0274
        PSHR    R1                              ; 5496   0271

        JSR     R5,     L_5214                  ; 5497   0004 0150 0214
        DECLE   $0200,  $00F0                   ; 549A   0200 00F0

        PULR    R1                              ; 549C   02B1
        PULR    R4                              ; 549D   02B4
        SDBD                                    ; 549E   0001
        MVII    #$0832, R3                      ; 549F   02BB 0032 0008
        MVO     R3,     G_0358                  ; 54A2   0243 0358
        SDBD                                    ; 54A4   0001
        MVII    #$083E, R3                      ; 54A5   02BB 003E 0008
        MVO     R3,     G_035A                  ; 54A8   0243 035A
        ADDI    #$0007, R4                      ; 54AA   02FC 0007
        MVI@    R4,     R3                      ; 54AC   02A3
        MVO     R3,     G_0348                  ; 54AD   0243 0348
        MVO     R3,     G_034C                  ; 54AF   0243 034C
        ADDI    #$0007, R4                      ; 54B1   02FC 0007
        MVI@    R4,     R3                      ; 54B3   02A3
        MVO     R3,     G_0349                  ; 54B4   0243 0349
        MVO     R3,     G_034D                  ; 54B6   0243 034D
        SUBR    R1,     R4                      ; 54B8   010C
        SLR     R1,     1                       ; 54B9   0061
        SLL     R1,     2                       ; 54BA   004D
        SLL     R1,     1                       ; 54BB   0049
        MVI     G_0338, R2                      ; 54BC   0282 0338
        SDBD                                    ; 54BE   0001
        ANDI    #$FF66, R2                      ; 54BF   03BA 0066 00FF
        INCR    R2                              ; 54C2   000A
        XORR    R1,     R2                      ; 54C3   01CA
        MVO     R2,     G_0338                  ; 54C4   0242 0338
        MVII    #$0002, R3                      ; 54C6   02BB 0002
        MVO     R3,     G_012D                  ; 54C8   0243 012D
        SLL     R1,     1                       ; 54CA   0049
        ADDR    R1,     R4                      ; 54CB   00CC
        ADDI    #$0007, R4                      ; 54CC   02FC 0007
        MVI@    R4,     R1                      ; 54CE   02A1
        MVII    #$0007, R3                      ; 54CF   02BB 0007
        ANDR    R1,     R3                      ; 54D1   018B
        ANDI    #$0038, R1                      ; 54D2   03B9 0038
        SWAP    R1,     1                       ; 54D4   0041
        XORR    R3,     R1                      ; 54D5   01D9
        MVII    #$035B, R5                      ; 54D6   02BD 035B
        MVII    #$0003, R0                      ; 54D8   02B8 0003
L_54DA:
        MVI@    R4,     R3                      ; 54DA   02A3
        SLL     R3,     1                       ; 54DB   004B
        XORR    R1,     R3                      ; 54DC   01CB
        MVO@    R3,     R5                      ; 54DD   026B
        DECR    R0                              ; 54DE   0010
        BNEQ    L_54DA                          ; 54DF   022C 0006

        MVII    #$001F, R1                      ; 54E1   02B9 001F
        PSHR    R1                              ; 54E3   0271
        MVII    #$034E, R5                      ; 54E4   02BD 034E
        MVII    #$01E0, R2                      ; 54E6   02BA 01E0
        MVII    #$0003, R0                      ; 54E8   02B8 0003
L_54EA:
        MVI@    R4,     R3                      ; 54EA   02A3
        PULR    R1                              ; 54EB   02B1
        PSHR    R1                              ; 54EC   0271
        ANDR    R3,     R1                      ; 54ED   0199
        SLL     R1,     2                       ; 54EE   004D
        SLL     R1,     1                       ; 54EF   0049
        ADDI    #$0300, R1                      ; 54F0   02F9 0300
        MVO@    R1,     R5                      ; 54F2   0269
        ANDR    R2,     R3                      ; 54F3   0193
        SLR     R3,     2                       ; 54F4   0067
        ADDI    #$0100, R3                      ; 54F5   02FB 0100
        MVO@    R3,     R5                      ; 54F7   026B
        DECR    R0                              ; 54F8   0010
        BNEQ    L_54EA                          ; 54F9   022C 0010

        PULR    R1                              ; 54FB   02B1
        SDBD                                    ; 54FC   0001
        MVI@    R4,     R3                      ; 54FD   02A3
        MVO     R3,     G_035E                  ; 54FE   0243 035E
        MVI@    R4,     R3                      ; 5500   02A3
        MVO@    R3,     R5                      ; 5501   026B
        MVI@    R4,     R3                      ; 5502   02A3
        MVO@    R3,     R5                      ; 5503   026B
        CLRR    R2                              ; 5504   01D2
        MVO     R2,     G_0153                  ; 5505   0242 0153
        MVO     R2,     G_0154                  ; 5507   0242 0154
        MVO     R2,     G_010D                  ; 5509   0242 010D
        MVO     R2,     G_010E                  ; 550B   0242 010E
        MVI@    R4,     R3                      ; 550D   02A3
        MVO     R3,     G_010A                  ; 550E   0243 010A
        MVI@    R4,     R3                      ; 5510   02A3
        MVO     R3,     G_010B                  ; 5511   0243 010B
        MVII    #$0001, R2                      ; 5513   02BA 0001
        MVO     R2,     G_0108                  ; 5515   0242 0108
        MVO     R2,     G_0109                  ; 5517   0242 0109
        SDBD                                    ; 5519   0001
        MVII    #$05A0, R1                      ; 551A   02B9 00A0 0005
        MVO     R1,     G_0332                  ; 551D   0241 0332
        MVI     G_0338, R2                      ; 551F   0282 0338
        SLR     R2,     2                       ; 5521   0066
        SLR     R2,     1                       ; 5522   0062
        ANDI    #$0003, R2                      ; 5523   03BA 0003
        ADDI    #$0334, R2                      ; 5525   02FA 0334
        MVI@    R2,     R1                      ; 5527   0291
        MVO     R1,     G_0331                  ; 5528   0241 0331
        CLRR    R1                              ; 552A   01C9
        MVO     R1,     G_0174                  ; 552B   0241 0174

        JSR     R5,     L_56BF                  ; 552D   0004 0154 02BF

        MVI     G_0338, R2                      ; 5530   0282 0338
        ANDI    #$001E, R2                      ; 5532   03BA 001E
        CMPI    #$0002, R2                      ; 5534   037A 0002
        BNEQ    L_5540                          ; 5536   020C 0008

        PSHR    R2                              ; 5538   0272
        DECR    R2                              ; 5539   0012
        MVO     R2,     G_0174                  ; 553A   0242 0174

        JSR     R5,     L_670C                  ; 553C   0004 0164 030C

        PULR    R2                              ; 553F   02B2
L_5540:
        SDBD                                    ; 5540   0001
        DECLE   $02FA,  $0058,  $0062,  $0095   ; 5541   02FA 0058 0062 0095
        DECLE   $0001                           ; 5545   0001

        MVI@    R5,     R4                      ; 5546   02AC

        JSR     R5,     L_622C                  ; 5547   0004 0160 022C
        JSR     R5,     L_57A9                  ; 554A   0004 0154 03A9

        B       L_563C                          ; 554D   0200 00ED

L_554F:
        CLRR    R3                              ; 554F   01DB
        MVO     R3,     G_010E                  ; 5550   0243 010E
        MVO     R3,     G_0174                  ; 5552   0243 0174
        MVO     R3,     G_0184                  ; 5554   0243 0184
        PSHR    R0                              ; 5556   0270
        MVI     G_010F, R0                      ; 5557   0280 010F

        JSR     R5,     L_5794                  ; 5559   0004 0154 0394
        JSR     R5,     L_5214                  ; 555C   0004 0150 0214
        DECLE   $0200,  $00F0                   ; 555F   0200 00F0

        PULR    R0                              ; 5561   02B0

        JSR     R5,     L_6B40                  ; 5562   0004 0168 0340

        SDBD                                    ; 5565   0001
        MVII    #$09DA, R3                      ; 5566   02BB 00DA 0009
        MVII    #$0358, R4                      ; 5569   02BC 0358
        MVO@    R3,     R4                      ; 556B   0263
        MVII    #$0000, R3                      ; 556C   02BB 0000
        MVO@    R3,     R4                      ; 556E   0263
        SDBD                                    ; 556F   0001
        MVII    #$0885, R3                      ; 5570   02BB 0085 0008
        MOVR    R3,     R2                      ; 5573   009A
        ADDI    #$0008, R2                      ; 5574   02FA 0008
L_5576:
        MVO@    R3,     R4                      ; 5576   0263
        MVO@    R2,     R4                      ; 5577   0262
        CMPI    #$0360, R4                      ; 5578   037C 0360
        BNC     L_5576                          ; 557A   0229 0005

        MVI     G_0338, R2                      ; 557C   0282 0338
        SLR     R2,     1                       ; 557E   0062
        SLL     R2,     1                       ; 557F   004A
        MVO     R2,     G_0338                  ; 5580   0242 0338
        MOVR    R2,     R3                      ; 5582   0093
        MOVR    R2,     R4                      ; 5583   0094
        MVI     G_0110, R2                      ; 5584   0282 0110
        TSTR    R2                              ; 5586   0092
        BNEQ    L_55AA                          ; 5587   020C 0021

        MOVR    R4,     R2                      ; 5589   00A2
        ANDI    #$0006, R2                      ; 558A   03BA 0006
        SUBI    #$0002, R2                      ; 558C   033A 0002
        SLL     R2,     2                       ; 558E   004E
        ANDI    #$0018, R3                      ; 558F   03BB 0018
        SLR     R3,     2                       ; 5591   0067
        ADDR    R3,     R2                      ; 5592   00DA
        SDBD                                    ; 5593   0001
        ADDI    #$638D, R2                      ; 5594   02FA 008D 0063
        CMP@    R2,     R0                      ; 5597   0350
        BEQ     L_55A1                          ; 5598   0204 0007

        INCR    R2                              ; 559A   000A
        CMP@    R2,     R0                      ; 559B   0350
        BEQ     L_55A0                          ; 559C   0204 0002

        ADDI    #$0018, R2                      ; 559E   02FA 0018
L_55A0:
        DECR    R2                              ; 55A0   0012
L_55A1:
        ADDI    #$0018, R2                      ; 55A1   02FA 0018
        MVI@    R2,     R1                      ; 55A3   0291
        MVO     R1,     G_0348                  ; 55A4   0241 0348
        INCR    R2                              ; 55A6   000A
        MVI@    R2,     R1                      ; 55A7   0291
        MVO     R1,     G_0349                  ; 55A8   0241 0349
L_55AA:
        PSHR    R4                              ; 55AA   0274

        JSR     R5,     L_51DC                  ; 55AB   0004 0150 01DC

        PULR    R5                              ; 55AE   02B5
        ADDR    R5,     R5                      ; 55AF   00ED
        ADDR    R5,     R5                      ; 55B0   00ED
        ANDI    #$0018, R5                      ; 55B1   03BD 0018
        SDBD                                    ; 55B3   0001
        ADDI    #$6258, R5                      ; 55B4   02FD 0058 0062
        SDBD                                    ; 55B7   0001
        MVI@    R5,     R4                      ; 55B8   02AC

        JSR     R5,     L_622C                  ; 55B9   0004 0160 022C

        MVI     G_0338, R0                      ; 55BC   0280 0338
        SWAP    R0,     1                       ; 55BE   0040
        SLLC    R0,     1                       ; 55BF   0058
        SLR     R0,     1                       ; 55C0   0060
        SWAP    R0,     1                       ; 55C1   0040
        BNC     L_55D0                          ; 55C2   0209 000C

        MOVR    R0,     R1                      ; 55C4   0081
        MVII    #$0010, R2                      ; 55C5   02BA 0010
        ANDI    #$0018, R1                      ; 55C7   03B9 0018
L_55C9:
        SLR     R2,     1                       ; 55C9   0062
        SUBI    #$0008, R1                      ; 55CA   0339 0008
        BPL     L_55C9                          ; 55CC   0223 0004

        SWAP    R2,     1                       ; 55CE   0042
        XORR    R2,     R0                      ; 55CF   01D0
L_55D0:
        MVO     R0,     G_0338                  ; 55D0   0240 0338
        MVII    #$0318, R1                      ; 55D2   02B9 0318
        SLLC    R0,     2                       ; 55D4   005C
        SLL     R0,     1                       ; 55D5   0048
        SWAP    R0,     1                       ; 55D6   0040
        ANDI    #$0003, R0                      ; 55D7   03B8 0003
        BNC     L_55DD                          ; 55D9   0209 0002

        ADDI    #$0003, R0                      ; 55DB   02F8 0003
L_55DD:
        ADDR    R0,     R1                      ; 55DD   00C1
        MVI     G_0338, R0                      ; 55DE   0280 0338
        MOVR    R0,     R2                      ; 55E0   0082
        SDBD                                    ; 55E1   0001
        ANDI    #$0F00, R0                      ; 55E2   03B8 0000 000F
        ANDI    #$0006, R2                      ; 55E5   03BA 0006
L_55E7:
        SUBI    #$0002, R2                      ; 55E7   033A 0002
        BEQ     L_55EF                          ; 55E9   0204 0004

        SLR     R0,     2                       ; 55EB   0064
        SLR     R0,     2                       ; 55EC   0064
        B       L_55E7                          ; 55ED   0220 0007

L_55EF:
        COMR    R0                              ; 55EF   0018
        MVI@    R1,     R3                      ; 55F0   028B
        COMR    R3                              ; 55F1   001B
        ANDR    R0,     R3                      ; 55F2   0183
        COMR    R3                              ; 55F3   001B
        MVO@    R3,     R1                      ; 55F4   024B
        MVI     G_0338, R0                      ; 55F5   0280 0338
        MVII    #$0006, R3                      ; 55F7   02BB 0006
        ANDR    R0,     R3                      ; 55F9   0183
        SUBI    #$0002, R3                      ; 55FA   033B 0002
        SLL     R3,     2                       ; 55FC   004F
        MOVR    R3,     R5                      ; 55FD   009D
        SDBD                                    ; 55FE   0001
        ADDI    #$63D5, R5                      ; 55FF   02FD 00D5 0063
        SWAP    R0,     1                       ; 5602   0040
        ANDI    #$000F, R0                      ; 5603   03B8 000F
        CMPI    #$000F, R0                      ; 5605   0378 000F
        BEQ     L_564B                          ; 5607   0204 0042

L_5609:
        SARC    R0,     1                       ; 5609   0078
        BNC     L_5615                          ; 560A   0209 0009

        PSHR    R0                              ; 560C   0270
        PSHR    R5                              ; 560D   0275
        SDBD                                    ; 560E   0001
        MVI@    R5,     R4                      ; 560F   02AC

        JSR     R5,     L_622C                  ; 5610   0004 0160 022C

        PULR    R5                              ; 5613   02B5
        PULR    R0                              ; 5614   02B0
L_5615:
        ADDI    #$0002, R5                      ; 5615   02FD 0002
        TSTR    R0                              ; 5617   0080
        BNEQ    L_5609                          ; 5618   022C 0010

        MVI     G_0110, R2                      ; 561A   0282 0110
        TSTR    R2                              ; 561C   0092
        BNEQ    L_562A                          ; 561D   020C 000B

        MVI     G_0338, R2                      ; 561F   0282 0338
        SLR     R2,     2                       ; 5621   0066
        SLR     R2,     1                       ; 5622   0062
        ANDI    #$0003, R2                      ; 5623   03BA 0003
        ADDI    #$0334, R2                      ; 5625   02FA 0334
        MVI     G_0331, R1                      ; 5627   0281 0331
        MVO@    R1,     R2                      ; 5629   0251
L_562A:
        CLRR    R1                              ; 562A   01C9
        MVO     R1,     G_0110                  ; 562B   0241 0110
        SDBD                                    ; 562D   0001
        MVII    #$678F, R0                      ; 562E   02B8 008F 0067
        MVO     R0,     G_010A                  ; 5631   0240 010A
        SWAP    R0,     1                       ; 5633   0040
        MVO     R0,     G_010B                  ; 5634   0240 010B
        MVII    #$0001, R0                      ; 5636   02B8 0001
        MVO     R0,     G_0108                  ; 5638   0240 0108
        MVO     R0,     G_0109                  ; 563A   0240 0109

L_563C:
        JSR     R5,     L_5961                  ; 563C   0004 0158 0161
        DECLE   $000A                           ; 563F   000A

        MVII    #$0005, R0                      ; 5640   02B8 0005
        MVO     R0,     G_0102                  ; 5642   0240 0102
        CLRR    R0                              ; 5644   01C0
        MVO     R0,     G_0340                  ; 5645   0240 0340
        MVO     R0,     G_010F                  ; 5647   0240 010F
        B       L_56BC                          ; 5649   0200 0071

L_564B:
        JSR     R5,     L_5961                  ; 564B   0004 0158 0161
        DECLE   $0004                           ; 564E   0004

        SDBD                                    ; 564F   0001
        MVII    #$68BF, R1                      ; 5650   02B9 00BF 0068
        MVO     R1,     G_010A                  ; 5653   0241 010A
        SWAP    R1,     1                       ; 5655   0041
        MVO     R1,     G_010B                  ; 5656   0241 010B
        MVII    #$0001, R1                      ; 5658   02B9 0001
        MVO     R1,     G_0109                  ; 565A   0241 0109
        MVO     R1,     G_0108                  ; 565C   0241 0108
        MVII    #$0007, R1                      ; 565E   02B9 0007
        MVO     R1,     G_0102                  ; 5660   0241 0102
        B       L_56D6                          ; 5662   0200 0072

        DECLE   $0014,  $0028,  $003C,  $0000   ; 5664   0014 0028 003C 0000
        DECLE   $0050,  $0064,  $0078,  $0000   ; 5668   0050 0064 0078 0000

        MOVR    R1,     R4                      ; 566C   008C
        MOVR    R4,     R0                      ; 566D   00A0
        MOVR    R6,     R4                      ; 566E   00B4
        CMP     G_0138, R0                      ; 566F   0340 0138
        CMP@    R6,     R0                      ; 5671   0370
        SUBR    R7,     R0                      ; 5672   0138
        SUB@    R5,     R0                      ; 5673   0328
        SUBR    R4,     R0                      ; 5674   0120
        CMP@    R3,     R4                      ; 5675   035C
        SUBR    R7,     R0                      ; 5676   0138
        AND@    R1,     R0                      ; 5677   0388
        SUBR    R4,     R0                      ; 5678   0120
        CMPI    #$0128, R0                      ; 5679   0378 0128
        CMPI    #$0130, R0                      ; 567B   0378 0130
        CMPI    #$0138, R0                      ; 567D   0378 0138

L_567F:
        JSR     R5,     L_5961                  ; 567F   0004 0158 0161
        DECLE   $0009                           ; 5682   0009

        CLRR    R1                              ; 5683   01C9
        MVO     R1,     G_0145                  ; 5684   0241 0145
        MVO     R1,     G_0108                  ; 5686   0241 0108
        MVO     R1,     .PSG0.chn_a_vol         ; 5688   0241 01FB

        JSR     R5,     L_6ADC                  ; 568A   0004 0168 02DC

        MVII    #$0003, R1                      ; 568D   02B9 0003
L_568F:
        MVII    #$0002, R0                      ; 568F   02B8 0002
        MVO     R0,     G_0102                  ; 5691   0240 0102
        PSHR    R1                              ; 5693   0271

        JSR     R5,     L_6B57                  ; 5694   0004 0168 0357

        MVII    #$0003, R0                      ; 5697   02B8 0003
        MVO     R0,     G_0102                  ; 5699   0240 0102

        JSR     R5,     L_6B57                  ; 569B   0004 0168 0357

        PULR    R1                              ; 569E   02B1
        DECR    R1                              ; 569F   0011
        BNEQ    L_568F                          ; 56A0   022C 0012

        JSR     R5,     L_5961                  ; 56A2   0004 0158 0161
        DECLE   $0008                           ; 56A5   0008

        MVII    #$0106, R2                      ; 56A6   02BA 0106
        MVI     G_0338, R0                      ; 56A8   0280 0338
        SDBD                                    ; 56AA   0001
        ANDI    #$FF7F, R0                      ; 56AB   03B8 007F 00FF
        MVO     R0,     G_0338                  ; 56AE   0240 0338
        RLC     R0,     1                       ; 56B0   0050
        BNC     L_56B4                          ; 56B1   0209 0001

        INCR    R2                              ; 56B3   000A
L_56B4:
        MVI@    R2,     R0                      ; 56B4   0290
        DECR    R0                              ; 56B5   0010
        BMI     L_56B9                          ; 56B6   020B 0001

        MVO@    R0,     R2                      ; 56B8   0250
L_56B9:
        J       L_50DD                          ; 56B9   0004 0350 00DD
L_56BC:
        J       L_5261                          ; 56BC   0004 0350 0261

L_56BF:
        PSHR    R5                              ; 56BF   0275
        CLRR    R0                              ; 56C0   01C0
        MVII    #$0018, R1                      ; 56C1   02B9 0018
        MVII    #$0140, R5                      ; 56C3   02BD 0140
L_56C5:
        MVO@    R0,     R5                      ; 56C5   0268
        DECR    R1                              ; 56C6   0011
        BNEQ    L_56C5                          ; 56C7   022C 0003

        INCR    R0                              ; 56C9   0008
        MVII    #$0008, R1                      ; 56CA   02B9 0008
        MVII    #$0140, R2                      ; 56CC   02BA 0140
L_56CE:
        MVO@    R0,     R5                      ; 56CE   0268
        MVO@    R0,     R2                      ; 56CF   0250
        ADDI    #$0003, R2                      ; 56D0   02FA 0003
        DECR    R1                              ; 56D2   0011
        BNEQ    L_56CE                          ; 56D3   022C 0006
        PULR    R7                              ; 56D5   02B7

L_56D6:
        JSR     R5,     L_5214                  ; 56D6   0004 0150 0214
        DECLE   $0200,  $00F0                   ; 56D9   0200 00F0

        JSR     R5,     L_6215                  ; 56DB   0004 0160 0215
        BIDECLE $661E                           ; 56DE   001E 0066
        DECLE   $0000,  $0000                   ; 56E0   0000 0000

        MVI     G_0338, R1                      ; 56E2   0281 0338
        SLR     R1,     1                       ; 56E4   0061
        MVII    #$0030, R0                      ; 56E5   02B8 0030
        ANDR    R1,     R0                      ; 56E7   0188
        ANDI    #$0003, R1                      ; 56E8   03B9 0003
        SLR     R0,     2                       ; 56EA   0064
        SLR     R0,     2                       ; 56EB   0064
        SUBR    R0,     R1                      ; 56EC   0101
        SLL     R0,     2                       ; 56ED   004C
        ADDR    R0,     R1                      ; 56EE   00C1
        MVII    #$0087, R2                      ; 56EF   02BA 0087
        SLL     R1,     1                       ; 56F1   0049
        SLL     R1,     2                       ; 56F2   004D
        ADDR    R1,     R2                      ; 56F3   00CA
        MVO     R2,     .BTAB.80                ; 56F4   0242 0280
        MVI     G_0338, R0                      ; 56F6   0280 0338
        MOVR    R0,     R1                      ; 56F8   0081
        SLR     R1,     1                       ; 56F9   0061
        MVII    #$0003, R2                      ; 56FA   02BA 0003
        ANDR    R1,     R2                      ; 56FC   018A
        CMPI    #$0003, R2                      ; 56FD   037A 0003
        BNEQ    L_570E                          ; 56FF   020C 000D

        SLR     R1,     2                       ; 5701   0065
        SLR     R1,     2                       ; 5702   0065
        ANDR    R1,     R2                      ; 5703   018A
        CMPI    #$0002, R2                      ; 5704   037A 0002
        BNEQ    L_570B                          ; 5706   020C 0003

        MOVR    R0,     R1                      ; 5708   0081
        B       L_5710                          ; 5709   0200 0005

L_570B:
        INCR    R1                              ; 570B   0009
        SLL     R1,     2                       ; 570C   004D
        SLL     R1,     2                       ; 570D   004D
L_570E:
        INCR    R1                              ; 570E   0009
        SLL     R1,     1                       ; 570F   0049
L_5710:
        SDBD                                    ; 5710   0001
        ANDI    #$F07F, R1                      ; 5711   03B9 007F 00F0
        MVO     R1,     G_0338                  ; 5714   0241 0338

        JSR     R5,     L_6B46                  ; 5716   0004 0168 0346
        DECLE   $0003                           ; 5719   0003

        JSR     R5,     L_5214                  ; 571A   0004 0150 0214
        DECLE   $0200,  $00F0                   ; 571D   0200 00F0

        JSR     R5,     L_6215                  ; 571F   0004 0160 0215
        BIDECLE $6631                           ; 5722   0031 0066
        DECLE   $003E,  $0066,  $004B,  $0066   ; 5724   003E 0066 004B 0066
        DECLE   $0053,  $0066,  $0000,  $0000   ; 5728   0053 0066 0000 0000

        JSR     R5,     L_57A9                  ; 572C   0004 0154 03A9

        MVII    #$033C, R1                      ; 572F   02B9 033C
        MVI     G_0338, R0                      ; 5731   0280 0338
        SLLC    R0,     1                       ; 5733   0058
        ADCR    R1                              ; 5734   0029
        PSHR    R1                              ; 5735   0271
        MVI@    R1,     R0                      ; 5736   0288

        JSR     R5,     L_6A7D                  ; 5737   0004 0168 027D
        BIDECLE $0007                           ; 573A   0007 0000
        DECLE   $0285                           ; 573C   0285

        MVII    #$0087, R1                      ; 573D   02B9 0087
        MVO     R1,     .BTAB.8A                ; 573F   0241 028A
        MVI     G_0330, R0                      ; 5741   0280 0330
        TSTR    R0                              ; 5743   0080
        BPL     L_5747                          ; 5744   0203 0001

        CLRR    R0                              ; 5746   01C0
L_5747:
        SWAP    R0,     1                       ; 5747   0040
        SLR     R0,     2                       ; 5748   0064
        SLR     R0,     1                       ; 5749   0060
        ANDI    #$000F, R0                      ; 574A   03B8 000F
        PSHR    R0                              ; 574C   0270
        BNEQ    L_5755                          ; 574D   020C 0006

        MVII    #$0087, R0                      ; 574F   02B8 0087
        MVO     R0,     .BTAB.9E                ; 5751   0240 029E
        B       L_575B                          ; 5753   0200 0006

L_5755:
        JSR     R5,     L_6A7D                  ; 5755   0004 0168 027D
        BIDECLE $0007                           ; 5758   0007 0000
        DECLE   $029A                           ; 575A   029A
L_575B:
        MVII    #$01C7, R3                      ; 575B   02BB 01C7
        MVO     R3,     .BTAB.9C                ; 575D   0243 029C
        PULR    R1                              ; 575F   02B1
        PULR    R3                              ; 5760   02B3
        PSHR    R3                              ; 5761   0273
        MVI@    R3,     R3                      ; 5762   029B
        CLRR    R0                              ; 5763   01C0
        INCR    R7                              ; 5764   000F

L_5765:
        ADDR    R3,     R0                      ; 5765   00D8
L_5766:
        DECR    R1                              ; 5766   0011
        BPL     L_5765                          ; 5767   0223 0003

        PSHR    R0                              ; 5769   0270

        JSR     R5,     L_6A7D                  ; 576A   0004 0168 027D
        BIDECLE $0007                           ; 576D   0007 0000
        DECLE   $02C1                           ; 576F   02C1

        MVII    #$0087, R0                      ; 5770   02B8 0087
        MVO     R0,     .BTAB.C6                ; 5772   0240 02C6
        PULR    R0                              ; 5774   02B0
        MVII    #$033E, R3                      ; 5775   02BB 033E
        MVI     G_0338, R1                      ; 5777   0281 0338
        SLLC    R1,     1                       ; 5779   0059
        BNC     L_577D                          ; 577A   0209 0001

        INCR    R3                              ; 577C   000B
L_577D:
        ADD@    R3,     R0                      ; 577D   02D8
        MVO@    R0,     R3                      ; 577E   0258

        JSR     R5,     L_6B46                  ; 577F   0004 0168 0346
        DECLE   $0003                           ; 5782   0003

        MVI@    R3,     R0                      ; 5783   0298

        JSR     R5,     L_57A9                  ; 5784   0004 0154 03A9
        JSR     R5,     L_6B11                  ; 5787   0004 0168 0311
        JSR     R5,     L_6B46                  ; 578A   0004 0168 0346
        DECLE   $0009                           ; 578D   0009

        CLRR    R0                              ; 578E   01C0
        PULR    R1                              ; 578F   02B1
        MVO@    R0,     R1                      ; 5790   0248
        J       L_5115                          ; 5791   0004 0350 0115

L_5794:
        PSHR    R5                              ; 5794   0275
        MOVR    R0,     R5                      ; 5795   0085
        MVII    #$033C, R1                      ; 5796   02B9 033C
        MVII    #$033E, R2                      ; 5798   02BA 033E
        MVI     G_0338, R3                      ; 579A   0283 0338
        SLLC    R3,     1                       ; 579C   005B
        BNC     L_57A1                          ; 579D   0209 0002

        INCR    R1                              ; 579F   0009
        INCR    R2                              ; 57A0   000A
L_57A1:
        ADD@    R1,     R5                      ; 57A1   02CD
        MVO@    R5,     R1                      ; 57A2   024D
        ADD@    R2,     R0                      ; 57A3   02D0
        MVO@    R0,     R2                      ; 57A4   0250

        JSR     R5,     L_57A9                  ; 57A5   0004 0154 03A9

        PULR    R7                              ; 57A8   02B7

L_57A9:
        PSHR    R5                              ; 57A9   0275
        MVII    #$008F, R1                      ; 57AA   02B9 008F
        MVII    #$0209, R2                      ; 57AC   02BA 0209
        MVII    #$0202, R4                      ; 57AE   02BC 0202
        MVI     G_033E, R0                      ; 57B0   0280 033E
        MVI     G_0338, R3                      ; 57B2   0283 0338
        SLLC    R3,     1                       ; 57B4   005B
        BNC     L_57BF                          ; 57B5   0209 0008

        MVII    #$0097, R1                      ; 57B7   02B9 0097
        MVII    #$0212, R2                      ; 57B9   02BA 0212
        MVII    #$020B, R4                      ; 57BB   02BC 020B
        MVI     G_033F, R0                      ; 57BD   0280 033F
L_57BF:
        MVO@    R1,     R4                      ; 57BF   0261
        MVII    #$006F, R1                      ; 57C0   02B9 006F
        MVO@    R1,     R4                      ; 57C2   0261
        MVII    #$0087, R1                      ; 57C3   02B9 0087
        MVO@    R1,     R2                      ; 57C5   0251
        ANDI    #$0007, R1                      ; 57C6   03B9 0007

        JSR     R5,     L_6A80                  ; 57C8   0004 0168 0280

        PULR    R7                              ; 57CB   02B7

L_57CC:
        PSHR    R5                              ; 57CC   0275
        MVI     G_0338, R0                      ; 57CD   0280 0338
        SLLC    R0,     2                       ; 57CF   005C
        BNOV    L_57E1                          ; 57D0   020A 000F

        MVI     G_0338, R0                      ; 57D2   0280 0338
        PSHR    R0                              ; 57D4   0270
        SDBD                                    ; 57D5   0001
        XORI    #$8000, R0                      ; 57D6   03F8 0000 0080
        MVO     R0,     G_0338                  ; 57D9   0240 0338

        JSR     R5,     L_57A9                  ; 57DB   0004 0154 03A9

        PULR    R0                              ; 57DE   02B0
        MVO     R0,     G_0338                  ; 57DF   0240 0338

L_57E1:
        JSR     R5,     L_57A9                  ; 57E1   0004 0154 03A9

        PULR    R7                              ; 57E4   02B7

        PSHR    R5                              ; 57E5   0275
        MVI     G_0103, R0                      ; 57E6   0280 0103
        TSTR    R0                              ; 57E8   0080
        BEQ     L_593A                          ; 57E9   0204 014F

        CLRR    R0                              ; 57EB   01C0
        MVO     R0,     G_0103                  ; 57EC   0240 0103
        SDBD                                    ; 57EE   0001
        MVII    #$594B, R4                      ; 57EF   02BC 004B 0059
        ADD     G_0102, R4                      ; 57F2   02C4 0102
        ADD     G_0102, R4                      ; 57F4   02C4 0102
        SDBD                                    ; 57F6   0001
        MVI@    R4,     R7                      ; 57F7   02A7

        MVII    #$00BD, R0                      ; 57F8   02B8 00BD
        SDBD                                    ; 57FA   0001
        MVII    #$3834, R4                      ; 57FB   02BC 0034 0038
        MVO@    R0,     R4                      ; 57FE   0260
        MVII    #$00C3, R0                      ; 57FF   02B8 00C3
        MVO@    R0,     R4                      ; 5801   0260
        CLRR    R0                              ; 5802   01C0
        MVO     R0,     G_0102                  ; 5803   0240 0102
        B       L_593A                          ; 5805   0200 0133

        MVII    #$00C3, R0                      ; 5807   02B8 00C3
        SDBD                                    ; 5809   0001
        MVII    #$3834, R4                      ; 580A   02BC 0034 0038
        MVO@    R0,     R4                      ; 580D   0260
        MVII    #$00BD, R0                      ; 580E   02B8 00BD
        MVO@    R0,     R4                      ; 5810   0260
        CLRR    R0                              ; 5811   01C0
        MVO     R0,     G_0102                  ; 5812   0240 0102
        B       L_593A                          ; 5814   0200 0124

        MVII    #$000A, R0                      ; 5816   02B8 000A
        MVO     R0,     .STIC.CS.0              ; 5818   0240 0028
        MVO     R0,     .STIC.BORD              ; 581A   0240 002C
        CLRR    R0                              ; 581C   01C0
        MVO     R0,     G_0102                  ; 581D   0240 0102
        B       L_593A                          ; 581F   0200 0119

        MVI     G_0120, R0                      ; 5821   0280 0120
        MVO     R0,     .STIC.BORD              ; 5823   0240 002C
        CLRR    R0                              ; 5825   01C0
        MVO     R0,     .STIC.CS.0              ; 5826   0240 0028
        MVO     R0,     G_0102                  ; 5828   0240 0102
        B       L_593A                          ; 582A   0200 010E

        JSR     R5,     L_5214                  ; 582C   0004 0150 0214
        DECLE   $0000,  $001F                   ; 582F   0000 001F

        JSR     R5,     L_5214                  ; 5831   0004 0150 0214
        DECLE   $0022,  $0011                   ; 5834   0022 0011

        MVI     .STIC.MODE,R0                   ; 5836   0280 0021
        MVII    #$0001, R0                      ; 5838   02B8 0001
        MVO     R0,     .STIC.CS.1              ; 583A   0240 0029
        MVO     R0,     .STIC.CS.3              ; 583C   0240 002B
        MVII    #$0006, R0                      ; 583E   02B8 0006
        MVO     R0,     .STIC.BORD              ; 5840   0240 002C
        MVII    #$0001, R0                      ; 5842   02B8 0001
        MVO     R0,     .STIC.EDGE              ; 5844   0240 0032
        SDBD                                    ; 5846   0001
        MVII    #$596A, R4                      ; 5847   02BC 006A 0059
        SDBD                                    ; 584A   0001
        MVII    #$3800, R5                      ; 584B   02BD 0000 0038
        MVII    #$0200, R1                      ; 584E   02B9 0200
L_5850:
        MVI@    R4,     R0                      ; 5850   02A0
        MVO@    R0,     R5                      ; 5851   0268
        DECR    R1                              ; 5852   0011
        BNEQ    L_5850                          ; 5853   022C 0004

        MVO     R1,     G_0102                  ; 5855   0241 0102
        B       L_593A                          ; 5857   0200 00E1

        MVII    #$0008, R1                      ; 5859   02B9 0008
        MVI     G_0320, R4                      ; 585B   0284 0320
        MVI     G_0321, R5                      ; 585D   0285 0321
L_585F:
        MVI@    R5,     R0                      ; 585F   02A8
        MVO@    R0,     R4                      ; 5860   0260
        DECR    R1                              ; 5861   0011
        BNEQ    L_585F                          ; 5862   022C 0004

        MVO     R1,     G_0102                  ; 5864   0241 0102
        MVO     R1,     G_0359                  ; 5866   0241 0359
        MVO     R1,     G_0341                  ; 5868   0241 0341
        MVO     R1,     .STIC.A.1               ; 586A   0241 0011
        B       L_593A                          ; 586C   0200 00CC

        MVII    #$0340, R4                      ; 586E   02BC 0340
        MVII    #$0017, R3                      ; 5870   02BB 0017
        MVII    #$0008, R5                      ; 5872   02BD 0008
        CLRR    R2                              ; 5874   01D2
L_5875:
        INCR    R3                              ; 5875   000B
        MVI@    R3,     R0                      ; 5876   0298
        MVO@    R2,     R3                      ; 5877   025A
        MVO@    R0,     R4                      ; 5878   0260
        DECR    R5                              ; 5879   0015
        BNEQ    L_5875                          ; 587A   022C 0006

        MVII    #$0010, R1                      ; 587C   02B9 0010
        MVII    #$0008, R3                      ; 587E   02BB 0008
L_5880:
        MVI@    R4,     R0                      ; 5880   02A0
        MVO@    R0,     R5                      ; 5881   0268
        MVI@    R4,     R0                      ; 5882   02A0
        MVO@    R0,     R3                      ; 5883   0258
        INCR    R3                              ; 5884   000B
        CMPR    R1,     R3                      ; 5885   014B
        BNEQ    L_5880                          ; 5886   022C 0007

        MVII    #$0018, R1                      ; 5888   02B9 0018
        MOVR    R3,     R5                      ; 588A   009D
L_588B:
        MVI@    R4,     R0                      ; 588B   02A0
        MVO@    R0,     R5                      ; 588C   0268
        CMPR    R1,     R5                      ; 588D   014D
        BNEQ    L_588B                          ; 588E   022C 0004

        MVII    #$0120, R4                      ; 5890   02BC 0120
        MVI@    R4,     R0                      ; 5892   02A0
        MVO     R0,     .STIC.BORD              ; 5893   0240 002C
        MVII    #$0030, R5                      ; 5895   02BD 0030
        MVI@    R4,     R0                      ; 5897   02A0
        MVO@    R0,     R5                      ; 5898   0268
        MVI@    R4,     R0                      ; 5899   02A0
        MVO@    R0,     R5                      ; 589A   0268
        MVI@    R4,     R0                      ; 589B   02A0
        CLRR    R0                              ; 589C   01C0
        MVO     R0,     .STIC.CS.0              ; 589D   0240 0028
        MVO     R0,     .STIC.VIDEN             ; 589F   0240 0020
        MVI     G_0102, R0                      ; 58A1   0280 0102
        CMPI    #$000A, R0                      ; 58A3   0378 000A
        BNEQ    L_58AC                          ; 58A5   020C 0005

        CLRR    R0                              ; 58A7   01C0
        MVO     R0,     G_0102                  ; 58A8   0240 0102
        B       L_593A                          ; 58AA   0200 008E
L_58AC:
        ADD     G_0104, R7                      ; 58AC   02C7 0104

        MVI     G_0105, R0                      ; 58AE   0280 0105
        DECR    R0                              ; 58B0   0010
        MVO     R0,     G_0105                  ; 58B1   0240 0105
        BNEQ    L_58D4                          ; 58B3   020C 001F

        MVII    #$0008, R0                      ; 58B5   02B8 0008
        MVO     R0,     G_0105                  ; 58B7   0240 0105

        JSR     R5,     L_6B6E                  ; 58B9   0004 0168 036E

        MOVR    R0,     R1                      ; 58BC   0081
        ANDI    #$0007, R1                      ; 58BD   03B9 0007
        SDBD                                    ; 58BF   0001
        ADDI    #$39E0, R1                      ; 58C0   02F9 00E0 0039

        JSR     R5,     L_6B6E                  ; 58C3   0004 0168 036E

        SWAP    R0,     1                       ; 58C6   0040
        MVI@    R1,     R2                      ; 58C7   028A
        ANDR    R0,     R2                      ; 58C8   0182
        MVO@    R2,     R1                      ; 58C9   024A
        ADDI    #$0008, R1                      ; 58CA   02F9 0008
        MVI@    R1,     R2                      ; 58CC   028A
        ANDR    R0,     R2                      ; 58CD   0182
        MVO@    R2,     R1                      ; 58CE   024A
        ADDI    #$0008, R1                      ; 58CF   02F9 0008
        MVI@    R1,     R2                      ; 58D1   028A
        ANDR    R0,     R2                      ; 58D2   0182
        MVO@    R2,     R1                      ; 58D3   024A
L_58D4:
        MVI     .STIC.X.0,R0                    ; 58D4   0280 0000
        MVI     G_0340, R0                      ; 58D6   0280 0340
        SWAP    R0,     1                       ; 58D8   0040
        ANDI    #$0003, R0                      ; 58D9   03B8 0003

        JSR     R5,     L_6442                  ; 58DB   0004 0164 0042
        JSR     R5,     L_6BBA                  ; 58DE   0004 0168 03BA

        MVI     G_0338, R0                      ; 58E1   0280 0338
        SARC    R0,     1                       ; 58E3   0078
        BNC     L_58EE                          ; 58E4   0209 0008

        MVI     G_0174, R0                      ; 58E6   0280 0174
        DECR    R0                              ; 58E8   0010
        BNEQ    L_58EE                          ; 58E9   020C 0003

        JSR     R5,     L_675E                  ; 58EB   0004 0164 035E

L_58EE:
        MVII    #$0008, R4                      ; 58EE   02BC 0008
        CLRR    R1                              ; 58F0   01C9
        MVII    #$0140, R3                      ; 58F1   02BB 0140
L_58F3:
        MVI@    R3,     R0                      ; 58F3   0298
        DECR    R0                              ; 58F4   0010
        BNEQ    L_5912                          ; 58F5   020C 001B

        MVII    #$0158, R2                      ; 58F7   02BA 0158
        ADDR    R1,     R2                      ; 58F9   00CA
        MVI@    R2,     R0                      ; 58FA   0290
        MVO@    R0,     R3                      ; 58FB   0258
        INCR    R3                              ; 58FC   000B
        MVII    #$0348, R2                      ; 58FD   02BA 0348
        ADDR    R1,     R2                      ; 58FF   00CA
        ADDR    R1,     R2                      ; 5900   00CA
        MVI@    R3,     R0                      ; 5901   0298
        SARC    R0,     1                       ; 5902   0078
        ADCR    R7                              ; 5903   002F

        NEGR    R0                              ; 5904   0020
L_5905:
        ADD@    R2,     R0                      ; 5905   02D0
        MVO@    R0,     R2                      ; 5906   0250
        INCR    R3                              ; 5907   000B
        INCR    R2                              ; 5908   000A
        MVI@    R3,     R0                      ; 5909   0298
        SARC    R0,     1                       ; 590A   0078
        ADCR    R7                              ; 590B   002F

        NEGR    R0                              ; 590C   0020
L_590D:
        ADD@    R2,     R0                      ; 590D   02D0
        MVO@    R0,     R2                      ; 590E   0250
        INCR    R3                              ; 590F   000B
        B       L_5915                          ; 5910   0200 0003

L_5912:
        MVO@    R0,     R3                      ; 5912   0258
        ADDI    #$0003, R3                      ; 5913   02FB 0003
L_5915:
        INCR    R1                              ; 5915   0009
        CMPR    R4,     R1                      ; 5916   0161
        BNEQ    L_58F3                          ; 5917   022C 0025

        MVII    #$0008, R1                      ; 5919   02B9 0008
        MVII    #$0138, R3                      ; 591B   02BB 0138
L_591D:
        MVI@    R3,     R0                      ; 591D   0298
        DECR    R0                              ; 591E   0010
        BMI     L_5922                          ; 591F   020B 0001

        MVO@    R0,     R3                      ; 5921   0258
L_5922:
        INCR    R3                              ; 5922   000B
        DECR    R1                              ; 5923   0011
        BNEQ    L_591D                          ; 5924   022C 0008

        MVII    #$0004, R1                      ; 5926   02B9 0004
        MVII    #$0330, R3                      ; 5928   02BB 0330
L_592A:
        MVI@    R3,     R0                      ; 592A   0298
        TSTR    R0                              ; 592B   0080
        BEQ     L_5930                          ; 592C   0204 0002

        DECR    R0                              ; 592E   0010
        MVO@    R0,     R3                      ; 592F   0258
L_5930:
        INCR    R3                              ; 5930   000B
        DECR    R1                              ; 5931   0011
        BNEQ    L_592A                          ; 5932   022C 0009

        JSR     R5,     L_63FD                  ; 5934   0004 0160 03FD
        JSR     R5,     L_669A                  ; 5937   0004 0164 029A

L_593A:
        CLRR    R0                              ; 593A   01C0
        MVO     R0,     .STIC.VIDEN             ; 593B   0240 0020
        INCR    R0                              ; 593D   0008
        MVO     R0,     G_0103                  ; 593E   0240 0103
        MVI     .PSG0.rgt_hand,R0               ; 5940   0280 01FE
        CMPI    #$009A, R0                      ; 5942   0378 009A
        B       L_5948                          ; 5944   0200 0002

        DECLE   $02BF,  $0000                   ; 5946   02BF 0000
L_5948:
        MVI     .STIC.X.0,R0                    ; 5948   0280 0000
        PULR    R7                              ; 594A   02B7

        DECLE   $003A,  $0059,  $0048,  $0059   ; 594B   003A 0059 0048 0059
        DECLE   $0016,  $0058,  $0021,  $0058   ; 594F   0016 0058 0021 0058
        DECLE   $002C,  $0058,  $006E,  $0058   ; 5953   002C 0058 006E 0058
        DECLE   $0059,  $0058,  $0037           ; 5957   0059 0058 0037

        SLLC    R1,     1                       ; 595A   0059
        ADDR    R7,     R0                      ; 595B   00F8
        RLC     R3,     2                       ; 595C   0057
        SETC                                    ; 595D   0007
        SLLC    R0,     1                       ; 595E   0058
        SAR     R2,     2                       ; 595F   006E
        SLLC    R0,     1                       ; 5960   0058
L_5961:
        MVI@    R5,     R0                      ; 5961   02A8
        MVO     R0,     G_0102                  ; 5962   0240 0102
L_5964:
        MVI     G_0102, R0                      ; 5964   0280 0102
        TSTR    R0                              ; 5966   0080
        BNEQ    L_5964                          ; 5967   022C 0004
        MOVR    R5,     R7                      ; 5969   00AF

        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 596A   00C0 00C0 00C0 00C0
        DECLE   $00C0,  $00C0,  $00FF,  $00FF   ; 596E   00C0 00C0 00FF 00FF
        DECLE   $0003,  $0003,  $0003,  $0003   ; 5972   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $00FF,  $00FF   ; 5976   0003 0003 00FF 00FF
        DECLE   $0081,  $0018,  $007E,  $00FF   ; 597A   0081 0018 007E 00FF
        DECLE   $00FF,  $0042,  $0024,  $0018   ; 597E   00FF 0042 0024 0018
        DECLE   $003C,  $005A,  $00A5,  $00FF   ; 5982   003C 005A 00A5 00FF
        DECLE   $0099,  $005A,  $0024,  $0018   ; 5986   0099 005A 0024 0018
        DECLE   $0019,  $0010,  $007E,  $00FF   ; 598A   0019 0010 007E 00FF
        DECLE   $00FF,  $00FF,  $007E,  $003C   ; 598E   00FF 00FF 007E 003C
        DECLE   $003F,  $0042,  $00FC,  $00C2   ; 5992   003F 0042 00FC 00C2
        DECLE   $00FF,  $00E5,  $0061,  $003F   ; 5996   00FF 00E5 0061 003F
        DECLE   $003C,  $007E,  $00DB,  $00FF   ; 599A   003C 007E 00DB 00FF
        DECLE   $00BD,  $00C3,  $007E,  $003C   ; 599E   00BD 00C3 007E 003C
        DECLE   $0000,  $0008,  $0004,  $000E   ; 59A2   0000 0008 0004 000E
        DECLE   $0004,  $0008,  $0000,  $0000   ; 59A6   0004 0008 0000 0000
        DECLE   $0000,  $0010,  $0038,  $0054   ; 59AA   0000 0010 0038 0054
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59AE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0078   ; 59B2   0000 0000 0000 0078
        DECLE   $0018,  $0008,  $0008,  $0000   ; 59B6   0018 0008 0008 0000
        DECLE   $0000,  $0004,  $0082,  $007F   ; 59BA   0000 0004 0082 007F
        DECLE   $0082,  $0004,  $0000,  $0000   ; 59BE   0082 0004 0000 0000
        DECLE   $0010,  $0038,  $0054,  $0010   ; 59C2   0010 0038 0054 0010
        DECLE   $0010,  $0010,  $0010,  $0028   ; 59C6   0010 0010 0010 0028
        DECLE   $0007,  $0003,  $0005           ; 59CA   0007 0003 0005
L_59CD:
        INCR    R0                              ; 59CD   0008
        DECR    R0                              ; 59CE   0010
        MOVR    R4,     R0                      ; 59CF   00A0
        SWAP    R0,     1                       ; 59D0   0040
        MOVR    R4,     R0                      ; 59D1   00A0
        RSWD    R4                              ; 59D2   003C
        SARC    R2,     2                       ; 59D3   007E
        ADDR    R3,     R3                      ; 59D4   00DB
        ADDR    R4,     R7                      ; 59D5   00E7

        SARC    R2,     2                       ; 59D6   007E
        RSWD    R4                              ; 59D7   003C
        SWAP    R2,     1                       ; 59D8   0042
        MOVR    R0,     R1                      ; 59D9   0081
        RSWD    R4                              ; 59DA   003C
        SARC    R2,     2                       ; 59DB   007E
        MOVR    R7,     R5                      ; 59DC   00BD
        ADDR    R4,     R7                      ; 59DD   00E7

        SARC    R2,     2                       ; 59DE   007E
        SLLC    R2,     1                       ; 59DF   005A
        NEGR    R4                              ; 59E0   0024
        COMR    R0                              ; 59E1   0018
        RSWD    R4                              ; 59E2   003C
        SARC    R2,     2                       ; 59E3   007E
        ADDR    R3,     R3                      ; 59E4   00DB
        ADDR    R4,     R7                      ; 59E5   00E7

        DECLE   $007E,  $005A,  $0042,  $0042   ; 59E6   007E 005A 0042 0042
        DECLE   $0070,  $00A8,  $00F8,  $0088   ; 59EA   0070 00A8 00F8 0088
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59EE   0000 0000 0000 0000
        DECLE   $0070,  $00A8,  $0070,  $0050   ; 59F2   0070 00A8 0070 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59F6   0000 0000 0000 0000
        DECLE   $0004,  $006A,  $0071,  $0002   ; 59FA   0004 006A 0071 0002
        DECLE   $003C,  $0041,  $0082,  $007C   ; 59FE   003C 0041 0082 007C
        DECLE   $0066,  $0079,  $0001,  $001E   ; 5A02   0066 0079 0001 001E
        DECLE   $0020,  $0040,  $009E,  $0061   ; 5A06   0020 0040 009E 0061
        DECLE   $00FF,  $00FF,  $0003,  $0003   ; 5A0A   00FF 00FF 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; 5A0E   0003 0003 0003 0003
        DECLE   $0018,  $00BD,  $00A5,  $00FF   ; 5A12   0018 00BD 00A5 00FF
        DECLE   $003C,  $0024,  $0024,  $0066   ; 5A16   003C 0024 0024 0066
        DECLE   $0000,  $0000                   ; 5A1A   0000 0000

        COMR    R0                              ; 5A1C   0018
        RSWD    R4                              ; 5A1D   003C
        ADDR    R4,     R7                      ; 5A1E   00E7

        DECLE   $00BD,  $0024,  $0066,  $00FF   ; 5A1F   00BD 0024 0066 00FF
        DECLE   $00FF,  $00C0,  $00C0,  $00C0   ; 5A23   00FF 00C0 00C0 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $0038   ; 5A27   00C0 00C0 00C0 0038
        DECLE   $0054,  $0068,  $0033,  $007C   ; 5A2B   0054 0068 0033 007C
        DECLE   $00B8,  $004E,  $0060,  $001C   ; 5A2F   00B8 004E 0060 001C
        DECLE   $002A,  $0016,  $004C,  $003F   ; 5A33   002A 0016 004C 003F
        DECLE   $001C,  $0072,  $0006,  $0028   ; 5A37   001C 0072 0006 0028
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5A3B   0010 0010 0010 0010
        DECLE   $0036,  $00BD,  $00F7,  $0099   ; 5A3F   0036 00BD 00F7 0099
        DECLE   $00DB,  $00FF,  $00AB,  $00FF   ; 5A43   00DB 00FF 00AB 00FF
        DECLE   $0000,  $0000,  $0000,  $0099   ; 5A47   0000 0000 0000 0099
        DECLE   $00DB,  $007E,  $0024,  $002C   ; 5A4B   00DB 007E 0024 002C
        DECLE   $0024,  $0066,  $00FF,  $003C   ; 5A4F   0024 0066 00FF 003C
        DECLE   $0030,  $007E,  $00D5,  $00FF   ; 5A53   0030 007E 00D5 00FF
        DECLE   $007E,  $003C,  $0000,  $001D   ; 5A57   007E 003C 0000 001D
        DECLE   $000A,  $00FC,  $0018,  $003C   ; 5A5B   000A 00FC 0018 003C
        DECLE   $00FF,  $0024,  $006C,  $0024   ; 5A5F   00FF 0024 006C 0024
        DECLE   $00BC,  $00D4,  $007F,  $003C   ; 5A63   00BC 00D4 007F 003C
        DECLE   $007E,  $0043,  $00C0,  $0024   ; 5A67   007E 0043 00C0 0024
        DECLE   $003D,  $002B,  $00FE,  $003C   ; 5A6B   003D 002B 00FE 003C
        DECLE   $007E,  $00C2,  $0003,  $0028   ; 5A6F   007E 00C2 0003 0028
        DECLE   $0010,  $0010,  $0094,  $00BA   ; 5A73   0010 0010 0094 00BA
        DECLE   $00FF,  $00FA,  $0077,  $0042   ; 5A77   00FF 00FA 0077 0042
        DECLE   $00A5,  $0042,  $00A4,  $00FF   ; 5A7B   00A5 0042 00A4 00FF
        DECLE   $003D,  $0024,  $0066,  $0018   ; 5A7F   003D 0024 0066 0018
        DECLE   $0024,  $0018,  $0025,  $00FF   ; 5A83   0024 0018 0025 00FF

        MOVR    R7,     R4                      ; 5A87   00BC
        NEGR    R4                              ; 5A88   0024
        SLR     R2,     2                       ; 5A89   0066
        ADCR    R0                              ; 5A8A   0028
        DECR    R0                              ; 5A8B   0010
        DECR    R0                              ; 5A8C   0010
        ADDR    R2,     R4                      ; 5A8D   00D4
        MOVR    R3,     R2                      ; 5A8E   009A
        ADDR    R6,     R6                      ; 5A8F   00F6
        ADDR    R7,     R5                      ; 5A90   00FD
        RRC     R2,     1                       ; 5A91   0072
        INCR    R1                              ; 5A92   0009
        ADDR    R5,     R6                      ; 5A93   00EE
        RRC     R3,     2                       ; 5A94   0077
        COMR    R6                              ; 5A95   001E
        MOVR    R7,     R6                      ; 5A96   00BE
        ADDR    R6,     R4                      ; 5A97   00F4
        NEGR    R2                              ; 5A98   0022
        GSWD    R3                              ; 5A99   0033
        INCR    R7                              ; 5A9A   000F

        SETC                                    ; 5A9B   0007
L_5A9C:
        SARC    R2,     2                       ; 5A9C   007E
        DECLE   $00FE,  $00F4,  $00A2,  $00B3   ; 5A9D   00FE 00F4 00A2 00B3
        DECLE   $0000                           ; 5AA1   0000

        ADCR    R0                              ; 5AA2   0028
        DECR    R0                              ; 5AA3   0010
L_5AA4:
        DECR    R3                              ; 5AA4   0013
L_5AA5:
        DECR    R7                              ; 5AA5   0017

        RSWD    R5                              ; 5AA6   003D
        ADDR    R7,     R6                      ; 5AA7   00FE
        MOVR    R6,     R2                      ; 5AA8   00B2
        TSTR    R3                              ; 5AA9   009B
        MOVR    R0,     R1                      ; 5AAA   0081
        SWAP    R2,     1                       ; 5AAB   0042
        NEGR    R4                              ; 5AAC   0024
        SLLC    R2,     1                       ; 5AAD   005A
        MOVR    R7,     R5                      ; 5AAE   00BD
        SLLC    R2,     1                       ; 5AAF   005A
        MOVR    R4,     R5                      ; 5AB0   00A5
        COMR    R0                              ; 5AB1   0018
        SWAP    R2,     1                       ; 5AB2   0042
        NEGR    R4                              ; 5AB3   0024
        NEGR    R4                              ; 5AB4   0024
        ADDR    R3,     R3                      ; 5AB5   00DB
        RSWD    R4                              ; 5AB6   003C
        ADDR    R3,     R3                      ; 5AB7   00DB
        NEGR    R4                              ; 5AB8   0024
        NEGR    R4                              ; 5AB9   0024
        ADCR    R0                              ; 5ABA   0028
        DECR    R0                              ; 5ABB   0010
        DECR    R0                              ; 5ABC   0010
        RLC     R2,     1                       ; 5ABD   0052
        MOVR    R6,     R5                      ; 5ABE   00B5
        RSWD    R4                              ; 5ABF   003C
        SARC    R2,     2                       ; 5AC0   007E
L_5AC1:
        MOVR    R4,     R5                      ; 5AC1   00A5
        ADDR    R5,     R6                      ; 5AC2   00EE
        MOVR    R7,     R2                      ; 5AC3   00BA
        RLC     R0,     2                       ; 5AC4   0054
        SARC    R0,     2                       ; 5AC5   007C
L_5AC6:
        ADCR    R0                              ; 5AC6   0028
        DECLE   $0010,  $0000,  $0000,  $0040   ; 5AC7   0010 0000 0000 0040
        DECLE   $0080,  $0099,  $007F,  $003C   ; 5ACB   0080 0099 007F 003C
        DECLE   $0018,  $007E,  $0000,  $0000   ; 5ACF   0018 007E 0000 0000
        DECLE   $0000,  $0000                   ; 5AD3   0000 0000

        SETC                                    ; 5AD5   0007
        ADDR    R7,     R5                      ; 5AD6   00FD
        MOVR    R4,     R7                      ; 5AD7   00A7

        DECLE   $0000,  $0000                   ; 5AD8   0000 0000

        SLLC    R2,     1                       ; 5ADA   005A
        MOVR    R3,     R1                      ; 5ADB   0099
        MOVR    R7,     R5                      ; 5ADC   00BD
        SARC    R2,     2                       ; 5ADD   007E
        RSWD    R4                              ; 5ADE   003C
        COMR    R0                              ; 5ADF   0018
        RSWD    R4                              ; 5AE0   003C
        SARC    R2,     2                       ; 5AE1   007E
        RSWD    R4                              ; 5AE2   003C
        SWAP    R2,     1                       ; 5AE3   0042
        MOVR    R1,     R5                      ; 5AE4   008D
        SWAP    R2,     1                       ; 5AE5   0042
        NEGR    R5                              ; 5AE6   0025
        ADDR    R3,     R3                      ; 5AE7   00DB
        MOVR    R3,     R0                      ; 5AE8   0098
        SLR     R2,     2                       ; 5AE9   0066
        RSWD    R4                              ; 5AEA   003C
        SWAP    R2,     1                       ; 5AEB   0042
        MOVR    R6,     R1                      ; 5AEC   00B1
        SWAP    R2,     1                       ; 5AED   0042
        TSTR    R4                              ; 5AEE   00A4
        ADDR    R3,     R3                      ; 5AEF   00DB
        COMR    R1                              ; 5AF0   0019
        SLR     R2,     2                       ; 5AF1   0066
        ADCR    R0                              ; 5AF2   0028
        DECR    R0                              ; 5AF3   0010
        DECR    R0                              ; 5AF4   0010
        SARC    R0,     2                       ; 5AF5   007C
        TSTR    R2                              ; 5AF6   0092
        SWAP    R0,     2                       ; 5AF7   0044
        MOVR    R7,     R2                      ; 5AF8   00BA
        ADDR    R5,     R6                      ; 5AF9   00EE
        MOVR    R3,     R1                      ; 5AFA   0099
        MOVR    R7,     R5                      ; 5AFB   00BD
        ADDR    R2,     R7                      ; 5AFC   00D7

        DECLE   $007C,  $0038,  $0038,  $001A   ; 5AFD   007C 0038 0038 001A
        DECLE   $000E,  $0018,  $00BD,  $00A9   ; 5B01   000E 0018 00BD 00A9
        DECLE   $00FF                           ; 5B05   00FF

        COMR    R4                              ; 5B06   001C
        COMR    R4                              ; 5B07   001C
        SLLC    R0,     1                       ; 5B08   0058
        RRC     R0,     1                       ; 5B09   0070
        ADCR    R0                              ; 5B0A   0028
        DECR    R0                              ; 5B0B   0010
        DECR    R0                              ; 5B0C   0010
        COMR    R4                              ; 5B0D   001C
        ADCR    R3                              ; 5B0E   002B
        MOVR    R7,     R5                      ; 5B0F   00BD
        ADDR    R7,     R1                      ; 5B10   00F9
        ADDR    R6,     R3                      ; 5B11   00F3
        RLC     R1,     2                       ; 5B12   0055
        ADDR    R7,     R2                      ; 5B13   00FA
        RRC     R2,     1                       ; 5B14   0072
        NEGR    R6                              ; 5B15   0026
        ADDR    R7,     R2                      ; 5B16   00FA
        RRC     R2,     1                       ; 5B17   0072
        SLLC    R0,     1                       ; 5B18   0058
        ADDR    R0,     R0                      ; 5B19   00C0
        RLC     R0,     1                       ; 5B1A   0050
        ADDR    R7,     R0                      ; 5B1B   00F8
        RRC     R1,     2                       ; 5B1C   0075
        NEGR    R2                              ; 5B1D   0022
        ADDR    R7,     R2                      ; 5B1E   00FA
        RRC     R2,     2                       ; 5B1F   0076
        ADDR    R2,     R2                      ; 5B20   00D2
        COMR    R2                              ; 5B21   001A
        ADCR    R0                              ; 5B22   0028
        DECR    R0                              ; 5B23   0010
        DECR    R0                              ; 5B24   0010
        ADDR    R2,     R2                      ; 5B25   00D2
        MOVR    R2,     R7                      ; 5B26   0097

        DECLE   $00BE,  $00F7,  $0072,  $0042   ; 5B27   00BE 00F7 0072 0042
        DECLE   $00C3,  $00A5,  $007E,  $003C   ; 5B2B   00C3 00A5 007E 003C
        DECLE   $0018,  $0000,  $0000,  $0000   ; 5B2F   0018 0000 0000 0000
        DECLE   $0024,  $003C,  $007E,  $00DB   ; 5B33   0024 003C 007E 00DB
        DECLE   $0081,  $00C3,  $0042,  $0028   ; 5B37   0081 00C3 0042 0028
        DECLE   $0010,  $0010,  $0010,  $00D3   ; 5B3B   0010 0010 0010 00D3
        DECLE   $0099,  $00FF,  $00A5,  $00E0   ; 5B3F   0099 00FF 00A5 00E0
        DECLE   $00E0,  $00E0,  $0000,  $0000   ; 5B43   00E0 00E0 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 5B47   0000 0000 0000

        DECR    R4                              ; 5B4A   0014
        INCR    R0                              ; 5B4B   0008
        INCR    R0                              ; 5B4C   0008
        INCR    R0                              ; 5B4D   0008
        INCR    R6                              ; 5B4E   000E
        DECR    R1                              ; 5B4F   0011
        ADDR    R2,     R5                      ; 5B50   00D5
        ADDR    R4,     R7                      ; 5B51   00E7

        DECLE   $0028,  $0010,  $0010,  $0018   ; 5B52   0028 0010 0010 0018
        DECLE   $0024,  $00FF,  $00A5,  $0066   ; 5B56   0024 00FF 00A5 0066
        DECLE   $0001,  $002A,  $0020,  $005A   ; 5B5A   0001 002A 0020 005A
        DECLE   $0006,  $00DE,  $0020,  $0042   ; 5B5E   0006 00DE 0020 0042
        DECLE   $0006,  $003E,  $0011,  $00E2   ; 5B62   0006 003E 0011 00E2
        DECLE   $0005,  $004D,  $0011,  $00EA   ; 5B66   0005 004D 0011 00EA
        DECLE   $0005                           ; 5B6A   0005

        RLC     R2,     2                       ; 5B6B   0056
        EIS                                     ; 5B6C   0002
        ADDR    R7,     R2                      ; 5B6D   00FA
        EIS                                     ; 5B6E   0002
        SLLC    R1,     2                       ; 5B6F   005D
        EIS                                     ; 5B70   0002
        ADDR    R7,     R2                      ; 5B71   00FA
        EIS                                     ; 5B72   0002
        MOVR    R7,     R2                      ; 5B73   00BA
        EIS                                     ; 5B74   0002
        ADDR    R7,     R2                      ; 5B75   00FA
        EIS                                     ; 5B76   0002
        ADDR    R0,     R1                      ; 5B77   00C1
        EIS                                     ; 5B78   0002
        ADDR    R7,     R2                      ; 5B79   00FA
        EIS                                     ; 5B7A   0002
        SAR     R0,     2                       ; 5B7B   006C
        INCR    R0                              ; 5B7C   0008
        MOVR    R1,     R2                      ; 5B7D   008A
        CLRC                                    ; 5B7E   0006
        MOVR    R5,     R0                      ; 5B7F   00A8
        INCR    R0                              ; 5B80   0008
        MOVR    R0,     R2                      ; 5B81   0082
        CLRC                                    ; 5B82   0006
        SAR     R0,     1                       ; 5B83   0068
        CLRC                                    ; 5B84   0006
        MOVR    R0,     R2                      ; 5B85   0082
        CLRC                                    ; 5B86   0006
        RRC     R1,     1                       ; 5B87   0071
        CLRC                                    ; 5B88   0006
        MOVR    R0,     R2                      ; 5B89   0082
        CLRC                                    ; 5B8A   0006
        TSTR    R4                              ; 5B8B   00A4
        CLRC                                    ; 5B8C   0006
        MOVR    R1,     R2                      ; 5B8D   008A
        CLRC                                    ; 5B8E   0006
        TSTR    R5                              ; 5B8F   00AD
        CLRC                                    ; 5B90   0006
        MOVR    R1,     R2                      ; 5B91   008A
        CLRC                                    ; 5B92   0006
        MOVR    R1,     R6                      ; 5B93   008E
        EIS                                     ; 5B94   0002
        ADDR    R4,     R7                      ; 5B95   00E7

        DECLE   $0005                           ; 5B96   0005

        MOVR    R3,     R5                      ; 5B97   009D
        EIS                                     ; 5B98   0002
        ADDR    R5,     R7                      ; 5B99   00EF

        DECLE   $0005,  $00BB,  $0002,  $0032   ; 5B9A   0005 00BB 0002 0032
        DECLE   $0006,  $00C0,  $0002,  $003A   ; 5B9E   0006 00C0 0002 003A
        DECLE   $0006,  $0057,  $0002,  $0022   ; 5BA2   0006 0057 0002 0022
        DECLE   $0006,  $005C,  $0002,  $002A   ; 5BA6   0006 005C 0002 002A
        DECLE   $0006,  $0000,  $0001,  $0016   ; 5BAA   0006 0000 0001 0016
        DECLE   $0016,  $0042,  $0006,  $001A   ; 5BAE   0016 0042 0006 001A
        DECLE   $0002,  $0047,  $0006,  $0021   ; 5BB2   0002 0047 0006 0021
        DECLE   $0002,  $00A2,  $0008,  $0035   ; 5BB6   0002 00A2 0008 0035
        DECLE   $0003,  $00EA,  $0005,  $0044   ; 5BBA   0003 00EA 0005 0044
        DECLE   $000C,  $0042,  $0006,  $0043   ; 5BBE   000C 0042 0006 0043
        DECLE   $0009,  $00EA,  $0005,  $0080   ; 5BC2   0009 00EA 0005 0080
        DECLE   $0016,  $005A,  $0006,  $009E   ; 5BC6   0016 005A 0006 009E
        DECLE   $0005,  $00EA,  $0005           ; 5BCA   0005 00EA 0005

        ADDR    R0,     R6                      ; 5BCD   00C6
        DIS                                     ; 5BCE   0003
        ADDR    R5,     R7                      ; 5BCF   00EF

        DECLE   $0005,  $00DA,  $0002,  $000A   ; 5BD0   0005 00DA 0002 000A
        DECLE   $0008,  $00CA,  $0020,  $005A   ; 5BD4   0008 00CA 0020 005A
        DECLE   $0006,  $0015,  $0015,  $00EA   ; 5BD8   0006 0015 0015 00EA
        DECLE   $0005,  $0000,  $0001           ; 5BDC   0005 0000 0001

        COMR    R2                              ; 5BDF   001A
        EIS                                     ; 5BE0   0002
        MOVR    R7,     R2                      ; 5BE1   00BA
        INCR    R0                              ; 5BE2   0008
        COMR    R3                              ; 5BE3   001B
        DECR    R6                              ; 5BE4   0016
        SWAP    R2,     1                       ; 5BE5   0042
        CLRC                                    ; 5BE6   0006
        NEGR    R6                              ; 5BE7   0026
        EIS                                     ; 5BE8   0002
        MOVR    R4,     R2                      ; 5BE9   00A2
        INCR    R0                              ; 5BEA   0008
        RSWD    R2                              ; 5BEB   003A
        DIS                                     ; 5BEC   0003
        ADDR    R5,     R7                      ; 5BED   00EF

        DECLE   $0005,  $004E,  $0011,  $00EA   ; 5BEE   0005 004E 0011 00EA
        DECLE   $0005,  $00DE,  $0022,  $0042   ; 5BF2   0005 00DE 0022 0042
        DECLE   $0006,  $00A2,  $0007,  $00E2   ; 5BF6   0006 00A2 0007 00E2
        DECLE   $0005                           ; 5BFA   0005

        MOVR    R1,     R6                      ; 5BFB   008E
        EIS                                     ; 5BFC   0002
        MOVR    R7,     R2                      ; 5BFD   00BA
        INCR    R0                              ; 5BFE   0008
        MOVR    R1,     R7                      ; 5BFF   008F

        DECLE   $0014,  $0042,  $0006,  $0070   ; 5C00   0014 0042 0006 0070
        DECLE   $0005,  $00EA,  $0005,  $005C   ; 5C04   0005 00EA 0005 005C
        DECLE   $0002,  $00A2,  $0008,  $0056   ; 5C08   0002 00A2 0008 0056
        DECLE   $000C,  $0042,  $0006,  $0058   ; 5C0C   000C 0042 0006 0058
        DECLE   $0002,  $0047,  $0006,  $0044   ; 5C10   0002 0047 0006 0044
        DECLE   $0002,  $0007,  $0000,  $002E   ; 5C14   0002 0007 0000 002E
        DECLE   $0005,  $00E2,  $0005,  $0000   ; 5C18   0005 00E2 0005 0000
        DECLE   $0001                           ; 5C1C   0001
L_5C1D:
        DECR    R7                              ; 5C1D   0017

        DECLE   $0002,  $00BA,  $0008,  $0018   ; 5C1E   0002 00BA 0008 0018
        DECLE   $001C,  $0042,  $0006,  $0026   ; 5C22   001C 0042 0006 0026
        DECLE   $0002,  $00A2,  $0008,  $003A   ; 5C26   0002 00A2 0008 003A
        DECLE   $0013,  $00EA,  $0005           ; 5C2A   0013 00EA 0005

        SLL     R2,     2                       ; 5C2D   004E
        DIS                                     ; 5C2E   0003
        ADDR    R5,     R7                      ; 5C2F   00EF

        DECLE   $0005,  $00E9,  $000C,  $0042   ; 5C30   0005 00E9 000C 0042
        DECLE   $0006,  $0071,  $000D,  $00E2   ; 5C34   0006 0071 000D 00E2
        DECLE   $0005,  $0067,  $0014,  $0042   ; 5C38   0005 0067 0014 0042
        DECLE   $0006,  $002B,  $0007,  $00E2   ; 5C3C   0006 002B 0007 00E2
        DECLE   $0005,  $003F                   ; 5C40   0005 003F

        DIS                                     ; 5C42   0003
        ADDR    R4,     R7                      ; 5C43   00E7

        DECLE   $0005,  $0000,  $0000,  $00EA   ; 5C44   0005 0000 0000 00EA
        DECLE   $0005,  $0215,  $0233,  $023D   ; 5C48   0005 0215 0233 023D
        DECLE   $024B,  $028A,  $029E,  $02B2   ; 5C4C   024B 028A 029E 02B2
        DECLE   $02C6,  $02CE,  $02DA,  $0000   ; 5C50   02C6 02CE 02DA 0000
        DECLE   $00EF,  $0005,  $021F,  $0229   ; 5C54   00EF 0005 021F 0229
        DECLE   $0276,  $02BA,  $0000,  $0042   ; 5C58   0276 02BA 0000 0042
        DECLE   $0006,  $0216,  $0217,  $0218   ; 5C5C   0006 0216 0217 0218
        DECLE   $0219,  $0220,  $0221,  $0222   ; 5C60   0219 0220 0221 0222
        DECLE   $0223,  $0224                   ; 5C64   0223 0224

        BLT     L_59CD                          ; 5C66   0225 029A

        MVI@    R3,     R4                      ; 5C68   029C
        MVI@    R4,     R4                      ; 5C69   02A4
        MVI@    R4,     R5                      ; 5C6A   02A5
        ADD@    R3,     R6                      ; 5C6B   02DE
        ADD@    R3,     R7                      ; 5C6C   02DF

        DECLE   $02E0,  $02E1,  $02E2,  $02E9   ; 5C6D   02E0 02E1 02E2 02E9
        DECLE   $02EA,  $02EB,  $02EC,  $02ED   ; 5C71   02EA 02EB 02EC 02ED
        DECLE   $02EE,  $0000,  $0047,  $0006   ; 5C75   02EE 0000 0047 0006
        DECLE   $029B,  $0000,  $00E2,  $0005   ; 5C79   029B 0000 00E2 0005
        DECLE   $021A,  $0226,  $0242,  $024E   ; 5C7D   021A 0226 0242 024E
        DECLE   $0272,  $027A,  $0286,  $028E   ; 5C81   0272 027A 0286 028E
        DECLE   $0290,  $029D,  $02A2,  $02B1   ; 5C85   0290 029D 02A2 02B1
        DECLE   $02B6,  $02C1,  $02CA,  $02D5   ; 5C89   02B6 02C1 02CA 02D5
        DECLE   $0000,  $00E7,  $0005,  $022E   ; 5C8D   0000 00E7 0005 022E
        DECLE   $023A,  $0000,  $005A,  $0006   ; 5C91   023A 0000 005A 0006
        DECLE   $0234,  $0235,  $0236,  $0237   ; 5C95   0234 0235 0236 0237
        DECLE   $023E,  $023F,  $0240,  $0241   ; 5C99   023E 023F 0240 0241
        DECLE   $024C,  $024D,  $025E,  $025F   ; 5C9D   024C 024D 025E 025F
        DECLE   $0260,  $0261,  $0262,  $0266   ; 5CA1   0260 0261 0262 0266
        DECLE   $0268,  $0269,  $026A,  $027C   ; 5CA5   0268 0269 026A 027C
        DECLE   $027D                           ; 5CA9   027D

        MVI@    R5,     R5                      ; 5CAA   02AD
        MVI@    R5,     R6                      ; 5CAB   02AE
        MVI@    R5,     R7                      ; 5CAC   02AF

        DECLE   $02B0,  $0000,  $005F,  $0006   ; 5CAD   02B0 0000 005F 0006
        DECLE   $0267,  $0000,  $0007,  $0000   ; 5CB1   0267 0000 0007 0000
        DECLE   $0277,  $02BB,  $0000,  $000A   ; 5CB5   0277 02BB 0000 000A
        DECLE   $0008,  $027E,  $0000,  $00A2   ; 5CB9   0008 027E 0000 00A2
        DECLE   $0008,  $02A6,  $0000,  $00FA   ; 5CBD   0008 02A6 0000 00FA
        DECLE   $0002,  $021D,  $0231,  $0258   ; 5CC1   0002 021D 0231 0258
        DECLE   $0259,  $025A,  $025B,  $025C   ; 5CC5   0259 025A 025B 025C
        DECLE   $0295,  $02A9,  $02BD,  $02D1   ; 5CC9   0295 02A9 02BD 02D1
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CCD   0000 0000 0000 0000
        DECLE   $00E9,  $0005,  $0218,  $021D   ; 5CD1   00E9 0005 0218 021D
        DECLE   $0229,  $023A,  $023E,  $0248   ; 5CD5   0229 023A 023E 0248
        DECLE   $024D,  $0252,  $0261,  $0280   ; 5CD9   024D 0252 0261 0280
        DECLE   $02D0,  $0000,  $00EF,  $0005   ; 5CDD   02D0 0000 00EF 0005
        DECLE   $0215,  $02B1,  $0000,  $0041   ; 5CE1   0215 02B1 0000 0041
        DECLE   $0006,  $0216,  $0219,  $021E   ; 5CE5   0006 0216 0219 021E

        BPL     L_5AC6                          ; 5CE9   0223 0224
        BLT     L_5AC1                          ; 5CEB   0225 022B
        BNEQ    L_5AA4                          ; 5CED   022C 024A

        MVO@    R6,     R1                      ; 5CEF   024E
        MVO@    R0,     R3                      ; 5CF0   0258
        MVO@    R1,     R3                      ; 5CF1   0259
        MVO@    R3,     R3                      ; 5CF2   025B
        MVO@    R4,     R3                      ; 5CF3   025C
        PSHR    R3                              ; 5CF4   0273
        PSHR    R5                              ; 5CF5   0275
        MVI     .BTAB.82,R1                     ; 5CF6   0281 0282
        MVI     .BTAB.93,R3                     ; 5CF8   0283 0293
        MVI@    R2,     R4                      ; 5CFA   0294
        MVI@    R3,     R0                      ; 5CFB   0298
        MVI@    R3,     R1                      ; 5CFC   0299
        PULR    R7                              ; 5CFD   02B7

        DECLE   $02B8,  $02B9,  $02C3,  $02C4   ; 5CFE   02B8 02B9 02C3 02C4
        DECLE   $02C5,  $0000,  $0047,  $0006   ; 5D02   02C5 0000 0047 0006
        DECLE   $025A,  $0274,  $0000,  $00E1   ; 5D06   025A 0274 0000 00E1
        DECLE   $0005,  $0217,  $021F,  $022E   ; 5D0A   0005 0217 021F 022E
        DECLE   $0236,  $0241,  $0244,  $024B   ; 5D0E   0236 0241 0244 024B
        DECLE   $0255,  $025F,  $0284,  $02D4   ; 5D12   0255 025F 0284 02D4
        DECLE   $0000,  $00E7,  $0005,  $021A   ; 5D16   0000 00E7 0005 021A
        DECLE   $02A3,  $0000,  $0059,  $0006   ; 5D1A   02A3 0000 0059 0006
        DECLE   $022A,  $022D,  $0230,  $0234   ; 5D1E   022A 022D 0230 0234

        MVO@    R3,     R2                      ; 5D22   0253
        MVO@    R4,     R2                      ; 5D23   0254
        MVI@    R1,     R7                      ; 5D24   028F

        DECLE   $0290,  $0291,  $029B,  $029C   ; 5D25   0290 0291 029B 029C
        DECLE   $029D,  $02BB,  $02BC,  $02C0   ; 5D29   029D 02BB 02BC 02C0
        DECLE   $02C1,  $02D1,  $02D2,  $02D3   ; 5D2D   02C1 02D1 02D2 02D3
        DECLE   $0000,  $0001,  $0008,  $02BA   ; 5D31   0000 0001 0008 02BA
        DECLE   $0000,  $0009,  $0008,  $02C2   ; 5D35   0000 0009 0008 02C2
        DECLE   $0000,  $00A1,  $0008,  $0226   ; 5D39   0000 00A1 0008 0226
        DECLE   $0233,  $029A,  $0000,  $00B9   ; 5D3D   0233 029A 0000 00B9
        DECLE   $0008,  $0222,  $0231,  $0292   ; 5D41   0008 0222 0231 0292
        DECLE   $0000,  $0007,  $0000,  $02A2   ; 5D45   0000 0007 0000 02A2
        DECLE   $02B2,  $0000,  $0000,  $0000   ; 5D49   02B2 0000 0000 0000
        DECLE   $0001,  $0016,  $0022,  $0059   ; 5D4D   0001 0016 0022 0059
        DECLE   $0006,  $003A,  $0009,  $00E9   ; 5D51   0006 003A 0009 00E9
        DECLE   $0005,  $008A,  $0002,  $0009   ; 5D55   0005 008A 0002 0009
        DECLE   $0008,  $0086,  $0008,  $0059   ; 5D59   0008 0086 0008 0059
        DECLE   $0006,  $009A,  $0009,  $00E1   ; 5D5D   0006 009A 0009 00E1
        DECLE   $0005,  $00CF,  $000E,  $0059   ; 5D61   0005 00CF 000E 0059
        DECLE   $0006,  $00D2,  $0002,  $005F   ; 5D65   0006 00D2 0002 005F
        DECLE   $0006,  $0092,  $0009,  $00E9   ; 5D69   0006 0092 0009 00E9
        DECLE   $0005,  $007B,  $0008,  $0059   ; 5D6D   0005 007B 0008 0059
        DECLE   $0006,  $007A,  $0002,  $0001   ; 5D71   0006 007A 0002 0001
        DECLE   $0008,  $002A,  $0009,  $00E1   ; 5D75   0008 002A 0009 00E1
        DECLE   $0005,  $002C,  $0005,  $00E6   ; 5D79   0005 002C 0005 00E6
        DECLE   $0005                           ; 5D7D   0005

        RLC     R0,     2                       ; 5D7E   0054
        COMR    R2                              ; 5D7F   001A
        ADDR    R7,     R6                      ; 5D80   00FE
        EIS                                     ; 5D81   0002
        SAR     R2,     2                       ; 5D82   006E
        SETC                                    ; 5D83   0007
        ADDR    R7,     R6                      ; 5D84   00FE
        EIS                                     ; 5D85   0002
        MOVR    R2,     R7                      ; 5D86   0097

        DECLE   $0006,  $005E,  $0006,  $0000   ; 5D87   0006 005E 0006 0000
        DECLE   $0001,  $001D,  $0006,  $0041   ; 5D8B   0001 001D 0006 0041
        DECLE   $0006,  $0020,  $0007,  $00E1   ; 5D8F   0006 0020 0007 00E1
        DECLE   $0005,  $005C,  $0006,  $0041   ; 5D93   0005 005C 0006 0041
        DECLE   $0006,  $005F,  $0007,  $00E1   ; 5D97   0006 005F 0007 00E1
        DECLE   $0005                           ; 5D9B   0005

        TSTR    R3                              ; 5D9C   009B
        INCR    R0                              ; 5D9D   0008
        SWAP    R1,     1                       ; 5D9E   0041
        CLRC                                    ; 5D9F   0006
        MOVR    R3,     R7                      ; 5DA0   009F

        DECLE   $0009,  $00E1,  $0005,  $00CA   ; 5DA1   0009 00E1 0005 00CA
        DECLE   $0022,  $0059,  $0006,  $00D2   ; 5DA5   0022 0059 0006 00D2
        DECLE   $0002,  $005F,  $0006,  $008D   ; 5DA9   0002 005F 0006 008D
        DECLE   $0009,  $00E9,  $0005,  $008E   ; 5DAD   0009 00E9 0005 008E
        DECLE   $0008,  $0041,  $0006,  $0055   ; 5DB1   0008 0041 0006 0055
        DECLE   $0007,  $00E9,  $0005,  $0056   ; 5DB5   0007 00E9 0005 0056
        DECLE   $0006,  $0041,  $0006,  $001C   ; 5DB9   0006 0041 0006 001C
        DECLE   $0007,  $00E9,  $0005,  $0000   ; 5DBD   0007 00E9 0005 0000
        DECLE   $0001,  $0016,  $000C,  $0041   ; 5DC1   0001 0016 000C 0041
        DECLE   $0006,  $001C,  $0009,  $00E1   ; 5DC5   0006 001C 0009 00E1
        DECLE   $0005,  $006C,  $000A,  $0041   ; 5DC9   0005 006C 000A 0041
        DECLE   $0006,  $0020,  $0009,  $00E9   ; 5DCD   0006 0020 0009 00E9
        DECLE   $0005,  $0021,  $000C,  $0041   ; 5DD1   0005 0021 000C 0041
        DECLE   $0006,  $0027,  $0009,  $00E1   ; 5DD5   0006 0027 0009 00E1
        DECLE   $0005                           ; 5DD9   0005

        RSWD    R3                              ; 5DDA   003B
        DIS                                     ; 5DDB   0003
        ADDR    R4,     R7                      ; 5DDC   00E7

        DECLE   $0005,  $003A,  $0002,  $0007   ; 5DDD   0005 003A 0002 0007
        DECLE   $0000,  $0061,  $0004,  $0059   ; 5DE1   0000 0061 0004 0059
        DECLE   $0006,  $0075,  $0003,  $00E1   ; 5DE5   0006 0075 0003 00E1
        DECLE   $0005,  $0073,  $0004,  $0059   ; 5DE9   0005 0073 0004 0059
        DECLE   $0006,  $0087,  $0003,  $00E1   ; 5DED   0006 0087 0003 00E1
        DECLE   $0005,  $0085,  $0004,  $0059   ; 5DF1   0005 0085 0004 0059
        DECLE   $0006,  $0099,  $0009,  $00E1   ; 5DF5   0006 0099 0009 00E1
        DECLE   $0005,  $00D0,  $000A,  $0059   ; 5DF9   0005 00D0 000A 0059
        DECLE   $0006,  $0093,  $0009,  $00E9   ; 5DFD   0006 0093 0009 00E9
        DECLE   $0005,  $007E,  $0004,  $0059   ; 5E01   0005 007E 0004 0059
        DECLE   $0006,  $007D,  $0003,  $00E9   ; 5E05   0006 007D 0003 00E9
        DECLE   $0005,  $0068,  $0004,  $0059   ; 5E09   0005 0068 0004 0059
        DECLE   $0006,  $0067,  $0003,  $00E9   ; 5E0D   0006 0067 0003 00E9
        DECLE   $0005,  $0052,  $0004,  $0059   ; 5E11   0005 0052 0004 0059
        DECLE   $0006,  $0015,  $0009,  $00E9   ; 5E15   0006 0015 0009 00E9
        DECLE   $0005                           ; 5E19   0005

        ADCR    R1                              ; 5E1A   0029
        DIS                                     ; 5E1B   0003
        ADDR    R5,     R7                      ; 5E1C   00EF

        DECLE   $0005,  $002A,  $0002,  $0007   ; 5E1D   0005 002A 0002 0007
        DECLE   $0000,  $0000,  $0001,  $001C   ; 5E21   0000 0000 0001 001C
        DECLE   $000A,  $0059,  $0006,  $0034   ; 5E25   000A 0059 0006 0034
        DECLE   $0003,  $00E9,  $0005,  $0035   ; 5E29   0003 00E9 0005 0035
        DECLE   $0004,  $0059,  $0006,  $004A   ; 5E2D   0004 0059 0006 004A
        DECLE   $0002,  $00E9,  $0005,  $004B   ; 5E31   0002 00E9 0005 004B
        DECLE   $0004,  $0059,  $0006,  $0060   ; 5E35   0004 0059 0006 0060
        DECLE   $0003,  $00E9,  $0005,  $0061   ; 5E39   0003 00E9 0005 0061
        DECLE   $0004,  $0059,  $0006,  $0076   ; 5E3D   0004 0059 0006 0076
        DECLE   $0007,  $00E9,  $0005           ; 5E41   0007 00E9 0005

        MOVR    R1,     R2                      ; 5E44   008A
        DIS                                     ; 5E45   0003
        ADDR    R5,     R7                      ; 5E46   00EF

        DECLE   $0005,  $00B1,  $0004,  $0041   ; 5E47   0005 00B1 0004 0041
        DECLE   $0006,  $00B0,  $0003,  $00E9   ; 5E4B   0006 00B0 0003 00E9
        DECLE   $0005,  $00C3,  $0004,  $0041   ; 5E4F   0005 00C3 0004 0041
        DECLE   $0006,  $00C2,  $0003,  $00E9   ; 5E53   0006 00C2 0003 00E9
        DECLE   $0005,  $00D5,  $0004,  $0041   ; 5E57   0005 00D5 0004 0041
        DECLE   $0006,  $00D4,  $0003,  $00E9   ; 5E5B   0006 00D4 0003 00E9
        DECLE   $0005,  $00E4,  $000A,  $0041   ; 5E5F   0005 00E4 000A 0041
        DECLE   $0006,  $00D0,  $0003,  $00E1   ; 5E63   0006 00D0 0003 00E1
        DECLE   $0005,  $00CE,  $0004,  $0041   ; 5E67   0005 00CE 0004 0041
        DECLE   $0006,  $00BA,  $0003,  $00E1   ; 5E6B   0006 00BA 0003 00E1
        DECLE   $0005,  $00B8,  $0004,  $0041   ; 5E6F   0005 00B8 0004 0041
        DECLE   $0006,  $00A4,  $0003,  $00E1   ; 5E73   0006 00A4 0003 00E1
        DECLE   $0005,  $00A2,  $0004,  $0041   ; 5E77   0005 00A2 0004 0041
        DECLE   $0006,  $0066,  $0007,  $00E1   ; 5E7B   0006 0066 0007 00E1
        DECLE   $0005                           ; 5E7F   0005

        SARC    R2,     1                       ; 5E80   007A
        DIS                                     ; 5E81   0003
        ADDR    R4,     R7                      ; 5E82   00E7

        DECLE   $0005,  $0052,  $0004,  $0059   ; 5E83   0005 0052 0004 0059
        DECLE   $0006,  $0054,  $0003,  $00E1   ; 5E87   0006 0054 0003 00E1
        DECLE   $0005,  $0040,  $0004,  $0059   ; 5E8B   0005 0040 0004 0059
        DECLE   $0006,  $0042,  $0003,  $00E1   ; 5E8F   0006 0042 0003 00E1
        DECLE   $0005,  $002E,  $0004,  $0059   ; 5E93   0005 002E 0004 0059
        DECLE   $0006,  $0030,  $0003,  $00E1   ; 5E97   0006 0030 0003 00E1
        DECLE   $0005,  $0000,  $0000,  $00EE   ; 5E9B   0005 0000 0000 00EE
        DECLE   $0005,  $0226,  $023A,  $0240   ; 5E9F   0005 0226 023A 0240
        DECLE   $0243,  $024D,  $0258,  $027E   ; 5EA3   0243 024D 0258 027E
        DECLE   $027F,  $0289,  $0292,  $0293   ; 5EA7   027F 0289 0292 0293
        DECLE   $029E,  $02A6,  $02A8,  $02B1   ; 5EAB   029E 02A6 02A8 02B1
        DECLE   $02BA,  $02BC,  $02C4,  $02D0   ; 5EAF   02BA 02BC 02C4 02D0
        DECLE   $0000,  $00EF,  $0005,  $026C   ; 5EB3   0000 00EF 0005 026C
        DECLE   $0000,  $0046,  $0006,  $023E   ; 5EB7   0000 0046 0006 023E

        MVO     R1,     .BTAB.44                ; 5EBB   0241 0244
        MVO     R5,     .BTAB.46                ; 5EBD   0245 0246
        MVO     R7,     .BTAB.48                ; 5EBF   0247 0248
        MVO@    R1,     R1                      ; 5EC1   0249
        MVO@    R6,     R1                      ; 5EC2   024E
        MVO@    R3,     R2                      ; 5EC3   0253
        MVO@    R4,     R2                      ; 5EC4   0254
        MVO@    R6,     R2                      ; 5EC5   0256
        MVO@    R7,     R2                      ; 5EC6   0257
        MVO@    R1,     R3                      ; 5EC7   0259
        MVO@    R2,     R3                      ; 5EC8   025A
        MVO@    R6,     R3                      ; 5EC9   025E
        MVO@    R7,     R3                      ; 5ECA   025F
        MVO@    R1,     R4                      ; 5ECB   0261
        MVI     .BTAB.83,R0                     ; 5ECC   0280 0283
        MVI@    R4,     R2                      ; 5ECE   02A2
        MVI@    R5,     R5                      ; 5ECF   02AD
        PULR    R2                              ; 5ED0   02B2
        PULR    R7                              ; 5ED1   02B7

        ADD     .BTAB.C5,R2                     ; 5ED2   02C2 02C5
        ADD@    R1,     R4                      ; 5ED4   02CC
        ADD@    R1,     R6                      ; 5ED5   02CE
        ADD@    R2,     R7                      ; 5ED6   02D7

        DECLE   $02D8,  $0000,  $0047,  $0006   ; 5ED7   02D8 0000 0047 0006
        DECLE   $0260,  $02CD,  $0000,  $00E6   ; 5EDB   0260 02CD 0000 00E6
        DECLE   $0005,  $0222,  $022A,  $023F   ; 5EDF   0005 0222 022A 023F
        DECLE   $0242,  $024A,  $025B,  $026F   ; 5EE3   0242 024A 025B 026F
        DECLE   $027C,  $0284,  $0286,  $028E   ; 5EE7   027C 0284 0286 028E
        DECLE   $0298,  $0299,  $02A3,  $02AB   ; 5EEB   0298 0299 02A3 02AB
        DECLE   $02AE,  $02B8,  $02BF,  $02C3   ; 5EEF   02AE 02B8 02BF 02C3
        DECLE   $02D3,  $0000,  $005E,  $0006   ; 5EF3   02D3 0000 005E 0006
        DECLE   $020E,  $020F,  $0210,  $0212   ; 5EF7   020E 020F 0210 0212
        DECLE   $0216,  $0217,  $0218,  $0219   ; 5EFB   0216 0217 0218 0219
        DECLE   $021A,  $021B,  $021C,  $021D   ; 5EFF   021A 021B 021C 021D
        DECLE   $021E,  $021F,  $0220,  $0221   ; 5F03   021E 021F 0220 0221
        DECLE   $0268,  $026A,  $0272,  $0274   ; 5F07   0268 026A 0272 0274
        DECLE   $0275,  $027A,  $027B           ; 5F0B   0275 027A 027B

        MVI     .BTAB.8A,R5                     ; 5F0E   0285 028A
        MVI@    R2,     R4                      ; 5F10   0294
        MVI@    R2,     R7                      ; 5F11   0297

        DECLE   $02D1,  $02D2,  $0000,  $005F   ; 5F12   02D1 02D2 0000 005F
        DECLE   $0006,  $0211,  $0269,  $0273   ; 5F16   0006 0211 0269 0273
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5F1A   0000 0000 0000 0001
        DECLE   $001D,  $0002,  $0047,  $0006   ; 5F1E   001D 0002 0047 0006
        DECLE   $001E,  $0004,  $0046,  $0006   ; 5F22   001E 0004 0046 0006
        DECLE   $0020,  $0003,  $00E6,  $0005   ; 5F26   0020 0003 00E6 0005
        DECLE   $0034,  $0004,  $0046,  $0006   ; 5F2A   0034 0004 0046 0006
        DECLE   $0036,  $0003,  $00E6,  $0005   ; 5F2E   0036 0003 00E6 0005
        DECLE   $004A,  $0008,  $0046,  $0006   ; 5F32   004A 0008 0046 0006
        DECLE   $004E,  $0003,  $00E6,  $0005   ; 5F36   004E 0003 00E6 0005
        DECLE   $0062,  $0002,  $0046,  $0006   ; 5F3A   0062 0002 0046 0006
        DECLE   $0063,  $0009,  $00E6,  $0005   ; 5F3E   0063 0009 00E6 0005
        DECLE   $009E,  $0002,  $005E,  $0006   ; 5F42   009E 0002 005E 0006
        DECLE   $00B2,  $0003,  $00E6,  $0005   ; 5F46   00B2 0003 00E6 0005
        DECLE   $00AE,  $0008,  $005E,  $0006   ; 5F4A   00AE 0008 005E 0006
        DECLE   $00C2,  $0003,  $00E6,  $0005   ; 5F4E   00C2 0003 00E6 0005
        DECLE   $00C0,  $0004,  $005E,  $0006   ; 5F52   00C0 0004 005E 0006
        DECLE   $00D4,  $0003,  $00E6,  $0005   ; 5F56   00D4 0003 00E6 0005
        DECLE   $00D1,  $0006,  $005E,  $0006   ; 5F5A   00D1 0006 005E 0006
        DECLE   $00D0,  $0003,  $00EE,  $0005   ; 5F5E   00D0 0003 00EE 0005
        DECLE   $00BB,  $0004,  $005E,  $0006   ; 5F62   00BB 0004 005E 0006
        DECLE   $00BA,  $0003,  $00EE,  $0005   ; 5F66   00BA 0003 00EE 0005
        DECLE   $00A3,  $0008,  $005E,  $0006   ; 5F6A   00A3 0008 005E 0006
        DECLE   $00A2,  $0003,  $00EE,  $0005   ; 5F6E   00A2 0003 00EE 0005
        DECLE   $008E,  $0002,  $005E,  $0006   ; 5F72   008E 0002 005E 0006
        DECLE   $0051,  $0009,  $00EE,  $0005   ; 5F76   0051 0009 00EE 0005
        DECLE   $0052,  $0002,  $0046,  $0006   ; 5F7A   0052 0002 0046 0006
        DECLE   $003E,  $0003,  $00EE,  $0005   ; 5F7E   003E 0003 00EE 0005
        DECLE   $003F,  $0008,  $0046,  $0006   ; 5F82   003F 0008 0046 0006
        DECLE   $002E,  $0003,  $00EE,  $0005   ; 5F86   002E 0003 00EE 0005
        DECLE   $002F,  $0004,  $0046,  $0006   ; 5F8A   002F 0004 0046 0006
        DECLE   $001C,  $0003,  $00EE,  $0005   ; 5F8E   001C 0003 00EE 0005
        DECLE   $0046,  $0005,  $00FE,  $0002   ; 5F92   0046 0005 00FE 0002
        DECLE   $0000,  $0001,  $001E,  $0010   ; 5F96   0000 0001 001E 0010
        DECLE   $0046,  $0006,  $0023,  $0002   ; 5F9A   0046 0006 0023 0002
        DECLE   $0047,  $0006,  $0026,  $0003   ; 5F9E   0047 0006 0026 0003
        DECLE   $00E6,  $0005,  $003A,  $0002   ; 5FA2   00E6 0005 003A 0002
        DECLE   $0046,  $0006,  $003B,  $0011   ; 5FA6   0046 0006 003B 0011
        DECLE   $00E6,  $0005,  $00C6,  $0002   ; 5FAA   00E6 0005 00C6 0002
        DECLE   $005E,  $0006,  $00DA,  $0003   ; 5FAE   005E 0006 00DA 0003
        DECLE   $00E6,  $0005                   ; 5FB2   00E6 0005

        ADDR    R2,     R2                      ; 5FB4   00D2
        DECR    R0                              ; 5FB5   0010
        SLLC    R2,     2                       ; 5FB6   005E
        CLRC                                    ; 5FB7   0006
        ADDR    R2,     R7                      ; 5FB8   00D7

        DECLE   $0002,  $005F,  $0006,  $0081   ; 5FB9   0002 005F 0006 0081
        DECLE   $000B,  $00EE,  $0005,  $006C   ; 5FBD   000B 00EE 0005 006C
        DECLE   $0004,  $005E,  $0006,  $0080   ; 5FC1   0004 005E 0006 0080
        DECLE   $0005,  $00E6,  $0005,  $0092   ; 5FC5   0005 00E6 0005 0092
        DECLE   $0004,  $005E,  $0006,  $0091   ; 5FC9   0004 005E 0006 0091
        DECLE   $0003,  $00EE,  $0005,  $007D   ; 5FCD   0003 00EE 0005 007D
        DECLE   $0002,  $00A6,  $0008,  $007C   ; 5FD1   0002 00A6 0008 007C
        DECLE   $0003,  $00EE,  $0005           ; 5FD5   0003 00EE 0005

        MOVR    R2,     R0                      ; 5FD8   0090
        EIS                                     ; 5FD9   0002
        INCR    R6                              ; 5FDA   000E
        INCR    R0                              ; 5FDB   0008
        MOVR    R1,     R7                      ; 5FDC   008F

        DECLE   $0002,  $005E,  $0006,  $007A   ; 5FDD   0002 005E 0006 007A
        DECLE   $0005,  $00EE,  $0005,  $0066   ; 5FE1   0005 00EE 0005 0066
        DECLE   $0002,  $005E,  $0006,  $003D   ; 5FE5   0002 005E 0006 003D
        DECLE   $0007,  $00EE,  $0005,  $003E   ; 5FE9   0007 00EE 0005 003E
        DECLE   $0010,  $0046,  $0006,  $001D   ; 5FED   0010 0046 0006 001D
        DECLE   $0005,  $00EE,  $0005,  $005F   ; 5FF1   0005 00EE 0005 005F
        DECLE   $0009,  $00FE,  $0002,  $0060   ; 5FF5   0009 00FE 0002 0060
        DECLE   $0009,  $00FE,  $0002,  $0061   ; 5FF9   0009 00FE 0002 0061
        DECLE   $0009,  $00FE,  $0002,  $0000   ; 5FFD   0009 00FE 0002 0000
        DECLE   $0001,  $001C,  $0002,  $00BE   ; 6001   0001 001C 0002 00BE
        DECLE   $0008,  $001D,  $0006,  $0046   ; 6005   0008 001D 0006 0046
        DECLE   $0006,  $0020,  $0002,  $00A6   ; 6009   0006 0020 0002 00A6
        DECLE   $0008,  $0034,  $0005,  $00EE   ; 600D   0008 0034 0005 00EE
        DECLE   $0005,  $0049,  $000C,  $005E   ; 6011   0005 0049 000C 005E
        DECLE   $0006,  $0062,  $0009,  $00EE   ; 6015   0006 0062 0009 00EE
        DECLE   $0005,  $00AD,  $000C,  $0046   ; 6019   0005 00AD 000C 0046
        DECLE   $0006,  $00AC,  $0007,  $00EE   ; 601D   0006 00AC 0007 00EE
        DECLE   $0005,  $00E4,  $000A,  $0046   ; 6021   0005 00E4 000A 0046
        DECLE   $0006,  $00A8,  $0007,  $00E6   ; 6025   0006 00A8 0007 00E6
        DECLE   $0005,  $00A2,  $000C,  $0046   ; 6029   0005 00A2 000C 0046
        DECLE   $0006,  $0052,  $0009,  $00E6   ; 602D   0006 0052 0009 00E6
        DECLE   $0005,  $003E,  $000C,  $005E   ; 6031   0005 003E 000C 005E
        DECLE   $0006,  $0044,  $0003,  $00E6   ; 6035   0006 0044 0003 00E6
        DECLE   $0005                           ; 6039   0005

        GSWD    R0                              ; 603A   0030
        DIS                                     ; 603B   0003
        ADDR    R4,     R7                      ; 603C   00E7

        DECLE   $0005,  $0000,  $0001,  $0021   ; 603D   0005 0000 0001 0021
        DECLE   $000C,  $0046,  $0006,  $0023   ; 6041   000C 0046 0006 0023
        DECLE   $0002,  $0047,  $0006,  $0027   ; 6045   0002 0047 0006 0027
        DECLE   $0011,  $00E6,  $0005,  $00B1   ; 6049   0011 00E6 0005 00B1
        DECLE   $0004,  $005E,  $0006,  $00C5   ; 604D   0004 005E 0006 00C5
        DECLE   $0005,  $00E6,  $0005,  $00D0   ; 6051   0005 00E6 0005 00D0
        DECLE   $0012,  $005E,  $0006,  $00D5   ; 6055   0012 005E 0006 00D5
        DECLE   $0002,  $005F,  $0006,  $00BB   ; 6059   0002 005F 0006 00BB
        DECLE   $0005,  $00EE,  $0005,  $00A6   ; 605D   0005 00EE 0005 00A6
        DECLE   $0004,  $005E,  $0006,  $007D   ; 6061   0004 005E 0006 007D
        DECLE   $0007,  $00EE,  $0005,  $0069   ; 6065   0007 00EE 0005 0069
        DECLE   $0002,  $00A6,  $0008,  $0068   ; 6069   0002 00A6 0008 0068
        DECLE   $0002,  $0046,  $0006,  $0054   ; 606D   0002 0046 0006 0054
        DECLE   $0003,  $00E6,  $0005,  $0052   ; 6071   0003 00E6 0005 0052
        DECLE   $0004,  $0046,  $0006,  $002A   ; 6075   0004 0046 0006 002A
        DECLE   $0005,  $00E6,  $0005,  $0016   ; 6079   0005 00E6 0005 0016
        DECLE   $0010,  $005E,  $0006,  $0031   ; 607D   0010 005E 0006 0031
        DECLE   $0009,  $00EE,  $0005,  $006E   ; 6081   0009 00EE 0005 006E
        DECLE   $0004,  $005E,  $0006,  $0070   ; 6085   0004 005E 0006 0070
        DECLE   $0002,  $000E,  $0008,  $0020   ; 6089   0002 000E 0008 0020
        DECLE   $0009,  $00EE,  $0005,  $004B   ; 608D   0009 00EE 0005 004B
        DECLE   $0005,  $00FE,  $0002,  $004C   ; 6091   0005 00FE 0002 004C
        DECLE   $0005,  $00FE,  $0002,  $0000   ; 6095   0005 00FE 0002 0000
        DECLE   $0001,  $0016,  $0008,  $00FA   ; 6099   0001 0016 0008 00FA
        DECLE   $0002,  $0029,  $0003,  $00EA   ; 609D   0002 0029 0003 00EA
        DECLE   $0005,  $002A,  $0008,  $00FA   ; 60A1   0005 002A 0008 00FA
        DECLE   $0002,  $002E,  $0003,  $00E2   ; 60A5   0002 002E 0003 00E2
        DECLE   $0005,  $003E,  $0008,  $00FA   ; 60A9   0005 003E 0008 00FA
        DECLE   $0002,  $0000,  $0001,  $001F   ; 60AD   0002 0000 0001 001F
        DECLE   $0003,  $00EA,  $0005,  $0020   ; 60B1   0003 00EA 0005 0020
        DECLE   $000C,  $00FA,  $0002,  $0034   ; 60B5   000C 00FA 0002 0034
        DECLE   $000C,  $00FA,  $0002,  $003A   ; 60B9   000C 00FA 0002 003A
        DECLE   $0003,  $00E2,  $0005,  $004C   ; 60BD   0003 00E2 0005 004C
        DECLE   $0004,  $00FA,  $0002,  $0000   ; 60C1   0004 00FA 0002 0000
        DECLE   $0001,  $0067,  $0002,  $005A   ; 60C5   0001 0067 0002 005A
        DECLE   $0006,  $007A,  $000A,  $00FA   ; 60C9   0006 007A 000A 00FA
        DECLE   $0002,  $008E,  $0004,  $00FA   ; 60CD   0002 008E 0004 00FA
        DECLE   $0002,  $00A2,  $000A,  $00FA   ; 60D1   0002 00A2 000A 00FA
        DECLE   $0002,  $00B6,  $000A,  $00FA   ; 60D5   0002 00B6 000A 00FA
        DECLE   $0002,  $00BB,  $0002,  $0000   ; 60D9   0002 00BB 0002 0000
        DECLE   $0000,  $00CA,  $000A,  $00FA   ; 60DD   0000 00CA 000A 00FA
        DECLE   $0002,  $0000,  $0001,  $0072   ; 60E1   0002 0000 0001 0072
        DECLE   $000A,  $00FA,  $0002,  $0077   ; 60E5   000A 00FA 0002 0077
        DECLE   $0002,  $0000,  $0000,  $0086   ; 60E9   0002 0000 0000 0086
        DECLE   $000A,  $00FA,  $0002,  $009B   ; 60ED   000A 00FA 0002 009B
        DECLE   $0002,  $0042,  $0006,  $009D   ; 60F1   0002 0042 0006 009D
        DECLE   $0004,  $00FA,  $0002,  $00B1   ; 60F5   0004 00FA 0002 00B1
        DECLE   $0004,  $00FA,  $0002,  $00C1   ; 60F9   0004 00FA 0002 00C1
        DECLE   $000C,  $00FA,  $0002,  $00D5   ; 60FD   000C 00FA 0002 00D5
        DECLE   $000C,  $00FA,  $0002,  $0000   ; 6101   000C 00FA 0002 0000
        DECLE   $0001,  $0015,  $0003,  $00E9   ; 6105   0001 0015 0003 00E9
        DECLE   $0005,  $0016,  $0005,  $00F9   ; 6109   0005 0016 0005 00F9
        DECLE   $0002,  $002B,  $0007,  $00F9   ; 610D   0002 002B 0007 00F9
        DECLE   $0002,  $002C,  $0007,  $00F9   ; 6111   0002 002C 0007 00F9
        DECLE   $0002,  $0019,  $0005,  $00F9   ; 6115   0002 0019 0005 00F9
        DECLE   $0002,  $001A,  $0003,  $00E1   ; 6119   0002 001A 0003 00E1
        DECLE   $0005,  $0000,  $0001,  $001E   ; 611D   0005 0000 0001 001E
        DECLE   $0002,  $00F9,  $0002,  $0031   ; 6121   0002 00F9 0002 0031
        DECLE   $0006,  $00F9,  $0002,  $0044   ; 6125   0006 00F9 0002 0044
        DECLE   $000A,  $00F9,  $0002,  $005A   ; 6129   000A 00F9 0002 005A
        DECLE   $0002,  $0041,  $0006,  $0000   ; 612D   0002 0041 0006 0000
        DECLE   $0001,  $0022,  $000A,  $00F9   ; 6131   0001 0022 000A 00F9
        DECLE   $0002,  $0036,  $000A,  $00F9   ; 6135   0002 0036 000A 00F9
        DECLE   $0002,  $004B,  $0006,  $00F9   ; 6139   0002 004B 0006 00F9
        DECLE   $0002,  $005F,  $0006,  $00F9   ; 613D   0002 005F 0006 00F9
        DECLE   $0002,  $0074,  $0002,  $0041   ; 6141   0002 0074 0002 0041
        DECLE   $0006,  $0000,  $0001,  $0081   ; 6145   0006 0000 0001 0081
        DECLE   $0006,  $00F9,  $0002,  $0092   ; 6149   0006 00F9 0002 0092
        DECLE   $0012,  $00F9,  $0002,  $00A2   ; 614D   0012 00F9 0002 00A2
        DECLE   $0002,  $0000,  $0000,  $00A3   ; 6151   0002 0000 0000 00A3
        DECLE   $001E,  $00F9,  $0002,  $00B2   ; 6155   001E 00F9 0002 00B2
        DECLE   $0002,  $0000,  $0000,  $00BA   ; 6159   0002 0000 0000 00BA
        DECLE   $0012,  $00F9,  $0002,  $00D1   ; 615D   0012 00F9 0002 00D1
        DECLE   $0006,  $00F9,  $0002,  $0000   ; 6161   0006 00F9 0002 0000
        DECLE   $0001,  $0011,  $0002,  $005E   ; 6165   0001 0011 0002 005E
        DECLE   $0006,  $0022,  $000A,  $00FE   ; 6169   0006 0022 000A 00FE
        DECLE   $0002,  $002A,  $0022,  $00FE   ; 616D   0002 002A 0022 00FE
        DECLE   $0002,  $003F,  $0004,  $00FE   ; 6171   0002 003F 0004 00FE
        DECLE   $0002,  $0042,  $0004,  $00FE   ; 6175   0002 0042 0004 00FE
        DECLE   $0002,  $004A,  $0008,  $00FE   ; 6179   0002 004A 0008 00FE
        DECLE   $0002,  $0060,  $0002,  $0046   ; 617D   0002 0060 0002 0046
        DECLE   $0006,  $0000,  $0001,  $0069   ; 6181   0006 0000 0001 0069
        DECLE   $0002,  $005E,  $0006,  $007C   ; 6185   0002 005E 0006 007C
        DECLE   $0006,  $00FE,  $0002,  $008E   ; 6189   0006 00FE 0002 008E
        DECLE   $000A,  $00FE,  $0002,  $00A3   ; 618D   000A 00FE 0002 00A3
        DECLE   $0008,  $00FE,  $0002,  $00B8   ; 6191   0008 00FE 0002 00B8
        DECLE   $0006,  $00FE,  $0002,  $00CD   ; 6195   0006 00FE 0002 00CD
        DECLE   $0002,  $0046,  $0006,  $0000   ; 6199   0002 0046 0006 0000
        DECLE   $0001,  $006C,  $0003,  $00EE   ; 619D   0001 006C 0003 00EE
        DECLE   $0005,  $0080,  $0005           ; 61A1   0005 0080 0005

        ADDR    R7,     R6                      ; 61A4   00FE
        EIS                                     ; 61A5   0002
        SLLC    R1,     1                       ; 61A6   0059
        INCR    R7                              ; 61A7   000F

        ADDR    R7,     R6                      ; 61A8   00FE
L_61A9:
        EIS                                     ; 61A9   0002
        SLLC    R2,     1                       ; 61AA   005A
        INCR    R7                              ; 61AB   000F

        ADDR    R7,     R6                      ; 61AC   00FE
L_61AD:
        EIS                                     ; 61AD   0002
        DECLE   $0083,  $0005,  $00FE,  $0002   ; 61AE   0083 0005 00FE 0002
        DECLE   $0000,  $0001,  $0073,  $0002   ; 61B2   0000 0001 0073 0002
        DECLE   $005E,  $0006,  $0086,  $0008   ; 61B6   005E 0006 0086 0008
        DECLE   $00FE,  $0002,  $0099,  $000C   ; 61BA   00FE 0002 0099 000C
        DECLE   $00FE,  $0002,  $00AE,  $0008   ; 61BE   00FE 0002 00AE 0008
        DECLE   $00FE,  $0002,  $00C3,  $0004   ; 61C2   00FE 0002 00C3 0004
        DECLE   $00FE,  $0002,  $0000,  $0001   ; 61C6   00FE 0002 0000 0001
        DECLE   $00A5,  $0007,  $00FF,  $0020   ; 61CA   00A5 0007 00FF 0020
        DECLE   $00A6,  $0016,  $00FF,  $0000   ; 61CE   00A6 0016 00FF 0000
        DECLE   $00BA,  $0016,  $00FF,  $0000   ; 61D2   00BA 0016 00FF 0000
        DECLE   $00CE,  $0016,  $00FF,  $0000   ; 61D6   00CE 0016 00FF 0000
        DECLE   $00B1,  $0007,  $0000,  $0020   ; 61DA   00B1 0007 0000 0020
        DECLE   $0000,  $0001,  $0041,  $0007   ; 61DE   0000 0001 0041 0007
        DECLE   $00FF,  $0020,  $0042,  $0016   ; 61E2   00FF 0020 0042 0016
        DECLE   $00FF,  $0000,  $0056,  $0016   ; 61E6   00FF 0000 0056 0016
        DECLE   $00FF,  $0000,  $006A,  $0016   ; 61EA   00FF 0000 006A 0016
        DECLE   $00FF,  $0000,  $004D,  $0007   ; 61EE   00FF 0000 004D 0007
        DECLE   $0000,  $0020,  $0000,  $0000   ; 61F2   0000 0020 0000 0000
        DECLE   $0000,  $0000,  $0000,  $008A   ; 61F6   0000 0000 0000 008A
        DECLE   $005A,  $0022,  $005B,  $0000   ; 61FA   005A 0022 005B 0000
        DECLE   $0000,  $004A,  $005B,  $00A2   ; 61FE   0000 004A 005B 00A2
        DECLE   $005A,  $000A,  $005B,  $0000   ; 6202   005A 000A 005B 0000
        DECLE   $0000,  $0052,  $005B,  $0072   ; 6206   0000 0052 005B 0072
        DECLE   $005A,  $003A,  $005B,  $0000   ; 620A   005A 003A 005B 0000
        DECLE   $0000                           ; 620E   0000

        RSWD    R2                              ; 620F   003A
        SLLC    R2,     1                       ; 6210   005A
        MOVR    R7,     R2                      ; 6211   00BA
        SLLC    R2,     1                       ; 6212   005A
        ADDR    R6,     R2                      ; 6213   00F2
        SLLC    R2,     1                       ; 6214   005A
L_6215:
        SDBD                                    ; 6215   0001
        MVI@    R5,     R4                      ; 6216   02AC
        TSTR    R4                              ; 6217   00A4
        BEQ     L_6229                          ; 6218   0204 000F

        PSHR    R5                              ; 621A   0275
        MVI@    R4,     R5                      ; 621B   02A5
        MVI@    R4,     R3                      ; 621C   02A3
L_621D:
        MVI@    R4,     R2                      ; 621D   02A2
        SLL     R2,     2                       ; 621E   004E
        SLL     R2,     1                       ; 621F   004A
        XORI    #$0007, R2                      ; 6220   03FA 0007
        MVO@    R2,     R5                      ; 6222   026A
        DECR    R3                              ; 6223   0013
        BNEQ    L_621D                          ; 6224   022C 0008

        PULR    R5                              ; 6226   02B5
        B       L_6215                          ; 6227   0220 0013
L_6229:
        MOVR    R5,     R7                      ; 6229   00AF

        SDBD                                    ; 622A   0001
        MVI@    R5,     R4                      ; 622B   02AC
L_622C:
        PSHR    R5                              ; 622C   0275
        MVI@    R4,     R0                      ; 622D   02A0
        SARC    R0,     1                       ; 622E   0078
        BNC     L_624C                          ; 622F   0209 001B

L_6231:
        MVI@    R4,     R5                      ; 6231   02A5
        TSTR    R5                              ; 6232   00AD
        BEQ     L_624B                          ; 6233   0204 0016

        ADDI    #$0200, R5                      ; 6235   02FD 0200
        MVI@    R4,     R0                      ; 6237   02A0
        SDBD                                    ; 6238   0001
        MVI@    R4,     R1                      ; 6239   02A1
        SARC    R0,     1                       ; 623A   0078
        BC      L_6243                          ; 623B   0201 0006

L_623D:
        MVO@    R1,     R5                      ; 623D   0269
        DECR    R0                              ; 623E   0010
        BNEQ    L_623D                          ; 623F   022C 0003
        B       L_6231                          ; 6241   0220 0011

L_6243:
        MVO@    R1,     R5                      ; 6243   0269
        ADDI    #$0013, R5                      ; 6244   02FD 0013
        DECR    R0                              ; 6246   0010
        BNEQ    L_6243                          ; 6247   022C 0005
        B       L_6231                          ; 6249   0220 0019
L_624B:
        PULR    R7                              ; 624B   02B7

L_624C:
        SDBD                                    ; 624C   0001
        MVI@    R4,     R0                      ; 624D   02A0
        TSTR    R0                              ; 624E   0080
        BEQ     L_624B                          ; 624F   0224 0005

L_6251:
        MVI@    R4,     R1                      ; 6251   02A1
        TSTR    R1                              ; 6252   0089
        BEQ     L_624C                          ; 6253   0224 0008

        MVO@    R0,     R1                      ; 6255   0248
        B       L_6251                          ; 6256   0220 0006

        DECLE   $0000,  $0000                   ; 6258   0000 0000

        SLLC    R2,     1                       ; 625A   005A
        SLLC    R3,     1                       ; 625B   005B
        ADDR    R0,     R1                      ; 625C   00C1
        SLLC    R1,     2                       ; 625D   005D
        MOVR    R2,     R7                      ; 625E   0097

        DECLE   $005F,  $0046,  $005C,  $001C   ; 625F   005F 0046 005C 001C
        DECLE   $005C,  $008B,  $005D,  $003F   ; 6263   005C 008B 005D 003F
        DECLE   $0060,  $00D0,  $005C,  $00AC   ; 6267   0060 00D0 005C 00AC
        DECLE   $005B,  $004D,  $005D,  $0001   ; 626B   005B 004D 005D 0001
        DECLE   $0060,  $009D,  $005E,  $00DE   ; 626F   0060 009D 005E 00DE
        DECLE   $005B,  $0023,  $005E,  $001D   ; 6273   005B 0023 005E 001D
        DECLE   $005F,  $0029,  $002E,  $001F   ; 6277   005F 0029 002E 001F
        DECLE   $003A,  $0067,  $00BB,  $0077   ; 627B   003A 0067 00BB 0077
        DECLE   $009B,  $031C,  $038C,  $0324   ; 627F   009B 031C 038C 0324
        DECLE   $0394,  $0338,  $0394,  $0394   ; 6283   0394 0338 0394 0394
        DECLE   $0348,  $0140,  $0140,  $0120   ; 6287   0348 0140 0140 0120
        DECLE   $0120,  $0114,  $0150,  $0118   ; 628B   0120 0114 0150 0118
        DECLE   $011E,  $0000,  $0000,  $0000   ; 628F   011E 0000 0000 0000
        DECLE   $0000,  $00EB,  $00EB,  $00EB   ; 6293   0000 00EB 00EB 00EB
        DECLE   $001E,  $0008,  $0350,  $0140   ; 6297   001E 0008 0350 0140
        DECLE   $00CE,  $0068,  $0000,  $0000   ; 629B   00CE 0068 0000 0000
        DECLE   $0000,  $000C,  $0048,  $004C   ; 629F   0000 000C 0048 004C
        DECLE   $0048,  $0068,  $008D,  $014F   ; 62A3   0048 0068 008D 014F
        DECLE   $0027,  $0018,  $0390,  $0148   ; 62A7   0027 0018 0390 0148
        DECLE   $00E6,  $0067,  $0000,  $0000   ; 62AB   00E6 0067 0000 0000
        DECLE   $0000,  $0009,  $0054,  $0058   ; 62AF   0000 0009 0054 0058
        DECLE   $0058,  $0084,  $012E,  $0145   ; 62B3   0058 0084 012E 0145
        DECLE   $0016,  $0008,  $031C,  $0153   ; 62B7   0016 0008 031C 0153
        DECLE   $000C,  $006A,  $0000,  $0000   ; 62BB   000C 006A 0000 0000
        DECLE   $0000                           ; 62BF   0000

        INCR    R7                              ; 62C0   000F

        SLR     R0,     1                       ; 62C1   0060
L_62C2:
        SLR     R0,     2                       ; 62C2   0064
        DECLE   $0064,  $006C,  $0150,  $0148   ; 62C3   0064 006C 0150 0148
        DECLE   $002E,  $0008,  $0324,  $0155   ; 62C7   002E 0008 0324 0155
        DECLE   $0075,  $0069,  $0000,  $0000   ; 62CB   0075 0069 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62CF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62D3   0000 0000 0000 0000
        DECLE   $0000,  $0015,  $001A,  $005A   ; 62D7   0000 0015 001A 005A
        DECLE   $005A,  $0074,  $0074,  $00A2   ; 62DB   005A 0074 0074 00A2
        DECLE   $00B2,  $031A,  $0394,  $0358   ; 62DF   00B2 031A 0394 0358
        DECLE   $0358,  $0358,  $0358,  $031C   ; 62E3   0358 0358 0358 031C
        DECLE   $0394,  $0118,  $0118,  $0154   ; 62E7   0394 0118 0118 0154
        DECLE   $0154,  $0154,  $0154,  $0138   ; 62EB   0154 0154 0154 0138
        DECLE   $0138,  $0000,  $0000,  $0000   ; 62EF   0138 0000 0000 0000
        DECLE   $0000                           ; 62F3   0000

        ADDR    R5,     R3                      ; 62F4   00EB
        ADDR    R5,     R3                      ; 62F5   00EB
        ADDR    R5,     R3                      ; 62F6   00EB
        ADDR    R4,     R7                      ; 62F7   00E7

        DECLE   $0008,  $0360,  $0154,  $00E6   ; 62F8   0008 0360 0154 00E6
        DECLE   $0067,  $0000,  $0000,  $0000   ; 62FC   0067 0000 0000 0000

        INCR    R6                              ; 6300   000E
        MOVR    R2,     R4                      ; 6301   0094
        MOVR    R3,     R0                      ; 6302   0098
        MOVR    R3,     R0                      ; 6303   0098
        CMPR    R0,     R5                      ; 6304   0145
        MOVR    R5,     R3                      ; 6305   00AB
        SUBR    R1,     R6                      ; 6306   010E
        ADDR    R3,     R7                      ; 6307   00DF

        DECLE   $0008,  $0358,  $0114,  $000C   ; 6308   0008 0358 0114 000C
        DECLE   $006A,  $0000,  $0000,  $0000   ; 630C   006A 0000 0000 0000

        INCR    R7                              ; 6310   000F

        SARC    R0,     2                       ; 6311   007C
L_6312:
        TSTR    R0                              ; 6312   0080
        SARC    R0,     2                       ; 6313   007C
        MOVR    R0,     R6                      ; 6314   0086
        MOVR    R1,     R7                      ; 6315   008F

        DECLE   $00ED,  $00EE,  $0008,  $0394   ; 6316   00ED 00EE 0008 0394
        DECLE   $011C,  $0075,  $0069,  $0000   ; 631A   011C 0075 0069 0000
        DECLE   $0000,  $0000                   ; 631E   0000 0000

        INCR    R2                              ; 6320   000A
        MOVR    R4,     R0                      ; 6321   00A0
        TSTR    R4                              ; 6322   00A4
        TSTR    R4                              ; 6323   00A4
        ADDR    R4,     R7                      ; 6324   00E7

        DECLE   $00EE,  $014A,  $00F7,  $0018   ; 6325   00EE 014A 00F7 0018
        DECLE   $0358,  $0138,  $00CE,  $0068   ; 6329   0358 0138 00CE 0068
        DECLE   $0000,  $0000,  $0000,  $0000   ; 632D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6331   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0011   ; 6335   0000 0000 0000 0011
        DECLE   $0060,  $0069,  $00CD,  $006C   ; 6339   0060 0069 00CD 006C
        DECLE   $006C,  $0073,  $0073,  $0380   ; 633D   006C 0073 0073 0380
        DECLE   $0380,  $0380,  $0370,  $034C   ; 6341   0380 0380 0370 034C
        DECLE   $034C,  $0352,  $0352,  $0114   ; 6345   034C 0352 0352 0114
        DECLE   $0154,  $0114,  $0154,  $0118   ; 6349   0154 0114 0154 0118
        DECLE   $0118,  $0114,  $0114,  $0000   ; 634D   0118 0114 0114 0000
        DECLE   $0000,  $0000,  $0000,  $00EB   ; 6351   0000 0000 0000 00EB
        DECLE   $00EB,  $00EB,  $006F,  $0019   ; 6355   00EB 00EB 006F 0019
        DECLE   $031A,  $0128,  $00E6,  $0067   ; 6359   031A 0128 00E6 0067
        DECLE   $0000,  $0000,  $0000           ; 635D   0000 0000 0000

        INCR    R2                              ; 6360   000A
        ADDR    R1,     R0                      ; 6361   00C8
        ADDR    R1,     R4                      ; 6362   00CC
        ADDR    R1,     R0                      ; 6363   00C8
        MOVR    R0,     R7                      ; 6364   0087

        ADDR    R6,     R2                      ; 6365   00F2
        ADDR    R5,     R7                      ; 6366   00EF

        DECLE   $0065,  $0019,  $031C,  $011C   ; 6367   0065 0019 031C 011C
        DECLE   $000C,  $006A,  $0000,  $0000   ; 636B   000C 006A 0000 0000
        DECLE   $0000                           ; 636F   0000

        INCR    R6                              ; 6370   000E
        ADDR    R4,     R0                      ; 6371   00E0
        ADDR    R4,     R4                      ; 6372   00E4
        ADDR    R4,     R0                      ; 6373   00E0
        ADDR    R4,     R7                      ; 6374   00E7

        DECLE   $00EE,  $012B,  $0077,  $0019   ; 6375   00EE 012B 0077 0019
        DECLE   $0360,  $0154,  $00CE,  $0068   ; 6379   0360 0154 00CE 0068
        DECLE   $0000,  $0000,  $0000,  $0009   ; 637D   0000 0000 0000 0009
        DECLE   $00BC,  $00C0,  $00BC,  $00E8   ; 6381   00BC 00C0 00BC 00E8
        DECLE   $012B,  $012E,  $005D,  $0009   ; 6385   012B 012E 005D 0009
        DECLE   $0358,  $0154,  $0075,  $0069   ; 6389   0358 0154 0075 0069
        DECLE   $008E,  $008E,  $003F,  $003F   ; 638D   008E 008E 003F 003F

        COMR    R2                              ; 6391   001A
        COMR    R2                              ; 6392   001A
        RSWD    R1                              ; 6393   0039
        RSWD    R2                              ; 6394   003A
        ADCR    R2                              ; 6395   002A
        ADCR    R1                              ; 6396   0029
        ADDR    R2,     R2                      ; 6397   00D2
        ADDR    R2,     R2                      ; 6398   00D2
        ADDR    R2,     R2                      ; 6399   00D2
        ADDR    R2,     R2                      ; 639A   00D2
        SARC    R2,     1                       ; 639B   007A
        SARC    R2,     1                       ; 639C   007A
        NEGR    R3                              ; 639D   0023
        NEGR    R3                              ; 639E   0023
        NEGR    R3                              ; 639F   0023
        NEGR    R3                              ; 63A0   0023
        GSWD    R0                              ; 63A1   0030
        GSWD    R0                              ; 63A2   0030
        COMR    R5                              ; 63A3   001D
        COMR    R5                              ; 63A4   001D
        SUB@    R2,     R2                      ; 63A5   0312
        COMR    R3                              ; 63A6   001B
        CMP@    R4,     R2                      ; 63A7   0362
        DECR    R3                              ; 63A8   0013
        SUB@    R4,     R2                      ; 63A9   0322
        GSWD    R2                              ; 63AA   0032
        AND@    R4,     R2                      ; 63AB   03A2
        GSWD    R3                              ; 63AC   0033
        SUB@    R2,     R2                      ; 63AD   0312
        DECR    R2                              ; 63AE   0012
        CMP@    R3,     R2                      ; 63AF   035A
        ADCR    R4                              ; 63B0   002C
        AND@    R1,     R3                      ; 63B1   038B
        NOP                                     ; 63B2   0034
        SUB@    R3,     R2                      ; 63B3   031A
        SLL     R3,     1                       ; 63B4   004B
        AND@    R2,     R2                      ; 63B5   0392
        INCR    R2                              ; 63B6   000A
        SUB@    R6,     R2                      ; 63B7   0332
        GSWD    R2                              ; 63B8   0032
        CMP@    R1,     R2                      ; 63B9   034A
        GSWD    R2                              ; 63BA   0032
        AND     .STIC.EDGE,R2                   ; 63BB   0382 0032
        SUBI    #$001B, R4                      ; 63BD   033C 001B
        AND@    R3,     R4                      ; 63BF   039C
        COMR    R3                              ; 63C0   001B
        CMP     G_0053, R2                      ; 63C1   0342 0053
        AND     G_0044, R3                      ; 63C3   0383 0044
        SUBI    #$0012, R4                      ; 63C5   033C 0012
        CMP@    R3,     R2                      ; 63C7   035A
        ADCR    R4                              ; 63C8   002C
        AND@    R1,     R3                      ; 63C9   038B
        NOP                                     ; 63CA   0034
        AND@    R3,     R3                      ; 63CB   039B
        SLL     R3,     1                       ; 63CC   004B
        AND@    R1,     R2                      ; 63CD   038A
        ADCR    R4                              ; 63CE   002C
        SUB@    R6,     R2                      ; 63CF   0332
        SLLC    R0,     2                       ; 63D0   005C
        CMP@    R1,     R2                      ; 63D1   034A
        GSWD    R2                              ; 63D2   0032
        AND     .STIC.EDGE,R2                   ; 63D3   0382 0032
        ADDR    R4,     R3                      ; 63D5   00E3
        SLR     R0,     1                       ; 63D6   0060
        ADDR    R0,     R5                      ; 63D7   00C5
        SLR     R0,     1                       ; 63D8   0060
        MOVR    R5,     R7                      ; 63D9   00AF

        DECLE   $0060,  $0099,  $0060,  $0047   ; 63DA   0060 0099 0060 0047
        DECLE   $0061,  $0031,  $0061,  $001F   ; 63DE   0061 0031 0061 001F
        DECLE   $0061,  $0005,  $0061,  $00B3   ; 63E2   0061 0005 0061 00B3
        DECLE   $0061,  $009D,  $0061,  $0083   ; 63E6   0061 009D 0061 0083
        DECLE   $0061,  $0065,  $0061,  $0000   ; 63EA   0061 0065 0061 0000
        DECLE   $000A,  $0000,  $00B8,  $000E   ; 63EE   000A 0000 00B8 000E
        DECLE   $0002,  $00FC,  $0030,  $0000   ; 63F2   0002 00FC 0030 0000
        DECLE   $000A,  $0000                   ; 63F6   000A 0000

        MOVR    R7,     R0                      ; 63F8   00B8
        INCR    R6                              ; 63F9   000E
        EIS                                     ; 63FA   0002
        ADDR    R7,     R4                      ; 63FB   00FC
        GSWD    R0                              ; 63FC   0030
L_63FD:
        PSHR    R5                              ; 63FD   0275

        JSR     R5,     L_642F                  ; 63FE   0004 0164 002F

        MVI     G_012A, R1                      ; 6401   0281 012A
        DECR    R1                              ; 6403   0011
        BMI     L_6409                          ; 6404   020B 0003

        MVO     R1,     G_012A                  ; 6406   0241 012A
        PULR    R7                              ; 6408   02B7

L_6409:
        MVII    #$0003, R1                      ; 6409   02B9 0003
        MVO     R1,     G_012A                  ; 640B   0241 012A
        MVI     G_0128, R1                      ; 640D   0281 0128
        CLRR    R3                              ; 640F   01DB
        MOVR    R1,     R2                      ; 6410   008A
        SWAP    R2,     1                       ; 6411   0042
        SLLC    R2,     2                       ; 6412   005E
        BNOV    L_6416                          ; 6413   020A 0001

        COMR    R2                              ; 6415   001A
L_6416:
        BESC    L_642C                          ; 6416   020F 0014

        ANDI    #$001F, R1                      ; 6418   03B9 001F
        MOVR    R1,     R0                      ; 641A   0088
        SLR     R1,     1                       ; 641B   0061
        SDBD                                    ; 641C   0001
        ADDI    #$63ED, R1                      ; 641D   02F9 00ED 0063
        MVI@    R1,     R3                      ; 6420   028B
        SARC    R0,     1                       ; 6421   0078
        BC      L_6426                          ; 6422   0201 0002

        SLR     R3,     2                       ; 6424   0067
        SLR     R3,     2                       ; 6425   0067
L_6426:
        ANDI    #$000F, R3                      ; 6426   03BB 000F
        BEQ     L_642C                          ; 6428   0204 0002

        MVO     R3,     G_0130                  ; 642A   0243 0130
L_642C:
        MVO     R3,     G_012B                  ; 642C   0243 012B
        PULR    R7                              ; 642E   02B7

L_642F:
        MVII    #$01FE, R2                      ; 642F   02BA 01FE
        MVI     G_0338, R1                      ; 6431   0281 0338
        COMR    R1                              ; 6433   0019
        SLLC    R1,     1                       ; 6434   0059
        ADCR    R2                              ; 6435   002A
        MVI@    R2,     R3                      ; 6436   0293
        MVI     G_0129, R2                      ; 6437   0282 0129
        CMPR    R2,     R3                      ; 6439   0153
        BNEQ    L_643F                          ; 643A   020C 0003

        MVO     R2,     G_0128                  ; 643C   0242 0128
        MOVR    R5,     R7                      ; 643E   00AF

L_643F:
        MVO     R3,     G_0129                  ; 643F   0243 0129
        MOVR    R5,     R7                      ; 6441   00AF

L_6442:
        PSHR    R5                              ; 6442   0275
        PSHR    R0                              ; 6443   0270

        JSR     R5,     L_648A                  ; 6444   0004 0164 008A

        PULR    R1                              ; 6447   02B1
        TSTR    R1                              ; 6448   0089
        BNEQ    L_6455                          ; 6449   020C 000A

        MVI     G_0338, R1                      ; 644B   0281 0338
        SARC    R1,     1                       ; 644D   0079
        BNC     L_6455                          ; 644E   0209 0005

        MVI     G_010D, R1                      ; 6450   0281 010D
        TSTR    R1                              ; 6452   0089
        BEQ     L_6456                          ; 6453   0204 0001
L_6455:
        PULR    R7                              ; 6455   02B7

L_6456:
        MVI     G_0128, R2                      ; 6456   0282 0128
        COMR    R2                              ; 6458   001A
        ANDI    #$00E0, R2                      ; 6459   03BA 00E0
        SWAP    R2,     1                       ; 645B   0042
        BEQ     L_6455                          ; 645C   0224 0008

L_645E:
        SLLC    R2,     1                       ; 645E   005A
        BNC     L_645E                          ; 645F   0229 0002
        BEQ     L_6455                          ; 6461   0224 000D

        INCR    R1                              ; 6463   0009
        MVO     R1,     G_010D                  ; 6464   0241 010D

        JSR     R5,     L_6AF8                  ; 6466   0004 0168 02F8

        MVI     G_034C, R1                      ; 6469   0281 034C
        MVO     R1,     G_034A                  ; 646B   0241 034A
        MVI     G_034D, R1                      ; 646D   0281 034D
        MVO     R1,     G_034B                  ; 646F   0241 034B
        MVI     G_035A, R1                      ; 6471   0281 035A
        ADDI    #$0018, R1                      ; 6473   02F9 0018
        MVO     R1,     G_0359                  ; 6475   0241 0359
        MVI     G_0130, R3                      ; 6477   0283 0130
        MOVR    R3,     R2                      ; 6479   009A
        ANDI    #$0003, R2                      ; 647A   03BA 0003
        SARC    R2,     1                       ; 647C   007A
        SLL     R2,     2                       ; 647D   004E
        ADCR    R2                              ; 647E   002A
        MVO     R2,     G_0145                  ; 647F   0242 0145
        SLR     R3,     2                       ; 6481   0067
        ANDI    #$0003, R3                      ; 6482   03BB 0003
        SARC    R3,     1                       ; 6484   007B
        SLL     R3,     2                       ; 6485   004F
        ADCR    R3                              ; 6486   002B
        MVO     R3,     G_0144                  ; 6487   0243 0144
        PULR    R7                              ; 6489   02B7

L_648A:
        TSTR    R0                              ; 648A   0080
        BEQ     L_64C7                          ; 648B   0204 003A

        PSHR    R5                              ; 648D   0275

        JSR     R5,     L_6ABB                  ; 648E   0004 0168 02BB

        PULR    R5                              ; 6491   02B5
        MVI     G_0338, R4                      ; 6492   0284 0338
        ANDI    #$0001, R4                      ; 6494   03BC 0001
        MVI     G_012D, R0                      ; 6496   0280 012D
        MOVR    R0,     R2                      ; 6498   0082
        COMR    R2                              ; 6499   001A
        ANDI    #$0002, R2                      ; 649A   03BA 0002
        ANDI    #$0004, R0                      ; 649C   03B8 0004
        BNEQ    L_64C7                          ; 649E   020C 0027

        MVI     G_012D, R0                      ; 64A0   0280 012D
        XORI    #$0005, R0                      ; 64A2   03F8 0005
        MVO     R0,     G_012D                  ; 64A4   0240 012D
        MVII    #$0001, R1                      ; 64A6   02B9 0001
        MVI     G_012E, R0                      ; 64A8   0280 012E
        ADD     G_0141, R0                      ; 64AA   02C0 0141
        XORR    R1,     R0                      ; 64AC   01C8
        MVO     R0,     G_0141                  ; 64AD   0240 0141
        TSTR    R4                              ; 64AF   00A4
        BEQ     L_64B7                          ; 64B0   0204 0005

        MVO     R0,     G_0147                  ; 64B2   0240 0147
        ADDR    R2,     R7                      ; 64B4   00D7

        MVO     R0,     G_0156                  ; 64B5   0240 0156
L_64B7:
        MVI     G_012F, R0                      ; 64B7   0280 012F
        ADD     G_0142, R0                      ; 64B9   02C0 0142
        XORR    R1,     R0                      ; 64BB   01C8
        MVO     R0,     G_0142                  ; 64BC   0240 0142
        TSTR    R4                              ; 64BE   00A4
        BEQ     L_64C6                          ; 64BF   0204 0005

        MVO     R0,     G_0148                  ; 64C1   0240 0148
        ADDR    R2,     R7                      ; 64C3   00D7

        MVO     R0,     G_0157                  ; 64C4   0240 0157
L_64C6:
        MOVR    R5,     R7                      ; 64C6   00AF

L_64C7:
        MVI     G_012D, R0                      ; 64C7   0280 012D
        ANDI    #$00FB, R0                      ; 64C9   03B8 00FB
        XORI    #$0001, R0                      ; 64CB   03F8 0001
        MVO     R0,     G_012D                  ; 64CD   0240 012D
        MOVR    R0,     R1                      ; 64CF   0081
        ANDI    #$0008, R1                      ; 64D0   03B9 0008
        BNEQ    L_64DC                          ; 64D2   020C 0008

        XORI    #$0008, R0                      ; 64D4   03F8 0008
        MVO     R0,     G_012D                  ; 64D6   0240 012D
        MVII    #$0005, R1                      ; 64D8   02B9 0005
        MVO     R1,     G_012C                  ; 64DA   0241 012C
L_64DC:
        MVI     G_0141, R1                      ; 64DC   0281 0141
        MVO     R1,     G_012E                  ; 64DE   0241 012E
        MVI     G_0142, R1                      ; 64E0   0281 0142
        MVO     R1,     G_012F                  ; 64E2   0241 012F
        MOVR    R0,     R2                      ; 64E4   0082
        COMR    R2                              ; 64E5   001A
        ANDI    #$0002, R2                      ; 64E6   03BA 0002
        MVI     G_0338, R4                      ; 64E8   0284 0338
        ANDI    #$0001, R4                      ; 64EA   03BC 0001
        BEQ     L_64F2                          ; 64EC   0204 0004

        MVO     R4,     G_0146                  ; 64EE   0244 0146
        MVO     R4,     G_015A                  ; 64F0   0244 015A
L_64F2:
        ANDI    #$0001, R0                      ; 64F2   03B8 0001
        MVI     G_012B, R1                      ; 64F4   0281 012B
        MVII    #$0000, R0                      ; 64F6   02B8 0000
        BEQ     L_6514                          ; 64F8   0204 001A

        MVO     R0,     G_0142                  ; 64FA   0240 0142
        TSTR    R4                              ; 64FC   00A4
        BEQ     L_6504                          ; 64FD   0204 0005

        MVO     R0,     G_0148                  ; 64FF   0240 0148
        ADDR    R2,     R7                      ; 6501   00D7

        MVO     R0,     G_0157                  ; 6502   0240 0157
L_6504:
        SLR     R1,     2                       ; 6504   0065
        ANDI    #$0003, R1                      ; 6505   03B9 0003
        MVO     R1,     G_0141                  ; 6507   0241 0141
        TSTR    R4                              ; 6509   00A4
        BNEQ    L_650D                          ; 650A   020C 0001
        MOVR    R5,     R7                      ; 650C   00AF

L_650D:
        MVO     R1,     G_0147                  ; 650D   0241 0147
        ADDR    R2,     R7                      ; 650F   00D7

        MVO     R1,     G_0156                  ; 6510   0241 0156
        B       L_652B                          ; 6512   0200 0017

L_6514:
        MVO     R0,     G_0141                  ; 6514   0240 0141
        TSTR    R4                              ; 6516   00A4
        BEQ     L_651E                          ; 6517   0204 0005

        MVO     R0,     G_0147                  ; 6519   0240 0147
        ADDR    R2,     R7                      ; 651B   00D7

        MVO     R0,     G_0156                  ; 651C   0240 0156
L_651E:
        ANDI    #$0003, R1                      ; 651E   03B9 0003
        MVO     R1,     G_0142                  ; 6520   0241 0142
        TSTR    R4                              ; 6522   00A4
        BNEQ    L_6526                          ; 6523   020C 0001
        MOVR    R5,     R7                      ; 6525   00AF

L_6526:
        MVO     R1,     G_0148                  ; 6526   0241 0148
        ADDR    R2,     R7                      ; 6528   00D7

        MVO     R1,     G_0157                  ; 6529   0241 0157
L_652B:
        MVI     G_012B, R0                      ; 652B   0280 012B
        XOR     G_012C, R0                      ; 652D   03C0 012C
        ANDI    #$000F, R0                      ; 652F   03B8 000F
        BNEQ    L_6534                          ; 6531   020C 0001
        MOVR    R5,     R7                      ; 6533   00AF

L_6534:
        MVI     G_012B, R0                      ; 6534   0280 012B
        DECLE   $0240,  $012C,  $0281,  $0130   ; 6536   0240 012C 0281 0130
        DECLE   $03B9,  $000F,  $0001           ; 653A   03B9 000F 0001

        ADDI    #$00A6, R1                      ; 653D   02F9 00A6
        SLR     R1,     2                       ; 653F   0065
        SDBD                                    ; 6540   0001
        MVII    #$65B6, R4                      ; 6541   02BC 00B6 0065
        ADD@    R1,     R4                      ; 6544   02CC
        MVI     G_035A, R0                      ; 6545   0280 035A
        SDBD                                    ; 6547   0001
        ANDI    #$3007, R0                      ; 6548   03B8 0007 0030
        MVI@    R4,     R1                      ; 654B   02A1
        SLL     R1,     2                       ; 654C   004D
        SLL     R1,     1                       ; 654D   0049
        XORR    R1,     R0                      ; 654E   01C8
        MVO     R0,     G_035A                  ; 654F   0240 035A
        MVI     G_0348, R0                      ; 6551   0280 0348
        PSHR    R5                              ; 6553   0275

        JSR     R5,     L_6582                  ; 6554   0004 0164 0182

        XORI    #$0300, R0                      ; 6557   03F8 0300
        MVO     R0,     G_034C                  ; 6559   0240 034C
        MVI     G_0349, R0                      ; 655B   0280 0349

        JSR     R5,     L_6592                  ; 655D   0004 0164 0192

        MVO     R0,     G_034D                  ; 6560   0240 034D
        TSTR    R2                              ; 6562   0092
        BEQ     L_6566                          ; 6563   0204 0001
        PULR    R7                              ; 6565   02B7

L_6566:
        MVI@    R4,     R0                      ; 6566   02A0
        SLL     R0,     2                       ; 6567   004C
        SLL     R0,     1                       ; 6568   0048
        SDBD                                    ; 6569   0001
        XORI    #$3005, R0                      ; 656A   03F8 0005 0030
        MVO     R0,     G_035F                  ; 656D   0240 035F
        MVI     G_0348, R0                      ; 656F   0280 0348

        JSR     R5,     L_6582                  ; 6571   0004 0164 0182

        SDBD                                    ; 6574   0001
        XORI    #$0500, R0                      ; 6575   03F8 0000 0005
        MVO     R0,     G_0356                  ; 6578   0240 0356
        MVI     G_0349, R0                      ; 657A   0280 0349

        JSR     R5,     L_6592                  ; 657C   0004 0164 0192

        MVO     R0,     G_0357                  ; 657F   0240 0357
        PULR    R7                              ; 6581   02B7

L_6582:
        ANDI    #$00FF, R0                      ; 6582   03B8 00FF
        MVI@    R4,     R1                      ; 6584   02A1
        XORI    #$0080, R1                      ; 6585   03F9 0080
        SDBD                                    ; 6587   0001
        ADDI    #$FF80, R1                      ; 6588   02F9 0080 00FF
        ADDR    R1,     R0                      ; 658B   00C8
        CMPI    #$0100, R0                      ; 658C   0378 0100
        BNC     L_6591                          ; 658E   0209 0001

        CLRR    R0                              ; 6590   01C0
L_6591:
        MOVR    R5,     R7                      ; 6591   00AF

L_6592:
        ANDI    #$007F, R0                      ; 6592   03B8 007F
        MVI@    R4,     R1                      ; 6594   02A1
        XORI    #$0080, R1                      ; 6595   03F9 0080
        SDBD                                    ; 6597   0001
        ADDI    #$FF80, R1                      ; 6598   02F9 0080 00FF
        ADDR    R1,     R0                      ; 659B   00C8
        CMPI    #$0080, R0                      ; 659C   0378 0080
        BNC     L_65A1                          ; 659E   0209 0001

        CLRR    R0                              ; 65A0   01C0
L_65A1:
        MVI@    R4,     R1                      ; 65A1   02A1
        SWAP    R1,     1                       ; 65A2   0041
        SLR     R1,     1                       ; 65A3   0061
        XORR    R1,     R0                      ; 65A4   01C8
        MOVR    R5,     R7                      ; 65A5   00AF

        DECLE   $0000,  $0000,  $0010,  $0030   ; 65A6   0000 0000 0010 0030
        DECLE   $0000,  $0000,  $0010,  $0030   ; 65AA   0000 0000 0010 0030
        DECLE   $0020,  $0020,  $0018,  $0028   ; 65AE   0020 0020 0018 0028
        DECLE   $0000,  $0000                   ; 65B2   0000 0000

        INCR    R0                              ; 65B4   0008
        RSWD    R0                              ; 65B5   0038
        SUBR    R0,     R7                      ; 65B6   0107

        DECLE   $0004,  $0000,  $0002,  $00D3   ; 65B7   0004 0000 0002 00D3
        DECLE   $0013,  $00FC,  $0004,  $0109   ; 65BB   0013 00FC 0004 0109
        DECLE   $0004                           ; 65BF   0004

        ADDR    R7,     R4                      ; 65C0   00FC
        EIS                                     ; 65C1   0002
        INCR    R7                              ; 65C2   000F

        DECR    R1                              ; 65C3   0011
L_65C4:
        ADDR    R4,     R7                      ; 65C4   00E7

        DECLE   $0004,  $0108,  $0000,  $00FC   ; 65C5   0004 0108 0000 00FC
        DECLE   $0002,  $005C,  $00FC,  $00E5   ; 65C9   0002 005C 00FC 00E5
        DECLE   $0004                           ; 65CD   0004

        SUBR    R1,     R1                      ; 65CE   0109
        ADDR    R7,     R4                      ; 65CF   00FC
        ADDR    R7,     R4                      ; 65D0   00FC
        INCR    R2                              ; 65D1   000A
        INCR    R7                              ; 65D2   000F
        ADDR    R4,     R7                      ; 65D3   00E7
L_65D4:
        ADDR    R4,     R7                      ; 65D4   00E7

        INCR    R4                              ; 65D5   000C
        SUBR    R0,     R7                      ; 65D6   0107

        DECLE   $00FC,  $0000                   ; 65D7   00FC 0000

        INCR    R2                              ; 65D9   000A
        ADDR    R2,     R3                      ; 65DA   00D3
        ADDR    R4,     R5                      ; 65DB   00E5
        ADDR    R7,     R4                      ; 65DC   00FC
        INCR    R4                              ; 65DD   000C
        SUBR    R1,     R1                      ; 65DE   0109
        ADDR    R7,     R4                      ; 65DF   00FC

        JSRD    R4,     .EXEC.80F               ; 65E0   0004 001A 000F

        ADDR    R4,     R7                      ; 65E3   00E7

        DECLE   $0011,  $001C,  $0108,  $0000   ; 65E4   0011 001C 0108 0000
L_65E8:
        JSRD    R4,     .EXEC.05C               ; 65E8   0004 0012 005C
        DECLE   $00FC,  $0013,  $0014,  $0109   ; 65EB   00FC 0013 0014 0109
        DECLE   $0004                           ; 65EF   0004

        JSRD    R4,     .EXEC.00F               ; 65F0   0004 0012 000F

        DECR    R1                              ; 65F3   0011
        DECR    R1                              ; 65F4   0011
        DECR    R4                              ; 65F5   0014
        BMI     L_65E8                          ; 65F6   022B 000F

        NEGR    R3                              ; 65F8   0023
        ADCR    R7                              ; 65F9   002F

        ADCR    R4                              ; 65FA   002C
L_65FB:
        NEGR    R5                              ; 65FB   0025
        DECLE   $0023,  $002F,  $0000,  $0030   ; 65FC   0023 002F 0000 0030
        DECLE   $0032,  $0025,  $0033,  $0025   ; 6600   0032 0025 0033 0025
        DECLE   $002E,  $0034,  $0033,  $026B   ; 6604   002E 0034 0033 026B
        DECLE   $0007,  $0036,  $0025,  $002E   ; 6608   0007 0036 0025 002E
        DECLE   $0034,  $0035                   ; 660C   0034 0035

        GSWD    R2                              ; 660E   0032
        NEGR    R5                              ; 660F   0025
        ADD@    R1,     R5                      ; 6610   02CD
        INCR    R4                              ; 6611   000C
        NEGR    R0                              ; 6612   0020
        NEGR    R3                              ; 6613   0023
        ADCR    R7                              ; 6614   002F

        ADCR    R4                              ; 6615   002C
L_6616:
        NEGR    R5                              ; 6616   0025
        DECLE   $0023,  $002F,  $0000,  $0011   ; 6617   0023 002F 0000 0011
        DECLE   $0019,  $0018,  $0012,  $027A   ; 661B   0019 0018 0012 027A
        DECLE   $0011,  $002C,  $0045,  $0056   ; 661F   0011 002C 0045 0056
        DECLE   $0045,  $004C,  $0000,  $0000   ; 6623   0045 004C 0000 0000
        DECLE   $0000,  $0023,  $004F,  $004D   ; 6627   0000 0023 004F 004D
        DECLE   $0050,  $004C,  $0045,  $0054   ; 662B   0050 004C 0045 0054
        DECLE   $0045,  $0000,  $0279,  $000B   ; 662F   0045 0000 0279 000B
        DECLE   $002C,  $0045,  $0056,  $0045   ; 6633   002C 0045 0056 0045
        DECLE   $004C,  $0000,  $0033,  $0043   ; 6637   004C 0000 0033 0043
        DECLE   $004F,  $0052,  $0045,  $028D   ; 663B   004F 0052 0045 028D
        DECLE   $000B,  $0034,  $0049,  $004D   ; 663F   000B 0034 0049 004D
        DECLE   $0045,  $0053,  $0000,  $0022   ; 6643   0045 0053 0000 0022
        DECLE   $004F,  $004E,  $0055,  $0053   ; 6647   004F 004E 0055 0053
        DECLE   $02AD,  $0006,  $00CD,  $00CD   ; 664B   02AD 0006 00CD 00CD
        DECLE   $00CD,  $00CD,  $00CD,  $00CD   ; 664F   00CD 00CD 00CD 00CD
        DECLE   $02B9,  $0006,  $0025,  $0051   ; 6653   02B9 0006 0025 0051
        DECLE   $0055,  $0041,  $004C,  $0053   ; 6657   0055 0041 004C 0053
        DECLE   $0000,  $023E,  $000F,  $0011   ; 665B   0000 023E 000F 0011
        DECLE   $0000,  $002F,  $0032,  $0000   ; 665F   0000 002F 0032 0000
        DECLE   $0012,  $0000,  $0030,  $002C   ; 6663   0012 0000 0030 002C
        DECLE   $0021,  $0039,  $0025,  $0032   ; 6667   0021 0039 0025 0032
        DECLE   $0033,  $001F                   ; 666B   0033 001F

        MVI@    R1,     R7                      ; 666D   028F

        DECLE   $000C,  $0033,  $002B,  $0029   ; 666E   000C 0033 002B 0029
        DECLE   $002C,  $002C,  $0000,  $0011   ; 6672   002C 002C 0000 0011
        DECLE   $0000,  $000D,  $0000,  $0014   ; 6676   0000 000D 0000 0014
        DECLE   $001F,  $0292,  $000A,  $0027   ; 667A   001F 0292 000A 0027
        DECLE   $0021,  $002D,  $0025,  $0000   ; 667E   0021 002D 0025 0000
        DECLE   $0000,  $002F,  $0036           ; 6682   0000 002F 0036

        NEGR    R5                              ; 6685   0025
        GSWD    R2                              ; 6686   0032
L_6687:
        MVI@    R5,     R4                      ; 6687   02AC
        TSTR    R4                              ; 6688   00A4
        BEQ     L_6699                          ; 6689   0204 000E

        PSHR    R5                              ; 668B   0275
        MVI@    R4,     R5                      ; 668C   02A5
        MVI@    R4,     R3                      ; 668D   02A3
L_668E:
        MVI@    R4,     R2                      ; 668E   02A2
        SLL     R2,     2                       ; 668F   004E
        SLL     R2,     1                       ; 6690   004A
        XORR    R0,     R2                      ; 6691   01C2
        MVO@    R2,     R5                      ; 6692   026A
        DECR    R3                              ; 6693   0013
        BNEQ    L_668E                          ; 6694   022C 0007

        PULR    R5                              ; 6696   02B5
        B       L_6687                          ; 6697   0220 0011
L_6699:
        MOVR    R5,     R7                      ; 6699   00AF

L_669A:
        MVI     G_0108, R2                      ; 669A   0282 0108
        DECR    R2                              ; 669C   0012
        BMI     L_66E0                          ; 669D   020B 0041

        MVO     R2,     G_0108                  ; 669F   0242 0108
        BNEQ    L_66E0                          ; 66A1   020C 003D

        CLRR    R3                              ; 66A3   01DB
        MVO     R3,     .PSG0.chn_a_vol         ; 66A4   0243 01FB
        MVI     G_0109, R3                      ; 66A6   0283 0109
        TSTR    R3                              ; 66A8   009B
        BEQ     L_66B2                          ; 66A9   0204 0007

        MVO     R3,     G_0108                  ; 66AB   0243 0108
        CLRR    R3                              ; 66AD   01DB
        MVO     R3,     G_0109                  ; 66AE   0243 0109
        B       L_66E0                          ; 66B0   0200 002E

L_66B2:
        MVII    #$010A, R4                      ; 66B2   02BC 010A
        SDBD                                    ; 66B4   0001
        MVI@    R4,     R3                      ; 66B5   02A3
L_66B6:
        MOVR    R3,     R4                      ; 66B6   009C
        MVI@    R4,     R3                      ; 66B7   02A3
        TSTR    R3                              ; 66B8   009B
        BEQ     L_66DA                          ; 66B9   0204 001F

        MVO     R3,     G_0108                  ; 66BB   0243 0108
        CMPI    #$0200, R3                      ; 66BD   037B 0200
        BGE     L_66DA                          ; 66BF   020D 0019

        DECR    R3                              ; 66C1   0013
        BNEQ    L_66C8                          ; 66C2   020C 0004

        SDBD                                    ; 66C4   0001
        MVI@    R4,     R3                      ; 66C5   02A3
        B       L_66B6                          ; 66C6   0220 0011

L_66C8:
        INCR    R3                              ; 66C8   000B
        MVII    #$0002, R2                      ; 66C9   02BA 0002
        SUBR    R2,     R3                      ; 66CB   0113
        MVO     R3,     G_0108                  ; 66CC   0243 0108
        MVO     R2,     G_0109                  ; 66CE   0242 0109
        MVI@    R4,     R2                      ; 66D0   02A2
        MVO     R2,     .PSG0.chn_a_lo          ; 66D1   0242 01F0
        SWAP    R2,     1                       ; 66D3   0042
        MVO     R2,     .PSG0.chn_a_hi          ; 66D4   0242 01F4
        MVII    #$000E, R2                      ; 66D6   02BA 000E
        MVO     R2,     .PSG0.chn_a_vol         ; 66D8   0242 01FB
L_66DA:
        MOVR    R4,     R3                      ; 66DA   00A3
        MVO     R3,     G_010A                  ; 66DB   0243 010A
        SWAP    R3,     1                       ; 66DD   0043
        MVO     R3,     G_010B                  ; 66DE   0243 010B
L_66E0:
        MOVR    R5,     R7                      ; 66E0   00AF

        DECLE   $0338,  $0238,  $0374,  $0238   ; 66E1   0338 0238 0374 0238
        DECLE   $0000,  $0128,  $0350,  $0140   ; 66E5   0000 0128 0350 0140
        DECLE   $0000,  $0156,  $002A,  $0005   ; 66E9   0000 0156 002A 0005
        DECLE   $002A,  $0005,  $0042,  $0006   ; 66ED   002A 0005 0042 0006
        DECLE   $001E,  $0008,  $0042,  $0006   ; 66F1   001E 0008 0042 0006
        DECLE   $0004,  $0005,  $0000,  $0004   ; 66F5   0004 0005 0000 0004
        DECLE   $0004,  $0000,  $0008,  $0000   ; 66F9   0004 0000 0008 0000
        DECLE   $0002,  $0001,  $0000,  $0000   ; 66FD   0002 0001 0000 0000
        DECLE   $0008,  $0000,  $0003,  $0001   ; 6701   0008 0000 0003 0001
        DECLE   $0001,  $0001,  $0004,  $0004   ; 6705   0001 0001 0004 0004
        DECLE   $0008,  $0001                   ; 6709   0008 0001

        INCR    R0                              ; 670B   0008
L_670C:
        PSHR    R5                              ; 670C   0275
        PSHR    R2                              ; 670D   0272
        MVI     G_012D, R1                      ; 670E   0281 012D
        ANDI    #$00FD, R1                      ; 6710   03B9 00FD
        MVO     R1,     G_012D                  ; 6712   0241 012D
        MVII    #$034E, R3                      ; 6714   02BB 034E
        SDBD                                    ; 6716   0001
        MVII    #$66E1, R4                      ; 6717   02BC 00E1 0066
        MVII    #$000A, R2                      ; 671A   02BA 000A

        JSR     R5,     L_6756                  ; 671C   0004 0164 0356

        MVII    #$035B, R3                      ; 671F   02BB 035B
        MVII    #$0005, R2                      ; 6721   02BA 0005

        JSR     R5,     L_674D                  ; 6723   0004 0164 034D

        SDBD                                    ; 6726   0001
        MVII    #$66F5, R4                      ; 6727   02BC 00F5 0066
        MVII    #$0149, R3                      ; 672A   02BB 0149
        MVII    #$0017, R2                      ; 672C   02BA 0017

        JSR     R5,     L_6756                  ; 672E   0004 0164 0356

        MVI     G_010C, R1                      ; 6731   0281 010C
        ANDI    #$0002, R1                      ; 6733   03B9 0002
        BNEQ    L_6743                          ; 6735   020C 000C

        MVII    #$0008, R1                      ; 6737   02B9 0008
        MVO     R1,     G_015B                  ; 6739   0241 015B
        MVO     R1,     G_015C                  ; 673B   0241 015C
        MVII    #$0010, R1                      ; 673D   02B9 0010
        MVO     R1,     G_015D                  ; 673F   0241 015D
        MVO     R1,     G_015F                  ; 6741   0241 015F
L_6743:
        SDBD                                    ; 6743   0001
        MVII    #$0750, R1                      ; 6744   02B9 0050 0007
        MVO     R1,     G_0352                  ; 6747   0241 0352
        MVO     R1,     G_0356                  ; 6749   0241 0356
        PULR    R2                              ; 674B   02B2
        PULR    R7                              ; 674C   02B7

L_674D:
        PSHR    R5                              ; 674D   0275
        MOVR    R3,     R5                      ; 674E   009D
L_674F:
        SDBD                                    ; 674F   0001
        MVI@    R4,     R1                      ; 6750   02A1
        MVO@    R1,     R5                      ; 6751   0269
        DECR    R2                              ; 6752   0012
        BNEQ    L_674F                          ; 6753   022C 0005
        PULR    R7                              ; 6755   02B7

L_6756:
        PSHR    R5                              ; 6756   0275
        MOVR    R3,     R5                      ; 6757   009D
L_6758:
        MVI@    R4,     R1                      ; 6758   02A1
        MVO@    R1,     R5                      ; 6759   0269
        DECR    R2                              ; 675A   0012
        BNEQ    L_6758                          ; 675B   022C 0004
        PULR    R7                              ; 675D   02B7

L_675E:
        PSHR    R5                              ; 675E   0275
        MVI     G_034E, R1                      ; 675F   0281 034E
        ANDI    #$00FF, R1                      ; 6761   03B9 00FF
        MVI     G_014A, R0                      ; 6763   0280 014A
        SARC    R0,     1                       ; 6765   0078
        BNC     L_676D                          ; 6766   0209 0005

        CMPI    #$0044, R1                      ; 6768   0379 0044
        BPL     L_6772                          ; 676A   0203 0006
        PULR    R7                              ; 676C   02B7

L_676D:
        CMPI    #$0029, R1                      ; 676D   0379 0029
        BMI     L_6772                          ; 676F   020B 0001
        PULR    R7                              ; 6771   02B7

L_6772:
        MVII    #$0001, R1                      ; 6772   02B9 0001
        MVII    #$0149, R4                      ; 6774   02BC 0149
        MOVR    R4,     R5                      ; 6776   00A5
        MVII    #$0003, R3                      ; 6777   02BB 0003
L_6779:
        INCR    R4                              ; 6779   000C
        INCR    R5                              ; 677A   000D
        MVI@    R4,     R0                      ; 677B   02A0
        XORR    R1,     R0                      ; 677C   01C8
        MVO@    R0,     R5                      ; 677D   0268
L_677E:
        MVI@    R4,     R0                      ; 677E   02A0
        XORR    R1,     R0                      ; 677F   01C8
        MVO@    R0,     R5                      ; 6780   0268
        DECR    R3                              ; 6781   0013
        BNEQ    L_6779                          ; 6782   022C 000A

        MVII    #$0004, R3                      ; 6784   02BB 0004
        ADDR    R3,     R4                      ; 6786   00DC
        ADDR    R3,     R5                      ; 6787   00DD
        MVI@    R4,     R0                      ; 6788   02A0
        XORR    R1,     R0                      ; 6789   01C8
        MVO@    R0,     R5                      ; 678A   0268
        MVI@    R4,     R0                      ; 678B   02A0
        XORR    R1,     R0                      ; 678C   01C8
        MVO@    R0,     R5                      ; 678D   0268
        PULR    R7                              ; 678E   02B7
        BEQ     L_677E                          ; 678F   0224 0012

        ADDR    R6,     R0                      ; 6791   00F0
        INCR    R1                              ; 6792   0009
        ADDR    R4,     R2                      ; 6793   00E2
        INCR    R1                              ; 6794   0009
        ADDR    R4,     R2                      ; 6795   00E2
        DECR    R2                              ; 6796   0012
        ADDR    R4,     R2                      ; 6797   00E2
        INCR    R1                              ; 6798   0009
        ADDR    R4,     R2                      ; 6799   00E2
        INCR    R1                              ; 679A   0009
        ADDR    R4,     R2                      ; 679B   00E2
        DECR    R2                              ; 679C   0012
        ADDR    R4,     R2                      ; 679D   00E2
        INCR    R1                              ; 679E   0009
        MOVR    R5,     R2                      ; 679F   00AA
        INCR    R1                              ; 67A0   0009
        MOVR    R5,     R2                      ; 67A1   00AA
        DECR    R2                              ; 67A2   0012
        MOVR    R5,     R2                      ; 67A3   00AA
        INCR    R1                              ; 67A4   0009
        MOVR    R5,     R2                      ; 67A5   00AA
        INCR    R1                              ; 67A6   0009
        MOVR    R5,     R2                      ; 67A7   00AA
        DECR    R2                              ; 67A8   0012
        MOVR    R5,     R2                      ; 67A9   00AA
        INCR    R1                              ; 67AA   0009
        MOVR    R7,     R6                      ; 67AB   00BE
        INCR    R1                              ; 67AC   0009
        MOVR    R7,     R6                      ; 67AD   00BE
        DECR    R2                              ; 67AE   0012
        MOVR    R7,     R6                      ; 67AF   00BE
        INCR    R1                              ; 67B0   0009
        ADDR    R1,     R2                      ; 67B1   00CA
        INCR    R1                              ; 67B2   0009
        ADDR    R1,     R2                      ; 67B3   00CA
        DECR    R2                              ; 67B4   0012
        ADDR    R1,     R2                      ; 67B5   00CA
        INCR    R1                              ; 67B6   0009
        ADDR    R4,     R2                      ; 67B7   00E2
        INCR    R1                              ; 67B8   0009
        ADDR    R4,     R2                      ; 67B9   00E2
        DECR    R2                              ; 67BA   0012
        ADDR    R4,     R2                      ; 67BB   00E2
        INCR    R1                              ; 67BC   0009
        ADDR    R4,     R2                      ; 67BD   00E2
        INCR    R1                              ; 67BE   0009
        ADDR    R4,     R2                      ; 67BF   00E2
        DECR    R2                              ; 67C0   0012
        ADDR    R4,     R2                      ; 67C1   00E2
        INCR    R1                              ; 67C2   0009
        ADDR    R4,     R2                      ; 67C3   00E2
        INCR    R1                              ; 67C4   0009
        ADDR    R4,     R2                      ; 67C5   00E2
        DECR    R2                              ; 67C6   0012
        ADDR    R4,     R2                      ; 67C7   00E2
        DECR    R2                              ; 67C8   0012
        MOVR    R6,     R4                      ; 67C9   00B4
        DECR    R2                              ; 67CA   0012
        MOVR    R6,     R4                      ; 67CB   00B4
        INCR    R1                              ; 67CC   0009
        MOVR    R5,     R2                      ; 67CD   00AA
        INCR    R1                              ; 67CE   0009
        MOVR    R5,     R2                      ; 67CF   00AA
        DECR    R2                              ; 67D0   0012
        MOVR    R5,     R2                      ; 67D1   00AA
        DECR    R2                              ; 67D2   0012
        MOVR    R5,     R2                      ; 67D3   00AA
        DECR    R2                              ; 67D4   0012
        MOVR    R5,     R2                      ; 67D5   00AA
        INCR    R1                              ; 67D6   0009
        MOVR    R7,     R6                      ; 67D7   00BE
        INCR    R1                              ; 67D8   0009
        MOVR    R5,     R2                      ; 67D9   00AA
        DECR    R2                              ; 67DA   0012
        MOVR    R7,     R6                      ; 67DB   00BE
        DECR    R2                              ; 67DC   0012
        ADDR    R1,     R2                      ; 67DD   00CA
L_67DE:
        INCR    R1                              ; 67DE   0009
        DECLE   $00CA,  $0051,  $00E2,  $026C   ; 67DF   00CA 0051 00E2 026C
        DECLE   $0001                           ; 67E3   0001

        MOVR    R1,     R7                      ; 67E4   008F

        SLR     R3,     2                       ; 67E5   0067
        BEQ     L_67DE                          ; 67E6   0224 0009

        SAR     R3,     1                       ; 67E8   006B
        INCR    R1                              ; 67E9   0009
        SAR     R3,     1                       ; 67EA   006B
        INCR    R1                              ; 67EB   0009
        SARC    R0,     1                       ; 67EC   0078
        INCR    R1                              ; 67ED   0009
        RRC     R1,     1                       ; 67EE   0071
        DECR    R2                              ; 67EF   0012
        SAR     R3,     1                       ; 67F0   006B
        DECR    R2                              ; 67F1   0012
        MOVR    R6,     R4                      ; 67F2   00B4
        DECR    R2                              ; 67F3   0012
        MOVR    R6,     R4                      ; 67F4   00B4
        INCR    R1                              ; 67F5   0009
        SAR     R3,     1                       ; 67F6   006B
        INCR    R1                              ; 67F7   0009
        MOVR    R1,     R7                      ; 67F8   008F

        INCR    R1                              ; 67F9   0009
        SARC    R0,     1                       ; 67FA   0078
        INCR    R1                              ; 67FB   0009
        SAR     R3,     1                       ; 67FC   006B
        INCR    R1                              ; 67FD   0009
        SARC    R0,     1                       ; 67FE   0078
        INCR    R1                              ; 67FF   0009
        MOVR    R4,     R0                      ; 6800   00A0
        INCR    R1                              ; 6801   0009
        MOVR    R1,     R7                      ; 6802   008F

        INCR    R1                              ; 6803   0009
        MOVR    R1,     R7                      ; 6804   008F

        INCR    R1                              ; 6805   0009
        MOVR    R4,     R0                      ; 6806   00A0
        INCR    R1                              ; 6807   0009
        MOVR    R2,     R7                      ; 6808   0097

        DECR    R2                              ; 6809   0012
        MOVR    R1,     R7                      ; 680A   008F

        DECR    R2                              ; 680B   0012
        ADDR    R4,     R2                      ; 680C   00E2
        DECR    R2                              ; 680D   0012
        ADDR    R4,     R2                      ; 680E   00E2
        INCR    R1                              ; 680F   0009
        MOVR    R1,     R7                      ; 6810   008F

        INCR    R1                              ; 6811   0009
        MOVR    R7,     R6                      ; 6812   00BE
        INCR    R1                              ; 6813   0009
        MOVR    R4,     R0                      ; 6814   00A0
        INCR    R1                              ; 6815   0009
        MOVR    R1,     R7                      ; 6816   008F

        INCR    R1                              ; 6817   0009
        MOVR    R4,     R0                      ; 6818   00A0
        INCR    R1                              ; 6819   0009
        MOVR    R6,     R4                      ; 681A   00B4
        INCR    R1                              ; 681B   0009
        SAR     R3,     1                       ; 681C   006B
        INCR    R1                              ; 681D   0009
        SAR     R3,     1                       ; 681E   006B
        INCR    R1                              ; 681F   0009
        SARC    R0,     1                       ; 6820   0078
        INCR    R1                              ; 6821   0009
        RRC     R1,     1                       ; 6822   0071
        DECR    R2                              ; 6823   0012
        SAR     R3,     1                       ; 6824   006B
        DECR    R2                              ; 6825   0012
        MOVR    R6,     R4                      ; 6826   00B4
        DECR    R2                              ; 6827   0012
        MOVR    R6,     R4                      ; 6828   00B4
        INCR    R1                              ; 6829   0009
        SAR     R3,     1                       ; 682A   006B
        INCR    R1                              ; 682B   0009
        MOVR    R1,     R7                      ; 682C   008F

        INCR    R1                              ; 682D   0009
        SARC    R0,     1                       ; 682E   0078
        INCR    R1                              ; 682F   0009
        SAR     R3,     1                       ; 6830   006B
        INCR    R1                              ; 6831   0009
        SARC    R0,     1                       ; 6832   0078
        INCR    R1                              ; 6833   0009
        MOVR    R4,     R0                      ; 6834   00A0
        INCR    R1                              ; 6835   0009
        MOVR    R1,     R7                      ; 6836   008F

        INCR    R1                              ; 6837   0009
        MOVR    R1,     R7                      ; 6838   008F

        INCR    R1                              ; 6839   0009
        MOVR    R4,     R0                      ; 683A   00A0
        INCR    R1                              ; 683B   0009
        MOVR    R2,     R7                      ; 683C   0097

        DECR    R2                              ; 683D   0012
        MOVR    R1,     R7                      ; 683E   008F

        DECR    R2                              ; 683F   0012
        ADDR    R4,     R2                      ; 6840   00E2
        DECR    R2                              ; 6841   0012
        ADDR    R4,     R2                      ; 6842   00E2
        INCR    R1                              ; 6843   0009
        MOVR    R1,     R7                      ; 6844   008F

        INCR    R1                              ; 6845   0009
        MOVR    R7,     R6                      ; 6846   00BE
        INCR    R1                              ; 6847   0009
        MOVR    R4,     R0                      ; 6848   00A0
        INCR    R1                              ; 6849   0009
        MOVR    R1,     R7                      ; 684A   008F

        DECLE   $0009,  $00A0,  $0009,  $00B4   ; 684B   0009 00A0 0009 00B4
        DECLE   $0009,  $00F0,  $0009,  $00F0   ; 684F   0009 00F0 0009 00F0
        DECLE   $0009,  $00F0,  $0009,  $00F0   ; 6853   0009 00F0 0009 00F0
        DECLE   $0009,  $00F0,  $0009,  $00F0   ; 6857   0009 00F0 0009 00F0
        DECLE   $0009,  $00F0,  $0009,  $00F0   ; 685B   0009 00F0 0009 00F0
        DECLE   $0009,  $00FE,  $0009,  $00FE   ; 685F   0009 00FE 0009 00FE
        DECLE   $0009,  $00FE,  $0009,  $00FE   ; 6863   0009 00FE 0009 00FE
        DECLE   $0009,  $00FE,  $0009,  $00FE   ; 6867   0009 00FE 0009 00FE
        DECLE   $0009,  $00FE,  $0009,  $00FE   ; 686B   0009 00FE 0009 00FE
        DECLE   $0009,  $00E2,  $0009,  $00E2   ; 686F   0009 00E2 0009 00E2
        DECLE   $0009,  $00E2,  $0009,  $00E2   ; 6873   0009 00E2 0009 00E2
        DECLE   $0009,  $00E2,  $0009,  $00E2   ; 6877   0009 00E2 0009 00E2
        DECLE   $0009,  $00E2,  $0009,  $00E2   ; 687B   0009 00E2 0009 00E2
        DECLE   $0009,  $00F0,  $0009,  $011D   ; 687F   0009 00F0 0009 011D
        DECLE   $0009,  $00F0,  $0009,  $011D   ; 6883   0009 00F0 0009 011D
        DECLE   $0009,  $00F0,  $0009,  $011D   ; 6887   0009 00F0 0009 011D
        DECLE   $0009,  $00F0,  $0009,  $011D   ; 688B   0009 00F0 0009 011D
        DECLE   $026C,  $0001,  $00E6,  $0067   ; 688F   026C 0001 00E6 0067
        DECLE   $0218                           ; 6893   0218

        CLRC                                    ; 6894   0006
        ADDR    R2,     R6                      ; 6895   00D6
        CLRC                                    ; 6896   0006
        ADDR    R2,     R6                      ; 6897   00D6
        INCR    R4                              ; 6898   000C
        ADDR    R2,     R6                      ; 6899   00D6
        CLRC                                    ; 689A   0006
        ADDR    R2,     R6                      ; 689B   00D6
        CLRC                                    ; 689C   0006
        ADDR    R2,     R6                      ; 689D   00D6
        INCR    R4                              ; 689E   000C
        ADDR    R2,     R6                      ; 689F   00D6
        CLRC                                    ; 68A0   0006
        ADDR    R2,     R6                      ; 68A1   00D6
        CLRC                                    ; 68A2   0006
        ADDR    R2,     R6                      ; 68A3   00D6
        INCR    R4                              ; 68A4   000C
        MOVR    R4,     R0                      ; 68A5   00A0
        INCR    R4                              ; 68A6   000C
        MOVR    R1,     R7                      ; 68A7   008F

        INCR    R4                              ; 68A8   000C
        SARC    R3,     2                       ; 68A9   007F
        CLRC                                    ; 68AA   0006
        ADDR    R2,     R6                      ; 68AB   00D6
        CLRC                                    ; 68AC   0006
        ADDR    R2,     R6                      ; 68AD   00D6
        INCR    R4                              ; 68AE   000C
        ADDR    R2,     R6                      ; 68AF   00D6
        CLRC                                    ; 68B0   0006
        ADDR    R2,     R6                      ; 68B1   00D6
        CLRC                                    ; 68B2   0006
        ADDR    R2,     R6                      ; 68B3   00D6
        INCR    R4                              ; 68B4   000C
        MOVR    R4,     R0                      ; 68B5   00A0
        INCR    R4                              ; 68B6   000C
        SARC    R3,     2                       ; 68B7   007F
        INCR    R4                              ; 68B8   000C
        MOVR    R1,     R7                      ; 68B9   008F

        DECLE   $000C,  $00AA,  $0018,  $00D6   ; 68BA   000C 00AA 0018 00D6
        DECLE   $0000,  $020C                   ; 68BE   0000 020C

        INCR    R4                              ; 68C0   000C
        ADDR    R6,     R0                      ; 68C1   00F0
        INCR    R4                              ; 68C2   000C
        MOVR    R6,     R4                      ; 68C3   00B4
        INCR    R4                              ; 68C4   000C
        MOVR    R1,     R7                      ; 68C5   008F

        INCR    R4                              ; 68C6   000C
        SARC    R0,     1                       ; 68C7   0078
        BNEQ    L_68D6                          ; 68C8   020C 000C
        MOVR    R1,     R7                      ; 68CA   008F

        DECLE   $0048,  $0078,  $0000,  $0218   ; 68CB   0048 0078 0000 0218

        INCR    R4                              ; 68CF   000C
        MOVR    R1,     R7                      ; 68D0   008F

        INCR    R4                              ; 68D1   000C
        MOVR    R1,     R7                      ; 68D2   008F

        INCR    R4                              ; 68D3   000C
        MOVR    R1,     R7                      ; 68D4   008F

        INCR    R4                              ; 68D5   000C
L_68D6:
        MOVR    R1,     R7                      ; 68D6   008F

        INCR    R4                              ; 68D7   000C
        MOVR    R1,     R7                      ; 68D8   008F

        INCR    R4                              ; 68D9   000C
        MOVR    R6,     R4                      ; 68DA   00B4
        INCR    R4                              ; 68DB   000C
        MOVR    R4,     R0                      ; 68DC   00A0
        INCR    R4                              ; 68DD   000C
        MOVR    R6,     R4                      ; 68DE   00B4
        COMR    R0                              ; 68DF   0018
        ADDR    R2,     R6                      ; 68E0   00D6
        GSWD    R0                              ; 68E1   0030
        SUBR    R3,     R5                      ; 68E2   011D
        BLE     L_68EB                          ; 68E3   0206 0006

        SUBR    R3,     R5                      ; 68E5   011D
        CLRC                                    ; 68E6   0006
        ADDR    R2,     R6                      ; 68E7   00D6
        CLRC                                    ; 68E8   0006
        MOVR    R6,     R4                      ; 68E9   00B4
        INCR    R4                              ; 68EA   000C
L_68EB:
        MOVR    R1,     R7                      ; 68EB   008F

        INCR    R4                              ; 68EC   000C
        MOVR    R1,     R7                      ; 68ED   008F

        INCR    R4                              ; 68EE   000C
        MOVR    R1,     R7                      ; 68EF   008F

        INCR    R4                              ; 68F0   000C
        MOVR    R1,     R7                      ; 68F1   008F

        INCR    R4                              ; 68F2   000C
        MOVR    R1,     R7                      ; 68F3   008F

        INCR    R4                              ; 68F4   000C
        MOVR    R6,     R4                      ; 68F5   00B4
        INCR    R4                              ; 68F6   000C
        MOVR    R4,     R0                      ; 68F7   00A0
        INCR    R4                              ; 68F8   000C
        MOVR    R6,     R4                      ; 68F9   00B4
        SLL     R0,     1                       ; 68FA   0048
        ADDR    R2,     R6                      ; 68FB   00D6
        BLE     L_6904                          ; 68FC   0206 0006

        SUBR    R3,     R5                      ; 68FE   011D
        CLRC                                    ; 68FF   0006
        ADDR    R2,     R6                      ; 6900   00D6
        CLRC                                    ; 6901   0006
        MOVR    R6,     R4                      ; 6902   00B4
        INCR    R4                              ; 6903   000C
L_6904:
        MOVR    R1,     R7                      ; 6904   008F

        INCR    R4                              ; 6905   000C
        MOVR    R1,     R7                      ; 6906   008F

        INCR    R4                              ; 6907   000C
        MOVR    R1,     R7                      ; 6908   008F

        INCR    R4                              ; 6909   000C
        MOVR    R1,     R7                      ; 690A   008F

        INCR    R4                              ; 690B   000C
        MOVR    R1,     R7                      ; 690C   008F

        INCR    R4                              ; 690D   000C
        MOVR    R6,     R4                      ; 690E   00B4
        INCR    R4                              ; 690F   000C
        MOVR    R4,     R0                      ; 6910   00A0
        INCR    R4                              ; 6911   000C
        MOVR    R6,     R4                      ; 6912   00B4
        COMR    R0                              ; 6913   0018
        ADDR    R2,     R6                      ; 6914   00D6
        GSWD    R0                              ; 6915   0030
        SUBR    R3,     R5                      ; 6916   011D
        BLE     L_691F                          ; 6917   0206 0006

        SUBR    R3,     R5                      ; 6919   011D
        CLRC                                    ; 691A   0006
        ADDR    R2,     R6                      ; 691B   00D6
        CLRC                                    ; 691C   0006
        MOVR    R6,     R4                      ; 691D   00B4
        INCR    R4                              ; 691E   000C
L_691F:
        MOVR    R1,     R7                      ; 691F   008F

        INCR    R4                              ; 6920   000C
        MOVR    R1,     R7                      ; 6921   008F

        INCR    R4                              ; 6922   000C
        MOVR    R1,     R7                      ; 6923   008F

        INCR    R4                              ; 6924   000C
        MOVR    R1,     R7                      ; 6925   008F

        INCR    R4                              ; 6926   000C
        MOVR    R1,     R7                      ; 6927   008F

        DECLE   $000C,  $00A0,  $000C,  $00B4   ; 6928   000C 00A0 000C 00B4
        DECLE   $000C,  $00BE,  $0048,  $00D6   ; 692C   000C 00BE 0048 00D6
        DECLE   $0218                           ; 6930   0218

        CLRC                                    ; 6931   0006
        MOVR    R1,     R7                      ; 6932   008F

        CLRC                                    ; 6933   0006
        MOVR    R0,     R7                      ; 6934   0087

        CLRC                                    ; 6935   0006
        MOVR    R1,     R7                      ; 6936   008F

        CLRC                                    ; 6937   0006
        MOVR    R2,     R7                      ; 6938   0097

        CLRC                                    ; 6939   0006
        MOVR    R1,     R7                      ; 693A   008F

        CLRC                                    ; 693B   0006
        MOVR    R0,     R7                      ; 693C   0087

        CLRC                                    ; 693D   0006
        MOVR    R1,     R7                      ; 693E   008F

        CLRC                                    ; 693F   0006
        MOVR    R2,     R7                      ; 6940   0097

        CLRC                                    ; 6941   0006
        MOVR    R1,     R7                      ; 6942   008F

        CLRC                                    ; 6943   0006
        MOVR    R0,     R7                      ; 6944   0087

        CLRC                                    ; 6945   0006
        MOVR    R1,     R7                      ; 6946   008F

        CLRC                                    ; 6947   0006
        MOVR    R2,     R7                      ; 6948   0097

        CLRC                                    ; 6949   0006
        MOVR    R1,     R7                      ; 694A   008F

        CLRC                                    ; 694B   0006
        MOVR    R0,     R7                      ; 694C   0087

        CLRC                                    ; 694D   0006
        MOVR    R1,     R7                      ; 694E   008F

        CLRC                                    ; 694F   0006
        MOVR    R2,     R7                      ; 6950   0097

        CLRC                                    ; 6951   0006
        MOVR    R1,     R7                      ; 6952   008F

        CLRC                                    ; 6953   0006
        MOVR    R0,     R7                      ; 6954   0087

        CLRC                                    ; 6955   0006
        MOVR    R1,     R7                      ; 6956   008F

        CLRC                                    ; 6957   0006
        MOVR    R2,     R7                      ; 6958   0097

        CLRC                                    ; 6959   0006
        MOVR    R1,     R7                      ; 695A   008F

        CLRC                                    ; 695B   0006
        MOVR    R0,     R7                      ; 695C   0087

        CLRC                                    ; 695D   0006
        MOVR    R1,     R7                      ; 695E   008F

        CLRC                                    ; 695F   0006
        MOVR    R2,     R7                      ; 6960   0097

        CLRC                                    ; 6961   0006
        MOVR    R1,     R7                      ; 6962   008F

        CLRC                                    ; 6963   0006
        MOVR    R0,     R7                      ; 6964   0087

        CLRC                                    ; 6965   0006
        MOVR    R1,     R7                      ; 6966   008F

        CLRC                                    ; 6967   0006
        MOVR    R2,     R7                      ; 6968   0097

        CLRC                                    ; 6969   0006
        MOVR    R1,     R7                      ; 696A   008F

        CLRC                                    ; 696B   0006
        MOVR    R0,     R7                      ; 696C   0087

        CLRC                                    ; 696D   0006
        MOVR    R1,     R7                      ; 696E   008F

        CLRC                                    ; 696F   0006
        MOVR    R2,     R7                      ; 6970   0097

        DECLE   $0248,  $0001,  $00CE,  $0068   ; 6971   0248 0001 00CE 0068
        DECLE   $0214,  $0005,  $010D,  $0005   ; 6975   0214 0005 010D 0005
        DECLE   $00F0,  $0005,  $00E2,  $0005   ; 6979   00F0 0005 00E2 0005
        DECLE   $00CA,  $000A,  $00B4,  $020A   ; 697D   00CA 000A 00B4 020A
        DECLE   $0005,  $010D,  $0005,  $00F0   ; 6981   0005 010D 0005 00F0
        DECLE   $0005,  $00E2,  $0005,  $00CA   ; 6985   0005 00E2 0005 00CA
        DECLE   $000A,  $00B4,  $020A,  $0005   ; 6989   000A 00B4 020A 0005
        DECLE   $010D,  $0005,  $00F0,  $0005   ; 698D   010D 0005 00F0 0005
        DECLE   $00E2,  $0005,  $00CA,  $0005   ; 6991   00E2 0005 00CA 0005
        DECLE   $00AA,  $0005,  $00CA,  $0005   ; 6995   00AA 0005 00CA 0005
        DECLE   $00B4,  $0005,  $00E2,  $0005   ; 6999   00B4 0005 00E2 0005
        DECLE   $00CA,  $0005,  $00F0,  $0005   ; 699D   00CA 0005 00F0 0005
        DECLE   $00E2,  $0005,  $010D,  $0005   ; 69A1   00E2 0005 010D 0005
        DECLE   $00F0,  $0005,  $012E,  $0005   ; 69A5   00F0 0005 012E 0005
        DECLE   $010D,  $0005,  $0153,  $0005   ; 69A9   010D 0005 0153 0005
        DECLE   $012E,  $0005,  $0168,  $0005   ; 69AD   012E 0005 0168 0005
        DECLE   $0153,  $0005,  $0194,  $003C   ; 69B1   0153 0005 0194 003C
        DECLE   $0168,  $0005,  $0168,  $0005   ; 69B5   0168 0005 0168 0005
        DECLE   $0194,  $0005,  $012E,  $0005   ; 69B9   0194 0005 012E 0005
        DECLE   $0153,  $003C,  $0168,  $0005   ; 69BD   0153 003C 0168 0005
        DECLE   $0168,  $0005,  $0194,  $0005   ; 69C1   0168 0005 0194 0005
        DECLE   $0153,  $0005                   ; 69C5   0153 0005

        ANDR    R2,     R4                      ; 69C7   0194
        INCR    R2                              ; 69C8   000A
        CMPR    R5,     R0                      ; 69C9   0168
        BNOV    L_69D6                          ; 69CA   020A 000A

        CMPR    R5,     R0                      ; 69CC   0168
        BNOV    L_69D9                          ; 69CD   020A 000A

        CMPR    R5,     R0                      ; 69CF   0168
        BNOV    L_69DC                          ; 69D0   020A 000A

        CMPR    R5,     R0                      ; 69D2   0168
        BNOV    L_69DF                          ; 69D3   020A 000A

        MOVR    R5,     R2                      ; 69D5   00AA
L_69D6:
        INCR    R2                              ; 69D6   000A
        MOVR    R5,     R2                      ; 69D7   00AA
        INCR    R2                              ; 69D8   000A
L_69D9:
        ADDR    R1,     R2                      ; 69D9   00CA
        INCR    R2                              ; 69DA   000A
        ADDR    R1,     R2                      ; 69DB   00CA
L_69DC:
        INCR    R2                              ; 69DC   000A
        MOVR    R6,     R4                      ; 69DD   00B4
        INCR    R2                              ; 69DE   000A
L_69DF:
        MOVR    R6,     R4                      ; 69DF   00B4
        DECLE   $000A,  $00E2,  $000A,  $00E2   ; 69E0   000A 00E2 000A 00E2
        DECLE   $000A,  $00CA,  $000A,  $00CA   ; 69E4   000A 00CA 000A 00CA
        DECLE   $000A,  $00F0,  $000A,  $00F0   ; 69E8   000A 00F0 000A 00F0
        DECLE   $0028,  $00E2,  $000A,  $00CA   ; 69EC   0028 00E2 000A 00CA
        DECLE   $000A,  $00CA,  $000A,  $00F0   ; 69F0   000A 00CA 000A 00F0
        DECLE   $000A,  $00F0,  $000A,  $00E2   ; 69F4   000A 00F0 000A 00E2
        DECLE   $000A,  $00E2,  $000A,  $010D   ; 69F8   000A 00E2 000A 010D
        DECLE   $000A,  $010D,  $000A,  $00F0   ; 69FC   000A 010D 000A 00F0
        DECLE   $000A,  $00F0,  $000A,  $011D   ; 6A00   000A 00F0 000A 011D
        DECLE   $000A,  $011D,  $0028,  $010D   ; 6A04   000A 011D 0028 010D
        DECLE   $023C,  $0001,  $0075,  $0069   ; 6A08   023C 0001 0075 0069
        DECLE   $0218                           ; 6A0C   0218

        INCR    R4                              ; 6A0D   000C
        ADDR    R2,     R6                      ; 6A0E   00D6
        INCR    R4                              ; 6A0F   000C
        MOVR    R7,     R6                      ; 6A10   00BE
        COMR    R0                              ; 6A11   0018
        MOVR    R6,     R4                      ; 6A12   00B4
        COMR    R0                              ; 6A13   0018
        MOVR    R7,     R6                      ; 6A14   00BE
        COMR    R0                              ; 6A15   0018
        ADDR    R2,     R6                      ; 6A16   00D6
        INCR    R4                              ; 6A17   000C
        ADDR    R2,     R6                      ; 6A18   00D6
        INCR    R4                              ; 6A19   000C
        MOVR    R7,     R6                      ; 6A1A   00BE
        INCR    R4                              ; 6A1B   000C
        MOVR    R4,     R0                      ; 6A1C   00A0
        INCR    R4                              ; 6A1D   000C
        MOVR    R6,     R4                      ; 6A1E   00B4
        INCR    R4                              ; 6A1F   000C
        MOVR    R4,     R0                      ; 6A20   00A0
        INCR    R4                              ; 6A21   000C
        MOVR    R6,     R4                      ; 6A22   00B4
        INCR    R4                              ; 6A23   000C
        MOVR    R7,     R6                      ; 6A24   00BE
        INCR    R4                              ; 6A25   000C
        ADDR    R2,     R6                      ; 6A26   00D6
        INCR    R4                              ; 6A27   000C
        MOVR    R7,     R6                      ; 6A28   00BE
        INCR    R4                              ; 6A29   000C
        ADDR    R2,     R6                      ; 6A2A   00D6
        INCR    R4                              ; 6A2B   000C
        MOVR    R1,     R7                      ; 6A2C   008F

        INCR    R4                              ; 6A2D   000C
        MOVR    R1,     R7                      ; 6A2E   008F

        INCR    R4                              ; 6A2F   000C
        MOVR    R7,     R6                      ; 6A30   00BE
        INCR    R4                              ; 6A31   000C
        MOVR    R7,     R6                      ; 6A32   00BE
        INCR    R4                              ; 6A33   000C
        ADDR    R7,     R6                      ; 6A34   00FE
        INCR    R4                              ; 6A35   000C
        ADDR    R7,     R6                      ; 6A36   00FE
        INCR    R4                              ; 6A37   000C
        CMPR    R2,     R3                      ; 6A38   0153
        INCR    R4                              ; 6A39   000C
        CMPR    R2,     R3                      ; 6A3A   0153
        COMR    R0                              ; 6A3B   0018
        ADDR    R4,     R2                      ; 6A3C   00E2
        INCR    R4                              ; 6A3D   000C
        CMPR    R0,     R0                      ; 6A3E   0140
        INCR    R4                              ; 6A3F   000C
        SUBR    R3,     R5                      ; 6A40   011D
        INCR    R4                              ; 6A41   000C
        ADDR    R7,     R6                      ; 6A42   00FE
        INCR    R4                              ; 6A43   000C
        SUBR    R3,     R5                      ; 6A44   011D
        INCR    R4                              ; 6A45   000C
        ADDR    R7,     R6                      ; 6A46   00FE
        INCR    R4                              ; 6A47   000C
        ADDR    R4,     R2                      ; 6A48   00E2
        INCR    R4                              ; 6A49   000C
        MOVR    R1,     R7                      ; 6A4A   008F

        INCR    R4                              ; 6A4B   000C
        MOVR    R0,     R7                      ; 6A4C   0087

        INCR    R4                              ; 6A4D   000C
        MOVR    R1,     R7                      ; 6A4E   008F

        INCR    R4                              ; 6A4F   000C
        MOVR    R4,     R0                      ; 6A50   00A0
        INCR    R4                              ; 6A51   000C
        MOVR    R1,     R7                      ; 6A52   008F

        DECLE   $000C,  $00A0,  $000C,  $00B4   ; 6A53   000C 00A0 000C 00B4
        DECLE   $000C,  $00BE,  $000C,  $00A0   ; 6A57   000C 00BE 000C 00A0
        DECLE   $000C,  $00B4,  $000C,  $00BE   ; 6A5B   000C 00B4 000C 00BE
        DECLE   $000C,  $00D6,  $000C,  $00B4   ; 6A5F   000C 00D6 000C 00B4
        DECLE   $000C,  $00BE,  $000C,  $00D6   ; 6A63   000C 00BE 000C 00D6
        DECLE   $000C,  $00F0,  $000C,  $010D   ; 6A67   000C 00F0 000C 010D
        DECLE   $000C,  $00F0,  $000C,  $00D6   ; 6A6B   000C 00F0 000C 00D6
        DECLE   $000C,  $00BE,  $000C,  $00B4   ; 6A6F   000C 00BE 000C 00B4
        DECLE   $000C,  $00BE,  $000C,  $00B4   ; 6A73   000C 00BE 000C 00B4
        DECLE   $000C,  $00A0,  $0248,  $0001   ; 6A77   000C 00A0 0248 0001

        INCR    R4                              ; 6A7B   000C
        SAR     R2,     1                       ; 6A7C   006A
L_6A7D:
        SDBD                                    ; 6A7D   0001
        MVI@    R5,     R1                      ; 6A7E   02A9
        MVI@    R5,     R4                      ; 6A7F   02AC
L_6A80:
        PSHR    R4                              ; 6A80   0274
        SDBD                                    ; 6A81   0001
        MVII    #$6AB6, R4                      ; 6A82   02BC 00B6 006A
        SDBD                                    ; 6A85   0001
        MVI@    R4,     R1                      ; 6A86   02A1
        MVO     R4,     G_0317                  ; 6A87   0244 0317
        PULR    R4                              ; 6A89   02B4
        PSHR    R5                              ; 6A8A   0275
        CLRR    R2                              ; 6A8B   01D2
        CLRR    R3                              ; 6A8C   01DB
L_6A8D:
        SUBR    R1,     R0                      ; 6A8D   0108
        BNC     L_6A93                          ; 6A8E   0209 0003

        INCR    R3                              ; 6A90   000B
        B       L_6A8D                          ; 6A91   0220 0005

L_6A93:
        ADDR    R1,     R0                      ; 6A93   00C8

        JSR     R5,     L_6AA6                  ; 6A94   0004 0168 02A6

        PSHR    R4                              ; 6A97   0274
        MVI     G_0317, R4                      ; 6A98   0284 0317
        MVI@    R4,     R1                      ; 6A9A   02A1
        SDBD                                    ; 6A9B   0001
        CMPI    #$6ABC, R4                      ; 6A9C   037C 00BC 006A
        MVO     R4,     G_0317                  ; 6A9F   0244 0317
        PULR    R4                              ; 6AA1   02B4
        BNEQ    L_6A8D                          ; 6AA2   022C 0016

        MOVR    R0,     R3                      ; 6AA4   0083
        PULR    R5                              ; 6AA5   02B5
L_6AA6:
        TSTR    R2                              ; 6AA6   0092
        BNEQ    L_6AAD                          ; 6AA7   020C 0004

        TSTR    R3                              ; 6AA9   009B
        BEQ     L_6AB3                          ; 6AAA   0204 0007

        INCR    R2                              ; 6AAC   000A
L_6AAD:
        ADDI    #$0010, R3                      ; 6AAD   02FB 0010
        SLL     R3,     1                       ; 6AAF   004B
        SLL     R3,     2                       ; 6AB0   004F
        ADDI    #$0007, R3                      ; 6AB1   02FB 0007
L_6AB3:
        MVO@    R3,     R4                      ; 6AB3   0263
        CLRR    R3                              ; 6AB4   01DB
        MOVR    R5,     R7                      ; 6AB5   00AF

        DECLE   $0010,  $0027                   ; 6AB6   0010 0027

        XOR@    R5,     R0                      ; 6AB8   03E8
        SLR     R0,     2                       ; 6AB9   0064
        INCR    R2                              ; 6ABA   000A
L_6ABB:
        PSHR    R1                              ; 6ABB   0271
        MVII    #$0010, R1                      ; 6ABC   02B9 0010
        MVO     R1,     .PSG0.chn_b_lo          ; 6ABE   0241 01F1
        MVII    #$0004, R1                      ; 6AC0   02B9 0004
        MVO     R1,     .PSG0.chn_b_hi          ; 6AC2   0241 01F5
        MVII    #$0010, R1                      ; 6AC4   02B9 0010
        MVO     R1,     .PSG0.envlp_hi          ; 6AC6   0241 01F7
        MVII    #$0030, R1                      ; 6AC8   02B9 0030
        MVO     R1,     .PSG0.chn_b_vol         ; 6ACA   0241 01FC
        MVII    #$0000, R1                      ; 6ACC   02B9 0000
        MVO     R1,     .PSG0.envelope          ; 6ACE   0241 01FA
        MVII    #$0038, R1                      ; 6AD0   02B9 0038
        MVO     R1,     .PSG0.chan_enable       ; 6AD2   0241 01F8
        MVI     .PSG0.chn_c_vol,R1              ; 6AD4   0281 01FD
        ANDI    #$000F, R1                      ; 6AD6   03B9 000F
        MVO     R1,     .PSG0.chn_c_vol         ; 6AD8   0241 01FD
        PULR    R1                              ; 6ADA   02B1
        MOVR    R5,     R7                      ; 6ADB   00AF

L_6ADC:
        PSHR    R1                              ; 6ADC   0271
        CLRR    R1                              ; 6ADD   01C9
        MVO     R1,     .PSG0.chn_c_hi          ; 6ADE   0241 01F6
        MVO     R1,     .PSG0.chn_c_lo          ; 6AE0   0241 01F2
        MVII    #$0000, R1                      ; 6AE2   02B9 0000
        MVO     R1,     .PSG0.envlp_lo          ; 6AE4   0241 01F3
        MVII    #$0038, R1                      ; 6AE6   02B9 0038
        MVO     R1,     .PSG0.envlp_hi          ; 6AE8   0241 01F7
        MVII    #$0030, R1                      ; 6AEA   02B9 0030
        MVO     R1,     .PSG0.chn_c_vol         ; 6AEC   0241 01FD
        MVII    #$0000, R1                      ; 6AEE   02B9 0000
        MVO     R1,     .PSG0.envelope          ; 6AF0   0241 01FA
        MVII    #$003A, R1                      ; 6AF2   02B9 003A
        MVO     R1,     .PSG0.chan_enable       ; 6AF4   0241 01F8
        PULR    R1                              ; 6AF6   02B1
        MOVR    R5,     R7                      ; 6AF7   00AF

L_6AF8:
        PSHR    R1                              ; 6AF8   0271
        MVII    #$0001, R1                      ; 6AF9   02B9 0001
        MVO     R1,     .PSG0.noise             ; 6AFB   0241 01F9
        MVII    #$000D, R1                      ; 6AFD   02B9 000D
        MVO     R1,     .PSG0.chn_b_vol         ; 6AFF   0241 01FC
        MVII    #$002A, R1                      ; 6B01   02B9 002A
        MVO     R1,     .PSG0.chan_enable       ; 6B03   0241 01F8
        PULR    R1                              ; 6B05   02B1
        MOVR    R5,     R7                      ; 6B06   00AF

L_6B07:
        PSHR    R1                              ; 6B07   0271
        MVII    #$0038, R1                      ; 6B08   02B9 0038
        MVO     R1,     .PSG0.chan_enable       ; 6B0A   0241 01F8
        CLRR    R1                              ; 6B0C   01C9
        MVO     R1,     .PSG0.chn_b_vol         ; 6B0D   0241 01FC
        PULR    R1                              ; 6B0F   02B1
        MOVR    R5,     R7                      ; 6B10   00AF

L_6B11:
        PSHR    R1                              ; 6B11   0271
        MVII    #$00E5, R1                      ; 6B12   02B9 00E5
        MVO     R1,     .PSG0.chn_c_lo          ; 6B14   0241 01F2
        MVII    #$0000, R1                      ; 6B16   02B9 0000
        MVO     R1,     .PSG0.chn_c_hi          ; 6B18   0241 01F6
        MVII    #$0000, R1                      ; 6B1A   02B9 0000
        MVO     R1,     .PSG0.envlp_lo          ; 6B1C   0241 01F3
        MVII    #$0015, R1                      ; 6B1E   02B9 0015
        MVO     R1,     .PSG0.envlp_hi          ; 6B20   0241 01F7
        MVII    #$0000, R1                      ; 6B22   02B9 0000
        MVO     R1,     .PSG0.envelope          ; 6B24   0241 01FA
        MVII    #$0030, R1                      ; 6B26   02B9 0030
        MVO     R1,     .PSG0.chn_c_vol         ; 6B28   0241 01FD
        MVII    #$003A, R1                      ; 6B2A   02B9 003A
        MVO     R1,     .PSG0.chan_enable       ; 6B2C   0241 01F8
        PULR    R1                              ; 6B2E   02B1
        MOVR    R5,     R7                      ; 6B2F   00AF

L_6B30:
        PSHR    R1                              ; 6B30   0271
        SDBD                                    ; 6B31   0001
        MVII    #$0FE4, R1                      ; 6B32   02B9 00E4 000F
        MVO     R1,     .PSG0.chn_c_lo          ; 6B35   0241 01F2
        SWAP    R1,     1                       ; 6B37   0041
        MVO     R1,     .PSG0.chn_c_hi          ; 6B38   0241 01F6
        MVII    #$000E, R1                      ; 6B3A   02B9 000E
        MVO     R1,     .PSG0.chn_c_vol         ; 6B3C   0241 01FD
        PULR    R1                              ; 6B3E   02B1
        MOVR    R5,     R7                      ; 6B3F   00AF

L_6B40:
        PSHR    R1                              ; 6B40   0271
        CLRR    R1                              ; 6B41   01C9
        MVO     R1,     .PSG0.chn_c_vol         ; 6B42   0241 01FD
        PULR    R1                              ; 6B44   02B1
        MOVR    R5,     R7                      ; 6B45   00AF

L_6B46:
        PSHR    R2                              ; 6B46   0272
        MVI@    R5,     R2                      ; 6B47   02AA
L_6B48:
        MVII    #$007F, R1                      ; 6B48   02B9 007F
L_6B4A:
        MVII    #$00FF, R0                      ; 6B4A   02B8 00FF
L_6B4C:
        DECR    R0                              ; 6B4C   0010
        BNEQ    L_6B4C                          ; 6B4D   022C 0002

        DECR    R1                              ; 6B4F   0011
        BNEQ    L_6B4A                          ; 6B50   022C 0007

        DECR    R2                              ; 6B52   0012
        BNEQ    L_6B48                          ; 6B53   022C 000C

        PULR    R2                              ; 6B55   02B2
        MOVR    R5,     R7                      ; 6B56   00AF

L_6B57:
        MVII    #$0038, R1                      ; 6B57   02B9 0038
L_6B59:
        MVII    #$00FF, R0                      ; 6B59   02B8 00FF
L_6B5B:
        DECR    R0                              ; 6B5B   0010
        BNEQ    L_6B5B                          ; 6B5C   022C 0002

        DECR    R1                              ; 6B5E   0011
        BNEQ    L_6B59                          ; 6B5F   022C 0007
        MOVR    R5,     R7                      ; 6B61   00AF

        DECLE   $0000,  $000A,  $0014,  $001E   ; 6B62   0000 000A 0014 001E
        DECLE   $0000,  $0028,  $0032,  $003C   ; 6B66   0000 0028 0032 003C
        DECLE   $0000                           ; 6B6A   0000

        SWAP    R2,     2                       ; 6B6B   0046
        RLC     R0,     1                       ; 6B6C   0050
        SLLC    R2,     1                       ; 6B6D   005A
L_6B6E:
        PSHR    R4                              ; 6B6E   0274
        PSHR    R1                              ; 6B6F   0271
        MVII    #$0172, R4                      ; 6B70   02BC 0172
        SDBD                                    ; 6B72   0001
        MVI@    R4,     R0                      ; 6B73   02A0
        TSTR    R0                              ; 6B74   0080
        BNEQ    L_6B78                          ; 6B75   020C 0001

        MOVR    R7,     R0                      ; 6B77   00B8
L_6B78:
        SLL     R0,     1                       ; 6B78   0048
        BPL     L_6B7D                          ; 6B79   0203 0002

        XORI    #$0001, R0                      ; 6B7B   03F8 0001
L_6B7D:
        MOVR    R0,     R1                      ; 6B7D   0081
        SLLC    R1,     2                       ; 6B7E   005D
        BNOV    L_6B83                          ; 6B7F   020A 0002

        XORI    #$0001, R0                      ; 6B81   03F8 0001
L_6B83:
        MVO     R0,     G_0172                  ; 6B83   0240 0172
        SWAP    R0,     1                       ; 6B85   0040
        MVO     R0,     G_0173                  ; 6B86   0240 0173
        SWAP    R0,     1                       ; 6B88   0040
        PULR    R1                              ; 6B89   02B1
        PULR    R4                              ; 6B8A   02B4
        MOVR    R5,     R7                      ; 6B8B   00AF

L_6B8C:
        PSHR    R5                              ; 6B8C   0275
        MVI     G_0114, R0                      ; 6B8D   0280 0114
        TSTR    R0                              ; 6B8F   0080
        BNEQ    L_6BA3                          ; 6B90   020C 0011

        MVI     G_033E, R0                      ; 6B92   0280 033E
        SDBD                                    ; 6B94   0001
        CMPI    #$07D0, R0                      ; 6B95   0378 00D0 0007
        BNC     L_6BA3                          ; 6B98   0209 0009

        MVI     G_0106, R0                      ; 6B9A   0280 0106
        INCR    R0                              ; 6B9C   0008
        MVO     R0,     G_0106                  ; 6B9D   0240 0106
        MVII    #$00FF, R0                      ; 6B9F   02B8 00FF
        MVO     R0,     G_0114                  ; 6BA1   0240 0114
L_6BA3:
        MVI     G_0115, R0                      ; 6BA3   0280 0115
        TSTR    R0                              ; 6BA5   0080
        BNEQ    L_6BB9                          ; 6BA6   020C 0011

        MVI     G_033F, R0                      ; 6BA8   0280 033F
        SDBD                                    ; 6BAA   0001
        CMPI    #$07D0, R0                      ; 6BAB   0378 00D0 0007
        BNC     L_6BB9                          ; 6BAE   0209 0009

        MVI     G_0107, R0                      ; 6BB0   0280 0107
        INCR    R0                              ; 6BB2   0008
        MVO     R0,     G_0107                  ; 6BB3   0240 0107
        MVII    #$00FF, R0                      ; 6BB5   02B8 00FF
        MVO     R0,     G_0115                  ; 6BB7   0240 0115
L_6BB9:
        PULR    R7                              ; 6BB9   02B7

L_6BBA:
        PSHR    R5                              ; 6BBA   0275
        MVI     G_0184, R5                      ; 6BBB   0285 0184
        ANDI    #$0008, R5                      ; 6BBD   03BD 0008
        BEQ     L_6D02                          ; 6BBF   0204 0141

        MVI     G_0338, R0                      ; 6BC1   0280 0338
        SARC    R0,     1                       ; 6BC3   0078
        BNC     L_6BCB                          ; 6BC4   0209 0005

        MVI     G_0174, R5                      ; 6BC6   0285 0174
        TSTR    R5                              ; 6BC8   00AD
        BNEQ    L_6D2C                          ; 6BC9   020C 0161

L_6BCB:
        MVII    #$0002, R0                      ; 6BCB   02B8 0002
        MVI     G_0338, R1                      ; 6BCD   0281 0338
        SARC    R1,     1                       ; 6BCF   0079
        BC      L_6BD4                          ; 6BD0   0201 0002

        MVII    #$0005, R0                      ; 6BD2   02B8 0005
L_6BD4:
        MVII    #$0188, R1                      ; 6BD4   02B9 0188
        ADDR    R0,     R1                      ; 6BD6   00C1
        MVI@    R1,     R2                      ; 6BD7   028A
        ANDI    #$0080, R2                      ; 6BD8   03BA 0080
        BNEQ    L_6CD4                          ; 6BDA   020C 00F8

        MVII    #$0343, R1                      ; 6BDC   02B9 0343
        MVI     G_0338, R2                      ; 6BDE   0282 0338
        SARC    R2,     1                       ; 6BE0   007A
        BC      L_6BE5                          ; 6BE1   0201 0002

        MVII    #$0342, R1                      ; 6BE3   02B9 0342
L_6BE5:
        ADDR    R0,     R1                      ; 6BE5   00C1
        MVI@    R1,     R2                      ; 6BE6   028A
        ANDI    #$0300, R2                      ; 6BE7   03BA 0300
        BEQ     L_6C4B                          ; 6BE9   0204 0060

        MVII    #$0188, R1                      ; 6BEB   02B9 0188
        ADDR    R0,     R1                      ; 6BED   00C1
        MVI@    R1,     R2                      ; 6BEE   028A
        ANDI    #$0010, R2                      ; 6BEF   03BA 0010
        BNEQ    L_6C55                          ; 6BF1   020C 0062

        MVI@    R1,     R2                      ; 6BF3   028A
        XORI    #$0010, R2                      ; 6BF4   03FA 0010
        MVO@    R2,     R1                      ; 6BF6   024A
        MVII    #$034E, R3                      ; 6BF7   02BB 034E
        MVII    #$035B, R4                      ; 6BF9   02BC 035B
        MVI     G_0338, R2                      ; 6BFB   0282 0338
        SARC    R2,     1                       ; 6BFD   007A
        BC      L_6C04                          ; 6BFE   0201 0004

        MVII    #$034C, R3                      ; 6C00   02BB 034C
        MVII    #$035A, R4                      ; 6C02   02BC 035A
L_6C04:
        ADDR    R0,     R3                      ; 6C04   00C3
        ADDR    R0,     R3                      ; 6C05   00C3
        ADDR    R0,     R4                      ; 6C06   00C4
        MVII    #$01A0, R5                      ; 6C07   02BD 01A0
        ADDR    R0,     R5                      ; 6C09   00C5
        ADDR    R0,     R5                      ; 6C0A   00C5
        ADDR    R0,     R5                      ; 6C0B   00C5
        MVI@    R3,     R2                      ; 6C0C   029A
        SDBD                                    ; 6C0D   0001
        ANDI    #$FF00, R2                      ; 6C0E   03BA 0000 00FF
        XOR@    R5,     R2                      ; 6C11   03EA
        MVO@    R2,     R3                      ; 6C12   025A
        INCR    R3                              ; 6C13   000B
        MVI@    R3,     R2                      ; 6C14   029A
        SDBD                                    ; 6C15   0001
        ANDI    #$FF00, R2                      ; 6C16   03BA 0000 00FF
        XOR@    R5,     R2                      ; 6C19   03EA
        MVO@    R2,     R3                      ; 6C1A   025A
        MOVR    R4,     R3                      ; 6C1B   00A3
        MVI@    R3,     R4                      ; 6C1C   029C
        SDBD                                    ; 6C1D   0001
        ANDI    #$F807, R4                      ; 6C1E   03BC 0007 00F8
        MVI@    R5,     R2                      ; 6C21   02AA
        SLL     R2,     2                       ; 6C22   004E
        SLL     R2,     1                       ; 6C23   004A
        XORR    R2,     R4                      ; 6C24   01D4
        MVO@    R4,     R3                      ; 6C25   025C
        MOVR    R0,     R4                      ; 6C26   0084

        JSR     R5,     L_6B6E                  ; 6C27   0004 0168 036E

        ANDI    #$0005, R0                      ; 6C2A   03B8 0005
        MVI     G_0338, R2                      ; 6C2C   0282 0338
        SARC    R2,     1                       ; 6C2E   007A
        BC      L_6C33                          ; 6C2F   0201 0002

        XORI    #$000A, R0                      ; 6C31   03F8 000A
L_6C33:
        XOR@    R1,     R0                      ; 6C33   03C8
        MVO@    R0,     R1                      ; 6C34   0248
        MOVR    R4,     R0                      ; 6C35   00A0
        MVII    #$0149, R3                      ; 6C36   02BB 0149
        MVI     G_0338, R2                      ; 6C38   0282 0338
        SARC    R2,     1                       ; 6C3A   007A
        BC      L_6C3F                          ; 6C3B   0201 0002

        MVII    #$0146, R3                      ; 6C3D   02BB 0146
L_6C3F:
        ADDR    R0,     R3                      ; 6C3F   00C3
        ADDR    R0,     R3                      ; 6C40   00C3
        ADDR    R0,     R3                      ; 6C41   00C3
        MVI@    R3,     R2                      ; 6C42   029A
        DECR    R2                              ; 6C43   0012
        BNEQ    L_6C49                          ; 6C44   020C 0003

        MVII    #$0002, R2                      ; 6C46   02BA 0002
        MVO@    R2,     R3                      ; 6C48   025A
L_6C49:
        B       L_6C55                          ; 6C49   0200 000A

L_6C4B:
        MVII    #$0188, R1                      ; 6C4B   02B9 0188
        ADDR    R0,     R1                      ; 6C4D   00C1
        MVI@    R1,     R2                      ; 6C4E   028A
        ANDI    #$0010, R2                      ; 6C4F   03BA 0010
        BEQ     L_6C55                          ; 6C51   0204 0002

        XOR@    R1,     R2                      ; 6C53   03CA
        MVO@    R2,     R1                      ; 6C54   024A
L_6C55:
        MVI     G_0338, R1                      ; 6C55   0281 0338
        SARC    R1,     1                       ; 6C57   0079
        BNC     L_6CCD                          ; 6C58   0209 0073

        MVII    #$0343, R1                      ; 6C5A   02B9 0343
        ADDR    R0,     R1                      ; 6C5C   00C1
        MVI@    R1,     R2                      ; 6C5D   028A
        ANDI    #$0080, R2                      ; 6C5E   03BA 0080
        BEQ     L_6CCD                          ; 6C60   0204 006B

        MVII    #$0188, R1                      ; 6C62   02B9 0188
        ADDR    R0,     R1                      ; 6C64   00C1
        MVI@    R1,     R2                      ; 6C65   028A
        ANDI    #$0030, R2                      ; 6C66   03BA 0030
        BNEQ    L_6CD4                          ; 6C68   020C 006A

        MVI@    R1,     R2                      ; 6C6A   028A
        XORI    #$0020, R2                      ; 6C6B   03FA 0020
        MVO@    R2,     R1                      ; 6C6D   024A
        MOVR    R0,     R2                      ; 6C6E   0082

        JSR     R5,     L_6B6E                  ; 6C6F   0004 0168 036E
        DECLE   $0083,  $0090,  $03BB,  $00FF   ; 6C72   0083 0090 03BB 00FF
        DECLE   $0343,  $0180,  $020D,  $005A   ; 6C76   0343 0180 020D 005A
        DECLE   $0284,  $012B,  $03BC,  $000F   ; 6C7A   0284 012B 03BC 000F
        DECLE   $0001                           ; 6C7E   0001

        ADDI    #$0088, R4                      ; 6C7F   02FC 0088
        SAR     R0,     2                       ; 6C81   006C
        MVI@    R4,     R4                      ; 6C82   02A4
        SDBD                                    ; 6C83   0001
        ADDI    #$6C98, R4                      ; 6C84   02FC 0098 006C
        MOVR    R4,     R7                      ; 6C87   00A7

        DECLE   $0000,  $0000,  $0010,  $0010   ; 6C88   0000 0000 0010 0010
        DECLE   $0000,  $0000                   ; 6C8C   0000 0000

        DECR    R0                              ; 6C8E   0010
        DECR    R0                              ; 6C8F   0010
        CLRC                                    ; 6C90   0006
        CLRC                                    ; 6C91   0006
        NEGR    R3                              ; 6C92   0023
        NEGR    R3                              ; 6C93   0023
        CLRC                                    ; 6C94   0006
        CLRC                                    ; 6C95   0006
        NEGR    R3                              ; 6C96   0023
        NEGR    R3                              ; 6C97   0023
        MVI@    R1,     R2                      ; 6C98   028A
        XORI    #$0005, R2                      ; 6C99   03FA 0005
        MVO@    R2,     R1                      ; 6C9B   024A
        B       L_6CD4                          ; 6C9C   0200 0036

        MVII    #$0002, R2                      ; 6C9E   02BA 0002
        MOVR    R0,     R4                      ; 6CA0   0084

        JSR     R5,     L_6B6E                  ; 6CA1   0004 0168 036E

        SARC    R0,     1                       ; 6CA4   0078
        ADCR    R2                              ; 6CA5   002A
        B       L_6CB3                          ; 6CA6   0200 000B

        MVII    #$0008, R2                      ; 6CA8   02BA 0008
        MVII    #$0004, R3                      ; 6CAA   02BB 0004
        MOVR    R0,     R4                      ; 6CAC   0084

        JSR     R5,     L_6B6E                  ; 6CAD   0004 0168 036E

        SARC    R0,     1                       ; 6CB0   0078
        ADCR    R7                              ; 6CB1   002F

        ADDR    R3,     R2                      ; 6CB2   00DA
L_6CB3:
        MVII    #$00F0, R3                      ; 6CB3   02BB 00F0
        AND@    R1,     R3                      ; 6CB5   038B
        XORR    R2,     R3                      ; 6CB6   01D3
        MVO@    R3,     R1                      ; 6CB7   024B
        MOVR    R4,     R0                      ; 6CB8   00A0
        B       L_6CD4                          ; 6CB9   0200 0019

        MVI     G_012B, R2                      ; 6CBB   0282 012B
        ANDI    #$000F, R2                      ; 6CBD   03BA 000F
        MVII    #$0001, R3                      ; 6CBF   02BB 0001
        MOVR    R0,     R4                      ; 6CC1   0084

        JSR     R5,     L_6B6E                  ; 6CC2   0004 0168 036E

        SARC    R0,     1                       ; 6CC5   0078
        BC      L_6CCA                          ; 6CC6   0201 0002

        MVII    #$0004, R3                      ; 6CC8   02BB 0004
L_6CCA:
        XORR    R3,     R2                      ; 6CCA   01DA
        B       L_6CB3                          ; 6CCB   0220 0019

L_6CCD:
        MVII    #$0188, R1                      ; 6CCD   02B9 0188
        ADDR    R0,     R1                      ; 6CCF   00C1
        MVI@    R1,     R2                      ; 6CD0   028A
        ANDI    #$00DF, R2                      ; 6CD1   03BA 00DF
        MVO@    R2,     R1                      ; 6CD3   024A
L_6CD4:
        DECR    R0                              ; 6CD4   0010
        BPL     L_6BD4                          ; 6CD5   0223 0102

        MVII    #$0002, R0                      ; 6CD7   02B8 0002
        MVI     G_0338, R2                      ; 6CD9   0282 0338
        SARC    R2,     1                       ; 6CDB   007A
        BC      L_6CE0                          ; 6CDC   0201 0002

        MVII    #$0005, R0                      ; 6CDE   02B8 0005
L_6CE0:
        MVII    #$0188, R1                      ; 6CE0   02B9 0188
        ADDR    R0,     R1                      ; 6CE2   00C1
        MVI@    R1,     R2                      ; 6CE3   028A
        ANDI    #$00BF, R2                      ; 6CE4   03BA 00BF
        MVO@    R2,     R1                      ; 6CE6   024A
        MVII    #$0149, R4                      ; 6CE7   02BC 0149
        MVI     G_0338, R3                      ; 6CE9   0283 0338
        SARC    R3,     1                       ; 6CEB   007B
        BC      L_6CF0                          ; 6CEC   0201 0002

        MVII    #$0146, R4                      ; 6CEE   02BC 0146
L_6CF0:
        ADDR    R0,     R4                      ; 6CF0   00C4
        ADDR    R0,     R4                      ; 6CF1   00C4
        ADDR    R0,     R4                      ; 6CF2   00C4
        MVI@    R4,     R3                      ; 6CF3   02A3
        DECR    R3                              ; 6CF4   0013
        BNEQ    L_6CFF                          ; 6CF5   020C 0008

        XORI    #$0040, R2                      ; 6CF7   03FA 0040
        MVO@    R2,     R1                      ; 6CF9   024A
        MVI     G_0182, R1                      ; 6CFA   0281 0182

        JSR     R5,     L_6D2D                  ; 6CFC   0004 016C 012D

L_6CFF:
        DECR    R0                              ; 6CFF   0010
        BPL     L_6CE0                          ; 6D00   0223 0021

L_6D02:
        MVII    #$0015, R0                      ; 6D02   02B8 0015
        MVII    #$034E, R4                      ; 6D04   02BC 034E
        MVII    #$035B, R1                      ; 6D06   02B9 035B
        MVI     G_0338, R2                      ; 6D08   0282 0338
        SARC    R2,     1                       ; 6D0A   007A
        BC      L_6D15                          ; 6D0B   0201 0008

        SDBD                                    ; 6D0D   0001
        MVII    #$0555, R0                      ; 6D0E   02B8 0055 0005
        MVII    #$034C, R4                      ; 6D11   02BC 034C
        MVII    #$035A, R1                      ; 6D13   02B9 035A
L_6D15:
        MVII    #$018E, R3                      ; 6D15   02BB 018E
        MVII    #$01A0, R5                      ; 6D17   02BD 01A0
L_6D19:
        MVI@    R3,     R2                      ; 6D19   029A
        MVO@    R2,     R5                      ; 6D1A   026A
        MVI@    R4,     R2                      ; 6D1B   02A2
        MVO@    R2,     R3                      ; 6D1C   025A
        INCR    R3                              ; 6D1D   000B
        SARC    R0,     1                       ; 6D1E   0078
        BC      L_6D19                          ; 6D1F   0221 0007

        MVI@    R3,     R2                      ; 6D21   029A
        MVO@    R2,     R5                      ; 6D22   026A
        MVI@    R1,     R2                      ; 6D23   028A
        INCR    R1                              ; 6D24   0009
        SLR     R2,     2                       ; 6D25   0066
        SLR     R2,     1                       ; 6D26   0062
        MVO@    R2,     R3                      ; 6D27   025A
        INCR    R3                              ; 6D28   000B
        TSTR    R0                              ; 6D29   0080
        BNEQ    L_6D19                          ; 6D2A   022C 0012
L_6D2C:
        PULR    R7                              ; 6D2C   02B7

L_6D2D:
        SWAP    R2,     1                       ; 6D2D   0042
        SLLC    R2,     2                       ; 6D2E   005E
        BNC     L_6D32                          ; 6D2F   0209 0001

        CLRR    R2                              ; 6D31   01D2
L_6D32:
        SLL     R2,     2                       ; 6D32   004E
        CLRR    R3                              ; 6D33   01DB
        SLLC    R2,     1                       ; 6D34   005A
        BNC     L_6D38                          ; 6D35   0209 0001

        MOVR    R1,     R3                      ; 6D37   008B
L_6D38:
        SLLC    R2,     1                       ; 6D38   005A
        RLC     R3,     1                       ; 6D39   0053
        MVO@    R3,     R4                      ; 6D3A   0263
        CLRR    R3                              ; 6D3B   01DB
        SLLC    R2,     1                       ; 6D3C   005A
        BNC     L_6D40                          ; 6D3D   0209 0001

        MOVR    R1,     R3                      ; 6D3F   008B
L_6D40:
        SLLC    R2,     1                       ; 6D40   005A
        RLC     R3,     1                       ; 6D41   0053
        MVO@    R3,     R4                      ; 6D42   0263
        MOVR    R5,     R7                      ; 6D43   00AF

L_6D44:
        PSHR    R5                              ; 6D44   0275
        MVI     G_0338, R0                      ; 6D45   0280 0338
        SARC    R0,     1                       ; 6D47   0078
        BNC     L_6D4F                          ; 6D48   0209 0005

        MVI     G_0174, R5                      ; 6D4A   0285 0174
        TSTR    R5                              ; 6D4C   00AD
        BNEQ    L_6E82                          ; 6D4D   020C 0133

L_6D4F:
        MVI     G_0184, R5                      ; 6D4F   0285 0184
        ANDI    #$0008, R5                      ; 6D51   03BD 0008
        BNEQ    L_6DD8                          ; 6D53   020C 0083

        MVI     G_0338, R0                      ; 6D55   0280 0338
        MOVR    R0,     R1                      ; 6D57   0081
        SLR     R1,     2                       ; 6D58   0065
        SLR     R1,     2                       ; 6D59   0065
        SLR     R1,     1                       ; 6D5A   0061
        ANDI    #$0003, R1                      ; 6D5B   03B9 0003
        MOVR    R1,     R2                      ; 6D5D   008A
        SLL     R2,     1                       ; 6D5E   004A
        ADDR    R2,     R1                      ; 6D5F   00D1
        MOVR    R0,     R3                      ; 6D60   0083
        SLR     R3,     1                       ; 6D61   0063
        ANDI    #$0003, R3                      ; 6D62   03BB 0003
        DECR    R3                              ; 6D64   0013
        ADDR    R3,     R1                      ; 6D65   00D9
        SDBD                                    ; 6D66   0001
        ADDI    #$6FD8, R1                      ; 6D67   02F9 00D8 006F
        MVI@    R1,     R4                      ; 6D6A   028C
        SDBD                                    ; 6D6B   0001
        ADDI    #$6F51, R4                      ; 6D6C   02FC 0051 006F
        MOVR    R0,     R2                      ; 6D6F   0082
        SARC    R2,     1                       ; 6D70   007A
        BNC     L_6D8C                          ; 6D71   0209 0019

        MVI     G_0338, R5                      ; 6D73   0285 0338
        ANDI    #$009E, R5                      ; 6D75   03BD 009E
        CMPI    #$009C, R5                      ; 6D77   037D 009C
        BNEQ    L_6D7F                          ; 6D79   020C 0004

        ADDI    #$0012, R4                      ; 6D7B   02FC 0012
        B       L_6D8C                          ; 6D7D   0200 000D

L_6D7F:
        MOVR    R0,     R2                      ; 6D7F   0082
        SLR     R2,     2                       ; 6D80   0066
        ANDI    #$0006, R2                      ; 6D81   03BA 0006
        MOVR    R2,     R5                      ; 6D83   0095
        SLR     R2,     1                       ; 6D84   0062
        ADDR    R5,     R2                      ; 6D85   00EA
        TSTR    R3                              ; 6D86   009B
        BEQ     L_6D8B                          ; 6D87   0204 0002

        ADDI    #$0003, R2                      ; 6D89   02FA 0003
L_6D8B:
        ADDR    R2,     R4                      ; 6D8B   00D4
L_6D8C:
        MVI@    R4,     R0                      ; 6D8C   02A0
        MVI@    R4,     R1                      ; 6D8D   02A1
        MVI@    R4,     R2                      ; 6D8E   02A2
        MOVR    R2,     R3                      ; 6D8F   0093
        ANDI    #$003F, R3                      ; 6D90   03BB 003F
        SARC    R2,     2                       ; 6D92   007E
        SARC    R2,     2                       ; 6D93   007E
        SARC    R2,     2                       ; 6D94   007E

        JSR     R5,     L_6F3B                  ; 6D95   0004 016C 033B

        MVO     R0,     G_0181                  ; 6D98   0240 0181
        MVO     R1,     G_0180                  ; 6D9A   0241 0180
        MVO     R2,     G_0182                  ; 6D9C   0242 0182
        MVO     R3,     G_0183                  ; 6D9E   0243 0183
        MVO     R4,     G_0186                  ; 6DA0   0244 0186
        MVII    #$0001, R0                      ; 6DA2   02B8 0001
        MVO     R0,     G_0185                  ; 6DA4   0240 0185
        CLRR    R0                              ; 6DA6   01C0
        MVII    #$0188, R5                      ; 6DA7   02BD 0188
        MVII    #$0006, R4                      ; 6DA9   02BC 0006
L_6DAB:
        MVO@    R0,     R5                      ; 6DAB   0268
        DECR    R4                              ; 6DAC   0014
        BNEQ    L_6DAB                          ; 6DAD   022C 0003

        CLRR    R0                              ; 6DAF   01C0
        MVO     R0,     G_013D                  ; 6DB0   0240 013D
        MVII    #$0002, R0                      ; 6DB2   02B8 0002
        MVO     R0,     G_013F                  ; 6DB4   0240 013F
        MVO     R0,     G_013E                  ; 6DB6   0240 013E
        MVI     G_0183, R0                      ; 6DB8   0280 0183
        MVII    #$015B, R5                      ; 6DBA   02BD 015B
        MVII    #$0149, R3                      ; 6DBC   02BB 0149
        MVII    #$0003, R1                      ; 6DBE   02B9 0003
        MVI     G_0338, R2                      ; 6DC0   0282 0338
        SARC    R2,     1                       ; 6DC2   007A
        BC      L_6DCB                          ; 6DC3   0201 0006

        MVII    #$015A, R5                      ; 6DC5   02BD 015A
        MVII    #$0146, R3                      ; 6DC7   02BB 0146
        MVII    #$0006, R1                      ; 6DC9   02B9 0006
L_6DCB:
        MVO@    R0,     R5                      ; 6DCB   0268
        MVO@    R0,     R3                      ; 6DCC   0258
        ADDI    #$0003, R3                      ; 6DCD   02FB 0003
        DECR    R1                              ; 6DCF   0011
        BNEQ    L_6DCB                          ; 6DD0   022C 0006

        MVII    #$0008, R0                      ; 6DD2   02B8 0008
        MVO     R0,     G_0184                  ; 6DD4   0240 0184
        B       L_6ECD                          ; 6DD6   0200 00F5

L_6DD8:
        MVI     G_013F, R0                      ; 6DD8   0280 013F
        TSTR    R0                              ; 6DDA   0080
        BNEQ    L_6E5C                          ; 6DDB   020C 007F

        MVI     G_0184, R1                      ; 6DDD   0281 0184
        INCR    R1                              ; 6DDF   0009
        ANDI    #$0007, R1                      ; 6DE0   03B9 0007
        CMPI    #$0002, R1                      ; 6DE2   0379 0002
        BLE     L_6DF8                          ; 6DE4   0206 0012

        MVI     G_0338, R3                      ; 6DE6   0283 0338
        SARC    R3,     1                       ; 6DE8   007B
        BC      L_6DEF                          ; 6DE9   0201 0004

        CMPI    #$0005, R1                      ; 6DEB   0379 0005
        BLE     L_6DF8                          ; 6DED   0206 0009

L_6DEF:
        CLRR    R1                              ; 6DEF   01C9
        MVI     G_0184, R0                      ; 6DF0   0280 0184
        ANDI    #$00EF, R0                      ; 6DF2   03B8 00EF
        XORI    #$0010, R0                      ; 6DF4   03F8 0010
        MVO     R0,     G_0184                  ; 6DF6   0240 0184
L_6DF8:
        MVI     G_0184, R0                      ; 6DF8   0280 0184
        ANDI    #$00F8, R0                      ; 6DFA   03B8 00F8
        XORR    R1,     R0                      ; 6DFC   01C8
        MVO     R0,     G_0184                  ; 6DFD   0240 0184
        MOVR    R0,     R2                      ; 6DFF   0082
        MVII    #$0002, R0                      ; 6E00   02B8 0002
        ANDI    #$0010, R2                      ; 6E02   03BA 0010
        BEQ     L_6E0F                          ; 6E04   0204 0009

        MVII    #$001E, R0                      ; 6E06   02B8 001E
        MVI     G_0338, R2                      ; 6E08   0282 0338
        SARC    R2,     1                       ; 6E0A   007A
        BC      L_6E0F                          ; 6E0B   0201 0002

        MVII    #$000F, R0                      ; 6E0D   02B8 000F
L_6E0F:
        MVO     R0,     G_013F                  ; 6E0F   0240 013F
        MVII    #$0188, R2                      ; 6E11   02BA 0188
        ADDR    R1,     R2                      ; 6E13   00CA
        MVI@    R2,     R0                      ; 6E14   0290
        ANDI    #$00B0, R0                      ; 6E15   03B8 00B0
        BNEQ    L_6E5C                          ; 6E17   020C 0043

        JSR     R5,     L_6B6E                  ; 6E19   0004 0168 036E

        ANDI    #$00FF, R0                      ; 6E1C   03B8 00FF
        CMP     G_0181, R0                      ; 6E1E   0340 0181
        BLT     L_6E3F                          ; 6E20   0205 001D

L_6E22:
        JSR     R5,     L_6B6E                  ; 6E22   0004 0168 036E

        MOVR    R0,     R2                      ; 6E25   0082
        ANDI    #$000A, R0                      ; 6E26   03B8 000A
        BEQ     L_6E22                          ; 6E28   0224 0007

        MVI     G_0338, R3                      ; 6E2A   0283 0338
        SARC    R3,     1                       ; 6E2C   007B
        BC      L_6E33                          ; 6E2D   0201 0004

        CMPI    #$000A, R0                      ; 6E2F   0378 000A
        BEQ     L_6E22                          ; 6E31   0224 0010

L_6E33:
        ANDI    #$000F, R2                      ; 6E33   03BA 000F
L_6E35:
        MOVR    R1,     R0                      ; 6E35   0088
        ADDI    #$0188, R1                      ; 6E36   02F9 0188
        MVI@    R1,     R3                      ; 6E38   028B
        ANDI    #$00F0, R3                      ; 6E39   03BB 00F0
        XORR    R2,     R3                      ; 6E3B   01D3
        MVO@    R3,     R1                      ; 6E3C   024B
        B       L_6E5C                          ; 6E3D   0200 001D

L_6E3F:
        MVII    #$034E, R4                      ; 6E3F   02BC 034E
        MVI     G_0338, R0                      ; 6E41   0280 0338
        SARC    R0,     1                       ; 6E43   0078
        BC      L_6E48                          ; 6E44   0201 0002

        MVII    #$034C, R4                      ; 6E46   02BC 034C
L_6E48:
        ADDR    R1,     R4                      ; 6E48   00CC
        ADDR    R1,     R4                      ; 6E49   00CC

        JSR     R5,     L_6ECE                  ; 6E4A   0004 016C 02CE

        MVI     G_0338, R3                      ; 6E4D   0283 0338
        SARC    R3,     1                       ; 6E4F   007B
        BC      L_6E5A                          ; 6E50   0201 0008

        MVII    #$00FD, R3                      ; 6E52   02BB 00FD
        CMPR    R0,     R5                      ; 6E54   0145
        BGE     L_6E59                          ; 6E55   020D 0002

        MVII    #$00F7, R3                      ; 6E57   02BB 00F7
L_6E59:
        ANDR    R3,     R2                      ; 6E59   019A
L_6E5A:
        B       L_6E35                          ; 6E5A   0220 0026

L_6E5C:
        MVI     G_013E, R1                      ; 6E5C   0281 013E
        TSTR    R1                              ; 6E5E   0089
        BNEQ    L_6E82                          ; 6E5F   020C 0021

        MVII    #$0002, R0                      ; 6E61   02B8 0002
        MVI     G_0338, R1                      ; 6E63   0281 0338
        SARC    R1,     1                       ; 6E65   0079
        BC      L_6E6A                          ; 6E66   0201 0002

        MVII    #$0005, R0                      ; 6E68   02B8 0005
L_6E6A:
        MVII    #$0188, R1                      ; 6E6A   02B9 0188
        ADDR    R0,     R1                      ; 6E6C   00C1
        MVI@    R1,     R2                      ; 6E6D   028A
        ANDI    #$0090, R2                      ; 6E6E   03BA 0090
        BNEQ    L_6E7F                          ; 6E70   020C 000D

        MVII    #$035B, R1                      ; 6E72   02B9 035B
        MVI     G_0338, R2                      ; 6E74   0282 0338
        SARC    R2,     1                       ; 6E76   007A
        BC      L_6E7B                          ; 6E77   0201 0002

        MVII    #$035A, R1                      ; 6E79   02B9 035A
L_6E7B:
        ADDR    R0,     R1                      ; 6E7B   00C1

        JSR     R5,     L_6EF5                  ; 6E7C   0004 016C 02F5

L_6E7F:
        DECR    R0                              ; 6E7F   0010
        BPL     L_6E6A                          ; 6E80   0223 0017

L_6E82:
        MVI     G_0338, R0                      ; 6E82   0280 0338
        AND     G_010E, R0                      ; 6E84   0380 010E
        SARC    R0,     1                       ; 6E86   0078
        BNC     L_6EB3                          ; 6E87   0209 002A

        MVI     G_013D, R0                      ; 6E89   0280 013D
        TSTR    R0                              ; 6E8B   0080
        BNEQ    L_6EB3                          ; 6E8C   020C 0025

        MVII    #$0356, R4                      ; 6E8E   02BC 0356
        MVI     G_0174, R0                      ; 6E90   0280 0174
        DECR    R0                              ; 6E92   0010
        BNEQ    L_6E97                          ; 6E93   020C 0002

        MVII    #$0354, R4                      ; 6E95   02BC 0354

L_6E97:
        JSR     R5,     L_6ECE                  ; 6E97   0004 016C 02CE

        MVII    #$0156, R4                      ; 6E9A   02BC 0156
        MVII    #$015F, R3                      ; 6E9C   02BB 015F
        MVI     G_0174, R0                      ; 6E9E   0280 0174
        DECR    R0                              ; 6EA0   0010
        BNEQ    L_6EA7                          ; 6EA1   020C 0004

        MVII    #$0153, R4                      ; 6EA3   02BC 0153
        MVII    #$015E, R3                      ; 6EA5   02BB 015E
L_6EA7:
        MVI     G_0186, R0                      ; 6EA7   0280 0186
        MVO@    R0,     R3                      ; 6EA9   0258
        MVI     G_0185, R1                      ; 6EAA   0281 0185

        JSR     R5,     L_6D2D                  ; 6EAC   0004 016C 012D

        MVII    #$001E, R0                      ; 6EAF   02B8 001E
        MVO     R0,     G_013D                  ; 6EB1   0240 013D
L_6EB3:
        MVI     G_013E, R0                      ; 6EB3   0280 013E
        TSTR    R0                              ; 6EB5   0080
        BNEQ    L_6ECD                          ; 6EB6   020C 0015

        MVII    #$000F, R0                      ; 6EB8   02B8 000F
        MVO     R0,     G_013E                  ; 6EBA   0240 013E
        MVI     G_0338, R0                      ; 6EBC   0280 0338
        SARC    R0,     1                       ; 6EBE   0078
        BNC     L_6ECD                          ; 6EBF   0209 000C

        MVII    #$035F, R1                      ; 6EC1   02B9 035F
        MVI     G_0174, R0                      ; 6EC3   0280 0174
        DECR    R0                              ; 6EC5   0010
        BNEQ    L_6ECA                          ; 6EC6   020C 0002

        MVII    #$035E, R1                      ; 6EC8   02B9 035E

L_6ECA:
        JSR     R5,     L_6EF5                  ; 6ECA   0004 016C 02F5

L_6ECD:
        PULR    R7                              ; 6ECD   02B7

L_6ECE:
        PSHR    R5                              ; 6ECE   0275
        CLRR    R2                              ; 6ECF   01D2
        MVI     G_0348, R5                      ; 6ED0   0285 0348
        ANDI    #$00FF, R5                      ; 6ED2   03BD 00FF
        MVI@    R4,     R3                      ; 6ED4   02A3
        ANDI    #$00FF, R3                      ; 6ED5   03BB 00FF
        SUBR    R3,     R5                      ; 6ED7   011D
        BEQ     L_6EE2                          ; 6ED8   0204 0008

        XORI    #$000C, R2                      ; 6EDA   03FA 000C
        TSTR    R5                              ; 6EDC   00AD
        BPL     L_6EE2                          ; 6EDD   0203 0003

        XORI    #$0004, R2                      ; 6EDF   03FA 0004
        NEGR    R5                              ; 6EE1   0025
L_6EE2:
        MVI     G_0349, R0                      ; 6EE2   0280 0349
        ANDI    #$007F, R0                      ; 6EE4   03B8 007F
        MVI@    R4,     R3                      ; 6EE6   02A3
        ANDI    #$007F, R3                      ; 6EE7   03BB 007F
        SUBR    R3,     R0                      ; 6EE9   0118
        BEQ     L_6EF4                          ; 6EEA   0204 0008

        XORI    #$0003, R2                      ; 6EEC   03FA 0003
        TSTR    R0                              ; 6EEE   0080
        BPL     L_6EF4                          ; 6EEF   0203 0003

        XORI    #$0001, R2                      ; 6EF1   03FA 0001
        NEGR    R0                              ; 6EF3   0020
L_6EF4:
        PULR    R7                              ; 6EF4   02B7

L_6EF5:
        MVI@    R1,     R2                      ; 6EF5   028A
        SLR     R2,     2                       ; 6EF6   0066
        SLR     R2,     1                       ; 6EF7   0062
        ANDI    #$01FF, R2                      ; 6EF8   03BA 01FF
        SDBD                                    ; 6EFA   0001
        MVII    #$6F14, R4                      ; 6EFB   02BC 0014 006F
L_6EFE:
        CMP@    R4,     R2                      ; 6EFE   0362
        BNEQ    L_6F0D                          ; 6EFF   020C 000C

        MVI@    R4,     R2                      ; 6F01   02A2
        MVI@    R1,     R3                      ; 6F02   028B
        SDBD                                    ; 6F03   0001
        ANDI    #$F007, R3                      ; 6F04   03BB 0007 00F0
        SLL     R2,     2                       ; 6F07   004E
        SLL     R2,     1                       ; 6F08   004A
        XORR    R2,     R3                      ; 6F09   01D3
        MVO@    R3,     R1                      ; 6F0A   024B
        B       L_6F13                          ; 6F0B   0200 0006

L_6F0D:
        SDBD                                    ; 6F0D   0001
        CMPI    #$6F3B, R4                      ; 6F0E   037C 003B 006F
        BNC     L_6EFE                          ; 6F11   0229 0014
L_6F13:
        MOVR    R5,     R7                      ; 6F13   00AF

        SUBR    R2,     R0                      ; 6F14   0110
        SUBR    R2,     R1                      ; 6F15   0111
        SUBR    R2,     R0                      ; 6F16   0110
        SUBR    R1,     R5                      ; 6F17   010D
        SUBR    R1,     R6                      ; 6F18   010E
        SUBR    R1,     R5                      ; 6F19   010D
        SUBR    R7,     R0                      ; 6F1A   0138
        SUBR    R7,     R1                      ; 6F1B   0139
        SUBR    R7,     R0                      ; 6F1C   0138
        SUBR    R6,     R5                      ; 6F1D   0135
        SUBR    R6,     R6                      ; 6F1E   0136
        SUBR    R6,     R5                      ; 6F1F   0135
        SUBR    R6,     R2                      ; 6F20   0132
        SUBR    R6,     R3                      ; 6F21   0133
        SUBR    R6,     R2                      ; 6F22   0132
        SUBR    R5,     R7                      ; 6F23   012F

        SUBR    R6,     R0                      ; 6F24   0130
        SUBR    R5,     R7                      ; 6F25   012F

        SUBR    R5,     R0                      ; 6F26   0128
        SUBR    R5,     R1                      ; 6F27   0129
        SUBR    R5,     R0                      ; 6F28   0128
        SUBR    R4,     R5                      ; 6F29   0125
        SUBR    R4,     R6                      ; 6F2A   0126
        SUBR    R4,     R5                      ; 6F2B   0125
        SUBR    R4,     R2                      ; 6F2C   0122
        SUBR    R4,     R3                      ; 6F2D   0123
        SUBR    R4,     R2                      ; 6F2E   0122
        SUBR    R3,     R7                      ; 6F2F   011F

        SUBR    R4,     R0                      ; 6F30   0120
        SUBR    R3,     R7                      ; 6F31   011F

        SUBR    R3,     R0                      ; 6F32   0118
        SUBR    R3,     R1                      ; 6F33   0119
        SUBR    R3,     R0                      ; 6F34   0118
        SUBR    R2,     R5                      ; 6F35   0115
        SUBR    R2,     R6                      ; 6F36   0116
        SUBR    R2,     R5                      ; 6F37   0115
        SUBR    R2,     R2                      ; 6F38   0112
        SUBR    R2,     R3                      ; 6F39   0113
        SUBR    R2,     R2                      ; 6F3A   0112
L_6F3B:
        PSHR    R5                              ; 6F3B   0275
        MVII    #$0002, R4                      ; 6F3C   02BC 0002
        MVI     G_010C, R5                      ; 6F3E   0285 010C
        CMPI    #$0002, R5                      ; 6F40   037D 0002
        BGE     L_6F4A                          ; 6F42   020D 0006

        SARC    R2,     1                       ; 6F44   007A
        BNC     L_6F49                          ; 6F45   0209 0002

        RLC     R2,     1                       ; 6F47   0052
        SLL     R3,     1                       ; 6F48   004B
L_6F49:
        INCR    R4                              ; 6F49   000C
L_6F4A:
        ANDI    #$0001, R5                      ; 6F4A   03BD 0001
        BNEQ    L_6F50                          ; 6F4C   020C 0002

        SLR     R0,     1                       ; 6F4E   0060
        SLR     R1,     1                       ; 6F4F   0061
L_6F50:
        PULR    R7                              ; 6F50   02B7

        DECLE   $0080,  $0000,  $0044,  $00B3   ; 6F51   0080 0000 0044 00B3
        DECLE   $0080,  $0043,  $008C,  $00B3   ; 6F55   0080 0043 008C 00B3
        DECLE   $0043,  $0059,  $00A6,  $0044   ; 6F59   0043 0059 00A6 0044
        DECLE   $0099,  $0000,  $0043,  $0080   ; 6F5D   0099 0000 0043 0080
        DECLE   $0099,  $0044,  $00B3,  $0099   ; 6F61   0099 0044 00B3 0099
        DECLE   $0046,  $00BF,  $00BF,  $0085   ; 6F65   0046 00BF 00BF 0085
        DECLE   $0099,  $0099,  $0044,  $00CC   ; 6F69   0099 0099 0044 00CC
        DECLE   $0099,  $0042,  $00BF,  $0000   ; 6F6D   0099 0042 00BF 0000
        DECLE   $0043,  $00BF,  $0059,  $0042   ; 6F71   0043 00BF 0059 0042
        DECLE   $00BF,  $00BF,  $0085,  $0080   ; 6F75   00BF 00BF 0085 0080
        DECLE   $00CC,  $0042,  $00D9,  $00BF   ; 6F79   00CC 0042 00D9 00BF
        DECLE   $0042,  $00BF,  $0000,  $0085   ; 6F7D   0042 00BF 0000 0085
        DECLE   $00CC,  $00A6,  $0085,  $00A6   ; 6F81   00CC 00A6 0085 00A6
        DECLE   $00CC,  $0085,  $0080,  $00D9   ; 6F85   00CC 0085 0080 00D9
        DECLE   $0085,  $00BF,  $0000,  $0085   ; 6F89   0085 00BF 0000 0085
        DECLE   $00A6,  $00B3,  $0043,  $00CC   ; 6F8D   00A6 00B3 0043 00CC
        DECLE   $00BF,  $0044,  $00D9,  $00D9   ; 6F91   00BF 0044 00D9 00D9
        DECLE   $0085,  $00B3,  $00B3,  $0043   ; 6F95   0085 00B3 00B3 0043
        DECLE   $00E6,  $00B3,  $0042,  $00D9   ; 6F99   00E6 00B3 0042 00D9
        DECLE   $0000,  $0085,  $00D9,  $0080   ; 6F9D   0000 0085 00D9 0080
        DECLE   $0042,  $00D9,  $00D9,  $0085   ; 6FA1   0042 00D9 00D9 0085
        DECLE   $00A6,  $00E6,  $0042,  $00E6   ; 6FA5   00A6 00E6 0042 00E6
        DECLE   $00D9,  $0042,  $00D9,  $0000   ; 6FA9   00D9 0042 00D9 0000
        DECLE   $0085,  $00E6,  $00CC,  $0085   ; 6FAD   0085 00E6 00CC 0085
        DECLE   $00BF,  $00E6,  $0085,  $00A6   ; 6FB1   00BF 00E6 0085 00A6
        DECLE   $00F2,  $0085,  $00D9,  $0000   ; 6FB5   00F2 0085 00D9 0000
        DECLE   $0042,  $00CC,  $00CC,  $0085   ; 6FB9   0042 00CC 00CC 0085
        DECLE   $00E6,  $00D9,  $0043,  $00F2   ; 6FBD   00E6 00D9 0043 00F2
        DECLE   $00F2,  $0042,  $00CC,  $00CC   ; 6FC1   00F2 0042 00CC 00CC
        DECLE   $0085,  $00F2,  $00CC,  $0042   ; 6FC5   0085 00F2 00CC 0042
        DECLE   $00E6,  $0000,  $0042,  $00F2   ; 6FC9   00E6 0000 0042 00F2
        DECLE   $00A6,  $0042,  $00F2,  $00F2   ; 6FCD   00A6 0042 00F2 00F2
        DECLE   $0042,  $00CC,  $00F2,  $0042   ; 6FD1   0042 00CC 00F2 0042
        DECLE   $00F2,  $00F2,  $0042,  $0000   ; 6FD5   00F2 00F2 0042 0000

        INCR    R4                              ; 6FD9   000C
        COMR    R6                              ; 6FDA   001E
        ADCR    R5                              ; 6FDB   002D
        RSWD    R1                              ; 6FDC   0039
        SLL     R3,     1                       ; 6FDD   004B
        SLLC    R2,     1                       ; 6FDE   005A
        SLR     R2,     2                       ; 6FDF   0066
        SARC    R0,     1                       ; 6FE0   0078
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
;;  $5004       <entry>
;;  $5045       $5049  
;;  $5060       $5071   $5086   $509E  
;;  $506B       $5066  
;;  $5088       $506D  
;;  $50A0       $5069  
;;  $50A1       $50BA   $50DB  
;;  $50AC       $50A7  
;;  $50C4       $50B6  
;;  $50CC       $50B2  
;;  $50D4       $50AE  
;;  $50D9       $50C2   $50CA   $50D2  
;;  $50DD       $56B9  
;;  $50EC       $50E8  
;;  $5100       $50F8  
;;  $5104       $50FE  
;;  $5111       $510B  
;;  $5113       $510F  
;;  $5115       $50AA   $50E4   $50ED   $5791  
;;  $5138       $5133  
;;  $5146       $5148  
;;  $514A       $5142  
;;  $5151       $5153  
;;  $5155       $514D  
;;  $5182       $5182  
;;  $5183       $5179  
;;  $5197       $5191  
;;  $5199       $5195  
;;  $51DC       $55AB  
;;  $51E9       $51EC  
;;  $51EF       $516C   $5173  
;;  $51F2       $5211  
;;  $51FB       $5209  
;;  $5205       $51FC  
;;  $5213       $520D  
;;  $5214       $5019   $501E   $504B   $5115   $511E   $5497   $555C   $56D6  
;;  $5214       $571A   $582C   $5831  
;;  $5217       $5219  
;;  $5243       $5241  
;;  $5261       $56BC  
;;  $5274       $526B  
;;  $527C       $5278  
;;  $5280       $5272  
;;  $528E       $527E  
;;  $52A2       $529B  
;;  $52A4       $5298  
;;  $52CB       $52C8  
;;  $52F5       $52DF  
;;  $52F9       $5264   $5270   $528C   $529E  
;;  $5334       $5326  
;;  $533E       $5332  
;;  $5341       $530A   $530F  
;;  $534C       $5348  
;;  $538D       $5390  
;;  $5394       $5359   $5361  
;;  $53B5       $5392  
;;  $53BB       $5352   $5396   $539E  
;;  $53E4       $53E7  
;;  $53EC       $53D0  
;;  $53F5       $53FC  
;;  $53FE       $53EE  
;;  $5415       $5418  
;;  $541A       $5400  
;;  $5443       $53BF   $53C5   $53CC  
;;  $5450       $5305  
;;  $5455       $544E  
;;  $5460       $5465  
;;  $5467       $5461  
;;  $5488       $548E  
;;  $5492       $5489  
;;  $54DA       $54DF  
;;  $54EA       $54F9  
;;  $5540       $5536  
;;  $554F       $51D9   $5479  
;;  $5576       $557A  
;;  $55A0       $559C  
;;  $55A1       $5598  
;;  $55AA       $5587  
;;  $55C9       $55CC  
;;  $55D0       $55C2  
;;  $55DD       $55D9  
;;  $55E7       $55ED  
;;  $55EF       $55E9  
;;  $5609       $5618  
;;  $5615       $560A  
;;  $562A       $561D  
;;  $563C       $554D  
;;  $564B       $5607  
;;  $567F       $534D   $5453  
;;  $568F       $56A0  
;;  $56B4       $56B1  
;;  $56B9       $56B6  
;;  $56BC       $5457   $5476   $5490   $5649  
;;  $56BF       $51C3   $552D  
;;  $56C5       $56C7  
;;  $56CE       $56D3  
;;  $56D6       $5662  
;;  $570B       $5706  
;;  $570E       $56FF  
;;  $5710       $5709  
;;  $5747       $5744  
;;  $5755       $574D  
;;  $575B       $5753  
;;  $5765       $5767  
;;  $5766       $5764  
;;  $577D       $577A  
;;  $5794       $52F2   $5559  
;;  $57A1       $579D  
;;  $57A9       $554A   $572C   $5784   $57A5   $57DB   $57E1  
;;  $57BF       $57B5  
;;  $57CC       $5138  
;;  $57E1       $57D0  
;;  $5850       $5853  
;;  $585F       $5862  
;;  $5875       $587A  
;;  $5880       $5886  
;;  $588B       $588E  
;;  $58AC       $58A5  
;;  $58D4       $58B3  
;;  $58EE       $58E4   $58E9  
;;  $58F3       $5917  
;;  $5905       $5903  
;;  $590D       $590B  
;;  $5912       $58F5  
;;  $5915       $5910  
;;  $591D       $5924  
;;  $5922       $591F  
;;  $592A       $5932  
;;  $5930       $592C  
;;  $593A       $57E9   $5805   $5814   $581F   $582A   $5857   $586C   $58AA  
;;  $5948       $5944  
;;  $5961       $5036   $511A   $52D0   $563C   $564B   $567F   $56A2  
;;  $5964       $5967  
;;  $59CD       $5C66  
;;  $5A9C       $5A9A  
;;  $5AA4       $5CED  
;;  $5AA5       $5AA5  
;;  $5AC1       $5CEB  
;;  $5AC6       $5CE9  
;;  $5C1D       $5C1D  
;;  $61A9       $61A7  
;;  $61AD       $61AB  
;;  $6215       $503A   $5050   $517B   $56DB   $571F   $6227  
;;  $621D       $6224  
;;  $6229       $6218  
;;  $622C       $5159   $5165   $5547   $55B9   $5610  
;;  $6231       $6241   $6249  
;;  $623D       $623F  
;;  $6243       $623B   $6247  
;;  $624B       $6233   $624F  
;;  $624C       $622F   $6253  
;;  $6251       $6256  
;;  $62C2       $62C0  
;;  $6312       $6310  
;;  $63FD       $5934  
;;  $6409       $6404  
;;  $6416       $6413  
;;  $6426       $6422  
;;  $642C       $6416   $6428  
;;  $642F       $63FE  
;;  $643F       $643A  
;;  $6442       $58DB  
;;  $6455       $6449   $644E   $645C   $6461  
;;  $6456       $6453  
;;  $645E       $645F  
;;  $648A       $6444  
;;  $64B7       $64B0  
;;  $64C6       $64BF  
;;  $64C7       $648B   $649E  
;;  $64DC       $64D2  
;;  $64F2       $64EC  
;;  $6504       $64FD  
;;  $650D       $650A  
;;  $6514       $64F8  
;;  $651E       $6517  
;;  $6526       $6523  
;;  $652B       $6512  
;;  $6534       $6531  
;;  $6566       $6563  
;;  $6582       $6554   $6571  
;;  $6591       $658E  
;;  $6592       $655D   $657C  
;;  $65A1       $659E  
;;  $65C4       $65C2  
;;  $65D4       $65D2  
;;  $65E8       $65F6  
;;  $65FB       $65F9  
;;  $6616       $6614  
;;  $6687       $6697  
;;  $668E       $6694  
;;  $6699       $6689  
;;  $669A       $5937  
;;  $66B2       $66A9  
;;  $66B6       $66C6  
;;  $66C8       $66C2  
;;  $66DA       $66B9   $66BF  
;;  $66E0       $669D   $66A1   $66B0  
;;  $670C       $553C  
;;  $6743       $6735  
;;  $674D       $6723  
;;  $674F       $6753  
;;  $6756       $671C   $672E  
;;  $6758       $675B  
;;  $675E       $58EB  
;;  $676D       $6766  
;;  $6772       $676A   $676F  
;;  $6779       $6782  
;;  $677E       $678F  
;;  $67DE       $67E6  
;;  $68D6       $68C8  
;;  $68EB       $68E3  
;;  $6904       $68FC  
;;  $691F       $6917  
;;  $69D6       $69CA  
;;  $69D9       $69CD  
;;  $69DC       $69D0  
;;  $69DF       $69D3  
;;  $6A7D       $5737   $5755   $576A  
;;  $6A80       $57C8  
;;  $6A8D       $6A91   $6AA2  
;;  $6A93       $6A8E  
;;  $6AA6       $6A94  
;;  $6AAD       $6AA7  
;;  $6AB3       $6AAA  
;;  $6ABB       $648E  
;;  $6ADC       $568A  
;;  $6AF8       $6466  
;;  $6B07       $5289   $52DB  
;;  $6B11       $519D   $5787  
;;  $6B30       $5311  
;;  $6B40       $5562  
;;  $6B46       $5189   $51A0   $5716   $577F   $578A  
;;  $6B48       $6B53  
;;  $6B4A       $6B50  
;;  $6B4C       $6B4D  
;;  $6B57       $5694   $569B  
;;  $6B59       $6B5F  
;;  $6B5B       $6B5C  
;;  $6B6E       $58B9   $58C3   $6C27   $6C6F   $6CA1   $6CAD   $6CC2   $6E19  
;;  $6B6E       $6E22  
;;  $6B78       $6B75  
;;  $6B7D       $6B79  
;;  $6B83       $6B7F  
;;  $6B8C       $512B  
;;  $6BA3       $6B90   $6B98  
;;  $6BB9       $6BA6   $6BAE  
;;  $6BBA       $58DE  
;;  $6BCB       $6BC4  
;;  $6BD4       $6BD0   $6CD5  
;;  $6BE5       $6BE1  
;;  $6C04       $6BFE  
;;  $6C33       $6C2F  
;;  $6C3F       $6C3B  
;;  $6C49       $6C44  
;;  $6C4B       $6BE9  
;;  $6C55       $6BF1   $6C49   $6C51  
;;  $6CB3       $6CA6   $6CB1   $6CCB  
;;  $6CCA       $6CC6  
;;  $6CCD       $6C58   $6C60  
;;  $6CD4       $6BDA   $6C68   $6C9C   $6CB9  
;;  $6CE0       $6CDC   $6D00  
;;  $6CF0       $6CEC  
;;  $6CFF       $6CF5  
;;  $6D02       $6BBF  
;;  $6D15       $6D0B  
;;  $6D19       $6D1F   $6D2A  
;;  $6D2C       $6BC9  
;;  $6D2D       $6CFC   $6EAC  
;;  $6D32       $6D2F  
;;  $6D38       $6D35  
;;  $6D40       $6D3D  
;;  $6D44       $52F9  
;;  $6D4F       $6D48  
;;  $6D7F       $6D79  
;;  $6D8B       $6D87  
;;  $6D8C       $6D71   $6D7D  
;;  $6DAB       $6DAD  
;;  $6DCB       $6DC3   $6DD0  
;;  $6DD8       $6D53  
;;  $6DEF       $6DE9  
;;  $6DF8       $6DE4   $6DED  
;;  $6E0F       $6E04   $6E0B  
;;  $6E22       $6E28   $6E31  
;;  $6E33       $6E2D  
;;  $6E35       $6E5A  
;;  $6E3F       $6E20  
;;  $6E48       $6E44  
;;  $6E59       $6E55  
;;  $6E5A       $6E50  
;;  $6E5C       $6DDB   $6E17   $6E3D  
;;  $6E6A       $6E66   $6E80  
;;  $6E7B       $6E77  
;;  $6E7F       $6E70  
;;  $6E82       $6D4D   $6E5F  
;;  $6E97       $6E93  
;;  $6EA7       $6EA1  
;;  $6EB3       $6E87   $6E8C  
;;  $6ECA       $6EC6  
;;  $6ECD       $6DD6   $6EB6   $6EBF  
;;  $6ECE       $6E4A   $6E97  
;;  $6EE2       $6ED8   $6EDD  
;;  $6EF4       $6EEA   $6EEF  
;;  $6EF5       $6E7C   $6ECA  
;;  $6EFE       $6F11  
;;  $6F0D       $6EFF  
;;  $6F13       $6F0B  
;;  $6F3B       $6D95  
;;  $6F49       $6F45  
;;  $6F4A       $6F42  
;;  $6F50       $6F4C  
;; ======================================================================== ;;
