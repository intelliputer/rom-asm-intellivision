
        ORG     $5000
.HEADER:
        BIDECLE $5D1A           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $504C           ; 5004  Ptr: Start of game
        BIDECLE $5E4A           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5024           ; 5008  Ptr: GRAM init sequence
        BIDECLE $502E           ; 500A  Ptr: Date/Title
        DECLE   $007E           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0001,  $0003   ; 500F  Color Stack init (0, 1)
        DECLE   $0001,  $0003   ; 5011  Color Stack init (2, 3)
        DECLE   $0001           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TIMER:
        DECLE   $00A3,  $0051,  $0001,  $0000; 501C  Timer dispatch/interval
        BIDECLE $0000           ; 5020  End of timer table

        DECLE   $0000,  $0000                   ; 5022   0000 0000
.GRAM_INIT_5024:
        DECLE   $0021           ; 5024  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 5025  #00-07:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 5027  #08-0F:  CART #08-0F ----
        DECLE   $0021,  $0380   ; 5029  #10-17:  CART #10-17 ----
        DECLE   $0031,  $0380   ; 502B  #18-1F:  CART #18-1F ----
        DECLE   $0040           ; 502D  #20   :  CART #20    ----

.TITLE:
        DECLE   $0051                           ; 502E  Cartridge year
        STRING  "UTOPIA"                        ; 502F  Title string
        DECLE   $0000                           ; 5035  

        DECLE   $0043,  $0050,  $0059,  $0040   ; 5036   0043 0050 0059 0040
        DECLE   $0027                           ; 503A   0027

        RSWD    R0                              ; 503B   0038
        GSWD    R1                              ; 503C   0031
        SLL     R1,     2                       ; 503D   004D
        SWAP    R1,     1                       ; 503E   0041
        RLC     R0,     2                       ; 503F   0054
        RLC     R0,     2                       ; 5040   0054
        SWAP    R1,     2                       ; 5041   0045
        SLL     R0,     2                       ; 5042   004C
L_5043:
        PSHR    R5                              ; 5043   0275
        MVII    #$0200, R4                      ; 5044   02BC 0200
        MVII    #$00F0, R0                      ; 5046   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5048   0004 0114 0338

        PULR    R7                              ; 504B   02B7

.START:
        PSHR    R5                              ; 504C   0275
        MVO     R7,     G_0191                  ; 504D   0247 0191

L_504F:
        JSR     R5,     L_5043                  ; 504F   0004 0150 0043

        CLRR    R3                              ; 5052   01DB
        MVII    #$0229, R4                      ; 5053   02BC 0229

        JSR     R5,     X_PRINT_R5              ; 5055   0004 0118 007B
        STRING  "TERM OF OFFICE:"               ; 5058  
        DECLE   $0000                           ; 5067   0000

        MVII    #$0002, R0                      ; 5068   02B8 0002
        MVII    #$025A, R1                      ; 506A   02B9 025A
        CLRR    R2                              ; 506C   01D2
        SDBD                                    ; 506D   0001
        MVII    #$58FE, R4                      ; 506E   02BC 00FE 0058

        JSR     R5,     .EXEC.910               ; 5071   0004 0118 0110

        CMPI    #$0032, R0                      ; 5074   0378 0032
        BGT     L_507C                          ; 5076   020E 0004

        CMPI    #$0000, R0                      ; 5078   0378 0000
        BGT     L_5081                          ; 507A   020E 0005

L_507C:
        JSR     R5,     X_PLAY_RAZZ2            ; 507C   0004 011C 02BD

        B       L_504F                          ; 507F   0220 0031

L_5081:
        MVO     R0,     G_018F                  ; 5081   0240 018F
L_5083:
        MVII    #$0278, R4                      ; 5083   02BC 0278
        MVII    #$0078, R0                      ; 5085   02B8 0078

        JSR     R5,     X_FILL_ZERO             ; 5087   0004 0114 0338

        CLRR    R3                              ; 508A   01DB
        MVII    #$0279, R4                      ; 508B   02BC 0279

        JSR     R5,     X_PRINT_R5              ; 508D   0004 0118 007B
        STRING  "TURN LENGTH:"                  ; 5090  
        DECLE   $0000                           ; 509C   0000

        MVII    #$0003, R0                      ; 509D   02B8 0003
        MVII    #$02AA, R1                      ; 509F   02B9 02AA
        CLRR    R2                              ; 50A1   01D2
        SDBD                                    ; 50A2   0001
        MVII    #$58FE, R4                      ; 50A3   02BC 00FE 0058

        JSR     R5,     .EXEC.910               ; 50A6   0004 0118 0110

        CMPI    #$0078, R0                      ; 50A9   0378 0078
        BLE     L_50B2                          ; 50AB   0206 0005

L_50AD:
        JSR     R5,     X_PLAY_RAZZ2            ; 50AD   0004 011C 02BD

        B       L_5083                          ; 50B0   0220 002E

L_50B2:
        CMPI    #$001E, R0                      ; 50B2   0378 001E
        BLT     L_50AD                          ; 50B4   0225 0008

        MVO     R0,     G_0190                  ; 50B6   0240 0190
        CLRR    R1                              ; 50B8   01C9
        MVO     R1,     G_0191                  ; 50B9   0241 0191
        B       L_50C1                          ; 50BB   0200 0004

        CLRR    R1                              ; 50BD   01C9
        J       .EXEC.94C                       ; 50BE   0004 0318 014C

L_50C1:
        JSR     R5,     L_5043                  ; 50C1   0004 0150 0043

        MVII    #$032D, R2                      ; 50C4   02BA 032D
        SDBD                                    ; 50C6   0001
        MVII    #$5C95, R1                      ; 50C7   02B9 0095 005C
        MVII    #$0002, R0                      ; 50CA   02B8 0002

        JSR     R5,     X_INIT_MOBS             ; 50CC   0004 0114 02B4

        SDBD                                    ; 50CF   0001
        MVII    #$512F, R1                      ; 50D0   02B9 002F 0051
        SDBD                                    ; 50D3   0001
        MVII    #$5169, R4                      ; 50D4   02BC 0069 0051
L_50D7:
        MVI@    R1,     R2                      ; 50D7   028A
        ADDI    #$0200, R2                      ; 50D8   02FA 0200
        SDBD                                    ; 50DA   0001
        CMPI    #$514C, R1                      ; 50DB   0379 004C 0051
        BGE     L_50E6                          ; 50DE   020D 0006

        SDBD                                    ; 50E0   0001
        MVII    #$4803, R0                      ; 50E1   02B8 0003 0048
        B       L_50EA                          ; 50E4   0200 0004

L_50E6:
        SDBD                                    ; 50E6   0001
        MVII    #$0803, R0                      ; 50E7   02B8 0003 0008

L_50EA:
        JSR     R5,     L_511D                  ; 50EA   0004 0150 011D

        SDBD                                    ; 50ED   0001
        CMPI    #$5169, R1                      ; 50EE   0379 0069 0051
        BNEQ    L_50D7                          ; 50F1   022C 001B

        SDBD                                    ; 50F3   0001
        MVII    #$5125, R0                      ; 50F4   02B8 0025 0051
        MVO     R0,     G_035D                  ; 50F7   0240 035D
        MVII    #$03E8, R0                      ; 50F9   02B8 03E8
        MVO     R0,     G_0165                  ; 50FB   0240 0165
        SWAP    R0,     1                       ; 50FD   0040
        MVO     R0,     G_0166                  ; 50FE   0240 0166
        SWAP    R0,     1                       ; 5100   0040
        MVO     R0,     G_0167                  ; 5101   0240 0167
        SWAP    R0,     1                       ; 5103   0040
        MVO     R0,     G_0168                  ; 5104   0240 0168
        MVI     G_0190, R1                      ; 5106   0281 0190
        MVO     R1,     G_018D                  ; 5108   0241 018D

        JSR     R5,     L_540E                  ; 510A   0004 0154 000E

        MVII    #$0064, R0                      ; 510D   02B8 0064
        MVO     R0,     G_016B                  ; 510F   0240 016B
        MVO     R0,     G_016D                  ; 5111   0240 016D

        JSR     R5,     L_575A                  ; 5113   0004 0154 035A

        MVII    #$0014, R0                      ; 5116   02B8 0014
        MVO     R0,     G_0189                  ; 5118   0240 0189
        MVO     R0,     G_018A                  ; 511A   0240 018A
        PULR    R7                              ; 511C   02B7

L_511D:
        PSHR    R5                              ; 511D   0275
        MVI@    R4,     R3                      ; 511E   02A3
        SLL     R3,     2                       ; 511F   004F
        SLL     R3,     1                       ; 5120   004B
        XORR    R3,     R0                      ; 5121   01D8
        MVO@    R0,     R2                      ; 5122   0250
        INCR    R1                              ; 5123   0009
        PULR    R7                              ; 5124   02B7

        RRC     R0,     2                       ; 5125   0074
        RLC     R3,     2                       ; 5126   0057
        MOVR    R4,     R1                      ; 5127   00A1
        RLC     R3,     2                       ; 5128   0057
        MOVR    R0,     R7                      ; 5129   0087

        DECLE   $0059,  $00B3,  $0059,  $00C1   ; 512A   0059 00B3 0059 00C1
        DECLE   $0059,  $002A,  $003D,  $003E   ; 512E   0059 002A 003D 003E
        DECLE   $003F                           ; 5132   003F

        RLC     R1,     1                       ; 5133   0051
        RLC     R2,     1                       ; 5134   0052
        RLC     R3,     1                       ; 5135   0053
        SLR     R1,     2                       ; 5136   0065
        SLR     R2,     2                       ; 5137   0066
        SLR     R3,     2                       ; 5138   0067
        SAR     R0,     1                       ; 5139   0068
        SAR     R1,     1                       ; 513A   0069
        SARC    R3,     1                       ; 513B   007B
        SARC    R0,     2                       ; 513C   007C
        SARC    R1,     2                       ; 513D   007D
        SARC    R2,     2                       ; 513E   007E
        MOVR    R2,     R0                      ; 513F   0090
        MOVR    R2,     R1                      ; 5140   0091
        TSTR    R2                              ; 5141   0092
        MOVR    R2,     R3                      ; 5142   0093
        MOVR    R2,     R4                      ; 5143   0094
        MOVR    R4,     R3                      ; 5144   00A3
        TSTR    R4                              ; 5145   00A4
        MOVR    R4,     R5                      ; 5146   00A5
        MOVR    R4,     R7                      ; 5147   00A7

        DECLE   $00A8,  $00A9,  $00AA,  $00AB   ; 5148   00A8 00A9 00AA 00AB
        DECLE   $0032,  $0033,  $0035,  $0038   ; 514C   0032 0033 0035 0038
        DECLE   $0046,  $0047,  $0048,  $0049   ; 5150   0046 0047 0048 0049
        DECLE   $004A,  $004B,  $004C,  $005A   ; 5154   004A 004B 004C 005A
        DECLE   $005B,  $005E,  $005F,  $0060   ; 5158   005B 005E 005F 0060
        DECLE   $0061,  $0073,  $0074,  $0075   ; 515C   0061 0073 0074 0075
        DECLE   $0076,  $0088,  $0089,  $008A   ; 5160   0076 0088 0089 008A
        DECLE   $009B,  $009C,  $009D,  $009E   ; 5164   009B 009C 009D 009E
        DECLE   $00B1,  $0013,  $0014,  $0000   ; 5168   00B1 0013 0014 0000

        DECR    R5                              ; 516C   0015
L_516D:
        DECR    R7                              ; 516D   0017

        DECLE   $0000,  $0018,  $001D,  $001E   ; 516E   0000 0018 001D 001E
        DECLE   $0000,  $0020,  $0015,  $001D   ; 5172   0000 0020 0015 001D
        DECLE   $0000,  $0000                   ; 5176   0000 0000

        DECR    R5                              ; 5178   0015
L_5179:
        DECR    R7                              ; 5179   0017

        DECLE   $0000,  $001E,  $0020,  $0015   ; 517A   0000 001E 0020 0015
        DECLE   $0019,  $001E,  $001F           ; 517E   0019 001E 001F

        COMR    R5                              ; 5181   001D
        COMR    R6                              ; 5182   001E
        COMR    R4                              ; 5183   001C
        COMR    R3                              ; 5184   001B
        COMR    R2                              ; 5185   001A
        DECR    R4                              ; 5186   0014
        DECR    R5                              ; 5187   0015
        DECR    R3                              ; 5188   0013
        DECR    R3                              ; 5189   0013
L_518A:
        DECR    R7                              ; 518A   0017

        DECLE   $0000,  $001B,  $001E,  $001C   ; 518B   0000 001B 001E 001C
        DECLE   $0020,  $0018,  $001D,  $001F   ; 518F   0020 0018 001D 001F
        DECLE   $001D,  $0000,  $0000,  $0015   ; 5193   001D 0000 0000 0015
        DECLE   $001D,  $0000,  $0000           ; 5197   001D 0000 0000

        DECR    R5                              ; 519A   0015
L_519B:
        DECR    R7                              ; 519B   0017

        DECLE   $0000,  $0018,  $0019,  $001E   ; 519C   0000 0018 0019 001E
        DECLE   $0000,  $001F                   ; 51A0   0000 001F

        DECR    R6                              ; 51A2   0016
L_51A3:
        PSHR    R5                              ; 51A3   0275
        MVI     G_0191, R1                      ; 51A4   0281 0191
        TSTR    R1                              ; 51A6   0089
        BEQ     L_51AA                          ; 51A7   0204 0001
        PULR    R7                              ; 51A9   02B7

L_51AA:
        MVII    #$0064, R0                      ; 51AA   02B8 0064

        JSR     R5,     X_RAND2                 ; 51AC   0004 0114 029E

        TSTR    R0                              ; 51AF   0080
        BEQ     L_51C6                          ; 51B0   0204 0014
        B       L_51F8                          ; 51B2   0200 0044

L_51B4:
        SDBD                                    ; 51B4   0001
        MVII    #$5D08, R1                      ; 51B5   02B9 0008 005D
        MVI@    R2,     R3                      ; 51B8   0293
        CMPI    #$0004, R0                      ; 51B9   0378 0004
        BLT     L_51C2                          ; 51BB   0205 0005

        XORI    #$0117, R3                      ; 51BD   03FB 0117
L_51BF:
        MVO@    R3,     R2                      ; 51BF   0253
        B       L_51E9                          ; 51C0   0200 0027

L_51C2:
        XORI    #$0107, R3                      ; 51C2   03FB 0107
        B       L_51BF                          ; 51C4   0220 0006

L_51C6:
        MVII    #$031D, R1                      ; 51C6   02B9 031D

L_51C8:
        JSR     R5,     .EXEC.760               ; 51C8   0004 0114 0360

        BEQ     L_51D5                          ; 51CB   0204 0008

        ADDI    #$0008, R1                      ; 51CD   02F9 0008
        CMPI    #$0325, R1                      ; 51CF   0379 0325
        BEQ     L_51C8                          ; 51D1   0224 000A
        B       L_51F8                          ; 51D3   0200 0023

L_51D5:
        MOVR    R1,     R2                      ; 51D5   008A
        SDBD                                    ; 51D6   0001
        MVII    #$5C85, R1                      ; 51D7   02B9 0085 005C

        JSR     R5,     X_INIT_MOB              ; 51DA   0004 0114 02B2

        MVII    #$000C, R0                      ; 51DD   02B8 000C

        JSR     R5,     X_RAND2                 ; 51DF   0004 0114 029E

        TSTR    R0                              ; 51E2   0080
        BNEQ    L_51B4                          ; 51E3   022C 0030

        SDBD                                    ; 51E5   0001
        MVII    #$5D11, R1                      ; 51E6   02B9 0011 005D
L_51E9:
        INCR    R2                              ; 51E9   000A
        MVO@    R1,     R2                      ; 51EA   0251
        MVII    #$0003, R0                      ; 51EB   02B8 0003

        JSR     R5,     X_RAND2                 ; 51ED   0004 0114 029E

        TSTR    R0                              ; 51F0   0080
        BNEQ    L_51F8                          ; 51F1   020C 0005

        INCR    R2                              ; 51F3   000A
        MVII    #$001B, R1                      ; 51F4   02B9 001B
        SWAP    R1,     1                       ; 51F6   0041
        MVO@    R1,     R2                      ; 51F7   0251
L_51F8:
        MVII    #$031D, R1                      ; 51F8   02B9 031D
L_51FA:
        MVII    #$000A, R0                      ; 51FA   02B8 000A

        JSR     R5,     X_RAND2                 ; 51FC   0004 0114 029E

        TSTR    R0                              ; 51FF   0080
        BNEQ    L_5205                          ; 5200   020C 0003

        JSR     R5,     L_520D                  ; 5202   0004 0150 020D

L_5205:
        ADDI    #$0008, R1                      ; 5205   02F9 0008
        CMPI    #$0325, R1                      ; 5207   0379 0325
        BEQ     L_51FA                          ; 5209   0224 0010
        B       L_5236                          ; 520B   0200 0029

L_520D:
        PSHR    R5                              ; 520D   0275
        MVII    #$0004, R0                      ; 520E   02B8 0004

        JSR     R5,     X_RAND2                 ; 5210   0004 0114 029E

        MOVR    R0,     R2                      ; 5213   0082
        ADDI    #$0004, R1                      ; 5214   02F9 0004
        MOVR    R1,     R3                      ; 5216   008B
        MVI@    R3,     R0                      ; 5217   0298

        JSR     R5,     X_UNPK_BYTES            ; 5218   0004 0114 0357

        CMPI    #$0003, R2                      ; 521B   037A 0003
        BEQ     L_522A                          ; 521D   0204 000B

        CMPI    #$0002, R2                      ; 521F   037A 0002
        BEQ     L_522D                          ; 5221   0204 000A

        CMPI    #$0001, R2                      ; 5223   037A 0001
        BEQ     L_5230                          ; 5225   0204 0009

        DECR    R1                              ; 5227   0011
        B       L_5231                          ; 5228   0200 0007

L_522A:
        INCR    R0                              ; 522A   0008
        B       L_5231                          ; 522B   0200 0004

L_522D:
        DECR    R0                              ; 522D   0010
        B       L_5231                          ; 522E   0200 0001

L_5230:
        INCR    R1                              ; 5230   0009

L_5231:
        JSR     R5,     X_PACK_BYTES            ; 5231   0004 0114 034F

        MVO@    R0,     R3                      ; 5234   0258
        PULR    R7                              ; 5235   02B7

L_5236:
        MVII    #$0014, R0                      ; 5236   02B8 0014

        JSR     R5,     X_RAND2                 ; 5238   0004 0114 029E

        TSTR    R0                              ; 523B   0080
        BEQ     L_5240                          ; 523C   0204 0002
        B       L_52B5                          ; 523E   0200 0075

