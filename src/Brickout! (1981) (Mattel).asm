
        ORG     $5000
.HEADER:
        BIDECLE $5394           ; 5000  Ptr: MOB graphic images
        BIDECLE $5017           ; 5002  Ptr: EXEC timer table
        BIDECLE $506E           ; 5004  Ptr: Start of game
        BIDECLE $53CC           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5023           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5026           ; 500A  Ptr: Date/Title
        DECLE   $0000           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $000F           ; 5013  Border color init

        DECLE   $0000,  $01F0,  $01E8           ; 5014   0000 01F0 01E8
.TIMER:
        DECLE   $003C,  $0052,  $0001,  $0000; 5017  Timer dispatch/interval
        DECLE   $004F,  $0050,  $0001,  $0000; 501B  Timer dispatch/interval
        BIDECLE $0000           ; 501F  End of timer table

        DECLE   $0000,  $0000                   ; 5021   0000 0000
.GRAM_INIT_5023:
        DECLE   $0001           ; 5023  # of GRAM cards to init
        DECLE   $0143,  $0010   ; 5024  #00-00:  GROM #21-21 -Y--

.TITLE:
        DECLE   $0051                           ; 5026  Cartridge year
        STRING  "BRICKOUT"                      ; 5027  Title string
        DECLE   $0000                           ; 502F  


        PSHR    R5                              ; 5030   0275
        MVII    #$0007, R3                      ; 5031   02BB 0007
        MVII    #$023D, R4                      ; 5033   02BC 023D

        JSR     R5,     X_PRINT_R5              ; 5035   0004 0118 007B
        STRING  "   TIME BAUM DEPT.  "          ; 5038  
        STRING  " "                             ; 504C   0020
        DECLE   $0000                           ; 504D   0000

        PULR    R7                              ; 504E   02B7

L_504F:
        PSHR    R5                              ; 504F   0275
        MVI     G_0329, R0                      ; 5050   0280 0329

        JSR     R5,     X_UNPK_BYTES            ; 5052   0004 0114 0357

        MVI     G_0327, R1                      ; 5055   0281 0327
        ADDR    R1,     R0                      ; 5057   00C8
        MVO     R0,     G_0327                  ; 5058   0240 0327
        SWAP    R0,     1                       ; 505A   0040
        MOVR    R0,     R1                      ; 505B   0081
        ANDI    #$00FF, R1                      ; 505C   03B9 00FF
        CMPI    #$0097, R1                      ; 505E   0379 0097
        BNC     L_5064                          ; 5060   0209 0002

        MVII    #$0097, R0                      ; 5062   02B8 0097
L_5064:
        CMPI    #$0008, R1                      ; 5064   0379 0008
        BC      L_506A                          ; 5066   0201 0002

        MVII    #$0008, R0                      ; 5068   02B8 0008
L_506A:
        SWAP    R0,     1                       ; 506A   0040
        MVO     R0,     G_0327                  ; 506B   0240 0327
        PULR    R7                              ; 506D   02B7

.START:
        PSHR    R5                              ; 506E   0275
        MVII    #$0200, R4                      ; 506F   02BC 0200
        SDBD                                    ; 5071   0001
        MVII    #$37FF, R1                      ; 5072   02B9 00FF 0037
        MVII    #$00F0, R0                      ; 5075   02B8 00F0

        JSR     R5,     X_FILL_MEM              ; 5077   0004 0114 0341

        SDBD                                    ; 507A   0001
        MVII    #$311B, R1                      ; 507B   02B9 001B 0031
        MVII    #$0228, R4                      ; 507E   02BC 0228
        MVII    #$0014, R0                      ; 5080   02B8 0014

        JSR     R5,     X_FILL_MEM              ; 5082   0004 0114 0341

        SDBD                                    ; 5085   0001
        MVII    #$3592, R1                      ; 5086   02B9 0092 0035
        MVII    #$023C, R4                      ; 5089   02BC 023C
        MVII    #$0014, R0                      ; 508B   02B8 0014

        JSR     R5,     X_FILL_MEM              ; 508D   0004 0114 0341

        SDBD                                    ; 5090   0001
        MVII    #$3109, R1                      ; 5091   02B9 0009 0031
        MVII    #$0250, R4                      ; 5094   02BC 0250

        JSR     R5,     X_FILL_MEM              ; 5096   0004 0114 0341

        MVII    #$0325, R2                      ; 5099   02BA 0325
        SDBD                                    ; 509B   0001
        MVII    #$5362, R1                      ; 509C   02B9 0062 0053
        MVII    #$0002, R0                      ; 509F   02B8 0002

        JSR     R5,     X_INIT_MOBS             ; 50A1   0004 0114 02B4

        CLRR    R4                              ; 50A4   01E4
        SDBD                                    ; 50A5   0001
        MVII    #$50C5, R0                      ; 50A6   02B8 00C5 0050
        MVO     R0,     G_035D                  ; 50A9   0240 035D
        MVII    #$002D, R0                      ; 50AB   02B8 002D
        MVO     R0,     G_0160                  ; 50AD   0240 0160
        MVII    #$0006, R0                      ; 50AF   02B8 0006
        MVO     R0,     G_015F                  ; 50B1   0240 015F
        MVII    #$00A6, R0                      ; 50B3   02B8 00A6
        MVO     R0,     G_0116                  ; 50B5   0240 0116
        MVII    #$0008, R0                      ; 50B7   02B8 0008
        MVO     R0,     G_0117                  ; 50B9   0240 0117
        MVII    #$0014, R0                      ; 50BB   02B8 0014
        MVO     R0,     G_0163                  ; 50BD   0240 0163
        CLRR    R0                              ; 50BF   01C0
        MVO     R0,     G_0161                  ; 50C0   0240 0161
        MVO     R0,     G_0162                  ; 50C2   0240 0162
        PULR    R7                              ; 50C4   02B7

        COMR    R3                              ; 50C5   001B
        RLC     R2,     1                       ; 50C6   0052
        RSWD    R4                              ; 50C7   003C
        RLC     R2,     1                       ; 50C8   0052
        ADDR    R1,     R7                      ; 50C9   00CF

        DECLE   $0050,  $0000,  $0000,  $0000   ; 50CA   0050 0000 0000 0000
        DECLE   $0000                           ; 50CE   0000

        PSHR    R5                              ; 50CF   0275
        CMPI    #$0001, R0                      ; 50D0   0378 0001
        BEQ     L_50D9                          ; 50D2   0204 0005

        MVII    #$001E, R0                      ; 50D4   02B8 001E
        MVO     R0,     G_0160                  ; 50D6   0240 0160
        PULR    R7                              ; 50D8   02B7

