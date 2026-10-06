
        ORG     $5000
.HEADER:
        BIDECLE $5ED8           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $62F6           ; 5004  Ptr: Start of game
        BIDECLE $5DF6           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5EB6           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5022           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0004           ; 5013  Border color init

        DECLE   $01A8,  $01B0,  $01C0,  $01D0   ; 5014   01A8 01B0 01C0 01D0
        DECLE   $01E0,  $01F0,  $0198,  $01A0   ; 5018   01E0 01F0 0198 01A0
.TIMER:
        DECLE   $00F7,  $0050,  $0001,  $0000; 501C  Timer dispatch/interval
        BIDECLE $0000           ; 5020  End of timer table

.TITLE:
        DECLE   $0051                           ; 5022  Cartridge year
        STRING  "Sub Hunt"                      ; 5023  Title string
        DECLE   $0000                           ; 502B  

.TITLECODE:
        MVI     .PSG0.rgt_hand,R1               ; 502C   0281 01FE
        CMPI    #$0007, R1                      ; 502E   0379 0007
        BNEQ    L_50D7                          ; 5030   020C 00A5

        MVII    #$000E, R0                      ; 5032   02B8 000E

        JSR     R5,     X_PLAY_CHEER1           ; 5034   0004 011C 02D5

        SDBD                                    ; 5037   0001
        MVII    #$50B0, R0                      ; 5038   02B8 00B0 0050
        MVO     R0,     .ISRVEC.0               ; 503B   0240 0100
        SWAP    R0,     1                       ; 503D   0040
        MVO     R0,     .ISRVEC.1               ; 503E   0240 0101
        CLRR    R0                              ; 5040   01C0
        MVO     R0,     G_0160                  ; 5041   0240 0160
        MVO     R0,     G_0161                  ; 5043   0240 0161
        MVO     R0,     G_0162                  ; 5045   0240 0162
        SDBD                                    ; 5047   0001
        MVII    #$7FFF, R0                      ; 5048   02B8 00FF 007F
L_504B:
        EIS                                     ; 504B   0002
        MOVR    R0,     R1                      ; 504C   0081
        SWAP    R1,     1                       ; 504D   0041
        SLR     R1,     2                       ; 504E   0065
        SLR     R1,     2                       ; 504F   0065
        ANDI    #$0007, R1                      ; 5050   03B9 0007
        SUBI    #$0007, R1                      ; 5052   0339 0007
        NEGR    R1                              ; 5054   0021
        MVO     R1,     G_016E                  ; 5055   0241 016E
        DECR    R0                              ; 5057   0010
        BPL     L_504B                          ; 5058   0223 000E

L_505A:
        JSR     R5,     L_5083                  ; 505A   0004 0150 0083

        MVII    #$0002, R1                      ; 505D   02B9 0002
L_505F:
        SDBD                                    ; 505F   0001
        MVII    #$0400, R0                      ; 5060   02B8 0000 0004
L_5063:
        EIS                                     ; 5063   0002
        DECR    R0                              ; 5064   0010
        BPL     L_5063                          ; 5065   0223 0003

        MOVR    R1,     R2                      ; 5067   008A
        ADDI    #$0160, R2                      ; 5068   02FA 0160
        MVI@    R2,     R3                      ; 506A   0293
        TSTR    R3                              ; 506B   009B
        BEQ     L_507E                          ; 506C   0204 0010

        ADDI    #$0200, R3                      ; 506E   02FB 0200
        MVI@    R3,     R4                      ; 5070   029C
        CLRR    R5                              ; 5071   01ED
        MVO@    R5,     R3                      ; 5072   025D
        ADDI    #$0014, R3                      ; 5073   02FB 0014
        CMPI    #$02EF, R3                      ; 5075   037B 02EF
        BGT     L_507D                          ; 5077   020E 0004

        MVO@    R4,     R3                      ; 5079   025C
        MOVR    R3,     R5                      ; 507A   009D
        SUBI    #$0200, R5                      ; 507B   033D 0200
L_507D:
        MVO@    R5,     R2                      ; 507D   0255
L_507E:
        DECR    R1                              ; 507E   0011
        BPL     L_505F                          ; 507F   0223 0021
        B       L_505A                          ; 5081   0220 0028

L_5083:
        PSHR    R5                              ; 5083   0275
        MVII    #$0160, R1                      ; 5084   02B9 0160
L_5086:
        MVI@    R1,     R2                      ; 5086   028A
        TSTR    R2                              ; 5087   0092
        BEQ     L_5091                          ; 5088   0204 0007

        INCR    R1                              ; 508A   0009
        CMPI    #$0162, R1                      ; 508B   0379 0162
        BLE     L_5086                          ; 508D   0226 0008
        B       L_50A7                          ; 508F   0200 0016

L_5091:
        MVII    #$003C, R3                      ; 5091   02BB 003C
L_5093:
        MVII    #$00F0, R0                      ; 5093   02B8 00F0

        JSR     R5,     X_RAND2                 ; 5095   0004 0114 029E

        ADDI    #$0200, R0                      ; 5098   02F8 0200
        MOVR    R0,     R2                      ; 509A   0082
        MVI@    R2,     R0                      ; 509B   0290
        TSTR    R0                              ; 509C   0080
        BNEQ    L_50A4                          ; 509D   020C 0005

        DECR    R3                              ; 509F   0013
        BPL     L_5093                          ; 50A0   0223 000E
        B       L_50A7                          ; 50A2   0200 0003

L_50A4:
        SUBI    #$0200, R2                      ; 50A4   033A 0200
        MVO@    R2,     R1                      ; 50A6   024A
L_50A7:
        PULR    R7                              ; 50A7   02B7

        DECLE   $0000,  $0002,  $0001,  $0004   ; 50A8   0000 0002 0001 0004
        DECLE   $0003,  $0006,  $0005           ; 50AC   0003 0006 0005

        SETC                                    ; 50AF   0007
        PSHR    R5                              ; 50B0   0275
        CLRR    R0                              ; 50B1   01C0
        MVO     R0,     .STIC.VIDEN             ; 50B2   0240 0020
        MVI     G_016F, R1                      ; 50B4   0281 016F
        INCR    R1                              ; 50B6   0009
        CMP     G_016E, R1                      ; 50B7   0341 016E
        BLE     L_50BC                          ; 50B9   0206 0001

        CLRR    R1                              ; 50BB   01C9
L_50BC:
        MVO     R1,     G_016F                  ; 50BC   0241 016F
        MOVR    R1,     R2                      ; 50BE   008A
        INCR    R2                              ; 50BF   000A
        CMP     G_016E, R2                      ; 50C0   0342 016E
        BLE     L_50C5                          ; 50C2   0206 0001

        CLRR    R2                              ; 50C4   01D2
L_50C5:
        SDBD                                    ; 50C5   0001
        ADDI    #$50A8, R1                      ; 50C6   02F9 00A8 0050
        SDBD                                    ; 50C9   0001
        ADDI    #$50A8, R2                      ; 50CA   02FA 00A8 0050
        MVI@    R1,     R0                      ; 50CD   0288
        MVO     R0,     .STIC.HDLY              ; 50CE   0240 0030
        MVI@    R2,     R0                      ; 50D0   0290
        MVO     R0,     .STIC.VDLY              ; 50D1   0240 0031

        JSR     R5,     X_PLAY_NOTE             ; 50D3   0004 0118 02BD

        PULR    R7                              ; 50D6   02B7

L_50D7:
        SDBD                                    ; 50D7   0001
        MVII    #$50DD, R4                      ; 50D8   02BC 00DD 0050
        PSHR    R4                              ; 50DB   0274
        MOVR    R5,     R7                      ; 50DC   00AF

        SUBI    #$0003, R0                      ; 50DD   0338 0003
        MOVR    R0,     R1                      ; 50DF   0081
        SDBD                                    ; 50E0   0001
        ADDI    #$50F3, R1                      ; 50E1   02F9 00F3 0050
        MVI@    R1,     R0                      ; 50E4   0288
        CMPI    #$0082, R2                      ; 50E5   037A 0082
        BNEQ    L_50EB                          ; 50E7   020C 0002

        MVII    #$0001, R0                      ; 50E9   02B8 0001
L_50EB:
        CMPI    #$0042, R2                      ; 50EB   037A 0042
        BNEQ    L_50F0                          ; 50ED   020C 0001

        CLRR    R0                              ; 50EF   01C0
L_50F0:
        MVO     R0,     G_01C6                  ; 50F0   0240 01C6
        PULR    R7                              ; 50F2   02B7

        DECLE   $0002,  $0002,  $0003,  $0004   ; 50F3   0002 0002 0003 0004
L_50F7:
        PSHR    R5                              ; 50F7   0275
        MVI     G_01CA, R0                      ; 50F8   0280 01CA
        DECR    R0                              ; 50FA   0010
        BMI     L_50FF                          ; 50FB   020B 0002

        MVO     R0,     G_01CA                  ; 50FD   0240 01CA
L_50FF:
        MVI     G_01C7, R0                      ; 50FF   0280 01C7
        ANDI    #$0003, R0                      ; 5101   03B8 0003
        BEQ     L_513C                          ; 5103   0204 0037

        DECR    R0                              ; 5105   0010
        BNEQ    L_513B                          ; 5106   020C 0033

        JSR     R5,     L_5A15                  ; 5108   0004 0158 0215

L_510B:
        EIS                                     ; 510B   0002
        MVI     G_0102, R0                      ; 510C   0280 0102
        CMPI    #$0002, R0                      ; 510E   0378 0002
        BGT     L_510B                          ; 5110   022E 0006
        BNEQ    L_5118                          ; 5112   020C 0004

        SLL     R0,     1                       ; 5114   0048

        JSR     R5,     .EXEC.41C               ; 5115   0004 0114 001C
L_5118:
        JSR     R5,     L_5733                  ; 5118   0004 0154 0333

        MVI     G_01C7, R0                      ; 511B   0280 01C7
        XORI    #$0004, R0                      ; 511D   03F8 0004
        MVO     R0,     G_01C7                  ; 511F   0240 01C7
        SLR     R0,     2                       ; 5121   0064
        BEQ     L_5127                          ; 5122   0204 0003

        JSR     R5,     L_53C6                  ; 5124   0004 0150 03C6
L_5127:
        JSR     R5,     L_5603                  ; 5127   0004 0154 0203
L_512A:
        JSR     R5,     L_6095                  ; 512A   0004 0160 0095

        MVII    #$0003, R1                      ; 512D   02B9 0003
        MVI     G_01CB, R0                      ; 512F   0280 01CB
        MVII    #$0010, R3                      ; 5131   02BB 0010
        SWAP    R3,     1                       ; 5133   0043
        ADD     G_01C6, R3                      ; 5134   02C3 01C6
        MVII    #$0250, R4                      ; 5136   02BC 0250

        JSR     R5,     X_PRNUM_RGT             ; 5138   0004 0118 00C5

L_513B:
        PULR    R7                              ; 513B   02B7

L_513C:
        JSR     R5,     L_6129                  ; 513C   0004 0160 0129

        B       L_512A                          ; 513F   0220 0016

        DECLE   $0300,  $0000,  $0000,  $0000   ; 5141   0300 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0100   ; 5145   0001 0000 0000 0100
        DECLE   $0000,  $0000,  $0000,  $0010   ; 5149   0000 0000 0000 0010
        DECLE   $0003,  $0002,  $008E,  $015D   ; 514D   0003 0002 008E 015D
        DECLE   $0100,  $0000                   ; 5151   0100 0000

        MOVR    R1,     R6                      ; 5153   008E
        SLLC    R0,     2                       ; 5154   005C

        JSRE    R4,     .EXEC.400               ; 5155   0004 0015 0000
        DECLE   $0300,  $0000,  $008E,  $005C   ; 5158   0300 0000 008E 005C
        DECLE   $0001,  $0019,  $0000,  $0100   ; 515C   0001 0019 0000 0100
        DECLE   $0000,  $0066,  $0051,  $0001   ; 5160   0000 0066 0051 0001
        DECLE   $0022,  $0000                   ; 5164   0022 0000

        INCR    R1                              ; 5166   0009
        CLRR    R0                              ; 5167   01C0
        MVO@    R0,     R1                      ; 5168   0248
        MOVR    R5,     R7                      ; 5169   00AF

        DECLE   $0000                           ; 516A   0000

        ANDR    R2,     R4                      ; 516B   0194
        DECR    R0                              ; 516C   0010
        SLR     R0,     2                       ; 516D   0064
        ADCR    R2                              ; 516E   002A
        GSWD    R2                              ; 516F   0032
        MOVR    R6,     R4                      ; 5170   00B4
        SAR     R2,     1                       ; 5171   006A
        EIS                                     ; 5172   0002
        XORR    R5,     R0                      ; 5173   01E8
        ADDR    R2,     R0                      ; 5174   00D0
        DECR    R2                              ; 5175   0012
        XOR@    R5,     R0                      ; 5176   03E8
        DECR    R4                              ; 5177   0014
        ADCR    R2                              ; 5178   002A
        ADD@    R5,     R0                      ; 5179   02E8
        CMPR    R2,     R7                      ; 517A   0157
        SLR     R1,     1                       ; 517B   0061
        SLR     R1,     1                       ; 517C   0061
        MOVR    R1,     R7                      ; 517D   008F

        MOVR    R4,     R5                      ; 517E   00A5
        NEGR    R2                              ; 517F   0022
        ADDR    R4,     R7                      ; 5180   00E7

        ANDR    R6,     R2                      ; 5181   01B2
        MVO@    R2,     R5                      ; 5182   026A
        ANDR    R7,     R2                      ; 5183   01BA
        MVO@    R5,     R5                      ; 5184   026D
        ANDR    R4,     R5                      ; 5185   01A5
        NEGR    R1                              ; 5186   0021
        XORR    R1,     R5                      ; 5187   01CD
        NEGR    R2                              ; 5188   0022
        ANDR    R3,     R6                      ; 5189   019E
        MVO@    R2,     R5                      ; 518A   026A
        CLRR    R1                              ; 518B   01C9
        NEGR    R1                              ; 518C   0021
        COMR    R0                              ; 518D   0018
        ADCR    R0                              ; 518E   0028
        B       L_53C5                          ; 518F   0200 0234

        DECLE   $0081,  $0344,  $027A,  $034C   ; 5191   0081 0344 027A 034C
        DECLE   $0004,  $0021,  $030C,  $0053   ; 5195   0004 0021 030C 0053
        DECLE   $004A,  $0304,  $009F,  $0322   ; 5199   004A 0304 009F 0322
        DECLE   $02FC,  $036E,  $02F4,  $0012   ; 519D   02FC 036E 02F4 0012
        DECLE   $02F0,  $012B,  $003E,  $02F8   ; 51A1   02F0 012B 003E 02F8
        DECLE   $0107,  $017E,  $0308,  $0067   ; 51A5   0107 017E 0308 0067
        DECLE   $0152,  $0300,  $008B,  $005E   ; 51A9   0152 0300 008B 005E
        DECLE   $0310,  $0092,  $0318,  $00FE   ; 51AD   0310 0092 0318 00FE
        DECLE   $0320,  $0132,  $0328,  $00AE   ; 51B1   0320 0132 0328 00AE
        DECLE   $0330,  $00E2,  $0338,  $01E6   ; 51B5   0330 00E2 0338 01E6
        DECLE   $0314,  $022A,  $031C,  $0376   ; 51B9   0314 022A 031C 0376
        DECLE   $02B4,  $03BA,  $0354,  $019A   ; 51BD   02B4 03BA 0354 019A
        DECLE   $0250,  $01AE,  $0258,  $01C6   ; 51C1   0250 01AE 0258 01C6
        DECLE   $0260,  $0166,  $0358,  $016A   ; 51C5   0260 0166 0358 016A
        DECLE   $0360,  $0212                   ; 51C9   0360 0212

        MVII    #$020E, R0                      ; 51CB   02B8 020E
        ADD     .BTAB.16,R0                     ; 51CD   02C0 0216
        ADD@    R1,     R0                      ; 51CF   02C8
        CMP@    R4,     R6                      ; 51D0   0366
        ADD@    R2,     R5                      ; 51D1   02D5
        SUB@    R2,     R6                      ; 51D2   0316
        ADD@    R3,     R5                      ; 51D3   02DD
        AND@    R6,     R6                      ; 51D4   03B6
        ADD@    R4,     R5                      ; 51D5   02E5
        XOR@    R5,     R0                      ; 51D6   03E8
L_51D7:
        PSHR    R5                              ; 51D7   0275
        SDBD                                    ; 51D8   0001
        MVII    #$0007, R0                      ; 51D9   02B8 0007 0000
        MVO     R0,     G_015E                  ; 51DC   0240 015E
        CLRR    R0                              ; 51DE   01C0
        MVO     R0,     G_015F                  ; 51DF   0240 015F
        MOVR    R7,     R5                      ; 51E1   00BD
        SUBI    #$0078, R5                      ; 51E2   033D 0078
        INCR    R7                              ; 51E4   000F

L_51E5:
        PULR    R3                              ; 51E5   02B3
L_51E6:
        MVI@    R5,     R2                      ; 51E6   02AA
        CMPI    #$03E8, R2                      ; 51E7   037A 03E8
        BNEQ    L_51F8                          ; 51E9   020C 000D

        MVI     G_015E, R2                      ; 51EB   0282 015E
        TSTR    R2                              ; 51ED   0092
        BEQ     L_522A                          ; 51EE   0204 003A

        CLRR    R2                              ; 51F0   01D2
        MVO     R2,     G_015E                  ; 51F1   0242 015E
        INCR    R2                              ; 51F3   000A
        MVO     R2,     G_015F                  ; 51F4   0242 015F
        B       L_51E6                          ; 51F6   0220 0011

L_51F8:
        SARC    R2,     2                       ; 51F8   007E
        MOVR    R2,     R4                      ; 51F9   0094
        BOV     L_5203                          ; 51FA   0202 0007

        MVI@    R5,     R3                      ; 51FC   02AB
        MOVR    R3,     R0                      ; 51FD   0098
        ANDI    #$001F, R0                      ; 51FE   03B8 001F
        SLR     R3,     2                       ; 5200   0067
        SLR     R3,     2                       ; 5201   0067
        SLR     R3,     1                       ; 5202   0063
L_5203:
        BC      L_5210                          ; 5203   0201 000B

        MVI@    R5,     R1                      ; 5205   02A9
        ADD     G_015E, R7                      ; 5206   02C7 015E

        MVII    #$0006, R2                      ; 5208   02BA 0006
        SWAP    R2,     1                       ; 520A   0042
        ADDR    R2,     R1                      ; 520B   00D1
        COMR    R2                              ; 520C   001A
        ANDR    R2,     R1                      ; 520D   0191
        INCR    R7                              ; 520E   000F

        SWAP    R1,     1                       ; 520F   0041
L_5210:
        ADDI    #$0200, R4                      ; 5210   02FC 0200
        PSHR    R3                              ; 5212   0273
L_5213:
        PSHR    R0                              ; 5213   0270
L_5214:
        MVII    #$0036, R2                      ; 5214   02BA 0036
        SWAP    R2,     1                       ; 5216   0042
        AND@    R4,     R2                      ; 5217   03A2
        DECR    R4                              ; 5218   0014
        ADD     G_015F, R7                      ; 5219   02C7 015F

        CLRR    R2                              ; 521B   01D2
        ADDR    R1,     R2                      ; 521C   00CA
        MVO@    R2,     R4                      ; 521D   0262
        DECR    R0                              ; 521E   0010
        BNEQ    L_5214                          ; 521F   022C 000C

        PULR    R0                              ; 5221   02B0
        DECR    R3                              ; 5222   0013
        BEQ     L_51E5                          ; 5223   0224 003F

        SUBR    R0,     R4                      ; 5225   0104
        ADDI    #$0014, R4                      ; 5226   02FC 0014
        B       L_5213                          ; 5228   0220 0016

L_522A:
        MVII    #$0002, R0                      ; 522A   02B8 0002
        MVII    #$0283, R4                      ; 522C   02BC 0283
        MOVR    R4,     R5                      ; 522E   00A5
L_522F:
        MVI@    R4,     R2                      ; 522F   02A2
        ADD     G_01C6, R2                      ; 5230   02C2 01C6
        MVO@    R2,     R5                      ; 5232   026A
        DECR    R0                              ; 5233   0010
        BPL     L_522F                          ; 5234   0223 0006

        SDBD                                    ; 5236   0001
        MVII    #$2000, R0                      ; 5237   02B8 0000 0020
        MVO     R0,     .BTAB.00                ; 523A   0240 0200
        MVO     R0,     .BTAB.13                ; 523C   0240 0213
        MVO     R0,     .BTAB.DC                ; 523E   0240 02DC
        MVO     R0,     .BTAB.EF                ; 5240   0240 02EF
        PULR    R7                              ; 5242   02B7

        PSHR    R5                              ; 5243   0275
        MVI     G_01C7, R4                      ; 5244   0284 01C7
        ANDI    #$0002, R4                      ; 5246   03BC 0002
        BNEQ    L_5306                          ; 5248   020C 00BC

        MVI     G_01CA, R4                      ; 524A   0284 01CA
        TSTR    R4                              ; 524C   00A4
        BNEQ    L_5306                          ; 524D   020C 00B7

        MVO     R3,     G_01C8                  ; 524F   0243 01C8
        PSHR    R0                              ; 5251   0270

        JSR     R5,     L_60C6                  ; 5252   0004 0160 00C6

        SDBD                                    ; 5255   0001
        MVII    #$8000, R1                      ; 5256   02B9 0000 0080
L_5259:
        EIS                                     ; 5259   0002
        DECR    R1                              ; 525A   0011
        BNEQ    L_5259                          ; 525B   022C 0003

        PULR    R3                              ; 525D   02B3
        MVO     R3,     G_01C9                  ; 525E   0243 01C9
        ADDI    #$01BA, R3                      ; 5260   02FB 01BA
        MVI@    R3,     R2                      ; 5262   029A
        MVO     R2,     G_017C                  ; 5263   0242 017C
        CLRR    R0                              ; 5265   01C0
        MVO     R0,     G_0170                  ; 5266   0240 0170
        MVO     R0,     G_0181                  ; 5268   0240 0181
        MVO     R0,     G_034C                  ; 526A   0240 034C
        MVO     R0,     G_01CC                  ; 526C   0240 01CC
        MVII    #$01AA, R5                      ; 526E   02BD 01AA
        MVII    #$031E, R4                      ; 5270   02BC 031E
L_5272:
        MVI@    R4,     R1                      ; 5272   02A1
        TSTR    R1                              ; 5273   0089
        BNEQ    L_527C                          ; 5274   020C 0006

        MVO@    R0,     R5                      ; 5276   0268
        MVO@    R0,     R5                      ; 5277   0268
        ADDI    #$0007, R4                      ; 5278   02FC 0007
        B       L_5284                          ; 527A   0200 0008

L_527C:
        MVI@    R4,     R1                      ; 527C   02A1
        SWAP    R1,     1                       ; 527D   0041
        MVO@    R1,     R5                      ; 527E   0269
        MVI@    R4,     R1                      ; 527F   02A1
        SWAP    R1,     1                       ; 5280   0041
        MVO@    R1,     R5                      ; 5281   0269
        ADDI    #$0005, R4                      ; 5282   02FC 0005
L_5284:
        CMPI    #$0356, R4                      ; 5284   037C 0356
        BLE     L_5272                          ; 5286   0226 0015

        MVI     G_0354, R3                      ; 5288   0283 0354
        MVII    #$003F, R0                      ; 528A   02B8 003F
        MVII    #$031D, R4                      ; 528C   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; 528E   0004 0114 0338

        MVO     R3,     G_0354                  ; 5291   0243 0354
        MVII    #$0001, R0                      ; 5293   02B8 0001
        MVO     R0,     G_01C7                  ; 5295   0240 01C7
        MVO     R0,     G_01A9                  ; 5297   0240 01A9
        MVII    #$0283, R4                      ; 5299   02BC 0283
        SDBD                                    ; 529B   0001
        MVII    #$1200, R1                      ; 529C   02B9 0000 0012
        MVO@    R1,     R4                      ; 529F   0261
        MVO@    R1,     R4                      ; 52A0   0261
        MVO@    R1,     R4                      ; 52A1   0261
        ADDI    #$003F, R4                      ; 52A2   02FC 003F
        MVO@    R1,     R4                      ; 52A4   0261
        ADDI    #$0013, R4                      ; 52A5   02FC 0013
        MVO@    R1,     R4                      ; 52A7   0261
        ADDI    #$0013, R4                      ; 52A8   02FC 0013
        MVO@    R1,     R4                      ; 52AA   0261
        SDBD                                    ; 52AB   0001
        MVII    #$5555, R0                      ; 52AC   02B8 0055 0055
        MVO     R0,     G_035D                  ; 52AF   0240 035D
        MVII    #$0017, R0                      ; 52B1   02B8 0017
        MVO     R0,     G_01CF                  ; 52B3   0240 01CF
        MVO     R0,     G_01D2                  ; 52B5   0240 01D2
        MVII    #$0008, R0                      ; 52B7   02B8 0008
        MVO     R0,     G_01D1                  ; 52B9   0240 01D1
        MVII    #$0010, R0                      ; 52BB   02B8 0010
        MVO     R0,     G_01D0                  ; 52BD   0240 01D0
        MVII    #$0080, R0                      ; 52BF   02B8 0080
        MVO     R0,     G_01E9                  ; 52C1   0240 01E9
        MVII    #$0005, R0                      ; 52C3   02B8 0005

        JSR     R5,     X_RAND1                 ; 52C5   0004 0114 027D

        ADDI    #$0048, R0                      ; 52C8   02F8 0048
        MVO     R0,     G_01EC                  ; 52CA   0240 01EC
        MVII    #$0005, R0                      ; 52CC   02B8 0005

        JSR     R5,     X_RAND1                 ; 52CE   0004 0114 027D

        ADDI    #$0040, R0                      ; 52D1   02F8 0040
        MVO     R0,     G_01EF                  ; 52D3   0240 01EF
        MVII    #$034D, R4                      ; 52D5   02BC 034D
        SDBD                                    ; 52D7   0001
        MVII    #$5141, R2                      ; 52D8   02BA 0041 0051
        SDBD                                    ; 52DB   0001
        MVII    #$18A3, R0                      ; 52DC   02B8 00A3 0018
L_52DF:
        MVO@    R0,     R4                      ; 52DF   0260
        MVO@    R2,     R4                      ; 52E0   0262
        ADDI    #$0006, R4                      ; 52E1   02FC 0006
        CMPI    #$0355, R4                      ; 52E3   037C 0355
        BEQ     L_52DF                          ; 52E5   0224 0007

        CMPI    #$0325, R4                      ; 52E7   037C 0325
        BEQ     L_52F1                          ; 52E9   0204 0006

        MVII    #$031D, R4                      ; 52EB   02BC 031D
        XORI    #$0084, R0                      ; 52ED   03F8 0084
        B       L_52DF                          ; 52EF   0220 0011

L_52F1:
        MVII    #$0002, R0                      ; 52F1   02B8 0002
        MVO     R0,     G_01CA                  ; 52F3   0240 01CA
        MVII    #$0005, R0                      ; 52F5   02B8 0005
        MVII    #$0199, R4                      ; 52F7   02BC 0199
