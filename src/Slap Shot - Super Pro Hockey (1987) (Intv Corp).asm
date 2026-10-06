
        ORG     $5000
.HEADER:
        BIDECLE $64DB           ; 5000  Ptr: MOB graphic images
        BIDECLE $5154           ; 5002  Ptr: EXEC timer table
        BIDECLE $5064           ; 5004  Ptr: Start of game
        BIDECLE $56E8           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $55A2           ; 5008  Ptr: GRAM init sequence
        BIDECLE $501C           ; 500A  Ptr: Date/Title
        DECLE   $00C0           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0007,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0007,  $0008   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $0180,  $0190,  $01A0,  $01B0   ; 5014   0180 0190 01A0 01B0
        DECLE   $01C0,  $01D0,  $01E0,  $01F0   ; 5018   01C0 01D0 01E0 01F0
.TITLE:
        DECLE   $0057                           ; 501C  Cartridge year
        STRING  "Super Pro HOCKEY"              ; 501D  Title string
        DECLE   $0000                           ; 502D  

.TITLECODE:
        EIS                                     ; 502E   0002

        JSR     R5,     L_54DC                  ; 502F   0004 0154 00DC
        JSR     R5,     L_503A                  ; 5032   0004 0150 003A
        DECLE   $0007,  $0000,  $0007,  $0008   ; 5035   0007 0000 0007 0008
        DECLE   $0000                           ; 5039   0000
L_503A:
        MVII    #$0028, R4                      ; 503A   02BC 0028
        MVI@    R5,     R0                      ; 503C   02A8
        MVO@    R0,     R4                      ; 503D   0260
        MVI@    R5,     R0                      ; 503E   02A8
        MVO@    R0,     R4                      ; 503F   0260
        MVI@    R5,     R0                      ; 5040   02A8
        MVO@    R0,     R4                      ; 5041   0260
        MVI@    R5,     R0                      ; 5042   02A8
        MVO@    R0,     R4                      ; 5043   0260
        MVI@    R5,     R0                      ; 5044   02A8
        MVO     R0,     .STIC.BORD              ; 5045   0240 002C
        EIS                                     ; 5047   0002

        JSR     R5,     L_54DC                  ; 5048   0004 0154 00DC

        DIS                                     ; 504B   0003
        MVII    #$0130, R0                      ; 504C   02B8 0130
        SDBD                                    ; 504E   0001
        MVII    #$56E8, R4                      ; 504F   02BC 00E8 0056
        SDBD                                    ; 5052   0001
        MVII    #$3800, R1                      ; 5053   02B9 0000 0038

        JSR     R5,     .EXEC.730               ; 5056   0004 0114 0330

        MVII    #$0003, R0                      ; 5059   02B8 0003
        MVO     R0,     G_0103                  ; 505B   0240 0103

        JSR     R5,     L_55A9                  ; 505D   0004 0154 01A9
        JSR     R5,     L_50D9                  ; 5060   0004 0150 00D9

        PULR    R7                              ; 5063   02B7

.START:
        PSHR    R5                              ; 5064   0275
        MVII    #$0017, R0                      ; 5065   02B8 0017
        MVO     R0,     G_019D                  ; 5067   0240 019D

        JSR     R5,     L_5187                  ; 5069   0004 0150 0187

        CLRR    R0                              ; 506C   01C0
        MVO     R0,     G_01C3                  ; 506D   0240 01C3
        MVO     R0,     G_01C4                  ; 506F   0240 01C4
        MVO     R0,     G_01C5                  ; 5071   0240 01C5
        INCR    R0                              ; 5073   0008
        MVO     R0,     G_01C7                  ; 5074   0240 01C7

        JSR     R5,     L_544C                  ; 5076   0004 0154 004C
        JSR     R4,     L_53D3                  ; 5079   0004 0050 03D3

        MOVR    R3,     R1                      ; 507C   0099
        RLC     R1,     1                       ; 507D   0051
        MOVR    R2,     R1                      ; 507E   0091
        RLC     R1,     1                       ; 507F   0051
        MOVR    R3,     R1                      ; 5080   0099
        RLC     R1,     1                       ; 5081   0051
        MOVR    R3,     R1                      ; 5082   0099
        RLC     R1,     1                       ; 5083   0051
        MOVR    R3,     R1                      ; 5084   0099
        RLC     R1,     1                       ; 5085   0051
        PULR    R7                              ; 5086   02B7

L_5087:
        PSHR    R5                              ; 5087   0275
        MVI     G_01C3, R0                      ; 5088   0280 01C3
        DECR    R0                              ; 508A   0010
        MVO     R0,     G_01C3                  ; 508B   0240 01C3
        MOVR    R0,     R1                      ; 508D   0081
        ANDI    #$003F, R1                      ; 508E   03B9 003F
        BNEQ    L_50D8                          ; 5090   020C 0046

        MVII    #$0217, R4                      ; 5092   02BC 0217
        MVII    #$000E, R0                      ; 5094   02B8 000E

        JSR     R5,     X_FILL_ZERO             ; 5096   0004 0114 0338

        MVII    #$022B, R4                      ; 5099   02BC 022B
        MVII    #$000E, R0                      ; 509B   02B8 000E

        JSR     R5,     X_FILL_ZERO             ; 509D   0004 0114 0338

        MVI     G_01C5, R0                      ; 50A0   0280 01C5
        INCR    R0                              ; 50A2   0008
        MVO     R0,     G_01C5                  ; 50A3   0240 01C5
        CMPI    #$0004, R0                      ; 50A5   0378 0004
        BGE     L_50B6                          ; 50A7   020D 000D

        CMPI    #$0001, R0                      ; 50A9   0378 0001
        BEQ     L_50BE                          ; 50AB   0204 0011

        CMPI    #$0002, R0                      ; 50AD   0378 0002
        BEQ     L_50C3                          ; 50AF   0204 0012

        JSR     R5,     L_5131                  ; 50B1   0004 0150 0131

        B       L_50C6                          ; 50B4   0200 0010

L_50B6:
        CLRR    R0                              ; 50B6   01C0
        MVO     R0,     G_01C5                  ; 50B7   0240 01C5

        JSR     R5,     L_50D9                  ; 50B9   0004 0150 00D9

        B       L_50C6                          ; 50BC   0200 0008

L_50BE:
        JSR     R5,     L_50F8                  ; 50BE   0004 0150 00F8

        B       L_50C6                          ; 50C1   0200 0003

L_50C3:
        JSR     R5,     L_5111                  ; 50C3   0004 0150 0111

L_50C6:
        MVI     G_01C3, R0                      ; 50C6   0280 01C3
        TSTR    R0                              ; 50C8   0080
        BNEQ    L_50D8                          ; 50C9   020C 000D

        MVI     G_01C4, R0                      ; 50CB   0280 01C4
        INCR    R0                              ; 50CD   0008
        MVO     R0,     G_01C4                  ; 50CE   0240 01C4
        CMPI    #$0005, R0                      ; 50D0   0378 0005
        BLT     L_50D8                          ; 50D2   0205 0004

        CLRR    R0                              ; 50D4   01C0

        JSR     R5,     L_68D6                  ; 50D5   0004 0168 00D6

L_50D8:
        PULR    R7                              ; 50D8   02B7

L_50D9:
        PSHR    R5                              ; 50D9   0275
        MVII    #$0218, R4                      ; 50DA   02BC 0218
        SDBD                                    ; 50DC   0001
        MVII    #$0913, R2                      ; 50DD   02BA 0013 0009
        MVII    #$0008, R1                      ; 50E0   02B9 0008
        MVO@    R2,     R4                      ; 50E2   0262
        ADDR    R1,     R2                      ; 50E3   00CA
        MVO@    R2,     R4                      ; 50E4   0262
        ADDR    R1,     R2                      ; 50E5   00CA
        MVO@    R2,     R4                      ; 50E6   0262
        ADDR    R1,     R2                      ; 50E7   00CA
        MVO@    R2,     R4                      ; 50E8   0262
        MVII    #$0003, R3                      ; 50E9   02BB 0003

        JSR     R5,     X_PRINT_R5              ; 50EB   0004 0118 007B
        STRING  "presents"                      ; 50EE  
        DECLE   $0000                           ; 50F6   0000

        PULR    R7                              ; 50F7   02B7

L_50F8:
        PSHR    R5                              ; 50F8   0275
        MVII    #$0007, R3                      ; 50F9   02BB 0007
        MVII    #$021A, R4                      ; 50FB   02BC 021A

        JSR     R5,     X_PRINT_R5              ; 50FD   0004 0118 007B
        STRING  "SLAP"                          ; 5100   0053 004C 0041 0050
        DECLE   $0000                           ; 5104   0000

        MVII    #$0232, R4                      ; 5105   02BC 0232

        JSR     R5,     X_PRINT_R5              ; 5107   0004 0118 007B
        STRING  "SHOT!"                         ; 510A  
        DECLE   $0000                           ; 510F   0000

        PULR    R7                              ; 5110   02B7

L_5111:
        PSHR    R5                              ; 5111   0275
        MVII    #$0006, R3                      ; 5112   02BB 0006
        MVII    #$0219, R4                      ; 5114   02BC 0219

        JSR     R5,     X_PRINT_R5              ; 5116   0004 0118 007B
        STRING  "Super  Pro"                    ; 5119  
        DECLE   $0000                           ; 5123   0000

        MVII    #$022F, R4                      ; 5124   02BC 022F

        JSR     R5,     X_PRINT_R5              ; 5126   0004 0118 007B
        STRING  "Hockey"                        ; 5129  
        DECLE   $0000                           ; 512F   0000

        PULR    R7                              ; 5130   02B7

L_5131:
        PSHR    R5                              ; 5131   0275
        MVII    #$022D, R4                      ; 5132   02BC 022D
        MVII    #$0005, R3                      ; 5134   02BB 0005
        SDBD                                    ; 5136   0001
        MVII    #$090D, R0                      ; 5137   02B8 000D 0009
        MVO@    R0,     R4                      ; 513A   0260
        SDBD                                    ; 513B   0001
        MVII    #$07C3, R0                      ; 513C   02B8 00C3 0007
        MVII    #$0004, R1                      ; 513F   02B9 0004

        JSR     R5,     X_PRNUM_RGT             ; 5141   0004 0118 00C5

        MVII    #$0233, R4                      ; 5144   02BC 0233
        SDBD                                    ; 5146   0001
        MVII    #$0915, R0                      ; 5147   02B8 0015 0009
        MVII    #$0008, R1                      ; 514A   02B9 0008
        MVO@    R0,     R4                      ; 514C   0260
        ADDR    R1,     R0                      ; 514D   00C8
        MVO@    R0,     R4                      ; 514E   0260
        ADDR    R1,     R0                      ; 514F   00C8
        MVO@    R0,     R4                      ; 5150   0260
        ADDR    R1,     R0                      ; 5151   00C8
        MVO@    R0,     R4                      ; 5152   0260
        PULR    R7                              ; 5153   02B7

.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 5154  Timer dispatch/interval
        DECLE   $0013,  $0063,  $000A,  $0000; 5158  Timer dispatch/interval
        DECLE   $0066,  $0051,  $0001,  $0000; 515C  Timer dispatch/interval
        DECLE   $00CC,  $0063,  $0004,  $0000; 5160  Timer dispatch/interval
        BIDECLE $0000           ; 5164  End of timer table

L_5166:
        PSHR    R5                              ; 5166   0275
        MVI     G_01C7, R0                      ; 5167   0280 01C7
        DECR    R0                              ; 5169   0010
        BNEQ    L_516F                          ; 516A   020C 0003

        JSR     R5,     L_5087                  ; 516C   0004 0150 0087
L_516F:
        JSR     R5,     L_5E57                  ; 516F   0004 015C 0257
        JSR     R5,     L_5A14                  ; 5172   0004 0158 0214
        JSR     R5,     L_597C                  ; 5175   0004 0158 017C
        JSR     R5,     L_589B                  ; 5178   0004 0158 009B

        J       L_5FB1                          ; 517B   0004 035C 03B1

L_517E:
        CLRR    R0                              ; 517E   01C0
        MVO     R0,     G_01C8                  ; 517F   0240 01C8
        MOVR    R7,     R1                      ; 5181   00B9
        SUBI    #$002A, R1                      ; 5182   0339 002A
        J       X_TIMER_START                   ; 5184   0004 0318 0044

L_5187:
        MVII    #$0001, R0                      ; 5187   02B8 0001
        MVO     R0,     G_01C8                  ; 5189   0240 01C8
        MOVR    R7,     R1                      ; 518B   00B9
        SUBI    #$0034, R1                      ; 518C   0339 0034
        J       X_TIMER_STOP                    ; 518E   0004 0318 0038

        CMPI    #$0003, R0                      ; 5191   0378 0003
        BGT     L_5199                          ; 5193   020E 0004

        ADD     G_0103, R0                      ; 5195   02C0 0103
        MVO     R0,     G_0103                  ; 5197   0240 0103
L_5199:
        PSHR    R5                              ; 5199   0275

        JSR     R5,     L_5187                  ; 519A   0004 0150 0187

        MVII    #$0017, R0                      ; 519D   02B8 0017
        MVO     R0,     G_019D                  ; 519F   0240 019D
        CLRR    R0                              ; 51A1   01C0
        MVO     R0,     G_01C7                  ; 51A2   0240 01C7
        MVO     R0,     G_01C3                  ; 51A4   0240 01C3
        MVO     R0,     G_01C4                  ; 51A6   0240 01C4

        JSR     R5,     L_54DC                  ; 51A8   0004 0154 00DC

        MVII    #$0028, R4                      ; 51AB   02BC 0028
        CLRR    R0                              ; 51AD   01C0
        MVO@    R0,     R4                      ; 51AE   0260
        MVO@    R0,     R4                      ; 51AF   0260
        MVO@    R0,     R4                      ; 51B0   0260
        MVO@    R0,     R4                      ; 51B1   0260
        MVO     R0,     .STIC.BORD              ; 51B2   0240 002C

        JSR     R5,     .EXEC.7B3               ; 51B4   0004 0114 03B3

        MVII    #$00F0, R0                      ; 51B7   02B8 00F0
        MVII    #$0200, R4                      ; 51B9   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 51BB   0004 0114 0338

        SDBD                                    ; 51BE   0001
        MVII    #$0003, R3                      ; 51BF   02BB 0003 0000
        MVII    #$0219, R4                      ; 51C2   02BC 0219

        JSR     R5,     X_PRINT_R5              ; 51C4   0004 0118 007B
        STRING  "HOME TEAM"                     ; 51C7  
        DECLE   $0000                           ; 51D0   0000

        JSR     R5,     L_51E1                  ; 51D1   0004 0150 01E1
        JSR     R4,     L_53D3                  ; 51D4   0004 0050 03D3
        DECLE   $0000,  $0000,  $002A,  $0052   ; 51D7   0000 0000 002A 0052
        DECLE   $0000,  $0000,  $0000,  $0000   ; 51DB   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 51DF   0000 0000
L_51E1:
        PSHR    R5                              ; 51E1   0275
        MVII    #$0006, R3                      ; 51E2   02BB 0006
        MVII    #$023E, R4                      ; 51E4   02BC 023E

        JSR     R5,     X_PRINT_R5              ; 51E6   0004 0118 007B
        STRING  "Computer player?"              ; 51E9  
        DECLE   $0000                           ; 51F9   0000

        MVII    #$026B, R4                      ; 51FA   02BC 026B

        JSR     R5,     X_PRINT_R5              ; 51FC   0004 0118 007B
        STRING  "1 = no"                        ; 51FF  
        DECLE   $0000                           ; 5205   0000

        MVII    #$027F, R4                      ; 5206   02BC 027F

        JSR     R5,     X_PRINT_R5              ; 5208   0004 0118 007B
        STRING  "2 = yes"                       ; 520B  
        DECLE   $0000                           ; 5212   0000

        MVII    #$02DE, R4                      ; 5213   02BC 02DE

        JSR     R5,     X_PRINT_R5              ; 5215   0004 0118 007B
        STRING  "Then press enter"              ; 5218  
        DECLE   $0000                           ; 5228   0000

        PULR    R7                              ; 5229   02B7

        PSHR    R5                              ; 522A   0275
        MVII    #$01BE, R3                      ; 522B   02BB 01BE
        MVI     G_01C3, R5                      ; 522D   0285 01C3
        TSTR    R5                              ; 522F   00AD
        BEQ     L_5234                          ; 5230   0204 0002

        MVII    #$01C0, R3                      ; 5232   02BB 01C0
L_5234:
        MVI     G_01C2, R2                      ; 5234   0282 01C2
        ADDR    R2,     R3                      ; 5236   00D3
        TSTR    R0                              ; 5237   0080
        BEQ     L_54DB                          ; 5238   0204 02A1

        CMPI    #$000A, R0                      ; 523A   0378 000A
        BNEQ    L_5248                          ; 523C   020C 000A

        CLRR    R1                              ; 523E   01C9
        MVO@    R1,     R3                      ; 523F   0259
        MVII    #$0014, R0                      ; 5240   02B8 0014
        MVII    #$02B4, R4                      ; 5242   02BC 02B4

        JSR     R5,     X_FILL_ZERO             ; 5244   0004 0114 0338

        PULR    R7                              ; 5247   02B7

L_5248:
        CMPI    #$000B, R0                      ; 5248   0378 000B
        BEQ     L_52AD                          ; 524A   0204 0061

        MVII    #$0002, R1                      ; 524C   02B9 0002
        TSTR    R5                              ; 524E   00AD
        BEQ     L_5252                          ; 524F   0204 0001

        SLL     R1,     1                       ; 5251   0049
L_5252:
        CMPR    R1,     R0                      ; 5252   0148
        BGT     L_54DB                          ; 5253   020E 0286

        MVO@    R0,     R3                      ; 5255   0258
        MOVR    R5,     R4                      ; 5256   00AC
        PSHR    R0                              ; 5257   0270
        PSHR    R5                              ; 5258   0275
        MVII    #$0014, R0                      ; 5259   02B8 0014
        MVII    #$02B4, R4                      ; 525B   02BC 02B4

        JSR     R5,     X_FILL_ZERO             ; 525D   0004 0114 0338

        PULR    R5                              ; 5260   02B5
        PULR    R0                              ; 5261   02B0

        JSR     R4,     L_5271                  ; 5262   0004 0050 0271

        MOVR    R1,     R0                      ; 5265   0088
        RLC     R2,     1                       ; 5266   0052
        MOVR    R0,     R3                      ; 5267   0083
        RLC     R2,     1                       ; 5268   0052
        MOVR    R1,     R4                      ; 5269   008C
        RLC     R2,     1                       ; 526A   0052
        MOVR    R2,     R5                      ; 526B   0095
        RLC     R2,     1                       ; 526C   0052
        MOVR    R3,     R5                      ; 526D   009D
        RLC     R2,     1                       ; 526E   0052
        MOVR    R4,     R2                      ; 526F   00A2
        RLC     R2,     1                       ; 5270   0052
L_5271:
        DECR    R0                              ; 5271   0010
        TSTR    R5                              ; 5272   00AD
        BEQ     L_5277                          ; 5273   0204 0002

        ADDI    #$0002, R0                      ; 5275   02F8 0002
L_5277:
        SLL     R0,     1                       ; 5277   0048
        ADDR    R0,     R4                      ; 5278   00C4
        SDBD                                    ; 5279   0001
        MVI@    R4,     R1                      ; 527A   02A1
        MVI@    R1,     R4                      ; 527B   028C
        INCR    R1                              ; 527C   0009
        MVII    #$0007, R3                      ; 527D   02BB 0007

        JSR     R5,     X_PRINT_R1              ; 527F   0004 0118 0067

        PULR    R7                              ; 5282   02B7

        DECLE   $02BC,  $0059,  $0045,  $0053   ; 5283   02BC 0059 0045 0053
        DECLE   $0000,  $02BC,  $004E,  $004F   ; 5287   0000 02BC 004E 004F
        DECLE   $0000,  $02BA,  $0041,  $004D   ; 528B   0000 02BA 0041 004D
        DECLE   $0041,  $0054,  $0045,  $0055   ; 528F   0041 0054 0045 0055
        DECLE   $0052,  $0000,  $02BB,  $0052   ; 5293   0052 0000 02BB 0052
        DECLE   $004F,  $004F,  $004B,  $0049   ; 5297   004F 004F 004B 0049
        DECLE   $0045,  $0000,  $02BC,  $0050   ; 529B   0045 0000 02BC 0050
        DECLE   $0052,  $004F,  $0000,  $02B9   ; 529F   0052 004F 0000 02B9
        DECLE   $0053,  $0055,  $0050,  $0045   ; 52A3   0053 0055 0050 0045
        DECLE   $0052,  $0020,  $0050,  $0052   ; 52A7   0052 0020 0050 0052
        DECLE   $004F,  $0000                   ; 52AB   004F 0000
L_52AD:
        MVI@    R3,     R1                      ; 52AD   0299
        DECR    R1                              ; 52AE   0011
        BMI     L_54DB                          ; 52AF   020B 022A

        MVO@    R1,     R3                      ; 52B1   0259
        TSTR    R5                              ; 52B2   00AD
        BNEQ    L_52FD                          ; 52B3   020C 0048

        XORI    #$0001, R5                      ; 52B5   03FD 0001
        MVO     R5,     G_01C3                  ; 52B7   0245 01C3
        MVII    #$00A0, R0                      ; 52B9   02B8 00A0
        MVII    #$0228, R4                      ; 52BB   02BC 0228

        JSR     R5,     X_FILL_ZERO             ; 52BD   0004 0114 0338

        MVII    #$0006, R3                      ; 52C0   02BB 0006
        MVII    #$023F, R4                      ; 52C2   02BC 023F

        JSR     R5,     X_PRINT_R5              ; 52C4   0004 0118 007B
        STRING  "Select player"                 ; 52C7  
        DECLE   $0000                           ; 52D4   0000

        MVII    #$0267, R4                      ; 52D5   02BC 0267

        JSR     R5,     X_PRINT_R5              ; 52D7   0004 0118 007B
        STRING  "handicap level"                ; 52DA  
        DECLE   $0000                           ; 52E8   0000

        MVII    #$0293, R4                      ; 52E9   02BC 0293

        JSR     R5,     X_PRINT_R5              ; 52EB   0004 0118 007B
        STRING  "(1-4)"                         ; 52EE  
        DECLE   $0000                           ; 52F3   0000

        PULR    R7                              ; 52F4   02B7

        MOVR    R2,     R5                      ; 52F5   0095
        ADDI    #$01C0, R5                      ; 52F6   02FD 01C0
        MVII    #$0002, R4                      ; 52F8   02BC 0002
        MVO@    R4,     R5                      ; 52FA   026C
        B       L_5301                          ; 52FB   0200 0004

L_52FD:
        XORI    #$0001, R5                      ; 52FD   03FD 0001
        MVO     R5,     G_01C3                  ; 52FF   0245 01C3
L_5301:
        XORI    #$0001, R2                      ; 5301   03FA 0001
        MVO     R2,     G_01C2                  ; 5303   0242 01C2
        BEQ     L_5328                          ; 5305   0204 0021

        MVII    #$00A0, R0                      ; 5307   02B8 00A0
        MVII    #$0228, R4                      ; 5309   02BC 0228

        JSR     R5,     X_FILL_ZERO             ; 530B   0004 0114 0338

        SDBD                                    ; 530E   0001
        MVII    #$0005, R3                      ; 530F   02BB 0005 0000
        MVII    #$0218, R4                      ; 5312   02BC 0218

        JSR     R5,     X_PRINT_R5              ; 5314   0004 0118 007B
        STRING  "VISITOR TEAM"                  ; 5317  
        DECLE   $0000                           ; 5323   0000

        JSR     R5,     L_51E1                  ; 5324   0004 0150 01E1

        PULR    R7                              ; 5327   02B7

L_5328:
        JSR     R5,     L_54DC                  ; 5328   0004 0154 00DC
        JSR     R5,     L_5333                  ; 532B   0004 0150 0333
        DECLE   $0007,  $0000,  $0007,  $0008   ; 532E   0007 0000 0007 0008
        DECLE   $0000                           ; 5332   0000
L_5333:
        MVII    #$0028, R4                      ; 5333   02BC 0028
        MVI@    R5,     R0                      ; 5335   02A8
        MVO@    R0,     R4                      ; 5336   0260
        MVI@    R5,     R0                      ; 5337   02A8
        MVO@    R0,     R4                      ; 5338   0260
        MVI@    R5,     R0                      ; 5339   02A8
        MVO@    R0,     R4                      ; 533A   0260
        MVI@    R5,     R0                      ; 533B   02A8
        MVO@    R0,     R4                      ; 533C   0260
        MVI@    R5,     R0                      ; 533D   02A8
        MVO     R0,     .STIC.BORD              ; 533E   0240 002C
        CLRR    R0                              ; 5340   01C0
        MVII    #$01BE, R4                      ; 5341   02BC 01BE
        MVI@    R4,     R1                      ; 5343   02A1
        TSTR    R1                              ; 5344   0089
        BNEQ    L_5348                          ; 5345   020C 0001

        INCR    R0                              ; 5347   0008
L_5348:
        MVI@    R4,     R1                      ; 5348   02A1
        TSTR    R1                              ; 5349   0089
        BNEQ    L_534D                          ; 534A   020C 0001

        INCR    R0                              ; 534C   0008
L_534D:
        MVO     R0,     G_01BD                  ; 534D   0240 01BD

        JSR     R5,     L_55A9                  ; 534F   0004 0154 01A9
        JSR     R5,     L_55F8                  ; 5352   0004 0154 01F8
        JSR     R5,     L_6341                  ; 5355   0004 0160 0341
        JSR     R5,     L_5370                  ; 5358   0004 0150 0370
        JSR     R5,     L_5187                  ; 535B   0004 0150 0187

        MVII    #$0116, R1                      ; 535E   02B9 0116
        MVII    #$0004, R0                      ; 5360   02B8 0004
        PULR    R5                              ; 5362   02B5

        JSR     R4,     .EXEC.730               ; 5363   0004 0014 0330

        MOVR    R4,     R7                      ; 5366   00A7

        DECLE   $0000                           ; 5367   0000

        SLLC    R1,     1                       ; 5368   0059
        ADCR    R2                              ; 5369   002A
        PSHR    R5                              ; 536A   0275

        JSR     R5,     .EXEC.A61               ; 536B   0004 0118 0261

        INCR    R7                              ; 536E   000F
        INCR    R7                              ; 536F   000F

L_5370:
        PSHR    R5                              ; 5370   0275
L_5371:
        MVII    #$000A, R0                      ; 5371   02B8 000A

        JSR     R5,     X_PLAY_CHEER1           ; 5373   0004 011C 02D5

        MVI     G_01A4, R4                      ; 5376   0284 01A4
        INCR    R4                              ; 5378   000C
        CMPI    #$0004, R4                      ; 5379   037C 0004
        BGE     L_5391                          ; 537B   020D 0014

        MVO     R4,     G_01A4                  ; 537D   0244 01A4
        ADDI    #$021C, R4                      ; 537F   02FC 021C
        SDBD                                    ; 5381   0001
        MVII    #$0622, R0                      ; 5382   02B8 0022 0006
        MVO@    R0,     R4                      ; 5385   0260
        MVII    #$0014, R0                      ; 5386   02B8 0014
        MVO     R0,     G_01A8                  ; 5388   0240 01A8

        JSR     R5,     L_632B                  ; 538A   0004 0160 032B
        JSR     R5,     L_544C                  ; 538D   0004 0154 004C

        PULR    R7                              ; 5390   02B7

L_5391:
        MVII    #$0002, R0                      ; 5391   02B8 0002
        MVO     R0,     G_01C7                  ; 5393   0240 01C7
        MVO     R0,     G_01BD                  ; 5395   0240 01BD
        MVII    #$0017, R0                      ; 5397   02B8 0017
        MVO     R0,     G_019D                  ; 5399   0240 019D

        JSR     R4,     L_53D3                  ; 539B   0004 0050 03D3
        DECLE   $0000,  $0010,  $0000,  $0010   ; 539E   0000 0010 0000 0010
        DECLE   $0000,  $0010,  $0000,  $0010   ; 53A2   0000 0010 0000 0010
        DECLE   $0000                           ; 53A6   0000

        DECR    R0                              ; 53A7   0010
        PULR    R7                              ; 53A8   02B7

        PSHR    R5                              ; 53A9   0275
        MVI     G_01C7, R0                      ; 53AA   0280 01C7
        TSTR    R0                              ; 53AC   0080
        BNEQ    L_54DB                          ; 53AD   020C 012C

        CLRR    R3                              ; 53AF   01DB
        MVO     R3,     G_034E                  ; 53B0   0243 034E
        MVO     R3,     G_0356                  ; 53B2   0243 0356

        JSR     R5,     L_5D1E                  ; 53B4   0004 015C 011E

        INCR    R3                              ; 53B7   000B

        JSR     R5,     L_5D1E                  ; 53B8   0004 015C 011E

        MVI     G_01BD, R0                      ; 53BB   0280 01BD
        TSTR    R0                              ; 53BD   0080
        BEQ     L_53F3                          ; 53BE   0204 0033

        JSR     R4,     L_53D3                  ; 53C0   0004 0050 03D3
        DECLE   $00F2,  $0053,  $00F2,  $0053   ; 53C3   00F2 0053 00F2 0053
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53C7   0000 0000 0000 0000

        ADDR    R1,     R0                      ; 53CB   00C8
        SLLC    R2,     1                       ; 53CC   005A
        MOVR    R0,     R4                      ; 53CD   0084
        SLLC    R2,     1                       ; 53CE   005A
        MOVR    R0,     R7                      ; 53CF   0087

        SLLC    R2,     1                       ; 53D0   005A
        MOVR    R0,     R7                      ; 53D1   0087

        SLLC    R2,     1                       ; 53D2   005A
L_53D3:
        MVO     R4,     G_035D                  ; 53D3   0244 035D
        PULR    R7                              ; 53D5   02B7

        DECLE   $0040,  $0018,  $00EB,  $0064   ; 53D6   0040 0018 00EB 0064
        DECLE   $0000,  $0028,  $0000,  $002A   ; 53DA   0000 0028 0000 002A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53DE   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0088,  $0058   ; 53E2   0001 0000 0088 0058
        DECLE   $0010,  $0065,  $0000,  $0054   ; 53E6   0010 0065 0000 0054
        DECLE   $0000,  $0043,  $0000,  $0000   ; 53EA   0000 0043 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; 53EE   0000 0000 0001 0000

        PSHR    R5                              ; 53F2   0275
