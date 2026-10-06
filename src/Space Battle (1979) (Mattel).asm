
        ORG     $5000
.HEADER:
        BIDECLE $590A           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $504B           ; 5004  Ptr: Start of game
        BIDECLE $5BCC           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5BB7           ; 5008  Ptr: GRAM init sequence
        BIDECLE $502E           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0004,  $0002   ; 500F  Color Stack init (0, 1)
        DECLE   $0007,  $0004   ; 5011  Color Stack init (2, 3)
        DECLE   $0003           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 501C  Timer dispatch/interval
        DECLE   $0031,  $0053,  $0001,  $0000; 5020  Timer dispatch/interval
        DECLE   $0094,  $0053,  $0002,  $0000; 5024  Timer dispatch/interval
        DECLE   $00F9,  $005D,  $0002,  $0000; 5028  Timer dispatch/interval
        BIDECLE $0000           ; 502C  End of timer table

.TITLE:
        DECLE   $004F                           ; 502E  Cartridge year
        STRING  "SPACE BATTLE"                  ; 502F  Title string
        DECLE   $0000                           ; 503B  

.TITLECODE:
        MOVR    R7,     R4                      ; 503C   00BC
        ADDI    #$0004, R4                      ; 503D   02FC 0004
        PSHR    R4                              ; 503F   0274
        MOVR    R5,     R7                      ; 5040   00AF

        MVO     R2,     G_0160                  ; 5041   0242 0160
        SUBI    #$0003, R0                      ; 5043   0338 0003

        JSR     R5,     X_POW2                  ; 5045   0004 0114 0345

        MVO     R0,     G_015E                  ; 5048   0240 015E
        PULR    R7                              ; 504A   02B7

.START:
        PSHR    R5                              ; 504B   0275

        JSR     R5,     L_5258                  ; 504C   0004 0150 0258
        JSR     R5,     L_5053                  ; 504F   0004 0150 0053

        PULR    R7                              ; 5052   02B7

L_5053:
        PSHR    R5                              ; 5053   0275
        MVII    #$0001, R0                      ; 5054   02B8 0001
        MVO     R0,     G_01A5                  ; 5056   0240 01A5

        JSR     R5,     .EXEC.7B3               ; 5058   0004 0114 03B3

        SDBD                                    ; 505B   0001
        MVII    #$5020, R1                      ; 505C   02B9 0020 0050

        JSR     R5,     X_TIMER_STOP            ; 505F   0004 0118 0038

        ADDI    #$0004, R1                      ; 5062   02F9 0004

        JSR     R5,     X_TIMER_STOP            ; 5064   0004 0118 0038

        ADDI    #$0004, R1                      ; 5067   02F9 0004

        JSR     R5,     X_TIMER_START           ; 5069   0004 0118 0044

        MVII    #$0003, R0                      ; 506C   02B8 0003
        MVO     R0,     G_0103                  ; 506E   0240 0103

        JSR     R5,     L_5086                  ; 5070   0004 0150 0086
        JSR     R5,     L_5B44                  ; 5073   0004 0158 0344

        SDBD                                    ; 5076   0001
        MVII    #$508C, R0                      ; 5077   02B8 008C 0050
        MVO     R0,     G_035D                  ; 507A   0240 035D

        JSR     R5,     L_5CF5                  ; 507C   0004 015C 00F5
        JSR     R5,     L_50B2                  ; 507F   0004 0150 00B2
        JSR     R5,     L_51E8                  ; 5082   0004 0150 01E8

        PULR    R7                              ; 5085   02B7

L_5086:
        PSHR    R5                              ; 5086   0275
        CLRR    R0                              ; 5087   01C0
        COMR    R0                              ; 5088   0018

        JSR     R5,     .EXEC.A62               ; 5089   0004 0118 0262
        DECLE   $0000,  $0000,  $001B,  $005F   ; 508C   0000 0000 001B 005F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5090   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5094   0000 0000
L_5096:
        PSHR    R5                              ; 5096   0275
        MVI     G_018D, R1                      ; 5097   0281 018D
        MOVR    R1,     R2                      ; 5099   008A
        ADDI    #$019D, R1                      ; 509A   02F9 019D
        MVI@    R1,     R0                      ; 509C   0288
        CMPI    #$0002, R0                      ; 509D   0378 0002
        BNEQ    L_50AC                          ; 509F   020C 000B

        MVO     R2,     G_01A6                  ; 50A1   0242 01A6
        ADDI    #$01A1, R2                      ; 50A3   02FA 01A1
        MVI@    R2,     R1                      ; 50A5   0291
        MVO     R1,     G_01A7                  ; 50A6   0241 01A7

        JSR     R5,     L_52BA                  ; 50A8   0004 0150 02BA

        PULR    R7                              ; 50AB   02B7

L_50AC:
        MVII    #$0002, R0                      ; 50AC   02B8 0002

        JSR     R5,     X_PLAY_RAZZ4            ; 50AE   0004 011C 02C4

        PULR    R7                              ; 50B1   02B7

L_50B2:
        PSHR    R5                              ; 50B2   0275
        MVII    #$031D, R2                      ; 50B3   02BA 031D
        SDBD                                    ; 50B5   0001
        MVII    #$522D, R1                      ; 50B6   02B9 002D 0052
        MVII    #$0005, R3                      ; 50B9   02BB 0005

L_50BB:
        JSR     R5,     X_INIT_MOB              ; 50BB   0004 0114 02B2

        ADDI    #$0008, R2                      ; 50BE   02FA 0008
        DECR    R3                              ; 50C0   0013
        BNEQ    L_50BB                          ; 50C1   022C 0007

        JSR     R5,     L_50D6                  ; 50C3   0004 0150 00D6

        CLRR    R2                              ; 50C6   01D2

L_50C7:
        JSR     R5,     L_50EE                  ; 50C7   0004 0150 00EE

        INCR    R2                              ; 50CA   000A
        CMPI    #$0008, R2                      ; 50CB   037A 0008
        BLT     L_50C7                          ; 50CD   0225 0007

        CLRR    R0                              ; 50CF   01C0
        MVO     R0,     G_015D                  ; 50D0   0240 015D

        JSR     R5,     L_5167                  ; 50D2   0004 0150 0167

        PULR    R7                              ; 50D5   02B7

L_50D6:
        PSHR    R5                              ; 50D6   0275
        MVII    #$0345, R2                      ; 50D7   02BA 0345
        SDBD                                    ; 50D9   0001
        MVII    #$5245, R1                      ; 50DA   02B9 0045 0052
        SDBD                                    ; 50DD   0001
        MVII    #$5255, R4                      ; 50DE   02BC 0055 0052

L_50E1:
        JSR     R5,     X_INIT_MOB              ; 50E1   0004 0114 02B2

        MVI@    R2,     R0                      ; 50E4   0290
        XOR@    R4,     R0                      ; 50E5   03E0
        MVO@    R0,     R2                      ; 50E6   0250
        ADDI    #$0008, R2                      ; 50E7   02FA 0008
        CMPI    #$035D, R2                      ; 50E9   037A 035D
        BNEQ    L_50E1                          ; 50EB   022C 000B
        PULR    R7                              ; 50ED   02B7

L_50EE:
        PSHR    R5                              ; 50EE   0275
        MOVR    R2,     R0                      ; 50EF   0090

        JSR     R5,     .EXEC.76C               ; 50F0   0004 0114 036C

        MVI@    R1,     R3                      ; 50F3   028B

        JSR     R5,     L_5DB2                  ; 50F4   0004 015C 01B2

        CMPI    #$0002, R0                      ; 50F7   0378 0002
        BEQ     L_5103                          ; 50F9   0204 0008

        SDBD                                    ; 50FB   0001
        ANDI    #$EFFF, R3                      ; 50FC   03BB 00FF 00EF
        CMPI    #$0001, R0                      ; 50FF   0378 0001
        BEQ     L_5107                          ; 5101   0204 0004

L_5103:
        SDBD                                    ; 5103   0001
        XORI    #$1000, R3                      ; 5104   03FB 0000 0010
L_5107:
        MVO@    R3,     R1                      ; 5107   024B
        ADDI    #$0002, R1                      ; 5108   02F9 0002
        MVII    #$0169, R3                      ; 510A   02BB 0169

        JSR     R5,     L_5D98                  ; 510C   0004 015C 0198

        PULR    R3                              ; 510F   02B3
        MVO@    R3,     R1                      ; 5110   024B
        INCR    R1                              ; 5111   0009
        MVII    #$017B, R3                      ; 5112   02BB 017B

        JSR     R5,     L_5D98                  ; 5114   0004 015C 0198

        PULR    R3                              ; 5117   02B3
        MVO@    R3,     R1                      ; 5118   024B
        ADDI    #$0002, R1                      ; 5119   02F9 0002
        MOVR    R2,     R3                      ; 511B   0093
        ADDI    #$0161, R3                      ; 511C   02FB 0161
        MVI@    R3,     R0                      ; 511E   0298
        ADDI    #$0007, R0                      ; 511F   02F8 0007
        CMPI    #$0005, R2                      ; 5121   037A 0005
        BGE     L_5130                          ; 5123   020D 000B

        SUBI    #$0007, R0                      ; 5125   0338 0007
        MOVR    R0,     R3                      ; 5127   0083
        CLRR    R0                              ; 5128   01C0
L_5129:
        SUBI    #$0002, R3                      ; 5129   033B 0002
        BLE     L_5130                          ; 512B   0206 0003

        INCR    R0                              ; 512D   0008
        B       L_5129                          ; 512E   0220 0006

L_5130:
        MVO@    R0,     R1                      ; 5130   0248
        PULR    R7                              ; 5131   02B7

L_5132:
        PSHR    R5                              ; 5132   0275
        CLRR    R2                              ; 5133   01D2

L_5134:
        JSR     R5,     L_514B                  ; 5134   0004 0150 014B
        JSR     R5,     L_5F09                  ; 5137   0004 015C 0309

        CMPI    #$0038, R0                      ; 513A   0378 0038
        BGT     L_5145                          ; 513C   020E 0007

        JSR     R5,     L_5F12                  ; 513E   0004 015C 0312

        CMPI    #$0020, R0                      ; 5141   0378 0020
        BLE     L_5134                          ; 5143   0226 0010

L_5145:
        INCR    R2                              ; 5145   000A
        CMPI    #$0005, R2                      ; 5146   037A 0005
        BLT     L_5134                          ; 5148   0225 0015
        PULR    R7                              ; 514A   02B7

L_514B:
        PSHR    R5                              ; 514B   0275
        MVII    #$0090, R0                      ; 514C   02B8 0090

        JSR     R5,     X_RAND2                 ; 514E   0004 0114 029E

        ADDI    #$0010, R0                      ; 5151   02F8 0010
        MVII    #$0169, R3                      ; 5153   02BB 0169
        SWAP    R0,     1                       ; 5155   0040

        JSR     R5,     L_5DA7                  ; 5156   0004 015C 01A7

        MVII    #$0058, R0                      ; 5159   02B8 0058

        JSR     R5,     X_RAND2                 ; 515B   0004 0114 029E

        ADDI    #$0008, R0                      ; 515E   02F8 0008
        MVII    #$017B, R3                      ; 5160   02BB 017B
        SWAP    R0,     1                       ; 5162   0040

        JSR     R5,     L_5DA7                  ; 5163   0004 015C 01A7

        PULR    R7                              ; 5166   02B7

L_5167:
        PSHR    R5                              ; 5167   0275
L_5168:
        MVI     G_015D, R0                      ; 5168   0280 015D

        JSR     R5,     .EXEC.76C               ; 516A   0004 0114 036C

        MVI@    R1,     R2                      ; 516D   028A
        SDBD                                    ; 516E   0001
        ANDI    #$FFE8, R2                      ; 516F   03BA 00E8 00FF
        XORI    #$0007, R2                      ; 5172   03FA 0007
        MVO@    R2,     R1                      ; 5174   024A
L_5175:
        INCR    R0                              ; 5175   0008
        CMPI    #$0005, R0                      ; 5176   0378 0005
        BLT     L_517B                          ; 5178   0205 0001

        CLRR    R0                              ; 517A   01C0
L_517B:
        MOVR    R0,     R2                      ; 517B   0082

        JSR     R5,     L_5DB2                  ; 517C   0004 015C 01B2

        CMPI    #$0003, R0                      ; 517F   0378 0003
        BEQ     L_5187                          ; 5181   0204 0004

        CMPI    #$0000, R0                      ; 5183   0378 0000
        BNEQ    L_518D                          ; 5185   020C 0006

L_5187:
        MOVR    R2,     R0                      ; 5187   0090

        JSR     R5,     L_51A6                  ; 5188   0004 0150 01A6

        BNC     L_5195                          ; 518B   0209 0008

L_518D:
        MOVR    R2,     R0                      ; 518D   0090
        MVI     G_015D, R2                      ; 518E   0282 015D
        CMPR    R0,     R2                      ; 5190   0142
        BNEQ    L_5175                          ; 5191   022C 001D

        SETC                                    ; 5193   0007
        PULR    R7                              ; 5194   02B7

L_5195:
        MOVR    R0,     R2                      ; 5195   0082
        MVO     R2,     G_015D                  ; 5196   0242 015D
        SLL     R2,     2                       ; 5198   004E
        SLL     R2,     1                       ; 5199   004A
        ADDI    #$031D, R2                      ; 519A   02FA 031D
        MVI@    R2,     R0                      ; 519C   0290
        SDBD                                    ; 519D   0001
        ANDI    #$FFE8, R0                      ; 519E   03B8 00E8 00FF
        XORI    #$0014, R0                      ; 51A1   03F8 0014
        MVO@    R0,     R2                      ; 51A3   0250
        CLRC                                    ; 51A4   0006
        PULR    R7                              ; 51A5   02B7

L_51A6:
        PSHR    R5                              ; 51A6   0275
        PSHR    R2                              ; 51A7   0272
        PSHR    R3                              ; 51A8   0273
        CLRR    R2                              ; 51A9   01D2
L_51AA:
        MVII    #$019D, R3                      ; 51AA   02BB 019D
        ADDR    R2,     R3                      ; 51AC   00D3
        MVI@    R3,     R3                      ; 51AD   029B
        CMPI    #$0003, R3                      ; 51AE   037B 0003
        BEQ     L_51B6                          ; 51B0   0204 0004

        CMPI    #$0002, R3                      ; 51B2   037B 0002
        BNEQ    L_51BD                          ; 51B4   020C 0007

L_51B6:
        MVII    #$01A1, R3                      ; 51B6   02BB 01A1
        ADDR    R2,     R3                      ; 51B8   00D3
        MVI@    R3,     R3                      ; 51B9   029B
        CMPR    R0,     R3                      ; 51BA   0143
        BEQ     L_51C5                          ; 51BB   0204 0008

L_51BD:
        INCR    R2                              ; 51BD   000A
        CMPI    #$0003, R2                      ; 51BE   037A 0003
        BLT     L_51AA                          ; 51C0   0225 0017

        CLRC                                    ; 51C2   0006
        B       L_51C7                          ; 51C3   0200 0002

L_51C5:
        MOVR    R2,     R1                      ; 51C5   0091
        SETC                                    ; 51C6   0007
L_51C7:
        PULR    R3                              ; 51C7   02B3
        PULR    R2                              ; 51C8   02B2
        PULR    R7                              ; 51C9   02B7

L_51CA:
        PSHR    R5                              ; 51CA   0275
        MVII    #$0001, R0                      ; 51CB   02B8 0001
        MVII    #$0198, R3                      ; 51CD   02BB 0198
        ADDR    R2,     R3                      ; 51CF   00D3
        MVO@    R0,     R3                      ; 51D0   0258
        MOVR    R2,     R0                      ; 51D1   0090

        JSR     R5,     L_51A6                  ; 51D2   0004 0150 01A6

        ADDI    #$019D, R1                      ; 51D5   02F9 019D
        MVII    #$0003, R0                      ; 51D7   02B8 0003
        MVO@    R0,     R1                      ; 51D9   0248
        MVI     G_01A5, R0                      ; 51DA   0280 01A5
        TSTR    R0                              ; 51DC   0080
        BEQ     L_51E2                          ; 51DD   0204 0003

        JSR     R5,     L_5167                  ; 51DF   0004 0150 0167

L_51E2:
        MVI     G_01A4, R0                      ; 51E2   0280 01A4
        DECR    R0                              ; 51E4   0010
        MVO     R0,     G_01A4                  ; 51E5   0240 01A4
        INCR    R7                              ; 51E7   000F

L_51E8:
        PSHR    R5                              ; 51E8   0275
L_51E9:
        CLRR    R2                              ; 51E9   01D2

L_51EA:
        JSR     R5,     L_5DB2                  ; 51EA   0004 015C 01B2

        CMPI    #$0001, R0                      ; 51ED   0378 0001
        BNEQ    L_5214                          ; 51EF   020C 0023

        INCR    R2                              ; 51F1   000A
        CMPI    #$0005, R2                      ; 51F2   037A 0005
        BLT     L_51EA                          ; 51F4   0225 000B

        MVI     G_01A5, R0                      ; 51F6   0280 01A5
        TSTR    R0                              ; 51F8   0080
        BEQ     L_5214                          ; 51F9   0204 0019

        MVII    #$0006, R3                      ; 51FB   02BB 0006
        MVII    #$02E1, R4                      ; 51FD   02BC 02E1

        JSR     R5,     X_PRINT_R5              ; 51FF   0004 0118 007B
        STRING  "ALL CLEAR"                     ; 5202  
        DECLE   $0000                           ; 520B   0000

        MVII    #$0014, R0                      ; 520C   02B8 0014

        JSR     R5,     L_5575                  ; 520E   0004 0154 0175

        J       L_5EC6                          ; 5211   0004 035C 02C6
L_5214:
        PULR    R7                              ; 5214   02B7

L_5215:
        PSHR    R5                              ; 5215   0275
        MVII    #$0001, R0                      ; 5216   02B8 0001
        MVII    #$019D, R3                      ; 5218   02BB 019D
        ADDR    R2,     R3                      ; 521A   00D3
        MVO@    R0,     R3                      ; 521B   0258
        ADDI    #$01A1, R2                      ; 521C   02FA 01A1
        MVI@    R2,     R2                      ; 521E   0292
        ADDI    #$0198, R2                      ; 521F   02FA 0198
        CMP@    R2,     R0                      ; 5221   0350
        BEQ     L_522C                          ; 5222   0204 0008

        MVII    #$0003, R0                      ; 5224   02B8 0003
        MVO@    R0,     R2                      ; 5226   0250
        MVI     G_01A4, R0                      ; 5227   0280 01A4
        DECR    R0                              ; 5229   0010
        MVO     R0,     G_01A4                  ; 522A   0240 01A4