L_52F9:
        MVO@    R0,     R4                      ; 52F9   0260
        DECR    R0                              ; 52FA   0010
        BPL     L_52F9                          ; 52FB   0223 0003

        MVII    #$0100, R4                      ; 52FD   02BC 0100
        SDBD                                    ; 52FF   0001
        MVII    #$530E, R0                      ; 5300   02B8 000E 0053
        MVO@    R0,     R4                      ; 5303   0260
        SWAP    R0,     1                       ; 5304   0040
        MVO@    R0,     R4                      ; 5305   0260
L_5306:
        PULR    R7                              ; 5306   02B7

        DECLE   $0000,  $0002,  $0001,  $0004   ; 5307   0000 0002 0001 0004
        DECLE   $0003,  $0006,  $0005           ; 530B   0003 0006 0005

        PSHR    R5                              ; 530E   0275
        MVI     G_0102, R1                      ; 530F   0281 0102
        SWAP    R1,     1                       ; 5311   0041
        SWAP    R1,     1                       ; 5312   0041
        BPL     L_5318                          ; 5313   0203 0003
        J       .EXEC.0BE                       ; 5315   0004 0310 00BE

L_5318:
        MVI     G_016E, R2                      ; 5318   0282 016E
        DECR    R2                              ; 531A   0012
        ADD     G_0181, R2                      ; 531B   02C2 0181
        BMI     L_533F                          ; 531D   020B 0020

        MVO     R2,     G_016E                  ; 531F   0242 016E
        SLR     R2,     2                       ; 5321   0066
        SLR     R2,     1                       ; 5322   0062
        MVI     G_016F, R4                      ; 5323   0284 016F
        INCR    R4                              ; 5325   000C
        SLL     R2,     1                       ; 5326   004A
        CMPR    R2,     R4                      ; 5327   0154
        BLE     L_532B                          ; 5328   0206 0001

        CLRR    R4                              ; 532A   01E4
L_532B:
        MOVR    R4,     R5                      ; 532B   00A5
        INCR    R5                              ; 532C   000D
        CMPR    R2,     R5                      ; 532D   0155
        BLE     L_5331                          ; 532E   0206 0001

        CLRR    R5                              ; 5330   01ED
L_5331:
        SDBD                                    ; 5331   0001
        MVII    #$5307, R2                      ; 5332   02BA 0007 0053
        MVO     R4,     G_016F                  ; 5335   0244 016F
        ADDR    R2,     R4                      ; 5337   00D4
        ADDR    R2,     R5                      ; 5338   00D5
        MVI@    R4,     R2                      ; 5339   02A2
        MVO     R2,     .STIC.HDLY              ; 533A   0242 0030
        MVI@    R5,     R2                      ; 533C   02AA
        MVO     R2,     .STIC.VDLY              ; 533D   0242 0031
L_533F:
        DECR    R1                              ; 533F   0011
        BMI     L_5356                          ; 5340   020B 0014

        MVO     R1,     G_0102                  ; 5342   0241 0102
        CMPI    #$0003, R1                      ; 5344   0379 0003
        BGT     L_5356                          ; 5346   020E 000E
        BEQ     L_534D                          ; 5348   0204 0003

        JSR     R5,     .EXEC.154               ; 534A   0004 0110 0154

L_534D:
        MVI     G_0114, R0                      ; 534D   0280 0114
        TSTR    R0                              ; 534F   0080
        BEQ     L_535B                          ; 5350   0204 0009

        XOR     G_0102, R0                      ; 5352   03C0 0102
        BEQ     L_5359                          ; 5354   0204 0003
L_5356:
        J       .EXEC.14E                       ; 5356   0004 0310 014E

L_5359:
        MVO     R0,     G_0114                  ; 5359   0240 0114
L_535B:
        CLRR    R0                              ; 535B   01C0
        MVO     R0,     .STIC.VIDEN             ; 535C   0240 0020
        ADD     G_0102, R0                      ; 535E   02C0 0102
        BNEQ    L_536B                          ; 5360   020C 0009

        JSR     R5,     L_53B3                  ; 5362   0004 0150 03B3

        J       .EXEC.149                       ; 5365   0004 0310 0149
L_5368:
        J       .EXEC.146                       ; 5368   0004 0310 0146

L_536B:
        MVI     G_016C, R2                      ; 536B   0282 016C
        TSTR    R2                              ; 536D   0092
        BEQ     L_5368                          ; 536E   0224 0007

        CMPI    #$0002, R0                      ; 5370   0378 0002
        BGT     L_5368                          ; 5372   022E 000B

        MOVR    R2,     R3                      ; 5374   0093
        ANDI    #$0040, R3                      ; 5375   03BB 0040
        BNEQ    L_537F                          ; 5377   020C 0006

        ADDI    #$0010, R2                      ; 5379   02FA 0010
        MVO     R2,     G_016C                  ; 537B   0242 016C
        B       L_5368                          ; 537D   0220 0016

L_537F:
        CMPI    #$0002, R0                      ; 537F   0378 0002
        BEQ     L_5399                          ; 5381   0204 0016

        MVI     G_016D, R0                      ; 5383   0280 016D
        INCR    R0                              ; 5385   0008
        ANDI    #$0003, R0                      ; 5386   03B8 0003
        MVO     R0,     G_016D                  ; 5388   0240 016D
        BNEQ    L_5399                          ; 538A   020C 000D

        SWAP    R2,     1                       ; 538C   0042
        SWAP    R2,     1                       ; 538D   0042
        BPL     L_5396                          ; 538E   0203 0006

        PSHR    R2                              ; 5390   0272

        JSR     R5,     L_539E                  ; 5391   0004 0150 039E

        PULR    R2                              ; 5394   02B2
        INCR    R2                              ; 5395   000A

L_5396:
        JSR     R5,     L_539E                  ; 5396   0004 0150 039E
L_5399:
        JSR     R5,     .EXEC.414               ; 5399   0004 0114 0014

        B       L_5356                          ; 539C   0220 0047

L_539E:
        PSHR    R5                              ; 539E   0275
        ANDI    #$0007, R2                      ; 539F   03BA 0007
        ADD     G_02F0, R2                      ; 53A1   02C2 02F0
        MVI@    R2,     R5                      ; 53A3   0295
        SDBD                                    ; 53A4   0001
        ADDI    #$3800, R5                      ; 53A5   02FD 0000 0038
        MOVR    R5,     R4                      ; 53A8   00AC
        CLRR    R0                              ; 53A9   01C0
        MVII    #$000F, R1                      ; 53AA   02B9 000F
L_53AC:
        MVI@    R4,     R2                      ; 53AC   02A2
        MVO@    R0,     R5                      ; 53AD   0268
        MOVR    R2,     R0                      ; 53AE   0090
        DECR    R1                              ; 53AF   0011
        BPL     L_53AC                          ; 53B0   0223 0005
        PULR    R7                              ; 53B2   02B7

L_53B3:
        PSHR    R5                              ; 53B3   0275
        SDBD                                    ; 53B4   0001
        MVII    #$3998, R1                      ; 53B5   02B9 0098 0039
        MVII    #$0171, R4                      ; 53B8   02BC 0171
        MVII    #$0009, R0                      ; 53BA   02B8 0009

        JSR     R5,     .EXEC.730               ; 53BC   0004 0114 0330

        MOVR    R5,     R4                      ; 53BF   00AC
        MVII    #$0007, R0                      ; 53C0   02B8 0007

        JSR     R5,     X_FILL_ZERO             ; 53C2   0004 0114 0338

L_53C5:
        PULR    R7                              ; 53C5   02B7

L_53C6:
        PSHR    R5                              ; 53C6   0275
        MVI     G_017D, R0                      ; 53C7   0280 017D
        ADDI    #$0004, R0                      ; 53C9   02F8 0004
        ANDI    #$008F, R0                      ; 53CB   03B8 008F
        MVO     R0,     G_017D                  ; 53CD   0240 017D
        ANDI    #$000C, R0                      ; 53CF   03B8 000C
        CMPI    #$0004, R0                      ; 53D1   0378 0004
        BNEQ    L_53DC                          ; 53D3   020C 0007

        MVII    #$0010, R0                      ; 53D5   02B8 0010
        SWAP    R0,     1                       ; 53D7   0040
        XOR     G_031D, R0                      ; 53D8   03C0 031D
        MVO     R0,     G_031D                  ; 53DA   0240 031D
L_53DC:
        MVI     G_0170, R0                      ; 53DC   0280 0170
        TSTR    R0                              ; 53DE   0080
        BEQ     L_53E4                          ; 53DF   0204 0003

        JSR     R5,     L_5414                  ; 53E1   0004 0154 0014
L_53E4:
        JSR     R5,     L_5BBA                  ; 53E4   0004 0158 03BA
        JSR     R5,     L_5AF8                  ; 53E7   0004 0158 02F8

        MVI     G_017A, R2                      ; 53EA   0282 017A
        ANDI    #$0001, R2                      ; 53EC   03BA 0001
        DECR    R2                              ; 53EE   0012
        AND     G_0170, R2                      ; 53EF   0382 0170
        SDBD                                    ; 53F1   0001
        MVII    #$5BA0, R4                      ; 53F2   02BC 00A0 005B
        MVII    #$0001, R1                      ; 53F5   02B9 0001
        CLRR    R5                              ; 53F7   01ED
        MVII    #$0008, R3                      ; 53F8   02BB 0008
L_53FA:
        PSHR    R1                              ; 53FA   0271
        ADDI    #$0171, R3                      ; 53FB   02FB 0171
        MVII    #$0007, R0                      ; 53FD   02B8 0007
        SUBR    R5,     R0                      ; 53FF   0128

        JSR     R5,     X_POW2                  ; 5400   0004 0114 0345

        MOVR    R0,     R5                      ; 5403   0085
        COMR    R5                              ; 5404   001D
        AND@    R3,     R5                      ; 5405   039D
        ANDR    R2,     R1                      ; 5406   0191
        BEQ     L_540A                          ; 5407   0204 0001

        ADDR    R0,     R5                      ; 5409   00C5
L_540A:
        MVO@    R5,     R3                      ; 540A   025D
        MVI@    R4,     R5                      ; 540B   02A5
        MVI@    R4,     R3                      ; 540C   02A3
        PULR    R1                              ; 540D   02B1
        SLL     R1,     1                       ; 540E   0049
        CMPI    #$0020, R1                      ; 540F   0379 0020
        BLE     L_53FA                          ; 5411   0226 0018
        PULR    R7                              ; 5413   02B7

L_5414:
        PSHR    R5                              ; 5414   0275
        MVII    #$01A0, R4                      ; 5415   02BC 01A0
        MVI@    R4,     R0                      ; 5417   02A0
        ANDI    #$0001, R0                      ; 5418   03B8 0001
        BNEQ    L_5451                          ; 541A   020C 0035

L_541C:
        INCR    R0                              ; 541C   0008
        MVI@    R4,     R1                      ; 541D   02A1
        ANDI    #$0001, R1                      ; 541E   03B9 0001
        BNEQ    L_5428                          ; 5420   020C 0006

        CMPI    #$0005, R0                      ; 5422   0378 0005
        BLT     L_541C                          ; 5424   0225 0009
        B       L_5451                          ; 5426   0200 0029

L_5428:
        MVO     R1,     G_01A0                  ; 5428   0241 01A0
        CLRR    R1                              ; 542A   01C9
        DECR    R4                              ; 542B   0014
        MVO@    R1,     R4                      ; 542C   0261
        MOVR    R0,     R4                      ; 542D   0084

        JSR     R5,     X_POW2                  ; 542E   0004 0114 0345

        INCR    R0                              ; 5431   0008
        XOR     G_0170, R0                      ; 5432   03C0 0170
        MVO     R0,     G_0170                  ; 5434   0240 0170
        ADDR    R4,     R4                      ; 5436   00E4
        SDBD                                    ; 5437   0001
        ADDI    #$5B9E, R4                      ; 5438   02FC 009E 005B
        MVI@    R4,     R2                      ; 543B   02A2
        SWAP    R2,     1                       ; 543C   0042
        MVI@    R4,     R1                      ; 543D   02A1
        SWAP    R1,     1                       ; 543E   0041
        ADD     G_034F, R2                      ; 543F   02C2 034F
        MVO     R2,     G_01E3                  ; 5441   0242 01E3
        SWAP    R2,     1                       ; 5443   0042
        MVO     R2,     G_01E4                  ; 5444   0242 01E4
        ADD     G_0350, R1                      ; 5446   02C1 0350
        MVO     R1,     G_01E6                  ; 5448   0241 01E6
        SWAP    R1,     1                       ; 544A   0041
        MVO     R1,     G_01E7                  ; 544B   0241 01E7
        MVII    #$0028, R1                      ; 544D   02B9 0028
        MVO     R1,     G_0183                  ; 544F   0241 0183

L_5451:
        JSR     R5,     L_545F                  ; 5451   0004 0154 005F

        MVI     G_0326, R0                      ; 5454   0280 0326
        TSTR    R0                              ; 5456   0080
        BNEQ    L_545E                          ; 5457   020C 0005

        INCR    R0                              ; 5459   0008
        AND     G_01A6, R0                      ; 545A   0380 01A6
        MVO     R0,     G_01A6                  ; 545C   0240 01A6
L_545E:
        PULR    R7                              ; 545E   02B7

L_545F:
        PSHR    R5                              ; 545F   0275
        MVI     G_01A6, R2                      ; 5460   0282 01A6
        SWAP    R2,     2                       ; 5462   0046
        BMI     L_54F3                          ; 5463   020B 008E

        MVI     G_017D, R3                      ; 5465   0283 017D
        ANDI    #$0001, R3                      ; 5467   03BB 0001
        BEQ     L_54F3                          ; 5469   0204 0088

        MVI     G_01D2, R3                      ; 546B   0283 01D2
        CMPI    #$0013, R3                      ; 546D   037B 0013
        BLT     L_54F4                          ; 546F   0205 0083

        CLRR    R0                              ; 5471   01C0
        MVO     R0,     G_017E                  ; 5472   0240 017E
        MVII    #$0005, R0                      ; 5474   02B8 0005
        MVI     G_01A0, R1                      ; 5476   0281 01A0
        ANDI    #$0001, R1                      ; 5478   03B9 0001
        BNEQ    L_547E                          ; 547A   020C 0002

        MVII    #$0007, R0                      ; 547C   02B8 0007
L_547E:
        CMPI    #$0017, R3                      ; 547E   037B 0017
        BNEQ    L_5483                          ; 5480   020C 0001

        DECR    R0                              ; 5482   0010
L_5483:
        MVI     G_01C6, R1                      ; 5483   0281 01C6
        SLR     R1,     1                       ; 5485   0061
        ADDR    R1,     R0                      ; 5486   00C8
        MVI     G_032C, R1                      ; 5487   0281 032C
        SLR     R1,     2                       ; 5489   0065
        SLR     R1,     2                       ; 548A   0065
        SLR     R1,     1                       ; 548B   0061
        CMPI    #$0003, R1                      ; 548C   0379 0003
        BLE     L_5492                          ; 548E   0206 0002

        MVII    #$0003, R1                      ; 5490   02B9 0003
L_5492:
        SUBR    R1,     R0                      ; 5492   0108

        JSR     R5,     X_RAND1                 ; 5493   0004 0114 027D

        TSTR    R0                              ; 5496   0080
        BNEQ    L_54F3                          ; 5497   020C 005A

        PSHR    R2                              ; 5499   0272

        JSR     R5,     L_6105                  ; 549A   0004 0160 0105

        PULR    R2                              ; 549D   02B2
        MVII    #$001E, R3                      ; 549E   02BB 001E
        MVII    #$0004, R5                      ; 54A0   02BD 0004
        PSHR    R5                              ; 54A2   0275
        XORI    #$0088, R2                      ; 54A3   03FA 0088
        MVO     R2,     G_01A6                  ; 54A5   0242 01A6
        MVII    #$0001, R2                      ; 54A7   02BA 0001
        MVO     R2,     G_01A7                  ; 54A9   0242 01A7
        MVII    #$0325, R4                      ; 54AB   02BC 0325
        MVO     R2,     G_019F                  ; 54AD   0242 019F
        SDBD                                    ; 54AF   0001
        MVII    #$1007, R2                      ; 54B0   02BA 0007 0010
        MVO@    R2,     R4                      ; 54B3   0262
        SDBD                                    ; 54B4   0001
        MVII    #$5158, R2                      ; 54B5   02BA 0058 0051
        MVO@    R2,     R4                      ; 54B8   0262
        MVII    #$0006, R0                      ; 54B9   02B8 0006

        JSR     R5,     X_RAND1                 ; 54BB   0004 0114 027D

        MOVR    R0,     R1                      ; 54BE   0081
        ANDI    #$0038, R1                      ; 54BF   03B9 0038
        MVI     G_01C6, R0                      ; 54C1   0280 01C6
        SLL     R0,     1                       ; 54C3   0048

        JSR     R5,     X_RAND2                 ; 54C4   0004 0114 029E

        NEGR    R0                              ; 54C7   0020
        ADDI    #$0007, R0                      ; 54C8   02F8 0007
        ADDR    R1,     R0                      ; 54CA   00C8
        MOVR    R0,     R1                      ; 54CB   0081
        ANDI    #$0007, R1                      ; 54CC   03B9 0007
        MVII    #$0018, R2                      ; 54CE   02BA 0018
        CMPI    #$0006, R1                      ; 54D0   0379 0006
        BLT     L_54D6                          ; 54D2   0205 0002

        MVII    #$0020, R2                      ; 54D4   02BA 0020
L_54D6:
        MVII    #$0001, R1                      ; 54D6   02B9 0001
        CMPI    #$001F, R0                      ; 54D8   0378 001F
        BEQ     L_54DF                          ; 54DA   0204 0003

        CLRR    R1                              ; 54DC   01C9
        SUBI    #$0008, R2                      ; 54DD   033A 0008
L_54DF:
        MVO     R2,     G_016E                  ; 54DF   0242 016E
        MVO     R1,     G_0181                  ; 54E1   0241 0181
        MOVR    R0,     R1                      ; 54E3   0081
        ANDI    #$0038, R1                      ; 54E4   03B9 0038
        XORR    R1,     R0                      ; 54E6   01C8
        ADDI    #$003C, R1                      ; 54E7   02F9 003C
        SWAP    R1,     1                       ; 54E9   0041
        MVO@    R1,     R4                      ; 54EA   0261
        ADDR    R3,     R0                      ; 54EB   00D8
        SWAP    R0,     1                       ; 54EC   0040
        MVO@    R0,     R4                      ; 54ED   0260
        INCR    R4                              ; 54EE   000C
        PULR    R0                              ; 54EF   02B0
        MVO@    R0,     R4                      ; 54F0   0260
        SLR     R0,     2                       ; 54F1   0064
        MVO@    R0,     R4                      ; 54F2   0260
L_54F3:
        PULR    R7                              ; 54F3   02B7

L_54F4:
        MVI     G_01A0, R3                      ; 54F4   0283 01A0
        ANDI    #$0001, R3                      ; 54F6   03BB 0001
        BEQ     L_54F3                          ; 54F8   0224 0006

        MVII    #$0003, R0                      ; 54FA   02B8 0003

        JSR     R5,     X_RAND1                 ; 54FC   0004 0114 027D

        TSTR    R0                              ; 54FF   0080
        BNEQ    L_54F3                          ; 5500   022C 000E

        MVII    #$0184, R5                      ; 5502   02BD 0184
        SDBD                                    ; 5504   0001
        MVI@    R5,     R3                      ; 5505   02AB
        SDBD                                    ; 5506   0001
        CMPI    #$1200, R3                      ; 5507   037B 0000 0012
        BGT     L_54F3                          ; 550A   022E 0018

        XORI    #$0084, R2                      ; 550C   03FA 0084
        MVII    #$0001, R1                      ; 550E   02B9 0001
        CLRR    R0                              ; 5510   01C0
        CMPI    #$0300, R3                      ; 5511   037B 0300
        BGT     L_5516                          ; 5513   020E 0001

        INCR    R0                              ; 5515   0008
L_5516:
        CMPI    #$00C0, R3                      ; 5516   037B 00C0
        BGT     L_5521                          ; 5518   020E 0007

        SDBD                                    ; 551A   0001
        ADDI    #$2000, R1                      ; 551B   02F9 0000 0020
        ADDI    #$0002, R2                      ; 551E   02FA 0002
        INCR    R0                              ; 5520   0008
L_5521:
        MVO     R2,     G_01A6                  ; 5521   0242 01A6
        PSHR    R1                              ; 5523   0271

        JSR     R5,     L_6112                  ; 5524   0004 0160 0112

        PULR    R1                              ; 5527   02B1
        MVII    #$0001, R2                      ; 5528   02BA 0001
        MVO     R2,     G_01A7                  ; 552A   0242 01A7
        MVO     R2,     G_019F                  ; 552C   0242 019F
        MVII    #$0325, R4                      ; 552E   02BC 0325
        MVO@    R1,     R4                      ; 5530   0261
        SDBD                                    ; 5531   0001
        MVII    #$5158, R2                      ; 5532   02BA 0058 0051
        MVO@    R2,     R4                      ; 5535   0262
        MVII    #$0030, R2                      ; 5536   02BA 0030
        MVO@    R2,     R4                      ; 5538   0262
        MVII    #$0002, R0                      ; 5539   02B8 0002

        JSR     R5,     X_RAND1                 ; 553B   0004 0114 027D

        SLL     R0,     2                       ; 553E   004C
        INCR    R0                              ; 553F   0008
        PSHR    R0                              ; 5540   0270
        MVI     G_01C6, R0                      ; 5541   0280 01C6

        JSR     R5,     X_RAND2                 ; 5543   0004 0114 029E

        ADD@    R6,     R0                      ; 5546   02F0
        ADD     G_01D2, R0                      ; 5547   02C0 01D2
        SWAP    R0,     1                       ; 5549   0040
        MVO@    R0,     R4                      ; 554A   0260
        MVII    #$0060, R2                      ; 554B   02BA 0060
        MVO@    R2,     R4                      ; 554D   0262
        MVII    #$0006, R2                      ; 554E   02BA 0006
        MVO@    R2,     R4                      ; 5550   0262
        MVII    #$0002, R2                      ; 5551   02BA 0002
        MVO@    R2,     R4                      ; 5553   0262
        PULR    R7                              ; 5554   02B7

        MOVR    R3,     R4                      ; 5555   009C
        RLC     R1,     2                       ; 5556   0055
        SLR     R1,     2                       ; 5557   0065
        RLC     R1,     2                       ; 5558   0055
        MOVR    R7,     R1                      ; 5559   00B9
        RLC     R1,     2                       ; 555A   0055
        ADDR    R7,     R0                      ; 555B   00F8
        RLC     R1,     2                       ; 555C   0055
        ADDR    R7,     R0                      ; 555D   00F8
        RLC     R1,     2                       ; 555E   0055
        NEGR    R0                              ; 555F   0020
        COMR    R0                              ; 5560   0018
        COMR    R0                              ; 5561   0018
        MVO@    R4,     R5                      ; 5562   026C
        PSHR    R2                              ; 5563   0272
        MVO@    R7,     R4                      ; 5564   0267
        PSHR    R5                              ; 5565   0275
        TSTR    R0                              ; 5566   0080
        BEQ     L_5575                          ; 5567   0204 000C

        CMPI    #$0006, R0                      ; 5569   0378 0006
        BLT     L_558D                          ; 556B   0205 0020
        BEQ     L_5592                          ; 556D   0204 0023

        CMPI    #$0009, R0                      ; 556F   0378 0009
        BEQ     L_5576                          ; 5571   0204 0003
        BLT     L_557D                          ; 5573   0205 0008
L_5575:
        PULR    R7                              ; 5575   02B7

L_5576:
        MVI     G_017A, R1                      ; 5576   0281 017A
        XORI    #$0001, R1                      ; 5578   03F9 0001
        MVO     R1,     G_017A                  ; 557A   0241 017A
        PULR    R7                              ; 557C   02B7

L_557D:
        SUBI    #$0007, R0                      ; 557D   0338 0007
        SLL     R0,     1                       ; 557F   0048
        DECR    R0                              ; 5580   0010
        SLL     R0,     2                       ; 5581   004C
        ADD     G_01CF, R0                      ; 5582   02C0 01CF
        BMI     L_558C                          ; 5584   020B 0006

        CMPI    #$0018, R0                      ; 5586   0378 0018
        BGT     L_558C                          ; 5588   020E 0002

        MVO     R0,     G_01CF                  ; 558A   0240 01CF
L_558C:
        PULR    R7                              ; 558C   02B7

L_558D:
        DECR    R0                              ; 558D   0010
        SLL     R0,     2                       ; 558E   004C
        MVO     R0,     G_01CC                  ; 558F   0240 01CC
        PULR    R7                              ; 5591   02B7

L_5592:
        MVI     G_01A9, R0                      ; 5592   0280 01A9
        TSTR    R0                              ; 5594   0080
        BEQ     L_558C                          ; 5595   0224 000A

        MVII    #$0019, R0                      ; 5597   02B8 0019
        J       L_633A                          ; 5599   0004 0360 033A

        MVII    #$00C0, R2                      ; 559C   02BA 00C0
        ADDI    #$011F, R1                      ; 559E   02F9 011F
        MVO@    R2,     R1                      ; 55A0   024A
L_55A1:
        NEGR    R0                              ; 55A1   0020
        ADDI    #$000C, R0                      ; 55A2   02F8 000C
        ANDI    #$000F, R0                      ; 55A4   03B8 000F
        BEQ     L_55B4                          ; 55A6   0204 000C

        CMPI    #$0008, R0                      ; 55A8   0378 0008
        BEQ     L_55B1                          ; 55AA   0204 0005
        BLT     L_55B0                          ; 55AC   0205 0002

        INCR    R0                              ; 55AE   0008
        INCR    R7                              ; 55AF   000F

L_55B0:
        DECR    R0                              ; 55B0   0010
L_55B1:
        SLL     R0,     1                       ; 55B1   0048
        MVO     R0,     G_01CD                  ; 55B2   0240 01CD
L_55B4:
        MVII    #$0003, R0                      ; 55B4   02B8 0003
        MVO     R0,     G_0323                  ; 55B6   0240 0323
        MOVR    R5,     R7                      ; 55B8   00AF

        MVII    #$0004, R0                      ; 55B9   02B8 0004
        MVO     R0,     G_034C                  ; 55BB   0240 034C
