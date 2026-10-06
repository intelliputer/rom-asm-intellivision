
        ORG     $5000
.HEADER:
        BIDECLE $5BBE           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $50DF           ; 5004  Ptr: Start of game
        BIDECLE $5CEE           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5BA4           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5032           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $000B   ; 500F  Color Stack init (0, 1)
        DECLE   $0005,  $0008   ; 5011  Color Stack init (2, 3)
        DECLE   $0001           ; 5013  Border color init

        DECLE   $0180,  $0190,  $01A0,  $01B0   ; 5014   0180 0190 01A0 01B0
        DECLE   $01C0,  $01D0,  $01E0,  $01F0   ; 5018   01C0 01D0 01E0 01F0
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 501C  Timer dispatch/interval
        DECLE   $0044,  $0059,  $0001,  $0000; 5020  Timer dispatch/interval
        DECLE   $00DB,  $0058,  $0001,  $0000; 5024  Timer dispatch/interval
        DECLE   $0046,  $0058,  $0010,  $0000; 5028  Timer dispatch/interval
        DECLE   $0096,  $005E,  $0001,  $0000; 502C  Timer dispatch/interval
        BIDECLE $0000           ; 5030  End of timer table

.TITLE:
        DECLE   $0051                           ; 5032  Cartridge year
        STRING  "SPACE ARMADA"                  ; 5033  Title string
        DECLE   $0000                           ; 503F  

.TITLECODE:
        PSHR    R5                              ; 5040   0275
        MVI     .PSG0.rgt_hand,R0               ; 5041   0280 01FE
        CMPI    #$001F, R0                      ; 5043   0378 001F
        BNEQ    L_50D1                          ; 5045   020C 008A

        MVI     .PSG0.lft_hand,R0               ; 5047   0280 01FF
        CMPI    #$005D, R0                      ; 5049   0378 005D
        BEQ     L_5053                          ; 504B   0204 0006

        CMPI    #$0057, R0                      ; 504D   0378 0057
        BEQ     L_5079                          ; 504F   0204 0028
        B       L_50D1                          ; 5051   0200 007E

L_5053:
        MVII    #$0001, R3                      ; 5053   02BB 0001
        MVII    #$023D, R4                      ; 5055   02BC 023D

        JSR     R5,     X_PRINT_R5              ; 5057   0004 0118 007B
        STRING  "J W B  Enterprises"            ; 505A  
        DECLE   $0000                           ; 506C   0000

        MVII    #$0007, R3                      ; 506D   02BB 0007
        MVII    #$0293, R4                      ; 506F   02BC 0293

        JSR     R5,     X_PRINT_R5              ; 5071   0004 0118 007B
        STRING  "Z "                            ; 5074   005A 0020
        DECLE   $0000                           ; 5076   0000

        B       L_50AD                          ; 5077   0200 0034

L_5079:
        MVII    #$0005, R3                      ; 5079   02BB 0005
        MVII    #$028E, R4                      ; 507B   02BC 028E

        JSR     R5,     X_PRINT_R5              ; 507D   0004 0118 007B
        STRING  "* SPACE BEASTIES *"            ; 5080  
        DECLE   $0000                           ; 5092   0000

        MVII    #$0007, R3                      ; 5093   02BB 0007
        MVII    #$023D, R4                      ; 5095   02BC 023D

        JSR     R5,     X_PRINT_R5              ; 5097   0004 0118 007B
        STRING  "Brooks"                        ; 509A  
        DECLE   $0000                           ; 50A0   0000

        MVII    #$02D5, R4                      ; 50A1   02BC 02D5

        JSR     R5,     X_PRINT_R5              ; 50A3   0004 0118 007B
        STRING  " J W B"                        ; 50A6  
        DECLE   $0000                           ; 50AC   0000
L_50AD:
        MVII    #$000D, R0                      ; 50AD   02B8 000D
        MVO     R0,     G_019F                  ; 50AF   0240 019F
        MVII    #$0002, R0                      ; 50B1   02B8 0002
        MVII    #$0216, R4                      ; 50B3   02BC 0216
        SDBD                                    ; 50B5   0001
        MVII    #$1835, R1                      ; 50B6   02B9 0035 0018

        JSR     R5,     L_523D                  ; 50B9   0004 0150 023D

        SDBD                                    ; 50BC   0001
        MVII    #$0826, R1                      ; 50BD   02B9 0026 0008

        JSR     R5,     L_523D                  ; 50C0   0004 0150 023D

        SDBD                                    ; 50C3   0001
        MVII    #$0815, R1                      ; 50C4   02B9 0015 0008

        JSR     R5,     L_523D                  ; 50C7   0004 0150 023D

        SDBD                                    ; 50CA   0001
        MVII    #$1802, R1                      ; 50CB   02B9 0002 0018

        JSR     R5,     L_523D                  ; 50CE   0004 0150 023D

L_50D1:
        PULR    R7                              ; 50D1   02B7

L_50D2:
        PSHR    R5                              ; 50D2   0275
        SDBD                                    ; 50D3   0001
        MVII    #$5DC6, R5                      ; 50D4   02BD 00C6 005D
        MVII    #$0008, R3                      ; 50D7   02BB 0008
L_50D9:
        MVI@    R5,     R0                      ; 50D9   02A8
        MVO@    R0,     R4                      ; 50DA   0260
        DECR    R3                              ; 50DB   0013
        BNEQ    L_50D9                          ; 50DC   022C 0004
        PULR    R7                              ; 50DE   02B7

.START:
        PSHR    R5                              ; 50DF   0275
        MVII    #$003C, R5                      ; 50E0   02BD 003C
        MVO     R5,     G_035C                  ; 50E2   0245 035C
        MVII    #$00F0, R0                      ; 50E4   02B8 00F0
        MVII    #$0200, R4                      ; 50E6   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 50E8   0004 0114 0338

        MVII    #$022A, R4                      ; 50EB   02BC 022A
        MVII    #$0007, R3                      ; 50ED   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 50EF   0004 0118 007B
        STRING  "GAME OR PRACTICE?"             ; 50F2  
        DECLE   $0000                           ; 5103   0000
L_5104:
        MVII    #$0001, R0                      ; 5104   02B8 0001
        CLRR    R2                              ; 5106   01D2
        SDBD                                    ; 5107   0001
        MVII    #$5FFF, R1                      ; 5108   02B9 00FF 005F
        SDBD                                    ; 510B   0001
        MVII    #$525B, R4                      ; 510C   02BC 005B 0052

        JSR     R5,     .EXEC.910               ; 510F   0004 0118 0110

        CMPI    #$0001, R0                      ; 5112   0378 0001
        BEQ     L_5125                          ; 5114   0204 000F

        CMPI    #$0002, R0                      ; 5116   0378 0002
        BEQ     L_5132                          ; 5118   0204 0018

        MVII    #$024A, R4                      ; 511A   02BC 024A
        MVII    #$0007, R3                      ; 511C   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 511E   0004 0118 007B
        STRING  " "                             ; 5121   0020
        DECLE   $0000                           ; 5122   0000

        B       L_5104                          ; 5123   0220 0020

L_5125:
        MVII    #$0001, R0                      ; 5125   02B8 0001
        MVO     R0,     G_017A                  ; 5127   0240 017A
        MVII    #$0003, R0                      ; 5129   02B8 0003
        MVO     R0,     G_0103                  ; 512B   0240 0103
        MVII    #$003C, R2                      ; 512D   02BA 003C
        PSHR    R2                              ; 512F   0272
        B       L_5146                          ; 5130   0200 0014

L_5132:
        CLRR    R0                              ; 5132   01C0
        MVO     R0,     G_017A                  ; 5133   0240 017A
        MVI     G_019F, R0                      ; 5135   0280 019F
        SUBI    #$0002, R0                      ; 5137   0338 0002
        BPL     L_513C                          ; 5139   0203 0001

        CLRR    R0                              ; 513B   01C0
L_513C:
        MVO     R0,     G_016E                  ; 513C   0240 016E
        MVII    #$0014, R1                      ; 513E   02B9 0014

        JSR     R5,     X_MPY                   ; 5140   0004 011C 01DC

        ADD     G_035C, R2                      ; 5143   02C2 035C
        PSHR    R2                              ; 5145   0272
L_5146:
        MVII    #$00C6, R0                      ; 5146   02B8 00C6
        MVO     R0,     G_017B                  ; 5148   0240 017B
        MVII    #$0002, R0                      ; 514A   02B8 0002
        MVO     R0,     G_0115                  ; 514C   0240 0115
        INCR    R0                              ; 514E   0008
        SDBD                                    ; 514F   0001
        MVII    #$5B44, R1                      ; 5150   02B9 0044 005B
        MVII    #$0345, R2                      ; 5153   02BA 0345

        JSR     R5,     X_INIT_MOBS             ; 5155   0004 0114 02B4

        MVII    #$0325, R2                      ; 5158   02BA 0325
        SDBD                                    ; 515A   0001
        MVII    #$5B74, R1                      ; 515B   02B9 0074 005B

        JSR     R5,     X_INIT_MOB              ; 515E   0004 0114 02B2

        PULR    R2                              ; 5161   02B2
        MVO     R2,     G_035C                  ; 5162   0242 035C
        MVII    #$0100, R4                      ; 5164   02BC 0100
        MVI@    R4,     R0                      ; 5166   02A0
        MVI@    R4,     R1                      ; 5167   02A1
        MVII    #$0171, R4                      ; 5168   02BC 0171
        MVO@    R0,     R4                      ; 516A   0260
        MVO@    R1,     R4                      ; 516B   0261
        MVII    #$0100, R5                      ; 516C   02BD 0100
        SDBD                                    ; 516E   0001
        MVII    #$52C3, R0                      ; 516F   02B8 00C3 0052
        MVO@    R0,     R5                      ; 5172   0268
        SWAP    R0,     1                       ; 5173   0040
        MVO@    R0,     R5                      ; 5174   0268
        SDBD                                    ; 5175   0001
        MVII    #$5249, R0                      ; 5176   02B8 0049 0052
        MVO     R0,     G_035D                  ; 5179   0240 035D
        MVII    #$0004, R1                      ; 517B   02B9 0004
        MVO     R1,     G_0167                  ; 517D   0241 0167
        INCR    R1                              ; 517F   0009
        MVII    #$0168, R4                      ; 5180   02BC 0168
        MVII    #$0003, R0                      ; 5182   02B8 0003
        MVO     R0,     G_016C                  ; 5184   0240 016C

        JSR     R5,     X_FILL_MEM              ; 5186   0004 0114 0341

        MVII    #$0186, R4                      ; 5189   02BC 0186

        JSR     R5,     L_50D2                  ; 518B   0004 0150 00D2

        MVII    #$018E, R4                      ; 518E   02BC 018E

        JSR     R5,     L_50D2                  ; 5190   0004 0150 00D2

        MVII    #$0196, R4                      ; 5193   02BC 0196

        JSR     R5,     L_50D2                  ; 5195   0004 0150 00D2
        JSR     R5,     L_58DB                  ; 5198   0004 0158 00DB

        INCR    R7                              ; 519B   000F

L_519C:
        PSHR    R5                              ; 519C   0275
L_519D:
        CLRR    R0                              ; 519D   01C0
        MVO     R0,     G_0179                  ; 519E   0240 0179
        MVI     G_016E, R3                      ; 51A0   0283 016E
        INCR    R3                              ; 51A2   000B
        MVO     R3,     G_016E                  ; 51A3   0243 016E
        MVI     G_019F, R2                      ; 51A5   0282 019F
        MVO     R2,     G_016D                  ; 51A7   0242 016D
        MVI     G_017A, R0                      ; 51A9   0280 017A
        TSTR    R0                              ; 51AB   0080
        BNEQ    L_51B0                          ; 51AC   020C 0002
        B       L_51B7                          ; 51AE   0200 0007

L_51B0:
        MVO     R3,     G_016D                  ; 51B0   0243 016D
        CMPR    R2,     R3                      ; 51B2   0153
        BLT     L_51B7                          ; 51B3   0205 0002

        MVO     R3,     G_019F                  ; 51B5   0243 019F
L_51B7:
        MVI     G_016D, R3                      ; 51B7   0283 016D
        MVII    #$00F0, R0                      ; 51B9   02B8 00F0
        MVII    #$0200, R4                      ; 51BB   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 51BD   0004 0114 0338

        MVII    #$0202, R4                      ; 51C0   02BC 0202
        MVII    #$0008, R0                      ; 51C2   02B8 0008
        SDBD                                    ; 51C4   0001
        MVII    #$1835, R1                      ; 51C5   02B9 0035 0018
        CMPI    #$0009, R3                      ; 51C8   037B 0009
        BLT     L_51D4                          ; 51CA   0205 0008

        CMPI    #$000B, R3                      ; 51CC   037B 000B
        BGE     L_51D4                          ; 51CE   020D 0004

        SDBD                                    ; 51D0   0001
        XORI    #$1005, R1                      ; 51D1   03F9 0005 0010

L_51D4:
        JSR     R5,     L_523D                  ; 51D4   0004 0150 023D

        MVII    #$022A, R4                      ; 51D7   02BC 022A
        SDBD                                    ; 51D9   0001
        MVII    #$0826, R1                      ; 51DA   02B9 0026 0008
        CMPI    #$0009, R3                      ; 51DD   037B 0009
        BLT     L_51E7                          ; 51DF   0205 0006

        CMPI    #$000B, R3                      ; 51E1   037B 000B
        BGE     L_51E7                          ; 51E3   020D 0002

        XORI    #$0006, R1                      ; 51E5   03F9 0006

L_51E7:
        JSR     R5,     L_523D                  ; 51E7   0004 0150 023D

        MVII    #$0252, R4                      ; 51EA   02BC 0252
        SDBD                                    ; 51EC   0001
        MVII    #$0815, R1                      ; 51ED   02B9 0015 0008
        CMPI    #$0005, R3                      ; 51F0   037B 0005
        BLT     L_51FA                          ; 51F2   0205 0006

        CMPI    #$000B, R3                      ; 51F4   037B 000B
        BGE     L_51FA                          ; 51F6   020D 0002

        XORI    #$0005, R1                      ; 51F8   03F9 0005

L_51FA:
        JSR     R5,     L_523D                  ; 51FA   0004 0150 023D

        MVII    #$027A, R4                      ; 51FD   02BC 027A
        SDBD                                    ; 51FF   0001
        MVII    #$1802, R1                      ; 5200   02B9 0002 0018
        CMPI    #$0005, R3                      ; 5203   037B 0005
        BLT     L_520F                          ; 5205   0205 0008

        CMPI    #$000B, R3                      ; 5207   037B 000B
        BGE     L_520F                          ; 5209   020D 0004

        SDBD                                    ; 520B   0001
        XORI    #$1002, R1                      ; 520C   03F9 0002 0010

L_520F:
        JSR     R5,     L_523D                  ; 520F   0004 0150 023D

        MVI     G_035C, R0                      ; 5212   0280 035C
        ADDI    #$0014, R0                      ; 5214   02F8 0014
        MVO     R0,     G_035C                  ; 5216   0240 035C
        SLR     R0,     2                       ; 5218   0064
        SLR     R0,     2                       ; 5219   0064
        SLR     R0,     1                       ; 521A   0060
        MVO     R0,     G_015D                  ; 521B   0240 015D
        MVI     G_0167, R0                      ; 521D   0280 0167
        INCR    R0                              ; 521F   0008
        MVO     R0,     G_0167                  ; 5220   0240 0167
        MVII    #$0020, R1                      ; 5222   02B9 0020
        MVO     R1,     G_016B                  ; 5224   0241 016B
L_5226:
        MVI     G_016B, R0                      ; 5226   0280 016B
        TSTR    R0                              ; 5228   0080
        BEQ     L_523C                          ; 5229   0204 0011

        SLR     R0,     2                       ; 522B   0064
        ADDI    #$0002, R0                      ; 522C   02F8 0002

        JSR     R5,     .EXEC.A62               ; 522E   0004 0118 0262

        MVI     G_0173, R0                      ; 5231   0280 0173
        XORI    #$0001, R0                      ; 5233   03F8 0001
        MVO     R0,     G_0173                  ; 5235   0240 0173

        JSR     R5,     L_5FAA                  ; 5237   0004 015C 03AA

        B       L_5226                          ; 523A   0220 0015
L_523C:
        PULR    R7                              ; 523C   02B7

L_523D:
        PSHR    R5                              ; 523D   0275
        PSHR    R0                              ; 523E   0270
        MVII    #$0008, R2                      ; 523F   02BA 0008
        ADDR    R1,     R2                      ; 5241   00CA