L_522C:
        PULR    R7                              ; 522C   02B7

        DECLE   $0007,  $0000,  $003D,  $0052   ; 522D   0007 0000 003D 0052
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5231   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5235   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5239   0000 0000 0000 0000
        DECLE   $0300,  $0000,  $0000,  $0000   ; 523D   0300 0000 0000 0000
        DECLE   $000B,  $0036,  $0000,  $0000   ; 5241   000B 0036 0000 0000
        DECLE   $0000,  $0000,  $003D,  $0052   ; 5245   0000 0000 003D 0052
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5249   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000A,  $0000   ; 524D   0000 0000 000A 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5251   0000 0000 0000 0000
        DECLE   $0001                           ; 5255   0001

        SETC                                    ; 5256   0007
        DIS                                     ; 5257   0003
L_5258:
        PSHR    R5                              ; 5258   0275

        JSR     R5,     L_5B36                  ; 5259   0004 0158 0336

        MVII    #$0001, R0                      ; 525C   02B8 0001
        MVO     R0,     G_01A0                  ; 525E   0240 01A0
        CLRR    R2                              ; 5260   01D2
L_5261:
        MVII    #$0003, R0                      ; 5261   02B8 0003

        JSR     R5,     X_RAND1                 ; 5263   0004 0114 027D

        ADDI    #$0008, R0                      ; 5266   02F8 0008
        MVII    #$0161, R3                      ; 5268   02BB 0161
        ADDR    R2,     R3                      ; 526A   00D3
        MVO@    R0,     R3                      ; 526B   0258
        MVII    #$0198, R3                      ; 526C   02BB 0198
        MVII    #$0003, R0                      ; 526E   02B8 0003
        ADDR    R2,     R3                      ; 5270   00D3
        MVO@    R0,     R3                      ; 5271   0258
        MVII    #$018E, R3                      ; 5272   02BB 018E
        MVII    #$0004, R0                      ; 5274   02B8 0004

        JSR     R5,     X_RAND2                 ; 5276   0004 0114 029E

        ADDI    #$0003, R0                      ; 5279   02F8 0003
        ADDR    R2,     R3                      ; 527B   00D3
        MVO@    R0,     R3                      ; 527C   0258
        INCR    R2                              ; 527D   000A
        CMPI    #$0005, R2                      ; 527E   037A 0005
        BLT     L_5261                          ; 5280   0225 0020

        JSR     R5,     L_5132                  ; 5282   0004 0150 0132

        CLRR    R2                              ; 5285   01D2
L_5286:
        MVII    #$0166, R3                      ; 5286   02BB 0166
        MVII    #$0003, R0                      ; 5288   02B8 0003
        ADDR    R2,     R3                      ; 528A   00D3
        MVO@    R0,     R3                      ; 528B   0258
        MVII    #$019D, R3                      ; 528C   02BB 019D
        MVII    #$0000, R0                      ; 528E   02B8 0000
        ADDR    R2,     R3                      ; 5290   00D3
        MVO@    R0,     R3                      ; 5291   0258
        MVII    #$0193, R3                      ; 5292   02BB 0193
        MVII    #$0008, R0                      ; 5294   02B8 0008
        ADDR    R2,     R3                      ; 5296   00D3
        MVO@    R0,     R3                      ; 5297   0258
        MVII    #$0173, R3                      ; 5298   02BB 0173
        CLRR    R0                              ; 529A   01C0

        JSR     R5,     L_5DA7                  ; 529B   0004 015C 01A7

        INCR    R2                              ; 529E   000A
        CMPI    #$0003, R2                      ; 529F   037A 0003
        BLT     L_5286                          ; 52A1   0225 001C

        MVII    #$0001, R0                      ; 52A3   02B8 0001
        MVO     R0,     G_01A5                  ; 52A5   0240 01A5
        PULR    R7                              ; 52A7   02B7
        ADDR    R4,     R7                      ; 52A8   00E7

        RLC     R0,     2                       ; 52A9   0054
        MOVR    R6,     R2                      ; 52AA   00B2
        RLC     R2,     1                       ; 52AB   0052
        SAR     R1,     1                       ; 52AC   0069
        RLC     R3,     2                       ; 52AD   0057
        SAR     R1,     1                       ; 52AE   0069
        RLC     R3,     2                       ; 52AF   0057
        SAR     R1,     1                       ; 52B0   0069
        RLC     R3,     2                       ; 52B1   0057
        CMPI    #$000A, R0                      ; 52B2   0378 000A
        BNEQ    L_52B9                          ; 52B4   020C 0003
        J       L_5053                          ; 52B6   0004 0350 0053
L_52B9:
        MOVR    R5,     R7                      ; 52B9   00AF

L_52BA:
        PSHR    R5                              ; 52BA   0275
        MVI     G_01A6, R1                      ; 52BB   0281 01A6
        ADDI    #$0166, R1                      ; 52BD   02F9 0166
        MVI@    R1,     R0                      ; 52BF   0288
        TSTR    R0                              ; 52C0   0080
        BEQ     L_5330                          ; 52C1   0204 006D

        CLRR    R0                              ; 52C3   01C0
        MVO     R0,     G_01A5                  ; 52C4   0240 01A5

        JSR     R5,     .EXEC.7B3               ; 52C6   0004 0114 03B3
        JSR     R5,     L_5CE6                  ; 52C9   0004 015C 00E6
        JSR     R5,     .EXEC.A61               ; 52CC   0004 0118 0261
        DECLE   $0001                           ; 52CF   0001

        MVI     G_015E, R0                      ; 52D0   0280 015E
        SAR     R0,     2                       ; 52D2   006C
        SARC    R0,     2                       ; 52D3   007C
        MVII    #$0004, R0                      ; 52D4   02B8 0004
        BC      L_52E3                          ; 52D6   0201 000B
        BNOV    L_52E5                          ; 52D8   020A 000B

        SDBD                                    ; 52DA   0001
        MVII    #$5028, R1                      ; 52DB   02B9 0028 0050

        JSR     R5,     X_TIMER_STOP            ; 52DE   0004 0118 0038

        MVII    #$0006, R0                      ; 52E1   02B8 0006
L_52E3:
        MVO     R0,     G_0103                  ; 52E3   0240 0103
L_52E5:
        MVII    #$0200, R4                      ; 52E5   02BC 0200
        MVII    #$00F0, R0                      ; 52E7   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 52E9   0004 0114 0338

        MVII    #$0200, R4                      ; 52EC   02BC 0200
        MVII    #$00F0, R2                      ; 52EE   02BA 00F0
L_52F0:
        MVII    #$0003, R0                      ; 52F0   02B8 0003

        JSR     R5,     X_RAND2                 ; 52F2   0004 0114 029E

        TSTR    R0                              ; 52F5   0080
        BEQ     L_52FD                          ; 52F6   0204 0005

        MVII    #$0007, R0                      ; 52F8   02B8 0007

        JSR     R5,     X_RAND2                 ; 52FA   0004 0114 029E

L_52FD:
        MOVR    R0,     R1                      ; 52FD   0081
        SLL     R1,     2                       ; 52FE   004D
        SLL     R1,     1                       ; 52FF   0049
        MVII    #$0003, R0                      ; 5300   02B8 0003

        JSR     R5,     X_RAND1                 ; 5302   0004 0114 027D

        XORR    R0,     R1                      ; 5305   01C1
        SDBD                                    ; 5306   0001
        XORI    #$1800, R1                      ; 5307   03F9 0000 0018
        MVO@    R1,     R4                      ; 530A   0261
        DECR    R2                              ; 530B   0012
        BNEQ    L_52F0                          ; 530C   022C 001D

        JSR     R5,     L_5D27                  ; 530E   0004 015C 0127
        JSR     R5,     L_5353                  ; 5311   0004 0150 0353
        JSR     R5,     L_54DC                  ; 5314   0004 0154 00DC
        JSR     R5,     L_5759                  ; 5317   0004 0154 0359

        SDBD                                    ; 531A   0001
        MVII    #$5020, R1                      ; 531B   02B9 0020 0050

        JSR     R5,     X_TIMER_START           ; 531E   0004 0118 0044

        ADDI    #$0004, R1                      ; 5321   02F9 0004

        JSR     R5,     X_TIMER_START           ; 5323   0004 0118 0044

        SDBD                                    ; 5326   0001
        MVII    #$52A8, R0                      ; 5327   02B8 00A8 0052
        MVO     R0,     G_035D                  ; 532A   0240 035D
        MVII    #$000E, R0                      ; 532C   02B8 000E
        MVO     R0,     G_0115                  ; 532E   0240 0115
L_5330:
        PULR    R7                              ; 5330   02B7

L_5331:
        PSHR    R5                              ; 5331   0275
        MVII    #$0014, R3                      ; 5332   02BB 0014
        MVII    #$000C, R0                      ; 5334   02B8 000C

        JSR     R5,     X_RAND2                 ; 5336   0004 0114 029E

        MVII    #$0200, R2                      ; 5339   02BA 0200
        ADDR    R0,     R2                      ; 533B   00C2
        MVII    #$0008, R0                      ; 533C   02B8 0008

        JSR     R5,     X_RAND2                 ; 533E   0004 0114 029E

L_5341:
        MVI@    R2,     R1                      ; 5341   0291
        SDBD                                    ; 5342   0001
        CMPI    #$1000, R1                      ; 5343   0379 0000 0010
        BLT     L_534A                          ; 5346   0205 0002

        XORR    R0,     R1                      ; 5348   01C1
        MVO@    R1,     R2                      ; 5349   0251
L_534A:
        ADDI    #$000C, R2                      ; 534A   02FA 000C
        DECR    R3                              ; 534C   0013
        BNEQ    L_5341                          ; 534D   022C 000D

        JSR     R5,     .EXEC.4F1               ; 534F   0004 0114 00F1

        PULR    R7                              ; 5352   02B7

L_5353:
        PSHR    R5                              ; 5353   0275
        MVII    #$033D, R2                      ; 5354   02BA 033D
        SDBD                                    ; 5356   0001
        MVII    #$54A6, R1                      ; 5357   02B9 00A6 0054

        JSR     R5,     X_INIT_MOB              ; 535A   0004 0114 02B2

        MVI@    R2,     R0                      ; 535D   0290
        XORI    #$0008, R0                      ; 535E   03F8 0008
        MVO@    R0,     R2                      ; 5360   0250
        MVII    #$034D, R2                      ; 5361   02BA 034D

        JSR     R5,     X_INIT_MOB              ; 5363   0004 0114 02B2

        MVII    #$0355, R2                      ; 5366   02BA 0355

        JSR     R5,     X_INIT_MOB              ; 5368   0004 0114 02B2

        MVII    #$0345, R2                      ; 536B   02BA 0345

        JSR     R5,     X_INIT_MOB              ; 536D   0004 0114 02B2

        MOVR    R2,     R1                      ; 5370   0091

        JSR     R5,     .EXEC.766               ; 5371   0004 0114 0366
        JSR     R5,     .EXEC.6CF               ; 5374   0004 0114 02CF

        MVII    #$01A8, R4                      ; 5377   02BC 01A8
        MVII    #$0003, R0                      ; 5379   02B8 0003
        MVO@    R0,     R4                      ; 537B   0260
        MVO@    R0,     R4                      ; 537C   0260
        MVO@    R0,     R4                      ; 537D   0260
        MVO@    R0,     R4                      ; 537E   0260
        SUBI    #$0004, R4                      ; 537F   033C 0004

        JSR     R5,     L_5D82                  ; 5381   0004 015C 0182

        MVII    #$0000, R1                      ; 5384   02B9 0000
        DECR    R0                              ; 5386   0010
        BLT     L_5393                          ; 5387   0205 000A

        MVO@    R1,     R4                      ; 5389   0261
        MVO@    R1,     R4                      ; 538A   0261
        DECR    R0                              ; 538B   0010
        BLT     L_5393                          ; 538C   0205 0005

        MVO@    R1,     R4                      ; 538E   0261
        DECR    R0                              ; 538F   0010
        BLT     L_5393                          ; 5390   0205 0001

        MVO@    R1,     R4                      ; 5392   0261
L_5393:
        PULR    R7                              ; 5393   02B7

L_5394:
        PSHR    R5                              ; 5394   0275
        MVII    #$0002, R0                      ; 5395   02B8 0002

        JSR     R5,     X_RAND1                 ; 5397   0004 0114 027D

        ADDI    #$0004, R0                      ; 539A   02F8 0004
        CMPI    #$0005, R0                      ; 539C   0378 0005
        BEQ     L_53EB                          ; 539E   0204 004B

        JSR     R5,     .EXEC.76C               ; 53A0   0004 0114 036C

        MOVR    R0,     R2                      ; 53A3   0082
        ADDI    #$01A4, R2                      ; 53A4   02FA 01A4
        MVI@    R2,     R3                      ; 53A6   0293
        CMPI    #$0001, R3                      ; 53A7   037B 0001
        BEQ     L_53F1                          ; 53A9   0204 0046

        CMPI    #$0004, R3                      ; 53AB   037B 0004
        BEQ     L_54A5                          ; 53AD   0204 00F6

        CMPI    #$0003, R3                      ; 53AF   037B 0003
        BEQ     L_54A5                          ; 53B1   0204 00F2

        TSTR    R3                              ; 53B3   009B
        BEQ     L_540C                          ; 53B4   0204 0056

        MVII    #$0002, R0                      ; 53B6   02B8 0002

        JSR     R5,     X_RAND1                 ; 53B8   0004 0114 027D

        TSTR    R0                              ; 53BB   0080
        BNEQ    L_53EB                          ; 53BC   020C 002D

        MVII    #$0001, R3                      ; 53BE   02BB 0001
        MVO@    R3,     R2                      ; 53C0   0253
        INCR    R1                              ; 53C1   0009
        MVI@    R1,     R0                      ; 53C2   0288
        ADDI    #$0004, R1                      ; 53C3   02F9 0004
        MVI@    R1,     R2                      ; 53C5   028A
        SUBI    #$0005, R1                      ; 53C6   0339 0005
        SDBD                                    ; 53C8   0001
        MVII    #$5B12, R4                      ; 53C9   02BC 0012 005B
L_53CC:
        SDBD                                    ; 53CC   0001
        MVI@    R4,     R3                      ; 53CD   02A3
        CMPR    R0,     R3                      ; 53CE   0143
        BEQ     L_53D6                          ; 53CF   0204 0005

        INCR    R4                              ; 53D1   000C
L_53D2:
        MVI@    R4,     R3                      ; 53D2   02A3
        ADDR    R3,     R4                      ; 53D3   00DC
        B       L_53CC                          ; 53D4   0220 0009

L_53D6:
        MVI@    R4,     R3                      ; 53D6   02A3
        CMPR    R2,     R3                      ; 53D7   0153
        BNEQ    L_53D2                          ; 53D8   022C 0007

        INCR    R4                              ; 53DA   000C
        MVI@    R4,     R3                      ; 53DB   02A3
        MVI@    R4,     R0                      ; 53DC   02A0
        CMPI    #$033D, R1                      ; 53DD   0379 033D
        BEQ     L_53EC                          ; 53DF   0204 000B

L_53E1:
        JSR     R5,     X_RAND2                 ; 53E1   0004 0114 029E
        DECLE   $0048,  $00C4,  $0001,  $02A2   ; 53E4   0048 00C4 0001 02A2
        DECLE   $0004,  $0154,  $0191           ; 53E8   0004 0154 0191
L_53EB:
        PULR    R7                              ; 53EB   02B7

L_53EC:
        SLL     R0,     1                       ; 53EC   0048
        ADDR    R0,     R4                      ; 53ED   00C4
        MOVR    R3,     R0                      ; 53EE   0098
        B       L_53E1                          ; 53EF   0220 000F

L_53F1:
        MVI     G_0103, R0                      ; 53F1   0280 0103
        CMPI    #$0003, R0                      ; 53F3   0378 0003
        BEQ     L_53FF                          ; 53F5   0204 0008

        MVII    #$0005, R0                      ; 53F7   02B8 0005

        JSR     R5,     X_RAND1                 ; 53F9   0004 0114 027D

        TSTR    R0                              ; 53FC   0080
        BNEQ    L_54A5                          ; 53FD   020C 00A6

L_53FF:
        PSHR    R1                              ; 53FF   0271
        MVII    #$0335, R1                      ; 5400   02B9 0335

        JSR     R5,     .EXEC.760               ; 5402   0004 0114 0360

        PULR    R1                              ; 5405   02B1
        BNEQ    L_54A5                          ; 5406   020C 009D

        JSR     R5,     L_5C59                  ; 5408   0004 015C 0059

        PULR    R7                              ; 540B   02B7

L_540C:
        MVII    #$0001, R3                      ; 540C   02BB 0001
        MVO@    R3,     R2                      ; 540E   0253
        MOVR    R1,     R2                      ; 540F   008A
        SDBD                                    ; 5410   0001
        MVII    #$54A6, R1                      ; 5411   02B9 00A6 0054

        JSR     R5,     X_INIT_MOB              ; 5414   0004 0114 02B2

        MOVR    R2,     R1                      ; 5417   0091
        MVII    #$0002, R0                      ; 5418   02B8 0002

        JSR     R5,     X_RAND1                 ; 541A   0004 0114 027D

        CMPI    #$0002, R0                      ; 541D   0378 0002
        BGT     L_543F                          ; 541F   020E 001E
        BEQ     L_5439                          ; 5421   0204 0016

        DECR    R0                              ; 5423   0010
        BEQ     L_542C                          ; 5424   0204 0006

        MVII    #$00A7, R2                      ; 5426   02BA 00A7
        MVII    #$0007, R4                      ; 5428   02BC 0007
        B       L_542F                          ; 542A   0200 0003

L_542C:
        CLRR    R2                              ; 542C   01D2
        MVII    #$000F, R4                      ; 542D   02BC 000F
L_542F:
        MVII    #$0049, R0                      ; 542F   02B8 0049

        JSR     R5,     X_RAND2                 ; 5431   0004 0114 029E

        ADDI    #$000F, R0                      ; 5434   02F8 000F
        MOVR    R0,     R3                      ; 5436   0083
        B       L_544A                          ; 5437   0200 0011

L_5439:
        MVII    #$0067, R3                      ; 5439   02BB 0067
        MVII    #$0003, R4                      ; 543B   02BC 0003
        B       L_5442                          ; 543D   0200 0003

L_543F:
        CLRR    R3                              ; 543F   01DB
        MVII    #$000B, R4                      ; 5440   02BC 000B
L_5442:
        MVII    #$0089, R0                      ; 5442   02B8 0089

        JSR     R5,     X_RAND2                 ; 5444   0004 0114 029E

        ADDI    #$000F, R0                      ; 5447   02F8 000F
        MOVR    R0,     R2                      ; 5449   0082
