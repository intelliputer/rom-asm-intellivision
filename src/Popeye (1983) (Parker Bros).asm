
        ORG     $5000
.HEADER:
        BIDECLE $565D           ; 5000  Ptr: MOB graphic images
        BIDECLE $5023           ; 5002  Ptr: EXEC timer table
        BIDECLE $507C           ; 5004  Ptr: Start of game
        BIDECLE $54B8           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $501C           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5029           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0001,  $000B   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $000B   ; 5011  Color Stack init (2, 3)
        DECLE   $0001           ; 5013  Border color init

        DECLE   $01A0,  $01B0,  $01C0,  $01D0   ; 5014   01A0 01B0 01C0 01D0
        DECLE   $01E0,  $01E8,  $01F0,  $01F8   ; 5018   01E0 01E8 01F0 01F8
.GRAM_INIT_501C:
        DECLE   $0030           ; 501C  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 501D  #00-07:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 501F  #08-0F:  CART #08-0F ----
        DECLE   $0021,  $0380   ; 5021  #10-17:  CART #10-17 ----
.TIMER:
        STRING  "&"             ; 5023  #18   :  CART #13    ----
        DECLE   $0065,  $0001   ; 5024  #19   :  Algo #2
        DECLE   $0000           ; 5026  #1A   :  CART #00    ----
        DECLE   $0000           ; 5027  #1B   :  CART #00    ----
        DECLE   $0000           ; 5028  #1C   :  CART #00    ----
.TITLE:
        DECLE   $0052           ; 5029  #1D   :  CART #29    ----
        DECLE   $0000           ; 502A  #1E   :  CART #00    ----
.TITLECODE:
        PSHR    R5              ; 502B  #1F   :  4x4 tile
        DECLE   $0150           ; 502D  #20   :  CART #28    -Y--
        DECLE   $0170           ; 502E  #21   :  CART #38    -Y--
        DECLE   $0004           ; 502F  #22   :  CART #02    ----
        DECLE   $0168           ; 5030  #23   :  CART #34    -Y--
        DECLE   $0296           ; 5031  #24   :  CART #0B    X-I-
        DECLE   $02BC           ; 5032  #25   :  CART #1E    X-I-
        DECLE   $0216           ; 5033  #26   :  CART #0B    X---
        DECLE   $02BB,  $0007   ; 5034  #27   :  Algo #2
        DECLE   $0004           ; 5036  #28   :  CART #02    ----
        DECLE   $0118           ; 5037  #29   :  CART #0C    -Y--
        DECLE   $007B,  $0050   ; 5038  #2A-2A:  GROM #3D-3D ----
        DECLE   $0041,  $0052   ; 503A  #2B   :  Algo #1
        DECLE   $004B,  $0045   ; 503C  #2C   :  Algo #2
        DECLE   $0052           ; 503E  #2D   :  CART #29    ----
        DECLE   $0020           ; 503F  #2E   :  CART #10    ----
        DECLE   $0042           ; 5040  #2F   :  CART #21    ----

        DECLE   $0052,  $004F,  $0054,  $0048   ; 5041   0052 004F 0054 0048
        DECLE   $0045,  $0052,  $0053,  $0000   ; 5045   0045 0052 0053 0000

        MVII    #$022E, R4                      ; 5049   02BC 022E

        JSR     R5,     X_PRINT_R5              ; 504B   0004 0118 007B
        STRING  "PRESENTS"                      ; 504E  
        DECLE   $0000                           ; 5056   0000

        MVII    #$027F, R4                      ; 5057   02BC 027F

        JSR     R5,     X_PRINT_R5              ; 5059   0004 0118 007B
        STRING  "POPEYE"                        ; 505C  
        DECLE   $0000                           ; 5062   0000

        MVII    #$02CD, R4                      ; 5063   02BC 02CD

L_5065:
        JSR     R5,     X_PRINT_R5              ; 5065   0004 0118 007B
        STRING  "COPR 1983"                     ; 5068  
        DECLE   $0000                           ; 5071   0000

        SDBD                                    ; 5072   0001
        MVII    #$6CD5, R0                      ; 5073   02B8 00D5 006C
        MVO     R0,     .ISRVEC.0               ; 5076   0240 0100
        SWAP    R0,     1                       ; 5078   0040
        MVO     R0,     .ISRVEC.1               ; 5079   0240 0101
        PULR    R7                              ; 507B   02B7

.START:
        PSHR    R5                              ; 507C   0275
L_507D:
        MVII    #$0004, R0                      ; 507D   02B8 0004
        MVO     R0,     G_0103                  ; 507F   0240 0103
        MVO     R0,     G_015F                  ; 5081   0240 015F

        JSR     R5,     L_5170                  ; 5083   0004 0150 0170

        MVII    #$022B, R4                      ; 5086   02BC 022B
        MVII    #$0006, R3                      ; 5088   02BB 0006

        JSR     R5,     X_PRINT_R5              ; 508A   0004 0118 007B
        STRING  "Players?"                      ; 508D  
        DECLE   $0000                           ; 5095   0000

        MVII    #$0160, R4                      ; 5096   02BC 0160
        MVII    #$0090, R0                      ; 5098   02B8 0090

        JSR     R5,     X_FILL_ZERO             ; 509A   0004 0114 0338
L_509D:
        JSR     R5,     L_50AA                  ; 509D   0004 0150 00AA
        DECLE   $0000,  $0000,  $00AD,  $0050   ; 50A0   0000 0000 00AD 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50A4   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 50A8   0000 0000
L_50AA:
        MVO     R5,     G_035D                  ; 50AA   0245 035D
        PULR    R7                              ; 50AC   02B7

        PSHR    R5                              ; 50AD   0275
        MVI     G_015F, R1                      ; 50AE   0281 015F
        TSTR    R1                              ; 50B0   0089
        BEQ     L_507D                          ; 50B1   0224 0035

        MVI     G_0162, R1                      ; 50B3   0281 0162
        TSTR    R1                              ; 50B5   0089
        BNEQ    L_50F3                          ; 50B6   020C 003B

        MVI     G_0161, R1                      ; 50B8   0281 0161
        TSTR    R1                              ; 50BA   0089
        BEQ     L_50D2                          ; 50BB   0204 0015

        CMPI    #$0004, R0                      ; 50BD   0378 0004
        BGT     L_5178                          ; 50BF   020E 00B7

        TSTR    R0                              ; 50C1   0080
        BEQ     L_5178                          ; 50C2   0204 00B4

        DECR    R1                              ; 50C4   0011
        MVO     R1,     G_0161                  ; 50C5   0241 0161
        MVO     R0,     G_0162                  ; 50C7   0240 0162
        MVII    #$0007, R3                      ; 50C9   02BB 0007
        MVII    #$0001, R1                      ; 50CB   02B9 0001
        MVII    #$0288, R4                      ; 50CD   02BC 0288
        J       .EXEC.8C6                       ; 50CF   0004 0318 00C6

L_50D2:
        CMPI    #$0001, R0                      ; 50D2   0378 0001
        BEQ     L_50DA                          ; 50D4   0204 0004

        CMPI    #$0002, R0                      ; 50D6   0378 0002
        BNEQ    L_5178                          ; 50D8   020C 009E

L_50DA:
        MVO     R0,     G_0161                  ; 50DA   0240 0161
        MVII    #$0007, R3                      ; 50DC   02BB 0007
        MVII    #$0238, R4                      ; 50DE   02BC 0238
        MVII    #$0001, R1                      ; 50E0   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 50E2   0004 0118 00C5

        DECR    R3                              ; 50E5   0013
        MVII    #$027B, R4                      ; 50E6   02BC 027B

        JSR     R5,     X_PRINT_R5              ; 50E8   0004 0118 007B
        STRING  "Level?"                        ; 50EB  
        DECLE   $0000                           ; 50F1   0000

        PULR    R7                              ; 50F2   02B7

L_50F3:
        DECR    R1                              ; 50F3   0011
        MVO     R1,     G_0162                  ; 50F4   0241 0162
        MVII    #$0005, R0                      ; 50F6   02B8 0005
        BEQ     L_5102                          ; 50F8   0204 0008

        DECR    R1                              ; 50FA   0011
        BEQ     L_5102                          ; 50FB   0204 0005

        DECR    R0                              ; 50FD   0010
        DECR    R1                              ; 50FE   0011
        BEQ     L_5102                          ; 50FF   0204 0001

        DECR    R0                              ; 5101   0010
L_5102:
        MVI     G_0161, R1                      ; 5102   0281 0161
        TSTR    R1                              ; 5104   0089
        BEQ     L_5109                          ; 5105   0204 0002

        MVO     R0,     G_016F                  ; 5107   0240 016F
L_5109:
        DECR    R0                              ; 5109   0010
        MVO     R0,     G_016E                  ; 510A   0240 016E
        MVII    #$0001, R0                      ; 510C   02B8 0001
        MVO     R0,     G_017A                  ; 510E   0240 017A
L_5110:
        MVII    #$017B, R4                      ; 5110   02BC 017B
        MVII    #$0070, R0                      ; 5112   02B8 0070
        MVO     R4,     G_035D                  ; 5114   0244 035D

        JSR     R5,     X_FILL_ZERO             ; 5116   0004 0114 0338
        JSR     R5,     L_5170                  ; 5119   0004 0150 0170

        CLRR    R0                              ; 511C   01C0

        JSR     R5,     L_5FAC                  ; 511D   0004 015C 03AC

        MVI     G_0165, R1                      ; 5120   0281 0165
        ADDI    #$0166, R1                      ; 5122   02F9 0166
        MVI@    R1,     R1                      ; 5124   0289
        SARC    R1,     1                       ; 5125   0079
        ADD     G_0162, R1                      ; 5126   02C1 0162
        CMPI    #$0003, R1                      ; 5128   0379 0003
        BLE     L_512E                          ; 512A   0206 0002

        MVII    #$0003, R1                      ; 512C   02B9 0003
L_512E:
        MVO     R1,     G_017E                  ; 512E   0241 017E
L_5130:
        MVI     G_017A, R0                      ; 5130   0280 017A
        SARC    R0,     1                       ; 5132   0078
        BC      L_5130                          ; 5133   0221 0004

        SDBD                                    ; 5135   0001
        MVII    #$580D, R1                      ; 5136   02B9 000D 0058
        MVII    #$031D, R2                      ; 5139   02BA 031D
        MVII    #$0002, R0                      ; 513B   02B8 0002

        JSR     R5,     X_INIT_MOBS             ; 513D   0004 0114 02B4

        SDBD                                    ; 5140   0001
        MVII    #$5830, R1                      ; 5141   02B9 0030 0058
        MVII    #$032D, R2                      ; 5144   02BA 032D
        MVII    #$0002, R0                      ; 5146   02B8 0002

        JSR     R5,     X_INIT_MOBS             ; 5148   0004 0114 02B4

        MVII    #$000A, R0                      ; 514B   02B8 000A
        MVO     R0,     G_011A                  ; 514D   0240 011A
        MVII    #$0177, R1                      ; 514F   02B9 0177
        ADD     G_0165, R1                      ; 5151   02C1 0165
        MVI@    R1,     R1                      ; 5153   0289
        TSTR    R1                              ; 5154   0089
        BNEQ    L_5159                          ; 5155   020C 0002

        MVO     R0,     G_019B                  ; 5157   0240 019B
L_5159:
        MVII    #$00FF, R0                      ; 5159   02B8 00FF
        MVO     R0,     G_0193                  ; 515B   0240 0193
        MVII    #$0020, R0                      ; 515D   02B8 0020

        JSR     R5,     X_RAND2                 ; 515F   0004 0114 029E

        ANDI    #$0018, R0                      ; 5162   03B8 0018
        MVO     R0,     G_018E                  ; 5164   0240 018E
        ADD     G_017A, R7                      ; 5166   02C7 017A

        DECLE   $0000,  $0000                   ; 5168   0000 0000

        B       L_5195                          ; 516A   0200 0029
        B       L_5291                          ; 516C   0200 0123
        B       L_53B5                          ; 516E   0200 0245

L_5170:
        PSHR    R5                              ; 5170   0275
        MVII    #$0200, R4                      ; 5171   02BC 0200
        MVII    #$00F0, R0                      ; 5173   02B8 00F0
        J       .EXEC.739                       ; 5175   0004 0314 0339
L_5178:
        J       .EXEC.EBE                       ; 5178   0004 031C 02BE

L_517B:
        MVI@    R5,     R4                      ; 517B   02AC
L_517C:
        MOVR    R4,     R1                      ; 517C   00A1
        SLL     R1,     2                       ; 517D   004D
        SLL     R1,     1                       ; 517E   0049
        ADDR    R2,     R1                      ; 517F   00D1
        MVI@    R5,     R4                      ; 5180   02AC
L_5181:
        MVO@    R1,     R4                      ; 5181   0261
        MVI@    R5,     R4                      ; 5182   02AC
        TSTR    R4                              ; 5183   00A4
        BEQ     L_5194                          ; 5184   0204 000E

        CMPI    #$02FF, R4                      ; 5186   037C 02FF
        BLT     L_518E                          ; 5188   0205 0004

        ADDI    #$0008, R1                      ; 518A   02F9 0008
        SUBI    #$0100, R4                      ; 518C   033C 0100
L_518E:
        CMPI    #$01FF, R4                      ; 518E   037C 01FF
        BGT     L_5181                          ; 5190   022E 0010
        B       L_517C                          ; 5192   0220 0017
L_5194:
        MOVR    R5,     R7                      ; 5194   00AF

L_5195:
        SDBD                                    ; 5195   0001
        MVII    #$1208, R2                      ; 5196   02BA 0008 0012
        MVO     R2,     .BTAB.2B                ; 5199   0242 022B
        ADDI    #$0038, R2                      ; 519B   02FA 0038
        MVO     R2,     .BTAB.38                ; 519D   0242 0238
        ADDI    #$0008, R2                      ; 519F   02FA 0008
        MVO     R2,     .BTAB.2A                ; 51A1   0242 022A
        MVO     R2,     .BTAB.2C                ; 51A3   0242 022C
        INCR    R2                              ; 51A5   000A
        MVO     R2,     .BTAB.29                ; 51A6   0242 0229
        MVO     R2,     .BTAB.37                ; 51A8   0242 0237
        MVO     R2,     .BTAB.39                ; 51AA   0242 0239
        ADDI    #$0012, R2                      ; 51AC   02FA 0012
        MVO     R2,     .BTAB.15                ; 51AE   0242 0215
        MVO     R2,     .BTAB.16                ; 51B0   0242 0216
        MVO     R2,     .BTAB.17                ; 51B2   0242 0217
        MVO     R2,     .BTAB.18                ; 51B4   0242 0218
        MVO     R2,     .BTAB.23                ; 51B6   0242 0223
        MVO     R2,     .BTAB.24                ; 51B8   0242 0224
        MVO     R2,     .BTAB.25                ; 51BA   0242 0225
        SDBD                                    ; 51BC   0001
        MVII    #$065D, R1                      ; 51BD   02B9 005D 0006
        MVII    #$0009, R0                      ; 51C0   02B8 0009
        MVII    #$022E, R4                      ; 51C2   02BC 022E

        JSR     R5,     X_FILL_MEM              ; 51C4   0004 0114 0341

        SUBI    #$0017, R1                      ; 51C7   0339 0017
        MVO     R1,     .BTAB.65                ; 51C9   0241 0265
        MVO     R1,     .BTAB.66                ; 51CB   0241 0266
        MVO     R1,     .BTAB.67                ; 51CD   0241 0267
        MVO     R1,     .BTAB.68                ; 51CF   0241 0268
        MVO     R1,     .BTAB.72                ; 51D1   0241 0272
        MVO     R1,     .BTAB.73                ; 51D3   0241 0273
        MVO     R1,     .BTAB.74                ; 51D5   0241 0274
        MVO     R1,     .BTAB.75                ; 51D7   0241 0275
        MVII    #$028D, R4                      ; 51D9   02BC 028D
        MVII    #$0011, R0                      ; 51DB   02B8 0011

        JSR     R5,     X_FILL_MEM              ; 51DD   0004 0114 0341

        MVII    #$02B5, R4                      ; 51E0   02BC 02B5
        MVII    #$0011, R0                      ; 51E2   02B8 0011

        JSR     R5,     X_FILL_MEM              ; 51E4   0004 0114 0341

        MVII    #$02DC, R4                      ; 51E7   02BC 02DC
        ADDI    #$0253, R1                      ; 51E9   02F9 0253
        MVII    #$0014, R0                      ; 51EB   02B8 0014

        JSR     R5,     X_FILL_MEM              ; 51ED   0004 0114 0341

        MOVR    R1,     R2                      ; 51F0   008A
        SUBI    #$0074, R2                      ; 51F1   033A 0074
        MVO     R2,     .BTAB.28                ; 51F3   0242 0228
        MVO     R2,     .BTAB.3A                ; 51F5   0242 023A
        MVO     R2,     .BTAB.2D                ; 51F7   0242 022D
        MVO     R2,     .BTAB.36                ; 51F9   0242 0236
        ADDI    #$0090, R2                      ; 51FB   02FA 0090
        MVI     G_019B, R1                      ; 51FD   0281 019B
        TSTR    R1                              ; 51FF   0089
        BEQ     L_5204                          ; 5200   0204 0002

        MVO     R2,     .BTAB.A0                ; 5202   0242 02A0
L_5204:
        ADDI    #$00C0, R2                      ; 5204   02FA 00C0
        MVO     R2,     .BTAB.1E                ; 5206   0242 021E
        ADDI    #$0008, R2                      ; 5208   02FA 0008
        MVO     R2,     .BTAB.32                ; 520A   0242 0232
        SUBI    #$0177, R2                      ; 520C   033A 0177

        JSR     R5,     L_517B                  ; 520E   0004 0150 017B
        DECLE   $0005,  $0251,  $0361,  $0014   ; 5211   0005 0251 0361 0014
        DECLE   $0295,  $0000                   ; 5215   0295 0000

        SUBI    #$0003, R2                      ; 5217   033A 0003

        JSR     R5,     L_517B                  ; 5219   0004 0150 017B
        DECLE   $0000,  $0214,  $0319,  $0322   ; 521C   0000 0214 0319 0322
        DECLE   $0326,  $000B,  $02D0,  $03CF   ; 5220   0326 000B 02D0 03CF
        DECLE   $03D3,  $03D2,  $0000           ; 5224   03D3 03D2 0000

        MVII    #$0010, R3                      ; 5227   02BB 0010
        SWAP    R3,     1                       ; 5229   0043
        ADDR    R3,     R2                      ; 522A   00DA

        JSR     R5,     L_517B                  ; 522B   0004 0150 017B
        DECLE   $0007,  $023D,  $023F           ; 522E   0007 023D 023F

        MVO     R0,     .BTAB.4C                ; 5231   0240 024C
        SUBI    #$024B, R6                      ; 5233   033E 024B
        MVO@    R5,     R1                      ; 5235   024D
        INCR    R2                              ; 5236   000A
        MVI@    R1,     R1                      ; 5237   0289
        PULR    R1                              ; 5238   02B1
        ADD@    R3,     R1                      ; 5239   02D9
        INCR    R7                              ; 523A   000F

        DECLE   $023C                           ; 523B   023C
L_523C:
        CMP@    R1,     R6                      ; 523C   034E
        DECLE   $0350,  $0362,  $0000           ; 523D   0350 0362 0000

        ADDI    #$00F6, R3                      ; 5240   02FB 00F6
        MVO     R3,     .BTAB.BE                ; 5242   0243 02BE
        ADDI    #$00BA, R2                      ; 5244   02FA 00BA
        MVO     R2,     .BTAB.49                ; 5246   0242 0249
        SUBI    #$0287, R2                      ; 5248   033A 0287
        MVO     R2,     .BTAB.BC                ; 524A   0242 02BC
        SDBD                                    ; 524C   0001
        MVII    #$3803, R2                      ; 524D   02BA 0003 0038

        JSR     R5,     L_517B                  ; 5250   0004 0150 017B
        DECLE   $0009,  $0279,  $02A1,  $02C9   ; 5253   0009 0279 02A1 02C9
        DECLE   $0000                           ; 5257   0000

        MVII    #$02FB, R2                      ; 5258   02BA 02FB
        MVO     R2,     .BTAB.BD                ; 525A   0242 02BD
        MVO     R2,     .BTAB.D1                ; 525C   0242 02D1
        SDBD                                    ; 525E   0001
        MVII    #$28AF, R2                      ; 525F   02BA 00AF 0028
        MVO     R2,     .BTAB.45                ; 5262   0242 0245
        SUBI    #$0269, R2                      ; 5264   033A 0269
        MVO     R2,     .BTAB.65                ; 5266   0242 0265
        MVO     R2,     .BTAB.8D                ; 5268   0242 028D
        MVO     R2,     .BTAB.B5                ; 526A   0242 02B5
        SUBI    #$0020, R2                      ; 526C   033A 0020
        MVO     R2,     .BTAB.76                ; 526E   0242 0276
        MVO     R2,     .BTAB.9E                ; 5270   0242 029E
        MVO     R2,     .BTAB.C6                ; 5272   0242 02C6
        ADDI    #$0008, R2                      ; 5274   02FA 0008
        MVO     R2,     .BTAB.64                ; 5276   0242 0264
        MVII    #$0020, R3                      ; 5278   02BB 0020
        SWAP    R3,     1                       ; 527A   0043
        SUBR    R3,     R2                      ; 527B   011A
        MVO     R3,     .BTAB.46                ; 527C   0243 0246
        MVO     R2,     .BTAB.8C                ; 527E   0242 028C
        MVO     R2,     .BTAB.B4                ; 5280   0242 02B4
        MVO     R3,     .BTAB.8A                ; 5282   0243 028A
        MVO     R3,     .BTAB.B2                ; 5284   0243 02B2
        MVO     R3,     .BTAB.DA                ; 5286   0243 02DA
        MVII    #$0001, R1                      ; 5288   02B9 0001
        MVO     R1,     G_01D3                  ; 528A   0241 01D3
        MVO     R1,     G_01D0                  ; 528C   0241 01D0
        J       L_5491                          ; 528E   0004 0354 0091

L_5291:
        MVII    #$022B, R4                      ; 5291   02BC 022B
        SDBD                                    ; 5293   0001
        MVII    #$0A1B, R1                      ; 5294   02B9 001B 000A
        MVII    #$000A, R0                      ; 5297   02B8 000A

        JSR     R5,     X_FILL_MEM              ; 5299   0004 0114 0341

        MVII    #$030A, R2                      ; 529C   02BA 030A
        SWAP    R2,     1                       ; 529E   0042

        JSR     R5,     L_517B                  ; 529F   0004 0150 017B
        DECLE   $0006,  $026D,  $02BD           ; 52A2   0006 026D 02BD

        SUBI    #$0242, R7                      ; 52A5   033F 0242

        DECLE   $0246,  $026E,  $0341,  $0244   ; 52A7   0246 026E 0341 0244
        DECLE   $0248,  $0270,  $0294,  $0340   ; 52AB   0248 0270 0294 0340
        DECLE   $0243,  $0247,  $026F,  $000C   ; 52AF   0243 0247 026F 000C
        DECLE   $0253,  $025A,  $027B           ; 52B3   0253 025A 027B

        MVI     .BTAB.A3,R2                     ; 52B6   0282 02A3
        MVI@    R5,     R2                      ; 52B8   02AA
        ADD@    R1,     R3                      ; 52B9   02CB
        ADD@    R2,     R2                      ; 52BA   02D2
        CMP@    R3,     R0                      ; 52BB   0358
        MVI     .BTAB.84,R0                     ; 52BC   0280 0284
        MVI@    R5,     R0                      ; 52BE   02A8
        ADD@    R2,     R0                      ; 52BF   02D0
        CMP@    R4,     R7                      ; 52C0   0367
        MVI@    R1,     R7                      ; 52C1   028F

        MVI@    R2,     R2                      ; 52C2   0292
        MVI@    R2,     R6                      ; 52C3   0296
        PULR    R7                              ; 52C4   02B7

        MVII    #$0368, R6                      ; 52C5   02BE 0368
        MVO@    R3,     R5                      ; 52C7   026B
        MVI@    R2,     R0                      ; 52C8   0290
        MVI@    R2,     R3                      ; 52C9   0293
        MVI@    R2,     R7                      ; 52CA   0297

        DECLE   $02B8,  $02BB,  $02BF,  $036C   ; 52CB   02B8 02BB 02BF 036C
        DECLE   $0291,  $0298,  $02BC,  $0355   ; 52CF   0291 0298 02BC 0355
        DECLE   $02A5,  $02AC,  $0369,  $02B9   ; 52D3   02A5 02AC 0369 02B9
        DECLE   $02C0,  $037D,  $02CD,  $02D4   ; 52D7   02C0 037D 02CD 02D4
        DECLE   $0356,  $02A6,  $036A,  $02BA   ; 52DB   0356 02A6 036A 02BA
        DECLE   $037E,  $02CE,  $035C,  $0000   ; 52DF   037E 02CE 035C 0000

        SDBD                                    ; 52E3   0001
        MVII    #$1803, R2                      ; 52E4   02BA 0003 0018

        JSR     R5,     L_517B                  ; 52E7   0004 0150 017B
        DECLE   $0006,  $0261,  $0262           ; 52EA   0006 0261 0262

        MVO@    R3,     R4                      ; 52ED   0263
        MVI@    R3,     R6                      ; 52EE   029E
        MVI@    R3,     R7                      ; 52EF   029F

        DECLE   $02C6,  $02C7,  $0000           ; 52F0   02C6 02C7 0000

        ADDI    #$0013, R2                      ; 52F3   02FA 0013
        MVO     R2,     .BTAB.8A                ; 52F5   0242 028A
        ADDI    #$0047, R2                      ; 52F7   02FA 0047
        MOVR    R2,     R3                      ; 52F9   0093
        MVII    #$0010, R2                      ; 52FA   02BA 0010
        SWAP    R2,     1                       ; 52FC   0042
        MVI     G_019B, R1                      ; 52FD   0281 019B
        TSTR    R1                              ; 52FF   0089
        BNEQ    L_5303                          ; 5300   020C 0001

        MOVR    R2,     R3                      ; 5302   0093
L_5303:
        MVO     R3,     .BTAB.B2                ; 5303   0243 02B2
        MVO     R2,     .BTAB.4F                ; 5305   0242 024F
        MVO     R2,     .BTAB.77                ; 5307   0242 0277
        MVO     R2,     .BTAB.89                ; 5309   0242 0289
        MVO     R2,     .BTAB.8B                ; 530B   0242 028B
        MVO     R2,     .BTAB.B3                ; 530D   0242 02B3
        MVO     R2,     .BTAB.DA                ; 530F   0242 02DA
        MVO     R2,     .BTAB.DB                ; 5311   0242 02DB
        SDBD                                    ; 5313   0001
        MVII    #$181A, R2                      ; 5314   02BA 001A 0018
        MVO     R2,     .BTAB.39                ; 5317   0242 0239
        MVO     R2,     .BTAB.3A                ; 5319   0242 023A
        MVO     R2,     .BTAB.3B                ; 531B   0242 023B
        ADDI    #$0006, R2                      ; 531D   02FA 0006
        MVO     R2,     .BTAB.4D                ; 531F   0242 024D
        MVO     R2,     .BTAB.75                ; 5321   0242 0275
        ADDI    #$0008, R2                      ; 5323   02FA 0008
        MVO     R2,     .BTAB.4E                ; 5325   0242 024E
        MVO     R2,     .BTAB.76                ; 5327   0242 0276
        SUBI    #$0228, R2                      ; 5329   033A 0228
        MVO     R2,     .BTAB.B1                ; 532B   0242 02B1
        MVO     R2,     .BTAB.D9                ; 532D   0242 02D9
        MVII    #$001E, R2                      ; 532F   02BA 001E
        SWAP    R2,     1                       ; 5331   0042
        MVO     R2,     .BTAB.B0                ; 5332   0242 02B0
        MVO     R2,     .BTAB.D8                ; 5334   0242 02D8
        ADDI    #$0053, R2                      ; 5336   02FA 0053
        MVO     R2,     .BTAB.9D                ; 5338   0242 029D
        MVO     R2,     .BTAB.C5                ; 533A   0242 02C5
        MVII    #$0200, R2                      ; 533C   02BA 0200
        MVO     R2,     .BTAB.45                ; 533E   0242 0245
        MVO     R2,     .BTAB.59                ; 5340   0242 0259
        MVO     R2,     .BTAB.81                ; 5342   0242 0281
        MVO     R2,     .BTAB.95                ; 5344   0242 0295
        MVO     R2,     .BTAB.A9                ; 5346   0242 02A9
        MVO     R2,     .BTAB.D1                ; 5348   0242 02D1
        SDBD                                    ; 534A   0001
        MVII    #$3A33, R1                      ; 534B   02B9 0033 003A
        MVII    #$02DC, R4                      ; 534E   02BC 02DC
        MVII    #$0014, R0                      ; 5350   02B8 0014

        JSR     R5,     X_FILL_MEM              ; 5352   0004 0114 0341

        SDBD                                    ; 5355   0001
        MVII    #$3EF0, R1                      ; 5356   02B9 00F0 003E
        MVII    #$0215, R4                      ; 5359   02BC 0215
        MVII    #$0010, R0                      ; 535B   02B8 0010

        JSR     R5,     X_FILL_MEM              ; 535D   0004 0114 0341

        SDBD                                    ; 5360   0001
        MVII    #$0822, R2                      ; 5361   02BA 0022 0008
        MVO     R2,     .BTAB.38                ; 5364   0242 0238
        SUBI    #$001F, R2                      ; 5366   033A 001F

        JSR     R5,     L_517B                  ; 5368   0004 0150 017B
        DECLE   $0004,  $022A,  $0335,  $035D   ; 536B   0004 022A 0335 035D
        DECLE   $025E,  $025F,  $0260,  $0264   ; 536F   025E 025F 0260 0264
        DECLE   $0266,  $028C,  $028D,  $028E   ; 5373   0266 028C 028D 028E
        DECLE   $0299,  $029A,  $029B,  $029C   ; 5377   0299 029A 029B 029C
        DECLE   $02C2,  $02C3,  $02C4,  $0018   ; 537B   02C2 02C3 02C4 0018
        DECLE   $025B,  $0354,  $0257,  $027C   ; 537F   025B 0354 0257 027C
        DECLE   $027F                           ; 5383   027F

        MVI     .BTAB.A4,R3                     ; 5384   0283 02A4
        MVI@    R4,     R7                      ; 5386   02A7

        MVI@    R5,     R3                      ; 5387   02AB
        ADD@    R1,     R4                      ; 5388   02CC
        ADD@    R1,     R7                      ; 5389   02CF

        DECLE   $02D3,  $03AD,  $03C1,  $03D5   ; 538A   02D3 03AD 03C1 03D5
        DECLE   $0000                           ; 538E   0000

        ADDI    #$000B, R2                      ; 538F   02FA 000B
        MVO     R2,     .BTAB.78                ; 5391   0242 0278
        ADDI    #$00DC, R2                      ; 5393   02FA 00DC
        MVO     R2,     .BTAB.26                ; 5395   0242 0226
        ADDI    #$0012, R2                      ; 5397   02FA 0012
        MVO     R2,     .BTAB.C8                ; 5399   0242 02C8
        ADDI    #$0008, R2                      ; 539B   02FA 0008
        MVO     R2,     .BTAB.C9                ; 539D   0242 02C9
        ADDI    #$0008, R2                      ; 539F   02FA 0008
        MVO     R2,     .BTAB.CA                ; 53A1   0242 02CA
        ADDI    #$0069, R2                      ; 53A3   02FA 0069
        MVO     R2,     .BTAB.36                ; 53A5   0242 0236
        ADDI    #$0008, R2                      ; 53A7   02FA 0008
        MVO     R2,     .BTAB.4A                ; 53A9   0242 024A
        MVII    #$0011, R1                      ; 53AB   02B9 0011
        MVO     R1,     G_01D3                  ; 53AD   0241 01D3
        MVII    #$0001, R1                      ; 53AF   02B9 0001
        MVO     R1,     G_01D0                  ; 53B1   0241 01D0
        B       L_5491                          ; 53B3   0200 00DC

L_53B5:
        SDBD                                    ; 53B5   0001
        MVII    #$0666, R1                      ; 53B6   02B9 0066 0006
        MVII    #$0009, R0                      ; 53B9   02B8 0009
        MVII    #$02CD, R4                      ; 53BB   02BC 02CD

        JSR     R5,     X_FILL_MEM              ; 53BD   0004 0114 0341

        SUBI    #$0008, R1                      ; 53C0   0339 0008
        MVO     R1,     .BTAB.A0                ; 53C2   0241 02A0
        MVO     R1,     .BTAB.A3                ; 53C4   0241 02A3
        MVO     R1,     .BTAB.A4                ; 53C6   0241 02A4
        SUBI    #$001C, R1                      ; 53C8   0339 001C
        MVII    #$0241, R4                      ; 53CA   02BC 0241
        MVII    #$0008, R0                      ; 53CC   02B8 0008

        JSR     R5,     X_FILL_MEM              ; 53CE   0004 0114 0341

        ADDI    #$0004, R1                      ; 53D1   02F9 0004
        MVO     R1,     .BTAB.69                ; 53D3   0241 0269
        MVO     R1,     .BTAB.6A                ; 53D5   0241 026A
        MVO     R1,     .BTAB.6B                ; 53D7   0241 026B
        MVO     R1,     .BTAB.70                ; 53D9   0241 0270
        MVO     R1,     .BTAB.71                ; 53DB   0241 0271
        MVO     R1,     .BTAB.72                ; 53DD   0241 0272
        MVII    #$028F, R4                      ; 53DF   02BC 028F
        MVII    #$000F, R0                      ; 53E1   02B8 000F

        JSR     R5,     X_FILL_MEM              ; 53E3   0004 0114 0341

        MVII    #$02BA, R4                      ; 53E6   02BC 02BA
        MVII    #$000C, R0                      ; 53E8   02B8 000C

        JSR     R5,     X_FILL_MEM              ; 53EA   0004 0114 0341

        MVII    #$02DD, R4                      ; 53ED   02BC 02DD
        MVII    #$0012, R0                      ; 53EF   02B8 0012

        JSR     R5,     X_FILL_MEM              ; 53F1   0004 0114 0341

        INCR    R1                              ; 53F4   0009
        MVII    #$02A7, R4                      ; 53F5   02BC 02A7
        MVII    #$0005, R0                      ; 53F7   02B8 0005

        JSR     R5,     X_FILL_MEM              ; 53F9   0004 0114 0341

        MVII    #$0020, R2                      ; 53FC   02BA 0020
        SWAP    R2,     1                       ; 53FE   0042
        MVO     R2,     .BTAB.B9                ; 53FF   0242 02B9
        MVO     R2,     .BTAB.DA                ; 5401   0242 02DA
        ADDR    R2,     R1                      ; 5403   00D1
        MVO@    R1,     R4                      ; 5404   0261
        MVO     R1,     .BTAB.A8                ; 5405   0241 02A8
        DECR    R1                              ; 5407   0011
        MVO     R1,     .BTAB.BC                ; 5408   0241 02BC
        MVO     R1,     .BTAB.C0                ; 540A   0241 02C0
        MOVR    R2,     R1                      ; 540C   0091
        ADDI    #$03A9, R2                      ; 540D   02FA 03A9
        MVO     R2,     .BTAB.B5                ; 540F   0242 02B5
        MVO     R2,     .BTAB.CA                ; 5411   0242 02CA
        SDBD                                    ; 5413   0001
        MVII    #$0976, R2                      ; 5414   02BA 0076 0009
        MVO     R2,     .BTAB.1F                ; 5417   0242 021F
        ADDI    #$0008, R2                      ; 5419   02FA 0008
        MVO     R2,     .BTAB.33                ; 541B   0242 0233
        SUBI    #$0178, R2                      ; 541D   033A 0178
        ADDR    R2,     R1                      ; 541F   00D1
        MVO     R1,     .BTAB.C2                ; 5420   0241 02C2
        ADDI    #$0020, R1                      ; 5422   02F9 0020
        MVO     R1,     .BTAB.C6                ; 5424   0241 02C6

        JSR     R5,     L_517B                  ; 5426   0004 0150 017B
        DECLE   $0000,  $0267,  $0368,  $028E   ; 5429   0000 0267 0368 028E
        DECLE   $02C3,  $037B,  $02D6,  $037C   ; 542D   02C3 037B 02D6 037C
        DECLE   $02D7,  $03EE,  $038D,  $03A1   ; 5431   02D7 03EE 038D 03A1
        DECLE   $03A2,  $03B6,  $03B7,  $0373   ; 5435   03A2 03B6 03B7 0373
        DECLE   $029B,  $0374,  $029C,  $0387   ; 5439   029B 0374 029C 0387

        MVI@    R5,     R7                      ; 543D   02AF

        DECLE   $02CB,  $0388,  $02B0,  $02CC   ; 543E   02CB 0388 02B0 02CC
        DECLE   $03B8,  $03C1,  $0000           ; 5442   03B8 03C1 0000

        INCR    R2                              ; 5445   000A

        JSR     R5,     L_517B                  ; 5446   0004 0150 017B
        DECLE   $0011,  $022D,  $032E,  $022F   ; 5449   0011 022D 032E 022F
        DECLE   $0230,  $0232,  $0234,  $0364   ; 544D   0230 0232 0234 0364
        DECLE   $0276,  $0019,  $026C,  $0000   ; 5451   0276 0019 026C 0000

        SUBI    #$0005, R2                      ; 5455   033A 0005

        JSR     R5,     L_517B                  ; 5457   0004 0150 017B
        DECLE   $0003,  $0249,  $0010,  $0235   ; 545A   0003 0249 0010 0235
        DECLE   $0014,  $021D,  $0245,  $0295   ; 545E   0014 021D 0245 0295
        DECLE   $0331,  $0259,  $026D,  $0281   ; 5462   0331 0259 026D 0281
        DECLE   $031C,  $03B4,  $001C,  $0246   ; 5466   031C 03B4 001C 0246
        DECLE   $035A,  $036E,  $0382,  $0396   ; 546A   035A 036E 0382 0396
        DECLE   $0000                           ; 546E   0000

        ADDI    #$00C3, R2                      ; 546F   02FA 00C3
        MVI     G_019B, R1                      ; 5471   0281 019B
        TSTR    R1                              ; 5473   0089
        BEQ     L_5478                          ; 5474   0204 0002

        MVO     R2,     .BTAB.B2                ; 5476   0242 02B2