L_50D9:
        MVI     G_0331, R1                      ; 50D9   0281 0331
        TSTR    R1                              ; 50DB   0089
        BNEQ    L_5114                          ; 50DC   020C 0036

        MVI     G_0163, R0                      ; 50DE   0280 0163
        DECR    R0                              ; 50E0   0010
        TSTR    R0                              ; 50E1   0080
        BMI     L_5114                          ; 50E2   020B 0030

        MVO     R0,     G_0163                  ; 50E4   0240 0163
        MVII    #$005F, R0                      ; 50E6   02B8 005F
        MVO     R0,     G_0333                  ; 50E8   0240 0333
        MVII    #$0019, R0                      ; 50EA   02B8 0019
        MVII    #$000E, R1                      ; 50EC   02B9 000E

        JSR     R5,     .EXEC.629               ; 50EE   0004 0114 0229

        MOVR    R0,     R3                      ; 50F1   0083
        MVII    #$0010, R0                      ; 50F2   02B8 0010

        JSR     R5,     X_RAND1                 ; 50F4   0004 0114 027D

        SDBD                                    ; 50F7   0001
        ANDI    #$800F, R0                      ; 50F8   03B8 000F 0080
        MOVR    R0,     R2                      ; 50FB   0082
        MVII    #$0001, R0                      ; 50FC   02B8 0001

        JSR     R5,     X_RAND1                 ; 50FE   0004 0114 027D

        TSTR    R0                              ; 5101   0080
        BEQ     L_5115                          ; 5102   0204 0011

        MVII    #$00A4, R0                      ; 5104   02B8 00A4
        SWAP    R0,     1                       ; 5106   0040
        MVO     R0,     G_032F                  ; 5107   0240 032F
        MOVR    R3,     R0                      ; 5109   0098

        JSR     R5,     X_UNPK_BYTES            ; 510A   0004 0114 0357

        NEGR    R0                              ; 510D   0020
        ADDR    R2,     R0                      ; 510E   00D0

        JSR     R5,     X_PACK_BYTES            ; 510F   0004 0114 034F

        MVO     R0,     G_0331                  ; 5112   0240 0331
L_5114:
        PULR    R7                              ; 5114   02B7

L_5115:
        MOVR    R3,     R0                      ; 5115   0098

        JSR     R5,     X_UNPK_BYTES            ; 5116   0004 0114 0357

        ADDR    R2,     R0                      ; 5119   00D0

        JSR     R5,     X_PACK_BYTES            ; 511A   0004 0114 034F

        MVO     R0,     G_0331                  ; 511D   0240 0331
        PULR    R7                              ; 511F   02B7

        PSHR    R5                              ; 5120   0275
        MVII    #$0004, R0                      ; 5121   02B8 0004

        JSR     R5,     X_RAND1                 ; 5123   0004 0114 027D

        MOVR    R0,     R2                      ; 5126   0082
        CMPI    #$0001, R0                      ; 5127   0378 0001
        BNEQ    L_5134                          ; 5129   020C 0009

        MVI     G_032B, R3                      ; 512B   0283 032B
        TSTR    R3                              ; 512D   009B
        BNEQ    L_5134                          ; 512E   020C 0004

        MVII    #$0028, R3                      ; 5130   02BB 0028
        MVO     R3,     G_032B                  ; 5132   0243 032B
L_5134:
        ANDI    #$0001, R0                      ; 5134   03B8 0001
        BEQ     L_5139                          ; 5136   0204 0001

        NEGR    R2                              ; 5138   0022
L_5139:
        MVI     G_0331, R0                      ; 5139   0280 0331

        JSR     R5,     X_UNPK_BYTES            ; 513B   0004 0114 0357

        ADDR    R2,     R0                      ; 513E   00D0

        JSR     R5,     X_PACK_BYTES            ; 513F   0004 0114 034F

        MVO     R0,     G_0331                  ; 5142   0240 0331
        MVI     G_0333, R1                      ; 5144   0281 0333
        TSTR    R1                              ; 5146   0089
        BEQ     L_5155                          ; 5147   0204 000C

        MVI     G_0333, R0                      ; 5149   0280 0333
        CMPI    #$0003, R0                      ; 514B   0378 0003
        BLE     L_5150                          ; 514D   0206 0001
        PULR    R7                              ; 514F   02B7

L_5150:
        MVII    #$0003, R0                      ; 5150   02B8 0003
        MVO     R0,     G_0333                  ; 5152   0240 0333
        PULR    R7                              ; 5154   02B7

L_5155:
        SWAP    R0,     1                       ; 5155   0040
        MVI     G_032B, R0                      ; 5156   0280 032B
        TSTR    R0                              ; 5158   0080
        BNEQ    L_515F                          ; 5159   020C 0004

        MVII    #$0003, R0                      ; 515B   02B8 0003
        MVO     R0,     G_0333                  ; 515D   0240 0333
L_515F:
        SWAP    R0,     1                       ; 515F   0040

        JSR     R5,     L_53E2                  ; 5160   0004 0150 03E2

        MVI     G_015D, R2                      ; 5163   0282 015D
        TSTR    R2                              ; 5165   0092
        BNEQ    L_516C                          ; 5166   020C 0004

        MVII    #$0002, R2                      ; 5168   02BA 0002
        B       L_516E                          ; 516A   0200 0002

L_516C:
        MVII    #$0001, R2                      ; 516C   02BA 0001

L_516E:
        JSR     R5,     L_5173                  ; 516E   0004 0150 0173

        B       L_5189                          ; 5171   0200 0016

