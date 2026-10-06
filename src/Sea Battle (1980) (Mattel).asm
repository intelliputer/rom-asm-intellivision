
        ORG     $5000
.HEADER:
        BIDECLE $5D64           ; 5000  Ptr: MOB graphic images
        BIDECLE $5028           ; 5002  Ptr: EXEC timer table
        BIDECLE $5036           ; 5004  Ptr: Start of game
        BIDECLE $504D           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $51D9           ; 5008  Ptr: GRAM init sequence
        BIDECLE $501C           ; 500A  Ptr: Date/Title
        DECLE   $0000           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0001,  $0001   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0004           ; 5013  Border color init

        DECLE   $01B0,  $01B8,  $01C0,  $01C8   ; 5014   01B0 01B8 01C0 01C8
        DECLE   $01D0,  $01D8,  $01E0,  $01F0   ; 5018   01D0 01D8 01E0 01F0
.TITLE:
        DECLE   $0050                           ; 501C  Cartridge year
        STRING  "SEA BATTLE"                    ; 501D  Title string
        DECLE   $0000                           ; 5027  

.TIMER:
        DECLE   $00B6,  $0052,  $0001,  $0000; 5028  Timer dispatch/interval
        DECLE   $0029,  $005C,  $002C,  $0081; 502C  Timer dispatch/interval
        DECLE   $00B9,  $005E,  $0028,  $0000; 5030  Timer dispatch/interval
        BIDECLE $0000           ; 5034  End of timer table

.START:
        PSHR    R5                              ; 5036   0275
        MVII    #$0003, R0                      ; 5037   02B8 0003
        MVO     R0,     G_0103                  ; 5039   0240 0103

        JSR     R5,     L_51EC                  ; 503B   0004 0150 01EC

        MVII    #$0064, R0                      ; 503E   02B8 0064
        MVO     R0,     G_0118                  ; 5040   0240 0118
        MVII    #$0009, R0                      ; 5042   02B8 0009
        MVII    #$01B5, R1                      ; 5044   02B9 01B5
        SDBD                                    ; 5046   0001
        MVII    #$5FB7, R4                      ; 5047   02BC 00B7 005F

        JSR     R5,     .EXEC.731               ; 504A   0004 0114 0331
.GFX_LIST_504D:
        DECLE   $00FF,  $00FE,  $007E,  $003C   ; 504D  CART PIC #00
        DECLE   $00DC,  $000C,  $0000,  $0000   ; 5051  
        DECLE   $0060,  $00F0,  $00F8,  $0070   ; 5055  CART PIC #01
        DECLE   $0078,  $003E,  $000F,  $0006   ; 5059  
        DECLE   $0000,  $0010,  $0018,  $001C   ; 505D  CART PIC #02
        DECLE   $003E,  $003E,  $00BE,  $00FF   ; 5061  
        DECLE   $0060,  $00F0,  $0060,  $0022   ; 5065  CART PIC #03
        DECLE   $0007,  $001E,  $000F,  $0006   ; 5069  
        DECLE   $00FE,  $00FC,  $00FE,  $00FA   ; 506D  CART PIC #04
        DECLE   $007C,  $001E,  $000C,  $0000   ; 5071  
        DECLE   $0080,  $0020,  $0000,  $0040   ; 5075  CART PIC #05
        DECLE   $0000,  $0000,  $0001,  $0000   ; 5079  
        DECLE   $0060,  $0064,  $00C2,  $00C6   ; 507D  CART PIC #06
        DECLE   $0064,  $0021,  $0007,  $0006   ; 5081  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5085  CART PIC #07
        DECLE   $0000,  $0010,  $004C,  $00EF   ; 5089  
        DECLE   $00FF,  $00FE,  $00F4,  $00C0   ; 508D  CART PIC #08
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5091  
        DECLE   $0001,  $0001,  $0001,  $0003   ; 5095  CART PIC #09
        DECLE   $0007,  $000F,  $0007,  $0001   ; 5099  
        DECLE   $00FD,  $0058,  $0000,  $0000   ; 509D  CART PIC #0A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50A1  
        DECLE   $0001,  $0003,  $000F,  $0007   ; 50A5  CART PIC #0B
        DECLE   $0023,  $0033,  $007F,  $00FF   ; 50A9  
        DECLE   $0070,  $00F8,  $007E,  $000F   ; 50AD  CART PIC #0C
        DECLE   $000E,  $001E,  $007F,  $00FF   ; 50B1  
        DECLE   $0000,  $0080,  $00C0,  $00E0   ; 50B5  CART PIC #0D
        DECLE   $00C0,  $0080,  $00C0,  $0080   ; 50B9  
        DECLE   $000C,  $0011,  $0018,  $001F   ; 50BD   000C 0011 0018 001F
        DECLE   $0026,  $002E,  $0034,  $003A   ; 50C1   0026 002E 0034 003A
        DECLE   $0041,  $0047,  $004D,  $0054   ; 50C5   0041 0047 004D 0054
        DECLE   $0000,  $0005,  $015D,  $01AD   ; 50C9   0000 0005 015D 01AD
        DECLE   $010D,  $02D4,  $0000           ; 50CD   010D 02D4 0000

        DECR    R3                              ; 50D0   0013
        MVI@    R4,     R7                      ; 50D1   02A7

        ADD@    R1,     R0                      ; 50D2   02C8
        SUB@    R1,     R7                      ; 50D3   030F

        DECLE   $0000,  $0000,  $0095,  $0000   ; 50D4   0000 0000 0095 0000
        DECLE   $0013,  $0306,  $02D2,  $02C6   ; 50D8   0013 0306 02D2 02C6
        DECLE   $0203,  $0000,  $0274,  $0043   ; 50DC   0203 0000 0274 0043
        DECLE   $0004                           ; 50E0   0004

        ADD@    R5,     R1                      ; 50E1   02E9
        ADD@    R4,     R3                      ; 50E2   02E3
        MOVR    R2,     R6                      ; 50E3   0096
        ANDR    R6,     R1                      ; 50E4   01B1
        MOVR    R5,     R2                      ; 50E5   00AA
        PULR    R4                              ; 50E6   02B4
        PSHR    R5                              ; 50E7   0275
        ADCR    R2                              ; 50E8   002A
        SUB     G_01AD, R7                      ; 50E9   0307 01AD

        DECLE   $0220,  $008D,  $0210           ; 50EB   0220 008D 0210

        MVI@    R5,     R3                      ; 50EE   02AB
        PULR    R4                              ; 50EF   02B4
        ADD@    R1,     R5                      ; 50F0   02CD
        ADD@    R1,     R0                      ; 50F1   02C8
        ADD@    R4,     R1                      ; 50F2   02E1
        XORR    R2,     R0                      ; 50F3   01D0
        SLR     R0,     1                       ; 50F4   0060
        J       .EXEC.6AF                       ; 50F5   0004 0314 02AF

        DECLE   $0004                           ; 50F8   0004

        MVI@    R4,     R6                      ; 50F9   02A6
        SUB@    R4,     R7                      ; 50FA   0327

        MVI@    R4,     R1                      ; 50FB   02A1
        CMPR    R0,     R6                      ; 50FC   0146
        SUB@    R2,     R4                      ; 50FD   0314
        MVI@    R5,     R7                      ; 50FE   02AF

        DECLE   $0000,  $0276,  $012B,  $02EB   ; 50FF   0000 0276 012B 02EB
        DECLE   $018D,  $01B1,  $0276,  $0095   ; 5103   018D 01B1 0276 0095
        DECLE   $0206,  $02B2,  $02C8,  $0323   ; 5107   0206 02B2 02C8 0323
        DECLE   $0002,  $02F4,  $0004,  $02D1   ; 510B   0002 02F4 0004 02D1
        DECLE   $0004                           ; 510F   0004

        MVI@    R4,     R3                      ; 5110   02A3
        MOVR    R1,     R3                      ; 5111   008B
        SUB@    R2,     R0                      ; 5112   0310
        SUB@    R2,     R4                      ; 5113   0314
        RLC     R0,     1                       ; 5114   0050
        MVI@    R5,     R7                      ; 5115   02AF

        DECLE   $0002,  $00D6,  $020C,  $0177   ; 5116   0002 00D6 020C 0177
        DECLE   $01B2,  $02C8,  $008D,  $0115   ; 511A   01B2 02C8 008D 0115
        DECLE   $021B,  $01A8,  $02A1,  $01D5   ; 511E   021B 01A8 02A1 01D5
        DECLE   $0220,  $00A0                   ; 5122   0220 00A0

        MOVR    R6,     R4                      ; 5124   00B4
        MOVR    R6,     R5                      ; 5125   00B5
        ADDR    R1,     R0                      ; 5126   00C8
        ADDR    R1,     R1                      ; 5127   00C9
        ADDR    R3,     R4                      ; 5128   00DC
        ADDR    R3,     R5                      ; 5129   00DD
        ADDR    R3,     R6                      ; 512A   00DE
        INCR    R6                              ; 512B   000E
        INCR    R7                              ; 512C   000F

        DECR    R0                              ; 512D   0010
L_512E:
        DECR    R1                              ; 512E   0011
        DECLE   $0021,  $0022,  $0023,  $0024   ; 512F   0021 0022 0023 0024
        DECLE   $0025,  $0026,  $0036,  $0037   ; 5133   0025 0026 0036 0037
L_5137:
        RSWD    R0                              ; 5137   0038
        DECLE   $0039,  $003A,  $003B,  $004B   ; 5138   0039 003A 003B 004B
        DECLE   $004C,  $004D,  $004E,  $005F   ; 513C   004C 004D 004E 005F
        DECLE   $0060,  $0060,  $0000,  $0290   ; 5140   0060 0060 0000 0290
        DECLE   $0060,  $0294,  $0290,  $0294   ; 5144   0060 0294 0290 0294
        DECLE   $0294,  $0000,  $0002,  $0005   ; 5148   0294 0000 0002 0005
        DECLE   $01D4,  $0013,  $0294,  $0054   ; 514C   01D4 0013 0294 0054
        DECLE   $0294,  $0060,  $0000           ; 5150   0294 0060 0000

        MVI     .STIC.X.0,R3                    ; 5153   0283 0000
        MVI@    R2,     R4                      ; 5155   0294
        ADDR    R0,     R3                      ; 5156   00C3
        MVI@    R2,     R4                      ; 5157   0294
        MVI@    R1,     R7                      ; 5158   028F

        DECLE   $0094,  $0294,  $0013,  $0294   ; 5159   0094 0294 0013 0294
        DECLE   $0004,  $01B4,  $0000,  $0004   ; 515D   0004 01B4 0000 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5161   0000 0000 0000 0000
        DECLE   $0000,  $00AE,  $00AE,  $0294   ; 5165   0000 00AE 00AE 0294
        DECLE   $0060,  $0005,  $01E0,  $0013   ; 5169   0060 0005 01E0 0013
        DECLE   $00E1,  $00B4,  $0294,  $0294   ; 516D   00E1 00B4 0294 0294
        DECLE   $0224                           ; 5171   0224

        MVI@    R2,     R4                      ; 5172   0294
        SLR     R0,     1                       ; 5173   0060
        PSHR    R4                              ; 5174   0274
        XORR    R4,     R0                      ; 5175   01E0
        MOVR    R1,     R5                      ; 5176   008D
        MVI@    R2,     R0                      ; 5177   0290
        SAR     R2,     2                       ; 5178   006E
        MVI@    R1,     R7                      ; 5179   028F

        PSHR    R4                              ; 517A   0274
        MVI@    R2,     R1                      ; 517B   0291
L_517C:
        MOVR    R2,     R4                      ; 517C   0094
        XORR    R4,     R0                      ; 517D   01E0
        DECR    R3                              ; 517E   0013
        B       L_517C                          ; 517F   0220 0004

        DECLE   $0224,  $0294,  $00D0,  $028D   ; 5181   0224 0294 00D0 028D
        DECLE   $028D,  $01B2,  $0290,  $00CA   ; 5185   028D 01B2 0290 00CA
        DECLE   $0000,  $00AA,  $0000,  $0274   ; 5189   0000 00AA 0000 0274
        DECLE   $0201,  $00F4,  $0294,  $01F3   ; 518D   0201 00F4 0294 01F3
        DECLE   $00F4,  $0294,  $01AF,  $0274   ; 5191   00F4 0294 01AF 0274
        DECLE   $0214,  $028D,  $0294,  $0286   ; 5195   0214 028D 0294 0286
        DECLE   $01F3,  $0288,  $0233,  $0290   ; 5199   01F3 0288 0233 0290
        DECLE   $0073,  $0292,  $0294,  $01E2   ; 519D   0073 0292 0294 01E2
        DECLE   $0294,  $0294,  $0294,  $0294   ; 51A1   0294 0294 0294 0294
        DECLE   $0294,  $0294,  $0112,  $0224   ; 51A5   0294 0294 0112 0224
        DECLE   $0000                           ; 51A9   0000

        SLL     R2,     2                       ; 51AA   004E
        MOVR    R5,     R2                      ; 51AB   00AA
        MVI@    R2,     R4                      ; 51AC   0294
        MVI@    R2,     R4                      ; 51AD   0294
        MVI@    R2,     R4                      ; 51AE   0294
        MVI@    R2,     R4                      ; 51AF   0294
        MVI@    R2,     R4                      ; 51B0   0294
        MVI@    R2,     R4                      ; 51B1   0294
        MVI@    R1,     R7                      ; 51B2   028F

        DECLE   $0294,  $0291,  $0294,  $0220   ; 51B3   0294 0291 0294 0220
        DECLE   $0294,  $0203,  $0141           ; 51B7   0294 0203 0141

        XORR    R0,     R6                      ; 51BA   01C6
        MVI@    R2,     R4                      ; 51BB   0294
        MVI@    R2,     R4                      ; 51BC   0294
        MVI@    R2,     R4                      ; 51BD   0294
        MVI@    R2,     R4                      ; 51BE   0294
        MVI@    R2,     R4                      ; 51BF   0294
        MVI@    R2,     R4                      ; 51C0   0294
        MVI@    R1,     R5                      ; 51C1   028D
        ANDR    R6,     R1                      ; 51C2   01B1
        MVI     G_01C3, R1                      ; 51C3   0281 01C3
        MVI@    R1,     R0                      ; 51C5   0288
        MVI@    R1,     R7                      ; 51C6   028F
        B       L_5137                          ; 51C7   0220 0091

        DECLE   $0224,  $01B4,  $00C3,  $0004   ; 51C9   0224 01B4 00C3 0004
        DECLE   $0291,  $0002,  $0220,  $0004   ; 51CD   0291 0002 0220 0004
        DECLE   $0094,  $0294,  $0054,  $0294   ; 51D1   0094 0294 0054 0294
        DECLE   $0274,  $0294,  $0274,  $0294   ; 51D5   0274 0294 0274 0294
.GRAM_INIT_51D9:
        DECLE   $0015           ; 51D9  # of GRAM cards to init
        DECLE   $03FF,  $03FC   ; 51DA  #00   :  4x4 tile
        DECLE   $0259,  $014E   ; 51DC  #01   :  Algo #1
        DECLE   $021F,  $0316   ; 51DE  #02   :  Algo #1
        DECLE   $02AF,  $00FD   ; 51E0  #03   :  Algo #2
        DECLE   $0251,  $03B9   ; 51E2  #04   :  Algo #2
        DECLE   $03B1,  $035F   ; 51E4  #05   :  Algo #2
        DECLE   $0001,  $0380   ; 51E6  #06-0D:  CART #00-07 ----
        DECLE   $0011,  $0280   ; 51E8  #0E-13:  CART #08-0D ----
        DECLE   $0001,  $0004   ; 51EA  #14   :  4x4 tile

L_51EC:
        PSHR    R5                              ; 51EC   0275
        MVII    #$0009, R0                      ; 51ED   02B8 0009
        MVO     R0,     G_0115                  ; 51EF   0240 0115
        MVII    #$00A0, R0                      ; 51F1   02B8 00A0
        MVO     R0,     G_0116                  ; 51F3   0240 0116
        MVII    #$0200, R4                      ; 51F5   02BC 0200
        SDBD                                    ; 51F7   0001
        MVII    #$50C9, R5                      ; 51F8   02BD 00C9 0050
L_51FB:
        MVI@    R5,     R0                      ; 51FB   02A8
        MOVR    R0,     R1                      ; 51FC   0081
        ANDI    #$001F, R1                      ; 51FD   03B9 001F
        SLR     R0,     2                       ; 51FF   0064
        SLR     R0,     2                       ; 5200   0064
        SLR     R0,     1                       ; 5201   0060
L_5202:
        MOVR    R0,     R2                      ; 5202   0082
        SUBI    #$0014, R2                      ; 5203   033A 0014
        BPL     L_521A                          ; 5205   0203 0013

        SLL     R0,     2                       ; 5207   004C
        SLL     R0,     1                       ; 5208   0048
        SDBD                                    ; 5209   0001
        XORI    #$0805, R0                      ; 520A   03F8 0005 0008
        MVO@    R0,     R4                      ; 520D   0260
L_520E:
        MOVR    R1,     R0                      ; 520E   0088
        COMR    R1                              ; 520F   0019
        BMI     L_5202                          ; 5210   022B 000F

        CMPI    #$02F0, R4                      ; 5212   037C 02F0
        BLT     L_51FB                          ; 5214   0225 001A

        JSR     R5,     L_5CC2                  ; 5216   0004 015C 00C2

L_5219:
        PULR    R7                              ; 5219   02B7

L_521A:
        DECR    R2                              ; 521A   0012
        BMI     L_520E                          ; 521B   022B 000E

        CLRR    R0                              ; 521D   01C0
        MVO@    R0,     R4                      ; 521E   0260
        B       L_521A                          ; 521F   0220 0006

L_5221:
        PSHR    R5                              ; 5221   0275
        MVII    #$0000, R5                      ; 5222   02BD 0000
        MVO     R5,     G_0115                  ; 5224   0245 0115
        MVII    #$0098, R5                      ; 5226   02BD 0098
        MVO     R5,     G_0116                  ; 5228   0245 0116
        SLR     R0,     1                       ; 522A   0060
        SLR     R1,     1                       ; 522B   0061
        MVO     R0,     G_015D                  ; 522C   0240 015D
        MVO     R1,     G_015E                  ; 522E   0241 015E
        MVO     R0,     G_015F                  ; 5230   0240 015F
        MVO     R1,     G_0160                  ; 5232   0241 0160
        CLRR    R1                              ; 5234   01C9
        MVO     R1,     G_0163                  ; 5235   0241 0163

L_5237:
        JSR     R5,     L_524A                  ; 5237   0004 0150 024A

        MVI     G_015D, R0                      ; 523A   0280 015D
        MVO     R0,     G_015F                  ; 523C   0240 015F
        MVI     G_0160, R0                      ; 523E   0280 0160
        INCR    R0                              ; 5240   0008
        MVO     R0,     G_0160                  ; 5241   0240 0160
        SUB     G_015E, R0                      ; 5243   0300 015E
        CMPI    #$000C, R0                      ; 5245   0378 000C
        BLT     L_5237                          ; 5247   0225 0011
        PULR    R7                              ; 5249   02B7

L_524A:
        PSHR    R5                              ; 524A   0275
        MVII    #$0014, R0                      ; 524B   02B8 0014
        MVO     R0,     G_0161                  ; 524D   0240 0161

L_524F:
        JSR     R5,     L_525E                  ; 524F   0004 0150 025E

        MVI     G_015F, R0                      ; 5252   0280 015F
        INCR    R0                              ; 5254   0008
        MVO     R0,     G_015F                  ; 5255   0240 015F
        MVI     G_0163, R0                      ; 5257   0280 0163
        INCR    R0                              ; 5259   0008
        MVO     R0,     G_0163                  ; 525A   0240 0163
        B       L_524F                          ; 525C   0220 000E

L_525E:
        MVI     G_0161, R0                      ; 525E   0280 0161
        DECR    R0                              ; 5260   0010
        BMI     L_5219                          ; 5261   022B 0049

        MVO     R0,     G_0161                  ; 5263   0240 0161
        PSHR    R5                              ; 5265   0275
        MVI     G_0160, R1                      ; 5266   0281 0160
        MOVR    R1,     R2                      ; 5268   008A
        ANDI    #$0003, R2                      ; 5269   03BA 0003
        SLR     R1,     2                       ; 526B   0065
        SDBD                                    ; 526C   0001
        ADDI    #$50BD, R1                      ; 526D   02F9 00BD 0050
        ADD@    R1,     R1                      ; 5270   02C9
        MVI     G_015F, R0                      ; 5271   0280 015F
        MOVR    R0,     R3                      ; 5273   0083
        ANDI    #$0003, R3                      ; 5274   03BB 0003
        SLR     R0,     2                       ; 5276   0064
        SLL     R2,     2                       ; 5277   004E
        ADDR    R2,     R3                      ; 5278   00D3
