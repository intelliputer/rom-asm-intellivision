
        ORG     $5000
.HEADER:
        BIDECLE $0000           ; 5000  Ptr: MOB graphic images
        BIDECLE $5034           ; 5002  Ptr: EXEC timer table
        BIDECLE $D1C6           ; 5004  Ptr: Start of game
        BIDECLE $5CA1           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5C8F           ; 5008  Ptr: GRAM init sequence
        BIDECLE $D000           ; 500A  Ptr: Date/Title
        DECLE   $00C0           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $000D   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $000D   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $0040,  $00C0,  $00C6,  $00C3   ; 5014   0040 00C0 00C6 00C3
        DECLE   $0082,  $0080,  $009C,  $008E   ; 5018   0082 0080 009C 008E
        DECLE   $00C0,  $0040,  $0000,  $0000   ; 501C   00C0 0040 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5020   0000 0000 0000 0000
        DECLE   $0040,  $0040,  $00C6,  $00C3   ; 5024   0040 0040 00C6 00C3
        DECLE   $0082,  $0080,  $008E,  $009C   ; 5028   0082 0080 008E 009C
        DECLE   $00C0,  $00C0,  $0000,  $0000   ; 502C   00C0 00C0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5030   0000 0000 0000 0000
.TIMER:
        DECLE   $000F,  $00D2,  $00E8,  $0003; 5034  Timer dispatch/interval
        BIDECLE $0000           ; 5038  End of timer table

        DECLE   $0000,  $0000,  $00D8,  $00D6   ; 503A   0000 0000 00D8 00D6
        DECLE   $00D4,  $00D3,  $00D2,  $00D1   ; 503E   00D4 00D3 00D2 00D1
        DECLE   $00D0,  $00D0,  $00D0,  $00D0   ; 5042   00D0 00D0 00D0 00D0
        DECLE   $00D0,  $00D1,  $00D2,  $00D3   ; 5046   00D0 00D1 00D2 00D3
        DECLE   $00D4,  $00D6,  $00D8,  $0053   ; 504A   00D4 00D6 00D8 0053
        DECLE   $0006,  $0054,  $0006,  $0055   ; 504E   0006 0054 0006 0055
        DECLE   $0000,  $0055,  $0000,  $00FD   ; 5052   0000 0055 0000 00FD
        DECLE   $0002,  $00FD,  $0002,  $0000   ; 5056   0002 00FD 0002 0000
        DECLE   $0000,  $002B,  $0000,  $00DB   ; 505A   0000 002B 0000 00DB
        DECLE   $0000,  $005C,  $0000,  $0059   ; 505E   0000 005C 0000 0059
        DECLE   $0000,  $0059,  $0000,  $00D8   ; 5062   0000 0059 0000 00D8
        DECLE   $0000,  $00D8,  $0000,  $0000   ; 5066   0000 00D8 0000 0000
        DECLE   $0000,  $003D,  $0001,  $00F2   ; 506A   0000 003D 0001 00F2
        DECLE   $0019,  $00CD,  $0009,  $00C2   ; 506E   0019 00CD 0009 00C2
        DECLE   $0019,  $00BB,  $0009,  $00E2   ; 5072   0019 00BB 0009 00E2
        DECLE   $0019,  $00D3,  $0009,  $0077   ; 5076   0019 00D3 0009 0077
        DECLE   $0006,  $009A,  $0009,  $00A9   ; 507A   0006 009A 0009 00A9
        DECLE   $005E,  $00D9,  $005D,  $0014   ; 507E   005E 00D9 005D 0014
        DECLE   $0050,  $00C0,  $0038,  $0001   ; 5082   0050 00C0 0038 0001
        DECLE   $0001,  $0001,  $0001,  $0053   ; 5086   0001 0001 0001 0053
        DECLE   $0000                           ; 508A   0000

        RSWD    R4                              ; 508B   003C
        COMR    R6                              ; 508C   001E
L_508D:
        PSHR    R5                              ; 508D   0275
        MVII    #$0048, R0                      ; 508E   02B8 0048
        SDBD                                    ; 5090   0001
        MVII    #$5D91, R5                      ; 5091   02BD 0091 005D
        SDBD                                    ; 5094   0001
        MVII    #$39B8, R4                      ; 5095   02BC 00B8 0039
L_5098:
        MVI@    R5,     R1                      ; 5098   02A9
        MVO@    R1,     R4                      ; 5099   0261
        DECR    R0                              ; 509A   0010
        BNEQ    L_5098                          ; 509B   022C 0004
        PULR    R7                              ; 509D   02B7

L_509E:
        PSHR    R5                              ; 509E   0275
        MVII    #$0018, R0                      ; 509F   02B8 0018
        SDBD                                    ; 50A1   0001
        MVII    #$504D, R5                      ; 50A2   02BD 004D 0050
        CLRR    R4                              ; 50A5   01E4
L_50A6:
        SDBD                                    ; 50A6   0001
        MVI@    R5,     R1                      ; 50A7   02A9
        MVO@    R1,     R4                      ; 50A8   0261
        DECR    R0                              ; 50A9   0010
        BNEQ    L_50A6                          ; 50AA   022C 0005
        PULR    R7                              ; 50AC   02B7

L_50AD:
        JSR     R5,     L_F92F                  ; 50AD   0004 01F8 012F

        MVII    #$02C9, R4                      ; 50B0   02BC 02C9
        MVII    #$0027, R0                      ; 50B2   02B8 0027

        JSR     R5,     X_FILL_ZERO             ; 50B4   0004 0114 0338

        MVI     G_035B, R0                      ; 50B7   0280 035B
        MVII    #$0004, R1                      ; 50B9   02B9 0004
        MVII    #$0007, R3                      ; 50BB   02BB 0007
        MVII    #$0246, R4                      ; 50BD   02BC 0246

        JSR     R5,     X_PRNUM_ZRO             ; 50BF   0004 0118 00AD

        MVI     G_035C, R0                      ; 50C2   0280 035C
        MVII    #$0004, R1                      ; 50C4   02B9 0004
        MVII    #$0007, R3                      ; 50C6   02BB 0007
        MVII    #$0242, R4                      ; 50C8   02BC 0242

        JSR     R5,     X_PRNUM_RGT             ; 50CA   0004 0118 00C5

        MVII    #$0087, R0                      ; 50CD   02B8 0087
        MVO     R0,     .BTAB.4A                ; 50CF   0240 024A
        J       L_6B0E                          ; 50D1   0004 0368 030E

L_50D4:
        MVII    #$0001, R0                      ; 50D4   02B8 0001
        MVO     R0,     G_01BF                  ; 50D6   0240 01BF
        SDBD                                    ; 50D8   0001
        MVII    #$60CC, R0                      ; 50D9   02B8 00CC 0060
        MVO     R0,     G_0357                  ; 50DC   0240 0357
        MVII    #$0001, R0                      ; 50DE   02B8 0001
        INCR    R7                              ; 50E0   000F

L_50E1:
        CLRR    R0                              ; 50E1   01C0
L_50E2:
        MVO     R0,     G_01BD                  ; 50E2   0240 01BD
        MVII    #$0005, R0                      ; 50E4   02B8 0005
        MVO     R0,     G_015D                  ; 50E6   0240 015D
        CLRR    R0                              ; 50E8   01C0
        EIS                                     ; 50E9   0002
        MVO     R0,     G_035C                  ; 50EA   0240 035C
        MVO     R0,     G_035B                  ; 50EC   0240 035B
L_50EE:
        MVII    #$0001, R0                      ; 50EE   02B8 0001
        INCR    R7                              ; 50F0   000F

L_50F1:
        CLRR    R0                              ; 50F1   01C0
L_50F2:
        XORI    #$0001, R0                      ; 50F2   03F8 0001
        MVO     R0,     G_01BC                  ; 50F4   0240 01BC
        MVI     G_01BD, R0                      ; 50F6   0280 01BD
        TSTR    R0                              ; 50F8   0080
        BEQ     L_5106                          ; 50F9   0204 000B

        MVII    #$0005, R0                      ; 50FB   02B8 0005
        MVO     R0,     G_015E                  ; 50FD   0240 015E
        CLRR    R0                              ; 50FF   01C0
        MVO     R0,     G_0359                  ; 5100   0240 0359
        MVO     R0,     G_035A                  ; 5102   0240 035A
        B       L_530B                          ; 5104   0200 0205

L_5106:
        MVI     G_015E, R0                      ; 5106   0280 015E
        INCR    R0                              ; 5108   0008
        CMPI    #$0007, R0                      ; 5109   0378 0007
        BEQ     L_510F                          ; 510B   0204 0002

        MVO     R0,     G_015E                  ; 510D   0240 015E
L_510F:
        MVI     G_035B, R0                      ; 510F   0280 035B
        MVO     R0,     G_0359                  ; 5111   0240 0359

        JSR     R5,     .EXEC.60A               ; 5113   0004 0114 020A

        MVI     G_035C, R0                      ; 5116   0280 035C
        MVO     R0,     G_035A                  ; 5118   0240 035A

        JSR     R5,     L_F92F                  ; 511A   0004 01F8 012F

        MVII    #$02C9, R4                      ; 511D   02BC 02C9
        MVII    #$0027, R0                      ; 511F   02B8 0027

        JSR     R5,     X_FILL_ZERO             ; 5121   0004 0114 0338

        MVI     G_0359, R0                      ; 5124   0280 0359
        MVII    #$0004, R1                      ; 5126   02B9 0004
        MVII    #$0007, R3                      ; 5128   02BB 0007
        MVII    #$0246, R4                      ; 512A   02BC 0246

        JSR     R5,     X_PRNUM_ZRO             ; 512C   0004 0118 00AD

        MVI     G_035A, R0                      ; 512F   0280 035A
        MVII    #$0004, R1                      ; 5131   02B9 0004
        MVII    #$0007, R3                      ; 5133   02BB 0007
        MVII    #$0242, R4                      ; 5135   02BC 0242

        JSR     R5,     X_PRNUM_RGT             ; 5137   0004 0118 00C5

        MVII    #$0087, R0                      ; 513A   02B8 0087
        MVO     R0,     .BTAB.4A                ; 513C   0240 024A
        MVI     G_01BC, R0                      ; 513E   0280 01BC
        TSTR    R0                              ; 5140   0080
        BEQ     L_51E2                          ; 5141   0204 009F

        CLRR    R0                              ; 5143   01C0
L_5144:
        DECR    R0                              ; 5144   0010
        BNEQ    L_5144                          ; 5145   022C 0002

        MVII    #$0204, R4                      ; 5147   02BC 0204
        MVII    #$0003, R3                      ; 5149   02BB 0003

        JSR     R5,     X_PRINT_R5              ; 514B   0004 0118 007B
        STRING  "Time Bonus"                    ; 514E  
        DECLE   $0000                           ; 5158   0000

        MVI     G_01AE, R0                      ; 5159   0280 01AE
        MVII    #$0003, R3                      ; 515B   02BB 0003
        MVII    #$0218, R4                      ; 515D   02BC 0218
        MVII    #$0002, R1                      ; 515F   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 5161   0004 0118 00C5

        MVI     G_015F, R0                      ; 5164   0280 015F
        CMPI    #$0005, R0                      ; 5166   0378 0005
        BC      L_518F                          ; 5168   0201 0025

        MVII    #$0003, R3                      ; 516A   02BB 0003
        MVII    #$021A, R4                      ; 516C   02BC 021A

        JSR     R5,     X_PRINT_R5              ; 516E   0004 0118 007B
        STRING  "x200=    0"                    ; 5171  
        DECLE   $0000                           ; 517B   0000

        MVI     G_01AE, R2                      ; 517C   0282 01AE
        SLL     R2,     2                       ; 517E   004E
        PSHR    R2                              ; 517F   0272
        SLL     R2,     2                       ; 5180   004E
        ADD@    R6,     R2                      ; 5181   02F2
        MOVR    R2,     R0                      ; 5182   0090
        PSHR    R0                              ; 5183   0270
        MVII    #$0004, R1                      ; 5184   02B9 0004
        MVII    #$021F, R4                      ; 5186   02BC 021F
        MVII    #$0003, R3                      ; 5188   02BB 0003

        JSR     R5,     X_PRNUM_RGT             ; 518A   0004 0118 00C5

        B       L_51B3                          ; 518D   0200 0024

L_518F:
        MVII    #$0003, R3                      ; 518F   02BB 0003
        MVII    #$021A, R4                      ; 5191   02BC 021A

        JSR     R5,     X_PRINT_R5              ; 5193   0004 0118 007B
        STRING  "x400=    0"                    ; 5196  
        DECLE   $0000                           ; 51A0   0000

        MVI     G_01AE, R2                      ; 51A1   0282 01AE
        SLL     R2,     2                       ; 51A3   004E
        PSHR    R2                              ; 51A4   0272
        SLL     R2,     2                       ; 51A5   004E
        ADD@    R6,     R2                      ; 51A6   02F2
        SLL     R2,     1                       ; 51A7   004A
        MOVR    R2,     R0                      ; 51A8   0090
        PSHR    R0                              ; 51A9   0270
        MVII    #$0004, R1                      ; 51AA   02B9 0004
        MVII    #$021F, R4                      ; 51AC   02BC 021F
        MVII    #$0003, R3                      ; 51AE   02BB 0003

        JSR     R5,     X_PRNUM_RGT             ; 51B0   0004 0118 00C5

L_51B3:
        PULR    R0                              ; 51B3   02B0
        ADD     G_0359, R0                      ; 51B4   02C0 0359
        MVI     G_035A, R1                      ; 51B6   0281 035A
        SDBD                                    ; 51B8   0001
        CMPI    #$2710, R0                      ; 51B9   0378 0010 0027
        BNC     L_51C8                          ; 51BC   0209 000A

        INCR    R1                              ; 51BE   0009
        SDBD                                    ; 51BF   0001
        SUBI    #$2710, R0                      ; 51C0   0338 0010 0027
        MVI     G_015D, R3                      ; 51C3   0283 015D
        INCR    R3                              ; 51C5   000B
        MVO     R3,     G_015D                  ; 51C6   0243 015D
L_51C8:
        MVO     R0,     G_0359                  ; 51C8   0240 0359
        MVO     R1,     G_035A                  ; 51CA   0241 035A
        MVI     G_0359, R0                      ; 51CC   0280 0359
        MVII    #$0004, R1                      ; 51CE   02B9 0004
        MVII    #$0007, R3                      ; 51D0   02BB 0007
        MVII    #$0246, R4                      ; 51D2   02BC 0246

        JSR     R5,     X_PRNUM_ZRO             ; 51D4   0004 0118 00AD

        MVI     G_035A, R0                      ; 51D7   0280 035A
        MVII    #$0004, R1                      ; 51D9   02B9 0004
        MVII    #$0007, R3                      ; 51DB   02BB 0007
        MVII    #$0242, R4                      ; 51DD   02BC 0242

        JSR     R5,     X_PRNUM_RGT             ; 51DF   0004 0118 00C5
L_51E2:
        JSR     R5,     .EXEC.A83               ; 51E2   0004 0118 0283

        CLRR    R0                              ; 51E5   01C0
        MVO     R0,     G_0102                  ; 51E6   0240 0102
        MVII    #$0026, R0                      ; 51E8   02B8 0026
        MVII    #$0011, R1                      ; 51EA   02B9 0011
        MVO     R0,     .ISRVEC.0               ; 51EC   0240 0100
        MVO     R1,     .ISRVEC.1               ; 51EE   0241 0101

        JSR     R5,     L_DD24                  ; 51F0   0004 01DC 0124

        MVO     R0,     .STIC.VIDEN             ; 51F3   0240 0020

        JSR     R5,     L_509E                  ; 51F5   0004 0150 009E
        JSR     R5,     L_DD24                  ; 51F8   0004 01DC 0124

        MVO     R0,     .STIC.VIDEN             ; 51FB   0240 0020

        JSR     R5,     L_508D                  ; 51FD   0004 0150 008D

        MVI     G_0359, R0                      ; 5200   0280 0359
        MVO     R0,     G_035B                  ; 5202   0240 035B
        MVI     G_035A, R0                      ; 5204   0280 035A
        MVO     R0,     G_035C                  ; 5206   0240 035C
        MVII    #$0001, R2                      ; 5208   02BA 0001
        SDBD                                    ; 520A   0001
        MVII    #$5DD9, R0                      ; 520B   02B8 00D9 005D
        MVO     R0,     G_0339                  ; 520E   0240 0339
        SDBD                                    ; 5210   0001
        MVII    #$5EA9, R0                      ; 5211   02B8 00A9 005E
        MVO     R0,     G_033A                  ; 5214   0240 033A
        MVII    #$005A, R3                      ; 5216   02BB 005A
L_5218:
        DECR    R2                              ; 5218   0012
        BNEQ    L_5237                          ; 5219   020C 001C

        MVII    #$0002, R2                      ; 521B   02BA 0002
        MVI     G_033A, R1                      ; 521D   0281 033A
        ADDI    #$0010, R1                      ; 521F   02F9 0010
        MVI     G_0339, R0                      ; 5221   0280 0339
        ADDI    #$0010, R0                      ; 5223   02F8 0010
        SDBD                                    ; 5225   0001
        CMPI    #$5E99, R0                      ; 5226   0378 0099 005E
        BNEQ    L_5233                          ; 5229   020C 0008

        SDBD                                    ; 522B   0001
        MVII    #$5EA9, R1                      ; 522C   02B9 00A9 005E
        SDBD                                    ; 522F   0001
        MVII    #$5DD9, R0                      ; 5230   02B8 00D9 005D
L_5233:
        MVO     R0,     G_0339                  ; 5233   0240 0339
        MVO     R1,     G_033A                  ; 5235   0241 033A

L_5237:
        JSR     R5,     L_DD24                  ; 5237   0004 01DC 0124

        MVO     R0,     .STIC.VIDEN             ; 523A   0240 0020
        MVII    #$0010, R0                      ; 523C   02B8 0010
        MVI     G_0339, R4                      ; 523E   0284 0339
        SDBD                                    ; 5240   0001
        MVII    #$39E0, R5                      ; 5241   02BD 00E0 0039
L_5244:
        MVI@    R4,     R1                      ; 5244   02A1
        MVO@    R1,     R5                      ; 5245   0269
        DECR    R0                              ; 5246   0010
        BNEQ    L_5244                          ; 5247   022C 0004

        MVII    #$0010, R0                      ; 5249   02B8 0010
        MVI     G_033A, R4                      ; 524B   0284 033A
        SDBD                                    ; 524D   0001
        MVII    #$39D0, R5                      ; 524E   02BD 00D0 0039
L_5251:
        MVI@    R4,     R1                      ; 5251   02A1
        MVO@    R1,     R5                      ; 5252   0269
        DECR    R0                              ; 5253   0010
        BNEQ    L_5251                          ; 5254   022C 0004

        MVI     .STIC.X.4,R0                    ; 5256   0280 0004
        INCR    R0                              ; 5258   0008
        MVO     R0,     .STIC.X.4               ; 5259   0240 0004
        MVI     .STIC.X.5,R0                    ; 525B   0280 0005
        INCR    R0                              ; 525D   0008
        MVO     R0,     .STIC.X.5               ; 525E   0240 0005
        CMPI    #$0010, R3                      ; 5260   037B 0010
        BC      L_526F                          ; 5262   0201 000B

        PSHR    R3                              ; 5264   0273
        SDBD                                    ; 5265   0001
        ADDI    #$503C, R3                      ; 5266   02FB 003C 0050
        MVI@    R3,     R0                      ; 5269   0298
        MVO     R0,     .STIC.Y.4               ; 526A   0240 000C
        MVO     R0,     .STIC.Y.5               ; 526C   0240 000D
        PULR    R3                              ; 526E   02B3
L_526F:
        PSHR    R2                              ; 526F   0272
        PSHR    R3                              ; 5270   0273
        PULR    R3                              ; 5271   02B3
        PULR    R2                              ; 5272   02B2
        PSHR    R2                              ; 5273   0272
        PSHR    R3                              ; 5274   0273

        JSR     R5,     L_6040                  ; 5275   0004 0160 0040

        PULR    R3                              ; 5278   02B3
        PULR    R2                              ; 5279   02B2
        DECR    R3                              ; 527A   0013
        BNEQ    L_5218                          ; 527B   022C 0064

        JSR     R5,     L_DD24                  ; 527D   0004 01DC 0124

        MVI     .STIC.X.2,R0                    ; 5280   0280 0002
        XORI    #$0200, R0                      ; 5282   03F8 0200
        MVO     R0,     .STIC.X.2               ; 5284   0240 0002
        MVO     R0,     .STIC.X.3               ; 5286   0240 0003
        CLRR    R0                              ; 5288   01C0
        MVO     R0,     .STIC.X.4               ; 5289   0240 0004
        MVO     R0,     .STIC.X.5               ; 528B   0240 0005
        MVO     R0,     .STIC.VIDEN             ; 528D   0240 0020
        MVII    #$0064, R3                      ; 528F   02BB 0064

L_5291:
        JSR     R5,     L_DD24                  ; 5291   0004 01DC 0124

        MVO     R0,     .STIC.VIDEN             ; 5294   0240 0020
        PSHR    R3                              ; 5296   0273
        PULR    R3                              ; 5297   02B3
        PSHR    R2                              ; 5298   0272
        PSHR    R3                              ; 5299   0273

        JSR     R5,     L_6040                  ; 529A   0004 0160 0040

        PULR    R3                              ; 529D   02B3
        PULR    R2                              ; 529E   02B2
        DECR    R3                              ; 529F   0013
        BNEQ    L_5291                          ; 52A0   022C 0010

        JSR     R5,     L_69C5                  ; 52A2   0004 0168 01C5
        BIDECLE $6AAE                           ; 52A5   00AE 006A

        MVII    #$0001, R2                      ; 52A7   02BA 0001
        SDBD                                    ; 52A9   0001
        MVII    #$5014, R0                      ; 52AA   02B8 0014 0050
        MVO     R0,     G_0339                  ; 52AD   0240 0339
        MVII    #$0032, R3                      ; 52AF   02BB 0032
L_52B1:
        DECR    R2                              ; 52B1   0012
        BNEQ    L_52BC                          ; 52B2   020C 0008

        MVII    #$0010, R2                      ; 52B4   02BA 0010
        MVI     G_0339, R1                      ; 52B6   0281 0339
        XORI    #$0030, R1                      ; 52B8   03F9 0030
        MVO     R1,     G_0339                  ; 52BA   0241 0339

L_52BC:
        JSR     R5,     L_DD24                  ; 52BC   0004 01DC 0124

        MVO     R0,     .STIC.VIDEN             ; 52BF   0240 0020
        MVII    #$0010, R0                      ; 52C1   02B8 0010
        MVI     G_0339, R4                      ; 52C3   0284 0339
        SDBD                                    ; 52C5   0001
        MVII    #$39F0, R5                      ; 52C6   02BD 00F0 0039
L_52C9:
        MVI@    R4,     R1                      ; 52C9   02A1
        MVO@    R1,     R5                      ; 52CA   0269
        DECR    R0                              ; 52CB   0010
        BNEQ    L_52C9                          ; 52CC   022C 0004

        MVI     .STIC.X.0,R0                    ; 52CE   0280 0000
        ADDI    #$0002, R0                      ; 52D0   02F8 0002
        MVO     R0,     .STIC.X.0               ; 52D2   0240 0000
        MVI     .STIC.X.1,R0                    ; 52D4   0280 0001
        INCR    R0                              ; 52D6   0008
        INCR    R0                              ; 52D7   0008
        MVO     R0,     .STIC.X.1               ; 52D8   0240 0001
        MVI     .STIC.X.2,R0                    ; 52DA   0280 0002
        INCR    R0                              ; 52DC   0008
        INCR    R0                              ; 52DD   0008
        MVO     R0,     .STIC.X.2               ; 52DE   0240 0002
        MVI     .STIC.X.3,R0                    ; 52E0   0280 0003
        INCR    R0                              ; 52E2   0008
        INCR    R0                              ; 52E3   0008
        MVO     R0,     .STIC.X.3               ; 52E4   0240 0003
        MVI     .STIC.Y.3,R0                    ; 52E6   0280 000B
        DECR    R0                              ; 52E8   0010
        MVO     R0,     .STIC.Y.3               ; 52E9   0240 000B
        MVI     .STIC.Y.2,R0                    ; 52EB   0280 000A
        DECR    R0                              ; 52ED   0010
        MVO     R0,     .STIC.Y.2               ; 52EE   0240 000A
        MVI     .STIC.Y.1,R0                    ; 52F0   0280 0009
        DECR    R0                              ; 52F2   0010
        MVO     R0,     .STIC.Y.1               ; 52F3   0240 0009
        MVI     .STIC.Y.0,R0                    ; 52F5   0280 0008
        DECR    R0                              ; 52F7   0010
        MVO     R0,     .STIC.Y.0               ; 52F8   0240 0008
        PSHR    R2                              ; 52FA   0272
        PSHR    R3                              ; 52FB   0273

        JSR     R5,     L_699C                  ; 52FC   0004 0168 019C

        PULR    R3                              ; 52FF   02B3
        PULR    R2                              ; 5300   02B2
        PSHR    R2                              ; 5301   0272
        PSHR    R3                              ; 5302   0273

        JSR     R5,     L_6040                  ; 5303   0004 0160 0040

        PULR    R3                              ; 5306   02B3
        PULR    R2                              ; 5307   02B2
        DECR    R3                              ; 5308   0013
        BNEQ    L_52B1                          ; 5309   022C 0059

L_530B:
        MVII    #$0084, R0                      ; 530B   02B8 0084
        MVO     R0,     G_0102                  ; 530D   0240 0102
        MVII    #$02F1, R6                      ; 530F   02BE 02F1
L_5311:
        MVI     G_0102, R0                      ; 5311   0280 0102
        CMPI    #$0084, R0                      ; 5313   0378 0084
        BEQ     L_5311                          ; 5315   0224 0005

        EIS                                     ; 5317   0002
        MVII    #$0090, R0                      ; 5318   02B8 0090
        MVO     R0,     G_0102                  ; 531A   0240 0102
L_531C:
        MVI     G_0102, R0                      ; 531C   0280 0102
        CMPI    #$0090, R0                      ; 531E   0378 0090
        BEQ     L_531C                          ; 5320   0224 0005

        MVII    #$0051, R0                      ; 5322   02B8 0051
        MVII    #$0160, R4                      ; 5324   02BC 0160

        JSR     R5,     X_FILL_ZERO             ; 5326   0004 0114 0338

        SDBD                                    ; 5329   0001
        MVII    #$5085, R5                      ; 532A   02BD 0085 0050
        MVII    #$0008, R0                      ; 532D   02B8 0008
L_532F:
        MVI@    R5,     R1                      ; 532F   02A9
        MVO@    R1,     R4                      ; 5330   0261
        DECR    R0                              ; 5331   0010
        BNEQ    L_532F                          ; 5332   022C 0004

        CLRR    R0                              ; 5334   01C0
        MVO     R0,     G_01BB                  ; 5335   0240 01BB
        MVII    #$00F0, R0                      ; 5337   02B8 00F0
        MVII    #$0200, R4                      ; 5339   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 533B   0004 0114 0338

        MVII    #$0082, R0                      ; 533E   02B8 0082
        MVO     R0,     .BTAB.EC                ; 5340   0240 02EC
        DECR    R0                              ; 5342   0010
        MVO     R0,     .BTAB.EF                ; 5343   0240 02EF
        SDBD                                    ; 5345   0001
        MVII    #$0993, R0                      ; 5346   02B8 0093 0009
        MVO     R0,     .BTAB.DD                ; 5349   0240 02DD
        SDBD                                    ; 534B   0001
        MVII    #$2168, R0                      ; 534C   02B8 0068 0021
        MVO     R0,     .BTAB.E1                ; 534F   0240 02E1
        SDBD                                    ; 5351   0001
        MVII    #$2000, R0                      ; 5352   02B8 0000 0020
        MVO     R0,     .BTAB.E2                ; 5355   0240 02E2
        SDBD                                    ; 5357   0001
        MVII    #$098B, R0                      ; 5358   02B8 008B 0009
        MVO     R0,     .BTAB.E5                ; 535B   0240 02E5
        CLRR    R0                              ; 535D   01C0
        MVO     R0,     G_01B9                  ; 535E   0240 01B9
        MVII    #$0014, R0                      ; 5360   02B8 0014
        MVII    #$031D, R5                      ; 5362   02BD 031D
        MOVR    R7,     R4                      ; 5364   00BC
        SDBD                                    ; 5365   0001
        ADDI    #$04E1, R4                      ; 5366   02FC 00E1 0004
L_5369:
        SDBD                                    ; 5369   0001
        MVI@    R4,     R1                      ; 536A   02A1
        MVO@    R1,     R5                      ; 536B   0269
        DECR    R0                              ; 536C   0010
        BNEQ    L_5369                          ; 536D   022C 0005

        ADDI    #$0008, R5                      ; 536F   02FD 0008
        MVII    #$0003, R0                      ; 5371   02B8 0003
L_5373:
        SDBD                                    ; 5373   0001
        MVI@    R4,     R1                      ; 5374   02A1
        MVO@    R1,     R5                      ; 5375   0269
        DECR    R0                              ; 5376   0010
        BNEQ    L_5373                          ; 5377   022C 0005

        SDBD                                    ; 5379   0001
        MVI@    R4,     R1                      ; 537A   02A1
        MVO     R1,     G_0342                  ; 537B   0241 0342
        EIS                                     ; 537D   0002
        MVII    #$001B, R0                      ; 537E   02B8 001B
        MVII    #$0058, R1                      ; 5380   02B9 0058
        MVO     R0,     .ISRVEC.0               ; 5382   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5384   0241 0101
L_5386:
        DECR    R7                              ; 5386   0017

        MVII    #$0273, R0                      ; 5387   02B8 0273
        MVII    #$0056, R1                      ; 5389   02B9 0056
        MVO     R0,     .ISRVEC.0               ; 538B   0240 0100
        MVO     R1,     .ISRVEC.1               ; 538D   0241 0101

        JSR     R5,     L_69C5                  ; 538F   0004 0168 01C5
        BIDECLE $6A62                           ; 5392   0062 006A

        MVII    #$0001, R1                      ; 5394   02B9 0001
        MVO     R1,     G_01A4                  ; 5396   0241 01A4
L_5398:
        MVI     G_01A4, R1                      ; 5398   0281 01A4
        TSTR    R1                              ; 539A   0089
        BNEQ    L_5398                          ; 539B   022C 0004

        MVI     G_015E, R0                      ; 539D   0280 015E
        DECR    R0                              ; 539F   0010
        BNEQ    L_53A6                          ; 53A0   020C 0004

        MVII    #$0032, R0                      ; 53A2   02B8 0032
        MVO     R0,     G_01B7                  ; 53A4   0240 01B7
L_53A6:
        MVII    #$0001, R1                      ; 53A6   02B9 0001
        MVO     R1,     G_01A4                  ; 53A8   0241 01A4
L_53AA:
        MVI     G_01A4, R1                      ; 53AA   0281 01A4
        TSTR    R1                              ; 53AC   0089
        BNEQ    L_53AA                          ; 53AD   022C 0004

        JSR     R5,     L_64C2                  ; 53AF   0004 0164 00C2
        JSR     R5,     L_5AF1                  ; 53B2   0004 0158 02F1
        JSR     R5,     L_54A7                  ; 53B5   0004 0154 00A7
        JSR     R5,     L_589A                  ; 53B8   0004 0158 009A
        JSR     R5,     L_5876                  ; 53BB   0004 0158 0076
        JSR     R5,     L_6343                  ; 53BE   0004 0160 0343
        JSR     R5,     L_6073                  ; 53C1   0004 0160 0073
        JSR     R5,     L_64E4                  ; 53C4   0004 0164 00E4
        JSR     R5,     L_55E6                  ; 53C7   0004 0154 01E6

        B       L_53A6                          ; 53CA   0220 0025

        PSHR    R5                              ; 53CC   0275
        MVO     R0,     .STIC.VIDEN             ; 53CD   0240 0020
        CLRR    R0                              ; 53CF   01C0
        MVI     .STIC.C.6,R0                    ; 53D0   0280 001E
        ANDI    #$0100, R0                      ; 53D2   03B8 0100
        MVO     R0,     .STIC.C.6               ; 53D4   0240 001E
        MVO     R0,     G_0337                  ; 53D6   0240 0337
        CLRR    R0                              ; 53D8   01C0
        MVO     R0,     .STIC.X.7               ; 53D9   0240 0007
        MVO     R0,     G_0324                  ; 53DB   0240 0324
        MVI     G_01A4, R0                      ; 53DD   0280 01A4
        DECR    R0                              ; 53DF   0010
        MVO     R0,     G_01A4                  ; 53E0   0240 01A4
        MVI     G_01B0, R1                      ; 53E2   0281 01B0
        INCR    R1                              ; 53E4   0009
        MVO     R1,     G_01B0                  ; 53E5   0241 01B0
        CMPI    #$0064, R1                      ; 53E7   0379 0064
        BNC     L_53F1                          ; 53E9   0209 0006

        SUBI    #$0064, R1                      ; 53EB   0339 0064
        MVII    #$008A, R0                      ; 53ED   02B8 008A
        MVO     R0,     .BTAB.EA                ; 53EF   0240 02EA
L_53F1:
        ADDR    R1,     R1                      ; 53F1   00C9
        SDBD                                    ; 53F2   0001
        ADDI    #$5B9A, R1                      ; 53F3   02F9 009A 005B
        MVI@    R1,     R0                      ; 53F6   0288
        ADDI    #$0002, R0                      ; 53F7   02F8 0002
        MVO     R0,     .BTAB.EB                ; 53F9   0240 02EB
        INCR    R1                              ; 53FB   0009
        MVI@    R1,     R0                      ; 53FC   0288
        ADDI    #$0002, R0                      ; 53FD   02F8 0002
        MVO     R0,     .BTAB.EC                ; 53FF   0240 02EC
        MVI     G_0359, R0                      ; 5401   0280 0359
        ADDI    #$0032, R0                      ; 5403   02F8 0032
        SDBD                                    ; 5405   0001
        CMPI    #$2710, R0                      ; 5406   0378 0010 0027
        BNC     L_5426                          ; 5409   0209 001B

        SDBD                                    ; 540B   0001
        SUBI    #$2710, R0                      ; 540C   0338 0010 0027
        MVI     G_015D, R1                      ; 540F   0281 015D
        INCR    R1                              ; 5411   0009
        MVO     R1,     G_015D                  ; 5412   0241 015D
        PSHR    R2                              ; 5414   0272
        PSHR    R1                              ; 5415   0271
        MVII    #$00C8, R2                      ; 5416   02BA 00C8
        MVO     R2,     G_01B9                  ; 5418   0242 01B9

        JSR     R5,     L_69FE                  ; 541A   0004 0168 01FE
        BIDECLE $6A9B                           ; 541D   009B 006A

        PULR    R1                              ; 541F   02B1
        PULR    R2                              ; 5420   02B2
        MVI     G_035A, R1                      ; 5421   0281 035A
        INCR    R1                              ; 5423   0009
        MVO     R1,     G_035A                  ; 5424   0241 035A
L_5426:
        MVO     R0,     G_0359                  ; 5426   0240 0359

        JSR     R5,     L_69C5                  ; 5428   0004 0168 01C5
        BIDECLE $6A16                           ; 542B   0016 006A

        PULR    R7                              ; 542D   02B7

        PSHR    R5                              ; 542E   0275
        MVO     R0,     .STIC.VIDEN             ; 542F   0240 0020
        SDBD                                    ; 5431   0001
        MVII    #$0677, R0                      ; 5432   02B8 0077 0006
        MVO     R0,     G_032F                  ; 5435   0240 032F
        CLRR    R0                              ; 5437   01C0
        MVO     R0,     G_01A0                  ; 5438   0240 01A0
        MVO     R0,     .STIC.X.6               ; 543A   0240 0006
        MVO     R0,     G_0189                  ; 543C   0240 0189
        MVO     R0,     .STIC.C.0               ; 543E   0240 0018
        MVO     R0,     .STIC.C.1               ; 5440   0240 0019
        MVO     R0,     .STIC.C.2               ; 5442   0240 001A
        MVO     R0,     .STIC.C.3               ; 5444   0240 001B
        MVII    #$01A5, R4                      ; 5446   02BC 01A5
        MVII    #$0006, R1                      ; 5448   02B9 0006
L_544A:
        MVO@    R0,     R4                      ; 544A   0260
        DECR    R1                              ; 544B   0011
        BNEQ    L_544A                          ; 544C   022C 0003

        MVO     R0,     G_018A                  ; 544E   0240 018A
        MVI     G_01A4, R1                      ; 5450   0281 01A4
        DECR    R1                              ; 5452   0011
        MVO     R1,     G_01A4                  ; 5453   0241 01A4
        CMPI    #$0003, R1                      ; 5455   0379 0003
        BC      L_545B                          ; 5457   0201 0002

        MVO     R0,     .STIC.X.7               ; 5459   0240 0007
L_545B:
        ANDI    #$0004, R4                      ; 545B   03BC 0004
        BNEQ    L_5817                          ; 545D   020C 03B8

        MVI     .STIC.Y.0,R0                    ; 545F   0280 0008
        SDBD                                    ; 5461   0001
        XORI    #$0400, R0                      ; 5462   03F8 0000 0004
        MVO     R0,     .STIC.Y.0               ; 5465   0240 0008
        MVI     .STIC.Y.1,R0                    ; 5467   0280 0009
        SDBD                                    ; 5469   0001
        XORI    #$0400, R0                      ; 546A   03F8 0000 0004
        MVO     R0,     .STIC.Y.1               ; 546D   0240 0009
        MVI     .STIC.Y.2,R0                    ; 546F   0280 000A
        SDBD                                    ; 5471   0001
        XORI    #$0400, R0                      ; 5472   03F8 0000 0004
        MVO     R0,     .STIC.Y.2               ; 5475   0240 000A
        MVI     .STIC.Y.3,R0                    ; 5477   0280 000B
        SDBD                                    ; 5479   0001
        XORI    #$0400, R0                      ; 547A   03F8 0000 0004
        MVO     R0,     .STIC.Y.3               ; 547D   0240 000B
        MVI     .STIC.Y.0,R0                    ; 547F   0280 0008
        ANDI    #$007F, R0                      ; 5481   03B8 007F
        CMPI    #$003F, R0                      ; 5483   0378 003F
        BEQ     L_54A3                          ; 5485   0204 001C

        MVI     .STIC.Y.0,R0                    ; 5487   0280 0008
        INCR    R0                              ; 5489   0008
        MVO     R0,     G_017B                  ; 548A   0240 017B
        MVO     R0,     .STIC.Y.0               ; 548C   0240 0008
        MVI     .STIC.Y.1,R0                    ; 548E   0280 0009
        INCR    R0                              ; 5490   0008
        MVO     R0,     G_017C                  ; 5491   0240 017C
        MVO     R0,     .STIC.Y.1               ; 5493   0240 0009
        MVI     .STIC.Y.2,R0                    ; 5495   0280 000A
        INCR    R0                              ; 5497   0008
        MVO     R0,     G_017D                  ; 5498   0240 017D
        MVO     R0,     .STIC.Y.2               ; 549A   0240 000A
        MVI     .STIC.Y.3,R0                    ; 549C   0280 000B
        INCR    R0                              ; 549E   0008
        MVO     R0,     G_017E                  ; 549F   0240 017E
        MVO     R0,     .STIC.Y.3               ; 54A1   0240 000B

L_54A3:
        JSR     R5,     L_699C                  ; 54A3   0004 0168 019C

        PULR    R7                              ; 54A6   02B7

L_54A7:
        PSHR    R5                              ; 54A7   0275
        MVI     G_0331, R0                      ; 54A8   0280 0331
        ANDI    #$0180, R0                      ; 54AA   03B8 0180
        BNEQ    L_54C0                          ; 54AC   020C 0012

        MVI     G_0332, R0                      ; 54AE   0280 0332
        ANDI    #$0180, R0                      ; 54B0   03B8 0180
        BNEQ    L_54C0                          ; 54B2   020C 000C

        MVI     G_0333, R0                      ; 54B4   0280 0333
        ANDI    #$0180, R0                      ; 54B6   03B8 0180
        BNEQ    L_54C0                          ; 54B8   020C 0006

        MVI     G_0334, R0                      ; 54BA   0280 0334
        ANDI    #$0180, R0                      ; 54BC   03B8 0180
        BEQ     L_550E                          ; 54BE   0204 004E

L_54C0:
        DIS                                     ; 54C0   0003
        MVII    #$002E, R0                      ; 54C1   02B8 002E
        MVII    #$0054, R1                      ; 54C3   02B9 0054
        MVO     R0,     .ISRVEC.0               ; 54C5   0240 0100
        MVO     R1,     .ISRVEC.1               ; 54C7   0241 0101

        JSR     R5,     L_6B9C                  ; 54C9   0004 0168 039C

        EIS                                     ; 54CC   0002

        JSR     R5,     L_69FE                  ; 54CD   0004 0168 01FE
        BIDECLE $6A3C                           ; 54D0   003C 006A

        MVI     G_01BB, R1                      ; 54D2   0281 01BB
        TSTR    R1                              ; 54D4   0089
        BEQ     L_54DD                          ; 54D5   0204 0006

        ADDI    #$02C7, R1                      ; 54D7   02F9 02C7
        CLRR    R0                              ; 54D9   01C0
        MVO@    R0,     R1                      ; 54DA   0248
        MVO     R0,     G_01BB                  ; 54DB   0240 01BB
L_54DD:
        MVII    #$00A0, R0                      ; 54DD   02B8 00A0
        MVO     R0,     G_01A4                  ; 54DF   0240 01A4
L_54E1:
        MVI     G_01A4, R0                      ; 54E1   0280 01A4
        TSTR    R0                              ; 54E3   0080
        BNEQ    L_54E1                          ; 54E4   022C 0004

        MVII    #$00A0, R0                      ; 54E6   02B8 00A0
        MVII    #$0200, R4                      ; 54E8   02BC 0200
        CLRR    R1                              ; 54EA   01C9
L_54EB:
        MVO@    R1,     R4                      ; 54EB   0261
        DECR    R0                              ; 54EC   0010
        BNEQ    L_54EB                          ; 54ED   022C 0003

        DIS                                     ; 54EF   0003
        MVII    #$0273, R0                      ; 54F0   02B8 0273
        MVII    #$0056, R1                      ; 54F2   02B9 0056
        MVO     R0,     .ISRVEC.0               ; 54F4   0240 0100
        MVO     R1,     .ISRVEC.1               ; 54F6   0241 0101
        EIS                                     ; 54F8   0002

        JSR     R5,     L_69C5                  ; 54F9   0004 0168 01C5
        BIDECLE $6A62                           ; 54FC   0062 006A

        MVI     G_015D, R2                      ; 54FE   0282 015D
        DECR    R2                              ; 5500   0012
        MVO     R2,     G_015D                  ; 5501   0242 015D
        BPL     L_550E                          ; 5503   0203 0009

        MVII    #$02F1, R6                      ; 5505   02BE 02F1
        MVII    #$0083, R0                      ; 5507   02B8 0083
        MVO     R0,     .BTAB.DC                ; 5509   0240 02DC
        J       L_6AFC                          ; 550B   0004 0368 02FC

L_550E:
        MVI     G_0189, R0                      ; 550E   0280 0189
        TSTR    R0                              ; 5510   0080
        BEQ     L_55B0                          ; 5511   0204 009D

        MVII    #$0161, R4                      ; 5513   02BC 0161
        MVII    #$0167, R3                      ; 5515   02BB 0167
        MVI     G_0179, R0                      ; 5517   0280 0179
        MVI     G_0181, R1                      ; 5519   0281 0181
        CLRR    R2                              ; 551B   01D2
L_551C:
        MVI@    R4,     R5                      ; 551C   02A5
        SUBR    R0,     R5                      ; 551D   0105
        ADDI    #$000E, R5                      ; 551E   02FD 000E
        CMPI    #$000D, R5                      ; 5520   037D 000D
        BC      L_552C                          ; 5522   0201 0008

        MVI@    R3,     R5                      ; 5524   029D
        SUBR    R1,     R5                      ; 5525   010D
        ADDI    #$000D, R5                      ; 5526   02FD 000D
        CMPI    #$0007, R5                      ; 5528   037D 0007
        BNC     L_5534                          ; 552A   0209 0008

L_552C:
        INCR    R3                              ; 552C   000B
        INCR    R2                              ; 552D   000A
        CMPI    #$0006, R2                      ; 552E   037A 0006
        BNEQ    L_551C                          ; 5530   022C 0015
        B       L_55B0                          ; 5532   0200 007C

L_5534:
        ADDI    #$01A5, R2                      ; 5534   02FA 01A5
        MVI@    R2,     R5                      ; 5536   0295
        SUBI    #$01A5, R2                      ; 5537   033A 01A5
        DECR    R5                              ; 5539   0015
        BMI     L_552C                          ; 553A   022B 000F

        PSHR    R5                              ; 553C   0275
        PSHR    R2                              ; 553D   0272
        PSHR    R0                              ; 553E   0270
        GSWD    R0                              ; 553F   0030
        PSHR    R0                              ; 5540   0270

        JSR     R5,     L_69C5                  ; 5541   0004 0168 01C5
        BIDECLE $6A29                           ; 5544   0029 006A

        PULR    R0                              ; 5546   02B0
        RSWD    R0                              ; 5547   0038
        PULR    R0                              ; 5548   02B0
        PULR    R2                              ; 5549   02B2
        PULR    R5                              ; 554A   02B5
        BNEQ    L_55AB                          ; 554B   020C 005E

        PSHR    R5                              ; 554D   0275
        MOVR    R2,     R0                      ; 554E   0090

        JSR     R5,     L_691D                  ; 554F   0004 0168 011D

        PSHR    R0                              ; 5552   0270

        JSR     R5,     L_69C5                  ; 5553   0004 0168 01C5
        BIDECLE $6A16                           ; 5556   0016 006A

        PULR    R0                              ; 5558   02B0
        PULR    R5                              ; 5559   02B5
        MVI     G_01B0, R2                      ; 555A   0282 01B0
        INCR    R2                              ; 555C   000A
        MVO     R2,     G_01B0                  ; 555D   0242 01B0
        PSHR    R0                              ; 555F   0270
        CMPI    #$0064, R2                      ; 5560   037A 0064
        BNC     L_556A                          ; 5562   0209 0006

        SUBI    #$0064, R2                      ; 5564   033A 0064
        MVII    #$008A, R0                      ; 5566   02B8 008A
        MVO     R0,     .BTAB.EA                ; 5568   0240 02EA
L_556A:
        ADDR    R2,     R2                      ; 556A   00D2
        SDBD                                    ; 556B   0001
        ADDI    #$5B9A, R2                      ; 556C   02FA 009A 005B
        MVI@    R2,     R0                      ; 556F   0290
        ADDI    #$0002, R0                      ; 5570   02F8 0002
        MVO     R0,     .BTAB.EB                ; 5572   0240 02EB
        INCR    R2                              ; 5574   000A
        MVI@    R2,     R0                      ; 5575   0290
        ADDI    #$0002, R0                      ; 5576   02F8 0002
        MVO     R0,     .BTAB.EC                ; 5578   0240 02EC
        PSHR    R1                              ; 557A   0271
        PSHR    R2                              ; 557B   0272
        MVI     G_0359, R0                      ; 557C   0280 0359
        ADDI    #$0032, R0                      ; 557E   02F8 0032
        SDBD                                    ; 5580   0001
        CMPI    #$2710, R0                      ; 5581   0378 0010 0027
        BNC     L_55A5                          ; 5584   0209 001F

        SDBD                                    ; 5586   0001
        SUBI    #$2710, R0                      ; 5587   0338 0010 0027
        MVI     G_015D, R1                      ; 558A   0281 015D
        INCR    R1                              ; 558C   0009
        PSHR    R0                              ; 558D   0270
        PSHR    R1                              ; 558E   0271
        PSHR    R2                              ; 558F   0272
        PSHR    R5                              ; 5590   0275
        MVII    #$00C8, R2                      ; 5591   02BA 00C8
        MVO     R2,     G_01B9                  ; 5593   0242 01B9

        JSR     R5,     L_69FE                  ; 5595   0004 0168 01FE
        BIDECLE $6A9B                           ; 5598   009B 006A

        PULR    R5                              ; 559A   02B5
        PULR    R2                              ; 559B   02B2
        PULR    R1                              ; 559C   02B1
        PULR    R0                              ; 559D   02B0
        MVO     R1,     G_015D                  ; 559E   0241 015D
        MVI     G_035A, R1                      ; 55A0   0281 035A
        INCR    R1                              ; 55A2   0009
        MVO     R1,     G_035A                  ; 55A3   0241 035A
L_55A5:
        MVO     R0,     G_0359                  ; 55A5   0240 0359
        PULR    R2                              ; 55A7   02B2
        PULR    R1                              ; 55A8   02B1
        PULR    R0                              ; 55A9   02B0
        MOVR    R0,     R2                      ; 55AA   0082
L_55AB:
        ADDI    #$01A5, R2                      ; 55AB   02FA 01A5
        MVO@    R5,     R2                      ; 55AD   0255
        B       L_55DC                          ; 55AE   0200 002C

L_55B0:
        MVI     G_0337, R0                      ; 55B0   0280 0337
        ANDI    #$0080, R0                      ; 55B2   03B8 0080
        BEQ     L_55D4                          ; 55B4   0204 001E

        MVII    #$03CC, R0                      ; 55B6   02B8 03CC
        MVII    #$0053, R1                      ; 55B8   02B9 0053
        MVO     R0,     .ISRVEC.0               ; 55BA   0240 0100
        MVO     R1,     .ISRVEC.1               ; 55BC   0241 0101
        MVII    #$0001, R0                      ; 55BE   02B8 0001
        MVO     R0,     G_01A4                  ; 55C0   0240 01A4
L_55C2:
        MVI     G_01A4, R0                      ; 55C2   0280 01A4
        TSTR    R0                              ; 55C4   0080
        BNEQ    L_55C2                          ; 55C5   022C 0004

        MVII    #$0273, R0                      ; 55C7   02B8 0273
        MVII    #$0056, R1                      ; 55C9   02B9 0056
        MVO     R0,     .ISRVEC.0               ; 55CB   0240 0100
        MVO     R1,     .ISRVEC.1               ; 55CD   0241 0101
        CLRR    R0                              ; 55CF   01C0
        MVO     R0,     G_018A                  ; 55D0   0240 018A
        B       L_55DC                          ; 55D2   0200 0008

L_55D4:
        MVI     G_01A0, R0                      ; 55D4   0280 01A0
        DECR    R0                              ; 55D6   0010
        MVO     R0,     G_01A0                  ; 55D7   0240 01A0
        BMI     L_55DC                          ; 55D9   020B 0001
        PULR    R7                              ; 55DB   02B7

L_55DC:
        CLRR    R0                              ; 55DC   01C0
        MVII    #$0010, R1                      ; 55DD   02B9 0010
        MVO     R1,     G_032F                  ; 55DF   0241 032F
        MVO     R0,     G_01A0                  ; 55E1   0240 01A0
        MVO     R0,     G_0189                  ; 55E3   0240 0189
        PULR    R7                              ; 55E5   02B7

L_55E6:
        PSHR    R5                              ; 55E6   0275
        MVI     G_0160, R4                      ; 55E7   0284 0160
        TSTR    R4                              ; 55E9   00A4
        BNEQ    L_5615                          ; 55EA   020C 0029

        MVI     G_01AC, R0                      ; 55EC   0280 01AC
        ADD     G_0160, R0                      ; 55EE   02C0 0160
        BNEQ    L_55F6                          ; 55F0   020C 0004

        MVI     G_01B1, R5                      ; 55F2   0285 01B1
        MVO     R5,     G_01AE                  ; 55F4   0245 01AE

L_55F6:
        JSR     R5,     L_6947                  ; 55F6   0004 0168 0147

        MOVR    R0,     R1                      ; 55F9   0081
        ADDI    #$016D, R1                      ; 55FA   02F9 016D
        MVI@    R1,     R0                      ; 55FC   0288
        INCR    R0                              ; 55FD   0008
        ANDI    #$0003, R0                      ; 55FE   03B8 0003
        MVO@    R0,     R1                      ; 5600   0248
        MVI     G_0330, R0                      ; 5601   0280 0330
        ADDI    #$0008, R0                      ; 5603   02F8 0008
        MVO     R0,     G_0330                  ; 5605   0240 0330
        ANDI    #$0038, R0                      ; 5607   03B8 0038
        CMPI    #$0038, R0                      ; 5609   0378 0038
        BNEQ    L_5613                          ; 560B   020C 0006

        MVI     G_0330, R0                      ; 560D   0280 0330
        SUBI    #$0020, R0                      ; 560F   0338 0020
        MVO     R0,     G_0330                  ; 5611   0240 0330
L_5613:
        B       L_562E                          ; 5613   0200 0019

L_5615:
        MVI     G_0160, R0                      ; 5615   0280 0160
        ADD     G_01AC, R0                      ; 5617   02C0 01AC

        JSR     R5,     L_6947                  ; 5619   0004 0168 0147

        MOVR    R0,     R1                      ; 561C   0081
        ADDI    #$016D, R1                      ; 561D   02F9 016D
        MVI@    R1,     R0                      ; 561F   0288
        INCR    R0                              ; 5620   0008
        ANDI    #$0003, R0                      ; 5621   03B8 0003
        MVO@    R0,     R1                      ; 5623   0248
        MVI     G_01AC, R0                      ; 5624   0280 01AC
        INCR    R0                              ; 5626   0008
        CMPI    #$0003, R0                      ; 5627   0378 0003
        BNEQ    L_562C                          ; 5629   020C 0001

        CLRR    R0                              ; 562B   01C0
L_562C:
        MVO     R0,     G_01AC                  ; 562C   0240 01AC
L_562E:
        MVII    #$0003, R0                      ; 562E   02B8 0003
        MVI     G_0160, R4                      ; 5630   0284 0160
        ADDI    #$016D, R4                      ; 5632   02FC 016D
L_5634:
        MVI@    R4,     R2                      ; 5634   02A2
        SLL     R2,     2                       ; 5635   004E
        SLL     R2,     1                       ; 5636   004A
        SUBI    #$000D, R4                      ; 5637   033C 000D
        MVI@    R4,     R3                      ; 5639   02A3
        ANDI    #$0007, R3                      ; 563A   03BB 0007
        ADDR    R3,     R2                      ; 563C   00DA
        SLL     R2,     2                       ; 563D   004E
        SLL     R2,     2                       ; 563E   004E
        SLL     R2,     1                       ; 563F   004A
        SDBD                                    ; 5640   0001
        ADDI    #$6508, R2                      ; 5641   02FA 0008 0065
        ADDI    #$0005, R4                      ; 5644   02FC 0005
        MVI@    R4,     R3                      ; 5646   02A3
        ANDI    #$0007, R3                      ; 5647   03BB 0007
        SUBR    R3,     R2                      ; 5649   011A
        ADDI    #$01D4, R4                      ; 564A   02FC 01D4
        MVO@    R2,     R4                      ; 564C   0262
        SUBI    #$01CF, R4                      ; 564D   033C 01CF
        DECR    R0                              ; 564F   0010
        BNEQ    L_5634                          ; 5650   022C 001D

        MVI     G_0339, R0                      ; 5652   0280 0339
        ADDI    #$0010, R0                      ; 5654   02F8 0010
        SDBD                                    ; 5656   0001
        CMPI    #$5F69, R0                      ; 5657   0378 0069 005F
        BNEQ    L_566A                          ; 565A   020C 000E

        MVI     G_033B, R1                      ; 565C   0281 033B
        XORI    #$0030, R1                      ; 565E   03F9 0030
        MVO     R1,     G_033B                  ; 5660   0241 033B
        MVI     G_033A, R2                      ; 5662   0282 033A
        SUBI    #$00C0, R2                      ; 5664   033A 00C0
        MVO     R2,     G_033A                  ; 5666   0242 033A
        SUBI    #$00C0, R0                      ; 5668   0338 00C0
L_566A:
        MVO     R0,     G_0339                  ; 566A   0240 0339
        MVI     G_033A, R0                      ; 566C   0280 033A
        ADDI    #$0010, R0                      ; 566E   02F8 0010
        MVO     R0,     G_033A                  ; 5670   0240 033A
        PULR    R7                              ; 5672   02B7

        MVO     R0,     .STIC.VIDEN             ; 5673   0240 0020
        PSHR    R5                              ; 5675   0275
        MVII    #$031D, R4                      ; 5676   02BC 031D
        CLRR    R5                              ; 5678   01ED
        MVI@    R4,     R0                      ; 5679   02A0
        MVO@    R0,     R5                      ; 567A   0268
        MVI@    R4,     R0                      ; 567B   02A0
        MVO@    R0,     R5                      ; 567C   0268
        MVI@    R4,     R0                      ; 567D   02A0
        MVO@    R0,     R5                      ; 567E   0268
        MVI@    R4,     R0                      ; 567F   02A0
        MVO@    R0,     R5                      ; 5680   0268
        MVI@    R4,     R0                      ; 5681   02A0
        MVO@    R0,     R5                      ; 5682   0268
        MVI@    R4,     R0                      ; 5683   02A0
        MVO@    R0,     R5                      ; 5684   0268
        MVI@    R4,     R0                      ; 5685   02A0
        MVO@    R0,     R5                      ; 5686   0268
        MVI@    R4,     R0                      ; 5687   02A0
        MVO@    R0,     R5                      ; 5688   0268
        MVI@    R4,     R0                      ; 5689   02A0
        MVO@    R0,     R5                      ; 568A   0268
        MVI@    R4,     R0                      ; 568B   02A0
        MVO@    R0,     R5                      ; 568C   0268
        MVI@    R4,     R0                      ; 568D   02A0
        MVO@    R0,     R5                      ; 568E   0268
        MVI@    R4,     R0                      ; 568F   02A0
        MVO@    R0,     R5                      ; 5690   0268
        MVI@    R4,     R0                      ; 5691   02A0
        MVO@    R0,     R5                      ; 5692   0268
        MVI@    R4,     R0                      ; 5693   02A0
        MVO@    R0,     R5                      ; 5694   0268
        MVI@    R4,     R0                      ; 5695   02A0
        MVO@    R0,     R5                      ; 5696   0268
        MVI@    R4,     R0                      ; 5697   02A0
        MVO@    R0,     R5                      ; 5698   0268
        MVI@    R4,     R0                      ; 5699   02A0
        MVO     R0,     .STIC.A.4               ; 569A   0240 0014
        MVI@    R4,     R0                      ; 569C   02A0
        MVO     R0,     .STIC.A.5               ; 569D   0240 0015
        MVI@    R4,     R0                      ; 569F   02A0
        MVO     R0,     .STIC.A.6               ; 56A0   0240 0016
        MVI@    R4,     R0                      ; 56A2   02A0
        MVO     R0,     .STIC.A.7               ; 56A3   0240 0017
        CLRR    R1                              ; 56A5   01C9
        MVI     .STIC.C.0,R0                    ; 56A6   0280 0018
        MVO@    R0,     R4                      ; 56A8   0260
        MVO     R1,     .STIC.C.0               ; 56A9   0241 0018
        MVI     .STIC.C.1,R0                    ; 56AB   0280 0019
        MVO@    R0,     R4                      ; 56AD   0260
        MVO     R1,     .STIC.C.1               ; 56AE   0241 0019
        MVI     .STIC.C.2,R0                    ; 56B0   0280 001A
        MVO@    R0,     R4                      ; 56B2   0260
        MVO     R1,     .STIC.C.2               ; 56B3   0241 001A
        MVI     .STIC.C.3,R0                    ; 56B5   0280 001B
        MVO@    R0,     R4                      ; 56B7   0260
        MVO     R1,     .STIC.C.3               ; 56B8   0241 001B
        MVI     .STIC.C.4,R0                    ; 56BA   0280 001C
        MVO@    R0,     R4                      ; 56BC   0260
        MVO     R1,     .STIC.C.4               ; 56BD   0241 001C
        MVI     .STIC.C.5,R0                    ; 56BF   0280 001D
        MVO@    R0,     R4                      ; 56C1   0260
        MVO     R1,     .STIC.C.5               ; 56C2   0241 001D
        MVI     .STIC.C.6,R0                    ; 56C4   0280 001E
        MVO@    R0,     R4                      ; 56C6   0260
        MVO     R1,     .STIC.C.6               ; 56C7   0241 001E
        MVI     .STIC.C.7,R0                    ; 56C9   0280 001F
        MVO@    R0,     R4                      ; 56CB   0260
        MVO     R1,     .STIC.C.7               ; 56CC   0241 001F
        SDBD                                    ; 56CE   0001
        MVII    #$39D0, R5                      ; 56CF   02BD 00D0 0039
        MOVR    R4,     R3                      ; 56D2   00A3
        MVI@    R3,     R4                      ; 56D3   029C
        INCR    R3                              ; 56D4   000B
        MVI@    R4,     R0                      ; 56D5   02A0
        MVO@    R0,     R5                      ; 56D6   0268
        MVI@    R4,     R0                      ; 56D7   02A0
        MVO@    R0,     R5                      ; 56D8   0268
        MVI@    R4,     R0                      ; 56D9   02A0
        MVO@    R0,     R5                      ; 56DA   0268
        MVI@    R4,     R0                      ; 56DB   02A0
        MVO@    R0,     R5                      ; 56DC   0268
        MVI@    R4,     R0                      ; 56DD   02A0
        MVO@    R0,     R5                      ; 56DE   0268
        MVI@    R4,     R0                      ; 56DF   02A0
        MVO@    R0,     R5                      ; 56E0   0268
        MVI@    R4,     R0                      ; 56E1   02A0
        MVO@    R0,     R5                      ; 56E2   0268
        MVI@    R4,     R0                      ; 56E3   02A0
        MVO@    R0,     R5                      ; 56E4   0268
        MVI@    R4,     R0                      ; 56E5   02A0
        MVO@    R0,     R5                      ; 56E6   0268
        MVI@    R4,     R0                      ; 56E7   02A0
        MVO@    R0,     R5                      ; 56E8   0268
        MVI@    R4,     R0                      ; 56E9   02A0
        MVO@    R0,     R5                      ; 56EA   0268
        MVI@    R4,     R0                      ; 56EB   02A0
        MVO@    R0,     R5                      ; 56EC   0268
        MVI@    R4,     R0                      ; 56ED   02A0
        MVO@    R0,     R5                      ; 56EE   0268
        MVI@    R4,     R0                      ; 56EF   02A0
        MVO@    R0,     R5                      ; 56F0   0268
        MVI@    R4,     R0                      ; 56F1   02A0
        MVO@    R0,     R5                      ; 56F2   0268
        MVI@    R4,     R0                      ; 56F3   02A0
        MVO@    R0,     R5                      ; 56F4   0268
        MVI@    R3,     R4                      ; 56F5   029C
        INCR    R3                              ; 56F6   000B
        MVI@    R4,     R0                      ; 56F7   02A0
        MVO@    R0,     R5                      ; 56F8   0268
        MVI@    R4,     R0                      ; 56F9   02A0
        MVO@    R0,     R5                      ; 56FA   0268
        MVI@    R4,     R0                      ; 56FB   02A0
        MVO@    R0,     R5                      ; 56FC   0268
        MVI@    R4,     R0                      ; 56FD   02A0
        MVO@    R0,     R5                      ; 56FE   0268
        MVI@    R4,     R0                      ; 56FF   02A0
        MVO@    R0,     R5                      ; 5700   0268
        MVI@    R4,     R0                      ; 5701   02A0
        MVO@    R0,     R5                      ; 5702   0268
        MVI@    R4,     R0                      ; 5703   02A0
        MVO@    R0,     R5                      ; 5704   0268
        MVI@    R4,     R0                      ; 5705   02A0
        MVO@    R0,     R5                      ; 5706   0268
        MVI@    R4,     R0                      ; 5707   02A0
        MVO@    R0,     R5                      ; 5708   0268
        MVI@    R4,     R0                      ; 5709   02A0
        MVO@    R0,     R5                      ; 570A   0268
        MVI@    R4,     R0                      ; 570B   02A0
        MVO@    R0,     R5                      ; 570C   0268
        MVI@    R4,     R0                      ; 570D   02A0
        MVO@    R0,     R5                      ; 570E   0268
        MVI@    R4,     R0                      ; 570F   02A0
        MVO@    R0,     R5                      ; 5710   0268
        MVI@    R4,     R0                      ; 5711   02A0
        MVO@    R0,     R5                      ; 5712   0268
        MVI@    R4,     R0                      ; 5713   02A0
        MVO@    R0,     R5                      ; 5714   0268
        MVI@    R4,     R0                      ; 5715   02A0
        MVO@    R0,     R5                      ; 5716   0268
        MVI@    R3,     R4                      ; 5717   029C
        INCR    R3                              ; 5718   000B
        MVI@    R4,     R0                      ; 5719   02A0
        MVO@    R0,     R5                      ; 571A   0268
        MVI@    R4,     R0                      ; 571B   02A0
        MVO@    R0,     R5                      ; 571C   0268
        MVI@    R4,     R0                      ; 571D   02A0
        MVO@    R0,     R5                      ; 571E   0268
        MVI@    R4,     R0                      ; 571F   02A0
        MVO@    R0,     R5                      ; 5720   0268
        MVI@    R4,     R0                      ; 5721   02A0
        MVO@    R0,     R5                      ; 5722   0268
        MVI@    R4,     R0                      ; 5723   02A0
        MVO@    R0,     R5                      ; 5724   0268
        MVI@    R4,     R0                      ; 5725   02A0
        MVO@    R0,     R5                      ; 5726   0268
        MVI@    R4,     R0                      ; 5727   02A0
        MVO@    R0,     R5                      ; 5728   0268
        MVI@    R4,     R0                      ; 5729   02A0
        MVO@    R0,     R5                      ; 572A   0268
        MVI@    R4,     R0                      ; 572B   02A0
        MVO@    R0,     R5                      ; 572C   0268
        MVI@    R4,     R0                      ; 572D   02A0
        MVO@    R0,     R5                      ; 572E   0268
        MVI@    R4,     R0                      ; 572F   02A0
        MVO@    R0,     R5                      ; 5730   0268
        MVI@    R4,     R0                      ; 5731   02A0
        MVO@    R0,     R5                      ; 5732   0268
        MVI@    R4,     R0                      ; 5733   02A0
        MVO@    R0,     R5                      ; 5734   0268
        MVI@    R4,     R0                      ; 5735   02A0
        MVO@    R0,     R5                      ; 5736   0268
        MVI@    R4,     R0                      ; 5737   02A0
        MVO@    R0,     R5                      ; 5738   0268
        ADD     G_0160, R3                      ; 5739   02C3 0160
        MVI     G_0342, R5                      ; 573B   0285 0342
        MVI@    R3,     R4                      ; 573D   029C
        INCR    R3                              ; 573E   000B
        MVI@    R4,     R0                      ; 573F   02A0
        MVO@    R0,     R5                      ; 5740   0268
        MVI@    R4,     R0                      ; 5741   02A0
        MVO@    R0,     R5                      ; 5742   0268
        MVI@    R4,     R0                      ; 5743   02A0
        MVO@    R0,     R5                      ; 5744   0268
        MVI@    R4,     R0                      ; 5745   02A0
        MVO@    R0,     R5                      ; 5746   0268
        MVI@    R4,     R0                      ; 5747   02A0
        MVO@    R0,     R5                      ; 5748   0268
        MVI@    R4,     R0                      ; 5749   02A0
        MVO@    R0,     R5                      ; 574A   0268
        MVI@    R4,     R0                      ; 574B   02A0
        MVO@    R0,     R5                      ; 574C   0268
        MVI@    R4,     R0                      ; 574D   02A0
        MVO@    R0,     R5                      ; 574E   0268
        MVI@    R4,     R0                      ; 574F   02A0
        MVO@    R0,     R5                      ; 5750   0268
        MVI@    R4,     R0                      ; 5751   02A0
        MVO@    R0,     R5                      ; 5752   0268
        MVI@    R4,     R0                      ; 5753   02A0
        MVO@    R0,     R5                      ; 5754   0268
        MVI@    R4,     R0                      ; 5755   02A0
        MVO@    R0,     R5                      ; 5756   0268
        MVI@    R4,     R0                      ; 5757   02A0
        MVO@    R0,     R5                      ; 5758   0268
        MVI@    R4,     R0                      ; 5759   02A0
        MVO@    R0,     R5                      ; 575A   0268
        MVI@    R4,     R0                      ; 575B   02A0
        MVO@    R0,     R5                      ; 575C   0268
        MVI@    R4,     R0                      ; 575D   02A0
        MVO@    R0,     R5                      ; 575E   0268
        MVI@    R4,     R0                      ; 575F   02A0
        MVO@    R0,     R5                      ; 5760   0268
        MVI@    R4,     R0                      ; 5761   02A0
        MVO@    R0,     R5                      ; 5762   0268
        MVI@    R4,     R0                      ; 5763   02A0
        MVO@    R0,     R5                      ; 5764   0268
        MVI@    R4,     R0                      ; 5765   02A0
        MVO@    R0,     R5                      ; 5766   0268
        MVI@    R4,     R0                      ; 5767   02A0
        MVO@    R0,     R5                      ; 5768   0268
        MVI@    R4,     R0                      ; 5769   02A0
        MVO@    R0,     R5                      ; 576A   0268
        MVI@    R4,     R0                      ; 576B   02A0
        MVO@    R0,     R5                      ; 576C   0268
        MVI@    R4,     R0                      ; 576D   02A0
        MVO@    R0,     R5                      ; 576E   0268
        MVI@    R4,     R0                      ; 576F   02A0
        MVO@    R0,     R5                      ; 5770   0268
        MVI@    R4,     R0                      ; 5771   02A0
        MVO@    R0,     R5                      ; 5772   0268
        MVI@    R4,     R0                      ; 5773   02A0
        MVO@    R0,     R5                      ; 5774   0268
        MVI@    R4,     R0                      ; 5775   02A0
        MVO@    R0,     R5                      ; 5776   0268
        MVI@    R4,     R0                      ; 5777   02A0
        MVO@    R0,     R5                      ; 5778   0268
        MVI@    R4,     R0                      ; 5779   02A0
        MVO@    R0,     R5                      ; 577A   0268
        MVI@    R4,     R0                      ; 577B   02A0
        MVO@    R0,     R5                      ; 577C   0268
        MVI@    R4,     R0                      ; 577D   02A0
        MVO@    R0,     R5                      ; 577E   0268
        MVI@    R3,     R4                      ; 577F   029C
        INCR    R3                              ; 5780   000B
        MVI@    R4,     R0                      ; 5781   02A0
        MVO@    R0,     R5                      ; 5782   0268
        MVI@    R4,     R0                      ; 5783   02A0
        MVO@    R0,     R5                      ; 5784   0268
        MVI@    R4,     R0                      ; 5785   02A0
        MVO@    R0,     R5                      ; 5786   0268
        MVI@    R4,     R0                      ; 5787   02A0
        MVO@    R0,     R5                      ; 5788   0268
        MVI@    R4,     R0                      ; 5789   02A0
        MVO@    R0,     R5                      ; 578A   0268
        MVI@    R4,     R0                      ; 578B   02A0
        MVO@    R0,     R5                      ; 578C   0268
        MVI@    R4,     R0                      ; 578D   02A0
        MVO@    R0,     R5                      ; 578E   0268
        MVI@    R4,     R0                      ; 578F   02A0
        MVO@    R0,     R5                      ; 5790   0268
        MVI@    R4,     R0                      ; 5791   02A0
        MVO@    R0,     R5                      ; 5792   0268
        MVI@    R4,     R0                      ; 5793   02A0
        MVO@    R0,     R5                      ; 5794   0268
        MVI@    R4,     R0                      ; 5795   02A0
        MVO@    R0,     R5                      ; 5796   0268
        MVI@    R4,     R0                      ; 5797   02A0
        MVO@    R0,     R5                      ; 5798   0268
        MVI@    R4,     R0                      ; 5799   02A0
        MVO@    R0,     R5                      ; 579A   0268
        MVI@    R4,     R0                      ; 579B   02A0
        MVO@    R0,     R5                      ; 579C   0268
        MVI@    R4,     R0                      ; 579D   02A0
        MVO@    R0,     R5                      ; 579E   0268
        MVI@    R4,     R0                      ; 579F   02A0
        MVO@    R0,     R5                      ; 57A0   0268
        MVI@    R4,     R0                      ; 57A1   02A0
        MVO@    R0,     R5                      ; 57A2   0268
        MVI@    R4,     R0                      ; 57A3   02A0
        MVO@    R0,     R5                      ; 57A4   0268
        MVI@    R4,     R0                      ; 57A5   02A0
        MVO@    R0,     R5                      ; 57A6   0268
        MVI@    R4,     R0                      ; 57A7   02A0
        MVO@    R0,     R5                      ; 57A8   0268
        MVI@    R4,     R0                      ; 57A9   02A0
        MVO@    R0,     R5                      ; 57AA   0268
        MVI@    R4,     R0                      ; 57AB   02A0
        MVO@    R0,     R5                      ; 57AC   0268
        MVI@    R4,     R0                      ; 57AD   02A0
        MVO@    R0,     R5                      ; 57AE   0268
        MVI@    R4,     R0                      ; 57AF   02A0
        MVO@    R0,     R5                      ; 57B0   0268
        MVI@    R4,     R0                      ; 57B1   02A0
        MVO@    R0,     R5                      ; 57B2   0268
        MVI@    R4,     R0                      ; 57B3   02A0
        MVO@    R0,     R5                      ; 57B4   0268
        MVI@    R4,     R0                      ; 57B5   02A0
        MVO@    R0,     R5                      ; 57B6   0268
        MVI@    R4,     R0                      ; 57B7   02A0
        MVO@    R0,     R5                      ; 57B8   0268
        MVI@    R4,     R0                      ; 57B9   02A0
        MVO@    R0,     R5                      ; 57BA   0268
        MVI@    R4,     R0                      ; 57BB   02A0
        MVO@    R0,     R5                      ; 57BC   0268
        MVI@    R4,     R0                      ; 57BD   02A0
        MVO@    R0,     R5                      ; 57BE   0268
        MVI@    R4,     R0                      ; 57BF   02A0
        MVO@    R0,     R5                      ; 57C0   0268
        MVI@    R3,     R4                      ; 57C1   029C
        INCR    R3                              ; 57C2   000B
        MVI@    R4,     R0                      ; 57C3   02A0
        MVO@    R0,     R5                      ; 57C4   0268
        MVI@    R4,     R0                      ; 57C5   02A0
        MVO@    R0,     R5                      ; 57C6   0268
        MVI@    R4,     R0                      ; 57C7   02A0
        MVO@    R0,     R5                      ; 57C8   0268
        MVI@    R4,     R0                      ; 57C9   02A0
        MVO@    R0,     R5                      ; 57CA   0268
        MVI@    R4,     R0                      ; 57CB   02A0
        MVO@    R0,     R5                      ; 57CC   0268
        MVI@    R4,     R0                      ; 57CD   02A0
        MVO@    R0,     R5                      ; 57CE   0268
        MVI@    R4,     R0                      ; 57CF   02A0
        MVO@    R0,     R5                      ; 57D0   0268
        MVI@    R4,     R0                      ; 57D1   02A0
        MVO@    R0,     R5                      ; 57D2   0268
        MVI@    R4,     R0                      ; 57D3   02A0
        MVO@    R0,     R5                      ; 57D4   0268
        MVI@    R4,     R0                      ; 57D5   02A0
        MVO@    R0,     R5                      ; 57D6   0268
        MVI@    R4,     R0                      ; 57D7   02A0
        MVO@    R0,     R5                      ; 57D8   0268
        MVI@    R4,     R0                      ; 57D9   02A0
        MVO@    R0,     R5                      ; 57DA   0268
        MVI@    R4,     R0                      ; 57DB   02A0
        MVO@    R0,     R5                      ; 57DC   0268
        MVI@    R4,     R0                      ; 57DD   02A0
        MVO@    R0,     R5                      ; 57DE   0268
        MVI@    R4,     R0                      ; 57DF   02A0
        MVO@    R0,     R5                      ; 57E0   0268
        MVI@    R4,     R0                      ; 57E1   02A0
        MVO@    R0,     R5                      ; 57E2   0268
        MVI@    R4,     R0                      ; 57E3   02A0
        MVO@    R0,     R5                      ; 57E4   0268
        MVI@    R4,     R0                      ; 57E5   02A0
        MVO@    R0,     R5                      ; 57E6   0268
        MVI@    R4,     R0                      ; 57E7   02A0
        MVO@    R0,     R5                      ; 57E8   0268
        MVI@    R4,     R0                      ; 57E9   02A0
        MVO@    R0,     R5                      ; 57EA   0268
        MVI@    R4,     R0                      ; 57EB   02A0
        MVO@    R0,     R5                      ; 57EC   0268
        MVI@    R4,     R0                      ; 57ED   02A0
        MVO@    R0,     R5                      ; 57EE   0268
        MVI@    R4,     R0                      ; 57EF   02A0
        MVO@    R0,     R5                      ; 57F0   0268
        MVI@    R4,     R0                      ; 57F1   02A0
        MVO@    R0,     R5                      ; 57F2   0268
        MVI@    R4,     R0                      ; 57F3   02A0
        MVO@    R0,     R5                      ; 57F4   0268
        MVI@    R4,     R0                      ; 57F5   02A0
        MVO@    R0,     R5                      ; 57F6   0268
        MVI@    R4,     R0                      ; 57F7   02A0
        MVO@    R0,     R5                      ; 57F8   0268
        MVI@    R4,     R0                      ; 57F9   02A0
        MVO@    R0,     R5                      ; 57FA   0268
        MVI@    R4,     R0                      ; 57FB   02A0
        MVO@    R0,     R5                      ; 57FC   0268
        MVI@    R4,     R0                      ; 57FD   02A0
        MVO@    R0,     R5                      ; 57FE   0268
        MVI@    R4,     R0                      ; 57FF   02A0
        MVO@    R0,     R5                      ; 5800   0268
        MVI@    R4,     R0                      ; 5801   02A0
        MVO@    R0,     R5                      ; 5802   0268
        MVI     G_01A4, R0                      ; 5803   0280 01A4
        TSTR    R0                              ; 5805   0080
        BEQ     L_5817                          ; 5806   0204 000F

        MVI     G_0160, R0                      ; 5808   0280 0160
        XORI    #$0003, R0                      ; 580A   03F8 0003
        MVO     R0,     G_0160                  ; 580C   0240 0160
        MVI     G_0342, R0                      ; 580E   0280 0342
        XORI    #$01E0, R0                      ; 5810   03F8 01E0
        MVO     R0,     G_0342                  ; 5812   0240 0342
        CLRR    R1                              ; 5814   01C9
        MVO     R1,     G_01A4                  ; 5815   0241 01A4

L_5817:
        JSR     R5,     L_699C                  ; 5817   0004 0168 019C

        PULR    R7                              ; 581A   02B7

        PSHR    R5                              ; 581B   0275
        MOVR    R6,     R1                      ; 581C   00B1
        SUBI    #$0009, R1                      ; 581D   0339 0009
        MVI@    R1,     R0                      ; 581F   0288
        INCR    R0                              ; 5820   0008
        MVO@    R0,     R1                      ; 5821   0248
        MVO     R0,     .STIC.VIDEN             ; 5822   0240 0020
        MVII    #$0010, R5                      ; 5824   02BD 0010
        MOVR    R7,     R4                      ; 5826   00BC
        SDBD                                    ; 5827   0001
        ADDI    #$0017, R4                      ; 5828   02FC 0017 0000
        MVII    #$0004, R0                      ; 582B   02B8 0004
L_582D:
        SDBD                                    ; 582D   0001
        MVI@    R4,     R1                      ; 582E   02A1
        MVO@    R1,     R5                      ; 582F   0269
        DECR    R0                              ; 5830   0010
        BNEQ    L_582D                          ; 5831   022C 0005

        MVO     R0,     .STIC.C.0               ; 5833   0240 0018
        MVO     R0,     .STIC.C.1               ; 5835   0240 0019
        MVO     R0,     .STIC.C.2               ; 5837   0240 001A
        MVO     R0,     .STIC.C.3               ; 5839   0240 001B
        MVO     R0,     .STIC.C.5               ; 583B   0240 001D
        PULR    R7                              ; 583D   02B7

        DECLE   $00F2,  $0019,  $00CD,  $0009   ; 583E   00F2 0019 00CD 0009
        DECLE   $00C2,  $0019,  $00BB,  $0009   ; 5842   00C2 0019 00BB 0009
        DECLE   $0053,  $0007,  $0054,  $0007   ; 5846   0053 0007 0054 0007
        DECLE   $0055,  $0003,  $0055,  $0003   ; 584A   0055 0003 0055 0003
        DECLE   $0053,  $0002,  $0053,  $0002   ; 584E   0053 0002 0053 0002
        DECLE   $0000,  $0000,  $002B,  $0000   ; 5852   0000 0000 002B 0000
        DECLE   $00BF,  $0000,  $0040,  $0000   ; 5856   00BF 0000 0040 0000
        DECLE   $003D,  $0000,  $003D,  $0000   ; 585A   003D 0000 003D 0000
        DECLE   $00D8,  $0004,  $00D8,  $0004   ; 585E   00D8 0004 00D8 0004
        DECLE   $0000,  $0000,  $003D,  $0001   ; 5862   0000 0000 003D 0001

        ADDR    R4,     R7                      ; 5866   00E7

        RSWD    R1                              ; 5867   0039
        ADDR    R2,     R1                      ; 5868   00D1
        RSWD    R1                              ; 5869   0039
        RRC     R3,     2                       ; 586A   0077
        CLRC                                    ; 586B   0006
        MOVR    R3,     R2                      ; 586C   009A
        INCR    R1                              ; 586D   0009
        MOVR    R5,     R1                      ; 586E   00A9
        SLLC    R2,     2                       ; 586F   005E
        ADDR    R3,     R1                      ; 5870   00D9
        SLLC    R1,     2                       ; 5871   005D
        DECR    R4                              ; 5872   0014
        RLC     R0,     1                       ; 5873   0050
        ADDR    R0,     R0                      ; 5874   00C0
        RSWD    R0                              ; 5875   0038
L_5876:
        PSHR    R5                              ; 5876   0275
        MVI     G_017B, R0                      ; 5877   0280 017B
        ADD     G_019F, R0                      ; 5879   02C0 019F
        ANDI    #$007F, R0                      ; 587B   03B8 007F

        JSR     R5,     X_CLAMP                 ; 587D   0004 0114 0270
        DECLE   $000E,  $003F                   ; 5880   000E 003F

        MVO     R0,     G_017B                  ; 5882   0240 017B
        MVII    #$017C, R3                      ; 5884   02BB 017C
        INCR    R0                              ; 5886   0008
        MVO@    R0,     R3                      ; 5887   0258
        INCR    R3                              ; 5888   000B
        DECR    R0                              ; 5889   0010
        DECR    R0                              ; 588A   0010
        MVO@    R0,     R3                      ; 588B   0258
        INCR    R3                              ; 588C   000B
        MVO@    R0,     R3                      ; 588D   0258
        ADDI    #$0003, R3                      ; 588E   02FB 0003
        ADDI    #$0002, R0                      ; 5890   02F8 0002
        MVI     G_032F, R1                      ; 5892   0281 032F
        ANDI    #$0010, R1                      ; 5894   03B9 0010
        BEQ     L_5899                          ; 5896   0204 0001

        MVO@    R0,     R3                      ; 5898   0258
L_5899:
        PULR    R7                              ; 5899   02B7

L_589A:
        PSHR    R5                              ; 589A   0275
        MVI     G_032F, R1                      ; 589B   0281 032F
        ANDI    #$0010, R1                      ; 589D   03B9 0010
        BEQ     L_58A9                          ; 589F   0204 0008

        MVI     G_0179, R1                      ; 58A1   0281 0179
        ADD     G_01A1, R1                      ; 58A3   02C1 01A1
        MVO     R1,     G_0179                  ; 58A5   0241 0179
        B       L_58CF                          ; 58A7   0200 0026

L_58A9:
        MVI     G_0181, R0                      ; 58A9   0280 0181
        INCR    R0                              ; 58AB   0008
        MVO     R0,     G_0181                  ; 58AC   0240 0181
        CMPI    #$0060, R0                      ; 58AE   0378 0060
        BNEQ    L_58CF                          ; 58B0   020C 001D

        MVII    #$0010, R1                      ; 58B2   02B9 0010
        MVO     R1,     G_032F                  ; 58B4   0241 032F
        CLRR    R1                              ; 58B6   01C9
        MVO     R1,     G_01A0                  ; 58B7   0241 01A0
        MVO     R1,     G_031D                  ; 58B9   0241 031D
        MVI     G_01BB, R0                      ; 58BB   0280 01BB
        TSTR    R0                              ; 58BD   0080
        BNEQ    L_58CA                          ; 58BE   020C 000A

        MVII    #$000B, R0                      ; 58C0   02B8 000B
        MVO     R0,     G_01BB                  ; 58C2   0240 01BB
        SDBD                                    ; 58C4   0001
        MVII    #$067B, R1                      ; 58C5   02B9 007B 0006
        MVO     R1,     .BTAB.D2                ; 58C8   0241 02D2

L_58CA:
        JSR     R5,     L_69C5                  ; 58CA   0004 0168 01C5
        BIDECLE $6A75                           ; 58CD   0075 006A
L_58CF:
        CLRR    R2                              ; 58CF   01D2
        MVI     G_0160, R0                      ; 58D0   0280 0160
        TSTR    R0                              ; 58D2   0080
        BNEQ    L_58F4                          ; 58D3   020C 001F

        MVI     G_01BB, R0                      ; 58D5   0280 01BB
        TSTR    R0                              ; 58D7   0080
        BEQ     L_58F4                          ; 58D8   0204 001A

        MOVR    R0,     R3                      ; 58DA   0083
        ADDI    #$02C7, R3                      ; 58DB   02FB 02C7
        MVI@    R3,     R1                      ; 58DD   0299
        MVO@    R2,     R3                      ; 58DE   025A
        SUB     G_01B1, R0                      ; 58DF   0300 01B1
        MVO     R0,     G_01BB                  ; 58E1   0240 01BB
        ANDI    #$00FF, R0                      ; 58E3   03B8 00FF
        BEQ     L_58F4                          ; 58E5   0204 000D

        CMPI    #$0015, R0                      ; 58E7   0378 0015
        BNEQ    L_58F0                          ; 58E9   020C 0005

        CLRR    R0                              ; 58EB   01C0
        MVO     R0,     G_01BB                  ; 58EC   0240 01BB
        B       L_58F4                          ; 58EE   0200 0004

L_58F0:
        MOVR    R0,     R3                      ; 58F0   0083
        ADDI    #$02C7, R3                      ; 58F1   02FB 02C7
        MVO@    R1,     R3                      ; 58F3   0259
L_58F4:
        MVI     G_01B1, R0                      ; 58F4   0280 01B1
        ADD     G_01B2, R0                      ; 58F6   02C0 01B2
        ANDI    #$00FF, R0                      ; 58F8   03B8 00FF
        BNEQ    L_591F                          ; 58FA   020C 0023

        MVII    #$0004, R0                      ; 58FC   02B8 0004
        MVII    #$018B, R1                      ; 58FE   02B9 018B
L_5900:
        MVI@    R1,     R2                      ; 5900   028A
        XORI    #$0008, R2                      ; 5901   03FA 0008
        MVO@    R2,     R1                      ; 5903   024A
        INCR    R1                              ; 5904   0009
        DECR    R0                              ; 5905   0010
        BNEQ    L_5900                          ; 5906   022C 0007

        MVI     G_01B3, R0                      ; 5908   0280 01B3
        XORI    #$00FE, R0                      ; 590A   03F8 00FE
        MVO     R0,     G_01B3                  ; 590C   0240 01B3
        MVI     G_01B4, R1                      ; 590E   0281 01B4
        XORI    #$0006, R1                      ; 5910   03F9 0006
        MVO     R1,     G_01B4                  ; 5912   0241 01B4
        MVI     G_0173, R2                      ; 5914   0282 0173
        ADDR    R0,     R2                      ; 5916   00C2
        MOVR    R2,     R3                      ; 5917   0093
        ADDR    R1,     R3                      ; 5918   00CB
        MVO     R2,     G_0174                  ; 5919   0242 0174
        MVO     R3,     G_0175                  ; 591B   0243 0175
        MVO     R3,     G_0176                  ; 591D   0243 0176
L_591F:
        PULR    R7                              ; 591F   02B7

L_5920:
        PSHR    R5                              ; 5920   0275
        MVI     G_01A0, R0                      ; 5921   0280 01A0
        TSTR    R0                              ; 5923   0080
        BNEQ    L_591F                          ; 5924   022C 0006

        JSR     R5,     L_69C5                  ; 5926   0004 0168 01C5
        BIDECLE $6A03                           ; 5929   0003 006A

        SDBD                                    ; 592B   0001
        MVII    #$0677, R0                      ; 592C   02B8 0077 0006
        MVO     R0,     G_032F                  ; 592F   0240 032F
        MVII    #$001A, R0                      ; 5931   02B8 001A
        MVO     R0,     G_01A0                  ; 5933   0240 01A0
        MVI     G_018B, R1                      ; 5935   0281 018B
        ANDI    #$0008, R1                      ; 5937   03B9 0008
        MVII    #$0004, R0                      ; 5939   02B8 0004
        MVII    #$0007, R3                      ; 593B   02BB 0007
        BEQ     L_5941                          ; 593D   0204 0002

        NEGR    R0                              ; 593F   0020
        NEGR    R3                              ; 5940   0023
L_5941:
        MVO     R0,     G_01A1                  ; 5941   0240 01A1
L_5943:
        MVI     G_0175, R0                      ; 5943   0280 0175
        ADDR    R3,     R0                      ; 5945   00D8
        MVO     R0,     G_0179                  ; 5946   0240 0179
        MVII    #$0003, R0                      ; 5948   02B8 0003
        MVO     R0,     G_0189                  ; 594A   0240 0189
        MVI     G_017C, R0                      ; 594C   0280 017C
        MVO     R0,     G_0181                  ; 594E   0240 0181
        PULR    R7                              ; 5950   02B7

L_5951:
        PSHR    R5                              ; 5951   0275
        MVI     G_01A0, R0                      ; 5952   0280 01A0
        TSTR    R0                              ; 5954   0080
        BNEQ    L_591F                          ; 5955   022C 0037

        JSR     R5,     L_69C5                  ; 5957   0004 0168 01C5
        BIDECLE $6A4F                           ; 595A   004F 006A

        SDBD                                    ; 595C   0001
        MVII    #$0627, R0                      ; 595D   02B8 0027 0006
        MVO     R0,     G_032F                  ; 5960   0240 032F
        MVII    #$03FF, R0                      ; 5962   02B8 03FF
        MVO     R0,     G_01A0                  ; 5964   0240 01A0
        CLRR    R3                              ; 5966   01DB
        B       L_5943                          ; 5967   0220 0025

        DECLE   $0030,  $0048,  $0050,  $0060   ; 5969   0030 0048 0050 0060
        DECLE   $0018,  $0020,  $0030,  $0038   ; 596D   0018 0020 0030 0038
        DECLE   $0090,  $0098,  $0050,  $0058   ; 5971   0090 0098 0050 0058
        DECLE   $0000,  $0008,  $0068,  $0070   ; 5975   0000 0008 0068 0070
        DECLE   $0018,  $0020,  $0030,  $0048   ; 5979   0018 0020 0030 0048
        DECLE   $0050,  $0058,  $0000,  $0010   ; 597D   0050 0058 0000 0010
        DECLE   $0080,  $0088,  $0068,  $0078   ; 5981   0080 0088 0068 0078
        DECLE   $0000,  $0008,  $0068,  $0070   ; 5985   0000 0008 0068 0070
        DECLE   $0018,  $0020,  $0030,  $0048   ; 5989   0018 0020 0030 0048
        DECLE   $0050,  $0060,  $0018,  $0020   ; 598D   0050 0060 0018 0020
        DECLE   $0030,  $0038,  $0090,  $0098   ; 5991   0030 0038 0090 0098
        DECLE   $0050,  $0058,  $0000,  $0010   ; 5995   0050 0058 0000 0010
        DECLE   $0080,  $0088,  $0068,  $0070   ; 5999   0080 0088 0068 0070
        DECLE   $0018,  $0020,  $0030,  $0038   ; 599D   0018 0020 0030 0038
        DECLE   $0090,  $0098,  $0050,  $0058   ; 59A1   0090 0098 0050 0058
        DECLE   $0000,  $0008,  $0068,  $0078   ; 59A5   0000 0008 0068 0078
        DECLE   $0000,  $0008,  $0068,  $0070   ; 59A9   0000 0008 0068 0070
        DECLE   $0018,  $0020,  $0030,  $0048   ; 59AD   0018 0020 0030 0048
        DECLE   $0050,  $0058,  $0000,  $0008   ; 59B1   0050 0058 0000 0008
        DECLE   $0068,  $0070,  $0018,  $0020   ; 59B5   0068 0070 0018 0020
        DECLE   $0030,  $0048,  $0050,  $0058   ; 59B9   0030 0048 0050 0058
        DECLE   $0000,  $0010,  $0080,  $0088   ; 59BD   0000 0010 0080 0088
        DECLE   $0068,  $0078,  $0000,  $0008   ; 59C1   0068 0078 0000 0008
        DECLE   $0068,  $0078,  $0000,  $0010   ; 59C5   0068 0078 0000 0010
        DECLE   $0080,  $0088,  $0068,  $0070   ; 59C9   0080 0088 0068 0070
        DECLE   $0018,  $0020,  $0030,  $0038   ; 59CD   0018 0020 0030 0038
        DECLE   $0090,  $0098,  $0050,  $0058   ; 59D1   0090 0098 0050 0058
        DECLE   $0000,  $0008,  $0068,  $0078   ; 59D5   0000 0008 0068 0078
        DECLE   $0000,  $0008,  $0068,  $0070   ; 59D9   0000 0008 0068 0070
        DECLE   $0018,  $0020,  $0030,  $0038   ; 59DD   0018 0020 0030 0038
        DECLE   $0090,  $0098,  $0050,  $0060   ; 59E1   0090 0098 0050 0060
        DECLE   $0018,  $0020,  $0030,  $0048   ; 59E5   0018 0020 0030 0048
        DECLE   $0050,  $0058,  $0000,  $0010   ; 59E9   0050 0058 0000 0010
        DECLE   $0080,  $0088,  $0068,  $0078   ; 59ED   0080 0088 0068 0078
        DECLE   $0000,  $0010,  $0080,  $0088   ; 59F1   0000 0010 0080 0088
        DECLE   $0068,  $0070,  $0018,  $0020   ; 59F5   0068 0070 0018 0020
        DECLE   $0030,  $0038,  $0090,  $0098   ; 59F9   0030 0038 0090 0098
        DECLE   $0050,  $0058,  $0000,  $0010   ; 59FD   0050 0058 0000 0010
        DECLE   $0080,  $0088,  $0068,  $0070   ; 5A01   0080 0088 0068 0070
        DECLE   $0018,  $0020,  $0030,  $0048   ; 5A05   0018 0020 0030 0048
        DECLE   $0050,  $0060,  $0018,  $0020   ; 5A09   0050 0060 0018 0020
        DECLE   $0030,  $0038,  $0090,  $0098   ; 5A0D   0030 0038 0090 0098
        DECLE   $0050,  $0058,  $0000,  $0008   ; 5A11   0050 0058 0000 0008
        DECLE   $0068,  $0070,  $0018,  $0020   ; 5A15   0068 0070 0018 0020
        DECLE   $0030,  $0048,  $0050,  $0058   ; 5A19   0030 0048 0050 0058
        DECLE   $0000,  $0010,  $0080,  $0088   ; 5A1D   0000 0010 0080 0088
        DECLE   $0068,  $0078,  $0000,  $0008   ; 5A21   0068 0078 0000 0008
        DECLE   $0068,  $0070,  $0018,  $0020   ; 5A25   0068 0070 0018 0020
        DECLE   $0030,  $0048,  $0050,  $0060   ; 5A29   0030 0048 0050 0060
        DECLE   $0180,  $0180,  $0180,  $0180   ; 5A2D   0180 0180 0180 0180
        DECLE   $0180,  $0180,  $0180,  $0180   ; 5A31   0180 0180 0180 0180
        DECLE   $0180,  $0180,  $0180,  $00A0   ; 5A35   0180 0180 0180 00A0
        DECLE   $0090,  $00A8,  $0090,  $00B0   ; 5A39   0090 00A8 0090 00B0
        DECLE   $0180,  $0180,  $0180,  $0180   ; 5A3D   0180 0180 0180 0180
        DECLE   $0180,  $00B8,  $0050,  $0060   ; 5A41   0180 00B8 0050 0060
        DECLE   $0018,  $0020,  $0030,  $0048   ; 5A45   0018 0020 0030 0048
        DECLE   $0050,  $0060,  $0018,  $0028   ; 5A49   0050 0060 0018 0028
        DECLE   $0180,  $0180,  $0180,  $0180   ; 5A4D   0180 0180 0180 0180
        DECLE   $0180,  $0180,  $0180,  $0180   ; 5A51   0180 0180 0180 0180
        DECLE   $0180,  $0180,  $0180,  $0180   ; 5A55   0180 0180 0180 0180
        DECLE   $0180,  $00B8,  $0050,  $0060   ; 5A59   0180 00B8 0050 0060
        DECLE   $0018,  $0020,  $0030,  $0040   ; 5A5D   0018 0020 0030 0040
        DECLE   $0180,  $0180,  $0180,  $0180   ; 5A61   0180 0180 0180 0180
        DECLE   $0180,  $0180,  $0180,  $00B8   ; 5A65   0180 0180 0180 00B8
        DECLE   $0050,  $0058,  $0000           ; 5A69   0050 0058 0000

        INCR    R0                              ; 5A6C   0008
        SAR     R0,     1                       ; 5A6D   0068
        RRC     R0,     1                       ; 5A6E   0070
        COMR    R0                              ; 5A6F   0018
        ADCR    R0                              ; 5A70   0028
        ANDR    R0,     R0                      ; 5A71   0180
        ANDR    R0,     R0                      ; 5A72   0180
        ANDR    R0,     R0                      ; 5A73   0180
        ANDR    R0,     R0                      ; 5A74   0180
        ANDR    R0,     R0                      ; 5A75   0180
        MOVR    R4,     R0                      ; 5A76   00A0
        MOVR    R2,     R0                      ; 5A77   0090
        MOVR    R5,     R0                      ; 5A78   00A8
        MOVR    R2,     R0                      ; 5A79   0090
        MOVR    R6,     R0                      ; 5A7A   00B0
        ANDR    R0,     R0                      ; 5A7B   0180
        ANDR    R0,     R0                      ; 5A7C   0180
        ANDR    R0,     R0                      ; 5A7D   0180
        ANDR    R0,     R0                      ; 5A7E   0180
        ANDR    R0,     R0                      ; 5A7F   0180
        MOVR    R7,     R0                      ; 5A80   00B8
        RLC     R0,     1                       ; 5A81   0050
        SLR     R0,     1                       ; 5A82   0060
        COMR    R0                              ; 5A83   0018
        NEGR    R0                              ; 5A84   0020
        GSWD    R0                              ; 5A85   0030
        SLL     R0,     1                       ; 5A86   0048
        RLC     R0,     1                       ; 5A87   0050
        SLR     R0,     1                       ; 5A88   0060
        COMR    R0                              ; 5A89   0018
        NEGR    R0                              ; 5A8A   0020
        GSWD    R0                              ; 5A8B   0030
        SLL     R0,     1                       ; 5A8C   0048
        RLC     R0,     1                       ; 5A8D   0050
        SLR     R0,     1                       ; 5A8E   0060
        COMR    R0                              ; 5A8F   0018
        ADCR    R0                              ; 5A90   0028
        ANDR    R0,     R0                      ; 5A91   0180
        ANDR    R0,     R0                      ; 5A92   0180
        ANDR    R0,     R0                      ; 5A93   0180
        ANDR    R0,     R0                      ; 5A94   0180
        ANDR    R0,     R0                      ; 5A95   0180
        ANDR    R0,     R0                      ; 5A96   0180
        ANDR    R0,     R0                      ; 5A97   0180
        MOVR    R7,     R0                      ; 5A98   00B8
        RLC     R0,     1                       ; 5A99   0050
        SLR     R0,     1                       ; 5A9A   0060
        COMR    R0                              ; 5A9B   0018
        NEGR    R0                              ; 5A9C   0020
        GSWD    R0                              ; 5A9D   0030
        RSWD    R0                              ; 5A9E   0038
        MOVR    R2,     R0                      ; 5A9F   0090
        MOVR    R6,     R0                      ; 5AA0   00B0
        ANDR    R0,     R0                      ; 5AA1   0180
        ANDR    R0,     R0                      ; 5AA2   0180
        ANDR    R0,     R0                      ; 5AA3   0180
        ANDR    R0,     R0                      ; 5AA4   0180
        ANDR    R0,     R0                      ; 5AA5   0180
        ANDR    R0,     R0                      ; 5AA6   0180
        ANDR    R0,     R0                      ; 5AA7   0180
        ANDR    R0,     R0                      ; 5AA8   0180
        ANDR    R0,     R0                      ; 5AA9   0180
        ANDR    R0,     R0                      ; 5AAA   0180
        ANDR    R0,     R0                      ; 5AAB   0180
        ANDR    R0,     R0                      ; 5AAC   0180
        ANDR    R0,     R0                      ; 5AAD   0180
        MOVR    R7,     R0                      ; 5AAE   00B8
        RLC     R0,     1                       ; 5AAF   0050
        SLR     R0,     1                       ; 5AB0   0060
        COMR    R0                              ; 5AB1   0018
        NEGR    R0                              ; 5AB2   0020
        GSWD    R0                              ; 5AB3   0030
        SLL     R0,     1                       ; 5AB4   0048
        RLC     R0,     1                       ; 5AB5   0050
        SLR     R0,     1                       ; 5AB6   0060
        COMR    R0                              ; 5AB7   0018
        NEGR    R0                              ; 5AB8   0020
        GSWD    R0                              ; 5AB9   0030
        SWAP    R0,     1                       ; 5ABA   0040
        ANDR    R0,     R0                      ; 5ABB   0180
        ANDR    R0,     R0                      ; 5ABC   0180
        ANDR    R0,     R0                      ; 5ABD   0180
        ANDR    R0,     R0                      ; 5ABE   0180
        ANDR    R0,     R0                      ; 5ABF   0180
        ANDR    R0,     R0                      ; 5AC0   0180
        ANDR    R0,     R0                      ; 5AC1   0180
        MOVR    R4,     R0                      ; 5AC2   00A0
        MOVR    R2,     R0                      ; 5AC3   0090
        MOVR    R3,     R0                      ; 5AC4   0098
        RLC     R0,     1                       ; 5AC5   0050
        SLR     R0,     1                       ; 5AC6   0060
        COMR    R0                              ; 5AC7   0018
        ADCR    R0                              ; 5AC8   0028
        ANDR    R0,     R0                      ; 5AC9   0180
        ANDR    R0,     R0                      ; 5ACA   0180
        ANDR    R0,     R0                      ; 5ACB   0180
        ANDR    R0,     R0                      ; 5ACC   0180
        ANDR    R0,     R0                      ; 5ACD   0180
        ANDR    R0,     R0                      ; 5ACE   0180
        ANDR    R0,     R0                      ; 5ACF   0180
        ANDR    R0,     R0                      ; 5AD0   0180
        ANDR    R0,     R0                      ; 5AD1   0180
        ANDR    R0,     R0                      ; 5AD2   0180
        ANDR    R0,     R0                      ; 5AD3   0180
        ANDR    R0,     R0                      ; 5AD4   0180
        ANDR    R0,     R0                      ; 5AD5   0180
        MOVR    R4,     R0                      ; 5AD6   00A0
        MOVR    R2,     R0                      ; 5AD7   0090
        MOVR    R5,     R0                      ; 5AD8   00A8
        MOVR    R2,     R0                      ; 5AD9   0090
        MOVR    R6,     R0                      ; 5ADA   00B0
        ANDR    R0,     R0                      ; 5ADB   0180
        ANDR    R0,     R0                      ; 5ADC   0180
        ANDR    R0,     R0                      ; 5ADD   0180
        ANDR    R0,     R0                      ; 5ADE   0180
        ANDR    R0,     R0                      ; 5ADF   0180
        MOVR    R7,     R0                      ; 5AE0   00B8
        RLC     R0,     1                       ; 5AE1   0050
        SLR     R0,     1                       ; 5AE2   0060
        COMR    R0                              ; 5AE3   0018
        NEGR    R0                              ; 5AE4   0020
        GSWD    R0                              ; 5AE5   0030
        SLL     R0,     1                       ; 5AE6   0048
        RLC     R0,     1                       ; 5AE7   0050
        SLR     R0,     1                       ; 5AE8   0060
        COMR    R0                              ; 5AE9   0018
        ADCR    R0                              ; 5AEA   0028
        ANDR    R0,     R0                      ; 5AEB   0180
        ANDR    R0,     R0                      ; 5AEC   0180
        ANDR    R0,     R0                      ; 5AED   0180
        ANDR    R0,     R0                      ; 5AEE   0180
        ANDR    R0,     R0                      ; 5AEF   0180
        ANDR    R0,     R0                      ; 5AF0   0180
L_5AF1:
        PSHR    R5                              ; 5AF1   0275
        MVI     G_01BA, R0                      ; 5AF2   0280 01BA
        INCR    R0                              ; 5AF4   0008
        ANDI    #$000F, R0                      ; 5AF5   03B8 000F
        MVO     R0,     G_01BA                  ; 5AF7   0240 01BA
        MVI     G_01B6, R0                      ; 5AF9   0280 01B6
        DECR    R0                              ; 5AFB   0010
        MVO     R0,     G_01B6                  ; 5AFC   0240 01B6
        BPL     L_5B09                          ; 5AFE   0203 0009

        MVII    #$009D, R0                      ; 5B00   02B8 009D
        MVO     R0,     G_01B6                  ; 5B02   0240 01B6
        MVI     G_01B7, R0                      ; 5B04   0280 01B7
        DECR    R0                              ; 5B06   0010
        MVO     R0,     G_01B7                  ; 5B07   0240 01B7
L_5B09:
        CLRR    R1                              ; 5B09   01C9
        MVI     G_01A2, R4                      ; 5B0A   0284 01A2
        ADD     G_01B1, R4                      ; 5B0C   02C4 01B1
        CMPI    #$009E, R4                      ; 5B0E   037C 009E
        BNEQ    L_5B14                          ; 5B10   020C 0002

        CLRR    R4                              ; 5B12   01E4
        DECR    R1                              ; 5B13   0011
L_5B14:
        CMPI    #$00FF, R4                      ; 5B14   037C 00FF
        BNEQ    L_5B1B                          ; 5B16   020C 0003

        MVII    #$009D, R4                      ; 5B18   02BC 009D
        INCR    R1                              ; 5B1A   0009
L_5B1B:
        MVO     R4,     G_01A2                  ; 5B1B   0244 01A2
        ADD     G_01B8, R1                      ; 5B1D   02C1 01B8
        MVO     R1,     G_01B8                  ; 5B1F   0241 01B8
        CMPI    #$0064, R1                      ; 5B21   0379 0064
        BNC     L_5B27                          ; 5B23   0209 0002

        MVII    #$0064, R1                      ; 5B25   02B9 0064
L_5B27:
        CMPI    #$0005, R1                      ; 5B27   0379 0005
        BC      L_5B38                          ; 5B29   0201 000D

        MVI     G_01BA, R0                      ; 5B2B   0280 01BA
        CMPI    #$0008, R0                      ; 5B2D   0378 0008
        BNC     L_5B38                          ; 5B2F   0209 0007

        CLRR    R0                              ; 5B31   01C0
        MVO     R0,     .BTAB.DF                ; 5B32   0240 02DF
        MVO     R0,     .BTAB.E0                ; 5B34   0240 02E0
        B       L_5B48                          ; 5B36   0200 0010

L_5B38:
        MVII    #$02DF, R4                      ; 5B38   02BC 02DF
        ADDR    R1,     R1                      ; 5B3A   00C9
        SDBD                                    ; 5B3B   0001
        ADDI    #$5B9A, R1                      ; 5B3C   02F9 009A 005B
        MVI@    R1,     R0                      ; 5B3F   0288
        ADDI    #$0007, R0                      ; 5B40   02F8 0007
        MVO@    R0,     R4                      ; 5B42   0260
        INCR    R1                              ; 5B43   0009
        MVI@    R1,     R0                      ; 5B44   0288
        ADDI    #$0007, R0                      ; 5B45   02F8 0007
        MVO@    R0,     R4                      ; 5B47   0260
L_5B48:
        MVI     G_01B7, R0                      ; 5B48   0280 01B7
        SUB     G_01B8, R0                      ; 5B4A   0300 01B8
        CMPI    #$000A, R0                      ; 5B4C   0378 000A
        BC      L_5B5D                          ; 5B4E   0201 000D

        MVI     G_01BA, R0                      ; 5B50   0280 01BA
        CMPI    #$0008, R0                      ; 5B52   0378 0008
        BNC     L_5B5D                          ; 5B54   0209 0007

        CLRR    R0                              ; 5B56   01C0
        MVO     R0,     .BTAB.E3                ; 5B57   0240 02E3
        MVO     R0,     .BTAB.E4                ; 5B59   0240 02E4
        B       L_5B6F                          ; 5B5B   0200 0012

L_5B5D:
        MVI     G_01B7, R1                      ; 5B5D   0281 01B7
        ADDR    R1,     R1                      ; 5B5F   00C9
        SDBD                                    ; 5B60   0001
        ADDI    #$5B9A, R1                      ; 5B61   02F9 009A 005B
        MVI@    R1,     R0                      ; 5B64   0288
        ADDI    #$0003, R0                      ; 5B65   02F8 0003
        MVO     R0,     .BTAB.E3                ; 5B67   0240 02E3
        INCR    R1                              ; 5B69   0009
        MVI@    R1,     R0                      ; 5B6A   0288
        ADDI    #$0003, R0                      ; 5B6B   02F8 0003
        MVO     R0,     .BTAB.E4                ; 5B6D   0240 02E4
L_5B6F:
        MVI     G_01B9, R0                      ; 5B6F   0280 01B9
        DECR    R0                              ; 5B71   0010
        BMI     L_5B81                          ; 5B72   020B 000D

        MVO     R0,     G_01B9                  ; 5B74   0240 01B9
        MVI     G_01BA, R0                      ; 5B76   0280 01BA
        CMPI    #$0008, R0                      ; 5B78   0378 0008
        BNC     L_5B81                          ; 5B7A   0209 0005

        CLRR    R0                              ; 5B7C   01C0
        MVO     R0,     .BTAB.DC                ; 5B7D   0240 02DC
        B       L_5B8F                          ; 5B7F   0200 000E

L_5B81:
        MVI     G_015D, R0                      ; 5B81   0280 015D
        CMPI    #$0009, R0                      ; 5B83   0378 0009
        BNC     L_5B89                          ; 5B85   0209 0002

        MVII    #$0009, R0                      ; 5B87   02B8 0009
L_5B89:
        SLL     R0,     2                       ; 5B89   004C
        SLL     R0,     1                       ; 5B8A   0048
        ADDI    #$0083, R0                      ; 5B8B   02F8 0083
        MVO     R0,     .BTAB.DC                ; 5B8D   0240 02DC
L_5B8F:
        MVI     G_01B8, R0                      ; 5B8F   0280 01B8
        TSTR    R0                              ; 5B91   0080
        BNEQ    L_5C64                          ; 5B92   020C 00D0
        J       L_6B84                          ; 5B94   0004 0368 0384
L_5B97:
        J       L_6ADB                          ; 5B97   0004 0368 02DB

        TSTR    R0                              ; 5B9A   0080
        TSTR    R0                              ; 5B9B   0080
        TSTR    R0                              ; 5B9C   0080
        MOVR    R1,     R0                      ; 5B9D   0088
        TSTR    R0                              ; 5B9E   0080
        MOVR    R2,     R0                      ; 5B9F   0090
        TSTR    R0                              ; 5BA0   0080
        MOVR    R3,     R0                      ; 5BA1   0098
        TSTR    R0                              ; 5BA2   0080
        MOVR    R4,     R0                      ; 5BA3   00A0
        TSTR    R0                              ; 5BA4   0080
        MOVR    R5,     R0                      ; 5BA5   00A8
        TSTR    R0                              ; 5BA6   0080
        MOVR    R6,     R0                      ; 5BA7   00B0
        TSTR    R0                              ; 5BA8   0080
        MOVR    R7,     R0                      ; 5BA9   00B8
        TSTR    R0                              ; 5BAA   0080
        ADDR    R0,     R0                      ; 5BAB   00C0
        TSTR    R0                              ; 5BAC   0080
        ADDR    R1,     R0                      ; 5BAD   00C8
        MOVR    R1,     R0                      ; 5BAE   0088
        TSTR    R0                              ; 5BAF   0080
        MOVR    R1,     R0                      ; 5BB0   0088
        MOVR    R1,     R0                      ; 5BB1   0088
        MOVR    R1,     R0                      ; 5BB2   0088
        MOVR    R2,     R0                      ; 5BB3   0090
        MOVR    R1,     R0                      ; 5BB4   0088
        MOVR    R3,     R0                      ; 5BB5   0098
        MOVR    R1,     R0                      ; 5BB6   0088
        MOVR    R4,     R0                      ; 5BB7   00A0
        MOVR    R1,     R0                      ; 5BB8   0088
        MOVR    R5,     R0                      ; 5BB9   00A8
        MOVR    R1,     R0                      ; 5BBA   0088
        MOVR    R6,     R0                      ; 5BBB   00B0
        MOVR    R1,     R0                      ; 5BBC   0088
        MOVR    R7,     R0                      ; 5BBD   00B8
        MOVR    R1,     R0                      ; 5BBE   0088
        ADDR    R0,     R0                      ; 5BBF   00C0
        MOVR    R1,     R0                      ; 5BC0   0088
        ADDR    R1,     R0                      ; 5BC1   00C8
        MOVR    R2,     R0                      ; 5BC2   0090
        TSTR    R0                              ; 5BC3   0080
        MOVR    R2,     R0                      ; 5BC4   0090
        MOVR    R1,     R0                      ; 5BC5   0088
        MOVR    R2,     R0                      ; 5BC6   0090
        MOVR    R2,     R0                      ; 5BC7   0090
        MOVR    R2,     R0                      ; 5BC8   0090
        MOVR    R3,     R0                      ; 5BC9   0098
        MOVR    R2,     R0                      ; 5BCA   0090
        MOVR    R4,     R0                      ; 5BCB   00A0
        MOVR    R2,     R0                      ; 5BCC   0090
        MOVR    R5,     R0                      ; 5BCD   00A8
        MOVR    R2,     R0                      ; 5BCE   0090
        MOVR    R6,     R0                      ; 5BCF   00B0
        MOVR    R2,     R0                      ; 5BD0   0090
        MOVR    R7,     R0                      ; 5BD1   00B8
        MOVR    R2,     R0                      ; 5BD2   0090
        ADDR    R0,     R0                      ; 5BD3   00C0
        MOVR    R2,     R0                      ; 5BD4   0090
        ADDR    R1,     R0                      ; 5BD5   00C8
        MOVR    R3,     R0                      ; 5BD6   0098
        TSTR    R0                              ; 5BD7   0080
        MOVR    R3,     R0                      ; 5BD8   0098
        MOVR    R1,     R0                      ; 5BD9   0088
        MOVR    R3,     R0                      ; 5BDA   0098
        MOVR    R2,     R0                      ; 5BDB   0090
        MOVR    R3,     R0                      ; 5BDC   0098
        MOVR    R3,     R0                      ; 5BDD   0098
        MOVR    R3,     R0                      ; 5BDE   0098
        MOVR    R4,     R0                      ; 5BDF   00A0
        MOVR    R3,     R0                      ; 5BE0   0098
        MOVR    R5,     R0                      ; 5BE1   00A8
        MOVR    R3,     R0                      ; 5BE2   0098
        MOVR    R6,     R0                      ; 5BE3   00B0
        MOVR    R3,     R0                      ; 5BE4   0098
        MOVR    R7,     R0                      ; 5BE5   00B8
        MOVR    R3,     R0                      ; 5BE6   0098
        ADDR    R0,     R0                      ; 5BE7   00C0
        MOVR    R3,     R0                      ; 5BE8   0098
        ADDR    R1,     R0                      ; 5BE9   00C8
        MOVR    R4,     R0                      ; 5BEA   00A0
        TSTR    R0                              ; 5BEB   0080
        MOVR    R4,     R0                      ; 5BEC   00A0
        MOVR    R1,     R0                      ; 5BED   0088
        MOVR    R4,     R0                      ; 5BEE   00A0
        MOVR    R2,     R0                      ; 5BEF   0090
        MOVR    R4,     R0                      ; 5BF0   00A0
        MOVR    R3,     R0                      ; 5BF1   0098
        MOVR    R4,     R0                      ; 5BF2   00A0
        MOVR    R4,     R0                      ; 5BF3   00A0
        MOVR    R4,     R0                      ; 5BF4   00A0
        MOVR    R5,     R0                      ; 5BF5   00A8
        MOVR    R4,     R0                      ; 5BF6   00A0
        MOVR    R6,     R0                      ; 5BF7   00B0
        MOVR    R4,     R0                      ; 5BF8   00A0
        MOVR    R7,     R0                      ; 5BF9   00B8
        MOVR    R4,     R0                      ; 5BFA   00A0
        ADDR    R0,     R0                      ; 5BFB   00C0
        MOVR    R4,     R0                      ; 5BFC   00A0
        ADDR    R1,     R0                      ; 5BFD   00C8
        MOVR    R5,     R0                      ; 5BFE   00A8
        TSTR    R0                              ; 5BFF   0080
        MOVR    R5,     R0                      ; 5C00   00A8
        MOVR    R1,     R0                      ; 5C01   0088
        MOVR    R5,     R0                      ; 5C02   00A8
        MOVR    R2,     R0                      ; 5C03   0090
        MOVR    R5,     R0                      ; 5C04   00A8
        MOVR    R3,     R0                      ; 5C05   0098
        MOVR    R5,     R0                      ; 5C06   00A8
        MOVR    R4,     R0                      ; 5C07   00A0
        MOVR    R5,     R0                      ; 5C08   00A8
        MOVR    R5,     R0                      ; 5C09   00A8
        MOVR    R5,     R0                      ; 5C0A   00A8
        MOVR    R6,     R0                      ; 5C0B   00B0
        MOVR    R5,     R0                      ; 5C0C   00A8
        MOVR    R7,     R0                      ; 5C0D   00B8
        MOVR    R5,     R0                      ; 5C0E   00A8
        ADDR    R0,     R0                      ; 5C0F   00C0
        MOVR    R5,     R0                      ; 5C10   00A8
        ADDR    R1,     R0                      ; 5C11   00C8
        MOVR    R6,     R0                      ; 5C12   00B0
        TSTR    R0                              ; 5C13   0080
        MOVR    R6,     R0                      ; 5C14   00B0
        MOVR    R1,     R0                      ; 5C15   0088
        MOVR    R6,     R0                      ; 5C16   00B0
        MOVR    R2,     R0                      ; 5C17   0090
        MOVR    R6,     R0                      ; 5C18   00B0
        MOVR    R3,     R0                      ; 5C19   0098
        MOVR    R6,     R0                      ; 5C1A   00B0
        MOVR    R4,     R0                      ; 5C1B   00A0
        MOVR    R6,     R0                      ; 5C1C   00B0
        MOVR    R5,     R0                      ; 5C1D   00A8
        MOVR    R6,     R0                      ; 5C1E   00B0
        MOVR    R6,     R0                      ; 5C1F   00B0
        MOVR    R6,     R0                      ; 5C20   00B0
        MOVR    R7,     R0                      ; 5C21   00B8
        MOVR    R6,     R0                      ; 5C22   00B0
        ADDR    R0,     R0                      ; 5C23   00C0
        MOVR    R6,     R0                      ; 5C24   00B0
        ADDR    R1,     R0                      ; 5C25   00C8
        MOVR    R7,     R0                      ; 5C26   00B8
        TSTR    R0                              ; 5C27   0080
        MOVR    R7,     R0                      ; 5C28   00B8
        MOVR    R1,     R0                      ; 5C29   0088
        MOVR    R7,     R0                      ; 5C2A   00B8
        MOVR    R2,     R0                      ; 5C2B   0090
        MOVR    R7,     R0                      ; 5C2C   00B8
        MOVR    R3,     R0                      ; 5C2D   0098
        MOVR    R7,     R0                      ; 5C2E   00B8
        MOVR    R4,     R0                      ; 5C2F   00A0
        MOVR    R7,     R0                      ; 5C30   00B8
        MOVR    R5,     R0                      ; 5C31   00A8
        MOVR    R7,     R0                      ; 5C32   00B8
        MOVR    R6,     R0                      ; 5C33   00B0
        MOVR    R7,     R0                      ; 5C34   00B8
        MOVR    R7,     R0                      ; 5C35   00B8
        MOVR    R7,     R0                      ; 5C36   00B8
        ADDR    R0,     R0                      ; 5C37   00C0
        MOVR    R7,     R0                      ; 5C38   00B8
        ADDR    R1,     R0                      ; 5C39   00C8
        ADDR    R0,     R0                      ; 5C3A   00C0
        TSTR    R0                              ; 5C3B   0080
        ADDR    R0,     R0                      ; 5C3C   00C0
        MOVR    R1,     R0                      ; 5C3D   0088
        ADDR    R0,     R0                      ; 5C3E   00C0
        MOVR    R2,     R0                      ; 5C3F   0090
        ADDR    R0,     R0                      ; 5C40   00C0
        MOVR    R3,     R0                      ; 5C41   0098
        ADDR    R0,     R0                      ; 5C42   00C0
        MOVR    R4,     R0                      ; 5C43   00A0
        ADDR    R0,     R0                      ; 5C44   00C0
        MOVR    R5,     R0                      ; 5C45   00A8
        ADDR    R0,     R0                      ; 5C46   00C0
        MOVR    R6,     R0                      ; 5C47   00B0
        ADDR    R0,     R0                      ; 5C48   00C0
        MOVR    R7,     R0                      ; 5C49   00B8
        ADDR    R0,     R0                      ; 5C4A   00C0
        ADDR    R0,     R0                      ; 5C4B   00C0
        ADDR    R0,     R0                      ; 5C4C   00C0
        ADDR    R1,     R0                      ; 5C4D   00C8
        ADDR    R1,     R0                      ; 5C4E   00C8
        TSTR    R0                              ; 5C4F   0080
        ADDR    R1,     R0                      ; 5C50   00C8
        MOVR    R1,     R0                      ; 5C51   0088
        ADDR    R1,     R0                      ; 5C52   00C8
        MOVR    R2,     R0                      ; 5C53   0090
        ADDR    R1,     R0                      ; 5C54   00C8
        MOVR    R3,     R0                      ; 5C55   0098
        ADDR    R1,     R0                      ; 5C56   00C8
        MOVR    R4,     R0                      ; 5C57   00A0
        ADDR    R1,     R0                      ; 5C58   00C8
        MOVR    R5,     R0                      ; 5C59   00A8
        ADDR    R1,     R0                      ; 5C5A   00C8
        MOVR    R6,     R0                      ; 5C5B   00B0
        ADDR    R1,     R0                      ; 5C5C   00C8
        MOVR    R7,     R0                      ; 5C5D   00B8
        ADDR    R1,     R0                      ; 5C5E   00C8
        ADDR    R0,     R0                      ; 5C5F   00C0
        ADDR    R1,     R0                      ; 5C60   00C8
        ADDR    R1,     R0                      ; 5C61   00C8
        SAR     R0,     1                       ; 5C62   0068
        ADDR    R6,     R0                      ; 5C63   00F0
L_5C64:
        MVI     G_01B7, R0                      ; 5C64   0280 01B7
        CMP     G_01B8, R0                      ; 5C66   0340 01B8
        BNC     L_5B97                          ; 5C68   0229 00D2

        MVII    #$02A0, R5                      ; 5C6A   02BD 02A0
        MVI     G_01A2, R4                      ; 5C6C   0284 01A2
        PSHR    R4                              ; 5C6E   0274
        ADDR    R7,     R4                      ; 5C6F   00FC
        SUBI    #$0307, R4                      ; 5C70   033C 0307
        MVII    #$0014, R0                      ; 5C72   02B8 0014
L_5C74:
        MVI@    R4,     R1                      ; 5C74   02A1
        SDBD                                    ; 5C75   0001
        ADDI    #$0801, R1                      ; 5C76   02F9 0001 0008
        MVO@    R1,     R5                      ; 5C79   0269
        INCR    R4                              ; 5C7A   000C
        DECR    R0                              ; 5C7B   0010
        BNEQ    L_5C74                          ; 5C7C   022C 0009

        PULR    R4                              ; 5C7E   02B4
        ADDR    R7,     R4                      ; 5C7F   00FC
        SUBI    #$0253, R4                      ; 5C80   033C 0253
        MVII    #$0014, R0                      ; 5C82   02B8 0014
L_5C84:
        MVI@    R4,     R1                      ; 5C84   02A1
        SDBD                                    ; 5C85   0001
        ADDI    #$0801, R1                      ; 5C86   02F9 0001 0008
        MVO@    R1,     R5                      ; 5C89   0269
        INCR    R4                              ; 5C8A   000C
        DECR    R0                              ; 5C8B   0010
        BNEQ    L_5C84                          ; 5C8C   022C 0009
        PULR    R7                              ; 5C8E   02B7

.GRAM_INIT_5C8F:
        DECLE   $003A           ; 5C8F  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 5C90  #00-07:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 5C92  #08-0F:  CART #08-0F ----
        DECLE   $0021,  $0380   ; 5C94  #10-17:  CART #10-17 ----
        DECLE   $003F,  $0030   ; 5C96  #18-18:  GROM #5F-5F ----
        DECLE   $0031,  $03C0   ; 5C98  #19-20:  GRAM #18-1F ----
        DECLE   $0041,  $03C0   ; 5C9A  #21-28:  GRAM #20-27 ----
        DECLE   $0051,  $03C0   ; 5C9C  #29-30:  GRAM #28-2F ----
        DECLE   $0031,  $0380   ; 5C9E  #31-38:  CART #18-1F ----
        DECLE   $0040           ; 5CA0  #39   :  CART #20    ----

.GFX_LIST_5CA1:
        DECLE   $0300,  $0301,  $0302,  $0314   ; 5CA1  CART PIC #00
        DECLE   $0320,  $0340,  $0340,  $0380   ; 5CA5  
        DECLE   $0300,  $0310,  $0328,  $0344   ; 5CA9  CART PIC #01
        DECLE   $0302,  $0302,  $0301,  $0300   ; 5CAD  
        DECLE   $0300,  $0314,  $032A,  $0342   ; 5CB1  CART PIC #02
        DECLE   $0301,  $0301,  $0300,  $0300   ; 5CB5  
        DECLE   $0301,  $0303,  $0303,  $0309   ; 5CB9  CART PIC #03
        DECLE   $0307,  $0345,  $032F,  $03BF   ; 5CBD  
        DECLE   $0314,  $0334,  $0338,  $0398   ; 5CC1  CART PIC #04
        DECLE   $037A,  $035E,  $03FE,  $03FF   ; 5CC5  
        DECLE   $031F,  $033F,  $033F,  $039F   ; 5CC9  CART PIC #05
        DECLE   $037F,  $035F,  $03FF,  $03FF   ; 5CCD  
        DECLE   $0340,  $0340,  $0380,  $0382   ; 5CD1  CART PIC #06
        DECLE   $03A3,  $03E3,  $03E7,  $03F7   ; 5CD5  
        DECLE   $0301,  $030A,  $030F,  $032F   ; 5CD9  CART PIC #07
        DECLE   $033F,  $033F,  $037F,  $037F   ; 5CDD  
        DECLE   $030F,  $030F,  $030F,  $032F   ; 5CE1  CART PIC #08
        DECLE   $033F,  $033F,  $037F,  $037F   ; 5CE5  
        DECLE   $0308,  $0300,  $0308,  $0328   ; 5CE9  CART PIC #09
        DECLE   $033D,  $033D,  $037F,  $037F   ; 5CED  
        DECLE   $0380,  $0300,  $0380,  $0384   ; 5CF1  CART PIC #0A
        DECLE   $03D8,  $03D8,  $03FC,  $03FA   ; 5CF5  
        DECLE   $0300,  $0300,  $0300,  $0341   ; 5CF9  CART PIC #0B
        DECLE   $0382,  $0384,  $03C4,  $03A8   ; 5CFD  
        DECLE   $0300,  $0300,  $0300,  $0340   ; 5D01  CART PIC #0C
        DECLE   $0380,  $0384,  $03C2,  $03AB   ; 5D05  
        DECLE   $0300,  $0300,  $0380,  $0340   ; 5D09  CART PIC #0D
        DECLE   $0320,  $0320,  $0314,  $0303   ; 5D0D  
        DECLE   $0300,  $0300,  $0300,  $0300   ; 5D11  CART PIC #0E
        DECLE   $0300,  $0304,  $0342,  $033B   ; 5D15  
        DECLE   $0300,  $0300,  $0300,  $0301   ; 5D19  CART PIC #0F
        DECLE   $0302,  $0304,  $0344,  $0338   ; 5D1D  
        DECLE   $0300,  $0340,  $03A1,  $0322   ; 5D21  CART PIC #10
        DECLE   $0314,  $0314,  $0308,  $0300   ; 5D25  
        DECLE   $0300,  $0300,  $0318,  $0324   ; 5D29  CART PIC #11
        DECLE   $0342,  $0342,  $0381,  $0300   ; 5D2D  
        DECLE   $0312,  $03A5,  $03F7,  $03FF   ; 5D31  CART PIC #12
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 5D35  
        DECLE   $0328,  $0350,  $0378,  $03F8   ; 5D39  CART PIC #13
        DECLE   $03FD,  $03FD,  $03FF,  $03FF   ; 5D3D  
        DECLE   $03F1,  $03FA,  $03FF,  $03FF   ; 5D41  CART PIC #14
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 5D45  
        DECLE   $0321,  $035A,  $037F,  $03FF   ; 5D49  CART PIC #15
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 5D4D  
        DECLE   $032F,  $035F,  $037F,  $03FF   ; 5D51  CART PIC #16
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 5D55  
        DECLE   $03F8,  $03F0,  $03F8,  $03F8   ; 5D59  CART PIC #17
        DECLE   $03FD,  $03FD,  $03FF,  $03FF   ; 5D5D  
        DECLE   $00CF,  $00FF,  $00C3,  $00DF   ; 5D61  CART PIC #18
        DECLE   $00D3,  $00DB,  $00C3,  $00FF   ; 5D65  
        DECLE   $0000,  $006C,  $00FE,  $00FE   ; 5D69  CART PIC #19
        DECLE   $007C,  $0038,  $0010,  $0000   ; 5D6D  
        DECLE   $0000,  $001E,  $002F,  $007F   ; 5D71  CART PIC #1A
        DECLE   $003D,  $004D,  $001A,  $0000   ; 5D75  
        DECLE   $003C,  $0072,  $007C,  $007E   ; 5D79  CART PIC #1B
        DECLE   $005A,  $0038,  $0014,  $0000   ; 5D7D  
        DECLE   $0000,  $0058,  $00B2,  $00BC   ; 5D81  CART PIC #1C
        DECLE   $00FE,  $00F4,  $0078,  $0000   ; 5D85  
        DECLE   $0000,  $0028,  $001C,  $005A   ; 5D89  CART PIC #1D
        DECLE   $007E,  $003E,  $004E,  $003C   ; 5D8D  
        DECLE   $0000,  $0002,  $0004,  $000C   ; 5D91  CART PIC #1E
        DECLE   $001E,  $001E,  $001C,  $0008   ; 5D95  
        DECLE   $0006,  $000C,  $0004,  $0002   ; 5D99  CART PIC #1F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D9D  
        DECLE   $0040,  $00A0,  $005E,  $00EF   ; 5DA1  CART PIC #20
        DECLE   $00F0,  $007F,  $007E,  $003C   ; 5DA5  
        DECLE   $0000,  $0002,  $0004,  $000C   ; 5DA9   0000 0002 0004 000C
        DECLE   $001E,  $001E,  $001C,  $0008   ; 5DAD   001E 001E 001C 0008
        DECLE   $0001,  $000C,  $000C,  $0004   ; 5DB1   0001 000C 000C 0004
        DECLE   $000C,  $000C,  $0000,  $0000   ; 5DB5   000C 000C 0000 0000
        DECLE   $0006,  $000C,  $0004,  $0002   ; 5DB9   0006 000C 0004 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DBD   0000 0000 0000 0000
        DECLE   $0018,  $0010,  $0000,  $0000   ; 5DC1   0018 0010 0000 0000
        DECLE   $0000,  $0018,  $0018,  $000C   ; 5DC5   0000 0018 0018 000C
        DECLE   $0040,  $00C0,  $00C6,  $00C3   ; 5DC9   0040 00C0 00C6 00C3
        DECLE   $0082,  $0080,  $009C,  $008E   ; 5DCD   0082 0080 009C 008E
        DECLE   $00C0,  $0040,  $0000,  $0000   ; 5DD1   00C0 0040 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DD5   0000 0000 0000 0000
        DECLE   $0006,  $000C,  $0004,  $0002   ; 5DD9   0006 000C 0004 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DDD   0000 0000 0000 0000
        DECLE   $0018,  $0010,  $0000,  $0000   ; 5DE1   0018 0010 0000 0000
        DECLE   $0000,  $0018,  $0018,  $000C   ; 5DE5   0000 0018 0018 000C
        DECLE   $000C,  $0018,  $0008,  $0004   ; 5DE9   000C 0018 0008 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DED   0000 0000 0000 0000
        DECLE   $0030,  $0020,  $0000,  $0000   ; 5DF1   0030 0020 0000 0000
        DECLE   $0000,  $0004,  $0026,  $0030   ; 5DF5   0000 0004 0026 0030
        DECLE   $000C,  $0018,  $0008,  $0004   ; 5DF9   000C 0018 0008 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DFD   0000 0000 0000 0000
        DECLE   $0030,  $0020,  $0000,  $0000   ; 5E01   0030 0020 0000 0000
        DECLE   $0004,  $0006,  $0040,  $0060   ; 5E05   0004 0006 0040 0060
        DECLE   $000C,  $0018,  $0008,  $0004   ; 5E09   000C 0018 0008 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E0D   0000 0000 0000 0000
        DECLE   $0030,  $0020,  $0002,  $0006   ; 5E11   0030 0020 0002 0006
        DECLE   $0000,  $0000,  $0080,  $00C0   ; 5E15   0000 0000 0080 00C0
        DECLE   $0006,  $000C,  $0004,  $0002   ; 5E19   0006 000C 0004 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E1D   0000 0000 0000 0000
        DECLE   $0018,  $0010,  $0000,  $0000   ; 5E21   0018 0010 0000 0000
        DECLE   $0082,  $0083,  $00C0,  $0000   ; 5E25   0082 0083 00C0 0000
        DECLE   $0006,  $000C,  $0004,  $0002   ; 5E29   0006 000C 0004 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E2D   0000 0000 0000 0000
        DECLE   $0018,  $0010,  $0000,  $0040   ; 5E31   0018 0010 0000 0040
        DECLE   $0040,  $0040,  $0002,  $0003   ; 5E35   0040 0040 0002 0003
        DECLE   $0006,  $000C,  $0004,  $0002   ; 5E39   0006 000C 0004 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E3D   0000 0000 0000 0000
        DECLE   $0018,  $0010,  $0000,  $0000   ; 5E41   0018 0010 0000 0000
        DECLE   $0000,  $0010,  $0018,  $000C   ; 5E45   0000 0010 0018 000C
        DECLE   $000C,  $0018,  $0008,  $0004   ; 5E49   000C 0018 0008 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E4D   0000 0000 0000 0000
        DECLE   $0030,  $0020,  $0000,  $0000   ; 5E51   0030 0020 0000 0000
        DECLE   $0000,  $0004,  $0026,  $0030   ; 5E55   0000 0004 0026 0030
        DECLE   $000C,  $0018,  $0008,  $0004   ; 5E59   000C 0018 0008 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E5D   0000 0000 0000 0000
        DECLE   $0030,  $0020,  $0000,  $0000   ; 5E61   0030 0020 0000 0000
        DECLE   $0004,  $0006,  $0040,  $0060   ; 5E65   0004 0006 0040 0060
        DECLE   $000C,  $0018,  $0008,  $0004   ; 5E69   000C 0018 0008 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E6D   0000 0000 0000 0000
        DECLE   $0030,  $0020,  $0002,  $0006   ; 5E71   0030 0020 0002 0006
        DECLE   $0000,  $0000,  $0080,  $00C0   ; 5E75   0000 0000 0080 00C0
        DECLE   $0006,  $000C,  $0004,  $0002   ; 5E79   0006 000C 0004 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E7D   0000 0000 0000 0000
        DECLE   $0018,  $0010,  $0000,  $0000   ; 5E81   0018 0010 0000 0000
        DECLE   $00C2,  $0083,  $00C0,  $0000   ; 5E85   00C2 0083 00C0 0000
        DECLE   $0006,  $000C,  $0004,  $0002   ; 5E89   0006 000C 0004 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E8D   0000 0000 0000 0000
        DECLE   $0018,  $0010,  $0000,  $0000   ; 5E91   0018 0010 0000 0000
        DECLE   $0060,  $0040,  $0002,  $0003   ; 5E95   0060 0040 0002 0003
        DECLE   $000C,  $0018,  $0008,  $0000   ; 5E99   000C 0018 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E9D   0000 0000 0000 0000
        DECLE   $0018,  $0010,  $0000,  $0000   ; 5EA1   0018 0010 0000 0000
        DECLE   $0000,  $0000,  $0024,  $0036   ; 5EA5   0000 0000 0024 0036
        DECLE   $0000,  $0002,  $0004,  $000C   ; 5EA9   0000 0002 0004 000C
        DECLE   $001E,  $001E,  $001C,  $0008   ; 5EAD   001E 001E 001C 0008
        DECLE   $0001,  $000C,  $000C,  $0004   ; 5EB1   0001 000C 000C 0004
        DECLE   $000C,  $000C,  $0000,  $0000   ; 5EB5   000C 000C 0000 0000
        DECLE   $0000,  $0004,  $0008,  $0038   ; 5EB9   0000 0004 0008 0038
        DECLE   $007C,  $007C,  $0038,  $0014   ; 5EBD   007C 007C 0038 0014
        DECLE   $0000,  $0018,  $000C,  $0002   ; 5EC1   0000 0018 000C 0002
        DECLE   $0016,  $0030,  $0000,  $0000   ; 5EC5   0016 0030 0000 0000
        DECLE   $0000,  $0004,  $0008,  $0038   ; 5EC9   0000 0004 0008 0038
        DECLE   $007C,  $005C,  $003A,  $0010   ; 5ECD   007C 005C 003A 0010
        DECLE   $0000,  $001E,  $000E,  $0022   ; 5ED1   0000 001E 000E 0022
        DECLE   $0060,  $0040,  $0000,  $0000   ; 5ED5   0060 0040 0000 0000
        DECLE   $0000,  $0004,  $0008,  $0038   ; 5ED9   0000 0004 0008 0038
        DECLE   $007C,  $005E,  $0058,  $0010   ; 5EDD   007C 005E 0058 0010
        DECLE   $0007,  $001F,  $0062,  $0060   ; 5EE1   0007 001F 0062 0060
        DECLE   $00C0,  $0080,  $0000,  $0000   ; 5EE5   00C0 0080 0000 0000
        DECLE   $0000                           ; 5EE9   0000

        EIS                                     ; 5EEA   0002

        JSR     R4,     .EXEC.C3F               ; 5EEB   0004 001C 003F
        DECLE   $006F,  $004C,  $0008,  $0001   ; 5EEE   006F 004C 0008 0001

        INCR    R7                              ; 5EF2   000F

        SETC                                    ; 5EF3   0007
L_5EF4:
        GSWD    R1                              ; 5EF4   0031
        DECLE   $0070,  $0000,  $0000,  $0000   ; 5EF5   0070 0000 0000 0000
        DECLE   $0000                           ; 5EF9   0000

        EIS                                     ; 5EFA   0002

        JSR     R4,     .EXEC.C3E               ; 5EFB   0004 001C 003E

        ADCR    R7                              ; 5EFE   002F

        ADCR    R4                              ; 5EFF   002C
L_5F00:
        INCR    R0                              ; 5F00   0008
        DECLE   $0001,  $000C,  $000E,  $0036   ; 5F01   0001 000C 000E 0036
        DECLE   $0012,  $0002,  $0000,  $0000   ; 5F05   0012 0002 0000 0000
        DECLE   $0000                           ; 5F09   0000

        EIS                                     ; 5F0A   0002

        JSR     R4,     .EXEC.C3E               ; 5F0B   0004 001C 003E
        DECLE   $002E,  $001C,  $0008,  $0001   ; 5F0E   002E 001C 0008 0001
        DECLE   $0008,  $000C,  $000C,  $0014   ; 5F12   0008 000C 000C 0014
        DECLE   $0014,  $0000,  $0000,  $0000   ; 5F16   0014 0000 0000 0000
        DECLE   $0004,  $0008,  $0018,  $003C   ; 5F1A   0004 0008 0018 003C
        DECLE   $003C,  $0038,  $0014,  $0000   ; 5F1E   003C 0038 0014 0000
        DECLE   $0010,  $0018,  $0018,  $0034   ; 5F22   0010 0018 0018 0034
        DECLE   $0020,  $0000,  $0000,  $0000   ; 5F26   0020 0000 0000 0000
        DECLE   $0004,  $0008,  $0018,  $001C   ; 5F2A   0004 0008 0018 001C
        DECLE   $005C,  $005E,  $0010,  $0000   ; 5F2E   005C 005E 0010 0000
        DECLE   $0018,  $001A,  $0036,  $0030   ; 5F32   0018 001A 0036 0030
        DECLE   $0060,  $0000,  $0000,  $0000   ; 5F36   0060 0000 0000 0000
        DECLE   $0004,  $0008,  $0008,  $006C   ; 5F3A   0004 0008 0008 006C
        DECLE   $005F,  $009E,  $0018,  $0003   ; 5F3E   005F 009E 0018 0003
        DECLE   $0011,  $0032,  $0060,  $0060   ; 5F42   0011 0032 0060 0060
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 5F46   00C0 0000 0000 0000
        DECLE   $0002,  $0004,  $0004,  $000E   ; 5F4A   0002 0004 0004 000E
        DECLE   $002E,  $002F,  $004C,  $0000   ; 5F4E   002E 002F 004C 0000
        DECLE   $000B,  $001B,  $0039,  $0030   ; 5F52   000B 001B 0039 0030
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F56   0000 0000 0000 0000
        DECLE   $0002,  $0004,  $000C,  $000E   ; 5F5A   0002 0004 000C 000E
        DECLE   $000E,  $002E,  $002C,  $0001   ; 5F5E   000E 002E 002C 0001
        DECLE   $0008,  $000C,  $000E,  $003E   ; 5F62   0008 000C 000E 003E
        DECLE   $001A,  $0000,  $0000,  $0000   ; 5F66   001A 0000 0000 0000
        DECLE   $0004,  $0008,  $000C,  $001C   ; 5F6A   0004 0008 000C 001C
        DECLE   $001C,  $001C,  $000A,  $0000   ; 5F6E   001C 001C 000A 0000
        DECLE   $000C,  $001C,  $0018,  $0014   ; 5F72   000C 001C 0018 0014
        DECLE   $0034,  $0000,  $0000,  $0000   ; 5F76   0034 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F7A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F7E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F82   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F86   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F8A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F8E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F92   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F96   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F9A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F9E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FA2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FA6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FAA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FAE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FBA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FBE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FCA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FCE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FD2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FD6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FDA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FDE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0001   ; 5FFE   0000 0000 0001 0001
        DECLE   $0001,  $0000,  $0001,  $0001   ; 6002   0001 0000 0001 0001
        DECLE   $0000,  $0000,  $0001,  $0002   ; 6006   0000 0000 0001 0002
        DECLE   $0001,  $0001,  $0002,  $0002   ; 600A   0001 0001 0002 0002
        DECLE   $0001,  $0001,  $0001,  $0001   ; 600E   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 6012   0001 0001 0001 0001
        DECLE   $0000,  $0000,  $0001,  $0002   ; 6016   0000 0000 0001 0002
        DECLE   $0001,  $0001,  $0001,  $0002   ; 601A   0001 0001 0001 0002
        DECLE   $0001,  $0001,  $0000,  $0000   ; 601E   0001 0001 0000 0000
        DECLE   $0000,  $00FF,  $0000,  $0000   ; 6022   0000 00FF 0000 0000
        DECLE   $0001,  $0000,  $0000,  $00FF   ; 6026   0001 0000 0000 00FF
        DECLE   $0000,  $00FF,  $0001,  $0000   ; 602A   0000 00FF 0001 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 602E   0001 0000 0000 0000
        DECLE   $0000,  $00FF,  $0000,  $0000   ; 6032   0000 00FF 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6036   0000 0000 0000 0000
        DECLE   $0000,  $00FF,  $0001,  $0000   ; 603A   0000 00FF 0001 0000
        DECLE   $0001,  $0000                   ; 603E   0001 0000
L_6040:
        MVI     .PSG0.rgt_hand,R0               ; 6040   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 6042   0380 01FF
L_6044:
        PSHR    R5                              ; 6044   0275
        CMPI    #$005A, R0                      ; 6045   0378 005A
        BNEQ    L_6072                          ; 6047   020C 0029

        MVI     .ISRVEC.0,R0                    ; 6049   0280 0100
        MVI     .ISRVEC.1,R1                    ; 604B   0281 0101
        MVO     R0,     G_0357                  ; 604D   0240 0357
        MVO     R1,     G_0358                  ; 604F   0241 0358
        MVII    #$00CB, R0                      ; 6051   02B8 00CB
        MVII    #$0060, R1                      ; 6053   02B9 0060
        MVO     R0,     .ISRVEC.0               ; 6055   0240 0100
        MVO     R1,     .ISRVEC.1               ; 6057   0241 0101
        CLRR    R0                              ; 6059   01C0
        MVO     R0,     .PSG0.chn_a_vol         ; 605A   0240 01FB
        MVO     R0,     .PSG0.chn_b_vol         ; 605C   0240 01FC
        MVO     R0,     .PSG0.chn_c_vol         ; 605E   0240 01FD

        JSR     R5,     .EXEC.4C3               ; 6060   0004 0114 00C3
        JSR     R5,     L_69C5                  ; 6063   0004 0168 01C5
        BIDECLE $6A62                           ; 6066   0062 006A

        MVI     G_0357, R0                      ; 6068   0280 0357
        MVI     G_0358, R1                      ; 606A   0281 0358
        MVO     R0,     .ISRVEC.0               ; 606C   0240 0100
        MVO     R1,     .ISRVEC.1               ; 606E   0241 0101
        MVI     .PSG1.lft_hand,R0               ; 6070   0280 00FF
L_6072:
        PULR    R7                              ; 6072   02B7

L_6073:
        PSHR    R5                              ; 6073   0275
        MVI     G_01BD, R3                      ; 6074   0283 01BD
        TSTR    R3                              ; 6076   009B
        BEQ     L_609F                          ; 6077   0204 0026

        MVI     .PSG0.lft_hand,R0               ; 6079   0280 01FF
        AND     .PSG0.rgt_hand,R0               ; 607B   0380 01FE
        CMPI    #$00FF, R0                      ; 607D   0378 00FF
        BEQ     L_6084                          ; 607F   0204 0003
        J       L_D26B                          ; 6081   0004 03D0 026B

L_6084:
        MVI     G_01BF, R0                      ; 6084   0280 01BF
        DECR    R0                              ; 6086   0010
        MVO     R0,     G_01BF                  ; 6087   0240 01BF
        BNEQ    L_609B                          ; 6089   020C 0010

        MVI     G_0357, R5                      ; 608B   0285 0357
        MVI@    R5,     R0                      ; 608D   02A8
        MVO     R0,     G_01BE                  ; 608E   0240 01BE
        MVI@    R5,     R1                      ; 6090   02A9
        MVO     R5,     G_0357                  ; 6091   0245 0357
        MVO     R1,     G_01BF                  ; 6093   0241 01BF
        TSTR    R0                              ; 6095   0080
        BNEQ    L_609B                          ; 6096   020C 0003
        J       L_D26B                          ; 6098   0004 03D0 026B

L_609B:
        MVI     G_01BE, R0                      ; 609B   0280 01BE
        B       L_60A2                          ; 609D   0200 0003

L_609F:
        JSR     R5,     L_6040                  ; 609F   0004 0160 0040

L_60A2:
        MOVR    R0,     R1                      ; 60A2   0081
        ANDI    #$001F, R1                      ; 60A3   03B9 001F
        XORR    R1,     R0                      ; 60A5   01C8
        CMPI    #$0040, R0                      ; 60A6   0378 0040
        BNEQ    L_60AF                          ; 60A8   020C 0005

        PSHR    R1                              ; 60AA   0271

        JSR     R5,     L_5920                  ; 60AB   0004 0158 0120

        PULR    R1                              ; 60AE   02B1
L_60AF:
        ANDI    #$0040, R0                      ; 60AF   03B8 0040
        BNEQ    L_60B8                          ; 60B1   020C 0005

        PSHR    R1                              ; 60B3   0271

        JSR     R5,     L_5951                  ; 60B4   0004 0158 0151

        PULR    R1                              ; 60B7   02B1
L_60B8:
        ADDR    R7,     R1                      ; 60B8   00F9
        SUBI    #$00B9, R1                      ; 60B9   0339 00B9
        MVI@    R1,     R2                      ; 60BB   028A
        MVI     G_01B1, R3                      ; 60BC   0283 01B1
        MVO     R3,     G_01B2                  ; 60BE   0243 01B2
        DECR    R2                              ; 60C0   0012
        BEQ     L_60C5                          ; 60C1   0204 0002

        MVO     R2,     G_01B1                  ; 60C3   0242 01B1
L_60C5:
        ADDI    #$0020, R1                      ; 60C5   02F9 0020
        MVI@    R1,     R2                      ; 60C7   028A
        MVO     R2,     G_019F                  ; 60C8   0242 019F
        PULR    R7                              ; 60CA   02B7
        MOVR    R5,     R7                      ; 60CB   00AF

        DECLE   $00FF,  $0031,  $00F3,  $0006   ; 60CC   00FF 0031 00F3 0006
        DECLE   $0053,  $0001,  $0043,  $0002   ; 60D0   0053 0001 0043 0002
        DECLE   $0047,  $0004,  $0057,  $0008   ; 60D4   0047 0004 0057 0008
        DECLE   $0047,  $000A,  $0043,  $000A   ; 60D8   0047 000A 0043 000A
        DECLE   $0047,  $0005,  $0057,  $0023   ; 60DC   0047 0005 0057 0023
        DECLE   $0047,  $0011,  $0043,  $0006   ; 60E0   0047 0011 0043 0006
        DECLE   $0047,  $0004                   ; 60E4   0047 0004

        RLC     R3,     2                       ; 60E6   0057
        INCR    R2                              ; 60E7   000A
        SWAP    R3,     2                       ; 60E8   0047
        INCR    R1                              ; 60E9   0009
        ADDR    R4,     R7                      ; 60EA   00E7

        DECLE   $0001,  $00FD,  $0001,  $00F9   ; 60EB   0001 00FD 0001 00F9
        DECLE   $0001,  $00FD,  $0012,  $008D   ; 60EF   0001 00FD 0012 008D
        DECLE   $0008,  $00ED,  $0004,  $00EC   ; 60F3   0008 00ED 0004 00EC
        DECLE   $0001,  $00FC,  $0001,  $00EC   ; 60F7   0001 00FC 0001 00EC
        DECLE   $0002,  $00FD,  $0001,  $00F9   ; 60FB   0002 00FD 0001 00F9
        DECLE   $0001,  $00E9,  $0001,  $00EB   ; 60FF   0001 00E9 0001 00EB
        DECLE   $0003,  $00E9,  $0002,  $00F9   ; 6103   0003 00E9 0002 00F9
        DECLE   $0002,  $00FD,  $0002,  $00ED   ; 6107   0002 00FD 0002 00ED
        DECLE   $000B,  $00FD,  $0003,  $00FF   ; 610B   000B 00FD 0003 00FF

        ADCR    R0                              ; 610F   0028
        MOVR    R0,     R7                      ; 6110   0087

        DECLE   $0001                           ; 6111   0001

        MOVR    R2,     R7                      ; 6112   0097

        COMR    R2                              ; 6113   001A
        MOVR    R0,     R7                      ; 6114   0087

        DECLE   $0004,  $00E7,  $0001,  $00E9   ; 6115   0004 00E7 0001 00E9
        DECLE   $0001,  $00F9,  $000A,  $00E9   ; 6119   0001 00F9 000A 00E9
        DECLE   $0003,  $00F9,  $0006,  $00E9   ; 611D   0003 00F9 0006 00E9
        DECLE   $0002,  $00EB,  $0004,  $00FF   ; 6121   0002 00EB 0004 00FF

        COMR    R2                              ; 6125   001A
        MOVR    R3,     R7                      ; 6126   009F

        DECLE   $001C,  $00FF,  $000C,  $00EC   ; 6127   001C 00FF 000C 00EC
        DECLE   $0001,  $00FC,  $0029,  $00EC   ; 612B   0001 00FC 0029 00EC
        DECLE   $0006,  $00ED,  $003E,  $00FD   ; 612F   0006 00ED 003E 00FD
        DECLE   $0002,  $00F9,  $0001,  $00EB   ; 6133   0002 00F9 0001 00EB
        DECLE   $0002,  $00FB,  $0006,  $00FF   ; 6137   0002 00FB 0006 00FF
        DECLE   $0001,  $005F,  $0012,  $004B   ; 613B   0001 005F 0012 004B
        DECLE   $0004,  $00EB,  $0015,  $004B   ; 613F   0004 00EB 0015 004B
        DECLE   $0006,  $005F,  $0012,  $005B   ; 6143   0006 005F 0012 005B
        DECLE   $0002,  $004B,  $0001,  $00EB   ; 6147   0002 004B 0001 00EB
        DECLE   $0005,  $00FB,  $0002,  $005B   ; 614B   0005 00FB 0002 005B
        DECLE   $0003,  $005F,  $001C,  $007F   ; 614F   0003 005F 001C 007F
        DECLE   $0001,  $00FF,  $0004,  $00F7   ; 6153   0001 00FF 0004 00F7
        DECLE   $0005,  $0097,  $0009,  $00FF   ; 6157   0005 0097 0009 00FF
        DECLE   $0001,  $00F9,  $0002,  $00FD   ; 615B   0001 00F9 0002 00FD
        DECLE   $0011,  $00ED,  $0001,  $00EC   ; 615F   0011 00ED 0001 00EC
        DECLE   $0001,  $00FC,  $0001           ; 6163   0001 00FC 0001

        ADDR    R7,     R6                      ; 6166   00FE

        JSR     R4,     L_FC03                  ; 6167   0004 00FC 0003
        DECLE   $00ED,  $0001,  $00FD,  $0002   ; 616A   00ED 0001 00FD 0002
        DECLE   $0049,  $0001,  $004B,  $0009   ; 616E   0049 0001 004B 0009
        DECLE   $005F,  $0011,  $005C,  $0002   ; 6172   005F 0011 005C 0002
        DECLE   $00FC,  $0013,  $00FE,  $0004   ; 6176   00FC 0013 00FE 0004
        DECLE   $00EE,  $0002,  $00E6,  $0001   ; 617A   00EE 0002 00E6 0001
        DECLE   $00F6,  $0003,  $00E6,  $0001   ; 617E   00F6 0003 00E6 0001
        DECLE   $00EE,  $0002,  $00FE,  $0003   ; 6182   00EE 0002 00FE 0003
        DECLE   $00EE,  $0002,  $00E6,  $0001   ; 6186   00EE 0002 00E6 0001
        DECLE   $00F6,  $0002,  $00F7,  $0006   ; 618A   00F6 0002 00F7 0006
        DECLE   $00F6,  $0004,  $0076,  $0001   ; 618E   00F6 0004 0076 0001
        DECLE   $0056,  $0008,  $0057,  $0007   ; 6192   0056 0008 0057 0007
        DECLE   $0056,  $0002,  $0046,  $0002   ; 6196   0056 0002 0046 0002
        DECLE   $0056,  $0002,  $0057,  $0002   ; 619A   0056 0002 0057 0002
        DECLE   $0047,  $000D,  $0043,  $0009   ; 619E   0047 000D 0043 0009
        DECLE   $0047,  $0003,  $0057,  $0014   ; 61A2   0047 0003 0057 0014
        DECLE   $0047,  $0014,  $0043,  $0001   ; 61A6   0047 0014 0043 0001
        DECLE   $0063,  $0002,  $00E3,  $0001   ; 61AA   0063 0002 00E3 0001
        DECLE   $00FB,  $0001,  $00EB,  $0001   ; 61AE   00FB 0001 00EB 0001
        DECLE   $00F9,  $0001,  $00FD,  $0002   ; 61B2   00F9 0001 00FD 0002
        DECLE   $00ED,  $0003,  $00EC,  $0002   ; 61B6   00ED 0003 00EC 0002
        DECLE   $00FC,  $0009,  $00FF,  $0002   ; 61BA   00FC 0009 00FF 0002
        DECLE   $005F,  $0015,  $005C,  $0001   ; 61BE   005F 0015 005C 0001
        DECLE   $00FC,  $0006,  $00EC,  $0002   ; 61C2   00FC 0006 00EC 0002
        DECLE   $00ED,  $0002,  $00FD,  $0001   ; 61C6   00ED 0002 00FD 0001
        DECLE   $00F9,  $0003,  $00FD,  $0002   ; 61CA   00F9 0003 00FD 0002
        DECLE   $00ED,  $0001,  $00EC,  $0004   ; 61CE   00ED 0001 00EC 0004
        DECLE   $00ED,  $0001,  $00FD,  $0001   ; 61D2   00ED 0001 00FD 0001
        DECLE   $00E9,  $0001,  $00EB,  $0002   ; 61D6   00E9 0001 00EB 0002
        DECLE   $00FB,  $000C,  $00EB,  $0004   ; 61DA   00FB 000C 00EB 0004
        DECLE   $004B,  $0001,  $005F,  $000F   ; 61DE   004B 0001 005F 000F
        DECLE   $007F,  $0001,  $00FC,  $0006   ; 61E2   007F 0001 00FC 0006
        DECLE   $00FF                           ; 61E6   00FF

        JSR     R4,     L_FC08                  ; 61E7   0004 00FC 0008
        DECLE   $00FE,  $0001,  $00FF,  $0004   ; 61EA   00FE 0001 00FF 0004
        DECLE   $004C,  $0001,  $005C,  $0007   ; 61EE   004C 0001 005C 0007
        DECLE   $004D,  $0001,  $00FD,  $0001   ; 61F2   004D 0001 00FD 0001
        DECLE   $00E9,  $0001,  $00FB,  $0026   ; 61F6   00E9 0001 00FB 0026
        DECLE   $00EB,  $0002,  $00E9,  $0004   ; 61FA   00EB 0002 00E9 0004
        DECLE   $00EB,  $0002,  $005B,  $0005   ; 61FE   00EB 0002 005B 0005
        DECLE   $004B,  $0006,  $00E9,  $0002   ; 6202   004B 0006 00E9 0002
        DECLE   $00F9,  $0009,  $00E9,  $0002   ; 6206   00F9 0009 00E9 0002
        DECLE   $008B,  $0001,  $009B,  $0004   ; 620A   008B 0001 009B 0004

        MOVR    R2,     R3                      ; 620E   0093
        EIS                                     ; 620F   0002
        MOVR    R0,     R3                      ; 6210   0083
        DIS                                     ; 6211   0003
        MOVR    R0,     R7                      ; 6212   0087

        DIS                                     ; 6213   0003
        ADDR    R4,     R7                      ; 6214   00E7

        COMR    R6                              ; 6215   001E
        MOVR    R0,     R7                      ; 6216   0087

        CLRC                                    ; 6217   0006
        ADDR    R4,     R7                      ; 6218   00E7

        DECLE   $000E,  $00FF,  $0008,  $00ED   ; 6219   000E 00FF 0008 00ED
        DECLE   $000E,  $00FD,  $0003,  $00F9   ; 621D   000E 00FD 0003 00F9
        DECLE   $0001,  $00E9,  $0005,  $00EB   ; 6221   0001 00E9 0005 00EB
        DECLE   $0005,  $0049,  $0001           ; 6225   0005 0049 0001

        SLLC    R3,     2                       ; 6228   005F
L_6229:
        DECR    R7                              ; 6229   0017

        DECLE   $005C,  $0004,  $004C,  $0001   ; 622A   005C 0004 004C 0001
        DECLE   $004D,  $0001,  $0059,  $0001   ; 622E   004D 0001 0059 0001
        DECLE   $004B,  $0005,  $006B,  $0001   ; 6232   004B 0005 006B 0001
        DECLE   $00EB,  $000A,  $00FF,  $000A   ; 6236   00EB 000A 00FF 000A
        DECLE   $00ED,  $0001,  $00EC,  $0002   ; 623A   00ED 0001 00EC 0002
        DECLE   $00FC,  $0007,  $00FF           ; 623E   00FC 0007 00FF

        DIS                                     ; 6241   0003
        SLLC    R3,     2                       ; 6242   005F
        INCR    R7                              ; 6243   000F

        ADDR    R4,     R6                      ; 6244   00E6
L_6245:
        EIS                                     ; 6245   0002
        DECLE   $00EE,  $0009,  $00E6,  $0001   ; 6246   00EE 0009 00E6 0001
        DECLE   $00F7,  $0003,  $0057,  $0006   ; 624A   00F7 0003 0057 0006
        DECLE   $0047,  $0002,  $0043,  $0001   ; 624E   0047 0002 0043 0001
        DECLE   $0053,  $0002,  $005B,  $0003   ; 6252   0053 0002 005B 0003
        DECLE   $00FB,  $0002,  $00F3,  $0001   ; 6256   00FB 0002 00F3 0001
        DECLE   $00E3,  $0001,  $00E7,  $0002   ; 625A   00E3 0001 00E7 0002
        DECLE   $00F7,  $0002,  $00F6,  $0002   ; 625E   00F7 0002 00F6 0002
        DECLE   $0056,  $0007,  $0057,  $0002   ; 6262   0056 0007 0057 0002
        DECLE   $0047,  $0005,  $0057,  $0004   ; 6266   0047 0005 0057 0004
        DECLE   $0047,  $0009,  $0043,  $0002   ; 626A   0047 0009 0043 0002
        DECLE   $005B,  $0001,  $00EB,  $0001   ; 626E   005B 0001 00EB 0001
        DECLE   $00E9,  $0002,  $00F9,  $0002   ; 6272   00E9 0002 00F9 0002
        DECLE   $00FD,  $0004,  $00ED,  $0004   ; 6276   00FD 0004 00ED 0004
        DECLE   $00EC,  $0003,  $00ED,  $0006   ; 627A   00EC 0003 00ED 0006
        DECLE   $008D,  $0003,  $009D,  $0003   ; 627E   008D 0003 009D 0003
        DECLE   $00FD,  $0001,  $00ED,  $000A   ; 6282   00FD 0001 00ED 000A
        DECLE   $00EC,  $0002,  $00FC,  $0013   ; 6286   00EC 0002 00FC 0013
        DECLE   $00FE,  $0001,  $009E,  $0001   ; 628A   00FE 0001 009E 0001
        DECLE   $009F,  $0006,  $00FF,  $0011   ; 628E   009F 0006 00FF 0011
        DECLE   $00F7,  $001E,  $00ED,  $0001   ; 6292   00F7 001E 00ED 0001
        DECLE   $00FD,  $0008,  $00ED,  $0001   ; 6296   00FD 0008 00ED 0001

        ADDR    R7,     R5                      ; 629A   00FD
        INCR    R5                              ; 629B   000D
        ADDR    R5,     R5                      ; 629C   00ED

        JSR     R4,     L_FC01                  ; 629D   0004 00FC 0001
        DECLE   $00EE,  $0001,  $00E6,  $0005   ; 62A0   00EE 0001 00E6 0005
        DECLE   $00EE,  $0002,  $00FF,  $001D   ; 62A4   00EE 0002 00FF 001D
        DECLE   $00FB,  $0027,  $00EB,  $0001   ; 62A8   00FB 0027 00EB 0001
        DECLE   $00FB,  $0001,  $00FF,  $0001   ; 62AC   00FB 0001 00FF 0001

        MOVR    R3,     R7                      ; 62B0   009F

        DECLE   $0007,  $00FF,  $000C,  $00FE   ; 62B1   0007 00FF 000C 00FE
        DECLE   $0028,  $00FC,  $0003,  $00EC   ; 62B5   0028 00FC 0003 00EC
        DECLE   $0001,  $00ED,  $000E,  $00FD   ; 62B9   0001 00ED 000E 00FD
        DECLE   $0002,  $00ED,  $0003,  $00EC   ; 62BD   0002 00ED 0003 00EC
        DECLE   $0001,  $00EE,  $0001,  $00E6   ; 62C1   0001 00EE 0001 00E6
        DECLE   $0001,  $00F6,  $0014,  $00E6   ; 62C5   0001 00F6 0014 00E6
        DECLE   $0001,  $00FE,  $0001,  $00ED   ; 62C9   0001 00FE 0001 00ED
        DECLE   $0016,  $00FE,  $0001,  $00F6   ; 62CD   0016 00FE 0001 00F6
        DECLE   $0004,  $00F7,  $0003,  $00F6   ; 62D1   0004 00F7 0003 00F6
        DECLE   $000A,  $00F7,  $0006,  $00F6   ; 62D5   000A 00F7 0006 00F6
        DECLE   $0003,  $00E6,  $0001,  $00FC   ; 62D9   0003 00E6 0001 00FC
        DECLE   $0001,  $00ED,  $0006,  $00FD   ; 62DD   0001 00ED 0006 00FD
        DECLE   $0006,  $00ED,  $000D,  $00FC   ; 62E1   0006 00ED 000D 00FC
        DECLE   $0001,  $00E6,  $0001,  $00F6   ; 62E5   0001 00E6 0001 00F6
        DECLE   $0016,  $00F7,  $0003,  $00F6   ; 62E9   0016 00F7 0003 00F6
        DECLE   $0004,  $00EE,  $0001,  $00EC   ; 62ED   0004 00EE 0001 00EC
        DECLE   $0001,  $00ED,  $0006,  $00FD   ; 62F1   0001 00ED 0006 00FD
        DECLE   $0002,  $00F9,  $0005,  $00FF   ; 62F5   0002 00F9 0005 00FF
        DECLE   $0001,  $005F,  $000D,  $004B   ; 62F9   0001 005F 000D 004B
        DECLE   $0010,  $005F,  $0002,  $005D   ; 62FD   0010 005F 0002 005D
        DECLE   $0003,  $004D,  $0002,  $004C   ; 6301   0003 004D 0002 004C
        DECLE   $0002,  $006C,  $0001,  $00EC   ; 6305   0002 006C 0001 00EC
        DECLE   $000C,  $00ED,  $0001,  $00FD   ; 6309   000C 00ED 0001 00FD
        DECLE   $0001,  $005F,  $0008,  $004B   ; 630D   0001 005F 0008 004B
        DECLE   $0007,  $005F,  $0004,  $004B   ; 6311   0007 005F 0004 004B
        DECLE   $0002,  $0049,  $0001,  $00F9   ; 6315   0002 0049 0001 00F9
        DECLE   $0001                           ; 6319   0001

        ADDR    R5,     R5                      ; 631A   00ED
        EIS                                     ; 631B   0002
        ADDR    R5,     R4                      ; 631C   00EC
L_631D:
        DECR    R7                              ; 631D   0017

        DECLE   $00ED,  $0005,  $00FD,  $0005   ; 631E   00ED 0005 00FD 0005
        DECLE   $00F9,  $0002,  $00E9,  $0002   ; 6322   00F9 0002 00E9 0002
        DECLE   $00FF,  $0004,  $00F6,  $0001   ; 6326   00FF 0004 00F6 0001
        DECLE   $00F7,  $0005                   ; 632A   00F7 0005

        RLC     R3,     2                       ; 632C   0057
        INCR    R5                              ; 632D   000D
        RLC     R2,     2                       ; 632E   0056
        INCR    R1                              ; 632F   0009
        SWAP    R2,     2                       ; 6330   0046

        JSRD    R4,     L_F403                  ; 6331   0004 00F6 0003
        DECLE   $00E6,  $0006,  $00F6,  $0001   ; 6334   00E6 0006 00F6 0001
        DECLE   $00F7,  $0013,  $00E6,  $0001   ; 6338   00F7 0013 00E6 0001
        DECLE   $00FC,  $0001,  $00ED,  $0002   ; 633C   00FC 0001 00ED 0002
        DECLE   $00FF,  $003B,  $0000           ; 6340   00FF 003B 0000
L_6343:
        PSHR    R5                              ; 6343   0275
        MVI     G_01B5, R3                      ; 6344   0283 01B5
        DECR    R3                              ; 6346   0013
        ADD     G_01A3, R3                      ; 6347   02C3 01A3
        MVO     R3,     G_01B5                  ; 6349   0243 01B5
        CMPI    #$00A0, R3                      ; 634B   037B 00A0
        BNC     L_635A                          ; 634D   0209 000B

        CLRR    R0                              ; 634F   01C0
        MVO     R0,     G_01A3                  ; 6350   0240 01A3
        MVII    #$0009, R0                      ; 6352   02B8 0009
        MVO     R0,     G_018F                  ; 6354   0240 018F
        MVO     R0,     G_0190                  ; 6356   0240 0190
        B       L_6367                          ; 6358   0200 000D

L_635A:
        CMPI    #$000A, R3                      ; 635A   037B 000A
        BC      L_637C                          ; 635C   0201 001E

        MVII    #$0002, R0                      ; 635E   02B8 0002
        MVO     R0,     G_01A3                  ; 6360   0240 01A3
        DECR    R0                              ; 6362   0010
        MVO     R0,     G_018F                  ; 6363   0240 018F
        MVO     R0,     G_0190                  ; 6365   0240 0190
L_6367:
        MVI     G_018A, R0                      ; 6367   0280 018A
        TSTR    R0                              ; 6369   0080
        BNEQ    L_637C                          ; 636A   020C 0010

        MVI     G_0177, R0                      ; 636C   0280 0177
        CMPI    #$00A5, R0                      ; 636E   0378 00A5
        BC      L_637C                          ; 6370   0201 000A

        MVO     R0,     G_017A                  ; 6372   0240 017A
        MVII    #$0040, R0                      ; 6374   02B8 0040
        MVO     R0,     G_0182                  ; 6376   0240 0182
        MVII    #$0003, R0                      ; 6378   02B8 0003
        MVO     R0,     G_018A                  ; 637A   0240 018A
L_637C:
        MVI     G_01BB, R0                      ; 637C   0280 01BB
        SLL     R0,     2                       ; 637E   004C
        SLL     R0,     1                       ; 637F   0048
        BEQ     L_63D0                          ; 6380   0204 004E

        SUB     G_01B5, R0                      ; 6382   0300 01B5
        ADDI    #$0005, R0                      ; 6384   02F8 0005
        CMPI    #$000B, R0                      ; 6386   0378 000B
        BC      L_63D0                          ; 6388   0201 0046

        CLRR    R0                              ; 638A   01C0
        MVO     R0,     G_01A3                  ; 638B   0240 01A3

        JSR     R5,     L_69C5                  ; 638D   0004 0168 01C5
        BIDECLE $6A88                           ; 6390   0088 006A

        MVI     G_01AF, R1                      ; 6392   0281 01AF
        INCR    R1                              ; 6394   0009
        MVO     R1,     G_01AF                  ; 6395   0241 01AF
        ADDR    R1,     R1                      ; 6397   00C9
        SDBD                                    ; 6398   0001
        ADDI    #$5B9A, R1                      ; 6399   02F9 009A 005B
        MVI@    R1,     R0                      ; 639C   0288
        INCR    R0                              ; 639D   0008
        MVO     R0,     .BTAB.EE                ; 639E   0240 02EE
        INCR    R1                              ; 63A0   0009
        MVI@    R1,     R0                      ; 63A1   0288
        INCR    R0                              ; 63A2   0008
        MVO     R0,     .BTAB.EF                ; 63A3   0240 02EF
        MVI     G_0359, R0                      ; 63A5   0280 0359
        ADDI    #$0064, R0                      ; 63A7   02F8 0064
        SDBD                                    ; 63A9   0001
        CMPI    #$2710, R0                      ; 63AA   0378 0010 0027
        BNC     L_63CC                          ; 63AD   0209 001D

        SDBD                                    ; 63AF   0001
        SUBI    #$2710, R0                      ; 63B0   0338 0010 0027
        MVI     G_015D, R1                      ; 63B3   0281 015D
        INCR    R1                              ; 63B5   0009
        MVII    #$00C8, R2                      ; 63B6   02BA 00C8
        MVO     R2,     G_01B9                  ; 63B8   0242 01B9
        PSHR    R0                              ; 63BA   0270
        PSHR    R1                              ; 63BB   0271
        PSHR    R2                              ; 63BC   0272

        JSR     R5,     L_69FE                  ; 63BD   0004 0168 01FE
        BIDECLE $6A9B                           ; 63C0   009B 006A

        PULR    R2                              ; 63C2   02B2
        PULR    R1                              ; 63C3   02B1
        PULR    R0                              ; 63C4   02B0
        MVO     R1,     G_015D                  ; 63C5   0241 015D
        MVI     G_035A, R1                      ; 63C7   0281 035A
        INCR    R1                              ; 63C9   0009
        MVO     R1,     G_035A                  ; 63CA   0241 035A
L_63CC:
        MVO     R0,     G_0359                  ; 63CC   0240 0359
        MVII    #$00FD, R3                      ; 63CE   02BB 00FD
L_63D0:
        MVO     R3,     G_01B5                  ; 63D0   0243 01B5
        MVO     R3,     G_0177                  ; 63D2   0243 0177
        MVO     R3,     G_0178                  ; 63D4   0243 0178
        MVI     G_01AC, R0                      ; 63D6   0280 01AC
        ADD     G_0160, R0                      ; 63D8   02C0 0160
        CMP     G_015E, R0                      ; 63DA   0340 015E
        BC      L_6423                          ; 63DC   0201 0045

        MVI     G_017A, R0                      ; 63DE   0280 017A
        MVI     G_0182, R1                      ; 63E0   0281 0182
        CLRR    R2                              ; 63E2   01D2
        SUB     G_0173, R0                      ; 63E3   0300 0173
        SUB     G_017B, R1                      ; 63E5   0301 017B
        ADDI    #$00FF, R0                      ; 63E7   02F8 00FF
        ADDI    #$00FF, R1                      ; 63E9   02F9 00FF
        CMPI    #$010B, R0                      ; 63EB   0378 010B
        ADCR    R2                              ; 63ED   002A
        CMPI    #$0103, R0                      ; 63EE   0378 0103
        ADCR    R2                              ; 63F0   002A
        CMPI    #$00FB, R0                      ; 63F1   0378 00FB
        ADCR    R2                              ; 63F3   002A
        SLL     R2,     2                       ; 63F4   004E
        CMPI    #$0110, R1                      ; 63F5   0379 0110
        ADCR    R2                              ; 63F7   002A
        CMPI    #$0100, R1                      ; 63F8   0379 0100
        ADCR    R2                              ; 63FA   002A
        CMPI    #$00F0, R1                      ; 63FB   0379 00F0
        ADCR    R2                              ; 63FD   002A
        ADDR    R7,     R2                      ; 63FE   00FA
        SDBD                                    ; 63FF   0001
        ADDI    #$0073, R2                      ; 6400   02FA 0073 0000
        MVI@    R2,     R2                      ; 6403   0292
        MVII    #$0003, R0                      ; 6404   02B8 0003
        MVI     G_035E, R0                      ; 6406   0280 035E
        INCR    R0                              ; 6408   0008
        MVO     R0,     G_035E                  ; 6409   0240 035E
        ANDI    #$0007, R0                      ; 640B   03B8 0007
        SLL     R0,     1                       ; 640D   0048
        ADDR    R0,     R2                      ; 640E   00C2
        ADDR    R7,     R2                      ; 640F   00FA
        SDBD                                    ; 6410   0001
        ADDI    #$0072, R2                      ; 6411   02FA 0072 0000
        MVI@    R2,     R0                      ; 6414   0290
        INCR    R2                              ; 6415   000A
        MVI@    R2,     R1                      ; 6416   0291
        ADD     G_017A, R0                      ; 6417   02C0 017A
        SUB     G_01B1, R0                      ; 6419   0300 01B1
        ADD     G_0182, R1                      ; 641B   02C1 0182
        ANDI    #$007F, R1                      ; 641D   03B9 007F
        MVO     R0,     G_017A                  ; 641F   0240 017A
        MVO     R1,     G_0182                  ; 6421   0241 0182
L_6423:
        MVI     G_01B5, R0                      ; 6423   0280 01B5
        CMPI    #$0087, R0                      ; 6425   0378 0087
        BC      L_6471                          ; 6427   0201 0048

        CMPI    #$0011, R0                      ; 6429   0378 0011
        BNC     L_6471                          ; 642B   0209 0044

        CMPI    #$0078, R0                      ; 642D   0378 0078
        BC      L_6435                          ; 642F   0201 0004

        CMPI    #$003C, R0                      ; 6431   0378 003C
        BC      L_6471                          ; 6433   0201 003C

L_6435:
        MVII    #$01A6, R3                      ; 6435   02BB 01A6
        ADD     G_015E, R3                      ; 6437   02C3 015E
        CLRR    R0                              ; 6439   01C0
        MVII    #$01A5, R4                      ; 643A   02BC 01A5
L_643C:
        CMP@    R4,     R0                      ; 643C   0360
        BNEQ    L_643C                          ; 643D   022C 0002

        CMPR    R3,     R4                      ; 643F   015C
        BEQ     L_6471                          ; 6440   0204 002F

        MVII    #$01A5, R3                      ; 6442   02BB 01A5
        MVII    #$0161, R5                      ; 6444   02BD 0161
L_6446:
        MVI     G_01B5, R0                      ; 6446   0280 01B5
        SUB@    R5,     R0                      ; 6448   0328
        ADDI    #$000A, R0                      ; 6449   02F8 000A
        CMPI    #$0024, R0                      ; 644B   0378 0024
        BC      L_6453                          ; 644D   0201 0004

        MVI@    R3,     R0                      ; 644F   0298
        TSTR    R0                              ; 6450   0080
        BNEQ    L_6471                          ; 6451   020C 001E

L_6453:
        INCR    R3                              ; 6453   000B
        CMPI    #$01AB, R3                      ; 6454   037B 01AB
        BNEQ    L_6446                          ; 6456   022C 0011

        DECR    R4                              ; 6458   0014
        MVI     G_015E, R0                      ; 6459   0280 015E
        MVO@    R0,     R4                      ; 645B   0260
        MVI     G_01B5, R0                      ; 645C   0280 01B5
        SUBI    #$0008, R0                      ; 645E   0338 0008
        SUBI    #$0045, R4                      ; 6460   033C 0045
        MVO@    R0,     R4                      ; 6462   0260
        ADDI    #$0005, R4                      ; 6463   02FC 0005
        MVII    #$0037, R0                      ; 6465   02B8 0037
        MVO@    R0,     R4                      ; 6467   0260
        SUBI    #$0168, R4                      ; 6468   033C 0168
        ADDR    R4,     R4                      ; 646A   00E4
        ADDI    #$0193, R4                      ; 646B   02FC 0193
        MVII    #$00FF, R0                      ; 646D   02B8 00FF
        MVO@    R0,     R4                      ; 646F   0260
        MVO@    R0,     R4                      ; 6470   0260
L_6471:
        PULR    R7                              ; 6471   02B7

        DECLE   $0030,  $0020,  $0030,  $0020   ; 6472   0030 0020 0030 0020
        DECLE   $0030,  $0030,  $0020,  $0020   ; 6476   0030 0030 0020 0020
        DECLE   $0010,  $0010,  $0000,  $0000   ; 647A   0010 0010 0000 0000
        DECLE   $0010,  $0000,  $0010,  $0000   ; 647E   0010 0000 0010 0000
        DECLE   $0000,  $0001,  $0000,  $00FF   ; 6482   0000 0001 0000 00FF
        DECLE   $0000,  $00FF,  $0000,  $00FF   ; 6486   0000 00FF 0000 00FF
        DECLE   $0001,  $0000,  $00FF,  $0000   ; 648A   0001 0000 00FF 0000
        DECLE   $00FF,  $0000,  $00FF,  $0000   ; 648E   00FF 0000 00FF 0000
        DECLE   $0000,  $00FF,  $0000,  $0001   ; 6492   0000 00FF 0000 0001
        DECLE   $0000,  $0001,  $0000,  $0001   ; 6496   0000 0001 0000 0001
        DECLE   $0001,  $0000,  $00FF,  $0000   ; 649A   0001 0000 00FF 0000
        DECLE   $00FF,  $0000,  $00FF,  $0000   ; 649E   00FF 0000 00FF 0000
        DECLE   $0000,  $0001,  $0000,  $00FF   ; 64A2   0000 0001 0000 00FF
        DECLE   $0000,  $00FF,  $0000,  $00FF   ; 64A6   0000 00FF 0000 00FF
        DECLE   $00FF,  $0000,  $0001,  $0000   ; 64AA   00FF 0000 0001 0000
        DECLE   $0001,  $0000,  $0001,  $0000   ; 64AE   0001 0000 0001 0000
        DECLE   $0000,  $00FF,  $0000,  $0001   ; 64B2   0000 00FF 0000 0001
        DECLE   $0000,  $0001,  $0000,  $0001   ; 64B6   0000 0001 0000 0001
        DECLE   $00FF,  $0000,  $0001,  $0000   ; 64BA   00FF 0000 0001 0000
        DECLE   $0001,  $0000,  $0001,  $0000   ; 64BE   0001 0000 0001 0000
L_64C2:
        PSHR    R5                              ; 64C2   0275
        MVII    #$0008, R0                      ; 64C3   02B8 0008
        MVII    #$031D, R4                      ; 64C5   02BC 031D
        MVII    #$0173, R5                      ; 64C7   02BD 0173
        MVII    #$0183, R3                      ; 64C9   02BB 0183
L_64CB:
        MVI@    R4,     R1                      ; 64CB   02A1
        MVO@    R1,     R5                      ; 64CC   0269
        SWAP    R1,     1                       ; 64CD   0041
        MVO@    R1,     R3                      ; 64CE   0259
        INCR    R3                              ; 64CF   000B
        DECR    R0                              ; 64D0   0010
        BNEQ    L_64CB                          ; 64D1   022C 0007

        MVII    #$0008, R0                      ; 64D3   02B8 0008
L_64D5:
        MVI@    R4,     R1                      ; 64D5   02A1
        MOVR    R1,     R2                      ; 64D6   008A
        ANDI    #$007F, R1                      ; 64D7   03B9 007F
        MVO@    R1,     R5                      ; 64D9   0269
        SLL     R2,     1                       ; 64DA   004A
        SWAP    R2,     1                       ; 64DB   0042
        ANDI    #$00FF, R2                      ; 64DC   03BA 00FF
        MVO@    R2,     R3                      ; 64DE   025A
        INCR    R3                              ; 64DF   000B
        DECR    R0                              ; 64E0   0010
        BNEQ    L_64D5                          ; 64E1   022C 000D
        PULR    R7                              ; 64E3   02B7

L_64E4:
        PSHR    R5                              ; 64E4   0275
        MVII    #$031D, R4                      ; 64E5   02BC 031D
        MVII    #$0173, R5                      ; 64E7   02BD 0173
        MVII    #$0183, R3                      ; 64E9   02BB 0183
        MVII    #$0008, R0                      ; 64EB   02B8 0008
L_64ED:
        MVI@    R3,     R2                      ; 64ED   029A
        INCR    R3                              ; 64EE   000B
        SWAP    R2,     1                       ; 64EF   0042
        XOR@    R5,     R2                      ; 64F0   03EA
        MVO@    R2,     R4                      ; 64F1   0262
        DECR    R0                              ; 64F2   0010
        BNEQ    L_64ED                          ; 64F3   022C 0007

        MVII    #$0008, R0                      ; 64F5   02B8 0008
L_64F7:
        MVI@    R3,     R1                      ; 64F7   0299
        INCR    R3                              ; 64F8   000B
        SWAP    R1,     1                       ; 64F9   0041
        SLR     R1,     1                       ; 64FA   0061
        XOR@    R5,     R1                      ; 64FB   03E9
        MVO@    R1,     R4                      ; 64FC   0261
        DECR    R0                              ; 64FD   0010
        BNEQ    L_64F7                          ; 64FE   022C 0008
        PULR    R7                              ; 6500   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6501   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6505   0000 0000 0000 0000

        COMR    R6                              ; 6509   001E
        ADCR    R7                              ; 650A   002F

        SARC    R3,     2                       ; 650B   007F
L_650C:
        RSWD    R5                              ; 650C   003D
        DECLE   $004D,  $001A,  $0000,  $0000   ; 650D   004D 001A 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6511   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6515   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6519   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 651D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6521   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6525   0000 0000 0000 0000
        DECLE   $000F                           ; 6529   000F
L_652A:
        DECR    R7                              ; 652A   0017

        DECLE   $003F,  $001E,  $0026,  $000D   ; 652B   003F 001E 0026 000D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 652F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6533   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 6537   0000 0000 0000 0080
        DECLE   $0080,  $0080,  $0080,  $0000   ; 653B   0080 0080 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 653F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6543   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0007,  $000B   ; 6547   0000 0000 0007 000B
        DECLE   $001F                           ; 654B   001F

        INCR    R7                              ; 654C   000F

        DECR    R3                              ; 654D   0013
L_654E:
        CLRC                                    ; 654E   0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; 654F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6553   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $00C0   ; 6557   0000 0000 0080 00C0
        DECLE   $00C0,  $0040,  $0040,  $0080   ; 655B   00C0 0040 0040 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 655F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6563   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0005   ; 6567   0000 0000 0003 0005

        INCR    R7                              ; 656B   000F

        SETC                                    ; 656C   0007
L_656D:
        INCR    R1                              ; 656D   0009
        DECLE   $0003,  $0000,  $0000,  $0000   ; 656E   0003 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6572   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 6576   0000 0000 0000 00C0
        DECLE   $00E0,  $00E0,  $00A0,  $00A0   ; 657A   00E0 00E0 00A0 00A0
        DECLE   $0040,  $0000,  $0000,  $0000   ; 657E   0040 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6582   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6586   0000 0000 0000 0001
        DECLE   $0002,  $0007,  $0003,  $0004   ; 658A   0002 0007 0003 0004
        DECLE   $0001,  $0000,  $0000,  $0000   ; 658E   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6592   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00E0   ; 6596   0000 0000 0000 00E0
        DECLE   $00F0,  $00F0,  $00D0,  $00D0   ; 659A   00F0 00F0 00D0 00D0
        DECLE   $00A0,  $0000,  $0000,  $0000   ; 659E   00A0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65A2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65A6   0000 0000 0000 0000
        DECLE   $0001,  $0003,  $0001,  $0002   ; 65AA   0001 0003 0001 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65AE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65B2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00F0   ; 65B6   0000 0000 0000 00F0
        DECLE   $0078,  $00F8,  $00E8,  $0068   ; 65BA   0078 00F8 00E8 0068
        DECLE   $00D0,  $0000,  $0000,  $0000   ; 65BE   00D0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65C2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65C6   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0000,  $0001   ; 65CA   0000 0001 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65CE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65D2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0078   ; 65D6   0000 0000 0000 0078
        DECLE   $00BC,  $00FC,  $00F4,  $0034   ; 65DA   00BC 00FC 00F4 0034
        DECLE   $0068,  $0000,  $0000,  $0000   ; 65DE   0068 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65E2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65E6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65EA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65EE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65F2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 65F6   0000 0000 0000 003C
        DECLE   $005E,  $00FE,  $007A,  $009A   ; 65FA   005E 00FE 007A 009A
        DECLE   $0034,  $0000,  $0000,  $0000   ; 65FE   0034 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6602   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $003C,  $0072   ; 6606   0000 0000 003C 0072
        DECLE   $007C,  $007E,  $005A,  $0038   ; 660A   007C 007E 005A 0038
        DECLE   $0014,  $0000,  $0000,  $0000   ; 660E   0014 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6612   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6616   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 661A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 661E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6622   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $001E,  $0039   ; 6626   0000 0000 001E 0039
        DECLE   $003E,  $003F,  $002D,  $001C   ; 662A   003E 003F 002D 001C
        DECLE   $000A,  $0000,  $0000,  $0000   ; 662E   000A 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6632   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6636   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 663A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 663E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6642   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000F,  $001C   ; 6646   0000 0000 000F 001C
        DECLE   $001F,  $001F,  $0016,  $000E   ; 664A   001F 001F 0016 000E
        DECLE   $0005,  $0000,  $0000,  $0000   ; 664E   0005 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6652   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 6656   0000 0000 0000 0080
        DECLE   $0000,  $0080,  $0080,  $0000   ; 665A   0000 0080 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 665E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6662   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6666   0000 0000

        SETC                                    ; 6668   0007
        INCR    R6                              ; 6669   000E
        INCR    R7                              ; 666A   000F
        INCR    R7                              ; 666B   000F

L_666C:
        INCR    R3                              ; 666C   000B
L_666D:
        SETC                                    ; 666D   0007
        DECLE   $0002,  $0000,  $0000,  $0000   ; 666E   0002 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6672   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0040   ; 6676   0000 0000 0080 0040
        DECLE   $0080,  $00C0,  $0040,  $0000   ; 667A   0080 00C0 0040 0000
        DECLE   $0080,  $0000,  $0000,  $0000   ; 667E   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6682   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0007   ; 6686   0000 0000 0003 0007
        DECLE   $0007,  $0007,  $0005,  $0003   ; 668A   0007 0007 0005 0003
        DECLE   $0001,  $0000,  $0000,  $0000   ; 668E   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6692   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00C0,  $0020   ; 6696   0000 0000 00C0 0020
        DECLE   $00C0,  $00E0,  $00A0,  $0080   ; 669A   00C0 00E0 00A0 0080
        DECLE   $0040,  $0000,  $0000,  $0000   ; 669E   0040 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66A2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0003   ; 66A6   0000 0000 0001 0003
        DECLE   $0003,  $0003,  $0002,  $0001   ; 66AA   0003 0003 0002 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66AE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66B2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00E0,  $0090   ; 66B6   0000 0000 00E0 0090
        DECLE   $00E0,  $00F0,  $00D0,  $00C0   ; 66BA   00E0 00F0 00D0 00C0
        DECLE   $00A0,  $0000,  $0000,  $0000   ; 66BE   00A0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66C2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 66C6   0000 0000 0000 0001
        DECLE   $0001,  $0001,  $0001,  $0000   ; 66CA   0001 0001 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66CE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66D2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00F0,  $00C8   ; 66D6   0000 0000 00F0 00C8
        DECLE   $00F0,  $00F8,  $0068,  $00E0   ; 66DA   00F0 00F8 0068 00E0
        DECLE   $0050,  $0000,  $0000,  $0000   ; 66DE   0050 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66E2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66E6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66EA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66EE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66F2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0078,  $00E4   ; 66F6   0000 0000 0078 00E4
        DECLE   $00F8,  $00FC,  $00B4,  $0070   ; 66FA   00F8 00FC 00B4 0070
        DECLE   $0028,  $0000,  $0000,  $0000   ; 66FE   0028 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6702   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0058   ; 6706   0000 0000 0000 0058
        DECLE   $00B2,  $00BC,  $00FE,  $00F4   ; 670A   00B2 00BC 00FE 00F4
        DECLE   $0078,  $0000,  $0000,  $0000   ; 670E   0078 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6712   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6716   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 671A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 671E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6722   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $002C   ; 6726   0000 0000 0000 002C
        DECLE   $0059,  $005E,  $007F,  $007A   ; 672A   0059 005E 007F 007A
        DECLE   $003C,  $0000,  $0000,  $0000   ; 672E   003C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6732   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6736   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 673A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 673E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6742   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0016   ; 6746   0000 0000 0000 0016
        DECLE   $002C,  $002F,  $003F,  $003D   ; 674A   002C 002F 003F 003D
        DECLE   $001E,  $0000,  $0000,  $0000   ; 674E   001E 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6752   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6756   0000 0000 0000 0000
        DECLE   $0080,  $0000,  $0080,  $0000   ; 675A   0080 0000 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 675E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6762   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6766   0000 0000 0000

        INCR    R3                              ; 6769   000B
        DECR    R6                              ; 676A   0016
L_676B:
        DECR    R7                              ; 676B   0017

        DECLE   $001F,  $001E,  $000F,  $0000   ; 676C   001F 001E 000F 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6770   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6774   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $0080   ; 6778   0000 0000 0040 0080
        DECLE   $00C0,  $0080,  $0000,  $0000   ; 677C   00C0 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6780   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6784   0000 0000 0000 0000
        DECLE   $0000,  $0005                   ; 6788   0000 0005

        INCR    R3                              ; 678A   000B
        INCR    R3                              ; 678B   000B
        INCR    R7                              ; 678C   000F

        DECLE   $000F                           ; 678D   000F
L_678E:
        SETC                                    ; 678E   0007
        DECLE   $0000,  $0000,  $0000,  $0000   ; 678F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6793   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0020   ; 6797   0000 0000 0080 0020
        DECLE   $00C0,  $00E0,  $0040,  $0080   ; 679B   00C0 00E0 0040 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 679F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67A3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0005   ; 67A7   0000 0000 0002 0005
        DECLE   $0005,  $0007,  $0007,  $0003   ; 67AB   0005 0007 0007 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67AF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67B3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00C0,  $0090   ; 67B7   0000 0000 00C0 0090
        DECLE   $00E0,  $00F0,  $00A0,  $00C0   ; 67BB   00E0 00F0 00A0 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67BF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67C3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0002   ; 67C7   0000 0000 0001 0002
        DECLE   $0002,  $0003,  $0003,  $0001   ; 67CB   0002 0003 0003 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67CF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67D3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0060,  $00C8   ; 67D7   0000 0000 0060 00C8
        DECLE   $00F0,  $00F8,  $00D0,  $00E0   ; 67DB   00F0 00F8 00D0 00E0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67DF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67E3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 67E7   0000 0000 0000 0001
        DECLE   $0001,  $0001,  $0001,  $0000   ; 67EB   0001 0001 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67EF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67F3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00B0,  $0064   ; 67F7   0000 0000 00B0 0064
        DECLE   $0078,  $00FC,  $00E8,  $00F0   ; 67FB   0078 00FC 00E8 00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67FF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6803   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0028,  $001C   ; 6807   0000 0000 0028 001C
        DECLE   $005A,  $007E,  $003E,  $004E   ; 680B   005A 007E 003E 004E
        DECLE   $003C,  $0000,  $0000,  $0000   ; 680F   003C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6813   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6817   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 681B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 681F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6823   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0014,  $000E   ; 6827   0000 0000 0014 000E
        DECLE   $002D,  $003F,  $001F,  $0027   ; 682B   002D 003F 001F 0027
        DECLE   $001E,  $0000,  $0000,  $0000   ; 682F   001E 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6833   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6837   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 683B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 683F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6843   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000A,  $0007   ; 6847   0000 0000 000A 0007
        DECLE   $0016,  $001F,  $000F,  $0013   ; 684B   0016 001F 000F 0013
        DECLE   $000F,  $0000,  $0000,  $0000   ; 684F   000F 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6853   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6857   0000 0000 0000 0000
        DECLE   $0080,  $0080,  $0080,  $0080   ; 685B   0080 0080 0080 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 685F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6863   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0005           ; 6867   0000 0000 0005

        DIS                                     ; 686A   0003
        INCR    R3                              ; 686B   000B
        INCR    R7                              ; 686C   000F

        SETC                                    ; 686D   0007
L_686E:
        INCR    R1                              ; 686E   0009
        DECLE   $0007,  $0000,  $0000,  $0000   ; 686F   0007 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6873   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 6877   0000 0000 0000 0080
        DECLE   $0040,  $00C0,  $00C0,  $00C0   ; 687B   0040 00C0 00C0 00C0
        DECLE   $0080,  $0000,  $0000,  $0000   ; 687F   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6883   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0001   ; 6887   0000 0000 0002 0001
        DECLE   $0005,  $0007,  $0003,  $0004   ; 688B   0005 0007 0003 0004
        DECLE   $0003,  $0000,  $0000,  $0000   ; 688F   0003 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6893   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $00C0   ; 6897   0000 0000 0080 00C0
        DECLE   $00A0,  $00E0,  $00E0,  $00E0   ; 689B   00A0 00E0 00E0 00E0
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 689F   00C0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68A3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; 68A7   0000 0000 0001 0000
        DECLE   $0002,  $0003,  $0001,  $0002   ; 68AB   0002 0003 0001 0002
        DECLE   $0001,  $0000,  $0000,  $0000   ; 68AF   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68B3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $00E0   ; 68B7   0000 0000 0040 00E0
        DECLE   $00D0,  $00F0,  $00F0,  $0070   ; 68BB   00D0 00F0 00F0 0070
        DECLE   $00E0,  $0000,  $0000,  $0000   ; 68BF   00E0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68C3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68C7   0000 0000 0000 0000
        DECLE   $0001,  $0001,  $0000,  $0001   ; 68CB   0001 0001 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68CF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68D3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00A0,  $0070   ; 68D7   0000 0000 00A0 0070
        DECLE   $0068,  $00F8,  $00F8,  $0038   ; 68DB   0068 00F8 00F8 0038
        DECLE   $00F0,  $0000,  $0000,  $0000   ; 68DF   00F0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68E3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68E7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68EB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68EF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68F3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0050,  $0038   ; 68F7   0000 0000 0050 0038
        DECLE   $00B4,  $00FC,  $007C,  $009C   ; 68FB   00B4 00FC 007C 009C
        DECLE   $0078,  $0000,  $0000,  $0000   ; 68FF   0078 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6903   0000 0000 0000 0000
        DECLE   $0000                           ; 6907   0000
L_6908:
        MOVR    R0,     R1                      ; 6908   0081
        MOVR    R0,     R4                      ; 6909   0084
        ADDI    #$0161, R1                      ; 690A   02F9 0161
        ADDI    #$0167, R4                      ; 690C   02FC 0167
        MVI@    R1,     R3                      ; 690E   028B
        SLR     R3,     2                       ; 690F   0067
        SLR     R3,     1                       ; 6910   0063
        MVI@    R4,     R2                      ; 6911   02A2
        SLR     R2,     1                       ; 6912   0062
        SLR     R2,     2                       ; 6913   0066
        PSHR    R2                              ; 6914   0272
        SLL     R2,     2                       ; 6915   004E
        ADD@    R6,     R2                      ; 6916   02F2
        SLL     R2,     2                       ; 6917   004E
        ADDR    R3,     R2                      ; 6918   00DA
        MOVR    R2,     R4                      ; 6919   0094
        ADDI    #$0200, R4                      ; 691A   02FC 0200
        MOVR    R5,     R7                      ; 691C   00AF

L_691D:
        PSHR    R5                              ; 691D   0275

        JSR     R5,     L_6908                  ; 691E   0004 0168 0108

        CLRR    R1                              ; 6921   01C9
        MVO@    R1,     R4                      ; 6922   0261
        MVO@    R1,     R4                      ; 6923   0261
        ADDI    #$0012, R4                      ; 6924   02FC 0012
        MVO@    R1,     R4                      ; 6926   0261
        MVO@    R1,     R4                      ; 6927   0261
L_6928:
        PULR    R7                              ; 6928   02B7

L_6929:
        PSHR    R5                              ; 6929   0275

        JSR     R5,     L_6908                  ; 692A   0004 0168 0108

        MOVR    R0,     R1                      ; 692D   0081
        MOVR    R0,     R5                      ; 692E   0085
        ADDI    #$01A5, R5                      ; 692F   02FD 01A5
        MVI@    R5,     R5                      ; 6931   02AD
        SLL     R1,     2                       ; 6932   004D
        SLL     R1,     2                       ; 6933   004D
        SLL     R1,     1                       ; 6934   0049
        SDBD                                    ; 6935   0001
        ADDI    #$08C1, R1                      ; 6936   02F9 00C1 0008
        ADDR    R5,     R1                      ; 6939   00E9
        MVO@    R1,     R4                      ; 693A   0261
        ADDI    #$0010, R1                      ; 693B   02F9 0010
        MVO@    R1,     R4                      ; 693D   0261
        ADDI    #$0012, R4                      ; 693E   02FC 0012
        SUBI    #$0008, R1                      ; 6940   0339 0008
        MVO@    R1,     R4                      ; 6942   0261
        ADDI    #$0010, R1                      ; 6943   02F9 0010
        MVO@    R1,     R4                      ; 6945   0261
        PULR    R7                              ; 6946   02B7

L_6947:
        PSHR    R5                              ; 6947   0275
        MOVR    R0,     R3                      ; 6948   0083
        ADDI    #$01A5, R3                      ; 6949   02FB 01A5
        MVI@    R3,     R5                      ; 694B   029D
        TSTR    R5                              ; 694C   00AD
        BEQ     L_6928                          ; 694D   0224 0026

        JSR     R5,     L_691D                  ; 694F   0004 0168 011D

        MOVR    R0,     R1                      ; 6952   0081
        MOVR    R0,     R4                      ; 6953   0084
        ADDI    #$0161, R1                      ; 6954   02F9 0161
        ADDI    #$0167, R4                      ; 6956   02FC 0167

        JSR     R5,     L_695F                  ; 6958   0004 0168 015F
        JSR     R5,     L_6929                  ; 695B   0004 0168 0129

        PULR    R7                              ; 695E   02B7

L_695F:
        PSHR    R5                              ; 695F   0275
        MVI@    R4,     R3                      ; 6960   02A3
        MVI@    R1,     R2                      ; 6961   028A
        DECR    R4                              ; 6962   0014
        MOVR    R0,     R5                      ; 6963   0085
        ADDR    R0,     R5                      ; 6964   00C5
        ADDI    #$0193, R5                      ; 6965   02FD 0193
        ADD@    R5,     R2                      ; 6967   02EA
        SUB     G_01AE, R2                      ; 6968   0302 01AE
        ANDI    #$00FF, R2                      ; 696A   03BA 00FF
        CMPI    #$00E0, R2                      ; 696C   037A 00E0
        BNC     L_6974                          ; 696E   0209 0004

        SUBI    #$0068, R2                      ; 6970   033A 0068
        B       L_697A                          ; 6972   0200 0006

L_6974:
        CMPI    #$0098, R2                      ; 6974   037A 0098
        BNC     L_697A                          ; 6976   0209 0002

        SUBI    #$0098, R2                      ; 6978   033A 0098
L_697A:
        MVO@    R2,     R1                      ; 697A   024A
        MVI@    R5,     R1                      ; 697B   02A9
        ADDR    R1,     R3                      ; 697C   00CB
        ANDI    #$00FF, R3                      ; 697D   03BB 00FF
        CMPI    #$00E0, R3                      ; 697F   037B 00E0
        BNC     L_6992                          ; 6981   0209 000F

        SUBR    R1,     R3                      ; 6983   010B
        NEGR    R1                              ; 6984   0021
        INCR    R1                              ; 6985   0009
        ANDI    #$00FF, R1                      ; 6986   03B9 00FF
        CMPI    #$0007, R1                      ; 6988   0379 0007
        BNC     L_698E                          ; 698A   0209 0002

        SUBI    #$0002, R1                      ; 698C   0339 0002
L_698E:
        DECR    R5                              ; 698E   0015
        MVO@    R1,     R5                      ; 698F   0269
        B       L_699A                          ; 6990   0200 0008

L_6992:
        CMPI    #$0038, R3                      ; 6992   037B 0038
        BNC     L_699A                          ; 6994   0209 0004

        SUBR    R1,     R3                      ; 6996   010B
        COMR    R1                              ; 6997   0019
        B       L_698E                          ; 6998   0220 000B

L_699A:
        MVO@    R3,     R4                      ; 699A   0263
        PULR    R7                              ; 699B   02B7

L_699C:
        PSHR    R5                              ; 699C   0275
        MVI     G_0158, R0                      ; 699D   0280 0158
        DECR    R0                              ; 699F   0010
        BMI     L_69AC                          ; 69A0   020B 000A

        MVO     R0,     G_0158                  ; 69A2   0240 0158
        BNEQ    L_69AC                          ; 69A4   020C 0006

        SDBD                                    ; 69A6   0001
        MVII    #$6A62, R4                      ; 69A7   02BC 0062 006A
        B       L_69D3                          ; 69AA   0200 0027

L_69AC:
        MVI     .PSG0.chn_a_lo,R0               ; 69AC   0280 01F0
        ADD     G_0159, R0                      ; 69AE   02C0 0159
        MVO     R0,     .PSG0.chn_a_lo          ; 69B0   0240 01F0
        MVI     .PSG0.chn_b_lo,R0               ; 69B2   0280 01F1
        ADD     G_015A, R0                      ; 69B4   02C0 015A
        MVO     R0,     .PSG0.chn_b_lo          ; 69B6   0240 01F1
        MVI     .PSG0.noise,R0                  ; 69B8   0280 01F9
        ADD     G_015B, R0                      ; 69BA   02C0 015B
        MVO     R0,     .PSG0.noise             ; 69BC   0240 01F9
        MVI     .PSG0.envlp_lo,R0               ; 69BE   0280 01F3
        ADD     G_015C, R0                      ; 69C0   02C0 015C
        MVO     R0,     .PSG0.envlp_lo          ; 69C2   0240 01F3
        PULR    R7                              ; 69C4   02B7

L_69C5:
        SDBD                                    ; 69C5   0001
        MVI@    R5,     R4                      ; 69C6   02AC
        PSHR    R5                              ; 69C7   0275
        MVI     .PSG0.envlp_lo,R0               ; 69C8   0280 01F3
        DECR    R0                              ; 69CA   0010
        BNEQ    L_69D3                          ; 69CB   020C 0006

        MVI     G_0158, R0                      ; 69CD   0280 0158
        CMPI    #$001E, R0                      ; 69CF   0378 001E
        BPL     L_69FD                          ; 69D1   0203 002A

L_69D3:
        MVII    #$01F0, R5                      ; 69D3   02BD 01F0
        MVI@    R4,     R0                      ; 69D5   02A0
        MVO@    R0,     R5                      ; 69D6   0268
        MVI@    R4,     R0                      ; 69D7   02A0
        MVO@    R0,     R5                      ; 69D8   0268
        MVI@    R4,     R0                      ; 69D9   02A0
        MVO@    R0,     R5                      ; 69DA   0268
        MVI@    R4,     R0                      ; 69DB   02A0
        MVO@    R0,     R5                      ; 69DC   0268
        MVI@    R4,     R0                      ; 69DD   02A0
        MVO@    R0,     R5                      ; 69DE   0268
        MVI@    R4,     R0                      ; 69DF   02A0
        MVO@    R0,     R5                      ; 69E0   0268
        MVI@    R4,     R0                      ; 69E1   02A0
        MVO@    R0,     R5                      ; 69E2   0268
        MVI@    R4,     R0                      ; 69E3   02A0
        MVO@    R0,     R5                      ; 69E4   0268
        MVI@    R4,     R0                      ; 69E5   02A0
        MVO@    R0,     R5                      ; 69E6   0268
        MVI@    R4,     R0                      ; 69E7   02A0
        MVO@    R0,     R5                      ; 69E8   0268
        MVI@    R4,     R0                      ; 69E9   02A0
        MVO@    R0,     R5                      ; 69EA   0268
        MVI@    R4,     R0                      ; 69EB   02A0
        MVO@    R0,     R5                      ; 69EC   0268
        MVI@    R4,     R0                      ; 69ED   02A0
        MVO@    R0,     R5                      ; 69EE   0268
        MVI@    R4,     R0                      ; 69EF   02A0
        MVO@    R0,     R5                      ; 69F0   0268
        MVII    #$0158, R5                      ; 69F1   02BD 0158
        MVI@    R4,     R0                      ; 69F3   02A0
        MVO@    R0,     R5                      ; 69F4   0268
        MVI@    R4,     R0                      ; 69F5   02A0
        MVO@    R0,     R5                      ; 69F6   0268
        MVI@    R4,     R0                      ; 69F7   02A0
        MVO@    R0,     R5                      ; 69F8   0268
        MVI@    R4,     R0                      ; 69F9   02A0
        MVO@    R0,     R5                      ; 69FA   0268
        MVI@    R4,     R0                      ; 69FB   02A0
        MVO@    R0,     R5                      ; 69FC   0268
L_69FD:
        PULR    R7                              ; 69FD   02B7

L_69FE:
        SDBD                                    ; 69FE   0001
        MVI@    R5,     R4                      ; 69FF   02AC
        PSHR    R5                              ; 6A00   0275
        B       L_69D3                          ; 6A01   0220 002F

        DECLE   $000A,  $0016,  $0000,  $0000   ; 6A03   000A 0016 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001C   ; 6A07   0000 0000 0000 001C
        DECLE   $001C,  $0001,  $0000,  $0030   ; 6A0B   001C 0001 0000 0030
        DECLE   $0030,  $0030,  $0028,  $0007   ; 6A0F   0030 0030 0028 0007
        DECLE   $0007,  $0001,  $0000,  $0001   ; 6A13   0007 0001 0000 0001
        DECLE   $0003,  $0000,  $0001,  $000A   ; 6A17   0003 0000 0001 000A
        DECLE   $0002,  $0000,  $0028,  $000F   ; 6A1B   0002 0000 0028 000F
        DECLE   $000A,  $0000,  $0030,  $0030   ; 6A1F   000A 0000 0030 0030
        DECLE   $0030,  $0028,  $0000,  $0004   ; 6A23   0030 0028 0000 0004
        DECLE   $0007,  $0000,  $0000,  $0000   ; 6A27   0007 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000F   ; 6A2B   0000 0000 0000 000F
        DECLE   $0000,  $0012,  $000D,  $000A   ; 6A2F   0000 0012 000D 000A
        DECLE   $0000,  $0030,  $0030,  $0030   ; 6A33   0000 0030 0030 0030
        DECLE   $000E,  $0000,  $0000,  $001F   ; 6A37   000E 0000 0000 001F
        DECLE   $0000,  $0001,  $000A,  $0000   ; 6A3B   0000 0001 000A 0000
        DECLE   $0000,  $0001,  $0000,  $0000   ; 6A3F   0000 0001 0000 0000

        RSWD    R4                              ; 6A43   003C
        INCR    R4                              ; 6A44   000C
        INCR    R7                              ; 6A45   000F

        DECLE   $0000                           ; 6A46   0000
L_6A47:
        GSWD    R0                              ; 6A47   0030
        DECLE   $0030,  $0030,  $0000,  $003C   ; 6A48   0030 0030 0000 003C
        DECLE   $0001,  $0004,  $0000,  $0001   ; 6A4C   0001 0004 0000 0001
        DECLE   $0002,  $0003,  $000A,  $0000   ; 6A50   0002 0003 000A 0000
        DECLE   $0000,  $0000,  $0000,  $0038   ; 6A54   0000 0000 0000 0038
        DECLE   $0000,  $000E,  $0030,  $0030   ; 6A58   0000 000E 0030 0030
        DECLE   $0030,  $0096,  $0001,  $0001   ; 6A5C   0030 0096 0001 0001
        DECLE   $0000,  $0002,  $00E6,  $00DC   ; 6A60   0000 0002 00E6 00DC
        DECLE   $00EB,  $0000,  $0004,  $0004   ; 6A64   00EB 0000 0004 0004
        DECLE   $0004,  $0008,  $0038,  $0000   ; 6A68   0004 0008 0038 0000
        DECLE   $000E,  $000C,  $000B,  $000B   ; 6A6C   000E 000C 000B 000B
        DECLE   $0000,  $00EB,  $00EB,  $0000   ; 6A70   0000 00EB 00EB 0000
        DECLE   $0000,  $0001,  $0005,  $0000   ; 6A74   0000 0001 0005 0000
        DECLE   $0000,  $0002,  $0003,  $0000   ; 6A78   0000 0002 0003 0000
        DECLE   $0030,  $001C,  $0001,  $0000   ; 6A7C   0030 001C 0001 0000
        DECLE   $0030,  $0030,  $0030,  $0032   ; 6A80   0030 0030 0030 0032
        DECLE   $003C,  $0028,  $0005,  $0000   ; 6A84   003C 0028 0005 0000
        DECLE   $0014,  $0015,  $0016,  $0004   ; 6A88   0014 0015 0016 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A8C   0000 0000 0000 0000
        DECLE   $0038,  $0000,  $000C,  $0030   ; 6A90   0038 0000 000C 0030
        DECLE   $0030,  $0030,  $001E,  $0004   ; 6A94   0030 0030 001E 0004
        DECLE   $0004,  $0000,  $0004,  $00FF   ; 6A98   0004 0000 0004 00FF
        DECLE   $00FA,  $0000,  $0001,  $0001   ; 6A9C   00FA 0000 0001 0001
        DECLE   $0001,  $0001,  $0000,  $003C   ; 6AA0   0001 0001 0000 003C
        DECLE   $0000,  $0000,  $000F,  $000F   ; 6AA4   0000 0000 000F 000F
        DECLE   $0000,  $0037,  $00C9,  $00C9   ; 6AA8   0000 0037 00C9 00C9
        DECLE   $0000,  $0000,  $00AC,  $00AD   ; 6AAC   0000 0000 00AC 00AD
        DECLE   $00AE,  $006C,  $0001,  $0001   ; 6AB0   00AE 006C 0001 0001
        DECLE   $0006,  $0000,  $0031,  $001E   ; 6AB4   0006 0000 0031 001E
        DECLE   $000E,  $000C,  $0030,  $0030   ; 6AB8   000E 000C 0030 0030
        DECLE   $0000,  $00FD,  $00FD,  $001F   ; 6ABC   0000 00FD 00FD 001F
        DECLE   $0000                           ; 6AC0   0000
L_6AC1:
        PSHR    R5                              ; 6AC1   0275
        MVII    #$0021, R0                      ; 6AC2   02B8 0021
        CLRR    R1                              ; 6AC4   01C9
        CLRR    R4                              ; 6AC5   01E4
L_6AC6:
        MVO@    R1,     R4                      ; 6AC6   0261
        DECR    R0                              ; 6AC7   0010
        BNEQ    L_6AC6                          ; 6AC8   022C 0003

        JSR     R5,     L_699C                  ; 6ACA   0004 0168 019C

        PULR    R7                              ; 6ACD   02B7

        MVII    #$0021, R0                      ; 6ACE   02B8 0021
        CLRR    R1                              ; 6AD0   01C9
        CLRR    R4                              ; 6AD1   01E4
L_6AD2:
        MVO@    R1,     R4                      ; 6AD2   0261
        DECR    R0                              ; 6AD3   0010
        BNEQ    L_6AD2                          ; 6AD4   022C 0003

        MVII    #$003F, R0                      ; 6AD6   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 6AD8   0240 01F8
        MOVR    R5,     R7                      ; 6ADA   00AF

L_6ADB:
        JSR     R5,     L_DD24                  ; 6ADB   0004 01DC 0124
        JSR     R5,     L_6AC1                  ; 6ADE   0004 0168 02C1

        MVII    #$00C1, R0                      ; 6AE1   02B8 00C1
        MVII    #$006A, R1                      ; 6AE3   02B9 006A
        MVO     R0,     .ISRVEC.0               ; 6AE5   0240 0100
        MVO     R1,     .ISRVEC.1               ; 6AE7   0241 0101
        MVI     G_015D, R0                      ; 6AE9   0280 015D
        DECR    R0                              ; 6AEB   0010
        MVO     R0,     G_015D                  ; 6AEC   0240 015D
        BPL     L_6B71                          ; 6AEE   0203 0081

        SLL     R0,     2                       ; 6AF0   004C
        SLL     R0,     1                       ; 6AF1   0048
        ADDI    #$0083, R0                      ; 6AF2   02F8 0083
        MVO     R0,     .BTAB.DC                ; 6AF4   0240 02DC

        JSR     R5,     L_6BD5                  ; 6AF6   0004 0168 03D5
        DECLE   $0000                           ; 6AF9   0000

        B       L_6B16                          ; 6AFA   0200 001A

L_6AFC:
        JSR     R5,     L_DD24                  ; 6AFC   0004 01DC 0124
        JSR     R5,     L_6AC1                  ; 6AFF   0004 0168 02C1

        MVII    #$00C1, R0                      ; 6B02   02B8 00C1
        MVII    #$006A, R1                      ; 6B04   02B9 006A
        MVO     R0,     .ISRVEC.0               ; 6B06   0240 0100
        MVO     R1,     .ISRVEC.1               ; 6B08   0241 0101

        JSR     R5,     L_6BD5                  ; 6B0A   0004 0168 03D5
        DECLE   $0001                           ; 6B0D   0001
L_6B0E:
        MVII    #$00C1, R0                      ; 6B0E   02B8 00C1
        MVII    #$006A, R1                      ; 6B10   02B9 006A
        MVO     R0,     .ISRVEC.0               ; 6B12   0240 0100
        MVO     R1,     .ISRVEC.1               ; 6B14   0241 0101
L_6B16:
        MVII    #$0001, R0                      ; 6B16   02B8 0001
        MVO     R0,     G_011F                  ; 6B18   0240 011F
L_6B1A:
        MVII    #$0007, R3                      ; 6B1A   02BB 0007
        MVII    #$0204, R4                      ; 6B1C   02BC 0204

        JSR     R5,     X_PRINT_R5              ; 6B1E   0004 0118 007B
        STRING  "Game Over           "          ; 6B21  
        STRING  "                "              ; 6B35  
        DECLE   $0000                           ; 6B45   0000

        MVII    #$00CE, R0                      ; 6B46   02B8 00CE
        MVII    #$006A, R1                      ; 6B48   02B9 006A
        MVO     R0,     .ISRVEC.0               ; 6B4A   0240 0100
        MVO     R1,     .ISRVEC.1               ; 6B4C   0241 0101
        MVII    #$011D, R4                      ; 6B4E   02BC 011D
        MOVR    R4,     R5                      ; 6B50   00A5
        SDBD                                    ; 6B51   0001
        MVI@    R4,     R0                      ; 6B52   02A0
        MVI     .PSG0.lft_hand,R1               ; 6B53   0281 01FF
        AND     .PSG0.rgt_hand,R1               ; 6B55   0381 01FE
        CMPI    #$00FF, R1                      ; 6B57   0379 00FF
        BEQ     L_6B5E                          ; 6B59   0204 0003
        J       L_D26B                          ; 6B5B   0004 03D0 026B

L_6B5E:
        DECR    R0                              ; 6B5E   0010
        MVO@    R0,     R5                      ; 6B5F   0268
        SWAP    R0,     1                       ; 6B60   0040
        MVO@    R0,     R5                      ; 6B61   0268
        BNEQ    L_6B1A                          ; 6B62   022C 0049

        MOVR    R5,     R4                      ; 6B64   00AC
        MVI@    R5,     R0                      ; 6B65   02A8
        DECR    R0                              ; 6B66   0010
        MVO@    R0,     R4                      ; 6B67   0260
        BNEQ    L_6B1A                          ; 6B68   022C 004F

        MVII    #$005A, R0                      ; 6B6A   02B8 005A

        JSR     R5,     L_6044                  ; 6B6C   0004 0160 0044

        B       L_6B16                          ; 6B6F   0220 005A

L_6B71:
        JSR     R5,     L_6BD5                  ; 6B71   0004 0168 03D5
        DECLE   $0002                           ; 6B74   0002

        MVII    #$02F1, R6                      ; 6B75   02BE 02F1
        SDBD                                    ; 6B77   0001
        MVII    #$8000, R0                      ; 6B78   02B8 0000 0080
L_6B7B:
        DECR    R0                              ; 6B7B   0010
        BNEQ    L_6B7B                          ; 6B7C   022C 0002

        CLRR    R0                              ; 6B7E   01C0
        MVO     R0,     G_01BC                  ; 6B7F   0240 01BC
        J       L_510F                          ; 6B81   0004 0350 010F

L_6B84:
        JSR     R5,     L_DD24                  ; 6B84   0004 01DC 0124
        JSR     R5,     L_6AC1                  ; 6B87   0004 0168 02C1

        MVII    #$00C1, R0                      ; 6B8A   02B8 00C1
        MVII    #$006A, R1                      ; 6B8C   02B9 006A
        MVO     R0,     .ISRVEC.0               ; 6B8E   0240 0100
        MVO     R1,     .ISRVEC.1               ; 6B90   0241 0101

        JSR     R5,     L_6BD5                  ; 6B92   0004 0168 03D5
        DECLE   $0003                           ; 6B95   0003

        JSR     R5,     .EXEC.60A               ; 6B96   0004 0114 020A

        J       L_D4CF                          ; 6B99   0004 03D4 00CF

L_6B9C:
        PSHR    R5                              ; 6B9C   0275
        MVI     G_01B8, R1                      ; 6B9D   0281 01B8
        ADDR    R1,     R1                      ; 6B9F   00C9
        SDBD                                    ; 6BA0   0001
        ADDI    #$5B9A, R1                      ; 6BA1   02F9 009A 005B
        MVI@    R1,     R0                      ; 6BA4   0288
        ADDI    #$0007, R0                      ; 6BA5   02F8 0007
        MVO     R0,     .BTAB.DF                ; 6BA7   0240 02DF
        INCR    R1                              ; 6BA9   0009
        MVI@    R1,     R0                      ; 6BAA   0288
        ADDI    #$0007, R0                      ; 6BAB   02F8 0007
        MVO     R0,     .BTAB.E0                ; 6BAD   0240 02E0
        MVI     G_01B7, R1                      ; 6BAF   0281 01B7
        ADDR    R1,     R1                      ; 6BB1   00C9
        SDBD                                    ; 6BB2   0001
        ADDI    #$5B9A, R1                      ; 6BB3   02F9 009A 005B
        MVI@    R1,     R0                      ; 6BB6   0288
        ADDI    #$0003, R0                      ; 6BB7   02F8 0003
        MVO     R0,     .BTAB.E3                ; 6BB9   0240 02E3
        INCR    R1                              ; 6BBB   0009
        MVI@    R1,     R0                      ; 6BBC   0288
        ADDI    #$0003, R0                      ; 6BBD   02F8 0003
        MVO     R0,     .BTAB.E4                ; 6BBF   0240 02E4
        MVI     G_015D, R0                      ; 6BC1   0280 015D
        CMPI    #$00FF, R0                      ; 6BC3   0378 00FF
        BNEQ    L_6BC8                          ; 6BC5   020C 0001

        CLRR    R0                              ; 6BC7   01C0
L_6BC8:
        CMPI    #$0009, R0                      ; 6BC8   0378 0009
        BNC     L_6BCE                          ; 6BCA   0209 0002

        MVII    #$0009, R0                      ; 6BCC   02B8 0009
L_6BCE:
        SLL     R0,     2                       ; 6BCE   004C
        SLL     R0,     1                       ; 6BCF   0048
        ADDI    #$0083, R0                      ; 6BD0   02F8 0083
        MVO     R0,     .BTAB.DC                ; 6BD2   0240 02DC
        PULR    R7                              ; 6BD4   02B7

L_6BD5:
        MVI@    R5,     R2                      ; 6BD5   02AA
        PSHR    R5                              ; 6BD6   0275
        MVO     R2,     G_01AE                  ; 6BD7   0242 01AE

        JSR     R5,     L_6B9C                  ; 6BD9   0004 0168 039C
        JSR     R5,     L_F92F                  ; 6BDC   0004 01F8 012F
        JSR     R5,     L_6D44                  ; 6BDF   0004 016C 0144
        JSR     R5,     L_DD24                  ; 6BE2   0004 01DC 0124

        MVO     R0,     .STIC.VIDEN             ; 6BE5   0240 0020

        JSR     R5,     L_509E                  ; 6BE7   0004 0150 009E

        MVI     .STIC.X.0,R0                    ; 6BEA   0280 0000
        SUBI    #$0050, R0                      ; 6BEC   0338 0050
        MVO     R0,     .STIC.X.0               ; 6BEE   0240 0000
        MVI     .STIC.X.1,R0                    ; 6BF0   0280 0001
        SUBI    #$0050, R0                      ; 6BF2   0338 0050
        MVO     R0,     .STIC.X.1               ; 6BF4   0240 0001
        MVI     .STIC.X.2,R0                    ; 6BF6   0280 0002
        SUBI    #$0050, R0                      ; 6BF8   0338 0050
        MVO     R0,     .STIC.X.2               ; 6BFA   0240 0002
        MVI     .STIC.X.3,R0                    ; 6BFC   0280 0003
        SUBI    #$0050, R0                      ; 6BFE   0338 0050
        MVO     R0,     .STIC.X.3               ; 6C00   0240 0003
        MVI     .STIC.Y.0,R0                    ; 6C02   0280 0008
        SUBI    #$0028, R0                      ; 6C04   0338 0028
        MVO     R0,     .STIC.Y.0               ; 6C06   0240 0008
        MVI     .STIC.Y.1,R0                    ; 6C08   0280 0009
        SUBI    #$0028, R0                      ; 6C0A   0338 0028
        MVO     R0,     .STIC.Y.1               ; 6C0C   0240 0009
        MVI     .STIC.Y.2,R0                    ; 6C0E   0280 000A
        SUBI    #$0028, R0                      ; 6C10   0338 0028
        MVO     R0,     .STIC.Y.2               ; 6C12   0240 000A
        MVI     .STIC.Y.3,R0                    ; 6C14   0280 000B
        SUBI    #$0028, R0                      ; 6C16   0338 0028
        MVO     R0,     .STIC.Y.3               ; 6C18   0240 000B
        MVI     .STIC.X.3,R0                    ; 6C1A   0280 0003
        ADDI    #$0200, R0                      ; 6C1C   02F8 0200
        MVO     R0,     .STIC.X.3               ; 6C1E   0240 0003
        MVO     R0,     .STIC.X.2               ; 6C20   0240 0002

        JSR     R5,     L_DD24                  ; 6C22   0004 01DC 0124

        MVO     R0,     .STIC.VIDEN             ; 6C25   0240 0020

        JSR     R5,     L_508D                  ; 6C27   0004 0150 008D

        MVII    #$0001, R2                      ; 6C2A   02BA 0001
        SDBD                                    ; 6C2C   0001
        MVII    #$5014, R0                      ; 6C2D   02B8 0014 0050
        MVO     R0,     G_0339                  ; 6C30   0240 0339
        MVII    #$0028, R3                      ; 6C32   02BB 0028
L_6C34:
        DECR    R2                              ; 6C34   0012
        BNEQ    L_6C3F                          ; 6C35   020C 0008

        MVII    #$0010, R2                      ; 6C37   02BA 0010
        MVI     G_0339, R1                      ; 6C39   0281 0339
        XORI    #$0030, R1                      ; 6C3B   03F9 0030
        MVO     R1,     G_0339                  ; 6C3D   0241 0339

L_6C3F:
        JSR     R5,     L_DD24                  ; 6C3F   0004 01DC 0124

        MVO     R0,     .STIC.VIDEN             ; 6C42   0240 0020
        MVII    #$0010, R0                      ; 6C44   02B8 0010
        MVI     G_0339, R4                      ; 6C46   0284 0339
        SDBD                                    ; 6C48   0001
        MVII    #$39F0, R5                      ; 6C49   02BD 00F0 0039
L_6C4C:
        MVI@    R4,     R1                      ; 6C4C   02A1
        MVO@    R1,     R5                      ; 6C4D   0269
        DECR    R0                              ; 6C4E   0010
        BNEQ    L_6C4C                          ; 6C4F   022C 0004

        MVI     .STIC.X.0,R0                    ; 6C51   0280 0000
        ADDI    #$0002, R0                      ; 6C53   02F8 0002
        MVO     R0,     .STIC.X.0               ; 6C55   0240 0000
        MVI     .STIC.X.1,R0                    ; 6C57   0280 0001
        INCR    R0                              ; 6C59   0008
        INCR    R0                              ; 6C5A   0008
        MVO     R0,     .STIC.X.1               ; 6C5B   0240 0001
        MVI     .STIC.X.2,R0                    ; 6C5D   0280 0002
        INCR    R0                              ; 6C5F   0008
        INCR    R0                              ; 6C60   0008
        MVO     R0,     .STIC.X.2               ; 6C61   0240 0002
        MVI     .STIC.X.3,R0                    ; 6C63   0280 0003
        INCR    R0                              ; 6C65   0008
        INCR    R0                              ; 6C66   0008
        MVO     R0,     .STIC.X.3               ; 6C67   0240 0003
        MVI     .STIC.Y.3,R0                    ; 6C69   0280 000B
        INCR    R0                              ; 6C6B   0008
        MVO     R0,     .STIC.Y.3               ; 6C6C   0240 000B
        MVI     .STIC.Y.2,R0                    ; 6C6E   0280 000A
        INCR    R0                              ; 6C70   0008
        MVO     R0,     .STIC.Y.2               ; 6C71   0240 000A
        MVI     .STIC.Y.1,R0                    ; 6C73   0280 0009
        INCR    R0                              ; 6C75   0008
        MVO     R0,     .STIC.Y.1               ; 6C76   0240 0009
        MVI     .STIC.Y.0,R0                    ; 6C78   0280 0008
        INCR    R0                              ; 6C7A   0008
        MVO     R0,     .STIC.Y.0               ; 6C7B   0240 0008
        PSHR    R2                              ; 6C7D   0272
        PSHR    R3                              ; 6C7E   0273

        JSR     R5,     L_699C                  ; 6C7F   0004 0168 019C
        JSR     R5,     L_6040                  ; 6C82   0004 0160 0040

        PULR    R3                              ; 6C85   02B3
        PULR    R2                              ; 6C86   02B2
        DECR    R3                              ; 6C87   0013
        BNEQ    L_6C34                          ; 6C88   022C 0055

        MVII    #$0190, R3                      ; 6C8A   02BB 0190

L_6C8C:
        JSR     R5,     L_DD24                  ; 6C8C   0004 01DC 0124

        MVO     R0,     .STIC.VIDEN             ; 6C8F   0240 0020
        CMPI    #$0136, R3                      ; 6C91   037B 0136
        BNEQ    L_6C9C                          ; 6C93   020C 0007

        PSHR    R3                              ; 6C95   0273
        PSHR    R2                              ; 6C96   0272

        JSR     R5,     L_6D60                  ; 6C97   0004 016C 0160

        PULR    R2                              ; 6C9A   02B2
        PULR    R3                              ; 6C9B   02B3
L_6C9C:
        CMPI    #$00B4, R3                      ; 6C9C   037B 00B4
        BNEQ    L_6CA7                          ; 6C9E   020C 0007

        PSHR    R3                              ; 6CA0   0273
        PSHR    R2                              ; 6CA1   0272

        JSR     R5,     L_6DC6                  ; 6CA2   0004 016C 01C6

        PULR    R2                              ; 6CA5   02B2
        PULR    R3                              ; 6CA6   02B3
L_6CA7:
        CMPI    #$0032, R3                      ; 6CA7   037B 0032
        BNEQ    L_6CB2                          ; 6CA9   020C 0007

        PSHR    R3                              ; 6CAB   0273
        PSHR    R2                              ; 6CAC   0272

        JSR     R5,     L_6E2D                  ; 6CAD   0004 016C 022D

        PULR    R2                              ; 6CB0   02B2
        PULR    R3                              ; 6CB1   02B3
L_6CB2:
        PSHR    R2                              ; 6CB2   0272
        PSHR    R3                              ; 6CB3   0273

        JSR     R5,     L_699C                  ; 6CB4   0004 0168 019C
        JSR     R5,     L_6040                  ; 6CB7   0004 0160 0040

        PULR    R3                              ; 6CBA   02B3
        PULR    R2                              ; 6CBB   02B2
        DECR    R3                              ; 6CBC   0013
        BNEQ    L_6C8C                          ; 6CBD   022C 0032

        JSR     R5,     L_DD24                  ; 6CBF   0004 01DC 0124

        CLRR    R0                              ; 6CC2   01C0
        MVO     R0,     .STIC.X.2               ; 6CC3   0240 0002
        MVO     R0,     .STIC.X.3               ; 6CC5   0240 0003
        MVII    #$0255, R0                      ; 6CC7   02B8 0255
        MVO     R0,     .STIC.X.4               ; 6CC9   0240 0004
        MVO     R0,     .STIC.X.5               ; 6CCB   0240 0005
        MVO     R0,     .STIC.VIDEN             ; 6CCD   0240 0020
        MVII    #$0001, R2                      ; 6CCF   02BA 0001
        SDBD                                    ; 6CD1   0001
        MVII    #$5DD9, R0                      ; 6CD2   02B8 00D9 005D
        MVO     R0,     G_0339                  ; 6CD5   0240 0339
        SDBD                                    ; 6CD7   0001
        MVII    #$5EA9, R0                      ; 6CD8   02B8 00A9 005E
        MVO     R0,     G_033A                  ; 6CDB   0240 033A
        MVII    #$0050, R3                      ; 6CDD   02BB 0050
L_6CDF:
        DECR    R2                              ; 6CDF   0012
        BNEQ    L_6CFE                          ; 6CE0   020C 001C

        MVII    #$0002, R2                      ; 6CE2   02BA 0002
        MVI     G_033A, R1                      ; 6CE4   0281 033A
        ADDI    #$0010, R1                      ; 6CE6   02F9 0010
        MVI     G_0339, R0                      ; 6CE8   0280 0339
        ADDI    #$0010, R0                      ; 6CEA   02F8 0010
        SDBD                                    ; 6CEC   0001
        CMPI    #$5E99, R0                      ; 6CED   0378 0099 005E
        BNEQ    L_6CFA                          ; 6CF0   020C 0008

        SDBD                                    ; 6CF2   0001
        MVII    #$5EA9, R1                      ; 6CF3   02B9 00A9 005E
        SDBD                                    ; 6CF6   0001
        MVII    #$5DD9, R0                      ; 6CF7   02B8 00D9 005D
L_6CFA:
        MVO     R0,     G_0339                  ; 6CFA   0240 0339
        MVO     R1,     G_033A                  ; 6CFC   0241 033A

L_6CFE:
        JSR     R5,     L_DD24                  ; 6CFE   0004 01DC 0124

        MVO     R0,     .STIC.VIDEN             ; 6D01   0240 0020
        PSHR    R3                              ; 6D03   0273
        SUBI    #$0040, R3                      ; 6D04   033B 0040
        BNC     L_6D11                          ; 6D06   0209 0009

        SDBD                                    ; 6D08   0001
        ADDI    #$503C, R3                      ; 6D09   02FB 003C 0050
        MVI@    R3,     R0                      ; 6D0C   0298
        MVO     R0,     .STIC.Y.4               ; 6D0D   0240 000C
        MVO     R0,     .STIC.Y.5               ; 6D0F   0240 000D
L_6D11:
        PULR    R3                              ; 6D11   02B3
        MVII    #$0010, R0                      ; 6D12   02B8 0010
        MVI     G_0339, R4                      ; 6D14   0284 0339
        SDBD                                    ; 6D16   0001
        MVII    #$39E0, R5                      ; 6D17   02BD 00E0 0039
L_6D1A:
        MVI@    R4,     R1                      ; 6D1A   02A1
        MVO@    R1,     R5                      ; 6D1B   0269
        DECR    R0                              ; 6D1C   0010
        BNEQ    L_6D1A                          ; 6D1D   022C 0004

        MVII    #$0010, R0                      ; 6D1F   02B8 0010
        MVI     G_033A, R4                      ; 6D21   0284 033A
        SDBD                                    ; 6D23   0001
        MVII    #$39D0, R5                      ; 6D24   02BD 00D0 0039
L_6D27:
        MVI@    R4,     R1                      ; 6D27   02A1
        MVO@    R1,     R5                      ; 6D28   0269
        DECR    R0                              ; 6D29   0010
        BNEQ    L_6D27                          ; 6D2A   022C 0004

        MVI     .STIC.X.4,R0                    ; 6D2C   0280 0004
        INCR    R0                              ; 6D2E   0008
        MVO     R0,     .STIC.X.4               ; 6D2F   0240 0004
        MVI     .STIC.X.5,R0                    ; 6D31   0280 0005
        INCR    R0                              ; 6D33   0008
        MVO     R0,     .STIC.X.5               ; 6D34   0240 0005
        PSHR    R2                              ; 6D36   0272
        PSHR    R3                              ; 6D37   0273

        JSR     R5,     L_699C                  ; 6D38   0004 0168 019C
        JSR     R5,     L_6040                  ; 6D3B   0004 0160 0040

        PULR    R3                              ; 6D3E   02B3
        PULR    R2                              ; 6D3F   02B2
        DECR    R3                              ; 6D40   0013
        BNEQ    L_6CDF                          ; 6D41   022C 0063
        PULR    R7                              ; 6D43   02B7

L_6D44:
        PSHR    R5                              ; 6D44   0275
        MVII    #$0247, R4                      ; 6D45   02BC 0247
        MVII    #$0007, R3                      ; 6D47   02BB 0007
        MVII    #$0004, R1                      ; 6D49   02B9 0004
        MVI     G_035C, R0                      ; 6D4B   0280 035C

        JSR     R5,     X_PRNUM_RGT             ; 6D4D   0004 0118 00C5

        MVII    #$024B, R4                      ; 6D50   02BC 024B
        MVII    #$0007, R3                      ; 6D52   02BB 0007
        MVII    #$0004, R1                      ; 6D54   02B9 0004
        MVI     G_035B, R0                      ; 6D56   0280 035B

        JSR     R5,     X_PRNUM_ZRO             ; 6D58   0004 0118 00AD

        MVII    #$0087, R0                      ; 6D5B   02B8 0087
        MVO     R0,     .BTAB.4F                ; 6D5D   0240 024F
        PULR    R7                              ; 6D5F   02B7

L_6D60:
        PSHR    R5                              ; 6D60   0275
        CLRR    R0                              ; 6D61   01C0
        MVO     R0,     .BTAB.EC                ; 6D62   0240 02EC
        MVO     R0,     .BTAB.EA                ; 6D64   0240 02EA
        MVO     R0,     .BTAB.EB                ; 6D66   0240 02EB
        MVII    #$0002, R3                      ; 6D68   02BB 0002
        MVII    #$0204, R4                      ; 6D6A   02BC 0204

        JSR     R5,     X_PRINT_R5              ; 6D6C   0004 0118 007B
        STRING  "Fireballs hit"                 ; 6D6F  
        DECLE   $0000                           ; 6D7C   0000

        MVII    #$0219, R4                      ; 6D7D   02BC 0219
        MVII    #$0002, R3                      ; 6D7F   02BB 0002
        MVII    #$0003, R1                      ; 6D81   02B9 0003
        MVI     G_01B0, R0                      ; 6D83   0280 01B0

        JSR     R5,     X_PRNUM_RGT             ; 6D85   0004 0118 00C5

        MVII    #$021C, R4                      ; 6D88   02BC 021C
        MVII    #$0002, R3                      ; 6D8A   02BB 0002

        JSR     R5,     X_PRINT_R5              ; 6D8C   0004 0118 007B
        STRING  "x 500="                        ; 6D8F  
        DECLE   $0000                           ; 6D95   0000

        MVII    #$0223, R4                      ; 6D96   02BC 0223
        MVII    #$0002, R3                      ; 6D98   02BB 0002
        MVII    #$0004, R1                      ; 6D9A   02B9 0004
        MVI     G_01B0, R0                      ; 6D9C   0280 01B0
        SLL     R0,     1                       ; 6D9E   0048
        PSHR    R0                              ; 6D9F   0270
        SLL     R0,     2                       ; 6DA0   004C
        SLL     R0,     1                       ; 6DA1   0048
        PSHR    R0                              ; 6DA2   0270
        SLL     R0,     1                       ; 6DA3   0048
        ADD@    R6,     R0                      ; 6DA4   02F0
        ADD@    R6,     R0                      ; 6DA5   02F0
        PSHR    R0                              ; 6DA6   0270

        JSR     R5,     X_PRNUM_RGT             ; 6DA7   0004 0118 00C5

        PULR    R0                              ; 6DAA   02B0
        MVII    #$0082, R1                      ; 6DAB   02B9 0082
        MVO     R1,     .BTAB.27                ; 6DAD   0241 0227
        MVI     G_035C, R1                      ; 6DAF   0281 035C
        ADD     G_035B, R0                      ; 6DB1   02C0 035B
        SDBD                                    ; 6DB3   0001
        CMPI    #$2710, R0                      ; 6DB4   0378 0010 0027
        BNC     L_6DBE                          ; 6DB7   0209 0005

        INCR    R1                              ; 6DB9   0009
        SDBD                                    ; 6DBA   0001
        SUBI    #$2710, R0                      ; 6DBB   0338 0010 0027
L_6DBE:
        MVO     R1,     G_035C                  ; 6DBE   0241 035C
        MVO     R0,     G_035B                  ; 6DC0   0240 035B

        JSR     R5,     L_6D44                  ; 6DC2   0004 016C 0144

        PULR    R7                              ; 6DC5   02B7

L_6DC6:
        PSHR    R5                              ; 6DC6   0275
        CLRR    R0                              ; 6DC7   01C0
        MVO     R0,     .BTAB.EF                ; 6DC8   0240 02EF
        MVO     R0,     .BTAB.EE                ; 6DCA   0240 02EE
        MVII    #$0001, R3                      ; 6DCC   02BB 0001
        MVII    #$0204, R4                      ; 6DCE   02BC 0204

        JSR     R5,     X_PRINT_R5              ; 6DD0   0004 0118 007B
        STRING  "Skeletor Caught"               ; 6DD3  
        DECLE   $0000                           ; 6DE2   0000

        MVII    #$0219, R4                      ; 6DE3   02BC 0219
        MVII    #$0001, R3                      ; 6DE5   02BB 0001
        MVI     G_01AF, R0                      ; 6DE7   0280 01AF
        MVII    #$0003, R1                      ; 6DE9   02B9 0003

        JSR     R5,     X_PRNUM_RGT             ; 6DEB   0004 0118 00C5

        MVII    #$021C, R4                      ; 6DEE   02BC 021C
        MVII    #$0001, R3                      ; 6DF0   02BB 0001

        JSR     R5,     X_PRINT_R5              ; 6DF2   0004 0118 007B
        STRING  "x1000="                        ; 6DF5  
        DECLE   $0000                           ; 6DFB   0000

        MVII    #$0223, R4                      ; 6DFC   02BC 0223
        MVII    #$0001, R3                      ; 6DFE   02BB 0001
        MVII    #$0004, R1                      ; 6E00   02B9 0004
        MVI     G_01AF, R0                      ; 6E02   0280 01AF
        SLL     R0,     1                       ; 6E04   0048
        SLL     R0,     1                       ; 6E05   0048
        PSHR    R0                              ; 6E06   0270
        SLL     R0,     2                       ; 6E07   004C
        SLL     R0,     1                       ; 6E08   0048
        PSHR    R0                              ; 6E09   0270
        SLL     R0,     1                       ; 6E0A   0048
        ADD@    R6,     R0                      ; 6E0B   02F0
        ADD@    R6,     R0                      ; 6E0C   02F0
        PSHR    R0                              ; 6E0D   0270

        JSR     R5,     X_PRNUM_RGT             ; 6E0E   0004 0118 00C5

        PULR    R0                              ; 6E11   02B0
        MVII    #$0081, R1                      ; 6E12   02B9 0081
        MVO     R1,     .BTAB.27                ; 6E14   0241 0227
        MVI     G_035C, R1                      ; 6E16   0281 035C
        ADD     G_035B, R0                      ; 6E18   02C0 035B
        SDBD                                    ; 6E1A   0001
        CMPI    #$2710, R0                      ; 6E1B   0378 0010 0027
        BNC     L_6E25                          ; 6E1E   0209 0005

        INCR    R1                              ; 6E20   0009
        SDBD                                    ; 6E21   0001
        SUBI    #$2710, R0                      ; 6E22   0338 0010 0027
L_6E25:
        MVO     R1,     G_035C                  ; 6E25   0241 035C
        MVO     R0,     G_035B                  ; 6E27   0240 035B

        JSR     R5,     L_6D44                  ; 6E29   0004 016C 0144

        PULR    R7                              ; 6E2C   02B7

L_6E2D:
        PSHR    R5                              ; 6E2D   0275
        CLRR    R0                              ; 6E2E   01C0
        MVO     R0,     .BTAB.E3                ; 6E2F   0240 02E3
        MVO     R0,     .BTAB.E4                ; 6E31   0240 02E4
        MVO     R0,     .BTAB.E5                ; 6E33   0240 02E5
        MVO     R0,     .BTAB.E6                ; 6E35   0240 02E6
        MVII    #$0204, R4                      ; 6E37   02BC 0204
        MVII    #$0003, R3                      ; 6E39   02BB 0003
        MVI     G_01AE, R0                      ; 6E3B   0280 01AE
        CMPI    #$0003, R0                      ; 6E3D   0378 0003
        BEQ     L_6E73                          ; 6E3F   0204 0032

        CMPI    #$0001, R0                      ; 6E41   0378 0001
        BEQ     L_6EE6                          ; 6E43   0204 00A1

        JSR     R5,     X_PRINT_R5              ; 6E45   0004 0118 007B
        STRING  "not enough fuel     "          ; 6E48  
        STRING  "                    "          ; 6E5C  
        DECLE   $0000                           ; 6E70   0000

        B       L_6EE6                          ; 6E71   0200 0073

L_6E73:
        JSR     R5,     X_PRINT_R5              ; 6E73   0004 0118 007B
        STRING  "Fuel Bonus     "               ; 6E76  
        DECLE   $0000                           ; 6E85   0000

        MVII    #$021A, R4                      ; 6E86   02BC 021A
        MVII    #$0003, R3                      ; 6E88   02BB 0003
        MVII    #$0002, R1                      ; 6E8A   02B9 0002
        MVI     G_01B7, R0                      ; 6E8C   0280 01B7

        JSR     R5,     X_PRNUM_RGT             ; 6E8E   0004 0118 00C5

        MVII    #$021C, R4                      ; 6E91   02BC 021C
        MVII    #$0003, R3                      ; 6E93   02BB 0003

        JSR     R5,     X_PRINT_R5              ; 6E95   0004 0118 007B
        STRING  "x1000="                        ; 6E98  
        DECLE   $0000                           ; 6E9E   0000

        MVII    #$0223, R4                      ; 6E9F   02BC 0223
        MVII    #$0003, R3                      ; 6EA1   02BB 0003
        MVII    #$0004, R1                      ; 6EA3   02B9 0004
        MVI     G_01B7, R0                      ; 6EA5   0280 01B7
        SLL     R0,     2                       ; 6EA7   004C
        PSHR    R0                              ; 6EA8   0270
        SLL     R0,     2                       ; 6EA9   004C
        SLL     R0,     1                       ; 6EAA   0048
        PSHR    R0                              ; 6EAB   0270
        SLL     R0,     1                       ; 6EAC   0048
        ADD@    R6,     R0                      ; 6EAD   02F0
        ADD@    R6,     R0                      ; 6EAE   02F0
        PSHR    R0                              ; 6EAF   0270

        JSR     R5,     X_PRNUM_RGT             ; 6EB0   0004 0118 00C5

        PULR    R0                              ; 6EB3   02B0
        MVII    #$0083, R1                      ; 6EB4   02B9 0083
        MVO     R1,     .BTAB.27                ; 6EB6   0241 0227
        ADD     G_035B, R0                      ; 6EB8   02C0 035B
        MVI     G_035C, R1                      ; 6EBA   0281 035C
        SDBD                                    ; 6EBC   0001
        CMPI    #$2710, R0                      ; 6EBD   0378 0010 0027
        BNC     L_6EDF                          ; 6EC0   0209 001D

        INCR    R1                              ; 6EC2   0009
        SDBD                                    ; 6EC3   0001
        SUBI    #$2710, R0                      ; 6EC4   0338 0010 0027
        MVI     G_015D, R3                      ; 6EC7   0283 015D
        INCR    R3                              ; 6EC9   000B
        CMPI    #$000A, R3                      ; 6ECA   037B 000A
        BEQ     L_6EDF                          ; 6ECC   0204 0011

        MVO     R3,     G_015D                  ; 6ECE   0243 015D
        SLL     R3,     2                       ; 6ED0   004F
        SLL     R3,     1                       ; 6ED1   004B
        ADDI    #$0083, R3                      ; 6ED2   02FB 0083
        MVO     R3,     .BTAB.DC                ; 6ED4   0243 02DC
        PSHR    R0                              ; 6ED6   0270
        PSHR    R1                              ; 6ED7   0271

        JSR     R5,     L_69FE                  ; 6ED8   0004 0168 01FE
        BIDECLE $6A9B                           ; 6EDB   009B 006A

        PULR    R1                              ; 6EDD   02B1
        PULR    R0                              ; 6EDE   02B0
L_6EDF:
        MVO     R0,     G_035B                  ; 6EDF   0240 035B
        MVO     R1,     G_035C                  ; 6EE1   0241 035C

        JSR     R5,     L_6D44                  ; 6EE3   0004 016C 0144

L_6EE6:
        PULR    R7                              ; 6EE6   02B7

        PSHR    R5                              ; 6EE7   0275
        PSHR    R2                              ; 6EE8   0272
        PSHR    R0                              ; 6EE9   0270
        SDBD                                    ; 6EEA   0001
        MVII    #$1000, R0                      ; 6EEB   02B8 0000 0010
L_6EEE:
        DECR    R0                              ; 6EEE   0010
        PSHR    R0                              ; 6EEF   0270

        JSR     R5,     L_6040                  ; 6EF0   0004 0160 0040

        PULR    R0                              ; 6EF3   02B0
        TSTR    R0                              ; 6EF4   0080
        BNEQ    L_6EEE                          ; 6EF5   022C 0008

        PULR    R0                              ; 6EF7   02B0
        PULR    R2                              ; 6EF8   02B2
        PULR    R7                              ; 6EF9   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EFA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EFE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F02   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F06   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F0A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F0E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F12   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F16   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F1A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F1E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F22   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F26   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F2A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F2E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F32   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F36   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F3A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F3E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F42   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F46   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F4A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F4E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F52   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F56   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F5A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F5E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F62   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F66   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F6A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F6E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F72   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F76   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F7A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F7E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F82   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F86   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F8A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F8E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F92   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F96   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F9A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F9E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FBA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FBE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FCA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FCE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6FFE   0000 0000

        ORG     $D000
.TITLE:
        DECLE   $0052                           ; D000  Cartridge year
        STRING  "Masters of the Unive"          ; D001  Title string
        STRING  "rse"                           ; D015   0072 0073 0065
        DECLE   $0000                           ; D018  

.TITLECODE:
        MVII    #$00F0, R0                      ; D019   02B8 00F0
        MVII    #$0200, R4                      ; D01B   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; D01D   0004 0114 0338

        EIS                                     ; D020   0002

        JSR     R5,     L_DD24                  ; D021   0004 01DC 0124

        MVII    #$0000, R0                      ; D024   02B8 0000
        MVII    #$000D, R1                      ; D026   02B9 000D
        MVII    #$0028, R4                      ; D028   02BC 0028
        MVO     R0,     .STIC.BORD              ; D02A   0240 002C
        MVO@    R0,     R4                      ; D02C   0260
        MVO@    R1,     R4                      ; D02D   0261
        MVO@    R0,     R4                      ; D02E   0260
        MVO@    R1,     R4                      ; D02F   0261
        CLRR    R4                              ; D030   01E4
        MVII    #$00FF, R0                      ; D031   02B8 00FF
L_D033:
        MVO@    R0,     R4                      ; D033   0260
        CMPI    #$0008, R4                      ; D034   037C 0008
        BLT     L_D033                          ; D036   0225 0004

        SDBD                                    ; D038   0001
        MVII    #$FB5C, R3                      ; D039   02BB 005C 00FB
        SDBD                                    ; D03C   0001
        MVII    #$3800, R4                      ; D03D   02BC 0000 0038
        MVII    #$002B, R1                      ; D040   02B9 002B

        JSR     R5,     L_D753                  ; D042   0004 01D4 0353

        MVO     R0,     .STIC.VIDEN             ; D045   0240 0020
        EIS                                     ; D047   0002
        MVII    #$0001, R3                      ; D048   02BB 0001
        MVII    #$0201, R4                      ; D04A   02BC 0201

        JSR     R5,     X_PRINT_R5              ; D04C   0004 0118 007B
        STRING  "Mattel Electronics  "          ; D04F  
        STRING  "     presents"                 ; D063  
        DECLE   $0000                           ; D070   0000

        MVII    #$0001, R3                      ; D071   02BB 0001
        MVII    #$02E1, R4                      ; D073   02BC 02E1

        JSR     R5,     X_PRINT_R5              ; D075   0004 0118 007B
        STRING  "1983 Mattel"                   ; D078  
        DECLE   $0000                           ; D083   0000

        SDBD                                    ; D084   0001
        MVII    #$0949, R0                      ; D085   02B8 0049 0009
        MVO     R0,     .BTAB.E0                ; D088   0240 02E0
        MVII    #$0001, R3                      ; D08A   02BB 0001
        MVII    #$02B4, R4                      ; D08C   02BC 02B4

        JSR     R5,     X_PRINT_R5              ; D08E   0004 0118 007B
        STRING  "The Power of He-Man!"          ; D091  
        DECLE   $0000                           ; D0A5   0000

        SDBD                                    ; D0A6   0001
        MVII    #$0800, R2                      ; D0A7   02BA 0000 0008
        SDBD                                    ; D0AA   0001
        MVII    #$D1BA, R3                      ; D0AB   02BB 00BA 00D1
        MVII    #$0253, R4                      ; D0AE   02BC 0253

        JSR     R5,     L_D0CC                  ; D0B0   0004 01D0 00CC

        MVII    #$0267, R4                      ; D0B3   02BC 0267

        JSR     R5,     L_D0CC                  ; D0B5   0004 01D0 00CC

        MVII    #$027B, R4                      ; D0B8   02BC 027B

        JSR     R5,     L_D0CC                  ; D0BA   0004 01D0 00CC

        MVII    #$028F, R4                      ; D0BD   02BC 028F

        JSR     R5,     L_D0CC                  ; D0BF   0004 01D0 00CC

        SDBD                                    ; D0C2   0001
        MVII    #$0951, R0                      ; D0C3   02B8 0051 0009
        MVO     R0,     .BTAB.62                ; D0C6   0240 0262

        JSR     R5,     L_D2E7                  ; D0C8   0004 01D0 02E7

L_D0CB:
        PULR    R7                              ; D0CB   02B7

L_D0CC:
        PSHR    R5                              ; D0CC   0275
        CMPI    #$028C, R4                      ; D0CD   037C 028C
        BGE     L_D0D5                          ; D0CF   020D 0004

        SDBD                                    ; D0D1   0001
        XORI    #$2000, R2                      ; D0D2   03FA 0000 0020
L_D0D5:
        MOVR    R3,     R5                      ; D0D5   009D
        MVII    #$0003, R3                      ; D0D6   02BB 0003
L_D0D8:
        PSHR    R3                              ; D0D8   0273
        MVI@    R5,     R1                      ; D0D9   02A9
        MVII    #$0005, R0                      ; D0DA   02B8 0005
L_D0DC:
        CLRR    R3                              ; D0DC   01DB
        CMPI    #$028C, R4                      ; D0DD   037C 028C
        BLT     L_D0E5                          ; D0DF   0205 0004

        SDBD                                    ; D0E1   0001
        MVII    #$0941, R3                      ; D0E2   02BB 0041 0009
L_D0E5:
        SARC    R1,     1                       ; D0E5   0079
        BC      L_D0EF                          ; D0E6   0201 0007

        MOVR    R2,     R3                      ; D0E8   0093
        ADDI    #$0008, R2                      ; D0E9   02FA 0008
        SDBD                                    ; D0EB   0001
        ANDI    #$DFFF, R2                      ; D0EC   03BA 00FF 00DF
L_D0EF:
        SARC    R1,     1                       ; D0EF   0079
        BNC     L_D0F4                          ; D0F0   0209 0002

        XORI    #$0001, R3                      ; D0F2   03FB 0001
L_D0F4:
        MVO@    R3,     R4                      ; D0F4   0263
        DECR    R0                              ; D0F5   0010
        BNEQ    L_D0DC                          ; D0F6   022C 001B

        PULR    R3                              ; D0F8   02B3
        DECR    R3                              ; D0F9   0013
        BNEQ    L_D0D8                          ; D0FA   022C 0023

        CLRR    R3                              ; D0FC   01DB
        DECR    R4                              ; D0FD   0014
        CMPI    #$028C, R4                      ; D0FE   037C 028C
        BGE     L_D106                          ; D100   020D 0004

        SDBD                                    ; D102   0001
        MVII    #$2000, R3                      ; D103   02BB 0000 0020
L_D106:
        MVO@    R3,     R4                      ; D106   0263
        MOVR    R5,     R3                      ; D107   00AB
        PULR    R7                              ; D108   02B7

        PSHR    R5                              ; D109   0275
        MVII    #$00F0, R0                      ; D10A   02B8 00F0
        MVO     R0,     G_035E                  ; D10C   0240 035E
        MVII    #$0200, R4                      ; D10E   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; D110   0004 0114 0338

        MVII    #$0003, R3                      ; D113   02BB 0003
        MVII    #$0218, R4                      ; D115   02BC 0218

        JSR     R5,     X_PRINT_R5              ; D117   0004 0118 007B
        STRING  "Select skill        "          ; D11A  
        STRING  " level (1-4)"                  ; D12E  
        DECLE   $0000                           ; D13A   0000

        SDBD                                    ; D13B   0001
        MVII    #$D14A, R0                      ; D13C   02B8 004A 00D1
        MVO     R0,     G_035D                  ; D13F   0240 035D
        MVII    #$0003, R0                      ; D141   02B8 0003
        MVO     R0,     G_01B1                  ; D143   0240 01B1
        MVII    #$001F, R0                      ; D145   02B8 001F
        MVO     R0,     G_0161                  ; D147   0240 0161
        PULR    R7                              ; D149   02B7

        DECLE   $0000,  $0000,  $0054,  $00D1   ; D14A   0000 0000 0054 00D1
        DECLE   $0000,  $0000,  $0000,  $0000   ; D14E   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D152   0000 0000

        PSHR    R5                              ; D154   0275
        CMPI    #$0004, R0                      ; D155   0378 0004
        BGT     L_D1A7                          ; D157   020E 004E

        DECR    R0                              ; D159   0010
        BMI     L_D0CB                          ; D15A   022B 0090

        MVO     R0,     G_01B1                  ; D15C   0240 01B1

        JSR     R5,     L_D169                  ; D15E   0004 01D0 0169

        MOVR    R0,     R5                      ; D161   0085
        ADDR    R2,     R1                      ; D162   00D1
        MOVR    R1,     R6                      ; D163   008E
        ADDR    R2,     R1                      ; D164   00D1
        MOVR    R2,     R5                      ; D165   0095
        ADDR    R2,     R1                      ; D166   00D1
        MOVR    R4,     R0                      ; D167   00A0
        ADDR    R2,     R1                      ; D168   00D1
L_D169:
        ADDR    R0,     R5                      ; D169   00C5
        ADDR    R0,     R5                      ; D16A   00C5
        SDBD                                    ; D16B   0001
        MVI@    R5,     R1                      ; D16C   02A9
        MVII    #$000A, R0                      ; D16D   02B8 000A
        MVII    #$0006, R3                      ; D16F   02BB 0006
        MVII    #$0294, R4                      ; D171   02BC 0294

        JSR     R5,     X_PRPAD_R1              ; D173   0004 0118 006C

        MVII    #$02EA, R4                      ; D176   02BC 02EA
        MVII    #$0003, R3                      ; D178   02BB 0003

        JSR     R5,     X_PRINT_R5              ; D17A   0004 0118 007B
        STRING  "enter?"                        ; D17D  
        DECLE   $0000                           ; D183   0000

        PULR    R7                              ; D184   02B7

        DECLE   $0070,  $0072,  $0061,  $0063   ; D185   0070 0072 0061 0063
        DECLE   $0074,  $0069,  $0063,  $0065   ; D189   0074 0069 0063 0065
        DECLE   $0000,  $006E,  $006F,  $0076   ; D18D   0000 006E 006F 0076
        DECLE   $0069,  $0063,  $0065,  $0000   ; D191   0069 0063 0065 0000
        DECLE   $0063,  $0068,  $0061,  $006C   ; D195   0063 0068 0061 006C
        DECLE   $006C,  $0065,  $006E,  $0067   ; D199   006C 0065 006E 0067
        DECLE   $0065,  $0072,  $0000,  $006D   ; D19D   0065 0072 0000 006D
        DECLE   $0061,  $0073,  $0074,  $0065   ; D1A1   0061 0073 0074 0065
        DECLE   $0072,  $0000                   ; D1A5   0072 0000
L_D1A7:
        CMPI    #$000B, R0                      ; D1A7   0378 000B
        BNEQ    L_D0CB                          ; D1A9   022C 00DF

        MVI     G_01B1, R0                      ; D1AB   0280 01B1
        MVO     R0,     G_015F                  ; D1AD   0240 015F
        MVO     R0,     G_015E                  ; D1AF   0240 015E
        SDBD                                    ; D1B1   0001
        MVII    #$1906, R0                      ; D1B2   02B8 0006 0019
        MVO     R0,     G_035D                  ; D1B5   0240 035D
        J       L_50E1                          ; D1B7   0004 0350 00E1

        NEGR    R0                              ; D1BA   0020
        MVII    #$0113, R2                      ; D1BB   02BA 0113
        MVI@    R2,     R4                      ; D1BD   0294
        MVII    #$012A, R2                      ; D1BE   02BA 012A
        ANDI    #$03BB, R0                      ; D1C0   03B8 03BB
        SUBR    R7,     R2                      ; D1C2   013A
        MVI@    R2,     R6                      ; D1C3   0296
        MVI@    R5,     R2                      ; D1C4   02AA
        ANDR    R2,     R6                      ; D1C5   0196
.START:
        PSHR    R5                              ; D1C6   0275
        CLRR    R0                              ; D1C7   01C0
        MVO     R0,     G_035C                  ; D1C8   0240 035C
        MVO     R0,     G_0102                  ; D1CA   0240 0102
        MVO     R0,     G_0356                  ; D1CC   0240 0356
        SDBD                                    ; D1CE   0001
        MVII    #$10F9, R0                      ; D1CF   02B8 00F9 0010
        MVO     R0,     G_035B                  ; D1D2   0240 035B
        MVII    #$0003, R0                      ; D1D4   02B8 0003
        MVO     R0,     G_015D                  ; D1D6   0240 015D
        SDBD                                    ; D1D8   0001
        MVII    #$D205, R0                      ; D1D9   02B8 0005 00D2
        MVO     R0,     G_035D                  ; D1DC   0240 035D
        MVII    #$000F, R0                      ; D1DE   02B8 000F
        MVO     R0,     G_0161                  ; D1E0   0240 0161
        SDBD                                    ; D1E2   0001
        MVII    #$DC56, R0                      ; D1E3   02B8 0056 00DC
        MOVR    R0,     R1                      ; D1E6   0081
        SWAP    R1,     1                       ; D1E7   0041
        MVO     R0,     .ISRVEC.0               ; D1E8   0240 0100
        MVO     R1,     .ISRVEC.1               ; D1EA   0241 0101
        MVII    #$031D, R4                      ; D1EC   02BC 031D
        MVII    #$002A, R0                      ; D1EE   02B8 002A

        JSR     R5,     X_FILL_ZERO             ; D1F0   0004 0114 0338

L_D1F3:
        EIS                                     ; D1F3   0002
        MVI     G_0102, R0                      ; D1F4   0280 0102
        DECR    R0                              ; D1F6   0010
        BPL     L_D1F3                          ; D1F7   0223 0005

        MVII    #$0002, R1                      ; D1F9   02B9 0002
        MVO     R1,     G_0102                  ; D1FB   0241 0102

        JSR     R5,     .EXEC.4F1               ; D1FD   0004 0114 00F1
        JSR     R5,     L_D20F                  ; D200   0004 01D0 020F

        B       L_D1F3                          ; D203   0220 0011

        INCR    R1                              ; D205   0009
        ADDR    R2,     R1                      ; D206   00D1
        INCR    R1                              ; D207   0009
        ADDR    R2,     R1                      ; D208   00D1
        INCR    R1                              ; D209   0009
        ADDR    R2,     R1                      ; D20A   00D1
        INCR    R1                              ; D20B   0009
        ADDR    R2,     R1                      ; D20C   00D1
        INCR    R1                              ; D20D   0009
        ADDR    R2,     R1                      ; D20E   00D1
L_D20F:
        PSHR    R5                              ; D20F   0275
        MVI     G_0161, R0                      ; D210   0280 0161
        CMPI    #$000F, R0                      ; D212   0378 000F
        BNEQ    L_D0CB                          ; D214   022C 014A

        MVI     G_0356, R0                      ; D216   0280 0356
        INCR    R0                              ; D218   0008
        MVO     R0,     G_0356                  ; D219   0240 0356
        CMPI    #$034B, R0                      ; D21B   0378 034B
        BLT     L_D0CB                          ; D21D   0225 0153

        JSR     R5,     .EXEC.60A               ; D21F   0004 0114 020A

        SDBD                                    ; D222   0001
        MVII    #$1906, R0                      ; D223   02B8 0006 0019
        MVO     R0,     G_035D                  ; D226   0240 035D
        MVII    #$00FF, R1                      ; D228   02B9 00FF
        MVO     R1,     G_011E                  ; D22A   0241 011E
        MVI     G_0358, R0                      ; D22C   0280 0358
        INCR    R0                              ; D22E   0008
        MVO     R0,     G_0358                  ; D22F   0240 0358
        ANDI    #$0001, R0                      ; D231   03B8 0001
        BNEQ    L_D238                          ; D233   020C 0003
        J       L_50D4                          ; D235   0004 0350 00D4

L_D238:
        MVII    #$0008, R1                      ; D238   02B9 0008
        MVO     R1,     G_0161                  ; D23A   0241 0161
        MVI     G_0358, R0                      ; D23C   0280 0358
        ANDI    #$0006, R0                      ; D23E   03B8 0006
        SLR     R0,     1                       ; D240   0060
        CMPI    #$0003, R0                      ; D241   0378 0003
        BLT     L_D247                          ; D243   0205 0002

        SUBI    #$0002, R0                      ; D245   0338 0002
L_D247:
        MVO     R0,     G_0160                  ; D247   0240 0160
        MVII    #$0003, R0                      ; D249   02B8 0003
        MVO     R0,     G_015F                  ; D24B   0240 015F
        MVII    #$0028, R0                      ; D24D   02B8 0028
        MVO     R0,     G_01AE                  ; D24F   0240 01AE
        CLRR    R0                              ; D251   01C0
        MVO     R0,     G_0356                  ; D252   0240 0356
        MVO     R0,     G_035E                  ; D254   0240 035E
        J       L_D4E5                          ; D256   0004 03D4 00E5

L_D259:
        PSHR    R5                              ; D259   0275
        MVI     G_0161, R0                      ; D25A   0280 0161
        CMPI    #$0008, R0                      ; D25C   0378 0008
        BEQ     L_D264                          ; D25E   0204 0004

        CMPI    #$000A, R0                      ; D260   0378 000A
        BNEQ    L_D0CB                          ; D262   022C 0198

L_D264:
        MVII    #$011F, R4                      ; D264   02BC 011F
L_D266:
        MVI@    R4,     R1                      ; D266   02A1
        ANDI    #$0040, R1                      ; D267   03B9 0040
        BNEQ    L_D27A                          ; D269   020C 000F

L_D26B:
        MVII    #$02F1, R6                      ; D26B   02BE 02F1
        SDBD                                    ; D26D   0001
        MVII    #$1126, R0                      ; D26E   02B8 0026 0011
        MOVR    R0,     R1                      ; D271   0081
        SWAP    R1,     1                       ; D272   0041
        MVO     R0,     .ISRVEC.0               ; D273   0240 0100
        MVO     R1,     .ISRVEC.1               ; D275   0241 0101
        J       .EXEC.041                       ; D277   0004 0310 0041

L_D27A:
        CMPI    #$0121, R4                      ; D27A   037C 0121
        BLT     L_D266                          ; D27C   0225 0017

        MVI@    R4,     R1                      ; D27E   02A1
        XOR@    R4,     R1                      ; D27F   03E1
        TSTR    R1                              ; D280   0089
        BNEQ    L_D26B                          ; D281   022C 0017

        MVI     G_0161, R3                      ; D283   0283 0161
        ANDI    #$0002, R3                      ; D285   03BB 0002
        BNEQ    L_D0CB                          ; D287   022C 01BD

        MVI     G_0356, R3                      ; D289   0283 0356
        INCR    R3                              ; D28B   000B
        MVO     R3,     G_0356                  ; D28C   0243 0356
        ANDI    #$0007, R3                      ; D28E   03BB 0007
        BNEQ    L_D0CB                          ; D290   022C 01C6

        MVI     G_0356, R3                      ; D292   0283 0356
        SLR     R3,     2                       ; D294   0067
        SLR     R3,     2                       ; D295   0067
        SDBD                                    ; D296   0001
        ADDI    #$D2B7, R3                      ; D297   02FB 00B7 00D2
        MVI@    R3,     R0                      ; D29A   0298
        CMPI    #$001F, R0                      ; D29B   0378 001F
        BEQ     L_D26B                          ; D29D   0224 0033

        CMPI    #$001E, R0                      ; D29F   0378 001E
        BEQ     L_D2B0                          ; D2A1   0204 000D

        MOVR    R0,     R1                      ; D2A3   0081
        SLR     R1,     2                       ; D2A4   0065
        SLR     R1,     2                       ; D2A5   0065
        ANDI    #$000F, R0                      ; D2A6   03B8 000F
        MVO     R0,     G_01B0                  ; D2A8   0240 01B0
        MVO     R1,     G_01AF                  ; D2AA   0241 01AF
        CLRR    R0                              ; D2AC   01C0
        MVO     R0,     G_035E                  ; D2AD   0240 035E
        PULR    R7                              ; D2AF   02B7

L_D2B0:
        SDBD                                    ; D2B0   0001
        MVII    #$CA5A, R0                      ; D2B1   02B8 005A 00CA
        MVO     R0,     G_035E                  ; D2B4   0240 035E
        PULR    R7                              ; D2B6   02B7

        DECLE   $0000,  $0000,  $0002,  $0001   ; D2B7   0000 0000 0002 0001
        DECLE   $0000,  $0010,  $0001,  $0001   ; D2BB   0000 0010 0001 0001
        DECLE   $0010,  $0010,  $0010,  $0000   ; D2BF   0010 0010 0010 0000
        DECLE   $0000,  $0000,  $000D,  $000F   ; D2C3   0000 0000 000D 000F
        DECLE   $0000,  $0000,  $0000,  $0000   ; D2C7   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D2CB   0000 0000

        INCR    R4                              ; D2CD   000C
        INCR    R6                              ; D2CE   000E
        INCR    R7                              ; D2CF   000F

        DECLE   $0000                           ; D2D0   0000
L_D2D1:
        DECR    R0                              ; D2D1   0010
        DECLE   $001E,  $0010,  $0010,  $0000   ; D2D2   001E 0010 0010 0000
        DECLE   $001E,  $001E,  $001E,  $001F   ; D2D6   001E 001E 001E 001F
UC_D2DA:
        MVII    #$015A, R4                      ; D2DA  SLIB UCALL target
        SDBD                                    ; D2DC   0001
        MVI@    R4,     R5                      ; D2DD   02A5
        SDBD                                    ; D2DE   0001
        MVI@    R5,     R4                      ; D2DF   02AC
        MOVR    R5,     R0                      ; D2E0   00A8
        MVO     R0,     G_015A                  ; D2E1   0240 015A
        SWAP    R0,     1                       ; D2E3   0040
        MVO     R0,     G_015B                  ; D2E4   0240 015B
        PULR    R7                              ; D2E6   02B7

L_D2E7:
        SDBD                                    ; D2E7   0001
        MVII    #$D308, R0                      ; D2E8   02B8 0008 00D3
        PSHR    R5                              ; D2EB   0275
        MVO     R0,     G_015A                  ; D2EC   0240 015A
        SWAP    R0,     1                       ; D2EE   0040
        MVO     R0,     G_015B                  ; D2EF   0240 015B

        JSR     R5,     X_PLAY_SFX1             ; D2F1   0004 0118 03BB
        DECLE   $002F                           ; D2F4  SFX data
        DECLE   $012B                           ; D2F5  SFX data
        DECLE   $0035                           ; D2F6  SFX data
        DECLE   $02EB                           ; D2F7  SFX data
        DECLE   $0389                           ; D2F8  SFX data
        DECLE   $0077,  $00DA,  $00D2           ; D2F9  SFX data
        DECLE   $0001,  $02B8                   ; D2FC  SFX data
        DECLE   $002E                           ; D2FE  SFX data
        DECLE   $00D3,  $0220                   ; D2FF  SFX data
        DECLE   $0016                           ; D301  SFX data
        DECLE   $0001,  $02B8                   ; D302  SFX data
        DECLE   $003A                           ; D304  SFX data
        DECLE   $00D3,  $0220                   ; D305  SFX data
        DECLE   $001C,  $003E                   ; D307  SFX data
        DECLE   $00D3,  $0057                   ; D309  SFX data
        DECLE   $00D3,  $006E                   ; D30B  SFX data
        DECLE   $00D3,  $0091                   ; D30D  SFX data
        DECLE   $00D3,  $006E                   ; D30F  SFX data
        DECLE   $00D3,  $00AD                   ; D311  SFX data
        DECLE   $00D3,  $00D0                   ; D313  SFX data
        DECLE   $00D3,  $003E                   ; D315  SFX data
        DECLE   $00D3,  $0091                   ; D317  SFX data
        DECLE   $00D3,  $006E                   ; D319  SFX data
        DECLE   $00D3,  $0057                   ; D31B  SFX data
        DECLE   $00D3,  $006E                   ; D31D  SFX data
        DECLE   $00D3,  $00AD                   ; D31F  SFX data
        DECLE   $00D3,  $00F5                   ; D321  SFX data
        DECLE   $00D3,  $0030                   ; D323  SFX data
        DECLE   $00D4,  $007A                   ; D325  SFX data
        DECLE   $00D4,  $0030                   ; D327  SFX data
        DECLE   $00D4,  $007A                   ; D329  SFX data
        DECLE   $00D4,  $00C4                   ; D32B  SFX data
        DECLE   $00D4,  $006E                   ; D32D  SFX data
        DECLE   $00D3,  $0091                   ; D32F  SFX data
        DECLE   $00D3,  $006E                   ; D331  SFX data
        DECLE   $00D3,  $0091                   ; D333  SFX data
        DECLE   $00D3,  $00A8                   ; D335  SFX data
        DECLE   $00D3,  $0080                   ; D337  SFX data
        DECLE   $00F5                           ; D339  SFX data
        DECLE   $0030,  $00D4                   ; D33A  SFX data
        DECLE   $006D                           ; D33C  SFX data
        DECLE   $00F6                           ; D33D  SFX data
        DECLE   $0380,  $0357                   ; D33E  SFX data
        DECLE   $0388,  $011D                   ; D340  SFX data
        DECLE   $0304,  $011E                   ; D342  SFX data
        DECLE   $03EA                           ; D344  SFX data
        DECLE   $03E6                           ; D345  SFX data
        DECLE   $02EB                           ; D346  SFX data
        DECLE   $03A5                           ; D347  SFX data
        DECLE   $0315                           ; D348  SFX data
        DECLE   $03F2                           ; D349  SFX data
        DECLE   $016B                           ; D34A  SFX data
        DECLE   $0025                           ; D34B  SFX data
        DECLE   $0015                           ; D34C  SFX data
        DECLE   $016B                           ; D34D  SFX data
        DECLE   $03A5                           ; D34E  SFX data
        DECLE   $0315                           ; D34F  SFX data
        DECLE   $016B                           ; D350  SFX data
        DECLE   $0025                           ; D351  SFX data
        DECLE   $0015                           ; D352  SFX data
        DECLE   $016B                           ; D353  SFX data
        DECLE   $0077,  $00DA,  $00D2           ; D354  SFX data
        DECLE   $03D0,  $02AE                   ; D357  SFX data
        DECLE   $0388,  $011D                   ; D359  SFX data
        DECLE   $0304,  $011E                   ; D35B  SFX data
        DECLE   $02EB                           ; D35D  SFX data
        DECLE   $03EE                           ; D35E  SFX data
        DECLE   $02EB                           ; D35F  SFX data
        DECLE   $0385                           ; D360  SFX data
        DECLE   $03E2                           ; D361  SFX data
        DECLE   $0388,  $0153                   ; D362  SFX data
        DECLE   $0304,  $0154                   ; D364  SFX data
        DECLE   $02EB                           ; D366  SFX data
        DECLE   $03D0,  $01F4                   ; D367  SFX data
        DECLE   $03EE                           ; D369  SFX data
        DECLE   $02EB                           ; D36A  SFX data
        DECLE   $0077,  $00DA,  $00D2           ; D36B  SFX data
        DECLE   $03D0,  $014D                   ; D36E  SFX data
        DECLE   $0388,  $011D                   ; D370  SFX data
        DECLE   $0304,  $011E                   ; D372  SFX data
        DECLE   $03E2                           ; D374  SFX data
        DECLE   $016B                           ; D375  SFX data
        DECLE   $0025                           ; D376  SFX data
        DECLE   $0015                           ; D377  SFX data
        DECLE   $016B                           ; D378  SFX data
        DECLE   $03D0,  $0101                   ; D379  SFX data
        DECLE   $0388,  $00FE                   ; D37B  SFX data
        DECLE   $0304,  $00FF                   ; D37D  SFX data
        DECLE   $03FA                           ; D37F  SFX data
        DECLE   $03F6                           ; D380  SFX data
        DECLE   $02EB                           ; D381  SFX data
        DECLE   $0388,  $011D                   ; D382  SFX data
        DECLE   $0304,  $011E                   ; D384  SFX data
        DECLE   $03FE                           ; D386  SFX data
        DECLE   $02EB                           ; D387  SFX data
        DECLE   $0388,  $0140                   ; D388  SFX data
        DECLE   $0304,  $0141                   ; D38A  SFX data
        DECLE   $03FE                           ; D38C  SFX data
        DECLE   $02EB                           ; D38D  SFX data
        DECLE   $0077,  $00DA,  $00D2           ; D38E  SFX data
        DECLE   $03D0,  $02AE                   ; D391  SFX data
        DECLE   $0388,  $011D                   ; D393  SFX data
        DECLE   $0304,  $011E                   ; D395  SFX data
        DECLE   $02EB                           ; D397  SFX data
        DECLE   $03EE                           ; D398  SFX data
        DECLE   $02EB                           ; D399  SFX data
        DECLE   $0385                           ; D39A  SFX data
        DECLE   $03E2                           ; D39B  SFX data
        DECLE   $0388,  $01AC                   ; D39C  SFX data
        DECLE   $0304,  $01AD                   ; D39E  SFX data
        DECLE   $02EB                           ; D3A0  SFX data
        DECLE   $03D0,  $01F4                   ; D3A1  SFX data
        DECLE   $03EE                           ; D3A3  SFX data
        DECLE   $02EB                           ; D3A4  SFX data
        DECLE   $0077,  $00DA,  $00D2           ; D3A5  SFX data
        DECLE   $0002                           ; D3A8  SFX data
        DECLE   $02EB                           ; D3A9  SFX data
        DECLE   $0077,  $00DA,  $00D2           ; D3AA  SFX data
        DECLE   $0390,  $014D                   ; D3AD  SFX data
        DECLE   $0388,  $011D                   ; D3AF  SFX data
        DECLE   $0304,  $011E                   ; D3B1  SFX data
        DECLE   $02EB                           ; D3B3  SFX data
        DECLE   $03EE                           ; D3B4  SFX data
        DECLE   $02EB                           ; D3B5  SFX data
        DECLE   $03D0,  $02AE                   ; D3B6  SFX data
        DECLE   $0388,  $0153                   ; D3B8  SFX data
        DECLE   $0304,  $0154                   ; D3BA  SFX data
        DECLE   $03E2                           ; D3BC  SFX data
        DECLE   $02EB                           ; D3BD  SFX data
        DECLE   $03D0,  $014D                   ; D3BE  SFX data
        DECLE   $03EE                           ; D3C0  SFX data
        DECLE   $02EB                           ; D3C1  SFX data
        DECLE   $03D0,  $019E                   ; D3C2  SFX data
        DECLE   $0388,  $01AC                   ; D3C4  SFX data
        DECLE   $0304,  $01AD                   ; D3C6  SFX data
        DECLE   $03E2                           ; D3C8  SFX data
        DECLE   $016B                           ; D3C9  SFX data
        DECLE   $0025                           ; D3CA  SFX data
        DECLE   $0015                           ; D3CB  SFX data
        DECLE   $016B                           ; D3CC  SFX data
        DECLE   $0077,  $00DA,  $00D2           ; D3CD  SFX data
        DECLE   $03D0,  $01F4                   ; D3D0  SFX data
        DECLE   $0388,  $017D                   ; D3D2  SFX data
        DECLE   $0304,  $017E                   ; D3D4  SFX data
        DECLE   $03E2                           ; D3D6  SFX data
        DECLE   $02EB                           ; D3D7  SFX data
        DECLE   $03A5                           ; D3D8  SFX data
        DECLE   $03D0,  $014D                   ; D3D9  SFX data
        DECLE   $03E2                           ; D3DB  SFX data
        DECLE   $02EB                           ; D3DC  SFX data
        DECLE   $0365                           ; D3DD  SFX data
        DECLE   $03D0,  $0101                   ; D3DE  SFX data
        DECLE   $03E2                           ; D3E0  SFX data
        DECLE   $02EB                           ; D3E1  SFX data
        DECLE   $03D0,  $0075                   ; D3E2  SFX data
        DECLE   $02EB                           ; D3E4  SFX data
        DECLE   $03FE                           ; D3E5  SFX data
        DECLE   $02EB                           ; D3E6  SFX data
        DECLE   $03C5                           ; D3E7  SFX data
        DECLE   $03E2                           ; D3E8  SFX data
        DECLE   $02EB                           ; D3E9  SFX data
        DECLE   $03C0,  $03F9                   ; D3EA  SFX data
        DECLE   $03E2                           ; D3EC  SFX data
        DECLE   $02EB                           ; D3ED  SFX data
        DECLE   $03C0,  $038A                   ; D3EE  SFX data
        DECLE   $03E2                           ; D3F0  SFX data
        DECLE   $02EB                           ; D3F1  SFX data
        DECLE   $0077,  $00DA,  $00D2           ; D3F2  SFX data
        DECLE   $0390,  $01F4                   ; D3F5  SFX data
        DECLE   $0388,  $017D                   ; D3F7  SFX data
        DECLE   $0304,  $01FC                   ; D3F9  SFX data
        DECLE   $02EB                           ; D3FB  SFX data
        DECLE   $03E2                           ; D3FC  SFX data
        DECLE   $0365                           ; D3FD  SFX data
        DECLE   $008F,  $0017                   ; D3FE  SFX data
        DECLE   $03C5                           ; D400  SFX data
        DECLE   $03E2                           ; D401  SFX data
        DECLE   $02EB                           ; D402  SFX data
        DECLE   $0304,  $0140                   ; D403  SFX data
        DECLE   $03C5                           ; D405  SFX data
        DECLE   $03E2                           ; D406  SFX data
        DECLE   $02EB                           ; D407  SFX data
        DECLE   $03C5                           ; D408  SFX data
        DECLE   $03E2                           ; D409  SFX data
        DECLE   $02EB                           ; D40A  SFX data
        DECLE   $03D0,  $014D                   ; D40B  SFX data
        DECLE   $03E2                           ; D40D  SFX data
        DECLE   $02EB                           ; D40E  SFX data
        DECLE   $03D0,  $0101                   ; D40F  SFX data
        DECLE   $03E2                           ; D411  SFX data
        DECLE   $02EB                           ; D412  SFX data
        DECLE   $03D0,  $0075                   ; D413  SFX data
        DECLE   $0388,  $017D                   ; D415  SFX data
        DECLE   $0304,  $011D                   ; D417  SFX data
        DECLE   $02EB                           ; D419  SFX data
        DECLE   $03E2                           ; D41A  SFX data
        DECLE   $0365                           ; D41B  SFX data
        DECLE   $008F,  $0017                   ; D41C  SFX data
        DECLE   $03EE                           ; D41E  SFX data
        DECLE   $02EB                           ; D41F  SFX data
        DECLE   $03C5                           ; D420  SFX data
        DECLE   $03FA                           ; D421  SFX data
        DECLE   $03F6                           ; D422  SFX data
        DECLE   $02EB                           ; D423  SFX data
        DECLE   $03E2                           ; D424  SFX data
        DECLE   $02EB                           ; D425  SFX data
        DECLE   $0390,  $0035                   ; D426  SFX data
        DECLE   $0304,  $021B                   ; D428  SFX data
        DECLE   $02EB                           ; D42A  SFX data
        DECLE   $03EE                           ; D42B  SFX data
        DECLE   $02EB                           ; D42C  SFX data
        DECLE   $0077,  $00DA,  $00D2           ; D42D  SFX data
        DECLE   $03C0,  $03F9                   ; D430  SFX data
        DECLE   $0388,  $0153                   ; D432  SFX data
        DECLE   $0304,  $0154                   ; D434  SFX data
        DECLE   $02EB                           ; D436  SFX data
        DECLE   $03EE                           ; D437  SFX data
        DECLE   $02EB                           ; D438  SFX data
        DECLE   $0305                           ; D439  SFX data
        DECLE   $03E2                           ; D43A  SFX data
        DECLE   $02EB                           ; D43B  SFX data
        DECLE   $03C5                           ; D43C  SFX data
        DECLE   $0388,  $01FC                   ; D43D  SFX data
        DECLE   $0304,  $01FD                   ; D43F  SFX data
        DECLE   $02EB                           ; D441  SFX data
        DECLE   $03EE                           ; D442  SFX data
        DECLE   $02EB                           ; D443  SFX data
        DECLE   $0388,  $01AC                   ; D444  SFX data
        DECLE   $0304,  $01AD                   ; D446  SFX data
        DECLE   $02EB                           ; D448  SFX data
        DECLE   $03C5                           ; D449  SFX data
        DECLE   $03EE                           ; D44A  SFX data
        DECLE   $02EB                           ; D44B  SFX data
        DECLE   $0388,  $0153                   ; D44C  SFX data
        DECLE   $0344,  $0154                   ; D44E  SFX data
        DECLE   $03EE                           ; D450  SFX data
        DECLE   $02EB                           ; D451  SFX data
        DECLE   $0380,  $02FA                   ; D452  SFX data
        DECLE   $0388,  $012E                   ; D454  SFX data
        DECLE   $0304,  $012F                   ; D456  SFX data
        DECLE   $02EB                           ; D458  SFX data
        DECLE   $0388,  $0153                   ; D459  SFX data
        DECLE   $0304,  $0154                   ; D45B  SFX data
        DECLE   $03EE                           ; D45D  SFX data
        DECLE   $02EB                           ; D45E  SFX data
        DECLE   $0385                           ; D45F  SFX data
        DECLE   $0388,  $017D                   ; D460  SFX data
        DECLE   $0304,  $017E                   ; D462  SFX data
        DECLE   $03EE                           ; D464  SFX data
        DECLE   $02EB                           ; D465  SFX data
        DECLE   $03C0,  $03F9                   ; D466  SFX data
        DECLE   $0388,  $0153                   ; D468  SFX data
        DECLE   $0304,  $0154                   ; D46A  SFX data
        DECLE   $008F,  $0017                   ; D46C  SFX data
        DECLE   $03E2                           ; D46E  SFX data
        DECLE   $03FA                           ; D46F  SFX data
        DECLE   $03F6                           ; D470  SFX data
        DECLE   $02EB                           ; D471  SFX data
        DECLE   $03D0,  $0075                   ; D472  SFX data
        DECLE   $02EB                           ; D474  SFX data
        DECLE   $03E2                           ; D475  SFX data
        DECLE   $02EB                           ; D476  SFX data
        DECLE   $0077,  $00DA,  $00D2           ; D477  SFX data
        DECLE   $03C0,  $03F9                   ; D47A  SFX data
        DECLE   $0388,  $0153                   ; D47C  SFX data
        DECLE   $0304,  $0154                   ; D47E  SFX data
        DECLE   $02EB                           ; D480  SFX data
        DECLE   $03EE                           ; D481  SFX data
        DECLE   $02EB                           ; D482  SFX data
        DECLE   $0305                           ; D483  SFX data
        DECLE   $03E2                           ; D484  SFX data
        DECLE   $02EB                           ; D485  SFX data
        DECLE   $03C5                           ; D486  SFX data
        DECLE   $0388,  $01FC                   ; D487  SFX data
        DECLE   $0304,  $01FD                   ; D489  SFX data
        DECLE   $02EB                           ; D48B  SFX data
        DECLE   $03EE                           ; D48C  SFX data
        DECLE   $02EB                           ; D48D  SFX data
        DECLE   $0388,  $01AC                   ; D48E  SFX data
        DECLE   $0304,  $01AD                   ; D490  SFX data
        DECLE   $02EB                           ; D492  SFX data
        DECLE   $03C5                           ; D493  SFX data
        DECLE   $03EE                           ; D494  SFX data
        DECLE   $02EB                           ; D495  SFX data
        DECLE   $0388,  $0153                   ; D496  SFX data
        DECLE   $0344,  $0154                   ; D498  SFX data
        DECLE   $03EE                           ; D49A  SFX data
        DECLE   $02EB                           ; D49B  SFX data
        DECLE   $03D0,  $0075                   ; D49C  SFX data
        DECLE   $0388,  $017D                   ; D49E  SFX data
        DECLE   $0304,  $017E                   ; D4A0  SFX data
        DECLE   $02EB                           ; D4A2  SFX data
        DECLE   $0388,  $01AC                   ; D4A3  SFX data
        DECLE   $0304,  $01AD                   ; D4A5  SFX data
        DECLE   $03EE                           ; D4A7  SFX data
        DECLE   $02EB                           ; D4A8  SFX data
        DECLE   $03C5                           ; D4A9  SFX data
        DECLE   $0388,  $01C5                   ; D4AA  SFX data
        DECLE   $0304,  $01C6                   ; D4AC  SFX data
        DECLE   $03EE                           ; D4AE  SFX data
        DECLE   $02EB                           ; D4AF  SFX data
        DECLE   $03C0,  $03F9                   ; D4B0  SFX data
        DECLE   $0388,  $01FC                   ; D4B2  SFX data
        DECLE   $0304,  $01FD                   ; D4B4  SFX data
        DECLE   $008F,  $0017                   ; D4B6  SFX data
        DECLE   $03E2                           ; D4B8  SFX data
        DECLE   $03FA                           ; D4B9  SFX data
        DECLE   $03F6                           ; D4BA  SFX data
        DECLE   $02EB                           ; D4BB  SFX data
        DECLE   $03D0,  $0075                   ; D4BC  SFX data
        DECLE   $02EB                           ; D4BE  SFX data
        DECLE   $03E2                           ; D4BF  SFX data
        DECLE   $02EB                           ; D4C0  SFX data
        DECLE   $0077,  $00DA,  $00D2           ; D4C1  SFX data
        DECLE   $03C0,  $03F9                   ; D4C4  SFX data
        DECLE   $0348,  $0153                   ; D4C6  SFX data
        DECLE   $03C4,  $01FC                   ; D4C8  SFX data
        DECLE   $02EB                           ; D4CA  SFX data
        DECLE   $03EE                           ; D4CB  SFX data
        DECLE   $008F,  $0023                   ; D4CC  SFX data
        DECLE   $02CF                           ; D4CE  SFX end

L_D4CF:
        CLRR    R0                              ; D4CF   01C0
        MVO     R0,     G_01AD                  ; D4D0   0240 01AD
        MVO     R0,     G_0160                  ; D4D2   0240 0160
        MVO     R0,     G_0102                  ; D4D4   0240 0102
        MVII    #$005A, R0                      ; D4D6   02B8 005A
        MVI     G_015F, R1                      ; D4D8   0281 015F
        CMPI    #$0005, R1                      ; D4DA   0379 0005
        BLT     L_D4E0                          ; D4DC   0205 0002

        MVII    #$0078, R0                      ; D4DE   02B8 0078
L_D4E0:
        MVO     R0,     G_01AE                  ; D4E0   0240 01AE
L_D4E2:
        CLRR    R0                              ; D4E2   01C0
        MVO     R0,     G_0161                  ; D4E3   0240 0161
L_D4E5:
        MVII    #$02F1, R6                      ; D4E5   02BE 02F1
        SDBD                                    ; D4E7   0001
        MVII    #$DC56, R1                      ; D4E8   02B9 0056 00DC
        MOVR    R1,     R0                      ; D4EB   0088
        SWAP    R1,     1                       ; D4EC   0041
        MVO     R0,     .ISRVEC.0               ; D4ED   0240 0100
        MVO     R1,     .ISRVEC.1               ; D4EF   0241 0101
        MVII    #$0200, R4                      ; D4F1   02BC 0200
        MVII    #$00F0, R0                      ; D4F3   02B8 00F0
        CLRR    R1                              ; D4F5   01C9

        JSR     R5,     X_FILL_MEM              ; D4F6   0004 0114 0341
        JSR     R5,     .EXEC.A83               ; D4F9   0004 0118 0283

        SDBD                                    ; D4FC   0001
        MVII    #$3800, R2                      ; D4FD   02BA 0000 0038
        SDBD                                    ; D500   0001
        MVII    #$FCB4, R3                      ; D501   02BB 00B4 00FC
        MVI     G_0160, R0                      ; D504   0280 0160
        TSTR    R0                              ; D506   0080
        BEQ     L_D515                          ; D507   0204 000C

        SDBD                                    ; D509   0001
        MVII    #$FD54, R3                      ; D50A   02BB 0054 00FD
        CMPI    #$0001, R0                      ; D50D   0378 0001
        BEQ     L_D515                          ; D50F   0204 0004

        SDBD                                    ; D511   0001
        MVII    #$FCFC, R3                      ; D512   02BB 00FC 00FC

L_D515:
        JSR     R5,     L_DD24                  ; D515   0004 01DC 0124

        MVII    #$0000, R0                      ; D518   02B8 0000
        MVII    #$0001, R1                      ; D51A   02B9 0001
        MVII    #$0028, R5                      ; D51C   02BD 0028
        MVO@    R0,     R5                      ; D51E   0268
        MVO@    R1,     R5                      ; D51F   0269
        MVO@    R0,     R5                      ; D520   0268
        MVO@    R1,     R5                      ; D521   0269
        MVO@    R0,     R5                      ; D522   0268
        MOVR    R2,     R4                      ; D523   0094
        MVII    #$0010, R1                      ; D524   02B9 0010

        JSR     R5,     L_D753                  ; D526   0004 01D4 0353

        SDBD                                    ; D529   0001
        MVII    #$38A8, R4                      ; D52A   02BC 00A8 0038
        SDBD                                    ; D52D   0001
        MVII    #$FDCC, R3                      ; D52E   02BB 00CC 00FD
        MVII    #$001B, R1                      ; D531   02B9 001B

        JSR     R5,     L_D753                  ; D533   0004 01D4 0353

        MVO     R0,     .STIC.VIDEN             ; D536   0240 0020

        JSR     R5,     L_D62E                  ; D538   0004 01D4 022E
L_D53B:
        JSR     R5,     L_F465                  ; D53B   0004 01F4 0065
        JSR     R5,     L_DD06                  ; D53E   0004 01DC 0106

        MVII    #$003A, R0                      ; D541   02B8 003A
        MVII    #$031D, R4                      ; D543   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; D545   0004 0114 0338

        MVII    #$031D, R2                      ; D548   02BA 031D
        SDBD                                    ; D54A   0001
        MVII    #$D60D, R4                      ; D54B   02BC 000D 00D6

        JSR     R5,     L_D8FE                  ; D54E   0004 01D8 00FE

        SDBD                                    ; D551   0001
        MVII    #$D5FD, R4                      ; D552   02BC 00FD 00D5

        JSR     R5,     L_D8FE                  ; D555   0004 01D8 00FE

        SDBD                                    ; D558   0001
        MVII    #$D605, R4                      ; D559   02BC 0005 00D6

        JSR     R5,     L_D8FE                  ; D55C   0004 01D8 00FE

        MVII    #$032D, R2                      ; D55F   02BA 032D
        SDBD                                    ; D561   0001
        MVII    #$D615, R4                      ; D562   02BC 0015 00D6

        JSR     R5,     L_D8FE                  ; D565   0004 01D8 00FE

        SDBD                                    ; D568   0001
        MVII    #$D61D, R4                      ; D569   02BC 001D 00D6

        JSR     R5,     L_D8FE                  ; D56C   0004 01D8 00FE
        JSR     R5,     L_D587                  ; D56F   0004 01D4 0187
        DECLE   $0345                           ; D572   0345
        BIDECLE $5DD9                           ; D573   00D9 005D
        DECLE   $00A9,  $005E,  $009C,  $00FA   ; D575   00A9 005E 009C 00FA
        DECLE   $009C,  $00FA,  $00D9,  $005D   ; D579   009C 00FA 00D9 005D
        DECLE   $00A9,  $005E,  $009C,  $00FE   ; D57D   00A9 005E 009C 00FE
        DECLE   $00DC,  $00FA,  $0000,  $0000   ; D581   00DC 00FA 0000 0000
L_D585:
        MVO@    R0,     R4                      ; D585   0260
        INCR    R7                              ; D586   000F

L_D587:
        MVI@    R5,     R4                      ; D587   02AC
L_D588:
        SDBD                                    ; D588   0001
        MVI@    R5,     R0                      ; D589   02A8
        TSTR    R0                              ; D58A   0080
        BNEQ    L_D585                          ; D58B   022C 0007

        MVII    #$0164, R4                      ; D58D   02BC 0164
        MVII    #$0047, R0                      ; D58F   02B8 0047

        JSR     R5,     X_FILL_ZERO             ; D591   0004 0114 0338
        JSR     R5,     L_D5A7                  ; D594   0004 01D4 01A7
        DECLE   $0165,  $0009,  $0167,  $0028   ; D597   0165 0009 0167 0028
        DECLE   $016C,  $000C,  $016E,  $009B   ; D59B   016C 000C 016E 009B
        DECLE   $0170,  $0010,  $01A5,  $0003   ; D59F   0170 0010 01A5 0003
        DECLE   $0000,  $0000                   ; D5A3   0000 0000
L_D5A5:
        MVI@    R5,     R0                      ; D5A5   02A8
        MVO@    R0,     R4                      ; D5A6   0260
L_D5A7:
        MVI@    R5,     R4                      ; D5A7   02AC
        TSTR    R4                              ; D5A8   00A4
        BNEQ    L_D5A5                          ; D5A9   022C 0005

        MVII    #$0184, R4                      ; D5AB   02BC 0184

        JSR     R5,     L_D5C9                  ; D5AD   0004 01D4 01C9
        DECLE   $0070,  $0002,  $009A,  $0002   ; D5B0   0070 0002 009A 0002
        DECLE   $004C,  $0003,  $0084,  $0002   ; D5B4   004C 0003 0084 0002
        DECLE   $001D,  $0002,  $0047,  $0003   ; D5B8   001D 0002 0047 0003
        DECLE   $006C,  $0003,  $0094,  $0002   ; D5BC   006C 0003 0094 0002
        DECLE   $0055,  $0001,  $002E,  $0002   ; D5C0   0055 0001 002E 0002
        DECLE   $03FF                           ; D5C4   03FF
L_D5C5:
        MVO@    R0,     R4                      ; D5C5   0260
        INCR    R4                              ; D5C6   000C
        MVI@    R5,     R0                      ; D5C7   02A8
        MVO@    R0,     R4                      ; D5C8   0260
L_D5C9:
        MVI@    R5,     R0                      ; D5C9   02A8
        CMPI    #$03FF, R0                      ; D5CA   0378 03FF
        BNEQ    L_D5C5                          ; D5CC   022C 0008

L_D5CE:
        EIS                                     ; D5CE   0002
        MVI     G_0102, R0                      ; D5CF   0280 0102
        DECR    R0                              ; D5D1   0010
        BPL     L_D5CE                          ; D5D2   0223 0005

        MVII    #$0002, R1                      ; D5D4   02B9 0002
        MVO     R1,     G_0102                  ; D5D6   0241 0102

        JSR     R5,     L_D259                  ; D5D8   0004 01D0 0259
        JSR     R5,     L_D910                  ; D5DB   0004 01D8 0110
        JSR     R5,     L_D769                  ; D5DE   0004 01D4 0369
        JSR     R5,     L_F000                  ; D5E1   0004 01F0 0000
        JSR     R5,     L_F0F4                  ; D5E4   0004 01F0 00F4
        JSR     R5,     L_DB25                  ; D5E7   0004 01D8 0325
        JSR     R5,     .EXEC.4F1               ; D5EA   0004 0114 00F1

        MVI     G_0161, R0                      ; D5ED   0280 0161
        ANDI    #$0008, R0                      ; D5EF   03B8 0008
        BNEQ    L_D5F8                          ; D5F1   020C 0005

        MVII    #$0001, R0                      ; D5F3   02B8 0001

        JSR     R5,     X_RAND1                 ; D5F5   0004 0114 027D
L_D5F8:
        JSR     R5,     .EXEC.AAD               ; D5F8   0004 0118 02AD

        B       L_D5CE                          ; D5FB   0220 002E

        DECLE   $0025,  $00D6,  $0009,  $0002   ; D5FD   0025 00D6 0009 0002
        DECLE   $00A8,  $0000,  $0082,  $0019   ; D601   00A8 0000 0082 0019
        DECLE   $0025,  $00D6,  $0009,  $0003   ; D605   0025 00D6 0009 0003
        DECLE   $00A8,  $0000,  $0093,  $0009   ; D609   00A8 0000 0093 0009
        DECLE   $0000,  $0000,  $000D,  $0002   ; D60D   0000 0000 000D 0002
        DECLE   $0028,  $0000,  $00A8,  $0018   ; D611   0028 0000 00A8 0018
        DECLE   $0025,  $00D6,  $009B,  $0003   ; D615   0025 00D6 009B 0003
        DECLE   $0090,  $0000,  $00C7,  $0019   ; D619   0090 0000 00C7 0019
        DECLE   $0025,  $00D6,  $009B,  $0003   ; D61D   0025 00D6 009B 0003
        DECLE   $0090,  $0000,  $00D1,  $0019   ; D621   0090 0000 00D1 0019
        DECLE   $0200,  $0000,  $0000,  $0000   ; D625   0200 0000 0000 0000
        DECLE   $0008,  $0000,  $0002,  $0000   ; D629   0008 0000 0002 0000
        DECLE   $0000                           ; D62D   0000
L_D62E:
        PSHR    R5                              ; D62E   0275
        MVII    #$0200, R2                      ; D62F   02BA 0200
        SDBD                                    ; D631   0001
        MVII    #$D64F, R4                      ; D632   02BC 004F 00D6
        MVI     G_0160, R0                      ; D635   0280 0160
        TSTR    R0                              ; D637   0080
        BEQ     L_D642                          ; D638   0204 0008

        ADDI    #$0050, R4                      ; D63A   02FC 0050
        CMPI    #$0002, R0                      ; D63C   0378 0002
        BNEQ    L_D642                          ; D63E   020C 0002

        ADDI    #$0050, R4                      ; D640   02FC 0050
L_D642:
        MVII    #$0014, R3                      ; D642   02BB 0014

L_D644:
        JSR     R5,     L_D73F                  ; D644   0004 01D4 033F

        MVII    #$02B4, R2                      ; D647   02BA 02B4
        MVII    #$003C, R3                      ; D649   02BB 003C

        JSR     R5,     L_D73F                  ; D64B   0004 01D4 033F

        PULR    R7                              ; D64E   02B7
L_D64F:
        DECR    R7                              ; D64F   0017

        SUBR    R0,     R5                      ; D650   0105
        INCR    R1                              ; D651   0009
L_D652:
        DECR    R7                              ; D652   0017

        SUBR    R7,     R5                      ; D653   013D
        COMR    R1                              ; D654   0019
        INCR    R1                              ; D655   0009
        SUBR    R1,     R5                      ; D656   010D
        ADCR    R7                              ; D657   002F

        SUBR    R7,     R5                      ; D658   013D
L_D659:
        SUBR    R0,     R5                      ; D659   0105
        INCR    R1                              ; D65A   0009
        SUBR    R6,     R5                      ; D65B   0135
L_D65C:
        DECR    R7                              ; D65C   0017

        SUBR    R4,     R5                      ; D65D   0125
        ADCR    R7                              ; D65E   002F

        SUBR    R0,     R5                      ; D65F   0105
L_D660:
        INCR    R1                              ; D660   0009
L_D661:
        DECR    R7                              ; D661   0017

        SUBR    R4,     R5                      ; D662   0125
L_D663:
        DECR    R7                              ; D663   0017

        COMR    R1                              ; D664   0019
        SUBR    R1,     R5                      ; D665   010D
        INCR    R1                              ; D666   0009
        ADCR    R7                              ; D667   002F

L_D668:
        SUBR    R0,     R5                      ; D668   0105
L_D669:
        DECR    R7                              ; D669   0017

        DECLE   $011D,  $0009,  $0037           ; D66A   011D 0009 0037

        INCR    R0                              ; D66D   0008
        INCR    R0                              ; D66E   0008
        INCR    R0                              ; D66F   0008
        INCR    R7                              ; D670   000F

        INCR    R0                              ; D671   0008
L_D672:
        INCR    R0                              ; D672   0008
L_D673:
        DECR    R7                              ; D673   0017

        DECLE   $0125,  $010D,  $002F           ; D674   0125 010D 002F

        BESC    L_D53B                          ; D677   022F 013D

        SUBR    R0,     R5                      ; D679   0105
L_D67A:
        DECR    R7                              ; D67A   0017

        DECLE   $0239,  $0217,  $0219           ; D67B   0239 0217 0219

        B       L_D668                          ; D67E   0220 0017

        SETC                                    ; D680   0007
        SUBI    #$0105, R5                      ; D681   033D 0105
L_D683:
        DECR    R7                              ; D683   0017

        DECLE   $0207,  $031D                   ; D684   0207 031D

        SUBR    R5,     R5                      ; D686   012D
        RSWD    R1                              ; D687   0039
        SUB@    R2,     R5                      ; D688   0315
        SUB@    R4,     R5                      ; D689   0325
        B       L_D644                          ; D68A   0220 0047

        DECLE   $0041,  $0145,  $0047,  $0145   ; D68C   0041 0145 0047 0145
        DECLE   $0047,  $0041,  $0047,  $0145   ; D690   0047 0041 0047 0145
        DECLE   $0041,  $0145,  $0047,  $0047   ; D694   0041 0145 0047 0047
        DECLE   $0145,  $0041,  $0040,  $0145   ; D698   0145 0041 0040 0145
        DECLE   $0040,  $0041,  $0040,  $0004   ; D69C   0040 0041 0040 0004
        DECLE   $010E,  $0034,  $001C,  $0004   ; D6A0   010E 0034 001C 0004

        SUBR    R1,     R6                      ; D6A4   010E
        COMR    R4                              ; D6A5   001C
        SUBR    R4,     R6                      ; D6A6   0126
        COMR    R4                              ; D6A7   001C
        SUBR    R2,     R6                      ; D6A8   0116
        SUBR    R2,     R6                      ; D6A9   0116
        COMR    R4                              ; D6AA   001C
        SUBR    R4,     R6                      ; D6AB   0126
        COMR    R4                              ; D6AC   001C
        NOP                                     ; D6AD   0034
        NOP                                     ; D6AE   0034
        SUBR    R2,     R6                      ; D6AF   0116
        SUBR    R1,     R6                      ; D6B0   010E

        JSR     R4,     .EXEC.C44               ; D6B1   0004 001C 0044
        DECLE   $0008,  $0146,  $001C,  $010E   ; D6B4   0008 0146 001C 010E
        DECLE   $0034,  $0146,  $0014,  $0116   ; D6B8   0034 0146 0014 0116
        DECLE   $0044,  $010E,  $0014,  $0030   ; D6BC   0044 010E 0014 0030
        DECLE   $0126,  $0034,  $0044,  $0126   ; D6C0   0126 0034 0044 0126
        DECLE   $001C,  $0010,  $0044,  $012E   ; D6C4   001C 0010 0044 012E
        DECLE   $003C,  $012E,  $0054,  $012E   ; D6C8   003C 012E 0054 012E
        DECLE   $003C,  $012E,  $0004,  $012E   ; D6CC   003C 012E 0004 012E
        DECLE   $0054,  $012E,  $0004           ; D6D0   0054 012E 0004

        RSWD    R4                              ; D6D3   003C
        SUBR    R5,     R6                      ; D6D4   012E
        RSWD    R4                              ; D6D5   003C
        SLL     R0,     2                       ; D6D6   004C
        SUBR    R5,     R6                      ; D6D7   012E
        ADCR    R4                              ; D6D8   002C
        RSWD    R4                              ; D6D9   003C
        SUBR    R5,     R6                      ; D6DA   012E
        CMPR    R4,     R3                      ; D6DB   0163
        RRC     R0,     2                       ; D6DC   0074
        CMPR    R5,     R3                      ; D6DD   016B
        CMPR    R3,     R3                      ; D6DE   015B
        CMPR    R4,     R3                      ; D6DF   0163
        RRC     R0,     2                       ; D6E0   0074
        CMPR    R3,     R3                      ; D6E1   015B
        CMPR    R3,     R3                      ; D6E2   015B
        CMPR    R4,     R3                      ; D6E3   0163
        CMPR    R5,     R3                      ; D6E4   016B
        CMPR    R4,     R3                      ; D6E5   0163
        CMPR    R5,     R3                      ; D6E6   016B
        RRC     R0,     2                       ; D6E7   0074
        CMPR    R4,     R3                      ; D6E8   0163
        RRC     R0,     1                       ; D6E9   0070
        CMPR    R3,     R3                      ; D6EA   015B
        CMPR    R4,     R3                      ; D6EB   0163
        CMPR    R5,     R3                      ; D6EC   016B
        RRC     R0,     2                       ; D6ED   0074
        CMPR    R3,     R3                      ; D6EE   015B
        CMPR    R2,     R0                      ; D6EF   0150
        SUBR    R3,     R0                      ; D6F0   0118
        CMPR    R2,     R0                      ; D6F1   0150
        SUBR    R5,     R0                      ; D6F2   0128
        SUBR    R6,     R0                      ; D6F3   0130
        CMPR    R2,     R0                      ; D6F4   0150
        SUBR    R5,     R0                      ; D6F5   0128
        SUBR    R4,     R0                      ; D6F6   0120
        SUBR    R4,     R0                      ; D6F7   0120
        SUBR    R4,     R0                      ; D6F8   0120
        SUBR    R4,     R0                      ; D6F9   0120
        SUBR    R4,     R0                      ; D6FA   0120
        SUBR    R4,     R0                      ; D6FB   0120
        SUBR    R6,     R0                      ; D6FC   0130
        CMPR    R2,     R0                      ; D6FD   0150
        SUBR    R5,     R0                      ; D6FE   0128
        SUBR    R6,     R0                      ; D6FF   0130
        CMPR    R2,     R0                      ; D700   0150
        SUBR    R3,     R0                      ; D701   0118
        CMPR    R2,     R0                      ; D702   0150
        SUBR    R3,     R0                      ; D703   0118
        COMR    R0                              ; D704   0018
        RLC     R0,     1                       ; D705   0050
        SUBR    R3,     R0                      ; D706   0118
        RLC     R0,     1                       ; D707   0050
        COMR    R0                              ; D708   0018
        SUBR    R1,     R6                      ; D709   010E
        COMR    R0                              ; D70A   0018
        RLC     R0,     1                       ; D70B   0050
        COMR    R0                              ; D70C   0018
        SUBR    R3,     R0                      ; D70D   0118
        COMR    R0                              ; D70E   0018
        RLC     R0,     1                       ; D70F   0050
        SUBR    R1,     R6                      ; D710   010E
        RLC     R0,     1                       ; D711   0050
        COMR    R0                              ; D712   0018
        SUBR    R1,     R6                      ; D713   010E
        COMR    R0                              ; D714   0018
        SUBR    R3,     R0                      ; D715   0118
        COMR    R0                              ; D716   0018
        SUBR    R4,     R0                      ; D717   0120
        SUBR    R4,     R0                      ; D718   0120
        SUBR    R4,     R0                      ; D719   0120
        SUBR    R6,     R0                      ; D71A   0130
        RLC     R0,     1                       ; D71B   0050
        SUBR    R5,     R0                      ; D71C   0128
        SUBR    R6,     R0                      ; D71D   0130
        COMR    R0                              ; D71E   0018
        RLC     R0,     1                       ; D71F   0050
        SUBR    R5,     R0                      ; D720   0128
        SUBR    R4,     R0                      ; D721   0120
        SUBR    R6,     R0                      ; D722   0130
        SUBR    R5,     R0                      ; D723   0128
        SUBR    R6,     R0                      ; D724   0130
        RLC     R0,     1                       ; D725   0050
        SUBR    R5,     R0                      ; D726   0128
        SUBR    R6,     R0                      ; D727   0130
        SUBR    R5,     R0                      ; D728   0128
        SUBR    R4,     R0                      ; D729   0120
        SUBR    R6,     R0                      ; D72A   0130
        SUBR    R2,     R0                      ; D72B   0110
        CMPR    R1,     R0                      ; D72C   0148
        CMPR    R1,     R0                      ; D72D   0148
        SUBR    R2,     R0                      ; D72E   0110
        SUBR    R4,     R0                      ; D72F   0120
        SUBR    R4,     R0                      ; D730   0120
        SUBR    R4,     R0                      ; D731   0120
        SUBR    R6,     R0                      ; D732   0130
        SUBR    R5,     R0                      ; D733   0128
        SUBR    R2,     R0                      ; D734   0110
        CMPR    R1,     R0                      ; D735   0148
        SUBR    R7,     R0                      ; D736   0138
        CMPR    R0,     R0                      ; D737   0140
        CMPR    R1,     R0                      ; D738   0148
        SUBR    R2,     R0                      ; D739   0110
        CMPR    R1,     R0                      ; D73A   0148
        SUBR    R7,     R0                      ; D73B   0138
        CMPR    R0,     R0                      ; D73C   0140
        CMPR    R1,     R0                      ; D73D   0148
        SUBR    R7,     R0                      ; D73E   0138
L_D73F:
        PSHR    R5                              ; D73F   0275
        MOVR    R2,     R5                      ; D740   0095
L_D741:
        MVI@    R4,     R0                      ; D741   02A0
        MOVR    R0,     R1                      ; D742   0081
        ANDI    #$0300, R0                      ; D743   03B8 0300
        ANDI    #$00FF, R1                      ; D745   03B9 00FF
        SLL     R0,     2                       ; D747   004C
        SLL     R0,     2                       ; D748   004C
        XORR    R0,     R1                      ; D749   01C1
        SDBD                                    ; D74A   0001
        XORI    #$0800, R1                      ; D74B   03F9 0000 0008
        MVO@    R1,     R5                      ; D74E   0269
        DECR    R3                              ; D74F   0013
        BNEQ    L_D741                          ; D750   022C 0010
        PULR    R7                              ; D752   02B7

L_D753:
        PSHR    R5                              ; D753   0275
        MOVR    R3,     R5                      ; D754   009D
L_D755:
        MVI@    R5,     R0                      ; D755   02A8
        MVO@    R0,     R4                      ; D756   0260
        MVI@    R5,     R0                      ; D757   02A8
        MVO@    R0,     R4                      ; D758   0260
        MVI@    R5,     R0                      ; D759   02A8
        MVO@    R0,     R4                      ; D75A   0260
        MVI@    R5,     R0                      ; D75B   02A8
        MVO@    R0,     R4                      ; D75C   0260
        MVI@    R5,     R0                      ; D75D   02A8
        MVO@    R0,     R4                      ; D75E   0260
        MVI@    R5,     R0                      ; D75F   02A8
        MVO@    R0,     R4                      ; D760   0260
        MVI@    R5,     R0                      ; D761   02A8
        MVO@    R0,     R4                      ; D762   0260
        MVI@    R5,     R0                      ; D763   02A8
        MVO@    R0,     R4                      ; D764   0260
        DECR    R1                              ; D765   0011
        BNEQ    L_D755                          ; D766   022C 0012
        PULR    R7                              ; D768   02B7

L_D769:
        PSHR    R5                              ; D769   0275

        JSR     R5,     L_DB6B                  ; D76A   0004 01D8 036B

        MVI     G_0161, R0                      ; D76D   0280 0161
        CMPI    #$0008, R0                      ; D76F   0378 0008
        BEQ     L_D82D                          ; D771   0204 00BA

        CMPI    #$000F, R0                      ; D773   0378 000F
        BGE     L_D83B                          ; D775   020D 00C4

        CMPI    #$0007, R0                      ; D777   0378 0007
        BEQ     L_D859                          ; D779   0204 00DE

        CMPI    #$0003, R0                      ; D77B   0378 0003
        BEQ     L_D854                          ; D77D   0204 00D5

        TSTR    R0                              ; D77F   0080
        BNEQ    L_D82C                          ; D780   020C 00AA

        MVI     G_0168, R0                      ; D782   0280 0168
        TSTR    R0                              ; D784   0080
        BNEQ    L_D87D                          ; D785   020C 00F6

        MVI     G_0121, R1                      ; D787   0281 0121
        TSTR    R1                              ; D789   0089
        BNEQ    L_D8D5                          ; D78A   020C 0149

        MVI     G_0122, R1                      ; D78C   0281 0122
        TSTR    R1                              ; D78E   0089
        BNEQ    L_D8D5                          ; D78F   020C 0144

        MVI     G_011F, R1                      ; D791   0281 011F
        MOVR    R1,     R0                      ; D793   0088
        ANDI    #$0040, R0                      ; D794   03B8 0040
        BEQ     L_D79A                          ; D796   0204 0002

        MVI     G_0120, R1                      ; D798   0281 0120
L_D79A:
        MOVR    R1,     R0                      ; D79A   0088
        ANDI    #$00C0, R0                      ; D79B   03B8 00C0
        BNEQ    L_D8D1                          ; D79D   020C 0132

        CLRR    R0                              ; D79F   01C0
        MVO     R0,     G_031D                  ; D7A0   0240 031D
        MVII    #$000C, R0                      ; D7A2   02B8 000C

L_D7A4:
        JSR     R5,     .EXEC.629               ; D7A4   0004 0114 0229
        DECLE   $02BC,  $0164,  $0001,  $02A1   ; D7A7   02BC 0164 0001 02A1
        DECLE   $0001                           ; D7AB   0001

        MVI@    R4,     R2                      ; D7AC   02A2
        MVII    #$0080, R3                      ; D7AD   02BB 0080
        TSTR    R0                              ; D7AF   0080
        BPL     L_D7B6                          ; D7B0   0203 0004

        SDBD                                    ; D7B2   0001
        XORI    #$0400, R3                      ; D7B3   03FB 0000 0004
L_D7B6:
        MVI     G_0161, R5                      ; D7B6   0285 0161
        CMPI    #$0003, R5                      ; D7B8   037D 0003
        BNEQ    L_D7BE                          ; D7BA   020C 0002

        XORI    #$0080, R3                      ; D7BC   03FB 0080

L_D7BE:
        JSR     R5,     .EXEC.477               ; D7BE   0004 0114 0077

        MVII    #$0164, R4                      ; D7C1   02BC 0164
        MVO@    R1,     R4                      ; D7C3   0261
        SWAP    R1,     1                       ; D7C4   0041
        ANDI    #$00FF, R1                      ; D7C5   03B9 00FF
        MVI     G_0161, R5                      ; D7C7   0285 0161
        CMPI    #$0008, R5                      ; D7C9   037D 0008
        BEQ     L_D7D0                          ; D7CB   0204 0003

        TSTR    R5                              ; D7CD   00AD
        BNEQ    L_D7D8                          ; D7CE   020C 0008

L_D7D0:
        CMPI    #$0008, R1                      ; D7D0   0379 0008
        BLE     L_D7DA                          ; D7D2   0206 0006

        CMPI    #$00A0, R1                      ; D7D4   0379 00A0
        BGE     L_D7DA                          ; D7D6   020D 0002

L_D7D8:
        MVO@    R1,     R4                      ; D7D8   0261
        INCR    R7                              ; D7D9   000F

L_D7DA:
        INCR    R4                              ; D7DA   000C
L_D7DB:
        MVO@    R2,     R4                      ; D7DB   0262
        SWAP    R2,     1                       ; D7DC   0042
        ANDI    #$007F, R2                      ; D7DD   03BA 007F
        CMPI    #$0010, R2                      ; D7DF   037A 0010
        BLE     L_D7E8                          ; D7E1   0206 0005

        CMPI    #$0047, R2                      ; D7E3   037A 0047
        BGE     L_D7E8                          ; D7E5   020D 0001

        MVO@    R2,     R4                      ; D7E7   0262
L_D7E8:
        MVI     G_0165, R1                      ; D7E8   0281 0165
        MVI     G_0167, R2                      ; D7EA   0282 0167
        XORR    R3,     R2                      ; D7EC   01DA
        XORI    #$0300, R1                      ; D7ED   03F9 0300
        MVO     R1,     G_0322                  ; D7EF   0241 0322
        MVO     R1,     G_0326                  ; D7F1   0241 0326
        MVI     G_0161, R5                      ; D7F3   0285 0161
        MVO     R2,     G_0323                  ; D7F5   0242 0323
        MVO     R2,     G_0327                  ; D7F7   0242 0327
        CMPI    #$0003, R5                      ; D7F9   037D 0003
        BEQ     L_D801                          ; D7FB   0204 0004

        ADDI    #$0004, R1                      ; D7FD   02F9 0004
        B       L_D807                          ; D7FF   0200 0006

L_D801:
        ADDI    #$0001, R1                      ; D801   02F9 0001
        ADDI    #$0002, R2                      ; D803   02FA 0002
        XORI    #$0080, R2                      ; D805   03FA 0080
L_D807:
        MVO     R1,     G_031E                  ; D807   0241 031E
        MVO     R2,     G_031F                  ; D809   0242 031F
        CMPI    #$0003, R5                      ; D80B   037D 0003
        BEQ     L_D82C                          ; D80D   0204 001D

        MVII    #$0345, R4                      ; D80F   02BC 0345
        INCR    R7                              ; D811   000F

L_D812:
        PSHR    R5                              ; D812   0275
L_D813:
        MVI     G_0171, R5                      ; D813   0285 0171
        ANDI    #$0001, R5                      ; D815   03BD 0001
        BNEQ    L_D82C                          ; D817   020C 0013

        SDBD                                    ; D819   0001
        MVII    #$5E99, R1                      ; D81A   02B9 0099 005E
        MVI@    R4,     R0                      ; D81D   02A0
        DECR    R4                              ; D81E   0014
        ADDI    #$0010, R0                      ; D81F   02F8 0010
        CMPR    R1,     R0                      ; D821   0148
        BLT     L_D827                          ; D822   0205 0003

        SUBI    #$00C0, R1                      ; D824   0339 00C0
        MOVR    R1,     R0                      ; D826   0088
L_D827:
        MOVR    R0,     R1                      ; D827   0081
        ADDI    #$00D0, R1                      ; D828   02F9 00D0
        MVO@    R0,     R4                      ; D82A   0260
        MVO@    R1,     R4                      ; D82B   0261
L_D82C:
        PULR    R7                              ; D82C   02B7

L_D82D:
        MVI     G_0168, R0                      ; D82D   0280 0168
        TSTR    R0                              ; D82F   0080
        BNEQ    L_D87D                          ; D830   020C 004B

        MVI     G_01AF, R0                      ; D832   0280 01AF
        TSTR    R0                              ; D834   0080
        BNEQ    L_D8D5                          ; D835   020C 009E

        MVI     G_01B0, R1                      ; D837   0281 01B0
        B       L_D79A                          ; D839   0220 00A0

L_D83B:
        MVI     G_0162, R2                      ; D83B   0282 0162
        CMPI    #$005F, R2                      ; D83D   037A 005F
        BGT     L_D82C                          ; D83F   022E 0014

        CMPI    #$0009, R2                      ; D841   037A 0009
        BLT     L_D877                          ; D843   0205 0032

        CLRR    R1                              ; D845   01C9
        CMPI    #$000F, R0                      ; D846   0378 000F
        BGT     L_D84C                          ; D848   020E 0002

L_D84A:
        MVII    #$0008, R1                      ; D84A   02B9 0008
L_D84C:
        MVII    #$0016, R0                      ; D84C   02B8 0016
        MVO     R0,     G_0321                  ; D84E   0240 0321
        MVO     R0,     G_0325                  ; D850   0240 0325
        B       L_D7A4                          ; D852   0220 00AF

L_D854:
        CLRR    R1                              ; D854   01C9
        MVII    #$000A, R0                      ; D855   02B8 000A
        B       L_D7A4                          ; D857   0220 00B4

L_D859:
        MVI     G_0162, R2                      ; D859   0282 0162
        CMPI    #$004E, R2                      ; D85B   037A 004E
        BGE     L_D82C                          ; D85D   022D 0032

        MVI     G_01AC, R5                      ; D85F   0285 01AC
        MVII    #$0039, R0                      ; D861   02B8 0039
        TSTR    R5                              ; D863   00AD
        BNEQ    L_D868                          ; D864   020C 0002

        MVII    #$0040, R0                      ; D866   02B8 0040
L_D868:
        CMPR    R0,     R2                      ; D868   0142
        BGE     L_D84A                          ; D869   022D 0020

        MVII    #$000F, R1                      ; D86B   02B9 000F
        MVI     G_0167, R5                      ; D86D   0285 0167
        SUB     G_0170, R5                      ; D86F   0305 0170
        BMI     L_D875                          ; D871   020B 0002

        MVII    #$0001, R1                      ; D873   02B9 0001
L_D875:
        B       L_D84C                          ; D875   0220 002A

L_D877:
        CLRR    R0                              ; D877   01C0
        MVO     R0,     G_0321                  ; D878   0240 0321
        MVO     R0,     G_0325                  ; D87A   0240 0325
        PULR    R7                              ; D87C   02B7

L_D87D:
        DECR    R0                              ; D87D   0010
        MVO     R0,     G_0168                  ; D87E   0240 0168
        TSTR    R0                              ; D880   0080
        BNEQ    L_D886                          ; D881   020C 0003

        MVO     R0,     G_0169                  ; D883   0240 0169
        PULR    R7                              ; D885   02B7

L_D886:
        MVI     G_0169, R3                      ; D886   0283 0169
        TSTR    R3                              ; D888   009B
        BEQ     L_D82C                          ; D889   0224 005E

        MVI     G_016A, R0                      ; D88B   0280 016A
        MVI     G_0165, R2                      ; D88D   0282 0165
        MVI     G_0171, R3                      ; D88F   0283 0171
        MVII    #$0002, R5                      ; D891   02BD 0002
        CMPI    #$000F, R0                      ; D893   0378 000F
        BEQ     L_D8AC                          ; D895   0204 0015

        MVI     G_015F, R4                      ; D897   0284 015F
        CMPI    #$0004, R4                      ; D899   037C 0004
        BLT     L_D89E                          ; D89B   0205 0001

        INCR    R0                              ; D89D   0008
L_D89E:
        CMPR    R5,     R0                      ; D89E   0168
        BLT     L_D8B5                          ; D89F   0205 0014
        BEQ     L_D8AF                          ; D8A1   0204 000C

        CMPI    #$0004, R0                      ; D8A3   0378 0004
        BNEQ    L_D8AC                          ; D8A5   020C 0005

        CMPR    R5,     R3                      ; D8A7   016B
        BLE     L_D8B2                          ; D8A8   0206 0008
        B       L_D8B8                          ; D8AA   0200 000C

L_D8AC:
        CMPR    R5,     R3                      ; D8AC   016B
        BEQ     L_D8B2                          ; D8AD   0204 0003

L_D8AF:
        TSTR    R3                              ; D8AF   009B
        BNEQ    L_D8B8                          ; D8B0   020C 0006

L_D8B2:
        DECR    R2                              ; D8B2   0012
        B       L_D8B8                          ; D8B3   0200 0003

L_D8B5:
        CMPR    R3,     R0                      ; D8B5   0158
        BLT     L_D82C                          ; D8B6   0225 008B

L_D8B8:
        DECR    R2                              ; D8B8   0012
        CMPI    #$0008, R2                      ; D8B9   037A 0008
        BGT     L_D8C9                          ; D8BB   020E 000C

        MVII    #$0008, R2                      ; D8BD   02BA 0008
        CMPI    #$000F, R0                      ; D8BF   0378 000F
        BNEQ    L_D8C9                          ; D8C1   020C 0006

        CLRR    R0                              ; D8C3   01C0
        MVII    #$0168, R5                      ; D8C4   02BD 0168
        MVO@    R0,     R5                      ; D8C6   0268
        MVO@    R0,     R5                      ; D8C7   0268
        MVO@    R0,     R5                      ; D8C8   0268
L_D8C9:
        MVO     R2,     G_0165                  ; D8C9   0242 0165
        MVI     G_0323, R3                      ; D8CB   0283 0323
        ANDI    #$0380, R3                      ; D8CD   03BB 0380
        B       L_D7E8                          ; D8CF   0220 00E8

L_D8D1:
        ANDI    #$0040, R0                      ; D8D1   03B8 0040
        BNEQ    L_D8F3                          ; D8D3   020C 001E

L_D8D5:
        SDBD                                    ; D8D5   0001
        MVII    #$D625, R0                      ; D8D6   02B8 0025 00D6
        MVO     R0,     G_031D                  ; D8D9   0240 031D
        MVI     G_0323, R0                      ; D8DB   0280 0323
        SDBD                                    ; D8DD   0001
        ANDI    #$FBFF, R0                      ; D8DE   03B8 00FF 00FB
        MVO     R0,     G_0323                  ; D8E1   0240 0323
        MVO     R0,     G_0327                  ; D8E3   0240 0327
        XORI    #$0180, R0                      ; D8E5   03F8 0180
        MVO     R0,     G_031F                  ; D8E7   0240 031F
        SDBD                                    ; D8E9   0001
        MVII    #$18A8, R0                      ; D8EA   02B8 00A8 0018
        MVO     R0,     G_0320                  ; D8ED   0240 0320
        MVO     R0,     G_016B                  ; D8EF   0240 016B
        B       L_D8F6                          ; D8F1   0200 0003

L_D8F3:
        CLRR    R0                              ; D8F3   01C0
        MVO     R0,     G_031D                  ; D8F4   0240 031D
L_D8F6:
        SDBD                                    ; D8F6   0001
        MVII    #$5E99, R0                      ; D8F7   02B8 0099 005E
        MVII    #$0345, R4                      ; D8FA   02BC 0345
        B       L_D827                          ; D8FC   0220 00D6

L_D8FE:
        PSHR    R5                              ; D8FE   0275
        MOVR    R2,     R5                      ; D8FF   0095
        PSHR    R4                              ; D900   0274
        SDBD                                    ; D901   0001
        MVI@    R4,     R1                      ; D902   02A1
        SDBD                                    ; D903   0001
        MVI@    R4,     R2                      ; D904   02A2
        SDBD                                    ; D905   0001
        MVI@    R4,     R0                      ; D906   02A0
        MVO@    R1,     R5                      ; D907   0269
        MVO@    R2,     R5                      ; D908   026A
        MVO@    R0,     R5                      ; D909   0268
        SDBD                                    ; D90A   0001
        MVI@    R4,     R0                      ; D90B   02A0
        MVO@    R0,     R5                      ; D90C   0268
        MOVR    R5,     R2                      ; D90D   00AA
        PULR    R4                              ; D90E   02B4
        PULR    R7                              ; D90F   02B7

L_D910:
        PSHR    R5                              ; D910   0275
        MVI     G_0161, R0                      ; D911   0280 0161
        CMPI    #$0008, R0                      ; D913   0378 0008
        BEQ     L_D91A                          ; D915   0204 0003

        TSTR    R0                              ; D917   0080
        BNEQ    L_D82C                          ; D918   022C 00ED

L_D91A:
        MVI     G_033D, R3                      ; D91A   0283 033D
        MVI     G_033E, R1                      ; D91C   0281 033E
        MOVR    R3,     R0                      ; D91E   0098
        ANDR    R1,     R0                      ; D91F   0188
        XORR    R3,     R0                      ; D920   01D8
        XORR    R1,     R0                      ; D921   01C8
        ANDI    #$03F8, R0                      ; D922   03B8 03F8
        BEQ     L_D82C                          ; D924   0224 00F9

        MOVR    R0,     R1                      ; D926   0081
        ANDI    #$0030, R1                      ; D927   03B9 0030
        BNEQ    L_DA8C                          ; D929   020C 0161

L_D92B:
        ANDI    #$01C8, R0                      ; D92B   03B8 01C8
        BEQ     L_D82C                          ; D92D   0224 0102

        MOVR    R0,     R3                      ; D92F   0083
        ANDI    #$0008, R3                      ; D930   03BB 0008
        BEQ     L_D962                          ; D932   0204 002E

        MVI     G_0169, R3                      ; D934   0283 0169
        TSTR    R3                              ; D936   009B
        BNEQ    L_D962                          ; D937   020C 0029

        MVO     R3,     G_0329                  ; D939   0243 0329
        PSHR    R0                              ; D93B   0270

        JSR     R5,     L_F4F0                  ; D93C   0004 01F4 00F0

        MVI     G_0160, R4                      ; D93F   0284 0160
        MVII    #$0004, R3                      ; D941   02BB 0004
        ADD     G_015F, R3                      ; D943   02C3 015F
        CMPI    #$0005, R3                      ; D945   037B 0005
        BGT     L_D94B                          ; D947   020E 0002

        MVII    #$0005, R3                      ; D949   02BB 0005
L_D94B:
        ADD     G_01AE, R3                      ; D94B   02C3 01AE
        MVO     R3,     G_01AE                  ; D94D   0243 01AE
        MVII    #$0064, R3                      ; D94F   02BB 0064

        JSR     R5,     L_F437                  ; D951   0004 01F4 0037

L_D954:
        DECR    R4                              ; D954   0014
        BMI     L_D95E                          ; D955   020B 0007

        MVII    #$0032, R3                      ; D957   02BB 0032

        JSR     R5,     L_F437                  ; D959   0004 01F4 0037

        B       L_D954                          ; D95C   0220 0009

L_D95E:
        JSR     R5,     L_DD06                  ; D95E   0004 01DC 0106

        PULR    R0                              ; D961   02B0
L_D962:
        ANDI    #$00C0, R0                      ; D962   03B8 00C0
        BEQ     L_D998                          ; D964   0204 0032

        MVII    #$00FF, R4                      ; D966   02BC 00FF
        MVII    #$0339, R3                      ; D968   02BB 0339
        ANDI    #$0080, R0                      ; D96A   03B8 0080
        BNEQ    L_D971                          ; D96C   020C 0003

        MVII    #$0335, R3                      ; D96E   02BB 0335
        DECR    R4                              ; D970   0014
L_D971:
        CLRR    R2                              ; D971   01D2
        MVO@    R2,     R3                      ; D972   025A
        MVI     G_033D, R2                      ; D973   0282 033D
        ANDI    #$0100, R2                      ; D975   03BA 0100
        MVII    #$0003, R1                      ; D977   02B9 0003
        MVI     G_0169, R0                      ; D979   0280 0169
        TSTR    R0                              ; D97B   0080
        BNEQ    L_D993                          ; D97C   020C 0015

        MVI     G_015F, R0                      ; D97E   0280 015F
        CMPI    #$0005, R0                      ; D980   0378 0005
        BGE     L_DA66                          ; D982   020D 00E2

        MVI     G_031D, R0                      ; D984   0280 031D
        TSTR    R0                              ; D986   0080
        BEQ     L_DA66                          ; D987   0204 00DD

        MVII    #$0005, R3                      ; D989   02BB 0005

        JSR     R5,     L_F437                  ; D98B   0004 01F4 0037
        JSR     R5,     L_F4D5                  ; D98E   0004 01F4 00D5

        B       L_DA77                          ; D991   0200 00E4

L_D993:
        JSR     R5,     L_F55A                  ; D993   0004 01F4 015A

        B       L_DA77                          ; D996   0200 00DF

L_D998:
        MVI     G_0165, R2                      ; D998   0282 0165
        MVI     G_0167, R1                      ; D99A   0281 0167

        JSR     R5,     L_F251                  ; D99C   0004 01F0 0251

        MOVR    R2,     R1                      ; D99F   0091
        ADDI    #$0014, R1                      ; D9A0   02F9 0014
        MVII    #$0172, R3                      ; D9A2   02BB 0172
L_D9A4:
        MVI@    R3,     R0                      ; D9A4   0298
        CMPR    R1,     R0                      ; D9A5   0148
        BLT     L_D9AF                          ; D9A6   0205 0007

        SUBR    R1,     R0                      ; D9A8   0108
        CMPI    #$0002, R0                      ; D9A9   0378 0002
        BLE     L_D9BE                          ; D9AB   0206 0011
        B       L_D9B7                          ; D9AD   0200 0008

L_D9AF:
        CMPR    R2,     R0                      ; D9AF   0150
        BLT     L_D9B7                          ; D9B0   0205 0005

        SUBR    R2,     R0                      ; D9B2   0110
        CMPI    #$0002, R0                      ; D9B3   0378 0002
        BLE     L_D9BE                          ; D9B5   0206 0007

L_D9B7:
        ADDI    #$0003, R3                      ; D9B7   02FB 0003
        CMPI    #$01A2, R3                      ; D9B9   037B 01A2
        BLT     L_D9A4                          ; D9BB   0225 0018
        PULR    R7                              ; D9BD   02B7

L_D9BE:
        PSHR    R2                              ; D9BE   0272
        PSHR    R1                              ; D9BF   0271
        MOVR    R3,     R4                      ; D9C0   009C
        MVI@    R4,     R2                      ; D9C1   02A2

        JSR     R5,     L_F246                  ; D9C2   0004 01F0 0246

        INCR    R0                              ; D9C5   0008
        SLL     R0,     2                       ; D9C6   004C
        SLL     R0,     1                       ; D9C7   0048
        INCR    R3                              ; D9C8   000B
        SLL     R3,     2                       ; D9C9   004F
        SLL     R3,     1                       ; D9CA   004B
        MVII    #$0004, R1                      ; D9CB   02B9 0004
        SUB@    R4,     R1                      ; D9CD   0321
        SUBI    #$0002, R4                      ; D9CE   033C 0002
        ADDR    R1,     R3                      ; D9D0   00CB
        MVI     G_0167, R1                      ; D9D1   0281 0167
        MVI     G_0165, R2                      ; D9D3   0282 0165
        SUBR    R0,     R1                      ; D9D5   0101
        SDBD                                    ; D9D6   0001
        CMPI    #$FFFB, R1                      ; D9D7   0379 00FB 00FF
        BLT     L_DA87                          ; D9DA   0205 00AB

        CMPI    #$0006, R1                      ; D9DC   0379 0006
        BGT     L_DA87                          ; D9DE   020E 00A7

        SUBR    R3,     R2                      ; D9E0   011A
        SDBD                                    ; D9E1   0001
        CMPI    #$FFF7, R2                      ; D9E2   037A 00F7 00FF
        BLT     L_DA87                          ; D9E5   0205 00A0

        CMPI    #$0003, R2                      ; D9E7   037A 0003
        BGE     L_DA87                          ; D9E9   020D 009C

        PULR    R1                              ; D9EB   02B1
        PULR    R2                              ; D9EC   02B2
        CLRR    R1                              ; D9ED   01C9
        CLRR    R2                              ; D9EE   01D2
        MVI     G_0169, R0                      ; D9EF   0280 0169
        TSTR    R0                              ; D9F1   0080
        BNEQ    L_DA15                          ; D9F2   020C 0021

        MVI     G_015F, R0                      ; D9F4   0280 015F
        CMPI    #$0007, R0                      ; D9F6   0378 0007
        BLT     L_DA02                          ; D9F8   0205 0008

        CMPI    #$0178, R4                      ; D9FA   037C 0178
        BLT     L_DA1C                          ; D9FC   0205 001E

        CMPI    #$019F, R4                      ; D9FE   037C 019F
        BGE     L_DA1C                          ; DA00   020D 001A

L_DA02:
        MVI     G_031D, R0                      ; DA02   0280 031D
        TSTR    R0                              ; DA04   0080
        BEQ     L_DA1C                          ; DA05   0204 0015

        PSHR    R3                              ; DA07   0273
        MVII    #$0005, R3                      ; DA08   02BB 0005

        JSR     R5,     L_F437                  ; DA0A   0004 01F4 0037

        PSHR    R4                              ; DA0D   0274

        JSR     R5,     L_F4D5                  ; DA0E   0004 01F4 00D5

        PULR    R4                              ; DA11   02B4
        PULR    R3                              ; DA12   02B3
        B       L_DA5B                          ; DA13   0200 0046

L_DA15:
        PSHR    R4                              ; DA15   0274

        JSR     R5,     L_F55A                  ; DA16   0004 01F4 015A

        PULR    R4                              ; DA19   02B4
        B       L_DA5B                          ; DA1A   0200 003F

L_DA1C:
        PSHR    R4                              ; DA1C   0274
        ADDI    #$0002, R4                      ; DA1D   02FC 0002
        MVI@    R4,     R1                      ; DA1F   02A1
        SUBI    #$0172, R4                      ; DA20   033C 0172
        MVII    #$0019, R5                      ; DA22   02BD 0019
        CMPI    #$0001, R1                      ; DA24   0379 0001
        BGT     L_DA2F                          ; DA26   020E 0007

        MVII    #$0020, R5                      ; DA28   02BD 0020
        TSTR    R1                              ; DA2A   0089
        BNEQ    L_DA2F                          ; DA2B   020C 0002

        MVII    #$002B, R5                      ; DA2D   02BD 002B
L_DA2F:
        MVO     R4,     G_0169                  ; DA2F   0244 0169
        MVI     G_015F, R0                      ; DA31   0280 015F
        CMPI    #$0002, R0                      ; DA33   0378 0002
        BLT     L_DA43                          ; DA35   0205 000C

        CMPI    #$0006, R4                      ; DA37   037C 0006
        BLE     L_DA3F                          ; DA39   0206 0004

        CMPI    #$0030, R4                      ; DA3B   037C 0030
        BLT     L_DA43                          ; DA3D   0205 0004

L_DA3F:
        MVII    #$000F, R1                      ; DA3F   02B9 000F
        MVII    #$007F, R5                      ; DA41   02BD 007F
L_DA43:
        MVO     R5,     G_0168                  ; DA43   0245 0168
        MVO     R1,     G_016A                  ; DA45   0241 016A

        JSR     R5,     L_F4BA                  ; DA47   0004 01F4 00BA

        SDBD                                    ; DA4A   0001
        MVII    #$09F7, R0                      ; DA4B   02B8 00F7 0009
        MVO     R0,     G_0320                  ; DA4E   0240 0320
        MVII    #$003F, R0                      ; DA50   02B8 003F
        MVO     R0,     G_031D                  ; DA52   0240 031D
        SDBD                                    ; DA54   0001
        MVII    #$FADC, R0                      ; DA55   02B8 00DC 00FA
        MVO     R0,     G_034C                  ; DA58   0240 034C
        PULR    R4                              ; DA5A   02B4
L_DA5B:
        CLRR    R1                              ; DA5B   01C9
        MVI@    R4,     R3                      ; DA5C   02A3
        DECR    R4                              ; DA5D   0014
        MVO@    R1,     R4                      ; DA5E   0261
        ADDI    #$0213, R3                      ; DA5F   02FB 0213
        MVO@    R1,     R3                      ; DA61   0259
        INCR    R3                              ; DA62   000B
        MVO@    R1,     R3                      ; DA63   0259
        B       L_DA77                          ; DA64   0200 0011

L_DA66:
        MVO     R4,     G_0169                  ; DA66   0244 0169
        MVO     R1,     G_016A                  ; DA68   0241 016A

        JSR     R5,     L_F4BA                  ; DA6A   0004 01F4 00BA

        SDBD                                    ; DA6D   0001
        MVII    #$09F7, R0                      ; DA6E   02B8 00F7 0009
        MVO     R0,     G_0320                  ; DA71   0240 0320
        MVII    #$003F, R0                      ; DA73   02B8 003F
        MVO     R0,     G_031D                  ; DA75   0240 031D
L_DA77:
        MVI     G_0168, R0                      ; DA77   0280 0168
        MOVR    R0,     R1                      ; DA79   0081
        ADDI    #$0006, R1                      ; DA7A   02F9 0006
        TSTR    R0                              ; DA7C   0080
        BNEQ    L_DA81                          ; DA7D   020C 0002

        MVII    #$0014, R1                      ; DA7F   02B9 0014
L_DA81:
        MVO     R1,     G_0168                  ; DA81   0241 0168
        TSTR    R2                              ; DA83   0092
        BNEQ    L_D998                          ; DA84   022C 00ED
        PULR    R7                              ; DA86   02B7

L_DA87:
        PULR    R1                              ; DA87   02B1
        PULR    R2                              ; DA88   02B2
        MOVR    R4,     R3                      ; DA89   00A3
        B       L_D9B7                          ; DA8A   0220 00D4

L_DA8C:
        MVI     G_0168, R1                      ; DA8C   0281 0168
        TSTR    R1                              ; DA8E   0089
        BNEQ    L_D92B                          ; DA8F   022C 0165

        MVI     G_0165, R1                      ; DA91   0281 0165
        SUB     G_016E, R1                      ; DA93   0301 016E
        BPL     L_DA98                          ; DA95   0203 0001

        NEGR    R1                              ; DA97   0021
L_DA98:
        CMPI    #$000C, R1                      ; DA98   0379 000C
        BGT     L_D92B                          ; DA9A   022E 0170

        MVI     G_0161, R0                      ; DA9C   0280 0161
        CMPI    #$0008, R0                      ; DA9E   0378 0008
        BEQ     L_DAA3                          ; DAA0   0204 0001

        CLRR    R0                              ; DAA2   01C0
L_DAA3:
        XORI    #$0002, R0                      ; DAA3   03F8 0002
        MVO     R0,     G_0161                  ; DAA5   0240 0161
        MVI     G_0160, R2                      ; DAA7   0282 0160
L_DAA9:
        MVII    #$01F4, R3                      ; DAA9   02BB 01F4

        JSR     R5,     L_F437                  ; DAAB   0004 01F4 0037

        DECR    R2                              ; DAAE   0012
        BPL     L_DAA9                          ; DAAF   0223 0007

        JSR     R5,     L_F437                  ; DAB1   0004 01F4 0037

        MVI     G_016B, R0                      ; DAB4   0280 016B
        TSTR    R0                              ; DAB6   0080
        BNEQ    L_DABE                          ; DAB7   020C 0005

        MVII    #$03E8, R3                      ; DAB9   02BB 03E8

        JSR     R5,     L_F437                  ; DABB   0004 01F4 0037

L_DABE:
        CLRR    R2                              ; DABE   01D2
        CLRR    R5                              ; DABF   01ED
        MVI     G_0165, R0                      ; DAC0   0280 0165
        CMPI    #$0099, R0                      ; DAC2   0378 0099
        BGE     L_DB1C                          ; DAC4   020D 0056

        MVII    #$0094, R1                      ; DAC6   02B9 0094
        CMPR    R1,     R0                      ; DAC8   0148
        BLT     L_DAD0                          ; DAC9   0205 0005

        MOVR    R1,     R0                      ; DACB   0088
L_DACC:
        MVO     R0,     G_0165                  ; DACC   0240 0165
        MVO     R5,     G_01AC                  ; DACE   0245 01AC
L_DAD0:
        MVI     G_0167, R1                      ; DAD0   0281 0167
        XORI    #$0200, R0                      ; DAD2   03F8 0200
        XORI    #$0080, R1                      ; DAD4   03F9 0080
        XORR    R2,     R1                      ; DAD6   01D1
        MVII    #$0322, R4                      ; DAD7   02BC 0322
        MVO@    R0,     R4                      ; DAD9   0260
        MVO@    R1,     R4                      ; DADA   0261
        ADDI    #$0002, R4                      ; DADB   02FC 0002
        MVO@    R0,     R4                      ; DADD   0260
        MVO@    R1,     R4                      ; DADE   0261
        MVII    #$031E, R4                      ; DADF   02BC 031E
        ADDI    #$0003, R0                      ; DAE1   02F8 0003
        TSTR    R2                              ; DAE3   0092
        BEQ     L_DAE8                          ; DAE4   0204 0002

        SUBI    #$0006, R0                      ; DAE6   0338 0006
L_DAE8:
        MVO@    R0,     R4                      ; DAE8   0260
        MVO@    R1,     R4                      ; DAE9   0261
        SDBD                                    ; DAEA   0001
        MVII    #$19A0, R3                      ; DAEB   02BB 00A0 0019
        MVO@    R3,     R4                      ; DAEE   0263
        MVO     R0,     G_031D                  ; DAEF   0240 031D
        MVII    #$0336, R4                      ; DAF1   02BC 0336
        ADDI    #$0005, R0                      ; DAF3   02F8 0005
        TSTR    R2                              ; DAF5   0092
        BEQ     L_DAFA                          ; DAF6   0204 0002

        SUBI    #$000A, R0                      ; DAF8   0338 000A
L_DAFA:
        MVO@    R0,     R4                      ; DAFA   0260
        MVO@    R1,     R4                      ; DAFB   0261
        ADDI    #$0010, R3                      ; DAFC   02FB 0010
        MVO@    R3,     R4                      ; DAFE   0263
        MVII    #$0001, R5                      ; DAFF   02BD 0001
        MVO     R5,     G_0335                  ; DB01   0245 0335
        MVII    #$032E, R4                      ; DB03   02BC 032E
        ADDI    #$0004, R0                      ; DB05   02F8 0004
        TSTR    R2                              ; DB07   0092
        BEQ     L_DB0C                          ; DB08   0204 0002

        SUBI    #$0007, R0                      ; DB0A   0338 0007
L_DB0C:
        MVO@    R0,     R4                      ; DB0C   0260
        ADDI    #$0003, R4                      ; DB0D   02FC 0003
        MVO@    R0,     R4                      ; DB0F   0260
        ANDI    #$00FF, R0                      ; DB10   03B8 00FF
        MVO     R0,     G_016E                  ; DB12   0240 016E
        MVII    #$0064, R0                      ; DB14   02B8 0064
        MVO     R0,     G_0162                  ; DB16   0240 0162

        JSR     R5,     L_F6C4                  ; DB18   0004 01F4 02C4

        PULR    R7                              ; DB1B   02B7

L_DB1C:
        MVII    #$009F, R0                      ; DB1C   02B8 009F
        SDBD                                    ; DB1E   0001
        MVII    #$0400, R2                      ; DB1F   02BA 0000 0004
        INCR    R5                              ; DB22   000D
        B       L_DACC                          ; DB23   0220 0058

L_DB25:
        PSHR    R5                              ; DB25   0275
        MVI     G_0161, R0                      ; DB26   0280 0161
        TSTR    R0                              ; DB28   0080
        BNEQ    L_D82C                          ; DB29   022C 02FE

        MVI     G_01AE, R0                      ; DB2B   0280 01AE
        TSTR    R0                              ; DB2D   0080
        BNEQ    L_D82C                          ; DB2E   022C 0303

        JSR     R5,     L_F5DE                  ; DB30   0004 01F4 01DE

        SDBD                                    ; DB33   0001
        MVII    #$5E99, R0                      ; DB34   02B8 0099 005E
        MVO     R0,     G_0345                  ; DB37   0240 0345
        ADDI    #$00D0, R0                      ; DB39   02F8 00D0
        MVO     R0,     G_0346                  ; DB3B   0240 0346
        SDBD                                    ; DB3D   0001
        MVII    #$FEBC, R0                      ; DB3E   02B8 00BC 00FE
        MVO     R0,     G_034C                  ; DB41   0240 034C
        MVII    #$031E, R5                      ; DB43   02BD 031E
        MVII    #$0322, R4                      ; DB45   02BC 0322
        MVI@    R4,     R0                      ; DB47   02A0
        MVO@    R0,     R5                      ; DB48   0268
        MVI@    R4,     R0                      ; DB49   02A0
        DECR    R4                              ; DB4A   0014
        MOVR    R0,     R1                      ; DB4B   0081
        XORI    #$0080, R0                      ; DB4C   03F8 0080
        ADDI    #$0002, R1                      ; DB4E   02F9 0002
        MVO@    R1,     R5                      ; DB50   0269
        MVO@    R0,     R4                      ; DB51   0260
        ADDI    #$0003, R4                      ; DB52   02FC 0003
        MVO@    R0,     R4                      ; DB54   0260
        SDBD                                    ; DB55   0001
        MVII    #$09F7, R0                      ; DB56   02B8 00F7 0009
        MVO@    R0,     R5                      ; DB59   0268
        MVII    #$007F, R0                      ; DB5A   02B8 007F
        MVO     R0,     G_031D                  ; DB5C   0240 031D
        MVII    #$0003, R0                      ; DB5E   02B8 0003
        MVII    #$0008, R1                      ; DB60   02B9 0008
L_DB62:
        MVO     R1,     G_01B3                  ; DB62   0241 01B3
        MVO     R0,     G_0161                  ; DB64   0240 0161
        MVII    #$005D, R0                      ; DB66   02B8 005D
        MVO     R0,     G_0162                  ; DB68   0240 0162
        PULR    R7                              ; DB6A   02B7

L_DB6B:
        PSHR    R5                              ; DB6B   0275
        MVI     G_0161, R0                      ; DB6C   0280 0161
        ANDI    #$0002, R0                      ; DB6E   03B8 0002
        BEQ     L_D82C                          ; DB70   0224 0345

        MVI     G_0162, R0                      ; DB72   0280 0162
        DECR    R0                              ; DB74   0010
        BMI     L_DBCB                          ; DB75   020B 0054

        MVO     R0,     G_0162                  ; DB77   0240 0162
        MVI     G_0161, R0                      ; DB79   0280 0161
        CMPI    #$0002, R0                      ; DB7B   0378 0002
        BEQ     L_DB83                          ; DB7D   0204 0004

        CMPI    #$000A, R0                      ; DB7F   0378 000A
        BNEQ    L_D82C                          ; DB81   022C 0356

L_DB83:
        MVI     G_0163, R0                      ; DB83   0280 0163
        INCR    R0                              ; DB85   0008
        CMPI    #$0003, R0                      ; DB86   0378 0003
        BLT     L_DB8B                          ; DB88   0205 0001

        CLRR    R0                              ; DB8A   01C0
L_DB8B:
        MVO     R0,     G_0163                  ; DB8B   0240 0163
        MVI     G_0171, R0                      ; DB8D   0280 0171
        ANDI    #$0001, R0                      ; DB8F   03B8 0001
        BNEQ    L_DBAB                          ; DB91   020C 0018

        MVII    #$0345, R4                      ; DB93   02BC 0345
        SDBD                                    ; DB95   0001
        MVII    #$FA5C, R1                      ; DB96   02B9 005C 00FA
        MVI@    R4,     R0                      ; DB99   02A0
        DECR    R4                              ; DB9A   0014
        ADDI    #$0010, R0                      ; DB9B   02F8 0010
        CMPR    R1,     R0                      ; DB9D   0148
        BLT     L_DBA3                          ; DB9E   0205 0003

        SUBI    #$0040, R1                      ; DBA0   0339 0040
        MOVR    R1,     R0                      ; DBA2   0088
L_DBA3:
        MOVR    R0,     R1                      ; DBA3   0081
        ADDI    #$0040, R1                      ; DBA4   02F9 0040
        MVO@    R0,     R4                      ; DBA6   0260
        MVO@    R1,     R4                      ; DBA7   0261
        ADDI    #$0040, R1                      ; DBA8   02F9 0040
        MVO@    R1,     R4                      ; DBAA   0261
L_DBAB:
        MVI     G_0163, R0                      ; DBAB   0280 0163
        TSTR    R0                              ; DBAD   0080
        BNEQ    L_D82C                          ; DBAE   022C 0383

        MVII    #$0349, R4                      ; DBB0   02BC 0349
        SDBD                                    ; DBB2   0001
        MVII    #$FA5C, R1                      ; DBB3   02B9 005C 00FA
        MVI@    R4,     R0                      ; DBB6   02A0
        DECR    R4                              ; DBB7   0014
        ADDI    #$0010, R0                      ; DBB8   02F8 0010
        CMPR    R1,     R0                      ; DBBA   0148
        BLT     L_DBC0                          ; DBBB   0205 0003

        SUBI    #$0040, R1                      ; DBBD   0339 0040
        MOVR    R1,     R0                      ; DBBF   0088
L_DBC0:
        MOVR    R0,     R1                      ; DBC0   0081
        ADDI    #$0040, R1                      ; DBC1   02F9 0040
        MVO@    R0,     R4                      ; DBC3   0260
        MVO@    R1,     R4                      ; DBC4   0261
        ADDI    #$0040, R1                      ; DBC5   02F9 0040
        SUBI    #$0003, R4                      ; DBC7   033C 0003
        MVO@    R1,     R4                      ; DBC9   0261
        PULR    R7                              ; DBCA   02B7

L_DBCB:
        MVI     G_0161, R0                      ; DBCB   0280 0161
        CMPI    #$000A, R0                      ; DBCD   0378 000A
        BNEQ    L_DBD4                          ; DBCF   020C 0003
        J       L_D26B                          ; DBD1   0004 03D0 026B

L_DBD4:
        CMPI    #$0003, R0                      ; DBD4   0378 0003
        BEQ     L_DC49                          ; DBD6   0204 0071

        CMPI    #$0002, R0                      ; DBD8   0378 0002
        BEQ     L_DBF0                          ; DBDA   0204 0014

        CMPI    #$001F, R0                      ; DBDC   0378 001F
        BEQ     L_DBED                          ; DBDE   0204 000D

        MVI     G_0160, R1                      ; DBE0   0281 0160
        INCR    R1                              ; DBE2   0009
        CMPI    #$0003, R1                      ; DBE3   0379 0003
        BGE     L_DC31                          ; DBE5   020D 004A

        MVO     R1,     G_0160                  ; DBE7   0241 0160
        CMPI    #$0002, R1                      ; DBE9   0379 0002
        BEQ     L_DC2D                          ; DBEB   0204 0040
L_DBED:
        J       L_D4E2                          ; DBED   0004 03D4 00E2

L_DBF0:
        JSR     R5,     L_DBF9                  ; DBF0   0004 01D8 03F9

        RRC     R3,     2                       ; DBF3   0077
        ADDR    R6,     R5                      ; DBF4   00F5
        EIS                                     ; DBF5   0002
        ADDR    R2,     R3                      ; DBF6   00D3
        ADDR    R7,     R4                      ; DBF7   00FC
        ADDR    R2,     R2                      ; DBF8   00D2
L_DBF9:
        ADD     G_0160, R5                      ; DBF9   02C5 0160
        ADD     G_0160, R5                      ; DBFB   02C5 0160
        SDBD                                    ; DBFD   0001
        MVI@    R5,     R4                      ; DBFE   02AC
        SDBD                                    ; DBFF   0001
        MVII    #$DC04, R5                      ; DC00   02BD 0004 00DC
        MOVR    R4,     R7                      ; DC03   00A7

        MVII    #$0345, R4                      ; DC04   02BC 0345
        SDBD                                    ; DC06   0001
        MVII    #$5DD9, R0                      ; DC07   02B8 00D9 005D
        SDBD                                    ; DC0A   0001
        MVII    #$5EA9, R1                      ; DC0B   02B9 00A9 005E
        MVO@    R0,     R4                      ; DC0E   0260
        MVO@    R1,     R4                      ; DC0F   0261
        ADDI    #$0002, R4                      ; DC10   02FC 0002
        MVO@    R0,     R4                      ; DC12   0260
        MVO@    R1,     R4                      ; DC13   0261
        CLRR    R0                              ; DC14   01C0
        MVO     R0,     G_0335                  ; DC15   0240 0335
        MVO     R0,     G_031D                  ; DC17   0240 031D
        MVII    #$0005, R2                      ; DC19   02BA 0005
        MVII    #$0009, R1                      ; DC1B   02B9 0009
        MVI     G_0167, R0                      ; DC1D   0280 0167
        CMPI    #$0033, R0                      ; DC1F   0378 0033
        BLT     L_DC26                          ; DC21   0205 0003

        MVII    #$0007, R1                      ; DC23   02B9 0007
        NEGR    R2                              ; DC25   0022
L_DC26:
        ADDR    R2,     R0                      ; DC26   00D0
        MVO     R0,     G_0170                  ; DC27   0240 0170
        MVII    #$0007, R0                      ; DC29   02B8 0007
        B       L_DB62                          ; DC2B   0220 00CA

L_DC2D:
        MVII    #$001F, R0                      ; DC2D   02B8 001F
        B       L_DC37                          ; DC2F   0200 0006

L_DC31:
        CMPI    #$000F, R0                      ; DC31   0378 000F
        BEQ     L_DC41                          ; DC33   0204 000C

        MVII    #$000F, R0                      ; DC35   02B8 000F
L_DC37:
        MVO     R0,     G_0161                  ; DC37   0240 0161

        JSR     R5,     L_F8C8                  ; DC39   0004 01F8 00C8

        MVII    #$0078, R0                      ; DC3C   02B8 0078
        MVO     R0,     G_0162                  ; DC3E   0240 0162
        PULR    R7                              ; DC40   02B7

L_DC41:
        MVI     G_015F, R0                      ; DC41   0280 015F
        INCR    R0                              ; DC43   0008
        MVO     R0,     G_015F                  ; DC44   0240 015F
        J       L_50F1                          ; DC46   0004 0350 00F1

L_DC49:
        MVI     G_015D, R0                      ; DC49   0280 015D
        DECR    R0                              ; DC4B   0010
        MVO     R0,     G_015D                  ; DC4C   0240 015D
        BPL     L_DC53                          ; DC4E   0203 0003
        J       L_50AD                          ; DC50   0004 0350 00AD
L_DC53:
        J       L_50EE                          ; DC53   0004 0350 00EE

        PSHR    R5                              ; DC56   0275
        MVI     G_0102, R1                      ; DC57   0281 0102
        SWAP    R1,     1                       ; DC59   0041
        SWAP    R1,     1                       ; DC5A   0041
        BMI     L_DC78                          ; DC5B   020B 001B

        JSR     R5,     L_DC7B                  ; DC5D   0004 01DC 007B

        MVII    #$011F, R1                      ; DC60   02B9 011F
        MVI     .PSG0.lft_hand,R2               ; DC62   0282 01FF

        JSR     R5,     .EXEC.52F               ; DC64   0004 0114 012F

        MVII    #$0120, R1                      ; DC67   02B9 0120
        MVI     .PSG0.rgt_hand,R2               ; DC69   0282 01FE

        JSR     R5,     .EXEC.52F               ; DC6B   0004 0114 012F
        JSR     R5,     L_DCE2                  ; DC6E   0004 01DC 00E2
        JSR     R5,     X_PLAY_NOTE             ; DC71   0004 0118 02BD
        JSR     R5,     L_F532                  ; DC74   0004 01F4 0132

        PULR    R7                              ; DC77   02B7
L_DC78:
        J       .EXEC.0BE                       ; DC78   0004 0310 00BE

L_DC7B:
        PSHR    R5                              ; DC7B   0275
        DECR    R1                              ; DC7C   0011
        BMI     L_DCD3                          ; DC7D   020B 0054

        MVO     R1,     G_0102                  ; DC7F   0241 0102
        TSTR    R1                              ; DC81   0089
        BEQ     L_DCD6                          ; DC82   0204 0052

        CLRR    R3                              ; DC84   01DB
        MVII    #$031D, R4                      ; DC85   02BC 031D
L_DC87:
        MVI@    R4,     R1                      ; DC87   02A1
        MVI@    R4,     R0                      ; DC88   02A0
        TSTR    R1                              ; DC89   0089
        BNEQ    L_DC8E                          ; DC8A   020C 0002

        MVII    #$00FF, R0                      ; DC8C   02B8 00FF
L_DC8E:
        MVO@    R0,     R3                      ; DC8E   0258
        ADDI    #$0008, R3                      ; DC8F   02FB 0008
        MVI@    R4,     R0                      ; DC91   02A0
        MVO@    R0,     R3                      ; DC92   0258
        ADDI    #$0008, R3                      ; DC93   02FB 0008
        MVI@    R4,     R0                      ; DC95   02A0
        MVO@    R0,     R3                      ; DC96   0258
        SUBI    #$000F, R3                      ; DC97   033B 000F
        CMPI    #$0008, R3                      ; DC99   037B 0008
        BLT     L_DC87                          ; DC9B   0225 0015

L_DC9D:
        CLRR    R0                              ; DC9D   01C0
        MVO     R0,     .STIC.C.1               ; DC9E   0240 0019
        MVO     R0,     .STIC.C.2               ; DCA0   0240 001A
        MVO     R0,     .STIC.VIDEN             ; DCA2   0240 0020
        MVI     G_0102, R1                      ; DCA4   0281 0102
        SLL     R1,     2                       ; DCA6   004D
        MVII    #$0345, R3                      ; DCA7   02BB 0345
        ADDR    R1,     R3                      ; DCA9   00CB
        SDBD                                    ; DCAA   0001
        MVII    #$3980, R5                      ; DCAB   02BD 0080 0039
        SLL     R1,     2                       ; DCAE   004D
        SLL     R1,     2                       ; DCAF   004D
        ADDR    R1,     R5                      ; DCB0   00CD
        MVII    #$0004, R0                      ; DCB1   02B8 0004
L_DCB3:
        MVI@    R3,     R4                      ; DCB3   029C
        TSTR    R4                              ; DCB4   00A4
        BEQ     L_DCCE                          ; DCB5   0204 0017

        MOVR    R3,     R2                      ; DCB7   009A
L_DCB8:
        MVI@    R4,     R1                      ; DCB8   02A1
        MVO@    R1,     R5                      ; DCB9   0269
        MVI@    R4,     R1                      ; DCBA   02A1
        MVO@    R1,     R5                      ; DCBB   0269
        MVI@    R4,     R1                      ; DCBC   02A1
        MVO@    R1,     R5                      ; DCBD   0269
        MVI@    R4,     R1                      ; DCBE   02A1
        MVO@    R1,     R5                      ; DCBF   0269
        MVI@    R4,     R1                      ; DCC0   02A1
        MVO@    R1,     R5                      ; DCC1   0269
        MVI@    R4,     R1                      ; DCC2   02A1
        MVO@    R1,     R5                      ; DCC3   0269
        MVI@    R4,     R1                      ; DCC4   02A1
        MVO@    R1,     R5                      ; DCC5   0269
        MVI@    R4,     R1                      ; DCC6   02A1
        MVO@    R1,     R5                      ; DCC7   0269
        TSTR    R2                              ; DCC8   0092
        BEQ     L_DCCE                          ; DCC9   0204 0003

        CLRR    R2                              ; DCCB   01D2
        B       L_DCB8                          ; DCCC   0220 0015

L_DCCE:
        INCR    R3                              ; DCCE   000B
        DECR    R0                              ; DCCF   0010
        BNEQ    L_DCB3                          ; DCD0   022C 001E
L_DCD2:
        PULR    R7                              ; DCD2   02B7

L_DCD3:
        MVO     R0,     .STIC.VIDEN             ; DCD3   0240 0020
        PULR    R7                              ; DCD5   02B7

L_DCD6:
        MVII    #$033D, R4                      ; DCD6   02BC 033D
        MVII    #$001A, R5                      ; DCD8   02BD 001A
        MVI@    R5,     R0                      ; DCDA   02A8
        MVO@    R0,     R4                      ; DCDB   0260
        SUBI    #$0002, R5                      ; DCDC   033D 0002
        MVI@    R5,     R0                      ; DCDE   02A8
        MVO@    R0,     R4                      ; DCDF   0260
        B       L_DC9D                          ; DCE0   0220 0044

L_DCE2:
        PSHR    R5                              ; DCE2   0275
        MVI     G_0161, R0                      ; DCE3   0280 0161
        CMPI    #$0008, R0                      ; DCE5   0378 0008
        BEQ     L_DCEC                          ; DCE7   0204 0003

        TSTR    R0                              ; DCE9   0080
        BNEQ    L_DCD2                          ; DCEA   022C 0019

L_DCEC:
        MVI     G_0102, R0                      ; DCEC   0280 0102
        SWAP    R0,     1                       ; DCEE   0040
        SWAP    R0,     1                       ; DCEF   0040
        BMI     L_DCD2                          ; DCF0   022B 001F

        MVI     G_01AD, R0                      ; DCF2   0280 01AD
        DECR    R0                              ; DCF4   0010
        BPL     L_DD21                          ; DCF5   0203 002A

        MVI     G_01AE, R1                      ; DCF7   0281 01AE
        DECR    R1                              ; DCF9   0011
        BMI     L_DD07                          ; DCFA   020B 000B

        MVO     R1,     G_01AE                  ; DCFC   0241 01AE
        CMPI    #$000A, R1                      ; DCFE   0379 000A
        BGT     L_DD07                          ; DD00   020E 0005

        JSR     R5,     L_F53E                  ; DD02   0004 01F4 013E

        INCR    R7                              ; DD05   000F

L_DD06:
        PSHR    R5                              ; DD06   0275
L_DD07:
        MVI     G_01AE, R0                      ; DD07   0280 01AE
        MVII    #$0003, R1                      ; DD09   02B9 0003
        MVII    #$0007, R3                      ; DD0B   02BB 0007
        MVI     G_0160, R5                      ; DD0D   0285 0160
        TSTR    R5                              ; DD0F   00AD
        BEQ     L_DD1A                          ; DD10   0204 0008

        MVII    #$0003, R3                      ; DD12   02BB 0003
        CMPI    #$0002, R5                      ; DD14   037D 0002
        BNEQ    L_DD1A                          ; DD16   020C 0002

        MVII    #$0002, R3                      ; DD18   02BB 0002
L_DD1A:
        MVII    #$02DD, R4                      ; DD1A   02BC 02DD

        JSR     R5,     X_PRNUM_RGT             ; DD1C   0004 0118 00C5

        MVII    #$003C, R0                      ; DD1F   02B8 003C
L_DD21:
        MVO     R0,     G_01AD                  ; DD21   0240 01AD
        PULR    R7                              ; DD23   02B7

L_DD24:
        PSHR    R5                              ; DD24   0275
        SDBD                                    ; DD25   0001
        MVII    #$DD34, R0                      ; DD26   02B8 0034 00DD
        MVII    #$0100, R4                      ; DD29   02BC 0100
        MOVR    R4,     R5                      ; DD2B   00A5
        DIS                                     ; DD2C   0003
        SDBD                                    ; DD2D   0001
        MVI@    R4,     R1                      ; DD2E   02A1
        MVO@    R0,     R5                      ; DD2F   0268
        SWAP    R0,     1                       ; DD30   0040
        MVO@    R0,     R5                      ; DD31   0268
        EIS                                     ; DD32   0002
L_DD33:
        DECR    R7                              ; DD33   0017

        SUBI    #$0008, R6                      ; DD34   033E 0008
        MVO     R1,     .ISRVEC.0               ; DD36   0241 0100
        SWAP    R1,     1                       ; DD38   0041
        MVO     R1,     .ISRVEC.1               ; DD39   0241 0101
        PULR    R7                              ; DD3B   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; DD3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD60   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD68   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD70   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD7C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDBC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDCC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDD4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDD8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDDC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDFC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE00   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE08   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE28   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE30   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE60   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE68   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE70   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE7C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DE9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEBC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DECC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DED0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DED4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DED8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEDC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DEFC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF00   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF08   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF28   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF30   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF60   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF68   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF70   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF7C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DF9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFBC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFCC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFD4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFD8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFDC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFFC   0000 0000 0000 0000

        ORG     $F000
L_F000:
        PSHR    R5                              ; F000   0275
        MVI     G_0161, R0                      ; F001   0280 0161
        ANDI    #$0001, R0                      ; F003   03B8 0001
        BNEQ    L_F09C                          ; F005   020C 0095

        MVI     G_0161, R0                      ; F007   0280 0161
        CMPI    #$0002, R0                      ; F009   0378 0002
        BEQ     L_F0C8                          ; F00B   0204 00BB

        CMPI    #$000A, R0                      ; F00D   0378 000A
        BEQ     L_F0C8                          ; F00F   0204 00B7

        CMPI    #$0008, R0                      ; F011   0378 0008
        BEQ     L_F018                          ; F013   0204 0003

        TSTR    R0                              ; F015   0080
        BNEQ    L_F091                          ; F016   020C 0079

L_F018:
        JSR     R5,     L_F0EA                  ; F018   0004 01F0 00EA

        ADDI    #$0009, R3                      ; F01B   02FB 0009
        MVI     G_0170, R1                      ; F01D   0281 0170
        MVII    #$0004, R0                      ; F01F   02B8 0004
        CMPI    #$000C, R3                      ; F021   037B 000C
        BGT     L_F027                          ; F023   020E 0002

        MVII    #$0003, R0                      ; F025   02B8 0003

L_F027:
        JSR     R5,     X_RAND1                 ; F027   0004 0114 027D

        MVI     G_0161, R5                      ; F02A   0285 0161
        CMPI    #$0008, R5                      ; F02C   037D 0008
        BNEQ    L_F032                          ; F02E   020C 0002

        MVII    #$0003, R0                      ; F030   02B8 0003
L_F032:
        MVII    #$000C, R4                      ; F032   02BC 000C
        MVI     G_0167, R2                      ; F034   0282 0167
        SUBR    R1,     R2                      ; F036   010A
        CMPR    R3,     R2                      ; F037   015A
        BGT     L_F092                          ; F038   020E 0058

        NEGR    R3                              ; F03A   0023
        SUBI    #$0008, R3                      ; F03B   033B 0008
        CMPR    R3,     R2                      ; F03D   015A
        BLT     L_F097                          ; F03E   0205 0057

L_F040:
        CMPI    #$000E, R1                      ; F040   0379 000E
        BLT     L_F04A                          ; F042   0205 0006

        CMPI    #$004A, R1                      ; F044   0379 004A
        BLT     L_F04C                          ; F046   0205 0004

L_F048:
        MVII    #$0004, R4                      ; F048   02BC 0004
L_F04A:
        MVO     R4,     G_016C                  ; F04A   0244 016C
L_F04C:
        MVI     G_016C, R1                      ; F04C   0281 016C
        MVII    #$0012, R0                      ; F04E   02B8 0012
        MVI     G_015F, R5                      ; F050   0285 015F
        CMPI    #$0009, R5                      ; F052   037D 0009
        BGE     L_F058                          ; F054   020D 0002

        MVII    #$0010, R0                      ; F056   02B8 0010
L_F058:
        CLRR    R3                              ; F058   01DB
        TSTR    R1                              ; F059   0089
        BEQ     L_F060                          ; F05A   0204 0004

L_F05C:
        SDBD                                    ; F05C   0001
        MVII    #$0400, R3                      ; F05D   02BB 0000 0004
L_F060:
        XORI    #$0080, R3                      ; F060   03FB 0080

        JSR     R5,     .EXEC.629               ; F062   0004 0114 0229

        MVII    #$016D, R4                      ; F065   02BC 016D
        SDBD                                    ; F067   0001
        MVI@    R4,     R1                      ; F068   02A1
        SDBD                                    ; F069   0001
        MVI@    R4,     R2                      ; F06A   02A2

        JSR     R5,     .EXEC.477               ; F06B   0004 0114 0077

        MVII    #$016D, R4                      ; F06E   02BC 016D
        MVO@    R1,     R4                      ; F070   0261
        SWAP    R1,     1                       ; F071   0041
        MVO@    R1,     R4                      ; F072   0261
        MVI     G_016E, R1                      ; F073   0281 016E
        MVO@    R2,     R4                      ; F075   0262
        SWAP    R2,     1                       ; F076   0042
        MVO@    R2,     R4                      ; F077   0262
        MVI     G_0170, R2                      ; F078   0282 0170
        XORR    R3,     R2                      ; F07A   01DA
        XORI    #$0300, R1                      ; F07B   03F9 0300
        MVO     R1,     G_032E                  ; F07D   0241 032E
        MVO     R1,     G_0332                  ; F07F   0241 0332
        NOP                                     ; F081   0034
        MVO     R2,     G_032F                  ; F082   0242 032F
        MVO     R2,     G_0333                  ; F084   0242 0333
        MVI     G_0161, R4                      ; F086   0284 0161
        CMPI    #$0002, R4                      ; F088   037C 0002
        BEQ     L_F0E5                          ; F08A   0204 0059

        MVII    #$0349, R4                      ; F08C   02BC 0349

        JSR     R5,     L_D812                  ; F08E   0004 01D8 0012

L_F091:
        PULR    R7                              ; F091   02B7

L_F092:
        TSTR    R0                              ; F092   0080
        BEQ     L_F04A                          ; F093   0224 004A
        B       L_F040                          ; F095   0220 0056

L_F097:
        TSTR    R0                              ; F097   0080
        BEQ     L_F048                          ; F098   0224 0051
        B       L_F040                          ; F09A   0220 005B

L_F09C:
        MVII    #$0016, R0                      ; F09C   02B8 0016
        MVI     G_0161, R1                      ; F09E   0281 0161
        CMPI    #$000F, R1                      ; F0A0   0379 000F
        BGE     L_F0B4                          ; F0A2   020D 0010

        MVI     G_01B3, R1                      ; F0A4   0281 01B3
        MVI     G_0162, R5                      ; F0A6   0285 0162
        CMPI    #$0046, R5                      ; F0A8   037D 0046
        BGT     L_F058                          ; F0AA   022E 0053

        MVI     G_01AE, R5                      ; F0AC   0285 01AE
        TSTR    R5                              ; F0AE   00AD
        BEQ     L_F058                          ; F0AF   0224 0058

L_F0B1:
        CLRR    R1                              ; F0B1   01C9
        B       L_F058                          ; F0B2   0220 005B

L_F0B4:
        MVI     G_0162, R5                      ; F0B4   0285 0162
        CMPI    #$0021, R5                      ; F0B6   037D 0021
        BLE     L_F0C2                          ; F0B8   0206 0008

        CMPI    #$001F, R1                      ; F0BA   0379 001F
        BEQ     L_F0B1                          ; F0BC   0224 000C

        MVII    #$0008, R1                      ; F0BE   02B9 0008
        B       L_F058                          ; F0C0   0220 0069

L_F0C2:
        CLRR    R0                              ; F0C2   01C0
        MVO     R0,     G_032D                  ; F0C3   0240 032D
        MVO     R0,     G_0331                  ; F0C5   0240 0331
        PULR    R7                              ; F0C7   02B7

L_F0C8:
        MVII    #$000C, R1                      ; F0C8   02B9 000C
        MVI     G_0170, R0                      ; F0CA   0280 0170
        SUB     G_0167, R0                      ; F0CC   0300 0167
        BEQ     L_F0DF                          ; F0CE   0204 000F

        TSTR    R0                              ; F0D0   0080
        BMI     L_F0D5                          ; F0D1   020B 0002

        MVII    #$0004, R1                      ; F0D3   02B9 0004
L_F0D5:
        MVII    #$000E, R0                      ; F0D5   02B8 000E
        CLRR    R3                              ; F0D7   01DB
        MVI     G_01AC, R5                      ; F0D8   0285 01AC
        TSTR    R5                              ; F0DA   00AD
        BEQ     L_F05C                          ; F0DB   0224 0080
        B       L_F060                          ; F0DD   0220 007E

L_F0DF:
        MVI     G_0162, R5                      ; F0DF   0285 0162
        CMPI    #$0061, R5                      ; F0E1   037D 0061
        BGT     L_F0D5                          ; F0E3   022E 000F

L_F0E5:
        MVI     G_032F, R2                      ; F0E5   0282 032F
        MVO     R2,     G_0337                  ; F0E7   0242 0337
        PULR    R7                              ; F0E9   02B7

L_F0EA:
        MVI     G_016E, R3                      ; F0EA   0283 016E
        SUB     G_0165, R3                      ; F0EC   0303 0165
        BPL     L_F0F1                          ; F0EE   0203 0001

        NEGR    R3                              ; F0F0   0023
L_F0F1:
        SLR     R3,     2                       ; F0F1   0067
        SLR     R3,     1                       ; F0F2   0063
        MOVR    R5,     R7                      ; F0F3   00AF

L_F0F4:
        PSHR    R5                              ; F0F4   0275
        MVI     G_0171, R0                      ; F0F5   0280 0171
        INCR    R0                              ; F0F7   0008
        CMPI    #$0004, R0                      ; F0F8   0378 0004
        BLT     L_F0FD                          ; F0FA   0205 0001

        CLRR    R0                              ; F0FC   01C0
L_F0FD:
        MVO     R0,     G_0171                  ; F0FD   0240 0171
        MVI     G_0161, R0                      ; F0FF   0280 0161
        CMPI    #$000F, R0                      ; F101   0378 000F
        BGE     L_F1ED                          ; F103   020D 00E8

        MVII    #$0172, R4                      ; F105   02BC 0172

L_F107:
        JSR     R5,     L_F134                  ; F107   0004 01F0 0134

        INCR    R4                              ; F10A   000C
        MVII    #$01A2, R5                      ; F10B   02BD 01A2
        MVI     G_015F, R2                      ; F10D   0282 015F
        CMPI    #$0000, R2                      ; F10F   037A 0000
        BGT     L_F115                          ; F111   020E 0002

        MVII    #$0199, R5                      ; F113   02BD 0199
L_F115:
        CMPR    R5,     R4                      ; F115   016C
        BLT     L_F107                          ; F116   0225 0010

        JSR     R5,     L_F261                  ; F118   0004 01F0 0261

        MVII    #$0335, R4                      ; F11B   02BC 0335

        JSR     R5,     L_F334                  ; F11D   0004 01F0 0334

        MVII    #$0339, R4                      ; F120   02BC 0339

        JSR     R5,     L_F334                  ; F122   0004 01F0 0334

        MVII    #$0329, R4                      ; F125   02BC 0329

        JSR     R5,     L_F334                  ; F127   0004 01F0 0334
        JSR     R5,     L_F3B9                  ; F12A   0004 01F0 03B9
        JSR     R5,     L_F3E1                  ; F12D   0004 01F0 03E1
        JSR     R5,     L_F3FC                  ; F130   0004 01F0 03FC

        PULR    R7                              ; F133   02B7

L_F134:
        PSHR    R5                              ; F134   0275
        MVI@    R4,     R2                      ; F135   02A2
        MVI@    R4,     R1                      ; F136   02A1
        TSTR    R2                              ; F137   0092
        BNEQ    L_F1A4                          ; F138   020C 006A

        MVI     G_0161, R0                      ; F13A   0280 0161
        CMPI    #$0008, R0                      ; F13C   0378 0008
        BEQ     L_F143                          ; F13E   0204 0003

        TSTR    R0                              ; F140   0080
        BNEQ    L_F1ED                          ; F141   020C 00AA

L_F143:
        MVI     G_0170, R0                      ; F143   0280 0170
        MOVR    R0,     R1                      ; F145   0081
        ANDI    #$0007, R0                      ; F146   03B8 0007
        BNEQ    L_F1ED                          ; F148   020C 00A3

        MVI     G_016E, R2                      ; F14A   0282 016E

        JSR     R5,     L_F251                  ; F14C   0004 01F0 0251

        CLRR    R3                              ; F14F   01DB
        MVO     R3,     G_01B2                  ; F150   0243 01B2
        MVII    #$0172, R3                      ; F152   02BB 0172
L_F154:
        MVI@    R3,     R1                      ; F154   0299
        CMPR    R2,     R1                      ; F155   0151
        BGT     L_F16C                          ; F156   020E 0014

        MVI     G_015F, R5                      ; F158   0285 015F
        CMPI    #$0000, R5                      ; F15A   037D 0000
        BLE     L_F1EE                          ; F15C   0206 0090

        SUBI    #$0004, R2                      ; F15E   033A 0004
        CMPR    R2,     R1                      ; F160   0151
        BGT     L_F1ED                          ; F161   020E 008A

        SUBI    #$0004, R2                      ; F163   033A 0004
L_F165:
        CMPR    R2,     R1                      ; F165   0151
        BLT     L_F16A                          ; F166   0205 0002

        MVO     R1,     G_01B2                  ; F168   0241 01B2
L_F16A:
        ADDI    #$0008, R2                      ; F16A   02FA 0008
L_F16C:
        ADDI    #$0003, R3                      ; F16C   02FB 0003
        CMPI    #$01A2, R3                      ; F16E   037B 01A2
        BLT     L_F154                          ; F170   0225 001D

        SUBI    #$0002, R4                      ; F172   033C 0002
        MVO@    R2,     R4                      ; F174   0262
        MVI     G_01B2, R0                      ; F175   0280 01B2
        TSTR    R0                              ; F177   0080
        BNEQ    L_F192                          ; F178   020C 0018

        MVII    #$0001, R0                      ; F17A   02B8 0001

        JSR     R5,     X_RAND1                 ; F17C   0004 0114 027D

        MVI     G_01B1, R3                      ; F17F   0283 01B1

        JSR     R5,     L_F18D                  ; F181   0004 01F0 018D
        DECLE   $0000,  $0000,  $0002,  $0001   ; F184   0000 0000 0002 0001
        DECLE   $0002,  $0000,  $0002,  $0001   ; F188   0002 0000 0002 0001

        EIS                                     ; F18C   0002
L_F18D:
        ADDR    R3,     R5                      ; F18D   00DD
        ADD@    R5,     R0                      ; F18E   02E8
        ADDI    #$01A1, R3                      ; F18F   02FB 01A1
        MVO@    R0,     R3                      ; F191   0258
L_F192:
        MVI     G_01B1, R3                      ; F192   0283 01B1
        ADDI    #$01A1, R3                      ; F194   02FB 01A1
        MVI@    R3,     R0                      ; F196   0298
        INCR    R4                              ; F197   000C
        MVO@    R0,     R4                      ; F198   0260
        SUBI    #$0002, R4                      ; F199   033C 0002
        PSHR    R4                              ; F19B   0274
        PSHR    R2                              ; F19C   0272

        JSR     R5,     L_F505                  ; F19D   0004 01F4 0105

        PULR    R2                              ; F1A0   02B2
        PULR    R4                              ; F1A1   02B4
        CLRR    R1                              ; F1A2   01C9
        MVO@    R1,     R4                      ; F1A3   0261
L_F1A4:
        MVI     G_0171, R3                      ; F1A4   0283 0171
        MVI@    R4,     R0                      ; F1A6   02A0
        DECR    R4                              ; F1A7   0014
        MVI     G_015F, R5                      ; F1A8   0285 015F
        CMPI    #$0000, R5                      ; F1AA   037D 0000
        BNEQ    L_F1B3                          ; F1AC   020C 0005

        CMPI    #$0003, R0                      ; F1AE   0378 0003
        BNEQ    L_F1B3                          ; F1B0   020C 0001

        DECR    R0                              ; F1B2   0010
L_F1B3:
        CMPI    #$0004, R5                      ; F1B3   037D 0004
        BLT     L_F1B8                          ; F1B5   0205 0001

        INCR    R0                              ; F1B7   0008
L_F1B8:
        MVII    #$0002, R5                      ; F1B8   02BD 0002
        CMPR    R5,     R0                      ; F1BA   0168
        BLT     L_F1D1                          ; F1BB   0205 0014
        BEQ     L_F1CB                          ; F1BD   0204 000C

        CMPI    #$0004, R0                      ; F1BF   0378 0004
        BLT     L_F1C8                          ; F1C1   0205 0005

        CMPR    R5,     R3                      ; F1C3   016B
        BLE     L_F1CE                          ; F1C4   0206 0008
        B       L_F1D4                          ; F1C6   0200 000C

L_F1C8:
        CMPR    R5,     R3                      ; F1C8   016B
        BEQ     L_F1CE                          ; F1C9   0204 0003

L_F1CB:
        TSTR    R3                              ; F1CB   009B
        BNEQ    L_F1D4                          ; F1CC   020C 0006

L_F1CE:
        INCR    R1                              ; F1CE   0009
        B       L_F1D4                          ; F1CF   0200 0003

L_F1D1:
        CMPR    R3,     R0                      ; F1D1   0158
        BLT     L_F1ED                          ; F1D2   0205 0019

L_F1D4:
        INCR    R1                              ; F1D4   0009
        SUBI    #$0002, R4                      ; F1D5   033C 0002
        CMPI    #$0008, R1                      ; F1D7   0379 0008
        BLT     L_F1F7                          ; F1D9   0205 001C

        CLRR    R1                              ; F1DB   01C9
        MOVR    R2,     R3                      ; F1DC   0093
        ADDI    #$0214, R3                      ; F1DD   02FB 0214
        MVO@    R1,     R3                      ; F1DF   0259
        DECR    R2                              ; F1E0   0012

        JSR     R5,     L_F246                  ; F1E1   0004 01F0 0246

        CMPI    #$0002, R3                      ; F1E4   037B 0002
        BGE     L_F1F5                          ; F1E6   020D 000D

        ADDI    #$0214, R2                      ; F1E8   02FA 0214
        MVO@    R1,     R2                      ; F1EA   0251
        MVO@    R1,     R4                      ; F1EB   0261
        INCR    R4                              ; F1EC   000C
L_F1ED:
        PULR    R7                              ; F1ED   02B7

L_F1EE:
        SUBI    #$0008, R2                      ; F1EE   033A 0008
        CMPR    R2,     R1                      ; F1F0   0151
        BGT     L_F1ED                          ; F1F1   022E 0005
        B       L_F165                          ; F1F3   0220 008F

L_F1F5:
        MVO@    R2,     R4                      ; F1F5   0262
        DECR    R4                              ; F1F6   0014
L_F1F7:
        INCR    R4                              ; F1F7   000C
        MVO@    R1,     R4                      ; F1F8   0261
        ADDI    #$0214, R2                      ; F1F9   02FA 0214
        MOVR    R1,     R0                      ; F1FB   0088
        SLL     R1,     2                       ; F1FC   004D
        SLL     R1,     1                       ; F1FD   0049
        SDBD                                    ; F1FE   0001
        ADDI    #$08C7, R1                      ; F1FF   02F9 00C7 0008
        MVII    #$0001, R5                      ; F202   02BD 0001
        MVI     G_015F, R3                      ; F204   0283 015F
        CMPI    #$0002, R3                      ; F206   037B 0002
        BLT     L_F233                          ; F208   0205 0029

        CMPI    #$0178, R4                      ; F20A   037C 0178
        BLT     L_F212                          ; F20C   0205 0004

        CMPI    #$019F, R4                      ; F20E   037C 019F
        BLT     L_F233                          ; F210   0205 0021

L_F212:
        ADDI    #$0068, R1                      ; F212   02F9 0068
        CLRR    R5                              ; F214   01ED
        MVI     G_015F, R5                      ; F215   0285 015F
        CMPI    #$0007, R5                      ; F217   037D 0007
        BLT     L_F221                          ; F219   0205 0006

        SDBD                                    ; F21B   0001
        MVII    #$1003, R5                      ; F21C   02BD 0003 0010
        B       L_F223                          ; F21F   0200 0002

L_F221:
        MVII    #$0005, R5                      ; F221   02BD 0005
L_F223:
        XORR    R5,     R1                      ; F223   01E9
        CMPI    #$0006, R0                      ; F224   0378 0006
        BLT     L_F244                          ; F226   0205 001C

        ADDI    #$000F, R0                      ; F228   02F8 000F
        SLL     R0,     2                       ; F22A   004C
        SLL     R0,     1                       ; F22B   0048
        SDBD                                    ; F22C   0001
        ADDI    #$08C7, R0                      ; F22D   02F8 00C7 0008
        XORR    R5,     R0                      ; F230   01E8
        B       L_F241                          ; F231   0200 000E

L_F233:
        XORR    R5,     R1                      ; F233   01E9
        CMPI    #$0003, R0                      ; F234   0378 0003
        BLT     L_F244                          ; F236   0205 000C

        ADDI    #$0005, R0                      ; F238   02F8 0005
        SLL     R0,     2                       ; F23A   004C
        SLL     R0,     1                       ; F23B   0048
        XORR    R5,     R1                      ; F23C   01E9
        SDBD                                    ; F23D   0001
        ADDI    #$08C7, R0                      ; F23E   02F8 00C7 0008
L_F241:
        DECR    R2                              ; F241   0012
        MVO@    R0,     R2                      ; F242   0250
        INCR    R2                              ; F243   000A
L_F244:
        MVO@    R1,     R2                      ; F244   0251
        PULR    R7                              ; F245   02B7

L_F246:
        PSHR    R5                              ; F246   0275
        MOVR    R2,     R3                      ; F247   0093
        CLRR    R0                              ; F248   01C0
L_F249:
        INCR    R0                              ; F249   0008
        SUBI    #$0014, R3                      ; F24A   033B 0014
        BPL     L_F249                          ; F24C   0223 0004

        ADDI    #$0014, R3                      ; F24E   02FB 0014
        PULR    R7                              ; F250   02B7

L_F251:
        PSHR    R5                              ; F251   0275
        SLR     R1,     2                       ; F252   0065
        SLR     R1,     1                       ; F253   0061
        DECR    R1                              ; F254   0011
        MVO     R1,     G_01B1                  ; F255   0241 01B1
        SLR     R2,     2                       ; F257   0066
        SLR     R2,     1                       ; F258   0062
        DECR    R2                              ; F259   0012
L_F25A:
        DECR    R1                              ; F25A   0011
        BEQ     L_F1ED                          ; F25B   0224 006F

        ADDI    #$0014, R2                      ; F25D   02FA 0014
        B       L_F25A                          ; F25F   0220 0006

L_F261:
        PSHR    R5                              ; F261   0275
        MVI     G_0161, R0                      ; F262   0280 0161
        CMPI    #$0008, R0                      ; F264   0378 0008
        BEQ     L_F26B                          ; F266   0204 0003

        TSTR    R0                              ; F268   0080
        BNEQ    L_F1ED                          ; F269   022C 007D

L_F26B:
        MVI     G_015F, R0                      ; F26B   0280 015F
        CMPI    #$0001, R0                      ; F26D   0378 0001
        BLE     L_F2AB                          ; F26F   0206 003A

        MVII    #$0335, R2                      ; F271   02BA 0335
        MVI@    R2,     R0                      ; F273   0290
        TSTR    R0                              ; F274   0080
        BNEQ    L_F284                          ; F275   020C 000D

        MVI     G_0170, R0                      ; F277   0280 0170
        SUB     G_0167, R0                      ; F279   0300 0167
        BMI     L_F284                          ; F27B   020B 0007

        CMPI    #$0004, R0                      ; F27D   0378 0004
        BGT     L_F284                          ; F27F   020E 0003

        JSR     R5,     L_F302                  ; F281   0004 01F0 0302

L_F284:
        MVII    #$0339, R2                      ; F284   02BA 0339
        MVI@    R2,     R0                      ; F286   0290
        TSTR    R0                              ; F287   0080
        BNEQ    L_F2AB                          ; F288   020C 0021

        JSR     R5,     L_F0EA                  ; F28A   0004 01F0 00EA

        CMPI    #$0005, R3                      ; F28D   037B 0005
        BGT     L_F295                          ; F28F   020E 0004

        ADDI    #$000A, R3                      ; F291   02FB 000A
        B       L_F297                          ; F293   0200 0002

L_F295:
        MVII    #$0018, R3                      ; F295   02BB 0018
L_F297:
        MVI     G_0170, R0                      ; F297   0280 0170
        SUB     G_0167, R0                      ; F299   0300 0167
        BPL     L_F2A0                          ; F29B   0203 0003

        NEGR    R0                              ; F29D   0020
        SUBI    #$0008, R3                      ; F29E   033B 0008
L_F2A0:
        CMPR    R3,     R0                      ; F2A0   0158
        BLT     L_F2AB                          ; F2A1   0205 0008

        ADDI    #$000A, R3                      ; F2A3   02FB 000A
        CMPR    R3,     R0                      ; F2A5   0158
        BGT     L_F2AB                          ; F2A6   020E 0003

        JSR     R5,     L_F302                  ; F2A8   0004 01F0 0302

L_F2AB:
        MVI     G_01AE, R3                      ; F2AB   0283 01AE
        MOVR    R3,     R2                      ; F2AD   009A
        ANDI    #$000F, R3                      ; F2AE   03BB 000F
        BNEQ    L_F2BB                          ; F2B0   020C 0009

        MVI     G_01AB, R3                      ; F2B2   0283 01AB
        CMPR    R2,     R3                      ; F2B4   0153
        BEQ     L_F2BB                          ; F2B5   0204 0004

        MVO     R2,     G_01AA                  ; F2B7   0242 01AA
        MVO     R2,     G_01AB                  ; F2B9   0242 01AB
L_F2BB:
        MVI     G_01AA, R3                      ; F2BB   0283 01AA
        TSTR    R3                              ; F2BD   009B
        BEQ     L_F1ED                          ; F2BE   0224 00D2

        MVII    #$0329, R2                      ; F2C0   02BA 0329
        MVI@    R2,     R0                      ; F2C2   0290
        TSTR    R0                              ; F2C3   0080
        BNEQ    L_F1ED                          ; F2C4   022C 00D8

        JSR     R5,     L_F0EA                  ; F2C6   0004 01F0 00EA

        CMPI    #$0005, R3                      ; F2C9   037B 0005
        BGT     L_F2D1                          ; F2CB   020E 0004

        ADDI    #$0013, R3                      ; F2CD   02FB 0013
        B       L_F2D3                          ; F2CF   0200 0002

L_F2D1:
        MVII    #$0021, R3                      ; F2D1   02BB 0021
L_F2D3:
        MVI     G_0170, R0                      ; F2D3   0280 0170
        SUB     G_0167, R0                      ; F2D5   0300 0167
        BPL     L_F2DC                          ; F2D7   0203 0003

        NEGR    R0                              ; F2D9   0020
        SUBI    #$0008, R3                      ; F2DA   033B 0008
L_F2DC:
        CMPR    R3,     R0                      ; F2DC   0158
        BLT     L_F1ED                          ; F2DD   0225 00F1

        MVI     G_0170, R3                      ; F2DF   0283 0170
        MOVR    R3,     R1                      ; F2E1   0099
        CMPI    #$0010, R3                      ; F2E2   037B 0010
        BLT     L_F1ED                          ; F2E4   0225 00F8

        JSR     R5,     L_F2EF                  ; F2E6   0004 01F0 02EF
        DECLE   $0329                           ; F2E9   0329
        BIDECLE $D625                           ; F2EA   0025 00D6
        DECLE   $0398                           ; F2EC   0398
        BIDECLE $18B0                           ; F2ED   00B0 0018
L_F2EF:
        MVI@    R5,     R4                      ; F2EF   02AC
        SDBD                                    ; F2F0   0001
        MVI@    R5,     R0                      ; F2F1   02A8
        MVI@    R5,     R1                      ; F2F2   02A9
        XORI    #$0080, R3                      ; F2F3   03FB 0080
        MVO@    R0,     R4                      ; F2F5   0260
        MVO@    R1,     R4                      ; F2F6   0261
        MVO@    R3,     R4                      ; F2F7   0263
        SDBD                                    ; F2F8   0001
        MVI@    R5,     R0                      ; F2F9   02A8
        MVO@    R0,     R4                      ; F2FA   0260

        JSR     R5,     L_F51B                  ; F2FB   0004 01F4 011B

        CLRR    R0                              ; F2FE   01C0
        MVO     R0,     G_01AA                  ; F2FF   0240 01AA
        PULR    R7                              ; F301   02B7

L_F302:
        PSHR    R5                              ; F302   0275
        MVI     G_0170, R3                      ; F303   0283 0170
        MOVR    R3,     R1                      ; F305   0099
        CMPI    #$0010, R3                      ; F306   037B 0010
        BLT     L_F1ED                          ; F308   0225 011C

        ANDI    #$0007, R1                      ; F30A   03B9 0007
        BEQ     L_F1ED                          ; F30C   0224 0120

        ANDI    #$0001, R1                      ; F30E   03B9 0001
        BNEQ    L_F1ED                          ; F310   022C 0124

        JSR     R5,     L_F31A                  ; F312   0004 01F0 031A
        BIDECLE $0398                           ; F315   0098 0003

        ADDR    R4,     R7                      ; F317   00E7

        DECLE   $0009,  $03FF                   ; F318   0009 03FF
L_F31A:
        MOVR    R2,     R4                      ; F31A   0094
        INCR    R4                              ; F31B   000C
        SDBD                                    ; F31C   0001
        MVI@    R5,     R0                      ; F31D   02A8
        MVO@    R0,     R4                      ; F31E   0260
        MVI     G_015F, R1                      ; F31F   0281 015F
        XORI    #$0080, R3                      ; F321   03FB 0080
        CMPI    #$0003, R1                      ; F323   0379 0003
        BGE     L_F329                          ; F325   020D 0002

        XORI    #$0180, R3                      ; F327   03FB 0180
L_F329:
        MVO@    R3,     R4                      ; F329   0263
        SDBD                                    ; F32A   0001
        MVI@    R5,     R0                      ; F32B   02A8
        MVO@    R0,     R4                      ; F32C   0260
        MOVR    R2,     R4                      ; F32D   0094
        MVI@    R5,     R0                      ; F32E   02A8
        MVO@    R0,     R4                      ; F32F   0260

        JSR     R5,     L_F505                  ; F330   0004 01F4 0105

        PULR    R7                              ; F333   02B7

L_F334:
        PSHR    R5                              ; F334   0275
        MVI@    R4,     R0                      ; F335   02A0
        TSTR    R0                              ; F336   0080
        BEQ     L_F1ED                          ; F337   0224 014B

        CMPI    #$0001, R0                      ; F339   0378 0001
        BEQ     L_F1ED                          ; F33B   0224 014F

        MVI@    R4,     R0                      ; F33D   02A0
        DECR    R4                              ; F33E   0014
        ANDI    #$00FF, R0                      ; F33F   03B8 00FF
        CMPI    #$0335, R4                      ; F341   037C 0335
        BLT     L_F34C                          ; F343   0205 0007

        MVI     G_0171, R1                      ; F345   0281 0171
        ANDI    #$0001, R1                      ; F347   03B9 0001
        BEQ     L_F34C                          ; F349   0204 0001

        DECR    R0                              ; F34B   0010
L_F34C:
        DECR    R0                              ; F34C   0010
        CMPI    #$0010, R0                      ; F34D   0378 0010
        BLT     L_F3B5                          ; F34F   0205 0064

        XORI    #$0300, R0                      ; F351   03F8 0300
        MVI     G_015F, R5                      ; F353   0285 015F
        CMPI    #$0003, R5                      ; F355   037D 0003
        BLT     L_F361                          ; F357   0205 0008

        CMPI    #$032D, R4                      ; F359   037C 032D
        BLT     L_F361                          ; F35B   0205 0004

        SDBD                                    ; F35D   0001
        XORI    #$0400, R0                      ; F35E   03F8 0000 0004
L_F361:
        MVO@    R0,     R4                      ; F361   0260
        MVI     G_0171, R0                      ; F362   0280 0171
        CMPI    #$0001, R0                      ; F364   0378 0001
        BNEQ    L_F1ED                          ; F366   022C 017A

        CMPI    #$032D, R4                      ; F368   037C 032D
        BLT     L_F3AF                          ; F36A   0205 0043

        MVI@    R4,     R1                      ; F36C   02A1
        CMPI    #$0003, R5                      ; F36D   037D 0003
        BLT     L_F3AF                          ; F36F   0205 003E

        ANDI    #$007F, R1                      ; F371   03B9 007F
        CMPI    #$0006, R5                      ; F373   037D 0006
        BLT     L_F388                          ; F375   0205 0011

        CMPI    #$0008, R5                      ; F377   037D 0008
        BGE     L_F37F                          ; F379   020D 0004

        CMPI    #$0339, R4                      ; F37B   037C 0339
        BLT     L_F388                          ; F37D   0205 0009

L_F37F:
        MOVR    R1,     R2                      ; F37F   008A
        SUB     G_0167, R2                      ; F380   0302 0167
        BMI     L_F385                          ; F382   020B 0001

        NEGR    R0                              ; F384   0020
L_F385:
        MOVR    R0,     R2                      ; F385   0082
        B       L_F391                          ; F386   0200 0009

L_F388:
        JSR     R5,     X_RAND1                 ; F388   0004 0114 027D

        MVII    #$0001, R2                      ; F38B   02BA 0001
        TSTR    R0                              ; F38D   0080
        BNEQ    L_F391                          ; F38E   020C 0001

        NEGR    R2                              ; F390   0022
L_F391:
        ADDR    R2,     R1                      ; F391   00D1
        CMPI    #$0010, R1                      ; F392   0379 0010
        BLT     L_F39A                          ; F394   0205 0004

        CMPI    #$0048, R1                      ; F396   0379 0048
        BLT     L_F39D                          ; F398   0205 0003

L_F39A:
        NEGR    R2                              ; F39A   0022
        ADDR    R2,     R1                      ; F39B   00D1
        ADDR    R2,     R1                      ; F39C   00D1
L_F39D:
        XORI    #$0080, R1                      ; F39D   03F9 0080
        DECR    R4                              ; F39F   0014
        MVO@    R1,     R4                      ; F3A0   0261
        MVI@    R4,     R1                      ; F3A1   02A1
        MVI     G_015F, R0                      ; F3A2   0280 015F
        CMPI    #$0005, R0                      ; F3A4   0378 0005
        BGE     L_F3AA                          ; F3A6   020D 0002

        XORI    #$0003, R1                      ; F3A8   03F9 0003
L_F3AA:
        SDBD                                    ; F3AA   0001
        XORI    #$1000, R1                      ; F3AB   03F9 0000 0010
        INCR    R7                              ; F3AE   000F

L_F3AF:
        MVI@    R4,     R1                      ; F3AF   02A1
L_F3B0:
        DECR    R4                              ; F3B0   0014
        XORI    #$0001, R1                      ; F3B1   03F9 0001
        MVO@    R1,     R4                      ; F3B3   0261
        PULR    R7                              ; F3B4   02B7

L_F3B5:
        DECR    R4                              ; F3B5   0014
        CLRR    R0                              ; F3B6   01C0
        MVO@    R0,     R4                      ; F3B7   0260
        PULR    R7                              ; F3B8   02B7

L_F3B9:
        PSHR    R5                              ; F3B9   0275
        MVI     G_0171, R0                      ; F3BA   0280 0171
        ANDI    #$0001, R0                      ; F3BC   03B8 0001
        BNEQ    L_F1ED                          ; F3BE   022C 01D2

        MVII    #$034B, R3                      ; F3C0   02BB 034B
        SDBD                                    ; F3C2   0001
        MVII    #$FEBC, R1                      ; F3C3   02B9 00BC 00FE
        MVII    #$0008, R2                      ; F3C6   02BA 0008
        MVII    #$0020, R4                      ; F3C8   02BC 0020
        MVI     G_015F, R5                      ; F3CA   0285 015F
        CMPI    #$0003, R5                      ; F3CC   037D 0003
        BLT     L_F3D8                          ; F3CE   0205 0008

        SDBD                                    ; F3D0   0001
        MVII    #$FB5C, R1                      ; F3D1   02B9 005C 00FB
        MVII    #$0010, R2                      ; F3D4   02BA 0010
        MVII    #$0030, R4                      ; F3D6   02BC 0030
L_F3D8:
        MVI@    R3,     R0                      ; F3D8   0298
        ADDR    R2,     R0                      ; F3D9   00D0
        CMPR    R1,     R0                      ; F3DA   0148
        BLT     L_F3DF                          ; F3DB   0205 0002

        SUBR    R4,     R1                      ; F3DD   0121
        MOVR    R1,     R0                      ; F3DE   0088
L_F3DF:
        MVO@    R0,     R3                      ; F3DF   0258
        PULR    R7                              ; F3E0   02B7

L_F3E1:
        PSHR    R5                              ; F3E1   0275
        DECLE   $0280,  $0160,  $0378,  $0002   ; F3E2   0280 0160 0378 0002
        DECLE   $022C,  $01FA,  $0280,  $0171   ; F3E6   022C 01FA 0280 0171
        DECLE   $0378,  $0003,  $0224,  $0200   ; F3EA   0378 0003 0224 0200
        DECLE   $0004,  $01F0,  $03F4           ; F3EE   0004 01F0 03F4

        MVII    #$02C4, R2                      ; F3F1   02BA 02C4
        ADD     G_00C5, R1                      ; F3F3   02C1 00C5
        MVI@    R5,     R4                      ; F3F5   02AC
        MVI@    R4,     R0                      ; F3F6   02A0
        DECR    R4                              ; F3F7   0014
        XORI    #$0008, R0                      ; F3F8   03F8 0008
        MVO@    R0,     R4                      ; F3FA   0260
        PULR    R7                              ; F3FB   02B7

L_F3FC:
        PSHR    R5                              ; F3FC   0275
        MVI     G_031D, R2                      ; F3FD   0282 031D
        CMPI    #$003F, R2                      ; F3FF   037A 003F
        BEQ     L_F407                          ; F401   0204 0004

L_F403:
        CMPI    #$007F, R2                      ; F403   037A 007F
        BNEQ    L_F1ED                          ; F405   022C 0219

L_F407:
        MVI     G_0171, R1                      ; F407   0281 0171
        TSTR    R1                              ; F409   0089
        BNEQ    L_F1ED                          ; F40A   022C 021E

        MVII    #$034C, R3                      ; F40C   02BB 034C
        SDBD                                    ; F40E   0001
        MVII    #$FB2C, R1                      ; F40F   02B9 002C 00FB
        MVI@    R3,     R0                      ; F412   0298
        CMPI    #$007F, R2                      ; F413   037A 007F
        BNEQ    L_F41B                          ; F415   020C 0004

        SDBD                                    ; F417   0001
        MVII    #$FEFC, R1                      ; F418   02B9 00FC 00FE
L_F41B:
        ADDI    #$0010, R0                      ; F41B   02F8 0010
        CMPR    R1,     R0                      ; F41D   0148
        BLT     L_F3DF                          ; F41E   0225 0040

        CMPI    #$007F, R2                      ; F420   037A 007F
        BEQ     L_F433                          ; F422   0204 000F

        CLRR    R0                              ; F424   01C0
        MVO     R0,     G_031D                  ; F425   0240 031D
        SDBD                                    ; F427   0001
        MVII    #$18A8, R0                      ; F428   02B8 00A8 0018
        MVO     R0,     G_0320                  ; F42B   0240 0320
        SDBD                                    ; F42D   0001
        MVII    #$FADC, R0                      ; F42E   02B8 00DC 00FA
        MVO@    R0,     R3                      ; F431   0258
        PULR    R7                              ; F432   02B7

L_F433:
        SUBI    #$0040, R0                      ; F433   0338 0040
        MVO@    R0,     R3                      ; F435   0258
        PULR    R7                              ; F436   02B7

L_F437:
        PSHR    R5                              ; F437   0275

        JSR     R5,     .EXEC.7C1               ; F438   0004 0114 03C1

        MVII    #$035B, R4                      ; F43B   02BC 035B
        MVI@    R4,     R0                      ; F43D   02A0
        ADDR    R0,     R3                      ; F43E   00C3
        MOVR    R3,     R0                      ; F43F   0098
        SDBD                                    ; F440   0001
        SUBI    #$2710, R3                      ; F441   033B 0010 0027
        BMI     L_F461                          ; F444   020B 001B

        MVI     G_015D, R0                      ; F446   0280 015D
        INCR    R0                              ; F448   0008
        MVO     R0,     G_015D                  ; F449   0240 015D
        MOVR    R3,     R0                      ; F44B   0098
        MVII    #$0001, R3                      ; F44C   02BB 0001
        ADD@    R4,     R3                      ; F44E   02E3
        MOVR    R3,     R5                      ; F44F   009D
        SDBD                                    ; F450   0001
        SUBI    #$2710, R5                      ; F451   033D 0010 0027
        BMI     L_F45E                          ; F454   020B 0008

        CLRR    R3                              ; F456   01DB
        MVII    #$02E6, R4                      ; F457   02BC 02E6
        MVO@    R3,     R4                      ; F459   0263
        MVO@    R3,     R4                      ; F45A   0263
        NOP                                     ; F45B   0034
        MVO@    R3,     R4                      ; F45C   0263
        MVO@    R3,     R4                      ; F45D   0263
L_F45E:
        MVII    #$035C, R4                      ; F45E   02BC 035C
        MVO@    R3,     R4                      ; F460   0263
L_F461:
        MVII    #$035B, R4                      ; F461   02BC 035B
        MVO@    R0,     R4                      ; F463   0260
        INCR    R7                              ; F464   000F

L_F465:
        PSHR    R5                              ; F465   0275
L_F466:
        CLRR    R0                              ; F466   01C0
        MVII    #$0001, R1                      ; F467   02B9 0001
        MVII    #$0007, R3                      ; F469   02BB 0007
        MVI     G_0160, R5                      ; F46B   0285 0160
        TSTR    R5                              ; F46D   00AD
        BEQ     L_F478                          ; F46E   0204 0008

        MVII    #$0003, R3                      ; F470   02BB 0003
        CMPI    #$0002, R5                      ; F472   037D 0002
        BNEQ    L_F478                          ; F474   020C 0002

        MVII    #$0002, R3                      ; F476   02BB 0002
L_F478:
        MVII    #$02EE, R4                      ; F478   02BC 02EE

        JSR     R5,     X_PRNUM_RGT             ; F47A   0004 0118 00C5

        MVI     G_015D, R0                      ; F47D   0280 015D
        MVII    #$0001, R1                      ; F47F   02B9 0001
        CMPI    #$0009, R0                      ; F481   0378 0009
        BLT     L_F487                          ; F483   0205 0002

        MVII    #$0009, R0                      ; F485   02B8 0009
L_F487:
        MVII    #$02B3, R4                      ; F487   02BC 02B3

        JSR     R5,     X_PRNUM_RGT             ; F489   0004 0118 00C5

        MVII    #$035B, R4                      ; F48C   02BC 035B
        MVI@    R4,     R0                      ; F48E   02A0
        MVI@    R4,     R2                      ; F48F   02A2
        MVII    #$0004, R1                      ; F490   02B9 0004
        MVII    #$02EA, R4                      ; F492   02BC 02EA
        TSTR    R2                              ; F494   0092
        BNEQ    L_F49B                          ; F495   020C 0004

        JSR     R5,     X_PRNUM_RGT             ; F497   0004 0118 00C5

        PULR    R7                              ; F49A   02B7

L_F49B:
        JSR     R5,     X_PRNUM_ZRO             ; F49B   0004 0118 00AD

        MVII    #$035C, R4                      ; F49E   02BC 035C
        MVI@    R4,     R0                      ; F4A0   02A0
        MVII    #$02E6, R4                      ; F4A1   02BC 02E6
        MVII    #$0004, R1                      ; F4A3   02B9 0004

        JSR     R5,     X_PRNUM_RGT             ; F4A5   0004 0118 00C5

        PULR    R7                              ; F4A8   02B7

UC_F4A9:
        MVI     G_0159, R0                      ; F4A9  SLIB UCALL target
        MVII    #$01FB, R5                      ; F4AB   02BD 01FB
        MVO@    R0,     R5                      ; F4AD   0268
        MVO@    R0,     R5                      ; F4AE   0268
        SUB     G_015A, R0                      ; F4AF   0300 015A
        CMPI    #$0009, R0                      ; F4B1   0378 0009
        BPL     L_F4B7                          ; F4B3   0203 0002

        MVII    #$0001, R0                      ; F4B5   02B8 0001
L_F4B7:
        MVO     R0,     G_0159                  ; F4B7   0240 0159
        PULR    R7                              ; F4B9   02B7

L_F4BA:
        PSHR    R5                              ; F4BA   0275

        JSR     R5,     X_PLAY_SFX1             ; F4BB   0004 0118 03BB
        DECLE   $002F                           ; F4BE  SFX data
        DECLE   $0289                           ; F4BF  SFX data
        DECLE   $004F,  $000F                   ; F4C0  SFX data
        DECLE   $00DD                           ; F4C2  SFX data
        DECLE   $010D                           ; F4C3  SFX data
        DECLE   $000F,  $0005                   ; F4C4  SFX data
        DECLE   $0000,  $0064                   ; F4C6  SFX data
        DECLE   $0008,  $0016                   ; F4C8  SFX data
        DECLE   $00A1,  $00A0                   ; F4CA  SFX data
        DECLE   $00F1,  $00CA                   ; F4CC  SFX data
        DECLE   $0077,  $00A9,  $00F4           ; F4CE  SFX data
        DECLE   $0183,  $03C0                   ; F4D1  SFX data
        DECLE   $03B9                           ; F4D3  SFX data
        DECLE   $03CF                           ; F4D4  SFX end

L_F4D5:
        PSHR    R5                              ; F4D5   0275

        JSR     R5,     X_PLAY_SFX1             ; F4D6   0004 0118 03BB
        DECLE   $002F                           ; F4D9  SFX data
        DECLE   $0309                           ; F4DA  SFX data
        DECLE   $004F,  $000F                   ; F4DB  SFX data
        DECLE   $005D                           ; F4DD  SFX data
        DECLE   $002D                           ; F4DE  SFX data
        DECLE   $000F,  $0002                   ; F4DF  SFX data
        DECLE   $0000,  $0190                   ; F4E1  SFX data
        DECLE   $0008,  $0001                   ; F4E3  SFX data
        DECLE   $0051,  $0190                   ; F4E5  SFX data
        DECLE   $0051,  $0192                   ; F4E7  SFX data
        DECLE   $0077,  $00A9,  $00F4           ; F4E9  SFX data
        DECLE   $00A3,  $03C0                   ; F4EC  SFX data
        DECLE   $03B9                           ; F4EE  SFX data
        DECLE   $03CF                           ; F4EF  SFX end

L_F4F0:
        PSHR    R5                              ; F4F0   0275

        JSR     R5,     X_PLAY_SFX2             ; F4F1   0004 0118 03BE
        DECLE   $00DC                           ; F4F4  SFX prio
        DECLE   $002F                           ; F4F5  SFX data
        DECLE   $0389                           ; F4F6  SFX data
        DECLE   $004F,  $0008                   ; F4F7  SFX data
        DECLE   $0380,  $00C8                   ; F4F9  SFX data
        DECLE   $0388,  $0104                   ; F4FB  SFX data
        DECLE   $0001,  $03C4                   ; F4FD  SFX data
        DECLE   $0001,  $03CA                   ; F4FF  SFX data
        DECLE   $00E3,  $03D8                   ; F501  SFX data
        DECLE   $03B9                           ; F503  SFX data
        DECLE   $03CF                           ; F504  SFX end

L_F505:
        PSHR    R5                              ; F505   0275

        JSR     R5,     X_PLAY_SFX2             ; F506   0004 0118 03BE
        DECLE   $000A                           ; F509  SFX prio
        DECLE   $002F                           ; F50A  SFX data
        DECLE   $02B9                           ; F50B  SFX data
        DECLE   $004F,  $000D                   ; F50C  SFX data
        DECLE   $005D                           ; F50E  SFX data
        DECLE   $002D                           ; F50F  SFX data
        DECLE   $000F,  $000A                   ; F510  SFX data
        DECLE   $0077,  $00A9,  $00F4           ; F512  SFX data
        DECLE   $006B                           ; F515  SFX data
        DECLE   $0025                           ; F516  SFX data
        DECLE   $0043,  $03E4                   ; F517  SFX data
        DECLE   $03B9                           ; F519  SFX data
        DECLE   $03CF                           ; F51A  SFX end

L_F51B:
        PSHR    R5                              ; F51B   0275

        JSR     R5,     X_PLAY_SFX1             ; F51C   0004 0118 03BB
        DECLE   $0289                           ; F51F  SFX data
        DECLE   $012F                           ; F520  SFX data
        DECLE   $0388,  $0005                   ; F521  SFX data
        DECLE   $03C0,  $00C8                   ; F523  SFX data
        DECLE   $00A1,  $0006                   ; F525  SFX data
        DECLE   $03F1,  $0000                   ; F527  SFX data
        DECLE   $03D2                           ; F529  SFX data
        DECLE   $03CA                           ; F52A  SFX data
        DECLE   $002D                           ; F52B  SFX data
        DECLE   $000F,  $0008                   ; F52C  SFX data
        DECLE   $008F,  $0013                   ; F52E  SFX data
        DECLE   $03B9                           ; F530  SFX data
        DECLE   $03CF                           ; F531  SFX end

L_F532:
        MVI     G_015C, R0                      ; F532   0280 015C
        DECR    R0                              ; F534   0010
        BMI     L_F53D                          ; F535   020B 0006

        MVO     R0,     G_015C                  ; F537   0240 015C
        BNEQ    L_F53D                          ; F539   020C 0002

        MVO     R0,     .PSG0.chn_c_vol         ; F53B   0240 01FD
L_F53D:
        MOVR    R5,     R7                      ; F53D   00AF

L_F53E:
        MVII    #$0044, R0                      ; F53E   02B8 0044
        MVO     R0,     .PSG0.chn_c_lo          ; F540   0240 01F2
        MVII    #$0001, R0                      ; F542   02B8 0001
        MVO     R0,     .PSG0.chn_c_hi          ; F544   0240 01F6
        MVII    #$0030, R0                      ; F546   02B8 0030
        MVO     R0,     .PSG0.chn_c_vol         ; F548   0240 01FD
        MVII    #$0032, R0                      ; F54A   02B8 0032
        MVO     R0,     .PSG0.envlp_lo          ; F54C   0240 01F3
        CLRR    R0                              ; F54E   01C0
        MVO     R0,     .PSG0.envlp_hi          ; F54F   0240 01F7
        MVII    #$000E, R0                      ; F551   02B8 000E
        MVO     R0,     .PSG0.envelope          ; F553   0240 01FA
        MVII    #$001E, R0                      ; F555   02B8 001E
        MVO     R0,     G_015C                  ; F557   0240 015C
        MOVR    R5,     R7                      ; F559   00AF

L_F55A:
        PSHR    R5                              ; F55A   0275

        JSR     R5,     X_PLAY_SFX2             ; F55B   0004 0118 03BE
        DECLE   $003C                           ; F55E  SFX prio
        DECLE   $002F                           ; F55F  SFX data
        DECLE   $0309                           ; F560  SFX data
        DECLE   $004F,  $000F                   ; F561  SFX data
        DECLE   $00DD                           ; F563  SFX data
        DECLE   $010D                           ; F564  SFX data
        DECLE   $0000,  $0064                   ; F565  SFX data
        DECLE   $0008,  $00A5                   ; F567  SFX data
        DECLE   $01E1,  $0000                   ; F569  SFX data
        DECLE   $0321,  $0002                   ; F56B  SFX data
        DECLE   $0077,  $00A9,  $00F4           ; F56D  SFX data
        DECLE   $00AB                           ; F570  SFX data
        DECLE   $0005                           ; F571  SFX data
        DECLE   $0025                           ; F572  SFX data
        DECLE   $0063,  $03E0                   ; F573  SFX data
        DECLE   $03B9                           ; F575  SFX data
        DECLE   $03CF                           ; F576  SFX end


        PSHR    R5                              ; F577   0275

        JSR     R5,     X_PLAY_SFX2             ; F578   0004 0118 03BE
        DECLE   $00FA                           ; F57B  SFX prio
        DECLE   $002F                           ; F57C  SFX data
        DECLE   $012B                           ; F57D  SFX data
        DECLE   $0035                           ; F57E  SFX data
        DECLE   $03AB                           ; F57F  SFX data
        DECLE   $0389                           ; F580  SFX data
        DECLE   $03D0,  $019E                   ; F581  SFX data
        DECLE   $0388,  $00F0                   ; F583  SFX data
        DECLE   $0304,  $00F1                   ; F585  SFX data
        DECLE   $026B                           ; F587  SFX data
        DECLE   $0025                           ; F588  SFX data
        DECLE   $0015                           ; F589  SFX data
        DECLE   $03F2                           ; F58A  SFX data
        DECLE   $006B                           ; F58B  SFX data
        DECLE   $03A5                           ; F58C  SFX data
        DECLE   $0315                           ; F58D  SFX data
        DECLE   $016B                           ; F58E  SFX data
        DECLE   $0025                           ; F58F  SFX data
        DECLE   $0015                           ; F590  SFX data
        DECLE   $016B                           ; F591  SFX data
        DECLE   $03A5                           ; F592  SFX data
        DECLE   $0315                           ; F593  SFX data
        DECLE   $016B                           ; F594  SFX data
        DECLE   $0025                           ; F595  SFX data
        DECLE   $0015                           ; F596  SFX data
        DECLE   $016B                           ; F597  SFX data
        DECLE   $03C5                           ; F598  SFX data
        DECLE   $03F2                           ; F599  SFX data
        DECLE   $03A5                           ; F59A  SFX data
        DECLE   $0315                           ; F59B  SFX data
        DECLE   $02EB                           ; F59C  SFX data
        DECLE   $03FA                           ; F59D  SFX data
        DECLE   $03F6                           ; F59E  SFX data
        DECLE   $02EB                           ; F59F  SFX data
        DECLE   $0380,  $03C0                   ; F5A0  SFX data
        DECLE   $0388,  $011E                   ; F5A2  SFX data
        DECLE   $0304,  $011D                   ; F5A4  SFX data
        DECLE   $03E2                           ; F5A6  SFX data
        DECLE   $02EB                           ; F5A7  SFX data
        DECLE   $0380,  $02CF                   ; F5A8  SFX data
        DECLE   $03EE                           ; F5AA  SFX data
        DECLE   $02EB                           ; F5AB  SFX data
        DECLE   $0380,  $02FA                   ; F5AC  SFX data
        DECLE   $0388,  $00F0                   ; F5AE  SFX data
        DECLE   $0304,  $00F1                   ; F5B0  SFX data
        DECLE   $03E2                           ; F5B2  SFX data
        DECLE   $016B                           ; F5B3  SFX data
        DECLE   $0025                           ; F5B4  SFX data
        DECLE   $0015                           ; F5B5  SFX data
        DECLE   $016B                           ; F5B6  SFX data
        DECLE   $0380,  $0327                   ; F5B7  SFX data
        DECLE   $0388,  $00D6                   ; F5B9  SFX data
        DECLE   $0304,  $00D7                   ; F5BB  SFX data
        DECLE   $03E2                           ; F5BD  SFX data
        DECLE   $026B                           ; F5BE  SFX data
        DECLE   $0025                           ; F5BF  SFX data
        DECLE   $0015                           ; F5C0  SFX data
        DECLE   $006B                           ; F5C1  SFX data
        DECLE   $0380,  $0357                   ; F5C2  SFX data
        DECLE   $0388,  $00F0                   ; F5C4  SFX data
        DECLE   $0304,  $00F1                   ; F5C6  SFX data
        DECLE   $03EE                           ; F5C8  SFX data
        DECLE   $02EB                           ; F5C9  SFX data
        DECLE   $0380,  $038A                   ; F5CA  SFX data
        DECLE   $0388,  $010E                   ; F5CC  SFX data
        DECLE   $0304,  $010D                   ; F5CE  SFX data
        DECLE   $03EE                           ; F5D0  SFX data
        DECLE   $02EB                           ; F5D1  SFX data
        DECLE   $0380,  $03C0                   ; F5D2  SFX data
        DECLE   $0388,  $00F0                   ; F5D4  SFX data
        DECLE   $0304,  $00F1                   ; F5D6  SFX data
        DECLE   $008F,  $0023                   ; F5D8  SFX data
        DECLE   $03CE                           ; F5DA  SFX data
        DECLE   $008F,  $0017                   ; F5DB  SFX data
        DECLE   $02CF                           ; F5DD  SFX end

L_F5DE:
        PSHR    R5                              ; F5DE   0275

        JSR     R5,     X_PLAY_SFX2             ; F5DF   0004 0118 03BE
        DECLE   $00FA                           ; F5E2  SFX prio
        DECLE   $002F                           ; F5E3  SFX data
        DECLE   $0035                           ; F5E4  SFX data
        DECLE   $01EB                           ; F5E5  SFX data
        DECLE   $0389                           ; F5E6  SFX data
        DECLE   $0380,  $0357                   ; F5E7  SFX data
        DECLE   $0388,  $01AC                   ; F5E9  SFX data
        DECLE   $0304,  $00D7                   ; F5EB  SFX data
        DECLE   $03EA                           ; F5ED  SFX data
        DECLE   $01EB                           ; F5EE  SFX data
        DECLE   $0388,  $00D7                   ; F5EF  SFX data
        DECLE   $0304,  $006B                   ; F5F1  SFX data
        DECLE   $03EA                           ; F5F3  SFX data
        DECLE   $01EB                           ; F5F4  SFX data
        DECLE   $0388,  $00E2                   ; F5F5  SFX data
        DECLE   $0304,  $0071                   ; F5F7  SFX data
        DECLE   $03F2                           ; F5F9  SFX data
        DECLE   $03EA                           ; F5FA  SFX data
        DECLE   $01EB                           ; F5FB  SFX data
        DECLE   $0388,  $011D                   ; F5FC  SFX data
        DECLE   $0304,  $008F                   ; F5FE  SFX data
        DECLE   $03EA                           ; F600  SFX data
        DECLE   $01EB                           ; F601  SFX data
        DECLE   $0380,  $0327                   ; F602  SFX data
        DECLE   $0388,  $00F0                   ; F604  SFX data
        DECLE   $0304,  $0078                   ; F606  SFX data
        DECLE   $03F2                           ; F608  SFX data
        DECLE   $03EA                           ; F609  SFX data
        DECLE   $01EB                           ; F60A  SFX data
        DECLE   $0388,  $00FE                   ; F60B  SFX data
        DECLE   $0304,  $007F                   ; F60D  SFX data
        DECLE   $03EA                           ; F60F  SFX data
        DECLE   $01EB                           ; F610  SFX data
        DECLE   $0380,  $02FA                   ; F611  SFX data
        DECLE   $0388,  $0140                   ; F613  SFX data
        DECLE   $0304,  $00A0                   ; F615  SFX data
        DECLE   $03F2                           ; F617  SFX data
        DECLE   $03EA                           ; F618  SFX data
        DECLE   $01EB                           ; F619  SFX data
        DECLE   $0388,  $010D                   ; F61A  SFX data
        DECLE   $0304,  $0087                   ; F61C  SFX data
        DECLE   $03EA                           ; F61E  SFX data
        DECLE   $01EB                           ; F61F  SFX data
        DECLE   $0390,  $0075                   ; F620  SFX data
        DECLE   $0388,  $011D                   ; F622  SFX data
        DECLE   $0304,  $008F                   ; F624  SFX data
        DECLE   $03EA                           ; F626  SFX data
        DECLE   $01EB                           ; F627  SFX data
        DECLE   $0388,  $0168                   ; F628  SFX data
        DECLE   $0304,  $00B4                   ; F62A  SFX data
        DECLE   $03EA                           ; F62C  SFX data
        DECLE   $01EB                           ; F62D  SFX data
        DECLE   $0388,  $011D                   ; F62E  SFX data
        DECLE   $0304,  $008F                   ; F630  SFX data
        DECLE   $03F2                           ; F632  SFX data
        DECLE   $03EA                           ; F633  SFX data
        DECLE   $01EB                           ; F634  SFX data
        DECLE   $0388,  $012E                   ; F635  SFX data
        DECLE   $0304,  $0097                   ; F637  SFX data
        DECLE   $03EA                           ; F639  SFX data
        DECLE   $01EB                           ; F63A  SFX data
        DECLE   $0380,  $03F9                   ; F63B  SFX data
        DECLE   $0388,  $017D                   ; F63D  SFX data
        DECLE   $0344,  $00BE                   ; F63F  SFX data
        DECLE   $03F2                           ; F641  SFX data
        DECLE   $03EA                           ; F642  SFX data
        DECLE   $01EB                           ; F643  SFX data
        DECLE   $0388,  $012E                   ; F644  SFX data
        DECLE   $0304,  $0097                   ; F646  SFX data
        DECLE   $03EA                           ; F648  SFX data
        DECLE   $01EB                           ; F649  SFX data
        DECLE   $0380,  $03C0                   ; F64A  SFX data
        DECLE   $0388,  $0140                   ; F64C  SFX data
        DECLE   $0304,  $00A0                   ; F64E  SFX data
        DECLE   $03F2                           ; F650  SFX data
        DECLE   $03EA                           ; F651  SFX data
        DECLE   $01EB                           ; F652  SFX data
        DECLE   $0388,  $0194                   ; F653  SFX data
        DECLE   $0304,  $00CA                   ; F655  SFX data
        DECLE   $03EA                           ; F657  SFX data
        DECLE   $01EB                           ; F658  SFX data
        DECLE   $0380,  $038A                   ; F659  SFX data
        DECLE   $0388,  $023B                   ; F65B  SFX data
        DECLE   $0384,  $017D                   ; F65D  SFX data
        DECLE   $02EB                           ; F65F  SFX data
        DECLE   $03EE                           ; F660  SFX data
        DECLE   $008F,  $001D                   ; F661  SFX data
        DECLE   $02CF                           ; F663  SFX end


        PSHR    R5                              ; F664   0275

        JSR     R5,     X_PLAY_SFX2             ; F665   0004 0118 03BE
        DECLE   $00FA                           ; F668  SFX prio
        DECLE   $002F                           ; F669  SFX data
        DECLE   $012B                           ; F66A  SFX data
        DECLE   $0035                           ; F66B  SFX data
        DECLE   $03AB                           ; F66C  SFX data
        DECLE   $0389                           ; F66D  SFX data
        DECLE   $03D0,  $0101                   ; F66E  SFX data
        DECLE   $0388,  $00FE                   ; F670  SFX data
        DECLE   $0304,  $00FF                   ; F672  SFX data
        DECLE   $03FE                           ; F674  SFX data
        DECLE   $02EB                           ; F675  SFX data
        DECLE   $0388,  $011D                   ; F676  SFX data
        DECLE   $0304,  $011E                   ; F678  SFX data
        DECLE   $03EE                           ; F67A  SFX data
        DECLE   $02EB                           ; F67B  SFX data
        DECLE   $0380,  $03F9                   ; F67C  SFX data
        DECLE   $0388,  $0140                   ; F67E  SFX data
        DECLE   $0304,  $0141                   ; F680  SFX data
        DECLE   $03F2                           ; F682  SFX data
        DECLE   $016B                           ; F683  SFX data
        DECLE   $0025                           ; F684  SFX data
        DECLE   $0015                           ; F685  SFX data
        DECLE   $016B                           ; F686  SFX data
        DECLE   $0380,  $0357                   ; F687  SFX data
        DECLE   $0388,  $011D                   ; F689  SFX data
        DECLE   $0304,  $011E                   ; F68B  SFX data
        DECLE   $02EB                           ; F68D  SFX data
        DECLE   $03EE                           ; F68E  SFX data
        DECLE   $02EB                           ; F68F  SFX data
        DECLE   $0388,  $0153                   ; F690  SFX data
        DECLE   $0304,  $0154                   ; F692  SFX data
        DECLE   $02EB                           ; F694  SFX data
        DECLE   $0385                           ; F695  SFX data
        DECLE   $03EE                           ; F696  SFX data
        DECLE   $02EB                           ; F697  SFX data
        DECLE   $0380,  $0327                   ; F698  SFX data
        DECLE   $0388,  $011D                   ; F69A  SFX data
        DECLE   $0304,  $011E                   ; F69C  SFX data
        DECLE   $03EE                           ; F69E  SFX data
        DECLE   $02EB                           ; F69F  SFX data
        DECLE   $0380,  $02FA                   ; F6A0  SFX data
        DECLE   $0388,  $012E                   ; F6A2  SFX data
        DECLE   $0304,  $012F                   ; F6A4  SFX data
        DECLE   $03FE                           ; F6A6  SFX data
        DECLE   $02EB                           ; F6A7  SFX data
        DECLE   $0388,  $0153                   ; F6A8  SFX data
        DECLE   $0304,  $0154                   ; F6AA  SFX data
        DECLE   $03EE                           ; F6AC  SFX data
        DECLE   $02EB                           ; F6AD  SFX data
        DECLE   $0388,  $017D                   ; F6AE  SFX data
        DECLE   $0304,  $017E                   ; F6B0  SFX data
        DECLE   $0385                           ; F6B2  SFX data
        DECLE   $03F2                           ; F6B3  SFX data
        DECLE   $016B                           ; F6B4  SFX data
        DECLE   $0025                           ; F6B5  SFX data
        DECLE   $0015                           ; F6B6  SFX data
        DECLE   $016B                           ; F6B7  SFX data
        DECLE   $0380,  $02A7                   ; F6B8  SFX data
        DECLE   $0388,  $0153                   ; F6BA  SFX data
        DECLE   $0304,  $0154                   ; F6BC  SFX data
        DECLE   $008F,  $0023                   ; F6BE  SFX data
        DECLE   $03CE                           ; F6C0  SFX data
        DECLE   $008F,  $0017                   ; F6C1  SFX data
        DECLE   $02CF                           ; F6C3  SFX end

L_F6C4:
        PSHR    R5                              ; F6C4   0275
        MVII    #$000A, R0                      ; F6C5   02B8 000A
        MVO     R0,     G_0146                  ; F6C7   0240 0146

        JSR     R5,     X_PLAY_SFX1             ; F6C9   0004 0118 03BB
        DECLE   $002F                           ; F6CC  SFX data
        DECLE   $02B9                           ; F6CD  SFX data
        DECLE   $003D                           ; F6CE  SFX data
        DECLE   $03C4,  $000F                   ; F6CF  SFX data
        DECLE   $00A1,  $0001                   ; F6D1  SFX data
        DECLE   $008D                           ; F6D3  SFX data
        DECLE   $000F,  $0006                   ; F6D4  SFX data
        DECLE   $03A5                           ; F6D6  SFX data
        DECLE   $03DA                           ; F6D7  SFX data
        DECLE   $03C6                           ; F6D8  SFX data
        DECLE   $0097,  $0025                   ; F6D9  SFX data
        DECLE   $0003,  $03C9                   ; F6DB  SFX data
        DECLE   $0275                           ; F6DD  SFX data
        DECLE   $0004,  $0118                   ; F6DE  SFX data
        DECLE   $03BE                           ; F6E0  SFX data
        DECLE   $00DC,  $002F                   ; F6E1  SFX data
        DECLE   $004F,  $000A                   ; F6E3  SFX data
        DECLE   $0389                           ; F6E5  SFX data
        DECLE   $0380,  $01FF                   ; F6E6  SFX data
        DECLE   $0388,  $01FE                   ; F6E8  SFX data
        DECLE   $0001,  $0338                   ; F6EA  SFX data
        DECLE   $0001,  $033A                   ; F6EC  SFX data
        DECLE   $00A3,  $03D8                   ; F6EE  SFX data
        DECLE   $03B9                           ; F6F0  SFX data
        DECLE   $03CF                           ; F6F1  SFX end

        DECLE   $006D,  $006D,  $0000,  $00B6   ; F6F2   006D 006D 0000 00B6
        DECLE   $00C0,  $00DB,  $00C0,  $00B4   ; F6F6   00C0 00DB 00C0 00B4
        DECLE   $0000,  $0054,  $00BB,  $007D   ; F6FA   0000 0054 00BB 007D
        DECLE   $007D,  $007D,  $00BB,  $00FF   ; F6FE   007D 007D 00BB 00FF
        DECLE   $0000,  $0000,  $0001,  $0003   ; F702   0000 0000 0001 0003
        DECLE   $0007,  $0007,  $00B7,  $00B3   ; F706   0007 0007 00B7 00B3
        DECLE   $0000,  $0000,  $0000,  $0000   ; F70A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $006D,  $006D   ; F70E   0000 0000 006D 006D
        DECLE   $00B6,  $00B6,  $0000,  $00DC   ; F712   00B6 00B6 0000 00DC
        DECLE   $0000,  $00B4,  $0000,  $00EC   ; F716   0000 00B4 0000 00EC
        DECLE   $00FF,  $0044,  $00BB,  $00FF   ; F71A   00FF 0044 00BB 00FF

        RSWD    R0                              ; F71E   0038
        SAR     R0,     2                       ; F71F   006C
        ADDR    R0,     R6                      ; F720   00C6
        ADDR    R2,     R7                      ; F721   00D7

        DECLE   $0000,  $00BC,  $0080,  $00D4   ; F722   0000 00BC 0080 00D4
        DECLE   $00C0,  $005C,  $0040,  $005B   ; F726   00C0 005C 0040 005B
        DECLE   $0001,  $00BA,  $0003,  $0077   ; F72A   0001 00BA 0003 0077
        DECLE   $0006,  $00D4,  $0004,  $00B5   ; F72E   0006 00D4 0004 00B5
        DECLE   $00FF,  $00EF,  $00AB,  $0083   ; F732   00FF 00EF 00AB 0083
        DECLE   $0083,  $0001,  $0001,  $0001   ; F736   0083 0001 0001 0001

        INCR    R7                              ; F73A   000F
        ADDR    R5,     R7                      ; F73B   00EF
L_F73C:
        INCR    R7                              ; F73C   000F

        RRC     R3,     2                       ; F73D   0077
L_F73E:
        DIS                                     ; F73E   0003
        DECLE   $00DB,  $0001,  $00BD,  $0000   ; F73F   00DB 0001 00BD 0000
        DECLE   $001D,  $0000,  $001B,  $0000   ; F743   001D 0000 001B 0000
L_F747:
        DECR    R7                              ; F747   0017

        DECLE   $0000,  $001D,  $0000,  $00DC   ; F748   0000 001D 0000 00DC
        DECLE   $0000,  $00B4,  $0000,  $00DC   ; F74C   0000 00B4 0000 00DC
        DECLE   $0000,  $0074,  $0000,  $0016   ; F750   0000 0074 0000 0016
        DECLE   $0000,  $003B,  $0000,  $0066   ; F754   0000 003B 0000 0066
        DECLE   $0000,  $00C6,  $0000,  $007D   ; F758   0000 00C6 0000 007D
        DECLE   $0000,  $0077,  $0000,  $00DD   ; F75C   0000 0077 0000 00DD
        DECLE   $0000,  $00C6,  $0001,  $0001   ; F760   0000 00C6 0001 0001
        DECLE   $0001,  $0083,  $00FE,  $007C   ; F764   0001 0083 00FE 007C
        DECLE   $00FE,  $007C,  $00FE,  $007C   ; F768   00FE 007C 00FE 007C
        DECLE   $00FE,  $007C,  $0038,  $0000   ; F76C   00FE 007C 0038 0000
        DECLE   $0000,  $0000,  $00E0,  $00EB   ; F770   0000 0000 00E0 00EB
        DECLE   $00E0,  $00DD,  $0080,  $00B7   ; F774   00E0 00DD 0080 00B7
        DECLE   $0000,  $006B,  $0001,  $00ED   ; F778   0000 006B 0001 00ED
        DECLE   $0001,  $005D,  $0000,  $00BA   ; F77C   0001 005D 0000 00BA
        DECLE   $0000,  $0018,  $0000,  $00EC   ; F780   0000 0018 0000 00EC
        DECLE   $0000,  $0074,  $0000,  $006E   ; F784   0000 0074 0000 006E
        DECLE   $0000,  $0033,  $0001,  $0003   ; F788   0000 0033 0001 0003
        DECLE   $0003,  $0009,  $0007,  $0045   ; F78C   0003 0009 0007 0045
        DECLE   $002F,  $00BF,  $0000,  $0000   ; F790   002F 00BF 0000 0000
        DECLE   $0000                           ; F794   0000

        NEGR    R0                              ; F795   0020
        MOVR    R5,     R0                      ; F796   00A8
        RRC     R0,     1                       ; F797   0070
        MOVR    R6,     R4                      ; F798   00B4
        ADDR    R5,     R6                      ; F799   00EE
        DECR    R2                              ; F79A   0012
        INCR    R2                              ; F79B   000A
        INCR    R6                              ; F79C   000E
        SETC                                    ; F79D   0007
        MOVR    R0,     R7                      ; F79E   0087
        INCR    R7                              ; F79F   000F
        MOVR    R1,     R7                      ; F7A0   008F
L_F7A1:
        ADDR    R1,     R7                      ; F7A1   00CF

        DECLE   $0080,  $0000,  $0084,  $0098   ; F7A2   0080 0000 0084 0098
        DECLE   $00D8,  $00DC,  $00FA,  $00FF   ; F7A6   00D8 00DC 00FA 00FF
        DECLE   $00FE,  $00FC,  $00FC,  $00F6   ; F7AA   00FE 00FC 00FC 00F6
        DECLE   $00F8,  $00BA,  $00D0,  $0040   ; F7AE   00F8 00BA 00D0 0040
        DECLE   $00BF,  $00BF,  $007F,  $007E   ; F7B2   00BF 00BF 007F 007E
        DECLE   $005C,  $001C,  $0008,  $0000   ; F7B6   005C 001C 0008 0000
        DECLE   $00FF,  $00FF,  $00FF           ; F7BA   00FF 00FF 00FF

        ADDR    R3,     R7                      ; F7BD   00DF

        RLC     R3,     2                       ; F7BE   0057
        MOVR    R1,     R7                      ; F7BF   008F

        SLL     R3,     1                       ; F7C0   004B
        DECR    R1                              ; F7C1   0011
        ADDR    R5,     R5                      ; F7C2   00ED
        ADDR    R6,     R5                      ; F7C3   00F5
        ADDR    R6,     R1                      ; F7C4   00F1
        ADDR    R7,     R0                      ; F7C5   00F8
        SARC    R0,     1                       ; F7C6   0078
        ADDR    R6,     R0                      ; F7C7   00F0
        RRC     R0,     1                       ; F7C8   0070
        GSWD    R0                              ; F7C9   0030
        SARC    R3,     2                       ; F7CA   007F
        SLLC    R3,     2                       ; F7CB   005F
L_F7CC:
        DECR    R7                              ; F7CC   0017

        DECLE   $000D,  $000C,  $0048,  $0000   ; F7CD   000D 000C 0048 0000
        DECLE   $0000,  $0000,  $0001,  $0002   ; F7D1   0000 0000 0001 0002
        DECLE   $000C,  $0010,  $0040,  $0040   ; F7D5   000C 0010 0040 0040
        DECLE   $0080,  $0080,  $0040,  $0020   ; F7D9   0080 0080 0040 0020
        DECLE   $0020,  $0010,  $0008,  $0006   ; F7DD   0020 0010 0008 0006
        DECLE   $0001,  $00C1,  $002A,  $0004   ; F7E1   0001 00C1 002A 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; F7E5   0000 0000 0000 0000
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; F7E9   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; F7ED   00FF 00FF 00FF 00FF
        DECLE   $00FF                           ; F7F1   00FF

        XORR    R1,     R6                      ; F7F2   01CE
        XORR    R7,     R6                      ; F7F3   01FE
        ANDR    R7,     R6                      ; F7F4   01BE
        XORR    R1,     R6                      ; F7F5   01CE
        XORR    R7,     R6                      ; F7F6   01FE
        XORR    R7,     R6                      ; F7F7   01FE
        XORR    R7,     R6                      ; F7F8   01FE
        XORR    R1,     R6                      ; F7F9   01CE
        XORR    R7,     R6                      ; F7FA   01FE
        XORR    R7,     R6                      ; F7FB   01FE
        XORR    R7,     R6                      ; F7FC   01FE
        XORR    R7,     R6                      ; F7FD   01FE
        XORR    R7,     R6                      ; F7FE   01FE
        XORR    R7,     R6                      ; F7FF   01FE
        XORR    R7,     R6                      ; F800   01FE
        ANDR    R7,     R6                      ; F801   01BE
        XORR    R0,     R6                      ; F802   01C6
        XORR    R1,     R6                      ; F803   01CE
        XORR    R7,     R6                      ; F804   01FE
        ANDR    R7,     R6                      ; F805   01BE
        ADDR    R7,     R5                      ; F806   00FD
        XORR    R0,     R6                      ; F807   01C6
        TSTR    R4                              ; F808   00A4
        ADDR    R7,     R5                      ; F809   00FD
        XORR    R3,     R6                      ; F80A   01DE
        XORR    R1,     R6                      ; F80B   01CE
        XORR    R2,     R6                      ; F80C   01D6
        ADDR    R7,     R5                      ; F80D   00FD
        XORR    R1,     R6                      ; F80E   01CE
        XORR    R7,     R6                      ; F80F   01FE
        XORR    R7,     R6                      ; F810   01FE
        XORR    R7,     R6                      ; F811   01FE
        ANDR    R7,     R6                      ; F812   01BE
        XORR    R2,     R6                      ; F813   01D6
        XORR    R0,     R6                      ; F814   01C6
        ADDR    R7,     R5                      ; F815   00FD
        ADDR    R7,     R5                      ; F816   00FD
        ADDR    R7,     R5                      ; F817   00FD
        XORR    R0,     R6                      ; F818   01C6
        ADDR    R7,     R5                      ; F819   00FD
        ADDR    R7,     R5                      ; F81A   00FD
        MOVR    R3,     R4                      ; F81B   009C
        ADDR    R7,     R4                      ; F81C   00FC
        MOVR    R6,     R4                      ; F81D   00B4
        ADDR    R7,     R5                      ; F81E   00FD
        ADDR    R7,     R5                      ; F81F   00FD
        ADDR    R7,     R5                      ; F820   00FD
        ADDR    R7,     R5                      ; F821   00FD
        ADDR    R7,     R5                      ; F822   00FD
        XORR    R3,     R6                      ; F823   01DE
        XORR    R3,     R6                      ; F824   01DE
        ANDR    R7,     R6                      ; F825   01BE
        ADDR    R7,     R5                      ; F826   00FD
        ADDR    R7,     R5                      ; F827   00FD
        ADDR    R7,     R5                      ; F828   00FD
        TSTR    R4                              ; F829   00A4
        MOVR    R3,     R4                      ; F82A   009C
        TSTR    R4                              ; F82B   00A4
        MOVR    R3,     R4                      ; F82C   009C
        MOVR    R6,     R4                      ; F82D   00B4
        MOVR    R5,     R4                      ; F82E   00AC
        ADDR    R7,     R4                      ; F82F   00FC
        ADDR    R7,     R4                      ; F830   00FC
        ADDR    R7,     R4                      ; F831   00FC
        MOVR    R6,     R4                      ; F832   00B4
        MOVR    R5,     R4                      ; F833   00AC
        MOVR    R6,     R4                      ; F834   00B4
        MOVR    R4,     R0                      ; F835   00A0
        ADDR    R7,     R5                      ; F836   00FD
        ADDR    R7,     R5                      ; F837   00FD
        MOVR    R5,     R4                      ; F838   00AC
        MOVR    R3,     R4                      ; F839   009C
        TSTR    R4                              ; F83A   00A4
        ADDR    R7,     R5                      ; F83B   00FD
        MOVR    R3,     R4                      ; F83C   009C
        ADDR    R7,     R4                      ; F83D   00FC
        ADDR    R7,     R4                      ; F83E   00FC
        ADD@    R1,     R4                      ; F83F   02CC
        ADDR    R0,     R4                      ; F840   00C4
        ADDR    R1,     R4                      ; F841   00CC
        ADDR    R7,     R4                      ; F842   00FC
        ADDR    R7,     R4                      ; F843   00FC
        ADDR    R7,     R4                      ; F844   00FC
        ADDR    R7,     R4                      ; F845   00FC
        ADDR    R7,     R4                      ; F846   00FC
        ADDR    R7,     R4                      ; F847   00FC
        ADDR    R2,     R4                      ; F848   00D4
        ADDR    R7,     R0                      ; F849   00F8
        ADDR    R1,     R5                      ; F84A   00CD
        MVI@    R3,     R4                      ; F84B   029C
        MVII    #$00CC, R4                      ; F84C   02BC 00CC
        ADDR    R7,     R4                      ; F84E   00FC
        PULR    R4                              ; F84F   02B4
        ADD@    R3,     R4                      ; F850   02DC
        ADDR    R7,     R4                      ; F851   00FC
        MOVR    R7,     R4                      ; F852   00BC
        ADDR    R7,     R0                      ; F853   00F8
        ADDR    R7,     R0                      ; F854   00F8
        ADDR    R7,     R0                      ; F855   00F8
        ADDR    R3,     R4                      ; F856   00DC
        ADDR    R7,     R4                      ; F857   00FC
        ADDR    R7,     R4                      ; F858   00FC
        ADDR    R7,     R4                      ; F859   00FC
        ADDR    R7,     R4                      ; F85A   00FC
        MOVR    R7,     R4                      ; F85B   00BC
        ADDR    R7,     R0                      ; F85C   00F8
        ADDR    R7,     R0                      ; F85D   00F8
        ADDR    R7,     R0                      ; F85E   00F8
        ADDR    R0,     R4                      ; F85F   00C4
        ADDR    R7,     R0                      ; F860   00F8
        ADDR    R7,     R0                      ; F861   00F8
        ADDR    R3,     R4                      ; F862   00DC
        ADDR    R7,     R4                      ; F863   00FC
        ADDR    R7,     R0                      ; F864   00F8
        ADDR    R0,     R4                      ; F865   00C4
        ADDR    R7,     R0                      ; F866   00F8
        ADDR    R7,     R0                      ; F867   00F8
        ADDR    R7,     R0                      ; F868   00F8
        ADDR    R7,     R0                      ; F869   00F8
        ADDR    R7,     R0                      ; F86A   00F8
        ADDR    R3,     R4                      ; F86B   00DC
        ADDR    R7,     R4                      ; F86C   00FC
        ADDR    R7,     R4                      ; F86D   00FC
        ADDR    R2,     R4                      ; F86E   00D4
        ADDR    R7,     R0                      ; F86F   00F8
        ADDR    R7,     R0                      ; F870   00F8
        SUBR    R3,     R6                      ; F871   011E
        SUBR    R2,     R0                      ; F872   0110
        SUBR    R1,     R0                      ; F873   0108
        SUBR    R0,     R0                      ; F874   0100
        SUBR    R4,     R6                      ; F875   0126
        ADDR    R7,     R0                      ; F876   00F8
        ADDR    R3,     R4                      ; F877   00DC
        ADDR    R7,     R0                      ; F878   00F8
        ADDR    R7,     R0                      ; F879   00F8
        ADDR    R5,     R4                      ; F87A   00EC
        ADDR    R7,     R0                      ; F87B   00F8
        ADDR    R7,     R0                      ; F87C   00F8
        ADDR    R7,     R0                      ; F87D   00F8
        ADDR    R7,     R0                      ; F87E   00F8
        ADDR    R7,     R0                      ; F87F   00F8
        ADDR    R0,     R4                      ; F880   00C4
        MOVR    R7,     R4                      ; F881   00BC
        ADDR    R7,     R0                      ; F882   00F8
        ADDR    R7,     R0                      ; F883   00F8
        ADDR    R7,     R0                      ; F884   00F8
        CMPR    R2,     R6                      ; F885   0156
        SUBR    R7,     R0                      ; F886   0138
        SUBR    R5,     R0                      ; F887   0128
        SUBR    R6,     R0                      ; F888   0130
        CMPR    R3,     R6                      ; F889   015E
        ADDR    R7,     R0                      ; F88A   00F8
        ADDR    R7,     R0                      ; F88B   00F8
        ADDR    R7,     R0                      ; F88C   00F8
        ADDR    R7,     R0                      ; F88D   00F8
        ADDR    R7,     R0                      ; F88E   00F8
        ADDR    R6,     R4                      ; F88F   00F4
        ADDR    R6,     R4                      ; F890   00F4
        ADDR    R5,     R4                      ; F891   00EC
        ADDR    R7,     R0                      ; F892   00F8
        ADDR    R7,     R0                      ; F893   00F8
        ADDR    R4,     R4                      ; F894   00E4
        ADDR    R7,     R0                      ; F895   00F8
        ADDR    R7,     R0                      ; F896   00F8
        ADDR    R7,     R0                      ; F897   00F8
        ADDR    R7,     R0                      ; F898   00F8
        CMPR    R2,     R6                      ; F899   0156
        CMPR    R1,     R0                      ; F89A   0148
        CMPR    R0,     R0                      ; F89B   0140
        ANDR    R0,     R0                      ; F89C   0180
        CMPR    R3,     R6                      ; F89D   015E
        ADDR    R7,     R0                      ; F89E   00F8
        ADDR    R7,     R0                      ; F89F   00F8
        ADDR    R7,     R0                      ; F8A0   00F8
        ADDR    R7,     R0                      ; F8A1   00F8
        ADDR    R4,     R4                      ; F8A2   00E4
        ADDR    R5,     R4                      ; F8A3   00EC
        ADDR    R7,     R0                      ; F8A4   00F8
        ADDR    R4,     R4                      ; F8A5   00E4
        ADDR    R6,     R4                      ; F8A6   00F4
        ADDR    R6,     R4                      ; F8A7   00F4
        ADDR    R7,     R0                      ; F8A8   00F8
        ADDR    R7,     R0                      ; F8A9   00F8
        ADDR    R7,     R0                      ; F8AA   00F8
        ADDR    R7,     R0                      ; F8AB   00F8
        ADDR    R7,     R0                      ; F8AC   00F8
        CMPR    R4,     R6                      ; F8AD   0166
        ANDR    R1,     R6                      ; F8AE   018E
        CMPR    R6,     R0                      ; F8AF   0170
        CMPR    R5,     R6                      ; F8B0   016E
        ANDR    R2,     R6                      ; F8B1   0196
        ADDR    R7,     R0                      ; F8B2   00F8
        ADDR    R7,     R0                      ; F8B3   00F8
        ADDR    R4,     R4                      ; F8B4   00E4
        ADDR    R6,     R4                      ; F8B5   00F4
        ADDR    R7,     R0                      ; F8B6   00F8
        ADDR    R7,     R0                      ; F8B7   00F8
        ADDR    R6,     R4                      ; F8B8   00F4
        ADDR    R7,     R0                      ; F8B9   00F8
        ADDR    R7,     R0                      ; F8BA   00F8
        ADDR    R7,     R0                      ; F8BB   00F8
        ADDR    R7,     R0                      ; F8BC   00F8
        ADDR    R7,     R0                      ; F8BD   00F8
        ADDR    R4,     R4                      ; F8BE   00E4
        ADDR    R6,     R4                      ; F8BF   00F4
        ADDR    R6,     R4                      ; F8C0   00F4
        ADDR    R7,     R0                      ; F8C1   00F8
        ADDR    R7,     R0                      ; F8C2   00F8
        CMPR    R7,     R0                      ; F8C3   0178
        ADDR    R7,     R0                      ; F8C4   00F8
        ADDR    R7,     R0                      ; F8C5   00F8
        ADDR    R6,     R4                      ; F8C6   00F4
        ADDR    R5,     R4                      ; F8C7   00EC
L_F8C8:
        PSHR    R5                              ; F8C8   0275
        MVII    #$00F0, R0                      ; F8C9   02B8 00F0
        MVII    #$0200, R4                      ; F8CB   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; F8CD   0004 0114 0338

        SDBD                                    ; F8D0   0001
        MVII    #$F6F2, R3                      ; F8D1   02BB 00F2 00F6
        SDBD                                    ; F8D4   0001
        MVII    #$3800, R2                      ; F8D5   02BA 0000 0038

        JSR     R5,     L_DD24                  ; F8D8   0004 01DC 0124

        MVII    #$0005, R0                      ; F8DB   02B8 0005
        MVII    #$0000, R1                      ; F8DD   02B9 0000
        MVII    #$0028, R5                      ; F8DF   02BD 0028
        MVO@    R0,     R5                      ; F8E1   0268
        MVO@    R1,     R5                      ; F8E2   0269
        MVO@    R0,     R5                      ; F8E3   0268
        MVO@    R1,     R5                      ; F8E4   0269
        MVO@    R1,     R5                      ; F8E5   0269
        MOVR    R2,     R4                      ; F8E6   0094
        MVII    #$0021, R1                      ; F8E7   02B9 0021

        JSR     R5,     L_D753                  ; F8E9   0004 01D4 0353

        MVO     R0,     .STIC.VIDEN             ; F8EC   0240 0020
        SDBD                                    ; F8EE   0001
        MVII    #$18FE, R1                      ; F8EF   02B9 00FE 0018
        MVII    #$0200, R4                      ; F8F2   02BC 0200
        MVII    #$001A, R0                      ; F8F4   02B8 001A

        JSR     R5,     X_FILL_MEM              ; F8F6   0004 0114 0341

        MVII    #$021A, R2                      ; F8F9   02BA 021A
        SDBD                                    ; F8FB   0001
        MVII    #$F7F2, R4                      ; F8FC   02BC 00F2 00F7
        MVII    #$00D6, R3                      ; F8FF   02BB 00D6

        JSR     R5,     L_D73F                  ; F901   0004 01D4 033F

        MVII    #$0058, R0                      ; F904   02B8 0058
        MVO     R0,     G_0170                  ; F906   0240 0170
        MVII    #$0080, R1                      ; F908   02B9 0080
        MVI     G_0161, R3                      ; F90A   0283 0161
        CMPI    #$001F, R3                      ; F90C   037B 001F
        BNEQ    L_F912                          ; F90E   020C 0002

        MVII    #$0008, R1                      ; F910   02B9 0008
L_F912:
        MVO     R1,     G_016E                  ; F912   0241 016E
        MVO     R1,     G_0165                  ; F914   0241 0165
        MVO     R0,     G_0167                  ; F916   0240 0167
        CLRR    R2                              ; F918   01D2
        MVII    #$0044, R1                      ; F919   02B9 0044
        MVO     R2,     G_0322                  ; F91B   0242 0322
        MVO     R2,     G_0326                  ; F91D   0242 0326
        CLRR    R0                              ; F91F   01C0
        MVO     R0,     G_031D                  ; F920   0240 031D
        SDBD                                    ; F922   0001
        MVII    #$5DD9, R0                      ; F923   02B8 00D9 005D
        SDBD                                    ; F926   0001
        MVII    #$5EA9, R1                      ; F927   02B9 00A9 005E
        MVO     R0,     G_0345                  ; F92A   0240 0345
        MVO     R1,     G_0346                  ; F92C   0241 0346
        PULR    R7                              ; F92E   02B7

L_F92F:
        PSHR    R5                              ; F92F   0275
        MVII    #$00DC, R0                      ; F930   02B8 00DC
        MVII    #$0200, R4                      ; F932   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; F934   0004 0114 0338

        SDBD                                    ; F937   0001
        MVII    #$F9BC, R3                      ; F938   02BB 00BC 00F9
        SDBD                                    ; F93B   0001
        MVII    #$3800, R2                      ; F93C   02BA 0000 0038

        JSR     R5,     L_DD24                  ; F93F   0004 01DC 0124

        MVII    #$0001, R0                      ; F942   02B8 0001
        MVII    #$0000, R1                      ; F944   02B9 0000
        MVII    #$0028, R5                      ; F946   02BD 0028
        MVO@    R1,     R5                      ; F948   0269
        MVO@    R0,     R5                      ; F949   0268
        MVO@    R1,     R5                      ; F94A   0269
        MVO@    R0,     R5                      ; F94B   0268
        MVO@    R1,     R5                      ; F94C   0269
        CLRR    R4                              ; F94D   01E4
        MVII    #$00FF, R0                      ; F94E   02B8 00FF
L_F950:
        MVO@    R0,     R4                      ; F950   0260
        MVO@    R0,     R4                      ; F951   0260
        CMPI    #$0008, R4                      ; F952   037C 0008
        BLT     L_F950                          ; F954   0225 0005

        MOVR    R2,     R4                      ; F956   0094
        MVII    #$000D, R1                      ; F957   02B9 000D

        JSR     R5,     L_D753                  ; F959   0004 01D4 0353

        MVO     R0,     .STIC.VIDEN             ; F95C   0240 0020
        SDBD                                    ; F95E   0001
        MVII    #$1838, R0                      ; F95F   02B8 0038 0018
        MVO     R0,     .BTAB.6F                ; F962   0240 026F
        SDBD                                    ; F964   0001
        MVII    #$F970, R4                      ; F965   02BC 0070 00F9
        MVII    #$027D, R2                      ; F968   02BA 027D
        MVII    #$004C, R3                      ; F96A   02BB 004C

        JSR     R5,     L_D73F                  ; F96C   0004 01D4 033F

        PULR    R7                              ; F96F   02B7

        DECLE   $0138,  $0038,  $0038,  $0038   ; F970   0138 0038 0038 0038
        DECLE   $0038,  $0120,  $0140,  $0140   ; F974   0038 0120 0140 0140
        DECLE   $0059,  $0038,  $0038,  $0038   ; F978   0059 0038 0038 0038
        DECLE   $0038,  $0038,  $0038,  $0208   ; F97C   0038 0038 0038 0208
        DECLE   $0338,  $0120,  $0029,  $0150   ; F980   0338 0120 0029 0150
        DECLE   $0140,  $0031,  $0039,  $0138   ; F984   0140 0031 0039 0138
        DECLE   $0148,  $0029,  $0150,  $0031   ; F988   0148 0029 0150 0031
        DECLE   $0148,  $0029,  $0039,  $0120   ; F98C   0148 0029 0039 0120
        DECLE   $0031,  $0148,  $0041,  $0241   ; F990   0031 0148 0041 0241
        DECLE   $0219,  $0011,  $0148,  $0031   ; F994   0219 0011 0148 0031
        DECLE   $0148,  $0001,  $0208,  $0219   ; F998   0148 0001 0208 0219
        DECLE   $0011,  $0049,  $0041,  $0039   ; F99C   0011 0049 0041 0039
        DECLE   $0031,  $0001,  $0011,  $0049   ; F9A0   0031 0001 0011 0049
        DECLE   $0148,  $0059,  $0001,  $0241   ; F9A4   0148 0059 0001 0241
        DECLE   $0041,  $0041,  $0211,  $0001   ; F9A8   0041 0041 0211 0001
        DECLE   $0208,  $0041,  $0041,  $0041   ; F9AC   0208 0041 0041 0041
        DECLE   $0041,  $0211,  $0001,  $0019   ; F9B0   0041 0211 0001 0019
        DECLE   $0019,  $0241,  $0041,  $0211   ; F9B4   0019 0241 0041 0211
        DECLE   $0040,  $0001,  $0241,  $0240   ; F9B8   0040 0001 0241 0240
        DECLE   $0001,  $0003,  $0003,  $0009   ; F9BC   0001 0003 0003 0009
        DECLE   $0007,  $0045,  $002F,  $00BF   ; F9C0   0007 0045 002F 00BF
        DECLE   $00BF,  $00BF,  $007F,  $007D   ; F9C4   00BF 00BF 007F 007D
        DECLE   $005C,  $001C,  $0018,  $0018   ; F9C8   005C 001C 0018 0018
        DECLE   $0080,  $0000,  $0080,  $0084   ; F9CC   0080 0000 0080 0084
        DECLE   $00D8,  $00D8,  $00FC,  $00FA   ; F9D0   00D8 00D8 00FC 00FA
        DECLE   $0012,  $00A5,  $00F7,  $00FF   ; F9D4   0012 00A5 00F7 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; F9D8   00FF 00FF 00FF 00FF
        DECLE   $0001,  $0003,  $0006,  $000D   ; F9DC   0001 0003 0006 000D
        DECLE   $0009,  $001B,  $0076,  $00AC   ; F9E0   0009 001B 0076 00AC
        DECLE   $0000,  $0080,  $00C0,  $00E0   ; F9E4   0000 0080 00C0 00E0
        DECLE   $00F8,  $00DC,  $006E,  $0025   ; F9E8   00F8 00DC 006E 0025
        DECLE   $00C0,  $0060,  $0034,  $008E   ; F9EC   00C0 0060 0034 008E
        DECLE   $0051,  $0024,  $0082,  $0001   ; F9F0   0051 0024 0082 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; F9F4   0000 0000 0000 0000
        DECLE   $0000,  $0020,  $0071,  $00EA   ; F9F8   0000 0020 0071 00EA
        DECLE   $00B8,  $007C,  $00F4,  $00E2   ; F9FC   00B8 007C 00F4 00E2
        DECLE   $00E1,  $0040,  $0028,  $0012   ; FA00   00E1 0040 0028 0012
        DECLE   $0001,  $0082,  $0024,  $0051   ; FA04   0001 0082 0024 0051
        DECLE   $008E,  $0034,  $0060,  $00C0   ; FA08   008E 0034 0060 00C0
        DECLE   $0003,  $0007,  $000E,  $000C   ; FA0C   0003 0007 000E 000C
        DECLE   $001C,  $0038,  $0068,  $00D0   ; FA10   001C 0038 0068 00D0
        DECLE   $0000,  $0040,  $00E0,  $0070   ; FA14   0000 0040 00E0 0070
        DECLE   $00BC,  $00DE,  $004E,  $0023   ; FA18   00BC 00DE 004E 0023
        DECLE   $0006,  $000C,  $0006,  $000C   ; FA1C   0006 000C 0006 000C
        DECLE   $0002,  $0002,  $0000,  $0000   ; FA20   0002 0002 0000 0000
        DECLE   $0018,  $0010,  $0000,  $0000   ; FA24   0018 0010 0000 0000
        DECLE   $0000,  $0000,  $0018,  $000C   ; FA28   0000 0000 0018 000C
        DECLE   $000C,  $0018,  $000C,  $0018   ; FA2C   000C 0018 000C 0018
        DECLE   $0004,  $0004,  $0000,  $0000   ; FA30   0004 0004 0000 0000
        DECLE   $0030,  $0020,  $0000,  $0000   ; FA34   0030 0020 0000 0000
        DECLE   $0000,  $0028,  $0028,  $003C   ; FA38   0000 0028 0028 003C
        DECLE   $000C,  $0018,  $000C,  $0018   ; FA3C   000C 0018 000C 0018
        DECLE   $0004,  $0004,  $0000,  $0000   ; FA40   0004 0004 0000 0000
        DECLE   $0030,  $0020,  $0000,  $0000   ; FA44   0030 0020 0000 0000
        DECLE   $0000,  $0000,  $0050,  $0078   ; FA48   0000 0000 0050 0078
        DECLE   $0006,  $000C,  $0006,  $000C   ; FA4C   0006 000C 0006 000C
        DECLE   $0002,  $0000,  $0000,  $0000   ; FA50   0002 0000 0000 0000
        DECLE   $0018,  $0010,  $0000,  $0000   ; FA54   0018 0010 0000 0000
        DECLE   $0000,  $0028,  $002C,  $0030   ; FA58   0000 0028 002C 0030
        DECLE   $0000,  $0002,  $0004,  $000C   ; FA5C   0000 0002 0004 000C
        DECLE   $001E,  $001E,  $001C,  $0009   ; FA60   001E 001E 001C 0009
        DECLE   $0000,  $000C,  $000C,  $000C   ; FA64   0000 000C 000C 000C
        DECLE   $0004,  $000C,  $0000,  $0000   ; FA68   0004 000C 0000 0000
        DECLE   $0000,  $0004,  $0008,  $0038   ; FA6C   0000 0004 0008 0038
        DECLE   $003C,  $003E,  $003B,  $0010   ; FA70   003C 003E 003B 0010
        DECLE   $0000,  $0018,  $0018,  $0018   ; FA74   0000 0018 0018 0018
        DECLE   $0018,  $0018,  $0008,  $0008   ; FA78   0018 0018 0008 0008
        DECLE   $0000,  $0004,  $0008,  $0018   ; FA7C   0000 0004 0008 0018
        DECLE   $003D,  $003F,  $003C,  $0030   ; FA80   003D 003F 003C 0030
        DECLE   $0000,  $0030,  $0038,  $0038   ; FA84   0000 0030 0038 0038
        DECLE   $0068,  $0050,  $0000,  $0000   ; FA88   0068 0050 0000 0000
        DECLE   $0000,  $0002,  $0004,  $000C   ; FA8C   0000 0002 0004 000C
        DECLE   $000E,  $000E,  $000D,  $0008   ; FA90   000E 000E 000D 0008
        DECLE   $0000,  $001C,  $0016,  $0012   ; FA94   0000 001C 0016 0012
        DECLE   $0034,  $0020,  $0000,  $0000   ; FA98   0034 0020 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FA9C   0000 0000 0000 0000
        DECLE   $0001,  $0002,  $0004,  $0008   ; FAA0   0001 0002 0004 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; FAA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FAA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FAAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000F   ; FAB0   0000 0000 0000 000F
        DECLE   $0000,  $0000,  $0000,  $0000   ; FAB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FAB8   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0002,  $0004   ; FABC   0000 0001 0002 0004
        DECLE   $0008,  $0000,  $0000,  $0000   ; FAC0   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FAC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FAC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FACC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FAD0   0000 0000 0000 0000
        DECLE   $0008,  $0004,  $0002,  $0001   ; FAD4   0008 0004 0002 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; FAD8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FADC   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0004,  $0000   ; FAE0   0000 0010 0004 0000
        DECLE   $0014,  $0000,  $0008,  $0000   ; FAE4   0014 0000 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FAE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; FAEC   0000 0000 0000 0008
        DECLE   $0000,  $0002,  $0008,  $0000   ; FAF0   0000 0002 0008 0000
        DECLE   $0014,  $0002,  $0000,  $0008   ; FAF4   0014 0002 0000 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; FAF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0004   ; FAFC   0000 0000 0010 0004

        EIS                                     ; FB00   0002
        INCR    R0                              ; FB01   0008
        DECR    R0                              ; FB02   0010
        EIS                                     ; FB03   0002

        JSR     R4,     .EXEC.002               ; FB04   0004 0010 0002
        DECLE   $0000,  $0008,  $0000,  $0000   ; FB07   0000 0008 0000 0000
        DECLE   $0000                           ; FB0B   0000

        JSR     R4,     .EXEC.002               ; FB0C   0004 0010 0002
        DECLE   $0001,  $0008,  $0000,  $0010   ; FB0F   0001 0008 0000 0010
        DECLE   $000A,  $0000,  $0000,  $0011   ; FB13   000A 0000 0000 0011
        DECLE   $0000,  $0002,  $0000,  $0008   ; FB17   0000 0002 0000 0008
        DECLE   $0000,  $0000,  $0008,  $0001   ; FB1B   0000 0000 0008 0001
        DECLE   $0004,  $0000,  $0000,  $0000   ; FB1F   0004 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; FB23   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; FB27   0000 0000 0000 0001
        DECLE   $0010,  $0000,  $0000,  $0000   ; FB2B   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0060   ; FB2F   0000 0000 0000 0060
        DECLE   $00F0,  $0064,  $0000,  $0000   ; FB33   00F0 0064 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FB37   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FB3B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0070   ; FB3F   0000 0000 0000 0070
        DECLE   $00EC,  $0050,  $0000,  $0000   ; FB43   00EC 0050 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FB47   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FB4B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0070   ; FB4F   0000 0000 0000 0070
        DECLE   $00E3,  $0048,  $0000,  $0000   ; FB53   00E3 0048 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FB57   0000 0000 0000 0000
        DECLE   $0000,  $00E0,  $00E0,  $00E0   ; FB5B   0000 00E0 00E0 00E0
        DECLE   $00E0,  $00C0,  $00C0,  $00C0   ; FB5F   00E0 00C0 00C0 00C0
        DECLE   $00C0,  $001F,  $001F,  $000E   ; FB63   00C0 001F 001F 000E
        DECLE   $000E,  $0004,  $0004,  $0000   ; FB67   000E 0004 0004 0000
        DECLE   $0000,  $0001,  $0001,  $0001   ; FB6B   0000 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FB6F   0001 0001 0001 0001
        DECLE   $0001,  $00C0,  $00C0,  $0080   ; FB73   0001 00C0 00C0 0080
        DECLE   $0080,  $0080,  $0000,  $0000   ; FB77   0080 0080 0000 0000
        DECLE   $0000,  $0078,  $0070,  $0030   ; FB7B   0000 0078 0070 0030
        DECLE   $0030,  $0030,  $0010,  $0010   ; FB7F   0030 0030 0010 0010
        DECLE   $0010,  $0000,  $0000,  $0000   ; FB83   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FB87   0000 0000 0000 0000
        DECLE   $0003,  $0010,  $0010,  $0010   ; FB8B   0003 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; FB8F   0010 0010 0010 0010
        DECLE   $00FF,  $0000,  $0000,  $0000   ; FB93   00FF 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FB97   0000 0000 0000 0000
        DECLE   $00F0,  $0001,  $0001,  $0001   ; FB9B   00F0 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FB9F   0001 0001 0001 0001
        DECLE   $001F,  $0007,  $0002,  $0002   ; FBA3   001F 0007 0002 0002
        DECLE   $0002,  $0002,  $0002,  $0002   ; FBA7   0002 0002 0002 0002
        DECLE   $0002,  $0003,  $0003,  $0003   ; FBAB   0002 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; FBAF   0003 0003 0003 0003
        DECLE   $007F,  $00C0,  $00C0,  $00C0   ; FBB3   007F 00C0 00C0 00C0
        DECLE   $0080,  $0080,  $0080,  $0080   ; FBB7   0080 0080 0080 0080
        DECLE   $0080,  $0000,  $0000,  $0004   ; FBBB   0080 0000 0000 0004
        DECLE   $0004,  $0008,  $000C,  $0000   ; FBBF   0004 0008 000C 0000
        DECLE   $0000,  $0008,  $0008,  $0008   ; FBC3   0000 0008 0008 0008
        DECLE   $0004,  $0006,  $0007,  $0003   ; FBC7   0004 0006 0007 0003
        DECLE   $0003,  $0007,  $0003,  $0001   ; FBCB   0003 0007 0003 0001
        DECLE   $0000,  $0000,  $0000,  $0080   ; FBCF   0000 0000 0000 0080
        DECLE   $00C0,  $00FF,  $00FF,  $00FF   ; FBD3   00C0 00FF 00FF 00FF
        DECLE   $00FF,  $007F,  $003F,  $001F   ; FBD7   00FF 007F 003F 001F

        INCR    R7                              ; FBDB   000F

        ADDR    R6,     R0                      ; FBDC   00F0
L_FBDD:
        ADDR    R6,     R0                      ; FBDD   00F0
        DECLE   $00F0,  $00F0,  $00F0,  $00F0   ; FBDE   00F0 00F0 00F0 00F0
        DECLE   $00F0,  $00F0,  $0001,  $0001   ; FBE2   00F0 00F0 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FBE6   0001 0001 0001 0001
        DECLE   $001F,  $001F,  $0002,  $0003   ; FBEA   001F 001F 0002 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; FBEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0002   ; FBF2   0000 0000 0002 0002
        DECLE   $0003,  $0003,  $0007,  $0007   ; FBF6   0003 0003 0007 0007
        DECLE   $0003,  $0001,  $0000,  $0000   ; FBFA   0003 0001 0000 0000
        DECLE   $0000,  $0000                   ; FBFE   0000 0000

        TSTR    R0                              ; FC00   0080
L_FC01:
        ADDR    R0,     R0                      ; FC01   00C0
        ADDR    R4,     R0                      ; FC02   00E0
L_FC03:
        ADDR    R6,     R0                      ; FC03   00F0
        DECLE   $00FF,  $007F,  $003F,  $001F   ; FC04   00FF 007F 003F 001F
L_FC08:
        INCR    R7                              ; FC08   000F

        SETC                                    ; FC09   0007
L_FC0A:
        DIS                                     ; FC0A   0003
        DECLE   $0001,  $0080,  $0080,  $0000   ; FC0B   0001 0080 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC0F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC13   0000 0000 0000 0000
        DECLE   $0044,  $0044,  $00EE,  $00EE   ; FC17   0044 0044 00EE 00EE
        DECLE   $00FF,  $0000,  $0000,  $0000   ; FC1B   00FF 0000 0000 0000
        DECLE   $0000,  $000E,  $000E,  $001F   ; FC1F   0000 000E 000E 001F
        DECLE   $001F                           ; FC23   001F

        SETC                                    ; FC24   0007
        SETC                                    ; FC25   0007
        SETC                                    ; FC26   0007
        SETC                                    ; FC27   0007
        SETC                                    ; FC28   0007
        SETC                                    ; FC29   0007
        SETC                                    ; FC2A   0007
        INCR    R7                              ; FC2B   000F

        ADDR    R6,     R0                      ; FC2C   00F0
L_FC2D:
        ADDR    R6,     R0                      ; FC2D   00F0
        DECLE   $00F0,  $00F0,  $00F0,  $00F0   ; FC2E   00F0 00F0 00F0 00F0
        DECLE   $00F0,  $00F0,  $0001,  $0001   ; FC32   00F0 00F0 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; FC36   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0000,  $0000   ; FC3A   0001 0001 0000 0000
        DECLE   $0080,  $0080,  $00C0,  $00C0   ; FC3E   0080 0080 00C0 00C0
        DECLE   $00E0,  $00E0,  $0000,  $0000   ; FC42   00E0 00E0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC46   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $00FF,  $007F   ; FC4A   0000 0001 00FF 007F
        DECLE   $003F,  $001F                   ; FC4E   003F 001F

        INCR    R7                              ; FC50   000F

        SETC                                    ; FC51   0007
L_FC52:
        DIS                                     ; FC52   0003
        DECLE   $0001,  $00FF,  $00FF,  $00F8   ; FC53   0001 00FF 00FF 00F8
        DECLE   $00FA,  $00FA,  $00FA,  $00F8   ; FC57   00FA 00FA 00FA 00F8
        DECLE   $00FF,  $00FF,  $00FF,  $008F   ; FC5B   00FF 00FF 00FF 008F
        DECLE   $00BF,  $009F,  $00BF,  $00BF   ; FC5F   00BF 009F 00BF 00BF
        DECLE   $00FF,  $00FF,  $00FF,  $0015   ; FC63   00FF 00FF 00FF 0015
        DECLE   $00B5,  $00B1,  $00B5,  $00B5   ; FC67   00B5 00B1 00B5 00B5
        DECLE   $00FF,  $00FF,  $00FF,  $001E   ; FC6B   00FF 00FF 00FF 001E
        DECLE   $007E,  $003E,  $007E,  $001F   ; FC6F   007E 003E 007E 001F
        DECLE   $00FF,  $00FF,  $00FF,  $00D6   ; FC73   00FF 00FF 00FF 00D6
        DECLE   $00D2,  $00D4,  $00D6,  $0036   ; FC77   00D2 00D4 00D6 0036
        DECLE   $00FF,  $00FF,  $00FF,  $00AD   ; FC7B   00FF 00FF 00FF 00AD
        DECLE   $00AD,  $00AD,  $00B3,  $00B3   ; FC7F   00AD 00AD 00B3 00B3
        DECLE   $00FF,  $00FF,  $00FF,  $0011   ; FC83   00FF 00FF 00FF 0011
        DECLE   $0076,  $0031,  $0076,  $0016   ; FC87   0076 0031 0076 0016
        DECLE   $00FF,  $00FF,  $00FF,  $0088   ; FC8B   00FF 00FF 00FF 0088
        DECLE   $00BB,  $0089,  $00EB,  $0088   ; FC8F   00BB 0089 00EB 0088
        DECLE   $00FF,  $00FF,  $00FE,  $00FC   ; FC93   00FF 00FF 00FE 00FC
        DECLE   $00F8,  $00F0,  $00E0,  $00C0   ; FC97   00F8 00F0 00E0 00C0
        DECLE   $0080,  $00FF,  $00FF,  $00FF   ; FC9B   0080 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; FC9F   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $003C,  $0042,  $0099   ; FCA3   00FF 003C 0042 0099
        DECLE   $00A1,  $00A1,  $0099,  $0042   ; FCA7   00A1 00A1 0099 0042
        DECLE   $003C,  $0000,  $0000,  $0000   ; FCAB   003C 0000 0000 0000
        DECLE   $00E0,  $0040,  $005F,  $0055   ; FCAF   00E0 0040 005F 0055
        DECLE   $0055,  $00B8,  $007C,  $00F4   ; FCB3   0055 00B8 007C 00F4
        DECLE   $00E2,  $00E1,  $0040,  $0028   ; FCB7   00E2 00E1 0040 0028
        DECLE   $0012,  $0000,  $0000,  $0000   ; FCBB   0012 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0062   ; FCBF   0000 0000 0000 0062
        DECLE   $00F7,  $0001,  $0003,  $0007   ; FCC3   00F7 0001 0003 0007
        DECLE   $0007,  $000E,  $003D,  $0068   ; FCC7   0007 000E 003D 0068
        DECLE   $0090,  $0080,  $0040,  $00A0   ; FCCB   0090 0080 0040 00A0
        DECLE   $00B8,  $00DC,  $00CC,  $0067   ; FCCF   00B8 00DC 00CC 0067
        DECLE   $00BB,  $00D8,  $00EC,  $00E6   ; FCD3   00BB 00D8 00EC 00E6
        DECLE   $00F2,  $00DD,  $00EB,  $0031   ; FCD7   00F2 00DD 00EB 0031
        DECLE   $001C,  $0003,  $0006,  $000C   ; FCDB   001C 0003 0006 000C
        DECLE   $000B,  $0036,  $005C,  $00E0   ; FCDF   000B 0036 005C 00E0
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCE3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0030,  $007C   ; FCE7   0000 0000 0030 007C
        DECLE   $00FF,  $0000                   ; FCEB   00FF 0000

        MOVR    R0,     R3                      ; FCED   0083
        ADDR    R0,     R7                      ; FCEE   00C7

        DECLE   $00AE,  $00FD,  $00F9,  $007F   ; FCEF   00AE 00FD 00F9 007F
        DECLE   $003E,  $0063,  $008C,  $0000   ; FCF3   003E 0063 008C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCF7   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $00D4,  $00A8   ; FCFB   0000 0080 00D4 00A8
        DECLE   $00D4,  $0080,  $0080,  $0080   ; FCFF   00D4 0080 0080 0080
        DECLE   $0080,  $00D5,  $00AA,  $00D5   ; FD03   0080 00D5 00AA 00D5
        DECLE   $0080,  $0080,  $0080,  $0080   ; FD07   0080 0080 0080 0080
        DECLE   $0080,  $00EE,  $0000,  $00BB   ; FD0B   0080 00EE 0000 00BB
        DECLE   $0000,  $00EE,  $0000,  $00BB   ; FD0F   0000 00EE 0000 00BB
        DECLE   $0000,  $00AA,  $00AA,  $00FE   ; FD13   0000 00AA 00AA 00FE
        DECLE   $0000,  $006C,  $0000,  $0074   ; FD17   0000 006C 0000 0074
        DECLE   $0000,  $00AA,  $00AA,  $00FF   ; FD1B   0000 00AA 00AA 00FF
        DECLE   $0000,  $00DD,  $0000,  $00BB   ; FD1F   0000 00DD 0000 00BB
        DECLE   $0000,  $00AA,  $00AA,  $00FF   ; FD23   0000 00AA 00AA 00FF
        DECLE   $0000,  $005D,  $0000,  $003B   ; FD27   0000 005D 0000 003B
        DECLE   $0000,  $00AA,  $00AA,  $00FE   ; FD2B   0000 00AA 00AA 00FE
        DECLE   $0000,  $00DC,  $0000,  $00B8   ; FD2F   0000 00DC 0000 00B8
        DECLE   $0000,  $00D8,  $0000,  $00D8   ; FD33   0000 00D8 0000 00D8
        DECLE   $0000,  $00D8,  $0000,  $00D8   ; FD37   0000 00D8 0000 00D8
        DECLE   $0000,  $002E,  $0000,  $003B   ; FD3B   0000 002E 0000 003B
        DECLE   $0000,  $002E,  $0000,  $003B   ; FD3F   0000 002E 0000 003B
        DECLE   $0000,  $00C6,  $0000,  $0083   ; FD43   0000 00C6 0000 0083
        DECLE   $0000,  $0082,  $0000,  $00BB   ; FD47   0000 0082 0000 00BB
        DECLE   $0000,  $0000,  $0000,  $0000   ; FD4B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00AA,  $00AA   ; FD4F   0000 0000 00AA 00AA
        DECLE   $00FE,  $0044,  $0008,  $004C   ; FD53   00FE 0044 0008 004C
        DECLE   $00B2,  $005D,  $00B6,  $00C8   ; FD57   00B2 005D 00B6 00C8
        DECLE   $005D,  $0008,  $0000,  $000A   ; FD5B   005D 0008 0000 000A
        DECLE   $0014,  $0008,  $0016,  $0029   ; FD5F   0014 0008 0016 0029
        DECLE   $0052,  $0000,  $0000,  $0001   ; FD63   0052 0000 0000 0001
        DECLE   $0080,  $0001,  $00A2,  $0055   ; FD67   0080 0001 00A2 0055
        DECLE   $009A,  $0080,  $0000,  $0040   ; FD6B   009A 0080 0000 0040
        DECLE   $0090,  $0048,  $00B0,  $0048   ; FD6F   0090 0048 00B0 0048
        DECLE   $0015,  $0002,  $0000,  $0002   ; FD73   0015 0002 0000 0002
        DECLE   $0005,  $000A,  $0005,  $001A   ; FD77   0005 000A 0005 001A
        DECLE   $0044,  $000A,  $0015,  $005A   ; FD7B   0044 000A 0015 005A
        DECLE   $00B7,  $002A,  $0055,  $00AA   ; FD7F   00B7 002A 0055 00AA
        DECLE   $0044,  $0000,  $0000,  $0000   ; FD83   0044 0000 0000 0000
        DECLE   $0000,  $0080,  $0040,  $0080   ; FD87   0000 0080 0040 0080
        DECLE   $0050,  $0080,  $0040,  $00A0   ; FD8B   0050 0080 0040 00A0
        DECLE   $0048,  $00A0,  $00B0,  $0058   ; FD8F   0048 00A0 00B0 0058
        DECLE   $0044,  $0000,  $0000,  $0008   ; FD93   0044 0000 0000 0008
        DECLE   $0000,  $0008,  $0014,  $0028   ; FD97   0000 0008 0014 0028
        DECLE   $005A,  $0014,  $002A,  $0055   ; FD9B   005A 0014 002A 0055
        DECLE   $00AA,  $0016,  $0069,  $00B6   ; FD9F   00AA 0016 0069 00B6
        DECLE   $0059,  $0054,  $00AA,  $0055   ; FDA3   0059 0054 00AA 0055
        DECLE   $00E8,  $0054,  $00AA,  $0055   ; FDA7   00E8 0054 00AA 0055
        DECLE   $0022,  $0018,  $0018,  $002C   ; FDAB   0022 0018 0018 002C
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDAF   0000 0000 0000 0000
        DECLE   $0000,  $0007,  $0007,  $000D   ; FDB3   0000 0007 0007 000D
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDB7   0000 0000 0000 0000
        DECLE   $0000,  $006A,  $006A,  $00DB   ; FDBB   0000 006A 006A 00DB
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDBF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0052   ; FDC3   0000 0000 0000 0052
        DECLE   $0000,  $0000,  $0000,  $0000   ; FDC7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $001C,  $001C   ; FDCB   0000 0000 001C 001C
        DECLE   $001C,  $001C,  $001C,  $0000   ; FDCF   001C 001C 001C 0000
        DECLE   $0000,  $000C,  $000C,  $000C   ; FDD3   0000 000C 000C 000C
        DECLE   $003F,  $001A,  $001A,  $001A   ; FDD7   003F 001A 001A 001A
        DECLE   $001A,  $001A,  $001A,  $001A   ; FDDB   001A 001A 001A 001A
        DECLE   $001A,  $001A,  $001A,  $000E   ; FDDF   001A 001A 001A 000E
        DECLE   $0004,  $0000,  $0000,  $0006   ; FDE3   0004 0000 0000 0006
        DECLE   $000B,  $0007,  $000A,  $0001   ; FDE7   000B 0007 000A 0001
        DECLE   $0000,  $0000,  $0000,  $000D   ; FDEB   0000 0000 0000 000D
        DECLE   $001E,  $0014,  $000A,  $0000   ; FDEF   001E 0014 000A 0000
        DECLE   $0000,  $0000,  $0020,  $0014   ; FDF3   0000 0000 0020 0014
        DECLE   $0038,  $0034,  $0018,  $0000   ; FDF7   0038 0034 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0050   ; FDFB   0000 0000 0000 0050
        DECLE   $0028,  $0070,  $00B0,  $0000   ; FDFF   0028 0070 00B0 0000
        DECLE   $0000,  $0000,  $0000,  $0060   ; FE03   0000 0000 0000 0060
        DECLE   $00B0,  $0070,  $00A0,  $0010   ; FE07   00B0 0070 00A0 0010
        DECLE   $0000,  $0000,  $0000,  $00D0   ; FE0B   0000 0000 0000 00D0
        DECLE   $00E0,  $0040,  $00A0,  $0000   ; FE0F   00E0 0040 00A0 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; FE13   0000 0000 0000 0040
        DECLE   $0080,  $0040,  $0080,  $0000   ; FE17   0080 0040 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE1B   0000 0000 0000 0000
        DECLE   $0080,  $0000,  $0000,  $0000   ; FE1F   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE23   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE27   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE2B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE2F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE33   0000 0000 0000 0000
        DECLE   $0001,  $0001,  $0000,  $0000   ; FE37   0001 0001 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0001   ; FE3B   0000 0000 0002 0001
        DECLE   $0003,  $0003,  $0001,  $0000   ; FE3F   0003 0003 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0005   ; FE43   0000 0000 0000 0005
        DECLE   $0002,  $0007,  $000B,  $0000   ; FE47   0002 0007 000B 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE4B   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0000,  $0000   ; FE4F   0000 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; FE53   0000 0000 0000 0006
        DECLE   $000F,  $000A,  $0000,  $0000   ; FE57   000F 000A 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; FE5B   0000 0000 0000 000C
        DECLE   $0016,  $002E,  $0014,  $0000   ; FE5F   0016 002E 0014 0000
        DECLE   $0000,  $0000,  $0000,  $001A   ; FE63   0000 0000 0000 001A
        DECLE   $003C,  $002A,  $0014,  $0020   ; FE67   003C 002A 0014 0020
        DECLE   $0000,  $0000,  $0000,  $0030   ; FE6B   0000 0000 0000 0030
        DECLE   $0058,  $00B8,  $0050,  $0000   ; FE6F   0058 00B8 0050 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE73   0000 0000 0000 0000
        DECLE   $0050,  $00F0,  $0060,  $0000   ; FE77   0050 00F0 0060 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE7B   0000 0000 0000 0000
        DECLE   $0040,  $0080,  $00C0,  $0000   ; FE7F   0040 0080 00C0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE83   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $0000,  $0000   ; FE87   0000 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE8B   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0000,  $0000   ; FE8F   0000 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FE93   0000 0000 0000 0000
        DECLE   $0002,  $0000,  $0000,  $0000   ; FE97   0002 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001A   ; FE9B   0000 0000 0000 001A
        DECLE   $003C,  $0028,  $0014,  $0000   ; FE9F   003C 0028 0014 0000
        DECLE   $0000,  $0000,  $0020,  $0014   ; FEA3   0000 0000 0020 0014
        DECLE   $0038,  $0034,  $0018,  $0000   ; FEA7   0038 0034 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0028   ; FEAB   0000 0000 0000 0028
        DECLE   $0014,  $0038,  $0058,  $0000   ; FEAF   0014 0038 0058 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; FEB3   0000 0000 0000 0018
        DECLE   $002C,  $001C,  $0028,  $0004   ; FEB7   002C 001C 0028 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEBB   0000 0000 0000 0000
        DECLE   $0000,  $00F9,  $0000,  $00E6   ; FEBF   0000 00F9 0000 00E6
        DECLE   $0000,  $0098,  $0000,  $003C   ; FEC3   0000 0098 0000 003C
        DECLE   $0000,  $000C,  $0000,  $0002   ; FEC7   0000 000C 0000 0002
        DECLE   $0001,  $0000,  $0000,  $0000   ; FECB   0001 0000 0000 0000
        DECLE   $0000,  $00F3,  $0000,  $00CC   ; FECF   0000 00F3 0000 00CC
        DECLE   $0000,  $0038,  $0000,  $0018   ; FED3   0000 0038 0000 0018
        DECLE   $0000,  $0008,  $0000,  $0004   ; FED7   0000 0008 0000 0004
        DECLE   $0002,  $0000,  $0000,  $0000   ; FEDB   0002 0000 0000 0000
        DECLE   $00E7,  $0000,  $009C,  $0000   ; FEDF   00E7 0000 009C 0000
        DECLE   $0078,  $0000,  $0070,  $0000   ; FEE3   0078 0000 0070 0000
        DECLE   $0018,  $0000,  $0008,  $0002   ; FEE7   0018 0000 0008 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEEB   0000 0000 0000 0000
        DECLE   $009F,  $0000,  $007C,  $0000   ; FEEF   009F 0000 007C 0000
        DECLE   $0064,  $0000,  $0038,  $0000   ; FEF3   0064 0000 0038 0000
        DECLE   $0018,  $0000                   ; FEF7   0018 0000

        INCR    R0                              ; FEF9   0008
        DECLE   $0004,  $0001,  $0000,  $0000   ; FEFA   0004 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FEFE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF02   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF06   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF0A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF0E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF12   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF16   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF1A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF1E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF22   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF26   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF2A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF2E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF32   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF36   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF3A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF3E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF42   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF46   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF4A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF4E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF52   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF56   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF5A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF5E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF62   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF66   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF6A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF6E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF72   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF76   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF7A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF7E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF82   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF86   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF8A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF8E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF92   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF96   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF9A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF9E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFA2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFA6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFAA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFAE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFB2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFB6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFBA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFBE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFC2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFC6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFCA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFCE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFD2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFD6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFDA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFDE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFFA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; FFFE   0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $508D       $51FD   $6C27  
;;  $5098       $509B  
;;  $509E       $51F5   $6BE7  
;;  $50A6       $50AA  
;;  $50AD       $DC50  
;;  $50D4       $D235  
;;  $50E1       $D1B7  
;;  $50E2       $50E0  
;;  $50EE       $DC53  
;;  $50F1       $DC46  
;;  $50F2       $50F0  
;;  $5106       $50F9  
;;  $510F       $510B   $6B81  
;;  $5144       $5145  
;;  $518F       $5168  
;;  $51B3       $518D  
;;  $51C8       $51BC  
;;  $51E2       $5141  
;;  $5218       $527B  
;;  $5233       $5229  
;;  $5237       $5219  
;;  $5244       $5247  
;;  $5251       $5254  
;;  $526F       $5262  
;;  $5291       $52A0  
;;  $52B1       $5309  
;;  $52BC       $52B2  
;;  $52C9       $52CC  
;;  $530B       $5104  
;;  $5311       $5315  
;;  $531C       $5320  
;;  $532F       $5332  
;;  $5369       $536D  
;;  $5373       $5377  
;;  $5386       $5386  
;;  $5398       $539B  
;;  $53A6       $53A0   $53CA  
;;  $53AA       $53AD  
;;  $53F1       $53E9  
;;  $5426       $5409  
;;  $544A       $544C  
;;  $545B       $5457  
;;  $54A3       $5485  
;;  $54A7       $53B5  
;;  $54C0       $54AC   $54B2   $54B8  
;;  $54DD       $54D5  
;;  $54E1       $54E4  
;;  $54EB       $54ED  
;;  $550E       $54BE   $5503  
;;  $551C       $5530  
;;  $552C       $5522   $553A  
;;  $5534       $552A  
;;  $556A       $5562  
;;  $55A5       $5584  
;;  $55AB       $554B  
;;  $55B0       $5511   $5532  
;;  $55C2       $55C5  
;;  $55D4       $55B4  
;;  $55DC       $55AE   $55D2   $55D9  
;;  $55E6       $53C7  
;;  $55F6       $55F0  
;;  $5613       $560B  
;;  $5615       $55EA  
;;  $562C       $5629  
;;  $562E       $5613  
;;  $5634       $5650  
;;  $566A       $565A  
;;  $5817       $545D   $5806  
;;  $582D       $5831  
;;  $5876       $53BB  
;;  $5899       $5896  
;;  $589A       $53B8  
;;  $58A9       $589F  
;;  $58CA       $58BE  
;;  $58CF       $58A7   $58B0  
;;  $58F0       $58E9  
;;  $58F4       $58D3   $58D8   $58E5   $58EE  
;;  $5900       $5906  
;;  $591F       $58FA   $5924   $5955  
;;  $5920       $60AB  
;;  $5941       $593D  
;;  $5943       $5967  
;;  $5951       $60B4  
;;  $5AF1       $53B2  
;;  $5B09       $5AFE  
;;  $5B14       $5B10  
;;  $5B1B       $5B16  
;;  $5B27       $5B23  
;;  $5B38       $5B29   $5B2F  
;;  $5B48       $5B36  
;;  $5B5D       $5B4E   $5B54  
;;  $5B6F       $5B5B  
;;  $5B81       $5B72   $5B7A  
;;  $5B89       $5B85  
;;  $5B8F       $5B7F  
;;  $5B97       $5C68  
;;  $5C64       $5B92  
;;  $5C74       $5C7C  
;;  $5C84       $5C8C  
;;  $5EF4       $5EF2  
;;  $5F00       $5EFE  
;;  $6040       $5275   $529A   $5303   $609F   $6C82   $6CB7   $6D3B   $6EF0  
;;  $6044       $6B6C  
;;  $6072       $6047  
;;  $6073       $53C1  
;;  $6084       $607F  
;;  $609B       $6089   $6096  
;;  $609F       $6077  
;;  $60A2       $609D  
;;  $60AF       $60A8  
;;  $60B8       $60B1  
;;  $60C5       $60C1  
;;  $6229       $6229  
;;  $6245       $6243  
;;  $631D       $631D  
;;  $6343       $53BE  
;;  $635A       $634D  
;;  $6367       $6358  
;;  $637C       $635C   $636A   $6370  
;;  $63CC       $63AD  
;;  $63D0       $6380   $6388  
;;  $6423       $63DC  
;;  $6435       $642F  
;;  $643C       $643D  
;;  $6446       $6456  
;;  $6453       $644D  
;;  $6471       $6427   $642B   $6433   $6440   $6451  
;;  $64C2       $53AF  
;;  $64CB       $64D1  
;;  $64D5       $64E1  
;;  $64E4       $53C4  
;;  $64ED       $64F3  
;;  $64F7       $64FE  
;;  $650C       $650A  
;;  $652A       $652A  
;;  $654E       $654C  
;;  $656D       $656B  
;;  $666C       $666A  
;;  $666D       $666B  
;;  $676B       $676B  
;;  $678E       $678C  
;;  $686E       $686C  
;;  $6908       $691E   $692A  
;;  $691D       $554F   $694F  
;;  $6928       $694D  
;;  $6929       $695B  
;;  $6947       $55F6   $5619  
;;  $695F       $6958  
;;  $6974       $696E  
;;  $697A       $6972   $6976  
;;  $698E       $698A   $6998  
;;  $6992       $6981  
;;  $699A       $6990   $6994  
;;  $699C       $52FC   $54A3   $5817   $6ACA   $6C7F   $6CB4   $6D38  
;;  $69AC       $69A0   $69A4  
;;  $69C5       $52A2   $538F   $5428   $54F9   $5541   $5553   $58CA   $5926  
;;  $69C5       $5957   $6063   $638D  
;;  $69D3       $69AA   $69CB   $6A01  
;;  $69FD       $69D1  
;;  $69FE       $541A   $54CD   $5595   $63BD   $6ED8  
;;  $6A47       $6A45  
;;  $6AC1       $6ADE   $6AFF   $6B87  
;;  $6AC6       $6AC8  
;;  $6AD2       $6AD4  
;;  $6ADB       $5B97  
;;  $6AFC       $550B  
;;  $6B0E       $50D1  
;;  $6B16       $6AFA   $6B6F  
;;  $6B1A       $6B62   $6B68  
;;  $6B5E       $6B59  
;;  $6B71       $6AEE  
;;  $6B7B       $6B7C  
;;  $6B84       $5B94  
;;  $6B9C       $54C9   $6BD9  
;;  $6BC8       $6BC5  
;;  $6BCE       $6BCA  
;;  $6BD5       $6AF6   $6B0A   $6B71   $6B92  
;;  $6C34       $6C88  
;;  $6C3F       $6C35  
;;  $6C4C       $6C4F  
;;  $6C8C       $6CBD  
;;  $6C9C       $6C93  
;;  $6CA7       $6C9E  
;;  $6CB2       $6CA9  
;;  $6CDF       $6D41  
;;  $6CFA       $6CF0  
;;  $6CFE       $6CE0  
;;  $6D11       $6D06  
;;  $6D1A       $6D1D  
;;  $6D27       $6D2A  
;;  $6D44       $6BDF   $6DC2   $6E29   $6EE3  
;;  $6D60       $6C97  
;;  $6DBE       $6DB7  
;;  $6DC6       $6CA2  
;;  $6E25       $6E1E  
;;  $6E2D       $6CAD  
;;  $6E73       $6E3F  
;;  $6EDF       $6EC0   $6ECC  
;;  $6EE6       $6E43   $6E71  
;;  $6EEE       $6EF5  
;;  $D019       <entry>
;;  $D033       $D036  
;;  $D0CB       $D15A   $D1A9   $D214   $D21D   $D262   $D287   $D290  
;;  $D0CC       $D0B0   $D0B5   $D0BA   $D0BF  
;;  $D0D5       $D0CF  
;;  $D0D8       $D0FA  
;;  $D0DC       $D0F6  
;;  $D0E5       $D0DF  
;;  $D0EF       $D0E6  
;;  $D0F4       $D0F0  
;;  $D106       $D100  
;;  $D169       $D15E  
;;  $D1A7       $D157  
;;  $D1C6       <entry>
;;  $D1F3       $D1F7   $D203  
;;  $D20F       <entry> $D200  
;;  $D238       $D233  
;;  $D247       $D243  
;;  $D259       $D5D8  
;;  $D264       $D25E  
;;  $D266       $D27C  
;;  $D26B       $6081   $6098   $6B5B   $D281   $D29D   $DBD1  
;;  $D27A       $D269  
;;  $D2B0       $D2A1  
;;  $D2D1       $D2CF  
;;  $D2DA       <entry>
;;  $D2E7       $D0C8  
;;  $D4CF       $6B99  
;;  $D4E0       $D4DC  
;;  $D4E2       $DBED  
;;  $D4E5       $D256  
;;  $D515       $D507   $D50F  
;;  $D53B       $D677  
;;  $D585       $D58B  
;;  $D587       $D56F  
;;  $D588       $D586  
;;  $D5A5       $D5A9  
;;  $D5A7       $D594  
;;  $D5C5       $D5CC  
;;  $D5C9       $D5AD  
;;  $D5CE       $D5D2   $D5FB  
;;  $D5F8       $D5F1  
;;  $D62E       $D538  
;;  $D642       $D638   $D63E  
;;  $D644       $D68A  
;;  $D64F       $D64F  
;;  $D652       $D652  
;;  $D659       $D657  
;;  $D65C       $D65C  
;;  $D660       $D65E  
;;  $D661       $D661  
;;  $D663       $D663  
;;  $D668       $D67E  
;;  $D669       $D667   $D669  
;;  $D672       $D670  
;;  $D673       $D673  
;;  $D67A       $D67A  
;;  $D683       $D683  
;;  $D73F       $D644   $D64B   $F901   $F96C  
;;  $D741       $D750  
;;  $D753       $D042   $D526   $D533   $F8E9   $F959  
;;  $D755       $D766  
;;  $D769       $D5DE  
;;  $D79A       $D796   $D839  
;;  $D7A4       $D852   $D857  
;;  $D7B6       $D7B0  
;;  $D7BE       $D7BA  
;;  $D7D0       $D7CB  
;;  $D7D8       $D7CE  
;;  $D7DA       $D7D2   $D7D6  
;;  $D7DB       $D7D9  
;;  $D7E8       $D7E1   $D7E5   $D8CF  
;;  $D801       $D7FB  
;;  $D807       $D7FF  
;;  $D812       $F08E  
;;  $D813       $D811  
;;  $D827       $D822   $D8FC  
;;  $D82C       $D780   $D80D   $D817   $D83F   $D85D   $D889   $D8B6   $D918  
;;  $D82C       $D924   $D92D   $DB29   $DB2E   $DB70   $DB81   $DBAE  
;;  $D82D       $D771  
;;  $D83B       $D775  
;;  $D84A       $D869  
;;  $D84C       $D848   $D875  
;;  $D854       $D77D  
;;  $D859       $D779  
;;  $D868       $D864  
;;  $D875       $D871  
;;  $D877       $D843  
;;  $D87D       $D785   $D830  
;;  $D886       $D881  
;;  $D89E       $D89B  
;;  $D8AC       $D895   $D8A5  
;;  $D8AF       $D8A1  
;;  $D8B2       $D8A8   $D8AD  
;;  $D8B5       $D89F  
;;  $D8B8       $D8AA   $D8B0   $D8B3  
;;  $D8C9       $D8BB   $D8C1  
;;  $D8D1       $D79D  
;;  $D8D5       $D78A   $D78F   $D835  
;;  $D8F3       $D8D3  
;;  $D8F6       $D8F1  
;;  $D8FE       $D54E   $D555   $D55C   $D565   $D56C  
;;  $D910       $D5DB  
;;  $D91A       $D915  
;;  $D92B       $DA8F   $DA9A  
;;  $D94B       $D947  
;;  $D954       $D95C  
;;  $D95E       $D955  
;;  $D962       $D932   $D937  
;;  $D971       $D96C  
;;  $D993       $D97C  
;;  $D998       $D964   $DA84  
;;  $D9A4       $D9BB  
;;  $D9AF       $D9A6  
;;  $D9B7       $D9AD   $D9B0   $DA8A  
;;  $D9BE       $D9AB   $D9B5  
;;  $DA02       $D9F8  
;;  $DA15       $D9F2  
;;  $DA1C       $D9FC   $DA00   $DA05  
;;  $DA2F       $DA26   $DA2B  
;;  $DA3F       $DA39  
;;  $DA43       $DA35   $DA3D  
;;  $DA5B       $DA13   $DA1A  
;;  $DA66       $D982   $D987  
;;  $DA77       $D991   $D996   $DA64  
;;  $DA81       $DA7D  
;;  $DA87       $D9DA   $D9DE   $D9E5   $D9E9  
;;  $DA8C       $D929  
;;  $DA98       $DA95  
;;  $DAA3       $DAA0  
;;  $DAA9       $DAAF  
;;  $DABE       $DAB7  
;;  $DACC       $DB23  
;;  $DAD0       $DAC9  
;;  $DAE8       $DAE4  
;;  $DAFA       $DAF6  
;;  $DB0C       $DB08  
;;  $DB1C       $DAC4  
;;  $DB25       $D5E7  
;;  $DB62       $DC2B  
;;  $DB6B       $D76A  
;;  $DB83       $DB7D  
;;  $DB8B       $DB88  
;;  $DBA3       $DB9E  
;;  $DBAB       $DB91  
;;  $DBC0       $DBBB  
;;  $DBCB       $DB75  
;;  $DBD4       $DBCF  
;;  $DBED       $DBDE  
;;  $DBF0       $DBDA  
;;  $DBF9       $DBF0  
;;  $DC26       $DC21  
;;  $DC2D       $DBEB  
;;  $DC31       $DBE5  
;;  $DC37       $DC2F  
;;  $DC41       $DC33  
;;  $DC49       $DBD6  
;;  $DC53       $DC4E  
;;  $DC78       $DC5B  
;;  $DC7B       $DC5D  
;;  $DC87       $DC9B  
;;  $DC8E       $DC8A  
;;  $DC9D       $DCE0  
;;  $DCB3       $DCD0  
;;  $DCB8       $DCCC  
;;  $DCCE       $DCB5   $DCC9  
;;  $DCD2       $DCEA   $DCF0  
;;  $DCD3       $DC7D  
;;  $DCD6       $DC82  
;;  $DCE2       $DC6E  
;;  $DCEC       $DCE7  
;;  $DD06       $D53E   $D95E  
;;  $DD07       $DCFA   $DD00   $DD05  
;;  $DD1A       $DD10   $DD16  
;;  $DD21       $DCF5  
;;  $DD24       $51F0   $51F8   $5237   $527D   $5291   $52BC   $6ADB   $6AFC  
;;  $DD24       $6B84   $6BE2   $6C22   $6C3F   $6C8C   $6CBF   $6CFE   $D021  
;;  $DD24       $D515   $F8D8   $F93F  
;;  $DD33       $DD33  
;;  $F000       $D5E1  
;;  $F018       $F013  
;;  $F027       $F023  
;;  $F032       $F02E  
;;  $F040       $F095   $F09A  
;;  $F048       $F098  
;;  $F04A       $F042   $F093  
;;  $F04C       $F046  
;;  $F058       $F054   $F0AA   $F0AF   $F0B2   $F0C0  
;;  $F05C       $F0DB  
;;  $F060       $F05A   $F0DD  
;;  $F091       $F016  
;;  $F092       $F038  
;;  $F097       $F03E  
;;  $F09C       $F005  
;;  $F0B1       $F0BC  
;;  $F0B4       $F0A2  
;;  $F0C2       $F0B8  
;;  $F0C8       $F00B   $F00F  
;;  $F0D5       $F0D1   $F0E3  
;;  $F0DF       $F0CE  
;;  $F0E5       $F08A  
;;  $F0EA       $F018   $F28A   $F2C6  
;;  $F0F1       $F0EE  
;;  $F0F4       $D5E4  
;;  $F0FD       $F0FA  
;;  $F107       $F116  
;;  $F115       $F111  
;;  $F134       $F107  
;;  $F143       $F13E  
;;  $F154       $F170  
;;  $F165       $F1F3  
;;  $F16A       $F166  
;;  $F16C       $F156  
;;  $F18D       $F181  
;;  $F192       $F178  
;;  $F1A4       $F138  
;;  $F1B3       $F1AC   $F1B0  
;;  $F1B8       $F1B5  
;;  $F1C8       $F1C1  
;;  $F1CB       $F1BD  
;;  $F1CE       $F1C4   $F1C9  
;;  $F1D1       $F1BB  
;;  $F1D4       $F1C6   $F1CC   $F1CF  
;;  $F1ED       $F103   $F141   $F148   $F161   $F1D2   $F1F1   $F25B   $F269  
;;  $F1ED       $F2BE   $F2C4   $F2DD   $F2E4   $F308   $F30C   $F310   $F337  
;;  $F1ED       $F33B   $F366   $F3BE   $F405   $F40A  
;;  $F1EE       $F15C  
;;  $F1F5       $F1E6  
;;  $F1F7       $F1D9  
;;  $F212       $F20C  
;;  $F221       $F219  
;;  $F223       $F21F  
;;  $F233       $F208   $F210  
;;  $F241       $F231  
;;  $F244       $F226   $F236  
;;  $F246       $D9C2   $F1E1  
;;  $F249       $F24C  
;;  $F251       $D99C   $F14C  
;;  $F25A       $F25F  
;;  $F261       $F118  
;;  $F26B       $F266  
;;  $F284       $F275   $F27B   $F27F  
;;  $F295       $F28F  
;;  $F297       $F293  
;;  $F2A0       $F29B  
;;  $F2AB       $F26F   $F288   $F2A1   $F2A6  
;;  $F2BB       $F2B0   $F2B5  
;;  $F2D1       $F2CB  
;;  $F2D3       $F2CF  
;;  $F2DC       $F2D7  
;;  $F2EF       $F2E6  
;;  $F302       $F281   $F2A8  
;;  $F31A       $F312  
;;  $F329       $F325  
;;  $F334       $F11D   $F122   $F127  
;;  $F34C       $F343   $F349  
;;  $F361       $F357   $F35B  
;;  $F37F       $F379  
;;  $F385       $F382  
;;  $F388       $F375   $F37D  
;;  $F391       $F386   $F38E  
;;  $F39A       $F394  
;;  $F39D       $F398  
;;  $F3AA       $F3A6  
;;  $F3AF       $F36A   $F36F  
;;  $F3B0       $F3AE  
;;  $F3B5       $F34F  
;;  $F3B9       $F12A  
;;  $F3D8       $F3CE  
;;  $F3DF       $F3DB   $F41E  
;;  $F3E1       $F12D  
;;  $F3FC       $F130  
;;  $F403       $6331  
;;  $F407       $F401  
;;  $F41B       $F415  
;;  $F433       $F422  
;;  $F437       $D951   $D959   $D98B   $DA0A   $DAAB   $DAB1   $DABB  
;;  $F45E       $F454  
;;  $F461       $F444  
;;  $F465       $D53B  
;;  $F466       $F464  
;;  $F478       $F46E   $F474  
;;  $F487       $F483  
;;  $F49B       $F495  
;;  $F4A9       <entry>
;;  $F4B7       $F4B3  
;;  $F4BA       $DA47   $DA6A  
;;  $F4D5       $D98E   $DA0E  
;;  $F4F0       $D93C  
;;  $F505       $F19D   $F330  
;;  $F51B       $F2FB  
;;  $F532       $DC74  
;;  $F53D       $F535   $F539  
;;  $F53E       $DD02  
;;  $F55A       $D993   $DA16  
;;  $F5DE       $DB30  
;;  $F6C4       $DB18  
;;  $F73C       $F73A  
;;  $F73E       $F73C  
;;  $F747       $F747  
;;  $F7A1       $F79F  
;;  $F7CC       $F7CC  
;;  $F8C8       $DC39  
;;  $F912       $F90E  
;;  $F92F       $50AD   $511A   $6BDC  
;;  $F950       $F954  
;;  $FBDD       $FBDB  
;;  $FC01       $629D  
;;  $FC03       $6167  
;;  $FC08       $61E7  
;;  $FC0A       $FC08  
;;  $FC2D       $FC2B  
;;  $FC52       $FC50  
;; ======================================================================== ;;