L_544A:
        SWAP    R2,     1                       ; 544A   0042
        SWAP    R3,     1                       ; 544B   0043
        ADDI    #$0002, R1                      ; 544C   02F9 0002
        MVO@    R2,     R1                      ; 544E   024A
        INCR    R1                              ; 544F   0009
        MVO@    R3,     R1                      ; 5450   024B
        INCR    R1                              ; 5451   0009
        PSHR    R1                              ; 5452   0271
        MVII    #$0003, R0                      ; 5453   02B8 0003

        JSR     R5,     X_RAND2                 ; 5455   0004 0114 029E

        ADDR    R4,     R0                      ; 5458   00E0
        MOVR    R0,     R1                      ; 5459   0081
        MVII    #$0002, R0                      ; 545A   02B8 0002

        JSR     R5,     X_RAND1                 ; 545C   0004 0114 027D

        ADDI    #$0003, R0                      ; 545F   02F8 0003

        JSR     R5,     .EXEC.629               ; 5461   0004 0114 0229

        PULR    R1                              ; 5464   02B1
        MVO@    R0,     R1                      ; 5465   0248
        ADDI    #$0002, R1                      ; 5466   02F9 0002
        MVII    #$001E, R0                      ; 5468   02B8 001E
        MVO@    R0,     R1                      ; 546A   0248
        ADDI    #$0001, R1                      ; 546B   02F9 0001
        SDBD                                    ; 546D   0001
        MVII    #$569F, R0                      ; 546E   02B8 009F 0056
        MVO@    R0,     R1                      ; 5471   0248
        PULR    R7                              ; 5472   02B7

        PSHR    R5                              ; 5473   0275
        MOVR    R0,     R2                      ; 5474   0082
        ADDI    #$01A4, R2                      ; 5475   02FA 01A4
        MVI@    R2,     R0                      ; 5477   0290
        TSTR    R0                              ; 5478   0080
        BEQ     L_54A5                          ; 5479   0204 002A

        CMPI    #$0004, R0                      ; 547B   0378 0004
        BEQ     L_54A5                          ; 547D   0204 0026

        CMPI    #$0003, R0                      ; 547F   0378 0003
        BEQ     L_54A5                          ; 5481   0204 0022

        CLRR    R0                              ; 5483   01C0
        MVO@    R0,     R2                      ; 5484   0250
        MVI@    R1,     R0                      ; 5485   0288
        SDBD                                    ; 5486   0001
        ANDI    #$E7FF, R0                      ; 5487   03B8 00FF 00E7
        MVO@    R0,     R1                      ; 548A   0248
        ADDI    #$0004, R1                      ; 548B   02F9 0004
        CLRR    R2                              ; 548D   01D2
        MVO@    R2,     R1                      ; 548E   024A
        ADDI    #$0002, R1                      ; 548F   02F9 0002
        MVO@    R2,     R1                      ; 5491   024A
        ANDI    #$0008, R0                      ; 5492   03B8 0008
        BEQ     L_549E                          ; 5494   0204 0008

        ADDI    #$0002, R1                      ; 5496   02F9 0002
        MVI@    R1,     R0                      ; 5498   0288
        SDBD                                    ; 5499   0001
        ANDI    #$E7FF, R0                      ; 549A   03B8 00FF 00E7
        MVO@    R0,     R1                      ; 549D   0248
L_549E:
        SDBD                                    ; 549E   0001
        MVII    #$5024, R1                      ; 549F   02B9 0024 0050

        JSR     R5,     .EXEC.81E               ; 54A2   0004 0118 001E

L_54A5:
        PULR    R7                              ; 54A5   02B7

        DECLE   $0055,  $0038,  $00B6,  $0054   ; 54A6   0055 0038 00B6 0054
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54AA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54AE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54B2   0000 0000 0000 0000
        DECLE   $0273,  $0054,  $0095,  $0055   ; 54B6   0273 0054 0095 0055
        DECLE   $0010,  $0000,  $0000,  $0273   ; 54BA   0010 0000 0000 0273
        DECLE   $0054,  $0095,  $0055,  $0010   ; 54BE   0054 0095 0055 0010
        DECLE   $0020,  $0000,  $0045,  $0038   ; 54C2   0020 0000 0045 0038
        DECLE   $00D4,  $0054,  $0000,  $004F   ; 54C6   00D4 0054 0000 004F
        DECLE   $0000,  $002F,  $0000,  $0000   ; 54CA   0000 002F 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54CE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0300,  $0000   ; 54D2   0000 0000 0300 0000
        DECLE   $0000,  $0000,  $0001,  $0026   ; 54D6   0000 0000 0001 0026
        DECLE   $0000,  $0000                   ; 54DA   0000 0000
L_54DC:
        PSHR    R5                              ; 54DC   0275
        MVII    #$031D, R2                      ; 54DD   02BA 031D
        SDBD                                    ; 54DF   0001
        MVII    #$54C4, R1                      ; 54E0   02B9 00C4 0054

        JSR     R5,     X_INIT_MOB              ; 54E3   0004 0114 02B2

        PULR    R7                              ; 54E6   02B7

        PSHR    R5                              ; 54E7   0275
        MOVR    R0,     R1                      ; 54E8   0081
        CLRR    R0                              ; 54E9   01C0
        TSTR    R1                              ; 54EA   0089
        BLT     L_54F2                          ; 54EB   0205 0005

        MVII    #$000F, R0                      ; 54ED   02B8 000F

        JSR     R5,     .EXEC.629               ; 54EF   0004 0114 0229

L_54F2:
        MVO     R0,     G_0321                  ; 54F2   0240 0321
        PULR    R7                              ; 54F4   02B7

L_54F5:
        PSHR    R5                              ; 54F5   0275

        JSR     R5,     X_PLAY_SFX1             ; 54F6   0004 0118 03BB
        DECLE   $0079                           ; 54F9  SFX data
        DECLE   $03ED                           ; 54FA  SFX data
        DECLE   $03B7                           ; 54FB  SFX data
        DECLE   $018C,  $0000                   ; 54FC  SFX data
        DECLE   $000B                           ; 54FE  SFX data
        DECLE   $000F,  $03FF                   ; 54FF  SFX data
        DECLE   $008F,  $003F                   ; 5501  SFX data
        DECLE   $03CF                           ; 5503  SFX end

L_5504:
        PSHR    R5                              ; 5504   0275

        JSR     R5,     X_PLAY_SFX1             ; 5505   0004 0118 03BB
        DECLE   $0309                           ; 5508  SFX data
        DECLE   $03ED                           ; 5509  SFX data
        DECLE   $0040,  $0100                   ; 550A  SFX data
        DECLE   $0048,  $0140                   ; 550C  SFX data
        DECLE   $0044,  $0300                   ; 550E  SFX data
        DECLE   $0001,  $0043                   ; 5510  SFX data
        DECLE   $000C,  $0000                   ; 5512  SFX data
        DECLE   $000B                           ; 5514  SFX data
        DECLE   $008F,  $00BF                   ; 5515  SFX data
        DECLE   $00CF                           ; 5517  SFX end


        JSR     R5,     L_5D63                  ; 5518   0004 015C 0163

        PULR    R7                              ; 551B   02B7

L_551C:
        PSHR    R5                              ; 551C   0275

        JSR     R5,     X_PLAY_SFX1             ; 551D   0004 0118 03BB
        DECLE   $01C9                           ; 5520  SFX data
        DECLE   $030D                           ; 5521  SFX data
        DECLE   $021D                           ; 5522  SFX data
        DECLE   $03C0,  $0060                   ; 5523  SFX data
        DECLE   $02C8,  $0080                   ; 5525  SFX data
        DECLE   $02D5                           ; 5527  SFX data
        DECLE   $0001,  $0040                   ; 5528  SFX data
        DECLE   $03D2                           ; 552A  SFX data
        DECLE   $03EA                           ; 552B  SFX data
        DECLE   $03E6                           ; 552C  SFX data
        DECLE   $0103,  $03D0                   ; 552D  SFX data
        DECLE   $008F,  $001F                   ; 552F  SFX data
        DECLE   $02CF                           ; 5531  SFX end

L_5532:
        PSHR    R5                              ; 5532   0275

        JSR     R5,     X_PLAY_SFX2             ; 5533   0004 0118 03BE
        DECLE   $0041                           ; 5536  SFX prio
        DECLE   $0389                           ; 5537  SFX data
        DECLE   $02C0,  $0200                   ; 5538  SFX data
        DECLE   $02C8,  $0280                   ; 553A  SFX data
        DECLE   $02C4,  $0300                   ; 553C  SFX data
        DECLE   $0001,  $03E3                   ; 553E  SFX data
        DECLE   $008F,  $001F                   ; 5540  SFX data
        DECLE   $03F9                           ; 5542  SFX data
        DECLE   $0077,  $0047,  $0055           ; 5543  SFX data
        DECLE   $02CF                           ; 5546  SFX end

UC_5547:
        MVO     R4,     G_035F                  ; 5547  SLIB UCALL target
        MVII    #$0196, R4                      ; 5549   02BC 0196
        SDBD                                    ; 554B   0001
        MVI@    R4,     R1                      ; 554C   02A1
        MVII    #$003D, R0                      ; 554D   02B8 003D
L_554F:
        SUBI    #$0014, R0                      ; 554F   0338 0014
        SDBD                                    ; 5551   0001
        SUBI    #$0FA1, R1                      ; 5552   0339 00A1 000F
        BGT     L_554F                          ; 5555   022E 0007

        MVO     R0,     G_014A                  ; 5557   0240 014A
        PULR    R5                              ; 5559   02B5
        PULR    R7                              ; 555A   02B7

L_555B:
        PSHR    R5                              ; 555B   0275

        JSR     R5,     X_PLAY_SFX1             ; 555C   0004 0118 03BB
        DECLE   $00CF                           ; 555F  SFX end


        CLRR    R0                              ; 5560   01C0

        JSR     R5,     X_PLAY_SFX1             ; 5561   0004 0118 03BB
        DECLE   $0009                           ; 5564  SFX data
        DECLE   $03B7                           ; 5565  SFX data
        DECLE   $000B                           ; 5566  SFX data
        DECLE   $03CF                           ; 5567  SFX end

L_5568:
        PSHR    R5                              ; 5568   0275

        JSR     R5,     X_PLAY_SFX2             ; 5569   0004 0118 03BE
        DECLE   $0021                           ; 556C  SFX prio
        DECLE   $03F9,  $008F,  $003F           ; 556D   03F9 008F 003F

        XOR@    R5,     R1                      ; 5570   03E9
        MVI     G_0040, R0                      ; 5571   0280 0040
        XORR    R5,     R3                      ; 5573   01EB
        ADD@    R1,     R7                      ; 5574   02CF