L_5279:
        MVI@    R1,     R2                      ; 5279   028A
        INCR    R1                              ; 527A   0009
        MOVR    R2,     R4                      ; 527B   0094
        SLR     R2,     2                       ; 527C   0066
        SLR     R2,     2                       ; 527D   0066
        SLR     R2,     1                       ; 527E   0062
        ANDI    #$001F, R4                      ; 527F   03BC 001F
L_5281:
        SUBI    #$0014, R2                      ; 5281   033A 0014
        BMI     L_528E                          ; 5283   020B 0009

        SUBR    R2,     R0                      ; 5285   0110
        BMI     L_52AF                          ; 5286   020B 0027

L_5288:
        MOVR    R4,     R2                      ; 5288   00A2
        COMR    R4                              ; 5289   001C
        BMI     L_5281                          ; 528A   022B 000A
        B       L_5279                          ; 528C   0220 0014

L_528E:
        DECR    R0                              ; 528E   0010
        BPL     L_5288                          ; 528F   0223 0008

        ADDI    #$0014, R2                      ; 5291   02FA 0014
        SLL     R2,     2                       ; 5293   004E
        SLL     R2,     1                       ; 5294   004A
        BEQ     L_52A9                          ; 5295   0204 0012

        SDBD                                    ; 5297   0001
        ADDI    #$5139, R2                      ; 5298   02FA 0039 0051
        SARC    R3,     1                       ; 529B   007B
        RLC     R1,     1                       ; 529C   0051
        ADDR    R3,     R2                      ; 529D   00DA
        MVI@    R2,     R0                      ; 529E   0290
        SARC    R1,     1                       ; 529F   0079
        BNC     L_52A5                          ; 52A0   0209 0003

        SLL     R0,     2                       ; 52A2   004C
        SLL     R0,     1                       ; 52A3   0048
        INCR    R7                              ; 52A4   000F

L_52A5:
        SLR     R0,     2                       ; 52A5   0064
L_52A6:
        ANDI    #$00F8, R0                      ; 52A6   03B8 00F8
        INCR    R7                              ; 52A8   000F

L_52A9:
        CLRR    R0                              ; 52A9   01C0
L_52AA:
        SDBD                                    ; 52AA   0001
        XORI    #$1806, R0                      ; 52AB   03F8 0006 0018
        INCR    R7                              ; 52AE   000F

L_52AF:
        CLRR    R0                              ; 52AF   01C0
L_52B0:
        MVI     G_0163, R4                      ; 52B0   0284 0163
        ADDI    #$0200, R4                      ; 52B2   02FC 0200
        MVO@    R0,     R4                      ; 52B4   0260
        PULR    R7                              ; 52B5   02B7

L_52B6:
        PSHR    R5                              ; 52B6   0275
        MVI     G_01D9, R0                      ; 52B7   0280 01D9
        TSTR    R0                              ; 52B9   0080
        BEQ     L_52BF                          ; 52BA   0204 0003

        DECR    R0                              ; 52BC   0010
        MVO     R0,     G_01D9                  ; 52BD   0240 01D9
L_52BF:
        MVI     G_0164, R5                      ; 52BF   0285 0164
        INCR    R5                              ; 52C1   000D
        ADDR    R7,     R5                      ; 52C2   00FD
        ADD@    R5,     R7                      ; 52C3   02EF

        DECLE   $0009,  $0026,  $003D,  $005D   ; 52C4   0009 0026 003D 005D
        DECLE   $006F,  $00BC,  $00CD,  $0082   ; 52C8   006F 00BC 00CD 0082
        DECLE   $001F                           ; 52CC   001F

        MVI     G_01D9, R0                      ; 52CD   0280 01D9
        TSTR    R0                              ; 52CF   0080
        BNEQ    L_52E3                          ; 52D0   020C 0011

        MVII    #$0001, R0                      ; 52D2   02B8 0001
        MVO     R0,     G_0164                  ; 52D4   0240 0164

        JSR     R5,     L_52E7                  ; 52D6   0004 0150 02E7
        DECLE   $0022,  $0054,  $0039,  $0054   ; 52D9   0022 0054 0039 0054
        DECLE   $0000,  $0000,  $0000,  $0000   ; 52DD   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 52E1   0000 0000
L_52E3:
        SDBD                                    ; 52E3   0001
        MVII    #$1906, R5                      ; 52E4   02BD 0006 0019
L_52E7:
        MVO     R5,     G_035D                  ; 52E7   0245 035D
L_52E9:
        PULR    R7                              ; 52E9   02B7

        JSR     R5,     L_5689                  ; 52EA   0004 0154 0289

        CLRR    R1                              ; 52ED   01C9
        CMP     G_01D9, R1                      ; 52EE   0341 01D9
        BNEQ    L_52FA                          ; 52F0   020C 0008

        JSR     R5,     L_539B                  ; 52F2   0004 0150 039B

        MVII    #$0001, R1                      ; 52F5   02B9 0001

        JSR     R5,     L_539B                  ; 52F7   0004 0150 039B
L_52FA:
        JSR     R5,     L_55F9                  ; 52FA   0004 0154 01F9
        JSR     R5,     L_5639                  ; 52FD   0004 0154 0239

        PULR    R7                              ; 5300   02B7

        MVI     G_0176, R3                      ; 5301   0283 0176
        SARC    R3,     2                       ; 5303   007F
        CLRR    R2                              ; 5304   01D2
        RLC     R2,     2                       ; 5305   0056
        MVI     G_015F, R0                      ; 5306   0280 015F
        DECR    R0                              ; 5308   0010
        BPL     L_530D                          ; 5309   0203 0002

        MVII    #$0003, R0                      ; 530B   02B8 0003
L_530D:
        MVO     R0,     G_015F                  ; 530D   0240 015F
        CMPI    #$0002, R0                      ; 530F   0378 0002
        BGE     L_5316                          ; 5311   020D 0003

        MVII    #$0004, R2                      ; 5313   02BA 0004
        MOVR    R2,     R3                      ; 5315   0093
L_5316:
        MOVR    R3,     R4                      ; 5316   009C
        PSHR    R2                              ; 5317   0272
        CLRR    R1                              ; 5318   01C9

        JSR     R5,     L_53B8                  ; 5319   0004 0150 03B8

        PULR    R4                              ; 531C   02B4
        MVII    #$0001, R1                      ; 531D   02B9 0001
        B       L_53B9                          ; 531F   0200 0098

        MVI     G_0176, R0                      ; 5321   0280 0176
        ANDI    #$0007, R0                      ; 5323   03B8 0007

        JSR     R5,     .EXEC.76C               ; 5325   0004 0114 036C

        MVI@    R1,     R0                      ; 5328   0288
        MOVR    R0,     R2                      ; 5329   0082
        ANDI    #$000F, R2                      ; 532A   03BA 000F
        XORR    R2,     R0                      ; 532C   01D0
        INCR    R2                              ; 532D   000A
        ANDI    #$000F, R2                      ; 532E   03BA 000F
        XORR    R2,     R0                      ; 5330   01D0
        MVO@    R0,     R1                      ; 5331   0248
        PULR    R7                              ; 5332   02B7

        MVI     G_01D9, R0                      ; 5333   0280 01D9
        TSTR    R0                              ; 5335   0080
        BNEQ    L_52E9                          ; 5336   022C 004E

        CLRR    R0                              ; 5338   01C0
        MVO     R0,     G_01E6                  ; 5339   0240 01E6
        MVO     R0,     G_01E7                  ; 533B   0240 01E7
        MVII    #$0007, R0                      ; 533D   02B8 0007
        MVO     R0,     G_0164                  ; 533F   0240 0164
        MVII    #$000A, R0                      ; 5341   02B8 000A
        MVO     R0,     G_01D8                  ; 5343   0240 01D8
        PULR    R7                              ; 5345   02B7

        MVI     G_01E6, R0                      ; 5346   0280 01E6
        INCR    R0                              ; 5348   0008
        MVO     R0,     G_01E6                  ; 5349   0240 01E6
        SARC    R0,     1                       ; 534B   0078
        BC      L_5361                          ; 534C   0201 0013

        MVI     G_01E7, R0                      ; 534E   0280 01E7
        TSTR    R0                              ; 5350   0080
        BEQ     L_5366                          ; 5351   0204 0013

        MVII    #$0007, R0                      ; 5353   02B8 0007
        MVII    #$031D, R1                      ; 5355   02B9 031D

        JSR     R5,     L_5BE7                  ; 5357   0004 0158 03E7

        MVII    #$0038, R0                      ; 535A   02B8 0038
        MVII    #$0335, R1                      ; 535C   02B9 0335

        JSR     R5,     L_5BE7                  ; 535E   0004 0158 03E7

L_5361:
        CLRR    R0                              ; 5361   01C0
        MVO     R0,     G_01E7                  ; 5362   0240 01E7
        B       L_5389                          ; 5364   0200 0023

L_5366:
        MVII    #$0005, R0                      ; 5366   02B8 0005
        MVO     R0,     G_0164                  ; 5368   0240 0164
        MVII    #$0010, R0                      ; 536A   02B8 0010
        SWAP    R0,     1                       ; 536C   0040

        JSR     R5,     L_5CB2                  ; 536D   0004 015C 00B2
        JSR     R5,     L_5BC8                  ; 5370   0004 0158 03C8
        JSR     R5,     L_52E7                  ; 5373   0004 0150 02E7
        DECLE   $0000,  $0000,  $0072,  $0057   ; 5376   0000 0000 0072 0057
        DECLE   $0000,  $0000                   ; 537A   0000 0000

        SLLC    R0,     2                       ; 537C   005C
        SLLC    R1,     1                       ; 537D   0059
        SLLC    R0,     2                       ; 537E   005C
        SLLC    R1,     1                       ; 537F   0059

        JSR     R5,     L_5A01                  ; 5380   0004 0158 0201
        JSR     R5,     L_57C6                  ; 5383   0004 0154 03C6
        JSR     R5,     L_589B                  ; 5386   0004 0158 009B

L_5389:
        MVI     G_01D8, R0                      ; 5389   0280 01D8
        DECR    R0                              ; 538B   0010
        BMI     L_52E9                          ; 538C   022B 00A4

        MVO     R0,     G_01D8                  ; 538E   0240 01D8
        PULR    R7                              ; 5390   02B7

        MVI     G_0177, R0                      ; 5391   0280 0177
        XOR     G_0165, R0                      ; 5393   03C0 0165
        MVO     R0,     G_0177                  ; 5395   0240 0177

        JSR     R5,     L_5CC2                  ; 5397   0004 015C 00C2

        PULR    R7                              ; 539A   02B7

L_539B:
        PSHR    R5                              ; 539B   0275

        JSR     R5,     L_53E3                  ; 539C   0004 0150 03E3
        DECLE   $017B                           ; 539F   017B

        MOVR    R3,     R4                      ; 53A0   009C

        JSR     R5,     L_53E3                  ; 53A1   0004 0150 03E3
        DECLE   $015F                           ; 53A4   015F

        DECR    R3                              ; 53A5   0013
        BPL     L_53AA                          ; 53A6   0203 0002

        MVII    #$000A, R3                      ; 53A8   02BB 000A

L_53AA:
        JSR     R5,     L_53EB                  ; 53AA   0004 0150 03EB
        DECLE   $015F                           ; 53AD   015F

        CMPI    #$0009, R3                      ; 53AE   037B 0009
        BGE     L_53B4                          ; 53B0   020D 0002

        MVII    #$0004, R4                      ; 53B2   02BC 0004
L_53B4:
        MVII    #$0018, R5                      ; 53B4   02BD 0018
        B       L_53BB                          ; 53B6   0200 0003

L_53B8:
        PSHR    R5                              ; 53B8   0275
L_53B9:
        MVII    #$0090, R5                      ; 53B9   02BD 0090
L_53BB:
        SLL     R1,     1                       ; 53BB   0049
        XORR    R1,     R5                      ; 53BC   01CD
        SLL     R1,     2                       ; 53BD   004D
        SLL     R1,     2                       ; 53BE   004D
        ADDI    #$0335, R1                      ; 53BF   02F9 0335
        MVII    #$0003, R2                      ; 53C1   02BA 0003
L_53C3:
        MOVR    R5,     R0                      ; 53C3   00A8
        CMPR    R2,     R4                      ; 53C4   0154
        BNEQ    L_53C9                          ; 53C5   020C 0002

        XORI    #$0010, R0                      ; 53C7   03F8 0010
L_53C9:
        SWAP    R0,     1                       ; 53C9   0040
        MOVR    R2,     R3                      ; 53CA   0093
        ADDR    R7,     R3                      ; 53CB   00FB
        ADDI    #$000A, R3                      ; 53CC   02FB 000A
        XOR@    R3,     R0                      ; 53CE   03D8
        MVO@    R0,     R1                      ; 53CF   0248
        SUBI    #$0008, R1                      ; 53D0   0339 0008
        DECR    R2                              ; 53D2   0012
        BPL     L_53C3                          ; 53D3   0223 0011
        PULR    R7                              ; 53D5   02B7

        DECLE   $0000                           ; 53D6   0000

        EIS                                     ; 53D7   0002
        CLRC                                    ; 53D8   0006
        SETC                                    ; 53D9   0007
L_53DA:
        DECR    R6                              ; 53DA   0016

L_53DB:
        JSR     R5,     L_5F97                  ; 53DB   0004 015C 0397

        PULR    R7                              ; 53DE   02B7

L_53DF:
        MOVR    R1,     R3                      ; 53DF   008B
        SLL     R3,     2                       ; 53E0   004F
        ADDR    R2,     R3                      ; 53E1   00D3
        INCR    R7                              ; 53E2   000F

L_53E3:
        MOVR    R1,     R3                      ; 53E3   008B
L_53E4:
        ADD@    R5,     R3                      ; 53E4   02EB
        MVI@    R3,     R3                      ; 53E5   029B
        MOVR    R5,     R7                      ; 53E6   00AF

L_53E7:
        PSHR    R1                              ; 53E7   0271
        SLL     R1,     2                       ; 53E8   004D
        ADDR    R2,     R1                      ; 53E9   00D1
        INCR    R7                              ; 53EA   000F

L_53EB:
        PSHR    R1                              ; 53EB   0271
L_53EC:
        ADD@    R5,     R1                      ; 53EC   02E9
        MVO@    R3,     R1                      ; 53ED   024B
        PULR    R1                              ; 53EE   02B1
        MOVR    R5,     R7                      ; 53EF   00AF

L_53F0:
        PSHR    R5                              ; 53F0   0275
        MOVR    R1,     R5                      ; 53F1   008D
        ADDR    R5,     R5                      ; 53F2   00ED
        ADDR    R5,     R5                      ; 53F3   00ED
        ADDR    R2,     R5                      ; 53F4   00D5
        ADDI    #$01BE, R5                      ; 53F5   02FD 01BE
        PULR    R7                              ; 53F7   02B7

L_53F8:
        PSHR    R5                              ; 53F8   0275

        JSR     R5,     L_53DF                  ; 53F9   0004 0150 03DF
        DECLE   $017D                           ; 53FC   017D

        JSR     R5,     L_53F0                  ; 53FD   0004 0150 03F0

        MVII    #$03FF, R0                      ; 5400   02B8 03FF
L_5402:
        MVI@    R5,     R4                      ; 5402   02AC
        ANDI    #$0007, R4                      ; 5403   03BC 0007
        CMPI    #$0007, R4                      ; 5405   037C 0007
        BNEQ    L_5410                          ; 5407   020C 0007

        PSHR    R3                              ; 5409   0273
        ANDI    #$0010, R3                      ; 540A   03BB 0010
        PULR    R3                              ; 540C   02B3
        BEQ     L_5410                          ; 540D   0204 0001

        INCR    R4                              ; 540F   000C
L_5410:
        SDBD                                    ; 5410   0001
        ADDI    #$5FC8, R4                      ; 5411   02FC 00C8 005F
        MVI@    R4,     R4                      ; 5414   02A4
        CMPR    R4,     R0                      ; 5415   0160
        BLE     L_5419                          ; 5416   0206 0001

        MOVR    R4,     R0                      ; 5418   00A0
L_5419:
        ADDI    #$0007, R5                      ; 5419   02FD 0007
        DECR    R3                              ; 541B   0013
        MOVR    R3,     R4                      ; 541C   009C
        ANDI    #$0003, R4                      ; 541D   03BC 0003
        BNEQ    L_5402                          ; 541F   022C 001E
        PULR    R7                              ; 5421   02B7

L_5422:
        PSHR    R5                              ; 5422   0275
        TSTR    R0                              ; 5423   0080
        BMI     L_54DC                          ; 5424   020B 00B6

        JSR     R5,     L_54DD                  ; 5426   0004 0154 00DD

        PSHR    R0                              ; 5429   0270

        JSR     R5,     L_53F8                  ; 542A   0004 0150 03F8

        SLL     R1,     2                       ; 542D   004D
        ADDR    R1,     R2                      ; 542E   00CA
        PULR    R1                              ; 542F   02B1

        JSR     R5,     .EXEC.629               ; 5430   0004 0114 0229

        SLL     R2,     2                       ; 5433   004E
        SLL     R2,     1                       ; 5434   004A
        ADDI    #$0321, R2                      ; 5435   02FA 0321
        MVO@    R0,     R2                      ; 5437   0250
        PULR    R7                              ; 5438   02B7

        PSHR    R5                              ; 5439   0275

        JSR     R5,     L_53E3                  ; 543A   0004 0150 03E3
        DECLE   $017B                           ; 543D   017B

        MOVR    R3,     R2                      ; 543E   009A
        CMPI    #$000A, R0                      ; 543F   0378 000A
        BEQ     L_54ED                          ; 5441   0204 00AA

        CMPI    #$000B, R0                      ; 5443   0378 000B
        BEQ     L_5520                          ; 5445   0204 00D9

        DECR    R0                              ; 5447   0010
        BMI     L_54A1                          ; 5448   020B 0057

        CMPI    #$0007, R0                      ; 544A   0378 0007
        BEQ     L_545D                          ; 544C   0204 000F
        BLT     L_5451                          ; 544E   0205 0001

        DECR    R0                              ; 5450   0010

L_5451:
        JSR     R5,     L_53DF                  ; 5451   0004 0150 03DF
        DECLE   $017D                           ; 5454   017D

        MOVR    R3,     R5                      ; 5455   009D
        ANDI    #$0004, R5                      ; 5456   03BD 0004
        BEQ     L_5467                          ; 5458   0204 000D
        J       L_56EE                          ; 545A   0004 0354 02EE

L_545D:
        MVI     G_0164, R0                      ; 545D   0280 0164
        CMPI    #$0002, R0                      ; 545F   0378 0002
        BNEQ    L_54DC                          ; 5461   020C 0079

        JSR     R5,     L_5ADA                  ; 5463   0004 0158 02DA

        PULR    R7                              ; 5466   02B7

L_5467:
        PSHR    R3                              ; 5467   0273
        ANDI    #$0003, R3                      ; 5468   03BB 0003
        CMPI    #$0003, R3                      ; 546A   037B 0003
        BGE     L_53DA                          ; 546C   022D 0093

        JSR     R5,     L_53F0                  ; 546E   0004 0150 03F0

L_5471:
        DECR    R3                              ; 5471   0013
        BMI     L_547E                          ; 5472   020B 000A

        MVI@    R5,     R4                      ; 5474   02AC
        ANDI    #$0007, R4                      ; 5475   03BC 0007
        CMPR    R4,     R0                      ; 5477   0160
        BEQ     L_53DA                          ; 5478   0224 009F

        ADDI    #$0007, R5                      ; 547A   02FD 0007
        B       L_5471                          ; 547C   0220 000C