L_5240:
        MVII    #$034D, R1                      ; 5240   02B9 034D

L_5242:
        JSR     R5,     .EXEC.760               ; 5242   0004 0114 0360

        BEQ     L_524F                          ; 5245   0204 0008

        ADDI    #$0008, R1                      ; 5247   02F9 0008
        CMPI    #$0355, R1                      ; 5249   0379 0355
        BEQ     L_5242                          ; 524B   0224 000A
        B       L_52B5                          ; 524D   0200 0066

L_524F:
        CLRR    R0                              ; 524F   01C0
        SDBD                                    ; 5250   0001
        XORI    #$08A4, R0                      ; 5251   03F8 00A4 0008
        MVO@    R0,     R1                      ; 5254   0248
        CLRR    R0                              ; 5255   01C0
        SDBD                                    ; 5256   0001
        XORI    #$D8C0, R0                      ; 5257   03F8 00C0 00D8
        ADDI    #$0005, R1                      ; 525A   02F9 0005
        MVO@    R0,     R1                      ; 525C   0248
        SUBI    #$0004, R1                      ; 525D   0339 0004
        SDBD                                    ; 525F   0001
        MVII    #$5CF2, R0                      ; 5260   02B8 00F2 005C
        MVO@    R0,     R1                      ; 5263   0248
        DECR    R1                              ; 5264   0011

        JSR     R5,     L_526A                  ; 5265   0004 0150 026A

        B       L_52B5                          ; 5268   0200 004B

L_526A:
        PSHR    R5                              ; 526A   0275
        PSHR    R1                              ; 526B   0271
        MOVR    R1,     R2                      ; 526C   008A
        MVII    #$0008, R0                      ; 526D   02B8 0008

        JSR     R5,     X_RAND2                 ; 526F   0004 0114 029E

        PSHR    R0                              ; 5272   0270
        MVII    #$0002, R0                      ; 5273   02B8 0002

        JSR     R5,     X_RAND2                 ; 5275   0004 0114 029E

        TSTR    R0                              ; 5278   0080
        BEQ     L_5284                          ; 5279   0204 0009

        PULR    R0                              ; 527B   02B0
        ADDI    #$0003, R2                      ; 527C   02FA 0003
        ADDI    #$0008, R0                      ; 527E   02F8 0008
L_5280:
        SWAP    R0,     1                       ; 5280   0040
        MVO@    R0,     R2                      ; 5281   0250
        B       L_528B                          ; 5282   0200 0007

L_5284:
        PULR    R0                              ; 5284   02B0
        ADDI    #$0003, R2                      ; 5285   02FA 0003
        ADDI    #$0050, R0                      ; 5287   02F8 0050
        B       L_5280                          ; 5289   0220 000A

L_528B:
        DECR    R2                              ; 528B   0012
        MVII    #$0002, R0                      ; 528C   02B8 0002

        JSR     R5,     X_RAND2                 ; 528E   0004 0114 029E

        TSTR    R0                              ; 5291   0080
        BEQ     L_52AB                          ; 5292   0204 0017

        MVII    #$00A7, R0                      ; 5294   02B8 00A7
        SWAP    R0,     1                       ; 5296   0040
        MVO@    R0,     R2                      ; 5297   0250
        ADDI    #$0002, R2                      ; 5298   02FA 0002
        SDBD                                    ; 529A   0001
        MVII    #$FFFD, R0                      ; 529B   02B8 00FD 00FF
        CLRR    R1                              ; 529E   01C9

L_529F:
        JSR     R5,     X_PACK_BYTES            ; 529F   0004 0114 034F

        MVO@    R0,     R2                      ; 52A2   0250
        PULR    R1                              ; 52A3   02B1
        MVI@    R1,     R0                      ; 52A4   0288
        SDBD                                    ; 52A5   0001
        XORI    #$1000, R0                      ; 52A6   03F8 0000 0010
        MVO@    R0,     R1                      ; 52A9   0248
        PULR    R7                              ; 52AA   02B7

L_52AB:
        CLRR    R0                              ; 52AB   01C0
        SWAP    R0,     1                       ; 52AC   0040
        MVO@    R0,     R2                      ; 52AD   0250
        ADDI    #$0002, R2                      ; 52AE   02FA 0002
        MVII    #$0003, R0                      ; 52B0   02B8 0003
        CLRR    R1                              ; 52B2   01C9
        B       L_529F                          ; 52B3   0220 0015

L_52B5:
        MVII    #$0064, R0                      ; 52B5   02B8 0064

        JSR     R5,     X_RAND2                 ; 52B7   0004 0114 029E

        TSTR    R0                              ; 52BA   0080
        BEQ     L_52BF                          ; 52BB   0204 0002
        B       L_52E5                          ; 52BD   0200 0026

L_52BF:
        MVII    #$033D, R1                      ; 52BF   02B9 033D

L_52C1:
        JSR     R5,     .EXEC.760               ; 52C1   0004 0114 0360

        BEQ     L_52CE                          ; 52C4   0204 0008

        ADDI    #$0008, R1                      ; 52C6   02F9 0008
        CMPI    #$0345, R1                      ; 52C8   0379 0345
        BEQ     L_52C1                          ; 52CA   0224 000A
        B       L_52E5                          ; 52CC   0200 0017

L_52CE:
        CLRR    R0                              ; 52CE   01C0
        SDBD                                    ; 52CF   0001
        XORI    #$0800, R0                      ; 52D0   03F8 0000 0008
        MVO@    R0,     R1                      ; 52D3   0248
        CLRR    R0                              ; 52D4   01C0
        XORI    #$00C0, R0                      ; 52D5   03F8 00C0
        ADDI    #$0005, R1                      ; 52D7   02F9 0005
        MVO@    R0,     R1                      ; 52D9   0248
        SUBI    #$0004, R1                      ; 52DA   0339 0004
        SDBD                                    ; 52DC   0001
        MVII    #$5CFB, R0                      ; 52DD   02B8 00FB 005C
        MVO@    R0,     R1                      ; 52E0   0248
        DECR    R1                              ; 52E1   0011

        JSR     R5,     L_526A                  ; 52E2   0004 0150 026A

L_52E5:
        MVII    #$033D, R1                      ; 52E5   02B9 033D
L_52E7:
        MVII    #$000A, R0                      ; 52E7   02B8 000A

        JSR     R5,     X_RAND2                 ; 52E9   0004 0114 029E

        TSTR    R0                              ; 52EC   0080
        BNEQ    L_52F4                          ; 52ED   020C 0005

        PSHR    R1                              ; 52EF   0271

        JSR     R5,     L_520D                  ; 52F0   0004 0150 020D

        PULR    R1                              ; 52F3   02B1
L_52F4:
        ADDI    #$0008, R1                      ; 52F4   02F9 0008
        CMPI    #$0355, R1                      ; 52F6   0379 0355
        BLE     L_52E7                          ; 52F8   0226 0012

        MVII    #$032D, R1                      ; 52FA   02B9 032D
L_52FC:
        MOVR    R1,     R2                      ; 52FC   008A
        ADDI    #$0001, R2                      ; 52FD   02FA 0001
        MVI@    R2,     R4                      ; 52FF   0294
        SDBD                                    ; 5300   0001
        CMPI    #$5CB5, R4                      ; 5301   037C 00B5 005C
        BEQ     L_530B                          ; 5304   0204 0005

        PSHR    R1                              ; 5306   0271

        JSR     R5,     L_5320                  ; 5307   0004 0150 0320

        PULR    R1                              ; 530A   02B1
L_530B:
        ADDI    #$0008, R1                      ; 530B   02F9 0008
        CMPI    #$0335, R1                      ; 530D   0379 0335
        BEQ     L_52FC                          ; 530F   0224 0014

        MVII    #$033D, R1                      ; 5311   02B9 033D
L_5313:
        PSHR    R1                              ; 5313   0271

        JSR     R5,     L_5320                  ; 5314   0004 0150 0320

        PULR    R1                              ; 5317   02B1
        ADDI    #$0008, R1                      ; 5318   02F9 0008
        CMPI    #$0355, R1                      ; 531A   0379 0355
        BLE     L_5313                          ; 531C   0226 000A
        B       L_53DD                          ; 531E   0200 00BD

L_5320:
        PSHR    R5                              ; 5320   0275
        PSHR    R5                              ; 5321   0275
        CLRR    R3                              ; 5322   01DB
        MVO     R3,     G_01A3                  ; 5323   0243 01A3
        MOVR    R1,     R3                      ; 5325   008B
        ADDI    #$0004, R1                      ; 5326   02F9 0004
        MVI@    R1,     R0                      ; 5328   0288

        JSR     R5,     X_UNPK_BYTES            ; 5329   0004 0114 0357

        MOVR    R1,     R4                      ; 532C   008C
        MOVR    R3,     R1                      ; 532D   0099
        PSHR    R3                              ; 532E   0273

        JSR     R5,     L_5968                  ; 532F   0004 0158 0168

        SUBI    #$0200, R2                      ; 5332   033A 0200
        MVO     R2,     G_01A4                  ; 5334   0242 01A4
        ADDI    #$0200, R2                      ; 5336   02FA 0200
        PULR    R3                              ; 5338   02B3
        MVI@    R3,     R1                      ; 5339   0299
        TSTR    R0                              ; 533A   0080
        BEQ     L_5346                          ; 533B   0204 0009

        SDBD                                    ; 533D   0001
        ANDI    #$FDFF, R1                      ; 533E   03B9 00FF 00FD
        TSTR    R0                              ; 5341   0080
        BPL     L_5346                          ; 5342   0203 0002

        XORI    #$0200, R1                      ; 5344   03F9 0200
L_5346:
        MVO@    R1,     R3                      ; 5346   0259
        TSTR    R0                              ; 5347   0080
L_5348:
        BEQ     L_53B5                          ; 5348   0204 006B
        BPL     L_5358                          ; 534A   0203 000C

        MVI     G_01A3, R1                      ; 534C   0281 01A3
        TSTR    R1                              ; 534E   0089
        BNEQ    L_5354                          ; 534F   020C 0003

        DECR    R2                              ; 5351   0012
        B       L_5362                          ; 5352   0200 000E

L_5354:
        SUBI    #$0014, R2                      ; 5354   033A 0014
        B       L_5362                          ; 5356   0200 000A

L_5358:
        MVI     G_01A3, R1                      ; 5358   0281 01A3
        TSTR    R1                              ; 535A   0089
        BNEQ    L_5360                          ; 535B   020C 0003

        INCR    R2                              ; 535D   000A
        B       L_5362                          ; 535E   0200 0002

L_5360:
        ADDI    #$0014, R2                      ; 5360   02FA 0014
L_5362:
        CMPI    #$0200, R2                      ; 5362   037A 0200
        BMI     L_53B5                          ; 5364   020B 004F

        CMPI    #$02F0, R2                      ; 5366   037A 02F0
        BPL     L_53B5                          ; 5368   0203 004B

        JSR     R5,     L_53D5                  ; 536A   0004 0150 03D5

        BNEQ    L_5377                          ; 536D   020C 0008

        JSR     R5,     L_53CE                  ; 536F   0004 0150 03CE

        TSTR    R1                              ; 5372   0089
        BEQ     L_53B5                          ; 5373   0204 0040
        B       L_538A                          ; 5375   0200 0013

L_5377:
        JSR     R5,     L_53CE                  ; 5377   0004 0150 03CE

        CMPI    #$033D, R3                      ; 537A   037B 033D
        BEQ     L_5386                          ; 537C   0204 0008

        CMPI    #$0345, R3                      ; 537E   037B 0345
        BEQ     L_5386                          ; 5380   0204 0004

        CMPI    #$0008, R1                      ; 5382   0379 0008
        BEQ     L_53B5                          ; 5384   0204 002F

L_5386:
        CMPI    #$0009, R1                      ; 5386   0379 0009
        BEQ     L_53B5                          ; 5388   0204 002B

L_538A:
        MOVR    R3,     R1                      ; 538A   0099
        MVI     G_01A3, R2                      ; 538B   0282 01A3
        TSTR    R2                              ; 538D   0092
        BNEQ    L_5395                          ; 538E   020C 0005

        ADDI    #$0002, R1                      ; 5390   02F9 0002
        PSHR    R0                              ; 5392   0270
        B       L_5398                          ; 5393   0200 0003

L_5395:
        ADDI    #$0003, R1                      ; 5395   02F9 0003
        PSHR    R4                              ; 5397   0274
L_5398:
        MVI@    R1,     R2                      ; 5398   028A
        SWAP    R2,     1                       ; 5399   0042
        PULR    R5                              ; 539A   02B5
        TSTR    R5                              ; 539B   00AD
        BPL     L_53A5                          ; 539C   0203 0007

        CMPI    #$00A0, R2                      ; 539E   037A 00A0
        BGE     L_53AA                          ; 53A0   020D 0008

        INCR    R2                              ; 53A2   000A
        B       L_53AA                          ; 53A3   0200 0005

L_53A5:
        CMPI    #$0008, R2                      ; 53A5   037A 0008
        BLE     L_53AA                          ; 53A7   0206 0001

        DECR    R2                              ; 53A9   0012
L_53AA:
        SWAP    R2,     1                       ; 53AA   0042
        MVO@    R2,     R1                      ; 53AB   024A
        MVI     G_01A3, R5                      ; 53AC   0285 01A3
        TSTR    R5                              ; 53AE   00AD
        BNEQ    L_53B4                          ; 53AF   020C 0003

        CLRR    R0                              ; 53B1   01C0
        B       L_53B5                          ; 53B2   0200 0001

L_53B4:
        CLRR    R4                              ; 53B4   01E4
L_53B5:
        MVI     G_01A3, R2                      ; 53B5   0282 01A3
        TSTR    R2                              ; 53B7   0092
        BNEQ    L_53C4                          ; 53B8   020C 000A

        INCR    R2                              ; 53BA   000A
        MVO     R2,     G_01A3                  ; 53BB   0242 01A3
        MVI     G_01A4, R2                      ; 53BD   0282 01A4
        ADDI    #$0200, R2                      ; 53BF   02FA 0200
        TSTR    R4                              ; 53C1   00A4
        B       L_5348                          ; 53C2   0220 007B

L_53C4:
        MOVR    R4,     R1                      ; 53C4   00A1

        JSR     R5,     X_PACK_BYTES            ; 53C5   0004 0114 034F

        MOVR    R3,     R2                      ; 53C8   009A
        ADDI    #$0004, R2                      ; 53C9   02FA 0004
        MVO@    R0,     R2                      ; 53CB   0250
        PULR    R5                              ; 53CC   02B5
        PULR    R7                              ; 53CD   02B7

L_53CE:
        PSHR    R5                              ; 53CE   0275
        MVI@    R2,     R1                      ; 53CF   0291
        SLR     R1,     2                       ; 53D0   0065
        SLR     R1,     1                       ; 53D1   0061
        ANDI    #$00FF, R1                      ; 53D2   03B9 00FF
        PULR    R7                              ; 53D4   02B7

L_53D5:
        PSHR    R5                              ; 53D5   0275
        MVI@    R2,     R1                      ; 53D6   0291
        SDBD                                    ; 53D7   0001
        ANDI    #$0800, R1                      ; 53D8   03B9 0000 0008
        TSTR    R1                              ; 53DB   0089
        PULR    R7                              ; 53DC   02B7

L_53DD:
        MVI     G_018C, R0                      ; 53DD   0280 018C
        INCR    R0                              ; 53DF   0008
        CMPI    #$0014, R0                      ; 53E0   0378 0014
        BNEQ    L_53E5                          ; 53E2   020C 0001

        CLRR    R0                              ; 53E4   01C0
L_53E5:
        MVO     R0,     G_018C                  ; 53E5   0240 018C
        DECLE   $0080,  $020C,  $001B,  $0280   ; 53E7   0080 020C 001B 0280
        DECLE   $018D,  $0010,  $0080,  $020C   ; 53EB   018D 0010 0080 020C
        DECLE   $0013,  $0004,  $015C,  $03EF   ; 53EF   0013 0004 015C 03EF

        JSR     R5,     L_59CD                  ; 53F3   0004 0158 01CD

        MVI     G_018E, R1                      ; 53F6   0281 018E
        INCR    R1                              ; 53F8   0009
        MVO     R1,     G_018E                  ; 53F9   0241 018E
        B       L_5429                          ; 53FB   0200 002C

L_53FD:
        CMP     G_018F, R1                      ; 53FD   0341 018F
        BGE     L_547E                          ; 53FF   020D 007D

        MVI     G_0190, R0                      ; 5401   0280 0190
        MVO     R0,     G_018D                  ; 5403   0240 018D

        JSR     R5,     L_540E                  ; 5405   0004 0154 000E
        JSR     R5,     L_575A                  ; 5408   0004 0154 035A

        J       L_54E8                          ; 540B   0004 0354 00E8

L_540E:
        PSHR    R5                              ; 540E   0275
        MVI     G_018F, R0                      ; 540F   0280 018F
        SUB     G_018E, R0                      ; 5411   0300 018E
        MVII    #$0002, R1                      ; 5413   02B9 0002
        CLRR    R3                              ; 5415   01DB
        XORI    #$0006, R3                      ; 5416   03FB 0006
        MVII    #$02E3, R4                      ; 5418   02BC 02E3

        JSR     R5,     X_PRNUM_RGT             ; 541A   0004 0118 00C5

        MVI     G_018D, R0                      ; 541D   0280 018D
        MVII    #$0004, R1                      ; 541F   02B9 0004
        MVII    #$02E5, R4                      ; 5421   02BC 02E5

        JSR     R5,     X_PRNUM_RGT             ; 5423   0004 0118 00C5

        J       L_54E8                          ; 5426   0004 0354 00E8

L_5429:
        CLRR    R1                              ; 5429   01C9

        JSR     R5,     L_59AC                  ; 542A   0004 0158 01AC

        MVII    #$0001, R1                      ; 542D   02B9 0001

        JSR     R5,     L_59AC                  ; 542F   0004 0158 01AC

L_5432:
        MVII    #$02E3, R4                      ; 5432   02BC 02E3
        CLRR    R3                              ; 5434   01DB
        XORI    #$0007, R3                      ; 5435   03FB 0007
        MVI     G_0192, R1                      ; 5437   0281 0192
        TSTR    R1                              ; 5439   0089
        BNEQ    L_5448                          ; 543A   020C 000C

        JSR     R5,     X_PRINT_R5              ; 543C   0004 0118 007B
        STRING  "SCORES"                        ; 543F  
        DECLE   $0000                           ; 5445   0000

        B       L_5452                          ; 5446   0200 000A