L_55BD:
        PSHR    R5                              ; 55BD   0275
        MVI     G_01D2, R1                      ; 55BE   0281 01D2
        CMPI    #$0013, R1                      ; 55C0   0379 0013
        BLT     L_55F7                          ; 55C2   0205 0033

        MVI     G_01A6, R3                      ; 55C4   0283 01A6
        SWAP    R3,     2                       ; 55C6   0047
        BMI     L_55F7                          ; 55C7   020B 002E

        MOVR    R3,     R1                      ; 55C9   0099
        ANDI    #$0001, R1                      ; 55CA   03B9 0001
        SLL     R1,     2                       ; 55CC   004D
        SLL     R1,     1                       ; 55CD   0049
        ADDI    #$0353, R1                      ; 55CE   02F9 0353
        MVI@    R1,     R2                      ; 55D0   028A
        TSTR    R2                              ; 55D1   0092
        BNEQ    L_55F7                          ; 55D2   020C 0023

        XORI    #$0081, R3                      ; 55D4   03FB 0081
        MVO     R3,     G_01A6                  ; 55D6   0243 01A6
        MVII    #$001A, R0                      ; 55D8   02B8 001A
        MVO     R0,     G_032B                  ; 55DA   0240 032B
        MVO     R0,     G_0325                  ; 55DC   0240 0325
        SDBD                                    ; 55DE   0001
        MVII    #$5151, R0                      ; 55DF   02B8 0051 0051
        MVO     R0,     G_0326                  ; 55E2   0240 0326
        MVII    #$0003, R0                      ; 55E4   02B8 0003
        MVO     R0,     G_032A                  ; 55E6   0240 032A
        MVII    #$0080, R0                      ; 55E8   02B8 0080
        MVO@    R0,     R1                      ; 55EA   0248
        MVII    #$01E9, R4                      ; 55EB   02BC 01E9
        MVII    #$01D3, R1                      ; 55ED   02B9 01D3
        MVII    #$0007, R0                      ; 55EF   02B8 0007

        JSR     R5,     .EXEC.730               ; 55F1   0004 0114 0330
        JSR     R5,     L_60E7                  ; 55F4   0004 0160 00E7

L_55F7:
        PULR    R7                              ; 55F7   02B7

        CLRR    R0                              ; 55F8   01C0
L_55F9:
        MVI     G_01CC, R2                      ; 55F9   0282 01CC
        ADDR    R0,     R7                      ; 55FB   00C7

        NEGR    R2                              ; 55FC   0022
        SAR     R2,     1                       ; 55FD   006A
        ADDI    #$0008, R2                      ; 55FE   02FA 0008
        MVO     R2,     G_01CE                  ; 5600   0242 01CE
        MOVR    R5,     R7                      ; 5602   00AF

L_5603:
        PSHR    R5                              ; 5603   0275

        JSR     R5,     .EXEC.4F1               ; 5604   0004 0114 00F1

        MVI     G_01C7, R0                      ; 5607   0280 01C7
        DECR    R0                              ; 5609   0010
        BNEQ    L_565C                          ; 560A   020C 0050

        MVI     G_034C, R0                      ; 560C   0280 034C
        DECR    R0                              ; 560E   0010
        BMI     L_5616                          ; 560F   020B 0005

        MVO     R0,     G_034C                  ; 5611   0240 034C

        JSR     R5,     L_55BD                  ; 5613   0004 0154 01BD

L_5616:
        MVI     G_016C, R0                      ; 5616   0280 016C
        TSTR    R0                              ; 5618   0080
        BNEQ    L_561E                          ; 5619   020C 0003

        JSR     R5,     L_565D                  ; 561B   0004 0154 025D

L_561E:
        MVI     G_017A, R2                      ; 561E   0282 017A
        ANDI    #$000F, R2                      ; 5620   03BA 000F
        MVI     G_01D1, R0                      ; 5622   0280 01D1
        SUBI    #$0008, R0                      ; 5624   0338 0008
        BPL     L_5629                          ; 5626   0203 0001

        NEGR    R0                              ; 5628   0020
L_5629:
        BNEQ    L_562D                          ; 5629   020C 0002

        ADDI    #$0030, R2                      ; 562B   02FA 0030
L_562D:
        MVO     R2,     G_017A                  ; 562D   0242 017A
        MVI     G_0146, R3                      ; 562F   0283 0146
        CMPI    #$0071, R3                      ; 5631   037B 0071
        BNEQ    L_563D                          ; 5633   020C 0008

        MVO     R2,     .PSG0.chan_enable       ; 5635   0242 01F8
        MVII    #$001F, R1                      ; 5637   02B9 001F
        SUBR    R0,     R1                      ; 5639   0101
        SLL     R1,     2                       ; 563A   004D
        MVO     R1,     G_0155                  ; 563B   0241 0155
L_563D:
        MVII    #$0002, R0                      ; 563D   02B8 0002

        JSR     R5,     L_55F9                  ; 563F   0004 0154 01F9

        MVI     G_0323, R1                      ; 5642   0281 0323
        TSTR    R1                              ; 5644   0089
        BNEQ    L_564B                          ; 5645   020C 0004

        SLL     R0,     1                       ; 5647   0048

        JSR     R5,     L_55A1                  ; 5648   0004 0154 01A1
L_564B:
        JSR     R5,     L_568C                  ; 564B   0004 0154 028C
        JSR     R5,     L_56F0                  ; 564E   0004 0154 02F0

        MVII    #$01D0, R1                      ; 5651   02B9 01D0
L_5653:
        MVI@    R1,     R0                      ; 5653   0288

        JSR     R5,     L_56CD                  ; 5654   0004 0154 02CD

        INCR    R1                              ; 5657   0009
        CMPI    #$01D2, R1                      ; 5658   0379 01D2
        BLE     L_5653                          ; 565A   0226 0008
L_565C:
        PULR    R7                              ; 565C   02B7

L_565D:
        PSHR    R5                              ; 565D   0275
        MVII    #$01CD, R4                      ; 565E   02BC 01CD
L_5660:
        MOVR    R4,     R2                      ; 5660   00A2
        ADDI    #$0003, R2                      ; 5661   02FA 0003
        MVI@    R2,     R0                      ; 5663   0290
        SUB@    R4,     R0                      ; 5664   0320
        BEQ     L_5687                          ; 5665   0204 0020

        MVII    #$0002, R0                      ; 5667   02B8 0002
        BMI     L_566C                          ; 5669   020B 0001

        NEGR    R0                              ; 566B   0020
L_566C:
        ADD@    R2,     R0                      ; 566C   02D0
        BMI     L_5687                          ; 566D   020B 0018

        MOVR    R4,     R1                      ; 566F   00A1
        ADDR    R7,     R1                      ; 5670   00F9
        SUBI    #$02E0, R1                      ; 5671   0339 02E0
        CMP@    R1,     R0                      ; 5673   0348
        BGE     L_5687                          ; 5674   020D 0011

        CMPI    #$01D0, R4                      ; 5676   037C 01D0
        BNEQ    L_5686                          ; 5678   020C 000C

        CMPI    #$0011, R0                      ; 567A   0378 0011
        BNEQ    L_5686                          ; 567C   020C 0008

        MVI     G_0325, R1                      ; 567E   0281 0325
        SDBD                                    ; 5680   0001
        XORI    #$1000, R1                      ; 5681   03F9 0000 0010
        MVO     R1,     G_0325                  ; 5684   0241 0325
L_5686:
        MVO@    R0,     R2                      ; 5686   0250
L_5687:
        CMPI    #$01D0, R4                      ; 5687   037C 01D0
        BNEQ    L_5660                          ; 5689   022C 002A
        PULR    R7                              ; 568B   02B7

L_568C:
        PSHR    R5                              ; 568C   0275
        MVII    #$0262, R3                      ; 568D   02BB 0262
        MVII    #$0008, R0                      ; 568F   02B8 0008
L_5691:
        SDBD                                    ; 5691   0001
        MVII    #$184D, R2                      ; 5692   02BA 004D 0018
        MOVR    R0,     R1                      ; 5695   0081
        ADDI    #$0353, R1                      ; 5696   02F9 0353
        MVI@    R1,     R1                      ; 5698   0289
        TSTR    R1                              ; 5699   0089
        BEQ     L_569E                          ; 569A   0204 0002

        SUBI    #$0003, R2                      ; 569C   033A 0003
L_569E:
        MVO@    R2,     R3                      ; 569E   025A
        DECR    R3                              ; 569F   0013
        SUBI    #$0008, R0                      ; 56A0   0338 0008
        BEQ     L_5691                          ; 56A2   0224 0012

        MVII    #$0032, R3                      ; 56A4   02BB 0032
        SWAP    R3,     1                       ; 56A6   0043
        MVII    #$0002, R1                      ; 56A7   02B9 0002
        MVII    #$020F, R4                      ; 56A9   02BC 020F
        MVI     G_01D2, R0                      ; 56AB   0280 01D2
        CMPI    #$0017, R0                      ; 56AD   0378 0017
        BLT     L_56B5                          ; 56AF   0205 0004

        SDBD                                    ; 56B1   0001
        MVII    #$1200, R3                      ; 56B2   02BB 0000 0012
L_56B5:
        CMPI    #$0013, R0                      ; 56B5   0378 0013
        BGE     L_56BB                          ; 56B7   020D 0002

L_56B9:
        MVII    #$0200, R3                      ; 56B9   02BB 0200
L_56BB:
        MVII    #$000A, R2                      ; 56BB   02BA 000A
        ADDR    R2,     R4                      ; 56BD   00D4
        MOVR    R4,     R5                      ; 56BE   00A5
L_56BF:
        MVI@    R4,     R0                      ; 56BF   02A0
        SDBD                                    ; 56C0   0001
        ANDI    #$C9FF, R0                      ; 56C1   03B8 00FF 00C9
        ADDR    R3,     R0                      ; 56C4   00D8
        MVO@    R0,     R5                      ; 56C5   0268
        DECR    R2                              ; 56C6   0012
        BNEQ    L_56BF                          ; 56C7   022C 0009

        DECR    R1                              ; 56C9   0011
        BNEQ    L_56B9                          ; 56CA   022C 0012
        PULR    R7                              ; 56CC   02B7

L_56CD:
        PSHR    R5                              ; 56CD   0275
        MOVR    R7,     R4                      ; 56CE   00BC
        SUBI    #$0340, R4                      ; 56CF   033C 0340
        ADDR    R1,     R4                      ; 56D1   00CC
        MVI@    R4,     R2                      ; 56D2   02A2
        MOVR    R0,     R3                      ; 56D3   0083
        SLR     R3,     2                       ; 56D4   0067
        SLR     R3,     1                       ; 56D5   0063
        INCR    R3                              ; 56D6   000B
        ANDI    #$0007, R0                      ; 56D7   03B8 0007
        INCR    R0                              ; 56D9   0008
        SLL     R0,     2                       ; 56DA   004C
        SLL     R0,     1                       ; 56DB   0048
        ADDI    #$0002, R4                      ; 56DC   02FC 0002
        MVI@    R4,     R4                      ; 56DE   02A4
L_56DF:
        MVII    #$01F8, R5                      ; 56DF   02BD 01F8
        COMR    R5                              ; 56E1   001D
        AND@    R4,     R5                      ; 56E2   03A5
        DECR    R4                              ; 56E3   0014
        ADDI    #$0068, R5                      ; 56E4   02FD 0068
        DECR    R3                              ; 56E6   0013
        BNEQ    L_56EA                          ; 56E7   020C 0001

        ADDR    R0,     R5                      ; 56E9   00C5
L_56EA:
        MVO@    R5,     R4                      ; 56EA   0265
        SUBI    #$0008, R2                      ; 56EB   033A 0008
        BNEQ    L_56DF                          ; 56ED   022C 000F
        PULR    R7                              ; 56EF   02B7

L_56F0:
        PSHR    R5                              ; 56F0   0275
        MVII    #$000F, R3                      ; 56F1   02BB 000F
L_56F3:
        MVI     G_01E9, R1                      ; 56F3   0281 01E9
        SAR     R1,     1                       ; 56F5   0069
        SUBI    #$0008, R1                      ; 56F6   0339 0008
        ADDR    R3,     R1                      ; 56F8   00D9
        MOVR    R3,     R2                      ; 56F9   009A
        MOVR    R1,     R0                      ; 56FA   0088
        ANDI    #$001F, R1                      ; 56FB   03B9 001F
        BEQ     L_5711                          ; 56FD   0204 0012

        CMPI    #$0011, R1                      ; 56FF   0379 0011
        BEQ     L_570D                          ; 5701   0204 000A

        CMPI    #$000F, R1                      ; 5703   0379 000F
        BNEQ    L_5721                          ; 5705   020C 001A

        ADDI    #$0020, R0                      ; 5707   02F8 0020
        ANDI    #$0040, R0                      ; 5709   03B8 0040
        B       L_5711                          ; 570B   0200 0004

L_570D:
        ANDI    #$0040, R0                      ; 570D   03B8 0040
        ADDI    #$0020, R0                      ; 570F   02F8 0020
L_5711:
        MOVR    R3,     R1                      ; 5711   0099
        SLL     R0,     2                       ; 5712   004C
        SLL     R0,     1                       ; 5713   0048
        SWAP    R0,     1                       ; 5714   0040
        ANDI    #$0003, R0                      ; 5715   03B8 0003
        SARC    R1,     1                       ; 5717   0079
        RLC     R0,     1                       ; 5718   0050
        ADDI    #$0101, R0                      ; 5719   02F8 0101
        SLL     R0,     2                       ; 571B   004C
        SLL     R0,     1                       ; 571C   0048
        ANDI    #$00FE, R2                      ; 571D   03BA 00FE
        DECR    R3                              ; 571F   0013
        INCR    R7                              ; 5720   000F

L_5721:
        CLRR    R0                              ; 5721   01C0
L_5722:
        MVII    #$0036, R1                      ; 5722   02B9 0036
        SWAP    R1,     1                       ; 5724   0041
        AND     .BTAB.1A,R1                     ; 5725   0381 021A
        ADDR    R1,     R0                      ; 5727   00C8
        SARC    R2,     1                       ; 5728   007A
        BC      L_572F                          ; 5729   0201 0004

        NEGR    R2                              ; 572B   0022
        ADDI    #$0221, R2                      ; 572C   02FA 0221
        MVO@    R0,     R2                      ; 572E   0250
L_572F:
        DECR    R3                              ; 572F   0013
        BPL     L_56F3                          ; 5730   0223 003E
        PULR    R7                              ; 5732   02B7

L_5733:
        PSHR    R5                              ; 5733   0275
        CLRR    R2                              ; 5734   01D2
        MVII    #$0168, R4                      ; 5735   02BC 0168
        MVII    #$0132, R5                      ; 5737   02BD 0132
        MVII    #$0003, R0                      ; 5739   02B8 0003
L_573B:
        MVI@    R4,     R1                      ; 573B   02A1
        MVO@    R1,     R5                      ; 573C   0269
        DECR    R4                              ; 573D   0014
        MVO@    R2,     R4                      ; 573E   0262
        DECR    R0                              ; 573F   0010
        BPL     L_573B                          ; 5740   0223 0006

        JSR     R5,     L_57BF                  ; 5742   0004 0154 03BF
        JSR     R5,     L_5851                  ; 5745   0004 0158 0051

        CLRR    R2                              ; 5748   01D2
        MVO     R2,     G_0161                  ; 5749   0242 0161
        MVI     G_01A6, R4                      ; 574B   0284 01A6
        ANDI    #$000E, R4                      ; 574D   03BC 000E
        BNEQ    L_5753                          ; 574F   020C 0002

        MVO     R2,     G_019F                  ; 5751   0242 019F
L_5753:
        MVII    #$0004, R2                      ; 5753   02BA 0004
        MVO     R2,     G_0167                  ; 5755   0242 0167
        MVII    #$0006, R2                      ; 5757   02BA 0006
        MVII    #$0199, R4                      ; 5759   02BC 0199
L_575B:
        PSHR    R4                              ; 575B   0274
        MVO     R2,     G_015E                  ; 575C   0242 015E

        JSR     R5,     L_5775                  ; 575E   0004 0154 0375

        BNC     L_576B                          ; 5761   0209 0008

        MVI     G_0167, R0                      ; 5763   0280 0167
        TSTR    R0                              ; 5765   0080
        BEQ     L_576B                          ; 5766   0204 0003

        JSR     R5,     L_5875                  ; 5768   0004 0158 0075

L_576B:
        PULR    R4                              ; 576B   02B4
        MVI@    R4,     R2                      ; 576C   02A2
        CMPI    #$019F, R4                      ; 576D   037C 019F
        BLE     L_575B                          ; 576F   0226 0015

        JSR     R5,     L_57AA                  ; 5771   0004 0154 03AA

        PULR    R7                              ; 5774   02B7

L_5775:
        PSHR    R5                              ; 5775   0275
        DECLE   $02BD,  $0192,  $00D5,  $02A8   ; 5776   02BD 0192 00D5 02A8
        DECLE   $0378,  $0070,  $020E,  $0016   ; 577A   0378 0070 020E 0016
        DECLE   $00D5,  $033D,  $000F,  $0001   ; 577E   00D5 033D 000F 0001

        MVI@    R5,     R1                      ; 5782   02A9
        CMPI    #$0006, R2                      ; 5783   037A 0006
        BEQ     L_5796                          ; 5785   0204 000F

        CMPI    #$0080, R1                      ; 5787   0379 0080
        BLE     L_5794                          ; 5789   0206 0009

        MOVR    R0,     R3                      ; 578B   0083
        MOVR    R2,     R0                      ; 578C   0090

        JSR     R5,     X_POW2                  ; 578D   0004 0114 0345

        AND     G_0170, R0                      ; 5790   0380 0170
        BNEQ    L_579E                          ; 5792   020C 000A

L_5794:
        CLRC                                    ; 5794   0006
        PULR    R7                              ; 5795   02B7

L_5796:
        JSR     R5,     X_CLAMP                 ; 5796   0004 0114 0270

        INCR    R4                              ; 5799   000C
        SLR     R0,     2                       ; 579A   0064
        MOVR    R0,     R3                      ; 579B   0083
        SUBI    #$0002, R3                      ; 579C   033B 0002
L_579E:
        SDBD                                    ; 579E   0001
        CMPI    #$2400, R1                      ; 579F   0379 0000 0024
        BC      L_5794                          ; 57A2   0221 000F

        MVO     R1,     G_0344                  ; 57A4   0241 0344
        MVO     R3,     G_015F                  ; 57A6   0243 015F
        SETC                                    ; 57A8   0007
        PULR    R7                              ; 57A9   02B7

L_57AA:
        MVI     G_0161, R1                      ; 57AA   0281 0161
        ADDI    #$0326, R1                      ; 57AC   02F9 0326
        CLRR    R0                              ; 57AE   01C0
L_57AF:
        ADDI    #$0008, R1                      ; 57AF   02F9 0008
        CMPI    #$0346, R1                      ; 57B1   0379 0346
        BGT     L_57B8                          ; 57B3   020E 0003

        MVO@    R0,     R1                      ; 57B5   0248
        B       L_57AF                          ; 57B6   0220 0008

L_57B8:
        CMP     G_019F, R0                      ; 57B8   0340 019F
        BNEQ    L_57BE                          ; 57BA   020C 0002

        MVO     R0,     G_0326                  ; 57BC   0240 0326
L_57BE:
        MOVR    R5,     R7                      ; 57BE   00AF

L_57BF:
        PSHR    R5                              ; 57BF   0275
        MVII    #$01D5, R5                      ; 57C0   02BD 01D5
        SDBD                                    ; 57C2   0001
        MVI@    R5,     R2                      ; 57C3   02AA
        INCR    R5                              ; 57C4   000D
        SDBD                                    ; 57C5   0001
        MVI@    R5,     R1                      ; 57C6   02A9
        MVII    #$0006, R4                      ; 57C7   02BC 0006
        MVO     R4,     G_015E                  ; 57C9   0244 015E
        B       L_57E1                          ; 57CB   0200 0014

L_57CD:
        MVI     G_0357, R2                      ; 57CD   0282 0357
        MVI     G_0358, R1                      ; 57CF   0281 0358
        BEQ     L_57E1                          ; 57D1   0204 000E

        MOVR    R4,     R5                      ; 57D3   00A5
        ADDR    R4,     R5                      ; 57D4   00E5
        SDBD                                    ; 57D5   0001
        ADDI    #$5B9E, R5                      ; 57D6   02FD 009E 005B
        MVI@    R5,     R2                      ; 57D9   02AA
        MVI@    R5,     R1                      ; 57DA   02A9
        SWAP    R1,     1                       ; 57DB   0041
        SWAP    R2,     1                       ; 57DC   0042
        ADD     G_034F, R2                      ; 57DD   02C2 034F
        ADD     G_0350, R1                      ; 57DF   02C1 0350
L_57E1:
        MVII    #$0025, R0                      ; 57E1   02B8 0025
        SWAP    R0,     1                       ; 57E3   0040
        MVO     R0,     G_0344                  ; 57E4   0240 0344

        JSR     R5,     L_57FF                  ; 57E6   0004 0154 03FF

        MVI     G_015E, R4                      ; 57E9   0284 015E
        MOVR    R4,     R5                      ; 57EB   00A5
        ADDI    #$0192, R5                      ; 57EC   02FD 0192
        MVI     G_015F, R3                      ; 57EE   0283 015F
        MVO@    R3,     R5                      ; 57F0   026B
        ADDR    R4,     R5                      ; 57F1   00E5
        SUBI    #$000F, R5                      ; 57F2   033D 000F
        MVI     G_0344, R3                      ; 57F4   0283 0344
        MVO@    R3,     R5                      ; 57F6   026B
        SWAP    R3,     1                       ; 57F7   0043
        MVO@    R3,     R5                      ; 57F8   026B
        DECR    R4                              ; 57F9   0014
        MVO     R4,     G_015E                  ; 57FA   0244 015E
        BPL     L_57CD                          ; 57FC   0223 0030
        PULR    R7                              ; 57FE   02B7

L_57FF:
        PSHR    R5                              ; 57FF   0275
        MVII    #$01EB, R5                      ; 5800   02BD 01EB
        SDBD                                    ; 5802   0001
        SUB@    R5,     R2                      ; 5803   032A
        INCR    R5                              ; 5804   000D
        SDBD                                    ; 5805   0001
        SUB@    R5,     R1                      ; 5806   0329

        JSR     R5,     L_602F                  ; 5807   0004 0160 002F

        MOVR    R1,     R0                      ; 580A   0088
        ADDR    R2,     R0                      ; 580B   00D0
        SLR     R0,     2                       ; 580C   0064
        CMPI    #$02D4, R0                      ; 580D   0378 02D4
        BGE     L_5850                          ; 580F   020D 003F

        MOVR    R2,     R5                      ; 5811   0095
        SAR     R2,     2                       ; 5812   006E
        SAR     R2,     2                       ; 5813   006E
        PSHR    R2                              ; 5814   0272
        MOVR    R5,     R2                      ; 5815   00AA
        MOVR    R1,     R4                      ; 5816   008C
        SAR     R1,     2                       ; 5817   006D
        SAR     R1,     2                       ; 5818   006D
        PSHR    R1                              ; 5819   0271
        MOVR    R4,     R1                      ; 581A   00A1
L_581B:
        CMPI    #$0080, R1                      ; 581B   0379 0080
        BGT     L_5823                          ; 581D   020E 0004

        CMPI    #$0080, R2                      ; 581F   037A 0080
        BLE     L_5827                          ; 5821   0206 0004

L_5823:
        SAR     R1,     1                       ; 5823   0069
        SAR     R2,     1                       ; 5824   006A
        B       L_581B                          ; 5825   0220 000B

L_5827:
        MVII    #$01E8, R5                      ; 5827   02BD 01E8
        SAR     R3,     1                       ; 5829   006B
        SWAP    R3,     1                       ; 582A   0043
        SDBD                                    ; 582B   0001
        SUB@    R5,     R3                      ; 582C   032B
        SAR     R3,     2                       ; 582D   006F
        SAR     R3,     2                       ; 582E   006F
        SAR     R3,     2                       ; 582F   006F
        SAR     R3,     1                       ; 5830   006B

        JSR     R5,     L_6059                  ; 5831   0004 0160 0059

        NEGR    R3                              ; 5834   0023
        ADDI    #$0038, R3                      ; 5835   02FB 0038
        MVII    #$0100, R1                      ; 5837   02B9 0100
        ANDR    R3,     R1                      ; 5839   0199
        BEQ     L_583E                          ; 583A   0204 0002

        MVII    #$00FF, R3                      ; 583C   02BB 00FF
L_583E:
        PULR    R0                              ; 583E   02B0

        JSR     R5,     X_SQUARE                ; 583F   0004 011C 01DB

        PULR    R0                              ; 5842   02B0
        PSHR    R2                              ; 5843   0272

        JSR     R5,     X_SQUARE                ; 5844   0004 011C 01DB

        ADD@    R6,     R2                      ; 5847   02F2
        CMP     G_0344, R2                      ; 5848   0342 0344
        BC      L_5850                          ; 584A   0201 0004

        MVO     R2,     G_0344                  ; 584C   0242 0344
        MVO     R3,     G_015F                  ; 584E   0243 015F
L_5850:
        PULR    R7                              ; 5850   02B7

L_5851:
        PSHR    R5                              ; 5851   0275
        MVII    #$0004, R1                      ; 5852   02B9 0004
L_5854:
        MVII    #$0199, R4                      ; 5854   02BC 0199
L_5856:
        MVI@    R4,     R2                      ; 5856   02A2
        MOVR    R2,     R5                      ; 5857   0095
        ADDR    R5,     R5                      ; 5858   00ED
        ADDI    #$0184, R5                      ; 5859   02FD 0184
        SDBD                                    ; 585B   0001
        MVI@    R5,     R0                      ; 585C   02A8
        MVI@    R4,     R3                      ; 585D   02A3
        MOVR    R3,     R5                      ; 585E   009D
        ADDR    R5,     R5                      ; 585F   00ED
        ADDI    #$0184, R5                      ; 5860   02FD 0184
        SDBD                                    ; 5862   0001
        CMP@    R5,     R0                      ; 5863   0368
        BNC     L_586A                          ; 5864   0209 0004

        SUBI    #$0002, R4                      ; 5866   033C 0002
        MVO@    R3,     R4                      ; 5868   0263
        MVO@    R2,     R4                      ; 5869   0262
L_586A:
        DECR    R4                              ; 586A   0014
        MVII    #$019A, R2                      ; 586B   02BA 019A
        ADDR    R1,     R2                      ; 586D   00CA
        CMPR    R2,     R4                      ; 586E   0154
        BNEQ    L_5856                          ; 586F   022C 001A

        DECR    R1                              ; 5871   0011
        BPL     L_5854                          ; 5872   0223 001F
        PULR    R7                              ; 5874   02B7

L_5875:
        PSHR    R5                              ; 5875   0275
        MVI     G_015E, R0                      ; 5876   0280 015E
        CMPI    #$0006, R0                      ; 5878   0378 0006
        BEQ     L_5881                          ; 587A   0204 0005

        JSR     R5,     L_589F                  ; 587C   0004 0158 009F

        B       L_5887                          ; 587F   0200 0006

L_5881:
        MVII    #$0003, R2                      ; 5881   02BA 0003
        MVO     R2,     G_019F                  ; 5883   0242 019F
        MVO     R2,     G_0163                  ; 5885   0242 0163

L_5887:
        JSR     R5,     L_58E8                  ; 5887   0004 0158 00E8
        JSR     R5,     L_5904                  ; 588A   0004 0158 0104
        JSR     R5,     L_5963                  ; 588D   0004 0158 0163

        MVI     G_0163, R5                      ; 5890   0285 0163
        CMPI    #$0003, R5                      ; 5892   037D 0003
        BEQ     L_589B                          ; 5894   0204 0005

        JSR     R5,     L_59BB                  ; 5896   0004 0158 01BB

        BC      L_589E                          ; 5899   0201 0003