L_5242:
        MVO@    R1,     R4                      ; 5242   0261
        MVO@    R2,     R4                      ; 5243   0262
        DECR    R0                              ; 5244   0010
        BNEQ    L_5242                          ; 5245   022C 0004

        PULR    R0                              ; 5247   02B0
        PULR    R7                              ; 5248   02B7

        DECLE   $00E6,  $0052,  $0000,  $0000   ; 5249   00E6 0052 0000 0000
        DECLE   $0018,  $0053,  $0018,  $0053   ; 524D   0018 0053 0018 0053
        DECLE   $0018,  $0053,  $0000,  $0000   ; 5251   0018 0053 0000 0000
        DECLE   $00BF,  $0052,  $0000,  $0000   ; 5255   00BF 0052 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5259   0000 0000 0000 0000
        DECLE   $0065,  $0052,  $0000,  $0000   ; 525D   0065 0052 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5261   0000 0000 0000 0000

        PSHR    R1                              ; 5265   0271
        PSHR    R3                              ; 5266   0273
        PSHR    R4                              ; 5267   0274
        PSHR    R5                              ; 5268   0275
        PSHR    R0                              ; 5269   0270
        CMPI    #$000B, R0                      ; 526A   0378 000B
        BEQ     L_5290                          ; 526C   0204 0022

        MVII    #$0242, R4                      ; 526E   02BC 0242
        MVII    #$0007, R3                      ; 5270   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 5272   0004 0118 007B
        STRING  "        "                      ; 5275  
        DECLE   $0000                           ; 527D   0000

        SDBD                                    ; 527E   0001
        MVII    #$5286, R5                      ; 527F   02BD 0086 0052
        PSHR    R5                              ; 5282   0275
        J       .EXEC.922                       ; 5283   0004 0318 0122

        PULR    R0                              ; 5286   02B0
        PSHR    R0                              ; 5287   0270
        CMPI    #$0001, R0                      ; 5288   0378 0001
        BEQ     L_5299                          ; 528A   0204 000D

        CMPI    #$0002, R0                      ; 528C   0378 0002
        BEQ     L_52AC                          ; 528E   0204 001C

L_5290:
        PULR    R0                              ; 5290   02B0
        PULR    R5                              ; 5291   02B5
        PULR    R4                              ; 5292   02B4
        PULR    R3                              ; 5293   02B3
        PULR    R1                              ; 5294   02B1
        CLRR    R1                              ; 5295   01C9
        J       .EXEC.94C                       ; 5296   0004 0318 014C

L_5299:
        MVII    #$0242, R4                      ; 5299   02BC 0242
        MVII    #$0002, R3                      ; 529B   02BB 0002

        JSR     R5,     X_PRINT_R5              ; 529D   0004 0118 007B
        STRING  "  GAME  "                      ; 52A0  
        DECLE   $0000                           ; 52A8   0000

        J       L_5290                          ; 52A9   0004 0350 0290

L_52AC:
        MVII    #$0242, R4                      ; 52AC   02BC 0242
        MVII    #$0001, R3                      ; 52AE   02BB 0001

        JSR     R5,     X_PRINT_R5              ; 52B0   0004 0118 007B
        STRING  "PRACTICE"                      ; 52B3  
        DECLE   $0000                           ; 52BB   0000

        J       L_5290                          ; 52BC   0004 0350 0290

        CLRR    R1                              ; 52BF   01C9
        J       .EXEC.94C                       ; 52C0   0004 0318 014C

        PSHR    R5                              ; 52C3   0275
        MVI     G_019E, R1                      ; 52C4   0281 019E
        TSTR    R1                              ; 52C6   0089
        BEQ     L_52CC                          ; 52C7   0204 0003
        J       L_58E8                          ; 52C9   0004 0358 00E8

L_52CC:
        MVI     G_0111, R0                      ; 52CC   0280 0111
        SLR     R0,     2                       ; 52CE   0064
        CMPI    #$0006, R0                      ; 52CF   0378 0006
        BNEQ    L_52D5                          ; 52D1   020C 0002

        MVO     R1,     G_0112                  ; 52D3   0241 0112
L_52D5:
        CMPI    #$0006, R0                      ; 52D5   0378 0006
        BNEQ    L_52DB                          ; 52D7   020C 0002

        MVO     R1,     G_0113                  ; 52D9   0241 0113
L_52DB:
        CMPI    #$0000, R0                      ; 52DB   0378 0000
        BNEQ    L_52E1                          ; 52DD   020C 0002

        MVO     R1,     G_0113                  ; 52DF   0241 0113
L_52E1:
        MVII    #$0171, R4                      ; 52E1   02BC 0171
        PULR    R5                              ; 52E3   02B5
        SDBD                                    ; 52E4   0001
        MVI@    R4,     R7                      ; 52E5   02A7

        PSHR    R5                              ; 52E6   0275
        MOVR    R0,     R1                      ; 52E7   0081
        MVII    #$001E, R0                      ; 52E8   02B8 001E
        TSTR    R1                              ; 52EA   0089
        BMI     L_530F                          ; 52EB   020B 0022

        MVII    #$00FF, R2                      ; 52ED   02BA 00FF
        MVO     R2,     G_0181                  ; 52EF   0242 0181
        CMPI    #$0001, R1                      ; 52F1   0379 0001
        BNEQ    L_52F6                          ; 52F3   020C 0001

        CLRR    R1                              ; 52F5   01C9
L_52F6:
        CMPI    #$000F, R1                      ; 52F6   0379 000F
        BNEQ    L_52FB                          ; 52F8   020C 0001

        CLRR    R1                              ; 52FA   01C9
L_52FB:
        CMPI    #$0007, R1                      ; 52FB   0379 0007
        BNEQ    L_5300                          ; 52FD   020C 0001

        INCR    R1                              ; 52FF   0009
L_5300:
        CMPI    #$0009, R1                      ; 5300   0379 0009
        BNEQ    L_5305                          ; 5302   020C 0001

        DECR    R1                              ; 5304   0011

L_5305:
        JSR     R5,     .EXEC.629               ; 5305   0004 0114 0229

        SDBD                                    ; 5308   0001
        ANDI    #$FF00, R0                      ; 5309   03B8 0000 00FF
        MVO     R0,     G_0349                  ; 530C   0240 0349
        PULR    R7                              ; 530E   02B7

L_530F:
        MVII    #$0001, R2                      ; 530F   02BA 0001
        MVO     R2,     G_0181                  ; 5311   0242 0181
        PULR    R7                              ; 5313   02B7

L_5314:
        PSHR    R5                              ; 5314   0275
        CLRR    R0                              ; 5315   01C0
        B       L_5305                          ; 5316   0220 0012

        PSHR    R5                              ; 5318   0275
        MVII    #$031E, R2                      ; 5319   02BA 031E
        MVI@    R2,     R0                      ; 531B   0290
        TSTR    R0                              ; 531C   0080
        BNEQ    L_532F                          ; 531D   020C 0010

        DECR    R2                              ; 531F   0012
        SDBD                                    ; 5320   0001
        MVII    #$5AA0, R1                      ; 5321   02B9 00A0 005A

        JSR     R5,     X_INIT_MOB              ; 5324   0004 0114 02B2

        MVI     G_0347, R0                      ; 5327   0280 0347
        ADDI    #$0002, R2                      ; 5329   02FA 0002
        MVO@    R0,     R2                      ; 532B   0250

        JSR     R5,     L_5F7F                  ; 532C   0004 015C 037F

L_532F:
        PULR    R7                              ; 532F   02B7

        PSHR    R5                              ; 5330   0275
        MOVR    R0,     R4                      ; 5331   0084
        ADDI    #$0166, R4                      ; 5332   02FC 0166
L_5334:
        MVII    #$0004, R0                      ; 5334   02B8 0004

        JSR     R5,     X_RAND1                 ; 5336   0004 0114 027D

        ADDI    #$0004, R0                      ; 5339   02F8 0004
        MVO@    R0,     R4                      ; 533B   0260

        JSR     R5,     .EXEC.7AE               ; 533C   0004 0114 03AE

        MVI@    R1,     R0                      ; 533F   0288
        SDBD                                    ; 5340   0001
        XORI    #$1000, R0                      ; 5341   03F8 0000 0010
        MVO@    R0,     R1                      ; 5344   0248
        CLRR    R0                              ; 5345   01C0
        CMPI    #$032D, R1                      ; 5346   0379 032D
        BNEQ    L_534C                          ; 5348   020C 0002

        MVO     R0,     G_0174                  ; 534A   0240 0174
L_534C:
        CMPI    #$0335, R1                      ; 534C   0379 0335
        BNEQ    L_5352                          ; 534E   020C 0002

        MVO     R0,     G_0175                  ; 5350   0240 0175
L_5352:
        CMPI    #$033D, R1                      ; 5352   0379 033D
        BNEQ    L_5358                          ; 5354   020C 0002

        MVO     R0,     G_0178                  ; 5356   0240 0178
L_5358:
        PULR    R7                              ; 5358   02B7

        PSHR    R5                              ; 5359   0275
        MVII    #$0008, R0                      ; 535A   02B8 0008
        MVO     R0,     G_016A                  ; 535C   0240 016A
        MVI@    R1,     R0                      ; 535E   0288
        SDBD                                    ; 535F   0001
        XORI    #$1000, R0                      ; 5360   03F8 0000 0010
        MVO@    R0,     R1                      ; 5363   0248
        CLRR    R0                              ; 5364   01C0
        MVO     R0,     G_016F                  ; 5365   0240 016F
        MVO     R0,     G_0176                  ; 5367   0240 0176
        MVO     R0,     G_0182                  ; 5369   0240 0182

        JSR     R5,     .EXEC.7AE               ; 536B   0004 0114 03AE

        SDBD                                    ; 536E   0001
        MVII    #$0800, R0                      ; 536F   02B8 0000 0008
        MVO     R0,     G_033F                  ; 5372   0240 033F
        PULR    R7                              ; 5374   02B7

L_5375:
        MVII    #$003C, R0                      ; 5375   02B8 003C
        MVII    #$0200, R4                      ; 5377   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5379   0004 0114 0338

        MVII    #$0002, R3                      ; 537C   02BB 0002
        MVII    #$0219, R4                      ; 537E   02BC 0219

        JSR     R5,     X_PRINT_R5              ; 5380   0004 0118 007B
        STRING  "GAME SCORE:"                   ; 5383  
        DECLE   $0000                           ; 538E   0000

        MVII    #$022B, R4                      ; 538F   02BC 022B

        JSR     R5,     L_53EE                  ; 5391   0004 0150 03EE

        MVI     G_017A, R0                      ; 5394   0280 017A
        TSTR    R0                              ; 5396   0080
        BNEQ    L_53B0                          ; 5397   020C 0017

        MVII    #$0001, R3                      ; 5399   02BB 0001
        MVII    #$0217, R4                      ; 539B   02BC 0217

        JSR     R5,     X_PRINT_R5              ; 539D   0004 0118 007B
        STRING  "PRACTICE SCORE:"               ; 53A0  
        DECLE   $0000                           ; 53AF   0000
L_53B0:
        JSR     R5,     L_53BF                  ; 53B0   0004 0150 03BF
L_53B3:
        JSR     R5,     .EXEC.4F1               ; 53B3   0004 0114 00F1

        SDBD                                    ; 53B6   0001
        MVII    #$07FF, R3                      ; 53B7   02BB 00FF 0007
L_53BA:
        DECR    R3                              ; 53BA   0013
        BNEQ    L_53BA                          ; 53BB   022C 0002
        B       L_53B3                          ; 53BD   0220 000B

L_53BF:
        PSHR    R5                              ; 53BF   0275
        MVII    #$0001, R0                      ; 53C0   02B8 0001
        CLRR    R2                              ; 53C2   01D2
        SDBD                                    ; 53C3   0001
        MVII    #$5FFF, R1                      ; 53C4   02B9 00FF 005F
        SDBD                                    ; 53C7   0001
        MVII    #$5253, R4                      ; 53C8   02BC 0053 0052

        JSR     R5,     .EXEC.910               ; 53CB   0004 0118 0110

        MVII    #$0171, R4                      ; 53CE   02BC 0171
        MVI@    R4,     R0                      ; 53D0   02A0
        MVI@    R4,     R1                      ; 53D1   02A1
        MVII    #$0100, R4                      ; 53D2   02BC 0100
        MVO@    R0,     R4                      ; 53D4   0260
        MVO@    R1,     R4                      ; 53D5   0261
        SDBD                                    ; 53D6   0001
        MVII    #$0042, R0                      ; 53D7   02B8 0042 0000
        MVII    #$015D, R4                      ; 53DA   02BC 015D

        JSR     R5,     X_FILL_ZERO             ; 53DC   0004 0114 0338

        MVII    #$0040, R0                      ; 53DF   02B8 0040
        MVII    #$031D, R4                      ; 53E1   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; 53E3   0004 0114 0338

        SDBD                                    ; 53E6   0001
        MVII    #$108F, R5                      ; 53E7   02BD 008F 0010
        MVII    #$02F1, R6                      ; 53EA   02BE 02F1
        B       .START                          ; 53EC   0220 030E

L_53EE:
        PSHR    R5                              ; 53EE   0275
        MVII    #$0007, R3                      ; 53EF   02BB 0007
        MVII    #$0004, R1                      ; 53F1   02B9 0004
        MVI     G_032C, R0                      ; 53F3   0280 032C
        MOVR    R0,     R2                      ; 53F5   0082
        BEQ     L_53FB                          ; 53F6   0204 0003

        JSR     R5,     X_PRNUM_RGT             ; 53F8   0004 0118 00C5

L_53FB:
        MVI     G_0354, R0                      ; 53FB   0280 0354
        ADDI    #$0004, R4                      ; 53FD   02FC 0004
        TSTR    R2                              ; 53FF   0092
        BNEQ    L_5407                          ; 5400   020C 0005

        JSR     R5,     X_PRNUM_RGT             ; 5402   0004 0118 00C5

        B       L_540A                          ; 5405   0200 0003

L_5407:
        JSR     R5,     X_PRNUM_ZRO             ; 5407   0004 0118 00AD

L_540A:
        ADDI    #$0004, R4                      ; 540A   02FC 0004

        JSR     R5,     X_PRINT_R5              ; 540C   0004 0118 007B
        STRING  "0"                             ; 540F   0030
        DECLE   $0000                           ; 5410   0000

        PULR    R7                              ; 5411   02B7

L_5412:
        PSHR    R5                              ; 5412   0275
        MVII    #$0200, R1                      ; 5413   02B9 0200
        TSTR    R2                              ; 5415   0092
        BNEQ    L_541A                          ; 5416   020C 0002

        ADDI    #$0013, R1                      ; 5418   02F9 0013
L_541A:
        CLRR    R0                              ; 541A   01C0
L_541B:
        MVO@    R0,     R1                      ; 541B   0248
        ADDI    #$0014, R1                      ; 541C   02F9 0014
        CMPI    #$02F0, R1                      ; 541E   0379 02F0
        BNC     L_541B                          ; 5420   0229 0006

        MVII    #$0200, R1                      ; 5422   02B9 0200
        TSTR    R2                              ; 5424   0092
        BEQ     L_5429                          ; 5425   0204 0002

        ADDI    #$0013, R1                      ; 5427   02F9 0013
L_5429:
        MVI@    R1,     R5                      ; 5429   028D
        ANDI    #$03FF, R5                      ; 542A   03BD 03FF
        BEQ     L_542F                          ; 542C   0204 0001

        INCR    R0                              ; 542E   0008
L_542F:
        ADDI    #$0014, R1                      ; 542F   02F9 0014
        CMPI    #$02F0, R1                      ; 5431   0379 02F0
        BNC     L_5429                          ; 5433   0229 000B

        TSTR    R0                              ; 5435   0080
        BEQ     L_5463                          ; 5436   0204 002B

        MVI     G_015D, R0                      ; 5438   0280 015D
        NEGR    R0                              ; 543A   0020
        MVO     R0,     G_015D                  ; 543B   0240 015D
        MVII    #$02EF, R1                      ; 543D   02B9 02EF
        MVII    #$02DB, R2                      ; 543F   02BA 02DB
L_5441:
        MVI@    R2,     R0                      ; 5441   0290
        MVO@    R0,     R1                      ; 5442   0248
        DECR    R1                              ; 5443   0011
        DECR    R2                              ; 5444   0012
        CMPI    #$0200, R2                      ; 5445   037A 0200
        BC      L_5441                          ; 5447   0221 0007

        MVII    #$0200, R4                      ; 5449   02BC 0200
        MVII    #$0014, R0                      ; 544B   02B8 0014

        JSR     R5,     X_FILL_ZERO             ; 544D   0004 0114 0338
        JSR     R5,     L_5F6B                  ; 5450   0004 015C 036B

        MVII    #$0014, R0                      ; 5453   02B8 0014
        MVII    #$02DC, R4                      ; 5455   02BC 02DC
        CLRR    R2                              ; 5457   01D2
L_5458:
        MVI@    R4,     R1                      ; 5458   02A1
        ADDR    R1,     R2                      ; 5459   00CA
        TSTR    R1                              ; 545A   0089
        BNEQ    L_5464                          ; 545B   020C 0007