L_5448:
        JSR     R5,     X_PRINT_R5              ; 5448   0004 0118 007B
        STRING  "TOTALS"                        ; 544B  
        DECLE   $0000                           ; 5451   0000
L_5452:
        SDBD                                    ; 5452   0001
        MVII    #$30D4, R4                      ; 5453   02BC 00D4 0030
L_5456:
        SDBD                                    ; 5456   0001
        MVII    #$4572, R1                      ; 5457   02B9 0072 0045

        JSR     R5,     X_RAND2                 ; 545A   0004 0114 029E

        DECR    R4                              ; 545D   0014
        TSTR    R4                              ; 545E   00A4
        BPL     L_5456                          ; 545F   0223 000A

        MVI     G_0192, R1                      ; 5461   0281 0192
        TSTR    R1                              ; 5463   0089
        BNEQ    L_5475                          ; 5464   020C 000F

        MVII    #$0001, R1                      ; 5466   02B9 0001
        MVO     R1,     G_0192                  ; 5468   0241 0192
        CLRR    R1                              ; 546A   01C9

        JSR     R5,     L_5987                  ; 546B   0004 0158 0187

        MVII    #$0001, R1                      ; 546E   02B9 0001

        JSR     R5,     L_5987                  ; 5470   0004 0158 0187

        B       L_5432                          ; 5473   0220 0042

L_5475:
        CLRR    R1                              ; 5475   01C9
        MVO     R1,     G_0192                  ; 5476   0241 0192
        MVO     R1,     G_018B                  ; 5478   0241 018B
        MVI     G_018E, R1                      ; 547A   0281 018E
        B       L_53FD                          ; 547C   0220 0080

L_547E:
        SDBD                                    ; 547E   0001
        MVII    #$1906, R0                      ; 547F   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5482   0240 035D
        MVII    #$0001, R0                      ; 5484   02B8 0001
        MVO     R0,     G_0191                  ; 5486   0240 0191
        CLRR    R3                              ; 5488   01DB
        MVII    #$02CC, R4                      ; 5489   02BC 02CC

        JSR     R5,     X_PRINT_R5              ; 548B   0004 0118 007B
        STRING  "FINAL  SCORE"                  ; 548E  
        DECLE   $0000                           ; 549A   0000

        JSR     R5,     .EXEC.7B3               ; 549B   0004 0114 03B3

        PULR    R7                              ; 549E   02B7

        PSHR    R5                              ; 549F   0275

        JSR     R5,     L_5968                  ; 54A0   0004 0158 0168
        JSR     R5,     L_53CE                  ; 54A3   0004 0150 03CE

        CMPI    #$0009, R1                      ; 54A6   0379 0009
        BNEQ    L_54CA                          ; 54A8   020C 0020

        MVI@    R2,     R1                      ; 54AA   0291
        SLLC    R1,     2                       ; 54AB   005D
        BOV     L_54B2                          ; 54AC   0202 0004

        MVII    #$0001, R1                      ; 54AE   02B9 0001
        B       L_54B3                          ; 54B0   0200 0001

L_54B2:
        CLRR    R1                              ; 54B2   01C9
L_54B3:
        MVO     R1,     G_0187                  ; 54B3   0241 0187
L_54B5:
        MVII    #$0193, R1                      ; 54B5   02B9 0193
        ADD     G_0187, R1                      ; 54B7   02C1 0187
        MVI@    R1,     R2                      ; 54B9   028A
        INCR    R2                              ; 54BA   000A
        CMPI    #$0032, R2                      ; 54BB   037A 0032
        BNEQ    L_54C9                          ; 54BD   020C 000A

        CLRR    R2                              ; 54BF   01D2
        MVO@    R2,     R1                      ; 54C0   024A

        JSR     R5,     L_54D2                  ; 54C1   0004 0154 00D2
        JSR     R5,     L_5FD4                  ; 54C4   0004 015C 03D4

        B       L_54CA                          ; 54C7   0200 0001

L_54C9:
        MVO@    R2,     R1                      ; 54C9   024A
L_54CA:
        PULR    R7                              ; 54CA   02B7

        PSHR    R5                              ; 54CB   0275
        SUBI    #$0002, R0                      ; 54CC   0338 0002
        MVO     R0,     G_0187                  ; 54CE   0240 0187
        B       L_54B5                          ; 54D0   0220 001C

L_54D2:
        PSHR    R5                              ; 54D2   0275
        MVII    #$016B, R4                      ; 54D3   02BC 016B

        JSR     R5,     L_5A29                  ; 54D5   0004 0158 0229

        SDBD                                    ; 54D8   0001
        MVI@    R4,     R1                      ; 54D9   02A1
        INCR    R1                              ; 54DA   0009
        SUBI    #$0002, R4                      ; 54DB   033C 0002
        MVO@    R1,     R4                      ; 54DD   0261
        SWAP    R1,     1                       ; 54DE   0041
        MVO@    R1,     R4                      ; 54DF   0261
        MVII    #$0169, R1                      ; 54E0   02B9 0169
        ADD     G_0187, R1                      ; 54E2   02C1 0187
        MVI@    R1,     R2                      ; 54E4   028A
        INCR    R2                              ; 54E5   000A
        MVO@    R2,     R1                      ; 54E6   024A
        PULR    R7                              ; 54E7   02B7

L_54E8:
        MVI     G_0199, R2                      ; 54E8   0282 0199
        TSTR    R2                              ; 54EA   0092
        BNEQ    L_5555                          ; 54EB   020C 0068
        PULR    R7                              ; 54ED   02B7

        PSHR    R5                              ; 54EE   0275
        MVI     G_0199, R2                      ; 54EF   0282 0199
        TSTR    R2                              ; 54F1   0092
        BNEQ    L_54F7                          ; 54F2   020C 0003

        JSR     R5,     L_54F8                  ; 54F4   0004 0154 00F8

L_54F7:
        PULR    R7                              ; 54F7   02B7

L_54F8:
        PSHR    R5                              ; 54F8   0275
        MOVR    R1,     R4                      ; 54F9   008C

        JSR     R5,     L_5968                  ; 54FA   0004 0158 0168
        JSR     R5,     L_53CE                  ; 54FD   0004 0150 03CE

        CMPI    #$0009, R1                      ; 5500   0379 0009
        BNEQ    L_553B                          ; 5502   020C 0037

        MOVR    R4,     R1                      ; 5504   00A1
        PSHR    R2                              ; 5505   0272
        PSHR    R4                              ; 5506   0274

        JSR     R5,     L_564A                  ; 5507   0004 0154 024A

        PULR    R4                              ; 550A   02B4
        PULR    R2                              ; 550B   02B2
        TSTR    R1                              ; 550C   0089
        BNEQ    L_553C                          ; 550D   020C 002D

L_550F:
        MVI@    R2,     R1                      ; 550F   0291
        SLLC    R1,     2                       ; 5510   005D
        BOV     L_554C                          ; 5511   0202 0039

        CMPI    #$0335, R4                      ; 5513   037C 0335
        BEQ     L_553B                          ; 5515   0204 0024

        MVII    #$0001, R1                      ; 5517   02B9 0001
        MVO     R1,     G_0187                  ; 5519   0241 0187
L_551B:
        MVII    #$0195, R1                      ; 551B   02B9 0195
        ADD     G_0187, R1                      ; 551D   02C1 0187
        MVI@    R1,     R0                      ; 551F   0288
        INCR    R0                              ; 5520   0008
        CMPI    #$0014, R0                      ; 5521   0378 0014
        BLT     L_553A                          ; 5523   0205 0015

        MVII    #$0009, R3                      ; 5525   02BB 0009

        JSR     R5,     L_570D                  ; 5527   0004 0154 030D

L_552A:
        SUBI    #$0200, R2                      ; 552A   033A 0200
        DECLE   $0242,  $0198,  $02BA,  $0001   ; 552C   0242 0198 02BA 0001
        DECLE   $0242,  $0199,  $02BA,  $000A   ; 5530   0242 0199 02BA 000A
        DECLE   $0242,  $0197,  $0004,  $015C   ; 5534   0242 0197 0004 015C
        DECLE   $03A8                           ; 5538   03A8

        CLRR    R0                              ; 5539   01C0
L_553A:
        MVO@    R0,     R1                      ; 553A   0248
L_553B:
        PULR    R7                              ; 553B   02B7

L_553C:
        MVI@    R2,     R1                      ; 553C   0291
        MVI     G_0187, R0                      ; 553D   0280 0187
        SLLC    R1,     2                       ; 553F   005D
        BOV     L_5547                          ; 5540   0202 0005

        TSTR    R0                              ; 5542   0080
        BNEQ    L_553B                          ; 5543   022C 0009
        B       L_550F                          ; 5545   0220 0037

L_5547:
        TSTR    R0                              ; 5547   0080
        BEQ     L_553B                          ; 5548   0224 000E
        B       L_550F                          ; 554A   0220 003C

L_554C:
        CMPI    #$032D, R4                      ; 554C   037C 032D
        BEQ     L_553B                          ; 554E   0224 0014

        CLRR    R1                              ; 5550   01C9
        MVO     R1,     G_0187                  ; 5551   0241 0187
        B       L_551B                          ; 5553   0220 0039

L_5555:
        MVI     G_019A, R0                      ; 5555   0280 019A
        INCR    R0                              ; 5557   0008
        MVI     G_0197, R1                      ; 5558   0281 0197
        CMPI    #$0010, R1                      ; 555A   0379 0010
        BLT     L_5562                          ; 555C   0205 0004

        CMPI    #$0013, R0                      ; 555E   0378 0013
        B       L_5564                          ; 5560   0200 0002

L_5562:
        CMPI    #$0006, R0                      ; 5562   0378 0006
L_5564:
        BEQ     L_5569                          ; 5564   0204 0003

        MVO     R0,     G_019A                  ; 5566   0240 019A
        PULR    R7                              ; 5568   02B7

L_5569:
        CLRR    R0                              ; 5569   01C0
        MVO     R0,     G_019A                  ; 556A   0240 019A
        MVI     G_0197, R0                      ; 556C   0280 0197
        MVI     G_0198, R2                      ; 556E   0282 0198
        ADDI    #$0200, R2                      ; 5570   02FA 0200
        MVI@    R2,     R1                      ; 5572   0291
        INCR    R0                              ; 5573   0008
        CMPI    #$0013, R0                      ; 5574   0378 0013
        BGE     L_5588                          ; 5576   020D 0010

        SDBD                                    ; 5578   0001
        ANDI    #$F807, R1                      ; 5579   03B9 0007 00F8
        MOVR    R0,     R3                      ; 557C   0083
        SLL     R3,     2                       ; 557D   004F
        SLL     R3,     1                       ; 557E   004B
        SDBD                                    ; 557F   0001
        ANDI    #$07F8, R3                      ; 5580   03BB 00F8 0007
        XORR    R3,     R1                      ; 5583   01D9
        MVO@    R1,     R2                      ; 5584   0251
        MVO     R0,     G_0197                  ; 5585   0240 0197
        PULR    R7                              ; 5587   02B7

L_5588:
        SDBD                                    ; 5588   0001
        ANDI    #$3000, R1                      ; 5589   03B9 0000 0030
        MVO@    R1,     R2                      ; 558C   0251
        CLRR    R1                              ; 558D   01C9
        MVO     R1,     G_0199                  ; 558E   0241 0199
        PULR    R7                              ; 5590   02B7

L_5591:
        PSHR    R5                              ; 5591   0275
        MVI     G_0199, R0                      ; 5592   0280 0199
        TSTR    R0                              ; 5594   0080
        BNEQ    L_54F7                          ; 5595   022C 009F
        B       L_552A                          ; 5597   0220 006E

        PSHR    R5                              ; 5599   0275
L_559A:
        MVI@    R1,     R0                      ; 559A   0288
        SDBD                                    ; 559B   0001
        XORI    #$8000, R0                      ; 559C   03F8 0000 0080
        MVO@    R0,     R1                      ; 559F   0248
        ADDI    #$0001, R1                      ; 55A0   02F9 0001
        MVI@    R1,     R0                      ; 55A2   0288
        SDBD                                    ; 55A3   0001
        CMPI    #$5CFB, R0                      ; 55A4   0378 00FB 005C
        BEQ     L_55B1                          ; 55A7   0204 0008

        MVO     R0,     G_032C                  ; 55A9   0240 032C
        SDBD                                    ; 55AB   0001
        MVII    #$5CE4, R0                      ; 55AC   02B8 00E4 005C
        B       L_55B5                          ; 55AF   0200 0004

L_55B1:
        SDBD                                    ; 55B1   0001
        MVII    #$5CEB, R0                      ; 55B2   02B8 00EB 005C
L_55B5:
        MVO@    R0,     R1                      ; 55B5   0248
        DECLE   $02F9,  $0005,  $02B8,  $0030   ; 55B6   02F9 0005 02B8 0030
        DECLE   $0248,  $0004,  $015C,  $03A8   ; 55BA   0248 0004 015C 03A8

        PULR    R7                              ; 55BE   02B7

        PSHR    R5                              ; 55BF   0275
        MOVR    R3,     R0                      ; 55C0   0098
        MOVR    R1,     R2                      ; 55C1   008A

        JSR     R5,     .EXEC.76C               ; 55C2   0004 0114 036C

        ADDI    #$0001, R1                      ; 55C5   02F9 0001
        MVI@    R1,     R0                      ; 55C7   0288
        SDBD                                    ; 55C8   0001
        CMPI    #$5CD3, R0                      ; 55C9   0378 00D3 005C
        BNEQ    L_55D8                          ; 55CC   020C 000A

        MOVR    R2,     R1                      ; 55CE   0091

        JSR     R5,     L_564A                  ; 55CF   0004 0154 024A

        TSTR    R1                              ; 55D2   0089
        BNEQ    L_55D9                          ; 55D3   020C 0004

L_55D5:
        MOVR    R2,     R1                      ; 55D5   0091
        B       L_559A                          ; 55D6   0220 003D
L_55D8:
        PULR    R7                              ; 55D8   02B7

L_55D9:
        MVI     G_0187, R1                      ; 55D9   0281 0187
        TSTR    R1                              ; 55DB   0089
        BNEQ    L_55E3                          ; 55DC   020C 0005

        CMPI    #$032D, R2                      ; 55DE   037A 032D
        BNEQ    L_55D5                          ; 55E0   022C 000C
        PULR    R7                              ; 55E2   02B7

L_55E3:
        CMPI    #$0335, R2                      ; 55E3   037A 0335
        BNEQ    L_55D5                          ; 55E5   022C 0011
        PULR    R7                              ; 55E7   02B7

        PSHR    R5                              ; 55E8   0275
        MVI@    R1,     R2                      ; 55E9   028A
        SDBD                                    ; 55EA   0001
        XORI    #$1000, R2                      ; 55EB   03FA 0000 0010
        MVO@    R2,     R1                      ; 55EE   024A
        MVI     G_032C, R3                      ; 55EF   0283 032C
        MOVR    R1,     R2                      ; 55F1   008A
        CMPI    #$032D, R1                      ; 55F2   0379 032D
        BNEQ    L_560C                          ; 55F4   020C 0016

        SDBD                                    ; 55F6   0001
        CMPI    #$5CD3, R3                      ; 55F7   037B 00D3 005C
        BEQ     L_5601                          ; 55FA   0204 0005

        MVI     G_017F, R0                      ; 55FC   0280 017F
        DECR    R0                              ; 55FE   0010
        MVO     R0,     G_017F                  ; 55FF   0240 017F
L_5601:
        CLRR    R1                              ; 5601   01C9
        MVO     R1,     G_019B                  ; 5602   0241 019B
        SDBD                                    ; 5604   0001
        MVII    #$5C95, R1                      ; 5605   02B9 0095 005C

L_5608:
        JSR     R5,     X_INIT_MOB              ; 5608   0004 0114 02B2

        PULR    R7                              ; 560B   02B7

L_560C:
        SDBD                                    ; 560C   0001
        CMPI    #$5CD3, R3                      ; 560D   037B 00D3 005C
        BEQ     L_5617                          ; 5610   0204 0005

        MVI     G_0180, R0                      ; 5612   0280 0180
        DECR    R0                              ; 5614   0010
        MVO     R0,     G_0180                  ; 5615   0240 0180
L_5617:
        CLRR    R1                              ; 5617   01C9
        MVO     R1,     G_019C                  ; 5618   0241 019C
        SDBD                                    ; 561A   0001
        MVII    #$5CA5, R1                      ; 561B   02B9 00A5 005C
        B       L_5608                          ; 561E   0220 0017

        PSHR    R5                              ; 5620   0275

        JSR     R5,     L_564A                  ; 5621   0004 0154 024A

        TSTR    R1                              ; 5624   0089
        BNEQ    L_55D8                          ; 5625   022C 004E

        MOVR    R2,     R1                      ; 5627   0091
        B       L_559A                          ; 5628   0220 008F

        JSR     R5,     .EXEC.7AE               ; 562A   0004 0114 03AE

        PULR    R7                              ; 562D   02B7

        PSHR    R5                              ; 562E   0275
        MOVR    R3,     R0                      ; 562F   0098
        MOVR    R1,     R2                      ; 5630   008A

        JSR     R5,     .EXEC.76C               ; 5631   0004 0114 036C

        ADDI    #$0001, R1                      ; 5634   02F9 0001
        MVI@    R1,     R0                      ; 5636   0288
        SDBD                                    ; 5637   0001
        CMPI    #$5D08, R0                      ; 5638   0378 0008 005D
        BEQ     L_55D8                          ; 563B   0224 0064

        MOVR    R2,     R1                      ; 563D   0091
        B       L_559A                          ; 563E   0220 00A5

        PSHR    R5                              ; 5640   0275
        MOVR    R3,     R0                      ; 5641   0098

        JSR     R5,     .EXEC.76C               ; 5642   0004 0114 036C

        ADDI    #$0004, R1                      ; 5645   02F9 0004
        CLRR    R0                              ; 5647   01C0
        MVO@    R0,     R1                      ; 5648   0248
        PULR    R7                              ; 5649   02B7

L_564A:
        PSHR    R5                              ; 564A   0275
        PSHR    R1                              ; 564B   0271

        JSR     R5,     L_5968                  ; 564C   0004 0158 0168

L_564F:
        CLRR    R0                              ; 564F   01C0
L_5650:
        SDBD                                    ; 5650   0001
        MVII    #$5689, R4                      ; 5651   02BC 0089 0056
L_5654:
        MVI@    R4,     R1                      ; 5654   02A1
        TSTR    R0                              ; 5655   0080
        BNEQ    L_565B                          ; 5656   020C 0003

        ADDR    R2,     R1                      ; 5658   00D1
        B       L_565F                          ; 5659   0200 0004