L_53F3:
        SDBD                                    ; 53F3   0001
        MVII    #$1906, R0                      ; 53F4   02B8 0006 0019
        MVO     R0,     G_035D                  ; 53F7   0240 035D
        MVII    #$001E, R0                      ; 53F9   02B8 001E

        JSR     R5,     X_RAND2                 ; 53FB   0004 0114 029E

        ADDI    #$000A, R0                      ; 53FE   02F8 000A

        JSR     R5,     .EXEC.A62               ; 5400   0004 0118 0262
        JSR     R5,     L_54AD                  ; 5403   0004 0154 00AD

        CLRR    R3                              ; 5406   01DB

        JSR     R5,     L_5D34                  ; 5407   0004 015C 0134

        MVII    #$0355, R2                      ; 540A   02BA 0355
        MOVR    R7,     R1                      ; 540C   00B9
        SUBI    #$0029, R1                      ; 540D   0339 0029

        JSR     R5,     X_INIT_MOB              ; 540F   0004 0114 02B2

        MVII    #$0007, R0                      ; 5412   02B8 0007
        MVO     R0,     G_01A3                  ; 5414   0240 01A3

        JSR     R5,     .EXEC.41C               ; 5416   0004 0114 001C

        MVII    #$015D, R4                      ; 5419   02BC 015D
        MVII    #$0046, R0                      ; 541B   02B8 0046

        JSR     R5,     X_FILL_ZERO             ; 541D   0004 0114 0338
        JSR     R5,     L_517E                  ; 5420   0004 0150 017E

        MOVR    R7,     R4                      ; 5423   00BC
        SUBI    #$005B, R4                      ; 5424   033C 005B
        B       L_53D3                          ; 5426   0220 0054

        MOVR    R5,     R1                      ; 5428   00A9
        RLC     R3,     1                       ; 5429   0053
        CMPR    R0,     R3                      ; 542A   0143
        SLL     R2,     2                       ; 542B   004E
        SWAP    R3,     1                       ; 542C   0043
        SLLC    R3,     1                       ; 542D   005B
        SUBR    R7,     R1                      ; 542E   0139
        SWAP    R0,     1                       ; 542F   0040
        RSWD    R1                              ; 5430   0039
        SAR     R0,     1                       ; 5431   0068
        RLC     R1,     1                       ; 5432   0051
        SAR     R0,     2                       ; 5433   006C
        CMPR    R2,     R1                      ; 5434   0151
        RSWD    R4                              ; 5435   003C
        CMPR    R0,     R1                      ; 5436   0141
        ADCR    R1                              ; 5437   0029
        SWAP    R1,     1                       ; 5438   0041
        SARC    R1,     2                       ; 5439   007D
        CMPR    R5,     R2                      ; 543A   016A
        RLC     R3,     1                       ; 543B   0053
        ADCR    R2                              ; 543C   002A
        ADCR    R0                              ; 543D   0028
        ADCR    R2                              ; 543E   002A
        TSTR    R0                              ; 543F   0080
        ADCR    R2                              ; 5440   002A
        ADCR    R0                              ; 5441   0028
        ADCR    R2                              ; 5442   002A
        TSTR    R0                              ; 5443   0080
        ADCR    R2                              ; 5444   002A
        ADCR    R0                              ; 5445   0028
        ADCR    R2                              ; 5446   002A
        TSTR    R0                              ; 5447   0080
        ADCR    R2                              ; 5448   002A
        ADCR    R0                              ; 5449   0028
        ADCR    R2                              ; 544A   002A
        TSTR    R0                              ; 544B   0080
L_544C:
        PSHR    R5                              ; 544C   0275
        MVII    #$031D, R2                      ; 544D   02BA 031D
        MOVR    R7,     R1                      ; 544F   00B9
        SUBI    #$007A, R1                      ; 5450   0339 007A
        MVII    #$0004, R4                      ; 5452   02BC 0004
        MVII    #$0080, R3                      ; 5454   02BB 0080
        SWAP    R3,     1                       ; 5456   0043

L_5457:
        JSR     R5,     X_INIT_MOB              ; 5457   0004 0114 02B2

        MVI@    R2,     R0                      ; 545A   0290
        SLL     R0,     1                       ; 545B   0048
        SETC                                    ; 545C   0007
        RRC     R0,     1                       ; 545D   0070
        MVO@    R0,     R2                      ; 545E   0250
        ADDI    #$0008, R2                      ; 545F   02FA 0008

        JSR     R5,     X_INIT_MOB              ; 5461   0004 0114 02B2

        ADDI    #$0002, R2                      ; 5464   02FA 0002
        MVO@    R3,     R2                      ; 5466   0253
        ADDI    #$0006, R2                      ; 5467   02FA 0006
        DECR    R4                              ; 5469   0014
        BNEQ    L_5457                          ; 546A   022C 0014
        INCR    R7                              ; 546C   000F

L_546D:
        PSHR    R5                              ; 546D   0275
L_546E:
        MOVR    R7,     R4                      ; 546E   00BC
        SUBI    #$0047, R4                      ; 546F   033C 0047

        JSR     R5,     L_647E                  ; 5471   0004 0164 007E
        JSR     R5,     L_547B                  ; 5474   0004 0154 007B
        JSR     R5,     L_5187                  ; 5477   0004 0150 0187

        PULR    R7                              ; 547A   02B7

L_547B:
        PSHR    R5                              ; 547B   0275
        MVII    #$0174, R3                      ; 547C   02BB 0174
        MVI     G_01AF, R0                      ; 547E   0280 01AF
        MVII    #$01B7, R4                      ; 5480   02BC 01B7

        JSR     R5,     L_5486                  ; 5482   0004 0154 0086

        PULR    R5                              ; 5485   02B5
L_5486:
        MVI@    R4,     R2                      ; 5486   02A2
        TSTR    R2                              ; 5487   0092
        BEQ     L_548F                          ; 5488   0204 0005

        CLRR    R2                              ; 548A   01D2
        MVO@    R2,     R3                      ; 548B   025A
        DECR    R0                              ; 548C   0010
        MVO     R0,     G_01AF                  ; 548D   0240 01AF
L_548F:
        ADDI    #$0008, R3                      ; 548F   02FB 0008
        MOVR    R5,     R7                      ; 5491   00AF

L_5492:
        PSHR    R5                              ; 5492   0275
        CLRR    R0                              ; 5493   01C0
        MVO     R0,     G_01B7                  ; 5494   0240 01B7
        MVO     R0,     G_01B8                  ; 5496   0240 01B8

        JSR     R5,     L_636A                  ; 5498   0004 0160 036A
        JSR     R5,     L_5D57                  ; 549B   0004 015C 0157

        SDBD                                    ; 549E   0001
        MVII    #$64EB, R5                      ; 549F   02BD 00EB 0064
        MVO     R5,     G_034E                  ; 54A2   0245 034E
        MVO     R5,     G_0356                  ; 54A4   0245 0356
        MOVR    R7,     R4                      ; 54A6   00BC
        SUBI    #$006D, R4                      ; 54A7   033C 006D

        JSR     R5,     L_647E                  ; 54A9   0004 0164 007E

        PULR    R7                              ; 54AC   02B7

L_54AD:
        MVII    #$0008, R3                      ; 54AD   02BB 0008
L_54AF:
        PSHR    R5                              ; 54AF   0275

        JSR     R5,     L_54C2                  ; 54B0   0004 0154 00C2

        MVI     G_031D, R0                      ; 54B3   0280 031D
        XORI    #$0001, R0                      ; 54B5   03F8 0001
        MVO     R0,     G_031D                  ; 54B7   0240 031D
        MVI     G_0325, R0                      ; 54B9   0280 0325
        XORI    #$0014, R0                      ; 54BB   03F8 0014
        MVO     R0,     G_0325                  ; 54BD   0240 0325
        PULR    R7                              ; 54BF   02B7

L_54C0:
        MVII    #$0008, R3                      ; 54C0   02BB 0008
L_54C2:
        MVII    #$031D, R1                      ; 54C2   02B9 031D
        MVII    #$0003, R2                      ; 54C4   02BA 0003
L_54C6:
        MVI@    R1,     R0                      ; 54C6   0288
        ANDI    #$0017, R0                      ; 54C7   03B8 0017
        XOR@    R1,     R0                      ; 54C9   03C8
        XORR    R2,     R0                      ; 54CA   01D0
        MVO@    R0,     R1                      ; 54CB   0248
        XORI    #$0002, R2                      ; 54CC   03FA 0002
        ADDI    #$0008, R1                      ; 54CE   02F9 0008
        DECR    R3                              ; 54D0   0013
        BNEQ    L_54C6                          ; 54D1   022C 000C
        MOVR    R5,     R7                      ; 54D3   00AF

        SUBI    #$0008, R6                      ; 54D4   033E 0008
        MVO     R1,     .ISRVEC.0               ; 54D6   0241 0100
        MVO     R2,     .ISRVEC.1               ; 54D8   0242 0101
        PULR    R2                              ; 54DA   02B2
L_54DB:
        PULR    R7                              ; 54DB   02B7

L_54DC:
        PSHR    R5                              ; 54DC   0275
        PSHR    R2                              ; 54DD   0272
        MVI     .ISRVEC.0,R1                    ; 54DE   0281 0100
        MVI     .ISRVEC.1,R2                    ; 54E0   0282 0101
        SDBD                                    ; 54E2   0001
        MVII    #$54D4, R0                      ; 54E3   02B8 00D4 0054
        MVO     R0,     .ISRVEC.0               ; 54E6   0240 0100
        SWAP    R0,     1                       ; 54E8   0040
        MVO     R0,     .ISRVEC.1               ; 54E9   0240 0101
L_54EB:
        DECR    R7                              ; 54EB   0017

L_54EC:
        MVI@    R5,     R0                      ; 54EC   02A8
        MVI@    R5,     R1                      ; 54ED   02A9
        MVO     R0,     .ISRVEC.0               ; 54EE   0240 0100
        MVO     R1,     .ISRVEC.1               ; 54F0   0241 0101
        MOVR    R5,     R7                      ; 54F2   00AF

        SDBD                                    ; 54F3   0001
        MVI@    R5,     R2                      ; 54F4   02AA
        MVI@    R5,     R4                      ; 54F5   02AC
L_54F6:
        PSHR    R5                              ; 54F6   0275
        MOVR    R2,     R5                      ; 54F7   0095
        MOVR    R0,     R2                      ; 54F8   0082
        ANDI    #$000F, R2                      ; 54F9   03BA 000F
        SLL     R2,     1                       ; 54FB   004A
        SLR     R0,     2                       ; 54FC   0064
        SLR     R0,     2                       ; 54FD   0064
        SUBI    #$0022, R2                      ; 54FE   033A 0022
        SUBR    R2,     R7                      ; 5500   0117

        PSHR    R5                              ; 5501   0275
        MOVR    R2,     R5                      ; 5502   0095
L_5503:
        MVI@    R5,     R1                      ; 5503   02A9
        MVO@    R1,     R4                      ; 5504   0261
        MVI@    R5,     R1                      ; 5505   02A9
        MVO@    R1,     R4                      ; 5506   0261
        MVI@    R5,     R1                      ; 5507   02A9
        MVO@    R1,     R4                      ; 5508   0261
        MVI@    R5,     R1                      ; 5509   02A9
        MVO@    R1,     R4                      ; 550A   0261
        MVI@    R5,     R1                      ; 550B   02A9
        MVO@    R1,     R4                      ; 550C   0261
        MVI@    R5,     R1                      ; 550D   02A9
        MVO@    R1,     R4                      ; 550E   0261
        MVI@    R5,     R1                      ; 550F   02A9
        MVO@    R1,     R4                      ; 5510   0261
        MVI@    R5,     R1                      ; 5511   02A9
        MVO@    R1,     R4                      ; 5512   0261
        MVI@    R5,     R1                      ; 5513   02A9
        MVO@    R1,     R4                      ; 5514   0261
        MVI@    R5,     R1                      ; 5515   02A9
        MVO@    R1,     R4                      ; 5516   0261
        MVI@    R5,     R1                      ; 5517   02A9
        MVO@    R1,     R4                      ; 5518   0261
        MVI@    R5,     R1                      ; 5519   02A9
        MVO@    R1,     R4                      ; 551A   0261
        MVI@    R5,     R1                      ; 551B   02A9
        MVO@    R1,     R4                      ; 551C   0261
        MVI@    R5,     R1                      ; 551D   02A9
        MVO@    R1,     R4                      ; 551E   0261
        MVI@    R5,     R1                      ; 551F   02A9
        MVO@    R1,     R4                      ; 5520   0261
        MVI@    R5,     R1                      ; 5521   02A9
        MVO@    R1,     R4                      ; 5522   0261
        DECR    R0                              ; 5523   0010
        BPL     L_5503                          ; 5524   0223 0022
        PULR    R7                              ; 5526   02B7

        PSHR    R5                              ; 5527   0275
        PSHR    R5                              ; 5528   0275
        SDBD                                    ; 5529   0001
        MVII    #$D180, R5                      ; 552A   02BD 0080 00D1
        MVO@    R0,     R5                      ; 552D   0268
        MVO@    R1,     R5                      ; 552E   0269
        MVO@    R2,     R5                      ; 552F   026A
        MVO@    R3,     R5                      ; 5530   026B
        MVO@    R4,     R5                      ; 5531   026C
        PULR    R4                              ; 5532   02B4
        MVO@    R4,     R5                      ; 5533   026C
        MVO@    R6,     R5                      ; 5534   026E
        MVII    #$00EF, R0                      ; 5535   02B8 00EF
        SDBD                                    ; 5537   0001
        MVII    #$D000, R4                      ; 5538   02BC 0000 00D0
        MVII    #$0100, R2                      ; 553B   02BA 0100

        JSR     R5,     L_54F6                  ; 553D   0004 0154 00F6

        SDBD                                    ; 5540   0001
        MVII    #$D100, R4                      ; 5541   02BC 0000 00D1
        MVII    #$0046, R0                      ; 5544   02B8 0046
        MVII    #$0319, R2                      ; 5546   02BA 0319

        JSR     R5,     L_54F6                  ; 5548   0004 0154 00F6

        MVII    #$0029, R0                      ; 554B   02B8 0029
        SDBD                                    ; 554D   0001
        MVII    #$D200, R4                      ; 554E   02BC 0000 00D2
        MVII    #$02F0, R2                      ; 5551   02BA 02F0

        JSR     R5,     L_54F6                  ; 5553   0004 0154 00F6
        JSR     R5,     L_54EC                  ; 5556   0004 0154 00EC
        DECLE   $0003,  $0010                   ; 5559   0003 0010

        JSR     R5,     .EXEC.4C3               ; 555B   0004 0114 00C3

        MVII    #$00EF, R0                      ; 555E   02B8 00EF
        SDBD                                    ; 5560   0001
        MVII    #$D000, R2                      ; 5561   02BA 0000 00D0
        MVII    #$0100, R4                      ; 5564   02BC 0100

        JSR     R5,     L_54F6                  ; 5566   0004 0154 00F6

        MVII    #$0046, R0                      ; 5569   02B8 0046
        SDBD                                    ; 556B   0001
        MVII    #$D100, R2                      ; 556C   02BA 0000 00D1
        MVII    #$0319, R4                      ; 556F   02BC 0319

        JSR     R5,     L_54F6                  ; 5571   0004 0154 00F6

        SDBD                                    ; 5574   0001
        MVII    #$D180, R5                      ; 5575   02BD 0080 00D1
        MVI@    R5,     R0                      ; 5578   02A8
        MVI@    R5,     R1                      ; 5579   02A9
        MVI@    R5,     R2                      ; 557A   02AA
        MVI@    R5,     R3                      ; 557B   02AB
        MVI@    R5,     R4                      ; 557C   02AC
        MVI@    R5,     R5                      ; 557D   02AD
        PULR    R7                              ; 557E   02B7

        DECLE   $0275,  $0004,  $0350,  $007A   ; 557F   0275 0004 0350 007A

        PSHR    R5                              ; 5583   0275
        PSHR    R1                              ; 5584   0271
        PSHR    R0                              ; 5585   0270
        MVII    #$0002, R1                      ; 5586   02B9 0002
L_5588:
        SDBD                                    ; 5588   0001
        MVII    #$7FFF, R0                      ; 5589   02B8 00FF 007F
L_558C:
        DECR    R0                              ; 558C   0010
        BPL     L_558C                          ; 558D   0223 0002

        DECR    R1                              ; 558F   0011
        BPL     L_5588                          ; 5590   0223 0009

        PULR    R0                              ; 5592   02B0
        PULR    R1                              ; 5593   02B1
        PULR    R7                              ; 5594   02B7

        PSHR    R5                              ; 5595   0275
        PSHR    R1                              ; 5596   0271
        PSHR    R3                              ; 5597   0273
        MVII    #$0004, R1                      ; 5598   02B9 0004
        MVII    #$0001, R3                      ; 559A   02BB 0001

        JSR     R5,     X_PRNUM_RGT             ; 559C   0004 0118 00C5

        PULR    R3                              ; 559F   02B3
        PULR    R1                              ; 55A0   02B1
        PULR    R7                              ; 55A1   02B7

.GRAM_INIT_55A2:
        DECLE   $0001           ; 55A2  # of GRAM cards to init
        DECLE   $0001,  $0010   ; 55A3  #00-00:  GROM #00-00 ----


        MVO@    R0,     R4                      ; 55A5   0260
        MVO@    R1,     R4                      ; 55A6   0261
        PSHR    R6                              ; 55A7   0276
        MVI@    R1,     R2                      ; 55A8   028A
L_55A9:
        PSHR    R5                              ; 55A9   0275
        MVII    #$0200, R4                      ; 55AA   02BC 0200
        SDBD                                    ; 55AC   0001
        MVII    #$5677, R5                      ; 55AD   02BD 0077 0056
        SDBD                                    ; 55B0   0001
        MVII    #$55A5, R1                      ; 55B1   02B9 00A5 0055
        MVO     R1,     G_0318                  ; 55B4   0241 0318
        MVO     R5,     G_0317                  ; 55B6   0245 0317
L_55B8:
        CLRR    R0                              ; 55B8   01C0
        CLRR    R3                              ; 55B9   01DB
L_55BA:
        PSHR    R0                              ; 55BA   0270
        MVI@    R5,     R0                      ; 55BB   02A8
        PSHR    R5                              ; 55BC   0275

        JSR     R5,     L_561A                  ; 55BD   0004 0154 021A

        PULR    R5                              ; 55C0   02B5
        PULR    R0                              ; 55C1   02B0
        CMPI    #$02DF, R4                      ; 55C2   037C 02DF
        BGE     L_55F2                          ; 55C4   020D 002C

        INCR    R0                              ; 55C6   0008
        CMPI    #$000A, R0                      ; 55C7   0378 000A
        BLT     L_55BA                          ; 55C9   0225 0010

        PSHR    R5                              ; 55CB   0275
        DECR    R5                              ; 55CC   0015
        CLRR    R0                              ; 55CD   01C0
        INCR    R3                              ; 55CE   000B
L_55CF:
        PSHR    R0                              ; 55CF   0270
        MVI@    R5,     R0                      ; 55D0   02A8
        DECR    R5                              ; 55D1   0015
        DECR    R5                              ; 55D2   0015
        PSHR    R5                              ; 55D3   0275

        JSR     R5,     L_561A                  ; 55D4   0004 0154 021A

        PULR    R5                              ; 55D7   02B5
        MVI     G_0318, R2                      ; 55D8   0282 0318
        MVI@    R2,     R0                      ; 55DA   0290
        MOVR    R4,     R1                      ; 55DB   00A1
        DECR    R1                              ; 55DC   0011
        CMPR    R0,     R1                      ; 55DD   0141
        BNEQ    L_55E9                          ; 55DE   020C 0009

        MVI@    R1,     R0                      ; 55E0   0288
        SDBD                                    ; 55E1   0001
        XORI    #$2000, R0                      ; 55E2   03F8 0000 0020
        MVO@    R0,     R1                      ; 55E5   0248
        INCR    R2                              ; 55E6   000A
        MVO     R2,     G_0318                  ; 55E7   0242 0318
L_55E9:
        PULR    R0                              ; 55E9   02B0
        INCR    R0                              ; 55EA   0008
        CMPI    #$000A, R0                      ; 55EB   0378 000A
        BLT     L_55CF                          ; 55ED   0225 001F

        PULR    R5                              ; 55EF   02B5
        B       L_55B8                          ; 55F0   0220 0039

L_55F2:
        MVII    #$0011, R0                      ; 55F2   02B8 0011

        JSR     R5,     X_FILL_ZERO             ; 55F4   0004 0114 0338

        PULR    R7                              ; 55F7   02B7

L_55F8:
        PSHR    R5                              ; 55F8   0275
        SDBD                                    ; 55F9   0001
        MVII    #$0005, R3                      ; 55FA   02BB 0005 0000
        MVII    #$0221, R4                      ; 55FD   02BC 0221

        JSR     R5,     X_PRINT_R5              ; 55FF   0004 0118 007B
        STRING  "VSTR"                          ; 5602   0056 0053 0054 0052
        DECLE   $0000                           ; 5606   0000

        SDBD                                    ; 5607   0001
        MVII    #$0003, R3                      ; 5608   02BB 0003 0000
        MVII    #$0217, R4                      ; 560B   02BC 0217

        JSR     R5,     X_PRINT_R5              ; 560D   0004 0118 007B
        STRING  "HOME"                          ; 5610   0048 004F 004D 0045
        DECLE   $0000                           ; 5614   0000

        MVII    #$00D6, R0                      ; 5615   02B8 00D6
        MVO     R0,     .BTAB.32                ; 5617   0240 0232
        PULR    R7                              ; 5619   02B7

L_561A:
        PSHR    R5                              ; 561A   0275
        CLRR    R1                              ; 561B   01C9
        TSTR    R3                              ; 561C   009B
        BNEQ    L_5628                          ; 561D   020C 0009

        MOVR    R0,     R2                      ; 561F   0082
        ANDI    #$0200, R2                      ; 5620   03BA 0200
        BEQ     L_5628                          ; 5622   0204 0004

        SDBD                                    ; 5624   0001
        XORI    #$2000, R1                      ; 5625   03F9 0000 0020
L_5628:
        MOVR    R0,     R2                      ; 5628   0082
        DECLE   $03BA,  $0100,  $020C,  $0022   ; 5629   03BA 0100 020C 0022
        DECLE   $0004,  $0154,  $0240,  $0000   ; 562D   0004 0154 0240 0000
        DECLE   $0000                           ; 5631   0000

        ADDR    R2,     R4                      ; 5632   00D4
        ADDR    R2,     R4                      ; 5633   00D4
        ADDR    R1,     R4                      ; 5634   00CC
        ADDR    R1,     R4                      ; 5635   00CC
        ADDR    R0,     R1                      ; 5636   00C1
        ADDR    R0,     R0                      ; 5637   00C0
        RRC     R0,     2                       ; 5638   0074
        RRC     R1,     2                       ; 5639   0075
        MOVR    R0,     R3                      ; 563A   0083
        MOVR    R0,     R2                      ; 563B   0082
        MOVR    R0,     R7                      ; 563C   0087

        MOVR    R0,     R6                      ; 563D   0086
        ADDR    R1,     R7                      ; 563E   00CF
        ADDR    R1,     R7                      ; 563F   00CF

        MOVR    R0,     R2                      ; 5640   0082
        SLR     R2,     2                       ; 5641   0066
        SLR     R2,     1                       ; 5642   0062
        ANDI    #$001F, R2                      ; 5643   03BA 001F
        TSTR    R3                              ; 5645   009B
        BEQ     L_5649                          ; 5646   0204 0001

        INCR    R2                              ; 5648   000A
L_5649:
        ADDR    R2,     R5                      ; 5649   00D5
        MVI@    R5,     R2                      ; 564A   02AA
        SLL     R2,     2                       ; 564B   004E
        SLL     R2,     1                       ; 564C   004A
        B       L_565E                          ; 564D   0200 000F

        DECLE   $0001                           ; 564F   0001

        XORI    #$0000, R1                      ; 5650   03F9 0000
        INCR    R0                              ; 5652   0008
        MOVR    R0,     R2                      ; 5653   0082
        ANDI    #$00F8, R2                      ; 5654   03BA 00F8
        TSTR    R3                              ; 5656   009B
        BEQ     L_565E                          ; 5657   0204 0005

        TSTR    R2                              ; 5659   0092
        BEQ     L_565E                          ; 565A   0204 0002

        ADDI    #$0008, R2                      ; 565C   02FA 0008
L_565E:
        XORR    R2,     R1                      ; 565E   01D1
        ANDI    #$0007, R0                      ; 565F   03B8 0007
        SLL     R0,     1                       ; 5661   0048

        JSR     R5,     L_5671                  ; 5662   0004 0154 0271
        DECLE   $0002,  $0000,  $0005,  $0000   ; 5665   0002 0000 0005 0000
        DECLE   $0001,  $0000,  $0001,  $0010   ; 5669   0001 0000 0001 0010
        DECLE   $0000,  $0010,  $0007,  $0000   ; 566D   0000 0010 0007 0000
L_5671:
        ADDR    R0,     R5                      ; 5671   00C5
        SDBD                                    ; 5672   0001
        MVI@    R5,     R2                      ; 5673   02AA
        XORR    R2,     R1                      ; 5674   01D1
        MVO@    R1,     R4                      ; 5675   0261
        PULR    R7                              ; 5676   02B7

        DECLE   $0104,  $0104,  $0105,  $0225   ; 5677   0104 0104 0105 0225
        DECLE   $0025,  $0025,  $0025,  $0025   ; 567B   0025 0025 0025 0025
        DECLE   $0025,  $0025,  $0104,  $0104   ; 567F   0025 0025 0104 0104
        DECLE   $0105,  $0005,  $0005,  $0005   ; 5683   0105 0005 0005 0005
        DECLE   $0005,  $0005,  $0005,  $0005   ; 5687   0005 0005 0005 0005
        DECLE   $0104,  $0104,  $0105,  $0005   ; 568B   0104 0104 0105 0005
        DECLE   $0005,  $0005,  $0005,  $0005   ; 568F   0005 0005 0005 0005
        DECLE   $0005,  $0005,  $0104,  $0104   ; 5693   0005 0005 0104 0104
        DECLE   $0105,  $0075,  $0075,  $0075   ; 5697   0105 0075 0075 0075
        DECLE   $0075,  $0075,  $0075,  $0075   ; 569B   0075 0075 0075 0075
        DECLE   $0304,  $0304,  $0042,  $0303   ; 569F   0304 0304 0042 0303
        DECLE   $0262,  $0103,  $0103,  $0103   ; 56A3   0262 0103 0103 0103
        DECLE   $0103,  $0103,  $0104,  $0042   ; 56A7   0103 0103 0104 0042
        DECLE   $0252,  $0005,  $0108,  $0305   ; 56AB   0252 0005 0108 0305
        DECLE   $0305,  $0169,  $0005,  $0030   ; 56AF   0305 0169 0005 0030
        DECLE   $0042,  $0102,  $0262,  $0005   ; 56B3   0042 0102 0262 0005
        DECLE   $0118,  $0305,  $0205,  $0179   ; 56B7   0118 0305 0205 0179
        DECLE   $0005,  $0030,  $0102,  $0252   ; 56BB   0005 0030 0102 0252
        DECLE   $0005,  $0128,  $0005,  $0005   ; 56BF   0005 0128 0005 0005
        DECLE   $0199,  $0189,  $01D8,  $01B8   ; 56C3   0199 0189 01D8 01B8
        DECLE   $0102,  $0062,  $0148,  $0138   ; 56C7   0102 0062 0148 0138
        DECLE   $0005,  $0005,  $01A9,  $0005   ; 56CB   0005 0005 01A9 0005
        DECLE   $01E8,  $01C8,  $0052,  $0005   ; 56CF   01E8 01C8 0052 0005
        DECLE   $0005,  $0118,  $0005,  $0005   ; 56D3   0005 0118 0005 0005
        DECLE   $0169,  $0005,  $0005,  $0030   ; 56D7   0169 0005 0005 0030
        DECLE   $0062,  $0005,  $0158,  $0005   ; 56DB   0062 0005 0158 0005
        DECLE   $0005,  $0005,  $0179,  $0005   ; 56DF   0005 0005 0179 0005
        DECLE   $0005,  $0030,  $0304,  $0304   ; 56E3   0005 0030 0304 0304
        DECLE   $0304                           ; 56E7   0304
.GFX_LIST_56E8:
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 56E8   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 56EC   00FF 00FF 00FF 00FF
        DECLE   $0004,  $0008,  $0008,  $0008   ; 56F0   0004 0008 0008 0008
        DECLE   $0010,  $0010,  $0010,  $0020   ; 56F4   0010 0010 0010 0020
        DECLE   $0020,  $0010,  $0010,  $0010   ; 56F8   0020 0010 0010 0010
        DECLE   $0008,  $0008,  $0008,  $0004   ; 56FC   0008 0008 0008 0004
        DECLE   $0020,  $0020,  $0040,  $0040   ; 5700   0020 0020 0040 0040
        DECLE   $0040,  $0080,  $0080,  $0080   ; 5704   0040 0080 0080 0080
        DECLE   $0004,  $0004,  $0002,  $0002   ; 5708   0004 0004 0002 0002
        DECLE   $0002,  $0001,  $0001,  $0001   ; 570C   0002 0001 0001 0001
        DECLE   $0003,  $0005,  $000B,  $0015   ; 5710   0003 0005 000B 0015
        DECLE   $002B,  $0015,  $0028,  $0050   ; 5714   002B 0015 0028 0050
        DECLE   $00C0,  $00A0,  $00D0,  $00A8   ; 5718   00C0 00A0 00D0 00A8
        DECLE   $00D4,  $00A8,  $0014,  $000A   ; 571C   00D4 00A8 0014 000A
        DECLE   $0028,  $0058,  $00A8,  $00D8   ; 5720   0028 0058 00A8 00D8
        DECLE   $0008,  $0010,  $0010,  $0020   ; 5724   0008 0010 0010 0020
        DECLE   $0014,  $001A,  $0015,  $001B   ; 5728   0014 001A 0015 001B
        DECLE   $0010,  $0008,  $0008,  $0004   ; 572C   0010 0008 0008 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5730   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 5734   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5738   0000 0000 0000 0000
        DECLE   $0080,  $0000,  $0000,  $0000   ; 573C   0080 0000 0000 0000
        DECLE   $0001,  $0001,  $0001,  $0002   ; 5740   0001 0001 0001 0002
        DECLE   $0002,  $0002,  $0004,  $0004   ; 5744   0002 0002 0004 0004
        DECLE   $0080,  $0080,  $0080,  $0040   ; 5748   0080 0080 0080 0040
        DECLE   $0040,  $0040,  $0020,  $0020   ; 574C   0040 0040 0020 0020
        DECLE   $0008,  $0010,  $0010,  $0010   ; 5750   0008 0010 0010 0010
        DECLE   $0010,  $0020,  $0020,  $0020   ; 5754   0010 0020 0020 0020
        DECLE   $0010,  $0008,  $0008,  $0008   ; 5758   0010 0008 0008 0008
        DECLE   $0008,  $0004,  $0004,  $0004   ; 575C   0008 0004 0004 0004
        DECLE   $0020,  $0040,  $0040,  $0040   ; 5760   0020 0040 0040 0040
        DECLE   $0040,  $0080,  $0080,  $0080   ; 5764   0040 0080 0080 0080
        DECLE   $0004,  $0002,  $0002,  $0002   ; 5768   0004 0002 0002 0002
        DECLE   $0002,  $0001,  $0001,  $0001   ; 576C   0002 0001 0001 0001
        DECLE   $0080,  $0000,  $0000,  $0000   ; 5770   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5774   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 5778   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 577C   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0001,  $0001   ; 5780   0000 0001 0001 0001
        DECLE   $0001,  $0002,  $0002,  $0002   ; 5784   0001 0002 0002 0002
        DECLE   $0000,  $0080,  $0080,  $0080   ; 5788   0000 0080 0080 0080
        DECLE   $0080,  $0040,  $0040,  $0040   ; 578C   0080 0040 0040 0040
        DECLE   $0002,  $0004,  $0004,  $0004   ; 5790   0002 0004 0004 0004
        DECLE   $0004,  $0008,  $0008,  $0008   ; 5794   0004 0008 0008 0008
        DECLE   $0040,  $0020,  $0020,  $0020   ; 5798   0040 0020 0020 0020
        DECLE   $0020,  $0010,  $0010,  $0010   ; 579C   0020 0010 0010 0010
        DECLE   $0001,  $0001                   ; 57A0   0001 0001

        INCR    R7                              ; 57A2   000F

        RRC     R1,     1                       ; 57A3   0071