L_5575:
        PSHR    R5                              ; 5575   0275
        MVII    #$0002, R0                      ; 5576   02B8 0002
        MVO     R0,     G_0147                  ; 5578   0240 0147
        CLRR    R0                              ; 557A   01C0

        JSR     R5,     X_PLAY_SFX1             ; 557B   0004 0118 03BB
        DECLE   $03E9                           ; 557E  SFX data
        DECLE   $03C0,  $0200                   ; 557F  SFX data
        DECLE   $0001,  $03E0                   ; 5581  SFX data
        DECLE   $008F,  $001F                   ; 5583  SFX data
        DECLE   $0001,  $0000                   ; 5585  SFX data
        DECLE   $008F,  $008B                   ; 5587  SFX data
        DECLE   $0001,  $0040                   ; 5589  SFX data
        DECLE   $03F2                           ; 558B  SFX data
        DECLE   $008F,  $003F                   ; 558C  SFX data
        DECLE   $03F9                           ; 558E  SFX data
        DECLE   $0023,  $03F4                   ; 558F  SFX data
        DECLE   $0275                           ; 5591  SFX data
        DECLE   $0094,  $0200                   ; 5592  SFX data
        DECLE   $0006                           ; 5594  SFX data
        DECLE   $0275                           ; 5595  SFX data
        DECLE   $02F9                           ; 5596  SFX data
        DECLE   $0007                           ; 5597  SFX data
        DECLE   $028C,  $0339                   ; 5598  SFX data
        DECLE   $0007                           ; 559A  SFX data
        DECLE   $0004,  $0154                   ; 559B  SFX data
        DECLE   $0227                           ; 559D  SFX data
        DECLE   $02A0,  $0378                   ; 559E  SFX data
        DECLE   $00FF                           ; 55A0  Unknown
        DECLE   $0204,  $0052                   ; 55A1  SFX data
        DECLE   $0004,  $0154                   ; 55A3  SFX data
        DECLE   $0201,  $0271                   ; 55A5  SFX data
        DECLE   $02A0,  $004C                   ; 55A7  SFX data
        DECLE   $0040,  $0004                   ; 55A9  SFX data
        DECLE   $0114,  $0357                   ; 55AB  SFX data
        DECLE   $0064,  $0004                   ; 55AD  SFX data
        DECLE   $0114,  $0229                   ; 55AF  SFX data
        DECLE   $02B1,  $02F9                   ; 55B1  SFX data
        DECLE   $0004,  $0248                   ; 55B3  SFX data
        DECLE   $02F9                           ; 55B5  SFX data
        DECLE   $0002                           ; 55B6  SFX data
        DECLE   $02A0,  $0004                   ; 55B7  SFX data
        DECLE   $0114,  $0268                   ; 55B9  SFX data
        DECLE   $0080,  $020D                   ; 55BB  SFX data
        DECLE   $0005                           ; 55BD  SFX data
        DECLE   $0020,  $0010                   ; 55BE  SFX data
        DECLE   $0248,  $0200                   ; 55C0  SFX data
        DECLE   $0020,  $0248                   ; 55C2  SFX data
        DECLE   $02A0,  $0048                   ; 55C4  SFX data
        DECLE   $004C,  $02F9                   ; 55C6  SFX data
        DECLE   $0006                           ; 55C8  SFX data
        DECLE   $0248,  $0339                   ; 55C9  SFX data
        DECLE   $0004,  $02A0                   ; 55CB  SFX data
        DECLE   $0004,  $0154                   ; 55CD  SFX data
        DECLE   $0201,  $0339                   ; 55CF  SFX data
        DECLE   $0008,  $0288                   ; 55D1  SFX data
        DECLE   $03F8,  $0008                   ; 55D3  SFX data
        DECLE   $0248,  $0004                   ; 55D5  SFX data
        DECLE   $0154,  $0250                   ; 55D7  SFX data
        DECLE   $02F9                           ; 55D9  SFX data
        DECLE   $0007                           ; 55DA  SFX data
        DECLE   $024C,  $0004                   ; 55DB  SFX data
        DECLE   $0114,  $0366                   ; 55DD  SFX data
        DECLE   $0004,  $0114                   ; 55DF  SFX data
        DECLE   $001C,  $02B7                   ; 55E1  SFX data
        DECLE   $0339                           ; 55E3  SFX data
        DECLE   $0006                           ; 55E4  SFX data
        DECLE   $0379                           ; 55E5  SFX data
        DECLE   $033D                           ; 55E6  SFX data
        DECLE   $022C,  $0012                   ; 55E7  SFX data
        DECLE   $02F9                           ; 55E9  SFX data
        DECLE   $0008,  $0288                   ; 55EA  SFX data
        DECLE   $0001,  $03B8                   ; 55EC  SFX data
        DECLE   $00FF                           ; 55EE  Unknown
        DECLE   $00E7                           ; 55EF  SFX data
        DECLE   $0248,  $0339                   ; 55F0  SFX data
        DECLE   $0008,  $0220                   ; 55F2  SFX data
        DECLE   $001E                           ; 55F4  SFX data
        DECLE   $0004,  $0114                   ; 55F5  SFX data
        DECLE   $0366                           ; 55F7  SFX data
        DECLE   $0001,  $02F8                   ; 55F8  SFX data
        DECLE   $00A4,  $0001                   ; 55FA  SFX data
        DECLE   $0082                           ; 55FC  SFX data
        DECLE   $02B8,  $0002                   ; 55FD  SFX data
        DECLE   $0250,  $02B7                   ; 55FF  SFX data
        DECLE   $0275                           ; 5601  SFX data
        DECLE   $0272                           ; 5602  SFX data
        DECLE   $0082                           ; 5603  SFX data
        DECLE   $03BA                           ; 5604  SFX data
        DECLE   $000F,  $02F9                   ; 5605  SFX data
        DECLE   $0005                           ; 5607  SFX data
        DECLE   $024A                           ; 5608  SFX data
        DECLE   $0339                           ; 5609  SFX data
        DECLE   $0004,  $0064                   ; 560A  SFX data
        DECLE   $0064,  $0082                   ; 560C  SFX data
        DECLE   $0048,  $004C                   ; 560E  SFX data
        DECLE   $0110,  $0001                   ; 5610  SFX data
        DECLE   $02F8,  $00B6                   ; 5612  SFX data
        DECLE   $0054,  $0248                   ; 5614  SFX data
        DECLE   $0011,  $02A0                   ; 5616  SFX data
        DECLE   $0040,  $0060                   ; 5618  SFX data
        DECLE   $03C8,  $0001                   ; 561A  SFX data
        DECLE   $03B8,  $0088                   ; 561C  SFX data
        DECLE   $003F                           ; 561E  Unknown
        DECLE   $03C8,  $0001                   ; 561F  SFX data
        DECLE   $03F8,  $0000                   ; 5621  SFX data
        DECLE   $0018,  $0248                   ; 5623  SFX data
        DECLE   $02B2                           ; 5625  SFX data
        DECLE   $02B7                           ; 5626  SFX data
        DECLE   $0275                           ; 5627  SFX data
        DECLE   $0270,  $0271                   ; 5628  SFX data
        DECLE   $0004,  $0114                   ; 562A  SFX data
        DECLE   $0377,  $0288,  $0081           ; 562C  SFX data
        DECLE   $0001,  $03B8                   ; 562F  SFX data
        DECLE   $0000,  $0020                   ; 5631  SFX data
        DECLE   $0204,  $0002                   ; 5633  SFX data
        DECLE   $02FA                           ; 5635  SFX data
        DECLE   $0004,  $0088                   ; 5636  SFX data
        DECLE   $03B8,  $0080                   ; 5638  SFX data
        DECLE   $0204,  $0002                   ; 563A  SFX data
        DECLE   $02FB                           ; 563C  SFX data
        DECLE   $0004,  $03B9                   ; 563D  SFX data
        DECLE   $0008,  $0204                   ; 563F  SFX data
        DECLE   $000B                           ; 5641  SFX data
        DECLE   $02B1,  $0271                   ; 5642  SFX data
        DECLE   $02F9                           ; 5644  SFX data
        DECLE   $000C,  $0288                   ; 5645  SFX data
        DECLE   $0060,  $0004                   ; 5647  SFX data
        DECLE   $0114,  $0357                   ; 5649  SFX data
        DECLE   $00C2                           ; 564B  SFX data
        DECLE   $00CB                           ; 564C  SFX data
        DECLE   $02B1,  $02B0                   ; 564D  SFX data
        DECLE   $02B7                           ; 564F  SFX data
        DECLE   $0275                           ; 5650  SFX data
        DECLE   $0270,  $0271                   ; 5651  SFX data
        DECLE   $0288,  $0081                   ; 5653  SFX data
        DECLE   $0001,  $03B8                   ; 5655  SFX data
        DECLE   $0000,  $0020                   ; 5657  SFX data
        DECLE   $0204,  $0002                   ; 5659  SFX data
        DECLE   $033A                           ; 565B  SFX data
        DECLE   $0004,  $0088                   ; 565C  SFX data
        DECLE   $03B8,  $0080                   ; 565E  SFX data
        DECLE   $0204,  $0002                   ; 5660  SFX data
        DECLE   $033B                           ; 5662  SFX data
        DECLE   $0004,  $03B9                   ; 5663  SFX data
        DECLE   $0008,  $0204                   ; 5665  SFX data
        DECLE   $000B                           ; 5667  SFX data
        DECLE   $02B1,  $0271                   ; 5668  SFX data
        DECLE   $02F9                           ; 566A  SFX data
        DECLE   $000C,  $0288                   ; 566B  SFX data
        DECLE   $0060,  $0004                   ; 566D  SFX data
        DECLE   $0114,  $0357                   ; 566F  SFX data
        DECLE   $0102                           ; 5671  SFX data
        DECLE   $010B                           ; 5672  SFX data
        DECLE   $02B1,  $02F9                   ; 5673  SFX data
        DECLE   $0002                           ; 5675  SFX data
        DECLE   $0042                           ; 5676  SFX data
        DECLE   $024A                           ; 5677  SFX data
        DECLE   $0009                           ; 5678  SFX data
        DECLE   $0043,  $024B                   ; 5679  SFX data
        DECLE   $0339                           ; 567B  SFX data
        DECLE   $0003,  $02B0                   ; 567C  SFX data
        DECLE   $02B7                           ; 567E  SFX data
        DECLE   $0001,  $0000                   ; 567F  SFX data
        DECLE   $0094,  $03FD                   ; 5681  SFX data
        DECLE   $0002                           ; 5683  SFX data
        DECLE   $0001,  $0114                   ; 5684  SFX data
        DECLE   $03FD                           ; 5686  SFX data
        DECLE   $0001,  $0008                   ; 5687  SFX data
        DECLE   $0194,  $03FD                   ; 5689  SFX data
        DECLE   $0000,  $0048                   ; 568B  SFX data
        DECLE   $0214,  $03FD                   ; 568D  SFX data
        DECLE   $0001,  $000C                   ; 568F  SFX data
        DECLE   $0294,  $03FD                   ; 5691  SFX data
        DECLE   $0002                           ; 5693  SFX data
        DECLE   $0005                           ; 5694  SFX data
        DECLE   $0314,  $03FD                   ; 5695  SFX data
        DECLE   $0001,  $0004                   ; 5697  SFX data
        DECLE   $0394,  $03FD                   ; 5699  SFX data
        DECLE   $0000,  $0040                   ; 569B  SFX data
        DECLE   $0385                           ; 569D  SFX data
        DECLE   $03E6                           ; 569E  SFX data
        DECLE   $00FF                           ; 569F  Unknown
        DECLE   $0001,  $0004                   ; 56A0  SFX data
        DECLE   $0194,  $03FD                   ; 56A2  SFX data
        DECLE   $0002                           ; 56A4  SFX data
        DECLE   $0005                           ; 56A5  SFX data
        DECLE   $0114,  $03FD                   ; 56A6  SFX data
        DECLE   $0001,  $000C                   ; 56A8  SFX data
        DECLE   $0094,  $03FD                   ; 56AA  SFX data
        DECLE   $0000,  $0048                   ; 56AC  SFX data
        DECLE   $0014,  $03FD                   ; 56AE  SFX data
        DECLE   $0001,  $0008                   ; 56B0  SFX data
        DECLE   $0394,  $03FD                   ; 56B2  SFX data
        DECLE   $0002                           ; 56B4  SFX data
        DECLE   $0001,  $0314                   ; 56B5  SFX data
        DECLE   $03FD                           ; 56B7  SFX data
        DECLE   $0001,  $0000                   ; 56B8  SFX data
        DECLE   $0294,  $03FD                   ; 56BA  SFX data
        DECLE   $0000,  $0040                   ; 56BC  SFX data
        DECLE   $0285                           ; 56BE  SFX data
        DECLE   $03E6                           ; 56BF  SFX data
        DECLE   $00FF                           ; 56C0  Unknown
        DECLE   $0000,  $0040                   ; 56C1  SFX data
        DECLE   $004F,  $03FC                   ; 56C3  SFX data
        DECLE   $0001,  $0000                   ; 56C5  SFX data
        DECLE   $00CF                           ; 56C7  SFX end

        DECLE   $03FC,  $0003,  $0000,  $014F   ; 56C8   03FC 0003 0000 014F
        DECLE   $03FC,  $0004,  $0001,  $0185   ; 56CC   03FC 0004 0001 0185
        DECLE   $0003,  $0100,  $0005,  $0001   ; 56D0   0003 0100 0005 0001
        DECLE   $00FF,  $0007,  $0001,  $01CF   ; 56D4   00FF 0007 0001 01CF
        DECLE   $0003,  $0100,  $0008,  $0001   ; 56D8   0003 0100 0008 0001
        DECLE   $0006,  $0040,  $0207,  $000F   ; 56DC   0006 0040 0207 000F
        DECLE   $0001,  $0006,  $0048,  $00FF   ; 56E0   0001 0006 0048 00FF
        DECLE   $00FF,  $000A,  $0040,  $0308   ; 56E4   00FF 000A 0040 0308
        DECLE   $03F7,  $0009,  $0040,  $030A   ; 56E8   03F7 0009 0040 030A
        DECLE   $0000,  $0200,  $0009,  $0044   ; 56EC   0000 0200 0009 0044
        DECLE   $00FF,  $000B,  $0048,  $0108   ; 56F0   00FF 000B 0048 0108
        DECLE   $03F7,  $000C,  $0040,  $010A   ; 56F4   03F7 000C 0040 010A
        DECLE   $0000,  $0200,  $000D,  $0040   ; 56F8   0000 0200 000D 0040
        DECLE   $00FF,  $0001,  $0000,  $0094   ; 56FC   00FF 0001 0000 0094
        DECLE   $03FD,  $0002,  $0001,  $0114   ; 5700   03FD 0002 0001 0114
        DECLE   $03FD,  $0001,  $0008,  $0194   ; 5704   03FD 0001 0008 0194
        DECLE   $03FD,  $000F,  $0001,  $0214   ; 5708   03FD 000F 0001 0214

        XORI    #$000E, R4                      ; 570C   03FC 000E
        SWAP    R0,     1                       ; 570E   0040
        MVI@    R1,     R7                      ; 570F   028F

        XORI    #$000B, R1                      ; 5710   03F9 000B
        SWAP    R0,     1                       ; 5712   0040
        SUB     G_03FF, R7                      ; 5713   0307 03FF

        DECLE   $00FF,  $0006,  $0040,  $0207   ; 5715   00FF 0006 0040 0207
        DECLE   $000F,  $0001,  $0006,  $0048   ; 5719   000F 0001 0006 0048
        DECLE   $00FF,  $00FF,  $0000,  $0040   ; 571D   00FF 00FF 0000 0040
        DECLE   $024F,  $03FC,  $0001,  $0000   ; 5721   024F 03FC 0001 0000
        DECLE   $02CF,  $03FC,  $0010,  $0004   ; 5725   02CF 03FC 0010 0004
        DECLE   $034F,  $03FC,  $0012,  $0005   ; 5729   034F 03FC 0012 0005
        DECLE   $0385,  $0000,  $0100,  $0011   ; 572D   0385 0000 0100 0011
        DECLE   $0005,  $00FF,  $0046,  $0000   ; 5731   0005 00FF 0046 0000
        DECLE   $0043,  $0057,  $0000,  $0000   ; 5735   0043 0057 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5739   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 573D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5741   0000 0000 0000 0000
        DECLE   $00C3,  $0057,  $0001,  $0028   ; 5745   00C3 0057 0001 0028
        DECLE   $0000,  $0100,  $0000,  $0083   ; 5749   0000 0100 0000 0083
        DECLE   $0058,  $0004                   ; 574D   0058 0004

        ADCR    R2                              ; 574F   002A
        INCR    R0                              ; 5750   0008
        XORR    R6,     R4                      ; 5751   01F4
        RLC     R3,     2                       ; 5752   0057
        XORR    R6,     R4                      ; 5753   01F4
        CMPR    R2,     R7                      ; 5754   0157
        XOR@    R6,     R4                      ; 5755   03F4
        RLC     R3,     2                       ; 5756   0057
        XOR@    R6,     R4                      ; 5757   03F4
        CMPR    R2,     R7                      ; 5758   0157
L_5759:
        PSHR    R5                              ; 5759   0275
        MVII    #$0325, R2                      ; 575A   02BA 0325
        SDBD                                    ; 575C   0001
        MVII    #$5733, R1                      ; 575D   02B9 0033 0057

        JSR     R5,     X_INIT_MOB              ; 5760   0004 0114 02B2

        MVII    #$032D, R2                      ; 5763   02BA 032D

        JSR     R5,     X_INIT_MOB              ; 5765   0004 0114 02B2

        PULR    R7                              ; 5768   02B7

        PSHR    R5                              ; 5769   0275
        MVII    #$0325, R4                      ; 576A   02BC 0325
        MVI@    R4,     R1                      ; 576C   02A1
        SDBD                                    ; 576D   0001
        ANDI    #$1000, R1                      ; 576E   03B9 0000 0010
        BNEQ    L_5799                          ; 5771   020C 0026

        ADDI    #$0007, R4                      ; 5773   02FC 0007
        MVI@    R4,     R1                      ; 5775   02A1
        SDBD                                    ; 5776   0001
        ANDI    #$1000, R1                      ; 5777   03B9 0000 0010
        BNEQ    L_5799                          ; 577A   020C 001D

        SUBI    #$0009, R4                      ; 577C   033C 0009
        MVI@    R4,     R1                      ; 577E   02A1
        SDBD                                    ; 577F   0001
        XORI    #$1000, R1                      ; 5780   03F9 0000 0010
        DECR    R4                              ; 5783   0014
        MVO@    R1,     R4                      ; 5784   0261
        ADDI    #$0007, R4                      ; 5785   02FC 0007
        MVO@    R1,     R4                      ; 5787   0261
        SUBI    #$0007, R4                      ; 5788   033C 0007
        MVII    #$007F, R0                      ; 578A   02B8 007F

        JSR     R5,     L_579A                  ; 578C   0004 0154 039A

        MVII    #$032F, R4                      ; 578F   02BC 032F
        MVII    #$0028, R0                      ; 5791   02B8 0028

        JSR     R5,     L_579A                  ; 5793   0004 0154 039A
        JSR     R5,     L_551C                  ; 5796   0004 0154 011C

L_5799:
        PULR    R7                              ; 5799   02B7

L_579A:
        PSHR    R5                              ; 579A   0275
        SWAP    R0,     1                       ; 579B   0040
        MVO@    R0,     R4                      ; 579C   0260
        MVII    #$0067, R0                      ; 579D   02B8 0067
        SWAP    R0,     1                       ; 579F   0040
        MVO@    R0,     R4                      ; 57A0   0260
        SUBI    #$0002, R4                      ; 57A1   033C 0002
        MVII    #$031D, R1                      ; 57A3   02B9 031D

        JSR     R5,     .EXEC.777               ; 57A5   0004 0114 0377

        ADDI    #$0004, R2                      ; 57A8   02FA 0004
        MVO     R2,     G_01AC                  ; 57AA   0242 01AC
        MVO     R3,     G_01AD                  ; 57AC   0243 01AD
        PSHR    R4                              ; 57AE   0274

        JSR     R5,     .EXEC.7A3               ; 57AF   0004 0114 03A3

        SLR     R2,     1                       ; 57B2   0062
        MVI     G_01AC, R0                      ; 57B3   0280 01AC
        MVI     G_01AD, R1                      ; 57B5   0281 01AD

        JSR     R5,     X_PACK_BYTES            ; 57B7   0004 0114 034F

        MOVR    R2,     R3                      ; 57BA   0093
        MOVR    R0,     R2                      ; 57BB   0082
        PULR    R1                              ; 57BC   02B1
        SUBI    #$0002, R1                      ; 57BD   0339 0002

        JSR     R5,     .EXEC.9A8               ; 57BF   0004 0118 01A8

        PULR    R7                              ; 57C2   02B7

        PSHR    R5                              ; 57C3   0275
        MVII    #$0325, R4                      ; 57C4   02BC 0325
        SDBD                                    ; 57C6   0001
        MVII    #$3852, R1                      ; 57C7   02B9 0052 0038
        MVO@    R1,     R4                      ; 57CA   0261
        SDBD                                    ; 57CB   0001
        MVII    #$574A, R0                      ; 57CC   02B8 004A 0057
        MVO@    R0,     R4                      ; 57CF   0260
        MVI     G_01AC, R2                      ; 57D0   0282 01AC
        SUBI    #$0004, R2                      ; 57D2   033A 0004
        SWAP    R2,     1                       ; 57D4   0042
        MVO@    R2,     R4                      ; 57D5   0262
        MVI     G_01AD, R3                      ; 57D6   0283 01AD
        SWAP    R3,     1                       ; 57D8   0043
        MVO@    R3,     R4                      ; 57D9   0263
        CLRR    R0                              ; 57DA   01C0
        MVO@    R0,     R4                      ; 57DB   0260
        MVII    #$0001, R0                      ; 57DC   02B8 0001
        MVO@    R0,     R4                      ; 57DE   0260
        MVII    #$0005, R0                      ; 57DF   02B8 0005
        MVO@    R0,     R4                      ; 57E1   0260
        INCR    R4                              ; 57E2   000C
        MVO@    R1,     R4                      ; 57E3   0261
        SDBD                                    ; 57E4   0001
        MVII    #$574A, R0                      ; 57E5   02B8 004A 0057
        MVO@    R0,     R4                      ; 57E8   0260
        MVO@    R2,     R4                      ; 57E9   0262
        MVO@    R3,     R4                      ; 57EA   0263
        CLRR    R0                              ; 57EB   01C0
        MVO@    R0,     R4                      ; 57EC   0260
        MVII    #$0001, R0                      ; 57ED   02B8 0001
        MVO@    R0,     R4                      ; 57EF   0260
        MVII    #$0005, R0                      ; 57F0   02B8 0005
        MVO@    R0,     R4                      ; 57F2   0260
        PULR    R7                              ; 57F3   02B7

        PSHR    R5                              ; 57F4   0275
        MOVR    R3,     R0                      ; 57F5   0098

        JSR     R5,     .EXEC.76C               ; 57F6   0004 0114 036C

        MVI@    R1,     R2                      ; 57F9   028A
        SDBD                                    ; 57FA   0001
        ANDI    #$1000, R2                      ; 57FB   03BA 0000 0010
        BEQ     L_585E                          ; 57FE   0204 005E

        CMPI    #$0005, R0                      ; 5800   0378 0005
        BNEQ    L_5808                          ; 5802   020C 0004

        MVII    #$0004, R0                      ; 5804   02B8 0004
        SUBI    #$0008, R1                      ; 5806   0339 0008
L_5808:
        CMPI    #$0004, R0                      ; 5808   0378 0004
        BNEQ    L_5816                          ; 580A   020C 000A

        ADDI    #$0008, R1                      ; 580C   02F9 0008
        MVI@    R1,     R2                      ; 580E   028A
        SDBD                                    ; 580F   0001
        ANDI    #$EFFF, R2                      ; 5810   03BA 00FF 00EF
        MVO@    R2,     R1                      ; 5813   024A
        SUBI    #$0008, R1                      ; 5814   0339 0008
L_5816:
        MOVR    R0,     R3                      ; 5816   0083
        DECLE   $0001,  $02FB,  $00A4,  $0001   ; 5817   0001 02FB 00A4 0001
        DECLE   $029A,  $037A,  $0004,  $0204   ; 581B   029A 037A 0004 0204
        DECLE   $003E,  $02BA,  $0004,  $025A   ; 581F   003E 02BA 0004 025A
        DECLE   $0004,  $0154,  $0227           ; 5823   0004 0154 0227

        SUBI    #$0004, R2                      ; 5826   033A 0004
        SUBI    #$0004, R3                      ; 5828   033B 0004
        SWAP    R2,     1                       ; 582A   0042
        SWAP    R3,     1                       ; 582B   0043
        MOVR    R2,     R4                      ; 582C   0094
        MOVR    R1,     R2                      ; 582D   008A
        INCR    R1                              ; 582E   0009
        SDBD                                    ; 582F   0001
        MVII    #$574A, R0                      ; 5830   02B8 004A 0057
        MVO@    R0,     R1                      ; 5833   0248
        ADDI    #$0006, R1                      ; 5834   02F9 0006

        JSR     R5,     L_5D82                  ; 5836   0004 015C 0182

        CMPI    #$0003, R0                      ; 5839   0378 0003
        MVII    #$0000, R0                      ; 583B   02B8 0000
        BGT     L_5841                          ; 583D   020E 0002

        MVII    #$0003, R0                      ; 583F   02B8 0003
L_5841:
        MVO@    R0,     R1                      ; 5841   0248

        JSR     R5,     L_5D49                  ; 5842   0004 015C 0149

        MVII    #$0006, R0                      ; 5845   02B8 0006

        JSR     R5,     X_RAND2                 ; 5847   0004 0114 029E

        MOVR    R0,     R1                      ; 584A   0081

        JSR     R5,     L_585F                  ; 584B   0004 0158 005F

        MVII    #$0325, R2                      ; 584E   02BA 0325

        JSR     R5,     L_585F                  ; 5850   0004 0158 005F

        ADDI    #$0002, R2                      ; 5853   02FA 0002

        JSR     R5,     L_585F                  ; 5855   0004 0158 005F
        JSR     R5,     L_54F5                  ; 5858   0004 0154 00F5
        JSR     R5,     L_5C1E                  ; 585B   0004 015C 001E

L_585E:
        PULR    R7                              ; 585E   02B7