L_547E:
        MOVR    R0,     R4                      ; 547E   0084
        SDBD                                    ; 547F   0001
        ADDI    #$5FC0, R4                      ; 5480   02FC 00C0 005F
        MVI@    R4,     R4                      ; 5483   02A4
        MVO@    R4,     R5                      ; 5484   026C
        MOVR    R0,     R3                      ; 5485   0083
        ADDI    #$01B5, R3                      ; 5486   02FB 01B5
        MVI@    R3,     R0                      ; 5488   0298

        JSR     R5,     L_5496                  ; 5489   0004 0154 0096

        BNEQ    L_53DA                          ; 548C   022C 00B3

        MVO@    R0,     R3                      ; 548E   0258
        PULR    R3                              ; 548F   02B3
        INCR    R3                              ; 5490   000B

        JSR     R5,     L_53E7                  ; 5491   0004 0150 03E7
        DECLE   $017D                           ; 5494   017D

        PULR    R7                              ; 5495   02B7

L_5496:
        PSHR    R5                              ; 5496   0275
        MOVR    R1,     R4                      ; 5497   008C
        BNEQ    L_549C                          ; 5498   020C 0002

        MVII    #$0010, R4                      ; 549A   02BC 0010
L_549C:
        SUBR    R4,     R0                      ; 549C   0120
        MOVR    R0,     R4                      ; 549D   0084
        ANDI    #$0088, R4                      ; 549E   03BC 0088
        PULR    R7                              ; 54A0   02B7

L_54A1:
        JSR     R5,     L_54DD                  ; 54A1   0004 0154 00DD
        JSR     R5,     L_53DF                  ; 54A4   0004 0150 03DF
        DECLE   $017D                           ; 54A7   017D

        ANDI    #$00EF, R3                      ; 54A8   03BB 00EF

        JSR     R5,     L_53E7                  ; 54AA   0004 0150 03E7
        DECLE   $017D                           ; 54AD   017D

        MOVR    R1,     R3                      ; 54AE   008B
        SLL     R3,     2                       ; 54AF   004F
        ADDR    R2,     R3                      ; 54B0   00D3
        SLL     R3,     2                       ; 54B1   004F
        SLL     R3,     1                       ; 54B2   004B
        ADDI    #$031D, R3                      ; 54B3   02FB 031D

        JSR     R5,     L_55B7                  ; 54B5   0004 0154 01B7
        JSR     R5,     L_55D2                  ; 54B8   0004 0154 01D2

        CMPI    #$0005, R0                      ; 54BB   0378 0005
        BGT     L_54D8                          ; 54BD   020E 0019

        MVI     G_0164, R0                      ; 54BF   0280 0164
        CMPI    #$0001, R0                      ; 54C1   0378 0001
        BNEQ    L_54D8                          ; 54C3   020C 0013

        MVI     G_01BD, R0                      ; 54C5   0280 01BD

        JSR     R5,     L_5496                  ; 54C7   0004 0154 0096

        BNEQ    L_54D8                          ; 54CA   020C 000C

        MVO     R0,     G_01BD                  ; 54CC   0240 01BD
        CLRR    R0                              ; 54CE   01C0
        INCR    R3                              ; 54CF   000B
        MVO@    R0,     R3                      ; 54D0   0258
        MOVR    R2,     R3                      ; 54D1   0093

        JSR     R5,     L_53EB                  ; 54D2   0004 0150 03EB
        DECLE   $0178                           ; 54D5   0178

        B       L_54F9                          ; 54D6   0200 0021

L_54D8:
        CLRR    R0                              ; 54D8   01C0
        ADDI    #$0004, R3                      ; 54D9   02FB 0004
        MVO@    R0,     R3                      ; 54DB   0258
L_54DC:
        PULR    R7                              ; 54DC   02B7

L_54DD:
        PSHR    R5                              ; 54DD   0275

        JSR     R5,     L_53E3                  ; 54DE   0004 0150 03E3
        DECLE   $017B                           ; 54E1   017B

        MOVR    R3,     R2                      ; 54E2   009A

        JSR     R5,     L_53DF                  ; 54E3   0004 0150 03DF
        DECLE   $017D                           ; 54E6   017D

        ANDI    #$0004, R3                      ; 54E7   03BB 0004
        PULR    R5                              ; 54E9   02B5
        BEQ     L_54DC                          ; 54EA   0224 000F
        MOVR    R5,     R7                      ; 54EC   00AF

L_54ED:
        JSR     R5,     L_53E3                  ; 54ED   0004 0150 03E3
        DECLE   $0178                           ; 54F0   0178

        CMPI    #$0004, R3                      ; 54F1   037B 0004
        BGE     L_53DB                          ; 54F3   022D 0119

        JSR     R5,     L_53EB                  ; 54F5   0004 0150 03EB
        DECLE   $017B                           ; 54F8   017B
L_54F9:
        MOVR    R3,     R2                      ; 54F9   009A

        JSR     R5,     L_53DF                  ; 54FA   0004 0150 03DF
        DECLE   $017D                           ; 54FD   017D

        ANDI    #$0003, R3                      ; 54FE   03BB 0003

        JSR     R5,     L_53F0                  ; 5500   0004 0150 03F0

        PSHR    R1                              ; 5503   0271
        TSTR    R1                              ; 5504   0089
        BNEQ    L_5509                          ; 5505   020C 0002

        MVII    #$0010, R1                      ; 5507   02B9 0010
L_5509:
        DECR    R3                              ; 5509   0013
        BMI     L_5519                          ; 550A   020B 000D

        MVI@    R5,     R4                      ; 550C   02AC
        ANDI    #$0007, R4                      ; 550D   03BC 0007
        ADDI    #$01B5, R4                      ; 550F   02FC 01B5
        MVI@    R4,     R0                      ; 5511   02A0
        ADDR    R1,     R0                      ; 5512   00C8
        DECR    R4                              ; 5513   0014
        MVO@    R0,     R4                      ; 5514   0260
        ADDI    #$0007, R5                      ; 5515   02FD 0007
        B       L_5509                          ; 5517   0220 000F

L_5519:
        PULR    R1                              ; 5519   02B1
        CLRR    R3                              ; 551A   01DB

        JSR     R5,     L_53E7                  ; 551B   0004 0150 03E7
        DECLE   $017D                           ; 551E   017D

        PULR    R7                              ; 551F   02B7

L_5520:
        JSR     R5,     L_53DF                  ; 5520   0004 0150 03DF
        DECLE   $017D                           ; 5523   017D

        MOVR    R3,     R5                      ; 5524   009D
        ANDI    #$0004, R5                      ; 5525   03BD 0004
        BNEQ    L_552E                          ; 5527   020C 0005

        MOVR    R3,     R5                      ; 5529   009D
        ANDI    #$0003, R5                      ; 552A   03BD 0003
        BNEQ    L_554C                          ; 552C   020C 001E

L_552E:
        MOVR    R2,     R4                      ; 552E   0094
L_552F:
        INCR    R2                              ; 552F   000A
        CMPR    R2,     R4                      ; 5530   0154
        CMPI    #$0004, R2                      ; 5531   037A 0004
        BLT     L_5536                          ; 5533   0205 0001

        CLRR    R2                              ; 5535   01D2
L_5536:
        CMPR    R2,     R4                      ; 5536   0154
        BEQ     L_54DC                          ; 5537   0224 005C

        JSR     R5,     L_53DF                  ; 5539   0004 0150 03DF
        DECLE   $017D                           ; 553C   017D

        ANDI    #$0004, R3                      ; 553D   03BB 0004
        BEQ     L_552F                          ; 553F   0224 0011

        MOVR    R2,     R3                      ; 5541   0093

        JSR     R5,     L_53EB                  ; 5542   0004 0150 03EB
        DECLE   $017B                           ; 5545   017B

        CLRR    R3                              ; 5546   01DB

        JSR     R5,     L_53EB                  ; 5547   0004 0150 03EB
        DECLE   $015F                           ; 554A   015F

        PULR    R7                              ; 554B   02B7

L_554C:
        XORI    #$0004, R3                      ; 554C   03FB 0004

        JSR     R5,     L_53E7                  ; 554E   0004 0150 03E7
        DECLE   $017D                           ; 5551   017D

        JSR     R5,     L_55B7                  ; 5552   0004 0154 01B7
        JSR     R5,     L_555C                  ; 5555   0004 0154 015C
        JSR     R5,     L_559B                  ; 5558   0004 0154 019B

        PULR    R7                              ; 555B   02B7

L_555C:
        PSHR    R5                              ; 555C   0275

        JSR     R5,     L_53DF                  ; 555D   0004 0150 03DF
        DECLE   $017D                           ; 5560   017D

        ANDI    #$0003, R3                      ; 5561   03BB 0003
        PSHR    R1                              ; 5563   0271
        SLL     R1,     2                       ; 5564   004D
        ADDR    R2,     R1                      ; 5565   00D1
        SLL     R1,     1                       ; 5566   0049
        MOVR    R1,     R5                      ; 5567   008D
        SLL     R1,     2                       ; 5568   004D
        ADDI    #$031D, R1                      ; 5569   02F9 031D
        ADDI    #$0185, R5                      ; 556B   02FD 0185
        SWAP    R0,     1                       ; 556D   0040
        MVO@    R0,     R5                      ; 556E   0268
        SWAP    R0,     1                       ; 556F   0040
        MVO@    R0,     R5                      ; 5570   0268
        ADDI    #$000E, R5                      ; 5571   02FD 000E
        SWAP    R0,     1                       ; 5573   0040
        MVO@    R0,     R5                      ; 5574   0268
        SWAP    R0,     1                       ; 5575   0040
        MVO@    R0,     R5                      ; 5576   0268
        MOVR    R1,     R4                      ; 5577   008C
        PULR    R1                              ; 5578   02B1
        SDBD                                    ; 5579   0001
        MVII    #$8000, R5                      ; 557A   02BD 0000 0080
        MVO@    R5,     R4                      ; 557D   0265
        SDBD                                    ; 557E   0001
        MVII    #$5E74, R5                      ; 557F   02BD 0074 005E
        MVO@    R5,     R4                      ; 5582   0265
        MVO@    R0,     R4                      ; 5583   0260
        SWAP    R0,     1                       ; 5584   0040
        MVO@    R0,     R4                      ; 5585   0260
        CLRR    R0                              ; 5586   01C0
        MVO@    R0,     R4                      ; 5587   0260
        DECR    R3                              ; 5588   0013
        MVO@    R3,     R4                      ; 5589   0263
        INCR    R0                              ; 558A   0008
        MVO@    R0,     R4                      ; 558B   0260
        MVII    #$0002, R0                      ; 558C   02B8 0002
        MVO     R0,     G_01D9                  ; 558E   0240 01D9
        PULR    R7                              ; 5590   02B7

L_5591:
        PSHR    R5                              ; 5591   0275

        JSR     R5,     L_53E3                  ; 5592   0004 0150 03E3
        DECLE   $0178                           ; 5595   0178

        CMPI    #$0003, R3                      ; 5596   037B 0003
        BLE     L_54DC                          ; 5598   0226 00BD
        INCR    R7                              ; 559A   000F

L_559B:
        PSHR    R5                              ; 559B   0275
L_559C:
        CLRR    R2                              ; 559C   01D2

L_559D:
        JSR     R5,     L_53DF                  ; 559D   0004 0150 03DF
        DECLE   $017D                           ; 55A0   017D

        ANDI    #$0004, R3                      ; 55A1   03BB 0004
        BEQ     L_55AC                          ; 55A3   0204 0007

        INCR    R2                              ; 55A5   000A
        CMPI    #$0004, R2                      ; 55A6   037A 0004
        BLT     L_559D                          ; 55A8   0225 000C
        B       L_55B1                          ; 55AA   0200 0005

L_55AC:
        CLRR    R3                              ; 55AC   01DB

        JSR     R5,     L_53E7                  ; 55AD   0004 0150 03E7
        DECLE   $017D                           ; 55B0   017D
L_55B1:
        MOVR    R2,     R3                      ; 55B1   0093

        JSR     R5,     L_53EB                  ; 55B2   0004 0150 03EB
        DECLE   $0178                           ; 55B5   0178

        PULR    R7                              ; 55B6   02B7

L_55B7:
        SDBD                                    ; 55B7   0001
        MVII    #$105E, R0                      ; 55B8   02B8 005E 0010
        TSTR    R1                              ; 55BB   0089
        BEQ     L_55C2                          ; 55BC   0204 0004

        SDBD                                    ; 55BE   0001
        MVII    #$821E, R0                      ; 55BF   02B8 001E 0082
L_55C2:
        MOVR    R5,     R7                      ; 55C2   00AF

L_55C3:
        MOVR    R0,     R1                      ; 55C3   0081
        SLL     R1,     2                       ; 55C4   004D
        SLL     R1,     1                       ; 55C5   0049
        ADDI    #$031F, R1                      ; 55C6   02F9 031F
        MVI@    R1,     R0                      ; 55C8   0288
        INCR    R1                              ; 55C9   0009
        MVI@    R1,     R1                      ; 55CA   0289
        SWAP    R0,     1                       ; 55CB   0040
        ANDI    #$00FF, R0                      ; 55CC   03B8 00FF
        SWAP    R1,     1                       ; 55CE   0041
        ANDI    #$00FF, R1                      ; 55CF   03B9 00FF
        MOVR    R5,     R7                      ; 55D1   00AF

L_55D2:
        PSHR    R5                              ; 55D2   0275

        JSR     R5,     .EXEC.7C1               ; 55D3   0004 0114 03C1
        JSR     R5,     L_55EC                  ; 55D6   0004 0154 01EC

        INCR    R7                              ; 55D9   000F

        PSHR    R5                              ; 55DA   0275
L_55DB:
        TSTR    R0                              ; 55DB   0080
        BPL     L_55DF                          ; 55DC   0203 0001

        NEGR    R0                              ; 55DE   0020
L_55DF:
        TSTR    R1                              ; 55DF   0089
        BPL     L_55E3                          ; 55E0   0203 0001

        NEGR    R1                              ; 55E2   0021
L_55E3:
        MOVR    R0,     R5                      ; 55E3   0085
        CMPR    R0,     R1                      ; 55E4   0141
        BLE     L_55E8                          ; 55E5   0206 0001

        MOVR    R1,     R5                      ; 55E7   008D
L_55E8:
        ADDR    R1,     R0                      ; 55E8   00C8
        ADDR    R5,     R0                      ; 55E9   00E8
        SLR     R0,     1                       ; 55EA   0060
L_55EB:
        PULR    R7                              ; 55EB   02B7

L_55EC:
        PSHR    R5                              ; 55EC   0275
        MOVR    R3,     R1                      ; 55ED   0099

        JSR     R5,     .EXEC.777               ; 55EE   0004 0114 0377

        MOVR    R0,     R1                      ; 55F1   0081
        ANDI    #$00FF, R1                      ; 55F2   03B9 00FF
        XORR    R1,     R0                      ; 55F4   01C8
        SWAP    R0,     1                       ; 55F5   0040
        SUBR    R2,     R0                      ; 55F6   0110
        SUBR    R3,     R1                      ; 55F7   0119
        PULR    R7                              ; 55F8   02B7

L_55F9:
        PSHR    R5                              ; 55F9   0275
        MVI     G_0176, R0                      ; 55FA   0280 0176
        INCR    R0                              ; 55FC   0008
        CMPI    #$003C, R0                      ; 55FD   0378 003C
        BLE     L_5602                          ; 55FF   0206 0001

        CLRR    R0                              ; 5601   01C0
L_5602:
        MVO     R0,     G_0176                  ; 5602   0240 0176
        MOVR    R0,     R3                      ; 5604   0083
        ANDI    #$00F0, R3                      ; 5605   03BB 00F0
        BNEQ    L_55EB                          ; 5607   022C 001D

        SARC    R0,     2                       ; 5609   007C
        RLC     R3,     2                       ; 560A   0057
        MOVR    R0,     R2                      ; 560B   0082
        ADDI    #$017D, R2                      ; 560C   02FA 017D
        MVI@    R2,     R2                      ; 560E   0292
        ANDI    #$0004, R2                      ; 560F   03BA 0004
        BEQ     L_55EB                          ; 5611   0224 0027

        MOVR    R3,     R2                      ; 5613   009A
        ADDI    #$0181, R2                      ; 5614   02FA 0181
        MVI@    R2,     R2                      ; 5616   0292
        ANDI    #$0004, R2                      ; 5617   03BA 0004
        BEQ     L_55EB                          ; 5619   0224 002F

        SLL     R3,     2                       ; 561B   004F
        SLL     R3,     1                       ; 561C   004B
        ADDI    #$033D, R3                      ; 561D   02FB 033D

        JSR     R5,     L_55C3                  ; 561F   0004 0154 01C3

        SWAP    R0,     1                       ; 5622   0040
        XORR    R1,     R0                      ; 5623   01C8

        JSR     R5,     L_55D2                  ; 5624   0004 0154 01D2

        CMPI    #$0012, R0                      ; 5627   0378 0012
        BGT     L_55EB                          ; 5629   022E 003F

        MVII    #$0002, R0                      ; 562B   02B8 0002
        MVO     R0,     G_0164                  ; 562D   0240 0164
        MVII    #$0006, R0                      ; 562F   02B8 0006

        JSR     R5,     L_5ED8                  ; 5631   0004 015C 02D8

        CLRR    R0                              ; 5634   01C0
        MVO     R0,     G_015F                  ; 5635   0240 015F
        DECR    R6                              ; 5637   0016
        PULR    R7                              ; 5638   02B7

L_5639:
        PSHR    R5                              ; 5639   0275
        MVI     G_0176, R0                      ; 563A   0280 0176
        MOVR    R0,     R1                      ; 563C   0081
        ANDI    #$00F8, R1                      ; 563D   03B9 00F8
        CMPI    #$0010, R1                      ; 563F   0379 0010
        BNEQ    L_55EB                          ; 5641   022C 0057

        XORR    R1,     R0                      ; 5643   01C8

        JSR     R5,     .EXEC.76C               ; 5644   0004 0114 036C

        MOVR    R1,     R4                      ; 5647   008C
        MOVR    R0,     R1                      ; 5648   0081
        SLR     R1,     2                       ; 5649   0065
        MOVR    R0,     R2                      ; 564A   0082
        ANDI    #$0003, R2                      ; 564B   03BA 0003

        JSR     R5,     L_53DF                  ; 564D   0004 0150 03DF
        DECLE   $017D                           ; 5650   017D

        ANDI    #$0004, R3                      ; 5651   03BB 0004
        BEQ     L_55EB                          ; 5653   0224 0069

        MOVR    R4,     R3                      ; 5655   00A3
        MVII    #$0168, R4                      ; 5656   02BC 0168
        SUBR    R1,     R4                      ; 5658   010C
        SUBR    R1,     R4                      ; 5659   010C
L_565A:
        MVI@    R4,     R0                      ; 565A   02A0
        SWAP    R0,     1                       ; 565B   0040
        BEQ     L_55EB                          ; 565C   0224 0072

        MVI@    R4,     R5                      ; 565E   02A5
        TSTR    R5                              ; 565F   00AD
        BEQ     L_566A                          ; 5660   0204 0008

        XORR    R5,     R0                      ; 5662   01E8

        JSR     R5,     L_55D2                  ; 5663   0004 0154 01D2

        CMPI    #$0006, R0                      ; 5666   0378 0006
        BLE     L_5673                          ; 5668   0206 0009

L_566A:
        ADDI    #$0002, R4                      ; 566A   02FC 0002
        SDBD                                    ; 566C   0001
        CMPI    #$0176, R4                      ; 566D   037C 0076 0001
        BLT     L_565A                          ; 5670   0225 0017
        PULR    R7                              ; 5672   02B7

L_5673:
        JSR     R5,     L_53DF                  ; 5673   0004 0150 03DF
        DECLE   $017D                           ; 5676   017D

        ANDI    #$0010, R3                      ; 5677   03BB 0010
        BEQ     L_5680                          ; 5679   0204 0005

        DECR    R4                              ; 567B   0014
        CLRR    R0                              ; 567C   01C0
        MVO@    R0,     R4                      ; 567D   0260
        B       L_566A                          ; 567E   0220 0015

L_5680:
        MVII    #$0003, R0                      ; 5680   02B8 0003
        MVO     R0,     G_0164                  ; 5682   0240 0164

        JSR     R5,     L_5F02                  ; 5684   0004 015C 0302

        B       L_56A0                          ; 5687   0200 0017