L_57A4:
        MOVR    R0,     R1                      ; 57A4   0081
        DECLE   $0001,  $0001,  $0001,  $0080   ; 57A5   0001 0001 0001 0080
        DECLE   $0080,  $00F0,  $008E,  $0081   ; 57A9   0080 00F0 008E 0081
        DECLE   $0080,  $0080,  $0080,  $0001   ; 57AD   0080 0080 0080 0001
        DECLE   $0001,  $0001,  $0081,  $0071   ; 57B1   0001 0001 0081 0071
        DECLE   $000F,  $0001,  $0001,  $0080   ; 57B5   000F 0001 0001 0080
        DECLE   $0080,  $0080,  $0081,  $008E   ; 57B9   0080 0080 0081 008E
        DECLE   $00F0,  $0080,  $0080,  $0000   ; 57BD   00F0 0080 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 57C1   0000 0000 0000 0001
        DECLE   $0002,  $0004,  $0004,  $0000   ; 57C5   0002 0004 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 57C9   0000 0000 0000 0080
        DECLE   $0040,  $0020,  $0020,  $0004   ; 57CD   0040 0020 0020 0004
        DECLE   $0004,  $0002,  $0001,  $0000   ; 57D1   0004 0002 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0020   ; 57D5   0000 0000 0000 0020
        DECLE   $0020,  $0040,  $0080,  $0000   ; 57D9   0020 0040 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 57DD   0000 0000 0000 0010
        DECLE   $0038,  $0044,  $0038,  $0014   ; 57E1   0038 0044 0038 0014
        DECLE   $002A,  $0068,  $0018,  $0008   ; 57E5   002A 0068 0018 0008
        DECLE   $001C,  $0022,  $001C,  $0028   ; 57E9   001C 0022 001C 0028
        DECLE   $0054,  $0016,  $0018,  $003C   ; 57ED   0054 0016 0018 003C
        DECLE   $0042,  $0099,  $00A1,  $00A1   ; 57F1   0042 0099 00A1 00A1
        DECLE   $0099,  $0042,  $003C,  $0038   ; 57F5   0099 0042 003C 0038
        DECLE   $0038,  $0038,  $0039,  $0039   ; 57F9   0038 0038 0039 0039
        DECLE   $0039,  $0039,  $0000,  $0000   ; 57FD   0039 0039 0000 0000
        DECLE   $000D,  $00CC,  $00EC,  $00FC   ; 5801   000D 00CC 00EC 00FC
        DECLE   $00BC,  $0098,  $0000,  $00C0   ; 5805   00BC 0098 0000 00C0
        DECLE   $00E0,  $00CC,  $00CC,  $00C6   ; 5809   00E0 00CC 00CC 00C6
        DECLE   $00C6,  $0073,  $0000,  $0020   ; 580D   00C6 0073 0000 0020
        DECLE   $0020,  $0040,  $0040,  $0080   ; 5811   0020 0040 0040 0080
        DECLE   $0080,  $0000,  $0000           ; 5815   0080 0000 0000
L_5818:
        PSHR    R5                              ; 5818   0275
        MVII    #$031D, R1                      ; 5819   02B9 031D
        MVII    #$015D, R4                      ; 581B   02BC 015D
L_581D:
        MVI@    R1,     R0                      ; 581D   0288
        SWAP    R0,     1                       ; 581E   0040
        ANDI    #$0040, R0                      ; 581F   03B8 0040
        BNEQ    L_5850                          ; 5821   020C 002D

        ADDI    #$0004, R1                      ; 5823   02F9 0004
        MVI@    R1,     R2                      ; 5825   028A
        MOVR    R2,     R3                      ; 5826   0093
        ANDI    #$00FF, R2                      ; 5827   03BA 00FF
        XORR    R2,     R3                      ; 5829   01D3
        SWAP    R2,     1                       ; 582A   0042
        ADDI    #$0003, R1                      ; 582B   02F9 0003
        MVI@    R1,     R0                      ; 582D   0288
        ANDI    #$00FF, R0                      ; 582E   03B8 00FF
        XORR    R0,     R3                      ; 5830   01C3
        XOR@    R1,     R0                      ; 5831   03C8
        SWAP    R0,     1                       ; 5832   0040
        XORR    R0,     R2                      ; 5833   01C2

        JSR     R5,     L_5859                  ; 5834   0004 0158 0059

        PSHR    R0                              ; 5837   0270
        MOVR    R2,     R3                      ; 5838   0093

        JSR     R5,     L_5859                  ; 5839   0004 0158 0059

        PULR    R2                              ; 583C   02B2
        MOVR    R2,     R5                      ; 583D   0095
        ANDI    #$00FF, R5                      ; 583E   03BD 00FF
        XORR    R5,     R2                      ; 5840   01EA
        SWAP    R0,     1                       ; 5841   0040
        MOVR    R0,     R3                      ; 5842   0083
        ANDI    #$00FF, R3                      ; 5843   03BB 00FF
        XORR    R3,     R0                      ; 5845   01D8
        XORR    R5,     R0                      ; 5846   01E8
        XORR    R2,     R3                      ; 5847   01D3
        MVO@    R0,     R1                      ; 5848   0248
        SUBI    #$0003, R1                      ; 5849   0339 0003
        MVO@    R3,     R1                      ; 584B   024B
        SUBI    #$0004, R1                      ; 584C   0339 0004
        SUBI    #$0002, R4                      ; 584E   033C 0002
L_5850:
        ADDI    #$0008, R1                      ; 5850   02F9 0008
        ADDI    #$0008, R4                      ; 5852   02FC 0008
        CMPI    #$035D, R1                      ; 5854   0379 035D
        BLT     L_581D                          ; 5856   0225 003A
        PULR    R7                              ; 5858   02B7

L_5859:
        MVI@    R4,     R0                      ; 5859   02A0
        SWAP    R0,     1                       ; 585A   0040
        SAR     R0,     2                       ; 585B   006C
        SAR     R0,     1                       ; 585C   0068
        ADDR    R3,     R0                      ; 585D   00D8
        MOVR    R0,     R3                      ; 585E   0083
        BEQ     L_5867                          ; 585F   0204 0006

        SAR     R3,     2                       ; 5861   006F
        SAR     R3,     2                       ; 5862   006F
        BMI     L_5866                          ; 5863   020B 0001

        INCR    R3                              ; 5865   000B
L_5866:
        SUBR    R3,     R0                      ; 5866   0118
L_5867:
        MOVR    R5,     R7                      ; 5867   00AF

L_5868:
        PSHR    R0                              ; 5868   0270
        MVI@    R5,     R0                      ; 5869   02A8
L_586A:
        PSHR    R5                              ; 586A   0275

        JSR     R5,     .EXEC.629               ; 586B   0004 0114 0229

        B       L_5874                          ; 586E   0200 0004

L_5870:
        PSHR    R5                              ; 5870   0275

        JSR     R5,     X_PACK_BYTES            ; 5871   0004 0114 034F

L_5874:
        PULR    R5                              ; 5874   02B5
        MOVR    R0,     R1                      ; 5875   0081
        PULR    R0                              ; 5876   02B0
L_5877:
        PSHR    R5                              ; 5877   0275
        SLL     R0,     2                       ; 5878   004C
        SLL     R0,     1                       ; 5879   0048
        MOVR    R0,     R5                      ; 587A   0085
        ADDI    #$015D, R5                      ; 587B   02FD 015D
        SLR     R0,     2                       ; 587D   0064
        SLR     R0,     1                       ; 587E   0060
        SWAP    R1,     1                       ; 587F   0041
        NOP                                     ; 5880   0034
        MVO@    R1,     R5                      ; 5881   0269
        SAR     R1,     1                       ; 5882   0069
        PSHR    R0                              ; 5883   0270
        MVI     G_01C8, R0                      ; 5884   0280 01C8
        TSTR    R0                              ; 5886   0080
        BNEQ    L_588C                          ; 5887   020C 0003

        MOVR    R1,     R0                      ; 5889   0088
        SAR     R0,     1                       ; 588A   0068
        ADDR    R0,     R1                      ; 588B   00C1
L_588C:
        PULR    R0                              ; 588C   02B0
        SWAP    R1,     1                       ; 588D   0041
        MVO@    R1,     R5                      ; 588E   0269
        PULR    R7                              ; 588F   02B7

L_5890:
        MVI     .PSG0.rgt_hand,R4               ; 5890   0284 01FE
        COMR    R4                              ; 5892   001C
        MVO     R4,     G_0124                  ; 5893   0244 0124
        MVI     .PSG0.lft_hand,R4               ; 5895   0284 01FF
        COMR    R4                              ; 5897   001C
        MVO     R4,     G_0123                  ; 5898   0244 0123
        MOVR    R5,     R7                      ; 589A   00AF

L_589B:
        PSHR    R5                              ; 589B   0275
        MVII    #$031D, R1                      ; 589C   02B9 031D
        MVII    #$015D, R4                      ; 589E   02BC 015D
L_58A0:
        MVI@    R1,     R0                      ; 58A0   0288
        MVII    #$0200, R5                      ; 58A1   02BD 0200
        COMR    R5                              ; 58A3   001D
        ANDR    R0,     R5                      ; 58A4   0185
        MOVR    R1,     R2                      ; 58A5   008A
        ADDI    #$0004, R2                      ; 58A6   02FA 0004
        SWAP    R0,     1                       ; 58A8   0040
        ANDI    #$0040, R0                      ; 58A9   03B8 0040
        BNEQ    L_58B5                          ; 58AB   020C 0008

        XOR@    R2,     R0                      ; 58AD   03D0
        BEQ     L_58B5                          ; 58AE   0204 0005
        BMI     L_58B4                          ; 58B0   020B 0002

        XORI    #$0200, R5                      ; 58B2   03FD 0200
L_58B4:
        MVO@    R5,     R1                      ; 58B4   024D
L_58B5:
        MOVR    R5,     R0                      ; 58B5   00A8
        ANDI    #$0008, R0                      ; 58B6   03B8 0008
        BNEQ    L_58D2                          ; 58B8   020C 0018

        INCR    R2                              ; 58BA   000A
        PSHR    R4                              ; 58BB   0274
        PSHR    R1                              ; 58BC   0271
        MVI@    R4,     R0                      ; 58BD   02A0
        MVI@    R4,     R1                      ; 58BE   02A1

        JSR     R5,     L_6099                  ; 58BF   0004 0160 0099

        PULR    R1                              ; 58C2   02B1
L_58C3:
        MOVR    R4,     R3                      ; 58C3   00A3
        MVII    #$003F, R4                      ; 58C4   02BC 003F
        CMPR    R4,     R3                      ; 58C6   0163
        BGT     L_58C3                          ; 58C7   022E 0005

        SLL     R3,     2                       ; 58C9   004F
        SLL     R3,     2                       ; 58CA   004F
        PULR    R4                              ; 58CB   02B4
        MVII    #$03F0, R5                      ; 58CC   02BD 03F0
        COMR    R5                              ; 58CE   001D
        AND@    R2,     R5                      ; 58CF   0395
        XORR    R3,     R5                      ; 58D0   01DD
        MVO@    R5,     R2                      ; 58D1   0255
L_58D2:
        ADDI    #$0008, R1                      ; 58D2   02F9 0008
        ADDI    #$0008, R4                      ; 58D4   02FC 0008
        CMPI    #$035D, R1                      ; 58D6   0379 035D
        BMI     L_58A0                          ; 58D8   022B 0039
        PULR    R7                              ; 58DA   02B7

L_58DB:
        PSHR    R0                              ; 58DB   0270
        PSHR    R1                              ; 58DC   0271
        MVI@    R5,     R0                      ; 58DD   02A8
        J       .EXEC.6E9                       ; 58DE   0004 0314 02E9

L_58E1:
        PSHR    R0                              ; 58E1   0270
        PSHR    R1                              ; 58E2   0271
        MVI@    R5,     R0                      ; 58E3   02A8
        J       .EXEC.6DE                       ; 58E4   0004 0314 02DE

L_58E7:
        MOVR    R5,     R4                      ; 58E7   00AC
        MVII    #$003C, R0                      ; 58E8   02B8 003C

        JSR     R5,     X_RAND2                 ; 58EA   0004 0114 029E

        CMP@    R4,     R0                      ; 58ED   0360
        MOVR    R4,     R7                      ; 58EE   00A7

L_58EF:
        PSHR    R5                              ; 58EF   0275
        PSHR    R0                              ; 58F0   0270
        MVII    #$0008, R0                      ; 58F1   02B8 0008

        JSR     R5,     X_RAND1                 ; 58F3   0004 0114 027D

        PULR    R5                              ; 58F6   02B5
        CMPR    R5,     R0                      ; 58F7   0168
        PULR    R7                              ; 58F8   02B7

L_58F9:
        PSHR    R5                              ; 58F9   0275
        MVII    #$0008, R0                      ; 58FA   02B8 0008
L_58FC:
        MVI@    R1,     R4                      ; 58FC   028C
        MVI@    R2,     R5                      ; 58FD   0295
        MVO@    R5,     R1                      ; 58FE   024D
        MVO@    R4,     R2                      ; 58FF   0254
        INCR    R1                              ; 5900   0009
        INCR    R2                              ; 5901   000A
        DECR    R0                              ; 5902   0010
        BNEQ    L_58FC                          ; 5903   022C 0008
        PULR    R7                              ; 5905   02B7

        PSHR    R5                              ; 5906   0275
        MVI     G_01A3, R5                      ; 5907   0285 01A3
        CMPI    #$0007, R5                      ; 5909   037D 0007
        BNEQ    L_59FB                          ; 590B   020C 00EE

        MVII    #$0004, R0                      ; 590D   02B8 0004

        JSR     R5,     X_SET_BIT               ; 590F   0004 0114 02DB

        ANDR    R4,     R2                      ; 5912   01A2
        MVI     G_0359, R0                      ; 5913   0280 0359

        JSR     R5,     X_UNPK_BYTES            ; 5915   0004 0114 0357

        CMPI    #$0002, R3                      ; 5918   037B 0002
        BPL     L_591E                          ; 591A   0203 0002

        NEGR    R0                              ; 591C   0020
        INCR    R7                              ; 591D   000F

L_591E:
        NEGR    R1                              ; 591E   0021
L_591F:
        SAR     R0,     1                       ; 591F   0068
        SAR     R1,     1                       ; 5920   0069

        JSR     R5,     X_PACK_BYTES            ; 5921   0004 0114 034F

        MVO     R0,     G_0359                  ; 5924   0240 0359

        JSR     R5,     L_6654                  ; 5926   0004 0164 0254

        PULR    R7                              ; 5929   02B7

        PSHR    R5                              ; 592A   0275
        MVI     G_019D, R5                      ; 592B   0285 019D
        ANDI    #$0004, R5                      ; 592D   03BD 0004
        BNEQ    L_59FB                          ; 592F   020C 00CA

        MOVR    R0,     R2                      ; 5931   0082
        SLL     R2,     2                       ; 5932   004E
        SLL     R2,     1                       ; 5933   004A
        ADDI    #$0161, R2                      ; 5934   02FA 0161
        MVI@    R2,     R2                      ; 5936   0292
        TSTR    R2                              ; 5937   0092
        BNEQ    L_59FB                          ; 5938   020C 00C1

        MVI     G_01A3, R2                      ; 593A   0282 01A3
        CMPI    #$0006, R2                      ; 593C   037A 0006
        BGE     L_5944                          ; 593E   020D 0004

        XORR    R0,     R2                      ; 5940   01C2
        SARC    R2,     1                       ; 5941   007A
        BNC     L_59FB                          ; 5942   0209 00B7

L_5944:
        PSHR    R0                              ; 5944   0270
        SDBD                                    ; 5945   0001
        MVII    #$0803, R4                      ; 5946   02BC 0003 0008
        SLR     R0,     1                       ; 5949   0060
        BEQ     L_5956                          ; 594A   0204 000A

        MVI     G_01A3, R0                      ; 594C   0280 01A3
        CMPI    #$0007, R0                      ; 594E   0378 0007
        BNEQ    L_5956                          ; 5950   020C 0004

        SDBD                                    ; 5952   0001
        MVII    #$0805, R4                      ; 5953   02BC 0005 0008

L_5956:
        JSR     R5,     .EXEC.70F               ; 5956   0004 0114 030F

        PULR    R0                              ; 5959   02B0
        BNC     L_59FB                          ; 595A   0209 009F

        MVI     G_01A3, R2                      ; 595C   0282 01A3
        CMPI    #$0007, R2                      ; 595E   037A 0007
        BEQ     L_5977                          ; 5960   0204 0015

        MVI@    R1,     R3                      ; 5962   028B
        ADDI    #$0002, R1                      ; 5963   02F9 0002
        MVII    #$0100, R2                      ; 5965   02BA 0100
        ANDI    #$0200, R3                      ; 5967   03BB 0200
        BEQ     L_596C                          ; 5969   0204 0001

        NEGR    R2                              ; 596B   0022
L_596C:
        ADD@    R1,     R2                      ; 596C   02CA
        CMP     G_0357, R2                      ; 596D   0342 0357
        TSTR    R3                              ; 596F   009B
        BC      L_5975                          ; 5970   0201 0003
        BNEQ    L_5977                          ; 5972   020C 0003
        PULR    R7                              ; 5974   02B7
L_5975:
        BNEQ    L_59FB                          ; 5975   020C 0084

L_5977:
        JSR     R5,     X_CLR_BIT               ; 5977   0004 0114 02E6

        ANDR    R4,     R0                      ; 597A   01A0
        PULR    R7                              ; 597B   02B7

L_597C:
        PSHR    R5                              ; 597C   0275
        MVI     G_01A3, R3                      ; 597D   0283 01A3
        MVII    #$0007, R2                      ; 597F   02BA 0007
        MVI     G_019D, R5                      ; 5981   0285 019D
        ANDI    #$0004, R5                      ; 5983   03BD 0004
        BNEQ    L_59D4                          ; 5985   020C 004D

        MVI     G_01A2, R5                      ; 5987   0285 01A2
        ANDI    #$0008, R5                      ; 5989   03BD 0008
        BNEQ    L_59D2                          ; 598B   020C 0045

        MVI     G_019E, R1                      ; 598D   0281 019E
        TSTR    R1                              ; 598F   0089
        BEQ     L_5997                          ; 5990   0204 0005

        DECR    R1                              ; 5992   0011
        MVO     R1,     G_019E                  ; 5993   0241 019E
        MVI     G_019F, R1                      ; 5995   0281 019F
L_5997:
        COMR    R1                              ; 5997   0019
        AND     G_01A0, R1                      ; 5998   0381 01A0
        BEQ     L_59BE                          ; 599A   0204 0022

        MOVR    R1,     R2                      ; 599C   008A
        CLRR    R0                              ; 599D   01C0
        INCR    R7                              ; 599E   000F

L_599F:
        INCR    R0                              ; 599F   0008
L_59A0:
        SARC    R2,     1                       ; 59A0   007A
        BC      L_599F                          ; 59A1   0221 0003
        BNEQ    L_59A0                          ; 59A3   022C 0004

        CMPI    #$0001, R0                      ; 59A5   0378 0001
        BNEQ    L_59AD                          ; 59A7   020C 0004

        CMPI    #$0007, R3                      ; 59A9   037B 0007
        BEQ     L_59B7                          ; 59AB   0204 000A

L_59AD:
        INCR    R0                              ; 59AD   0008

        JSR     R5,     X_RAND2                 ; 59AE   0004 0114 029E

        B       L_59B7                          ; 59B1   0200 0004

L_59B3:
        DECR    R0                              ; 59B3   0010
        BEQ     L_59D4                          ; 59B4   0204 001E

L_59B6:
        INCR    R2                              ; 59B6   000A
L_59B7:
        SARC    R1,     1                       ; 59B7   0079
        BC      L_59B3                          ; 59B8   0221 0006
        BNEQ    L_59B6                          ; 59BA   022C 0005
        B       L_59D2                          ; 59BC   0200 0014

L_59BE:
        MVI     G_01A3, R0                      ; 59BE   0280 01A3
        PSHR    R0                              ; 59C0   0270
        MOVR    R3,     R0                      ; 59C1   0098

        JSR     R5,     L_5CD2                  ; 59C2   0004 015C 00D2

        MVI     G_01A3, R0                      ; 59C5   0280 01A3
        PULR    R5                              ; 59C7   02B5
        CMPR    R0,     R5                      ; 59C8   0145
        BEQ     L_59D2                          ; 59C9   0204 0007

        MVII    #$0003, R0                      ; 59CB   02B8 0003

        JSR     R5,     X_RAND1                 ; 59CD   0004 0114 027D

        MVO     R0,     G_01C6                  ; 59D0   0240 01C6
L_59D2:
        MVI     G_01A3, R2                      ; 59D2   0282 01A3
L_59D4:
        MVO     R2,     G_01A3                  ; 59D4   0242 01A3
        CMPI    #$0007, R2                      ; 59D6   037A 0007
        BEQ     L_59F8                          ; 59D8   0204 001E

        MVI     G_01A2, R0                      ; 59DA   0280 01A2
        ANDI    #$00EF, R0                      ; 59DC   03B8 00EF
        MVO     R0,     G_01A2                  ; 59DE   0240 01A2
        CLRR    R5                              ; 59E0   01ED
        MVO     R5,     G_0359                  ; 59E1   0245 0359
        MOVR    R2,     R0                      ; 59E3   0090

        JSR     R5,     .EXEC.76C               ; 59E4   0004 0114 036C

        MVII    #$0300, R4                      ; 59E7   02BC 0300
        MVI@    R1,     R2                      ; 59E9   028A
        ANDI    #$0200, R2                      ; 59EA   03BA 0200
        BNEQ    L_59EF                          ; 59EC   020C 0001

        NEGR    R4                              ; 59EE   0024
L_59EF:
        ADDI    #$0002, R1                      ; 59EF   02F9 0002
        ADD@    R1,     R4                      ; 59F1   02CC
        MVO     R4,     G_0357                  ; 59F2   0244 0357
        INCR    R1                              ; 59F4   0009
        MVI@    R1,     R4                      ; 59F5   028C
        MVO     R4,     G_0358                  ; 59F6   0244 0358
L_59F8:
        CLRR    R5                              ; 59F8   01ED
        MVO     R5,     G_01A0                  ; 59F9   0245 01A0
L_59FB:
        PULR    R7                              ; 59FB   02B7

L_59FC:
        CLRR    R0                              ; 59FC   01C0
        MOVR    R2,     R1                      ; 59FD   0091
        ADDR    R3,     R1                      ; 59FE   00D9
        CMPI    #$0066, R1                      ; 59FF   0379 0066
        RLC     R0,     1                       ; 5A01   0050
        CMPI    #$0041, R2                      ; 5A02   037A 0041
        RLC     R0,     1                       ; 5A04   0050
        CMPI    #$004B, R2                      ; 5A05   037A 004B
        RLC     R0,     1                       ; 5A07   0050
        CMPI    #$003A, R3                      ; 5A08   037B 003A
        RLC     R0,     1                       ; 5A0A   0050
        CMPI    #$0048, R3                      ; 5A0B   037B 0048
        RLC     R0,     1                       ; 5A0D   0050
        SLL     R0,     1                       ; 5A0E   0048
        XOR     G_01B0, R0                      ; 5A0F   03C0 01B0
        MVO     R0,     G_01A1                  ; 5A11   0240 01A1
        MOVR    R5,     R7                      ; 5A13   00AF

L_5A14:
        PSHR    R5                              ; 5A14   0275

        JSR     R5,     L_5A30                  ; 5A15   0004 0158 0230
        JSR     R5,     L_5B19                  ; 5A18   0004 0158 0319
        JSR     R5,     L_5C7E                  ; 5A1B   0004 015C 007E
        JSR     R5,     L_5818                  ; 5A1E   0004 0158 0018

        MVI     G_019D, R0                      ; 5A21   0280 019D
        ANDI    #$0005, R0                      ; 5A23   03B8 0005
        BNEQ    L_5A2C                          ; 5A25   020C 0005

        MVI     G_01B6, R0                      ; 5A27   0280 01B6
        DECR    R0                              ; 5A29   0010
        BPL     L_5C06                          ; 5A2A   0203 01DA

L_5A2C:
        CLRR    R0                              ; 5A2C   01C0
        MVO     R0,     G_01B6                  ; 5A2D   0240 01B6
        PULR    R7                              ; 5A2F   02B7

L_5A30:
        PSHR    R5                              ; 5A30   0275

        JSR     R5,     L_5B05                  ; 5A31   0004 0158 0305

        CLRR    R3                              ; 5A34   01DB
        MVI     G_01BE, R0                      ; 5A35   0280 01BE
        TSTR    R0                              ; 5A37   0080
        BEQ     L_5A3F                          ; 5A38   0204 0005

        JSR     R5,     L_66CD                  ; 5A3A   0004 0164 02CD

        B       L_5A42                          ; 5A3D   0200 0003

L_5A3F:
        JSR     R5,     L_5A4D                  ; 5A3F   0004 0158 024D

L_5A42:
        MVII    #$0001, R3                      ; 5A42   02BB 0001
        MVI     G_01BF, R0                      ; 5A44   0280 01BF
        TSTR    R0                              ; 5A46   0080
        BEQ     L_5A4E                          ; 5A47   0204 0005

        JSR     R5,     L_66CD                  ; 5A49   0004 0164 02CD

        PULR    R7                              ; 5A4C   02B7

L_5A4D:
        PSHR    R5                              ; 5A4D   0275
L_5A4E:
        MOVR    R3,     R0                      ; 5A4E   0098

        JSR     R5,     L_5A66                  ; 5A4F   0004 0158 0266

        BNEQ    L_5A61                          ; 5A52   020C 000D

        PSHR    R0                              ; 5A54   0270

        JSR     R5,     L_6870                  ; 5A55   0004 0168 0070

        DECR    R2                              ; 5A58   0012
        DECR    R4                              ; 5A59   0014
        DECR    R6                              ; 5A5A   0016
        COMR    R0                              ; 5A5B   0018
        MOVR    R5,     R0                      ; 5A5C   00A8

        JSR     R5,     L_586A                  ; 5A5D   0004 0158 006A

        PULR    R7                              ; 5A60   02B7

L_5A61:
        CLRR    R1                              ; 5A61   01C9

        JSR     R5,     L_5877                  ; 5A62   0004 0158 0077

        PULR    R7                              ; 5A65   02B7

L_5A66:
        PSHR    R5                              ; 5A66   0275
        MVI     G_01BD, R1                      ; 5A67   0281 01BD
        CMPI    #$0002, R1                      ; 5A69   0379 0002
        BEQ     L_5A7C                          ; 5A6B   0204 000F

        TSTR    R1                              ; 5A6D   0089
        BNEQ    L_5A72                          ; 5A6E   020C 0002

L_5A70:
        TSTR    R5                              ; 5A70   00AD
        PULR    R7                              ; 5A71   02B7

L_5A72:
        MVI     G_011F, R1                      ; 5A72   0281 011F
        MOVR    R1,     R5                      ; 5A74   008D
        ANDI    #$00C0, R5                      ; 5A75   03BD 00C0
        BEQ     L_5A70                          ; 5A77   0224 0008

        MVII    #$0001, R1                      ; 5A79   02B9 0001
        INCR    R7                              ; 5A7B   000F

L_5A7C:
        MOVR    R3,     R1                      ; 5A7C   0099
L_5A7D:
        ADDI    #$011F, R1                      ; 5A7D   02F9 011F
        MVI@    R1,     R1                      ; 5A7F   0289
        MOVR    R1,     R5                      ; 5A80   008D
        ANDI    #$00C0, R5                      ; 5A81   03BD 00C0
L_5A83:
        PULR    R7                              ; 5A83   02B7

        MVII    #$0001, R2                      ; 5A84   02BA 0001
        INCR    R7                              ; 5A86   000F

        CLRR    R2                              ; 5A87   01D2
L_5A88:
        PSHR    R5                              ; 5A88   0275

        JSR     R5,     L_5B05                  ; 5A89   0004 0158 0305
        JSR     R5,     L_5AF0                  ; 5A8C   0004 0158 02F0

        MOVR    R1,     R3                      ; 5A8F   008B

        JSR     R5,     L_5A66                  ; 5A90   0004 0158 0266

        BEQ     L_5A9B                          ; 5A93   0204 0006

        CLRR    R1                              ; 5A95   01C9
        TSTR    R3                              ; 5A96   009B
        BEQ     L_5A9B                          ; 5A97   0204 0002

        MVII    #$0008, R1                      ; 5A99   02B9 0008
L_5A9B:
        PSHR    R1                              ; 5A9B   0271
        MOVR    R3,     R1                      ; 5A9C   0099
        SLL     R1,     2                       ; 5A9D   004D
        SLL     R1,     1                       ; 5A9E   0049
        MOVR    R1,     R4                      ; 5A9F   008C
        ADDI    #$0161, R1                      ; 5AA0   02F9 0161
        MVI@    R1,     R1                      ; 5AA2   0289
        TSTR    R1                              ; 5AA3   0089
        PULR    R1                              ; 5AA4   02B1
        BNEQ    L_5A83                          ; 5AA5   022C 0023

        SLL     R1,     1                       ; 5AA7   0049
        XORR    R1,     R2                      ; 5AA8   01CA
        SETC                                    ; 5AA9   0007
        RLC     R2,     1                       ; 5AAA   0052
        MOVR    R4,     R3                      ; 5AAB   00A3
        ADDI    #$0160, R3                      ; 5AAC   02FB 0160
        MVI@    R3,     R5                      ; 5AAE   029D
        TSTR    R5                              ; 5AAF   00AD
        BNEQ    L_5A83                          ; 5AB0   022C 002E

        MVO@    R2,     R3                      ; 5AB2   025A
        DECR    R3                              ; 5AB3   0013
        MVII    #$0004, R5                      ; 5AB4   02BD 0004
        MVO@    R5,     R3                      ; 5AB6   025D
        MOVR    R4,     R1                      ; 5AB7   00A1
        ADDI    #$031D, R1                      ; 5AB8   02F9 031D

        JSR     R5,     L_58DB                  ; 5ABA   0004 0158 00DB
        DECLE   $0003                           ; 5ABD   0003

        JSR     R5,     L_5B0C                  ; 5ABE   0004 0158 030C
        BIDECLE $64FD                           ; 5AC1   00FD 0064
        DECLE   $02F0                           ; 5AC3   02F0

        JSR     R5,     L_6672                  ; 5AC4   0004 0164 0272

        PULR    R7                              ; 5AC7   02B7

        PSHR    R5                              ; 5AC8   0275

        JSR     R5,     L_5B05                  ; 5AC9   0004 0158 0305
        JSR     R5,     L_5AF0                  ; 5ACC   0004 0158 02F0

        MOVR    R1,     R3                      ; 5ACF   008B
        TSTR    R0                              ; 5AD0   0080
        BNEQ    L_5AD9                          ; 5AD1   020C 0006

        MVI     G_01A3, R0                      ; 5AD3   0280 01A3
        CMPR    R0,     R1                      ; 5AD5   0141
        BNEQ    L_5CF8                          ; 5AD6   020C 0220
        PULR    R7                              ; 5AD8   02B7

L_5AD9:
        JSR     R5,     L_5AE8                  ; 5AD9   0004 0158 02E8
        DECLE   $0000,  $0007,  $0005,  $0003   ; 5ADC   0000 0007 0005 0003
        DECLE   $0009,  $0000,  $0001,  $000B   ; 5AE0   0009 0000 0001 000B
        DECLE   $000D,  $000F,  $0000,  $0000   ; 5AE4   000D 000F 0000 0000
L_5AE8:
        ADDR    R0,     R5                      ; 5AE8   00C5
        MVI@    R5,     R1                      ; 5AE9   02A9
        DECR    R1                              ; 5AEA   0011
        BMI     L_5A83                          ; 5AEB   022B 0069

        CLRR    R2                              ; 5AED   01D2
        B       L_5A9B                          ; 5AEE   0220 0054

L_5AF0:
        PSHR    R5                              ; 5AF0   0275
        MVII    #$01BE, R5                      ; 5AF1   02BD 01BE
        MVI@    R5,     R3                      ; 5AF3   02AB
        TSTR    R3                              ; 5AF4   009B
        MVI@    R5,     R3                      ; 5AF5   02AB
        BEQ     L_5AFE                          ; 5AF6   0204 0006

        TSTR    R3                              ; 5AF8   009B
        BNEQ    L_5B03                          ; 5AF9   020C 0008

        MVII    #$0001, R1                      ; 5AFB   02B9 0001
        PULR    R7                              ; 5AFD   02B7

L_5AFE:
        TSTR    R3                              ; 5AFE   009B
        BEQ     L_5A83                          ; 5AFF   0224 007D

        CLRR    R1                              ; 5B01   01C9
        PULR    R7                              ; 5B02   02B7

L_5B03:
        PULR    R5                              ; 5B03   02B5
        PULR    R7                              ; 5B04   02B7