L_5478:
        SDBD                                    ; 5478   0001
        MVII    #$144F, R2                      ; 5479   02BA 004F 0014
        MVO     R2,     .BTAB.D9                ; 547C   0242 02D9
        MVII    #$0301, R2                      ; 547E   02BA 0301
        MVO     R2,     .BTAB.D8                ; 5480   0242 02D8
        MVII    #$0011, R1                      ; 5482   02B9 0011
        MVO     R1,     G_01D3                  ; 5484   0241 01D3
        MVII    #$0001, R1                      ; 5486   02B9 0001
        MVO     R1,     G_01D0                  ; 5488   0241 01D0
        MVO     R1,     G_01E6                  ; 548A   0241 01E6
        MVII    #$017E, R0                      ; 548C   02B8 017E
        INCR    R0                              ; 548E   0008
        MVO     R0,     G_01E4                  ; 548F   0240 01E4

L_5491:
        JSR     R5,     L_549E                  ; 5491   0004 0154 009E
        DECLE   $0043,  $0061,  $0000,  $0000   ; 5494   0043 0061 0000 0000
        DECLE   $0071,  $0062,  $0000,  $0000   ; 5498   0071 0062 0000 0000
        DECLE   $0000,  $0000                   ; 549C   0000 0000
L_549E:
        MVO     R5,     G_035D                  ; 549E   0245 035D
        MVII    #$0170, R1                      ; 54A0   02B9 0170
        ADD     G_0165, R1                      ; 54A2   02C1 0165
        MVI@    R1,     R1                      ; 54A4   0289
L_54A5:
        CMP     G_017C, R1                      ; 54A5   0341 017C
        BEQ     L_54B0                          ; 54A7   0204 0007

        PSHR    R1                              ; 54A9   0271

        JSR     R5,     L_5F07                  ; 54AA   0004 015C 0307

        PULR    R1                              ; 54AD   02B1
        B       L_54A5                          ; 54AE   0220 000A

L_54B0:
        EIS                                     ; 54B0   0002
        MVO     R5,     .STIC.VIDEN             ; 54B1   0245 0020
        MVII    #$0004, R0                      ; 54B3   02B8 0004
        MVO     R0,     G_0102                  ; 54B5   0240 0102
        PULR    R7                              ; 54B7   02B7

.GFX_LIST_54B8:
        DECLE   $0000,  $0001,  $0103,  $0300   ; 54B8  CART PIC #00
        DECLE   $0000,  $0080,  $01C0,  $0300   ; 54BC  
        DECLE   $0100,  $0001,  $0003,  $0300   ; 54C0  CART PIC #01
        DECLE   $0100,  $0080,  $00C0,  $0300   ; 54C4  
        DECLE   $0000,  $0068,  $00C4,  $002A   ; 54C8  CART PIC #02
        DECLE   $00DD,  $00AB,  $00F7,  $00FF   ; 54CC  
        DECLE   $0020,  $0066,  $02FF,  $0066   ; 54D0  CART PIC #03
        DECLE   $0026,  $0006,  $0004,  $0066   ; 54D4  
        DECLE   $02FF,  $0066,  $0064,  $0060   ; 54D8  CART PIC #04
        DECLE   $00FF,  $00F0,  $0300,  $0100   ; 54DC  
        DECLE   $00FF,  $000F,  $0300,  $0100   ; 54E0  CART PIC #05
        DECLE   $03F0,  $00C0,  $02FF,  $030F   ; 54E4  
        DECLE   $0003,  $02FF,  $02FF,  $00FF   ; 54E8  CART PIC #06
        DECLE   $003F,  $02FF,  $0300,  $0000   ; 54EC  
        DECLE   $020F,  $0300,  $0000,  $02F0   ; 54F0  CART PIC #07
        DECLE   $02FF,  $00FF,  $00FC,  $02FF   ; 54F4  
        DECLE   $01FF,  $03E0,  $01E0,  $01FF   ; 54F8  CART PIC #08
        DECLE   $0303,  $0103,  $03E0,  $03E0   ; 54FC  
        DECLE   $0303,  $0303,  $0100,  $02FF   ; 5500  CART PIC #09
        DECLE   $02FF,  $00FF,  $0081,  $00FF   ; 5504  
        DECLE   $0081,  $00FF,  $0081,  $00FF   ; 5508  CART PIC #0A
        DECLE   $0081,  $003E,  $0063,  $0000   ; 550C  
        DECLE   $0041,  $003E,  $0041,  $003E   ; 5510  CART PIC #0B
        DECLE   $0000,  $003E,  $007F,  $00E3   ; 5514  
        DECLE   $00AE,  $00A2,  $003A,  $0022   ; 5518  CART PIC #0C
        DECLE   $003E,  $003C,  $0118,  $002C   ; 551C  
        DECLE   $005E,  $00DF,  $00EF,  $007E   ; 5520  CART PIC #0D
        DECLE   $0003,  $0101,  $0002,  $0005   ; 5524  
        DECLE   $000D,  $000E,  $0007,  $00C0   ; 5528  CART PIC #0E
        DECLE   $0180,  $00C0,  $00E0,  $01F0   ; 552C  
        DECLE   $00E0,  $0300,  $003E,  $0063   ; 5530  CART PIC #0F
        DECLE   $0000,  $0041,  $003E,  $0041   ; 5534  
        DECLE   $003E,  $0300,  $0000,  $03FF   ; 5538  CART PIC #10
        DECLE   $03F0,  $00FC,  $0200,  $0020   ; 553C  
        DECLE   $0066,  $02FF,  $0066,  $0026   ; 5540  CART PIC #11
        DECLE   $0006,  $0004,  $0066,  $02FF   ; 5544  
        DECLE   $0066,  $0064,  $0060,  $02FF   ; 5548  CART PIC #12
        DECLE   $00FF,  $0300,  $030F,  $0300   ; 554C  
        DECLE   $03F0,  $0300,  $01FF,  $0300   ; 5550  CART PIC #13
        DECLE   $0100,  $0300,  $0100,  $0103   ; 5554  
        DECLE   $0300,  $0100,  $01C0,  $0300   ; 5558  CART PIC #14
        DECLE   $0100,  $01FF,  $01FF,  $02F0   ; 555C  
        DECLE   $0200,  $003E,  $007F,  $00E3   ; 5560  CART PIC #15
        DECLE   $00AE,  $00A2,  $003A,  $0022   ; 5564  
        DECLE   $003E,  $0303,  $0103,  $0007   ; 5568  CART PIC #16
        DECLE   $0000,  $03C0,  $01C0,  $00E0   ; 556C  
        DECLE   $0000,  $01FF,  $0300,  $0103   ; 5570  CART PIC #17
        DECLE   $01FF,  $0300,  $01FF,  $01FF   ; 5574  

        SUB     G_01C0, R0                      ; 5578   0300 01C0
        XOR     G_01CC, R0                      ; 557A   03C0 01CC
        ADDR    R5,     R7                      ; 557C   00EF

        DECLE   $000C,  $01FF                   ; 557D   000C 01FF

        SUBR    R1,     R4                      ; 557F   010C
        INCR    R7                              ; 5580   000F

        INCR    R4                              ; 5581   000C
L_5582:
        ADDR    R1,     R4                      ; 5582   00CC
        ADDR    R1,     R7                      ; 5583   00CF

        XORR    R1,     R4                      ; 5584   01CC
        ADDR    R1,     R7                      ; 5585   00CF

        XORR    R1,     R4                      ; 5586   01CC
        ADDR    R1,     R7                      ; 5587   00CF

        DECLE   $00EC,  $000C,  $0303,  $0133   ; 5588   00EC 000C 0303 0133
        DECLE   $00F7,  $0030,  $01FF,  $0130   ; 558C   00F7 0030 01FF 0130
        DECLE   $00F0,  $0030,  $0033,  $00F3   ; 5590   00F0 0030 0033 00F3
        DECLE   $0133,  $00F3,  $0133,  $00F3   ; 5594   0133 00F3 0133 00F3
        DECLE   $0037,  $0030,  $01FF,  $03C0   ; 5598   0037 0030 01FF 03C0
        DECLE   $00E0,  $0000,  $011F,  $0300   ; 559C   00E0 0000 011F 0300
        DECLE   $00FF,  $0000,  $0300,  $0100   ; 55A0   00FF 0000 0300 0100
        DECLE   $00FF,  $0000,  $0300,  $0130   ; 55A4   00FF 0000 0300 0130
        DECLE   $00F0,  $0030,  $01FF,  $0130   ; 55A8  CART PIC #1E
        DECLE   $00F0,  $0130,  $00F0,  $0130   ; 55AC  
        DECLE   $00F0,  $0130,  $00F0,  $0130   ; 55B0   00F0 0130 00F0 0130
        DECLE   $0200,  $01FE,  $0238,  $00FF   ; 55B4   0200 01FE 0238 00FF

        ADDR    R7,     R1                      ; 55B8   00F9
        ADDR    R7,     R3                      ; 55B9   00FB
        ADDR    R7,     R1                      ; 55BA   00F9
        ADDR    R7,     R3                      ; 55BB   00FB
        ADDR    R1,     R3                      ; 55BC   00CB
        ADDR    R0,     R7                      ; 55BD   00C7

        DECLE   $00FF,  $0300                   ; 55BE   00FF 0300
        DECLE   $0007,  $003F,  $00FF,  $0070   ; 55C0  CART PIC #21
        DECLE   $0100,  $0007,  $01FF,  $00F8   ; 55C4  

        MOVR    R3,     R4                      ; 55C8   009C
        RSWD    R6                              ; 55C9   003E
        INCR    R6                              ; 55CA   000E
        SARC    R3,     2                       ; 55CB   007F
        ADDR    R7,     R6                      ; 55CC   00FE
        ADDR    R6,     R0                      ; 55CD   00F0
        TSTR    R0                              ; 55CE   0080
        B       L_59D0                          ; 55CF   0200 03FF

        DECLE   $01FF,  $0300,  $0000,  $0003   ; 55D1   01FF 0300 0000 0003
        DECLE   $01FF,  $010F,  $0270,  $0080   ; 55D5   01FF 010F 0270 0080
        DECLE   $0103,  $021C,  $02E0,  $0180   ; 55D9   0103 021C 02E0 0180
        DECLE   $0300,  $0100,  $01F8,  $0300   ; 55DD   0300 0100 01F8 0300
        DECLE   $0100,  $0300,  $0200,  $0003   ; 55E1   0100 0300 0200 0003
        DECLE   $0103,  $021C,  $00E0,  $01FF   ; 55E5   0103 021C 00E0 01FF
        DECLE   $0180,  $0300,  $01FF,  $0007   ; 55E9   0180 0300 01FF 0007
        DECLE   $0300,  $0200,  $0000,  $02E0   ; 55ED   0300 0200 0000 02E0
        DECLE   $020E,  $0001,  $01FF,  $01E0   ; 55F1   020E 0001 01FF 01E0
        DECLE   $020E,  $0001,  $01FF           ; 55F5   020E 0001 01FF
        DECLE   $0300,  $0000,  $00C0,  $0101   ; 55F8  CART PIC #28
        DECLE   $0300,  $0100,  $01C0,  $0238   ; 55FC  
        DECLE   $0207,  $0300,  $0200,  $00C0   ; 5600  CART PIC #29
        DECLE   $01FF,  $0301,  $0101,  $0200   ; 5604  
        DECLE   $03C0                           ; 5608   03C0

        ADDR    R0,     R0                      ; 5609   00C0
        B       L_563C                          ; 560A   0200 0030

        DECLE   $0078,  $0036                   ; 560C   0078 0036

        GSWD    R1                              ; 560E   0031
        GSWD    R0                              ; 560F   0030
        B       L_562A                          ; 5610   0200 0018

        RSWD    R4                              ; 5612   003C
        SLLC    R2,     1                       ; 5613   005A
        MOVR    R3,     R1                      ; 5614   0099
        COMR    R0                              ; 5615   0018
        SWAP    R2,     2                       ; 5616   0046
        ADDR    R5,     R7                      ; 5617   00EF

        DECLE   $00FF,  $006F,  $0002,  $0200   ; 5618   00FF 006F 0002 0200
        DECLE   $01FF                           ; 561C   01FF

        XOR@    R4,     R0                      ; 561D   03E0
        XORR    R4,     R0                      ; 561E   01E0
        XOR@    R4,     R0                      ; 561F   03E0
        XOR@    R4,     R0                      ; 5620   03E0
        SUBR    R1,     R7                      ; 5621   010F

        SUB     .ISRVEC.0,R0                    ; 5622   0300 0100
        SUB@    R3,     R0                      ; 5624   0318
        MOVR    R3,     R1                      ; 5625   0099
        SLLC    R2,     1                       ; 5626   005A
        RSWD    R4                              ; 5627   003C
        COMR    R0                              ; 5628   0018
        RSWD    R6                              ; 5629   003E
L_562A:
        SARC    R3,     2                       ; 562A   007F
        ADDR    R4,     R3                      ; 562B   00E3
        MOVR    R5,     R6                      ; 562C   00AE
        MOVR    R4,     R2                      ; 562D   00A2
        RSWD    R2                              ; 562E   003A
        NEGR    R2                              ; 562F   0022
        RSWD    R6                              ; 5630   003E
        SARC    R2,     2                       ; 5631   007E
        ADDR    R3,     R3                      ; 5632   00DB
        SARC    R2,     2                       ; 5633   007E
        SUB     .STIC.X.0,R0                    ; 5634   0300 0000
        SETC                                    ; 5636   0007
        INCR    R5                              ; 5637   000D
        SETC                                    ; 5638   0007
        SUB     .STIC.X.0,R0                    ; 5639   0300 0000
        ADDR    R4,     R0                      ; 563B   00E0
L_563C:
        MOVR    R6,     R0                      ; 563C   00B0
        DECLE   $00E0,  $0300,  $0000,  $01FF   ; 563D   00E0 0300 0000 01FF
        DECLE   $0142,  $0300,  $0300,  $0300   ; 5641   0142 0300 0300 0300
        DECLE   $0300,  $0300,  $0300,  $0300   ; 5645   0300 0300 0300 0300
        DECLE   $0300,  $01FF,  $013C,  $0000   ; 5649   0300 01FF 013C 0000
        DECLE   $00B6,  $00FF,  $007E,  $0039   ; 564D   00B6 00FF 007E 0039
        DECLE   $005C,  $000C,  $0000,  $0060   ; 5651   005C 000C 0000 0060
        DECLE   $0030,  $00BA,  $00FF           ; 5655   0030 00BA 00FF
        DECLE   $007A,  $0020,  $0040,  $0000   ; 5658  CART PIC #34
        DECLE   $03FF,  $0000,  $0000,  $0000   ; 565C  
        DECLE   $0000,  $0000,  $0000,  $0068   ; 5660   0000 0000 0000 0068
        DECLE   $0000,  $0000,  $007C,  $003E   ; 5664   0000 0000 007C 003E
        DECLE   $001C,  $0038,  $003C,  $00F6   ; 5668   001C 0038 003C 00F6
        DECLE   $0083,  $0000,  $0000,  $0000   ; 566C   0083 0000 0000 0000
        DECLE   $0000,  $0000,  $0034,  $0000   ; 5670   0000 0000 0034 0000
        DECLE   $0000,  $0030,  $007C,  $0078   ; 5674   0000 0030 007C 0078
        DECLE   $0000,  $003C,  $0078,  $0050   ; 5678  CART PIC #38
        DECLE   $0018,  $0000,  $0000,  $0000   ; 567C  
        DECLE   $0000,  $0000,  $0068,  $0000   ; 5680   0000 0000 0068 0000
        DECLE   $0000,  $0028,  $007C,  $0070   ; 5684   0000 0028 007C 0070
        DECLE   $0064,  $003C,  $0018,  $003C   ; 5688   0064 003C 0018 003C
        DECLE   $0020,  $0000,  $0000,  $0000   ; 568C   0020 0000 0000 0000
        DECLE   $0010,  $0051,  $006B,  $0039   ; 5690   0010 0051 006B 0039
        DECLE   $0011,  $0083,  $0083,  $00C1   ; 5694   0011 0083 0083 00C1
        DECLE   $00C1,  $00C0,  $0040,  $00C0   ; 5698   00C1 00C0 0040 00C0
        DECLE   $00C0,  $0000,  $0000,  $0038   ; 569C   00C0 0000 0000 0038
        DECLE   $0028,  $0034,  $001C,  $0008   ; 56A0   0028 0034 001C 0008
        DECLE   $0008,  $0000,  $0000,  $0004   ; 56A4   0008 0000 0000 0004
        DECLE   $000E,  $003E,  $003C,  $0000   ; 56A8   000E 003E 003C 0000
        DECLE   $0000,  $0000,  $0000,  $0070   ; 56AC   0000 0000 0000 0070
        DECLE   $0050,  $0068,  $0038,  $0010   ; 56B0   0050 0068 0038 0010
        DECLE   $0012,  $0003,  $0003,  $000E   ; 56B4   0012 0003 0003 000E
        DECLE   $000E,  $0018,  $0038,  $0000   ; 56B8   000E 0018 0038 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56BC   0000 0000 0000 0000
        DECLE   $0000,  $0030,  $0000,  $0020   ; 56C0   0000 0030 0000 0020
        DECLE   $0058,  $0078,  $0078,  $0010   ; 56C4   0058 0078 0078 0010
        DECLE   $0040,  $0078,  $007C,  $0024   ; 56C8   0040 0078 007C 0024
        DECLE   $0036,  $0000,  $0000,  $0000   ; 56CC   0036 0000 0000 0000
        DECLE   $0000,  $0030,  $0000,  $0020   ; 56D0   0000 0030 0000 0020
        DECLE   $0058,  $0078,  $0078,  $0008   ; 56D4   0058 0078 0078 0008
        DECLE   $0058,  $0078,  $0038,  $0010   ; 56D8   0058 0078 0038 0010
        DECLE   $0018,  $0000,  $0000,  $0000   ; 56DC   0018 0000 0000 0000
        DECLE   $0000,  $0030,  $0000,  $0020   ; 56E0   0000 0030 0000 0020
        DECLE   $0058,  $00F8,  $00F8,  $0070   ; 56E4   0058 00F8 00F8 0070
        DECLE   $0078,  $0018,  $006C,  $0040   ; 56E8   0078 0018 006C 0040
        DECLE   $0040,  $0020,  $0038,  $0000   ; 56EC   0040 0020 0038 0000
        DECLE   $0010,  $0020,  $0024,  $0004   ; 56F0   0010 0020 0024 0004
        DECLE   $0004,  $0000,  $0000,  $0068   ; 56F4   0004 0000 0000 0068
        DECLE   $0068,  $0038,  $0038,  $0000   ; 56F8   0068 0038 0038 0000
        DECLE   $0000,  $0020,  $0038,  $0000   ; 56FC   0000 0020 0038 0000
        DECLE   $0010,  $0024,  $0024,  $0004   ; 5700   0010 0024 0024 0004
        DECLE   $0000,  $0000,  $0000,  $0070   ; 5704   0000 0000 0000 0070
        DECLE   $0070,  $0020,  $0020,  $0000   ; 5708   0070 0020 0020 0000
        DECLE   $0000                           ; 570C   0000

        NEGR    R0                              ; 570D   0020
        RSWD    R0                              ; 570E   0038

        JSR     R4,     .EXEC.424               ; 570F   0004 0014 0024
        DECLE   $0024,  $0004,  $0000,  $0000   ; 5712   0024 0004 0000 0000
        DECLE   $0000,  $00C0,  $00C0,  $0070   ; 5716   0000 00C0 00C0 0070
        DECLE   $0070,  $0000,  $0000,  $0000   ; 571A   0070 0000 0000 0000
        DECLE   $0028,  $007C,  $007C,  $0038   ; 571E   0028 007C 007C 0038
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5722   0010 0000 0000 0000
        DECLE   $0006,  $0004,  $0006,  $0004   ; 5726   0006 0004 0006 0004
        DECLE   $0034,  $0038,  $0000,  $0090   ; 572A   0034 0038 0000 0090
        DECLE   $0090,  $00F0,  $0090,  $0090   ; 572E   0090 00F0 0090 0090
        DECLE   $0000,  $0000,  $0000,  $00F0   ; 5732   0000 0000 0000 00F0
        DECLE   $0080,  $00E0,  $0080,  $00F0   ; 5736   0080 00E0 0080 00F0
        DECLE   $0000,  $0000,  $0000,  $0080   ; 573A   0000 0000 0000 0080
        DECLE   $0080,  $0080,  $0080,  $00F0   ; 573E   0080 0080 0080 00F0
        DECLE   $0000,  $0000,  $0000,  $00F0   ; 5742   0000 0000 0000 00F0
        DECLE   $0090,  $00F0,  $0080,  $0080   ; 5746   0090 00F0 0080 0080
        DECLE   $0000,  $0000,  $0000,  $00F0   ; 574A   0000 0000 0000 00F0
        DECLE   $00FC,  $00F0,  $0000,  $0000   ; 574E   00FC 00F0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000F   ; 5752   0000 0000 0000 000F
        DECLE   $003F,  $000F,  $0000,  $0000   ; 5756   003F 000F 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 575A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 575E   0000 0000 0000 0000
        DECLE   $0000,  $001A,  $0000,  $0018   ; 5762   0000 001A 0000 0018
        DECLE   $003F,  $003C,  $0038,  $0038   ; 5766   003F 003C 0038 0038
        DECLE   $007C,  $00E6,  $0083,  $0000   ; 576A   007C 00E6 0083 0000
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 576E   0000 0000 0000 00C0
        DECLE   $00A0,  $00E0,  $00C1,  $000F   ; 5772   00A0 00E0 00C1 000F
        DECLE   $000F,  $0000,  $0010,  $0070   ; 5776   000F 0000 0010 0070
        DECLE   $0070,  $0000,  $0000,  $0000   ; 577A   0070 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 577E   0000 0000 0000 0000
        DECLE   $0000,  $000D,  $0000,  $0002   ; 5782   0000 000D 0000 0002
        DECLE   $001F,  $001C,  $001A,  $003C   ; 5786   001F 001C 001A 003C
        DECLE   $003F,  $0012,  $001B,  $0000   ; 578A   003F 0012 001B 0000
        DECLE   $0000,  $003E,  $003E,  $0063   ; 578E   0000 003E 003E 0063
        DECLE   $0063,  $0041,  $0041,  $003E   ; 5792   0063 0041 0041 003E
        DECLE   $003E,  $0041,  $0041,  $003E   ; 5796   003E 0041 0041 003E
        DECLE   $003E,  $0000,  $0000,  $0000   ; 579A   003E 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 579E   0000 0000 0000 0000
        DECLE   $002C,  $0000,  $0016,  $003E   ; 57A2   002C 0000 0016 003E
        DECLE   $001C,  $000E,  $003E,  $002C   ; 57A6   001C 000E 003E 002C
        DECLE   $0066,  $0003,  $0006,  $0000   ; 57AA   0066 0003 0006 0000
        DECLE   $0000,  $0000,  $0000,  $000E   ; 57AE   0000 0000 0000 000E
        DECLE   $000D,  $0007,  $0004,  $0000   ; 57B2   000D 0007 0004 0000
        DECLE   $0000,  $0022,  $0022,  $0066   ; 57B6   0000 0022 0022 0066
        DECLE   $0064,  $0047,  $0043,  $0003   ; 57BA   0064 0047 0043 0003
        DECLE   $0001                           ; 57BE   0001
L_57BF:
        DECR    R7                              ; 57BF   0017

        DECLE   $00AB,  $00FB,  $0089,  $00C0   ; 57C0   00AB 00FB 0089 00C0
        DECLE   $00C0,  $00C0,  $0040,  $0000   ; 57C4   00C0 00C0 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57C8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57CC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57D0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 57D4   0000 0000 0000 003C
        DECLE   $007E,  $007F,  $007F,  $00FB   ; 57D8   007E 007F 007F 00FB
        DECLE   $00AC,  $0003,  $0003,  $000C   ; 57DC   00AC 0003 0003 000C
        DECLE   $000C,  $000C,  $000C,  $000C   ; 57E0   000C 000C 000C 000C
        DECLE   $000C,  $0008,  $0008,  $0008   ; 57E4   000C 0008 0008 0008
        DECLE   $0008,  $0008,  $0004,  $0004   ; 57E8   0008 0008 0004 0004
        DECLE   $0008,  $0003,  $0003,  $000C   ; 57EC   0008 0003 0003 000C
        DECLE   $000C,  $000C,  $000C,  $000C   ; 57F0   000C 000C 000C 000C
        DECLE   $000C,  $0004,  $0004,  $0004   ; 57F4   000C 0004 0004 0004
        DECLE   $0002,  $0002,  $0001,  $0001   ; 57F8   0002 0002 0001 0001

        EIS                                     ; 57FC   0002
        DIS                                     ; 57FD   0003
        DIS                                     ; 57FE   0003
        INCR    R4                              ; 57FF   000C
        INCR    R4                              ; 5800   000C
        INCR    R4                              ; 5801   000C
        INCR    R4                              ; 5802   000C
        INCR    R0                              ; 5803   0008
        INCR    R0                              ; 5804   0008
        DECR    R0                              ; 5805   0010
        DECR    R0                              ; 5806   0010
        NEGR    R0                              ; 5807   0020
        NEGR    R0                              ; 5808   0020
        SWAP    R0,     1                       ; 5809   0040
        SWAP    R0,     1                       ; 580A   0040
        SLR     R0,     1                       ; 580B   0060
        SLR     R0,     1                       ; 580C   0060
        ADDR    R2,     R7                      ; 580D   00D7

        DECLE   $0038,  $0088,  $0058,  $0000   ; 580E   0038 0088 0058 0000
        DECLE   $0060,  $0000,  $0030,  $0000   ; 5812   0060 0000 0030 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5816   0000 0000 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0046   ; 581A   0000 0000 0000 0046
        DECLE   $0038,  $0029,  $0058,  $0000   ; 581E   0038 0029 0058 0000
        DECLE   $0000,  $0000,  $0000,  $0005   ; 5822   0000 0000 0000 0005
        DECLE   $0000,  $0000,  $0002,  $0000   ; 5826   0000 0000 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0003   ; 582A   0000 0000 0000 0003
        DECLE   $0012,  $0000,  $00C7,  $0018   ; 582E   0012 0000 00C7 0018
        DECLE   $0061,  $0058,  $0000,  $0020   ; 5832   0061 0058 0000 0020
        DECLE   $0000,  $0020,  $0000,  $0000   ; 5836   0000 0020 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 583A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0046,  $0018   ; 583E   0000 0000 0046 0018
        DECLE   $004C,  $0058,  $0000,  $0000   ; 5842   004C 0058 0000 0000
        DECLE   $0000,  $0000,  $0005,  $0000   ; 5846   0000 0000 0005 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 584A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0006   ; 584E   0000 0000 0003 0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5852   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $002A,  $0000   ; 5856   0000 0000 002A 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 585A   0000 0000 0000 0000
        DECLE   $0000,  $002C,  $0000,  $0000   ; 585E   0000 002C 0000 0000
        DECLE   $0000,  $006B,  $0063,  $0003   ; 5862   0000 006B 0063 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5866   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0024   ; 586A   0000 0000 0000 0024
        DECLE   $0000,  $0000,  $0000,  $0000   ; 586E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0028,  $0000   ; 5872   0000 0000 0028 0000
        DECLE   $0000,  $0000,  $006B,  $0063   ; 5876   0000 0000 006B 0063
        DECLE   $0000,  $0020,  $0000,  $0000   ; 587A   0000 0020 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 587E   0000 0000 0000 0000
        DECLE   $0022,  $0004,  $037F,  $005F   ; 5882   0022 0004 037F 005F
        DECLE   $0383,  $015F,  $0000,  $0000   ; 5886   0383 015F 0000 0000
        DECLE   $00FD,  $0058,  $0003,  $000C   ; 588A   00FD 0058 0003 000C
        DECLE   $0005,  $00E9,  $005D,  $02B6   ; 588E   0005 00E9 005D 02B6
        DECLE   $005D,  $02B6,  $015D,  $0000   ; 5892   005D 02B6 015D 0000
        DECLE   $0000,  $00FD,  $0058,  $0000   ; 5896   0000 00FD 0058 0000
        DECLE   $002E,  $0004,  $02B6,  $005D   ; 589A   002E 0004 02B6 005D
        DECLE   $02B6,  $015D,  $0000,  $0000   ; 589E   02B6 015D 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0030   ; 58A2   0000 0000 0003 0030
        DECLE   $0004,  $02B6,  $005D,  $02B6   ; 58A6   0004 02B6 005D 02B6
        DECLE   $015D,  $0000,  $0000,  $0000   ; 58AA   015D 0000 0000 0000
        DECLE   $0000,  $0000,  $0026,  $0000   ; 58AE   0000 0000 0026 0000
        DECLE   $0082,  $0018,  $00C0,  $0058   ; 58B2   0082 0018 00C0 0058
        DECLE   $0000,  $0054,  $0000,  $0010   ; 58B6   0000 0054 0000 0010
        DECLE   $0010,  $0000,  $0000,  $0000   ; 58BA   0010 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 58BE   0001 0000 0000 0000
        DECLE   $0080,  $005E,  $0006,  $0018   ; 58C2   0080 005E 0006 0018
        DECLE   $0004,  $02D8,  $005E,  $02D8   ; 58C6   0004 02D8 005E 02D8
        DECLE   $015E,  $0094,  $0018,  $00D9   ; 58CA   015E 0094 0018 00D9
        DECLE   $0058,  $0000,  $0010,  $0000   ; 58CE   0058 0000 0010 0000
        DECLE   $0038,  $0000,  $0040,  $0000   ; 58D2   0038 0000 0040 0000
        DECLE   $0000,  $0060,  $0000,  $0000   ; 58D6   0000 0060 0000 0000
        DECLE   $0000,  $0075,  $005F,  $0001   ; 58DA   0000 0075 005F 0001
        DECLE   $001F,  $0004,  $0248,  $0064   ; 58DE   001F 0004 0248 0064
        DECLE   $0248,  $0164,  $0094,  $0018   ; 58E2   0248 0164 0094 0018
        DECLE   $00F2,  $0058,  $0000,  $0098   ; 58E6   00F2 0058 0000 0098
        DECLE   $0000,  $0038,  $0000,  $00C0   ; 58EA   0000 0038 0000 00C0
        DECLE   $0000,  $0000,  $0060,  $0000   ; 58EE   0000 0000 0060 0000
        DECLE   $0000,  $0000,  $0075,  $005F   ; 58F2   0000 0000 0075 005F
        DECLE   $0001,  $001E,  $0004           ; 58F6   0001 001E 0004

        MVO@    R0,     R1                      ; 58F9   0248
        SLR     R0,     2                       ; 58FA   0064
        MVO@    R0,     R1                      ; 58FB   0248
        CMPR    R4,     R4                      ; 58FC   0164
        PSHR    R5                              ; 58FD   0275
        MVII    #$031D, R1                      ; 58FE   02B9 031D

        JSR     R5,     .EXEC.777               ; 5900   0004 0114 0377

        CLRR    R0                              ; 5903   01C0
        MVO     R0,     G_0321                  ; 5904   0240 0321
        MVO     R0,     G_0322                  ; 5906   0240 0322
        NOP                                     ; 5908   0034
        MVO     R0,     G_032A                  ; 5909   0240 032A
        CMPI    #$00A0, R2                      ; 590B   037A 00A0
        BLT     L_5916                          ; 590D   0205 0007

        MVII    #$0008, R2                      ; 590F   02BA 0008
        SWAP    R2,     1                       ; 5911   0042
        MVO     R2,     G_031F                  ; 5912   0242 031F
        NOP                                     ; 5914   0034
        SWAP    R2,     1                       ; 5915   0042
L_5916:
        MVO     R2,     G_0183                  ; 5916   0242 0183
        MVI     G_0181, R0                      ; 5918   0280 0181
        ANDI    #$0007, R0                      ; 591A   03B8 0007
        SLL     R0,     1                       ; 591C   0048
        ADDR    R0,     R7                      ; 591D   00C7
        B       L_592E                          ; 591E   0200 000E
        B       L_5A7B                          ; 5920   0200 0159
        B       L_5AF8                          ; 5922   0200 01D4
        B       L_5B3A                          ; 5924   0200 0214
        B       L_5BAA                          ; 5926   0200 0282
        B       L_5BE5                          ; 5928   0200 02BB
        B       L_5C2C                          ; 592A   0200 0300
        B       L_5A9F                          ; 592C   0200 0171

L_592E:
        MVI     G_0180, R5                      ; 592E   0285 0180
        CMPI    #$0004, R5                      ; 5930   037D 0004
        BGE     L_5C80                          ; 5932   020D 034C

        CMPI    #$0050, R3                      ; 5934   037B 0050
        BEQ     L_5947                          ; 5936   0204 000F

        CMPI    #$0030, R3                      ; 5938   037B 0030
        BEQ     L_5947                          ; 593A   0204 000B

        CMPI    #$0040, R3                      ; 593C   037B 0040
        BEQ     L_5947                          ; 593E   0204 0007

        MVII    #$0040, R3                      ; 5940   02BB 0040
        SWAP    R3,     1                       ; 5942   0043
        MVO     R3,     G_0320                  ; 5943   0243 0320
        NOP                                     ; 5945   0034
        SWAP    R3,     1                       ; 5946   0043
L_5947:
        MVO     R3,     G_0184                  ; 5947   0243 0184
        TSTR    R5                              ; 5949   00AD
        BNEQ    L_59E0                          ; 594A   020C 0094

        MVI     G_018E, R0                      ; 594C   0280 018E
        INCR    R0                              ; 594E   0008
        MOVR    R0,     R4                      ; 594F   0084
        MVO     R0,     G_018E                  ; 5950   0240 018E
        ADD     G_017E, R0                      ; 5952   02C0 017E
        ANDI    #$0007, R0                      ; 5954   03B8 0007
        BNEQ    L_5962                          ; 5956   020C 000A

        MVO     R0,     G_0182                  ; 5958   0240 0182
        INCR    R0                              ; 595A   0008
        MVO     R0,     G_0181                  ; 595B   0240 0181
        INCR    R5                              ; 595D   000D
        MVO     R5,     G_0180                  ; 595E   0245 0180
        B       L_5A7B                          ; 5960   0200 0119

L_5962:
        JSR     R5,     L_59C5                  ; 5962   0004 0158 01C5
        DECLE   $0000,  $0170,  $0158,  $0178   ; 5965   0000 0170 0158 0178
        DECLE   $0148,  $0158,  $0120,  $0308   ; 5969   0148 0158 0120 0308
        DECLE   $0000,  $0170,  $0158,  $0188   ; 596D   0000 0170 0158 0188
        DECLE   $0158,  $0170,  $0120,  $0308   ; 5971   0158 0170 0120 0308
        DECLE   $0000,  $0170,  $0158,  $0188   ; 5975   0000 0170 0158 0188
        DECLE   $0158,  $0148,  $0120,  $0308   ; 5979   0158 0148 0120 0308
        DECLE   $0000,  $0170,  $0158,  $0178   ; 597D   0000 0170 0158 0178
        DECLE   $0120,  $0308,  $0288,  $0170   ; 5981   0120 0308 0288 0170
        DECLE   $0000,  $0170,  $0158,  $0178   ; 5985   0000 0170 0158 0178
        DECLE   $0138,  $0158,  $0120,  $0390   ; 5989   0138 0158 0120 0390
        DECLE   $0000,  $0170,  $0158,  $0188   ; 598D   0000 0170 0158 0188
        DECLE   $0158,  $0170,  $0120,  $0390   ; 5991   0158 0170 0120 0390
        DECLE   $0000,  $0170,  $0158,  $0188   ; 5995   0000 0170 0158 0188
        DECLE   $0158,  $0138,  $0120,  $0390   ; 5999   0158 0138 0120 0390
        DECLE   $0000,  $0170,  $0158,  $0178   ; 599D   0000 0170 0158 0178
        DECLE   $0120,  $0390,  $011C,  $0170   ; 59A1   0120 0390 011C 0170
        DECLE   $0000,  $0170,  $0150,  $0178   ; 59A5   0000 0170 0150 0178
        DECLE   $0140,  $0150,  $0120,  $030C   ; 59A9   0140 0150 0120 030C
        DECLE   $0000,  $0170,  $0150,  $0188   ; 59AD   0000 0170 0150 0188
        DECLE   $0150,  $0170,  $0138,  $030C   ; 59B1   0150 0170 0138 030C
        DECLE   $0000,  $0170,  $0150,  $0188   ; 59B5   0000 0170 0150 0188
        DECLE   $0150,  $0140,  $0150,  $030C   ; 59B9   0150 0140 0150 030C
        DECLE   $0000                           ; 59BD   0000

        CMPR    R6,     R0                      ; 59BE   0170
        CMPR    R2,     R0                      ; 59BF   0150
        CMPR    R7,     R0                      ; 59C0   0178
        SUBR    R7,     R0                      ; 59C1   0138
        SUB@    R1,     R4                      ; 59C2   030C
        MVI@    R1,     R4                      ; 59C3   028C
        CMPR    R6,     R0                      ; 59C4   0170
L_59C5:
        ADDR    R4,     R5                      ; 59C5   00E5
        MVI     G_017A, R0                      ; 59C6   0280 017A
        CMPI    #$0004, R0                      ; 59C8   0378 0004
        BLT     L_59D2                          ; 59CA   0205 0006
        BEQ     L_59D0                          ; 59CC   0204 0002

        ADDI    #$0020, R5                      ; 59CE   02FD 0020