L_5173:
        PSHR    R5                              ; 5173   0275
        MVII    #$0161, R4                      ; 5174   02BC 0161
        SDBD                                    ; 5176   0001
        MVI@    R4,     R0                      ; 5177   02A0
        ADDR    R2,     R0                      ; 5178   00D0
        MVO     R0,     G_0161                  ; 5179   0240 0161
        SWAP    R0,     1                       ; 517B   0040
        MVO     R0,     G_0162                  ; 517C   0240 0162
        MVII    #$0004, R1                      ; 517E   02B9 0004
        MVII    #$0007, R3                      ; 5180   02BB 0007
        MVII    #$02EA, R4                      ; 5182   02BC 02EA
        SWAP    R0,     1                       ; 5184   0040

        JSR     R5,     X_PRNUM_RGT             ; 5185   0004 0118 00C5

        PULR    R7                              ; 5188   02B7

L_5189:
        MVII    #$0161, R4                      ; 5189   02BC 0161
        SDBD                                    ; 518B   0001
        MVI@    R4,     R1                      ; 518C   02A1
        MVII    #$001E, R2                      ; 518D   02BA 001E

        JSR     R5,     X_DIV                   ; 518F   0004 011C 01FB

        TSTR    R1                              ; 5192   0089
        BNEQ    L_519C                          ; 5193   020C 0007

        MVI     G_015E, R1                      ; 5195   0281 015E
        BNEQ    L_519C                          ; 5197   020C 0003

        JSR     R5,     L_54EE                  ; 5199   0004 0154 00EE

L_519C:
        MVI     G_0330, R0                      ; 519C   0280 0330
        MVI     G_0331, R1                      ; 519E   0281 0331
        SWAP    R1,     1                       ; 51A0   0041
        TSTR    R1                              ; 51A1   0089
        B       L_51A6                          ; 51A2   0200 0002

        ADDI    #$0100, R0                      ; 51A4   02F8 0100
L_51A6:
        MVO     R0,     G_0330                  ; 51A6   0240 0330
        SWAP    R0,     1                       ; 51A8   0040
        ANDI    #$00FF, R0                      ; 51A9   03B8 00FF
        SLR     R0,     2                       ; 51AB   0064
        SLR     R0,     1                       ; 51AC   0060
        MVII    #$0014, R1                      ; 51AD   02B9 0014
        DECR    R0                              ; 51AF   0010

        JSR     R5,     X_MPY                   ; 51B0   0004 011C 01DC

        MVI     G_032F, R0                      ; 51B3   0280 032F
        MVI     G_0331, R1                      ; 51B5   0281 0331
        TSTR    R1                              ; 51B7   0089
        B       L_51BC                          ; 51B8   0200 0002

        ADDI    #$0100, R0                      ; 51BA   02F8 0100
L_51BC:
        MVO     R0,     G_032F                  ; 51BC   0240 032F
        SWAP    R0,     1                       ; 51BE   0040
        ANDI    #$00FF, R0                      ; 51BF   03B8 00FF
        SLR     R0,     2                       ; 51C1   0064
        SLR     R0,     1                       ; 51C2   0060
        DECR    R0                              ; 51C3   0010
        ADDR    R0,     R2                      ; 51C4   00C2
        MVII    #$0200, R1                      ; 51C5   02B9 0200
        ADDR    R1,     R2                      ; 51C7   00CA
        MOVR    R2,     R3                      ; 51C8   0093
        MVI     G_0330, R1                      ; 51C9   0281 0330
        SWAP    R1,     1                       ; 51CB   0041
        ANDI    #$00FF, R1                      ; 51CC   03B9 00FF
        MVII    #$0008, R2                      ; 51CE   02BA 0008

        JSR     R5,     X_DIV                   ; 51D0   0004 011C 01FB

        ANDI    #$0007, R1                      ; 51D3   03B9 0007
        SLR     R1,     2                       ; 51D5   0065
        PSHR    R1                              ; 51D6   0271
        MVI     G_032F, R1                      ; 51D7   0281 032F
        SWAP    R1,     1                       ; 51D9   0041
        ANDI    #$00FF, R1                      ; 51DA   03B9 00FF
        MVII    #$0008, R2                      ; 51DC   02BA 0008

        JSR     R5,     X_DIV                   ; 51DE   0004 011C 01FB

        ANDI    #$0007, R1                      ; 51E1   03B9 0007
        SLR     R1,     2                       ; 51E3   0065
        MVI     G_015D, R2                      ; 51E4   0282 015D
        TSTR    R2                              ; 51E6   0092
        BEQ     L_5271                          ; 51E7   0204 0088

        MVII    #$0007, R2                      ; 51E9   02BA 0007
        TSTR    R1                              ; 51EB   0089
        BEQ     L_51F6                          ; 51EC   0204 0008

        SLL     R2,     2                       ; 51EE   004E
        SLL     R2,     1                       ; 51EF   004A
        PULR    R1                              ; 51F0   02B1
        TSTR    R1                              ; 51F1   0089
        BNEQ    L_5205                          ; 51F2   020C 0011
        B       L_51FD                          ; 51F4   0200 0007

L_51F6:
        PULR    R1                              ; 51F6   02B1
        TSTR    R1                              ; 51F7   0089
        BEQ     L_51FD                          ; 51F8   0204 0003

        SLL     R2,     2                       ; 51FA   004E
        SLL     R2,     2                       ; 51FB   004E
        SLL     R2,     2                       ; 51FC   004E
L_51FD:
        MVI@    R3,     R0                      ; 51FD   0298
        PSHR    R2                              ; 51FE   0272
        COMR    R2                              ; 51FF   001A
        ANDR    R2,     R0                      ; 5200   0190
        XOR@    R6,     R0                      ; 5201   03F0
        MVO@    R0,     R3                      ; 5202   0258
        B       L_5219                          ; 5203   0200 0014

L_5205:
        SLL     R2,     2                       ; 5205   004E
        SLL     R2,     2                       ; 5206   004E
        SLL     R2,     2                       ; 5207   004E
        MOVR    R2,     R1                      ; 5208   0091
        SDBD                                    ; 5209   0001
        ANDI    #$0800, R1                      ; 520A   03B9 0000 0008
        BEQ     L_51FD                          ; 520D   0224 0011

        SDBD                                    ; 520F   0001
        ANDI    #$17FF, R2                      ; 5210   03BA 00FF 0017
        SDBD                                    ; 5213   0001
        XORI    #$2000, R2                      ; 5214   03FA 0000 0020
        B       L_51FD                          ; 5217   0220 001B