L_5689:
        PSHR    R5                              ; 5689   0275
        CLRR    R1                              ; 568A   01C9

        JSR     R5,     L_56A7                  ; 568B   0004 0154 02A7

        PSHR    R4                              ; 568E   0274
        INCR    R1                              ; 568F   0009

        JSR     R5,     L_56A7                  ; 5690   0004 0154 02A7

        XOR@    R6,     R4                      ; 5693   03F4
        MVO     R4,     G_0165                  ; 5694   0244 0165
        BEQ     L_55EB                          ; 5696   0224 00AC

        MVII    #$0006, R0                      ; 5698   02B8 0006
        MVO     R0,     G_0164                  ; 569A   0240 0164
        DECR    R6                              ; 569C   0016

        JSR     R5,     L_5F18                  ; 569D   0004 015C 0318

L_56A0:
        MVII    #$0090, R0                      ; 56A0   02B8 0090
        SWAP    R0,     1                       ; 56A2   0040

        JSR     R5,     L_5CB2                  ; 56A3   0004 015C 00B2

        PULR    R7                              ; 56A6   02B7

L_56A7:
        PSHR    R5                              ; 56A7   0275
        CLRR    R4                              ; 56A8   01E4
        MVII    #$0003, R2                      ; 56A9   02BA 0003

L_56AB:
        JSR     R5,     L_53DF                  ; 56AB   0004 0150 03DF
        DECLE   $017D                           ; 56AE   017D

        ANDI    #$0004, R3                      ; 56AF   03BB 0004
        BEQ     L_56EA                          ; 56B1   0204 0037

        MOVR    R1,     R3                      ; 56B3   008B
        SLL     R3,     2                       ; 56B4   004F
        ADDR    R2,     R3                      ; 56B5   00D3
        SLL     R3,     2                       ; 56B6   004F
        SLL     R3,     1                       ; 56B7   004B
        ADDI    #$031D, R3                      ; 56B8   02FB 031D
        DECR    R1                              ; 56BA   0011

        JSR     R5,     L_55B7                  ; 56BB   0004 0154 01B7

        INCR    R1                              ; 56BE   0009

        JSR     R5,     L_55D2                  ; 56BF   0004 0154 01D2

        CMPI    #$0005, R0                      ; 56C2   0378 0005
        BGT     L_56EA                          ; 56C4   020E 0024

        MVI     G_017A, R0                      ; 56C6   0280 017A
        CMPI    #$0004, R0                      ; 56C8   0378 0004
        BGE     L_56E0                          ; 56CA   020D 0014

        JSR     R5,     L_53DF                  ; 56CC   0004 0150 03DF
        DECLE   $017D                           ; 56CF   017D

        ANDI    #$0003, R3                      ; 56D0   03BB 0003

        JSR     R5,     L_53F0                  ; 56D2   0004 0150 03F0

L_56D5:
        MVI@    R5,     R0                      ; 56D5   02A8
        ANDI    #$0007, R0                      ; 56D6   03B8 0007
        CMPI    #$0000, R0                      ; 56D8   0378 0000
        BEQ     L_56E0                          ; 56DA   0204 0004

        CMPI    #$0001, R0                      ; 56DC   0378 0001
        BNEQ    L_56E5                          ; 56DE   020C 0005

L_56E0:
        MOVR    R1,     R4                      ; 56E0   008C
        NEGR    R4                              ; 56E1   0024
        ADDI    #$0002, R4                      ; 56E2   02FC 0002
        PULR    R7                              ; 56E4   02B7

L_56E5:
        ADDI    #$0007, R5                      ; 56E5   02FD 0007
        DECR    R3                              ; 56E7   0013
        BNEQ    L_56D5                          ; 56E8   022C 0014

L_56EA:
        DECR    R2                              ; 56EA   0012
        BPL     L_56AB                          ; 56EB   0223 0041
        PULR    R7                              ; 56ED   02B7

L_56EE:
        JSR     R5,     L_53F0                  ; 56EE   0004 0150 03F0

L_56F1:
        MVI@    R5,     R4                      ; 56F1   02AC
        ANDI    #$0007, R4                      ; 56F2   03BC 0007
        CMPR    R4,     R0                      ; 56F4   0160
        BEQ     L_5700                          ; 56F5   0204 0009

        ADDI    #$0007, R5                      ; 56F7   02FD 0007
        DECR    R3                              ; 56F9   0013
        BNEQ    L_56F1                          ; 56FA   022C 000A

L_56FC:
        JSR     R5,     L_5F97                  ; 56FC   0004 015C 0397

        PULR    R7                              ; 56FF   02B7

L_5700:
        CMPI    #$0006, R0                      ; 5700   0378 0006
        BLT     L_55EB                          ; 5702   0225 0118
        BEQ     L_5729                          ; 5704   0204 0023

        JSR     R5,     L_53DF                  ; 5706   0004 0150 03DF
        DECLE   $017D                           ; 5709   017D

        ANDI    #$00EF, R3                      ; 570A   03BB 00EF
        XORI    #$0010, R3                      ; 570C   03FB 0010

        JSR     R5,     L_53E7                  ; 570E   0004 0150 03E7
        DECLE   $017D                           ; 5711   017D

        MOVR    R1,     R4                      ; 5712   008C
        SLL     R1,     2                       ; 5713   004D
        ADDR    R2,     R1                      ; 5714   00D1
        SLL     R1,     2                       ; 5715   004D
        SLL     R1,     1                       ; 5716   0049
        ADDI    #$0321, R1                      ; 5717   02F9 0321
        MVI@    R1,     R0                      ; 5719   0288
        TSTR    R0                              ; 571A   0080
        BEQ     L_55EB                          ; 571B   0224 0131

        JSR     R5,     X_UNPK_BYTES            ; 571D   0004 0114 0357
        JSR     R5,     .EXEC.A2F               ; 5720   0004 0118 022F

        MOVR    R1,     R0                      ; 5723   0088
        MOVR    R4,     R1                      ; 5724   00A1

        JSR     R5,     L_5422                  ; 5725   0004 0154 0022

        PULR    R7                              ; 5728   02B7

L_5729:
        MOVR    R1,     R3                      ; 5729   008B
        SLL     R3,     1                       ; 572A   004B
        ADDI    #$0166, R3                      ; 572B   02FB 0166
        MVII    #$0004, R0                      ; 572D   02B8 0004
L_572F:
        MVI@    R3,     R5                      ; 572F   029D
        TSTR    R5                              ; 5730   00AD
        BEQ     L_573A                          ; 5731   0204 0007

        ADDI    #$0004, R3                      ; 5733   02FB 0004
        DECR    R0                              ; 5735   0010
        BNEQ    L_572F                          ; 5736   022C 0008
        B       L_56FC                          ; 5738   0220 003D

L_573A:
        SLL     R1,     2                       ; 573A   004D
        ADDR    R2,     R1                      ; 573B   00D1
        MOVR    R1,     R0                      ; 573C   0088

        JSR     R5,     L_55C3                  ; 573D   0004 0154 01C3

        MVO@    R0,     R3                      ; 5740   0258
        INCR    R3                              ; 5741   000B
        MVO@    R1,     R3                      ; 5742   0259
        PULR    R7                              ; 5743   02B7

L_5744:
        PSHR    R5                              ; 5744   0275
        MVI     G_0176, R2                      ; 5745   0282 0176
        ANDI    #$0007, R2                      ; 5747   03BA 0007
        MOVR    R2,     R1                      ; 5749   0091
        SLR     R1,     2                       ; 574A   0065
        ANDI    #$0003, R2                      ; 574B   03BA 0003
        CLRR    R0                              ; 574D   01C0
        MVII    #$0010, R3                      ; 574E   02BB 0010

        JSR     R5,     L_5C71                  ; 5750   0004 015C 0071

        MOVR    R3,     R4                      ; 5753   009C
        MOVR    R1,     R3                      ; 5754   008B
        SLL     R3,     2                       ; 5755   004F
        ADDR    R2,     R3                      ; 5756   00D3
        SLL     R3,     2                       ; 5757   004F
        SLL     R3,     1                       ; 5758   004B
        ADDI    #$031E, R3                      ; 5759   02FB 031E
        TSTR    R4                              ; 575B   00A4
        BEQ     L_5765                          ; 575C   0204 0007

        ADDI    #$0004, R3                      ; 575E   02FB 0004
        ANDI    #$0003, R4                      ; 5760   03BC 0003
        DECR    R4                              ; 5762   0014
        MVO@    R4,     R3                      ; 5763   025C
        PULR    R7                              ; 5764   02B7

L_5765:
        MVO@    R4,     R3                      ; 5765   025C

        JSR     R5,     L_5591                  ; 5766   0004 0154 0191
        JSR     R5,     L_53E3                  ; 5769   0004 0150 03E3
        DECLE   $0178                           ; 576C   0178

        JSR     R5,     L_53EB                  ; 576D   0004 0150 03EB
        DECLE   $017B                           ; 5770   017B

        PULR    R7                              ; 5771   02B7

        PSHR    R5                              ; 5772   0275
        CMPI    #$000A, R0                      ; 5773   0378 000A
        BGE     L_57B5                          ; 5775   020D 003E

        DECR    R0                              ; 5777   0010
        BMI     L_57A9                          ; 5778   020B 002F

        CMPI    #$0007, R0                      ; 577A   0378 0007
        BEQ     L_57B6                          ; 577C   0204 0038
        BLT     L_5781                          ; 577E   0205 0001

        DECR    R0                              ; 5780   0010
L_5781:
        MVII    #$031D, R3                      ; 5781   02BB 031D
        TSTR    R1                              ; 5783   0089
        BEQ     L_5788                          ; 5784   0204 0002

        MVII    #$0335, R3                      ; 5786   02BB 0335
L_5788:
        CLRR    R2                              ; 5788   01D2
L_5789:
        MVI@    R3,     R5                      ; 5789   029D
        INCR    R3                              ; 578A   000B
        ANDI    #$0008, R5                      ; 578B   03BD 0008
        BNEQ    L_5799                          ; 578D   020C 000A

        XOR@    R3,     R5                      ; 578F   03DD
        BEQ     L_5799                          ; 5790   0204 0007

        ADDI    #$0004, R3                      ; 5792   02FB 0004
        CMP@    R3,     R0                      ; 5794   0358
        BEQ     L_57A4                          ; 5795   0204 000D

        SUBI    #$0004, R3                      ; 5797   033B 0004
L_5799:
        ADDI    #$0007, R3                      ; 5799   02FB 0007
        INCR    R2                              ; 579B   000A
        CMPI    #$0003, R2                      ; 579C   037A 0003
        BLT     L_5789                          ; 579E   0225 0016

        JSR     R5,     L_5F97                  ; 57A0   0004 015C 0397

        PULR    R7                              ; 57A3   02B7

L_57A4:
        MOVR    R2,     R3                      ; 57A4   0093

        JSR     R5,     L_53EB                  ; 57A5   0004 0150 03EB
        DECLE   $01D6                           ; 57A8   01D6
L_57A9:
        SLL     R1,     2                       ; 57A9   004D
        SLL     R1,     1                       ; 57AA   0049
        ADDI    #$034E, R1                      ; 57AB   02F9 034E
        MVI@    R1,     R0                      ; 57AD   0288
        SDBD                                    ; 57AE   0001
        SUBI    #$5EAB, R0                      ; 57AF   0338 00AB 005E
        BNEQ    L_57B5                          ; 57B2   020C 0001

        MVO@    R0,     R1                      ; 57B4   0248
L_57B5:
        PULR    R7                              ; 57B5   02B7

L_57B6:
        MVI     G_01D8, R0                      ; 57B6   0280 01D8
        TSTR    R0                              ; 57B8   0080
        BNEQ    L_57B5                          ; 57B9   022C 0005

        SDBD                                    ; 57BB   0001
        MVII    #$502C, R1                      ; 57BC   02B9 002C 0050

        JSR     R5,     X_TIMER_START           ; 57BF   0004 0118 0044
        JSR     R5,     L_5F85                  ; 57C2   0004 015C 0385

        PULR    R7                              ; 57C5   02B7

L_57C6:
        PSHR    R5                              ; 57C6   0275
        CLRR    R1                              ; 57C7   01C9

        JSR     R5,     L_5833                  ; 57C8   0004 0158 0033

        MVII    #$0001, R1                      ; 57CB   02B9 0001

        JSR     R5,     L_5833                  ; 57CD   0004 0158 0033

        CLRR    R3                              ; 57D0   01DB

L_57D1:
        JSR     R5,     L_5873                  ; 57D1   0004 0158 0073

        BEQ     L_57F1                          ; 57D4   0204 001B

        MVI     G_011B, R0                      ; 57D6   0280 011B

        JSR     R5,     L_580A                  ; 57D8   0004 0158 000A

        MVI     G_011C, R4                      ; 57DB   0284 011C
        SDBD                                    ; 57DD   0001
        ADDI    #$5FD1, R4                      ; 57DE   02FC 00D1 005F
        MVI@    R4,     R4                      ; 57E1   02A4
        PSHR    R2                              ; 57E2   0272

        JSR     R5,     L_57F9                  ; 57E3   0004 0154 03F9

        PULR    R3                              ; 57E6   02B3
        PSHR    R2                              ; 57E7   0272

        JSR     R5,     L_57F9                  ; 57E8   0004 0154 03F9

        PULR    R3                              ; 57EB   02B3
        MVI     G_011B, R0                      ; 57EC   0280 011B

        JSR     R5,     L_581D                  ; 57EE   0004 0158 001D

L_57F1:
        MVI     G_011B, R3                      ; 57F1   0283 011B
        INCR    R3                              ; 57F3   000B
        CMPI    #$0005, R3                      ; 57F4   037B 0005
        BLE     L_57D1                          ; 57F6   0226 0026
        PULR    R7                              ; 57F8   02B7

L_57F9:
        PSHR    R5                              ; 57F9   0275
        CLRR    R2                              ; 57FA   01D2
        MOVR    R3,     R1                      ; 57FB   0099
        BEQ     L_57B5                          ; 57FC   0224 0048

        MOVR    R4,     R2                      ; 57FE   00A2

        JSR     R5,     X_DIV                   ; 57FF   0004 011C 01FB

        INCR    R0                              ; 5802   0008
        MOVR    R3,     R2                      ; 5803   009A
        BPL     L_5808                          ; 5804   0203 0002

        SUBI    #$0002, R0                      ; 5806   0338 0002
L_5808:
        SUBR    R0,     R2                      ; 5808   0102
        PULR    R7                              ; 5809   02B7

L_580A:
        PSHR    R5                              ; 580A   0275
        MOVR    R0,     R5                      ; 580B   0085
        ADDR    R5,     R5                      ; 580C   00ED
        ADDI    #$01DA, R5                      ; 580D   02FD 01DA
        MOVR    R0,     R2                      ; 580F   0082
        SLL     R2,     2                       ; 5810   004E
        SLL     R2,     1                       ; 5811   004A
        ADDI    #$0321, R2                      ; 5812   02FA 0321
        MVI@    R2,     R2                      ; 5814   0292
        MOVR    R2,     R3                      ; 5815   0093
        ANDI    #$00FF, R3                      ; 5816   03BB 00FF
        XORR    R3,     R2                      ; 5818   01DA
        SWAP    R3,     1                       ; 5819   0043
        XOR@    R5,     R2                      ; 581A   03EA
        XOR@    R5,     R3                      ; 581B   03EB
        PULR    R7                              ; 581C   02B7

L_581D:
        PSHR    R5                              ; 581D   0275
        MOVR    R0,     R5                      ; 581E   0085
        ADDR    R5,     R5                      ; 581F   00ED
        ADDI    #$01DA, R5                      ; 5820   02FD 01DA
        MVO@    R2,     R5                      ; 5822   026A
        MVO@    R3,     R5                      ; 5823   026B
        SWAP    R3,     1                       ; 5824   0043
        ANDI    #$00FF, R3                      ; 5825   03BB 00FF
        SDBD                                    ; 5827   0001
        ANDI    #$FF00, R2                      ; 5828   03BA 0000 00FF
        XORR    R2,     R3                      ; 582B   01D3
        MOVR    R0,     R2                      ; 582C   0082
        SLL     R2,     2                       ; 582D   004E
        SLL     R2,     1                       ; 582E   004A
        ADDI    #$0321, R2                      ; 582F   02FA 0321
        MVO@    R3,     R2                      ; 5831   0253
        PULR    R7                              ; 5832   02B7

L_5833:
        PSHR    R5                              ; 5833   0275
        MOVR    R1,     R2                      ; 5834   008A
        ADDI    #$011F, R2                      ; 5835   02FA 011F
        MVI@    R2,     R0                      ; 5837   0290
        CMPI    #$000F, R0                      ; 5838   0378 000F
        BGT     L_57B5                          ; 583A   022E 0086

        MOVR    R1,     R2                      ; 583C   008A
        ADDI    #$0121, R2                      ; 583D   02FA 0121
        MVI@    R2,     R2                      ; 583F   0292
        TSTR    R2                              ; 5840   0092
        BNEQ    L_57B5                          ; 5841   022C 008D

        JSR     R5,     L_5868                  ; 5843   0004 0158 0068

        BEQ     L_57B5                          ; 5846   0224 0092

        PSHR    R0                              ; 5848   0270
        MVI     G_011B, R0                      ; 5849   0280 011B

        JSR     R5,     L_580A                  ; 584B   0004 0158 000A

        MVI     G_011C, R5                      ; 584E   0285 011C
        SDBD                                    ; 5850   0001
        ADDI    #$5FD9, R5                      ; 5851   02FD 00D9 005F
        MVI@    R5,     R0                      ; 5854   02A8
        PULR    R1                              ; 5855   02B1

        JSR     R5,     .EXEC.629               ; 5856   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 5859   0004 0114 0357

        SLL     R0,     2                       ; 585C   004C
        SLL     R0,     2                       ; 585D   004C
        ADDR    R0,     R2                      ; 585E   00C2
        SLL     R1,     2                       ; 585F   004D
        SLL     R1,     2                       ; 5860   004D
        ADDR    R1,     R3                      ; 5861   00CB
        MVI     G_011B, R0                      ; 5862   0280 011B

        JSR     R5,     L_581D                  ; 5864   0004 0158 001D

        PULR    R7                              ; 5867   02B7

L_5868:
        PSHR    R5                              ; 5868   0275

        JSR     R5,     L_53E3                  ; 5869   0004 0150 03E3
        DECLE   $01D6                           ; 586C   01D6

        TSTR    R1                              ; 586D   0089
        BEQ     L_5874                          ; 586E   0204 0004

        ADDI    #$0003, R3                      ; 5870   02FB 0003
        INCR    R7                              ; 5872   000F

L_5873:
        PSHR    R5                              ; 5873   0275
L_5874:
        MVO     R3,     G_011B                  ; 5874   0243 011B
        SLL     R3,     2                       ; 5876   004F
        SLL     R3,     1                       ; 5877   004B
        ADDI    #$031D, R3                      ; 5878   02FB 031D
        MVI@    R3,     R5                      ; 587A   029D
        ANDI    #$0008, R5                      ; 587B   03BD 0008
        BNEQ    L_5899                          ; 587D   020C 001A

        INCR    R3                              ; 587F   000B
        XOR@    R3,     R5                      ; 5880   03DD
        BEQ     L_5899                          ; 5881   0204 0016

        INCR    R3                              ; 5883   000B
        MVI@    R3,     R2                      ; 5884   029A
        SWAP    R2,     1                       ; 5885   0042
        ANDI    #$00FF, R2                      ; 5886   03BA 00FF
        ADDI    #$0004, R2                      ; 5888   02FA 0004
        INCR    R3                              ; 588A   000B
        MVII    #$00FF, R5                      ; 588B   02BD 00FF
        COMR    R5                              ; 588D   001D
        AND@    R3,     R5                      ; 588E   039D
        XORR    R5,     R2                      ; 588F   01EA
        SWAP    R2,     1                       ; 5890   0042
        ADDI    #$0002, R3                      ; 5891   02FB 0002
        MVI@    R3,     R5                      ; 5893   029D
        MVO     R5,     G_011C                  ; 5894   0245 011C
        SUBI    #$0005, R3                      ; 5896   033B 0005
        PULR    R7                              ; 5898   02B7

L_5899:
        CLRR    R3                              ; 5899   01DB
        PULR    R7                              ; 589A   02B7

L_589B:
        PSHR    R5                              ; 589B   0275
        CLRR    R1                              ; 589C   01C9

        JSR     R5,     L_58A6                  ; 589D   0004 0158 00A6

        MVII    #$0001, R1                      ; 58A0   02B9 0001

        JSR     R5,     L_58A6                  ; 58A2   0004 0158 00A6

        PULR    R7                              ; 58A5   02B7