L_589B:
        JSR     R5,     L_59CE                  ; 589B   0004 0158 01CE

L_589E:
        PULR    R7                              ; 589E   02B7

L_589F:
        PSHR    R5                              ; 589F   0275
        MVI     G_01DA, R0                      ; 58A0   0280 01DA
        MVI     G_015E, R1                      ; 58A2   0281 015E
        TSTR    R1                              ; 58A4   0089
        BNEQ    L_58A9                          ; 58A5   020C 0002

        MVI     G_01E1, R0                      ; 58A7   0280 01E1
L_58A9:
        SUB     G_01E9, R0                      ; 58A9   0300 01E9
        NEGR    R0                              ; 58AB   0020
        MVI     G_015F, R1                      ; 58AC   0281 015F
        SUBI    #$0038, R1                      ; 58AE   0339 0038
        SAR     R1,     1                       ; 58B0   0069
        SUBR    R1,     R0                      ; 58B1   0108
        MVI     G_015E, R3                      ; 58B2   0283 015E
        ADDI    #$01A0, R3                      ; 58B4   02FB 01A0
        MVI@    R3,     R2                      ; 58B6   029A
        MOVR    R0,     R1                      ; 58B7   0081
        ADDI    #$0010, R0                      ; 58B8   02F8 0010
        ANDI    #$00F0, R0                      ; 58BA   03B8 00F0
        MOVR    R0,     R5                      ; 58BC   0085
        ANDI    #$0060, R5                      ; 58BD   03BD 0060
        BEQ     L_58C4                          ; 58BF   0204 0003

        XORR    R5,     R0                      ; 58C1   01E8
        ADDI    #$0040, R0                      ; 58C2   02F8 0040
L_58C4:
        ANDI    #$0078, R1                      ; 58C4   03B9 0078
        CMPI    #$0010, R1                      ; 58C6   0379 0010
        BEQ     L_58D3                          ; 58C8   0204 0009

        CMPI    #$0068, R1                      ; 58CA   0379 0068
        BEQ     L_58D3                          ; 58CC   0204 0005

        ANDI    #$00E0, R0                      ; 58CE   03B8 00E0
        ANDI    #$001F, R2                      ; 58D0   03BA 001F
        ADDR    R0,     R2                      ; 58D2   00C2
L_58D3:
        MVO@    R2,     R3                      ; 58D3   025A
        MOVR    R2,     R0                      ; 58D4   0090
        MOVR    R0,     R1                      ; 58D5   0081
        ANDI    #$0060, R0                      ; 58D6   03B8 0060
        BEQ     L_58E3                          ; 58D8   0204 0009

        ANDI    #$0080, R1                      ; 58DA   03B9 0080
        SLR     R1,     1                       ; 58DC   0061
        MVO     R1,     G_0162                  ; 58DD   0241 0162
        ANDI    #$0003, R2                      ; 58DF   03BA 0003
        B       L_58E5                          ; 58E1   0200 0002

L_58E3:
        MVII    #$0002, R2                      ; 58E3   02BA 0002
L_58E5:
        MVO     R2,     G_0163                  ; 58E5   0242 0163
        PULR    R7                              ; 58E7   02B7

L_58E8:
        MOVR    R7,     R4                      ; 58E8   00BC
        ADDI    #$0017, R4                      ; 58E9   02FC 0017
        MVI     G_0163, R1                      ; 58EB   0281 0163
        ADDR    R1,     R4                      ; 58ED   00CC
        MVI@    R4,     R3                      ; 58EE   02A3
        MVO     R3,     G_0334                  ; 58EF   0243 0334
        SDBD                                    ; 58F1   0001
        MVII    #$5148, R3                      ; 58F2   02BB 0048 0051
        CMPI    #$0003, R1                      ; 58F5   0379 0003
        BLT     L_58FD                          ; 58F7   0205 0004

        SDBD                                    ; 58F9   0001
        MVII    #$5151, R3                      ; 58FA   02BB 0051 0051
L_58FD:
        MVO     R3,     G_033C                  ; 58FD   0243 033C
        MOVR    R5,     R7                      ; 58FF   00AF

        DECR    R0                              ; 5900   0010
        DECR    R0                              ; 5901   0010
        DECR    R0                              ; 5902   0010
        SETC                                    ; 5903   0007
L_5904:
        PSHR    R5                              ; 5904   0275
        MVI     G_0344, R1                      ; 5905   0281 0344
        MVII    #$0047, R2                      ; 5907   02BA 0047

        JSR     R5,     X_DIV                   ; 5909   0004 011C 01FB

        SLR     R0,     2                       ; 590C   0064
        SLR     R0,     1                       ; 590D   0060

        JSR     R5,     X_CLAMP                 ; 590E   0004 0114 0270
        DECLE   $0000,  $000F                   ; 5911   0000 000F

        MVI     G_0163, R1                      ; 5913   0281 0163
        MOVR    R1,     R4                      ; 5915   008C
        SLL     R1,     2                       ; 5916   004D
        SLL     R1,     2                       ; 5917   004D
        ADDR    R0,     R1                      ; 5918   00C1
        SDBD                                    ; 5919   0001
        ADDI    #$597B, R1                      ; 591A   02F9 007B 0059
        MVI@    R1,     R0                      ; 591D   0288
        MOVR    R0,     R2                      ; 591E   0082
        ANDI    #$000F, R2                      ; 591F   03BA 000F
        SLR     R0,     2                       ; 5921   0064
        SLR     R0,     2                       ; 5922   0064
        MVII    #$0001, R3                      ; 5923   02BB 0001
        CMPI    #$000C, R2                      ; 5925   037A 000C
        BLT     L_5930                          ; 5927   0205 0007
        BEQ     L_592F                          ; 5929   0204 0004

        SUBI    #$0008, R2                      ; 592B   033A 0008
        ADDI    #$0040, R0                      ; 592D   02F8 0040
L_592F:
        INCR    R3                              ; 592F   000B
L_5930:
        MVO     R3,     G_0160                  ; 5930   0243 0160
        MVO     R2,     G_0166                  ; 5932   0242 0166
        MOVR    R0,     R2                      ; 5934   0082
        ANDI    #$000F, R2                      ; 5935   03BA 000F
        XORR    R2,     R0                      ; 5937   01D0
        ADDI    #$0014, R2                      ; 5938   02FA 0014
        CMPI    #$0003, R4                      ; 593A   037C 0003
        BNEQ    L_5940                          ; 593C   020C 0002

        ADDI    #$0004, R2                      ; 593E   02FA 0004
L_5940:
        MVO     R2,     G_0165                  ; 5940   0242 0165
        MOVR    R0,     R2                      ; 5942   0082
        ANDI    #$0010, R2                      ; 5943   03BA 0010
        XORR    R2,     R0                      ; 5945   01D0
        SWAP    R0,     2                       ; 5946   0044
        ADD     G_0162, R2                      ; 5947   02C2 0162
        SLL     R2,     2                       ; 5949   004E
        SLL     R2,     1                       ; 594A   004A
        ADDR    R0,     R2                      ; 594B   00C2
        SDBD                                    ; 594C   0001
        ANDI    #$22C0, R2                      ; 594D   03BA 00C0 0022
        SDBD                                    ; 5950   0001
        ADDI    #$1820, R2                      ; 5951   02FA 0020 0018
        MVI     G_01D2, R0                      ; 5954   0280 01D2
        CMPI    #$0013, R0                      ; 5956   0378 0013
        BGE     L_595E                          ; 5958   020D 0004

        SDBD                                    ; 595A   0001
        XORI    #$1000, R2                      ; 595B   03FA 0000 0010
L_595E:
        ADD     G_0334, R2                      ; 595E   02C2 0334
        MVO     R2,     G_0334                  ; 5960   0242 0334
        PULR    R7                              ; 5962   02B7

L_5963:
        MVII    #$0004, R2                      ; 5963   02BA 0004
        MVI     G_0160, R1                      ; 5965   0281 0160
        MVI     G_0334, R0                      ; 5967   0280 0334
        SWAP    R0,     1                       ; 5969   0040
        ANDI    #$0020, R0                      ; 596A   03B8 0020
        BEQ     L_596F                          ; 596C   0204 0001

        SLL     R2,     1                       ; 596E   004A
L_596F:
        DECR    R1                              ; 596F   0011
        BEQ     L_5973                          ; 5970   0204 0001

        ADDR    R2,     R2                      ; 5972   00D2
L_5973:
        MVI     G_015F, R0                      ; 5973   0280 015F
        SUBR    R2,     R0                      ; 5975   0110
        ADDI    #$0020, R0                      ; 5976   02F8 0020
        MVO     R0,     G_0164                  ; 5978   0240 0164
        MOVR    R5,     R7                      ; 597A   00AF

        DECLE   $03CC,  $03BC,  $03AC,  $02C9   ; 597B   03CC 03BC 03AC 02C9
        DECLE   $02B9,  $02A9,  $0299,  $0088   ; 597F   02B9 02A9 0299 0088
        DECLE   $0078,  $0068,  $0057,  $0047   ; 5983   0078 0068 0057 0047
        DECLE   $0037,  $0026,  $0011,  $0000   ; 5987   0037 0026 0011 0000
        DECLE   $02CF,  $02BF,  $02AF,  $02CB   ; 598B   02CF 02BF 02AF 02CB
        DECLE   $02BB,  $02AB,  $029B,  $008A   ; 598F   02BB 02AB 029B 008A
        DECLE   $007A,  $006A,  $0057,  $0047   ; 5993   007A 006A 0057 0047
        DECLE   $0037,  $0026,  $0011,  $0000   ; 5997   0037 0026 0011 0000
        DECLE   $03C5,  $03B5,  $03A5,  $00C5   ; 599B   03C5 03B5 03A5 00C5
        DECLE   $00B5,  $00A5,  $0095,  $0084   ; 599F   00B5 00A5 0095 0084
        DECLE   $0074,  $0064,  $0053,  $0043   ; 59A3   0074 0064 0053 0043
        DECLE   $0033,  $0022,  $0011,  $0000   ; 59A7   0033 0022 0011 0000

        ADDR    R6,     R3                      ; 59AB   00F3
        ADDR    R2,     R3                      ; 59AC   00D3
        ADDR    R0,     R3                      ; 59AD   00C3
        MOVR    R6,     R3                      ; 59AE   00B3
        MOVR    R4,     R2                      ; 59AF   00A2
        TSTR    R2                              ; 59B0   0092
        MOVR    R0,     R2                      ; 59B1   0082
        RRC     R2,     1                       ; 59B2   0072
        SLR     R1,     1                       ; 59B3   0061
        RLC     R1,     1                       ; 59B4   0051
        SWAP    R1,     1                       ; 59B5   0041
        GSWD    R0                              ; 59B6   0030
        NEGR    R0                              ; 59B7   0020
        DECR    R0                              ; 59B8   0010
        DECR    R0                              ; 59B9   0010
        DECR    R0                              ; 59BA   0010
L_59BB:
        PSHR    R5                              ; 59BB   0275
        MVI     G_0160, R2                      ; 59BC   0282 0160
        MVI     G_0167, R3                      ; 59BE   0283 0167
        SUBR    R2,     R3                      ; 59C0   0113
        BMI     L_59CC                          ; 59C1   020B 0009

        MVO     R3,     G_0167                  ; 59C3   0243 0167
        MVI     G_0161, R1                      ; 59C5   0281 0161
        ADDI    #$0008, R1                      ; 59C7   02F9 0008
        MVO     R1,     G_0161                  ; 59C9   0241 0161
        PULR    R7                              ; 59CB   02B7

L_59CC:
        SETC                                    ; 59CC   0007
        PULR    R7                              ; 59CD   02B7

L_59CE:
        PSHR    R5                              ; 59CE   0275
        MVI     G_0161, R4                      ; 59CF   0284 0161
        ADDI    #$0325, R4                      ; 59D1   02FC 0325
        MVI     G_0160, R3                      ; 59D3   0283 0160
        CMPI    #$0002, R3                      ; 59D5   037B 0002
        BGT     L_5A14                          ; 59D7   020E 003B

L_59D9:
        MVI     G_0334, R1                      ; 59D9   0281 0334
        MVO@    R1,     R4                      ; 59DB   0261
        MVI     G_033C, R2                      ; 59DC   0282 033C
        MVO@    R2,     R4                      ; 59DE   0262
        MOVR    R4,     R2                      ; 59DF   00A2
        SUBI    #$032F, R2                      ; 59E0   033A 032F
        BMI     L_59EC                          ; 59E2   020B 0008

        SLR     R2,     2                       ; 59E4   0066
        SLR     R2,     1                       ; 59E5   0062
        ADDI    #$0168, R2                      ; 59E6   02FA 0168
        MVI     G_015E, R5                      ; 59E8   0285 015E
        INCR    R5                              ; 59EA   000D
        MVO@    R5,     R2                      ; 59EB   0255
L_59EC:
        MVI     G_0164, R0                      ; 59EC   0280 0164
        SWAP    R0,     2                       ; 59EE   0044
        MVO@    R0,     R4                      ; 59EF   0260
        ADDI    #$0010, R0                      ; 59F0   02F8 0010
        MVO     R0,     G_0164                  ; 59F2   0240 0164
        MVI     G_0165, R0                      ; 59F4   0280 0165
        SWAP    R0,     1                       ; 59F6   0040
        MVO@    R0,     R4                      ; 59F7   0260
        INCR    R4                              ; 59F8   000C
        MVI     G_0166, R0                      ; 59F9   0280 0166
        SWAP    R1,     1                       ; 59FB   0041
        ANDR    R3,     R1                      ; 59FC   0199
        BEQ     L_5A03                          ; 59FD   0204 0004

        INCR    R0                              ; 59FF   0008
        MVO@    R0,     R4                      ; 5A00   0260
        B       L_5A07                          ; 5A01   0200 0004

L_5A03:
        MVO@    R0,     R4                      ; 5A03   0260
        INCR    R0                              ; 5A04   0008
        MVO     R0,     G_0166                  ; 5A05   0240 0166
L_5A07:
        ADDI    #$0002, R4                      ; 5A07   02FC 0002
        DECR    R3                              ; 5A09   0013
        BEQ     L_5A14                          ; 5A0A   0204 0008

        MVI     G_0161, R0                      ; 5A0C   0280 0161
        ADDI    #$0008, R0                      ; 5A0E   02F8 0008
        MVO     R0,     G_0161                  ; 5A10   0240 0161
        B       L_59D9                          ; 5A12   0220 003A
L_5A14:
        PULR    R7                              ; 5A14   02B7

L_5A15:
        PSHR    R5                              ; 5A15   0275
        MVI     G_016C, R0                      ; 5A16   0280 016C
        TSTR    R0                              ; 5A18   0080
        BNEQ    L_5A65                          ; 5A19   020C 004A

        JSR     R5,     L_5ACB                  ; 5A1B   0004 0158 02CB

        CLRR    R3                              ; 5A1E   01DB
        MVII    #$01D3, R4                      ; 5A1F   02BC 01D3
        MVII    #$000F, R1                      ; 5A21   02B9 000F
        ADD     G_01A9, R7                      ; 5A23   02C7 01A9

        SLL     R1,     2                       ; 5A25   004D

        JSR     R5,     L_5A88                  ; 5A26   0004 0158 0288

        MVI     G_0182, R1                      ; 5A29   0281 0182

        JSR     R5,     L_5A89                  ; 5A2B   0004 0158 0289

        MVI     G_0183, R1                      ; 5A2E   0281 0183
        CMP     G_0182, R1                      ; 5A30   0341 0182
        BNEQ    L_5A45                          ; 5A32   020C 0011

        MOVR    R4,     R1                      ; 5A34   00A1
        MVII    #$01DA, R4                      ; 5A35   02BC 01DA
        MVII    #$0007, R0                      ; 5A37   02B8 0007

        JSR     R5,     .EXEC.730               ; 5A39   0004 0114 0330
        JSR     R5,     L_5BAA                  ; 5A3C   0004 0158 03AA

        MVO     R1,     G_01E7                  ; 5A3F   0241 01E7
        MVO     R0,     G_01E4                  ; 5A41   0240 01E4
        B       L_5A48                          ; 5A43   0200 0003

L_5A45:
        JSR     R5,     L_5A89                  ; 5A45   0004 0158 0289

L_5A48:
        MVII    #$01E9, R4                      ; 5A48   02BC 01E9
        MVI     G_01D1, R1                      ; 5A4A   0281 01D1
        SUBI    #$0008, R1                      ; 5A4C   0339 0008
        MVI     G_01D2, R3                      ; 5A4E   0283 01D2
        CMPI    #$0017, R3                      ; 5A50   037B 0017
        BGE     L_5A57                          ; 5A52   020D 0003

        MOVR    R1,     R3                      ; 5A54   008B
        SAR     R3,     2                       ; 5A55   006F
        SUBR    R3,     R1                      ; 5A56   0119
L_5A57:
        PSHR    R1                              ; 5A57   0271
        MOVR    R7,     R3                      ; 5A58   00BB
        ADDI    #$002B, R3                      ; 5A59   02FB 002B

        JSR     R5,     L_5A89                  ; 5A5B   0004 0158 0289

        PULR    R1                              ; 5A5E   02B1

        JSR     R5,     L_5AB7                  ; 5A5F   0004 0158 02B7
        JSR     R5,     L_5A66                  ; 5A62   0004 0158 0266

L_5A65:
        PULR    R7                              ; 5A65   02B7

L_5A66:
        PSHR    R5                              ; 5A66   0275
        MVII    #$01DC, R5                      ; 5A67   02BD 01DC
        MVII    #$034F, R4                      ; 5A69   02BC 034F
L_5A6B:
        SDBD                                    ; 5A6B   0001
        MVI@    R5,     R0                      ; 5A6C   02A8
        MVO@    R0,     R4                      ; 5A6D   0260
        INCR    R5                              ; 5A6E   000D
        SDBD                                    ; 5A6F   0001
        MVI@    R5,     R0                      ; 5A70   02A8
        MVO@    R0,     R4                      ; 5A71   0260
        ADDI    #$0002, R5                      ; 5A72   02FD 0002
        ADDI    #$0006, R4                      ; 5A74   02FC 0006
        CMPI    #$0357, R4                      ; 5A76   037C 0357
        BEQ     L_5A6B                          ; 5A78   0224 000E

        CMPI    #$0327, R4                      ; 5A7A   037C 0327
        BEQ     L_5A83                          ; 5A7C   0204 0005

        MVII    #$031F, R4                      ; 5A7E   02BC 031F
        INCR    R5                              ; 5A80   000D
        B       L_5A6B                          ; 5A81   0220 0017
L_5A83:
        PULR    R7                              ; 5A83   02B7

        COMR    R4                              ; 5A84   001C
        MOVR    R2,     R3                      ; 5A85   0093
        RSWD    R4                              ; 5A86   003C
        SLR     R3,     1                       ; 5A87   0063
L_5A88:
        SLL     R1,     1                       ; 5A88   0049
L_5A89:
        SLL     R1,     1                       ; 5A89   0049
        PSHR    R5                              ; 5A8A   0275
        MVI@    R4,     R0                      ; 5A8B   02A0
        PSHR    R0                              ; 5A8C   0270
        ADD     G_01A9, R7                      ; 5A8D   02C7 01A9

        SAR     R1,     2                       ; 5A8F   006D

        JSR     R5,     L_6001                  ; 5A90   0004 0160 0001
        JSR     R5,     L_5A9C                  ; 5A93   0004 0158 029C

        PULR    R0                              ; 5A96   02B0

        JSR     R5,     L_6004                  ; 5A97   0004 0160 0004

        NEGR    R0                              ; 5A9A   0020
        PULR    R5                              ; 5A9B   02B5
L_5A9C:
        PSHR    R5                              ; 5A9C   0275
        PSHR    R1                              ; 5A9D   0271

        JSR     R5,     X_MPY                   ; 5A9E   0004 011C 01DC
        JSR     R5,     L_6089                  ; 5AA1   0004 0160 0089

        MOVR    R3,     R0                      ; 5AA4   0098
        BEQ     L_5AB0                          ; 5AA5   0204 0009

        ADDI    #$0002, R0                      ; 5AA7   02F8 0002
        CMP@    R3,     R1                      ; 5AA9   0359
        BLT     L_5AB4                          ; 5AAA   0205 0008

        INCR    R3                              ; 5AAC   000B
        CMP@    R3,     R1                      ; 5AAD   0359
        BGT     L_5AB4                          ; 5AAE   020E 0004

L_5AB0:
        MVO@    R2,     R5                      ; 5AB0   026A
        SWAP    R2,     1                       ; 5AB1   0042
        MVO@    R2,     R5                      ; 5AB2   026A
        MVO@    R1,     R5                      ; 5AB3   0269
L_5AB4:
        PULR    R1                              ; 5AB4   02B1
        MOVR    R0,     R3                      ; 5AB5   0083
        PULR    R7                              ; 5AB6   02B7

L_5AB7:
        PSHR    R5                              ; 5AB7   0275
        MVI     G_01D0, R0                      ; 5AB8   0280 01D0
        SUBI    #$0010, R0                      ; 5ABA   0338 0010
        SLL     R0,     1                       ; 5ABC   0048

        JSR     R5,     X_MPY                   ; 5ABD   0004 011C 01DC

        NEGR    R2                              ; 5AC0   0022
        MVII    #$01E8, R5                      ; 5AC1   02BD 01E8
        SDBD                                    ; 5AC3   0001
        ADD@    R5,     R2                      ; 5AC4   02EA
        SUBI    #$0002, R5                      ; 5AC5   033D 0002
        MVO@    R2,     R5                      ; 5AC7   026A
        SWAP    R2,     1                       ; 5AC8   0042
        MVO@    R2,     R5                      ; 5AC9   026A
        PULR    R7                              ; 5ACA   02B7

L_5ACB:
        PSHR    R5                              ; 5ACB   0275
        MVII    #$0007, R0                      ; 5ACC   02B8 0007
        MVI     G_01A0, R2                      ; 5ACE   0282 01A0
        ANDI    #$0001, R2                      ; 5AD0   03BA 0001
        BEQ     L_5AEC                          ; 5AD2   0204 0018

L_5AD4:
        JSR     R5,     .EXEC.772               ; 5AD4   0004 0114 0372

        CMPI    #$0006, R0                      ; 5AD7   0378 0006
        BNEQ    L_5ADF                          ; 5AD9   020C 0004

        ADDI    #$0003, R2                      ; 5ADB   02FA 0003
        ADDI    #$0002, R3                      ; 5ADD   02FB 0002
L_5ADF:
        PSHR    R0                              ; 5ADF   0270
        MVI     G_01EC, R0                      ; 5AE0   0280 01EC
        MVI     G_01EF, R1                      ; 5AE2   0281 01EF

        JSR     R5,     .EXEC.78C               ; 5AE4   0004 0114 038C

        PULR    R0                              ; 5AE7   02B0
        CMPI    #$0051, R2                      ; 5AE8   037A 0051
        BLT     L_5AF4                          ; 5AEA   0205 0008

L_5AEC:
        DECR    R0                              ; 5AEC   0010
        CMPI    #$0006, R0                      ; 5AED   0378 0006
        BEQ     L_5AD4                          ; 5AEF   0224 001C

        MVII    #$0001, R1                      ; 5AF1   02B9 0001
        INCR    R7                              ; 5AF3   000F

L_5AF4:
        CLRR    R1                              ; 5AF4   01C9
L_5AF5:
        MVO     R1,     G_01A9                  ; 5AF5   0241 01A9
        PULR    R7                              ; 5AF7   02B7

L_5AF8:
        PSHR    R5                              ; 5AF8   0275
        MVI     G_017C, R4                      ; 5AF9   0284 017C
        ANDI    #$0003, R4                      ; 5AFB   03BC 0003
        ADDR    R4,     R4                      ; 5AFD   00E4
        SDBD                                    ; 5AFE   0001
        ADDI    #$5B9C, R4                      ; 5AFF   02FC 009C 005B
        MVI     G_0170, R1                      ; 5B02   0281 0170
        TSTR    R1                              ; 5B04   0089
        BEQ     L_5B1A                          ; 5B05   0204 0013

        MVI     G_01DD, R3                      ; 5B07   0283 01DD
        SWAP    R3,     1                       ; 5B09   0043
        ADD     G_01E0, R3                      ; 5B0A   02C3 01E0
        SDBD                                    ; 5B0C   0001
        CMP@    R4,     R3                      ; 5B0D   0363
        BEQ     L_5B8A                          ; 5B0E   0204 007A

        SUBI    #$0002, R4                      ; 5B10   033C 0002
L_5B12:
        SDBD                                    ; 5B12   0001
        MVI@    R4,     R2                      ; 5B13   02A2
        MVII    #$01DA, R4                      ; 5B14   02BC 01DA

        JSR     R5,     L_5C07                  ; 5B16   0004 015C 0007

        PULR    R7                              ; 5B19   02B7

L_5B1A:
        MVII    #$0005, R0                      ; 5B1A   02B8 0005
        SUB     G_01C6, R0                      ; 5B1C   0300 01C6
        SLL     R0,     2                       ; 5B1E   004C
        DECR    R0                              ; 5B1F   0010
        MVO     R0,     G_0182                  ; 5B20   0240 0182
        MVO     R0,     G_0183                  ; 5B22   0240 0183

        JSR     R5,     L_5BAA                  ; 5B24   0004 0158 03AA

        MVO     R1,     G_01E7                  ; 5B27   0241 01E7
        MVO     R0,     G_01E4                  ; 5B29   0240 01E4
        PSHR    R4                              ; 5B2B   0274
        MVII    #$0014, R2                      ; 5B2C   02BA 0014
        MVO     R2,     G_01DD                  ; 5B2E   0242 01DD
        MVII    #$0005, R0                      ; 5B30   02B8 0005

        JSR     R5,     X_RAND1                 ; 5B32   0004 0114 027D

        ADDI    #$0040, R0                      ; 5B35   02F8 0040
        MVO     R0,     G_01E0                  ; 5B37   0240 01E0
        MVI     G_017C, R1                      ; 5B39   0281 017C
        MOVR    R1,     R2                      ; 5B3B   008A
        SLR     R1,     2                       ; 5B3C   0065
        BEQ     L_5B96                          ; 5B3D   0204 0057

        ANDI    #$0001, R2                      ; 5B3F   03BA 0001
        MVO     R2,     G_017C                  ; 5B41   0242 017C
        MOVR    R1,     R2                      ; 5B43   008A
        ANDI    #$0003, R1                      ; 5B44   03B9 0003
        SLR     R2,     2                       ; 5B46   0066
        ANDI    #$0007, R2                      ; 5B47   03BA 0007
        ADDR    R1,     R2                      ; 5B49   00CA
        MVII    #$01A0, R4                      ; 5B4A   02BC 01A0
        MVII    #$0001, R0                      ; 5B4C   02B8 0001
L_5B4E:
        PSHR    R0                              ; 5B4E   0270
        MVII    #$0001, R3                      ; 5B4F   02BB 0001
        DECR    R1                              ; 5B51   0011
        BMI     L_5B55                          ; 5B52   020B 0001

        INCR    R3                              ; 5B54   000B
L_5B55:
        DECR    R2                              ; 5B55   0012
        BPL     L_5B5A                          ; 5B56   0203 0002

        CLRR    R0                              ; 5B58   01C0
        CLRR    R3                              ; 5B59   01DB