L_5B05:
        MVI     G_019D, R4                      ; 5B05   0284 019D
        ANDI    #$0001, R4                      ; 5B07   03BC 0001
        BNEQ    L_5A83                          ; 5B09   022C 0087
        MOVR    R5,     R7                      ; 5B0B   00AF

L_5B0C:
        PSHR    R0                              ; 5B0C   0270
        SDBD                                    ; 5B0D   0001
        MVI@    R5,     R0                      ; 5B0E   02A8
        INCR    R1                              ; 5B0F   0009
        MVO@    R0,     R1                      ; 5B10   0248
        MVI@    R5,     R0                      ; 5B11   02A8
        ADDI    #$0004, R1                      ; 5B12   02F9 0004
        MVO@    R0,     R1                      ; 5B14   0248
        PULR    R0                              ; 5B15   02B0
        SUBI    #$0005, R1                      ; 5B16   0339 0005
L_5B18:
        MOVR    R5,     R7                      ; 5B18   00AF

L_5B19:
        PSHR    R5                              ; 5B19   0275
        MVII    #$015F, R3                      ; 5B1A   02BB 015F
        CLRR    R4                              ; 5B1C   01E4
L_5B1D:
        MVI@    R3,     R0                      ; 5B1D   0298
        DECR    R0                              ; 5B1E   0010
        BPL     L_5B29                          ; 5B1F   0203 0008

        INCR    R3                              ; 5B21   000B
        MVI@    R3,     R0                      ; 5B22   0298
        DECR    R0                              ; 5B23   0010
        BMI     L_5B8F                          ; 5B24   020B 0069

        MVO@    R0,     R3                      ; 5B26   0258
        B       L_5B8F                          ; 5B27   0200 0066

L_5B29:
        MVO@    R0,     R3                      ; 5B29   0258
        INCR    R3                              ; 5B2A   000B
        TSTR    R0                              ; 5B2B   0080
        BNEQ    L_5B8F                          ; 5B2C   020C 0061

        MVI@    R3,     R2                      ; 5B2E   029A
        MVII    #$0009, R0                      ; 5B2F   02B8 0009
        MVO@    R0,     R3                      ; 5B31   0258
        MOVR    R4,     R0                      ; 5B32   00A0
        INCR    R3                              ; 5B33   000B
        MVI@    R3,     R1                      ; 5B34   0299
        DECR    R3                              ; 5B35   0013
        TSTR    R1                              ; 5B36   0089
        BNEQ    L_5B46                          ; 5B37   020C 000D

        JSR     R5,     .EXEC.76C               ; 5B39   0004 0114 036C
        JSR     R5,     L_58E1                  ; 5B3C   0004 0158 00E1
        DECLE   $0003                           ; 5B3F   0003

        JSR     R5,     L_5B0C                  ; 5B40   0004 0158 030C
        BIDECLE $64EB                           ; 5B43   00EB 0064
        DECLE   $0000                           ; 5B45   0000
L_5B46:
        MVI     G_019D, R5                      ; 5B46   0285 019D
        ANDI    #$0010, R5                      ; 5B48   03BD 0010
        BNEQ    L_5B8F                          ; 5B4A   020C 0043

        CMP     G_01A3, R4                      ; 5B4C   0344 01A3
        BNEQ    L_5B9B                          ; 5B4E   020C 004B

        JSR     R5,     X_POW2                  ; 5B50   0004 0114 0345

        MVO     R0,     G_019F                  ; 5B53   0240 019F
        MVII    #$000A, R0                      ; 5B55   02B8 000A
        MVO     R0,     G_019E                  ; 5B57   0240 019E
        MVII    #$001E, R0                      ; 5B59   02B8 001E
        SARC    R2,     2                       ; 5B5B   007E
        BNOV    L_5B60                          ; 5B5C   020A 0002

        MVII    #$0028, R0                      ; 5B5E   02B8 0028
L_5B60:
        MOVR    R2,     R1                      ; 5B60   0091

        JSR     R5,     .EXEC.629               ; 5B61   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 5B64   0004 0114 0357

        SAR     R1,     1                       ; 5B67   0069
        PSHR    R2                              ; 5B68   0272
        PSHR    R3                              ; 5B69   0273
        PSHR    R0                              ; 5B6A   0270
        PSHR    R1                              ; 5B6B   0271
        MVI     G_01A3, R0                      ; 5B6C   0280 01A3

        JSR     R5,     .EXEC.76C               ; 5B6E   0004 0114 036C

        ADDI    #$0004, R1                      ; 5B71   02F9 0004
        MVI@    R1,     R0                      ; 5B73   0288

        JSR     R5,     X_UNPK_BYTES            ; 5B74   0004 0114 0357

        SAR     R0,     1                       ; 5B77   0068
        SAR     R1,     1                       ; 5B78   0069
        PULR    R3                              ; 5B79   02B3
        PULR    R2                              ; 5B7A   02B2
        ADDR    R2,     R0                      ; 5B7B   00D0
        ADDR    R3,     R1                      ; 5B7C   00D9
        PULR    R3                              ; 5B7D   02B3
        PULR    R2                              ; 5B7E   02B2

        JSR     R5,     X_PACK_BYTES            ; 5B7F   0004 0114 034F

        MVO     R0,     G_0359                  ; 5B82   0240 0359
        MVII    #$0007, R0                      ; 5B84   02B8 0007
        MVO     R0,     G_01A3                  ; 5B86   0240 01A3
        PSHR    R4                              ; 5B88   0274
        PSHR    R3                              ; 5B89   0273

        JSR     R5,     L_6643                  ; 5B8A   0004 0164 0243

        PULR    R3                              ; 5B8D   02B3
        PULR    R4                              ; 5B8E   02B4
L_5B8F:
        ADDI    #$0002, R3                      ; 5B8F   02FB 0002
        CLRR    R5                              ; 5B91   01ED
        MVO@    R5,     R3                      ; 5B92   025D
        ADDI    #$0005, R3                      ; 5B93   02FB 0005
        INCR    R4                              ; 5B95   000C
        CMPI    #$0006, R4                      ; 5B96   037C 0006
        BLT     L_5B1D                          ; 5B98   0225 007C
        PULR    R7                              ; 5B9A   02B7

L_5B9B:
        CMPI    #$0001, R4                      ; 5B9B   037C 0001
        BGT     L_5B8F                          ; 5B9D   022E 000F

        MOVR    R4,     R1                      ; 5B9F   00A1
        ADDI    #$01B7, R1                      ; 5BA0   02F9 01B7
        MVI@    R1,     R0                      ; 5BA2   0288
        TSTR    R0                              ; 5BA3   0080
        BNEQ    L_5B8F                          ; 5BA4   022C 0016

        ADDI    #$0002, R3                      ; 5BA6   02FB 0002
        MVI@    R3,     R2                      ; 5BA8   029A
        SUBI    #$0002, R3                      ; 5BA9   033B 0002
        CLRR    R0                              ; 5BAB   01C0
L_5BAC:
        SARC    R2,     1                       ; 5BAC   007A
        BC      L_5BB4                          ; 5BAD   0201 0005
        BEQ     L_5B8F                          ; 5BAF   0224 0021

        INCR    R0                              ; 5BB1   0008
        B       L_5BAC                          ; 5BB2   0220 0007

L_5BB4:
        PSHR    R3                              ; 5BB4   0273
        PSHR    R4                              ; 5BB5   0274
        CMP     G_01A3, R0                      ; 5BB6   0340 01A3
        BEQ     L_5BDC                          ; 5BB8   0204 0022

        MOVR    R0,     R1                      ; 5BBA   0081
        SLL     R1,     2                       ; 5BBB   004D
        SLL     R1,     1                       ; 5BBC   0049
        ADDI    #$015F, R1                      ; 5BBD   02F9 015F
        MVI@    R1,     R5                      ; 5BBF   028D
        DECR    R5                              ; 5BC0   0015
        BNEQ    L_5BCC                          ; 5BC1   020C 0009

        JSR     R5,     L_5BEA                  ; 5BC3   0004 0158 03EA

        MVII    #$0007, R0                      ; 5BC6   02B8 0007
        MVO     R0,     G_01A3                  ; 5BC8   0240 01A3
        B       L_5BDF                          ; 5BCA   0200 0013

L_5BCC:
        JSR     R5,     L_5BEA                  ; 5BCC   0004 0158 03EA
        JSR     R5,     L_58E7                  ; 5BCF   0004 0158 00E7
        DECLE   $0028,  $0209,  $000E,  $02B4   ; 5BD2   0028 0209 000E 02B4
        DECLE   $0274,  $000C,  $0244,  $01B6   ; 5BD6   0274 000C 0244 01B6
        DECLE   $0200,  $0007                   ; 5BDA   0200 0007
L_5BDC:
        MVO     R4,     G_01A3                  ; 5BDC   0244 01A3
        INCR    R7                              ; 5BDE   000F

L_5BDF:
        MOVR    R4,     R0                      ; 5BDF   00A0

L_5BE0:
        JSR     R5,     L_5BEA                  ; 5BE0   0004 0158 03EA
        DECLE   $0004,  $0164,  $0262           ; 5BE3   0004 0164 0262

        PULR    R3                              ; 5BE6   02B3
        PULR    R4                              ; 5BE7   02B4
        B       L_5B8F                          ; 5BE8   0220 005A

L_5BEA:
        PSHR    R5                              ; 5BEA   0275
        MOVR    R0,     R1                      ; 5BEB   0081
        SLL     R1,     2                       ; 5BEC   004D
        SLL     R1,     1                       ; 5BED   0049
        ADDI    #$015F, R1                      ; 5BEE   02F9 015F
        CLRR    R5                              ; 5BF0   01ED
        MVO@    R5,     R1                      ; 5BF1   024D
        ADDI    #$0002, R1                      ; 5BF2   02F9 0002
        MVII    #$0008, R5                      ; 5BF4   02BD 0008
        MVO@    R5,     R1                      ; 5BF6   024D
        SUBI    #$0161, R1                      ; 5BF7   0339 0161
        ADDI    #$031D, R1                      ; 5BF9   02F9 031D

        JSR     R5,     L_58DB                  ; 5BFB   0004 0158 00DB
        DECLE   $0003                           ; 5BFE   0003

        JSR     R5,     L_5B0C                  ; 5BFF   0004 0158 030C
        BIDECLE $64EB                           ; 5C02   00EB 0064
        DECLE   $02FA                           ; 5C04   02FA

        PULR    R7                              ; 5C05   02B7

L_5C06:
        MVII    #$0028, R1                      ; 5C06   02B9 0028
        CLRR    R3                              ; 5C08   01DB
        TSTR    R0                              ; 5C09   0080
        BEQ     L_5C0F                          ; 5C0A   0204 0003

        MVII    #$0080, R1                      ; 5C0C   02B9 0080
        COMR    R3                              ; 5C0E   001B
L_5C0F:
        MVO     R3,     G_01AE                  ; 5C0F   0243 01AE
        SWAP    R1,     1                       ; 5C11   0041
        ADDI    #$0029, R1                      ; 5C12   02F9 0029

        JSR     R5,     L_6470                  ; 5C14   0004 0164 0070

        ADCR    R7                              ; 5C17   002F

        SLLC    R0,     2                       ; 5C18   005C
L_5C19:
        CLRR    R0                              ; 5C19   01C0
        MVO     R0,     G_0351                  ; 5C1A   0240 0351
        MVO     R0,     G_0359                  ; 5C1C   0240 0359
L_5C1E:
        CLRR    R1                              ; 5C1E   01C9

        JSR     R5,     L_5877                  ; 5C1F   0004 0158 0077

        INCR    R0                              ; 5C22   0008
        CMPI    #$0006, R0                      ; 5C23   0378 0006
        BLT     L_5C1E                          ; 5C25   0225 0008

        MVII    #$0001, R0                      ; 5C27   02B8 0001
        MVO     R0,     G_01BA                  ; 5C29   0240 01BA

        JSR     R5,     L_5187                  ; 5C2B   0004 0150 0187

        PULR    R7                              ; 5C2E   02B7

        PSHR    R5                              ; 5C2F   0275
        ADDI    #$0003, R1                      ; 5C30   02F9 0003
        MVII    #$000F, R0                      ; 5C32   02B8 000F
        MVO@    R0,     R1                      ; 5C34   0248

        JSR     R5,     .EXEC.766               ; 5C35   0004 0114 0366

        MOVR    R0,     R3                      ; 5C38   0083
        ADDI    #$01B7, R3                      ; 5C39   02FB 01B7
        MVII    #$0081, R5                      ; 5C3B   02BD 0081
        MVO@    R5,     R3                      ; 5C3D   025D

        JSR     R5,     .EXEC.76C               ; 5C3E   0004 0114 036C
        JSR     R5,     L_58DB                  ; 5C41   0004 0158 00DB
        DECLE   $0003                           ; 5C44   0003

        JSR     R5,     L_58E1                  ; 5C45   0004 0158 00E1
        DECLE   $000B                           ; 5C48   000B

        ADDI    #$0002, R0                      ; 5C49   02F8 0002

        JSR     R5,     L_5CD2                  ; 5C4B   0004 015C 00D2

        MVII    #$0007, R0                      ; 5C4E   02B8 0007
        MVO     R0,     G_01A3                  ; 5C50   0240 01A3
        MVII    #$0008, R0                      ; 5C52   02B8 0008
        MVO     R0,     G_019D                  ; 5C54   0240 019D

        JSR     R5,     L_517E                  ; 5C56   0004 0150 017E
        JSR     R5,     L_636A                  ; 5C59   0004 0160 036A

        PULR    R7                              ; 5C5C   02B7

        PSHR    R5                              ; 5C5D   0275
        XORR    R3,     R0                      ; 5C5E   01D8
        SARC    R0,     1                       ; 5C5F   0078
        BNC     L_5A83                          ; 5C60   0229 01DE

        SDBD                                    ; 5C62   0001
        MVII    #$0504, R4                      ; 5C63   02BC 0004 0005

        JSR     R5,     .EXEC.70F               ; 5C66   0004 0114 030F

        BNC     L_5A83                          ; 5C69   0229 01E7

        SUBI    #$031D, R1                      ; 5C6B   0339 031D
        ADDI    #$0162, R1                      ; 5C6D   02F9 0162
        MOVR    R3,     R0                      ; 5C6F   0098
        SLL     R3,     2                       ; 5C70   004F
        SLL     R3,     1                       ; 5C71   004B
        ADDI    #$0161, R3                      ; 5C72   02FB 0161
        MVI@    R3,     R5                      ; 5C74   029D
        TSTR    R5                              ; 5C75   00AD
        BNEQ    L_5A83                          ; 5C76   022C 01F4

        JSR     R5,     X_POW2                  ; 5C78   0004 0114 0345

        XOR@    R1,     R0                      ; 5C7B   03C8
        MVO@    R0,     R1                      ; 5C7C   0248
        PULR    R7                              ; 5C7D   02B7

L_5C7E:
        PSHR    R5                              ; 5C7E   0275
        MVII    #$0161, R3                      ; 5C7F   02BB 0161
        MVII    #$031D, R1                      ; 5C81   02B9 031D
L_5C83:
        MVI@    R3,     R0                      ; 5C83   0298
        CMPI    #$00FF, R0                      ; 5C84   0378 00FF
        BNEQ    L_5CAD                          ; 5C86   020C 0025

        MVI     G_019D, R5                      ; 5C88   0285 019D
        ANDI    #$0008, R5                      ; 5C8A   03BD 0008
        BNEQ    L_5C94                          ; 5C8C   020C 0006

        JSR     R5,     L_58E7                  ; 5C8E   0004 0158 00E7
        DECLE   $0001                           ; 5C91   0001

        BC      L_5CCA                          ; 5C92   0201 0036

L_5C94:
        JSR     R5,     L_58E1                  ; 5C94   0004 0158 00E1
        DECLE   $0003                           ; 5C97   0003

        MOVR    R1,     R4                      ; 5C98   008C
        ADDI    #$0005, R4                      ; 5C99   02FC 0005
        CLRR    R5                              ; 5C9B   01ED
        MVO@    R5,     R4                      ; 5C9C   0265
        MVO@    R5,     R3                      ; 5C9D   025D
L_5C9E:
        ADDI    #$0008, R3                      ; 5C9E   02FB 0008
        ADDI    #$0008, R1                      ; 5CA0   02F9 0008
        CMPI    #$034D, R1                      ; 5CA2   0379 034D
        BLT     L_5C83                          ; 5CA4   0225 0022

        MVII    #$0003, R0                      ; 5CA6   02B8 0003

        JSR     R5,     X_SET_BIT               ; 5CA8   0004 0114 02DB

        ANDR    R3,     R5                      ; 5CAB   019D
        PULR    R7                              ; 5CAC   02B7

L_5CAD:
        DECR    R0                              ; 5CAD   0010
        BMI     L_5C9E                          ; 5CAE   022B 0011

        MVO@    R0,     R3                      ; 5CB0   0258
        BNEQ    L_5CCA                          ; 5CB1   020C 0017

        DECR    R0                              ; 5CB3   0010
        MVO@    R0,     R3                      ; 5CB4   0258
        PSHR    R3                              ; 5CB5   0273
        PSHR    R1                              ; 5CB6   0271
        MVI     G_01BA, R0                      ; 5CB7   0280 01BA
        TSTR    R0                              ; 5CB9   0080
        BEQ     L_5CC2                          ; 5CBA   0204 0006

        JSR     R5,     X_PLAY_WHST1            ; 5CBC   0004 011C 031B

        CLRR    R0                              ; 5CBF   01C0
        MVO     R0,     G_01BA                  ; 5CC0   0240 01BA
L_5CC2:
        PULR    R1                              ; 5CC2   02B1
        PULR    R3                              ; 5CC3   02B3
        MOVR    R1,     R4                      ; 5CC4   008C
        ADDI    #$0005, R4                      ; 5CC5   02FC 0005
        MVII    #$000E, R5                      ; 5CC7   02BD 000E
        MVO@    R5,     R4                      ; 5CC9   0265
L_5CCA:
        MOVR    R3,     R5                      ; 5CCA   009D
        SUBI    #$0004, R5                      ; 5CCB   033D 0004
        CLRR    R0                              ; 5CCD   01C0
        MVO@    R0,     R5                      ; 5CCE   0268
        MVO@    R0,     R5                      ; 5CCF   0268
        B       L_5C9E                          ; 5CD0   0220 0033

L_5CD2:
        CMPI    #$0006, R0                      ; 5CD2   0378 0006
        BGE     L_5B18                          ; 5CD4   022D 01BD

        MOVR    R0,     R1                      ; 5CD6   0081
        SLR     R1,     1                       ; 5CD7   0061
        BEQ     L_5B18                          ; 5CD8   0224 01C1

        PSHR    R5                              ; 5CDA   0275

        JSR     R5,     .EXEC.76C               ; 5CDB   0004 0114 036C

        ANDI    #$0001, R0                      ; 5CDE   03B8 0001
        MVO     R0,     G_01A3                  ; 5CE0   0240 01A3
L_5CE2:
        MOVR    R1,     R2                      ; 5CE2   008A

        JSR     R5,     .EXEC.76C               ; 5CE3   0004 0114 036C
        JSR     R5,     L_58F9                  ; 5CE6   0004 0158 00F9

        SDBD                                    ; 5CE9   0001
        MVII    #$01C8, R5                      ; 5CEA   02BD 00C8 0001
        SUBR    R5,     R1                      ; 5CED   0129
        SUBR    R5,     R2                      ; 5CEE   012A

        JSR     R5,     L_58F9                  ; 5CEF   0004 0158 00F9

        MVII    #$0006, R3                      ; 5CF2   02BB 0006

        JSR     R5,     L_54AF                  ; 5CF4   0004 0154 00AF

        PULR    R7                              ; 5CF7   02B7

L_5CF8:
        MVII    #$01BB, R2                      ; 5CF8   02BA 01BB
        ADDR    R1,     R2                      ; 5CFA   00CA
        MVI@    R2,     R0                      ; 5CFB   0290
        XORI    #$0002, R0                      ; 5CFC   03F8 0002
        MVO@    R0,     R2                      ; 5CFE   0250
        MOVR    R0,     R3                      ; 5CFF   0083
        ADDI    #$0002, R0                      ; 5D00   02F8 0002
        ADDR    R1,     R0                      ; 5D02   00C8

        JSR     R5,     .EXEC.76C               ; 5D03   0004 0114 036C

        ANDI    #$0001, R0                      ; 5D06   03B8 0001
        MOVR    R1,     R5                      ; 5D08   008D
        ADDI    #$0005, R5                      ; 5D09   02FD 0005
        MVI@    R5,     R5                      ; 5D0B   02AD
        MVII    #$000F, R4                      ; 5D0C   02BC 000F
        CMPR    R4,     R5                      ; 5D0E   0165
        BNEQ    L_5CE2                          ; 5D0F   022C 002E

        MOVR    R0,     R1                      ; 5D11   0081
        B       L_5CF8                          ; 5D12   0220 001B

L_5D14:
        PSHR    R5                              ; 5D14   0275
        MVII    #$0290, R5                      ; 5D15   02BD 0290
        ANDI    #$0001, R3                      ; 5D17   03BB 0001
        BEQ     L_5D56                          ; 5D19   0204 003B

        MVII    #$029B, R5                      ; 5D1B   02BD 029B
        PULR    R7                              ; 5D1D   02B7

L_5D1E:
        PSHR    R5                              ; 5D1E   0275
        SDBD                                    ; 5D1F   0001
        MVII    #$08F9, R0                      ; 5D20   02B8 00F9 0008

        JSR     R5,     L_5D14                  ; 5D23   0004 015C 0114

        BNEQ    L_5D32                          ; 5D26   020C 000A

        SDBD                                    ; 5D28   0001
        XORI    #$0001, R0                      ; 5D29   03F8 0001 0000
        SDBD                                    ; 5D2C   0001
        XORI    #$1002, R0                      ; 5D2D   03F8 0002 0010
        ADDI    #$0008, R0                      ; 5D30   02F8 0008
L_5D32:
        MVO@    R0,     R5                      ; 5D32   0268
        PULR    R7                              ; 5D33   02B7

L_5D34:
        MVII    #$034D, R2                      ; 5D34   02BA 034D
L_5D36:
        PSHR    R5                              ; 5D36   0275
        MOVR    R7,     R1                      ; 5D37   00B9
        ADDI    #$0052, R1                      ; 5D38   02F9 0052

        JSR     R5,     X_INIT_MOB              ; 5D3A   0004 0114 02B2
        JSR     R5,     L_5D14                  ; 5D3D   0004 015C 0114

        CLRR    R0                              ; 5D40   01C0
        MVO@    R0,     R5                      ; 5D41   0268
        MVI     G_01A2, R5                      ; 5D42   0285 01A2
        ANDI    #$00FE, R5                      ; 5D44   03BD 00FE
        XORR    R3,     R5                      ; 5D46   01DD
        MVO     R5,     G_01A2                  ; 5D47   0245 01A2
        TSTR    R3                              ; 5D49   009B
        BEQ     L_5D56                          ; 5D4A   0204 000A

        MVI@    R2,     R0                      ; 5D4C   0290
        XORI    #$0202, R0                      ; 5D4D   03F8 0202
        MVO@    R0,     R2                      ; 5D4F   0250
        ADDI    #$0002, R2                      ; 5D50   02FA 0002
        MVII    #$007F, R0                      ; 5D52   02B8 007F
        SWAP    R0,     1                       ; 5D54   0040
        MVO@    R0,     R2                      ; 5D55   0250
L_5D56:
        PULR    R7                              ; 5D56   02B7

L_5D57:
        PSHR    R5                              ; 5D57   0275
        MVI     G_01A2, R3                      ; 5D58   0283 01A2
        MOVR    R3,     R5                      ; 5D5A   009D
        ANDI    #$0002, R5                      ; 5D5B   03BD 0002
        BEQ     L_5D6B                          ; 5D5D   0204 000C

        MVII    #$03F0, R5                      ; 5D5F   02BD 03F0
        COMR    R5                              ; 5D61   001D
        AND     G_0352, R5                      ; 5D62   0385 0352
        XORI    #$03D0, R5                      ; 5D64   03FD 03D0
        MVO     R5,     G_0352                  ; 5D66   0245 0352
        CLRR    R5                              ; 5D68   01ED
        MVO     R5,     G_0353                  ; 5D69   0245 0353
L_5D6B:
        ANDI    #$0001, R3                      ; 5D6B   03BB 0001
        BEQ     L_5D82                          ; 5D6D   0204 0013

        MVII    #$034D, R4                      ; 5D6F   02BC 034D
        MVII    #$0355, R1                      ; 5D71   02B9 0355
        MVII    #$0008, R0                      ; 5D73   02B8 0008

        JSR     R5,     .EXEC.730               ; 5D75   0004 0114 0330

        CLRR    R3                              ; 5D78   01DB

        JSR     R5,     L_5D34                  ; 5D79   0004 015C 0134

L_5D7C:
        MVII    #$0006, R0                      ; 5D7C   02B8 0006

        JSR     R5,     .EXEC.41C               ; 5D7E   0004 0114 001C

        PULR    R7                              ; 5D81   02B7

L_5D82:
        INCR    R3                              ; 5D82   000B
        MVII    #$0355, R2                      ; 5D83   02BA 0355

        JSR     R5,     L_5D36                  ; 5D85   0004 015C 0136

        B       L_5D7C                          ; 5D88   0220 000D

        DECLE   $004B,  $005A,  $00F4,  $0064   ; 5D8A   004B 005A 00F4 0064
        DECLE   $0000,  $0029,  $0000,  $0041   ; 5D8E   0000 0029 0000 0041
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D92   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5D96   0000 0000

        PSHR    R5                              ; 5D98   0275
        MVI     G_019D, R5                      ; 5D99   0285 019D
        ANDI    #$0004, R5                      ; 5D9B   03BD 0004
        BNEQ    L_5D56                          ; 5D9D   022C 0048

        MVI     G_01A2, R5                      ; 5D9F   0285 01A2
        MOVR    R5,     R4                      ; 5DA1   00AC
        ANDI    #$0018, R5                      ; 5DA2   03BD 0018
        BNEQ    L_5D56                          ; 5DA4   022C 004F

        CLRR    R0                              ; 5DA6   01C0
        MVI     G_034F, R5                      ; 5DA7   0285 034F
        CMPI    #$0050, R5                      ; 5DA9   037D 0050
        BLT     L_5DAE                          ; 5DAB   0205 0001

        INCR    R0                              ; 5DAD   0008
L_5DAE:
        MVO     R0,     G_01C2                  ; 5DAE   0240 01C2
        ANDI    #$0002, R4                      ; 5DB0   03BC 0002
        BEQ     L_5DC1                          ; 5DB2   0204 000D

        JSR     R5,     L_686E                  ; 5DB4   0004 0168 006E
        DECLE   $0037,  $003F                   ; 5DB7   0037 003F

        SLL     R1,     1                       ; 5DB9   0049
        RLC     R1,     2                       ; 5DBA   0055
        MOVR    R5,     R0                      ; 5DBB   00A8

        JSR     R5,     L_58EF                  ; 5DBC   0004 0158 00EF

        BC      L_5D56                          ; 5DBF   0221 006A

L_5DC1:
        SDBD                                    ; 5DC1   0001
        MVII    #$0804, R4                      ; 5DC2   02BC 0004 0008

        JSR     R5,     .EXEC.70F               ; 5DC5   0004 0114 030F

        BNC     L_5D56                          ; 5DC8   0229 0073

        MVI     G_0359, R0                      ; 5DCA   0280 0359

        JSR     R5,     X_UNPK_BYTES            ; 5DCC   0004 0114 0357
        JSR     R5,     L_6099                  ; 5DCF   0004 0160 0099
        JSR     R5,     X_RAND2                 ; 5DD2   0004 0114 029E

        CMPI    #$0023, R0                      ; 5DD5   0378 0023
        BMI     L_5E2F                          ; 5DD7   020B 0056

        JSR     R5,     L_6643                  ; 5DD9   0004 0164 0243
        JSR     R5,     L_686E                  ; 5DDC   0004 0168 006E

        ADDR    R2,     R2                      ; 5DDF   00D2
        ADDR    R1,     R3                      ; 5DE0   00CB
        ADDR    R0,     R6                      ; 5DE1   00C6
        ADDR    R0,     R0                      ; 5DE2   00C0
        MOVR    R5,     R0                      ; 5DE3   00A8

        JSR     R5,     L_58EF                  ; 5DE4   0004 0158 00EF

        BC      L_5DFE                          ; 5DE7   0201 0015

        MVI     G_01A2, R0                      ; 5DE9   0280 01A2
        MOVR    R0,     R1                      ; 5DEB   0081
        ANDI    #$0002, R0                      ; 5DEC   03B8 0002
        BNEQ    L_5DFE                          ; 5DEE   020C 000E

        XORI    #$0002, R1                      ; 5DF0   03F9 0002
        MVO     R1,     G_01A2                  ; 5DF2   0241 01A2
        MVO     R0,     G_01B5                  ; 5DF4   0240 01B5
        MVII    #$0008, R0                      ; 5DF6   02B8 0008
        MVO     R0,     G_0353                  ; 5DF8   0240 0353
        MVII    #$02F9, R0                      ; 5DFA   02B8 02F9
        MVO     R0,     G_0352                  ; 5DFC   0240 0352

L_5DFE:
        JSR     R5,     L_686E                  ; 5DFE   0004 0168 006E

        COMR    R1                              ; 5E01   0019
        NEGR    R0                              ; 5E02   0020
        ADCR    R0                              ; 5E03   0028
        ADCR    R5                              ; 5E04   002D
        MOVR    R5,     R2                      ; 5E05   00AA
L_5E06:
        MVII    #$0004, R0                      ; 5E06   02B8 0004

        JSR     R5,     X_CLR_BIT               ; 5E08   0004 0114 02E6

        ANDR    R4,     R2                      ; 5E0B   01A2
        MOVR    R2,     R0                      ; 5E0C   0090

        JSR     R5,     X_RAND2                 ; 5E0D   0004 0114 029E

        MOVR    R0,     R1                      ; 5E10   0081
        MOVR    R2,     R0                      ; 5E11   0090

        JSR     R5,     X_RAND2                 ; 5E12   0004 0114 029E

        SUBR    R0,     R1                      ; 5E15   0101
        MOVR    R1,     R2                      ; 5E16   008A
        BPL     L_5E1E                          ; 5E17   0203 0005

        NEGR    R2                              ; 5E19   0022
        CMPR    R0,     R2                      ; 5E1A   0142
        BLE     L_5E1E                          ; 5E1B   0206 0001

        MOVR    R2,     R0                      ; 5E1D   0090
L_5E1E:
        MVI     G_01A1, R5                      ; 5E1E   0285 01A1
        ANDI    #$0001, R5                      ; 5E20   03BD 0001
        BEQ     L_5E25                          ; 5E22   0204 0001

        NEGR    R0                              ; 5E24   0020

L_5E25:
        JSR     R5,     X_PACK_BYTES            ; 5E25   0004 0114 034F

L_5E28:
        MVII    #$0007, R2                      ; 5E28   02BA 0007
        MVO     R2,     G_01A3                  ; 5E2A   0242 01A3
        MVO     R0,     G_0359                  ; 5E2C   0240 0359
        PULR    R7                              ; 5E2E   02B7

L_5E2F:
        JSR     R5,     L_5FA3                  ; 5E2F   0004 015C 03A3

        BEQ     L_5E43                          ; 5E32   0204 000F
        BNC     L_5D56                          ; 5E34   0229 00DF

        JSR     R5,     L_686E                  ; 5E36   0004 0168 006E

        SLLC    R3,     2                       ; 5E39   005F
        SAR     R0,     2                       ; 5E3A   006C
        RRC     R2,     2                       ; 5E3B   0076
        TSTR    R0                              ; 5E3C   0080
        MOVR    R5,     R0                      ; 5E3D   00A8

        JSR     R5,     L_58EF                  ; 5E3E   0004 0158 00EF

        BC      L_5D56                          ; 5E41   0221 00EC