L_58A6:
        PSHR    R5                              ; 58A6   0275

        JSR     R5,     L_5868                  ; 58A7   0004 0158 0068

        MOVR    R3,     R4                      ; 58AA   009C
        MOVR    R1,     R3                      ; 58AB   008B
        SLL     R3,     2                       ; 58AC   004F
        SLL     R3,     1                       ; 58AD   004B
        ADDI    #$034D, R3                      ; 58AE   02FB 034D
        TSTR    R4                              ; 58B0   00A4
        BEQ     L_5948                          ; 58B1   0204 0095

        MVI     G_01D9, R5                      ; 58B3   0285 01D9
        TSTR    R5                              ; 58B5   00AD
        BNEQ    L_58C2                          ; 58B6   020C 000A

        MVI@    R3,     R5                      ; 58B8   029D
        SDBD                                    ; 58B9   0001
        ANDI    #$EFF7, R5                      ; 58BA   03BD 00F7 00EF
        SDBD                                    ; 58BD   0001
        XORI    #$1000, R5                      ; 58BE   03FD 0000 0010
        MVO@    R5,     R3                      ; 58C1   025D
L_58C2:
        INCR    R3                              ; 58C2   000B
        MVI@    R3,     R5                      ; 58C3   029D
        DECR    R3                              ; 58C4   0013
        TSTR    R5                              ; 58C5   00AD
        BEQ     L_5920                          ; 58C6   0204 0058

        SDBD                                    ; 58C8   0001
        CMPI    #$5EAB, R5                      ; 58C9   037D 00AB 005E
        BNEQ    L_591F                          ; 58CC   020C 0051

        MOVR    R1,     R5                      ; 58CE   008D
        ADDI    #$0121, R5                      ; 58CF   02FD 0121
        MVI@    R5,     R5                      ; 58D1   02AD
        DECR    R5                              ; 58D2   0015
        BNEQ    L_5953                          ; 58D3   020C 007E

        ADDI    #$011F, R1                      ; 58D5   02F9 011F
        MVI@    R1,     R1                      ; 58D7   0289
        CMPI    #$000F, R1                      ; 58D8   0379 000F
        BGT     L_5957                          ; 58DA   020E 007B

        PSHR    R1                              ; 58DC   0271
        MOVR    R2,     R0                      ; 58DD   0090

        JSR     R5,     L_55D2                  ; 58DE   0004 0154 01D2

        MVI     G_011C, R5                      ; 58E1   0285 011C
        SDBD                                    ; 58E3   0001
        ADDI    #$5FE9, R5                      ; 58E4   02FD 00E9 005F
        CMP@    R5,     R0                      ; 58E7   0368
        BLE     L_5910                          ; 58E8   0206 0026

        PSHR    R3                              ; 58EA   0273
        MOVR    R2,     R0                      ; 58EB   0090

        JSR     R5,     L_55EC                  ; 58EC   0004 0154 01EC
        JSR     R5,     .EXEC.A2F               ; 58EF   0004 0118 022F

        PULR    R3                              ; 58F2   02B3
        PULR    R2                              ; 58F3   02B2
        MOVR    R1,     R4                      ; 58F4   008C
        ADDI    #$0003, R4                      ; 58F5   02FC 0003
        ANDI    #$000F, R4                      ; 58F7   03BC 000F
        SUBI    #$0003, R1                      ; 58F9   0339 0003
        SUBR    R4,     R1                      ; 58FB   0121
        SUBR    R4,     R2                      ; 58FC   0122
        ANDI    #$000F, R1                      ; 58FD   03B9 000F
        ANDI    #$000F, R2                      ; 58FF   03BA 000F
        CMPI    #$000A, R2                      ; 5901   037A 000A
        BGE     L_590E                          ; 5903   020D 0009

        CMPI    #$0005, R2                      ; 5905   037A 0005
        BEQ     L_5957                          ; 5907   0204 004E
        BLT     L_590D                          ; 5909   0205 0002

        MOVR    R1,     R2                      ; 590B   008A
        INCR    R7                              ; 590C   000F

L_590D:
        CLRR    R2                              ; 590D   01D2
L_590E:
        ADDR    R4,     R2                      ; 590E   00E2
        INCR    R7                              ; 590F   000F

L_5910:
        PULR    R2                              ; 5910   02B2
L_5911:
        MOVR    R2,     R1                      ; 5911   0091
        MVII    #$0032, R0                      ; 5912   02B8 0032

        JSR     R5,     .EXEC.629               ; 5914   0004 0114 0229

        ADDI    #$0004, R3                      ; 5917   02FB 0004
        MVO@    R0,     R3                      ; 5919   0258
        MVII    #$0000, R0                      ; 591A   02B8 0000
        ADDI    #$0002, R3                      ; 591C   02FB 0002
        MVO@    R0,     R3                      ; 591E   0258
L_591F:
        PULR    R7                              ; 591F   02B7

L_5920:
        ADDI    #$0121, R1                      ; 5920   02F9 0121
        MVI@    R1,     R1                      ; 5922   0289
        DECR    R1                              ; 5923   0011
        BNEQ    L_591F                          ; 5924   022C 0006

        MOVR    R3,     R4                      ; 5926   009C
        MVII    #$0010, R0                      ; 5927   02B8 0010
        CMPI    #$034D, R3                      ; 5929   037B 034D
        BEQ     L_592F                          ; 592B   0204 0002

        MVII    #$0003, R0                      ; 592D   02B8 0003
L_592F:
        SDBD                                    ; 592F   0001
        XORI    #$1000, R0                      ; 5930   03F8 0000 0010
        MVO@    R0,     R4                      ; 5933   0260
        SDBD                                    ; 5934   0001
        MVII    #$5EAB, R0                      ; 5935   02B8 00AB 005E
        MVO@    R0,     R4                      ; 5938   0260
        MVO@    R2,     R4                      ; 5939   0262
        SWAP    R2,     1                       ; 593A   0042
        MVO@    R2,     R4                      ; 593B   0262
        CLRR    R5                              ; 593C   01ED
        MVO@    R5,     R4                      ; 593D   0265
        MVO@    R5,     R4                      ; 593E   0265
        MVII    #$0000, R5                      ; 593F   02BD 0000
        MVO@    R5,     R4                      ; 5941   0265
        MVII    #$0006, R0                      ; 5942   02B8 0006

        JSR     R5,     .EXEC.41C               ; 5944   0004 0114 001C

        PULR    R7                              ; 5947   02B7

L_5948:
        INCR    R3                              ; 5948   000B
        MVI@    R3,     R5                      ; 5949   029D
        SDBD                                    ; 594A   0001
        CMPI    #$5EAB, R5                      ; 594B   037D 00AB 005E
        BNEQ    L_591F                          ; 594E   022C 0030

        CLRR    R0                              ; 5950   01C0
        MVO@    R0,     R3                      ; 5951   0258
        PULR    R7                              ; 5952   02B7

L_5953:
        ADDI    #$0004, R4                      ; 5953   02FC 0004
        MVI@    R4,     R0                      ; 5955   02A0
        INCR    R7                              ; 5956   000F

L_5957:
        CLRR    R0                              ; 5957   01C0
L_5958:
        ADDI    #$0004, R3                      ; 5958   02FB 0004
        MVO@    R0,     R3                      ; 595A   0258
        PULR    R7                              ; 595B   02B7

        PSHR    R5                              ; 595C   0275

        JSR     R5,     L_5868                  ; 595D   0004 0158 0068

        BEQ     L_591F                          ; 5960   0224 0042

        MOVR    R1,     R3                      ; 5962   008B
        SLL     R3,     2                       ; 5963   004F
        SLL     R3,     1                       ; 5964   004B
        ADDI    #$034D, R3                      ; 5965   02FB 034D
        INCR    R3                              ; 5967   000B
        MVI@    R3,     R4                      ; 5968   029C
        SDBD                                    ; 5969   0001
        CMPI    #$5EAB, R4                      ; 596A   037C 00AB 005E
        BNEQ    L_591F                          ; 596D   022C 004F

        ADDI    #$01EC, R1                      ; 596F   02F9 01EC
        MVI     G_011B, R4                      ; 5971   0284 011B
        MVO@    R4,     R1                      ; 5973   024C
        SDBD                                    ; 5974   0001
        MVII    #$5E8F, R4                      ; 5975   02BC 008F 005E
        MVO@    R4,     R3                      ; 5978   025C
        DECR    R3                              ; 5979   0013
        SDBD                                    ; 597A   0001
        MVII    #$0808, R4                      ; 597B   02BC 0008 0008
        MVO@    R4,     R3                      ; 597E   025C
        MOVR    R3,     R1                      ; 597F   0099
        ADDI    #$0005, R3                      ; 5980   02FB 0005
        SDBD                                    ; 5982   0001
        ADDI    #$5FE1, R5                      ; 5983   02FD 00E1 005F
        MVI@    R5,     R4                      ; 5986   02AC
        MVO@    R4,     R3                      ; 5987   025C
        MVII    #$003C, R3                      ; 5988   02BB 003C
        CMPI    #$0001, R4                      ; 598A   037C 0001
        BGT     L_5990                          ; 598C   020E 0002

        MVII    #$001E, R3                      ; 598E   02BB 001E
L_5990:
        NEGR    R3                              ; 5990   0023

        JSR     R5,     .EXEC.9A1               ; 5991   0004 0118 01A1

        ADDI    #$0002, R1                      ; 5994   02F9 0002
        MVO@    R2,     R1                      ; 5996   024A
        SWAP    R2,     1                       ; 5997   0042
        INCR    R1                              ; 5998   0009
        MVO@    R2,     R1                      ; 5999   024A
        ADDI    #$0003, R1                      ; 599A   02F9 0003
        MVI@    R1,     R0                      ; 599C   0288
        ADDI    #$0002, R0                      ; 599D   02F8 0002
        MVO@    R0,     R1                      ; 599F   0248
        INCR    R1                              ; 59A0   0009
        MVO@    R0,     R1                      ; 59A1   0248
        PSHR    R4                              ; 59A2   0274
        MVII    #$0006, R0                      ; 59A3   02B8 0006

        JSR     R5,     .EXEC.41C               ; 59A5   0004 0114 001C

        PULR    R4                              ; 59A8   02B4

        JSR     R5,     L_5F36                  ; 59A9   0004 015C 0336

        MVII    #$0002, R0                      ; 59AC   02B8 0002
        MVO     R0,     G_01D9                  ; 59AE   0240 01D9
        PULR    R7                              ; 59B0   02B7

L_59B1:
        PSHR    R5                              ; 59B1   0275
        MOVR    R1,     R5                      ; 59B2   008D
        ADDI    #$0005, R5                      ; 59B3   02FD 0005
        MVI@    R5,     R4                      ; 59B5   02AC
        CMPI    #$0001, R4                      ; 59B6   037C 0001
        BLE     L_591F                          ; 59B8   0226 009A

        MVI@    R5,     R4                      ; 59BA   02AC
        MVI@    R5,     R5                      ; 59BB   02AD
        ADDI    #$0005, R5                      ; 59BC   02FD 0005
        SUBR    R4,     R5                      ; 59BE   0125
        CMPR    R5,     R4                      ; 59BF   016C
        BLE     L_591F                          ; 59C0   0226 00A2

        MOVR    R5,     R4                      ; 59C2   00AC
        PULR    R7                              ; 59C3   02B7

        PSHR    R5                              ; 59C4   0275
        MVI@    R1,     R5                      ; 59C5   028D
        ANDI    #$0008, R5                      ; 59C6   03BD 0008
        BNEQ    L_591F                          ; 59C8   022C 00AA

        JSR     R5,     L_59B1                  ; 59CA   0004 0158 01B1

        CMPI    #$0006, R4                      ; 59CD   037C 0006
        BGT     L_591F                          ; 59CF   022E 00B1

        JSR     R5,     .EXEC.7AE               ; 59D1   0004 0114 03AE

        PULR    R7                              ; 59D4   02B7

        PSHR    R5                              ; 59D5   0275

        JSR     R5,     .EXEC.7AE               ; 59D6   0004 0114 03AE

        ADDI    #$0005, R1                      ; 59D9   02F9 0005
        MVI@    R1,     R0                      ; 59DB   0288
        CMPI    #$0001, R0                      ; 59DC   0378 0001
        BLE     L_591F                          ; 59DE   0226 00C0

        JSR     R5,     L_5F6F                  ; 59E0   0004 015C 036F

        PULR    R7                              ; 59E3   02B7

        PSHR    R5                              ; 59E4   0275
        MVI@    R1,     R5                      ; 59E5   028D
        ANDI    #$0008, R5                      ; 59E6   03BD 0008
        BNEQ    L_591F                          ; 59E8   022C 00CA

        MOVR    R0,     R5                      ; 59EA   0085
        ADDI    #$01E6, R5                      ; 59EB   02FD 01E6
        CMP@    R5,     R3                      ; 59ED   036B
        BEQ     L_591F                          ; 59EE   0224 00D0

        JSR     R5,     L_59B1                  ; 59F0   0004 0158 01B1

        CMPI    #$0004, R4                      ; 59F3   037C 0004
        BGT     L_591F                          ; 59F5   022E 00D7

        MOVR    R0,     R1                      ; 59F7   0081
        ADDI    #$01E8, R1                      ; 59F8   02F9 01E8
        MOVR    R3,     R0                      ; 59FA   0098

        JSR     R5,     X_POW2                  ; 59FB   0004 0114 0345

        XOR@    R1,     R0                      ; 59FE   03C8
        MVO@    R0,     R1                      ; 59FF   0248
        PULR    R7                              ; 5A00   02B7

L_5A01:
        PSHR    R5                              ; 5A01   0275
        MVII    #$0006, R0                      ; 5A02   02B8 0006

        JSR     R5,     L_5A0A                  ; 5A04   0004 0158 020A

        MVII    #$0007, R0                      ; 5A07   02B8 0007
        INCR    R7                              ; 5A09   000F

L_5A0A:
        PSHR    R5                              ; 5A0A   0275
L_5A0B:
        MOVR    R0,     R3                      ; 5A0B   0083
        ADDI    #$01E8, R3                      ; 5A0C   02FB 01E8
        MVI@    R3,     R2                      ; 5A0E   029A
        TSTR    R2                              ; 5A0F   0092
        BEQ     L_591F                          ; 5A10   0224 00F2

        CLRR    R5                              ; 5A12   01ED
        MVO@    R5,     R3                      ; 5A13   025D

        JSR     R5,     .EXEC.76C               ; 5A14   0004 0114 036C

        SDBD                                    ; 5A17   0001
        MVII    #$9053, R0                      ; 5A18   02B8 0053 0090
        MVO@    R0,     R1                      ; 5A1B   0248
        INCR    R1                              ; 5A1C   0009
        SDBD                                    ; 5A1D   0001
        MVII    #$5EA4, R0                      ; 5A1E   02B8 00A4 005E
        MVO@    R0,     R1                      ; 5A21   0248
        ADDI    #$0004, R1                      ; 5A22   02F9 0004
        MVI@    R1,     R3                      ; 5A24   028B
        MVII    #$01F0, R0                      ; 5A25   02B8 01F0
        MVO@    R0,     R1                      ; 5A27   0248
        INCR    R1                              ; 5A28   0009
        MVII    #$001E, R0                      ; 5A29   02B8 001E
        MVO@    R0,     R1                      ; 5A2B   0248
        SDBD                                    ; 5A2C   0001
        ADDI    #$5FF1, R3                      ; 5A2D   02FB 00F1 005F
        MVI@    R3,     R3                      ; 5A30   029B
        CLRR    R0                              ; 5A31   01C0
L_5A32:
        SARC    R2,     1                       ; 5A32   007A
        BNC     L_5A3E                          ; 5A33   0209 0009

        PSHR    R0                              ; 5A35   0270
        PSHR    R2                              ; 5A36   0272
        PSHR    R3                              ; 5A37   0273

        JSR     R5,     L_5A4A                  ; 5A38   0004 0158 024A

        PULR    R3                              ; 5A3B   02B3
        PULR    R2                              ; 5A3C   02B2
        PULR    R0                              ; 5A3D   02B0
L_5A3E:
        INCR    R0                              ; 5A3E   0008
        CMPI    #$0006, R0                      ; 5A3F   0378 0006
        BLT     L_5A32                          ; 5A41   0225 0010

        JSR     R5,     .EXEC.41C               ; 5A43   0004 0114 001C
        JSR     R5,     L_5F55                  ; 5A46   0004 015C 0355

        PULR    R7                              ; 5A49   02B7

L_5A4A:
        PSHR    R5                              ; 5A4A   0275

        JSR     R5,     .EXEC.76C               ; 5A4B   0004 0114 036C

        MVII    #$0003, R5                      ; 5A4E   02BD 0003
        MVII    #$031D, R2                      ; 5A50   02BA 031D
        CMPR    R5,     R0                      ; 5A52   0168
        BLT     L_5A57                          ; 5A53   0205 0002

        MVII    #$0335, R2                      ; 5A55   02BA 0335
L_5A57:
        CLRR    R0                              ; 5A57   01C0
        COMR    R0                              ; 5A58   0018
L_5A59:
        MVI@    R2,     R4                      ; 5A59   0294
        ANDI    #$0008, R4                      ; 5A5A   03BC 0008
        BNEQ    L_5A64                          ; 5A5C   020C 0006

        INCR    R2                              ; 5A5E   000A
        MVI@    R2,     R4                      ; 5A5F   0294
        DECR    R2                              ; 5A60   0012
        TSTR    R4                              ; 5A61   00A4
        BNEQ    L_5A6A                          ; 5A62   020C 0006

L_5A64:
        ADDI    #$0008, R2                      ; 5A64   02FA 0008
        DECR    R5                              ; 5A66   0015
        BNEQ    L_5A59                          ; 5A67   022C 000F
        PULR    R7                              ; 5A69   02B7

L_5A6A:
        INCR    R0                              ; 5A6A   0008
        CMPR    R2,     R1                      ; 5A6B   0151
        BNEQ    L_5A64                          ; 5A6C   022C 0009

        CLRR    R1                              ; 5A6E   01C9
        CMPI    #$0335, R2                      ; 5A6F   037A 0335
        ADCR    R1                              ; 5A71   0029
        MVO     R2,     G_0318                  ; 5A72   0242 0318
        MVI     G_0176, R2                      ; 5A74   0282 0176
        SARC    R2,     2                       ; 5A76   007E
        TSTR    R1                              ; 5A77   0089
        BEQ     L_5A7C                          ; 5A78   0204 0002

        CLRR    R2                              ; 5A7A   01D2
        RLC     R2,     2                       ; 5A7B   0056

L_5A7C:
        JSR     R5,     L_5C71                  ; 5A7C   0004 015C 0071

        MVII    #$0127, R4                      ; 5A7F   02BC 0127
        MVII    #$0014, R0                      ; 5A81   02B8 0014
        SDBD                                    ; 5A83   0001
        CMP@    R4,     R0                      ; 5A84   0360
        BNC     L_5A8C                          ; 5A85   0209 0005

        SUBI    #$0002, R4                      ; 5A87   033C 0002
        MVO@    R0,     R4                      ; 5A89   0260
        CLRR    R0                              ; 5A8A   01C0
        MVO@    R0,     R4                      ; 5A8B   0260
L_5A8C:
        TSTR    R3                              ; 5A8C   009B
        BNEQ    L_5A96                          ; 5A8D   020C 0007

        MVII    #$0064, R0                      ; 5A8F   02B8 0064
        MVO     R0,     G_0127                  ; 5A91   0240 0127
        CLRR    R0                              ; 5A93   01C0
        MVO     R0,     G_0128                  ; 5A94   0240 0128
L_5A96:
        MVI     G_0318, R1                      ; 5A96   0281 0318
        MVI@    R1,     R0                      ; 5A98   0288
        ANDI    #$0017, R0                      ; 5A99   03B8 0017
        SDBD                                    ; 5A9B   0001
        XORI    #$B008, R0                      ; 5A9C   03F8 0008 00B0
        MVO@    R0,     R1                      ; 5A9F   0248
        INCR    R1                              ; 5AA0   0009
        SDBD                                    ; 5AA1   0001
        MVII    #$5EB2, R0                      ; 5AA2   02B8 00B2 005E
        MVO@    R0,     R1                      ; 5AA5   0248
        ADDI    #$0004, R1                      ; 5AA6   02F9 0004
        MVII    #$01F0, R0                      ; 5AA8   02B8 01F0
        MVO@    R0,     R1                      ; 5AAA   0248
        INCR    R1                              ; 5AAB   0009
        MVII    #$000A, R0                      ; 5AAC   02B8 000A
        MVO@    R0,     R1                      ; 5AAE   0248
        PULR    R7                              ; 5AAF   02B7

        PSHR    R5                              ; 5AB0   0275
        MOVR    R0,     R4                      ; 5AB1   0084

        JSR     R5,     .EXEC.7AE               ; 5AB2   0004 0114 03AE

        CLRR    R0                              ; 5AB5   01C0
        CLRR    R3                              ; 5AB6   01DB
        CMPI    #$0335, R1                      ; 5AB7   0379 0335
        BLT     L_5ABF                          ; 5AB9   0205 0004

        MVII    #$0003, R0                      ; 5ABB   02B8 0003
        SUBR    R0,     R4                      ; 5ABD   0104
        INCR    R3                              ; 5ABE   000B