L_59D0:
        ADDI    #$0020, R5                      ; 59D0   02FD 0020
L_59D2:
        MVI@    R5,     R0                      ; 59D2   02A8
L_59D3:
        MOVR    R0,     R2                      ; 59D3   0082
        SWAP    R0,     1                       ; 59D4   0040
        ANDI    #$0007, R0                      ; 59D5   03B8 0007
        MVO     R0,     G_0181                  ; 59D7   0240 0181
        CLRR    R0                              ; 59D9   01C0
        MVO     R0,     G_0182                  ; 59DA   0240 0182
        ANDI    #$00FF, R2                      ; 59DC   03BA 00FF
        B       L_5AC7                          ; 59DE   0200 00E7

L_59E0:
        JSR     R4,     L_5A2B                  ; 59E0   0004 0058 022B
        DECLE   $0308,  $0010,  $0120,  $0040   ; 59E3   0308 0010 0120 0040
        DECLE   $0058,  $0070,  $0088,  $0398   ; 59E7   0058 0070 0088 0398
        DECLE   $0308,  $0210,  $0120,  $0040   ; 59EB   0308 0210 0120 0040
        DECLE   $0058,  $0070,  $0288,  $0398   ; 59EF   0058 0070 0288 0398
        DECLE   $0008,  $0210,  $0120,  $0040   ; 59F3   0008 0210 0120 0040
        DECLE   $0058,  $0070,  $0288,  $0094   ; 59F7   0058 0070 0288 0094
        DECLE   $0008,  $0120,  $0040,  $0058   ; 59FB   0008 0120 0040 0058
        DECLE   $0070,  $0080,  $0390,  $0390   ; 59FF   0070 0080 0390 0390
        DECLE   $0214,  $0138,  $004C,  $0060   ; 5A03   0214 0138 004C 0060
        DECLE   $0070,  $0280,  $0390,  $0094   ; 5A07   0070 0280 0390 0094
        DECLE   $0020,  $0138,  $0050,  $0060   ; 5A0B   0020 0138 0050 0060
        DECLE   $0070,  $0280,  $0280,  $0094   ; 5A0F   0070 0280 0280 0094
        DECLE   $030C,  $0130,  $0040,  $0050   ; 5A13   030C 0130 0040 0050
        DECLE   $0060,  $0070,  $0380,  $0094   ; 5A17   0060 0070 0380 0094
        DECLE   $0208,  $031C,  $0138,  $0048   ; 5A1B   0208 031C 0138 0048
        DECLE   $0060,  $037C,  $028C,  $0094   ; 5A1F   0060 037C 028C 0094
        DECLE   $0010,  $0228                   ; 5A23   0010 0228

        CMPR    R0,     R0                      ; 5A25   0140
        RLC     R0,     1                       ; 5A26   0050
        SLR     R0,     1                       ; 5A27   0060
        PSHR    R0                              ; 5A28   0270
        MOVR    R1,     R0                      ; 5A29   0088
        MOVR    R2,     R4                      ; 5A2A   0094
L_5A2B:
        MVI     G_017A, R0                      ; 5A2B   0280 017A
        CMPI    #$0004, R0                      ; 5A2D   0378 0004
        BLT     L_5A37                          ; 5A2F   0205 0006
        BEQ     L_5A35                          ; 5A31   0204 0002

        ADDI    #$0018, R4                      ; 5A33   02FC 0018
L_5A35:
        ADDI    #$0018, R4                      ; 5A35   02FC 0018
L_5A37:
        CMPI    #$0040, R3                      ; 5A37   037B 0040
        BLT     L_5A41                          ; 5A39   0205 0006
        BEQ     L_5A3F                          ; 5A3B   0204 0002

        ADDI    #$0008, R4                      ; 5A3D   02FC 0008
L_5A3F:
        ADDI    #$0008, R4                      ; 5A3F   02FC 0008
L_5A41:
        MVI     G_0180, R5                      ; 5A41   0285 0180
        CMPI    #$0002, R5                      ; 5A43   037D 0002
        BEQ     L_5CFA                          ; 5A45   0204 02B3
        BGT     L_5D88                          ; 5A47   020E 033F

        MVII    #$0006, R0                      ; 5A49   02B8 0006
        SUB     G_017E, R0                      ; 5A4B   0300 017E
        CMP     G_017C, R0                      ; 5A4D   0340 017C
        BGT     L_5A57                          ; 5A4F   020E 0006

        MVII    #$0002, R5                      ; 5A51   02BD 0002
        MVO     R5,     G_0180                  ; 5A53   0245 0180
        B       L_5CFA                          ; 5A55   0200 02A3

L_5A57:
        PSHR    R4                              ; 5A57   0274
        MVII    #$0008, R0                      ; 5A58   02B8 0008

        JSR     R5,     X_RAND2                 ; 5A5A   0004 0114 029E

        ADDR    R0,     R4                      ; 5A5D   00C4
        MVI@    R4,     R0                      ; 5A5E   02A0
        PULR    R4                              ; 5A5F   02B4
L_5A60:
        MOVR    R0,     R1                      ; 5A60   0081
        ANDI    #$00FF, R1                      ; 5A61   03B9 00FF
        SUBR    R2,     R1                      ; 5A63   0111
        BPL     L_5A67                          ; 5A64   0203 0001

        NEGR    R1                              ; 5A66   0021
L_5A67:
        CMPI    #$0004, R1                      ; 5A67   0379 0004
        BLE     L_5A57                          ; 5A69   0226 0013

        CMPI    #$01FF, R0                      ; 5A6B   0378 01FF
        BGT     L_59D3                          ; 5A6D   022E 009B

        CMPI    #$00FF, R0                      ; 5A6F   0378 00FF
        BLT     L_5A77                          ; 5A71   0205 0004

        SDBD                                    ; 5A73   0001
        ADDI    #$0400, R0                      ; 5A74   02F8 0000 0004
L_5A77:
        ADDI    #$0100, R0                      ; 5A77   02F8 0100
        B       L_59D3                          ; 5A79   0220 00A7

L_5A7B:
        MVI     G_0182, R0                      ; 5A7B   0280 0182
        INCR    R0                              ; 5A7D   0008
        ANDI    #$0007, R0                      ; 5A7E   03B8 0007
        MVO     R0,     G_0182                  ; 5A80   0240 0182
        BNEQ    L_5A99                          ; 5A82   020C 0015

        MVI     G_035E, R0                      ; 5A84   0280 035E
        SARC    R0,     2                       ; 5A86   007C
        BOV     L_592E                          ; 5A87   0222 015A
        BC      L_592E                          ; 5A89   0221 015C

        MVI     G_0330, R1                      ; 5A8B   0281 0330
        SWAP    R1,     1                       ; 5A8D   0041
        ANDI    #$00FF, R1                      ; 5A8E   03B9 00FF
        CMPR    R1,     R3                      ; 5A90   014B
        BLE     L_592E                          ; 5A91   0226 0164

        MVII    #$0004, R1                      ; 5A93   02B9 0004
        MVO     R1,     G_0181                  ; 5A95   0241 0181
        B       L_5BC3                          ; 5A97   0200 012A

L_5A99:
        MVII    #$0004, R1                      ; 5A99   02B9 0004
        MVO     R1,     G_0323                  ; 5A9B   0241 0323
        B       L_5AE1                          ; 5A9D   0200 0042

L_5A9F:
        MVI     G_0185, R0                      ; 5A9F   0280 0185
        DECR    R0                              ; 5AA1   0010
        BMI     L_5AAE                          ; 5AA2   020B 000A

        MVO     R0,     G_0185                  ; 5AA4   0240 0185
        DECR    R0                              ; 5AA6   0010
        BNEQ    L_5A99                          ; 5AA7   022C 000F

        JSR     R5,     L_5C15                  ; 5AA9   0004 015C 0015

        B       L_5A99                          ; 5AAC   0220 0014

L_5AAE:
        MVII    #$0002, R0                      ; 5AAE   02B8 0002
        MVI     G_019E, R5                      ; 5AB0   0285 019E
        TSTR    R5                              ; 5AB2   00AD
        BEQ     L_5AB6                          ; 5AB3   0204 0001

        INCR    R0                              ; 5AB5   0008
L_5AB6:
        MVO     R0,     G_0180                  ; 5AB6   0240 0180
        MVI     G_0146, R1                      ; 5AB8   0281 0146
        CMPI    #$0084, R1                      ; 5ABA   0379 0084
        BNEQ    L_5C09                          ; 5ABC   020C 014B

        CLRR    R0                              ; 5ABE   01C0
        MVO     R0,     G_0146                  ; 5ABF   0240 0146

        JSR     R5,     L_6B43                  ; 5AC1   0004 0168 0343

        B       L_5C09                          ; 5AC4   0200 0143

L_5AC6:
        PSHR    R5                              ; 5AC6   0275
L_5AC7:
        MVII    #$0201, R4                      ; 5AC7   02BC 0201
L_5AC9:
        MVII    #$0020, R0                      ; 5AC9   02B8 0020
L_5ACB:
        PSHR    R2                              ; 5ACB   0272
        SWAP    R2,     1                       ; 5ACC   0042
        XORR    R3,     R2                      ; 5ACD   01DA
        MOVR    R0,     R3                      ; 5ACE   0083
        MVII    #$031D, R1                      ; 5ACF   02B9 031D

        JSR     R5,     .EXEC.9A8               ; 5AD1   0004 0118 01A8

        MVO     R4,     G_0322                  ; 5AD4   0244 0322
        MVO     R4,     G_032A                  ; 5AD6   0244 032A
        PULR    R2                              ; 5AD8   02B2
        CLRR    R0                              ; 5AD9   01C0
        CMP     G_0183, R2                      ; 5ADA   0342 0183
        BEQ     L_5AF7                          ; 5ADC   0204 0019
        BGT     L_5AE1                          ; 5ADE   020E 0001

        INCR    R0                              ; 5AE0   0008
L_5AE1:
        ANDI    #$0001, R0                      ; 5AE1   03B8 0001
        SWAP    R0,     1                       ; 5AE3   0040
        SLL     R0,     1                       ; 5AE4   0048
        MVI     G_031D, R1                      ; 5AE5   0281 031D
        SDBD                                    ; 5AE7   0001
        ANDI    #$3DFF, R1                      ; 5AE8   03B9 00FF 003D
        XORR    R0,     R1                      ; 5AEB   01C1
        MVO     R1,     G_031D                  ; 5AEC   0241 031D
        MVI     G_0325, R1                      ; 5AEE   0281 0325
        SDBD                                    ; 5AF0   0001
        ANDI    #$3DFF, R1                      ; 5AF1   03B9 00FF 003D
        XORR    R0,     R1                      ; 5AF4   01C1
        MVO     R1,     G_0325                  ; 5AF5   0241 0325
L_5AF7:
        PULR    R7                              ; 5AF7   02B7

L_5AF8:
        MVI     G_017A, R0                      ; 5AF8   0280 017A
        CMPI    #$0004, R0                      ; 5AFA   0378 0004
        BNEQ    L_5B06                          ; 5AFC   020C 0008

        CMPI    #$0016, R2                      ; 5AFE   037A 0016
        BGT     L_5B06                          ; 5B00   020E 0004

        CMPI    #$0012, R2                      ; 5B02   037A 0012
        BGE     L_5C5A                          ; 5B04   020D 0154

L_5B06:
        CLRR    R4                              ; 5B06   01E4
        MVI     G_0182, R0                      ; 5B07   0280 0182
        DECR    R0                              ; 5B09   0010
        BEQ     L_592E                          ; 5B0A   0224 01DD
        BPL     L_5B1B                          ; 5B0C   0203 000D

        MVII    #$0005, R1                      ; 5B0E   02B9 0005
        MVI     G_017A, R5                      ; 5B10   0285 017A
        CMPI    #$0006, R5                      ; 5B12   037D 0006
        BNEQ    L_5B17                          ; 5B14   020C 0001

        INCR    R1                              ; 5B16   0009
L_5B17:
        MVO     R1,     G_0182                  ; 5B17   0241 0182
        B       L_5B77                          ; 5B19   0200 005C

L_5B1B:
        MVO     R0,     G_0182                  ; 5B1B   0240 0182
        MVII    #$0004, R0                      ; 5B1D   02B8 0004
        MOVR    R0,     R1                      ; 5B1F   0081
        MVI     G_017A, R5                      ; 5B20   0285 017A
        CMPI    #$0006, R5                      ; 5B22   037D 0006
        BNEQ    L_5B32                          ; 5B24   020C 000C

        DECR    R0                              ; 5B26   0010
        CMPI    #$0040, R3                      ; 5B27   037B 0040
        BGT     L_5B2C                          ; 5B29   020E 0001

        NEGR    R0                              ; 5B2B   0020
L_5B2C:
        MVI     G_0182, R5                      ; 5B2C   0285 0182
        DECR    R5                              ; 5B2E   0015
        BEQ     L_5B32                          ; 5B2F   0204 0001

        DECR    R1                              ; 5B31   0011
L_5B32:
        NEGR    R1                              ; 5B32   0021
        CMPI    #$0050, R2                      ; 5B33   037A 0050
        BGT     L_5B6C                          ; 5B35   020E 0035

        NEGR    R0                              ; 5B37   0020
        B       L_5B6C                          ; 5B38   0200 0032

L_5B3A:
        MVII    #$0200, R4                      ; 5B3A   02BC 0200
        MVI     G_0182, R0                      ; 5B3C   0280 0182
        DECR    R0                              ; 5B3E   0010
        BEQ     L_592E                          ; 5B3F   0224 0212
        BPL     L_5B50                          ; 5B41   0203 000D

        MVII    #$0005, R1                      ; 5B43   02B9 0005
        MVI     G_017A, R5                      ; 5B45   0285 017A
        CMPI    #$0006, R5                      ; 5B47   037D 0006
        BNEQ    L_5B4C                          ; 5B49   020C 0001

        INCR    R1                              ; 5B4B   0009
L_5B4C:
        MVO     R1,     G_0182                  ; 5B4C   0241 0182
        B       L_5B77                          ; 5B4E   0200 0027

L_5B50:
        MVO     R0,     G_0182                  ; 5B50   0240 0182
        MVII    #$0004, R0                      ; 5B52   02B8 0004
        MOVR    R0,     R1                      ; 5B54   0081
        MVI     G_017A, R5                      ; 5B55   0285 017A
        CMPI    #$0006, R5                      ; 5B57   037D 0006
        BNEQ    L_5B67                          ; 5B59   020C 000C

        DECR    R0                              ; 5B5B   0010
        CMPI    #$0040, R3                      ; 5B5C   037B 0040
        BGE     L_5B61                          ; 5B5E   020D 0001

        NEGR    R0                              ; 5B60   0020
L_5B61:
        MVI     G_0182, R5                      ; 5B61   0285 0182
        DECR    R5                              ; 5B63   0015
        BEQ     L_5B67                          ; 5B64   0204 0001

        DECR    R1                              ; 5B66   0011
L_5B67:
        CMPI    #$0050, R2                      ; 5B67   037A 0050
        BLT     L_5B6C                          ; 5B69   0205 0001

        NEGR    R0                              ; 5B6B   0020
L_5B6C:
        ADDR    R0,     R2                      ; 5B6C   00C2
        ADDR    R1,     R3                      ; 5B6D   00CB
        SWAP    R2,     1                       ; 5B6E   0042
        MVO     R2,     G_031F                  ; 5B6F   0242 031F
        SWAP    R2,     1                       ; 5B71   0042
        NOP                                     ; 5B72   0034
        SWAP    R3,     1                       ; 5B73   0043
        MVO     R3,     G_0320                  ; 5B74   0243 0320
        SWAP    R3,     1                       ; 5B76   0043
L_5B77:
        MVII    #$0050, R5                      ; 5B77   02BD 0050
        MVI     G_017A, R0                      ; 5B79   0280 017A
        CMPI    #$0004, R0                      ; 5B7B   0378 0004
        BEQ     L_5B93                          ; 5B7D   0204 0014
        BGT     L_5B88                          ; 5B7F   020E 0007

        CMPR    R5,     R2                      ; 5B81   016A
        BGT     L_5B93                          ; 5B82   020E 000F

        XORI    #$0200, R4                      ; 5B84   03FC 0200
        B       L_5B93                          ; 5B86   0200 000B

L_5B88:
        CMPI    #$0040, R3                      ; 5B88   037B 0040
        BLE     L_5B8E                          ; 5B8A   0206 0002

        XORI    #$0200, R4                      ; 5B8C   03FC 0200
L_5B8E:
        CMPR    R5,     R2                      ; 5B8E   016A
        BLT     L_5B93                          ; 5B8F   0205 0002

        XORI    #$0200, R4                      ; 5B91   03FC 0200
L_5B93:
        MVI     G_031D, R1                      ; 5B93   0281 031D
        SDBD                                    ; 5B95   0001
        ANDI    #$3DFF, R1                      ; 5B96   03B9 00FF 003D
        XORR    R4,     R1                      ; 5B99   01E1
        MVO     R1,     G_031D                  ; 5B9A   0241 031D
        MVI     G_0325, R1                      ; 5B9C   0281 0325
        SDBD                                    ; 5B9E   0001
        ANDI    #$3DFF, R1                      ; 5B9F   03B9 00FF 003D
        XORR    R4,     R1                      ; 5BA2   01E1
        MVO     R1,     G_0325                  ; 5BA3   0241 0325
        MVII    #$0006, R0                      ; 5BA5   02B8 0006
        MVO     R0,     G_0323                  ; 5BA7   0240 0323
        PULR    R7                              ; 5BA9   02B7

L_5BAA:
        CLRR    R5                              ; 5BAA   01ED
        MVI     G_0182, R0                      ; 5BAB   0280 0182
        CMPI    #$0007, R0                      ; 5BAD   0378 0007
        BLE     L_5BC3                          ; 5BAF   0206 0012

        DECR    R0                              ; 5BB1   0010
        MVO     R0,     G_0182                  ; 5BB2   0240 0182
        CMPI    #$000B, R0                      ; 5BB4   0378 000B
        BLT     L_5BBD                          ; 5BB6   0205 0005

        INCR    R5                              ; 5BB8   000D
        MVII    #$0004, R1                      ; 5BB9   02B9 0004
        B       L_5BD6                          ; 5BBB   0200 0019

L_5BBD:
        CMPI    #$0008, R0                      ; 5BBD   0378 0008
        BEQ     L_592E                          ; 5BBF   0224 0292
        B       L_5BDA                          ; 5BC1   0200 0017

L_5BC3:
        MVI     G_0182, R0                      ; 5BC3   0280 0182
        DECR    R0                              ; 5BC5   0010
        ANDI    #$0007, R0                      ; 5BC6   03B8 0007
        CMPI    #$0001, R0                      ; 5BC8   0378 0001
        BEQ     L_592E                          ; 5BCA   0224 029D

        MVO     R0,     G_0182                  ; 5BCC   0240 0182
        MVII    #$0002, R1                      ; 5BCE   02B9 0002
        CMPI    #$0004, R0                      ; 5BD0   0378 0004
        BLE     L_5BD6                          ; 5BD2   0206 0002

        INCR    R5                              ; 5BD4   000D
        NEGR    R1                              ; 5BD5   0021
L_5BD6:
        ADDR    R1,     R3                      ; 5BD6   00CB
        SWAP    R3,     1                       ; 5BD7   0043
        MVO     R3,     G_0320                  ; 5BD8   0243 0320
L_5BDA:
        MVII    #$0001, R0                      ; 5BDA   02B8 0001
        MVO     R0,     G_0323                  ; 5BDC   0240 0323
        TSTR    R5                              ; 5BDE   00AD
        BEQ     L_5BE4                          ; 5BDF   0204 0003

        JSR     R5,     L_6C19                  ; 5BE1   0004 016C 0019

L_5BE4:
        PULR    R7                              ; 5BE4   02B7

L_5BE5:
        MVI     G_0182, R0                      ; 5BE5   0280 0182
        DECR    R0                              ; 5BE7   0010
        BMI     L_5C09                          ; 5BE8   020B 001F

        CLRR    R0                              ; 5BEA   01C0
        MVO     R0,     G_0182                  ; 5BEB   0240 0182
        SDBD                                    ; 5BED   0001
        MVII    #$5895, R4                      ; 5BEE   02BC 0095 0058
        MVO     R4,     G_031E                  ; 5BF1   0244 031E
        ADDI    #$000B, R4                      ; 5BF3   02FC 000B
        MVO     R4,     G_0326                  ; 5BF5   0244 0326
        MVII    #$000F, R4                      ; 5BF7   02BC 000F
        MVO     R4,     G_0329                  ; 5BF9   0244 0329
        MVII    #$03F0, R4                      ; 5BFB   02BC 03F0
        MVO     R4,     G_032A                  ; 5BFD   0244 032A
        MVO     R0,     G_0322                  ; 5BFF   0240 0322
        MVII    #$0010, R4                      ; 5C01   02BC 0010
        MVO     R4,     G_0323                  ; 5C03   0244 0323

        JSR     R5,     L_6CA3                  ; 5C05   0004 016C 00A3

        PULR    R7                              ; 5C08   02B7

L_5C09:
        JSR     R5,     L_5C15                  ; 5C09   0004 015C 0015

L_5C0C:
        MVII    #$0001, R1                      ; 5C0C   02B9 0001
        MVO     R1,     G_0181                  ; 5C0E   0241 0181
        CLRR    R0                              ; 5C10   01C0
        MVO     R0,     G_0182                  ; 5C11   0240 0182
        B       L_5A7B                          ; 5C13   0220 0199

L_5C15:
        SDBD                                    ; 5C15   0001
        MVII    #$5888, R4                      ; 5C16   02BC 0088 0058
        MVO     R4,     G_031E                  ; 5C19   0244 031E
        SDBD                                    ; 5C1B   0001
        MVII    #$5829, R4                      ; 5C1C   02BC 0029 0058
        MVO     R4,     G_0326                  ; 5C1F   0244 0326
        MVII    #$0005, R4                      ; 5C21   02BC 0005
        MVO     R4,     G_0329                  ; 5C23   0244 0329
        SDBD                                    ; 5C25   0001
        MVII    #$3846, R4                      ; 5C26   02BC 0046 0038
        MVO     R4,     G_0325                  ; 5C29   0244 0325
        MOVR    R5,     R7                      ; 5C2B   00AF

L_5C2C:
        MVI     G_0330, R1                      ; 5C2C   0281 0330
        DECLE   $0041,  $03B9,  $00FF,  $014B   ; 5C2E   0041 03B9 00FF 014B
        DECLE   $022C,  $01B8,  $0281,  $031D   ; 5C32   022C 01B8 0281 031D
        DECLE   $0001,  $03B9,  $00FF,  $003C   ; 5C36   0001 03B9 00FF 003C
        DECLE   $0241,  $031D,  $0281,  $0325   ; 5C3A   0241 031D 0281 0325
        DECLE   $0001                           ; 5C3E   0001
L_5C3F:
        ANDI    #$00FF, R1                      ; 5C3F   03B9 00FF
        RSWD    R4                              ; 5C41   003C
        MVO     R1,     G_0325                  ; 5C42   0241 0325
        ADDI    #$0008, R3                      ; 5C44   02FB 0008
        MVO     R3,     G_01B6                  ; 5C46   0243 01B6
        ADDI    #$0008, R2                      ; 5C48   02FA 0008
        MVO     R2,     G_01B2                  ; 5C4A   0242 01B2
        MVII    #$0002, R1                      ; 5C4C   02B9 0002
        MVO     R1,     G_01BE                  ; 5C4E   0241 01BE
        MVO     R1,     G_01AE                  ; 5C50   0241 01AE
        MVII    #$0018, R0                      ; 5C52   02B8 0018
        MVO     R0,     G_0323                  ; 5C54   0240 0323
        CLRR    R0                              ; 5C56   01C0
        MVO     R0,     G_0181                  ; 5C57   0240 0181
        PULR    R7                              ; 5C59   02B7

L_5C5A:
        CMPI    #$0040, R3                      ; 5C5A   037B 0040
        BEQ     L_5C79                          ; 5C5C   0204 001B
        BGT     L_5C6E                          ; 5C5E   020E 000E

        CMPI    #$0020, R3                      ; 5C60   037B 0020
        BNEQ    L_5C0C                          ; 5C62   022C 0057

        MVII    #$000F, R0                      ; 5C64   02B8 000F
        MVO     R0,     G_0182                  ; 5C66   0240 0182
        MVII    #$0004, R1                      ; 5C68   02B9 0004
        MVO     R1,     G_0181                  ; 5C6A   0241 0181
        B       L_5BAA                          ; 5C6C   0220 00C3

L_5C6E:
        MVII    #$0030, R3                      ; 5C6E   02BB 0030
        MVI     G_035E, R0                      ; 5C70   0280 035E
        SLLC    R0,     2                       ; 5C72   005C
        BC      L_5C7B                          ; 5C73   0201 0006

        MVII    #$0020, R3                      ; 5C75   02BB 0020
        B       L_5C7B                          ; 5C77   0200 0002

L_5C79:
        MVII    #$004A, R3                      ; 5C79   02BB 004A
L_5C7B:
        MVII    #$0014, R2                      ; 5C7B   02BA 0014
        CLRR    R4                              ; 5C7D   01E4
        B       L_5AC9                          ; 5C7E   0220 01B6

L_5C80:
        CMPI    #$0004, R5                      ; 5C80   037D 0004
        BLT     L_5D88                          ; 5C82   0205 0104

        MVI     G_0182, R0                      ; 5C84   0280 0182
        DECR    R0                              ; 5C86   0010
        BPL     L_5C8F                          ; 5C87   0203 0006

        MVII    #$0002, R0                      ; 5C89   02B8 0002
        MVO     R0,     G_0180                  ; 5C8B   0240 0180
        B       L_59E0                          ; 5C8D   0220 02AE

L_5C8F:
        MVO     R0,     G_0182                  ; 5C8F   0240 0182
        CMPI    #$0005, R0                      ; 5C91   0378 0005
        BEQ     L_5CAB                          ; 5C93   0204 0016
        BLT     L_5CB1                          ; 5C95   0205 001A

        MVII    #$0008, R2                      ; 5C97   02BA 0008
        MVI     G_032F, R0                      ; 5C99   0280 032F
        CMP     G_031F, R0                      ; 5C9B   0340 031F
        BNC     L_5CA1                          ; 5C9D   0209 0002

        MVII    #$0090, R2                      ; 5C9F   02BA 0090

L_5CA1:
        JSR     R5,     L_5C15                  ; 5CA1   0004 015C 0015

        MVII    #$003F, R0                      ; 5CA4   02B8 003F
        CLRR    R4                              ; 5CA6   01E4
        MVO     R4,     G_0185                  ; 5CA7   0244 0185
        B       L_5ACB                          ; 5CA9   0220 01DF

L_5CAB:
        MVII    #$0060, R3                      ; 5CAB   02BB 0060
        MVII    #$0050, R2                      ; 5CAD   02BA 0050
        B       L_5CA1                          ; 5CAF   0220 000F

L_5CB1:
        CMPI    #$0003, R0                      ; 5CB1   0378 0003
        BLT     L_5CD4                          ; 5CB3   0205 001F
        BGT     L_5CC6                          ; 5CB5   020E 000F

        MVI     G_019E, R5                      ; 5CB7   0285 019E
        TSTR    R5                              ; 5CB9   00AD
        BNEQ    L_5CCE                          ; 5CBA   020C 0012

        MVII    #$0050, R3                      ; 5CBC   02BB 0050

        JSR     R5,     L_5AC6                  ; 5CBE   0004 0158 02C6

        MVII    #$0005, R0                      ; 5CC1   02B8 0005
        MVO     R0,     G_0180                  ; 5CC3   0240 0180
        PULR    R7                              ; 5CC5   02B7

L_5CC6:
        MVII    #$0040, R0                      ; 5CC6   02B8 0040
        MVO     R0,     G_0323                  ; 5CC8   0240 0323

        JSR     R5,     L_6CBF                  ; 5CCA   0004 016C 00BF

        PULR    R7                              ; 5CCD   02B7

L_5CCE:
        MVO     R0,     G_0323                  ; 5CCE   0240 0323
        INCR    R0                              ; 5CD0   0008
        MVO     R0,     G_0182                  ; 5CD1   0240 0182
        PULR    R7                              ; 5CD3   02B7

L_5CD4:
        CMPI    #$0002, R0                      ; 5CD4   0378 0002
        BNEQ    L_5CDE                          ; 5CD6   020C 0006

        MVII    #$0050, R3                      ; 5CD8   02BB 0050
        SWAP    R3,     1                       ; 5CDA   0043
        MVO     R3,     G_0320                  ; 5CDB   0243 0320
        SWAP    R3,     1                       ; 5CDD   0043

L_5CDE:
        JSR     R5,     L_5CEA                  ; 5CDE   0004 015C 00EA

        CMPR    R3,     R0                      ; 5CE1   0158
        MVI@    R1,     R0                      ; 5CE2   0288
        MVI@    R1,     R0                      ; 5CE3   0288
        CMPR    R3,     R0                      ; 5CE4   0158
        MVI     .BTAB.80,R0                     ; 5CE5   0280 0280
        CMPR    R4,     R0                      ; 5CE7   0160
        MVI@    R1,     R4                      ; 5CE8   028C
        PSHR    R0                              ; 5CE9   0270
L_5CEA:
        ADDR    R0,     R5                      ; 5CEA   00C5
        MVI     G_017A, R0                      ; 5CEB   0280 017A
        CMPI    #$0004, R0                      ; 5CED   0378 0004
        BLT     L_5CF7                          ; 5CEF   0205 0006
        BEQ     L_5CF5                          ; 5CF1   0204 0002

        ADDI    #$0003, R5                      ; 5CF3   02FD 0003
L_5CF5:
        ADDI    #$0003, R5                      ; 5CF5   02FD 0003
L_5CF7:
        MVI@    R5,     R0                      ; 5CF7   02A8
        B       L_59D3                          ; 5CF8   0220 0326

L_5CFA:
        MVI     G_0330, R1                      ; 5CFA   0281 0330
        SWAP    R1,     1                       ; 5CFC   0041
        ANDI    #$00FF, R1                      ; 5CFD   03B9 00FF
        CMPI    #$0020, R1                      ; 5CFF   0379 0020
        BEQ     L_5A57                          ; 5D01   0224 02AB

        MVI     G_035E, R0                      ; 5D03   0280 035E
        SARC    R0,     2                       ; 5D05   007C
        ANDI    #$0003, R0                      ; 5D06   03B8 0003
        CMP     G_0162, R0                      ; 5D08   0340 0162
        BGT     L_5A57                          ; 5D0A   022E 02B4

        MOVR    R1,     R5                      ; 5D0C   008D
        MVI     G_032F, R1                      ; 5D0D   0281 032F
        SWAP    R1,     1                       ; 5D0F   0041
        ANDI    #$00FF, R1                      ; 5D10   03B9 00FF
        SUBR    R3,     R5                      ; 5D12   011D
        BEQ     L_5D45                          ; 5D13   0204 0030
        BPL     L_5D58                          ; 5D15   0203 0041

        NEGR    R5                              ; 5D17   0025
        CMPI    #$0010, R5                      ; 5D18   037D 0010
        BGT     L_5D33                          ; 5D1A   020E 0017

        SUBR    R2,     R1                      ; 5D1C   0111
        BPL     L_5D20                          ; 5D1D   0203 0001

        NEGR    R1                              ; 5D1F   0021
L_5D20:
        CMPI    #$0010, R1                      ; 5D20   0379 0010
        BGT     L_5D34                          ; 5D22   020E 0010

        MVI     G_035E, R0                      ; 5D24   0280 035E
        ANDI    #$0014, R0                      ; 5D26   03B8 0014
        BEQ     L_5D34                          ; 5D28   0204 000A

        MVII    #$0004, R1                      ; 5D2A   02B9 0004
        MVO     R1,     G_0181                  ; 5D2C   0241 0181
        CLRR    R0                              ; 5D2E   01C0
        MVO     R0,     G_0182                  ; 5D2F   0240 0182
        B       L_5BC3                          ; 5D31   0220 016F

L_5D33:
        MOVR    R1,     R2                      ; 5D33   008A
L_5D34:
        MVII    #$01FF, R1                      ; 5D34   02B9 01FF
        INCR    R4                              ; 5D36   000C
L_5D37:
        PSHR    R4                              ; 5D37   0274
        CMPI    #$0050, R2                      ; 5D38   037A 0050
        BLT     L_5D3E                          ; 5D3A   0205 0002

        ADDI    #$0004, R4                      ; 5D3C   02FC 0004
L_5D3E:
        MVI@    R4,     R0                      ; 5D3E   02A0
        CMPR    R1,     R0                      ; 5D3F   0148
        BLT     L_5D3E                          ; 5D40   0225 0003

        PULR    R4                              ; 5D42   02B4
        B       L_5A60                          ; 5D43   0220 02E4

L_5D45:
        SUBR    R2,     R1                      ; 5D45   0111
        BPL     L_5D4C                          ; 5D46   0203 0004

        CLRR    R1                              ; 5D48   01C9
        PSHR    R4                              ; 5D49   0274
        B       L_5D3E                          ; 5D4A   0220 000D

L_5D4C:
        INCR    R4                              ; 5D4C   000C
        MVI     G_017A, R0                      ; 5D4D   0280 017A
        CMPI    #$0004, R0                      ; 5D4F   0378 0004
        BEQ     L_5D54                          ; 5D51   0204 0001

        INCR    R4                              ; 5D53   000C
L_5D54:
        MVII    #$00FF, R1                      ; 5D54   02B9 00FF
        B       L_5D37                          ; 5D56   0220 0020

L_5D58:
        MVI     G_0193, R0                      ; 5D58   0280 0193
        SUBR    R2,     R1                      ; 5D5A   0111
        BMI     L_5D60                          ; 5D5B   020B 0003

        ADDI    #$0004, R4                      ; 5D5D   02FC 0004
        INCR    R7                              ; 5D5F   000F

L_5D60:
        NEGR    R1                              ; 5D60   0021
L_5D61:
        CMPI    #$0020, R1                      ; 5D61   0379 0020
        BGT     L_5D83                          ; 5D63   020E 001E

        MVII    #$0013, R0                      ; 5D65   02B8 0013
        CMPI    #$0010, R5                      ; 5D67   037D 0010
        BGT     L_5D7B                          ; 5D69   020E 0010

        MVII    #$000F, R0                      ; 5D6B   02B8 000F
        CMPI    #$0010, R1                      ; 5D6D   0379 0010
        BGT     L_5D7B                          ; 5D6F   020E 000A

        MVII    #$0005, R0                      ; 5D71   02B8 0005
        MVO     R0,     G_0181                  ; 5D73   0240 0181
        MVII    #$0008, R0                      ; 5D75   02B8 0008
        MVO     R0,     G_0182                  ; 5D77   0240 0182
        B       L_5BE5                          ; 5D79   0220 0195

L_5D7B:
        MVII    #$0004, R1                      ; 5D7B   02B9 0004
        MVO     R1,     G_0181                  ; 5D7D   0241 0181
        MVO     R0,     G_0182                  ; 5D7F   0240 0182
        B       L_5BAA                          ; 5D81   0220 01D8

L_5D83:
        MVII    #$02FF, R1                      ; 5D83   02B9 02FF
        PSHR    R4                              ; 5D85   0274
        B       L_5D3E                          ; 5D86   0220 0049

L_5D88:
        MVI     G_0185, R0                      ; 5D88   0280 0185
        TSTR    R0                              ; 5D8A   0080
        BNEQ    L_5A9F                          ; 5D8B   022C 02ED

        MVI     G_019E, R0                      ; 5D8D   0280 019E
        TSTR    R0                              ; 5D8F   0080
        BNEQ    L_5D98                          ; 5D90   020C 0006

        MVII    #$0002, R0                      ; 5D92   02B8 0002
        MVO     R0,     G_0180                  ; 5D94   0240 0180
        B       L_5CFA                          ; 5D96   0220 009D

L_5D98:
        ANDI    #$00F8, R2                      ; 5D98   03BA 00F8
        CMPI    #$0058, R2                      ; 5D9A   037A 0058
        BLT     L_5DB1                          ; 5D9C   0205 0013

        CMPI    #$0068, R2                      ; 5D9E   037A 0068
        BGT     L_5DB1                          ; 5DA0   020E 000F

        MVI     G_032F, R0                      ; 5DA2   0280 032F
        SWAP    R0,     1                       ; 5DA4   0040
        ANDI    #$00FF, R0                      ; 5DA5   03B8 00FF
        MVII    #$01FF, R1                      ; 5DA7   02B9 01FF
        PSHR    R4                              ; 5DA9   0274
        CMPR    R2,     R0                      ; 5DAA   0150
        BGT     L_5D3E                          ; 5DAB   022E 006E

        ADDI    #$0004, R4                      ; 5DAD   02FC 0004
        B       L_5D3E                          ; 5DAF   0220 0072

L_5DB1:
        MVII    #$0160, R0                      ; 5DB1   02B8 0160
        J       L_59D3                          ; 5DB3   0004 0358 01D3

        PSHR    R5                              ; 5DB6   0275
        MVI     G_0180, R0                      ; 5DB7   0280 0180
        CMPI    #$0004, R0                      ; 5DB9   0378 0004
        BEQ     L_5DD0                          ; 5DBB   0204 0013

        MVI     G_0190, R0                      ; 5DBD   0280 0190
        TSTR    R0                              ; 5DBF   0080
        BNEQ    L_5DD0                          ; 5DC0   020C 000E

        MVI     G_019E, R0                      ; 5DC2   0280 019E
        TSTR    R0                              ; 5DC4   0080
        BNEQ    L_5DD1                          ; 5DC5   020C 000A

        MVI     G_0185, R0                      ; 5DC7   0280 0185
        TSTR    R0                              ; 5DC9   0080
        BNEQ    L_5DD0                          ; 5DCA   020C 0004

        MVII    #$0003, R0                      ; 5DCC   02B8 0003
        MVO     R0,     G_0190                  ; 5DCE   0240 0190