L_585F:
        PSHR    R5                              ; 585F   0275
        SDBD                                    ; 5860   0001
        MVII    #$38C7, R0                      ; 5861   02B8 00C7 0038
        MVO@    R0,     R2                      ; 5864   0250
        ADDI    #$0002, R2                      ; 5865   02FA 0002
        MVO@    R4,     R2                      ; 5867   0254
        INCR    R2                              ; 5868   000A
        MVO@    R3,     R2                      ; 5869   0253
        INCR    R2                              ; 586A   000A
        PSHR    R1                              ; 586B   0271
        MVII    #$0005, R0                      ; 586C   02B8 0005

        JSR     R5,     X_RAND2                 ; 586E   0004 0114 029E

        ADDI    #$0008, R0                      ; 5871   02F8 0008
        SLL     R0,     1                       ; 5873   0048

        JSR     R5,     .EXEC.629               ; 5874   0004 0114 0229

        MVO@    R0,     R2                      ; 5877   0250
        PULR    R1                              ; 5878   02B1
        ADDI    #$0005, R1                      ; 5879   02F9 0005
        INCR    R2                              ; 587B   000A
        CLRR    R0                              ; 587C   01C0
        MVO@    R0,     R2                      ; 587D   0250
        INCR    R2                              ; 587E   000A
        MVII    #$0004, R0                      ; 587F   02B8 0004
        MVO@    R0,     R2                      ; 5881   0250
        PULR    R7                              ; 5882   02B7

        PSHR    R5                              ; 5883   0275
        ADDI    #$0005, R1                      ; 5884   02F9 0005
        MVI@    R1,     R3                      ; 5886   028B
        SUBI    #$0005, R1                      ; 5887   0339 0005
        MVI@    R1,     R0                      ; 5889   0288
        SDBD                                    ; 588A   0001
        ANDI    #$DF28, R0                      ; 588B   03B8 0028 00DF
        INCR    R3                              ; 588E   000B
        ADDR    R7,     R3                      ; 588F   00FB
        ADD@    R3,     R7                      ; 5890   02DF

        DECLE   $0004                           ; 5891   0004

        COMR    R3                              ; 5892   001B
        GSWD    R0                              ; 5893   0030
        SWAP    R1,     1                       ; 5894   0041
        SDBD                                    ; 5895   0001
        XORI    #$2046, R0                      ; 5896   03F8 0046 0020
        MVO@    R0,     R1                      ; 5899   0248
        ADDI    #$0003, R1                      ; 589A   02F9 0003
        MVI@    R1,     R0                      ; 589C   0288
        SDBD                                    ; 589D   0001
        ADDI    #$0400, R0                      ; 589E   02F8 0000 0004
        MVO@    R0,     R1                      ; 58A1   0248
        ADDI    #$0002, R1                      ; 58A2   02F9 0002
        MVII    #$0001, R0                      ; 58A4   02B8 0001
        MVO@    R0,     R1                      ; 58A6   0248
        INCR    R1                              ; 58A7   0009
        MVII    #$0004, R0                      ; 58A8   02B8 0004
        MVO@    R0,     R1                      ; 58AA   0248
        PULR    R7                              ; 58AB   02B7

        XORI    #$0052, R0                      ; 58AC   03F8 0052
        MVO@    R0,     R1                      ; 58AE   0248
        ADDI    #$0002, R1                      ; 58AF   02F9 0002
        MVI@    R1,     R0                      ; 58B1   0288
        SDBD                                    ; 58B2   0001
        ADDI    #$0400, R0                      ; 58B3   02F8 0000 0004
        MVO@    R0,     R1                      ; 58B6   0248
        ADDI    #$0003, R1                      ; 58B7   02F9 0003
        MVII    #$0002, R0                      ; 58B9   02B8 0002
        MVO@    R0,     R1                      ; 58BB   0248
        INCR    R1                              ; 58BC   0009
L_58BD:
        MVII    #$0002, R0                      ; 58BD   02B8 0002
        MVO@    R0,     R1                      ; 58BF   0248
        PULR    R7                              ; 58C0   02B7

        XORI    #$0042, R0                      ; 58C1   03F8 0042
        SDBD                                    ; 58C3   0001
        ANDI    #$F7FF, R0                      ; 58C4   03B8 00FF 00F7
        MVO@    R0,     R1                      ; 58C7   0248
        ADDI    #$0005, R1                      ; 58C8   02F9 0005
        MVII    #$0003, R0                      ; 58CA   02B8 0003
        MVO@    R0,     R1                      ; 58CC   0248
        INCR    R1                              ; 58CD   0009
        MVII    #$0003, R0                      ; 58CE   02B8 0003
        MVO@    R0,     R1                      ; 58D0   0248
        PULR    R7                              ; 58D1   02B7

        CMPI    #$033D, R1                      ; 58D2   0379 033D
        BGE     L_58DF                          ; 58D4   020D 0009

        MOVR    R1,     R2                      ; 58D6   008A
        SDBD                                    ; 58D7   0001
        MVII    #$5733, R1                      ; 58D8   02B9 0033 0057

        JSR     R5,     X_INIT_MOB              ; 58DB   0004 0114 02B2

        PULR    R7                              ; 58DE   02B7

L_58DF:
        MOVR    R1,     R2                      ; 58DF   008A
        ADDI    #$0007, R1                      ; 58E0   02F9 0007
        MVI@    R1,     R0                      ; 58E2   0288
        PSHR    R0                              ; 58E3   0270
        SDBD                                    ; 58E4   0001
        MVII    #$54A6, R1                      ; 58E5   02B9 00A6 0054

        JSR     R5,     X_INIT_MOB              ; 58E8   0004 0114 02B2

        CMPI    #$033D, R2                      ; 58EB   037A 033D
        BNEQ    L_58FB                          ; 58ED   020C 000C

        ADDI    #$0008, R2                      ; 58EF   02FA 0008

        JSR     R5,     X_INIT_MOB              ; 58F1   0004 0114 02B2

        MVII    #$0005, R0                      ; 58F4   02B8 0005

        JSR     R5,     .EXEC.6CF               ; 58F6   0004 0114 02CF

        SUBI    #$0008, R2                      ; 58F9   033A 0008
L_58FB:
        MOVR    R2,     R1                      ; 58FB   0091

        JSR     R5,     .EXEC.766               ; 58FC   0004 0114 0366

        MOVR    R0,     R3                      ; 58FF   0083
        SDBD                                    ; 5900   0001
        ADDI    #$01A4, R3                      ; 5901   02FB 00A4 0001
        PULR    R0                              ; 5904   02B0
        MVO@    R0,     R3                      ; 5905   0258

        JSR     R5,     L_5D8A                  ; 5906   0004 015C 018A

        PULR    R7                              ; 5909   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 590A   0000 0000 0000 0000
        DECLE   $001C,  $0008,  $003E,  $0055   ; 590E   001C 0008 003E 0055
        DECLE   $002A,  $0000,  $0000,  $0000   ; 5912   002A 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5916   0000 0000 0000 0000
        DECLE   $0001,  $0001,  $0006,  $0014   ; 591A   0001 0001 0006 0014
        DECLE   $0016,  $0028,  $0068,  $0048   ; 591E   0016 0028 0068 0048
        DECLE   $00B8,  $0000,  $0020,  $0040   ; 5922   00B8 0000 0020 0040
        DECLE   $0040,  $0060,  $0080,  $0080   ; 5926   0040 0060 0080 0080
        DECLE   $0000,  $0004,  $0004,  $0008   ; 592A   0000 0004 0004 0008
        DECLE   $0008,  $0024,  $003C,  $0024   ; 592E   0008 0024 003C 0024
        DECLE   $0008,  $0008,  $0004,  $0004   ; 5932   0008 0008 0004 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5936   0000 0000 0000 0000

        CLRC                                    ; 593A   0006
        INCR    R7                              ; 593B   000F

        DECLE   $001F                           ; 593C   001F
L_593D:
        RSWD    R3                              ; 593D   003B
        DECLE   $003F,  $004E,  $005E,  $0052   ; 593E   003F 004E 005E 0052
        DECLE   $00F0,  $00F0,  $00BC,  $00F8   ; 5942   00F0 00F0 00BC 00F8
        DECLE   $00F8,  $00F0,  $00E0,  $0040   ; 5946   00F8 00F0 00E0 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 594A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0007   ; 594E   0000 0000 0003 0007
        DECLE   $000C,  $001D,  $001F           ; 5952   000C 001D 001F

        DECR    R3                              ; 5955   0013
L_5956:
        DECR    R7                              ; 5956   0017

        DECLE   $001F,  $001D,  $000F,  $0000   ; 5957   001F 001D 000F 0000
        DECLE   $0000,  $0000,  $0000           ; 595B   0000 0000 0000

        ADDR    R6,     R0                      ; 595E   00F0
        MOVR    R7,     R0                      ; 595F   00B8
        ADDR    R5,     R4                      ; 5960   00EC
        ADDR    R7,     R4                      ; 5961   00FC
        ADDR    R7,     R4                      ; 5962   00FC
        ADDR    R7,     R4                      ; 5963   00FC
        RSWD    R4                              ; 5964   003C
        INCR    R0                              ; 5965   0008
        ADDR    R1,     R0                      ; 5966   00C8
        ADDR    R6,     R0                      ; 5967   00F0
        ADDR    R4,     R0                      ; 5968   00E0
        TSTR    R0                              ; 5969   0080
        COMR    R0                              ; 596A   0018
        RSWD    R4                              ; 596B   003C
        RSWD    R4                              ; 596C   003C
        RSWD    R4                              ; 596D   003C
        SAR     R2,     1                       ; 596E   006A
        SAR     R2,     1                       ; 596F   006A
        SARC    R2,     2                       ; 5970   007E
        SARC    R2,     2                       ; 5971   007E
        SLL     R3,     2                       ; 5972   004F
        ADDR    R1,     R7                      ; 5973   00CF
        ADDR    R3,     R7                      ; 5974   00DF
        ADDR    R3,     R7                      ; 5975   00DF

        DECLE   $00FF,  $00F3,  $00F2,  $0060   ; 5976   00FF 00F3 00F2 0060
        DECLE   $0000                           ; 597A   0000

        DIS                                     ; 597B   0003
        INCR    R7                              ; 597C   000F

        DECLE   $001F                           ; 597D   001F
L_597E:
        COMR    R0                              ; 597E   0018
        DECLE   $0019,  $003F,  $0037,  $007F   ; 597F   0019 003F 0037 007F
        DECLE   $007F,  $0073,  $0071,  $007F   ; 5983   007F 0073 0071 007F
        DECLE   $003E,  $001F,  $0000,  $0000   ; 5987   003E 001F 0000 0000
        DECLE   $00F0,  $0078,  $00DC,  $00FC   ; 598B   00F0 0078 00DC 00FC
        DECLE   $00FC,  $00FC,  $0024,  $0024   ; 598F   00FC 00FC 0024 0024
        DECLE   $00FC,  $00F8,  $00F8,  $00F0   ; 5993   00FC 00F8 00F8 00F0
        DECLE   $00E0,  $00C0,  $0000,  $0006   ; 5997   00E0 00C0 0000 0006
        DECLE   $0006,  $0007,  $001E,  $0003   ; 599B   0006 0007 001E 0003
        DECLE   $0023,  $0044,  $00C5,  $0002   ; 599F   0023 0044 00C5 0002
        DECLE   $008A,  $00C2,  $0041,  $0061   ; 59A3   008A 00C2 0041 0061
        DECLE   $0036,  $001F,  $0009,  $0000   ; 59A7   0036 001F 0009 0000
        DECLE   $0000,  $0000,  $0024,  $003C   ; 59AB   0000 0000 0024 003C
        DECLE   $007E,  $0099,  $0024,  $00BD   ; 59AF   007E 0099 0024 00BD
        DECLE   $005A,  $0066,  $0024,  $0018   ; 59B3   005A 0066 0024 0018
        DECLE   $0000,  $0000,  $0000,  $0018   ; 59B7   0000 0000 0000 0018
        DECLE   $003C,  $0024,  $0066,  $007E   ; 59BB   003C 0024 0066 007E
        DECLE   $00A5,  $00FF,  $00FF,  $00FF   ; 59BF   00A5 00FF 00FF 00FF
        DECLE   $00BD,  $0081,  $00FF,  $0066   ; 59C3   00BD 0081 00FF 0066
        DECLE   $0066,  $003C,  $0000,  $0009   ; 59C7   0066 003C 0000 0009
        DECLE   $000E,  $001F                   ; 59CB   000E 001F

        GSWD    R2                              ; 59CD   0032
        RRC     R3,     1                       ; 59CE   0073
        ADDR    R2,     R3                      ; 59CF   00D3
        ADDR    R7,     R3                      ; 59D0   00FB
        RSWD    R2                              ; 59D1   003A
        ADDR    R7,     R6                      ; 59D2   00FE
        ADDR    R3,     R7                      ; 59D3   00DF

        DECLE   $007C,  $003C,  $003D,  $001D   ; 59D4   007C 003C 003D 001D
        DECLE   $0005,  $0004                   ; 59D8   0005 0004

        MOVR    R2,     R0                      ; 59DA   0090
        RRC     R0,     1                       ; 59DB   0070
        ADDR    R7,     R0                      ; 59DC   00F8
        SLL     R0,     2                       ; 59DD   004C
        ADDR    R1,     R6                      ; 59DE   00CE
        ADDR    R1,     R3                      ; 59DF   00CB
        ADDR    R3,     R7                      ; 59E0   00DF

        DECLE   $00DC,  $007F,  $00FB,  $003E   ; 59E1   00DC 007F 00FB 003E
        DECLE   $003C,  $007C,  $0078,  $0060   ; 59E5   003C 007C 0078 0060
        DECLE   $0060,  $0000                   ; 59E9   0060 0000

        INCR    R0                              ; 59EB   0008
        SARC    R0,     2                       ; 59EC   007C
        ADDR    R2,     R4                      ; 59ED   00D4
        ADDR    R6,     R6                      ; 59EE   00F6
        MOVR    R7,     R2                      ; 59EF   00BA
        ADDR    R5,     R2                      ; 59F0   00EA
        ADDR    R5,     R7                      ; 59F1   00EF

        DECLE   $00F7,  $00F7,  $007D,  $005F   ; 59F2   00F7 00F7 007D 005F
        DECLE   $005B,  $003F,  $001E,  $000C   ; 59F6   005B 003F 001E 000C
        DECLE   $0000,  $0000,  $0040,  $00F0   ; 59FA   0000 0000 0040 00F0
        DECLE   $00F8,  $00F4,  $00B4,  $007E   ; 59FE   00F8 00F4 00B4 007E
        DECLE   $004E,  $002F,  $003B,  $000F   ; 5A02   004E 002F 003B 000F
        DECLE   $0002,  $0000,  $0000,  $0000   ; 5A06   0002 0000 0000 0000

        SLR     R0,     1                       ; 5A0A   0060
        ADDR    R6,     R0                      ; 5A0B   00F0
        MOVR    R1,     R0                      ; 5A0C   0088
        ADDR    R1,     R4                      ; 5A0D   00CC
        ADDR    R1,     R0                      ; 5A0E   00C8
        RRC     R2,     2                       ; 5A0F   0076
        SLLC    R2,     1                       ; 5A10   005A
        SLLC    R2,     2                       ; 5A11   005E
        ADCR    R7                              ; 5A12   002F

        ADCR    R1                              ; 5A13   0029
L_5A14:
        RSWD    R1                              ; 5A14   0039
        COMR    R1                              ; 5A15   0019
        COMR    R5                              ; 5A16   001D
        INCR    R7                              ; 5A17   000F

        SETC                                    ; 5A18   0007