L_5ABF:
        ADDI    #$01D6, R3                      ; 5ABF   02FB 01D6
        CMP@    R3,     R4                      ; 5AC1   035C
        BNEQ    L_591F                          ; 5AC2   022C 01A4

        CLRR    R2                              ; 5AC4   01D2

L_5AC5:
        JSR     R5,     .EXEC.76C               ; 5AC5   0004 0114 036C

        MVI@    R1,     R5                      ; 5AC8   028D
        ANDI    #$0008, R5                      ; 5AC9   03BD 0008
        BNEQ    L_5AD3                          ; 5ACB   020C 0006

        INCR    R1                              ; 5ACD   0009
        XOR@    R1,     R5                      ; 5ACE   03CD
        BEQ     L_5AD3                          ; 5ACF   0204 0002

        MVO@    R2,     R3                      ; 5AD1   025A
        PULR    R7                              ; 5AD2   02B7

L_5AD3:
        INCR    R0                              ; 5AD3   0008
        INCR    R2                              ; 5AD4   000A
        CMPI    #$0003, R2                      ; 5AD5   037A 0003
        BLT     L_5AC5                          ; 5AD7   0225 0013
        PULR    R7                              ; 5AD9   02B7

L_5ADA:
        PSHR    R5                              ; 5ADA   0275

        JSR     R5,     X_STOP_SFX              ; 5ADB   0004 011C 02B4

        MVII    #$0321, R1                      ; 5ADE   02B9 0321
        MVII    #$01A5, R4                      ; 5AE0   02BC 01A5
L_5AE2:
        MVI@    R1,     R0                      ; 5AE2   0288
        MVO@    R0,     R4                      ; 5AE3   0260
        SWAP    R0,     1                       ; 5AE4   0040
        MVO@    R0,     R4                      ; 5AE5   0260
        ADDI    #$0008, R1                      ; 5AE6   02F9 0008
        CMPI    #$035D, R1                      ; 5AE8   0379 035D
        BLT     L_5AE2                          ; 5AEA   0225 0009

        JSR     R5,     .EXEC.7B3               ; 5AEC   0004 0114 03B3

        MVI     G_0176, R0                      ; 5AEF   0280 0176
        SARC    R0,     2                       ; 5AF1   007C
        MVII    #$0001, R3                      ; 5AF2   02BB 0001
        RLC     R3,     2                       ; 5AF4   0057
        MOVR    R3,     R4                      ; 5AF5   009C

        JSR     R5,     .EXEC.772               ; 5AF6   0004 0114 0372

        PSHR    R0                              ; 5AF9   0270
        PSHR    R4                              ; 5AFA   0274
        MOVR    R4,     R0                      ; 5AFB   00A0

        JSR     R5,     L_55C3                  ; 5AFC   0004 0154 01C3

        MVO     R2,     G_01E8                  ; 5AFF   0242 01E8
        MVO     R3,     G_01E9                  ; 5B01   0243 01E9
        MVO     R0,     G_01EA                  ; 5B03   0240 01EA
        MVO     R1,     G_01EB                  ; 5B05   0241 01EB
        ADDR    R2,     R0                      ; 5B07   00D0
        SLR     R0,     2                       ; 5B08   0064
        SLL     R0,     1                       ; 5B09   0048
        ADDR    R3,     R1                      ; 5B0A   00D9
        SLR     R1,     2                       ; 5B0B   0065
        SLL     R1,     1                       ; 5B0C   0049
        SUBI    #$0018, R0                      ; 5B0D   0338 0018
        SUBI    #$0012, R1                      ; 5B0F   0339 0012
        TSTR    R1                              ; 5B11   0089
        BPL     L_5B15                          ; 5B12   0203 0001

        CLRR    R1                              ; 5B14   01C9
L_5B15:
        CMPI    #$0048, R1                      ; 5B15   0379 0048
        BLE     L_5B1B                          ; 5B17   0206 0002

        MVII    #$0048, R1                      ; 5B19   02B9 0048
L_5B1B:
        TSTR    R0                              ; 5B1B   0080
        BPL     L_5B1F                          ; 5B1C   0203 0001

        CLRR    R0                              ; 5B1E   01C0
L_5B1F:
        CMPI    #$0078, R0                      ; 5B1F   0378 0078
        BLE     L_5B25                          ; 5B21   0206 0002

        MVII    #$0078, R0                      ; 5B23   02B8 0078
L_5B25:
        MVII    #$01E8, R4                      ; 5B25   02BC 01E8

        JSR     R5,     L_5B67                  ; 5B27   0004 0158 0367
        JSR     R5,     L_5B67                  ; 5B2A   0004 0158 0367
        JSR     R5,     L_5221                  ; 5B2D   0004 0150 0221

        PULR    R2                              ; 5B30   02B2

        JSR     R5,     L_5B70                  ; 5B31   0004 0158 0370

        PULR    R2                              ; 5B34   02B2

        JSR     R5,     L_5B70                  ; 5B35   0004 0158 0370

        SDBD                                    ; 5B38   0001
        MVII    #$2810, R0                      ; 5B39   02B8 0010 0028
        MVII    #$031D, R1                      ; 5B3C   02B9 031D
L_5B3E:
        MVII    #$0003, R2                      ; 5B3E   02BA 0003
L_5B40:
        MVO@    R0,     R1                      ; 5B40   0248
        ADDI    #$0008, R1                      ; 5B41   02F9 0008
        DECR    R2                              ; 5B43   0012
        BNEQ    L_5B40                          ; 5B44   022C 0005

        SDBD                                    ; 5B46   0001
        MVII    #$2A03, R0                      ; 5B47   02B8 0003 002A
        CMPI    #$0335, R1                      ; 5B4A   0379 0335
        BLE     L_5B3E                          ; 5B4C   0226 000F

        MVII    #$01DA, R4                      ; 5B4E   02BC 01DA
        MVII    #$000D, R0                      ; 5B50   02B8 000D

        JSR     R5,     X_FILL_ZERO             ; 5B52   0004 0114 0338

        CLRR    R0                              ; 5B55   01C0
        MVO     R0,     G_01D6                  ; 5B56   0240 01D6
        MVO     R0,     G_01D7                  ; 5B58   0240 01D7
        MVO     R0,     G_01EE                  ; 5B5A   0240 01EE
        MVO     R0,     G_01EF                  ; 5B5C   0240 01EF
        MVII    #$0003, R0                      ; 5B5E   02B8 0003
        MVO     R0,     G_01D9                  ; 5B60   0240 01D9
        MVII    #$0004, R0                      ; 5B62   02B8 0004
        MVO     R0,     G_0164                  ; 5B64   0240 0164
L_5B66:
        PULR    R7                              ; 5B66   02B7

L_5B67:
        MVI@    R4,     R2                      ; 5B67   02A2
        MVI@    R4,     R3                      ; 5B68   02A3
        SUBR    R0,     R2                      ; 5B69   0102
        SUBR    R1,     R3                      ; 5B6A   010B
        SUBI    #$0002, R4                      ; 5B6B   033C 0002
        MVO@    R2,     R4                      ; 5B6D   0262
        MVO@    R3,     R4                      ; 5B6E   0263
        MOVR    R5,     R7                      ; 5B6F   00AF

L_5B70:
        PSHR    R5                              ; 5B70   0275
        MOVR    R2,     R0                      ; 5B71   0090
        MOVR    R2,     R1                      ; 5B72   0091
        SLR     R1,     2                       ; 5B73   0065
        ANDI    #$0003, R2                      ; 5B74   03BA 0003

        JSR     R5,     L_53DF                  ; 5B76   0004 0150 03DF
        DECLE   $017D                           ; 5B79   017D

        ANDI    #$0003, R3                      ; 5B7A   03BB 0003

        JSR     R5,     L_53F0                  ; 5B7C   0004 0150 03F0

        MOVR    R1,     R2                      ; 5B7F   008A
        SLL     R2,     1                       ; 5B80   004A
        ADDI    #$01E8, R2                      ; 5B81   02FA 01E8
        SDBD                                    ; 5B83   0001
        MVII    #$5BDB, R4                      ; 5B84   02BC 00DB 005B
        TSTR    R1                              ; 5B87   0089
        BEQ     L_5B8E                          ; 5B88   0204 0004

        SDBD                                    ; 5B8A   0001
        ADDI    #$0006, R4                      ; 5B8B   02FC 0006 0000
L_5B8E:
        TSTR    R3                              ; 5B8E   009B
        BNEQ    L_5B93                          ; 5B8F   020C 0002

        ADDI    #$0002, R4                      ; 5B91   02FC 0002
L_5B93:
        MOVR    R0,     R1                      ; 5B93   0081
        ANDI    #$0004, R1                      ; 5B94   03B9 0004
        MVII    #$031D, R1                      ; 5B96   02B9 031D
        BEQ     L_5B9C                          ; 5B98   0204 0002

        MVII    #$0335, R1                      ; 5B9A   02B9 0335
L_5B9C:
        INCR    R1                              ; 5B9C   0009
        SDBD                                    ; 5B9D   0001
        MVII    #$5E86, R0                      ; 5B9E   02B8 0086 005E
        MVO@    R0,     R1                      ; 5BA1   0248
        PSHR    R3                              ; 5BA2   0273
        MVII    #$0001, R3                      ; 5BA3   02BB 0001
L_5BA5:
        INCR    R1                              ; 5BA5   0009
        MVI@    R2,     R0                      ; 5BA6   0290
        SUBI    #$0008, R0                      ; 5BA7   0338 0008
        SLL     R0,     2                       ; 5BA9   004C
        ADD@    R4,     R0                      ; 5BAA   02E0
        SWAP    R0,     1                       ; 5BAB   0040
        MVO@    R0,     R1                      ; 5BAC   0248
        INCR    R2                              ; 5BAD   000A
        DECR    R3                              ; 5BAE   0013
        BPL     L_5BA5                          ; 5BAF   0223 000B

        PULR    R3                              ; 5BB1   02B3
        SUBI    #$0002, R2                      ; 5BB2   033A 0002
        INCR    R1                              ; 5BB4   0009
        CLRR    R0                              ; 5BB5   01C0
        MVO@    R0,     R1                      ; 5BB6   0248
        INCR    R1                              ; 5BB7   0009
        MVI@    R5,     R0                      ; 5BB8   02A8
        ANDI    #$0007, R0                      ; 5BB9   03B8 0007
        MVO@    R0,     R1                      ; 5BBB   0248
        INCR    R1                              ; 5BBC   0009
        MVII    #$0001, R0                      ; 5BBD   02B8 0001
        MVO@    R0,     R1                      ; 5BBF   0248
        ADDI    #$0002, R1                      ; 5BC0   02F9 0002
        ADDI    #$0007, R5                      ; 5BC2   02FD 0007
        DECR    R3                              ; 5BC4   0013
        BNEQ    L_5B9C                          ; 5BC5   022C 002A
        PULR    R7                              ; 5BC7   02B7

L_5BC8:
        MVII    #$031E, R1                      ; 5BC8   02B9 031E
        MVII    #$0006, R0                      ; 5BCA   02B8 0006
        SDBD                                    ; 5BCC   0001
        MVII    #$5E7D, R2                      ; 5BCD   02BA 007D 005E
L_5BD0:
        MVI@    R1,     R3                      ; 5BD0   028B
        TSTR    R3                              ; 5BD1   009B
        BEQ     L_5BD5                          ; 5BD2   0204 0001

        MVO@    R2,     R1                      ; 5BD4   024A
L_5BD5:
        ADDI    #$0008, R1                      ; 5BD5   02F9 0008
        DECR    R0                              ; 5BD7   0010
        BNEQ    L_5BD0                          ; 5BD8   022C 0009
        MOVR    R5,     R7                      ; 5BDA   00AF

        DECR    R0                              ; 5BDB   0010
        INCR    R0                              ; 5BDC   0008
        DECR    R4                              ; 5BDD   0014
        INCR    R6                              ; 5BDE   000E
        INCR    R0                              ; 5BDF   0008
        DECR    R2                              ; 5BE0   0012
        DECR    R0                              ; 5BE1   0010
        INCR    R0                              ; 5BE2   0008
        INCR    R4                              ; 5BE3   000C
        INCR    R6                              ; 5BE4   000E
        COMR    R0                              ; 5BE5   0018
        DECR    R2                              ; 5BE6   0012
L_5BE7:
        PSHR    R5                              ; 5BE7   0275
        AND     G_01E7, R0                      ; 5BE8   0380 01E7
        BEQ     L_5B66                          ; 5BEA   0224 0085

        MVI     G_01E6, R0                      ; 5BEC   0280 01E6
        SLR     R0,     1                       ; 5BEE   0060
        MOVR    R0,     R3                      ; 5BEF   0083
        SLR     R3,     2                       ; 5BF0   0067
        SLR     R3,     1                       ; 5BF1   0063
        SDBD                                    ; 5BF2   0001
        ADDI    #$5C25, R3                      ; 5BF3   02FB 0025 005C
        MVI@    R3,     R2                      ; 5BF6   029A
        MOVR    R2,     R3                      ; 5BF7   0093
        SLR     R3,     1                       ; 5BF8   0063
        ANDI    #$0007, R0                      ; 5BF9   03B8 0007
        SARC    R0,     1                       ; 5BFB   0078
        BNC     L_5C00                          ; 5BFC   0209 0002

        NEGR    R2                              ; 5BFE   0022
        NEGR    R3                              ; 5BFF   0023
L_5C00:
        SARC    R0,     1                       ; 5C00   0078
        BNC     L_5C08                          ; 5C01   0209 0005
        BEQ     L_5C0D                          ; 5C03   0204 0008

        NEGR    R2                              ; 5C05   0022
        B       L_5C0D                          ; 5C06   0200 0005
L_5C08:
        BEQ     L_5C0C                          ; 5C08   0204 0002

        CLRR    R3                              ; 5C0A   01DB
        INCR    R7                              ; 5C0B   000F

L_5C0C:
        CLRR    R2                              ; 5C0C   01D2
L_5C0D:
        ANDI    #$00FF, R2                      ; 5C0D   03BA 00FF
        ANDI    #$00FF, R3                      ; 5C0F   03BB 00FF
        SWAP    R2,     1                       ; 5C11   0042
        XORR    R3,     R2                      ; 5C12   01DA
        MVII    #$0003, R0                      ; 5C13   02B8 0003
L_5C15:
        ADDI    #$0007, R1                      ; 5C15   02F9 0007
        MVI@    R1,     R3                      ; 5C17   028B
        ADDR    R2,     R3                      ; 5C18   00D3
        SUBI    #$0005, R1                      ; 5C19   0339 0005
        MVO@    R3,     R1                      ; 5C1B   024B
        SWAP    R3,     1                       ; 5C1C   0043
        INCR    R1                              ; 5C1D   0009
        MVO@    R3,     R1                      ; 5C1E   024B
        ADDI    #$0005, R1                      ; 5C1F   02F9 0005
        DECR    R0                              ; 5C21   0010
        BNEQ    L_5C15                          ; 5C22   022C 000E
        PULR    R7                              ; 5C24   02B7

        DECLE   $0004                           ; 5C25   0004

        SETC                                    ; 5C26   0007
        INCR    R6                              ; 5C27   000E
        COMR    R6                              ; 5C28   001E
L_5C29:
        PSHR    R5                              ; 5C29   0275

        JSR     R5,     .EXEC.7B3               ; 5C2A   0004 0114 03B3

        CLRR    R1                              ; 5C2D   01C9
        MVO     R1,     G_015F                  ; 5C2E   0241 015F
        MVO     R1,     G_0160                  ; 5C30   0241 0160

        JSR     R5,     L_5591                  ; 5C32   0004 0154 0191

        MVII    #$0001, R1                      ; 5C35   02B9 0001

        JSR     R5,     L_5591                  ; 5C37   0004 0154 0191

        CLRR    R1                              ; 5C3A   01C9
        MVII    #$0195, R4                      ; 5C3B   02BC 0195
        INCR    R7                              ; 5C3D   000F

L_5C3E:
        INCR    R1                              ; 5C3E   0009
L_5C3F:
        CLRR    R2                              ; 5C3F   01D2

L_5C40:
        JSR     R5,     L_53DF                  ; 5C40   0004 0150 03DF
        DECLE   $017D                           ; 5C43   017D

        ANDI    #$0004, R3                      ; 5C44   03BB 0004
        BEQ     L_5C5A                          ; 5C46   0204 0012

        SDBD                                    ; 5C48   0001
        MVI@    R4,     R0                      ; 5C49   02A0
        SWAP    R0,     1                       ; 5C4A   0040
        PSHR    R4                              ; 5C4B   0274

        JSR     R5,     L_555C                  ; 5C4C   0004 0154 015C

        MOVR    R4,     R5                      ; 5C4F   00A5
        PULR    R4                              ; 5C50   02B4
        ADDI    #$000E, R4                      ; 5C51   02FC 000E
        SDBD                                    ; 5C53   0001
        MVI@    R4,     R0                      ; 5C54   02A0
        SUBI    #$0003, R5                      ; 5C55   033D 0003
        MVO@    R0,     R5                      ; 5C57   0268
        SUBI    #$0012, R4                      ; 5C58   033C 0012
L_5C5A:
        INCR    R2                              ; 5C5A   000A
        ADDI    #$0002, R4                      ; 5C5B   02FC 0002
        CMPI    #$019D, R4                      ; 5C5D   037C 019D
        BEQ     L_5C3E                          ; 5C5F   0224 0022

        CMPI    #$01A5, R4                      ; 5C61   037C 01A5
        BLT     L_5C40                          ; 5C63   0225 0024

        MVII    #$0000, R0                      ; 5C65   02B8 0000
        MVO     R0,     G_0164                  ; 5C67   0240 0164

        JSR     R5,     L_51EC                  ; 5C69   0004 0150 01EC

        MVII    #$0004, R0                      ; 5C6C   02B8 0004
        MVO     R0,     G_01D9                  ; 5C6E   0240 01D9
        PULR    R7                              ; 5C70   02B7

L_5C71:
        PSHR    R5                              ; 5C71   0275

        JSR     R5,     L_53F0                  ; 5C72   0004 0150 03F0

        SLL     R0,     2                       ; 5C75   004C
        SLL     R0,     1                       ; 5C76   0048
        ADDR    R0,     R5                      ; 5C77   00C5
        MVI@    R5,     R4                      ; 5C78   02AC
        SLL     R3,     2                       ; 5C79   004F
        SLL     R3,     1                       ; 5C7A   004B
        SUBR    R3,     R4                      ; 5C7B   011C
        BPL     L_5CAE                          ; 5C7C   0203 0030

        PSHR    R4                              ; 5C7E   0274
L_5C7F:
        MOVR    R5,     R4                      ; 5C7F   00AC
        DECR    R4                              ; 5C80   0014
        ADDI    #$0007, R5                      ; 5C81   02FD 0007
        CMPI    #$01D6, R5                      ; 5C83   037D 01D6
        BGE     L_5C8B                          ; 5C85   020D 0004

        MVI@    R5,     R3                      ; 5C87   02AB
        MVO@    R3,     R4                      ; 5C88   0263
        B       L_5C7F                          ; 5C89   0220 000B

L_5C8B:
        JSR     R5,     L_53DF                  ; 5C8B   0004 0150 03DF
        DECLE   $017D                           ; 5C8E   017D

        PULR    R0                              ; 5C8F   02B0
        ANDI    #$0007, R0                      ; 5C90   03B8 0007
        CMPI    #$0007, R0                      ; 5C92   0378 0007
        BNEQ    L_5C98                          ; 5C94   020C 0002

        ANDI    #$00EF, R3                      ; 5C96   03BB 00EF