L_5E43:
        MVI     G_01A2, R0                      ; 5E43   0280 01A2
        ANDI    #$00F5, R0                      ; 5E45   03B8 00F5
        XORI    #$0008, R0                      ; 5E47   03F8 0008
        MVO     R0,     G_01A2                  ; 5E49   0240 01A2
        CLRR    R0                              ; 5E4B   01C0
        MVO     R0,     G_0353                  ; 5E4C   0240 0353
        MVII    #$0006, R0                      ; 5E4E   02B8 0006
        MVO     R0,     G_01A3                  ; 5E50   0240 01A3
        MVII    #$000A, R0                      ; 5E52   02B8 000A
        MVO     R0,     G_01B1                  ; 5E54   0240 01B1
        PULR    R7                              ; 5E56   02B7

L_5E57:
        PSHR    R5                              ; 5E57   0275
        MVI     G_019D, R5                      ; 5E58   0285 019D
        MOVR    R5,     R4                      ; 5E5A   00AC
        ANDI    #$0004, R5                      ; 5E5B   03BD 0004
        BNEQ    L_5D56                          ; 5E5D   022C 0108

        MVI     G_01A2, R5                      ; 5E5F   0285 01A2
        MOVR    R5,     R3                      ; 5E61   00AB
        ANDI    #$0008, R5                      ; 5E62   03BD 0008
        BNEQ    L_5F65                          ; 5E64   020C 00FF

        MOVR    R3,     R5                      ; 5E66   009D
        ANDI    #$0002, R5                      ; 5E67   03BD 0002
        BNEQ    L_5EF2                          ; 5E69   020C 0087

        MOVR    R3,     R2                      ; 5E6B   009A
        XOR     G_01A1, R2                      ; 5E6C   03C2 01A1
        SARC    R2,     1                       ; 5E6E   007A
        BNC     L_5E8C                          ; 5E6F   0209 001B

        JSR     R5,     L_5F6D                  ; 5E71   0004 015C 036D

        BNEQ    L_5D56                          ; 5E74   022C 011F

        MVI     G_01A1, R0                      ; 5E76   0280 01A1
        ANDI    #$0008, R0                      ; 5E78   03B8 0008
        BNEQ    L_5D56                          ; 5E7A   022C 0125

        MVI     G_01A2, R3                      ; 5E7C   0283 01A2
        ANDI    #$00EF, R3                      ; 5E7E   03BB 00EF
        XORI    #$0001, R3                      ; 5E80   03FB 0001
        MVO     R3,     G_01A2                  ; 5E82   0243 01A2
        INCR    R3                              ; 5E84   000B

        JSR     R5,     L_5D1E                  ; 5E85   0004 015C 011E

        INCR    R3                              ; 5E88   000B

        JSR     R5,     L_5D34                  ; 5E89   0004 015C 0134

L_5E8C:
        MVI     G_01A2, R5                      ; 5E8C   0285 01A2
        ANDI    #$0004, R5                      ; 5E8E   03BD 0004
        BNEQ    L_5EC4                          ; 5E90   020C 0032

        MVI     G_01A1, R0                      ; 5E92   0280 01A1
        ANDI    #$0010, R0                      ; 5E94   03B8 0010
        BNEQ    L_5F6E                          ; 5E96   020C 00D6

        MVI     G_01AA, R0                      ; 5E98   0280 01AA
        INCR    R0                              ; 5E9A   0008

        JSR     R5,     X_CLAMP                 ; 5E9B   0004 0114 0270

        RSWD    R2                              ; 5E9E   003A
        SLL     R0,     1                       ; 5E9F   0048
        MOVR    R0,     R1                      ; 5EA0   0081
        NEGR    R0                              ; 5EA1   0020
        ADDI    #$0067, R0                      ; 5EA2   02F8 0067

        JSR     R5,     L_5F73                  ; 5EA4   0004 015C 0373

        BNEQ    L_5D56                          ; 5EA7   022C 0152

        JSR     R5,     L_5FA3                  ; 5EA9   0004 015C 03A3

        BEQ     L_5EB0                          ; 5EAC   0204 0002
        BNC     L_5D56                          ; 5EAE   0229 0159

L_5EB0:
        JSR     R5,     L_686E                  ; 5EB0   0004 0168 006E
        DECLE   $0003,  $0005                   ; 5EB3   0003 0005

        SETC                                    ; 5EB5   0007
        INCR    R0                              ; 5EB6   0008
        MOVR    R5,     R0                      ; 5EB7   00A8

        JSR     R5,     L_58EF                  ; 5EB8   0004 0158 00EF

        BC      L_5D56                          ; 5EBB   0221 0166

        MVII    #$0002, R0                      ; 5EBD   02B8 0002

        JSR     R5,     X_CLR_BIT               ; 5EBF   0004 0114 02E6

        ANDR    R4,     R2                      ; 5EC2   01A2
        PULR    R7                              ; 5EC3   02B7

L_5EC4:
        JSR     R5,     L_5FA3                  ; 5EC4   0004 015C 03A3

        BEQ     L_5ECB                          ; 5EC7   0204 0002
        BNC     L_5EDD                          ; 5EC9   0209 0012

L_5ECB:
        MVI     G_01A9, R0                      ; 5ECB   0280 01A9
        MVI     G_01AA, R1                      ; 5ECD   0281 01AA
        MVI     G_01A1, R2                      ; 5ECF   0282 01A1
        XORI    #$0004, R2                      ; 5ED1   03FA 0004
        ANDI    #$0026, R2                      ; 5ED3   03BA 0026
        BEQ     L_5EDD                          ; 5ED5   0204 0006

        INCR    R1                              ; 5ED7   0009

        JSR     R5,     L_5F73                  ; 5ED8   0004 015C 0373

        BNEQ    L_5EE4                          ; 5EDB   020C 0007

L_5EDD:
        MVII    #$0002, R0                      ; 5EDD   02B8 0002

        JSR     R5,     X_SET_BIT               ; 5EDF   0004 0114 02DB

        ANDR    R4,     R2                      ; 5EE2   01A2
        PULR    R7                              ; 5EE3   02B7

L_5EE4:
        JSR     R5,     L_686E                  ; 5EE4   0004 0168 006E

        RLC     R0,     1                       ; 5EE7   0050
        SWAP    R2,     2                       ; 5EE8   0046
        SWAP    R1,     1                       ; 5EE9   0041
        RSWD    R4                              ; 5EEA   003C
        MOVR    R5,     R0                      ; 5EEB   00A8

        JSR     R5,     L_58EF                  ; 5EEC   0004 0158 00EF

        BNC     L_5EDD                          ; 5EEF   0229 0013
        PULR    R7                              ; 5EF1   02B7

L_5EF2:
        ANDI    #$0008, R4                      ; 5EF2   03BC 0008
        BNEQ    L_5F1B                          ; 5EF4   020C 0025

        MVI     G_01A1, R5                      ; 5EF6   0285 01A1
        ANDI    #$0010, R5                      ; 5EF8   03BD 0010
        BNEQ    L_5F1B                          ; 5EFA   020C 001F

        MVI     G_0353, R5                      ; 5EFC   0285 0353
        TSTR    R5                              ; 5EFE   00AD
        BNEQ    L_5F61                          ; 5EFF   020C 0060

        JSR     R5,     L_686E                  ; 5F01   0004 0168 006E

        EIS                                     ; 5F04   0002
        DIS                                     ; 5F05   0003
        CLRC                                    ; 5F06   0006
        INCR    R0                              ; 5F07   0008
        MOVR    R5,     R0                      ; 5F08   00A8

        JSR     R5,     L_58EF                  ; 5F09   0004 0158 00EF

        BC      L_5F61                          ; 5F0C   0201 0053

L_5F0E:
        MVII    #$0006, R0                      ; 5F0E   02B8 0006
        MVO     R0,     G_0353                  ; 5F10   0240 0353
        MVII    #$0001, R0                      ; 5F12   02B8 0001
        MVO     R0,     G_01B5                  ; 5F14   0240 01B5
        CLRR    R0                              ; 5F16   01C0
        MVII    #$02FD, R1                      ; 5F17   02B9 02FD
        B       L_5F9E                          ; 5F19   0200 0083

L_5F1B:
        XORI    #$0002, R3                      ; 5F1B   03FB 0002
        MVO     R3,     G_01A2                  ; 5F1D   0243 01A2
        B       L_5F0E                          ; 5F1F   0220 0012

L_5F21:
        ANDI    #$00E7, R3                      ; 5F21   03BB 00E7
        XORI    #$0010, R3                      ; 5F23   03FB 0010
        MVO     R3,     G_01A2                  ; 5F25   0243 01A2
        MOVR    R3,     R4                      ; 5F27   009C
        ANDI    #$0001, R4                      ; 5F28   03BC 0001
        MOVR    R4,     R0                      ; 5F2A   00A0
        XORI    #$0002, R0                      ; 5F2B   03F8 0002

        JSR     R5,     .EXEC.772               ; 5F2D   0004 0114 0372

        CMPI    #$002A, R3                      ; 5F30   037B 002A
        BLT     L_5F46                          ; 5F32   0205 0012

        SWAP    R2,     1                       ; 5F34   0042
        XORR    R3,     R2                      ; 5F35   01DA
        MVII    #$001E, R3                      ; 5F36   02BB 001E
        MVII    #$0007, R0                      ; 5F38   02B8 0007

        JSR     R5,     .EXEC.9BB               ; 5F3A   0004 0118 01BB

        MVI     G_0359, R0                      ; 5F3D   0280 0359
        MVI     G_01A2, R3                      ; 5F3F   0283 01A2
        RRC     R3,     1                       ; 5F41   0073
        RRC     R3,     1                       ; 5F42   0073
        XORR    R0,     R3                      ; 5F43   01C3
        BPL     L_5E28                          ; 5F44   0223 011D

L_5F46:
        JSR     R5,     L_686E                  ; 5F46   0004 0168 006E

        GSWD    R2                              ; 5F49   0032
        RSWD    R4                              ; 5F4A   003C
        SWAP    R2,     2                       ; 5F4B   0046
        SLL     R3,     1                       ; 5F4C   004B
        MOVR    R5,     R2                      ; 5F4D   00AA
        B       L_5E06                          ; 5F4E   0220 0149

        PSHR    R5                              ; 5F50   0275
        MVI     G_01B5, R0                      ; 5F51   0280 01B5
        TSTR    R0                              ; 5F53   0080
        BEQ     L_5F5D                          ; 5F54   0204 0007

        MVI     G_01A2, R0                      ; 5F56   0280 01A2
        ANDI    #$00FD, R0                      ; 5F58   03B8 00FD
        MVO     R0,     G_01A2                  ; 5F5A   0240 01A2
        PULR    R7                              ; 5F5C   02B7

L_5F5D:
        MVII    #$000D, R0                      ; 5F5D   02B8 000D
        MVO     R0,     G_0352                  ; 5F5F   0240 0352
L_5F61:
        CLRR    R0                              ; 5F61   01C0
        MVO     R0,     G_0351                  ; 5F62   0240 0351
        PULR    R7                              ; 5F64   02B7

L_5F65:
        MVI     G_01B1, R0                      ; 5F65   0280 01B1
        DECR    R0                              ; 5F67   0010
        MVO     R0,     G_01B1                  ; 5F68   0240 01B1
        BEQ     L_5F21                          ; 5F6A   0224 004A
        INCR    R7                              ; 5F6C   000F

L_5F6D:
        PSHR    R5                              ; 5F6D   0275
L_5F6E:
        MVII    #$0029, R0                      ; 5F6E   02B8 0029
        MVII    #$0041, R1                      ; 5F70   02B9 0041
        INCR    R7                              ; 5F72   000F

L_5F73:
        PSHR    R5                              ; 5F73   0275
L_5F74:
        ANDI    #$0001, R3                      ; 5F74   03BB 0001
        BEQ     L_5F7B                          ; 5F76   0204 0003

        NEGR    R0                              ; 5F78   0020
        ADDI    #$00A8, R0                      ; 5F79   02F8 00A8
L_5F7B:
        PSHR    R3                              ; 5F7B   0273
        PSHR    R1                              ; 5F7C   0271
        MVII    #$034D, R1                      ; 5F7D   02B9 034D

        JSR     R5,     .EXEC.777               ; 5F7F   0004 0114 0377

        PULR    R1                              ; 5F82   02B1
        SUBR    R3,     R1                      ; 5F83   0119
        SUBR    R2,     R0                      ; 5F84   0110

        JSR     R5,     L_608F                  ; 5F85   0004 0160 008F

        PULR    R3                              ; 5F88   02B3
        CMPI    #$0002, R4                      ; 5F89   037C 0002
        BLT     L_5F9C                          ; 5F8B   0205 000F

        MOVR    R5,     R1                      ; 5F8D   00A9
        MVII    #$0014, R0                      ; 5F8E   02B8 0014

        JSR     R5,     .EXEC.629               ; 5F90   0004 0114 0229

        MVII    #$03F0, R1                      ; 5F93   02B9 03F0
        COMR    R1                              ; 5F95   0019
        AND     G_0352, R1                      ; 5F96   0381 0352
        XORI    #$02F0, R1                      ; 5F98   03F9 02F0
        B       L_5F9E                          ; 5F9A   0200 0002

L_5F9C:
        CLRR    R1                              ; 5F9C   01C9
        CLRR    R0                              ; 5F9D   01C0
L_5F9E:
        MVO     R0,     G_0351                  ; 5F9E   0240 0351
        MVO     R1,     G_0352                  ; 5FA0   0241 0352
        PULR    R7                              ; 5FA2   02B7

L_5FA3:
        PSHR    R5                              ; 5FA3   0275
        PSHR    R2                              ; 5FA4   0272
        MVI     G_01A3, R2                      ; 5FA5   0282 01A3
        MOVR    R2,     R5                      ; 5FA7   0095
        XOR     G_01A2, R2                      ; 5FA8   03C2 01A2
        SUBI    #$0007, R5                      ; 5FAA   033D 0007
        SARC    R2,     1                       ; 5FAC   007A
        TSTR    R5                              ; 5FAD   00AD
        PULR    R2                              ; 5FAE   02B2
        PULR    R7                              ; 5FAF   02B7

        PSHR    R5                              ; 5FB0   0275
L_5FB1:
        MVI     G_019D, R5                      ; 5FB1   0285 019D
        ANDI    #$0002, R5                      ; 5FB3   03BD 0002
        BNEQ    L_6077                          ; 5FB5   020C 00C0

        MVI     G_01B9, R0                      ; 5FB7   0280 01B9
        DECR    R0                              ; 5FB9   0010
        BPL     L_5FBE                          ; 5FBA   0203 0002

        MVII    #$0003, R0                      ; 5FBC   02B8 0003
L_5FBE:
        MVO     R0,     G_01B9                  ; 5FBE   0240 01B9
        ADDI    #$0002, R0                      ; 5FC0   02F8 0002
        MOVR    R0,     R3                      ; 5FC2   0083
        SLL     R3,     2                       ; 5FC3   004F
        SLL     R3,     1                       ; 5FC4   004B
        ADDI    #$0161, R3                      ; 5FC5   02FB 0161
        MVI@    R3,     R4                      ; 5FC7   029C
        TSTR    R4                              ; 5FC8   00A4
        BNEQ    L_6077                          ; 5FC9   020C 00AC

        JSR     R5,     .EXEC.772               ; 5FCB   0004 0114 0372

        MOVR    R1,     R5                      ; 5FCE   008D
        ADDI    #$0005, R5                      ; 5FCF   02FD 0005
        MVI@    R5,     R5                      ; 5FD1   02AD
        MVII    #$000F, R4                      ; 5FD2   02BC 000F
        CMPR    R4,     R5                      ; 5FD4   0165
        BEQ     L_6077                          ; 5FD5   0204 00A0

        MVI     G_01A3, R4                      ; 5FD7   0284 01A3
        SUBI    #$0007, R4                      ; 5FD9   033C 0007
        BEQ     L_5FE5                          ; 5FDB   0204 0008

        INCR    R4                              ; 5FDD   000C
        BEQ     L_5FE4                          ; 5FDE   0204 0004

        XORR    R0,     R4                      ; 5FE0   01C4
        ANDI    #$0001, R4                      ; 5FE1   03BC 0001
        INCR    R4                              ; 5FE3   000C
L_5FE4:
        INCR    R4                              ; 5FE4   000C
L_5FE5:
        PSHR    R0                              ; 5FE5   0270
        PSHR    R3                              ; 5FE6   0273
        CMPI    #$0054, R2                      ; 5FE7   037A 0054
        CLRR    R3                              ; 5FE9   01DB
        RLC     R3,     1                       ; 5FEA   0053
        MVO     R3,     G_01B0                  ; 5FEB   0243 01B0
        XORR    R3,     R0                      ; 5FED   01D8
        MVI     G_01A1, R3                      ; 5FEE   0283 01A1
        SLR     R3,     2                       ; 5FF0   0067
        SARC    R3,     2                       ; 5FF1   007F
        PULR    R3                              ; 5FF2   02B3
        SARC    R0,     1                       ; 5FF3   0078
        DECR    R0                              ; 5FF4   0010
        PULR    R0                              ; 5FF5   02B0
        BNEQ    L_600A                          ; 5FF6   020C 0012
        BOV     L_5FFC                          ; 5FF8   0202 0002
        BNC     L_600E                          ; 5FFA   0209 0012

L_5FFC:
        TSTR    R4                              ; 5FFC   00A4
        BNEQ    L_6002                          ; 5FFD   020C 0003

        JSR     R5,     L_603D                  ; 5FFF   0004 0160 003D

L_6002:
        MOVR    R0,     R4                      ; 6002   0084
        ANDI    #$0001, R4                      ; 6003   03BC 0001

        JSR     R5,     L_60AC                  ; 6005   0004 0160 00AC
        DECLE   $0019,  $0004                   ; 6008   0019 0004
L_600A:
        BOV     L_601A                          ; 600A   0202 000E
        BNC     L_601A                          ; 600C   0209 000C

L_600E:
        MVII    #$0032, R1                      ; 600E   02B9 0032
        SWAP    R1,     1                       ; 6010   0041
        CMPI    #$0054, R2                      ; 6011   037A 0054
        BLE     L_6016                          ; 6013   0206 0001

        NEGR    R1                              ; 6015   0021

L_6016:
        JSR     R5,     L_5877                  ; 6016   0004 0158 0077

        PULR    R7                              ; 6019   02B7

L_601A:
        INCR    R4                              ; 601A   000C
        ADDR    R7,     R4                      ; 601B   00FC
        ADD@    R4,     R7                      ; 601C   02E7

        DECLE   $0004                           ; 601D   0004

        SETC                                    ; 601E   0007
        INCR    R2                              ; 601F   000A
        DECR    R2                              ; 6020   0012

        JSR     R5,     L_603D                  ; 6021   0004 0160 003D

        CLRR    R1                              ; 6024   01C9
        B       L_6016                          ; 6025   0220 0010

L_6027:
        MOVR    R0,     R4                      ; 6027   0084
        ANDI    #$0001, R4                      ; 6028   03BC 0001

        JSR     R5,     L_60AC                  ; 602A   0004 0160 00AC
        DECLE   $003C,  $0005                   ; 602D   003C 0005

        MVI     G_01A1, R5                      ; 602F   0285 01A1
        XORR    R0,     R5                      ; 6031   01C5
        ANDI    #$0001, R5                      ; 6032   03BD 0001
        BNEQ    L_6027                          ; 6034   022C 000E

        MVII    #$0007, R4                      ; 6036   02BC 0007

        JSR     R5,     L_60AC                  ; 6038   0004 0160 00AC

        INCR    R5                              ; 603B   000D
        DIS                                     ; 603C   0003
L_603D:
        PSHR    R5                              ; 603D   0275
        MVII    #$0007, R4                      ; 603E   02BC 0007
        SUBI    #$0002, R3                      ; 6040   033B 0002

        JSR     R5,     L_6078                  ; 6042   0004 0160 0078

        ADDI    #$0002, R3                      ; 6045   02FB 0002
        CMPI    #$003C, R4                      ; 6047   037C 003C
        BGT     L_6077                          ; 6049   020E 002C

        DECR    R6                              ; 604B   0016
        PSHR    R0                              ; 604C   0270
        PSHR    R5                              ; 604D   0275
        MVI     G_0359, R0                      ; 604E   0280 0359

        JSR     R5,     X_UNPK_BYTES            ; 6050   0004 0114 0357
        JSR     R5,     L_608F                  ; 6053   0004 0160 008F

        PULR    R1                              ; 6056   02B1
        PULR    R0                              ; 6057   02B0
        CMPI    #$000A, R4                      ; 6058   037C 000A
        BLE     L_606F                          ; 605A   0206 0013

        SUBR    R5,     R1                      ; 605C   0129
        ANDI    #$000F, R1                      ; 605D   03B9 000F
        BEQ     L_606E                          ; 605F   0204 000D

        MVII    #$0004, R4                      ; 6061   02BC 0004
        CMPI    #$000C, R1                      ; 6063   0379 000C
        BLT     L_6068                          ; 6065   0205 0001

        ADDR    R4,     R5                      ; 6067   00E5
L_6068:
        CMPR    R4,     R1                      ; 6068   0161
        BGT     L_6072                          ; 6069   020E 0007

        SUBR    R4,     R5                      ; 606B   0125
        B       L_6072                          ; 606C   0200 0004

L_606E:
        MOVR    R5,     R1                      ; 606E   00A9
L_606F:
        ADDI    #$0008, R1                      ; 606F   02F9 0008
        INCR    R7                              ; 6071   000F

L_6072:
        MOVR    R5,     R1                      ; 6072   00A9

L_6073:
        JSR     R5,     L_5868                  ; 6073   0004 0158 0068
        DECLE   $0019                           ; 6076   0019
L_6077:
        PULR    R7                              ; 6077   02B7

L_6078:
        PSHR    R5                              ; 6078   0275
        PSHR    R0                              ; 6079   0270
        PSHR    R2                              ; 607A   0272
        PSHR    R3                              ; 607B   0273
        MOVR    R4,     R0                      ; 607C   00A0

        JSR     R5,     .EXEC.772               ; 607D   0004 0114 0372

        MOVR    R2,     R0                      ; 6080   0090
        MOVR    R3,     R1                      ; 6081   0099
        PULR    R3                              ; 6082   02B3
        PULR    R2                              ; 6083   02B2
        SUBR    R3,     R1                      ; 6084   0119
        SUBR    R2,     R0                      ; 6085   0110

        JSR     R5,     L_608F                  ; 6086   0004 0160 008F

        ADDI    #$0008, R5                      ; 6089   02FD 0008
        ANDI    #$000F, R5                      ; 608B   03BD 000F
        PULR    R0                              ; 608D   02B0
        PULR    R7                              ; 608E   02B7

L_608F:
        PSHR    R5                              ; 608F   0275
        PSHR    R0                              ; 6090   0270
        PSHR    R1                              ; 6091   0271

        JSR     R5,     .EXEC.A2F               ; 6092   0004 0118 022F

        MOVR    R1,     R5                      ; 6095   008D
        PULR    R1                              ; 6096   02B1
        PULR    R0                              ; 6097   02B0
        INCR    R7                              ; 6098   000F

L_6099:
        PSHR    R5                              ; 6099   0275
L_609A:
        TSTR    R0                              ; 609A   0080
        BPL     L_609E                          ; 609B   0203 0001

        NEGR    R0                              ; 609D   0020
L_609E:
        TSTR    R1                              ; 609E   0089
        BPL     L_60A2                          ; 609F   0203 0001

        NEGR    R1                              ; 60A1   0021
L_60A2:
        MOVR    R0,     R4                      ; 60A2   0084
        CMPR    R0,     R1                      ; 60A3   0141
        BLE     L_60A7                          ; 60A4   0206 0001

        MOVR    R1,     R4                      ; 60A6   008C
L_60A7:
        ADDR    R4,     R0                      ; 60A7   00E0
        ADDR    R1,     R0                      ; 60A8   00C8
        SLR     R0,     1                       ; 60A9   0060
        MOVR    R0,     R4                      ; 60AA   0084
        PULR    R7                              ; 60AB   02B7

L_60AC:
        MVII    #$0032, R1                      ; 60AC   02B9 0032
        CMPI    #$002C, R3                      ; 60AE   037B 002C
        BLT     L_6016                          ; 60B0   0225 009B

        NEGR    R1                              ; 60B2   0021
        CMPI    #$0056, R3                      ; 60B3   037B 0056
        BGT     L_6016                          ; 60B5   022E 00A0

        MOVR    R2,     R1                      ; 60B7   0091
        PSHR    R5                              ; 60B8   0275
        MVI     G_01B0, R5                      ; 60B9   0285 01B0
        TSTR    R5                              ; 60BB   00AD
        PULR    R5                              ; 60BC   02B5
        BEQ     L_60C2                          ; 60BD   0204 0003

        NEGR    R1                              ; 60BF   0021
        ADDI    #$00A8, R1                      ; 60C0   02F9 00A8
L_60C2:
        ADDR    R3,     R1                      ; 60C2   00D9
        CMPI    #$0069, R1                      ; 60C3   0379 0069
        BGE     L_60D2                          ; 60C5   020D 000B

        MVII    #$0032, R1                      ; 60C7   02B9 0032
        SWAP    R1,     1                       ; 60C9   0041
        MVI     G_01B0, R5                      ; 60CA   0285 01B0
        TSTR    R5                              ; 60CC   00AD
        BEQ     L_6016                          ; 60CD   0224 00B8

        NEGR    R1                              ; 60CF   0021
        B       L_6016                          ; 60D0   0220 00BB

L_60D2:
        PSHR    R5                              ; 60D2   0275

        JSR     R5,     L_6078                  ; 60D3   0004 0160 0078

        MOVR    R5,     R1                      ; 60D6   00A9
        PULR    R5                              ; 60D7   02B5
        SUB@    R5,     R4                      ; 60D8   032C
        BLE     L_60DE                          ; 60D9   0206 0003

        ADDI    #$0008, R1                      ; 60DB   02F9 0008
        INCR    R7                              ; 60DD   000F

L_60DE:
        NEGR    R4                              ; 60DE   0024
L_60DF:
        CMP@    R5,     R4                      ; 60DF   036C
        BGT     L_6073                          ; 60E0   022E 006E

        SUBI    #$0004, R1                      ; 60E2   0339 0004
        B       L_6073                          ; 60E4   0220 0072

        PSHR    R5                              ; 60E6   0275

        JSR     R5,     L_630B                  ; 60E7   0004 0160 030B
        JSR     R5,     L_62B4                  ; 60EA   0004 0160 02B4
        JSR     R5,     L_6263                  ; 60ED   0004 0160 0263

        MVI     G_01B2, R5                      ; 60F0   0285 01B2
        MVO     R5,     G_01B3                  ; 60F2   0245 01B3
        MVO     R4,     G_01B2                  ; 60F4   0244 01B2
        NOP                                     ; 60F6   0034
        MVO     R3,     G_01AA                  ; 60F7   0243 01AA
        MVO     R2,     G_01A9                  ; 60F9   0242 01A9

        JSR     R5,     L_59FC                  ; 60FB   0004 0158 01FC

        MVI     G_01A3, R0                      ; 60FE   0280 01A3
        CMPI    #$0007, R0                      ; 6100   0378 0007
        BNEQ    L_62F2                          ; 6102   020C 01EE

        MVII    #$0005, R0                      ; 6104   02B8 0005

        JSR     R5,     X_SET_BIT               ; 6106   0004 0114 02DB

        CMP@    R2,     R5                      ; 6109   0355
        MVI     G_0359, R0                      ; 610A   0280 0359

        JSR     R5,     X_UNPK_BYTES            ; 610C   0004 0114 0357

        INCR    R4                              ; 610F   000C
        ADDR    R7,     R4                      ; 6110   00FC
        ADD@    R4,     R7                      ; 6111   02E7

        XORR    R4,     R0                      ; 6112   01E0
        INCR    R3                              ; 6113   000B
        XORR    R4,     R0                      ; 6114   01E0
        RLC     R3,     2                       ; 6115   0057
        SLR     R3,     2                       ; 6116   0067
        RRC     R2,     2                       ; 6117   0076
        MOVR    R2,     R5                      ; 6118   0095
        XORR    R4,     R0                      ; 6119   01E0
        SARC    R1,     2                       ; 611A   007D
        MOVR    R3,     R4                      ; 611B   009C
        MOVR    R5,     R6                      ; 611C   00AE
        MVI     G_031A, R3                      ; 611D   0283 031A
        SWAP    R3,     1                       ; 611F   0043
        ANDI    #$00FF, R3                      ; 6120   03BB 00FF
        CMPI    #$003B, R3                      ; 6122   037B 003B
        BLT     L_6188                          ; 6124   0205 0062

        CMPI    #$0047, R3                      ; 6126   037B 0047
        BGT     L_6179                          ; 6128   020E 004F

        MVI     G_01B3, R4                      ; 612A   0284 01B3
        SDBD                                    ; 612C   0001
        CMPI    #$0003, R4                      ; 612D   037C 0003 0000
        BEQ     L_6169                          ; 6130   0204 0037

        SDBD                                    ; 6132   0001
        CMPI    #$0007, R4                      ; 6133   037C 0007 0000
        BEQ     L_6169                          ; 6136   0204 0031

L_6138:
        MVI     G_01B0, R4                      ; 6138   0284 01B0
        MOVR    R4,     R3                      ; 613A   00A3
        XORI    #$0001, R4                      ; 613B   03FC 0001
        ADDI    #$01B7, R4                      ; 613D   02FC 01B7
        ADDI    #$01B7, R3                      ; 613F   02FB 01B7
        MVI@    R4,     R0                      ; 6141   02A0
        TSTR    R0                              ; 6142   0080
        BNEQ    L_6146                          ; 6143   020C 0001

        MVO@    R0,     R3                      ; 6145   0258
L_6146:
        MVII    #$01A6, R3                      ; 6146   02BB 01A6
        SUB     G_01B0, R3                      ; 6148   0303 01B0
        MVI@    R3,     R5                      ; 614A   029D
        INCR    R5                              ; 614B   000D
        MVO@    R5,     R3                      ; 614C   025D
        CLRR    R5                              ; 614D   01ED
        MVO     R5,     G_0351                  ; 614E   0245 0351

        JSR     R5,     L_5D57                  ; 6150   0004 015C 0157
        JSR     R5,     L_546D                  ; 6153   0004 0154 006D
        JSR     R5,     L_6341                  ; 6156   0004 0160 0341

        MVII    #$0005, R0                      ; 6159   02B8 0005

        JSR     R5,     X_PLAY_CHEER1           ; 615B   0004 011C 02D5

        MVII    #$0002, R0                      ; 615E   02B8 0002

        JSR     R5,     X_CLR_BIT               ; 6160   0004 0114 02E6

        ANDR    R3,     R5                      ; 6163   019D
        PULR    R5                              ; 6164   02B5

        JSR     R5,     L_636A                  ; 6165   0004 0160 036A

        PULR    R7                              ; 6168   02B7

L_6169:
        MVI     G_01B3, R4                      ; 6169   0284 01B3
        SDBD                                    ; 616B   0001
        CMPI    #$0002, R4                      ; 616C   037C 0002 0000
        BEQ     L_6138                          ; 616F   0224 0038

        CMPR    R0,     R1                      ; 6171   0141
        BLT     L_618F                          ; 6172   0205 001B

        TSTR    R0                              ; 6174   0080
        BMI     L_61B5                          ; 6175   020B 003E
        B       L_61B4                          ; 6177   0200 003B

L_6179:
        TSTR    R1                              ; 6179   0089
        BPL     L_618B                          ; 617A   0203 000F

L_617C:
        MOVR    R3,     R5                      ; 617C   009D
        MVI     G_031A, R3                      ; 617D   0283 031A
        SWAP    R3,     1                       ; 617F   0043
        ANDI    #$00FF, R3                      ; 6180   03BB 00FF
        CMPR    R3,     R5                      ; 6182   015D
        BEQ     L_618F                          ; 6183   0204 000A

        NEGR    R1                              ; 6185   0021
        B       L_6190                          ; 6186   0200 0008