L_565B:
        PSHR    R2                              ; 565B   0272
        SUBR    R1,     R2                      ; 565C   010A
        MOVR    R2,     R1                      ; 565D   0091
        PULR    R2                              ; 565E   02B2
L_565F:
        MVI@    R1,     R3                      ; 565F   028B
        SLR     R3,     2                       ; 5660   0067
        SLR     R3,     1                       ; 5661   0063
        ANDI    #$00FF, R3                      ; 5662   03BB 00FF
        CMPI    #$0001, R3                      ; 5664   037B 0001
        BEQ     L_567A                          ; 5666   0204 0012

        SDBD                                    ; 5668   0001
        CMPI    #$568D, R4                      ; 5669   037C 008D 0056
        BEQ     L_5670                          ; 566C   0204 0002
        B       L_5654                          ; 566E   0220 001B

L_5670:
        TSTR    R0                              ; 5670   0080
        BNEQ    L_5677                          ; 5671   020C 0004

        MVII    #$0001, R0                      ; 5673   02B8 0001
        B       L_5650                          ; 5675   0220 0026

L_5677:
        CLRR    R1                              ; 5677   01C9
        PULR    R2                              ; 5678   02B2
        PULR    R7                              ; 5679   02B7

L_567A:
        MVI@    R1,     R3                      ; 567A   028B
        SLLC    R3,     2                       ; 567B   005F
        BOV     L_5686                          ; 567C   0202 0008

        MVII    #$0001, R3                      ; 567E   02BB 0001
L_5680:
        MVO     R3,     G_0187                  ; 5680   0243 0187
        MVII    #$0001, R1                      ; 5682   02B9 0001
        PULR    R2                              ; 5684   02B2
        PULR    R7                              ; 5685   02B7

L_5686:
        CLRR    R3                              ; 5686   01DB
        B       L_5680                          ; 5687   0220 0008

        DECLE   $0001                           ; 5689   0001

        DECR    R3                              ; 568A   0013
        DECR    R4                              ; 568B   0014
        DECR    R5                              ; 568C   0015
L_568D:
        PSHR    R5                              ; 568D   0275
        PSHR    R1                              ; 568E   0271
        B       L_564F                          ; 568F   0220 0041

        PSHR    R5                              ; 5691   0275
        MOVR    R1,     R2                      ; 5692   008A
        INCR    R2                              ; 5693   000A
        MVI@    R2,     R3                      ; 5694   0293
        SDBD                                    ; 5695   0001
        CMPI    #$5D11, R3                      ; 5696   037B 0011 005D
        BNEQ    L_56A1                          ; 5699   020C 0006

        MVII    #$0005, R2                      ; 569B   02BA 0005
L_569D:
        MVO     R2,     G_019F                  ; 569D   0242 019F
        B       L_56AF                          ; 569F   0200 000E

L_56A1:
        MVI@    R1,     R0                      ; 56A1   0288
        ANDI    #$0010, R0                      ; 56A2   03B8 0010
        TSTR    R0                              ; 56A4   0080
        BNEQ    L_56AB                          ; 56A5   020C 0004

        MVII    #$0001, R2                      ; 56A7   02BA 0001
        B       L_569D                          ; 56A9   0220 000D

L_56AB:
        CLRR    R2                              ; 56AB   01D2
        B       L_569D                          ; 56AC   0220 0010
        PULR    R7                              ; 56AE   02B7

L_56AF:
        JSR     R5,     L_5968                  ; 56AF   0004 0158 0168

        MVI@    R2,     R3                      ; 56B2   0293
        SLLC    R3,     1                       ; 56B3   005B
        BNC     L_56FF                          ; 56B4   0209 0049

        SLLC    R3,     1                       ; 56B6   005B
        BNC     L_5701                          ; 56B7   0209 0048

        CLRR    R0                              ; 56B9   01C0
        MVO     R0,     G_0187                  ; 56BA   0240 0187
L_56BC:
        MVII    #$019D, R1                      ; 56BC   02B9 019D
        ADD     G_0187, R1                      ; 56BE   02C1 0187
        PSHR    R1                              ; 56C0   0271
        MVI@    R1,     R0                      ; 56C1   0288
        ADD     G_019F, R0                      ; 56C2   02C0 019F
        CMPI    #$007D, R0                      ; 56C4   0378 007D
        BLT     L_56FD                          ; 56C6   0205 0035

        MVI@    R2,     R3                      ; 56C8   0293
        SLR     R3,     2                       ; 56C9   0067
        SLR     R3,     1                       ; 56CA   0063
        ANDI    #$00FF, R3                      ; 56CB   03BB 00FF
        CMPI    #$000A, R3                      ; 56CD   037B 000A
        BGE     L_56FD                          ; 56CF   020D 002C

        JSR     R5,     L_570D                  ; 56D1   0004 0154 030D

        CMPI    #$0009, R3                      ; 56D4   037B 0009
        BEQ     L_5707                          ; 56D6   0204 002F

        CMPI    #$0008, R3                      ; 56D8   037B 0008
        BEQ     L_5707                          ; 56DA   0204 002B

        MVII    #$0165, R4                      ; 56DC   02BC 0165

        JSR     R5,     L_5A29                  ; 56DE   0004 0158 0229

        MVII    #$0065, R0                      ; 56E1   02B8 0065

        JSR     R5,     X_RAND2                 ; 56E3   0004 0114 029E

        SDBD                                    ; 56E6   0001
        MVI@    R4,     R1                      ; 56E7   02A1
        SUBR    R0,     R1                      ; 56E8   0101
        SUBI    #$0002, R4                      ; 56E9   033C 0002
        MVO@    R1,     R4                      ; 56EB   0261
        SWAP    R1,     1                       ; 56EC   0041
        MVO@    R1,     R4                      ; 56ED   0261
        MVI@    R2,     R3                      ; 56EE   0293
        SDBD                                    ; 56EF   0001
        ANDI    #$7800, R3                      ; 56F0   03BB 0000 0078
        XORI    #$0003, R3                      ; 56F3   03FB 0003

        JSR     R5,     L_571C                  ; 56F5   0004 0154 031C
        DECLE   $0253,  $01C0,  $0004,  $015C   ; 56F8   0253 01C0 0004 015C
        DECLE   $03B6                           ; 56FC   03B6
L_56FD:
        PULR    R1                              ; 56FD   02B1
        MVO@    R0,     R1                      ; 56FE   0248
L_56FF:
        B       L_573E                          ; 56FF   0200 003D

L_5701:
        MVII    #$0001, R1                      ; 5701   02B9 0001
        MVO     R1,     G_0187                  ; 5703   0241 0187
        B       L_56BC                          ; 5705   0220 004A

L_5707:
        PULR    R1                              ; 5707   02B1

        JSR     R5,     L_5591                  ; 5708   0004 0154 0191

        B       L_573E                          ; 570B   0200 0031

L_570D:
        PSHR    R5                              ; 570D   0275
        MVII    #$016D, R4                      ; 570E   02BC 016D
        ADDR    R3,     R4                      ; 5710   00DC
        ADDR    R3,     R4                      ; 5711   00DC
        ADD     G_0187, R4                      ; 5712   02C4 0187
        MVI@    R4,     R0                      ; 5714   02A0
        TSTR    R0                              ; 5715   0080
        BEQ     L_571B                          ; 5716   0204 0003

        DECR    R0                              ; 5718   0010
        DECR    R4                              ; 5719   0014
        MVO@    R0,     R4                      ; 571A   0260
L_571B:
        PULR    R7                              ; 571B   02B7

L_571C:
        PSHR    R5                              ; 571C   0275
        SDBD                                    ; 571D   0001
        MVII    #$512F, R5                      ; 571E   02BD 002F 0051
        SDBD                                    ; 5721   0001
        MVII    #$5169, R4                      ; 5722   02BC 0069 0051
L_5725:
        MVI@    R5,     R0                      ; 5725   02A8
        ADDI    #$0200, R0                      ; 5726   02F8 0200
        MVI@    R4,     R1                      ; 5728   02A1
        CMPR    R0,     R2                      ; 5729   0142
        BEQ     L_572E                          ; 572A   0204 0002
        B       L_5725                          ; 572C   0220 0008

L_572E:
        SLL     R1,     2                       ; 572E   004D
        SLL     R1,     1                       ; 572F   0049
        XORR    R1,     R3                      ; 5730   01CB
        SDBD                                    ; 5731   0001
        XORI    #$2000, R3                      ; 5732   03FB 0000 0020
        INCR    R2                              ; 5735   000A
        MVI@    R2,     R1                      ; 5736   0291
        SDBD                                    ; 5737   0001
        XORI    #$2000, R1                      ; 5738   03F9 0000 0020
        MVO@    R1,     R2                      ; 573B   0251
        DECR    R2                              ; 573C   0012
        PULR    R7                              ; 573D   02B7

L_573E:
        JSR     R5,     L_53CE                  ; 573E   0004 0150 03CE

        CMPI    #$0003, R1                      ; 5741   0379 0003
        BNEQ    L_5759                          ; 5743   020C 0014

        MVII    #$01A0, R3                      ; 5745   02BB 01A0
        ADD     G_0187, R3                      ; 5747   02C3 0187
        MVI@    R3,     R2                      ; 5749   029A
        INCR    R2                              ; 574A   000A
        CMPI    #$000C, R2                      ; 574B   037A 000C
        BLT     L_5758                          ; 574D   0205 0009

        CLRR    R2                              ; 574F   01D2
        MVO@    R2,     R3                      ; 5750   025A

        JSR     R5,     L_54D2                  ; 5751   0004 0154 00D2
        JSR     R5,     L_5F97                  ; 5754   0004 015C 0397

        PULR    R7                              ; 5757   02B7

L_5758:
        MVO@    R2,     R3                      ; 5758   025A
L_5759:
        PULR    R7                              ; 5759   02B7

L_575A:
        PSHR    R5                              ; 575A   0275
        MVI     G_018B, R1                      ; 575B   0281 018B
        TSTR    R1                              ; 575D   0089
        BNEQ    L_58FD                          ; 575E   020C 019D

        MVII    #$016B, R4                      ; 5760   02BC 016B
        SDBD                                    ; 5762   0001
        MVI@    R4,     R0                      ; 5763   02A0
        MVII    #$0004, R1                      ; 5764   02B9 0004
        CLRR    R3                              ; 5766   01DB
        XORI    #$0004, R3                      ; 5767   03FB 0004
        MVII    #$02DD, R4                      ; 5769   02BC 02DD

        JSR     R5,     X_PRNUM_RGT             ; 576B   0004 0118 00C5

        MVII    #$016D, R4                      ; 576E   02BC 016D
        SDBD                                    ; 5770   0001
        MVI@    R4,     R0                      ; 5771   02A0
        B       L_59A5                          ; 5772   0200 0231

        PSHR    R5                              ; 5774   0275
        MVO     R1,     G_0187                  ; 5775   0241 0187
        TSTR    R1                              ; 5777   0089
        BNEQ    L_5799                          ; 5778   020C 001F

        MVI     G_032E, R2                      ; 577A   0282 032E
L_577C:
        MOVR    R0,     R1                      ; 577C   0081
        INCR    R0                              ; 577D   0008
        BEQ     L_5796                          ; 577E   0204 0016

        SDBD                                    ; 5780   0001
        CMPI    #$5CBC, R2                      ; 5781   037A 00BC 005C
        BGE     L_579D                          ; 5784   020D 0017

        MVII    #$000F, R0                      ; 5786   02B8 000F

L_5788:
        JSR     R5,     .EXEC.629               ; 5788   0004 0114 0229

        MVI     G_0187, R1                      ; 578B   0281 0187
        TSTR    R1                              ; 578D   0089
        BNEQ    L_5793                          ; 578E   020C 0003

        MVO     R0,     G_0331                  ; 5790   0240 0331
        PULR    R7                              ; 5792   02B7

L_5793:
        MVO     R0,     G_0339                  ; 5793   0240 0339
        PULR    R7                              ; 5795   02B7

L_5796:
        CLRR    R0                              ; 5796   01C0
        B       L_5788                          ; 5797   0220 0010

L_5799:
        MVI     G_0336, R2                      ; 5799   0282 0336
        B       L_577C                          ; 579B   0220 0020

L_579D:
        MVII    #$000A, R0                      ; 579D   02B8 000A
        B       L_5788                          ; 579F   0220 0018

        PSHR    R5                              ; 57A1   0275
        MVO     R1,     G_0187                  ; 57A2   0241 0187
        MVO     R0,     G_0188                  ; 57A4   0240 0188
        CMPI    #$0001, R0                      ; 57A6   0378 0001
        BGE     L_57B4                          ; 57A8   020D 000A

        MVII    #$019B, R2                      ; 57AA   02BA 019B
        ADD     G_0187, R2                      ; 57AC   02C2 0187
        MVI@    R2,     R1                      ; 57AE   0291
        TSTR    R1                              ; 57AF   0089
        BEQ     L_57D1                          ; 57B0   0204 001F
        B       L_5821                          ; 57B2   0200 006D

L_57B4:
        MVII    #$0189, R2                      ; 57B4   02BA 0189
        ADD     G_0187, R2                      ; 57B6   02C2 0187
        MVI@    R2,     R1                      ; 57B8   0291
        CMPI    #$0009, R0                      ; 57B9   0378 0009
        BLE     L_57CB                          ; 57BB   0206 000E

        CMPI    #$0014, R1                      ; 57BD   0379 0014
        BGE     L_5941                          ; 57BF   020D 0180

        MVO     R1,     G_0188                  ; 57C1   0241 0188
        MVII    #$0014, R1                      ; 57C3   02B9 0014
        MVO@    R1,     R2                      ; 57C5   0251
        CMPI    #$000B, R0                      ; 57C6   0378 000B
        BEQ     L_5877                          ; 57C8   0204 00AD
        PULR    R7                              ; 57CA   02B7

L_57CB:
        CMPI    #$0014, R1                      ; 57CB   0379 0014
        BNEQ    L_5941                          ; 57CD   020C 0172

        MVO@    R0,     R2                      ; 57CF   0250
        PULR    R7                              ; 57D0   02B7

L_57D1:
        MVI     G_0187, R2                      ; 57D1   0282 0187
        TSTR    R2                              ; 57D3   0092
        BNEQ    L_5810                          ; 57D4   020C 003A

        MVII    #$032D, R1                      ; 57D6   02B9 032D

L_57D8:
        JSR     R5,     L_5968                  ; 57D8   0004 0158 0168

        MVI@    R2,     R0                      ; 57DB   0290
        MOVR    R0,     R3                      ; 57DC   0083
        SLLC    R3,     2                       ; 57DD   005F
        BOV     L_5814                          ; 57DE   0202 0034

        MVI     G_0187, R3                      ; 57E0   0283 0187
        TSTR    R3                              ; 57E2   009B
        BEQ     L_5941                          ; 57E3   0204 015C

L_57E5:
        JSR     R5,     L_53CE                  ; 57E5   0004 0150 03CE

        CMPI    #$0008, R1                      ; 57E8   0379 0008
        BEQ     L_57F2                          ; 57EA   0204 0006

        CMPI    #$0009, R1                      ; 57EC   0379 0009
        BEQ     L_57F2                          ; 57EE   0204 0002
        B       L_5941                          ; 57F0   0200 014F

L_57F2:
        SDBD                                    ; 57F2   0001
        ANDI    #$3007, R0                      ; 57F3   03B8 0007 0030
        MVO@    R0,     R2                      ; 57F6   0250
        MVI     G_0187, R4                      ; 57F7   0284 0187
        TSTR    R4                              ; 57F9   00A4
        BNEQ    L_581B                          ; 57FA   020C 001F

        MVII    #$032E, R2                      ; 57FC   02BA 032E
        MVO     R1,     G_019B                  ; 57FE   0241 019B
L_5800:
        CMPI    #$0008, R1                      ; 5800   0379 0008
        BEQ     L_580A                          ; 5802   0204 0006

        SDBD                                    ; 5804   0001
        MVII    #$5CBC, R1                      ; 5805   02B9 00BC 005C
L_5808:
        MVO@    R1,     R2                      ; 5808   0251
        PULR    R7                              ; 5809   02B7

L_580A:
        SDBD                                    ; 580A   0001
        MVII    #$5CD3, R1                      ; 580B   02B9 00D3 005C
        B       L_5808                          ; 580E   0220 0007

L_5810:
        MVII    #$0335, R1                      ; 5810   02B9 0335
        B       L_57D8                          ; 5812   0220 003B

L_5814:
        MVI     G_0187, R3                      ; 5814   0283 0187
        TSTR    R3                              ; 5816   009B
        BNEQ    L_5941                          ; 5817   020C 0128
        B       L_57E5                          ; 5819   0220 0035

L_581B:
        MVII    #$0336, R2                      ; 581B   02BA 0336
        MVO     R1,     G_019C                  ; 581D   0241 019C
        B       L_5800                          ; 581F   0220 0020

L_5821:
        MVI     G_0187, R2                      ; 5821   0282 0187
        MOVR    R1,     R4                      ; 5823   008C
        TSTR    R2                              ; 5824   0092
        BNEQ    L_5869                          ; 5825   020C 0042

        MVII    #$032D, R1                      ; 5827   02B9 032D
L_5829:
        INCR    R1                              ; 5829   0009
        MVI@    R1,     R2                      ; 582A   028A
        SDBD                                    ; 582B   0001
        CMPI    #$5CE4, R2                      ; 582C   037A 00E4 005C
        BEQ     L_5941                          ; 582F   0204 0110

        DECR    R1                              ; 5831   0011

        JSR     R5,     L_5968                  ; 5832   0004 0158 0168

        MVI@    R2,     R0                      ; 5835   0290
        MOVR    R0,     R3                      ; 5836   0083
        SDBD                                    ; 5837   0001
        ANDI    #$07F8, R3                      ; 5838   03BB 00F8 0007
        TSTR    R3                              ; 583B   009B
        BNEQ    L_5941                          ; 583C   020C 0103

        CMPI    #$02DB, R2                      ; 583E   037A 02DB
        BGT     L_5941                          ; 5840   020E 00FF

        CMPI    #$0008, R4                      ; 5842   037C 0008
        BEQ     L_5863                          ; 5844   0204 001D

        SDBD                                    ; 5846   0001
        XORI    #$8848, R0                      ; 5847   03F8 0048 0088