L_5C98:
        CMPI    #$0001, R0                      ; 5C98   0378 0001
        BGT     L_5CA1                          ; 5C9A   020E 0005

        MVI     G_017A, R0                      ; 5C9C   0280 017A
        INCR    R0                              ; 5C9E   0008
        MVO     R0,     G_017A                  ; 5C9F   0240 017A
L_5CA1:
        DECR    R3                              ; 5CA1   0013
        MOVR    R3,     R4                      ; 5CA2   009C
        ANDI    #$0003, R4                      ; 5CA3   03BC 0003
        TSTR    R4                              ; 5CA5   00A4
        BNEQ    L_5CA9                          ; 5CA6   020C 0001

        CLRR    R3                              ; 5CA8   01DB

L_5CA9:
        JSR     R5,     L_53E7                  ; 5CA9   0004 0150 03E7
        DECLE   $017D                           ; 5CAC   017D

        PULR    R7                              ; 5CAD   02B7

L_5CAE:
        DECR    R5                              ; 5CAE   0015
        MVO@    R4,     R5                      ; 5CAF   026C
        DECR    R6                              ; 5CB0   0016
        PULR    R7                              ; 5CB1   02B7

L_5CB2:
        PSHR    R5                              ; 5CB2   0275
        MVII    #$031D, R1                      ; 5CB3   02B9 031D
L_5CB5:
        MVI@    R1,     R2                      ; 5CB5   028A
        COMR    R0                              ; 5CB6   0018
        ANDR    R0,     R2                      ; 5CB7   0182
        COMR    R0                              ; 5CB8   0018
        XORR    R0,     R2                      ; 5CB9   01C2
        MVO@    R2,     R1                      ; 5CBA   024A
        ADDI    #$0008, R1                      ; 5CBB   02F9 0008
        CMPI    #$035D, R1                      ; 5CBD   0379 035D
        BLT     L_5CB5                          ; 5CBF   0225 000B
L_5CC1:
        PULR    R7                              ; 5CC1   02B7

L_5CC2:
        PSHR    R5                              ; 5CC2   0275
        MVII    #$001E, R0                      ; 5CC3   02B8 001E
        SDBD                                    ; 5CC5   0001
        MVII    #$5123, R5                      ; 5CC6   02BD 0023 0051
        MVI     G_0177, R1                      ; 5CC9   0281 0177
        CLRR    R2                              ; 5CCB   01D2
        B       L_5CD4                          ; 5CCC   0200 0006

L_5CCE:
        CMPI    #$0016, R0                      ; 5CCE   0378 0016
        BNEQ    L_5CE2                          ; 5CD0   020C 0010

        MVII    #$0001, R2                      ; 5CD2   02BA 0001
L_5CD4:
        SDBD                                    ; 5CD4   0001
        ADDI    #$5CF0, R2                      ; 5CD5   02FA 00F0 005C
        SARC    R1,     1                       ; 5CD8   0079
        ADCR    R2                              ; 5CD9   002A
        MVI@    R2,     R2                      ; 5CDA   0292
        SARC    R2,     1                       ; 5CDB   007A
        BNC     L_5CE2                          ; 5CDC   0209 0004

        SDBD                                    ; 5CDE   0001
        XORI    #$1000, R2                      ; 5CDF   03FA 0000 0010
L_5CE2:
        MVI@    R5,     R3                      ; 5CE2   02AB
        ADDI    #$0200, R3                      ; 5CE3   02FB 0200
        MVI@    R3,     R4                      ; 5CE5   029C
        SDBD                                    ; 5CE6   0001
        ANDI    #$EFF8, R4                      ; 5CE7   03BC 00F8 00EF
        XORR    R2,     R4                      ; 5CEA   01D4
        MVO@    R4,     R3                      ; 5CEB   025C
        DECR    R0                              ; 5CEC   0010
        BNEQ    L_5CCE                          ; 5CED   022C 0020
        PULR    R7                              ; 5CEF   02B7

        DECLE   $0001,  $0006,  $0001           ; 5CF0   0001 0006 0001

        PSHR    R5                              ; 5CF3   0275
        MVI     G_0164, R5                      ; 5CF4   0285 0164
        CMPI    #$0007, R5                      ; 5CF6   037D 0007
        BEQ     L_5D48                          ; 5CF8   0204 004E

        MOVR    R1,     R4                      ; 5CFA   008C
        ADDI    #$0006, R1                      ; 5CFB   02F9 0006
        MVII    #$0001, R0                      ; 5CFD   02B8 0001
        MVO@    R0,     R1                      ; 5CFF   0248
        ADDI    #$0007, R4                      ; 5D00   02FC 0007
        MVII    #$0317, R1                      ; 5D02   02B9 0317

        JSR     R5,     .EXEC.777               ; 5D04   0004 0114 0377

        SWAP    R2,     1                       ; 5D07   0042
        XORR    R3,     R2                      ; 5D08   01DA
        MVO@    R2,     R4                      ; 5D09   0262
        PULR    R7                              ; 5D0A   02B7

        PSHR    R5                              ; 5D0B   0275
        MVI     G_0164, R5                      ; 5D0C   0285 0164
        CMPI    #$0004, R5                      ; 5D0E   037D 0004
        BEQ     L_5CC1                          ; 5D10   0224 0050

        CMPI    #$0007, R5                      ; 5D12   037D 0007
        BEQ     L_5D28                          ; 5D14   0204 0012

        ADDI    #$0007, R1                      ; 5D16   02F9 0007
        MVI@    R1,     R2                      ; 5D18   028A
        SUBI    #$0005, R1                      ; 5D19   0339 0005
        MOVR    R1,     R4                      ; 5D1B   008C
        MVO@    R2,     R4                      ; 5D1C   0262
        SWAP    R2,     1                       ; 5D1D   0042
        MVO@    R2,     R4                      ; 5D1E   0262
        MVII    #$0001, R3                      ; 5D1F   02BB 0001

        JSR     R5,     L_5A4A                  ; 5D21   0004 0158 024A
        JSR     R5,     L_5F63                  ; 5D24   0004 015C 0363

        PULR    R7                              ; 5D27   02B7

L_5D28:
        JSR     R5,     X_CLR_BIT               ; 5D28   0004 0114 02E6
        DECLE   $01E7                           ; 5D2B   01E7

        PULR    R7                              ; 5D2C   02B7

        PSHR    R5                              ; 5D2D   0275
        MVI     G_0164, R5                      ; 5D2E   0285 0164
        CMPI    #$0000, R5                      ; 5D30   037D 0000
        BEQ     L_5D48                          ; 5D32   0204 0014

        MOVR    R0,     R4                      ; 5D34   0084
        ADDR    R4,     R4                      ; 5D35   00E4
        ADDI    #$0185, R4                      ; 5D36   02FC 0185
        MVI@    R4,     R2                      ; 5D38   02A2
        MVI@    R4,     R3                      ; 5D39   02A3
        ADDI    #$000E, R4                      ; 5D3A   02FC 000E
        MVO@    R2,     R4                      ; 5D3C   0262
        MVO@    R3,     R4                      ; 5D3D   0263
        SUBI    #$0012, R4                      ; 5D3E   033C 0012
        MVI     G_0319, R2                      ; 5D40   0282 0319
        SWAP    R2,     1                       ; 5D42   0042
        MVO@    R2,     R4                      ; 5D43   0262
        MVI     G_031A, R2                      ; 5D44   0282 031A
        SWAP    R2,     1                       ; 5D46   0042
        MVO@    R2,     R4                      ; 5D47   0262
L_5D48:
        ADDI    #$0006, R1                      ; 5D48   02F9 0006
        MVII    #$0001, R0                      ; 5D4A   02B8 0001
        MVO@    R0,     R1                      ; 5D4C   0248
        PULR    R7                              ; 5D4D   02B7

        PSHR    R5                              ; 5D4E   0275
        MOVR    R0,     R4                      ; 5D4F   0084
        ADDR    R4,     R4                      ; 5D50   00E4
        ADDI    #$0195, R4                      ; 5D51   02FC 0195
        ADDI    #$0002, R1                      ; 5D53   02F9 0002
        MVI@    R4,     R2                      ; 5D55   02A2
        MVI@    R4,     R3                      ; 5D56   02A3
        SUBI    #$0012, R4                      ; 5D57   033C 0012
        MVO@    R2,     R4                      ; 5D59   0262
        MVO@    R3,     R4                      ; 5D5A   0263
        SWAP    R2,     1                       ; 5D5B   0042
        MVO@    R2,     R1                      ; 5D5C   024A
        INCR    R1                              ; 5D5D   0009
        SWAP    R3,     1                       ; 5D5E   0043
        MVO@    R3,     R1                      ; 5D5F   024B
        INCR    R1                              ; 5D60   0009
        CLRR    R0                              ; 5D61   01C0
        MVO@    R0,     R1                      ; 5D62   0248
        PULR    R7                              ; 5D63   02B7

        DECLE   $0000,  $0000,  $0000,  $0018   ; 5D64   0000 0000 0000 0018
        DECLE   $001E,  $0000,  $0000,  $0000   ; 5D68   001E 0000 0000 0000
        DECLE   $0030,  $003C,  $0000,  $0018   ; 5D6C   0030 003C 0000 0018
        DECLE   $001E,  $0000,  $0000,  $0000   ; 5D70   001E 0000 0000 0000
        DECLE   $0030,  $003C,  $0000,  $0018   ; 5D74   0030 003C 0000 0018
        DECLE   $001E,  $00C0,  $00F0,  $0000   ; 5D78   001E 00C0 00F0 0000
        DECLE   $0000,  $0000,  $0010,  $0030   ; 5D7C   0000 0000 0010 0030
        DECLE   $00FF,  $00FF,  $00FE,  $007E   ; 5D80   00FF 00FF 00FE 007E
        DECLE   $0000,  $0000,  $0000,  $0040   ; 5D84   0000 0000 0000 0040
        DECLE   $0040,  $00DE,  $00FE,  $007C   ; 5D88   0040 00DE 00FE 007C
        DECLE   $0000,  $0010,  $0008,  $0030   ; 5D8C   0000 0010 0008 0030
        DECLE   $001C,  $0076,  $00FF,  $00FE   ; 5D90   001C 0076 00FF 00FE
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D94   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $001C,  $007E   ; 5D98   0000 0004 001C 007E
        DECLE   $0000,  $0000,  $0000,  $0008   ; 5D9C   0000 0000 0000 0008
        DECLE   $0008,  $001C,  $002F,  $00FE   ; 5DA0   0008 001C 002F 00FE
        DECLE   $0000,  $0000,  $0000,  $0010   ; 5DA4   0000 0000 0000 0010
        DECLE   $003C,  $0000,  $0000,  $0000   ; 5DA8   003C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DAC   0000 0000 0000 0000
        DECLE   $0028,  $004C,  $00BF,  $007E   ; 5DB0   0028 004C 00BF 007E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DB4   0000 0000 0000 0000
        DECLE   $0008,  $00DC,  $003F,  $007E   ; 5DB8   0008 00DC 003F 007E
        DECLE   $0000,  $0000,  $0018,  $0018   ; 5DBC   0000 0000 0018 0018
        DECLE   $0018,  $0000,  $0000,  $0000   ; 5DC0   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0018   ; 5DC4   0000 0000 0018 0018
        DECLE   $0018,  $0000,  $0000,  $0000   ; 5DC8   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0000   ; 5DCC   0000 0000 0008 0000
        DECLE   $0014,  $0000,  $0000,  $0000   ; 5DD0   0014 0000 0000 0000
        DECLE   $0000,  $0000,  $0014,  $0000   ; 5DD4   0000 0000 0014 0000
        DECLE   $002A,  $0000,  $0014,  $0000   ; 5DD8   002A 0000 0014 0000
        DECLE   $0000,  $0000,  $002A,  $0000   ; 5DDC   0000 0000 002A 0000
        DECLE   $0014,  $0000,  $002A,  $0000   ; 5DE0   0014 0000 002A 0000
        DECLE   $0000,  $0000,  $002A,  $0000   ; 5DE4   0000 0000 002A 0000
        DECLE   $0055,  $0000,  $002A,  $0000   ; 5DE8   0055 0000 002A 0000
        DECLE   $002A,  $0000,  $0055,  $0000   ; 5DEC   002A 0000 0055 0000
        DECLE   $0055,  $0000,  $002A,  $0000   ; 5DF0   0055 0000 002A 0000
        DECLE   $0080,  $0000,  $0002,  $0000   ; 5DF4   0080 0000 0002 0000
        DECLE   $0000,  $0020,  $0018,  $0018   ; 5DF8   0000 0020 0018 0018
        DECLE   $0000,  $0004,  $0020,  $0000   ; 5DFC   0000 0004 0020 0000
        DECLE   $0000,  $0000,  $0080,  $0000   ; 5E00   0000 0000 0080 0000
        DECLE   $0081,  $0000,  $0000,  $0000   ; 5E04   0081 0000 0000 0000
        DECLE   $0040,  $0018,  $0024,  $0024   ; 5E08   0040 0018 0024 0024
        DECLE   $0024,  $0024,  $0018,  $0000   ; 5E0C   0024 0024 0018 0000
        DECLE   $0002,  $0000,  $0040,  $0000   ; 5E10   0002 0000 0040 0000
        DECLE   $0000,  $0000,  $0080,  $0000   ; 5E14   0000 0000 0080 0000
        DECLE   $003C,  $0042,  $0042,  $0042   ; 5E18   003C 0042 0042 0042
        DECLE   $004A,  $0042,  $0042,  $003C   ; 5E1C   004A 0042 0042 003C
        DECLE   $0000,  $0000,  $0000,  $0081   ; 5E20   0000 0000 0000 0081
        DECLE   $0000,  $0000,  $0018,  $0024   ; 5E24   0000 0000 0018 0024
        DECLE   $0042,  $0042,  $0081,  $0089   ; 5E28   0042 0042 0081 0089
        DECLE   $0081,  $0081,  $0046,  $0042   ; 5E2C   0081 0081 0046 0042
        DECLE   $0024,  $0018,  $0000,  $0000   ; 5E30   0024 0018 0000 0000
        DECLE   $0018,  $0024,  $0042,  $0042   ; 5E34   0018 0024 0042 0042
        DECLE   $0085,  $0081,  $0081,  $0081   ; 5E38   0085 0081 0081 0081
        DECLE   $0091,  $0081,  $0081,  $0042   ; 5E3C   0091 0081 0081 0042
        DECLE   $0042,  $0025,  $0018,  $0000   ; 5E40   0042 0025 0018 0000
        DECLE   $0024,  $0042,  $0081,  $0083   ; 5E44   0024 0042 0081 0083
        DECLE   $0000,  $0000,  $0010,  $0008   ; 5E48   0000 0000 0010 0008
        DECLE   $0000,  $0000,  $0020,  $0081   ; 5E4C   0000 0000 0020 0081
        DECLE   $0081,  $0042,  $0024,  $0024   ; 5E50   0081 0042 0024 0024
        DECLE   $0000,  $0044,  $0028,  $0010   ; 5E54   0000 0044 0028 0010
        DECLE   $0028,  $0044,  $0000,  $0000   ; 5E58   0028 0044 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E5C   0000 0000 0000 0000
        DECLE   $001C,  $0038,  $0070,  $00E0   ; 5E60   001C 0038 0070 00E0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E64   0000 0000 0000 0000
        DECLE   $0000,  $001C,  $0038,  $0070   ; 5E68   0000 001C 0038 0070
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0030   ; 5E70   0000 0000 0010 0030
        DECLE   $0300,  $0000,  $002D,  $005D   ; 5E74   0300 0000 002D 005D
        DECLE   $0003,  $0000,  $0001,  $004E   ; 5E78   0003 0000 0001 004E
        DECLE   $005D,  $0300,  $0000,  $00F3   ; 5E7C   005D 0300 0000 00F3
        DECLE   $005C,  $0008,  $0003,  $0001   ; 5E80   005C 0008 0003 0001
        DECLE   $000B,  $005D,  $000B,  $005D   ; 5E84   000B 005D 000B 005D
        DECLE   $00F3,  $005C,  $0008,  $0003   ; 5E88   00F3 005C 0008 0003
        DECLE   $0001                           ; 5E8C   0001

        INCR    R3                              ; 5E8D   000B
        SLLC    R1,     2                       ; 5E8E   005D
        MVI@    R5,     R6                      ; 5E8F   02AE
L_5E90:
        DECR    R7                              ; 5E90   0017

        DECLE   $00D5,  $0059,  $0007,  $000B   ; 5E91   00D5 0059 0007 000B
        DECLE   $000D,  $00C4,  $0059,  $00E4   ; 5E95   000D 00C4 0059 00E4
        DECLE   $0059,  $00E4,  $0159,  $02E4   ; 5E99   0059 00E4 0159 02E4
        DECLE   $0059,  $02E4,  $0159,  $01E4   ; 5E9D   0059 02E4 0159 01E4
        DECLE   $0059,  $01E4,  $0159,  $0000   ; 5EA1   0059 01E4 0159 0000
        DECLE   $0000                           ; 5EA5   0000

        MOVR    R5,     R6                      ; 5EA6   00AE
L_5EA7:
        DECR    R7                              ; 5EA7   0017

        DECLE   $0006,  $0012,  $0000           ; 5EA8   0006 0012 0000

        B       L_5EAD                          ; 5EAB   0200 0000

L_5EAD:
        MOVR    R5,     R6                      ; 5EAD   00AE
L_5EAE:
        DECR    R7                              ; 5EAE   0017

        DECLE   $0001,  $001E,  $0000,  $0000   ; 5EAF   0001 001E 0000 0000
        DECLE   $0000,  $00B0,  $005A,  $0003   ; 5EB3   0000 00B0 005A 0003
        DECLE   $001F,  $0000                   ; 5EB7   001F 0000
L_5EB9:
        PSHR    R5                              ; 5EB9   0275
        MVI     G_0164, R0                      ; 5EBA   0280 0164
        CMPI    #$0001, R0                      ; 5EBC   0378 0001
        BEQ     L_5EC4                          ; 5EBE   0204 0004

        CMPI    #$0008, R0                      ; 5EC0   0378 0008
        BNEQ    L_5F01                          ; 5EC2   020C 003D

L_5EC4:
        JSR     R5,     X_PLAY_SFX1             ; 5EC4   0004 0118 03BB
        DECLE   $03E9                           ; 5EC7  SFX data
        DECLE   $0280,  $0050                   ; 5EC8  SFX data
        DECLE   $00AB                           ; 5ECA  SFX data
        DECLE   $0035                           ; 5ECB  SFX data
        DECLE   $0017,  $0021                   ; 5ECC  SFX data
        DECLE   $03C9                           ; 5ECE  SFX data
        DECLE   $0280,  $0060                   ; 5ECF  SFX data
        DECLE   $0288,  $0061                   ; 5ED1  SFX data
        DECLE   $03FE                           ; 5ED3  SFX data
        DECLE   $008F,  $004F                   ; 5ED4  SFX data
        DECLE   $0035                           ; 5ED6  SFX data
        DECLE   $02CF                           ; 5ED7  SFX end

L_5ED8:
        PSHR    R5                              ; 5ED8   0275

        JSR     R5,     X_PLAY_SFX2             ; 5ED9   0004 0118 03BE
        DECLE   $00FE                           ; 5EDC  SFX prio
        DECLE   $03F9                           ; 5EDD  SFX data
        DECLE   $00B7                           ; 5EDE  SFX data
        DECLE   $000C,  $0050                   ; 5EDF  SFX data
        DECLE   $020B                           ; 5EE1  SFX data
        DECLE   $01EB                           ; 5EE2  SFX data
        DECLE   $000C,  $0030                   ; 5EE3  SFX data
        DECLE   $008F,  $0017                   ; 5EE5  SFX data
        DECLE   $0035                           ; 5EE7  SFX data
        DECLE   $006B                           ; 5EE8  SFX data
        DECLE   $00B7                           ; 5EE9  SFX data
        DECLE   $014F,  $000D                   ; 5EEA  SFX data
        DECLE   $000C,  $0050                   ; 5EEC  SFX data
        DECLE   $0077,  $00FC,  $005E           ; 5EEE  SFX data
        DECLE   $0023,  $03EE                   ; 5EF1  SFX data
        DECLE   $0035                           ; 5EF3  SFX data
        DECLE   $0203,  $03A0                   ; 5EF4  SFX data
        DECLE   $00CF                           ; 5EF6  SFX end


        MVII    #$0001, R0                      ; 5EF7   02B8 0001
        MVO     R0,     G_0164                  ; 5EF9   0240 0164
        PULR    R7                              ; 5EFB   02B7