L_6188:
        TSTR    R1                              ; 6188   0089
        BPL     L_617C                          ; 6189   0223 000E

L_618B:
        CMPI    #$0000, R0                      ; 618B   0378 0000
        BLE     L_617C                          ; 618D   0226 0012

L_618F:
        NEGR    R0                              ; 618F   0020
L_6190:
        MOVR    R0,     R3                      ; 6190   0083
        SAR     R3,     2                       ; 6191   006F
        SUBR    R3,     R0                      ; 6192   0118
        MOVR    R1,     R3                      ; 6193   008B
        SAR     R3,     2                       ; 6194   006F
        SUBR    R3,     R1                      ; 6195   0119

        JSR     R5,     X_PACK_BYTES            ; 6196   0004 0114 034F

        MVO     R0,     G_0359                  ; 6199   0240 0359
        MVI     G_0319, R3                      ; 619B   0283 0319
        MVO     R3,     G_0317                  ; 619D   0243 0317
        MVI     G_031A, R3                      ; 619F   0283 031A
        MVO     R3,     G_0318                  ; 61A1   0243 0318

        JSR     R5,     L_6654                  ; 61A3   0004 0164 0254

        PULR    R7                              ; 61A6   02B7

        MVII    #$0005, R0                      ; 61A7   02B8 0005

        JSR     R5,     X_CLR_BIT               ; 61A9   0004 0114 02E6

        CMP@    R2,     R5                      ; 61AC   0355
        PULR    R7                              ; 61AD   02B7

        CMPR    R0,     R1                      ; 61AE   0141
        BGT     L_618F                          ; 61AF   022E 0021

        TSTR    R0                              ; 61B1   0080
        BPL     L_61B5                          ; 61B2   0203 0001

L_61B4:
        NEGR    R0                              ; 61B4   0020
L_61B5:
        MOVR    R1,     R5                      ; 61B5   008D
        ADDR    R0,     R1                      ; 61B6   00C1
        SUBR    R5,     R0                      ; 61B7   0128
        MOVR    R0,     R3                      ; 61B8   0083
        SAR     R3,     2                       ; 61B9   006F
        SUBR    R3,     R0                      ; 61BA   0118
        MOVR    R1,     R3                      ; 61BB   008B
        SAR     R3,     2                       ; 61BC   006F
        SUBR    R3,     R1                      ; 61BD   0119
        B       L_6190                          ; 61BE   0220 002F

        XORR    R0,     R1                      ; 61C0   01C1
        XORR    R1,     R0                      ; 61C1   01C8
        XORR    R0,     R1                      ; 61C2   01C1
        SAR     R1,     1                       ; 61C3   0069
        CMPR    R0,     R1                      ; 61C4   0141
        BLE     L_6190                          ; 61C5   0226 0036

        MOVR    R0,     R1                      ; 61C7   0081
        B       L_6190                          ; 61C8   0220 0039

        PSHR    R5                              ; 61CA   0275

        JSR     R5,     L_5890                  ; 61CB   0004 0158 0090
        JSR     R5,     L_6302                  ; 61CE   0004 0160 0302
        JSR     R5,     L_62B4                  ; 61D1   0004 0160 02B4
        JSR     R5,     L_6260                  ; 61D4   0004 0160 0260

        MVI     G_031B, R1                      ; 61D7   0281 031B
        ADDI    #$0004, R1                      ; 61D9   02F9 0004
        PSHR    R1                              ; 61DB   0271
        MVI@    R1,     R0                      ; 61DC   0288

        JSR     R5,     X_UNPK_BYTES            ; 61DD   0004 0114 0357

        PULR    R5                              ; 61E0   02B5
        INCR    R4                              ; 61E1   000C
        ADDR    R7,     R4                      ; 61E2   00FC
        ADD@    R4,     R7                      ; 61E3   02E7

        SUBR    R1,     R6                      ; 61E4   010E
        DECR    R5                              ; 61E5   0015
        DECR    R5                              ; 61E6   0015
        DECR    R5                              ; 61E7   0015
        SAR     R1,     2                       ; 61E8   006D
        SAR     R1,     2                       ; 61E9   006D
        SUBR    R1,     R6                      ; 61EA   010E
        INCR    R3                              ; 61EB   000B
        SARC    R1,     1                       ; 61EC   0079
        DECR    R5                              ; 61ED   0015
        ADCR    R1                              ; 61EE   0029
        CMPI    #$003B, R3                      ; 61EF   037B 003B
        BEQ     L_624D                          ; 61F1   0204 005A
        BLT     L_62F2                          ; 61F3   0205 00FD

        CMPI    #$0047, R3                      ; 61F5   037B 0047
        BEQ     L_6248                          ; 61F7   0204 004F

L_61F9:
        SUBR    R1,     R0                      ; 61F9   0108
        MOVR    R0,     R1                      ; 61FA   0081
        BPL     L_61FE                          ; 61FB   0203 0001

        NEGR    R1                              ; 61FD   0021
L_61FE:
        CMPI    #$0010, R1                      ; 61FE   0379 0010
        BLE     L_6209                          ; 6200   0206 0007

        MVII    #$0010, R1                      ; 6202   02B9 0010
        TSTR    R0                              ; 6204   0080
        BPL     L_6208                          ; 6205   0203 0001

        NEGR    R1                              ; 6207   0021
L_6208:
        MOVR    R1,     R0                      ; 6208   0088
L_6209:
        NEGR    R1                              ; 6209   0021
        INCR    R1                              ; 620A   0009
        B       L_620F                          ; 620B   0200 0002

        ADDR    R1,     R0                      ; 620D   00C8
        MOVR    R0,     R1                      ; 620E   0081
L_620F:
        SAR     R0,     1                       ; 620F   0068
L_6210:
        MOVR    R5,     R2                      ; 6210   00AA

        JSR     R5,     X_PACK_BYTES            ; 6211   0004 0114 034F

        MVO@    R0,     R2                      ; 6214   0250
        MVI     G_0319, R1                      ; 6215   0281 0319
        MVI     G_031A, R2                      ; 6217   0282 031A

        JSR     R5,     .EXEC.477               ; 6219   0004 0114 0077

        SDBD                                    ; 621C   0001
        CMPI    #$2A00, R2                      ; 621D   037A 0000 002A
        BLE     L_623F                          ; 6220   0206 001D

        SDBD                                    ; 6222   0001
        CMPI    #$5900, R2                      ; 6223   037A 0000 0059
        BGE     L_623F                          ; 6226   020D 0017

        MOVR    R2,     R3                      ; 6228   0093
        SWAP    R3,     1                       ; 6229   0043
        ANDI    #$00FF, R3                      ; 622A   03BB 00FF
        MOVR    R3,     R5                      ; 622C   009D
        MOVR    R1,     R0                      ; 622D   0088
        SWAP    R0,     1                       ; 622E   0040
        ANDI    #$00FF, R0                      ; 622F   03B8 00FF
        ADDR    R0,     R5                      ; 6231   00C5
        ADDR    R0,     R5                      ; 6232   00C5
        CMPI    #$006A, R5                      ; 6233   037D 006A
        BGT     L_6243                          ; 6235   020E 000C

        MVII    #$006C, R0                      ; 6237   02B8 006C
        SUBR    R3,     R0                      ; 6239   0118
        SLR     R0,     1                       ; 623A   0060
        SWAP    R0,     1                       ; 623B   0040
        MOVR    R0,     R1                      ; 623C   0081
        B       L_6243                          ; 623D   0200 0004

L_623F:
        MVI     G_031A, R2                      ; 623F   0282 031A
        MVI     G_0319, R1                      ; 6241   0281 0319
L_6243:
        MVO     R1,     G_0317                  ; 6243   0241 0317
        MVO     R2,     G_0318                  ; 6245   0242 0318
        PULR    R7                              ; 6247   02B7

L_6248:
        TSTR    R1                              ; 6248   0089
        BPL     L_61F9                          ; 6249   0223 0051
        B       L_6251                          ; 624B   0200 0004

L_624D:
        CMPI    #$0000, R1                      ; 624D   0379 0000
        BLE     L_61F9                          ; 624F   0226 0057

L_6251:
        MOVR    R3,     R5                      ; 6251   009D
        MVI     G_031A, R3                      ; 6252   0283 031A
        SWAP    R3,     1                       ; 6254   0043
        ANDI    #$00FF, R3                      ; 6255   03BB 00FF
        CMPR    R3,     R5                      ; 6257   015D
        BEQ     L_625D                          ; 6258   0204 0003

        CLRR    R1                              ; 625A   01C9
        B       L_6210                          ; 625B   0220 004C

L_625D:
        CLRR    R0                              ; 625D   01C0
        B       L_6210                          ; 625E   0220 004F

L_6260:
        MVII    #$0003, R4                      ; 6260   02BC 0003
        INCR    R7                              ; 6262   000F

L_6263:
        CLRR    R4                              ; 6263   01E4
L_6264:
        PSHR    R5                              ; 6264   0275
        PSHR    R1                              ; 6265   0271
        MVII    #$0315, R1                      ; 6266   02B9 0315

        JSR     R5,     .EXEC.777               ; 6268   0004 0114 0377

        SUBR    R4,     R2                      ; 626B   0122
        MVII    #$000A, R4                      ; 626C   02BC 000A
        MOVR    R3,     R1                      ; 626E   0099
        MOVR    R3,     R5                      ; 626F   009D
        SUBR    R2,     R1                      ; 6270   0111
        ADDR    R2,     R5                      ; 6271   00D5
        ADDR    R2,     R5                      ; 6272   00D5
        DECR    R4                              ; 6273   0014
        CMPI    #$0064, R5                      ; 6274   037D 0064
        BLE     L_62B2                          ; 6276   0206 003A

        DECR    R4                              ; 6278   0014
        CMPI    #$0004, R2                      ; 6279   037A 0004
        BLE     L_62B2                          ; 627B   0206 0035

        DECR    R4                              ; 627D   0014
        CMPI    #$0026, R2                      ; 627E   037A 0026
        BGE     L_62B1                          ; 6280   020D 002F

        CMPI    #$0084, R5                      ; 6282   037D 0084
        BGE     L_62B1                          ; 6284   020D 002B

        CMPI    #$0048, R3                      ; 6286   037B 0048
        BGE     L_62B1                          ; 6288   020D 0027

        CMPI    #$003A, R3                      ; 628A   037B 003A
        BLE     L_62B1                          ; 628C   0206 0023

        CMPI    #$0070, R5                      ; 628E   037D 0070
        BLE     L_62B1                          ; 6290   0206 001F

        CMPI    #$0074, R5                      ; 6292   037D 0074
        BLE     L_62B2                          ; 6294   0206 001C

        DECR    R4                              ; 6296   0014
        CMPI    #$003A, R3                      ; 6297   037B 003A
        BLE     L_62B2                          ; 6299   0206 0017

        DECR    R4                              ; 629B   0014
        CMPI    #$003B, R3                      ; 629C   037B 003B
        BLE     L_62B2                          ; 629E   0206 0012

        DECR    R4                              ; 62A0   0014
        CMPI    #$0047, R3                      ; 62A1   037B 0047
        BGE     L_62B2                          ; 62A3   020D 000D

        DECR    R4                              ; 62A5   0014
        CMPI    #$0079, R5                      ; 62A6   037D 0079
        BLE     L_62B2                          ; 62A8   0206 0008

        DECR    R4                              ; 62AA   0014
        CMPI    #$007F, R5                      ; 62AB   037D 007F
        BGE     L_62B2                          ; 62AD   020D 0003

        DECR    R4                              ; 62AF   0014
        INCR    R7                              ; 62B0   000F

L_62B1:
        CLRR    R4                              ; 62B1   01E4
L_62B2:
        PULR    R1                              ; 62B2   02B1
        PULR    R7                              ; 62B3   02B7

L_62B4:
        CLRR    R4                              ; 62B4   01E4
        MVI     G_031B, R1                      ; 62B5   0281 031B
        ADDI    #$0002, R1                      ; 62B7   02F9 0002
        MVI@    R1,     R2                      ; 62B9   028A
        SDBD                                    ; 62BA   0001
        CMPI    #$5400, R2                      ; 62BB   037A 0000 0054
        ADCR    R4                              ; 62BE   002C
        MVO     R4,     G_01B0                  ; 62BF   0244 01B0
        MOVR    R7,     R4                      ; 62C1   00BC
        ADDI    #$0010, R4                      ; 62C2   02FC 0010
        PSHR    R4                              ; 62C4   0274
        PSHR    R5                              ; 62C5   0275
        MOVR    R1,     R4                      ; 62C6   008C
        MVI@    R4,     R2                      ; 62C7   02A2

        JSR     R5,     L_62F3                  ; 62C8   0004 0160 02F3

        MVO     R2,     G_0317                  ; 62CB   0242 0317
        MVI@    R4,     R2                      ; 62CD   02A2
        MVO     R2,     G_0318                  ; 62CE   0242 0318
        B       L_62DF                          ; 62D0   0200 000D

        MVI     G_031B, R4                      ; 62D2   0284 031B
        ADDI    #$0002, R4                      ; 62D4   02FC 0002
        MVI     G_0317, R2                      ; 62D6   0282 0317

        JSR     R5,     L_62F3                  ; 62D8   0004 0160 02F3

        MVO@    R2,     R4                      ; 62DB   0262
        MVI     G_0318, R2                      ; 62DC   0282 0318
        MVO@    R2,     R4                      ; 62DE   0262
L_62DF:
        TSTR    R3                              ; 62DF   009B
        BEQ     L_62EE                          ; 62E0   0204 000C

        MVI     G_031B, R1                      ; 62E2   0281 031B
        ADDI    #$0004, R1                      ; 62E4   02F9 0004
        MVI@    R1,     R0                      ; 62E6   0288
        SDBD                                    ; 62E7   0001
        XORI    #$FF00, R0                      ; 62E8   03F8 0000 00FF
        ADDI    #$0100, R0                      ; 62EB   02F8 0100
        MVO@    R0,     R1                      ; 62ED   0248
L_62EE:
        MVI     G_031B, R1                      ; 62EE   0281 031B
        MVI     G_011B, R0                      ; 62F0   0280 011B
L_62F2:
        PULR    R7                              ; 62F2   02B7

L_62F3:
        MVI     G_01B0, R3                      ; 62F3   0283 01B0
        TSTR    R3                              ; 62F5   009B
        BEQ     L_6301                          ; 62F6   0204 0009

        MVII    #$00A8, R3                      ; 62F8   02BB 00A8
        SWAP    R3,     1                       ; 62FA   0043
        NEGR    R2                              ; 62FB   0022
        ADDR    R3,     R2                      ; 62FC   00DA
        SUB     G_0319, R3                      ; 62FD   0303 0319
        MVO     R3,     G_0319                  ; 62FF   0243 0319
L_6301:
        MOVR    R5,     R7                      ; 6301   00AF

L_6302:
        MVI@    R1,     R3                      ; 6302   028B
        SDBD                                    ; 6303   0001
        XORI    #$8000, R3                      ; 6304   03FB 0000 0080
        MVO@    R3,     R1                      ; 6307   024B
        RLC     R3,     1                       ; 6308   0053
        BNC     L_630C                          ; 6309   0209 0001

L_630B:
        PSHR    R5                              ; 630B   0275
L_630C:
        MOVR    R1,     R4                      ; 630C   008C
        ADDI    #$0006, R4                      ; 630D   02FC 0006
        MVII    #$0001, R5                      ; 630F   02BD 0001
        MVO@    R5,     R4                      ; 6311   0265
        PULR    R7                              ; 6312   02B7

L_6313:
        PSHR    R5                              ; 6313   0275

        JSR     R5,     L_636A                  ; 6314   0004 0160 036A

        MVII    #$01A7, R4                      ; 6317   02BC 01A7
        MVI@    R4,     R1                      ; 6319   02A1
        DECR    R4                              ; 631A   0014
        SDBD                                    ; 631B   0001
        MVI@    R4,     R0                      ; 631C   02A0
        TSTR    R1                              ; 631D   0089
        BNEQ    L_6322                          ; 631E   020C 0002

        SUBI    #$00C4, R0                      ; 6320   0338 00C4
L_6322:
        DECR    R0                              ; 6322   0010
        BEQ     L_635B                          ; 6323   0204 0036

        PULR    R5                              ; 6325   02B5
L_6326:
        MVO     R0,     G_01A7                  ; 6326   0240 01A7
        SWAP    R0,     1                       ; 6328   0040
        MVO     R0,     G_01A8                  ; 6329   0240 01A8
L_632B:
        PSHR    R5                              ; 632B   0275
        MVI     G_01A8, R0                      ; 632C   0280 01A8
        MVII    #$0002, R1                      ; 632E   02B9 0002
        SDBD                                    ; 6330   0001
        MVII    #$0006, R3                      ; 6331   02BB 0006 0000
        MVII    #$0230, R4                      ; 6334   02BC 0230

        JSR     R5,     X_PRNUM_RGT             ; 6336   0004 0118 00C5

        MVI     G_01A7, R0                      ; 6339   0280 01A7
        MVII    #$0233, R4                      ; 633B   02BC 0233

        JSR     R5,     X_PRNUM_ZRO             ; 633D   0004 0118 00AD

        PULR    R7                              ; 6340   02B7

L_6341:
        PSHR    R5                              ; 6341   0275
        SDBD                                    ; 6342   0001
        MVII    #$0003, R3                      ; 6343   02BB 0003 0000
        MVII    #$0002, R1                      ; 6346   02B9 0002
        MVII    #$022C, R4                      ; 6348   02BC 022C
        MVI     G_01A5, R0                      ; 634A   0280 01A5

        JSR     R5,     X_PRNUM_RGT             ; 634C   0004 0118 00C5

        SDBD                                    ; 634F   0001
        MVII    #$0005, R3                      ; 6350   02BB 0005 0000
        MVII    #$0237, R4                      ; 6353   02BC 0237
        MVI     G_01A6, R0                      ; 6355   0280 01A6

        JSR     R5,     X_PRNUM_LFT             ; 6357   0004 0118 009E

        PULR    R7                              ; 635A   02B7

L_635B:
        JSR     R5,     L_6326                  ; 635B   0004 0160 0326
        JSR     R5,     L_5187                  ; 635E   0004 0150 0187
        JSR     R5,     L_5492                  ; 6361   0004 0154 0092

        MVII    #$0014, R0                      ; 6364   02B8 0014

        JSR     R5,     X_PLAY_RAZZ4            ; 6366   0004 011C 02C4

        PULR    R7                              ; 6369   02B7

L_636A:
        PSHR    R5                              ; 636A   0275
        MVII    #$01B7, R2                      ; 636B   02BA 01B7
        MVII    #$0002, R0                      ; 636D   02B8 0002
        MVII    #$0255, R4                      ; 636F   02BC 0255
        SDBD                                    ; 6371   0001
        MVII    #$0003, R3                      ; 6372   02BB 0003 0000

        JSR     R5,     L_6381                  ; 6375   0004 0160 0381

        INCR    R0                              ; 6378   0008
        INCR    R2                              ; 6379   000A
        MVII    #$025B, R4                      ; 637A   02BC 025B
        SDBD                                    ; 637C   0001
        MVII    #$0005, R3                      ; 637D   02BB 0005 0000
        INCR    R7                              ; 6380   000F

L_6381:
        PSHR    R5                              ; 6381   0275
L_6382:
        PSHR    R0                              ; 6382   0270
        MVI@    R2,     R1                      ; 6383   0291
        TSTR    R1                              ; 6384   0089
        BNEQ    L_6393                          ; 6385   020C 000C

        CLRR    R3                              ; 6387   01DB
        MVII    #$0004, R0                      ; 6388   02B8 0004
        SDBD                                    ; 638A   0001
        MVII    #$1801, R1                      ; 638B   02B9 0001 0018

        JSR     R5,     X_FILL_MEM              ; 638E   0004 0114 0341

L_6391:
        PULR    R0                              ; 6391   02B0
        PULR    R7                              ; 6392   02B7

L_6393:
        MOVR    R1,     R0                      ; 6393   0088
        ANDI    #$003F, R0                      ; 6394   03B8 003F
        BNEQ    L_639C                          ; 6396   020C 0004

        SUBI    #$0004, R1                      ; 6398   0339 0004
        B       L_6393                          ; 639A   0220 0008

L_639C:
        PSHR    R1                              ; 639C   0271
        XORR    R0,     R1                      ; 639D   01C1
        SLR     R1,     2                       ; 639E   0065
        SLR     R1,     1                       ; 639F   0061
        DECR    R0                              ; 63A0   0010
        ADDI    #$0080, R1                      ; 63A1   02F9 0080
        XORR    R3,     R1                      ; 63A3   01D9
        MVO@    R1,     R4                      ; 63A4   0261
        MOVR    R3,     R5                      ; 63A5   009D
        ADDI    #$00D0, R5                      ; 63A6   02FD 00D0
        MVO@    R5,     R4                      ; 63A8   0265
        MVII    #$0002, R1                      ; 63A9   02B9 0002

        JSR     R5,     X_PRNUM_ZRO             ; 63AB   0004 0118 00AD

        PULR    R1                              ; 63AE   02B1
        DECR    R1                              ; 63AF   0011
        MVO@    R1,     R2                      ; 63B0   0251
        BNEQ    L_6391                          ; 63B1   022C 0021

        PULR    R0                              ; 63B3   02B0

        JSR     R5,     .EXEC.76C               ; 63B4   0004 0114 036C

        MVI@    R1,     R5                      ; 63B7   028D
        SDBD                                    ; 63B8   0001
        ANDI    #$FFF7, R5                      ; 63B9   03BD 00F7 00FF
        SDBD                                    ; 63BC   0001
        XORI    #$0800, R5                      ; 63BD   03FD 0000 0008
        MVO@    R5,     R1                      ; 63C0   024D
        ADDI    #$0003, R1                      ; 63C1   02F9 0003
        MVI@    R1,     R5                      ; 63C3   028D
        ADDI    #$0100, R5                      ; 63C4   02FD 0100
        MVO@    R5,     R1                      ; 63C6   024D
        ADDI    #$0002, R1                      ; 63C7   02F9 0002
        CLRR    R5                              ; 63C9   01ED
        MVO@    R5,     R1                      ; 63CA   024D
        PULR    R7                              ; 63CB   02B7

L_63CC:
        PSHR    R5                              ; 63CC   0275
        MVII    #$0163, R4                      ; 63CD   02BC 0163
        CLRR    R0                              ; 63CF   01C0
L_63D0:
        MVI@    R4,     R2                      ; 63D0   02A2
        MVI@    R4,     R3                      ; 63D1   02A3
        TSTR    R3                              ; 63D2   009B
        BEQ     L_643F                          ; 63D3   0204 006A

        PSHR    R0                              ; 63D5   0270
        PSHR    R4                              ; 63D6   0274

        JSR     R5,     .EXEC.76C               ; 63D7   0004 0114 036C

        PSHR    R1                              ; 63DA   0271
        MVI@    R1,     R4                      ; 63DB   028C
        SDBD                                    ; 63DC   0001
        ANDI    #$B7F7, R4                      ; 63DD   03BC 00F7 00B7
        SDBD                                    ; 63E0   0001
        XORI    #$0800, R4                      ; 63E1   03FC 0000 0008
        MVO@    R4,     R1                      ; 63E4   024C
        MOVR    R1,     R4                      ; 63E5   008C
        ADDI    #$0002, R4                      ; 63E6   02FC 0002

        JSR     R5,     .EXEC.784               ; 63E8   0004 0114 0384

        PULR    R4                              ; 63EB   02B4
        ADDI    #$0004, R4                      ; 63EC   02FC 0004
        MVI@    R4,     R3                      ; 63EE   02A3
        CMPI    #$0064, R2                      ; 63EF   037A 0064
        BNC     L_6412                          ; 63F1   0209 001F

        JSR     R5,     .EXEC.A2F               ; 63F3   0004 0118 022F

        MOVR    R1,     R2                      ; 63F6   008A
        MOVR    R3,     R0                      ; 63F7   0098

        JSR     R5,     X_UNPK_BYTES            ; 63F8   0004 0114 0357
        JSR     R5,     .EXEC.A2F               ; 63FB   0004 0118 022F

        SUBR    R1,     R2                      ; 63FE   010A
        ANDI    #$000F, R2                      ; 63FF   03BA 000F
        CMPI    #$0008, R2                      ; 6401   037A 0008
        BLE     L_6407                          ; 6403   0206 0002

        ADDI    #$0004, R1                      ; 6405   02F9 0004
L_6407:
        ADDR    R2,     R1                      ; 6407   00D1
        SLR     R2,     2                       ; 6408   0066
        SUBR    R2,     R1                      ; 6409   0111
        PULR    R4                              ; 640A   02B4
        MVII    #$0023, R0                      ; 640B   02B8 0023

        JSR     R5,     L_586A                  ; 640D   0004 0158 006A

        B       L_643F                          ; 6410   0200 002D

L_6412:
        CMPI    #$0005, R2                      ; 6412   037A 0005
        BNC     L_642F                          ; 6414   0209 0019

        MOVR    R0,     R2                      ; 6416   0082
        MOVR    R3,     R0                      ; 6417   0098
        MOVR    R1,     R3                      ; 6418   008B

        JSR     R5,     X_UNPK_BYTES            ; 6419   0004 0114 0357

        SLL     R2,     1                       ; 641C   004A
        SUBR    R0,     R2                      ; 641D   0102

        JSR     R5,     L_6447                  ; 641E   0004 0164 0047

        MOVR    R2,     R0                      ; 6421   0090
        MOVR    R3,     R2                      ; 6422   009A
        SLL     R2,     1                       ; 6423   004A
        SUBR    R1,     R2                      ; 6424   010A

        JSR     R5,     L_6447                  ; 6425   0004 0164 0047

        MOVR    R2,     R1                      ; 6428   0091
        PULR    R4                              ; 6429   02B4

        JSR     R5,     L_5870                  ; 642A   0004 0158 0070

        B       L_643F                          ; 642D   0200 0010

L_642F:
        MOVR    R4,     R1                      ; 642F   00A1

        JSR     R5,     .EXEC.766               ; 6430   0004 0114 0366

        CLRR    R1                              ; 6433   01C9

        JSR     R5,     L_5877                  ; 6434   0004 0158 0077
        JSR     R5,     .EXEC.76C               ; 6437   0004 0114 036C
        JSR     R5,     L_649F                  ; 643A   0004 0164 009F

        PULR    R4                              ; 643D   02B4
        PULR    R0                              ; 643E   02B0
L_643F:
        ADDI    #$0006, R4                      ; 643F   02FC 0006
        INCR    R0                              ; 6441   0008
        CMPI    #$0008, R0                      ; 6442   0378 0008
        BMI     L_63D0                          ; 6444   022B 0075
        PULR    R7                              ; 6446   02B7

L_6447:
        PSHR    R5                              ; 6447   0275
        SLL     R2,     1                       ; 6448   004A
        MVII    #$001E, R5                      ; 6449   02BD 001E
        CMPR    R5,     R2                      ; 644B   016A
        BPL     L_6452                          ; 644C   0203 0004

        NEGR    R5                              ; 644E   0025
        CMPR    R5,     R2                      ; 644F   016A
        BGE     L_6453                          ; 6450   020D 0001

L_6452:
        MOVR    R5,     R2                      ; 6452   00AA
L_6453:
        PULR    R7                              ; 6453   02B7

L_6454:
        PSHR    R5                              ; 6454   0275
        PSHR    R0                              ; 6455   0270
        SLL     R0,     2                       ; 6456   004C
        SLL     R0,     1                       ; 6457   0048
        MOVR    R0,     R5                      ; 6458   0085
        ADDI    #$0163, R5                      ; 6459   02FD 0163
        MOVR    R1,     R0                      ; 645B   0088
        SWAP    R0,     1                       ; 645C   0040
        MVO@    R0,     R5                      ; 645D   0268
        MVO@    R1,     R5                      ; 645E   0269
        PULR    R0                              ; 645F   02B0
        PULR    R7                              ; 6460   02B7

L_6461:
        PSHR    R5                              ; 6461   0275
        MVI@    R4,     R2                      ; 6462   02A2
        MVO     R2,     G_01AB                  ; 6463   0242 01AB
        SWAP    R2,     1                       ; 6465   0042
        MVO     R2,     G_01AD                  ; 6466   0242 01AD
        MVI@    R4,     R2                      ; 6468   02A2
        MVO     R2,     G_01AC                  ; 6469   0242 01AC
        MVII    #$0017, R0                      ; 646B   02B8 0017
        MVO     R0,     G_019D                  ; 646D   0240 019D
        PULR    R7                              ; 646F   02B7

L_6470:
        MOVR    R5,     R4                      ; 6470   00AC

        JSR     R5,     L_6454                  ; 6471   0004 0164 0054

        PSHR    R0                              ; 6474   0270

        JSR     R5,     L_6461                  ; 6475   0004 0164 0061

        MVII    #$0001, R0                      ; 6478   02B8 0001
        MVO     R0,     G_01AF                  ; 647A   0240 01AF
        PULR    R0                              ; 647C   02B0
        MOVR    R4,     R7                      ; 647D   00A7

L_647E:
        PSHR    R5                              ; 647E   0275

        JSR     R5,     L_6461                  ; 647F   0004 0164 0061

        XORI    #$0008, R0                      ; 6482   03F8 0008
        MVO     R0,     G_019D                  ; 6484   0240 019D
        CLRR    R0                              ; 6486   01C0
L_6487:
        MVI@    R4,     R1                      ; 6487   02A1
        SWAP    R1,     1                       ; 6488   0041
        SARC    R1,     1                       ; 6489   0079
        RRC     R2,     1                       ; 648A   0072
        DECR    R4                              ; 648B   0014
        SDBD                                    ; 648C   0001
        MVI@    R4,     R1                      ; 648D   02A1

        JSR     R5,     L_6454                  ; 648E   0004 0164 0054

        INCR    R0                              ; 6491   0008
        CMPI    #$0008, R0                      ; 6492   0378 0008
        BMI     L_6487                          ; 6494   022B 000E

        MVO     R0,     G_01AF                  ; 6496   0240 01AF
        SWAP    R2,     1                       ; 6498   0042
        MVO     R2,     G_01AE                  ; 6499   0242 01AE

        JSR     R5,     L_54C0                  ; 649B   0004 0154 00C0

        PULR    R7                              ; 649E   02B7

L_649F:
        PSHR    R5                              ; 649F   0275
        MOVR    R0,     R3                      ; 64A0   0083
        SLL     R3,     2                       ; 64A1   004F
        SLL     R3,     1                       ; 64A2   004B
        ADDI    #$0164, R3                      ; 64A3   02FB 0164
        MVI     G_01AD, R2                      ; 64A5   0282 01AD
        INCR    R1                              ; 64A7   0009
        DECR    R2                              ; 64A8   0012
        BEQ     L_64C7                          ; 64A9   0204 001C

        JSR     R5,     X_POW2                  ; 64AB   0004 0114 0345

        DECR    R1                              ; 64AE   0011
        MVI@    R1,     R5                      ; 64AF   028D
        SDBD                                    ; 64B0   0001
        ANDI    #$FDFF, R5                      ; 64B1   03BD 00FF 00FD
        AND     G_01AE, R0                      ; 64B4   0380 01AE
        BEQ     L_64BA                          ; 64B6   0204 0002

        XORI    #$0200, R5                      ; 64B8   03FD 0200
L_64BA:
        MVO@    R5,     R1                      ; 64BA   024D
        CLRR    R5                              ; 64BB   01ED
        ADDI    #$0004, R1                      ; 64BC   02F9 0004
        MVO@    R5,     R1                      ; 64BE   024D
        MOVR    R3,     R5                      ; 64BF   009D
        DECR    R5                              ; 64C0   0015
        SDBD                                    ; 64C1   0001
        MVI@    R5,     R2                      ; 64C2   02AA
        DECR    R1                              ; 64C3   0011
        MVO@    R2,     R1                      ; 64C4   024A
        DECR    R1                              ; 64C5   0011
        SWAP    R2,     1                       ; 64C6   0042