L_584A:
        SDBD                                    ; 584A   0001
        ANDI    #$FFF8, R0                      ; 584B   03B8 00F8 00FF
        MVI     G_0187, R3                      ; 584E   0283 0187
        TSTR    R3                              ; 5850   009B
        BNEQ    L_586D                          ; 5851   020C 001A

        SDBD                                    ; 5853   0001
        XORI    #$4004, R0                      ; 5854   03F8 0004 0040
        MVO@    R0,     R2                      ; 5857   0250
        MVII    #$032E, R2                      ; 5858   02BA 032E
        CLRR    R1                              ; 585A   01C9
        MVO     R1,     G_019B                  ; 585B   0241 019B
L_585D:
        SDBD                                    ; 585D   0001
        MVII    #$5CB5, R1                      ; 585E   02B9 00B5 005C
        B       L_5808                          ; 5861   0220 005A

L_5863:
        SDBD                                    ; 5863   0001
        XORI    #$8840, R0                      ; 5864   03F8 0040 0088
        B       L_584A                          ; 5867   0220 001E

L_5869:
        MVII    #$0335, R1                      ; 5869   02B9 0335
        B       L_5829                          ; 586B   0220 0043

L_586D:
        XORI    #$0002, R0                      ; 586D   03F8 0002
        MVO@    R0,     R2                      ; 586F   0250
        MVII    #$0336, R2                      ; 5870   02BA 0336
        CLRR    R1                              ; 5872   01C9
        MVO     R1,     G_019C                  ; 5873   0241 019C
        B       L_585D                          ; 5875   0220 0019

L_5877:
        MVI     G_0188, R0                      ; 5877   0280 0188
        MVI     G_0187, R1                      ; 5879   0281 0187
        CMPI    #$0007, R0                      ; 587B   0378 0007
        BEQ     L_58A0                          ; 587D   0204 0021

        CMPI    #$0008, R0                      ; 587F   0378 0008
        BGE     L_5924                          ; 5881   020D 00A1

        TSTR    R1                              ; 5883   0089
        BNEQ    L_5919                          ; 5884   020C 0093

        MVII    #$032D, R1                      ; 5886   02B9 032D

L_5888:
        JSR     R5,     L_5968                  ; 5888   0004 0158 0168

        MVI     G_0188, R0                      ; 588B   0280 0188

        JSR     R5,     L_53D5                  ; 588D   0004 0150 03D5

        BEQ     L_5941                          ; 5890   0204 00AF

        MVI@    R2,     R1                      ; 5892   0291
        MOVR    R1,     R3                      ; 5893   008B
        SLLC    R3,     2                       ; 5894   005F
        BOV     L_591D                          ; 5895   0202 0086

        MVI     G_0187, R3                      ; 5897   0283 0187
        TSTR    R3                              ; 5899   009B
        BEQ     L_5941                          ; 589A   0204 00A5

L_589C:
        MOVR    R1,     R3                      ; 589C   008B
        SLLC    R3,     1                       ; 589D   005B
        BC      L_5941                          ; 589E   0201 00A1

L_58A0:
        SDBD                                    ; 58A0   0001
        MVII    #$590F, R3                      ; 58A1   02BB 000F 0059
        ADDR    R0,     R3                      ; 58A4   00C3
        MVO     R1,     G_0324                  ; 58A5   0241 0324
        MVI@    R3,     R1                      ; 58A7   0299
        MVII    #$016B, R4                      ; 58A8   02BC 016B
        ADD     G_0187, R4                      ; 58AA   02C4 0187
        ADD     G_0187, R4                      ; 58AC   02C4 0187
        SDBD                                    ; 58AE   0001
        MVI@    R4,     R0                      ; 58AF   02A0
        CMPR    R1,     R0                      ; 58B0   0148
        BLT     L_5941                          ; 58B1   0205 008E

        SUBR    R1,     R0                      ; 58B3   0108
        SUBI    #$0002, R4                      ; 58B4   033C 0002
        MVO@    R0,     R4                      ; 58B6   0260
        SWAP    R0,     1                       ; 58B7   0040
        MVO@    R0,     R4                      ; 58B8   0260
        MVI     G_0188, R0                      ; 58B9   0280 0188
        CMPI    #$0007, R0                      ; 58BB   0378 0007
        BNEQ    L_58CA                          ; 58BD   020C 000B

        JSR     R5,     L_594C                  ; 58BF   0004 0158 014C
        JSR     R5,     L_595A                  ; 58C2   0004 0158 015A

        CLRR    R1                              ; 58C5   01C9
        MVO     R1,     G_0186                  ; 58C6   0241 0186
        B       L_58FD                          ; 58C8   0200 0033

L_58CA:
        MVI     G_0324, R1                      ; 58CA   0281 0324
        SLL     R0,     2                       ; 58CC   004C
        SLL     R0,     1                       ; 58CD   0048
        MVI     G_0188, R3                      ; 58CE   0283 0188
        CMPI    #$0008, R3                      ; 58D0   037B 0008
        BGE     L_58D8                          ; 58D2   020D 0004

        SDBD                                    ; 58D4   0001
        ANDI    #$7800, R1                      ; 58D5   03B9 0000 0078
L_58D8:
        SDBD                                    ; 58D8   0001
        XORI    #$A000, R1                      ; 58D9   03F9 0000 00A0
        XORR    R0,     R1                      ; 58DC   01C1
        MVI     G_0188, R0                      ; 58DD   0280 0188
        CMPI    #$0008, R0                      ; 58DF   0378 0008
        BGE     L_58F1                          ; 58E1   020D 000E

        SDBD                                    ; 58E3   0001
        ADDI    #$5905, R0                      ; 58E4   02F8 0005 0059
        MOVR    R0,     R3                      ; 58E7   0083
        MVI@    R3,     R0                      ; 58E8   0298
        XORR    R0,     R1                      ; 58E9   01C1
        MVO@    R1,     R2                      ; 58EA   0251
        INCR    R2                              ; 58EB   000A
        MVI@    R2,     R1                      ; 58EC   0291
        SDBD                                    ; 58ED   0001
        XORI    #$2000, R1                      ; 58EE   03F9 0000 0020
L_58F1:
        MVO@    R1,     R2                      ; 58F1   0251
        MVI     G_0188, R0                      ; 58F2   0280 0188
        MVII    #$016D, R1                      ; 58F4   02B9 016D
        ADDR    R0,     R1                      ; 58F6   00C1
        ADDR    R0,     R1                      ; 58F7   00C1
        ADD     G_0187, R1                      ; 58F8   02C1 0187
        MVI@    R1,     R0                      ; 58FA   0288
        INCR    R0                              ; 58FB   0008
        MVO@    R0,     R1                      ; 58FC   0248
L_58FD:
        PULR    R7                              ; 58FD   02B7

        DECLE   $0000,  $0000,  $00BD,  $0050   ; 58FE   0000 0000 00BD 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5902   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0007   ; 5906   0000 0000 0004 0007
        DECLE   $0002,  $0006,  $0000,  $0000   ; 590A   0002 0006 0000 0000
        DECLE   $0000,  $0000                   ; 590E   0000 0000

        GSWD    R2                              ; 5910   0032
        ADCR    R0                              ; 5911   0028
        DIS                                     ; 5912   0003
        NEGR    R3                              ; 5913   0023
        SLL     R3,     1                       ; 5914   004B
        RSWD    R4                              ; 5915   003C
        COMR    R6                              ; 5916   001E
        ADCR    R0                              ; 5917   0028
        COMR    R1                              ; 5918   0019
L_5919:
        MVII    #$0335, R1                      ; 5919   02B9 0335
        B       L_5888                          ; 591B   0220 0094

L_591D:
        MVI     G_0187, R3                      ; 591D   0283 0187
        TSTR    R3                              ; 591F   009B
        BNEQ    L_5941                          ; 5920   020C 001F
        B       L_589C                          ; 5922   0220 0087

L_5924:
        TSTR    R1                              ; 5924   0089
        BEQ     L_5934                          ; 5925   0204 000D

        MVII    #$0262, R2                      ; 5927   02BA 0262
        MVI@    R2,     R1                      ; 5929   0291
        SDBD                                    ; 592A   0001
        ANDI    #$FFF8, R1                      ; 592B   03B9 00F8 00FF
        SDBD                                    ; 592E   0001
        XORI    #$2802, R1                      ; 592F   03F9 0002 0028
        B       L_589C                          ; 5932   0220 0097

L_5934:
        MVII    #$027A, R2                      ; 5934   02BA 027A
        MVI@    R2,     R1                      ; 5936   0291
        SDBD                                    ; 5937   0001
        ANDI    #$FFF8, R1                      ; 5938   03B9 00F8 00FF
        SDBD                                    ; 593B   0001
        XORI    #$6804, R1                      ; 593C   03F9 0004 0068
        B       L_589C                          ; 593F   0220 00A4

L_5941:
        JSR     R5,     X_PLAY_RAZZ2            ; 5941   0004 011C 02BD

        MVII    #$0014, R0                      ; 5944   02B8 0014
        MVII    #$0189, R2                      ; 5946   02BA 0189
        ADD     G_0187, R2                      ; 5948   02C2 0187
        MVO@    R0,     R2                      ; 594A   0250
        PULR    R7                              ; 594B   02B7

L_594C:
        PSHR    R5                              ; 594C   0275
        MVII    #$0001, R1                      ; 594D   02B9 0001
        MVO     R1,     G_0186                  ; 594F   0241 0186

        JSR     R5,     L_595A                  ; 5951   0004 0158 015A

        CLRR    R0                              ; 5954   01C0
        MVO     R0,     G_0185                  ; 5955   0240 0185
        J       L_5BE8                          ; 5957   0004 0358 03E8

L_595A:
        PSHR    R5                              ; 595A   0275
        MVI     G_0187, R1                      ; 595B   0281 0187
        TSTR    R1                              ; 595D   0089
        BNEQ    L_5964                          ; 595E   020C 0004

        MVII    #$0001, R1                      ; 5960   02B9 0001
        B       L_5965                          ; 5962   0200 0001

L_5964:
        CLRR    R1                              ; 5964   01C9
L_5965:
        MVO     R1,     G_0187                  ; 5965   0241 0187
        PULR    R7                              ; 5967   02B7

L_5968:
        PSHR    R5                              ; 5968   0275
        MOVR    R1,     R3                      ; 5969   008B
        ADDI    #$0002, R3                      ; 596A   02FB 0002
        MVI@    R3,     R1                      ; 596C   0299
        SWAP    R1,     1                       ; 596D   0041
        ANDI    #$00FF, R1                      ; 596E   03B9 00FF
        ADDI    #$0004, R1                      ; 5970   02F9 0004
        SLR     R1,     2                       ; 5972   0065
        SLR     R1,     1                       ; 5973   0061
        DECR    R1                              ; 5974   0011
        INCR    R3                              ; 5975   000B
        MVI@    R3,     R2                      ; 5976   029A
        SWAP    R2,     1                       ; 5977   0042
        ANDI    #$00FF, R2                      ; 5978   03BA 00FF
        ADDI    #$0004, R2                      ; 597A   02FA 0004
        SLR     R2,     2                       ; 597C   0066
        SLR     R2,     1                       ; 597D   0062
        DECR    R2                              ; 597E   0012
        PSHR    R2                              ; 597F   0272
        SLL     R2,     2                       ; 5980   004E
        ADD@    R6,     R2                      ; 5981   02F2
        SLL     R2,     2                       ; 5982   004E
        ADDR    R1,     R2                      ; 5983   00CA
        ADDI    #$0200, R2                      ; 5984   02FA 0200
        PULR    R7                              ; 5986   02B7

L_5987:
        PSHR    R5                              ; 5987   0275
        TSTR    R0                              ; 5988   0080
        BMI     L_59A1                          ; 5989   020B 0016

        MVO     R7,     G_018B                  ; 598B   0247 018B
        MVII    #$015D, R4                      ; 598D   02BC 015D
        ADDR    R1,     R4                      ; 598F   00CC
        ADDR    R1,     R4                      ; 5990   00CC
        SDBD                                    ; 5991   0001
        MVI@    R4,     R0                      ; 5992   02A0
L_5993:
        TSTR    R1                              ; 5993   0089
        BNEQ    L_59A5                          ; 5994   020C 000F

        MVII    #$02DD, R4                      ; 5996   02BC 02DD
        CLRR    R3                              ; 5998   01DB
        XORI    #$0004, R3                      ; 5999   03FB 0004
L_599B:
        MVII    #$0004, R1                      ; 599B   02B9 0004

        JSR     R5,     X_PRNUM_RGT             ; 599D   0004 0118 00C5

        PULR    R7                              ; 59A0   02B7

L_59A1:
        CLRR    R1                              ; 59A1   01C9
        MVO     R1,     G_018B                  ; 59A2   0241 018B
        PULR    R7                              ; 59A4   02B7

L_59A5:
        MVII    #$02EB, R4                      ; 59A5   02BC 02EB
        CLRR    R3                              ; 59A7   01DB
        XORI    #$0002, R3                      ; 59A8   03FB 0002
        B       L_599B                          ; 59AA   0220 0010

L_59AC:
        PSHR    R5                              ; 59AC   0275
        MVII    #$0161, R2                      ; 59AD   02BA 0161
        ADDR    R1,     R2                      ; 59AF   00CA
        MVI@    R2,     R0                      ; 59B0   0290
        B       L_5993                          ; 59B1   0220 001F

        PSHR    R5                              ; 59B3   0275
        TSTR    R0                              ; 59B4   0080
        BMI     L_59A1                          ; 59B5   022B 0015

        MVO     R7,     G_018B                  ; 59B7   0247 018B
        MVII    #$0165, R4                      ; 59B9   02BC 0165
        ADDR    R1,     R4                      ; 59BB   00CC
        ADDR    R1,     R4                      ; 59BC   00CC
        SDBD                                    ; 59BD   0001
        MVI@    R4,     R0                      ; 59BE   02A0
        B       L_5993                          ; 59BF   0220 002D

        PSHR    R5                              ; 59C1   0275
        TSTR    R0                              ; 59C2   0080
        BMI     L_59A1                          ; 59C3   022B 0023

        MVO     R7,     G_018B                  ; 59C5   0247 018B
        MVII    #$0161, R4                      ; 59C7   02BC 0161
        ADDR    R1,     R4                      ; 59C9   00CC
        MVI@    R4,     R0                      ; 59CA   02A0
        B       L_5993                          ; 59CB   0220 0039

L_59CD:
        PSHR    R5                              ; 59CD   0275
        CLRR    R1                              ; 59CE   01C9
        MVO     R1,     G_0187                  ; 59CF   0241 0187
L_59D1:
        MVII    #$0171, R1                      ; 59D1   02B9 0171
        ADD     G_0187, R1                      ; 59D3   02C1 0187
        MVI@    R1,     R0                      ; 59D5   0288
        MVO     R0,     G_0184                  ; 59D6   0240 0184
        MVII    #$0004, R1                      ; 59D8   02B9 0004

        JSR     R5,     X_MPY                   ; 59DA   0004 011C 01DC
        JSR     R5,     L_5A0E                  ; 59DD   0004 0158 020E

        MVII    #$017F, R1                      ; 59E0   02B9 017F
        ADD     G_0187, R1                      ; 59E2   02C1 0187
        MVI@    R1,     R2                      ; 59E4   028A

        JSR     R5,     L_5A0E                  ; 59E5   0004 0158 020E

        MVII    #$0175, R1                      ; 59E8   02B9 0175
        ADD     G_0187, R1                      ; 59EA   02C1 0187
        MVI@    R1,     R0                      ; 59EC   0288
        ADDI    #$0002, R1                      ; 59ED   02F9 0002
        MVI@    R1,     R3                      ; 59EF   028B
        ADDR    R3,     R0                      ; 59F0   00D8
        MVI     G_0184, R1                      ; 59F1   0281 0184

        JSR     R5,     X_MPY                   ; 59F3   0004 011C 01DC

        ADDR    R3,     R2                      ; 59F6   00DA
        CMPI    #$001E, R2                      ; 59F7   037A 001E
        BLE     L_59FD                          ; 59F9   0206 0002

        MVII    #$001E, R2                      ; 59FB   02BA 001E

L_59FD:
        JSR     R5,     L_5A0E                  ; 59FD   0004 0158 020E
        JSR     R5,     L_5A24                  ; 5A00   0004 0158 0224

        MVI     G_0187, R1                      ; 5A03   0281 0187
        TSTR    R1                              ; 5A05   0089
        BNEQ    L_5A2F                          ; 5A06   020C 0027

        MVII    #$0001, R1                      ; 5A08   02B9 0001
        MVO     R1,     G_0187                  ; 5A0A   0241 0187
        B       L_59D1                          ; 5A0C   0220 003C

L_5A0E:
        PSHR    R5                              ; 5A0E   0275
        MVII    #$0169, R1                      ; 5A0F   02B9 0169
        ADD     G_0187, R1                      ; 5A11   02C1 0187
        MVI@    R1,     R0                      ; 5A13   0288
        ADDR    R2,     R0                      ; 5A14   00D0
        MVO@    R0,     R1                      ; 5A15   0248
L_5A16:
        MVII    #$016B, R4                      ; 5A16   02BC 016B

        JSR     R5,     L_5A29                  ; 5A18   0004 0158 0229

        SDBD                                    ; 5A1B   0001
        MVI@    R4,     R0                      ; 5A1C   02A0
        ADDR    R2,     R0                      ; 5A1D   00D0
        SUBI    #$0002, R4                      ; 5A1E   033C 0002
        MVO@    R0,     R4                      ; 5A20   0260
        SWAP    R0,     1                       ; 5A21   0040
        MVO@    R0,     R4                      ; 5A22   0260
        PULR    R7                              ; 5A23   02B7

L_5A24:
        PSHR    R5                              ; 5A24   0275
        MVII    #$000A, R2                      ; 5A25   02BA 000A
        B       L_5A16                          ; 5A27   0220 0012

L_5A29:
        PSHR    R5                              ; 5A29   0275
        ADD     G_0187, R4                      ; 5A2A   02C4 0187
        ADD     G_0187, R4                      ; 5A2C   02C4 0187
        PULR    R7                              ; 5A2E   02B7

L_5A2F:
        CLRR    R1                              ; 5A2F   01C9
        MVO     R1,     G_0187                  ; 5A30   0241 0187