L_5DD0:
        PULR    R7                              ; 5DD0   02B7

L_5DD1:
        MVII    #$0004, R0                      ; 5DD1   02B8 0004
        MVO     R0,     G_0180                  ; 5DD3   0240 0180
        MVII    #$0007, R0                      ; 5DD5   02B8 0007
        MVO     R0,     G_0182                  ; 5DD7   0240 0182
        MVII    #$0001, R0                      ; 5DD9   02B8 0001
        MVO     R0,     G_0323                  ; 5DDB   0240 0323
        DECR    R0                              ; 5DDD   0010
        MVO     R0,     G_0181                  ; 5DDE   0240 0181
        MVII    #$001E, R0                      ; 5DE0   02B8 001E

        JSR     R5,     L_5FAC                  ; 5DE2   0004 015C 03AC
        JSR     R5,     L_6C8B                  ; 5DE5   0004 016C 008B

        PULR    R7                              ; 5DE8   02B7

        PSHR    R5                              ; 5DE9   0275
        MVI     G_017A, R0                      ; 5DEA   0280 017A
        CMPI    #$0002, R0                      ; 5DEC   0378 0002
        BNEQ    L_5E7F                          ; 5DEE   020C 008F

        MVI     G_0185, R0                      ; 5DF0   0280 0185
        TSTR    R0                              ; 5DF2   0080
        BNEQ    L_5E7F                          ; 5DF3   020C 008A

        MVI     G_019A, R0                      ; 5DF5   0280 019A
        TSTR    R0                              ; 5DF7   0080
        BEQ     L_5E7F                          ; 5DF8   0204 0085

        MVII    #$031D, R1                      ; 5DFA   02B9 031D

        JSR     R5,     .EXEC.777               ; 5DFC   0004 0114 0377

        CMPI    #$0044, R2                      ; 5DFF   037A 0044
        BLT     L_5E7F                          ; 5E01   0205 007C

        CMPI    #$0057, R2                      ; 5E03   037A 0057
        BGT     L_5E7F                          ; 5E05   020E 0078

        MVI     G_0199, R0                      ; 5E07   0280 0199
        ADDI    #$0009, R3                      ; 5E09   02FB 0009
        ANDI    #$00F0, R3                      ; 5E0B   03BB 00F0
        CMPI    #$0040, R3                      ; 5E0D   037B 0040
        BLT     L_5E1D                          ; 5E0F   0205 000C
        BGT     L_5E27                          ; 5E11   020E 0014

        CMPI    #$00A9, R0                      ; 5E13   0378 00A9
        BEQ     L_5E33                          ; 5E15   0204 001C

        CMPI    #$0095, R0                      ; 5E17   0378 0095
        BNEQ    L_5E7F                          ; 5E19   020C 0064
        B       L_5E33                          ; 5E1B   0200 0016

L_5E1D:
        CMPI    #$0081, R0                      ; 5E1D   0378 0081
        BEQ     L_5E33                          ; 5E1F   0204 0012

        CMPI    #$006D, R0                      ; 5E21   0378 006D
        BNEQ    L_5E7F                          ; 5E23   020C 005A
        B       L_5E33                          ; 5E25   0200 000C

L_5E27:
        CMPI    #$0050, R3                      ; 5E27   037B 0050
        BNEQ    L_5E7F                          ; 5E29   020C 0054

        CMPI    #$00D1, R0                      ; 5E2B   0378 00D1
        BEQ     L_5E33                          ; 5E2D   0204 0004

        CMPI    #$00BD, R0                      ; 5E2F   0378 00BD
        BNEQ    L_5E7F                          ; 5E31   020C 004C

L_5E33:
        SDBD                                    ; 5E33   0001
        MVII    #$08A6, R0                      ; 5E34   02B8 00A6 0008
        MVO     R0,     .BTAB.95                ; 5E37   0240 0295
        CLRR    R0                              ; 5E39   01C0
        MVO     R0,     .BTAB.59                ; 5E3A   0240 0259
        MVO     R0,     .BTAB.6D                ; 5E3C   0240 026D
        NOP                                     ; 5E3E   0034
        MVO     R0,     .BTAB.81                ; 5E3F   0240 0281
        MVO     R0,     .BTAB.A9                ; 5E41   0240 02A9
        MVII    #$02FB, R0                      ; 5E43   02B8 02FB
        MVO     R0,     .BTAB.BD                ; 5E45   0240 02BD
        MVO     R0,     .BTAB.D1                ; 5E47   0240 02D1
        SDBD                                    ; 5E49   0001
        MVII    #$58AB, R0                      ; 5E4A   02B8 00AB 0058
        MVO     R0,     G_0326                  ; 5E4D   0240 0326
        MVII    #$000A, R0                      ; 5E4F   02B8 000A
        CMPI    #$0040, R3                      ; 5E51   037B 0040
        BLT     L_5E5B                          ; 5E53   0205 0006

        MVII    #$0014, R0                      ; 5E55   02B8 0014
        BEQ     L_5E5B                          ; 5E57   0204 0002

        MVII    #$0028, R0                      ; 5E59   02B8 0028
L_5E5B:
        SWAP    R3,     1                       ; 5E5B   0043
        MVO     R3,     G_0320                  ; 5E5C   0243 0320

        JSR     R5,     L_5FAC                  ; 5E5E   0004 015C 03AC

        MVI     G_0325, R0                      ; 5E61   0280 0325
        XORI    #$0001, R0                      ; 5E63   03F8 0001
        MVO     R0,     G_0325                  ; 5E65   0240 0325
        CLRR    R0                              ; 5E67   01C0
        MVO     R0,     G_032A                  ; 5E68   0240 032A
        MVO     R0,     G_0321                  ; 5E6A   0240 0321
        NOP                                     ; 5E6C   0034
        MVO     R0,     G_0329                  ; 5E6D   0240 0329
        MVO     R0,     G_019A                  ; 5E6F   0240 019A
        INCR    R0                              ; 5E71   0008
        MVO     R0,     G_0323                  ; 5E72   0240 0323
        MVII    #$0007, R0                      ; 5E74   02B8 0007
        MVO     R0,     G_0181                  ; 5E76   0240 0181
        MVII    #$0027, R0                      ; 5E78   02B8 0027
        MVO     R0,     G_0185                  ; 5E7A   0240 0185

        JSR     R5,     L_6C7A                  ; 5E7C   0004 016C 007A

L_5E7F:
        PULR    R7                              ; 5E7F   02B7

        PSHR    R5                              ; 5E80   0275
        MVI     G_011B, R0                      ; 5E81   0280 011B

        JSR     R5,     .EXEC.772               ; 5E83   0004 0114 0372

        MVI     G_019E, R5                      ; 5E86   0285 019E
        TSTR    R5                              ; 5E88   00AD
        BEQ     L_5E93                          ; 5E89   0204 0008

        ADDI    #$0006, R1                      ; 5E8B   02F9 0006
        MVO@    R0,     R1                      ; 5E8D   0248
        SUBI    #$0002, R1                      ; 5E8E   0339 0002
        CLRR    R0                              ; 5E90   01C0
        MVO@    R0,     R1                      ; 5E91   0248
        PULR    R7                              ; 5E92   02B7

L_5E93:
        CMPI    #$005C, R3                      ; 5E93   037B 005C
        BGE     L_5ECD                          ; 5E95   020D 0036

        MVI     G_035E, R0                      ; 5E97   0280 035E
        ANDI    #$00EF, R0                      ; 5E99   03B8 00EF
        ADDI    #$0020, R0                      ; 5E9B   02F8 0020
        MVI     G_017A, R4                      ; 5E9D   0284 017A
        CMPI    #$0004, R4                      ; 5E9F   037C 0004
        MVII    #$0010, R4                      ; 5EA1   02BC 0010
        BNEQ    L_5EAC                          ; 5EA3   020C 0007

        MVII    #$0020, R4                      ; 5EA5   02BC 0020
        CMPI    #$0030, R3                      ; 5EA7   037B 0030
        BGT     L_5EAC                          ; 5EA9   020E 0001

        SARC    R0,     1                       ; 5EAB   0078
L_5EAC:
        SARC    R0,     2                       ; 5EAC   007C
        BC      L_5EB2                          ; 5EAD   0201 0003

L_5EAF:
        NEGR    R0                              ; 5EAF   0020
        BMI     L_5EB3                          ; 5EB0   020B 0001

L_5EB2:
        DECR    R0                              ; 5EB2   0010
L_5EB3:
        MOVR    R2,     R5                      ; 5EB3   0095
        ADDR    R0,     R5                      ; 5EB4   00C5
        CMPI    #$0098, R5                      ; 5EB5   037D 0098
        BGT     L_5EAF                          ; 5EB7   022E 0009

        CMPR    R4,     R5                      ; 5EB9   0165
        BLT     L_5EAF                          ; 5EBA   0225 000C

        MOVR    R5,     R2                      ; 5EBC   00AA
        ADDI    #$0008, R3                      ; 5EBD   02FB 0008
        CMPI    #$005D, R3                      ; 5EBF   037B 005D
        BLT     L_5EC5                          ; 5EC1   0205 0002

        MVII    #$005D, R3                      ; 5EC3   02BB 005D
L_5EC5:
        SWAP    R2,     1                       ; 5EC5   0042
        XORR    R3,     R2                      ; 5EC6   01DA
        MVII    #$0010, R3                      ; 5EC7   02BB 0010

        JSR     R5,     .EXEC.9A8               ; 5EC9   0004 0118 01A8

        PULR    R7                              ; 5ECC   02B7

L_5ECD:
        MVII    #$01A4, R2                      ; 5ECD   02BA 01A4
        ADDR    R0,     R2                      ; 5ECF   00C2
        MVII    #$00FF, R0                      ; 5ED0   02B8 00FF
        MVO@    R0,     R2                      ; 5ED2   0250
        CLRR    R0                              ; 5ED3   01C0
        ADDI    #$0004, R1                      ; 5ED4   02F9 0004
        MVO@    R0,     R1                      ; 5ED6   0248
        PULR    R7                              ; 5ED7   02B7

        PSHR    R5                              ; 5ED8   0275

        JSR     R5,     L_5F75                  ; 5ED9   0004 015C 0375

        MVI     G_011B, R0                      ; 5EDC   0280 011B
        SUBI    #$0004, R0                      ; 5EDE   0338 0004
        INCR    R7                              ; 5EE0   000F

L_5EE1:
        PSHR    R5                              ; 5EE1   0275
L_5EE2:
        MVII    #$01A8, R1                      ; 5EE2   02B9 01A8
        CLRR    R2                              ; 5EE4   01D2
        ADDR    R0,     R1                      ; 5EE5   00C1
        MVO@    R2,     R1                      ; 5EE6   024A

        JSR     R5,     X_SET_BIT               ; 5EE7   0004 0114 02DB

        CMPR    R7,     R3                      ; 5EEA   017B
        MVI     G_0330, R1                      ; 5EEB   0281 0330
        SWAP    R1,     1                       ; 5EED   0041
        ANDI    #$00F0, R1                      ; 5EEE   03B9 00F0
        SLR     R1,     2                       ; 5EF0   0065
        SLR     R1,     2                       ; 5EF1   0065
        MVII    #$0005, R0                      ; 5EF2   02B8 0005
        SUBI    #$0002, R1                      ; 5EF4   0339 0002
        BEQ     L_5EFA                          ; 5EF6   0204 0002

        INCR    R1                              ; 5EF8   0009
        SUBR    R1,     R0                      ; 5EF9   0108
L_5EFA:
        MVI     G_019E, R1                      ; 5EFA   0281 019E
        TSTR    R1                              ; 5EFC   0089
        BEQ     L_5F00                          ; 5EFD   0204 0001

        SLL     R0,     1                       ; 5EFF   0048

L_5F00:
        JSR     R5,     L_5FAC                  ; 5F00   0004 015C 03AC
        JSR     R5,     L_6B91                  ; 5F03   0004 0168 0391

        INCR    R7                              ; 5F06   000F

L_5F07:
        PSHR    R5                              ; 5F07   0275
L_5F08:
        MVI     G_017C, R1                      ; 5F08   0281 017C
        INCR    R1                              ; 5F0A   0009
        MVO     R1,     G_017C                  ; 5F0B   0241 017C
        MVI     G_017A, R0                      ; 5F0D   0280 017A
        CMPI    #$0004, R0                      ; 5F0F   0378 0004
        BEQ     L_5F56                          ; 5F11   0204 0043
        BGT     L_5F63                          ; 5F13   020E 004E

        JSR     R4,     L_5F40                  ; 5F15   0004 005C 0340
        DECLE   $0215,  $00C0,  $0229,  $0003   ; 5F18   0215 00C0 0229 0003
        DECLE   $0229,  $00C0,  $0215,  $0300   ; 5F1C   0229 00C0 0215 0300
        DECLE   $0229,  $0018,  $0229,  $0300   ; 5F20   0229 0018 0229 0300
        DECLE   $0216,  $00C0,  $022A,  $00C0   ; 5F24   0216 00C0 022A 00C0
        DECLE   $0216,  $0300,  $022A,  $0018   ; 5F28   0216 0300 022A 0018
        DECLE   $022A,  $0300,  $0217,  $00C0   ; 5F2C   022A 0300 0217 00C0
        DECLE   $0217,  $0300,  $022B,  $0018   ; 5F30   0217 0300 022B 0018
        DECLE   $022B,  $0300,  $0218,  $00C0   ; 5F34   022B 0300 0218 00C0
        DECLE   $022C,  $00C0,  $0218           ; 5F38   022C 00C0 0218

        SUB     .BTAB.2C,R0                     ; 5F3B   0300 022C
        COMR    R0                              ; 5F3D   0018
        BNEQ    L_5C3F                          ; 5F3E   022C 0300

L_5F40:
        ADD     G_017C, R4                      ; 5F40   02C4 017C
        ADD     G_017C, R4                      ; 5F42   02C4 017C
        SUBI    #$0002, R4                      ; 5F44   033C 0002
        MVI@    R4,     R1                      ; 5F46   02A1
        MVI@    R4,     R2                      ; 5F47   02A2
        CMPI    #$0300, R2                      ; 5F48   037A 0300
        BNEQ    L_5F4D                          ; 5F4A   020C 0001

        SLL     R2,     1                       ; 5F4C   004A
L_5F4D:
        XOR@    R1,     R2                      ; 5F4D   03CA
        MVO@    R2,     R1                      ; 5F4E   024A
        MVI     G_017C, R0                      ; 5F4F   0280 017C
        CMPI    #$0014, R0                      ; 5F51   0378 0014
        BGE     L_5F6E                          ; 5F53   020D 0019
L_5F55:
        PULR    R7                              ; 5F55   02B7

L_5F56:
        CMPI    #$0010, R1                      ; 5F56   0379 0010
        BGT     L_5F68                          ; 5F58   020E 000E

        ADDI    #$0214, R1                      ; 5F5A   02F9 0214
        MVII    #$0032, R2                      ; 5F5C   02BA 0032
        SWAP    R2,     1                       ; 5F5E   0042
        XOR@    R1,     R2                      ; 5F5F   03CA
        MVO@    R2,     R1                      ; 5F60   024A
        B       L_5F68                          ; 5F61   0200 0005

L_5F63:
        MVI     G_017D, R0                      ; 5F63   0280 017D
        INCR    R0                              ; 5F65   0008
        MVO     R1,     G_017D                  ; 5F66   0241 017D
L_5F68:
        MVI     G_017C, R1                      ; 5F68   0281 017C
        CMPI    #$0010, R1                      ; 5F6A   0379 0010
        BLT     L_5F55                          ; 5F6C   0225 0018

L_5F6E:
        MVII    #$0001, R0                      ; 5F6E   02B8 0001
        MVO     R0,     G_0102                  ; 5F70   0240 0102
        J       L_641F                          ; 5F72   0004 0364 001F

L_5F75:
        PSHR    R5                              ; 5F75   0275
        MVI     G_011B, R0                      ; 5F76   0280 011B

        JSR     R5,     .EXEC.76C               ; 5F78   0004 0114 036C
        JSR     R5,     .EXEC.7AE               ; 5F7B   0004 0114 03AE

        PULR    R7                              ; 5F7E   02B7

        MVII    #$034D, R1                      ; 5F7F   02B9 034D
        B       L_5F85                          ; 5F81   0200 0002

        MVII    #$0355, R1                      ; 5F83   02B9 0355
L_5F85:
        PSHR    R5                              ; 5F85   0275
        PSHR    R1                              ; 5F86   0271

        JSR     R5,     .EXEC.777               ; 5F87   0004 0114 0377

        PSHR    R2                              ; 5F8A   0272
        MVII    #$032D, R1                      ; 5F8B   02B9 032D

        JSR     R5,     .EXEC.777               ; 5F8D   0004 0114 0377

        MVI@    R1,     R1                      ; 5F90   0289
        ANDI    #$0200, R1                      ; 5F91   03B9 0200
        BEQ     L_5F9B                          ; 5F93   0204 0006

        SUB@    R6,     R2                      ; 5F95   0332
        PULR    R1                              ; 5F96   02B1
        BMI     L_5FA9                          ; 5F97   020B 0010
        B       L_5FA0                          ; 5F99   0200 0005

L_5F9B:
        PULR    R3                              ; 5F9B   02B3
        PULR    R1                              ; 5F9C   02B1
        SUBR    R2,     R3                      ; 5F9D   0113
        BMI     L_5FA9                          ; 5F9E   020B 0009

L_5FA0:
        JSR     R5,     .EXEC.7AE               ; 5FA0   0004 0114 03AE
        JSR     R5,     L_5FAA                  ; 5FA3   0004 015C 03AA
        JSR     R5,     L_6C54                  ; 5FA6   0004 016C 0054

L_5FA9:
        PULR    R7                              ; 5FA9   02B7

L_5FAA:
        MVII    #$0001, R0                      ; 5FAA   02B8 0001
L_5FAC:
        PSHR    R5                              ; 5FAC   0275
L_5FAD:
        MVI     G_0165, R2                      ; 5FAD   0282 0165
        MVII    #$0168, R3                      ; 5FAF   02BB 0168
        ADDR    R2,     R3                      ; 5FB1   00D3
        ADDR    R2,     R3                      ; 5FB2   00D3
        ADDR    R2,     R3                      ; 5FB3   00D3
        ADDI    #$0163, R2                      ; 5FB4   02FA 0163
        MVII    #$0064, R4                      ; 5FB6   02BC 0064
        ADD@    R3,     R0                      ; 5FB8   02D8
        CLRR    R1                              ; 5FB9   01C9
L_5FBA:
        CMPR    R4,     R0                      ; 5FBA   0160
        BLT     L_5FC1                          ; 5FBB   0205 0004

        SUBR    R4,     R0                      ; 5FBD   0120
        INCR    R1                              ; 5FBE   0009
        B       L_5FBA                          ; 5FBF   0220 0006

L_5FC1:
        MVO@    R0,     R3                      ; 5FC1   0258
        PSHR    R0                              ; 5FC2   0270
        INCR    R3                              ; 5FC3   000B
        ADD@    R3,     R1                      ; 5FC4   02D9
        MOVR    R1,     R0                      ; 5FC5   0088
        CLRR    R1                              ; 5FC6   01C9
L_5FC7:
        CMPR    R4,     R0                      ; 5FC7   0160
        BLT     L_5FCE                          ; 5FC8   0205 0004

        INCR    R1                              ; 5FCA   0009
        SUBR    R4,     R0                      ; 5FCB   0120
        B       L_5FC7                          ; 5FCC   0220 0006

L_5FCE:
        MVO@    R0,     R3                      ; 5FCE   0258
        CMPI    #$0003, R0                      ; 5FCF   0378 0003
        BNEQ    L_5FE0                          ; 5FD1   020C 000D

        CLRR    R1                              ; 5FD3   01C9
        SDBD                                    ; 5FD4   0001
        ADD@    R2,     R1                      ; 5FD5   02D1
        BNEQ    L_5FE0                          ; 5FD6   020C 0008

        INCR    R1                              ; 5FD8   0009
        MVO@    R1,     R2                      ; 5FD9   0251
        MVII    #$016E, R2                      ; 5FDA   02BA 016E
        ADD     G_0165, R2                      ; 5FDC   02C2 0165
        ADD@    R2,     R1                      ; 5FDE   02D1
        MVO@    R1,     R2                      ; 5FDF   0251
L_5FE0:
        MVII    #$0003, R3                      ; 5FE0   02BB 0003
        TSTR    R0                              ; 5FE2   0080
        BEQ     L_5FEC                          ; 5FE3   0204 0007

        MVII    #$0002, R1                      ; 5FE5   02B9 0002
        MVII    #$0205, R4                      ; 5FE7   02BC 0205

        JSR     R5,     X_PRNUM_RGT             ; 5FE9   0004 0118 00C5

L_5FEC:
        PULR    R0                              ; 5FEC   02B0
        MVII    #$0002, R1                      ; 5FED   02B9 0002
        MVII    #$0207, R4                      ; 5FEF   02BC 0207

        JSR     R5,     X_PRNUM_ZRO             ; 5FF1   0004 0118 00AD

        MVII    #$0083, R1                      ; 5FF4   02B9 0083
        MVO     R1,     .BTAB.09                ; 5FF6   0241 0209
        MVO     R1,     .BTAB.0A                ; 5FF8   0241 020A
        MVII    #$01AB, R2                      ; 5FFA   02BA 01AB
        MVO     R2,     .BTAB.0D                ; 5FFC   0242 020D
        MVII    #$0183, R2                      ; 5FFE   02BA 0183
        MVO     R2,     .BTAB.0E                ; 6000   0242 020E
        MVII    #$008B, R1                      ; 6002   02B9 008B
        MVI     G_0165, R0                      ; 6004   0280 0165
        TSTR    R0                              ; 6006   0080
        BEQ     L_600D                          ; 6007   0204 0004

        MVII    #$0093, R1                      ; 6009   02B9 0093
        MVII    #$0002, R3                      ; 600B   02BB 0002
L_600D:
        MVO     R1,     .BTAB.0C                ; 600D   0241 020C
        MVII    #$0001, R1                      ; 600F   02B9 0001
        MVI     G_016E, R0                      ; 6011   0280 016E
        MVII    #$0201, R4                      ; 6013   02BC 0201

        JSR     R5,     X_PRNUM_RGT             ; 6015   0004 0118 00C5

        MVII    #$0001, R1                      ; 6018   02B9 0001
        XORR    R1,     R3                      ; 601A   01CB
        MVII    #$0211, R4                      ; 601B   02BC 0211
        MVI     G_016F, R0                      ; 601D   0280 016F

        JSR     R5,     X_PRNUM_RGT             ; 601F   0004 0118 00C5

        PULR    R7                              ; 6022   02B7

        DECLE   $0120,  $0008,  $0198,  $0230   ; 6023   0120 0008 0198 0230
        DECLE   $0008,  $0250,  $0198,  $0340   ; 6027   0008 0250 0198 0340
        DECLE   $0008,  $0054,  $014C,  $0198   ; 602B   0008 0054 014C 0198
        DECLE   $03FF,  $0020,  $0234,  $0030   ; 602F   03FF 0020 0234 0030
        DECLE   $0190,  $0240,  $0234,  $026C   ; 6033   0190 0240 0234 026C
        DECLE   $0190,  $03FF,  $0120,  $0128   ; 6037   0190 03FF 0120 0128
        DECLE   $0081,  $0130,  $0118,  $0081   ; 603B   0081 0130 0118 0081
        DECLE   $0140,  $001D,  $017F,  $03FF   ; 603F   0140 001D 017F 03FF
        DECLE   $0130,  $0118,  $0088,  $0140   ; 6043   0130 0118 0088 0140
        DECLE   $0118,  $0088,  $0350,  $0118   ; 6047   0118 0088 0350 0118
        DECLE   $003C,  $0164,  $0088,  $03FF   ; 604B   003C 0164 0088 03FF
        DECLE   $0030,  $0234,  $0040,  $0080   ; 604F   0030 0234 0040 0080
        DECLE   $0250,  $0234,  $026C,  $0080   ; 6053   0250 0234 026C 0080
        DECLE   $03FF,  $0130,  $0018,  $0190   ; 6057   03FF 0130 0018 0190
        DECLE   $0140,  $0008,  $0190,  $0150   ; 605B   0140 0008 0190 0150
        DECLE   $0130,  $0070,  $03FF           ; 605F   0130 0070 03FF

        NEGR    R0                              ; 6062   0020
        B       L_6193                          ; 6063   0200 012E

        DECLE   $0020,  $0172,  $02A3,  $0030   ; 6065   0020 0172 02A3 0030
        DECLE   $0004,  $009C,  $0040,  $0004   ; 6069   0004 009C 0040 0004
        DECLE   $009C,  $0050,  $0004,  $009C   ; 606D   009C 0050 0004 009C
        DECLE   $03FF                           ; 6071   03FF

        NEGR    R0                              ; 6072   0020
        SUBR    R2,     R2                      ; 6073   0112
        CMPR    R2,     R6                      ; 6074   0156
        GSWD    R0                              ; 6075   0030
        B       L_61BE                          ; 6076   0200 0146

        DECLE   $0030,  $0152,  $02A3,  $0040   ; 6078   0030 0152 02A3 0040
        DECLE   $0318,  $009C,  $0050,  $0020   ; 607C   0318 009C 0050 0020
        DECLE   $009C,  $03FF,  $0020,  $011A   ; 6080   009C 03FF 0020 011A
        DECLE   $0345,  $0020,  $0363,  $018E   ; 6084   0345 0020 0363 018E
        DECLE   $0030,  $0112,  $0157,  $0030   ; 6088   0030 0112 0157 0030
        DECLE   $0159,  $0196,  $0040,  $0006   ; 608C   0159 0196 0040 0006
        DECLE   $012E,  $0040,  $0132,  $0098   ; 6090   012E 0040 0132 0098
        DECLE   $0050,  $0010,  $0090,  $03FF   ; 6094   0050 0010 0090 03FF
L_6098:
        PSHR    R5                              ; 6098   0275

        JSR     R4,     L_60A4                  ; 6099   0004 0060 00A4

        SLR     R2,     1                       ; 609C   0062
        SLR     R0,     1                       ; 609D   0060
        SLR     R2,     1                       ; 609E   0062
        SLR     R0,     1                       ; 609F   0060
        RRC     R2,     1                       ; 60A0   0072
        SLR     R0,     1                       ; 60A1   0060
        MOVR    R0,     R2                      ; 60A2   0082
        SLR     R0,     1                       ; 60A3   0060
L_60A4:
        ADD     G_017A, R4                      ; 60A4   02C4 017A
        SDBD                                    ; 60A6   0001
        MVI@    R4,     R5                      ; 60A7   02A5
L_60A8:
        MVI@    R5,     R4                      ; 60A8   02AC
        CMPI    #$03FF, R4                      ; 60A9   037C 03FF
        BEQ     L_60E5                          ; 60AB   0204 0038

        MVO     R4,     G_017F                  ; 60AD   0244 017F
        SUBR    R3,     R4                      ; 60AF   011C
        BPL     L_60B3                          ; 60B0   0203 0001

        NEGR    R4                              ; 60B2   0024
L_60B3:
        CMPI    #$0002, R4                      ; 60B3   037C 0002
        BLE     L_60BF                          ; 60B5   0206 0008

        CMP     G_017F, R3                      ; 60B7   0343 017F
        BLT     L_60E5                          ; 60B9   0205 002A

        ADDI    #$0002, R5                      ; 60BB   02FD 0002
        B       L_60A8                          ; 60BD   0220 0016

L_60BF:
        MVI@    R5,     R4                      ; 60BF   02AC
        MOVR    R4,     R1                      ; 60C0   00A1
        ANDI    #$00FF, R4                      ; 60C1   03BC 00FF
        TSTR    R0                              ; 60C3   0080
        BNEQ    L_60D2                          ; 60C4   020C 000C

        CMPR    R2,     R4                      ; 60C6   0154
        MVI@    R5,     R4                      ; 60C7   02AC
        BGT     L_60A8                          ; 60C8   022E 0021

        MOVR    R4,     R1                      ; 60CA   00A1
        ANDI    #$00FF, R4                      ; 60CB   03BC 00FF
        CMPR    R2,     R4                      ; 60CD   0154
        BLE     L_60A8                          ; 60CE   0226 0027
        B       L_60DB                          ; 60D0   0200 0009

L_60D2:
        MVI@    R5,     R0                      ; 60D2   02A8
        CMPR    R2,     R4                      ; 60D3   0154
        BGE     L_60A8                          ; 60D4   022D 002D

        ANDI    #$00FF, R0                      ; 60D6   03B8 00FF
        CMPR    R2,     R0                      ; 60D8   0150
        BLT     L_60A8                          ; 60D9   0225 0032

L_60DB:
        MOVR    R4,     R2                      ; 60DB   00A2
        MVI     G_017F, R3                      ; 60DC   0283 017F
        SWAP    R3,     1                       ; 60DE   0043
        MVO     R3,     G_0330                  ; 60DF   0243 0330
        NOP                                     ; 60E1   0034
        SWAP    R3,     1                       ; 60E2   0043
        CLRC                                    ; 60E3   0006
        PULR    R7                              ; 60E4   02B7

L_60E5:
        SETC                                    ; 60E5   0007
        PULR    R7                              ; 60E6   02B7

L_60E7:
        PSHR    R5                              ; 60E7   0275
        PSHR    R0                              ; 60E8   0270
        ANDI    #$0002, R0                      ; 60E9   03B8 0002
        PULR    R0                              ; 60EB   02B0
        BEQ     L_60F9                          ; 60EC   0204 000B

        JSR     R4,     L_6104                  ; 60EE   0004 0060 0104

        NEGR    R3                              ; 60F1   0023
        SLR     R0,     1                       ; 60F2   0060
        NEGR    R3                              ; 60F3   0023
        SLR     R0,     1                       ; 60F4   0060
        GSWD    R0                              ; 60F5   0030
        SLR     R0,     1                       ; 60F6   0060
        RSWD    R1                              ; 60F7   0039
        SLR     R0,     1                       ; 60F8   0060

L_60F9:
        JSR     R4,     L_6104                  ; 60F9   0004 0060 0104

        SWAP    R3,     1                       ; 60FC   0043
        SLR     R0,     1                       ; 60FD   0060
        SWAP    R3,     1                       ; 60FE   0043
        SLR     R0,     1                       ; 60FF   0060
        SLL     R3,     2                       ; 6100   004F
        SLR     R0,     1                       ; 6101   0060
        SLLC    R0,     1                       ; 6102   0058
        SLR     R0,     1                       ; 6103   0060
L_6104:
        ADD     G_017A, R4                      ; 6104   02C4 017A
        SDBD                                    ; 6106   0001
        MVI@    R4,     R5                      ; 6107   02A5
        ANDI    #$0200, R0                      ; 6108   03B8 0200
        SLR     R0,     1                       ; 610A   0060
L_610B:
        MVI@    R5,     R4                      ; 610B   02AC
        CMPI    #$03FF, R4                      ; 610C   037C 03FF
        BEQ     L_6141                          ; 610E   0204 0031

        MOVR    R4,     R1                      ; 6110   00A1
        ANDI    #$00FF, R4                      ; 6111   03BC 00FF
        SWAP    R1,     1                       ; 6113   0041
        ANDI    #$0003, R1                      ; 6114   03B9 0003
        INCR    R1                              ; 6116   0009
        CMPR    R4,     R3                      ; 6117   0163
        BLT     L_6141                          ; 6118   0205 0027
        BEQ     L_611F                          ; 611A   0204 0003

        ADDR    R1,     R5                      ; 611C   00CD
        B       L_610B                          ; 611D   0220 0013

L_611F:
        MVI@    R5,     R4                      ; 611F   02AC
        MOVR    R4,     R3                      ; 6120   00A3
        DECR    R1                              ; 6121   0011
        BMI     L_6141                          ; 6122   020B 001D

        CMPI    #$0200, R4                      ; 6124   037C 0200
        BLT     L_612C                          ; 6126   0205 0004

        ANDI    #$00FF, R4                      ; 6128   03BC 00FF
        B       L_6131                          ; 612A   0200 0005

L_612C:
        XORR    R0,     R4                      ; 612C   01C4
        CMPI    #$00FF, R4                      ; 612D   037C 00FF
        BGT     L_611F                          ; 612F   022E 0011

L_6131:
        PSHR    R4                              ; 6131   0274
        SUBR    R2,     R4                      ; 6132   0114
        BPL     L_6136                          ; 6133   0203 0001

        NEGR    R4                              ; 6135   0024
L_6136:
        CMPI    #$0004, R4                      ; 6136   037C 0004
        PULR    R4                              ; 6138   02B4
        BGT     L_611F                          ; 6139   022E 001B

        MOVR    R4,     R2                      ; 613B   00A2
        SWAP    R2,     1                       ; 613C   0042
        MVO     R2,     G_032F                  ; 613D   0242 032F
        CLRC                                    ; 613F   0006
        PULR    R7                              ; 6140   02B7

L_6141:
        SETC                                    ; 6141   0007
        PULR    R7                              ; 6142   02B7

        PSHR    R5                              ; 6143   0275
        SUB     G_0165, R1                      ; 6144   0301 0165
        BNEQ    L_6270                          ; 6146   020C 0128

        ADD     G_0190, R1                      ; 6148   02C1 0190
        BNEQ    L_6270                          ; 614A   020C 0124

        TSTR    R0                              ; 614C   0080
        BMI     L_6267                          ; 614D   020B 0118

        MVII    #$032D, R1                      ; 614F   02B9 032D

        JSR     R5,     .EXEC.777               ; 6151   0004 0114 0377

        CMPI    #$0002, R0                      ; 6154   0378 0002
        BLT     L_6170                          ; 6156   0205 0018

        CMPI    #$0007, R0                      ; 6158   0378 0007
        BLT     L_616C                          ; 615A   0205 0010

        CMPI    #$000A, R0                      ; 615C   0378 000A
        BLT     L_6168                          ; 615E   0205 0008

        CMPI    #$000E, R0                      ; 6160   0378 000E
        BGT     L_6170                          ; 6162   020E 000C

        MVII    #$0003, R0                      ; 6164   02B8 0003
        B       L_6171                          ; 6166   0200 0009

L_6168:
        MVII    #$0002, R0                      ; 6168   02B8 0002
        B       L_6171                          ; 616A   0200 0005

L_616C:
        MVII    #$0001, R0                      ; 616C   02B8 0001
        B       L_6171                          ; 616E   0200 0001

L_6170:
        CLRR    R0                              ; 6170   01C0
L_6171:
        MVI     G_0191, R4                      ; 6171   0284 0191
        CMPI    #$0003, R4                      ; 6173   037C 0003
        BEQ     L_617D                          ; 6175   0204 0006

        MVI     G_01A6, R4                      ; 6177   0284 01A6
        ADD     G_0196, R4                      ; 6179   02C4 0196
        BEQ     L_6191                          ; 617B   0204 0014

L_617D:
        MVO     R0,     G_0193                  ; 617D   0240 0193
        PULR    R7                              ; 617F   02B7

L_6180:
        PSHR    R5                              ; 6180   0275
L_6181:
        CLRR    R0                              ; 6181   01C0
        MVO     R0,     G_01A6                  ; 6182   0240 01A6
        MVO     R0,     G_0191                  ; 6184   0240 0191
        MVI     G_0193, R0                      ; 6186   0280 0193
        CMPI    #$00FF, R0                      ; 6188   0378 00FF
        BEQ     L_6267                          ; 618A   0204 00DB

        MVII    #$032D, R1                      ; 618C   02B9 032D

        JSR     R5,     .EXEC.777               ; 618E   0004 0114 0377

L_6191:
        MVO     R0,     G_01A7                  ; 6191   0240 01A7
L_6193:
        MVI@    R1,     R5                      ; 6193   028D
        SARC    R0,     1                       ; 6194   0078
        BC      L_61C4                          ; 6195   0201 002D

        MVI     G_0191, R1                      ; 6197   0281 0191
        TSTR    R1                              ; 6199   0089
        BNEQ    L_63E5                          ; 619A   020C 0249

        SDBD                                    ; 619C   0001
        ANDI    #$3CFF, R5                      ; 619D   03BD 00FF 003C
        SWAP    R0,     1                       ; 61A0   0040
        SLL     R0,     1                       ; 61A1   0048
        XORR    R0,     R5                      ; 61A2   01C5
        MVO     R5,     G_032D                  ; 61A3   0245 032D
        SDBD                                    ; 61A5   0001
        MVII    #$5861, R4                      ; 61A6   02BC 0061 0058
        MVO     R4,     G_032E                  ; 61A9   0244 032E
        MVI     G_0335, R5                      ; 61AB   0285 0335
        SDBD                                    ; 61AD   0001
        ANDI    #$3CFF, R5                      ; 61AE   03BD 00FF 003C
        XORR    R0,     R5                      ; 61B1   01C5
        MVO     R5,     G_0335                  ; 61B2   0245 0335
        SUBI    #$0015, R4                      ; 61B4   033C 0015
        MVO     R4,     G_0336                  ; 61B6   0244 0336

        JSR     R5,     L_6098                  ; 61B8   0004 0160 0098

        BC      L_63E5                          ; 61BB   0201 0228

        SWAP    R1,     1                       ; 61BD   0041
L_61BE:
        ANDI    #$0003, R1                      ; 61BE   03B9 0003
        MVO     R1,     G_01A5                  ; 61C0   0241 01A5
        B       L_6247                          ; 61C2   0200 0083

L_61C4:
        RLC     R0,     1                       ; 61C4   0050
        MVI     G_0191, R4                      ; 61C5   0284 0191
        TSTR    R4                              ; 61C7   00A4
        BEQ     L_61E6                          ; 61C8   0204 001C

        CLRR    R3                              ; 61CA   01DB
        CMPI    #$0004, R4                      ; 61CB   037C 0004
        BLT     L_61D3                          ; 61CD   0205 0004

        SUBI    #$0004, R4                      ; 61CF   033C 0004
        MVII    #$0200, R3                      ; 61D1   02BB 0200