L_5219:
        B       L_52B7                          ; 5219   0200 009C

        PSHR    R5                              ; 521B   0275
        TSTR    R0                              ; 521C   0080
        BMI     L_5236                          ; 521D   020B 0017

        CMPI    #$000C, R0                      ; 521F   0378 000C
        BEQ     L_5236                          ; 5221   0204 0013
        BC      L_5230                          ; 5223   0201 000B

        CMPI    #$0004, R0                      ; 5225   0378 0004
        BNC     L_5230                          ; 5227   0209 0007

L_5229:
        MVII    #$007F, R0                      ; 5229   02B8 007F
        NEGR    R0                              ; 522B   0020
        ANDI    #$00FF, R0                      ; 522C   03B8 00FF
        B       L_5232                          ; 522E   0200 0002

L_5230:
        MVII    #$007F, R0                      ; 5230   02B8 007F
L_5232:
        SWAP    R0,     1                       ; 5232   0040
        MVO     R0,     G_0329                  ; 5233   0240 0329
        PULR    R7                              ; 5235   02B7

L_5236:
        CLRR    R0                              ; 5236   01C0
        MVO     R0,     G_032A                  ; 5237   0240 032A
        MVO     R0,     G_0329                  ; 5239   0240 0329
        PULR    R7                              ; 523B   02B7

L_523C:
        PSHR    R5                              ; 523C   0275
        MVI     G_0330, R0                      ; 523D   0280 0330
        SDBD                                    ; 523F   0001
        CMPI    #$5C00, R0                      ; 5240   0378 0000 005C
        BNC     L_524F                          ; 5243   0209 000A

        MVII    #$0014, R0                      ; 5245   02B8 0014
        CLRR    R1                              ; 5247   01C9
        MVII    #$02DC, R4                      ; 5248   02BC 02DC

        JSR     R5,     X_FILL_MEM              ; 524A   0004 0114 0341

        B       L_525E                          ; 524D   0200 000F

L_524F:
        CLRR    R2                              ; 524F   01D2
        MVI     G_0163, R0                      ; 5250   0280 0163
        MVII    #$0002, R1                      ; 5252   02B9 0002
        MVII    #$0007, R3                      ; 5254   02BB 0007
        MVII    #$02DD, R4                      ; 5256   02BC 02DD

        JSR     R5,     X_PRNUM_RGT             ; 5258   0004 0118 00C5
        JSR     R5,     L_5173                  ; 525B   0004 0150 0173
L_525E:
        JSR     R5,     .EXEC.4F1               ; 525E   0004 0114 00F1

        MVI     G_011F, R0                      ; 5261   0280 011F
        MOVR    R0,     R1                      ; 5263   0081
        ANDI    #$0040, R0                      ; 5264   03B8 0040
        BNEQ    L_5236                          ; 5266   022C 0031

        CMPI    #$0087, R1                      ; 5268   0379 0087
        BEQ     L_5229                          ; 526A   0224 0042

        CMPI    #$0089, R1                      ; 526C   0379 0089
        BEQ     L_5230                          ; 526E   0224 003F
        PULR    R7                              ; 5270   02B7

L_5271:
        PULR    R1                              ; 5271   02B1
        TSTR    R1                              ; 5272   0089
        BEQ     L_527B                          ; 5273   0204 0006

        SDBD                                    ; 5275   0001
        MVII    #$37C0, R2                      ; 5276   02BA 00C0 0037
        B       L_51FD                          ; 5279   0220 007D

L_527B:
        MVII    #$003F, R2                      ; 527B   02BA 003F
        B       L_51FD                          ; 527D   0220 0081

        PSHR    R5                              ; 527F   0275
        SLL     R2,     1                       ; 5280   004A
        ADDR    R2,     R7                      ; 5281   00D7
        B       L_52CE                          ; 5282   0200 004A
        B       L_52CE                          ; 5284   0200 0048
        B       L_528A                          ; 5286   0200 0002
        B       L_52B4                          ; 5288   0200 002A

L_528A:
        CLRR    R0                              ; 528A   01C0
        MVO     R0,     G_032F                  ; 528B   0240 032F
        MVO     R0,     G_0331                  ; 528D   0240 0331
        MVII    #$0032, R0                      ; 528F   02B8 0032
        SWAP    R0,     1                       ; 5291   0040
        MVO     R0,     G_0330                  ; 5292   0240 0330
        MVI     G_0163, R0                      ; 5294   0280 0163
        TSTR    R0                              ; 5296   0080
        BNEQ    L_52B3                          ; 5297   020C 001A

        MVII    #$0007, R3                      ; 5299   02BB 0007
        MVII    #$02A3, R4                      ; 529B   02BC 02A3

        JSR     R5,     X_PRINT_R5              ; 529D   0004 0118 007B
        STRING  "  GAME OVER"                   ; 52A0  
        DECLE   $0000                           ; 52AB   0000

        MVII    #$0003, R3                      ; 52AC   02BB 0003
        MVII    #$02B6, R4                      ; 52AE   02BC 02B6

        JSR     R5,     L_5402                  ; 52B0   0004 0154 0002

L_52B3:
        PULR    R7                              ; 52B3   02B7

L_52B4:
        JSR     R5,     L_53D4                  ; 52B4   0004 0150 03D4

L_52B7:
        MVI     G_0331, R0                      ; 52B7   0280 0331

        JSR     R5,     X_UNPK_BYTES            ; 52B9   0004 0114 0357

        MOVR    R0,     R2                      ; 52BC   0082
        MVII    #$0010, R0                      ; 52BD   02B8 0010

        JSR     R5,     X_RAND1                 ; 52BF   0004 0114 027D

        SDBD                                    ; 52C2   0001
        ANDI    #$8003, R0                      ; 52C3   03B8 0003 0080
        ADDR    R2,     R0                      ; 52C6   00D0
        NEGR    R1                              ; 52C7   0021

        JSR     R5,     X_PACK_BYTES            ; 52C8   0004 0114 034F

        MVO     R0,     G_0331                  ; 52CB   0240 0331
        PULR    R7                              ; 52CD   02B7