L_5A19:
        EIS                                     ; 5A19   0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A1A   0000 0000 0000 0000
        DECLE   $0000,  $0007,  $0018,  $0011   ; 5A1E   0000 0007 0018 0011
        DECLE   $0016,  $001D,  $001B,  $0008   ; 5A22   0016 001D 001B 0008
        DECLE   $000F,  $0007,  $0001,  $0000   ; 5A26   000F 0007 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A2A   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $00F0,  $00C8   ; 5A2E   0000 0080 00F0 00C8
        DECLE   $00C8,  $007C,  $00BC,  $00F4   ; 5A32   00C8 007C 00BC 00F4
        DECLE   $00C4,  $000C,  $00FC,  $0078   ; 5A36   00C4 000C 00FC 0078
        DECLE   $0024,  $0000,  $0042,  $0000   ; 5A3A   0024 0000 0042 0000
        DECLE   $0081,  $0000,  $0000,  $0081   ; 5A3E   0081 0000 0000 0081
        DECLE   $0081,  $0000,  $0000,  $0081   ; 5A42   0081 0000 0000 0081
        DECLE   $0000,  $0042,  $0000,  $0024   ; 5A46   0000 0042 0000 0024
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A4A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0014   ; 5A4E   0000 0000 0008 0014
        DECLE   $0008,  $0000,  $0000,  $0000   ; 5A52   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A56   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0010   ; 5A5A   0000 0000 0008 0010
        DECLE   $005A,  $0024,  $005A,  $00BD   ; 5A5E   005A 0024 005A 00BD
        DECLE   $00BE,  $0054,  $002A,  $0018   ; 5A62   00BE 0054 002A 0018
        DECLE   $0024,  $0010,  $0000,  $0000   ; 5A66   0024 0010 0000 0000
        DECLE   $0008,  $0010,  $0018,  $0024   ; 5A6A   0008 0010 0018 0024
        DECLE   $0008,  $0054,  $003A,  $005C   ; 5A6E   0008 0054 003A 005C
        DECLE   $003E,  $0078,  $000A,  $0034   ; 5A72   003E 0078 000A 0034
        DECLE   $0028,  $0014,  $0008,  $0010   ; 5A76   0028 0014 0008 0010
        DECLE   $0000,  $0000                   ; 5A7A   0000 0000

        INCR    R0                              ; 5A7C   0008
        DECR    R0                              ; 5A7D   0010
        ADCR    R2                              ; 5A7E   002A

        JSRD    R4,     L_58BD                  ; 5A7F   0004 005A 00BD
        DECLE   $00BA,  $0054,  $002E,  $0014   ; 5A82   00BA 0054 002E 0014
        DECLE   $0028,  $0018,  $0000,  $0000   ; 5A86   0028 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A8A   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0034,  $0018   ; 5A8E   0000 0008 0034 0018
        DECLE   $002C,  $0010,  $0008,  $0000   ; 5A92   002C 0010 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A96   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 5A9A   0000 0000 0000 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A9E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0028   ; 5AA2   0000 0000 0000 0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AA6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0066   ; 5AAA   0000 0000 0000 0066
        DECLE   $0066,  $0000,  $0000,  $0000   ; 5AAE   0066 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5AB2   0000 0000

        ADDR    R4,     R7                      ; 5AB4   00E7
        ADDR    R4,     R7                      ; 5AB5   00E7
        ADDR    R4,     R7                      ; 5AB6   00E7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AB7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0028   ; 5ABB   0000 0000 0000 0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ABF   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0000,  $0028   ; 5AC3   0000 0010 0000 0028
        DECLE   $0000,  $0010,  $0000,  $0000   ; 5AC7   0000 0010 0000 0000
        DECLE   $0000,  $0054,  $0000,  $0028   ; 5ACB   0000 0054 0000 0028
        DECLE   $0000,  $0010,  $0000,  $0028   ; 5ACF   0000 0010 0000 0028
        DECLE   $0000,  $0054,  $0000,  $0028   ; 5AD3   0000 0054 0000 0028
        DECLE   $0000,  $0010,  $0000,  $00AA   ; 5AD7   0000 0010 0000 00AA
        DECLE   $0000,  $0054,  $0000,  $0028   ; 5ADB   0000 0054 0000 0028
        DECLE   $0000,  $0010,  $0000,  $00AA   ; 5ADF   0000 0010 0000 00AA
        DECLE   $0000,  $0054,  $0000,  $0028   ; 5AE3   0000 0054 0000 0028
        DECLE   $0000,  $0054,  $0000,  $00AA   ; 5AE7   0000 0054 0000 00AA
        DECLE   $0000,  $0054,  $0000,  $00AA   ; 5AEB   0000 0054 0000 00AA
        DECLE   $0000,  $0054,  $0000,  $00AA   ; 5AEF   0000 0054 0000 00AA
        DECLE   $0000,  $0055,  $0000,  $00AA   ; 5AF3   0000 0055 0000 00AA
        DECLE   $0000,  $0055,  $0000,  $0000   ; 5AF7   0000 0055 0000 0000
        DECLE   $0000,  $0038,  $0038,  $0038   ; 5AFB   0000 0038 0038 0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AFF   0000 0000 0000 0000
        DECLE   $0000                           ; 5B03   0000

        ADDR    R4,     R7                      ; 5B04   00E7
        ADDR    R4,     R7                      ; 5B05   00E7
        ADDR    R4,     R7                      ; 5B06   00E7

        DECLE   $0000,  $0000,  $0000,  $0038   ; 5B07   0000 0000 0000 0038
        DECLE   $0038,  $0038,  $0000,  $0000   ; 5B0B   0038 0038 0000 0000

        ADDR    R4,     R7                      ; 5B0F   00E7
        ADDR    R4,     R7                      ; 5B10   00E7
        ADDR    R4,     R7                      ; 5B11   00E7

        DECLE   $00B6,  $0054,  $0000,  $0010   ; 5B12   00B6 0054 0000 0010
        DECLE   $0004,  $0003,  $007F,  $0056   ; 5B16   0004 0003 007F 0056
        DECLE   $00A0,  $0056,  $00FD,  $0056   ; 5B1A   00A0 0056 00FD 0056
        DECLE   $00C1,  $0056,  $00E5,  $0056   ; 5B1E   00C1 0056 00E5 0056
        DECLE   $00F1,  $0056,  $001F,  $0057   ; 5B22   00F1 0056 001F 0057
        DECLE   $00B6,  $0054,  $0004,  $0004   ; 5B26   00B6 0054 0004 0004
        DECLE   $0001,  $0000,  $00D5,  $0056   ; 5B2A   0001 0000 00D5 0056
        DECLE   $00B6,  $0054,  $0006,  $0004   ; 5B2E   00B6 0054 0006 0004
        DECLE   $0001,  $0000                   ; 5B32   0001 0000

        DECR    R6                              ; 5B34   0016
        RLC     R3,     2                       ; 5B35   0057
L_5B36:
        MVII    #$0054, R0                      ; 5B36   02B8 0054
        MVO     R0,     G_0179                  ; 5B38   0240 0179
        MVII    #$0036, R0                      ; 5B3A   02B8 0036
        MVO     R0,     G_018B                  ; 5B3C   0240 018B
        CLRR    R0                              ; 5B3E   01C0
        MVO     R0,     G_017A                  ; 5B3F   0240 017A
        MVO     R0,     G_018C                  ; 5B41   0240 018C
        MOVR    R5,     R7                      ; 5B43   00AF

L_5B44:
        PSHR    R5                              ; 5B44   0275
        MVII    #$0200, R4                      ; 5B45   02BC 0200
        MVII    #$00F0, R0                      ; 5B47   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5B49   0004 0114 0338

        MVII    #$022B, R4                      ; 5B4C   02BC 022B
        SDBD                                    ; 5B4E   0001
        MVII    #$5B81, R5                      ; 5B4F   02BD 0081 005B
L_5B52:
        MVI@    R5,     R3                      ; 5B52   02AB
        MOVR    R3,     R2                      ; 5B53   009A
        SDBD                                    ; 5B54   0001
        XORI    #$1806, R3                      ; 5B55   03FB 0006 0018
        MVO@    R3,     R4                      ; 5B58   0263
        CLRR    R1                              ; 5B59   01C9
        SDBD                                    ; 5B5A   0001
        CMPI    #$0040, R2                      ; 5B5B   037A 0040 0000
        BLE     L_5B52                          ; 5B5E   0226 000D

        SDBD                                    ; 5B60   0001
        CMPI    #$0058, R2                      ; 5B61   037A 0058 0000
        BNEQ    L_5B6C                          ; 5B64   020C 0006

        SDBD                                    ; 5B66   0001
        MVII    #$1866, R1                      ; 5B67   02B9 0066 0018
        B       L_5B76                          ; 5B6A   0200 000A

L_5B6C:
        SDBD                                    ; 5B6C   0001
        CMPI    #$0080, R2                      ; 5B6D   037A 0080 0000
        BNEQ    L_5B76                          ; 5B70   020C 0004

        SDBD                                    ; 5B72   0001
        MVII    #$188E, R1                      ; 5B73   02B9 008E 0018
L_5B76:
        MVI@    R5,     R3                      ; 5B76   02AB
        TSTR    R3                              ; 5B77   009B
        BEQ     L_5B80                          ; 5B78   0204 0006

L_5B7A:
        MVO@    R1,     R4                      ; 5B7A   0261
        DECR    R3                              ; 5B7B   0013
        BNEQ    L_5B7A                          ; 5B7C   022C 0003
        B       L_5B52                          ; 5B7E   0220 002D
L_5B80:
        PULR    R7                              ; 5B80   02B7

        DECLE   $0058,  $000C,  $0068,  $0006   ; 5B81   0058 000C 0068 0006
        DECLE   $0070,  $000C,  $0078,  $0006   ; 5B85   0070 000C 0078 0006
        DECLE   $0070,  $0002,  $0058,  $0006   ; 5B89   0070 0002 0058 0006
        DECLE   $0068,  $0002,  $0078,  $0006   ; 5B8D   0068 0002 0078 0006
        DECLE   $0070,  $0002,  $0070,  $0002   ; 5B91   0070 0002 0070 0002
        DECLE   $0038,  $0048,  $0002,  $0078   ; 5B95   0038 0048 0002 0078
        DECLE   $0002,  $0078,  $0006,  $0070   ; 5B99   0002 0078 0006 0070
        DECLE   $0002,  $0070,  $0002,  $0040   ; 5B9D   0002 0070 0002 0040
        DECLE   $0050,  $0002,  $0078,  $0002   ; 5BA1   0050 0002 0078 0002
        DECLE   $0078,  $0006,  $0070,  $0002   ; 5BA5   0078 0006 0070 0002
        DECLE   $0080,  $0006,  $0090,  $0002   ; 5BA9   0080 0006 0090 0002
        DECLE   $0078,  $0006,  $0070,  $000C   ; 5BAD   0078 0006 0070 000C
        DECLE   $0078,  $0006,  $0080,  $000C   ; 5BB1   0078 0006 0080 000C
        DECLE   $0090,  $0000                   ; 5BB5   0090 0000
.GRAM_INIT_5BB7:
        DECLE   $0013           ; 5BB7  # of GRAM cards to init
        DECLE   $0001,  $0010   ; 5BB8  #00-00:  GROM #00-00 ----
        DECLE   $0001,  $0300   ; 5BBA  #01-07:  CART #00-06 ----
        DECLE   $010F,  $0040   ; 5BBC  #08-08:  GRAM #07-07 -Y--
        DECLE   $020F,  $0040   ; 5BBE  #09-09:  GRAM #07-07 X---
        DECLE   $0113,  $0040   ; 5BC0  #0A-0A:  GRAM #09-09 -Y--
        DECLE   $000F,  $0080   ; 5BC2  #0B-0C:  CART #07-08 ----
        DECLE   $0217,  $0040   ; 5BC4  #0D-0D:  GRAM #0B-0B X---
        DECLE   $0119,  $0048   ; 5BC6  #0E-0E:  GRAM #0C-0C -Y-R
        DECLE   $021D,  $0040   ; 5BC8  #0F-0F:  GRAM #0E-0E X---
        DECLE   $0117,  $0140   ; 5BCA  #10-12:  GRAM #0B-0D -Y--

.GFX_LIST_5BCC:
        DECLE   $0000,  $0000,  $0004,  $0000   ; 5BCC  CART PIC #00
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BD0  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BD4  CART PIC #01
        DECLE   $0000,  $0000,  $0008,  $0000   ; 5BD8  
        DECLE   $0000,  $0040,  $0000,  $0000   ; 5BDC  CART PIC #02
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BE0  
        DECLE   $0000,  $0000,  $0000,  $0060   ; 5BE4  CART PIC #03
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BE8  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BEC  CART PIC #04
        DECLE   $0000,  $0000,  $0000,  $0003   ; 5BF0  
        DECLE   $0040,  $0000,  $0000,  $0000   ; 5BF4  CART PIC #05
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BF8  
        DECLE   $0000,  $0000,  $0000,  $0005   ; 5BFC  CART PIC #06
        DECLE   $0010,  $0040,  $0000,  $0081   ; 5C00  
        DECLE   $0055,  $0080,  $0000,  $0080   ; 5C04  CART PIC #07
        DECLE   $0000,  $0080,  $0000,  $0080   ; 5C08  
        DECLE   $0055,  $0000,  $0000,  $0000   ; 5C0C  CART PIC #08
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C10  
L_5C14:
        PSHR    R5                              ; 5C14   0275
        MVII    #$003D, R2                      ; 5C15   02BA 003D
        B       L_5C21                          ; 5C17   0200 0008

L_5C19:
        PSHR    R5                              ; 5C19   0275
        MVII    #$0014, R2                      ; 5C1A   02BA 0014
        B       L_5C21                          ; 5C1C   0200 0003

L_5C1E:
        PSHR    R5                              ; 5C1E   0275
        MVII    #$0004, R2                      ; 5C1F   02BA 0004
L_5C21:
        MVII    #$0200, R3                      ; 5C21   02BB 0200
        MVI@    R3,     R0                      ; 5C23   0298
        SDBD                                    ; 5C24   0001
        ANDI    #$DFFF, R0                      ; 5C25   03B8 00FF 00DF
        MVO@    R0,     R3                      ; 5C28   0258
L_5C29:
        MVO     R2,     G_01AE                  ; 5C29   0242 01AE
        MVII    #$0200, R3                      ; 5C2B   02BB 0200
        MVI@    R3,     R0                      ; 5C2D   0298
        SDBD                                    ; 5C2E   0001
        XORI    #$2000, R0                      ; 5C2F   03F8 0000 0020
        MVO@    R0,     R3                      ; 5C32   0258
        MVII    #$0001, R0                      ; 5C33   02B8 0001

        JSR     R5,     .EXEC.A62               ; 5C35   0004 0118 0262

        MVI     G_01AE, R2                      ; 5C38   0282 01AE
        DECR    R2                              ; 5C3A   0012
        BNEQ    L_5C29                          ; 5C3B   022C 0013

        MVO     R2,     G_01AE                  ; 5C3D   0242 01AE
        PULR    R7                              ; 5C3F   02B7
        MOVR    R0,     R7                      ; 5C40   0087

        DECLE   $0030,  $0050,  $005C,  $0000   ; 5C41   0030 0050 005C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C45   0000 0000 0000 0000
        DECLE   $0000,  $00C0,  $0000,  $0000   ; 5C49   0000 00C0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0100   ; 5C4D   0000 0000 0000 0100
        DECLE   $0000                           ; 5C51   0000

        MOVR    R4,     R5                      ; 5C52   00A5
        SLLC    R0,     2                       ; 5C53   005C
        CLRC                                    ; 5C54   0006
        GSWD    R2                              ; 5C55   0032
        EIS                                     ; 5C56   0002
        ADDR    R0,     R7                      ; 5C57   00C7

        SLLC    R0,     2                       ; 5C58   005C
L_5C59:
        PSHR    R5                              ; 5C59   0275
        PSHR    R1                              ; 5C5A   0271
        MVII    #$0335, R2                      ; 5C5B   02BA 0335
        SDBD                                    ; 5C5D   0001
        MVII    #$5C40, R1                      ; 5C5E   02B9 0040 005C

        JSR     R5,     X_INIT_MOB              ; 5C61   0004 0114 02B2
        DECLE   $02B1,  $0004,  $0154,  $0227   ; 5C64   02B1 0004 0154 0227

        ADDI    #$0004, R3                      ; 5C68   02FB 0004
        CMPI    #$0004, R2                      ; 5C6A   037A 0004
        BGE     L_5C70                          ; 5C6C   020D 0002

        MVII    #$0004, R2                      ; 5C6E   02BA 0004
L_5C70:
        MVII    #$0335, R1                      ; 5C70   02B9 0335
        DECLE   $0004,  $0154,  $0250           ; 5C72   0004 0154 0250

        MVII    #$031D, R1                      ; 5C75   02B9 031D

        JSR     R5,     .EXEC.777               ; 5C77   0004 0114 0377

        PSHR    R2                              ; 5C7A   0272
        PSHR    R3                              ; 5C7B   0273
        MVII    #$0337, R4                      ; 5C7C   02BC 0337

        JSR     R5,     .EXEC.7A3               ; 5C7E   0004 0114 03A3

        SLR     R2,     1                       ; 5C81   0062
        SLR     R2,     2                       ; 5C82   0066
        MVO     R2,     G_01AF                  ; 5C83   0242 01AF
        PULR    R1                              ; 5C85   02B1
        PULR    R0                              ; 5C86   02B0

        JSR     R5,     X_PACK_BYTES            ; 5C87   0004 0114 034F

        MOVR    R0,     R2                      ; 5C8A   0082
        MVI     G_01AF, R3                      ; 5C8B   0283 01AF
        MVI     G_0160, R0                      ; 5C8D   0280 0160
        CMPI    #$0082, R0                      ; 5C8F   0378 0082
        MVII    #$0012, R0                      ; 5C91   02B8 0012
        BNEQ    L_5C97                          ; 5C93   020C 0002

        SLR     R0,     1                       ; 5C95   0060
        SLL     R3,     1                       ; 5C96   004B
L_5C97:
        PSHR    R0                              ; 5C97   0270
        MVII    #$0335, R1                      ; 5C98   02B9 0335

        JSR     R5,     .EXEC.9A3               ; 5C9A   0004 0118 01A3

        ADDI    #$0006, R1                      ; 5C9D   02F9 0006
        PULR    R0                              ; 5C9F   02B0
        MVO@    R0,     R1                      ; 5CA0   0248
        CLRR    R0                              ; 5CA1   01C0
        MVO     R0,     G_01B0                  ; 5CA2   0240 01B0
        PULR    R7                              ; 5CA4   02B7

        PSHR    R5                              ; 5CA5   0275
        MVI     G_01B0, R2                      ; 5CA6   0282 01B0
        INCR    R2                              ; 5CA8   000A
        MVO     R2,     G_01B0                  ; 5CA9   0242 01B0
        DECR    R2                              ; 5CAB   0012
        BNEQ    L_5CC3                          ; 5CAC   020C 0015

        MVI@    R1,     R0                      ; 5CAE   0288
        SDBD                                    ; 5CAF   0001
        ANDI    #$F7F8, R0                      ; 5CB0   03B8 00F8 00F7
        SDBD                                    ; 5CB3   0001
        XORI    #$0802, R0                      ; 5CB4   03F8 0002 0008
        MVO@    R0,     R1                      ; 5CB7   0248
        ADDI    #$0005, R1                      ; 5CB8   02F9 0005
        MVII    #$0003, R0                      ; 5CBA   02B8 0003
        MVO@    R0,     R1                      ; 5CBC   0248
        ADDI    #$0001, R1                      ; 5CBD   02F9 0001
        MVII    #$0012, R0                      ; 5CBF   02B8 0012
        MVO@    R0,     R1                      ; 5CC1   0248
        PULR    R7                              ; 5CC2   02B7

L_5CC3:
        JSR     R5,     .EXEC.7AE               ; 5CC3   0004 0114 03AE

        PULR    R7                              ; 5CC6   02B7

        PSHR    R5                              ; 5CC7   0275
        SDBD                                    ; 5CC8   0001
        MVII    #$1906, R0                      ; 5CC9   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5CCC   0240 035D
        MVII    #$0200, R4                      ; 5CCE   02BC 0200
        MVII    #$00F0, R0                      ; 5CD0   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5CD2   0004 0114 0338
        JSR     R5,     L_5C19                  ; 5CD5   0004 015C 0019
        JSR     R5,     L_5504                  ; 5CD8   0004 0154 0104
        JSR     R5,     .EXEC.7B3               ; 5CDB   0004 0114 03B3

        SDBD                                    ; 5CDE   0001
        MVII    #$5024, R1                      ; 5CDF   02B9 0024 0050

        JSR     R5,     X_TIMER_STOP            ; 5CE2   0004 0118 0038

        PULR    R7                              ; 5CE5   02B7

L_5CE6:
        MVI     G_018D, R1                      ; 5CE6   0281 018D
        SDBD                                    ; 5CE8   0001
        ADDI    #$5255, R1                      ; 5CE9   02F9 0055 0052
        MVI@    R1,     R0                      ; 5CEC   0288
        MVO     R0,     G_0106                  ; 5CED   0240 0106
        SDBD                                    ; 5CEF   0001
        MVII    #$5D14, R1                      ; 5CF0   02B9 0014 005D
        B       L_5CF9                          ; 5CF3   0200 0004

L_5CF5:
        SDBD                                    ; 5CF5   0001
        MVII    #$5D08, R1                      ; 5CF6   02B9 0008 005D