L_5B5A:
        MVO@    R3,     R4                      ; 5B5A   0263
        XOR     G_0170, R0                      ; 5B5B   03C0 0170
        MVO     R0,     G_0170                  ; 5B5D   0240 0170
        PULR    R0                              ; 5B5F   02B0
        SLL     R0,     1                       ; 5B60   0048
        CMPI    #$0040, R0                      ; 5B61   0378 0040
        BLT     L_5B4E                          ; 5B63   0225 0016

        MVII    #$01A1, R3                      ; 5B65   02BB 01A1
        MVI@    R3,     R2                      ; 5B67   029A
        CMPI    #$0002, R2                      ; 5B68   037A 0002
        BNEQ    L_5B7B                          ; 5B6A   020C 000F

L_5B6C:
        MVII    #$0005, R0                      ; 5B6C   02B8 0005

        JSR     R5,     X_RAND2                 ; 5B6E   0004 0114 029E

        INCR    R0                              ; 5B71   0008
        ADDI    #$01A0, R0                      ; 5B72   02F8 01A0
        MOVR    R0,     R1                      ; 5B74   0081
        MVI@    R1,     R0                      ; 5B75   0288
        TSTR    R0                              ; 5B76   0080
        BEQ     L_5B6C                          ; 5B77   0224 000C

        MVO@    R0,     R3                      ; 5B79   0258
        MVO@    R2,     R1                      ; 5B7A   024A
L_5B7B:
        MVII    #$01A0, R3                      ; 5B7B   02BB 01A0
L_5B7D:
        MVI@    R3,     R2                      ; 5B7D   029A
        DECR    R2                              ; 5B7E   0012
        BMI     L_5B82                          ; 5B7F   020B 0001

        MVO@    R2,     R3                      ; 5B81   025A
L_5B82:
        INCR    R3                              ; 5B82   000B
        CMPI    #$01A5, R3                      ; 5B83   037B 01A5
        BLE     L_5B7D                          ; 5B85   0226 0009

        PULR    R4                              ; 5B87   02B4
        B       L_5B12                          ; 5B88   0220 0077

L_5B8A:
        MVI     G_01A9, R1                      ; 5B8A   0281 01A9
        TSTR    R1                              ; 5B8C   0089
        BEQ     L_5B95                          ; 5B8D   0204 0006

        MVI     G_0183, R1                      ; 5B8F   0281 0183
        CMP     G_0182, R1                      ; 5B91   0341 0182
        BEQ     L_5B96                          ; 5B93   0204 0001
L_5B95:
        PULR    R7                              ; 5B95   02B7

L_5B96:
        MVII    #$0014, R0                      ; 5B96   02B8 0014
        PULR    R5                              ; 5B98   02B5
        J       L_633A                          ; 5B99   0004 0360 033A

        DECLE   $0040,  $0094,  $0060,  $0094   ; 5B9C   0040 0094 0060 0094
        DECLE   $0004,  $0000,  $0004,  $0004   ; 5BA0   0004 0000 0004 0004
        DECLE   $0002,  $0000,  $0002,  $0004   ; 5BA4   0002 0000 0002 0004
        DECLE   $0000                           ; 5BA8   0000

        EIS                                     ; 5BA9   0002
L_5BAA:
        MVI     G_017C, R3                      ; 5BAA   0283 017C
        CLRR    R0                              ; 5BAC   01C0
        ANDI    #$0002, R3                      ; 5BAD   03BB 0002
        BNEQ    L_5BB3                          ; 5BAF   020C 0002

        MVII    #$0006, R0                      ; 5BB1   02B8 0006
L_5BB3:
        MVII    #$0002, R1                      ; 5BB3   02B9 0002
        ADD     G_01DD, R0                      ; 5BB5   02C0 01DD
        ADD     G_01E0, R1                      ; 5BB7   02C1 01E0
        MOVR    R5,     R7                      ; 5BB9   00AF

L_5BBA:
        PSHR    R5                              ; 5BBA   0275

        JSR     R5,     L_5C1D                  ; 5BBB   0004 015C 001D

        MVI     G_01E4, R2                      ; 5BBE   0282 01E4
        SWAP    R2,     1                       ; 5BC0   0042
        ADD     G_01E7, R2                      ; 5BC1   02C2 01E7
        ANDI    #$0001, R3                      ; 5BC3   03BB 0001
        BEQ     L_5BE7                          ; 5BC5   0204 0020

        MVI     G_01A0, R1                      ; 5BC7   0281 01A0
        ANDI    #$0001, R1                      ; 5BC9   03B9 0001
        BEQ     L_5BE7                          ; 5BCB   0204 001A

        MOVR    R2,     R1                      ; 5BCD   0091
        MVII    #$017F, R5                      ; 5BCE   02BD 017F
        SDBD                                    ; 5BD0   0001
        MVI@    R5,     R2                      ; 5BD1   02AA
        SUBR    R2,     R1                      ; 5BD2   0111
        BNEQ    L_5BF7                          ; 5BD3   020C 0022

        MVI     G_017E, R0                      ; 5BD5   0280 017E
        DECR    R0                              ; 5BD7   0010
        BPL     L_5BDC                          ; 5BD8   0203 0002

        MVII    #$0082, R0                      ; 5BDA   02B8 0082
L_5BDC:
        MVO     R0,     G_017E                  ; 5BDC   0240 017E
        BNEQ    L_5BE6                          ; 5BDE   020C 0006

        MVI     G_017D, R0                      ; 5BE0   0280 017D
        ANDI    #$0082, R0                      ; 5BE2   03B8 0082
        MVO     R0,     G_017D                  ; 5BE4   0240 017D
L_5BE6:
        PULR    R7                              ; 5BE6   02B7

L_5BE7:
        JSR     R5,     L_5BAA                  ; 5BE7   0004 0158 03AA
        JSR     R5,     X_PACK_BYTES            ; 5BEA   0004 0114 034F

        MVI     G_0182, R3                      ; 5BED   0283 0182
        CMP     G_0183, R3                      ; 5BEF   0343 0183
        BEQ     L_5C04                          ; 5BF1   0204 0011

        CMPR    R2,     R0                      ; 5BF3   0150
        BEQ     L_5C04                          ; 5BF4   0204 000E

        MOVR    R0,     R2                      ; 5BF6   0082
L_5BF7:
        MVII    #$01E1, R4                      ; 5BF7   02BC 01E1

        JSR     R5,     L_5C07                  ; 5BF9   0004 015C 0007

        MVII    #$0028, R3                      ; 5BFC   02BB 0028
        SUB     G_01C6, R3                      ; 5BFE   0303 01C6
        SUB     G_01C6, R3                      ; 5C00   0303 01C6
        SUB     G_01C6, R3                      ; 5C02   0303 01C6
L_5C04:
        MVO     R3,     G_0183                  ; 5C04   0243 0183
        PULR    R7                              ; 5C06   02B7

L_5C07:
        PSHR    R5                              ; 5C07   0275
        MOVR    R2,     R1                      ; 5C08   0091
        ANDI    #$00FF, R1                      ; 5C09   03B9 00FF
        XORR    R1,     R2                      ; 5C0B   01CA
        SWAP    R2,     1                       ; 5C0C   0042
        MOVR    R4,     R5                      ; 5C0D   00A5
        ADDI    #$0003, R5                      ; 5C0E   02FD 0003
        SUB@    R5,     R2                      ; 5C10   032A
        ADDI    #$0002, R5                      ; 5C11   02FD 0002
        SUB@    R5,     R1                      ; 5C13   0329

        JSR     R5,     L_602F                  ; 5C14   0004 0160 002F
        JSR     R5,     L_6059                  ; 5C17   0004 0160 0059

        SAR     R3,     1                       ; 5C1A   006B
        MVO@    R3,     R4                      ; 5C1B   0263
        PULR    R7                              ; 5C1C   02B7

L_5C1D:
        PSHR    R5                              ; 5C1D   0275
        MVI     G_032C, R4                      ; 5C1E   0284 032C
        TSTR    R4                              ; 5C20   00A4
        BEQ     L_5C2B                          ; 5C21   0204 0008

        INCR    R4                              ; 5C23   000C
        MVI     G_01D2, R3                      ; 5C24   0283 01D2
        CMPI    #$0013, R3                      ; 5C26   037B 0013
        BGE     L_5C2B                          ; 5C28   020D 0001

        CLRR    R4                              ; 5C2A   01E4
L_5C2B:
        CLRR    R3                              ; 5C2B   01DB
        MVI     G_01A9, R1                      ; 5C2C   0281 01A9
        TSTR    R1                              ; 5C2E   0089
        BNEQ    L_5C87                          ; 5C2F   020C 0056

        MVI     G_017D, R3                      ; 5C31   0283 017D
        MVII    #$0003, R0                      ; 5C33   02B8 0003
        MVI     G_01C6, R1                      ; 5C35   0281 01C6
        CMPI    #$0003, R1                      ; 5C37   0379 0003
        BGE     L_5C41                          ; 5C39   020D 0006

        MVI     G_017A, R1                      ; 5C3B   0281 017A
        ANDI    #$0001, R1                      ; 5C3D   03B9 0001
        BEQ     L_5C54                          ; 5C3F   0204 0013

L_5C41:
        MVI     G_01D2, R2                      ; 5C41   0282 01D2
        SWAP    R3,     2                       ; 5C43   0047
        BMI     L_5C6F                          ; 5C44   020B 0029

        MOVR    R3,     R1                      ; 5C46   0099
        ANDI    #$0002, R1                      ; 5C47   03B9 0002
        BNEQ    L_5C6F                          ; 5C49   020C 0024

        MVII    #$000A, R0                      ; 5C4B   02B8 000A
        CMPI    #$0013, R2                      ; 5C4D   037A 0013
        BLT     L_5C6C                          ; 5C4F   0205 001B
        BEQ     L_5C54                          ; 5C51   0204 0001

        SLR     R0,     1                       ; 5C53   0060

L_5C54:
        JSR     R5,     X_RAND1                 ; 5C54   0004 0114 027D

        TSTR    R0                              ; 5C57   0080
        BNEQ    L_5C6C                          ; 5C58   020C 0012

        ANDI    #$007E, R3                      ; 5C5A   03BB 007E
        XORI    #$0081, R3                      ; 5C5C   03FB 0081
        MVO     R3,     G_017D                  ; 5C5E   0243 017D
        MVI     G_01EC, R0                      ; 5C60   0280 01EC
        MVO     R0,     G_0180                  ; 5C62   0240 0180
        MVI     G_01EF, R0                      ; 5C64   0280 01EF
        MVO     R0,     G_017F                  ; 5C66   0240 017F
        TSTR    R4                              ; 5C68   00A4
        BNEQ    L_5C6C                          ; 5C69   020C 0001

        INCR    R4                              ; 5C6B   000C
L_5C6C:
        MVO     R4,     G_032C                  ; 5C6C   0244 032C
        PULR    R7                              ; 5C6E   02B7

L_5C6F:
        CMPI    #$0013, R2                      ; 5C6F   037A 0013
        BGE     L_5C54                          ; 5C71   022D 001E

        MVI     G_01D1, R2                      ; 5C73   0282 01D1
        MVII    #$000B, R0                      ; 5C75   02B8 000B
        CMPI    #$0008, R2                      ; 5C77   037A 0008
        BEQ     L_5C54                          ; 5C79   0224 0026

        MVII    #$0009, R0                      ; 5C7B   02B8 0009
        BLT     L_5C54                          ; 5C7D   0225 002A

        CMPI    #$0010, R2                      ; 5C7F   037A 0010
        BLE     L_5C54                          ; 5C81   0226 002E

        MVII    #$0006, R0                      ; 5C83   02B8 0006
        B       L_5C54                          ; 5C85   0220 0032

L_5C87:
        MVO     R3,     G_017D                  ; 5C87   0243 017D
        MVO     R3,     G_017E                  ; 5C89   0243 017E
        CLRR    R4                              ; 5C8B   01E4
        B       L_5C6C                          ; 5C8C   0220 0021

        PSHR    R5                              ; 5C8E   0275
        MVI     G_01A6, R1                      ; 5C8F   0281 01A6
        SLR     R1,     1                       ; 5C91   0061
        ANDI    #$0007, R1                      ; 5C92   03B9 0007
        BEQ     L_5D30                          ; 5C94   0204 009A

        MVII    #$0003, R4                      ; 5C96   02BC 0003
        DECR    R1                              ; 5C98   0011
        BEQ     L_5CA1                          ; 5C99   0204 0006

        DECR    R4                              ; 5C9B   0014
        CMPI    #$0003, R1                      ; 5C9C   0379 0003
        BNEQ    L_5CA1                          ; 5C9E   020C 0001

        DECR    R4                              ; 5CA0   0014
L_5CA1:
        MVO     R4,     G_032B                  ; 5CA1   0244 032B
        MOVR    R1,     R4                      ; 5CA3   008C
        INCR    R4                              ; 5CA4   000C
        ANDI    #$0002, R4                      ; 5CA5   03BC 0002
        BEQ     L_5CEA                          ; 5CA7   0204 0041

        CLRR    R0                              ; 5CA9   01C0
        MVI     G_01D2, R2                      ; 5CAA   0282 01D2
        CMPI    #$0013, R2                      ; 5CAC   037A 0013
        BGE     L_5CC3                          ; 5CAE   020D 0013

        MVI     G_0192, R2                      ; 5CB0   0282 0192
        CMPI    #$000C, R2                      ; 5CB2   037A 000C
        BLT     L_5CC3                          ; 5CB4   0205 000D

        CMPI    #$0055, R2                      ; 5CB6   037A 0055
        BGE     L_5CC3                          ; 5CB8   020D 0009

        SDBD                                    ; 5CBA   0001
        MVII    #$1000, R0                      ; 5CBB   02B8 0000 0010
        ADDI    #$001C, R2                      ; 5CBE   02FA 001C
        SWAP    R2,     1                       ; 5CC0   0042
        MVO     R2,     G_0327                  ; 5CC1   0242 0327
L_5CC3:
        MVI     G_01A7, R3                      ; 5CC3   0283 01A7
        CMPI    #$0006, R3                      ; 5CC5   037B 0006
        BNEQ    L_5CE1                          ; 5CC7   020C 0018

        MVII    #$0010, R4                      ; 5CC9   02BC 0010
        MVO     R4,     G_016E                  ; 5CCB   0244 016E
        MOVR    R1,     R4                      ; 5CCD   008C
        CMPI    #$0002, R4                      ; 5CCE   037C 0002
        BNEQ    L_5CE1                          ; 5CD0   020C 000F

        MVII    #$0018, R3                      ; 5CD2   02BB 0018
        MVO     R3,     G_016E                  ; 5CD4   0243 016E
        MVII    #$0019, R3                      ; 5CD6   02BB 0019
        SWAP    R3,     1                       ; 5CD8   0043
        CMP     G_0328, R3                      ; 5CD9   0343 0328
        BNEQ    L_5CE1                          ; 5CDB   020C 0004

        MVII    #$0001, R2                      ; 5CDD   02BA 0001
        MVO     R2,     G_0181                  ; 5CDF   0242 0181
L_5CE1:
        MVI     G_0325, R2                      ; 5CE1   0282 0325
        SDBD                                    ; 5CE3   0001
        ANDI    #$EFFF, R2                      ; 5CE4   03BA 00FF 00EF
        ADDR    R0,     R2                      ; 5CE7   00C2
        MVO     R2,     G_0325                  ; 5CE8   0242 0325
L_5CEA:
        MOVR    R1,     R4                      ; 5CEA   008C
        SLL     R1,     1                       ; 5CEB   0049
        ADDR    R1,     R4                      ; 5CEC   00CC
        SLL     R1,     2                       ; 5CED   004D
        ADDR    R1,     R4                      ; 5CEE   00CC
        SDBD                                    ; 5CEF   0001
        ADDI    #$5DCF, R4                      ; 5CF0   02FC 00CF 005D
        MVI     G_01A7, R2                      ; 5CF3   0282 01A7
        ADDR    R2,     R4                      ; 5CF5   00D4
        DECR    R4                              ; 5CF6   0014
        INCR    R2                              ; 5CF7   000A
        MVO     R2,     G_01A7                  ; 5CF8   0242 01A7
        MVI@    R4,     R1                      ; 5CFA   02A1
        TSTR    R1                              ; 5CFB   0089
        BEQ     L_5D30                          ; 5CFC   0204 0032

        MOVR    R1,     R0                      ; 5CFE   0088
        ANDI    #$003F, R1                      ; 5CFF   03B9 003F
        XORR    R1,     R0                      ; 5D01   01C8
        SLL     R0,     2                       ; 5D02   004C
        SWAP    R0,     1                       ; 5D03   0040
        CMPI    #$0008, R0                      ; 5D04   0378 0008
        BLE     L_5D15                          ; 5D06   0206 000D

        SUBI    #$0007, R0                      ; 5D08   0338 0007
        MOVR    R1,     R2                      ; 5D0A   008A
        ANDI    #$0008, R2                      ; 5D0B   03BA 0008
        NEGR    R2                              ; 5D0D   0022
        ADDI    #$0004, R2                      ; 5D0E   02FA 0004
        SWAP    R2,     1                       ; 5D10   0042
        ADD     G_0328, R2                      ; 5D11   02C2 0328
        MVO     R2,     G_0328                  ; 5D13   0242 0328
L_5D15:
        MVO     R0,     G_032A                  ; 5D15   0240 032A
        MOVR    R1,     R0                      ; 5D17   0088
        ANDI    #$0017, R1                      ; 5D18   03B9 0017
        XORR    R1,     R0                      ; 5D1A   01C8
        SLL     R0,     2                       ; 5D1B   004C
        SLL     R0,     2                       ; 5D1C   004C
        ADDR    R0,     R1                      ; 5D1D   00C1
        ADDI    #$0020, R1                      ; 5D1E   02F9 0020
        MVI     G_0325, R0                      ; 5D20   0280 0325
        SDBD                                    ; 5D22   0001
        ANDI    #$3000, R0                      ; 5D23   03B8 0000 0030
        ADDR    R0,     R1                      ; 5D26   00C1
        MVO     R1,     G_0325                  ; 5D27   0241 0325
        SDBD                                    ; 5D29   0001
        MVII    #$5158, R1                      ; 5D2A   02B9 0058 0051
        MVO     R1,     G_0326                  ; 5D2D   0241 0326
        PULR    R7                              ; 5D2F   02B7

L_5D30:
        MVO     R1,     G_01A7                  ; 5D30   0241 01A7
        MVO     R1,     G_0326                  ; 5D32   0241 0326
        MVI     G_01A8, R0                      ; 5D34   0280 01A8
        CLRR    R4                              ; 5D36   01E4
        DECR    R0                              ; 5D37   0010
        BMI     L_5D5A                          ; 5D38   020B 0020

        MOVR    R0,     R3                      ; 5D3A   0083
        ADDI    #$01A0, R3                      ; 5D3B   02FB 01A0
        MVO@    R4,     R3                      ; 5D3D   025C

        JSR     R5,     X_SET_BIT               ; 5D3E   0004 0114 02DB

        CMPR    R6,     R0                      ; 5D41   0170
        MVO     R4,     G_01A8                  ; 5D42   0244 01A8
        MVO     R4,     G_032E                  ; 5D44   0244 032E
        NOP                                     ; 5D46   0034
        MVO     R4,     G_0336                  ; 5D47   0244 0336
        MVO     R4,     G_033E                  ; 5D49   0244 033E
        MVO     R4,     G_0346                  ; 5D4B   0244 0346
        MVI     G_017D, R0                      ; 5D4D   0280 017D
        ANDI    #$008D, R0                      ; 5D4F   03B8 008D
        ADDI    #$0002, R0                      ; 5D51   02F8 0002
        MVO     R0,     G_017D                  ; 5D53   0240 017D
        MVI     G_01CB, R0                      ; 5D55   0280 01CB
        INCR    R0                              ; 5D57   0008
        MVO     R0,     G_01CB                  ; 5D58   0240 01CB
L_5D5A:
        MVO     R4,     G_0329                  ; 5D5A   0244 0329
        MVO     R4,     G_016C                  ; 5D5C   0244 016C
        CLRR    R0                              ; 5D5E   01C0
        MVO     R0,     G_01D3                  ; 5D5F   0240 01D3
        ADD     G_0181, R4                      ; 5D61   02C4 0181
        BEQ     L_5D8B                          ; 5D63   0204 0026

        MVO     R0,     G_0181                  ; 5D65   0240 0181
        MVII    #$0020, R0                      ; 5D67   02B8 0020
        MVO     R0,     G_016E                  ; 5D69   0240 016E

        JSR     R5,     L_60F6                  ; 5D6B   0004 0160 00F6

        MVII    #$00DC, R3                      ; 5D6E   02BB 00DC
        SDBD                                    ; 5D70   0001
        MVII    #$0AE9, R1                      ; 5D71   02B9 00E9 000A
L_5D74:
        MVII    #$0014, R0                      ; 5D74   02B8 0014
        MOVR    R3,     R4                      ; 5D76   009C
        ADDI    #$0200, R4                      ; 5D77   02FC 0200

        JSR     R5,     X_FILL_MEM              ; 5D79   0004 0114 0341

        SDBD                                    ; 5D7C   0001
        MVII    #$2000, R0                      ; 5D7D   02B8 0000 0020
L_5D80:
        EIS                                     ; 5D80   0002
        DECR    R0                              ; 5D81   0010
        BPL     L_5D80                          ; 5D82   0223 0003

        SUBI    #$0014, R3                      ; 5D84   033B 0014
        BPL     L_5D74                          ; 5D86   0223 0013
        J       L_6331                          ; 5D88   0004 0360 0331

L_5D8B:
        MVO     R4,     G_01D9                  ; 5D8B   0244 01D9
        PULR    R7                              ; 5D8D   02B7

        PSHR    R5                              ; 5D8E   0275
        MVI     G_01A6, R2                      ; 5D8F   0282 01A6
        ANDI    #$000E, R2                      ; 5D91   03BA 000E
        BNEQ    L_5DCE                          ; 5D93   020C 0039

        ADD     G_01CA, R2                      ; 5D95   02C2 01CA
        BNEQ    L_5DCE                          ; 5D97   020C 0035

        MOVR    R0,     R2                      ; 5D99   0082
        ADDI    #$0166, R2                      ; 5D9A   02FA 0166
        MVI@    R2,     R3                      ; 5D9C   0293
        MOVR    R0,     R4                      ; 5D9D   0084
        ADDI    #$0130, R4                      ; 5D9E   02FC 0130
        CMP@    R4,     R3                      ; 5DA0   0363
        BNEQ    L_5DCE                          ; 5DA1   020C 002B

        MVO     R3,     G_01A8                  ; 5DA3   0243 01A8
        CLRR    R0                              ; 5DA5   01C0
        MVII    #$0002, R4                      ; 5DA6   02BC 0002
L_5DA8:
        MOVR    R4,     R2                      ; 5DA8   00A2
        ADDI    #$0166, R2                      ; 5DA9   02FA 0166
        CMP@    R2,     R3                      ; 5DAB   0353
        BNEQ    L_5DB6                          ; 5DAC   020C 0008

        TSTR    R0                              ; 5DAE   0080
        BNEQ    L_5DB4                          ; 5DAF   020C 0003

        MOVR    R4,     R0                      ; 5DB1   00A0
        B       L_5DB6                          ; 5DB2   0200 0002

L_5DB4:
        ADDI    #$0080, R0                      ; 5DB4   02F8 0080
L_5DB6:
        INCR    R4                              ; 5DB6   000C
        CMPI    #$0005, R4                      ; 5DB7   037C 0005
        BLE     L_5DA8                          ; 5DB9   0226 0012

        MVO     R0,     G_016C                  ; 5DBB   0240 016C
        MVII    #$0001, R1                      ; 5DBD   02B9 0001
        MVO     R1,     G_032B                  ; 5DBF   0241 032B
        MVO     R1,     G_01A7                  ; 5DC1   0241 01A7
        MVI     G_01A6, R1                      ; 5DC3   0281 01A6
        ADDI    #$0002, R1                      ; 5DC5   02F9 0002
        MVO     R1,     G_01A6                  ; 5DC7   0241 01A6
        MVO     R1,     G_01D9                  ; 5DC9   0241 01D9

        JSR     R5,     L_60F6                  ; 5DCB   0004 0160 00F6

L_5DCE:
        PULR    R7                              ; 5DCE   02B7

        DECLE   $00C0,  $0092,  $027A,  $005A   ; 5DCF   00C0 0092 027A 005A
        DECLE   $007A,  $005A,  $001A,  $003A   ; 5DD3   007A 005A 001A 003A
        DECLE   $0018,  $0038,  $0000,  $0180   ; 5DD7   0018 0038 0000 0180
        DECLE   $0180,  $0180,  $0180,  $01C0   ; 5DDB   0180 0180 0180 01C0
        DECLE   $01D2,  $03FA,  $020F,  $0227   ; 5DDF   01D2 03FA 020F 0227
        DECLE   $0207,  $0000,  $0188,  $0188   ; 5DE3   0207 0000 0188 0188
        DECLE   $0188,  $0188,  $01C8,  $01DA   ; 5DE7   0188 0188 01C8 01DA
        DECLE   $021A,  $03EF,  $0207,  $0227   ; 5DEB   021A 03EF 0207 0227
        DECLE   $0000                           ; 5DEF   0000

        SUBR    R2,     R2                      ; 5DF0   0112
        ADD@    R3,     R2                      ; 5DF1   02DA
        CMPR    R3,     R2                      ; 5DF2   015A
        CMPR    R1,     R7                      ; 5DF3   014F
        SUB     .STIC.X.0,R7                    ; 5DF4   0307 0000