L_52CE:
        MVI     G_0331, R0                      ; 52CE   0280 0331

        JSR     R5,     X_UNPK_BYTES            ; 52D0   0004 0114 0357

        NEGR    R0                              ; 52D3   0020

        JSR     R5,     X_PACK_BYTES            ; 52D4   0004 0114 034F

        MVO     R0,     G_0331                  ; 52D7   0240 0331

        JSR     R5,     L_53D4                  ; 52D9   0004 0150 03D4

        PULR    R7                              ; 52DC   02B7

        PSHR    R5                              ; 52DD   0275

        JSR     R5,     L_53F4                  ; 52DE   0004 0150 03F4

        CLRR    R0                              ; 52E1   01C0
        MVO     R0,     G_0333                  ; 52E2   0240 0333
        MVI     G_0327, R1                      ; 52E4   0281 0327
        MVI     G_032F, R0                      ; 52E6   0280 032F
        SUBR    R1,     R0                      ; 52E8   0108
        SDBD                                    ; 52E9   0001
        CMPI    #$0400, R0                      ; 52EA   0378 0000 0004
        BLE     L_530A                          ; 52ED   0206 001B

        SDBD                                    ; 52EF   0001
        CMPI    #$0B00, R0                      ; 52F0   0378 0000 000B
        BLE     L_5341                          ; 52F3   0206 004C

        MVI     G_0331, R0                      ; 52F5   0280 0331

        JSR     R5,     X_UNPK_BYTES            ; 52F7   0004 0114 0357

        NEGR    R1                              ; 52FA   0021

        JSR     R5,     L_5351                  ; 52FB   0004 0150 0351
        JSR     R5,     .EXEC.A2F               ; 52FE   0004 0118 022F

        SUBI    #$0001, R1                      ; 5301   0339 0001
        TSTR    R1                              ; 5303   0089
        BEQ     L_5322                          ; 5304   0204 001C

        MVO     R1,     G_015F                  ; 5306   0241 015F
        B       L_5326                          ; 5308   0200 001C

L_530A:
        MVI     G_0331, R0                      ; 530A   0280 0331

        JSR     R5,     X_UNPK_BYTES            ; 530C   0004 0114 0357

        NEGR    R1                              ; 530F   0021

        JSR     R5,     L_5351                  ; 5310   0004 0150 0351
        JSR     R5,     .EXEC.A2F               ; 5313   0004 0118 022F

        ADDI    #$0001, R1                      ; 5316   02F9 0001
        CMPI    #$0008, R1                      ; 5318   0379 0008
        BLT     L_5324                          ; 531A   0205 0008

        MVII    #$0007, R0                      ; 531C   02B8 0007
        MVO     R0,     G_015F                  ; 531E   0240 015F
        B       L_5326                          ; 5320   0200 0004

L_5322:
        MVII    #$0001, R1                      ; 5322   02B9 0001
L_5324:
        MVO     R1,     G_015F                  ; 5324   0241 015F
L_5326:
        MVI     G_0160, R0                      ; 5326   0280 0160
        ADDI    #$0003, R0                      ; 5328   02F8 0003
        CMPI    #$003F, R0                      ; 532A   0378 003F
        BNC     L_5330                          ; 532C   0209 0002

        SUBI    #$0003, R0                      ; 532E   0338 0003
L_5330:
        MVO     R0,     G_0160                  ; 5330   0240 0160
        MVI     G_015F, R1                      ; 5332   0281 015F

        JSR     R5,     .EXEC.629               ; 5334   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 5337   0004 0114 0357

        ADDR    R3,     R0                      ; 533A   00D8

        JSR     R5,     X_PACK_BYTES            ; 533B   0004 0114 034F

        MVO     R0,     G_0331                  ; 533E   0240 0331
        PULR    R7                              ; 5340   02B7

L_5341:
        MVI     G_0331, R0                      ; 5341   0280 0331

        JSR     R5,     X_UNPK_BYTES            ; 5343   0004 0114 0357

        NEGR    R1                              ; 5346   0021

        JSR     R5,     L_5351                  ; 5347   0004 0150 0351
        JSR     R5,     .EXEC.A2F               ; 534A   0004 0118 022F

        MVO     R1,     G_015F                  ; 534D   0241 015F
        B       L_5326                          ; 534F   0220 002A

L_5351:
        PSHR    R5                              ; 5351   0275
        MOVR    R0,     R2                      ; 5352   0082

        JSR     R5,     .EXEC.A2F               ; 5353   0004 0118 022F

        MVI     G_0160, R0                      ; 5356   0280 0160

        JSR     R5,     .EXEC.629               ; 5358   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 535B   0004 0114 0357

        MOVR    R0,     R3                      ; 535E   0083
        SUBR    R2,     R3                      ; 535F   0113
        MOVR    R2,     R0                      ; 5360   0090
        PULR    R7                              ; 5361   02B7

        DECLE   $0041,  $0038,  $0082,  $0053   ; 5362   0041 0038 0082 0053
        DECLE   $0000,  $0053,  $0000,  $005B   ; 5366   0000 0053 0000 005B
        DECLE   $0000,  $0000,  $0000,  $0000   ; 536A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 536E   0000 0000 0000 0000
        DECLE   $0087,  $0018,  $0089,  $0053   ; 5372   0087 0018 0089 0053
        DECLE   $0000,  $0000,  $0000,  $0032   ; 5376   0000 0000 0000 0032
        DECLE   $0000,  $0000,  $0000,  $0000   ; 537A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 537E   0000 0000 0000 0000
        DECLE   $0200,  $0000,  $0000,  $0000   ; 5382   0200 0000 0000 0000
        DECLE   $0008,  $0000,  $0000,  $037F   ; 5386   0008 0000 0000 037F
        DECLE   $0052,  $0000,  $0000,  $0001   ; 538A   0052 0000 0000 0001
        DECLE   $0006,  $0003,  $0020,  $0051   ; 538E   0006 0003 0020 0051
        DECLE   $00DD,  $0152,  $00FF,  $00FF   ; 5392   00DD 0152 00FF 00FF
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5396   00FF 0000 0000 0000
        DECLE   $0000,  $0000,  $0300,  $0300   ; 539A   0000 0000 0300 0300
        DECLE   $0300,  $0300,  $0300,  $0300   ; 539E   0300 0300 0300 0300
        DECLE   $0300,  $0300,  $03FF,  $03FF   ; 53A2   0300 0300 03FF 03FF
        DECLE   $0300,  $0300,  $030C,  $030C   ; 53A6   0300 0300 030C 030C
        DECLE   $030C,  $030C,  $0300,  $0300   ; 53AA   030C 030C 0300 0300
        DECLE   $0300,  $0300,  $0300,  $0300   ; 53AE   0300 0300 0300 0300
        DECLE   $0300,  $0300,  $0300,  $0300   ; 53B2   0300 0300 0300 0300
        DECLE   $0300,  $0300,  $0300,  $0300   ; 53B6   0300 0300 0300 0300
        DECLE   $0300,  $0300,  $0300,  $0300   ; 53BA   0300 0300 0300 0300
        DECLE   $0300,  $0300,  $0300,  $0300   ; 53BE   0300 0300 0300 0300
        DECLE   $03FF,  $03FF,  $0080,  $0000   ; 53C2   03FF 03FF 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53C6   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 53CA   0000 0000