L_545D:
        DECR    R0                              ; 545D   0010
        BNEQ    L_5458                          ; 545E   022C 0007

        TSTR    R2                              ; 5460   0092
        BNEQ    L_5497                          ; 5461   020C 0034
L_5463:
        PULR    R7                              ; 5463   02B7

L_5464:
        PSHR    R0                              ; 5464   0270
        MOVR    R1,     R0                      ; 5465   0088
        SDBD                                    ; 5466   0001
        CMPI    #$0800, R0                      ; 5467   0378 0000 0008
        BNEQ    L_5470                          ; 546A   020C 0004

        SDBD                                    ; 546C   0001
        XORI    #$1002, R0                      ; 546D   03F8 0002 0010
L_5470:
        SDBD                                    ; 5470   0001
        DECLE   $0378,  $0030,  $0008,  $020C   ; 5471   0378 0030 0008 020C
        DECLE   $0004,  $0001,  $03F8,  $0005   ; 5475   0004 0001 03F8 0005
        DECLE   $0010,  $0001                   ; 5479   0010 0001

        CMPI    #$0010, R0                      ; 547B   0378 0010
        INCR    R0                              ; 547D   0008
        BNEQ    L_5482                          ; 547E   020C 0002

        XORI    #$0005, R0                      ; 5480   03F8 0005
L_5482:
        SDBD                                    ; 5482   0001
        CMPI    #$0820, R0                      ; 5483   0378 0020 0008
        BNEQ    L_548A                          ; 5486   020C 0002

        XORI    #$0006, R0                      ; 5488   03F8 0006
L_548A:
        DECR    R4                              ; 548A   0014
        MOVR    R0,     R1                      ; 548B   0081
        MVII    #$0001, R0                      ; 548C   02B8 0001
        PSHR    R2                              ; 548E   0272

        JSR     R5,     L_523D                  ; 548F   0004 0150 023D

        PULR    R2                              ; 5492   02B2
        PULR    R0                              ; 5493   02B0
        DECR    R0                              ; 5494   0010
        B       L_545D                          ; 5495   0220 0039

L_5497:
        MVII    #$00FF, R0                      ; 5497   02B8 00FF
        CMP     G_0180, R0                      ; 5499   0340 0180
        BEQ     L_5375                          ; 549B   0224 0127

        MVO     R0,     G_0180                  ; 549D   0240 0180
        MVII    #$00F0, R0                      ; 549F   02B8 00F0
        MVII    #$0200, R4                      ; 54A1   02BC 0200
        CLRR    R2                              ; 54A3   01D2
        B       L_5458                          ; 54A4   0220 004D

        PSHR    R5                              ; 54A6   0275
        MVI     G_0182, R0                      ; 54A7   0280 0182
        TSTR    R0                              ; 54A9   0080
        BEQ     L_54B1                          ; 54AA   0204 0005

        MVII    #$033D, R1                      ; 54AC   02B9 033D

        JSR     R5,     L_56E6                  ; 54AE   0004 0154 02E6

L_54B1:
        PULR    R7                              ; 54B1   02B7

        PSHR    R5                              ; 54B2   0275
        MOVR    R0,     R2                      ; 54B3   0082
        MOVR    R1,     R4                      ; 54B4   008C
        MOVR    R3,     R0                      ; 54B5   0098

        JSR     R5,     .EXEC.76C               ; 54B6   0004 0114 036C

        CMPI    #$031D, R1                      ; 54B9   0379 031D
        BNEQ    L_54C5                          ; 54BB   020C 0008

        JSR     R5,     L_55AD                  ; 54BD   0004 0154 01AD

        TSTR    R0                              ; 54C0   0080
        BEQ     L_5549                          ; 54C1   0204 0086
        B       L_54D4                          ; 54C3   0200 000F

L_54C5:
        CMPI    #$033D, R1                      ; 54C5   0379 033D
        BNEQ    L_54CE                          ; 54C7   020C 0005

        MVI     G_0176, R5                      ; 54C9   0285 0176
        TSTR    R5                              ; 54CB   00AD
        BNEQ    L_5549                          ; 54CC   020C 007B

L_54CE:
        JSR     R5,     L_55E3                  ; 54CE   0004 0154 01E3

        TSTR    R0                              ; 54D1   0080
        BEQ     L_5549                          ; 54D2   0204 0075

L_54D4:
        PSHR    R1                              ; 54D4   0271
        ADDI    #$0002, R1                      ; 54D5   02F9 0002
        ADDI    #$0002, R4                      ; 54D7   02FC 0002
        MOVR    R1,     R5                      ; 54D9   008D
        MVI@    R5,     R1                      ; 54DA   02A9
        SUB@    R4,     R1                      ; 54DB   0321
        ADDI    #$0300, R1                      ; 54DC   02F9 0300
        SWAP    R1,     1                       ; 54DE   0041
        ANDI    #$00FF, R1                      ; 54DF   03B9 00FF
        CMPI    #$0004, R0                      ; 54E1   0378 0004
        BNEQ    L_54E7                          ; 54E3   020C 0002

        ADDI    #$0006, R1                      ; 54E5   02F9 0006
L_54E7:
        SLR     R1,     1                       ; 54E7   0061
        CMPI    #$0008, R1                      ; 54E8   0379 0008
        BEQ     L_54F0                          ; 54EA   0204 0004
        BGT     L_54F4                          ; 54EC   020E 0006
        B       L_54F5                          ; 54EE   0200 0005

L_54F0:
        MVII    #$0007, R1                      ; 54F0   02B9 0007
        B       L_54F5                          ; 54F2   0200 0001

L_54F4:
        CLRR    R1                              ; 54F4   01C9
L_54F5:
        MVII    #$0007, R0                      ; 54F5   02B8 0007
        SUBR    R1,     R0                      ; 54F7   0108

        JSR     R5,     X_POW2                  ; 54F8   0004 0114 0345

        CMPI    #$0001, R2                      ; 54FB   037A 0001
        BNEQ    L_5501                          ; 54FD   020C 0002

        MVII    #$0196, R4                      ; 54FF   02BC 0196
L_5501:
        CMPI    #$0007, R2                      ; 5501   037A 0007
        BNEQ    L_5507                          ; 5503   020C 0002

        MVII    #$018E, R4                      ; 5505   02BC 018E
L_5507:
        CMPI    #$0006, R2                      ; 5507   037A 0006
        BNEQ    L_550D                          ; 5509   020C 0002

        MVII    #$0186, R4                      ; 550B   02BC 0186
L_550D:
        PULR    R1                              ; 550D   02B1
        SUBI    #$031D, R1                      ; 550E   0339 031D
L_5510:
        MVII    #$0008, R3                      ; 5510   02BB 0008
        TSTR    R1                              ; 5512   0089
        BNEQ    L_5517                          ; 5513   020C 0002

        ADDI    #$0007, R4                      ; 5515   02FC 0007
L_5517:
        MVI@    R4,     R2                      ; 5517   02A2
        ANDR    R0,     R2                      ; 5518   0182
        BNEQ    L_5543                          ; 5519   020C 0028

        TSTR    R1                              ; 551B   0089
        BNEQ    L_5520                          ; 551C   020C 0002

        DECR    R4                              ; 551E   0014
        DECR    R4                              ; 551F   0014
L_5520:
        DECR    R3                              ; 5520   0013
        BNEQ    L_5517                          ; 5521   022C 000B

        SUBI    #$0008, R4                      ; 5523   033C 0008
        TSTR    R1                              ; 5525   0089
        BNEQ    L_552A                          ; 5526   020C 0002

        ADDI    #$0010, R4                      ; 5528   02FC 0010
L_552A:
        PSHR    R0                              ; 552A   0270
        MVII    #$0001, R0                      ; 552B   02B8 0001

        JSR     R5,     X_RAND1                 ; 552D   0004 0114 027D

        CMPI    #$0001, R0                      ; 5530   0378 0001
        BNEQ    L_553B                          ; 5532   020C 0007

        PULR    R0                              ; 5534   02B0
        SLR     R0,     1                       ; 5535   0060
        TSTR    R0                              ; 5536   0080
        BEQ     L_5549                          ; 5537   0204 0010
        B       L_5510                          ; 5539   0220 002A

L_553B:
        PULR    R0                              ; 553B   02B0
        SLL     R0,     1                       ; 553C   0048
        CMPI    #$0100, R0                      ; 553D   0378 0100
        BEQ     L_5549                          ; 553F   0204 0008
        B       L_5510                          ; 5541   0220 0032

L_5543:
        DECR    R4                              ; 5543   0014
        MVI@    R4,     R2                      ; 5544   02A2
        DECR    R4                              ; 5545   0014
        COMR    R0                              ; 5546   0018
        ANDR    R0,     R2                      ; 5547   0182
        MVO@    R2,     R4                      ; 5548   0262
L_5549:
        PULR    R7                              ; 5549   02B7

        PSHR    R5                              ; 554A   0275
        MVII    #$0001, R0                      ; 554B   02B8 0001
        MVO     R0,     G_016F                  ; 554D   0240 016F
        INCR    R0                              ; 554F   0008
        MVO     R0,     G_0170                  ; 5550   0240 0170
        MVII    #$033D, R1                      ; 5552   02B9 033D
        MVI@    R1,     R0                      ; 5554   0288
        SDBD                                    ; 5555   0001
        ANDI    #$7FFF, R0                      ; 5556   03B8 00FF 007F
        SDBD                                    ; 5559   0001
        XORI    #$8010, R0                      ; 555A   03F8 0010 0080
        MVO@    R0,     R1                      ; 555D   0248
        MOVR    R3,     R0                      ; 555E   0098
        INCR    R7                              ; 555F   000F

        PSHR    R5                              ; 5560   0275

L_5561:
        JSR     R5,     .EXEC.7C1               ; 5561   0004 0114 03C1

        CMPI    #$0001, R0                      ; 5564   0378 0001
        BNEQ    L_556A                          ; 5566   020C 0002

        MVII    #$0196, R4                      ; 5568   02BC 0196
L_556A:
        CMPI    #$0007, R0                      ; 556A   0378 0007
        BNEQ    L_5570                          ; 556C   020C 0002

        MVII    #$018E, R4                      ; 556E   02BC 018E
L_5570:
        CMPI    #$0006, R0                      ; 5570   0378 0006
        BNEQ    L_5576                          ; 5572   020C 0002

        MVII    #$0186, R4                      ; 5574   02BC 0186
L_5576:
        MVII    #$0006, R0                      ; 5576   02B8 0006

        JSR     R5,     X_RAND1                 ; 5578   0004 0114 027D

        MVII    #$003F, R3                      ; 557B   02BB 003F
L_557D:
        ANDI    #$003F, R0                      ; 557D   03B8 003F
        MVII    #$0007, R1                      ; 557F   02B9 0007
        MVII    #$0038, R2                      ; 5581   02BA 0038
        ANDR    R0,     R1                      ; 5583   0181
        ANDR    R0,     R2                      ; 5584   0182
        SLR     R2,     2                       ; 5585   0066
        SLR     R2,     1                       ; 5586   0062
        ADDR    R4,     R2                      ; 5587   00E2
        PSHR    R0                              ; 5588   0270
        MOVR    R1,     R0                      ; 5589   0088

        JSR     R5,     X_POW2                  ; 558A   0004 0114 0345

        COMR    R0                              ; 558D   0018
        MVI@    R2,     R1                      ; 558E   0291
        ANDR    R0,     R1                      ; 558F   0181
        PULR    R0                              ; 5590   02B0
        CMP@    R2,     R1                      ; 5591   0351
        BNEQ    L_559B                          ; 5592   020C 0007

        INCR    R0                              ; 5594   0008
        TSTR    R3                              ; 5595   009B
        BEQ     L_559C                          ; 5596   0204 0004

        DECR    R3                              ; 5598   0013
        B       L_557D                          ; 5599   0220 001D

L_559B:
        MVO@    R1,     R2                      ; 559B   0251
L_559C:
        PULR    R7                              ; 559C   02B7

        PSHR    R5                              ; 559D   0275

        JSR     R5,     .EXEC.7C1               ; 559E   0004 0114 03C1

        MVII    #$0001, R2                      ; 55A1   02BA 0001
        MVI     G_031D, R0                      ; 55A3   0280 031D
        SDBD                                    ; 55A5   0001
        XORI    #$0800, R0                      ; 55A6   03F8 0000 0008
        MVO     R0,     G_031D                  ; 55A9   0240 031D
        B       L_55B2                          ; 55AB   0200 0005

L_55AD:
        PSHR    R5                              ; 55AD   0275

        JSR     R5,     .EXEC.7C1               ; 55AE   0004 0114 03C1

        CLRR    R2                              ; 55B1   01D2
L_55B2:
        SDBD                                    ; 55B2   0001
        MVII    #$8000, R0                      ; 55B3   02B8 0000 0080
        AND@    R1,     R0                      ; 55B6   0388
        BNEQ    L_55CC                          ; 55B7   020C 0013

        SDBD                                    ; 55B9   0001
        MVII    #$8000, R0                      ; 55BA   02B8 0000 0080
        XOR@    R1,     R0                      ; 55BD   03C8
        MVO@    R0,     R1                      ; 55BE   0248
        ADDI    #$0005, R1                      ; 55BF   02F9 0005
        TSTR    R2                              ; 55C1   0092
        BNEQ    L_55CE                          ; 55C2   020C 000A

        MVII    #$0202, R0                      ; 55C4   02B8 0202
        MVO@    R0,     R1                      ; 55C6   0248
        INCR    R1                              ; 55C7   0009
        MVII    #$0006, R0                      ; 55C8   02B8 0006
        MVO@    R0,     R1                      ; 55CA   0248
        PULR    R7                              ; 55CB   02B7

L_55CC:
        CLRR    R0                              ; 55CC   01C0
        PULR    R7                              ; 55CD   02B7

L_55CE:
        INCR    R1                              ; 55CE   0009
        MVII    #$0002, R0                      ; 55CF   02B8 0002
        MVO@    R0,     R1                      ; 55D1   0248
        PULR    R7                              ; 55D2   02B7

        MVI     G_031D, R0                      ; 55D3   0280 031D
        SDBD                                    ; 55D5   0001
        ANDI    #$8000, R0                      ; 55D6   03B8 0000 0080
        BNEQ    L_55E3                          ; 55D9   020C 0008

        MVI     G_016E, R0                      ; 55DB   0280 016E
        SLL     R0,     2                       ; 55DD   004C
        MVI     G_0354, R2                      ; 55DE   0282 0354
        ADDR    R2,     R0                      ; 55E0   00D0
        MVO     R0,     G_0354                  ; 55E1   0240 0354
L_55E3:
        PSHR    R5                              ; 55E3   0275

        JSR     R5,     .EXEC.7C1               ; 55E4   0004 0114 03C1

        SDBD                                    ; 55E7   0001
        MVII    #$8000, R0                      ; 55E8   02B8 0000 0080
        AND@    R1,     R0                      ; 55EB   0388
        BNEQ    L_562A                          ; 55EC   020C 003C

        SDBD                                    ; 55EE   0001
        MVII    #$8800, R0                      ; 55EF   02B8 0000 0088
        XOR@    R1,     R0                      ; 55F2   03C8
        CMPI    #$033D, R1                      ; 55F3   0379 033D
        BNEQ    L_5600                          ; 55F5   020C 0009

        MVI     G_0178, R3                      ; 55F7   0283 0178
        TSTR    R3                              ; 55F9   009B
        BEQ     L_5600                          ; 55FA   0204 0004

        SDBD                                    ; 55FC   0001
        XORI    #$2880, R0                      ; 55FD   03F8 0080 0028
L_5600:
        MVO@    R0,     R1                      ; 5600   0248
        ADDI    #$0005, R1                      ; 5601   02F9 0005
        MVII    #$0203, R0                      ; 5603   02B8 0203
        MVO@    R0,     R1                      ; 5605   0248
        INCR    R1                              ; 5606   0009
        MVII    #$0004, R0                      ; 5607   02B8 0004
        MVO@    R0,     R1                      ; 5609   0248
        CMPI    #$0343, R1                      ; 560A   0379 0343
        BNEQ    L_5627                          ; 560C   020C 0019

        TSTR    R3                              ; 560E   009B
        BEQ     L_5627                          ; 560F   0204 0016

        JSR     R5,     .EXEC.41C               ; 5611   0004 0114 001C

        MVII    #$033F, R4                      ; 5614   02BC 033F
        MVI@    R4,     R2                      ; 5616   02A2
        SDBD                                    ; 5617   0001
        SUBI    #$0400, R2                      ; 5618   033A 0000 0004
        DECR    R4                              ; 561B   0014
        MVO@    R2,     R4                      ; 561C   0262
        MVI@    R4,     R2                      ; 561D   02A2
        SDBD                                    ; 561E   0001
        SUBI    #$0400, R2                      ; 561F   033A 0000 0004
        DECR    R4                              ; 5622   0014
        MVO@    R2,     R4                      ; 5623   0262
        MVII    #$033D, R4                      ; 5624   02BC 033D
        CLRR    R0                              ; 5626   01C0