L_61D3:
        CMPR    R4,     R0                      ; 61D3   0160
        BEQ     L_6208                          ; 61D4   0204 0032

        INCR    R4                              ; 61D6   000C
        CMPR    R4,     R0                      ; 61D7   0160
        BEQ     L_6208                          ; 61D8   0204 002E

        XORI    #$0200, R5                      ; 61DA   03FD 0200
        MVO     R5,     G_032D                  ; 61DC   0245 032D
        MVI     G_0335, R5                      ; 61DE   0285 0335
        XORI    #$0200, R5                      ; 61E0   03FD 0200
        MVO     R5,     G_0335                  ; 61E2   0245 0335
        B       L_6208                          ; 61E4   0200 0022

L_61E6:
        PSHR    R5                              ; 61E6   0275
        ANDI    #$0200, R5                      ; 61E7   03BD 0200
        XORR    R5,     R0                      ; 61E9   01E8
        PSHR    R0                              ; 61EA   0270
        PSHR    R3                              ; 61EB   0273

        JSR     R5,     L_60E7                  ; 61EC   0004 0160 00E7

        PULR    R4                              ; 61EF   02B4
        PULR    R0                              ; 61F0   02B0
        PULR    R5                              ; 61F1   02B5
        BNC     L_6208                          ; 61F2   0209 0014

        XORI    #$0200, R0                      ; 61F4   03F8 0200
        XORI    #$0200, R5                      ; 61F6   03FD 0200
        MOVR    R4,     R3                      ; 61F8   00A3
        PSHR    R5                              ; 61F9   0275

        JSR     R5,     L_60E7                  ; 61FA   0004 0160 00E7

        PULR    R5                              ; 61FD   02B5
        BC      L_63E5                          ; 61FE   0201 01E5

        MVO     R5,     G_032D                  ; 6200   0245 032D
        MVI     G_0335, R5                      ; 6202   0285 0335
        XORI    #$0200, R5                      ; 6204   03FD 0200
        MVO     R5,     G_0335                  ; 6206   0245 0335
L_6208:
        MVII    #$0004, R1                      ; 6208   02B9 0004
        MVI     G_017A, R0                      ; 620A   0280 017A
        CMPI    #$0006, R0                      ; 620C   0378 0006
        BNEQ    L_6211                          ; 620E   020C 0001

        DECR    R1                              ; 6210   0011
L_6211:
        MVI     G_01A7, R0                      ; 6211   0280 01A7
        MVO     R0,     G_0193                  ; 6213   0240 0193
        MOVR    R1,     R2                      ; 6215   008A
        CMPI    #$0003, R0                      ; 6216   0378 0003
        BEQ     L_621C                          ; 6218   0204 0002

        INCR    R0                              ; 621A   0008
        NEGR    R1                              ; 621B   0021
L_621C:
        DECR    R0                              ; 621C   0010
        MVO     R1,     G_0195                  ; 621D   0241 0195
        CMPI    #$0200, R3                      ; 621F   037B 0200
        BGE     L_6230                          ; 6221   020D 000D

        SDBD                                    ; 6223   0001
        MVII    #$5868, R4                      ; 6224   02BC 0068 0058
        MVI     G_032D, R1                      ; 6227   0281 032D
        ANDI    #$0200, R1                      ; 6229   03B9 0200
        BEQ     L_6237                          ; 622B   0204 000A

        NEGR    R2                              ; 622D   0022
        B       L_6237                          ; 622E   0200 0007

L_6230:
        CLRR    R2                              ; 6230   01D2
        ADDI    #$0004, R0                      ; 6231   02F8 0004
        SDBD                                    ; 6233   0001
        MVII    #$586F, R4                      ; 6234   02BC 006F 0058
L_6237:
        MVO     R4,     G_032E                  ; 6237   0244 032E
        SUBI    #$0015, R4                      ; 6239   033C 0015
        MVO     R4,     G_0336                  ; 623B   0244 0336
        NOP                                     ; 623D   0034
        MVO     R2,     G_0192                  ; 623E   0242 0192
        MVO     R0,     G_0191                  ; 6240   0240 0191
        MVII    #$0001, R0                      ; 6242   02B8 0001
        MVO     R0,     G_0194                  ; 6244   0240 0194
        PULR    R7                              ; 6246   02B7

L_6247:
        MVI     G_01A7, R0                      ; 6247   0280 01A7
        MVO     R0,     G_0193                  ; 6249   0240 0193
        MVII    #$0006, R0                      ; 624B   02B8 0006
        SWAP    R2,     1                       ; 624D   0042
        XORR    R3,     R2                      ; 624E   01DA
        MVII    #$0022, R3                      ; 624F   02BB 0022
        MVI     G_019E, R1                      ; 6251   0281 019E
        TSTR    R1                              ; 6253   0089
        BEQ     L_6258                          ; 6254   0204 0002

        MVII    #$0030, R3                      ; 6256   02BB 0030
L_6258:
        MVII    #$032D, R1                      ; 6258   02B9 032D

        JSR     R5,     .EXEC.9A8               ; 625A   0004 0118 01A8

        MVII    #$0201, R1                      ; 625D   02B9 0201
        MVO     R1,     G_0332                  ; 625F   0241 0332
        MVO     R1,     G_033A                  ; 6261   0241 033A
        CLRR    R0                              ; 6263   01C0
        MVO     R0,     G_01A2                  ; 6264   0240 01A2
        PULR    R7                              ; 6266   02B7

L_6267:
        MVI     G_01A6, R1                      ; 6267   0281 01A6
        TSTR    R1                              ; 6269   0089
        BEQ     L_63E5                          ; 626A   0204 0179

        MVII    #$00FF, R1                      ; 626C   02B9 00FF
        MVO     R1,     G_0193                  ; 626E   0241 0193
L_6270:
        PULR    R7                              ; 6270   02B7

        PSHR    R5                              ; 6271   0275
        SUB     G_0165, R1                      ; 6272   0301 0165
        BNEQ    L_6283                          ; 6274   020C 000D

        TSTR    R0                              ; 6276   0080
        BMI     L_6283                          ; 6277   020B 000A

        ADD     G_0196, R1                      ; 6279   02C1 0196
        ADD     G_0197, R1                      ; 627B   02C1 0197
        ADD     G_0190, R1                      ; 627D   02C1 0190
        ADD     G_01A6, R1                      ; 627F   02C1 01A6
        BEQ     L_6288                          ; 6281   0204 0005

L_6283:
        MVII    #$0002, R0                      ; 6283   02B8 0002
        MVO     R0,     G_0197                  ; 6285   0240 0197
        PULR    R7                              ; 6287   02B7

L_6288:
        ADD     G_0191, R1                      ; 6288   02C1 0191
        BEQ     L_6290                          ; 628A   0204 0004

        CMPI    #$0003, R1                      ; 628C   0379 0003
        BNEQ    L_6283                          ; 628E   022C 000C

L_6290:
        JSR     R5,     L_6C66                  ; 6290   0004 016C 0066

        SDBD                                    ; 6293   0001
        MVII    #$5876, R0                      ; 6294   02B8 0076 0058
        MVO     R0,     G_032E                  ; 6297   0240 032E
        SDBD                                    ; 6299   0001
        MVII    #$587D, R0                      ; 629A   02B8 007D 0058
        MVO     R0,     G_0336                  ; 629D   0240 0336
        CLRR    R0                              ; 629F   01C0
        MVO     R0,     G_0332                  ; 62A0   0240 0332
        MVO     R0,     G_033A                  ; 62A2   0240 033A
        MVI     G_032D, R1                      ; 62A4   0281 032D
        ANDI    #$0200, R1                      ; 62A6   03B9 0200
        SDBD                                    ; 62A8   0001
        MVII    #$0405, R0                      ; 62A9   02B8 0005 0004
        BEQ     L_62B2                          ; 62AC   0204 0004

        SDBD                                    ; 62AE   0001
        MVII    #$FC05, R0                      ; 62AF   02B8 0005 00FC
L_62B2:
        MVO     R0,     G_0339                  ; 62B2   0240 0339
        MVII    #$0008, R0                      ; 62B4   02B8 0008
        MVO     R0,     G_0196                  ; 62B6   0240 0196
        PSHR    R1                              ; 62B8   0271
        MVII    #$032D, R1                      ; 62B9   02B9 032D

        JSR     R5,     .EXEC.777               ; 62BB   0004 0114 0377

        PULR    R1                              ; 62BE   02B1
        CLRR    R5                              ; 62BF   01ED
        MVI     G_017A, R0                      ; 62C0   0280 017A
        CMPI    #$0004, R0                      ; 62C2   0378 0004
        BEQ     L_630E                          ; 62C4   0204 0048
        BGT     L_630C                          ; 62C6   020E 0044

        TSTR    R1                              ; 62C8   0089
        BEQ     L_636A                          ; 62C9   0204 009F

        CMPI    #$0020, R3                      ; 62CB   037B 0020
        BNEQ    L_6313                          ; 62CD   020C 0044

        MVI     .BTAB.49,R1                     ; 62CF   0281 0249
        SDBD                                    ; 62D1   0001
        CMPI    #$18BD, R1                      ; 62D2   0379 00BD 0018
        BNEQ    L_6313                          ; 62D5   020C 003C

        CMPI    #$0074, R2                      ; 62D7   037A 0074
        BLT     L_6313                          ; 62D9   0205 0038

        CMPI    #$0079, R2                      ; 62DB   037A 0079
        BGT     L_636A                          ; 62DD   020E 008B

        MVII    #$0081, R0                      ; 62DF   02B8 0081
        MVO     R0,     G_0198                  ; 62E1   0240 0198
        MVII    #$0049, R0                      ; 62E3   02B8 0049
        MVO     R0,     G_0199                  ; 62E5   0240 0199

        JSR     R5,     L_5FAA                  ; 62E7   0004 015C 03AA
        JSR     R5,     L_6C54                  ; 62EA   0004 016C 0054

        PULR    R7                              ; 62ED   02B7

        DECLE   $0030,  $0006,  $0012,  $0278   ; 62EE   0030 0006 0012 0278

        MOVR    R6,     R5                      ; 62F2   00B5
        SWAP    R0,     1                       ; 62F3   0040
        CLRC                                    ; 62F4   0006
        DECR    R2                              ; 62F5   0012
        MVI@    R4,     R0                      ; 62F6   02A0
        MOVR    R6,     R5                      ; 62F7   00B5
        SWAP    R0,     1                       ; 62F8   0040
        MOVR    R2,     R0                      ; 62F9   0090
        MOVR    R3,     R4                      ; 62FA   009C
        PULR    R2                              ; 62FB   02B2
        SLLC    R1,     2                       ; 62FC   005D
        RLC     R0,     1                       ; 62FD   0050
        MOVR    R2,     R0                      ; 62FE   0090
        MOVR    R3,     R4                      ; 62FF   009C
        ADD@    R3,     R2                      ; 6300   02DA
        SLLC    R1,     2                       ; 6301   005D
        GSWD    R0                              ; 6302   0030
        MOVR    R1,     R0                      ; 6303   0088
        MOVR    R2,     R6                      ; 6304   0096
        MVI@    R1,     R1                      ; 6305   0289
        ADDR    R0,     R5                      ; 6306   00C5
        SWAP    R0,     1                       ; 6307   0040
        MOVR    R2,     R0                      ; 6308   0090
        MOVR    R3,     R4                      ; 6309   009C
        PULR    R2                              ; 630A   02B2
        ADDR    R0,     R5                      ; 630B   00C5
L_630C:
        ADDI    #$000A, R5                      ; 630C   02FD 000A
L_630E:
        ADDI    #$000A, R5                      ; 630E   02FD 000A
        TSTR    R1                              ; 6310   0089
        BNEQ    L_636A                          ; 6311   020C 0057

L_6313:
        SDBD                                    ; 6313   0001
        ADDI    #$62EE, R5                      ; 6314   02FD 00EE 0062
        MVI@    R5,     R4                      ; 6317   02AC
        CMPR    R4,     R3                      ; 6318   0163
        BEQ     L_6321                          ; 6319   0204 0006

        ADDI    #$0004, R5                      ; 631B   02FD 0004
        MVI@    R5,     R4                      ; 631D   02AC
        CMPR    R4,     R3                      ; 631E   0163
        BNEQ    L_636A                          ; 631F   020C 0049

L_6321:
        MVI@    R5,     R4                      ; 6321   02AC
        CMPR    R4,     R2                      ; 6322   0162
        BLT     L_636A                          ; 6323   0205 0045

        MVI@    R5,     R4                      ; 6325   02AC
        CMPR    R4,     R2                      ; 6326   0162
        BGT     L_636A                          ; 6327   020E 0041

        MVI@    R5,     R1                      ; 6329   02A9
        MVI@    R1,     R3                      ; 632A   028B
        ANDI    #$00FF, R3                      ; 632B   03BB 00FF
        CMP@    R5,     R3                      ; 632D   036B
        BNEQ    L_636A                          ; 632E   020C 003A

        CLRR    R2                              ; 6330   01D2
        CMPI    #$005D, R3                      ; 6331   037B 005D
        BNEQ    L_6339                          ; 6333   020C 0004

        SDBD                                    ; 6335   0001
        MVII    #$1000, R2                      ; 6336   02BA 0000 0010
L_6339:
        MVO@    R2,     R1                      ; 6339   024A
        MVI     G_0335, R1                      ; 633A   0281 0335
        XORI    #$0004, R1                      ; 633C   03F9 0004
        MVO     R1,     G_0335                  ; 633E   0241 0335
        MVII    #$0096, R0                      ; 6340   02B8 0096
        MVO     R0,     G_019E                  ; 6342   0240 019E
        MVII    #$0177, R1                      ; 6344   02B9 0177
        ADD     G_0165, R1                      ; 6346   02C1 0165
        MVO@    R0,     R1                      ; 6348   0248
        MVII    #$0003, R0                      ; 6349   02B8 0003
        MVO     R0,     G_0180                  ; 634B   0240 0180
        MVO     R0,     G_0323                  ; 634D   0240 0323
        CLRR    R0                              ; 634F   01C0
        MVO     R0,     G_0181                  ; 6350   0240 0181
        MVO     R0,     G_034E                  ; 6352   0240 034E
        MVO     R0,     G_0356                  ; 6354   0240 0356
        NOP                                     ; 6356   0034
        MVO     R0,     G_019C                  ; 6357   0240 019C
        MVO     R0,     G_019B                  ; 6359   0240 019B
        MVO     R0,     G_01AE                  ; 635B   0240 01AE
        NOP                                     ; 635D   0034
        MVO     R0,     G_01B2                  ; 635E   0240 01B2
        MVO     R0,     G_01B6                  ; 6360   0240 01B6
        NOP                                     ; 6362   0034
        MVO     R0,     G_0341                  ; 6363   0240 0341
        MVO     R0,     G_0349                  ; 6365   0240 0349

        JSR     R5,     L_6BCB                  ; 6367   0004 0168 03CB

L_636A:
        PULR    R7                              ; 636A   02B7

        PSHR    R5                              ; 636B   0275
        MVI     G_0334, R3                      ; 636C   0283 0334
        MOVR    R3,     R2                      ; 636E   009A
        SDBD                                    ; 636F   0001
        ANDI    #$FF00, R2                      ; 6370   03BA 0000 00FF
        MVO     R2,     G_032F                  ; 6373   0242 032F
        ANDI    #$00FF, R3                      ; 6375   03BB 00FF
        SWAP    R3,     1                       ; 6377   0043
        MVO     R3,     G_0330                  ; 6378   0243 0330
        MVII    #$032D, R1                      ; 637A   02B9 032D
        SWAP    R2,     1                       ; 637C   0042
        SWAP    R3,     1                       ; 637D   0043
        MVI     G_01A6, R0                      ; 637E   0280 01A6
        CMPI    #$0001, R0                      ; 6380   0378 0001
        BEQ     L_639F                          ; 6382   0204 001B
        BGT     L_6181                          ; 6384   022E 0204

        MVI     G_01A5, R0                      ; 6386   0280 01A5
        TSTR    R0                              ; 6388   0080
        BEQ     L_63E5                          ; 6389   0204 005A

        DECR    R0                              ; 638B   0010
        BEQ     L_63C2                          ; 638C   0204 0034

        DECR    R0                              ; 638E   0010
        BEQ     L_63D5                          ; 638F   0204 0044

        MVI     G_017A, R5                      ; 6391   0285 017A
        CMPI    #$0006, R5                      ; 6393   037D 0006
        BEQ     L_63AC                          ; 6395   0204 0015

        MVII    #$0001, R0                      ; 6397   02B8 0001
        MVO     R0,     G_01A6                  ; 6399   0240 01A6
        ADDI    #$000A, R3                      ; 639B   02FB 000A
        B       L_63C6                          ; 639D   0200 0027

L_639F:
        MVI     G_035E, R0                      ; 639F   0280 035E
        MVII    #$0030, R3                      ; 63A1   02BB 0030
        SARC    R0,     1                       ; 63A3   0078
        BC      L_63A8                          ; 63A4   0201 0002

        MVII    #$0020, R3                      ; 63A6   02BB 0020
L_63A8:
        MVO     R3,     G_01A6                  ; 63A8   0243 01A6
        B       L_63C6                          ; 63AA   0200 001A

L_63AC:
        MVI     G_0193, R0                      ; 63AC   0280 0193
        CMP     G_01A0, R0                      ; 63AE   0340 01A0
        BNEQ    L_63C2                          ; 63B0   020C 0010

        CLRR    R0                              ; 63B2   01C0
        ADD     G_01A1, R0                      ; 63B3   02C0 01A1
        BNEQ    L_63C2                          ; 63B5   020C 000B

        INCR    R0                              ; 63B7   0008
        MVO     R0,     G_01A3                  ; 63B8   0240 01A3
        MVO     R0,     G_01A2                  ; 63BA   0240 01A2
        MVII    #$0051, R0                      ; 63BC   02B8 0051
        MVO     R0,     G_01A1                  ; 63BE   0240 01A1
        B       L_63EE                          ; 63C0   0200 002C

L_63C2:
        MVO     R3,     G_01A6                  ; 63C2   0243 01A6
        ADDI    #$0010, R3                      ; 63C4   02FB 0010
L_63C6:
        SWAP    R2,     1                       ; 63C6   0042
        XORR    R3,     R2                      ; 63C7   01DA
        MVII    #$0003, R3                      ; 63C8   02BB 0003
        MVO     R3,     G_0191                  ; 63CA   0243 0191
        MVII    #$0020, R3                      ; 63CC   02BB 0020

        JSR     R5,     .EXEC.9A8               ; 63CE   0004 0118 01A8
        JSR     R5,     L_6C33                  ; 63D1   0004 016C 0033

        PULR    R7                              ; 63D4   02B7

L_63D5:
        MVI     G_0193, R0                      ; 63D5   0280 0193
        TSTR    R0                              ; 63D7   0080
        MVII    #$0002, R2                      ; 63D8   02BA 0002
        BEQ     L_63DE                          ; 63DA   0204 0002

        MVII    #$00A0, R2                      ; 63DC   02BA 00A0
L_63DE:
        SWAP    R2,     1                       ; 63DE   0042
        MVO     R2,     G_032F                  ; 63DF   0242 032F
        SWAP    R2,     1                       ; 63E1   0042
        B       L_6191                          ; 63E2   0220 0252

L_63E4:
        PSHR    R5                              ; 63E4   0275
L_63E5:
        MVI     G_0196, R0                      ; 63E5   0280 0196
        TSTR    R0                              ; 63E7   0080
        BNEQ    L_6413                          ; 63E8   020C 0029

        MVII    #$00FF, R0                      ; 63EA   02B8 00FF
        MVO     R0,     G_0193                  ; 63EC   0240 0193
L_63EE:
        MVII    #$0331, R5                      ; 63EE   02BD 0331
        CLRR    R1                              ; 63F0   01C9
        MVO@    R1,     R5                      ; 63F1   0269
        MVO@    R1,     R5                      ; 63F2   0269
        MVO     R1,     G_033A                  ; 63F3   0241 033A
        MVI     G_0191, R0                      ; 63F5   0280 0191
        MVO@    R1,     R5                      ; 63F7   0269
        MVO     R1,     G_0194                  ; 63F8   0241 0194
        TSTR    R0                              ; 63FA   0080
        SDBD                                    ; 63FB   0001
        MVII    #$5861, R4                      ; 63FC   02BC 0061 0058
        BEQ     L_640D                          ; 63FF   0204 000C

        CMPI    #$0003, R0                      ; 6401   0378 0003
        BEQ     L_640D                          ; 6403   0204 0008

        ADDI    #$0007, R4                      ; 6405   02FC 0007
        CMPI    #$0003, R0                      ; 6407   0378 0003
        BLT     L_640D                          ; 6409   0205 0002

        ADDI    #$0007, R4                      ; 640B   02FC 0007
L_640D:
        MVO     R4,     G_032E                  ; 640D   0244 032E
        SUBI    #$0015, R4                      ; 640F   033C 0015
        MVO     R4,     G_0336                  ; 6411   0244 0336
L_6413:
        PULR    R7                              ; 6413   02B7

L_6414:
        MVII    #$03FF, R0                      ; 6414   02B8 03FF
L_6416:
        DECR    R0                              ; 6416   0010
        INCR    R0                              ; 6417   0008
        DECR    R0                              ; 6418   0010
        BNEQ    L_6416                          ; 6419   022C 0004

        DECR    R1                              ; 641B   0011
        BNEQ    L_6414                          ; 641C   022C 0009
        MOVR    R5,     R7                      ; 641E   00AF

L_641F:
        MVI     G_0102, R0                      ; 641F   0280 0102
        TSTR    R0                              ; 6421   0080
        BNEQ    L_641F                          ; 6422   022C 0004

        JSR     R5,     L_63E4                  ; 6424   0004 0160 03E4

        MVI     G_0165, R3                      ; 6427   0283 0165
        CLRR    R0                              ; 6429   01C0
        MVII    #$0170, R2                      ; 642A   02BA 0170
        ADDR    R3,     R2                      ; 642C   00DA
        MVO@    R0,     R2                      ; 642D   0250
        ADDI    #$0007, R2                      ; 642E   02FA 0007
        MVO@    R0,     R2                      ; 6430   0250
        ADDI    #$0166, R3                      ; 6431   02FB 0166
        MVI@    R3,     R1                      ; 6433   0299
        INCR    R1                              ; 6434   0009
        MVO@    R1,     R3                      ; 6435   0259

        JSR     R5,     L_6A96                  ; 6436   0004 0168 0296

L_6439:
        MVI     G_0145, R3                      ; 6439   0283 0145
        CMPI    #$00FF, R3                      ; 643B   037B 00FF
        BNEQ    L_6439                          ; 643D   022C 0005

        CLRR    R0                              ; 643F   01C0
        MVO     R0,     G_0145                  ; 6440   0240 0145
        MVO     R0,     G_0146                  ; 6442   0240 0146
        MVO     R0,     G_0149                  ; 6444   0240 0149
        B       L_64D8                          ; 6446   0200 0090

        PSHR    R5                              ; 6448   0275
        MVI     G_0190, R0                      ; 6449   0280 0190
        TSTR    R0                              ; 644B   0080
        BEQ     L_644F                          ; 644C   0204 0001
        PULR    R7                              ; 644E   02B7

L_644F:
        CLRR    R1                              ; 644F   01C9
        MVO     R1,     G_01D4                  ; 6450   0241 01D4
        MVO     R1,     G_01DA                  ; 6452   0241 01DA
        MVO     R1,     G_0196                  ; 6454   0241 0196
        MVII    #$0002, R1                      ; 6456   02B9 0002
        MVO     R1,     G_0190                  ; 6458   0241 0190

        JSR     R5,     L_63E4                  ; 645A   0004 0160 03E4

        MVII    #$0005, R1                      ; 645D   02B9 0005
        CLRR    R0                              ; 645F   01C0
L_6460:
        INCR    R0                              ; 6460   0008
        MVO     R0,     G_0102                  ; 6461   0240 0102
L_6463:
        MVI     G_0102, R0                      ; 6463   0280 0102
        TSTR    R0                              ; 6465   0080
        BNEQ    L_6463                          ; 6466   022C 0004

        DECR    R1                              ; 6468   0011
        BNEQ    L_6460                          ; 6469   022C 000A

        JSR     R5,     L_6BFB                  ; 646B   0004 0168 03FB

        MVII    #$0030, R1                      ; 646E   02B9 0030

        JSR     R5,     L_6414                  ; 6470   0004 0164 0014

        MVI     G_0165, R1                      ; 6473   0281 0165
        MVII    #$0170, R2                      ; 6475   02BA 0170
        ADDR    R1,     R2                      ; 6477   00CA
        MVI     G_017C, R3                      ; 6478   0283 017C
        MVO@    R3,     R2                      ; 647A   0253
        MVII    #$016E, R2                      ; 647B   02BA 016E
        MOVR    R2,     R4                      ; 647D   0094
        MVI@    R4,     R3                      ; 647E   02A3
        ADD@    R4,     R3                      ; 647F   02E3
        BEQ     L_64FD                          ; 6480   0204 007B

        CLRR    R0                              ; 6482   01C0
        XOR     G_0161, R0                      ; 6483   03C0 0161
        BEQ     L_64D3                          ; 6485   0204 004C

        MOVR    R2,     R4                      ; 6487   0094
        ADDR    R1,     R4                      ; 6488   00CC
        MVI@    R4,     R3                      ; 6489   02A3
        TSTR    R3                              ; 648A   009B
        BNEQ    L_64C9                          ; 648B   020C 003C

        PSHR    R2                              ; 648D   0272
        PSHR    R1                              ; 648E   0271

        JSR     R5,     .EXEC.7B3               ; 648F   0004 0114 03B3

        MVII    #$0003, R0                      ; 6492   02B8 0003
        MVO     R0,     G_0102                  ; 6494   0240 0102
        CLRR    R0                              ; 6496   01C0
        MVO     R0,     G_017A                  ; 6497   0240 017A

        JSR     R5,     L_5170                  ; 6499   0004 0150 0170

        MVII    #$0007, R3                      ; 649C   02BB 0007
        MVII    #$0278, R4                      ; 649E   02BC 0278

        JSR     R5,     X_PRINT_R5              ; 64A0   0004 0118 007B
        STRING  " Game over Player   "          ; 64A3  
        DECLE   $0000                           ; 64B7   0000

        PULR    R0                              ; 64B8   02B0
        INCR    R6                              ; 64B9   000E
        INCR    R0                              ; 64BA   0008
        MVII    #$0001, R1                      ; 64BB   02B9 0001
        MVII    #$028A, R4                      ; 64BD   02BC 028A

        JSR     R5,     X_PRNUM_RGT             ; 64BF   0004 0118 00C5

        MVII    #$0060, R1                      ; 64C2   02B9 0060

        JSR     R5,     L_6414                  ; 64C4   0004 0164 0014

        PULR    R1                              ; 64C7   02B1
        PULR    R2                              ; 64C8   02B2
L_64C9:
        XORI    #$0001, R1                      ; 64C9   03F9 0001
        MOVR    R2,     R4                      ; 64CB   0094
        ADDR    R1,     R4                      ; 64CC   00CC
        MVI@    R4,     R3                      ; 64CD   02A3
        TSTR    R3                              ; 64CE   009B
        BEQ     L_64D3                          ; 64CF   0204 0002

        MVO     R1,     G_0165                  ; 64D1   0241 0165
L_64D3:
        ADD     G_0165, R2                      ; 64D3   02C2 0165
        MVI@    R2,     R3                      ; 64D5   0293
        DECR    R3                              ; 64D6   0013
        MVO@    R3,     R2                      ; 64D7   0253

L_64D8:
        JSR     R5,     .EXEC.7B3               ; 64D8   0004 0114 03B3

        MVII    #$0003, R3                      ; 64DB   02BB 0003
        MVO     R3,     G_0102                  ; 64DD   0243 0102
L_64DF:
        MVI     G_0102, R3                      ; 64DF   0283 0102
        TSTR    R3                              ; 64E1   009B
        BNEQ    L_64DF                          ; 64E2   022C 0004

        INCR    R3                              ; 64E4   000B
        MVO     R3,     G_0102                  ; 64E5   0243 0102
        MVI     G_0165, R3                      ; 64E7   0283 0165
        ADDI    #$0166, R3                      ; 64E9   02FB 0166
        MVI@    R3,     R1                      ; 64EB   0299
L_64EC:
        CMPI    #$0003, R1                      ; 64EC   0379 0003
        BLT     L_64F4                          ; 64EE   0205 0004

        SUBI    #$0003, R1                      ; 64F0   0339 0003
        B       L_64EC                          ; 64F2   0220 0007

L_64F4:
        SLL     R1,     1                       ; 64F4   0049
        INCR    R1                              ; 64F5   0009
        MVO     R1,     G_017A                  ; 64F6   0241 017A
        MVII    #$02F2, R6                      ; 64F8   02BE 02F2
        J       L_5110                          ; 64FA   0004 0350 0110

L_64FD:
        JSR     R5,     .EXEC.7B3               ; 64FD   0004 0114 03B3

        MVII    #$0003, R3                      ; 6500   02BB 0003
        MVO     R3,     G_0102                  ; 6502   0243 0102
        MVII    #$0007, R3                      ; 6504   02BB 0007
        MVII    #$027C, R4                      ; 6506   02BC 027C

        JSR     R5,     X_PRINT_R5              ; 6508   0004 0118 007B
        STRING  " GAME OVER "                   ; 650B  
        DECLE   $0000                           ; 6516   0000

        MVII    #$0080, R1                      ; 6517   02B9 0080

        JSR     R5,     L_6414                  ; 6519   0004 0164 0014

        CLRR    R0                              ; 651C   01C0
        MVO     R0,     G_015F                  ; 651D   0240 015F
        MVII    #$0007, R0                      ; 651F   02B8 0007
        MVO     R0,     G_017A                  ; 6521   0240 017A
        J       L_509D                          ; 6523   0004 0350 009D

L_6526:
        PSHR    R5                              ; 6526   0275
        MVI     G_017A, R0                      ; 6527   0280 017A
        SARC    R0,     1                       ; 6529   0078
        BEQ     L_652E                          ; 652A   0204 0002
        BNC     L_652F                          ; 652C   0209 0001
L_652E:
        PULR    R7                              ; 652E   02B7

L_652F:
        MVI     G_0190, R0                      ; 652F   0280 0190
        TSTR    R0                              ; 6531   0080
        BNEQ    L_644F                          ; 6532   022C 00E4

        ADD     G_019E, R0                      ; 6534   02C0 019E
        BNEQ    L_66B7                          ; 6536   020C 017F

        CLRR    R1                              ; 6538   01C9
        MVII    #$01A8, R5                      ; 6539   02BD 01A8
L_653B:
        MVI@    R5,     R0                      ; 653B   02A8
        DECR    R0                              ; 653C   0010
        BMI     L_6545                          ; 653D   020B 0006
        BEQ     L_644F                          ; 653F   0224 00F1

        DECR    R5                              ; 6541   0015
        MVO@    R0,     R5                      ; 6542   0268
        MVII    #$0086, R1                      ; 6543   02B9 0086
L_6545:
        CMPI    #$01AB, R5                      ; 6545   037D 01AB
        BLE     L_653B                          ; 6547   0226 000D

        CMP     G_0146, R1                      ; 6549   0341 0146
        BLE     L_6553                          ; 654B   0206 0006

        TSTR    R1                              ; 654D   0089
        BEQ     L_6553                          ; 654E   0204 0003

        JSR     R5,     L_6BB0                  ; 6550   0004 0168 03B0

L_6553:
        MVI     G_01A6, R0                      ; 6553   0280 01A6
        TSTR    R0                              ; 6555   0080
        BNEQ    L_656D                          ; 6556   020C 0015

        MVI     G_0331, R0                      ; 6558   0280 0331
        TSTR    R0                              ; 655A   0080
        BEQ     L_656D                          ; 655B   0204 0010

        MVII    #$01FF, R1                      ; 655D   02B9 01FF
        SUB     G_0165, R1                      ; 655F   0301 0165
        MVI@    R1,     R0                      ; 6561   0288
        CMPI    #$00FF, R0                      ; 6562   0378 00FF
        BEQ     L_656A                          ; 6564   0204 0004

        CMPI    #$0094, R0                      ; 6566   0378 0094
        BNEQ    L_656D                          ; 6568   020C 0003

L_656A:
        JSR     R5,     L_63E4                  ; 656A   0004 0160 03E4

L_656D:
        MVII    #$01AC, R4                      ; 656D   02BC 01AC

        JSR     R5,     L_6578                  ; 656F   0004 0164 0178

        INCR    R4                              ; 6572   000C

        JSR     R5,     L_6578                  ; 6573   0004 0164 0178

        B       L_65CD                          ; 6576   0200 0055

L_6578:
        PSHR    R5                              ; 6578   0275
        MOVR    R4,     R3                      ; 6579   00A3
        MVI@    R3,     R2                      ; 657A   029A
        DECR    R2                              ; 657B   0012
        BMI     L_65CC                          ; 657C   020B 004E

        MVO@    R2,     R3                      ; 657E   025A
        BNEQ    L_6598                          ; 657F   020C 0017

L_6581:
        MVII    #$008F, R0                      ; 6581   02B8 008F

        JSR     R5,     X_RAND2                 ; 6583   0004 0114 029E

        CLRR    R2                              ; 6586   01D2
        SARC    R0,     2                       ; 6587   007C
        SLLC    R2,     2                       ; 6588   005E
        SARC    R0,     2                       ; 6589   007C
        SLLC    R2,     2                       ; 658A   005E
        ADDI    #$0018, R2                      ; 658B   02FA 0018
        MOVR    R4,     R3                      ; 658D   00A3
        MVO@    R2,     R3                      ; 658E   025A
        SARC    R0,     1                       ; 658F   0078
        BC      L_6593                          ; 6590   0201 0001

        NEGR    R0                              ; 6592   0020
L_6593:
        SLLC    R0,     1                       ; 6593   0058
        MOVR    R4,     R3                      ; 6594   00A3
        ADDI    #$0010, R3                      ; 6595   02FB 0010
        MVO@    R0,     R3                      ; 6597   0258
L_6598:
        MOVR    R4,     R3                      ; 6598   00A3
        ADDI    #$0008, R3                      ; 6599   02FB 0008
        MVI@    R3,     R2                      ; 659B   029A
        INCR    R2                              ; 659C   000A
        CMPI    #$00BA, R2                      ; 659D   037A 00BA
        BGT     L_65C2                          ; 659F   020E 0021

        MVO@    R2,     R3                      ; 65A1   025A
        SUBI    #$0004, R3                      ; 65A2   033B 0004
        MVI@    R3,     R2                      ; 65A4   029A
        SWAP    R2,     1                       ; 65A5   0042
        ADDI    #$0014, R3                      ; 65A6   02FB 0014
        XOR@    R3,     R2                      ; 65A8   03DA
        SUBI    #$0008, R3                      ; 65A9   033B 0008
        MVI@    R3,     R0                      ; 65AB   0298
        SWAP    R0,     1                       ; 65AC   0040
        SARC    R0,     2                       ; 65AD   007C
        ADDR    R0,     R2                      ; 65AE   00C2
        ADDI    #$0008, R3                      ; 65AF   02FB 0008
        MOVR    R2,     R5                      ; 65B1   0095
        SWAP    R2,     1                       ; 65B2   0042
        ANDI    #$00FF, R2                      ; 65B3   03BA 00FF
        CMPI    #$0020, R2                      ; 65B5   037A 0020
        BLT     L_6581                          ; 65B7   0225 0037

        CMPI    #$0090, R2                      ; 65B9   037A 0090
        BGT     L_6581                          ; 65BB   022E 003B

        MVO@    R5,     R3                      ; 65BD   025D
        SUBI    #$0014, R3                      ; 65BE   033B 0014
        MVO@    R2,     R3                      ; 65C0   025A
        PULR    R7                              ; 65C1   02B7

L_65C2:
        MOVR    R4,     R3                      ; 65C2   00A3
        SUBI    #$0002, R3                      ; 65C3   033B 0002
        MVI@    R3,     R0                      ; 65C5   0298
        TSTR    R0                              ; 65C6   0080
        BNEQ    L_65CC                          ; 65C7   020C 0003

        MVII    #$00FF, R0                      ; 65C9   02B8 00FF
        MVO@    R0,     R3                      ; 65CB   0258
L_65CC:
        PULR    R7                              ; 65CC   02B7

L_65CD:
        MVI     G_01AE, R2                      ; 65CD   0282 01AE
        DECR    R2                              ; 65CF   0012
        BMI     L_65E3                          ; 65D0   020B 0011

        MVI     G_01B2, R2                      ; 65D2   0282 01B2
        ADD     G_01BE, R2                      ; 65D4   02C2 01BE
        ANDI    #$00FF, R2                      ; 65D6   03BA 00FF
        CMPI    #$0098, R2                      ; 65D8   037A 0098
        BLE     L_65E1                          ; 65DA   0206 0005

        CLRR    R2                              ; 65DC   01D2
        MVO     R2,     G_01AE                  ; 65DD   0242 01AE
        MVO     R2,     G_01B6                  ; 65DF   0242 01B6
L_65E1:
        MVO     R2,     G_01B2                  ; 65E1   0242 01B2
L_65E3:
        MVI     G_01D1, R0                      ; 65E3   0280 01D1
        DECR    R0                              ; 65E5   0010
        BMI     L_66AA                          ; 65E6   020B 00C2

        MVO     R0,     G_01D1                  ; 65E8   0240 01D1
        BNEQ    L_66B7                          ; 65EA   020C 00CB

        MVI     G_01D2, R0                      ; 65EC   0280 01D2
        INCR    R0                              ; 65EE   0008
        CMPI    #$0002, R0                      ; 65EF   0378 0002
        BGT     L_667F                          ; 65F1   020E 008C
        BLT     L_6683                          ; 65F3   0205 008E

        MVI     G_017B, R1                      ; 65F5   0281 017B
        ANDI    #$000F, R1                      ; 65F7   03B9 000F
        CMPI    #$000F, R1                      ; 65F9   0379 000F
        BEQ     L_6614                          ; 65FB   0204 0017

        MVI     G_017A, R0                      ; 65FD   0280 017A
        CMPI    #$0002, R0                      ; 65FF   0378 0002
        MVII    #$000F, R0                      ; 6601   02B8 000F
        BNEQ    L_6607                          ; 6603   020C 0002

        MVII    #$0013, R0                      ; 6605   02B8 0013