.GFX_LIST_53CC:
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 53CC   0000 0000 0000 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 53D0   00FF 00FF 00FF 00FF
L_53D4:
        PSHR    R5                              ; 53D4   0275

        JSR     R5,     X_PLAY_SFX1             ; 53D5   0004 0118 03BB
        DECLE   $0040,  $0280                   ; 53D8  SFX data
        DECLE   $0048,  $0340                   ; 53DA  SFX data
        DECLE   $03C9                           ; 53DC  SFX data
        DECLE   $002C,  $0000                   ; 53DD  SFX data
        DECLE   $000B                           ; 53DF  SFX data
        DECLE   $03CF                           ; 53E0  SFX end


        PULR    R7                              ; 53E1   02B7

L_53E2:
        PSHR    R5                              ; 53E2   0275

        JSR     R5,     X_PLAY_SFX1             ; 53E3   0004 0118 03BB
        DECLE   $0040,  $0040                   ; 53E6  SFX data
        DECLE   $0048,  $0080                   ; 53E8  SFX data
        DECLE   $0044,  $0040                   ; 53EA  SFX data
        DECLE   $0031,  $03B1                   ; 53EC  SFX data
        DECLE   $0389                           ; 53EE  SFX data
        DECLE   $001C,  $0000                   ; 53EF  SFX data
        DECLE   $000B                           ; 53F1  SFX data
        DECLE   $03CF                           ; 53F2  SFX end


        PULR    R7                              ; 53F3   02B7

L_53F4:
        PSHR    R5                              ; 53F4   0275

        JSR     R5,     X_PLAY_SFX1             ; 53F5   0004 0118 03BB
        DECLE   $0058,  $0000                   ; 53F8  SFX data
        DECLE   $0359                           ; 53FA  SFX data
        DECLE   $00AD                           ; 53FB  SFX data
        DECLE   $000C,  $0340                   ; 53FC  SFX data
        DECLE   $01B7                           ; 53FE  SFX data
        DECLE   $000B                           ; 53FF  SFX data
        DECLE   $03CF                           ; 5400  SFX end


        PULR    R7                              ; 5401   02B7

L_5402:
        PSHR    R5                              ; 5402   0275
        MVII    #$0003, R3                      ; 5403   02BB 0003
        MVII    #$02B5, R4                      ; 5405   02BC 02B5
        MVII    #$0161, R5                      ; 5407   02BD 0161
        SDBD                                    ; 5409   0001
        MVI@    R5,     R0                      ; 540A   02A8
        MVI     G_015E, R2                      ; 540B   0282 015E
        TSTR    R2                              ; 540D   0092
        BNEQ    L_5416                          ; 540E   020C 0006

        MOVR    R0,     R1                      ; 5410   0081
        MVII    #$0005, R2                      ; 5411   02BA 0005

        JSR     R5,     X_DIV                   ; 5413   0004 011C 01FB

L_5416:
        CMPI    #$0032, R0                      ; 5416   0378 0032
        BGE     L_5431                          ; 5418   020D 0017

        JSR     R5,     X_PRINT_R5              ; 541A   0004 0118 007B
        STRING  "RATING: NO COMMENT"            ; 541D  
        DECLE   $0000                           ; 542F   0000

        PULR    R7                              ; 5430   02B7

L_5431:
        CMPI    #$0064, R0                      ; 5431   0378 0064
        BGE     L_544B                          ; 5433   020D 0016

        JSR     R5,     X_PRINT_R5              ; 5435   0004 0118 007B
        STRING  "RATING: TRY CARDS"             ; 5438  
        DECLE   $0000                           ; 5449   0000

        PULR    R7                              ; 544A   02B7

L_544B:
        CMPI    #$0096, R0                      ; 544B   0378 0096
        BGE     L_5460                          ; 544D   020D 0011

        JSR     R5,     X_PRINT_R5              ; 544F   0004 0118 007B
        STRING  "RATING: FAIR"                  ; 5452  
        DECLE   $0000                           ; 545E   0000

        PULR    R7                              ; 545F   02B7

L_5460:
        CMPI    #$00C8, R0                      ; 5460   0378 00C8
        BGE     L_5475                          ; 5462   020D 0011

        JSR     R5,     X_PRINT_R5              ; 5464   0004 0118 007B
        STRING  "RATING: GOOD"                  ; 5467  
        DECLE   $0000                           ; 5473   0000

        PULR    R7                              ; 5474   02B7

L_5475:
        CMPI    #$00E1, R0                      ; 5475   0378 00E1
        BGE     L_548F                          ; 5477   020D 0016

        JSR     R5,     X_PRINT_R5              ; 5479   0004 0118 007B
        STRING  "RATING: VERY GOOD"             ; 547C  
        DECLE   $0000                           ; 548D   0000

        PULR    R7                              ; 548E   02B7

L_548F:
        CMPI    #$00EB, R0                      ; 548F   0378 00EB
        BGE     L_54A9                          ; 5491   020D 0016

        JSR     R5,     X_PRINT_R5              ; 5493   0004 0118 007B
        STRING  "RATING: EXCELLENT"             ; 5496  
        DECLE   $0000                           ; 54A7   0000

        PULR    R7                              ; 54A8   02B7