L_5627:
        ADDI    #$0004, R0                      ; 5627   02F8 0004
        PULR    R7                              ; 5629   02B7

L_562A:
        CLRR    R0                              ; 562A   01C0
        PULR    R7                              ; 562B   02B7

        PSHR    R5                              ; 562C   0275

        JSR     R5,     L_5F94                  ; 562D   0004 015C 0394

        SDBD                                    ; 5630   0001
        MVII    #$8813, R0                      ; 5631   02B8 0013 0088
        XOR@    R1,     R0                      ; 5634   03C8
        MVO@    R0,     R1                      ; 5635   0248
        ADDI    #$0005, R1                      ; 5636   02F9 0005
        MVII    #$0201, R0                      ; 5638   02B8 0201
        MVO@    R0,     R1                      ; 563A   0248
        MVII    #$0353, R1                      ; 563B   02B9 0353
        MVII    #$0008, R0                      ; 563D   02B8 0008
        MVO@    R0,     R1                      ; 563F   0248
        PULR    R7                              ; 5640   02B7

        PSHR    R5                              ; 5641   0275
        MVII    #$0174, R4                      ; 5642   02BC 0174
        CLRR    R0                              ; 5644   01C0
        MVO@    R0,     R4                      ; 5645   0260
        MVO@    R0,     R4                      ; 5646   0260
        MVI     G_0167, R0                      ; 5647   0280 0167
        DECR    R0                              ; 5649   0010
        MVO     R0,     G_0167                  ; 564A   0240 0167
        BMI     L_56BC                          ; 564C   020B 006E

        MVII    #$0345, R1                      ; 564E   02B9 0345

        JSR     R5,     .EXEC.7AE               ; 5650   0004 0114 03AE

        MVII    #$02DE, R4                      ; 5653   02BC 02DE

        JSR     R5,     L_53EE                  ; 5655   0004 0150 03EE

        MVII    #$02E9, R4                      ; 5658   02BC 02E9
        MVI     G_0167, R0                      ; 565A   0280 0167
        INCR    R0                              ; 565C   0008
        CMPI    #$0006, R0                      ; 565D   0378 0006
        BLT     L_5663                          ; 565F   0205 0002

        MVII    #$0005, R0                      ; 5661   02B8 0005
L_5663:
        SDBD                                    ; 5663   0001
        MVII    #$0841, R1                      ; 5664   02B9 0041 0008

        JSR     R5,     X_FILL_MEM              ; 5667   0004 0114 0341

        MVI     G_0167, R0                      ; 566A   0280 0167
        CMPI    #$0005, R0                      ; 566C   0378 0005
        BLT     L_5679                          ; 566E   0205 0009

        MVII    #$0005, R3                      ; 5670   02BB 0005
        MVII    #$02EE, R4                      ; 5672   02BC 02EE

        JSR     R5,     X_PRINT_R5              ; 5674   0004 0118 007B
        STRING  "+"                             ; 5677   002B
        DECLE   $0000                           ; 5678   0000
L_5679:
        SDBD                                    ; 5679   0001
        MVII    #$FFFF, R0                      ; 567A   02B8 00FF 00FF
L_567D:
        DECR    R0                              ; 567D   0010
        BNEQ    L_567D                          ; 567E   022C 0002

        MVII    #$0014, R0                      ; 5680   02B8 0014
        MVII    #$02DC, R4                      ; 5682   02BC 02DC

        JSR     R5,     X_FILL_ZERO             ; 5684   0004 0114 0338

        SDBD                                    ; 5687   0001
        MVII    #$5B44, R1                      ; 5688   02B9 0044 005B
        MVII    #$0345, R2                      ; 568B   02BA 0345

        JSR     R5,     X_INIT_MOB              ; 568D   0004 0114 02B2

        MVII    #$011F, R4                      ; 5690   02BC 011F
        MVII    #$0006, R0                      ; 5692   02B8 0006

        JSR     R5,     X_FILL_ZERO             ; 5694   0004 0114 0338
        JSR     R5,     .EXEC.4F1               ; 5697   0004 0114 00F1
        JSR     R5,     .EXEC.4F1               ; 569A   0004 0114 00F1

        MVI     G_011F, R0                      ; 569D   0280 011F
        ADD     G_0120, R0                      ; 569F   02C0 0120
        CMPI    #$0080, R0                      ; 56A1   0378 0080
        BGE     L_56BB                          ; 56A3   020D 0016

        ANDI    #$000F, R0                      ; 56A5   03B8 000F
        CMPI    #$000C, R0                      ; 56A7   0378 000C
        BGE     L_56B5                          ; 56A9   020D 000A

        CMPI    #$0004, R0                      ; 56AB   0378 0004
        BLT     L_56B5                          ; 56AD   0205 0006

        SDBD                                    ; 56AF   0001
        MVII    #$2400, R0                      ; 56B0   02B8 0000 0024
        B       L_56B9                          ; 56B3   0200 0004

L_56B5:
        SDBD                                    ; 56B5   0001
        MVII    #$7C00, R0                      ; 56B6   02B8 0000 007C
L_56B9:
        MVO     R0,     G_0347                  ; 56B9   0240 0347
L_56BB:
        PULR    R7                              ; 56BB   02B7
L_56BC:
        J       L_5375                          ; 56BC   0004 0350 0375

        MVII    #$0001, R0                      ; 56BF   02B8 0001
        MVO     R0,     G_034B                  ; 56C1   0240 034B
        MVI     G_0347, R0                      ; 56C3   0280 0347
        MVII    #$015E, R4                      ; 56C5   02BC 015E
        SDBD                                    ; 56C7   0001
        MVI@    R4,     R1                      ; 56C8   02A1
        ADDR    R1,     R0                      ; 56C9   00C8
        SDBD                                    ; 56CA   0001
        MVII    #$1100, R2                      ; 56CB   02BA 0000 0011
        CMPR    R2,     R0                      ; 56CE   0150
        BEQ     L_56D3                          ; 56CF   0204 0002
        BNC     L_56DB                          ; 56D1   0209 0008

L_56D3:
        SDBD                                    ; 56D3   0001
        MVII    #$A100, R3                      ; 56D4   02BB 0000 00A1
        CMPR    R3,     R0                      ; 56D7   0158
        BC      L_56E0                          ; 56D8   0201 0006
        MOVR    R5,     R7                      ; 56DA   00AF

L_56DB:
        INCR    R2                              ; 56DB   000A
        SUBR    R1,     R2                      ; 56DC   010A
        MOVR    R2,     R0                      ; 56DD   0090
        B       L_56E3                          ; 56DE   0200 0003

L_56E0:
        DECR    R3                              ; 56E0   0013
        SUBR    R1,     R3                      ; 56E1   010B
        MOVR    R3,     R0                      ; 56E2   0098
L_56E3:
        MVO     R0,     G_0347                  ; 56E3   0240 0347
        MOVR    R5,     R7                      ; 56E5   00AF

L_56E6:
        PSHR    R5                              ; 56E6   0275
        MVI     G_015D, R0                      ; 56E7   0280 015D
        TSTR    R0                              ; 56E9   0080
        BEQ     L_579D                          ; 56EA   0204 00B1

        MOVR    R1,     R4                      ; 56EC   008C
        ADDI    #$0002, R4                      ; 56ED   02FC 0002
        MVI@    R4,     R0                      ; 56EF   02A0
        SWAP    R0,     1                       ; 56F0   0040
        SUBI    #$0005, R0                      ; 56F1   0338 0005
        SLR     R0,     2                       ; 56F3   0064
        SLR     R0,     1                       ; 56F4   0060
        MOVR    R0,     R2                      ; 56F5   0082
        ANDI    #$001F, R2                      ; 56F6   03BA 001F
        MVI@    R4,     R0                      ; 56F8   02A0
        SWAP    R0,     1                       ; 56F9   0040
        SLR     R0,     1                       ; 56FA   0060
        ADDI    #$0006, R0                      ; 56FB   02F8 0006
        ANDI    #$003C, R0                      ; 56FD   03B8 003C
        ADDR    R0,     R2                      ; 56FF   00C2
        SLL     R0,     2                       ; 5700   004C
        ADDR    R0,     R2                      ; 5701   00C2
        ADDI    #$01D8, R2                      ; 5702   02FA 01D8
        CLRR    R1                              ; 5704   01C9
        MOVR    R2,     R4                      ; 5705   0094
        MVI@    R2,     R0                      ; 5706   0290
        TSTR    R0                              ; 5707   0080
        BNEQ    L_570B                          ; 5708   020C 0001
        PULR    R7                              ; 570A   02B7

L_570B:
        ANDI    #$0008, R0                      ; 570B   03B8 0008
        BEQ     L_5710                          ; 570D   0204 0001

        DECR    R4                              ; 570F   0014
L_5710:
        MVO@    R1,     R4                      ; 5710   0261
        MVO@    R1,     R4                      ; 5711   0261
        MVI     G_016E, R0                      ; 5712   0280 016E
        ADD     G_0354, R0                      ; 5714   02C0 0354
        SDBD                                    ; 5716   0001
        CMPI    #$2710, R0                      ; 5717   0378 0010 0027
        BLT     L_5725                          ; 571A   0205 0009

        SDBD                                    ; 571C   0001
        SUBI    #$2710, R0                      ; 571D   0338 0010 0027
        MVI     G_032C, R1                      ; 5720   0281 032C
        INCR    R1                              ; 5722   0009
        MVO     R1,     G_032C                  ; 5723   0241 032C
L_5725:
        MVO     R0,     G_0354                  ; 5725   0240 0354
        PSHR    R1                              ; 5727   0271
        MVI     G_035C, R1                      ; 5728   0281 035C
        MVI     G_016B, R2                      ; 572A   0282 016B

        JSR     R5,     X_DIVR                  ; 572C   0004 011C 01F8

        ADDI    #$0020, R0                      ; 572F   02F8 0020
        SUB     G_016B, R0                      ; 5731   0300 016B
        CMPI    #$0100, R0                      ; 5733   0378 0100
        BLT     L_5739                          ; 5735   0205 0002

        MVII    #$00FF, R0                      ; 5737   02B8 00FF
L_5739:
        PULR    R1                              ; 5739   02B1
        CLRR    R2                              ; 573A   01D2
        MVO     R2,     G_0179                  ; 573B   0242 0179
        MOVR    R0,     R2                      ; 573D   0082
        ANDI    #$0080, R2                      ; 573E   03BA 0080
        BEQ     L_5747                          ; 5740   0204 0005

        MVII    #$0001, R2                      ; 5742   02BA 0001
        MVO     R2,     G_0179                  ; 5744   0242 0179
        SLR     R0,     1                       ; 5746   0060
L_5747:
        MVI     G_015D, R2                      ; 5747   0282 015D
        SWAP    R2,     1                       ; 5749   0042
        TSTR    R2                              ; 574A   0092
        BPL     L_574E                          ; 574B   0203 0001

        NEGR    R0                              ; 574D   0020
L_574E:
        MVO     R0,     G_015D                  ; 574E   0240 015D
        MVII    #$031D, R1                      ; 5750   02B9 031D

        JSR     R5,     L_55AD                  ; 5752   0004 0154 01AD
        JSR     R5,     L_5F4C                  ; 5755   0004 015C 034C

        MVII    #$0200, R4                      ; 5758   02BC 0200
        CLRR    R0                              ; 575A   01C0
L_575B:
        CMPI    #$02F0, R4                      ; 575B   037C 02F0
        BEQ     L_5766                          ; 575D   0204 0007

        MVI@    R4,     R1                      ; 575F   02A1
        TSTR    R1                              ; 5760   0089
        BEQ     L_575B                          ; 5761   0224 0007

        INCR    R0                              ; 5763   0008
        B       L_575B                          ; 5764   0220 000A

L_5766:
        SLR     R0,     1                       ; 5766   0060
        MVO     R0,     G_016B                  ; 5767   0240 016B
        BNEQ    L_579D                          ; 5769   020C 0032

        MVO     R0,     G_015D                  ; 576B   0240 015D
        MVI     G_017B, R0                      ; 576D   0280 017B
        CMPI    #$00C6, R0                      ; 576F   0378 00C6
        BEQ     L_5774                          ; 5771   0204 0001
        PULR    R7                              ; 5773   02B7

L_5774:
        JSR     R5,     .EXEC.A61               ; 5774   0004 0118 0261
        DECLE   $0005                           ; 5777   0005

        MVII    #$022B, R4                      ; 5778   02BC 022B

        JSR     R5,     L_53EE                  ; 577A   0004 0150 03EE

        MVII    #$0259, R4                      ; 577D   02BC 0259
        MVI     G_0167, R0                      ; 577F   0280 0167
        SLR     R0,     1                       ; 5781   0060
        INCR    R0                              ; 5782   0008
        SUBR    R0,     R4                      ; 5783   0104
        MVI     G_0167, R0                      ; 5784   0280 0167
        INCR    R0                              ; 5786   0008
        INCR    R0                              ; 5787   0008
        SDBD                                    ; 5788   0001
        MVII    #$0841, R1                      ; 5789   02B9 0041 0008

        JSR     R5,     X_FILL_MEM              ; 578C   0004 0114 0341

        MVI     G_017B, R0                      ; 578F   0280 017B
        CMPI    #$00C6, R0                      ; 5791   0378 00C6
        BEQ     L_5796                          ; 5793   0204 0001
        PULR    R7                              ; 5795   02B7

L_5796:
        JSR     R5,     .EXEC.A61               ; 5796   0004 0118 0261

        COMR    R1                              ; 5799   0019

        JSR     R5,     L_519C                  ; 579A   0004 0150 019C

L_579D:
        PULR    R7                              ; 579D   02B7

        PSHR    R5                              ; 579E   0275
        MVI@    R1,     R0                      ; 579F   0288
        SDBD                                    ; 57A0   0001
        ANDI    #$77EF, R0                      ; 57A1   03B8 00EF 0077
        SDBD                                    ; 57A4   0001
        XORI    #$8805, R0                      ; 57A5   03F8 0005 0088
        MVO@    R0,     R1                      ; 57A8   0248
        ADDI    #$0005, R1                      ; 57A9   02F9 0005
        MVII    #$0201, R0                      ; 57AB   02B8 0201
        MVO@    R0,     R1                      ; 57AD   0248
        INCR    R1                              ; 57AE   0009
        MVII    #$0006, R0                      ; 57AF   02B8 0006
        MVO@    R0,     R1                      ; 57B1   0248
        MVII    #$0001, R0                      ; 57B2   02B8 0001
        MVO     R0,     G_0182                  ; 57B4   0240 0182

        JSR     R5,     L_5F5D                  ; 57B6   0004 015C 035D

        MVI     G_016F, R0                      ; 57B9   0280 016F
        TSTR    R0                              ; 57BB   0080
        BNEQ    L_5845                          ; 57BC   020C 0087

        MVI     G_016E, R0                      ; 57BE   0280 016E
        SLL     R0,     2                       ; 57C0   004C
        SLL     R0,     2                       ; 57C1   004C
        SLL     R0,     1                       ; 57C2   0048

        JSR     R5,     X_RAND2                 ; 57C3   0004 0114 029E

        ADD     G_0354, R0                      ; 57C6   02C0 0354
        SDBD                                    ; 57C8   0001
        CMPI    #$2710, R0                      ; 57C9   0378 0010 0027
        BLT     L_57D7                          ; 57CC   0205 0009

        SDBD                                    ; 57CE   0001
        SUBI    #$2710, R0                      ; 57CF   0338 0010 0027
        MVI     G_032C, R1                      ; 57D2   0281 032C
        INCR    R1                              ; 57D4   0009
        MVO     R1,     G_032C                  ; 57D5   0241 032C
L_57D7:
        MVO     R0,     G_0354                  ; 57D7   0240 0354
        MVII    #$0186, R4                      ; 57D9   02BC 0186
        MVII    #$0183, R5                      ; 57DB   02BD 0183
        CLRR    R2                              ; 57DD   01D2
L_57DE:
        MVII    #$0008, R3                      ; 57DE   02BB 0008
        MVI@    R4,     R0                      ; 57E0   02A0
L_57E1:
        MVII    #$0001, R1                      ; 57E1   02B9 0001
        ANDR    R0,     R1                      ; 57E3   0181
        ADDR    R1,     R2                      ; 57E4   00CA
        SLR     R0,     1                       ; 57E5   0060
        DECR    R3                              ; 57E6   0013
        BNEQ    L_57E1                          ; 57E7   022C 0007

        CMPI    #$018E, R4                      ; 57E9   037C 018E
        BEQ     L_57F7                          ; 57EB   0204 000A

        CMPI    #$0196, R4                      ; 57ED   037C 0196
        BEQ     L_57F7                          ; 57EF   0204 0006

        CMPI    #$019E, R4                      ; 57F1   037C 019E
        BEQ     L_57F7                          ; 57F3   0204 0002
        B       L_57DE                          ; 57F5   0220 0018