UC_5EFC:
        ADDI    #$0003, R3                      ; 5EFC  SLIB UCALL target
        MVI@    R3,     R0                      ; 5EFE   0298
        INCR    R0                              ; 5EFF   0008
        MVO@    R0,     R3                      ; 5F00   0258
L_5F01:
        PULR    R7                              ; 5F01   02B7

L_5F02:
        PSHR    R5                              ; 5F02   0275

        JSR     R5,     X_PLAY_SFX2             ; 5F03   0004 0118 03BE
        DECLE   $00FE                           ; 5F06  SFX prio
        DECLE   $0079,  $03B7,  $010C,  $0000   ; 5F07   0079 03B7 010C 0000

        XOR@    R5,     R5                      ; 5F0B   03ED
        INCR    R3                              ; 5F0C   000B
        MOVR    R1,     R7                      ; 5F0D   008F

        DECLE   $0059,  $01CF                   ; 5F0E   0059 01CF

        JSR     R5,     L_5744                  ; 5F10   0004 0154 0344

        MVII    #$0001, R0                      ; 5F13   02B8 0001
        MVO     R0,     G_0164                  ; 5F15   0240 0164
        PULR    R7                              ; 5F17   02B7

L_5F18:
        PSHR    R5                              ; 5F18   0275
        MVII    #$00FE, R0                      ; 5F19   02B8 00FE
        MVO     R0,     G_0146                  ; 5F1B   0240 0146

        JSR     R5,     X_PLAY_MUS2             ; 5F1D   0004 0118 035D
        DECLE   $018A                           ; 5F20  Note (short)
        DECLE   $024D                           ; 5F21  Note (short)
        DECLE   $018A                           ; 5F22  Note (short)
        DECLE   $024D                           ; 5F23  Note (short)
        DECLE   $018A                           ; 5F24  Note (short)
        DECLE   $03F4,  $024E                   ; 5F25  Note (long)
        DECLE   $03F0,  $000F                   ; 5F27  Note (long)
        DECLE   $0000                           ; 5F29  End of music

        MVI     G_0165, R0                      ; 5F2A   0280 0165
        MVO     R0,     G_0177                  ; 5F2C   0240 0177

        JSR     R5,     L_5CC2                  ; 5F2E   0004 015C 00C2

        MVII    #$0008, R0                      ; 5F31   02B8 0008
        MVO     R0,     G_0164                  ; 5F33   0240 0164
        PULR    R7                              ; 5F35   02B7

L_5F36:
        PSHR    R5                              ; 5F36   0275
        CMPI    #$0001, R4                      ; 5F37   037C 0001
        BLE     L_5F47                          ; 5F39   0206 000C

        JSR     R5,     X_PLAY_SFX2             ; 5F3B   0004 0118 03BE
        DECLE   $0033                           ; 5F3E  SFX prio
        DECLE   $0379,  $006C,  $0000,  $00B7   ; 5F3F   0379 006C 0000 00B7
        DECLE   $030D,  $000B,  $03AB,  $03CF   ; 5F43   030D 000B 03AB 03CF
L_5F47:
        JSR     R5,     X_PLAY_SFX2             ; 5F47   0004 0118 03BE
        DECLE   $0033                           ; 5F4A  SFX prio
        DECLE   $0279,  $00CC,  $0000,  $008D   ; 5F4B   0279 00CC 0000 008D
        DECLE   $0387,  $01B7                   ; 5F4F   0387 01B7

        INCR    R3                              ; 5F51   000B
        MOVR    R1,     R7                      ; 5F52   008F

        DECLE   $001D,  $03CF                   ; 5F53   001D 03CF
L_5F55:
        PSHR    R5                              ; 5F55   0275

        JSR     R5,     X_PLAY_SFX2             ; 5F56   0004 0118 03BE
        DECLE   $0034                           ; 5F59  SFX prio
        DECLE   $0079,  $03ED,  $010C,  $0000   ; 5F5A   0079 03ED 010C 0000
        DECLE   $03B7                           ; 5F5E   03B7

        INCR    R3                              ; 5F5F   000B
        MOVR    R1,     R7                      ; 5F60   008F

        DECLE   $0013,  $03CF                   ; 5F61   0013 03CF
L_5F63:
        PSHR    R5                              ; 5F63   0275

        JSR     R5,     X_PLAY_SFX2             ; 5F64   0004 0118 03BE
        DECLE   $0030                           ; 5F67  SFX prio

        INCR    R1                              ; 5F68   0009
        XOR@    R5,     R5                      ; 5F69   03ED
        ADD@    R6,     R5                      ; 5F6A   02F5
        XORI    #$008F, R6                      ; 5F6B   03FE 008F
        COMR    R5                              ; 5F6D   001D
        ADD@    R1,     R7                      ; 5F6E   02CF

L_5F6F:
        PSHR    R5                              ; 5F6F   0275

        JSR     R5,     X_PLAY_SFX2             ; 5F70   0004 0118 03BE
        DECLE   $002D                           ; 5F73  SFX prio
        DECLE   $0279,  $03B5,  $034E,  $02AD   ; 5F74   0279 03B5 034E 02AD
        DECLE   $016B,  $003E,  $000F           ; 5F78   016B 003E 000F

        XORI    #$008F, R6                      ; 5F7B   03FE 008F
        DECR    R3                              ; 5F7D   0013
        INCR    R7                              ; 5F7E   000F

        DECLE   $0000                           ; 5F7F   0000
L_5F80:
        XOR@    R5,     R6                      ; 5F80   03EE
        MOVR    R1,     R7                      ; 5F81   008F

        DECLE   $0027                           ; 5F82   0027

        XORI    #$02CF, R1                      ; 5F83   03F9 02CF
L_5F85:
        PSHR    R5                              ; 5F85   0275

        JSR     R5,     X_PLAY_SFX1             ; 5F86   0004 0118 03BB
        DECLE   $021D                           ; 5F89  SFX data
        DECLE   $03C9                           ; 5F8A  SFX data
        DECLE   $0300,  $0100                   ; 5F8B  SFX data
        DECLE   $0308,  $0180                   ; 5F8D  SFX data
        DECLE   $01EB                           ; 5F8F  SFX data
        DECLE   $02C0,  $0180                   ; 5F90  SFX data
        DECLE   $02C8,  $0200                   ; 5F92  SFX data
        DECLE   $0103,  $03D4                   ; 5F94  SFX data
        DECLE   $02CF                           ; 5F96  SFX end

L_5F97:
        PSHR    R5                              ; 5F97   0275
        MOVR    R1,     R0                      ; 5F98   0088

        JSR     R5,     X_PLAY_SFX2             ; 5F99   0004 0118 03BE
        DECLE   $0081                           ; 5F9C  SFX prio

        RRC     R3,     2                       ; 5F9D   0077
        MOVR    R4,     R5                      ; 5F9E   00A5
        SLLC    R3,     2                       ; 5F9F   005F
        XOR     G_0365, R5                      ; 5FA0   03C5 0365
        XOR@    R1,     R1                      ; 5FA2   03C9
        MVO@    R3,     R5                      ; 5FA3   026B
        ADD@    R1,     R7                      ; 5FA4   02CF

        CLRR    R0                              ; 5FA5   01C0
        MVO@    R0,     R3                      ; 5FA6   0258
        INCR    R3                              ; 5FA7   000B
        MVII    #$0014, R0                      ; 5FA8   02B8 0014
        MVO@    R0,     R3                      ; 5FAA   0258
        ADDI    #$0003, R3                      ; 5FAB   02FB 0003
        MVI     G_0159, R0                      ; 5FAD   0280 0159
        ADDI    #$0002, R0                      ; 5FAF   02F8 0002
        MVO@    R0,     R3                      ; 5FB1   0258
        INCR    R3                              ; 5FB2   000B
        MVII    #$0001, R0                      ; 5FB3   02B8 0001
        MVO@    R0,     R3                      ; 5FB5   0258
        PULR    R7                              ; 5FB6   02B7

        DECR    R1                              ; 5FB7   0011
        DECR    R1                              ; 5FB8   0011
        NEGR    R2                              ; 5FB9   0022
        DECR    R1                              ; 5FBA   0011
        GSWD    R3                              ; 5FBB   0033
        NEGR    R2                              ; 5FBC   0022
        DECR    R1                              ; 5FBD   0011
        NEGR    R2                              ; 5FBE   0022
        GSWD    R3                              ; 5FBF   0033
        ADDR    R1,     R0                      ; 5FC0   00C8
        ADDR    R1,     R1                      ; 5FC1   00C9
        ADDR    R6,     R2                      ; 5FC2   00F2
        SARC    R3,     1                       ; 5FC3   007B
        SARC    R0,     2                       ; 5FC4   007C
        ADCR    R5                              ; 5FC5   002D
        SARC    R2,     2                       ; 5FC6   007E
        MOVR    R4,     R7                      ; 5FC7   00A7

        INCR    R4                              ; 5FC8   000C
        INCR    R4                              ; 5FC9   000C
        INCR    R6                              ; 5FCA   000E
        INCR    R6                              ; 5FCB   000E
        DECR    R0                              ; 5FCC   0010
        DECR    R0                              ; 5FCD   0010
        INCR    R0                              ; 5FCE   0008
        INCR    R4                              ; 5FCF   000C
        CLRC                                    ; 5FD0   0006
        NEGR    R3                              ; 5FD1   0023
        GSWD    R2                              ; 5FD2   0032
        COMR    R6                              ; 5FD3   001E
        DECR    R6                              ; 5FD4   0016
        DECR    R2                              ; 5FD5   0012
        INCR    R4                              ; 5FD6   000C
        COMR    R1                              ; 5FD7   0019
        INCR    R7                              ; 5FD8   000F

        INCR    R5                              ; 5FD9   000D
L_5FDA:
        INCR    R1                              ; 5FDA   0009
        DECLE   $0013,  $001A,  $0023,  $0034   ; 5FDB   0013 001A 0023 0034
        DECLE   $000C,  $001F,  $0005,  $0003   ; 5FDF   000C 001F 0005 0003
        DECLE   $0006,  $0000,  $0004,  $0001   ; 5FE3   0006 0000 0004 0001

        EIS                                     ; 5FE7   0002
        EIS                                     ; 5FE8   0002
        ADCR    R0                              ; 5FE9   0028
        COMR    R1                              ; 5FEA   0019
        ADCR    R5                              ; 5FEB   002D
        RSWD    R4                              ; 5FEC   003C
        COMR    R6                              ; 5FED   001E
        COMR    R1                              ; 5FEE   0019
        DECR    R4                              ; 5FEF   0014
        DECR    R4                              ; 5FF0   0014
        DECR    R4                              ; 5FF1   0014
        INCR    R4                              ; 5FF2   000C
        CLRC                                    ; 5FF3   0006
        SETC                                    ; 5FF4   0007
        INCR    R1                              ; 5FF5   0009
        INCR    R2                              ; 5FF6   000A
        INCR    R4                              ; 5FF7   000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFC   0000 0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5036       <entry>
;;  $512E       $512C  
;;  $5137       $51C7  
;;  $517C       $517F  
;;  $51EC       $503B   $5C69  
;;  $51FB       $5214  
;;  $5202       $5210  
;;  $520E       $521B  
;;  $5219       $5261  
;;  $521A       $5205   $521F  
;;  $5221       $5B2D  
;;  $5237       $5247  
;;  $524A       $5237  
;;  $524F       $525C  
;;  $525E       $524F  
;;  $5279       $528C  
;;  $5281       $528A  
;;  $5288       $528F  
;;  $528E       $5283  
;;  $52A5       $52A0  
;;  $52A6       $52A4  
;;  $52A9       $5295  
;;  $52AA       $52A8  
;;  $52AF       $5286  
;;  $52B0       $52AE  
;;  $52B6       <entry>
;;  $52BF       $52BA  
;;  $52E3       $52D0  
;;  $52E7       $52D6   $5373  
;;  $52E9       $5336   $538C  
;;  $52FA       $52F0  
;;  $530D       $5309  
;;  $5316       $5311  
;;  $5361       $534C  
;;  $5366       $5351  
;;  $5389       $5364  
;;  $539B       $52F2   $52F7  
;;  $53AA       $53A6  
;;  $53B4       $53B0  
;;  $53B8       $5319  
;;  $53B9       $531F  
;;  $53BB       $53B6  
;;  $53C3       $53D3  
;;  $53C9       $53C5  
;;  $53DA       $546C   $5478   $548C  
;;  $53DB       $54F3  
;;  $53DF       $53F9   $5451   $54A4   $54E3   $54FA   $5520   $5539   $555D  
;;  $53DF       $559D   $564D   $5673   $56AB   $56CC   $5706   $5B76   $5C40  
;;  $53DF       $5C8B  
;;  $53E3       $539C   $53A1   $543A   $54DE   $54ED   $5592   $5769   $5869  
;;  $53E4       $53E2  
;;  $53E7       $5491   $54AA   $551B   $554E   $55AD   $570E   $5CA9  
;;  $53EB       $53AA   $54D2   $54F5   $5542   $5547   $55B2   $576D   $57A5  
;;  $53EC       $53EA  
;;  $53F0       $53FD   $546E   $5500   $56D2   $56EE   $5B7C   $5C72  
;;  $53F8       $542A  
;;  $5402       $541F  
;;  $5410       $5407   $540D  
;;  $5419       $5416  
;;  $5422       $5725  
;;  $5451       $544E  
;;  $545D       $544C  
;;  $5467       $5458  
;;  $5471       $547C  
;;  $547E       $5472  
;;  $5496       $5489   $54C7  
;;  $549C       $5498  
;;  $54A1       $5448  
;;  $54D8       $54BD   $54C3   $54CA  
;;  $54DC       $5424   $5461   $54EA   $5537   $5598  
;;  $54DD       $5426   $54A1  
;;  $54ED       $5441  
;;  $54F9       $54D6  
;;  $5509       $5505   $5517  
;;  $5519       $550A  
;;  $5520       $5445  
;;  $552E       $5527  
;;  $552F       $553F  
;;  $5536       $5533  
;;  $554C       $552C  
;;  $555C       $5555   $5C4C  
;;  $5591       $5766   $5C32   $5C37  
;;  $559B       $5558  
;;  $559C       $559A  
;;  $559D       $55A8  
;;  $55AC       $55A3  
;;  $55B1       $55AA  
;;  $55B7       $54B5   $5552   $56BB  
;;  $55C2       $55BC  
;;  $55C3       $561F   $573D   $5AFC  
;;  $55D2       $54B8   $5624   $5663   $56BF   $58DE  
;;  $55DB       $55D9  
;;  $55DF       $55DC  
;;  $55E3       $55E0  
;;  $55E8       $55E5  
;;  $55EB       $5607   $5611   $5619   $5629   $5641   $5653   $565C   $5696  
;;  $55EB       $5702   $571B  
;;  $55EC       $55D6   $58EC  
;;  $55F9       $52FA  
;;  $5602       $55FF  
;;  $5639       $52FD  
;;  $565A       $5670  
;;  $566A       $5660   $567E  
;;  $5673       $5668  
;;  $5680       $5679  
;;  $5689       $52EA  
;;  $56A0       $5687  
;;  $56A7       $568B   $5690  
;;  $56AB       $56EB  
;;  $56D5       $56E8  
;;  $56E0       $56CA   $56DA  
;;  $56E5       $56DE  
;;  $56EA       $56B1   $56C4  
;;  $56EE       $545A  
;;  $56F1       $56FA  
;;  $56FC       $5738  
;;  $5700       $56F5  
;;  $5729       $5704  
;;  $572F       $5736  
;;  $573A       $5731  
;;  $5744       $5F10  
;;  $5765       $575C  
;;  $5781       $577E  
;;  $5788       $5784  
;;  $5789       $579E  
;;  $5799       $578D   $5790  
;;  $57A4       $5795  
;;  $57A9       $5778  
;;  $57B5       $5775   $57B2   $57B9   $57FC   $583A   $5841   $5846  
;;  $57B6       $577C  
;;  $57C6       $5383  
;;  $57D1       $57F6  
;;  $57F1       $57D4  
;;  $57F9       $57E3   $57E8  
;;  $5808       $5804  
;;  $580A       $57D8   $584B  
;;  $581D       $57EE   $5864  
;;  $5833       $57C8   $57CD  
;;  $5868       $5843   $58A7   $595D  
;;  $5873       $57D1  
;;  $5874       $586E   $5872  
;;  $5899       $587D   $5881  
;;  $589B       $5386  
;;  $58A6       $589D   $58A2  
;;  $58C2       $58B6  
;;  $590D       $5909  
;;  $590E       $5903   $590C  
;;  $5910       $58E8  
;;  $5911       $590F  
;;  $591F       $58CC   $5924   $594E   $5960   $596D   $59B8   $59C0   $59C8  
;;  $591F       $59CF   $59DE   $59E8   $59EE   $59F5   $5A10   $5AC2  
;;  $5920       $58C6  
;;  $592F       $592B  
;;  $5948       $58B1  
;;  $5953       $58D3  
;;  $5957       $58DA   $5907  
;;  $5958       $5956  
;;  $5990       $598C  
;;  $59B1       $59CA   $59F0  
;;  $5A01       $5380  
;;  $5A0A       $5A04  
;;  $5A0B       $5A09  
;;  $5A32       $5A41  
;;  $5A3E       $5A33  
;;  $5A4A       $5A38   $5D21  
;;  $5A57       $5A53  
;;  $5A59       $5A67  
;;  $5A64       $5A5C   $5A6C  
;;  $5A6A       $5A62  
;;  $5A7C       $5A78  
;;  $5A8C       $5A85  
;;  $5A96       $5A8D  
;;  $5ABF       $5AB9  
;;  $5AC5       $5AD7  
;;  $5AD3       $5ACB   $5ACF  
;;  $5ADA       $5463  
;;  $5AE2       $5AEA  
;;  $5B15       $5B12  
;;  $5B1B       $5B17  
;;  $5B1F       $5B1C  
;;  $5B25       $5B21  
;;  $5B3E       $5B4C  
;;  $5B40       $5B44  
;;  $5B66       $5BEA  
;;  $5B67       $5B27   $5B2A  
;;  $5B70       $5B31   $5B35  
;;  $5B8E       $5B88  
;;  $5B93       $5B8F  
;;  $5B9C       $5B98   $5BC5  
;;  $5BA5       $5BAF  
;;  $5BC8       $5370  
;;  $5BD0       $5BD8  
;;  $5BD5       $5BD2  
;;  $5BE7       $5357   $535E  
;;  $5C00       $5BFC  
;;  $5C08       $5C01  
;;  $5C0C       $5C08  
;;  $5C0D       $5C03   $5C06   $5C0B  
;;  $5C15       $5C22  
;;  $5C29       <entry>
;;  $5C3E       $5C5F  
;;  $5C3F       $5C3D  
;;  $5C40       $5C63  
;;  $5C5A       $5C46  
;;  $5C71       $5750   $5A7C  
;;  $5C7F       $5C89  
;;  $5C8B       $5C85  
;;  $5C98       $5C94  
;;  $5CA1       $5C9A  
;;  $5CA9       $5CA6  
;;  $5CAE       $5C7C  
;;  $5CB2       $536D   $56A3  
;;  $5CB5       $5CBF  
;;  $5CC1       $5D10  
;;  $5CC2       $5216   $5397   $5F2E  
;;  $5CCE       $5CED  
;;  $5CD4       $5CCC  
;;  $5CE2       $5CD0   $5CDC  
;;  $5D28       $5D14  
;;  $5D48       $5CF8   $5D32  
;;  $5E90       $5E90  
;;  $5EA7       $5EA7  
;;  $5EAD       $5EAB  
;;  $5EAE       $5EAE  
;;  $5EB9       <entry>
;;  $5EC4       $5EBE  
;;  $5ED8       $5631  
;;  $5EFC       <entry>
;;  $5F01       $5EC2  
;;  $5F02       $5684  
;;  $5F18       $569D  
;;  $5F36       $59A9  
;;  $5F47       $5F39  
;;  $5F55       $5A46  
;;  $5F63       $5D24  
;;  $5F6F       $59E0  
;;  $5F80       $5F7E  
;;  $5F85       $57C2  
;;  $5F97       $53DB   $56FC   $57A0  
;;  $5FDA       $5FD8  
;; ======================================================================== ;;