L_6607:
        SUB     G_017C, R0                      ; 6607   0300 017C
        MOVR    R1,     R2                      ; 6609   008A
L_660A:
        SARC    R2,     1                       ; 660A   007A
        BC      L_6611                          ; 660B   0201 0004
        BEQ     L_661A                          ; 660D   0204 000B
        B       L_660A                          ; 660F   0220 0006

L_6611:
        DECR    R0                              ; 6611   0010
        BPL     L_660A                          ; 6612   0223 0009

L_6614:
        MVII    #$0001, R1                      ; 6614   02B9 0001
        MVO     R1,     G_01D1                  ; 6616   0241 01D1
        B       L_66B7                          ; 6618   0200 009D

L_661A:
        CLRR    R0                              ; 661A   01C0
        INCR    R7                              ; 661B   000F

L_661C:
        INCR    R0                              ; 661C   0008
L_661D:
        SARC    R1,     1                       ; 661D   0079
        BC      L_661C                          ; 661E   0221 0003

        JSR     R5,     X_CLR_BIT               ; 6620   0004 0114 02E6

        CMPR    R7,     R3                      ; 6623   017B
        CMPI    #$0001, R0                      ; 6624   0378 0001
        BLE     L_6644                          ; 6626   0206 001C

        MVII    #$01AA, R4                      ; 6628   02BC 01AA
        ADDR    R0,     R4                      ; 662A   00C4
        MVII    #$0001, R0                      ; 662B   02B8 0001
        MVO@    R0,     R4                      ; 662D   0260
        ADDI    #$0003, R4                      ; 662E   02FC 0003
        MVII    #$0054, R2                      ; 6630   02BA 0054
        MVII    #$0020, R3                      ; 6632   02BB 0020
        MVI     G_017A, R0                      ; 6634   0280 017A
        CMPI    #$0004, R0                      ; 6636   0378 0004
        BNEQ    L_663E                          ; 6638   020C 0004

        MVII    #$0030, R3                      ; 663A   02BB 0030
        MVII    #$0070, R2                      ; 663C   02BA 0070
L_663E:
        MVO@    R2,     R4                      ; 663E   0262
        ADDI    #$0003, R4                      ; 663F   02FC 0003
        MVO@    R3,     R4                      ; 6641   0263
        B       L_6676                          ; 6642   0200 0032

L_6644:
        SDBD                                    ; 6644   0001
        MVII    #$58B2, R1                      ; 6645   02B9 00B2 0058
        MVII    #$033D, R2                      ; 6648   02BA 033D
        DECR    R0                              ; 664A   0010
        BMI     L_664F                          ; 664B   020B 0002

        MVII    #$0345, R2                      ; 664D   02BA 0345

L_664F:
        JSR     R5,     X_INIT_MOB              ; 664F   0004 0114 02B2

        CLRR    R0                              ; 6652   01C0
        MVI     G_017A, R1                      ; 6653   0281 017A
        CMPI    #$0004, R1                      ; 6655   0379 0004
        BLT     L_6676                          ; 6657   0205 001D
        BGT     L_666C                          ; 6659   020E 0011

        MVII    #$0070, R0                      ; 665B   02B8 0070
        SWAP    R0,     1                       ; 665D   0040
        ADDI    #$0002, R2                      ; 665E   02FA 0002
        MVO@    R0,     R2                      ; 6660   0250
        MVII    #$0018, R0                      ; 6661   02B8 0018
        SWAP    R0,     1                       ; 6663   0040
        INCR    R2                              ; 6664   000A
        MVO@    R0,     R2                      ; 6665   0250
        MVII    #$0001, R0                      ; 6666   02B8 0001
        ADDI    #$0002, R2                      ; 6668   02FA 0002
        B       L_6678                          ; 666A   0200 000C

L_666C:
        MVI     G_01E8, R0                      ; 666C   0280 01E8
        MOVR    R0,     R5                      ; 666E   0085
        INCR    R5                              ; 666F   000D
        ANDI    #$0003, R5                      ; 6670   03BD 0003
        MVO     R5,     G_01E8                  ; 6672   0245 01E8
        ADDI    #$0002, R0                      ; 6674   02F8 0002
L_6676:
        ADDI    #$0005, R2                      ; 6676   02FA 0005
L_6678:
        MVO@    R0,     R2                      ; 6678   0250
        MVII    #$0002, R0                      ; 6679   02B8 0002
        MVII    #$000A, R1                      ; 667B   02B9 000A
        B       L_6685                          ; 667D   0200 0006

L_667F:
        CLRR    R0                              ; 667F   01C0
        CLRR    R1                              ; 6680   01C9
        B       L_6685                          ; 6681   0200 0002

L_6683:
        MVII    #$0004, R1                      ; 6683   02B9 0004
L_6685:
        MVO     R0,     G_01D2                  ; 6685   0240 01D2
        MVO     R1,     G_01D1                  ; 6687   0241 01D1
        INCR    R0                              ; 6689   0008
        MVI     G_017A, R1                      ; 668A   0281 017A
        CMPI    #$0002, R1                      ; 668C   0379 0002
        BEQ     L_6692                          ; 668E   0204 0002

        XORI    #$0010, R0                      ; 6690   03F8 0010
L_6692:
        MVO     R0,     G_01D3                  ; 6692   0240 01D3
        DECR    R0                              ; 6694   0010
        BNEQ    L_66B7                          ; 6695   020C 0020

L_6697:
        MVII    #$0070, R0                      ; 6697   02B8 0070
        MVI     G_017E, R1                      ; 6699   0281 017E
        SLL     R1,     2                       ; 669B   004D
        SLL     R1,     2                       ; 669C   004D
        SUBR    R1,     R0                      ; 669D   0108

        JSR     R5,     X_RAND2                 ; 669E   0004 0114 029E

        ADDI    #$0010, R0                      ; 66A1   02F8 0010
        MVO     R0,     G_01D0                  ; 66A3   0240 01D0
        CLRR    R0                              ; 66A5   01C0
        MVO     R0,     G_01D1                  ; 66A6   0240 01D1
        B       L_66B7                          ; 66A8   0200 000D

L_66AA:
        MVI     G_01D0, R0                      ; 66AA   0280 01D0
        DECR    R0                              ; 66AC   0010
        BMI     L_6697                          ; 66AD   022B 0017

        MVO     R0,     G_01D0                  ; 66AF   0240 01D0
        BNEQ    L_66B7                          ; 66B1   020C 0004

        MVII    #$0004, R0                      ; 66B3   02B8 0004
        MVO     R0,     G_01D1                  ; 66B5   0240 01D1
L_66B7:
        MVI     G_0194, R0                      ; 66B7   0280 0194
        DECR    R0                              ; 66B9   0010
        BMI     L_670D                          ; 66BA   020B 0051

        MVO     R0,     G_0194                  ; 66BC   0240 0194
        CLRR    R1                              ; 66BE   01C9
        MVO     R1,     G_0332                  ; 66BF   0241 0332
        MVO     R1,     G_033A                  ; 66C1   0241 033A
        MVII    #$0005, R1                      ; 66C3   02B9 0005
        MVO     R1,     G_0339                  ; 66C5   0241 0339
        TSTR    R0                              ; 66C7   0080
        BNEQ    L_670D                          ; 66C8   020C 0043

        MVI     G_0192, R2                      ; 66CA   0282 0192
        SWAP    R2,     1                       ; 66CC   0042
        ADD     G_032F, R2                      ; 66CD   02C2 032F
        MVO     R2,     G_032F                  ; 66CF   0242 032F
        MVO     R2,     G_0337                  ; 66D1   0242 0337
        MVI     G_0330, R3                      ; 66D3   0283 0330
        SWAP    R3,     1                       ; 66D5   0043
        ADD     G_0195, R3                      ; 66D6   02C3 0195
        ANDI    #$007F, R3                      ; 66D8   03BB 007F
        CMPI    #$0050, R3                      ; 66DA   037B 0050
        BLE     L_66E0                          ; 66DC   0206 0002

        MVII    #$0050, R3                      ; 66DE   02BB 0050
L_66E0:
        MOVR    R3,     R2                      ; 66E0   009A
        ANDI    #$000F, R2                      ; 66E1   03BA 000F
        BEQ     L_66F2                          ; 66E3   0204 000D

        CMPI    #$000E, R2                      ; 66E5   037A 000E
        BGE     L_66EF                          ; 66E7   020D 0006

        CMPI    #$0002, R2                      ; 66E9   037A 0002
        BGT     L_66FD                          ; 66EB   020E 0010

        DECR    R3                              ; 66ED   0013
        INCR    R7                              ; 66EE   000F

L_66EF:
        INCR    R3                              ; 66EF   000B
L_66F0:
        B       L_66E0                          ; 66F0   0220 0011

L_66F2:
        SWAP    R3,     1                       ; 66F2   0043
        MVO     R3,     G_0330                  ; 66F3   0243 0330
        CLRR    R0                              ; 66F5   01C0
        MVO     R0,     G_0191                  ; 66F6   0240 0191

        JSR     R5,     L_63E4                  ; 66F8   0004 0160 03E4

        B       L_670D                          ; 66FB   0200 0010

L_66FD:
        SWAP    R3,     1                       ; 66FD   0043
        MVO     R3,     G_0330                  ; 66FE   0243 0330
        SDBD                                    ; 6700   0001
        ADDI    #$0500, R3                      ; 6701   02FB 0000 0005
        MVO     R3,     G_0338                  ; 6704   0243 0338
        MVII    #$0003, R0                      ; 6706   02B8 0003
        MVO     R0,     G_0194                  ; 6708   0240 0194

        JSR     R5,     L_6C47                  ; 670A   0004 016C 0047

L_670D:
        MVI     G_019E, R0                      ; 670D   0280 019E
        TSTR    R0                              ; 670F   0080
        BNEQ    L_67F0                          ; 6710   020C 00DE

        MVI     G_01D5, R0                      ; 6712   0280 01D5
        DECR    R0                              ; 6714   0010
        BMI     L_6751                          ; 6715   020B 003A

        MVO     R0,     G_01D5                  ; 6717   0240 01D5
        BNEQ    L_679D                          ; 6719   020C 0082

        MVI     G_01D6, R0                      ; 671B   0280 01D6
        INCR    R0                              ; 671D   0008
        CMPI    #$0002, R0                      ; 671E   0378 0002
        BGT     L_673A                          ; 6720   020E 0018
        BLT     L_673E                          ; 6722   0205 001A

        SDBD                                    ; 6724   0001
        MVII    #$58CB, R1                      ; 6725   02B9 00CB 0058
        MVII    #$034D, R2                      ; 6728   02BA 034D

        JSR     R5,     X_INIT_MOB              ; 672A   0004 0114 02B2

        MVI     G_01D9, R0                      ; 672D   0280 01D9
        ADDI    #$0008, R0                      ; 672F   02F8 0008
        SWAP    R0,     1                       ; 6731   0040
        MVO     R0,     G_0350                  ; 6732   0240 0350
        MVII    #$0002, R0                      ; 6734   02B8 0002
        MVII    #$000A, R1                      ; 6736   02B9 000A
        B       L_6740                          ; 6738   0200 0006

L_673A:
        CLRR    R0                              ; 673A   01C0
        CLRR    R1                              ; 673B   01C9
        B       L_6740                          ; 673C   0200 0002

L_673E:
        MVII    #$000C, R1                      ; 673E   02B9 000C
L_6740:
        MVO     R0,     G_01D6                  ; 6740   0240 01D6
        MVO     R1,     G_01D5                  ; 6742   0241 01D5
        INCR    R0                              ; 6744   0008
        MVO     R0,     G_01D7                  ; 6745   0240 01D7
        DECR    R0                              ; 6747   0010
        BNEQ    L_679D                          ; 6748   020C 0053

        MVII    #$01D4, R4                      ; 674A   02BC 01D4

        JSR     R5,     L_675C                  ; 674C   0004 0164 035C

        B       L_679D                          ; 674F   0200 004C

L_6751:
        MVII    #$01D4, R4                      ; 6751   02BC 01D4
        SDBD                                    ; 6753   0001
        MVII    #$6A5C, R3                      ; 6754   02BB 005C 006A

        JSR     R5,     L_676B                  ; 6757   0004 0164 036B

        B       L_679D                          ; 675A   0200 0041

L_675C:
        PSHR    R5                              ; 675C   0275
L_675D:
        MVII    #$00C8, R0                      ; 675D   02B8 00C8
        MVI     G_017E, R1                      ; 675F   0281 017E
        SWAP    R1,     1                       ; 6761   0041
        SARC    R1,     2                       ; 6762   007D
        SUBR    R1,     R0                      ; 6763   0108

        JSR     R5,     X_RAND2                 ; 6764   0004 0114 029E

        ADDI    #$0019, R0                      ; 6767   02F8 0019
        MVO@    R0,     R4                      ; 6769   0260
        PULR    R7                              ; 676A   02B7

L_676B:
        PSHR    R5                              ; 676B   0275
        MOVR    R4,     R2                      ; 676C   00A2
        MVI     G_0180, R0                      ; 676D   0280 0180
        ANDI    #$0003, R0                      ; 676F   03B8 0003
        BEQ     L_679C                          ; 6771   0204 0029

        MVI@    R2,     R0                      ; 6773   0290
        DECR    R0                              ; 6774   0010
        BMI     L_675D                          ; 6775   022B 0019

        MVO@    R0,     R2                      ; 6777   0250
        BNEQ    L_679C                          ; 6778   020C 0022

        MVI     G_017A, R1                      ; 677A   0281 017A
        SUBI    #$0002, R1                      ; 677C   0339 0002
        SLL     R1,     1                       ; 677E   0049
        MVI     G_0330, R0                      ; 677F   0280 0330
        SWAP    R0,     1                       ; 6781   0040
        ANDI    #$00F0, R0                      ; 6782   03B8 00F0
        ADDI    #$0005, R2                      ; 6784   02FA 0005
        MVO@    R0,     R2                      ; 6786   0250
        SUBI    #$0020, R0                      ; 6787   0338 0020
        SLR     R0,     2                       ; 6789   0064
        SLR     R0,     2                       ; 678A   0064
        ADDR    R1,     R0                      ; 678B   00C8
        MOVR    R0,     R1                      ; 678C   0081
        SLL     R0,     1                       ; 678D   0048
        ADDR    R1,     R0                      ; 678E   00C8
        ADDR    R0,     R3                      ; 678F   00C3
        MVI@    R3,     R1                      ; 6790   0299
        TSTR    R1                              ; 6791   0089
        BEQ     L_675D                          ; 6792   0224 0036

        INCR    R0                              ; 6794   0008
        DECR    R2                              ; 6795   0012
        MVO@    R0,     R2                      ; 6796   0250
        MVII    #$000C, R0                      ; 6797   02B8 000C
        MOVR    R4,     R2                      ; 6799   00A2
        INCR    R2                              ; 679A   000A
        MVO@    R0,     R2                      ; 679B   0250
L_679C:
        PULR    R7                              ; 679C   02B7

L_679D:
        MVI     G_01DB, R0                      ; 679D   0280 01DB
        DECR    R0                              ; 679F   0010
        BMI     L_67E7                          ; 67A0   020B 0045

        MVO     R0,     G_01DB                  ; 67A2   0240 01DB
        BNEQ    L_67F0                          ; 67A4   020C 004A

        MVI     G_01DC, R0                      ; 67A6   0280 01DC
        INCR    R0                              ; 67A8   0008
        CMPI    #$0002, R0                      ; 67A9   0378 0002
        BGT     L_67D0                          ; 67AB   020E 0023
        BLT     L_67D4                          ; 67AD   0205 0025

        SDBD                                    ; 67AF   0001
        MVII    #$58E4, R1                      ; 67B0   02B9 00E4 0058
        MVII    #$0355, R2                      ; 67B3   02BA 0355

        JSR     R5,     X_INIT_MOB              ; 67B5   0004 0114 02B2

        MVI     G_01DE, R0                      ; 67B8   0280 01DE
        CMPI    #$000D, R0                      ; 67BA   0378 000D
        BNEQ    L_67C3                          ; 67BC   020C 0005

        MVII    #$0090, R0                      ; 67BE   02B8 0090
        SWAP    R0,     1                       ; 67C0   0040
        MVO     R0,     G_0357                  ; 67C1   0240 0357
L_67C3:
        MVI     G_01DF, R0                      ; 67C3   0280 01DF
        ADDI    #$0008, R0                      ; 67C5   02F8 0008
        SWAP    R0,     1                       ; 67C7   0040
        MVO     R0,     G_0358                  ; 67C8   0240 0358
        MVII    #$0002, R0                      ; 67CA   02B8 0002
        MVII    #$000A, R1                      ; 67CC   02B9 000A
        B       L_67D6                          ; 67CE   0200 0006

L_67D0:
        CLRR    R0                              ; 67D0   01C0
        CLRR    R1                              ; 67D1   01C9
        B       L_67D6                          ; 67D2   0200 0002

L_67D4:
        MVII    #$000C, R1                      ; 67D4   02B9 000C
L_67D6:
        MVO     R0,     G_01DC                  ; 67D6   0240 01DC
        MVO     R1,     G_01DB                  ; 67D8   0241 01DB
        INCR    R0                              ; 67DA   0008
        MVO     R0,     G_01DD                  ; 67DB   0240 01DD
        DECR    R0                              ; 67DD   0010
        BNEQ    L_67F0                          ; 67DE   020C 0010

        MVII    #$01DA, R4                      ; 67E0   02BC 01DA

        JSR     R5,     L_675C                  ; 67E2   0004 0164 035C

        B       L_67F0                          ; 67E5   0200 0009

L_67E7:
        MVII    #$01DA, R4                      ; 67E7   02BC 01DA
        SDBD                                    ; 67E9   0001
        MVII    #$6A38, R3                      ; 67EA   02BB 0038 006A

        JSR     R5,     L_676B                  ; 67ED   0004 0164 036B

L_67F0:
        MVI     G_0196, R0                      ; 67F0   0280 0196
        DECR    R0                              ; 67F2   0010
        BMI     L_6810                          ; 67F3   020B 001B

        MVO     R0,     G_0196                  ; 67F5   0240 0196
        BEQ     L_680D                          ; 67F7   0204 0014

        CMPI    #$0003, R0                      ; 67F9   0378 0003
        BGE     L_6817                          ; 67FB   020D 001A

        MVII    #$0005, R0                      ; 67FD   02B8 0005
        MVO     R0,     G_0339                  ; 67FF   0240 0339
        SDBD                                    ; 6801   0001
        MVII    #$5861, R4                      ; 6802   02BC 0061 0058
        MVO     R4,     G_032E                  ; 6805   0244 032E
        SUBI    #$0015, R4                      ; 6807   033C 0015
        MVO     R4,     G_0336                  ; 6809   0244 0336
        B       L_6817                          ; 680B   0200 000A

L_680D:
        JSR     R5,     L_6180                  ; 680D   0004 0160 0180

L_6810:
        MVI     G_0197, R0                      ; 6810   0280 0197
        DECR    R0                              ; 6812   0010
        BMI     L_6817                          ; 6813   020B 0002

        MVO     R0,     G_0197                  ; 6815   0240 0197
L_6817:
        MVI     G_0198, R0                      ; 6817   0280 0198
        DECR    R0                              ; 6819   0010
        BMI     L_6863                          ; 681A   020B 0047

        MVO     R0,     G_0198                  ; 681C   0240 0198
        BEQ     L_6854                          ; 681E   0204 0034

        MOVR    R0,     R1                      ; 6820   0081
        ANDI    #$0003, R1                      ; 6821   03B9 0003
        BNEQ    L_68A6                          ; 6823   020C 0081

        MOVR    R0,     R1                      ; 6825   0081
        DECR    R1                              ; 6826   0011
        ANDI    #$0072, R1                      ; 6827   03B9 0072
        MVO     R1,     G_0198                  ; 6829   0241 0198
        SARC    R0,     2                       ; 682B   007C
        SARC    R0,     2                       ; 682C   007C
        MVI     G_0199, R1                      ; 682D   0281 0199
        ADDI    #$0200, R1                      ; 682F   02F9 0200
        SDBD                                    ; 6831   0001
        MVII    #$18CD, R2                      ; 6832   02BA 00CD 0018
        SARC    R0,     1                       ; 6835   0078
        BC      L_6842                          ; 6836   0201 000A

        MVO@    R2,     R1                      ; 6838   024A
        DECR    R1                              ; 6839   0011
        SUBI    #$0008, R2                      ; 683A   033A 0008
        CMPI    #$0002, R0                      ; 683C   0378 0002
        BNEQ    L_6851                          ; 683E   020C 0011
        B       L_684D                          ; 6840   0200 000B

L_6842:
        CLRR    R3                              ; 6842   01DB
        MVO@    R3,     R1                      ; 6843   024B
        SUBI    #$0010, R2                      ; 6844   033A 0010
        DECR    R1                              ; 6846   0011
        MVO     R1,     G_0199                  ; 6847   0241 0199
        CMPI    #$0001, R0                      ; 6849   0378 0001
        BNEQ    L_6851                          ; 684B   020C 0004

L_684D:
        SDBD                                    ; 684D   0001
        XORI    #$2000, R2                      ; 684E   03FA 0000 0020
L_6851:
        MVO@    R2,     R1                      ; 6851   024A
        B       L_68A6                          ; 6852   0200 0052

L_6854:
        SDBD                                    ; 6854   0001
        MVII    #$08AF, R2                      ; 6855   02BA 00AF 0008
        MVII    #$0259, R1                      ; 6858   02B9 0259
        MVO@    R2,     R1                      ; 685A   024A
        MVO     R1,     G_0199                  ; 685B   0241 0199
        MVII    #$00A1, R0                      ; 685D   02B8 00A1
        MVO     R0,     G_019A                  ; 685F   0240 019A
        B       L_68A6                          ; 6861   0200 0043

L_6863:
        MVI     G_019A, R0                      ; 6863   0280 019A
        DECR    R0                              ; 6865   0010
        BMI     L_68A6                          ; 6866   020B 003E

        MVO     R0,     G_019A                  ; 6868   0240 019A
        BNEQ    L_6874                          ; 686A   020C 0008

        MVII    #$02FB, R4                      ; 686C   02BC 02FB
        MVO     R4,     .BTAB.BD                ; 686E   0244 02BD
        MVO     R4,     .BTAB.D1                ; 6870   0244 02D1
        B       L_68A6                          ; 6872   0200 0032

L_6874:
        MOVR    R0,     R1                      ; 6874   0081
        ANDI    #$0003, R1                      ; 6875   03B9 0003
        BNEQ    L_68A6                          ; 6877   020C 002D

        MOVR    R0,     R1                      ; 6879   0081
        DECR    R1                              ; 687A   0011
        ANDI    #$00F1, R1                      ; 687B   03B9 00F1
        MVO     R1,     G_019A                  ; 687D   0241 019A
        SARC    R0,     2                       ; 687F   007C
        SARC    R0,     2                       ; 6880   007C
        MVI     G_0199, R1                      ; 6881   0281 0199
        ADDI    #$0200, R1                      ; 6883   02F9 0200
        SDBD                                    ; 6885   0001
        MVII    #$08D7, R2                      ; 6886   02BA 00D7 0008
        SARC    R0,     1                       ; 6889   0078
        BNC     L_6893                          ; 688A   0209 0007

        MVO@    R2,     R1                      ; 688C   024A
        ADDI    #$0014, R1                      ; 688D   02F9 0014
        ADDI    #$0008, R2                      ; 688F   02FA 0008
        BNEQ    L_68A5                          ; 6891   020C 0012

L_6893:
        CLRR    R3                              ; 6893   01DB
        MVO@    R3,     R1                      ; 6894   024B
        SUBI    #$0028, R2                      ; 6895   033A 0028
        ADDI    #$0014, R1                      ; 6897   02F9 0014
        MVO     R1,     G_0199                  ; 6899   0241 0199
        CMPI    #$0002, R0                      ; 689B   0378 0002
        BNEQ    L_68A5                          ; 689D   020C 0006

        SDBD                                    ; 689F   0001
        MVII    #$08A6, R4                      ; 68A0   02BC 00A6 0008
        MVO     R4,     .BTAB.95                ; 68A3   0244 0295
L_68A5:
        MVO@    R2,     R1                      ; 68A5   024A
L_68A6:
        MVI     G_0102, R0                      ; 68A6   0280 0102
        CMPI    #$0002, R0                      ; 68A8   0378 0002
        BGT     L_68A6                          ; 68AA   022E 0005

        MVI     G_019C, R0                      ; 68AC   0280 019C
        SWAP    R0,     1                       ; 68AE   0040
        XOR     G_019B, R0                      ; 68AF   03C0 019B
        DECR    R0                              ; 68B1   0010
        BMI     L_68F7                          ; 68B2   020B 0043
        BNEQ    L_68F0                          ; 68B4   020C 003A

        SDBD                                    ; 68B6   0001
        MVII    #$08B5, R2                      ; 68B7   02BA 00B5 0008
        MVII    #$0278, R1                      ; 68BA   02B9 0278
        CLRR    R3                              ; 68BC   01DB
        MVI     G_017A, R0                      ; 68BD   0280 017A
        CMPI    #$0004, R0                      ; 68BF   0378 0004
        BGT     L_68D1                          ; 68C1   020E 000E
        BLT     L_68D5                          ; 68C3   0205 0010

        SDBD                                    ; 68C5   0001
        MVII    #$1000, R3                      ; 68C6   02BB 0000 0010
        MVII    #$02B2, R1                      ; 68C9   02B9 02B2
        SDBD                                    ; 68CB   0001
        MVII    #$185D, R2                      ; 68CC   02BA 005D 0018
        B       L_68D5                          ; 68CF   0200 0004

L_68D1:
        MVII    #$0289, R1                      ; 68D1   02B9 0289
        ADDI    #$0010, R2                      ; 68D3   02FA 0010
L_68D5:
        MVI     G_019D, R5                      ; 68D5   0285 019D
        XORI    #$0001, R5                      ; 68D7   03FD 0001
        MVO     R5,     G_019D                  ; 68D9   0245 019D
        BEQ     L_68E0                          ; 68DB   0204 0003

        MOVR    R3,     R4                      ; 68DD   009C
        MOVR    R2,     R3                      ; 68DE   0093
        MOVR    R4,     R2                      ; 68DF   00A2
L_68E0:
        MVO@    R3,     R1                      ; 68E0   024B
        ADDI    #$0028, R1                      ; 68E1   02F9 0028
        CMPI    #$0006, R0                      ; 68E3   0378 0006
        BNEQ    L_68E8                          ; 68E5   020C 0001

        INCR    R1                              ; 68E7   0009
L_68E8:
        MVO@    R2,     R1                      ; 68E8   024A
        MVII    #$00E1, R0                      ; 68E9   02B8 00E1

        JSR     R5,     X_RAND2                 ; 68EB   0004 0114 029E

        ADDI    #$004C, R0                      ; 68EE   02F8 004C
L_68F0:
        MVO     R0,     G_019B                  ; 68F0   0240 019B
        SWAP    R0,     1                       ; 68F2   0040
        MVO     R0,     G_019C                  ; 68F3   0240 019C
        B       L_6908                          ; 68F5   0200 0011

L_68F7:
        MVI     G_019E, R0                      ; 68F7   0280 019E
        DECR    R0                              ; 68F9   0010
        BMI     L_6908                          ; 68FA   020B 000C

        MVO     R0,     G_019E                  ; 68FC   0240 019E
        CMPI    #$0003, R0                      ; 68FE   0378 0003
        BNEQ    L_6908                          ; 6900   020C 0006

        MVI     G_0335, R1                      ; 6902   0281 0335
        XORI    #$0004, R1                      ; 6904   03F9 0004
        MVO     R1,     G_0335                  ; 6906   0241 0335
L_6908:
        MVI     G_017A, R0                      ; 6908   0280 017A
        CMPI    #$0006, R0                      ; 690A   0378 0006
        BNEQ    L_6A32                          ; 690C   020C 0124

        MVI     G_01A3, R0                      ; 690E   0280 01A3
        DECR    R0                              ; 6910   0010
        BMI     L_6919                          ; 6911   020B 0006
        BEQ     L_6919                          ; 6913   0204 0004

        MVO     R0,     G_01A3                  ; 6915   0240 01A3
        B       L_69A8                          ; 6917   0200 008F

L_6919:
        MVI     G_01A1, R0                      ; 6919   0280 01A1
        DECR    R0                              ; 691B   0010
        BPL     L_6920                          ; 691C   0203 0002

        MVII    #$0050, R0                      ; 691E   02B8 0050
L_6920:
        MVO     R0,     G_01A1                  ; 6920   0240 01A1
        MOVR    R0,     R1                      ; 6922   0081
        ANDI    #$0003, R1                      ; 6923   03B9 0003
        BNEQ    L_69A8                          ; 6925   020C 0081

        MOVR    R0,     R1                      ; 6927   0081
        DECR    R1                              ; 6928   0011
        ANDI    #$0072, R1                      ; 6929   03B9 0072
        MVO     R1,     G_01A1                  ; 692B   0241 01A1
        SARC    R0,     2                       ; 692D   007C
        SARC    R0,     2                       ; 692E   007C
        SDBD                                    ; 692F   0001
        MVII    #$08CF, R2                      ; 6930   02BA 00CF 0008
        MVI     G_01A0, R3                      ; 6933   0283 01A0
        MVI     G_032F, R4                      ; 6935   0284 032F
        MVI     G_01A2, R1                      ; 6937   0281 01A2
        SWAP    R1,     1                       ; 6939   0041
        PSHR    R1                              ; 693A   0271
        SLL     R1,     2                       ; 693B   004D
        ADD@    R6,     R1                      ; 693C   02F1
        SARC    R3,     1                       ; 693D   007B
        BNEQ    L_6967                          ; 693E   020C 0027

        ADDR    R1,     R4                      ; 6940   00CC
        MVO     R4,     G_032F                  ; 6941   0244 032F
        MVII    #$026F, R1                      ; 6943   02B9 026F
        SARC    R0,     1                       ; 6945   0078
        BC      L_695D                          ; 6946   0201 0015

        SUBR    R0,     R1                      ; 6948   0101
        MVO@    R2,     R1                      ; 6949   024A
        CLRR    R4                              ; 694A   01E4
        MVO     R4,     .BTAB.6C                ; 694B   0244 026C
        CMPI    #$0001, R0                      ; 694D   0378 0001
        SDBD                                    ; 694F   0001
        MVII    #$08F2, R4                      ; 6950   02BC 00F2 0008
        MVII    #$026E, R5                      ; 6953   02BD 026E
        BNEQ    L_698E                          ; 6955   020C 0037

        SUBI    #$0048, R4                      ; 6957   033C 0048
        DECR    R5                              ; 6959   0015
        MVO@    R4,     R5                      ; 695A   026C
        B       L_69A8                          ; 695B   0200 004B

L_695D:
        ADDI    #$0010, R2                      ; 695D   02FA 0010
        SUBR    R0,     R1                      ; 695F   0101
        MVO@    R2,     R1                      ; 6960   024A
        SUBI    #$0008, R2                      ; 6961   033A 0008
        DECR    R1                              ; 6963   0011
        MVO@    R2,     R1                      ; 6964   024A
        B       L_69A8                          ; 6965   0200 0041

L_6967:
        SUBR    R1,     R4                      ; 6967   010C
        MVO     R4,     G_032F                  ; 6968   0244 032F
        MVII    #$026C, R1                      ; 696A   02B9 026C
        SARC    R0,     1                       ; 696C   0078
        BC      L_6984                          ; 696D   0201 0015

        ADDR    R0,     R1                      ; 696F   00C1
        MVO@    R2,     R1                      ; 6970   024A
        CLRR    R4                              ; 6971   01E4
        MVO     R4,     .BTAB.6F                ; 6972   0244 026F
        CMPI    #$0001, R0                      ; 6974   0378 0001
        SDBD                                    ; 6976   0001
        MVII    #$08AA, R4                      ; 6977   02BC 00AA 0008
        MVII    #$026D, R5                      ; 697A   02BD 026D
        BNEQ    L_698E                          ; 697C   020C 0010

        ADDI    #$0048, R4                      ; 697E   02FC 0048
        INCR    R5                              ; 6980   000D
        MVO@    R4,     R5                      ; 6981   026C
        B       L_69A8                          ; 6982   0200 0024

L_6984:
        ADDI    #$0008, R2                      ; 6984   02FA 0008
        ADDR    R0,     R1                      ; 6986   00C1
        MVO@    R2,     R1                      ; 6987   024A
        INCR    R1                              ; 6988   0009
        ADDI    #$0008, R2                      ; 6989   02FA 0008
        MVO@    R2,     R1                      ; 698B   024A
        B       L_69A8                          ; 698C   0200 001A

L_698E:
        TSTR    R0                              ; 698E   0080
        BNEQ    L_69A8                          ; 698F   020C 0017

        MVO@    R4,     R5                      ; 6991   026C
        MVO     R0,     G_01A1                  ; 6992   0240 01A1
        MVI     G_01A0, R0                      ; 6994   0280 01A0
        ADDI    #$0002, R0                      ; 6996   02F8 0002
        ANDI    #$0002, R0                      ; 6998   03B8 0002
        MVO     R0,     G_01A0                  ; 699A   0240 01A0
        MVI     G_01A2, R0                      ; 699C   0280 01A2
        TSTR    R0                              ; 699E   0080
        BEQ     L_69A4                          ; 699F   0204 0003

        JSR     R5,     L_6180                  ; 69A1   0004 0160 0180

L_69A4:
        MVII    #$0036, R0                      ; 69A4   02B8 0036
        MVO     R0,     G_01A3                  ; 69A6   0240 01A3
L_69A8:
        MVI     G_01E6, R0                      ; 69A8   0280 01E6
        CMPI    #$0001, R0                      ; 69AA   0378 0001
        BLT     L_6A32                          ; 69AC   0205 0084
        BNEQ    L_69DA                          ; 69AE   020C 002A

        MVI     G_01E5, R1                      ; 69B0   0281 01E5
        SWAP    R1,     1                       ; 69B2   0041
        XOR     G_01E4, R1                      ; 69B3   03C1 01E4
        DECR    R1                              ; 69B5   0011
        BMI     L_69BF                          ; 69B6   020B 0007

        MVO     R1,     G_01E4                  ; 69B8   0241 01E4
        SWAP    R1,     1                       ; 69BA   0041
        MVO     R1,     G_01E5                  ; 69BB   0241 01E5
        B       L_6A32                          ; 69BD   0200 0073

L_69BF:
        INCR    R0                              ; 69BF   0008
        MVO     R0,     G_01E6                  ; 69C0   0240 01E6
        MVO     R0,     G_01C3                  ; 69C2   0240 01C3
        CLRR    R0                              ; 69C4   01C0
        MVO     R0,     G_01B7                  ; 69C5   0240 01B7
        MVI     G_035E, R1                      ; 69C7   0281 035E
        ANDI    #$0031, R1                      ; 69C9   03B9 0031
        ADDI    #$0025, R1                      ; 69CB   02F9 0025
        SARC    R1,     1                       ; 69CD   0079
        MVO     R1,     G_01AF                  ; 69CE   0241 01AF
        NOP                                     ; 69D0   0034
        RLC     R0,     1                       ; 69D1   0050
        MVO     R0,     G_01BF                  ; 69D2   0240 01BF
        MVII    #$0008, R0                      ; 69D4   02B8 0008
        MVO     R0,     G_01B3                  ; 69D6   0240 01B3
        B       L_6A32                          ; 69D8   0200 0058

L_69DA:
        MVI     G_01AF, R1                      ; 69DA   0281 01AF
        DECR    R1                              ; 69DC   0011
        BMI     L_69FB                          ; 69DD   020B 001C

        MVO     R1,     G_01AF                  ; 69DF   0241 01AF
        ANDI    #$0003, R1                      ; 69E1   03B9 0003
        BNEQ    L_69EB                          ; 69E3   020C 0006

        MVI     G_01BB, R1                      ; 69E5   0281 01BB
        XORI    #$0018, R1                      ; 69E7   03F9 0018
        MVO     R1,     G_01BB                  ; 69E9   0241 01BB
L_69EB:
        MVI     G_01B7, R0                      ; 69EB   0280 01B7
        ADD     G_01C3, R0                      ; 69ED   02C0 01C3
        ANDI    #$007F, R0                      ; 69EF   03B8 007F
        MVO     R0,     G_01B7                  ; 69F1   0240 01B7
        MVI     G_01B3, R0                      ; 69F3   0280 01B3
        ADD     G_01BF, R0                      ; 69F5   02C0 01BF
        MVO     R0,     G_01B3                  ; 69F7   0240 01B3
        B       L_6A32                          ; 69F9   0200 0037

L_69FB:
        INCR    R0                              ; 69FB   0008
        MVO     R0,     G_01E6                  ; 69FC   0240 01E6
        CMPI    #$0004, R0                      ; 69FE   0378 0004
        BEQ     L_6A2A                          ; 6A00   0204 0028
        BLT     L_6A14                          ; 6A02   0205 0010

        MVII    #$0001, R0                      ; 6A04   02B8 0001
        MVO     R0,     G_01E6                  ; 6A06   0240 01E6
        MVII    #$0300, R0                      ; 6A08   02B8 0300

        JSR     R5,     X_RAND2                 ; 6A0A   0004 0114 029E

        MVO     R0,     G_01E4                  ; 6A0D   0240 01E4
        SWAP    R0,     1                       ; 6A0F   0040
        MVO     R0,     G_01E5                  ; 6A10   0240 01E5
        B       L_6A32                          ; 6A12   0200 001E