L_5CF9:
        MVII    #$0100, R4                      ; 5CF9   02BC 0100
        SDBD                                    ; 5CFB   0001
        MVI@    R4,     R0                      ; 5CFC   02A0
        SUBI    #$0002, R4                      ; 5CFD   033C 0002
        MVO@    R1,     R4                      ; 5CFF   0261
        SWAP    R1,     1                       ; 5D00   0041
        MVO@    R1,     R4                      ; 5D01   0261
        MVII    #$01B1, R4                      ; 5D02   02BC 01B1
        MVO@    R0,     R4                      ; 5D04   0260
        SWAP    R0,     1                       ; 5D05   0040
        MVO@    R0,     R4                      ; 5D06   0260
        MOVR    R5,     R7                      ; 5D07   00AF

        MVII    #$0004, R0                      ; 5D08   02B8 0004
        MVO     R0,     .STIC.CS.0              ; 5D0A   0240 0028
        MVII    #$0003, R0                      ; 5D0C   02B8 0003
        MVO     R0,     .STIC.BORD              ; 5D0E   0240 002C
        MVO     R0,     G_0106                  ; 5D10   0240 0106
        B       L_5D1C                          ; 5D12   0200 0008

        MVII    #$0000, R0                      ; 5D14   02B8 0000
        MVO     R0,     .STIC.CS.0              ; 5D16   0240 0028
        MVI     G_0106, R0                      ; 5D18   0280 0106
        MVO     R0,     .STIC.BORD              ; 5D1A   0240 002C
L_5D1C:
        MVII    #$01B1, R4                      ; 5D1C   02BC 01B1
        SDBD                                    ; 5D1E   0001
        MVI@    R4,     R1                      ; 5D1F   02A1
        MVII    #$0100, R4                      ; 5D20   02BC 0100
        MVO@    R1,     R4                      ; 5D22   0261
        SWAP    R1,     1                       ; 5D23   0041
        MVO@    R1,     R4                      ; 5D24   0261
        SWAP    R1,     1                       ; 5D25   0041
        MOVR    R1,     R7                      ; 5D26   008F

L_5D27:
        PSHR    R5                              ; 5D27   0275
        MVII    #$02DD, R4                      ; 5D28   02BC 02DD
        MVII    #$0002, R3                      ; 5D2A   02BB 0002
        MVI     G_01A7, R1                      ; 5D2C   0281 01A7
        ADDI    #$0161, R1                      ; 5D2E   02F9 0161
        MVI@    R1,     R0                      ; 5D30   0288
        MVII    #$0002, R1                      ; 5D31   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 5D33   0004 0118 00C5

        ADDI    #$0010, R4                      ; 5D36   02FC 0010
        MVI     G_01A6, R1                      ; 5D38   0281 01A6
        MOVR    R1,     R2                      ; 5D3A   008A
        ADDI    #$0166, R2                      ; 5D3B   02FA 0166
        MVI@    R2,     R0                      ; 5D3D   0290
        SDBD                                    ; 5D3E   0001
        ADDI    #$5255, R1                      ; 5D3F   02F9 0055 0052
        MVI@    R1,     R3                      ; 5D42   028B
        MVII    #$0002, R1                      ; 5D43   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 5D45   0004 0118 00C5

        PULR    R7                              ; 5D48   02B7

L_5D49:
        PSHR    R5                              ; 5D49   0275

        JSR     R5,     .EXEC.7C1               ; 5D4A   0004 0114 03C1

        MVI     G_01A7, R1                      ; 5D4D   0281 01A7
        ADDI    #$0161, R1                      ; 5D4F   02F9 0161
        MVI@    R1,     R0                      ; 5D51   0288
        DECR    R0                              ; 5D52   0010
        MVO@    R0,     R1                      ; 5D53   0248
        BEQ     L_5D5A                          ; 5D54   0204 0004

        JSR     R5,     L_5D27                  ; 5D56   0004 015C 0127

        PULR    R7                              ; 5D59   02B7

L_5D5A:
        JSR     R5,     L_5D27                  ; 5D5A   0004 015C 0127

        MVI     G_01A7, R2                      ; 5D5D   0282 01A7

        JSR     R5,     L_51CA                  ; 5D5F   0004 0150 01CA

        PULR    R7                              ; 5D62   02B7

L_5D63:
        PSHR    R5                              ; 5D63   0275

        JSR     R5,     L_5D8A                  ; 5D64   0004 015C 018A

        MVI     G_01A6, R1                      ; 5D67   0281 01A6
        ADDI    #$0166, R1                      ; 5D69   02F9 0166
        MVI@    R1,     R0                      ; 5D6B   0288
        DECR    R0                              ; 5D6C   0010
        MVO@    R0,     R1                      ; 5D6D   0248
        BEQ     L_5D79                          ; 5D6E   0204 0009

        MVI     G_01A5, R0                      ; 5D70   0280 01A5
        TSTR    R0                              ; 5D72   0080
        BNEQ    L_5D78                          ; 5D73   020C 0003

        JSR     R5,     L_52BA                  ; 5D75   0004 0150 02BA

L_5D78:
        PULR    R7                              ; 5D78   02B7

L_5D79:
        JSR     R5,     L_5053                  ; 5D79   0004 0150 0053

        MVI     G_01A6, R2                      ; 5D7C   0282 01A6

        JSR     R5,     L_5215                  ; 5D7E   0004 0150 0215

        PULR    R7                              ; 5D81   02B7

L_5D82:
        PSHR    R1                              ; 5D82   0271
        MVI     G_01A7, R1                      ; 5D83   0281 01A7
        ADDI    #$0161, R1                      ; 5D85   02F9 0161
        MVI@    R1,     R0                      ; 5D87   0288
        PULR    R1                              ; 5D88   02B1
        MOVR    R5,     R7                      ; 5D89   00AF

L_5D8A:
        PSHR    R5                              ; 5D8A   0275
        MVI     G_01A7, R2                      ; 5D8B   0282 01A7

        JSR     R5,     L_5DB2                  ; 5D8D   0004 015C 01B2

        CMPI    #$0001, R0                      ; 5D90   0378 0001
        BNEQ    L_5D97                          ; 5D92   020C 0003

        JSR     R5,     L_5053                  ; 5D94   0004 0150 0053

L_5D97:
        PULR    R7                              ; 5D97   02B7

L_5D98:
        MVO     R2,     G_01B3                  ; 5D98   0242 01B3
        ADDR    R2,     R3                      ; 5D9A   00D3
        ADDR    R2,     R3                      ; 5D9B   00D3
        MVI@    R3,     R2                      ; 5D9C   029A
        SWAP    R2,     1                       ; 5D9D   0042
        INCR    R3                              ; 5D9E   000B
        XOR@    R3,     R2                      ; 5D9F   03DA
        PSHR    R2                              ; 5DA0   0272
        MVI     G_01B3, R2                      ; 5DA1   0282 01B3
        DECR    R3                              ; 5DA3   0013
        SUBR    R2,     R3                      ; 5DA4   0113
        SUBR    R2,     R3                      ; 5DA5   0113
        MOVR    R5,     R7                      ; 5DA6   00AF

L_5DA7:
        ADDR    R2,     R3                      ; 5DA7   00D3
        ADDR    R2,     R3                      ; 5DA8   00D3
        SWAP    R0,     1                       ; 5DA9   0040
        MVO@    R0,     R3                      ; 5DAA   0258
        INCR    R3                              ; 5DAB   000B
        SWAP    R0,     1                       ; 5DAC   0040
        MVO@    R0,     R3                      ; 5DAD   0258
        DECR    R3                              ; 5DAE   0013
        SUBR    R2,     R3                      ; 5DAF   0113
        SUBR    R2,     R3                      ; 5DB0   0113
        MOVR    R5,     R7                      ; 5DB1   00AF

L_5DB2:
        PSHR    R5                              ; 5DB2   0275
        PSHR    R2                              ; 5DB3   0272
        ADDI    #$0198, R2                      ; 5DB4   02FA 0198
        MVI@    R2,     R0                      ; 5DB6   0290
        PULR    R2                              ; 5DB7   02B2
        PULR    R7                              ; 5DB8   02B7

L_5DB9:
        CMPI    #$0005, R2                      ; 5DB9   037A 0005
        BGE     L_5DD9                          ; 5DBB   020D 001C

        PSHR    R5                              ; 5DBD   0275
        PSHR    R1                              ; 5DBE   0271
        MVI     G_0179, R0                      ; 5DBF   0280 0179
        MVII    #$0169, R3                      ; 5DC1   02BB 0169
        B       L_5DCF                          ; 5DC3   0200 000A

L_5DC5:
        CMPI    #$0005, R2                      ; 5DC5   037A 0005
        BGE     L_5DDF                          ; 5DC7   020D 0016

        PSHR    R5                              ; 5DC9   0275
        PSHR    R1                              ; 5DCA   0271
        MVI     G_018B, R0                      ; 5DCB   0280 018B
        MVII    #$017B, R3                      ; 5DCD   02BB 017B

L_5DCF:
        JSR     R5,     L_5D98                  ; 5DCF   0004 015C 0198

        PULR    R1                              ; 5DD2   02B1
        SWAP    R1,     1                       ; 5DD3   0041
        ANDI    #$00FF, R1                      ; 5DD4   03B9 00FF
        SUBR    R1,     R0                      ; 5DD6   0108
        PULR    R1                              ; 5DD7   02B1
        PULR    R7                              ; 5DD8   02B7

L_5DD9:
        PSHR    R5                              ; 5DD9   0275
        PSHR    R1                              ; 5DDA   0271
        MVII    #$0169, R3                      ; 5DDB   02BB 0169
        B       L_5DE3                          ; 5DDD   0200 0004

L_5DDF:
        PSHR    R5                              ; 5DDF   0275
        PSHR    R1                              ; 5DE0   0271
        MVII    #$017B, R3                      ; 5DE1   02BB 017B
L_5DE3:
        PSHR    R3                              ; 5DE3   0273
        MVII    #$01A1, R3                      ; 5DE4   02BB 01A1
        SUBI    #$0005, R2                      ; 5DE6   033A 0005
        ADDR    R2,     R3                      ; 5DE8   00D3
        MVI@    R3,     R0                      ; 5DE9   0298
        ADDI    #$0005, R2                      ; 5DEA   02FA 0005
        PULR    R3                              ; 5DEC   02B3
        PSHR    R2                              ; 5DED   0272
        MOVR    R0,     R2                      ; 5DEE   0082

        JSR     R5,     L_5D98                  ; 5DEF   0004 015C 0198

        PULR    R0                              ; 5DF2   02B0
        SWAP    R0,     1                       ; 5DF3   0040
        ANDI    #$00FF, R0                      ; 5DF4   03B8 00FF
        PULR    R2                              ; 5DF6   02B2
        B       L_5DCF                          ; 5DF7   0220 0029

L_5DF9:
        PSHR    R5                              ; 5DF9   0275
        MVI     G_015E, R0                      ; 5DFA   0280 015E
        SARC    R0,     1                       ; 5DFC   0078
        BC      L_5E07                          ; 5DFD   0201 0008

        MVI     G_015F, R0                      ; 5DFF   0280 015F
        INCR    R0                              ; 5E01   0008
        MVO     R0,     G_015F                  ; 5E02   0240 015F
        SARC    R0,     1                       ; 5E04   0078
        BC      L_5E1B                          ; 5E05   0201 0014

L_5E07:
        JSR     R5,     L_5E1C                  ; 5E07   0004 015C 021C
        JSR     R5,     L_5E62                  ; 5E0A   0004 015C 0262
        JSR     R5,     L_5FB6                  ; 5E0D   0004 015C 03B6
        JSR     R5,     L_5ECD                  ; 5E10   0004 015C 02CD

        MVI     G_01A5, R0                      ; 5E13   0280 01A5
        TSTR    R0                              ; 5E15   0080
        BEQ     L_5E1B                          ; 5E16   0204 0003

        JSR     R5,     L_5568                  ; 5E18   0004 0154 0168

L_5E1B:
        PULR    R7                              ; 5E1B   02B7

L_5E1C:
        PSHR    R5                              ; 5E1C   0275
        CLRR    R2                              ; 5E1D   01D2

L_5E1E:
        JSR     R5,     L_5DB2                  ; 5E1E   0004 015C 01B2

        CMPI    #$0003, R0                      ; 5E21   0378 0003
        BNEQ    L_5E54                          ; 5E23   020C 002F

        JSR     R5,     L_5DC5                  ; 5E25   0004 015C 01C5

        MOVR    R0,     R1                      ; 5E28   0081

        JSR     R5,     L_5DB9                  ; 5E29   0004 015C 01B9
        JSR     R5,     .EXEC.A2F               ; 5E2C   0004 0118 022F

        MVII    #$018E, R3                      ; 5E2F   02BB 018E
        ADDR    R2,     R3                      ; 5E31   00D3
        MVI@    R3,     R0                      ; 5E32   0298
        PSHR    R0                              ; 5E33   0270
        MVI     G_01A4, R0                      ; 5E34   0280 01A4
        TSTR    R0                              ; 5E36   0080
        PULR    R0                              ; 5E37   02B0
        BNEQ    L_5E3B                          ; 5E38   020C 0001

        SLL     R0,     2                       ; 5E3A   004C

L_5E3B:
        JSR     R5,     .EXEC.629               ; 5E3B   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 5E3E   0004 0114 0357

        MVII    #$0169, R3                      ; 5E41   02BB 0169

        JSR     R5,     L_5D98                  ; 5E43   0004 015C 0198

        ADD@    R6,     R0                      ; 5E46   02F0

        JSR     R5,     L_5DA7                  ; 5E47   0004 015C 01A7

        MVII    #$017B, R3                      ; 5E4A   02BB 017B

        JSR     R5,     L_5D98                  ; 5E4C   0004 015C 0198

        ADD@    R6,     R1                      ; 5E4F   02F1
        MOVR    R1,     R0                      ; 5E50   0088

        JSR     R5,     L_5DA7                  ; 5E51   0004 015C 01A7

L_5E54:
        MVI     G_01A5, R0                      ; 5E54   0280 01A5
        TSTR    R0                              ; 5E56   0080
        BEQ     L_5E5C                          ; 5E57   0204 0003

        JSR     R5,     L_50EE                  ; 5E59   0004 0150 00EE

L_5E5C:
        INCR    R2                              ; 5E5C   000A
        CMPI    #$0008, R2                      ; 5E5D   037A 0008
        BLT     L_5E1E                          ; 5E5F   0225 0042
        PULR    R7                              ; 5E61   02B7

L_5E62:
        PSHR    R5                              ; 5E62   0275
        CLRR    R2                              ; 5E63   01D2
L_5E64:
        MVII    #$0198, R3                      ; 5E64   02BB 0198
        ADDR    R2,     R3                      ; 5E66   00D3
        MVI@    R3,     R1                      ; 5E67   0299
        CMPI    #$0001, R1                      ; 5E68   0379 0001
        BEQ     L_5EA7                          ; 5E6A   0204 003B

        JSR     R5,     L_5F09                  ; 5E6C   0004 015C 0309

        CMPI    #$000A, R0                      ; 5E6F   0378 000A
        BGT     L_5EA7                          ; 5E71   020E 0034

        JSR     R5,     L_5F12                  ; 5E73   0004 015C 0312

        CMPI    #$0005, R0                      ; 5E76   0378 0005
        BGT     L_5EA7                          ; 5E78   020E 002D

        MVII    #$0198, R3                      ; 5E7A   02BB 0198
        MVII    #$0000, R0                      ; 5E7C   02B8 0000
        CMPI    #$0002, R1                      ; 5E7E   0379 0002
        BEQ     L_5E84                          ; 5E80   0204 0002

        ADDR    R2,     R3                      ; 5E82   00D3
        MVO@    R0,     R3                      ; 5E83   0258

L_5E84:
        JSR     R5,     L_5532                  ; 5E84   0004 0154 0132

        MVII    #$0161, R3                      ; 5E87   02BB 0161
        ADDR    R2,     R3                      ; 5E89   00D3
        MVI@    R3,     R3                      ; 5E8A   029B
        MVI     G_01A4, R0                      ; 5E8B   0280 01A4
        TSTR    R0                              ; 5E8D   0080
        BNEQ    L_5E91                          ; 5E8E   020C 0001

        SLL     R3,     2                       ; 5E90   004F
L_5E91:
        CMPI    #$0002, R1                      ; 5E91   0379 0002
        BEQ     L_5E96                          ; 5E93   0204 0001

        SLL     R3,     1                       ; 5E95   004B
L_5E96:
        MVII    #$0196, R4                      ; 5E96   02BC 0196
        SDBD                                    ; 5E98   0001
        MVI@    R4,     R0                      ; 5E99   02A0
        ADDR    R3,     R0                      ; 5E9A   00D8
        SUBI    #$0002, R4                      ; 5E9B   033C 0002
        MVO@    R0,     R4                      ; 5E9D   0260
        SWAP    R0,     1                       ; 5E9E   0040
        MVO@    R0,     R4                      ; 5E9F   0260
        SWAP    R0,     1                       ; 5EA0   0040
        SDBD                                    ; 5EA1   0001
        CMPI    #$2EE0, R0                      ; 5EA2   0378 00E0 002E
        BGE     L_5EAD                          ; 5EA5   020D 0006

L_5EA7:
        INCR    R2                              ; 5EA7   000A
        CMPI    #$0005, R2                      ; 5EA8   037A 0005
        BLT     L_5E64                          ; 5EAA   0225 0047
        PULR    R7                              ; 5EAC   02B7

L_5EAD:
        JSR     R5,     L_5053                  ; 5EAD   0004 0150 0053
        JSR     R5,     L_555B                  ; 5EB0   0004 0154 015B
        JSR     R5,     L_5C14                  ; 5EB3   0004 015C 0014

        MVI     G_015D, R0                      ; 5EB6   0280 015D

        JSR     R5,     .EXEC.76C               ; 5EB8   0004 0114 036C

        MVI@    R1,     R0                      ; 5EBB   0288
        XORI    #$0013, R0                      ; 5EBC   03F8 0013
        MVO@    R0,     R1                      ; 5EBE   0248
        SDBD                                    ; 5EBF   0001
        MVII    #$5028, R1                      ; 5EC0   02B9 0028 0050

        JSR     R5,     X_TIMER_STOP            ; 5EC3   0004 0118 0038

L_5EC6:
        SDBD                                    ; 5EC6   0001
        MVII    #$1906, R0                      ; 5EC7   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5ECA   0240 035D
        PULR    R7                              ; 5ECC   02B7

L_5ECD:
        PSHR    R5                              ; 5ECD   0275
        MVII    #$0005, R2                      ; 5ECE   02BA 0005