L_5A32:
        MVII    #$0165, R4                      ; 5A32   02BC 0165

        JSR     R5,     L_5A29                  ; 5A34   0004 0158 0229

        SDBD                                    ; 5A37   0001
        MVI@    R4,     R1                      ; 5A38   02A1
        MVII    #$000A, R2                      ; 5A39   02BA 000A

        JSR     R5,     X_DIVR                  ; 5A3B   0004 011C 01F8

        MVO     R0,     G_0324                  ; 5A3E   0240 0324
        MVII    #$0028, R3                      ; 5A40   02BB 0028
        MVII    #$000B, R4                      ; 5A42   02BC 000B
        MVII    #$0173, R1                      ; 5A44   02B9 0173

        JSR     R5,     L_5AAF                  ; 5A46   0004 0158 02AF

        MVII    #$0177, R1                      ; 5A49   02B9 0177

        JSR     R5,     L_5AAF                  ; 5A4B   0004 0158 02AF

        SUBR    R2,     R4                      ; 5A4E   0114
        CMPI    #$0002, R4                      ; 5A4F   037C 0002
        BGE     L_5A55                          ; 5A51   020D 0002

        MVII    #$0002, R4                      ; 5A53   02BC 0002
L_5A55:
        MVII    #$0179, R1                      ; 5A55   02B9 0179
        ADD     G_0187, R1                      ; 5A57   02C1 0187
        MVI@    R1,     R0                      ; 5A59   0288
        ADDR    R0,     R3                      ; 5A5A   00C3
        MVII    #$0171, R1                      ; 5A5B   02B9 0171
        ADD     G_0187, R1                      ; 5A5D   02C1 0187
        MVI@    R1,     R0                      ; 5A5F   0288
        ADDR    R0,     R4                      ; 5A60   00C4
        MVII    #$0175, R1                      ; 5A61   02B9 0175
        ADD     G_0187, R1                      ; 5A63   02C1 0187
        MVI@    R1,     R0                      ; 5A65   0288
        MVII    #$0003, R1                      ; 5A66   02B9 0003

        JSR     R5,     X_MPY                   ; 5A68   0004 011C 01DC

        SUBR    R2,     R3                      ; 5A6B   0113
        CMPI    #$0040, R3                      ; 5A6C   037B 0040
        BLE     L_5A72                          ; 5A6E   0206 0002

        MVII    #$0040, R3                      ; 5A70   02BB 0040
L_5A72:
        MVI     G_0324, R0                      ; 5A72   0280 0324
        MOVR    R3,     R1                      ; 5A74   0099

        JSR     R5,     X_MPY                   ; 5A75   0004 011C 01DC

        MOVR    R2,     R3                      ; 5A78   0093
        MVI     G_0324, R0                      ; 5A79   0280 0324
        MOVR    R4,     R1                      ; 5A7B   00A1

        JSR     R5,     X_MPY                   ; 5A7C   0004 011C 01DC

        MOVR    R2,     R4                      ; 5A7F   0094
        MOVR    R3,     R1                      ; 5A80   0099
        MVII    #$0064, R2                      ; 5A81   02BA 0064

        JSR     R5,     X_DIVR                  ; 5A83   0004 011C 01F8

        MOVR    R0,     R3                      ; 5A86   0083
        MOVR    R4,     R1                      ; 5A87   00A1
        MVII    #$0064, R2                      ; 5A88   02BA 0064

        JSR     R5,     X_DIVR                  ; 5A8A   0004 011C 01F8

        MVII    #$0165, R4                      ; 5A8D   02BC 0165

        JSR     R5,     L_5A29                  ; 5A8F   0004 0158 0229

        SDBD                                    ; 5A92   0001
        MVI@    R4,     R2                      ; 5A93   02A2
        ADDR    R3,     R2                      ; 5A94   00DA
        SUBR    R0,     R2                      ; 5A95   0102
        SDBD                                    ; 5A96   0001
        CMPI    #$270F, R2                      ; 5A97   037A 000F 0027
        BLE     L_5AA0                          ; 5A9A   0206 0004

        SDBD                                    ; 5A9C   0001
        MVII    #$270F, R2                      ; 5A9D   02BA 000F 0027
L_5AA0:
        SUBI    #$0002, R4                      ; 5AA0   033C 0002
        MVO@    R2,     R4                      ; 5AA2   0262
        SWAP    R2,     1                       ; 5AA3   0042
        MVO@    R2,     R4                      ; 5AA4   0262
        MVI     G_0187, R1                      ; 5AA5   0281 0187
        TSTR    R1                              ; 5AA7   0089
        BNEQ    L_5ABA                          ; 5AA8   020C 0010

        INCR    R1                              ; 5AAA   0009
        MVO     R1,     G_0187                  ; 5AAB   0241 0187
        B       L_5A32                          ; 5AAD   0220 007C

L_5AAF:
        PSHR    R5                              ; 5AAF   0275
        ADD     G_0187, R1                      ; 5AB0   02C1 0187
        MVI@    R1,     R0                      ; 5AB2   0288
        MVII    #$0003, R1                      ; 5AB3   02B9 0003

        JSR     R5,     X_MPY                   ; 5AB5   0004 011C 01DC

        ADDR    R2,     R3                      ; 5AB8   00D3
        PULR    R7                              ; 5AB9   02B7

L_5ABA:
        CLRR    R0                              ; 5ABA   01C0
        MVO     R0,     G_0187                  ; 5ABB   0240 0187
L_5ABD:
        MVII    #$0165, R4                      ; 5ABD   02BC 0165

        JSR     R5,     L_5A29                  ; 5ABF   0004 0158 0229

        SDBD                                    ; 5AC2   0001
        MVI@    R4,     R1                      ; 5AC3   02A1
        MVII    #$0064, R2                      ; 5AC4   02BA 0064

        JSR     R5,     X_DIV                   ; 5AC6   0004 011C 01FB

        MVO     R0,     G_0324                  ; 5AC9   0240 0324
        MVII    #$0179, R1                      ; 5ACB   02B9 0179
        ADD     G_0187, R1                      ; 5ACD   02C1 0187
        MVI@    R1,     R0                      ; 5ACF   0288
        MVII    #$01F4, R1                      ; 5AD0   02B9 01F4

        JSR     R5,     X_MPY                   ; 5AD2   0004 011C 01DC

        MOVR    R2,     R1                      ; 5AD5   0091
        MVI     G_0324, R2                      ; 5AD6   0282 0324

        JSR     R5,     X_DIVR                  ; 5AD8   0004 011C 01F8

        MOVR    R0,     R1                      ; 5ADB   0081
        MVII    #$0003, R2                      ; 5ADC   02BA 0003

        JSR     R5,     X_DIVR                  ; 5ADE   0004 011C 01F8

        CMPI    #$001E, R0                      ; 5AE1   0378 001E
        BLE     L_5AE7                          ; 5AE3   0206 0002

        MVII    #$001E, R0                      ; 5AE5   02B8 001E
L_5AE7:
        MVO     R0,     G_0181                  ; 5AE7   0240 0181
        MVII    #$0169, R4                      ; 5AE9   02BC 0169
        ADD     G_0187, R4                      ; 5AEB   02C4 0187
        MVI@    R4,     R0                      ; 5AED   02A0
        MVII    #$0064, R1                      ; 5AEE   02B9 0064

        JSR     R5,     X_MPY                   ; 5AF0   0004 011C 01DC

        MOVR    R2,     R1                      ; 5AF3   0091
        MVI     G_0324, R2                      ; 5AF4   0282 0324

        JSR     R5,     X_DIVR                  ; 5AF6   0004 011C 01F8

        MOVR    R0,     R1                      ; 5AF9   0081
        MVII    #$000C, R2                      ; 5AFA   02BA 000C

        JSR     R5,     X_DIVR                  ; 5AFC   0004 011C 01F8

        CMPI    #$001E, R0                      ; 5AFF   0378 001E
        BLE     L_5B05                          ; 5B01   0206 0002

        MVII    #$001E, R0                      ; 5B03   02B8 001E
L_5B05:
        MVO     R0,     G_0182                  ; 5B05   0240 0182
        MVII    #$017F, R1                      ; 5B07   02B9 017F
        ADD     G_0187, R1                      ; 5B09   02C1 0187
        MVI@    R1,     R0                      ; 5B0B   0288
        MVII    #$0173, R2                      ; 5B0C   02BA 0173
        ADD     G_0187, R2                      ; 5B0E   02C2 0187
        MVI@    R2,     R1                      ; 5B10   0291
        ADDR    R0,     R1                      ; 5B11   00C1
        MVII    #$01F4, R0                      ; 5B12   02B8 01F4

        JSR     R5,     X_MPY                   ; 5B14   0004 011C 01DC

        MOVR    R2,     R1                      ; 5B17   0091
        MVI     G_0324, R2                      ; 5B18   0282 0324

        JSR     R5,     X_DIVR                  ; 5B1A   0004 011C 01F8

        MOVR    R0,     R1                      ; 5B1D   0081
        MVII    #$0003, R2                      ; 5B1E   02BA 0003

        JSR     R5,     X_DIVR                  ; 5B20   0004 011C 01F8

        CMPI    #$001E, R0                      ; 5B23   0378 001E
        BLE     L_5B29                          ; 5B25   0206 0002

        MVII    #$001E, R0                      ; 5B27   02B8 001E
L_5B29:
        MVO     R0,     G_0183                  ; 5B29   0240 0183
        CLRR    R1                              ; 5B2B   01C9
        ADD     G_0181, R1                      ; 5B2C   02C1 0181
        ADD     G_0182, R1                      ; 5B2E   02C1 0182
        ADD     G_0183, R1                      ; 5B30   02C1 0183
        MVII    #$0175, R2                      ; 5B32   02BA 0175
        ADD     G_0187, R2                      ; 5B34   02C2 0187
        MVI@    R2,     R0                      ; 5B36   0290
        ADDR    R0,     R1                      ; 5B37   00C1
        MVII    #$0177, R2                      ; 5B38   02BA 0177
        ADD     G_0187, R2                      ; 5B3A   02C2 0187
        MVI@    R2,     R0                      ; 5B3C   0290
        ADDR    R0,     R1                      ; 5B3D   00C1
        CMPI    #$0064, R1                      ; 5B3E   0379 0064
        BLE     L_5B44                          ; 5B40   0206 0002

        MVII    #$0064, R1                      ; 5B42   02B9 0064
L_5B44:
        MVII    #$015D, R4                      ; 5B44   02BC 015D

        JSR     R5,     L_5A29                  ; 5B46   0004 0158 0229

        SDBD                                    ; 5B49   0001
        MVI@    R4,     R2                      ; 5B4A   02A2
        ADDR    R1,     R2                      ; 5B4B   00CA
        MVII    #$0161, R3                      ; 5B4C   02BB 0161
        ADD     G_0187, R3                      ; 5B4E   02C3 0187
        MVI@    R3,     R0                      ; 5B50   0298
        MVII    #$0163, R3                      ; 5B51   02BB 0163
        ADD     G_0187, R3                      ; 5B53   02C3 0187
        MVO@    R0,     R3                      ; 5B55   0258
        MVII    #$0161, R3                      ; 5B56   02BB 0161
        ADD     G_0187, R3                      ; 5B58   02C3 0187
        MVO@    R1,     R3                      ; 5B5A   0259
        SUBI    #$0002, R4                      ; 5B5B   033C 0002
        MVO@    R2,     R4                      ; 5B5D   0262
        SWAP    R2,     1                       ; 5B5E   0042
        MVO@    R2,     R4                      ; 5B5F   0262
        MVI     G_0187, R2                      ; 5B60   0282 0187
        TSTR    R2                              ; 5B62   0092
        BNEQ    L_5B6B                          ; 5B63   020C 0006

        MVII    #$0001, R1                      ; 5B65   02B9 0001
        MVO     R1,     G_0187                  ; 5B67   0241 0187
        B       L_5ABD                          ; 5B69   0220 00AD

L_5B6B:
        CLRR    R1                              ; 5B6B   01C9
        MVO     R1,     G_0169                  ; 5B6C   0241 0169
        MVO     R1,     G_016A                  ; 5B6E   0241 016A
        SDBD                                    ; 5B70   0001
        MVII    #$512F, R1                      ; 5B71   02B9 002F 0051
L_5B74:
        SDBD                                    ; 5B74   0001
        CMPI    #$514B, R1                      ; 5B75   0379 004B 0051
        BLE     L_5B7E                          ; 5B78   0206 0004

        MVII    #$0001, R3                      ; 5B7A   02BB 0001
        B       L_5B7F                          ; 5B7C   0200 0001

L_5B7E:
        CLRR    R3                              ; 5B7E   01DB
L_5B7F:
        MVO     R3,     G_0187                  ; 5B7F   0243 0187
        MVI@    R1,     R2                      ; 5B81   028A
        ADDI    #$0200, R2                      ; 5B82   02FA 0200
        MVI@    R2,     R3                      ; 5B84   0293
        SLR     R3,     2                       ; 5B85   0067
        SLR     R3,     1                       ; 5B86   0063
        ANDI    #$00FF, R3                      ; 5B87   03BB 00FF
        CMPI    #$0003, R3                      ; 5B89   037B 0003
        BNEQ    L_5BAB                          ; 5B8B   020C 001E

        MVII    #$0003, R0                      ; 5B8D   02B8 0003

        JSR     R5,     X_RAND2                 ; 5B8F   0004 0114 029E

        TSTR    R0                              ; 5B92   0080
        BNEQ    L_5BAB                          ; 5B93   020C 0016

        MVI@    R2,     R3                      ; 5B95   0293
        SDBD                                    ; 5B96   0001
        ANDI    #$7800, R3                      ; 5B97   03BB 0000 0078
        XORI    #$0003, R3                      ; 5B9A   03FB 0003
        PSHR    R1                              ; 5B9C   0271

        JSR     R5,     L_571C                  ; 5B9D   0004 0154 031C

        PSHR    R3                              ; 5BA0   0273
        MVI     G_0187, R1                      ; 5BA1   0281 0187
        MVII    #$0003, R3                      ; 5BA3   02BB 0003

        JSR     R5,     L_570D                  ; 5BA5   0004 0154 030D

        PULR    R3                              ; 5BA8   02B3
        PULR    R1                              ; 5BA9   02B1
        MVO@    R3,     R2                      ; 5BAA   0253
L_5BAB:
        INCR    R1                              ; 5BAB   0009
        SDBD                                    ; 5BAC   0001
        CMPI    #$5169, R1                      ; 5BAD   0379 0069 0051
        BNEQ    L_5B74                          ; 5BB0   022C 003D

        CLRR    R0                              ; 5BB2   01C0
        MVO     R0,     G_0187                  ; 5BB3   0240 0187
L_5BB5:
        CLRR    R0                              ; 5BB5   01C0
        MVO     R0,     G_0185                  ; 5BB6   0240 0185
        MVII    #$0163, R1                      ; 5BB8   02B9 0163
        ADD     G_0187, R1                      ; 5BBA   02C1 0187
        MVI@    R1,     R0                      ; 5BBC   0288
        MVII    #$0161, R1                      ; 5BBD   02B9 0161
        ADD     G_0187, R1                      ; 5BBF   02C1 0187
        MVI@    R1,     R2                      ; 5BC1   028A
        SUBR    R2,     R0                      ; 5BC2   0110
        CMPI    #$000A, R0                      ; 5BC3   0378 000A
        BGE     L_5BE8                          ; 5BC5   020D 0021

        SDBD                                    ; 5BC7   0001
        CMPI    #$FFF6, R0                      ; 5BC8   0378 00F6 00FF
        BLE     L_5C50                          ; 5BCB   0206 0083

        CMPI    #$001E, R2                      ; 5BCD   037A 001E
        BLT     L_5BE8                          ; 5BCF   0205 0017

        CMPI    #$0046, R2                      ; 5BD1   037A 0046
        BGE     L_5C50                          ; 5BD3   020D 007B

L_5BD5:
        MVI     G_0187, R0                      ; 5BD5   0280 0187
        TSTR    R0                              ; 5BD7   0080
        BNEQ    L_5BE0                          ; 5BD8   020C 0006

        MVII    #$0001, R0                      ; 5BDA   02B8 0001
        MVO     R0,     G_0187                  ; 5BDC   0240 0187
        B       L_5BB5                          ; 5BDE   0220 002A
L_5BE0:
        PULR    R7                              ; 5BE0   02B7

L_5BE1:
        MVI     G_0186, R0                      ; 5BE1   0280 0186
        TSTR    R0                              ; 5BE3   0080
        BNEQ    L_5BE0                          ; 5BE4   022C 0005
        B       L_5BD5                          ; 5BE6   0220 0012

L_5BE8:
        MVI     G_0185, R0                      ; 5BE8   0280 0185
        CMPI    #$00FA, R0                      ; 5BEA   0378 00FA
        BGT     L_5BE1                          ; 5BEC   022E 000C

        INCR    R0                              ; 5BEE   0008
        MVO     R0,     G_0185                  ; 5BEF   0240 0185
        MVI     G_0187, R0                      ; 5BF1   0280 0187
        TSTR    R0                              ; 5BF3   0080
        BNEQ    L_5BFC                          ; 5BF4   020C 0006

        SDBD                                    ; 5BF6   0001
        MVII    #$512F, R3                      ; 5BF7   02BB 002F 0051
        B       L_5C00                          ; 5BFA   0200 0004

L_5BFC:
        SDBD                                    ; 5BFC   0001
        MVII    #$514C, R3                      ; 5BFD   02BB 004C 0051
L_5C00:
        MVII    #$001D, R0                      ; 5C00   02B8 001D

        JSR     R5,     X_RAND2                 ; 5C02   0004 0114 029E

        ADDR    R0,     R3                      ; 5C05   00C3
        MVI@    R3,     R2                      ; 5C06   029A
        ADDI    #$0200, R2                      ; 5C07   02FA 0200

        JSR     R5,     L_53CE                  ; 5C09   0004 0150 03CE

        CMPI    #$0007, R1                      ; 5C0C   0379 0007
        BEQ     L_5BE8                          ; 5C0E   0224 0027

        CMPI    #$0001, R1                      ; 5C10   0379 0001
        BEQ     L_5BE8                          ; 5C12   0224 002B

        PSHR    R2                              ; 5C14   0272
        MVO     R1,     G_0188                  ; 5C15   0241 0188

        JSR     R5,     L_568D                  ; 5C17   0004 0154 028D

        PULR    R2                              ; 5C1A   02B2
        TSTR    R1                              ; 5C1B   0089
        BNEQ    L_5BE8                          ; 5C1C   022C 0035

        MVI     G_0188, R1                      ; 5C1E   0281 0188
        CMPI    #$000A, R1                      ; 5C20   0379 000A
        BGT     L_5C37                          ; 5C22   020E 0013

        CMPI    #$0000, R1                      ; 5C24   0379 0000
        BEQ     L_5C37                          ; 5C26   0204 000F

        MOVR    R1,     R3                      ; 5C28   008B

        JSR     R5,     L_570D                  ; 5C29   0004 0154 030D
        DECLE   $0291,  $0001,  $03F9,  $0000   ; 5C2C   0291 0001 03F9 0000
        DECLE   $0020,  $0251,  $0004,  $015C   ; 5C30   0020 0251 0004 015C
        DECLE   $03B6                           ; 5C34   03B6

        B       L_5C3F                          ; 5C35   0200 0008