L_54A9:
        CMPI    #$00EF, R0                      ; 54A9   0378 00EF
        BGE     L_54C3                          ; 54AB   020D 0016

        JSR     R5,     X_PRINT_R5              ; 54AD   0004 0118 007B
        STRING  "RATING: DANGEROUS"             ; 54B0  
        DECLE   $0000                           ; 54C1   0000

        PULR    R7                              ; 54C2   02B7

L_54C3:
        CMPI    #$00F0, R0                      ; 54C3   0378 00F0
        BGE     L_54DE                          ; 54C5   020D 0017

        JSR     R5,     X_PRINT_R5              ; 54C7   0004 0118 007B
        STRING  "RATING: CLASSIFIED"            ; 54CA  
        DECLE   $0000                           ; 54DC   0000

        PULR    R7                              ; 54DD   02B7

L_54DE:
        JSR     R5,     X_PRINT_R5              ; 54DE   0004 0118 007B
        STRING  "RATING: ACE"                   ; 54E1  
        DECLE   $0000                           ; 54EC   0000

        PULR    R7                              ; 54ED   02B7

L_54EE:
        PSHR    R5                              ; 54EE   0275
        MVII    #$0161, R4                      ; 54EF   02BC 0161
        SDBD                                    ; 54F1   0001
        MVI@    R4,     R1                      ; 54F2   02A1
        CMPI    #$012C, R1                      ; 54F3   0379 012C
        BGE     L_5504                          ; 54F5   020D 000D

        MVII    #$003C, R2                      ; 54F7   02BA 003C

        JSR     R5,     X_DIV                   ; 54F9   0004 011C 01FB

        TSTR    R1                              ; 54FC   0089
        BNEQ    L_558F                          ; 54FD   020C 0090

        MVII    #$0001, R0                      ; 54FF   02B8 0001
        PSHR    R0                              ; 5501   0270
        B       L_5507                          ; 5502   0200 0003

L_5504:
        MVII    #$0002, R0                      ; 5504   02B8 0002
        PSHR    R0                              ; 5506   0270
L_5507:
        MVII    #$0014, R0                      ; 5507   02B8 0014
        MVII    #$028C, R4                      ; 5509   02BC 028C
        MVII    #$02A0, R1                      ; 550B   02B9 02A0

        JSR     R5,     .EXEC.730               ; 550D   0004 0114 0330

        MVII    #$0014, R0                      ; 5510   02B8 0014
        MVII    #$0278, R4                      ; 5512   02BC 0278
        MVII    #$028C, R1                      ; 5514   02B9 028C

        JSR     R5,     .EXEC.730               ; 5516   0004 0114 0330

        MVII    #$0014, R0                      ; 5519   02B8 0014
        MVII    #$0264, R4                      ; 551B   02BC 0264
        MVII    #$0278, R1                      ; 551D   02B9 0278

        JSR     R5,     .EXEC.730               ; 551F   0004 0114 0330

        MVII    #$0014, R0                      ; 5522   02B8 0014
        MVII    #$0250, R4                      ; 5524   02BC 0250
        MVII    #$0264, R1                      ; 5526   02B9 0264

        JSR     R5,     .EXEC.730               ; 5528   0004 0114 0330

        MVII    #$0014, R0                      ; 552B   02B8 0014
        MVII    #$023C, R4                      ; 552D   02BC 023C
        MVII    #$0250, R1                      ; 552F   02B9 0250

        JSR     R5,     .EXEC.730               ; 5531   0004 0114 0330

        MVII    #$0014, R0                      ; 5534   02B8 0014
        MVII    #$0228, R4                      ; 5536   02BC 0228
        MVII    #$023C, R1                      ; 5538   02B9 023C

        JSR     R5,     .EXEC.730               ; 553A   0004 0114 0330

        MVII    #$0014, R0                      ; 553D   02B8 0014
        MVII    #$0214, R4                      ; 553F   02BC 0214
        MVII    #$0228, R1                      ; 5541   02B9 0228

        JSR     R5,     .EXEC.730               ; 5543   0004 0114 0330

        MVII    #$0014, R0                      ; 5546   02B8 0014
        MVII    #$0200, R4                      ; 5548   02BC 0200
        MVII    #$0214, R1                      ; 554A   02B9 0214

        JSR     R5,     .EXEC.730               ; 554C   0004 0114 0330

        MVII    #$0161, R4                      ; 554F   02BC 0161
        SDBD                                    ; 5551   0001
        MVI@    R4,     R0                      ; 5552   02A0
        PULR    R1                              ; 5553   02B1

        JSR     R5,     X_MPY                   ; 5554   0004 011C 01DC

        MOVR    R2,     R1                      ; 5557   0091
        MVII    #$012C, R2                      ; 5558   02BA 012C

        JSR     R5,     X_DIV                   ; 555A   0004 011C 01FB

        TSTR    R1                              ; 555D   0089
        BNEQ    L_5566                          ; 555E   020C 0006

        SDBD                                    ; 5560   0001
        MVII    #$37FF, R1                      ; 5561   02B9 00FF 0037
        B       L_5588                          ; 5564   0200 0022

L_5566:
        CMPI    #$003C, R1                      ; 5566   0379 003C
        BGT     L_5570                          ; 5568   020E 0006

        SDBD                                    ; 556A   0001
        MVII    #$3109, R1                      ; 556B   02B9 0009 0031
        B       L_5588                          ; 556E   0200 0018

L_5570:
        CMPI    #$0078, R1                      ; 5570   0379 0078
        BGT     L_557A                          ; 5572   020E 0006

        SDBD                                    ; 5574   0001
        MVII    #$14B6, R1                      ; 5575   02B9 00B6 0014
        B       L_5588                          ; 5578   0200 000E

L_557A:
        CMPI    #$00B4, R1                      ; 557A   0379 00B4
        BGT     L_5584                          ; 557C   020E 0006

        SDBD                                    ; 557E   0001
        MVII    #$311B, R1                      ; 557F   02B9 001B 0031
        B       L_5588                          ; 5582   0200 0004

L_5584:
        SDBD                                    ; 5584   0001
        MVII    #$37FF, R1                      ; 5585   02B9 00FF 0037