L_57F7:
        MVO@    R2,     R5                      ; 57F7   026A
        CLRR    R2                              ; 57F8   01D2
        CMPI    #$019E, R4                      ; 57F9   037C 019E
        BNEQ    L_57DE                          ; 57FB   022C 001E

        MVII    #$0183, R5                      ; 57FD   02BD 0183
        MVI@    R5,     R0                      ; 57FF   02A8
        MVI@    R5,     R1                      ; 5800   02A9
        MVI@    R5,     R2                      ; 5801   02AA
        CMPR    R0,     R1                      ; 5802   0141
        BLT     L_580C                          ; 5803   0205 0007

        CMPR    R0,     R2                      ; 5805   0142
        BLT     L_5813                          ; 5806   0205 000B

        MVII    #$018D, R3                      ; 5808   02BB 018D
        B       L_5815                          ; 580A   0200 0009

L_580C:
        CMPR    R1,     R2                      ; 580C   014A
        BLT     L_5813                          ; 580D   0205 0004

        MVII    #$0195, R3                      ; 580F   02BB 0195
        B       L_5815                          ; 5811   0200 0002

L_5813:
        MVII    #$019D, R3                      ; 5813   02BB 019D
L_5815:
        SDBD                                    ; 5815   0001
        MVII    #$5DCD, R2                      ; 5816   02BA 00CD 005D
L_5819:
        MVI@    R2,     R0                      ; 5819   0290
        MVO@    R0,     R3                      ; 581A   0258
        MVII    #$017B, R4                      ; 581B   02BC 017B
        MVO@    R2,     R4                      ; 581D   0262
        SWAP    R2,     1                       ; 581E   0042
        MVO@    R2,     R4                      ; 581F   0262
        NOP                                     ; 5820   0034
        MVO@    R3,     R4                      ; 5821   0263
        SWAP    R3,     1                       ; 5822   0043
        MVO@    R3,     R4                      ; 5823   0263
        NOP                                     ; 5824   0034

        JSR     R5,     .EXEC.A61               ; 5825   0004 0118 0261

        EIS                                     ; 5828   0002
        MVII    #$017B, R4                      ; 5829   02BC 017B
        SDBD                                    ; 582B   0001
        MVI@    R4,     R2                      ; 582C   02A2
        SDBD                                    ; 582D   0001
        MVI@    R4,     R3                      ; 582E   02A3
        SDBD                                    ; 582F   0001
        CMPI    #$5DC6, R2                      ; 5830   037A 00C6 005D
        BEQ     L_5839                          ; 5833   0204 0004

        DECR    R3                              ; 5835   0013
        DECR    R2                              ; 5836   0012
        B       L_5819                          ; 5837   0220 001F

L_5839:
        JSR     R5,     .EXEC.A61               ; 5839   0004 0118 0261
        DECLE   $0001                           ; 583C   0001

        MVI     G_016B, R0                      ; 583D   0280 016B
        TSTR    R0                              ; 583F   0080
        BEQ     L_5774                          ; 5840   0224 00CD
        J       L_5226                          ; 5842   0004 0350 0226
L_5845:
        PULR    R7                              ; 5845   02B7

L_5846:
        PSHR    R5                              ; 5846   0275
        MVI     G_0176, R0                      ; 5847   0280 0176
        TSTR    R0                              ; 5849   0080
        BEQ     L_58A8                          ; 584A   0204 005C

        MVI     G_016D, R0                      ; 584C   0280 016D
        CMPI    #$000D, R0                      ; 584E   0378 000D
        BLT     L_58A8                          ; 5850   0205 0056

        MVII    #$0005, R0                      ; 5852   02B8 0005

        JSR     R5,     X_RAND2                 ; 5854   0004 0114 029E

        CMPI    #$0002, R0                      ; 5857   0378 0002
        BNEQ    L_585F                          ; 5859   020C 0004

        MVII    #$0327, R4                      ; 585B   02BC 0327
        B       L_5891                          ; 585D   0200 0032

L_585F:
        CMPI    #$0001, R0                      ; 585F   0378 0001
        BNEQ    L_5867                          ; 5861   020C 0004

        MVII    #$034F, R4                      ; 5863   02BC 034F
        B       L_5891                          ; 5865   0200 002A

L_5867:
        TSTR    R0                              ; 5867   0080
        BNEQ    L_586E                          ; 5868   020C 0004

        MVII    #$0357, R4                      ; 586A   02BC 0357
        B       L_5891                          ; 586C   0200 0023

L_586E:
        MOVR    R0,     R3                      ; 586E   0083
        MVII    #$0004, R0                      ; 586F   02B8 0004

        JSR     R5,     X_RAND1                 ; 5871   0004 0114 027D

        MOVR    R0,     R1                      ; 5874   0081
        CMPI    #$0003, R3                      ; 5875   037B 0003
        BEQ     L_5884                          ; 5877   0204 000B

        CMPI    #$0008, R0                      ; 5879   0378 0008
        BGE     L_5882                          ; 587B   020D 0005
        B       L_587F                          ; 587D   0200 0000

L_587F:
        CLRR    R1                              ; 587F   01C9
        B       L_5884                          ; 5880   0200 0002

L_5882:
        MVII    #$0008, R1                      ; 5882   02B9 0008
L_5884:
        MVII    #$0018, R0                      ; 5884   02B8 0018

        JSR     R5,     X_RAND2                 ; 5886   0004 0114 029E
        JSR     R5,     .EXEC.629               ; 5889   0004 0114 0229

        MVII    #$0341, R4                      ; 588C   02BC 0341
        MVO@    R0,     R4                      ; 588E   0260
        B       L_58A8                          ; 588F   0200 0017

L_5891:
        MVI@    R4,     R2                      ; 5891   02A2
        MVI@    R4,     R3                      ; 5892   02A3
        SWAP    R3,     1                       ; 5893   0043
        SDBD                                    ; 5894   0001
        ANDI    #$FF00, R2                      ; 5895   03BA 0000 00FF
        ANDI    #$00FF, R3                      ; 5898   03BB 00FF
        XORR    R3,     R2                      ; 589A   01DA
        MVII    #$0018, R0                      ; 589B   02B8 0018

        JSR     R5,     X_RAND2                 ; 589D   0004 0114 029E

        ADDI    #$000C, R0                      ; 58A0   02F8 000C
        MOVR    R0,     R3                      ; 58A2   0083
        MVII    #$033D, R1                      ; 58A3   02B9 033D

        JSR     R5,     .EXEC.9A3               ; 58A5   0004 0118 01A3

L_58A8:
        PULR    R7                              ; 58A8   02B7

L_58A9:
        PSHR    R5                              ; 58A9   0275
        MVI     G_0174, R0                      ; 58AA   0280 0174
        TSTR    R0                              ; 58AC   0080
        BEQ     L_58C2                          ; 58AD   0204 0013

        MVII    #$0347, R4                      ; 58AF   02BC 0347
        MVI@    R4,     R2                      ; 58B1   02A2
        MVI@    R4,     R3                      ; 58B2   02A3
        SWAP    R3,     1                       ; 58B3   0043
        SDBD                                    ; 58B4   0001
        ANDI    #$FF00, R2                      ; 58B5   03BA 0000 00FF
        ANDI    #$00FF, R3                      ; 58B8   03BB 00FF
        XORR    R3,     R2                      ; 58BA   01DA
        MVII    #$000A, R3                      ; 58BB   02BB 000A
        MVII    #$032D, R1                      ; 58BD   02B9 032D

        JSR     R5,     .EXEC.9A3               ; 58BF   0004 0118 01A3

L_58C2:
        MVI     G_0175, R0                      ; 58C2   0280 0175
        TSTR    R0                              ; 58C4   0080
        BEQ     L_58DA                          ; 58C5   0204 0013

        MVII    #$0347, R4                      ; 58C7   02BC 0347
        MVI@    R4,     R2                      ; 58C9   02A2
        MVI@    R4,     R3                      ; 58CA   02A3
        SWAP    R3,     1                       ; 58CB   0043
        SDBD                                    ; 58CC   0001
        ANDI    #$FF00, R2                      ; 58CD   03BA 0000 00FF
        ANDI    #$00FF, R3                      ; 58D0   03BB 00FF
        XORR    R3,     R2                      ; 58D2   01DA
        MVII    #$0028, R3                      ; 58D3   02BB 0028
        MVII    #$0335, R1                      ; 58D5   02B9 0335

        JSR     R5,     .EXEC.9A3               ; 58D7   0004 0118 01A3

L_58DA:
        PULR    R7                              ; 58DA   02B7

L_58DB:
        MVI     G_0177, R0                      ; 58DB   0280 0177
        XORI    #$0001, R0                      ; 58DD   03F8 0001
        MVO     R0,     G_0177                  ; 58DF   0240 0177
        BNEQ    L_58A9                          ; 58E1   022C 0039

        MVII    #$0001, R0                      ; 58E3   02B8 0001
        MVO     R0,     G_019E                  ; 58E5   0240 019E
        MOVR    R5,     R7                      ; 58E7   00AF

L_58E8:
        CLRR    R0                              ; 58E8   01C0
        MVO     R0,     G_019E                  ; 58E9   0240 019E
        SDBD                                    ; 58EB   0001
        MVII    #$3808, R4                      ; 58EC   02BC 0008 0038
        SDBD                                    ; 58EF   0001
        MVII    #$3800, R5                      ; 58F0   02BD 0000 0038
        MVII    #$016C, R3                      ; 58F3   02BB 016C
        MVI@    R3,     R2                      ; 58F5   029A
        MOVR    R2,     R1                      ; 58F6   0091
        SLL     R2,     2                       ; 58F7   004E
        SLL     R2,     2                       ; 58F8   004E
        SLL     R2,     2                       ; 58F9   004E
        ADDR    R2,     R4                      ; 58FA   00D4
        DECR    R1                              ; 58FB   0011
        BNEQ    L_5900                          ; 58FC   020C 0002

        MVII    #$0004, R1                      ; 58FE   02B9 0004
L_5900:
        MVO@    R1,     R3                      ; 5900   0259
        MVII    #$0010, R3                      ; 5901   02BB 0010
L_5903:
        MVI@    R4,     R0                      ; 5903   02A0
        MVO@    R0,     R5                      ; 5904   0268
        MVI@    R4,     R0                      ; 5905   02A0
        MVO@    R0,     R5                      ; 5906   0268
        MVI@    R4,     R0                      ; 5907   02A0
        MVO@    R0,     R5                      ; 5908   0268
        MVI@    R4,     R0                      ; 5909   02A0
        MVO@    R0,     R5                      ; 590A   0268
        DECR    R3                              ; 590B   0013
        BNEQ    L_5903                          ; 590C   022C 000A

        MVII    #$0186, R4                      ; 590E   02BC 0186
        SDBD                                    ; 5910   0001
        MVII    #$39E0, R5                      ; 5911   02BD 00E0 0039
        MVII    #$0008, R3                      ; 5914   02BB 0008
L_5916:
        MVI@    R4,     R0                      ; 5916   02A0
        MVO@    R0,     R5                      ; 5917   0268
        DECR    R3                              ; 5918   0013
        BNEQ    L_5916                          ; 5919   022C 0004

        MVII    #$018E, R4                      ; 591B   02BC 018E
        SDBD                                    ; 591D   0001
        MVII    #$39F0, R5                      ; 591E   02BD 00F0 0039
        MVII    #$0008, R3                      ; 5921   02BB 0008
L_5923:
        MVI@    R4,     R0                      ; 5923   02A0
        MVO@    R0,     R5                      ; 5924   0268
        DECR    R3                              ; 5925   0013
        BNEQ    L_5923                          ; 5926   022C 0004

        MVII    #$0196, R4                      ; 5928   02BC 0196
        SDBD                                    ; 592A   0001
        MVII    #$3990, R5                      ; 592B   02BD 0090 0039
        MVII    #$0008, R3                      ; 592E   02BB 0008
L_5930:
        MVI@    R4,     R0                      ; 5930   02A0
        MVO@    R0,     R5                      ; 5931   0268
        DECR    R3                              ; 5932   0013
        BNEQ    L_5930                          ; 5933   022C 0004

        MVI     G_016E, R0                      ; 5935   0280 016E
        MVO     R0,     .STIC.BORD              ; 5937   0240 002C
        MVO     R0,     .STIC.VIDEN             ; 5939   0240 0020
        PULR    R5                              ; 593B   02B5
        J       X_PLAY_NOTE                     ; 593C   0004 0318 02BD

L_593F:
        JSR     R5,     L_5314                  ; 593F   0004 0150 0314

        B       L_5984                          ; 5942   0200 0040

L_5944:
        PSHR    R5                              ; 5944   0275
        MVII    #$011F, R4                      ; 5945   02BC 011F
L_5947:
        MVI@    R4,     R0                      ; 5947   02A0
        MOVR    R0,     R1                      ; 5948   0081
        MVII    #$0080, R2                      ; 5949   02BA 0080
        ANDR    R2,     R1                      ; 594B   0191
        BNEQ    L_5961                          ; 594C   020C 0013

        MOVR    R0,     R1                      ; 594E   0081
        SLR     R2,     1                       ; 594F   0062
        ANDR    R2,     R1                      ; 5950   0191
        BNEQ    L_5961                          ; 5951   020C 000E

        ANDI    #$000F, R0                      ; 5953   03B8 000F
        MOVR    R0,     R1                      ; 5955   0081
        MVII    #$0028, R0                      ; 5956   02B8 0028

        JSR     R5,     .EXEC.629               ; 5958   0004 0114 0229

        SDBD                                    ; 595B   0001
        ANDI    #$FF00, R0                      ; 595C   03B8 0000 00FF
        MVO     R0,     G_0349                  ; 595F   0240 0349
L_5961:
        CMPI    #$0121, R4                      ; 5961   037C 0121
        BNEQ    L_5947                          ; 5963   022C 001D

        JSR     R5,     .EXEC.4F1               ; 5965   0004 0114 00F1

        MVI     G_0170, R1                      ; 5968   0281 0170
        TSTR    R1                              ; 596A   0089
        BEQ     L_597A                          ; 596B   0204 000D

        DECR    R1                              ; 596D   0011
        BNEQ    L_5978                          ; 596E   020C 0008

        MVI     G_033D, R0                      ; 5970   0280 033D
        SDBD                                    ; 5972   0001
        ANDI    #$7FEF, R0                      ; 5973   03B8 00EF 007F
        MVO     R0,     G_033D                  ; 5976   0240 033D
L_5978:
        MVO     R1,     G_0170                  ; 5978   0241 0170
L_597A:
        MVI     G_0181, R0                      ; 597A   0280 0181
        TSTR    R0                              ; 597C   0080
        BMI     L_5984                          ; 597D   020B 0005

        DECR    R0                              ; 597F   0010
        MVO     R0,     G_0181                  ; 5980   0240 0181
        BEQ     L_593F                          ; 5982   0224 0044

L_5984:
        MVII    #$0168, R3                      ; 5984   02BB 0168
L_5986:
        MVI@    R3,     R1                      ; 5986   0299
        TSTR    R1                              ; 5987   0089
        BEQ     L_5A9A                          ; 5988   0204 0110

        DECR    R1                              ; 598A   0011
        MVO@    R1,     R3                      ; 598B   0259
        BGT     L_5A9A                          ; 598C   020E 010C

        CLRR    R1                              ; 598E   01C9
        MVO@    R1,     R3                      ; 598F   0259
        MOVR    R3,     R0                      ; 5990   0098
        SUBI    #$0166, R0                      ; 5991   0338 0166

        JSR     R5,     .EXEC.76C               ; 5993   0004 0114 036C

        MOVR    R1,     R2                      ; 5996   008A
        MVI     G_016D, R4                      ; 5997   0284 016D
        SDBD                                    ; 5999   0001
        MVII    #$5AB9, R1                      ; 599A   02B9 00B9 005A
        CMPI    #$0004, R0                      ; 599D   0378 0004
        BNEQ    L_59D5                          ; 599F   020C 0034

        DECR    R0                              ; 59A1   0010

        JSR     R5,     X_RAND1                 ; 59A2   0004 0114 027D

        CMPI    #$000D, R4                      ; 59A5   037C 000D
        BLT     L_59AA                          ; 59A7   0205 0001

        SLR     R0,     2                       ; 59A9   0064
L_59AA:
        TSTR    R0                              ; 59AA   0080
        BNEQ    L_59B7                          ; 59AB   020C 000A

        SDBD                                    ; 59AD   0001
        MVII    #$5B23, R1                      ; 59AE   02B9 0023 005B
        MVII    #$0001, R0                      ; 59B1   02B8 0001
        MVO     R0,     G_0176                  ; 59B3   0240 0176
        B       L_5A0F                          ; 59B5   0200 0058