.GFX_LIST_5DF6:
        DECLE   $0000,  $001E,  $0010,  $001C   ; 5DF6  CART PIC #00
        DECLE   $0010,  $001E,  $0000,  $0000   ; 5DFA  
        DECLE   $0000,  $00F0,  $0080,  $00E0   ; 5DFE  CART PIC #01
        DECLE   $0080,  $00F0,  $0000,  $0000   ; 5E02  
        DECLE   $0000,  $0009,  $0009,  $000D   ; 5E06  CART PIC #02
        DECLE   $000B,  $0009,  $0000,  $0000   ; 5E0A  
        DECLE   $0000,  $0048,  $0048,  $0068   ; 5E0E  CART PIC #03
        DECLE   $0058,  $0048,  $0000,  $0000   ; 5E12  
        DECLE   $0000,  $0011,  $0011,  $0015   ; 5E16  CART PIC #04
        DECLE   $0015,  $000E,  $0000,  $0000   ; 5E1A  
        DECLE   $0000,  $0088,  $0088,  $00A8   ; 5E1E  CART PIC #05
        DECLE   $00A8,  $0070,  $0000,  $0000   ; 5E22  
        DECLE   $0000,  $0007,  $0008,  $0006   ; 5E26  CART PIC #06
        DECLE   $0001,  $000E,  $0000,  $0000   ; 5E2A  
        DECLE   $0000,  $0038,  $0040,  $0030   ; 5E2E  CART PIC #07
        DECLE   $0008,  $0070,  $0000,  $0000   ; 5E32  
        DECLE   $0008,  $001C,  $001C,  $001C   ; 5E36  CART PIC #08
        DECLE   $001C,  $0008,  $001C,  $0014   ; 5E3A  
        DECLE   $0000,  $0000,  $001C,  $0012   ; 5E3E  CART PIC #09
        DECLE   $0012,  $0012,  $001C,  $0000   ; 5E42  
        DECLE   $0000,  $0000,  $000E,  $000A   ; 5E46  CART PIC #0A
        DECLE   $000C,  $000A,  $000A,  $0000   ; 5E4A  
        DECLE   $0000,  $0000,  $000E,  $0008   ; 5E4E  CART PIC #0B
        DECLE   $000E,  $0002,  $000E,  $0000   ; 5E52  
        DECLE   $0000,  $00AA,  $00FF,  $00FF   ; 5E56  CART PIC #0C
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 5E5A  
        DECLE   $0000,  $002A,  $007F,  $007F   ; 5E5E  CART PIC #0D
        DECLE   $007F,  $007F,  $00FF,  $0000   ; 5E62  
        DECLE   $0000,  $00AA,  $00BF,  $00BF   ; 5E66  CART PIC #0E
        DECLE   $00BF,  $00BF,  $00FF,  $0000   ; 5E6A  
        DECLE   $0000,  $008A,  $00DF,  $00DF   ; 5E6E  CART PIC #0F
        DECLE   $00DF,  $00DF,  $00FF,  $0000   ; 5E72  
        DECLE   $0000,  $00AA,  $00EF,  $00EF   ; 5E76  CART PIC #10
        DECLE   $00EF,  $00EF,  $00FF,  $0000   ; 5E7A  
        DECLE   $0000,  $00A2,  $00F7,  $00F7   ; 5E7E  CART PIC #11
        DECLE   $00F7,  $00F7,  $00FF,  $0000   ; 5E82  
        DECLE   $0000,  $00AA,  $00FB,  $00FB   ; 5E86  CART PIC #12
        DECLE   $00FB,  $00FB,  $00FF,  $0000   ; 5E8A  
        DECLE   $0000,  $00A8,  $00FD,  $00FD   ; 5E8E  CART PIC #13
        DECLE   $00FD,  $00FD,  $00FF,  $0000   ; 5E92  
        DECLE   $0000,  $00AA,  $00FE,  $00FE   ; 5E96  CART PIC #14
        DECLE   $00FE,  $00FE,  $00FF,  $0000   ; 5E9A  
        DECLE   $008F,  $00CF,  $00EF,  $00FF   ; 5E9E  CART PIC #15
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5EA2  
        DECLE   $00E6,  $00C1,  $00C0,  $0081   ; 5EA6  CART PIC #16
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EAA  
        DECLE   $00FF,  $003F,  $000B,  $0001   ; 5EAE  CART PIC #17
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EB2  
.GRAM_INIT_5EB6:
        DECLE   $002D           ; 5EB6  # of GRAM cards to init
        DECLE   $037B,  $0146   ; 5EB7  #00   :  Algo #1
        DECLE   $0001,  $0380   ; 5EB9  #01-08:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 5EBB  #09-10:  CART #08-0F ----
        DECLE   $0021,  $0380   ; 5EBD  #11-18:  CART #10-17 ----
        DECLE   $0231,  $0040   ; 5EBF  #19-19:  GRAM #18-18 X---
        DECLE   $002F,  $0148   ; 5EC1  #1A-1C:  GRAM #17-19 ---R
        DECLE   $003F,  $0030   ; 5EC3  #1D-1D:  GROM #5F-5F ----
        DECLE   $0069,  $01B0   ; 5EC5  #1E-21:  GROM #74-77 ----
        DECLE   $02C1,  $023A   ; 5EC7  #22   :  Algo #1
        DECLE   $0245,  $0040   ; 5EC9  #23-23:  GRAM #22-22 X---
        DECLE   $0145,  $00C0   ; 5ECB  #24-25:  GRAM #22-23 -Y--
        DECLE   $03F9,  $033C   ; 5ECD  #26   :  4x4 tile
        DECLE   $024D,  $0040   ; 5ECF  #27-27:  GRAM #26-26 X---
        DECLE   $0049,  $00D0   ; 5ED1  #28-29:  GROM #24-25 ----
        DECLE   $022A           ; 5ED3  #2A   :  CART #15    X---
        DECLE   $0201,  $03BA   ; 5ED4  #2B   :  Algo #1
        DECLE   $0081,  $02A2   ; 5ED6  #2C   :  Algo #1

        DECLE   $0040,  $00C0,  $0000,  $0000   ; 5ED8   0040 00C0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EDC   0000 0000 0000 0000
        DECLE   $0060,  $00E0,  $0000,  $0000   ; 5EE0   0060 00E0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EE4   0000 0000 0000 0000
        DECLE   $0040,  $00F0,  $0000,  $0000   ; 5EE8   0040 00F0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 5EF4   0000 0000 0000 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0038   ; 5EFC   0000 0000 0010 0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F00   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0038,  $0010   ; 5F04   0000 0010 0038 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F08   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $003C,  $0018   ; 5F0C   0000 0018 003C 0018
        DECLE   $0000,  $0000,  $0000,  $0010   ; 5F10   0000 0000 0000 0010
        DECLE   $0028,  $007C,  $0038,  $0000   ; 5F14   0028 007C 0038 0000
        DECLE   $0000,  $0000,  $0018,  $0018   ; 5F18   0000 0000 0018 0018
        DECLE   $0024,  $005A,  $00FF,  $007E   ; 5F1C   0024 005A 00FF 007E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F20   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $003C,  $0018   ; 5F24   0000 0010 003C 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F28   0000 0000 0000 0000
        DECLE   $0010,  $0034,  $007E,  $003C   ; 5F2C   0010 0034 007E 003C
        DECLE   $0000,  $0000,  $0000,  $0044   ; 5F30   0000 0000 0000 0044
        DECLE   $00E2,  $00FF,  $007E,  $0000   ; 5F34   00E2 00FF 007E 0000
        DECLE   $0000,  $0020,  $0060,  $00D2   ; 5F38   0000 0020 0060 00D2
        DECLE   $00B1,  $00FF,  $00FF,  $007E   ; 5F3C   00B1 00FF 00FF 007E
        DECLE   $0000,  $0000,  $0000,  $0010   ; 5F40   0000 0000 0000 0010
        DECLE   $005C,  $00FF,  $007E,  $0000   ; 5F44   005C 00FF 007E 0000
        DECLE   $0000,  $0000,  $0010,  $0010   ; 5F48   0000 0000 0010 0010
        DECLE   $0028,  $00B2,  $00FF,  $007E   ; 5F4C   0028 00B2 00FF 007E
        DECLE   $0030,  $0038,  $0074,  $006C   ; 5F50   0030 0038 0074 006C
        DECLE   $00FF,  $00FF,  $00FF,  $007F   ; 5F54   00FF 00FF 00FF 007F
        DECLE   $0000,  $0008,  $0004,  $0004   ; 5F58   0000 0008 0004 0004
        DECLE   $00FF,  $00FF,  $00FE,  $00FC   ; 5F5C   00FF 00FF 00FE 00FC
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5F60   0000 0000 0000 0001
        DECLE   $0001,  $0001,  $0002,  $0013   ; 5F64   0001 0001 0002 0013
        DECLE   $0073,  $0037,  $00FF,  $00FF   ; 5F68   0073 0037 00FF 00FF
        DECLE   $00FF,  $007F,  $007F,  $0000   ; 5F6C   00FF 007F 007F 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F70   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $0080,  $0048   ; 5F74   0000 0080 0080 0048
        DECLE   $008E,  $00EC,  $00FF,  $00FF   ; 5F78   008E 00EC 00FF 00FF
        DECLE   $00FE,  $00FE,  $00FC,  $0000   ; 5F7C   00FE 00FE 00FC 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 5F84   0000 0000 0000 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0010   ; 5F8C   0000 0000 0010 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F90   0000 0000 0000 0000
        DECLE   $0010,  $0010,  $0010,  $0000   ; 5F94   0010 0010 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F98   0000 0000 0000 0000
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5F9C   0010 0010 0010 0010
        DECLE   $002C,  $0052,  $0099,  $00A5   ; 5FA0   002C 0052 0099 00A5
        DECLE   $005A,  $0024,  $0008,  $0010   ; 5FA4   005A 0024 0008 0010
        DECLE   $0000                           ; 5FA8   0000

        RSWD    R4                              ; 5FA9   003C
        SAR     R2,     1                       ; 5FAA   006A
        MOVR    R3,     R7                      ; 5FAB   009F

        DECLE   $00F5,  $005A,  $003C,  $0010   ; 5FAC   00F5 005A 003C 0010
        DECLE   $0000,  $0000,  $0000           ; 5FB0   0000 0000 0000

        RSWD    R4                              ; 5FB3   003C
        SAR     R2,     1                       ; 5FB4   006A
        MOVR    R3,     R7                      ; 5FB5   009F

        DECLE   $00F5,  $005A,  $0089,  $0049   ; 5FB6   00F5 005A 0089 0049
        DECLE   $002A,  $00C9,  $002A,  $001E   ; 5FBA   002A 00C9 002A 001E
        DECLE   $00FD,  $0008,  $0000,  $0008   ; 5FBE   00FD 0008 0000 0008
        DECLE   $000C,  $0018,  $0016,  $0055   ; 5FC2   000C 0018 0016 0055
        DECLE   $002A,  $001C,  $0014,  $0008   ; 5FC6   002A 001C 0014 0008
        DECLE   $0012,  $004A,  $0034,  $002A   ; 5FCA   0012 004A 0034 002A
        DECLE   $005D,  $002E,  $0000,  $0000   ; 5FCE   005D 002E 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0000   ; 5FD2   0000 0018 0018 0000
        DECLE   $0000,  $0000,  $0008,  $000C   ; 5FD6   0000 0000 0008 000C
        DECLE   $001C,  $002A,  $0014,  $003A   ; 5FDA   001C 002A 0014 003A
        DECLE   $001C,  $0014,  $0008,  $005A   ; 5FDE   001C 0014 0008 005A
        DECLE   $0024,  $005E,  $00A9,  $005A   ; 5FE2   0024 005E 00A9 005A
        DECLE   $00B4,  $002C,  $0000,  $0008   ; 5FE6   00B4 002C 0000 0008
        DECLE   $0018,  $0040,  $00C0,  $0008   ; 5FEA   0018 0040 00C0 0008
        DECLE   $0018,  $0000,  $0000,  $0019   ; 5FEE   0018 0000 0000 0019
        DECLE   $0032,  $004A,  $0062,  $0079   ; 5FF2   0032 004A 0062 0079
        DECLE   $008E,  $00A2,  $00B5,  $00C6   ; 5FF6   008E 00A2 00B5 00C6
        DECLE   $00D5,  $00E2,  $00ED,  $00F5   ; 5FFA   00D5 00E2 00ED 00F5
        DECLE   $00FB,  $00FF                   ; 5FFE   00FB 00FF

        SUBR    R0,     R0                      ; 6000   0100
L_6001:
        NEGR    R0                              ; 6001   0020
        ADDI    #$0040, R0                      ; 6002   02F8 0040
L_6004:
        ANDI    #$00FF, R0                      ; 6004   03B8 00FF
        CMPI    #$0080, R0                      ; 6006   0378 0080
        BMI     L_6012                          ; 6008   020B 0008

        SUBI    #$0080, R0                      ; 600A   0338 0080
        PSHR    R5                              ; 600C   0275

        JSR     R5,     L_6012                  ; 600D   0004 0160 0012

        NEGR    R0                              ; 6010   0020
        PULR    R7                              ; 6011   02B7

L_6012:
        PSHR    R5                              ; 6012   0275
        CMPI    #$0040, R0                      ; 6013   0378 0040
        BMI     L_601A                          ; 6015   020B 0003

        SUBI    #$0080, R0                      ; 6017   0338 0080
        NEGR    R0                              ; 6019   0020
L_601A:
        PSHR    R1                              ; 601A   0271
        MOVR    R0,     R1                      ; 601B   0081
        COMR    R1                              ; 601C   0019
        ANDI    #$0003, R1                      ; 601D   03B9 0003
        SAR     R0,     2                       ; 601F   006C
        MOVR    R0,     R5                      ; 6020   0085
        ADDR    R7,     R5                      ; 6021   00FD
        SUBI    #$0032, R5                      ; 6022   033D 0032
        MVI@    R5,     R0                      ; 6024   02A8
        MVI@    R5,     R5                      ; 6025   02AD
        SUBR    R0,     R5                      ; 6026   0105
        SLL     R0,     2                       ; 6027   004C
        ADDR    R1,     R7                      ; 6028   00CF

        ADDR    R5,     R0                      ; 6029   00E8
        ADDR    R5,     R0                      ; 602A   00E8
        ADDR    R5,     R0                      ; 602B   00E8
        SAR     R0,     2                       ; 602C   006C
        PULR    R1                              ; 602D   02B1
        PULR    R7                              ; 602E   02B7

L_602F:
        MVII    #$0003, R3                      ; 602F   02BB 0003
        TSTR    R2                              ; 6031   0092
        BPL     L_6036                          ; 6032   0203 0002

        NEGR    R2                              ; 6034   0022
        DECR    R3                              ; 6035   0013
L_6036:
        TSTR    R1                              ; 6036   0089
        BPL     L_603C                          ; 6037   0203 0003

        NEGR    R1                              ; 6039   0021
        XORI    #$0003, R3                      ; 603A   03FB 0003
L_603C:
        MOVR    R3,     R0                      ; 603C   0098
        ANDI    #$0001, R0                      ; 603D   03B8 0001
        BEQ     L_6044                          ; 603F   0204 0003

        XORR    R1,     R2                      ; 6041   01CA
        XORR    R2,     R1                      ; 6042   01D1
        XORR    R1,     R2                      ; 6043   01CA
L_6044:
        SWAP    R3,     1                       ; 6044   0043
        SAR     R3,     1                       ; 6045   006B
        MOVR    R5,     R7                      ; 6046   00AF

        DECLE   $0000                           ; 6047   0000

        INCR    R5                              ; 6048   000D
        COMR    R1                              ; 6049   0019
        NEGR    R6                              ; 604A   0026
        GSWD    R3                              ; 604B   0033
        SWAP    R0,     1                       ; 604C   0040
        SLL     R2,     2                       ; 604D   004E
        SLLC    R0,     2                       ; 604E   005C
        SAR     R2,     1                       ; 604F   006A
        SARC    R1,     1                       ; 6050   0079
        TSTR    R1                              ; 6051   0089
        MOVR    R3,     R1                      ; 6052   0099
        MOVR    R5,     R3                      ; 6053   00AB
        MOVR    R7,     R6                      ; 6054   00BE
        ADDR    R2,     R2                      ; 6055   00D2
        ADDR    R5,     R0                      ; 6056   00E8
        SUBR    R0,     R0                      ; 6057   0100
        SUBR    R3,     R2                      ; 6058   011A
L_6059:
        CMPR    R1,     R2                      ; 6059   014A
        BGE     L_6068                          ; 605A   020D 000C

        PSHR    R5                              ; 605C   0275
        XORR    R1,     R2                      ; 605D   01CA
        XORR    R2,     R1                      ; 605E   01D1
        XORR    R1,     R2                      ; 605F   01CA
        NEGR    R3                              ; 6060   0023

        JSR     R5,     L_6068                  ; 6061   0004 0160 0068

        SUBI    #$0080, R3                      ; 6064   033B 0080
        NEGR    R3                              ; 6066   0023
        PULR    R7                              ; 6067   02B7

L_6068:
        PSHR    R5                              ; 6068   0275
        PSHR    R3                              ; 6069   0273
        SWAP    R1,     1                       ; 606A   0041

        JSR     R5,     X_DIVR                  ; 606B   0004 011C 01F8

        MOVR    R7,     R5                      ; 606E   00BD
        SUBI    #$0028, R5                      ; 606F   033D 0028
        MOVR    R5,     R3                      ; 6071   00AB
L_6072:
        CMP@    R5,     R0                      ; 6072   0368
        BGE     L_6072                          ; 6073   022D 0002

        SUBI    #$0002, R5                      ; 6075   033D 0002
        SUBR    R5,     R3                      ; 6077   012B
        NEGR    R3                              ; 6078   0023
        MVI@    R5,     R1                      ; 6079   02A9
        MVI@    R5,     R2                      ; 607A   02AA
        SUBR    R1,     R0                      ; 607B   0108
        SUBR    R1,     R2                      ; 607C   010A
        SLL     R0,     2                       ; 607D   004C
        SLL     R0,     1                       ; 607E   0048
        ADDR    R2,     R0                      ; 607F   00D0
        SAR     R0,     1                       ; 6080   0068
        SLL     R3,     2                       ; 6081   004F
        DECR    R3                              ; 6082   0013
L_6083:
        INCR    R3                              ; 6083   000B
        SUBR    R2,     R0                      ; 6084   0110
        BPL     L_6083                          ; 6085   0223 0003

        ADD@    R6,     R3                      ; 6087   02F3
        PULR    R7                              ; 6088   02B7

L_6089:
        PSHR    R5                              ; 6089   0275
        MOVR    R4,     R5                      ; 608A   00A5
        CLRR    R1                              ; 608B   01C9
        TSTR    R2                              ; 608C   0092
        BPL     L_6090                          ; 608D   0203 0001

        DECR    R1                              ; 608F   0011
L_6090:
        SDBD                                    ; 6090   0001
        ADD@    R4,     R2                      ; 6091   02E2
        ADCR    R1                              ; 6092   0029
        ADD@    R4,     R1                      ; 6093   02E1
        PULR    R7                              ; 6094   02B7

L_6095:
        PSHR    R5                              ; 6095   0275

L_6096:
        JSR     R5,     X_PLAY_SFX2             ; 6096   0004 0118 03BE
        DECLE   $0071                           ; 6099  SFX prio
        DECLE   $0255                           ; 609A  SFX data
        DECLE   $0077,  $00AF,  $0060           ; 609B  SFX data
        DECLE   $021D                           ; 609E  SFX data
        DECLE   $0200,  $0040                   ; 609F  SFX data
        DECLE   $0077,  $00BC,  $0060           ; 60A1  SFX data
        DECLE   $0062                           ; 60A4  SFX data
        DECLE   $016B                           ; 60A5  SFX data
        DECLE   $0002                           ; 60A6  SFX data
        DECLE   $0005                           ; 60A7  SFX data
        DECLE   $0143,  $03DC                   ; 60A8  SFX data
        DECLE   $008F,  $003F                   ; 60AA  SFX data
        DECLE   $01CF                           ; 60AC  SFX end


        B       L_6096                          ; 60AD   0220 0018

UC_60AF:
        MVI     G_017A, R0                      ; 60AF  SLIB UCALL target
        ANDI    #$0001, R0                      ; 60B1   03B8 0001
        BEQ     L_60B7                          ; 60B3   0204 0002

        ADDI    #$000C, R4                      ; 60B5   02FC 000C
L_60B7:
        MVII    #$000E, R0                      ; 60B7   02B8 000E
        MVO     R0,     G_017B                  ; 60B9   0240 017B
        PULR    R7                              ; 60BB   02B7

UC_60BC:
        MVI     G_017B, R0                      ; 60BC  SLIB UCALL target
        SUBI    #$0002, R0                      ; 60BE   0338 0002
        MVO     R0,     G_017B                  ; 60C0   0240 017B
        ADDI    #$000B, R3                      ; 60C2   02FB 000B
        MVO@    R0,     R3                      ; 60C4   0258
        PULR    R7                              ; 60C5   02B7

L_60C6:
        PSHR    R5                              ; 60C6   0275

        JSR     R5,     X_PLAY_SFX1             ; 60C7   0004 0118 03BB
        DECLE   $0389                           ; 60CA  SFX data
        DECLE   $0050,  $0000                   ; 60CB  SFX data
        DECLE   $0058,  $0008                   ; 60CD  SFX data
        DECLE   $0054,  $0010                   ; 60CF  SFX data
        DECLE   $001C,  $0000                   ; 60D1  SFX data
        DECLE   $038B                           ; 60D3  SFX data
        DECLE   $008F,  $004F                   ; 60D4  SFX data
        DECLE   $02CF                           ; 60D6  SFX end

L_60D7:
        PSHR    R5                              ; 60D7   0275

        JSR     R5,     X_PLAY_SFX1             ; 60D8   0004 0118 03BB
        DECLE   $0009                           ; 60DB  SFX data
        DECLE   $0060,  $0200                   ; 60DC  SFX data
        DECLE   $0068,  $0200                   ; 60DE  SFX data
        DECLE   $0064,  $0200                   ; 60E0  SFX data
        DECLE   $030D                           ; 60E2  SFX data
        DECLE   $03FC,  $03FF                   ; 60E3  SFX data
        DECLE   $000B                           ; 60E5  SFX data
        DECLE   $03CF                           ; 60E6  SFX end

L_60E7:
        PSHR    R5                              ; 60E7   0275

        JSR     R5,     X_PLAY_SFX1             ; 60E8   0004 0118 03BB
        DECLE   $0279                           ; 60EB  SFX data
        DECLE   $007C,  $0000                   ; 60EC  SFX data
        DECLE   $018D                           ; 60EE  SFX data
        DECLE   $01B7                           ; 60EF  SFX data
        DECLE   $000F,  $03FD                   ; 60F0  SFX data
        DECLE   $000B                           ; 60F2  SFX data
        DECLE   $008F,  $0027                   ; 60F3  SFX data
        DECLE   $02CF                           ; 60F5  SFX end

L_60F6:
        PSHR    R5                              ; 60F6   0275

        JSR     R5,     X_PLAY_SFX1             ; 60F7   0004 0118 03BB
        DECLE   $0079                           ; 60FA  SFX data
        DECLE   $03F5                           ; 60FB  SFX data
        DECLE   $03ED                           ; 60FC  SFX data
        DECLE   $008F,  $001F                   ; 60FD  SFX data
        DECLE   $03FE                           ; 60FF  SFX data
        DECLE   $000F,  $03FF                   ; 6100  SFX data
        DECLE   $008F,  $0027                   ; 6102  SFX data
        DECLE   $02CF                           ; 6104  SFX end

L_6105:
        PSHR    R5                              ; 6105   0275

        JSR     R5,     X_PLAY_SFX1             ; 6106   0004 0118 03BB
        DECLE   $0279                           ; 6109  SFX data
        DECLE   $03B5                           ; 610A  SFX data
        DECLE   $03FE                           ; 610B  SFX data
        DECLE   $02AD                           ; 610C  SFX data
        DECLE   $000F,  $0001                   ; 610D  SFX data
        DECLE   $008F,  $003F                   ; 610F  SFX data
        DECLE   $02CF                           ; 6111  SFX end

L_6112:
        PSHR    R5                              ; 6112   0275

        JSR     R5,     X_PLAY_SFX1             ; 6113   0004 0118 03BB
        DECLE   $03F9                           ; 6116  SFX data
        DECLE   $008F,  $0025                   ; 6117  SFX data
        DECLE   $0079                           ; 6119  SFX data
        DECLE   $02F5                           ; 611A  SFX data
        DECLE   $0003,  $0004                   ; 611B  SFX data
        DECLE   $0375                           ; 611D  SFX data
        DECLE   $0003,  $0004                   ; 611E  SFX data
        DECLE   $03F5                           ; 6120  SFX data
        DECLE   $03FE                           ; 6121  SFX data
        DECLE   $004F,  $0028                   ; 6122  SFX data
        DECLE   $030D                           ; 6124  SFX data
        DECLE   $0007                           ; 6125  SFX data
        DECLE   $0043,  $03F0                   ; 6126  SFX data
        DECLE   $02CF                           ; 6128  SFX end

L_6129:
        PSHR    R5                              ; 6129   0275
        MVI     G_01C4, R0                      ; 612A   0280 01C4
        SUBI    #$0003, R0                      ; 612C   0338 0003
        BMI     L_615C                          ; 612E   020B 002C

        MVI     G_0356, R1                      ; 6130   0281 0356
        TSTR    R1                              ; 6132   0089
        BNEQ    L_615C                          ; 6133   020C 0027

        MVI     G_01C5, R1                      ; 6135   0281 01C5
        SUBI    #$0003, R1                      ; 6137   0339 0003
        BMI     L_615C                          ; 6139   020B 0021

        MVO     R0,     G_01C4                  ; 613B   0240 01C4
        MVO     R1,     G_01C5                  ; 613D   0241 01C5
        MVII    #$00BD, R0                      ; 613F   02B8 00BD
        MVO     R0,     G_01C1                  ; 6141   0240 01C1
        SDBD                                    ; 6143   0001
        MVII    #$1A33, R0                      ; 6144   02B8 0033 001A
        MVII    #$0355, R4                      ; 6147   02BC 0355
        MVO@    R0,     R4                      ; 6149   0260
        SDBD                                    ; 614A   0001
        MVII    #$62E7, R0                      ; 614B   02B8 00E7 0062
        MVO@    R0,     R4                      ; 614E   0260
        MVII    #$0066, R0                      ; 614F   02B8 0066
        SWAP    R0,     1                       ; 6151   0040
        MVO@    R0,     R4                      ; 6152   0260
        MVII    #$003C, R0                      ; 6153   02B8 003C
        SWAP    R0,     1                       ; 6155   0040
        MVO@    R0,     R4                      ; 6156   0260
        CLRR    R0                              ; 6157   01C0
        MVO@    R0,     R4                      ; 6158   0260
        MVII    #$0001, R0                      ; 6159   02B8 0001
        MVO@    R0,     R4                      ; 615B   0260
L_615C:
        MVI     G_0354, R0                      ; 615C   0280 0354
        DECR    R0                              ; 615E   0010
        MVO     R0,     G_0354                  ; 615F   0240 0354
        BPL     L_61A6                          ; 6161   0203 0043

        MVII    #$02BC, R0                      ; 6163   02B8 02BC
        MVO     R0,     G_0354                  ; 6165   0240 0354
        MVI     G_01C3, R0                      ; 6167   0280 01C3
        DECR    R0                              ; 6169   0010
        BMI     L_61A6                          ; 616A   020B 003A

        MVO     R0,     G_01C3                  ; 616C   0240 01C3
        MVII    #$0002, R0                      ; 616E   02B8 0002
L_6170:
        MOVR    R0,     R2                      ; 6170   0082
        ADDI    #$01BE, R2                      ; 6171   02FA 01BE
        MVI@    R2,     R3                      ; 6173   0293
        SWAP    R3,     2                       ; 6174   0047
        BPL     L_617A                          ; 6175   0203 0003

        DECR    R0                              ; 6177   0010
        BPL     L_6170                          ; 6178   0223 0009

L_617A:
        MVII    #$00D4, R4                      ; 617A   02BC 00D4
        MVI     G_01C6, R3                      ; 617C   0283 01C6
        CMPI    #$0002, R3                      ; 617E   037B 0002
        BGT     L_6184                          ; 6180   020E 0002

        MVII    #$00C8, R4                      ; 6182   02BC 00C8