L_64C7:
        MVO@    R2,     R1                      ; 64C7   024A
        CLRR    R5                              ; 64C8   01ED
        MVO@    R5,     R3                      ; 64C9   025D
        MVI     G_01AF, R0                      ; 64CA   0280 01AF
        DECR    R0                              ; 64CC   0010
        BEQ     L_64D2                          ; 64CD   0204 0003

        MVO     R0,     G_01AF                  ; 64CF   0240 01AF
        PULR    R7                              ; 64D1   02B7

L_64D2:
        MVII    #$01AB, R4                      ; 64D2   02BC 01AB
        SDBD                                    ; 64D4   0001
        MVI@    R4,     R3                      ; 64D5   02A3
        DECR    R4                              ; 64D6   0014
        CLRR    R5                              ; 64D7   01ED
        MVO@    R5,     R4                      ; 64D8   0265
        PULR    R5                              ; 64D9   02B5
        MOVR    R3,     R7                      ; 64DA   009F

        DECLE   $0010,  $0010,  $0000,  $0018   ; 64DB   0010 0010 0000 0018
        DECLE   $007C,  $005C,  $0020,  $003C   ; 64DF   007C 005C 0020 003C
        DECLE   $0018,  $0038,  $0026,  $0028   ; 64E3   0018 0038 0026 0028
        DECLE   $0068,  $0068,  $0018,  $0018   ; 64E7   0068 0068 0018 0018
        DECLE   $0300,  $0000,  $00CA,  $0061   ; 64EB   0300 0000 00CA 0061
        DECLE   $0003,  $000C,  $0002,  $032A   ; 64EF   0003 000C 0002 032A
        DECLE   $0159,  $0300,  $0000,  $0050   ; 64F3   0159 0300 0000 0050
        DECLE   $005F,  $0001,  $0000,  $0002   ; 64F7   005F 0001 0000 0002
        DECLE   $0398,  $015D,  $0300,  $0000   ; 64FB   0398 015D 0300 0000
        DECLE   $00CA,  $0061,  $0002,  $0008   ; 64FF   00CA 0061 0002 0008
        DECLE   $000C,  $005D,  $005C,  $005D   ; 6503   000C 005D 005C 005D
        DECLE   $015C,  $025D,  $005C,  $025D   ; 6507   015C 025D 005C 025D
        DECLE   $015C,  $015D,  $005C,  $015D   ; 650B   015C 015D 005C 015D
        DECLE   $015C,  $0306,  $0059,  $00E6   ; 650F   015C 0306 0059 00E6
        DECLE   $0060,  $0001,  $002C,  $0000   ; 6513   0060 0001 002C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6517   0000 0000 0000 0000
        DECLE   $0040,  $0040,  $0020,  $0030   ; 651B   0040 0040 0020 0030
        DECLE   $0038,  $0038,  $0028,  $0038   ; 651F   0038 0038 0028 0038
        DECLE   $0018,  $001C,  $003C,  $0014   ; 6523   0018 001C 003C 0014
        DECLE   $003C,  $0000,  $0000,  $0000   ; 6527   003C 0000 0000 0000
        DECLE   $0000,  $0040,  $0040,  $0020   ; 652B   0000 0040 0040 0020
        DECLE   $0030,  $0039,  $0039,  $001F   ; 652F   0030 0039 0039 001F
        DECLE   $0018,  $003C,  $0026,  $0022   ; 6533   0018 003C 0026 0022
        DECLE   $0066,  $0000,  $0000,  $0000   ; 6537   0066 0000 0000 0000

        SWAP    R0,     1                       ; 653B   0040
        SWAP    R0,     1                       ; 653C   0040
        NEGR    R0                              ; 653D   0020
        GSWD    R0                              ; 653E   0030
        RSWD    R0                              ; 653F   0038
        RSWD    R4                              ; 6540   003C
        ADCR    R4                              ; 6541   002C
        RSWD    R4                              ; 6542   003C
        COMR    R2                              ; 6543   001A
L_6544:
        DECR    R7                              ; 6544   0017

        DECLE   $0011,  $0073,  $0030,  $0000   ; 6545   0011 0073 0030 0000
        DECLE   $0000,  $0000,  $0040,  $0040   ; 6549   0000 0000 0040 0040
        DECLE   $0020,  $0030,  $0038,  $003C   ; 654D   0020 0030 0038 003C
        DECLE   $002C,  $003C,  $001E,  $001E   ; 6551   002C 003C 001E 001E
        DECLE   $000A,  $007E,  $0018,  $0000   ; 6555   000A 007E 0018 0000
        DECLE   $0000,  $0000,  $0040,  $0040   ; 6559   0000 0000 0040 0040
        DECLE   $0020,  $0030,  $0038,  $003C   ; 655D   0020 0030 0038 003C
        DECLE   $003C,  $001C,  $0018,  $001C   ; 6561   003C 001C 0018 001C
        DECLE   $006C,  $0004,  $000C,  $0000   ; 6565   006C 0004 000C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6569   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0010,  $000C   ; 656D   0000 0010 0010 000C
        DECLE   $001A,  $007A,  $0000,  $0018   ; 6571   001A 007A 0000 0018
        DECLE   $0038,  $0028,  $002C,  $0024   ; 6575   0038 0028 002C 0024
        DECLE   $0064,  $000C,  $0000,  $0000   ; 6579   0064 000C 0000 0000
        DECLE   $0000,  $0008,  $0008,  $0024   ; 657D   0000 0008 0008 0024
        DECLE   $001C,  $000C,  $0002,  $000A   ; 6581   001C 000C 0002 000A
        DECLE   $0008,  $0028,  $0064,  $0046   ; 6585   0008 0028 0064 0046
        DECLE   $00C2,  $0002,  $0000,  $0000   ; 6589   00C2 0002 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0004   ; 658D   0000 0000 0004 0004
        DECLE   $0002,  $000E,  $0007,  $0001   ; 6591   0002 000E 0007 0001
        DECLE   $003C,  $0074,  $004C,  $00C8   ; 6595   003C 0074 004C 00C8
        DECLE   $0008,  $0018,  $0000,  $0000   ; 6599   0008 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; 659D   0000 0000 0000 0002
        DECLE   $0002,  $0000,  $0002,  $0024   ; 65A1   0002 0000 0002 0024
        DECLE   $007E,  $005E,  $00DE,  $0013   ; 65A5   007E 005E 00DE 0013
        DECLE   $0030,  $0000,  $0000,  $0000   ; 65A9   0030 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65AD   0000 0000 0000 0000
        DECLE   $0004,  $0004,  $0000,  $000E   ; 65B1   0004 0004 0000 000E
        DECLE   $0012,  $00BD,  $00D9,  $0018   ; 65B5   0012 00BD 00D9 0018
        DECLE   $0030,  $0000,  $0000,  $0000   ; 65B9   0030 0000 0000 0000
        DECLE   $0000,  $0000,  $0009,  $0009   ; 65BD   0000 0000 0009 0009
        DECLE   $0006,  $001C,  $002C,  $0040   ; 65C1   0006 001C 002C 0040
        DECLE   $001C,  $002C,  $0048,  $00CE   ; 65C5   001C 002C 0048 00CE
        DECLE   $0002,  $0000,  $0000,  $0000   ; 65C9   0002 0000 0000 0000
        DECLE   $0000,  $0010,  $0010,  $0008   ; 65CD   0000 0010 0010 0008
        DECLE   $003E,  $005A,  $0040,  $0058   ; 65D1   003E 005A 0040 0058
        DECLE   $0038,  $0030,  $0028,  $0066   ; 65D5   0038 0030 0028 0066
        DECLE   $006C,  $000C,  $0020,  $0020   ; 65D9   006C 000C 0020 0020
        DECLE   $0010,  $0018,  $0008,  $001C   ; 65DD   0010 0018 0008 001C
        DECLE   $0014,  $001F,  $000D,  $0028   ; 65E1   0014 001F 000D 0028
        DECLE   $0026,  $0042,  $0000,  $0000   ; 65E5   0026 0042 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0021   ; 65E9   0000 0000 0010 0021
        DECLE   $0032,  $00B4,  $00B8,  $0039   ; 65ED   0032 00B4 00B8 0039
        DECLE   $002A,  $000C,  $0020,  $0000   ; 65F1   002A 000C 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65F5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0014,  $0000   ; 65F9   0000 0000 0014 0000
        DECLE   $0014,  $0014,  $001C,  $0030   ; 65FD   0014 0014 001C 0030
        DECLE   $0030,  $0060,  $00F8,  $0070   ; 6601   0030 0060 00F8 0070
        DECLE   $0000,  $0020,  $0020,  $0000   ; 6605   0000 0020 0020 0000
        DECLE   $0000,  $0000,  $0044,  $0060   ; 6609   0000 0000 0044 0060
        DECLE   $0014,  $0018,  $0010,  $0020   ; 660D   0014 0018 0010 0020
        DECLE   $0030,  $0030,  $0018,  $001A   ; 6611   0030 0030 0018 001A
        DECLE   $000A,  $0038,  $0000,  $0000   ; 6615   000A 0038 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6619   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0004   ; 661D   0000 0000 0004 0004
        DECLE   $0000,  $000E,  $000A,  $000D   ; 6621   0000 000E 000A 000D
        DECLE   $001D,  $00BC,  $00CD,  $0018   ; 6625   001D 00BC 00CD 0018
        DECLE   $0030,  $0000,  $0000,  $0004   ; 6629   0030 0000 0000 0004
        DECLE   $0004,  $0000,  $0004,  $003E   ; 662D   0004 0000 0004 003E
        DECLE   $000D,  $001D,  $0038,  $0028   ; 6631   000D 001D 0038 0028
        DECLE   $0028,  $0028,  $0000,  $0028   ; 6635   0028 0028 0000 0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6639   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 663D   0000 0000 0000 0000
        DECLE   $001C,  $0000                   ; 6641   001C 0000
L_6643:
        PSHR    R5                              ; 6643   0275

        JSR     R5,     X_PLAY_SFX1             ; 6644   0004 0118 03BB
        DECLE   $0040,  $0028                   ; 6647  SFX data
        DECLE   $0048,  $002B                   ; 6649  SFX data
        DECLE   $0044,  $002E                   ; 664B  SFX data
        DECLE   $010D                           ; 664D  SFX data
        DECLE   $005B                           ; 664E  SFX data
        DECLE   $000C,  $0100                   ; 664F  SFX data
        DECLE   $0209                           ; 6651  SFX data
        DECLE   $000B                           ; 6652  SFX data
        DECLE   $03CF                           ; 6653  SFX end

L_6654:
        PSHR    R5                              ; 6654   0275
        CLRR    R0                              ; 6655   01C0

        JSR     R5,     X_PLAY_SFX1             ; 6656   0004 0118 03BB
        DECLE   $0040,  $0020                   ; 6659  SFX data
        DECLE   $0048,  $0022                   ; 665B  SFX data
        DECLE   $0044,  $0025                   ; 665D  SFX data
        DECLE   $030D                           ; 665F  SFX data
        DECLE   $0003,  $03B0                   ; 6660  SFX data
        DECLE   $0275                           ; 6662  SFX data
        DECLE   $0004,  $0118                   ; 6663  SFX data
        DECLE   $03BB                           ; 6665  SFX data
        DECLE   $0389                           ; 6666  SFX data
        DECLE   $03C0,  $01C0                   ; 6667  SFX data
        DECLE   $03D8,  $0000                   ; 6669  SFX data
        DECLE   $03D4,  $0200                   ; 666B  SFX data
        DECLE   $03BE                           ; 666D  SFX data
        DECLE   $0001,  $01E3                   ; 666E  SFX data
        DECLE   $03AB                           ; 6670  SFX data
        DECLE   $02CF                           ; 6671  SFX end

L_6672:
        PSHR    R5                              ; 6672   0275

        JSR     R5,     X_PLAY_SFX1             ; 6673   0004 0118 03BB
        DECLE   $0279                           ; 6676  SFX data
        DECLE   $000C,  $0100                   ; 6677  SFX data
        DECLE   $010D                           ; 6679  SFX data
        DECLE   $0035                           ; 667A  SFX data
        DECLE   $006E                           ; 667B  SFX data
        DECLE   $02EB                           ; 667C  SFX data
        DECLE   $03AE                           ; 667D  SFX data
        DECLE   $02EB                           ; 667E  SFX data
        DECLE   $02CF                           ; 667F  SFX end

        DECLE   $0008,  $0008,  $0008,  $000A   ; 6680   0008 0008 0008 000A
        DECLE   $000C,  $0000,  $000C,  $0008   ; 6684   000C 0000 000C 0008
        DECLE   $0008,  $0008,  $0008,  $0004   ; 6688   0008 0008 0008 0004
        DECLE   $0008,  $0008,  $0008,  $0006   ; 668C   0008 0008 0008 0006
        DECLE   $0004,  $0000,  $0008,  $0009   ; 6690   0004 0000 0008 0009
        DECLE   $000A,  $000B,  $000E,  $0000   ; 6694   000A 000B 000E 0000
        DECLE   $000C,  $0008,  $0008,  $0008   ; 6698   000C 0008 0008 0008
        DECLE   $0007,  $0004,  $0008,  $0007   ; 669C   0007 0004 0008 0007
        DECLE   $0006,  $0005,  $0002,  $0000   ; 66A0   0006 0005 0002 0000
        DECLE   $0008,  $0008,  $0008,  $000A   ; 66A4   0008 0008 0008 000A
        DECLE   $000C,  $0000,  $0004,  $0006   ; 66A8   000C 0000 0004 0006
        DECLE   $000A,  $0007,  $0009,  $000C   ; 66AC   000A 0007 0009 000C
        DECLE   $0008,  $0008,  $0008,  $0006   ; 66B0   0008 0008 0008 0006
        DECLE   $0004,  $0000,  $0008,  $000A   ; 66B4   0004 0000 0008 000A
        DECLE   $000A,  $000A,  $000E,  $0000   ; 66B8   000A 000A 000E 0000
        DECLE   $000C,  $000A,  $000A,  $0009   ; 66BC   000C 000A 000A 0009
        DECLE   $0007,  $0004,  $0008,  $0008   ; 66C0   0007 0004 0008 0008
        DECLE   $0008,  $0007,  $0004,  $0000   ; 66C4   0008 0007 0004 0000
L_66C8:
        CLRR    R1                              ; 66C8   01C9

        JSR     R5,     L_5877                  ; 66C9   0004 0158 0077

        PULR    R7                              ; 66CC   02B7

L_66CD:
        PSHR    R5                              ; 66CD   0275
        MVI     G_019D, R5                      ; 66CE   0285 019D
        ANDI    #$0002, R5                      ; 66D0   03BD 0002
        BNEQ    L_686D                          ; 66D2   020C 0199

        MVI     G_01BD, R5                      ; 66D4   0285 01BD
        TSTR    R5                              ; 66D6   00AD
        BNEQ    L_66DD                          ; 66D7   020C 0004

        MVII    #$0004, R5                      ; 66D9   02BD 0004
        MVO     R5,     G_011E                  ; 66DB   0245 011E
L_66DD:
        MOVR    R3,     R0                      ; 66DD   0098
        MVI     G_01A3, R4                      ; 66DE   0284 01A3
        SUBI    #$0007, R4                      ; 66E0   033C 0007
        BEQ     L_679F                          ; 66E2   0204 00BB

        INCR    R4                              ; 66E4   000C
        BEQ     L_66C8                          ; 66E5   0224 001E

        MVI     G_01A3, R4                      ; 66E7   0284 01A3
        CMPR    R3,     R4                      ; 66E9   015C
        BNEQ    L_679F                          ; 66EA   020C 00B3

        MOVR    R3,     R0                      ; 66EC   0098
        PSHR    R0                              ; 66ED   0270

        JSR     R5,     L_6895                  ; 66EE   0004 0168 0095

        MVO     R4,     G_01C2                  ; 66F1   0244 01C2
        MVI     G_01C6, R0                      ; 66F3   0280 01C6

        JSR     R5,     L_6708                  ; 66F5   0004 0164 0308

        TSTR    R0                              ; 66F8   0080
        SLR     R2,     2                       ; 66F9   0066
        TSTR    R2                              ; 66FA   0092
        SLR     R2,     2                       ; 66FB   0066
        TSTR    R2                              ; 66FC   0092
        SLR     R2,     2                       ; 66FD   0066
        TSTR    R4                              ; 66FE   00A4
        SLR     R2,     2                       ; 66FF   0066
        TSTR    R0                              ; 6700   0080
        SLR     R2,     2                       ; 6701   0066
        TSTR    R2                              ; 6702   0092
        SLR     R2,     2                       ; 6703   0066
        TSTR    R0                              ; 6704   0080
        SLR     R2,     2                       ; 6705   0066
        TSTR    R6                              ; 6706   00B6
        SLR     R2,     2                       ; 6707   0066
L_6708:
        SLL     R0,     1                       ; 6708   0048
        ADDR    R0,     R5                      ; 6709   00C5
        SDBD                                    ; 670A   0001
        MVI@    R5,     R1                      ; 670B   02A9
        ADDR    R4,     R1                      ; 670C   00E1
        MVI@    R1,     R1                      ; 670D   0289
        PULR    R0                              ; 670E   02B0
        PSHR    R0                              ; 670F   0270
        TSTR    R0                              ; 6710   0080
        BNEQ    L_6728                          ; 6711   020C 0015

        JSR     R5,     L_6726                  ; 6713   0004 0164 0326
        DECLE   $0008,  $0007,  $0006,  $0005   ; 6716   0008 0007 0006 0005
        DECLE   $0004,  $0003,  $0002,  $0001   ; 671A   0004 0003 0002 0001
        DECLE   $0000                           ; 671E   0000

        INCR    R7                              ; 671F   000F

        INCR    R6                              ; 6720   000E
L_6721:
        INCR    R5                              ; 6721   000D
        INCR    R4                              ; 6722   000C
        INCR    R3                              ; 6723   000B
        INCR    R2                              ; 6724   000A
        INCR    R1                              ; 6725   0009
L_6726:
        ADDR    R1,     R5                      ; 6726   00CD
        MVI@    R5,     R1                      ; 6727   02A9

L_6728:
        JSR     R5,     L_6870                  ; 6728   0004 0168 0070

        DECR    R2                              ; 672B   0012
        DECR    R4                              ; 672C   0014
        DECR    R6                              ; 672D   0016
        COMR    R0                              ; 672E   0018
        MOVR    R5,     R0                      ; 672F   00A8

        JSR     R5,     L_586A                  ; 6730   0004 0158 006A

        MVI     G_01C2, R0                      ; 6733   0280 01C2

        JSR     R5,     L_674A                  ; 6735   0004 0164 034A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6738   0000 0000 0000 0000
        DECLE   $000F,  $0000,  $0000,  $0000   ; 673C   000F 0000 0000 0000
        DECLE   $0000,  $0004,  $0032,  $0000   ; 6740   0000 0004 0032 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6744   0000 0000 0000 0000

        INCR    R7                              ; 6748   000F

        DECLE   $0000                           ; 6749   0000
L_674A:
        ADDR    R0,     R5                      ; 674A   00C5
        MVI@    R5,     R1                      ; 674B   02A9
        TSTR    R1                              ; 674C   0089
        BEQ     L_686D                          ; 674D   0204 011E

        MVII    #$0008, R0                      ; 674F   02B8 0008

        JSR     R5,     X_RAND1                 ; 6751   0004 0114 027D

        CMPR    R0,     R1                      ; 6754   0141
        BGE     L_686D                          ; 6755   020D 0116

        MVI     G_01A3, R0                      ; 6757   0280 01A3

        JSR     R5,     .EXEC.772               ; 6759   0004 0114 0372

        SUBI    #$003F, R3                      ; 675C   033B 003F
        TSTR    R0                              ; 675E   0080
        BNEQ    L_6765                          ; 675F   020C 0004

        SUBI    #$0082, R2                      ; 6761   033A 0082
        B       L_6767                          ; 6763   0200 0002

L_6765:
        SUBI    #$0026, R2                      ; 6765   033A 0026
L_6767:
        MOVR    R3,     R1                      ; 6767   0099
        MOVR    R2,     R0                      ; 6768   0090
        NEGR    R0                              ; 6769   0020
        NEGR    R1                              ; 676A   0021
        TSTR    R2                              ; 676B   0092
        BPL     L_676F                          ; 676C   0203 0001

        NEGR    R2                              ; 676E   0022
L_676F:
        CMPI    #$0028, R2                      ; 676F   037A 0028
        BGE     L_686D                          ; 6771   020D 00FA

        TSTR    R3                              ; 6773   009B
        BPL     L_6777                          ; 6774   0203 0001

        NEGR    R3                              ; 6776   0023
L_6777:
        CMPI    #$0004, R2                      ; 6777   037A 0004
        BGT     L_6789                          ; 6779   020E 000E

        CMPI    #$0003, R3                      ; 677B   037B 0003
        BGT     L_6789                          ; 677D   020E 000A

        CLRR    R1                              ; 677F   01C9
        MVI     G_01A3, R3                      ; 6780   0283 01A3
        TSTR    R3                              ; 6782   009B
        BNEQ    L_6797                          ; 6783   020C 0012

        MVII    #$0008, R3                      ; 6785   02BB 0008
        B       L_6797                          ; 6787   0200 000E

L_6789:
        JSR     R5,     .EXEC.A2F               ; 6789   0004 0118 022F

        MOVR    R1,     R5                      ; 678C   008D
        ANDI    #$0007, R5                      ; 678D   03BD 0007
        SUBI    #$0003, R5                      ; 678F   033D 0003
        BMI     L_6797                          ; 6791   020B 0004

        CMPI    #$0002, R5                      ; 6793   037D 0002
        BLE     L_686D                          ; 6795   0206 00D6

L_6797:
        CLRR    R2                              ; 6797   01D2
        MVI     G_01A3, R3                      ; 6798   0283 01A3
        MOVR    R3,     R0                      ; 679A   0098

        JSR     R5,     L_5A9B                  ; 679B   0004 0158 029B

        PULR    R7                              ; 679E   02B7

L_679F:
        MOVR    R0,     R1                      ; 679F   0081
        SLL     R1,     2                       ; 67A0   004D
        SLL     R1,     1                       ; 67A1   0049
        ADDI    #$0161, R1                      ; 67A2   02F9 0161
        MVI@    R1,     R1                      ; 67A4   0289
        TSTR    R1                              ; 67A5   0089
        BEQ     L_67C1                          ; 67A6   0204 0019

        MOVR    R0,     R1                      ; 67A8   0081
        MVII    #$0008, R0                      ; 67A9   02B8 0008

        JSR     R5,     X_RAND1                 ; 67AB   0004 0114 027D

        PSHR    R0                              ; 67AE   0270
        MOVR    R1,     R0                      ; 67AF   0088

        JSR     R5,     L_6870                  ; 67B0   0004 0168 0070
        DECLE   $0000,  $0000                   ; 67B3   0000 0000

        EIS                                     ; 67B5   0002
        INCR    R2                              ; 67B6   000A
        PULR    R0                              ; 67B7   02B0
        TSTR    R5                              ; 67B8   00AD
        BEQ     L_686D                          ; 67B9   0204 00B2

        CMPR    R5,     R0                      ; 67BB   0168
        BGE     L_686D                          ; 67BC   020D 00AF
        J       L_5CF8                          ; 67BE   0004 035C 00F8

L_67C1:
        JSR     R5,     .EXEC.772               ; 67C1   0004 0114 0372

        MVII    #$0007, R4                      ; 67C4   02BC 0007
        SUBI    #$0002, R3                      ; 67C6   033B 0002

        JSR     R5,     L_6078                  ; 67C8   0004 0160 0078

        ADDI    #$0002, R3                      ; 67CB   02FB 0002
        PSHR    R0                              ; 67CD   0270
        PSHR    R5                              ; 67CE   0275
        MVI     G_0359, R0                      ; 67CF   0280 0359

        JSR     R5,     X_UNPK_BYTES            ; 67D1   0004 0114 0357
        JSR     R5,     L_608F                  ; 67D4   0004 0160 008F

        PULR    R1                              ; 67D7   02B1
        PULR    R0                              ; 67D8   02B0
        CMPI    #$000A, R4                      ; 67D9   037C 000A
        BLE     L_67F0                          ; 67DB   0206 0013

        SUBR    R5,     R1                      ; 67DD   0129
        ANDI    #$000F, R1                      ; 67DE   03B9 000F
        BEQ     L_67EF                          ; 67E0   0204 000D

        MVII    #$0004, R4                      ; 67E2   02BC 0004
        CMPI    #$000C, R1                      ; 67E4   0379 000C
        BLT     L_67E9                          ; 67E6   0205 0001

        ADDR    R4,     R5                      ; 67E8   00E5
L_67E9:
        CMPR    R4,     R1                      ; 67E9   0161
        BGT     L_67F3                          ; 67EA   020E 0007

        SUBR    R4,     R5                      ; 67EC   0125
        B       L_67F3                          ; 67ED   0200 0004

L_67EF:
        MOVR    R5,     R1                      ; 67EF   00A9
L_67F0:
        ADDI    #$0008, R1                      ; 67F0   02F9 0008
        INCR    R7                              ; 67F2   000F

L_67F3:
        MOVR    R5,     R1                      ; 67F3   00A9
L_67F4:
        PSHR    R0                              ; 67F4   0270

        JSR     R5,     L_6870                  ; 67F5   0004 0168 0070

        DECR    R3                              ; 67F8   0013
        DECR    R5                              ; 67F9   0015
L_67FA:
        DECR    R7                              ; 67FA   0017

        COMR    R1                              ; 67FB   0019
        MOVR    R5,     R0                      ; 67FC   00A8

        JSR     R5,     L_586A                  ; 67FD   0004 0158 006A

        MOVR    R0,     R4                      ; 6800   0084
        XORI    #$0001, R4                      ; 6801   03FC 0001
L_6803:
        PSHR    R4                              ; 6803   0274

        JSR     R5,     .EXEC.772               ; 6804   0004 0114 0372

        PULR    R4                              ; 6807   02B4

        JSR     R5,     L_687D                  ; 6808   0004 0168 007D

        CMPI    #$0004, R5                      ; 680B   037D 0004
        BGE     L_6860                          ; 680D   020D 0051

        CMPI    #$0005, R1                      ; 680F   0379 0005
        BGE     L_6860                          ; 6811   020D 004D

        MVI     G_01A3, R3                      ; 6813   0283 01A3
        MOVR    R0,     R1                      ; 6815   0081
        ADDI    #$01B7, R1                      ; 6816   02F9 01B7
        MVI@    R1,     R1                      ; 6818   0289
        TSTR    R1                              ; 6819   0089
        BEQ     L_6828                          ; 681A   0204 000C

        JSR     R5,     L_6870                  ; 681C   0004 0168 0070
        DECLE   $0000,  $0000                   ; 681F   0000 0000

        SETC                                    ; 6821   0007
        COMR    R1                              ; 6822   0019
        CMPR    R3,     R4                      ; 6823   015C
        BNEQ    L_6860                          ; 6824   020C 003A
        B       L_684E                          ; 6826   0200 0026

L_6828:
        CMPI    #$0002, R4                      ; 6828   037C 0002
        BLT     L_6838                          ; 682A   0205 000C

        JSR     R5,     L_6870                  ; 682C   0004 0168 0070
        DECLE   $0000,  $0000,  $0000           ; 682F   0000 0000 0000

        EIS                                     ; 6832   0002
        TSTR    R5                              ; 6833   00AD
        BEQ     L_6860                          ; 6834   0204 002A
        B       L_684E                          ; 6836   0200 0016

L_6838:
        CMPR    R3,     R4                      ; 6838   015C
        BNEQ    L_6847                          ; 6839   020C 000C

        JSR     R5,     L_6870                  ; 683B   0004 0168 0070
        DECLE   $0000,  $0000                   ; 683E   0000 0000

        DIS                                     ; 6840   0003
        INCR    R4                              ; 6841   000C
        TSTR    R5                              ; 6842   00AD
        BEQ     L_6860                          ; 6843   0204 001B
        B       L_684E                          ; 6845   0200 0007

L_6847:
        JSR     R5,     L_6870                  ; 6847   0004 0168 0070
        DECLE   $0000                           ; 684A   0000

        EIS                                     ; 684B   0002
        INCR    R6                              ; 684C   000E
        NEGR    R3                              ; 684D   0023
L_684E:
        PSHR    R0                              ; 684E   0270
        MVII    #$0008, R0                      ; 684F   02B8 0008
        MOVR    R5,     R1                      ; 6851   00A9

        JSR     R5,     X_RAND1                 ; 6852   0004 0114 027D

        CMPR    R1,     R0                      ; 6855   0148
        PULR    R0                              ; 6856   02B0
        BGE     L_6860                          ; 6857   020D 0007

        CLRR    R1                              ; 6859   01C9
        MVII    #$0001, R2                      ; 685A   02BA 0001
        MOVR    R0,     R3                      ; 685C   0083
        J       L_5A9B                          ; 685D   0004 0358 029B

L_6860:
        CMPI    #$0005, R4                      ; 6860   037C 0005
        BGE     L_686D                          ; 6862   020D 0009

        ADDI    #$0002, R4                      ; 6864   02FC 0002
        MVII    #$01B7, R1                      ; 6866   02B9 01B7
        ADDR    R0,     R1                      ; 6868   00C1
        MVI@    R1,     R1                      ; 6869   0289
        TSTR    R1                              ; 686A   0089
        BEQ     L_6803                          ; 686B   0224 0069
L_686D:
        PULR    R7                              ; 686D   02B7

L_686E:
        MVI     G_01C2, R0                      ; 686E   0280 01C2
L_6870:
        ADDI    #$0004, R5                      ; 6870   02FD 0004
        PSHR    R5                              ; 6872   0275
        SUBI    #$0004, R5                      ; 6873   033D 0004
        PSHR    R4                              ; 6875   0274
        MVII    #$01C0, R4                      ; 6876   02BC 01C0
        ADDR    R0,     R4                      ; 6878   00C4
        ADD@    R4,     R5                      ; 6879   02E5
        MVI@    R5,     R5                      ; 687A   02AD
        PULR    R4                              ; 687B   02B4
        PULR    R7                              ; 687C   02B7

L_687D:
        PSHR    R5                              ; 687D   0275
        PSHR    R0                              ; 687E   0270
        PSHR    R4                              ; 687F   0274
        PSHR    R2                              ; 6880   0272
        PSHR    R3                              ; 6881   0273
        MOVR    R4,     R0                      ; 6882   00A0

        JSR     R5,     .EXEC.772               ; 6883   0004 0114 0372

        MOVR    R2,     R1                      ; 6886   0091
        MOVR    R3,     R5                      ; 6887   009D
        PULR    R3                              ; 6888   02B3
        PULR    R2                              ; 6889   02B2
        SUBR    R3,     R5                      ; 688A   011D
        BPL     L_688E                          ; 688B   0203 0001

        NEGR    R5                              ; 688D   0025
L_688E:
        SUBR    R2,     R1                      ; 688E   0111
        BPL     L_6892                          ; 688F   0203 0001

        NEGR    R1                              ; 6891   0021
L_6892:
        PULR    R4                              ; 6892   02B4
        PULR    R0                              ; 6893   02B0
        PULR    R7                              ; 6894   02B7

L_6895:
        PSHR    R5                              ; 6895   0275

        JSR     R5,     .EXEC.772               ; 6896   0004 0114 0372

        MOVR    R3,     R1                      ; 6899   0099
        NEGR    R1                              ; 689A   0021
        CLRR    R4                              ; 689B   01E4
        TSTR    R0                              ; 689C   0080
        BNEQ    L_68A4                          ; 689D   020C 0005

        MVII    #$0005, R4                      ; 689F   02BC 0005
        MVII    #$0001, R0                      ; 68A1   02B8 0001
        NEGR    R0                              ; 68A3   0020