L_59B7:
        MVI     G_015D, R5                      ; 59B7   0285 015D
        TSTR    R5                              ; 59B9   00AD
        BNEQ    L_59C0                          ; 59BA   020C 0004

        MVII    #$0001, R5                      ; 59BC   02BD 0001
        MVO@    R5,     R3                      ; 59BE   025D
        PULR    R7                              ; 59BF   02B7

L_59C0:
        CMPI    #$0003, R4                      ; 59C0   037C 0003
        BLT     L_5A0F                          ; 59C2   0205 004B

        MVII    #$0001, R0                      ; 59C4   02B8 0001

        JSR     R5,     X_RAND1                 ; 59C6   0004 0114 027D

        BNEQ    L_5A0F                          ; 59C9   020C 0044

        SDBD                                    ; 59CB   0001
        MVII    #$5B08, R1                      ; 59CC   02B9 0008 005B
        MVII    #$0001, R0                      ; 59CF   02B8 0001
        MVO     R0,     G_0178                  ; 59D1   0240 0178
        B       L_5A0F                          ; 59D3   0200 003A

L_59D5:
        MVI     G_015D, R5                      ; 59D5   0285 015D
        TSTR    R5                              ; 59D7   00AD
        BNEQ    L_59DE                          ; 59D8   020C 0004

        MVII    #$0001, R5                      ; 59DA   02BD 0001
        MVO@    R5,     R3                      ; 59DC   025D
        PULR    R7                              ; 59DD   02B7

L_59DE:
        CMPI    #$0002, R0                      ; 59DE   0378 0002
        BNEQ    L_59F7                          ; 59E0   020C 0015

        CMPI    #$0007, R4                      ; 59E2   037C 0007
        BLT     L_59F7                          ; 59E4   0205 0011

        DECR    R0                              ; 59E6   0010

        JSR     R5,     X_RAND1                 ; 59E7   0004 0114 027D

        TSTR    R0                              ; 59EA   0080
        BNEQ    L_5A0F                          ; 59EB   020C 0022

        MVII    #$0001, R1                      ; 59ED   02B9 0001
        MVO     R1,     G_0174                  ; 59EF   0241 0174
        SDBD                                    ; 59F1   0001
        MVII    #$5AD2, R1                      ; 59F2   02B9 00D2 005A
        B       L_5A0F                          ; 59F5   0200 0018

L_59F7:
        CMPI    #$0003, R0                      ; 59F7   0378 0003
        BNEQ    L_5A0F                          ; 59F9   020C 0014

        CMPI    #$000B, R4                      ; 59FB   037C 000B
        BLT     L_5A0F                          ; 59FD   0205 0010

        MVII    #$0001, R0                      ; 59FF   02B8 0001

        JSR     R5,     X_RAND1                 ; 5A01   0004 0114 027D

        TSTR    R0                              ; 5A04   0080
        BNEQ    L_5A0F                          ; 5A05   020C 0008

        MVII    #$0001, R1                      ; 5A07   02B9 0001
        MVO     R1,     G_0175                  ; 5A09   0241 0175
        SDBD                                    ; 5A0B   0001
        MVII    #$5AE2, R1                      ; 5A0C   02B9 00E2 005A

L_5A0F:
        JSR     R5,     X_INIT_MOB              ; 5A0F   0004 0114 02B2

        SDBD                                    ; 5A12   0001
        CMPI    #$5B23, R1                      ; 5A13   0379 0023 005B
        BEQ     L_5A4A                          ; 5A16   0204 0032

        CMPI    #$0004, R0                      ; 5A18   0378 0004
        BEQ     L_5A26                          ; 5A1A   0204 000A

        MVII    #$008A, R0                      ; 5A1C   02B8 008A

        JSR     R5,     X_RAND2                 ; 5A1E   0004 0114 029E

        ADDI    #$0010, R0                      ; 5A21   02F8 0010
        SWAP    R0,     1                       ; 5A23   0040
        B       L_5A28                          ; 5A24   0200 0002

L_5A26:
        MVI     G_0347, R0                      ; 5A26   0280 0347
L_5A28:
        ADDI    #$0002, R2                      ; 5A28   02FA 0002
        MVO@    R0,     R2                      ; 5A2A   0250
        SWAP    R0,     1                       ; 5A2B   0040
        SUBI    #$0006, R0                      ; 5A2C   0338 0006
        ANDI    #$00F8, R0                      ; 5A2E   03B8 00F8
        SLR     R0,     2                       ; 5A30   0064
        SLR     R0,     1                       ; 5A31   0060
        ADDI    #$02A0, R0                      ; 5A32   02F8 02A0
        MOVR    R0,     R1                      ; 5A34   0081
        MVII    #$0048, R0                      ; 5A35   02B8 0048
L_5A37:
        MVI@    R1,     R5                      ; 5A37   028D
        TSTR    R5                              ; 5A38   00AD
        BNEQ    L_5A5F                          ; 5A39   020C 0024

        SUBI    #$0014, R1                      ; 5A3B   0339 0014
        SUBI    #$0008, R0                      ; 5A3D   0338 0008
        CMPI    #$0200, R1                      ; 5A3F   0379 0200
        BC      L_5A37                          ; 5A41   0221 000B

        MOVR    R2,     R1                      ; 5A43   0091
        SUBI    #$0002, R1                      ; 5A44   0339 0002
        MOVR    R3,     R4                      ; 5A46   009C
        J       L_5334                          ; 5A47   0004 0350 0334

L_5A4A:
        MVII    #$0001, R0                      ; 5A4A   02B8 0001

        JSR     R5,     X_RAND1                 ; 5A4C   0004 0114 027D

        BEQ     L_5A9A                          ; 5A4F   0204 0049

        MVII    #$033F, R4                      ; 5A51   02BC 033F
        SDBD                                    ; 5A53   0001
        MVII    #$A800, R0                      ; 5A54   02B8 0000 00A8
        MVO@    R0,     R4                      ; 5A57   0260
        INCR    R4                              ; 5A58   000C
        MVI@    R4,     R0                      ; 5A59   02A0
        DECR    R4                              ; 5A5A   0014
        NEGR    R0                              ; 5A5B   0020
        MVO@    R0,     R4                      ; 5A5C   0260
        B       L_5A9A                          ; 5A5D   0200 003B

L_5A5F:
        SWAP    R0,     1                       ; 5A5F   0040
        INCR    R2                              ; 5A60   000A
        MVO@    R0,     R2                      ; 5A61   0250
        MVI@    R1,     R0                      ; 5A62   0288
        ANDI    #$0008, R0                      ; 5A63   03B8 0008
        BEQ     L_5A68                          ; 5A65   0204 0001

        DECR    R1                              ; 5A67   0011
L_5A68:
        MVI@    R1,     R0                      ; 5A68   0288
        SDBD                                    ; 5A69   0001
        CMPI    #$0800, R0                      ; 5A6A   0378 0000 0008
        BNEQ    L_5A75                          ; 5A6D   020C 0006

        SDBD                                    ; 5A6F   0001
        XORI    #$1002, R0                      ; 5A70   03F8 0002 0010
        B       L_5A93                          ; 5A73   0200 001E

L_5A75:
        SDBD                                    ; 5A75   0001
        CMPI    #$0830, R0                      ; 5A76   0378 0030 0008
        BNEQ    L_5A81                          ; 5A79   020C 0006

        SDBD                                    ; 5A7B   0001
        XORI    #$1005, R0                      ; 5A7C   03F8 0005 0010
        B       L_5A93                          ; 5A7F   0200 0012

L_5A81:
        SDBD                                    ; 5A81   0001
        CMPI    #$0810, R0                      ; 5A82   0378 0010 0008
        BNEQ    L_5A8B                          ; 5A85   020C 0004

        XORI    #$0005, R0                      ; 5A87   03F8 0005
        B       L_5A93                          ; 5A89   0200 0008

L_5A8B:
        SDBD                                    ; 5A8B   0001
        CMPI    #$0820, R0                      ; 5A8C   0378 0020 0008
        BNEQ    L_5A9A                          ; 5A8F   020C 0009

        XORI    #$0006, R0                      ; 5A91   03F8 0006
L_5A93:
        MOVR    R1,     R4                      ; 5A93   008C
        MOVR    R0,     R1                      ; 5A94   0081
        MVII    #$0001, R0                      ; 5A95   02B8 0001

        JSR     R5,     L_523D                  ; 5A97   0004 0150 023D

L_5A9A:
        INCR    R3                              ; 5A9A   000B
        CMPI    #$016B, R3                      ; 5A9B   037B 016B
        BNC     L_5986                          ; 5A9D   0229 0118
        PULR    R7                              ; 5A9F   02B7

        DECLE   $0054,  $0018,  $00B0,  $005A   ; 5AA0   0054 0018 00B0 005A
        DECLE   $0000,  $0000,  $0000,  $006A   ; 5AA4   0000 0000 0000 006A
        DECLE   $0081,  $0000,  $00FA,  $0001   ; 5AA8   0081 0000 00FA 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AAC   0000 0000 0000 0000

        AND@    R3,     R5                      ; 5AB0   039D
        RLC     R1,     2                       ; 5AB1   0055
        MOVR    R5,     R6                      ; 5AB2   00AE
L_5AB3:
        DECR    R7                              ; 5AB3   0017

        DECLE   $0002,  $0006,  $0001,  $00E6   ; 5AB4   0002 0006 0001 00E6
        DECLE   $0056,  $0047,  $0018,  $00C9   ; 5AB8   0056 0047 0018 00C9
        DECLE   $005A,  $0000,  $0000,  $0000   ; 5ABC   005A 0000 0000 0000
        DECLE   $0000,  $0020,  $0000,  $0000   ; 5AC0   0000 0020 0000 0000
        DECLE   $0002,  $0000,  $0000,  $0000   ; 5AC4   0002 0000 0000 0000
        DECLE   $0000,  $03E3,  $0055,  $0030   ; 5AC8   0000 03E3 0055 0030
        DECLE   $0053,  $0003,  $0010,  $0002   ; 5ACC   0053 0003 0010 0002
        DECLE   $01E3,  $0155,  $0054,  $0018   ; 5AD0   01E3 0155 0054 0018
        DECLE   $00F2,  $005A,  $0000,  $0000   ; 5AD4   00F2 005A 0000 0000
        DECLE   $0000,  $0000,  $000A,  $0000   ; 5AD8   0000 0000 000A 0000
        DECLE   $00F0,  $0003,  $0000,  $0000   ; 5ADC   00F0 0003 0000 0000
        DECLE   $0000,  $0000,  $0056,  $0018   ; 5AE0   0000 0000 0056 0018
        DECLE   $00FD,  $005A,  $0000,  $0000   ; 5AE4   00FD 005A 0000 0000
        DECLE   $0000,  $0000,  $0028,  $0000   ; 5AE8   0000 0000 0028 0000
        DECLE   $00F0,  $0003,  $0000,  $0000   ; 5AEC   00F0 0003 0000 0000
        DECLE   $0000,  $0000,  $03E3,  $0055   ; 5AF0   0000 0000 03E3 0055
        DECLE   $0030,  $0053,  $0002,  $0047   ; 5AF4   0030 0053 0002 0047
        DECLE   $0004,  $00D3,  $0055,  $01E3   ; 5AF8   0004 00D3 0055 01E3
        DECLE   $0155,  $03E3,  $0055,  $0030   ; 5AFC   0155 03E3 0055 0030
        DECLE   $0053,  $0002,  $003D,  $0004   ; 5B00   0053 0002 003D 0004
        DECLE   $00D3,  $0055,  $01E3,  $0155   ; 5B04   00D3 0055 01E3 0155
        DECLE   $0052,  $0018,  $0018,  $005B   ; 5B08   0052 0018 0018 005B
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B0C   0000 0000 0000 0000
        DECLE   $001E,  $0000,  $00F0,  $0003   ; 5B10   001E 0000 00F0 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B14   0000 0000 0000 0000
        DECLE   $03E3,  $0055,  $0030,  $0053   ; 5B18   03E3 0055 0030 0053
        DECLE   $0002,  $0051,  $0004,  $00D3   ; 5B1C   0002 0051 0004 00D3
        DECLE   $0055,  $01E3,  $0155,  $0042   ; 5B20   0055 01E3 0155 0042
        DECLE   $0038,  $0033,  $005B,  $0000   ; 5B24   0038 0033 005B 0000
        DECLE   $0000,  $0000,  $0008,  $0000   ; 5B28   0000 0000 0008 0000
        DECLE   $0038,  $0000,  $0000,  $0000   ; 5B2C   0038 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0259   ; 5B30   0000 0000 0000 0259
        DECLE   $0053,  $0059,  $0053,  $0001   ; 5B34   0053 0059 0053 0001
        DECLE   $0033,  $0009,  $00A6,  $0054   ; 5B38   0033 0009 00A6 0054
        DECLE   $009E,  $0057,  $004A,  $0155   ; 5B3C   009E 0057 004A 0155
        DECLE   $034A,  $0055,  $034A,  $0155   ; 5B40   034A 0055 034A 0155
        DECLE   $0041,  $0018,  $0084,  $005B   ; 5B44   0041 0018 0084 005B
        DECLE   $0000,  $0050,  $0000,  $0060   ; 5B48   0000 0050 0000 0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B4C   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 5B50   0001 0000 0000 0000
        DECLE   $0083,  $00B8,  $0093,  $005B   ; 5B54   0083 00B8 0093 005B
        DECLE   $0000,  $0024,  $0000,  $0058   ; 5B58   0000 0024 0000 0058
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B60   0000 0000 0000 0000
        DECLE   $0083,  $00B8,  $0093,  $005B   ; 5B64   0083 00B8 0093 005B
        DECLE   $0000,  $007C,  $0000,  $0058   ; 5B68   0000 007C 0000 0058
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B70   0000 0000 0000 0000
        DECLE   $0083,  $00B8,  $0093,  $005B   ; 5B74   0083 00B8 0093 005B
        DECLE   $0000,  $0050,  $0000,  $0058   ; 5B78   0000 0050 0000 0058
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B7C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B80   0000 0000 0000 0000
        DECLE   $0100,  $0000,  $00BF,  $0056   ; 5B84   0100 0000 00BF 0056
        DECLE   $0004,  $0000,  $0007,  $002C   ; 5B88   0004 0000 0007 002C
        DECLE   $0056,  $022C,  $0056,  $022C   ; 5B8C   0056 022C 0056 022C
        DECLE   $0156,  $012C,  $0056,  $0000   ; 5B90   0156 012C 0056 0000
        DECLE   $0000,  $0041,  $0056,  $0001   ; 5B94   0000 0041 0056 0001
        DECLE   $0041,  $0009,  $0060,  $0055   ; 5B98   0041 0009 0060 0055
        DECLE   $00B2,  $0054,  $02B2,  $0054   ; 5B9C   00B2 0054 02B2 0054
        DECLE   $02B2,  $0154,  $01B2,  $0054   ; 5BA0   02B2 0154 01B2 0054