L_6184:
        MVO@    R4,     R2                      ; 6184   0254
        SLL     R0,     2                       ; 6185   004C
        SLL     R0,     1                       ; 6186   0048
        MOVR    R0,     R4                      ; 6187   0084
        ADDI    #$033D, R4                      ; 6188   02FC 033D
        SDBD                                    ; 618A   0001
        MVII    #$1A23, R0                      ; 618B   02B8 0023 001A
        MVO@    R0,     R4                      ; 618E   0260
        SDBD                                    ; 618F   0001
        MVII    #$62E7, R0                      ; 6190   02B8 00E7 0062
        MVO@    R0,     R4                      ; 6193   0260
        MVII    #$0012, R0                      ; 6194   02B8 0012
        SWAP    R0,     1                       ; 6196   0040
        MVO@    R0,     R4                      ; 6197   0260
        MVII    #$0005, R0                      ; 6198   02B8 0005

        JSR     R5,     X_RAND1                 ; 619A   0004 0114 027D

        ADDI    #$0048, R0                      ; 619D   02F8 0048
        SWAP    R0,     1                       ; 619F   0040
        MVO@    R0,     R4                      ; 61A0   0260
        CLRR    R0                              ; 61A1   01C0
        MVO@    R0,     R4                      ; 61A2   0260
        MVII    #$0001, R0                      ; 61A3   02B8 0001
        MVO@    R0,     R4                      ; 61A5   0260
L_61A6:
        MVII    #$031D, R3                      ; 61A6   02BB 031D
        MVII    #$0003, R0                      ; 61A8   02B8 0003
        MVII    #$0010, R4                      ; 61AA   02BC 0010
        COMR    R4                              ; 61AC   001C
L_61AD:
        MVI@    R3,     R2                      ; 61AD   029A
        ANDR    R4,     R2                      ; 61AE   01A2
        MVO@    R2,     R3                      ; 61AF   025A
        ADDI    #$0008, R3                      ; 61B0   02FB 0008
        DECR    R0                              ; 61B2   0010
        BPL     L_61AD                          ; 61B3   0223 0007

        MVI     G_01C2, R0                      ; 61B5   0280 01C2

        JSR     R5,     .EXEC.76C               ; 61B7   0004 0114 036C

        MVI@    R1,     R2                      ; 61BA   028A
        COMR    R4                              ; 61BB   001C
        XORR    R4,     R2                      ; 61BC   01E2
        MVO@    R2,     R1                      ; 61BD   024A
        MVII    #$031E, R1                      ; 61BE   02B9 031E
L_61C0:
        MVI@    R1,     R2                      ; 61C0   028A
        TSTR    R2                              ; 61C1   0092
        BNEQ    L_61E8                          ; 61C2   020C 0024

        ADDI    #$0008, R1                      ; 61C4   02F9 0008
        CMPI    #$0336, R1                      ; 61C6   0379 0336
        BLE     L_61C0                          ; 61C8   0226 0009

L_61CA:
        CLRR    R0                              ; 61CA   01C0
        MVO     R0,     G_0359                  ; 61CB   0240 0359
        MVO     R0,     G_035B                  ; 61CD   0240 035B
        MVO     R0,     G_0351                  ; 61CF   0240 0351
        MVO     R0,     G_0353                  ; 61D1   0240 0353
        SDBD                                    ; 61D3   0001
        MVII    #$1AD0, R0                      ; 61D4   02B8 00D0 001A
        ADD     G_01C6, R0                      ; 61D7   02C0 01C6
        MVO     R0,     .BTAB.D9                ; 61D9   0240 02D9
        ADDI    #$0008, R0                      ; 61DB   02F8 0008
        MVO     R0,     .BTAB.C5                ; 61DD   0240 02C5
        ADDI    #$0008, R0                      ; 61DF   02F8 0008
        MVO     R0,     .BTAB.ED                ; 61E1   0240 02ED

        JSR     R5,     L_60D7                  ; 61E3   0004 0160 00D7

        B       L_626C                          ; 61E6   0200 0084

L_61E8:
        CLRR    R1                              ; 61E8   01C9
        CLRR    R4                              ; 61E9   01E4
L_61EA:
        PSHR    R1                              ; 61EA   0271
        MOVR    R1,     R2                      ; 61EB   008A
        ADDI    #$01BE, R2                      ; 61EC   02FA 01BE
        MVI@    R2,     R3                      ; 61EE   0293
        SWAP    R3,     2                       ; 61EF   0047
        BPL     L_620A                          ; 61F0   0203 0018

        INCR    R4                              ; 61F2   000C
        SDBD                                    ; 61F3   0001
        MVII    #$663C, R2                      ; 61F4   02BA 003C 0066
        ANDI    #$0001, R3                      ; 61F7   03BB 0001
        BEQ     L_61FF                          ; 61F9   0204 0004

        SDBD                                    ; 61FB   0001
        MVII    #$8E5C, R2                      ; 61FC   02BA 005C 008E
L_61FF:
        MOVR    R1,     R0                      ; 61FF   0088
        ADDI    #$0004, R0                      ; 6200   02F8 0004
        MVII    #$0006, R3                      ; 6202   02BB 0006
        SUB     G_01C6, R3                      ; 6204   0303 01C6
        SLL     R3,     1                       ; 6206   004B

        JSR     R5,     .EXEC.9B9               ; 6207   0004 0118 01B9

L_620A:
        PULR    R1                              ; 620A   02B1
        INCR    R1                              ; 620B   0009
        CMPI    #$0003, R1                      ; 620C   0379 0003
        BLE     L_61EA                          ; 620E   0226 0025

        TSTR    R4                              ; 6210   00A4
        BNEQ    L_6217                          ; 6211   020C 0004

        ADD     G_01C3, R4                      ; 6213   02C4 01C3
        BEQ     L_6218                          ; 6215   0204 0001
L_6217:
        PULR    R7                              ; 6217   02B7

L_6218:
        SDBD                                    ; 6218   0001
        MVII    #$1200, R3                      ; 6219   02BB 0000 0012
        MVII    #$02E1, R4                      ; 621C   02BC 02E1

        JSR     R5,     X_PRINT_R5              ; 621E   0004 0118 007B
        STRING  "ALL CLEAR!"                    ; 6221  
        DECLE   $0000                           ; 622B   0000

        MVI     G_01C6, R0                      ; 622C   0280 01C6
        TSTR    R0                              ; 622E   0080
        BNEQ    L_624B                          ; 622F   020C 001A

        SDBD                                    ; 6231   0001
        MVII    #$1200, R3                      ; 6232   02BB 0000 0012
        MVII    #$02CA, R4                      ; 6235   02BC 02CA

        JSR     R5,     X_PRINT_R5              ; 6237   0004 0118 007B
        STRING  "CONGRATULATIONS!"              ; 623A  
        DECLE   $0000                           ; 624A   0000
L_624B:
        SDBD                                    ; 624B   0001
        MVII    #$1023, R0                      ; 624C   02B8 0023 0010
        MVII    #$0355, R4                      ; 624F   02BC 0355
        MVO@    R0,     R4                      ; 6251   0260
        SDBD                                    ; 6252   0001
        MVII    #$515F, R0                      ; 6253   02B8 005F 0051
        MVO@    R0,     R4                      ; 6256   0260
        MVII    #$0068, R0                      ; 6257   02B8 0068
        SWAP    R0,     1                       ; 6259   0040
        MVO@    R0,     R4                      ; 625A   0260
        MVII    #$003C, R0                      ; 625B   02B8 003C
        SWAP    R0,     1                       ; 625D   0040
        MVO@    R0,     R4                      ; 625E   0260
        SDBD                                    ; 625F   0001
        MVII    #$E00D, R0                      ; 6260   02B8 000D 00E0
        MVO@    R0,     R4                      ; 6263   0260
        CLRR    R0                              ; 6264   01C0
        MVO@    R0,     R4                      ; 6265   0260
        MVII    #$0148, R0                      ; 6266   02B8 0148
        MVO@    R0,     R4                      ; 6268   0260

        JSR     R5,     L_63C4                  ; 6269   0004 0160 03C4

L_626C:
        MVII    #$0002, R0                      ; 626C   02B8 0002
        MVO     R0,     G_01C7                  ; 626E   0240 01C7
        MVII    #$0321, R4                      ; 6270   02BC 0321
        CLRR    R0                              ; 6272   01C0
L_6273:
        MVO@    R0,     R4                      ; 6273   0260
        INCR    R4                              ; 6274   000C
        MVO@    R0,     R4                      ; 6275   0260
        ADDI    #$0005, R4                      ; 6276   02FC 0005
        CMPI    #$0351, R4                      ; 6278   037C 0351
        BLT     L_6273                          ; 627A   0225 0008

        SDBD                                    ; 627C   0001
        MVII    #$1906, R0                      ; 627D   02B8 0006 0019
        MVO     R0,     G_035D                  ; 6280   0240 035D
        PULR    R7                              ; 6282   02B7

        DECLE   $00BE,  $0062,  $008D,  $0062   ; 6283   00BE 0062 008D 0062
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6287   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 628B   0000 0000

        PSHR    R5                              ; 628D   0275
        TSTR    R0                              ; 628E   0080
        BEQ     L_62A1                          ; 628F   0204 0010

        CMPI    #$000A, R0                      ; 6291   0378 000A
        BLT     L_62A0                          ; 6293   0205 000B
        BEQ     L_62AA                          ; 6295   0204 0013

        CLRR    R2                              ; 6297   01D2
L_6298:
        MVI     G_01C2, R0                      ; 6298   0280 01C2

        JSR     R5,     .EXEC.76C               ; 629A   0004 0114 036C

        ADDI    #$0004, R1                      ; 629D   02F9 0004
        MVO@    R2,     R1                      ; 629F   024A
L_62A0:
        PULR    R7                              ; 62A0   02B7

L_62A1:
        MVO     R0,     G_0321                  ; 62A1   0240 0321
        MVO     R0,     G_0329                  ; 62A3   0240 0329
        MVO     R0,     G_0331                  ; 62A5   0240 0331
        MVO     R0,     G_0339                  ; 62A7   0240 0339
        PULR    R7                              ; 62A9   02B7

L_62AA:
        MVI     G_01C2, R1                      ; 62AA   0281 01C2
        MVII    #$0003, R0                      ; 62AC   02B8 0003
L_62AE:
        INCR    R1                              ; 62AE   0009
        ANDI    #$0003, R1                      ; 62AF   03B9 0003
        MOVR    R1,     R2                      ; 62B1   008A
        ADDI    #$01BA, R2                      ; 62B2   02FA 01BA
        MVI@    R2,     R2                      ; 62B4   0292
        SWAP    R2,     2                       ; 62B5   0046
        BPL     L_62BB                          ; 62B6   0203 0003

        DECR    R0                              ; 62B8   0010
        BPL     L_62AE                          ; 62B9   0223 000C

L_62BB:
        MVO     R1,     G_01C2                  ; 62BB   0241 01C2
        PULR    R7                              ; 62BD   02B7

        PSHR    R5                              ; 62BE   0275
        MOVR    R0,     R1                      ; 62BF   0081
        BMI     L_62A0                          ; 62C0   022B 0021

        JSR     R5,     .EXEC.628               ; 62C2   0004 0114 0228

        INCR    R2                              ; 62C5   000A
        MOVR    R0,     R2                      ; 62C6   0082
        B       L_6298                          ; 62C7   0220 0030

        PSHR    R5                              ; 62C9   0275
        MOVR    R0,     R2                      ; 62CA   0082
        ADDI    #$01BA, R2                      ; 62CB   02FA 01BA
        MVI@    R2,     R3                      ; 62CD   0293
        ANDI    #$0001, R3                      ; 62CE   03BB 0001
        BNEQ    L_61CA                          ; 62D0   022C 0107

        MVI@    R2,     R3                      ; 62D2   0293
        CLRR    R4                              ; 62D3   01E4
        MVO@    R4,     R2                      ; 62D4   0254
        INCR    R1                              ; 62D5   0009
        MVO@    R4,     R1                      ; 62D6   024C
        SLR     R3,     2                       ; 62D7   0067
        MOVR    R3,     R2                      ; 62D8   009A
        ANDI    #$0003, R2                      ; 62D9   03BA 0003
        SLR     R3,     2                       ; 62DB   0067
        ANDI    #$0007, R3                      ; 62DC   03BB 0007
        ADD     G_01C4, R2                      ; 62DE   02C2 01C4
        MVO     R2,     G_01C4                  ; 62E0   0242 01C4
        ADD     G_01C5, R3                      ; 62E2   02C3 01C5
        MVO     R3,     G_01C5                  ; 62E4   0243 01C5
        PULR    R7                              ; 62E6   02B7

        DECLE   $0300,  $0000,  $00C9,  $0062   ; 62E7   0300 0000 00C9 0062
        DECLE   $0001,  $0000                   ; 62EB   0001 0000

        INCR    R0                              ; 62ED   0008
        SWAP    R3,     1                       ; 62EE   0043
        RLC     R2,     1                       ; 62EF   0052
        SWAP    R3,     1                       ; 62F0   0043
        CMPR    R2,     R2                      ; 62F1   0152
        MVO     R3,     G_0052                  ; 62F2   0243 0052
        MVO     R3,     G_0152                  ; 62F4   0243 0152
.START:
        PSHR    R5                              ; 62F6   0275
        MVII    #$0088, R2                      ; 62F7   02BA 0088
        MVII    #$0058, R1                      ; 62F9   02B9 0058
        MVII    #$01AA, R4                      ; 62FB   02BC 01AA
L_62FD:
        MVO@    R2,     R4                      ; 62FD   0262
        MVO@    R1,     R4                      ; 62FE   0261
        SUBI    #$0004, R1                      ; 62FF   0339 0004
        CMPI    #$01B2, R4                      ; 6301   037C 01B2
        BLT     L_62FD                          ; 6303   0225 0007

        MVII    #$0006, R0                      ; 6305   02B8 0006
        MVO     R0,     G_01C3                  ; 6307   0240 01C3
        MVII    #$0009, R0                      ; 6309   02B8 0009
        MVO     R0,     G_0115                  ; 630B   0240 0115
        MVII    #$0003, R0                      ; 630D   02B8 0003
        MVO     R0,     G_01C4                  ; 630F   0240 01C4
        MVII    #$0004, R0                      ; 6311   02B8 0004
        MVO     R0,     G_0103                  ; 6313   0240 0103
        MVO     R0,     G_0354                  ; 6315   0240 0354
        MVO     R0,     G_01CA                  ; 6317   0240 01CA
        MVII    #$0100, R4                      ; 6319   02BC 0100
        SDBD                                    ; 631B   0001
        MVI@    R4,     R0                      ; 631C   02A0
        MVO     R0,     G_035C                  ; 631D   0240 035C
        MVII    #$003C, R0                      ; 631F   02B8 003C
        MVO     R0,     G_0119                  ; 6321   0240 0119
        MVII    #$0067, R0                      ; 6323   02B8 0067
        MVO     R0,     G_0118                  ; 6325   0240 0118
        MVII    #$0019, R0                      ; 6327   02B8 0019
        MVO     R0,     G_0117                  ; 6329   0240 0117
        MVII    #$0092, R0                      ; 632B   02B8 0092
        MVO     R0,     G_0116                  ; 632D   0240 0116
        B       L_6360                          ; 632F   0200 002F

L_6331:
        MVI     G_01C8, R1                      ; 6331   0281 01C8
        ADDI    #$01BA, R1                      ; 6333   02F9 01BA
        MVII    #$0080, R2                      ; 6335   02BA 0080
        MVO@    R2,     R1                      ; 6337   024A
        MVII    #$000C, R0                      ; 6338   02B8 000C
L_633A:
        MVO     R0,     G_01CA                  ; 633A   0240 01CA
        CLRR    R0                              ; 633C   01C0
        CLRR    R1                              ; 633D   01C9
        MVI     G_0170, R2                      ; 633E   0282 0170
        MVII    #$01A0, R4                      ; 6340   02BC 01A0
L_6342:
        MVI@    R4,     R3                      ; 6342   02A3
        ANDI    #$0001, R3                      ; 6343   03BB 0001
        MOVR    R2,     R5                      ; 6345   0095
        ANDI    #$0001, R5                      ; 6346   03BD 0001
        BEQ     L_634E                          ; 6348   0204 0004

        ADDR    R3,     R0                      ; 634A   00D8
        XORI    #$0001, R3                      ; 634B   03FB 0001
        ADDR    R3,     R1                      ; 634D   00D9
L_634E:
        SLR     R2,     1                       ; 634E   0062
        BNEQ    L_6342                          ; 634F   022C 000E

        MVI     G_01C9, R3                      ; 6351   0283 01C9
        ADDI    #$01BA, R3                      ; 6353   02FB 01BA
        SLL     R0,     2                       ; 6355   004C
        SLL     R1,     2                       ; 6356   004D
        SLL     R1,     2                       ; 6357   004D
        ADDR    R1,     R0                      ; 6358   00C8
        BEQ     L_635F                          ; 6359   0204 0004

        MVI@    R3,     R2                      ; 635B   029A
        ANDI    #$0083, R2                      ; 635C   03BA 0083
        ADDR    R2,     R0                      ; 635E   00D0
L_635F:
        MVO@    R0,     R3                      ; 635F   0258
L_6360:
        MVI     G_0354, R3                      ; 6360   0283 0354
        MVII    #$003F, R0                      ; 6362   02B8 003F
        MVII    #$031D, R4                      ; 6364   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; 6366   0004 0114 0338

        MVO     R3,     G_0354                  ; 6369   0243 0354
        MVII    #$003E, R0                      ; 636B   02B8 003E
        MVO     R0,     .PSG0.chan_enable       ; 636D   0240 01F8
        MVO     R0,     G_017A                  ; 636F   0240 017A
        CLRR    R0                              ; 6371   01C0
        MVO     R0,     G_01C7                  ; 6372   0240 01C7

        JSR     R5,     L_51D7                  ; 6374   0004 0150 01D7

        MVII    #$01AA, R5                      ; 6377   02BD 01AA
        MVII    #$031D, R4                      ; 6379   02BC 031D
        MVII    #$01BA, R3                      ; 637B   02BB 01BA
L_637D:
        PSHR    R5                              ; 637D   0275
        MVII    #$0001, R5                      ; 637E   02BD 0001
        SDBD                                    ; 6380   0001
        MVII    #$1A23, R0                      ; 6381   02B8 0023 001A
        SDBD                                    ; 6384   0001
        MVII    #$62E7, R1                      ; 6385   02B9 00E7 0062
        MVI@    R3,     R2                      ; 6388   029A
        PSHR    R2                              ; 6389   0272
        ANDI    #$0001, R2                      ; 638A   03BA 0001
        BEQ     L_6390                          ; 638C   0204 0002

        XORI    #$0010, R0                      ; 638E   03F8 0010
L_6390:
        PULR    R2                              ; 6390   02B2
        CMPI    #$033D, R4                      ; 6391   037C 033D
        BGE     L_639E                          ; 6393   020D 0009

        INCR    R5                              ; 6395   000D
        XORI    #$0204, R0                      ; 6396   03F8 0204
        SDBD                                    ; 6398   0001
        MVII    #$5141, R1                      ; 6399   02B9 0041 0051
        XORI    #$0080, R2                      ; 639C   03FA 0080
L_639E:
        SWAP    R2,     2                       ; 639E   0046
        BMI     L_63A2                          ; 639F   020B 0001

        CLRR    R1                              ; 63A1   01C9
L_63A2:
        MVO@    R0,     R4                      ; 63A2   0260
        MOVR    R5,     R0                      ; 63A3   00A8
        PULR    R5                              ; 63A4   02B5
        MVO@    R1,     R4                      ; 63A5   0261
        MVI@    R5,     R2                      ; 63A6   02AA
        SWAP    R2,     1                       ; 63A7   0042
        MVO@    R2,     R4                      ; 63A8   0262
        MVI@    R5,     R2                      ; 63A9   02AA
        SWAP    R2,     1                       ; 63AA   0042
        MVO@    R2,     R4                      ; 63AB   0262
        CLRR    R2                              ; 63AC   01D2
        MVO@    R2,     R4                      ; 63AD   0262
        MVO@    R0,     R4                      ; 63AE   0260
        MVO@    R2,     R4                      ; 63AF   0262
        INCR    R3                              ; 63B0   000B
        INCR    R4                              ; 63B1   000C
        CMPI    #$0355, R4                      ; 63B2   037C 0355
        BLE     L_637D                          ; 63B4   0226 0038

        SDBD                                    ; 63B6   0001
        MVII    #$6283, R0                      ; 63B7   02B8 0083 0062
        MVO     R0,     G_035D                  ; 63BA   0240 035D
        MVI     G_035C, R0                      ; 63BC   0280 035C
        MVO     R0,     .ISRVEC.0               ; 63BE   0240 0100
        SWAP    R0,     1                       ; 63C0   0040
        MVO     R0,     .ISRVEC.1               ; 63C1   0240 0101
        PULR    R7                              ; 63C3   02B7

L_63C4:
        PSHR    R5                              ; 63C4   0275

        JSR     R5,     L_6574                  ; 63C5   0004 0164 0174
        DECLE   $0078,  $00C8,  $000C,  $0008   ; 63C8   0078 00C8 000C 0008
        DECLE   $0008,  $00CC,  $00C9,  $027E   ; 63CC   0008 00CC 00C9 027E
        DECLE   $0008,  $0078,  $00C8,  $000C   ; 63D0   0008 0078 00C8 000C
        DECLE   $0008,  $0008,  $00FD,  $00CA   ; 63D4   0008 0008 00FD 00CA
        DECLE   $01FE,  $0008,  $0078,  $000C   ; 63D8   01FE 0008 0078 000C
        DECLE   $0008,  $00CD,  $007A,  $02BE   ; 63DC   0008 00CD 007A 02BE
        DECLE   $0008,  $00C8,  $000C,  $0008   ; 63E0   0008 00C8 000C 0008
        DECLE   $00FC,  $00C9,  $027E,  $0008   ; 63E4   00FC 00C9 027E 0008
        DECLE   $00C8,  $00F8,  $000C,  $0008   ; 63E8   00C8 00F8 000C 0008
        DECLE   $0008,  $013D,  $00CA,  $01FE   ; 63EC   0008 013D 00CA 01FE
        DECLE   $0008,  $0078,  $000C,  $0008   ; 63F0   0008 0078 000C 0008
        DECLE   $00FD,  $007A,  $02BE,  $0008   ; 63F4   00FD 007A 02BE 0008
        DECLE   $00C8,  $000C,  $0008,  $013C   ; 63F8   00C8 000C 0008 013C
        DECLE   $00A9,  $027E,  $0008,  $00F8   ; 63FC   00A9 027E 0008 00F8
        DECLE   $0138,  $000C,  $0008,  $0008   ; 6400   0138 000C 0008 0008
        DECLE   $016D,  $00AA,  $022E,  $0008   ; 6404   016D 00AA 022E 0008
        DECLE   $0078,  $000C,  $0008,  $00AD   ; 6408   0078 000C 0008 00AD
        DECLE   $007A,  $02EE,  $0008,  $00A8   ; 640C   007A 02EE 0008 00A8
        DECLE   $000C,  $0008,  $00FC,  $00F9   ; 6410   000C 0008 00FC 00F9
        DECLE   $027E,  $0008,  $00A8,  $00F8   ; 6414   027E 0008 00A8 00F8
        DECLE   $000C,  $0008,  $0008,  $03F6   ; 6418   000C 0008 0008 03F6
        DECLE   $013E,  $00FA,  $022E,  $0008   ; 641C   013E 00FA 022E 0008
        DECLE   $00A8,  $000C,  $0008,  $00AA   ; 6420   00A8 000C 0008 00AA
        DECLE   $02EE,  $0008,  $00F8,  $000C   ; 6424   02EE 0008 00F8 000C
        DECLE   $0008,  $00F9,  $027E,  $000C   ; 6428   0008 00F9 027E 000C
        DECLE   $0008,  $00FA,  $022E,  $0008   ; 642C   0008 00FA 022E 0008
        DECLE   $00A8,  $000C,  $0008,  $00AA   ; 6430   00A8 000C 0008 00AA
        DECLE   $02EE,  $0008,  $00A8,  $00F8   ; 6434   02EE 0008 00A8 00F8
        DECLE   $000C,  $0008,  $0008,  $00FC   ; 6438   000C 0008 0008 00FC
        DECLE   $00F9,  $027E,  $0008,  $00A8   ; 643C   00F9 027E 0008 00A8
        DECLE   $00F8,  $000C,  $0008,  $0008   ; 6440   00F8 000C 0008 0008
        DECLE   $013D,  $00FA,  $022E,  $0008   ; 6444   013D 00FA 022E 0008
        DECLE   $00A8,  $000C,  $0008,  $00FD   ; 6448   00A8 000C 0008 00FD
        DECLE   $00AA,  $02EE,  $0008,  $00F8   ; 644C   00AA 02EE 0008 00F8
        DECLE   $000C,  $0008,  $013C,  $00F9   ; 6450   000C 0008 013C 00F9
        DECLE   $027E,  $0008,  $00F8,  $0138   ; 6454   027E 0008 00F8 0138
        DECLE   $000C,  $0008,  $0008,  $016D   ; 6458   000C 0008 0008 016D
        DECLE   $00FA,  $022E,  $0008,  $00A8   ; 645C   00FA 022E 0008 00A8
        DECLE   $000C,  $0008,  $013D,  $00AA   ; 6460   000C 0008 013D 00AA
        DECLE   $02EE,  $0008,  $00F8,  $000C   ; 6464   02EE 0008 00F8 000C
        DECLE   $0008,  $016C,  $00E9,  $026E   ; 6468   0008 016C 00E9 026E
        DECLE   $0008,  $0138,  $0168,  $000C   ; 646C   0008 0138 0168 000C
        DECLE   $0008,  $0008,  $01AD,  $007A   ; 6470   0008 0008 01AD 007A
        DECLE   $01FE,  $0008,  $0078,  $000C   ; 6474   01FE 0008 0078 000C
        DECLE   $0008,  $00ED,  $007A,  $032E   ; 6478   0008 00ED 007A 032E
        DECLE   $0008,  $00E8,  $000C,  $0008   ; 647C   0008 00E8 000C 0008
        DECLE   $013C,  $0139,  $026E,  $0008   ; 6480   013C 0139 026E 0008
        DECLE   $00E8,  $0138,  $000C,  $0008   ; 6484   00E8 0138 000C 0008
        DECLE   $0008,  $03F6,  $017E,  $007A   ; 6488   0008 03F6 017E 007A
        DECLE   $01FE,  $0008,  $0078,  $000C   ; 648C   01FE 0008 0078 000C
        DECLE   $0008,  $007A,  $02BE,  $0008   ; 6490   0008 007A 02BE 0008
        DECLE   $00E8,  $000C,  $0008,  $0139   ; 6494   00E8 000C 0008 0139
        DECLE   $026E,  $000C,  $0008,  $007A   ; 6498   026E 000C 0008 007A
        DECLE   $01FE,  $0008,  $0078,  $000C   ; 649C   01FE 0008 0078 000C
        DECLE   $0008,  $007A,  $02BE,  $0008   ; 64A0   0008 007A 02BE 0008
        DECLE   $0078,  $00E8,  $000C,  $0008   ; 64A4   0078 00E8 000C 0008
        DECLE   $0008,  $008C,  $00C9,  $024E   ; 64A8   0008 008C 00C9 024E
        DECLE   $0008,  $0058,  $0088,  $000C   ; 64AC   0008 0058 0088 000C
        DECLE   $0008,  $0008,  $03F4,  $00CC   ; 64B0   0008 0008 03F4 00CC
        DECLE   $00CC,  $01FE,  $000C,  $0078   ; 64B4   00CC 01FE 000C 0078
        DECLE   $000C,  $0008,  $007A,  $02BE   ; 64B8   000C 0008 007A 02BE
        DECLE   $0008,  $0138,  $00C8,  $000C   ; 64BC   0008 0138 00C8 000C
        DECLE   $0008,  $0008,  $014C,  $00C9   ; 64C0   0008 0008 014C 00C9
        DECLE   $024E,  $0008,  $0118,  $0148   ; 64C4   024E 0008 0118 0148
        DECLE   $000C,  $0008,  $0008,  $03F4   ; 64C8   000C 0008 0008 03F4
        DECLE   $018C,  $00CA,  $01FE,  $0008   ; 64CC   018C 00CA 01FE 0008
        DECLE   $0078,  $000C,  $0008,  $007A   ; 64D0   0078 000C 0008 007A
        DECLE   $02BE,  $0008,  $0078,  $00C8   ; 64D4   02BE 0008 0078 00C8
        DECLE   $000C,  $0008,  $0008,  $008C   ; 64D8   000C 0008 0008 008C
        DECLE   $00D9,  $025E,  $0008,  $0058   ; 64DC   00D9 025E 0008 0058
        DECLE   $0088,  $000C,  $0008,  $0008   ; 64E0   0088 000C 0008 0008
        DECLE   $00DD,  $00DC,  $01FE,  $000C   ; 64E4   00DD 00DC 01FE 000C
        DECLE   $0078,  $000C,  $0008,  $007D   ; 64E8   0078 000C 0008 007D
        DECLE   $007C,  $02BE,  $000C,  $00D8   ; 64EC   007C 02BE 000C 00D8
        DECLE   $000C,  $0008,  $00CC,  $007C   ; 64F0   000C 0008 00CC 007C
        DECLE   $024E,  $0008,  $000C,  $0078   ; 64F4   024E 0008 000C 0078
        DECLE   $00C8,  $0078,  $000C,  $0008   ; 64F8   00C8 0078 000C 0008
        DECLE   $0008,  $03F6,  $00FE,  $03F4   ; 64FC   0008 03F6 00FE 03F4
        DECLE   $00C8,  $01FE,  $000C,  $02BE   ; 6500   00C8 01FE 000C 02BE
        DECLE   $0008,  $00C8,  $000C,  $0008   ; 6504   0008 00C8 000C 0008
        DECLE   $00C9,  $024E,  $000C,  $0008   ; 6508   00C9 024E 000C 0008
        DECLE   $00CA,  $01FE,  $0008,  $0078   ; 650C   00CA 01FE 0008 0078
        DECLE   $000C,  $0008,  $007A,  $02BE   ; 6510   000C 0008 007A 02BE
        DECLE   $0008,  $0078,  $00C8,  $000C   ; 6514   0008 0078 00C8 000C
        DECLE   $0008,  $0008,  $008C,  $00C9   ; 6518   0008 0008 008C 00C9
        DECLE   $024E,  $0008,  $0058,  $0088   ; 651C   024E 0008 0058 0088
        DECLE   $000C,  $0008,  $0008,  $03F4   ; 6520   000C 0008 0008 03F4
        DECLE   $00CC,  $00CC,  $01FE,  $000C   ; 6524   00CC 00CC 01FE 000C
        DECLE   $0078,  $000C,  $0008,  $007A   ; 6528   0078 000C 0008 007A
        DECLE   $02BE,  $0008,  $0138,  $00C8   ; 652C   02BE 0008 0138 00C8
        DECLE   $000C,  $0008,  $0008,  $014C   ; 6530   000C 0008 0008 014C
        DECLE   $00C9,  $024E,  $0008,  $0118   ; 6534   00C9 024E 0008 0118
        DECLE   $0148,  $000C,  $0008,  $0008   ; 6538   0148 000C 0008 0008
        DECLE   $03F4,  $018C,  $00CA,  $01FE   ; 653C   03F4 018C 00CA 01FE
        DECLE   $0008,  $0078,  $000C,  $0008   ; 6540   0008 0078 000C 0008
        DECLE   $007A,  $02BE,  $0008,  $0078   ; 6544   007A 02BE 0008 0078
        DECLE   $00C8,  $000C,  $0008,  $0008   ; 6548   00C8 000C 0008 0008
        DECLE   $008C,  $00E9,  $026E,  $0008   ; 654C   008C 00E9 026E 0008
        DECLE   $0058,  $0088,  $000C,  $0008   ; 6550   0058 0088 000C 0008
        DECLE   $0008,  $00ED,  $00EC,  $01FE   ; 6554   0008 00ED 00EC 01FE
        DECLE   $000C,  $0078,  $000C,  $0008   ; 6558   000C 0078 000C 0008
        DECLE   $0079,  $007C,  $02BE,  $000C   ; 655C   0079 007C 02BE 000C
        DECLE   $00EC,  $000C,  $0008,  $007A   ; 6560   00EC 000C 0008 007A
        DECLE   $00CA,  $024E,  $00C8,  $0078   ; 6564   00CA 024E 00C8 0078
        DECLE   $0108,  $00C8,  $000C,  $0008   ; 6568   0108 00C8 000C 0008
        DECLE   $0008,  $03F6,  $013D,  $03F6   ; 656C   0008 03F6 013D 03F6
        DECLE   $00CD,  $03F6,  $010D,  $0000   ; 6570   00CD 03F6 010D 0000