L_6A14:
        CLRR    R0                              ; 6A14   01C0
        MVO     R0,     G_01C3                  ; 6A15   0240 01C3
        MVII    #$0002, R0                      ; 6A17   02B8 0002
        MVO     R0,     G_01BF                  ; 6A19   0240 01BF
        MVI     G_035E, R1                      ; 6A1B   0281 035E
        ANDI    #$003F, R1                      ; 6A1D   03B9 003F
        MVII    #$00A0, R0                      ; 6A1F   02B8 00A0
        SUBR    R1,     R0                      ; 6A21   0108
L_6A22:
        SUB     G_01B3, R0                      ; 6A22   0300 01B3
        SARC    R0,     1                       ; 6A24   0078
        INCR    R0                              ; 6A25   0008
        MVO     R0,     G_01AF                  ; 6A26   0240 01AF
        B       L_6A32                          ; 6A28   0200 0008

L_6A2A:
        MVII    #$00FC, R0                      ; 6A2A   02B8 00FC
        MVO     R0,     G_01C3                  ; 6A2C   0240 01C3
        MVII    #$00C0, R0                      ; 6A2E   02B8 00C0
        B       L_6A22                          ; 6A30   0220 000F

L_6A32:
        MVI     G_0149, R0                      ; 6A32   0280 0149
        TSTR    R0                              ; 6A34   0080
        BEQ     L_6B44                          ; 6A35   0204 010D
        PULR    R7                              ; 6A37   02B7

        DECLE   $0000,  $0000,  $0000,  $0276   ; 6A38   0000 0000 0000 0276
        DECLE   $0026,  $0026,  $029E,  $0026   ; 6A3C   0026 0026 029E 0026
        DECLE   $0026,  $02C6,  $0026,  $0026   ; 6A40   0026 02C6 0026 0026
        DECLE   $0000,  $0000,  $0000,  $0275   ; 6A44   0000 0000 0000 0275
        DECLE   $0020,  $0018,  $029E,  $0033   ; 6A48   0020 0018 029E 0033
        DECLE   $0018,  $02C6,  $0033,  $0018   ; 6A4C   0018 02C6 0033 0018
        DECLE   $024E,  $0000,  $0000           ; 6A50   024E 0000 0000

        PSHR    R6                              ; 6A53   0276
        MOVR    R3,     R7                      ; 6A54   009F

        DECLE   $0008,  $029E,  $0000,  $0000   ; 6A55   0008 029E 0000 0000
        DECLE   $02C6,  $0026,  $0028,  $0000   ; 6A59   02C6 0026 0028 0000
        DECLE   $0000,  $0000,  $0264,  $002E   ; 6A5D   0000 0000 0264 002E
        DECLE   $0026,  $028C,  $002E,  $0006   ; 6A61   0026 028C 002E 0006
        DECLE   $02B4,  $002E,  $0006,  $023C   ; 6A65   02B4 002E 0006 023C
        DECLE   $0000,  $0000,  $0265,  $0000   ; 6A69   0000 0000 0265 0000
        DECLE   $0000,  $028C,  $0033,  $0008   ; 6A6D   0000 028C 0033 0008
        DECLE   $02B4,  $0000,  $0000,  $023C   ; 6A71   02B4 0000 0000 023C
        DECLE   $0000,  $0000                   ; 6A75   0000 0000

        MVO@    R4,     R4                      ; 6A77   0264
        MOVR    R3,     R7                      ; 6A78   009F

        DECLE   $0008,  $028C,  $0000,  $0000   ; 6A79   0008 028C 0000 0000

        PULR    R4                              ; 6A7D   02B4
        MOVR    R7,     R2                      ; 6A7E   00BA
        INCR    R0                              ; 6A7F   0008
UC_6A80:
        PSHR    R4                              ; 6A80  SLIB UCALL target

        JSR     R5,     .EXEC.A83               ; 6A81   0004 0118 0283

        MVII    #$0001, R1                      ; 6A84   02B9 0001
        MVO     R1,     G_0147                  ; 6A86   0241 0147
        PULR    R4                              ; 6A88   02B4
        PULR    R7                              ; 6A89   02B7

        MVII    #$00F0, R3                      ; 6A8A   02BB 00F0

L_6A8C:
        JSR     R4,     .EXEC.A76               ; 6A8C   0004 0018 0276

        MVII    #$0001, R0                      ; 6A8F   02B8 0001
        MVO     R0,     G_0147                  ; 6A91   0240 0147
        J       X_PLAY_MUS1                     ; 6A93   0004 0318 0327

L_6A96:
        PSHR    R5                              ; 6A96   0275

        JSR     R5,     X_PLAY_SFX2             ; 6A97   0004 0118 03BE
        DECLE   $00F0                           ; 6A9A  SFX prio
        DECLE   $0077,  $0080,  $006A           ; 6A9B  SFX data
        DECLE   $0380,  $011D                   ; 6A9E  SFX data
        DECLE   $0388,  $023B                   ; 6AA0  SFX data
        DECLE   $0004,  $0141                   ; 6AA2  SFX data
        DECLE   $0389                           ; 6AA4  SFX data
        DECLE   $02EB                           ; 6AA5  SFX data
        DECLE   $0395                           ; 6AA6  SFX data
        DECLE   $0005                           ; 6AA7  SFX data
        DECLE   $02EB                           ; 6AA8  SFX data
        DECLE   $0384,  $01AB                   ; 6AA9  SFX data
        DECLE   $0385                           ; 6AAB  SFX data
        DECLE   $0025                           ; 6AAC  SFX data
        DECLE   $02EB                           ; 6AAD  SFX data
        DECLE   $03A5                           ; 6AAE  SFX data
        DECLE   $0015                           ; 6AAF  SFX data
        DECLE   $02EB                           ; 6AB0  SFX data
        DECLE   $0380,  $0356                   ; 6AB1  SFX data
        DECLE   $0395                           ; 6AB3  SFX data
        DECLE   $0025                           ; 6AB4  SFX data
        DECLE   $02EB                           ; 6AB5  SFX data
        DECLE   $03A5                           ; 6AB6  SFX data
        DECLE   $0005                           ; 6AB7  SFX data
        DECLE   $01EB                           ; 6AB8  SFX data
        DECLE   $0015                           ; 6AB9  SFX data
        DECLE   $00EB                           ; 6ABA  SFX data
        DECLE   $0380,  $0356                   ; 6ABB  SFX data
        DECLE   $0395                           ; 6ABD  SFX data
        DECLE   $0025                           ; 6ABE  SFX data
        DECLE   $02EB                           ; 6ABF  SFX data
        DECLE   $03A5                           ; 6AC0  SFX data
        DECLE   $0005                           ; 6AC1  SFX data
        DECLE   $02EB                           ; 6AC2  SFX data
        DECLE   $0380,  $0153                   ; 6AC3  SFX data
        DECLE   $0025                           ; 6AC5  SFX data
        DECLE   $02EB                           ; 6AC6  SFX data
        DECLE   $0380,  $017C                   ; 6AC7  SFX data
        DECLE   $03A5                           ; 6AC9  SFX data
        DECLE   $0015                           ; 6ACA  SFX data
        DECLE   $02EB                           ; 6ACB  SFX data
        DECLE   $0380,  $0356                   ; 6ACC  SFX data
        DECLE   $0395                           ; 6ACE  SFX data
        DECLE   $0025                           ; 6ACF  SFX data
        DECLE   $02EB                           ; 6AD0  SFX data
        DECLE   $0380,  $017C                   ; 6AD1  SFX data
        DECLE   $03A5                           ; 6AD3  SFX data
        DECLE   $0015                           ; 6AD4  SFX data
        DECLE   $02EB                           ; 6AD5  SFX data
        DECLE   $0380,  $0153                   ; 6AD6  SFX data
        DECLE   $0395                           ; 6AD8  SFX data
        DECLE   $0025                           ; 6AD9  SFX data
        DECLE   $02EB                           ; 6ADA  SFX data
        DECLE   $0388,  $017C                   ; 6ADB  SFX data
        DECLE   $0384,  $0141                   ; 6ADD  SFX data
        DECLE   $0005                           ; 6ADF  SFX data
        DECLE   $02EB                           ; 6AE0  SFX data
        DECLE   $0388,  $011D                   ; 6AE1  SFX data
        DECLE   $0385                           ; 6AE3  SFX data
        DECLE   $0015                           ; 6AE4  SFX data
        DECLE   $008F,  $0017                   ; 6AE5  SFX data
        DECLE   $0380,  $027F                   ; 6AE7  SFX data
        DECLE   $0388,  $00FE                   ; 6AE9  SFX data
        DECLE   $01EB                           ; 6AEB  SFX data
        DECLE   $0395                           ; 6AEC  SFX data
        DECLE   $0025                           ; 6AED  SFX data
        DECLE   $01EB                           ; 6AEE  SFX data
        DECLE   $03A5                           ; 6AEF  SFX data
        DECLE   $0015                           ; 6AF0  SFX data
        DECLE   $01EB                           ; 6AF1  SFX data
        DECLE   $0388,  $00D6                   ; 6AF2  SFX data
        DECLE   $01EB                           ; 6AF4  SFX data
        DECLE   $0388,  $00E2                   ; 6AF5  SFX data
        DECLE   $01EB                           ; 6AF7  SFX data
        DECLE   $0388,  $00FE                   ; 6AF8  SFX data
        DECLE   $01EB                           ; 6AFA  SFX data
        DECLE   $0380,  $01AB                   ; 6AFB  SFX data
        DECLE   $0384,  $011D                   ; 6AFD  SFX data
        DECLE   $0025                           ; 6AFF  SFX data
        DECLE   $01EB                           ; 6B00  SFX data
        DECLE   $03A5                           ; 6B01  SFX data
        DECLE   $0015                           ; 6B02  SFX data
        DECLE   $01EB                           ; 6B03  SFX data
        DECLE   $0395                           ; 6B04  SFX data
        DECLE   $0025                           ; 6B05  SFX data
        DECLE   $01EB                           ; 6B06  SFX data
        DECLE   $0384,  $0153                   ; 6B07  SFX data
        DECLE   $03EB                           ; 6B09  SFX data
        DECLE   $0384,  $011D                   ; 6B0A  SFX data
        DECLE   $00EB                           ; 6B0C  SFX data
        DECLE   $0015                           ; 6B0D  SFX data
        DECLE   $00EB                           ; 6B0E  SFX data
        DECLE   $0380,  $023B                   ; 6B0F  SFX data
        DECLE   $0395                           ; 6B11  SFX data
        DECLE   $00EB                           ; 6B12  SFX data
        DECLE   $01C5                           ; 6B13  SFX data
        DECLE   $01D5                           ; 6B14  SFX data
        DECLE   $00EB                           ; 6B15  SFX data
        DECLE   $0385                           ; 6B16  SFX data
        DECLE   $0395                           ; 6B17  SFX data
        DECLE   $00EB                           ; 6B18  SFX data
        DECLE   $01C5                           ; 6B19  SFX data
        DECLE   $01D5                           ; 6B1A  SFX data
        DECLE   $00EB                           ; 6B1B  SFX data
        DECLE   $0380,  $0141                   ; 6B1C  SFX data
        DECLE   $0395                           ; 6B1E  SFX data
        DECLE   $00EB                           ; 6B1F  SFX data
        DECLE   $01C5                           ; 6B20  SFX data
        DECLE   $01D5                           ; 6B21  SFX data
        DECLE   $00EB                           ; 6B22  SFX data
        DECLE   $0380,  $00FE                   ; 6B23  SFX data
        DECLE   $0388,  $0153                   ; 6B25  SFX data
        DECLE   $0015                           ; 6B27  SFX data
        DECLE   $00EB                           ; 6B28  SFX data
        DECLE   $01C5                           ; 6B29  SFX data
        DECLE   $01E5                           ; 6B2A  SFX data
        DECLE   $02EB                           ; 6B2B  SFX data
        DECLE   $0380,  $00E2                   ; 6B2C  SFX data
        DECLE   $0388,  $017C                   ; 6B2E  SFX data
        DECLE   $00EB                           ; 6B30  SFX data
        DECLE   $01C5                           ; 6B31  SFX data
        DECLE   $01E5                           ; 6B32  SFX data
        DECLE   $00EB                           ; 6B33  SFX data
        DECLE   $0388,  $01AB                   ; 6B34  SFX data
        DECLE   $0384,  $00D6                   ; 6B36  SFX data
        DECLE   $00EB                           ; 6B38  SFX data
        DECLE   $019D                           ; 6B39  SFX data
        DECLE   $0385                           ; 6B3A  SFX data
        DECLE   $0015                           ; 6B3B  SFX data
        DECLE   $00EB                           ; 6B3C  SFX data
        DECLE   $0005                           ; 6B3D  SFX data
        DECLE   $0395                           ; 6B3E  SFX data
        DECLE   $0083,  $03E4                   ; 6B3F  SFX data
        DECLE   $01EB                           ; 6B41  SFX data
        DECLE   $02CF                           ; 6B42  SFX end

L_6B43:
        PSHR    R5                              ; 6B43   0275
L_6B44:
        MVI     G_0185, R3                      ; 6B44   0283 0185
        TSTR    R3                              ; 6B46   009B
        BNEQ    L_6C7B                          ; 6B47   020C 0132

        MVII    #$0070, R3                      ; 6B49   02BB 0070

        JSR     R5,     L_6A8C                  ; 6B4B   0004 0168 028C
        DECLE   $00DC,  $00D4,  $0004,  $00DC   ; 6B4E   00DC 00D4 0004 00DC
        DECLE   $008C,  $0084,  $0004,  $008C   ; 6B52   008C 0084 0004 008C
        DECLE   $00DC,  $00D4,  $0004,  $00DC   ; 6B56   00DC 00D4 0004 00DC
        DECLE   $008C,  $008C,  $00DC,  $00CC   ; 6B5A   008C 008C 00DC 00CC
        DECLE   $00AC,  $00A4,  $0004,  $00AC   ; 6B5E   00AC 00A4 0004 00AC
        DECLE   $005C,  $0054,  $0004,  $005C   ; 6B62   005C 0054 0004 005C
        DECLE   $00AC,  $00A4,  $0004,  $00AC   ; 6B66   00AC 00A4 0004 00AC
        DECLE   $005C,  $005C,  $00AC,  $008C   ; 6B6A   005C 005C 00AC 008C
        DECLE   $006C,  $0064,  $0004,  $006C   ; 6B6E   006C 0064 0004 006C
        DECLE   $002C,  $0024,  $0004,  $0024   ; 6B72   002C 0024 0004 0024
        DECLE   $006C,  $0064,  $0004,  $006C   ; 6B76   006C 0064 0004 006C
        DECLE   $002C,  $002C,  $003C,  $005C   ; 6B7A   002C 002C 003C 005C
        DECLE   $008C,  $0084,  $0004,  $008C   ; 6B7E   008C 0084 0004 008C
        DECLE   $003C,  $0034,  $0004,  $003C   ; 6B82   003C 0034 0004 003C
        DECLE   $008C,  $0084,  $0004,  $0084   ; 6B86   008C 0084 0004 0084
        DECLE   $0004,  $008C,  $00AC,  $00C4   ; 6B8A   0004 008C 00AC 00C4
        DECLE   $0000                           ; 6B8E   0000

        B       L_6B44                          ; 6B8F   0220 004C

L_6B91:
        PSHR    R5                              ; 6B91   0275

        JSR     R5,     X_PLAY_SFX2             ; 6B92   0004 0118 03BE
        DECLE   $0088                           ; 6B95  SFX prio
        DECLE   $0077,  $0080,  $006A           ; 6B96  SFX data
        DECLE   $0380,  $00D6                   ; 6B99  SFX data
        DECLE   $03E9                           ; 6B9B  SFX data
        DECLE   $016B                           ; 6B9C  SFX data
        DECLE   $0380,  $00BF                   ; 6B9D  SFX data
        DECLE   $016B                           ; 6B9F  SFX data
        DECLE   $0380,  $00D6                   ; 6BA0  SFX data
        DECLE   $016B                           ; 6BA2  SFX data
        DECLE   $0380,  $00BF                   ; 6BA3  SFX data
        DECLE   $016B                           ; 6BA5  SFX data
        DECLE   $0380,  $00D6                   ; 6BA6  SFX data
        DECLE   $02EB                           ; 6BA8  SFX data
        DECLE   $0380,  $007F                   ; 6BA9  SFX data
        DECLE   $02EB                           ; 6BAB  SFX data
        DECLE   $0380,  $00A0                   ; 6BAC  SFX data
        DECLE   $02EB                           ; 6BAE  SFX data
        DECLE   $02CF                           ; 6BAF  SFX end

L_6BB0:
        PSHR    R5                              ; 6BB0   0275
L_6BB1:
        MVII    #$0086, R3                      ; 6BB1   02BB 0086

        JSR     R5,     L_6A8C                  ; 6BB3   0004 0168 028C
        DECLE   $018C,  $0188,  $018A,  $017A   ; 6BB6   018C 0188 018A 017A
        DECLE   $017A,  $016A,  $016A,  $015A   ; 6BBA   017A 016A 016A 015A
        DECLE   $015A,  $01AC,  $01A8,  $01AA   ; 6BBE   015A 01AC 01A8 01AA
        DECLE   $019A,  $019A,  $018A,  $018A   ; 6BC2   019A 019A 018A 018A
        DECLE   $017A,  $0172,  $0000           ; 6BC6   017A 0172 0000

        B       L_6BB1                          ; 6BC9   0220 0019

L_6BCB:
        PSHR    R5                              ; 6BCB   0275
        MVII    #$0090, R3                      ; 6BCC   02BB 0090

        JSR     R5,     L_6A8C                  ; 6BCE   0004 0168 028C
        DECLE   $004D,  $004D,  $004D,  $004A   ; 6BD1   004D 004D 004D 004A
        DECLE   $014A,  $017C,  $017C,  $017C   ; 6BD5   014A 017C 017C 017C
        DECLE   $015E,  $014C,  $0171,  $017E   ; 6BD9   015E 014C 0171 017E
        DECLE   $017A,  $019C,  $015C,  $019C   ; 6BDD   017A 019C 015C 019C
        DECLE   $01CE,  $019C,  $0171,  $017E   ; 6BE1   01CE 019C 0171 017E
        DECLE   $017A,  $019C,  $015C,  $019C   ; 6BE5   017A 019C 015C 019C
        DECLE   $01CC,  $01BC,  $019C,  $017C   ; 6BE9   01CC 01BC 019C 017C
        DECLE   $019C,  $017C,  $014E,  $017C   ; 6BED   019C 017C 014E 017C
        DECLE   $017C,  $017C,  $017C,  $019E   ; 6BF1   017C 017C 017C 019E
        DECLE   $01BC,  $01C5,  $01C5,  $0004   ; 6BF5   01BC 01C5 01C5 0004
        DECLE   $0000                           ; 6BF9   0000

        PULR    R7                              ; 6BFA   02B7

L_6BFB:
        PSHR    R5                              ; 6BFB   0275

        JSR     R5,     X_PLAY_SFX2             ; 6BFC   0004 0118 03BE
        DECLE   $00F2                           ; 6BFF  SFX prio
        DECLE   $0077,  $0080,  $006A           ; 6C00  SFX data
        DECLE   $0389                           ; 6C03  SFX data
        DECLE   $03C0,  $0160                   ; 6C04  SFX data
        DECLE   $03C8,  $00FD                   ; 6C06  SFX data
        DECLE   $0304,  $008B                   ; 6C08  SFX data
        DECLE   $0081,  $03E7                   ; 6C0A  SFX data
        DECLE   $008F,  $0018                   ; 6C0C  SFX data
        DECLE   $03C0,  $0008                   ; 6C0E  SFX data
        DECLE   $03C8,  $0010                   ; 6C10  SFX data
        DECLE   $03C4,  $0040                   ; 6C12  SFX data
        DECLE   $00F1,  $0017                   ; 6C14  SFX data
        DECLE   $008F,  $0050                   ; 6C16  SFX data
        DECLE   $02CF                           ; 6C18  SFX end

L_6C19:
        PSHR    R5                              ; 6C19   0275

        JSR     R5,     X_PLAY_SFX1             ; 6C1A   0004 0118 03BB
        DECLE   $0077,  $0080,  $006A           ; 6C1D  SFX data
        DECLE   $0389                           ; 6C20  SFX data
        DECLE   $0040,  $03F9                   ; 6C21  SFX data
        DECLE   $0048,  $03F9                   ; 6C23  SFX data
        DECLE   $0044,  $01FC                   ; 6C25  SFX data
        DECLE   $0191,  $03E3                   ; 6C27  SFX data
        DECLE   $000C,  $03F0                   ; 6C29  SFX data
        DECLE   $034B                           ; 6C2B  SFX data
        DECLE   $008F,  $0020                   ; 6C2C  SFX data
        DECLE   $0001,  $003F                   ; 6C2E  SFX data
        DECLE   $008F,  $0020                   ; 6C30  SFX data
        DECLE   $02CF                           ; 6C32  SFX end

L_6C33:
        PSHR    R5                              ; 6C33   0275

        JSR     R5,     X_PLAY_SFX2             ; 6C34   0004 0118 03BE
        DECLE   $0088                           ; 6C37  SFX prio
        DECLE   $0077,  $0080,  $006A           ; 6C38  SFX data
        DECLE   $0389                           ; 6C3B  SFX data
        DECLE   $03C0,  $0110                   ; 6C3C  SFX data
        DECLE   $03C8,  $0100                   ; 6C3E  SFX data
        DECLE   $0304,  $0110                   ; 6C40  SFX data
        DECLE   $00E1,  $001F                   ; 6C42  SFX data
        DECLE   $008F,  $0024                   ; 6C44  SFX data
        DECLE   $02CF                           ; 6C46  SFX end

L_6C47:
        PSHR    R5                              ; 6C47   0275
        MVII    #$0080, R3                      ; 6C48   02BB 0080

        JSR     R5,     L_6A8C                  ; 6C4A   0004 0168 028C
        DECLE   $00C4,  $0134,  $00C4,  $0134   ; 6C4D   00C4 0134 00C4 0134
        DECLE   $0004,  $0000                   ; 6C51   0004 0000

        PULR    R7                              ; 6C53   02B7

L_6C54:
        PSHR    R5                              ; 6C54   0275

        JSR     R5,     X_PLAY_SFX2             ; 6C55   0004 0118 03BE
        DECLE   $0084                           ; 6C58  SFX prio
        DECLE   $0077,  $0080,  $006A           ; 6C59  SFX data
        DECLE   $0119                           ; 6C5C  SFX data
        DECLE   $0044,  $02C0                   ; 6C5D  SFX data
        DECLE   $003C,  $0000                   ; 6C5F  SFX data
        DECLE   $03B7                           ; 6C61  SFX data
        DECLE   $020B                           ; 6C62  SFX data
        DECLE   $008F,  $0004                   ; 6C63  SFX data
        DECLE   $02CF                           ; 6C65  SFX end

L_6C66:
        PSHR    R5                              ; 6C66   0275

        JSR     R5,     X_PLAY_SFX2             ; 6C67   0004 0118 03BE
        DECLE   $0082                           ; 6C6A  SFX prio
        DECLE   $0077,  $0080,  $006A           ; 6C6B  SFX data
        DECLE   $0389                           ; 6C6E  SFX data
        DECLE   $03D0,  $0059                   ; 6C6F  SFX data
        DECLE   $0318,  $0059                   ; 6C71  SFX data
        DECLE   $03D4,  $0159                   ; 6C73  SFX data
        DECLE   $0001,  $03C3                   ; 6C75  SFX data
        DECLE   $008F,  $0008                   ; 6C77  SFX data
        DECLE   $02CF                           ; 6C79  SFX end

L_6C7A:
        PSHR    R5                              ; 6C7A   0275
L_6C7B:
        MVII    #$0084, R3                      ; 6C7B   02BB 0084

        JSR     R5,     L_6A8C                  ; 6C7D   0004 0168 028C
        DECLE   $005A,  $005A,  $008A,  $008A   ; 6C80   005A 005A 008A 008A
        DECLE   $00BA,  $00BA,  $008A,  $0082   ; 6C84   00BA 00BA 008A 0082
        DECLE   $0000                           ; 6C88   0000

        B       L_6C7B                          ; 6C89   0220 000F

L_6C8B:
        PSHR    R5                              ; 6C8B   0275

        JSR     R5,     X_PLAY_SFX2             ; 6C8C   0004 0118 03BE
        DECLE   $0092                           ; 6C8F  SFX prio
        DECLE   $0077,  $0080,  $006A           ; 6C90  SFX data
        DECLE   $0389                           ; 6C93  SFX data
        DECLE   $03C0,  $0041                   ; 6C94  SFX data
        DECLE   $03C8,  $0041                   ; 6C96  SFX data
        DECLE   $0304,  $0041                   ; 6C98  SFX data
        DECLE   $0001,  $0007                   ; 6C9A  SFX data
        DECLE   $008F,  $0080                   ; 6C9C  SFX data
        DECLE   $0001,  $000B                   ; 6C9E  SFX data
        DECLE   $008F,  $0060                   ; 6CA0  SFX data
        DECLE   $02CF                           ; 6CA2  SFX end

L_6CA3:
        PSHR    R5                              ; 6CA3   0275

        JSR     R5,     X_PLAY_SFX1             ; 6CA4   0004 0118 03BB
        DECLE   $0077,  $0080,  $006A           ; 6CA7  SFX data
        DECLE   $0389                           ; 6CAA  SFX data
        DECLE   $0040,  $03F9                   ; 6CAB  SFX data
        DECLE   $0048,  $03F9                   ; 6CAD  SFX data
        DECLE   $0044,  $01FC                   ; 6CAF  SFX data
        DECLE   $0191,  $0003                   ; 6CB1  SFX data
        DECLE   $000C,  $03F0                   ; 6CB3  SFX data
        DECLE   $034B                           ; 6CB5  SFX data
        DECLE   $032F                           ; 6CB6  SFX data
        DECLE   $00EB                           ; 6CB7  SFX data
        DECLE   $022F                           ; 6CB8  SFX data
        DECLE   $01AB                           ; 6CB9  SFX data
        DECLE   $012F                           ; 6CBA  SFX data
        DECLE   $01AB                           ; 6CBB  SFX data
        DECLE   $002F                           ; 6CBC  SFX data
        DECLE   $00AB                           ; 6CBD  SFX data
        DECLE   $02CF                           ; 6CBE  SFX end

L_6CBF:
        PSHR    R5                              ; 6CBF   0275

        JSR     R5,     X_PLAY_SFX2             ; 6CC0   0004 0118 03BE
        DECLE   $0092                           ; 6CC3  SFX prio
        DECLE   $0077,  $0080,  $006A           ; 6CC4  SFX data
        DECLE   $0079                           ; 6CC7  SFX data
        DECLE   $03ED                           ; 6CC8  SFX data
        DECLE   $000F,  $00F0                   ; 6CC9  SFX data
        DECLE   $000C,  $0100                   ; 6CCB  SFX data
        DECLE   $03B7                           ; 6CCD  SFX data
        DECLE   $02CB                           ; 6CCE  SFX data
        DECLE   $008F,  $0018                   ; 6CCF  SFX data
        DECLE   $000B                           ; 6CD1  SFX data
        DECLE   $008F,  $0010                   ; 6CD2  SFX data
        DECLE   $02CF                           ; 6CD4  SFX end


        PSHR    R5                              ; 6CD5   0275
        MVI     G_017A, R1                      ; 6CD6   0281 017A
        SARC    R1,     1                       ; 6CD8   0079
        BC      L_6F67                          ; 6CD9   0201 028C
        BNEQ    L_6CE8                          ; 6CDB   020C 000B

        INCR    R1                              ; 6CDD   0009
        MVO     R1,     .STIC.CS.0              ; 6CDE   0241 0028
        MVO     R1,     .STIC.BORD              ; 6CE0   0241 002C
        MVO     R1,     G_0106                  ; 6CE2   0241 0106
        MVI     .STIC.MODE,R0                   ; 6CE4   0280 0021
        B       L_6DF1                          ; 6CE6   0200 0109

L_6CE8:
        MVI     G_0102, R1                      ; 6CE8   0281 0102
        TSTR    R1                              ; 6CEA   0089
        BEQ     L_6D91                          ; 6CEB   0204 00A4

        CMPI    #$0004, R1                      ; 6CED   0379 0004
        BEQ     L_6E03                          ; 6CEF   0204 0112
        BGT     L_6DF1                          ; 6CF1   020E 00FE

        CMPI    #$0002, R1                      ; 6CF3   0379 0002
        BGT     L_6DB9                          ; 6CF5   020E 00C2
        BEQ     L_6D18                          ; 6CF7   0204 001F

        MVI     G_017D, R3                      ; 6CF9   0283 017D
        MVI     G_017C, R0                      ; 6CFB   0280 017C
        DECR    R3                              ; 6CFD   0013
        BMI     L_6DF1                          ; 6CFE   020B 00F1

L_6D00:
        MVO     R3,     G_017D                  ; 6D00   0243 017D
        SDBD                                    ; 6D02   0001
        MVII    #$3904, R4                      ; 6D03   02BC 0004 0039
        MOVR    R0,     R1                      ; 6D06   0081
        SLL     R1,     1                       ; 6D07   0049
        SUBR    R1,     R4                      ; 6D08   010C
        MVII    #$0042, R2                      ; 6D09   02BA 0042
        MVO@    R2,     R4                      ; 6D0B   0262
        SARC    R1,     2                       ; 6D0C   007D
        BOV     L_6D11                          ; 6D0D   0202 0002

        MVII    #$007E, R2                      ; 6D0F   02BA 007E
L_6D11:
        MVO@    R2,     R4                      ; 6D11   0262
        DECR    R0                              ; 6D12   0010
        DECR    R3                              ; 6D13   0013
        BPL     L_6D00                          ; 6D14   0223 0015
        B       L_6DF1                          ; 6D16   0200 00D9

L_6D18:
        MVI     .STIC.C.2,R0                    ; 6D18   0280 001A
        MVO     R0,     G_01C8                  ; 6D1A   0240 01C8
        MVI     .STIC.C.3,R0                    ; 6D1C   0280 001B
        MVO     R0,     G_01C9                  ; 6D1E   0240 01C9
        CLRR    R0                              ; 6D20   01C0
        MVO     R0,     .STIC.C.2               ; 6D21   0240 001A
        MVO     R0,     .STIC.C.3               ; 6D23   0240 001B

        JSR     R5,     X_DEF_ISR               ; 6D25   0004 0110 0126

        MVI     G_01C8, R1                      ; 6D28   0281 01C8
        MVI     G_019E, R0                      ; 6D2A   0280 019E
        TSTR    R0                              ; 6D2C   0080
        BEQ     L_6D31                          ; 6D2D   0204 0002

        ANDI    #$0030, R1                      ; 6D2F   03B9 0030
L_6D31:
        SLR     R1,     2                       ; 6D31   0065
        SLR     R1,     2                       ; 6D32   0065
        MOVR    R1,     R2                      ; 6D33   008A
        MVI     G_01C9, R3                      ; 6D34   0283 01C9
        SLR     R3,     2                       ; 6D36   0067
        SLR     R3,     2                       ; 6D37   0067
        ANDR    R3,     R2                      ; 6D38   019A
        ANDI    #$000C, R2                      ; 6D39   03BA 000C
        BEQ     L_6D40                          ; 6D3B   0204 0003

        MVO     R2,     G_0190                  ; 6D3D   0242 0190
        MOVR    R2,     R3                      ; 6D3F   0093
L_6D40:
        XORR    R2,     R3                      ; 6D40   01D3
        PSHR    R3                              ; 6D41   0273
        SARC    R1,     1                       ; 6D42   0079
        BNC     L_6D53                          ; 6D43   0209 000E

        CLRR    R0                              ; 6D45   01C0
        MVO     R0,     G_01AC                  ; 6D46   0240 01AC
        MVO     R0,     G_01B4                  ; 6D48   0240 01B4
        MVO     R0,     G_01BC                  ; 6D4A   0240 01BC
        MVII    #$0002, R0                      ; 6D4C   02B8 0002
        PSHR    R1                              ; 6D4E   0271

        JSR     R5,     L_5EE1                  ; 6D4F   0004 015C 02E1

        PULR    R1                              ; 6D52   02B1
L_6D53:
        SARC    R1,     1                       ; 6D53   0079
        BNC     L_6D62                          ; 6D54   0209 000C

        CLRR    R0                              ; 6D56   01C0
        MVO     R0,     G_01AD                  ; 6D57   0240 01AD
        MVO     R0,     G_01B5                  ; 6D59   0240 01B5
        MVO     R0,     G_01BD                  ; 6D5B   0240 01BD
        MVII    #$0003, R0                      ; 6D5D   02B8 0003

        JSR     R5,     L_5EE1                  ; 6D5F   0004 015C 02E1

L_6D62:
        PULR    R3                              ; 6D62   02B3
        SLR     R3,     2                       ; 6D63   0067
        BEQ     L_6D8F                          ; 6D64   0204 0029

        MVI     G_0196, R0                      ; 6D66   0280 0196
        ADD     G_019E, R0                      ; 6D68   02C0 019E
        BNEQ    L_6D70                          ; 6D6A   020C 0004

        MVO     R3,     G_0190                  ; 6D6C   0243 0190
        B       L_6D8F                          ; 6D6E   0200 001F

L_6D70:
        SARC    R3,     1                       ; 6D70   007B
        BNC     L_6D80                          ; 6D71   0209 000D

        CLRR    R0                              ; 6D73   01C0
        MVO     R0,     G_01AE                  ; 6D74   0240 01AE
        MVO     R0,     G_01B2                  ; 6D76   0240 01B2
        NOP                                     ; 6D78   0034
        MVO     R0,     G_01B6                  ; 6D79   0240 01B6
        PSHR    R3                              ; 6D7B   0273

        JSR     R5,     L_5FAA                  ; 6D7C   0004 015C 03AA

        PULR    R3                              ; 6D7F   02B3
L_6D80:
        SARC    R3,     1                       ; 6D80   007B
        BNC     L_6D8F                          ; 6D81   0209 000C

        CLRR    R0                              ; 6D83   01C0
        MVO     R0,     G_01E6                  ; 6D84   0240 01E6
        MVO     R0,     G_01B3                  ; 6D86   0240 01B3
        MVO     R0,     G_01B7                  ; 6D88   0240 01B7
        MVII    #$000A, R0                      ; 6D8A   02B8 000A

        JSR     R5,     L_5FAC                  ; 6D8C   0004 015C 03AC

L_6D8F:
        B       L_6DF4                          ; 6D8F   0200 0063

L_6D91:
        MVI     G_0190, R0                      ; 6D91   0280 0190
        TSTR    R0                              ; 6D93   0080
        BEQ     L_6DAA                          ; 6D94   0204 0014

        MVI     .STIC.Y.2,R3                    ; 6D96   0283 000A
        INCR    R3                              ; 6D98   000B
        MOVR    R3,     R2                      ; 6D99   009A
        ANDI    #$007F, R2                      ; 6D9A   03BA 007F
        CMPI    #$005E, R2                      ; 6D9C   037A 005E
        BGT     L_6DAA                          ; 6D9E   020E 000A

        MVO     R3,     .STIC.Y.2               ; 6DA0   0243 000A
        MVI     .STIC.X.2,R2                    ; 6DA2   0282 0002
        MVO     R2,     .STIC.X.3               ; 6DA4   0242 0003
        SUBI    #$00FB, R3                      ; 6DA6   033B 00FB
        MVO     R3,     .STIC.Y.3               ; 6DA8   0243 000B
L_6DAA:
        MVI     G_019F, R3                      ; 6DAA   0283 019F
        XORI    #$0001, R3                      ; 6DAC   03FB 0001
        MVO     R3,     G_019F                  ; 6DAE   0243 019F
        BEQ     L_6E03                          ; 6DB0   0204 0051

        MVII    #$0001, R1                      ; 6DB2   02B9 0001

        JSR     R5,     .EXEC.154               ; 6DB4   0004 0110 0154

        B       L_6DF1                          ; 6DB7   0200 0038

L_6DB9:
        MVI     G_01D8, R4                      ; 6DB9   0284 01D8
        DECR    R4                              ; 6DBB   0014
        BMI     L_6DD5                          ; 6DBC   020B 0017

        SDBD                                    ; 6DBE   0001
        ADDI    #$6A5C, R4                      ; 6DBF   02FC 005C 006A
        MVI@    R4,     R1                      ; 6DC2   02A1
        SDBD                                    ; 6DC3   0001
        MVI@    R4,     R0                      ; 6DC4   02A0
        MVO@    R0,     R1                      ; 6DC5   0248
        ADDI    #$0014, R1                      ; 6DC6   02F9 0014
        MVI@    R1,     R0                      ; 6DC8   0288
        ANDI    #$01FF, R0                      ; 6DC9   03B8 01FF
        CMPI    #$018F, R0                      ; 6DCB   0378 018F
        BNEQ    L_6DD5                          ; 6DCD   020C 0006

        MVI     G_01E1, R0                      ; 6DCF   0280 01E1
        SWAP    R0,     1                       ; 6DD1   0040
        XOR     G_01E0, R0                      ; 6DD2   03C0 01E0
        MVO@    R0,     R1                      ; 6DD4   0248
L_6DD5:
        MVI     G_01DE, R4                      ; 6DD5   0284 01DE
        DECR    R4                              ; 6DD7   0014
        BMI     L_6DF1                          ; 6DD8   020B 0017

        SDBD                                    ; 6DDA   0001
        ADDI    #$6A38, R4                      ; 6DDB   02FC 0038 006A
        MVI@    R4,     R1                      ; 6DDE   02A1
        SDBD                                    ; 6DDF   0001
        MVI@    R4,     R0                      ; 6DE0   02A0
        MVO@    R0,     R1                      ; 6DE1   0248
        ADDI    #$0014, R1                      ; 6DE2   02F9 0014
        MVI@    R1,     R0                      ; 6DE4   0288
        ANDI    #$01FF, R0                      ; 6DE5   03B8 01FF
        CMPI    #$019F, R0                      ; 6DE7   0378 019F
        BNEQ    L_6DF1                          ; 6DE9   020C 0006

        MVI     G_01E3, R0                      ; 6DEB   0280 01E3
        SWAP    R0,     1                       ; 6DED   0040
        XOR     G_01E2, R0                      ; 6DEE   03C0 01E2
        MVO@    R0,     R1                      ; 6DF0   0248

