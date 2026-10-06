
        ORG     $5000
.HEADER:
        BIDECLE $51DD           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $509E           ; 5004  Ptr: Start of game
        BIDECLE $51DD           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5020           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5023           ; 500A  Ptr: Date/Title
        DECLE   $00C0           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0310,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TIMER:
        BIDECLE $0000           ; 501C  End of timer table

        DECLE   $0000,  $0000                   ; 501E   0000 0000
.GRAM_INIT_5020:
        DECLE   $0002           ; 5020  # of GRAM cards to init
        DECLE   $0001,  $0080   ; 5021  #00-01:  CART #00-01 ----

.TITLE:
        DECLE   $0053                           ; 5023  Cartridge year
        STRING  "MR BASIC!"                     ; 5024  Title string
        DECLE   $0000                           ; 502D  

.TITLECODE:
        PSHR    R5                              ; 502E   0275
        MVI     .BTAB.25,R0                     ; 502F   0280 0225
        XORI    #$0007, R0                      ; 5031   03F8 0007
        MVO     R0,     .BTAB.25                ; 5033   0240 0225
        MVII    #$0100, R5                      ; 5035   02BD 0100
        SDBD                                    ; 5037   0001
        MVI@    R5,     R0                      ; 5038   02A8
        MVO     R0,     G_01E4                  ; 5039   0240 01E4
        SWAP    R0,     1                       ; 503B   0040
        MVO     R0,     G_01E5                  ; 503C   0240 01E5
        SDBD                                    ; 503E   0001
        MVII    #$5072, R0                      ; 503F   02B8 0072 0050
        MVO     R0,     .ISRVEC.0               ; 5042   0240 0100
        SWAP    R0,     1                       ; 5044   0040
        MVO     R0,     .ISRVEC.1               ; 5045   0240 0101
        MVII    #$0006, R3                      ; 5047   02BB 0006
        MVII    #$027D, R4                      ; 5049   02BC 027D

        JSR     R5,     X_PRINT_R5              ; 504B   0004 0118 007B
        STRING  " Mr.BASIC       Meet"          ; 504E  
        STRING  "s Bits'n Bytes"                ; 5062  
        DECLE   $0000                           ; 5070   0000

        PULR    R7                              ; 5071   02B7

        PSHR    R5                              ; 5072   0275
        MVII    #$0005, R0                      ; 5073   02B8 0005
        MVII    #$0028, R4                      ; 5075   02BC 0028

        JSR     R5,     X_FILL_ZERO             ; 5077   0004 0114 0338

        MVII    #$027A, R0                      ; 507A   02B8 027A
        MVO     R0,     .STIC.X.0               ; 507C   0240 0000
        ADDI    #$0006, R0                      ; 507E   02F8 0006
        MVO     R0,     .STIC.X.1               ; 5080   0240 0001
        MVII    #$0035, R0                      ; 5082   02B8 0035
        MVO     R0,     .STIC.Y.0               ; 5084   0240 0008
        MVO     R0,     .STIC.Y.1               ; 5086   0240 0009
        SDBD                                    ; 5088   0001
        MVII    #$0806, R0                      ; 5089   02B8 0006 0008
        MVO     R0,     .STIC.A.0               ; 508C   0240 0010
        XORI    #$0008, R0                      ; 508E   03F8 0008
        MVO     R0,     .STIC.A.1               ; 5090   0240 0011
        MVII    #$01E4, R4                      ; 5092   02BC 01E4
        SDBD                                    ; 5094   0001
        MVI@    R4,     R0                      ; 5095   02A0
        MVO     R0,     .ISRVEC.0               ; 5096   0240 0100
        SWAP    R0,     1                       ; 5098   0040
        MVO     R0,     .ISRVEC.1               ; 5099   0240 0101
        SWAP    R0,     1                       ; 509B   0040
        PULR    R5                              ; 509C   02B5
        MOVR    R0,     R7                      ; 509D   0087

.START:
        PSHR    R5                              ; 509E   0275
        MVII    #$00F0, R0                      ; 509F   02B8 00F0
        MVII    #$0200, R4                      ; 50A1   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 50A3   0004 0114 0338
        JSR     R5,     L_5135                  ; 50A6   0004 0150 0135

        SDBD                                    ; 50A9   0001
        MVII    #$50B7, R0                      ; 50AA   02B8 00B7 0050
        MVO     R0,     G_035D                  ; 50AD   0240 035D
        MVII    #$0003, R0                      ; 50AF   02B8 0003
        MVO     R0,     G_0103                  ; 50B1   0240 0103

        JSR     R5,     L_D7B5                  ; 50B3   0004 01D4 03B5

        PULR    R7                              ; 50B6   02B7

        DECLE   $0000,  $0000,  $00C1,  $0050   ; 50B7   0000 0000 00C1 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50BB   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 50BF   0000 0000

        PSHR    R5                              ; 50C1   0275
        PSHR    R0                              ; 50C2   0270

        JSR     R5,     L_5135                  ; 50C3   0004 0150 0135

        PULR    R0                              ; 50C6   02B0
        CMPI    #$000B, R0                      ; 50C7   0378 000B
        BEQ     L_50DD                          ; 50C9   0204 0012

        ANDI    #$0003, R0                      ; 50CB   03B8 0003
        MVO     R0,     G_034C                  ; 50CD   0240 034C
        BEQ     L_50DC                          ; 50CF   0204 000B

        MVII    #$0217, R1                      ; 50D1   02B9 0217
L_50D3:
        ADDI    #$0028, R1                      ; 50D3   02F9 0028
        DECR    R0                              ; 50D5   0010
        BNEQ    L_50D3                          ; 50D6   022C 0004

        MVI@    R1,     R2                      ; 50D8   028A
        XORI    #$0003, R2                      ; 50D9   03FA 0003
        MVO@    R2,     R1                      ; 50DB   024A
L_50DC:
        PULR    R7                              ; 50DC   02B7

L_50DD:
        MVI     G_034C, R0                      ; 50DD   0280 034C
        TSTR    R0                              ; 50DF   0080
        BEQ     L_50DC                          ; 50E0   0224 0005

        PSHR    R0                              ; 50E2   0270

        JSR     R5,     .EXEC.60A               ; 50E3   0004 0114 020A

        PULR    R0                              ; 50E6   02B0
        SDBD                                    ; 50E7   0001
        MVII    #$7FFF, R1                      ; 50E8   02B9 00FF 007F
        MVI@    R1,     R1                      ; 50EB   0289
        CMPI    #$0170, R1                      ; 50EC   0379 0170
        BNEQ    L_50F6                          ; 50EE   020C 0006

        PULR    R5                              ; 50F0   02B5
        SDBD                                    ; 50F1   0001
        MVII    #$70C4, R5                      ; 50F2   02BD 00C4 0070
        PSHR    R5                              ; 50F5   0275
L_50F6:
        DECR    R0                              ; 50F6   0010
        SLL     R0,     1                       ; 50F7   0048
        PSHR    R0                              ; 50F8   0270
        MOVR    R0,     R5                      ; 50F9   0085
        SDBD                                    ; 50FA   0001
        ADDI    #$51D7, R5                      ; 50FB   02FD 00D7 0051
        SDBD                                    ; 50FE   0001
        MVI@    R5,     R0                      ; 50FF   02A8
        ADDI    #$0014, R0                      ; 5100   02F8 0014
        MVO     R0,     G_02F0                  ; 5102   0240 02F0
        DIS                                     ; 5104   0003
        MVII    #$0084, R0                      ; 5105   02B8 0084
        MVO     R0,     G_0102                  ; 5107   0240 0102
        EIS                                     ; 5109   0002
L_510A:
        CMP     G_0102, R0                      ; 510A   0340 0102
        BEQ     L_510A                          ; 510C   0224 0003

        JSR     R5,     .EXEC.7FE               ; 510E   0004 0114 03FE

        MVII    #$0090, R0                      ; 5111   02B8 0090
        MVO     R0,     G_0102                  ; 5113   0240 0102

        JSR     R5,     .EXEC.41C               ; 5115   0004 0114 001C

        MVII    #$0031, R0                      ; 5118   02B8 0031
        MVO     R0,     G_015D                  ; 511A   0240 015D
        SDBD                                    ; 511C   0001
        MVII    #$516B, R0                      ; 511D   02B8 006B 0051
        SDBD                                    ; 5120   0001
        MVII    #$47FC, R5                      ; 5121   02BD 00FC 0047
        MVO@    R0,     R5                      ; 5124   0268
        SWAP    R0,     1                       ; 5125   0040
        MVO@    R0,     R5                      ; 5126   0268
        PULR    R0                              ; 5127   02B0
        SLL     R0,     1                       ; 5128   0048
        ADDR    R0,     R7                      ; 5129   00C7
        J       L_D04C                          ; 512A   0004 03D0 004C

        NOP                                     ; 512D   0034
        J       L_62B8                          ; 512E   0004 0360 02B8

        NOP                                     ; 5131   0034
        J       L_5275                          ; 5132   0004 0350 0275

L_5135:
        PSHR    R5                              ; 5135   0275
        MVII    #$023F, R4                      ; 5136   02BC 023F
        MVII    #$0004, R3                      ; 5138   02BB 0004

        JSR     R5,     X_PRINT_R5              ; 513A   0004 0118 007B
        STRING  "1  BATS"                       ; 513D  
        DECLE   $0000                           ; 5144   0000

        MVII    #$0267, R4                      ; 5145   02BC 0267
        MVII    #$0004, R3                      ; 5147   02BB 0004

        JSR     R5,     X_PRINT_R5              ; 5149   0004 0118 007B
        STRING  "2  CANNON"                     ; 514C  
        DECLE   $0000                           ; 5155   0000

        MVII    #$028F, R4                      ; 5156   02BC 028F
        MVII    #$0004, R3                      ; 5158   02BB 0004

        JSR     R5,     X_PRINT_R5              ; 515A   0004 0118 007B
        STRING  "3  MR. BASIC"                  ; 515D  
        DECLE   $0000                           ; 5169   0000

        PULR    R7                              ; 516A   02B7

        DECLE   $0284,  $0354,  $0004,  $012C   ; 516B   0284 0354 0004 012C
        DECLE   $03B7,  $0014,  $02BB,  $0004   ; 516F   03B7 0014 02BB 0004
        DECLE   $0001,  $02BD,  $00B6,  $0026   ; 5173   0001 02BD 00B6 0026
        DECLE   $02A0,  $02A9,  $0141,  $020C   ; 5177   02A0 02A9 0141 020C
        DECLE   $0058,  $0013,  $022C,  $0007   ; 517B   0058 0013 022C 0007
        DECLE   $0004,  $012C,  $0274,  $037A   ; 517F   0004 012C 0274 037A
        DECLE   $0004,  $020B,  $004E,  $037A   ; 5183   0004 020B 004E 037A
        DECLE   $0006,  $0203,  $004A           ; 5187   0006 0203 004A

        MVI     G_02F0, R5                      ; 518A   0285 02F0
        CMPI    #$0005, R2                      ; 518C   037A 0005
        BEQ     L_5196                          ; 518E   0204 0006

        ADDI    #$0008, R5                      ; 5190   02FD 0008
        MVII    #$0002, R2                      ; 5192   02BA 0002
        B       L_519A                          ; 5194   0200 0004

L_5196:
        ADDI    #$000C, R5                      ; 5196   02FD 000C
        MVII    #$0004, R2                      ; 5198   02BA 0004
L_519A:
        SDBD                                    ; 519A   0001
        DECLE   $02AC,  $037A,  $0004,  $0204   ; 519B   02AC 037A 0004 0204
        DECLE   $0003,  $0004                   ; 519F   0003 0004

        SUB@    R5,     R4                      ; 51A1   032C
        SUBR    R6,     R1                      ; 51A2   0131
L_51A3:
        MVI     G_0354, R5                      ; 51A3   0285 0354
        DECLE   $02A0,  $0080,  $0204,  $0028   ; 51A5   02A0 0080 0204 0028

        DECR    R4                              ; 51A9   0014
L_51AA:
        MVII    #$0004, R3                      ; 51AA   02BB 0004
L_51AC:
        MVI@    R4,     R0                      ; 51AC   02A0
        MVO@    R0,     R5                      ; 51AD   0268
        DECR    R3                              ; 51AE   0013
        BNEQ    L_51AC                          ; 51AF   022C 0004

        MVI@    R4,     R0                      ; 51B1   02A0
        TSTR    R0                              ; 51B2   0080
        BEQ     L_51CB                          ; 51B3   0204 0016

        DECR    R4                              ; 51B5   0014
        SDBD                                    ; 51B6   0001
        CMPI    #$4098, R5                      ; 51B7   037D 0098 0040
        BEQ     L_51C1                          ; 51BA   0204 0005

        MVII    #$0020, R0                      ; 51BC   02B8 0020
        MVO@    R0,     R5                      ; 51BE   0268
        B       L_51AA                          ; 51BF   0220 0016

L_51C1:
        MVII    #$000D, R0                      ; 51C1   02B8 000D
        DECLE   $0268,  $0274,  $0004           ; 51C3   0268 0274 0004

        SUBR    R5,     R4                      ; 51C6   012C
        ADD@    R3,     R6                      ; 51C7   02DE
        PULR    R4                              ; 51C8   02B4
        B       L_51A3                          ; 51C9   0220 0027

L_51CB:
        MVII    #$000D, R0                      ; 51CB   02B8 000D
        DECLE   $0268,  $0004,  $012C,  $02DE   ; 51CD   0268 0004 012C 02DE
        DECLE   $0004,  $032C,  $0197,  $0004   ; 51D1   0004 032C 0197 0004

        SUB@    R5,     R4                      ; 51D5   032C
        ADDR    R4,     R7                      ; 51D6   00E7

        DECLE   $0000,  $00D0,  $0070,  $0062   ; 51D7   0000 00D0 0070 0062
        DECLE   $00ED,  $0051                   ; 51DB   00ED 0051
.GFX_LIST_51DD:
        DECLE   $00F8,  $0020,  $0020,  $0020   ; 51DD  CART PIC #00
        DECLE   $0020,  $0020,  $0000,  $0000   ; 51E1  
        DECLE   $0088,  $00D8,  $00A8,  $0088   ; 51E5  CART PIC #01
        DECLE   $0088,  $0088,  $0000,  $0000   ; 51E9  
        DECLE   $006B,  $005D,  $0011,  $0052   ; 51ED   006B 005D 0011 0052
        DECLE   $0074,  $0052,  $0000,  $0060   ; 51F1   0074 0052 0000 0060
        DECLE   $0029,  $0052,  $0036           ; 51F5   0029 0052 0036

        RLC     R2,     1                       ; 51F8   0052
        B       L_51FB                          ; 51F9   0200 0000

L_51FB:
        SDBD                                    ; 51FB   0001
        DECLE   $0310,  $0000,  $0000,  $0000   ; 51FC   0310 0000 0000 0000
        DECLE   $0000,  $01F0,  $01E0,  $01D0   ; 5200   0000 01F0 01E0 01D0
        DECLE   $01C0,  $01B0,  $01A0,  $0190   ; 5204   01C0 01B0 01A0 0190
        DECLE   $0180,  $0052,  $0052,  $0057   ; 5208   0180 0052 0052 0057
        DECLE   $0052,  $005B,  $0052,  $006C   ; 520C   0052 005B 0052 006C
        DECLE   $0052,  $0015,  $0054,  $0001   ; 5210   0052 0015 0054 0001
        DECLE   $0000,  $0054,  $0053,  $0001   ; 5214   0000 0054 0053 0001
        DECLE   $0000,  $0076,  $0053,  $0003   ; 5218   0000 0076 0053 0003
        DECLE   $0000,  $008C,  $0054,  $0014   ; 521C   0000 008C 0054 0014
        DECLE   $0000,  $0043,  $0053,  $0008   ; 5220   0000 0043 0053 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5224   0000 0000 0000 0000
        DECLE   $0000,  $0030,  $0001,  $0380   ; 5228   0000 0030 0001 0380
        DECLE   $0011,  $0380,  $0021,  $0380   ; 522C   0011 0380 0021 0380
        DECLE   $0031,  $0380,  $0041,  $0380   ; 5230   0031 0380 0041 0380
        DECLE   $0051,  $0380,  $0007,  $0002   ; 5234   0051 0380 0007 0002
        DECLE   $0000,  $0002,  $0006,  $0002   ; 5238   0000 0002 0006 0002
        DECLE   $0003,  $0002,  $0054,  $0056   ; 523C   0003 0002 0054 0056
        DECLE   $0007,  $0057,  $0046,  $0056   ; 5240   0007 0057 0046 0056
        DECLE   $003F,  $0056,  $0000,  $0000   ; 5244   003F 0056 0000 0000
        DECLE   $0054,  $0056,  $0007,  $0057   ; 5248   0054 0056 0007 0057
        DECLE   $0000,  $0000,  $0000,  $0000   ; 524C   0000 0000 0000 0000
        DECLE   $009A,  $0055,  $0041,  $0052   ; 5250   009A 0055 0041 0052
        DECLE   $0047,  $0054,  $0000,  $00B5   ; 5254   0047 0054 0000 00B5
        DECLE   $0057,  $0090,  $0057,  $0054   ; 5258   0057 0090 0057 0054
        DECLE   $0048,  $0052,  $004F,  $004E   ; 525C   0048 0052 004F 004E
        DECLE   $0045,  $0041,  $0052,  $0046   ; 5260   0045 0041 0052 0046
        DECLE   $0052,  $0045,  $005A,  $0054   ; 5264   0052 0045 005A 0054
        DECLE   $0048,  $0041,  $0057,  $0000   ; 5268   0048 0041 0057 0000

        SAR     R0,     2                       ; 526C   006C
        RLC     R3,     2                       ; 526D   0057
        SWAP    R0,     2                       ; 526E   0044
        RLC     R3,     2                       ; 526F   0057
        RSWD    R4                              ; 5270   003C
        RLC     R3,     2                       ; 5271   0057
        RSWD    R1                              ; 5272   0039
        RLC     R3,     2                       ; 5273   0057
        PSHR    R5                              ; 5274   0275
L_5275:
        MVII    #$0200, R4                      ; 5275   02BC 0200
        MVII    #$0078, R0                      ; 5277   02B8 0078
        MVII    #$0022, R1                      ; 5279   02B9 0022
        SWAP    R1,     1                       ; 527B   0041

        JSR     R5,     X_FILL_MEM              ; 527C   0004 0114 0341

        MVII    #$0064, R0                      ; 527F   02B8 0064
        MVO     R0,     G_0167                  ; 5281   0240 0167
L_5283:
        SDBD                                    ; 5283   0001
        MVII    #$6180, R5                      ; 5284   02BD 0080 0061
        MVII    #$0278, R4                      ; 5287   02BC 0278
L_5289:
        SDBD                                    ; 5289   0001
        MVI@    R5,     R0                      ; 528A   02A8
        MVO@    R0,     R4                      ; 528B   0260
        CMPI    #$02F0, R4                      ; 528C   037C 02F0
        BNEQ    L_5289                          ; 528E   022C 0006

        MVII    #$031D, R2                      ; 5290   02BA 031D
        SDBD                                    ; 5292   0001
        MVII    #$5CC0, R1                      ; 5293   02B9 00C0 005C
        MVII    #$0008, R0                      ; 5296   02B8 0008

        JSR     R5,     X_INIT_MOBS             ; 5298   0004 0114 02B4

        MVII    #$0006, R0                      ; 529B   02B8 0006

        JSR     R5,     .EXEC.6CF               ; 529D   0004 0114 02CF

        MVII    #$0007, R0                      ; 52A0   02B8 0007

        JSR     R5,     .EXEC.6CF               ; 52A2   0004 0114 02CF

        SDBD                                    ; 52A5   0001
        MVII    #$523E, R0                      ; 52A6   02B8 003E 0052
        MVO     R0,     G_035D                  ; 52A9   0240 035D
        CLRR    R0                              ; 52AB   01C0
        MVO     R0,     G_0117                  ; 52AC   0240 0117
        MVO     R0,     G_0352                  ; 52AE   0240 0352
        MVII    #$00A8, R0                      ; 52B0   02B8 00A8
        MVO     R0,     G_0116                  ; 52B2   0240 0116
        MVII    #$0034, R0                      ; 52B4   02B8 0034
        MVO     R0,     G_0119                  ; 52B6   0240 0119
        MVII    #$0062, R0                      ; 52B8   02B8 0062
        MVO     R0,     G_0118                  ; 52BA   0240 0118
        CLRR    R0                              ; 52BC   01C0
        MVII    #$01D0, R5                      ; 52BD   02BD 01D0
        MVO@    R0,     R5                      ; 52BF   0268
        MVO@    R0,     R5                      ; 52C0   0268
        MVII    #$0003, R0                      ; 52C1   02B8 0003
        MVO     R0,     G_01D7                  ; 52C3   0240 01D7

        JSR     R5,     L_52EC                  ; 52C5   0004 0150 02EC
        JSR     R5,     L_52FB                  ; 52C8   0004 0150 02FB

        CLRR    R0                              ; 52CB   01C0
        MVO     R0,     G_01DB                  ; 52CC   0240 01DB
        MVO     R0,     G_01D6                  ; 52CE   0240 01D6

        JSR     R5,     L_52DD                  ; 52D0   0004 0150 02DD

        MVII    #$0008, R0                      ; 52D3   02B8 0008
        MVO     R0,     G_01D3                  ; 52D5   0240 01D3
        MVO     R0,     G_01D5                  ; 52D7   0240 01D5

        JSR     R5,     L_568C                  ; 52D9   0004 0154 028C

        PULR    R7                              ; 52DC   02B7

L_52DD:
        PSHR    R5                              ; 52DD   0275
L_52DE:
        MVI     G_01D6, R0                      ; 52DE   0280 01D6
        ADDI    #$0010, R0                      ; 52E0   02F8 0010
        SLL     R0,     1                       ; 52E2   0048
        SLL     R0,     2                       ; 52E3   004C

        JSR     R5,     L_532A                  ; 52E4   0004 0150 032A

        XORR    R0,     R1                      ; 52E7   01C1
        MVII    #$02CF, R4                      ; 52E8   02BC 02CF
        MVO@    R1,     R4                      ; 52EA   0261
        PULR    R7                              ; 52EB   02B7

L_52EC:
        PSHR    R5                              ; 52EC   0275
        MVI     G_01D7, R0                      ; 52ED   0280 01D7
        ADDI    #$0010, R0                      ; 52EF   02F8 0010
        SLL     R0,     1                       ; 52F1   0048
        SLL     R0,     2                       ; 52F2   004C

        JSR     R5,     L_532A                  ; 52F3   0004 0150 032A

        XORR    R1,     R0                      ; 52F6   01C8
        MVII    #$02BB, R4                      ; 52F7   02BC 02BB
        MVO@    R0,     R4                      ; 52F9   0260
        PULR    R7                              ; 52FA   02B7

L_52FB:
        PSHR    R5                              ; 52FB   0275
        MVII    #$0002, R1                      ; 52FC   02B9 0002
        SWAP    R1,     1                       ; 52FE   0041
        MVII    #$0291, R4                      ; 52FF   02BC 0291
        MVO@    R1,     R4                      ; 5301   0261

        JSR     R5,     L_532A                  ; 5302   0004 0150 032A

        MOVR    R1,     R3                      ; 5305   008B
        MVII    #$01D0, R5                      ; 5306   02BD 01D0
        SDBD                                    ; 5308   0001
        MVI@    R5,     R1                      ; 5309   02A9
        TSTR    R1                              ; 530A   0089
        BPL     L_5314                          ; 530B   0203 0007

        NEGR    R1                              ; 530D   0021
        MOVR    R3,     R5                      ; 530E   009D
        XORI    #$0068, R5                      ; 530F   03FD 0068
        MVII    #$0291, R4                      ; 5311   02BC 0291
        MVO@    R5,     R4                      ; 5313   0265
L_5314:
        MVII    #$0064, R2                      ; 5314   02BA 0064

        JSR     R5,     X_DIV                   ; 5316   0004 011C 01FB

        PSHR    R1                              ; 5319   0271
        MVII    #$0292, R4                      ; 531A   02BC 0292
        MVII    #$0003, R1                      ; 531C   02B9 0003

        JSR     R5,     X_PRNUM_ZRO             ; 531E   0004 0118 00AD

        PULR    R0                              ; 5321   02B0
        MVII    #$0295, R4                      ; 5322   02BC 0295
        MVII    #$0002, R1                      ; 5324   02B9 0002

        JSR     R5,     X_PRNUM_ZRO             ; 5326   0004 0118 00AD

        PULR    R7                              ; 5329   02B7

L_532A:
        PSHR    R5                              ; 532A   0275
        PSHR    R0                              ; 532B   0270
        PSHR    R2                              ; 532C   0272
        MVII    #$01D0, R5                      ; 532D   02BD 01D0
        SDBD                                    ; 532F   0001
        MVI@    R5,     R1                      ; 5330   02A9
        MVII    #$0064, R2                      ; 5331   02BA 0064

        JSR     R5,     X_DIV                   ; 5333   0004 011C 01FB

        ANDI    #$0003, R0                      ; 5336   03B8 0003
        SLL     R0,     1                       ; 5338   0048
        MOVR    R0,     R5                      ; 5339   0085
        SDBD                                    ; 533A   0001
        ADDI    #$5236, R5                      ; 533B   02FD 0036 0052
        SDBD                                    ; 533E   0001
        MVI@    R5,     R1                      ; 533F   02A9
        PULR    R2                              ; 5340   02B2
        PULR    R0                              ; 5341   02B0
        PULR    R7                              ; 5342   02B7

        PSHR    R5                              ; 5343   0275

        JSR     R5,     L_5484                  ; 5344   0004 0154 0084

        MVI     G_01D6, R1                      ; 5347   0281 01D6
        CMPI    #$0005, R1                      ; 5349   0379 0005
        BMI     L_5353                          ; 534B   020B 0006

        MVII    #$02CF, R1                      ; 534D   02B9 02CF
        MVI@    R1,     R0                      ; 534F   0288
        XORI    #$0004, R0                      ; 5350   03F8 0004
        MVO@    R0,     R1                      ; 5352   0248
L_5353:
        PULR    R7                              ; 5353   02B7

        PSHR    R5                              ; 5354   0275

        JSR     R5,     L_5484                  ; 5355   0004 0154 0084

        MVI     G_01D8, R0                      ; 5358   0280 01D8
        INCR    R0                              ; 535A   0008
        MVO     R0,     G_01D8                  ; 535B   0240 01D8
        CLRR    R0                              ; 535D   01C0

L_535E:
        JSR     R5,     .EXEC.76C               ; 535E   0004 0114 036C

        ADDI    #$0005, R1                      ; 5361   02F9 0005
        MVI@    R1,     R2                      ; 5363   028A
        ANDI    #$0007, R2                      ; 5364   03BA 0007
        CMPI    #$0003, R2                      ; 5366   037A 0003
        BNEQ    L_5370                          ; 5368   020C 0006

        SUBI    #$0005, R1                      ; 536A   0339 0005
        MVI@    R1,     R2                      ; 536C   028A
        XORI    #$0007, R2                      ; 536D   03FA 0007
        MVO@    R2,     R1                      ; 536F   024A
L_5370:
        INCR    R0                              ; 5370   0008
        CMPI    #$0005, R0                      ; 5371   0378 0005
        BNEQ    L_535E                          ; 5373   022C 0016
        PULR    R7                              ; 5375   02B7

        PSHR    R5                              ; 5376   0275

        JSR     R5,     L_5484                  ; 5377   0004 0154 0084

        MVI     G_034A, R0                      ; 537A   0280 034A
        MVI     G_01D2, R1                      ; 537C   0281 01D2
        MOVR    R0,     R2                      ; 537E   0082
        INCR    R2                              ; 537F   000A
        CMPR    R0,     R1                      ; 5380   0141
        BEQ     L_5388                          ; 5381   0204 0005
        BPL     L_5387                          ; 5383   0203 0002

        SUBI    #$0002, R2                      ; 5385   033A 0002
L_5387:
        MOVR    R2,     R0                      ; 5387   0090

L_5388:
        JSR     R5,     L_539C                  ; 5388   0004 0150 039C

        PULR    R7                              ; 538B   02B7

        DECLE   $0004,  $000D,  $0009,  $0009   ; 538C   0004 000D 0009 0009
        DECLE   $000C,  $0006,  $000B,  $0001   ; 5390   000C 0006 000B 0001
        DECLE   $0003,  $00FD,  $00FA,  $0000   ; 5394   0003 00FD 00FA 0000

        ADDR    R7,     R2                      ; 5398   00FA
        CLRC                                    ; 5399   0006
        ADDR    R7,     R6                      ; 539A   00FE
        INCR    R4                              ; 539B   000C
L_539C:
        PSHR    R5                              ; 539C   0275
        MVO     R0,     G_034A                  ; 539D   0240 034A
        MVI     G_01D3, R1                      ; 539F   0281 01D3
        CMPI    #$0008, R1                      ; 53A1   0379 0008
        BEQ     L_53BD                          ; 53A3   0204 0018

        PSHR    R0                              ; 53A5   0270
        MOVR    R1,     R0                      ; 53A6   0088

        JSR     R5,     .EXEC.76C               ; 53A7   0004 0114 036C

        ADDI    #$0002, R1                      ; 53AA   02F9 0002
        PULR    R0                              ; 53AC   02B0
        SLL     R0,     1                       ; 53AD   0048
        SDBD                                    ; 53AE   0001
        MVII    #$538C, R4                      ; 53AF   02BC 008C 0053
        ADDR    R0,     R4                      ; 53B2   00C4
        MVII    #$0347, R3                      ; 53B3   02BB 0347

        JSR     R5,     L_540A                  ; 53B5   0004 0154 000A

        INCR    R1                              ; 53B8   0009
        INCR    R3                              ; 53B9   000B

        JSR     R5,     L_540A                  ; 53BA   0004 0154 000A

L_53BD:
        MVI     G_01D4, R0                      ; 53BD   0280 01D4
        TSTR    R0                              ; 53BF   0080
        MVI     G_01D9, R0                      ; 53C0   0280 01D9
        TSTR    R0                              ; 53C2   0080
        BEQ     L_5401                          ; 53C3   0204 003C

L_53C5:
        CLRR    R0                              ; 53C5   01C0
        MVO     R0,     G_01DA                  ; 53C6   0240 01DA
        MVO     R0,     G_01D2                  ; 53C8   0240 01D2
        MVO     R0,     G_01D4                  ; 53CA   0240 01D4
        MVI     G_01D3, R1                      ; 53CC   0281 01D3
        MVII    #$0008, R0                      ; 53CE   02B8 0008
        MVO     R0,     G_01D3                  ; 53D0   0240 01D3
        MVO     R1,     G_01D5                  ; 53D2   0241 01D5
        MOVR    R1,     R0                      ; 53D4   0088

        JSR     R5,     .EXEC.76C               ; 53D5   0004 0114 036C

        MVI@    R1,     R0                      ; 53D8   0288
        SDBD                                    ; 53D9   0001
        ANDI    #$7FFF, R0                      ; 53DA   03B8 00FF 007F
        MVO@    R0,     R1                      ; 53DD   0248
        ADDI    #$0004, R1                      ; 53DE   02F9 0004
        MOVR    R1,     R3                      ; 53E0   008B
        MVI     G_01D9, R0                      ; 53E1   0280 01D9

        JSR     R5,     X_EXT_SIGN_LO           ; 53E3   0004 0114 0268

        MVII    #$0005, R1                      ; 53E6   02B9 0005

        JSR     R5,     X_MPY                   ; 53E8   0004 011C 01DC

        MOVR    R2,     R1                      ; 53EB   0091
        MVII    #$003F, R0                      ; 53EC   02B8 003F

        JSR     R5,     X_PACK_BYTES            ; 53EE   0004 0114 034F

        MVO@    R0,     R3                      ; 53F1   0258
        ADDI    #$0002, R3                      ; 53F2   02FB 0002
        MVII    #$0003, R0                      ; 53F4   02B8 0003
        MVO@    R0,     R3                      ; 53F6   0258
        CLRR    R0                              ; 53F7   01C0
        MVO     R0,     G_01D9                  ; 53F8   0240 01D9
        SDBD                                    ; 53FA   0001
        MVII    #$523E, R1                      ; 53FB   02B9 003E 0052
        MVO     R1,     G_035D                  ; 53FE   0241 035D
L_5400:
        PULR    R7                              ; 5400   02B7

L_5401:
        MVI     G_01DA, R0                      ; 5401   0280 01DA
        TSTR    R0                              ; 5403   0080
        BEQ     L_5400                          ; 5404   0224 0005

        MVO     R0,     G_01D9                  ; 5406   0240 01D9
        B       L_53C5                          ; 5408   0220 0044

L_540A:
        PSHR    R5                              ; 540A   0275
        MVI@    R4,     R0                      ; 540B   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 540C   0004 0114 0268

        MVI@    R3,     R2                      ; 540F   029A
        SWAP    R2,     1                       ; 5410   0042
        ADDR    R2,     R0                      ; 5411   00D0
        SWAP    R0,     1                       ; 5412   0040
        MVO@    R0,     R1                      ; 5413   0248
        PULR    R7                              ; 5414   02B7

        PSHR    R5                              ; 5415   0275

        JSR     R5,     L_5484                  ; 5416   0004 0154 0084

        MVII    #$02A7, R1                      ; 5419   02B9 02A7
        MVI@    R1,     R0                      ; 541B   0288
        XORI    #$0002, R0                      ; 541C   03F8 0002
        MVO@    R0,     R1                      ; 541E   0248
        INCR    R1                              ; 541F   0009
        MVI@    R1,     R0                      ; 5420   0288
        XORI    #$0003, R0                      ; 5421   03F8 0003
        MVO@    R0,     R1                      ; 5423   0248
        MVII    #$0005, R0                      ; 5424   02B8 0005

        JSR     R5,     .EXEC.772               ; 5426   0004 0114 0372

        CMPI    #$008C, R2                      ; 5429   037A 008C
        BMI     L_5434                          ; 542B   020B 0007

        SUBI    #$0002, R2                      ; 542D   033A 0002

        JSR     R5,     L_5477                  ; 542F   0004 0154 0077

        B       L_543D                          ; 5432   0200 0009

L_5434:
        CMPI    #$0012, R2                      ; 5434   037A 0012
        BPL     L_543D                          ; 5436   0203 0005

        ADDI    #$0002, R2                      ; 5438   02FA 0002

        JSR     R5,     L_5477                  ; 543A   0004 0154 0077

L_543D:
        CMPI    #$0041, R3                      ; 543D   037B 0041
        BPL     L_5448                          ; 543F   0203 0007

        ADDI    #$0002, R3                      ; 5441   02FB 0002

        JSR     R5,     L_5477                  ; 5443   0004 0154 0077

        B       L_5451                          ; 5446   0200 0009

L_5448:
        CMPI    #$0051, R3                      ; 5448   037B 0051
        BMI     L_5451                          ; 544A   020B 0005

        SUBI    #$0002, R3                      ; 544C   033B 0002

        JSR     R5,     L_5477                  ; 544E   0004 0154 0077

L_5451:
        CMPI    #$004B, R3                      ; 5451   037B 004B
        BPL     L_5476                          ; 5453   0203 0021

        CMPI    #$0013, R2                      ; 5455   037A 0013
        BMI     L_5476                          ; 5457   020B 001D

        CMPI    #$0061, R2                      ; 5459   037A 0061
        BPL     L_5476                          ; 545B   0203 0019

        CMPI    #$0014, R2                      ; 545D   037A 0014
        BPL     L_5467                          ; 545F   0203 0006

        SUBI    #$0002, R2                      ; 5461   033A 0002

        JSR     R5,     L_5477                  ; 5463   0004 0154 0077

        PULR    R7                              ; 5466   02B7

L_5467:
        CMPI    #$0062, R2                      ; 5467   037A 0062
        BMI     L_5471                          ; 5469   020B 0006

        ADDI    #$0002, R2                      ; 546B   02FA 0002

        JSR     R5,     L_5477                  ; 546D   0004 0154 0077

        PULR    R7                              ; 5470   02B7

L_5471:
        ADDI    #$0002, R3                      ; 5471   02FB 0002

        JSR     R5,     L_5477                  ; 5473   0004 0154 0077

L_5476:
        PULR    R7                              ; 5476   02B7

L_5477:
        PSHR    R5                              ; 5477   0275
        SWAP    R2,     1                       ; 5478   0042
        MVO     R2,     G_0347                  ; 5479   0242 0347
        SWAP    R3,     1                       ; 547B   0043
        MVO     R3,     G_0348                  ; 547C   0243 0348
        CLRR    R5                              ; 547E   01ED
        MVO     R5,     G_0349                  ; 547F   0245 0349
        SWAP    R2,     1                       ; 5481   0042
        SWAP    R3,     1                       ; 5482   0043
        PULR    R7                              ; 5483   02B7

L_5484:
        PSHR    R5                              ; 5484   0275
        MVI     G_01DB, R5                      ; 5485   0285 01DB
        TSTR    R5                              ; 5487   00AD
        BEQ     L_548B                          ; 5488   0204 0001

        PULR    R5                              ; 548A   02B5
L_548B:
        PULR    R7                              ; 548B   02B7

        PSHR    R5                              ; 548C   0275

        JSR     R5,     L_5484                  ; 548D   0004 0154 0084

        CLRR    R0                              ; 5490   01C0
        MVI     G_01D6, R1                      ; 5491   0281 01D6
        MVII    #$0005, R3                      ; 5493   02BB 0005
        SUBR    R1,     R3                      ; 5495   010B
        SUBR    R3,     R0                      ; 5496   0118
        SLL     R1,     1                       ; 5497   0049
        ADDR    R1,     R0                      ; 5498   00C8
        SLL     R1,     2                       ; 5499   004D
        ADDR    R1,     R0                      ; 549A   00C8
        MVI     G_034A, R5                      ; 549B   0285 034A
        CMPI    #$0004, R5                      ; 549D   037D 0004
        BNEQ    L_54A3                          ; 549F   020C 0002

        SUBI    #$0005, R0                      ; 54A1   0338 0005
L_54A3:
        MVII    #$01D0, R5                      ; 54A3   02BD 01D0
        SDBD                                    ; 54A5   0001
        MVI@    R5,     R1                      ; 54A6   02A9
        PSHR    R0                              ; 54A7   0270
        PSHR    R1                              ; 54A8   0271
        MVII    #$0064, R2                      ; 54A9   02BA 0064

        JSR     R5,     X_DIV                   ; 54AB   0004 011C 01FB

        PULR    R1                              ; 54AE   02B1
        PULR    R2                              ; 54AF   02B2
        PSHR    R0                              ; 54B0   0270
        ADDR    R2,     R1                      ; 54B1   00D1
        PSHR    R1                              ; 54B2   0271
        MVII    #$0064, R2                      ; 54B3   02BA 0064

        JSR     R5,     X_DIV                   ; 54B5   0004 011C 01FB

        PULR    R1                              ; 54B8   02B1
        PULR    R2                              ; 54B9   02B2
        MVII    #$01D0, R5                      ; 54BA   02BD 01D0
        MVO@    R1,     R5                      ; 54BC   0269
        SWAP    R1,     1                       ; 54BD   0041
        MVO@    R1,     R5                      ; 54BE   0269
        CMPR    R0,     R2                      ; 54BF   0142
        BEQ     L_54C9                          ; 54C0   0204 0007

        JSR     R5,     L_52FB                  ; 54C2   0004 0150 02FB
        JSR     R5,     L_568C                  ; 54C5   0004 0154 028C

        PULR    R7                              ; 54C8   02B7

L_54C9:
        JSR     R5,     L_52FB                  ; 54C9   0004 0150 02FB

        PULR    R7                              ; 54CC   02B7

        SWAP    R1,     2                       ; 54CD   0045
        SLL     R2,     2                       ; 54CE   004E
        SWAP    R0,     2                       ; 54CF   0044
        NEGR    R0                              ; 54D0   0020
        SLL     R3,     2                       ; 54D1   004F
        SWAP    R2,     2                       ; 54D2   0046
        NEGR    R0                              ; 54D3   0020
        SWAP    R3,     2                       ; 54D4   0047
        SWAP    R1,     1                       ; 54D5   0041
        SLL     R1,     2                       ; 54D6   004D
        SWAP    R1,     2                       ; 54D7   0045
        INCR    R5                              ; 54D8   000D
        PSHR    R5                              ; 54D9   0275
        CMP     G_01D5, R0                      ; 54DA   0340 01D5
        BEQ     L_5509                          ; 54DC   0204 002B

        MVI     G_034A, R0                      ; 54DE   0280 034A
        CMPI    #$0004, R0                      ; 54E0   0378 0004
        BEQ     L_554A                          ; 54E2   0204 0066

        MVI     G_034D, R0                      ; 54E4   0280 034D
        MOVR    R0,     R1                      ; 54E6   0081
        SDBD                                    ; 54E7   0001
        ANDI    #$0800, R1                      ; 54E8   03B9 0000 0008
        BEQ     L_554A                          ; 54EB   0204 005D

        SDBD                                    ; 54ED   0001
        ANDI    #$F7FF, R0                      ; 54EE   03B8 00FF 00F7
        MVO     R0,     G_034D                  ; 54F1   0240 034D
        MVII    #$0001, R0                      ; 54F3   02B8 0001
        MVO     R0,     G_0352                  ; 54F5   0240 0352

        JSR     R5,     L_5549                  ; 54F7   0004 0154 0149

        MVII    #$0014, R0                      ; 54FA   02B8 0014
        MVO     R0,     G_0353                  ; 54FC   0240 0353
        MVI     G_01D7, R0                      ; 54FE   0280 01D7
        DECR    R0                              ; 5500   0010
        MVO     R0,     G_01D7                  ; 5501   0240 01D7

        JSR     R5,     L_52EC                  ; 5503   0004 0150 02EC
        JSR     R5,     L_D795                  ; 5506   0004 01D4 0395

L_5509:
        PULR    R7                              ; 5509   02B7

        PSHR    R5                              ; 550A   0275
        MVI     G_0352, R1                      ; 550B   0281 0352
        CLRR    R0                              ; 550D   01C0
        MVO     R0,     G_0352                  ; 550E   0240 0352
        MVI     G_01D7, R0                      ; 5510   0280 01D7
        TSTR    R0                              ; 5512   0080
        BNEQ    L_5534                          ; 5513   020C 001F

        MVII    #$027D, R4                      ; 5515   02BC 027D
        SDBD                                    ; 5517   0001
        MVII    #$0607, R3                      ; 5518   02BB 0007 0006
        SDBD                                    ; 551B   0001
        MVII    #$D429, R1                      ; 551C   02B9 0029 00D4

        JSR     R5,     X_PRINT_R1              ; 551F   0004 0118 0067

        MVII    #$02DD, R4                      ; 5522   02BC 02DD
        SDBD                                    ; 5524   0001
        MVII    #$2200, R3                      ; 5525   02BB 0000 0022
        SDBD                                    ; 5528   0001
        MVII    #$D434, R1                      ; 5529   02B9 0034 00D4

        JSR     R5,     X_PRINT_R1              ; 552C   0004 0118 0067
        JSR     R5,     L_6FD7                  ; 552F   0004 016C 03D7

        B       L_5283                          ; 5532   0220 02B0

L_5534:
        TSTR    R1                              ; 5534   0089
        BEQ     L_553C                          ; 5535   0204 0005

        MVII    #$0003, R0                      ; 5537   02B8 0003
        MVO     R0,     G_0353                  ; 5539   0240 0353
        PULR    R7                              ; 553B   02B7

L_553C:
        MVI     G_034D, R0                      ; 553C   0280 034D
        SDBD                                    ; 553E   0001
        ANDI    #$F7FF, R0                      ; 553F   03B8 00FF 00F7
        SDBD                                    ; 5542   0001
        XORI    #$0800, R0                      ; 5543   03F8 0000 0008
        MVO     R0,     G_034D                  ; 5546   0240 034D
        PULR    R7                              ; 5548   02B7

L_5549:
        PSHR    R5                              ; 5549   0275
L_554A:
        MOVR    R1,     R3                      ; 554A   008B
        ADDI    #$0004, R3                      ; 554B   02FB 0004
        MVI@    R3,     R0                      ; 554D   0298

        JSR     R5,     X_UNPK_BYTES            ; 554E   0004 0114 0357

        NEGR    R0                              ; 5551   0020
        NEGR    R1                              ; 5552   0021

        JSR     R5,     X_PACK_BYTES            ; 5553   0004 0114 034F

        MVO@    R0,     R3                      ; 5556   0258
        PULR    R7                              ; 5557   02B7

        PSHR    R5                              ; 5558   0275
        CMP     G_01D5, R0                      ; 5559   0340 01D5
        BEQ     L_5599                          ; 555B   0204 003C

        MVI     G_01D3, R2                      ; 555D   0282 01D3
        CMPI    #$0008, R2                      ; 555F   037A 0008
        BNEQ    L_5599                          ; 5561   020C 0036

        MVI     G_034A, R2                      ; 5563   0282 034A
        TSTR    R2                              ; 5565   0092
        BEQ     L_5599                          ; 5566   0204 0031

        MVI@    R1,     R2                      ; 5568   028A
        SDBD                                    ; 5569   0001
        ANDI    #$F7FF, R2                      ; 556A   03BA 00FF 00F7
        MVO@    R2,     R1                      ; 556D   024A
        SDBD                                    ; 556E   0001
        MVII    #$5248, R2                      ; 556F   02BA 0048 0052
        MVO     R2,     G_035D                  ; 5572   0242 035D
        CLRR    R2                              ; 5574   01D2
        MVO     R2,     G_01D2                  ; 5575   0242 01D2
        MVO     R2,     G_01D9                  ; 5577   0242 01D9
        MVI@    R1,     R2                      ; 5579   028A
        SDBD                                    ; 557A   0001
        XORI    #$8000, R2                      ; 557B   03FA 0000 0080
        MVO@    R2,     R1                      ; 557E   024A
        ADDI    #$0007, R1                      ; 557F   02F9 0007
        MVII    #$0010, R2                      ; 5581   02BA 0010
        MVO@    R2,     R1                      ; 5583   024A
        MVO     R0,     G_01D3                  ; 5584   0240 01D3

        JSR     R5,     X_PLAY_SFX2             ; 5586   0004 0118 03BE
        DECLE   $0060                           ; 5589  SFX prio
        DECLE   $03F9                           ; 558A  SFX data
        DECLE   $0389                           ; 558B  SFX data
        DECLE   $009C,  $0310                   ; 558C  SFX data
        DECLE   $004B                           ; 558E  SFX data
        DECLE   $0040,  $03FF                   ; 558F  SFX data
        DECLE   $0048,  $03FF                   ; 5591  SFX data
        DECLE   $0044,  $03FF                   ; 5593  SFX data
        DECLE   $01CF                           ; 5595  SFX end


        JSR     R5,     L_55BF                  ; 5596   0004 0154 01BF

L_5599:
        PULR    R7                              ; 5599   02B7

        PSHR    R5                              ; 559A   0275
        MVI     G_01D3, R1                      ; 559B   0281 01D3
        CMPI    #$0008, R1                      ; 559D   0379 0008
        BEQ     L_55BE                          ; 559F   0204 001D

        TSTR    R0                              ; 55A1   0080
        BMI     L_55BA                          ; 55A2   020B 0016

        MVI     G_01D4, R0                      ; 55A4   0280 01D4
        TSTR    R0                              ; 55A6   0080
        BNEQ    L_55BE                          ; 55A7   020C 0015

        JSR     R5,     L_55BF                  ; 55A9   0004 0154 01BF

        MVII    #$0004, R0                      ; 55AC   02B8 0004
        MVO     R0,     G_01D2                  ; 55AE   0240 01D2
        MVII    #$0001, R0                      ; 55B0   02B8 0001
        MVO     R0,     G_01D4                  ; 55B2   0240 01D4
        CLRR    R0                              ; 55B4   01C0
        MVO     R0,     G_01D8                  ; 55B5   0240 01D8
        MVO     R0,     G_01D9                  ; 55B7   0240 01D9
        PULR    R7                              ; 55B9   02B7

L_55BA:
        MVI     G_01D8, R0                      ; 55BA   0280 01D8
        MVO     R0,     G_01D9                  ; 55BC   0240 01D9
L_55BE:
        PULR    R7                              ; 55BE   02B7

L_55BF:
        PSHR    R5                              ; 55BF   0275
        MVI     G_0345, R3                      ; 55C0   0283 0345
        MVI     G_034D, R4                      ; 55C2   0284 034D
        MVI     G_0355, R5                      ; 55C4   0285 0355
        SDBD                                    ; 55C6   0001
        ANDI    #$FDFF, R3                      ; 55C7   03BB 00FF 00FD
        SDBD                                    ; 55CA   0001
        ANDI    #$FDFF, R4                      ; 55CB   03BC 00FF 00FD
        SDBD                                    ; 55CE   0001
        ANDI    #$FDFF, R5                      ; 55CF   03BD 00FF 00FD
        MVO     R3,     G_0345                  ; 55D2   0243 0345
        MVO     R4,     G_034D                  ; 55D4   0244 034D
        MVO     R5,     G_0355                  ; 55D6   0245 0355
        SDBD                                    ; 55D8   0001
        MVII    #$0400, R3                      ; 55D9   02BB 0000 0004
        MVO     R3,     G_0351                  ; 55DC   0243 0351
        PULR    R7                              ; 55DE   02B7

        PSHR    R5                              ; 55DF   0275
        MVI     G_01D5, R3                      ; 55E0   0283 01D5
        CMPR    R3,     R0                      ; 55E2   0158
        BNEQ    L_5626                          ; 55E3   020C 0041

        TSTR    R2                              ; 55E5   0092
        BNEQ    L_5626                          ; 55E6   020C 003E

        ADDI    #$0003, R1                      ; 55E8   02F9 0003
        MVI@    R1,     R0                      ; 55EA   0288
        SWAP    R0,     1                       ; 55EB   0040
        ANDI    #$00FF, R0                      ; 55EC   03B8 00FF
        CMPI    #$0048, R0                      ; 55EE   0378 0048
        BMI     L_5620                          ; 55F0   020B 002E

        CMPI    #$005B, R0                      ; 55F2   0378 005B
        BPL     L_5620                          ; 55F4   0203 002A

        INCR    R1                              ; 55F6   0009
        CLRR    R0                              ; 55F7   01C0
        MVO@    R0,     R1                      ; 55F8   0248
        ADDI    #$0002, R1                      ; 55F9   02F9 0002
        MVII    #$00FF, R0                      ; 55FB   02B8 00FF
        MVO@    R0,     R1                      ; 55FD   0248

        JSR     R5,     L_D7A2                  ; 55FE   0004 01D4 03A2

        MVI     G_01D6, R5                      ; 5601   0285 01D6
        INCR    R5                              ; 5603   000D
        CMPI    #$0005, R5                      ; 5604   037D 0005
        BMI     L_560A                          ; 5606   020B 0002

        MVII    #$0005, R5                      ; 5608   02BD 0005
L_560A:
        MVO     R5,     G_01D6                  ; 560A   0245 01D6
        CMPI    #$0005, R5                      ; 560C   037D 0005
        BNEQ    L_52DE                          ; 560E   022C 0331

        MVI     G_01D7, R5                      ; 5610   0285 01D7
        INCR    R5                              ; 5612   000D
        CMPI    #$0009, R5                      ; 5613   037D 0009
        BMI     L_5619                          ; 5615   020B 0002

        MVII    #$0009, R5                      ; 5617   02BD 0009
L_5619:
        MVO     R5,     G_01D7                  ; 5619   0245 01D7

        JSR     R5,     L_52EC                  ; 561B   0004 0150 02EC

        B       L_52DE                          ; 561E   0220 0341

L_5620:
        MVII    #$0008, R0                      ; 5620   02B8 0008
        MVO     R0,     G_01D5                  ; 5622   0240 01D5
        B       L_5628                          ; 5624   0200 0002

L_5626:
        ADDI    #$0003, R1                      ; 5626   02F9 0003
L_5628:
        INCR    R1                              ; 5628   0009
        MOVR    R1,     R3                      ; 5629   008B
        MVI@    R3,     R0                      ; 562A   0298

        JSR     R5,     X_UNPK_BYTES            ; 562B   0004 0114 0357

        SLL     R2,     1                       ; 562E   004A
        ADDR    R2,     R7                      ; 562F   00D7
        B       L_5639                          ; 5630   0200 0007
        B       L_5639                          ; 5632   0200 0005
        B       L_5636                          ; 5634   0200 0000

L_5636:
        NEGR    R1                              ; 5636   0021
        B       L_563A                          ; 5637   0200 0001

L_5639:
        NEGR    R0                              ; 5639   0020

L_563A:
        JSR     R5,     X_PACK_BYTES            ; 563A   0004 0114 034F

        MVO@    R0,     R3                      ; 563D   0258
        PULR    R7                              ; 563E   02B7

        PSHR    R5                              ; 563F   0275
        TSTR    R0                              ; 5640   0080
        BMI     L_564F                          ; 5641   020B 000C

        CLRR    R0                              ; 5643   01C0
        B       L_564C                          ; 5644   0200 0006

        PSHR    R5                              ; 5646   0275
        TSTR    R0                              ; 5647   0080
        BMI     L_564F                          ; 5648   020B 0005

        MVII    #$0007, R0                      ; 564A   02B8 0007
L_564C:
        MVO     R0,     G_01D2                  ; 564C   0240 01D2
        PULR    R7                              ; 564E   02B7

L_564F:
        MVI     G_034A, R0                      ; 564F   0280 034A
        MVO     R0,     G_01D2                  ; 5651   0240 01D2
        PULR    R7                              ; 5653   02B7

        PSHR    R5                              ; 5654   0275
        TSTR    R0                              ; 5655   0080
        BMI     L_5686                          ; 5656   020B 002E

        MOVR    R0,     R1                      ; 5658   0081
        MVII    #$000F, R0                      ; 5659   02B8 000F

        JSR     R5,     .EXEC.629               ; 565B   0004 0114 0229

        MVO     R0,     G_0349                  ; 565E   0240 0349
        MVI     G_0345, R1                      ; 5660   0281 0345
        MVI     G_034D, R2                      ; 5662   0282 034D
        MVI     G_0355, R3                      ; 5664   0283 0355
        SDBD                                    ; 5666   0001
        ANDI    #$FDFF, R1                      ; 5667   03B9 00FF 00FD
        SDBD                                    ; 566A   0001
        ANDI    #$FDFF, R2                      ; 566B   03BA 00FF 00FD
        SDBD                                    ; 566E   0001
        ANDI    #$FDFF, R3                      ; 566F   03BB 00FF 00FD
        TSTR    R0                              ; 5672   0080
        BPL     L_567B                          ; 5673   0203 0006

        XORI    #$0200, R1                      ; 5675   03F9 0200
        XORI    #$0200, R2                      ; 5677   03FA 0200
        XORI    #$0200, R3                      ; 5679   03FB 0200
L_567B:
        MVO     R1,     G_0345                  ; 567B   0241 0345
        MVO     R2,     G_034D                  ; 567D   0242 034D
        MVO     R3,     G_0355                  ; 567F   0243 0355
        MVII    #$01F0, R0                      ; 5681   02B8 01F0
        MVO     R0,     G_035A                  ; 5683   0240 035A
        PULR    R7                              ; 5685   02B7

L_5686:
        CLRR    R0                              ; 5686   01C0
        MVO     R0,     G_0349                  ; 5687   0240 0349
        MVO     R0,     G_035A                  ; 5689   0240 035A
        PULR    R7                              ; 568B   02B7

L_568C:
        PSHR    R5                              ; 568C   0275
        CLRR    R3                              ; 568D   01DB

L_568E:
        JSR     R5,     L_5697                  ; 568E   0004 0154 0297

        INCR    R3                              ; 5691   000B
        CMPI    #$0005, R3                      ; 5692   037B 0005
        BNEQ    L_568E                          ; 5694   022C 0007
        PULR    R7                              ; 5696   02B7

L_5697:
        PSHR    R5                              ; 5697   0275
        MOVR    R3,     R0                      ; 5698   0098

        JSR     R5,     .EXEC.76C               ; 5699   0004 0114 036C

        MOVR    R1,     R4                      ; 569C   008C
        MVII    #$01D0, R5                      ; 569D   02BD 01D0
        SDBD                                    ; 569F   0001
        MVI@    R5,     R1                      ; 56A0   02A9
        MVII    #$0064, R2                      ; 56A1   02BA 0064

        JSR     R5,     X_DIV                   ; 56A3   0004 011C 01FB

        TSTR    R0                              ; 56A6   0080
        BPL     L_56AA                          ; 56A7   0203 0001

        NEGR    R0                              ; 56A9   0020
L_56AA:
        CMPI    #$000E, R0                      ; 56AA   0378 000E
        BMI     L_56B0                          ; 56AC   020B 0002

        MVII    #$000D, R0                      ; 56AE   02B8 000D
L_56B0:
        INCR    R0                              ; 56B0   0008
        SLL     R0,     2                       ; 56B1   004C
        ADDI    #$0007, R4                      ; 56B2   02FC 0007
        MVI@    R4,     R1                      ; 56B4   02A1
        CMPI    #$0010, R1                      ; 56B5   0379 0010
        BEQ     L_56C9                          ; 56B7   0204 0010

        CMPI    #$0020, R1                      ; 56B9   0379 0020
        BEQ     L_56C9                          ; 56BB   0204 000C

        MOVR    R1,     R2                      ; 56BD   008A
        DECR    R4                              ; 56BE   0014
        INCR    R2                              ; 56BF   000A
        ANDI    #$000F, R2                      ; 56C0   03BA 000F
        MVO@    R2,     R4                      ; 56C2   0262
        SUBI    #$0004, R4                      ; 56C3   033C 0004

        JSR     R5,     .EXEC.629               ; 56C5   0004 0114 0229

        MVO@    R0,     R4                      ; 56C8   0260
L_56C9:
        PULR    R7                              ; 56C9   02B7

        PSHR    R5                              ; 56CA   0275
        MOVR    R1,     R3                      ; 56CB   008B
        ADDI    #$0007, R3                      ; 56CC   02FB 0007
        MVI@    R3,     R2                      ; 56CE   029A
        ANDI    #$0020, R2                      ; 56CF   03BA 0020
        BNEQ    L_56E1                          ; 56D1   020C 000E

        MVII    #$0020, R2                      ; 56D3   02BA 0020
        MVO@    R2,     R3                      ; 56D5   025A
        MVI@    R1,     R0                      ; 56D6   0288
        SDBD                                    ; 56D7   0001
        ANDI    #$F7FF, R0                      ; 56D8   03B8 00FF 00F7
        SDBD                                    ; 56DB   0001
        XORI    #$0800, R0                      ; 56DC   03F8 0000 0008
        MVO@    R0,     R1                      ; 56DF   0248
        PULR    R7                              ; 56E0   02B7

L_56E1:
        MOVR    R0,     R3                      ; 56E1   0083
        ADDI    #$0002, R1                      ; 56E2   02F9 0002
        MVII    #$0020, R0                      ; 56E4   02B8 0020
        SWAP    R0,     1                       ; 56E6   0040
        MVO@    R0,     R1                      ; 56E7   0248
        INCR    R1                              ; 56E8   0009
        MVII    #$004F, R0                      ; 56E9   02B8 004F
        SWAP    R0,     1                       ; 56EB   0040
        MVO@    R0,     R1                      ; 56EC   0248
        MVII    #$0004, R0                      ; 56ED   02B8 0004

        JSR     R5,     X_RAND1                 ; 56EF   0004 0114 027D

        ADDI    #$0004, R1                      ; 56F2   02F9 0004
        MVO@    R0,     R1                      ; 56F4   0248

        JSR     R5,     L_5697                  ; 56F5   0004 0154 0297

        MVII    #$0008, R0                      ; 56F8   02B8 0008
        MVO     R0,     G_01D5                  ; 56FA   0240 01D5
        MVI     G_01D6, R0                      ; 56FC   0280 01D6
        DECR    R0                              ; 56FE   0010
        BPL     L_5702                          ; 56FF   0203 0001

        CLRR    R0                              ; 5701   01C0
L_5702:
        MVO     R0,     G_01D6                  ; 5702   0240 01D6
        J       L_52DE                          ; 5704   0004 0350 02DE

        PSHR    R5                              ; 5707   0275
        TSTR    R0                              ; 5708   0080
        BMI     L_5724                          ; 5709   020B 0019

        CMPI    #$000A, R0                      ; 570B   0378 000A
        BNEQ    L_5724                          ; 570D   020C 0015

        MVI     G_01DB, R2                      ; 570F   0282 01DB
        XORI    #$0080, R2                      ; 5711   03FA 0080
        MVO     R2,     G_01DB                  ; 5713   0242 01DB
        SWAP    R2,     1                       ; 5715   0042
        CLRR    R0                              ; 5716   01C0

L_5717:
        JSR     R5,     .EXEC.76C               ; 5717   0004 0114 036C

        MVI@    R1,     R3                      ; 571A   028B
        SLL     R3,     1                       ; 571B   004B
        SLR     R3,     1                       ; 571C   0063
        XORR    R2,     R3                      ; 571D   01D3
        MVO@    R3,     R1                      ; 571E   024B
        INCR    R0                              ; 571F   0008
        CMPI    #$0008, R0                      ; 5720   0378 0008
        BNEQ    L_5717                          ; 5722   022C 000C

L_5724:
        TSTR    R2                              ; 5724   0092
        BNEQ    L_5736                          ; 5725   020C 000F

        MVI     G_01D3, R0                      ; 5727   0280 01D3
        CMPI    #$0008, R0                      ; 5729   0378 0008
        BEQ     L_5736                          ; 572B   0204 0009

        JSR     R5,     .EXEC.76C               ; 572D   0004 0114 036C

        MVI@    R1,     R0                      ; 5730   0288
        SDBD                                    ; 5731   0001
        XORI    #$8000, R0                      ; 5732   03F8 0000 0080
        MVO@    R0,     R1                      ; 5735   0248
L_5736:
        MVII    #$0001, R0                      ; 5736   02B8 0001
        PULR    R7                              ; 5738   02B7

        CLRR    R2                              ; 5739   01D2
        B       L_573E                          ; 573A   0200 0002

        MVII    #$0080, R2                      ; 573C   02BA 0080
L_573E:
        MVO     R2,     G_01DB                  ; 573E   0242 01DB
        SWAP    R2,     1                       ; 5740   0042
        CLRR    R0                              ; 5741   01C0
        B       L_5717                          ; 5742   0220 002C

        MVII    #$0005, R3                      ; 5744   02BB 0005
        CLRR    R0                              ; 5746   01C0
L_5747:
        PSHR    R0                              ; 5747   0270

        JSR     R5,     .EXEC.76C               ; 5748   0004 0114 036C

        SDBD                                    ; 574B   0001
        MVII    #$0F0F, R4                      ; 574C   02BC 000F 000F

        JSR     R5,     .EXEC.70F               ; 574F   0004 0114 030F

        PULR    R0                              ; 5752   02B0
        TSTR    R4                              ; 5753   00A4
        BMI     L_5763                          ; 5754   020B 000D

        TSTR    R5                              ; 5756   00AD
        BMI     L_5763                          ; 5757   020B 000A

L_5759:
        SDBD                                    ; 5759   0001
        DECLE   $02BB,  $0041,  $0047,  $0004   ; 575A   02BB 0041 0047 0004

        CLRR    R4                              ; 575E   01E4
        XORR    R7,     R3                      ; 575F   01FB
        MVII    #$0001, R0                      ; 5760   02B8 0001
        PULR    R7                              ; 5762   02B7

L_5763:
        INCR    R0                              ; 5763   0008
        CMPI    #$0005, R0                      ; 5764   0378 0005
        BNEQ    L_5747                          ; 5766   022C 0020

        CLRR    R0                              ; 5768   01C0
        DECR    R0                              ; 5769   0010
        B       L_5759                          ; 576A   0220 0012

        DECLE   $0280,  $01D3,  $0378,  $0008   ; 576C   0280 01D3 0378 0008
        DECLE   $0204,  $001B,  $0001,  $02BB   ; 5770   0204 001B 0001 02BB
        DECLE   $000D,  $0047,  $02BC,  $0019   ; 5774   000D 0047 02BC 0019
        DECLE   $0004                           ; 5778   0004

        CLRR    R4                              ; 5779   01E4
        XORR    R3,     R4                      ; 577A   01DC
        TSTR    R0                              ; 577B   0080
        BEQ     L_578D                          ; 577C   0204 000F

        MVO     R0,     G_01DA                  ; 577E   0240 01DA
        CLRR    R0                              ; 5780   01C0
        MVO     R0,     G_01D9                  ; 5781   0240 01D9
        INCR    R0                              ; 5783   0008
        MVO     R0,     G_01D4                  ; 5784   0240 01D4
        MVII    #$0004, R0                      ; 5786   02B8 0004
        MVO     R0,     G_01D2                  ; 5788   0240 01D2

        JSR     R5,     L_55BF                  ; 578A   0004 0154 01BF

L_578D:
        MVII    #$0001, R0                      ; 578D   02B8 0001
        PULR    R7                              ; 578F   02B7

        TSTR    R0                              ; 5790   0080
        BNEQ    L_5794                          ; 5791   020C 0001
        PULR    R7                              ; 5793   02B7

L_5794:
        MVI     G_01D3, R0                      ; 5794   0280 01D3
        CMPI    #$0008, R0                      ; 5796   0378 0008
        BEQ     L_57B1                          ; 5798   0204 0017

        MVI     G_034A, R2                      ; 579A   0282 034A
        ANDI    #$000F, R2                      ; 579C   03BA 000F
        MVI     G_01D2, R3                      ; 579E   0283 01D2
        CMPR    R2,     R3                      ; 57A0   0153
        BNEQ    L_57B1                          ; 57A1   020C 000E

L_57A3:
        SDBD                                    ; 57A3   0001
        DECLE   $02BB,  $00DB,  $0047,  $0004   ; 57A4   02BB 00DB 0047 0004
        DECLE   $01E4,  $01FB,  $0001,  $02BA   ; 57A8   01E4 01FB 0001 02BA
        DECLE   $00DB,  $0047,  $0004           ; 57AC   00DB 0047 0004

        CMPI    #$003D, R0                      ; 57AF   0378 003D
L_57B1:
        CLRR    R0                              ; 57B1   01C0
        DECR    R0                              ; 57B2   0010
        B       L_57A3                          ; 57B3   0220 0011

        DECLE   $0080,  $0204,  $0010,  $0280   ; 57B5   0080 0204 0010 0280
        DECLE   $01D2,  $0001,  $02BB,  $00DB   ; 57B9   01D2 0001 02BB 00DB
        DECLE   $0047,  $0004,  $01EC,  $0340   ; 57BD   0047 0004 01EC 0340
        DECLE   $0001,  $02BA,  $00DB,  $0047   ; 57C1   0001 02BA 00DB 0047
        DECLE   $0004,  $0378,  $003D,  $02BA   ; 57C5   0004 0378 003D 02BA
        DECLE   $0007,  $01C9,  $0283,  $035C   ; 57C9   0007 01C9 0283 035C
        DECLE   $0004                           ; 57CD   0004

        CLRR    R4                              ; 57CE   01E4
        ANDR    R2,     R1                      ; 57CF   0191
        MVO     R0,     G_01D2                  ; 57D0   0240 01D2
        PULR    R7                              ; 57D2   02B7

        DECLE   $004E,  $004D,  $004C,  $004B   ; 57D3   004E 004D 004C 004B
        DECLE   $0000,  $0037,  $0058,  $004A   ; 57D7   0000 0037 0058 004A
        DECLE   $0058,  $0050,  $004B,  $0055   ; 57DB   0058 0050 004B 0055
        DECLE   $0050,  $0044,  $0052,  $004F   ; 57DF   0050 0044 0052 004F
        DECLE   $0050,  $004A,  $0055,  $004D   ; 57E3   0050 004A 0055 004D
        DECLE   $0050,  $0052,  $0055,  $004E   ; 57E7   0050 0052 0055 004E
        DECLE   $0052,  $0052,  $0055,  $004E   ; 57EB   0052 0052 0055 004E
        DECLE   $004C,  $0053,  $0054,  $004F   ; 57EF   004C 0053 0054 004F
        DECLE   $0050,  $0042,  $004F,  $004F   ; 57F3   0050 0042 004F 004F
        DECLE   $004D,  $0043,  $004E,  $0047   ; 57F7   004D 0043 004E 0047
        DECLE   $0047,  $0044,  $0055,  $0043   ; 57FB   0047 0044 0055 0043
        DECLE   $004B,  $004A,  $004D,  $0050   ; 57FF   004B 004A 004D 0050
        DECLE   $0031,  $004A,  $004D,  $0050   ; 5803   0031 004A 004D 0050
        DECLE   $0032,  $004A,  $004D,  $0050   ; 5807   0032 004A 004D 0050
        DECLE   $0033,  $004A,  $004D,  $0050   ; 580B   0033 004A 004D 0050
        DECLE   $004C,  $004A,  $004D,  $0050   ; 580F   004C 004A 004D 0050
        DECLE   $0055,  $004A,  $004D,  $0050   ; 5813   0055 004A 004D 0050
        DECLE   $0052,  $0000                   ; 5817   0052 0000

        MOVR    R3,     R6                      ; 5819   009E
        SLLC    R0,     1                       ; 581A   0058
        MOVR    R4,     R6                      ; 581B   00A6
        SLLC    R0,     1                       ; 581C   0058
        MOVR    R5,     R6                      ; 581D   00AE
        SLLC    R0,     1                       ; 581E   0058
        MOVR    R7,     R0                      ; 581F   00B8
        SLLC    R0,     1                       ; 5820   0058
        ADDR    R0,     R1                      ; 5821   00C1
        SLLC    R0,     1                       ; 5822   0058
        ADDR    R1,     R3                      ; 5823   00CB
        SLLC    R0,     1                       ; 5824   0058
        DECR    R1                              ; 5825   0011
        SLLC    R1,     1                       ; 5826   0059
        ADCR    R1                              ; 5827   0029
        SLLC    R1,     1                       ; 5828   0059
        ADDR    R2,     R7                      ; 5829   00D7

        DECLE   $0058,  $00E1,  $0058,  $00E9   ; 582A   0058 00E1 0058 00E9
        DECLE   $0058,  $00F1,  $0058,  $00F9   ; 582E   0058 00F1 0058 00F9
        DECLE   $0058,  $0001,  $0059,  $0009   ; 5832   0058 0001 0059 0009
        DECLE   $0059,  $0080,  $020C,  $000D   ; 5836   0059 0080 020C 000D
        DECLE   $0283,  $035C,  $0004           ; 583A   0283 035C 0004

        CLRR    R4                              ; 583D   01E4
        XORR    R3,     R4                      ; 583E   01DC
        MVO     R0,     G_01D0                  ; 583F   0240 01D0
        SWAP    R0,     1                       ; 5841   0040
        MVO     R0,     G_01D1                  ; 5842   0240 01D1
        MVII    #$0001, R0                      ; 5844   02B8 0001
        PULR    R7                              ; 5846   02B7

        DECLE   $0004,  $0378,  $003D,  $0080   ; 5847   0004 0378 003D 0080
        DECLE   $0204,  $004E,  $0093,  $0004   ; 584B   0204 004E 0093 0004

        CLRR    R4                              ; 584F   01E4
        ANDR    R4,     R2                      ; 5850   01A2

        JSR     R5,     X_CLAMP                 ; 5851   0004 0114 0270
        DECLE   $0001                           ; 5854   0001

        INCR    R2                              ; 5855   000A
        MVI     G_032F, R2                      ; 5856   0282 032F
        SWAP    R2,     1                       ; 5858   0042
        ANDI    #$00FF, R2                      ; 5859   03BA 00FF
        SUBI    #$0005, R2                      ; 585B   033A 0005
        SLR     R2,     2                       ; 585D   0066
        SLR     R2,     1                       ; 585E   0062
        MVI     G_032D, R1                      ; 585F   0281 032D
        ANDI    #$0200, R1                      ; 5861   03B9 0200
        TSTR    R1                              ; 5863   0089
        BEQ     L_5867                          ; 5864   0204 0001

        NEGR    R0                              ; 5866   0020
L_5867:
        ADDI    #$0228, R0                      ; 5867   02F8 0228
        ADDR    R2,     R0                      ; 5869   00D0
        MOVR    R0,     R1                      ; 586A   0081
        MVI@    R1,     R1                      ; 586B   0289
        SDBD                                    ; 586C   0001
        ANDI    #$09F8, R1                      ; 586D   03B9 00F8 0009
        MVII    #$0003, R0                      ; 5870   02B8 0003
        SDBD                                    ; 5872   0001
        CMPI    #$0930, R1                      ; 5873   0379 0030 0009
        BEQ     L_5890                          ; 5876   0204 0018

        SUBI    #$0001, R0                      ; 5878   0338 0001
        SDBD                                    ; 587A   0001
        CMPI    #$0910, R1                      ; 587B   0379 0010 0009
        BEQ     L_5890                          ; 587E   0204 0010

        SDBD                                    ; 5880   0001
        CMPI    #$0928, R1                      ; 5881   0379 0028 0009
        BEQ     L_5890                          ; 5884   0204 000A

        SUBI    #$0001, R0                      ; 5886   0338 0001
        SDBD                                    ; 5888   0001
        CMPI    #$0948, R1                      ; 5889   0379 0048 0009
        BEQ     L_5890                          ; 588C   0204 0002

        SUBI    #$0001, R0                      ; 588E   0338 0001
L_5890:
        SDBD                                    ; 5890   0001
        DECLE   $02BB,  $00DB,  $0047,  $0004   ; 5891   02BB 00DB 0047 0004
        DECLE   $01EC,  $0340,  $0001,  $02BA   ; 5895   01EC 0340 0001 02BA
        DECLE   $00DB,  $0047,  $0004           ; 5899   00DB 0047 0004

        CMPI    #$003D, R0                      ; 589C   0378 003D

        JSR     R5,     L_593A                  ; 589E   0004 0158 013A
        JSR     R5,     L_5AF4                  ; 58A1   0004 0158 02F4

        B       L_5937                          ; 58A4   0200 0091

        JSR     R5,     L_593A                  ; 58A6   0004 0158 013A
        JSR     R5,     L_5B4C                  ; 58A9   0004 0158 034C

        B       L_5937                          ; 58AC   0200 0089

        JSR     R5,     L_593A                  ; 58AE   0004 0158 013A

        MVII    #$0004, R0                      ; 58B1   02B8 0004

        JSR     R5,     L_D2CE                  ; 58B3   0004 01D0 02CE

        B       L_5937                          ; 58B6   0200 007F

        JSR     R5,     L_593A                  ; 58B8   0004 0158 013A

        CLRR    R0                              ; 58BB   01C0

        JSR     R5,     L_D2CE                  ; 58BC   0004 01D0 02CE

        B       L_5937                          ; 58BF   0200 0076

        JSR     R5,     L_593A                  ; 58C1   0004 0158 013A

        MVII    #$0008, R0                      ; 58C4   02B8 0008

        JSR     R5,     L_D2CE                  ; 58C6   0004 01D0 02CE

        B       L_5937                          ; 58C9   0200 006C

        JSR     R5,     L_593A                  ; 58CB   0004 0158 013A

        SDBD                                    ; 58CE   0001
        MVII    #$FFFF, R0                      ; 58CF   02B8 00FF 00FF

        JSR     R5,     L_D2CE                  ; 58D2   0004 01D0 02CE

        B       L_5937                          ; 58D5   0200 0060

        JSR     R5,     L_593A                  ; 58D7   0004 0158 013A

        MVII    #$000C, R0                      ; 58DA   02B8 000C

        JSR     R5,     L_D2CE                  ; 58DC   0004 01D0 02CE

        B       L_5937                          ; 58DF   0200 0056

        JSR     R5,     L_593A                  ; 58E1   0004 0158 013A
        JSR     R5,     L_5C54                  ; 58E4   0004 015C 0054

        B       L_5937                          ; 58E7   0200 004E

        JSR     R5,     L_593A                  ; 58E9   0004 0158 013A
        JSR     R5,     L_5C5D                  ; 58EC   0004 015C 005D

        B       L_5937                          ; 58EF   0200 0046

        JSR     R5,     L_593A                  ; 58F1   0004 0158 013A
        JSR     R5,     L_5C66                  ; 58F4   0004 015C 0066

        B       L_5937                          ; 58F7   0200 003E

        JSR     R5,     L_593A                  ; 58F9   0004 0158 013A
        JSR     R5,     L_D37C                  ; 58FC   0004 01D0 037C

        B       L_5937                          ; 58FF   0200 0036

        JSR     R5,     L_593A                  ; 5901   0004 0158 013A
        JSR     R5,     L_5C6F                  ; 5904   0004 015C 006F

        B       L_5937                          ; 5907   0200 002E

        JSR     R5,     L_593A                  ; 5909   0004 0158 013A
        JSR     R5,     L_D36E                  ; 590C   0004 01D0 036E

        B       L_5937                          ; 590F   0200 0026

        JSR     R5,     L_593A                  ; 5911   0004 0158 013A

        MVI     G_0323, R0                      ; 5914   0280 0323
        TSTR    R0                              ; 5916   0080
        BEQ     L_5927                          ; 5917   0204 000E

        MVII    #$0001, R0                      ; 5919   02B8 0001
        MVO     R0,     G_0323                  ; 591B   0240 0323
        MVI     G_031D, R0                      ; 591D   0280 031D
        SDBD                                    ; 591F   0001
        ANDI    #$FFE8, R0                      ; 5920   03B8 00E8 00FF
        XORI    #$0006, R0                      ; 5923   03F8 0006
        MVO     R0,     G_031D                  ; 5925   0240 031D
L_5927:
        B       L_5937                          ; 5927   0200 000E

        JSR     R5,     L_593A                  ; 5929   0004 0158 013A

        MVII    #$01D0, R4                      ; 592C   02BC 01D0
        SDBD                                    ; 592E   0001
        MVI@    R4,     R0                      ; 592F   02A0
        MVO     R0,     G_01CC                  ; 5930   0240 01CC
        SWAP    R0,     1                       ; 5932   0040
        MVO     R0,     G_01CD                  ; 5933   0240 01CD
        B       L_5937                          ; 5935   0200 0000

L_5937:
        MVII    #$0001, R0                      ; 5937   02B8 0001
        PULR    R7                              ; 5939   02B7

L_593A:
        MVI     G_01CF, R0                      ; 593A   0280 01CF
        TSTR    R0                              ; 593C   0080
        BNEQ    L_5937                          ; 593D   022C 0007
        MOVR    R5,     R7                      ; 593F   00AF

        PSHR    R5                              ; 5940   0275
        PSHR    R2                              ; 5941   0272

        JSR     R5,     L_6FBE                  ; 5942   0004 016C 03BE

        PULR    R2                              ; 5945   02B2
        SLL     R2,     1                       ; 5946   004A
        ADDR    R2,     R7                      ; 5947   00D7
        B       L_5951                          ; 5948   0200 0007
        B       L_5951                          ; 594A   0200 0005
        B       L_5968                          ; 594C   0200 001A
        B       L_597B                          ; 594E   0200 002B
        PULR    R7                              ; 5950   02B7

L_5951:
        ADDI    #$0004, R1                      ; 5951   02F9 0004
        MVI@    R1,     R0                      ; 5953   0288
        MOVR    R0,     R2                      ; 5954   0082
L_5955:
        ANDI    #$00FF, R2                      ; 5955   03BA 00FF
        SDBD                                    ; 5957   0001
        ANDI    #$FF00, R0                      ; 5958   03B8 0000 00FF
        NEGR    R0                              ; 595B   0020
        SDBD                                    ; 595C   0001
        ANDI    #$FF00, R0                      ; 595D   03B8 0000 00FF
        ADDR    R0,     R2                      ; 5960   00C2
        MVO@    R2,     R1                      ; 5961   024A
        SUBI    #$0004, R1                      ; 5962   0339 0004
        MVI@    R1,     R0                      ; 5964   0288
        XORI    #$0200, R0                      ; 5965   03F8 0200
        MVO@    R0,     R1                      ; 5967   0248
L_5968:
        ADDI    #$0004, R1                      ; 5968   02F9 0004
        MVI@    R1,     R3                      ; 596A   028B
        SDBD                                    ; 596B   0001
        ANDI    #$FF00, R3                      ; 596C   03BB 0000 00FF
        MVII    #$000A, R0                      ; 596F   02B8 000A

        JSR     R5,     X_RAND2                 ; 5971   0004 0114 029E

        SUBI    #$0008, R0                      ; 5974   0338 0008
        ANDI    #$00FF, R0                      ; 5976   03B8 00FF
        ADDR    R3,     R0                      ; 5978   00D8
        MVO@    R0,     R1                      ; 5979   0248
        PULR    R7                              ; 597A   02B7

L_597B:
        ADDI    #$0004, R1                      ; 597B   02F9 0004
        MVI@    R1,     R3                      ; 597D   028B
        SDBD                                    ; 597E   0001
        ANDI    #$FF00, R3                      ; 597F   03BB 0000 00FF
        ADDI    #$0012, R3                      ; 5982   02FB 0012
        MVO@    R3,     R1                      ; 5984   024B
        PULR    R7                              ; 5985   02B7

        PSHR    R5                              ; 5986   0275

        JSR     R5,     L_D831                  ; 5987   0004 01D8 0031

        TSTR    R0                              ; 598A   0080
        BNEQ    L_59C0                          ; 598B   020C 0033

        MOVR    R1,     R2                      ; 598D   008A
        ADDI    #$0003, R2                      ; 598E   02FA 0003
        MVI@    R2,     R2                      ; 5990   0292
        SWAP    R2,     1                       ; 5991   0042
        ANDI    #$00FF, R2                      ; 5992   03BA 00FF
        CMPI    #$0018, R2                      ; 5994   037A 0018
        BGT     L_59C0                          ; 5996   020E 0028

        CMPI    #$0014, R2                      ; 5998   037A 0014
        BLT     L_59C0                          ; 599A   0205 0024

        MOVR    R1,     R2                      ; 599C   008A
        ADDI    #$0002, R2                      ; 599D   02FA 0002
        MVI@    R2,     R2                      ; 599F   0292
        SWAP    R2,     1                       ; 59A0   0042
        ANDI    #$00FF, R2                      ; 59A1   03BA 00FF
        SUBI    #$0005, R2                      ; 59A3   033A 0005
        SLR     R2,     2                       ; 59A5   0066
        SLR     R2,     1                       ; 59A6   0062
        MOVR    R2,     R3                      ; 59A7   0093
        ADDI    #$0228, R2                      ; 59A8   02FA 0228
        MVI@    R2,     R0                      ; 59AA   0290
        ANDI    #$01F8, R0                      ; 59AB   03B8 01F8
        TSTR    R0                              ; 59AD   0080
        BEQ     L_59C0                          ; 59AE   0204 0010

        CMPI    #$0130, R0                      ; 59B0   0378 0130
        BEQ     L_59D3                          ; 59B2   0204 001F

        CMPI    #$0128, R0                      ; 59B4   0378 0128
        BEQ     L_59C1                          ; 59B6   0204 0009

        CMPI    #$0110, R0                      ; 59B8   0378 0110
        BEQ     L_59C1                          ; 59BA   0204 0005

        CMPI    #$0148, R0                      ; 59BC   0378 0148
        BEQ     L_59CF                          ; 59BE   0204 000F
L_59C0:
        PULR    R7                              ; 59C0   02B7

L_59C1:
        MVI     G_0324, R0                      ; 59C1   0280 0324
        SDBD                                    ; 59C3   0001
        ADDI    #$0948, R0                      ; 59C4   02F8 0048 0009
L_59C7:
        MVO@    R0,     R2                      ; 59C7   0250
        PSHR    R1                              ; 59C8   0271

        JSR     R5,     L_5A78                  ; 59C9   0004 0158 0278

        PULR    R1                              ; 59CC   02B1
        B       L_59D3                          ; 59CD   0200 0004

L_59CF:
        MVI     G_0324, R0                      ; 59CF   0280 0324
        B       L_59C7                          ; 59D1   0220 000B

L_59D3:
        ADDI    #$0004, R1                      ; 59D3   02F9 0004
        MVI@    R1,     R0                      ; 59D5   0288
        MOVR    R0,     R2                      ; 59D6   0082
        SDBD                                    ; 59D7   0001
        ANDI    #$FF00, R2                      ; 59D8   03BA 0000 00FF
        MVII    #$0010, R0                      ; 59DB   02B8 0010
        ADDR    R2,     R0                      ; 59DD   00D0
        MVO@    R0,     R1                      ; 59DE   0248
        B       L_59C0                          ; 59DF   0220 0020

        PSHR    R5                              ; 59E1   0275

        JSR     R5,     L_D819                  ; 59E2   0004 01D8 0019

        BEQ     L_5A25                          ; 59E5   0204 003E

        JSR     R5,     L_D831                  ; 59E7   0004 01D8 0031

        TSTR    R0                              ; 59EA   0080
        BNEQ    L_5A25                          ; 59EB   020C 0038

        MVI     G_032E, R0                      ; 59ED   0280 032E
        SDBD                                    ; 59EF   0001
        CMPI    #$D8EC, R0                      ; 59F0   0378 00EC 00D8
        BEQ     L_5A25                          ; 59F3   0204 0030

        SDBD                                    ; 59F5   0001
        CMPI    #$D900, R0                      ; 59F6   0378 0000 00D9
        BEQ     L_5A25                          ; 59F9   0204 002A

        MVII    #$01DC, R5                      ; 59FB   02BD 01DC
        SDBD                                    ; 59FD   0001
        MVI@    R5,     R0                      ; 59FE   02A8
        CMPI    #$0003, R0                      ; 59FF   0378 0003
        BLT     L_5A25                          ; 5A01   0205 0022

        JSR     R5,     L_5A78                  ; 5A03   0004 0158 0278

        SUBI    #$0005, R1                      ; 5A06   0339 0005
        MVI@    R1,     R0                      ; 5A08   0288
        SDBD                                    ; 5A09   0001
        ANDI    #$FFE8, R0                      ; 5A0A   03B8 00E8 00FF
        XORI    #$0006, R0                      ; 5A0D   03F8 0006
        MVO@    R0,     R1                      ; 5A0F   0248
        MVI     G_032C, R0                      ; 5A10   0280 032C
        SUBI    #$0005, R0                      ; 5A12   0338 0005
        MVO     R0,     G_032C                  ; 5A14   0240 032C

        JSR     R5,     L_D159                  ; 5A16   0004 01D0 0159
        JSR     R5,     L_5B4C                  ; 5A19   0004 0158 034C
        JSR     R5,     L_D837                  ; 5A1C   0004 01D8 0037

        TSTR    R0                              ; 5A1F   0080
        BNEQ    L_5A26                          ; 5A20   020C 0004

        JSR     R5,     L_5A90                  ; 5A22   0004 0158 0290

L_5A25:
        PULR    R7                              ; 5A25   02B7

L_5A26:
        NOP                                     ; 5A26   0034

        JSR     R5,     L_5A78                  ; 5A27   0004 0158 0278

        SUBI    #$0005, R1                      ; 5A2A   0339 0005
        MVI@    R1,     R0                      ; 5A2C   0288
        SDBD                                    ; 5A2D   0001
        ANDI    #$FFE8, R0                      ; 5A2E   03B8 00E8 00FF
        XORI    #$0006, R0                      ; 5A31   03F8 0006
        MVO@    R0,     R1                      ; 5A33   0248
        J       L_D413                          ; 5A34   0004 03D4 0013
        PULR    R7                              ; 5A37   02B7

        PSHR    R5                              ; 5A38   0275
        MVI@    R1,     R0                      ; 5A39   0288
        SDBD                                    ; 5A3A   0001
        ANDI    #$FFF7, R0                      ; 5A3B   03B8 00F7 00FF
        MVO@    R0,     R1                      ; 5A3E   0248
        CLRR    R0                              ; 5A3F   01C0
        ADDI    #$0004, R1                      ; 5A40   02F9 0004
        MVO@    R0,     R1                      ; 5A42   0248
        DECR    R1                              ; 5A43   0011
        MVII    #$0038, R0                      ; 5A44   02B8 0038
        SWAP    R0,     1                       ; 5A46   0040
        MVO@    R0,     R1                      ; 5A47   0248
        ADDI    #$0003, R1                      ; 5A48   02F9 0003
        MVII    #$000F, R0                      ; 5A4A   02B8 000F
        MVO@    R0,     R1                      ; 5A4C   0248
        PULR    R7                              ; 5A4D   02B7

        PSHR    R5                              ; 5A4E   0275
        MVI@    R1,     R0                      ; 5A4F   0288
        SDBD                                    ; 5A50   0001
        ANDI    #$FFE0, R0                      ; 5A51   03B8 00E0 00FF
        MVO@    R0,     R1                      ; 5A54   0248
        SDBD                                    ; 5A55   0001
        MVII    #$D947, R0                      ; 5A56   02B8 0047 00D9
        INCR    R1                              ; 5A59   0009
        MVO@    R0,     R1                      ; 5A5A   0248
        MVII    #$005C, R0                      ; 5A5B   02B8 005C

        JSR     R5,     X_RAND2                 ; 5A5D   0004 0114 029E

        ADDI    #$001E, R0                      ; 5A60   02F8 001E
        ANDI    #$00FF, R0                      ; 5A62   03B8 00FF
        SWAP    R0,     1                       ; 5A64   0040
        PSHR    R0                              ; 5A65   0270
        MVII    #$0007, R0                      ; 5A66   02B8 0007

        JSR     R5,     X_RAND2                 ; 5A68   0004 0114 029E

        INCR    R0                              ; 5A6B   0008
        NEGR    R0                              ; 5A6C   0020
        ANDI    #$00FF, R0                      ; 5A6D   03B8 00FF
        ADD@    R6,     R0                      ; 5A6F   02F0
        ADDI    #$0003, R1                      ; 5A70   02F9 0003
        MVO@    R0,     R1                      ; 5A72   0248
        INCR    R1                              ; 5A73   0009
        MVII    #$0120, R0                      ; 5A74   02B8 0120
        MVO@    R0,     R1                      ; 5A76   0248
        PULR    R7                              ; 5A77   02B7

L_5A78:
        PSHR    R5                              ; 5A78   0275
        MVI@    R1,     R0                      ; 5A79   0288
        SDBD                                    ; 5A7A   0001
        ANDI    #$FFE0, R0                      ; 5A7B   03B8 00E0 00FF
        XORI    #$001E, R0                      ; 5A7E   03F8 001E
        MVO@    R0,     R1                      ; 5A80   0248
        SDBD                                    ; 5A81   0001
        MVII    #$D952, R0                      ; 5A82   02B8 0052 00D9
        INCR    R1                              ; 5A85   0009
        MVO@    R0,     R1                      ; 5A86   0248
        ADDI    #$0003, R1                      ; 5A87   02F9 0003
        MVII    #$0005, R0                      ; 5A89   02B8 0005
        MVO@    R0,     R1                      ; 5A8B   0248
        CLRR    R0                              ; 5A8C   01C0
        INCR    R1                              ; 5A8D   0009
        MVO@    R0,     R1                      ; 5A8E   0248
        PULR    R7                              ; 5A8F   02B7

L_5A90:
        PSHR    R5                              ; 5A90   0275
        MVI     G_032D, R0                      ; 5A91   0280 032D
        SDBD                                    ; 5A93   0001
        ANDI    #$FFE0, R0                      ; 5A94   03B8 00E0 00FF
        XORI    #$000F, R0                      ; 5A97   03F8 000F
        MVO     R0,     G_032D                  ; 5A99   0240 032D
        SDBD                                    ; 5A9B   0001
        MVII    #$D914, R0                      ; 5A9C   02B8 0014 00D9
        MVO     R0,     G_032E                  ; 5A9F   0240 032E
        MVII    #$000A, R0                      ; 5AA1   02B8 000A
        MVO     R0,     G_0333                  ; 5AA3   0240 0333
        CLRR    R0                              ; 5AA5   01C0
        MVO     R0,     G_0332                  ; 5AA6   0240 0332
        MVO     R0,     G_0331                  ; 5AA8   0240 0331
        PULR    R7                              ; 5AAA   02B7

        PSHR    R5                              ; 5AAB   0275
        SDBD                                    ; 5AAC   0001
        MVII    #$D91F, R0                      ; 5AAD   02B8 001F 00D9
        MVO     R0,     G_032E                  ; 5AB0   0240 032E
        MVII    #$000A, R0                      ; 5AB2   02B8 000A
        MVO     R0,     G_0333                  ; 5AB4   0240 0333
        PULR    R7                              ; 5AB6   02B7

        PSHR    R5                              ; 5AB7   0275
        SDBD                                    ; 5AB8   0001
        MVII    #$D92A, R0                      ; 5AB9   02B8 002A 00D9
        MVO     R0,     G_032E                  ; 5ABC   0240 032E
        MVII    #$0028, R0                      ; 5ABE   02B8 0028
        MVO     R0,     G_0333                  ; 5AC0   0240 0333
        PULR    R7                              ; 5AC2   02B7

        PSHR    R5                              ; 5AC3   0275

        JSR     R5,     L_5C6F                  ; 5AC4   0004 015C 006F

        MVI     G_032D, R0                      ; 5AC7   0280 032D
        SDBD                                    ; 5AC9   0001
        ANDI    #$FFE0, R0                      ; 5ACA   03B8 00E0 00FF
        XORI    #$0006, R0                      ; 5ACD   03F8 0006
        MVO     R0,     G_032D                  ; 5ACF   0240 032D

        JSR     R5,     L_D813                  ; 5AD1   0004 01D8 0013

        BEQ     L_5ADD                          ; 5AD4   0204 0007

        SDBD                                    ; 5AD6   0001
        MVII    #$D8E3, R0                      ; 5AD7   02B8 00E3 00D8
        MVO     R0,     G_032E                  ; 5ADA   0240 032E
        PULR    R7                              ; 5ADC   02B7

L_5ADD:
        SDBD                                    ; 5ADD   0001
        MVII    #$D909, R0                      ; 5ADE   02B8 0009 00D9
        MVO     R0,     G_032E                  ; 5AE1   0240 032E
        PULR    R7                              ; 5AE3   02B7

        PSHR    R5                              ; 5AE4   0275
        MVI     G_01C9, R0                      ; 5AE5   0280 01C9
        TSTR    R0                              ; 5AE7   0080
        BNEQ    L_5AF3                          ; 5AE8   020C 0009

        JSR     R5,     L_6FA3                  ; 5AEA   0004 016C 03A3
        JSR     R5,     L_D159                  ; 5AED   0004 01D0 0159
        JSR     R5,     L_DECA                  ; 5AF0   0004 01DC 02CA

L_5AF3:
        PULR    R7                              ; 5AF3   02B7

L_5AF4:
        PSHR    R5                              ; 5AF4   0275

        JSR     R5,     L_D81F                  ; 5AF5   0004 01D8 001F

        BNEQ    L_5B4B                          ; 5AF8   020C 0051

        MVI     G_0325, R0                      ; 5AFA   0280 0325
        SDBD                                    ; 5AFC   0001
        ANDI    #$1000, R0                      ; 5AFD   03B8 0000 0010
        TSTR    R0                              ; 5B00   0080
        BNEQ    L_5B4B                          ; 5B01   020C 0048

        MVI     G_032D, R0                      ; 5B03   0280 032D
        ANDI    #$0008, R0                      ; 5B05   03B8 0008
        TSTR    R0                              ; 5B07   0080
        BNEQ    L_5B4B                          ; 5B08   020C 0041

        MVI     G_032F, R0                      ; 5B0A   0280 032F
        SDBD                                    ; 5B0C   0001
        CMPI    #$4B00, R0                      ; 5B0D   0378 0000 004B
        BLT     L_5B4B                          ; 5B10   0205 0039

        SDBD                                    ; 5B12   0001
        CMPI    #$5700, R0                      ; 5B13   0378 0000 0057
        BGT     L_5B4B                          ; 5B16   020E 0033

        JSR     R5,     L_D7F5                  ; 5B18   0004 01D4 03F5

        MVI     G_031D, R0                      ; 5B1B   0280 031D
        SDBD                                    ; 5B1D   0001
        ANDI    #$EFFF, R0                      ; 5B1E   03B8 00FF 00EF
        SDBD                                    ; 5B21   0001
        XORI    #$1000, R0                      ; 5B22   03F8 0000 0010
        MVO     R0,     G_031D                  ; 5B25   0240 031D
        MVI     G_0325, R0                      ; 5B27   0280 0325
        SDBD                                    ; 5B29   0001
        ANDI    #$E7FF, R0                      ; 5B2A   03B8 00FF 00E7
        SDBD                                    ; 5B2D   0001
        XORI    #$1800, R0                      ; 5B2E   03F8 0000 0018
        MVO     R0,     G_0325                  ; 5B31   0240 0325
        MVII    #$0078, R0                      ; 5B33   02B8 0078
        MVO     R0,     G_0323                  ; 5B35   0240 0323
        CLRR    R0                              ; 5B37   01C0
        MVO     R0,     G_01C9                  ; 5B38   0240 01C9

        JSR     R5,     L_6F9A                  ; 5B3A   0004 016C 039A

        MVI     G_032E, R0                      ; 5B3D   0280 032E
        SDBD                                    ; 5B3F   0001
        CMPI    #$D8E3, R0                      ; 5B40   0378 00E3 00D8
        BNEQ    L_5B4B                          ; 5B43   020C 0006

        SDBD                                    ; 5B45   0001
        MVII    #$D8F7, R0                      ; 5B46   02B8 00F7 00D8
        MVO     R0,     G_032E                  ; 5B49   0240 032E
L_5B4B:
        PULR    R7                              ; 5B4B   02B7

L_5B4C:
        PSHR    R5                              ; 5B4C   0275

        JSR     R5,     L_D81F                  ; 5B4D   0004 01D8 001F

        BNEQ    L_5B8D                          ; 5B50   020C 003B

        MVI     G_031D, R0                      ; 5B52   0280 031D
        SDBD                                    ; 5B54   0001
        ANDI    #$1000, R0                      ; 5B55   03B8 0000 0010
        BEQ     L_5B8D                          ; 5B58   0204 0033

        MVII    #$000C, R1                      ; 5B5A   02B9 000C
        MVII    #$0001, R0                      ; 5B5C   02B8 0001

        JSR     R5,     .EXEC.629               ; 5B5E   0004 0114 0229

        MVO     R0,     G_0321                  ; 5B61   0240 0321

        JSR     R5,     L_D7FD                  ; 5B63   0004 01D4 03FD
        JSR     R5,     L_6FB2                  ; 5B66   0004 016C 03B2

        MVII    #$0014, R0                      ; 5B69   02B8 0014
        SWAP    R0,     1                       ; 5B6B   0040
        MVI     G_032D, R1                      ; 5B6C   0281 032D
        ANDI    #$0200, R1                      ; 5B6E   03B9 0200
        TSTR    R1                              ; 5B70   0089
        BEQ     L_5B74                          ; 5B71   0204 0001

        COMR    R0                              ; 5B73   0018
L_5B74:
        MVI     G_0321, R1                      ; 5B74   0281 0321
        ANDI    #$00FF, R1                      ; 5B76   03B9 00FF
        SDBD                                    ; 5B78   0001
        ANDI    #$FF00, R0                      ; 5B79   03B8 0000 00FF
        ADDR    R1,     R0                      ; 5B7C   00C8
        MVO     R0,     G_0321                  ; 5B7D   0240 0321
        MVI     G_032E, R0                      ; 5B7F   0280 032E
        SDBD                                    ; 5B81   0001
        CMPI    #$D8F7, R0                      ; 5B82   0378 00F7 00D8
        BNEQ    L_5B8D                          ; 5B85   020C 0006

        SDBD                                    ; 5B87   0001
        MVII    #$D8E3, R0                      ; 5B88   02B8 00E3 00D8
        MVO     R0,     G_032E                  ; 5B8B   0240 032E
L_5B8D:
        PULR    R7                              ; 5B8D   02B7

        PSHR    R5                              ; 5B8E   0275
        MVI     G_0320, R0                      ; 5B8F   0280 0320
        SWAP    R0,     1                       ; 5B91   0040
        ANDI    #$00FF, R0                      ; 5B92   03B8 00FF
        CMPI    #$0014, R0                      ; 5B94   0378 0014
        BMI     L_5BC9                          ; 5B96   020B 0031

        CMPI    #$0018, R0                      ; 5B98   0378 0018
        BGT     L_5BC9                          ; 5B9A   020E 002D

        MVI     G_031E, R0                      ; 5B9C   0280 031E
        SDBD                                    ; 5B9E   0001
        CMPI    #$D8BE, R0                      ; 5B9F   0378 00BE 00D8
        BNEQ    L_5BC9                          ; 5BA2   020C 0025

        MVI     G_031D, R0                      ; 5BA4   0280 031D
        SDBD                                    ; 5BA6   0001
        ANDI    #$1000, R0                      ; 5BA7   03B8 0000 0010
        BEQ     L_5BC9                          ; 5BAA   0204 001D

        MVI     G_031F, R0                      ; 5BAC   0280 031F
        SWAP    R0,     1                       ; 5BAE   0040
        ANDI    #$00FF, R0                      ; 5BAF   03B8 00FF
        SUBI    #$0005, R0                      ; 5BB1   0338 0005
        SLR     R0,     2                       ; 5BB3   0064
        SLR     R0,     1                       ; 5BB4   0060
        MVII    #$0228, R3                      ; 5BB5   02BB 0228
        ADDR    R0,     R3                      ; 5BB7   00C3
        MVI@    R3,     R0                      ; 5BB8   0298
        ANDI    #$01F8, R0                      ; 5BB9   03B8 01F8
        CMPI    #$0130, R0                      ; 5BBB   0378 0130
        BNEQ    L_5BC9                          ; 5BBD   020C 000A

        JSR     R5,     L_6FA3                  ; 5BBF   0004 016C 03A3

        MVII    #$0001, R0                      ; 5BC2   02B8 0001
        MVO     R0,     G_01DF                  ; 5BC4   0240 01DF

        JSR     R5,     L_DECA                  ; 5BC6   0004 01DC 02CA

L_5BC9:
        PULR    R7                              ; 5BC9   02B7

        PSHR    R5                              ; 5BCA   0275
        MVI     G_0325, R0                      ; 5BCB   0280 0325
        SDBD                                    ; 5BCD   0001
        ANDI    #$1000, R0                      ; 5BCE   03B8 0000 0010
        TSTR    R0                              ; 5BD1   0080
        BEQ     L_5BEC                          ; 5BD2   0204 0018

        PSHR    R3                              ; 5BD4   0273
        MVI     G_01C9, R0                      ; 5BD5   0280 01C9
        TSTR    R0                              ; 5BD7   0080
        BNEQ    L_5BDD                          ; 5BD8   020C 0003

        JSR     R5,     L_6FA3                  ; 5BDA   0004 016C 03A3

L_5BDD:
        PULR    R3                              ; 5BDD   02B3

        JSR     R5,     L_5BED                  ; 5BDE   0004 0158 03ED

        MVI     G_032C, R0                      ; 5BE1   0280 032C
        INCR    R0                              ; 5BE3   0008
        MVO     R0,     G_032C                  ; 5BE4   0240 032C

        JSR     R5,     L_D159                  ; 5BE6   0004 01D0 0159
        JSR     R5,     L_DECA                  ; 5BE9   0004 01DC 02CA

L_5BEC:
        PULR    R7                              ; 5BEC   02B7

L_5BED:
        PSHR    R5                              ; 5BED   0275
        MOVR    R3,     R0                      ; 5BEE   0098

        JSR     R5,     .EXEC.76C               ; 5BEF   0004 0114 036C

        MVI@    R1,     R0                      ; 5BF2   0288
        SDBD                                    ; 5BF3   0001
        ANDI    #$EFFF, R0                      ; 5BF4   03B8 00FF 00EF
        MVO@    R0,     R1                      ; 5BF7   0248
        CLRR    R0                              ; 5BF8   01C0
        ADDI    #$0002, R1                      ; 5BF9   02F9 0002
        MVO@    R0,     R1                      ; 5BFB   0248
        INCR    R1                              ; 5BFC   0009
        MVO@    R0,     R1                      ; 5BFD   0248
        INCR    R1                              ; 5BFE   0009
        MVO@    R0,     R1                      ; 5BFF   0248
        MOVR    R3,     R1                      ; 5C00   0099
        SUBI    #$0003, R1                      ; 5C01   0339 0003
        ADDI    #$01D4, R1                      ; 5C03   02F9 01D4
        MVO@    R0,     R1                      ; 5C05   0248
        MVI     G_032C, R0                      ; 5C06   0280 032C
        ADDI    #$0005, R0                      ; 5C08   02F8 0005
        MVO     R0,     G_032C                  ; 5C0A   0240 032C

        JSR     R5,     L_D159                  ; 5C0C   0004 01D0 0159

        PULR    R7                              ; 5C0F   02B7

        PSHR    R5                              ; 5C10   0275
        MVI     G_031D, R0                      ; 5C11   0280 031D
        ANDI    #$0017, R0                      ; 5C13   03B8 0017
        CMPI    #$0015, R0                      ; 5C15   0378 0015
        BEQ     L_5C25                          ; 5C17   0204 000C

        MVI     G_01C9, R0                      ; 5C19   0280 01C9
        TSTR    R0                              ; 5C1B   0080
        BNEQ    L_5C21                          ; 5C1C   020C 0003

        JSR     R5,     L_6FA3                  ; 5C1E   0004 016C 03A3
L_5C21:
        JSR     R5,     L_DECA                  ; 5C21   0004 01DC 02CA

        PULR    R7                              ; 5C24   02B7

L_5C25:
        MVII    #$0028, R0                      ; 5C25   02B8 0028
        MVO     R0,     G_0323                  ; 5C27   0240 0323
        MVI     G_031D, R0                      ; 5C29   0280 031D
        SDBD                                    ; 5C2B   0001
        ANDI    #$FFE8, R0                      ; 5C2C   03B8 00E8 00FF
        XORI    #$0006, R0                      ; 5C2F   03F8 0006
        MVO     R0,     G_031D                  ; 5C31   0240 031D
        PULR    R7                              ; 5C33   02B7

L_5C34:
        PSHR    R5                              ; 5C34   0275

        JSR     R5,     L_D80D                  ; 5C35   0004 01D8 000D

        BNEQ    L_5C53                          ; 5C38   020C 0019

        CLRR    R0                              ; 5C3A   01C0
        MVO     R0,     G_0332                  ; 5C3B   0240 0332
        SDBD                                    ; 5C3D   0001
        MVII    #$D909, R0                      ; 5C3E   02B8 0009 00D9
        MVO     R0,     G_032E                  ; 5C41   0240 032E
        MVII    #$01C7, R4                      ; 5C43   02BC 01C7
        SDBD                                    ; 5C45   0001
        MVI@    R4,     R0                      ; 5C46   02A0
        SDBD                                    ; 5C47   0001
        ANDI    #$FF00, R0                      ; 5C48   03B8 0000 00FF
        MVI     G_01D3, R1                      ; 5C4B   0281 01D3
        XORR    R1,     R0                      ; 5C4D   01C8
        MVO     R0,     G_0331                  ; 5C4E   0240 0331

        JSR     R5,     L_D7E5                  ; 5C50   0004 01D4 03E5

L_5C53:
        PULR    R7                              ; 5C53   02B7

L_5C54:
        PSHR    R5                              ; 5C54   0275
        MVII    #$00FB, R0                      ; 5C55   02B8 00FB
        MVO     R0,     G_01D3                  ; 5C57   0240 01D3

        JSR     R5,     L_D192                  ; 5C59   0004 01D0 0192

        PULR    R7                              ; 5C5C   02B7

L_5C5D:
        PSHR    R5                              ; 5C5D   0275
        MVII    #$00F5, R0                      ; 5C5E   02B8 00F5
        MVO     R0,     G_01D3                  ; 5C60   0240 01D3

        JSR     R5,     L_D192                  ; 5C62   0004 01D0 0192

        PULR    R7                              ; 5C65   02B7

L_5C66:
        PSHR    R5                              ; 5C66   0275
        MVII    #$00F0, R0                      ; 5C67   02B8 00F0
        MVO     R0,     G_01D3                  ; 5C69   0240 01D3

        JSR     R5,     L_D192                  ; 5C6B   0004 01D0 0192

        PULR    R7                              ; 5C6E   02B7

L_5C6F:
        PSHR    R5                              ; 5C6F   0275
        PSHR    R0                              ; 5C70   0270
        CLRR    R0                              ; 5C71   01C0
        MVO     R0,     G_01C7                  ; 5C72   0240 01C7
        MVO     R0,     G_01C8                  ; 5C74   0240 01C8

        JSR     R5,     L_D192                  ; 5C76   0004 01D0 0192

        PULR    R0                              ; 5C79   02B0
        PULR    R7                              ; 5C7A   02B7

        PSHR    R5                              ; 5C7B   0275
        MVI     G_0330, R0                      ; 5C7C   0280 0330
        SWAP    R0,     1                       ; 5C7E   0040
        ANDI    #$00FF, R0                      ; 5C7F   03B8 00FF
        CMPI    #$0011, R0                      ; 5C81   0378 0011
        BMI     L_5CBF                          ; 5C83   020B 003A

        CMPI    #$0015, R0                      ; 5C85   0378 0015
        BPL     L_5CBF                          ; 5C87   0203 0036

        CLRR    R0                              ; 5C89   01C0
        MVO     R0,     G_0331                  ; 5C8A   0240 0331

        JSR     R5,     L_D7DD                  ; 5C8C   0004 01D4 03DD

        MVII    #$0010, R0                      ; 5C8F   02B8 0010
        SWAP    R0,     1                       ; 5C91   0040
        MVO     R0,     G_0330                  ; 5C92   0240 0330
        SDBD                                    ; 5C94   0001
        MVII    #$D0DF, R0                      ; 5C95   02B8 00DF 00D0
        MVO     R0,     G_035D                  ; 5C98   0240 035D
        MVI     G_032D, R0                      ; 5C9A   0280 032D
        ANDI    #$0008, R0                      ; 5C9C   03B8 0008
        TSTR    R0                              ; 5C9E   0080
        BNEQ    L_5CBF                          ; 5C9F   020C 001E

        SDBD                                    ; 5CA1   0001
        MVII    #$D8E3, R0                      ; 5CA2   02B8 00E3 00D8
        MVO     R0,     G_032E                  ; 5CA5   0240 032E
        MVII    #$000A, R0                      ; 5CA7   02B8 000A
        MVO     R0,     G_0333                  ; 5CA9   0240 0333

        JSR     R5,     L_D81F                  ; 5CAB   0004 01D8 001F

        BNEQ    L_5CBF                          ; 5CAE   020C 000F

        MVI     G_031D, R0                      ; 5CB0   0280 031D
        SDBD                                    ; 5CB2   0001
        ANDI    #$1000, R0                      ; 5CB3   03B8 0000 0010
        TSTR    R0                              ; 5CB6   0080
        BEQ     L_5CBF                          ; 5CB7   0204 0006

        SDBD                                    ; 5CB9   0001
        MVII    #$D8F7, R0                      ; 5CBA   02B8 00F7 00D8
        MVO     R0,     G_032E                  ; 5CBD   0240 032E
L_5CBF:
        PULR    R7                              ; 5CBF   02B7

        DECLE   $0040,  $0018,  $0040,  $005D   ; 5CC0   0040 0018 0040 005D
        DECLE   $0000,  $007F,  $0000,  $0053   ; 5CC4   0000 007F 0000 0053
        DECLE   $0000,  $0000,  $0010,  $0002   ; 5CC8   0000 0000 0010 0002
        DECLE   $0000,  $0000,  $0001,  $0000   ; 5CCC   0000 0000 0001 0000
        DECLE   $0040,  $0018,  $0040,  $005D   ; 5CD0   0040 0018 0040 005D
        DECLE   $0000,  $007F,  $0000,  $0053   ; 5CD4   0000 007F 0000 0053
        DECLE   $0000,  $0000,  $0010,  $0002   ; 5CD8   0000 0000 0010 0002
        DECLE   $0000,  $0000,  $0002,  $0000   ; 5CDC   0000 0000 0002 0000
        DECLE   $0040,  $0018,  $0040,  $005D   ; 5CE0   0040 0018 0040 005D
        DECLE   $0000,  $007F,  $0000,  $0053   ; 5CE4   0000 007F 0000 0053
        DECLE   $0000,  $0000,  $0010,  $0002   ; 5CE8   0000 0000 0010 0002
        DECLE   $0000,  $0000,  $0003,  $0000   ; 5CEC   0000 0000 0003 0000
        DECLE   $0040,  $0018,  $004B,  $005D   ; 5CF0   0040 0018 004B 005D
        DECLE   $0000,  $0057,  $0000,  $003F   ; 5CF4   0000 0057 0000 003F
        DECLE   $0000,  $0000,  $0010,  $0002   ; 5CF8   0000 0000 0010 0002
        DECLE   $0000,  $0000,  $0004,  $0000   ; 5CFC   0000 0000 0004 0000
        DECLE   $0040,  $0018,  $004B,  $005D   ; 5D00   0040 0018 004B 005D
        DECLE   $0000,  $0043,  $0000,  $0053   ; 5D04   0000 0043 0000 0053
        DECLE   $0000,  $0000,  $0010,  $0002   ; 5D08   0000 0000 0010 0002
        DECLE   $0000,  $0000,  $0005,  $0000   ; 5D0C   0000 0000 0005 0000
        DECLE   $00CF,  $0038,  $005D,  $005D   ; 5D10   00CF 0038 005D 005D
        DECLE   $0000,  $0064,  $0000,  $004F   ; 5D14   0000 0064 0000 004F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D1C   0000 0000 0000 0000
        DECLE   $0055,  $0018,  $0064,  $005D   ; 5D20   0055 0018 0064 005D
        DECLE   $0000,  $0068,  $0000,  $004E   ; 5D24   0000 0068 0000 004E
        DECLE   $0000,  $0004,  $0000,  $0000   ; 5D28   0000 0004 0000 0000
        DECLE   $0000,  $0000                   ; 5D2C   0000 0000

        MOVR    R0,     R5                      ; 5D2E   0085
        SWAP    R0,     1                       ; 5D2F   0040
        ADDR    R1,     R7                      ; 5D30   00CF

        DECLE   $0018,  $0056,  $005D,  $0000   ; 5D31   0018 0056 005D 0000
        DECLE   $0068,  $0000,  $0055,  $0007   ; 5D35   0068 0000 0055 0007
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D39   0000 0000 0000 0000
        DECLE   $0000,  $00CD,  $0047,  $03DF   ; 5D3D   0000 00CD 0047 03DF

        RLC     R1,     2                       ; 5D41   0055
        ADDR    R1,     R2                      ; 5D42   00CA
        RLC     R2,     2                       ; 5D43   0056
        CLRC                                    ; 5D44   0006
        COMR    R4                              ; 5D45   001C

        JSR     R5,     L_5955                  ; 5D46   0004 0158 0155
        DECLE   $03D9,  $0054,  $03DF           ; 5D49   03D9 0054 03DF

        RLC     R1,     2                       ; 5D4C   0055
        ADDR    R1,     R2                      ; 5D4D   00CA
        RLC     R2,     2                       ; 5D4E   0056
        INCR    R0                              ; 5D4F   0008
        ADCR    R0                              ; 5D50   0028

        JSR     R5,     L_5955                  ; 5D51   0004 0158 0155
        DECLE   $03D9,  $0054,  $0300,  $0000   ; 5D54   03D9 0054 0300 0000
        DECLE   $0000,  $0000                   ; 5D58   0000 0000

        JSR     R4,     .EXEC.400               ; 5D5A   0004 0014 0000
        DECLE   $0300,  $0000,  $0000,  $0000   ; 5D5D   0300 0000 0000 0000
        DECLE   $0008,  $0000,  $0000,  $0300   ; 5D61   0008 0000 0000 0300
        DECLE   $0000,  $000A,  $0055,  $0002   ; 5D65   0000 000A 0055 0002
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5D69   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0010   ; 5D71   0000 0000 0010 0010
        DECLE   $0010,  $0008,  $0008,  $0008   ; 5D75   0010 0008 0008 0008
        DECLE   $0008,  $0000,  $0000,  $0000   ; 5D79   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0030   ; 5D81   0000 0000 0010 0030
        DECLE   $0020,  $0038,  $0004,  $0000   ; 5D85   0020 0038 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D8D   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $001E,  $0018   ; 5D91   0000 0001 001E 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0002   ; 5D9D   0000 0000 0001 0002
        DECLE   $0004,  $0008,  $0018,  $0010   ; 5DA1   0004 0008 0018 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DA9   0000 0000 0000 0000
        DECLE   $0008,  $0010,  $0020,  $0020   ; 5DAD   0008 0010 0020 0020
        DECLE   $0020,  $0030,  $0010,  $0010   ; 5DB1   0020 0030 0010 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0040   ; 5DBD   0000 0000 0080 0040
        DECLE   $0040,  $0020,  $0010,  $0010   ; 5DC1   0040 0020 0010 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0070   ; 5DD1   0000 0000 0010 0070
        DECLE   $0080,  $0000,  $0000,  $0000   ; 5DD5   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0030   ; 5DE1   0000 0000 0010 0030
        DECLE   $0020,  $0040,  $0040,  $0000   ; 5DE5   0020 0040 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $001C,  $0038   ; 5DF1   0000 0000 001C 0038
        DECLE   $003C,  $0038,  $0018,  $0000   ; 5DF5   003C 0038 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0014   ; 5DF9   0000 0000 0000 0014
        DECLE   $0041,  $0014,  $0000,  $0000   ; 5DFD   0041 0014 0000 0000
        DECLE   $0000,  $0000,  $000C,  $001E   ; 5E01   0000 0000 000C 001E
        DECLE   $001C,  $001C,  $001A,  $0000   ; 5E05   001C 001C 001A 0000
        DECLE   $0000,  $0000,  $0038,  $0078   ; 5E09   0000 0000 0038 0078
        DECLE   $00FC,  $00FC,  $007C,  $0078   ; 5E0D   00FC 00FC 007C 0078
        DECLE   $0078,  $003C,  $003E,  $003F   ; 5E11   0078 003C 003E 003F
        DECLE   $0036,  $0076,  $0066,  $00EC   ; 5E15   0036 0076 0066 00EC
        DECLE   $00DC,  $006E,  $0038,  $0078   ; 5E19   00DC 006E 0038 0078
        DECLE   $007C,  $007C,  $007E,  $0078   ; 5E1D   007C 007C 007E 0078
        DECLE   $0078,  $003C,  $003E,  $0037   ; 5E21   0078 003C 003E 0037
        DECLE   $003F,  $007C,  $0070,  $0070   ; 5E25   003F 007C 0070 0070
        DECLE   $0030,  $0038,  $0038,  $0078   ; 5E29   0030 0038 0038 0078
        DECLE   $00FC,  $00FC,  $007C,  $0078   ; 5E2D   00FC 00FC 007C 0078
        DECLE   $007C,  $007C,  $003E,  $0037   ; 5E31   007C 007C 003E 0037

        RRC     R3,     1                       ; 5E35   0073
        SLR     R2,     2                       ; 5E36   0066
        SLR     R2,     2                       ; 5E37   0066
        ADDR    R0,     R6                      ; 5E38   00C6
        ADDR    R0,     R6                      ; 5E39   00C6
        ADDR    R4,     R7                      ; 5E3A   00E7

        DECLE   $0038,  $0078,  $007C,  $007C   ; 5E3B   0038 0078 007C 007C
        DECLE   $007E,  $0078,  $0078,  $003C   ; 5E3F   007E 0078 0078 003C
        DECLE   $003E,  $0037,  $003F,  $007C   ; 5E43   003E 0037 003F 007C
        DECLE   $0070,  $0070,  $0030,  $0038   ; 5E47   0070 0070 0030 0038
        DECLE   $0000,  $0000,  $0030,  $003C   ; 5E4B   0000 0000 0030 003C
        DECLE   $001E,  $001E,  $000F,  $0003   ; 5E4F   001E 001E 000F 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E53   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E57   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0038,  $003E   ; 5E5B   0000 0000 0038 003E
        DECLE   $003F,  $001F,  $001F,  $0007   ; 5E5F   003F 001F 001F 0007
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E63   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E67   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0030,  $003C   ; 5E6B   0000 0000 0030 003C
        DECLE   $001E,  $001E,  $000F,  $0003   ; 5E6F   001E 001E 000F 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E73   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E77   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0020,  $0030   ; 5E7B   0000 0000 0020 0030
        DECLE   $0018,  $000C,  $0006,  $0003   ; 5E7F   0018 000C 0006 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E83   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E87   0000 0000 0000 0000
        DECLE   $0080,  $0040,  $0020,  $0010   ; 5E8B   0080 0040 0020 0010
        DECLE   $0008,  $0004,  $0002,  $0001   ; 5E8F   0008 0004 0002 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E93   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E97   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0030,  $0018   ; 5E9B   0000 0000 0030 0018
        DECLE   $001C,  $000E,  $0007,  $0001   ; 5E9F   001C 000E 0007 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EA3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EA7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EAB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0042   ; 5EAF   0000 0000 0000 0042
        DECLE   $00FF,  $0042,  $0000,  $0000   ; 5EB3   00FF 0042 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EB7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EBB   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $0080,  $0060   ; 5EBF   0000 0040 0080 0060
        DECLE   $0099,  $0006,  $0001,  $0002   ; 5EC3   0099 0006 0001 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EC7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ECB   0000 0000 0000 0000
        DECLE   $00A0,  $0040,  $00A0,  $0010   ; 5ECF   00A0 0040 00A0 0010
        DECLE   $0008,  $0005,  $0002,  $0005   ; 5ED3   0008 0005 0002 0005
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ED7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0020   ; 5EDB   0000 0000 0000 0020
        DECLE   $0028,  $0010,  $0030,  $0008   ; 5EDF   0028 0010 0030 0008
        DECLE   $0008,  $0005,  $0004,  $000A   ; 5EE3   0008 0005 0004 000A
        DECLE   $0002,  $0000,  $0000,  $0000   ; 5EE7   0002 0000 0000 0000
        DECLE   $0000,  $0008,  $001C,  $0008   ; 5EEB   0000 0008 001C 0008
        DECLE   $0008,  $0008,  $0008,  $0008   ; 5EEF   0008 0008 0008 0008
        DECLE   $0008,  $0008,  $0008,  $0008   ; 5EF3   0008 0008 0008 0008
        DECLE   $001C,  $0008,  $0000,  $0000   ; 5EF7   001C 0008 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0002   ; 5EFB   0000 0000 0002 0002
        DECLE   $000A,  $0005,  $0004,  $0008   ; 5EFF   000A 0005 0004 0008
        DECLE   $0008,  $0010,  $0050,  $0028   ; 5F03   0008 0010 0050 0028
        DECLE   $0020,  $0000,  $0000,  $0000   ; 5F07   0020 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F0B   0000 0000 0000 0000
        DECLE   $0000,  $0005,  $0002,  $0005   ; 5F0F   0000 0005 0002 0005
        DECLE   $0008,  $0010,  $00A0,  $0040   ; 5F13   0008 0010 00A0 0040
        DECLE   $00A0,  $0000,  $0000,  $0000   ; 5F17   00A0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F1B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0003   ; 5F1F   0000 0000 0004 0003
        DECLE   $004C,  $0031,  $00C0,  $0020   ; 5F23   004C 0031 00C0 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F27   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F2B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F2F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F33   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F37   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F3B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F3F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F43   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F47   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F4B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F4F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F53   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F57   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F5B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F5F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F63   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F67   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F6B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F6F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F73   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F77   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F7B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F7F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F83   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F87   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F8B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F8F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F93   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F97   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F9B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F9F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FA3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FA7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FAB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FAF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FBB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FBF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FCB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FCF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FD3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FD7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FDB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FDF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FEB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FEF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFB   0000 0000 0000 0000
        DECLE   $0050,  $0000,  $0001,  $0003   ; 5FFF   0050 0000 0001 0003
        DECLE   $0007,  $000F,  $001F,  $003F   ; 6003   0007 000F 001F 003F
        DECLE   $007F,  $0000,  $0000,  $0000   ; 6007   007F 0000 0000 0000
        DECLE   $0000,  $00C0,  $00F8,  $00E0   ; 600B   0000 00C0 00F8 00E0
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 600F   00C0 0000 0000 0000
        DECLE   $0000,  $0003,  $001F,  $0007   ; 6013   0000 0003 001F 0007
        DECLE   $0003,  $0000,  $0000,  $00FE   ; 6017   0003 0000 0000 00FE
        DECLE   $0000,  $00FF,  $0000,  $00FF   ; 601B   0000 00FF 0000 00FF
        DECLE   $00FF,  $0001,  $0001,  $0001   ; 601F   00FF 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 6023   0001 0001 0001 0001
        DECLE   $0001                           ; 6027   0001

        TSTR    R0                              ; 6028   0080
        TSTR    R0                              ; 6029   0080
        TSTR    R0                              ; 602A   0080
        TSTR    R0                              ; 602B   0080
        TSTR    R0                              ; 602C   0080
        TSTR    R0                              ; 602D   0080
        TSTR    R0                              ; 602E   0080
        TSTR    R0                              ; 602F   0080
        ADDR    R0,     R3                      ; 6030   00C3
        MOVR    R0,     R7                      ; 6031   0087

        DECLE   $00C3,  $0081,  $0081,  $0081   ; 6032   00C3 0081 0081 0081
        DECLE   $0081,  $00FF,  $0000,  $0000   ; 6036   0081 00FF 0000 0000
        DECLE   $001E,  $0000,  $0000,  $0000   ; 603A   001E 0000 0000 0000
        DECLE   $00F8,  $0000,  $0001,  $0002   ; 603E   00F8 0000 0001 0002
        DECLE   $0004,  $0008,  $0010,  $0020   ; 6042   0004 0008 0010 0020
        DECLE   $0040,  $0080,  $0000,  $0080   ; 6046   0040 0080 0000 0080
        DECLE   $00C0,  $00E0,  $00F0,  $00F8   ; 604A   00C0 00E0 00F0 00F8
        DECLE   $00FC,  $00FE,  $00FF,  $007F   ; 604E   00FC 00FE 00FF 007F
        DECLE   $003F,  $001F,  $004F,  $0067   ; 6052   003F 001F 004F 0067
        DECLE   $0073,  $0079,  $007C,  $007C   ; 6056   0073 0079 007C 007C
        DECLE   $007C,  $007C,  $007C,  $007C   ; 605A   007C 007C 007C 007C
        DECLE   $007C,  $003C,  $001C,  $008C   ; 605E   007C 003C 001C 008C
        DECLE   $0044,  $0020,  $0090,  $0008   ; 6062   0044 0020 0090 0008
        DECLE   $00A4,  $0003,  $0028,  $0080   ; 6066   00A4 0003 0028 0080
        DECLE   $00CA,  $00E0,  $00F2,  $00F8   ; 606A   00CA 00E0 00F2 00F8
        DECLE   $00FC,  $00FE,  $0036,  $0000   ; 606E   00FC 00FE 0036 0000
        DECLE   $00DB,  $0000,  $00B9,  $0000   ; 6072   00DB 0000 00B9 0000
        DECLE   $00AB,  $0000,  $0001,  $0019   ; 6076   00AB 0000 0001 0019
        DECLE   $003D,  $00B6,  $00AE,  $003C   ; 607A   003D 00B6 00AE 003C
        DECLE   $0018,  $0000,  $000C,  $001E   ; 607E   0018 0000 000C 001E
        DECLE   $0037,  $003B,  $003F,  $001D   ; 6082   0037 003B 003F 001D
        DECLE   $0001,  $0001,  $0000,  $003E   ; 6086   0001 0001 0000 003E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 608A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 608E   0000 0000 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6092   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $0000   ; 6096   0000 0000 00FF 0000

        NEGR    R0                              ; 609A   0020
        ADDR    R5,     R7                      ; 609B   00EF

        DECLE   $00F7,  $00FB,  $0001,  $0001   ; 609C   00F7 00FB 0001 0001
        DECLE   $00E0,  $00E0,  $00F0,  $00FF   ; 60A0   00E0 00E0 00F0 00FF
        DECLE   $00FF,  $00FF,  $0001,  $0001   ; 60A4   00FF 00FF 0001 0001
        DECLE   $00FF                           ; 60A8   00FF

        MOVR    R4,     R1                      ; 60A9   00A1
        ADDR    R0,     R1                      ; 60AA   00C1
        MOVR    R4,     R1                      ; 60AB   00A1
        SAR     R1,     1                       ; 60AC   0069
        SLR     R1,     2                       ; 60AD   0065
        MOVR    R4,     R2                      ; 60AE   00A2
        ADDR    R0,     R1                      ; 60AF   00C1
        MOVR    R1,     R7                      ; 60B0   008F

        DECLE   $0047,  $0037,  $001B,  $007D   ; 60B1   0047 0037 001B 007D
        DECLE   $007D,  $00B2,  $00E1,  $00F9   ; 60B5   007D 00B2 00E1 00F9
        DECLE   $0057,  $00E5,  $00C3,  $00E6   ; 60B9   0057 00E5 00C3 00E6
        DECLE   $0016,  $0006,  $00E9,  $00FF   ; 60BD   0016 0006 00E9 00FF

        ADDR    R4,     R7                      ; 60C1   00E7
        ADDR    R1,     R7                      ; 60C2   00CF

        DECLE   $00E1,  $00D0,  $00E0,  $007F   ; 60C3   00E1 00D0 00E0 007F
        DECLE   $001C,  $00FF,  $00FF,  $00FF   ; 60C7   001C 00FF 00FF 00FF
        DECLE   $0008,  $0004,  $0000,  $0000   ; 60CB   0008 0004 0000 0000

        COMR    R4                              ; 60CF   001C
        MOVR    R0,     R7                      ; 60D0   0087

        DECLE   $00FB,  $00F9,  $000E,  $0013   ; 60D1   00FB 00F9 000E 0013
        DECLE   $0021,  $0040,  $0000,  $0000   ; 60D5   0021 0040 0000 0000
        DECLE   $0000,  $0000,  $0080,  $00C0   ; 60D9   0000 0000 0080 00C0
        DECLE   $00E0,  $00F0,  $00F8,  $007C   ; 60DD   00E0 00F0 00F8 007C
        DECLE   $00FE,  $0000,  $00FF,  $00DF   ; 60E1   00FE 0000 00FF 00DF
        DECLE   $007F,  $003F,  $001F,  $006F   ; 60E5   007F 003F 001F 006F
        DECLE   $0027,  $0013,  $0009,  $0004   ; 60E9   0027 0013 0009 0004
        DECLE   $0082,  $00C1,  $00E0,  $00FF   ; 60ED   0082 00C1 00E0 00FF
        DECLE   $00FF,  $00FF,  $001D,  $0001   ; 60F1   00FF 00FF 001D 0001
        DECLE   $00BF,  $007F,  $00FF,  $00E0   ; 60F5   00BF 007F 00FF 00E0
        DECLE   $00A0,  $00C0,  $00E0,  $00E8   ; 60F9   00A0 00C0 00E0 00E8
        DECLE   $00C4,  $0002,  $00FF,  $0000   ; 60FD   00C4 0002 00FF 0000
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; 6101   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0000,  $0007   ; 6105   00FF 00FF 0000 0007
        DECLE   $0007,  $0007,  $0007,  $0007   ; 6109   0007 0007 0007 0007
        DECLE   $0003,  $0000,  $0000,  $0007   ; 610D   0003 0000 0000 0007
        DECLE   $0007,  $0007,  $0007,  $0007   ; 6111   0007 0007 0007 0007
        DECLE   $0007,  $0007,  $0007,  $003F   ; 6115   0007 0007 0007 003F
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 6119   007F 00FF 00FF 00FF
        DECLE   $00FE,  $00FC,  $00F8,  $0000   ; 611D   00FE 00FC 00F8 0000
        DECLE   $0000,  $0000,  $0001           ; 6121   0000 0000 0001

        DIS                                     ; 6124   0003
        SETC                                    ; 6125   0007
        INCR    R7                              ; 6126   000F

        DECLE   $001F                           ; 6127   001F
L_6128:
        ADDR    R7,     R4                      ; 6128   00FC
        DECLE   $00F8,  $00F0,  $00E0,  $00C0   ; 6129   00F8 00F0 00E0 00C0
        DECLE   $0080,  $0000,  $0000,  $003F   ; 612D   0080 0000 0000 003F
        DECLE   $001F                           ; 6131   001F

        INCR    R7                              ; 6132   000F

        SETC                                    ; 6133   0007
L_6134:
        DIS                                     ; 6134   0003
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6135   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6139   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 613D   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6141   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $007F   ; 6145   00FF 00FF 00FF 007F
        DECLE   $007F,  $007F,  $00FF,  $00FF   ; 6149   007F 007F 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00F8   ; 614D   00FF 00FF 00FF 00F8
        DECLE   $00F8,  $00F8,  $00F8,  $00F8   ; 6151   00F8 00F8 00F8 00F8
        DECLE   $00F8,  $00F0,  $0000,  $001F   ; 6155   00F8 00F0 0000 001F
        DECLE   $003F,  $00FF,  $00FF,  $00FF   ; 6159   003F 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0000,  $00FF   ; 615D   00FF 00FF 0000 00FF
        DECLE   $00FB,  $00F7                   ; 6161   00FB 00F7

        ADDR    R5,     R7                      ; 6163   00EF
        ADDR    R3,     R7                      ; 6164   00DF

        DECLE   $00BF,  $007F,  $00FE,  $0001   ; 6165   00BF 007F 00FE 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 6169   0001 0001 0001 0001
        DECLE   $0021,  $0041,  $0081,  $00FF   ; 616D   0021 0041 0081 00FF
        DECLE   $00FF,  $00C7,  $00FF,  $00FF   ; 6171   00FF 00C7 00FF 00FF
        DECLE   $00FF,  $00FF,  $007F,  $007F   ; 6175   00FF 00FF 007F 007F
        DECLE   $007F,  $007F,  $007F,  $007F   ; 6179   007F 007F 007F 007F
        DECLE   $007F,  $007F,  $007F,  $0007   ; 617D   007F 007F 007F 0007
        DECLE   $0024,  $0007,  $0024,  $0043   ; 6181   0024 0007 0024 0043
        DECLE   $002B,  $0043,  $002B,  $0043   ; 6185   002B 0043 002B 0043
        DECLE   $002B,  $0004,  $000E,  $0007   ; 6189   002B 0004 000E 0007
        DECLE   $0020,  $0040,  $0028,  $0007   ; 618D   0020 0040 0028 0007
        DECLE   $0020,  $0040,  $0028,  $0007   ; 6191   0020 0040 0028 0007
        DECLE   $0020,  $0000,  $0028,  $0043   ; 6195   0020 0000 0028 0043
        DECLE   $002B,  $0043,  $002B,  $0043   ; 6199   002B 0043 002B 0043
        DECLE   $002B,  $0043,  $002B,  $0043   ; 619D   002B 0043 002B 0043
        DECLE   $002B,  $0043,  $002B,  $0043   ; 61A1   002B 0043 002B 0043
        DECLE   $002B,  $0043,  $002B,  $0007   ; 61A5   002B 0043 002B 0007
        DECLE   $0024,  $0007,  $0024,  $0043   ; 61A9   0024 0007 0024 0043
        DECLE   $002B,  $0043,  $002B,  $0043   ; 61AD   002B 0043 002B 0043
        DECLE   $002B,  $0007,  $0002,  $0007   ; 61B1   002B 0007 0002 0007
        DECLE   $0002,  $0007,  $0002,  $0007   ; 61B5   0002 0007 0002 0007
        DECLE   $0002,  $0007,  $0002,  $0007   ; 61B9   0002 0007 0002 0007
        DECLE   $0002,  $0000,  $0008,  $0043   ; 61BD   0002 0000 0008 0043
        DECLE   $002B,  $0043,  $002B,  $0043   ; 61C1   002B 0043 002B 0043
        DECLE   $002B,  $0043,  $002B,  $0043   ; 61C5   002B 0043 002B 0043
        DECLE   $002B,  $0043,  $002B,  $0043   ; 61C9   002B 0043 002B 0043
        DECLE   $002B,  $0043,  $002B,  $0007   ; 61CD   002B 0043 002B 0007
        DECLE   $0024,  $0007,  $0024,  $0043   ; 61D1   0024 0007 0024 0043
        DECLE   $002B,  $0043,  $002B,  $0043   ; 61D5   002B 0043 002B 0043
        DECLE   $002B,  $0080,  $000A,  $0020   ; 61D9   002B 0080 000A 0020
        DECLE   $000A,  $0072,  $000A,  $0072   ; 61DD   000A 0072 000A 0072
        DECLE   $000A,  $0028,  $000A,  $0088   ; 61E1   000A 0028 000A 0088
        DECLE   $000A,  $0000,  $0008,  $0043   ; 61E5   000A 0000 0008 0043
        DECLE   $002B,  $0043,  $002B,  $0043   ; 61E9   002B 0043 002B 0043
        DECLE   $002B,  $0043,  $002B,  $0043   ; 61ED   002B 0043 002B 0043
        DECLE   $002B,  $0043,  $002B,  $0043   ; 61F1   002B 0043 002B 0043
        DECLE   $002B,  $0050,  $000C,  $0007   ; 61F5   002B 0050 000C 0007
        DECLE   $0024,  $0007,  $0024,  $0011   ; 61F9   0024 0007 0024 0011
        DECLE   $000E,  $0019,  $000E,  $0009   ; 61FD   000E 0019 000E 0009
        DECLE   $000E,  $0078,  $000A,  $0020   ; 6201   000E 0078 000A 0020
        DECLE   $000A,  $0007,  $0002,  $0007   ; 6205   000A 0007 0002 0007
        DECLE   $0002,  $0028,  $000A,  $0088   ; 6209   0002 0028 000A 0088
        DECLE   $000A,  $0000,  $0008,  $0043   ; 620D   000A 0000 0008 0043
        DECLE   $002B,  $0043,  $002B,  $0043   ; 6211   002B 0043 002B 0043
        DECLE   $002B,  $0043,  $002B,  $0043   ; 6215   002B 0043 002B 0043
        DECLE   $002B,  $0043,  $002B,  $0043   ; 6219   002B 0043 002B 0043
        DECLE   $002B,  $0058,  $000C,  $0007   ; 621D   002B 0058 000C 0007
        DECLE   $0024,  $0005,  $002C,  $0021   ; 6221   0024 0005 002C 0021
        DECLE   $002A,  $0034,  $002E,  $0029   ; 6225   002A 0034 002E 0029
        DECLE   $002A,  $0007,  $0002,  $0020   ; 6229   002A 0007 0002 0020
        DECLE   $000A,  $0007,  $0002,  $0088   ; 622D   000A 0007 0002 0088
        DECLE   $000A,  $0028,  $000A,  $0088   ; 6231   000A 0028 000A 0088
        DECLE   $000A,  $0005,  $0008,  $003C   ; 6235   000A 0005 0008 003C
        DECLE   $002A,  $003C,  $002A,  $003C   ; 6239   002A 003C 002A 003C
        DECLE   $002A,  $003C,  $002A,  $003C   ; 623D   002A 003C 002A 003C
        DECLE   $002A,  $003C,  $002A,  $0068   ; 6241   002A 003C 002A 0068
        DECLE   $000C,  $0060,  $000C,  $0005   ; 6245   000C 0060 000C 0005
        DECLE   $002C,  $003C,  $002A,  $003C   ; 6249   002C 003C 002A 003C
        DECLE   $002A,  $003C,  $002A,  $003C   ; 624D   002A 003C 002A 003C
        DECLE   $002A,  $003C,  $002A,  $003C   ; 6251   002A 003C 002A 003C
        DECLE   $002A,  $003C,  $002A,  $003C   ; 6255   002A 003C 002A 003C
        DECLE   $002A,  $003C,  $002A,  $003C   ; 6259   002A 003C 002A 003C
        DECLE   $002A,  $003C,  $002A,  $003C   ; 625D   002A 003C 002A 003C
        DECLE   $002A,  $003C,  $002A,  $003C   ; 6261   002A 003C 002A 003C
        DECLE   $002A,  $003C,  $002A,  $003C   ; 6265   002A 003C 002A 003C
        DECLE   $002A,  $003C,  $002A,  $0090   ; 6269   002A 003C 002A 0090
        DECLE   $002A,  $0007,  $002E,  $00CB   ; 626D   002A 0007 002E 00CB
        DECLE   $0067,  $0094,  $0062,  $00B7   ; 6271   0067 0094 0062 00B7
        DECLE   $0062,  $00EA,  $006D,  $00A8   ; 6275   0062 00EA 006D 00A8
        DECLE   $0062,  $00B7,  $0062,  $0200   ; 6279   0062 00B7 0062 0200
        DECLE   $0000,  $0001,  $0110,  $0000   ; 627D   0000 0001 0110 0000
        DECLE   $0060,  $0000                   ; 6281   0060 0000

        INCR    R3                              ; 6283   000B
        XORR    R6,     R0                      ; 6284   01F0
        XORR    R4,     R0                      ; 6285   01E0
        XORR    R2,     R0                      ; 6286   01D0
        CLRR    R0                              ; 6287   01C0
        ANDR    R6,     R0                      ; 6288   01B0
        ANDR    R4,     R0                      ; 6289   01A0
        ANDR    R2,     R0                      ; 628A   0190
        ANDR    R0,     R0                      ; 628B   0180
        RRC     R1,     1                       ; 628C   0071
        SLR     R3,     1                       ; 628D   0063
        SARC    R0,     1                       ; 628E   0078
        SLR     R3,     1                       ; 628F   0063
        SARC    R2,     2                       ; 6290   007E
        SLR     R3,     1                       ; 6291   0063
        MOVR    R1,     R7                      ; 6292   008F

        DECLE   $0063,  $0039,  $0064,  $0001   ; 6293   0063 0039 0064 0001
        DECLE   $0000,  $0001,  $00D6,  $0004   ; 6297   0000 0001 00D6 0004
        DECLE   $0000,  $005C,  $00D6,  $0001   ; 629B   0000 005C 00D6 0001
        DECLE   $0000,  $0067,  $006C,  $0001   ; 629F   0000 0067 006C 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62A3   0000 0000 0000 0000
        DECLE   $0000,  $002D,  $0001           ; 62A7   0000 002D 0001

        AND     .STIC.A.1,R0                    ; 62AA   0380 0011
        AND     .STIC.MODE,R0                   ; 62AC   0380 0021
        AND     .STIC.VDLY,R0                   ; 62AE   0380 0031
        AND     G_0041, R0                      ; 62B0   0380 0041
        AND     G_0051, R0                      ; 62B2   0380 0051
        ANDR    R0,     R0                      ; 62B4   0180
        DECR    R1                              ; 62B5   0011
        GSWD    R0                              ; 62B6   0030
        PSHR    R5                              ; 62B7   0275
L_62B8:
        MVII    #$0200, R4                      ; 62B8   02BC 0200
        MVII    #$0078, R0                      ; 62BA   02B8 0078
        SDBD                                    ; 62BC   0001
        MVII    #$2200, R1                      ; 62BD   02B9 0000 0022

        JSR     R5,     X_FILL_MEM              ; 62C0   0004 0114 0341

        MVII    #$0064, R0                      ; 62C3   02B8 0064
        MVO     R0,     G_0167                  ; 62C5   0240 0167

        JSR     R5,     L_62CB                  ; 62C7   0004 0160 02CB

        PULR    R7                              ; 62CA   02B7

L_62CB:
        PSHR    R5                              ; 62CB   0275
        SDBD                                    ; 62CC   0001
        MVII    #$3200, R1                      ; 62CD   02B9 0000 0032
        MVII    #$0278, R4                      ; 62D0   02BC 0278
        MVII    #$0028, R0                      ; 62D2   02B8 0028

        JSR     R5,     X_FILL_MEM              ; 62D4   0004 0114 0341
        JSR     R5,     L_6DDB                  ; 62D7   0004 016C 01DB

        SDBD                                    ; 62DA   0001
        MVII    #$0600, R1                      ; 62DB   02B9 0000 0006
        MVII    #$0014, R0                      ; 62DE   02B8 0014
        MVII    #$02C8, R4                      ; 62E0   02BC 02C8

        JSR     R5,     X_FILL_MEM              ; 62E2   0004 0114 0341

        MVII    #$0014, R0                      ; 62E5   02B8 0014
        SDBD                                    ; 62E7   0001
        MVII    #$3D3C, R1                      ; 62E8   02B9 003C 003D

        JSR     R5,     X_FILL_MEM              ; 62EB   0004 0114 0341

        SDBD                                    ; 62EE   0001
        MVII    #$3201, R3                      ; 62EF   02BB 0001 0032
        MVII    #$0278, R4                      ; 62F2   02BC 0278

        JSR     R5,     X_PRINT_R5              ; 62F4   0004 0118 007B
        STRING  "C="                            ; 62F7   0043 003D
        DECLE   $0000                           ; 62F9   0000

        ADDI    #$0012, R4                      ; 62FA   02FC 0012
        SDBD                                    ; 62FC   0001
        MVII    #$3201, R3                      ; 62FD   02BB 0001 0032

        JSR     R5,     X_PRINT_R5              ; 6300   0004 0118 007B
        STRING  "A="                            ; 6303   0041 003D
        DECLE   $0000,  $02B8,  $00AA,  $0240   ; 6305   0000 02B8 00AA 0240
        DECLE   $0116,  $0001,  $02B8,  $00FF   ; 6309   0116 0001 02B8 00FF
        DECLE   $00FF,  $0240,  $01EB,  $02BA   ; 630D   00FF 0240 01EB 02BA
        DECLE   $031D,  $0001                   ; 6311   031D 0001

        MVII    #$00DC, R1                      ; 6313   02B9 00DC
        SLR     R2,     2                       ; 6315   0066
        MVII    #$0008, R0                      ; 6316   02B8 0008

        JSR     R5,     X_INIT_MOBS             ; 6318   0004 0114 02B4

        MVI     G_01DD, R0                      ; 631B   0280 01DD
        MVII    #$0002, R1                      ; 631D   02B9 0002
        SDBD                                    ; 631F   0001
        MVII    #$3201, R3                      ; 6320   02BB 0001 0032
        MVII    #$028E, R4                      ; 6323   02BC 028E

        JSR     R5,     X_PRNUM_RGT             ; 6325   0004 0118 00C5
        JSR     R5,     L_66AF                  ; 6328   0004 0164 02AF

        MVII    #$0175, R0                      ; 632B   02B8 0175
        MVO     R0,     G_0324                  ; 632D   0240 0324
        CLRR    R0                              ; 632F   01C0
        MVO     R0,     G_01E8                  ; 6330   0240 01E8
        MVO     R0,     G_01DC                  ; 6332   0240 01DC
        MVO     R0,     G_01D3                  ; 6334   0240 01D3
        MVO     R0,     G_01E6                  ; 6336   0240 01E6
        MVII    #$0005, R0                      ; 6338   02B8 0005

        JSR     R5,     .EXEC.6CF               ; 633A   0004 0114 02CF

        SDBD                                    ; 633D   0001
        MVII    #$0AFE, R1                      ; 633E   02B9 00FE 000A
        MVO     R1,     G_0349                  ; 6341   0241 0349
        MVII    #$0006, R0                      ; 6343   02B8 0006

        JSR     R5,     .EXEC.6CF               ; 6345   0004 0114 02CF

        SDBD                                    ; 6348   0001
        MVII    #$F000, R1                      ; 6349   02B9 0000 00F0
        MVO     R1,     G_0351                  ; 634C   0241 0351
        MVII    #$0002, R0                      ; 634E   02B8 0002

        JSR     R5,     .EXEC.6CF               ; 6350   0004 0114 02CF

        SDBD                                    ; 6353   0001
        MVII    #$635D, R0                      ; 6354   02B8 005D 0063
        MVO     R0,     G_035D                  ; 6357   0240 035D

        JSR     R5,     L_65CB                  ; 6359   0004 0164 01CB

        PULR    R7                              ; 635C   02B7

        DECLE   $00C8,  $006B,  $00D6,  $0063   ; 635D   00C8 006B 00D6 0063
        DECLE   $0036,  $00D5,  $0000,  $0000   ; 6361   0036 00D5 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6365   0000 0000 0000 0000
        DECLE   $00D6,  $0063,  $0000,  $0000   ; 6369   00D6 0063 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 636D   0000 0000 0000 0000
        DECLE   $0041,  $004E,  $0043,  $0058   ; 6371   0041 004E 0043 0058
        DECLE   $0043,  $0048,  $0000           ; 6375   0043 0048 0000

        MOVR    R5,     R0                      ; 6378   00A8
        SLR     R3,     1                       ; 6379   0063
        ADDR    R0,     R2                      ; 637A   00C2
        SLR     R3,     1                       ; 637B   0063
        MOVR    R2,     R7                      ; 637C   0097

        DECLE   $0063,  $0041,  $004E,  $0047   ; 637D   0063 0041 004E 0047
        DECLE   $004C,  $0046,  $0049,  $0052   ; 6381   004C 0046 0049 0052
        DECLE   $0045,  $004D,  $004F,  $0056   ; 6385   0045 004D 004F 0056
        DECLE   $0043,  $0054,  $004F,  $0046   ; 6389   0043 0054 004F 0046
        DECLE   $0046,  $0000,  $0069,  $006B   ; 638D   0046 0000 0069 006B
        DECLE   $0034,  $00D5,  $0094,  $006B   ; 6391   0034 00D5 0094 006B
        DECLE   $00B6,  $006B,  $0080,  $0204   ; 6395   00B6 006B 0080 0204
        DECLE   $000D,  $0280,  $01DB,  $0001   ; 6399   000D 0280 01DB 0001
        DECLE   $02BB,  $00DB,  $0047,  $0004   ; 639D   02BB 00DB 0047 0004
        DECLE   $01EC,  $0340,  $009A,  $0004   ; 63A1   01EC 0340 009A 0004

        CMPI    #$003D, R0                      ; 63A5   0378 003D
        PULR    R7                              ; 63A7   02B7

        DECLE   $0080,  $0204,  $000D,  $0280   ; 63A8   0080 0204 000D 0280
        DECLE   $01DD,  $0001,  $02BB,  $00DB   ; 63AC   01DD 0001 02BB 00DB
        DECLE   $0047,  $0004,  $01EC,  $0340   ; 63B0   0047 0004 01EC 0340
        DECLE   $009A,  $0004,  $0378,  $003D   ; 63B4   009A 0004 0378 003D
        DECLE   $0001,  $02BB,  $00CD,  $0047   ; 63B8   0001 02BB 00CD 0047
        DECLE   $0004                           ; 63BC   0004

        CLRR    R4                              ; 63BD   01E4
        ANDR    R4,     R2                      ; 63BE   01A2
        MVO     R0,     G_01DA                  ; 63BF   0240 01DA
        PULR    R7                              ; 63C1   02B7

        DECLE   $0080,  $020C,  $000A,  $0001   ; 63C2   0080 020C 000A 0001
        DECLE   $02BB,  $00CD,  $0047,  $0004   ; 63C6   02BB 00CD 0047 0004

        CLRR    R4                              ; 63CA   01E4
        ANDR    R4,     R2                      ; 63CB   01A2
        MVO     R0,     G_01D7                  ; 63CC   0240 01D7
        PULR    R7                              ; 63CE   02B7

        DECLE   $0001,  $02BA,  $00FE,  $0025   ; 63CF   0001 02BA 00FE 0025
        DECLE   $0004                           ; 63D3   0004

        CMPI    #$003D, R0                      ; 63D4   0378 003D
        PSHR    R5                              ; 63D6   0275
        MVI     G_0332, R1                      ; 63D7   0281 0332
        TSTR    R1                              ; 63D9   0089
        BNEQ    L_63E8                          ; 63DA   020C 000C

        CMPI    #$000A, R0                      ; 63DC   0378 000A
        BNEQ    L_63E8                          ; 63DE   020C 0008

        MVI     G_01E6, R0                      ; 63E0   0280 01E6
        SLL     R0,     1                       ; 63E2   0048
        ADDR    R0,     R7                      ; 63E3   00C7
        B       L_63E9                          ; 63E4   0200 0003
        B       L_63F9                          ; 63E6   0200 0011
L_63E8:
        PULR    R7                              ; 63E8   02B7

L_63E9:
        SDBD                                    ; 63E9   0001
        MVII    #$6367, R0                      ; 63EA   02B8 0067 0063
        MVO     R0,     G_035D                  ; 63ED   0240 035D
        SDBD                                    ; 63EF   0001
        MVII    #$8000, R2                      ; 63F0   02BA 0000 0080
        MVII    #$0001, R0                      ; 63F3   02B8 0001
        MVO     R0,     G_01E6                  ; 63F5   0240 01E6
        B       L_6403                          ; 63F7   0200 000A

L_63F9:
        CLRR    R2                              ; 63F9   01D2
        SDBD                                    ; 63FA   0001
        MVII    #$635D, R0                      ; 63FB   02B8 005D 0063
        MVO     R0,     G_035D                  ; 63FE   0240 035D
        CLRR    R0                              ; 6400   01C0
        MVO     R0,     G_01E6                  ; 6401   0240 01E6
L_6403:
        MVII    #$031D, R3                      ; 6403   02BB 031D
        MVII    #$0008, R4                      ; 6405   02BC 0008
L_6407:
        MVI@    R3,     R1                      ; 6407   0299
        SDBD                                    ; 6408   0001
        ANDI    #$7FFF, R1                      ; 6409   03B9 00FF 007F
        XORR    R2,     R1                      ; 640C   01D1
        MVO@    R1,     R3                      ; 640D   0259
        ADDI    #$0008, R3                      ; 640E   02FB 0008
        DECR    R4                              ; 6410   0014
        BNEQ    L_6407                          ; 6411   022C 000B
        PULR    R7                              ; 6413   02B7

L_6414:
        PSHR    R5                              ; 6414   0275
        MVII    #$001E, R0                      ; 6415   02B8 001E
        MVII    #$01D0, R4                      ; 6417   02BC 01D0

        JSR     R5,     X_FILL_ZERO             ; 6419   0004 0114 0338

        MVII    #$027D, R4                      ; 641C   02BC 027D
        SDBD                                    ; 641E   0001
        MVII    #$3207, R3                      ; 641F   02BB 0007 0032
        SDBD                                    ; 6422   0001
        MVII    #$D429, R1                      ; 6423   02B9 0029 00D4

        JSR     R5,     X_PRINT_R1              ; 6426   0004 0118 0067
        JSR     R5,     L_6FD7                  ; 6429   0004 016C 03D7
        JSR     R5,     L_62CB                  ; 642C   0004 0160 02CB

        PULR    R7                              ; 642F   02B7

L_6430:
        PSHR    R5                              ; 6430   0275
        CLRR    R0                              ; 6431   01C0
        MVO     R0,     G_031F                  ; 6432   0240 031F
        MVO     R0,     G_0320                  ; 6434   0240 0320
        MVO     R0,     G_0321                  ; 6436   0240 0321
        PULR    R7                              ; 6438   02B7

        PSHR    R5                              ; 6439   0275
        MVI     G_01D0, R0                      ; 643A   0280 01D0
        TSTR    R0                              ; 643C   0080
        BEQ     L_6484                          ; 643D   0204 0045

        MVI     G_0339, R0                      ; 643F   0280 0339
        TSTR    R0                              ; 6441   0080
        BNEQ    L_6448                          ; 6442   020C 0004

        MVII    #$0004, R0                      ; 6444   02B8 0004
        MVO     R0,     G_0339                  ; 6446   0240 0339
L_6448:
        MVI     G_0337, R0                      ; 6448   0280 0337
        MVI     G_031F, R1                      ; 644A   0281 031F

        JSR     R5,     L_6473                  ; 644C   0004 0164 0073

        MVI     G_0338, R0                      ; 644F   0280 0338
        MVI     G_0320, R1                      ; 6451   0281 0320

        JSR     R5,     L_6473                  ; 6453   0004 0164 0073

        MVI     G_031D, R0                      ; 6456   0280 031D
        SDBD                                    ; 6458   0001
        ANDI    #$BFFF, R0                      ; 6459   03B8 00FF 00BF
        SDBD                                    ; 645C   0001
        XORI    #$4000, R0                      ; 645D   03F8 0000 0040
        MVO     R0,     G_031D                  ; 6460   0240 031D
        MVII    #$000A, R0                      ; 6462   02B8 000A
        MVO     R0,     G_0343                  ; 6464   0240 0343
        J       L_6486                          ; 6466   0004 0364 0086

        PSHR    R5                              ; 6469   0275
        MVI     G_031D, R0                      ; 646A   0280 031D
        SDBD                                    ; 646C   0001
        ANDI    #$BFFF, R0                      ; 646D   03B8 00FF 00BF
        MVO     R0,     G_031D                  ; 6470   0240 031D
        PULR    R7                              ; 6472   02B7

L_6473:
        PSHR    R5                              ; 6473   0275
        SUBR    R1,     R0                      ; 6474   0108
        SWAP    R0,     1                       ; 6475   0040
        ANDI    #$00FF, R0                      ; 6476   03B8 00FF

        JSR     R5,     X_EXT_SIGN_LO           ; 6478   0004 0114 0268

        TSTR    R0                              ; 647B   0080
        BPL     L_647F                          ; 647C   0203 0001

        NEGR    R0                              ; 647E   0020
L_647F:
        CMPI    #$0005, R0                      ; 647F   0378 0005
        BLT     L_6484                          ; 6481   0205 0001

        PULR    R4                              ; 6483   02B4
L_6484:
        PULR    R7                              ; 6484   02B7

        PSHR    R5                              ; 6485   0275
L_6486:
        MVI     G_01D0, R0                      ; 6486   0280 01D0
        TSTR    R0                              ; 6488   0080
        BEQ     L_64A8                          ; 6489   0204 001D

        MVI     G_0337, R1                      ; 648B   0281 0337
        SWAP    R1,     1                       ; 648D   0041
        ANDI    #$00FF, R1                      ; 648E   03B9 00FF
        MVII    #$0014, R2                      ; 6490   02BA 0014
        SUBR    R2,     R1                      ; 6492   0111
        BMI     L_649C                          ; 6493   020B 0007

        JSR     R5,     X_DIV                   ; 6495   0004 011C 01FB

        ANDI    #$0003, R0                      ; 6498   03B8 0003
        BNEQ    L_649E                          ; 649A   020C 0002

L_649C:
        MVII    #$0001, R0                      ; 649C   02B8 0001
L_649E:
        MOVR    R0,     R2                      ; 649E   0082

        JSR     R5,     L_661D                  ; 649F   0004 0164 021D
        JSR     R5,     L_6430                  ; 64A2   0004 0164 0030

        J       L_64B9                          ; 64A5   0004 0364 00B9
L_64A8:
        PULR    R7                              ; 64A8   02B7

        PSHR    R5                              ; 64A9   0275
        MVI     G_01D0, R0                      ; 64AA   0280 01D0
        TSTR    R0                              ; 64AC   0080
        BNEQ    L_64B9                          ; 64AD   020C 000A
        PULR    R7                              ; 64AF   02B7

        PSHR    R5                              ; 64B0   0275
        MVI     G_01D0, R0                      ; 64B1   0280 01D0
        TSTR    R0                              ; 64B3   0080
        BEQ     L_64D9                          ; 64B4   0204 0023

        JSR     R5,     L_64DC                  ; 64B6   0004 0164 00DC

L_64B9:
        CLRR    R0                              ; 64B9   01C0
        MVO     R0,     G_01D0                  ; 64BA   0240 01D0
        MVO     R0,     G_01D3                  ; 64BC   0240 01D3
        MVO     R0,     G_0339                  ; 64BE   0240 0339
        SDBD                                    ; 64C0   0001
        MVII    #$9042, R0                      ; 64C1   02B8 0042 0090
        MVO     R0,     G_0335                  ; 64C4   0240 0335
        SDBD                                    ; 64C6   0001
        MVII    #$67BD, R0                      ; 64C7   02B8 00BD 0067
        MVO     R0,     G_0336                  ; 64CA   0240 0336
        SDBD                                    ; 64CC   0001
        MVII    #$0FF0, R0                      ; 64CD   02B8 00F0 000F
        MVO     R0,     G_033A                  ; 64D0   0240 033A
        MVII    #$0012, R0                      ; 64D2   02B8 0012
        MVO     R0,     G_034B                  ; 64D4   0240 034B

        JSR     R5,     L_D795                  ; 64D6   0004 01D4 0395

L_64D9:
        J       L_D621                          ; 64D9   0004 03D4 0221

L_64DC:
        PSHR    R5                              ; 64DC   0275
        SLL     R2,     1                       ; 64DD   004A
        ADDR    R2,     R7                      ; 64DE   00D7
        B       L_64FA                          ; 64DF   0200 0019
        B       L_64F4                          ; 64E1   0200 0011
        B       L_64ED                          ; 64E3   0200 0008
        B       L_64E7                          ; 64E5   0200 0000

L_64E7:
        SDBD                                    ; 64E7   0001
        MVII    #$0600, R2                      ; 64E8   02BA 0000 0006
        B       L_64F1                          ; 64EB   0200 0004

L_64ED:
        SDBD                                    ; 64ED   0001
        MVII    #$6300, R2                      ; 64EE   02BA 0000 0063
L_64F1:
        MVO     R2,     G_0338                  ; 64F1   0242 0338
        PULR    R7                              ; 64F3   02B7

L_64F4:
        SDBD                                    ; 64F4   0001
        MVII    #$0800, R2                      ; 64F5   02BA 0000 0008
        B       L_64FE                          ; 64F8   0200 0004

L_64FA:
        SDBD                                    ; 64FA   0001
        MVII    #$A100, R2                      ; 64FB   02BA 0000 00A1
L_64FE:
        MVO     R2,     G_0337                  ; 64FE   0242 0337
        PULR    R7                              ; 6500   02B7

L_6501:
        PSHR    R5                              ; 6501   0275

        JSR     R5,     L_6430                  ; 6502   0004 0164 0030
        JSR     R5,     L_66AF                  ; 6505   0004 0164 02AF

        PULR    R7                              ; 6508   02B7

        PSHR    R5                              ; 6509   0275
        MVI     G_0325, R0                      ; 650A   0280 0325
        SDBD                                    ; 650C   0001
        CMPI    #$B0CE, R0                      ; 650D   0378 00CE 00B0
        BEQ     L_655C                          ; 6510   0204 004A

        MVI     G_01D0, R0                      ; 6512   0280 01D0
        TSTR    R0                              ; 6514   0080
        BNEQ    L_651F                          ; 6515   020C 0008

        MVI     G_0335, R2                      ; 6517   0282 0335
        SDBD                                    ; 6519   0001
        ANDI    #$EFFF, R2                      ; 651A   03BA 00FF 00EF
        MVO     R2,     G_0335                  ; 651D   0242 0335

L_651F:
        JSR     R5,     L_6430                  ; 651F   0004 0164 0030
        JSR     R5,     L_D77D                  ; 6522   0004 01D4 037D

        SDBD                                    ; 6525   0001
        MVII    #$67BD, R1                      ; 6526   02B9 00BD 0067
        MVO     R1,     G_0326                  ; 6529   0241 0326
        MVI     G_0325, R0                      ; 652B   0280 0325
        MVO     R0,     G_032C                  ; 652D   0240 032C
        SDBD                                    ; 652F   0001
        MVII    #$B0CE, R1                      ; 6530   02B9 00CE 00B0
        MVO     R1,     G_0325                  ; 6533   0241 0325
        SDBD                                    ; 6535   0001
        MVII    #$67C4, R2                      ; 6536   02BA 00C4 0067
        MVO     R2,     G_032E                  ; 6539   0242 032E
        MVI     G_032D, R1                      ; 653B   0281 032D
        MVO     R1,     G_0334                  ; 653D   0241 0334
        SDBD                                    ; 653F   0001
        MVII    #$B0CF, R3                      ; 6540   02BB 00CF 00B0
        MVO     R3,     G_032D                  ; 6543   0243 032D
        MVII    #$03F0, R2                      ; 6545   02BA 03F0
        MVO     R2,     G_032A                  ; 6547   0242 032A
        MVII    #$03F7, R2                      ; 6549   02BA 03F7
        MVO     R2,     G_0332                  ; 654B   0242 0332
        MVII    #$0028, R1                      ; 654D   02B9 0028
        MVO     R1,     G_032B                  ; 654F   0241 032B

        JSR     R5,     L_66AF                  ; 6551   0004 0164 02AF

        MVII    #$0005, R2                      ; 6554   02BA 0005

        JSR     R5,     L_661D                  ; 6556   0004 0164 021D
        JSR     R5,     L_6670                  ; 6559   0004 0164 0270

L_655C:
        PULR    R7                              ; 655C   02B7

        PSHR    R5                              ; 655D   0275
        MVI     G_01E6, R0                      ; 655E   0280 01E6
        TSTR    R0                              ; 6560   0080
        BEQ     L_656F                          ; 6561   0204 000C

        SDBD                                    ; 6563   0001
        MVII    #$B0CA, R1                      ; 6564   02B9 00CA 00B0
        MVII    #$0325, R3                      ; 6567   02BB 0325
        MVO@    R1,     R3                      ; 6569   0259
        ADDI    #$0008, R3                      ; 656A   02FB 0008
        MVO@    R1,     R3                      ; 656C   0259
        B       L_6590                          ; 656D   0200 0021

L_656F:
        MVII    #$00AA, R2                      ; 656F   02BA 00AA
        SWAP    R2,     1                       ; 6571   0042
        MVO     R2,     G_0327                  ; 6572   0242 0327
        MVO     R2,     G_032F                  ; 6574   0242 032F
        MVI     G_032C, R1                      ; 6576   0281 032C
        MVO     R1,     G_0325                  ; 6578   0241 0325
        MVI     G_0334, R1                      ; 657A   0281 0334
        MVO     R1,     G_032D                  ; 657C   0241 032D
        SDBD                                    ; 657E   0001
        MVII    #$6767, R3                      ; 657F   02BB 0067 0067
        MVO     R3,     G_0326                  ; 6582   0243 0326
        SDBD                                    ; 6584   0001
        MVII    #$6770, R3                      ; 6585   02BB 0070 0067
        MVO     R3,     G_032E                  ; 6588   0243 032E
        CLRR    R0                              ; 658A   01C0
        MVO     R0,     G_0332                  ; 658B   0240 0332

        JSR     R5,     L_65CB                  ; 658D   0004 0164 01CB

L_6590:
        PULR    R7                              ; 6590   02B7

        PSHR    R5                              ; 6591   0275
        MVI     G_01D0, R0                      ; 6592   0280 01D0
        TSTR    R0                              ; 6594   0080
        BEQ     L_6590                          ; 6595   0224 0006

        CLRR    R0                              ; 6597   01C0
        MVO     R0,     G_0337                  ; 6598   0240 0337
        MVO     R0,     G_0338                  ; 659A   0240 0338
        MVO     R0,     G_01D0                  ; 659C   0240 01D0

        JSR     R5,     L_D759                  ; 659E   0004 01D4 0359
        JSR     R5,     L_6D79                  ; 65A1   0004 016C 0179
        JSR     R5,     L_65F3                  ; 65A4   0004 0164 01F3

        MVI     G_01E8, R0                      ; 65A7   0280 01E8
        MVI     G_01D3, R1                      ; 65A9   0281 01D3
        CLRR    R3                              ; 65AB   01DB
        MVO     R3,     G_01D3                  ; 65AC   0243 01D3
        SLR     R1,     2                       ; 65AE   0065
        SLR     R1,     2                       ; 65AF   0065
        ADDI    #$0001, R1                      ; 65B0   02F9 0001
        ADDR    R1,     R0                      ; 65B2   00C8
        MVO     R0,     G_01E8                  ; 65B3   0240 01E8
        MVII    #$0003, R1                      ; 65B5   02B9 0003
        SDBD                                    ; 65B7   0001
        MVII    #$2007, R3                      ; 65B8   02BB 0007 0020
        MVII    #$02EB, R4                      ; 65BB   02BC 02EB

        JSR     R5,     X_PRNUM_ZRO             ; 65BD   0004 0118 00AD

        SDBD                                    ; 65C0   0001
        MVII    #$2087, R3                      ; 65C1   02BB 0087 0020
        MVII    #$02EE, R4                      ; 65C4   02BC 02EE
        MVO@    R3,     R4                      ; 65C6   0263
        J       L_D621                          ; 65C7   0004 03D4 0221
        PULR    R7                              ; 65CA   02B7

L_65CB:
        PSHR    R5                              ; 65CB   0275
        MVI     G_01D0, R0                      ; 65CC   0280 01D0
        TSTR    R0                              ; 65CE   0080
        BNEQ    L_65D4                          ; 65CF   020C 0003

        JSR     R5,     L_65F3                  ; 65D1   0004 0164 01F3

L_65D4:
        MVII    #$0008, R1                      ; 65D4   02B9 0008
        MVII    #$000A, R0                      ; 65D6   02B8 000A

        JSR     R5,     .EXEC.629               ; 65D8   0004 0114 0229

        MVO     R0,     G_0329                  ; 65DB   0240 0329
        MVII    #$00AA, R1                      ; 65DD   02B9 00AA
        SWAP    R1,     1                       ; 65DF   0041
        MVO     R1,     G_0327                  ; 65E0   0241 0327
        MVII    #$0058, R1                      ; 65E2   02B9 0058
        SWAP    R1,     1                       ; 65E4   0041
        MVO     R1,     G_0328                  ; 65E5   0241 0328
        CLRR    R2                              ; 65E7   01D2
        XORI    #$0300, R2                      ; 65E8   03FA 0300
        MVO     R2,     G_032A                  ; 65EA   0242 032A
        SDBD                                    ; 65EC   0001
        MVII    #$6767, R0                      ; 65ED   02B8 0067 0067
        MVO     R0,     G_0326                  ; 65F0   0240 0326
        PULR    R7                              ; 65F2   02B7

L_65F3:
        PSHR    R5                              ; 65F3   0275
        MVI     G_0326, R0                      ; 65F4   0280 0326
        SDBD                                    ; 65F6   0001
        CMPI    #$67BD, R0                      ; 65F7   0378 00BD 0067
        BEQ     L_661C                          ; 65FA   0204 0020

        CLRR    R0                              ; 65FC   01C0
        MVO     R0,     G_0337                  ; 65FD   0240 0337
        SDBD                                    ; 65FF   0001
        MVII    #$6777, R0                      ; 6600   02B8 0077 0067
        MVO     R0,     G_0336                  ; 6603   0240 0336
        CLRR    R0                              ; 6605   01C0
        MVO     R0,     G_033A                  ; 6606   0240 033A
        MVII    #$0003, R0                      ; 6608   02B8 0003

        JSR     R5,     .EXEC.6CF               ; 660A   0004 0114 02CF

        SDBD                                    ; 660D   0001
        MVII    #$06FF, R0                      ; 660E   02B8 00FF 0006
        MVO     R0,     G_0339                  ; 6611   0240 0339
        SDBD                                    ; 6613   0001
        MVII    #$184F, R0                      ; 6614   02B8 004F 0018
        MVO     R0,     G_0335                  ; 6617   0240 0335
        CLRR    R0                              ; 6619   01C0
        MVO     R0,     G_01E1                  ; 661A   0240 01E1
L_661C:
        PULR    R7                              ; 661C   02B7

L_661D:
        PSHR    R5                              ; 661D   0275
        MVI     G_01DC, R0                      ; 661E   0280 01DC
        ADDR    R2,     R0                      ; 6620   00D0
        MVO     R0,     G_01DC                  ; 6621   0240 01DC
        MVII    #$0003, R1                      ; 6623   02B9 0003
        SDBD                                    ; 6625   0001
        MVII    #$2007, R3                      ; 6626   02BB 0007 0020
        MVII    #$02DE, R4                      ; 6629   02BC 02DE

        JSR     R5,     X_PRNUM_ZRO             ; 662B   0004 0118 00AD

        MVII    #$02E1, R4                      ; 662E   02BC 02E1
        SDBD                                    ; 6630   0001
        MVII    #$2087, R0                      ; 6631   02B8 0087 0020
        MVO@    R0,     R4                      ; 6634   0260
        PULR    R7                              ; 6635   02B7

        PSHR    R5                              ; 6636   0275
        CLRR    R1                              ; 6637   01C9
        MVII    #$000A, R0                      ; 6638   02B8 000A

        JSR     R5,     .EXEC.629               ; 663A   0004 0114 0229

        MVO     R0,     G_0329                  ; 663D   0240 0329
        SDBD                                    ; 663F   0001
        MVII    #$67B6, R0                      ; 6640   02B8 00B6 0067
        MVO     R0,     G_0326                  ; 6643   0240 0326
        MVI     G_0357, R0                      ; 6645   0280 0357
        SDBD                                    ; 6647   0001
        SUBI    #$0600, R0                      ; 6648   0338 0000 0006
        MVO     R0,     G_0357                  ; 664B   0240 0357
        SDBD                                    ; 664D   0001
        CMPI    #$2500, R0                      ; 664E   0378 0000 0025
        BGT     L_666F                          ; 6651   020E 001C

        MVI     G_01E8, R0                      ; 6653   0280 01E8
        ADDI    #$000A, R0                      ; 6655   02F8 000A
        MVII    #$0003, R1                      ; 6657   02B9 0003
        SDBD                                    ; 6659   0001
        MVII    #$2007, R3                      ; 665A   02BB 0007 0020
        MVII    #$02EB, R4                      ; 665D   02BC 02EB

        JSR     R5,     X_PRNUM_ZRO             ; 665F   0004 0118 00AD

        SDBD                                    ; 6662   0001
        MVII    #$2087, R3                      ; 6663   02BB 0087 0020
        MVII    #$02EE, R4                      ; 6666   02BC 02EE
        MVO@    R3,     R4                      ; 6668   0263
        CLRR    R0                              ; 6669   01C0
        MVO     R0,     G_01D0                  ; 666A   0240 01D0

        JSR     R5,     L_6414                  ; 666C   0004 0164 0014

L_666F:
        PULR    R7                              ; 666F   02B7

L_6670:
        PSHR    R5                              ; 6670   0275
        MVI     G_0357, R2                      ; 6671   0282 0357
        SDBD                                    ; 6673   0001
        ADDI    #$1200, R2                      ; 6674   02FA 0000 0012
        MVO     R2,     G_0357                  ; 6677   0242 0357
        SWAP    R2,     1                       ; 6679   0042
        ANDI    #$00FF, R2                      ; 667A   03BA 00FF
        CMPI    #$0088, R2                      ; 667C   037A 0088
        BLT     L_668E                          ; 667E   0205 000E

        MVII    #$000A, R2                      ; 6680   02BA 000A

        JSR     R5,     L_661D                  ; 6682   0004 0164 021D

        SDBD                                    ; 6685   0001
        MVII    #$FFFF, R0                      ; 6686   02B8 00FF 00FF
        MVO     R0,     G_032B                  ; 6689   0240 032B

        JSR     R5,     L_6414                  ; 668B   0004 0164 0014

L_668E:
        PULR    R7                              ; 668E   02B7

        PSHR    R5                              ; 668F   0275
        CLRR    R2                              ; 6690   01D2
        MVO     R2,     G_01DE                  ; 6691   0242 01DE
        MVI     G_0345, R1                      ; 6693   0281 0345
        SDBD                                    ; 6695   0001
        ANDI    #$F0FF, R1                      ; 6696   03B9 00FF 00F0
        MVO     R1,     G_0345                  ; 6699   0241 0345
        CLRR    R0                              ; 669B   01C0
        MVO     R0,     G_0341                  ; 669C   0240 0341
        MVI     G_033F, R0                      ; 669E   0280 033F
        SDBD                                    ; 66A0   0001
        SUBI    #$0600, R0                      ; 66A1   0338 0000 0006
        MVO     R0,     G_033F                  ; 66A4   0240 033F
        MVI     G_0345, R1                      ; 66A6   0281 0345
        SDBD                                    ; 66A8   0001
        XORI    #$0800, R1                      ; 66A9   03F9 0000 0008
        MVO     R1,     G_0345                  ; 66AC   0241 0345
        PULR    R7                              ; 66AE   02B7

L_66AF:
        PSHR    R5                              ; 66AF   0275
        MVII    #$0010, R0                      ; 66B0   02B8 0010
        MVO     R0,     G_01E2                  ; 66B2   0240 01E2

        JSR     R5,     L_66B8                  ; 66B4   0004 0164 02B8

        PULR    R7                              ; 66B7   02B7

L_66B8:
        PSHR    R5                              ; 66B8   0275
        MVI     G_01E2, R2                      ; 66B9   0282 01E2
        TSTR    R2                              ; 66BB   0092
        BEQ     L_66DB                          ; 66BC   0204 001D

        MVII    #$0028, R0                      ; 66BE   02B8 0028

        JSR     R5,     X_RAND2                 ; 66C0   0004 0114 029E

        ADDI    #$003C, R0                      ; 66C3   02F8 003C
        MVO     R0,     G_01DB                  ; 66C5   0240 01DB
        MVII    #$0002, R1                      ; 66C7   02B9 0002
        SDBD                                    ; 66C9   0001
        MVII    #$3200, R3                      ; 66CA   02BB 0000 0032
        XORI    #$0001, R3                      ; 66CD   03FB 0001
        MVII    #$027A, R4                      ; 66CF   02BC 027A

        JSR     R5,     X_PRNUM_RGT             ; 66D1   0004 0118 00C5

        MVII    #$0001, R1                      ; 66D4   02B9 0001
        MVO     R1,     G_0323                  ; 66D6   0241 0323
        DECR    R2                              ; 66D8   0012
        MVO     R2,     G_01E2                  ; 66D9   0242 01E2
L_66DB:
        PULR    R7                              ; 66DB   02B7

        DECLE   $0040,  $0018,  $005C,  $0067   ; 66DC   0040 0018 005C 0067
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66E0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66E4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66E8   0000 0000 0000 0000
        DECLE   $0048,  $0038,  $0067,  $0067   ; 66EC   0048 0038 0067 0067
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66F0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66F4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66F8   0000 0000 0000 0000
        DECLE   $005F,  $0038,  $0070,  $0067   ; 66FC   005F 0038 0070 0067
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6700   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6704   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $0000,  $0000   ; 6708   00FF 00FF 0000 0000
        DECLE   $004F,  $0018,  $0077,  $0067   ; 670C   004F 0018 0077 0067
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6710   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6714   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6718   0000 0000 0000 0000
        DECLE   $0040,  $0038,  $0098,  $0067   ; 671C   0040 0038 0098 0067
        DECLE   $0000,  $0018,  $0000,  $0058   ; 6720   0000 0018 0000 0058
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6724   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6728   0000 0000 0000 0000

        RLC     R0,     1                       ; 672C   0050
        RSWD    R0                              ; 672D   0038
        MOVR    R3,     R7                      ; 672E   009F

        DECLE   $0067,  $0000,  $0022,  $0000   ; 672F   0067 0000 0022 0000
        DECLE   $0056,  $0000,  $0000,  $0000   ; 6733   0056 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6737   0000 0000 0000 0000
        DECLE   $0000,  $0050,  $0038,  $00A8   ; 673B   0000 0050 0038 00A8
        DECLE   $0067,  $0000,  $0012,  $0000   ; 673F   0067 0000 0012 0000
        DECLE   $0056,  $0000,  $0000,  $0000   ; 6743   0056 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6747   0000 0000 0000

        MOVR    R0,     R5                      ; 674A   0085
        SWAP    R0,     1                       ; 674B   0040
        ADDR    R3,     R3                      ; 674C   00DB
        COMR    R0                              ; 674D   0018
        MOVR    R5,     R7                      ; 674E   00AF

        DECLE   $0067,  $0000,  $0058,  $0000   ; 674F   0067 0000 0058 0000
        DECLE   $0052,  $0000,  $0000,  $0000   ; 6753   0052 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00CD   ; 6757   0000 0000 0000 00CD
        DECLE   $0047,  $0001,  $0065,  $00B8   ; 675B   0047 0001 0065 00B8
        DECLE   $0066,  $0001,  $0000,  $0004   ; 675F   0066 0001 0000 0004
        DECLE   $0209,  $0065,  $0301,  $0165   ; 6763   0209 0065 0301 0165
        DECLE   $03CB,  $0065,  $0000,  $0000   ; 6767   03CB 0065 0000 0000
        DECLE   $0003,  $0002,  $0002,  $0336   ; 676B   0003 0002 0002 0336
        DECLE   $0166,  $0000,  $0000,  $0032   ; 676F   0166 0000 0000 0032
        DECLE   $006D,  $0001,  $0008,  $0000   ; 6773   006D 0001 0008 0000
        DECLE   $03B0,  $0064,  $0000,  $0000   ; 6777   03B0 0064 0000 0000
        DECLE   $0002,  $0010,  $0004,  $0191   ; 677B   0002 0010 0004 0191
        DECLE   $0165,  $03A9,  $0164,  $03B0   ; 677F   0165 03A9 0164 03B0
        DECLE   $0064,  $0000,  $0000,  $0002   ; 6783   0064 0000 0000 0002
        DECLE   $0014,  $0004,  $0191,  $0165   ; 6787   0014 0004 0191 0165
        DECLE   $03A9,  $0164,  $03B0,  $0064   ; 678B   03A9 0164 03B0 0064
        DECLE   $0000,  $0000,  $0002,  $0018   ; 678F   0000 0000 0002 0018
        DECLE   $0004,  $0191,  $0165,  $03A9   ; 6793   0004 0191 0165 03A9
        DECLE   $0164,  $03DC,  $0013,  $0069   ; 6797   0164 03DC 0013 0069
        DECLE   $0064,  $0006,  $001C,  $0000   ; 679B   0064 0006 001C 0000
        DECLE   $0000,  $0000,  $00F3,  $0065   ; 679F   0000 0000 00F3 0065
        DECLE   $0008,  $0028,  $0002,  $038F   ; 67A3   0008 0028 0002 038F
        DECLE   $0166,  $0000,  $0000,  $0000   ; 67A7   0166 0000 0000 0000
        DECLE   $0000,  $0008,  $0038,  $0000   ; 67AB   0000 0008 0038 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67AF   0000 0000 0000 0000
        DECLE   $0001,  $0048,  $0000,  $03CB   ; 67B3   0001 0048 0000 03CB
        DECLE   $0065,  $0000,  $0000,  $0003   ; 67B7   0065 0000 0000 0003
        DECLE   $000A,  $0000,  $0000,  $0000   ; 67BB   000A 0000 0000 0000
        DECLE   $005D,  $0065,  $000F,  $004A   ; 67BF   005D 0065 000F 004A
        DECLE   $0000,  $0000,  $0000,  $0032   ; 67C3   0000 0000 0000 0032
        DECLE   $006D,  $000F,  $004A,  $0000   ; 67C7   006D 000F 004A 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67CB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 67CF   0000 0000 0000 0010
        DECLE   $0010,  $0000,  $0000,  $0000   ; 67D3   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67D7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67DB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67DF   0000 0000 0000 0000
        DECLE   $0000,  $007E,  $0081,  $006C   ; 67E3   0000 007E 0081 006C
        DECLE   $0081,  $0081,  $0081,  $0036   ; 67E7   0081 0081 0081 0036
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67EB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67EF   0000 0000 0000 0000
        DECLE   $0000,  $007E,  $0081,  $005A   ; 67F3   0000 007E 0081 005A
        DECLE   $0081,  $0081,  $0081,  $005A   ; 67F7   0081 0081 0081 005A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67FB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67FF   0000 0000 0000 0000
        DECLE   $0000,  $007E,  $0081,  $0036   ; 6803   0000 007E 0081 0036
        DECLE   $0081,  $0081,  $0081,  $006C   ; 6807   0081 0081 0081 006C
        DECLE   $0000,  $0000                   ; 680B   0000 0000
L_680D:
        NEGR    R0                              ; 680D   0020
        DECLE   $0020,  $0010,  $0010,  $00E8   ; 680E   0020 0010 0010 00E8
        DECLE   $0028,  $007C,  $0074,  $00FF   ; 6812   0028 007C 0074 00FF
        DECLE   $0081,  $00FF,  $00FF,  $00FF   ; 6816   0081 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 681A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 681E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $007E,  $0081   ; 6822   0000 0000 007E 0081
        DECLE   $0036,  $0081,  $0081,  $0081   ; 6826   0036 0081 0081 0081
        DECLE   $006C,  $0000,  $0000,  $0000   ; 682A   006C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 682E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $007E,  $0081   ; 6832   0000 0000 007E 0081
        DECLE   $005A,  $0081,  $0081,  $0081   ; 6836   005A 0081 0081 0081
        DECLE   $005A,  $0000,  $0000,  $0000   ; 683A   005A 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 683E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $007E,  $0081   ; 6842   0000 0000 007E 0081
        DECLE   $006C,  $0081,  $0081,  $0081   ; 6846   006C 0081 0081 0081
        DECLE   $0036,  $0000,  $0080,  $0040   ; 684A   0036 0000 0080 0040
        DECLE   $0020,  $0010,  $000C,  $000A   ; 684E   0020 0010 000C 000A
        DECLE   $0004,  $0000,  $0000,  $0000   ; 6852   0004 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6856   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0040   ; 685A   0000 0000 0080 0040
        DECLE   $0020,  $0010,  $000C,  $000A   ; 685E   0020 0010 000C 000A
        DECLE   $0004,  $0001,  $0000,  $0000   ; 6862   0004 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6866   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 686A   0000 0000 0000 0000
        DECLE   $0002,  $00FC,  $0002,  $0000   ; 686E   0002 00FC 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6872   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6876   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 687A   0000 0000 0000 0000
        DECLE   $0002,  $00FD,  $0002,  $0000   ; 687E   0002 00FD 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6882   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6886   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 688A   0000 0000 0000 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; 688E   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; 6892   0010 0010 0010 0010
        DECLE   $0028,  $0028,  $0000,  $0000   ; 6896   0028 0028 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 689A   0000 0000 0000 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; 689E   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; 68A2   0010 0010 0010 0010
        DECLE   $0028,  $0028,  $0000,  $0010   ; 68A6   0028 0028 0000 0010
        DECLE   $0000,  $0008,  $0008,  $000C   ; 68AA   0000 0008 0008 000C
        DECLE   $000C,  $000E,  $0006,  $0007   ; 68AE   000C 000E 0006 0007
        DECLE   $000F,  $0013,  $003F,  $002B   ; 68B2   000F 0013 003F 002B
        DECLE   $003F,  $003B,  $003F           ; 68B6   003F 003B 003F

        SARC    R2,     1                       ; 68B9   007A
        MOVR    R2,     R7                      ; 68BA   0097

        DECLE   $0008,  $0008,  $000C,  $000C   ; 68BB   0008 0008 000C 000C
        DECLE   $000E,  $0006,  $0007,  $000F   ; 68BF   000E 0006 0007 000F
        DECLE   $0013,  $003F,  $003B,  $001F   ; 68C3   0013 003F 003B 001F
        DECLE   $003B,  $003F                   ; 68C7   003B 003F

        SARC    R2,     1                       ; 68C9   007A
        MOVR    R2,     R7                      ; 68CA   0097

        DECLE   $0008,  $0008,  $000C,  $000C   ; 68CB   0008 0008 000C 000C
        DECLE   $000E,  $0006,  $0007,  $000F   ; 68CF   000E 0006 0007 000F
        DECLE   $0013,  $003F,  $003B,  $003F   ; 68D3   0013 003F 003B 003F
        DECLE   $001B,  $003F                   ; 68D7   001B 003F

        SARC    R2,     1                       ; 68D9   007A
        MOVR    R2,     R7                      ; 68DA   0097

        DECLE   $0008,  $0008,  $000C,  $000C   ; 68DB   0008 0008 000C 000C
        DECLE   $000E,  $0006,  $0007,  $000F   ; 68DF   000E 0006 0007 000F
        DECLE   $0013,  $003F,  $003B,  $003F   ; 68E3   0013 003F 003B 003F

        RSWD    R3                              ; 68E7   003B
        ADCR    R7                              ; 68E8   002F

        SARC    R2,     1                       ; 68E9   007A
L_68EA:
        MOVR    R2,     R7                      ; 68EA   0097

        DECLE   $0008,  $0008,  $000C,  $000C   ; 68EB   0008 0008 000C 000C
        DECLE   $000E,  $0006,  $0007,  $000F   ; 68EF   000E 0006 0007 000F
        DECLE   $0013,  $003F,  $003B,  $003F   ; 68F3   0013 003F 003B 003F
        DECLE   $0033,  $003F                   ; 68F7   0033 003F

        SARC    R2,     1                       ; 68F9   007A
        MOVR    R2,     R7                      ; 68FA   0097

        DECLE   $0008,  $0008,  $000C,  $000C   ; 68FB   0008 0008 000C 000C
        DECLE   $000E,  $0006,  $0007,  $000F   ; 68FF   000E 0006 0007 000F
        DECLE   $0013,  $003F,  $003B,  $0037   ; 6903   0013 003F 003B 0037
        DECLE   $003B,  $003F                   ; 6907   003B 003F

        SARC    R2,     1                       ; 6909   007A
        MOVR    R2,     R7                      ; 690A   0097

        DECLE   $0000,  $0000,  $0000,  $0000   ; 690B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 690F   0000 0000 0000 0000
        DECLE   $00E0,  $00FE,  $00FE,  $00FE   ; 6913   00E0 00FE 00FE 00FE
        DECLE   $00E0,  $0000,  $0000,  $0000   ; 6917   00E0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 691B   0000 0000 0000 0000
        DECLE   $0000,  $0003,  $00FF,  $00FF   ; 691F   0000 0003 00FF 00FF
        DECLE   $00FC,  $00F0,  $00C0,  $0000   ; 6923   00FC 00F0 00C0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6927   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0003   ; 692B   0000 0000 0000 0003
        DECLE   $0007,  $001F,  $003E,  $007C   ; 692F   0007 001F 003E 007C
        DECLE   $00F8,  $00F0,  $00E0,  $00C0   ; 6933   00F8 00F0 00E0 00C0
        DECLE   $0080,  $0000,  $0000,  $0000   ; 6937   0080 0000 0000 0000
        DECLE   $0002,  $0006,  $000E,  $000C   ; 693B   0002 0006 000E 000C
        DECLE   $001C,  $0038,  $0078,  $00F0   ; 693F   001C 0038 0078 00F0
        DECLE   $00E0,  $00E0,  $00E0,  $00C0   ; 6943   00E0 00E0 00E0 00C0
        DECLE   $0080,  $0080,  $0080,  $0000   ; 6947   0080 0080 0080 0000
        DECLE   $0003,  $0003,  $0007,  $0006   ; 694B   0003 0003 0007 0006
        DECLE   $000E,  $001C,  $001C,  $0038   ; 694F   000E 001C 001C 0038
        DECLE   $0078,  $0070,  $00F0,  $00E0   ; 6953   0078 0070 00F0 00E0
        DECLE   $00E0,  $00C0,  $00C0,  $0080   ; 6957   00E0 00C0 00C0 0080
        DECLE   $0003,  $0003,  $0007,  $0006   ; 695B   0003 0003 0007 0006
        DECLE   $000E,  $001C,  $001C,  $0038   ; 695F   000E 001C 001C 0038
        DECLE   $0078,  $0070,  $00F0,  $00E0   ; 6963   0078 0070 00F0 00E0
        DECLE   $00E0,  $00C0,  $00C0,  $0080   ; 6967   00E0 00C0 00C0 0080
        DECLE   $0006,  $0006,  $000E,  $000C   ; 696B   0006 0006 000E 000C
        DECLE   $000C,  $000C,  $0018,  $0018   ; 696F   000C 000C 0018 0018
        DECLE   $0018,  $0038,  $0030,  $0030   ; 6973   0018 0038 0030 0030
        DECLE   $0070,  $0070,  $0070,  $00E0   ; 6977   0070 0070 0070 00E0
        DECLE   $0006,  $0006,  $000E,  $000C   ; 697B   0006 0006 000E 000C
        DECLE   $000C,  $000C,  $0018,  $0018   ; 697F   000C 000C 0018 0018
        DECLE   $0018,  $0038,  $0030,  $0030   ; 6983   0018 0038 0030 0030
        DECLE   $0070,  $0070,  $0070,  $00E0   ; 6987   0070 0070 0070 00E0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 698B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 698F   0000 0000 0000 0000
        DECLE   $0007,  $0007,  $0007,  $0007   ; 6993   0007 0007 0007 0007
        DECLE   $0007,  $0000,  $0000,  $0000   ; 6997   0007 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 699B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 699F   0000 0000 0000 0001
        DECLE   $0003,  $0003,  $0003,  $0001   ; 69A3   0003 0003 0003 0001
        DECLE   $0001,  $0000,  $0000,  $0000   ; 69A7   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69AB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69AF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69BB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69BF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69C3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69C7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69CB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69CF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69D3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69D7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69DB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69DF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69EB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69EF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69FB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69FF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A03   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A07   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00F1,  $00FF   ; 6A0B   00FF 00FF 00F1 00FF
        DECLE   $0027,  $00FF,  $0089,  $00FF   ; 6A0F   0027 00FF 0089 00FF
        DECLE   $00E4,  $00FF,  $0049,  $00FF   ; 6A13   00E4 00FF 0049 00FF
        DECLE   $00E2,  $00FF,  $0000,  $0000   ; 6A17   00E2 00FF 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6A1B   0000 0000 0000 0018
        DECLE   $0020,  $0000,  $0004,  $0021   ; 6A1F   0020 0000 0004 0021
        DECLE   $0035,  $0044,  $0018,  $0018   ; 6A23   0035 0044 0018 0018
        DECLE   $0006,  $0000,  $0000,  $0000   ; 6A27   0006 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6A2B   0000 0000 0000 0018
        DECLE   $00E4,  $0030,  $0064,  $0023   ; 6A2F   00E4 0030 0064 0023
        DECLE   $0025,  $0048,  $0028,  $0020   ; 6A33   0025 0048 0028 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A37   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6A3B   0000 0000 0000 0018
        DECLE   $0004,  $0030,  $0004           ; 6A3F   0004 0030 0004
L_6A42:
        DECR    R7                              ; 6A42   0017

        DECLE   $0002,  $0009,  $003A,  $0030   ; 6A43   0002 0009 003A 0030
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A47   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $0018   ; 6A4B   0000 0000 0040 0018
        DECLE   $0004                           ; 6A4F   0004

        GSWD    R0                              ; 6A50   0030

        JSR     R4,     .EXEC.041               ; 6A51   0004 0010 0041
        DECLE   $0012,  $005A,  $0050,  $0002   ; 6A54   0012 005A 0050 0002
        DECLE   $0002,  $0000,  $0000,  $0000   ; 6A58   0002 0000 0000 0000
        DECLE   $0000,  $0040,  $0018,  $0004   ; 6A5C   0000 0040 0018 0004
        DECLE   $0030,  $0005,  $0010,  $0041   ; 6A60   0030 0005 0010 0041
        DECLE   $0012,  $005A,  $0050,  $000A   ; 6A64   0012 005A 0050 000A
        DECLE   $0082,  $0008,  $0080,  $0000   ; 6A68   0082 0008 0080 0000
        DECLE   $0080,  $0046,  $0018,  $0004   ; 6A6C   0080 0046 0018 0004
        DECLE   $0030,  $0005,  $0000,  $0049   ; 6A70   0030 0005 0000 0049
        DECLE   $0002,  $0022,  $0068,  $0032   ; 6A74   0002 0022 0068 0032
        DECLE   $0042,  $0088,  $0084,  $0000   ; 6A78   0042 0088 0084 0000
        DECLE   $0080,  $0055,  $000A,  $003C   ; 6A7C   0080 0055 000A 003C
        DECLE   $0040,  $007B,  $0040,  $0091   ; 6A80   0040 007B 0040 0091
        DECLE   $0000,  $0002,  $0040,  $0032   ; 6A84   0000 0002 0040 0032
        DECLE   $0042,  $0088,  $0084,  $0000   ; 6A88   0042 0088 0084 0000
        DECLE   $0088,  $0055,  $0002,  $0054   ; 6A8C   0088 0055 0002 0054
        DECLE   $004C,  $001B,  $0046,  $0091   ; 6A90   004C 001B 0046 0091
        DECLE   $0000,  $0002,  $0040,  $0032   ; 6A94   0000 0002 0040 0032
        DECLE   $0042,  $0088,  $0084,  $0080   ; 6A98   0042 0088 0084 0080
        DECLE   $0068,  $0030,  $0005,  $0058   ; 6A9C   0068 0030 0005 0058
        DECLE   $0058,  $0000,  $0041,  $009D   ; 6AA0   0058 0000 0041 009D
        DECLE   $0000,  $0002,  $0040,  $0032   ; 6AA4   0000 0002 0040 0032
        DECLE   $0042,  $0088,  $0084,  $0000   ; 6AA8   0042 0088 0084 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB8   0000 0000 0000 0000
        DECLE   $0000,  $0006,  $0050,  $0040   ; 6ABC   0000 0006 0050 0040
        DECLE   $0030,  $0000,  $0000,  $0059   ; 6AC0   0030 0000 0000 0059
        DECLE   $0040,  $0004,  $0000,  $0064   ; 6AC4   0040 0004 0000 0064
        DECLE   $0000,  $0002,  $0000,  $0010   ; 6AC8   0000 0002 0000 0010
        DECLE   $0000,  $00A6,  $0050,  $0040   ; 6ACC   0000 00A6 0050 0040
        DECLE   $0030,  $0000,  $0000,  $0041   ; 6AD0   0030 0000 0000 0041
        DECLE   $0040,  $00C4,  $0000,  $0064   ; 6AD4   0040 00C4 0000 0064
        DECLE   $0050,  $0002,  $0000,  $0000   ; 6AD8   0050 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ADC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AE8   0000 0000 0000 0000
        DECLE   $0000,  $0042,  $0040,  $0000   ; 6AEC   0000 0042 0040 0000
        DECLE   $0010,  $0000,  $0000,  $0000   ; 6AF0   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0012   ; 6AF4   0000 0000 0000 0012
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AF8   0000 0000 0000 0000
        DECLE   $0000,  $0042,  $0040,  $0080   ; 6AFC   0000 0042 0040 0080
        DECLE   $0010,  $0000,  $0082,  $0040   ; 6B00   0010 0000 0082 0040
        DECLE   $0000,  $0000,  $0000,  $0012   ; 6B04   0000 0000 0000 0012
        DECLE   $0000,  $0001,  $0080,  $0000   ; 6B08   0000 0001 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6B18   0000 0000 0000

        INCR    R4                              ; 6B1B   000C
        COMR    R0                              ; 6B1C   0018
        NEGR    R4                              ; 6B1D   0024
        GSWD    R0                              ; 6B1E   0030
        RSWD    R4                              ; 6B1F   003C
        SLL     R0,     1                       ; 6B20   0048
        RLC     R0,     2                       ; 6B21   0054
        SLLC    R3,     1                       ; 6B22   005B
        DECR    R3                              ; 6B23   0013
        DECR    R5                              ; 6B24   0015
        DECR    R5                              ; 6B25   0015
        DECR    R4                              ; 6B26   0014
        DECR    R1                              ; 6B27   0011
        INCR    R7                              ; 6B28   000F

        INCR    R3                              ; 6B29   000B
L_6B2A:
        INCR    R3                              ; 6B2A   000B
        DECLE   $0000,  $03FE,  $03FD,  $03FA   ; 6B2B   0000 03FE 03FD 03FA
        DECLE   $03F7,  $03F6,  $03F6,  $03F6   ; 6B2F   03F7 03F6 03F6 03F6
        DECLE   $0000,  $0005,  $000A,  $0010   ; 6B33   0000 0005 000A 0010
        DECLE   $0015,  $001A,  $001F,  $0024   ; 6B37   0015 001A 001F 0024
        DECLE   $0029,  $002D,  $0032,  $0036   ; 6B3B   0029 002D 0032 0036
        DECLE   $003B,  $003F,  $0043,  $0047   ; 6B3F   003B 003F 0043 0047
        DECLE   $004A,  $004E,  $0051,  $0054   ; 6B43   004A 004E 0051 0054
        DECLE   $0057,  $0059,  $005B,  $005D   ; 6B47   0057 0059 005B 005D
        DECLE   $005F,  $0061,  $0062,  $0063   ; 6B4B   005F 0061 0062 0063
        DECLE   $0063,  $0063,  $0064,  $0029   ; 6B4F   0063 0063 0064 0029
        DECLE   $002D,  $0032,  $0036,  $003B   ; 6B53   002D 0032 0036 003B
        DECLE   $003F                           ; 6B57   003F

        SWAP    R3,     1                       ; 6B58   0043
        SWAP    R3,     2                       ; 6B59   0047
        SLL     R2,     1                       ; 6B5A   004A
        SLL     R2,     2                       ; 6B5B   004E
        RLC     R1,     1                       ; 6B5C   0051
        RLC     R0,     2                       ; 6B5D   0054
        RLC     R3,     2                       ; 6B5E   0057
        SLLC    R1,     1                       ; 6B5F   0059
        SLLC    R3,     1                       ; 6B60   005B
        SLLC    R1,     2                       ; 6B61   005D
        SLLC    R3,     2                       ; 6B62   005F
        SLR     R1,     1                       ; 6B63   0061
        SLR     R2,     1                       ; 6B64   0062
        SLR     R3,     1                       ; 6B65   0063
        SLR     R3,     1                       ; 6B66   0063
        SLR     R3,     1                       ; 6B67   0063
        SLR     R0,     2                       ; 6B68   0064
        MVI     G_01DA, R0                      ; 6B69   0280 01DA

        JSR     R5,     X_CLAMP                 ; 6B6B   0004 0114 0270
        DECLE   $0000                           ; 6B6E   0000

        SLLC    R2,     1                       ; 6B6F   005A
        MVO     R0,     G_01DA                  ; 6B70   0240 01DA
        MVO     R0,     G_01D9                  ; 6B72   0240 01D9
        MVO     R0,     G_01DD                  ; 6B74   0240 01DD
        SDBD                                    ; 6B76   0001
        MVII    #$6B1B, R3                      ; 6B77   02BB 001B 006B
        MOVR    R3,     R5                      ; 6B7A   009D
L_6B7B:
        CMP@    R5,     R0                      ; 6B7B   0368
        BC      L_6B7B                          ; 6B7C   0221 0002

        SUBR    R3,     R5                      ; 6B7E   011D
        SUBI    #$0001, R5                      ; 6B7F   033D 0001
        MVO     R5,     G_01D6                  ; 6B81   0245 01D6

        JSR     R5,     L_6C83                  ; 6B83   0004 016C 0083

        MVII    #$0002, R1                      ; 6B86   02B9 0002
        MVII    #$028E, R4                      ; 6B88   02BC 028E
        SDBD                                    ; 6B8A   0001
        MVII    #$3201, R3                      ; 6B8B   02BB 0001 0032

        JSR     R5,     X_PRNUM_RGT             ; 6B8E   0004 0118 00C5

        MVII    #$0001, R0                      ; 6B91   02B8 0001
        PULR    R7                              ; 6B93   02B7

        MVI     G_01D7, R0                      ; 6B94   0280 01D7

        JSR     R5,     X_CLAMP                 ; 6B96   0004 0114 0270

        DECR    R6                              ; 6B99   0016
        SARC    R0,     1                       ; 6B9A   0078
        MVO     R0,     G_01D8                  ; 6B9B   0240 01D8
        MVI     G_033F, R1                      ; 6B9D   0281 033F
        SLR     R1,     2                       ; 6B9F   0065
        SLR     R1,     2                       ; 6BA0   0065
        SLR     R1,     2                       ; 6BA1   0065
        SLR     R1,     2                       ; 6BA2   0065
        CMPR    R1,     R0                      ; 6BA3   0148
        BEQ     L_6BB0                          ; 6BA4   0204 000A
        BNC     L_6BAC                          ; 6BA6   0209 0004

        MVII    #$0000, R0                      ; 6BA8   02B8 0000
        B       L_6BCE                          ; 6BAA   0200 0022

L_6BAC:
        MVII    #$0008, R0                      ; 6BAC   02B8 0008
        B       L_6BCE                          ; 6BAE   0200 001E

L_6BB0:
        SDBD                                    ; 6BB0   0001
        MVII    #$FFFF, R0                      ; 6BB1   02B8 00FF 00FF
        B       L_6BCE                          ; 6BB4   0200 0018

        JSR     R5,     L_D5AA                  ; 6BB6   0004 01D4 01AA

        MVI     G_01D0, R0                      ; 6BB9   0280 01D0
        CMPI    #$0001, R0                      ; 6BBB   0378 0001
        BNEQ    L_6BC5                          ; 6BBD   020C 0006

        MVII    #$0001, R0                      ; 6BBF   02B8 0001
        MVO     R0,     G_0333                  ; 6BC1   0240 0333
        MVO     R0,     G_01D5                  ; 6BC3   0240 01D5
L_6BC5:
        MVII    #$0001, R0                      ; 6BC5   02B8 0001
        PULR    R7                              ; 6BC7   02B7

        TSTR    R1                              ; 6BC8   0089
        BEQ     L_6BCD                          ; 6BC9   0204 0002
        B       L_6C14                          ; 6BCB   0200 0047

L_6BCD:
        PSHR    R5                              ; 6BCD   0275
L_6BCE:
        TSTR    R0                              ; 6BCE   0080
        BMI     L_6BF4                          ; 6BCF   020B 0023

        DECR    R0                              ; 6BD1   0010
        DECR    R0                              ; 6BD2   0010
        BMI     L_6BF1                          ; 6BD3   020B 001C

        CMPI    #$0004, R0                      ; 6BD5   0378 0004
        BGT     L_6BDF                          ; 6BD7   020E 0006

        MVII    #$0001, R2                      ; 6BD9   02BA 0001
        MVO     R2,     G_01DE                  ; 6BDB   0242 01DE
        B       L_6BF9                          ; 6BDD   0200 001A

L_6BDF:
        CMPI    #$0007, R0                      ; 6BDF   0378 0007
        BGT     L_6BE7                          ; 6BE1   020E 0004

        MVII    #$0008, R1                      ; 6BE3   02B9 0008
        B       L_6BFB                          ; 6BE5   0200 0014

L_6BE7:
        CMPI    #$000C, R0                      ; 6BE7   0378 000C
        BGT     L_6BF1                          ; 6BE9   020E 0006

        MVII    #$0002, R1                      ; 6BEB   02B9 0002
        MVO     R1,     G_01DE                  ; 6BED   0241 01DE
        B       L_6BF9                          ; 6BEF   0200 0008

L_6BF1:
        CLRR    R1                              ; 6BF1   01C9
        B       L_6BFB                          ; 6BF2   0200 0007

L_6BF4:
        CLRR    R0                              ; 6BF4   01C0
        MVO     R0,     G_01DE                  ; 6BF5   0240 01DE
        MVO     R0,     G_0341                  ; 6BF7   0240 0341
L_6BF9:
        INCR    R0                              ; 6BF9   0008
        PULR    R7                              ; 6BFA   02B7

L_6BFB:
        MVII    #$000F, R0                      ; 6BFB   02B8 000F

        JSR     R5,     .EXEC.629               ; 6BFD   0004 0114 0229

        MVO     R0,     G_0341                  ; 6C00   0240 0341
        MVII    #$0001, R0                      ; 6C02   02B8 0001
        PULR    R7                              ; 6C04   02B7

L_6C05:
        PSHR    R5                              ; 6C05   0275
        MVI     G_01D8, R0                      ; 6C06   0280 01D8
        MVI     G_033F, R1                      ; 6C08   0281 033F
        SWAP    R1,     1                       ; 6C0A   0041
        ANDI    #$00FF, R1                      ; 6C0B   03B9 00FF
        CMPR    R0,     R1                      ; 6C0D   0141
        BNEQ    L_6C13                          ; 6C0E   020C 0003

        CLRR    R0                              ; 6C10   01C0
        MVO     R0,     G_0341                  ; 6C11   0240 0341
L_6C13:
        PULR    R7                              ; 6C13   02B7

L_6C14:
        PSHR    R5                              ; 6C14   0275
        CLRR    R1                              ; 6C15   01C9
        DECR    R1                              ; 6C16   0011
        MVO     R1,     G_0333                  ; 6C17   0241 0333
        MVI     G_0335, R1                      ; 6C19   0281 0335
        SDBD                                    ; 6C1B   0001
        MVII    #$9042, R2                      ; 6C1C   02BA 0042 0090
        CMPR    R1,     R2                      ; 6C1F   014A
        BEQ     L_6C3D                          ; 6C20   0204 001B

        MVO     R0,     G_01EB                  ; 6C22   0240 01EB
        MVI     G_01D3, R2                      ; 6C24   0282 01D3
        TSTR    R2                              ; 6C26   0092
        BEQ     L_6C3E                          ; 6C27   0204 0015

        MVII    #$029C, R4                      ; 6C29   02BC 029C
        MVII    #$0002, R1                      ; 6C2B   02B9 0002
        SDBD                                    ; 6C2D   0001
        MVII    #$3201, R3                      ; 6C2E   02BB 0001 0032
        TSTR    R0                              ; 6C31   0080
        BMI     L_6C3E                          ; 6C32   020B 000A

        JSR     R5,     L_6D0B                  ; 6C34   0004 016C 010B

        SDBD                                    ; 6C37   0001
        MVII    #$0FF0, R0                      ; 6C38   02B8 00F0 000F
        MVO     R0,     G_033A                  ; 6C3B   0240 033A
L_6C3D:
        PULR    R7                              ; 6C3D   02B7

L_6C3E:
        MVII    #$0299, R4                      ; 6C3E   02BC 0299
        SDBD                                    ; 6C40   0001
        MVII    #$3200, R1                      ; 6C41   02B9 0000 0032
        MVII    #$0007, R0                      ; 6C44   02B8 0007

        JSR     R5,     X_FILL_MEM              ; 6C46   0004 0114 0341

        CLRR    R0                              ; 6C49   01C0
        MVO     R0,     G_033A                  ; 6C4A   0240 033A
        PULR    R7                              ; 6C4C   02B7

        MVI     G_01EB, R0                      ; 6C4D   0280 01EB
        SLR     R0,     2                       ; 6C4F   0064
        SLL     R0,     2                       ; 6C50   004C
        ADDR    R0,     R7                      ; 6C51   00C7

        MVII    #$001A, R1                      ; 6C52   02B9 001A
        B       L_6C60                          ; 6C54   0200 000A

        MVII    #$0018, R1                      ; 6C56   02B9 0018
        B       L_6C60                          ; 6C58   0200 0006

        MVII    #$001C, R1                      ; 6C5A   02B9 001C
        B       L_6C60                          ; 6C5C   0200 0002

        MVII    #$001E, R1                      ; 6C5E   02B9 001E
L_6C60:
        MVII    #$004F, R2                      ; 6C60   02BA 004F
        SWAP    R1,     1                       ; 6C62   0041
        XORR    R2,     R1                      ; 6C63   01D1
        MVO     R1,     G_0335                  ; 6C64   0241 0335
        PULR    R7                              ; 6C66   02B7

        PSHR    R5                              ; 6C67   0275
        MVI     G_01E6, R1                      ; 6C68   0281 01E6
        TSTR    R1                              ; 6C6A   0089
        BNEQ    L_6C82                          ; 6C6B   020C 0015

        JSR     R5,     L_6C83                  ; 6C6D   0004 016C 0083
        JSR     R5,     L_6C05                  ; 6C70   0004 016C 0005

        CLRR    R1                              ; 6C73   01C9
        MVI     G_01DE, R2                      ; 6C74   0282 01DE
        MVII    #$028E, R4                      ; 6C76   02BC 028E
        MVI     G_01DD, R0                      ; 6C78   0280 01DD

        JSR     R5,     L_6CB4                  ; 6C7A   0004 016C 00B4

        MVO     R0,     G_01DD                  ; 6C7D   0240 01DD

        JSR     R5,     L_6CA8                  ; 6C7F   0004 016C 00A8

L_6C82:
        PULR    R7                              ; 6C82   02B7

L_6C83:
        PSHR    R5                              ; 6C83   0275
        MVI     G_01D6, R1                      ; 6C84   0281 01D6
        MVO     R1,     G_034A                  ; 6C86   0241 034A

        JSR     R5,     L_6C98                  ; 6C88   0004 016C 0098

        MVO     R1,     G_0352                  ; 6C8B   0241 0352
        SLL     R1,     1                       ; 6C8D   0049
        SDBD                                    ; 6C8E   0001
        MVII    #$6CFB, R4                      ; 6C8F   02BC 00FB 006C
        ADDR    R1,     R4                      ; 6C92   00CC
        SDBD                                    ; 6C93   0001
        MVI@    R4,     R1                      ; 6C94   02A1
        MVO     R1,     G_0349                  ; 6C95   0241 0349
        PULR    R7                              ; 6C97   02B7

L_6C98:
        PSHR    R5                              ; 6C98   0275
        SDBD                                    ; 6C99   0001
        MVII    #$1850, R2                      ; 6C9A   02BA 0050 0018
        CMPI    #$0003, R1                      ; 6C9D   0379 0003
        BGT     L_6CA5                          ; 6C9F   020E 0004

        SDBD                                    ; 6CA1   0001
        XORI    #$2000, R2                      ; 6CA2   03FA 0000 0020
L_6CA5:
        MVO     R2,     G_0345                  ; 6CA5   0242 0345
        PULR    R7                              ; 6CA7   02B7

L_6CA8:
        PSHR    R5                              ; 6CA8   0275
        MVI     G_01D9, R1                      ; 6CA9   0281 01D9
        CMPR    R1,     R0                      ; 6CAB   0148
        BNEQ    L_6CB3                          ; 6CAC   020C 0005

        CLRR    R1                              ; 6CAE   01C9
        MVO     R1,     G_01DE                  ; 6CAF   0241 01DE
        MVO     R1,     G_01D9                  ; 6CB1   0241 01D9
L_6CB3:
        PULR    R7                              ; 6CB3   02B7

L_6CB4:
        PSHR    R5                              ; 6CB4   0275
        TSTR    R2                              ; 6CB5   0092
        BEQ     L_6CFA                          ; 6CB6   0204 0042

        CMPI    #$0001, R2                      ; 6CB8   037A 0001
        BEQ     L_6CC2                          ; 6CBA   0204 0006

        CMPI    #$0002, R2                      ; 6CBC   037A 0002
        BEQ     L_6CC9                          ; 6CBE   0204 0009
        B       L_6CFA                          ; 6CC0   0200 0038

L_6CC2:
        CMPI    #$005A, R0                      ; 6CC2   0378 005A
        BC      L_6CFA                          ; 6CC4   0201 0034

        INCR    R0                              ; 6CC6   0008
        B       L_6CCF                          ; 6CC7   0200 0006

L_6CC9:
        TSTR    R0                              ; 6CC9   0080
        BEQ     L_6CFA                          ; 6CCA   0204 002E

        DECR    R0                              ; 6CCC   0010
        B       L_6CCF                          ; 6CCD   0200 0000

L_6CCF:
        SDBD                                    ; 6CCF   0001
        MVII    #$6B1B, R3                      ; 6CD0   02BB 001B 006B
        SDBD                                    ; 6CD3   0001
        MVII    #$6B1B, R5                      ; 6CD4   02BD 001B 006B
L_6CD7:
        CMP@    R5,     R0                      ; 6CD7   0368
        BC      L_6CD7                          ; 6CD8   0221 0002

        SUBR    R3,     R5                      ; 6CDA   011D
        SUBI    #$0001, R5                      ; 6CDB   033D 0001
        MVO     R5,     G_01D6                  ; 6CDD   0245 01D6
        SDBD                                    ; 6CDF   0001
        MVII    #$3201, R3                      ; 6CE0   02BB 0001 0032
        B       L_6CF3                          ; 6CE3   0200 000E

        SDBD                                    ; 6CE5   0001
        MVII    #$3201, R3                      ; 6CE6   02BB 0001 0032
        MVII    #$0000, R5                      ; 6CE9   02BD 0000
        MVO     R5,     G_0332                  ; 6CEB   0245 0332
        B       L_6CF3                          ; 6CED   0200 0004

        SDBD                                    ; 6CEF   0001
        MVII    #$3201, R3                      ; 6CF0   02BB 0001 0032
L_6CF3:
        MVII    #$0002, R1                      ; 6CF3   02B9 0002
        PSHR    R0                              ; 6CF5   0270

        JSR     R5,     X_PRNUM_RGT             ; 6CF6   0004 0118 00C5

        PULR    R0                              ; 6CF9   02B0
L_6CFA:
        PULR    R7                              ; 6CFA   02B7

        ADDR    R7,     R6                      ; 6CFB   00FE
        INCR    R2                              ; 6CFC   000A
        ADDR    R7,     R6                      ; 6CFD   00FE
        INCR    R2                              ; 6CFE   000A
        ADDR    R7,     R6                      ; 6CFF   00FE
        INCR    R2                              ; 6D00   000A
        ADDR    R7,     R6                      ; 6D01   00FE
        INCR    R2                              ; 6D02   000A
        ADDR    R7,     R4                      ; 6D03   00FC
        INCR    R5                              ; 6D04   000D
        ADDR    R7,     R4                      ; 6D05   00FC
        INCR    R3                              ; 6D06   000B
        ADDR    R7,     R2                      ; 6D07   00FA
        INCR    R0                              ; 6D08   0008
        ADDR    R7,     R2                      ; 6D09   00FA
        INCR    R0                              ; 6D0A   0008
L_6D0B:
        PSHR    R5                              ; 6D0B   0275
        MVI     G_01EB, R0                      ; 6D0C   0280 01EB
        SLR     R0,     1                       ; 6D0E   0060
        SDBD                                    ; 6D0F   0001
        MVII    #$6D71, R4                      ; 6D10   02BC 0071 006D
        ADDR    R0,     R4                      ; 6D13   00C4
        MVI@    R4,     R1                      ; 6D14   02A1
        MOVR    R1,     R2                      ; 6D15   008A
        ANDI    #$000F, R1                      ; 6D16   03B9 000F
        ANDI    #$00F0, R2                      ; 6D18   03BA 00F0
        SDBD                                    ; 6D1A   0001
        MVII    #$6777, R4                      ; 6D1B   02BC 0077 0067
        ADDR    R1,     R4                      ; 6D1E   00CC
        ANDI    #$0004, R1                      ; 6D1F   03B9 0004
        TSTR    R1                              ; 6D21   0089
        BEQ     L_6D26                          ; 6D22   0204 0002

        ADDI    #$0007, R4                      ; 6D24   02FC 0007
L_6D26:
        MVO     R4,     G_0336                  ; 6D26   0244 0336
        SDBD                                    ; 6D28   0001
        MVII    #$104F, R3                      ; 6D29   02BB 004F 0010
        SLL     R2,     2                       ; 6D2C   004E
        SLL     R2,     2                       ; 6D2D   004E
        XORR    R2,     R3                      ; 6D2E   01D3
        MVO     R3,     G_0335                  ; 6D2F   0243 0335
        PULR    R7                              ; 6D31   02B7

        DECLE   $0275,  $0001,  $02B9,  $0004   ; 6D32   0275 0001 02B9 0004
        DECLE   $0041,  $0288,  $0009,  $028A   ; 6D36   0041 0288 0009 028A
        DECLE   $0281,  $01D5,  $0148,  $0205   ; 6D3A   0281 01D5 0148 0205
        DECLE   $002D,  $014A,  $0205,  $002A   ; 6D3E   002D 014A 0205 002A
        DECLE   $0009,  $0241,  $01D5,  $0339   ; 6D42   0009 0241 01D5 0339
        DECLE   $0002,  $0001,  $02BC,  $00FE   ; 6D46   0002 0001 02BC 00FE
        DECLE   $0040,  $0001,  $02A3,  $004D   ; 6D4A   0040 0001 02A3 004D
        DECLE   $0274,  $0271,  $00CB,  $02BA   ; 6D4E   0274 0271 00CB 02BA
        DECLE   $0027,  $01C9,  $0004,  $01E4   ; 6D52   0027 01C9 0004 01E4
        DECLE   $01A2,  $004C,  $0240,  $0333   ; 6D56   01A2 004C 0240 0333
        DECLE   $02B1,  $02B4,  $0001,  $02A3   ; 6D5A   02B1 02B4 0001 02A3
        DECLE   $00CB,  $02BC,  $000F,  $0004   ; 6D5E   00CB 02BC 000F 0004
        DECLE   $01E4,  $01DC,  $0080,  $0203   ; 6D62   01E4 01DC 0080 0203
        DECLE   $0002,  $01C0,  $0010,  $0004   ; 6D66   0002 01C0 0010 0004
        DECLE   $036C,  $0018                   ; 6D6A   036C 0018

        CLRR    R1                              ; 6D6C   01C9
        DECR    R1                              ; 6D6D   0011
        MVO     R1,     G_0333                  ; 6D6E   0241 0333
        PULR    R7                              ; 6D70   02B7

        MOVR    R5,     R3                      ; 6D71   00AB
        MOVR    R4,     R0                      ; 6D72   00A0
        MOVR    R1,     R7                      ; 6D73   008F

        TSTR    R0                              ; 6D74   0080
        MOVR    R1,     R3                      ; 6D75   008B
        ADDR    R0,     R0                      ; 6D76   00C0
        ADDR    R1,     R7                      ; 6D77   00CF

        ADDR    R4,     R0                      ; 6D78   00E0
L_6D79:
        PSHR    R5                              ; 6D79   0275
        MVI     G_015D, R0                      ; 6D7A   0280 015D
        ANDI    #$00FE, R0                      ; 6D7C   03B8 00FE
        MVO     R0,     G_015D                  ; 6D7E   0240 015D
        MVII    #$0048, R0                      ; 6D80   02B8 0048
        MVO     R0,     G_01E9                  ; 6D82   0240 01E9
        MVI     .ISRVEC.0,R0                    ; 6D84   0280 0100
        MVO     R0,     G_01E4                  ; 6D86   0240 01E4
        MVI     .ISRVEC.1,R0                    ; 6D88   0280 0101
        MVO     R0,     G_01E5                  ; 6D8A   0240 01E5
        DIS                                     ; 6D8C   0003
        SDBD                                    ; 6D8D   0001
        MVII    #$00B2, R0                      ; 6D8E   02B8 00B2 0000
        MVO     R0,     .ISRVEC.0               ; 6D91   0240 0100
        SDBD                                    ; 6D93   0001
        MVII    #$006D, R0                      ; 6D94   02B8 006D 0000
        MVO     R0,     .ISRVEC.1               ; 6D97   0240 0101
        EIS                                     ; 6D99   0002
L_6D9A:
        MVI     G_01E9, R0                      ; 6D9A   0280 01E9
        TSTR    R0                              ; 6D9C   0080
        BNEQ    L_6D9A                          ; 6D9D   022C 0004

        DIS                                     ; 6D9F   0003
        MVI     G_01E4, R0                      ; 6DA0   0280 01E4
        MVO     R0,     .ISRVEC.0               ; 6DA2   0240 0100
        MVI     G_01E5, R0                      ; 6DA4   0280 01E5
        MVO     R0,     .ISRVEC.1               ; 6DA6   0240 0101
        EIS                                     ; 6DA8   0002
        MVI     G_015D, R0                      ; 6DA9   0280 015D
        ANDI    #$00FE, R0                      ; 6DAB   03B8 00FE
        XORI    #$0001, R0                      ; 6DAD   03F8 0001
        MVO     R0,     G_015D                  ; 6DAF   0240 015D
        PULR    R7                              ; 6DB1   02B7

        PSHR    R5                              ; 6DB2   0275
        CLRR    R0                              ; 6DB3   01C0
        MVO     R0,     .STIC.X.3               ; 6DB4   0240 0003
        MVI     G_01E9, R0                      ; 6DB6   0280 01E9
        DECR    R0                              ; 6DB8   0010
        MVO     R0,     G_01E9                  ; 6DB9   0240 01E9
        BEQ     L_6DD4                          ; 6DBB   0204 0017

        MVII    #$0002, R1                      ; 6DBD   02B9 0002
        MVO     R1,     .STIC.BORD              ; 6DBF   0241 002C
        ANDI    #$0004, R0                      ; 6DC1   03B8 0004
        BEQ     L_6DCE                          ; 6DC3   0204 0009

        MVI     .STIC.HDLY,R0                   ; 6DC5   0280 0030
        INCR    R0                              ; 6DC7   0008
        MVO     R0,     .STIC.BORD              ; 6DC8   0240 002C
        ADDI    #$0004, R0                      ; 6DCA   02F8 0004
L_6DCC:
        MVO     R0,     .STIC.HDLY              ; 6DCC   0240 0030
L_6DCE:
        MVO     R0,     .STIC.VIDEN             ; 6DCE   0240 0020

        JSR     R5,     X_PLAY_NOTE             ; 6DD0   0004 0118 02BD

        PULR    R7                              ; 6DD3   02B7

L_6DD4:
        MVII    #$000B, R0                      ; 6DD4   02B8 000B
        MVO     R0,     .STIC.BORD              ; 6DD6   0240 002C
        CLRR    R0                              ; 6DD8   01C0
        B       L_6DCC                          ; 6DD9   0220 000E

L_6DDB:
        PSHR    R5                              ; 6DDB   0275
        SDBD                                    ; 6DDC   0001
        MVII    #$6F4A, R4                      ; 6DDD   02BC 004A 006F
        MVII    #$02A0, R5                      ; 6DE0   02BD 02A0
L_6DE2:
        SDBD                                    ; 6DE2   0001
        MVI@    R4,     R0                      ; 6DE3   02A0
        MVO@    R0,     R5                      ; 6DE4   0268
        CMPI    #$02C8, R5                      ; 6DE5   037D 02C8
        BNEQ    L_6DE2                          ; 6DE7   022C 0006
        PULR    R7                              ; 6DE9   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6DEE   0000 0000 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000C,  $00FE   ; 6DF6   0000 0000 000C 00FE
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DFA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $007F   ; 6DFE   0000 0000 0000 007F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E02   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00DF   ; 6E06   0000 0000 0000 00DF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E0A   0000 0000 0000 0000
        DECLE   $0000,  $000F,  $00FF,  $00FF   ; 6E0E   0000 000F 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E12   0000 0000 0000 0000
        DECLE   $0000,  $00C0,  $00F0,  $00FF   ; 6E16   0000 00C0 00F0 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E1A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00F0   ; 6E1E   0000 0000 0000 00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E22   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00E1   ; 6E26   0000 0000 0000 00E1
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E2A   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $000F,  $00FF   ; 6E2E   0000 0001 000F 00FF
        DECLE   $0000,  $0000,  $0000,  $0003   ; 6E32   0000 0000 0000 0003
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6E36   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0001,  $0003   ; 6E3A   0000 0000 0001 0003
        DECLE   $00FF,  $00BF,  $00DF,  $006F   ; 6E3E   00FF 00BF 00DF 006F
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 6E42   0000 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6E46   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000           ; 6E4A   0000 0000 0000

        ADDR    R4,     R0                      ; 6E4D   00E0
        ADDR    R3,     R5                      ; 6E4E   00DD
        ADDR    R5,     R7                      ; 6E4F   00EF

        DECLE   $00F7,  $00CF,  $0000,  $0000   ; 6E50   00F7 00CF 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00F0   ; 6E54   0000 0000 0000 00F0
        DECLE   $00FF,  $00FF,  $0000,  $0000   ; 6E58   00FF 00FF 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 6E5C   0000 0000 0000 00C0
        DECLE   $00FC,  $00FF                   ; 6E60   00FC 00FF

        CLRC                                    ; 6E62   0006
        INCR    R7                              ; 6E63   000F

        DECLE   $001F                           ; 6E64   001F
L_6E65:
        SARC    R2,     2                       ; 6E65   007E
        DECLE   $00F7,  $00FA,  $00FC,  $0077   ; 6E66   00F7 00FA 00FC 0077
        DECLE   $00C8,  $00FC,  $007E,  $00DE   ; 6E6A   00C8 00FC 007E 00DE
        DECLE   $00ED,  $00DB,  $00B6,  $000C   ; 6E6E   00ED 00DB 00B6 000C
        DECLE   $0038,  $007C,  $00FF,  $00F7   ; 6E72   0038 007C 00FF 00F7
        DECLE   $00F7                           ; 6E76   00F7

        ADDR    R6,     R5                      ; 6E77   00F5
        ADDR    R5,     R6                      ; 6E78   00EE
        MOVR    R3,     R7                      ; 6E79   009F

        DECLE   $003C,  $00FF                   ; 6E7A   003C 00FF

        ADDR    R7,     R6                      ; 6E7C   00FE
        ADDR    R5,     R6                      ; 6E7D   00EE
        ADDR    R3,     R6                      ; 6E7E   00DE
        ADDR    R3,     R2                      ; 6E7F   00DA
        TSTR    R6                              ; 6E80   00B6
        INCR    R7                              ; 6E81   000F

        DECLE   $00FF                           ; 6E82   00FF
L_6E83:
        ADDR    R0,     R0                      ; 6E83   00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000C,  $0043   ; 6E88   0000 0000 000C 0043
        DECLE   $0011,  $0000,  $0058,  $004C   ; 6E8C   0011 0000 0058 004C
        DECLE   $00C0,  $0000,  $00FF,  $00FF   ; 6E90   00C0 0000 00FF 00FF
        DECLE   $00BF                           ; 6E94   00BF

        INCR    R7                              ; 6E95   000F

        RSWD    R6                              ; 6E96   003E
L_6E97:
        DECR    R0                              ; 6E97   0010
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 6E98   0000 0000 00FF 00FF
        DECLE   $00FF,  $002F,  $0047,  $000F   ; 6E9C   00FF 002F 0047 000F
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 6EA0   0000 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00E6,  $00D0   ; 6EA4   00FF 00FF 00E6 00D0
        DECLE   $00A8,  $0000,  $00FF,  $00FF   ; 6EA8   00A8 0000 00FF 00FF
        DECLE   $00BF,  $004F,  $005F,  $002F   ; 6EAC   00BF 004F 005F 002F
        DECLE   $0007,  $0004,  $00FF,  $00FF   ; 6EB0   0007 0004 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00AF   ; 6EB4   00FF 00FF 00FF 00AF
        DECLE   $001F,  $0003,  $00FF,  $00FF   ; 6EB8   001F 0003 00FF 00FF
        DECLE   $00F4,  $00C0,  $0008,  $00A1   ; 6EBC   00F4 00C0 0008 00A1
        DECLE   $0000,  $00C0,  $00A1,  $0040   ; 6EC0   0000 00C0 00A1 0040
        DECLE   $0002,  $0004,  $0082,  $0090   ; 6EC4   0002 0004 0082 0090
        DECLE   $0020,  $00C1,  $00FF,  $007F   ; 6EC8   0020 00C1 00FF 007F
        DECLE   $0038,  $0000,  $00C0,  $000A   ; 6ECC   0038 0000 00C0 000A
        DECLE   $0004,  $0000,  $00F8,  $0018   ; 6ED0   0004 0000 00F8 0018
        DECLE   $00C0,  $0072,  $0040,  $00B0   ; 6ED4   00C0 0072 0040 00B0
        DECLE   $0003,  $00E3,  $003F,  $0007   ; 6ED8   0003 00E3 003F 0007
        DECLE   $00C3,  $0007,  $0002,  $0015   ; 6EDC   00C3 0007 0002 0015
        DECLE   $000A,  $000D,  $00FF,  $00FF   ; 6EE0   000A 000D 00FF 00FF
        DECLE   $009F,  $004F,  $002F,  $000F   ; 6EE4   009F 004F 002F 000F
        DECLE   $0038,  $0000,  $00FF,  $009F   ; 6EE8   0038 0000 00FF 009F
        DECLE   $004B,  $0000,  $004B,  $005F   ; 6EEC   004B 0000 004B 005F
        DECLE   $0055,  $002A,  $00D8,  $00F0   ; 6EF0   0055 002A 00D8 00F0
        DECLE   $00A8,  $005C,  $000C,  $0008   ; 6EF4   00A8 005C 000C 0008
        DECLE   $0000,  $0000                   ; 6EF8   0000 0000

        ADDR    R7,     R5                      ; 6EFA   00FD
        ADDR    R2,     R7                      ; 6EFB   00D7

        DECLE   $00B5,  $005D,  $0025,  $0009   ; 6EFC   00B5 005D 0025 0009
        DECLE   $0001,  $0001,  $001E,  $003A   ; 6F00   0001 0001 001E 003A
        DECLE   $003C,  $003E,  $003E,  $003E   ; 6F04   003C 003E 003E 003E
        DECLE   $003E,  $003E,  $007A,  $00FC   ; 6F08   003E 003E 007A 00FC
        DECLE   $00BE,  $007E,  $007A,  $0076   ; 6F0C   00BE 007E 007A 0076
        DECLE   $0076,  $0066,  $00FC,  $0099   ; 6F10   0076 0066 00FC 0099
        DECLE   $0092,  $0004,  $0008,  $0000   ; 6F14   0092 0004 0008 0000
        DECLE   $0000,  $0000,  $003F,  $001F   ; 6F18   0000 0000 003F 001F

        INCR    R7                              ; 6F1C   000F

        SETC                                    ; 6F1D   0007
L_6F1E:
        DIS                                     ; 6F1E   0003
        DECLE   $0001,  $0000,  $0000,  $00FF   ; 6F1F   0001 0000 0000 00FF
        DECLE   $0000,  $00FF,  $00FF,  $0000   ; 6F23   0000 00FF 00FF 0000
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 6F27   00FF 00FF 00FF 0000
        DECLE   $0000,  $0000,  $00C0,  $00C0   ; 6F2B   0000 0000 00C0 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F2F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00F0,  $00F0   ; 6F33   0000 0000 00F0 00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F37   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FC,  $00FC   ; 6F3B   0000 0000 00FC 00FC
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F3F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 6F43   0000 0000 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6F47   0000 0000 0000 0001
        DECLE   $0032,  $0000,  $003A,  $0008   ; 6F4B   0032 0000 003A 0008
        DECLE   $003A,  $0010,  $003A,  $0018   ; 6F4F   003A 0010 003A 0018
        DECLE   $003A,  $0020,  $003A,  $0028   ; 6F53   003A 0020 003A 0028
        DECLE   $003A,  $0030,  $003A,  $0038   ; 6F57   003A 0030 003A 0038
        DECLE   $003A,  $0040,  $003A,  $0048   ; 6F5B   003A 0040 003A 0048
        DECLE   $003A,  $0050,  $003A,  $0058   ; 6F5F   003A 0050 003A 0058
        DECLE   $003A,  $0060,  $003A,  $0068   ; 6F63   003A 0060 003A 0068
        DECLE   $003A,  $0070,  $003A,  $007C   ; 6F67   003A 0070 003A 007C
        DECLE   $003A,  $0084,  $003A,  $008C   ; 6F6B   003A 0084 003A 008C
        DECLE   $003A,  $0094,  $003A,  $0099   ; 6F6F   003A 0094 003A 0099
        DECLE   $003C,  $00A1,  $003C,  $00A1   ; 6F73   003C 00A1 003C 00A1
        DECLE   $003C,  $00A9,  $003C,  $00B1   ; 6F77   003C 00A9 003C 00B1
        DECLE   $003C,  $00B9,  $003C,  $00C1   ; 6F7B   003C 00B9 003C 00C1
        DECLE   $003C,  $00C9,  $003C,  $00D1   ; 6F7F   003C 00C9 003C 00D1
        DECLE   $002A,  $00D9,  $002A,  $00E1   ; 6F83   002A 00D9 002A 00E1
        DECLE   $002A,  $00E9,  $002A,  $00F1   ; 6F87   002A 00E9 002A 00F1
        DECLE   $002A,  $00F9,  $002A,  $0001   ; 6F8B   002A 00F9 002A 0001
        DECLE   $002B,  $0009,  $002B,  $0014   ; 6F8F   002B 0009 002B 0014
        DECLE   $002B,  $001C,  $003F,  $0024   ; 6F93   002B 001C 003F 0024
        DECLE   $003F,  $0024,  $003F           ; 6F97   003F 0024 003F
L_6F9A:
        PSHR    R5                              ; 6F9A   0275

        JSR     R5,     X_PLAY_SFX2             ; 6F9B   0004 0118 03BE
        DECLE   $0079                           ; 6F9E  SFX prio
        DECLE   $0379                           ; 6F9F  SFX data
        DECLE   $002D                           ; 6FA0  SFX data
        DECLE   $0305                           ; 6FA1  SFX data
        DECLE   $03CF                           ; 6FA2  SFX end

L_6FA3:
        PSHR    R5                              ; 6FA3   0275
        COMR    R0                              ; 6FA4   0018
        MVO     R0,     G_01C9                  ; 6FA5   0240 01C9

        JSR     R5,     X_PLAY_SFX2             ; 6FA7   0004 0118 03BE
        DECLE   $0081                           ; 6FAA  SFX prio
        DECLE   $0079                           ; 6FAB  SFX data
        DECLE   $03B7                           ; 6FAC  SFX data
        DECLE   $03ED                           ; 6FAD  SFX data
        DECLE   $010C,  $0000                   ; 6FAE  SFX data
        DECLE   $000B                           ; 6FB0  SFX data
        DECLE   $03CF                           ; 6FB1  SFX end

L_6FB2:
        PSHR    R5                              ; 6FB2   0275

        JSR     R5,     X_PLAY_SFX1             ; 6FB3   0004 0118 03BB
        DECLE   $03E9                           ; 6FB6  SFX data
        DECLE   $03C0,  $0020                   ; 6FB7  SFX data
        DECLE   $0001,  $0004                   ; 6FB9  SFX data
        DECLE   $008F,  $02D9                   ; 6FBB  SFX data
        DECLE   $02CF                           ; 6FBD  SFX end

L_6FBE:
        PSHR    R5                              ; 6FBE   0275
        MVI     G_031D, R0                      ; 6FBF   0280 031D
        SDBD                                    ; 6FC1   0001
        ANDI    #$1000, R0                      ; 6FC2   03B8 0000 0010
        TSTR    R0                              ; 6FC5   0080
        BNEQ    L_6FD6                          ; 6FC6   020C 000E

        JSR     R5,     X_PLAY_SFX2             ; 6FC8   0004 0118 03BE
        DECLE   $0010                           ; 6FCB  SFX prio
        DECLE   $03E9                           ; 6FCC  SFX data
        DECLE   $03C0,  $0019                   ; 6FCD  SFX data
        DECLE   $002C,  $0034                   ; 6FCF  SFX data
        DECLE   $00B7                           ; 6FD1  SFX data
        DECLE   $0001,  $03F8                   ; 6FD2  SFX data
        DECLE   $026B                           ; 6FD4  SFX data
        DECLE   $00CF                           ; 6FD5  SFX end

L_6FD6:
        PULR    R7                              ; 6FD6   02B7

L_6FD7:
        PSHR    R5                              ; 6FD7   0275
        PSHR    R3                              ; 6FD8   0273
        MVII    #$01FE, R2                      ; 6FD9   02BA 01FE
        MVII    #$01FF, R3                      ; 6FDB   02BB 01FF

        JSR     R5,     .EXEC.4B7               ; 6FDD   0004 0114 00B7

L_6FE0:
        MVI@    R2,     R0                      ; 6FE0   0290
        SWAP    R0,     1                       ; 6FE1   0040
        XOR@    R3,     R0                      ; 6FE2   03D8
        COMR    R0                              ; 6FE3   0018
        BEQ     L_6FE0                          ; 6FE4   0224 0005

        PULR    R3                              ; 6FE6   02B3
        PULR    R7                              ; 6FE7   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6FFC   0000 0000 0000

        SLR     R0,     1                       ; 6FFF   0060

        ORG     $D000
        DECLE   $0082,  $00D9,  $0024,  $00D0   ; D000   0082 00D9 0024 00D0
        DECLE   $004B,  $00D0,  $0072,  $00DC   ; D004   004B 00D0 0072 00DC
        DECLE   $0038,  $00D0,  $004B,  $00D0   ; D008   0038 00D0 004B 00D0
        DECLE   $0200,  $0000,  $0001,  $0110   ; D00C   0200 0000 0001 0110
        DECLE   $0000,  $0060,  $0000,  $0001   ; D010   0000 0060 0000 0001
        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; D014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; D018   01B0 01A0 0190 0180
        DECLE   $00D3,  $0057,  $00D8,  $0057   ; D01C   00D3 0057 00D8 0057
        DECLE   $00DC,  $0057,  $0019,  $0058   ; D020   00DC 0057 0019 0058
        DECLE   $0048,  $00D4,  $003C,  $0000   ; D024   0048 00D4 003C 0000
        DECLE   $00F1,  $00D0,  $0001,  $0000   ; D028   00F1 00D0 0001 0000
        DECLE   $00E9,  $00D0,  $0003,  $0000   ; D02C   00E9 00D0 0003 0000
        DECLE   $00F9,  $00D0,  $0014,  $0000   ; D030   00F9 00D0 0014 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D034   0000 0000 0000 0000
        DECLE   $0030,  $0001,  $0380,  $0011   ; D038   0030 0001 0380 0011
        DECLE   $0380,  $0021,  $0380,  $0031   ; D03C   0380 0021 0380 0031
        DECLE   $0380,  $0041,  $0380,  $0051   ; D040   0380 0041 0380 0051
        DECLE   $0080,  $007D,  $0090,  $027F   ; D044   0080 007D 0090 027F

        DECR    R0                              ; D048   0010
        RLC     R1,     2                       ; D049   0055
        SUBR    R0,     R0                      ; D04A   0100
        PSHR    R5                              ; D04B   0275

L_D04C:
        JSR     R5,     L_D053                  ; D04C   0004 01D0 0053
        JSR     R5,     L_D07D                  ; D04F   0004 01D0 007D

        PULR    R7                              ; D052   02B7

L_D053:
        PSHR    R5                              ; D053   0275
        MVII    #$0278, R4                      ; D054   02BC 0278
        MVII    #$0078, R0                      ; D056   02B8 0078
        SDBD                                    ; D058   0001
        MVII    #$2200, R1                      ; D059   02B9 0000 0022

        JSR     R5,     X_FILL_MEM              ; D05C   0004 0114 0341
        DECLE   $0001,  $02B9,  $00FF,  $007F   ; D05F   0001 02B9 00FF 007F
        DECLE   $0288,  $0378,  $0170,  $020C   ; D063   0288 0378 0170 020C
        DECLE   $0076,  $02B8,  $00C8,  $0240   ; D067   0076 02B8 00C8 0240
        DECLE   $0167,  $02BB,  $0078,  $0243   ; D06B   0167 02BB 0078 0243
        DECLE   $0166,  $0243,  $0163,  $02FB   ; D06F   0166 0243 0163 02FB
        DECLE   $0200,  $0001,  $02B8,  $0005   ; D073   0200 0001 02B8 0005
        DECLE   $0023,  $0258,  $0004,  $01EC   ; D077   0023 0258 0004 01EC
        DECLE   $027E                           ; D07B   027E

        PULR    R7                              ; D07C   02B7

L_D07D:
        PSHR    R5                              ; D07D   0275
        MVII    #$031D, R2                      ; D07E   02BA 031D
        SDBD                                    ; D080   0001
        MVII    #$D83E, R1                      ; D081   02B9 003E 00D8
        MVII    #$0008, R0                      ; D084   02B8 0008

        JSR     R5,     X_INIT_MOBS             ; D086   0004 0114 02B4

        MVII    #$0001, R0                      ; D089   02B8 0001

        JSR     R5,     .EXEC.6CF               ; D08B   0004 0114 02CF

        CLRR    R0                              ; D08E   01C0
        MVO     R0,     G_0329                  ; D08F   0240 0329
        SDBD                                    ; D091   0001
        MVII    #$1000, R0                      ; D092   02B8 0000 0010
        MVO     R0,     G_0324                  ; D095   0240 0324
        MVII    #$0003, R0                      ; D097   02B8 0003
        MVO     R0,     G_0334                  ; D099   0240 0334
        CLRR    R0                              ; D09B   01C0
        MVO     R0,     G_032C                  ; D09C   0240 032C
        MVO     R0,     G_01CE                  ; D09E   0240 01CE

        JSR     R5,     L_D13F                  ; D0A0   0004 01D0 013F

        SDBD                                    ; D0A3   0001
        MVII    #$D0DF, R0                      ; D0A4   02B8 00DF 00D0
        MVO     R0,     G_035D                  ; D0A7   0240 035D
        MVII    #$009E, R0                      ; D0A9   02B8 009E
        MVO     R0,     G_0116                  ; D0AB   0240 0116
        MVII    #$0009, R0                      ; D0AD   02B8 0009
        MVO     R0,     G_0117                  ; D0AF   0240 0117
        MVII    #$003A, R0                      ; D0B1   02B8 003A
        MVO     R0,     G_0118                  ; D0B3   0240 0118
        MVII    #$0003, R0                      ; D0B5   02B8 0003
        MVO     R0,     G_01CC                  ; D0B7   0240 01CC

        JSR     R5,     L_D7DD                  ; D0B9   0004 01D4 03DD
        JSR     R5,     L_D7F5                  ; D0BC   0004 01D4 03F5

        CLRR    R0                              ; D0BF   01C0
        MVO     R0,     G_01CF                  ; D0C0   0240 01CF
        MVO     R0,     G_01D2                  ; D0C2   0240 01D2
        MVO     R0,     G_01DC                  ; D0C4   0240 01DC
        MVO     R0,     G_01DD                  ; D0C6   0240 01DD
        MVO     R0,     G_01D4                  ; D0C8   0240 01D4
        MVO     R0,     G_01D5                  ; D0CA   0240 01D5
        MVO     R0,     G_01D6                  ; D0CC   0240 01D6
        MVO     R0,     G_01D7                  ; D0CE   0240 01D7
        MVO     R0,     G_01D8                  ; D0D0   0240 01D8
        MVO     R0,     G_01DF                  ; D0D2   0240 01DF

        JSR     R5,     L_5C54                  ; D0D4   0004 015C 0054

        MVII    #$000C, R0                      ; D0D7   02B8 000C
        MVO     R0,     G_01D9                  ; D0D9   0240 01D9

        JSR     R5,     L_D12B                  ; D0DB   0004 01D0 012B

        PULR    R7                              ; D0DE   02B7

        ADDR    R1,     R6                      ; D0DF   00CE
        ADDR    R2,     R2                      ; D0E0   00D2
        MOVR    R3,     R1                      ; D0E1   0099
        ADDR    R2,     R4                      ; D0E2   00D4
        SLL     R0,     2                       ; D0E3   004C
        SLLC    R3,     1                       ; D0E4   005B
        ADDR    R6,     R4                      ; D0E5   00F4
        SLLC    R2,     1                       ; D0E6   005A
        ADDR    R6,     R4                      ; D0E7   00F4
        SLLC    R2,     1                       ; D0E8   005A
        PSHR    R5                              ; D0E9   0275

        JSR     R5,     L_D1B6                  ; D0EA   0004 01D0 01B6
        JSR     R5,     L_D21A                  ; D0ED   0004 01D0 021A

        PULR    R7                              ; D0F0   02B7

        PSHR    R5                              ; D0F1   0275

        JSR     R5,     L_D27B                  ; D0F2   0004 01D0 027B
        JSR     R5,     L_D254                  ; D0F5   0004 01D0 0254

        PULR    R7                              ; D0F8   02B7

        PSHR    R5                              ; D0F9   0275
        MVII    #$01DC, R4                      ; D0FA   02BC 01DC
        SDBD                                    ; D0FC   0001
        MVI@    R4,     R0                      ; D0FD   02A0
        INCR    R0                              ; D0FE   0008
        MVO     R0,     G_01DC                  ; D0FF   0240 01DC
        SWAP    R0,     1                       ; D101   0040
        MVO     R0,     G_01DD                  ; D102   0240 01DD
        PULR    R7                              ; D104   02B7

L_D105:
        PSHR    R5                              ; D105   0275
        SDBD                                    ; D106   0001
        MVII    #$2207, R3                      ; D107   02BB 0007 0022
        MVII    #$02DC, R4                      ; D10A   02BC 02DC

        JSR     R5,     X_PRINT_R5              ; D10C   0004 0118 007B
        STRING  "SCORE="                        ; D10F  
        DECLE   $0000                           ; D115   0000

        SDBD                                    ; D116   0001
        MVII    #$2207, R3                      ; D117   02BB 0007 0022
        MVII    #$02E7, R4                      ; D11A   02BC 02E7

        JSR     R5,     X_PRINT_R5              ; D11C   0004 0118 007B
        STRING  "MEN="                          ; D11F   004D 0045 004E 003D
        DECLE   $0000                           ; D123   0000

        JSR     R5,     L_D4D8                  ; D124   0004 01D4 00D8
        JSR     R5,     L_D192                  ; D127   0004 01D0 0192

        PULR    R7                              ; D12A   02B7

L_D12B:
        PSHR    R5                              ; D12B   0275
        MVII    #$0004, R0                      ; D12C   02B8 0004
        MVII    #$0002, R1                      ; D12E   02B9 0002
        MVO     R0,     G_01DB                  ; D130   0240 01DB
        MVO     R1,     G_01DA                  ; D132   0241 01DA
        PULR    R7                              ; D134   02B7

L_D135:
        PSHR    R5                              ; D135   0275
        MVII    #$0006, R0                      ; D136   02B8 0006
        MVII    #$00FF, R1                      ; D138   02B9 00FF
        MVO     R0,     G_01DB                  ; D13A   0240 01DB
        MVO     R1,     G_01DA                  ; D13C   0241 01DA
        PULR    R7                              ; D13E   02B7

L_D13F:
        PSHR    R5                              ; D13F   0275

        JSR     R5,     L_D14A                  ; D140   0004 01D0 014A
        JSR     R5,     L_D105                  ; D143   0004 01D0 0105
        JSR     R5,     L_D159                  ; D146   0004 01D0 0159

        PULR    R7                              ; D149   02B7

L_D14A:
        PSHR    R5                              ; D14A   0275
        SDBD                                    ; D14B   0001
        MVII    #$DDDA, R4                      ; D14C   02BC 00DA 00DD
        MVII    #$0200, R5                      ; D14F   02BD 0200
L_D151:
        SDBD                                    ; D151   0001
        MVI@    R4,     R0                      ; D152   02A0
        MVO@    R0,     R5                      ; D153   0268
        CMPI    #$0278, R5                      ; D154   037D 0278
        BNEQ    L_D151                          ; D156   022C 0006
        PULR    R7                              ; D158   02B7

L_D159:
        PSHR    R5                              ; D159   0275
        MVI     G_032C, R0                      ; D15A   0280 032C
        SDBD                                    ; D15C   0001
        MVII    #$FC19, R3                      ; D15D   02BB 0019 00FC
        CMPR    R3,     R0                      ; D160   0158
        BPL     L_D166                          ; D161   0203 0003

        MOVR    R3,     R0                      ; D163   0098
        B       L_D177                          ; D164   0200 0011

L_D166:
        MOVR    R0,     R2                      ; D166   0082
        SDBD                                    ; D167   0001
        SUBI    #$2710, R2                      ; D168   033A 0010 0027
        BMI     L_D179                          ; D16B   020B 000C

        MOVR    R2,     R0                      ; D16D   0090
        MVI     G_0334, R5                      ; D16E   0285 0334
        INCR    R5                              ; D170   000D
        CMPI    #$000A, R5                      ; D171   037D 000A
        BPL     L_D177                          ; D173   0203 0002

        MVO     R5,     G_0334                  ; D175   0245 0334
L_D177:
        MVO     R0,     G_032C                  ; D177   0240 032C
L_D179:
        MVII    #$0004, R1                      ; D179   02B9 0004
        SDBD                                    ; D17B   0001
        MVII    #$2207, R3                      ; D17C   02BB 0007 0022
        MVII    #$02E2, R4                      ; D17F   02BC 02E2

        JSR     R5,     X_PRNUM_ZRO             ; D181   0004 0118 00AD

        MVI     G_0334, R0                      ; D184   0280 0334
        MVII    #$0001, R1                      ; D186   02B9 0001
        SDBD                                    ; D188   0001
        MVII    #$2207, R3                      ; D189   02BB 0007 0022
        MVII    #$02EB, R4                      ; D18C   02BC 02EB

        JSR     R5,     X_PRNUM_ZRO             ; D18E   0004 0118 00AD

        PULR    R7                              ; D191   02B7

L_D192:
        PSHR    R5                              ; D192   0275
        MVII    #$01C7, R4                      ; D193   02BC 01C7
        SDBD                                    ; D195   0001
        MVI@    R4,     R0                      ; D196   02A0
        SDBD                                    ; D197   0001
        MVII    #$2B50, R1                      ; D198   02B9 0050 002B
        TSTR    R0                              ; D19B   0080
        BEQ     L_D1A5                          ; D19C   0204 0007

        ADDI    #$0008, R1                      ; D19E   02F9 0008
        TSTR    R0                              ; D1A0   0080
        BMI     L_D1A5                          ; D1A1   020B 0002

        ADDI    #$0008, R1                      ; D1A3   02F9 0008
L_D1A5:
        INCR    R1                              ; D1A5   0009
        MVI     G_01D3, R0                      ; D1A6   0280 01D3
        CMPI    #$00FB, R0                      ; D1A8   0378 00FB
        BEQ     L_D1B2                          ; D1AA   0204 0006

        INCR    R1                              ; D1AC   0009
        CMPI    #$00F5, R0                      ; D1AD   0378 00F5
        BEQ     L_D1B2                          ; D1AF   0204 0001

        INCR    R1                              ; D1B1   0009
L_D1B2:
        MVII    #$02E6, R2                      ; D1B2   02BA 02E6
        MVO@    R1,     R2                      ; D1B4   0251
        PULR    R7                              ; D1B5   02B7

L_D1B6:
        PSHR    R5                              ; D1B6   0275

        JSR     R5,     L_D825                  ; D1B7   0004 01D8 0025

        BNEQ    L_D1C3                          ; D1BA   020C 0007

        MVI     G_0321, R0                      ; D1BC   0280 0321

        JSR     R5,     L_D1E4                  ; D1BE   0004 01D0 01E4

        MVO     R0,     G_0321                  ; D1C1   0240 0321
L_D1C3:
        MVI     G_01DE, R0                      ; D1C3   0280 01DE
        TSTR    R0                              ; D1C5   0080
        BEQ     L_D1CD                          ; D1C6   0204 0005

        DECR    R0                              ; D1C8   0010
        MVO     R0,     G_01DE                  ; D1C9   0240 01DE
        B       L_D1D7                          ; D1CB   0200 000A

L_D1CD:
        JSR     R5,     L_D813                  ; D1CD   0004 01D8 0013

        BEQ     L_D1DB                          ; D1D0   0204 0009

        JSR     R5,     L_D819                  ; D1D2   0004 01D8 0019

        BEQ     L_D1DB                          ; D1D5   0204 0004

L_D1D7:
        JSR     R5,     L_D1F0                  ; D1D7   0004 01D0 01F0

        PULR    R7                              ; D1DA   02B7

L_D1DB:
        MVI     G_0331, R0                      ; D1DB   0280 0331

        JSR     R5,     L_D1E4                  ; D1DD   0004 01D0 01E4

        MVO     R0,     G_0331                  ; D1E0   0240 0331
        B       L_D1D7                          ; D1E2   0220 000C

L_D1E4:
        PSHR    R5                              ; D1E4   0275
        MOVR    R0,     R1                      ; D1E5   0081
        SDBD                                    ; D1E6   0001
        ANDI    #$FF00, R0                      ; D1E7   03B8 0000 00FF
        ADD     G_01CC, R1                      ; D1EA   02C1 01CC
        ANDI    #$00FF, R1                      ; D1EC   03B9 00FF
        ADDR    R1,     R0                      ; D1EE   00C8
        PULR    R7                              ; D1EF   02B7

L_D1F0:
        PSHR    R5                              ; D1F0   0275
        MVII    #$0335, R2                      ; D1F1   02BA 0335

        JSR     R5,     L_D20B                  ; D1F3   0004 01D0 020B

        MVII    #$033D, R2                      ; D1F6   02BA 033D

        JSR     R5,     L_D20B                  ; D1F8   0004 01D0 020B

        MVII    #$0345, R2                      ; D1FB   02BA 0345

        JSR     R5,     L_D20B                  ; D1FD   0004 01D0 020B

        MVII    #$034D, R2                      ; D200   02BA 034D

        JSR     R5,     L_D20B                  ; D202   0004 01D0 020B

        MVII    #$0355, R2                      ; D205   02BA 0355

        JSR     R5,     L_D20B                  ; D207   0004 01D0 020B

        PULR    R7                              ; D20A   02B7

L_D20B:
        PSHR    R5                              ; D20B   0275
        MOVR    R2,     R1                      ; D20C   0091

        JSR     R5,     L_D831                  ; D20D   0004 01D8 0031

        BEQ     L_D219                          ; D210   0204 0007

        ADDI    #$0004, R2                      ; D212   02FA 0004
        MVI@    R2,     R0                      ; D214   0290

        JSR     R5,     L_D1E4                  ; D215   0004 01D0 01E4

        MVO@    R0,     R2                      ; D218   0250
L_D219:
        PULR    R7                              ; D219   02B7

L_D21A:
        PSHR    R5                              ; D21A   0275
        MVI     G_0321, R0                      ; D21B   0280 0321
        MOVR    R0,     R1                      ; D21D   0081
        MOVR    R0,     R2                      ; D21E   0082
        SWAP    R0,     1                       ; D21F   0040
        ANDI    #$00FF, R0                      ; D220   03B8 00FF
        BEQ     L_D23E                          ; D222   0204 001A

        ANDI    #$0080, R0                      ; D224   03B8 0080
        SWAP    R2,     1                       ; D226   0042
        ANDI    #$00FF, R1                      ; D227   03B9 00FF
        ANDI    #$00FF, R2                      ; D229   03BA 00FF
        TSTR    R0                              ; D22B   0080
        BEQ     L_D24D                          ; D22C   0204 001F

        ADDI    #$0003, R2                      ; D22E   02FA 0003
L_D230:
        ANDI    #$00FF, R2                      ; D230   03BA 00FF
        CMPI    #$0003, R2                      ; D232   037A 0003
        BLT     L_D251                          ; D234   0205 001B

        CMPI    #$00FB, R2                      ; D236   037A 00FB
        BGT     L_D251                          ; D238   020E 0017

L_D23A:
        SWAP    R2,     1                       ; D23A   0042
        ADDR    R2,     R1                      ; D23B   00D1
        MVO     R1,     G_0321                  ; D23C   0241 0321

L_D23E:
        JSR     R5,     L_D819                  ; D23E   0004 01D8 0019

        BEQ     L_D24C                          ; D241   0204 0009

        MVI     G_0330, R0                      ; D243   0280 0330
        SWAP    R0,     1                       ; D245   0040
        ANDI    #$00FF, R0                      ; D246   03B8 00FF
        CMPI    #$0014, R0                      ; D248   0378 0014
        BGT     L_D2A6                          ; D24A   020E 005A
L_D24C:
        PULR    R7                              ; D24C   02B7

L_D24D:
        SUBI    #$0003, R2                      ; D24D   033A 0003
        B       L_D230                          ; D24F   0220 0020

L_D251:
        CLRR    R2                              ; D251   01D2
        B       L_D23A                          ; D252   0220 0019

L_D254:
        PSHR    R5                              ; D254   0275

        JSR     R5,     L_D81F                  ; D255   0004 01D8 001F

        BNEQ    L_D274                          ; D258   020C 001A

        MVI     G_032F, R0                      ; D25A   0280 032F
        MVI     G_032D, R1                      ; D25C   0281 032D
        ANDI    #$0200, R1                      ; D25E   03B9 0200
        BEQ     L_D275                          ; D260   0204 0013

        MVI     G_01DB, R2                      ; D262   0282 01DB
        SWAP    R2,     1                       ; D264   0042
        SUBR    R2,     R0                      ; D265   0110
L_D266:
        MVO     R0,     G_031F                  ; D266   0240 031F
        MVO     R0,     G_0327                  ; D268   0240 0327
        MVI     G_0330, R0                      ; D26A   0280 0330
        MVI     G_01DA, R2                      ; D26C   0282 01DA
        SWAP    R2,     1                       ; D26E   0042
        SUBR    R2,     R0                      ; D26F   0110
        MVO     R0,     G_0320                  ; D270   0240 0320
        MVO     R0,     G_0328                  ; D272   0240 0328
L_D274:
        PULR    R7                              ; D274   02B7

L_D275:
        MVI     G_01DB, R2                      ; D275   0282 01DB
        SWAP    R2,     1                       ; D277   0042
        ADDR    R2,     R0                      ; D278   00D0
        B       L_D266                          ; D279   0220 0014

L_D27B:
        PSHR    R5                              ; D27B   0275
        MVI     G_0330, R0                      ; D27C   0280 0330
        SWAP    R0,     1                       ; D27E   0040
        ANDI    #$00FF, R0                      ; D27F   03B8 00FF
        CMP     G_0118, R0                      ; D281   0340 0118
        BPL     L_D3D6                          ; D283   0203 0151

        JSR     R5,     L_D80D                  ; D285   0004 01D8 000D

        BNEQ    L_D2A5                          ; D288   020C 001B

        MVI     G_032F, R0                      ; D28A   0280 032F
        SWAP    R0,     1                       ; D28C   0040
        ANDI    #$00FF, R0                      ; D28D   03B8 00FF
        CMP     G_0116, R0                      ; D28F   0340 0116
        BPL     L_D3AA                          ; D291   0203 0117

        CMP     G_0117, R0                      ; D293   0340 0117
        BLE     L_D3B7                          ; D295   0206 0120

        SUBI    #$0005, R0                      ; D297   0338 0005
        SLR     R0,     2                       ; D299   0064
        SLR     R0,     1                       ; D29A   0060
        ADDI    #$0228, R0                      ; D29B   02F8 0228
        MOVR    R0,     R1                      ; D29D   0081
        MVI@    R1,     R0                      ; D29E   0288
        SDBD                                    ; D29F   0001
        ANDI    #$09F8, R0                      ; D2A0   03B8 00F8 0009
        BEQ     L_D2A6                          ; D2A3   0204 0001
L_D2A5:
        PULR    R7                              ; D2A5   02B7

L_D2A6:
        MVI     G_0332, R0                      ; D2A6   0280 0332
        SDBD                                    ; D2A8   0001
        ANDI    #$FC00, R0                      ; D2A9   03B8 0000 00FC
        MVO     R0,     G_0332                  ; D2AC   0240 0332

        JSR     R5,     L_D7ED                  ; D2AE   0004 01D4 03ED
        JSR     R5,     L_5B4C                  ; D2B1   0004 0158 034C

        SDBD                                    ; D2B4   0001
        MVII    #$D900, R0                      ; D2B5   02B8 0000 00D9
        MVO     R0,     G_032E                  ; D2B8   0240 032E
        MVI     G_0331, R0                      ; D2BA   0280 0331
        ADDI    #$0004, R0                      ; D2BC   02F8 0004
        ANDI    #$007F, R0                      ; D2BE   03B8 007F
        MVO     R0,     G_0331                  ; D2C0   0240 0331
        MVI     G_032D, R0                      ; D2C2   0280 032D
        SDBD                                    ; D2C4   0001
        ANDI    #$FFE8, R0                      ; D2C5   03B8 00E8 00FF
        XORI    #$0006, R0                      ; D2C8   03F8 0006
        MVO     R0,     G_032D                  ; D2CA   0240 032D
        B       L_D2A5                          ; D2CC   0220 0028

L_D2CE:
        PSHR    R5                              ; D2CE   0275
        MOVR    R0,     R1                      ; D2CF   0081

        JSR     R5,     L_D80D                  ; D2D0   0004 01D8 000D

        BNEQ    L_D304                          ; D2D3   020C 002F

        MVI     G_032D, R0                      ; D2D5   0280 032D
        ANDI    #$0008, R0                      ; D2D7   03B8 0008
        TSTR    R0                              ; D2D9   0080
        BNEQ    L_D304                          ; D2DA   020C 0028

        PSHR    R1                              ; D2DC   0271

        JSR     R5,     L_D12B                  ; D2DD   0004 01D0 012B

        PULR    R1                              ; D2E0   02B1
        MOVR    R1,     R0                      ; D2E1   0088
        TSTR    R0                              ; D2E2   0080
        BMI     L_D305                          ; D2E3   020B 0020

        INCR    R0                              ; D2E5   0008
        ANDI    #$000F, R0                      ; D2E6   03B8 000F
        CMPI    #$0003, R0                      ; D2E8   0378 0003
        BLT     L_D331                          ; D2EA   0205 0045

        SUBI    #$0004, R0                      ; D2EC   0338 0004
        ANDI    #$000F, R0                      ; D2EE   03B8 000F
        CMPI    #$0003, R0                      ; D2F0   0378 0003
        BLT     L_D34C                          ; D2F2   0205 0058

        SUBI    #$0004, R0                      ; D2F4   0338 0004
        ANDI    #$000F, R0                      ; D2F6   03B8 000F
        CMPI    #$0003, R0                      ; D2F8   0378 0003
        BLT     L_D347                          ; D2FA   0205 004B

        SUBI    #$0004, R0                      ; D2FC   0338 0004
        ANDI    #$000F, R0                      ; D2FE   03B8 000F
        CMPI    #$0003, R0                      ; D300   0378 0003
        BLT     L_D350                          ; D302   0205 004C
L_D304:
        PULR    R7                              ; D304   02B7

L_D305:
        CLRR    R0                              ; D305   01C0
        MVO     R0,     G_0331                  ; D306   0240 0331
        MVO     R0,     G_0332                  ; D308   0240 0332
        MVII    #$0014, R0                      ; D30A   02B8 0014
        MVO     R0,     G_0333                  ; D30C   0240 0333
        SDBD                                    ; D30E   0001
        MVII    #$D8E3, R0                      ; D30F   02B8 00E3 00D8
        MVO     R0,     G_032E                  ; D312   0240 032E
        MVI     G_031E, R0                      ; D314   0280 031E
        SDBD                                    ; D316   0001
        CMPI    #$D8BE, R0                      ; D317   0378 00BE 00D8
        BNEQ    L_D330                          ; D31A   020C 0014

        JSR     R5,     L_D81F                  ; D31C   0004 01D8 001F

        BNEQ    L_D330                          ; D31F   020C 000F

        MVI     G_031D, R0                      ; D321   0280 031D
        SDBD                                    ; D323   0001
        ANDI    #$1000, R0                      ; D324   03B8 0000 0010
        TSTR    R0                              ; D327   0080
        BEQ     L_D330                          ; D328   0204 0006

        SDBD                                    ; D32A   0001
        MVII    #$D8F7, R0                      ; D32B   02B8 00F7 00D8
        MVO     R0,     G_032E                  ; D32E   0240 032E
L_D330:
        PULR    R7                              ; D330   02B7

L_D331:
        JSR     R5,     L_D36E                  ; D331   0004 01D0 036E

L_D334:
        MVO     R0,     G_0331                  ; D334   0240 0331
        SDBD                                    ; D336   0001
        MVII    #$D8DA, R0                      ; D337   02B8 00DA 00D8
        MVO     R0,     G_032E                  ; D33A   0240 032E
        MVI     G_0332, R0                      ; D33C   0280 0332
        SDBD                                    ; D33E   0001
        ANDI    #$FC0F, R0                      ; D33F   03B8 000F 00FC
        XORI    #$03F0, R0                      ; D342   03F8 03F0
        MVO     R0,     G_0332                  ; D344   0240 0332
        PULR    R7                              ; D346   02B7

L_D347:
        JSR     R5,     L_D37C                  ; D347   0004 01D0 037C

        B       L_D334                          ; D34A   0220 0017

L_D34C:
        JSR     R5,     L_5C34                  ; D34C   0004 015C 0034

        PULR    R7                              ; D34F   02B7

L_D350:
        CLRR    R0                              ; D350   01C0
        MVO     R0,     G_0331                  ; D351   0240 0331
        MVO     R0,     G_0332                  ; D353   0240 0332
        MVII    #$0002, R0                      ; D355   02B8 0002
        MVO     R0,     G_0333                  ; D357   0240 0333
        SDBD                                    ; D359   0001
        MVII    #$D935, R0                      ; D35A   02B8 0035 00D9
        MVO     R0,     G_032E                  ; D35D   0240 032E

        JSR     R5,     L_5C6F                  ; D35F   0004 015C 006F
        JSR     R5,     L_D135                  ; D362   0004 01D0 0135

        PULR    R7                              ; D365   02B7

        PSHR    R5                              ; D366   0275
        SDBD                                    ; D367   0001
        MVII    #$D93E, R0                      ; D368   02B8 003E 00D9
        MVO     R0,     G_032E                  ; D36B   0240 032E
        PULR    R7                              ; D36D   02B7

L_D36E:
        PSHR    R5                              ; D36E   0275
        MVI     G_032D, R0                      ; D36F   0280 032D
        SDBD                                    ; D371   0001
        ANDI    #$FDFF, R0                      ; D372   03B8 00FF 00FD
        MVO     R0,     G_032D                  ; D375   0240 032D
        CLRR    R1                              ; D377   01C9

        JSR     R5,     L_D38D                  ; D378   0004 01D0 038D

        PULR    R7                              ; D37B   02B7

L_D37C:
        PSHR    R5                              ; D37C   0275
        MVI     G_032D, R0                      ; D37D   0280 032D
        SDBD                                    ; D37F   0001
        ANDI    #$FDFF, R0                      ; D380   03B8 00FF 00FD
        XORI    #$0200, R0                      ; D383   03F8 0200
        MVO     R0,     G_032D                  ; D385   0240 032D
        MVII    #$0008, R1                      ; D387   02B9 0008

        JSR     R5,     L_D38D                  ; D389   0004 01D0 038D

        PULR    R7                              ; D38C   02B7

L_D38D:
        PSHR    R5                              ; D38D   0275
        MVI     G_01D9, R0                      ; D38E   0280 01D9

        JSR     R5,     .EXEC.629               ; D390   0004 0114 0229

        PSHR    R0                              ; D393   0270
        MVO     R0,     G_01C7                  ; D394   0240 01C7
        SWAP    R0,     1                       ; D396   0040
        MVO     R0,     G_01C8                  ; D397   0240 01C8

        JSR     R5,     L_D192                  ; D399   0004 01D0 0192

        PULR    R0                              ; D39C   02B0
        PULR    R7                              ; D39D   02B7

        PSHR    R5                              ; D39E   0275
        SLL     R2,     1                       ; D39F   004A
        ADDR    R2,     R7                      ; D3A0   00D7
        B       L_D3AA                          ; D3A1   0200 0007
        B       L_D3B7                          ; D3A3   0200 0012
        B       L_D3D6                          ; D3A5   0200 002F
        B       L_D3C4                          ; D3A7   0200 001B
        PULR    R7                              ; D3A9   02B7

L_D3AA:
        MVI     G_0331, R0                      ; D3AA   0280 0331
        ANDI    #$00FF, R0                      ; D3AC   03B8 00FF
        MVO     R0,     G_0331                  ; D3AE   0240 0331
        MVI     G_032F, R0                      ; D3B0   0280 032F
        SUBI    #$0200, R0                      ; D3B2   0338 0200
        MVO     R0,     G_032F                  ; D3B4   0240 032F
        PULR    R7                              ; D3B6   02B7

L_D3B7:
        MVI     G_0331, R0                      ; D3B7   0280 0331
        ANDI    #$00FF, R0                      ; D3B9   03B8 00FF
        MVO     R0,     G_0331                  ; D3BB   0240 0331
        MVI     G_032F, R0                      ; D3BD   0280 032F
        ADDI    #$0200, R0                      ; D3BF   02F8 0200
        MVO     R0,     G_032F                  ; D3C1   0240 032F
        PULR    R7                              ; D3C3   02B7

L_D3C4:
        MVI     G_0331, R0                      ; D3C4   0280 0331
        MOVR    R0,     R1                      ; D3C6   0081
        ANDI    #$00FF, R0                      ; D3C7   03B8 00FF
        SDBD                                    ; D3C9   0001
        ANDI    #$FF00, R1                      ; D3CA   03B9 0000 00FF
        NEGR    R0                              ; D3CD   0020
        SDBD                                    ; D3CE   0001
        ANDI    #$FF00, R0                      ; D3CF   03B8 0000 00FF
        ADDR    R0,     R1                      ; D3D2   00C1
        MVO     R1,     G_0331                  ; D3D3   0241 0331
        PULR    R7                              ; D3D5   02B7

L_D3D6:
        CLRR    R0                              ; D3D6   01C0
        MVO     R0,     G_0331                  ; D3D7   0240 0331
        MVI     G_0334, R0                      ; D3D9   0280 0334
        DECR    R0                              ; D3DB   0010
        MVO     R0,     G_0334                  ; D3DC   0240 0334

        JSR     R5,     L_D159                  ; D3DE   0004 01D0 0159

        MVI     G_0334, R0                      ; D3E1   0280 0334
        TSTR    R0                              ; D3E3   0080
        BEQ     L_D415                          ; D3E4   0204 002F

        CLRR    R0                              ; D3E6   01C0
        MVO     R0,     G_0332                  ; D3E7   0240 0332
        MVO     R0,     G_0330                  ; D3E9   0240 0330

        JSR     R5,     L_5C6F                  ; D3EB   0004 015C 006F

        MVI     G_032D, R0                      ; D3EE   0280 032D
        SDBD                                    ; D3F0   0001
        ANDI    #$E7E0, R0                      ; D3F1   03B8 00E0 00E7
        SDBD                                    ; D3F4   0001
        XORI    #$1806, R0                      ; D3F5   03F8 0006 0018
        MVO     R0,     G_032D                  ; D3F8   0240 032D
        MVII    #$0046, R0                      ; D3FA   02B8 0046
        SWAP    R0,     1                       ; D3FC   0040
        MVO     R0,     G_032F                  ; D3FD   0240 032F
        SDBD                                    ; D3FF   0001
        MVII    #$D8EC, R0                      ; D400   02B8 00EC 00D8
        MVO     R0,     G_032E                  ; D403   0240 032E
        MVII    #$0007, R0                      ; D405   02B8 0007
        MVO     R0,     G_01DE                  ; D407   0240 01DE

        JSR     R5,     L_D7E5                  ; D409   0004 01D4 03E5

        SDBD                                    ; D40C   0001
        MVII    #$D0DF, R0                      ; D40D   02B8 00DF 00D0
        MVO     R0,     G_035D                  ; D410   0240 035D
        PULR    R7                              ; D412   02B7
L_D413:
        B       L_D3D6                          ; D413   0220 003E

L_D415:
        MVII    #$0205, R4                      ; D415   02BC 0205
        SDBD                                    ; D417   0001
        MVII    #$0407, R3                      ; D418   02BB 0007 0004
        SDBD                                    ; D41B   0001
        MVII    #$D429, R1                      ; D41C   02B9 0029 00D4

        JSR     R5,     X_PRINT_R1              ; D41F   0004 0118 0067
        JSR     R5,     L_6FD7                  ; D422   0004 016C 03D7
        JSR     R5,     L_D07D                  ; D425   0004 01D0 007D

        PULR    R7                              ; D428   02B7

        DECLE   $0047,  $0041,  $004D,  $0045   ; D429   0047 0041 004D 0045
        DECLE   $0020,  $004F,  $0056,  $0045   ; D42D   0020 004F 0056 0045
        DECLE   $0052,  $0000,  $0020,  $0050   ; D431   0052 0000 0020 0050
        DECLE   $0052,  $0045,  $0053,  $0053   ; D435   0052 0045 0053 0053
        DECLE   $0020,  $0044,  $0049,  $0053   ; D439   0020 0044 0049 0053
        DECLE   $0043,  $0020,  $0054,  $004F   ; D43D   0043 0020 0054 004F
        DECLE   $0020,  $0052,  $0045,  $0053   ; D441   0020 0052 0045 0053
        DECLE   $0045,  $0054,  $0000           ; D445   0045 0054 0000

        PSHR    R5                              ; D448   0275
        MVI     G_01D2, R0                      ; D449   0280 01D2
        TSTR    R0                              ; D44B   0080
        BNEQ    L_D45D                          ; D44C   020C 000F

        MVII    #$01D4, R2                      ; D44E   02BA 01D4
        MVII    #$0005, R3                      ; D450   02BB 0005
        MVII    #$0003, R1                      ; D452   02B9 0003
L_D454:
        MVI@    R2,     R0                      ; D454   0290
        TSTR    R0                              ; D455   0080
        BEQ     L_D45E                          ; D456   0204 0006

        INCR    R1                              ; D458   0009
        INCR    R2                              ; D459   000A
        DECR    R3                              ; D45A   0013
        BNEQ    L_D454                          ; D45B   022C 0008
L_D45D:
        PULR    R7                              ; D45D   02B7

L_D45E:
        MVO@    R1,     R2                      ; D45E   0251
        MOVR    R1,     R0                      ; D45F   0088

        JSR     R5,     .EXEC.76C               ; D460   0004 0114 036C
        DECLE   $0288,  $0001                   ; D463   0288 0001

        ANDI    #$00E0, R0                      ; D465   03B8 00E0
        ADDR    R5,     R7                      ; D467   00EF

        SDBD                                    ; D468   0001
        XORI    #$1000, R0                      ; D469   03F8 0000 0010
        MVO@    R0,     R1                      ; D46C   0248
        ADDI    #$0001, R1                      ; D46D   02F9 0001
        SDBD                                    ; D46F   0001
        MVII    #$D947, R0                      ; D470   02B8 0047 00D9
        MVO@    R0,     R1                      ; D473   0248
        INCR    R1                              ; D474   0009
        CLRR    R0                              ; D475   01C0
        MVO@    R0,     R1                      ; D476   0248
        MVII    #$0030, R0                      ; D477   02B8 0030
        SWAP    R0,     1                       ; D479   0040
        INCR    R1                              ; D47A   0009
        MVO@    R0,     R1                      ; D47B   0248
        INCR    R1                              ; D47C   0009
        MVII    #$005C, R0                      ; D47D   02B8 005C

        JSR     R5,     X_RAND2                 ; D47F   0004 0114 029E

        ADDI    #$001E, R0                      ; D482   02F8 001E
        SWAP    R0,     1                       ; D484   0040
        PSHR    R0                              ; D485   0270
        MVII    #$000A, R0                      ; D486   02B8 000A

        JSR     R5,     X_RAND2                 ; D488   0004 0114 029E

        SUBI    #$000A, R0                      ; D48B   0338 000A
        ANDI    #$00FF, R0                      ; D48D   03B8 00FF
        ADD@    R6,     R0                      ; D48F   02F0
        MVO@    R0,     R1                      ; D490   0248
        INCR    R1                              ; D491   0009
        MVII    #$0120, R0                      ; D492   02B8 0120
        MVO@    R0,     R1                      ; D494   0248
        INCR    R1                              ; D495   0009
        CLRR    R0                              ; D496   01C0
        MVO@    R0,     R1                      ; D497   0248
        PULR    R7                              ; D498   02B7

        PSHR    R5                              ; D499   0275
        SLL     R0,     2                       ; D49A   004C
        ADDR    R0,     R7                      ; D49B   00C7

        JSR     R5,     L_D4CE                  ; D49C   0004 01D4 00CE

        PULR    R7                              ; D49F   02B7

        JSR     R5,     L_5C54                  ; D4A0   0004 015C 0054

        PULR    R7                              ; D4A3   02B7

        JSR     R5,     L_5C5D                  ; D4A4   0004 015C 005D

        PULR    R7                              ; D4A7   02B7

        JSR     R5,     L_5C66                  ; D4A8   0004 015C 0066

        PULR    R7                              ; D4AB   02B7

        JSR     R5,     L_D37C                  ; D4AC   0004 01D0 037C

        PULR    R7                              ; D4AF   02B7

        JSR     R5,     L_5C6F                  ; D4B0   0004 015C 006F

        PULR    R7                              ; D4B3   02B7

        JSR     R5,     L_D36E                  ; D4B4   0004 01D0 036E

        PULR    R7                              ; D4B7   02B7

        JSR     R5,     L_D4CC                  ; D4B8   0004 01D4 00CC

        PULR    R7                              ; D4BB   02B7

        JSR     R5,     L_D4CC                  ; D4BC   0004 01D4 00CC

        PULR    R7                              ; D4BF   02B7

        JSR     R5,     L_D4CC                  ; D4C0   0004 01D4 00CC

        PULR    R7                              ; D4C3   02B7

        JSR     R5,     L_D50C                  ; D4C4   0004 01D4 010C

        PULR    R7                              ; D4C7   02B7

        JSR     R5,     L_D501                  ; D4C8   0004 01D4 0101

        PULR    R7                              ; D4CB   02B7

L_D4CC:
        PSHR    R5                              ; D4CC   0275
        PULR    R7                              ; D4CD   02B7

L_D4CE:
        PSHR    R5                              ; D4CE   0275
        MVI     G_01CF, R0                      ; D4CF   0280 01CF
        COMR    R0                              ; D4D1   0018
        MVO     R0,     G_01CF                  ; D4D2   0240 01CF

        JSR     R5,     L_D4D8                  ; D4D4   0004 01D4 00D8

        PULR    R7                              ; D4D7   02B7

L_D4D8:
        PSHR    R5                              ; D4D8   0275
        SDBD                                    ; D4D9   0001
        MVII    #$7FFF, R1                      ; D4DA   02B9 00FF 007F
        MVI@    R1,     R0                      ; D4DD   0288
        CMPI    #$0170, R0                      ; D4DE   0378 0170
        BNEQ    L_D4F7                          ; D4E0   020C 0015

        SDBD                                    ; D4E2   0001
        MVII    #$2200, R3                      ; D4E3   02BB 0000 0022
        MVII    #$02EC, R4                      ; D4E6   02BC 02EC
        MVI     G_01CF, R0                      ; D4E8   0280 01CF
        TSTR    R0                              ; D4EA   0080
        BNEQ    L_D4F8                          ; D4EB   020C 000B

        ADDI    #$0007, R3                      ; D4ED   02FB 0007

        JSR     R5,     X_PRINT_R5              ; D4EF   0004 0118 007B
        STRING  " ON "                          ; D4F2   0020 004F 004E 0020
        DECLE   $0000                           ; D4F6   0000
L_D4F7:
        PULR    R7                              ; D4F7   02B7

L_D4F8:
        JSR     R5,     X_PRINT_R5              ; D4F8   0004 0118 007B
        STRING  " OFF"                          ; D4FB   0020 004F 0046 0046
        DECLE   $0000                           ; D4FF   0000

        PULR    R7                              ; D500   02B7

L_D501:
        PSHR    R5                              ; D501   0275
        MVI     G_032C, R0                      ; D502   0280 032C
        SUBI    #$000A, R0                      ; D504   0338 000A
        MVO     R0,     G_032C                  ; D506   0240 032C

        JSR     R5,     L_D13F                  ; D508   0004 01D0 013F

        PULR    R7                              ; D50B   02B7

L_D50C:
        PSHR    R5                              ; D50C   0275
        MVI     G_01D2, R0                      ; D50D   0280 01D2
        COMR    R0                              ; D50F   0018
        MVO     R0,     G_01D2                  ; D510   0240 01D2
        MVII    #$0335, R1                      ; D512   02B9 0335

        JSR     R5,     L_D52C                  ; D514   0004 01D4 012C

        MVII    #$033D, R1                      ; D517   02B9 033D

        JSR     R5,     L_D52C                  ; D519   0004 01D4 012C

        MVII    #$0345, R1                      ; D51C   02B9 0345

        JSR     R5,     L_D52C                  ; D51E   0004 01D4 012C

        MVII    #$034D, R1                      ; D521   02B9 034D

        JSR     R5,     L_D52C                  ; D523   0004 01D4 012C

        MVII    #$0355, R1                      ; D526   02B9 0355

        JSR     R5,     L_D52C                  ; D528   0004 01D4 012C

        PULR    R7                              ; D52B   02B7

L_D52C:
        PSHR    R5                              ; D52C   0275
        MVI@    R1,     R0                      ; D52D   0288
        SDBD                                    ; D52E   0001
        XORI    #$8000, R0                      ; D52F   03F8 0000 0080
        MVO@    R0,     R1                      ; D532   0248
        PULR    R7                              ; D533   02B7
        B       L_D53F                          ; D534   0200 0009

        TSTR    R1                              ; D536   0089
        BEQ     L_D53B                          ; D537   0204 0002
        B       L_D5AA                          ; D539   0200 006F

L_D53B:
        PSHR    R5                              ; D53B   0275
        DECR    R0                              ; D53C   0010
        BNEQ    L_D573                          ; D53D   020C 0034

L_D53F:
        MVI     G_031D, R0                      ; D53F   0280 031D
        SDBD                                    ; D541   0001
        ANDI    #$4000, R0                      ; D542   03B8 0000 0040
        TSTR    R0                              ; D545   0080
        BNEQ    L_D571                          ; D546   020C 0029

        MVI     G_031F, R3                      ; D548   0283 031F
        TSTR    R3                              ; D54A   009B
        BNEQ    L_D571                          ; D54B   020C 0024

        JSR     R5,     L_D767                  ; D54D   0004 01D4 0367

        MVI     G_01DD, R3                      ; D550   0283 01DD
        MVO     R3,     G_01DF                  ; D552   0243 01DF
        MVI     G_034A, R0                      ; D554   0280 034A
        SDBD                                    ; D556   0001
        MVII    #$6B23, R1                      ; D557   02B9 0023 006B
        ADDR    R0,     R1                      ; D55A   00C1
        MVI@    R1,     R0                      ; D55B   0288
        SWAP    R0,     1                       ; D55C   0040
        MVI     G_033F, R2                      ; D55D   0282 033F
        ADDR    R0,     R2                      ; D55F   00C2
        MVO     R2,     G_031F                  ; D560   0242 031F
        ADDI    #$0008, R1                      ; D562   02F9 0008
        MVI@    R1,     R0                      ; D564   0288
        SWAP    R0,     1                       ; D565   0040
        MVI     G_0340, R2                      ; D566   0282 0340
        ADDR    R0,     R2                      ; D568   00C2
        MVO     R2,     G_0320                  ; D569   0242 0320
        CLRR    R2                              ; D56B   01D2
        MVO     R2,     G_01E7                  ; D56C   0242 01E7

        JSR     R5,     L_D574                  ; D56E   0004 01D4 0174

L_D571:
        MVII    #$0001, R0                      ; D571   02B8 0001
L_D573:
        PULR    R7                              ; D573   02B7

L_D574:
        PSHR    R5                              ; D574   0275
        MVI     G_01DF, R3                      ; D575   0283 01DF
        MVI     G_01DB, R2                      ; D577   0282 01DB
        PSHR    R2                              ; D579   0272
        PSHR    R3                              ; D57A   0273
        MVII    #$005A, R1                      ; D57B   02B9 005A
        SUBR    R3,     R1                      ; D57D   0119

        JSR     R5,     L_D592                  ; D57E   0004 01D4 0192

        ANDI    #$00FF, R0                      ; D581   03B8 00FF
        SWAP    R0,     1                       ; D583   0040
        PULR    R1                              ; D584   02B1
        PULR    R2                              ; D585   02B2
        PSHR    R0                              ; D586   0270

        JSR     R5,     L_D592                  ; D587   0004 01D4 0192

        NEGR    R0                              ; D58A   0020
        ANDI    #$00FF, R0                      ; D58B   03B8 00FF
        PULR    R1                              ; D58D   02B1
        XORR    R1,     R0                      ; D58E   01C8
        MVO     R0,     G_0321                  ; D58F   0240 0321
        PULR    R7                              ; D591   02B7

L_D592:
        PSHR    R5                              ; D592   0275
        PSHR    R2                              ; D593   0272
        SDBD                                    ; D594   0001
        MVII    #$6B33, R3                      ; D595   02BB 0033 006B
        MVII    #$0003, R2                      ; D598   02BA 0003

        JSR     R5,     X_DIV                   ; D59A   0004 011C 01FB

        ADDR    R0,     R3                      ; D59D   00C3
        MVI@    R3,     R1                      ; D59E   0299
        PULR    R0                              ; D59F   02B0

        JSR     R5,     X_MPY                   ; D5A0   0004 011C 01DC

        MOVR    R2,     R1                      ; D5A3   0091
        MVII    #$0078, R2                      ; D5A4   02BA 0078

        JSR     R5,     X_DIV                   ; D5A6   0004 011C 01FB

        PULR    R7                              ; D5A9   02B7

L_D5AA:
        PSHR    R5                              ; D5AA   0275
        MVI     G_0326, R3                      ; D5AB   0283 0326
        SDBD                                    ; D5AD   0001
        CMPI    #$67BD, R3                      ; D5AE   037B 00BD 0067
        BEQ     L_D5F0                          ; D5B1   0204 003D

        MVI     G_0335, R3                      ; D5B3   0283 0335
        SDBD                                    ; D5B5   0001
        CMPI    #$9042, R3                      ; D5B6   037B 0042 0090
        BEQ     L_D5F0                          ; D5B9   0204 0035

        MVI     G_0327, R3                      ; D5BB   0283 0327
        SWAP    R3,     1                       ; D5BD   0043
        ANDI    #$00FF, R3                      ; D5BE   03BB 00FF
        CMPI    #$0099, R3                      ; D5C0   037B 0099
        BGT     L_D5F0                          ; D5C2   020E 002C

        MVI     G_01D0, R3                      ; D5C4   0283 01D0
        TSTR    R3                              ; D5C6   009B
        BNEQ    L_D5F0                          ; D5C7   020C 0027

        MVII    #$0003, R0                      ; D5C9   02B8 0003

        JSR     R5,     .EXEC.6D5               ; D5CB   0004 0114 02D5

        CLRR    R0                              ; D5CE   01C0
        MVO     R0,     G_0339                  ; D5CF   0240 0339
        MVII    #$00FF, R0                      ; D5D1   02B8 00FF
        MVO     R0,     G_01EB                  ; D5D3   0240 01EB
        MVII    #$0001, R0                      ; D5D5   02B8 0001
        MVO     R0,     G_01D0                  ; D5D7   0240 01D0
        MVI     G_0327, R3                      ; D5D9   0283 0327
        SUBI    #$0200, R3                      ; D5DB   033B 0200
        MVO     R3,     G_0337                  ; D5DD   0243 0337
        MVII    #$0053, R3                      ; D5DF   02BB 0053
        SWAP    R3,     1                       ; D5E1   0043
        MVO     R3,     G_0338                  ; D5E2   0243 0338
        MVII    #$0008, R1                      ; D5E4   02B9 0008
        MVII    #$0001, R0                      ; D5E6   02B8 0001

        JSR     R5,     .EXEC.629               ; D5E8   0004 0114 0229

        MVO     R0,     G_0339                  ; D5EB   0240 0339

        JSR     R5,     L_D5F1                  ; D5ED   0004 01D4 01F1

L_D5F0:
        PULR    R7                              ; D5F0   02B7

L_D5F1:
        PSHR    R5                              ; D5F1   0275
        MVII    #$0014, R0                      ; D5F2   02B8 0014

        JSR     R5,     X_RAND2                 ; D5F4   0004 0114 029E

        ADDI    #$0014, R0                      ; D5F7   02F8 0014
        MVO     R0,     G_01D3                  ; D5F9   0240 01D3
        SLR     R0,     2                       ; D5FB   0064
        MOVR    R0,     R1                      ; D5FC   0081

        JSR     R5,     L_D630                  ; D5FD   0004 01D4 0230

        PULR    R7                              ; D600   02B7

        PSHR    R5                              ; D601   0275
        MVI     G_01E6, R1                      ; D602   0281 01E6
        TSTR    R1                              ; D604   0089
        BNEQ    L_D620                          ; D605   020C 0019

        MVI     G_01D3, R1                      ; D607   0281 01D3
        TSTR    R1                              ; D609   0089
        BEQ     L_D620                          ; D60A   0204 0014

        MVI     G_01EB, R0                      ; D60C   0280 01EB

        JSR     R5,     X_EXT_SIGN_LO           ; D60E   0004 0114 0268

        TSTR    R0                              ; D611   0080
        BMI     L_D620                          ; D612   020B 000C

        DECR    R1                              ; D614   0011
        MVO     R1,     G_01D3                  ; D615   0241 01D3
        PSHR    R1                              ; D617   0271
        SLR     R1,     2                       ; D618   0065

        JSR     R5,     L_D630                  ; D619   0004 01D4 0230

        PULR    R1                              ; D61C   02B1
        TSTR    R1                              ; D61D   0089
        BEQ     L_D621                          ; D61E   0204 0001
L_D620:
        PULR    R7                              ; D620   02B7

L_D621:
        MVII    #$0288, R4                      ; D621   02BC 0288
        SDBD                                    ; D623   0001
        MVII    #$3200, R3                      ; D624   02BB 0000 0032
        MVO@    R3,     R4                      ; D627   0263
        MVO@    R3,     R4                      ; D628   0263
        MVO@    R3,     R4                      ; D629   0263
        MVO@    R3,     R4                      ; D62A   0263
        ADDI    #$0010, R4                      ; D62B   02FC 0010
        MVO@    R3,     R4                      ; D62D   0263
        MVO@    R3,     R4                      ; D62E   0263
        PULR    R7                              ; D62F   02B7

L_D630:
        PSHR    R5                              ; D630   0275
        SDBD                                    ; D631   0001
        MVII    #$3200, R3                      ; D632   02BB 0000 0032
        MVII    #$0288, R4                      ; D635   02BC 0288
        MVO@    R3,     R4                      ; D637   0263
        MVO@    R3,     R4                      ; D638   0263
        MVO@    R3,     R4                      ; D639   0263
        MVO@    R3,     R4                      ; D63A   0263
        INCR    R1                              ; D63B   0009
        MOVR    R1,     R0                      ; D63C   0088
        TSTR    R0                              ; D63D   0080
        BEQ     L_D65B                          ; D63E   0204 001B

        MVII    #$0288, R4                      ; D640   02BC 0288
        MVII    #$0004, R2                      ; D642   02BA 0004
L_D644:
        MVII    #$0003, R1                      ; D644   02B9 0003
        SDBD                                    ; D646   0001
        MVII    #$3B4E, R3                      ; D647   02BB 004E 003B
L_D64A:
        MVO@    R3,     R4                      ; D64A   0263
        DECR    R4                              ; D64B   0014
        ADDI    #$0008, R3                      ; D64C   02FB 0008
        DECR    R0                              ; D64E   0010
        TSTR    R0                              ; D64F   0080
        BEQ     L_D65B                          ; D650   0204 0009

        DECR    R1                              ; D652   0011
        TSTR    R1                              ; D653   0089
        BNEQ    L_D64A                          ; D654   022C 000B

        INCR    R4                              ; D656   000C
        DECR    R2                              ; D657   0012
        TSTR    R2                              ; D658   0092
        BNEQ    L_D644                          ; D659   022C 0016
L_D65B:
        PULR    R7                              ; D65B   02B7

        PSHR    R5                              ; D65C   0275
        MVI     G_01E6, R1                      ; D65D   0281 01E6
        TSTR    R1                              ; D65F   0089
        BNEQ    L_D687                          ; D660   020C 0025

        JSR     R5,     L_D73E                  ; D662   0004 01D4 033E
        JSR     R5,     L_D695                  ; D665   0004 01D4 0295

        MVI     G_0321, R1                      ; D668   0281 0321
        MVI     G_01E7, R0                      ; D66A   0280 01E7
        MVI     G_0324, R2                      ; D66C   0282 0324

        JSR     R5,     L_D688                  ; D66E   0004 01D4 0288

        MVO     R1,     G_0321                  ; D671   0241 0321
        MVO     R3,     G_01E7                  ; D673   0243 01E7
        MVI     G_01D0, R4                      ; D675   0284 01D0
        TSTR    R4                              ; D677   00A4
        BEQ     L_D687                          ; D678   0204 000D

        MVI     G_0339, R1                      ; D67A   0281 0339
        MVI     G_01EA, R0                      ; D67C   0280 01EA
        MVII    #$0070, R2                      ; D67E   02BA 0070

        JSR     R5,     L_D688                  ; D680   0004 01D4 0288

        MVO     R1,     G_0339                  ; D683   0241 0339
        MVO     R3,     G_01EA                  ; D685   0243 01EA
L_D687:
        PULR    R7                              ; D687   02B7

L_D688:
        PSHR    R5                              ; D688   0275
        TSTR    R1                              ; D689   0089
        BEQ     L_D694                          ; D68A   0204 0008

        ADDR    R0,     R2                      ; D68C   00C2
        MOVR    R2,     R3                      ; D68D   0093
        SWAP    R2,     1                       ; D68E   0042
        ANDI    #$00FF, R2                      ; D68F   03BA 00FF
        BEQ     L_D694                          ; D691   0204 0001

        ADDR    R2,     R1                      ; D693   00D1
L_D694:
        PULR    R7                              ; D694   02B7

L_D695:
        PSHR    R5                              ; D695   0275
        MVI     G_01D0, R3                      ; D696   0283 01D0
        TSTR    R3                              ; D698   009B
        BEQ     L_D716                          ; D699   0204 007B

        MVI     G_01D3, R3                      ; D69B   0283 01D3
        TSTR    R3                              ; D69D   009B
        BEQ     L_D716                          ; D69E   0204 0076

        MVI     G_01EB, R0                      ; D6A0   0280 01EB

        JSR     R5,     X_EXT_SIGN_LO           ; D6A2   0004 0114 0268

        TSTR    R0                              ; D6A5   0080
        BMI     L_D71A                          ; D6A6   020B 0072

        MOVR    R0,     R1                      ; D6A8   0081
        MVII    #$001E, R0                      ; D6A9   02B8 001E

        JSR     R5,     .EXEC.629               ; D6AB   0004 0114 0229

        MOVR    R0,     R1                      ; D6AE   0081
        SDBD                                    ; D6AF   0001
        ANDI    #$FF00, R1                      ; D6B0   03B9 0000 00FF
        ANDI    #$00FF, R0                      ; D6B3   03B8 00FF
        SWAP    R1,     1                       ; D6B5   0041
        PSHR    R0                              ; D6B6   0270
        MOVR    R1,     R0                      ; D6B7   0088

        JSR     R5,     X_EXT_SIGN_LO           ; D6B8   0004 0114 0268

        TSTR    R0                              ; D6BB   0080
        BMI     L_D6C9                          ; D6BC   020B 000B

        MVI     G_01D1, R1                      ; D6BE   0281 01D1
        SLL     R0,     2                       ; D6C0   004C
        SLL     R0,     2                       ; D6C1   004C

        JSR     R5,     L_D737                  ; D6C2   0004 01D4 0337

        MVO     R1,     G_01D1                  ; D6C5   0241 01D1
        B       L_D6D6                          ; D6C7   0200 000D

L_D6C9:
        MVI     G_01D2, R1                      ; D6C9   0281 01D2
        NEGR    R0                              ; D6CB   0020
        SLL     R0,     2                       ; D6CC   004C
        SLL     R0,     2                       ; D6CD   004C

        JSR     R5,     L_D737                  ; D6CE   0004 01D4 0337

        MVO     R1,     G_01D2                  ; D6D1   0241 01D2
        NEGR    R0                              ; D6D3   0020
        ANDI    #$00FF, R0                      ; D6D4   03B8 00FF
L_D6D6:
        PULR    R1                              ; D6D6   02B1
        PSHR    R0                              ; D6D7   0270
        MOVR    R1,     R0                      ; D6D8   0088

        JSR     R5,     X_EXT_SIGN_LO           ; D6D9   0004 0114 0268

        TSTR    R0                              ; D6DC   0080
        BMI     L_D6EA                          ; D6DD   020B 000B

        MVI     G_01EC, R1                      ; D6DF   0281 01EC
        SLL     R0,     2                       ; D6E1   004C
        SLL     R0,     2                       ; D6E2   004C

        JSR     R5,     L_D737                  ; D6E3   0004 01D4 0337

        MVO     R1,     G_01EC                  ; D6E6   0241 01EC
        B       L_D6F7                          ; D6E8   0200 000D

L_D6EA:
        MVI     G_01ED, R1                      ; D6EA   0281 01ED
        NEGR    R0                              ; D6EC   0020
        SLL     R0,     2                       ; D6ED   004C
        SLL     R0,     2                       ; D6EE   004C

        JSR     R5,     L_D737                  ; D6EF   0004 01D4 0337

        MVO     R1,     G_01ED                  ; D6F2   0241 01ED
        NEGR    R0                              ; D6F4   0020
        ANDI    #$00FF, R0                      ; D6F5   03B8 00FF
L_D6F7:
        MVI     G_0339, R1                      ; D6F7   0281 0339
        MOVR    R1,     R2                      ; D6F9   008A
        ANDI    #$00FF, R1                      ; D6FA   03B9 00FF
        SDBD                                    ; D6FC   0001
        ANDI    #$FF00, R2                      ; D6FD   03BA 0000 00FF
        ADDR    R1,     R0                      ; D700   00C8

        JSR     R5,     L_D71B                  ; D701   0004 01D4 031B

        MOVR    R0,     R1                      ; D704   0081
        PULR    R3                              ; D705   02B3
        SWAP    R3,     1                       ; D706   0043
        ADDR    R3,     R2                      ; D707   00DA
        SDBD                                    ; D708   0001
        ANDI    #$FF00, R2                      ; D709   03BA 0000 00FF
        SWAP    R2,     1                       ; D70C   0042
        MOVR    R2,     R0                      ; D70D   0090

        JSR     R5,     L_D71B                  ; D70E   0004 01D4 031B

        SWAP    R0,     1                       ; D711   0040
        XORR    R0,     R1                      ; D712   01C1
        MVO     R1,     G_0339                  ; D713   0241 0339
        PULR    R7                              ; D715   02B7

L_D716:
        CLRR    R1                              ; D716   01C9
        DECR    R1                              ; D717   0011
        MVO     R1,     G_0333                  ; D718   0241 0333
L_D71A:
        PULR    R7                              ; D71A   02B7

L_D71B:
        PSHR    R5                              ; D71B   0275
        TSTR    R0                              ; D71C   0080
        BNEQ    L_D721                          ; D71D   020C 0002

        MVII    #$0001, R0                      ; D71F   02B8 0001

L_D721:
        JSR     R5,     X_EXT_SIGN_LO           ; D721   0004 0114 0268

        CLRR    R4                              ; D724   01E4
        TSTR    R0                              ; D725   0080
        BPL     L_D72B                          ; D726   0203 0003

        NEGR    R0                              ; D728   0020
        MVII    #$0001, R4                      ; D729   02BC 0001

L_D72B:
        JSR     R5,     X_CLAMP                 ; D72B   0004 0114 0270
        DECLE   $0001                           ; D72E   0001

        SLR     R0,     1                       ; D72F   0060
        TSTR    R4                              ; D730   00A4
        BEQ     L_D736                          ; D731   0204 0003

        NEGR    R0                              ; D733   0020
        ANDI    #$00FF, R0                      ; D734   03B8 00FF
L_D736:
        PULR    R7                              ; D736   02B7

L_D737:
        PSHR    R5                              ; D737   0275
        ADDR    R1,     R0                      ; D738   00C8
        MOVR    R0,     R1                      ; D739   0081
        SWAP    R0,     1                       ; D73A   0040
        ANDI    #$00FF, R0                      ; D73B   03B8 00FF
        PULR    R7                              ; D73D   02B7

L_D73E:
        PSHR    R5                              ; D73E   0275
        MVI     G_031F, R0                      ; D73F   0280 031F
        SWAP    R0,     1                       ; D741   0040
        ANDI    #$00FF, R0                      ; D742   03B8 00FF
        CMPI    #$00A0, R0                      ; D744   0378 00A0
        BGT     L_D755                          ; D746   020E 000D

        MVI     G_0320, R0                      ; D748   0280 0320
        SWAP    R0,     1                       ; D74A   0040
        ANDI    #$00FF, R0                      ; D74B   03B8 00FF
        BMI     L_D755                          ; D74D   020B 0006

        CMPI    #$0064, R0                      ; D74F   0378 0064
        BGT     L_D755                          ; D751   020E 0002
        B       L_D758                          ; D753   0200 0003

L_D755:
        JSR     R5,     L_6501                  ; D755   0004 0164 0101

L_D758:
        PULR    R7                              ; D758   02B7

L_D759:
        PSHR    R5                              ; D759   0275

        JSR     R5,     X_PLAY_SFX2             ; D75A   0004 0118 03BE
        DECLE   $0092                           ; D75D  SFX prio
        DECLE   $0079                           ; D75E  SFX data
        DECLE   $03B7                           ; D75F  SFX data
        DECLE   $03ED                           ; D760  SFX data
        DECLE   $010C,  $0000                   ; D761  SFX data
        DECLE   $000B                           ; D763  SFX data
        DECLE   $008F,  $0077                   ; D764  SFX data
        DECLE   $02CF                           ; D766  SFX end

L_D767:
        PSHR    R5                              ; D767   0275

        JSR     R5,     X_PLAY_SFX2             ; D768   0004 0118 03BE
        DECLE   $0082                           ; D76B  SFX prio
        DECLE   $0319                           ; D76C  SFX data
        DECLE   $03B7                           ; D76D  SFX data
        DECLE   $008C,  $0000                   ; D76E  SFX data
        DECLE   $0048,  $0004                   ; D770  SFX data
        DECLE   $0074,  $03F8                   ; D772  SFX data
        DECLE   $0141,  $00E1                   ; D774  SFX data
        DECLE   $0001,  $0012                   ; D776  SFX data
        DECLE   $006D                           ; D778  SFX data
        DECLE   $000B                           ; D779  SFX data
        DECLE   $008F,  $003B                   ; D77A  SFX data
        DECLE   $02CF                           ; D77C  SFX end

L_D77D:
        PSHR    R5                              ; D77D   0275

        JSR     R5,     X_PLAY_SFX2             ; D77E   0004 0118 03BE
        DECLE   $0090                           ; D781  SFX prio
        DECLE   $004F,  $000A                   ; D782  SFX data
        DECLE   $00E9                           ; D784  SFX data
        DECLE   $03B7                           ; D785  SFX data
        DECLE   $0060,  $0000                   ; D786  SFX data
        DECLE   $03DB                           ; D788  SFX data
        DECLE   $01ED                           ; D789  SFX data
        DECLE   $03C7                           ; D78A  SFX data
        DECLE   $000F,  $0014                   ; D78B  SFX data
        DECLE   $00CC,  $0000                   ; D78D  SFX data
        DECLE   $000B                           ; D78F  SFX data
        DECLE   $0063,  $03C8                   ; D790  SFX data
        DECLE   $008F,  $003B                   ; D792  SFX data
        DECLE   $02CF                           ; D794  SFX end

L_D795:
        PSHR    R5                              ; D795   0275

        JSR     R5,     X_PLAY_SFX1             ; D796   0004 0118 03BB
        DECLE   $0079                           ; D799  SFX data
        DECLE   $03B7                           ; D79A  SFX data
        DECLE   $016D                           ; D79B  SFX data
        DECLE   $009C,  $0310                   ; D79C  SFX data
        DECLE   $004B                           ; D79E  SFX data
        DECLE   $008F,  $0059                   ; D79F  SFX data
        DECLE   $02CF                           ; D7A1  SFX end

L_D7A2:
        PSHR    R5                              ; D7A2   0275

        JSR     R5,     X_PLAY_SFX2             ; D7A3   0004 0118 03BE
        DECLE   $0078                           ; D7A6  SFX prio
        DECLE   $0389                           ; D7A7  SFX data
        DECLE   $004F,  $0008                   ; D7A8  SFX data
        DECLE   $0380,  $00C8                   ; D7AA  SFX data
        DECLE   $0348,  $00CD                   ; D7AC  SFX data
        DECLE   $0304,  $00FA                   ; D7AE  SFX data
        DECLE   $0001,  $039F                   ; D7B0  SFX data
        DECLE   $00A3,  $03D8                   ; D7B2  SFX data
        DECLE   $02CF                           ; D7B4  SFX end

L_D7B5:
        PSHR    R5                              ; D7B5   0275

        JSR     R5,     X_PLAY_MUS1             ; D7B6   0004 0118 0327
        DECLE   $01F4                           ; D7B9  Note (short)
        DECLE   $01A4                           ; D7BA  Note (short)
        DECLE   $0174                           ; D7BB  Note (short)
        DECLE   $0134                           ; D7BC  Note (short)
        DECLE   $0174                           ; D7BD  Note (short)
        DECLE   $01F4                           ; D7BE  Note (short)
        DECLE   $0184                           ; D7BF  Note (short)
        DECLE   $01E4                           ; D7C0  Note (short)
        DECLE   $0214                           ; D7C1  Note (short)
        DECLE   $01F4                           ; D7C2  Note (short)
        DECLE   $01A4                           ; D7C3  Note (short)
        DECLE   $0174                           ; D7C4  Note (short)
        DECLE   $0134                           ; D7C5  Note (short)
        DECLE   $0174                           ; D7C6  Note (short)
        DECLE   $01F4                           ; D7C7  Note (short)
        DECLE   $0184                           ; D7C8  Note (short)
        DECLE   $01E4                           ; D7C9  Note (short)
        DECLE   $0214                           ; D7CA  Note (short)
        DECLE   $01A4                           ; D7CB  Note (short)
        DECLE   $0264                           ; D7CC  Note (short)
        DECLE   $01A4                           ; D7CD  Note (short)
        DECLE   $01C4                           ; D7CE  Note (short)
        DECLE   $0244                           ; D7CF  Note (short)
        DECLE   $02D4                           ; D7D0  Note (short)
        DECLE   $0184                           ; D7D1  Note (short)
        DECLE   $02D4                           ; D7D2  Note (short)
        DECLE   $01E4                           ; D7D3  Note (short)
        DECLE   $01F4                           ; D7D4  Note (short)
        DECLE   $01A4                           ; D7D5  Note (short)
        DECLE   $0174                           ; D7D6  Note (short)
        DECLE   $0134                           ; D7D7  Note (short)
        DECLE   $00E4                           ; D7D8  Note (short)
        DECLE   $00B4                           ; D7D9  Note (short)
        DECLE   $0075                           ; D7DA  Note (short)
        DECLE   $0000                           ; D7DB  End of music

        PULR    R7                              ; D7DC   02B7

L_D7DD:
        PSHR    R5                              ; D7DD   0275
        PSHR    R0                              ; D7DE   0270
        MVII    #$0000, R0                      ; D7DF   02B8 0000
        MVO     R0,     G_01CB                  ; D7E1   0240 01CB
        PULR    R0                              ; D7E3   02B0
        PULR    R7                              ; D7E4   02B7

L_D7E5:
        PSHR    R5                              ; D7E5   0275
        PSHR    R0                              ; D7E6   0270
        MVII    #$0001, R0                      ; D7E7   02B8 0001
        MVO     R0,     G_01CB                  ; D7E9   0240 01CB
        PULR    R0                              ; D7EB   02B0
        PULR    R7                              ; D7EC   02B7

L_D7ED:
        PSHR    R5                              ; D7ED   0275
        PSHR    R0                              ; D7EE   0270
        MVII    #$0002, R0                      ; D7EF   02B8 0002
        MVO     R0,     G_01CB                  ; D7F1   0240 01CB
        PULR    R0                              ; D7F3   02B0
        PULR    R7                              ; D7F4   02B7

L_D7F5:
        PSHR    R5                              ; D7F5   0275
        PSHR    R0                              ; D7F6   0270
        MVII    #$0000, R0                      ; D7F7   02B8 0000
        MVO     R0,     G_01CA                  ; D7F9   0240 01CA
        PULR    R0                              ; D7FB   02B0
        PULR    R7                              ; D7FC   02B7

L_D7FD:
        PSHR    R5                              ; D7FD   0275
        PSHR    R0                              ; D7FE   0270
        MVII    #$0001, R0                      ; D7FF   02B8 0001
        MVO     R0,     G_01CA                  ; D801   0240 01CA
        PULR    R0                              ; D803   02B0
        PULR    R7                              ; D804   02B7

L_D805:
        PSHR    R5                              ; D805   0275
        PSHR    R0                              ; D806   0270
        MVII    #$0002, R0                      ; D807   02B8 0002
        MVO     R0,     G_01CA                  ; D809   0240 01CA
        PULR    R0                              ; D80B   02B0
        PULR    R7                              ; D80C   02B7

L_D80D:
        PSHR    R5                              ; D80D   0275
        MVI     G_01CB, R0                      ; D80E   0280 01CB
        CMPI    #$0000, R0                      ; D810   0378 0000
        PULR    R7                              ; D812   02B7

L_D813:
        PSHR    R5                              ; D813   0275
        MVI     G_01CB, R0                      ; D814   0280 01CB
        CMPI    #$0001, R0                      ; D816   0378 0001
        PULR    R7                              ; D818   02B7

L_D819:
        PSHR    R5                              ; D819   0275
        MVI     G_01CB, R0                      ; D81A   0280 01CB
        CMPI    #$0002, R0                      ; D81C   0378 0002
        PULR    R7                              ; D81E   02B7

L_D81F:
        PSHR    R5                              ; D81F   0275
        MVI     G_01CA, R0                      ; D820   0280 01CA
        CMPI    #$0000, R0                      ; D822   0378 0000
        PULR    R7                              ; D824   02B7

L_D825:
        PSHR    R5                              ; D825   0275
        MVI     G_01CA, R0                      ; D826   0280 01CA
        CMPI    #$0001, R0                      ; D828   0378 0001
        PULR    R7                              ; D82A   02B7

        PSHR    R5                              ; D82B   0275
        MVI     G_01CA, R0                      ; D82C   0280 01CA
        CMPI    #$0002, R0                      ; D82E   0378 0002
        PULR    R7                              ; D830   02B7

L_D831:
        PSHR    R5                              ; D831   0275
        MVI@    R1,     R0                      ; D832   0288
        ANDI    #$0008, R0                      ; D833   03B8 0008
        TSTR    R0                              ; D835   0080
        PULR    R7                              ; D836   02B7

L_D837:
        PSHR    R5                              ; D837   0275
        MVI     G_032D, R0                      ; D838   0280 032D
        ANDI    #$0008, R0                      ; D83A   03B8 0008
        TSTR    R0                              ; D83C   0080
        PULR    R7                              ; D83D   02B7

        DECLE   $0055,  $0000,  $00BE,  $00D8   ; D83E   0055 0000 00BE 00D8
        DECLE   $0000,  $004A,  $0000,  $000E   ; D842   0000 004A 0000 000E
        DECLE   $0000,  $0000,  $00F0,  $0003   ; D846   0000 0000 00F0 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; D84A   0000 0000 0000 0000
        DECLE   $0040,  $0000,  $00C7,  $00D8   ; D84E   0040 0000 00C7 00D8
        DECLE   $0000,  $0000,  $0000,  $0000   ; D852   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D856   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D85A   0000 0000 0000 0000
        DECLE   $0046,  $0018,  $00E3,  $00D8   ; D85E   0046 0018 00E3 00D8
        DECLE   $0000,  $0046,  $0000,  $0010   ; D862   0000 0046 0000 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; D866   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D86A   0000 0000 0000 0000
        DECLE   $0040,  $0018,  $0047,  $00D9   ; D86E   0040 0018 0047 00D9
        DECLE   $0000,  $0000,  $0000,  $0000   ; D872   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0020,  $0001   ; D876   0000 0000 0020 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; D87A   0000 0000 0000 0000
        DECLE   $0040,  $0018,  $0047,  $00D9   ; D87E   0040 0018 0047 00D9
        DECLE   $0000,  $0000,  $0000,  $0000   ; D882   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0022,  $0001   ; D886   0000 0000 0022 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; D88A   0000 0000 0000 0000
        DECLE   $0040,  $0018,  $0047,  $00D9   ; D88E   0040 0018 0047 00D9
        DECLE   $0000,  $0000,  $0000,  $0000   ; D892   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0024,  $0001   ; D896   0000 0000 0024 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; D89A   0000 0000 0000 0000
        DECLE   $0040,  $0018,  $0047,  $00D9   ; D89E   0040 0018 0047 00D9
        DECLE   $0000,  $0000,  $0000,  $0000   ; D8A2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0026,  $0001   ; D8A6   0000 0000 0026 0001
        DECLE   $0000,  $0000,  $0085,  $0040   ; D8AA   0000 0000 0085 0040
        DECLE   $0040,  $0018,  $0047,  $00D9   ; D8AE   0040 0018 0047 00D9
        DECLE   $0000,  $0000,  $0000,  $0000   ; D8B2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0028,  $0001   ; D8B6   0000 0000 0028 0001
        DECLE   $0000,  $0000,  $00CD,  $0047   ; D8BA   0000 0000 00CD 0047
        DECLE   $0000,  $0000,  $0010,  $005C   ; D8BE   0000 0000 0010 005C
        DECLE   $0003,  $0020,  $0000,  $0000   ; D8C2   0003 0020 0000 0000
        DECLE   $0000,  $03E4,  $005A,  $0000   ; D8C6   0000 03E4 005A 0000
        DECLE   $0000,  $0001,  $003E,  $000B   ; D8CA   0000 0001 003E 000B
        DECLE   $008E,  $005B,  $02CA,  $015B   ; D8CE   008E 005B 02CA 015B
        DECLE   $01CA,  $005B,  $01CA,  $015B   ; D8D2   01CA 005B 01CA 015B
        DECLE   $03CA,  $005B,  $03CA,  $015B   ; D8D6   03CA 005B 03CA 015B
        DECLE   $039E,  $00D3,  $0000,  $0000   ; D8DA   039E 00D3 0000 0000
        DECLE   $0008,  $0000,  $0000,  $0000   ; D8DE   0008 0000 0000 0000
        DECLE   $0000,  $0300,  $0000,  $006F   ; D8E2   0000 0300 0000 006F
        DECLE   $005C,  $0001,  $0012,  $0000   ; D8E6   005C 0001 0012 0000
        DECLE   $0000,  $0000,  $0300,  $0000   ; D8EA   0000 0000 0300 0000
        DECLE   $0000,  $0000,  $0001,  $0012   ; D8EE   0000 0000 0001 0012
        DECLE   $0001,  $007B,  $005C,  $0000   ; D8F2   0001 007B 005C 0000
        DECLE   $0000,  $0300,  $0000,  $006F   ; D8F6   0000 0300 0000 006F
        DECLE   $005C,  $0001,  $0014,  $0000   ; D8FA   005C 0001 0014 0000
        DECLE   $0000,  $0000,  $039E,  $00D3   ; D8FE   0000 0000 039E 00D3
        DECLE   $0000,  $0000,  $0001,  $0010   ; D902   0000 0000 0001 0010
        DECLE   $0000,  $0000,  $0000,  $039E   ; D906   0000 0000 0000 039E
        DECLE   $00D3,  $0000,  $0000,  $0001   ; D90A   00D3 0000 0000 0001
        DECLE   $0000,  $0001,  $007B,  $005C   ; D90E   0000 0001 007B 005C
        DECLE   $0000,  $0000,  $039E,  $00D3   ; D912   0000 0000 039E 00D3
        DECLE   $00AB,  $005A,  $0001,  $0016   ; D916   00AB 005A 0001 0016
        DECLE   $0001,  $007B,  $005C,  $0000   ; D91A   0001 007B 005C 0000
        DECLE   $0000,  $039E,  $00D3,  $00B7   ; D91E   0000 039E 00D3 00B7
        DECLE   $005A,  $0001,  $0018,  $0001   ; D922   005A 0001 0018 0001
        DECLE   $007B,  $005C,  $0000,  $0000   ; D926   007B 005C 0000 0000
        DECLE   $039E,  $00D3,  $00C3,  $005A   ; D92A   039E 00D3 00C3 005A
        DECLE   $0001,  $001A,  $0001,  $007B   ; D92E   0001 001A 0001 007B
        DECLE   $005C,  $0000,  $0000,  $0300   ; D932   005C 0000 0000 0300
        DECLE   $0000,  $0066,  $00D3,  $0001   ; D936   0000 0066 00D3 0001
        DECLE   $001C,  $0000,  $0000,  $0000   ; D93A   001C 0000 0000 0000
        DECLE   $0300,  $0000,  $0000,  $0000   ; D93E   0300 0000 0000 0000
        DECLE   $0001,  $001E,  $0000,  $0000   ; D942   0001 001E 0000 0000
        DECLE   $0000,  $0340,  $0059,  $0000   ; D946   0000 0340 0059 0000
        DECLE   $0000,  $000B,  $0026,  $0003   ; D94A   0000 000B 0026 0003
        DECLE   $0086,  $0059,  $02E1,  $0059   ; D94E   0086 0059 02E1 0059
        DECLE   $0338,  $005A,  $004E,  $005A   ; D952   0338 005A 004E 005A
        DECLE   $0001,  $003C,  $0000,  $0000   ; D956   0001 003C 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D95A   0000 0000 0000

        INCR    R2                              ; D95D   000A
        ADDR    R3,     R7                      ; D95E   00DF

        DECLE   $000F,  $0040,  $0000,  $0000   ; D95F   000F 0040 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D963   0000 0000 0000

        SWAP    R2,     2                       ; D966   0046
        ADDR    R3,     R7                      ; D967   00DF

        DECLE   $000F,  $0040,  $0000,  $0000   ; D968   000F 0040 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D96C   0000 0000 0000 0000
        DECLE   $0000                           ; D970   0000

        INCR    R7                              ; D971   000F

        SWAP    R0,     1                       ; D972   0040
L_D973:
        INCR    R5                              ; D973   000D
        MOVR    R4,     R3                      ; D974   00A3
        ADDR    R3,     R7                      ; D975   00DF

        MVI@    R2,     R2                      ; D976   0292
        ADDR    R3,     R7                      ; D977   00DF

        DECLE   $02A5,  $01DF                   ; D978   02A5 01DF

        ANDR    R4,     R5                      ; D97A   01A5
        ADDR    R3,     R7                      ; D97B   00DF

        DECLE   $01A5,  $01DF                   ; D97C   01A5 01DF

        AND@    R4,     R5                      ; D97E   03A5
        ADDR    R3,     R7                      ; D97F   00DF

        DECLE   $03A5,  $01DF,  $000C,  $000E   ; D980   03A5 01DF 000C 000E
        DECLE   $0000,  $000C,  $000C,  $000C   ; D984   0000 000C 000C 000C
        DECLE   $000C,  $000E,  $000C,  $000C   ; D988   000C 000E 000C 000C
        DECLE   $000C,  $003C,  $0028,  $0028   ; D98C   000C 003C 0028 0028
        DECLE   $0008,  $000C,  $0006,  $0007   ; D990   0008 000C 0006 0007
        DECLE   $0000,  $000C,  $001C,  $001C   ; D994   0000 000C 001C 001C
        DECLE   $001E,  $0018,  $001C,  $003E   ; D998   001E 0018 001C 003E
        DECLE   $0022,  $002E,  $0028,  $0020   ; D99C   0022 002E 0028 0020
        DECLE   $0020,  $0010,  $0006,  $0007   ; D9A0   0020 0010 0006 0007
        DECLE   $0000,  $001C,  $003C,  $002E   ; D9A4   0000 001C 003C 002E
        DECLE   $002C,  $0000,  $001C,  $003F   ; D9A8   002C 0000 001C 003F
        DECLE   $0021,  $0027,  $0024,  $0044   ; D9AC   0021 0027 0024 0044
        DECLE   $0040,  $0040,  $000C,  $000E   ; D9B0   0040 0040 000C 000E
        DECLE   $0000,  $0078,  $0058,  $005F   ; D9B4   0000 0078 0058 005F
        DECLE   $0018,  $0000,  $0018,  $003F   ; D9B8   0018 0000 0018 003F
        DECLE   $0021,  $0062,  $0042,  $00C0   ; D9BC   0021 0062 0042 00C0
        DECLE   $0080,  $0080,  $000C,  $000E   ; D9C0   0080 0080 000C 000E
        DECLE   $0070,  $0058,  $005F,  $0018   ; D9C4   0070 0058 005F 0018
        DECLE   $0018,  $0000,  $0018,  $003F   ; D9C8   0018 0000 0018 003F
        DECLE   $0021,  $0061,  $0041,  $00C0   ; D9CC   0021 0061 0041 00C0
        DECLE   $0080,  $0000,  $000C,  $000E   ; D9D0   0080 0000 000C 000E
        DECLE   $0000,  $0078,  $0058,  $005F   ; D9D4   0000 0078 0058 005F
        DECLE   $0018,  $0000,  $0018,  $003C   ; D9D8   0018 0000 0018 003C
        DECLE   $0024,  $0066,  $00C2,  $0082   ; D9DC   0024 0066 00C2 0082
        DECLE   $0003,  $0000,  $0006,  $0007   ; D9E0   0003 0000 0006 0007
        DECLE   $0000,  $001C,  $003C,  $002E   ; D9E4   0000 001C 003C 002E
        DECLE   $002C,  $0000,  $0038,  $003C   ; D9E8   002C 0000 0038 003C
        DECLE   $0024,  $00E4,  $0084,  $0084   ; D9EC   0024 00E4 0084 0084
        DECLE   $0004,  $0006,  $0006,  $0007   ; D9F0   0004 0006 0006 0007
        DECLE   $0000,  $000C,  $001C,  $001C   ; D9F4   0000 000C 001C 001C
        DECLE   $001E,  $0018,  $0018,  $0018   ; D9F8   001E 0018 0018 0018
        DECLE   $0018,  $0078,  $0048,  $0048   ; D9FC   0018 0078 0048 0048
        DECLE   $0008,  $000C,  $005A,  $005A   ; DA00   0008 000C 005A 005A
        DECLE   $0000,  $003C,  $0018,  $0018   ; DA04   0000 003C 0018 0018
        DECLE   $0018,  $0000,  $0018,  $0018   ; DA08   0018 0000 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; DA0C   0018 0018 0018 0018
        DECLE   $0000,  $0018,  $0000,  $0000   ; DA10   0000 0018 0000 0000
        DECLE   $0018,  $0018,  $0000,  $003C   ; DA14   0018 0018 0000 003C
        DECLE   $003C,  $005A,  $0042,  $0018   ; DA18   003C 005A 0042 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; DA1C   0018 0018 0018 0018
        DECLE   $0000,  $0018,  $0000,  $0000   ; DA20   0000 0018 0000 0000
        DECLE   $0018,  $001A,  $0002,  $003C   ; DA24   0018 001A 0002 003C
        DECLE   $003C,  $0058,  $0040,  $0018   ; DA28   003C 0058 0040 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; DA2C   0018 0018 0018 0018
        DECLE   $0000,  $0018,  $0000,  $0000   ; DA30   0000 0018 0000 0000
        DECLE   $0031,  $0033,  $000E,  $001C   ; DA34   0031 0033 000E 001C
        DECLE   $001A,  $0009,  $0010,  $001C   ; DA38   001A 0009 0010 001C
        DECLE   $001E,  $000A,  $001A,  $0013   ; DA3C   001E 000A 001A 0013
        DECLE   $0020,  $0020,  $0000,  $0000   ; DA40   0020 0020 0000 0000
        DECLE   $0000,  $0000,  $0064,  $006C   ; DA44   0000 0000 0064 006C
        DECLE   $0018,  $0070,  $003C,  $007E   ; DA48   0018 0070 003C 007E
        DECLE   $0059,  $005E,  $0024,  $0004   ; DA4C   0059 005E 0024 0004
        DECLE   $0008,  $0008,  $0000,  $0000   ; DA50   0008 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0060,  $0060   ; DA58   0000 0000 0060 0060
        DECLE   $001C,  $0072,  $0064,  $00FC   ; DA5C   001C 0072 0064 00FC
        DECLE   $00BE,  $00DB,  $0000,  $0000   ; DA60   00BE 00DB 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0003   ; DA64   0000 0000 0003 0003
        DECLE   $001C,  $002E,  $008D,  $0011   ; DA68   001C 002E 008D 0011
        DECLE   $001C,  $001E,  $0012,  $0014   ; DA6C   001C 001E 0012 0014
        DECLE   $0038,  $0046,  $0000,  $0000   ; DA70   0038 0046 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA74   0000 0000 0000 0000
        DECLE   $0003,  $001F,  $002C,  $001C   ; DA78   0003 001F 002C 001C
        DECLE   $002A,  $003D,  $003E,  $000E   ; DA7C   002A 003D 003E 000E
        DECLE   $007A,  $0043,  $0000,  $0000   ; DA80   007A 0043 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA84   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0000   ; DA88   0000 0018 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA94   0000 0000 0000 0000
        DECLE   $0018,  $0024,  $0024,  $0018   ; DA98   0018 0024 0024 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DAA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; DAA4   0000 0000 0000 0018
        DECLE   $0024,  $0042,  $0042,  $0024   ; DAA8   0024 0042 0042 0024
        DECLE   $0018,  $0000,  $0000,  $0000   ; DAAC   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DAB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0014,  $000E   ; DAB4   0000 0000 0014 000E
        DECLE   $001B,  $003B,  $0021,  $0019   ; DAB8   001B 003B 0021 0019
        DECLE   $0008,  $0000,  $0000,  $0000   ; DABC   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DAC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0014,  $000E   ; DAC4   0000 0000 0014 000E
        DECLE   $001B,  $003B,  $0021,  $0019   ; DAC8   001B 003B 0021 0019
        DECLE   $0008,  $0000,  $0000,  $0000   ; DACC   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DAD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0003   ; DAD4   0000 0000 0000 0003
        DECLE   $0006,  $003E,  $0018,  $0070   ; DAD8   0006 003E 0018 0070
        DECLE   $00F0,  $00A0,  $0000,  $0000   ; DADC   00F0 00A0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DAE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; DAE4   0000 0000 0000 0001
        DECLE   $0002,  $0006,  $0006,  $0014   ; DAE8   0002 0006 0006 0014
        DECLE   $004C,  $00F8,  $00A0,  $0000   ; DAEC   004C 00F8 00A0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DAF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0003   ; DAF4   0000 0000 0000 0003
        DECLE   $0006,  $003E,  $0018,  $0070   ; DAF8   0006 003E 0018 0070
        DECLE   $00F0,  $00A0,  $0000,  $0000   ; DAFC   00F0 00A0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB00   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB04   0000 0000 0000 0000

        RLC     R0,     2                       ; DB08   0054
        ADDR    R7,     R6                      ; DB09   00FE
        ADDR    R4,     R7                      ; DB0A   00E7

        DECLE   $0043,  $0002,  $0000,  $0000   ; DB0B   0043 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB0F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0014   ; DB13   0000 0000 0000 0014
        DECLE   $000E,  $001B,  $003B,  $0021   ; DB17   000E 001B 003B 0021
        DECLE   $0019,  $0008,  $0000,  $0000   ; DB1B   0019 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB1F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB23   0000 0000 0000 0000
        DECLE   $0003,  $0006,  $003E,  $0018   ; DB27   0003 0006 003E 0018
        DECLE   $0070,  $00F0,  $00A0,  $0000   ; DB2B   0070 00F0 00A0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB2F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB33   0000 0000 0000 0000
        DECLE   $0001,  $0002,  $0006,  $0006   ; DB37   0001 0002 0006 0006
        DECLE   $0014,  $004C,  $00F8,  $00A0   ; DB3B   0014 004C 00F8 00A0
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB3F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB43   0000 0000 0000 0000
        DECLE   $0003,  $0006,  $003E,  $0018   ; DB47   0003 0006 003E 0018
        DECLE   $0070,  $00F0,  $00A0,  $0000   ; DB4B   0070 00F0 00A0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB4F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB53   0000 0000 0000 0000
        DECLE   $0000                           ; DB57   0000

        RLC     R0,     2                       ; DB58   0054
        ADDR    R7,     R6                      ; DB59   00FE
        ADDR    R4,     R7                      ; DB5A   00E7

        DECLE   $0043,  $0002,  $0000,  $0000   ; DB5B   0043 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB5F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB63   0000 0000 0000 0000
        DECLE   $0008,  $0019,  $0021,  $003B   ; DB67   0008 0019 0021 003B
        DECLE   $001B,  $000E,  $0014,  $0000   ; DB6B   001B 000E 0014 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB6F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB73   0000 0000 0000 0000
        DECLE   $0018,  $003C,  $007E,  $007E   ; DB77   0018 003C 007E 007E
        DECLE   $003C,  $0018,  $0000,  $0000   ; DB7B   003C 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB7F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0020   ; DB83   0000 0000 0018 0020
        DECLE   $0000,  $0004,  $0021,  $0035   ; DB87   0000 0004 0021 0035
        DECLE   $0044,  $0018,  $0018,  $0006   ; DB8B   0044 0018 0018 0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB8F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $00E4   ; DB93   0000 0000 0018 00E4
        DECLE   $0030,  $0064,  $0023,  $0025   ; DB97   0030 0064 0023 0025
        DECLE   $0048,  $0028,  $0020,  $0000   ; DB9B   0048 0028 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB9F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0004   ; DBA3   0000 0000 0018 0004
        DECLE   $0030,  $0004                   ; DBA7   0030 0004
L_DBA9:
        DECR    R7                              ; DBA9   0017

        DECLE   $0002,  $0009,  $003A,  $0030   ; DBAA   0002 0009 003A 0030
        DECLE   $0000,  $0000,  $0000,  $0000   ; DBAE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $0018   ; DBB2   0000 0000 0040 0018
        DECLE   $0004                           ; DBB6   0004

        GSWD    R0                              ; DBB7   0030

        JSR     R4,     .EXEC.041               ; DBB8   0004 0010 0041
        DECLE   $0012,  $005A,  $0050,  $0002   ; DBBB   0012 005A 0050 0002
        DECLE   $0002,  $0000,  $0000,  $0000   ; DBBF   0002 0000 0000 0000
        DECLE   $0000,  $0040,  $0018,  $0004   ; DBC3   0000 0040 0018 0004
        DECLE   $0030,  $0005,  $0010,  $0041   ; DBC7   0030 0005 0010 0041
        DECLE   $0012,  $005A,  $0050,  $000A   ; DBCB   0012 005A 0050 000A
        DECLE   $0082,  $0008,  $0080,  $0000   ; DBCF   0082 0008 0080 0000
        DECLE   $0080,  $0046,  $0018,  $0004   ; DBD3   0080 0046 0018 0004
        DECLE   $0030,  $0005,  $0000,  $0049   ; DBD7   0030 0005 0000 0049
        DECLE   $0002,  $0022,  $0068,  $0032   ; DBDB   0002 0022 0068 0032
        DECLE   $0042,  $0088,  $0084,  $0000   ; DBDF   0042 0088 0084 0000
        DECLE   $0080,  $0055,  $000A,  $003C   ; DBE3   0080 0055 000A 003C
        DECLE   $0040,  $007B,  $0040,  $0091   ; DBE7   0040 007B 0040 0091
        DECLE   $0000,  $0002,  $0040,  $0032   ; DBEB   0000 0002 0040 0032
        DECLE   $0042,  $0088,  $0084,  $0000   ; DBEF   0042 0088 0084 0000
        DECLE   $0088,  $0055,  $0002,  $0054   ; DBF3   0088 0055 0002 0054
        DECLE   $004C,  $001B,  $0046,  $0091   ; DBF7   004C 001B 0046 0091
        DECLE   $0000,  $0002,  $0040,  $0032   ; DBFB   0000 0002 0040 0032
        DECLE   $0042,  $0088,  $0084,  $0080   ; DBFF   0042 0088 0084 0080
        DECLE   $0068,  $0030,  $0005,  $0058   ; DC03   0068 0030 0005 0058
        DECLE   $0058,  $0000,  $0041,  $009D   ; DC07   0058 0000 0041 009D
        DECLE   $0000,  $0002,  $0040,  $0032   ; DC0B   0000 0002 0040 0032
        DECLE   $0042,  $0088,  $0084,  $0000   ; DC0F   0042 0088 0084 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC13   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC17   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC1B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC1F   0000 0000 0000 0000
        DECLE   $0000,  $0006,  $0050,  $0040   ; DC23   0000 0006 0050 0040
        DECLE   $0030,  $0000,  $0000,  $0059   ; DC27   0030 0000 0000 0059
        DECLE   $0040,  $0004,  $0000,  $0064   ; DC2B   0040 0004 0000 0064
        DECLE   $0000,  $0002,  $0000,  $0010   ; DC2F   0000 0002 0000 0010
        DECLE   $0000,  $00A6,  $0050,  $0040   ; DC33   0000 00A6 0050 0040
        DECLE   $0030,  $0000,  $0000,  $0041   ; DC37   0030 0000 0000 0041
        DECLE   $0040,  $00C4,  $0000,  $0064   ; DC3B   0040 00C4 0000 0064
        DECLE   $0050,  $0002,  $0000,  $0000   ; DC3F   0050 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC43   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC47   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC4B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC4F   0000 0000 0000 0000
        DECLE   $0000,  $0042,  $0040,  $0000   ; DC53   0000 0042 0040 0000
        DECLE   $0010,  $0000,  $0000,  $0000   ; DC57   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0012   ; DC5B   0000 0000 0000 0012
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC5F   0000 0000 0000 0000
        DECLE   $0000,  $0042,  $0040,  $0080   ; DC63   0000 0042 0040 0080
        DECLE   $0010,  $0000,  $0082,  $0040   ; DC67   0010 0000 0082 0040
        DECLE   $0000,  $0000,  $0000,  $0012   ; DC6B   0000 0000 0000 0012
        DECLE   $0000,  $0001,  $0080,  $0000   ; DC6F   0000 0001 0080 0000
        DECLE   $0001                           ; DC73   0001

        SETC                                    ; DC74   0007
        INCR    R7                              ; DC75   000F

        DECLE   $003F                           ; DC76   003F
L_DC77:
        SARC    R3,     2                       ; DC77   007F
        DECLE   $007F,  $00FF,  $003C,  $00FF   ; DC78   007F 00FF 003C 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DC7C   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0000,  $0080   ; DC80   00FF 00FF 0000 0080
        DECLE   $00E0,  $00F0,  $00FC,  $00FE   ; DC84   00E0 00F0 00FC 00FE
        DECLE   $00FE,  $00FF,  $00E7,  $00C3   ; DC88   00FE 00FF 00E7 00C3
        DECLE   $0081,  $0081,  $0081,  $0081   ; DC8C   0081 0081 0081 0081
        DECLE   $0081,  $0081,  $0001,  $0001   ; DC90   0081 0081 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; DC94   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $00FE,  $00F0   ; DC98   0001 0001 00FE 00F0
        DECLE   $00C0,  $0000,  $0000,  $0000   ; DC9C   00C0 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; DCA0   0000 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FC,  $00F0   ; DCA4   00FF 00FF 00FC 00F0
        DECLE   $00C0,  $0000,  $0000,  $0000   ; DCA8   00C0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; DCAC   0000 0000 0000 000C
        DECLE   $0003,  $000F,  $0000,  $0000   ; DCB0   0003 000F 0000 0000
        DECLE   $0000,  $0010,  $000E,  $0078   ; DCB4   0000 0010 000E 0078
        DECLE   $00FC,  $00FE,  $001F,  $000F   ; DCB8   00FC 00FE 001F 000F
        DECLE   $0007,  $001F,  $003F,  $00FF   ; DCBC   0007 001F 003F 00FF
        DECLE   $00FF,  $007F,  $003F,  $000F   ; DCC0   00FF 007F 003F 000F
        DECLE   $0003,  $0000,  $0000,  $0000   ; DCC4   0003 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; DCC8   0000 0000 00FF 00FF
        DECLE   $00FF,  $0007,  $0001,  $0000   ; DCCC   00FF 0007 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DCD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DCD4   0000 0000 0000 0000
        DECLE   $001C,  $00FF,  $0003,  $0003   ; DCD8   001C 00FF 0003 0003
        DECLE   $0007,  $000F,  $001F,  $001F   ; DCDC   0007 000F 001F 001F
        DECLE   $001F,  $001F                   ; DCE0   001F 001F

        TSTR    R0                              ; DCE2   0080
        TSTR    R0                              ; DCE3   0080
        ADDR    R0,     R0                      ; DCE4   00C0
        ADDR    R4,     R0                      ; DCE5   00E0
        ADDR    R4,     R0                      ; DCE6   00E0
        ADDR    R4,     R0                      ; DCE7   00E0
        ADDR    R0,     R0                      ; DCE8   00C0
        TSTR    R0                              ; DCE9   0080
        INCR    R7                              ; DCEA   000F
        INCR    R7                              ; DCEB   000F

L_DCEC:
        SETC                                    ; DCEC   0007
L_DCED:
        CLRC                                    ; DCED   0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; DCEE   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FE,  $00FE   ; DCF2   00FF 00FF 00FE 00FE
        DECLE   $0038,  $0000,  $0000,  $0000   ; DCF6   0038 0000 0000 0000
        DECLE   $00C0,  $00E0,  $00F0,  $00F0   ; DCFA   00C0 00E0 00F0 00F0
        DECLE   $00F8,  $00FC,  $00FF,  $00FF   ; DCFE   00F8 00FC 00FF 00FF
        DECLE   $007E,  $00FF,  $00FF,  $00FF   ; DD02   007E 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DD06   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FE,  $00FC,  $00F8   ; DD0A   00FF 00FE 00FC 00F8
        DECLE   $00F0,  $00E0,  $00C0,  $0080   ; DD0E   00F0 00E0 00C0 0080
        DECLE   $00FF,  $007F,  $003F,  $001F   ; DD12   00FF 007F 003F 001F

        INCR    R7                              ; DD16   000F

        SETC                                    ; DD17   0007
L_DD18:
        DIS                                     ; DD18   0003
        DECLE   $0001,  $0000,  $0000,  $0004   ; DD19   0001 0000 0000 0004

        CLRC                                    ; DD1D   0006
        INCR    R6                              ; DD1E   000E
        COMR    R4                              ; DD1F   001C
        RSWD    R4                              ; DD20   003C
        RSWD    R6                              ; DD21   003E
        ADDR    R3,     R7                      ; DD22   00DF
        MOVR    R3,     R7                      ; DD23   009F
        ADDR    R3,     R7                      ; DD24   00DF
        MOVR    R3,     R7                      ; DD25   009F

        DECLE   $00DE,  $00FD,  $00FB,  $00FB   ; DD26   00DE 00FD 00FB 00FB
        DECLE   $0000,  $0080,  $0000,  $0020   ; DD2A   0000 0080 0000 0020
        DECLE   $00FC,  $00F6,  $00DE,  $00FE   ; DD2E   00FC 00F6 00DE 00FE
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD32   0000 0000 0000 0000
        DECLE   $00C0,  $00F0,  $0078,  $003C   ; DD36   00C0 00F0 0078 003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD3A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000F,  $001F   ; DD3E   0000 0000 000F 001F
        DECLE   $0000,  $0000,  $0000,  $0001   ; DD42   0000 0000 0000 0001
        DECLE   $001F,  $007F,  $007F,  $007F   ; DD46   001F 007F 007F 007F
        DECLE   $001F,  $001F,  $003F,  $00FF   ; DD4A   001F 001F 003F 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DD4E   00FF 00FF 00FF 00FF
        DECLE   $001F,  $0087,  $00A3,  $0077   ; DD52   001F 0087 00A3 0077
        DECLE   $00F7,  $00FF,  $00FF,  $00FF   ; DD56   00F7 00FF 00FF 00FF
        DECLE   $00FE,  $00FF,  $00FF,  $00FF   ; DD5A   00FE 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DD5E   00FF 00FF 00FF 00FF
        DECLE   $007F,  $000F,  $0003,  $0000   ; DD62   007F 000F 0003 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD66   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DD6A   00FF 00FF 00FF 00FF
        DECLE   $003F,  $000F,  $0003,  $0000   ; DD6E   003F 000F 0003 0000
        DECLE   $0000,  $001E,  $00C0,  $000F   ; DD72   0000 001E 00C0 000F
        DECLE   $0060,  $0000,  $001C,  $0003   ; DD76   0060 0000 001C 0003
        DECLE   $00C0,  $00F9,  $00FF,  $00FF   ; DD7A   00C0 00F9 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DD7E   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0070,  $00E0   ; DD82   00FF 00FF 0070 00E0
        DECLE   $0080,  $0000,  $0000,  $0000   ; DD86   0080 0000 0000 0000
        DECLE   $0001,  $0003,  $0007,  $000F   ; DD8A   0001 0003 0007 000F
        DECLE   $001F,  $003F,  $007F,  $00FF   ; DD8E   001F 003F 007F 00FF
        DECLE   $0080,  $00C0,  $00E0,  $00F0   ; DD92   0080 00C0 00E0 00F0
        DECLE   $00F8,  $00FC,  $00FE,  $00FF   ; DD96   00F8 00FC 00FE 00FF
        DECLE   $00FF,  $00FF,  $000E,  $0007   ; DD9A   00FF 00FF 000E 0007
        DECLE   $0001,  $0000,  $0000,  $0000   ; DD9E   0001 0000 0000 0000
        DECLE   $00FF,  $00FF,  $001C,  $001C   ; DDA2   00FF 00FF 001C 001C
        DECLE   $001C,  $0000,  $0000,  $0000   ; DDA6   001C 0000 0000 0000
        DECLE   $00FC,  $00FF,  $00FF,  $00FF   ; DDAA   00FC 00FF 00FF 00FF
        DECLE   $00FF,  $00FC,  $0000,  $0000   ; DDAE   00FF 00FC 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; DDB2   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0000,  $0000   ; DDB6   00FF 00FF 0000 0000
        DECLE   $00FF,  $00FF,  $0000,  $0000   ; DDBA   00FF 00FF 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DDBE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; DDC2   0000 0000 0000 0001
        DECLE   $0003,  $0006,  $0003,  $0001   ; DDC6   0003 0006 0003 0001
        DECLE   $0000,  $0036,  $006F,  $00B6   ; DDCA   0000 0036 006F 00B6
        DECLE   $006D,  $00DB,  $006D,  $00B6   ; DDCE   006D 00DB 006D 00B6
        DECLE   $0000,  $0000,  $0080,  $00C0   ; DDD2   0000 0000 0080 00C0
        DECLE   $00E0,  $00F0,  $00E0,  $00C0   ; DDD6   00E0 00F0 00E0 00C0
        DECLE   $0002,  $0002,  $001A,  $000B   ; DDDA   0002 0002 001A 000B
        DECLE   $0002,  $0004,  $0002,  $0004   ; DDDE   0002 0004 0002 0004
        DECLE   $0002,  $0004,  $0002,  $0004   ; DDE2   0002 0004 0002 0004
        DECLE   $0002,  $0004,  $0002,  $0004   ; DDE6   0002 0004 0002 0004
        DECLE   $0002,  $0004,  $0002,  $0004   ; DDEA   0002 0004 0002 0004
        DECLE   $0002,  $0004,  $0002,  $0004   ; DDEE   0002 0004 0002 0004
        DECLE   $0002,  $0004,  $0002,  $0004   ; DDF2   0002 0004 0002 0004
        DECLE   $0002,  $0004,  $0022,  $0009   ; DDF6   0002 0004 0022 0009
        DECLE   $0002,  $0010,  $0002,  $0004   ; DDFA   0002 0010 0002 0004
        DECLE   $0022,  $000B,  $0002,  $0002   ; DDFE   0022 000B 0002 0002
        DECLE   $001A,  $000B,  $0002,  $0004   ; DE02   001A 000B 0002 0004
        DECLE   $0002,  $0004,  $0002,  $0004   ; DE06   0002 0004 0002 0004
        DECLE   $0002,  $0004,  $0002,  $0004   ; DE0A   0002 0004 0002 0004
        DECLE   $0002,  $0004                   ; DE0E   0002 0004

        EIS                                     ; DE10   0002

        JSR     R4,     L_680D                  ; DE11   0004 0068 000D
        DECLE   $0070,  $000D,  $0078,  $000D   ; DE14   0070 000D 0078 000D
        DECLE   $0002,  $0004,  $0002,  $0004   ; DE18   0002 0004 0002 0004
        DECLE   $0002,  $0004,  $0002,  $0004   ; DE1C   0002 0004 0002 0004
        DECLE   $0002,  $0004,  $0002,  $0004   ; DE20   0002 0004 0002 0004
        DECLE   $0002,  $0004,  $0002,  $0004   ; DE24   0002 0004 0002 0004
        DECLE   $0022,  $000B,  $0028,  $0019   ; DE28   0022 000B 0028 0019
        DECLE   $0028,  $0019,  $0028,  $0019   ; DE2C   0028 0019 0028 0019
        DECLE   $0028,  $0019,  $0028,  $0019   ; DE30   0028 0019 0028 0019
        DECLE   $0028,  $0019,  $0028,  $0019   ; DE34   0028 0019 0028 0019
        DECLE   $0028,  $0019,  $0037,  $0019   ; DE38   0028 0019 0037 0019
        DECLE   $0037,  $0019,  $0037,  $0019   ; DE3C   0037 0019 0037 0019
        DECLE   $0010,  $0019,  $0010,  $0019   ; DE40   0010 0019 0010 0019
        DECLE   $0010,  $0019,  $0010,  $0019   ; DE44   0010 0019 0010 0019
        DECLE   $0010,  $0019,  $0010,  $0019   ; DE48   0010 0019 0010 0019
        DECLE   $0010,  $0019,  $0010,  $0019   ; DE4C   0010 0019 0010 0019
        DECLE   $0010,  $0019,  $0000,  $0010   ; DE50   0010 0019 0000 0010
        DECLE   $0000,  $0010,  $0000,  $0018   ; DE54   0000 0010 0000 0018
        DECLE   $0008,  $0018,  $0010,  $0018   ; DE58   0008 0018 0010 0018
        DECLE   $0000,  $0010,  $003F,  $0018   ; DE5C   0000 0010 003F 0018
        DECLE   $0047,  $0018,  $0000,  $0018   ; DE60   0047 0018 0000 0018
        DECLE   $0008,  $0018,  $0010,  $0018   ; DE64   0008 0018 0010 0018
        DECLE   $0000,  $0010,  $0067,  $0018   ; DE68   0000 0010 0067 0018
        DECLE   $0000,  $0010,  $0000,  $0018   ; DE6C   0000 0010 0000 0018
        DECLE   $0008,  $0018,  $0010,  $0018   ; DE70   0008 0018 0010 0018
        DECLE   $0000,  $0010,  $0000,  $0010   ; DE74   0000 0010 0000 0010
        DECLE   $0000,  $0010,  $00AC,  $0018   ; DE78   0000 0010 00AC 0018
        DECLE   $0000,  $0010,  $0000,  $0000   ; DE7C   0000 0010 0000 0000
        DECLE   $0000,  $0000,  $0018,  $003A   ; DE80   0000 0000 0018 003A
        DECLE   $0000,  $0010,  $004F,  $0018   ; DE84   0000 0010 004F 0018
        DECLE   $0002,  $002F,  $0000,  $0000   ; DE88   0002 002F 0000 0000
        DECLE   $0018,  $003A,  $0000,  $0000   ; DE8C   0018 003A 0000 0000

        SAR     R3,     2                       ; DE90   006F
        COMR    R0                              ; DE91   0018
        EIS                                     ; DE92   0002
        ADCR    R7                              ; DE93   002F

        RRC     R3,     2                       ; DE94   0077
L_DE95:
        COMR    R0                              ; DE95   0018
        DECLE   $0018,  $003A,  $0000,  $0000   ; DE96   0018 003A 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; DE9A   0000 0000 0000 0010
        DECLE   $00C4,  $0018,  $00CC,  $0018   ; DE9E   00C4 0018 00CC 0018
        DECLE   $0004,  $0020,  $00BC,  $0018   ; DEA2   0004 0020 00BC 0018
        DECLE   $0030,  $001E,  $0028,  $001E   ; DEA6   0030 001E 0028 001E
        DECLE   $0020,  $001E,  $0000,  $0010   ; DEAA   0020 001E 0000 0010
        DECLE   $0057,  $0018,  $005F,  $0018   ; DEAE   0057 0018 005F 0018
        DECLE   $0098,  $001E,  $0000           ; DEB2   0098 001E 0000

        DECR    R6                              ; DEB5   0016
        MOVR    R4,     R0                      ; DEB6   00A0
        COMR    R6                              ; DEB7   001E
        SARC    R3,     2                       ; DEB8   007F
        COMR    R0                              ; DEB9   0018
        MOVR    R0,     R7                      ; DEBA   0087

        DECLE   $0018,  $0000,  $0010,  $0000   ; DEBB   0018 0000 0010 0000

        DECR    R6                              ; DEBF   0016
        ADDR    R6,     R0                      ; DEC0   00F0
        COMR    R6                              ; DEC1   001E
        ADDR    R7,     R0                      ; DEC2   00F8
        COMR    R6                              ; DEC3   001E
        ADDR    R2,     R4                      ; DEC4   00D4
        COMR    R0                              ; DEC5   0018
        ADDR    R3,     R4                      ; DEC6   00DC
        COMR    R0                              ; DEC7   0018
        ADDR    R4,     R4                      ; DEC8   00E4
        COMR    R0                              ; DEC9   0018
L_DECA:
        PSHR    R5                              ; DECA   0275

L_DECB:
        JSR     R5,     L_D805                  ; DECB   0004 01D8 0005

        CLRR    R0                              ; DECE   01C0
        MVO     R0,     G_0321                  ; DECF   0240 0321
        MVO     R0,     G_0323                  ; DED1   0240 0323
        MVO     R0,     G_0322                  ; DED3   0240 0322
        MVII    #$0280, R0                      ; DED5   02B8 0280
        MVO     R0,     G_0322                  ; DED7   0240 0322
        ADDI    #$0008, R0                      ; DED9   02F8 0008
        MVO     R0,     G_032A                  ; DEDB   0240 032A
        SDBD                                    ; DEDD   0001
        MVII    #$D95B, R0                      ; DEDE   02B8 005B 00D9
        MVO     R0,     G_031E                  ; DEE1   0240 031E
        SDBD                                    ; DEE3   0001
        MVII    #$D96D, R0                      ; DEE4   02B8 006D 00D9
        MVO     R0,     G_0326                  ; DEE7   0240 0326
        MVI     G_031D, R0                      ; DEE9   0280 031D
        SDBD                                    ; DEEB   0001
        ANDI    #$FFE8, R0                      ; DEEC   03B8 00E8 00FF
        XORI    #$0006, R0                      ; DEEF   03F8 0006
        MVO     R0,     G_031D                  ; DEF1   0240 031D
        MVI     G_0325, R0                      ; DEF3   0280 0325
        SDBD                                    ; DEF5   0001
        ANDI    #$FFE8, R0                      ; DEF6   03B8 00E8 00FF
        XORI    #$0007, R0                      ; DEF9   03F8 0007
        MVO     R0,     G_0325                  ; DEFB   0240 0325
        MVI     G_032C, R0                      ; DEFD   0280 032C
        DECR    R0                              ; DEFF   0010
        MVO     R0,     G_032C                  ; DF00   0240 032C

        JSR     R5,     L_D159                  ; DF02   0004 01D0 0159

        MVII    #$000A, R0                      ; DF05   02B8 000A
        MVO     R0,     G_0323                  ; DF07   0240 0323
        PULR    R7                              ; DF09   02B7

        PSHR    R5                              ; DF0A   0275
        MVI     G_031F, R0                      ; DF0B   0280 031F
        SUBI    #$0320, R0                      ; DF0D   0338 0320
        MVO     R0,     G_031F                  ; DF0F   0240 031F
        MVI     G_0320, R0                      ; DF11   0280 0320
        SUBI    #$0320, R0                      ; DF13   0338 0320
        MVO     R0,     G_0320                  ; DF15   0240 0320
        MVI     G_031D, R0                      ; DF17   0280 031D
        SDBD                                    ; DF19   0001
        ANDI    #$DF7F, R0                      ; DF1A   03B8 007F 00DF
        SDBD                                    ; DF1D   0001
        XORI    #$2080, R0                      ; DF1E   03F8 0080 0020
        MVO     R0,     G_031D                  ; DF21   0240 031D
        MVI     G_0325, R0                      ; DF23   0280 0325
        SDBD                                    ; DF25   0001
        ANDI    #$DF7F, R0                      ; DF26   03B8 007F 00DF
        SDBD                                    ; DF29   0001
        XORI    #$2080, R0                      ; DF2A   03F8 0080 0020
        MVO     R0,     G_0325                  ; DF2D   0240 0325
        MVI     G_0322, R0                      ; DF2F   0280 0322
        SUBI    #$0140, R0                      ; DF31   0338 0140
        MVO     R0,     G_0322                  ; DF33   0240 0322
        MVI     G_032A, R0                      ; DF35   0280 032A
        SUBI    #$0140, R0                      ; DF37   0338 0140
        MVO     R0,     G_032A                  ; DF39   0240 032A
        SDBD                                    ; DF3B   0001
        MVII    #$D964, R0                      ; DF3C   02B8 0064 00D9
        MVO     R0,     G_031E                  ; DF3F   0240 031E
        MVII    #$0019, R0                      ; DF41   02B8 0019
        MVO     R0,     G_0323                  ; DF43   0240 0323
        PULR    R7                              ; DF45   02B7

        PSHR    R5                              ; DF46   0275
        MVI     G_01DF, R0                      ; DF47   0280 01DF
        TSTR    R0                              ; DF49   0080
        BEQ     L_DF65                          ; DF4A   0204 0019
        J       L_D415                          ; DF4C   0004 03D4 0015

        INCR    R0                              ; DF4F   0008
        MVO     R0,     G_01DF                  ; DF50   0240 01DF
        MVII    #$0050, R0                      ; DF52   02B8 0050
        SWAP    R0,     1                       ; DF54   0040
        MVO     R0,     G_031F                  ; DF55   0240 031F
        MVO     R0,     G_0327                  ; DF57   0240 0327
        MVII    #$0010, R0                      ; DF59   02B8 0010
        SWAP    R0,     1                       ; DF5B   0040
        MVO     R0,     G_0320                  ; DF5C   0240 0320
        MVO     R0,     G_0328                  ; DF5E   0240 0328

        JSR     R5,     L_D77D                  ; DF60   0004 01D4 037D

        B       L_DECB                          ; DF63   0220 0099

L_DF65:
        MVI     G_031D, R0                      ; DF65   0280 031D
        SDBD                                    ; DF67   0001
        ANDI    #$C768, R0                      ; DF68   03B8 0068 00C7
        SDBD                                    ; DF6B   0001
        ANDI    #$FFEA, R0                      ; DF6C   03B8 00EA 00FF
        XORI    #$0015, R0                      ; DF6F   03F8 0015
        MVO     R0,     G_031D                  ; DF71   0240 031D
        MVI     G_0325, R0                      ; DF73   0280 0325
        SDBD                                    ; DF75   0001
        ANDI    #$C768, R0                      ; DF76   03B8 0068 00C7
        MVO     R0,     G_0325                  ; DF79   0240 0325
        SDBD                                    ; DF7B   0001
        MVII    #$D8BE, R0                      ; DF7C   02B8 00BE 00D8
        MVO     R0,     G_031E                  ; DF7F   0240 031E
        SDBD                                    ; DF81   0001
        MVII    #$D8C7, R0                      ; DF82   02B8 00C7 00D8
        MVO     R0,     G_0326                  ; DF85   0240 0326

        JSR     R5,     L_D7F5                  ; DF87   0004 01D4 03F5

        MVII    #$03F0, R0                      ; DF8A   02B8 03F0
        MVO     R0,     G_0322                  ; DF8C   0240 0322
        CLRR    R0                              ; DF8E   01C0
        MVO     R0,     G_032A                  ; DF8F   0240 032A
        PULR    R7                              ; DF91   02B7

        PSHR    R5                              ; DF92   0275
        MVI     G_032D, R0                      ; DF93   0280 032D
        SDBD                                    ; DF95   0001
        ANDI    #$EFFF, R0                      ; DF96   03B8 00FF 00EF
        MVO     R0,     G_032D                  ; DF99   0240 032D
        MVII    #$0022, R0                      ; DF9B   02B8 0022
        SWAP    R0,     1                       ; DF9D   0040
        MVO     R0,     G_0330                  ; DF9E   0240 0330
        J       L_D2A6                          ; DFA0   0004 03D0 02A6

        PSHR    R5                              ; DFA3   0275
        PULR    R7                              ; DFA4   02B7

        PSHR    R5                              ; DFA5   0275
        MOVR    R3,     R1                      ; DFA6   0099
        ADDI    #$01D1, R1                      ; DFA7   02F9 01D1
        MVI@    R1,     R0                      ; DFA9   0288
        TSTR    R0                              ; DFAA   0080
        BEQ     L_DFB0                          ; DFAB   0204 0003

        JSR     R5,     L_5BED                  ; DFAD   0004 0158 03ED

L_DFB0:
        PULR    R7                              ; DFB0   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; DFB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DFF9   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; DFFD   0000 0000

        ADDR    R2,     R0                      ; DFFF   00D0
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $502E       <entry>
;;  $509E       <entry>
;;  $50D3       $50D6  
;;  $50DC       $50CF   $50E0  
;;  $50DD       $50C9  
;;  $50F6       $50EE  
;;  $510A       $510C  
;;  $5135       $50A6   $50C3  
;;  $5196       $518E  
;;  $519A       $5194  
;;  $51A3       $51C9  
;;  $51AA       $51BF  
;;  $51AC       $51AF  
;;  $51C1       $51BA  
;;  $51CB       $51B3  
;;  $51FB       $51F9  
;;  $5275       $5132  
;;  $5283       $5532  
;;  $5289       $528E  
;;  $52DD       $52D0  
;;  $52DE       $560E   $561E   $5704  
;;  $52EC       $52C5   $5503   $561B  
;;  $52FB       $52C8   $54C2   $54C9  
;;  $5314       $530B  
;;  $532A       $52E4   $52F3   $5302  
;;  $5353       $534B  
;;  $535E       $5373  
;;  $5370       $5368  
;;  $5387       $5383  
;;  $5388       $5381  
;;  $539C       $5388  
;;  $53BD       $53A3  
;;  $53C5       $5408  
;;  $5400       $5404  
;;  $5401       $53C3  
;;  $540A       $53B5   $53BA  
;;  $5434       $542B  
;;  $543D       $5432   $5436  
;;  $5448       $543F  
;;  $5451       $5446   $544A  
;;  $5467       $545F  
;;  $5471       $5469  
;;  $5476       $5453   $5457   $545B  
;;  $5477       $542F   $543A   $5443   $544E   $5463   $546D   $5473  
;;  $5484       $5344   $5355   $5377   $5416   $548D  
;;  $548B       $5488  
;;  $54A3       $549F  
;;  $54C9       $54C0  
;;  $5509       $54DC  
;;  $5534       $5513  
;;  $553C       $5535  
;;  $5549       $54F7  
;;  $554A       $54E2   $54EB  
;;  $5599       $555B   $5561   $5566  
;;  $55BA       $55A2  
;;  $55BE       $559F   $55A7  
;;  $55BF       $5596   $55A9   $578A  
;;  $560A       $5606  
;;  $5619       $5615  
;;  $5620       $55F0   $55F4  
;;  $5626       $55E3   $55E6  
;;  $5628       $5624  
;;  $5636       $5634  
;;  $5639       $5630   $5632  
;;  $563A       $5637  
;;  $564C       $5644  
;;  $564F       $5641   $5648  
;;  $567B       $5673  
;;  $5686       $5656  
;;  $568C       $52D9   $54C5  
;;  $568E       $5694  
;;  $5697       $568E   $56F5  
;;  $56AA       $56A7  
;;  $56B0       $56AC  
;;  $56C9       $56B7   $56BB  
;;  $56E1       $56D1  
;;  $5702       $56FF  
;;  $5717       $5722   $5742  
;;  $5724       $5709   $570D  
;;  $5736       $5725   $572B  
;;  $573E       $573A  
;;  $5747       $5766  
;;  $5759       $576A  
;;  $5763       $5754   $5757  
;;  $578D       $577C  
;;  $5794       $5791  
;;  $57A3       $57B3  
;;  $57B1       $5798   $57A1  
;;  $5867       $5864  
;;  $5890       $5876   $587E   $5884   $588C  
;;  $5927       $5917  
;;  $5937       $58A4   $58AC   $58B6   $58BF   $58C9   $58D5   $58DF   $58E7  
;;  $5937       $58EF   $58F7   $58FF   $5907   $590F   $5927   $5935   $593D  
;;  $593A       $589E   $58A6   $58AE   $58B8   $58C1   $58CB   $58D7   $58E1  
;;  $593A       $58E9   $58F1   $58F9   $5901   $5909   $5911   $5929  
;;  $5951       $5948   $594A  
;;  $5955       $5D46   $5D51  
;;  $5968       $594C  
;;  $597B       $594E  
;;  $59C0       $598B   $5996   $599A   $59AE   $59DF  
;;  $59C1       $59B6   $59BA  
;;  $59C7       $59D1  
;;  $59CF       $59BE  
;;  $59D3       $59B2   $59CD  
;;  $5A25       $59E5   $59EB   $59F3   $59F9   $5A01  
;;  $5A26       $5A20  
;;  $5A78       $59C9   $5A03   $5A27  
;;  $5A90       $5A22  
;;  $5ADD       $5AD4  
;;  $5AF3       $5AE8  
;;  $5AF4       $58A1  
;;  $5B4B       $5AF8   $5B01   $5B08   $5B10   $5B16   $5B43  
;;  $5B4C       $58A9   $5A19   $D2B1  
;;  $5B74       $5B71  
;;  $5B8D       $5B50   $5B58   $5B85  
;;  $5BC9       $5B96   $5B9A   $5BA2   $5BAA   $5BBD  
;;  $5BDD       $5BD8  
;;  $5BEC       $5BD2  
;;  $5BED       $5BDE   $DFAD  
;;  $5C21       $5C1C  
;;  $5C25       $5C17  
;;  $5C34       $D34C  
;;  $5C53       $5C38  
;;  $5C54       $58E4   $D0D4   $D4A0  
;;  $5C5D       $58EC   $D4A4  
;;  $5C66       $58F4   $D4A8  
;;  $5C6F       $5904   $5AC4   $D35F   $D3EB   $D4B0  
;;  $5CBF       $5C83   $5C87   $5C9F   $5CAE   $5CB7  
;;  $6128       $6126  
;;  $6134       $6132  
;;  $62B8       $512E  
;;  $62CB       $62C7   $642C  
;;  $63E8       $63DA   $63DE  
;;  $63E9       $63E4  
;;  $63F9       $63E6  
;;  $6403       $63F7  
;;  $6407       $6411  
;;  $6414       $666C   $668B  
;;  $6430       $64A2   $6502   $651F  
;;  $6448       $6442  
;;  $6473       $644C   $6453  
;;  $647F       $647C  
;;  $6484       $643D   $6481  
;;  $6486       $6466  
;;  $649C       $6493  
;;  $649E       $649A  
;;  $64A8       $6489  
;;  $64B9       $64A5   $64AD  
;;  $64D9       $64B4  
;;  $64DC       $64B6  
;;  $64E7       $64E5  
;;  $64ED       $64E3  
;;  $64F1       $64EB  
;;  $64F4       $64E1  
;;  $64FA       $64DF  
;;  $64FE       $64F8  
;;  $6501       $D755  
;;  $651F       $6515  
;;  $655C       $6510  
;;  $656F       $6561  
;;  $6590       $656D   $6595  
;;  $65CB       $6359   $658D  
;;  $65D4       $65CF  
;;  $65F3       $65A4   $65D1  
;;  $661C       $65FA  
;;  $661D       $649F   $6556   $6682  
;;  $666F       $6651  
;;  $6670       $6559  
;;  $668E       $667E  
;;  $66AF       $6328   $6505   $6551  
;;  $66B8       $66B4  
;;  $66DB       $66BC  
;;  $680D       $DE11  
;;  $68EA       $68E8  
;;  $6A42       $6A42  
;;  $6B2A       $6B28  
;;  $6B7B       $6B7C  
;;  $6BAC       $6BA6  
;;  $6BB0       $6BA4  
;;  $6BC5       $6BBD  
;;  $6BCD       $6BC9  
;;  $6BCE       $6BAA   $6BAE   $6BB4  
;;  $6BDF       $6BD7  
;;  $6BE7       $6BE1  
;;  $6BF1       $6BD3   $6BE9  
;;  $6BF4       $6BCF  
;;  $6BF9       $6BDD   $6BEF  
;;  $6BFB       $6BE5   $6BF2  
;;  $6C05       $6C70  
;;  $6C13       $6C0E  
;;  $6C14       $6BCB  
;;  $6C3D       $6C20  
;;  $6C3E       $6C27   $6C32  
;;  $6C60       $6C54   $6C58   $6C5C  
;;  $6C82       $6C6B  
;;  $6C83       $6B83   $6C6D  
;;  $6C98       $6C88  
;;  $6CA5       $6C9F  
;;  $6CA8       $6C7F  
;;  $6CB3       $6CAC  
;;  $6CB4       $6C7A  
;;  $6CC2       $6CBA  
;;  $6CC9       $6CBE  
;;  $6CCF       $6CC7   $6CCD  
;;  $6CD7       $6CD8  
;;  $6CF3       $6CE3   $6CED  
;;  $6CFA       $6CB6   $6CC0   $6CC4   $6CCA  
;;  $6D0B       $6C34  
;;  $6D26       $6D22  
;;  $6D79       $65A1  
;;  $6D9A       $6D9D  
;;  $6DCC       $6DD9  
;;  $6DCE       $6DC3  
;;  $6DD4       $6DBB  
;;  $6DDB       $62D7  
;;  $6DE2       $6DE7  
;;  $6E65       $6E63  
;;  $6E83       $6E81  
;;  $6E97       $6E95  
;;  $6F1E       $6F1C  
;;  $6F9A       $5B3A  
;;  $6FA3       $5AEA   $5BBF   $5BDA   $5C1E  
;;  $6FB2       $5B66  
;;  $6FBE       $5942  
;;  $6FD6       $6FC6  
;;  $6FD7       $552F   $6429   $D422  
;;  $6FE0       $6FE4  
;;  $D04C       $512A  
;;  $D053       $D04C  
;;  $D07D       $D04F   $D425  
;;  $D105       $D143  
;;  $D12B       $D0DB   $D2DD  
;;  $D135       $D362  
;;  $D13F       $D0A0   $D508  
;;  $D14A       $D140  
;;  $D151       $D156  
;;  $D159       $5A16   $5AED   $5BE6   $5C0C   $D146   $D3DE   $DF02  
;;  $D166       $D161  
;;  $D177       $D164   $D173  
;;  $D179       $D16B  
;;  $D192       $5C59   $5C62   $5C6B   $5C76   $D127   $D399  
;;  $D1A5       $D19C   $D1A1  
;;  $D1B2       $D1AA   $D1AF  
;;  $D1B6       $D0EA  
;;  $D1C3       $D1BA  
;;  $D1CD       $D1C6  
;;  $D1D7       $D1CB   $D1E2  
;;  $D1DB       $D1D0   $D1D5  
;;  $D1E4       $D1BE   $D1DD   $D215  
;;  $D1F0       $D1D7  
;;  $D20B       $D1F3   $D1F8   $D1FD   $D202   $D207  
;;  $D219       $D210  
;;  $D21A       $D0ED  
;;  $D230       $D24F  
;;  $D23A       $D252  
;;  $D23E       $D222  
;;  $D24C       $D241  
;;  $D24D       $D22C  
;;  $D251       $D234   $D238  
;;  $D254       $D0F5  
;;  $D266       $D279  
;;  $D274       $D258  
;;  $D275       $D260  
;;  $D27B       $D0F2  
;;  $D2A5       $D288   $D2CC  
;;  $D2A6       $D24A   $D2A3   $DFA0  
;;  $D2CE       $58B3   $58BC   $58C6   $58D2   $58DC  
;;  $D304       $D2D3   $D2DA  
;;  $D305       $D2E3  
;;  $D330       $D31A   $D31F   $D328  
;;  $D331       $D2EA  
;;  $D334       $D34A  
;;  $D347       $D2FA  
;;  $D34C       $D2F2  
;;  $D350       $D302  
;;  $D36E       $590C   $D331   $D4B4  
;;  $D37C       $58FC   $D347   $D4AC  
;;  $D38D       $D378   $D389  
;;  $D3AA       $D291   $D3A1  
;;  $D3B7       $D295   $D3A3  
;;  $D3C4       $D3A7  
;;  $D3D6       $D283   $D3A5   $D413  
;;  $D413       $5A34  
;;  $D415       $D3E4   $DF4C  
;;  $D454       $D45B  
;;  $D45D       $D44C  
;;  $D45E       $D456  
;;  $D4CC       $D4B8   $D4BC   $D4C0  
;;  $D4CE       $D49C  
;;  $D4D8       $D124   $D4D4  
;;  $D4F7       $D4E0  
;;  $D4F8       $D4EB  
;;  $D501       $D4C8  
;;  $D50C       $D4C4  
;;  $D52C       $D514   $D519   $D51E   $D523   $D528  
;;  $D53B       $D537  
;;  $D53F       $D534  
;;  $D571       $D546   $D54B  
;;  $D573       $D53D  
;;  $D574       $D56E  
;;  $D592       $D57E   $D587  
;;  $D5AA       $6BB6   $D539  
;;  $D5F0       $D5B1   $D5B9   $D5C2   $D5C7  
;;  $D5F1       $D5ED  
;;  $D620       $D605   $D60A   $D612  
;;  $D621       $64D9   $65C7   $D61E  
;;  $D630       $D5FD   $D619  
;;  $D644       $D659  
;;  $D64A       $D654  
;;  $D65B       $D63E   $D650  
;;  $D687       $D660   $D678  
;;  $D688       $D66E   $D680  
;;  $D694       $D68A   $D691  
;;  $D695       $D665  
;;  $D6C9       $D6BC  
;;  $D6D6       $D6C7  
;;  $D6EA       $D6DD  
;;  $D6F7       $D6E8  
;;  $D716       $D699   $D69E  
;;  $D71A       $D6A6  
;;  $D71B       $D701   $D70E  
;;  $D721       $D71D  
;;  $D72B       $D726  
;;  $D736       $D731  
;;  $D737       $D6C2   $D6CE   $D6E3   $D6EF  
;;  $D73E       $D662  
;;  $D755       $D746   $D74D   $D751  
;;  $D758       $D753  
;;  $D759       $659E  
;;  $D767       $D54D  
;;  $D77D       $6522   $DF60  
;;  $D795       $5506   $64D6  
;;  $D7A2       $55FE  
;;  $D7B5       $50B3  
;;  $D7DD       $5C8C   $D0B9  
;;  $D7E5       $5C50   $D409  
;;  $D7ED       $D2AE  
;;  $D7F5       $5B18   $D0BC   $DF87  
;;  $D7FD       $5B63  
;;  $D805       $DECB  
;;  $D80D       $5C35   $D285   $D2D0  
;;  $D813       $5AD1   $D1CD  
;;  $D819       $59E2   $D1D2   $D23E  
;;  $D81F       $5AF5   $5B4D   $5CAB   $D255   $D31C  
;;  $D825       $D1B7  
;;  $D831       $5987   $59E7   $D20D  
;;  $D837       $5A1C  
;;  $D973       $D971  
;;  $DBA9       $DBA9  
;;  $DC77       $DC75  
;;  $DCEC       $DCEA  
;;  $DCED       $DCEB  
;;  $DD18       $DD16  
;;  $DE95       $DE93  
;;  $DECA       $5AF0   $5BC6   $5BE9   $5C21  
;;  $DECB       $DF63  
;;  $DF65       $DF4A  
;;  $DFB0       $DFAB  
;; ======================================================================== ;;