L_5588:
        MVII    #$0014, R0                      ; 5588   02B8 0014
        MVII    #$0200, R4                      ; 558A   02BC 0200

        JSR     R5,     X_FILL_MEM              ; 558C   0004 0114 0341

L_558F:
        PULR    R7                              ; 558F   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5590   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5594   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5598   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 559C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55A0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55A4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55A8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55AC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55B0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55B4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55B8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55BC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55C0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55C4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55C8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55CC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55D0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55D4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55D8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55DC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55E0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55E4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55E8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55EC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55F0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55F4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55F8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55FC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5600   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5604   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5608   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 560C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5610   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5614   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5618   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 561C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5620   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5624   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5628   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 562C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5630   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5634   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5638   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 563C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5640   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5644   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5648   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 564C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5650   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5654   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5658   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 565C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5660   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5664   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5668   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 566C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5670   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5674   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5678   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 567C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5680   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5684   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5688   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 568C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5690   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5694   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5698   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 569C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56A0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56A4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56A8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56AC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56B0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56B4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56B8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56BC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56C0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56C4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56C8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56CC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56D0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56D4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56D8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56DC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56E0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56E4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56E8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56EC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56F0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56F4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56F8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56FC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5700   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5704   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5708   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 570C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5710   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5714   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5718   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 571C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5720   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5724   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5728   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 572C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5730   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5734   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5738   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 573C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5740   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5744   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5748   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 574C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5750   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5754   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5758   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 575C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5760   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5764   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5768   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 576C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5770   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5774   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5778   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 577C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5780   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5784   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5788   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 578C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5790   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5794   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5798   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 579C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57A0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57A4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57A8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57AC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57B0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57B4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57B8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57BC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57C0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57C4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57C8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57CC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57D0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57D4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57D8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57DC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57E0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57E4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57E8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57EC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57F0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57F4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57F8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57FC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5800   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5804   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5808   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 580C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5810   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5814   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5818   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 581C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5820   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5824   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5828   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 582C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5830   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5834   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5838   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 583C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5840   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5844   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5848   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 584C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5850   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5854   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5858   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 585C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5860   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5864   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5868   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 586C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5870   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5874   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5878   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 587C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5880   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5884   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5888   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 588C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5890   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5894   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5898   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 589C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58A0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58A4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58A8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58AC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58B0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58B4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58B8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58BC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58C0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58C4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58C8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58CC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58D0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58D4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58D8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58DC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58E0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58E4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58E8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58EC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58F0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58F4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58F8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58FC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5900   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5904   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5908   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 590C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5910   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5914   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5918   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 591C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5920   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5924   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5928   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 592C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5930   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5934   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5938   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 593C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5940   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5944   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5948   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 594C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5950   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5954   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5958   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 595C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5960   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5964   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5968   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 596C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5970   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5974   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5978   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 597C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5980   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5984   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5988   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 598C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5990   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5994   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5998   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 599C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59A0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59A4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59A8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59AC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59B0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59B4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59B8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59BC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59C0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59C4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59C8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59CC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59D0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59D4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59D8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59DC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59E0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59E4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59E8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59EC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59F0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59F4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59F8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59FC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A00   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A08   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A28   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A30   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A60   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A68   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A70   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A7C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ABC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ACC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AD4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AD8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ADC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AFC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B00   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B08   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B28   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B30   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B60   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B68   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B70   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B7C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BBC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BCC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BD4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BD8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BDC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BFC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C00   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C08   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C28   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C30   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C60   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C68   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C70   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C7C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CBC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CCC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CD4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CD8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CDC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CFC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D00   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D08   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D28   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D30   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D60   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D68   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D70   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D7C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DBC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DCC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DD4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DD8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DDC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DFC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E00   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E08   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E28   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E30   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E60   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E68   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E70   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E7C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EBC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ECC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ED0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ED4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ED8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EDC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EFC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F00   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F08   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F28   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F30   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F60   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F68   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F6C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F70   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F7C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FBC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FCC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FD4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FD8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FDC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFC   0000 0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $504F       <entry>
;;  $5064       $5060  
;;  $506A       $5066  
;;  $506E       <entry>
;;  $50D9       $50D2  
;;  $5114       $50DC   $50E2  
;;  $5115       $5102  
;;  $5134       $5129   $512E  
;;  $5139       $5136  
;;  $5150       $514D  
;;  $5155       $5147  
;;  $515F       $5159  
;;  $516C       $5166  
;;  $516E       $516A  
;;  $5173       $516E   $525B  
;;  $5189       $5171  
;;  $519C       $5193   $5197  
;;  $51A6       $51A2  
;;  $51BC       $51B8  
;;  $51F6       $51EC  
;;  $51FD       $51F4   $51F8   $520D   $5217   $5279   $527D  
;;  $5205       $51F2  
;;  $5219       $5203  
;;  $5229       $526A  
;;  $5230       $5223   $5227   $526E  
;;  $5232       $522E  
;;  $5236       $521D   $5221   $5266  
;;  $523C       <entry>
;;  $524F       $5243  
;;  $525E       $524D  
;;  $5271       $51E7  
;;  $527B       $5273  
;;  $528A       $5286  
;;  $52B3       $5297  
;;  $52B4       $5288  
;;  $52B7       $5219  
;;  $52CE       $5282   $5284  
;;  $530A       $52ED  
;;  $5322       $5304  
;;  $5324       $531A  
;;  $5326       $5308   $5320   $534F  
;;  $5330       $532C  
;;  $5341       $52F3  
;;  $5351       $52FB   $5310   $5347  
;;  $53D4       $52B4   $52D9  
;;  $53E2       $5160  
;;  $53F4       $52DE  
;;  $5402       $52B0  
;;  $5416       $540E  
;;  $5431       $5418  
;;  $544B       $5433  
;;  $5460       $544D  
;;  $5475       $5462  
;;  $548F       $5477  
;;  $54A9       $5491  
;;  $54C3       $54AB  
;;  $54DE       $54C5  
;;  $54EE       $5199  
;;  $5504       $54F5  
;;  $5507       $5502  
;;  $5566       $555E  
;;  $5570       $5568  
;;  $557A       $5572  
;;  $5584       $557C  
;;  $5588       $5564   $556E   $5578   $5582  
;;  $558F       $54FD  
;; ======================================================================== ;;