L_5C37:
        INCR    R2                              ; 5C37   000A
        MVI@    R2,     R1                      ; 5C38   0291
        SDBD                                    ; 5C39   0001
        XORI    #$2000, R1                      ; 5C3A   03F9 0000 0020
        MVO@    R1,     R2                      ; 5C3D   0251
        DECR    R2                              ; 5C3E   0012
L_5C3F:
        MVI@    R2,     R1                      ; 5C3F   0291
        SDBD                                    ; 5C40   0001
        ANDI    #$7800, R1                      ; 5C41   03B9 0000 0078
        SDBD                                    ; 5C44   0001
        XORI    #$A038, R1                      ; 5C45   03F9 0038 00A0
        MVO@    R1,     R2                      ; 5C48   0251
        MVI     G_0186, R0                      ; 5C49   0280 0186
        TSTR    R0                              ; 5C4B   0080
        BNEQ    L_5BE0                          ; 5C4C   022C 006D
        B       L_5BD5                          ; 5C4E   0220 007A

L_5C50:
        MVI     G_0187, R0                      ; 5C50   0280 0187
        TSTR    R0                              ; 5C52   0080
        BNEQ    L_5C5B                          ; 5C53   020C 0006

        SDBD                                    ; 5C55   0001
        MVII    #$512F, R3                      ; 5C56   02BB 002F 0051
        B       L_5C5F                          ; 5C59   0200 0004

L_5C5B:
        SDBD                                    ; 5C5B   0001
        MVII    #$514C, R3                      ; 5C5C   02BB 004C 0051
L_5C5F:
        CLRR    R0                              ; 5C5F   01C0
L_5C60:
        MVI@    R3,     R2                      ; 5C60   029A
        ADDI    #$0200, R2                      ; 5C61   02FA 0200

        JSR     R5,     L_53CE                  ; 5C63   0004 0150 03CE

        CMPI    #$0007, R1                      ; 5C66   0379 0007
        BEQ     L_5C72                          ; 5C68   0204 0008

        INCR    R0                              ; 5C6A   0008
        CMPI    #$001D, R0                      ; 5C6B   0378 001D
        BEQ     L_5BD5                          ; 5C6D   0224 0099

        INCR    R3                              ; 5C6F   000B
        B       L_5C60                          ; 5C70   0220 0011

L_5C72:
        MVI@    R2,     R1                      ; 5C72   0291
        SDBD                                    ; 5C73   0001
        ANDI    #$7800, R1                      ; 5C74   03B9 0000 0078
        XORI    #$0003, R1                      ; 5C77   03F9 0003
        PSHR    R3                              ; 5C79   0273
        PSHR    R0                              ; 5C7A   0270
        MOVR    R1,     R3                      ; 5C7B   008B

        JSR     R5,     L_571C                  ; 5C7C   0004 0154 031C

        MOVR    R3,     R1                      ; 5C7F   0099
        PULR    R0                              ; 5C80   02B0
        PULR    R3                              ; 5C81   02B3
        MVO@    R1,     R2                      ; 5C82   0251
        B       L_5BD5                          ; 5C83   0220 00AF

        DECLE   $0047,  $0039,  $0000,  $0000   ; 5C85   0047 0039 0000 0000
        DECLE   $0000,  $001B,  $0000,  $0000   ; 5C89   0000 001B 0000 0000
        DECLE   $0004,  $0005,  $0080,  $0002   ; 5C8D   0004 0005 0080 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C91   0000 0000 0000 0000
        DECLE   $0084,  $001A,  $00B5,  $005C   ; 5C95   0084 001A 00B5 005C
        DECLE   $0000,  $002A,  $0000,  $004E   ; 5C99   0000 002A 0000 004E
        DECLE   $0000,  $0000,  $00C0,  $0000   ; 5C9D   0000 0000 00C0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CA1   0000 0000 0000 0000
        DECLE   $0082,  $001A,  $00B5,  $005C   ; 5CA5   0082 001A 00B5 005C
        DECLE   $0000,  $008E,  $0000,  $001C   ; 5CA9   0000 008E 0000 001C
        DECLE   $0000,  $0000,  $00C0,  $0000   ; 5CAD   0000 0000 00C0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CB1   0000 0000 0000 0000
        DECLE   $0300,  $0000,  $0000,  $0000   ; 5CB5   0300 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0300   ; 5CB9   0001 0000 0000 0300
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5CBD   0000 0000 0000 0001
        DECLE   $0001,  $0010,  $002E,  $0056   ; 5CC1   0001 0010 002E 0056
        DECLE   $002E,  $0156,  $02BF,  $0055   ; 5CC5   002E 0156 02BF 0055
        DECLE   $02BF,  $0155,  $0120,  $0056   ; 5CC9   02BF 0155 0120 0056
        DECLE   $0120,  $0156,  $03CB,  $0054   ; 5CCD   0120 0156 03CB 0054
        DECLE   $03CB,  $0154,  $0300,  $0000   ; 5CD1   03CB 0154 0300 0000
        DECLE   $0000,  $0000,  $0001,  $0002   ; 5CD5   0000 0000 0001 0002
        DECLE   $0009,  $00EE,  $0054,  $002E   ; 5CD9   0009 00EE 0054 002E
        DECLE   $0056,  $002E,  $0156,  $0140   ; 5CDD   0056 002E 0156 0140
        DECLE   $0056,  $0140,  $0156,  $0300   ; 5CE1   0056 0140 0156 0300
        DECLE   $0000,  $00E8,  $0055,  $0008   ; 5CE5   0000 00E8 0055 0008
        DECLE   $0003,  $0000                   ; 5CE9   0003 0000

        SUB     .STIC.X.0,R0                    ; 5CEB   0300 0000
        MOVR    R5,     R6                      ; 5CED   00AE
L_5CEE:
        DECR    R7                              ; 5CEE   0017

        DECLE   $0008,  $0003,  $0000           ; 5CEF   0008 0003 0000

        MVI@    R5,     R6                      ; 5CF2   02AE
L_5CF3:
        DECR    R7                              ; 5CF3   0017

        DECLE   $0000,  $0000,  $0004,  $000B   ; 5CF4   0000 0000 0004 000B
        DECLE   $0001                           ; 5CF8   0001

        MOVR    R3,     R7                      ; 5CF9   009F

        RLC     R0,     2                       ; 5CFA   0054
        MVI@    R5,     R6                      ; 5CFB   02AE
L_5CFC:
        DECR    R7                              ; 5CFC   0017

        DECLE   $0000,  $0000,  $0001,  $000F   ; 5CFD   0000 0000 0001 000F
        DECLE   $0005                           ; 5D01   0005

        ADDR    R5,     R6                      ; 5D02   00EE
        RLC     R0,     2                       ; 5D03   0054
        ADCR    R6                              ; 5D04   002E
        RLC     R2,     2                       ; 5D05   0056
        ADCR    R6                              ; 5D06   002E
        CMPR    R2,     R6                      ; 5D07   0156
        MVI@    R5,     R6                      ; 5D08   02AE
L_5D09:
        DECR    R7                              ; 5D09   0017

        DECLE   $0000,  $0000,  $0005,  $0010   ; 5D0A   0000 0000 0005 0010
        DECLE   $0001                           ; 5D0E   0001

        MOVR    R2,     R1                      ; 5D0F   0091
        RLC     R2,     2                       ; 5D10   0056
        MVI@    R5,     R6                      ; 5D11   02AE
L_5D12:
        DECR    R7                              ; 5D12   0017

        DECLE   $0000,  $0000,  $0006,  $001A   ; 5D13   0000 0000 0006 001A
        DECLE   $0001,  $0091,  $0056,  $00FF   ; 5D17   0001 0091 0056 00FF
        DECLE   $0081,  $0081,  $0081,  $0081   ; 5D1B   0081 0081 0081 0081
        DECLE   $0081,  $0081,  $00FF,  $0000   ; 5D1F   0081 0081 00FF 0000
        DECLE   $0004,  $0084,  $005C,  $00FF   ; 5D23   0004 0084 005C 00FF
        DECLE   $007E,  $0000,  $0000,  $0000   ; 5D27   007E 0000 0000 0000
        DECLE   $0000,  $0008,  $001C,  $007F   ; 5D2B   0000 0008 001C 007F
        DECLE   $003E,  $0000,  $0000,  $0004   ; 5D2F   003E 0000 0000 0004
        DECLE   $00A1,  $0004,  $005C,  $00FF   ; 5D33   00A1 0004 005C 00FF
        DECLE   $007E,  $0000,  $0000,  $00A0   ; 5D37   007E 0000 0000 00A0
        DECLE   $0002,  $0055,  $0000,  $00FF   ; 5D3B   0002 0055 0000 00FF
        DECLE   $007E,  $0000,  $0000           ; 5D3F   007E 0000 0000

        MOVR    R4,     R1                      ; 5D42   00A1
        INCR    R0                              ; 5D43   0008
        SWAP    R0,     2                       ; 5D44   0044
        DECR    R0                              ; 5D45   0010
        ADDR    R0,     R7                      ; 5D46   00C7

        DECLE   $007E,  $0000,  $0000,  $0084   ; 5D47   007E 0000 0000 0084
        DECLE   $0022,  $0000,  $0006,  $000C   ; 5D4B   0022 0000 0006 000C
        DECLE   $007C,  $0000,  $0000,  $0081   ; 5D4F   007C 0000 0000 0081
        DECLE   $0000,  $0004,  $000C,  $0038   ; 5D53   0000 0004 000C 0038
        DECLE   $0070,  $0000,  $0000,  $0000   ; 5D57   0070 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $000C   ; 5D5B   0000 0000 0004 000C
        DECLE   $0038,  $0000,  $0000,  $0000   ; 5D5F   0038 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; 5D63   0000 0000 0000 0008
        DECLE   $0018,  $0000,  $0000,  $0000   ; 5D67   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D6B   0000 0000 0000 0000
        DECLE   $0010,  $0000,  $0000,  $0010   ; 5D6F   0010 0000 0000 0010
        DECLE   $004A,  $0024,  $00C9,  $0022   ; 5D73   004A 0024 00C9 0022
        DECLE   $0028,  $0044,  $0018,  $0008   ; 5D77   0028 0044 0018 0008
        DECLE   $0026,  $0050,  $006A,  $0081   ; 5D7B   0026 0050 006A 0081
        DECLE   $002C,  $0010,  $0024,  $0010   ; 5D7F   002C 0010 0024 0010
        DECLE   $0014,  $0043,  $0028,  $0095   ; 5D83   0014 0043 0028 0095
        DECLE   $00AA,  $0052,  $0008,  $0028   ; 5D87   00AA 0052 0008 0028
        DECLE   $0012,  $006A,  $0085,  $0029   ; 5D8B   0012 006A 0085 0029
        DECLE   $0092,  $0024,  $0010,  $0030   ; 5D8F   0092 0024 0010 0030
        DECLE   $0010,  $0056,  $0055,  $0056   ; 5D93   0010 0056 0055 0056
        DECLE   $0054,  $00FF,  $007E,  $0008   ; 5D97   0054 00FF 007E 0008
        DECLE   $007E,  $00FF,  $00FF,  $007E   ; 5D9B   007E 00FF 00FF 007E
        DECLE   $0010,  $0004,  $0040,  $0002   ; 5D9F   0010 0004 0040 0002
        DECLE   $0090,  $0001,  $0044,  $0000   ; 5DA3   0090 0001 0044 0000
        DECLE   $000A,  $0020,  $0004,  $0008   ; 5DA7   000A 0020 0004 0008
        DECLE   $007E,  $00FF,  $00FF,  $007E   ; 5DAB   007E 00FF 00FF 007E
        DECLE   $0010,  $0024,  $0000,  $0004   ; 5DAF   0010 0024 0000 0004
        DECLE   $0040,  $0002,  $0090,  $0001   ; 5DB3   0040 0002 0090 0001
        DECLE   $0044,  $0000,  $000A,  $0008   ; 5DB7   0044 0000 000A 0008
        DECLE   $007E,  $00FF,  $00FF,  $007E   ; 5DBB   007E 00FF 00FF 007E
        DECLE   $0010,  $000A,  $0000,  $0024   ; 5DBF   0010 000A 0000 0024
        DECLE   $0000,  $0004,  $0040,  $0002   ; 5DC3   0000 0004 0040 0002
        DECLE   $0090,  $0001,  $0044,  $0008   ; 5DC7   0090 0001 0044 0008
        DECLE   $007E,  $00FF,  $00FF,  $007E   ; 5DCB   007E 00FF 00FF 007E
        DECLE   $0010,  $0045,  $0000,  $000A   ; 5DCF   0010 0045 0000 000A
        DECLE   $0000,  $0024,  $0000,  $0004   ; 5DD3   0000 0024 0000 0004
        DECLE   $0040,  $0002,  $0090,  $0008   ; 5DD7   0040 0002 0090 0008
        DECLE   $007E,  $00FF,  $00FF,  $007E   ; 5DDB   007E 00FF 00FF 007E
        DECLE   $0010,  $0082,  $0011,  $0044   ; 5DDF   0010 0082 0011 0044
        DECLE   $0000,  $000A,  $0000,  $0024   ; 5DE3   0000 000A 0000 0024
        DECLE   $0000,  $0004,  $0040,  $0010   ; 5DE7   0000 0004 0040 0010
        DECLE   $0008,  $0010,  $0018,  $0018   ; 5DEB   0008 0010 0018 0018
        DECLE   $0008,  $0010,  $0008,  $0000   ; 5DEF   0008 0010 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DF3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; 5DF7   0000 0000 0000 0008
        DECLE   $0004,  $0008,  $0018,  $0018   ; 5DFB   0004 0008 0018 0018
        DECLE   $0010,  $0020,  $0010,  $0000   ; 5DFF   0010 0020 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E03   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 5E07   0000 0000 0000

        EIS                                     ; 5E0A   0002
        EIS                                     ; 5E0B   0002

        JSR     R4,     .EXEC.818               ; 5E0C   0004 0018 0018
        DECLE   $0020,  $0040,  $0040,  $0000   ; 5E0F   0020 0040 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E13   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E17   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $005D,  $00BA   ; 5E1B   0000 0000 005D 00BA
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E1F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E23   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E27   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $00B8,  $001B   ; 5E2B   0000 0040 00B8 001B
        DECLE   $0002,  $0000,  $0000,  $0000   ; 5E2F   0002 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E33   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; 5E37   0000 0000 0000 0040
        DECLE   $0040,  $0020,  $0018,  $0018   ; 5E3B   0040 0020 0018 0018
        DECLE   $0004,  $0002,  $0002,  $0000   ; 5E3F   0004 0002 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E43   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 5E47   0000 0000 0000
.GFX_LIST_5E4A:
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5E4A  CART PIC #00
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5E4E  
        DECLE   $0000,  $00AA,  $00FE,  $007C   ; 5E52  CART PIC #01
        DECLE   $007C,  $007C,  $007C,  $007C   ; 5E56  
        DECLE   $0000,  $00A5,  $00A5,  $00A5   ; 5E5A  CART PIC #02
        DECLE   $00FF,  $00BD,  $00FF,  $00E7   ; 5E5E  
        DECLE   $0000,  $00AA,  $0044,  $00FF   ; 5E62  CART PIC #03
        DECLE   $0000,  $00AA,  $0044,  $00FF   ; 5E66  
        DECLE   $0000,  $00FF,  $0018,  $003C   ; 5E6A  CART PIC #04
        DECLE   $003C,  $007E,  $007E,  $00FF   ; 5E6E  
        DECLE   $0018,  $0018,  $0018,  $00FF   ; 5E72  CART PIC #05
        DECLE   $00FF,  $0018,  $0018,  $0018   ; 5E76  
        DECLE   $0018,  $003C,  $0066,  $00FF   ; 5E7A  CART PIC #06
        DECLE   $00FF,  $009F,  $009B,  $00FB   ; 5E7E  
        DECLE   $000C,  $000C,  $0011,  $007E   ; 5E82  CART PIC #07
        DECLE   $0064,  $00E8,  $0020,  $0020   ; 5E86  
        DECLE   $0000,  $0000,  $0008,  $001C   ; 5E8A  CART PIC #08
        DECLE   $007F,  $003E,  $0000,  $0000   ; 5E8E  
        DECLE   $0000,  $0004,  $0084,  $005C   ; 5E92  CART PIC #09
        DECLE   $00FF,  $007E,  $0000,  $0000   ; 5E96  
        DECLE   $0000,  $0004,  $00A5,  $005C   ; 5E9A  CART PIC #0A
        DECLE   $00EF,  $007E,  $0000,  $0000   ; 5E9E  
        DECLE   $0004,  $00A1,  $0004,  $005C   ; 5EA2  CART PIC #0B
        DECLE   $00FF,  $007E,  $0000,  $0000   ; 5EA6  
        DECLE   $00A0,  $0002,  $0055,  $0000   ; 5EAA  CART PIC #0C
        DECLE   $00FF,  $007E,  $0000,  $0000   ; 5EAE  
        DECLE   $00A1,  $0008,  $0044,  $0010   ; 5EB2  CART PIC #0D
        DECLE   $00C7,  $007E,  $0000,  $0000   ; 5EB6  
        DECLE   $0084,  $0022,  $0000,  $0006   ; 5EBA  CART PIC #0E
        DECLE   $000C,  $007C,  $0000,  $0000   ; 5EBE  
        DECLE   $0081,  $0000,  $0004,  $000C   ; 5EC2  CART PIC #0F
        DECLE   $0038,  $0070,  $0000,  $0000   ; 5EC6  
        DECLE   $0000,  $0000,  $0000,  $0004   ; 5ECA  CART PIC #10
        DECLE   $000C,  $0038,  $0000,  $0000   ; 5ECE  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ED2  CART PIC #11
        DECLE   $0008,  $0018,  $0000,  $0000   ; 5ED6  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EDA  CART PIC #12
        DECLE   $0000,  $0010,  $0000,  $0000   ; 5EDE  
        DECLE   $0000,  $0000,  $0038,  $007C   ; 5EE2  CART PIC #13
        DECLE   $001F,  $003D,  $007D,  $00FC   ; 5EE6  
        DECLE   $0007,  $000F,  $003F,  $001F   ; 5EEA  CART PIC #14
        DECLE   $003F,  $001F,  $003F,  $007F   ; 5EEE  
        DECLE   $00B0,  $00F8,  $00F2,  $00FE   ; 5EF2  CART PIC #15
        DECLE   $00FC,  $00F8,  $00FC,  $00FE   ; 5EF6  
        DECLE   $0078,  $003C,  $003C,  $001C   ; 5EFA  CART PIC #16
        DECLE   $0008,  $0008,  $000C,  $0000   ; 5EFE  
        DECLE   $00FF,  $007F,  $003F,  $003F   ; 5F02  CART PIC #17
        DECLE   $001F,  $003F,  $00FF,  $007F   ; 5F06  
        DECLE   $00FF,  $00FF,  $00FD,  $00FC   ; 5F0A  CART PIC #18
        DECLE   $00FE,  $00FF,  $00FF,  $00FE   ; 5F0E  
        DECLE   $000F,  $001F,  $001F,  $007F   ; 5F12  CART PIC #19
        DECLE   $00FF,  $003F,  $007F,  $00F6   ; 5F16  
        DECLE   $0080,  $00E0,  $00F0,  $00FC   ; 5F1A  CART PIC #1A
        DECLE   $00FF,  $00DE,  $008C,  $0000   ; 5F1E  
        DECLE   $004D,  $00DF,  $00FF,  $00FF   ; 5F22  CART PIC #1B
        DECLE   $00FF,  $00FF,  $00C7,  $001F   ; 5F26  
        DECLE   $0079,  $00FF,  $00FF,  $00FF   ; 5F2A  CART PIC #1C
        DECLE   $00FF,  $00FF,  $00FF,  $007F   ; 5F2E  
        DECLE   $00FF,  $00BF,  $00BF,  $003F   ; 5F32  CART PIC #1D
        DECLE   $007F,  $00FF,  $00FD,  $004C   ; 5F36  
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5F3A  CART PIC #1E
        DECLE   $00FF,  $00CF,  $00C7,  $0083   ; 5F3E  
        DECLE   $00FF,  $00FE,  $00F8,  $00FC   ; 5F42  CART PIC #1F
        DECLE   $00FC,  $00FC,  $00B8,  $0000   ; 5F46  
        DECLE   $0084,  $00CF,  $00FF,  $00FF   ; 5F4A  CART PIC #20
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5F4E  
UC_5F52:
        MVI     .PSG0.noise,R1                  ; 5F52  SLIB UCALL target
        PSHR    R1                              ; 5F54   0271
        SAR     R1,     1                       ; 5F55   0069
        MVO     R1,     G_01A6                  ; 5F56   0241 01A6
        ADD@    R6,     R1                      ; 5F58   02F1
        MVO     R1,     G_01A5                  ; 5F59   0241 01A5
        CLRR    R1                              ; 5F5B   01C9
        MVO     R1,     G_01A7                  ; 5F5C   0241 01A7