L_5ED0:
        JSR     R5,     L_5DB2                  ; 5ED0   0004 015C 01B2

        CMPI    #$0003, R0                      ; 5ED3   0378 0003
        BNEQ    L_5F03                          ; 5ED5   020C 002C

        JSR     R5,     L_5F09                  ; 5ED7   0004 015C 0309

        CMPI    #$0001, R0                      ; 5EDA   0378 0001
        BGT     L_5F03                          ; 5EDC   020E 0025

        JSR     R5,     L_5F12                  ; 5EDE   0004 015C 0312

        CMPI    #$0001, R0                      ; 5EE1   0378 0001
        BGT     L_5F03                          ; 5EE3   020E 001E

        PSHR    R2                              ; 5EE5   0272
        SUBI    #$0005, R2                      ; 5EE6   033A 0005
        ADDI    #$01A1, R2                      ; 5EE8   02FA 01A1
        MVI@    R2,     R2                      ; 5EEA   0292
        MVII    #$0198, R3                      ; 5EEB   02BB 0198
        ADDR    R2,     R3                      ; 5EED   00D3
        MVI@    R3,     R0                      ; 5EEE   0298
        CMPI    #$0001, R0                      ; 5EEF   0378 0001
        BNEQ    L_5EF6                          ; 5EF1   020C 0003

        PULR    R2                              ; 5EF3   02B2
        B       L_5F03                          ; 5EF4   0200 000D

L_5EF6:
        MVII    #$0002, R0                      ; 5EF6   02B8 0002
        MVO@    R0,     R3                      ; 5EF8   0258
        PULR    R2                              ; 5EF9   02B2
        MVII    #$0198, R3                      ; 5EFA   02BB 0198
        ADDR    R2,     R3                      ; 5EFC   00D3
        MVO@    R0,     R3                      ; 5EFD   0258
        MVI     G_01A4, R0                      ; 5EFE   0280 01A4
        INCR    R0                              ; 5F00   0008
        MVO     R0,     G_01A4                  ; 5F01   0240 01A4
L_5F03:
        INCR    R2                              ; 5F03   000A
        CMPI    #$0008, R2                      ; 5F04   037A 0008
        BLT     L_5ED0                          ; 5F06   0225 0037
        PULR    R7                              ; 5F08   02B7

L_5F09:
        PSHR    R5                              ; 5F09   0275

        JSR     R5,     L_5DB9                  ; 5F0A   0004 015C 01B9

        TSTR    R0                              ; 5F0D   0080
        BGE     L_5F11                          ; 5F0E   020D 0001

        NEGR    R0                              ; 5F10   0020
L_5F11:
        PULR    R7                              ; 5F11   02B7

L_5F12:
        PSHR    R5                              ; 5F12   0275

        JSR     R5,     L_5DC5                  ; 5F13   0004 015C 01C5

        TSTR    R0                              ; 5F16   0080
        BGE     L_5F11                          ; 5F17   022D 0007

        NEGR    R0                              ; 5F19   0020
        PULR    R7                              ; 5F1A   02B7

        PSHR    R5                              ; 5F1B   0275
        PSHR    R0                              ; 5F1C   0270

        JSR     R5,     .EXEC.60A               ; 5F1D   0004 0114 020A

        PULR    R0                              ; 5F20   02B0
        CMPI    #$0003, R0                      ; 5F21   0378 0003
        BLE     L_5F60                          ; 5F23   0206 003B

        CMPI    #$0006, R0                      ; 5F25   0378 0006
        BLE     L_5F55                          ; 5F27   0206 002C

        CMPI    #$0009, R0                      ; 5F29   0378 0009
        BLE     L_5F32                          ; 5F2B   0206 0005

        CMPI    #$000B, R0                      ; 5F2D   0378 000B
        BEQ     L_5F3D                          ; 5F2F   0204 000C
L_5F31:
        PULR    R7                              ; 5F31   02B7

L_5F32:
        SUBI    #$0006, R0                      ; 5F32   0338 0006

        JSR     R5,     L_5F40                  ; 5F34   0004 015C 0340

        BC      L_5F31                          ; 5F37   0221 0007

        JSR     R5,     L_5096                  ; 5F39   0004 0150 0096

        PULR    R7                              ; 5F3C   02B7
L_5F3D:
        J       L_5168                          ; 5F3D   0004 0350 0168

L_5F40:
        PSHR    R5                              ; 5F40   0275
        DECR    R0                              ; 5F41   0010
        MOVR    R0,     R3                      ; 5F42   0083
        ADDI    #$019D, R3                      ; 5F43   02FB 019D
        MVI@    R3,     R1                      ; 5F45   0299
        CMPI    #$0001, R1                      ; 5F46   0379 0001
        BEQ     L_5F4E                          ; 5F48   0204 0004

        MVO     R0,     G_018D                  ; 5F4A   0240 018D
        CLRC                                    ; 5F4C   0006
        PULR    R7                              ; 5F4D   02B7

L_5F4E:
        MVII    #$0002, R0                      ; 5F4E   02B8 0002

        JSR     R5,     X_PLAY_RAZZ4            ; 5F50   0004 011C 02C4

        SETC                                    ; 5F53   0007
        PULR    R7                              ; 5F54   02B7

L_5F55:
        SUBI    #$0003, R0                      ; 5F55   0338 0003

        JSR     R5,     L_5F40                  ; 5F57   0004 015C 0340

        BC      L_5FB5                          ; 5F5A   0201 0059

        MVII    #$0008, R1                      ; 5F5C   02B9 0008
        B       L_5F75                          ; 5F5E   0200 0015

L_5F60:
        JSR     R5,     L_5F40                  ; 5F60   0004 015C 0340

        BC      L_5FB5                          ; 5F63   0201 0050

        MVI     G_015D, R0                      ; 5F65   0280 015D

        JSR     R5,     L_51A6                  ; 5F67   0004 0150 01A6

        BC      L_5F4E                          ; 5F6A   0221 001D

        MOVR    R0,     R1                      ; 5F6C   0081
        MOVR    R0,     R2                      ; 5F6D   0082
        ADDI    #$0198, R2                      ; 5F6E   02FA 0198
        MVI@    R2,     R2                      ; 5F70   0292
        CMPI    #$0001, R2                      ; 5F71   037A 0001
        BEQ     L_5F4E                          ; 5F73   0224 0026

L_5F75:
        MVI     G_018D, R2                      ; 5F75   0282 018D
        MVII    #$019D, R3                      ; 5F77   02BB 019D
        ADDR    R2,     R3                      ; 5F79   00D3
        MVI@    R3,     R0                      ; 5F7A   0298
        CMPI    #$0002, R0                      ; 5F7B   0378 0002
        BEQ     L_5F99                          ; 5F7D   0204 001A

        CMPI    #$0003, R0                      ; 5F7F   0378 0003
        BEQ     L_5FA9                          ; 5F81   0204 0026

        CMPI    #$0000, R0                      ; 5F83   0378 0000
        BNEQ    L_5F4E                          ; 5F85   022C 0038

        MVI     G_0179, R0                      ; 5F87   0280 0179
        SWAP    R0,     1                       ; 5F89   0040
        MVII    #$0173, R3                      ; 5F8A   02BB 0173

        JSR     R5,     L_5DA7                  ; 5F8C   0004 015C 01A7

        MVI     G_018B, R0                      ; 5F8F   0280 018B
        SWAP    R0,     1                       ; 5F91   0040
        MVII    #$0185, R3                      ; 5F92   02BB 0185

        JSR     R5,     L_5DA7                  ; 5F94   0004 015C 01A7

        B       L_5FA9                          ; 5F97   0200 0010

L_5F99:
        MVII    #$01A1, R3                      ; 5F99   02BB 01A1
        ADDR    R2,     R3                      ; 5F9B   00D3
        PSHR    R2                              ; 5F9C   0272
        MVI@    R3,     R2                      ; 5F9D   029A
        ADDI    #$0198, R2                      ; 5F9E   02FA 0198
        MVII    #$0003, R0                      ; 5FA0   02B8 0003
        MVO@    R0,     R2                      ; 5FA2   0250
        PULR    R2                              ; 5FA3   02B2
        MVI     G_01A4, R0                      ; 5FA4   0280 01A4
        DECR    R0                              ; 5FA6   0010
        MVO     R0,     G_01A4                  ; 5FA7   0240 01A4
L_5FA9:
        MVII    #$019D, R3                      ; 5FA9   02BB 019D
        MVII    #$0003, R0                      ; 5FAB   02B8 0003
        ADDR    R2,     R3                      ; 5FAD   00D3
        MVO@    R0,     R3                      ; 5FAE   0258
        ADDI    #$01A1, R2                      ; 5FAF   02FA 01A1
        MVO@    R1,     R2                      ; 5FB1   0251

        JSR     R5,     L_5167                  ; 5FB2   0004 0150 0167

L_5FB5:
        PULR    R7                              ; 5FB5   02B7

L_5FB6:
        PSHR    R5                              ; 5FB6   0275
        CLRR    R2                              ; 5FB7   01D2
L_5FB8:
        MVII    #$019D, R3                      ; 5FB8   02BB 019D
        ADDR    R2,     R3                      ; 5FBA   00D3
        MVI@    R3,     R0                      ; 5FBB   0298
        CMPI    #$0002, R0                      ; 5FBC   0378 0002
        BNEQ    L_5FFA                          ; 5FBE   020C 003A

        MVI     G_01A5, R0                      ; 5FC0   0280 01A5
        TSTR    R0                              ; 5FC2   0080
        BNEQ    L_5FCA                          ; 5FC3   020C 0005

        MVI     G_01A6, R0                      ; 5FC5   0280 01A6
        CMPR    R0,     R2                      ; 5FC7   0142
        BEQ     L_5FFA                          ; 5FC8   0204 0030

L_5FCA:
        MVII    #$0005, R0                      ; 5FCA   02B8 0005

        JSR     R5,     X_RAND1                 ; 5FCC   0004 0114 027D

        TSTR    R0                              ; 5FCF   0080
        BNEQ    L_5FE5                          ; 5FD0   020C 0013

        PSHR    R2                              ; 5FD2   0272
        ADDI    #$01A1, R2                      ; 5FD3   02FA 01A1
        MVI@    R2,     R2                      ; 5FD5   0292
        MVII    #$0161, R3                      ; 5FD6   02BB 0161
        ADDR    R2,     R3                      ; 5FD8   00D3
        MVI@    R3,     R0                      ; 5FD9   0298
        DECR    R0                              ; 5FDA   0010
        MVO@    R0,     R3                      ; 5FDB   0258
        BNEQ    L_5FE4                          ; 5FDC   020C 0006

        JSR     R5,     L_51CA                  ; 5FDE   0004 0150 01CA

        PULR    R2                              ; 5FE1   02B2
        B       L_5FFA                          ; 5FE2   0200 0016

L_5FE4:
        PULR    R2                              ; 5FE4   02B2
L_5FE5:
        MVII    #$0060, R0                      ; 5FE5   02B8 0060

        JSR     R5,     X_RAND2                 ; 5FE7   0004 0114 029E

        TSTR    R0                              ; 5FEA   0080
        BNEQ    L_5FFA                          ; 5FEB   020C 000D

        PSHR    R2                              ; 5FED   0272
        MVII    #$0166, R3                      ; 5FEE   02BB 0166
        ADDR    R2,     R3                      ; 5FF0   00D3
        MVI@    R3,     R0                      ; 5FF1   0298
        DECR    R0                              ; 5FF2   0010
        MVO@    R0,     R3                      ; 5FF3   0258
        BNEQ    L_5FF9                          ; 5FF4   020C 0003

        JSR     R5,     L_5215                  ; 5FF6   0004 0150 0215

L_5FF9:
        PULR    R2                              ; 5FF9   02B2
L_5FFA:
        INCR    R2                              ; 5FFA   000A
        CMPI    #$0003, R2                      ; 5FFB   037A 0003
        BLT     L_5FB8                          ; 5FFD   0225 0046
        PULR    R7                              ; 5FFF   02B7

;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $503C       <entry>
;;  $504B       <entry>
;;  $5053       $504F   $52B6   $5D79   $5D94   $5EAD  
;;  $5086       $5070  
;;  $5096       $5F39  
;;  $50AC       $509F  
;;  $50B2       $507F  
;;  $50BB       $50C1  
;;  $50C7       $50CD  
;;  $50D6       $50C3  
;;  $50E1       $50EB  
;;  $50EE       $50C7   $5E59  
;;  $5103       $50F9  
;;  $5107       $5101  
;;  $5129       $512E  
;;  $5130       $5123   $512B  
;;  $5132       $5282  
;;  $5134       $5143   $5148  
;;  $5145       $513C  
;;  $514B       $5134  
;;  $5167       $50D2   $51DF   $5FB2  
;;  $5168       $5F3D  
;;  $5175       $5191  
;;  $517B       $5178  
;;  $5187       $5181  
;;  $518D       $5185  
;;  $5195       $518B  
;;  $51A6       $5188   $51D2   $5F67  
;;  $51AA       $51C0  
;;  $51B6       $51B0  
;;  $51BD       $51B4  
;;  $51C5       $51BB  
;;  $51C7       $51C3  
;;  $51CA       $5D5F   $5FDE  
;;  $51E2       $51DD  
;;  $51E8       $5082  
;;  $51E9       $51E7  
;;  $51EA       $51F4  
;;  $5214       $51EF   $51F9  
;;  $5215       $5D7E   $5FF6  
;;  $522C       $5222  
;;  $5258       $504C  
;;  $5261       $5280  
;;  $5286       $52A1  
;;  $52B9       $52B4  
;;  $52BA       $50A8   $5D75  
;;  $52E3       $52D6  
;;  $52E5       $52D8  
;;  $52F0       $530C  
;;  $52FD       $52F6  
;;  $5330       $52C1  
;;  $5331       <entry>
;;  $5341       $534D  
;;  $534A       $5346  
;;  $5353       $5311  
;;  $5393       $5387   $538C   $5390  
;;  $5394       <entry>
;;  $53CC       $53D4  
;;  $53D2       $53D8  
;;  $53D6       $53CF  
;;  $53E1       $53EF  
;;  $53EB       $539E   $53BC  
;;  $53EC       $53DF  
;;  $53F1       $53A9  
;;  $53FF       $53F5  
;;  $540C       $53B4  
;;  $542C       $5424  
;;  $542F       $542A  
;;  $5439       $5421  
;;  $543F       $541F  
;;  $5442       $543D  
;;  $544A       $5437  
;;  $549E       $5494  
;;  $54A5       $53AD   $53B1   $53FD   $5406   $5479   $547D   $5481  
;;  $54DC       $5314  
;;  $54F2       $54EB  
;;  $54F5       $5858  
;;  $5504       $5CD8  
;;  $551C       $5796  
;;  $5532       $5E84  
;;  $5547       <entry>
;;  $554F       $5555  
;;  $555B       $5EB0  
;;  $5568       $5E18  
;;  $5575       $520E  
;;  $5759       $5317  
;;  $5799       $5771   $577A  
;;  $579A       $578C   $5793  
;;  $5808       $5802  
;;  $5816       $580A  
;;  $5841       $583D  
;;  $585E       $57FE  
;;  $585F       $584B   $5850   $5855  
;;  $58BD       $5A7F  
;;  $58DF       $58D4  
;;  $58FB       $58ED  
;;  $593D       $593B  
;;  $5956       $5956  
;;  $597E       $597C  
;;  $5A14       $5A12  
;;  $5A19       $5A17  
;;  $5B36       $5259  
;;  $5B44       $5073  
;;  $5B52       $5B5E   $5B7E  
;;  $5B6C       $5B64  
;;  $5B76       $5B6A   $5B70  
;;  $5B7A       $5B7C  
;;  $5B80       $5B78  
;;  $5C14       $5EB3  
;;  $5C19       $5CD5  
;;  $5C1E       $585B  
;;  $5C21       $5C17   $5C1C  
;;  $5C29       $5C3B  
;;  $5C59       $5408  
;;  $5C70       $5C6C  
;;  $5C97       $5C93  
;;  $5CC3       $5CAC  
;;  $5CE6       $52C9  
;;  $5CF5       $507C  
;;  $5CF9       $5CF3  
;;  $5D1C       $5D12  
;;  $5D27       $530E   $5D56   $5D5A  
;;  $5D49       $5842  
;;  $5D5A       $5D54  
;;  $5D63       $5518  
;;  $5D78       $5D73  
;;  $5D79       $5D6E  
;;  $5D82       $5381   $5836  
;;  $5D8A       $5906   $5D64  
;;  $5D97       $5D92  
;;  $5D98       $510C   $5114   $5DCF   $5DEF   $5E43   $5E4C  
;;  $5DA7       $5156   $5163   $529B   $5E47   $5E51   $5F8C   $5F94  
;;  $5DB2       $50F4   $517C   $51EA   $5D8D   $5E1E   $5ED0  
;;  $5DB9       $5E29   $5F0A  
;;  $5DC5       $5E25   $5F13  
;;  $5DCF       $5DC3   $5DF7  
;;  $5DD9       $5DBB  
;;  $5DDF       $5DC7  
;;  $5DE3       $5DDD  
;;  $5DF9       <entry>
;;  $5E07       $5DFD  
;;  $5E1B       $5E05   $5E16  
;;  $5E1C       $5E07  
;;  $5E1E       $5E5F  
;;  $5E3B       $5E38  
;;  $5E54       $5E23  
;;  $5E5C       $5E57  
;;  $5E62       $5E0A  
;;  $5E64       $5EAA  
;;  $5E84       $5E80  
;;  $5E91       $5E8E  
;;  $5E96       $5E93  
;;  $5EA7       $5E6A   $5E71   $5E78  
;;  $5EAD       $5EA5  
;;  $5EC6       $5211  
;;  $5ECD       $5E10  
;;  $5ED0       $5F06  
;;  $5EF6       $5EF1  
;;  $5F03       $5ED5   $5EDC   $5EE3   $5EF4  
;;  $5F09       $5137   $5E6C   $5ED7  
;;  $5F11       $5F0E   $5F17  
;;  $5F12       $513E   $5E73   $5EDE  
;;  $5F31       $5F37  
;;  $5F32       $5F2B  
;;  $5F3D       $5F2F  
;;  $5F40       $5F34   $5F57   $5F60  
;;  $5F4E       $5F48   $5F6A   $5F73   $5F85  
;;  $5F55       $5F27  
;;  $5F60       $5F23  
;;  $5F75       $5F5E  
;;  $5F99       $5F7D  
;;  $5FA9       $5F81   $5F97  
;;  $5FB5       $5F5A   $5F63  
;;  $5FB6       $5E0D  
;;  $5FB8       $5FFD  
;;  $5FCA       $5FC3  
;;  $5FE4       $5FDC  
;;  $5FE5       $5FD0  
;;  $5FF9       $5FF4  
;;  $5FFA       $5FBE   $5FC8   $5FE2   $5FEB  
;; ======================================================================== ;;