L_6574:
        MVO     R5,     G_034F                  ; 6574   0245 034F
        MVII    #$0350, R4                      ; 6576   02BC 0350
        MVII    #$0028, R1                      ; 6578   02B9 0028
        MVO@    R1,     R4                      ; 657A   0261
        MVO@    R1,     R4                      ; 657B   0261
        MVO@    R1,     R4                      ; 657C   0261

        JSR     R5,     X_PLAY_SFX1             ; 657D   0004 0118 03BB
        DECLE   $0389                           ; 6580  SFX data
        DECLE   $002B                           ; 6581  SFX data
        DECLE   $0077,  $0086,  $0065           ; 6582  SFX data
        DECLE   $02CF                           ; 6585  SFX end

UC_6586:
        MVII    #$0350, R3                      ; 6586  SLIB UCALL target
        MVII    #$01F0, R4                      ; 6588   02BC 01F0
L_658A:
        MVI@    R3,     R0                      ; 658A   0298
        SARC    R0,     1                       ; 658B   0078
        DECR    R0                              ; 658C   0010
        BNEQ    L_6598                          ; 658D   020C 0009
        BNC     L_659C                          ; 658F   0209 000B

        MOVR    R4,     R2                      ; 6591   00A2
        ADDI    #$000B, R2                      ; 6592   02FA 000B
        MVO@    R0,     R2                      ; 6594   0250
        MVII    #$0004, R0                      ; 6595   02B8 0004
        INCR    R7                              ; 6597   000F

L_6598:
        RLC     R0,     1                       ; 6598   0050
L_6599:
        MVO@    R0,     R3                      ; 6599   0258
        B       L_65C9                          ; 659A   0200 002D

L_659C:
        MVI     G_034F, R5                      ; 659C   0285 034F
        MVO     R5,     G_035F                  ; 659E   0245 035F
        MVI@    R5,     R0                      ; 65A0   02A8
        TSTR    R0                              ; 65A1   0080
        BEQ     L_65D3                          ; 65A2   0204 002F

        JSR     R5,     .EXEC.AF4               ; 65A4   0004 0118 02F4

        MVI     G_035F, R5                      ; 65A7   0285 035F
        MVO     R5,     G_034F                  ; 65A9   0245 034F
        PSHR    R1                              ; 65AB   0271
        SLR     R1,     1                       ; 65AC   0061
        ADD@    R6,     R1                      ; 65AD   02F1
        SARC    R2,     1                       ; 65AE   007A
        BNC     L_65B3                          ; 65AF   0209 0002

        DECR    R1                              ; 65B1   0011
        DECR    R1                              ; 65B2   0011
L_65B3:
        RLC     R1,     1                       ; 65B3   0051
        MOVR    R0,     R2                      ; 65B4   0082
        BEQ     L_65BF                          ; 65B5   0204 0008

        MVII    #$000F, R2                      ; 65B7   02BA 000F
        CMPI    #$0350, R3                      ; 65B9   037B 0350
        BEQ     L_65BF                          ; 65BB   0204 0002

        MVII    #$000C, R2                      ; 65BD   02BA 000C
L_65BF:
        MVO@    R1,     R3                      ; 65BF   0259
        MOVR    R4,     R1                      ; 65C0   00A1
        MVO@    R0,     R1                      ; 65C1   0248
        ADDI    #$0004, R1                      ; 65C2   02F9 0004
        SWAP    R0,     1                       ; 65C4   0040
        MVO@    R0,     R1                      ; 65C5   0248
        ADDI    #$0007, R1                      ; 65C6   02F9 0007
        MVO@    R2,     R1                      ; 65C8   024A
L_65C9:
        INCR    R3                              ; 65C9   000B
        INCR    R4                              ; 65CA   000C
        CMPI    #$0353, R3                      ; 65CB   037B 0353
        BNEQ    L_658A                          ; 65CD   022C 0044

        MOVR    R7,     R4                      ; 65CF   00BC
        SUBI    #$004F, R4                      ; 65D0   033C 004F
        PULR    R7                              ; 65D2   02B7

L_65D3:
        MOVR    R7,     R4                      ; 65D3   00BC
        SUBI    #$004F, R4                      ; 65D4   033C 004F
        PULR    R7                              ; 65D6   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 65D7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65DB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65DF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65E3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65E7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65EB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65EF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65F3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65F7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65FB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65FF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6603   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6607   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 660B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 660F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6613   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6617   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 661B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 661F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6623   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6627   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 662B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 662F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6633   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6637   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 663B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 663F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6643   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6647   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 664B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 664F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6653   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6657   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 665B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 665F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6663   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6667   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 666B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 666F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6673   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6677   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 667B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 667F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6683   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6687   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 668B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 668F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6693   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6697   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 669B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 669F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66A3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66A7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66AB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66AF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66B3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66B7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66BB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66BF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66C3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66C7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66CB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66CF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66D3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66D7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66DB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66DF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66E3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66E7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66EB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66EF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66F3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66F7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66FB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66FF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6703   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6707   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 670B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 670F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6713   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6717   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 671B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 671F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6723   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6727   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 672B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 672F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6733   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6737   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 673B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 673F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6743   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6747   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 674B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 674F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6753   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6757   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 675B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 675F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6763   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6767   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 676B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 676F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6773   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6777   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 677B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 677F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6783   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6787   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 678B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 678F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6793   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6797   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 679B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 679F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67A3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67A7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67AB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67AF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67B3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67B7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67BB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67BF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67C3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67C7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67CB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67CF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67D3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67D7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67DB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67DF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67E3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67E7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67EB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67EF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67F3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67F7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67FB   0000 0000 0000 0000
        DECLE   $0000,  $03FF,  $03FF,  $03FF   ; 67FF   0000 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6803   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6807   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 680B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 680F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6813   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6817   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 681B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 681F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6823   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6827   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 682B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 682F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6833   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6837   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 683B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 683F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6843   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6847   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 684B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 684F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6853   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6857   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 685B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 685F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6863   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6867   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 686B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 686F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6873   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6877   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 687B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 687F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6883   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6887   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 688B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 688F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6893   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6897   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 689B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 689F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68A3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68A7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68AB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68AF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68B3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68B7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68BB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68BF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68C3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68C7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68CB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68CF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68D3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68D7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68DB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68DF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68E3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68E7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68EB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68EF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68F3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68F7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68FB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 68FF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6903   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6907   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 690B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 690F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6913   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6917   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 691B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 691F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6923   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6927   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 692B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 692F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6933   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6937   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 693B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 693F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6943   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6947   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 694B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 694F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6953   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6957   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 695B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 695F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6963   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6967   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 696B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 696F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6973   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6977   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 697B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 697F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6983   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6987   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 698B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 698F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6993   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6997   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 699B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 699F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69A3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69A7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69AB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69AF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69B3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69B7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69BB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69BF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69C3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69C7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69CB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69CF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69D3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69D7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69DB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69DF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69E3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69E7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69EB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69EF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69F3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69F7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69FB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 69FF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A03   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A07   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A0B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A0F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A13   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A17   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A1B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A1F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A23   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A27   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A2B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A2F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A33   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A37   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A3B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A3F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A43   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A47   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A4B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A4F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A53   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A57   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A5B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A5F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A63   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A67   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A6B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A6F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A73   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A77   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A7B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A7F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A83   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A87   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A8B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A8F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A93   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A97   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A9B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6A9F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AA3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AA7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AAB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AAF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AB3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AB7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6ABB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6ABF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AC3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AC7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6ACB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6ACF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AD3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AD7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6ADB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6ADF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AE3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AE7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AEB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AEF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AF3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AF7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AFB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AFF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B03   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B07   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B0B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B0F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B13   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B17   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B1B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B1F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B23   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B27   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B2B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B2F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B33   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B37   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B3B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B3F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B43   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B47   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B4B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B4F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B53   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B57   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B5B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B5F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B63   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B67   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B6B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B6F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B73   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B77   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B7B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B7F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B83   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B87   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B8B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B8F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B93   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B97   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B9B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B9F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BA3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BA7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BAB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BAF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BB3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BB7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BBB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BBF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BC3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BC7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BCB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BCF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BD3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BD7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BDB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BDF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BE3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BE7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BEB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BEF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BF3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BF7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BFB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BFF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C03   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C07   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C0B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C0F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C13   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C17   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C1B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C1F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C23   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C27   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C2B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C2F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C33   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C37   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C3B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C3F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C43   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C47   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C4B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C4F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C53   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C57   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C5B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C5F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C63   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C67   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C6B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C6F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C73   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C77   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C7B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C7F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C83   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C87   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C8B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C8F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C93   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C97   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C9B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C9F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CA3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CA7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CAB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CAF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CB3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CB7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CBB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CBF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CC3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CC7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CCB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CCF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CD3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CD7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CDB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CDF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CE3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CE7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CEB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CEF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CF3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CF7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CFB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CFF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D03   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D07   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D0B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D0F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D13   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D17   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D1B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D1F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D23   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D27   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D2B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D2F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D33   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D37   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D3B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D3F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D43   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D47   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D4B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D4F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D53   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D57   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D5B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D5F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D63   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D67   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D6B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D6F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D73   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D77   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D7B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D7F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D83   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D87   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D8B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D8F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D93   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D97   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D9B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D9F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DA3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DA7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DAB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DAF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DB3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DB7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DBB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DBF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DC3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DC7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DCB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DCF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DD3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DD7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DDB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DDF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DE3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DE7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DEB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DEF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DF3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DF7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DFB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DFF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E03   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E07   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E0B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E0F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E13   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E17   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E1B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E1F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E23   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E27   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E2B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E2F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E33   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E37   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E3B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E3F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E43   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E47   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E4B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E4F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E53   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E57   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E5B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E5F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E63   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E67   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E6B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E6F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E73   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E77   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E7B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E7F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E83   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E87   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E8B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E8F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E93   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E97   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E9B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E9F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EA3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EA7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EAB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EAF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EB3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EB7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EBB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EBF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EC3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EC7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6ECB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6ECF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6ED3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6ED7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EDB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EDF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EE3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EE7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EEB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EEF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EF3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EF7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EFB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EFF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F03   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F07   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F0B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F0F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F13   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F17   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F1B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F1F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F23   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F27   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F2B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F2F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F33   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F37   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F3B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F3F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F43   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F47   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F4B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F4F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F53   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F57   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F5B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F5F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F63   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F67   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F6B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F6F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F73   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F77   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F7B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F7F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F83   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F87   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F8B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F8F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F93   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F97   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F9B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F9F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FA3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FA7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FAB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FAF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FB3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FB7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FBB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FBF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FC3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FC7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FCB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FCF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FD3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FD7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FDB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FDF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FE3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FE7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FEB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FEF   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FF3   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FF7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FFB   03FF 03FF 03FF 03FF
        DECLE   $03FF                           ; 6FFF   03FF
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $502C       <entry>
;;  $504B       $5058  
;;  $505A       $5081  
;;  $505F       $507F  
;;  $5063       $5065  
;;  $507D       $5077  
;;  $507E       $506C  
;;  $5083       $505A  
;;  $5086       $508D  
;;  $5091       $5088  
;;  $5093       $50A0  
;;  $50A4       $509D  
;;  $50A7       $508F   $50A2  
;;  $50BC       $50B9  
;;  $50C5       $50C2  
;;  $50D7       $5030  
;;  $50EB       $50E7  
;;  $50F0       $50ED  
;;  $50F7       <entry>
;;  $50FF       $50FB  
;;  $510B       $5110  
;;  $5118       $5112  
;;  $5127       $5122  
;;  $512A       $513F  
;;  $513B       $5106  
;;  $513C       $5103  
;;  $51D7       $6374  
;;  $51E5       $5223  
;;  $51E6       $51E4   $51F6  
;;  $51F8       $51E9  
;;  $5203       $51FA  
;;  $5210       $5203   $520E  
;;  $5213       $5228  
;;  $5214       $521F  
;;  $522A       $51EE  
;;  $522F       $5234  
;;  $5259       $525B  
;;  $5272       $5286  
;;  $527C       $5274  
;;  $5284       $527A  
;;  $52DF       $52E5   $52EF  
;;  $52F1       $52E9  
;;  $52F9       $52FB  
;;  $5306       $5248   $524D  
;;  $5318       $5313  
;;  $532B       $5328  
;;  $5331       $532E  
;;  $533F       $531D  
;;  $534D       $5348  
;;  $5356       $5340   $5346   $539C  
;;  $5359       $5354  
;;  $535B       $5350  
;;  $5368       $536E   $5372   $537D  
;;  $536B       $5360  
;;  $537F       $5377  
;;  $5396       $538E  
;;  $5399       $5381   $538A  
;;  $539E       $5391   $5396  
;;  $53AC       $53B0  
;;  $53B3       $5362  
;;  $53C5       $518F  
;;  $53C6       $5124  
;;  $53DC       $53D3  
;;  $53E4       $53DF  
;;  $53FA       $5411  
;;  $540A       $5407  
;;  $5414       $53E1  
;;  $541C       $5424  
;;  $5428       $5420  
;;  $5451       $541A   $5426  
;;  $545E       $5457  
;;  $545F       $5451  
;;  $547E       $547A  
;;  $5483       $5480  
;;  $5492       $548E  
;;  $54D6       $54D2  
;;  $54DF       $54DA  
;;  $54F3       $5463   $5469   $5497   $54F8   $5500   $550A  
;;  $54F4       $546F  
;;  $5516       $5513  
;;  $5521       $5518  
;;  $5575       $5567  
;;  $5576       $5571  
;;  $557D       $5573  
;;  $558C       $5584   $5588   $5595  
;;  $558D       $556B  
;;  $5592       $556D  
;;  $55A1       $5648  
;;  $55B0       $55AC  
;;  $55B1       $55AA   $55AF  
;;  $55B4       $55A6  
;;  $55BD       $5613  
;;  $55F7       $55C2   $55C7   $55D2  
;;  $55F9       $563F  
;;  $5603       $5127  
;;  $5616       $560F  
;;  $561E       $5619  
;;  $5629       $5626  
;;  $562D       $5629  
;;  $563D       $5633  
;;  $564B       $5645  
;;  $5653       $565A  
;;  $565C       $560A  
;;  $565D       $561B  
;;  $5660       $5689  
;;  $566C       $5669  
;;  $5686       $5678   $567C  
;;  $5687       $5665   $566D   $5674  
;;  $568C       $564B  
;;  $5691       $56A2  
;;  $569E       $569A  
;;  $56B5       $56AF  
;;  $56B9       $56CA  
;;  $56BB       $56B7  
;;  $56BF       $56C7  
;;  $56CD       $5654  
;;  $56DF       $56ED  
;;  $56EA       $56E7  
;;  $56F0       $564E  
;;  $56F3       $5730  
;;  $570D       $5701  
;;  $5711       $56FD   $570B  
;;  $5721       $5705  
;;  $5722       $5720  
;;  $572F       $5729  
;;  $5733       $5118  
;;  $573B       $5740  
;;  $5753       $574F  
;;  $575B       $576F  
;;  $576B       $5761   $5766  
;;  $5775       $575E  
;;  $5794       $5789   $57A2  
;;  $5796       $5785  
;;  $579E       $5792  
;;  $57AA       $5771  
;;  $57AF       $57B6  
;;  $57B8       $57B3  
;;  $57BE       $57BA  
;;  $57BF       $5742  
;;  $57CD       $57FC  
;;  $57E1       $57CB   $57D1  
;;  $57FF       $57E6  
;;  $581B       $5825  
;;  $5823       $581D  
;;  $5827       $5821  
;;  $583E       $583A  
;;  $5850       $580F   $584A  
;;  $5851       $5745  
;;  $5854       $5872  
;;  $5856       $586F  
;;  $586A       $5864  
;;  $5875       $5768  
;;  $5881       $587A  
;;  $5887       $587F  
;;  $589B       $5894  
;;  $589E       $5899  
;;  $589F       $587C  
;;  $58A9       $58A5  
;;  $58C4       $58BF  
;;  $58D3       $58C8   $58CC  
;;  $58E3       $58D8  
;;  $58E5       $58E1  
;;  $58E8       $5887  
;;  $58FD       $58F7  
;;  $5904       $588A  
;;  $592F       $5929  
;;  $5930       $5927  
;;  $5940       $593C  
;;  $595E       $5958  
;;  $5963       $588D  
;;  $596F       $596C  
;;  $5973       $5970  
;;  $59BB       $5896  
;;  $59CC       $59C1  
;;  $59CE       $589B  
;;  $59D9       $5A12  
;;  $59EC       $59E2  
;;  $5A03       $59FD  
;;  $5A07       $5A01  
;;  $5A14       $59D7   $5A0A  
;;  $5A15       $5108  
;;  $5A45       $5A32  
;;  $5A48       $5A43  
;;  $5A57       $5A52  
;;  $5A65       $5A19  
;;  $5A66       $5A62  
;;  $5A6B       $5A78   $5A81  
;;  $5A83       $5A7C  
;;  $5A88       $5A26  
;;  $5A89       $5A2B   $5A45   $5A5B  
;;  $5A9C       $5A93  
;;  $5AB0       $5AA5  
;;  $5AB4       $5AAA   $5AAE  
;;  $5AB7       $5A5F  
;;  $5ACB       $5A1B  
;;  $5AD4       $5AEF  
;;  $5ADF       $5AD9  
;;  $5AEC       $5AD2  
;;  $5AF4       $5AEA  
;;  $5AF5       $5AF3  
;;  $5AF8       $53E7  
;;  $5B12       $5B88  
;;  $5B1A       $5B05  
;;  $5B4E       $5B63  
;;  $5B55       $5B52  
;;  $5B5A       $5B56  
;;  $5B6C       $5B77  
;;  $5B7B       $5B6A  
;;  $5B7D       $5B85  
;;  $5B82       $5B7F  
;;  $5B8A       $5B0E  
;;  $5B95       $5B8D  
;;  $5B96       $5B3D   $5B93  
;;  $5BAA       $5A3C   $5B24   $5BE7  
;;  $5BB3       $5BAF  
;;  $5BBA       $53E4  
;;  $5BDC       $5BD8  
;;  $5BE6       $5BDE  
;;  $5BE7       $5BC5   $5BCB  
;;  $5BF7       $5BD3  
;;  $5C04       $5BF1   $5BF4  
;;  $5C07       $5B16   $5BF9  
;;  $5C1D       $5BBB  
;;  $5C2B       $5C21   $5C28  
;;  $5C41       $5C39  
;;  $5C54       $5C3F   $5C51   $5C71   $5C79   $5C7D   $5C81   $5C85  
;;  $5C6C       $5C4F   $5C58   $5C69   $5C8C  
;;  $5C6F       $5C44   $5C49  
;;  $5C87       $5C2F  
;;  $5CA1       $5C99   $5C9E  
;;  $5CC3       $5CAE   $5CB4   $5CB8  
;;  $5CE1       $5CC7   $5CD0   $5CDB  
;;  $5CEA       $5CA7  
;;  $5D15       $5D06  
;;  $5D30       $5C94   $5CFC  
;;  $5D5A       $5D38  
;;  $5D74       $5D86  
;;  $5D80       $5D82  
;;  $5D8B       $5D63  
;;  $5DA8       $5DB9  
;;  $5DB4       $5DAF  
;;  $5DB6       $5DAC   $5DB2  
;;  $5DCE       $5D93   $5D97   $5DA1  
;;  $6001       $5A90  
;;  $6004       $5A97  
;;  $6012       $6008   $600D  
;;  $601A       $6015  
;;  $602F       $5807   $5C14  
;;  $6036       $6032  
;;  $603C       $6037  
;;  $6044       $603F  
;;  $6059       $5831   $5C17  
;;  $6068       $605A   $6061  
;;  $6072       $6073  
;;  $6083       $6085  
;;  $6089       $5AA1  
;;  $6090       $608D  
;;  $6095       $512A  
;;  $6096       $60AD  
;;  $60AF       <entry>
;;  $60B7       $60B3  
;;  $60BC       <entry>
;;  $60C6       $5252  
;;  $60D7       $61E3  
;;  $60E7       $55F4  
;;  $60F6       $5D6B   $5DCB  
;;  $6105       $549A  
;;  $6112       $5524  
;;  $6129       $513C  
;;  $615C       $612E   $6133   $6139  
;;  $6170       $6178  
;;  $617A       $6175  
;;  $6184       $6180  
;;  $61A6       $6161   $616A  
;;  $61AD       $61B3  
;;  $61C0       $61C8  
;;  $61CA       $62D0  
;;  $61E8       $61C2  
;;  $61EA       $620E  
;;  $61FF       $61F9  
;;  $620A       $61F0  
;;  $6217       $6211  
;;  $6218       $6215  
;;  $624B       $622F  
;;  $626C       $61E6  
;;  $6273       $627A  
;;  $6298       $62C7  
;;  $62A0       $6293   $62C0  
;;  $62A1       $628F  
;;  $62AA       $6295  
;;  $62AE       $62B9  
;;  $62BB       $62B6  
;;  $62F6       <entry>
;;  $62FD       $6303  
;;  $6331       $5D88  
;;  $633A       $5599   $5B99  
;;  $6342       $634F  
;;  $634E       $6348  
;;  $635F       $6359  
;;  $6360       $632F  
;;  $637D       $63B4  
;;  $6390       $638C  
;;  $639E       $6393  
;;  $63A2       $639F  
;;  $63C4       $6269  
;;  $6574       $63C5  
;;  $6586       <entry>
;;  $658A       $65CD  
;;  $6598       $658D  
;;  $6599       $6597  
;;  $659C       $658F  
;;  $65B3       $65AF  
;;  $65BF       $65B5   $65BB  
;;  $65C9       $659A  
;;  $65D3       $65A2  
;; ======================================================================== ;;