.GRAM_INIT_5BA4:
        DECLE   $0029           ; 5BA4  # of GRAM cards to init
        DECLE   $0000           ; 5BA5  #00   :  CART #00    ----
        DECLE   $0200           ; 5BA6  #01   :  CART #00    X---
        DECLE   $0003,  $0300   ; 5BA7  #02-08:  CART #01-07 ----
        DECLE   $0001,  $03C0   ; 5BA9  #09-10:  GRAM #00-07 ----
        DECLE   $0010           ; 5BAB  #11   :  CART #08    ----
        DECLE   $0210           ; 5BAC  #12   :  CART #08    X---
        DECLE   $0012           ; 5BAD  #13   :  CART #09    ----
        DECLE   $0212           ; 5BAE  #14   :  CART #09    X---
        DECLE   $0006           ; 5BAF  #15   :  CART #03    ----
        DECLE   $0206           ; 5BB0  #16   :  CART #03    X---
        DECLE   $0015,  $0100   ; 5BB1  #17-19:  CART #0A-0C ----
        DECLE   $0218           ; 5BB3  #1A   :  CART #0C    X---
        DECLE   $0204           ; 5BB4  #1B   :  CART #02    X---
        DECLE   $0202           ; 5BB5  #1C   :  CART #01    X---
        DECLE   $0208           ; 5BB6  #1D   :  CART #04    X---
        DECLE   $0206           ; 5BB7  #1E   :  CART #03    X---
        DECLE   $020C           ; 5BB8  #1F   :  CART #06    X---
        DECLE   $020A           ; 5BB9  #20   :  CART #05    X---
        DECLE   $0023,  $02C0   ; 5BBA  #21-26:  GRAM #11-16 ----
        DECLE   $0216           ; 5BBC  #27   :  CART #0B    X---
        DECLE   $0214           ; 5BBD  #28   :  CART #0A    X---

        DECLE   $0010,  $0010,  $0010,  $0010   ; 5BBE   0010 0010 0010 0010
        DECLE   $0010,  $0092,  $007C,  $0010   ; 5BC2   0010 0092 007C 0010
        DECLE   $0028,  $0028,  $006C,  $007C   ; 5BC6   0028 0028 006C 007C
        DECLE   $007C,  $00FE,  $00FE,  $0044   ; 5BCA   007C 00FE 00FE 0044
        DECLE   $0000,  $0008,  $0000,  $0040   ; 5BCE   0000 0008 0000 0040
        DECLE   $0000,  $0002,  $007C,  $0010   ; 5BD2   0000 0002 007C 0010
        DECLE   $0028,  $0028,  $006C,  $007C   ; 5BD6   0028 0028 006C 007C
        DECLE   $007C,  $00FE,  $00FE,  $0044   ; 5BDA   007C 00FE 00FE 0044
        DECLE   $0002,  $0080,  $0010,  $0001   ; 5BDE   0002 0080 0010 0001
        DECLE   $0004,  $0040,  $0000,  $0000   ; 5BE2   0004 0040 0000 0000
        DECLE   $0040,  $0008,  $001C,  $003C   ; 5BE6   0040 0008 001C 003C
        DECLE   $003C,  $00FE,  $00FE,  $0044   ; 5BEA   003C 00FE 00FE 0044
        DECLE   $0000,  $0000,  $0010,  $0000   ; 5BEE   0000 0000 0010 0000
        DECLE   $0024,  $0080,  $0002,  $0008   ; 5BF2   0024 0080 0002 0008
        DECLE   $0040,  $0000,  $0005,  $0080   ; 5BF6   0040 0000 0005 0080
        DECLE   $0000,  $0004,  $0018,  $0044   ; 5BFA   0000 0004 0018 0044
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BFE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C02   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C06   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C0A   0000 0000 0000 0000
        DECLE   $0000,  $004A,  $0030,  $0046   ; 5C0E   0000 004A 0030 0046
        DECLE   $0004,  $0091,  $0024,  $0009   ; 5C12   0004 0091 0024 0009
        DECLE   $0040,  $0012,  $0004,  $0021   ; 5C16   0040 0012 0004 0021
        DECLE   $0088,  $0040,  $0082,  $0010   ; 5C1A   0088 0040 0082 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C1E   0000 0000 0000 0000
        DECLE   $0000,  $0021,  $0000,  $0000   ; 5C22   0000 0021 0000 0000

        SWAP    R2,     1                       ; 5C26   0042
        INCR    R0                              ; 5C27   0008
        NEGR    R0                              ; 5C28   0020
        MOVR    R0,     R1                      ; 5C29   0081

        JSRD    R4,     .EXEC.020               ; 5C2A   0004 0012 0020
        DECLE   $0004,  $0000,  $0000,  $0000   ; 5C2D   0004 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C39   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0008,  $0008   ; 5C3D   0000 0010 0008 0008
        DECLE   $0010,  $0020,  $0020,  $0010   ; 5C41   0010 0020 0020 0010
        DECLE   $0008,  $0008,  $0010,  $0020   ; 5C45   0008 0008 0010 0020
        DECLE   $0020,  $0000,  $0000,  $0000   ; 5C49   0020 0000 0000 0000
        DECLE   $0000,  $0020,  $0020,  $0010   ; 5C4D   0000 0020 0020 0010
        DECLE   $0008,  $0008,  $0010,  $0020   ; 5C51   0008 0008 0010 0020
        DECLE   $0020,  $0010,  $0008,  $0008   ; 5C55   0020 0010 0008 0008
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5C59   0010 0000 0000 0000
        DECLE   $0000,  $0008,  $0010,  $0020   ; 5C5D   0000 0008 0010 0020
        DECLE   $0020,  $0010,  $0008,  $0008   ; 5C61   0020 0010 0008 0008
        DECLE   $0010,  $0020,  $0020,  $0010   ; 5C65   0010 0020 0020 0010
        DECLE   $0008,  $0000,  $0000,  $0000   ; 5C69   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; 5C71   0000 0000 0000 0008
        DECLE   $0040,  $0004,  $0020,  $0080   ; 5C75   0040 0004 0020 0080
        DECLE   $0012,  $0051,  $000C,  $0090   ; 5C79   0012 0051 000C 0090
        DECLE   $001A,  $0000,  $0000,  $0000   ; 5C7D   001A 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C89   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0010,  $0010   ; 5C8D   0000 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5C91   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5C95   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5C99   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5C9D   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5CA1   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5CA5   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0000   ; 5CA9   0010 0010 0010 0000
        DECLE   $0000,  $0010,  $0010,  $0010   ; 5CAD   0000 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5CB1   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5CB5   0010 0010 0010 0010
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5CB9   0010 0000 0000 0000
        DECLE   $0000,  $0010,  $0010,  $0010   ; 5CBD   0000 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5CC1   0010 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0000   ; 5CC5   0010 0010 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CC9   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0010,  $0010   ; 5CCD   0000 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5CD1   0010 0010 0010 0010
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5CD5   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CD9   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0010,  $0010   ; 5CDD   0000 0010 0010 0010
        DECLE   $0010,  $0010,  $0010,  $0000   ; 5CE1   0010 0010 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CE9   0000 0000 0000 0000
        DECLE   $0000                           ; 5CED   0000
.GFX_LIST_5CEE:
        DECLE   $0060,  $0032,  $001B,  $000D   ; 5CEE  CART PIC #00
        DECLE   $0007,  $000C,  $0008,  $0036   ; 5CF2  
        DECLE   $0019,  $0024,  $0007,  $001F   ; 5CF6  CART PIC #01
        DECLE   $0033,  $003F,  $0008,  $0014   ; 5CFA  
        DECLE   $0080,  $0040,  $00E0,  $00F8   ; 5CFE  CART PIC #02
        DECLE   $003C,  $00FC,  $0020,  $0050   ; 5D02  
        DECLE   $0001,  $0007,  $003F,  $000A   ; 5D06  CART PIC #03
        DECLE   $003F,  $0009,  $0014,  $003E   ; 5D0A  
        DECLE   $0080,  $00E0,  $00FC,  $0058   ; 5D0E  CART PIC #04
        DECLE   $00FC,  $00B8,  $007C,  $0000   ; 5D12  
        DECLE   $000F,  $0019,  $003F,  $000B   ; 5D16  CART PIC #05
        DECLE   $0032,  $0040,  $0040,  $0030   ; 5D1A  
        DECLE   $00F0,  $0098,  $00FC,  $00D0   ; 5D1E  CART PIC #06
        DECLE   $0048,  $0004,  $0078,  $0000   ; 5D22  
        DECLE   $0010,  $0010,  $0092,  $007C   ; 5D26  CART PIC #07
        DECLE   $0028,  $007C,  $007C,  $00FE   ; 5D2A  
        DECLE   $0002,  $0073,  $001D,  $0007   ; 5D2E  CART PIC #08
        DECLE   $000C,  $0008,  $001C,  $0014   ; 5D32  
        DECLE   $000C,  $0002,  $0007,  $001F   ; 5D36  CART PIC #09
        DECLE   $0039,  $003F,  $000C,  $0012   ; 5D3A  
        DECLE   $000F,  $0019,  $003F,  $000A   ; 5D3E  CART PIC #0A
        DECLE   $0010,  $0024,  $0018,  $0000   ; 5D42  
        DECLE   $00F0,  $0098,  $00FC,  $00D0   ; 5D46  CART PIC #0B
        DECLE   $0088,  $0004,  $0008,  $0030   ; 5D4A  
        DECLE   $0002,  $001B,  $003D,  $0067   ; 5D4E  CART PIC #0C
        DECLE   $000C,  $0008,  $0036,  $0000   ; 5D52  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D56   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 5D5A   0000 0000 0000 0018
        DECLE   $003C,  $0066,  $007E,  $00DB   ; 5D5E   003C 0066 007E 00DB
        DECLE   $00FF                           ; 5D62   00FF

        ADDR    R4,     R7                      ; 5D63   00E7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D68   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $003C,  $0066   ; 5D6C   0000 0018 003C 0066
        DECLE   $007E,  $00F1,  $0050,  $0000   ; 5D70   007E 00F1 0050 0000
        DECLE   $0001,  $0022,  $0000,  $0000   ; 5D74   0001 0022 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D78   0000 0000 0000 0000
        DECLE   $0018,  $003C,  $0068,  $0080   ; 5D7C   0018 003C 0068 0080
        DECLE   $0006,  $0040,  $0089,  $0040   ; 5D80   0006 0040 0089 0040
        DECLE   $0012,  $0022,  $0020,  $0001   ; 5D84   0012 0022 0020 0001
        DECLE   $0084,  $000E,  $0058,  $0002   ; 5D88   0084 000E 0058 0002
        DECLE   $0028,  $0081,  $001C,  $0042   ; 5D8C   0028 0081 001C 0042
        DECLE   $0088,  $0022,  $0010,  $0045   ; 5D90   0088 0022 0010 0045
        DECLE   $0011,  $0024,  $0000,  $0000   ; 5D94   0011 0024 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DA4   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $0043,  $0044   ; 5DA8   0000 0040 0043 0044
        DECLE   $0028,  $0038,  $001C,  $0014   ; 5DAC   0028 0038 001C 0014
        DECLE   $0022,  $00C2,  $0002,  $0000   ; 5DB0   0022 00C2 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DB4   0000 0000 0000 0000
        DECLE   $0008,  $0000,  $0010,  $0000   ; 5DB8   0008 0000 0010 0000
        DECLE   $0024,  $009A,  $0059,  $0024   ; 5DBC   0024 009A 0059 0024
        DECLE   $0000,  $0008,  $0000,  $0010   ; 5DC0   0000 0008 0000 0010
        DECLE   $0000,  $0000,  $003C,  $007E   ; 5DC4   0000 0000 003C 007E
        DECLE   $007E,  $00FF,  $00FF,  $00FF   ; 5DC8   007E 00FF 00FF 00FF
        DECLE   $00E7,  $00C3,  $0010,  $0010   ; 5DCC   00E7 00C3 0010 0010
        DECLE   $0092,  $007C,  $0028,  $007C   ; 5DD0   0092 007C 0028 007C
        DECLE   $007C,  $00FE,  $0000,  $0000   ; 5DD4   007C 00FE 0000 0000
        DECLE   $0008,  $0000,  $0010,  $0000   ; 5DD8   0008 0000 0010 0000
        DECLE   $0024,  $009A,  $0059,  $0024   ; 5DDC   0024 009A 0059 0024
        DECLE   $0000,  $0008,  $0000,  $0010   ; 5DE0   0000 0008 0000 0010
        DECLE   $0000,  $0000,  $0000,  $0018   ; 5DE4   0000 0000 0000 0018
        DECLE   $003C,  $007E,  $007E,  $00FF   ; 5DE8   003C 007E 007E 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5DEC   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $007E,  $007E,  $003C   ; 5DF0   00FF 007E 007E 003C
        DECLE   $0018,  $0000,  $0000,  $0000   ; 5DF4   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 5DF8   0000 0000 0000 0018
        DECLE   $0018,  $003C,  $003C,  $0018   ; 5DFC   0018 003C 003C 0018
        DECLE   $0018,  $0000,  $0000,  $0000   ; 5E00   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E08   0000 0000 0000 0000
        DECLE   $0024,  $0018,  $0018,  $0024   ; 5E0C   0024 0018 0018 0024
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E24   0000 0000 0000 0000
        DECLE   $0008,  $0000,  $0010,  $0000   ; 5E28   0008 0000 0010 0000
        DECLE   $0024,  $009A,  $0059,  $0024   ; 5E2C   0024 009A 0059 0024
        DECLE   $0000,  $0008,  $0000,  $0010   ; 5E30   0000 0008 0000 0010
        DECLE   $0000,  $0000,  $0000,  $0018   ; 5E34   0000 0000 0000 0018
        DECLE   $003C,  $007E,  $007E,  $00FF   ; 5E38   003C 007E 007E 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5E3C   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $007E,  $007E,  $003C   ; 5E40   00FF 007E 007E 003C
        DECLE   $0018,  $0000,  $0008,  $0008   ; 5E44   0018 0000 0008 0008
        DECLE   $0004,  $0004,  $0008,  $0008   ; 5E48   0004 0004 0008 0008
        DECLE   $0004,  $0004,  $0008,  $0008   ; 5E4C   0004 0004 0008 0008
        DECLE   $0004,  $0004,  $0008,  $0008   ; 5E50   0004 0004 0008 0008
        DECLE   $0004,  $0004,  $0008,  $0004   ; 5E54   0004 0004 0008 0004
        DECLE   $0004,  $0008,  $0008,  $0004   ; 5E58   0004 0008 0008 0004
        DECLE   $0004,  $0008,  $0008,  $0004   ; 5E5C   0004 0008 0008 0004
        DECLE   $0004,  $0008,  $0008,  $0004   ; 5E60   0004 0008 0008 0004
        DECLE   $0004,  $0008,  $0004,  $0004   ; 5E64   0004 0008 0004 0004
        DECLE   $0008,  $0008,  $0004,  $0004   ; 5E68   0008 0008 0004 0004
        DECLE   $0008,  $0008,  $0004,  $0004   ; 5E6C   0008 0008 0004 0004
        DECLE   $0008,  $0008,  $0004,  $0004   ; 5E70   0008 0008 0004 0004
        DECLE   $0008,  $0008,  $0000,  $0018   ; 5E74   0008 0008 0000 0018
        DECLE   $003C,  $007E,  $007E,  $00FF   ; 5E78   003C 007E 007E 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5E7C   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $007E,  $007E,  $003C   ; 5E80   00FF 007E 007E 003C
        DECLE   $0018,  $0000,  $0000,  $0000   ; 5E84   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E90   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5E94   0000 0000
L_5E96:
        PSHR    R5                              ; 5E96   0275
        MVII    #$015D, R4                      ; 5E97   02BC 015D
        MVI@    R4,     R0                      ; 5E99   02A0
        SWAP    R0,     1                       ; 5E9A   0040
        MVI     G_0179, R2                      ; 5E9B   0282 0179
        TSTR    R2                              ; 5E9D   0092
        BEQ     L_5EA4                          ; 5E9E   0204 0004

        SAR     R0,     2                       ; 5EA0   006C
        SAR     R0,     2                       ; 5EA1   006C
        B       L_5EA7                          ; 5EA2   0200 0003

L_5EA4:
        SAR     R0,     2                       ; 5EA4   006C
        SAR     R0,     2                       ; 5EA5   006C
        SAR     R0,     1                       ; 5EA6   0068
L_5EA7:
        MOVR    R4,     R3                      ; 5EA7   00A3
        SDBD                                    ; 5EA8   0001
        ADD@    R4,     R0                      ; 5EA9   02E0
        MVO@    R0,     R3                      ; 5EAA   0258
        SWAP    R0,     1                       ; 5EAB   0040
        MOVR    R0,     R2                      ; 5EAC   0082
        INCR    R3                              ; 5EAD   000B
        SUB@    R3,     R0                      ; 5EAE   0318
        MOVR    R2,     R1                      ; 5EAF   0091
        ANDI    #$0007, R1                      ; 5EB0   03B9 0007
        MVO@    R1,     R3                      ; 5EB2   0259
        XORR    R1,     R2                      ; 5EB3   01CA
        MVII    #$0163, R5                      ; 5EB4   02BD 0163
        MVO@    R2,     R5                      ; 5EB6   026A
        SUBR    R0,     R2                      ; 5EB7   0102
        INCR    R5                              ; 5EB8   000D
        MVO@    R2,     R5                      ; 5EB9   026A
        MVII    #$0003, R3                      ; 5EBA   02BB 0003
        MVO@    R3,     R5                      ; 5EBC   026B
        MVII    #$0100, R5                      ; 5EBD   02BD 0100
        MVI@    R5,     R0                      ; 5EBF   02A8
        MVO@    R0,     R4                      ; 5EC0   0260
        MVI@    R5,     R0                      ; 5EC1   02A8
        MVO@    R0,     R4                      ; 5EC2   0260
        MVII    #$00D7, R0                      ; 5EC3   02B8 00D7
        MVII    #$005E, R1                      ; 5EC5   02B9 005E
        MVO     R0,     .ISRVEC.0               ; 5EC7   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5EC9   0241 0101
L_5ECB:
        EIS                                     ; 5ECB   0002
        MVI     G_0166, R2                      ; 5ECC   0282 0166
        SARC    R2,     2                       ; 5ECE   007E
        BC      L_5ECB                          ; 5ECF   0221 0005
        BNOV    L_5ED6                          ; 5ED1   020A 0003

        JSR     R5,     L_5412                  ; 5ED3   0004 0154 0012

L_5ED6:
        PULR    R7                              ; 5ED6   02B7

        PSHR    R5                              ; 5ED7   0275
        MVII    #$031D, R2                      ; 5ED8   02BA 031D
        CLRR    R3                              ; 5EDA   01DB
