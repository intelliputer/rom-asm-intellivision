
        ORG     $5000
.HEADER:
        BIDECLE $5E0F           ; 5000  Ptr: MOB graphic images
        BIDECLE $5056           ; 5002  Ptr: EXEC timer table
        BIDECLE $506C           ; 5004  Ptr: Start of game
        BIDECLE $60C7           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $501C           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5029           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0009,  $000D   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0005           ; 5013  Border color init

        DECLE   $0180,  $0190,  $01A0,  $01B0   ; 5014   0180 0190 01A0 01B0
        DECLE   $01C0,  $01D0,  $01E0,  $01F0   ; 5018   01C0 01D0 01E0 01F0
.GRAM_INIT_501C:
        DECLE   $001F           ; 501C  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 501D  #00-07:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 501F  #08-0F:  CART #08-0F ----
        DECLE   $0021,  $0380   ; 5021  #10-17:  CART #10-17 ----
        DECLE   $0031,  $0180   ; 5023  #18-1B:  CART #18-1B ----
        DECLE   $0135,  $00C0   ; 5025  #1C-1D:  GRAM #1A-1B -Y--
        DECLE   $012D,  $0050   ; 5027  #1E-1E:  GROM #16-16 -Y--

.TITLE:
        DECLE   $0052                           ; 5029  Cartridge year
        STRING  "Bomb Squad"                    ; 502A  Title string
        DECLE   $0000                           ; 5034  

.TITLECODE:
        PSHR    R5                              ; 5035   0275
        MVII    #$00FF, R0                      ; 5036   02B8 00FF
        MVO     R0,     G_015E                  ; 5038   0240 015E

        JSRD    R5,     L_673A                  ; 503A   0004 0166 033A

        MVII    #$0005, R0                      ; 503D   02B8 0005

        JSR     R5,     L_68AF                  ; 503F   0004 0168 00AF

        PULR    R7                              ; 5042   02B7

        DECLE   $0063,  $006F,  $0070,  $0079   ; 5043   0063 006F 0070 0079
        DECLE   $0072,  $0069,  $0067,  $0068   ; 5047   0072 0069 0067 0068
        DECLE   $0074,  $004D,  $0061,  $0074   ; 504B   0074 004D 0061 0074
        DECLE   $0074,  $0065,  $006C,  $0031   ; 504F   0074 0065 006C 0031
        DECLE   $0039,  $0038,  $0032           ; 5053   0039 0038 0032
.TIMER:
        DECLE   $00A3,  $0055,  $0004,  $0000; 5056  Timer dispatch/interval
        DECLE   $00BF,  $0055,  $0004,  $0000; 505A  Timer dispatch/interval
        DECLE   $00CF,  $0051,  $0002,  $0000; 505E  Timer dispatch/interval
        DECLE   $0015,  $006A,  $0005,  $0000; 5062  Timer dispatch/interval
        DECLE   $0043,  $0065,  $0002,  $0000; 5066  Timer dispatch/interval
        BIDECLE $0000           ; 506A  End of timer table

.START:
        PSHR    R5                              ; 506C   0275
        SDBD                                    ; 506D   0001
        MVII    #$5066, R1                      ; 506E   02B9 0066 0050

        JSR     R5,     X_TIMER_STOP            ; 5071   0004 0118 0038
        JSR     R5,     L_6AA4                  ; 5074   0004 0168 02A4

        CLRR    R0                              ; 5077   01C0
        MVO     R0,     G_0167                  ; 5078   0240 0167
        MVII    #$001D, R0                      ; 507A   02B8 001D
        MVO     R0,     G_0160                  ; 507C   0240 0160
        MVII    #$0005, R0                      ; 507E   02B8 0005
        MVO     R0,     G_015D                  ; 5080   0240 015D
        MVO     R0,     G_0105                  ; 5082   0240 0105
        MVII    #$003B, R0                      ; 5084   02B8 003B
        MVO     R0,     G_015F                  ; 5086   0240 015F
        SDBD                                    ; 5088   0001
        MVII    #$5056, R1                      ; 5089   02B9 0056 0050

        JSR     R5,     X_TIMER_STOP            ; 508C   0004 0118 0038

        SDBD                                    ; 508F   0001
        MVII    #$505A, R1                      ; 5090   02B9 005A 0050

        JSR     R5,     X_TIMER_STOP            ; 5093   0004 0118 0038

        MVII    #$0003, R2                      ; 5096   02BA 0003
        MVO     R2,     G_0103                  ; 5098   0242 0103
        MVII    #$00FF, R0                      ; 509A   02B8 00FF
        MVII    #$0170, R4                      ; 509C   02BC 0170
L_509E:
        MVO@    R0,     R4                      ; 509E   0260
        DECR    R2                              ; 509F   0012
        BNEQ    L_509E                          ; 50A0   022C 0003

        MVI     .ISRVEC.0,R0                    ; 50A2   0280 0100
        MVO     R0,     G_0163                  ; 50A4   0240 0163
        MVI     .ISRVEC.1,R0                    ; 50A6   0280 0101
        MVO     R0,     G_0164                  ; 50A8   0240 0164

        JSR     R5,     L_6631                  ; 50AA   0004 0164 0231

L_50AD:
        MVII    #$0002, R3                      ; 50AD   02BB 0002
        MVII    #$0202, R4                      ; 50AF   02BC 0202

        JSR     R5,     X_PRINT_R5              ; 50B1   0004 0118 007B
        STRING  "DIGITS (1-3)"                  ; 50B4  
        DECLE   $0000                           ; 50C0   0000

        MVI     G_016F, R0                      ; 50C1   0280 016F
        TSTR    R0                              ; 50C3   0080
        BEQ     L_50D6                          ; 50C4   0204 0010

L_50C6:
        MVO     R0,     G_016F                  ; 50C6   0240 016F
        MVII    #$0002, R3                      ; 50C8   02BB 0002
        MVII    #$0202, R4                      ; 50CA   02BC 0202

        JSR     R5,     X_PRINT_R5              ; 50CC   0004 0118 007B
        STRING  "LEVEL "                        ; 50CF  
        DECLE   $0000                           ; 50D5   0000
L_50D6:
        MVII    #$0001, R0                      ; 50D6   02B8 0001
        MVII    #$0211, R1                      ; 50D8   02B9 0211
        CLRR    R2                              ; 50DA   01D2
        SDBD                                    ; 50DB   0001
        MVII    #$5187, R4                      ; 50DC   02BC 0087 0051
        MVII    #$0001, R3                      ; 50DF   02BB 0001

        JSR     R5,     .EXEC.910               ; 50E1   0004 0118 0110

        DECR    R0                              ; 50E4   0010
        BPL     L_50EE                          ; 50E5   0203 0007

L_50E7:
        MVII    #$0002, R0                      ; 50E7   02B8 0002

        JSR     R5,     X_PLAY_RAZZ4            ; 50E9   0004 011C 02C4

        B       L_50AD                          ; 50EC   0220 0040

L_50EE:
        INCR    R0                              ; 50EE   0008
        CMPI    #$0003, R0                      ; 50EF   0378 0003
        BGT     L_50E7                          ; 50F1   022E 000B

        MVI     G_016F, R1                      ; 50F3   0281 016F
        TSTR    R1                              ; 50F5   0089
        BEQ     L_50C6                          ; 50F6   0224 0031

        MVO     R0,     G_0165                  ; 50F8   0240 0165
        ADD     G_016F, R0                      ; 50FA   02C0 016F
        CMPI    #$0005, R0                      ; 50FC   0378 0005
        BLT     L_5107                          ; 50FE   0205 0007

        MVII    #$007B, R0                      ; 5100   02B8 007B

        JSR     R5,     L_68AF                  ; 5102   0004 0168 00AF

        B       L_510C                          ; 5105   0200 0005

L_5107:
        MVII    #$006D, R0                      ; 5107   02B8 006D

        JSR     R5,     L_68AF                  ; 5109   0004 0168 00AF

L_510C:
        MVII    #$001F, R0                      ; 510C   02B8 001F

        JSR     R5,     L_68AF                  ; 510E   0004 0168 00AF

        MVI     G_0165, R3                      ; 5111   0283 0165
        SDBD                                    ; 5113   0001
        ADDI    #$5162, R3                      ; 5114   02FB 0062 0051
        MVI@    R3,     R0                      ; 5117   0298
        MVO     R0,     G_0115                  ; 5118   0240 0115
        MVI     G_016F, R0                      ; 511A   0280 016F
        MVII    #$0170, R4                      ; 511C   02BC 0170
        MOVR    R0,     R1                      ; 511E   0081
L_511F:
        MVII    #$000A, R0                      ; 511F   02B8 000A

        JSR     R5,     X_RAND2                 ; 5121   0004 0114 029E

        MVO@    R0,     R4                      ; 5124   0260
        DECR    R1                              ; 5125   0011
        BNEQ    L_511F                          ; 5126   022C 0008

        MVII    #$031D, R2                      ; 5128   02BA 031D
        SDBD                                    ; 512A   0001
        MVII    #$5D86, R1                      ; 512B   02B9 0086 005D

        JSR     R5,     X_INIT_MOB              ; 512E   0004 0114 02B2

        SDBD                                    ; 5131   0001
        MVII    #$5166, R0                      ; 5132   02B8 0066 0051
        MVO     R0,     G_035D                  ; 5135   0240 035D
        CLRR    R0                              ; 5137   01C0
        MVO     R0,     G_01A1                  ; 5138   0240 01A1
        INCR    R0                              ; 513A   0008

        JSR     R5,     L_5305                  ; 513B   0004 0150 0305

        DIS                                     ; 513E   0003
        SDBD                                    ; 513F   0001
        MVII    #$0070, R0                      ; 5140   02B8 0070 0000
        MVO     R0,     .ISRVEC.0               ; 5143   0240 0100
        SDBD                                    ; 5145   0001
        MVII    #$0051, R0                      ; 5146   02B8 0051 0000
        MVO     R0,     .ISRVEC.1               ; 5149   0240 0101
        EIS                                     ; 514B   0002
L_514C:
        MVI     G_01A1, R0                      ; 514C   0280 01A1
        TSTR    R0                              ; 514E   0080
        BEQ     L_514C                          ; 514F   0224 0004

        MVII    #$0001, R0                      ; 5151   02B8 0001
        MVO     R0,     G_0106                  ; 5153   0240 0106
        CLRR    R0                              ; 5155   01C0
        MVO     R0,     G_015E                  ; 5156   0240 015E
        MVI     G_035E, R0                      ; 5158   0280 035E
        MVO     R0,     G_0186                  ; 515A   0240 0186
        SWAP    R0,     1                       ; 515C   0040
        MVO     R0,     G_0186                  ; 515D   0240 0186

        JSR     R5,     L_52BC                  ; 515F   0004 0150 02BC

        PULR    R7                              ; 5162   02B7

        DECLE   $000C,  $0002,  $000E,  $0031   ; 5163   000C 0002 000E 0031
        DECLE   $0053,  $0005,  $0053,  $0086   ; 5167   0053 0005 0053 0086
        DECLE   $0053,  $0000,  $0000,  $0000   ; 516B   0053 0000 0000 0000
        DECLE   $0000                           ; 516F   0000

        MVO     R0,     .STIC.MODE              ; 5170   0240 0021
        CLRR    R0                              ; 5172   01C0
        MVO     R0,     .STIC.EDGE              ; 5173   0240 0032
        MVII    #$0001, R0                      ; 5175   02B8 0001
        MVO     R0,     .STIC.BORD              ; 5177   0240 002C
        MVO     R0,     G_01A1                  ; 5179   0240 01A1
        MVI     G_0163, R0                      ; 517B   0280 0163
        MVO     R0,     .ISRVEC.0               ; 517D   0240 0100
        MVI     G_0164, R0                      ; 517F   0280 0164
        MVO     R0,     .ISRVEC.1               ; 5181   0240 0101
        MVII    #$0100, R4                      ; 5183   02BC 0100
        SDBD                                    ; 5185   0001
        MVI@    R4,     R7                      ; 5186   02A7

        DECLE   $0000,  $0000,  $0091,  $0051   ; 5187   0000 0000 0091 0051
        DECLE   $0000,  $0000,  $0000,  $0000   ; 518B   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 518F   0000 0000

        CLRR    R1                              ; 5191   01C9
        J       .EXEC.94C                       ; 5192   0004 0318 014C

L_5195:
        PSHR    R5                              ; 5195   0275
        MVI     G_0102, R0                      ; 5196   0280 0102
        CMPI    #$0081, R0                      ; 5198   0378 0081
        BEQ     L_51CE                          ; 519A   0204 0032

        MVI     G_015E, R0                      ; 519C   0280 015E
        CMPI    #$00FF, R0                      ; 519E   0378 00FF
        BEQ     L_51CE                          ; 51A0   0204 002C

        MVII    #$015D, R1                      ; 51A2   02B9 015D
        MVII    #$0005, R2                      ; 51A4   02BA 0005
        MVI     G_0167, R0                      ; 51A6   0280 0167
        TSTR    R0                              ; 51A8   0080
        BEQ     L_51AD                          ; 51A9   0204 0002

        MVII    #$0001, R2                      ; 51AB   02BA 0001
L_51AD:
        MVI@    R1,     R0                      ; 51AD   0288
        DECR    R0                              ; 51AE   0010
        MVO@    R0,     R1                      ; 51AF   0248
        BPL     L_51CE                          ; 51B0   0203 001C

        MVO@    R2,     R1                      ; 51B2   024A
        INCR    R1                              ; 51B3   0009
        PSHR    R1                              ; 51B4   0271

        JSR     R5,     L_6A49                  ; 51B5   0004 0168 0249

        PULR    R1                              ; 51B8   02B1
        MVI@    R1,     R0                      ; 51B9   0288
        DECR    R0                              ; 51BA   0010
        MVO@    R0,     R1                      ; 51BB   0248
        BPL     L_51CE                          ; 51BC   0203 0010

        MVII    #$0009, R0                      ; 51BE   02B8 0009
        MVO@    R0,     R1                      ; 51C0   0248
        INCR    R1                              ; 51C1   0009
        MVI@    R1,     R0                      ; 51C2   0288
        DECR    R0                              ; 51C3   0010
        MVO@    R0,     R1                      ; 51C4   0248
        BPL     L_51CE                          ; 51C5   0203 0007

        MVII    #$003B, R0                      ; 51C7   02B8 003B
        MVO@    R0,     R1                      ; 51C9   0248
        INCR    R1                              ; 51CA   0009
        MVI@    R1,     R0                      ; 51CB   0288
        DECR    R0                              ; 51CC   0010
        MVO@    R0,     R1                      ; 51CD   0248
L_51CE:
        PULR    R7                              ; 51CE   02B7

L_51CF:
        PSHR    R5                              ; 51CF   0275
        MVI     G_015E, R0                      ; 51D0   0280 015E
        CMPI    #$00FF, R0                      ; 51D2   0378 00FF
        BEQ     L_521C                          ; 51D4   0204 0046

        JSR     R5,     L_5233                  ; 51D6   0004 0150 0233

        MVI     G_015F, R0                      ; 51D9   0280 015F
        MVII    #$0002, R1                      ; 51DB   02B9 0002
        SDBD                                    ; 51DD   0001
        MVII    #$2207, R3                      ; 51DE   02BB 0007 0022
        MVI     G_0167, R5                      ; 51E1   0285 0167
        TSTR    R5                              ; 51E3   00AD
        BEQ     L_51E7                          ; 51E4   0204 0001

        DECR    R3                              ; 51E6   0013
L_51E7:
        MVII    #$0211, R4                      ; 51E7   02BC 0211

        JSR     R5,     X_PRNUM_ZRO             ; 51E9   0004 0118 00AD

        MVII    #$0210, R2                      ; 51EC   02BA 0210
        MVI@    R2,     R0                      ; 51EE   0290
        XORI    #$00D0, R0                      ; 51EF   03F8 00D0
        ANDI    #$01F8, R0                      ; 51F1   03B8 01F8
        XORR    R3,     R0                      ; 51F3   01D8
        MVO@    R0,     R2                      ; 51F4   0250
        MVI     G_0160, R0                      ; 51F5   0280 0160
        CMPI    #$00FF, R0                      ; 51F7   0378 00FF
        BNEQ    L_51FE                          ; 51F9   020C 0003
        J       L_6509                          ; 51FB   0004 0364 0109

L_51FE:
        MVII    #$020E, R4                      ; 51FE   02BC 020E

        JSR     R5,     X_PRNUM_RGT             ; 5200   0004 0118 00C5

        MVI     G_015F, R0                      ; 5203   0280 015F
        MVI     G_0160, R1                      ; 5205   0281 0160
        TSTR    R1                              ; 5207   0089
        BEQ     L_521D                          ; 5208   0204 0013

        SUBI    #$0001, R0                      ; 520A   0338 0001
        BNEQ    L_521C                          ; 520C   020C 000E

        SARC    R1,     1                       ; 520E   0079
        BC      L_521C                          ; 520F   0201 000B

        MVI     G_01CC, R0                      ; 5211   0280 01CC
        ANDI    #$0040, R0                      ; 5213   03B8 0040
        ADD     G_01A7, R0                      ; 5215   02C0 01A7
        BNEQ    L_521C                          ; 5217   020C 0003

        JSR     R5,     L_69B4                  ; 5219   0004 0168 01B4

L_521C:
        PULR    R7                              ; 521C   02B7

L_521D:
        MVI     G_015F, R0                      ; 521D   0280 015F
        MVI     G_01CC, R1                      ; 521F   0281 01CC
        ANDI    #$0040, R1                      ; 5221   03B9 0040
        ADD     G_015E, R1                      ; 5223   02C1 015E
        BNEQ    L_521C                          ; 5225   022C 000A

        DECR    R0                              ; 5227   0010
        BMI     L_521C                          ; 5228   022B 000D

        CMPI    #$0015, R0                      ; 522A   0378 0015
        BGE     L_521C                          ; 522C   022D 0011

        JSR     R5,     L_69A5                  ; 522E   0004 0168 01A5

        B       L_521C                          ; 5231   0220 0016

L_5233:
        PSHR    R5                              ; 5233   0275
        MVII    #$01BA, R4                      ; 5234   02BC 01BA
        MVII    #$0007, R3                      ; 5236   02BB 0007
        MVI     G_0169, R0                      ; 5238   0280 0169
        TSTR    R0                              ; 523A   0080
        BEQ     L_5241                          ; 523B   0204 0004

        SDBD                                    ; 523D   0001
        XORI    #$2200, R3                      ; 523E   03FB 0000 0022
L_5241:
        SDBD                                    ; 5241   0001
        MVI@    R4,     R0                      ; 5242   02A0
        TSTR    R0                              ; 5243   0080
        BEQ     L_5251                          ; 5244   0204 000B

        MVII    #$0202, R4                      ; 5246   02BC 0202
        MVII    #$0004, R1                      ; 5248   02B9 0004

        JSR     R5,     X_PRNUM_RGT             ; 524A   0004 0118 00C5

        ADDR    R1,     R4                      ; 524D   00CC
        XORI    #$0080, R3                      ; 524E   03FB 0080
        MVO@    R3,     R4                      ; 5250   0263
L_5251:
        PULR    R7                              ; 5251   02B7

L_5252:
        PSHR    R5                              ; 5252   0275

        JSR     R5,     L_5897                  ; 5253   0004 0158 0097

        PULR    R5                              ; 5256   02B5
L_5257:
        PSHR    R5                              ; 5257   0275
        MOVR    R3,     R5                      ; 5258   009D
        MVI     G_019C, R2                      ; 5259   0282 019C
        MOVR    R2,     R4                      ; 525B   0094
        SDBD                                    ; 525C   0001
        ADDI    #$52B3, R4                      ; 525D   02FC 00B3 0052
        SUB@    R4,     R0                      ; 5260   0320
        ADDI    #$0003, R4                      ; 5261   02FC 0003
        SUB@    R4,     R1                      ; 5263   0321
        ADDI    #$0003, R1                      ; 5264   02F9 0003
        SARC    R2,     1                       ; 5266   007A
        BNC     L_528C                          ; 5267   0209 0023

        MVII    #$0190, R4                      ; 5269   02BC 0190
        ADDR    R3,     R4                      ; 526B   00DC
        MVI@    R4,     R3                      ; 526C   02A3
        SDBD                                    ; 526D   0001
        MVII    #$5888, R4                      ; 526E   02BC 0088 0058
        ANDI    #$0003, R3                      ; 5271   03BB 0003
        SARC    R2,     1                       ; 5273   007A
        CLRR    R2                              ; 5274   01D2
        BC      L_527B                          ; 5275   0201 0004

        SUBI    #$0008, R4                      ; 5277   033C 0008
        MVII    #$0003, R2                      ; 5279   02BA 0003
L_527B:
        XORR    R3,     R2                      ; 527B   01DA
        BEQ     L_52B3                          ; 527C   0204 0035

        DECR    R2                              ; 527E   0012
        BEQ     L_528C                          ; 527F   0204 000B

        DECR    R2                              ; 5281   0012
        BEQ     L_5288                          ; 5282   0204 0004

        CMPI    #$0007, R1                      ; 5284   0379 0007
        BMI     L_528C                          ; 5286   020B 0004

L_5288:
        SUBI    #$000E, R1                      ; 5288   0339 000E
        ADDI    #$0004, R4                      ; 528A   02FC 0004
L_528C:
        CLRR    R3                              ; 528C   01DB
        MVII    #$0002, R2                      ; 528D   02BA 0002
        TSTR    R0                              ; 528F   0080
        BPL     L_5294                          ; 5290   0203 0002

        NEGR    R0                              ; 5292   0020
        INCR    R3                              ; 5293   000B
L_5294:
        TSTR    R1                              ; 5294   0089
        BPL     L_5299                          ; 5295   0203 0002

        INCR    R2                              ; 5297   000A
        NEGR    R1                              ; 5298   0021
L_5299:
        CMPR    R0,     R1                      ; 5299   0141
        BLT     L_529E                          ; 529A   0205 0002

        MOVR    R1,     R0                      ; 529C   0088
        MOVR    R2,     R3                      ; 529D   0093
L_529E:
        CMP     G_0183, R0                      ; 529E   0340 0183
        BC      L_52B2                          ; 52A0   0201 0010

        CMP     G_0184, R0                      ; 52A2   0340 0184
        BNC     L_52B3                          ; 52A4   0209 000D

        MVI     G_019C, R0                      ; 52A6   0280 019C
        CMPI    #$0003, R0                      ; 52A8   0378 0003
        BEQ     L_52AF                          ; 52AA   0204 0003

        TSTR    R5                              ; 52AC   00AD
        BNEQ    L_52B2                          ; 52AD   020C 0003

L_52AF:
        JSR     R5,     L_6A0A                  ; 52AF   0004 0168 020A

L_52B2:
        SETC                                    ; 52B2   0007
L_52B3:
        PULR    R7                              ; 52B3   02B7

        DECLE   $0002,  $0004,  $0001,  $000B   ; 52B4   0002 0004 0001 000B
        DECLE   $0000                           ; 52B8   0000

        DIS                                     ; 52B9   0003
        INCR    R5                              ; 52BA   000D
        INCR    R0                              ; 52BB   0008
L_52BC:
        PSHR    R5                              ; 52BC   0275
        MVII    #$0200, R4                      ; 52BD   02BC 0200
        MVII    #$00F0, R0                      ; 52BF   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 52C1   0004 0114 0338
        JSR     R5,     L_6287                  ; 52C4   0004 0160 0287
        JSR     R5,     L_52CB                  ; 52C7   0004 0150 02CB

        PULR    R7                              ; 52CA   02B7

L_52CB:
        PSHR    R5                              ; 52CB   0275
        MVII    #$0186, R4                      ; 52CC   02BC 0186
        MVI     G_035E, R0                      ; 52CE   0280 035E
        PSHR    R0                              ; 52D0   0270
        SDBD                                    ; 52D1   0001
        MVI@    R4,     R0                      ; 52D2   02A0
        MVO     R0,     G_035E                  ; 52D3   0240 035E
        CLRR    R1                              ; 52D5   01C9
        MVII    #$022A, R4                      ; 52D6   02BC 022A

L_52D8:
        JSR     R5,     L_52E8                  ; 52D8   0004 0150 02E8

        SUBI    #$00C2, R4                      ; 52DB   033C 00C2
        INCR    R1                              ; 52DD   0009
        CMP     G_016F, R1                      ; 52DE   0341 016F
        BNEQ    L_52D8                          ; 52E0   022C 0009

        MVII    #$0214, R4                      ; 52E2   02BC 0214
        PULR    R0                              ; 52E4   02B0
        MVO     R0,     G_035E                  ; 52E5   0240 035E
        PULR    R7                              ; 52E7   02B7

L_52E8:
        PSHR    R5                              ; 52E8   0275
        CLRR    R2                              ; 52E9   01D2
L_52EA:
        PSHR    R2                              ; 52EA   0272
        MVII    #$0004, R3                      ; 52EB   02BB 0004
        PSHR    R1                              ; 52ED   0271

        JSR     R5,     L_53B1                  ; 52EE   0004 0150 03B1

        PULR    R1                              ; 52F1   02B1
        ADDI    #$0024, R4                      ; 52F2   02FC 0024
        PULR    R2                              ; 52F4   02B2
        INCR    R2                              ; 52F5   000A
        CMPI    #$0005, R2                      ; 52F6   037A 0005
        BNEQ    L_52EA                          ; 52F8   022C 000F
        PULR    R7                              ; 52FA   02B7

        DECLE   $00DC,  $005A,  $0021,  $005A   ; 52FB   00DC 005A 0021 005A
        DECLE   $0000,  $0000                   ; 52FF   0000 0000

        ADDR    R6,     R0                      ; 5301   00F0
        RLC     R2,     2                       ; 5302   0056
        DECR    R4                              ; 5303   0014
        SLLC    R3,     1                       ; 5304   005B
L_5305:
        PSHR    R5                              ; 5305   0275
        DECR    R0                              ; 5306   0010
        ANDI    #$000F, R0                      ; 5307   03B8 000F
        CMP     G_016F, R0                      ; 5309   0340 016F
        BGE     L_5327                          ; 530B   020D 001A

        MVO     R0,     G_016A                  ; 530D   0240 016A
        SDBD                                    ; 530F   0001
        ADDI    #$532E, R0                      ; 5310   02F8 002E 0053
        MOVR    R0,     R1                      ; 5313   0081
        MVI@    R1,     R0                      ; 5314   0288
        MVO     R0,     G_016D                  ; 5315   0240 016D
        SWAP    R0,     1                       ; 5317   0040
        MVO     R0,     G_031F                  ; 5318   0240 031F
        MVII    #$0018, R2                      ; 531A   02BA 0018
        MVO     R2,     G_016E                  ; 531C   0242 016E
        SWAP    R2,     1                       ; 531E   0042
        MVO     R2,     G_0320                  ; 531F   0242 0320
        CLRR    R0                              ; 5321   01C0
        MVO     R0,     G_016B                  ; 5322   0240 016B
        MVO     R0,     G_016C                  ; 5324   0240 016C
L_5326:
        PULR    R7                              ; 5326   02B7

L_5327:
        CMPI    #$000A, R0                      ; 5327   0378 000A
        BNEQ    L_5326                          ; 5329   022C 0004
        J       L_53E9                          ; 532B   0004 0350 03E9

        COMR    R0                              ; 532E   0018
        SLL     R0,     1                       ; 532F   0048
        SARC    R0,     1                       ; 5330   0078
        PSHR    R5                              ; 5331   0275
        MVI     G_0168, R1                      ; 5332   0281 0168
        TSTR    R1                              ; 5334   0089
        BNEQ    L_5354                          ; 5335   020C 001D

        INCR    R1                              ; 5337   0009
        MVO     R1,     G_0168                  ; 5338   0241 0168
        INCR    R0                              ; 533A   0008
        ANDI    #$000C, R0                      ; 533B   03B8 000C
        MVII    #$0001, R2                      ; 533D   02BA 0001
        CMPI    #$0000, R0                      ; 533F   0378 0000
        BEQ     L_535E                          ; 5341   0204 001B

        CMPI    #$000C, R0                      ; 5343   0378 000C
        BEQ     L_5372                          ; 5345   0204 002B

        MVII    #$00FF, R2                      ; 5347   02BA 00FF
        SWAP    R2,     2                       ; 5349   0046
        CMPI    #$0008, R0                      ; 534A   0378 0008
        BEQ     L_535E                          ; 534C   0204 0010

        CMPI    #$0004, R0                      ; 534E   0378 0004
        BEQ     L_5372                          ; 5350   0204 0020
        B       L_535D                          ; 5352   0200 0009

L_5354:
        SDBD                                    ; 5354   0001
        CMPI    #$FFFF, R0                      ; 5355   0378 00FF 00FF
        BNEQ    L_535D                          ; 5358   020C 0003

        CLRR    R0                              ; 535A   01C0
        MVO     R0,     G_0168                  ; 535B   0240 0168
L_535D:
        PULR    R7                              ; 535D   02B7

L_535E:
        MVI     G_016B, R0                      ; 535E   0280 016B
        MVI     G_016D, R1                      ; 5360   0281 016D
        ADDR    R2,     R0                      ; 5362   00D0
        BMI     L_5371                          ; 5363   020B 000C

        CMPI    #$0004, R0                      ; 5365   0378 0004
        BC      L_5371                          ; 5367   0201 0008

        MVO     R0,     G_016B                  ; 5369   0240 016B
        SLL     R0,     2                       ; 536B   004C
        SLL     R0,     1                       ; 536C   0048
        ADDR    R0,     R1                      ; 536D   00C1
        SWAP    R1,     1                       ; 536E   0041
        MVO     R1,     G_031F                  ; 536F   0241 031F
L_5371:
        PULR    R7                              ; 5371   02B7

L_5372:
        MVI     G_016C, R0                      ; 5372   0280 016C
        MVI     G_016E, R1                      ; 5374   0281 016E
        ADDR    R2,     R0                      ; 5376   00D0
        BMI     L_5385                          ; 5377   020B 000C

        CMPI    #$0005, R0                      ; 5379   0378 0005
        BC      L_5385                          ; 537B   0201 0008

        MVO     R0,     G_016C                  ; 537D   0240 016C
        SLL     R0,     2                       ; 537F   004C
        SLL     R0,     2                       ; 5380   004C
        ADDR    R0,     R1                      ; 5381   00C1
        SWAP    R1,     1                       ; 5382   0041
        MVO     R1,     G_0320                  ; 5383   0241 0320
L_5385:
        PULR    R7                              ; 5385   02B7

        PSHR    R5                              ; 5386   0275
        TSTR    R0                              ; 5387   0080
        BMI     L_53B0                          ; 5388   020B 0026
        BEQ     L_53B0                          ; 538A   0204 0024

        JSR     R5,     L_5A10                  ; 538C   0004 0158 0210

        MVI     G_016B, R1                      ; 538F   0281 016B
L_5391:
        DECR    R1                              ; 5391   0011
        BMI     L_5397                          ; 5392   020B 0003

        SLL     R2,     2                       ; 5394   004E
        B       L_5391                          ; 5395   0220 0005

L_5397:
        ANDI    #$00C0, R2                      ; 5397   03BA 00C0
        BEQ     L_53A1                          ; 5399   0204 0006

        MVII    #$0019, R0                      ; 539B   02B8 0019

        JSR     R5,     L_68AF                  ; 539D   0004 0168 00AF

        PULR    R7                              ; 53A0   02B7

L_53A1:
        SDBD                                    ; 53A1   0001
        MVII    #$52FB, R0                      ; 53A2   02B8 00FB 0052
        MVO     R0,     G_035D                  ; 53A5   0240 035D
        CLRR    R0                              ; 53A7   01C0
        MVO     R0,     G_031D                  ; 53A8   0240 031D

        JSR     R5,     L_6987                  ; 53AA   0004 0168 0187
        JSR     R5,     L_5439                  ; 53AD   0004 0154 0039

L_53B0:
        PULR    R7                              ; 53B0   02B7

L_53B1:
        PSHR    R5                              ; 53B1   0275
        ADDR    R2,     R1                      ; 53B2   00D1
        SLL     R2,     1                       ; 53B3   004A
        ADDR    R2,     R1                      ; 53B4   00D1
        ADDI    #$0173, R1                      ; 53B5   02F9 0173
        MVI@    R1,     R3                      ; 53B7   028B
        SWAP    R3,     1                       ; 53B8   0043
        MVII    #$0004, R1                      ; 53B9   02B9 0004
L_53BB:
        MVII    #$0003, R0                      ; 53BB   02B8 0003

        JSR     R5,     X_RAND2                 ; 53BD   0004 0114 029E

        SLL     R0,     1                       ; 53C0   0048
        MOVR    R0,     R5                      ; 53C1   0085
        SDBD                                    ; 53C2   0001
        ADDI    #$53E3, R5                      ; 53C3   02FD 00E3 0053
        SDBD                                    ; 53C6   0001
        MVI@    R5,     R2                      ; 53C7   02AA
        SLLC    R3,     1                       ; 53C8   005B
        BC      L_53D6                          ; 53C9   0201 000B

        SLLC    R3,     1                       ; 53CB   005B
        BNC     L_53DE                          ; 53CC   0209 0010

        ANDI    #$01F8, R2                      ; 53CE   03BA 01F8
        SDBD                                    ; 53D0   0001
        XORI    #$1E00, R2                      ; 53D1   03FA 0000 001E
        B       L_53DE                          ; 53D4   0200 0008

L_53D6:
        SDBD                                    ; 53D6   0001
        MVII    #$3CC8, R2                      ; 53D7   02BA 00C8 003C
        SLLC    R3,     1                       ; 53DA   005B
        BC      L_53DE                          ; 53DB   0201 0001

        CLRR    R2                              ; 53DD   01D2
L_53DE:
        MVO@    R2,     R4                      ; 53DE   0262
        DECR    R1                              ; 53DF   0011
        BNEQ    L_53BB                          ; 53E0   022C 0026
        PULR    R7                              ; 53E2   02B7

        MOVR    R2,     R0                      ; 53E3   0090
        COMR    R5                              ; 53E4   001D
        MOVR    R4,     R0                      ; 53E5   00A0
        ADCR    R5                              ; 53E6   002D
        MOVR    R6,     R0                      ; 53E7   00B0
        RSWD    R1                              ; 53E8   0039
L_53E9:
        MVI     G_0160, R0                      ; 53E9   0280 0160
        TSTR    R0                              ; 53EB   0080
        BNEQ    L_53F4                          ; 53EC   020C 0006

        MVI     G_015F, R0                      ; 53EE   0280 015F
        CMPI    #$000F, R0                      ; 53F0   0378 000F
        BLE     L_540D                          ; 53F2   0206 0019

L_53F4:
        MVII    #$0005, R5                      ; 53F4   02BD 0005
        MVII    #$0173, R4                      ; 53F6   02BC 0173
        CLRR    R1                              ; 53F8   01C9
        ADD     G_016A, R4                      ; 53F9   02C4 016A
L_53FB:
        MVI@    R4,     R2                      ; 53FB   02A2
        MVII    #$0004, R3                      ; 53FC   02BB 0004
L_53FE:
        SARC    R2,     1                       ; 53FE   007A
        ADCR    R1                              ; 53FF   0029
        SAR     R2,     1                       ; 5400   006A
        DECR    R3                              ; 5401   0013
        BNEQ    L_53FE                          ; 5402   022C 0005

        INCR    R4                              ; 5404   000C
        INCR    R4                              ; 5405   000C
        DECR    R5                              ; 5406   0015
        BNEQ    L_53FB                          ; 5407   022C 000D

        CMPI    #$0002, R1                      ; 5409   0379 0002
        BLT     L_542B                          ; 540B   0205 001E

L_540D:
        SDBD                                    ; 540D   0001
        MVII    #$542F, R0                      ; 540E   02B8 002F 0054
        MVO     R0,     G_035D                  ; 5411   0240 035D
        MVII    #$001F, R0                      ; 5413   02B8 001F

        JSR     R5,     L_68AF                  ; 5415   0004 0168 00AF

        SDBD                                    ; 5418   0001
        MVII    #$2FA0, R0                      ; 5419   02B8 00A0 002F

        JSR     R5,     L_630F                  ; 541C   0004 0160 030F

        MVII    #$0170, R1                      ; 541F   02B9 0170
        ADD     G_016A, R1                      ; 5421   02C1 016A
        MVI@    R1,     R0                      ; 5423   0288
        MVO     R0,     G_01BE                  ; 5424   0240 01BE
        INCR    R0                              ; 5426   0008

        JSR     R5,     L_64D7                  ; 5427   0004 0164 00D7

        PULR    R7                              ; 542A   02B7

L_542B:
        JSR     R5,     L_6B53                  ; 542B   0004 0168 0353

        PULR    R7                              ; 542E   02B7

        DECLE   $0000,  $0000,  $00BF,  $0062   ; 542F   0000 0000 00BF 0062
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5433   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5437   0000 0000
L_5439:
        PSHR    R5                              ; 5439   0275
        MVII    #$0003, R1                      ; 543A   02B9 0003
        MVO     R1,     G_0102                  ; 543C   0241 0102
        MVII    #$0200, R4                      ; 543E   02BC 0200
        MVII    #$0022, R1                      ; 5440   02B9 0022
        SWAP    R1,     1                       ; 5442   0041
        MVII    #$00F0, R0                      ; 5443   02B8 00F0

        JSR     R5,     X_FILL_MEM              ; 5445   0004 0114 0341
        JSR     R5,     L_5461                  ; 5448   0004 0154 0061
        JSR     R5,     L_5C3A                  ; 544B   0004 015C 003A

        CLRR    R1                              ; 544E   01C9
        MVO     R1,     G_01A1                  ; 544F   0241 01A1
        MVO     R1,     G_01A3                  ; 5451   0241 01A3
        MVII    #$0190, R4                      ; 5453   02BC 0190
L_5455:
        MVO@    R1,     R4                      ; 5455   0261
        CMPI    #$0196, R4                      ; 5456   037C 0196
        BLT     L_5455                          ; 5458   0225 0004

        INCR    R1                              ; 545A   0009
        MVO     R1,     G_0169                  ; 545B   0241 0169

        JSR     R5,     L_55DB                  ; 545D   0004 0154 01DB

        PULR    R7                              ; 5460   02B7

L_5461:
        PSHR    R5                              ; 5461   0275

        JSR     R5,     L_546F                  ; 5462   0004 0154 006F
        JSR     R5,     L_5486                  ; 5465   0004 0154 0086
        JSR     R5,     L_54B7                  ; 5468   0004 0154 00B7
        JSR     R5,     L_554B                  ; 546B   0004 0154 014B

        PULR    R7                              ; 546E   02B7

L_546F:
        PSHR    R5                              ; 546F   0275
        MVII    #$0020, R0                      ; 5470   02B8 0020
        SWAP    R0,     1                       ; 5472   0040
        SDBD                                    ; 5473   0001
        MVII    #$5481, R4                      ; 5474   02BC 0081 0054
L_5477:
        MVI@    R4,     R1                      ; 5477   02A1
        TSTR    R1                              ; 5478   0089
        BEQ     L_5480                          ; 5479   0204 0005

        ADDI    #$0200, R1                      ; 547B   02F9 0200
        MVO@    R0,     R1                      ; 547D   0248
        B       L_5477                          ; 547E   0220 0008
L_5480:
        PULR    R7                              ; 5480   02B7

        DECLE   $0029,  $0039,  $00ED,  $00DD   ; 5481   0029 0039 00ED 00DD
        DECLE   $0000                           ; 5485   0000
L_5486:
        PSHR    R5                              ; 5486   0275
        SDBD                                    ; 5487   0001
        MVII    #$2859, R0                      ; 5488   02B8 0059 0028
        SDBD                                    ; 548B   0001
        MVII    #$54AE, R4                      ; 548C   02BC 00AE 0054
        SDBD                                    ; 548F   0001
        MVII    #$54B3, R5                      ; 5490   02BD 00B3 0054
L_5493:
        MVI@    R4,     R3                      ; 5493   02A3
        TSTR    R3                              ; 5494   009B
        BEQ     L_54AD                          ; 5495   0204 0016

        ADDI    #$0200, R3                      ; 5497   02FB 0200
        MVI@    R5,     R2                      ; 5499   02AA
        MVII    #$000F, R1                      ; 549A   02B9 000F
        CMPI    #$0001, R2                      ; 549C   037A 0001
        BEQ     L_54A2                          ; 549E   0204 0002

        MVII    #$0008, R1                      ; 54A0   02B9 0008
L_54A2:
        DECR    R1                              ; 54A2   0011
        BMI     L_54A9                          ; 54A3   020B 0004

        ADDR    R2,     R3                      ; 54A5   00D3
        MVO@    R0,     R3                      ; 54A6   0258
        B       L_54A2                          ; 54A7   0220 0006

L_54A9:
        ADDI    #$0008, R0                      ; 54A9   02F8 0008
        B       L_5493                          ; 54AB   0220 0019
L_54AD:
        PULR    R7                              ; 54AD   02B7

        DECLE   $0039,  $00DD,  $0029,  $0029   ; 54AE   0039 00DD 0029 0029
        DECLE   $0000,  $0014,  $0001,  $0014   ; 54B2   0000 0014 0001 0014
        DECLE   $0001                           ; 54B6   0001
L_54B7:
        PSHR    R5                              ; 54B7   0275
        MVII    #$0008, R2                      ; 54B8   02BA 0008
        MVII    #$023E, R4                      ; 54BA   02BC 023E
L_54BC:
        PSHR    R2                              ; 54BC   0272
        SDBD                                    ; 54BD   0001
        MVII    #$D7FE, R1                      ; 54BE   02B9 00FE 00D7
        MVII    #$000F, R3                      ; 54C1   02BB 000F

        JSR     R5,     L_54CD                  ; 54C3   0004 0154 00CD

        ADDI    #$0005, R4                      ; 54C6   02FC 0005
        PULR    R2                              ; 54C8   02B2
        DECR    R2                              ; 54C9   0012
        BNEQ    L_54BC                          ; 54CA   022C 000F
        PULR    R7                              ; 54CC   02B7

L_54CD:
        PSHR    R5                              ; 54CD   0275
L_54CE:
        MVII    #$000B, R0                      ; 54CE   02B8 000B

        JSR     R5,     X_RAND2                 ; 54D0   0004 0114 029E

        SLL     R0,     2                       ; 54D3   004C
        SLL     R0,     1                       ; 54D4   0048
        ANDR    R1,     R0                      ; 54D5   0188
        COMR    R1                              ; 54D6   0019
        XORR    R1,     R0                      ; 54D7   01C8
        MVO@    R0,     R4                      ; 54D8   0260
        COMR    R1                              ; 54D9   0019
        DECR    R3                              ; 54DA   0013
        BNEQ    L_54CE                          ; 54DB   022C 000E
        PULR    R7                              ; 54DD   02B7

        PSHR    R5                              ; 54DE   0275
        PULR    R7                              ; 54DF   02B7

L_54E0:
        PSHR    R5                              ; 54E0   0275
L_54E1:
        MVII    #$0006, R0                      ; 54E1   02B8 0006

        JSR     R5,     X_RAND2                 ; 54E3   0004 0114 029E

        PSHR    R0                              ; 54E6   0270
        MVII    #$0001, R1                      ; 54E7   02B9 0001
L_54E9:
        DECR    R0                              ; 54E9   0010
        BMI     L_54EF                          ; 54EA   020B 0003

        SLL     R1,     1                       ; 54EC   0049
        B       L_54E9                          ; 54ED   0220 0005

L_54EF:
        MOVR    R1,     R0                      ; 54EF   0088
        ANDR    R2,     R1                      ; 54F0   0191
        PULR    R1                              ; 54F1   02B1
        BNEQ    L_54E1                          ; 54F2   022C 0012

        XORR    R0,     R2                      ; 54F4   01C2
        PULR    R7                              ; 54F5   02B7

L_54F6:
        PSHR    R5                              ; 54F6   0275
        MVI     G_018E, R2                      ; 54F7   0282 018E

        JSR     R5,     L_54E0                  ; 54F9   0004 0154 00E0

        MVO     R2,     G_018E                  ; 54FC   0242 018E
        SDBD                                    ; 54FE   0001
        MVII    #$550A, R2                      ; 54FF   02BA 000A 0055
        ADDR    R1,     R2                      ; 5502   00CA
        MVI@    R2,     R1                      ; 5503   0291
        SDBD                                    ; 5504   0001
        XORI    #$3080, R1                      ; 5505   03F9 0080 0030
        MVO@    R1,     R4                      ; 5508   0261
        PULR    R7                              ; 5509   02B7

        EIS                                     ; 550A   0002
        DIS                                     ; 550B   0003
        CLRC                                    ; 550C   0006
        DECR    R2                              ; 550D   0012
        DECR    R4                              ; 550E   0014
        DECR    R5                              ; 550F   0015
        DECR    R0                              ; 5510   0010
L_5511:
        PSHR    R5                              ; 5511   0275
L_5512:
        MVII    #$000D, R0                      ; 5512   02B8 000D

        JSR     R5,     X_RAND2                 ; 5514   0004 0114 029E

        MOVR    R0,     R1                      ; 5517   0081
        MVII    #$0008, R0                      ; 5518   02B8 0008

        JSR     R5,     X_RAND2                 ; 551A   0004 0114 029E

        MVII    #$0188, R5                      ; 551D   02BD 0188
L_551F:
        CMPR    R3,     R5                      ; 551F   015D
        BEQ     L_553B                          ; 5520   0204 0019

        PSHR    R3                              ; 5522   0273
        MVI@    R5,     R2                      ; 5523   02AA
        MOVR    R2,     R3                      ; 5524   0093
        ANDI    #$00F0, R2                      ; 5525   03BA 00F0
        SLR     R2,     2                       ; 5527   0066
        SLR     R2,     2                       ; 5528   0066
        SUBR    R0,     R2                      ; 5529   0102
        BPL     L_552D                          ; 552A   0203 0001

        NEGR    R2                              ; 552C   0022
L_552D:
        ANDI    #$000F, R3                      ; 552D   03BB 000F
        SUBR    R1,     R3                      ; 552F   010B
        BPL     L_5533                          ; 5530   0203 0001

        NEGR    R3                              ; 5532   0023
L_5533:
        ADDR    R3,     R2                      ; 5533   00DA
        PULR    R3                              ; 5534   02B3
        CMPI    #$0002, R2                      ; 5535   037A 0002
        BLE     L_5512                          ; 5537   0226 0026
        B       L_551F                          ; 5539   0220 001B

L_553B:
        MOVR    R1,     R2                      ; 553B   008A
        SLL     R1,     2                       ; 553C   004D
        SLL     R1,     1                       ; 553D   0049
        ADDI    #$001C, R1                      ; 553E   02F9 001C
        SWAP    R1,     1                       ; 5540   0041
        ADDI    #$0004, R1                      ; 5541   02F9 0004
        SLL     R0,     2                       ; 5543   004C
        SLL     R0,     2                       ; 5544   004C
        XORR    R0,     R2                      ; 5545   01C2
        SAR     R0,     1                       ; 5546   0068
        ADDI    #$0020, R0                      ; 5547   02F8 0020
        SWAP    R0,     1                       ; 5549   0040
        PULR    R7                              ; 554A   02B7

L_554B:
        PSHR    R5                              ; 554B   0275
        CLRR    R0                              ; 554C   01C0
        MVO     R0,     G_031E                  ; 554D   0240 031E
        MVO     R0,     G_018E                  ; 554F   0240 018E
        MVO     R0,     G_018F                  ; 5551   0240 018F
        MVO     R0,     G_0190                  ; 5553   0240 0190
        MVII    #$032D, R4                      ; 5555   02BC 032D
        MVII    #$0030, R0                      ; 5557   02B8 0030

        JSR     R5,     X_FILL_ZERO             ; 5559   0004 0114 0338

        MVII    #$032D, R4                      ; 555C   02BC 032D
        MVII    #$0188, R3                      ; 555E   02BB 0188

L_5560:
        JSR     R5,     L_54F6                  ; 5560   0004 0154 00F6

        MVI     G_018F, R2                      ; 5563   0282 018F

        JSR     R5,     L_54E0                  ; 5565   0004 0154 00E0

        MVO     R2,     G_018F                  ; 5568   0242 018F
        MVII    #$0007, R0                      ; 556A   02B8 0007

        JSR     R5,     X_MPY                   ; 556C   0004 011C 01DC

        SDBD                                    ; 556F   0001
        MVII    #$5D9D, R1                      ; 5570   02B9 009D 005D
        ADDR    R2,     R1                      ; 5573   00D1
        MVO@    R1,     R4                      ; 5574   0261

        JSR     R5,     L_5511                  ; 5575   0004 0154 0111

        MVO@    R1,     R4                      ; 5578   0261
        MVO@    R0,     R4                      ; 5579   0260
        MVO@    R2,     R3                      ; 557A   025A
        INCR    R3                              ; 557B   000B
        PSHR    R4                              ; 557C   0274
        MOVR    R2,     R1                      ; 557D   0091
        ANDI    #$00F0, R1                      ; 557E   03B9 00F0
        SAR     R1,     2                       ; 5580   006D
        ADDR    R1,     R2                      ; 5581   00CA
        ADDI    #$023E, R2                      ; 5582   02FA 023E
        MOVR    R2,     R5                      ; 5584   0095
        SDBD                                    ; 5585   0001
        MVII    #$559D, R4                      ; 5586   02BC 009D 0055
        MVII    #$0003, R1                      ; 5589   02B9 0003
L_558B:
        SDBD                                    ; 558B   0001
        MVI@    R4,     R0                      ; 558C   02A0
        MVO@    R0,     R5                      ; 558D   0268
        DECR    R1                              ; 558E   0011
        BNEQ    L_558B                          ; 558F   022C 0005

        PULR    R4                              ; 5591   02B4
        INCR    R4                              ; 5592   000C
        MVII    #$0300, R0                      ; 5593   02B8 0300
        MVO@    R0,     R4                      ; 5595   0260
        ADDI    #$0002, R4                      ; 5596   02FC 0002
        CMPI    #$035D, R4                      ; 5598   037C 035D
        BLT     L_5560                          ; 559A   0225 003B
        PULR    R7                              ; 559C   02B7

        MOVR    R6,     R1                      ; 559D   00B1
        ADCR    R0                              ; 559E   0028
        MOVR    R7,     R1                      ; 559F   00B9
        ADCR    R0                              ; 55A0   0028
        ADDR    R0,     R1                      ; 55A1   00C1
        ADCR    R0                              ; 55A2   0028
L_55A3:
        PSHR    R5                              ; 55A3   0275
        MVII    #$0196, R4                      ; 55A4   02BC 0196
        SDBD                                    ; 55A6   0001
        MVI@    R4,     R3                      ; 55A7   02A3
        MVI@    R3,     R0                      ; 55A8   0298
        SDBD                                    ; 55A9   0001
        ANDI    #$FFE0, R0                      ; 55AA   03B8 00E0 00FF
        XORI    #$0007, R0                      ; 55AD   03F8 0007
        MVO@    R0,     R3                      ; 55AF   0258
        SDBD                                    ; 55B0   0001
        MVII    #$5056, R1                      ; 55B1   02B9 0056 0050

        JSR     R5,     X_TIMER_STOP            ; 55B4   0004 0118 0038

        SDBD                                    ; 55B7   0001
        MVII    #$505A, R1                      ; 55B8   02B9 005A 0050

        JSR     R5,     X_TIMER_START           ; 55BB   0004 0118 0044

        PULR    R7                              ; 55BE   02B7

L_55BF:
        PSHR    R5                              ; 55BF   0275
        MVII    #$0196, R4                      ; 55C0   02BC 0196
        SDBD                                    ; 55C2   0001
        MVI@    R4,     R3                      ; 55C3   02A3
        MVI@    R3,     R0                      ; 55C4   0298
        SDBD                                    ; 55C5   0001
        ANDI    #$FFE0, R0                      ; 55C6   03B8 00E0 00FF
        XOR     G_0198, R0                      ; 55C9   03C0 0198
        MVO@    R0,     R3                      ; 55CB   0258
        SDBD                                    ; 55CC   0001
        MVII    #$505A, R1                      ; 55CD   02B9 005A 0050

        JSR     R5,     X_TIMER_STOP            ; 55D0   0004 0118 0038

        SDBD                                    ; 55D3   0001
        MVII    #$5056, R1                      ; 55D4   02B9 0056 0050

        JSR     R5,     X_TIMER_START           ; 55D7   0004 0118 0044

        PULR    R7                              ; 55DA   02B7

L_55DB:
        PSHR    R5                              ; 55DB   0275
        CLRR    R0                              ; 55DC   01C0
        MVO     R0,     G_0199                  ; 55DD   0240 0199

        JSR     R5,     L_56B3                  ; 55DF   0004 0154 02B3

        BC      L_55EB                          ; 55E2   0201 0007

        JSR     R5,     L_55BF                  ; 55E4   0004 0154 01BF

        MVII    #$0051, R0                      ; 55E7   02B8 0051
        MVO     R0,     G_01A2                  ; 55E9   0240 01A2
L_55EB:
        PULR    R7                              ; 55EB   02B7

        PSHR    R5                              ; 55EC   0275
        CMPI    #$0002, R0                      ; 55ED   0378 0002
        BNEQ    L_55F6                          ; 55EF   020C 0005

        MVI     G_01A0, R0                      ; 55F1   0280 01A0
        TSTR    R0                              ; 55F3   0080
        BNEQ    L_563A                          ; 55F4   020C 0044

L_55F6:
        MVI     G_01CC, R0                      ; 55F6   0280 01CC
        ANDI    #$0040, R0                      ; 55F8   03B8 0040
        BEQ     L_5606                          ; 55FA   0204 000A

L_55FC:
        MVII    #$0196, R4                      ; 55FC   02BC 0196
        SDBD                                    ; 55FE   0001
        MVI@    R4,     R3                      ; 55FF   02A3
        ADDI    #$0006, R3                      ; 5600   02FB 0006
        MVII    #$000A, R0                      ; 5602   02B8 000A
        MVO@    R0,     R3                      ; 5604   0258
        PULR    R7                              ; 5605   02B7

L_5606:
        MVI     G_01A2, R0                      ; 5606   0280 01A2
        SARC    R0,     1                       ; 5608   0078
        BNC     L_561E                          ; 5609   0209 0013

        MVO     R0,     G_01A2                  ; 560B   0240 01A2
        MVII    #$0043, R0                      ; 560D   02B8 0043
        MVI     G_01AB, R1                      ; 560F   0281 01AB
        TSTR    R1                              ; 5611   0089
        BNEQ    L_5616                          ; 5612   020C 0002

        MVII    #$004F, R0                      ; 5614   02B8 004F

L_5616:
        JSR     R5,     L_68AF                  ; 5616   0004 0168 00AF
        JSR     R5,     L_69D9                  ; 5619   0004 0168 01D9

        B       L_55FC                          ; 561C   0220 0021

L_561E:
        JSR     R5,     L_55BF                  ; 561E   0004 0154 01BF
        JSR     R5,     L_56B3                  ; 5621   0004 0154 02B3

        BNC     L_5631                          ; 5624   0209 000B

        SDBD                                    ; 5626   0001
        MVII    #$5056, R1                      ; 5627   02B9 0056 0050

        JSR     R5,     X_TIMER_STOP            ; 562A   0004 0118 0038

        CLRR    R1                              ; 562D   01C9
        MVO     R1,     G_01A2                  ; 562E   0241 01A2
        PULR    R7                              ; 5630   02B7

L_5631:
        MVII    #$0083, R0                      ; 5631   02B8 0083

        JSR     R5,     L_68AF                  ; 5633   0004 0168 00AF
        JSR     R5,     L_69D9                  ; 5636   0004 0168 01D9

        PULR    R7                              ; 5639   02B7

L_563A:
        CMPI    #$0002, R0                      ; 563A   0378 0002
        BEQ     L_568F                          ; 563C   0204 0051

        CMPI    #$0003, R0                      ; 563E   0378 0003
        BEQ     L_56A2                          ; 5640   0204 0060

        MVII    #$0001, R0                      ; 5642   02B8 0001

        JSR     R5,     L_6AE9                  ; 5644   0004 0168 02E9

        CLRR    R0                              ; 5647   01C0
        MVO     R0,     G_01A0                  ; 5648   0240 01A0
        MVO     R0,     G_0331                  ; 564A   0240 0331
        MVO     R0,     G_032F                  ; 564C   0240 032F
        MVII    #$0013, R1                      ; 564E   02B9 0013
        MVO     R1,     G_0190                  ; 5650   0241 0190
        MVI     G_019C, R1                      ; 5652   0281 019C
        CMPI    #$0002, R1                      ; 5654   0379 0002
        BNEQ    L_565C                          ; 5656   020C 0004

        MVO     R0,     G_0322                  ; 5658   0240 0322
        MVO     R0,     G_032A                  ; 565A   0240 032A
L_565C:
        MVII    #$000B, R0                      ; 565C   02B8 000B
        MVO     R0,     G_019A                  ; 565E   0240 019A
        MVI     G_01AA, R0                      ; 5660   0280 01AA
        TSTR    R0                              ; 5662   0080
        BNEQ    L_566B                          ; 5663   020C 0006

        MVI     G_01A7, R0                      ; 5665   0280 01A7
        TSTR    R0                              ; 5667   0080
        BEQ     L_5679                          ; 5668   0204 000F
        PULR    R7                              ; 566A   02B7

L_566B:
        JSR     R5,     L_55BF                  ; 566B   0004 0154 01BF

        SDBD                                    ; 566E   0001
        MVII    #$5056, R1                      ; 566F   02B9 0056 0050

        JSR     R5,     X_TIMER_STOP            ; 5672   0004 0118 0038

        CLRR    R0                              ; 5675   01C0
        MVO     R0,     G_01AA                  ; 5676   0240 01AA
L_5678:
        PULR    R7                              ; 5678   02B7

L_5679:
        MVII    #$0003, R0                      ; 5679   02B8 0003
        CMP     G_0165, R0                      ; 567B   0340 0165
        BNEQ    L_5678                          ; 567D   022C 0006

        JSR     R5,     X_RAND2                 ; 567F   0004 0114 029E

        TSTR    R0                              ; 5682   0080
        BNEQ    L_5678                          ; 5683   022C 000C

        INCR    R0                              ; 5685   0008
        MVO     R0,     G_01AA                  ; 5686   0240 01AA

        JSR     R5,     L_5BE0                  ; 5688   0004 0158 03E0
        JSR     R5,     L_6AB8                  ; 568B   0004 0168 02B8

        PULR    R7                              ; 568E   02B7

L_568F:
        CLRR    R0                              ; 568F   01C0
        MVO     R0,     G_0331                  ; 5690   0240 0331
        MVII    #$0028, R3                      ; 5692   02BB 0028
        SDBD                                    ; 5694   0001
        MVII    #$9866, R2                      ; 5695   02BA 0066 0098
        MVII    #$032D, R1                      ; 5698   02B9 032D

        JSR     R5,     .EXEC.9A1               ; 569A   0004 0118 01A1

        MVII    #$0001, R0                      ; 569D   02B8 0001
        MVO     R0,     G_01A0                  ; 569F   0240 01A0
        PULR    R7                              ; 56A1   02B7

L_56A2:
        CLRR    R0                              ; 56A2   01C0
        MVO     R0,     G_0331                  ; 56A3   0240 0331
        MVO     R0,     G_01A0                  ; 56A5   0240 01A0

        JSR     R5,     L_5C14                  ; 56A7   0004 015C 0014

        MVII    #$0010, R0                      ; 56AA   02B8 0010
        MVO     R0,     G_0198                  ; 56AC   0240 0198
        MVII    #$00FE, R0                      ; 56AE   02B8 00FE
        MVO     R0,     G_0167                  ; 56B0   0240 0167
        PULR    R7                              ; 56B2   02B7

L_56B3:
        PSHR    R5                              ; 56B3   0275
        MVI     G_0199, R0                      ; 56B4   0280 0199
        MVI     G_01AC, R1                      ; 56B6   0281 01AC
        ADDI    #$0188, R1                      ; 56B8   02F9 0188
L_56BA:
        MVII    #$0188, R4                      ; 56BA   02BC 0188
        ADD     G_01A1, R4                      ; 56BC   02C4 01A1
        MVI     G_0190, R2                      ; 56BE   0282 0190
        TSTR    R2                              ; 56C0   0092
        BEQ     L_56C4                          ; 56C1   0204 0001

        INCR    R4                              ; 56C3   000C
L_56C4:
        CMPR    R1,     R4                      ; 56C4   014C
        BGE     L_56CC                          ; 56C5   020D 0005

        CMP@    R4,     R0                      ; 56C7   0360
        BEQ     L_56D3                          ; 56C8   0204 0009
        B       L_56C4                          ; 56CA   0220 0007

L_56CC:
        INCR    R0                              ; 56CC   0008
        CMPI    #$00FF, R0                      ; 56CD   0378 00FF
        BNC     L_56BA                          ; 56CF   0229 0016
        B       L_56EF                          ; 56D1   0200 001C

L_56D3:
        SUBI    #$0189, R4                      ; 56D3   033C 0189
        SUB     G_01A1, R4                      ; 56D5   0304 01A1
        MOVR    R4,     R1                      ; 56D7   00A1
        SLL     R1,     2                       ; 56D8   004D
        SLL     R1,     1                       ; 56D9   0049
        ADDI    #$032D, R1                      ; 56DA   02F9 032D
        INCR    R0                              ; 56DC   0008
        MVO     R0,     G_0199                  ; 56DD   0240 0199
        MVII    #$0014, R2                      ; 56DF   02BA 0014
        MOVR    R1,     R3                      ; 56E1   008B
        ADDI    #$0006, R1                      ; 56E2   02F9 0006
        MVO@    R2,     R1                      ; 56E4   024A
        MVI@    R3,     R2                      ; 56E5   029A
        ANDI    #$001F, R2                      ; 56E6   03BA 001F
        MVO     R2,     G_0198                  ; 56E8   0242 0198
        MVO     R3,     G_0196                  ; 56EA   0243 0196
        SWAP    R3,     1                       ; 56EC   0043
        MVO     R3,     G_0197                  ; 56ED   0243 0197
L_56EF:
        PULR    R7                              ; 56EF   02B7

        PSHR    R5                              ; 56F0   0275
        MVI     G_019C, R3                      ; 56F1   0283 019C
        TSTR    R3                              ; 56F3   009B
        BEQ     L_5753                          ; 56F4   0204 005D

        MVI     G_01A4, R4                      ; 56F6   0284 01A4
        TSTR    R4                              ; 56F8   00A4
        BNEQ    L_578A                          ; 56F9   020C 008F

        MVII    #$0010, R1                      ; 56FB   02B9 0010
        MVII    #$0002, R2                      ; 56FD   02BA 0002
        MOVR    R3,     R4                      ; 56FF   009C
        CMPI    #$0002, R3                      ; 5700   037B 0002
        BNEQ    L_5706                          ; 5702   020C 0002

        MVII    #$0003, R2                      ; 5704   02BA 0003
L_5706:
        SARC    R3,     1                       ; 5706   007B
        BC      L_570B                          ; 5707   0201 0002

        MVII    #$00F0, R1                      ; 5709   02B9 00F0
L_570B:
        MVO     R1,     G_0183                  ; 570B   0241 0183
        MVO     R2,     G_0184                  ; 570D   0242 0184
        DECR    R4                              ; 570F   0014
        MOVR    R4,     R3                      ; 5710   00A3
        SLL     R3,     1                       ; 5711   004B
        ADDR    R3,     R4                      ; 5712   00DC
        SDBD                                    ; 5713   0001
        ADDI    #$5754, R4                      ; 5714   02FC 0054 0057
        INCR    R0                              ; 5717   0008
        ADDR    R0,     R4                      ; 5718   00C4
        MVI@    R4,     R1                      ; 5719   02A1
        MVO     R1,     G_0322                  ; 571A   0241 0322
        MVI     G_019C, R3                      ; 571C   0283 019C
        CMPI    #$0003, R3                      ; 571E   037B 0003
        BLT     L_5738                          ; 5720   0205 0016

        CMPI    #$0002, R0                      ; 5722   0378 0002
        BNEQ    L_573A                          ; 5724   020C 0014

        MVII    #$0200, R1                      ; 5726   02B9 0200
        MVO     R1,     G_032A                  ; 5728   0241 032A
        MVII    #$001B, R1                      ; 572A   02B9 001B
        AND     .PSG0.chan_enable,R1            ; 572C   0381 01F8
        XORI    #$0004, R1                      ; 572E   03F9 0004
        MVO     R1,     .PSG0.chan_enable       ; 5730   0241 01F8
        MVII    #$000E, R1                      ; 5732   02B9 000E
        MVO     R1,     .PSG0.chn_c_vol         ; 5734   0241 01FD
        B       L_573A                          ; 5736   0200 0002

L_5738:
        MVO     R1,     G_032A                  ; 5738   0241 032A
L_573A:
        TSTR    R0                              ; 573A   0080
        BNEQ    L_5753                          ; 573B   020C 0016

        SDBD                                    ; 573D   0001
        MVII    #$5760, R4                      ; 573E   02BC 0060 0057
        MVI     G_019C, R3                      ; 5741   0283 019C
        CMPI    #$0003, R3                      ; 5743   037B 0003
        BLT     L_574E                          ; 5745   0205 0007

        MVII    #$0003, R1                      ; 5747   02B9 0003
        MVO     R1,     G_032A                  ; 5749   0241 032A
        CLRR    R1                              ; 574B   01C9
        MVO     R1,     .PSG0.chn_c_vol         ; 574C   0241 01FD
L_574E:
        DECR    R3                              ; 574E   0013
        SLL     R3,     1                       ; 574F   004B
        ADDR    R3,     R4                      ; 5750   00DC
        SDBD                                    ; 5751   0001
        MVI@    R4,     R7                      ; 5752   02A7
L_5753:
        PULR    R7                              ; 5753   02B7

        DECLE   $0000,  $0000,  $0001,  $0003   ; 5754   0000 0000 0001 0003
        DECLE   $0002,  $0001,  $0000,  $0001   ; 5758   0002 0001 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 575C   0000 0000 0000 0000

        MOVR    R1,     R3                      ; 5760   008B
        RLC     R3,     2                       ; 5761   0057
        SWAP    R1,     1                       ; 5762   0041
        SLLC    R1,     1                       ; 5763   0059
        MOVR    R1,     R3                      ; 5764   008B
        RLC     R3,     2                       ; 5765   0057
        SAR     R0,     1                       ; 5766   0068
        RLC     R3,     2                       ; 5767   0057
        MVI     G_01A7, R0                      ; 5768   0280 01A7
        ANDI    #$0080, R0                      ; 576A   03B8 0080
        BEQ     L_578A                          ; 576C   0204 001C

        CLRR    R3                              ; 576E   01DB

        JSR     R5,     L_5252                  ; 576F   0004 0150 0252

        BC      L_578A                          ; 5772   0201 0016

        MVI     G_01A8, R0                      ; 5774   0280 01A8
        MVO     R0,     G_0198                  ; 5776   0240 0198

        JSR     R5,     L_55BF                  ; 5778   0004 0154 01BF

        SDBD                                    ; 577B   0001
        MVII    #$5056, R1                      ; 577C   02B9 0056 0050

        JSR     R5,     X_TIMER_STOP            ; 577F   0004 0118 0038

        CLRR    R0                              ; 5782   01C0
        MVO     R0,     G_01A9                  ; 5783   0240 01A9
        MVII    #$0006, R3                      ; 5785   02BB 0006

        JSR     R5,     L_59A0                  ; 5787   0004 0158 01A0

L_578A:
        PULR    R7                              ; 578A   02B7

        MOVR    R3,     R0                      ; 578B   0098
        CLRR    R3                              ; 578C   01DB
        MVO     R3,     G_019B                  ; 578D   0243 019B
        TSTR    R0                              ; 578F   0080
        BEQ     L_5798                          ; 5790   0204 0006

        MVI     G_0167, R0                      ; 5792   0280 0167
        TSTR    R0                              ; 5794   0080
        BEQ     L_5798                          ; 5795   0204 0001

        INCR    R3                              ; 5797   000B
L_5798:
        PSHR    R3                              ; 5798   0273

        JSR     R5,     L_57A8                  ; 5799   0004 0154 03A8

        PULR    R3                              ; 579C   02B3
        INCR    R3                              ; 579D   000B
        CMPI    #$0006, R3                      ; 579E   037B 0006
        BLT     L_5798                          ; 57A0   0225 0009

        MVI     G_019B, R0                      ; 57A2   0280 019B

        JSR     R5,     L_6AE9                  ; 57A4   0004 0168 02E9

        PULR    R7                              ; 57A7   02B7

L_57A8:
        PSHR    R5                              ; 57A8   0275
        PSHR    R3                              ; 57A9   0273

        JSR     R5,     L_5252                  ; 57AA   0004 0150 0252

        PULR    R3                              ; 57AD   02B3
        BNC     L_57B1                          ; 57AE   0209 0001
        PULR    R7                              ; 57B0   02B7

L_57B1:
        MVII    #$0001, R0                      ; 57B1   02B8 0001
        MVO     R0,     G_019B                  ; 57B3   0240 019B
        MOVR    R3,     R2                      ; 57B5   009A
        SLL     R2,     2                       ; 57B6   004E
        SLL     R2,     1                       ; 57B7   004A
        ADDI    #$032E, R2                      ; 57B8   02FA 032E
        MVI@    R2,     R0                      ; 57BA   0290
        SDBD                                    ; 57BB   0001
        CMPI    #$5DC7, R0                      ; 57BC   0378 00C7 005D
        MVII    #$0002, R0                      ; 57BF   02B8 0002
        BNEQ    L_57C4                          ; 57C1   020C 0001

        CLRR    R0                              ; 57C3   01C0
L_57C4:
        ADDI    #$0190, R3                      ; 57C4   02FB 0190
        ADD@    R3,     R4                      ; 57C6   02DC
        MVI@    R4,     R1                      ; 57C7   02A1
        MVO@    R1,     R3                      ; 57C8   0259
        TSTR    R1                              ; 57C9   0089
        BNEQ    L_57D2                          ; 57CA   020C 0006

        CMPI    #$0191, R3                      ; 57CC   037B 0191
        BLT     L_57D2                          ; 57CE   0205 0002

        ADDI    #$0300, R0                      ; 57D0   02F8 0300
L_57D2:
        ADDI    #$0004, R2                      ; 57D2   02FA 0004
        ADDR    R1,     R0                      ; 57D4   00C8
        MVO@    R0,     R2                      ; 57D5   0250
        MVI     G_019C, R2                      ; 57D6   0282 019C
        DECR    R2                              ; 57D8   0012
        BNEQ    L_57F6                          ; 57D9   020C 001B

        CMPI    #$0003, R1                      ; 57DB   0379 0003
        BEQ     L_587F                          ; 57DD   0204 00A0

        CMPI    #$0191, R3                      ; 57DF   037B 0191
        BGE     L_57EB                          ; 57E1   020D 0008

        CLRR    R0                              ; 57E3   01C0
        MVO     R0,     G_0167                  ; 57E4   0240 0167
        MVII    #$000B, R0                      ; 57E6   02B8 000B
        MVO     R0,     G_019A                  ; 57E8   0240 019A
        PULR    R7                              ; 57EA   02B7

L_57EB:
        SUBI    #$0190, R3                      ; 57EB   033B 0190

        JSR     R5,     L_59B2                  ; 57ED   0004 0158 01B2

        MVII    #$00C1, R0                      ; 57F0   02B8 00C1

        JSR     R5,     L_68AF                  ; 57F2   0004 0168 00AF

        PULR    R7                              ; 57F5   02B7

L_57F6:
        TSTR    R1                              ; 57F6   0089
        BNEQ    L_587F                          ; 57F7   020C 0086

        CMPI    #$0191, R3                      ; 57F9   037B 0191
        BGE     L_581F                          ; 57FB   020D 0022

        MVI     G_0334, R1                      ; 57FD   0281 0334
        CMP     G_019A, R1                      ; 57FF   0341 019A
        BEQ     L_5825                          ; 5801   0204 0022

        MVII    #$00FD, R0                      ; 5803   02B8 00FD
        MVO     R0,     G_0167                  ; 5805   0240 0167
        MVI     G_0160, R0                      ; 5807   0280 0160
        CMPI    #$0014, R0                      ; 5809   0378 0014
        BGE     L_5815                          ; 580B   020D 0008

        MVII    #$0010, R0                      ; 580D   02B8 0010

        JSR     R5,     X_RAND2                 ; 580F   0004 0114 029E

        SARC    R0,     1                       ; 5812   0078
        BC      L_581B                          ; 5813   0201 0006

L_5815:
        MVII    #$00B3, R0                      ; 5815   02B8 00B3

        JSR     R5,     L_68AF                  ; 5817   0004 0168 00AF

        PULR    R7                              ; 581A   02B7

L_581B:
        JSR     R5,     L_6987                  ; 581B   0004 0168 0187

        PULR    R7                              ; 581E   02B7

L_581F:
        SUBI    #$0190, R3                      ; 581F   033B 0190

        JSR     R5,     L_59A0                  ; 5821   0004 0158 01A0

        PULR    R7                              ; 5824   02B7

L_5825:
        MVI     G_0165, R0                      ; 5825   0280 0165
        INCR    R0                              ; 5827   0008
        INCR    R0                              ; 5828   0008
        ADDI    #$01AF, R1                      ; 5829   02F9 01AF
        MVI@    R1,     R2                      ; 582B   028A
        CMPI    #$0066, R2                      ; 582C   037A 0066
        BNEQ    L_5832                          ; 582E   020C 0002

        MVII    #$0002, R0                      ; 5830   02B8 0002

L_5832:
        JSR     R5,     L_649E                  ; 5832   0004 0164 009E

        MVI     G_01A1, R0                      ; 5835   0280 01A1
        INCR    R0                              ; 5837   0008
        CMP     G_01AC, R0                      ; 5838   0340 01AC
        BEQ     L_5870                          ; 583A   0204 0034

        MVO     R0,     G_01A1                  ; 583C   0240 01A1
        MVI     G_0196, R0                      ; 583E   0280 0196
        SUBI    #$0008, R0                      ; 5840   0338 0008
        MVO     R0,     G_0196                  ; 5842   0240 0196
        MVII    #$032D, R4                      ; 5844   02BC 032D
L_5846:
        MVI@    R4,     R1                      ; 5846   02A1
        PSHR    R1                              ; 5847   0271
        CMPI    #$0335, R4                      ; 5848   037C 0335
        BNEQ    L_5846                          ; 584A   022C 0005

        MVII    #$032D, R5                      ; 584C   02BD 032D
L_584E:
        MVI@    R4,     R1                      ; 584E   02A1
        MVO@    R1,     R5                      ; 584F   0269
        CMPI    #$0355, R5                      ; 5850   037D 0355
        BNEQ    L_584E                          ; 5852   022C 0005

        MVII    #$035C, R2                      ; 5854   02BA 035C
L_5856:
        PULR    R1                              ; 5856   02B1
        MVO@    R1,     R2                      ; 5857   0251
        DECR    R2                              ; 5858   0012
        CMPI    #$0355, R2                      ; 5859   037A 0355
        BGE     L_5856                          ; 585B   022D 0006

        MVII    #$0190, R4                      ; 585D   02BC 0190
        MOVR    R4,     R5                      ; 585F   00A5
        MVI@    R5,     R0                      ; 5860   02A8
        PSHR    R0                              ; 5861   0270
L_5862:
        MVI@    R5,     R0                      ; 5862   02A8
        MVO@    R0,     R4                      ; 5863   0260
        CMPI    #$0195, R4                      ; 5864   037C 0195
        BLT     L_5862                          ; 5866   0225 0005

        PULR    R0                              ; 5868   02B0
        MVO@    R0,     R4                      ; 5869   0260
        MVII    #$0037, R0                      ; 586A   02B8 0037

        JSR     R5,     L_68AF                  ; 586C   0004 0168 00AF

        PULR    R7                              ; 586F   02B7

L_5870:
        MVII    #$0208, R4                      ; 5870   02BC 0208
        MVII    #$0022, R1                      ; 5872   02B9 0022
        SWAP    R1,     1                       ; 5874   0041
        MVII    #$0020, R0                      ; 5875   02B8 0020
        MVO     R0,     G_01A3                  ; 5877   0240 01A3

        JSR     R5,     X_FILL_MEM              ; 5879   0004 0114 0341
        JSR     R5,     L_697E                  ; 587C   0004 0168 017E

L_587F:
        PULR    R7                              ; 587F   02B7

        DECLE   $0001,  $0001,  $0003,  $0003   ; 5880   0001 0001 0003 0003
        DECLE   $0002,  $0003,  $0002,  $0003   ; 5884   0002 0003 0002 0003
        DECLE   $0000,  $0000,  $0002,  $0002   ; 5888   0000 0000 0002 0002
        DECLE   $0000,  $0001,  $0000,  $0001   ; 588C   0000 0001 0000 0001
        DECLE   $0002,  $0002,  $0002,  $0002   ; 5890   0002 0002 0002 0002
        DECLE   $0002,  $0002,  $0000           ; 5894   0002 0002 0000
L_5897:
        PSHR    R5                              ; 5897   0275
        MVII    #$032F, R4                      ; 5898   02BC 032F
        MOVR    R3,     R2                      ; 589A   009A
        SLL     R2,     2                       ; 589B   004E
        SLL     R2,     1                       ; 589C   004A
        ADDR    R2,     R4                      ; 589D   00D4
        MVI     G_019C, R0                      ; 589E   0280 019C
        CMPI    #$0004, R0                      ; 58A0   0378 0004
        BNEQ    L_58AA                          ; 58A2   020C 0006

        MVII    #$0196, R5                      ; 58A4   02BD 0196
        SDBD                                    ; 58A6   0001
        MVI@    R5,     R4                      ; 58A7   02AC
        ADDI    #$0002, R4                      ; 58A8   02FC 0002
L_58AA:
        MVI@    R4,     R2                      ; 58AA   02A2
        SWAP    R2,     1                       ; 58AB   0042
        ANDI    #$00FF, R2                      ; 58AC   03BA 00FF
        MVI     G_031F, R1                      ; 58AE   0281 031F
        SWAP    R1,     1                       ; 58B0   0041
        ANDI    #$00FF, R1                      ; 58B1   03B9 00FF
        SUBR    R2,     R1                      ; 58B3   0111
        MVI@    R4,     R2                      ; 58B4   02A2
        SWAP    R2,     1                       ; 58B5   0042
        ANDI    #$00FF, R2                      ; 58B6   03BA 00FF
        MVI     G_0320, R0                      ; 58B8   0280 0320
        SWAP    R0,     1                       ; 58BA   0040
        ANDI    #$00FF, R0                      ; 58BB   03B8 00FF
        SUBR    R2,     R0                      ; 58BD   0110
        PULR    R7                              ; 58BE   02B7

L_58BF:
        PSHR    R5                              ; 58BF   0275
        MVI     G_0320, R0                      ; 58C0   0280 0320
        SWAP    R0,     1                       ; 58C2   0040
        ANDI    #$00FF, R0                      ; 58C3   03B8 00FF
        MVI     G_031F, R1                      ; 58C5   0281 031F
        SWAP    R1,     1                       ; 58C7   0041
        ANDI    #$00FF, R1                      ; 58C8   03B9 00FF
        MVI     G_01AC, R3                      ; 58CA   0283 01AC
        SLL     R3,     1                       ; 58CC   004B
        MOVR    R3,     R4                      ; 58CD   009C
        CMPI    #$000A, R3                      ; 58CE   037B 000A
        BLT     L_58E6                          ; 58D0   0205 0014

        CMPI    #$000A, R0                      ; 58D2   0378 000A
        BLT     L_592A                          ; 58D4   0205 0054

        CMPI    #$000C, R0                      ; 58D6   0378 000C
        BGT     L_58E6                          ; 58D8   020E 000C

        CMPI    #$0043, R1                      ; 58DA   0379 0043
        BLT     L_592E                          ; 58DC   0205 0050

        CMPI    #$0045, R1                      ; 58DE   0379 0045
        BGT     L_5938                          ; 58E0   020E 0056

        MVII    #$0009, R0                      ; 58E2   02B8 0009
        B       L_5902                          ; 58E4   0200 001C

L_58E6:
        MVII    #$0014, R3                      ; 58E6   02BB 0014
        CMPR    R3,     R0                      ; 58E8   0158
        BGT     L_591F                          ; 58E9   020E 0034

        SUBI    #$0003, R3                      ; 58EB   033B 0003
        CMPR    R3,     R0                      ; 58ED   0158
        BLT     L_5926                          ; 58EE   0205 0036

        MVII    #$0010, R2                      ; 58F0   02BA 0010

        JSR     R5,     X_DIV                   ; 58F2   0004 011C 01FB

        CMPR    R4,     R0                      ; 58F5   0160
        BGT     L_5967                          ; 58F6   020E 006F

        MVII    #$000D, R3                      ; 58F8   02BB 000D
        CMPR    R3,     R1                      ; 58FA   0159
        BGT     L_593A                          ; 58FB   020E 003D

        SUBI    #$0002, R3                      ; 58FD   033B 0002
        CMPR    R3,     R1                      ; 58FF   0159
        BLT     L_5930                          ; 5900   0205 002E

L_5902:
        INCR    R0                              ; 5902   0008
        MVO     R0,     G_019A                  ; 5903   0240 019A
        DECR    R0                              ; 5905   0010

        JSR     R5,     L_5974                  ; 5906   0004 0158 0174

        MVI     G_031F, R0                      ; 5909   0280 031F
        MVO     R0,     G_032F                  ; 590B   0240 032F
        MVI     G_0320, R1                      ; 590D   0281 0320
        SUBI    #$0300, R1                      ; 590F   0339 0300
        MVO     R1,     G_0330                  ; 5911   0241 0330
        SDBD                                    ; 5913   0001
        MVII    #$5890, R1                      ; 5914   02B9 0090 0058
        ADDR    R3,     R1                      ; 5917   00D9
        MVI@    R1,     R0                      ; 5918   0288
        ADDI    #$0003, R0                      ; 5919   02F8 0003
        MVO     R0,     G_0332                  ; 591B   0240 0332
        B       L_5951                          ; 591D   0200 0032

L_591F:
        CMPI    #$0018, R0                      ; 591F   0378 0018
        BGT     L_5967                          ; 5921   020E 0044

        CLRR    R3                              ; 5923   01DB
        B       L_593C                          ; 5924   0200 0016

L_5926:
        CMPI    #$000E, R0                      ; 5926   0378 000E
        BLT     L_5967                          ; 5928   0205 003D

L_592A:
        MVII    #$0001, R3                      ; 592A   02BB 0001
        B       L_593C                          ; 592C   0200 000E

L_592E:
        ANDI    #$000F, R1                      ; 592E   03B9 000F
L_5930:
        CMPI    #$0007, R1                      ; 5930   0379 0007
        BLT     L_5967                          ; 5932   0205 0033

        MVII    #$0003, R3                      ; 5934   02BB 0003
        B       L_593C                          ; 5936   0200 0004

L_5938:
        ANDI    #$000F, R1                      ; 5938   03B9 000F
L_593A:
        MVII    #$0002, R3                      ; 593A   02BB 0002

L_593C:
        JSR     R5,     L_6A0A                  ; 593C   0004 0168 020A

        B       L_5967                          ; 593F   0200 0026

        MVI     G_0190, R0                      ; 5941   0280 0190
        CMPI    #$0013, R0                      ; 5943   0378 0013
        BEQ     L_5970                          ; 5945   0204 0029

        CMPI    #$0003, R0                      ; 5947   0378 0003
        BNEQ    L_5967                          ; 5949   020C 001C

        CLRR    R3                              ; 594B   01DB

        JSR     R5,     L_5252                  ; 594C   0004 0150 0252

        BC      L_5967                          ; 594F   0201 0016

L_5951:
        MVII    #$0002, R0                      ; 5951   02B8 0002
        SDBD                                    ; 5953   0001
        MVII    #$F8FD, R1                      ; 5954   02B9 00FD 00F8
        MVO     R1,     G_0331                  ; 5957   0241 0331

        JSR     R5,     .EXEC.6CF               ; 5959   0004 0114 02CF

        MVII    #$0001, R0                      ; 595C   02B8 0001
        MVO     R0,     G_01A4                  ; 595E   0240 01A4

        JSR     R5,     L_6AE9                  ; 5960   0004 0168 02E9

        CLRR    R0                              ; 5963   01C0
        MVO     R0,     G_0167                  ; 5964   0240 0167
        PULR    R7                              ; 5966   02B7

L_5967:
        CLRR    R0                              ; 5967   01C0
        MVO     R0,     G_0322                  ; 5968   0240 0322
        MVO     R0,     G_032A                  ; 596A   0240 032A

        JSR     R5,     L_6AE9                  ; 596C   0004 0168 02E9

        PULR    R7                              ; 596F   02B7

L_5970:
        JSR     R5,     L_58BF                  ; 5970   0004 0158 00BF

        PULR    R7                              ; 5973   02B7

L_5974:
        PSHR    R5                              ; 5974   0275
        MVII    #$01B0, R1                      ; 5975   02B9 01B0
        ADDR    R0,     R1                      ; 5977   00C1
        MVI@    R1,     R0                      ; 5978   0288
        MVII    #$0003, R2                      ; 5979   02BA 0003
        MVO     R2,     G_0190                  ; 597B   0242 0190
        MOVR    R0,     R1                      ; 597D   0081
        ANDI    #$00F0, R0                      ; 597E   03B8 00F0
        SLR     R0,     2                       ; 5980   0064
        SLR     R0,     2                       ; 5981   0064
        SDBD                                    ; 5982   0001
        MVII    #$550A, R5                      ; 5983   02BD 000A 0055
        ADDR    R0,     R5                      ; 5986   00C5
        MVI@    R5,     R2                      ; 5987   02AA
        MVI     G_032D, R3                      ; 5988   0283 032D
        SDBD                                    ; 598A   0001
        ANDI    #$FFE0, R3                      ; 598B   03BB 00E0 00FF
        XORR    R2,     R3                      ; 598E   01D3
        MVO     R3,     G_032D                  ; 598F   0243 032D
        ANDI    #$000F, R1                      ; 5991   03B9 000F
        MOVR    R1,     R3                      ; 5993   008B
        MVII    #$0007, R0                      ; 5994   02B8 0007

        JSR     R5,     X_MPY                   ; 5996   0004 011C 01DC

        SDBD                                    ; 5999   0001
        ADDI    #$5D9D, R2                      ; 599A   02FA 009D 005D
        MVO     R2,     G_032E                  ; 599D   0242 032E
        PULR    R7                              ; 599F   02B7

L_59A0:
        PSHR    R5                              ; 59A0   0275
        MVII    #$0001, R0                      ; 59A1   02B8 0001
L_59A3:
        SLL     R0,     1                       ; 59A3   0048
        DECR    R3                              ; 59A4   0013
        BPL     L_59A3                          ; 59A5   0223 0003

        COMR    R0                              ; 59A7   0018
        AND     G_01A7, R0                      ; 59A8   0380 01A7
        MVO     R0,     G_01A7                  ; 59AA   0240 01A7
        BNEQ    L_59B1                          ; 59AC   020C 0003

        JSR     R5,     L_6AA4                  ; 59AE   0004 0168 02A4

L_59B1:
        PULR    R7                              ; 59B1   02B7

L_59B2:
        PSHR    R5                              ; 59B2   0275
        MVII    #$0001, R0                      ; 59B3   02B8 0001
L_59B5:
        SLL     R0,     1                       ; 59B5   0048
        DECR    R3                              ; 59B6   0013
        BPL     L_59B5                          ; 59B7   0223 0003

        COMR    R0                              ; 59B9   0018
        MVI     G_01A7, R1                      ; 59BA   0281 01A7
        TSTR    R1                              ; 59BC   0089
        BNEQ    L_59C4                          ; 59BD   020C 0005

        PSHR    R0                              ; 59BF   0270

        JSR     R5,     L_6B1D                  ; 59C0   0004 0168 031D

        PULR    R0                              ; 59C3   02B0
L_59C4:
        MVI     G_01A7, R1                      ; 59C4   0281 01A7
        ANDR    R0,     R1                      ; 59C6   0181
        COMR    R0                              ; 59C7   0018
        XORR    R0,     R1                      ; 59C8   01C1
        MVO     R1,     G_01A7                  ; 59C9   0241 01A7
        PULR    R7                              ; 59CB   02B7

L_59CC:
        PSHR    R5                              ; 59CC   0275
        MVI     G_016A, R1                      ; 59CD   0281 016A
        ADDI    #$0170, R1                      ; 59CF   02F9 0170
        MVI@    R1,     R0                      ; 59D1   0288
        SDBD                                    ; 59D2   0001
        MVII    #$5D68, R1                      ; 59D3   02B9 0068 005D
L_59D6:
        DECR    R0                              ; 59D6   0010
        BMI     L_59DD                          ; 59D7   020B 0004

        ADDI    #$0003, R1                      ; 59D9   02F9 0003
        B       L_59D6                          ; 59DB   0220 0006

L_59DD:
        MVI     G_016C, R2                      ; 59DD   0282 016C
        CLRR    R3                              ; 59DF   01DB
        RRC     R2,     1                       ; 59E0   0072
        ADCR    R3                              ; 59E1   002B
        ADDR    R2,     R1                      ; 59E2   00D1
        MVI@    R1,     R2                      ; 59E3   028A
        TSTR    R3                              ; 59E4   009B
        BNEQ    L_59E9                          ; 59E5   020C 0002

        SLR     R2,     2                       ; 59E7   0066
        SLR     R2,     2                       ; 59E8   0066
L_59E9:
        MVII    #$0008, R0                      ; 59E9   02B8 0008
        MVI     G_016B, R1                      ; 59EB   0281 016B
L_59ED:
        DECR    R1                              ; 59ED   0011
        BMI     L_59F3                          ; 59EE   020B 0003

        SLR     R0,     1                       ; 59F0   0060
        B       L_59ED                          ; 59F1   0220 0005

L_59F3:
        ANDR    R0,     R2                      ; 59F3   0182
        MVII    #$00C0, R3                      ; 59F4   02BB 00C0
        MVII    #$0040, R0                      ; 59F6   02B8 0040
        BEQ     L_59FB                          ; 59F8   0204 0001

        MOVR    R3,     R0                      ; 59FA   0098
L_59FB:
        MVI     G_016B, R4                      ; 59FB   0284 016B
L_59FD:
        DECR    R4                              ; 59FD   0014
        BMI     L_5A04                          ; 59FE   020B 0004

        SLR     R0,     2                       ; 5A00   0064
        SLR     R3,     2                       ; 5A01   0067
        B       L_59FD                          ; 5A02   0220 0006

L_5A04:
        JSR     R5,     L_5A10                  ; 5A04   0004 0158 0210

        MOVR    R2,     R4                      ; 5A07   0094
        ANDR    R4,     R3                      ; 5A08   01A3
        BNEQ    L_5A0F                          ; 5A09   020C 0004

        COMR    R3                              ; 5A0B   001B
        ANDR    R3,     R2                      ; 5A0C   019A
        XORR    R0,     R2                      ; 5A0D   01C2
        MVO@    R2,     R1                      ; 5A0E   024A
L_5A0F:
        PULR    R7                              ; 5A0F   02B7

L_5A10:
        PSHR    R5                              ; 5A10   0275
        MVII    #$0173, R1                      ; 5A11   02B9 0173
        MVI     G_016A, R2                      ; 5A13   0282 016A
        ADDR    R2,     R1                      ; 5A15   00D1
        MVI     G_016C, R2                      ; 5A16   0282 016C
L_5A18:
        DECR    R2                              ; 5A18   0012
        BMI     L_5A1F                          ; 5A19   020B 0004

        ADDI    #$0003, R1                      ; 5A1B   02F9 0003
        B       L_5A18                          ; 5A1D   0220 0006

L_5A1F:
        MVI@    R1,     R2                      ; 5A1F   028A
        PULR    R7                              ; 5A20   02B7

        PSHR    R5                              ; 5A21   0275
        MVI     G_01A3, R2                      ; 5A22   0282 01A3
        ANDI    #$000F, R0                      ; 5A24   03B8 000F
        TSTR    R2                              ; 5A26   0092
        BEQ     L_5A31                          ; 5A27   0204 0008

        CMPI    #$0007, R0                      ; 5A29   0378 0007
        BEQ     L_5A31                          ; 5A2B   0204 0004

        CMPI    #$0008, R0                      ; 5A2D   0378 0008
        BNEQ    L_5AC3                          ; 5A2F   020C 0092

L_5A31:
        CMPI    #$0009, R0                      ; 5A31   0378 0009
        BNEQ    L_5A41                          ; 5A33   020C 000C

        ADD     G_01A2, R2                      ; 5A35   02C2 01A2
        ADD     G_01A7, R2                      ; 5A37   02C2 01A7
        ADD     G_01AA, R2                      ; 5A39   02C2 01AA
        BNEQ    L_5AC3                          ; 5A3B   020C 0086

        JSR     R5,     L_55DB                  ; 5A3D   0004 0154 01DB

        PULR    R7                              ; 5A40   02B7

L_5A41:
        MVI     G_019C, R2                      ; 5A41   0282 019C
        SUBI    #$0003, R0                      ; 5A43   0338 0003
        BLE     L_5AC3                          ; 5A45   0206 007C

        CMPI    #$0005, R0                      ; 5A47   0378 0005
        BGT     L_5AC3                          ; 5A49   020E 0078
        BNEQ    L_5A51                          ; 5A4B   020C 0004

        JSR     R5,     L_6B66                  ; 5A4D   0004 0168 0366

        PULR    R7                              ; 5A50   02B7

L_5A51:
        MVI     G_01A4, R1                      ; 5A51   0281 01A4
        TSTR    R1                              ; 5A53   0089
        BNEQ    L_5AC3                          ; 5A54   020C 006D

        MOVR    R0,     R3                      ; 5A56   0083
        MVO     R0,     G_019C                  ; 5A57   0240 019C
        MVI     G_0323, R0                      ; 5A59   0280 0323
        PSHR    R0                              ; 5A5B   0270
        MVI     G_032B, R0                      ; 5A5C   0280 032B
        PSHR    R0                              ; 5A5E   0270
        MVII    #$031D, R4                      ; 5A5F   02BC 031D
        MVII    #$0010, R0                      ; 5A61   02B8 0010

        JSR     R5,     X_FILL_ZERO             ; 5A63   0004 0114 0338

        PULR    R0                              ; 5A66   02B0
        MVO     R0,     G_032B                  ; 5A67   0240 032B
        PULR    R0                              ; 5A69   02B0
        TSTR    R0                              ; 5A6A   0080
        BNEQ    L_5A75                          ; 5A6B   020C 0008

        MVII    #$0005, R0                      ; 5A6D   02B8 0005

        JSR     R5,     X_RAND2                 ; 5A6F   0004 0114 029E

        ADDI    #$0005, R0                      ; 5A72   02F8 0005
        SWAP    R0,     1                       ; 5A74   0040
L_5A75:
        MVO     R0,     G_0323                  ; 5A75   0240 0323
        SDBD                                    ; 5A77   0001
        MVII    #$5DFF, R4                      ; 5A78   02BC 00FF 005D
        MOVR    R3,     R2                      ; 5A7B   009A
        DECR    R3                              ; 5A7C   0013
        SLL     R3,     2                       ; 5A7D   004F
        ADDR    R3,     R4                      ; 5A7E   00DC
        SDBD                                    ; 5A7F   0001
        MVI@    R4,     R1                      ; 5A80   02A1
        MVO     R1,     G_031E                  ; 5A81   0241 031E
        SDBD                                    ; 5A83   0001
        MVI@    R4,     R1                      ; 5A84   02A1
        MVO     R1,     G_0326                  ; 5A85   0241 0326
        SDBD                                    ; 5A87   0001
        MVII    #$5AC4, R4                      ; 5A88   02BC 00C4 005A
        SAR     R3,     1                       ; 5A8B   006B
        ADDR    R3,     R4                      ; 5A8C   00DC
        SDBD                                    ; 5A8D   0001
        MVI@    R4,     R0                      ; 5A8E   02A0
        MVO     R0,     G_031D                  ; 5A8F   0240 031D
        ADDI    #$0006, R4                      ; 5A91   02FC 0006
        SDBD                                    ; 5A93   0001
        MVI@    R4,     R0                      ; 5A94   02A0
        MVO     R0,     G_0325                  ; 5A95   0240 0325
        ADDI    #$0006, R4                      ; 5A97   02FC 0006
        SDBD                                    ; 5A99   0001
        MVI@    R4,     R0                      ; 5A9A   02A0
        MVO     R0,     G_0329                  ; 5A9B   0240 0329
        MVII    #$0084, R0                      ; 5A9D   02B8 0084
        SWAP    R0,     1                       ; 5A9F   0040
        MVO     R0,     G_0327                  ; 5AA0   0240 0327
        MVII    #$0018, R0                      ; 5AA2   02B8 0018
        SWAP    R0,     1                       ; 5AA4   0040
        MVO     R0,     G_0328                  ; 5AA5   0240 0328
        MVII    #$0003, R0                      ; 5AA7   02B8 0003
        CMPR    R0,     R2                      ; 5AA9   0142
        BLT     L_5AAE                          ; 5AAA   0205 0002

        MVO     R0,     G_032A                  ; 5AAC   0240 032A
L_5AAE:
        MVII    #$0001, R0                      ; 5AAE   02B8 0001

        JSR     R5,     .EXEC.6CF               ; 5AB0   0004 0114 02CF

        MVII    #$0003, R0                      ; 5AB3   02B8 0003
        MVO     R0,     G_0102                  ; 5AB5   0240 0102
        MVII    #$0325, R4                      ; 5AB7   02BC 0325
        MVII    #$0002, R0                      ; 5AB9   02B8 0002

        JSR     R5,     .EXEC.3E0               ; 5ABB   0004 0110 03E0

        MVII    #$0000, R0                      ; 5ABE   02B8 0000

        JSR     R5,     .EXEC.41C               ; 5AC0   0004 0114 001C

L_5AC3:
        PULR    R7                              ; 5AC3   02B7
        ADDR    R0,     R7                      ; 5AC4   00C7

        DECLE   $0010,  $0047,  $0010,  $00D5   ; 5AC5   0010 0047 0010 00D5
        DECLE   $0030,  $00C6,  $0010,  $0000   ; 5AC9   0030 00C6 0010 0000
        DECLE   $0000,  $0047,  $0010,  $0046   ; 5ACD   0000 0047 0010 0046
        DECLE   $0030,  $0047,  $0031,  $0000   ; 5AD1   0030 0047 0031 0000
        DECLE   $0000,  $0000,  $0008,  $0000   ; 5AD5   0000 0000 0008 0000

        ADDR    R6,     R0                      ; 5AD9   00F0
        ADDR    R6,     R0                      ; 5ADA   00F0
        ADDR    R7,     R3                      ; 5ADB   00FB
        PSHR    R5                              ; 5ADC   0275
        MVI     G_019C, R3                      ; 5ADD   0283 019C
        TSTR    R3                              ; 5ADF   009B
        BEQ     L_5B00                          ; 5AE0   0204 001E

        SDBD                                    ; 5AE2   0001
        CMPI    #$FFFF, R0                      ; 5AE3   0378 00FF 00FF
        BNEQ    L_5AEB                          ; 5AE6   020C 0003

        CLRR    R0                              ; 5AE8   01C0
        B       L_5AFE                          ; 5AE9   0200 0013

L_5AEB:
        MOVR    R0,     R1                      ; 5AEB   0081
        MVII    #$000F, R0                      ; 5AEC   02B8 000F
        MVI     G_0121, R2                      ; 5AEE   0282 0121
        CMPI    #$0001, R2                      ; 5AF0   037A 0001
        BEQ     L_5AFA                          ; 5AF2   0204 0006

        MVI     G_0122, R2                      ; 5AF4   0282 0122
        CMPI    #$0001, R2                      ; 5AF6   037A 0001
        BNEQ    L_5AFB                          ; 5AF8   020C 0001

L_5AFA:
        SLL     R0,     2                       ; 5AFA   004C

L_5AFB:
        JSR     R5,     .EXEC.629               ; 5AFB   0004 0114 0229

L_5AFE:
        MVO     R0,     G_0321                  ; 5AFE   0240 0321
L_5B00:
        PULR    R7                              ; 5B00   02B7

L_5B01:
        PSHR    R5                              ; 5B01   0275
        MVII    #$0188, R1                      ; 5B02   02B9 0188
        ADD     G_01A1, R1                      ; 5B04   02C1 01A1
        MVI@    R1,     R2                      ; 5B06   028A
        MOVR    R2,     R3                      ; 5B07   0093
        ANDI    #$00F0, R3                      ; 5B08   03BB 00F0
        SLR     R3,     1                       ; 5B0A   0063
        ADDI    #$0020, R3                      ; 5B0B   02FB 0020
        ANDI    #$000F, R2                      ; 5B0D   03BA 000F
        SLL     R2,     2                       ; 5B0F   004E
        SLL     R2,     1                       ; 5B10   004A
        ADDI    #$001C, R2                      ; 5B11   02FA 001C
        PULR    R7                              ; 5B13   02B7

        PSHR    R5                              ; 5B14   0275
        MVI     G_019C, R0                      ; 5B15   0280 019C
        CMPI    #$0002, R0                      ; 5B17   0378 0002
        BNEQ    L_5B9B                          ; 5B19   020C 0080

        MVI     G_0322, R0                      ; 5B1B   0280 0322
        TSTR    R0                              ; 5B1D   0080
        BEQ     L_5B9B                          ; 5B1E   0204 007B

        MVII    #$0004, R0                      ; 5B20   02B8 0004
        MVO     R0,     G_0322                  ; 5B22   0240 0322
        MVO     R0,     G_032A                  ; 5B24   0240 032A
        CLRR    R1                              ; 5B26   01C9
        MVO     R1,     G_01A4                  ; 5B27   0241 01A4
        MVO     R1,     G_0331                  ; 5B29   0241 0331
        MVII    #$0002, R0                      ; 5B2B   02B8 0002

        JSR     R5,     .EXEC.6D5               ; 5B2D   0004 0114 02D5

        MVI     G_032F, R2                      ; 5B30   0282 032F
        SWAP    R2,     1                       ; 5B32   0042
        ANDI    #$00FF, R2                      ; 5B33   03BA 00FF
        MOVR    R2,     R4                      ; 5B35   0094
        CMPI    #$0094, R2                      ; 5B36   037A 0094
        BGE     L_5B80                          ; 5B38   020D 0046

        MVI     G_0330, R1                      ; 5B3A   0281 0330
        SWAP    R1,     1                       ; 5B3C   0041
        ANDI    #$00FF, R1                      ; 5B3D   03B9 00FF
        CMPI    #$0012, R1                      ; 5B3F   0379 0012
        BGT     L_5B58                          ; 5B41   020E 0015

        SDBD                                    ; 5B43   0001
        XORI    #$9800, R1                      ; 5B44   03F9 0000 0098
        MOVR    R1,     R2                      ; 5B47   008A
        MVII    #$0002, R0                      ; 5B48   02B8 0002
        MVO     R0,     G_01A0                  ; 5B4A   0240 01A0
L_5B4C:
        SDBD                                    ; 5B4C   0001
        MVII    #$032D, R1                      ; 5B4D   02B9 002D 0003
        MVO     R1,     G_0190                  ; 5B50   0241 0190
        MVII    #$0028, R3                      ; 5B52   02BB 0028

        JSR     R5,     .EXEC.9A1               ; 5B54   0004 0118 01A1

        PULR    R7                              ; 5B57   02B7

L_5B58:
        MVI     G_019A, R0                      ; 5B58   0280 019A
        CMPI    #$000B, R0                      ; 5B5A   0378 000B
        BNEQ    L_5B62                          ; 5B5C   020C 0004

        MVI     G_0184, R0                      ; 5B5E   0280 0184
        MVO     R0,     G_0183                  ; 5B60   0240 0183

L_5B62:
        JSR     R5,     L_5B01                  ; 5B62   0004 0158 0301

        SUBR    R2,     R4                      ; 5B65   0114
        MOVR    R4,     R1                      ; 5B66   00A1
        MVI     G_0330, R0                      ; 5B67   0280 0330
        SWAP    R0,     1                       ; 5B69   0040
        ANDI    #$00FF, R0                      ; 5B6A   03B8 00FF
        SUBR    R3,     R0                      ; 5B6C   0118
        ADDI    #$0005, R0                      ; 5B6D   02F8 0005
        CLRR    R3                              ; 5B6F   01DB

        JSR     R5,     L_5257                  ; 5B70   0004 0150 0257

        BC      L_5B89                          ; 5B73   0201 0014

        CLRR    R0                              ; 5B75   01C0
        MVO     R0,     G_0322                  ; 5B76   0240 0322
        MVO     R0,     G_032A                  ; 5B78   0240 032A
        MVII    #$0001, R0                      ; 5B7A   02B8 0001

        JSR     R5,     L_6AE9                  ; 5B7C   0004 0168 02E9

        PULR    R7                              ; 5B7F   02B7

L_5B80:
        SWAP    R2,     1                       ; 5B80   0042
        XORI    #$0066, R2                      ; 5B81   03FA 0066
        MVII    #$0001, R0                      ; 5B83   02B8 0001
        MVO     R0,     G_01A0                  ; 5B85   0240 01A0
        B       L_5B4C                          ; 5B87   0220 003C

L_5B89:
        MVII    #$00FE, R0                      ; 5B89   02B8 00FE
        MVO     R0,     G_0167                  ; 5B8B   0240 0167
        MVI     G_019A, R0                      ; 5B8D   0280 019A
        CMPI    #$000B, R0                      ; 5B8F   0378 000B
        BNEQ    L_5B9A                          ; 5B91   020C 0007

        SDBD                                    ; 5B93   0001
        MVII    #$00A9, R0                      ; 5B94   02B8 00A9 0000

        JSR     R5,     L_68A3                  ; 5B97   0004 0168 00A3

L_5B9A:
        PULR    R7                              ; 5B9A   02B7
L_5B9B:
        PULR    R7                              ; 5B9B   02B7

        PSHR    R5                              ; 5B9C   0275
        MVI     G_01AA, R1                      ; 5B9D   0281 01AA
        TSTR    R1                              ; 5B9F   0089
        BNEQ    L_5BA7                          ; 5BA0   020C 0005

        MVI     G_0165, R0                      ; 5BA2   0280 0165
        DECR    R0                              ; 5BA4   0010
        BNEQ    L_5BA8                          ; 5BA5   020C 0001
L_5BA7:
        PULR    R7                              ; 5BA7   02B7

L_5BA8:
        MVII    #$0001, R0                      ; 5BA8   02B8 0001
        MVO     R0,     G_01A9                  ; 5BAA   0240 01A9
        MVII    #$0006, R3                      ; 5BAC   02BB 0006

        JSR     R5,     L_59B2                  ; 5BAE   0004 0158 01B2

        MVI     G_01A1, R0                      ; 5BB1   0280 01A1
        MVII    #$0005, R1                      ; 5BB3   02B9 0005
        SUBR    R0,     R1                      ; 5BB5   0101
        SLL     R1,     2                       ; 5BB6   004D
        SLL     R1,     1                       ; 5BB7   0049
        ADDI    #$032D, R1                      ; 5BB8   02F9 032D

        JSR     R5,     L_5C14                  ; 5BBA   0004 015C 0014

        CLRR    R0                              ; 5BBD   01C0
        MVO     R0,     G_0198                  ; 5BBE   0240 0198
        MVII    #$0028, R0                      ; 5BC0   02B8 0028
        MVO     R0,     G_032B                  ; 5BC2   0240 032B
        PULR    R7                              ; 5BC4   02B7

        PSHR    R5                              ; 5BC5   0275
        MVI     G_01A9, R1                      ; 5BC6   0281 01A9
        TSTR    R1                              ; 5BC8   0089
        BEQ     L_5BD9                          ; 5BC9   0204 000E

        INCR    R1                              ; 5BCB   0009
        MVO     R1,     G_01A9                  ; 5BCC   0241 01A9
        SDBD                                    ; 5BCE   0001
        ADDI    #$5BD8, R1                      ; 5BCF   02F9 00D8 005B
        MVI@    R1,     R0                      ; 5BD2   0288
        MVO     R0,     G_0198                  ; 5BD3   0240 0198
        MVII    #$0028, R0                      ; 5BD5   02B8 0028
        MVO     R0,     G_032B                  ; 5BD7   0240 032B
L_5BD9:
        PULR    R7                              ; 5BD9   02B7
L_5BDA:
        DECR    R7                              ; 5BDA   0017

        EIS                                     ; 5BDB   0002
        DECR    R2                              ; 5BDC   0012
        CLRC                                    ; 5BDD   0006
        SETC                                    ; 5BDE   0007
        SETC                                    ; 5BDF   0007
L_5BE0:
        PSHR    R5                              ; 5BE0   0275
        MVII    #$0010, R1                      ; 5BE1   02B9 0010
        SWAP    R1,     1                       ; 5BE3   0041
        MVO     R1,     G_0330                  ; 5BE4   0241 0330
        MVII    #$0008, R0                      ; 5BE6   02B8 0008

        JSR     R5,     X_RAND2                 ; 5BE8   0004 0114 029E

        MOVR    R0,     R1                      ; 5BEB   0081
        SLL     R1,     2                       ; 5BEC   004D
        SLL     R1,     2                       ; 5BED   004D
        ADDI    #$000C, R1                      ; 5BEE   02F9 000C
        SWAP    R1,     1                       ; 5BF0   0041
        MVO     R1,     G_032F                  ; 5BF1   0241 032F

        JSR     R5,     L_5974                  ; 5BF3   0004 0158 0174

        MVII    #$0005, R0                      ; 5BF6   02B8 0005
        MVO     R0,     G_0332                  ; 5BF8   0240 0332
        MVII    #$018E, R3                      ; 5BFA   02BB 018E

        JSR     R5,     L_5511                  ; 5BFC   0004 0154 0111

        SWAP    R0,     1                       ; 5BFF   0040
        SWAP    R1,     1                       ; 5C00   0041

        JSR     R5,     X_PACK_BYTES            ; 5C01   0004 0114 034F

        SWAP    R0,     1                       ; 5C04   0040
        MOVR    R0,     R2                      ; 5C05   0082
        MVII    #$032D, R1                      ; 5C06   02B9 032D
        MVII    #$0014, R3                      ; 5C08   02BB 0014

        JSR     R5,     .EXEC.9A1               ; 5C0A   0004 0118 01A1

        MVII    #$0003, R0                      ; 5C0D   02B8 0003
        MVO     R0,     G_01A0                  ; 5C0F   0240 01A0
        MVII    #$032D, R1                      ; 5C11   02B9 032D
        PULR    R7                              ; 5C13   02B7

L_5C14:
        PSHR    R5                              ; 5C14   0275
        MOVR    R1,     R2                      ; 5C15   008A
        MVI     G_01A2, R0                      ; 5C16   0280 01A2
        TSTR    R0                              ; 5C18   0080
        BEQ     L_5C28                          ; 5C19   0204 000D

        JSR     R5,     L_55BF                  ; 5C1B   0004 0154 01BF

        MVII    #$0196, R4                      ; 5C1E   02BC 0196
        SDBD                                    ; 5C20   0001
        MVI@    R4,     R3                      ; 5C21   02A3
        ADDI    #$0006, R3                      ; 5C22   02FB 0006
        CLRR    R0                              ; 5C24   01C0
        MVO@    R0,     R3                      ; 5C25   0258
        MVO     R0,     G_01A2                  ; 5C26   0240 01A2
L_5C28:
        MVI@    R2,     R0                      ; 5C28   0290
        MVO     R2,     G_0196                  ; 5C29   0242 0196
        SWAP    R2,     1                       ; 5C2B   0042
        MVO     R2,     G_0197                  ; 5C2C   0242 0197
        ANDI    #$001F, R0                      ; 5C2E   03B8 001F
        MVO     R0,     G_01A8                  ; 5C30   0240 01A8
        SDBD                                    ; 5C32   0001
        MVII    #$5056, R1                      ; 5C33   02B9 0056 0050

        JSR     R5,     X_TIMER_START           ; 5C36   0004 0118 0044

        PULR    R7                              ; 5C39   02B7

L_5C3A:
        PSHR    R5                              ; 5C3A   0275
        CLRR    R0                              ; 5C3B   01C0
        MVO     R0,     G_01AF                  ; 5C3C   0240 01AF
        MVII    #$01B0, R4                      ; 5C3E   02BC 01B0
        MVII    #$00FF, R1                      ; 5C40   02B9 00FF
        MVII    #$000A, R0                      ; 5C42   02B8 000A

        JSR     R5,     X_FILL_MEM              ; 5C44   0004 0114 0341
        JSR     R5,     L_5CD1                  ; 5C47   0004 015C 00D1
        JSR     R5,     L_5C5B                  ; 5C4A   0004 015C 005B

        MVII    #$0001, R0                      ; 5C4D   02B8 0001
        MVO     R0,     G_01AF                  ; 5C4F   0240 01AF

        JSR     R5,     L_5C5B                  ; 5C51   0004 015C 005B
        JSR     R5,     L_5D2F                  ; 5C54   0004 015C 012F
        JSR     R5,     L_5CF7                  ; 5C57   0004 015C 00F7

        PULR    R7                              ; 5C5A   02B7

L_5C5B:
        PSHR    R5                              ; 5C5B   0275
        MVI     G_01AC, R0                      ; 5C5C   0280 01AC
        MVII    #$0008, R1                      ; 5C5E   02B9 0008

        JSR     R5,     X_MPY                   ; 5C60   0004 011C 01DC

        ADDI    #$032D, R2                      ; 5C63   02FA 032D
        MVO     R2,     G_01AD                  ; 5C65   0242 01AD
        SWAP    R2,     1                       ; 5C67   0042
        MVO     R2,     G_01AE                  ; 5C68   0242 01AE
        MVII    #$032D, R4                      ; 5C6A   02BC 032D
L_5C6C:
        MVI@    R4,     R3                      ; 5C6C   02A3
        ANDI    #$001F, R3                      ; 5C6D   03BB 001F
        SDBD                                    ; 5C6F   0001
        MVII    #$550A, R5                      ; 5C70   02BD 000A 0055
L_5C73:
        MVI@    R5,     R1                      ; 5C73   02A9
        CMPR    R3,     R1                      ; 5C74   0159
        BNEQ    L_5C73                          ; 5C75   022C 0003

        DECR    R5                              ; 5C77   0015
        SDBD                                    ; 5C78   0001
        SUBI    #$550A, R5                      ; 5C79   033D 000A 0055
        MOVR    R5,     R3                      ; 5C7C   00AB
        MVI@    R4,     R1                      ; 5C7D   02A1
        SDBD                                    ; 5C7E   0001
        SUBI    #$5D9D, R1                      ; 5C7F   0339 009D 005D
        MVII    #$0007, R2                      ; 5C82   02BA 0007

        JSR     R5,     X_DIV                   ; 5C84   0004 011C 01FB

        MVI     G_01AB, R2                      ; 5C87   0282 01AB
        MVI     G_01AF, R1                      ; 5C89   0281 01AF
        XORR    R2,     R1                      ; 5C8B   01D1
        BNEQ    L_5C94                          ; 5C8C   020C 0006

        MOVR    R0,     R2                      ; 5C8E   0082

        JSR     R5,     L_5CED                  ; 5C8F   0004 015C 00ED

        B       L_5C9B                          ; 5C92   0200 0007

L_5C94:
        MOVR    R3,     R2                      ; 5C94   009A
        MOVR    R0,     R1                      ; 5C95   0081

        JSR     R5,     L_5CED                  ; 5C96   0004 015C 00ED

        MOVR    R0,     R3                      ; 5C99   0083
        MOVR    R1,     R0                      ; 5C9A   0088
L_5C9B:
        SLL     R3,     2                       ; 5C9B   004F
        SLL     R3,     2                       ; 5C9C   004F
        XORR    R3,     R0                      ; 5C9D   01D8
        MVII    #$01B0, R5                      ; 5C9E   02BD 01B0
        MVI     G_01AC, R1                      ; 5CA0   0281 01AC
        SLL     R1,     1                       ; 5CA2   0049
L_5CA3:
        DECR    R1                              ; 5CA3   0011
        BMI     L_5CAE                          ; 5CA4   020B 0008

        MVI@    R5,     R2                      ; 5CA6   02AA
        CMPR    R0,     R2                      ; 5CA7   0142
        BNEQ    L_5CA3                          ; 5CA8   022C 0006

        SUBI    #$0002, R4                      ; 5CAA   033C 0002
        B       L_5C6C                          ; 5CAC   0220 0041

L_5CAE:
        MOVR    R0,     R1                      ; 5CAE   0081
L_5CAF:
        MVI     G_01AC, R0                      ; 5CAF   0280 01AC
        SLL     R0,     1                       ; 5CB1   0048

        JSR     R5,     X_RAND2                 ; 5CB2   0004 0114 029E

        MVII    #$01B0, R3                      ; 5CB5   02BB 01B0
        ADDR    R0,     R3                      ; 5CB7   00C3
        MVI@    R3,     R2                      ; 5CB8   029A
        CMPI    #$00FF, R2                      ; 5CB9   037A 00FF
        BNEQ    L_5CAF                          ; 5CBB   022C 000D

        MVO@    R1,     R3                      ; 5CBD   0259
        ADDI    #$0005, R4                      ; 5CBE   02FC 0005
        MVI     G_01AF, R3                      ; 5CC0   0283 01AF
        TSTR    R3                              ; 5CC2   009B
        BNEQ    L_5CC8                          ; 5CC3   020C 0003

        INCR    R0                              ; 5CC5   0008
        MVO@    R0,     R4                      ; 5CC6   0260
        DECR    R4                              ; 5CC7   0014
L_5CC8:
        INCR    R4                              ; 5CC8   000C
        MVII    #$01AD, R5                      ; 5CC9   02BD 01AD
        SDBD                                    ; 5CCB   0001
        MVI@    R5,     R3                      ; 5CCC   02AB
        CMPR    R3,     R4                      ; 5CCD   015C
        BLT     L_5C6C                          ; 5CCE   0225 0063
        PULR    R7                              ; 5CD0   02B7

L_5CD1:
        PSHR    R5                              ; 5CD1   0275
        MVI     G_0165, R1                      ; 5CD2   0281 0165
        INCR    R1                              ; 5CD4   0009
        MVII    #$000A, R0                      ; 5CD5   02B8 000A

        JSR     R5,     X_RAND2                 ; 5CD7   0004 0114 029E

        SARC    R0,     1                       ; 5CDA   0078
        BNC     L_5CDE                          ; 5CDB   0209 0001

        INCR    R1                              ; 5CDD   0009
L_5CDE:
        MVO     R1,     G_01AC                  ; 5CDE   0241 01AC
        CLRR    R1                              ; 5CE0   01C9
        MVII    #$000A, R0                      ; 5CE1   02B8 000A

        JSR     R5,     X_RAND2                 ; 5CE3   0004 0114 029E

        SARC    R0,     1                       ; 5CE6   0078
        BNC     L_5CEA                          ; 5CE7   0209 0001

        INCR    R1                              ; 5CE9   0009
L_5CEA:
        MVO     R1,     G_01AB                  ; 5CEA   0241 01AB
        PULR    R7                              ; 5CEC   02B7

L_5CED:
        PSHR    R5                              ; 5CED   0275
L_5CEE:
        MVII    #$0006, R0                      ; 5CEE   02B8 0006

        JSR     R5,     X_RAND2                 ; 5CF0   0004 0114 029E

        CMPR    R2,     R0                      ; 5CF3   0150
        BEQ     L_5CEE                          ; 5CF4   0224 0007
        PULR    R7                              ; 5CF6   02B7

L_5CF7:
        PSHR    R5                              ; 5CF7   0275
        MVI     G_01AC, R0                      ; 5CF8   0280 01AC
        SLL     R0,     1                       ; 5CFA   0048
        MVII    #$01B0, R4                      ; 5CFB   02BC 01B0
        MVII    #$0215, R5                      ; 5CFD   02BD 0215
        CMPI    #$000A, R0                      ; 5CFF   0378 000A
        BEQ     L_5D04                          ; 5D01   0204 0001

        INCR    R0                              ; 5D03   0008
L_5D04:
        MVI@    R4,     R1                      ; 5D04   02A1
        MOVR    R1,     R2                      ; 5D05   008A
        ANDI    #$000F, R1                      ; 5D06   03B9 000F
        SDBD                                    ; 5D08   0001
        ADDI    #$000F, R1                      ; 5D09   02F9 000F 0000
        SLL     R1,     2                       ; 5D0C   004D
        SLL     R1,     1                       ; 5D0D   0049
        XORI    #$0005, R1                      ; 5D0E   03F9 0005
        ANDI    #$00F0, R2                      ; 5D10   03BA 00F0
        SLR     R2,     2                       ; 5D12   0066
        SLR     R2,     2                       ; 5D13   0066
        SDBD                                    ; 5D14   0001
        ADDI    #$5D28, R2                      ; 5D15   02FA 0028 005D
        MVI@    R2,     R3                      ; 5D18   0293
        SWAP    R3,     1                       ; 5D19   0043
        SLL     R3,     1                       ; 5D1A   004B
        XORR    R3,     R1                      ; 5D1B   01D9
        CMPI    #$0227, R5                      ; 5D1C   037D 0227
        BNEQ    L_5D22                          ; 5D1E   020C 0002

        SUBI    #$001F, R5                      ; 5D20   033D 001F
L_5D22:
        MVO@    R1,     R5                      ; 5D22   0269
        INCR    R5                              ; 5D23   000D
        DECR    R0                              ; 5D24   0010
        BNEQ    L_5D04                          ; 5D25   022C 0022
        PULR    R7                              ; 5D27   02B7

        CLRC                                    ; 5D28   0006
        SETC                                    ; 5D29   0007
        DECR    R6                              ; 5D2A   0016
        INCR    R6                              ; 5D2B   000E
        COMR    R4                              ; 5D2C   001C
        COMR    R5                              ; 5D2D   001D
        INCR    R4                              ; 5D2E   000C
L_5D2F:
        PSHR    R5                              ; 5D2F   0275
        MVI     G_016F, R0                      ; 5D30   0280 016F
        COMR    R0                              ; 5D32   0018
        ADDI    #$0006, R0                      ; 5D33   02F8 0006

        JSR     R5,     X_RAND2                 ; 5D35   0004 0114 029E

        TSTR    R0                              ; 5D38   0080
        BNEQ    L_5D58                          ; 5D39   020C 001D

        MVI     G_01AC, R1                      ; 5D3B   0281 01AC
        SLL     R1,     1                       ; 5D3D   0049
        CMPI    #$000A, R1                      ; 5D3E   0379 000A
        BNEQ    L_5D43                          ; 5D40   020C 0001

        DECR    R1                              ; 5D42   0011
L_5D43:
        MOVR    R1,     R2                      ; 5D43   008A
        INCR    R2                              ; 5D44   000A
        ADDI    #$01B0, R1                      ; 5D45   02F9 01B0
        MVII    #$0066, R0                      ; 5D47   02B8 0066
        MVO@    R0,     R1                      ; 5D49   0248
        MVI     G_01AC, R0                      ; 5D4A   0280 01AC
        MVII    #$0334, R1                      ; 5D4C   02B9 0334
L_5D4E:
        MVO@    R2,     R1                      ; 5D4E   024A
        ADDI    #$0008, R1                      ; 5D4F   02F9 0008
        DECR    R0                              ; 5D51   0010
        BNEQ    L_5D4E                          ; 5D52   022C 0005

        INCR    R0                              ; 5D54   0008
        MVO     R0,     G_01AB                  ; 5D55   0240 01AB
        PULR    R7                              ; 5D57   02B7

L_5D58:
        MVI     G_01AC, R1                      ; 5D58   0281 01AC
        CMPI    #$0005, R1                      ; 5D5A   0379 0005
        BEQ     L_5D64                          ; 5D5C   0204 0006

        SLL     R1,     1                       ; 5D5E   0049
        ADDI    #$01B0, R1                      ; 5D5F   02F9 01B0
        MVII    #$0066, R0                      ; 5D61   02B8 0066
        MVO@    R0,     R1                      ; 5D63   0248
L_5D64:
        CLRR    R0                              ; 5D64   01C0
        MVO     R0,     G_01AB                  ; 5D65   0240 01AB
        PULR    R7                              ; 5D67   02B7

        SAR     R1,     1                       ; 5D68   0069
        MOVR    R3,     R1                      ; 5D69   0099
        SLR     R0,     1                       ; 5D6A   0060
        DECR    R1                              ; 5D6B   0011
        DECR    R1                              ; 5D6C   0011
        DECR    R0                              ; 5D6D   0010
        SAR     R1,     1                       ; 5D6E   0069
        NEGR    R4                              ; 5D6F   0024
        ADDR    R6,     R0                      ; 5D70   00F0
        ADDR    R4,     R1                      ; 5D71   00E1
        SLR     R1,     1                       ; 5D72   0061
        ADDR    R4,     R0                      ; 5D73   00E0
        MOVR    R3,     R1                      ; 5D74   0099
        ADDR    R6,     R1                      ; 5D75   00F1
        DECR    R0                              ; 5D76   0010
        ADDR    R7,     R0                      ; 5D77   00F8
        ADDR    R4,     R1                      ; 5D78   00E1
        ADDR    R4,     R0                      ; 5D79   00E0
        SAR     R0,     1                       ; 5D7A   0068
        ADDR    R5,     R1                      ; 5D7B   00E9
        SLR     R0,     1                       ; 5D7C   0060
        ADDR    R6,     R1                      ; 5D7D   00F1
        NEGR    R4                              ; 5D7E   0024
        TSTR    R0                              ; 5D7F   0080
        SAR     R1,     1                       ; 5D80   0069
        SAR     R1,     1                       ; 5D81   0069
        SLR     R0,     1                       ; 5D82   0060
        SAR     R1,     1                       ; 5D83   0069
        RRC     R1,     1                       ; 5D84   0071
        SLR     R0,     1                       ; 5D85   0060
        MOVR    R0,     R7                      ; 5D86   0087

        DECLE   $0010,  $0096,  $005D,  $0000   ; 5D87   0010 0096 005D 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D8B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D8F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0200   ; 5D93   0000 0000 0000 0200
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5D97   0000 0000 0000 0001
        DECLE   $0000,  $0000                   ; 5D9B   0000 0000

        B       L_5D9F                          ; 5D9D   0200 0000

L_5D9F:
        ADDR    R5,     R4                      ; 5D9F   00EC
        DECLE   $0055,  $0003,  $002F,  $0000   ; 5DA0   0055 0003 002F 0000

        B       L_5DA6                          ; 5DA4   0200 0000

L_5DA6:
        ADDR    R5,     R4                      ; 5DA6   00EC
        DECLE   $0055,  $0003,  $0035,  $0000   ; 5DA7   0055 0003 0035 0000

        B       L_5DAD                          ; 5DAB   0200 0000

L_5DAD:
        ADDR    R5,     R4                      ; 5DAD   00EC
        DECLE   $0055,  $0003,  $003B,  $0000   ; 5DAE   0055 0003 003B 0000

        B       L_5DB4                          ; 5DB2   0200 0000

L_5DB4:
        ADDR    R5,     R4                      ; 5DB4   00EC
        DECLE   $0055,  $0003,  $0041,  $0000   ; 5DB5   0055 0003 0041 0000

        B       L_5DBB                          ; 5DB9   0200 0000

L_5DBB:
        ADDR    R5,     R4                      ; 5DBB   00EC
        DECLE   $0055,  $0003,  $0047,  $0000   ; 5DBC   0055 0003 0047 0000

        B       L_5DC2                          ; 5DC0   0200 0000

L_5DC2:
        ADDR    R5,     R4                      ; 5DC2   00EC
        DECLE   $0055,  $0003,  $004D,  $0000   ; 5DC3   0055 0003 004D 0000

        B       L_5DC9                          ; 5DC7   0200 0000

L_5DC9:
        ADDR    R5,     R4                      ; 5DC9   00EC
        DECLE   $0055,  $0001,  $0053,  $0000   ; 5DCA   0055 0001 0053 0000
        DECLE   $0300,  $0000,  $009C,  $005B   ; 5DCE   0300 0000 009C 005B
        DECLE   $0002,  $0001,  $0000,  $0300   ; 5DD2   0002 0001 0000 0300
        DECLE   $0000,  $009C,  $005B,  $0005   ; 5DD6   0000 009C 005B 0005
        DECLE   $0005,  $0000,  $02DC,  $0013   ; 5DDA   0005 0000 02DC 0013
        DECLE   $00C5,  $005B,  $0005,  $000F   ; 5DDE   00C5 005B 0005 000F
        DECLE   $0000,  $0300,  $0000,  $009C   ; 5DE2   0000 0300 0000 009C
        DECLE   $005B,  $0003,  $0019,  $0000   ; 5DE6   005B 0003 0019 0000
        DECLE   $03DC,  $0013,  $00C5,  $005B   ; 5DEA   03DC 0013 00C5 005B
        DECLE   $0003,  $001D,  $0000,  $0200   ; 5DEE   0003 001D 0000 0200
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5DF2   0000 0000 0000 0001
        DECLE   $0025,  $0000,  $03DC,  $0013   ; 5DF6   0025 0000 03DC 0013
        DECLE   $00C5,  $005B,  $0003,  $0027   ; 5DFA   00C5 005B 0003 0027
        DECLE   $0000,  $00CE,  $005D,  $00F8   ; 5DFE   0000 00CE 005D 00F8
        DECLE   $005D,  $00D5,  $005D,  $00DC   ; 5E02   005D 00D5 005D 00DC
        DECLE   $005D,  $00E3,  $005D,  $00EA   ; 5E06   005D 00E3 005D 00EA
        DECLE   $005D,  $00F1,  $005D,  $00F8   ; 5E0A   005D 00F1 005D 00F8
        DECLE   $005D,  $00FF,  $0081,  $0081   ; 5E0E   005D 00FF 0081 0081
        DECLE   $0081,  $0081,  $0081,  $0081   ; 5E12   0081 0081 0081 0081
        DECLE   $00FF                           ; 5E16   00FF

        NOP                                     ; 5E17   0034
        NOP                                     ; 5E18   0034
        NOP                                     ; 5E19   0034
        NOP                                     ; 5E1A   0034
        NOP                                     ; 5E1B   0034
        NOP                                     ; 5E1C   0034
        COMR    R0                              ; 5E1D   0018
        COMR    R0                              ; 5E1E   0018
        COMR    R0                              ; 5E1F   0018
        COMR    R0                              ; 5E20   0018
        RSWD    R4                              ; 5E21   003C
        SARC    R2,     2                       ; 5E22   007E
        MOVR    R4,     R5                      ; 5E23   00A5
        MOVR    R4,     R5                      ; 5E24   00A5
        MOVR    R4,     R5                      ; 5E25   00A5
        SLR     R2,     2                       ; 5E26   0066
        ADDR    R0,     R1                      ; 5E27   00C1
        ADDR    R0,     R1                      ; 5E28   00C1
        SLR     R2,     1                       ; 5E29   0062
        SLR     R2,     1                       ; 5E2A   0062
        NOP                                     ; 5E2B   0034
        NOP                                     ; 5E2C   0034
        COMR    R0                              ; 5E2D   0018
        COMR    R0                              ; 5E2E   0018
        NEGR    R4                              ; 5E2F   0024
        NEGR    R4                              ; 5E30   0024
        SLR     R2,     2                       ; 5E31   0066
        SLR     R2,     2                       ; 5E32   0066
        ADDR    R4,     R7                      ; 5E33   00E7

        DECLE   $00A5,  $00A5,  $0066,  $0000   ; 5E34   00A5 00A5 0066 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5E38   0000 0000 0000 0001
        DECLE   $0003,  $0006,  $000C,  $0008   ; 5E3C   0003 0006 000C 0008
        DECLE   $000C,  $000E,  $0006,  $0007   ; 5E40   000C 000E 0006 0007
        DECLE   $0003,  $0001,  $0001,  $0000   ; 5E44   0003 0001 0001 0000
        DECLE   $0000,  $0002,  $0006,  $0004   ; 5E48   0000 0002 0006 0004
        DECLE   $000C,  $000C,  $0008,  $0008   ; 5E4C   000C 000C 0008 0008
        DECLE   $000C,  $000E,  $0006,  $0007   ; 5E50   000C 000E 0006 0007
        DECLE   $0003,  $0001,  $0001,  $0000   ; 5E54   0003 0001 0001 0000
        DECLE   $0008,  $0008,  $0008,  $0018   ; 5E58   0008 0008 0008 0018
        DECLE   $0018,  $0018,  $0010,  $0018   ; 5E5C   0018 0018 0010 0018
        DECLE   $000C,  $000E,  $0006,  $0007   ; 5E60   000C 000E 0006 0007
        DECLE   $0003,  $0001,  $0001,  $0000   ; 5E64   0003 0001 0001 0000
        DECLE   $0000,  $0000,  $0010,  $0010   ; 5E68   0000 0000 0010 0010
        DECLE   $0010,  $0030,  $0030,  $0030   ; 5E6C   0010 0030 0030 0030
        DECLE   $0020,  $0038,  $003E,  $000F   ; 5E70   0020 0038 003E 000F
        DECLE   $0003,  $0001,  $0001,  $0000   ; 5E74   0003 0001 0001 0000
        DECLE   $0000,  $0000,  $0040,  $0040   ; 5E78   0000 0000 0040 0040
        DECLE   $0040,  $00C0,  $00C0,  $00C0   ; 5E7C   0040 00C0 00C0 00C0
        DECLE   $00C0,  $00F0,  $00FE,  $001F   ; 5E80   00C0 00F0 00FE 001F
        DECLE   $0003,  $0001,  $0001,  $0000   ; 5E84   0003 0001 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 5E88   0000 0000 0000 0080
        DECLE   $00C0,  $0060,  $0030,  $0010   ; 5E8C   00C0 0060 0030 0010
        DECLE   $0030,  $0070,  $0060,  $00E0   ; 5E90   0030 0070 0060 00E0
        DECLE   $00C0,  $0080,  $0080,  $0000   ; 5E94   00C0 0080 0080 0000
        DECLE   $0000,  $0040,  $0060,  $0020   ; 5E98   0000 0040 0060 0020
        DECLE   $0030,  $0030,  $0010,  $0010   ; 5E9C   0030 0030 0010 0010
        DECLE   $0030,  $0070,  $0060,  $00E0   ; 5EA0   0030 0070 0060 00E0
        DECLE   $00C0,  $0080,  $0080,  $0000   ; 5EA4   00C0 0080 0080 0000
        DECLE   $0010,  $0010,  $0010,  $0018   ; 5EA8   0010 0010 0010 0018
        DECLE   $0018,  $0018,  $0008,  $0018   ; 5EAC   0018 0018 0008 0018
        DECLE   $0030,  $0070,  $0060,  $00E0   ; 5EB0   0030 0070 0060 00E0
        DECLE   $00C0,  $0080,  $0080,  $0000   ; 5EB4   00C0 0080 0080 0000
        DECLE   $0000,  $0000                   ; 5EB8   0000 0000

        INCR    R0                              ; 5EBA   0008
        INCR    R0                              ; 5EBB   0008
        INCR    R0                              ; 5EBC   0008
        INCR    R4                              ; 5EBD   000C
        INCR    R4                              ; 5EBE   000C
        INCR    R4                              ; 5EBF   000C

        JSR     R4,     .EXEC.C7C               ; 5EC0   0004 001C 007C
        DECLE   $00F0,  $00C0,  $0080,  $0080   ; 5EC3   00F0 00C0 0080 0080
        DECLE   $0000,  $0000,  $0000           ; 5EC7   0000 0000 0000

        EIS                                     ; 5ECA   0002
        EIS                                     ; 5ECB   0002
        EIS                                     ; 5ECC   0002
        DIS                                     ; 5ECD   0003
        DIS                                     ; 5ECE   0003
        DIS                                     ; 5ECF   0003
        DIS                                     ; 5ED0   0003
        INCR    R7                              ; 5ED1   000F

        SARC    R3,     2                       ; 5ED2   007F
L_5ED3:
        ADDR    R7,     R0                      ; 5ED3   00F8
        DECLE   $00C0,  $0080,  $0080,  $003E   ; 5ED4   00C0 0080 0080 003E
        DECLE   $0063,  $00FF,  $00E3,  $00FF   ; 5ED8   0063 00FF 00E3 00FF
        DECLE   $00FF,  $007F,  $003E,  $001C   ; 5EDC   00FF 007F 003E 001C
        DECLE   $001C,  $001C,  $000C,  $000C   ; 5EE0   001C 001C 000C 000C
        DECLE   $000C,  $000C,  $001C,  $003E   ; 5EE4   000C 000C 001C 003E
        DECLE   $0063,  $00FF,  $00E3,  $00FF   ; 5EE8   0063 00FF 00E3 00FF
        DECLE   $00FF,  $007F,  $003E,  $000C   ; 5EEC   00FF 007F 003E 000C
        DECLE   $000C,  $000C,  $000C,  $000C   ; 5EF0   000C 000C 000C 000C
        DECLE   $000C,  $000C,  $001C,  $0000   ; 5EF4   000C 000C 001C 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5EF8   0000 0000 0000 0001

        INCR    R7                              ; 5EFC   000F

        DECR    R3                              ; 5EFD   0013
L_5EFE:
        GSWD    R0                              ; 5EFE   0030
        DECLE   $002B,  $0007,  $0000,  $0000   ; 5EFF   002B 0007 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F03   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 5F07   0000 0000 0000

        DECR    R0                              ; 5F0A   0010
        RLC     R1,     1                       ; 5F0B   0051
        SLL     R3,     2                       ; 5F0C   004F
        DECR    R3                              ; 5F0D   0013
        RLC     R0,     1                       ; 5F0E   0050
        SLL     R3,     1                       ; 5F0F   004B
L_5F10:
        DECR    R7                              ; 5F10   0017

        DECLE   $0010,  $0000,  $0000,  $0000   ; 5F11   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0050   ; 5F15   0000 0000 0000 0050
        DECLE   $0050,  $0000,  $0001,  $008F   ; 5F19   0050 0000 0001 008F
        DECLE   $0093,  $0010,  $000B,  $0007   ; 5F1D   0093 0010 000B 0007
        DECLE   $0080,  $0080,  $0008,  $0028   ; 5F21   0080 0080 0008 0028
        DECLE   $0020,  $0000,  $0000,  $0000   ; 5F25   0020 0000 0000 0000
        DECLE   $0000,  $0000,  $0001           ; 5F29   0000 0000 0001

        INCR    R7                              ; 5F2C   000F

        DECR    R3                              ; 5F2D   0013
L_5F2E:
        DECR    R0                              ; 5F2E   0010
        DECLE   $000B,  $0007,  $0000,  $0000   ; 5F2F   000B 0007 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F33   0000 0000 0000 0000
        DECLE   $0038,  $0010,  $0038,  $006C   ; 5F37   0038 0010 0038 006C
        DECLE   $00D6,  $00D6,  $00D6,  $00D6   ; 5F3B   00D6 00D6 00D6 00D6
        DECLE   $00D6,  $00D6,  $00D6,  $00D6   ; 5F3F   00D6 00D6 00D6 00D6
        DECLE   $00D6,  $00D6,  $00D6,  $006C   ; 5F43   00D6 00D6 00D6 006C
        DECLE   $0000,  $0010,  $0000,  $0008   ; 5F47   0000 0010 0000 0008
        DECLE   $0014,  $002A,  $0010,  $0008   ; 5F4B   0014 002A 0010 0008
        DECLE   $0000,  $0008,  $001C,  $001C   ; 5F4F   0000 0008 001C 001C
        DECLE   $001C,  $001C,  $001C,  $0018   ; 5F53   001C 001C 001C 0018
        DECLE   $0008,  $0054,  $002E,  $005D   ; 5F57   0008 0054 002E 005D
        DECLE   $00BA,  $0057,  $002E,  $0018   ; 5F5B   00BA 0057 002E 0018
        DECLE   $0000,  $0008,  $001C,  $001C   ; 5F5F   0000 0008 001C 001C
        DECLE   $001C,  $001C,  $001C,  $0018   ; 5F63   001C 001C 001C 0018
        DECLE   $0000,  $0014,  $0026,  $0055   ; 5F67   0000 0014 0026 0055
        DECLE   $002A,  $0057,  $0022,  $0000   ; 5F6B   002A 0057 0022 0000
        DECLE   $0000,  $0008,  $001C,  $001C   ; 5F6F   0000 0008 001C 001C
        DECLE   $001C,  $001C,  $001C,  $0018   ; 5F73   001C 001C 001C 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F77   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F7B   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $001C,  $001C   ; 5F7F   0000 0008 001C 001C
        DECLE   $001C,  $001C,  $001C,  $0018   ; 5F83   001C 001C 001C 0018
        DECLE   $0000,  $0000,  $0018,  $003C   ; 5F87   0000 0000 0018 003C
        DECLE   $00DB,  $0024,  $0018,  $0000   ; 5F8B   00DB 0024 0018 0000
        DECLE   $0000,  $0000,  $0018,  $0024   ; 5F8F   0000 0000 0018 0024
        DECLE   $00DB,  $003C,  $0018,  $0000   ; 5F93   00DB 003C 0018 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; 5F97   0000 0000 0018 003C
        DECLE   $00C3,  $003C,  $0018,  $0000   ; 5F9B   00C3 003C 0018 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; 5F9F   0000 0000 0018 003C
        DECLE   $0003,  $003C,  $0018,  $0000   ; 5FA3   0003 003C 0018 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; 5FA7   0000 0000 0018 003C
        DECLE   $00C0,  $003C,  $0018,  $0000   ; 5FAB   00C0 003C 0018 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; 5FAF   0000 0000 0018 003C
        DECLE   $0000,  $003C,  $0018,  $0000   ; 5FB3   0000 003C 0018 0000
        DECLE   $0000                           ; 5FB7   0000

        NEGR    R4                              ; 5FB8   0024
        RSWD    R4                              ; 5FB9   003C
        NOP                                     ; 5FBA   0034
        ADDR    R4,     R7                      ; 5FBB   00E7

        DECLE   $002C,  $003C,  $0024,  $0000   ; 5FBC   002C 003C 0024 0000
        DECLE   $0024,  $003C,  $0024,  $00FF   ; 5FC0   0024 003C 0024 00FF
        DECLE   $0024,  $003C,  $0024,  $0000   ; 5FC4   0024 003C 0024 0000

        NEGR    R4                              ; 5FC8   0024
        RSWD    R4                              ; 5FC9   003C
        ADCR    R4                              ; 5FCA   002C
        ADDR    R4,     R7                      ; 5FCB   00E7

        DECLE   $0034,  $003C,  $0024,  $0000   ; 5FCC   0034 003C 0024 0000
        DECLE   $0024,  $003C,  $002C,  $0027   ; 5FD0   0024 003C 002C 0027
        DECLE   $0034,  $003C,  $0024,  $0000   ; 5FD4   0034 003C 0024 0000
        DECLE   $0024,  $003C,  $002C,  $00E4   ; 5FD8   0024 003C 002C 00E4
        DECLE   $0034,  $003C,  $0024,  $0000   ; 5FDC   0034 003C 0024 0000
        DECLE   $0024,  $003C,  $002C,  $0024   ; 5FE0   0024 003C 002C 0024
        DECLE   $0034,  $003C,  $0024,  $0000   ; 5FE4   0034 003C 0024 0000
        DECLE   $0020,  $0030,  $003C,  $00F7   ; 5FE8   0020 0030 003C 00F7
        DECLE   $002C,  $0030,  $0020,  $0000   ; 5FEC   002C 0030 0020 0000
        DECLE   $0020,  $0030,  $002C,  $00F7   ; 5FF0   0020 0030 002C 00F7
        DECLE   $003C,  $0030,  $0020,  $0000   ; 5FF4   003C 0030 0020 0000

        NEGR    R0                              ; 5FF8   0020
        GSWD    R0                              ; 5FF9   0030
        RSWD    R4                              ; 5FFA   003C
        ADDR    R4,     R7                      ; 5FFB   00E7

        DECLE   $003C,  $0030,  $0020,  $0000   ; 5FFC   003C 0030 0020 0000
        DECLE   $0020,  $0030,  $003C,  $0027   ; 6000   0020 0030 003C 0027
        DECLE   $003C,  $0030,  $0020,  $0000   ; 6004   003C 0030 0020 0000
        DECLE   $0020,  $0030,  $003C,  $00E4   ; 6008   0020 0030 003C 00E4
        DECLE   $003C,  $0030,  $0020,  $0000   ; 600C   003C 0030 0020 0000
        DECLE   $0020,  $0030,  $003C,  $0024   ; 6010   0020 0030 003C 0024
        DECLE   $003C,  $0030,  $0020,  $0000   ; 6014   003C 0030 0020 0000
        DECLE   $000C,  $0004,  $0024,  $00F7   ; 6018   000C 0004 0024 00F7
        DECLE   $002C,  $0004,  $000C,  $0000   ; 601C   002C 0004 000C 0000
        DECLE   $000C,  $0004,  $002C,  $00F7   ; 6020   000C 0004 002C 00F7
        DECLE   $0024,  $0004,  $000C,  $0000   ; 6024   0024 0004 000C 0000
        DECLE   $000C,  $0004,  $0024,  $00FF   ; 6028   000C 0004 0024 00FF
        DECLE   $0024,  $0004,  $000C,  $0000   ; 602C   0024 0004 000C 0000
        DECLE   $000C,  $0004,  $0024,  $003F   ; 6030   000C 0004 0024 003F
        DECLE   $0024,  $0004,  $000C,  $0000   ; 6034   0024 0004 000C 0000
        DECLE   $000C,  $0004,  $0024,  $00FC   ; 6038   000C 0004 0024 00FC
        DECLE   $0024,  $0004,  $000C,  $0000   ; 603C   0024 0004 000C 0000
        DECLE   $000C,  $0004,  $0024,  $003C   ; 6040   000C 0004 0024 003C
        DECLE   $0024,  $0004,  $000C,  $0000   ; 6044   0024 0004 000C 0000
        DECLE   $0030,  $0030,  $0004,  $00FF   ; 6048   0030 0030 0004 00FF
        DECLE   $0034,  $0030,  $0030,  $0000   ; 604C   0034 0030 0030 0000
        DECLE   $0030,  $0030,  $0034,  $00FF   ; 6050   0030 0030 0034 00FF
        DECLE   $0004,  $0030,  $0030,  $0000   ; 6054   0004 0030 0030 0000

        GSWD    R0                              ; 6058   0030
        GSWD    R0                              ; 6059   0030
        NOP                                     ; 605A   0034
        ADDR    R1,     R7                      ; 605B   00CF

        DECLE   $0034,  $0030,  $0030,  $0000   ; 605C   0034 0030 0030 0000

        GSWD    R0                              ; 6060   0030
        GSWD    R0                              ; 6061   0030
        NOP                                     ; 6062   0034
        INCR    R7                              ; 6063   000F

        NOP                                     ; 6064   0034
L_6065:
        GSWD    R0                              ; 6065   0030
        DECLE   $0030,  $0000,  $0030,  $0030   ; 6066   0030 0000 0030 0030
        DECLE   $0034,  $00CC,  $0034,  $0030   ; 606A   0034 00CC 0034 0030
        DECLE   $0030,  $0000,  $0030,  $0030   ; 606E   0030 0000 0030 0030
        DECLE   $0034,  $000C,  $0034,  $0030   ; 6072   0034 000C 0034 0030
        DECLE   $0030,  $0000,  $003C,  $0028   ; 6076   0030 0000 003C 0028
        DECLE   $0034,  $00F7,  $0034,  $0028   ; 607A   0034 00F7 0034 0028
        DECLE   $003C,  $0000,  $003C,  $0020   ; 607E   003C 0000 003C 0020
        DECLE   $003C,  $00F7,  $003C,  $0020   ; 6082   003C 00F7 003C 0020
        DECLE   $003C,  $0000,  $003C,  $0020   ; 6086   003C 0000 003C 0020
        DECLE   $003C,  $00F7,  $003C,  $0020   ; 608A   003C 00F7 003C 0020
        DECLE   $003C,  $0000,  $003C,  $0020   ; 608E   003C 0000 003C 0020
        DECLE   $003C,  $0037,  $003C,  $0020   ; 6092   003C 0037 003C 0020
        DECLE   $003C,  $0000,  $003C,  $0020   ; 6096   003C 0000 003C 0020
        DECLE   $003C,  $00F4,  $003C,  $0020   ; 609A   003C 00F4 003C 0020
        DECLE   $003C,  $0000,  $003C,  $0020   ; 609E   003C 0000 003C 0020
        DECLE   $003C,  $0034,  $003C,  $0020   ; 60A2   003C 0034 003C 0020
        DECLE   $003C,  $0000,  $0000,  $0000   ; 60A6   003C 0000 0000 0000
        DECLE   $003C,  $00FF,  $003C,  $0000   ; 60AA   003C 00FF 003C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60AE   0000 0000 0000 0000
        DECLE   $003C,  $003F,  $003C,  $0000   ; 60B2   003C 003F 003C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60B6   0000 0000 0000 0000
        DECLE   $003C,  $00FC,  $003C,  $0000   ; 60BA   003C 00FC 003C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60BE   0000 0000 0000 0000
        DECLE   $003C,  $003C,  $003C,  $0000   ; 60C2   003C 003C 003C 0000
        DECLE   $0000                           ; 60C6   0000
.GFX_LIST_60C7:
        DECLE   $0038,  $0038,  $0000,  $00FF   ; 60C7  CART PIC #00
        DECLE   $0000,  $0000,  $0038,  $0038   ; 60CB  
        DECLE   $0010,  $0020,  $0040,  $0081   ; 60CF  CART PIC #01
        DECLE   $0002,  $0004,  $0008,  $0010   ; 60D3  
        DECLE   $0010,  $0010,  $00D3,  $00D3   ; 60D7  CART PIC #02
        DECLE   $00D3,  $0010,  $0010,  $0010   ; 60DB  
        DECLE   $0010,  $0008,  $0004,  $0083   ; 60DF  CART PIC #03
        DECLE   $0040,  $0020,  $0010,  $0010   ; 60E3  
        DECLE   $0010,  $0010,  $0010,  $00FF   ; 60E7  CART PIC #04
        DECLE   $0000,  $00C0,  $00F0,  $00D0   ; 60EB  
        DECLE   $0010,  $0010,  $00D0,  $00DF   ; 60EF  CART PIC #05
        DECLE   $00D0,  $0010,  $0010,  $0010   ; 60F3  
        DECLE   $0070,  $00C0,  $0080,  $00BB   ; 60F7  CART PIC #06
        DECLE   $003A,  $003A,  $0002,  $001E   ; 60FB  
        DECLE   $0038,  $0038,  $0000,  $00FF   ; 60FF  CART PIC #07
        DECLE   $0010,  $0010,  $0010,  $0010   ; 6103  
        DECLE   $0010,  $0010,  $0010,  $00FF   ; 6107  CART PIC #08
        DECLE   $0010,  $0010,  $0010,  $0010   ; 610B  
        DECLE   $0010,  $0010,  $0038,  $00FF   ; 610F  CART PIC #09
        DECLE   $0038,  $0010,  $0010,  $0010   ; 6113  
        DECLE   $0010,  $0010,  $0020,  $00C1   ; 6117  CART PIC #0A
        DECLE   $0042,  $0024,  $0018,  $0010   ; 611B  
        DECLE   $0000,  $0000,  $00C0,  $00C0   ; 611F  CART PIC #0B
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 6123  
        DECLE   $0038,  $0038,  $0000,  $0000   ; 6127  CART PIC #0C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 612B  
        DECLE   $0000,  $0000,  $0003,  $0003   ; 612F  CART PIC #0D
        DECLE   $0003,  $0000,  $0000,  $0000   ; 6133  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6137  CART PIC #0E
        DECLE   $0000,  $0000,  $0038,  $0038   ; 613B  
        DECLE   $00FF,  $00FF,  $00C3,  $0000   ; 613F  CART PIC #0F
        DECLE   $00FF,  $0000,  $00C3,  $00FF   ; 6143  
        DECLE   $00FF,  $003C,  $0000,  $0030   ; 6147  CART PIC #10
        DECLE   $003C,  $000C,  $0000,  $003C   ; 614B  
        DECLE   $00FF,  $003F,  $000F,  $0000   ; 614F  CART PIC #11
        DECLE   $003C,  $0000,  $000F,  $003F   ; 6153  
        DECLE   $00FF,  $00F0,  $00FC,  $003C   ; 6157  CART PIC #12
        DECLE   $0000,  $003C,  $00FC,  $00F0   ; 615B  
        DECLE   $00FF,  $000F,  $000F,  $000C   ; 615F  CART PIC #13
        DECLE   $00F0,  $000C,  $000F,  $000F   ; 6163  
        DECLE   $00FF,  $0000,  $003F,  $0000   ; 6167  CART PIC #14
        DECLE   $000C,  $0000,  $003F,  $0000   ; 616B  
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 616F  CART PIC #15
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 6173  
        DECLE   $0010,  $0020,  $0040,  $0081   ; 6177  CART PIC #16
        DECLE   $0080,  $0040,  $0020,  $0010   ; 617B  
        DECLE   $0038,  $0000,  $0000,  $0000   ; 617F  CART PIC #17
        DECLE   $0000,  $0000,  $0000,  $0038   ; 6183  
        DECLE   $0010,  $0008,  $0004,  $0083   ; 6187  CART PIC #18
        DECLE   $0002,  $0004,  $0008,  $0010   ; 618B  
        DECLE   $0081,  $0081,  $0081,  $0081   ; 618F  CART PIC #19
        DECLE   $0081,  $0081,  $0081,  $0081   ; 6193  
        DECLE   $0018,  $0018,  $0018,  $003C   ; 6197  CART PIC #1A
        DECLE   $003C,  $003C,  $007E,  $007E   ; 619B  
        DECLE   $0000,  $0000,  $0080,  $0080   ; 619F  CART PIC #1B
        DECLE   $0080,  $0080,  $008F,  $009F   ; 61A3  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61A7   0000 0000 0000 0000
        DECLE   $0010,  $0000,  $0000,  $0000   ; 61AB   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0038   ; 61AF   0000 0000 0000 0038
        DECLE   $0038,  $0038,  $0000,  $0000   ; 61B3   0038 0038 0000 0000
        DECLE   $0000,  $0000,  $0028,  $0044   ; 61B7   0000 0000 0028 0044
        DECLE   $0082,  $0040,  $0024,  $0000   ; 61BB   0082 0040 0024 0000

        DECR    R0                              ; 61BF   0010
        SWAP    R0,     2                       ; 61C0   0044
        MOVR    R0,     R2                      ; 61C1   0082
        ADCR    R1                              ; 61C2   0029
        TSTR    R0                              ; 61C3   0080
        SLL     R1,     1                       ; 61C4   0049
        NEGR    R4                              ; 61C5   0024
        COMR    R0                              ; 61C6   0018
        MOVR    R0,     R1                      ; 61C7   0081
        MOVR    R0,     R1                      ; 61C8   0081
        MOVR    R3,     R1                      ; 61C9   0099
        MOVR    R3,     R1                      ; 61CA   0099
        MOVR    R3,     R1                      ; 61CB   0099
        MOVR    R3,     R1                      ; 61CC   0099
        MOVR    R0,     R7                      ; 61CD   0087
        MOVR    R0,     R7                      ; 61CE   0087

        MOVR    R0,     R1                      ; 61CF   0081
        MOVR    R0,     R1                      ; 61D0   0081
        MOVR    R3,     R1                      ; 61D1   0099
        MOVR    R3,     R1                      ; 61D2   0099
        MOVR    R3,     R7                      ; 61D3   009F
        MOVR    R3,     R7                      ; 61D4   009F

        MOVR    R0,     R1                      ; 61D5   0081
        MOVR    R0,     R1                      ; 61D6   0081
        MOVR    R0,     R1                      ; 61D7   0081
        MOVR    R0,     R1                      ; 61D8   0081
        MOVR    R3,     R7                      ; 61D9   009F
        MOVR    R3,     R7                      ; 61DA   009F

        MOVR    R3,     R1                      ; 61DB   0099
        MOVR    R3,     R1                      ; 61DC   0099
        MOVR    R0,     R1                      ; 61DD   0081
        MOVR    R0,     R1                      ; 61DE   0081
        MOVR    R0,     R7                      ; 61DF   0087
        MOVR    R0,     R7                      ; 61E0   0087

        MOVR    R3,     R1                      ; 61E1   0099
        MOVR    R3,     R1                      ; 61E2   0099
        MOVR    R3,     R1                      ; 61E3   0099
        MOVR    R3,     R1                      ; 61E4   0099
        MOVR    R0,     R1                      ; 61E5   0081
        MOVR    R0,     R1                      ; 61E6   0081
        MOVR    R3,     R1                      ; 61E7   0099
        MOVR    R3,     R1                      ; 61E8   0099
        MOVR    R3,     R1                      ; 61E9   0099
        MOVR    R3,     R1                      ; 61EA   0099
        MOVR    R3,     R1                      ; 61EB   0099
        MOVR    R3,     R1                      ; 61EC   0099
        MOVR    R0,     R1                      ; 61ED   0081
        MOVR    R0,     R1                      ; 61EE   0081
        ADDR    R4,     R1                      ; 61EF   00E1
        ADDR    R4,     R1                      ; 61F0   00E1
        MOVR    R3,     R1                      ; 61F1   0099
        MOVR    R3,     R1                      ; 61F2   0099
        MOVR    R3,     R1                      ; 61F3   0099
        MOVR    R3,     R1                      ; 61F4   0099
        MOVR    R0,     R1                      ; 61F5   0081
        MOVR    R0,     R1                      ; 61F6   0081
L_61F7:
        MOVR    R0,     R1                      ; 61F7   0081
        DECLE   $0081,  $00F9,  $00F9,  $0099   ; 61F8   0081 00F9 00F9 0099
        DECLE   $0099,  $0081,  $0081,  $0081   ; 61FC   0099 0081 0081 0081
        DECLE   $0081,  $0099,  $0099,  $00F9   ; 6200   0081 0099 0099 00F9
        DECLE   $00F9,  $0081,  $0081,  $0081   ; 6204   00F9 0081 0081 0081
        DECLE   $0081,  $0099,  $0099,  $0099   ; 6208   0081 0099 0099 0099
        DECLE   $0099,  $00E1,  $00E1,  $0081   ; 620C   0099 00E1 00E1 0081
        DECLE   $0081,  $0099,  $0099,  $0099   ; 6210   0081 0099 0099 0099
        DECLE   $0099,  $0099,  $0099,  $00FF   ; 6214   0099 0099 0099 00FF
        DECLE   $00FF,  $00FF                   ; 6218   00FF 00FF

        ADDR    R4,     R7                      ; 621A   00E7
        ADDR    R4,     R7                      ; 621B   00E7

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 621C   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00C3,  $00DB,  $00DB   ; 6220   00FF 00C3 00DB 00DB
        DECLE   $00C3,  $00FF,  $00FF,  $00FF   ; 6224   00C3 00FF 00FF 00FF
        DECLE   $0081,  $00BD,  $00BD,  $00BD   ; 6228   0081 00BD 00BD 00BD
        DECLE   $00BD,  $0081,  $00FF,  $00FF   ; 622C   00BD 0081 00FF 00FF
        DECLE   $0081,  $00BD,  $00A5,  $00A5   ; 6230   0081 00BD 00A5 00A5
        DECLE   $00BD,  $0081,  $00FF,  $00FF   ; 6234   00BD 0081 00FF 00FF
        DECLE   $0081,  $0081,  $0081,  $0081   ; 6238   0081 0081 0081 0081
        DECLE   $0081,  $0081,  $00FF,  $00FF   ; 623C   0081 0081 00FF 00FF
        DECLE   $0081,  $0081,  $0081,  $0081   ; 6240   0081 0081 0081 0081
        DECLE   $0081,  $0081,  $0081,  $00FF   ; 6244   0081 0081 0081 00FF
        DECLE   $00FF,  $0081,  $0081,  $0081   ; 6248   00FF 0081 0081 0081
        DECLE   $0081,  $0081,  $0081,  $0081   ; 624C   0081 0081 0081 0081
        DECLE   $00FF,  $00FF,  $0081,  $0081   ; 6250   00FF 00FF 0081 0081
        DECLE   $0081,  $0081,  $0081,  $0081   ; 6254   0081 0081 0081 0081
        DECLE   $0081,  $00FF,  $00FF,  $0081   ; 6258   0081 00FF 00FF 0081
        DECLE   $0081,  $0081,  $0081,  $0081   ; 625C   0081 0081 0081 0081
        DECLE   $0081,  $0081,  $00FF,  $00FF   ; 6260   0081 0081 00FF 00FF
        DECLE   $0081,  $0081,  $0081,  $0081   ; 6264   0081 0081 0081 0081
        DECLE   $0081,  $0081,  $0081,  $00FF   ; 6268   0081 0081 0081 00FF
        DECLE   $00FF,  $0081,  $0081,  $0081   ; 626C   00FF 0081 0081 0081
        DECLE   $0081,  $0081,  $0081,  $0081   ; 6270   0081 0081 0081 0081
        DECLE   $00FF,  $00FF,  $0081,  $0081   ; 6274   00FF 00FF 0081 0081
        DECLE   $0081,  $0081,  $0081,  $0081   ; 6278   0081 0081 0081 0081
        DECLE   $0081,  $00FF,  $00FF,  $0081   ; 627C   0081 00FF 00FF 0081
        DECLE   $0081,  $0081,  $0081,  $0081   ; 6280   0081 0081 0081 0081
        DECLE   $0081,  $0081,  $00FF           ; 6284   0081 0081 00FF
L_6287:
        PSHR    R5                              ; 6287   0275
        MVII    #$0325, R4                      ; 6288   02BC 0325
        MVII    #$0018, R0                      ; 628A   02B8 0018

        JSR     R5,     X_FILL_ZERO             ; 628C   0004 0114 0338

        SDBD                                    ; 628F   0001
        MVII    #$62AA, R0                      ; 6290   02B8 00AA 0062
        MVII    #$0326, R4                      ; 6293   02BC 0326
L_6295:
        MVO@    R0,     R4                      ; 6295   0260
        ADDI    #$0007, R0                      ; 6296   02F8 0007
        ADDI    #$0007, R4                      ; 6298   02FC 0007
        CMPI    #$033D, R4                      ; 629A   037C 033D
        BLT     L_6295                          ; 629C   0225 0008

        MVII    #$032A, R4                      ; 629E   02BC 032A
        MVII    #$03F0, R0                      ; 62A0   02B8 03F0
L_62A2:
        MVO@    R0,     R4                      ; 62A2   0260
        ADDI    #$0007, R4                      ; 62A3   02FC 0007
        CMPI    #$033D, R4                      ; 62A5   037C 033D
        BLT     L_62A2                          ; 62A7   0225 0006
        PULR    R7                              ; 62A9   02B7

        DECLE   $0200,  $0000,  $0000,  $0000   ; 62AA   0200 0000 0000 0000
        DECLE   $000A,  $0077,  $0000,  $0200   ; 62AE   000A 0077 0000 0200
        DECLE   $0000,  $0000,  $0000,  $0005   ; 62B2   0000 0000 0000 0005
        DECLE   $0081,  $0000,  $0200,  $0000   ; 62B6   0081 0000 0200 0000
        DECLE   $0000,  $0000,  $0009,  $0086   ; 62BA   0000 0000 0009 0086
        DECLE   $0000                           ; 62BE   0000

        PSHR    R5                              ; 62BF   0275
        CMPI    #$000B, R0                      ; 62C0   0378 000B
        BEQ     L_6319                          ; 62C2   0204 0055

        CMPI    #$000A, R0                      ; 62C4   0378 000A
        BEQ     L_62F3                          ; 62C6   0204 002B

        MOVR    R0,     R2                      ; 62C8   0082
        MVII    #$0170, R1                      ; 62C9   02B9 0170
        ADD     G_016A, R1                      ; 62CB   02C1 016A
        MVI     G_032C, R0                      ; 62CD   0280 032C
        ANDI    #$0010, R0                      ; 62CF   03B8 0010
        BNEQ    L_62D8                          ; 62D1   020C 0005

        MVII    #$002B, R0                      ; 62D3   02B8 002B

        JSR     R5,     L_68AF                  ; 62D5   0004 0168 00AF

L_62D8:
        MOVR    R2,     R0                      ; 62D8   0090
        ANDI    #$000F, R0                      ; 62D9   03B8 000F
        MVO@    R0,     R1                      ; 62DB   0248
        XORI    #$0010, R0                      ; 62DC   03F8 0010
        MVO     R0,     G_032C                  ; 62DE   0240 032C
        SLL     R0,     2                       ; 62E0   004C
        SLL     R0,     1                       ; 62E1   0048
        XORI    #$0007, R0                      ; 62E2   03F8 0007

        JSR     R5,     L_630F                  ; 62E4   0004 0160 030F

        MVI     G_0165, R0                      ; 62E7   0280 0165
        DECR    R0                              ; 62E9   0010
        BNEQ    L_62F2                          ; 62EA   020C 0006

        JSR     R5,     L_64FC                  ; 62EC   0004 0164 00FC
        JSR     R5,     L_64B2                  ; 62EF   0004 0164 00B2

L_62F2:
        PULR    R7                              ; 62F2   02B7

L_62F3:
        CLRR    R0                              ; 62F3   01C0

        JSR     R5,     L_64D7                  ; 62F4   0004 0164 00D7

        MVII    #$0170, R1                      ; 62F7   02B9 0170
        ADD     G_016A, R1                      ; 62F9   02C1 016A
        MVI     G_01BE, R0                      ; 62FB   0280 01BE
        MVO@    R0,     R1                      ; 62FD   0248

        JSR     R5,     L_52CB                  ; 62FE   0004 0150 02CB

L_6301:
        SDBD                                    ; 6301   0001
        MVII    #$5166, R0                      ; 6302   02B8 0066 0051
        MVO     R0,     G_035D                  ; 6305   0240 035D
        MVII    #$0000, R0                      ; 6307   02B8 0000
        MVO     R0,     G_032C                  ; 6309   0240 032C

        JSR     R5,     L_630F                  ; 630B   0004 0160 030F

        PULR    R7                              ; 630E   02B7

L_630F:
        MVI     G_016A, R1                      ; 630F   0281 016A
        SLL     R1,     1                       ; 6311   0049
        MOVR    R1,     R3                      ; 6312   008B
        SLL     R1,     1                       ; 6313   0049
        ADDR    R1,     R3                      ; 6314   00CB
        ADDI    #$02E0, R3                      ; 6315   02FB 02E0
        MVO@    R0,     R3                      ; 6317   0258
        MOVR    R5,     R7                      ; 6318   00AF

L_6319:
        MVI     G_032C, R0                      ; 6319   0280 032C
        ANDI    #$0010, R0                      ; 631B   03B8 0010
        BNEQ    L_6320                          ; 631D   020C 0001
        PULR    R7                              ; 631F   02B7

L_6320:
        MVI     G_032C, R2                      ; 6320   0282 032C
        ANDI    #$000F, R2                      ; 6322   03BA 000F
        MVI     G_01BE, R0                      ; 6324   0280 01BE
        ANDI    #$00F0, R0                      ; 6326   03B8 00F0
        BNEQ    L_62F3                          ; 6328   022C 0036

        MVI     G_01BE, R0                      ; 632A   0280 01BE

        JSR     R5,     L_69A5                  ; 632C   0004 0168 01A5

        CMP     G_01BE, R2                      ; 632F   0342 01BE
        BEQ     L_6336                          ; 6331   0204 0003
        J       L_6509                          ; 6333   0004 0364 0109

L_6336:
        MVII    #$0031, R0                      ; 6336   02B8 0031

        JSR     R5,     L_68AF                  ; 6338   0004 0168 00AF

        CLRR    R0                              ; 633B   01C0

        JSR     R5,     L_64D7                  ; 633C   0004 0164 00D7
        JSR     R5,     L_64B2                  ; 633F   0004 0164 00B2

        MVI     G_01BE, R0                      ; 6342   0280 01BE
        XORI    #$00F0, R0                      ; 6344   03F8 00F0
        MVII    #$0170, R1                      ; 6346   02B9 0170
        ADD     G_016A, R1                      ; 6348   02C1 016A
        MVO@    R0,     R1                      ; 634A   0248
        MVII    #$0064, R0                      ; 634B   02B8 0064

        JSR     R5,     L_64A7                  ; 634D   0004 0164 00A7

        MVII    #$0170, R4                      ; 6350   02BC 0170
        MVII    #$0003, R0                      ; 6352   02B8 0003
L_6354:
        MVI@    R4,     R2                      ; 6354   02A2
        SWAP    R2,     2                       ; 6355   0046
        BPL     L_6301                          ; 6356   0223 0056

        DECR    R0                              ; 6358   0010
        BNEQ    L_6354                          ; 6359   022C 0006

        MVO     R0,     G_011A                  ; 635B   0240 011A
        MVII    #$00C8, R0                      ; 635D   02B8 00C8

        JSR     R5,     L_64A7                  ; 635F   0004 0164 00A7

        SDBD                                    ; 6362   0001
        MVII    #$1906, R0                      ; 6363   02B8 0006 0019
        MVO     R0,     G_035D                  ; 6366   0240 035D
        MVII    #$000C, R0                      ; 6368   02B8 000C
        MVO     R0,     G_0115                  ; 636A   0240 0115
        SDBD                                    ; 636C   0001
        MVII    #$505E, R1                      ; 636D   02B9 005E 0050

        JSR     R5,     X_TIMER_STOP            ; 6370   0004 0118 0038

        MVII    #$0080, R0                      ; 6373   02B8 0080
        MVO     R0,     G_01C7                  ; 6375   0240 01C7
        MVII    #$0040, R0                      ; 6377   02B8 0040
        MVII    #$031D, R4                      ; 6379   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; 637B   0004 0114 0338
        JSR     R5,     L_6631                  ; 637E   0004 0164 0231

        MVII    #$0003, R0                      ; 6381   02B8 0003
        MVO     R0,     G_0102                  ; 6383   0240 0102
L_6385:
        MVI     G_01CC, R0                      ; 6385   0280 01CC
        ANDI    #$0080, R0                      ; 6387   03B8 0080
        BNEQ    L_6385                          ; 6389   022C 0005

        MVII    #$0059, R0                      ; 638B   02B8 0059

        JSR     R5,     L_68AF                  ; 638D   0004 0168 00AF

        MVI     G_0160, R0                      ; 6390   0280 0160
        MVII    #$0002, R1                      ; 6392   02B9 0002
        MVII    #$0007, R3                      ; 6394   02BB 0007
        MVII    #$020E, R4                      ; 6396   02BC 020E

        JSR     R5,     X_PRNUM_RGT             ; 6398   0004 0118 00C5

        ADDR    R1,     R4                      ; 639B   00CC
        MVII    #$00D7, R0                      ; 639C   02B8 00D7
        MVO@    R0,     R4                      ; 639E   0260
        MVI     G_015F, R0                      ; 639F   0280 015F

        JSR     R5,     X_PRNUM_ZRO             ; 63A1   0004 0118 00AD

        MVI     G_016F, R0                      ; 63A4   0280 016F
        MVII    #$0001, R1                      ; 63A6   02B9 0001
        MVII    #$0007, R3                      ; 63A8   02BB 0007
        MVII    #$02EC, R4                      ; 63AA   02BC 02EC

        JSR     R5,     X_PRNUM_ZRO             ; 63AC   0004 0118 00AD

        INCR    R4                              ; 63AF   000C
        MVII    #$00D7, R0                      ; 63B0   02B8 00D7
        MVO@    R0,     R4                      ; 63B2   0260
        MVI     G_0165, R0                      ; 63B3   0280 0165

        JSR     R5,     X_PRNUM_RGT             ; 63B5   0004 0118 00C5
        JSR     R5,     L_5233                  ; 63B8   0004 0150 0233
        JSR     R5,     L_63BF                  ; 63BB   0004 0160 03BF

        PULR    R7                              ; 63BE   02B7

L_63BF:
        PSHR    R5                              ; 63BF   0275

        JSR     R5,     X_PLAY_SFX1             ; 63C0   0004 0118 03BB
        DECLE   $002F                           ; 63C3  SFX data
        DECLE   $00CF                           ; 63C4  SFX end


        JSR     R5,     X_PLAY_MUS2             ; 63C5   0004 0118 035D
        DECLE   $03F7,  $000B                   ; 63C8  Note (long)
        DECLE   $00CD                           ; 63CA  Note (short)
        DECLE   $00CC                           ; 63CB  Note (short)
        DECLE   $00CC                           ; 63CC  Note (short)
        DECLE   $00CE                           ; 63CD  Note (short)
        DECLE   $000E                           ; 63CE  Note (short)
        DECLE   $00CD                           ; 63CF  Note (short)
        DECLE   $00CC                           ; 63D0  Note (short)
        DECLE   $00CC                           ; 63D1  Note (short)
        DECLE   $00CE                           ; 63D2  Note (short)
        DECLE   $000E                           ; 63D3  Note (short)
        DECLE   $00CD                           ; 63D4  Note (short)
        DECLE   $00CC                           ; 63D5  Note (short)
        DECLE   $00CC                           ; 63D6  Note (short)
        DECLE   $00CE                           ; 63D7  Note (short)
        DECLE   $000E                           ; 63D8  Note (short)
        DECLE   $00CC                           ; 63D9  Note (short)
        DECLE   $00EC                           ; 63DA  Note (short)
        DECLE   $00CC                           ; 63DB  Note (short)
        DECLE   $00EC                           ; 63DC  Note (short)
        DECLE   $03F6,  $010F                   ; 63DD  Note (long)
        DECLE   $0000                           ; 63DF  End of music

        MVII    #$0067, R0                      ; 63E0   02B8 0067

        JSR     R5,     L_68AF                  ; 63E2   0004 0168 00AF

        MVII    #$031D, R4                      ; 63E5   02BC 031D

L_63E7:
        JSR     R5,     L_6410                  ; 63E7   0004 0164 0010

        CMPI    #$0354, R4                      ; 63EA   037C 0354
        BLT     L_63E7                          ; 63EC   0225 0006

        JSR     R5,     X_PLAY_SFX1             ; 63EE   0004 0118 03BB
        DECLE   $0077,  $0008,  $0064           ; 63F1  SFX data
        DECLE   $0103,  $03EC                   ; 63F4  SFX data
        DECLE   $00CF                           ; 63F6  SFX end


        DIS                                     ; 63F7   0003
        SDBD                                    ; 63F8   0001
        MVII    #$1126, R0                      ; 63F9   02B8 0026 0011
        MVO     R0,     .ISRVEC.0               ; 63FC   0240 0100
        SWAP    R0,     1                       ; 63FE   0040
        MVO     R0,     .ISRVEC.1               ; 63FF   0240 0101
        EIS                                     ; 6401   0002
        MVII    #$0028, R0                      ; 6402   02B8 0028

        JSR     R5,     X_PLAY_CHEER1           ; 6404   0004 011C 02D5

        PULR    R7                              ; 6407   02B7

UC_6408:
        MVI     G_01CC, R0                      ; 6408  SLIB UCALL target
        ANDI    #$0040, R0                      ; 640A   03B8 0040
        INCR    R0                              ; 640C   0008
        MVO     R0,     G_0159                  ; 640D   0240 0159
        PULR    R7                              ; 640F   02B7

L_6410:
        PSHR    R5                              ; 6410   0275
L_6411:
        MVII    #$001F, R0                      ; 6411   02B8 001F

        JSR     R5,     X_RAND2                 ; 6413   0004 0114 029E

        ANDI    #$0016, R0                      ; 6416   03B8 0016
        BEQ     L_6411                          ; 6418   0224 0008

        CMPI    #$0004, R0                      ; 641A   0378 0004
        BEQ     L_6411                          ; 641C   0224 000C

        SDBD                                    ; 641E   0001
        XORI    #$3128, R0                      ; 641F   03F8 0028 0031
        MVO@    R0,     R4                      ; 6422   0260
        SDBD                                    ; 6423   0001
        MVII    #$6484, R0                      ; 6424   02B8 0084 0064
        MVO@    R0,     R4                      ; 6427   0260
        MVI     G_016F, R0                      ; 6428   0280 016F
        SLL     R0,     2                       ; 642A   004C
        MOVR    R0,     R2                      ; 642B   0082
        SLL     R0,     2                       ; 642C   004C

        JSR     R5,     X_RAND2                 ; 642D   0004 0114 029E

        COMR    R2                              ; 6430   001A
        ADDI    #$0046, R2                      ; 6431   02FA 0046
        ADDR    R2,     R0                      ; 6433   00D0
        SWAP    R0,     1                       ; 6434   0040
        MVO@    R0,     R4                      ; 6435   0260
        SDBD                                    ; 6436   0001
        MVII    #$3000, R0                      ; 6437   02B8 0000 0030
        MVO@    R0,     R4                      ; 643A   0260
        MVII    #$0010, R0                      ; 643B   02B8 0010

        JSR     R5,     X_RAND2                 ; 643D   0004 0114 029E

        SWAP    R0,     1                       ; 6440   0040
        SDBD                                    ; 6441   0001
        ADDI    #$F8D4, R0                      ; 6442   02F8 00D4 00F8
        MVO@    R0,     R4                      ; 6445   0260
        INCR    R4                              ; 6446   000C
        MVII    #$000A, R0                      ; 6447   02B8 000A

        JSR     R5,     X_RAND2                 ; 6449   0004 0114 029E

        ADDI    #$0032, R0                      ; 644C   02F8 0032
        MVO@    R0,     R4                      ; 644E   0260
        INCR    R4                              ; 644F   000C
        MOVR    R4,     R1                      ; 6450   00A1
        MVII    #$0008, R0                      ; 6451   02B8 0008
        SUBI    #$0008, R4                      ; 6453   033C 0008

        JSR     R5,     .EXEC.730               ; 6455   0004 0114 0330

        MOVR    R5,     R4                      ; 6458   00AC
        SUBI    #$0004, R5                      ; 6459   033D 0004
        MOVR    R5,     R1                      ; 645B   00A9
        MVI@    R1,     R0                      ; 645C   0288
        XORI    #$00FF, R0                      ; 645D   03F8 00FF
        MVO@    R0,     R1                      ; 645F   0248
        PULR    R7                              ; 6460   02B7

        PSHR    R5                              ; 6461   0275
        ADDI    #$0007, R1                      ; 6462   02F9 0007
        MVI@    R1,     R2                      ; 6464   028A
        TSTR    R2                              ; 6465   0092
        BNEQ    L_6476                          ; 6466   020C 000E

        INCR    R2                              ; 6468   000A
        MVO@    R2,     R1                      ; 6469   024A
        DECR    R1                              ; 646A   0011
        MVII    #$000A, R0                      ; 646B   02B8 000A
        MVO@    R0,     R1                      ; 646D   0248
        DECR    R1                              ; 646E   0011
        MVII    #$0200, R0                      ; 646F   02B8 0200
        MVO@    R0,     R1                      ; 6471   0248

        JSR     R5,     L_648B                  ; 6472   0004 0164 008B

L_6475:
        PULR    R7                              ; 6475   02B7

L_6476:
        SARC    R0,     1                       ; 6476   0078
        BC      L_6475                          ; 6477   0221 0003

        SUBI    #$0007, R1                      ; 6479   0339 0007
        MOVR    R1,     R4                      ; 647B   008C
        MVII    #$0010, R0                      ; 647C   02B8 0010

        JSR     R5,     X_FILL_ZERO             ; 647E   0004 0114 0338

        MOVR    R1,     R4                      ; 6481   008C
        B       L_6411                          ; 6482   0220 0072
        B       L_6486                          ; 6484   0200 0000

L_6486:
        SLR     R1,     1                       ; 6486   0061
        DECLE   $0064,  $0004,  $0073,  $0000   ; 6487   0064 0004 0073 0000
L_648B:
        PSHR    R5                              ; 648B   0275
        MVI     .PSG0.chan_enable,R0            ; 648C   0280 01F8
        ANDI    #$001F, R0                      ; 648E   03B8 001F
        MVO     R0,     .PSG0.chan_enable       ; 6490   0240 01F8
        MVII    #$0030, R0                      ; 6492   02B8 0030
        MVO     R0,     .PSG0.chn_c_vol         ; 6494   0240 01FD
        MVII    #$0020, R0                      ; 6496   02B8 0020
        MVO     R0,     .PSG0.envlp_hi          ; 6498   0240 01F7
        CLRR    R0                              ; 649A   01C0
        MVO     R0,     .PSG0.envelope          ; 649B   0240 01FA
        PULR    R7                              ; 649D   02B7

L_649E:
        PSHR    R5                              ; 649E   0275

        JSR     R5,     L_64A7                  ; 649F   0004 0164 00A7

        ADD     G_01BD, R0                      ; 64A2   02C0 01BD
        MVO     R0,     G_01BD                  ; 64A4   0240 01BD
        PULR    R7                              ; 64A6   02B7

L_64A7:
        MVII    #$01BA, R4                      ; 64A7   02BC 01BA
        SDBD                                    ; 64A9   0001
        MVI@    R4,     R1                      ; 64AA   02A1
        ADDR    R0,     R1                      ; 64AB   00C1
        DECR    R4                              ; 64AC   0014
        DECR    R4                              ; 64AD   0014
        MVO@    R1,     R4                      ; 64AE   0261
        SWAP    R1,     1                       ; 64AF   0041
        MVO@    R1,     R4                      ; 64B0   0261
        MOVR    R5,     R7                      ; 64B1   00AF

L_64B2:
        PSHR    R5                              ; 64B2   0275
        MVII    #$016B, R4                      ; 64B3   02BC 016B
        SDBD                                    ; 64B5   0001
        MVI@    R4,     R0                      ; 64B6   02A0
        PSHR    R0                              ; 64B7   0270
        MVII    #$0004, R0                      ; 64B8   02B8 0004
L_64BA:
        MVO     R0,     G_016C                  ; 64BA   0240 016C
        MVII    #$0003, R0                      ; 64BC   02B8 0003
L_64BE:
        MVO     R0,     G_016B                  ; 64BE   0240 016B

        JSR     R5,     L_59CC                  ; 64C0   0004 0158 01CC

        MVI     G_016B, R0                      ; 64C3   0280 016B
        DECR    R0                              ; 64C5   0010
        BPL     L_64BE                          ; 64C6   0223 0009

        MVI     G_016C, R0                      ; 64C8   0280 016C
        DECR    R0                              ; 64CA   0010
        BPL     L_64BA                          ; 64CB   0223 0012

        JSR     R5,     L_52CB                  ; 64CD   0004 0150 02CB

        PULR    R0                              ; 64D0   02B0
        MVO     R0,     G_016B                  ; 64D1   0240 016B
        SWAP    R0,     1                       ; 64D3   0040
        MVO     R0,     G_016C                  ; 64D4   0240 016C
        PULR    R7                              ; 64D6   02B7

L_64D7:
        MVII    #$016B, R4                      ; 64D7   02BC 016B
        SDBD                                    ; 64D9   0001
        MVI@    R4,     R3                      ; 64DA   02A3
        PSHR    R3                              ; 64DB   0273
        PSHR    R1                              ; 64DC   0271
        MVII    #$01BF, R4                      ; 64DD   02BC 01BF
        MVII    #$0173, R3                      ; 64DF   02BB 0173
        ADD     G_016A, R3                      ; 64E1   02C3 016A
L_64E3:
        TSTR    R0                              ; 64E3   0080
        BNEQ    L_64EA                          ; 64E4   020C 0004

        MVI@    R4,     R1                      ; 64E6   02A1
        MVO@    R1,     R3                      ; 64E7   0259
        B       L_64EE                          ; 64E8   0200 0004

L_64EA:
        MVI@    R3,     R1                      ; 64EA   0299
        MVO@    R1,     R4                      ; 64EB   0261
        CLRR    R1                              ; 64EC   01C9
        MVO@    R1,     R3                      ; 64ED   0259
L_64EE:
        ADDI    #$0003, R3                      ; 64EE   02FB 0003
        CMPI    #$01C4, R4                      ; 64F0   037C 01C4
        BLT     L_64E3                          ; 64F2   0225 0010

        PULR    R1                              ; 64F4   02B1
        PULR    R3                              ; 64F5   02B3
        MVO     R3,     G_016B                  ; 64F6   0243 016B
        SWAP    R3,     1                       ; 64F8   0043
        MVO     R3,     G_016C                  ; 64F9   0243 016C
        MOVR    R5,     R7                      ; 64FB   00AF

L_64FC:
        MVII    #$0173, R1                      ; 64FC   02B9 0173
        ADD     G_016A, R1                      ; 64FE   02C1 016A
        CLRR    R0                              ; 6500   01C0
L_6501:
        MVO@    R0,     R1                      ; 6501   0248
        ADDI    #$0003, R1                      ; 6502   02F9 0003
        CMPI    #$0182, R1                      ; 6504   0379 0182
        BLT     L_6501                          ; 6506   0225 0006
        MOVR    R5,     R7                      ; 6508   00AF

L_6509:
        MVII    #$0080, R0                      ; 6509   02B8 0080
        MVO     R0,     G_01C7                  ; 650B   0240 01C7
        SDBD                                    ; 650D   0001
        MVII    #$1906, R0                      ; 650E   02B8 0006 0019
        MVO     R0,     G_035D                  ; 6511   0240 035D

        JSR     R5,     L_6631                  ; 6513   0004 0164 0231

L_6516:
        MVI     G_01CC, R0                      ; 6516   0280 01CC
        ANDI    #$0080, R0                      ; 6518   03B8 0080
        BNEQ    L_6516                          ; 651A   022C 0005

        MVII    #$003D, R0                      ; 651C   02B8 003D

        JSR     R5,     L_68AF                  ; 651E   0004 0168 00AF

        CLRR    R3                              ; 6521   01DB
        MVII    #$0003, R2                      ; 6522   02BA 0003
        SDBD                                    ; 6524   0001
        MVII    #$0170, R4                      ; 6525   02BC 0070 0001
L_6528:
        MVI@    R4,     R0                      ; 6528   02A0
        CMPI    #$00F0, R0                      ; 6529   0378 00F0
        ADCR    R3                              ; 652B   002B
        DECR    R2                              ; 652C   0012
        BNEQ    L_6528                          ; 652D   022C 0006

        SLL     R3,     1                       ; 652F   004B
        SDBD                                    ; 6530   0001
        ADDI    #$65F5, R3                      ; 6531   02FB 00F5 0065
        MVO     R3,     G_0334                  ; 6534   0243 0334
        SDBD                                    ; 6536   0001
        MVII    #$5066, R1                      ; 6537   02B9 0066 0050

        JSR     R5,     X_TIMER_START           ; 653A   0004 0118 0044

        CLRR    R0                              ; 653D   01C0
        MVO     R0,     G_0167                  ; 653E   0240 0167
        MVO     R0,     G_01A1                  ; 6540   0240 01A1
        PULR    R7                              ; 6542   02B7

L_6543:
        PSHR    R5                              ; 6543   0275
        MVI     G_0167, R1                      ; 6544   0281 0167
        INCR    R1                              ; 6546   0009
        ADDR    R7,     R1                      ; 6547   00F9
        ADD@    R1,     R7                      ; 6548   02CF

        JSRD    R4,     .EXEC.44C               ; 6549   0004 0016 004C

        MOVR    R3,     R7                      ; 654C   009F

        MVI     G_01A1, R0                      ; 654D   0280 01A1
        INCR    R0                              ; 654F   0008
        MVO     R0,     G_01A1                  ; 6550   0240 01A1
        CMPI    #$0028, R0                      ; 6552   0378 0028
        BNEQ    L_655E                          ; 6554   020C 0008

        JSR     R5,     L_6623                  ; 6556   0004 0164 0223

        MVI     G_0167, R0                      ; 6559   0280 0167
        INCR    R0                              ; 655B   0008
        MVO     R0,     G_0167                  ; 655C   0240 0167
L_655E:
        PULR    R7                              ; 655E   02B7

        SDBD                                    ; 655F   0001
        MVII    #$65F0, R4                      ; 6560   02BC 00F0 0065
        MVII    #$0005, R1                      ; 6563   02B9 0005
L_6565:
        MVI@    R4,     R0                      ; 6565   02A0

        JSR     R5,     L_66C9                  ; 6566   0004 0164 02C9

        MVII    #$00FF, R0                      ; 6569   02B8 00FF

        JSR     R5,     L_6704                  ; 656B   0004 0164 0304

        MVI     G_0334, R2                      ; 656E   0282 0334
        SDBD                                    ; 6570   0001
        SUBI    #$65F5, R2                      ; 6571   033A 00F5 0065
        SAR     R2,     1                       ; 6574   006A
        INCR    R2                              ; 6575   000A
        MVII    #$0023, R3                      ; 6576   02BB 0023
L_6578:
        SLL     R3,     1                       ; 6578   004B
        DECR    R2                              ; 6579   0012
        BNEQ    L_6578                          ; 657A   022C 0003

L_657C:
        PSHR    R4                              ; 657C   0274
        PSHR    R1                              ; 657D   0271
        MVI     G_0334, R4                      ; 657E   0284 0334
        MVI@    R4,     R2                      ; 6580   02A2
        MVI@    R4,     R1                      ; 6581   02A1
        PSHR    R3                              ; 6582   0273

        JSR     R5,     L_65FB                  ; 6583   0004 0164 01FB

        PULR    R3                              ; 6586   02B3
        PULR    R1                              ; 6587   02B1
        PULR    R4                              ; 6588   02B4
        DECR    R3                              ; 6589   0013
        BNEQ    L_657C                          ; 658A   022C 000F

        DECR    R1                              ; 658C   0011
        BNEQ    L_6565                          ; 658D   022C 0029

        MVI     G_0167, R0                      ; 658F   0280 0167
        INCR    R0                              ; 6591   0008
        MVO     R0,     G_0167                  ; 6592   0240 0167
        PULR    R7                              ; 6594   02B7

        MVII    #$0002, R0                      ; 6595   02B8 0002
        MVO     R0,     G_016C                  ; 6597   0240 016C
L_6599:
        MVI     G_0334, R4                      ; 6599   0284 0334
        MVI@    R4,     R0                      ; 659B   02A0
        MVI@    R4,     R1                      ; 659C   02A1
        MOVR    R1,     R4                      ; 659D   008C
        MVI     G_016C, R2                      ; 659E   0282 016C
L_65A0:
        ADDI    #$0014, R4                      ; 65A0   02FC 0014
        DECR    R2                              ; 65A2   0012
        BNEQ    L_65A0                          ; 65A3   022C 0004

        JSR     R5,     X_FILL_ZERO             ; 65A5   0004 0114 0338

        COMR    R4                              ; 65A8   001C
        SDBD                                    ; 65A9   0001
        ADDI    #$0505, R4                      ; 65AA   02FC 0005 0005

        JSR     R5,     X_FILL_ZERO             ; 65AD   0004 0114 0338

        MVII    #$0014, R3                      ; 65B0   02BB 0014
L_65B2:
        MVI     G_0334, R4                      ; 65B2   0284 0334
        MVI@    R4,     R2                      ; 65B4   02A2
        MVI@    R4,     R1                      ; 65B5   02A1
        PSHR    R3                              ; 65B6   0273

        JSR     R5,     L_65FB                  ; 65B7   0004 0164 01FB

        PULR    R3                              ; 65BA   02B3
        DECR    R3                              ; 65BB   0013
        BNEQ    L_65B2                          ; 65BC   022C 000B

        MVI     G_016C, R0                      ; 65BE   0280 016C
        INCR    R0                              ; 65C0   0008
        MVO     R0,     G_016C                  ; 65C1   0240 016C
        CMPI    #$0006, R0                      ; 65C3   0378 0006
        BNEQ    L_6599                          ; 65C5   022C 002D

        MVI     G_0167, R0                      ; 65C7   0280 0167
        INCR    R0                              ; 65C9   0008
        MVO     R0,     G_0167                  ; 65CA   0240 0167
        MVI     G_0334, R4                      ; 65CC   0284 0334
        MVI@    R4,     R1                      ; 65CE   02A1
        MVI@    R4,     R2                      ; 65CF   02A2
        ADDI    #$0078, R2                      ; 65D0   02FA 0078
        MOVR    R2,     R4                      ; 65D2   0094
L_65D3:
        MVII    #$0004, R0                      ; 65D3   02B8 0004

        JSR     R5,     X_RAND2                 ; 65D5   0004 0114 029E

        SDBD                                    ; 65D8   0001
        ADDI    #$6700, R0                      ; 65D9   02F8 0000 0067
        MOVR    R0,     R3                      ; 65DC   0083
        MVI@    R3,     R0                      ; 65DD   0298
        SLL     R0,     1                       ; 65DE   0048
        SLL     R0,     2                       ; 65DF   004C
        MVO@    R0,     R4                      ; 65E0   0260
        DECR    R1                              ; 65E1   0011
        BNEQ    L_65D3                          ; 65E2   022C 0010

        JSR     R5,     L_5233                  ; 65E4   0004 0150 0233

        PULR    R7                              ; 65E7   02B7

        MVII    #$028C, R1                      ; 65E8   02B9 028C
        MVII    #$0014, R2                      ; 65EA   02BA 0014

        JSR     R5,     L_65FB                  ; 65EC   0004 0164 01FB

        PULR    R7                              ; 65EF   02B7

        RRC     R3,     2                       ; 65F0   0077
        ADDR    R2,     R6                      ; 65F1   00D6
        ADDR    R3,     R2                      ; 65F2   00DA
        ADDR    R2,     R2                      ; 65F3   00D2
        ADDR    R3,     R1                      ; 65F4   00D9
        DECR    R0                              ; 65F5   0010
        BOV     L_6600                          ; 65F6   0202 0008
        BLE     L_65FE                          ; 65F8   0206 0004

        SKIP                                    ; 65FA   0208
L_65FB:
        PSHR    R5                              ; 65FB   0275
L_65FC:
        MOVR    R1,     R3                      ; 65FC   008B
        MOVR    R1,     R4                      ; 65FD   008C
L_65FE:
        ADDR    R2,     R3                      ; 65FE   00D3
L_65FF:
        MVI@    R4,     R0                      ; 65FF   02A0
L_6600:
        PSHR    R0                              ; 6600   0270
        SAR     R0,     2                       ; 6601   006C
        PULR    R0                              ; 6602   02B0
        BEQ     L_660F                          ; 6603   0204 000A

        ADDI    #$0008, R0                      ; 6605   02F8 0008
        ANDI    #$00FF, R0                      ; 6607   03B8 00FF
        SDBD                                    ; 6609   0001
        XORI    #$0700, R0                      ; 660A   03F8 0000 0007
        DECR    R4                              ; 660D   0014
        MVO@    R0,     R4                      ; 660E   0260
L_660F:
        CMPR    R3,     R4                      ; 660F   015C
        BLT     L_65FF                          ; 6610   0225 0012

        ADDI    #$0014, R1                      ; 6612   02F9 0014
        CMPI    #$0278, R1                      ; 6614   0379 0278
        BLT     L_65FC                          ; 6616   0225 001B

        CMPI    #$028C, R1                      ; 6618   0379 028C
        BGE     L_661E                          ; 661A   020D 0002

        ADDI    #$0014, R1                      ; 661C   02F9 0014
L_661E:
        CMPI    #$02DC, R1                      ; 661E   0379 02DC
        BLT     L_65FC                          ; 6620   0225 0025
        PULR    R7                              ; 6622   02B7

L_6623:
        PSHR    R5                              ; 6623   0275

        JSR     R5,     X_PLAY_SFX1             ; 6624   0004 0118 03BB
        DECLE   $0079                           ; 6627  SFX data
        DECLE   $03B7                           ; 6628  SFX data
        DECLE   $03ED                           ; 6629  SFX data
        DECLE   $000F,  $03FF                   ; 662A  SFX data
        DECLE   $03FC,  $03FF                   ; 662C  SFX data
        DECLE   $000B                           ; 662E  SFX data
        DECLE   $03CF                           ; 662F  SFX end


        PULR    R7                              ; 6630   02B7

L_6631:
        PSHR    R5                              ; 6631   0275
        MVII    #$0004, R0                      ; 6632   02B8 0004
        MVO     R0,     G_0106                  ; 6634   0240 0106

        JSR     R5,     .EXEC.7B3               ; 6636   0004 0114 03B3

        MVII    #$00FF, R0                      ; 6639   02B8 00FF
        MVO     R0,     G_015E                  ; 663B   0240 015E
        MVII    #$00D9, R0                      ; 663D   02B8 00D9

        JSR     R5,     L_66C9                  ; 663F   0004 0164 02C9

        MVII    #$00F0, R0                      ; 6642   02B8 00F0
        MVII    #$0200, R4                      ; 6644   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 6646   0004 0114 0338

        MVII    #$022C, R4                      ; 6649   02BC 022C
        SDBD                                    ; 664B   0001
        MVII    #$6688, R1                      ; 664C   02B9 0088 0066
        SDBD                                    ; 664F   0001
        MVII    #$6678, R2                      ; 6650   02BA 0078 0066
        CLRR    R5                              ; 6653   01ED
        MVO     R5,     G_0169                  ; 6654   0245 0169
L_6656:
        MVII    #$0003, R0                      ; 6656   02B8 0003
        DECLE   $028B,  $037B,  $0200,  $0204   ; 6658   028B 037B 0200 0204
        DECLE   $0064                           ; 665C   0064

        BLT     L_6664                          ; 665D   0205 0005

        INCR    R5                              ; 665F   000D
        SDBD                                    ; 6660   0001
        MVII    #$6680, R2                      ; 6661   02BA 0080 0066
L_6664:
        PSHR    R0                              ; 6664   0270
        PSHR    R3                              ; 6665   0273
        ANDI    #$0007, R3                      ; 6666   03BB 0007
        ADDR    R2,     R3                      ; 6668   00D3
        MVI@    R3,     R0                      ; 6669   0298
        SLL     R0,     2                       ; 666A   004C
        SLL     R0,     1                       ; 666B   0048
        XORR    R5,     R0                      ; 666C   01E8
        MVO@    R0,     R4                      ; 666D   0260
        PULR    R3                              ; 666E   02B3
        SAR     R3,     2                       ; 666F   006F
        SAR     R3,     1                       ; 6670   006B
        PULR    R0                              ; 6671   02B0
        DECR    R0                              ; 6672   0010
        BNEQ    L_6664                          ; 6673   022C 0010

        INCR    R1                              ; 6675   0009
        B       L_6656                          ; 6676   0220 0021

        DECLE   $008C,  $011A,  $0096,  $0080   ; 6678   008C 011A 0096 0080
        DECLE   $0089,  $011B,  $0000,  $005F   ; 667C   0089 011B 0000 005F
        DECLE   $008E,  $011C,  $011E,  $0082   ; 6680   008E 011C 011E 0082
        DECLE   $008B,  $011D,  $0000,  $005F   ; 6684   008B 011D 0000 005F
        DECLE   $0076,  $01B6,  $01B1,  $01B6   ; 6688   0076 01B6 01B1 01B6
        DECLE   $01B6,  $00B6,  $01B6,  $017B   ; 668C   01B6 00B6 01B6 017B
        DECLE   $01DE,  $01B6,  $01B2,  $01B6   ; 6690   01DE 01B6 01B2 01B6
        DECLE   $01BB,  $01F1,  $01BF,  $017F   ; 6694   01BB 01F1 01BF 017F
        DECLE   $01F6,  $01B6,  $01EE,  $01C7   ; 6698   01F6 01B6 01EE 01C7
        DECLE   $01FD,  $01E7,  $01FF,  $013A   ; 669C   01FD 01E7 01FF 013A
        DECLE   $0191,  $01FF,  $01FF,  $01FF   ; 66A0   0191 01FF 01FF 01FF
        DECLE   $01FF,  $01FF,  $01FF,  $01FF   ; 66A4   01FF 01FF 01FF 01FF
        DECLE   $023F,  $01EF,  $013F,  $01FF   ; 66A8   023F 01EF 013F 01FF
        DECLE   $01D7,  $008C,  $00FE,  $0077   ; 66AC   01D7 008C 00FE 0077
        DECLE   $01FE,  $01F7,  $01AF           ; 66B0   01FE 01F7 01AF

        ANDR    R7,     R6                      ; 66B3   01BE
        ANDR    R6,     R6                      ; 66B4   01B6
        MOVR    R6,     R5                      ; 66B5   00B5
        ANDR    R6,     R6                      ; 66B6   01B6
        CMPR    R7,     R3                      ; 66B7   017B
        XORR    R3,     R6                      ; 66B8   01DE
        ANDR    R6,     R6                      ; 66B9   01B6
        ANDR    R6,     R2                      ; 66BA   01B2
        ANDR    R6,     R6                      ; 66BB   01B6
        ANDR    R6,     R6                      ; 66BC   01B6
        ANDR    R6,     R6                      ; 66BD   01B6
        ANDR    R6,     R1                      ; 66BE   01B1
        ANDR    R1,     R6                      ; 66BF   018E
        B       L_697A                          ; 66C0   0200 02B8

        NEGR    R0                              ; 66C2   0020
        SWAP    R0,     1                       ; 66C3   0040
        XOR     .BTAB.8B,R0                     ; 66C4   03C0 028B
        MVO     R0,     .BTAB.8B                ; 66C6   0240 028B
        PULR    R7                              ; 66C8   02B7

L_66C9:
        PSHR    R5                              ; 66C9   0275
        MVO     R0,     G_01C6                  ; 66CA   0240 01C6
        DIS                                     ; 66CC   0003
        SDBD                                    ; 66CD   0001
        MVII    #$00E0, R0                      ; 66CE   02B8 00E0 0000
        MVO     R0,     .ISRVEC.0               ; 66D1   0240 0100
        SDBD                                    ; 66D3   0001
        MVII    #$0066, R0                      ; 66D4   02B8 0066 0000
        MVO     R0,     .ISRVEC.1               ; 66D7   0240 0101
        EIS                                     ; 66D9   0002
L_66DA:
        MVI     G_01C6, R0                      ; 66DA   0280 01C6
        TSTR    R0                              ; 66DC   0080
        BNEQ    L_66DA                          ; 66DD   022C 0004
        PULR    R7                              ; 66DF   02B7

        MVI     .STIC.MODE,R0                   ; 66E0   0280 0021
        MVI     G_01C6, R0                      ; 66E2   0280 01C6
        MVO     R0,     .STIC.CS.0              ; 66E4   0240 0028
        SAR     R0,     2                       ; 66E6   006C
        SAR     R0,     2                       ; 66E7   006C
        MVO     R0,     .STIC.CS.1              ; 66E8   0240 0029
        CLRR    R0                              ; 66EA   01C0
        MVO     R0,     G_01C6                  ; 66EB   0240 01C6
        INCR    R0                              ; 66ED   0008
        MVO     R0,     .STIC.EDGE              ; 66EE   0240 0032
        MVII    #$0004, R0                      ; 66F0   02B8 0004
        MVO     R0,     .STIC.BORD              ; 66F2   0240 002C
L_66F4:
        MVI     G_0163, R0                      ; 66F4   0280 0163
        MVO     R0,     .ISRVEC.0               ; 66F6   0240 0100
        MVI     G_0164, R0                      ; 66F8   0280 0164
        MVO     R0,     .ISRVEC.1               ; 66FA   0240 0101
L_66FC:
        MVII    #$0163, R4                      ; 66FC   02BC 0163
        SDBD                                    ; 66FE   0001
        MVI@    R4,     R7                      ; 66FF   02A7

        MOVR    R2,     R6                      ; 6700   0096
        MOVR    R3,     R0                      ; 6701   0098
        MOVR    R3,     R2                      ; 6702   009A
        TSTR    R3                              ; 6703   009B
L_6704:
        PSHR    R5                              ; 6704   0275
        MVO     R0,     G_01C4                  ; 6705   0240 01C4
        SARC    R0,     1                       ; 6707   0078
        MVII    #$0004, R0                      ; 6708   02B8 0004
        BNC     L_670E                          ; 670A   0209 0002

        MVII    #$0008, R0                      ; 670C   02B8 0008
L_670E:
        MVO     R0,     G_01C5                  ; 670E   0240 01C5
        DIS                                     ; 6710   0003
        SDBD                                    ; 6711   0001
        MVII    #$001F, R0                      ; 6712   02B8 001F 0000
        MVO     R0,     .ISRVEC.0               ; 6715   0240 0100
        SDBD                                    ; 6717   0001
        MVII    #$0067, R0                      ; 6718   02B8 0067 0000
        MVO     R0,     .ISRVEC.1               ; 671B   0240 0101
        EIS                                     ; 671D   0002
        PULR    R7                              ; 671E   02B7

        MVI     G_01C4, R0                      ; 671F   0280 01C4
        SUBI    #$0003, R0                      ; 6721   0338 0003
        MVO     R0,     G_01C4                  ; 6723   0240 01C4
        TSTR    R0                              ; 6725   0080
        BMI     L_66F4                          ; 6726   022B 0033

        MVI     G_01C5, R3                      ; 6728   0283 01C5
        CMPI    #$0004, R3                      ; 672A   037B 0004
        BNEQ    L_672F                          ; 672C   020C 0001

        SAR     R0,     1                       ; 672E   0068
L_672F:
        SAR     R0,     1                       ; 672F   0068
        MOVR    R0,     R1                      ; 6730   0081
        AND     G_01C5, R1                      ; 6731   0381 01C5
        BEQ     L_6736                          ; 6733   0204 0001

        COMR    R0                              ; 6735   0018
L_6736:
        MVO     R0,     .STIC.HDLY              ; 6736   0240 0030
        B       L_66FC                          ; 6738   0220 003D

L_673A:
        PSHR    R5                              ; 673A   0275
        DIS                                     ; 673B   0003
        MVII    #$01CC, R4                      ; 673C   02BC 01CC
        MVII    #$000E, R0                      ; 673E   02B8 000E

        JSR     R5,     X_FILL_ZERO             ; 6740   0004 0114 0338

        MVII    #$0004, R0                      ; 6743   02B8 0004
        SWAP    R0,     1                       ; 6745   0040
        MVO     R0,     .IV.FIFO                ; 6746   0240 0081
        SDBD                                    ; 6748   0001
        MVII    #$0056, R0                      ; 6749   02B8 0056 0000
        MVO     R0,     .ISRVEC.0               ; 674C   0240 0100
        SDBD                                    ; 674E   0001
        MVII    #$0067, R0                      ; 674F   02B8 0067 0000
        MVO     R0,     .ISRVEC.1               ; 6752   0240 0101
        EIS                                     ; 6754   0002
        PULR    R7                              ; 6755   02B7

        DIS                                     ; 6756   0003

        JSR     R5,     X_DEF_ISR               ; 6757   0004 0110 0126
        JSR     R5,     L_6815                  ; 675A   0004 0168 0015

        TSTR    R0                              ; 675D   0080
        BNEQ    L_6808                          ; 675E   020C 00A8

        MVII    #$0021, R1                      ; 6760   02B9 0021
L_6762:
        MVI     G_01CC, R0                      ; 6762   0280 01CC
        MOVR    R0,     R3                      ; 6764   0083
        ANDI    #$0040, R0                      ; 6765   03B8 0040
        BEQ     L_67F8                          ; 6767   0204 008F

        SLR     R3,     1                       ; 6769   0063
        ANDI    #$0006, R3                      ; 676A   03BB 0006
        MVII    #$01D1, R4                      ; 676C   02BC 01D1
        ADDR    R3,     R4                      ; 676E   00DC
        MVII    #$01CD, R5                      ; 676F   02BD 01CD
        SDBD                                    ; 6771   0001
        MVI@    R5,     R2                      ; 6772   02AA
        TSTR    R2                              ; 6773   0092
        BNEQ    L_6798                          ; 6774   020C 0022

        SDBD                                    ; 6776   0001
        MVI@    R4,     R5                      ; 6777   02A5
        SDBD                                    ; 6778   0001
        MVI@    R5,     R0                      ; 6779   02A8
        SUBI    #$0002, R4                      ; 677A   033C 0002
        CMPI    #$0100, R0                      ; 677C   0378 0100
        BC      L_6798                          ; 677E   0201 0018

        TSTR    R0                              ; 6780   0080
        BNEQ    L_6788                          ; 6781   020C 0005

        JSR     R5,     L_67B5                  ; 6783   0004 0164 03B5

        B       L_6762                          ; 6786   0220 0025

L_6788:
        JSR     R5,     L_67D6                  ; 6788   0004 0164 03D6

        BC      L_67F8                          ; 678B   0201 006B

        PSHR    R1                              ; 678D   0271
        MVII    #$0001, R1                      ; 678E   02B9 0001

L_6790:
        JSR     R5,     L_681A                  ; 6790   0004 0168 001A

        PULR    R1                              ; 6793   02B1
        BC      L_67F8                          ; 6794   0201 0062
        B       L_6762                          ; 6796   0220 0035

L_6798:
        PSHR    R4                              ; 6798   0274
        MVII    #$01CD, R4                      ; 6799   02BC 01CD
        SDBD                                    ; 679B   0001
        MVI@    R4,     R2                      ; 679C   02A2
        SDBD                                    ; 679D   0001
        MVI@    R4,     R5                      ; 679E   02A5
        PULR    R4                              ; 679F   02B4
L_67A0:
        TSTR    R2                              ; 67A0   0092
        BNEQ    L_67A7                          ; 67A1   020C 0004

        PSHR    R1                              ; 67A3   0271
        CLRR    R1                              ; 67A4   01C9
        B       L_6790                          ; 67A5   0220 0016

L_67A7:
        MVI     .IV.FIFO,R0                     ; 67A7   0280 0081
        TSTR    R0                              ; 67A9   0080
        BMI     L_67EF                          ; 67AA   020B 0043

        DECR    R1                              ; 67AC   0011
        BEQ     L_67EF                          ; 67AD   0204 0040

        MVI@    R5,     R0                      ; 67AF   02A8
        MVO     R0,     .IV.FIFO                ; 67B0   0240 0081
        DECR    R2                              ; 67B2   0012
        B       L_67A0                          ; 67B3   0220 0014

L_67B5:
        PSHR    R5                              ; 67B5   0275
L_67B6:
        CLRR    R0                              ; 67B6   01C0
        MVO     R0,     G_01CD                  ; 67B7   0240 01CD
        MVO     R0,     G_01CE                  ; 67B9   0240 01CE
        MVI     G_01CC, R0                      ; 67BB   0280 01CC
        PSHR    R0                              ; 67BD   0270
        ADDI    #$0004, R0                      ; 67BE   02F8 0004
        ANDI    #$000C, R0                      ; 67C0   03B8 000C
        PULR    R3                              ; 67C2   02B3
        ANDI    #$0063, R3                      ; 67C3   03BB 0063
        ADDR    R0,     R3                      ; 67C5   00C3
        MVO     R3,     G_01CC                  ; 67C6   0243 01CC
        SLR     R0,     2                       ; 67C8   0064
        ANDI    #$0003, R3                      ; 67C9   03BB 0003
        CMPR    R0,     R3                      ; 67CB   0143
        BNEQ    L_6860                          ; 67CC   020C 0092

        MVI     G_01CC, R0                      ; 67CE   0280 01CC
        ANDI    #$00AF, R0                      ; 67D0   03B8 00AF
        MVO     R0,     G_01CC                  ; 67D2   0240 01CC
        SETC                                    ; 67D4   0007
        PULR    R7                              ; 67D5   02B7

L_67D6:
        PSHR    R1                              ; 67D6   0271
        MVI     G_01D9, R1                      ; 67D7   0281 01D9
        TSTR    R1                              ; 67D9   0089
        BEQ     L_67DF                          ; 67DA   0204 0003

L_67DC:
        SETC                                    ; 67DC   0007
        PULR    R1                              ; 67DD   02B1
        MOVR    R5,     R7                      ; 67DE   00AF

L_67DF:
        MVI     .IV.ALD,R1                      ; 67DF   0281 0080
        TSTR    R1                              ; 67E1   0089
        BPL     L_67DC                          ; 67E2   0223 0007

        MVO     R0,     .IV.ALD                 ; 67E4   0240 0080
        CLRC                                    ; 67E6   0006
        MVI     G_01CC, R0                      ; 67E7   0280 01CC
        ANDI    #$00EF, R0                      ; 67E9   03B8 00EF
        MVO     R0,     G_01CC                  ; 67EB   0240 01CC
        PULR    R1                              ; 67ED   02B1
        MOVR    R5,     R7                      ; 67EE   00AF

L_67EF:
        MVII    #$01CD, R4                      ; 67EF   02BC 01CD
        MVO@    R2,     R4                      ; 67F1   0262
        SWAP    R2,     1                       ; 67F2   0042
        MVO@    R2,     R4                      ; 67F3   0262
        MOVR    R5,     R0                      ; 67F4   00A8
        MVO@    R0,     R4                      ; 67F5   0260
        SWAP    R0,     1                       ; 67F6   0040
        MVO@    R0,     R4                      ; 67F7   0260
L_67F8:
        MVI     .IV.ALD,R0                      ; 67F8   0280 0080
        TSTR    R0                              ; 67FA   0080
        BPL     L_6808                          ; 67FB   0203 000B

        MVI     G_01D9, R3                      ; 67FD   0283 01D9
        TSTR    R3                              ; 67FF   009B
        BEQ     L_6808                          ; 6800   0204 0006

        CLRR    R0                              ; 6802   01C0
        MVO     R0,     .IV.ALD                 ; 6803   0240 0080
        DECR    R3                              ; 6805   0013
        MVO     R3,     G_01D9                  ; 6806   0243 01D9

L_6808:
        JSR     R5,     L_5195                  ; 6808   0004 0150 0195

        PULR    R5                              ; 680B   02B5
        PULR    R4                              ; 680C   02B4
        PULR    R3                              ; 680D   02B3
        PULR    R2                              ; 680E   02B2
        PULR    R1                              ; 680F   02B1
        PULR    R0                              ; 6810   02B0
        RSWD    R0                              ; 6811   0038
        PULR    R0                              ; 6812   02B0
        EIS                                     ; 6813   0002
        PULR    R7                              ; 6814   02B7

L_6815:
        MVI     .IV.FIFO,R0                     ; 6815   0280 0081
        ANDI    #$0200, R0                      ; 6817   03B8 0200
        MOVR    R5,     R7                      ; 6819   00AF

L_681A:
        PSHR    R5                              ; 681A   0275
        SDBD                                    ; 681B   0001
        MVI@    R4,     R5                      ; 681C   02A5
        SDBD                                    ; 681D   0001
        MVI@    R5,     R0                      ; 681E   02A8
        SUBI    #$0002, R4                      ; 681F   033C 0002
        TSTR    R0                              ; 6821   0080
        BEQ     L_67B6                          ; 6822   0224 006D

        CMPI    #$0100, R0                      ; 6824   0378 0100
        BC      L_6832                          ; 6826   0201 000A

        PSHR    R0                              ; 6828   0270
        CLRR    R0                              ; 6829   01C0
        MVO     R0,     G_01CD                  ; 682A   0240 01CD
        MVO     R0,     G_01CE                  ; 682C   0240 01CE
        PULR    R0                              ; 682E   02B0
        TSTR    R1                              ; 682F   0089
        BEQ     L_6860                          ; 6830   0204 002E

L_6832:
        PSHR    R0                              ; 6832   0270
        MOVR    R5,     R0                      ; 6833   00A8
        MVO@    R0,     R4                      ; 6834   0260
        SWAP    R0,     1                       ; 6835   0040
        MVO@    R0,     R4                      ; 6836   0260
        SUBI    #$0002, R4                      ; 6837   033C 0002
        SUBI    #$0002, R5                      ; 6839   033D 0002
        PULR    R0                              ; 683B   02B0
        CMPI    #$0100, R0                      ; 683C   0378 0100
        BNC     L_6860                          ; 683E   0209 0020

        SDBD                                    ; 6840   0001
        MVI@    R5,     R0                      ; 6841   02A8
        MOVR    R0,     R5                      ; 6842   0085
        MVI@    R5,     R0                      ; 6843   02A8
        MVO     R0,     G_01CD                  ; 6844   0240 01CD
        SWAP    R0,     1                       ; 6846   0040
        MVO     R0,     G_01CE                  ; 6847   0240 01CE
        MOVR    R5,     R0                      ; 6849   00A8
        MVO     R0,     G_01CF                  ; 684A   0240 01CF
        SWAP    R0,     1                       ; 684C   0040
        MVO     R0,     G_01D0                  ; 684D   0240 01D0
        MVI     G_01CC, R0                      ; 684F   0280 01CC
        ANDI    #$0010, R0                      ; 6851   03B8 0010
        BNEQ    L_6860                          ; 6853   020C 000B

        MVI     G_01D9, R0                      ; 6855   0280 01D9
        INCR    R0                              ; 6857   0008
        MVO     R0,     G_01D9                  ; 6858   0240 01D9
        MVI     G_01CC, R0                      ; 685A   0280 01CC
        ADDI    #$0010, R0                      ; 685C   02F8 0010
        MVO     R0,     G_01CC                  ; 685E   0240 01CC
L_6860:
        CLRC                                    ; 6860   0006
        PULR    R7                              ; 6861   02B7

L_6862:
        DIS                                     ; 6862   0003
        PSHR    R5                              ; 6863   0275
        PSHR    R0                              ; 6864   0270
        PSHR    R1                              ; 6865   0271
        MVI     G_01CC, R1                      ; 6866   0281 01CC
        PSHR    R2                              ; 6868   0272
        PSHR    R3                              ; 6869   0273
        PSHR    R4                              ; 686A   0274

        JSR     R5,     L_6815                  ; 686B   0004 0168 0015

        TSTR    R0                              ; 686E   0080
        BNEQ    L_689B                          ; 686F   020C 002A

        MOVR    R1,     R2                      ; 6871   008A
        ANDI    #$0080, R2                      ; 6872   03BA 0080
        SETC                                    ; 6874   0007
        BNEQ    L_689C                          ; 6875   020C 0025

        MOVR    R1,     R2                      ; 6877   008A
        ANDI    #$0003, R2                      ; 6878   03BA 0003
        SDBD                                    ; 687A   0001
        MVII    #$01D1, R4                      ; 687B   02BC 00D1 0001
        ADDR    R2,     R4                      ; 687E   00D4
        ADDR    R2,     R4                      ; 687F   00D4
        MVO@    R3,     R4                      ; 6880   0263
        SWAP    R3,     1                       ; 6881   0043
        MVO@    R3,     R4                      ; 6882   0263
        INCR    R2                              ; 6883   000A
        ANDI    #$0003, R2                      ; 6884   03BA 0003
        MOVR    R1,     R0                      ; 6886   0088
        ANDI    #$000C, R0                      ; 6887   03B8 000C
        SLR     R0,     2                       ; 6889   0064
        CMPR    R0,     R2                      ; 688A   0142
        BNEQ    L_6891                          ; 688B   020C 0004

        ANDI    #$007F, R1                      ; 688D   03B9 007F
        XORI    #$0080, R1                      ; 688F   03F9 0080
L_6891:
        ANDI    #$00BC, R1                      ; 6891   03B9 00BC
        XORI    #$0040, R1                      ; 6893   03F9 0040
        MOVR    R2,     R4                      ; 6895   0094
        COMR    R4                              ; 6896   001C
        ANDR    R4,     R1                      ; 6897   01A1
        XORR    R2,     R1                      ; 6898   01D1
        MVO     R1,     G_01CC                  ; 6899   0241 01CC
L_689B:
        CLRC                                    ; 689B   0006
L_689C:
        PULR    R4                              ; 689C   02B4
        PULR    R3                              ; 689D   02B3
        PULR    R2                              ; 689E   02B2
        PULR    R1                              ; 689F   02B1
        PULR    R0                              ; 68A0   02B0
        EIS                                     ; 68A1   0002
        PULR    R7                              ; 68A2   02B7

L_68A3:
        MVI     G_01A2, R1                      ; 68A3   0281 01A2
        TSTR    R1                              ; 68A5   0089
        BNEQ    L_68AE                          ; 68A6   020C 0006

        MVI     G_01CC, R1                      ; 68A8   0281 01CC
        ANDI    #$0040, R1                      ; 68AA   03B9 0040
        BEQ     L_68AF                          ; 68AC   0204 0001
L_68AE:
        MOVR    R5,     R7                      ; 68AE   00AF

L_68AF:
        PSHR    R5                              ; 68AF   0275
        ADDR    R7,     R0                      ; 68B0   00F8
        MOVR    R0,     R3                      ; 68B1   0083

        JSR     R5,     L_6862                  ; 68B2   0004 0168 0062

        PULR    R7                              ; 68B5   02B7

        DECLE   $0006,  $0000,  $0002,  $0000   ; 68B6   0006 0000 0002 0000
        DECLE   $00F9,  $00D9,  $00D2,  $006B   ; 68BA   00F9 00D9 00D2 006B
        DECLE   $0000,  $0000,  $00F0,  $006F   ; 68BE   0000 0000 00F0 006F
        DECLE   $00E2,  $00DA,  $004E,  $00DB   ; 68C2   00E2 00DA 004E 00DB
        DECLE   $00D2,  $006B,  $0000,  $0000   ; 68C6   00D2 006B 0000 0000
        DECLE   $0008,  $006F,  $00D2,  $006B   ; 68CA   0008 006F 00D2 006B
        DECLE   $0000,  $0000,  $00D5,  $006B   ; 68CE   0000 0000 00D5 006B
        DECLE   $00D5,  $006B,  $0065,  $006F   ; 68D2   00D5 006B 0065 006F
        DECLE   $00D5,  $006B,  $00D2,  $006B   ; 68D6   00D5 006B 00D2 006B
        DECLE   $0000,  $0000,  $00F2,  $00DB   ; 68DA   0000 0000 00F2 00DB
        DECLE   $00D2,  $006B,  $0000,  $0000   ; 68DE   00D2 006B 0000 0000
        DECLE   $00CE,  $00D5,  $00D2,  $006B   ; 68E2   00CE 00D5 00D2 006B
        DECLE   $0000,  $0000,  $0040,  $006C   ; 68E6   0000 0000 0040 006C
        DECLE   $00D2,  $006B,  $0000,  $0000   ; 68EA   00D2 006B 0000 0000
        DECLE   $0034,  $00D1,  $00D2,  $006B   ; 68EE   0034 00D1 00D2 006B
        DECLE   $0000,  $0000,  $0049,  $00D0   ; 68F2   0000 0000 0049 00D0
        DECLE   $0036,  $006D,  $0082,  $00DC   ; 68F6   0036 006D 0082 00DC
        DECLE   $00F0,  $006F,  $00D2,  $006B   ; 68FA   00F0 006F 00D2 006B
        DECLE   $0000,  $0000,  $0078,  $00D5   ; 68FE   0000 0000 0078 00D5
        DECLE   $0036,  $006D,  $00F0,  $006F   ; 6902   0036 006D 00F0 006F
        DECLE   $00D2,  $006B,  $0000,  $0000   ; 6906   00D2 006B 0000 0000
        DECLE   $0084,  $00D6,  $00F0,  $006F   ; 690A   0084 00D6 00F0 006F
        DECLE   $0084,  $00D6,  $00F4,  $006F   ; 690E   0084 00D6 00F4 006F
        DECLE   $00F7,  $00D3,  $00D2,  $006B   ; 6912   00F7 00D3 00D2 006B
        DECLE   $0000,  $0000,  $0022,  $00DD   ; 6916   0000 0000 0022 00DD
        DECLE   $00D2,  $006B,  $0000,  $0000   ; 691A   00D2 006B 0000 0000
        DECLE   $003F,  $00D7,  $00F0,  $006F   ; 691E   003F 00D7 00F0 006F
        DECLE   $00D2,  $006B,  $0000,  $0000   ; 6922   00D2 006B 0000 0000
        DECLE   $002D,  $00D9,  $00D2,  $006B   ; 6926   002D 00D9 00D2 006B
        DECLE   $0000,  $0000,  $0076,  $00DE   ; 692A   0000 0000 0076 00DE
        DECLE   $00F0,  $006F,  $00D2,  $006B   ; 692E   00F0 006F 00D2 006B
        DECLE   $0000,  $0000,  $0036,  $006D   ; 6932   0000 0000 0036 006D
        DECLE   $00F0,  $006F,  $00D2,  $006B   ; 6936   00F0 006F 00D2 006B
        DECLE   $0000,  $0000,  $00B5,  $00D2   ; 693A   0000 0000 00B5 00D2
        DECLE   $00EC,  $006F,  $00D0,  $00D8   ; 693E   00EC 006F 00D0 00D8
        DECLE   $00D2,  $006B,  $0000,  $0000   ; 6942   00D2 006B 0000 0000
        DECLE   $00D8,  $00D2,  $00EC,  $006F   ; 6946   00D8 00D2 00EC 006F
        DECLE   $00D0,  $00D8,  $00D2,  $006B   ; 694A   00D0 00D8 00D2 006B
        DECLE   $0000,  $0000,  $003A,  $00D3   ; 694E   0000 0000 003A 00D3
        DECLE   $00EC,  $006F,  $00D0,  $00D8   ; 6952   00EC 006F 00D0 00D8
        DECLE   $00D2,  $006B,  $0000,  $0000   ; 6956   00D2 006B 0000 0000
        DECLE   $00A9,  $00D3,  $00EC,  $006F   ; 695A   00A9 00D3 00EC 006F
        DECLE   $00D0,  $00D8,  $00D2,  $006B   ; 695E   00D0 00D8 00D2 006B
        DECLE   $0000,  $0000,  $00E8,  $00D1   ; 6962   0000 0000 00E8 00D1
        DECLE   $006C,  $00D2,  $00D2,  $006B   ; 6966   006C 00D2 00D2 006B
        DECLE   $0000,  $0000,  $0084,  $00D6   ; 696A   0000 0000 0084 00D6
        DECLE   $00D2,  $006B,  $0000,  $0000   ; 696E   00D2 006B 0000 0000

        ADDR    R5,     R0                      ; 6972   00E8
        ADDR    R2,     R1                      ; 6973   00D1
        MOVR    R6,     R5                      ; 6974   00B5
        ADDR    R3,     R4                      ; 6975   00DC
        ADDR    R6,     R0                      ; 6976   00F0
        SAR     R3,     2                       ; 6977   006F
        SARC    R1,     1                       ; 6978   0079
        ADDR    R2,     R0                      ; 6979   00D0
L_697A:
        ADDR    R2,     R2                      ; 697A   00D2
        DECLE   $006B,  $0000,  $0000           ; 697B   006B 0000 0000
L_697E:
        PSHR    R5                              ; 697E   0275
        SDBD                                    ; 697F   0001
        MVII    #$6999, R4                      ; 6980   02BC 0099 0069
        MVII    #$0002, R0                      ; 6983   02B8 0002
        B       L_698E                          ; 6985   0200 0007

L_6987:
        PSHR    R5                              ; 6987   0275
        SDBD                                    ; 6988   0001
        MVII    #$699D, R4                      ; 6989   02BC 009D 0069
        MVII    #$0004, R0                      ; 698C   02B8 0004

L_698E:
        JSR     R5,     X_RAND2                 ; 698E   0004 0114 029E

        SLL     R0,     1                       ; 6991   0048
        ADDR    R0,     R4                      ; 6992   00C4
        SDBD                                    ; 6993   0001
        MVI@    R4,     R3                      ; 6994   02A3

        JSR     R5,     L_6862                  ; 6995   0004 0168 0062

        PULR    R7                              ; 6998   02B7

        ADDR    R4,     R2                      ; 6999   00E2
        SAR     R0,     1                       ; 699A   0068
        SAR     R0,     2                       ; 699B   006C
        SAR     R1,     1                       ; 699C   0069
        COMR    R6                              ; 699D   001E
        SAR     R1,     1                       ; 699E   0069
        ADCR    R4                              ; 699F   002C
        SAR     R1,     1                       ; 69A0   0069
        NEGR    R6                              ; 69A1   0026
        SAR     R1,     1                       ; 69A2   0069
        COMR    R0                              ; 69A3   0018
        SAR     R1,     1                       ; 69A4   0069
L_69A5:
        PSHR    R5                              ; 69A5   0275
        MVII    #$01DA, R4                      ; 69A6   02BC 01DA
        MOVR    R4,     R3                      ; 69A8   00A3
        ADDI    #$0007, R0                      ; 69A9   02F8 0007
        MVO@    R0,     R4                      ; 69AB   0260
        CLRR    R0                              ; 69AC   01C0
        MVO@    R0,     R4                      ; 69AD   0260
        MVO@    R0,     R4                      ; 69AE   0260
        MVO@    R0,     R4                      ; 69AF   0260

        JSR     R5,     L_6862                  ; 69B0   0004 0168 0062

        PULR    R7                              ; 69B3   02B7

L_69B4:
        PSHR    R5                              ; 69B4   0275
        MVI     G_01A2, R0                      ; 69B5   0280 01A2
        TSTR    R0                              ; 69B7   0080
        BNEQ    L_69D8                          ; 69B8   020C 001E

        MVI     G_0160, R0                      ; 69BA   0280 0160
        CLRR    R2                              ; 69BC   01D2
        MVII    #$01DE, R4                      ; 69BD   02BC 01DE
        MOVR    R4,     R3                      ; 69BF   00A3
        CMPI    #$0014, R0                      ; 69C0   0378 0014
        BLE     L_69CA                          ; 69C2   0206 0006

        MVII    #$001B, R1                      ; 69C4   02B9 001B
        MVO@    R1,     R4                      ; 69C6   0261
        MVO@    R2,     R4                      ; 69C7   0262
        SUBI    #$0014, R0                      ; 69C8   0338 0014
L_69CA:
        ADDI    #$0007, R0                      ; 69CA   02F8 0007
        MVO@    R0,     R4                      ; 69CC   0260
        MVO@    R2,     R4                      ; 69CD   0262
        MVO@    R2,     R4                      ; 69CE   0262
        MVO@    R2,     R4                      ; 69CF   0262

        JSR     R5,     L_6862                  ; 69D0   0004 0168 0062

        MVII    #$000F, R0                      ; 69D3   02B8 000F

        JSR     R5,     L_68AF                  ; 69D5   0004 0168 00AF

L_69D8:
        PULR    R7                              ; 69D8   02B7

L_69D9:
        PSHR    R5                              ; 69D9   0275
        MVII    #$0196, R4                      ; 69DA   02BC 0196
        SDBD                                    ; 69DC   0001
        MVI@    R4,     R3                      ; 69DD   02A3
        SUBI    #$032D, R3                      ; 69DE   033B 032D
        SAR     R3,     1                       ; 69E0   006B
        MOVR    R3,     R2                      ; 69E1   009A
        SAR     R3,     1                       ; 69E2   006B
        ADDR    R2,     R3                      ; 69E3   00D3
        SDBD                                    ; 69E4   0001
        ADDI    #$69EC, R3                      ; 69E5   02FB 00EC 0069

        JSR     R5,     L_6862                  ; 69E8   0004 0168 0062

        PULR    R7                              ; 69EB   02B7

        DECLE   $006F,  $006D,  $00D2,  $006B   ; 69EC   006F 006D 00D2 006B
        DECLE   $0000,  $0000,  $009C,  $006E   ; 69F0   0000 0000 009C 006E
        DECLE   $00D2,  $006B,  $0000,  $0000   ; 69F4   00D2 006B 0000 0000
        DECLE   $00D3,  $006D,  $00D2,  $006B   ; 69F8   00D3 006D 00D2 006B
        DECLE   $0000,  $0000,  $0039,  $006E   ; 69FC   0000 0000 0039 006E
        DECLE   $00D2,  $006B,  $0000,  $0000   ; 6A00   00D2 006B 0000 0000
        DECLE   $0000,  $00D0,  $00D2,  $006B   ; 6A04   0000 00D0 00D2 006B
        DECLE   $0000,  $0000                   ; 6A08   0000 0000
L_6A0A:
        PSHR    R5                              ; 6A0A   0275
        SLL     R3,     1                       ; 6A0B   004B
        MOVR    R3,     R0                      ; 6A0C   0098
        SLL     R3,     2                       ; 6A0D   004F
        ADDR    R3,     R0                      ; 6A0E   00D8
        ADDI    #$008B, R0                      ; 6A0F   02F8 008B

        JSR     R5,     L_68A3                  ; 6A11   0004 0168 00A3

        PULR    R7                              ; 6A14   02B7

L_6A15:
        PSHR    R5                              ; 6A15   0275
        MVI     G_01C7, R0                      ; 6A16   0280 01C7
        ANDI    #$0080, R0                      ; 6A18   03B8 0080
        BEQ     L_6A30                          ; 6A1A   0204 0014

        MVII    #$0004, R3                      ; 6A1C   02BB 0004
        MVII    #$0321, R1                      ; 6A1E   02B9 0321
L_6A20:
        MVI@    R1,     R0                      ; 6A20   0288
        ADDI    #$0004, R0                      ; 6A21   02F8 0004
        MVO@    R0,     R1                      ; 6A23   0248
        ADDI    #$0008, R1                      ; 6A24   02F9 0008
        MVI@    R1,     R0                      ; 6A26   0288
        SUBI    #$0004, R0                      ; 6A27   0338 0004
        MVO@    R0,     R1                      ; 6A29   0248
        ADDI    #$0008, R1                      ; 6A2A   02F9 0008
        DECR    R3                              ; 6A2C   0013
        BNEQ    L_6A20                          ; 6A2D   022C 000E
        PULR    R7                              ; 6A2F   02B7

L_6A30:
        PULR    R5                              ; 6A30   02B5

        JSR     R4,     X_SFX_OK                ; 6A31   0004 001C 02AD

        PSHR    R5                              ; 6A34   0275
        MVII    #$0050, R0                      ; 6A35   02B8 0050
        MVI     G_0165, R1                      ; 6A37   0281 0165
        CMPI    #$0003, R1                      ; 6A39   0379 0003
        BNEQ    L_6A3F                          ; 6A3B   020C 0002

        MVII    #$00F0, R0                      ; 6A3D   02B8 00F0

L_6A3F:
        JSR     R5,     X_RAND2                 ; 6A3F   0004 0114 029E

        TSTR    R0                              ; 6A42   0080
        BNEQ    L_6A48                          ; 6A43   020C 0003

        JSR     R5,     L_6AA4                  ; 6A45   0004 0168 02A4

L_6A48:
        PULR    R7                              ; 6A48   02B7

L_6A49:
        PSHR    R5                              ; 6A49   0275
        MVI     G_01E5, R2                      ; 6A4A   0282 01E5
        DECR    R2                              ; 6A4C   0012
        BMI     L_6A57                          ; 6A4D   020B 0008

        MVO     R2,     G_01E5                  ; 6A4F   0242 01E5
        MVI     G_01E4, R2                      ; 6A51   0282 01E4
        INCR    R2                              ; 6A53   000A
        MVO     R2,     G_01E4                  ; 6A54   0242 01E4
        PULR    R7                              ; 6A56   02B7

L_6A57:
        CLRR    R0                              ; 6A57   01C0
        MVO     R0,     .PSG0.chn_c_vol         ; 6A58   0240 01FD
        MVI     G_01E4, R2                      ; 6A5A   0282 01E4
        PSHR    R2                              ; 6A5C   0272
        ANDI    #$0003, R2                      ; 6A5D   03BA 0003
        PULR    R1                              ; 6A5F   02B1
        PSHR    R1                              ; 6A60   0271
        ANDI    #$00C0, R1                      ; 6A61   03B9 00C0
        SLR     R1,     2                       ; 6A63   0065
        SLR     R1,     2                       ; 6A64   0065
        ADDR    R2,     R1                      ; 6A65   00D1
        SDBD                                    ; 6A66   0001
        ADDI    #$6A94, R1                      ; 6A67   02F9 0094 006A
        MVI@    R1,     R2                      ; 6A6A   028A
        PULR    R1                              ; 6A6B   02B1
        INCR    R1                              ; 6A6C   0009
        MVII    #$0024, R3                      ; 6A6D   02BB 0024
        MVO     R1,     G_01E4                  ; 6A6F   0241 01E4
        ANDI    #$0003, R1                      ; 6A71   03B9 0003
        BNEQ    L_6A77                          ; 6A73   020C 0002

        MVII    #$0034, R3                      ; 6A75   02BB 0034
L_6A77:
        PSHR    R3                              ; 6A77   0273
        MVII    #$0036, R3                      ; 6A78   02BB 0036
        COMR    R3                              ; 6A7A   001B
        AND     .PSG0.chan_enable,R3            ; 6A7B   0383 01F8
        PULR    R0                              ; 6A7D   02B0
        XORR    R0,     R3                      ; 6A7E   01C3
        MVO     R2,     .PSG0.chn_b_lo          ; 6A7F   0242 01F1
        SWAP    R2,     1                       ; 6A81   0042
        MVO     R2,     .PSG0.chn_b_hi          ; 6A82   0242 01F5
        MVII    #$0004, R0                      ; 6A84   02B8 0004
        MVO     R0,     .PSG0.envlp_hi          ; 6A86   0240 01F7
        MVII    #$0030, R0                      ; 6A88   02B8 0030
        MVO     R3,     .PSG0.chan_enable       ; 6A8A   0243 01F8
        MVO     R0,     .PSG0.chn_b_vol         ; 6A8C   0240 01FC
L_6A8E:
        CLRR    R1                              ; 6A8E   01C9
        MVO     R1,     .PSG0.envlp_lo          ; 6A8F   0241 01F3
        MVO     R1,     .PSG0.envelope          ; 6A91   0241 01FA
        PULR    R7                              ; 6A93   02B7

        DECLE   $01FC,  $011D,  $017D,  $00FE   ; 6A94   01FC 011D 017D 00FE
        DECLE   $023B                           ; 6A98   023B

        CMPR    R5,     R0                      ; 6A99   0168
        XORR    R7,     R4                      ; 6A9A   01FC
        CMPR    R0,     R0                      ; 6A9B   0140
        ADDI    #$01AC, R2                      ; 6A9C   02FA 01AC
        MVI     G_017D, R1                      ; 6A9E   0281 017D
        MVI@    R4,     R7                      ; 6AA0   02A7

        CMPR    R7,     R5                      ; 6AA1   017D
        XORR    R7,     R4                      ; 6AA2   01FC
        CMPR    R2,     R3                      ; 6AA3   0153
L_6AA4:
        PSHR    R5                              ; 6AA4   0275

        JSR     R5,     X_PLAY_SFX1             ; 6AA5   0004 0118 03BB
        DECLE   $032F                           ; 6AA8  SFX data
        DECLE   $0089                           ; 6AA9  SFX data
        DECLE   $0015                           ; 6AAA  SFX data
        DECLE   $0180,  $0100                   ; 6AAB  SFX data
        DECLE   $0001,  $0000                   ; 6AAD  SFX data
        DECLE   $0012                           ; 6AAF  SFX data
        DECLE   $029D                           ; 6AB0  SFX data
        DECLE   $0077,  $00E2,  $006A           ; 6AB1  SFX data
        DECLE   $0143,  $03EC                   ; 6AB4  SFX data
        DECLE   $01CF                           ; 6AB6  SFX end


        PULR    R5                              ; 6AB7   02B5
L_6AB8:
        PSHR    R5                              ; 6AB8   0275
        MVI     G_0165, R0                      ; 6AB9   0280 0165
        CMPI    #$0003, R0                      ; 6ABB   0378 0003
        BNEQ    L_6AC4                          ; 6ABD   020C 0005

        MVII    #$00FE, R0                      ; 6ABF   02B8 00FE

        JSR     R5,     L_6704                  ; 6AC1   0004 0164 0304
L_6AC4:
        JSR     R5,     X_PLAY_SFX1             ; 6AC4   0004 0118 03BB
        DECLE   $032F                           ; 6AC7  SFX data
        DECLE   $0300,  $0180                   ; 6AC8  SFX data
        DECLE   $0012                           ; 6ACA  SFX data
        DECLE   $0077,  $00E2,  $006A           ; 6ACB  SFX data
        DECLE   $026B                           ; 6ACE  SFX data
        DECLE   $0002                           ; 6ACF  SFX data
        DECLE   $0345                           ; 6AD0  SFX data
        DECLE   $0001,  $0004                   ; 6AD1  SFX data
        DECLE   $0077,  $00E2,  $006A           ; 6AD3  SFX data
        DECLE   $026B                           ; 6AD6  SFX data
        DECLE   $0001,  $0000                   ; 6AD7  SFX data
        DECLE   $03F2                           ; 6AD9  SFX data
        DECLE   $031D                           ; 6ADA  SFX data
        DECLE   $0077,  $00E2,  $006A           ; 6ADB  SFX data
        DECLE   $0143,  $03EC                   ; 6ADE  SFX data
        DECLE   $0005                           ; 6AE0  SFX data
        DECLE   $03CF                           ; 6AE1  SFX end

UC_6AE2:
        MVI     .PSG0.chn_a_lo,R0               ; 6AE2  SLIB UCALL target
        XORI    #$0080, R0                      ; 6AE4   03F8 0080
        MVO     R0,     .PSG0.chn_a_lo          ; 6AE6   0240 01F0
        PULR    R7                              ; 6AE8   02B7

L_6AE9:
        PSHR    R5                              ; 6AE9   0275
        MVII    #$0002, R1                      ; 6AEA   02B9 0002
        MVO     R1,     G_01E5                  ; 6AEC   0241 01E5
        MVII    #$0038, R1                      ; 6AEE   02B9 0038
        MVO     R1,     .PSG0.chan_enable       ; 6AF0   0241 01F8
        TSTR    R0                              ; 6AF2   0080
        BEQ     L_6B07                          ; 6AF3   0204 0012

        MVII    #$0023, R1                      ; 6AF5   02B9 0023
        MVO     R1,     .PSG0.chn_b_lo          ; 6AF7   0241 01F1
        SLL     R1,     1                       ; 6AF9   0049
        MVO     R1,     .PSG0.chn_c_lo          ; 6AFA   0241 01F2
        CLRR    R1                              ; 6AFC   01C9
        MVO     R1,     .PSG0.chn_b_hi          ; 6AFD   0241 01F5
        MVO     R1,     .PSG0.chn_c_hi          ; 6AFF   0241 01F6
        MVII    #$000F, R1                      ; 6B01   02B9 000F
        MVO     R1,     .PSG0.envlp_hi          ; 6B03   0241 01F7
        B       L_6B17                          ; 6B05   0200 0010

L_6B07:
        MVII    #$002C, R1                      ; 6B07   02B9 002C
        MVO     R1,     .PSG0.chn_b_lo          ; 6B09   0241 01F1
        MVO     R1,     .PSG0.chn_c_lo          ; 6B0B   0241 01F2
        MVII    #$0001, R1                      ; 6B0D   02B9 0001
        MVO     R1,     .PSG0.chn_b_hi          ; 6B0F   0241 01F5
        MVII    #$0006, R1                      ; 6B11   02B9 0006
        MVO     R1,     .PSG0.chn_c_hi          ; 6B13   0241 01F6
        MVO     R1,     .PSG0.envlp_hi          ; 6B15   0241 01F7
L_6B17:
        MVII    #$0030, R1                      ; 6B17   02B9 0030
        MVO     R1,     .PSG0.chn_c_vol         ; 6B19   0241 01FD
        B       L_6A8E                          ; 6B1B   0220 008E

L_6B1D:
        PSHR    R5                              ; 6B1D   0275
        MVI     G_0165, R0                      ; 6B1E   0280 0165
        ADDI    #$0006, R0                      ; 6B20   02F8 0006
        BGE     L_6B26                          ; 6B22   020D 0002

        MVII    #$0008, R0                      ; 6B24   02B8 0008

L_6B26:
        JSR     R5,     X_PLAY_SFX1             ; 6B26   0004 0118 03BB
        DECLE   $002F                           ; 6B29  SFX data
        DECLE   $0289                           ; 6B2A  SFX data
        DECLE   $0340,  $0200                   ; 6B2B  SFX data
        DECLE   $0001,  $03D8                   ; 6B2D  SFX data
        DECLE   $008F,  $0013                   ; 6B2F  SFX data
        DECLE   $0001,  $0000                   ; 6B31  SFX data
        DECLE   $008F,  $0013                   ; 6B33  SFX data
        DECLE   $0283,  $03D0                   ; 6B35  SFX data
        DECLE   $00CF                           ; 6B37  SFX end


        MVI     G_0165, R0                      ; 6B38   0280 0165
        CMPI    #$0002, R0                      ; 6B3A   0378 0002
        BLE     L_6B41                          ; 6B3C   0206 0003
        J       L_6509                          ; 6B3E   0004 0364 0109

L_6B41:
        JSR     R5,     L_59CC                  ; 6B41   0004 0158 01CC

        ANDI    #$0055, R0                      ; 6B44   03B8 0055
        MOVR    R0,     R3                      ; 6B46   0083
        SLL     R0,     1                       ; 6B47   0048
        XORR    R0,     R3                      ; 6B48   01C3
        COMR    R3                              ; 6B49   001B
        ANDR    R3,     R2                      ; 6B4A   019A
        XORR    R0,     R2                      ; 6B4B   01C2
        MVO@    R2,     R1                      ; 6B4C   024A

        JSR     R5,     L_6B56                  ; 6B4D   0004 0168 0356

        J       L_6B86                          ; 6B50   0004 0368 0386

L_6B53:
        JSR     R4,     X_SFX_OK                ; 6B53   0004 001C 02AD

L_6B56:
        PSHR    R5                              ; 6B56   0275

        JSR     R5,     X_PLAY_SFX1             ; 6B57   0004 0118 03BB
        DECLE   $002F                           ; 6B5A  SFX data
        DECLE   $0059                           ; 6B5B  SFX data
        DECLE   $004D                           ; 6B5C  SFX data
        DECLE   $03C5                           ; 6B5D  SFX data
        DECLE   $03D5                           ; 6B5E  SFX data
        DECLE   $03E6                           ; 6B5F  SFX data
        DECLE   $03E2                           ; 6B60  SFX data
        DECLE   $008F,  $001D                   ; 6B61  SFX data
        DECLE   $0005                           ; 6B63  SFX data
        DECLE   $0015                           ; 6B64  SFX data
        DECLE   $03CF                           ; 6B65  SFX end

L_6B66:
        PSHR    R5                              ; 6B66   0275
        MVI     G_01A7, R0                      ; 6B67   0280 01A7
        TSTR    R0                              ; 6B69   0080
        BNEQ    L_6BD1                          ; 6B6A   020C 0065

        MVI     G_01A3, R1                      ; 6B6C   0281 01A3
        TSTR    R1                              ; 6B6E   0089
        BNEQ    L_6B7E                          ; 6B6F   020C 000D

        MVI     G_0160, R0                      ; 6B71   0280 0160
        TSTR    R0                              ; 6B73   0080
        BNEQ    L_6BD1                          ; 6B74   020C 005B

        MVI     G_015F, R0                      ; 6B76   0280 015F
        CMPI    #$000F, R0                      ; 6B78   0378 000F
        BGT     L_6BD1                          ; 6B7A   020E 0055
        B       L_6B86                          ; 6B7C   0200 0008

L_6B7E:
        JSR     R5,     L_59CC                  ; 6B7E   0004 0158 01CC

        MVI     G_01BD, R0                      ; 6B81   0280 01BD

        JSR     R5,     L_649E                  ; 6B83   0004 0164 009E

L_6B86:
        SDBD                                    ; 6B86   0001
        MVII    #$5166, R0                      ; 6B87   02B8 0066 0051
        MVO     R0,     G_035D                  ; 6B8A   0240 035D
        MVII    #$0040, R0                      ; 6B8C   02B8 0040
        MVII    #$031D, R4                      ; 6B8E   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; 6B90   0004 0114 0338

        MVII    #$031D, R2                      ; 6B93   02BA 031D
        SDBD                                    ; 6B95   0001
        MVII    #$5D86, R1                      ; 6B96   02B9 0086 005D

        JSR     R5,     X_INIT_MOB              ; 6B99   0004 0114 02B2

        MVI     G_016B, R0                      ; 6B9C   0280 016B
        SLL     R0,     2                       ; 6B9E   004C
        SLL     R0,     1                       ; 6B9F   0048
        ADD     G_016D, R0                      ; 6BA0   02C0 016D
        SWAP    R0,     1                       ; 6BA2   0040
        MVO     R0,     G_031F                  ; 6BA3   0240 031F
        MVI     G_016C, R0                      ; 6BA5   0280 016C
        SLL     R0,     2                       ; 6BA7   004C
        SLL     R0,     2                       ; 6BA8   004C
        ADDI    #$0018, R0                      ; 6BA9   02F8 0018
        SWAP    R0,     1                       ; 6BAB   0040
        MVO     R0,     G_0320                  ; 6BAC   0240 0320

        JSR     R5,     L_6287                  ; 6BAE   0004 0160 0287

        SDBD                                    ; 6BB1   0001
        MVII    #$5056, R1                      ; 6BB2   02B9 0056 0050

        JSR     R5,     X_TIMER_STOP            ; 6BB5   0004 0118 0038
        JSR     R5,     L_52BC                  ; 6BB8   0004 0150 02BC

        CLRR    R0                              ; 6BBB   01C0
        MVO     R0,     G_01A2                  ; 6BBC   0240 01A2
        MVO     R0,     G_01A7                  ; 6BBE   0240 01A7
        MVO     R0,     G_0167                  ; 6BC0   0240 0167
        SDBD                                    ; 6BC2   0001
        MVII    #$505A, R1                      ; 6BC3   02B9 005A 0050
        MVO     R0,     G_0169                  ; 6BC6   0240 0169
        MVO     R0,     G_01BD                  ; 6BC8   0240 01BD
        MVO     R0,     G_011A                  ; 6BCA   0240 011A
        MVO     R0,     G_01A4                  ; 6BCC   0240 01A4

        JSR     R5,     X_TIMER_STOP            ; 6BCE   0004 0118 0038

L_6BD1:
        PULR    R7                              ; 6BD1   02B7

        DECLE   $0002,  $00F1,  $0000,  $006A   ; 6BD2   0002 00F1 0000 006A
        DECLE   $0118,  $034D,  $0106,  $020E   ; 6BD6   0118 034D 0106 020E
        DECLE   $0304,  $00A2,  $00CE,  $00F2   ; 6BDA   0304 00A2 00CE 00F2
        DECLE   $00AB,  $01A5,  $0048,  $01A9   ; 6BDE   00AB 01A5 0048 01A9
        DECLE   $00D0,  $006A,  $03BE,  $0283   ; 6BE2   00D0 006A 03BE 0283
        DECLE   $010B,  $01AE,  $01FE,  $0142   ; 6BE6   010B 01AE 01FE 0142
        DECLE   $0300,  $0036,  $0346,  $00C7   ; 6BEA   0300 0036 0346 00C7
        DECLE   $0367,  $00E4,  $0000,  $023B   ; 6BEE   0367 00E4 0000 023B
        DECLE   $0306,  $0163,  $01C2,  $014D   ; 6BF2   0306 0163 01C2 014D
        DECLE   $00D6,  $010E,  $008B,  $01A2   ; 6BF6   00D6 010E 008B 01A2
        DECLE   $009C,  $006E,  $028B,  $01AD   ; 6BFA   009C 006E 028B 01AD
        DECLE   $0158,  $01A6,  $0088,  $025C   ; 6BFE   0158 01A6 0088 025C
        DECLE   $03E0,  $001B,  $0177,  $02A9   ; 6C02   03E0 001B 0177 02A9
        DECLE   $01CD,  $00BE,  $030E,  $0306   ; 6C06   01CD 00BE 030E 0306
        DECLE   $01B2,  $003C,  $03F2,  $01EA   ; 6C0A   01B2 003C 03F2 01EA
        DECLE   $00C5,  $000B,  $0088,  $03FD   ; 6C0E   00C5 000B 0088 03FD
        DECLE   $0021,  $03E0,  $00B0,  $00D3   ; 6C12   0021 03E0 00B0 00D3
        DECLE   $0047,  $0144,  $01DC,  $01C0   ; 6C16   0047 0144 01DC 01C0
        DECLE   $00A8,  $01D3,  $03B8,  $0207   ; 6C1A   00A8 01D3 03B8 0207
        DECLE   $001C,  $0121,  $00A5,  $01F3   ; 6C1E   001C 0121 00A5 01F3
        DECLE   $0348,  $0203,  $01FC,  $0119   ; 6C22   0348 0203 01FC 0119
        DECLE   $01A7,  $00AC,  $000E,  $0120   ; 6C26   01A7 00AC 000E 0120
        DECLE   $0068,  $000C,  $035C,  $016E   ; 6C2A   0068 000C 035C 016E
        DECLE   $039F,  $01CC,  $0229,  $01FE   ; 6C2E   039F 01CC 0229 01FE
        DECLE   $00C9,  $0213,  $035F,  $0064   ; 6C32   00C9 0213 035F 0064
        DECLE   $000B,  $03A5,  $0045,  $0003   ; 6C36   000B 03A5 0045 0003
        DECLE   $00C0,  $00F9,  $017B,  $0231   ; 6C3A   00C0 00F9 017B 0231
        DECLE   $0387,  $0000,  $00F5,  $0110   ; 6C3E   0387 0000 00F5 0110
        DECLE   $030D,  $014E,  $001A,  $018D   ; 6C42   030D 014E 001A 018D
        DECLE   $03B1,  $02DB,  $0154,  $02A6   ; 6C46   03B1 02DB 0154 02A6
        DECLE   $0079,  $020D,  $02C5,  $0050   ; 6C4A   0079 020D 02C5 0050
        DECLE   $010E,  $016E,  $02E3,  $0235   ; 6C4E   010E 016E 02E3 0235

        CMPR    R0,     R6                      ; 6C52   0146
        CMPR    R6,     R3                      ; 6C53   0173
        SLR     R0,     1                       ; 6C54   0060
        MOVR    R4,     R7                      ; 6C55   00A7

        MVO@    R6,     R2                      ; 6C56   0256
        SUBR    R6,     R1                      ; 6C57   0131
        MOVR    R2,     R7                      ; 6C58   0097

        DECLE   $0281,  $00B1,  $01DC,  $004B   ; 6C59   0281 00B1 01DC 004B
        DECLE   $034B,  $0270,  $010B,  $0083   ; 6C5D   034B 0270 010B 0083
        DECLE   $002C,  $02FD,  $0034,  $019D   ; 6C61   002C 02FD 0034 019D
        DECLE   $021C,  $0285,  $01A8,  $017A   ; 6C65   021C 0285 01A8 017A
        DECLE   $034E,  $0100,  $03F8,  $0223   ; 6C69   034E 0100 03F8 0223
        DECLE   $0001                           ; 6C6D   0001

        CMPR    R3,     R0                      ; 6C6E   0158
        MVO     R4,     .BTAB.DD                ; 6C6F   0244 02DD
        RSWD    R5                              ; 6C71   003D
        SKIP                                    ; 6C72   0208
        ANDR    R1,     R0                      ; 6C73   0188
        ANDR    R4,     R6                      ; 6C74   01A6
        TSTR    R1                              ; 6C75   0089
        MVI@    R1,     R2                      ; 6C76   028A
        AND@    R4,     R6                      ; 6C77   03A6
        MVI@    R3,     R7                      ; 6C78   029F

        DECLE   $0187,  $0129,  $03B3,  $003E   ; 6C79   0187 0129 03B3 003E
        DECLE   $0147,  $03C3,  $032B,  $02D3   ; 6C7D   0147 03C3 032B 02D3
        DECLE   $0274,  $01B1,  $021D,  $02A3   ; 6C81   0274 01B1 021D 02A3
        DECLE   $03A9,  $0389,  $0173,  $035A   ; 6C85   03A9 0389 0173 035A
        DECLE   $02B4,  $008B,  $03E0,  $03D4   ; 6C89   02B4 008B 03E0 03D4
        DECLE   $03C2,  $01AE,  $0095,  $03E3   ; 6C8D   03C2 01AE 0095 03E3
        DECLE   $0209,  $0103,  $01BE,  $00C0   ; 6C91   0209 0103 01BE 00C0
        DECLE   $001F,  $01C0,  $0000           ; 6C95   001F 01C0 0000

        RSWD    R6                              ; 6C98   003E
        ANDR    R5,     R0                      ; 6C99   01A8
        SLLC    R0,     2                       ; 6C9A   005C
        MVO@    R6,     R4                      ; 6C9B   0266
        XORR    R6,     R0                      ; 6C9C   01F0
        XORR    R5,     R4                      ; 6C9D   01EC
        XOR@    R4,     R1                      ; 6C9E   03E1
        MVI@    R3,     R2                      ; 6C9F   029A
        MVO@    R6,     R3                      ; 6CA0   025E
        SLR     R0,     1                       ; 6CA1   0060
        XOR@    R4,     R0                      ; 6CA2   03E0
        SUBR    R3,     R7                      ; 6CA3   011F

        DECLE   $02D0,  $00CB,  $03B5,  $01B3   ; 6CA4   02D0 00CB 03B5 01B3
        DECLE   $00D4,  $0105,  $01F2,  $010D   ; 6CA8   00D4 0105 01F2 010D
        DECLE   $0269,  $01DA,  $012A,  $008C   ; 6CAC   0269 01DA 012A 008C
        DECLE   $0103,  $0375,  $0276,  $0233   ; 6CB0   0103 0375 0276 0233
        DECLE   $0109,  $00B5,  $0311,  $0301   ; 6CB4   0109 00B5 0311 0301
        DECLE   $01F3,  $0143,  $029A,  $0225   ; 6CB8   01F3 0143 029A 0225
        DECLE   $025A,  $028C,  $0181,  $0198   ; 6CBC   025A 028C 0181 0198
        DECLE   $02AD,  $02A4,  $0014,  $00F0   ; 6CC0   02AD 02A4 0014 00F0
        DECLE   $0038,  $0300,  $0024,  $0318   ; 6CC4   0038 0300 0024 0318
        DECLE   $0011,  $0399,  $0319,  $03CC   ; 6CC8   0011 0399 0319 03CC
        DECLE   $00B1,  $000D,  $03CB,  $01CB   ; 6CCC   00B1 000D 03CB 01CB
        DECLE   $000A,  $0388,  $03D2,  $00FE   ; 6CD0   000A 0388 03D2 00FE
        DECLE   $03FF                           ; 6CD4   03FF

        XORR    R1,     R4                      ; 6CD5   01CC
        B       L_6F7E                          ; 6CD6   0200 02A6

        RLC     R0,     1                       ; 6CD8   0050
        SUBR    R1,     R7                      ; 6CD9   010F

        DECLE   $03C5,  $0075,  $0005,  $0143   ; 6CDA   03C5 0075 0005 0143
        DECLE   $0209,  $01C0,  $01E1,  $002A   ; 6CDE   0209 01C0 01E1 002A
        DECLE   $0304,  $025F,  $003C,  $0180   ; 6CE2   0304 025F 003C 0180
        DECLE   $0343,  $03E0,  $0211,  $0001   ; 6CE6   0343 03E0 0211 0001

        MOVR    R1,     R6                      ; 6CEA   008E
        SUBR    R5,     R4                      ; 6CEB   012C
        CMP@    R3,     R7                      ; 6CEC   035F
        GSWD    R2                              ; 6CED   0032
        XORR    R2,     R0                      ; 6CEE   01D0
        SWAP    R2,     1                       ; 6CEF   0042
        PSHR    R3                              ; 6CF0   0273
        MVO@    R0,     R1                      ; 6CF1   0248
        AND     G_0042, R2                      ; 6CF2   0382 0042
        ADD@    R3,     R0                      ; 6CF4   02D8
        ADD     .BTAB.94,R7                     ; 6CF5   02C7 0294

        DECLE   $03D9,  $0220,  $01C3,  $0029   ; 6CF7   03D9 0220 01C3 0029
        DECLE   $0374,  $0165,  $012A,  $022A   ; 6CFB   0374 0165 012A 022A
        DECLE   $03FF,  $01E9,  $0187,  $0360   ; 6CFF   03FF 01E9 0187 0360
        DECLE   $01BC,  $030C,  $0361,  $03F4   ; 6D03   01BC 030C 0361 03F4
        DECLE   $03B2,  $0132,  $00A5,  $037F   ; 6D07   03B2 0132 00A5 037F
        DECLE   $003F,  $02E0,  $017C,  $00C0   ; 6D0B   003F 02E0 017C 00C0
        DECLE   $0003,  $0000                   ; 6D0F   0003 0000

        SUB@    R4,     R0                      ; 6D11   0320
        XOR@    R4,     R3                      ; 6D12   03E3
        MOVR    R5,     R0                      ; 6D13   00A8
        ADDR    R3,     R7                      ; 6D14   00DF

        DECLE   $0030,  $00FC,  $00A8,  $01AF   ; 6D15   0030 00FC 00A8 01AF
        DECLE   $02EC,  $0367,  $01B8,  $000A   ; 6D19   02EC 0367 01B8 000A
        DECLE   $03E4,  $021A,  $00D2,  $03EF   ; 6D1D   03E4 021A 00D2 03EF
        DECLE   $0244,  $00D4,  $0305,  $01F5   ; 6D21   0244 00D4 0305 01F5
        DECLE   $00ED,  $0267,  $00F6,  $012B   ; 6D25   00ED 0267 00F6 012B
        DECLE   $026C,  $0102,  $017D,  $0276   ; 6D29   026C 0102 017D 0276
        DECLE   $0332,  $00E9,  $0096,  $0135   ; 6D2D   0332 00E9 0096 0135
        DECLE   $01C1,  $01FF                   ; 6D31   01C1 01FF
L_6D33:
        SUB@    R6,     R3                      ; 6D33   0333
        DECLE   $0070,  $0000                   ; 6D34   0070 0000

        RSWD    R0                              ; 6D36   0038
        SUB@    R3,     R0                      ; 6D37   0318
        CMPR    R1,     R4                      ; 6D38   014C
        ANDR    R4,     R0                      ; 6D39   01A0
        ADDR    R7,     R4                      ; 6D3A   00FC
        SUBR    R0,     R7                      ; 6D3B   0107

        DECLE   $0163,  $039E,  $010B,  $034B   ; 6D3C   0163 039E 010B 034B
        DECLE   $018C,  $014A,  $00CB,  $00E8   ; 6D40   018C 014A 00CB 00E8
        DECLE   $027A,  $03E8,  $01D7,  $0173   ; 6D44   027A 03E8 01D7 0173
        DECLE   $00A1,  $03CD,  $0142,  $010E   ; 6D48   00A1 03CD 0142 010E
        DECLE   $024B,  $02F1,  $00EE,  $02F0   ; 6D4C   024B 02F1 00EE 02F0
        DECLE   $036C,  $009C,  $002D,  $0040   ; 6D50   036C 009C 002D 0040
        DECLE   $0224,  $0361,  $01F8,  $01B0   ; 6D54   0224 0361 01F8 01B0
        DECLE   $03E8,  $01AA,  $0168,  $0288   ; 6D58   03E8 01AA 0168 0288
        DECLE   $01D6,  $0243,  $017B,  $019F   ; 6D5C   01D6 0243 017B 019F
        DECLE   $0349,  $0001,  $00FC,  $0088   ; 6D60   0349 0001 00FC 0088
        DECLE   $0100,  $03D6,  $0212,  $0003   ; 6D64   0100 03D6 0212 0003
        DECLE   $01B2,  $031C,  $0391,  $03A4   ; 6D68   01B2 031C 0391 03A4
        DECLE   $01F7,  $0038,  $0000,  $0063   ; 6D6C   01F7 0038 0000 0063
        DECLE   $0218,  $00C9,  $0000,  $00C9   ; 6D70   0218 00C9 0000 00C9
        DECLE   $019D,  $0298,  $01C0,  $0313   ; 6D74   019D 0298 01C0 0313
        DECLE   $0000                           ; 6D78   0000

        CMPR    R2,     R0                      ; 6D79   0150
        RSWD    R2                              ; 6D7A   003A
        CMP@    R6,     R0                      ; 6D7B   0370
        AND@    R1,     R0                      ; 6D7C   0388
        SUB@    R6,     R5                      ; 6D7D   0335
        ADDR    R3,     R3                      ; 6D7E   00DB
        ANDI    #$011C, R1                      ; 6D7F   03B9 011C
        MOVR    R1,     R7                      ; 6D81   008F

        DECLE   $01BD,  $0393,  $01AF,  $02B4   ; 6D82   01BD 0393 01AF 02B4
        DECLE   $0179,  $00AB,  $037F,  $01F0   ; 6D86   0179 00AB 037F 01F0
        DECLE   $0338,  $0367,  $023C           ; 6D8A   0338 0367 023C

        MVI@    R1,     R1                      ; 6D8D   0289
        TSTR    R2                              ; 6D8E   0092
        ANDI    #$0202, R4                      ; 6D8F   03BC 0202
        DIS                                     ; 6D91   0003
        NOP                                     ; 6D92   0034
        SLLC    R2,     2                       ; 6D93   005E
        SUBR    R6,     R4                      ; 6D94   0134
        AND@    R1,     R3                      ; 6D95   038B
        ANDI    #$0014, R1                      ; 6D96   03B9 0014
        SUB@    R1,     R7                      ; 6D98   030F

        DECLE   $0036,  $0000,  $01B1,  $0254   ; 6D99   0036 0000 01B1 0254
        DECLE   $027C,  $023C,  $0092,  $0390   ; 6D9D   027C 023C 0092 0390
        DECLE   $03E1,  $00BF,  $0079,  $0100   ; 6DA1   03E1 00BF 0079 0100
        DECLE   $0397,  $0042,  $023E           ; 6DA5   0397 0042 023E

        CMPR    R7,     R0                      ; 6DA8   0178
        ADDR    R7,     R3                      ; 6DA9   00FB
        MOVR    R3,     R0                      ; 6DAA   0098
        SUB@    R2,     R7                      ; 6DAB   0317
        SUB@    R6,     R7                      ; 6DAC   0337

        DECLE   $0109,  $0001,  $00FC,  $03A0   ; 6DAD   0109 0001 00FC 03A0
        DECLE   $0288,  $01C6,  $0292,  $0002   ; 6DB1   0288 01C6 0292 0002
        DECLE   $01DC,  $033E,  $03F1,  $03A0   ; 6DB5   01DC 033E 03F1 03A0
        DECLE   $0324,  $0001,  $03F4,  $028C   ; 6DB9   0324 0001 03F4 028C
        DECLE   $0203,  $0351,  $03F3,  $01FA   ; 6DBD   0203 0351 03F3 01FA
        DECLE   $0084,  $0200,  $026A,  $01D3   ; 6DC1   0084 0200 026A 01D3
        DECLE   $0084,  $00F4,  $0089,  $0000   ; 6DC5   0084 00F4 0089 0000
        DECLE   $00C4,  $03A2,  $0298,  $03D4   ; 6DC9   00C4 03A2 0298 03D4
        DECLE   $0059,  $03C0,  $000E,  $034E   ; 6DCD   0059 03C0 000E 034E
        DECLE   $01C3,  $0000,  $0065,  $0018   ; 6DD1   01C3 0000 0065 0018
        DECLE   $0349,  $0000,  $00EC,  $0112   ; 6DD5   0349 0000 00EC 0112
        DECLE   $01B0,  $01C0,  $029A,  $01DE   ; 6DD9   01B0 01C0 029A 01DE
        DECLE   $0008,  $028E,  $0047,  $023E   ; 6DDD   0008 028E 0047 023E
        DECLE   $00D9,  $0058,  $034A,  $00D4   ; 6DE1   00D9 0058 034A 00D4
        DECLE   $0311,  $0081,  $00D4,  $03B8   ; 6DE5   0311 0081 00D4 03B8
        DECLE   $032C,  $0356,  $013A,  $0299   ; 6DE9   032C 0356 013A 0299
        DECLE   $024D,  $0000,  $020E,  $0185   ; 6DED   024D 0000 020E 0185
        DECLE   $021D,  $00D1,  $0058,  $014A   ; 6DF1   021D 00D1 0058 014A
        DECLE   $00AA,  $0000,  $0078,  $0140   ; 6DF5   00AA 0000 0078 0140
        DECLE   $021F                           ; 6DF9   021F

        CMP@    R1,     R7                      ; 6DFA   034F
        MVI@    R3,     R0                      ; 6DFB   0298
        AND@    R2,     R5                      ; 6DFC   0395
        XORR    R3,     R6                      ; 6DFD   01DE
        ADDR    R1,     R4                      ; 6DFE   00CC
        XOR@    R6,     R0                      ; 6DFF   03F0
        ANDR    R6,     R5                      ; 6E00   01B5
        ADD@    R6,     R6                      ; 6E01   02F6
        CMP     G_039A, R2                      ; 6E02   0342 039A
        ADD@    R5,     R2                      ; 6E04   02EA
        XORR    R3,     R0                      ; 6E05   01D8
        MVI@    R1,     R7                      ; 6E06   028F

        DECLE   $0387,  $03F9,  $02F3,  $0253   ; 6E07   0387 03F9 02F3 0253
        DECLE   $014A,  $0156,  $0004,  $0000   ; 6E0B   014A 0156 0004 0000
        DECLE   $0244,  $02F3,  $034B,  $0074   ; 6E0F   0244 02F3 034B 0074
        DECLE   $039E,  $01DE,  $00F0,  $036C   ; 6E13   039E 01DE 00F0 036C
        DECLE   $0300,  $032F,  $0138,  $00C9   ; 6E17   0300 032F 0138 00C9
        DECLE   $0010,  $0000,  $0080,  $0202   ; 6E1B   0010 0000 0080 0202
        DECLE   $01E2,  $021A,  $002C,  $0219   ; 6E1F   01E2 021A 002C 0219
        DECLE   $0092,  $02A3,  $021E,  $00E1   ; 6E23   0092 02A3 021E 00E1
        DECLE   $0299,  $0329,  $0238,  $0121   ; 6E27   0299 0329 0238 0121
        DECLE   $0230,  $00F0,  $037B,  $007C   ; 6E2B   0230 00F0 037B 007C
        DECLE   $0360,  $0120,  $0212,  $0000   ; 6E2F   0360 0120 0212 0000
        DECLE   $00CA,  $0016,  $03A0,  $0380   ; 6E33   00CA 0016 03A0 0380
        DECLE   $00E1,  $0000,  $0062,  $0218   ; 6E37   00E1 0000 0062 0218
        DECLE   $0048,  $0000,  $0098,  $038D   ; 6E3B   0048 0000 0098 038D
        DECLE   $01B7,  $03CC,  $0291,  $0000   ; 6E3F   01B7 03CC 0291 0000
        DECLE   $0132,  $0228,  $004F,  $0331   ; 6E43   0132 0228 004F 0331
        DECLE   $0134,  $0379,  $03E8,  $0116   ; 6E47   0134 0379 03E8 0116
        DECLE   $030B,  $002C,  $0018,  $01AD   ; 6E4B   030B 002C 0018 01AD
        DECLE   $0274,  $0129,  $0321,  $00C2   ; 6E4F   0274 0129 0321 00C2
        DECLE   $00D1,  $03C0,  $0365,  $020A   ; 6E53   00D1 03C0 0365 020A
        DECLE   $027D,  $0032,  $0019,  $0059   ; 6E57   027D 0032 0019 0059
        DECLE   $0326,  $034A,  $006B,  $01E8   ; 6E5B   0326 034A 006B 01E8
        DECLE   $03AF,  $0293,  $0121,  $03A4   ; 6E5F   03AF 0293 0121 03A4
        DECLE   $00C2,  $0161,  $0000,  $0368   ; 6E63   00C2 0161 0000 0368
        DECLE   $024A,  $0275,  $0234,  $00E9   ; 6E67   024A 0275 0234 00E9
        DECLE   $0025,  $0324,  $0348,  $0183   ; 6E6B   0025 0324 0348 0183
        DECLE   $0163,  $02B3,  $0293,  $00F9   ; 6E6F   0163 02B3 0293 00F9
        DECLE   $03B1,  $03C1,  $0228,  $01BC   ; 6E73   03B1 03C1 0228 01BC
        DECLE   $0101,  $01FF                   ; 6E77   0101 01FF

        MVI@    R1,     R1                      ; 6E79   0289
        SUB@    R6,     R2                      ; 6E7A   0332
        ADD     G_03F5, R7                      ; 6E7B   02C7 03F5

        DECLE   $0025,  $038D,  $0070,  $03E8   ; 6E7D   0025 038D 0070 03E8
        DECLE   $00A3,  $0276,  $00E9,  $0334   ; 6E81   00A3 0276 00E9 0334
        DECLE   $039E,  $01E0,  $0294,  $01F5   ; 6E85   039E 01E0 0294 01F5
        DECLE   $00BF                           ; 6E89   00BF

        ADD@    R4,     R5                      ; 6E8A   02E5
        SUBR    R6,     R4                      ; 6E8B   0134
        ADD@    R4,     R7                      ; 6E8C   02E7

        DECLE   $0035                           ; 6E8D   0035

        NEGR    R5                              ; 6E8E   0025
        SUB@    R1,     R7                      ; 6E8F   030F
        ADD@    R6,     R7                      ; 6E90   02F7

        DECLE   $01C8,  $023B                   ; 6E91   01C8 023B

        AND@    R2,     R5                      ; 6E93   0395
        SUBR    R5,     R7                      ; 6E94   012F

        DECLE   $0002,  $02E0,  $01A4,  $01EC   ; 6E95   0002 02E0 01A4 01EC
        DECLE   $0008,  $021E,  $0003,  $006B   ; 6E99   0008 021E 0003 006B
        DECLE   $0218,  $0309,  $0001,  $00EB   ; 6E9D   0218 0309 0001 00EB
        DECLE   $020F,  $00F8,  $03D2,  $0213   ; 6EA1   020F 00F8 03D2 0213
        DECLE   $0003,  $021A,  $033C,  $03C1   ; 6EA5   0003 021A 033C 03C1
        DECLE   $03A8,  $0325,  $0007,  $036C   ; 6EA9   03A8 0325 0007 036C
        DECLE   $0234,  $0001,  $0331,  $0069   ; 6EAD   0234 0001 0331 0069
        DECLE   $017B,  $002A,  $0236,  $021E   ; 6EB1   017B 002A 0236 021E
        DECLE   $02F3,  $0391,  $0260,  $00EA   ; 6EB5   02F3 0391 0260 00EA
        DECLE   $0259,  $0209,  $0004,  $0000   ; 6EB9   0259 0209 0004 0000

        ADDI    #$0080, R5                      ; 6EBD   02FD 0080
        ANDR    R7,     R1                      ; 6EBF   01B9
        XORR    R7,     R0                      ; 6EC0   01F8
        XORI    #$010F, R4                      ; 6EC1   03FC 010F
        XORR    R1,     R2                      ; 6EC3   01CA
        ADDR    R0,     R5                      ; 6EC4   00C5
        ADD@    R4,     R3                      ; 6EC5   02E3
        MVO@    R3,     R2                      ; 6EC6   0253
        CMPI    #$0341, R7                      ; 6EC7   037F 0341
        MVO@    R0,     R5                      ; 6EC9   0268
        MOVR    R4,     R7                      ; 6ECA   00A7

        DECLE   $0196,  $0328,  $0267,  $0172   ; 6ECB   0196 0328 0267 0172
        DECLE   $0023,  $024A,  $019E,  $01F5   ; 6ECF   0023 024A 019E 01F5
        DECLE   $0312,  $0021,  $01F7,  $022F   ; 6ED3   0312 0021 01F7 022F
        DECLE   $005C,  $0240,  $020B,  $03DA   ; 6ED7   005C 0240 020B 03DA
        DECLE   $000E,  $007C,  $0029,  $0000   ; 6EDB   000E 007C 0029 0000
        DECLE   $0291,  $03E3,  $0321,  $00F6   ; 6EDF   0291 03E3 0321 00F6
        DECLE   $0243,  $017E,  $0283,  $0361   ; 6EE3   0243 017E 0283 0361
        DECLE   $0230,  $0033,  $007C,  $01AA   ; 6EE7   0230 0033 007C 01AA
        DECLE   $0265,  $000B,  $00AD,  $0278   ; 6EEB   0265 000B 00AD 0278
        DECLE   $008C,  $01F7,  $0355,  $0163   ; 6EEF   008C 01F7 0355 0163
        DECLE   $0226,  $021F,  $0038,  $02C0   ; 6EF3   0226 021F 0038 02C0
        DECLE   $02CB,  $01DF,  $0221,  $003B   ; 6EF7   02CB 01DF 0221 003B
        DECLE   $0069,  $0180,  $001B,  $0001   ; 6EFB   0069 0180 001B 0001
        DECLE   $0135,  $0037,  $0211,  $0014   ; 6EFF   0135 0037 0211 0014
        DECLE   $0000,  $0000,  $0200,  $0070   ; 6F03   0000 0000 0200 0070
        DECLE   $0000,  $005C,  $0318,  $0148   ; 6F07   0000 005C 0318 0148
        DECLE   $0000,  $00B9,  $0110,  $0296   ; 6F0B   0000 00B9 0110 0296
        DECLE   $01F4,  $0211,  $0004,  $0170   ; 6F0F   01F4 0211 0004 0170
        DECLE   $0238,  $024F,  $034C,  $0224   ; 6F13   0238 024F 034C 0224
        DECLE   $0009,  $032C,  $0070,  $029E   ; 6F17   0009 032C 0070 029E
        DECLE   $0350,  $006B,  $019B,  $006A   ; 6F1B   0350 006B 019B 006A
        DECLE   $0234,  $019A,  $0075,  $0382   ; 6F1F   0234 019A 0075 0382
        DECLE   $0061,  $00EA,  $03B3,  $0151   ; 6F23   0061 00EA 03B3 0151
        DECLE   $02C1,  $0351,  $0270,  $001B   ; 6F27   02C1 0351 0270 001B
        DECLE   $011E,  $0133,  $032B,  $0025   ; 6F2B   011E 0133 032B 0025
        DECLE   $0120,  $0010,  $0238,  $0067   ; 6F2F   0120 0010 0238 0067
        DECLE   $0050,  $000A,  $02C8,  $0021   ; 6F33   0050 000A 02C8 0021
        DECLE   $00BF                           ; 6F37   00BF

        MVO@    R5,     R4                      ; 6F38   0265
        MOVR    R1,     R7                      ; 6F39   008F

        INCR    R5                              ; 6F3A   000D
        ANDR    R0,     R0                      ; 6F3B   0180
        SUBR    R6,     R3                      ; 6F3C   0133
        SUB@    R1,     R2                      ; 6F3D   030A
        MOVR    R4,     R7                      ; 6F3E   00A7

        DECLE   $03CF,  $0243,  $0006,  $0030   ; 6F3F   03CF 0243 0006 0030
        DECLE   $01A1,  $03B8,  $02C0,  $008B   ; 6F43   01A1 03B8 02C0 008B
        DECLE   $000E,  $0370,  $00F2,  $027C   ; 6F47   000E 0370 00F2 027C
        DECLE   $0028,  $0197,  $0358,  $01AF   ; 6F4B   0028 0197 0358 01AF
        DECLE   $01B0,  $028A,  $01CE,  $0209   ; 6F4F   01B0 028A 01CE 0209

        CLRR    R3                              ; 6F53   01DB
        AND@    R2,     R6                      ; 6F54   0396
        ADD@    R4,     R4                      ; 6F55   02E4
        INCR    R7                              ; 6F56   000F

        SARC    R2,     2                       ; 6F57   007E
L_6F58:
        RSWD    R6                              ; 6F58   003E
        SUBR    R0,     R3                      ; 6F59   0103
        SUB@    R2,     R7                      ; 6F5A   0317

        DECLE   $010C,  $025D,  $000C,  $00CB   ; 6F5B   010C 025D 000C 00CB
        DECLE   $00C3,  $006E,  $03F8,  $032B   ; 6F5F   00C3 006E 03F8 032B
        DECLE   $030C,  $0001,  $0086,  $0218   ; 6F63   030C 0001 0086 0218
        DECLE   $0089,  $0000,  $0087,  $021C   ; 6F67   0089 0000 0087 021C
        DECLE   $010F,  $01B0,  $0292,  $0000   ; 6F6B   010F 01B0 0292 0000
        DECLE   $0114,  $0328,  $01CF,  $0394   ; 6F6F   0114 0328 01CF 0394
        DECLE   $0133,  $008B,  $0039,  $0025   ; 6F73   0133 008B 0039 0025
        DECLE   $034D,  $017C,  $01C1,  $00AD   ; 6F77   034D 017C 01C1 00AD
        DECLE   $0274,  $0094,  $021D           ; 6F7B   0274 0094 021D
L_6F7E:
        AND@    R2,     R1                      ; 6F7E   0391
        TSTR    R1                              ; 6F7F   0089
        ANDR    R4,     R5                      ; 6F80   01A5
        MVI@    R2,     R7                      ; 6F81   0297

        SARC    R0,     2                       ; 6F82   007C
        SUBR    R0,     R0                      ; 6F83   0100
        COMR    R6                              ; 6F84   001E
        AND@    R2,     R6                      ; 6F85   0396
        MVO@    R1,     R4                      ; 6F86   0261
        MVI@    R4,     R7                      ; 6F87   02A7

        DECLE   $00B9,  $01AB,  $00A0,  $0161   ; 6F88   00B9 01AB 00A0 0161
        DECLE   $0012,  $0206,  $027E,  $0249   ; 6F8C   0012 0206 027E 0249
        DECLE   $0134,  $0193,  $0051,  $012C   ; 6F90   0134 0193 0051 012C
        DECLE   $0248,  $003E,  $01C1,  $03B6   ; 6F94   0248 003E 01C1 03B6
        DECLE   $0291,  $0171,  $02A2,  $00A0   ; 6F98   0291 0171 02A2 00A0
        DECLE   $01E9,  $03B6,  $021B,  $026E   ; 6F9C   01E9 03B6 021B 026E
        DECLE   $0259,  $0235,  $033B,  $03F4   ; 6FA0   0259 0235 033B 03F4
        DECLE   $0225,  $02C8,  $0179,  $01E0   ; 6FA4   0225 02C8 0179 01E0
        DECLE   $0338,  $02B2,  $0131,  $0219   ; 6FA8   0338 02B2 0131 0219
        DECLE   $00BF,  $0159,  $0298,  $0309   ; 6FAC   00BF 0159 0298 0309
        DECLE   $02FE,  $0261,  $0195,  $010E   ; 6FB0   02FE 0261 0195 010E
        DECLE   $0237,  $0109,  $006F,  $00D4   ; 6FB4   0237 0109 006F 00D4
        DECLE   $0335,  $03A7,  $03D4,  $0123   ; 6FB8   0335 03A7 03D4 0123
        DECLE   $004F,  $02BE,  $037B,  $002E   ; 6FBC   004F 02BE 037B 002E
        DECLE   $02B4,  $0339,  $0321,  $03BE   ; 6FC0   02B4 0339 0321 03BE
        DECLE   $0230,  $0362,  $016F,  $012C   ; 6FC4   0230 0362 016F 012C
        DECLE   $02A9,  $0134,  $01ED,  $03F9   ; 6FC8   02A9 0134 01ED 03F9
        DECLE   $0024,  $010B,  $00B9,  $03B2   ; 6FCC   0024 010B 00B9 03B2
        DECLE   $03AF,  $0276,  $027C           ; 6FD0   03AF 0276 027C

        SUB@    R3,     R5                      ; 6FD3   031D
        MOVR    R1,     R7                      ; 6FD4   008F

        DECLE   $038F,  $02BF,  $0268,  $0379   ; 6FD5   038F 02BF 0268 0379
        DECLE   $0331,  $00A1,  $0111,  $0362   ; 6FD9   0331 00A1 0111 0362
        DECLE   $035D,  $021C,  $02C5,  $0333   ; 6FDD   035D 021C 02C5 0333
        DECLE   $01F9,  $0035,  $031A,  $004A   ; 6FE1   01F9 0035 031A 004A
        DECLE   $007B,  $0193,  $03AC,  $0335   ; 6FE5   007B 0193 03AC 0335
        DECLE   $0390,  $01C3,  $0000,  $0003   ; 6FE9   0390 01C3 0000 0003
        DECLE   $01F3,  $0038,  $0000,  $0003   ; 6FED   01F3 0038 0000 0003
        DECLE   $01FF,  $0038,  $0000,  $0004   ; 6FF1   01FF 0038 0000 0004
        DECLE   $02FE,  $03C4,  $021F           ; 6FF5   02FE 03C4 021F

        DIS                                     ; 6FF8   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6FFD   0000 0000 0000

        ORG     $D000
        DECLE   $0048,  $0318,  $0089,  $0000   ; D000   0048 0318 0089 0000

        MOVR    R1,     R0                      ; D004   0088
        AND@    R2,     R5                      ; D005   0395
        SUBR    R1,     R7                      ; D006   010F

        DECLE   $03C2,  $029A,  $020E,  $020E   ; D007   03C2 029A 020E 020E
        DECLE   $0212,  $0387,  $025C,  $00E0   ; D00B   0212 0387 025C 00E0
        DECLE   $0019,  $034A,  $03EC,  $0394   ; D00F   0019 034A 03EC 0394
        DECLE   $0260,  $0118,  $03AC,  $020D   ; D013   0260 0118 03AC 020D
        DECLE   $0357,  $013E,  $031A,  $031E   ; D017   0357 013E 031A 031E
        DECLE   $001C,  $0313,  $0388,  $019C   ; D01B   001C 0313 0388 019C
        DECLE   $00E8,  $0118,  $033A,  $009C   ; D01F   00E8 0118 033A 009C
        DECLE   $01DA,  $01C0,  $00F4,  $037E   ; D023   01DA 01C0 00F4 037E
        DECLE   $017F,  $01B7,  $038E,  $0190   ; D027   017F 01B7 038E 0190
        DECLE   $0000,  $010E,  $010A,  $030E   ; D02B   0000 010E 010A 030E
        DECLE   $03BC,  $03B4,  $0083,  $01C1   ; D02F   03BC 03B4 0083 01C1
        DECLE   $01D0,  $0090,  $0001,  $0060   ; D033   01D0 0090 0001 0060
        DECLE   $00C2,  $0380,  $0002,  $0137   ; D037   00C2 0380 0002 0137
        DECLE   $0004,  $0120,  $02C5,  $03F4   ; D03B   0004 0120 02C5 03F4
        DECLE   $0388,  $03ED,  $009B,  $000C   ; D03F   0388 03ED 009B 000C
        DECLE   $0290,  $0112,  $017A,  $03E6   ; D043   0290 0112 017A 03E6
        DECLE   $030E,  $0001                   ; D047   030E 0001

        ADCR    R7                              ; D049   002F

        SUB@    R3,     R0                      ; D04A   0318
L_D04B:
        SUBR    R1,     R1                      ; D04B   0109
        DECLE   $0001                           ; D04C   0001

        ADDR    R3,     R1                      ; D04D   00D9
        ADCR    R3                              ; D04E   002B
        SUBR    R2,     R7                      ; D04F   0117

        ANDI    #$0399, R6                      ; D050   03BE 0399
        MVO@    R6,     R3                      ; D052   025E
        BNEQ    L_D2E7                          ; D053   020C 0292
        MOVR    R0,     R7                      ; D055   0087

        CMPR    R3,     R5                      ; D056   015D
        XOR@    R3,     R5                      ; D057   03DD
        ADD@    R3,     R0                      ; D058   02D8
        SUBI    #$00EC, R2                      ; D059   033A 00EC
        ANDR    R2,     R4                      ; D05B   0194
        MVO@    R0,     R2                      ; D05C   0250
        ADDR    R2,     R0                      ; D05D   00D0
        CMPI    #$010C, R3                      ; D05E   037B 010C
        SUB@    R2,     R7                      ; D060   0317

        DECLE   $0158,  $01C9,  $0003,  $011C   ; D061   0158 01C9 0003 011C
        DECLE   $0014,  $021A,  $020C,  $038C   ; D065   0014 021A 020C 038C
        DECLE   $005E,  $0071,  $0380,  $0192   ; D069   005E 0071 0380 0192
        DECLE   $03F3,  $022B,  $00F6,  $0062   ; D06D   03F3 022B 00F6 0062
        DECLE   $0100,  $0315,  $037E,  $0289   ; D071   0100 0315 037E 0289
        DECLE   $03F4,  $003E,  $0007,  $0000   ; D075   03F4 003E 0007 0000
        DECLE   $00BA,  $0318,  $018C,  $020D   ; D079   00BA 0318 018C 020D

        SUBR    R2,     R3                      ; D07D   0113
        SLL     R3,     1                       ; D07E   004B
        PSHR    R2                              ; D07F   0272
        BGT     L_D2E8                          ; D080   020E 0266

        XOR@    R1,     R3                      ; D082   03CB
        ANDR    R2,     R4                      ; D083   0194
        MVII    #$02AB, R0                      ; D084   02B8 02AB
        SUBR    R4,     R7                      ; D086   0127

        DECLE   $0044,  $038F,  $00BF,  $018C   ; D087   0044 038F 00BF 018C
        DECLE   $0296,  $00A4,  $001F,  $0086   ; D08B   0296 00A4 001F 0086
        DECLE   $01F2,  $0395,  $02E1,  $01CC   ; D08F   01F2 0395 02E1 01CC
        DECLE   $0146,  $03FF,  $038B,  $00A3   ; D093   0146 03FF 038B 00A3
        DECLE   $006F,  $0276,  $022D           ; D097   006F 0276 022D

        ANDR    R2,     R4                      ; D09A   0194
        XOR@    R3,     R6                      ; D09B   03DE
        XOR@    R1,     R2                      ; D09C   03CA
        CMPR    R7,     R7                      ; D09D   017F
        SARC    R2,     1                       ; D09E   007A
        XOR@    R6,     R4                      ; D09F   03F4
        XOR     G_01D3, R2                      ; D0A0   03C2 01D3
        AND@    R1,     R5                      ; D0A2   038D
        AND@    R1,     R4                      ; D0A3   038C
        SUBR    R5,     R2                      ; D0A4   012A
        SUBR    R1,     R2                      ; D0A5   010A
        CMP@    R1,     R3                      ; D0A6   034B
        ADD@    R2,     R3                      ; D0A7   02D3
        ADDR    R3,     R7                      ; D0A8   00DF

        DECLE   $03F8,  $018E,  $0094,  $0363   ; D0A9   03F8 018E 0094 0363
        DECLE   $020B                           ; D0AD   020B

        XORI    #$01E1, R4                      ; D0AE   03FC 01E1
        ADDR    R1,     R7                      ; D0B0   00CF

        DECLE   $0099,  $0041,  $0239,  $0143   ; D0B1   0099 0041 0239 0143
        DECLE   $003F,  $0089,  $01A2,  $006A   ; D0B5   003F 0089 01A2 006A
        DECLE   $02AA,  $01A8,  $028A,  $01E5   ; D0B9   02AA 01A8 028A 01E5
        DECLE   $0202,  $0067,  $01EC,  $01C9   ; D0BD   0202 0067 01EC 01C9
        DECLE   $0001,  $00D9,  $0291,  $0248   ; D0C1   0001 00D9 0291 0248
        DECLE   $01DA,  $0313,  $0002,  $01D4   ; D0C5   01DA 0313 0002 01D4
        DECLE   $012E,  $0331,  $0394,  $0026   ; D0C9   012E 0331 0394 0026
        DECLE   $0005,  $0364,  $0038,  $0242   ; D0CD   0005 0364 0038 0242
        DECLE   $0341,  $006B,  $03FB,  $0069   ; D0D1   0341 006B 03FB 0069
        DECLE   $0248,  $021E                   ; D0D5   0248 021E

        ADDR    R6,     R1                      ; D0D7   00F1
        CMP@    R6,     R2                      ; D0D8   0372
        MVO@    R7,     R3                      ; D0D9   025F
        SUBR    R5,     R3                      ; D0DA   012B
        AND@    R6,     R3                      ; D0DB   03B3
        MVO@    R1,     R3                      ; D0DC   0259
        CMP     .STIC.EDGE,R3                   ; D0DD   0343 0032
        ADD@    R2,     R1                      ; D0DF   02D1
        MOVR    R3,     R7                      ; D0E0   009F

        COMR    R3                              ; D0E1   001B
        ANDR    R6,     R3                      ; D0E2   01B3
        SUBR    R5,     R1                      ; D0E3   0129
        CMPI    #$03DF, R0                      ; D0E4   0378 03DF
        B       L_D3F0                          ; D0E6   0200 0308

        DECLE   $01B1,  $0266,  $037D,  $0072   ; D0E8   01B1 0266 037D 0072
        DECLE   $0246,  $0190,  $0376,  $0374   ; D0EC   0246 0190 0376 0374
        DECLE   $015D,  $00EE,  $0373,  $025D   ; D0F0   015D 00EE 0373 025D
        DECLE   $0301,  $03E1,  $0230,  $0233   ; D0F4   0301 03E1 0230 0233

        RSWD    R4                              ; D0F8   003C
        CMPR    R6,     R3                      ; D0F9   0173
        XOR@    R4,     R5                      ; D0FA   03E5
        MVI@    R2,     R0                      ; D0FB   0290
        EIS                                     ; D0FC   0002
        MOVR    R4,     R6                      ; D0FD   00A6
        SUB@    R6,     R2                      ; D0FE   0332
        ADD@    R5,     R7                      ; D0FF   02EF

        DECLE   $037C,  $0333,  $02B9,  $0011   ; D100   037C 0333 02B9 0011
        DECLE   $011C,  $0291,  $02F9,  $03E0   ; D104   011C 0291 02F9 03E0
        DECLE   $01AE,  $0254,  $0339,  $02BA   ; D108   01AE 0254 0339 02BA
        DECLE   $019E,  $0230,  $02F8,  $03F1   ; D10C   019E 0230 02F8 03F1
        DECLE   $01BF,  $0299,  $0233,  $0037   ; D110   01BF 0299 0233 0037

        XOR@    R2,     R6                      ; D114   03D6
        NEGR    R2                              ; D115   0022
        SLL     R3,     2                       ; D116   004F
        CMPI    #$03A2, R4                      ; D117   037C 03A2
        SUBR    R5,     R5                      ; D119   012D
        MVI@    R2,     R4                      ; D11A   0294
        ADD@    R4,     R1                      ; D11B   02E1
        CMPR    R0,     R6                      ; D11C   0146
        MVI     G_0109, R2                      ; D11D   0282 0109
        CMP@    R6,     R2                      ; D11F   0372
        CMPR    R4,     R7                      ; D120   0167
        MVO@    R4,     R3                      ; D121   025C
        MVO@    R1,     R5                      ; D122   0269
        SUBR    R6,     R3                      ; D123   0133
        SUBR    R0,     R7                      ; D124   0107

        DECLE   $03F6,  $0325,  $030E,  $0379   ; D125   03F6 0325 030E 0379
        DECLE   $03EF,  $0225                   ; D129   03EF 0225

        PULR    R5                              ; D12B   02B5
        SUBR    R2,     R7                      ; D12C   0117

        DECLE   $001A,  $0300,  $0266,  $01F8   ; D12D   001A 0300 0266 01F8
        DECLE   $01CE,  $021D,  $0003,  $00B3   ; D131   01CE 021D 0003 00B3
        DECLE   $0310,  $030D,  $00CA,  $001B   ; D135   0310 030D 00CA 001B
        DECLE   $030B,  $00C0,  $02DC,  $01D8   ; D139   030B 00C0 02DC 01D8
        DECLE   $0212                           ; D13D   0212

        DECR    R0                              ; D13E   0010
        CMP     .STIC.X.3,R1                    ; D13F   0341 0003
        BESC    L_D395                          ; D141   020F 0252

        RRC     R0,     1                       ; D143   0070
        ADDI    #$0204, R7                      ; D144   02FF 0204

        DECLE   $02F9,  $00D2,  $002F,  $0188   ; D146   02F9 00D2 002F 0188
        DECLE   $0238,  $0295,  $01E6,  $0269   ; D14A   0238 0295 01E6 0269
        DECLE   $0284,  $02A6,  $0148,  $017E   ; D14E   0284 02A6 0148 017E
        DECLE   $016D,  $0343,  $0136,  $0147   ; D152   016D 0343 0136 0147
        DECLE   $0093,  $0068,  $00AB,  $0277   ; D156   0093 0068 00AB 0277
        DECLE   $03B1,  $029D,  $02A3,  $0051   ; D15A   03B1 029D 02A3 0051
        DECLE   $0236,  $0041,  $012C,  $00FE   ; D15E   0236 0041 012C 00FE
        DECLE   $000E,  $0008,  $0184,  $013D   ; D162   000E 0008 0184 013D
        DECLE   $00C6,  $008E,  $0009,  $0304   ; D166   00C6 008E 0009 0304
        DECLE   $0340,  $02B4,  $02D1,  $0060   ; D16A   0340 02B4 02D1 0060
        DECLE   $0009,  $0378,  $031C,  $01A5   ; D16E   0009 0378 031C 01A5
        DECLE   $03CE,  $0128,  $0238,  $0206   ; D172   03CE 0128 0238 0206
        DECLE   $03C4,  $0292,  $0252,  $001E   ; D176   03C4 0292 0252 001E
        DECLE   $001D,  $000C,  $0330,  $0257   ; D17A   001D 000C 0330 0257
        DECLE   $01C9,  $0005,  $007E,  $0260   ; D17E   01C9 0005 007E 0260
        DECLE   $00D3,  $03F4,  $0133,  $00FC   ; D182   00D3 03F4 0133 00FC
        DECLE   $0301,  $03DA,  $0189,  $0129   ; D186   0301 03DA 0189 0129
        DECLE   $00E8,  $03F0,  $0001,  $00EF   ; D18A   00E8 03F0 0001 00EF
        DECLE   $0328,  $02ED,  $0080,  $027F   ; D18E   0328 02ED 0080 027F
        DECLE   $00FF                           ; D192   00FF

        SUB@    R5,     R2                      ; D193   032A
        ADDR    R5,     R7                      ; D194   00EF

        DECLE   $03F0,  $0247,  $03A7,  $032B   ; D195   03F0 0247 03A7 032B
        DECLE   $00E3,  $0000                   ; D199   00E3 0000

        ANDR    R2,     R1                      ; D19B   0191
        AND@    R4,     R0                      ; D19C   03A0
        SUB@    R4,     R7                      ; D19D   0327

        DECLE   $01FF,  $0000,  $0278           ; D19E   01FF 0000 0278

        ADDR    R5,     R7                      ; D1A1   00EF

        SUB@    R4,     R4                      ; D1A2   0324
        XORI    #$0003, R0                      ; D1A3   03F8 0003
        SWAP    R0,     1                       ; D1A5   0040
        INCR    R0                              ; D1A6   0008
        ADDR    R5,     R0                      ; D1A7   00E8
        XORR    R7,     R2                      ; D1A8   01FA
        ANDR    R6,     R1                      ; D1A9   01B1
        ADDR    R3,     R6                      ; D1AA   00DE
        SUBR    R4,     R6                      ; D1AB   0126
        ANDR    R5,     R0                      ; D1AC   01A8
        ADCR    R4                              ; D1AD   002C
        ANDR    R0,     R6                      ; D1AE   0186
        CMP@    R2,     R4                      ; D1AF   0354
        ADDR    R2,     R2                      ; D1B0   00D2
        MOVR    R6,     R4                      ; D1B1   00B4
        XORR    R0,     R3                      ; D1B2   01C3
        ADDR    R2,     R4                      ; D1B3   00D4
        INCR    R2                              ; D1B4   000A
        ADD     G_01C9, R3                      ; D1B5   02C3 01C9
        SUBR    R4,     R7                      ; D1B7   0127

        DECLE   $0115,  $038F                   ; D1B8   0115 038F

        XORR    R1,     R3                      ; D1BA   01CB
        AND@    R5,     R0                      ; D1BB   03A8
        SUBR    R4,     R7                      ; D1BC   0127

        SUBR    R2,     R3                      ; D1BD   0113
        EIS                                     ; D1BE   0002
        B       L_D569                          ; D1BF   0200 03A8

        DECLE   $0329,  $012D,  $0000,  $023F   ; D1C1   0329 012D 0000 023F
        DECLE   $0077,  $0124,  $033B,  $0001   ; D1C5   0077 0124 033B 0001
        DECLE   $0381,  $00D0,  $0326,  $0027   ; D1C9   0381 00D0 0326 0027
        DECLE   $0000,  $0000,  $00F0,  $0326   ; D1CD   0000 0000 00F0 0326
        DECLE   $0035,  $0000,  $0000,  $0328   ; D1D1   0035 0000 0000 0328
        DECLE   $0269,  $02F6,  $0132,  $0022   ; D1D5   0269 02F6 0132 0022
        DECLE   $0187                           ; D1D9   0187

        CMPR    R4,     R1                      ; D1DA   0161
        ADD@    R4,     R4                      ; D1DB   02E4
        ANDR    R2,     R3                      ; D1DC   0193
        GSWD    R2                              ; D1DD   0032
        B       L_D504                          ; D1DE   0200 0324

        DECLE   $03CF,  $0192,  $03B6,  $0240   ; D1E0   03CF 0192 03B6 0240
        DECLE   $0303,  $003F,  $00E1,  $0000   ; D1E4   0303 003F 00E1 0000

        MOVR    R0,     R3                      ; D1E8   0083
        COMR    R0                              ; D1E9   0018
        XOR@    R1,     R5                      ; D1EA   03CD
        CMPR    R2,     R0                      ; D1EB   0150
        CLRR    R5                              ; D1EC   01ED
        SUBR    R0,     R5                      ; D1ED   0105
        AND@    R6,     R3                      ; D1EE   03B3
L_D1EF:
        COMR    R3                              ; D1EF   001B
        DECLE   $018E,  $026D,  $0194,  $013C   ; D1F0   018E 026D 0194 013C
        DECLE   $01CA,  $00FF,  $0268,  $037F   ; D1F4   01CA 00FF 0268 037F
        DECLE   $0100,  $0190,  $0298,  $010C   ; D1F8   0100 0190 0298 010C
        DECLE   $0126,  $0001                   ; D1FC   0126 0001

        CMPR    R0,     R5                      ; D1FE   0145
        MVI@    R2,     R3                      ; D1FF   0293
        SUB@    R3,     R7                      ; D200   031F

        CMP@    R4,     R0                      ; D201   0360
        MVI@    R1,     R6                      ; D202   028E
        ANDR    R2,     R4                      ; D203   0194
        ADDR    R1,     R4                      ; D204   00CC
        ADDR    R1,     R1                      ; D205   00C9
        ADDR    R5,     R0                      ; D206   00E8
        MVO@    R2,     R5                      ; D207   026A
        XORR    R6,     R0                      ; D208   01F0
        XOR@    R3,     R4                      ; D209   03DC
        XORR    R4,     R2                      ; D20A   01E2
        MVI@    R2,     R7                      ; D20B   0297

        DECLE   $030C,  $011A,  $020E,  $0349   ; D20C   030C 011A 020E 0349
        DECLE   $03C3,  $001B,  $00FA,  $002C   ; D210   03C3 001B 00FA 002C
        DECLE   $019D,  $015C,  $03C8,  $0130   ; D214   019D 015C 03C8 0130
        DECLE   $008C,  $038C,  $02D6,  $0022   ; D218   008C 038C 02D6 0022
        DECLE   $00E9,  $038D,  $00FE,  $021E   ; D21C   00E9 038D 00FE 021E

        CLRR    R1                              ; D220   01C9
        CMP@    R2,     R4                      ; D221   0354
L_D222:
        MOVR    R3,     R5                      ; D222   009D
        DECLE   $00EE,  $014D,  $0095,  $038D   ; D223   00EE 014D 0095 038D
        DECLE   $01C0,  $0020,  $0022,  $0128   ; D227   01C0 0020 0022 0128
        DECLE   $0098,  $03E1,  $0240,  $0100   ; D22B   0098 03E1 0240 0100
        DECLE   $0220                           ; D22F   0220

        SUB@    R6,     R7                      ; D230   0337
        MOVR    R3,     R7                      ; D231   009F

        DECLE   $0003,  $0000,  $0000,  $03E0   ; D232   0003 0000 0000 03E0
        DECLE   $02F0,  $01A0,  $006A,  $03C7   ; D236   02F0 01A0 006A 03C7
        DECLE   $0170,  $008C,  $03CA,  $03D7   ; D23A   0170 008C 03CA 03D7
        DECLE   $00D6,  $00C2,  $0025,  $001F   ; D23E   00D6 00C2 0025 001F
        DECLE   $0000,  $0008,  $0304,  $03E8   ; D242   0000 0008 0304 03E8
        DECLE   $0064,  $0020,  $038E,  $0000   ; D246   0064 0020 038E 0000
        DECLE   $012B,  $01F0,  $0265,  $00C0   ; D24A   012B 01F0 0265 00C0
        DECLE   $00FE,  $0048,  $0300,  $008A   ; D24E   00FE 0048 0300 008A
        DECLE   $01CD,  $00E2,  $021C,  $01C6   ; D252   01CD 00E2 021C 01C6
        DECLE   $0374,  $020E,  $0366,  $03EB   ; D256   0374 020E 0366 03EB
        DECLE   $00AC,  $003D,  $03C2,  $0023   ; D25A   00AC 003D 03C2 0023
        DECLE   $0140,  $0308,  $019F,  $01BE   ; D25E   0140 0308 019F 01BE
        DECLE   $0387,  $00D0,  $028A,  $03D9   ; D262   0387 00D0 028A 03D9
        DECLE   $03D4,  $013E,  $01A8,  $01C6   ; D266   03D4 013E 01A8 01C6
        DECLE   $021F,  $0003,  $0048,  $0210   ; D26A   021F 0003 0048 0210
        DECLE   $0148,  $0000,  $0034,  $039D   ; D26E   0148 0000 0034 039D
        DECLE   $01A6,  $001B,  $01A3,  $02B8   ; D272   01A6 001B 01A3 02B8
        DECLE   $000D,  $0228                   ; D276   000D 0228

        PSHR    R0                              ; D278   0270
        ANDR    R0,     R6                      ; D279   0186
        SARC    R3,     2                       ; D27A   007F
        SUB     G_01A5, R4                      ; D27B   0304 01A5
        ADDR    R4,     R0                      ; D27D   00E0
        CMPR    R4,     R6                      ; D27E   0166
        ADDR    R5,     R4                      ; D27F   00EC
        CMP     .BTAB.3B,R3                     ; D280   0343 023B
        MVO@    R1,     R1                      ; D282   0249
        RLC     R1,     1                       ; D283   0051
        RRC     R0,     1                       ; D284   0070
L_D285:
        MVI@    R5,     R7                      ; D285   02AF

        DECLE   $02B6,  $0361,  $031E,  $00A0   ; D286   02B6 0361 031E 00A0
        DECLE   $0231,  $01B7                   ; D28A   0231 01B7

        SUB     G_0340, R1                      ; D28C   0301 0340
        ANDI    #$038F, R0                      ; D28E   03B8 038F
        SUBR    R2,     R2                      ; D290   0112
        COMR    R0                              ; D291   0018
        SUB@    R3,     R3                      ; D292   031B
        BESC    L_D1EF                          ; D293   022F 00A5
        SUBR    R1,     R7                      ; D295   010F

        DECLE   $0080,  $00FD,  $03A2,  $01A0   ; D296   0080 00FD 03A2 01A0
        DECLE   $03EA,  $0069,  $0179,  $03EC   ; D29A   03EA 0069 0179 03EC
        DECLE   $039D,  $0356,  $00CE,  $03A6   ; D29E   039D 0356 00CE 03A6
        DECLE   $0115,  $00B4,  $03ED,  $02D2   ; D2A2   0115 00B4 03ED 02D2
        DECLE   $016C,  $0267,  $0292,  $0173   ; D2A6   016C 0267 0292 0173
        DECLE   $0232,  $0176,  $0371,  $02A5   ; D2AA   0232 0176 0371 02A5
        DECLE   $02FB,  $01C8,  $0000           ; D2AE   02FB 01C8 0000

        RRC     R2,     2                       ; D2B1   0076
L_D2B2:
        DECR    R7                              ; D2B2   0017
        SUB@    R1,     R7                      ; D2B3   030F

        DECLE   $0001                           ; D2B4   0001

        NEGR    R2                              ; D2B5   0022
        SUB@    R3,     R0                      ; D2B6   0318
        SUBR    R1,     R4                      ; D2B7   010C
        CMPR    R7,     R3                      ; D2B8   017B
        SUBR    R0,     R6                      ; D2B9   0106
        AND@    R1,     R1                      ; D2BA   0389
        SUB@    R4,     R2                      ; D2BB   0322
        CMP@    R3,     R6                      ; D2BC   035E
        XOR@    R4,     R6                      ; D2BD   03E6
        BNEQ    L_D222                          ; D2BE   022C 009D
        ADD@    R2,     R7                      ; D2C0   02D7

        SWAP    R1,     1                       ; D2C1   0041
        RSWD    R4                              ; D2C2   003C
        AND@    R4,     R0                      ; D2C3   03A0
        PULR    R7                              ; D2C4   02B7

        DECLE   $0198,  $005A,  $00CA,  $0130   ; D2C5   0198 005A 00CA 0130
        DECLE   $006A,  $0396,  $02C2,  $017B   ; D2C9   006A 0396 02C2 017B
        DECLE   $03AF,  $00FE,  $0012,  $0200   ; D2CD   03AF 00FE 0012 0200
        DECLE   $0221,  $03C5,  $0079,  $03DE   ; D2D1   0221 03C5 0079 03DE
        DECLE   $003F,  $0007,  $0000           ; D2D5   003F 0007 0000

        SLR     R1,     1                       ; D2D8   0061
        COMR    R0                              ; D2D9   0018
        SUB@    R1,     R5                      ; D2DA   030D
        SUBR    R6,     R6                      ; D2DB   0136
        BGT     L_D667                          ; D2DC   020E 0389

        ANDR    R6,     R3                      ; D2DE   01B3
        MVO@    R6,     R5                      ; D2DF   026E
        CMPR    R5,     R6                      ; D2E0   016E
        SLL     R1,     2                       ; D2E1   004D
        ANDR    R2,     R5                      ; D2E2   0195
        SAR     R2,     1                       ; D2E3   006A
        MOVR    R5,     R2                      ; D2E4   00AA
        SUBR    R5,     R0                      ; D2E5   0128
        SAR     R2,     1                       ; D2E6   006A
L_D2E7:
        XOR@    R4,     R2                      ; D2E7   03E2
L_D2E8:
        XORR    R2,     R5                      ; D2E8   01D5
        DECLE   $017F,  $03AE,  $0064,  $0000   ; D2E9   017F 03AE 0064 0000
        DECLE   $0070,  $03C7,  $020D,  $0366   ; D2ED   0070 03C7 020D 0366
        DECLE   $014C,  $0137,  $0005,  $0187   ; D2F1   014C 0137 0005 0187
        DECLE   $0332,  $02CE,  $03E8,  $0067   ; D2F5   0332 02CE 03E8 0067
        DECLE   $00AE,  $0375,  $0208,  $023C   ; D2F9   00AE 0375 0208 023C

        RSWD    R4                              ; D2FD   003C
L_D2FE:
        SUB@    R3,     R7                      ; D2FE   031F

        DECLE   $009E,  $03CB,  $024F,  $0223   ; D2FF   009E 03CB 024F 0223
        DECLE   $02E2,  $0217,  $009E,  $0003   ; D303   02E2 0217 009E 0003
        DECLE   $0201,  $0120,  $0000,  $0058   ; D307   0201 0120 0000 0058
        DECLE   $00AE,  $03F5,  $0040,  $0004   ; D30B   00AE 03F5 0040 0004
        DECLE   $0000,  $0330,  $009E,  $03FD   ; D30F   0000 0330 009E 03FD
        DECLE   $0386,  $01FF,  $0223,  $00C0   ; D313   0386 01FF 0223 00C0
        DECLE   $01A8,  $034A,  $0289,  $0088   ; D317   01A8 034A 0289 0088
        DECLE   $0258,  $03E3,  $0113,  $0163   ; D31B   0258 03E3 0113 0163
        DECLE   $00A1,  $03CD,  $0129,  $0115   ; D31F   00A1 03CD 0129 0115
        DECLE   $0342,  $0163,  $01DF,  $00EE   ; D323   0342 0163 01DF 00EE
        DECLE   $030C,  $00AC,  $00C1,  $007F   ; D327   030C 00AC 00C1 007F
        DECLE   $01FD,  $003E,  $03C7,  $01A1   ; D32B   01FD 003E 03C7 01A1
        DECLE   $002C,  $028C,  $006F,  $0256   ; D32F   002C 028C 006F 0256
        DECLE   $0394,  $0180,  $0180,  $0396   ; D333   0394 0180 0180 0396
        DECLE   $007D,  $000E,  $0000,  $006E   ; D337   007D 000E 0000 006E
        DECLE   $0318,  $018C,  $0149,  $0109   ; D33B   0318 018C 0149 0109
        DECLE   $0345,  $03E2,  $001B,  $008A   ; D33F   0345 03E2 001B 008A
        DECLE   $02ED,  $008C,  $038F           ; D343   02ED 008C 038F

        SWAP    R0,     1                       ; D346   0040
        J       L_61F7                          ; D347   0004 0360 01F7

L_D34A:
        ANDR    R3,     R1                      ; D34A   0199
        DECLE   $00CA,  $02C9,  $0168,  $0234   ; D34B   00CA 02C9 0168 0234
        DECLE   $0397,  $0242,  $0193,  $00A4   ; D34F   0397 0242 0193 00A4
        DECLE   $034D,  $0112,  $030D,  $0106   ; D353   034D 0112 030D 0106
        DECLE   $00D2,  $005D,  $0372,  $016B   ; D357   00D2 005D 0372 016B
        DECLE   $019D,  $02EA,  $01C7           ; D35B   019D 02EA 01C7

        MOVR    R3,     R0                      ; D35E   0098
        MVO@    R4,     R3                      ; D35F   025C
        AND@    R6,     R5                      ; D360   03B5
        MVO     R7,     G_01AF                  ; D361   0247 01AF
        AND@    R5,     R0                      ; D363   03A8
        ADD@    R1,     R4                      ; D364   02CC
        ADDR    R4,     R7                      ; D365   00E7

        DECLE   $000E,  $0189,  $0243,  $02BE   ; D366   000E 0189 0243 02BE
        DECLE   $00EE,  $00CE,  $0095,  $03C1   ; D36A   00EE 00CE 0095 03C1
        DECLE   $0040,  $031C,  $00A3,  $01B0   ; D36E   0040 031C 00A3 01B0
        DECLE   $01B8,  $03DA,  $00A6,  $00D0   ; D372   01B8 03DA 00A6 00D0
        DECLE   $0258,  $01BD,  $0242,  $010F   ; D376   0258 01BD 0242 010F
        DECLE   $02B9,  $03C8,  $0000           ; D37A   02B9 03C8 0000

        MOVR    R0,     R6                      ; D37D   0086
        MVI@    R3,     R1                      ; D37E   0299
        ADDR    R1,     R7                      ; D37F   00CF

        DECLE   $01BE,  $0213,  $0002,  $010E   ; D380   01BE 0213 0002 010E
        DECLE   $0338,  $02CF,  $0378,  $0223   ; D384   0338 02CF 0378 0223
        DECLE   $0000,  $0258,  $0224,  $015B   ; D388   0000 0258 0224 015B
        DECLE   $03D9,  $0049,  $0003,  $01C8   ; D38C   03D9 0049 0003 01C8
        DECLE   $0099,  $00BE,  $00C4,  $03CF   ; D390   0099 00BE 00C4 03CF

        XOR@    R6,     R5                      ; D394   03F5
L_D395:
        SUBR    R1,     R0                      ; D395   0108
        DECLE   $0000,  $00D5,  $03A7,  $0108   ; D396   0000 00D5 03A7 0108
        DECLE   $01E8,  $0112,  $0000,  $0188   ; D39A   01E8 0112 0000 0188
        DECLE   $0344,  $0131,  $03A9,  $00B3   ; D39E   0344 0131 03A9 00B3
        DECLE   $0380,  $001D,  $029C,  $0067   ; D3A2   0380 001D 029C 0067
        DECLE   $01F7,  $0038,  $0000           ; D3A6   01F7 0038 0000

        SLL     R1,     2                       ; D3A9   004D
        SUB@    R3,     R0                      ; D3AA   0318
        SUBR    R1,     R4                      ; D3AB   010C
        CMPR    R5,     R2                      ; D3AC   016A
        BOV     L_D735                          ; D3AD   0202 0386

        XORR    R0,     R2                      ; D3AF   01C2
        CMP@    R1,     R6                      ; D3B0   034E
        MVO@    R4,     R4                      ; D3B1   0264
        MOVR    R1,     R3                      ; D3B2   008B
        ANDR    R3,     R5                      ; D3B3   019D
        ADD@    R3,     R4                      ; D3B4   02DC
        CMP@    R1,     R2                      ; D3B5   034A
        SUBR    R5,     R7                      ; D3B6   012F

        DECLE   $005C,  $03DC,  $0119,  $017B   ; D3B7   005C 03DC 0119 017B
        DECLE   $03AC,  $010C,  $013B,  $00F4   ; D3BB   03AC 010C 013B 00F4
        DECLE   $0387                           ; D3BF   0387

        NEGR    R2                              ; D3C0   0022
        ADD@    R1,     R7                      ; D3C1   02CF

        DECLE   $02EE,  $026B,  $008D,  $03C3   ; D3C2   02EE 026B 008D 03C3
        DECLE   $0209,  $0220                   ; D3C6   0209 0220

        XOR@    R3,     R6                      ; D3C8   03DE
        SUBR    R3,     R0                      ; D3C9   0118
        ANDR    R3,     R6                      ; D3CA   019E
        MVO@    R0,     R5                      ; D3CB   0268
        AND@    R5,     R1                      ; D3CC   03A9
        SUBR    R5,     R7                      ; D3CD   012F

        DECLE   $006A,  $03D4,  $0288,  $018F   ; D3CE   006A 03D4 0288 018F
        DECLE   $03A5,  $02A4,  $02E5,  $0080   ; D3D2   03A5 02A4 02E5 0080
        DECLE   $0099,  $02F4,  $00ED,  $030D   ; D3D6   0099 02F4 00ED 030D
        DECLE   $014D,  $0003,  $0349,  $0393   ; D3DA   014D 0003 0349 0393
        DECLE   $005E,  $0174,  $008A,  $039D   ; D3DE   005E 0174 008A 039D
        DECLE   $03EB,  $0291,  $0002,  $01AA   ; D3E2   03EB 0291 0002 01AA
        DECLE   $034E,  $0211                   ; D3E6   034E 0211

        XOR@    R2,     R0                      ; D3E8   03D0
        SUBR    R4,     R4                      ; D3E9   0124
        DIS                                     ; D3EA   0003
        SUB@    R2,     R0                      ; D3EB   0310
        MVI@    R1,     R0                      ; D3EC   0288
        MVO@    R3,     R4                      ; D3ED   0263
        CMP@    R2,     R2                      ; D3EE   0352
        CMP@    R4,     R7                      ; D3EF   0367
L_D3F0:
        SUB     G_003B, R5                      ; D3F0   0305 003B
        SUBR    R7,     R0                      ; D3F2   0138
        ADDR    R1,     R7                      ; D3F3   00CF

        DECLE   $03EE,  $0070,  $0000           ; D3F4   03EE 0070 0000

        ANDR    R0,     R0                      ; D3F7   0180
        SUB@    R2,     R0                      ; D3F8   0310
        SUBR    R1,     R4                      ; D3F9   010C
        SUBR    R2,     R1                      ; D3FA   0111
        SUBR    R4,     R5                      ; D3FB   0125
        SUB     G_0051, R4                      ; D3FC   0304 0051
        SUB@    R3,     R7                      ; D3FE   031F

        XORR    R1,     R2                      ; D3FF   01CA
        ANDR    R0,     R6                      ; D400   0186
        PSHR    R1                              ; D401   0271
        BNC     L_D449                          ; D402   0209 0045

        SUB@    R6,     R0                      ; D404   0330
        SUBR    R5,     R7                      ; D405   012F

        DECLE   $012A,  $02D3,  $0230           ; D406   012A 02D3 0230

        CMP     G_03C2, R4                      ; D409   0344 03C2
        MVI@    R5,     R7                      ; D40B   02AF

        DECLE   $02D3,  $0272,  $0171,  $0096   ; D40C   02D3 0272 0171 0096
        DECLE   $02A0,  $03E9,  $02F5,  $034B   ; D410   02A0 03E9 02F5 034B
        DECLE   $015A,  $037A,  $0391,  $004F   ; D414   015A 037A 0391 004F
        DECLE   $016D,  $0340,  $039C,  $0349   ; D418   016D 0340 039C 0349
        DECLE   $0230,  $0318,  $02E9,  $0281   ; D41C   0230 0318 02E9 0281
        DECLE   $00A8,  $03ED,  $0049,  $0004   ; D420   00A8 03ED 0049 0004

        B       L_D285                          ; D424   0220 01A0

L_D426:
        CMP@    R1,     R6                      ; D426   034E
        DECLE   $00A4,  $0151,  $0006,  $038D   ; D427   00A4 0151 0006 038D
        DECLE   $0315,  $00D6,  $01ED,  $01B2   ; D42B   0315 00D6 01ED 01B2
        DECLE   $0084,  $020B,  $02C2,  $01E8   ; D42F   0084 020B 02C2 01E8
        DECLE   $0269,  $0116,  $0061,  $024A   ; D433   0269 0116 0061 024A
        DECLE   $0266,  $00D5,  $0091,  $0335   ; D437   0266 00D5 0091 0335
        DECLE   $0289,  $0098,  $0221,  $0281   ; D43B   0289 0098 0221 0281
        DECLE   $0333,  $0143,  $02CA,  $01C1   ; D43F   0333 0143 02CA 01C1
        DECLE   $00E0,  $000E,  $023A           ; D443   00E0 000E 023A

        SUB@    R3,     R2                      ; D446   031A
        CMPR    R0,     R3                      ; D447   0143
        NOP                                     ; D448   0034
L_D449:
        MVI@    R2,     R5                      ; D449   0295
        SUB@    R3,     R6                      ; D44A   031E
        ANDR    R7,     R1                      ; D44B   01B9
        TSTR    R5                              ; D44C   00AD
        XOR@    R1,     R5                      ; D44D   03CD
L_D44E:
        MOVR    R4,     R1                      ; D44E   00A1
        DECLE   $021B,  $010C,  $02BF,  $022C   ; D44F   021B 010C 02BF 022C
        DECLE   $02DA,  $03F2,  $000F,  $0240   ; D453   02DA 03F2 000F 0240
        DECLE   $01FB,  $0216                   ; D457   01FB 0216

        ADD@    R6,     R2                      ; D459   02F2
        INCR    R7                              ; D45A   000F

        RSWD    R0                              ; D45B   0038
L_D45C:
        MVO     R4,     .BTAB.EB                ; D45C   0244 02EB
        XORR    R0,     R6                      ; D45E   01C6
        MVO@    R5,     R1                      ; D45F   024D
        SUBR    R1,     R5                      ; D460   010D
        MVI@    R4,     R5                      ; D461   02A5
        ADD@    R3,     R7                      ; D462   02DF

        ANDR    R7,     R6                      ; D463   01BE
        SUBR    R5,     R2                      ; D464   012A
        ADD@    R6,     R3                      ; D465   02F3
        SUB@    R4,     R6                      ; D466   0326
        SWAP    R2,     2                       ; D467   0046
        XOR@    R2,     R2                      ; D468   03D2
        SUBR    R6,     R3                      ; D469   0133
        MVI@    R3,     R3                      ; D46A   029B
        PULR    R7                              ; D46B   02B7

        DECLE   $0169,  $0213,  $03C1,  $0011   ; D46C   0169 0213 03C1 0011
        DECLE   $027A,  $035D,  $034B,  $02B4   ; D470   027A 035D 034B 02B4
        DECLE   $0009,  $03E0,  $0038,  $034A   ; D474   0009 03E0 0038 034A
        DECLE   $03AE,  $00AD,  $0023,  $01C8   ; D478   03AE 00AD 0023 01C8
        DECLE   $0000,  $0022,  $01A0,  $00DC   ; D47C   0000 0022 01A0 00DC
        DECLE   $01A5,  $01F0,  $0202           ; D480   01A5 01F0 0202

        ANDR    R5,     R5                      ; D483   01AD
        DECR    R6                              ; D484   0016
        ADDR    R2,     R3                      ; D485   00D3
        SUB@    R5,     R7                      ; D486   032F

        DECLE   $0002,  $00F4,  $020E,  $02DA   ; D487   0002 00F4 020E 02DA
        DECLE   $0229,  $0067,  $01F7,  $0069   ; D48B   0229 0067 01F7 0069
        DECLE   $0268,  $01F2,  $03E1,  $000D   ; D48F   0268 01F2 03E1 000D
        DECLE   $0234,  $0349,  $0038,  $013D   ; D493   0234 0349 0038 013D
        DECLE   $0239,  $0172,  $01D0,  $0211   ; D497   0239 0172 01D0 0211
        DECLE   $0000,  $000E,  $0326,  $034D   ; D49B   0000 000E 0326 034D
        DECLE   $0002,  $0300,  $00D2,  $000B   ; D49F   0002 0300 00D2 000B
        DECLE   $0078,  $002B,  $01ED,  $0020   ; D4A3   0078 002B 01ED 0020
        DECLE   $0019,  $0323,  $0003,  $009C   ; D4A7   0019 0323 0003 009C
        DECLE   $0218,  $02BE,  $0169,  $0194   ; D4AB   0218 02BE 0169 0194
        DECLE   $0282,  $03E1,  $03A5,  $0059   ; D4AF   0282 03E1 03A5 0059
        DECLE   $034A,  $02D8,  $0349,  $03D1   ; D4B3   034A 02D8 0349 03D1
        DECLE   $0018,  $03C5,  $002C,  $00AD   ; D4B7   0018 03C5 002C 00AD
        DECLE   $03BF,  $0078,  $02E0,  $035F   ; D4BB   03BF 0078 02E0 035F
        DECLE   $00A1,  $03E3,  $000F,  $0020   ; D4BF   00A1 03E3 000F 0020
        DECLE   $0000,  $00B0,  $001F,  $0000   ; D4C3   0000 00B0 001F 0000
        DECLE   $0000,  $00C2,  $01A7,  $0168   ; D4C7   0000 00C2 01A7 0168
        DECLE   $0264,  $01F0,  $0202,  $03FD   ; D4CB   0264 01F0 0202 03FD
        DECLE   $0217,  $00DA,  $00AE,  $0122   ; D4CF   0217 00DA 00AE 0122
        DECLE   $00D8,  $0304,  $01F5,  $010B   ; D4D3   00D8 0304 01F5 010B
        DECLE   $0267,  $0077,  $0041,  $026C   ; D4D7   0267 0077 0041 026C
        DECLE   $0086,  $00F5,  $02C4,  $0336   ; D4DB   0086 00F5 02C4 0336
        DECLE   $0249,  $0030,  $0134,  $02BC   ; D4DF   0249 0030 0134 02BC
        DECLE   $0237,  $0381,  $0399,  $0133   ; D4E3   0237 0381 0399 0133
        DECLE   $0238,  $020C,  $01BE,  $0099   ; D4E7   0238 020C 01BE 0099
        DECLE   $02AD,  $03E5,  $0001,  $0132   ; D4EB   02AD 03E5 0001 0132
        DECLE   $0378,  $03F4,  $018C,  $009E   ; D4EF   0378 03F4 018C 009E
        DECLE   $021B,  $014A,  $01BF,  $023C   ; D4F3   021B 014A 01BF 023C
        DECLE   $0358,  $00E6,  $0051,  $027F   ; D4F7   0358 00E6 0051 027F
        DECLE   $01E4,  $00F6,  $0035,  $00C8   ; D4FB   01E4 00F6 0035 00C8
        DECLE   $0069,  $0040,  $00E1,  $0200   ; D4FF   0069 0040 00E1 0200
        DECLE   $01BB                           ; D503   01BB
L_D504:
        ADD@    R2,     R3                      ; D504   02D3
        DECLE   $0129,  $0344,  $00C2,  $00B4   ; D505   0129 0344 00C2 00B4
        DECLE   $028B,  $0257,  $0169,  $0395   ; D509   028B 0257 0169 0395
        DECLE   $01C1,  $0239,  $01F1,  $0001   ; D50D   01C1 0239 01F1 0001
        DECLE   $0161,  $0082,  $030A,  $0007   ; D511   0161 0082 030A 0007
        DECLE   $0184,  $0123,  $0042,  $000E   ; D515   0184 0123 0042 000E
        DECLE   $0239,  $02C7,  $015F,  $00A6   ; D519   0239 02C7 015F 00A6
        DECLE   $0002,  $0038,  $00F5,  $0120   ; D51D   0002 0038 00F5 0120
        DECLE   $00BE,  $0000,  $0000,  $00B9   ; D521   00BE 0000 0000 00B9
        DECLE   $0341,  $009C,  $010D,  $0212   ; D525   0341 009C 010D 0212
        DECLE   $0030,  $0329,  $01B0,  $019D   ; D529   0030 0329 01B0 019D
        DECLE   $0358,  $01A6,  $0128,  $039A   ; D52D   0358 01A6 0128 039A
        DECLE   $0356,  $0203,  $00CC,  $02A5   ; D531   0356 0203 00CC 02A5
        DECLE   $0193,  $00B0,  $010D,  $01C3   ; D535   0193 00B0 010D 01C3
        DECLE   $012E,  $0267,  $03B2,  $0069   ; D539   012E 0267 03B2 0069
        DECLE   $0048,  $02E3,  $0255,  $0060   ; D53D   0048 02E3 0255 0060
        DECLE   $0232,  $0039,  $0095,  $0119   ; D541   0232 0039 0095 0119
        DECLE   $02C3,  $0270,  $035A,  $0399   ; D545   02C3 0270 035A 0399
        DECLE   $0253,  $0048,  $0396,  $0181   ; D549   0253 0048 0396 0181
        DECLE   $0257,  $02A1,  $01A4,  $0008   ; D54D   0257 02A1 01A4 0008
        DECLE   $0390,  $00B0,  $0200,  $03CC   ; D551   0390 00B0 0200 03CC
        DECLE   $0171,  $001A,  $034B,  $0080   ; D555   0171 001A 034B 0080
        DECLE   $021C,  $015A,  $03E6,  $02CC   ; D559   021C 015A 03E6 02CC
        DECLE   $0284,  $01A5,  $03C8,  $00A5   ; D55D   0284 01A5 03C8 00A5
        DECLE   $00B2,  $0153,  $0371,  $0088   ; D561   00B2 0153 0371 0088
        DECLE   $00D2,  $0334,  $0082,  $0236   ; D565   00D2 0334 0082 0236
L_D569:
        SARC    R1,     1                       ; D569   0079
        DECLE   $033E,  $0161,  $01B1,  $0191   ; D56A   033E 0161 01B1 0191
        DECLE   $0207,  $0321,  $0038,  $00D9   ; D56E   0207 0321 0038 00D9
        DECLE   $0212,  $002C,  $0308,  $01A2   ; D572   0212 002C 0308 01A2
        DECLE   $030D,  $0001                   ; D576   030D 0001

        RLC     R1,     2                       ; D578   0055
        COMR    R0                              ; D579   0018
        CMPR    R1,     R5                      ; D57A   014D
        XORR    R0,     R6                      ; D57B   01C6
        XORR    R7,     R0                      ; D57C   01F8
        XOR@    R1,     R1                      ; D57D   03C9
        XOR@    R6,     R3                      ; D57E   03F3
        CMP@    R5,     R6                      ; D57F   036E
        ADD@    R4,     R6                      ; D580   02E6
        ADD@    R5,     R5                      ; D581   02ED
        ANDR    R2,     R4                      ; D582   0194
        ADDR    R3,     R0                      ; D583   00D8
        ADD@    R5,     R4                      ; D584   02EC
        SUBR    R5,     R7                      ; D585   012F

        DECLE   $0268,  $03E0,  $0119,  $0183   ; D586   0268 03E0 0119 0183
        DECLE   $03A0,  $014C,  $0186,  $03F6   ; D58A   03A0 014C 0186 03F6
        DECLE   $0186,  $03D3,  $03FC,  $017B   ; D58E   0186 03D3 03FC 017B
        DECLE   $006B,  $03F5,  $0221,  $0392   ; D592   006B 03F5 0221 0392
        DECLE   $0000,  $0112,  $001E,  $034E   ; D596   0000 0112 001E 034E
        DECLE   $0002,  $021E,  $0100,  $02D3   ; D59A   0002 021E 0100 02D3
        DECLE   $0344,  $0185,  $0393,  $00B7   ; D59E   0344 0185 0393 00B7

        MOVR    R7,     R3                      ; D5A2   00BB
        MVI@    R2,     R5                      ; D5A3   0295
        ANDI    #$0322, R1                      ; D5A4   03B9 0322
        ADDR    R4,     R2                      ; D5A6   00E2
        XOR@    R1,     R2                      ; D5A7   03CA
        SUB@    R3,     R1                      ; D5A8   0319
        CMPR    R4,     R1                      ; D5A9   0161
L_D5AA:
        SUBR    R7,     R2                      ; D5AA   013A
        DECLE   $02D2,  $0071,  $0247,  $038B   ; D5AB   02D2 0071 0247 038B
        DECLE   $0150,  $00F2,  $038E,  $0000   ; D5AF   0150 00F2 038E 0000
        DECLE   $03C8,  $0330,  $019C,  $0352   ; D5B3   03C8 0330 019C 0352
        DECLE   $03E0,  $03D8,  $03D1,  $002D   ; D5B7   03E0 03D8 03D1 002D
        DECLE   $019D,  $015E,  $02C9,  $0111   ; D5BB   019D 015E 02C9 0111
        DECLE   $0218                           ; D5BF   0218

        XOR@    R3,     R6                      ; D5C0   03DE
        SUB@    R1,     R7                      ; D5C1   030F

        DECLE   $008A,  $001F,  $0090,  $01F3   ; D5C2   008A 001F 0090 01F3
        DECLE   $0078,  $02C5,  $0200,  $0275   ; D5C6   0078 02C5 0200 0275
        DECLE   $0049,  $03DC,  $00E1,  $0000   ; D5CA   0049 03DC 00E1 0000
        DECLE   $00B5,  $0018,  $030D,  $011E   ; D5CE   00B5 0018 030D 011E
        DECLE   $020F,  $0389,  $0023,  $03DF   ; D5D2   020F 0389 0023 03DF

        CMP@    R4,     R2                      ; D5D6   0362
        ADCR    R3                              ; D5D7   002B
        MOVR    R2,     R5                      ; D5D8   0095
        SUB     G_01C0, R7                      ; D5D9   0307 01C0

        DECLE   $0100,  $01C0,  $02F0,  $0098   ; D5DB   0100 01C0 02F0 0098
        DECLE   $034D,  $01C7                   ; D5DF   034D 01C7

        SUB@    R3,     R4                      ; D5E1   031C
        SWAP    R1,     2                       ; D5E2   0045
        ADDI    #$01A0, R0                      ; D5E3   02F8 01A0
        MVO@    R2,     R5                      ; D5E5   026A
        XORR    R4,     R6                      ; D5E6   01E6
        SUBR    R4,     R0                      ; D5E7   0120
        SARC    R2,     1                       ; D5E8   007A
        XORR    R4,     R1                      ; D5E9   01E1
        MOVR    R3,     R2                      ; D5EA   009A
        CMPR    R6,     R7                      ; D5EB   0177
        MVI@    R4,     R5                      ; D5EC   02A5
        XOR@    R1,     R5                      ; D5ED   03CD
        MOVR    R6,     R2                      ; D5EE   00B2
        SUB@    R1,     R7                      ; D5EF   030F

        SUB@    R1,     R0                      ; D5F0   0308
        RLC     R3,     1                       ; D5F1   0053
L_D5F2:
        MVO@    R6,     R5                      ; D5F2   026E
        XORR    R5,     R0                      ; D5F3   01E8
        SUBR    R1,     R3                      ; D5F4   010B
        ANDR    R5,     R5                      ; D5F5   01AD
        XORR    R5,     R0                      ; D5F6   01E8
        ANDR    R4,     R5                      ; D5F7   01A5
        SUBR    R4,     R0                      ; D5F8   0120
        SARC    R2,     1                       ; D5F9   007A
L_D5FA:
        ANDR    R7,     R5                      ; D5FA   01BD
        DECLE   $0209,  $0167,  $00A9,  $0065   ; D5FB   0209 0167 00A9 0065
        DECLE   $00E2,  $000E,  $0049,  $001F   ; D5FF   00E2 000E 0049 001F
        DECLE   $03E1,  $034C,  $00D6,  $0113   ; D603   03E1 034C 00D6 0113
        DECLE   $0184,  $0354,  $02EE,  $00F0   ; D607   0184 0354 02EE 00F0
        DECLE   $008B,  $01B5,  $0038,  $0186   ; D60B   008B 01B5 0038 0186
        DECLE   $00D0,  $028A,  $03CE,  $0245   ; D60F   00D0 028A 03CE 0245
        DECLE   $0167,  $01A2,  $038D,  $010C   ; D613   0167 01A2 038D 010C
        DECLE   $010C,  $0342,  $0093,  $030E   ; D617   010C 0342 0093 030E
        DECLE   $0083,  $002B,  $00CD,  $01EC   ; D61B   0083 002B 00CD 01EC
        DECLE   $031A,  $026C,  $0008,  $0292   ; D61F   031A 026C 0008 0292
        DECLE   $0388,  $0359,  $01D0,  $0306   ; D623   0388 0359 01D0 0306
        DECLE   $033D,  $02B8,  $0390,  $0250   ; D627   033D 02B8 0390 0250
        DECLE   $0090,  $032C,  $0300,  $0257   ; D62B   0090 032C 0300 0257
        DECLE   $0166,  $029A,  $0235,  $021E   ; D62F   0166 029A 0235 021E
        DECLE   $020D,  $0224,  $03FF           ; D633   020D 0224 03FF

        XOR     G_019A, R1                      ; D636   03C1 019A
        CMPR    R3,     R2                      ; D638   015A
        SLLC    R2,     2                       ; D639   005E
        INCR    R7                              ; D63A   000F

        MVO@    R0,     R1                      ; D63B   0248
L_D63C:
        SUBI    #$0150, R0                      ; D63C   0338 0150
        DECLE   $0363,  $009C,  $01CC,  $0251   ; D63E   0363 009C 01CC 0251
        DECLE   $00D4,  $0329,  $0203,  $03A7   ; D642   00D4 0329 0203 03A7
        DECLE   $014A,  $029B,  $01AC,  $022C   ; D646   014A 029B 01AC 022C
        DECLE   $0292,  $0206,  $013E,  $02BD   ; D64A   0292 0206 013E 02BD
        DECLE   $02D5,  $034A,  $027C,  $03CF   ; D64E   02D5 034A 027C 03CF

        XORR    R2,     R0                      ; D652   01D0
        ADDR    R7,     R0                      ; D653   00F8
        XOR@    R6,     R0                      ; D654   03F0
        SUB@    R6,     R2                      ; D655   0332
        SUBI    #$0340, R5                      ; D656   033D 0340
        MVI@    R3,     R2                      ; D658   029A
        BGE     L_D44E                          ; D659   022D 020C

        SUB@    R2,     R2                      ; D65B   0312
        BUSC    L_D2FE                          ; D65C   0227 035F

        ADDR    R0,     R5                      ; D65E   00C5
        AND@    R3,     R3                      ; D65F   039B
        SUB@    R5,     R1                      ; D660   0329
        ADD@    R3,     R0                      ; D661   02D8
        CMPR    R2,     R3                      ; D662   0153
        PSHR    R0                              ; D663   0270
        ADDR    R7,     R4                      ; D664   00FC
        XOR@    R6,     R3                      ; D665   03F3
        ADCR    R5                              ; D666   002D
L_D667:
        SUB@    R6,     R7                      ; D667   0337

        CMPR    R0,     R4                      ; D668   0144
        AND@    R3,     R2                      ; D669   039A
        PULR    R6                              ; D66A   02B6
        INCR    R2                              ; D66B   000A
        SUB@    R2,     R3                      ; D66C   0313
        MVO@    R7,     R4                      ; D66D   0267
        ADDR    R3,     R6                      ; D66E   00DE
        XORR    R5,     R1                      ; D66F   01E9
        ADD@    R2,     R4                      ; D670   02D4
        SUBI    #$00B0, R2                      ; D671   033A 00B0
        CMPR    R3,     R1                      ; D673   0159
        MVO@    R0,     R2                      ; D674   0250
        ADDR    R2,     R4                      ; D675   00D4
L_D676:
        ANDI    #$0088, R4                      ; D676   03BC 0088
        DECLE   $026F,  $015C,  $0219,  $03C4   ; D678   026F 015C 0219 03C4
        DECLE   $020A,  $030E,  $0167,  $015E   ; D67C   020A 030E 0167 015E
        DECLE   $03E0,  $0051,  $021B,  $0003   ; D680   03E0 0051 021B 0003
        DECLE   $00BA,  $0218                   ; D684   00BA 0218

        XORR    R1,     R4                      ; D686   01CC
        ADDR    R2,     R2                      ; D687   00D2
        SUBR    R2,     R5                      ; D688   0115
        CMPR    R1,     R1                      ; D689   0149
        ADDR    R0,     R3                      ; D68A   00C3
        MOVR    R3,     R7                      ; D68B   009F

        ADD@    R6,     R4                      ; D68C   02F4
        SUBR    R1,     R7                      ; D68D   010F

        DECLE   $00A4,  $030D,  $027F,  $0003   ; D68E   00A4 030D 027F 0003
        DECLE   $005E,  $01F1,  $01B0,  $03DE   ; D692   005E 01F1 01B0 03DE
        DECLE   $00A4,  $00F0,  $026A,  $03DE   ; D696   00A4 00F0 026A 03DE
        DECLE   $0285,  $018B,  $039A,  $03CD   ; D69A   0285 018B 039A 03CD
        DECLE   $008A,  $03FF                   ; D69E   008A 03FF

        CMPR    R0,     R7                      ; D6A0   0147
        ADDR    R0,     R3                      ; D6A1   00C3
        SARC    R2,     2                       ; D6A2   007E
        CMPR    R6,     R6                      ; D6A3   0176
        CMPR    R5,     R2                      ; D6A4   016A
        XORR    R0,     R5                      ; D6A5   01C5
        ADDR    R3,     R6                      ; D6A6   00DE
        XOR     G_013F, R4                      ; D6A7   03C4 013F
        SARC    R2,     1                       ; D6A9   007A
        XORR    R1,     R3                      ; D6AA   01CB
        BLE     L_D7DC                          ; D6AB   0206 012F

        ANDR    R6,     R3                      ; D6AD   01B3
        AND@    R1,     R6                      ; D6AE   038E
        MOVR    R1,     R2                      ; D6AF   008A
        SUB     G_0349, R6                      ; D6B0   0306 0349
        ADDR    R0,     R3                      ; D6B2   00C3
        MOVR    R1,     R5                      ; D6B3   008D
        PSHR    R4                              ; D6B4   0274
        ANDR    R5,     R1                      ; D6B5   01A9
        TSTR    R5                              ; D6B6   00AD
        SLLC    R3,     2                       ; D6B7   005F
        AND     G_03EB, R1                      ; D6B8   0381 03EB
        ADD@    R4,     R7                      ; D6BA   02E7

        DECLE   $0047,  $01B6,  $02CC,  $03C4   ; D6BB   0047 01B6 02CC 03C4
        DECLE   $00D7,  $025C,  $01E9,  $0212   ; D6BF   00D7 025C 01E9 0212
        DECLE   $0173,  $039E,  $014C,  $018D   ; D6C3   0173 039E 014C 018D
        DECLE   $0205,  $0306,  $00B2,  $038E   ; D6C7   0205 0306 00B2 038E
        DECLE   $007F,  $01EE,  $009C,  $0145   ; D6CB   007F 01EE 009C 0145
        DECLE   $03C0,  $0127,  $0243,  $01FA   ; D6CF   03C0 0127 0243 01FA
        DECLE   $01B0,  $016A,  $01E5,  $0170   ; D6D3   01B0 016A 01E5 0170
        DECLE   $0244,  $01DD,  $024B,  $019F   ; D6D7   0244 01DD 024B 019F
        DECLE   $0397                           ; D6DB   0397

        XORR    R1,     R5                      ; D6DC   01CD
        MOVR    R4,     R3                      ; D6DD   00A3
        INCR    R5                              ; D6DE   000D
        SUB     G_03B2, R7                      ; D6DF   0307 03B2

        DECLE   $008E,  $01F4,  $0209,  $01BD   ; D6E1   008E 01F4 0209 01BD
        DECLE   $016A,  $01C4,  $0128,  $0056   ; D6E5   016A 01C4 0128 0056
        DECLE   $01DE,  $01C8,  $0137,  $02B4   ; D6E9   01DE 01C8 0137 02B4
        DECLE   $0026,  $001F,  $008E,  $0000   ; D6ED   0026 001F 008E 0000
        DECLE   $01E7,  $03E9,  $02A5,  $0005   ; D6F1   01E7 03E9 02A5 0005
        DECLE   $01F2,  $0010,  $010D,  $03F9   ; D6F5   01F2 0010 010D 03F9
        DECLE   $030C,  $008A,  $0202,  $0143   ; D6F9   030C 008A 0202 0143
        DECLE   $02D2,  $03EE,  $0379,  $022A   ; D6FD   02D2 03EE 0379 022A
        DECLE   $01A5,  $03CA,  $0343,  $0077   ; D701   01A5 03CA 0343 0077
        DECLE   $024C,  $01D4,  $037A,  $0113   ; D705   024C 01D4 037A 0113
        DECLE   $02BB,  $03CD,  $009A,  $010E   ; D709   02BB 03CD 009A 010E
        DECLE   $0385,  $02D2,  $00DE,  $00F0   ; D70D   0385 02D2 00DE 00F0
        DECLE   $014B,  $01BD,  $03DE,  $01A4   ; D711   014B 01BD 03DE 01A4
        DECLE   $00A8,  $005E,  $01DE,  $0249   ; D715   00A8 005E 01DE 0249
        DECLE   $01E3,  $03A0,  $01A4,  $0003   ; D719   01E3 03A0 01A4 0003
        DECLE   $0390,  $0031,  $0207,  $00F0   ; D71D   0390 0031 0207 00F0
        DECLE   $03E5,  $0024,  $0000,  $000F   ; D721   03E5 0024 0000 000F
        DECLE   $000A,  $0206,  $02A4,  $00E4   ; D725   000A 0206 02A4 00E4
        DECLE   $000E,  $0008,  $001D,  $03FF   ; D729   000E 0008 001D 03FF
        DECLE   $0264,  $0023,  $000E,  $03C0   ; D72D   0264 0023 000E 03C0
        DECLE   $021D,  $010E,  $0048,  $0000   ; D731   021D 010E 0048 0000
L_D735:
        SLR     R3,     2                       ; D735   0067
        DECLE   $0005,  $01E7,  $03F2,  $0059   ; D736   0005 01E7 03F2 0059
        DECLE   $0240,  $0390,  $0211,  $01C3   ; D73A   0240 0390 0211 01C3
        DECLE   $0000,  $0190,  $0010,  $030D   ; D73E   0000 0190 0010 030D
        DECLE   $01B0,  $00FF,  $00CD,  $03BE   ; D742   01B0 00FF 00CD 03BE
        DECLE   $0059,  $018C,  $00E6,  $00B5   ; D746   0059 018C 00E6 00B5
        DECLE   $0209,  $00C5                   ; D74A   0209 00C5

        XORI    #$017E, R0                      ; D74C   03F8 017E
        CMPR    R5,     R0                      ; D74E   0168
        CMP@    R6,     R3                      ; D74F   0373
        SLL     R1,     2                       ; D750   004D
        SUBR    R0,     R7                      ; D751   0107

        DECLE   $0063,  $0234                   ; D752   0063 0234

        ADD     .BTAB.74,R3                     ; D754   02C3 0274
        ANDR    R0,     R4                      ; D756   0184
        ADDR    R4,     R3                      ; D757   00E3
        RRC     R0,     1                       ; D758   0070
        SDBD                                    ; D759   0001
        MVI@    R4,     R0                      ; D75A   02A0
        SUB@    R4,     R4                      ; D75B   0324
        SUB@    R4,     R7                      ; D75C   0327

        DECLE   $007F,  $0286,  $0280,  $0004   ; D75D   007F 0286 0280 0004
        DECLE   $0100,  $0382,  $0181,  $02A0   ; D761   0100 0382 0181 02A0
        DECLE   $0064,  $01E0,  $0000,  $0000   ; D765   0064 01E0 0000 0000
        DECLE   $0280,  $00A4,  $0324,  $0091   ; D769   0280 00A4 0324 0091
        DECLE   $0270,  $0283,  $0154,  $03E0   ; D76D   0270 0283 0154 03E0
        DECLE   $001F,  $01EF,  $0281,  $03A1   ; D771   001F 01EF 0281 03A1
        DECLE   $0324,  $0163,  $0079,  $0236   ; D775   0324 0163 0079 0236

        SLL     R1,     1                       ; D779   0049
        CMP@    R1,     R3                      ; D77A   034B
        ANDI    #$0352, R4                      ; D77B   03BC 0352
        ADD     G_003C, R1                      ; D77D   02C1 003C
        SUB@    R3,     R1                      ; D77F   0319
        COMR    R1                              ; D780   0019
        ANDR    R3,     R6                      ; D781   019E
        CMPR    R1,     R6                      ; D782   014E
        MVO@    R1,     R5                      ; D783   0269
        CMPR    R6,     R0                      ; D784   0170
        BEQ     L_D5F2                          ; D785   0224 0194

        XOR@    R1,     R5                      ; D787   03CD
L_D788:
        MVO@    R2,     R2                      ; D788   0252
        DECLE   $021D,  $00E7,  $03D6,  $0162   ; D789   021D 00E7 03D6 0162
        DECLE   $00D3,  $029D,  $0034,  $00AC   ; D78D   00D3 029D 0034 00AC
        DECLE   $00FC,  $03E5,  $0148,  $0129   ; D791   00FC 03E5 0148 0129
        DECLE   $0109,  $0100,  $0000,  $0008   ; D795   0109 0100 0000 0008
        DECLE   $0328,  $010A,  $0022,  $0240   ; D799   0328 010A 0022 0240
        DECLE   $0007,  $0128,  $00DD,  $035E   ; D79D   0007 0128 00DD 035E
        DECLE   $0346,  $00E9,  $0326,  $0003   ; D7A1   0346 00E9 0326 0003
        DECLE   $0020,  $01F8,  $03A9,  $0267   ; D7A5   0020 01F8 03A9 0267
        DECLE   $00DA,  $00F2,  $007A,  $0283   ; D7A9   00DA 00F2 007A 0283
        DECLE   $0071,  $0267,  $0333,  $007E   ; D7AD   0071 0267 0333 007E
        DECLE   $0055,  $013E,  $0341,  $03B9   ; D7B1   0055 013E 0341 03B9
        DECLE   $0152,  $004A,  $003E,  $00E0   ; D7B5   0152 004A 003E 00E0
        DECLE   $0000                           ; D7B9   0000

        XORR    R5,     R4                      ; D7BA   01EC
        SLL     R2,     1                       ; D7BB   004A

        JSR     R4,     .EXEC.FF0               ; D7BC   0004 001C 03F0
        DECLE   $0207,  $024A,  $003D,  $0000   ; D7BF   0207 024A 003D 0000
        DECLE   $039E,  $0037,  $031A,  $0246   ; D7C3   039E 0037 031A 0246
        DECLE   $023A,  $031A,  $037F,  $03FA   ; D7C7   023A 031A 037F 03FA
        DECLE   $00BC,  $014D,  $0146,  $001F   ; D7CB   00BC 014D 0146 001F
        DECLE   $038D,  $02BF                   ; D7CF   038D 02BF

        ADDR    R7,     R4                      ; D7D1   00FC
        CMPR    R4,     R6                      ; D7D2   0166
        MVI@    R4,     R6                      ; D7D3   02A6
        MVI@    R3,     R1                      ; D7D4   0299
        MVI@    R1,     R7                      ; D7D5   028F

        DECLE   $03E7,  $01E7                   ; D7D6   03E7 01E7

        SUBR    R7,     R6                      ; D7D8   013E
        ADDR    R5,     R3                      ; D7D9   00EB
        CMPR    R5,     R1                      ; D7DA   0169
        RSWD    R0                              ; D7DB   0038
L_D7DC:
        SUBR    R0,     R0                      ; D7DC   0100
        SUBR    R2,     R2                      ; D7DD   0112
        ADDR    R0,     R4                      ; D7DE   00C4
        CMP@    R6,     R3                      ; D7DF   0373
        MVO     R4,     G_0387                  ; D7E0   0244 0387
        SLR     R3,     1                       ; D7E2   0063
        SUBR    R7,     R0                      ; D7E3   0138
        ADD@    R1,     R7                      ; D7E4   02CF

        MVI@    R2,     R4                      ; D7E5   0294
        ANDR    R7,     R1                      ; D7E6   01B9
        BLT     L_D426                          ; D7E7   0225 03C2

        XOR@    R5,     R1                      ; D7E9   03E9
        PULR    R7                              ; D7EA   02B7

        DECLE   $0051,  $014B,  $0176,  $03F6   ; D7EB   0051 014B 0176 03F6
        DECLE   $0008,  $007D,  $034F,  $03B8   ; D7EF   0008 007D 034F 03B8
        DECLE   $0352,  $02B0,  $03F0,  $035C   ; D7F3   0352 02B0 03F0 035C
        DECLE   $02A1,  $00AD,  $005F,  $0216   ; D7F7   02A1 00AD 005F 0216
        DECLE   $0027                           ; D7FB   0027

        XORR    R4,     R0                      ; D7FC   01E0
        ANDR    R4,     R0                      ; D7FD   01A0
        MVI@    R5,     R0                      ; D7FE   02A8
        MVO@    R3,     R5                      ; D7FF   026B
        ADDR    R1,     R1                      ; D800   00C9
        INCR    R2                              ; D801   000A
        XOR     G_030F, R3                      ; D802   03C3 030F
        XOR@    R4,     R2                      ; D804   03E2
        SUB@    R6,     R5                      ; D805   0335
        TSTR    R1                              ; D806   0089
        RRC     R1,     2                       ; D807   0075
        SUBR    R6,     R5                      ; D808   0135
        ADDI    #$0336, R7                      ; D809   02FF 0336

        CMP     .BTAB.19,R2                     ; D80B   0342 0219
        MVO@    R5,     R2                      ; D80D   0255
        BNEQ    L_D676                          ; D80E   022C 0199

        ADDI    #$03FA, R6                      ; D810   02FE 03FA
        AND@    R6,     R4                      ; D812   03B4
        SUBR    R1,     R4                      ; D813   010C
        SUBR    R6,     R6                      ; D814   0136
L_D815:
        SUB@    R2,     R5                      ; D815   0315
        MOVR    R1,     R2                      ; D816   008A
        MOVR    R1,     R7                      ; D817   008F

        CMPR    R1,     R4                      ; D818   014C
        MVO@    R2,     R4                      ; D819   0262
        ADDR    R0,     R6                      ; D81A   00C6
        MOVR    R3,     R5                      ; D81B   009D
        ANDR    R1,     R2                      ; D81C   018A
        AND     .BTAB.67,R5                     ; D81D   0385 0267
        SLLC    R1,     2                       ; D81F   005D
        SUBR    R6,     R5                      ; D820   0135
        XORR    R4,     R3                      ; D821   01E3
        CMPR    R1,     R5                      ; D822   014D
        SUBR    R0,     R5                      ; D823   0105
        DIS                                     ; D824   0003
        NEGR    R4                              ; D825   0024
        MOVR    R0,     R3                      ; D826   0083
        PULR    R6                              ; D827   02B6
        CMPR    R4,     R1                      ; D828   0161
        MVI@    R4,     R5                      ; D829   02A5
        CMPR    R4,     R2                      ; D82A   0162
        AND@    R5,     R1                      ; D82B   03A9
        MVI@    R2,     R1                      ; D82C   0291
        MVO@    R1,     R2                      ; D82D   0251
        CMPR    R1,     R2                      ; D82E   014A
        SUBR    R1,     R2                      ; D82F   010A
        MOVR    R2,     R4                      ; D830   0094
        BC      L_D87B                          ; D831   0201 0048

        SUB@    R6,     R0                      ; D833   0330
        MVII    #$00D4, R0                      ; D834   02B8 00D4
L_D836:
        CMP@    R2,     R1                      ; D836   0351
        DECLE   $0014,  $038B,  $03B3,  $01A4   ; D837   0014 038B 03B3 01A4
        DECLE   $02AE,  $00CA,  $01A0,  $01C8   ; D83B   02AE 00CA 01A0 01C8
        DECLE   $033E,  $0140,  $03D4,  $0024   ; D83F   033E 0140 03D4 0024
        DECLE   $0001,  $021C,  $0244,  $029C   ; D843   0001 021C 0244 029C
        DECLE   $0169,  $012B,  $0182,  $0071   ; D847   0169 012B 0182 0071
        DECLE   $035A,  $0361,  $0149,  $0046   ; D84B   035A 0361 0149 0046
        DECLE   $0012,  $01C0,  $0001,  $0330   ; D84F   0012 01C0 0001 0330
        DECLE   $0298,  $0256,  $02D0,  $001C   ; D853   0298 0256 02D0 001C
        DECLE   $03AD,  $0125,  $01A5,  $00BA   ; D857   03AD 0125 01A5 00BA
        DECLE   $006B,  $0150,  $01FC,  $01C9   ; D85B   006B 0150 01FC 01C9
        DECLE   $038F,  $0252,  $03EF,  $0023   ; D85F   038F 0252 03EF 0023
        DECLE   $001E,  $0310,  $03F3,  $0125   ; D863   001E 0310 03F3 0125
        DECLE   $0003,  $01D8,  $0264,  $00BC   ; D867   0003 01D8 0264 00BC
        DECLE   $00A9,  $0000,  $0015,  $0355   ; D86B   00A9 0000 0015 0355
        DECLE   $0134,  $018D,  $002D,  $0135   ; D86F   0134 018D 002D 0135
        DECLE   $0343,  $01B3,  $0363,  $0049   ; D873   0343 01B3 0363 0049
        DECLE   $023C                           ; D877   023C

        ADDR    R4,     R0                      ; D878   00E0
        XOR@    R6,     R0                      ; D879   03F0
L_D87A:
        DECR    R7                              ; D87A   0017

L_D87B:
        XOR@    R1,     R2                      ; D87B   03CA
        ANDR    R0,     R1                      ; D87C   0181
        SUBR    R0,     R0                      ; D87D   0100
        ADDR    R6,     R0                      ; D87E   00F0
        B       L_D836                          ; D87F   0220 004A

        DECLE   $0242,  $0307,  $0001,  $0002   ; D881   0242 0307 0001 0002
        DECLE   $014A,  $01C3,  $011C,  $0030   ; D885   014A 01C3 011C 0030
        DECLE   $0204,  $02C9,  $0002,  $0020   ; D889   0204 02C9 0002 0020
        DECLE   $0070,  $03E2,  $0049,  $007E   ; D88D   0070 03E2 0049 007E
        DECLE   $0300,  $010F,  $0004,  $00CA   ; D891   0300 010F 0004 00CA
        DECLE   $0040,  $03FC,  $0171,  $03FC   ; D895   0040 03FC 0171 03FC
        DECLE   $0049,  $0244,  $0100,  $0090   ; D899   0049 0244 0100 0090
        DECLE   $03C0,  $03C9,  $0205,  $03F8   ; D89D   03C0 03C9 0205 03F8
        DECLE   $0091,  $001C,  $014A,  $0241   ; D8A1   0091 001C 014A 0241
        DECLE   $00E0,  $0070,  $03FC,  $0049   ; D8A5   00E0 0070 03FC 0049
        DECLE   $01C2,  $0120,  $0080,  $01E4   ; D8A9   01C2 0120 0080 01E4
        DECLE   $00CA,  $0041,  $0024,  $007E   ; D8AD   00CA 0041 0024 007E
        DECLE   $0234,  $0399,  $032A,  $0236   ; D8B1   0234 0399 032A 0236
        DECLE   $028C,  $005E,  $013E,  $03A5   ; D8B5   028C 005E 013E 03A5
        DECLE   $030C,  $01C9,  $00FA,  $014D   ; D8B9   030C 01C9 00FA 014D
        DECLE   $021F,  $022F,  $0156,  $02A6   ; D8BD   021F 022F 0156 02A6
        DECLE   $02FC,  $0188,  $0366,  $033F   ; D8C1   02FC 0188 0366 033F
        DECLE   $00F6,  $012D,  $0153,  $0293   ; D8C5   00F6 012D 0153 0293
        DECLE   $00C4,  $03C3,  $01D3,  $024F   ; D8C9   00C4 03C3 01D3 024F
        DECLE   $0038,  $0007,  $0000,  $005C   ; D8CD   0038 0007 0000 005C
        DECLE   $0318,  $01CC,  $0159,  $01F4   ; D8D1   0318 01CC 0159 01F4
        DECLE   $02C3,  $0292,  $001C,  $000C   ; D8D5   02C3 0292 001C 000C
        DECLE   $02CC,  $0194,  $003E,  $02AA   ; D8D9   02CC 0194 003E 02AA
        DECLE   $00D0,  $0056,  $03E4,  $03D5   ; D8DD   00D0 0056 03E4 03D5
        DECLE   $013E,  $02A8,  $03A4,  $000D   ; D8E1   013E 02A8 03A4 000D
        DECLE   $0314,  $003E,  $0209,  $023D   ; D8E5   0314 003E 0209 023D

        SUB@    R1,     R4                      ; D8E9   030C
        CMPR    R7,     R5                      ; D8EA   017D
        XORR    R6,     R3                      ; D8EB   01F3
        SUBR    R0,     R5                      ; D8EC   0105
        PULR    R2                              ; D8ED   02B2
        SLL     R3,     1                       ; D8EE   004B
        SUB@    R1,     R4                      ; D8EF   030C
        CMPR    R1,     R1                      ; D8F0   0149
        MOVR    R2,     R5                      ; D8F1   0095
L_D8F2:
        DECR    R7                              ; D8F2   0017

        SLL     R0,     1                       ; D8F3   0048
        NEGR    R0                              ; D8F4   0020
        XOR@    R3,     R6                      ; D8F5   03DE
        CMP@    R2,     R7                      ; D8F6   0357
        ANDR    R3,     R6                      ; D8F7   019E
        SUBR    R7,     R2                      ; D8F8   013A
        MVI@    R5,     R4                      ; D8F9   02AC
        MOVR    R2,     R0                      ; D8FA   0090
        MVO@    R6,     R4                      ; D8FB   0266
        SKIP                                    ; D8FC   0208
        CMP@    R2,     R7                      ; D8FD   0357
        CMPR    R2,     R6                      ; D8FE   0156
        AND@    R4,     R6                      ; D8FF   03A6
        CMP@    R1,     R4                      ; D900   034C
        ANDR    R1,     R1                      ; D901   0189
        SUBR    R0,     R5                      ; D902   0105
        ADD     G_03C3, R7                      ; D903   02C7 03C3

        DECLE   $000B,  $03FC,  $00EA,  $039D   ; D905   000B 03FC 00EA 039D
        DECLE   $013A,  $026C,  $000C,  $00C3   ; D909   013A 026C 000C 00C3
        DECLE   $038E,  $028A,  $03E7,  $0261   ; D90D   038E 028A 03E7 0261
        DECLE   $013C,  $01E7                   ; D911   013C 01E7

        AND     G_0088, R0                      ; D913   0380 0088
        XOR     .BTAB.64,R2                     ; D915   03C2 0264
        SLL     R0,     2                       ; D917   004C
        XOR@    R4,     R3                      ; D918   03E3
        MOVR    R3,     R7                      ; D919   009F
        MOVR    R1,     R7                      ; D91A   008F

        DECLE   $005E,  $027C,  $0074,  $0200   ; D91B   005E 027C 0074 0200
        DECLE   $0001,  $0280,  $0347,  $027F   ; D91F   0001 0280 0347 027F

        MVI@    R5,     R1                      ; D923   02A9
        SUB@    R4,     R3                      ; D924   0323
        MVI@    R3,     R4                      ; D925   029C
        XORR    R5,     R0                      ; D926   01E8
        MVO@    R2,     R3                      ; D927   025A
        SUBR    R1,     R7                      ; D928   010F

        DECLE   $00F2,  $0289,  $00E1,  $0000   ; D929   00F2 0289 00E1 0000

        ADDR    R1,     R3                      ; D92D   00CB
        SUB@    R2,     R0                      ; D92E   0310
        XOR@    R1,     R4                      ; D92F   03CC
        ANDR    R4,     R0                      ; D930   01A0
        BEQ     L_D5AA                          ; D931   0224 0388
        ADDR    R1,     R7                      ; D933   00CF

        DECLE   $002A,  $01F0,  $02A6,  $02B6   ; D934   002A 01F0 02A6 02B6
        DECLE   $02FE,  $0065,  $0036           ; D938   02FE 0065 0036

        COMR    R6                              ; D93B   001E
        ADDR    R0,     R5                      ; D93C   00C5
        CMPR    R6,     R3                      ; D93D   0173
        CMPR    R2,     R2                      ; D93E   0152
        CMP     G_03B2, R4                      ; D93F   0344 03B2
        CMPR    R2,     R3                      ; D941   0153
        MOVR    R0,     R3                      ; D942   0083
        PSHR    R6                              ; D943   0276
        SUBR    R7,     R1                      ; D944   0139
        SUB@    R4,     R2                      ; D945   0322
        ANDR    R0,     R4                      ; D946   0184
        ANDI    #$02EB, R1                      ; D947   03B9 02EB
        CMPR    R1,     R7                      ; D949   014F
        SUB@    R5,     R2                      ; D94A   032A
        XORR    R3,     R0                      ; D94B   01D8
        XORR    R2,     R0                      ; D94C   01D0
        SUB@    R6,     R2                      ; D94D   0332
        XOR@    R6,     R4                      ; D94E   03F4
        AND@    R5,     R4                      ; D94F   03AC
        SUB@    R6,     R3                      ; D950   0333
        MOVR    R3,     R4                      ; D951   009C
        XOR@    R4,     R1                      ; D952   03E1
        MVI     G_0144, R0                      ; D953   0280 0144
        MVO@    R0,     R4                      ; D955   0260
        MOVR    R3,     R7                      ; D956   009F

        XOR     .STIC.X.7,R1                    ; D957   03C1 0007
        B       L_D5FA                          ; D959   0220 0360

        DECLE   $0098,  $0001,  $0007,  $0004   ; D95B   0098 0001 0007 0004

        MVI@    R4,     R2                      ; D95F   02A2
        MOVR    R3,     R7                      ; D960   009F

        DECLE   $03E1,  $0038,  $001C,  $0020   ; D961   03E1 0038 001C 0020
        DECLE   $0098,  $00C1,  $0001,  $00C0   ; D965   0098 00C1 0001 00C0
        DECLE   $01DC,  $01A1,  $00DE,  $03A8   ; D969   01DC 01A1 00DE 03A8
        DECLE   $01E8,  $0208,  $01BD,  $0255   ; D96D   01E8 0208 01BD 0255
        DECLE   $024E,  $0057,  $03E4,  $0183   ; D971   024E 0057 03E4 0183
        DECLE   $004F,  $0250,  $01F9,  $03E0   ; D975   004F 0250 01F9 03E0
        DECLE   $0381,  $0310,  $024B,  $0025   ; D979   0381 0310 024B 0025
        DECLE   $0240,  $038C,  $02A0,  $00D0   ; D97D   0240 038C 02A0 00D0
        DECLE   $02AD,  $0264,  $00F0,  $0204   ; D981   02AD 0264 00F0 0204
        DECLE   $01E5,  $01A7,  $0265,  $0233   ; D985   01E5 01A7 0265 0233

        SUBR    R5,     R2                      ; D989   012A
        SARC    R2,     1                       ; D98A   007A
        CMPR    R7,     R6                      ; D98B   017E
        RRC     R3,     1                       ; D98C   0073
        ADD     G_0334, R4                      ; D98D   02C4 0334
        SUBR    R2,     R3                      ; D98F   0113
        SLL     R1,     2                       ; D990   004D
        NEGR    R2                              ; D991   0022
        CMPI    #$02A5, R5                      ; D992   037D 02A5
L_D994:
        DECR    R7                              ; D994   0017

        ADDI    #$01E4, R5                      ; D995   02FD 01E4
        B       L_DBE5                          ; D997   0200 024C

        DECLE   $0006,  $00CC,  $0134,  $01D4   ; D999   0006 00CC 0134 01D4
        DECLE   $00B4,  $000C,  $03EF,  $00CC   ; D99D   00B4 000C 03EF 00CC
        DECLE   $0325,  $0150,  $007D,  $0279   ; D9A1   0325 0150 007D 0279
        DECLE   $01DF,  $0126,  $0320,  $0010   ; D9A5   01DF 0126 0320 0010
        DECLE   $007E,  $0098,  $0126,  $0040   ; D9A9   007E 0098 0126 0040
        DECLE   $0070,  $0380,  $0117,  $0066   ; D9AD   0070 0380 0117 0066
        DECLE   $0036,  $002B,  $0268,  $0180   ; D9B1   0036 002B 0268 0180
        DECLE   $0273,  $02A6,  $0111,  $013C   ; D9B5   0273 02A6 0111 013C
        DECLE   $0012,  $0100,  $0315,  $0320   ; D9B9   0012 0100 0315 0320
        DECLE   $0067,  $03D7,  $0032,  $026A   ; D9BD   0067 03D7 0032 026A
        DECLE   $0381,  $03F5,  $0295,  $0193   ; D9C1   0381 03F5 0295 0193
        DECLE   $0004,  $0200,  $0003,  $0078   ; D9C5   0004 0200 0003 0078
        DECLE   $0292,  $039F                   ; D9C9   0292 039F

        XORI    #$00FC, R0                      ; D9CB   03F8 00FC
        MOVR    R6,     R4                      ; D9CD   00B4
        MVI@    R2,     R3                      ; D9CE   0293
        MVI@    R3,     R0                      ; D9CF   0298
        B       L_DDB7                          ; D9D0   0200 03E5

        DECLE   $03D7,  $0091,  $0068,  $01FA   ; D9D2   03D7 0091 0068 01FA
        DECLE   $03E0,  $006F,  $0333,  $02F9   ; D9D6   03E0 006F 0333 02F9
        DECLE   $0049,  $0225                   ; D9DA   0049 0225

        SUB     .PSG0.chn_b_hi,R1               ; D9DC   0301 01F5
        CMPR    R4,     R2                      ; D9DE   0162
        AND@    R3,     R1                      ; D9DF   0399
        SUB@    R4,     R2                      ; D9E0   0322
        NEGR    R6                              ; D9E1   0026
        AND@    R3,     R6                      ; D9E2   039E
        SUB@    R3,     R7                      ; D9E3   031F

        DECLE   $02DA,  $03C0,  $0024,  $0000   ; D9E4   02DA 03C0 0024 0000
        DECLE   $03EC,  $0000,  $020F,  $03A4   ; D9E8   03EC 0000 020F 03A4
        DECLE   $012B,  $03F0,  $00B0,  $031C   ; D9EC   012B 03F0 00B0 031C
        DECLE   $038C,  $01E1,  $001B,  $034D   ; D9F0   038C 01E1 001B 034D
        DECLE   $004F,  $013E,  $00E2,  $001C   ; D9F4   004F 013E 00E2 001C
        DECLE   $0000,  $00E8,  $0118,  $018D   ; D9F8   0000 00E8 0118 018D
        DECLE   $0172,  $020F,  $0109,  $0203   ; D9FC   0172 020F 0109 0203
        DECLE   $032F,  $035A,  $00AB,  $00A5   ; DA00   032F 035A 00AB 00A5
        DECLE   $02ED,  $0207,  $0103,  $0360   ; DA04   02ED 0207 0103 0360
        DECLE   $0100,  $00A0,  $02E5,  $0241   ; DA08   0100 00A0 02E5 0241
        DECLE   $0004,  $0022,  $01F8,  $01A0   ; DA0C   0004 0022 01F8 01A0
        DECLE   $02DE,  $01C8,  $00F8,  $0268   ; DA10   02DE 01C8 00F8 0268
        DECLE   $01F8,  $03D2,  $015E,  $00AE   ; DA14   01F8 03D2 015E 00AE
        DECLE   $0165,  $003D,  $0380,  $03CF   ; DA18   0165 003D 0380 03CF
        DECLE   $011E,  $01F1,  $02E5,  $001F   ; DA1C   011E 01F1 02E5 001F

        SUBR    R0,     R0                      ; DA20   0100
        XOR@    R1,     R2                      ; DA21   03CA
        INCR    R7                              ; DA22   000F

        XORR    R6,     R1                      ; DA23   01F1
L_DA24:
        NEGR    R5                              ; DA24   0025
        DECLE   $001F,  $0080,  $03B8,  $033E   ; DA25   001F 0080 03B8 033E
        DECLE   $00F1,  $0025,  $00E1,  $0000   ; DA29   00F1 0025 00E1 0000
        DECLE   $03C0,  $011C,  $0007,  $030D   ; DA2D   03C0 011C 0007 030D
        DECLE   $010E,  $0204,  $0107,  $0043   ; DA31   010E 0204 0107 0043
        DECLE   $00AE,  $01F2,  $0268,  $01A5   ; DA35   00AE 01F2 0268 01A5
        DECLE   $034A,  $01A8,  $0048,  $027C   ; DA39   034A 01A8 0048 027C

        CLRR    R4                              ; DA3D   01E4
        MOVR    R2,     R0                      ; DA3E   0090
        CMPR    R6,     R3                      ; DA3F   0173
        MOVR    R3,     R7                      ; DA40   009F

        DECLE   $01CD,  $010E,  $0101,  $0187   ; DA41   01CD 010E 0101 0187

        MOVR    R6,     R4                      ; DA45   00B4
        MVO@    R7,     R5                      ; DA46   026F
        XOR@    R4,     R2                      ; DA47   03E2
        SLL     R2,     1                       ; DA48   004A
        ANDR    R5,     R5                      ; DA49   01AD
        CMP@    R1,     R6                      ; DA4A   034E
        CMPR    R5,     R0                      ; DA4B   0168
        MOVR    R3,     R0                      ; DA4C   0098
        MVI@    R1,     R6                      ; DA4D   028E
        XOR@    R5,     R4                      ; DA4E   03EC
        ADDR    R1,     R5                      ; DA4F   00CD
        CMPR    R0,     R3                      ; DA50   0143
        MOVR    R4,     R5                      ; DA51   00A5
        NEGR    R5                              ; DA52   0025
        SUB     .STIC.X.1,R3                    ; DA53   0303 0001
        RRC     R0,     1                       ; DA55   0070
        SUBR    R0,     R0                      ; DA56   0100
        NEGR    R6                              ; DA57   0026
L_DA58:
        NEGR    R5                              ; DA58   0025
        ADDR    R4,     R0                      ; DA59   00E0
        DECR    R2                              ; DA5A   0012
        XOR@    R2,     R0                      ; DA5B   03D0
        ADDI    #$016C, R7                      ; DA5C   02FF 016C

        DECLE   $01CD,  $013A,  $000B,  $0387   ; DA5E   01CD 013A 000B 0387
        DECLE   $0183,  $01AF                   ; DA62   0183 01AF

        SLR     R2,     2                       ; DA64   0066
        ADDR    R1,     R2                      ; DA65   00CA
        ANDR    R3,     R5                      ; DA66   019D
        ADDR    R3,     R0                      ; DA67   00D8
        SUBR    R5,     R2                      ; DA68   012A
        SUBR    R5,     R0                      ; DA69   0128
        MVO@    R2,     R5                      ; DA6A   026A
        XORR    R6,     R4                      ; DA6B   01F4
        ADDR    R2,     R4                      ; DA6C   00D4
        CMPR    R6,     R3                      ; DA6D   0173
        AND@    R4,     R1                      ; DA6E   03A1
        ANDR    R1,     R4                      ; DA6F   018C
        CMPR    R3,     R6                      ; DA70   015E
        ADCR    R5                              ; DA71   002D
        ANDR    R0,     R2                      ; DA72   0182
        MOVR    R2,     R4                      ; DA73   0094
        CMP@    R2,     R0                      ; DA74   0350
        ADD@    R4,     R6                      ; DA75   02E6
        SUB@    R5,     R4                      ; DA76   032C
        SUBR    R5,     R4                      ; DA77   012C
        INCR    R2                              ; DA78   000A
        CMP@    R4,     R0                      ; DA79   0360
        CMPR    R4,     R7                      ; DA7A   0167
        SUBR    R1,     R0                      ; DA7B   0108
        SUBR    R0,     R7                      ; DA7C   0107

        CMPI    #$001E, R5                      ; DA7D   037D 001E
        XORI    #$0007, R6                      ; DA7F   03FE 0007
        ANDR    R2,     R6                      ; DA81   0196
        ADDR    R2,     R2                      ; DA82   00D2
        B       L_DCBB                          ; DA83   0200 0236

        ADDR    R0,     R3                      ; DA85   00C3
        MVO@    R0,     R4                      ; DA86   0260
        ADDR    R5,     R6                      ; DA87   00EE
        MOVR    R3,     R7                      ; DA88   009F

        DECLE   $0019,  $0100,  $0195,  $03C1   ; DA89   0019 0100 0195 03C1
        DECLE   $0144,  $0130,  $01D3,  $015C   ; DA8D   0144 0130 01D3 015C
        DECLE   $0341,  $0351,  $036C,  $03F6   ; DA91   0341 0351 036C 03F6
        DECLE   $0001                           ; DA95   0001

        ADDR    R6,     R3                      ; DA96   00F3
        MVO@    R7,     R4                      ; DA97   0267
        SUB@    R2,     R2                      ; DA98   0312
        ADDR    R7,     R2                      ; DA99   00FA
        B       L_DE3A                          ; DA9A   0200 039E

        DECLE   $0381,  $02B6,  $0062,  $0128   ; DA9C   0381 02B6 0062 0128
        DECLE   $02D3,  $0059,  $01C2,  $02D2   ; DAA0   02D3 0059 01C2 02D2
        DECLE   $007C,  $00E8,  $0036           ; DAA4   007C 00E8 0036

        SUBR    R4,     R3                      ; DAA7   0123
        SUB@    R4,     R7                      ; DAA8   0327

        DECLE   $0008,  $0000,  $01C7,  $0148   ; DAA9   0008 0000 01C7 0148
        DECLE   $004C,  $0268,  $03B7,  $0072   ; DAAD   004C 0268 03B7 0072
        DECLE   $004E,  $0116,  $0000,  $02F6   ; DAB1   004E 0116 0000 02F6
        DECLE   $0365,  $00E9,  $00E9,  $0201   ; DAB5   0365 00E9 00E9 0201
        DECLE   $0342,  $0201                   ; DAB9   0342 0201

        AND     .PSG1.chn_b_vol,R0              ; DABB   0380 00FC
        ADCR    R1                              ; DABD   0029
        BOV     L_DCA0                          ; DABE   0202 01E0
        BGT     L_DB88                          ; DAC0   020E 00C6
        ADDR    R0,     R7                      ; DAC2   00C7

        DECLE   $00E9,  $0002,  $0020,  $03F0   ; DAC3   00E9 0002 0020 03F0
        DECLE   $0140,  $00C0,  $0209,  $0002   ; DAC7   0140 00C0 0209 0002
        DECLE   $0120,  $0000,  $0004,  $00C0   ; DACB   0120 0000 0004 00C0
        DECLE   $0253,  $038D,  $0143,  $0362   ; DACF   0253 038D 0143 0362
        DECLE   $03C0,  $00DF,  $0038,  $0123   ; DAD3   03C0 00DF 0038 0123
        DECLE   $01FD,  $039A,  $0011,  $03F9   ; DAD7   01FD 039A 0011 03F9
        DECLE   $0289,  $01A6,  $00FA,  $0020   ; DADB   0289 01A6 00FA 0020
        DECLE   $0155,  $021A,  $0003,  $006B   ; DADF   0155 021A 0003 006B
        DECLE   $0318,  $030C,  $01A9,  $01FE   ; DAE3   0318 030C 01A9 01FE
        DECLE   $008D,  $0153,  $020F,  $016A   ; DAE7   008D 0153 020F 016A

        SUBR    R5,     R7                      ; DAEB   012F

        ANDR    R2,     R4                      ; DAEC   0194
        CMP@    R3,     R2                      ; DAED   035A
        AND@    R5,     R5                      ; DAEE   03AD
        SUBR    R5,     R7                      ; DAEF   012F

        DECLE   $0078,  $03BF,  $0216,  $000A   ; DAF0   0078 03BF 0216 000A
        DECLE   $01F4,  $01CC,  $017F,  $0006   ; DAF4   01F4 01CC 017F 0006
        DECLE   $0309,  $00C3,  $006E,  $00F8   ; DAF8   0309 00C3 006E 00F8
        DECLE   $010A,  $009D,  $0089,  $0187   ; DAFC   010A 009D 0089 0187
        DECLE   $0004,  $01C2,  $02F8,  $0091   ; DB00   0004 01C2 02F8 0091
        DECLE   $0041,  $0008,  $0224,  $02C1   ; DB04   0041 0008 0224 02C1

        INCR    R7                              ; DB08   000F

        ANDR    R2,     R0                      ; DB09   0190
L_DB0A:
        XOR@    R3,     R6                      ; DB0A   03DE
        XORR    R1,     R5                      ; DB0B   01CD
        ADDR    R4,     R0                      ; DB0C   00E0
        MVI@    R1,     R2                      ; DB0D   028A
        XOR     .BTAB.85,R5                     ; DB0E   03C5 0285
        CMPR    R0,     R7                      ; DB10   0147
        ANDR    R5,     R0                      ; DB11   01A8
        NEGR    R4                              ; DB12   0024
        INCR    R2                              ; DB13   000A
        SARC    R2,     2                       ; DB14   007E
        INCR    R0                              ; DB15   0008
        ADCR    R3                              ; DB16   002B
        SUB@    R1,     R7                      ; DB17   030F

        DECLE   $01E4,  $00EA,  $0090,  $0007   ; DB18   01E4 00EA 0090 0007
        DECLE   $031C,  $021A                   ; DB1C   031C 021A

        NEGR    R4                              ; DB1E   0024
        NEGR    R4                              ; DB1F   0024
L_DB20:
        AND@    R4,     R0                      ; DB20   03A0
        DECLE   $0001,  $01F7                   ; DB21   0001 01F7

        ADD@    R2,     R1                      ; DB23   02D1
        AND@    R1,     R4                      ; DB24   038C
        BGT     L_DB20                          ; DB25   022E 0006

        CMPR    R1,     R7                      ; DB27   014F
        SUBR    R6,     R4                      ; DB28   0134
        SUB@    R5,     R7                      ; DB29   032F

        DECLE   $03F0,  $038C,  $03A4,  $0245   ; DB2A   03F0 038C 03A4 0245
        DECLE   $0007,  $0220,  $0071,  $023E   ; DB2E   0007 0220 0071 023E

        PSHR    R1                              ; DB32   0271
        MOVR    R2,     R7                      ; DB33   0097

        DECR    R5                              ; DB34   0015
        RLC     R0,     1                       ; DB35   0050
        AND@    R2,     R3                      ; DB36   0393
        DIS                                     ; DB37   0003
        CMP     G_011F, R3                      ; DB38   0343 011F
        ADCR    R4                              ; DB3A   002C
        TSTR    R0                              ; DB3B   0080
        SUBR    R0,     R6                      ; DB3C   0106
        COMR    R0                              ; DB3D   0018
        CMP     .BTAB.4E,R4                     ; DB3E   0344 024E
        SLLC    R0,     1                       ; DB40   0058
L_DB41:
        ANDR    R0,     R0                      ; DB41   0180
        MOVR    R1,     R5                      ; DB42   008D
        INCR    R7                              ; DB43   000F

        MOVR    R2,     R4                      ; DB44   0094
L_DB45:
        TSTR    R0                              ; DB45   0080
        MOVR    R4,     R1                      ; DB46   00A1
L_DB47:
        SUB     G_0096, R0                      ; DB47   0300 0096
        DECLE   $001D,  $0123,  $01C0,  $021F   ; DB49   001D 0123 01C0 021F
        DECLE   $0003,  $00A3,  $0218,  $03C8   ; DB4D   0003 00A3 0218 03C8
        DECLE   $0000                           ; DB51   0000

        NOP                                     ; DB52   0034
        AND     .PSG1.chan_enable,R0            ; DB53   0380 00F8
        XOR     G_0311, R2                      ; DB55   03C2 0311
        EIS                                     ; DB57   0002
        SUBR    R5,     R2                      ; DB58   012A
        ADD@    R3,     R6                      ; DB59   02DE
        SUB@    R4,     R0                      ; DB5A   0320
        XOR@    R6,     R4                      ; DB5B   03F4
        NEGR    R5                              ; DB5C   0025
        SETC                                    ; DB5D   0007
        MVO@    R4,     R2                      ; DB5E   0254
        XORR    R5,     R0                      ; DB5F   01E8
        B       L_D788                          ; DB60   0220 03D9

        MVO@    R7,     R4                      ; DB62   0267
        XORI    #$0032, R2                      ; DB63   03FA 0032
        MVO@    R0,     R1                      ; DB65   0248
        SUBR    R3,     R6                      ; DB66   011E
        ADDI    #$0376, R2                      ; DB67   02FA 0376
        SAR     R0,     2                       ; DB69   006C
        ADDR    R4,     R7                      ; DB6A   00E7

        DECLE   $0229,  $0200,  $0020,  $021E   ; DB6B   0229 0200 0020 021E
        DECLE   $027C                           ; DB6F   027C

        MOVR    R1,     R3                      ; DB70   008B
        ADD@    R2,     R3                      ; DB71   02D3
        MVO@    R0,     R5                      ; DB72   0268
        ANDR    R0,     R1                      ; DB73   0181
        XOR@    R4,     R2                      ; DB74   03E2
        MOVR    R6,     R4                      ; DB75   00B4
        XORI    #$02BF, R3                      ; DB76   03FB 02BF
        ADDR    R3,     R3                      ; DB78   00DB
        SUB@    R5,     R3                      ; DB79   032B
        MOVR    R1,     R7                      ; DB7A   008F

        DECLE   $0000                           ; DB7B   0000

        B       L_DCD4                          ; DB7C   0200 0156

        MOVR    R7,     R0                      ; DB7E   00B8
        SUBR    R4,     R2                      ; DB7F   0122
        SAR     R1,     2                       ; DB80   006D
        RRC     R0,     1                       ; DB81   0070
        MOVR    R0,     R7                      ; DB82   0087
        MOVR    R5,     R7                      ; DB83   00AF

        AND@    R6,     R2                      ; DB84   03B2
        MVO@    R7,     R4                      ; DB85   0267
        CMP@    R5,     R7                      ; DB86   036F
        NEGR    R2                              ; DB87   0022
L_DB88:
        MVO@    R4,     R1                      ; DB88   024C
        DECLE   $039E,  $02E4,  $03CF,  $003F   ; DB89   039E 02E4 03CF 003F

        SAR     R2,     2                       ; DB8D   006E
        SUBI    #$0138, R7                      ; DB8E   033F 0138

        SUBR    R3,     R0                      ; DB90   0118
        ANDR    R4,     R0                      ; DB91   01A0
        ADDR    R1,     R4                      ; DB92   00CC
        SUB@    R1,     R0                      ; DB93   0308
        AND     .BTAB.A8,R3                     ; DB94   0383 02A8
        SUBI    #$0219, R6                      ; DB96   033E 0219
        AND@    R3,     R5                      ; DB98   039D
        ADCR    R0                              ; DB99   0028
        MVI@    R2,     R3                      ; DB9A   0293
        SLR     R3,     2                       ; DB9B   0067
        ANDR    R4,     R1                      ; DB9C   01A1
        PULR    R5                              ; DB9D   02B5
        ANDR    R2,     R4                      ; DB9E   0194
        SUBI    #$02BC, R2                      ; DB9F   033A 02BC
        AND@    R3,     R0                      ; DBA1   0398
        MVO@    R0,     R4                      ; DBA2   0260
        SUBR    R3,     R0                      ; DBA3   0118
        ADDI    #$037F, R5                      ; DBA4   02FD 037F
        ADDI    #$034A, R7                      ; DBA6   02FF 034A

        DECLE   $0048,  $01C8,  $001C,  $0090   ; DBA8   0048 01C8 001C 0090
        DECLE   $0004                           ; DBAC   0004

        BEQ     L_D815                          ; DBAD   0224 0399

        SUBI    #$0218, R5                      ; DBAF   033D 0218
        MVI@    R1,     R5                      ; DBB1   028D
        MVO     R7,     G_02FD                  ; DBB2   0247 02FD
        ADD@    R1,     R1                      ; DBB4   02C9
        SUB@    R3,     R0                      ; DBB5   0318
        CMPR    R5,     R2                      ; DBB6   016A
        SLLC    R2,     2                       ; DBB7   005E
        RRC     R2,     1                       ; DBB8   0072
        INCR    R0                              ; DBB9   0008
        SUB     G_01B4, R0                      ; DBBA   0300 01B4
        CMP@    R6,     R5                      ; DBBC   0375
        XORR    R3,     R0                      ; DBBD   01D8
        CMPR    R3,     R5                      ; DBBE   015D
        MVO     R0,     .PSG1.chn_a_hi          ; DBBF   0240 00F4
        CMPI    #$0205, R4                      ; DBC1   037C 0205
        SUB@    R1,     R7                      ; DBC3   030F

        CMPR    R5,     R4                      ; DBC4   016C
        SUB@    R3,     R1                      ; DBC5   0319
        SUBR    R3,     R6                      ; DBC6   011E
        INCR    R3                              ; DBC7   000B
        MVI@    R2,     R6                      ; DBC8   0296
        SLL     R0,     1                       ; DBC9   0048
L_DBCA:
        ANDR    R3,     R6                      ; DBCA   019E
        ADD@    R3,     R1                      ; DBCB   02D9
        ADD@    R2,     R6                      ; DBCC   02D6
        SUB@    R5,     R3                      ; DBCD   032B
        MOVR    R6,     R4                      ; DBCE   00B4
        SUB@    R5,     R3                      ; DBCF   032B
        SAR     R1,     2                       ; DBD0   006D
        MOVR    R6,     R0                      ; DBD1   00B0
        SUB@    R3,     R0                      ; DBD2   0318
        MOVR    R3,     R0                      ; DBD3   0098
        SAR     R2,     1                       ; DBD4   006A
        XOR@    R1,     R2                      ; DBD5   03CA
        MVI@    R3,     R0                      ; DBD6   0298
        CMPR    R4,     R4                      ; DBD7   0164
        XORR    R1,     R5                      ; DBD8   01CD
        ANDR    R0,     R3                      ; DBD9   0183
        CMPR    R0,     R4                      ; DBDA   0144
        AND@    R3,     R0                      ; DBDB   0398
        ADDR    R5,     R3                      ; DBDC   00EB
        ANDR    R1,     R0                      ; DBDD   0188
        PSHR    R3                              ; DBDE   0273
        SLLC    R0,     2                       ; DBDF   005C
        CMPR    R0,     R0                      ; DBE0   0140
        SUB@    R1,     R3                      ; DBE1   030B
        BESC    L_DE6D                          ; DBE2   020F 0289
        MVI@    R3,     R7                      ; DBE4   029F

L_DBE5:
        SARC    R1,     2                       ; DBE5   007D
        DECLE   $03BC,  $009F,  $0096,  $003F   ; DBE6   03BC 009F 0096 003F
        DECLE   $00B1,  $0300,  $021C,  $0011   ; DBEA   00B1 0300 021C 0011
        DECLE   $011A,  $0079,  $000E,  $0000   ; DBEE   011A 0079 000E 0000
        DECLE   $008F,  $0310,  $034C,  $016E   ; DBF2   008F 0310 034C 016E
        DECLE   $0111,  $030B,  $03AF,  $024C   ; DBF6   0111 030B 03AF 024C
        DECLE   $0160,  $0212,  $03FB,  $03C9   ; DBFA   0160 0212 03FB 03C9
        DECLE   $009B,  $0186,  $01A6,  $00AB   ; DBFE   009B 0186 01A6 00AB
        DECLE   $037B,  $00A6,  $024F,  $03F5   ; DC02   037B 00A6 024F 03F5
        DECLE   $0142,  $0273,  $034B,  $0182   ; DC06   0142 0273 034B 0182
        DECLE   $0383,  $0333,  $00BB,  $0294   ; DC0A   0383 0333 00BB 0294
        DECLE   $0284,  $022B,  $0111,  $0188   ; DC0E   0284 022B 0111 0188
        DECLE   $029A,  $0379,  $011F,  $00C2   ; DC12   029A 0379 011F 00C2
        DECLE   $0062,  $03BC,  $0261,  $0159   ; DC16   0062 03BC 0261 0159
        DECLE   $025E,  $0021,  $0190,  $03BB   ; DC1A   025E 0021 0190 03BB
        DECLE   $0132,  $0066,  $006E,  $0200   ; DC1E   0132 0066 006E 0200
        DECLE   $03FF                           ; DC22   03FF

        SUB@    R6,     R0                      ; DC23   0330
        ADDR    R2,     R0                      ; DC24   00D0
        SUB@    R1,     R6                      ; DC25   030E
        CMP     .STIC.A.0,R1                    ; DC26   0341 0010
        ANDI    #$0398, R4                      ; DC28   03BC 0398
        ANDR    R2,     R5                      ; DC2A   0195
        ADD@    R5,     R2                      ; DC2B   02EA
        AND@    R5,     R1                      ; DC2C   03A9
        XORR    R5,     R0                      ; DC2D   01E8
        COMR    R2                              ; DC2E   001A
        XOR@    R4,     R5                      ; DC2F   03E5
        CMPR    R0,     R5                      ; DC30   0145
        MOVR    R1,     R7                      ; DC31   008F
L_DC32:
        DECR    R7                              ; DC32   0017

        DECLE   $0080,  $0252,  $027C,  $00B6   ; DC33   0080 0252 027C 00B6
        DECLE   $0000,  $004A,  $005B,  $0000   ; DC37   0000 004A 005B 0000

        RRC     R0,     1                       ; DC3B   0070
        CMPR    R5,     R4                      ; DC3C   016C
        SUB     G_00BF, R0                      ; DC3D   0300 00BF
        ANDR    R6,     R0                      ; DC3F   01B0
L_DC40:
        DECR    R7                              ; DC40   0017

        DECLE   $0101,  $02BE,  $0169,  $019F   ; DC41   0101 02BE 0169 019F

        MVI     G_03A9, R2                      ; DC45   0282 03A9
        ADD@    R2,     R5                      ; DC47   02D5
        MVO@    R5,     R1                      ; DC48   024D
        CMPR    R5,     R2                      ; DC49   016A
        EIS                                     ; DC4A   0002
L_DC4B:
        MVI@    R2,     R2                      ; DC4B   0292
        DECLE   $004E,  $03ED,  $0180,  $03C2   ; DC4C   004E 03ED 0180 03C2
        DECLE   $017D,  $0079,  $0343,  $0381   ; DC50   017D 0079 0343 0381
        DECLE   $03BC,  $00CD,  $0212           ; DC54   03BC 00CD 0212

        COMR    R0                              ; DC57   0018
        SUB@    R5,     R3                      ; DC58   032B
        MOVR    R5,     R3                      ; DC59   00AB
        XORR    R0,     R5                      ; DC5A   01C5
        ADDR    R5,     R0                      ; DC5B   00E8
        XOR@    R4,     R6                      ; DC5C   03E6
        SUBR    R5,     R7                      ; DC5D   012F

        DECLE   $019E,  $034E,  $01C3,  $00E0   ; DC5E   019E 034E 01C3 00E0
        DECLE   $03EE,  $01E2,  $0040,  $03EE   ; DC62   03EE 01E2 0040 03EE
        DECLE   $03D6,  $016A,  $0067,  $01F6   ; DC66   03D6 016A 0067 01F6
        DECLE   $0371,  $003D,  $01EF,  $0357   ; DC6A   0371 003D 01EF 0357
        DECLE   $003F,  $0293,  $038A,  $0038   ; DC6E   003F 0293 038A 0038
        DECLE   $00E0,  $003C,  $0294,  $0007   ; DC72   00E0 003C 0294 0007
        DECLE   $0278                           ; DC76   0278

        ADDR    R4,     R3                      ; DC77   00E3
        RSWD    R4                              ; DC78   003C
        SUB@    R6,     R2                      ; DC79   0332
        SUB@    R4,     R7                      ; DC7A   0327

        DECLE   $0390,  $031C,  $01F8,  $016F   ; DC7B   0390 031C 01F8 016F
        DECLE   $0238,  $0070,  $0000           ; DC7F   0238 0070 0000

        GSWD    R2                              ; DC82   0032
        SUB@    R3,     R0                      ; DC83   0318
        ANDR    R1,     R4                      ; DC84   018C
        CMPR    R5,     R3                      ; DC85   016B
        SUBR    R0,     R5                      ; DC86   0105
        ANDR    R1,     R1                      ; DC87   0189
        ADDR    R0,     R4                      ; DC88   00C4
        ADDR    R1,     R6                      ; DC89   00CE
        XOR@    R6,     R2                      ; DC8A   03F2
        ADDR    R5,     R4                      ; DC8B   00EC
        ANDR    R3,     R5                      ; DC8C   019D
        PSHR    R6                              ; DC8D   0276
        ADDR    R1,     R4                      ; DC8E   00CC
        SUBR    R5,     R0                      ; DC8F   0128
        SARC    R0,     2                       ; DC90   007C
        CLRR    R2                              ; DC91   01D2
        XORR    R2,     R5                      ; DC92   01D5
        ANDR    R3,     R3                      ; DC93   019B
        MVI@    R5,     R6                      ; DC94   02AE
        XOR@    R1,     R5                      ; DC95   03CD
        ANDR    R6,     R6                      ; DC96   01B6
        SUB     G_0106, R6                      ; DC97   0306 0106
        NEGR    R2                              ; DC99   0022
        CMP@    R3,     R7                      ; DC9A   035F
        SLR     R2,     2                       ; DC9B   0066
        CLRR    R5                              ; DC9C   01ED
        ANDR    R2,     R5                      ; DC9D   0195
        ADDR    R3,     R0                      ; DC9E   00D8
        ADDR    R1,     R5                      ; DC9F   00CD
L_DCA0:
        SUBR    R5,     R0                      ; DCA0   0128
        DECLE   $0044,  $0197                   ; DCA1   0044 0197

        ADD     G_0187, R1                      ; DCA3   02C1 0187
        MOVR    R5,     R6                      ; DCA5   00AE
        MVO@    R5,     R4                      ; DCA6   0265
        ADDR    R7,     R1                      ; DCA7   00F9
        CMPR    R7,     R6                      ; DCA8   017E
        RSWD    R2                              ; DCA9   003A
        XOR@    R6,     R0                      ; DCAA   03F0
        XORR    R5,     R6                      ; DCAB   01EE
        CMPR    R7,     R6                      ; DCAC   017E
        SLR     R2,     1                       ; DCAD   0062
        B       L_DFD2                          ; DCAE   0200 0322

        DECLE   $0001,  $007E,  $00EE,  $001C   ; DCB0   0001 007E 00EE 001C
        DECLE   $0000                           ; DCB4   0000

        SAR     R0,     2                       ; DCB5   006C
        DECR    R0                              ; DCB6   0010
        CMP@    R1,     R5                      ; DCB7   034D
        ADDR    R3,     R1                      ; DCB8   00D9
        SUBR    R3,     R7                      ; DCB9   011F

        ANDR    R1,     R3                      ; DCBA   018B
L_DCBB:
        MVII    #$002A, R3                      ; DCBB   02BB 002A
        ANDR    R1,     R2                      ; DCBD   018A
        SUBR    R6,     R2                      ; DCBE   0132
        EIS                                     ; DCBF   0002
        XORR    R1,     R0                      ; DCC0   01C8
        AND@    R4,     R4                      ; DCC1   03A4
        BUSC    L_DFB6                          ; DCC2   0207 02F2

        SARC    R3,     2                       ; DCC4   007F
        INCR    R0                              ; DCC5   0008
        B       L_DB47                          ; DCC6   0220 0180

        DECLE   $0052,  $0001                   ; DCC8   0052 0001

        RSWD    R0                              ; DCCA   0038
        SLLC    R0,     1                       ; DCCB   0058
        XORR    R7,     R0                      ; DCCC   01F8
        MOVR    R4,     R6                      ; DCCD   00A6
        PSHR    R7                              ; DCCE   0277
        MOVR    R3,     R2                      ; DCCF   009A
        AND@    R4,     R2                      ; DCD0   03A2
        CMPR    R5,     R0                      ; DCD1   0168
        SUBR    R0,     R5                      ; DCD2   0105
        ADDR    R5,     R5                      ; DCD3   00ED
L_DCD4:
        MVO@    R3,     R4                      ; DCD4   0263
        DECLE   $013C,  $0384,  $0153,  $02F0   ; DCD5   013C 0384 0153 02F0
        DECLE   $008E,  $0276,  $0339,  $009D   ; DCD9   008E 0276 0339 009D
        DECLE   $03C2,  $0069,  $01DA,  $0063   ; DCDD   03C2 0069 01DA 0063
        DECLE   $012A,  $0382,  $007F,  $003F   ; DCE1   012A 0382 007F 003F

        XOR     G_0341, R4                      ; DCE5   03C4 0341
        MOVR    R6,     R4                      ; DCE7   00B4
        AND@    R1,     R6                      ; DCE8   038E
        SUBR    R0,     R3                      ; DCE9   0103
        XOR@    R6,     R0                      ; DCEA   03F0
        SUB@    R3,     R5                      ; DCEB   031D
        MOVR    R6,     R4                      ; DCEC   00B4
        MOVR    R4,     R5                      ; DCED   00A5
        SWAP    R3,     1                       ; DCEE   0043
        MVO     R0,     G_0304                  ; DCEF   0240 0304
        MVO     R3,     G_009F                  ; DCF1   0243 009F
        SARC    R1,     2                       ; DCF3   007D
        XORI    #$03E3, R0                      ; DCF4   03F8 03E3
        SLL     R1,     1                       ; DCF6   0049
        MOVR    R3,     R0                      ; DCF7   0098
        SWAP    R1,     1                       ; DCF8   0041
        RRC     R2,     2                       ; DCF9   0076
        B       L_DE21                          ; DCFA   0200 0125

        DECLE   $0398,  $0269,  $0172,  $00A2   ; DCFC   0398 0269 0172 00A2
        DECLE   $027A,  $017A,  $0378,  $02E3   ; DD00   027A 017A 0378 02E3
        DECLE   $0333,  $0229,  $0075,  $0023   ; DD04   0333 0229 0075 0023
        DECLE   $033D,  $0379,  $014A,  $0219   ; DD08   033D 0379 014A 0219
        DECLE   $03A4,  $0238,  $0210,  $017E   ; DD0C   03A4 0238 0210 017E
        DECLE   $023C,  $02A1,  $038C,  $0211   ; DD10   023C 02A1 038C 0211
        DECLE   $0135,  $0106,  $03CF           ; DD14   0135 0106 03CF

        ADDI    #$01D2, R5                      ; DD17   02FD 01D2
        ADD@    R4,     R6                      ; DD19   02E6
        SUB@    R6,     R6                      ; DD1A   0336
        ANDR    R2,     R1                      ; DD1B   0191
        CMPR    R4,     R5                      ; DD1C   0165
        SLLC    R3,     2                       ; DD1D   005F
        SUBR    R5,     R7                      ; DD1E   012F

        DECLE   $006B,  $000E,  $0000,  $0153   ; DD1F   006B 000E 0000 0153
        DECLE   $0310,  $038C,  $01B5,  $0000   ; DD23   0310 038C 01B5 0000
        DECLE   $010D,  $00D0,  $038E,  $01CE   ; DD27   010D 00D0 038E 01CE
        DECLE   $01E6,  $00CD,  $020A,  $0085   ; DD2B   01E6 00CD 020A 0085
        DECLE   $00F0,  $01A7                   ; DD2F   00F0 01A7

        SUBR    R5,     R0                      ; DD31   0128
        CMP@    R6,     R3                      ; DD32   0373
        CMPR    R3,     R4                      ; DD33   015C
        SUBR    R0,     R7                      ; DD34   0107

        DECLE   $0053,  $027C,  $02A7,  $0275   ; DD35   0053 027C 02A7 0275
        DECLE   $0224,  $0103,  $0000,  $0287   ; DD39   0224 0103 0000 0287
        DECLE   $027C,  $0284,  $001F,  $0000   ; DD3D   027C 0284 001F 0000
        DECLE   $0100,  $0260,  $0304,  $0207   ; DD41   0100 0260 0304 0207
        DECLE   $007D,  $0080,  $0280,  $03D4   ; DD45   007D 0080 0280 03D4
        DECLE   $0103,  $0084,  $0377,  $027F   ; DD49   0103 0084 0377 027F
        DECLE   $0004                           ; DD4D   0004

        SUBR    R4,     R0                      ; DD4E   0120
        DECR    R2                              ; DD4F   0012
        XORR    R7,     R1                      ; DD50   01F9
        MVI@    R3,     R6                      ; DD51   029E
        MVI     .STIC.X.0,R4                    ; DD52   0284 0000
        AND@    R3,     R6                      ; DD54   039E
        SUBR    R1,     R7                      ; DD55   010F

        DECLE   $027E,  $00D4,  $0003,  $0072   ; DD56   027E 00D4 0003 0072
        DECLE   $0086,  $0285,  $00A9,  $01AA   ; DD5A   0086 0285 00A9 01AA
        DECLE   $0181,  $0321,  $00B9,  $0205   ; DD5E   0181 0321 00B9 0205

        SUB@    R6,     R1                      ; DD62   0331
        RSWD    R4                              ; DD63   003C
        MOVR    R2,     R7                      ; DD64   0097

        ANDR    R2,     R2                      ; DD65   0192
        SLL     R0,     2                       ; DD66   004C
        CMP@    R5,     R3                      ; DD67   036B
        AND@    R5,     R5                      ; DD68   03AD
        MOVR    R3,     R4                      ; DD69   009C
        ADDR    R3,     R7                      ; DD6A   00DF

        INCR    R1                              ; DD6B   0009
        ADDR    R7,     R4                      ; DD6C   00FC
        AND@    R4,     R0                      ; DD6D   03A0
        ANDR    R4,     R0                      ; DD6E   01A0
        XORR    R5,     R2                      ; DD6F   01EA
        ADDR    R1,     R1                      ; DD70   00C9
        XORR    R5,     R1                      ; DD71   01E9
        INCR    R4                              ; DD72   000C
        XOR@    R2,     R6                      ; DD73   03D6
        ANDR    R3,     R0                      ; DD74   0198
        MVO@    R2,     R2                      ; DD75   0252
        MVO@    R2,     R3                      ; DD76   025A
        DIS                                     ; DD77   0003
        SUBR    R3,     R6                      ; DD78   011E
        SUB@    R2,     R0                      ; DD79   0310
        MVO@    R3,     R2                      ; DD7A   0253
        ADCR    R7                              ; DD7B   002F

        XOR@    R4,     R0                      ; DD7C   03E0
L_DD7D:
        SUB     .STIC.X.0,R1                    ; DD7D   0301 0000
        DECLE   $024C,  $0207,  $0120,  $010E   ; DD7F   024C 0207 0120 010E
        DECLE   $01F0,  $00D0,  $0135,  $0265   ; DD83   01F0 00D0 0135 0265
        DECLE   $00D0,  $0004,  $01EB,  $012A   ; DD87   00D0 0004 01EB 012A
        DECLE   $0129,  $01F8,  $0010,  $0381   ; DD8B   0129 01F8 0010 0381
        DECLE   $03A7,  $0129,  $0315,  $0091   ; DD8F   03A7 0129 0315 0091
        DECLE   $03C7,  $007F,  $0326,  $00E6   ; DD93   03C7 007F 0326 00E6
        DECLE   $0000                           ; DD97   0000

        ADD     G_0077, R7                      ; DD98   02C7 0077

        SUBR    R5,     R0                      ; DD9A   0128
        XORR    R4,     R1                      ; DD9B   01E1
        CMP@    R6,     R0                      ; DD9C   0370
        RSWD    R2                              ; DD9D   003A
        CMPR    R1,     R7                      ; DD9E   014F
        SUB@    R5,     R0                      ; DD9F   0328
        ADD@    R3,     R7                      ; DDA0   02DF

        DECLE   $0351,  $0382,  $00F7,  $0266   ; DDA1   0351 0382 00F7 0266
        DECLE   $001B,  $00F2,  $027C,  $0102   ; DDA5   001B 00F2 027C 0102
        DECLE   $01E7                           ; DDA9   01E7

        PULR    R4                              ; DDAA   02B4
        MOVR    R2,     R3                      ; DDAB   0093
        XOR@    R5,     R0                      ; DDAC   03E8
        SKIP                                    ; DDAD   0208
        ADDR    R3,     R7                      ; DDAE   00DF

        RRC     R0,     2                       ; DDAF   0074
        AND@    R2,     R6                      ; DDB0   0396
        ADDR    R5,     R7                      ; DDB1   00EF
        BUSC    L_DF54                          ; DDB2   0207 01A0

        SLL     R0,     1                       ; DDB4   0048
        NOP                                     ; DDB5   0034
        ADD@    R1,     R5                      ; DDB6   02CD
L_DDB7:
        RLC     R0,     2                       ; DDB7   0054
        DECLE   $013F,  $02FF,  $032C,  $03B0   ; DDB8   013F 02FF 032C 03B0
        DECLE   $004A,  $003A,  $02FC,  $0163   ; DDBC   004A 003A 02FC 0163
        DECLE   $0056,  $021E,  $014C,  $0236   ; DDC0   0056 021E 014C 0236

        SUBR    R3,     R2                      ; DDC4   011A
        XORR    R0,     R1                      ; DDC5   01C1
        MVO@    R0,     R3                      ; DDC6   0258
        ADDR    R0,     R4                      ; DDC7   00C4
        SUBR    R7,     R6                      ; DDC8   013E
        ADDR    R6,     R2                      ; DDC9   00F2
        B       L_DFE1                          ; DDCA   0200 0215

        DECLE   $03C2,  $0069,  $03BB,  $0131   ; DDCC   03C2 0069 03BB 0131
        DECLE   $028C,  $0306,  $01F5,  $0247   ; DDD0   028C 0306 01F5 0247
        DECLE   $0193,  $0005                   ; DDD4   0193 0005

        CLRR    R0                              ; DDD6   01C0
        NEGR    R0                              ; DDD7   0020
        SAR     R0,     1                       ; DDD8   0068
        MOVR    R2,     R4                      ; DDD9   0094
        AND     .STIC.X.0,R4                    ; DDDA   0384 0000
        CLRR    R0                              ; DDDC   01C0
        RRC     R0,     1                       ; DDDD   0070
        MOVR    R2,     R4                      ; DDDE   0094
        MOVR    R2,     R0                      ; DDDF   0090
        B       L_DE05                          ; DDE0   0200 0023

        DECLE   $0008,  $0334,  $006E,  $0099   ; DDE2   0008 0334 006E 0099
        DECLE   $003D,  $0381,  $02BB,  $034A   ; DDE6   003D 0381 02BB 034A
        DECLE   $0249,  $01C5,  $0024,  $0000   ; DDEA   0249 01C5 0024 0000
        DECLE   $0000,  $039A,  $027D,  $004A   ; DDEE   0000 039A 027D 004A
        DECLE   $019A,  $0360,  $021D,  $009D   ; DDF2   019A 0360 021D 009D
        DECLE   $01CD,  $013E,  $0024,  $018B   ; DDF6   01CD 013E 0024 018B
        DECLE   $023F                           ; DDFA   023F

        MVII    #$0252, R6                      ; DDFB   02BE 0252
        XOR     G_00AA, R6                      ; DDFD   03C6 00AA
        ANDR    R0,     R4                      ; DDFF   0184
        ADD     G_0197, R5                      ; DE00   02C5 0197
        CMPR    R2,     R7                      ; DE02   0157
        SUBR    R5,     R1                      ; DE03   0129
        XORR    R6,     R3                      ; DE04   01F3
L_DE05:
        CMPR    R2,     R6                      ; DE05   0156
        SUB     G_0362, R2                      ; DE06   0302 0362
        SUB@    R4,     R7                      ; DE08   0327

        DECLE   $021A                           ; DE09   021A

        MVO@    R4,     R3                      ; DE0A   025C
        ADDR    R6,     R1                      ; DE0B   00F1
        MOVR    R5,     R6                      ; DE0C   00AE
        MVI     G_03A9, R2                      ; DE0D   0282 03A9
        ADD@    R5,     R1                      ; DE0F   02E9
        SWAP    R1,     2                       ; DE10   0045
        CMP@    R3,     R3                      ; DE11   035B
        MOVR    R3,     R7                      ; DE12   009F

        DECLE   $0003,  $0250,  $01E1,  $02EE   ; DE13   0003 0250 01E1 02EE
        DECLE   $00A4,  $0200,  $0222,  $024A   ; DE17   00A4 0200 0222 024A
        DECLE   $00D3,  $026D,  $01D5,  $00F8   ; DE1B   00D3 026D 01D5 00F8
        DECLE   $0005                           ; DE1F   0005

        MOVR    R5,     R7                      ; DE20   00AF

L_DE21:
        MVO@    R4,     R4                      ; DE21   0264
        SUBR    R5,     R1                      ; DE22   0129
        SUBR    R4,     R0                      ; DE23   0120
        DECR    R0                              ; DE24   0010
        MVO     R0,     G_0160                  ; DE25   0240 0160
        MVO@    R6,     R4                      ; DE27   0266
L_DE28:
        DECR    R7                              ; DE28   0017

        DECLE   $00EB,  $027C,  $017E,  $0363   ; DE29   00EB 027C 017E 0363
        DECLE   $02C4,  $0093,  $0018,  $03B1   ; DE2D   02C4 0093 0018 03B1
        DECLE   $03DF                           ; DE31   03DF

        MOVR    R5,     R4                      ; DE32   00AC
        SUB@    R6,     R4                      ; DE33   0334
        ANDR    R3,     R3                      ; DE34   019B
        RRC     R1,     1                       ; DE35   0071
        ADCR    R5                              ; DE36   002D
        SUB     .BTAB.32,R1                     ; DE37   0301 0232
        CMP@    R4,     R2                      ; DE39   0362
L_DE3A:
        XOR@    R1,     R1                      ; DE3A   03C9
        DECLE   $0050,  $023C,  $0162,  $01EE   ; DE3B   0050 023C 0162 01EE
        DECLE   $00C9,  $0002,  $0000           ; DE3F   00C9 0002 0000

        DECR    R0                              ; DE42   0010
        EIS                                     ; DE43   0002
        SLL     R2,     1                       ; DE44   004A
        RSWD    R4                              ; DE45   003C

        JSR     R4,     .EXEC.220               ; DE46   0004 0010 0220
        DECLE   $0049,  $003A,  $0000,  $03A0   ; DE49   0049 003A 0000 03A0
        DECLE   $0001,  $004A,  $01F4,  $00E0   ; DE4D   0001 004A 01F4 00E0
        DECLE   $0000,  $001E,  $03C9,  $0231   ; DE51   0000 001E 03C9 0231

        COMR    R4                              ; DE55   001C
        MOVR    R1,     R6                      ; DE56   008E
        XOR@    R1,     R2                      ; DE57   03CA
        MVI@    R3,     R1                      ; DE58   0299
        MVO@    R5,     R5                      ; DE59   026D
        NOP                                     ; DE5A   0034
        SUB@    R3,     R7                      ; DE5B   031F

        DECLE   $0380,  $027A,  $01A1,  $01CD   ; DE5C   0380 027A 01A1 01CD
        DECLE   $0121,  $001A,  $008D,  $0060   ; DE60   0121 001A 008D 0060
        DECLE   $018E,  $035E,  $0084,  $0000   ; DE64   018E 035E 0084 0000
        DECLE   $005C,  $0207,  $02DB,  $0000   ; DE68   005C 0207 02DB 0000

        CMP@    R2,     R1                      ; DE6C   0351
L_DE6D:
        CMP@    R4,     R6                      ; DE6D   0366
        DECLE   $0002,  $03FE,  $01BF,  $000B   ; DE6E   0002 03FE 01BF 000B
        DECLE   $0050,  $011E,  $0038,  $0000   ; DE72   0050 011E 0038 0000

        ANDR    R1,     R1                      ; DE76   0189
        COMR    R0                              ; DE77   0018
        XORR    R1,     R5                      ; DE78   01CD
        SUBR    R4,     R6                      ; DE79   0126
        SUBR    R3,     R6                      ; DE7A   011E
        SUB@    R1,     R1                      ; DE7B   0309
        GSWD    R2                              ; DE7C   0032
        AND     .BTAB.74,R0                     ; DE7D   0380 0274
        SUBR    R5,     R7                      ; DE7F   012F

        DECLE   $00A4,  $004F,  $0040,  $0000   ; DE80   00A4 004F 0040 0000
        DECLE   $039E,  $01F8,  $0098,  $000B   ; DE84   039E 01F8 0098 000B
        DECLE   $01C0,  $001C,  $00A4,  $00F8   ; DE88   01C0 001C 00A4 00F8
        DECLE   $0098,  $0061,  $0000,  $0004   ; DE8C   0098 0061 0000 0004
        DECLE   $019E,  $01F0,  $0098,  $0085   ; DE90   019E 01F0 0098 0085
        DECLE   $003F,  $0020,  $0020,  $03E0   ; DE94   003F 0020 0020 03E0
        DECLE   $0198,  $02DA,  $01AA,  $0128   ; DE98   0198 02DA 01AA 0128
        DECLE   $0068,  $03F1,  $0299,  $01BF   ; DE9C   0068 03F1 0299 01BF
        DECLE   $0090,  $00FE,  $0042,  $0100   ; DEA0   0090 00FE 0042 0100
        DECLE   $032E,  $03E5,  $006F,  $0266   ; DEA4   032E 03E5 006F 0266
        DECLE   $02E6,  $02CC,  $02FA,  $0283   ; DEA8   02E6 02CC 02FA 0283
        DECLE   $0059,  $03FE,  $02C5,  $01F5   ; DEAC   0059 03FE 02C5 01F5
        DECLE   $00CE,  $0156,  $03C6,  $0053   ; DEB0   00CE 0156 03C6 0053
        DECLE   $0322,  $01D1,  $007F,  $009E   ; DEB4   0322 01D1 007F 009E
        DECLE   $01D3,  $03C6,  $00B6,  $0202   ; DEB8   01D3 03C6 00B6 0202
        DECLE   $0282,  $0229,  $0006,  $0140   ; DEBC   0282 0229 0006 0140
        DECLE   $0255,  $00CE,  $015D,  $0075   ; DEC0   0255 00CE 015D 0075
        DECLE   $0058,  $023D,  $03AB,  $005F   ; DEC4   0058 023D 03AB 005F
        DECLE   $00E2,  $024A,  $00A6,  $02A5   ; DEC8   00E2 024A 00A6 02A5
        DECLE   $0383,  $03A3,  $0301,  $019F   ; DECC   0383 03A3 0301 019F
        DECLE   $012C,  $0216,  $0252,  $03C7   ; DED0   012C 0216 0252 03C7
        DECLE   $0003,  $0012,  $02C0,  $03AC   ; DED4   0003 0012 02C0 03AC
        DECLE   $0253,  $01FB,  $0000,  $0072   ; DED8   0253 01FB 0000 0072
        DECLE   $0370,  $000B,  $00D0,  $0367   ; DEDC   0370 000B 00D0 0367
        DECLE   $00F4,  $007C,  $023E,  $00B7   ; DEE0   00F4 007C 023E 00B7

        AND@    R4,     R0                      ; DEE4   03A0
        ADD@    R3,     R1                      ; DEE5   02D9
        XORR    R2,     R0                      ; DEE6   01D0
        ADDR    R0,     R6                      ; DEE7   00C6
        MVI@    R3,     R3                      ; DEE8   029B
        SUB     .BTAB.83,R6                     ; DEE9   0306 0283
        SUB     G_01B7, R1                      ; DEEB   0301 01B7
        AND@    R5,     R5                      ; DEED   03AD
        BLE     L_DFC2                          ; DEEE   0206 00D2

        ADD@    R4,     R6                      ; DEF0   02E6
        ADDR    R4,     R4                      ; DEF1   00E4
L_DEF2:
        SARC    R0,     1                       ; DEF2   0078
        DECLE   $0135,  $00B7,  $03C0,  $02C7   ; DEF3   0135 00B7 03C0 02C7
        DECLE   $0250,  $00A6,  $0095,  $0283   ; DEF7   0250 00A6 0095 0283
        DECLE   $03C3,  $0001                   ; DEFB   03C3 0001

        SUBR    R2,     R0                      ; DEFD   0110
        GSWD    R1                              ; DEFE   0031
        MVO@    R5,     R2                      ; DEFF   0255
        ADDR    R2,     R2                      ; DF00   00D2
        XORR    R3,     R4                      ; DF01   01DC

        JSR     R4,     L_6D33                  ; DF02   0004 006C 0133

        XORI    #$0246, R6                      ; DF05   03FE 0246
        MOVR    R2,     R7                      ; DF07   0097

        DECLE   $0353,  $01E6,  $00A0,  $027E   ; DF08   0353 01E6 00A0 027E

        MVI     G_0159, R2                      ; DF0C   0282 0159
        XORI    #$00C6, R6                      ; DF0E   03FE 00C6
        SUBR    R4,     R6                      ; DF10   0126
        ADDR    R3,     R6                      ; DF11   00DE
        MOVR    R1,     R7                      ; DF12   008F

        CMP     G_0073, R5                      ; DF13   0345 0073
        RSWD    R4                              ; DF15   003C
        XORR    R1,     R3                      ; DF16   01CB
        ADDR    R0,     R0                      ; DF17   00C0
        ADDR    R4,     R6                      ; DF18   00E6
        XORR    R0,     R6                      ; DF19   01C6
L_DF1A:
        XORR    R0,     R6                      ; DF1A   01C6
        DECLE   $0291,  $0385,  $03A3,  $0339   ; DF1B   0291 0385 03A3 0339
        DECLE   $0187,  $03B9,  $0097,  $00CE   ; DF1F   0187 03B9 0097 00CE
        DECLE   $00B6,  $0164,  $0098,  $0235   ; DF23   00B6 0164 0098 0235
        DECLE   $0300,  $032E,  $00F9,  $0345   ; DF27   0300 032E 00F9 0345
        DECLE   $01F2,  $0011,  $0000,  $03E4   ; DF2B   01F2 0011 0000 03E4
        DECLE   $0185,  $018F,  $0352,  $008D   ; DF2F   0185 018F 0352 008D
        DECLE   $0280,  $03E0,  $0106,  $02FC   ; DF33   0280 03E0 0106 02FC
        DECLE   $01E6,  $0283,  $038F,  $00E4   ; DF37   01E6 0283 038F 00E4
        DECLE   $031A,  $01E7                   ; DF3B   031A 01E7

        CMPR    R7,     R2                      ; DF3D   017A
        ADDR    R4,     R7                      ; DF3E   00E7

        DECLE   $00CE,  $00E5,  $01F4,  $00B4   ; DF3F   00CE 00E5 01F4 00B4
        DECLE   $0247,  $01EB,  $0382,  $00BB   ; DF43   0247 01EB 0382 00BB
        DECLE   $024D,  $02E6,  $008A,  $018F   ; DF47   024D 02E6 008A 018F
        DECLE   $0164,  $0311,  $01E7           ; DF4B   0164 0311 01E7

        MOVR    R7,     R2                      ; DF4E   00BA
        ANDR    R0,     R6                      ; DF4F   0186
        XOR@    R3,     R6                      ; DF50   03DE
        SUB@    R6,     R5                      ; DF51   0335
        AND@    R3,     R3                      ; DF52   039B
        SARC    R0,     2                       ; DF53   007C
L_DF54:
        SUB@    R4,     R5                      ; DF54   0325
        DECLE   $0111,  $037D,  $01D2,  $02B1   ; DF55   0111 037D 01D2 02B1
        DECLE   $0292,  $0179,  $0398,  $0083   ; DF59   0292 0179 0398 0083
        DECLE   $0239,  $03C2,  $0279,  $024E   ; DF5D   0239 03C2 0279 024E
        DECLE   $024D,  $0334,  $031B,  $007C   ; DF61   024D 0334 031B 007C
        DECLE   $0324,  $0051,  $007E,  $03D3   ; DF65   0324 0051 007E 03D3
        DECLE   $00B4,  $0272,  $0171,  $0396   ; DF69   00B4 0272 0171 0396
        DECLE   $00A3,  $0239,  $035E,  $0203   ; DF6D   00A3 0239 035E 0203
        DECLE   $031F,  $0235,  $009A,  $03F8   ; DF71   031F 0235 009A 03F8
        DECLE   $0000,  $00BC,  $003C,  $005D   ; DF75   0000 00BC 003C 005D
        DECLE   $0395,  $007B,  $0007,  $00C4   ; DF79   0395 007B 0007 00C4
        DECLE   $0398,  $005E,  $039A,  $0007   ; DF7D   0398 005E 039A 0007
        DECLE   $0000,  $003C,  $03FC,  $003E   ; DF81   0000 003C 03FC 003E
        DECLE   $0134,  $02CB,  $0034,  $0326   ; DF85   0134 02CB 0034 0326
        DECLE   $03CF,  $00BA,  $01F0,  $0036   ; DF89   03CF 00BA 01F0 0036
        DECLE   $0292,  $0139,  $0295,  $00A0   ; DF8D   0292 0139 0295 00A0
        DECLE   $01F9,  $03E2,  $0261,  $024E   ; DF91   01F9 03E2 0261 024E
        DECLE   $024D,  $0037                   ; DF95   024D 0037

        MVI@    R3,     R1                      ; DF97   0299
        XOR@    R6,     R4                      ; DF98   03F4
        BEQ     L_DC4B                          ; DF99   0224 034F

        ANDI    #$0007, R1                      ; DF9B   03B9 0007
        ADCR    R7                              ; DF9D   002F

        MVI@    R2,     R3                      ; DF9E   0293
L_DF9F:
        SUB@    R5,     R1                      ; DF9F   0329
        DECLE   $021D,  $0080,  $01E9,  $0002   ; DFA0   021D 0080 01E9 0002
        DECLE   $015A,  $01BE,  $026D,  $0233   ; DFA4   015A 01BE 026D 0233

        ADCR    R1                              ; DFA8   0029
        DECR    R1                              ; DFA9   0011
        BLT     L_DF1A                          ; DFAA   0225 0091

        SARC    R1,     2                       ; DFAC   007D
        XOR@    R1,     R2                      ; DFAD   03CA
        MVI@    R4,     R6                      ; DFAE   02A6
        PSHR    R4                              ; DFAF   0274
        SUB@    R6,     R1                      ; DFB0   0331
        MVI@    R3,     R5                      ; DFB1   029D
        MOVR    R4,     R0                      ; DFB2   00A0
        XORR    R3,     R1                      ; DFB3   01D9
        SUBI    #$03FF, R0                      ; DFB4   0338 03FF
L_DFB6:
        CMPR    R3,     R7                      ; DFB6   015F
        DECLE   $0285,  $0233,  $03CB,  $0020   ; DFB7   0285 0233 03CB 0020
        DECLE   $031C,  $02CD,  $0201,  $03CB   ; DFBB   031C 02CD 0201 03CB
        DECLE   $0037                           ; DFBF   0037

        MVI@    R2,     R2                      ; DFC0   0292
        ANDR    R4,     R1                      ; DFC1   01A1
L_DFC2:
        SUB@    R3,     R6                      ; DFC2   031E
        DECLE   $00A2,  $01F9,  $0358,  $0011   ; DFC3   00A2 01F9 0358 0011
        DECLE   $01FF,  $0269,  $0395,  $00EE   ; DFC7   01FF 0269 0395 00EE
        DECLE   $0049,  $0020,  $03CC,  $0000   ; DFCB   0049 0020 03CC 0000

        MOVR    R2,     R3                      ; DFCF   0093
        AND@    R1,     R0                      ; DFD0   0388
        XORR    R6,     R0                      ; DFD1   01F0
L_DFD2:
        SWAP    R0,     1                       ; DFD2   0040
        SAR     R0,     2                       ; DFD3   006C
        XOR@    R4,     R1                      ; DFD4   03E1
        MOVR    R2,     R4                      ; DFD5   0094
        MOVR    R1,     R0                      ; DFD6   0088
        XORR    R7,     R0                      ; DFD7   01F8
        ADDR    R4,     R0                      ; DFD8   00E0
        MOVR    R7,     R0                      ; DFD9   00B8
        RSWD    R6                              ; DFDA   003E
        AND@    R2,     R5                      ; DFDB   0395
        AND     .STIC.Y.0,R3                    ; DFDC   0383 0008
        NEGR    R0                              ; DFDE   0020
        XORI    #$03C2, R0                      ; DFDF   03F8 03C2
L_DFE1:
        AND@    R2,     R6                      ; DFE1   0396
        DECLE   $00FF,  $0048,  $0000,  $03D0   ; DFE2   00FF 0048 0000 03D0
        DECLE   $03A5,  $0135,  $03A9,  $007C   ; DFE6   03A5 0135 03A9 007C
        DECLE   $0225,  $03CD                   ; DFEA   0225 03CD

        MOVR    R7,     R2                      ; DFEC   00BA
        XOR@    R2,     R0                      ; DFED   03D0
        SUBR    R5,     R7                      ; DFEE   012F

        DECLE   $0273,  $00CC,  $021C           ; DFEF   0273 00CC 021C

        INCR    R7                              ; DFF2   000F

        ANDR    R0,     R0                      ; DFF3   0180
L_DFF4:
        ADDR    R5,     R1                      ; DFF4   00E9
        MVII    #$00B1, R1                      ; DFF5   02B9 00B1
        MVI@    R3,     R6                      ; DFF7   029E
        SLR     R3,     1                       ; DFF8   0063
        SUBR    R2,     R1                      ; DFF9   0111
        CMP@    R3,     R6                      ; DFFA   035E
        ADDR    R7,     R5                      ; DFFB   00FD
        CMP@    R4,     R0                      ; DFFC   0360
        DECLE   $0229,  $00E1,  $0000           ; DFFD   0229 00E1 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5035       <entry>
;;  $506C       <entry>
;;  $509E       $50A0  
;;  $50AD       $50EC  
;;  $50C6       $50F6  
;;  $50D6       $50C4  
;;  $50E7       $50F1  
;;  $50EE       $50E5  
;;  $5107       $50FE  
;;  $510C       $5105  
;;  $511F       $5126  
;;  $514C       $514F  
;;  $5195       $6808  
;;  $51AD       $51A9  
;;  $51CE       $519A   $51A0   $51B0   $51BC   $51C5  
;;  $51CF       <entry>
;;  $51E7       $51E4  
;;  $51FE       $51F9  
;;  $521C       $51D4   $520C   $520F   $5217   $5225   $5228   $522C   $5231  
;;  $521D       $5208  
;;  $5233       $51D6   $63B8   $65E4  
;;  $5241       $523B  
;;  $5251       $5244  
;;  $5252       $576F   $57AA   $594C  
;;  $5257       $5B70  
;;  $527B       $5275  
;;  $5288       $5282  
;;  $528C       $5267   $527F   $5286  
;;  $5294       $5290  
;;  $5299       $5295  
;;  $529E       $529A  
;;  $52AF       $52AA  
;;  $52B2       $52A0   $52AD  
;;  $52B3       $527C   $52A4  
;;  $52BC       $515F   $6BB8  
;;  $52CB       $52C7   $62FE   $64CD  
;;  $52D8       $52E0  
;;  $52E8       $52D8  
;;  $52EA       $52F8  
;;  $5305       $513B  
;;  $5326       $5329  
;;  $5327       $530B  
;;  $5354       $5335  
;;  $535D       $5352   $5358  
;;  $535E       $5341   $534C  
;;  $5371       $5363   $5367  
;;  $5372       $5345   $5350  
;;  $5385       $5377   $537B  
;;  $5391       $5395  
;;  $5397       $5392  
;;  $53A1       $5399  
;;  $53B0       $5388   $538A  
;;  $53B1       $52EE  
;;  $53BB       $53E0  
;;  $53D6       $53C9  
;;  $53DE       $53CC   $53D4   $53DB  
;;  $53E9       $532B  
;;  $53F4       $53EC  
;;  $53FB       $5407  
;;  $53FE       $5402  
;;  $540D       $53F2  
;;  $542B       $540B  
;;  $5439       $53AD  
;;  $5455       $5458  
;;  $5461       $5448  
;;  $546F       $5462  
;;  $5477       $547E  
;;  $5480       $5479  
;;  $5486       $5465  
;;  $5493       $54AB  
;;  $54A2       $549E   $54A7  
;;  $54A9       $54A3  
;;  $54AD       $5495  
;;  $54B7       $5468  
;;  $54BC       $54CA  
;;  $54CD       $54C3  
;;  $54CE       $54DB  
;;  $54E0       $54F9   $5565  
;;  $54E1       $54F2  
;;  $54E9       $54ED  
;;  $54EF       $54EA  
;;  $54F6       $5560  
;;  $5511       $5575   $5BFC  
;;  $5512       $5537  
;;  $551F       $5539  
;;  $552D       $552A  
;;  $5533       $5530  
;;  $553B       $5520  
;;  $554B       $546B  
;;  $5560       $559A  
;;  $558B       $558F  
;;  $55A3       <entry>
;;  $55BF       <entry> $55E4   $561E   $566B   $5778   $5C1B  
;;  $55DB       $545D   $5A3D  
;;  $55EB       $55E2  
;;  $55F6       $55EF  
;;  $55FC       $561C  
;;  $5606       $55FA  
;;  $5616       $5612  
;;  $561E       $5609  
;;  $5631       $5624  
;;  $563A       $55F4  
;;  $565C       $5656  
;;  $566B       $5663  
;;  $5678       $567D   $5683  
;;  $5679       $5668  
;;  $568F       $563C  
;;  $56A2       $5640  
;;  $56B3       $55DF   $5621  
;;  $56BA       $56CF  
;;  $56C4       $56C1   $56CA  
;;  $56CC       $56C5  
;;  $56D3       $56C8  
;;  $56EF       $56D1  
;;  $5706       $5702  
;;  $570B       $5707  
;;  $5738       $5720  
;;  $573A       $5724   $5736  
;;  $574E       $5745  
;;  $5753       $56F4   $573B  
;;  $578A       $56F9   $576C   $5772  
;;  $5798       $5790   $5795   $57A0  
;;  $57A8       $5799  
;;  $57B1       $57AE  
;;  $57C4       $57C1  
;;  $57D2       $57CA   $57CE  
;;  $57EB       $57E1  
;;  $57F6       $57D9  
;;  $5815       $580B  
;;  $581B       $5813  
;;  $581F       $57FB  
;;  $5825       $5801  
;;  $5832       $582E  
;;  $5846       $584A  
;;  $584E       $5852  
;;  $5856       $585B  
;;  $5862       $5866  
;;  $5870       $583A  
;;  $587F       $57DD   $57F7  
;;  $5897       $5253  
;;  $58AA       $58A2  
;;  $58BF       $5970  
;;  $58E6       $58D0   $58D8  
;;  $5902       $58E4  
;;  $591F       $58E9  
;;  $5926       $58EE  
;;  $592A       $58D4  
;;  $592E       $58DC  
;;  $5930       $5900  
;;  $5938       $58E0  
;;  $593A       $58FB  
;;  $593C       $5924   $592C   $5936  
;;  $5951       $591D  
;;  $5967       $58F6   $5921   $5928   $5932   $593F   $5949   $594F  
;;  $5970       $5945  
;;  $5974       $5906   $5BF3  
;;  $59A0       $5787   $5821  
;;  $59A3       $59A5  
;;  $59B1       $59AC  
;;  $59B2       $57ED   $5BAE  
;;  $59B5       $59B7  
;;  $59C4       $59BD  
;;  $59CC       $64C0   $6B41   $6B7E  
;;  $59D6       $59DB  
;;  $59DD       $59D7  
;;  $59E9       $59E5  
;;  $59ED       $59F1  
;;  $59F3       $59EE  
;;  $59FB       $59F8  
;;  $59FD       $5A02  
;;  $5A04       $59FE  
;;  $5A0F       $5A09  
;;  $5A10       $538C   $5A04  
;;  $5A18       $5A1D  
;;  $5A1F       $5A19  
;;  $5A31       $5A27   $5A2B  
;;  $5A41       $5A33  
;;  $5A51       $5A4B  
;;  $5A75       $5A6B  
;;  $5AAE       $5AAA  
;;  $5AC3       $5A2F   $5A3B   $5A45   $5A49   $5A54  
;;  $5AEB       $5AE6  
;;  $5AFA       $5AF2  
;;  $5AFB       $5AF8  
;;  $5AFE       $5AE9  
;;  $5B00       $5AE0  
;;  $5B01       $5B62  
;;  $5B4C       $5B87  
;;  $5B58       $5B41  
;;  $5B62       $5B5C  
;;  $5B80       $5B38  
;;  $5B89       $5B73  
;;  $5B9A       $5B91  
;;  $5B9B       $5B19   $5B1E  
;;  $5BA7       $5BA0  
;;  $5BA8       $5BA5  
;;  $5BD9       $5BC9  
;;  $5BDA       $5BDA  
;;  $5BE0       $5688  
;;  $5C14       $56A7   $5BBA  
;;  $5C28       $5C19  
;;  $5C3A       $544B  
;;  $5C5B       $5C4A   $5C51  
;;  $5C6C       $5CAC   $5CCE  
;;  $5C73       $5C75  
;;  $5C94       $5C8C  
;;  $5C9B       $5C92  
;;  $5CA3       $5CA8  
;;  $5CAE       $5CA4  
;;  $5CAF       $5CBB  
;;  $5CC8       $5CC3  
;;  $5CD1       $5C47  
;;  $5CDE       $5CDB  
;;  $5CEA       $5CE7  
;;  $5CED       $5C8F   $5C96  
;;  $5CEE       $5CF4  
;;  $5CF7       $5C57  
;;  $5D04       $5D01   $5D25  
;;  $5D22       $5D1E  
;;  $5D2F       $5C54  
;;  $5D43       $5D40  
;;  $5D4E       $5D52  
;;  $5D58       $5D39  
;;  $5D64       $5D5C  
;;  $5D9F       $5D9D  
;;  $5DA6       $5DA4  
;;  $5DAD       $5DAB  
;;  $5DB4       $5DB2  
;;  $5DBB       $5DB9  
;;  $5DC2       $5DC0  
;;  $5DC9       $5DC7  
;;  $5ED3       $5ED1  
;;  $5EFE       $5EFC  
;;  $5F10       $5F10  
;;  $5F2E       $5F2C  
;;  $6065       $6063  
;;  $61F7       $D347  
;;  $6287       $52C4   $6BAE  
;;  $6295       $629C  
;;  $62A2       $62A7  
;;  $62D8       $62D1  
;;  $62F2       $62EA  
;;  $62F3       $62C6   $6328  
;;  $6301       $6356  
;;  $630F       $541C   $62E4   $630B  
;;  $6319       $62C2  
;;  $6320       $631D  
;;  $6336       $6331  
;;  $6354       $6359  
;;  $6385       $6389  
;;  $63BF       $63BB  
;;  $63E7       $63EC  
;;  $6408       <entry>
;;  $6410       $63E7  
;;  $6411       $6418   $641C   $6482  
;;  $6475       $6477  
;;  $6476       $6466  
;;  $6486       $6484  
;;  $648B       $6472  
;;  $649E       $5832   $6B83  
;;  $64A7       $634D   $635F   $649F  
;;  $64B2       $62EF   $633F  
;;  $64BA       $64CB  
;;  $64BE       $64C6  
;;  $64D7       $5427   $62F4   $633C  
;;  $64E3       $64F2  
;;  $64EA       $64E4  
;;  $64EE       $64E8  
;;  $64FC       $62EC  
;;  $6501       $6506  
;;  $6509       $51FB   $6333   $6B3E  
;;  $6516       $651A  
;;  $6528       $652D  
;;  $6543       <entry>
;;  $655E       $6554  
;;  $6565       $658D  
;;  $6578       $657A  
;;  $657C       $658A  
;;  $6599       $65C5  
;;  $65A0       $65A3  
;;  $65B2       $65BC  
;;  $65D3       $65E2  
;;  $65FB       $6583   $65B7   $65EC  
;;  $65FC       $6616   $6620  
;;  $65FE       $65F8  
;;  $65FF       $6610  
;;  $6600       $65F6  
;;  $660F       $6603  
;;  $661E       $661A  
;;  $6623       $6556  
;;  $6631       $50AA   $637E   $6513  
;;  $6656       $6676  
;;  $6664       $665D   $6673  
;;  $66C9       $6566   $663F  
;;  $66DA       $66DD  
;;  $66F4       $6726  
;;  $66FC       $6738  
;;  $6704       $656B   $6AC1  
;;  $670E       $670A  
;;  $672F       $672C  
;;  $6736       $6733  
;;  $673A       $503A  
;;  $6762       $6786   $6796  
;;  $6788       $6781  
;;  $6790       $67A5  
;;  $6798       $6774   $677E  
;;  $67A0       $67B3  
;;  $67A7       $67A1  
;;  $67B5       $6783  
;;  $67B6       $6822  
;;  $67D6       $6788  
;;  $67DC       $67E2  
;;  $67DF       $67DA  
;;  $67EF       $67AA   $67AD  
;;  $67F8       $6767   $678B   $6794  
;;  $6808       $675E   $67FB   $6800  
;;  $6815       $675A   $686B  
;;  $681A       $6790  
;;  $6832       $6826  
;;  $6860       $67CC   $6830   $683E   $6853  
;;  $6862       $68B2   $6995   $69B0   $69D0   $69E8  
;;  $6891       $688B  
;;  $689B       $686F  
;;  $689C       $6875  
;;  $68A3       $5B97   $6A11  
;;  $68AE       $68A6  
;;  $68AF       $503F   $5102   $5109   $510E   $539D   $5415   $5616   $5633  
;;  $68AF       $57F2   $5817   $586C   $62D5   $6338   $638D   $63E2   $651E  
;;  $68AF       $68AC   $69D5  
;;  $697A       $66C0  
;;  $697E       $587C  
;;  $6987       $53AA   $581B  
;;  $698E       $6985  
;;  $69A5       $522E   $632C  
;;  $69B4       $5219  
;;  $69CA       $69C2  
;;  $69D8       $69B8  
;;  $69D9       $5619   $5636  
;;  $6A0A       $52AF   $593C  
;;  $6A15       <entry>
;;  $6A20       $6A2D  
;;  $6A30       $6A1A  
;;  $6A3F       $6A3B  
;;  $6A48       $6A43  
;;  $6A49       $51B5  
;;  $6A57       $6A4D  
;;  $6A77       $6A73  
;;  $6A8E       $6B1B  
;;  $6AA4       $5074   $59AE   $6A45  
;;  $6AB8       $568B  
;;  $6AC4       $6ABD  
;;  $6AE2       <entry>
;;  $6AE9       $5644   $57A4   $5960   $596C   $5B7C  
;;  $6B07       $6AF3  
;;  $6B17       $6B05  
;;  $6B1D       $59C0  
;;  $6B26       $6B22  
;;  $6B41       $6B3C  
;;  $6B53       $542B  
;;  $6B56       $6B4D  
;;  $6B66       $5A4D  
;;  $6B7E       $6B6F  
;;  $6B86       $6B50   $6B7C  
;;  $6BD1       $6B6A   $6B74   $6B7A  
;;  $6D33       $DF02  
;;  $6F58       $6F56  
;;  $6F7E       $6CD6  
;;  $D04B       $D049  
;;  $D1EF       $D293  
;;  $D222       $D2BE  
;;  $D285       $D424  
;;  $D2B2       $D2B2  
;;  $D2E7       $D053  
;;  $D2E8       $D080  
;;  $D2FE       $D65C  
;;  $D34A       $D144  
;;  $D395       $D141  
;;  $D3F0       $D0E6  
;;  $D426       $D7E7  
;;  $D449       $D402  
;;  $D44E       $D659  
;;  $D45C       $D45A  
;;  $D504       $D1DE  
;;  $D569       $D1BF  
;;  $D5AA       $D931  
;;  $D5F2       $D785  
;;  $D5FA       $D959  
;;  $D63C       $D63A  
;;  $D667       $D2DC  
;;  $D676       $D80E  
;;  $D735       $D3AD  
;;  $D788       $DB60  
;;  $D7DC       $D6AB  
;;  $D815       $DBAD  
;;  $D836       $D87F  
;;  $D87A       $D87A  
;;  $D87B       $D831  
;;  $D8F2       $D8F2  
;;  $D994       $D994  
;;  $DA24       $DA22  
;;  $DA58       $DB8E  
;;  $DB0A       $DB08  
;;  $DB20       $DB25  
;;  $DB41       $D809  
;;  $DB45       $DB43  
;;  $DB47       $DCC6  
;;  $DB88       $DAC0  
;;  $DBCA       $DA5C  
;;  $DBE5       $D997  
;;  $DC32       $DC32  
;;  $DC40       $DC40  
;;  $DC4B       $DF99  
;;  $DCA0       $DABE  
;;  $DCBB       $DA83  
;;  $DCD4       $DB7C  
;;  $DD7D       $DD7B  
;;  $DDB7       $D9D0  
;;  $DE05       $DDE0  
;;  $DE21       $DCFA  
;;  $DE28       $DE28  
;;  $DE3A       $DA9A  
;;  $DE6D       $DBE2  
;;  $DEF2       $DBA6  
;;  $DF1A       $DFAA  
;;  $DF54       $DDB2  
;;  $DF9F       $DF9D  
;;  $DFB6       $DCC2  
;;  $DFC2       $DEEE  
;;  $DFD2       $DCAE  
;;  $DFE1       $DDCA  
;;  $DFF4       $DFF2  
;; ======================================================================== ;;