L_68A4:
        MOVR    R1,     R5                      ; 68A4   008D
        ADDR    R2,     R5                      ; 68A5   00D5
        ADDR    R2,     R5                      ; 68A6   00D5
        ADDR    R2,     R5                      ; 68A7   00D5
        CMPI    #$0158, R5                      ; 68A8   037D 0158
        BGE     L_68C8                          ; 68AA   020D 001C

        ADDR    R0,     R4                      ; 68AC   00C4
        ADDR    R2,     R5                      ; 68AD   00D5
        CMPI    #$0176, R5                      ; 68AE   037D 0176
        BGE     L_68C8                          ; 68B0   020D 0016

        ADDR    R0,     R4                      ; 68B2   00C4
        CMPI    #$0054, R2                      ; 68B3   037A 0054
        BGE     L_68C8                          ; 68B5   020D 0011

        ADDR    R0,     R4                      ; 68B7   00C4
        MOVR    R3,     R5                      ; 68B8   009D
        ADDR    R2,     R5                      ; 68B9   00D5
        ADDR    R2,     R5                      ; 68BA   00D5
        ADDR    R2,     R5                      ; 68BB   00D5
        ADDR    R2,     R5                      ; 68BC   00D5
        CMPI    #$012A, R5                      ; 68BD   037D 012A
        BGE     L_68C8                          ; 68BF   020D 0007

        ADDR    R0,     R4                      ; 68C1   00C4
        SUBR    R2,     R5                      ; 68C2   0115
        CMPI    #$00A8, R5                      ; 68C3   037D 00A8
        BGE     L_68C8                          ; 68C5   020D 0001

        ADDR    R0,     R4                      ; 68C7   00C4
L_68C8:
        CMPI    #$003A, R3                      ; 68C8   037B 003A
        BLT     L_686D                          ; 68CA   0225 005E

        ADDI    #$0006, R4                      ; 68CC   02FC 0006
        CMPI    #$0048, R3                      ; 68CE   037B 0048
        BLE     L_686D                          ; 68D0   0226 0064

        ADDI    #$0006, R4                      ; 68D2   02FC 0006
        PULR    R7                              ; 68D4   02B7
        PULR    R7                              ; 68D5   02B7

L_68D6:
        PSHR    R5                              ; 68D6   0275
        SDBD                                    ; 68D7   0001
        MVII    #$69D0, R1                      ; 68D8   02B9 00D0 0069
        TSTR    R0                              ; 68DB   0080
        BEQ     L_68E2                          ; 68DC   0204 0004

        SDBD                                    ; 68DE   0001
        MVII    #$6ABB, R1                      ; 68DF   02B9 00BB 006A
L_68E2:
        MVO     R1,     G_0317                  ; 68E2   0241 0317
        SDBD                                    ; 68E4   0001
        MVII    #$69A5, R0                      ; 68E5   02B8 00A5 0069
        MVO     R0,     G_0318                  ; 68E8   0240 0318
        CLRR    R0                              ; 68EA   01C0
        MVO     R0,     G_01C3                  ; 68EB   0240 01C3
        MVO     R0,     G_01C2                  ; 68ED   0240 01C2

        JSR     R5,     L_54DC                  ; 68EF   0004 0154 00DC

        MVII    #$0028, R0                      ; 68F2   02B8 0028
        CLRR    R4                              ; 68F4   01E4

        JSR     R5,     X_FILL_ZERO             ; 68F5   0004 0114 0338

        MVII    #$00F0, R0                      ; 68F8   02B8 00F0
        MVII    #$0200, R4                      ; 68FA   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 68FC   0004 0114 0338

        EIS                                     ; 68FF   0002

        JSR     R5,     L_54DC                  ; 6900   0004 0154 00DC

        MVII    #$0000, R1                      ; 6903   02B9 0000
        MVII    #$0028, R5                      ; 6905   02BD 0028
        MVO@    R1,     R5                      ; 6907   0269
        MVO@    R1,     R5                      ; 6908   0269
        MVO@    R1,     R5                      ; 6909   0269
        MVO@    R1,     R5                      ; 690A   0269
        MVO@    R1,     R5                      ; 690B   0269
        MVO     R1,     .STIC.VDLY              ; 690C   0241 0031
        MVO     R1,     .STIC.HDLY              ; 690E   0241 0030
        MVI     .STIC.MODE,R0                   ; 6910   0280 0021
        MVO     R0,     .STIC.VIDEN             ; 6912   0240 0020

        JSR     R5,     L_54EC                  ; 6914   0004 0154 00EC
        DECLE   $003C,  $0069                   ; 6917   003C 0069

        EIS                                     ; 6919   0002
        CLRR    R0                              ; 691A   01C0
        MVO     R0,     G_01A3                  ; 691B   0240 01A3
L_691D:
        MVI     G_01A3, R0                      ; 691D   0280 01A3
        TSTR    R0                              ; 691F   0080
        BEQ     L_691D                          ; 6920   0224 0004

        CMPI    #$0002, R0                      ; 6922   0378 0002
        BEQ     L_6939                          ; 6924   0204 0013

        CLRR    R0                              ; 6926   01C0
        MVO     R0,     G_01A3                  ; 6927   0240 01A3
L_6929:
        MVI     .PSG0.rgt_hand,R0               ; 6929   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 692B   0380 01FF
        CMPI    #$00FF, R0                      ; 692D   0378 00FF
        BEQ     L_6929                          ; 692F   0224 0007

L_6931:
        MVI     .PSG0.rgt_hand,R0               ; 6931   0280 01FE
        AND     .PSG0.lft_hand,R0               ; 6933   0380 01FF
        CMPI    #$00FF, R0                      ; 6935   0378 00FF
        BNEQ    L_6931                          ; 6937   022C 0007
L_6939:
        J       X_RESET                         ; 6939   0004 0310 0000

        PSHR    R5                              ; 693C   0275
        MVII    #$0002, R0                      ; 693D   02B8 0002
        MVO     R0,     .STIC.EDGE              ; 693F   0240 0032
        MVO     R0,     .STIC.VIDEN             ; 6941   0240 0020
        MVI     G_01C3, R0                      ; 6943   0280 01C3
        DECR    R0                              ; 6945   0010
        MVO     R0,     G_01C3                  ; 6946   0240 01C3
        BPL     L_699C                          ; 6948   0203 0052

        MVII    #$0001, R0                      ; 694A   02B8 0001
        MVO     R0,     G_01C3                  ; 694C   0240 01C3
        MVI     G_01C2, R0                      ; 694E   0280 01C2
        DECR    R0                              ; 6950   0010
        MVO     R0,     G_01C2                  ; 6951   0240 01C2
        MVO     R0,     .STIC.VDLY              ; 6953   0240 0031
        BPL     L_699C                          ; 6955   0203 0045

        MVII    #$0007, R0                      ; 6957   02B8 0007
        MVO     R0,     G_01C2                  ; 6959   0240 01C2
        MVII    #$0214, R4                      ; 695B   02BC 0214
        MVII    #$0200, R5                      ; 695D   02BD 0200
        MVII    #$000B, R2                      ; 695F   02BA 000B
L_6961:
        MVII    #$0014, R3                      ; 6961   02BB 0014
L_6963:
        MVI@    R4,     R0                      ; 6963   02A0
        MVO@    R0,     R5                      ; 6964   0268
        DECR    R3                              ; 6965   0013
        BNEQ    L_6963                          ; 6966   022C 0004

        DECR    R2                              ; 6968   0012
        BNEQ    L_6961                          ; 6969   022C 0009

        MVII    #$0014, R3                      ; 696B   02BB 0014
L_696D:
        MVO@    R2,     R5                      ; 696D   026A
        DECR    R3                              ; 696E   0013
        BNEQ    L_696D                          ; 696F   022C 0003

        MVI     G_0318, R5                      ; 6971   0285 0318
        MVI@    R5,     R4                      ; 6973   02AC
        CMPI    #$0001, R4                      ; 6974   037C 0001
        BLT     L_699A                          ; 6976   0205 0022
        BEQ     L_6997                          ; 6978   0204 001D

        MOVR    R4,     R0                      ; 697A   00A0
        CMPI    #$0002, R0                      ; 697B   0378 0002
        BEQ     L_6939                          ; 697D   0224 0045

        CMPI    #$0003, R0                      ; 697F   0378 0003
        BEQ     L_69A1                          ; 6981   0204 001E

        MVI@    R5,     R3                      ; 6983   02AB
        CMPI    #$002F, R3                      ; 6984   037B 002F
        BNEQ    L_698C                          ; 6986   020C 0004

        SDBD                                    ; 6988   0001
        MVII    #$1000, R3                      ; 6989   02BB 0000 0010
L_698C:
        MVI@    R5,     R0                      ; 698C   02A8
        SUBI    #$0020, R0                      ; 698D   0338 0020
        BMI     L_699A                          ; 698F   020B 0009

        SLL     R0,     2                       ; 6991   004C
        SLL     R0,     1                       ; 6992   0048
        XORR    R3,     R0                      ; 6993   01D8
        MVO@    R0,     R4                      ; 6994   0260
        B       L_698C                          ; 6995   0220 000A

L_6997:
        SDBD                                    ; 6997   0001
        MVI@    R5,     R0                      ; 6998   02A8
        MOVR    R0,     R5                      ; 6999   0085
L_699A:
        MVO     R5,     G_0318                  ; 699A   0245 0318
L_699C:
        MVII    #$0001, R0                      ; 699C   02B8 0001
        MVO     R0,     G_01A3                  ; 699E   0240 01A3
        PULR    R7                              ; 69A0   02B7

L_69A1:
        MVI     G_0317, R5                      ; 69A1   0285 0317
        B       L_699A                          ; 69A3   0220 000A

        DECLE   $0000,  $02E4,  $0003,  $0142   ; 69A5   0000 02E4 0003 0142
        DECLE   $0143,  $0144,  $0145,  $0000   ; 69A9   0143 0144 0145 0000
        DECLE   $02E1,  $0007,  $0053,  $004C   ; 69AD   02E1 0007 0053 004C
        DECLE   $0041,  $0050,  $0020,  $0053   ; 69B1   0041 0050 0020 0053
        DECLE   $0048,  $004F,  $0054,  $0021   ; 69B5   0048 004F 0054 0021
        DECLE   $0000,  $02DE,  $0006,  $0053   ; 69B9   0000 02DE 0006 0053
        DECLE   $0075,  $0070,  $0065,  $0072   ; 69BD   0075 0070 0065 0072
        DECLE   $0020,  $0050,  $0072,  $006F   ; 69C1   0020 0050 0072 006F
        DECLE   $0020,  $0048,  $006F,  $0063   ; 69C5   0020 0048 006F 0063
        DECLE   $006B,  $0065,  $0079,  $0000   ; 69C9   006B 0065 0079 0000
        DECLE   $0000,  $0000,  $0003,  $02DD   ; 69CD   0000 0000 0003 02DD
        DECLE   $0003,  $0053,  $0075,  $0070   ; 69D1   0003 0053 0075 0070
        DECLE   $0065,  $0072,  $0073,  $0074   ; 69D5   0065 0072 0073 0074
        DECLE   $0061,  $0072,  $002C,  $0000   ; 69D9   0061 0072 002C 0000
        DECLE   $02DF,  $0003,  $0044,  $0065   ; 69DD   02DF 0003 0044 0065
        DECLE   $0073,  $0069,  $0067,  $006E   ; 69E1   0073 0069 0067 006E
        DECLE   $0065,  $0072,  $002C,  $0000   ; 69E5   0065 0072 002C 0000
        DECLE   $02DF,  $0003,  $0050,  $0072   ; 69E9   02DF 0003 0050 0072
        DECLE   $006F,  $0067,  $0072,  $0061   ; 69ED   006F 0067 0072 0061
        DECLE   $006D,  $006D,  $0065,  $0072   ; 69F1   006D 006D 0065 0072
        DECLE   $003A,  $0000,  $0000,  $02E1   ; 69F5   003A 0000 0000 02E1
        DECLE   $0006,  $0052,  $0061,  $0079   ; 69F9   0006 0052 0061 0079
        DECLE   $0020,  $004B,  $0061,  $0065   ; 69FD   0020 004B 0061 0065
        DECLE   $0073,  $0074,  $006E,  $0065   ; 6A01   0073 0074 006E 0065
        DECLE   $0072,  $0000,  $0000,  $0000   ; 6A05   0072 0000 0000 0000
        DECLE   $02DD,  $0003,  $0053,  $0075   ; 6A09   02DD 0003 0053 0075
        DECLE   $0070,  $0065,  $0072,  $0020   ; 6A0D   0070 0065 0072 0020
        DECLE   $0047,  $006F,  $0061,  $006C   ; 6A11   0047 006F 0061 006C
        DECLE   $0069,  $0065,  $002C,  $0000   ; 6A15   0069 0065 002C 0000
        DECLE   $02DF,  $0003,  $0047,  $0072   ; 6A19   02DF 0003 0047 0072
        DECLE   $0061,  $0070,  $0068,  $0069   ; 6A1D   0061 0070 0068 0069
        DECLE   $0063,  $0020,  $0041,  $0072   ; 6A21   0063 0020 0041 0072
        DECLE   $0074,  $0069,  $0073,  $0074   ; 6A25   0074 0069 0073 0074
        DECLE   $003A,  $0000,  $0000,  $02E1   ; 6A29   003A 0000 0000 02E1
        DECLE   $0006,  $0043,  $006F,  $006E   ; 6A2D   0006 0043 006F 006E
        DECLE   $006E,  $0069,  $0065,  $0020   ; 6A31   006E 0069 0065 0020
        DECLE   $0047,  $006F,  $006C,  $0064   ; 6A35   0047 006F 006C 0064
        DECLE   $006D,  $0061,  $006E,  $0000   ; 6A39   006D 0061 006E 0000
        DECLE   $0000,  $0000,  $02DD,  $0003   ; 6A3D   0000 0000 02DD 0003
        DECLE   $0048,  $006F,  $0063,  $006B   ; 6A41   0048 006F 0063 006B
        DECLE   $0065,  $0079,  $0020,  $0050   ; 6A45   0065 0079 0020 0050
        DECLE   $0075,  $0063,  $006B,  $002C   ; 6A49   0075 0063 006B 002C
        DECLE   $0000,  $02DF,  $0003,  $0050   ; 6A4D   0000 02DF 0003 0050
        DECLE   $0072,  $006F,  $0064,  $0075   ; 6A51   0072 006F 0064 0075
        DECLE   $0063,  $0065,  $0072,  $003A   ; 6A55   0063 0065 0072 003A
        DECLE   $0000,  $0000,  $02E1,  $0006   ; 6A59   0000 0000 02E1 0006
        DECLE   $0044,  $0061,  $0076,  $0065   ; 6A5D   0044 0061 0076 0065
        DECLE   $0020,  $0057,  $0061,  $0072   ; 6A61   0020 0057 0061 0072
        DECLE   $0068,  $006F,  $006C,  $0000   ; 6A65   0068 006F 006C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A69   0000 0000 0000 0000
        DECLE   $02E1,  $0007,  $0053,  $004C   ; 6A6D   02E1 0007 0053 004C
        DECLE   $0041,  $0050,  $0020,  $0053   ; 6A71   0041 0050 0020 0053
        DECLE   $0048,  $004F,  $0054,  $0021   ; 6A75   0048 004F 0054 0021
        DECLE   $0000,  $02DE,  $0006,  $0053   ; 6A79   0000 02DE 0006 0053
        DECLE   $0075,  $0070,  $0065,  $0072   ; 6A7D   0075 0070 0065 0072
        DECLE   $0020,  $0050,  $0072,  $006F   ; 6A81   0020 0050 0072 006F
        DECLE   $0020,  $0048,  $006F,  $0063   ; 6A85   0020 0048 006F 0063
        DECLE   $006B,  $0065,  $0079,  $0000   ; 6A89   006B 0065 0079 0000
        DECLE   $02DE,  $0005,  $0043,  $006F   ; 6A8D   02DE 0005 0043 006F
        DECLE   $0070,  $0079,  $0072,  $0069   ; 6A91   0070 0079 0072 0069
        DECLE   $0067,  $0068,  $0074,  $0020   ; 6A95   0067 0068 0074 0020
        DECLE   $0141,  $0020,  $0031,  $0039   ; 6A99   0141 0020 0031 0039
        DECLE   $0038,  $0037,  $0020,  $0000   ; 6A9D   0038 0037 0020 0000
        DECLE   $02E1,  $0005,  $0142,  $0143   ; 6AA1   02E1 0005 0142 0143
        DECLE   $0144,  $0145,  $0020,  $0043   ; 6AA5   0144 0145 0020 0043
        DECLE   $006F,  $0072,  $0070,  $002E   ; 6AA9   006F 0072 0070 002E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB5   0000 0000 0000 0000
        DECLE   $0000,  $0002,  $0000,  $02DD   ; 6AB9   0000 0002 0000 02DD
        DECLE   $0003,  $0041,  $006D,  $0061   ; 6ABD   0003 0041 006D 0061
        DECLE   $007A,  $0065,  $0020,  $0079   ; 6AC1   007A 0065 0020 0079
        DECLE   $006F,  $0075,  $0072,  $0020   ; 6AC5   006F 0075 0072 0020
        DECLE   $0066,  $0072,  $0069,  $0065   ; 6AC9   0066 0072 0069 0065
        DECLE   $006E,  $0064,  $0073,  $0021   ; 6ACD   006E 0064 0073 0021
        DECLE   $0000,  $0001                   ; 6AD1   0000 0001

        SAR     R1,     1                       ; 6AD3   0069
        SAR     R2,     1                       ; 6AD4   006A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ADD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ECD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6FFD   0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $502E       <entry>
;;  $503A       $5032  
;;  $5064       <entry>
;;  $5087       $516C  
;;  $50B6       $50A7  
;;  $50BE       $50AB  
;;  $50C3       $50AF  
;;  $50C6       $50B4   $50BC   $50C1  
;;  $50D8       $5090   $50C9   $50D2  
;;  $50D9       $5060   $50B9  
;;  $50F8       $50BE  
;;  $5111       $50C3  
;;  $5131       $50B1  
;;  $5166       <entry>
;;  $516F       $516A  
;;  $517E       $5420   $5C56  
;;  $5187       $5069   $519A   $535B   $5477   $5C2B   $635E  
;;  $5199       $5193  
;;  $51E1       $51D1   $5324  
;;  $5234       $5230  
;;  $5248       $523C  
;;  $5252       $524F  
;;  $5271       $5262  
;;  $5277       $5273  
;;  $52AD       $524A  
;;  $52FD       $52B3  
;;  $5301       $52FB  
;;  $5328       $5305  
;;  $5333       $532B  
;;  $5348       $5345  
;;  $534D       $534A  
;;  $5370       $5358   $536E  
;;  $5371       $536F  
;;  $5391       $537B  
;;  $53D3       $5079   $51D4   $539B   $53C0   $5426  
;;  $53F3       $53BE  
;;  $544C       $5076   $538D  
;;  $5457       $546A  
;;  $546D       $6153  
;;  $546E       $546C  
;;  $547B       $5474  
;;  $5486       $5482  
;;  $548F       $5488  
;;  $5492       $6361  
;;  $54AD       $5403  
;;  $54AF       $5CF4  
;;  $54C0       $649B  
;;  $54C2       $54B0  
;;  $54C6       $54D1  
;;  $54DB       $5238   $5253   $52AF   $53AD  
;;  $54DC       $502F   $5048   $51A8   $5328   $68EF   $6900  
;;  $54EB       $54EB  
;;  $54EC       $5556   $6914  
;;  $54F6       $553D   $5548   $5553   $5566   $5571  
;;  $5503       $5524  
;;  $5588       $5590  
;;  $558C       $558D  
;;  $55A9       $505D   $534F  
;;  $55B8       $55F0  
;;  $55BA       $55C9  
;;  $55CF       $55ED  
;;  $55E9       $55DE  
;;  $55F2       $55C4  
;;  $55F8       $5352  
;;  $561A       $55BD   $55D4  
;;  $5628       $561D   $5622  
;;  $5649       $5646  
;;  $565E       $564D   $5657   $565A  
;;  $5671       $5662  
;;  $57A4       $57A2  
;;  $5818       $5A1E  
;;  $581D       $5856  
;;  $5850       $5821  
;;  $5859       $5834   $5839  
;;  $5866       $5863  
;;  $5867       $585F  
;;  $5868       $6073  
;;  $586A       $5A5D   $640D   $6730   $67FD  
;;  $5870       $642A  
;;  $5874       $586E  
;;  $5877       $5A62   $5C1F   $6016   $6434   $66C9  
;;  $588C       $5887  
;;  $5890       $61CB  
;;  $589B       $5178  
;;  $58A0       $58D8  
;;  $58B4       $58B0  
;;  $58B5       $58AB   $58AE  
;;  $58C3       $58C7  
;;  $58D2       $58B8  
;;  $58DB       $5ABA   $5BFB   $5C41  
;;  $58E1       $5B3C   $5C45   $5C94  
;;  $58E7       $5BCF   $5C8E  
;;  $58EF       $5DBC   $5DE4   $5E3E   $5EB8   $5EEC   $5F09  
;;  $58F9       $5CE6   $5CEF  
;;  $58FC       $5903  
;;  $591E       $591A  
;;  $591F       $591D  
;;  $5944       $593E  
;;  $5956       $594A   $5950  
;;  $596C       $5969  
;;  $5975       $5970  
;;  $5977       $5960   $5972  
;;  $597C       $5175  
;;  $5997       $5990  
;;  $599F       $59A1  
;;  $59A0       $599E   $59A3  
;;  $59AD       $59A7  
;;  $59B3       $59B8  
;;  $59B6       $59BA  
;;  $59B7       $59AB   $59B1  
;;  $59BE       $599A  
;;  $59D2       $598B   $59BC   $59C9  
;;  $59D4       $5985   $59B4  
;;  $59EF       $59EC  
;;  $59F8       $59D8  
;;  $59FB       $590B   $592F   $5938   $5942   $595A   $5975  
;;  $59FC       $60FB  
;;  $5A14       $5172  
;;  $5A2C       $5A25  
;;  $5A30       $5A15  
;;  $5A3F       $5A38  
;;  $5A42       $5A3D  
;;  $5A4D       $5A3F  
;;  $5A4E       $5A47  
;;  $5A61       $5A52  
;;  $5A66       $5A4F   $5A90  
;;  $5A70       $5A77  
;;  $5A72       $5A6E  
;;  $5A7C       $5A6B  
;;  $5A7D       $5A7B  
;;  $5A83       $5AA5   $5AB0   $5AEB   $5AFF   $5B09   $5C60   $5C69   $5C76  
;;  $5A88       $5A86  
;;  $5A9B       $5A93   $5A97   $5AEE   $679B   $685D  
;;  $5AD9       $5AD1  
;;  $5AE8       $5AD9  
;;  $5AF0       $5A8C   $5ACC  
;;  $5AFE       $5AF6  
;;  $5B03       $5AF9  
;;  $5B05       $5A31   $5A89   $5AC9  
;;  $5B0C       $5ABE   $5B40   $5BFF  
;;  $5B18       $5CD4   $5CD8  
;;  $5B19       $5A18  
;;  $5B1D       $5B98  
;;  $5B29       $5B1F  
;;  $5B46       $5B37  
;;  $5B60       $5B5C  
;;  $5B8F       $5B24   $5B27   $5B2C   $5B4A   $5B9D   $5BA4   $5BAF   $5BE8  
;;  $5B9B       $5B4E  
;;  $5BAC       $5BB2  
;;  $5BB4       $5BAD  
;;  $5BCC       $5BC1  
;;  $5BDC       $5BB8  
;;  $5BDF       $5BCA  
;;  $5BE0       $5BDE  
;;  $5BEA       $5BC3   $5BCC   $5BE0  
;;  $5C06       $5A2A  
;;  $5C0F       $5C0A  
;;  $5C19       $5C17  
;;  $5C1E       $5C25  
;;  $5C7E       $5A1B  
;;  $5C83       $5CA4  
;;  $5C94       $5C8C  
;;  $5C9E       $5CAE   $5CD0  
;;  $5CAD       $5C86  
;;  $5CC2       $5CBA  
;;  $5CCA       $5C92   $5CB1  
;;  $5CD2       $59C2   $5C4B  
;;  $5CE2       $5D0F  
;;  $5CF8       $5AD6   $5D12   $67BE  
;;  $5D14       $5D23   $5D3D  
;;  $5D1E       $53B4   $53B8   $5E85  
;;  $5D32       $5D26  
;;  $5D34       $5407   $5D79   $5E89  
;;  $5D36       $5D85  
;;  $5D56       $5D19   $5D4A   $5D9D   $5DA4   $5DBF   $5DC8   $5E34   $5E41  
;;  $5D56       $5E5D   $5E74   $5E7A   $5EA7   $5EAE   $5EBB  
;;  $5D57       $549B   $6150  
;;  $5D6B       $5D5D  
;;  $5D7C       $5D88  
;;  $5D82       $5D6D  
;;  $5DAE       $5DAB  
;;  $5DC1       $5DB2  
;;  $5DFE       $5DE7   $5DEE  
;;  $5E06       $5F4E  
;;  $5E1E       $5E17   $5E1B  
;;  $5E25       $5E22  
;;  $5E28       $5F44  
;;  $5E2F       $5DD7  
;;  $5E43       $5E32  
;;  $5E57       $516F  
;;  $5E8C       $5E6F  
;;  $5EB0       $5EAC  
;;  $5EC4       $5E90  
;;  $5ECB       $5EC7  
;;  $5EDD       $5EC9   $5ED5   $5EEF  
;;  $5EE4       $5EDB  
;;  $5EF2       $5E69  
;;  $5F0E       $5F1F  
;;  $5F1B       $5EF4   $5EFA  
;;  $5F21       $5F6A  
;;  $5F46       $5F32  
;;  $5F5D       $5F54  
;;  $5F61       $5EFF   $5F0C  
;;  $5F65       $5E64  
;;  $5F6D       $5E71  
;;  $5F6E       $5E96   $5F6C  
;;  $5F73       $5EA4   $5ED8  
;;  $5F74       $5F72  
;;  $5F7B       $5F76  
;;  $5F9C       $5F8B  
;;  $5F9E       $5F19   $5F9A  
;;  $5FA3       $5E2F   $5EA9   $5EC4  
;;  $5FB1       $517B  
;;  $5FBE       $5FBA  
;;  $5FE4       $5FDE  
;;  $5FE5       $5FDB  
;;  $5FFC       $5FF8  
;;  $6002       $5FFD  
;;  $600A       $5FF6  
;;  $600E       $5FFA  
;;  $6016       $6013   $6025   $60B0   $60B5   $60CD   $60D0  
;;  $601A       $600A   $600C  
;;  $6027       $6034  
;;  $603D       $5FFF   $6021  
;;  $6068       $6065  
;;  $606E       $605F  
;;  $606F       $605A  
;;  $6072       $6069   $606C  
;;  $6073       $6071   $60E0   $60E4  
;;  $6077       $5FB5   $5FC9   $5FD5   $6049  
;;  $6078       $6042   $60D3   $67C8  
;;  $608F       $5F85   $6053   $6086   $67D4  
;;  $6099       $58BF   $5DCF  
;;  $609A       $6098  
;;  $609E       $609B  
;;  $60A2       $609F  
;;  $60A7       $60A4  
;;  $60AC       $6005   $602A   $6038  
;;  $60C2       $60BD  
;;  $60D2       $60C5  
;;  $60DE       $60D9  
;;  $60DF       $60DD  
;;  $6138       $616F  
;;  $6146       $6143  
;;  $6169       $6130   $6136  
;;  $6179       $6128  
;;  $617C       $6189   $618D  
;;  $6188       $6124  
;;  $618B       $617A  
;;  $618F       $6172   $6183   $61AF  
;;  $6190       $6186   $61BE   $61C5   $61C8  
;;  $61B4       $6177  
;;  $61B5       $6175   $61B2  
;;  $61F9       $6249   $624F  
;;  $61FE       $61FB  
;;  $6208       $6205  
;;  $6209       $6200  
;;  $620F       $620B  
;;  $6210       $625B   $625E  
;;  $623F       $6220   $6226  
;;  $6243       $6235   $623D  
;;  $6248       $61F7  
;;  $624D       $61F1  
;;  $6251       $624B  
;;  $625D       $6258  
;;  $6260       $61D4  
;;  $6263       $60ED  
;;  $6264       $6262  
;;  $62B1       $6280   $6284   $6288   $628C   $6290  
;;  $62B2       $6276   $627B   $6294   $6299   $629E   $62A3   $62A8   $62AD  
;;  $62B2       $62B0  
;;  $62B4       $60EA   $61D1  
;;  $62DF       $62D0  
;;  $62EE       $62E0  
;;  $62F2       $6102   $61F3  
;;  $62F3       $62C8   $62D8  
;;  $6301       $62F6  
;;  $6302       $61CE  
;;  $630B       $60E7  
;;  $630C       $6309  
;;  $6313       <entry>
;;  $6322       $631E  
;;  $6326       $635B  
;;  $632B       $538A  
;;  $6341       $5355   $6156  
;;  $635B       $6323  
;;  $636A       $5498   $5C59   $6165   $6314  
;;  $6381       $6375  
;;  $6382       $6380  
;;  $6391       $63B1  
;;  $6393       $6385   $639A  
;;  $639C       $6396  
;;  $63CC       <entry>
;;  $63D0       $6444  
;;  $6407       $6403  
;;  $6412       $63F1  
;;  $642F       $6414  
;;  $643F       $63D3   $6410   $642D  
;;  $6447       $641E   $6425  
;;  $6452       $644C  
;;  $6453       $6450  
;;  $6454       $6471   $648E  
;;  $6461       $6475   $647F  
;;  $6470       $5C14  
;;  $647E       $5471   $54A9  
;;  $6487       $6494  
;;  $649F       $643A  
;;  $64BA       $64B6  
;;  $64C7       $64A9  
;;  $64D2       $64CD  
;;  $6544       $6544  
;;  $6643       $5B8A   $5DD9  
;;  $6654       $5926   $61A3  
;;  $6672       $5AC4  
;;  $66C8       $66E5  
;;  $66CD       $5A3A   $5A49  
;;  $66DD       $66D7  
;;  $6708       $66F5  
;;  $6721       $671F  
;;  $6726       $6713  
;;  $6728       $6711  
;;  $674A       $6735   $6748  
;;  $6765       $675F  
;;  $6767       $6763  
;;  $676F       $676C  
;;  $6777       $6774  
;;  $6789       $6779   $677D  
;;  $6797       $6783   $6787   $6791  
;;  $679F       $66E2   $66EA  
;;  $67C1       $67A6  
;;  $67E9       $67E6  
;;  $67EF       $67E0  
;;  $67F0       $67DB  
;;  $67F3       $67EA   $67ED  
;;  $67F4       $67F2  
;;  $67FA       $67FA  
;;  $6803       $686B  
;;  $6828       $681A  
;;  $6838       $682A  
;;  $6847       $6839  
;;  $684E       $6826   $6836   $6845  
;;  $6860       $680D   $6811   $6824   $6834   $6843   $6857  
;;  $686D       $66D2   $674D   $6755   $6771   $6795   $67B9   $67BC   $6862  
;;  $686D       $68CA   $68D0  
;;  $686E       $5DB4   $5DDC   $5DFE   $5E36   $5EB0   $5EE4   $5F01   $5F46  
;;  $6870       $5A55   $6728   $67B0   $67F5   $681C   $682C   $683B   $6847  
;;  $687D       $6808  
;;  $688E       $688B  
;;  $6892       $688F  
;;  $6895       $66EE  
;;  $68A4       $689D  
;;  $68C8       $68AA   $68B0   $68B5   $68BF   $68C5  
;;  $68D6       $50D5  
;;  $68E2       $68DC  
;;  $691D       $6920  
;;  $6929       $692F  
;;  $6931       $6937  
;;  $6939       $6924   $697D  
;;  $6961       $6969  
;;  $6963       $6966  
;;  $696D       $696F  
;;  $698C       $6986   $6995  
;;  $6997       $6978  
;;  $699A       $6976   $698F   $69A3  
;;  $699C       $6948   $6955  
;;  $69A1       $6981  
;; ======================================================================== ;;