UC_5F5E:
        MVI     G_01A7, R1                      ; 5F5E  SLIB UCALL target
        TSTR    R1                              ; 5F60   0089
        BEQ     L_5F74                          ; 5F61   0204 0011

        MVI     .PSG0.noise,R1                  ; 5F63   0281 01F9
        SUB     G_015C, R1                      ; 5F65   0301 015C
        MVO     R1,     .PSG0.noise             ; 5F67   0241 01F9
        CMP     G_01A5, R1                      ; 5F69   0341 01A5
        BGE     L_5F70                          ; 5F6B   020D 0003

        MVO     R1,     G_01A7                  ; 5F6D   0241 01A7
        PULR    R7                              ; 5F6F   02B7

L_5F70:
        CLRR    R1                              ; 5F70   01C9
        MVO     R1,     G_01A7                  ; 5F71   0241 01A7
        PULR    R7                              ; 5F73   02B7

L_5F74:
        MVI     .PSG0.chn_a_lo,R1               ; 5F74   0281 01F0
        SUBI    #$000A, R1                      ; 5F76   0339 000A
        MVO     R1,     .PSG0.chn_a_lo          ; 5F78   0241 01F0
        MVI     .PSG0.chn_b_lo,R1               ; 5F7A   0281 01F1
        SUBI    #$0007, R1                      ; 5F7C   0339 0007
        MVO     R1,     .PSG0.chn_b_lo          ; 5F7E   0241 01F1
        MVI     .PSG0.chn_c_lo,R1               ; 5F80   0281 01F2
        SUBI    #$000F, R1                      ; 5F82   0339 000F
        MVO     R1,     .PSG0.chn_c_lo          ; 5F84   0241 01F2
        MVI     .PSG0.noise,R1                  ; 5F86   0281 01F9
        MVI     G_015B, R0                      ; 5F88   0280 015B
        ADDR    R0,     R1                      ; 5F8A   00C1
        MVO     R1,     .PSG0.noise             ; 5F8B   0241 01F9
        CMP     G_01A6, R1                      ; 5F8D   0341 01A6
        BLE     L_5F92                          ; 5F8F   0206 0001
        PULR    R7                              ; 5F91   02B7

L_5F92:
        MVII    #$0001, R1                      ; 5F92   02B9 0001
        MVO     R1,     G_01A7                  ; 5F94   0241 01A7
        PULR    R7                              ; 5F96   02B7

L_5F97:
        PSHR    R5                              ; 5F97   0275

        JSR     R5,     X_PLAY_SFX2             ; 5F98   0004 0118 03BE
        DECLE   $0081                           ; 5F9B  SFX prio
        DECLE   $0040,  $0010                   ; 5F9C  SFX data
        DECLE   $0048,  $001B                   ; 5F9E  SFX data
        DECLE   $0044,  $0016                   ; 5FA0  SFX data
        DECLE   $02CD                           ; 5FA2  SFX data
        DECLE   $038B                           ; 5FA3  SFX data
        DECLE   $00FD                           ; 5FA4  SFX data
        DECLE   $013D                           ; 5FA5  SFX data
        DECLE   $0003,  $0075                   ; 5FA6  SFX data
        DECLE   $0275                           ; 5FA8  SFX data
        DECLE   $0004,  $0118                   ; 5FA9  SFX data
        DECLE   $03BE                           ; 5FAB  SFX data
        DECLE   $0082                           ; 5FAC  SFX data
        DECLE   $0040,  $0080                   ; 5FAD  SFX data
        DECLE   $0048,  $0077                   ; 5FAF  SFX data
        DECLE   $0044,  $0054                   ; 5FB1  SFX data
        DECLE   $013D                           ; 5FB3  SFX data
        DECLE   $0003,  $002D                   ; 5FB4  SFX data
        DECLE   $0275                           ; 5FB6  SFX data
        DECLE   $0004,  $0118                   ; 5FB7  SFX data
        DECLE   $03BE                           ; 5FB9  SFX data
        DECLE   $0082                           ; 5FBA  SFX data
        DECLE   $0040,  $0280                   ; 5FBB  SFX data
        DECLE   $0048,  $0177                   ; 5FBD  SFX data
        DECLE   $0044,  $0154                   ; 5FBF  SFX data
        DECLE   $03ED                           ; 5FC1  SFX data
        DECLE   $000B                           ; 5FC2  SFX data
        DECLE   $03FD                           ; 5FC3  SFX data
        DECLE   $02BD                           ; 5FC4  SFX data
        DECLE   $0009                           ; 5FC5  SFX data
        DECLE   $03B7                           ; 5FC6  SFX data
        DECLE   $00EC,  $00F6                   ; 5FC7  SFX data
        DECLE   $0077,  $0052,  $005F           ; 5FC9  SFX data
        DECLE   $004F,  $00FE                   ; 5FCC  SFX data
        DECLE   $0077,  $005E,  $005F           ; 5FCE  SFX data
        DECLE   $0023,  $03EC                   ; 5FD1  SFX data
        DECLE   $02CF                           ; 5FD3  SFX end

L_5FD4:
        PSHR    R5                              ; 5FD4   0275

        JSR     R5,     X_PLAY_SFX2             ; 5FD5   0004 0118 03BE
        DECLE   $007F                           ; 5FD8  SFX prio
        DECLE   $000B                           ; 5FD9  SFX data
        DECLE   $00BD                           ; 5FDA  SFX data
        DECLE   $00FD                           ; 5FDB  SFX data
        DECLE   $0389                           ; 5FDC  SFX data
        DECLE   $03B7                           ; 5FDD  SFX data
        DECLE   $03ED                           ; 5FDE  SFX data
        DECLE   $0040,  $00DD                   ; 5FDF  SFX data
        DECLE   $0048,  $00CC                   ; 5FE1  SFX data
        DECLE   $0044,  $000B                   ; 5FE3  SFX data
        DECLE   $03DB                           ; 5FE5  SFX data
        DECLE   $005C,  $024F                   ; 5FE6  SFX data
        DECLE   $0077,  $0052,  $005F           ; 5FE8  SFX data
        DECLE   $004F,  $002E                   ; 5FEB  SFX data
        DECLE   $0003,  $037C                   ; 5FED  SFX data
        DECLE   $0275                           ; 5FEF  SFX data
        DECLE   $0004,  $0118                   ; 5FF0  SFX data
        DECLE   $0395                           ; 5FF2  SFX data
        DECLE   $03F4,  $0183                   ; 5FF3  SFX data
        DECLE   $03F4,  $000D                   ; 5FF5  SFX data
        DECLE   $03F4,  $00C3                   ; 5FF7  SFX data
        DECLE   $03F4,  $000D                   ; 5FF9  SFX data
        DECLE   $03F2                           ; 5FFB  SFX data
        DECLE   $0114,  $000C                   ; 5FFC  SFX data
        DECLE   $0000,  $02B7                   ; 5FFE  SFX data
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5043       $504F   $50C1  
;;  $504C       <entry>
;;  $504F       $507F  
;;  $507C       $5076  
;;  $5081       $507A  
;;  $5083       $50B0  
;;  $50AD       $50B4  
;;  $50B2       $50AB  
;;  $50C1       $50BB  
;;  $50D7       $50F1  
;;  $50E6       $50DE  
;;  $50EA       $50E4  
;;  $511D       $50EA  
;;  $516D       $516D  
;;  $5179       $5179  
;;  $518A       $518A  
;;  $519B       $519B  
;;  $51A3       <entry>
;;  $51AA       $51A7  
;;  $51B4       $51E3  
;;  $51BF       $51C4  
;;  $51C2       $51BB  
;;  $51C6       $51B0  
;;  $51C8       $51D1  
;;  $51D5       $51CB  
;;  $51E9       $51C0  
;;  $51F8       $51B2   $51D3   $51F1  
;;  $51FA       $5209  
;;  $5205       $5200  
;;  $520D       $5202   $52F0  
;;  $522A       $521D  
;;  $522D       $5221  
;;  $5230       $5225  
;;  $5231       $5228   $522B   $522E  
;;  $5236       $520B  
;;  $5240       $523C  
;;  $5242       $524B  
;;  $524F       $5245  
;;  $526A       $5265   $52E2  
;;  $5280       $5289  
;;  $5284       $5279  
;;  $528B       $5282  
;;  $529F       $52B3  
;;  $52AB       $5292  
;;  $52B5       $523E   $524D   $5268  
;;  $52BF       $52BB  
;;  $52C1       $52CA  
;;  $52CE       $52C4  
;;  $52E5       $52BD   $52CC  
;;  $52E7       $52F8  
;;  $52F4       $52ED  
;;  $52FC       $530F  
;;  $530B       $5304  
;;  $5313       $531C  
;;  $5320       $5307   $5314  
;;  $5346       $533B   $5342  
;;  $5348       $53C2  
;;  $5354       $534F  
;;  $5358       $534A  
;;  $5360       $535B  
;;  $5362       $5352   $5356   $535E  
;;  $5377       $536D  
;;  $5386       $537C   $5380  
;;  $538A       $5375  
;;  $5395       $538E  
;;  $5398       $5393  
;;  $53A5       $539C  
;;  $53AA       $53A0   $53A3   $53A7  
;;  $53B4       $53AF  
;;  $53B5       $5348   $5364   $5368   $5373   $5384   $5388   $53B2  
;;  $53C4       $53B8  
;;  $53CE       $536F   $5377   $54A3   $54FD   $573E   $57E5   $5C09   $5C63  
;;  $53D5       $536A   $588D  
;;  $53DD       $531E  
;;  $53E5       $53E2  
;;  $53FD       $547C  
;;  $540E       $510A   $5405  
;;  $5429       $53FB  
;;  $5432       $5473  
;;  $5448       $543A  
;;  $5452       $5446  
;;  $5456       $545F  
;;  $5475       $5464  
;;  $547E       $53FF  
;;  $54B2       $54AC  
;;  $54B3       $54B0  
;;  $54B5       $54D0  
;;  $54C9       $54BD  
;;  $54CA       $54A8   $54C7  
;;  $54D2       $54C1   $5751  
;;  $54E8       $540B   $5426  
;;  $54F7       $54F2   $5595  
;;  $54F8       $54F4  
;;  $550F       $5545   $554A  
;;  $551B       $5553  
;;  $552A       $5597  
;;  $553A       $5523  
;;  $553B       $5502   $5515   $5543   $5548   $554E  
;;  $553C       $550D  
;;  $5547       $5540  
;;  $554C       $5511  
;;  $5555       $54EB  
;;  $5562       $555C  
;;  $5564       $5560  
;;  $5569       $5564  
;;  $5588       $5576  
;;  $5591       $5708  
;;  $559A       $55D6   $5628   $563E  
;;  $55B1       $55A7  
;;  $55B5       $55AF  
;;  $55D5       $55E0   $55E5  
;;  $55D8       $55CC   $5625   $563B  
;;  $55D9       $55D3  
;;  $55E3       $55DC  
;;  $5601       $55FA  
;;  $5608       $561E  
;;  $560C       $55F4  
;;  $5617       $5610  
;;  $564A       $5507   $55CF   $5621  
;;  $564F       $568F  
;;  $5650       $5675  
;;  $5654       $566E  
;;  $565B       $5656  
;;  $565F       $5659  
;;  $5670       $566C  
;;  $5677       $5671  
;;  $567A       $5666  
;;  $5680       $5687  
;;  $5686       $567C  
;;  $568D       $5C17  
;;  $569D       $56A9   $56AC  
;;  $56A1       $5699  
;;  $56AB       $56A5  
;;  $56AF       $569F  
;;  $56BC       $5705  
;;  $56FD       $56C6   $56CF  
;;  $56FF       $56B4  
;;  $5701       $56B7  
;;  $5707       $56D6   $56DA  
;;  $570D       $5527   $56D1   $5BA5   $5C29  
;;  $571B       $5716  
;;  $571C       $56F5   $5B9D   $5C7C  
;;  $5725       $572C  
;;  $572E       $572A  
;;  $573E       $56FF   $570B  
;;  $5758       $574D  
;;  $5759       $5743  
;;  $575A       $5113   $5408  
;;  $577C       $579B  
;;  $5788       $5797   $579F  
;;  $5793       $578E  
;;  $5796       $577E  
;;  $5799       $5778  
;;  $579D       $5784  
;;  $57B4       $57A8  
;;  $57CB       $57BB  
;;  $57D1       $57B0  
;;  $57D8       $5812  
;;  $57E5       $5819  
;;  $57F2       $57EA   $57EE  
;;  $5800       $581F  
;;  $5808       $580E   $5861  
;;  $580A       $5802  
;;  $5810       $57D4  
;;  $5814       $57DE  
;;  $581B       $57FA  
;;  $5821       $57B2  
;;  $5829       $586B  
;;  $584A       $5867  
;;  $585D       $5875  
;;  $5863       $5844  
;;  $5869       $5825  
;;  $586D       $5851  
;;  $5877       $57C8  
;;  $5888       $591B  
;;  $589C       $5922   $5932   $593F  
;;  $58A0       $587D  
;;  $58CA       $58BD  
;;  $58D8       $58D2  
;;  $58F1       $58E1  
;;  $58FD       $575E   $58C8  
;;  $5919       $5884  
;;  $591D       $5895  
;;  $5924       $5881  
;;  $5934       $5925  
;;  $5941       $57BF   $57CD   $57E3   $57F0   $5817   $582F   $583C   $5840  
;;  $5941       $5890   $589A   $589E   $58B1   $5920  
;;  $594C       $58BF  
;;  $595A       $58C2   $5951  
;;  $5964       $595E  
;;  $5965       $5962  
;;  $5968       $532F   $54A0   $54FA   $564C   $56AF   $57D8   $5832   $5888  
;;  $5987       $546B   $5470  
;;  $5993       $59B1   $59BF   $59CB  
;;  $599B       $59AA  
;;  $59A1       $5989   $59B5   $59C3  
;;  $59A5       $5772   $5994  
;;  $59AC       $542A   $542F  
;;  $59CD       $53F3  
;;  $59D1       $5A0C  
;;  $59FD       $59F9  
;;  $5A0E       $59DD   $59E5   $59FD  
;;  $5A16       $5A27  
;;  $5A24       $5A00  
;;  $5A29       $54D5   $56DE   $5A18   $5A34   $5A8F   $5ABF   $5B46  
;;  $5A2F       $5A06  
;;  $5A32       $5AAD  
;;  $5A55       $5A51  
;;  $5A72       $5A6E  
;;  $5AA0       $5A9A  
;;  $5AAF       $5A46   $5A4B  
;;  $5ABA       $5AA8  
;;  $5ABD       $5B69  
;;  $5AE7       $5AE3  
;;  $5B05       $5B01  
;;  $5B29       $5B25  
;;  $5B44       $5B40  
;;  $5B6B       $5B63  
;;  $5B74       $5BB0  
;;  $5B7E       $5B78  
;;  $5B7F       $5B7C  
;;  $5BAB       $5B8B   $5B93  
;;  $5BB5       $5BDE  
;;  $5BD5       $5BE6   $5C4E   $5C6D   $5C83  
;;  $5BE0       $5BD8   $5BE4   $5C4C  
;;  $5BE1       $5BEC  
;;  $5BE8       $5957   $5BC5   $5BCF   $5C0E   $5C12   $5C1C  
;;  $5BFC       $5BF4  
;;  $5C00       $5BFA  
;;  $5C37       $5C22   $5C26  
;;  $5C3F       $5C35  
;;  $5C50       $5BCB   $5BD3  
;;  $5C5B       $5C53  
;;  $5C5F       $5C59  
;;  $5C60       $5C70  
;;  $5C72       $5C68  
;;  $5CEE       $5CEE  
;;  $5CF3       $5CF3  
;;  $5CFC       $5CFC  
;;  $5D09       $5D09  
;;  $5D12       $5D12  
;;  $5F52       <entry>
;;  $5F5E       <entry>
;;  $5F70       $5F6B  
;;  $5F74       $5F61  
;;  $5F92       $5F8F  
;;  $5F97       $5754  
;;  $5FD4       $54C4  
;; ======================================================================== ;;