L_6DF1:
        JSR     R5,     X_DEF_ISR               ; 6DF1   0004 0110 0126

L_6DF4:
        MVI     G_0149, R1                      ; 6DF4   0281 0149
        CMPI    #$000A, R1                      ; 6DF6   0379 000A
        BGT     L_6E02                          ; 6DF8   020E 0008

        TSTR    R1                              ; 6DFA   0089
        BEQ     L_6E02                          ; 6DFB   0204 0005

        CLRR    R1                              ; 6DFD   01C9
        MVO     R1,     .PSG0.chn_b_vol         ; 6DFE   0241 01FC
        MVO     R1,     .PSG0.chn_c_vol         ; 6E00   0241 01FD
L_6E02:
        PULR    R7                              ; 6E02   02B7

L_6E03:
        MVII    #$0004, R4                      ; 6E03   02BC 0004
        MVII    #$01B0, R5                      ; 6E05   02BD 01B0
        MVII    #$0300, R3                      ; 6E07   02BB 0300
        MVI@    R5,     R2                      ; 6E09   02AA
        XORR    R3,     R2                      ; 6E0A   01DA
        MVO@    R2,     R4                      ; 6E0B   0262
        MVI@    R5,     R2                      ; 6E0C   02AA
        XORR    R3,     R2                      ; 6E0D   01DA
        MVO@    R2,     R4                      ; 6E0E   0262
        MVI@    R5,     R2                      ; 6E0F   02AA
        XORR    R3,     R2                      ; 6E10   01DA
        MVO@    R2,     R4                      ; 6E11   0262
        MVI@    R5,     R2                      ; 6E12   02AA
        SDBD                                    ; 6E13   0001
        XORI    #$0700, R2                      ; 6E14   03FA 0000 0007
        MVO@    R2,     R4                      ; 6E17   0262
        ADDI    #$0004, R4                      ; 6E18   02FC 0004
        MVII    #$0100, R3                      ; 6E1A   02BB 0100
        MVI@    R5,     R2                      ; 6E1C   02AA
        SLR     R2,     1                       ; 6E1D   0062
        XORR    R3,     R2                      ; 6E1E   01DA
        MVO@    R2,     R4                      ; 6E1F   0262
        MVI@    R5,     R2                      ; 6E20   02AA
        SLR     R2,     1                       ; 6E21   0062
        XORR    R3,     R2                      ; 6E22   01DA
        MVO@    R2,     R4                      ; 6E23   0262
        MVI@    R5,     R2                      ; 6E24   02AA
        XORR    R3,     R2                      ; 6E25   01DA
        MVO@    R2,     R4                      ; 6E26   0262
        MVI@    R5,     R2                      ; 6E27   02AA
        XORR    R3,     R2                      ; 6E28   01DA
        MVO@    R2,     R4                      ; 6E29   0262
        SDBD                                    ; 6E2A   0001
        MVII    #$0908, R2                      ; 6E2B   02BA 0008 0009
        XOR     G_01BB, R2                      ; 6E2E   03C2 01BB
        MVO     R2,     .STIC.A.7               ; 6E30   0242 0017
        CLRR    R0                              ; 6E32   01C0
        MVO     R0,     .STIC.C.2               ; 6E33   0240 001A
        MVO     R0,     .STIC.C.3               ; 6E35   0240 001B
        MVI     G_01D3, R1                      ; 6E37   0281 01D3
        DECR    R1                              ; 6E39   0011
        BMI     L_6E7E                          ; 6E3A   020B 0042

        MVO     R0,     G_01D3                  ; 6E3C   0240 01D3

        JSR     R4,     L_6E65                  ; 6E3E   0004 006C 0265
        DECLE   $0000,  $001C,  $001E,  $0068   ; 6E41   0000 001C 001E 0068
        DECLE   $006C,  $003E,  $002C,  $001C   ; 6E45   006C 003E 002C 001C
        DECLE   $003C,  $0026,  $0023,  $0066   ; 6E49   003C 0026 0023 0066
        DECLE   $0000                           ; 6E4D   0000

        INCR    R6                              ; 6E4E   000E
        INCR    R7                              ; 6E4F   000F

        NOP                                     ; 6E50   0034
L_6E51:
        RSWD    R6                              ; 6E51   003E
        DECLE   $001F,  $0016,  $000E,  $001F   ; 6E52   001F 0016 000E 001F
        DECLE   $0009,  $0019,  $0003,  $0000   ; 6E56   0009 0019 0003 0000

        COMR    R5                              ; 6E5A   001D
        ADDR    R3,     R3                      ; 6E5B   00DB
        TSTR    R5                              ; 6E5C   00AD
        COMR    R6                              ; 6E5D   001E
        INCR    R4                              ; 6E5E   000C
        COMR    R4                              ; 6E5F   001C
        MOVR    R7,     R6                      ; 6E60   00BE
        ADDR    R3,     R6                      ; 6E61   00DE
        MOVR    R3,     R0                      ; 6E62   0098
        INCR    R4                              ; 6E63   000C
        COMR    R0                              ; 6E64   0018
L_6E65:
        SDBD                                    ; 6E65   0001
        MVII    #$3972, R5                      ; 6E66   02BD 0072 0039
        CMPI    #$000F, R1                      ; 6E69   0379 000F
        BLT     L_6E6F                          ; 6E6B   0205 0002

        MVO@    R0,     R5                      ; 6E6D   0268
        MVO@    R0,     R5                      ; 6E6E   0268
L_6E6F:
        MOVR    R1,     R2                      ; 6E6F   008A
        ANDI    #$000F, R1                      ; 6E70   03B9 000F
        MOVR    R5,     R0                      ; 6E72   00A8

        JSR     R5,     L_6EE0                  ; 6E73   0004 016C 02E0

        CMPI    #$000F, R2                      ; 6E76   037A 000F
        BGT     L_6E7E                          ; 6E78   020E 0004

        MVII    #$00FF, R3                      ; 6E7A   02BB 00FF
        MVO@    R3,     R5                      ; 6E7C   026B
        MVO@    R3,     R5                      ; 6E7D   026B
L_6E7E:
        MVI     G_01D4, R0                      ; 6E7E   0280 01D4
        TSTR    R0                              ; 6E80   0080
        BNEQ    L_6F05                          ; 6E81   020C 0082

        MVI     G_01D8, R0                      ; 6E83   0280 01D8
        DECR    R0                              ; 6E85   0010
        BMI     L_6F05                          ; 6E86   020B 007D

        SDBD                                    ; 6E88   0001
        MVII    #$6A5C, R1                      ; 6E89   02B9 005C 006A
        ADDR    R0,     R1                      ; 6E8C   00C1
        MVI@    R1,     R1                      ; 6E8D   0289
        MVI@    R1,     R2                      ; 6E8E   028A
        SDBD                                    ; 6E8F   0001
        ANDI    #$2000, R2                      ; 6E90   03BA 0000 0020
        SDBD                                    ; 6E93   0001
        ADDI    #$0987, R2                      ; 6E94   02FA 0087 0009
        MVO@    R2,     R1                      ; 6E97   024A
        ADDI    #$0014, R1                      ; 6E98   02F9 0014
        MVI@    R1,     R2                      ; 6E9A   028A
        MVO     R2,     G_01E0                  ; 6E9B   0242 01E0
        SWAP    R2,     1                       ; 6E9D   0042
        MVO     R2,     G_01E1                  ; 6E9E   0242 01E1
        ANDI    #$0020, R2                      ; 6EA0   03BA 0020
        SWAP    R2,     1                       ; 6EA2   0042
        SDBD                                    ; 6EA3   0001
        ADDI    #$098F, R2                      ; 6EA4   02FA 008F 0009
        MVO@    R2,     R1                      ; 6EA7   024A
        CLRR    R0                              ; 6EA8   01C0
        MVI     G_01D7, R1                      ; 6EA9   0281 01D7
        DECR    R1                              ; 6EAB   0011
        BMI     L_6F05                          ; 6EAC   020B 0057

        MVO     R0,     G_01D7                  ; 6EAE   0240 01D7

        JSR     R4,     L_6ED7                  ; 6EB0   0004 006C 02D7

        RSWD    R4                              ; 6EB3   003C
        MOVR    R3,     R2                      ; 6EB4   009A
        ADDR    R5,     R7                      ; 6EB5   00EF

        DECLE   $003C,  $001E,  $003B,  $0071   ; 6EB6   003C 001E 003B 0071
        DECLE   $003B,  $001C,  $0038,  $0074   ; 6EBA   003B 001C 0038 0074
        DECLE   $007C,  $000C,  $00F6,  $0068   ; 6EBE   007C 000C 00F6 0068
        DECLE   $00DC,  $00F0,  $007C,  $0070   ; 6EC2   00DC 00F0 007C 0070
        DECLE   $003C,  $000E,  $001C,  $003A   ; 6EC6   003C 000E 001C 003A
        DECLE   $007E,  $003C,  $001A,  $00F7   ; 6ECA   007E 003C 001A 00F7

        MOVR    R7,     R4                      ; 6ECE   00BC
        ADDR    R6,     R6                      ; 6ECF   00F6
        RRC     R3,     1                       ; 6ED0   0073
        ADDR    R4,     R1                      ; 6ED1   00E1
        RRC     R3,     1                       ; 6ED2   0073
        RSWD    R0                              ; 6ED3   0038
        GSWD    R0                              ; 6ED4   0030
        SAR     R0,     1                       ; 6ED5   0068
        ADDR    R7,     R0                      ; 6ED6   00F8
L_6ED7:
        SDBD                                    ; 6ED7   0001
        MVII    #$3984, R0                      ; 6ED8   02B8 0084 0039

        JSR     R5,     L_6EE0                  ; 6EDB   0004 016C 02E0

        B       L_6F05                          ; 6EDE   0200 0025

L_6EE0:
        PSHR    R5                              ; 6EE0   0275
        MOVR    R0,     R5                      ; 6EE1   0085
        DECR    R1                              ; 6EE2   0011
        BMI     L_6EEC                          ; 6EE3   020B 0007

        ADDI    #$000C, R4                      ; 6EE5   02FC 000C
        DECR    R1                              ; 6EE7   0011
        BMI     L_6EEC                          ; 6EE8   020B 0002

        ADDI    #$000C, R4                      ; 6EEA   02FC 000C
L_6EEC:
        MVI@    R4,     R3                      ; 6EEC   02A3
        MVO@    R3,     R5                      ; 6EED   026B
        MVI@    R4,     R3                      ; 6EEE   02A3
        MVO@    R3,     R5                      ; 6EEF   026B
        MVI@    R4,     R3                      ; 6EF0   02A3
        MVO@    R3,     R5                      ; 6EF1   026B
        MVI@    R4,     R3                      ; 6EF2   02A3
        MVO@    R3,     R5                      ; 6EF3   026B
        MVI@    R4,     R3                      ; 6EF4   02A3
        MVO@    R3,     R5                      ; 6EF5   026B
        MVI@    R4,     R3                      ; 6EF6   02A3
        MVO@    R3,     R5                      ; 6EF7   026B
        MVI@    R4,     R3                      ; 6EF8   02A3
        MVO@    R3,     R5                      ; 6EF9   026B
        MVI@    R4,     R3                      ; 6EFA   02A3
        MVO@    R3,     R5                      ; 6EFB   026B
        MVI@    R4,     R3                      ; 6EFC   02A3
        MVO@    R3,     R5                      ; 6EFD   026B
        MVI@    R4,     R3                      ; 6EFE   02A3
        MVO@    R3,     R5                      ; 6EFF   026B
        MVI@    R4,     R3                      ; 6F00   02A3
        MVO@    R3,     R5                      ; 6F01   026B
        MVI@    R4,     R3                      ; 6F02   02A3
        MVO@    R3,     R5                      ; 6F03   026B
        PULR    R7                              ; 6F04   02B7

L_6F05:
        MVI     G_01DA, R0                      ; 6F05   0280 01DA
        TSTR    R0                              ; 6F07   0080
        BNEQ    L_6F65                          ; 6F08   020C 005B

        MVI     G_01DE, R0                      ; 6F0A   0280 01DE
        DECR    R0                              ; 6F0C   0010
        BMI     L_6F65                          ; 6F0D   020B 0056

        SDBD                                    ; 6F0F   0001
        MVII    #$6A38, R1                      ; 6F10   02B9 0038 006A
        ADDR    R0,     R1                      ; 6F13   00C1
        MVI@    R1,     R1                      ; 6F14   0289
        MVI@    R1,     R2                      ; 6F15   028A
        SDBD                                    ; 6F16   0001
        ANDI    #$2000, R2                      ; 6F17   03BA 0000 0020
        SDBD                                    ; 6F1A   0001
        ADDI    #$0997, R2                      ; 6F1B   02FA 0097 0009
        MVO@    R2,     R1                      ; 6F1E   024A
        ADDI    #$0014, R1                      ; 6F1F   02F9 0014
        MVI@    R1,     R2                      ; 6F21   028A
        MVO     R2,     G_01E2                  ; 6F22   0242 01E2
        SWAP    R2,     1                       ; 6F24   0042
        MVO     R2,     G_01E3                  ; 6F25   0242 01E3
        ANDI    #$0020, R2                      ; 6F27   03BA 0020
        SWAP    R2,     1                       ; 6F29   0042
        SDBD                                    ; 6F2A   0001
        ADDI    #$099F, R2                      ; 6F2B   02FA 009F 0009
        MVO@    R2,     R1                      ; 6F2E   024A
        CLRR    R0                              ; 6F2F   01C0
        MVI     G_01DD, R1                      ; 6F30   0281 01DD
        DECR    R1                              ; 6F32   0011
        BMI     L_6F65                          ; 6F33   020B 0030

        MVO     R0,     G_01DD                  ; 6F35   0240 01DD

        JSR     R4,     L_6F5E                  ; 6F37   0004 006C 035E
        DECLE   $003C,  $0059,  $00F7           ; 6F3A   003C 0059 00F7

        RSWD    R4                              ; 6F3D   003C
        SARC    R0,     1                       ; 6F3E   0078
        ADDR    R3,     R4                      ; 6F3F   00DC
        MOVR    R1,     R6                      ; 6F40   008E
        ADDR    R3,     R4                      ; 6F41   00DC
        RSWD    R0                              ; 6F42   0038
        COMR    R4                              ; 6F43   001C
        ADCR    R6                              ; 6F44   002E
        RSWD    R6                              ; 6F45   003E
        GSWD    R0                              ; 6F46   0030
        SAR     R3,     2                       ; 6F47   006F
        DECR    R6                              ; 6F48   0016
        RSWD    R3                              ; 6F49   003B
        INCR    R7                              ; 6F4A   000F

        RSWD    R6                              ; 6F4B   003E
L_6F4C:
        INCR    R6                              ; 6F4C   000E
        RSWD    R4                              ; 6F4D   003C
        RRC     R0,     1                       ; 6F4E   0070
        RSWD    R0                              ; 6F4F   0038
        SLLC    R0,     2                       ; 6F50   005C
        SARC    R2,     2                       ; 6F51   007E
        RSWD    R4                              ; 6F52   003C
        SLLC    R0,     1                       ; 6F53   0058
        ADDR    R5,     R7                      ; 6F54   00EF

        RSWD    R5                              ; 6F55   003D
        SAR     R3,     2                       ; 6F56   006F
        ADDR    R1,     R6                      ; 6F57   00CE
        MOVR    R0,     R7                      ; 6F58   0087

        DECLE   $00CE,  $001C,  $000C,  $0016   ; 6F59   00CE 001C 000C 0016
        DECLE   $001F                           ; 6F5D   001F
L_6F5E:
        SDBD                                    ; 6F5E   0001
        MVII    #$3994, R0                      ; 6F5F   02B8 0094 0039

        JSR     R5,     L_6EE0                  ; 6F62   0004 016C 02E0

L_6F65:
        B       L_6DF1                          ; 6F65   0220 0175

L_6F67:
        CMPI    #$0003, R1                      ; 6F67   0379 0003
        BNEQ    L_6F8F                          ; 6F69   020C 0024

        MVI     G_0161, R0                      ; 6F6B   0280 0161
        TSTR    R0                              ; 6F6D   0080
        BEQ     L_6DF1                          ; 6F6E   0224 017E

        MVI     G_0102, R0                      ; 6F70   0280 0102
        SWAP    R0,     1                       ; 6F72   0040
        SWAP    R0,     1                       ; 6F73   0040
        BMI     L_6DF1                          ; 6F74   022B 0184

        MVI     G_0179, R0                      ; 6F76   0280 0179
        INCR    R0                              ; 6F78   0008
        ANDI    #$003F, R0                      ; 6F79   03B8 003F
        MVO     R0,     G_0179                  ; 6F7B   0240 0179
        BNEQ    L_6DF1                          ; 6F7D   022C 018D

        MVI     G_0165, R0                      ; 6F7F   0280 0165
        XORI    #$0001, R0                      ; 6F81   03F8 0001
        MVO     R0,     G_0165                  ; 6F83   0240 0165
        MVO     R0,     .STIC.VIDEN             ; 6F85   0240 0020
        CLRR    R0                              ; 6F87   01C0
        MVO     R0,     .BTAB.05                ; 6F88   0240 0205
        MVO     R0,     .BTAB.06                ; 6F8A   0240 0206
        J       L_5FAD                          ; 6F8C   0004 035C 03AD

L_6F8F:
        DIS                                     ; 6F8F   0003
        PSHR    R1                              ; 6F90   0271
        SDBD                                    ; 6F91   0001
        MVII    #$3800, R4                      ; 6F92   02BC 0000 0038
        MVII    #$0200, R0                      ; 6F95   02B8 0200

        JSR     R5,     X_FILL_ZERO             ; 6F97   0004 0114 0338

        CMPI    #$0001, R1                      ; 6F9A   0379 0001
        BEQ     L_6FAE                          ; 6F9C   0204 0010
        BGT     L_6FBB                          ; 6F9E   020E 001B

        CLRR    R0                              ; 6FA0   01C0
        MVII    #$000B, R2                      ; 6FA1   02BA 000B
        MVII    #$0007, R3                      ; 6FA3   02BB 0007
        MVII    #$0001, R1                      ; 6FA5   02B9 0001
        CLRR    R5                              ; 6FA7   01ED
        SDBD                                    ; 6FA8   0001
        MVII    #$54B8, R4                      ; 6FA9   02BC 00B8 0054
        B       L_6FC7                          ; 6FAC   0200 0019

L_6FAE:
        CLRR    R0                              ; 6FAE   01C0
        CLRR    R2                              ; 6FAF   01D2
        MVII    #$0004, R3                      ; 6FB0   02BB 0004
        CLRR    R1                              ; 6FB2   01C9
        MVII    #$0001, R5                      ; 6FB3   02BD 0001
        SDBD                                    ; 6FB5   0001
        MVII    #$553C, R4                      ; 6FB6   02BC 003C 0055
        B       L_6FC7                          ; 6FB9   0200 000C

L_6FBB:
        MVII    #$0001, R0                      ; 6FBB   02B8 0001
        MVII    #$000A, R2                      ; 6FBD   02BA 000A
        MVII    #$0006, R3                      ; 6FBF   02BB 0006
        CLRR    R1                              ; 6FC1   01C9
        CLRR    R5                              ; 6FC2   01ED
        SDBD                                    ; 6FC3   0001
        MVII    #$55D1, R4                      ; 6FC4   02BC 00D1 0055
L_6FC7:
        MVO     R5,     G_0105                  ; 6FC7   0245 0105
        MVO     R0,     .STIC.CS.0              ; 6FC9   0240 0028
        MVO     R0,     .STIC.CS.2              ; 6FCB   0240 002A
        MVO     R0,     .STIC.BORD              ; 6FCD   0240 002C
        MVO     R0,     G_0106                  ; 6FCF   0240 0106
        MVI     .STIC.MODE,R0                   ; 6FD1   0280 0021
        TSTR    R5                              ; 6FD3   00AD
        BEQ     L_6FD8                          ; 6FD4   0204 0002

        MVO     R5,     .STIC.MODE              ; 6FD6   0245 0021
L_6FD8:
        MVO     R2,     .STIC.CS.1              ; 6FD8   0242 0029
        MVO     R2,     .STIC.CS.3              ; 6FDA   0242 002B
        MVO     R3,     .STIC.HDLY              ; 6FDC   0243 0030
        MVO     R1,     .STIC.EDGE              ; 6FDE   0241 0032
        SDBD                                    ; 6FE0   0001
        MVII    #$3800, R5                      ; 6FE1   02BD 0000 0038
L_6FE4:
        MVI@    R4,     R0                      ; 6FE4   02A0
        CMPI    #$03FF, R0                      ; 6FE5   0378 03FF
        BEQ     L_6FF0                          ; 6FE7   0204 0007

L_6FE9:
        MVO@    R0,     R5                      ; 6FE9   0268
        SUBI    #$0100, R0                      ; 6FEA   0338 0100
        BMI     L_6FE4                          ; 6FEC   022B 0009
        B       L_6FE9                          ; 6FEE   0220 0006

L_6FF0:
        MVII    #$0040, R0                      ; 6FF0   02B8 0040
        MVII    #$031D, R4                      ; 6FF2   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; 6FF4   0004 0114 0338

        PULR    R1                              ; 6FF7   02B1
        SLL     R1,     1                       ; 6FF8   0049
        ADDI    #$0002, R1                      ; 6FF9   02F9 0002
        MVO     R1,     G_017A                  ; 6FFB   0241 017A
        PULR    R7                              ; 6FFD   02B7

        DECLE   $0000                           ; 6FFE   0000

        AND     .STIC.X.0,R3                    ; 6FFF   0383 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $502B       <entry>
;;  $5065       $52A5  
;;  $507C       <entry>
;;  $507D       $50B1  
;;  $509D       $6523  
;;  $50AA       $509D  
;;  $50D2       $50BB  
;;  $50DA       $50D4  
;;  $50F3       $50B6  
;;  $5102       $50F8   $50FB   $50FF  
;;  $5109       $5105  
;;  $5110       $64FA  
;;  $512E       $512A  
;;  $5130       $5133  
;;  $5159       $5155  
;;  $5170       $5083   $5119   $6499  
;;  $5178       $50BF   $50C2   $50D8  
;;  $517B       $520E   $5219   $522B   $5250   $529F   $52E7   $5368   $5426  
;;  $517B       $5446   $5457  
;;  $517C       $5192  
;;  $5181       $5190  
;;  $518E       $5188  
;;  $5194       $5184  
;;  $5195       $516A  
;;  $5204       $5200  
;;  $523C       $523A  
;;  $5291       $516C  
;;  $5303       $5300  
;;  $53B5       $516E  
;;  $5478       $5474  
;;  $5491       $528E   $53B3  
;;  $549E       $5491  
;;  $54A5       $54AE  
;;  $54B0       $54A7  
;;  $5582       $5580  
;;  $562A       $5610  
;;  $563C       $560A  
;;  $57BF       $57BF  
;;  $5916       $590D  
;;  $592E       $591E   $5A87   $5A89   $5A91   $5B0A   $5B3F   $5BBF   $5BCA  
;;  $5947       $5936   $593A   $593E  
;;  $5962       $5956  
;;  $59C5       $5962  
;;  $59D0       $55CF   $59CC  
;;  $59D2       $59CA  
;;  $59D3       $5A6D   $5A79   $5CF8   $5DB3  
;;  $59E0       $594A   $5C8D  
;;  $5A2B       $59E0  
;;  $5A35       $5A31  
;;  $5A37       $5A2F  
;;  $5A3F       $5A3B  
;;  $5A41       $5A39  
;;  $5A57       $5A4F   $5A69   $5D01   $5D0A  
;;  $5A60       $5D43  
;;  $5A67       $5A64  
;;  $5A77       $5A71  
;;  $5A7B       $5920   $5960   $5C13  
;;  $5A99       $5A82   $5AA7   $5AAC  
;;  $5A9F       $592C   $5D8B  
;;  $5AAE       $5AA2  
;;  $5AB6       $5AB3  
;;  $5AC6       $5CBE  
;;  $5AC7       $59DE  
;;  $5AC9       $5C7E  
;;  $5ACB       $5CA9  
;;  $5AE1       $5A9D   $5ADE  
;;  $5AF7       $5ADC  
;;  $5AF8       $5922  
;;  $5B06       $5AFC   $5B00  
;;  $5B17       $5B14  
;;  $5B1B       $5B0C  
;;  $5B2C       $5B29  
;;  $5B32       $5B24   $5B2F  
;;  $5B3A       $5924  
;;  $5B4C       $5B49  
;;  $5B50       $5B41  
;;  $5B61       $5B5E  
;;  $5B67       $5B59   $5B64  
;;  $5B6C       $5B35   $5B38   $5B69  
;;  $5B77       $5B19   $5B4E  
;;  $5B88       $5B7F  
;;  $5B8E       $5B8A  
;;  $5B93       $5B7D   $5B82   $5B86   $5B8F  
;;  $5BAA       $5926   $5C6C   $5D81  
;;  $5BBD       $5BB6  
;;  $5BC3       $5A97   $5BAF   $5D31  
;;  $5BD6       $5BBB   $5BD2  
;;  $5BDA       $5BC1  
;;  $5BE4       $5BDF  
;;  $5BE5       $5928   $5D79  
;;  $5C09       $5ABC   $5AC4   $5BE8  
;;  $5C0C       $5C62  
;;  $5C15       $5AA9   $5C09   $5CA1  
;;  $5C2C       $592A  
;;  $5C3F       $5F3E  
;;  $5C5A       $5B04  
;;  $5C6E       $5C5E  
;;  $5C79       $5C5C  
;;  $5C7B       $5C73   $5C77  
;;  $5C80       $5932  
;;  $5C8F       $5C87  
;;  $5CA1       $5C9D   $5CAF  
;;  $5CAB       $5C93  
;;  $5CB1       $5C95  
;;  $5CC6       $5CB5  
;;  $5CCE       $5CBA  
;;  $5CD4       $5CB3  
;;  $5CDE       $5CD6  
;;  $5CEA       $5CDE  
;;  $5CF5       $5CF1  
;;  $5CF7       $5CEF  
;;  $5CFA       $5A45   $5A55   $5D96  
;;  $5D20       $5D1D  
;;  $5D33       $5D1A  
;;  $5D34       $5D22   $5D28  
;;  $5D37       $5D56  
;;  $5D3E       $5D3A   $5D40   $5D4A   $5D86   $5DAB   $5DAF  
;;  $5D45       $5D13  
;;  $5D4C       $5D46  
;;  $5D54       $5D51  
;;  $5D58       $5D15  
;;  $5D60       $5D5B  
;;  $5D61       $5D5F  
;;  $5D7B       $5D69   $5D6F  
;;  $5D83       $5D63  
;;  $5D88       $5A47   $5C82  
;;  $5D98       $5D90  
;;  $5DB1       $5D9C   $5DA0  
;;  $5DD0       $5DBB   $5DC0   $5DCA  
;;  $5DD1       $5DC5  
;;  $5E1D       $5E0F  
;;  $5E27       $5E11  
;;  $5E33       $5E15   $5E1B   $5E1F   $5E25   $5E2D  
;;  $5E5B       $5E53   $5E57  
;;  $5E7F       $5DEE   $5DF3   $5DF8   $5E01   $5E05   $5E19   $5E23   $5E29  
;;  $5E7F       $5E31  
;;  $5E93       $5E89  
;;  $5EAC       $5EA3   $5EA9  
;;  $5EAF       $5EB7   $5EBA  
;;  $5EB2       $5EAD  
;;  $5EB3       $5EB0  
;;  $5EC5       $5EC1  
;;  $5ECD       $5E95  
;;  $5EE1       $6D4F   $6D5F  
;;  $5EE2       $5EE0  
;;  $5EFA       $5EF6  
;;  $5F00       $5EFD  
;;  $5F07       $54AA  
;;  $5F08       $5F06  
;;  $5F40       $5F15  
;;  $5F4D       $5F4A  
;;  $5F55       $5F6C  
;;  $5F56       $5F11  
;;  $5F63       $5F13  
;;  $5F68       $5F58   $5F61  
;;  $5F6E       $5F53  
;;  $5F75       $5ED9  
;;  $5F85       $5F81  
;;  $5F9B       $5F93  
;;  $5FA0       $5F99  
;;  $5FA9       $5F97   $5F9E  
;;  $5FAA       $5FA3   $62E7   $6D7C  
;;  $5FAC       $511D   $5DE2   $5E5E   $5F00   $6D8C  
;;  $5FAD       $6F8C  
;;  $5FBA       $5FBF  
;;  $5FC1       $5FBB  
;;  $5FC7       $5FCC  
;;  $5FCE       $5FC8  
;;  $5FE0       $5FD1   $5FD6  
;;  $5FEC       $5FE3  
;;  $600D       $6007  
;;  $6098       $61B8  
;;  $60A4       $6099  
;;  $60A8       $60BD   $60C8   $60CE   $60D4   $60D9  
;;  $60B3       $60B0  
;;  $60BF       $60B5  
;;  $60D2       $60C4  
;;  $60DB       $60D0  
;;  $60E5       $60AB   $60B9  
;;  $60E7       $61EC   $61FA  
;;  $60F9       $60EC  
;;  $6104       $60EE   $60F9  
;;  $610B       $611D  
;;  $611F       $611A   $612F   $6139  
;;  $612C       $6126  
;;  $6131       $612A  
;;  $6136       $6133  
;;  $6141       $610E   $6118   $6122  
;;  $6168       $615E  
;;  $616C       $615A  
;;  $6170       $6156   $6162  
;;  $6171       $6166   $616A   $616E  
;;  $617D       $6175  
;;  $6180       $680D   $69A1  
;;  $6181       $6384  
;;  $6191       $617B   $63E2  
;;  $6193       $6063  
;;  $61BE       $6076  
;;  $61C4       $6195  
;;  $61D3       $61CD  
;;  $61E6       $61C8  
;;  $6208       $61D4   $61D8   $61E4   $61F2  
;;  $6211       $620E  
;;  $621C       $6218  
;;  $6230       $6221  
;;  $6237       $622B   $622E  
;;  $6247       $61C2  
;;  $6258       $6254  
;;  $6267       $614D   $618A  
;;  $6270       $6146   $614A  
;;  $6283       $6274   $6277   $628E  
;;  $6288       $6281  
;;  $6290       $628A  
;;  $62B2       $62AC  
;;  $630C       $62C6  
;;  $630E       $62C4  
;;  $6313       $62CD   $62D5   $62D9  
;;  $6321       $6319  
;;  $6339       $6333  
;;  $636A       $62C9   $62DD   $6311   $631F   $6323   $6327   $632E  
;;  $639F       $6382  
;;  $63A8       $63A4  
;;  $63AC       $6395  
;;  $63C2       $638C   $63B0   $63B5  
;;  $63C6       $639D   $63AA  
;;  $63D5       $638F  
;;  $63DE       $63DA  
;;  $63E4       $6424   $645A   $656A   $66F8  
;;  $63E5       $619A   $61BB   $61FE   $626A   $6389  
;;  $63EE       $63C0  
;;  $640D       $63FF   $6403   $6409  
;;  $6413       $63E8  
;;  $6414       $641C   $6470   $64C4   $6519  
;;  $6416       $6419  
;;  $641F       $5F72   $6422  
;;  $6439       $643D  
;;  $644F       $644C   $6532   $653F  
;;  $6460       $6469  
;;  $6463       $6466  
;;  $64C9       $648B  
;;  $64D3       $6485   $64CF  
;;  $64D8       $6446  
;;  $64DF       $64E2  
;;  $64EC       $64F2  
;;  $64F4       $64EE  
;;  $64FD       $6480  
;;  $6526       <entry>
;;  $652E       $652A  
;;  $652F       $652C  
;;  $653B       $6547  
;;  $6545       $653D  
;;  $6553       $654B   $654E  
;;  $656A       $6564  
;;  $656D       $6556   $655B   $6568  
;;  $6578       $656F   $6573  
;;  $6581       $65B7   $65BB  
;;  $6593       $6590  
;;  $6598       $657F  
;;  $65C2       $659F  
;;  $65CC       $657C   $65C7  
;;  $65CD       $6576  
;;  $65E1       $65DA  
;;  $65E3       $65D0  
;;  $6607       $6603  
;;  $660A       $660F   $6612  
;;  $6611       $660B  
;;  $6614       $65FB  
;;  $661A       $660D  
;;  $661C       $661E  
;;  $661D       $661B  
;;  $663E       $6638  
;;  $6644       $6626  
;;  $664F       $664B  
;;  $666C       $6659  
;;  $6676       $6642   $6657  
;;  $6678       $666A  
;;  $667F       $65F1  
;;  $6683       $65F3  
;;  $6685       $667D   $6681  
;;  $6692       $668E  
;;  $6697       $66AD  
;;  $66AA       $65E6  
;;  $66B7       $6536   $65EA   $6618   $6695   $66A8   $66B1  
;;  $66E0       $66DC   $66F0  
;;  $66EF       $66E7  
;;  $66F0       $66EE  
;;  $66F2       $66E3  
;;  $66FD       $66EB  
;;  $670D       $66BA   $66C8   $66FB  
;;  $673A       $6720  
;;  $673E       $6722  
;;  $6740       $6738   $673C  
;;  $6751       $6715  
;;  $675C       $674C   $67E2  
;;  $675D       $6775   $6792  
;;  $676B       $6757   $67ED  
;;  $679C       $6771   $6778  
;;  $679D       $6719   $6748   $674F   $675A  
;;  $67C3       $67BC  
;;  $67D0       $67AB  
;;  $67D4       $67AD  
;;  $67D6       $67CE   $67D2  
;;  $67E7       $67A0  
;;  $67F0       $6710   $67A4   $67DE   $67E5  
;;  $680D       $67F7  
;;  $6810       $67F3  
;;  $6817       $67FB   $680B   $6813  
;;  $6842       $6836  
;;  $684D       $6840  
;;  $6851       $683E   $684B  
;;  $6854       $681E  
;;  $6863       $681A  
;;  $6874       $686A  
;;  $6893       $688A  
;;  $68A5       $6891   $689D  
;;  $68A6       $6823   $6852   $6861   $6866   $6872   $6877   $68AA  
;;  $68D1       $68C1  
;;  $68D5       $68C3   $68CF  
;;  $68E0       $68DB  
;;  $68E8       $68E5  
;;  $68F0       $68B4  
;;  $68F7       $68B2  
;;  $6908       $68F5   $68FA   $6900  
;;  $6919       $6911   $6913  
;;  $6920       $691C  
;;  $695D       $6946  
;;  $6967       $693E  
;;  $6984       $696D  
;;  $698E       $6955   $697C  
;;  $69A4       $699F  
;;  $69A8       $6917   $6925   $695B   $6965   $6982   $698C   $698F  
;;  $69BF       $69B6  
;;  $69DA       $69AE  
;;  $69EB       $69E3  
;;  $69FB       $69DD  
;;  $6A14       $6A02  
;;  $6A22       $6A30  
;;  $6A2A       $6A00  
;;  $6A32       $690C   $69AC   $69BD   $69D8   $69F9   $6A12   $6A28  
;;  $6A80       <entry>
;;  $6A8C       $6B4B   $6BB3   $6BCE   $6C4A   $6C7D  
;;  $6A96       $6436  
;;  $6B43       $5AC1  
;;  $6B44       $6A35   $6B8F  
;;  $6B91       $5F03  
;;  $6BB0       $6550  
;;  $6BB1       $6BC9  
;;  $6BCB       $6367  
;;  $6BFB       $646B  
;;  $6C19       $5BE1  
;;  $6C33       $63D1  
;;  $6C47       $670A  
;;  $6C54       $5FA6   $62EA  
;;  $6C66       $6290  
;;  $6C7A       $5E7C  
;;  $6C7B       $6B47   $6C89  
;;  $6C8B       $5DE5  
;;  $6CA3       $5C05  
;;  $6CBF       $5CCA  
;;  $6CE8       $6CDB  
;;  $6D00       $6D14  
;;  $6D11       $6D0D  
;;  $6D18       $6CF7  
;;  $6D31       $6D2D  
;;  $6D40       $6D3B  
;;  $6D53       $6D43  
;;  $6D62       $6D54  
;;  $6D70       $6D6A  
;;  $6D80       $6D71  
;;  $6D8F       $6D64   $6D6E   $6D81  
;;  $6D91       $6CEB  
;;  $6DAA       $6D94   $6D9E  
;;  $6DB9       $6CF5  
;;  $6DD5       $6DBC   $6DCD  
;;  $6DF1       $6CE6   $6CF1   $6CFE   $6D16   $6DB7   $6DD8   $6DE9   $6F65  
;;  $6DF1       $6F6E   $6F74   $6F7D  
;;  $6DF4       $6D8F  
;;  $6E02       $6DF8   $6DFB  
;;  $6E03       $6CEF   $6DB0  
;;  $6E51       $6E4F  
;;  $6E65       $6E3E  
;;  $6E6F       $6E6B  
;;  $6E7E       $6E3A   $6E78  
;;  $6ED7       $6EB0  
;;  $6EE0       $6E73   $6EDB   $6F62  
;;  $6EEC       $6EE3   $6EE8  
;;  $6F05       $6E81   $6E86   $6EAC   $6EDE  
;;  $6F4C       $6F4A  
;;  $6F5E       $6F37  
;;  $6F65       $6F08   $6F0D   $6F33  
;;  $6F67       $6CD9  
;;  $6F8F       $6F69  
;;  $6FAE       $6F9C  
;;  $6FBB       $6F9E  
;;  $6FC7       $6FAC   $6FB9  
;;  $6FD8       $6FD4  
;;  $6FE4       $6FEC  
;;  $6FE9       $6FEE  
;;  $6FF0       $6FE7  
;; ======================================================================== ;;