L_5EDB:
        MVII    #$0164, R5                      ; 5EDB   02BD 0164
        MVI@    R2,     R0                      ; 5EDD   0290
        SLL     R0,     1                       ; 5EDE   0048
        BPL     L_5EE3                          ; 5EDF   0203 0002

        MVII    #$0162, R5                      ; 5EE1   02BD 0162
L_5EE3:
        ADDI    #$0002, R2                      ; 5EE3   02FA 0002
        MVI@    R2,     R0                      ; 5EE5   0290
        SDBD                                    ; 5EE6   0001
        ADD@    R5,     R0                      ; 5EE7   02E8
        MVO@    R0,     R2                      ; 5EE8   0250
        MVI@    R3,     R0                      ; 5EE9   0298
        MOVR    R0,     R1                      ; 5EEA   0081
        ANDI    #$00FF, R1                      ; 5EEB   03B9 00FF
        XORR    R1,     R0                      ; 5EED   01C8
        DECR    R5                              ; 5EEE   0015
        ADD@    R5,     R1                      ; 5EEF   02E9
        ANDI    #$00FF, R1                      ; 5EF0   03B9 00FF
        XORR    R1,     R0                      ; 5EF2   01C8
        MVO@    R0,     R3                      ; 5EF3   0258
        ADDI    #$0006, R2                      ; 5EF4   02FA 0006
        INCR    R3                              ; 5EF6   000B
        CMPI    #$0008, R3                      ; 5EF7   037B 0008
        BNEQ    L_5EDB                          ; 5EF9   022C 001F

        MVI     G_015F, R0                      ; 5EFB   0280 015F
        MVO     R0,     .STIC.HDLY              ; 5EFD   0240 0030
        MVO     R0,     .STIC.VIDEN             ; 5EFF   0240 0020
        MVI     G_0160, R0                      ; 5F01   0280 0160
        MVI     G_0161, R1                      ; 5F03   0281 0161
        MVO     R0,     .ISRVEC.0               ; 5F05   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5F07   0241 0101
        CLRR    R2                              ; 5F09   01D2
        MVI     G_0163, R0                      ; 5F0A   0280 0163
        SWAP    R0,     2                       ; 5F0C   0044
        BEQ     L_5F44                          ; 5F0D   0204 0035
        BPL     L_5F29                          ; 5F0F   0203 0018

        MVII    #$0200, R4                      ; 5F11   02BC 0200
        MOVR    R4,     R5                      ; 5F13   00A5
L_5F14:
        MVI@    R4,     R0                      ; 5F14   02A0
        SDBD                                    ; 5F15   0001
        ANDI    #$2000, R0                      ; 5F16   03B8 0000 0020
        XOR@    R4,     R0                      ; 5F19   03E0
        MVO@    R0,     R5                      ; 5F1A   0268
        MVII    #$0012, R3                      ; 5F1B   02BB 0012
L_5F1D:
        MVI@    R4,     R0                      ; 5F1D   02A0
        MVO@    R0,     R5                      ; 5F1E   0268
        DECR    R3                              ; 5F1F   0013
        BNEQ    L_5F1D                          ; 5F20   022C 0004

        INCR    R5                              ; 5F22   000D
        CMPI    #$02E6, R4                      ; 5F23   037C 02E6
        BLT     L_5F14                          ; 5F25   0225 0012
        B       L_5F42                          ; 5F27   0200 0019

L_5F29:
        MVII    #$0212, R5                      ; 5F29   02BD 0212
        MVII    #$0003, R1                      ; 5F2B   02B9 0003
L_5F2D:
        MVII    #$0012, R3                      ; 5F2D   02BB 0012
L_5F2F:
        MVI@    R5,     R0                      ; 5F2F   02A8
        MVO@    R0,     R5                      ; 5F30   0268
        SUBR    R1,     R5                      ; 5F31   010D
        DECR    R3                              ; 5F32   0013
        BNEQ    L_5F2F                          ; 5F33   022C 0005

        MVI@    R5,     R0                      ; 5F35   02A8
        SDBD                                    ; 5F36   0001
        ANDI    #$5FFF, R0                      ; 5F37   03B8 00FF 005F
        MVO@    R0,     R5                      ; 5F3A   0268
        ADDI    #$0024, R5                      ; 5F3B   02FD 0024
        CMPI    #$02F0, R5                      ; 5F3D   037D 02F0
        BLT     L_5F2D                          ; 5F3F   0225 0013

        INCR    R2                              ; 5F41   000A
L_5F42:
        MVII    #$0002, R0                      ; 5F42   02B8 0002
L_5F44:
        SLL     R2,     2                       ; 5F44   004E
        XORR    R0,     R2                      ; 5F45   01C2
        MVO     R2,     G_0166                  ; 5F46   0242 0166

        JSR     R5,     X_PLAY_NOTE             ; 5F48   0004 0118 02BD

        PULR    R7                              ; 5F4B   02B7

L_5F4C:
        PSHR    R5                              ; 5F4C   0275

        JSR     R5,     X_PLAY_SFX2             ; 5F4D   0004 0118 03BE
        DECLE   $0040                           ; 5F50  SFX prio
        DECLE   $0389                           ; 5F51  SFX data
        DECLE   $001C,  $0200                   ; 5F52  SFX data
        DECLE   $0040,  $0340                   ; 5F54  SFX data
        DECLE   $0048,  $0320                   ; 5F56  SFX data
        DECLE   $0044,  $0260                   ; 5F58  SFX data
        DECLE   $015B                           ; 5F5A  SFX data
        DECLE   $000B                           ; 5F5B  SFX data
        DECLE   $03CF                           ; 5F5C  SFX end

L_5F5D:
        PSHR    R5                              ; 5F5D   0275

        JSR     R5,     X_PLAY_SFX2             ; 5F5E   0004 0118 03BE
        DECLE   $00BC                           ; 5F61  SFX prio
        DECLE   $0079                           ; 5F62  SFX data
        DECLE   $00AC,  $0000                   ; 5F63  SFX data
        DECLE   $03B7                           ; 5F65  SFX data
        DECLE   $030D                           ; 5F66  SFX data
        DECLE   $000B                           ; 5F67  SFX data
        DECLE   $008F,  $001F                   ; 5F68  SFX data
        DECLE   $03CF                           ; 5F6A  SFX end

L_5F6B:
        PSHR    R5                              ; 5F6B   0275

        JSR     R5,     X_PLAY_SFX2             ; 5F6C   0004 0118 03BE
        DECLE   $000F                           ; 5F6F  SFX prio
        DECLE   $0389                           ; 5F70  SFX data
        DECLE   $002C,  $0000                   ; 5F71  SFX data
        DECLE   $0040,  $01A0                   ; 5F73  SFX data
        DECLE   $0048,  $0190                   ; 5F75  SFX data
        DECLE   $0044,  $0118                   ; 5F77  SFX data
        DECLE   $015B                           ; 5F79  SFX data
        DECLE   $0041,  $0383                   ; 5F7A  SFX data
        DECLE   $000B                           ; 5F7C  SFX data
        DECLE   $01EB                           ; 5F7D  SFX data
        DECLE   $02CF                           ; 5F7E  SFX end

L_5F7F:
        PSHR    R5                              ; 5F7F   0275

        JSR     R5,     X_PLAY_SFX2             ; 5F80   0004 0118 03BE
        DECLE   $0030                           ; 5F83  SFX prio
        DECLE   $01C9                           ; 5F84  SFX data
        DECLE   $030D                           ; 5F85  SFX data
        DECLE   $03C0,  $0060                   ; 5F86  SFX data
        DECLE   $03C8,  $0068                   ; 5F88  SFX data
        DECLE   $0355                           ; 5F8A  SFX data
        DECLE   $0001,  $0040                   ; 5F8B  SFX data
        DECLE   $0011,  $0102                   ; 5F8D  SFX data
        DECLE   $03D2                           ; 5F8F  SFX data
        DECLE   $03EA                           ; 5F90  SFX data
        DECLE   $03E6                           ; 5F91  SFX data
        DECLE   $03EB                           ; 5F92  SFX data
        DECLE   $02CF                           ; 5F93  SFX end

L_5F94:
        PSHR    R5                              ; 5F94   0275

        JSR     R5,     X_PLAY_SFX1             ; 5F95   0004 0118 03BB
        DECLE   $0309                           ; 5F98  SFX data
        DECLE   $03ED                           ; 5F99  SFX data
        DECLE   $0040,  $0020                   ; 5F9A  SFX data
        DECLE   $0048,  $0000                   ; 5F9C  SFX data
        DECLE   $0044,  $0000                   ; 5F9E  SFX data
        DECLE   $00A1,  $01FF                   ; 5FA0  SFX data
        DECLE   $018C,  $0000                   ; 5FA2  SFX data
        DECLE   $0301,  $0042                   ; 5FA4  SFX data
        DECLE   $000B                           ; 5FA6  SFX data
        DECLE   $008F,  $005F                   ; 5FA7  SFX data
        DECLE   $02CF                           ; 5FA9  SFX end

L_5FAA:
        PSHR    R5                              ; 5FAA   0275

        JSR     R5,     X_PLAY_SFX2             ; 5FAB   0004 0118 03BE
        DECLE   $000A                           ; 5FAE  SFX prio
        DECLE   $03E9                           ; 5FAF  SFX data
        DECLE   $0050,  $007F                   ; 5FB0  SFX data
        DECLE   $0003,  $0008                   ; 5FB2  SFX data
        DECLE   $0050,  $0000                   ; 5FB4  SFX data
        DECLE   $03C5                           ; 5FB6  SFX data
        DECLE   $006B                           ; 5FB7  SFX data
        DECLE   $02CF                           ; 5FB8  SFX end

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 5FFD   0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5040       <entry>
;;  $5053       $504B  
;;  $5079       $504F  
;;  $50AD       $5077  
;;  $50D1       $5045   $5051  
;;  $50D2       $518B   $5190   $5195  
;;  $50D9       $50DC  
;;  $50DF       <entry> $53EC  
;;  $5104       $5123  
;;  $5125       $5114  
;;  $5132       $5118  
;;  $513C       $5139  
;;  $5146       $5130  
;;  $519C       $579A  
;;  $519D       $519B  
;;  $51B0       $51AC  
;;  $51B7       $51AE   $51B3  
;;  $51D4       $51CA   $51CE  
;;  $51E7       $51DF   $51E3  
;;  $51FA       $51F2   $51F6  
;;  $520F       $5205   $5209  
;;  $5226       $523A   $5842  
;;  $523C       $5229  
;;  $523D       $50B9   $50C0   $50C7   $50CE   $51D4   $51E7   $51FA   $520F  
;;  $523D       $548F   $5A97  
;;  $5242       $5245  
;;  $5290       $526C   $52A9   $52BC  
;;  $5299       $528A  
;;  $52AC       $528E  
;;  $52CC       $52C7  
;;  $52D5       $52D1  
;;  $52DB       $52D7  
;;  $52E1       $52DD  
;;  $52F6       $52F3  
;;  $52FB       $52F8  
;;  $5300       $52FD  
;;  $5305       $5302   $5316  
;;  $530F       $52EB  
;;  $5314       $593F  
;;  $532F       $531D  
;;  $5334       $5A47  
;;  $534C       $5348  
;;  $5352       $534E  
;;  $5358       $5354  
;;  $5375       $549B   $56BC  
;;  $53B0       $5397  
;;  $53B3       $53BD  
;;  $53BA       $53BB  
;;  $53BF       $53B0  
;;  $53EE       $5391   $5655   $577A  
;;  $53FB       $53F6  
;;  $5407       $5400  
;;  $540A       $5405  
;;  $5412       $5ED3  
;;  $541A       $5416  
;;  $541B       $5420  
;;  $5429       $5425   $5433  
;;  $542F       $542C  
;;  $5441       $5447  
;;  $5458       $545E   $54A4  
;;  $545D       $5495  
;;  $5463       $5436  
;;  $5464       $545B  
;;  $5470       $546A  
;;  $5482       $547E  
;;  $548A       $5486  
;;  $5497       $5461  
;;  $54B1       $54AA  
;;  $54C5       $54BB  
;;  $54CE       $54C7  
;;  $54D4       $54C3  
;;  $54E7       $54E3  
;;  $54F0       $54EA  
;;  $54F4       $54EC  
;;  $54F5       $54EE   $54F2  
;;  $5501       $54FD  
;;  $5507       $5503  
;;  $550D       $5509  
;;  $5510       $5539   $5541  
;;  $5517       $5513   $5521  
;;  $5520       $551C  
;;  $552A       $5526  
;;  $553B       $5532  
;;  $5543       $5519  
;;  $5549       $54C1   $54CC   $54D2   $5537   $553F  
;;  $5561       $555F  
;;  $556A       $5566  
;;  $5570       $556C  
;;  $5576       $5572  
;;  $557D       $5599  
;;  $559B       $5592  
;;  $559C       $5596  
;;  $55AD       $54BD   $5752  
;;  $55B2       $55AB  
;;  $55CC       $55B7  
;;  $55CE       $55C2  
;;  $55E3       $54CE   $55D9  
;;  $5600       $55F5   $55FA  
;;  $5627       $560C   $560F  
;;  $562A       $55EC  
;;  $5663       $565F  
;;  $5679       $566E  
;;  $567D       $567E  
;;  $56B5       $56A9   $56AD  
;;  $56B9       $56B3  
;;  $56BB       $56A3  
;;  $56BC       $564C  
;;  $56D3       $56CF  
;;  $56DB       $56D1  
;;  $56E0       $56D8  
;;  $56E3       $56DE  
;;  $56E6       $54AE  
;;  $570B       $5708  
;;  $5710       $570D  
;;  $5725       $571A  
;;  $5739       $5735  
;;  $5747       $5740  
;;  $574E       $574B  
;;  $575B       $5761   $5764  
;;  $5766       $575D  
;;  $5774       $5771   $5840  
;;  $5796       $5793  
;;  $579D       $56EA   $5769  
;;  $57D7       $57CC  
;;  $57DE       $57F5   $57FB  
;;  $57E1       $57E7  
;;  $57F7       $57EB   $57EF   $57F3  
;;  $580C       $5803  
;;  $5813       $5806   $580D  
;;  $5815       $580A   $5811  
;;  $5819       $5837  
;;  $5839       $5833  
;;  $5845       $57BC  
;;  $5846       <entry>
;;  $585F       $5859  
;;  $5867       $5861  
;;  $586E       $5868  
;;  $587F       $587D  
;;  $5882       $587B  
;;  $5884       $5877   $5880  
;;  $5891       $585D   $5865   $586C  
;;  $58A8       $584A   $5850   $588F  
;;  $58A9       $58E1  
;;  $58C2       $58AD  
;;  $58DA       $58C5  
;;  $58DB       <entry> $5198  
;;  $58E8       $52C9  
;;  $5900       $58FC  
;;  $5903       $590C  
;;  $5916       $5919  
;;  $5923       $5926  
;;  $5930       $5933  
;;  $593F       $5982  
;;  $5944       <entry>
;;  $5947       $5963  
;;  $5961       $594C   $5951  
;;  $5978       $596E  
;;  $597A       $596B  
;;  $5984       $5942   $597D  
;;  $5986       $5A9D  
;;  $59AA       $59A7  
;;  $59B7       $59AB  
;;  $59C0       $59BA  
;;  $59D5       $599F  
;;  $59DE       $59D8  
;;  $59F7       $59E0   $59E4  
;;  $5A0F       $59B5   $59C2   $59C9   $59D3   $59EB   $59F5   $59F9   $59FD  
;;  $5A0F       $5A05  
;;  $5A26       $5A1A  
;;  $5A28       $5A24  
;;  $5A37       $5A41  
;;  $5A4A       $5A16  
;;  $5A5F       $5A39  
;;  $5A68       $5A65  
;;  $5A75       $5A6D  
;;  $5A81       $5A79  
;;  $5A8B       $5A85  
;;  $5A93       $5A73   $5A7F   $5A89  
;;  $5A9A       $5988   $598C   $5A4F   $5A5D   $5A8F  
;;  $5AB3       $5AB3  
;;  $5E96       <entry>
;;  $5EA4       $5E9E  
;;  $5EA7       $5EA2  
;;  $5ECB       $5ECF  
;;  $5ED6       $5ED1  
;;  $5EDB       $5EF9  
;;  $5EE3       $5EDF  
;;  $5F14       $5F25  
;;  $5F1D       $5F20  
;;  $5F29       $5F0F  
;;  $5F2D       $5F3F  
;;  $5F2F       $5F33  
;;  $5F42       $5F27  
;;  $5F44       $5F0D  
;;  $5F4C       $5755  
;;  $5F5D       $57B6  
;;  $5F6B       $5450  
;;  $5F7F       $532C  
;;  $5F94       $562D  
;;  $5FAA       $5237  
;; ======================================================================== ;;
