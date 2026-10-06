
        ORG     $5000
.HEADER:
        BIDECLE $55DC           ; 5000  Ptr: MOB graphic images
        BIDECLE $5017           ; 5002  Ptr: EXEC timer table
        BIDECLE $51B4           ; 5004  Ptr: Start of game
        BIDECLE $539F           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5180           ; 5008  Ptr: GRAM init sequence
        BIDECLE $502D           ; 500A  Ptr: Date/Title
        DECLE   $0092           ; 500C  Key-click / flags
        DECLE   $0002           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0007,  $0001   ; 500F  Color Stack init (0, 1)
        DECLE   $0007,  $0001   ; 5011  Color Stack init (2, 3)
        DECLE   $0001           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0           ; 5014   01F0 01E0 01D0
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 5017  Timer dispatch/interval
        DECLE   $0001,  $005F,  $0001,  $0000; 501B  Timer dispatch/interval
        DECLE   $007B,  $005D,  $0002,  $0000; 501F  Timer dispatch/interval
        DECLE   $00B9,  $005F,  $0002,  $0000; 5023  Timer dispatch/interval
        DECLE   $00E6,  $005E,  $0003,  $0000; 5027  Timer dispatch/interval
        BIDECLE $0000           ; 502B  End of timer table

.TITLE:
        DECLE   $0050                           ; 502D  Cartridge year
        STRING  "SKIING"                        ; 502E  Title string
        DECLE   $0000                           ; 5034  

.TITLECODE:
        PSHR    R5                              ; 5035   0275
        MVII    #$0039, R0                      ; 5036   02B8 0039
        CMP     .PSG0.rgt_hand,R0               ; 5038   0340 01FE
        BNEQ    L_5042                          ; 503A   020C 0006

        CMP     .PSG0.lft_hand,R0               ; 503C   0340 01FF
        BNEQ    L_5042                          ; 503E   020C 0002

        MVO     R0,     G_017A                  ; 5040   0240 017A
L_5042:
        PULR    R7                              ; 5042   02B7

        DECLE   $0010,  $0051,  $0000,  $0000   ; 5043   0010 0051 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5047   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $008C,  $0055   ; 504B   0000 0000 008C 0055
        DECLE   $0000,  $0000                   ; 504F   0000 0000

        RLC     R3,     2                       ; 5051   0057
        RLC     R0,     1                       ; 5052   0050
        SAR     R1,     1                       ; 5053   0069
        RLC     R0,     1                       ; 5054   0050
        SAR     R1,     1                       ; 5055   0069
        RLC     R0,     1                       ; 5056   0050
        TSTR    R0                              ; 5057   0080
        BPL     L_5068                          ; 5058   0203 000E

        ADDI    #$0123, R1                      ; 505A   02F9 0123
        MVI@    R1,     R2                      ; 505C   028A
        ANDI    #$00E0, R2                      ; 505D   03BA 00E0
        CMPI    #$00A0, R2                      ; 505F   037A 00A0
        BNEQ    L_5068                          ; 5061   020C 0005

        SUBI    #$0002, R1                      ; 5063   0339 0002
        NEGR    R0                              ; 5065   0020
        MVO@    R0,     R1                      ; 5066   0248
        MOVR    R5,     R7                      ; 5067   00AF
L_5068:
        MOVR    R5,     R7                      ; 5068   00AF

        DECR    R0                              ; 5069   0010
        BMI     L_5098                          ; 506A   020B 002C

        MVII    #$0072, R3                      ; 506C   02BB 0072
        MVII    #$00FB, R2                      ; 506E   02BA 00FB
        MVI     G_0160, R1                      ; 5070   0281 0160
        ADD     G_0161, R1                      ; 5072   02C1 0161
        BNEQ    L_5098                          ; 5074   020C 0022

        MVO     R1,     G_0329                  ; 5076   0241 0329
        MVO     R2,     G_0161                  ; 5078   0242 0161
        MVI     G_031D, R0                      ; 507A   0280 031D
        MVO     R0,     G_032D                  ; 507C   0240 032D
        SDBD                                    ; 507E   0001
        XORI    #$1000, R0                      ; 507F   03F8 0000 0010
        MVO     R0,     G_031D                  ; 5082   0240 031D
        MVI     G_0325, R0                      ; 5084   0280 0325
        SDBD                                    ; 5086   0001
        ANDI    #$DFFF, R0                      ; 5087   03B8 00FF 00DF
        MVO     R0,     G_0325                  ; 508A   0240 0325
        MVO     R2,     G_0331                  ; 508C   0242 0331
        MVO     R3,     G_0332                  ; 508E   0243 0332
        MVII    #$0003, R1                      ; 5090   02B9 0003
        MVO     R1,     G_032A                  ; 5092   0241 032A
        MVII    #$000A, R0                      ; 5094   02B8 000A
        MVO     R0,     G_032B                  ; 5096   0240 032B
L_5098:
        MOVR    R5,     R7                      ; 5098   00AF

        MVII    #$0004, R0                      ; 5099   02B8 0004
        MVII    #$00FC, R2                      ; 509B   02BA 00FC
        MVO     R0,     G_0329                  ; 509D   0240 0329
        DECR    R0                              ; 509F   0010
        MVO     R2,     G_0331                  ; 50A0   0242 0331
        MVO     R0,     G_0333                  ; 50A2   0240 0333
        MOVR    R5,     R7                      ; 50A4   00AF

        PSHR    R5                              ; 50A5   0275
        MVII    #$0001, R0                      ; 50A6   02B8 0001
        MVO     R0,     G_0323                  ; 50A8   0240 0323
        MVII    #$031F, R4                      ; 50AA   02BC 031F
        MVI@    R4,     R1                      ; 50AC   02A1
        SWAP    R1,     1                       ; 50AD   0041
        ANDI    #$00FF, R1                      ; 50AE   03B9 00FF
        CMPI    #$0008, R1                      ; 50B0   0379 0008
        BLT     L_50FD                          ; 50B2   0205 0049

        CMPI    #$009C, R1                      ; 50B4   0379 009C
        BGT     L_50FD                          ; 50B6   020E 0045

L_50B8:
        MVI@    R4,     R1                      ; 50B8   02A1
        SWAP    R1,     1                       ; 50B9   0041
        ANDI    #$00FF, R1                      ; 50BA   03B9 00FF
        CMPI    #$0010, R1                      ; 50BC   0379 0010
        BLT     L_5103                          ; 50BE   0205 0043

        CMPI    #$0060, R1                      ; 50C0   0379 0060
        BLT     L_510F                          ; 50C2   0205 004B

        SDBD                                    ; 50C4   0001
        MVII    #$501B, R1                      ; 50C5   02B9 001B 0050

        JSR     R5,     X_TIMER_START           ; 50C8   0004 0118 0044

        SDBD                                    ; 50CB   0001
        MVII    #$1906, R0                      ; 50CC   02B8 0006 0019
        MVO     R0,     G_035D                  ; 50CF   0240 035D
        MVII    #$015E, R4                      ; 50D1   02BC 015E
        MVII    #$001B, R0                      ; 50D3   02B8 001B

        JSR     R5,     X_FILL_ZERO             ; 50D5   0004 0114 0338

        MVII    #$031D, R4                      ; 50D8   02BC 031D
        MVII    #$0018, R0                      ; 50DA   02B8 0018

        JSR     R5,     X_FILL_ZERO             ; 50DC   0004 0114 0338

        MVII    #$018A, R4                      ; 50DF   02BC 018A
        MVII    #$0003, R0                      ; 50E1   02B8 0003

        JSR     R5,     X_FILL_ZERO             ; 50E3   0004 0114 0338

        SDBD                                    ; 50E6   0001
        MVII    #$501F, R1                      ; 50E7   02B9 001F 0050

        JSR     R5,     X_TIMER_STOP            ; 50EA   0004 0118 0038

        MVII    #$004B, R0                      ; 50ED   02B8 004B

        JSR     R5,     .EXEC.A62               ; 50EF   0004 0118 0262
        JSR     R5,     X_STOP_SFX              ; 50F2   0004 011C 02B4

        MVI     G_0188, R1                      ; 50F5   0281 0188
        DECR    R1                              ; 50F7   0011
        MVO     R1,     G_0188                  ; 50F8   0241 0188

        JSR     R5,     L_51B5                  ; 50FA   0004 0150 01B5

L_50FD:
        MVI     G_0319, R0                      ; 50FD   0280 0319
        MVO     R0,     G_031F                  ; 50FF   0240 031F
        B       L_50B8                          ; 5101   0220 004A

L_5103:
        MVI     G_031A, R0                      ; 5103   0280 031A
        SDBD                                    ; 5105   0001
        MVII    #$1000, R1                      ; 5106   02B9 0000 0010
        CMPR    R1,     R0                      ; 5109   0148
        BGE     L_510D                          ; 510A   020D 0001

        MOVR    R1,     R0                      ; 510C   0088
L_510D:
        MVO     R0,     G_0320                  ; 510D   0240 0320
L_510F:
        PULR    R7                              ; 510F   02B7

        PSHR    R5                              ; 5110   0275

        JSR     R5,     L_558C                  ; 5111   0004 0154 018C

        SDBD                                    ; 5114   0001
        MVII    #$504D, R0                      ; 5115   02B8 004D 0050
        MVO     R0,     G_035D                  ; 5118   0240 035D
        SDBD                                    ; 511A   0001
        MVII    #$501F, R1                      ; 511B   02B9 001F 0050

        JSR     R5,     X_TIMER_START           ; 511E   0004 0118 0044

        CLRR    R0                              ; 5121   01C0
        MVII    #$018F, R4                      ; 5122   02BC 018F
        MVO@    R0,     R4                      ; 5124   0260
        MVO@    R0,     R4                      ; 5125   0260

L_5126:
        JSR     R5,     X_PLAY_SFX1             ; 5126   0004 0118 03BB
        DECLE   $0079                           ; 5129  SFX data
        DECLE   $00CD                           ; 512A  SFX data
        DECLE   $01B5                           ; 512B  SFX data
        DECLE   $001D                           ; 512C  SFX data
        DECLE   $0077,  $0032,  $0051           ; 512D  SFX data
        DECLE   $0023,  $03EC                   ; 5130  SFX data
UC_5132:
        MVI     G_0161, R0                      ; 5132  SLIB UCALL target
        TSTR    R0                              ; 5134   0080
        BNEQ    L_5166                          ; 5135   020C 002F

        MVI     G_011F, R2                      ; 5137   0282 011F
        ANDI    #$00C0, R2                      ; 5139   03BA 00C0
        BEQ     L_5143                          ; 513B   0204 0006

        MVI     G_0120, R2                      ; 513D   0282 0120
        ANDI    #$00C0, R2                      ; 513F   03BA 00C0
        BNEQ    L_5147                          ; 5141   020C 0004

L_5143:
        ADD     G_0187, R2                      ; 5143   02C2 0187
        BNEQ    L_515A                          ; 5145   020C 0013

L_5147:
        MVI     G_018B, R1                      ; 5147   0281 018B
        SUB     G_018C, R1                      ; 5149   0301 018C
        BGE     L_514E                          ; 514B   020D 0001

        NEGR    R1                              ; 514D   0021
L_514E:
        CMPI    #$0018, R1                      ; 514E   0379 0018
        BLT     L_5155                          ; 5150   0205 0003

        NEGR    R1                              ; 5152   0021
        ADDI    #$0030, R1                      ; 5153   02F9 0030
L_5155:
        SLL     R1,     2                       ; 5155   004D
        ADDI    #$0040, R1                      ; 5156   02F9 0040
        B       L_5167                          ; 5158   0200 000D

L_515A:
        MVI     G_0156, R1                      ; 515A   0281 0156
        ANDI    #$007F, R1                      ; 515C   03B9 007F
        CMPI    #$0058, R1                      ; 515E   0379 0058
        BGE     L_5167                          ; 5160   020D 0005

        MVII    #$0006, R0                      ; 5162   02B8 0006
        B       L_5169                          ; 5164   0200 0003

L_5166:
        CLRR    R1                              ; 5166   01C9
L_5167:
        MVII    #$0080, R0                      ; 5167   02B8 0080
L_5169:
        MVII    #$0152, R5                      ; 5169   02BD 0152
        MVO@    R0,     R5                      ; 516B   0268
        MVO@    R0,     R5                      ; 516C   0268
        MVO@    R0,     R5                      ; 516D   0268
        INCR    R5                              ; 516E   000D
        CMPI    #$0058, R1                      ; 516F   0379 0058
        BLE     L_5175                          ; 5171   0206 0002

        MVII    #$0058, R1                      ; 5173   02B9 0058
L_5175:
        MVO@    R1,     R5                      ; 5175   0269
        MVO@    R1,     R5                      ; 5176   0269
        MVO@    R1,     R5                      ; 5177   0269
        ANDI    #$0038, R1                      ; 5178   03B9 0038
        SLL     R1,     1                       ; 517A   0049
        ADDI    #$0018, R1                      ; 517B   02F9 0018
        MVO     R1,     G_0155                  ; 517D   0241 0155
        PULR    R7                              ; 517F   02B7

.GRAM_INIT_5180:
        DECLE   $002F           ; 5180  # of GRAM cards to init
        DECLE   $0003,  $0070   ; 5181  #00-00:  GROM #01-01 ----
        DECLE   $0001,  $0010   ; 5183  #01-01:  GROM #00-00 ----
        DECLE   $027F,  $01E2   ; 5185  #02   :  Algo #1
        DECLE   $0021,  $0050   ; 5187  #03-03:  GROM #10-10 ----
        DECLE   $0043,  $0050   ; 5189  #04-04:  GROM #21-21 ----
        DECLE   $0019,  $0050   ; 518B  #05-05:  GROM #0C-0C ----
        DECLE   $0003,  $0050   ; 518D  #06-06:  GROM #01-01 ----
        DECLE   $001D,  $0050   ; 518F  #07-07:  GROM #0E-0E ----
        DECLE   $0001,  $0080   ; 5191  #08-09:  CART #00-01 ----
        DECLE   $0202           ; 5193  #0A   :  CART #01    X---
        DECLE   $001F,  $0070   ; 5194  #0B-0B:  GROM #0F-0F ----
        DECLE   $0004           ; 5196  #0C   :  CART #02    ----
        DECLE   $0204           ; 5197  #0D   :  CART #02    X---
        DECLE   $0019,  $0070   ; 5198  #0E-0E:  GROM #0C-0C ----
        DECLE   $0007,  $0080   ; 519A  #0F-10:  CART #03-04 ----
        DECLE   $0247,  $018A   ; 519C  #11   :  Algo #1
        DECLE   $000B,  $0080   ; 519E  #12-13:  CART #05-06 ----
        DECLE   $02FD,  $0052   ; 51A0  #14   :  Algo #1
        DECLE   $000F,  $0380   ; 51A2  #15-1C:  CART #07-0E ----
        DECLE   $001F,  $0300   ; 51A4  #1D-23:  CART #0F-15 ----
        DECLE   $0011,  $0070   ; 51A6  #24-24:  GROM #08-08 ----
        DECLE   $02C1,  $02D6   ; 51A8  #25   :  Algo #1
        DECLE   $02DB,  $015E   ; 51AA  #26   :  Algo #1
        DECLE   $00C5,  $035A   ; 51AC  #27   :  Algo #1
        DECLE   $0001,  $023A   ; 51AE  #28   :  Algo #1
        DECLE   $005B,  $0176   ; 51B0  #29   :  Algo #1
        DECLE   $002D,  $0200   ; 51B2  #2A-2E:  CART #16-1A ----

.START:
        PSHR    R5                              ; 51B4   0275
L_51B5:
        CLRR    R0                              ; 51B5   01C0
        MVO     R0,     G_0194                  ; 51B6   0240 0194
        MVII    #$0200, R4                      ; 51B8   02BC 0200
        MVII    #$00F0, R0                      ; 51BA   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 51BC   0004 0114 0338

        SDBD                                    ; 51BF   0001
        MVII    #$501F, R1                      ; 51C0   02B9 001F 0050

        JSR     R5,     X_TIMER_STOP            ; 51C3   0004 0118 0038

        MVII    #$001C, R0                      ; 51C6   02B8 001C
        MVII    #$0231, R4                      ; 51C8   02BC 0231
        SDBD                                    ; 51CA   0001
        MVII    #$5383, R5                      ; 51CB   02BD 0083 0053
L_51CE:
        MVI@    R5,     R1                      ; 51CE   02A9
        SLL     R1,     2                       ; 51CF   004D
        SLL     R1,     1                       ; 51D0   0049
        XORI    #$0007, R1                      ; 51D1   03F9 0007
        MVO@    R1,     R4                      ; 51D3   0261
        DECR    R0                              ; 51D4   0010
        BNEQ    L_51CE                          ; 51D5   022C 0008

        MVII    #$0008, R0                      ; 51D7   02B8 0008
        MVII    #$03A7, R1                      ; 51D9   02B9 03A7
        MVO     R1,     .BTAB.21                ; 51DB   0241 0221
        ADDR    R0,     R1                      ; 51DD   00C1
        MVO     R1,     .BTAB.22                ; 51DE   0241 0222
        MVII    #$0367, R1                      ; 51E0   02B9 0367
        MVO     R1,     .BTAB.2A                ; 51E2   0241 022A
        ADDR    R0,     R1                      ; 51E4   00C1
        MVO     R1,     .BTAB.2B                ; 51E5   0241 022B
        SDBD                                    ; 51E7   0001
        MVII    #$0539, R1                      ; 51E8   02B9 0039 0005
        MVO     R1,     .BTAB.4E                ; 51EB   0241 024E
        SDBD                                    ; 51ED   0001
        MVII    #$092F, R1                      ; 51EE   02B9 002F 0009
        MVO     R1,     .BTAB.42                ; 51F1   0241 0242
        ADDR    R0,     R1                      ; 51F3   00C1
        MVO     R1,     .BTAB.43                ; 51F4   0241 0243
        ADDR    R0,     R1                      ; 51F6   00C1
        MVO     R1,     .BTAB.47                ; 51F7   0241 0247
        ADDR    R0,     R1                      ; 51F9   00C1
        XORI    #$0007, R1                      ; 51FA   03F9 0007
        XORI    #$0001, R1                      ; 51FC   03F9 0001
        MVO     R1,     .BTAB.57                ; 51FE   0241 0257
        ADDR    R0,     R1                      ; 5200   00C1
        MVO     R1,     .BTAB.56                ; 5201   0241 0256
        ADDR    R0,     R1                      ; 5203   00C1
        MVO     R1,     .BTAB.4D                ; 5204   0241 024D
        SDBD                                    ; 5206   0001
        MVII    #$22F9, R1                      ; 5207   02B9 00F9 0022
        MVO     R1,     .BTAB.27                ; 520A   0241 0227
        ADDI    #$0098, R1                      ; 520C   02F9 0098
        MVO     R1,     .BTAB.3B                ; 520E   0241 023B
        SUBI    #$0391, R1                      ; 5210   0339 0391
        PSHR    R1                              ; 5212   0271
        XOR     .BTAB.14,R1                     ; 5213   03C1 0214
        MVO     R1,     .BTAB.14                ; 5215   0241 0214
        MVO     R1,     .BTAB.28                ; 5217   0241 0228
        PULR    R1                              ; 5219   02B1
        PSHR    R1                              ; 521A   0271
        XOR     .BTAB.3C,R1                     ; 521B   03C1 023C
        MVO     R1,     .BTAB.3C                ; 521D   0241 023C
        PULR    R1                              ; 521F   02B1
        XOR     .BTAB.4D,R1                     ; 5220   03C1 024D
        MVO     R1,     .BTAB.4D                ; 5222   0241 024D
        MVII    #$0002, R3                      ; 5224   02BB 0002
        MVI     G_015D, R0                      ; 5226   0280 015D
        TSTR    R0                              ; 5228   0080
        BEQ     L_5260                          ; 5229   0204 0035

        MVI     G_0188, R1                      ; 522B   0281 0188
        MVI     G_0189, R2                      ; 522D   0282 0189
        MVII    #$0265, R4                      ; 522F   02BC 0265
        TSTR    R1                              ; 5231   0089
        BNEQ    L_523F                          ; 5232   020C 000B

        MVO     R2,     G_0188                  ; 5234   0242 0188
L_5236:
        MVI     G_015D, R0                      ; 5236   0280 015D
        INCR    R0                              ; 5238   0008
        MVO     R0,     G_015D                  ; 5239   0240 015D
        CMPI    #$0003, R0                      ; 523B   0378 0003
        BGT     L_531A                          ; 523D   020E 00DB

L_523F:
        JSR     R5,     L_5340                  ; 523F   0004 0150 0340

        SDBD                                    ; 5242   0001
        MVII    #$0849, R0                      ; 5243   02B8 0049 0008
        MVO     R0,     .BTAB.AF                ; 5246   0240 02AF
        XORI    #$0018, R0                      ; 5248   03F8 0018
        MVO     R0,     .BTAB.AB                ; 524A   0240 02AB

        JSR     R5,     L_5D1C                  ; 524C   0004 015C 011C

        SDBD                                    ; 524F   0001
        MVII    #$5043, R0                      ; 5250   02B8 0043 0050
        MVO     R0,     G_035D                  ; 5253   0240 035D
        MVI     G_0189, R1                      ; 5255   0281 0189
        MVO     R1,     G_0323                  ; 5257   0241 0323
        SUB     G_0188, R1                      ; 5259   0301 0188
        ADD     G_031D, R1                      ; 525B   02C1 031D
        MVO     R1,     G_031D                  ; 525D   0241 031D
        PULR    R7                              ; 525F   02B7

L_5260:
        MVII    #$0279, R4                      ; 5260   02BC 0279

        JSR     R5,     X_PRINT_R5              ; 5262   0004 0118 007B
        STRING  "#SKIERS:"                      ; 5265  
        DECLE   $0000                           ; 526D   0000
L_526E:
        MVII    #$0001, R0                      ; 526E   02B8 0001
        MVII    #$0283, R1                      ; 5270   02B9 0283
        CLRR    R2                              ; 5272   01D2
        MVII    #$0004, R3                      ; 5273   02BB 0004
        SDBD                                    ; 5275   0001
        MVII    #$5375, R4                      ; 5276   02BC 0075 0053

        JSR     R5,     .EXEC.910               ; 5279   0004 0118 0110

        NEGR    R2                              ; 527C   0022
        ANDR    R0,     R2                      ; 527D   0182
        BEQ     L_5284                          ; 527E   0204 0004

        CMPI    #$0006, R0                      ; 5280   0378 0006
        BLE     L_528C                          ; 5282   0206 0008

L_5284:
        JSR     R5,     X_PLAY_RAZZ2            ; 5284   0004 011C 02BD

        CLRR    R0                              ; 5287   01C0
        MVO     R0,     .BTAB.83                ; 5288   0240 0283
        B       L_526E                          ; 528A   0220 001D

L_528C:
        MVO     R0,     G_0188                  ; 528C   0240 0188
        MVO     R0,     G_0189                  ; 528E   0240 0189
        MVII    #$0002, R3                      ; 5290   02BB 0002
        MVII    #$02A3, R4                      ; 5292   02BC 02A3

        JSR     R5,     X_PRINT_R5              ; 5294   0004 0118 007B
        STRING  "SLOPE:"                        ; 5297  
        DECLE   $0000                           ; 529D   0000
L_529E:
        MVII    #$0002, R0                      ; 529E   02B8 0002
        MVII    #$02AB, R1                      ; 52A0   02B9 02AB
        CLRR    R2                              ; 52A2   01D2
        MVII    #$0004, R3                      ; 52A3   02BB 0004
        SDBD                                    ; 52A5   0001
        MVII    #$5375, R4                      ; 52A6   02BC 0075 0053

        JSR     R5,     .EXEC.910               ; 52A9   0004 0118 0110

        TSTR    R2                              ; 52AC   0092
        BEQ     L_52B3                          ; 52AD   0204 0004

        CMPI    #$000F, R0                      ; 52AF   0378 000F
        BLE     L_52BD                          ; 52B1   0206 000A

L_52B3:
        JSR     R5,     X_PLAY_RAZZ2            ; 52B3   0004 011C 02BD

        CLRR    R0                              ; 52B6   01C0
        MVO     R0,     .BTAB.AA                ; 52B7   0240 02AA
        MVO     R0,     .BTAB.AB                ; 52B9   0240 02AB
        B       L_529E                          ; 52BB   0220 001E

L_52BD:
        ADDI    #$0003, R0                      ; 52BD   02F8 0003
        MVO     R0,     G_018E                  ; 52BF   0240 018E
        MVII    #$0002, R3                      ; 52C1   02BB 0002
        MVII    #$02CA, R4                      ; 52C3   02BC 02CA

        JSR     R5,     X_PRINT_R5              ; 52C5   0004 0118 007B
        STRING  "COURSE:"                       ; 52C8  
        DECLE   $0000                           ; 52CF   0000
L_52D0:
        MVII    #$0001, R0                      ; 52D0   02B8 0001
        MVII    #$02D3, R1                      ; 52D2   02B9 02D3
        CLRR    R2                              ; 52D4   01D2
        MVII    #$0004, R3                      ; 52D5   02BB 0004
        SDBD                                    ; 52D7   0001
        MVII    #$5375, R4                      ; 52D8   02BC 0075 0053

        JSR     R5,     .EXEC.910               ; 52DB   0004 0118 0110

        TSTR    R2                              ; 52DE   0092
        BNEQ    L_52E6                          ; 52DF   020C 0005

        JSR     R5,     X_PLAY_RAZZ2            ; 52E1   0004 011C 02BD

        B       L_52D0                          ; 52E4   0220 0015

L_52E6:
        ANDI    #$0001, R0                      ; 52E6   03B8 0001
        MVO     R0,     G_0179                  ; 52E8   0240 0179
        MVII    #$0002, R3                      ; 52EA   02BB 0002
        MVII    #$02D2, R4                      ; 52EC   02BC 02D2
        DECR    R0                              ; 52EE   0010
        BNEQ    L_52FF                          ; 52EF   020C 000E

        JSR     R5,     X_PRINT_R5              ; 52F1   0004 0118 007B
        STRING  "DOWNHILL"                      ; 52F4  
        DECLE   $0000                           ; 52FC   0000

        B       L_5309                          ; 52FD   0200 000A

L_52FF:
        JSR     R5,     X_PRINT_R5              ; 52FF   0004 0118 007B
        STRING  "SLALOM"                        ; 5302  
        DECLE   $0000                           ; 5308   0000
L_5309:
        JSR     R5,     .EXEC.A61               ; 5309   0004 0118 0261
        DECLE   $000F                           ; 530C   000F

        MVII    #$0264, R4                      ; 530D   02BC 0264
        MVII    #$008C, R0                      ; 530F   02B8 008C

        JSR     R5,     X_FILL_ZERO             ; 5311   0004 0114 0338

        MVII    #$0002, R3                      ; 5314   02BB 0002
        MVII    #$0265, R4                      ; 5316   02BC 0265
        B       L_5236                          ; 5318   0220 00E3

L_531A:
        JSR     R5,     X_PRINT_R5              ; 531A   0004 0118 007B
        STRING  "FINAL"                         ; 531D  
        DECLE   $0000                           ; 5322   0000

        MOVR    R7,     R0                      ; 5323   00B8
        MVII    #$017B, R5                      ; 5324   02BD 017B
L_5326:
        SDBD                                    ; 5326   0001
        MVI@    R5,     R1                      ; 5327   02A9
        TSTR    R1                              ; 5328   0089
        BEQ     L_5330                          ; 5329   0204 0005

        CMPR    R0,     R1                      ; 532B   0141
        BC      L_5330                          ; 532C   0201 0002

        MOVR    R1,     R0                      ; 532E   0088
        MOVR    R5,     R3                      ; 532F   00AB
L_5330:
        CMPI    #$0187, R5                      ; 5330   037D 0187
        BNC     L_5326                          ; 5332   0229 000D

        SUBR    R5,     R3                      ; 5334   012B
        SLL     R3,     1                       ; 5335   004B
        PSHR    R3                              ; 5336   0273
        SLL     R3,     2                       ; 5337   004F
        ADD@    R6,     R3                      ; 5338   02F3
        ADDI    #$02DC, R3                      ; 5339   02FB 02DC
        MVII    #$0050, R0                      ; 533B   02B8 0050
        MVO@    R0,     R3                      ; 533D   0258
        B       L_5352                          ; 533E   0200 0012

L_5340:
        PSHR    R5                              ; 5340   0275

        JSR     R5,     X_PRINT_R5              ; 5341   0004 0118 007B
        STRING  "HEAT #"                        ; 5344  
        DECLE   $0000                           ; 534A   0000

        MVI     G_015D, R0                      ; 534B   0280 015D
        MVII    #$0001, R1                      ; 534D   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 534F   0004 0118 00C5

L_5352:
        MVII    #$0279, R4                      ; 5352   02BC 0279
        MVII    #$0001, R3                      ; 5354   02BB 0001
L_5356:
        SDBD                                    ; 5356   0001
        MVII    #$06A0, R0                      ; 5357   02B8 00A0 0006
        XORR    R3,     R0                      ; 535A   01D8
        MVO@    R0,     R4                      ; 535B   0260
        ADDI    #$0004, R4                      ; 535C   02FC 0004
        MVII    #$0070, R0                      ; 535E   02B8 0070
        MVO@    R0,     R4                      ; 5360   0260
        SUBI    #$0004, R4                      ; 5361   033C 0004
        MOVR    R3,     R2                      ; 5363   009A
        SLL     R2,     1                       ; 5364   004A
        MVII    #$0179, R5                      ; 5365   02BD 0179
        ADDR    R2,     R5                      ; 5367   00D5
        SDBD                                    ; 5368   0001
        MVI@    R5,     R1                      ; 5369   02A9

        JSR     R5,     L_58DD                  ; 536A   0004 0158 00DD

        ADDI    #$000E, R4                      ; 536D   02FC 000E
        INCR    R3                              ; 536F   000B
        CMP     G_0189, R3                      ; 5370   0343 0189
        BLE     L_5356                          ; 5372   0226 001D
        PULR    R7                              ; 5374   02B7

        DECLE   $0000,  $0000,  $007F,  $0053   ; 5375   0000 0000 007F 0053
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5379   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 537D   0000 0000

        CLRR    R1                              ; 537F   01C9
        J       .EXEC.94C                       ; 5380   0004 0318 014C

        DECLE   $0074,  $0075,  $0000,  $008C   ; 5383   0074 0075 0000 008C
        DECLE   $005F,  $005F,  $0085,  $0000   ; 5387   005F 005F 0085 0000
        DECLE   $0000                           ; 538B   0000

        SAR     R0,     2                       ; 538C   006C
        SAR     R1,     2                       ; 538D   006D
        SAR     R0,     2                       ; 538E   006C
        RRC     R0,     1                       ; 538F   0070
        SLLC    R3,     2                       ; 5390   005F
        SLLC    R3,     2                       ; 5391   005F
        RRC     R1,     1                       ; 5392   0071
        SAR     R1,     2                       ; 5393   006D
        SLLC    R3,     2                       ; 5394   005F
        SLLC    R3,     2                       ; 5395   005F
        RRC     R0,     2                       ; 5396   0074
        SLLC    R3,     2                       ; 5397   005F
        SLLC    R3,     2                       ; 5398   005F
        SLLC    R3,     2                       ; 5399   005F
        SLLC    R3,     2                       ; 539A   005F
        SLLC    R3,     2                       ; 539B   005F
        SLLC    R3,     2                       ; 539C   005F
        SARC    R1,     2                       ; 539D   007D
        MOVR    R2,     R7                      ; 539E   0097

.GFX_LIST_539F:
        DECLE   $00FF,  $00FE,  $00FE,  $00FC   ; 539F  CART PIC #00
        DECLE   $00FC,  $00FC,  $00F0,  $00C0   ; 53A3  
        DECLE   $000F,  $000F,  $0009,  $0009   ; 53A7  CART PIC #01
        DECLE   $0009,  $0009,  $0009,  $0009   ; 53AB  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53AF  CART PIC #02
        DECLE   $0008,  $001B,  $001D,  $0009   ; 53B3  
        DECLE   $0000,  $0040,  $0040,  $0040   ; 53B7  CART PIC #03
        DECLE   $00C0,  $00E0,  $00E0,  $00E0   ; 53BB  
        DECLE   $0001,  $0001,  $0001,  $0001   ; 53BF  CART PIC #04
        DECLE   $0003,  $0003,  $000B,  $000B   ; 53C3  
        DECLE   $000D,  $000D,  $000E,  $000E   ; 53C7  CART PIC #05
        DECLE   $001F,  $001F,  $001F,  $001F   ; 53CB  
        DECLE   $00FE,  $00FE,  $00FE,  $00FE   ; 53CF  CART PIC #06
        DECLE   $007E,  $007E,  $007E,  $00BC   ; 53D3  
        DECLE   $00BC,  $00BC,  $00BC,  $00D8   ; 53D7  CART PIC #07
        DECLE   $00D8,  $00D8,  $00D8,  $00D0   ; 53DB  
        DECLE   $0000,  $0000,  $0000,  $0007   ; 53DF  CART PIC #08
        DECLE   $0038,  $00C0,  $0000,  $0007   ; 53E3  
        DECLE   $0001,  $0006,  $0098,  $0060   ; 53E7  CART PIC #09
        DECLE   $0000,  $0002,  $007D,  $0080   ; 53EB  
        DECLE   $00F8,  $0007,  $0001,  $0000   ; 53EF  CART PIC #0A
        DECLE   $0038,  $0040,  $0080,  $0000   ; 53F3  
        DECLE   $0000,  $00C0,  $00F8,  $00FF   ; 53F7  CART PIC #0B
        DECLE   $00FF,  $0007,  $0007,  $0007   ; 53FB  
        DECLE   $0000,  $0003,  $001F,  $001F   ; 53FF  CART PIC #0C
        DECLE   $00FF,  $00FF,  $00FF,  $0086   ; 5403  
        DECLE   $0000,  $0080,  $00E0,  $00FF   ; 5407  CART PIC #0D
        DECLE   $00F8,  $00E0,  $0080,  $0000   ; 540B  
        DECLE   $0000,  $0004,  $0018,  $0000   ; 540F  CART PIC #0E
        DECLE   $0027,  $0010,  $0008,  $0007   ; 5413  
        DECLE   $0000,  $0000,  $0007,  $0078   ; 5417  CART PIC #0F
        DECLE   $0080,  $0000,  $0007,  $00B8   ; 541B  
        DECLE   $0003,  $00FC,  $0000,  $0000   ; 541F  CART PIC #10
        DECLE   $0000,  $003F,  $00C0,  $0000   ; 5423  
        DECLE   $00E0,  $0018,  $0007,  $0007   ; 5427  CART PIC #11
        DECLE   $0001,  $0000,  $0000,  $0000   ; 542B  
        DECLE   $0000,  $0000,  $0000,  $00F8   ; 542F  CART PIC #12
        DECLE   $00FF,  $007F,  $0027,  $0007   ; 5433  
        DECLE   $0000,  $0003,  $001F,  $00FF   ; 5437  CART PIC #13
        DECLE   $00FC,  $00F0,  $00C0,  $0000   ; 543B  
        DECLE   $0000,  $0000,  $00FE,  $001F   ; 543F  CART PIC #14
        DECLE   $000F,  $0007,  $0001,  $0000   ; 5443  
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 5447  CART PIC #15
        DECLE   $00F8,  $00FC,  $00FE,  $003F   ; 544B  
        DECLE   $00FD,  $00FC,  $00F8,  $00F0   ; 544F  CART PIC #16
        DECLE   $0080,  $0078,  $0007,  $0000   ; 5453  
        DECLE   $0020,  $0070,  $00F8,  $0078   ; 5457  CART PIC #17
        DECLE   $0070,  $0050,  $0054,  $000F   ; 545B  
        DECLE   $001F,  $000E,  $002E,  $007A   ; 545F  CART PIC #18
        DECLE   $00FA,  $0070,  $0050,  $0050   ; 5463  
        DECLE   $0245,  $0162,  $0339,  $0008   ; 5467  CART PIC #19
        DECLE   $0275,  $0282,  $0325,  $0001   ; 546B  
        DECLE   $02B8,  $00DF,  $00FF,  $008C   ; 546F  CART PIC #1A
        DECLE   $028D,  $0185,  $024D,  $0182   ; 5473  

        MVO     R2,     G_0325                  ; 5477   0242 0325
        ADDI    #$0002, R4                      ; 5479   02FC 0002
        MVI@    R4,     R0                      ; 547B   02A0
        SWAP    R0,     1                       ; 547C   0040
        ANDI    #$00FF, R0                      ; 547D   03B8 00FF
        MVI@    R4,     R2                      ; 547F   02A2
        SWAP    R2,     1                       ; 5480   0042
        ANDI    #$00FF, R2                      ; 5481   03BA 00FF
        MVII    #$0004, R3                      ; 5483   02BB 0004
        ADDR    R3,     R2                      ; 5485   00DA
        CLRR    R4                              ; 5486   01E4
        ADD     G_0162, R4                      ; 5487   02C4 0162
        BEQ     L_548C                          ; 5489   0204 0001

        ADDR    R3,     R2                      ; 548B   00DA
L_548C:
        ADDR    R3,     R0                      ; 548C   00D8
        SAR     R2,     2                       ; 548D   006E
        SAR     R2,     1                       ; 548E   006A
        SAR     R0,     2                       ; 548F   006C
        SAR     R0,     1                       ; 5490   0068
        DECR    R0                              ; 5491   0010
        DECR    R2                              ; 5492   0012
        SLL     R2,     2                       ; 5493   004E
        PSHR    R2                              ; 5494   0272
        SLL     R2,     2                       ; 5495   004E
        ADD@    R6,     R2                      ; 5496   02F2
        ADDR    R0,     R2                      ; 5497   00C2
        ADDI    #$0200, R2                      ; 5498   02FA 0200
        MVI@    R2,     R3                      ; 549A   0293
        TSTR    R4                              ; 549B   00A4
        BNEQ    L_551D                          ; 549C   020C 007F

        MOVR    R3,     R0                      ; 549E   0098
        BEQ     L_5512                          ; 549F   0204 0071

        ANDI    #$01F8, R0                      ; 54A1   03B8 01F8
        CMPI    #$0008, R0                      ; 54A3   0378 0008
        BEQ     L_5512                          ; 54A5   0204 006B

        CMPI    #$0048, R0                      ; 54A7   0378 0048
        BEQ     L_54E2                          ; 54A9   0204 0037

        CMPI    #$0050, R0                      ; 54AB   0378 0050
        BEQ     L_54E2                          ; 54AD   0204 0033

        MOVR    R2,     R4                      ; 54AF   0094
        CLRR    R2                              ; 54B0   01D2
        CMPI    #$0058, R0                      ; 54B1   0378 0058
        BEQ     L_54F0                          ; 54B3   0204 003B

        CMPI    #$0038, R0                      ; 54B5   0378 0038
        BEQ     L_5513                          ; 54B7   0204 005A

        CMPI    #$0040, R0                      ; 54B9   0378 0040
        BEQ     L_5513                          ; 54BB   0204 0056

        CMPI    #$00A0, R0                      ; 54BD   0378 00A0
        BEQ     L_5513                          ; 54BF   0204 0052

        CMPI    #$00A8, R0                      ; 54C1   0378 00A8
        BEQ     L_5513                          ; 54C3   0204 004E

        CMPI    #$0060, R0                      ; 54C5   0378 0060
        BEQ     L_5512                          ; 54C7   0204 0049

        CMPI    #$0068, R0                      ; 54C9   0378 0068
        BEQ     L_5512                          ; 54CB   0204 0045

        CMPI    #$0120, R0                      ; 54CD   0378 0120
        BEQ     L_54DF                          ; 54CF   0204 000E

        SLLC    R3,     2                       ; 54D1   005F
        SLLC    R3,     2                       ; 54D2   005F
        BOV     L_5512                          ; 54D3   0202 003D

        XORI    #$0020, R5                      ; 54D5   03FD 0020
        MVO@    R5,     R1                      ; 54D7   024D
        MVI     G_0325, R0                      ; 54D8   0280 0325
        XORI    #$0020, R0                      ; 54DA   03F8 0020
        MVO     R0,     G_0325                  ; 54DC   0240 0325
        PULR    R7                              ; 54DE   02B7

L_54DF:
        JSR     R5,     L_58AE                  ; 54DF   0004 0158 00AE

L_54E2:
        ADDI    #$0018, R3                      ; 54E2   02FB 0018
        MVO@    R3,     R2                      ; 54E4   0253
        MVI     G_018A, R0                      ; 54E5   0280 018A

        JSR     R5,     X_EXT_SIGN_LO           ; 54E7   0004 0114 0268

        SAR     R0,     1                       ; 54EA   0068
        MVO     R0,     G_018A                  ; 54EB   0240 018A

        JSR     R5,     L_55C1                  ; 54ED   0004 0154 01C1

L_54F0:
        SUBI    #$0004, R4                      ; 54F0   033C 0004
        MVII    #$0004, R1                      ; 54F2   02B9 0004
L_54F4:
        MVI@    R4,     R3                      ; 54F4   02A3
        TSTR    R3                              ; 54F5   009B
        BMI     L_5512                          ; 54F6   020B 001A

        PSHR    R3                              ; 54F8   0273
        ANDI    #$0007, R3                      ; 54F9   03BB 0007
        BEQ     L_550E                          ; 54FB   0204 0011

        SUBI    #$0003, R3                      ; 54FD   033B 0003
        BPL     L_550E                          ; 54FF   0203 000D

        PULR    R3                              ; 5501   02B3
        SDBD                                    ; 5502   0001
        XORI    #$8003, R3                      ; 5503   03FB 0003 0080
        DECR    R4                              ; 5506   0014
        MVO@    R3,     R4                      ; 5507   0263
        MVI     G_015E, R0                      ; 5508   0280 015E
        INCR    R0                              ; 550A   0008
        MVO     R0,     G_015E                  ; 550B   0240 015E
        PULR    R7                              ; 550D   02B7

L_550E:
        PULR    R3                              ; 550E   02B3
        DECR    R1                              ; 550F   0011
        BNEQ    L_54F4                          ; 5510   022C 001D
L_5512:
        PULR    R7                              ; 5512   02B7

L_5513:
        ADD     G_0160, R2                      ; 5513   02C2 0160
        BNEQ    L_5512                          ; 5515   022C 0004

        JSR     R5,     L_55AD                  ; 5517   0004 0154 01AD

        J       L_5532                          ; 551A   0004 0354 0132

L_551D:
        CLRR    R0                              ; 551D   01C0
        DECLE   $0240,  $0162,  $0001,  $037B   ; 551E   0240 0162 0001 037B
        DECLE   $0000,  $0010,  $0225,  $00B9   ; 5522   0000 0010 0225 00B9

        MVI     G_0160, R1                      ; 5526   0281 0160
        ADD     G_0161, R1                      ; 5528   02C1 0161
        BNEQ    L_5512                          ; 552A   022C 0019

        JSR     R5,     L_559A                  ; 552C   0004 0154 019A
        JSR     R5,     L_5532                  ; 552F   0004 0154 0132

L_5532:
        MVII    #$031D, R3                      ; 5532   02BB 031D
        SDBD                                    ; 5534   0001
        MVII    #$FEFC, R0                      ; 5535   02B8 00FC 00FE
        MVI     G_0160, R1                      ; 5538   0281 0160
        TSTR    R1                              ; 553A   0089
        BNEQ    L_556A                          ; 553B   020C 002D

        MVO     R1,     G_032B                  ; 553D   0241 032B
        MVO     R0,     G_0160                  ; 553F   0240 0160
        ADD     G_0161, R1                      ; 5541   02C1 0161
        BNEQ    L_554F                          ; 5543   020C 000A

        MVI     G_031D, R1                      ; 5545   0281 031D
        MVO     R1,     G_032D                  ; 5547   0241 032D
        SDBD                                    ; 5549   0001
        XORI    #$1000, R1                      ; 554A   03F9 0000 0010
        MVO     R1,     G_031D                  ; 554D   0241 031D
L_554F:
        MVI     G_0325, R1                      ; 554F   0281 0325
        SDBD                                    ; 5551   0001
        ANDI    #$DFFF, R1                      ; 5552   03B9 00FF 00DF
        MVO     R1,     G_0325                  ; 5555   0241 0325
        MVII    #$0007, R1                      ; 5557   02B9 0007
        MVO     R1,     G_032A                  ; 5559   0241 032A
        MVO     R0,     G_0331                  ; 555B   0240 0331
        MVII    #$0080, R0                      ; 555D   02B8 0080
        MVO     R0,     G_0332                  ; 555F   0240 0332
        SLL     R1,     1                       ; 5561   0049
        MVO     R1,     G_0333                  ; 5562   0241 0333
        SLL     R0,     2                       ; 5564   004C
        SLL     R0,     1                       ; 5565   0048
        ADD     G_0320, R0                      ; 5566   02C0 0320
        MVO     R0,     G_0320                  ; 5568   0240 0320
L_556A:
        PULR    R7                              ; 556A   02B7

        MVI     G_031D, R0                      ; 556B   0280 031D
        MVO     R0,     G_032D                  ; 556D   0240 032D
        SDBD                                    ; 556F   0001
        XORI    #$1000, R0                      ; 5570   03F8 0000 0010
        MVO     R0,     G_031D                  ; 5573   0240 031D
        MVI     G_018C, R0                      ; 5575   0280 018C
        CMPI    #$000D, R0                      ; 5577   0378 000D
        BLT     L_5582                          ; 5579   0205 0007

        CMPI    #$0023, R0                      ; 557B   0378 0023
        BGT     L_5582                          ; 557D   020E 0003

        CLRR    R0                              ; 557F   01C0
        MVO     R0,     G_018C                  ; 5580   0240 018C
L_5582:
        ANDI    #$00FE, R0                      ; 5582   03B8 00FE
        MVO     R0,     G_018B                  ; 5584   0240 018B
        CLRR    R0                              ; 5586   01C0
        MVO     R0,     G_0160                  ; 5587   0240 0160
        MVO     R0,     G_0161                  ; 5589   0240 0161
        MOVR    R5,     R7                      ; 558B   00AF

L_558C:
        CLRR    R2                              ; 558C   01D2
        TSTR    R0                              ; 558D   0080
        BMI     L_5597                          ; 558E   020B 0007

        MVII    #$0002, R2                      ; 5590   02BA 0002
        SLR     R0,     2                       ; 5592   0064
        INCR    R0                              ; 5593   0008
        ANDR    R2,     R0                      ; 5594   0190
        SLL     R0,     1                       ; 5595   0048
        SUBR    R0,     R2                      ; 5596   0102
L_5597:
        MVO     R2,     G_032C                  ; 5597   0242 032C
        MOVR    R5,     R7                      ; 5599   00AF

L_559A:
        PSHR    R5                              ; 559A   0275

L_559B:
        JSR     R5,     X_PLAY_SFX1             ; 559B   0004 0118 03BB
        DECLE   $0389                           ; 559E  SFX data
        DECLE   $03C0,  $01C0                   ; 559F  SFX data
        DECLE   $03D8,  $0000                   ; 55A1  SFX data
        DECLE   $03D4,  $0200                   ; 55A3  SFX data
        DECLE   $03BE                           ; 55A5  SFX data
        DECLE   $0001,  $01E3                   ; 55A6  SFX data
        DECLE   $03AB                           ; 55A8  SFX data
        DECLE   $00CF                           ; 55A9  SFX end


        J       L_5126                          ; 55AA   0004 0350 0126

L_55AD:
        PSHR    R5                              ; 55AD   0275

        JSR     R5,     X_PLAY_SFX1             ; 55AE   0004 0118 03BB
        DECLE   $0079                           ; 55B1  SFX data
        DECLE   $006C,  $0000                   ; 55B2  SFX data
        DECLE   $020D                           ; 55B4  SFX data
        DECLE   $0035                           ; 55B5  SFX data
        DECLE   $006E                           ; 55B6  SFX data
        DECLE   $01AB                           ; 55B7  SFX data
        DECLE   $03ED                           ; 55B8  SFX data
        DECLE   $03B7                           ; 55B9  SFX data
        DECLE   $000B                           ; 55BA  SFX data
        DECLE   $008F,  $0013                   ; 55BB  SFX data
        DECLE   $00CF                           ; 55BD  SFX end


        J       L_559B                          ; 55BE   0004 0354 019B

L_55C1:
        JSR     R5,     X_PLAY_SFX1             ; 55C1   0004 0118 03BB
        DECLE   $0389                           ; 55C4  SFX data
        DECLE   $006C,  $0000                   ; 55C5  SFX data
        DECLE   $0050,  $0200                   ; 55C7  SFX data
        DECLE   $0058,  $0214                   ; 55C9  SFX data
        DECLE   $005B                           ; 55CB  SFX data
        DECLE   $0044,  $0180                   ; 55CC  SFX data
        DECLE   $0001,  $03A0                   ; 55CE  SFX data
        DECLE   $0001,  $03B2                   ; 55D0  SFX data
        DECLE   $0001,  $03F1                   ; 55D2  SFX data
        DECLE   $000B                           ; 55D4  SFX data
        DECLE   $02EB                           ; 55D5  SFX data
        DECLE   $0001,  $0003                   ; 55D6  SFX data
        DECLE   $01CF                           ; 55D8  SFX end

        DECLE   $0004,  $0350,  $0126,  $0000   ; 55D9   0004 0350 0126 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55DD   0000 0000 0000 0000
        DECLE   $0000,  $007E,  $0000,  $007E   ; 55E1   0000 007E 0000 007E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55E5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55E9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0020   ; 55ED   0000 0000 0000 0020
        DECLE   $0010,  $0028,  $0014,  $000A   ; 55F1   0010 0028 0014 000A
        DECLE   $0004,  $0002,  $0000,  $0000   ; 55F5   0004 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55F9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0060,  $0030   ; 55FD   0000 0000 0060 0030
        DECLE   $00D8,  $006C,  $0036,  $001B   ; 5601   00D8 006C 0036 001B
        DECLE   $000C,  $0006,  $0003,  $0000   ; 5605   000C 0006 0003 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5609   0000 0000 0000 0000
        DECLE   $0000,  $0020,  $0030,  $0050   ; 560D   0000 0020 0030 0050
        DECLE   $0068,  $002C,  $0016,  $001B   ; 5611   0068 002C 0016 001B
        DECLE   $000D,  $000C,  $0006,  $0002   ; 5615   000D 000C 0006 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5619   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0028,  $002C   ; 561D   0000 0008 0028 002C
        DECLE   $0034,  $0014,  $0016,  $001A   ; 5621   0034 0014 0016 001A
        DECLE   $000A,  $000B,  $000D,  $0005   ; 5625   000A 000B 000D 0005
        DECLE   $0004,  $0000,  $0000,  $0000   ; 5629   0004 0000 0000 0000
        DECLE   $0008,  $0028,  $0028,  $002C   ; 562D   0008 0028 0028 002C
        DECLE   $0034,  $0014,  $0014,  $0016   ; 5631   0034 0014 0014 0016
        DECLE   $001A,  $000A,  $000A,  $0008   ; 5635   001A 000A 000A 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5639   0000 0000 0000 0000
        DECLE   $0000,  $0012,  $0012,  $0012   ; 563D   0000 0012 0012 0012
        DECLE   $0012,  $0012,  $0012,  $0012   ; 5641   0012 0012 0012 0012
        DECLE   $0012,  $0012,  $0012,  $0012   ; 5645   0012 0012 0012 0012
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5649   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0068   ; 564D   0000 0000 0000 0068
        DECLE   $0038,  $0018,  $001C,  $0016   ; 5651   0038 0018 001C 0016
        DECLE   $0033,  $0020,  $0020,  $0060   ; 5655   0033 0020 0020 0060
        DECLE   $0040,  $0040,  $0000,  $0000   ; 5659   0040 0040 0000 0000
        DECLE   $0030,  $0023,  $0036           ; 565D   0030 0023 0036

        SARC    R0,     2                       ; 5660   007C
        SARC    R0,     1                       ; 5661   0078
        SARC    R0,     1                       ; 5662   0078
        ADDR    R7,     R0                      ; 5663   00F8
        ADDR    R3,     R4                      ; 5664   00DC
        ADDR    R3,     R7                      ; 5665   00DF
        MOVR    R3,     R7                      ; 5666   009F

        DECLE   $0085,  $0005,  $000E,  $000A   ; 5667   0085 0005 000E 000A
        DECLE   $0008,  $0000,  $0000,  $0000   ; 566B   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; 566F   0000 0000 0000 0002
        DECLE   $0004,  $006D,  $005B,  $0077   ; 5673   0004 006D 005B 0077
        DECLE   $00FF,  $00FD,  $00DD,  $0065   ; 5677   00FF 00FD 00DD 0065
        DECLE   $002D,  $0000,  $0000,  $0000   ; 567B   002D 0000 0000 0000
        DECLE   $0000,  $0018,  $0010,  $003C   ; 567F   0000 0018 0010 003C
        DECLE   $007E,  $00BB,  $00F8,  $007C   ; 5683   007E 00BB 00F8 007C
        DECLE   $007E,  $003A,  $000E,  $0014   ; 5687   007E 003A 000E 0014
        DECLE   $0034,  $0018,  $0010,  $001C   ; 568B   0034 0018 0010 001C
        DECLE   $003E,  $007B,  $0079,  $00FA   ; 568F   003E 007B 0079 00FA
        DECLE   $00E8,  $0068,  $003C,  $003E   ; 5693   00E8 0068 003C 003E
        DECLE   $0037,  $001B,  $001E,  $001C   ; 5697   0037 001B 001E 001C
        DECLE   $0038,  $0000,  $0000,  $0000   ; 569B   0038 0000 0000 0000
        DECLE   $0018,  $0018,  $0024,  $007E   ; 569F   0018 0018 0024 007E
        DECLE   $00FF,  $00BD,  $00DB,  $005A   ; 56A3   00FF 00BD 00DB 005A
        DECLE   $003C,  $003C,  $0024,  $0024   ; 56A7   003C 003C 0024 0024
        DECLE   $0024,  $000C,  $000C,  $0012   ; 56AB   0024 000C 000C 0012
        DECLE   $003E,  $007F,  $005D,  $007F   ; 56AF   003E 007F 005D 007F
        DECLE   $007E,  $003C,  $003C,  $0014   ; 56B3   007E 003C 003C 0014
        DECLE   $0014,  $003C,  $0068,  $0058   ; 56B7   0014 003C 0068 0058
        DECLE   $0010,  $000C,  $0008,  $000C   ; 56BB   0010 000C 0008 000C
        DECLE   $001E,  $003F                   ; 56BF   001E 003F

        SARC    R1,     2                       ; 56C1   007D
        ADDR    R3,     R7                      ; 56C2   00DF

        DECLE   $00BE,  $003C,  $003C,  $0034   ; 56C3   00BE 003C 003C 0034
        DECLE   $001E,  $000A,  $000A,  $0014   ; 56C7   001E 000A 000A 0014
        DECLE   $0028,  $0006,  $0004,  $0006   ; 56CB   0028 0006 0004 0006
        DECLE   $001F,  $003F,  $007F,  $00DD   ; 56CF   001F 003F 007F 00DD
        DECLE   $00BF,  $003A,  $003C,  $003E   ; 56D3   00BF 003A 003C 003E
        DECLE   $001E,  $000C,  $001C,  $0030   ; 56D7   001E 000C 001C 0030
        DECLE   $0020,  $0000,  $0000,  $000C   ; 56DB   0020 0000 0000 000C
        DECLE   $0008,  $003C,  $007E,  $00FF   ; 56DF   0008 003C 007E 00FF
        DECLE   $00B9,  $00F3,  $007A,  $0078   ; 56E3   00B9 00F3 007A 0078
        DECLE   $003C,  $001C,  $0018,  $0030   ; 56E7   003C 001C 0018 0030
        DECLE   $0020,  $0000,  $0000,  $0000   ; 56EB   0020 0000 0000 0000
        DECLE   $000C,  $0008,  $001C,  $003C   ; 56EF   000C 0008 001C 003C
        DECLE   $007C,  $0076,  $007A,  $007C   ; 56F3   007C 0076 007A 007C
        DECLE   $003C,  $0018,  $0038,  $0060   ; 56F7   003C 0018 0038 0060
        DECLE   $0020,  $0000,  $0000,  $0000   ; 56FB   0020 0000 0000 0000
        DECLE   $0000                           ; 56FF   0000

        CLRC                                    ; 5700   0006

        JSRD    R4,     .EXEC.C3E               ; 5701   0004 001E 003E
        DECLE   $007A,  $0072,  $007E,  $007E   ; 5704   007A 0072 007E 007E
        DECLE   $003E,  $001C,  $0018,  $0030   ; 5708   003E 001C 0018 0030
        DECLE   $0000,  $0000,  $0000,  $000C   ; 570C   0000 0000 0000 000C
        DECLE   $0008,  $001C,  $003C,  $003C   ; 5710   0008 001C 003C 003C
        DECLE   $0036,  $007A,  $007C,  $007E   ; 5714   0036 007A 007C 007E
        DECLE   $0016,  $003C,  $0028,  $0008   ; 5718   0016 003C 0028 0008
        DECLE   $0000,  $0000,  $000C,  $0008   ; 571C   0000 0000 000C 0008
        DECLE   $000C,  $003E,  $007F,  $005D   ; 5720   000C 003E 007F 005D
        DECLE   $007F,  $003A,  $0038,  $001C   ; 5724   007F 003A 0038 001C
        DECLE   $0014,  $003C,  $0028,  $0008   ; 5728   0014 003C 0028 0008
        DECLE   $000C,  $0008,  $000C,  $001E   ; 572C   000C 0008 000C 001E
        DECLE   $003F,  $007D,  $00FD,  $00BB   ; 5730   003F 007D 00FD 00BB
        DECLE   $003A,  $003C,  $003C,  $0014   ; 5734   003A 003C 003C 0014
        DECLE   $003C,  $0068,  $0058,  $0010   ; 5738   003C 0068 0058 0010
        DECLE   $000C,  $0008,  $000C,  $001C   ; 573C   000C 0008 000C 001C
        DECLE   $003E,  $007A,  $00FA,  $00BC   ; 5740   003E 007A 00FA 00BC
        DECLE   $003C,  $003C,  $001C,  $0014   ; 5744   003C 003C 001C 0014
        DECLE   $0034,  $002C,  $0028,  $0008   ; 5748   0034 002C 0028 0008
        DECLE   $000C,  $000C,  $001E,  $003E   ; 574C   000C 000C 001E 003E
        DECLE   $007F,  $005D,  $007F,  $007E   ; 5750   007F 005D 007F 007E
        DECLE   $003C,  $003C,  $0014,  $0034   ; 5754   003C 003C 0014 0034
        DECLE   $002C,  $0028,  $0028,  $0008   ; 5758   002C 0028 0028 0008
        DECLE   $0000,  $0000,  $0000,  $0018   ; 575C   0000 0000 0000 0018
        DECLE   $0018,  $003C,  $007E,  $00FF   ; 5760   0018 003C 007E 00FF

        MOVR    R7,     R5                      ; 5764   00BD
        ADDR    R3,     R3                      ; 5765   00DB
        SLLC    R2,     1                       ; 5766   005A
        RSWD    R4                              ; 5767   003C
        RSWD    R4                              ; 5768   003C
        NEGR    R4                              ; 5769   0024
        NEGR    R4                              ; 576A   0024
        NEGR    R4                              ; 576B   0024
L_576C:
        PSHR    R5                              ; 576C   0275
        MVII    #$000A, R4                      ; 576D   02BC 000A
L_576F:
        MVII    #$0162, R2                      ; 576F   02BA 0162
        ADDR    R4,     R2                      ; 5771   00E2
        MVI@    R2,     R0                      ; 5772   0290
        CMPI    #$00FE, R0                      ; 5773   0378 00FE
        BGE     L_5820                          ; 5775   020D 00A9

        MOVR    R0,     R1                      ; 5777   0081
        CMPI    #$0020, R1                      ; 5778   0379 0020
        BLT     L_578B                          ; 577A   0205 000F

        SUBI    #$0020, R1                      ; 577C   0339 0020
        MOVR    R1,     R0                      ; 577E   0088
        CMPI    #$0020, R1                      ; 577F   0379 0020
        BLT     L_578B                          ; 5781   0205 0008

        MVO@    R1,     R2                      ; 5783   0251
        SDBD                                    ; 5784   0001
        MVII    #$5C89, R1                      ; 5785   02B9 0089 005C
        PSHR    R0                              ; 5788   0270
        B       L_5791                          ; 5789   0200 0006

L_578B:
        PSHR    R0                              ; 578B   0270
        SLL     R1,     1                       ; 578C   0049
        SDBD                                    ; 578D   0001
        ADDI    #$5C89, R1                      ; 578E   02F9 0089 005C
L_5791:
        PSHR    R4                              ; 5791   0274
        MOVR    R1,     R5                      ; 5792   008D
        MOVR    R4,     R0                      ; 5793   00A0
        SLL     R0,     1                       ; 5794   0048
        MOVR    R0,     R4                      ; 5795   0084
        ADDI    #$02DA, R4                      ; 5796   02FC 02DA
        CLRR    R0                              ; 5798   01C0
        SDBD                                    ; 5799   0001
        CMPI    #$5CBD, R1                      ; 579A   0379 00BD 005C
        BLT     L_57AF                          ; 579D   0205 0010
        BEQ     L_57AB                          ; 579F   0204 000A

        SDBD                                    ; 57A1   0001
        CMPI    #$5CC3, R1                      ; 57A2   0379 00C3 005C
        BEQ     L_57AD                          ; 57A5   0204 0006

        MVII    #$0003, R0                      ; 57A7   02B8 0003
        B       L_57AF                          ; 57A9   0200 0004

L_57AB:
        MVII    #$0003, R0                      ; 57AB   02B8 0003
L_57AD:
        SUBI    #$0014, R5                      ; 57AD   033D 0014
L_57AF:
        MOVR    R5,     R3                      ; 57AF   00AB

        JSR     R5,     L_580C                  ; 57B0   0004 0158 000C

        CLRR    R0                              ; 57B3   01C0
        SDBD                                    ; 57B4   0001
        CMPI    #$5CBD, R1                      ; 57B5   0379 00BD 005C
        BLE     L_57BC                          ; 57B8   0206 0002

        MVII    #$0003, R0                      ; 57BA   02B8 0003
L_57BC:
        MOVR    R5,     R3                      ; 57BC   00AB

        JSR     R5,     L_580C                  ; 57BD   0004 0158 000C

        PULR    R4                              ; 57C0   02B4
        PULR    R0                              ; 57C1   02B0
        CMPI    #$001F, R0                      ; 57C2   0378 001F
        BGT     L_57E8                          ; 57C4   020E 0022

        CMPI    #$001A, R0                      ; 57C6   0378 001A
        BLT     L_57D2                          ; 57C8   0205 0008
        BEQ     L_57D0                          ; 57CA   0204 0004

        CMPI    #$001D, R0                      ; 57CC   0378 001D
        BNEQ    L_57D2                          ; 57CE   020C 0002

L_57D0:
        SUBI    #$000A, R0                      ; 57D0   0338 000A
L_57D2:
        TSTR    R0                              ; 57D2   0080
        BEQ     L_57EC                          ; 57D3   0204 0017

        CMPI    #$0004, R0                      ; 57D5   0378 0004
        BEQ     L_57EC                          ; 57D7   0204 0013

        CMPI    #$0012, R0                      ; 57D9   0378 0012
        BEQ     L_57EC                          ; 57DB   0204 000F

        CMPI    #$0015, R0                      ; 57DD   0378 0015
        BEQ     L_57EC                          ; 57DF   0204 000B

        MOVR    R0,     R1                      ; 57E1   0081
        ANDI    #$0008, R1                      ; 57E2   03B9 0008
        BNEQ    L_57EC                          ; 57E4   020C 0006

        INCR    R0                              ; 57E6   0008
        MVO@    R0,     R2                      ; 57E7   0250
L_57E8:
        DECR    R4                              ; 57E8   0014
        BNEQ    L_576F                          ; 57E9   022C 007B
        PULR    R7                              ; 57EB   02B7

L_57EC:
        MVII    #$016C, R1                      ; 57EC   02B9 016C
        ADDR    R4,     R1                      ; 57EE   00E1
        MVI@    R1,     R2                      ; 57EF   028A
        INCR    R2                              ; 57F0   000A
        MVO@    R2,     R1                      ; 57F1   024A
        DECR    R2                              ; 57F2   0012
        MOVR    R4,     R3                      ; 57F3   00A3
        SLL     R3,     1                       ; 57F4   004B
        SDBD                                    ; 57F5   0001
        ADDI    #$590A, R3                      ; 57F6   02FB 000A 0059
        MVI     G_0179, R5                      ; 57F9   0285 0179
        DECR    R5                              ; 57FB   0015
        BEQ     L_5802                          ; 57FC   0204 0004

        SDBD                                    ; 57FE   0001
        ADDI    #$016D, R3                      ; 57FF   02FB 006D 0001
L_5802:
        MOVR    R3,     R5                      ; 5802   009D
        SDBD                                    ; 5803   0001
        ADD@    R5,     R2                      ; 5804   02EA
        MVI@    R2,     R0                      ; 5805   0290
        MVII    #$0162, R1                      ; 5806   02B9 0162
        ADDR    R4,     R1                      ; 5808   00E1
        MVO@    R0,     R1                      ; 5809   0248
        B       L_57E8                          ; 580A   0220 0023

L_580C:
        PSHR    R5                              ; 580C   0275
        MOVR    R3,     R5                      ; 580D   009D
        XOR@    R5,     R0                      ; 580E   03E8
        MOVR    R0,     R3                      ; 580F   0083
        ANDI    #$0007, R3                      ; 5810   03BB 0007
        CMPI    #$0006, R3                      ; 5812   037B 0006
        BNEQ    L_581A                          ; 5814   020C 0004

        SDBD                                    ; 5816   0001
        XORI    #$1006, R0                      ; 5817   03F8 0006 0010
L_581A:
        SDBD                                    ; 581A   0001
        XORI    #$0800, R0                      ; 581B   03F8 0000 0008
        MVO@    R0,     R4                      ; 581E   0260
        PULR    R7                              ; 581F   02B7

L_5820:
        MVI     G_0177, R4                      ; 5820   0284 0177
        ADDI    #$0002, R4                      ; 5822   02FC 0002
        MVO     R4,     G_0177                  ; 5824   0244 0177
        CMPI    #$0006, R4                      ; 5826   037C 0006
        BGE     L_5830                          ; 5828   020D 0006

        CLRR    R0                              ; 582A   01C0
        MVO     R0,     .BTAB.DC                ; 582B   0240 02DC
        MVO     R0,     .BTAB.DD                ; 582D   0240 02DD
        PULR    R7                              ; 582F   02B7

L_5830:
        CMPI    #$000E, R4                      ; 5830   037C 000E
        BGT     L_5892                          ; 5832   020E 005E

        SDBD                                    ; 5834   0001
        ADDI    #$58FC, R4                      ; 5835   02FC 00FC 0058
        SDBD                                    ; 5838   0001
        MVI@    R4,     R0                      ; 5839   02A0
        MOVR    R0,     R7                      ; 583A   0087

        SDBD                                    ; 583B   0001
        MVII    #$0927, R1                      ; 583C   02B9 0027 0009
        MVII    #$0014, R0                      ; 583F   02B8 0014
        MVII    #$02DC, R4                      ; 5841   02BC 02DC

        JSR     R5,     X_FILL_MEM              ; 5843   0004 0114 0341

        PULR    R7                              ; 5846   02B7

        MVII    #$000B, R0                      ; 5847   02B8 000B
        MVII    #$02DE, R4                      ; 5849   02BC 02DE

        JSR     R5,     X_FILL_ZERO             ; 584B   0004 0114 0338

        SDBD                                    ; 584E   0001
        MVII    #$0851, R0                      ; 584F   02B8 0051 0008
        MVO     R0,     .BTAB.DE                ; 5852   0240 02DE
        SDBD                                    ; 5854   0001
        MVII    #$0849, R0                      ; 5855   02B8 0049 0008
        MVO     R0,     .BTAB.E7                ; 5858   0240 02E7
        PULR    R7                              ; 585A   02B7

        SDBD                                    ; 585B   0001
        MVII    #$2000, R0                      ; 585C   02B8 0000 0020
        MVO     R0,     .BTAB.DE                ; 585F   0240 02DE
        MVO     R0,     .BTAB.E8                ; 5861   0240 02E8
        MVII    #$0007, R3                      ; 5863   02BB 0007
        MVII    #$02E0, R4                      ; 5865   02BC 02E0
        MVI     G_017A, R0                      ; 5867   0280 017A
        TSTR    R0                              ; 5869   0080
        BNEQ    L_58F2                          ; 586A   020C 0086

        JSR     R5,     X_PRINT_R5              ; 586C   0004 0118 007B
        STRING  "FINISH"                        ; 586F  
        DECLE   $0000                           ; 5875   0000
L_5876:
        MVII    #$001D, R3                      ; 5876   02BB 001D
        MVI     G_0179, R4                      ; 5878   0284 0179
        DECR    R4                              ; 587A   0014
        BEQ     L_587F                          ; 587B   0204 0002

        MVII    #$003C, R3                      ; 587D   02BB 003C
L_587F:
        MVII    #$018F, R4                      ; 587F   02BC 018F
        MVI     G_015E, R0                      ; 5881   0280 015E
        SDBD                                    ; 5883   0001
        MVI@    R4,     R2                      ; 5884   02A2
        SUBR    R3,     R0                      ; 5885   0118
        BPL     L_588D                          ; 5886   0203 0005

        SLL     R0,     2                       ; 5888   004C
        SLL     R0,     2                       ; 5889   004C
        SUBR    R0,     R2                      ; 588A   0102
        SAR     R0,     1                       ; 588B   0068
        SUBR    R0,     R2                      ; 588C   0102
L_588D:
        MVO     R2,     G_018F                  ; 588D   0242 018F
        SWAP    R2,     1                       ; 588F   0042
        MVO     R2,     G_0190                  ; 5890   0242 0190
L_5892:
        PULR    R7                              ; 5892   02B7

        MVII    #$0014, R0                      ; 5893   02B8 0014
        MVII    #$02DC, R4                      ; 5895   02BC 02DC

        JSR     R5,     X_FILL_ZERO             ; 5897   0004 0114 0338

        PULR    R7                              ; 589A   02B7

        CLRR    R0                              ; 589B   01C0
        MVO     R0,     G_0192                  ; 589C   0240 0192
        SDBD                                    ; 589E   0001
        MVII    #$501B, R1                      ; 589F   02B9 001B 0050

        JSR     R5,     X_TIMER_STOP            ; 58A2   0004 0118 0038

        MVII    #$0070, R0                      ; 58A5   02B8 0070
        MVO     R0,     .BTAB.D9                ; 58A7   0240 02D9
        MVO     R0,     G_0178                  ; 58A9   0240 0178
        MVO     R0,     G_0191                  ; 58AB   0240 0191
        PULR    R7                              ; 58AD   02B7

L_58AE:
        MVO     R2,     G_0191                  ; 58AE   0242 0191
        MVII    #$0006, R0                      ; 58B0   02B8 0006

        JSR     R5,     X_PLAY_CHEER1           ; 58B2   0004 011C 02D5

        MVII    #$018F, R4                      ; 58B5   02BC 018F
        SDBD                                    ; 58B7   0001
        MVI@    R4,     R2                      ; 58B8   02A2
        MVI@    R1,     R0                      ; 58B9   0288
        SDBD                                    ; 58BA   0001
        MVII    #$F7FF, R5                      ; 58BB   02BD 00FF 00F7
        ANDR    R5,     R0                      ; 58BE   01A8
        MVO@    R0,     R1                      ; 58BF   0248
        MVI     G_0325, R3                      ; 58C0   0283 0325
        ANDR    R5,     R3                      ; 58C2   01AB
        MVO     R3,     G_0325                  ; 58C3   0243 0325
        ANDI    #$0007, R0                      ; 58C5   03B8 0007
        MOVR    R0,     R3                      ; 58C7   0083
        SLL     R0,     1                       ; 58C8   0048
        ADDI    #$0179, R0                      ; 58C9   02F8 0179
        MOVR    R0,     R4                      ; 58CB   0084
        SDBD                                    ; 58CC   0001
        MVI@    R4,     R1                      ; 58CD   02A1
        TSTR    R1                              ; 58CE   0089
        BEQ     L_58D4                          ; 58CF   0204 0003

        CMPR    R1,     R2                      ; 58D1   014A
        BGE     L_58D5                          ; 58D2   020D 0001

L_58D4:
        MOVR    R2,     R1                      ; 58D4   0091
L_58D5:
        MOVR    R0,     R4                      ; 58D5   0084
        MVO@    R1,     R4                      ; 58D6   0261
        SWAP    R1,     1                       ; 58D7   0041
        MVO@    R1,     R4                      ; 58D8   0261
        MVII    #$02D6, R4                      ; 58D9   02BC 02D6
        MOVR    R2,     R1                      ; 58DB   0091
        INCR    R7                              ; 58DC   000F

L_58DD:
        PSHR    R5                              ; 58DD   0275
L_58DE:
        MVII    #$0005, R2                      ; 58DE   02BA 0005

        JSR     R5,     X_DIV                   ; 58E0   0004 011C 01FB

        PSHR    R1                              ; 58E3   0271
        MVII    #$0003, R1                      ; 58E4   02B9 0003

        JSR     R5,     X_PRNUM_RGT             ; 58E6   0004 0118 00C5

        PULR    R0                              ; 58E9   02B0
        SLL     R0,     1                       ; 58EA   0048
        MVII    #$0001, R1                      ; 58EB   02B9 0001
        ADDI    #$0004, R4                      ; 58ED   02FC 0004

        JSR     R5,     .EXEC.89F               ; 58EF   0004 0118 009F

L_58F2:
        DECR    R4                              ; 58F2   0014

        JSR     R5,     X_PRINT_R5              ; 58F3   0004 0118 007B
        STRING  "PENDRAGON"                     ; 58F6  
        DECLE   $0000                           ; 58FF   0000

        B       L_5876                          ; 5900   0220 008B

        SLLC    R3,     1                       ; 5902   005B
        SLLC    R0,     1                       ; 5903   0058
        SWAP    R3,     2                       ; 5904   0047
        SLLC    R0,     1                       ; 5905   0058
        RSWD    R3                              ; 5906   003B
        SLLC    R0,     1                       ; 5907   0058
        MOVR    R2,     R3                      ; 5908   0093
        SLLC    R0,     1                       ; 5909   0058
        TSTR    R3                              ; 590A   009B
        SLLC    R0,     1                       ; 590B   0058
        NEGR    R0                              ; 590C   0020
        SLLC    R1,     1                       ; 590D   0059
        RSWD    R6                              ; 590E   003E
        SLLC    R1,     1                       ; 590F   0059
        SLLC    R1,     2                       ; 5910   005D
        SLLC    R1,     1                       ; 5911   0059
        SARC    R0,     2                       ; 5912   007C
        SLLC    R1,     1                       ; 5913   0059
        MOVR    R3,     R7                      ; 5914   009F

        DECLE   $0059,  $00C4,  $0059,  $00E8   ; 5915   0059 00C4 0059 00E8
        DECLE   $0059,  $000C,  $005A,  $0031   ; 5919   0059 000C 005A 0031
        DECLE   $005A,  $0056,  $005A,  $00C5   ; 591D   005A 0056 005A 00C5
        DECLE   $00E0,  $00E5,  $00E0,  $0061   ; 5921   00E0 00E5 00E0 0061
        DECLE   $0081,  $00A5,  $00E0,  $0041   ; 5925   0081 00A5 00E0 0041
        DECLE   $00E0,  $00E0,  $0021,  $0065   ; 5929   00E0 00E0 0021 0065
        DECLE   $0081,  $0065,  $00A1,  $00E0   ; 592D   0081 0065 00A1 00E0
        DECLE   $0021,  $00E0,  $0061,  $00E0   ; 5931   0021 00E0 0061 00E0
        DECLE   $00E0,  $0061,  $0045,  $00E0   ; 5935   00E0 0061 0045 00E0
        DECLE   $00A1,  $00E0,  $00E5,  $0041   ; 5939   00A1 00E0 00E5 0041
        DECLE   $0025,  $0021,  $0070,  $0041   ; 593D   0025 0021 0070 0041
        DECLE   $00E0,  $00E0,  $00F0,  $00E0   ; 5941   00E0 00E0 00F0 00E0
        DECLE   $00B0,  $00A5,  $00E0,  $0061   ; 5945   00B0 00A5 00E0 0061
        DECLE   $0045,  $009A,  $0025,  $00E0   ; 5949   0045 009A 0025 00E0
        DECLE   $00E5,  $00B0,  $0021,  $0045   ; 594D   00E5 00B0 0021 0045
        DECLE   $0061,  $00E0,  $00A5,  $00E0   ; 5951   0061 00E0 00A5 00E0
        DECLE   $00E0,  $00B0,  $0025,  $00E0   ; 5955   00E0 00B0 0025 00E0
        DECLE   $00E5,  $00BA,  $0090,  $00E0   ; 5959   00E5 00BA 0090 00E0
        DECLE   $00F6,  $00E0,  $0025,  $00E0   ; 595D   00F6 00E0 0025 00E0
        DECLE   $0025,  $0096,  $00C1,  $0076   ; 5961   0025 0096 00C1 0076
        DECLE   $009A,  $0041,  $00E0,  $00E0   ; 5965   009A 0041 00E0 00E0
        DECLE   $00B6,  $0085,  $0061,  $0061   ; 5969   00B6 0085 0061 0061
        DECLE   $00F6,  $00E0,  $0070,  $0061   ; 596D   00F6 00E0 0070 0061
        DECLE   $00E0,  $00E0,  $00C5,  $0089   ; 5971   00E0 00E0 00C5 0089
        DECLE   $0096,  $00C1,  $00E0,  $00F7   ; 5975   0096 00C1 00E0 00F7

        RLC     R2,     2                       ; 5979   0056
        MOVR    R2,     R6                      ; 597A   0096
        ADDR    R4,     R0                      ; 597B   00E0
        ADDR    R6,     R3                      ; 597C   00F3
        ADDR    R3,     R2                      ; 597D   00DA
        ADDR    R0,     R1                      ; 597E   00C1
        RRC     R3,     2                       ; 597F   0077
        SLL     R1,     1                       ; 5980   0049
        RRC     R3,     1                       ; 5981   0073
        ADDR    R4,     R0                      ; 5982   00E0
        MOVR    R6,     R3                      ; 5983   00B3
        MOVR    R2,     R6                      ; 5984   0096
        ADCR    R1                              ; 5985   0029
        ADDR    R4,     R0                      ; 5986   00E0
        SWAP    R1,     2                       ; 5987   0045
        ADDR    R2,     R7                      ; 5988   00D7

        DECLE   $009D,  $0041,  $0041,  $0025   ; 5989   009D 0041 0041 0025
        DECLE   $00BA,  $00B3,  $009A,  $0096   ; 598D   00BA 00B3 009A 0096
        DECLE   $004C,  $0065,  $0061,  $00C1   ; 5991   004C 0065 0061 00C1
        DECLE   $007A,  $00AA,  $0093,  $00E0   ; 5995   007A 00AA 0093 00E0
        DECLE   $0085,  $00A9,  $0070,  $005D   ; 5999   0085 00A9 0070 005D
        DECLE   $0093,  $00E0,  $00E0,  $00E0   ; 599D   0093 00E0 00E0 00E0
        DECLE   $0036                           ; 59A1   0036

        NEGR    R5                              ; 59A2   0025
        ADDR    R7,     R2                      ; 59A3   00FA
        SLL     R2,     1                       ; 59A4   004A
        ADDR    R4,     R0                      ; 59A5   00E0
        MOVR    R3,     R2                      ; 59A6   009A
        ADDR    R4,     R0                      ; 59A7   00E0
        SARC    R1,     2                       ; 59A8   007D
        ADCR    R2                              ; 59A9   002A
        RRC     R0,     1                       ; 59AA   0070
        SLL     R0,     2                       ; 59AB   004C
        MOVR    R0,     R1                      ; 59AC   0081
        RRC     R0,     1                       ; 59AD   0070
        ADDR    R4,     R0                      ; 59AE   00E0
        ADDR    R4,     R0                      ; 59AF   00E0
        SWAP    R1,     2                       ; 59B0   0045
        ADDR    R2,     R6                      ; 59B1   00D6
        ADDR    R2,     R7                      ; 59B2   00D7

        DECLE   $0096,  $0093,  $004D,  $0085   ; 59B3   0096 0093 004D 0085
        DECLE   $00C1,  $00E0,  $0036,  $00AB   ; 59B7   00C1 00E0 0036 00AB
        DECLE   $00E0,  $005A,  $0070,  $00E0   ; 59BB   00E0 005A 0070 00E0
        DECLE   $004A,  $0076,  $00E0,  $0057   ; 59BF   004A 0076 00E0 0057
        DECLE   $00E0,  $00C1,  $00DD,  $00B7   ; 59C3   00E0 00C1 00DD 00B7

        TSTR    R6                              ; 59C7   00B6
        SLL     R3,     1                       ; 59C8   004B
        MOVR    R0,     R5                      ; 59C9   0085
        MOVR    R2,     R6                      ; 59CA   0096
        ADDR    R4,     R5                      ; 59CB   00E5
        SAR     R3,     1                       ; 59CC   006B
        RRC     R2,     2                       ; 59CD   0076
        SLL     R1,     2                       ; 59CE   004D
        ADDR    R4,     R0                      ; 59CF   00E0
        RRC     R2,     2                       ; 59D0   0076
        SWAP    R1,     2                       ; 59D1   0045
        ADDR    R4,     R0                      ; 59D2   00E0
        SWAP    R1,     2                       ; 59D3   0045
        ADDR    R4,     R0                      ; 59D4   00E0
        RSWD    R5                              ; 59D5   003D
        MOVR    R4,     R5                      ; 59D6   00A5
        SARC    R1,     2                       ; 59D7   007D
        SWAP    R1,     2                       ; 59D8   0045
        SAR     R2,     2                       ; 59D9   006E
        MOVR    R0,     R1                      ; 59DA   0081
        RLC     R0,     1                       ; 59DB   0050
        ADDR    R4,     R0                      ; 59DC   00E0
        RRC     R3,     2                       ; 59DD   0077
        SLLC    R1,     2                       ; 59DE   005D
        MOVR    R4,     R1                      ; 59DF   00A1
        ADDR    R2,     R6                      ; 59E0   00D6
        RRC     R2,     2                       ; 59E1   0076
        NEGR    R5                              ; 59E2   0025
        MOVR    R5,     R3                      ; 59E3   00AB
        RRC     R3,     1                       ; 59E4   0073
        NEGR    R5                              ; 59E5   0025
        ADDR    R0,     R0                      ; 59E6   00C0
        ADDR    R4,     R0                      ; 59E7   00E0
        ADDR    R4,     R0                      ; 59E8   00E0
        SLR     R1,     2                       ; 59E9   0065
        RRC     R3,     2                       ; 59EA   0077
        MOVR    R2,     R0                      ; 59EB   0090
        MOVR    R7,     R5                      ; 59EC   00BD
        ADDR    R4,     R0                      ; 59ED   00E0
        NEGR    R1                              ; 59EE   0021
        SLLC    R1,     2                       ; 59EF   005D
        MOVR    R4,     R1                      ; 59F0   00A1
        ADDR    R4,     R0                      ; 59F1   00E0
        GSWD    R3                              ; 59F2   0033
        SLL     R2,     2                       ; 59F3   004E
        MOVR    R3,     R2                      ; 59F4   009A
        MOVR    R2,     R3                      ; 59F5   0093
        NEGR    R1                              ; 59F6   0021
        ADDR    R6,     R0                      ; 59F7   00F0
        ADDR    R4,     R0                      ; 59F8   00E0
        ADDR    R4,     R0                      ; 59F9   00E0
        SWAP    R1,     1                       ; 59FA   0041
        SLR     R1,     2                       ; 59FB   0065
        MOVR    R4,     R1                      ; 59FC   00A1
        SLL     R3,     2                       ; 59FD   004F
        SARC    R2,     1                       ; 59FE   007A
        MOVR    R2,     R6                      ; 59FF   0096
        MOVR    R3,     R2                      ; 5A00   009A
        RRC     R0,     1                       ; 5A01   0070
        ADDR    R4,     R0                      ; 5A02   00E0
        ADDR    R0,     R1                      ; 5A03   00C1
        SLLC    R1,     2                       ; 5A04   005D
        RRC     R3,     1                       ; 5A05   0073
        SLLC    R2,     1                       ; 5A06   005A
        MOVR    R0,     R1                      ; 5A07   0081
        MOVR    R4,     R5                      ; 5A08   00A5
        MOVR    R4,     R5                      ; 5A09   00A5
        SWAP    R0,     1                       ; 5A0A   0040
        ADDR    R7,     R6                      ; 5A0B   00FE
        NEGR    R1                              ; 5A0C   0021
        ADDR    R4,     R0                      ; 5A0D   00E0
        ADDR    R4,     R0                      ; 5A0E   00E0
        RRC     R2,     2                       ; 5A0F   0076
        MOVR    R4,     R1                      ; 5A10   00A1
        SLR     R1,     1                       ; 5A11   0061
        ADDR    R4,     R5                      ; 5A12   00E5
        ADDR    R4,     R0                      ; 5A13   00E0
        NEGR    R1                              ; 5A14   0021
        ADDR    R5,     R7                      ; 5A15   00EF

        MOVR    R2,     R6                      ; 5A16   0096
        ADDR    R4,     R1                      ; 5A17   00E1
        ADDR    R6,     R6                      ; 5A18   00F6
        ADDR    R4,     R0                      ; 5A19   00E0
        MOVR    R0,     R1                      ; 5A1A   0081
        ADDR    R4,     R0                      ; 5A1B   00E0
        ADDR    R4,     R0                      ; 5A1C   00E0
        SLR     R1,     1                       ; 5A1D   0061
        MOVR    R2,     R6                      ; 5A1E   0096
        MOVR    R2,     R3                      ; 5A1F   0093
        MOVR    R2,     R6                      ; 5A20   0096
        RRC     R2,     2                       ; 5A21   0076
        SWAP    R1,     1                       ; 5A22   0041
        NEGR    R1                              ; 5A23   0021
        ADDR    R4,     R0                      ; 5A24   00E0
        NEGR    R1                              ; 5A25   0021
        MOVR    R2,     R7                      ; 5A26   0097

        DECLE   $0056,  $00E0,  $0041,  $00A1   ; 5A27   0056 00E0 0041 00A1
        DECLE   $009B,  $003C,  $003E,  $003B   ; 5A2B   009B 003C 003E 003B
        DECLE   $003C,  $003E,  $00E0,  $00E0   ; 5A2F   003C 003E 00E0 00E0
        DECLE   $00F3,  $0061,  $00E0,  $00E0   ; 5A33   00F3 0061 00E0 00E0
        DECLE   $0061,  $00E0,  $00A5,  $00BD   ; 5A37   0061 00E0 00A5 00BD
        DECLE   $0065,  $00E0,  $0093,  $00E1   ; 5A3B   0065 00E0 0093 00E1
        DECLE   $00E0,  $0021,  $00E0,  $00A5   ; 5A3F   00E0 0021 00E0 00A5
        DECLE   $005D,  $0041,  $00BD,  $0073   ; 5A43   005D 0041 00BD 0073
        DECLE   $0025,  $00E1,  $00E0,  $00DD   ; 5A47   0025 00E1 00E0 00DD
        DECLE   $0021,  $00E0,  $00E0,  $0040   ; 5A4B   0021 00E0 00E0 0040
        DECLE   $007B,  $003C,  $003E,  $003B   ; 5A4F   007B 003C 003E 003B
        DECLE   $003C,  $003E,  $0020,  $00E0   ; 5A53   003C 003E 0020 00E0
        DECLE   $00E0,  $0061,  $0061,  $00E0   ; 5A57   00E0 0061 0061 00E0
        DECLE   $0065,  $00E0,  $00E1,  $00E0   ; 5A5B   0065 00E0 00E1 00E0
        DECLE   $00A1,  $00E0,  $0081,  $00A1   ; 5A5F   00A1 00E0 0081 00A1
        DECLE   $00E0,  $00E0,  $00E0,  $0021   ; 5A63   00E0 00E0 00E0 0021
        DECLE   $00E0,  $0021,  $00E0,  $0025   ; 5A67   00E0 0021 00E0 0025
        DECLE   $0061,  $00E0,  $00E0,  $00E0   ; 5A6B   0061 00E0 00E0 00E0
        DECLE   $0061,  $00E0,  $00E0,  $0061   ; 5A6F   0061 00E0 00E0 0061
        DECLE   $0060,  $005B,  $003C,  $003E   ; 5A73   0060 005B 003C 003E
        DECLE   $00A0,  $00FF,  $008D,  $005A   ; 5A77   00A0 00FF 008D 005A
        DECLE   $00BD,  $005A,  $00EC,  $005A   ; 5A7B   00BD 005A 00EC 005A
        DECLE   $001C,  $005B,  $004E,  $005B   ; 5A7F   001C 005B 004E 005B
        DECLE   $0080,  $005B,  $00B2,  $005B   ; 5A83   0080 005B 00B2 005B
        DECLE   $00E6,  $005B,  $001F,  $005C   ; 5A87   00E6 005B 001F 005C
        DECLE   $0056,  $005C,  $00E0,  $00E0   ; 5A8B   0056 005C 00E0 00E0
        DECLE   $00C0,  $0045,  $0021,  $00E0   ; 5A8F   00C0 0045 0021 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 5A93   00E0 00E0 00E0 00E0
        DECLE   $0090,  $0045,  $00E0,  $00E0   ; 5A97   0090 0045 00E0 00E0
        DECLE   $00E0,  $00C5,  $00E0,  $00E0   ; 5A9B   00E0 00C5 00E0 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 5A9F   00E0 00E0 00E0 00E0
        DECLE   $00E0,  $0081,  $00E0,  $00E0   ; 5AA3   00E0 0081 00E0 00E0
        DECLE   $00E0,  $00E0,  $0041,  $0065   ; 5AA7   00E0 00E0 0041 0065
        DECLE   $00E0,  $00E0,  $00E0,  $00A5   ; 5AAB   00E0 00E0 00E0 00A5
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 5AAF   00E0 00E0 00E0 00E0
        DECLE   $00BA,  $00E0,  $00E0,  $00E0   ; 5AB3   00BA 00E0 00E0 00E0
        DECLE   $0065,  $0065,  $00E0,  $00E0   ; 5AB7   0065 0065 00E0 00E0
        DECLE   $0025,  $0021,  $00E0,  $00E0   ; 5ABB   0025 0021 00E0 00E0
        DECLE   $00E0,  $007A,  $0065,  $00E0   ; 5ABF   00E0 007A 0065 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 5AC3   00E0 00E0 00E0 00E0
        DECLE   $0033,  $00E0,  $00E0,  $00E0   ; 5AC7   0033 00E0 00E0 00E0
        DECLE   $00E0,  $00FA,  $00E0,  $00E0   ; 5ACB   00E0 00FA 00E0 00E0
        DECLE   $0045,  $00E5,  $00C5,  $00C5   ; 5ACF   0045 00E5 00C5 00C5
        DECLE   $00FA,  $00E0,  $00E5,  $00E0   ; 5AD3   00FA 00E0 00E5 00E0
        DECLE   $0025,  $00FA,  $00E0,  $0065   ; 5AD7   0025 00FA 00E0 0065
        DECLE   $00E0,  $0025,  $0090,  $00E0   ; 5ADB   00E0 0025 0090 00E0
        DECLE   $00A5,  $00E0,  $00E0,  $007D   ; 5ADF   00A5 00E0 00E0 007D
        DECLE   $0025,  $00E0,  $00E0,  $00E0   ; 5AE3   0025 00E0 00E0 00E0
        DECLE   $0050,  $007A,  $00E0,  $00C1   ; 5AE7   0050 007A 00E0 00C1
        DECLE   $00E0,  $0085,  $00E0,  $0021   ; 5AEB   00E0 0085 00E0 0021
        DECLE   $00DD,  $0090,  $00E0,  $0065   ; 5AEF   00DD 0090 00E0 0065
        DECLE   $00E0,  $00A5,  $00E0,  $00E0   ; 5AF3   00E0 00A5 00E0 00E0
        DECLE   $00E0,  $00E0,  $00A1,  $00E0   ; 5AF7   00E0 00E0 00A1 00E0
        DECLE   $005D,  $00E0,  $00C1,  $0045   ; 5AFB   005D 00E0 00C1 0045
        DECLE   $00E0,  $00E0,  $0021,  $00F0   ; 5AFF   00E0 00E0 0021 00F0
        DECLE   $00DD,  $00E0,  $00E0,  $00E0   ; 5B03   00DD 00E0 00E0 00E0
        DECLE   $0065,  $0050,  $009D,  $00C5   ; 5B07   0065 0050 009D 00C5
        DECLE   $00E0,  $0041,  $00F3,  $00E0   ; 5B0B   00E0 0041 00F3 00E0
        DECLE   $0065,  $00E5,  $00E1,  $0065   ; 5B0F   0065 00E5 00E1 0065
        DECLE   $00E0,  $00E0,  $00E0,  $0033   ; 5B13   00E0 00E0 00E0 0033
        DECLE   $007D,  $00E0,  $0041,  $005A   ; 5B17   007D 00E0 0041 005A
        DECLE   $00E0,  $0090,  $0021,  $00F0   ; 5B1B   00E0 0090 0021 00F0
        DECLE   $00E0,  $0093,  $00E0,  $009A   ; 5B1F   00E0 0093 00E0 009A
        DECLE   $00E0,  $00D0,  $00A5,  $00E0   ; 5B23   00E0 00D0 00A5 00E0
        DECLE   $0041,  $0061,  $00E0,  $005A   ; 5B27   0041 0061 00E0 005A
        DECLE   $0070,  $00E0,  $00E0,  $0025   ; 5B2B   0070 00E0 00E0 0025
        DECLE   $00E0,  $00E0,  $0021,  $0065   ; 5B2F   00E0 00E0 0021 0065
        DECLE   $00E0,  $0053,  $00E0,  $0041   ; 5B33   00E0 0053 00E0 0041
        DECLE   $00BA,  $00E0,  $00E0,  $0093   ; 5B37   00BA 00E0 00E0 0093
        DECLE   $00E0,  $0061,  $00A1,  $0070   ; 5B3B   00E0 0061 00A1 0070
        DECLE   $007A,  $00E0,  $00A1,  $00E0   ; 5B3F   007A 00E0 00A1 00E0
        DECLE   $00DA,  $0070,  $00C1,  $00E0   ; 5B43   00DA 0070 00C1 00E0
        DECLE   $0081,  $00E0,  $00E0,  $00E0   ; 5B47   0081 00E0 00E0 00E0
        DECLE   $00B0,  $003D,  $00E0,  $0093   ; 5B4B   00B0 003D 00E0 0093
        DECLE   $0025,  $00F3,  $00E0,  $00E0   ; 5B4F   0025 00F3 00E0 00E0
        DECLE   $00E0,  $007D,  $0070,  $00E0   ; 5B53   00E0 007D 0070 00E0
        DECLE   $0033,  $00E0,  $00E0,  $00A5   ; 5B57   0033 00E0 00E0 00A5
        DECLE   $00E0,  $00DD,  $0073,  $00F0   ; 5B5B   00E0 00DD 0073 00F0
        DECLE   $00E0,  $0030,  $00E0,  $00E0   ; 5B5F   00E0 0030 00E0 00E0
        DECLE   $0045,  $00E0,  $00E0,  $00E0   ; 5B63   0045 00E0 00E0 00E0
        DECLE   $00D0,  $007D,  $00A5,  $00E0   ; 5B67   00D0 007D 00A5 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 5B6B   00E0 00E0 00E0 00E0
        DECLE   $0033,  $007D,  $00E0,  $00E5   ; 5B6F   0033 007D 00E0 00E5
        DECLE   $00E0,  $009D,  $0073,  $00E0   ; 5B73   00E0 009D 0073 00E0
        DECLE   $0045,  $00E0,  $0030,  $00E0   ; 5B77   0045 00E0 0030 00E0
        DECLE   $00E0,  $00E0,  $00D3,  $0060   ; 5B7B   00E0 00E0 00D3 0060
        DECLE   $00E0,  $00E0,  $00E0,  $00A5   ; 5B7F   00E0 00E0 00E0 00A5
        DECLE   $00E0,  $0061,  $00E0,  $00D3   ; 5B83   00E0 0061 00E0 00D3
        DECLE   $007A,  $00E0,  $003A,  $00E0   ; 5B87   007A 00E0 003A 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 5B8B   00E0 00E0 00E0 00E0
        DECLE   $00E0,  $0053,  $007A,  $0073   ; 5B8F   00E0 0053 007A 0073
        DECLE   $00E0,  $00E0,  $00C1,  $00E0   ; 5B93   00E0 00E0 00C1 00E0
        DECLE   $00E0,  $00E0,  $0053,  $00E0   ; 5B97   00E0 00E0 0053 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $0070   ; 5B9B   00E0 00E0 00E0 0070
        DECLE   $007A,  $00E0,  $00E0,  $00E0   ; 5B9F   007A 00E0 00E0 00E0
        DECLE   $00BA,  $0070,  $0021,  $00E0   ; 5BA3   00BA 0070 0021 00E0
        DECLE   $00E0,  $00E0,  $0050,  $00E0   ; 5BA7   00E0 00E0 0050 00E0
        DECLE   $0093,  $00E0,  $00E0,  $0070   ; 5BAB   0093 00E0 00E0 0070
        DECLE   $00E0,  $00C0,  $00E0,  $00E0   ; 5BAF   00E0 00C0 00E0 00E0
        DECLE   $00E0,  $0021,  $00E0,  $00E0   ; 5BB3   00E0 0021 00E0 00E0
        DECLE   $00E0,  $00C1,  $00BD,  $00E0   ; 5BB7   00E0 00C1 00BD 00E0
        DECLE   $003D,  $00E0,  $003A,  $00E0   ; 5BBB   003D 00E0 003A 00E0
        DECLE   $005A,  $0090,  $00E0,  $00E0   ; 5BBF   005A 0090 00E0 00E0
        DECLE   $0021,  $009D,  $00E0,  $00F0   ; 5BC3   0021 009D 00E0 00F0
        DECLE   $00E0,  $0030,  $00E0,  $00A1   ; 5BC7   00E0 0030 00E0 00A1
        DECLE   $0065,  $00A5,  $00D0,  $00E0   ; 5BCB   0065 00A5 00D0 00E0
        DECLE   $0021,  $00E0,  $0073,  $007D   ; 5BCF   0021 00E0 0073 007D
        DECLE   $00E0,  $00E0,  $0085,  $00BD   ; 5BD3   00E0 00E0 0085 00BD
        DECLE   $0073,  $00E0,  $00C1,  $00E0   ; 5BD7   0073 00E0 00C1 00E0
        DECLE   $0093,  $009A,  $00E0,  $00E0   ; 5BDB   0093 009A 00E0 00E0
        DECLE   $00E0,  $0073,  $00E0,  $0025   ; 5BDF   00E0 0073 00E0 0025
        DECLE   $0041,  $0040,  $00FE,  $00E0   ; 5BE3   0041 0040 00FE 00E0
        DECLE   $007A,  $0021,  $00E0,  $00E0   ; 5BE7   007A 0021 00E0 00E0
        DECLE   $007A,  $0070,  $00E0,  $0065   ; 5BEB   007A 0070 00E0 0065
        DECLE   $00E0,  $0041,  $00E0,  $003D   ; 5BEF   00E0 0041 00E0 003D
        DECLE   $00E0,  $005D,  $0093,  $0025   ; 5BF3   00E0 005D 0093 0025
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 5BF7   00E0 00E0 00E0 00E0
        DECLE   $003A,  $0073,  $00E0,  $0033   ; 5BFB   003A 0073 00E0 0033
        DECLE   $00BA,  $00E0,  $0045,  $00E0   ; 5BFF   00BA 00E0 0045 00E0
        DECLE   $00E0,  $0053,  $00E0,  $00E0   ; 5C03   00E0 0053 00E0 00E0
        DECLE   $0085,  $00E0,  $009A,  $00E0   ; 5C07   0085 00E0 009A 00E0
        DECLE   $00E0,  $0025,  $00E0,  $00E0   ; 5C0B   00E0 0025 00E0 00E0
        DECLE   $0050,  $00A5,  $00E1,  $00DD   ; 5C0F   0050 00A5 00E1 00DD
        DECLE   $00E0,  $00E0,  $00C1,  $00BA   ; 5C13   00E0 00E0 00C1 00BA
        DECLE   $0081,  $0040,  $009B,  $003C   ; 5C17   0081 0040 009B 003C
        DECLE   $003E,  $003B,  $003C,  $003E   ; 5C1B   003E 003B 003C 003E
        DECLE   $00E0,  $007D,  $0085,  $00E0   ; 5C1F   00E0 007D 0085 00E0
        DECLE   $00FD,  $0073,  $00E0,  $0025   ; 5C23   00FD 0073 00E0 0025
        DECLE   $00E0,  $00E0,  $00C1,  $00B0   ; 5C27   00E0 00E0 00C1 00B0
        DECLE   $00E0,  $0025,  $00E0,  $00E0   ; 5C2B   00E0 0025 00E0 00E0
        DECLE   $00E0,  $00E0,  $00BD,  $00E0   ; 5C2F   00E0 00E0 00BD 00E0
        DECLE   $003A,  $00E0,  $007D,  $00E0   ; 5C33   003A 00E0 007D 00E0
        DECLE   $00E0,  $00E0,  $00A5,  $00BA   ; 5C37   00E0 00E0 00A5 00BA
        DECLE   $0085,  $00A1,  $00F0,  $005D   ; 5C3B   0085 00A1 00F0 005D
        DECLE   $0025,  $00E0,  $00E0,  $00E0   ; 5C3F   0025 00E0 00E0 00E0
        DECLE   $003A,  $00D3,  $00E0,  $00E0   ; 5C43   003A 00D3 00E0 00E0
        DECLE   $00C5,  $00E0,  $009A,  $00E0   ; 5C47   00C5 00E0 009A 00E0
        DECLE   $00C5,  $005D,  $00A5,  $0020   ; 5C4B   00C5 005D 00A5 0020
        DECLE   $007B,  $003C,  $003E,  $003B   ; 5C4F   007B 003C 003E 003B
        DECLE   $003C,  $003E,  $0020,  $00E5   ; 5C53   003C 003E 0020 00E5
        DECLE   $00E0,  $00E0,  $00E0,  $0045   ; 5C57   00E0 00E0 00E0 0045
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 5C5B   00E0 00E0 00E0 00E0
        DECLE   $00E0,  $0041,  $0073,  $00E0   ; 5C5F   00E0 0041 0073 00E0
        DECLE   $0065,  $00E0,  $00E0,  $00E0   ; 5C63   0065 00E0 00E0 00E0
        DECLE   $00E0,  $0085,  $00DD,  $00E0   ; 5C67   00E0 0085 00DD 00E0
        DECLE   $0041,  $00E0,  $00E0,  $00E0   ; 5C6B   0041 00E0 00E0 00E0
        DECLE   $00E0,  $00DD,  $00E0,  $00E0   ; 5C6F   00E0 00DD 00E0 00E0
        DECLE   $0041,  $0073,  $0065,  $00E0   ; 5C73   0041 0073 0065 00E0
        DECLE   $00E0,  $00E0,  $007D,  $00C5   ; 5C77   00E0 00E0 007D 00C5
        DECLE   $00E0,  $00C1,  $00E0,  $00E0   ; 5C7B   00E0 00C1 00E0 00E0
        DECLE   $007D,  $00E0,  $00E0,  $0061   ; 5C7F   007D 00E0 00E0 0061
        DECLE   $00C5,  $005B,  $003C,  $003E   ; 5C83   00C5 005B 003C 003E
        DECLE   $00A0,  $00FF,  $0008,  $0008   ; 5C87   00A0 00FF 0008 0008
        DECLE   $0005,  $0015,  $001D,  $0025   ; 5C8B   0005 0015 001D 0025
        DECLE   $002D,  $0035,  $003D,  $0045   ; 5C8F   002D 0035 003D 0045
        DECLE   $000D,  $007D,  $0085,  $008D   ; 5C93   000D 007D 0085 008D
        DECLE   $0095,  $009D,  $00A5,  $00AD   ; 5C97   0095 009D 00A5 00AD
        DECLE   $00B6,  $00BE,  $00C6,  $00CE   ; 5C9B   00B6 00BE 00C6 00CE
        DECLE   $00D6,  $00DE,  $00E6,  $00EE   ; 5C9F   00D6 00DE 00E6 00EE
        DECLE   $00F6,  $00FE,  $0106,  $010E   ; 5CA3   00F6 00FE 0106 010E
        DECLE   $0116,  $011E,  $004A,  $005F   ; 5CA7   0116 011E 004A 005F
        DECLE   $0008,  $0008,  $0008,  $0008   ; 5CAB   0008 0008 0008 0008
        DECLE   $005F,  $0052,  $0008,  $0008   ; 5CAF   005F 0052 0008 0008
        DECLE   $0008,  $0008,  $005F,  $005F   ; 5CB3   0008 0008 005F 005F
        DECLE   $0008,  $0008,  $0008,  $0008   ; 5CB7   0008 0008 0008 0008
        DECLE   $0122,  $0122,  $0000,  $0000   ; 5CBB   0122 0122 0000 0000
        DECLE   $0008,  $0158,  $0158,  $0160   ; 5CBF   0008 0158 0158 0160
        DECLE   $0000,  $0000                   ; 5CC3   0000 0000

        CMPR    R4,     R0                      ; 5CC5   0160
        INCR    R0                              ; 5CC6   0008
        PSHR    R5                              ; 5CC7   0275
        MVII    #$0081, R0                      ; 5CC8   02B8 0081
        MVO     R0,     G_0146                  ; 5CCA   0240 0146

        JSR     R5,     X_PLAY_MUS2             ; 5CCC   0004 0118 035D
        DECLE   $018C                           ; 5CCF  Note (short)
        DECLE   $018C                           ; 5CD0  Note (short)
        DECLE   $01FC                           ; 5CD1  Note (short)
        DECLE   $01FC                           ; 5CD2  Note (short)
        DECLE   $021C                           ; 5CD3  Note (short)
        DECLE   $0214                           ; 5CD4  Note (short)
        DECLE   $01FE                           ; 5CD5  Note (short)
        DECLE   $01DC                           ; 5CD6  Note (short)
        DECLE   $01DC                           ; 5CD7  Note (short)
        DECLE   $01CC                           ; 5CD8  Note (short)
        DECLE   $01CC                           ; 5CD9  Note (short)
        DECLE   $01AC                           ; 5CDA  Note (short)
        DECLE   $01A4                           ; 5CDB  Note (short)
        DECLE   $0186                           ; 5CDC  Note (short)
        DECLE   $0000                           ; 5CDD  End of music

        PULR    R7                              ; 5CDE   02B7

        PSHR    R5                              ; 5CDF   0275
        MVII    #$0081, R0                      ; 5CE0   02B8 0081
        MVO     R0,     G_0146                  ; 5CE2   0240 0146

        JSR     R5,     X_PLAY_MUS2             ; 5CE4   0004 0118 035D
        DECLE   $018E                           ; 5CE7  Note (short)
        DECLE   $01AC                           ; 5CE8  Note (short)
        DECLE   $01AC                           ; 5CE9  Note (short)
        DECLE   $01CC                           ; 5CEA  Note (short)
        DECLE   $01CC                           ; 5CEB  Note (short)
        DECLE   $01DC                           ; 5CEC  Note (short)
        DECLE   $01DC                           ; 5CED  Note (short)
        DECLE   $01FE                           ; 5CEE  Note (short)
        DECLE   $021C                           ; 5CEF  Note (short)
        DECLE   $021C                           ; 5CF0  Note (short)
        DECLE   $01FC                           ; 5CF1  Note (short)
        DECLE   $01FC                           ; 5CF2  Note (short)
        DECLE   $018E                           ; 5CF3  Note (short)
        DECLE   $0000                           ; 5CF4  End of music

        PULR    R7                              ; 5CF5   02B7

        PSHR    R5                              ; 5CF6   0275

        JSR     R5,     X_PLAY_SFX1             ; 5CF7   0004 0118 03BB
        DECLE   $0079                           ; 5CFA  SFX data
        DECLE   $03ED                           ; 5CFB  SFX data
        DECLE   $03B7                           ; 5CFC  SFX data
        DECLE   $018C,  $0000                   ; 5CFD  SFX data
        DECLE   $000B                           ; 5CFF  SFX data
        DECLE   $000F,  $03FF                   ; 5D00  SFX data
        DECLE   $008F,  $003F                   ; 5D02  SFX data
        DECLE   $03CF                           ; 5D04  SFX end


        PSHR    R5                              ; 5D05   0275

        JSR     R5,     X_PLAY_SFX2             ; 5D06   0004 0118 03BE
        DECLE   $0040                           ; 5D09  SFX prio
        DECLE   $01C9,  $030D,  $021D,  $03C0   ; 5D0A   01C9 030D 021D 03C0
        DECLE   $0060,  $02C8,  $0080,  $02D5   ; 5D0E   0060 02C8 0080 02D5
        DECLE   $0001                           ; 5D12   0001

        SWAP    R0,     1                       ; 5D13   0040
        XOR@    R2,     R2                      ; 5D14   03D2
        XOR@    R5,     R2                      ; 5D15   03EA
        XOR@    R4,     R6                      ; 5D16   03E6
        SUBR    R0,     R3                      ; 5D17   0103
        XOR@    R2,     R0                      ; 5D18   03D0
        MOVR    R1,     R7                      ; 5D19   008F

        DECLE   $001F                           ; 5D1A   001F

        ADD@    R1,     R7                      ; 5D1B   02CF

L_5D1C:
        PSHR    R5                              ; 5D1C   0275
        MVII    #$0003, R0                      ; 5D1D   02B8 0003
        SDBD                                    ; 5D1F   0001
        MVII    #$5D34, R1                      ; 5D20   02B9 0034 005D
        MVII    #$031D, R2                      ; 5D23   02BA 031D

        JSR     R5,     X_INIT_MOBS             ; 5D25   0004 0114 02B4

        CLRR    R1                              ; 5D28   01C9
        MVO     R1,     G_032D                  ; 5D29   0241 032D
        MVII    #$0006, R0                      ; 5D2B   02B8 0006
        MVO     R0,     G_011A                  ; 5D2D   0240 011A
        MVII    #$002C, R0                      ; 5D2F   02B8 002C
        MVO     R0,     G_018B                  ; 5D31   0240 018B
        PULR    R7                              ; 5D33   02B7

        DECLE   $0041,  $001A,  $0062,  $005D   ; 5D34   0041 001A 0062 005D
        DECLE   $0000,  $0070,  $0000,  $0044   ; 5D38   0000 0070 0000 0044
        DECLE   $0000,  $0000,  $0002,  $0000   ; 5D3C   0000 0000 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D40   0000 0000 0000 0000
        DECLE   $0053,  $001A,  $0072,  $005D   ; 5D44   0053 001A 0072 005D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D48   0000 0000 0000 0000
        DECLE   $0004,  $0001,  $0004,  $0000   ; 5D4C   0004 0001 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $006B,  $005D   ; 5D54   0000 0000 006B 005D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D60   0000 0000 0000 0000
        DECLE   $00A5,  $0050,  $000D,  $0018   ; 5D64   00A5 0050 000D 0018
        DECLE   $0001,  $006B,  $0054,  $0000   ; 5D68   0001 006B 0054 0000
        DECLE   $0000                           ; 5D6C   0000

        SAR     R3,     1                       ; 5D6D   006B
        RLC     R1,     2                       ; 5D6E   0055

        JSR     R4,     .EXEC.001               ; 5D6F   0004 0010 0001
        DECLE   $0000,  $0000,  $0099,  $0050   ; 5D72   0000 0000 0099 0050
        DECLE   $0008,  $0000,  $0001           ; 5D76   0008 0000 0001

        SLR     R3,     2                       ; 5D79   0067
        RLC     R0,     2                       ; 5D7A   0054
L_5D7B:
        PSHR    R5                              ; 5D7B   0275
        MVII    #$018A, R4                      ; 5D7C   02BC 018A
        MVI     G_0121, R3                      ; 5D7E   0283 0121
        DECR    R3                              ; 5D80   0013
        BEQ     L_5D86                          ; 5D81   0204 0003

        MVI     G_0122, R3                      ; 5D83   0283 0122
        DECR    R3                              ; 5D85   0013
L_5D86:
        MVO     R3,     G_0187                  ; 5D86   0243 0187
        MVI     G_018C, R2                      ; 5D88   0282 018C
        PSHR    R2                              ; 5D8A   0272
        MVI@    R4,     R0                      ; 5D8B   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 5D8C   0004 0114 0268

        MOVR    R0,     R1                      ; 5D8F   0081
        MVI@    R4,     R5                      ; 5D90   02A5
        MVI     G_032C, R0                      ; 5D91   0280 032C
        TSTR    R3                              ; 5D93   009B
        BNEQ    L_5D97                          ; 5D94   020C 0001

        SLL     R0,     1                       ; 5D96   0048
L_5D97:
        MOVR    R2,     R3                      ; 5D97   0093
        SUBR    R5,     R3                      ; 5D98   012B
        BPL     L_5D9C                          ; 5D99   0203 0001

        NEGR    R3                              ; 5D9B   0023
L_5D9C:
        CMPI    #$0018, R3                      ; 5D9C   037B 0018
        BLE     L_5DA3                          ; 5D9E   0206 0003

        SUBI    #$0030, R3                      ; 5DA0   033B 0030
        NEGR    R3                              ; 5DA2   0023
L_5DA3:
        TSTR    R0                              ; 5DA3   0080
        BEQ     L_5DA8                          ; 5DA4   0204 0002

        ADDI    #$0009, R3                      ; 5DA6   02FB 0009
L_5DA8:
        ADDR    R5,     R0                      ; 5DA8   00E8
        BMI     L_5DAF                          ; 5DA9   020B 0004

        SUBI    #$0030, R0                      ; 5DAB   0338 0030
        BGE     L_5DB1                          ; 5DAD   020D 0002

L_5DAF:
        ADDI    #$0030, R0                      ; 5DAF   02F8 0030
L_5DB1:
        DECR    R4                              ; 5DB1   0014
        MVO@    R0,     R4                      ; 5DB2   0260
        MVO     R0,     G_018D                  ; 5DB3   0240 018D
        PULR    R0                              ; 5DB5   02B0

        JSR     R5,     L_5F80                  ; 5DB6   0004 015C 0380

        PSHR    R1                              ; 5DB9   0271
        MVI     G_018E, R1                      ; 5DBA   0281 018E

        JSR     R5,     X_MPY                   ; 5DBC   0004 011C 01DC

        MOVR    R2,     R0                      ; 5DBF   0090

        JSR     R5,     X_EXT_SIGN_HI           ; 5DC0   0004 0114 0269

        ADD@    R6,     R0                      ; 5DC3   02F0
        TSTR    R0                              ; 5DC4   0080
        BPL     L_5DCE                          ; 5DC5   0203 0007

        INCR    R0                              ; 5DC7   0008
        ADDR    R3,     R0                      ; 5DC8   00D8
        BMI     L_5DD3                          ; 5DC9   020B 0008

        CLRR    R0                              ; 5DCB   01C0
        B       L_5DD3                          ; 5DCC   0200 0005

L_5DCE:
        DECR    R0                              ; 5DCE   0010
        SUBR    R3,     R0                      ; 5DCF   0118
        BPL     L_5DD3                          ; 5DD0   0203 0001

        CLRR    R0                              ; 5DD2   01C0
L_5DD3:
        MVI     G_0160, R2                      ; 5DD3   0282 0160
        TSTR    R2                              ; 5DD5   0092
        BNEQ    L_5DE4                          ; 5DD6   020C 000C

        SDBD                                    ; 5DD8   0001
        CMPI    #$FFEC, R0                      ; 5DD9   0378 00EC 00FF
        BGE     L_5DE5                          ; 5DDC   020D 0007

        JSR     R5,     L_559A                  ; 5DDE   0004 0154 019A

        J       L_5532                          ; 5DE1   0004 0354 0132

L_5DE4:
        SAR     R0,     1                       ; 5DE4   0068
L_5DE5:
        DECR    R4                              ; 5DE5   0014
        DECR    R4                              ; 5DE6   0014
        PSHR    R2                              ; 5DE7   0272
        MVII    #$0012, R2                      ; 5DE8   02BA 0012
        SUB     G_018E, R2                      ; 5DEA   0302 018E
        SLL     R2,     2                       ; 5DEC   004E
        NEGR    R2                              ; 5DED   0022
        ADDI    #$0078, R2                      ; 5DEE   02FA 0078
        CMPR    R2,     R0                      ; 5DF0   0150
        BLE     L_5DF4                          ; 5DF1   0206 0001

        MOVR    R2,     R0                      ; 5DF3   0090
L_5DF4:
        PULR    R2                              ; 5DF4   02B2
        MVO@    R0,     R4                      ; 5DF5   0260
        MVII    #$0329, R3                      ; 5DF6   02BB 0329
        ADD     G_0161, R2                      ; 5DF8   02C2 0161
        BNEQ    L_5E64                          ; 5DFA   020C 0068

        MVI     G_018D, R2                      ; 5DFC   0282 018D
        SAR     R2,     1                       ; 5DFE   006A
        SDBD                                    ; 5DFF   0001
        ADDI    #$5EC1, R2                      ; 5E00   02FA 00C1 005E
        MVI@    R2,     R0                      ; 5E03   0290
        MOVR    R0,     R1                      ; 5E04   0081
        ANDI    #$000F, R1                      ; 5E05   03B9 000F
        MOVR    R0,     R2                      ; 5E07   0082
        SLR     R2,     2                       ; 5E08   0066
        SLR     R2,     2                       ; 5E09   0066
        ANDI    #$0007, R2                      ; 5E0A   03BA 0007
        SWAP    R0,     2                       ; 5E0C   0044
        BPL     L_5E10                          ; 5E0D   0203 0001

        NEGR    R2                              ; 5E0F   0022
L_5E10:
        MOVR    R2,     R0                      ; 5E10   0090

        JSR     R5,     X_PACK_BYTES            ; 5E11   0004 0114 034F

        MVO@    R0,     R3                      ; 5E14   0258
        SUBI    #$0007, R3                      ; 5E15   033B 0007
        MVI     G_018D, R2                      ; 5E17   0282 018D
        SAR     R2,     1                       ; 5E19   006A
        CMPI    #$000C, R2                      ; 5E1A   037A 000C
        BLE     L_5E21                          ; 5E1C   0206 0003

        NEGR    R2                              ; 5E1E   0022
        ADDI    #$0018, R2                      ; 5E1F   02FA 0018
L_5E21:
        SDBD                                    ; 5E21   0001
        ADDI    #$5ED9, R2                      ; 5E22   02FA 00D9 005E
        MVI@    R2,     R0                      ; 5E25   0290
        MOVR    R0,     R1                      ; 5E26   0081
        SLR     R0,     2                       ; 5E27   0064
        SLR     R0,     2                       ; 5E28   0064
        ANDI    #$000F, R1                      ; 5E29   03B9 000F
        MVO@    R1,     R3                      ; 5E2B   0259
        ADDI    #$0008, R3                      ; 5E2C   02FB 0008
        MVO@    R0,     R3                      ; 5E2E   0258
        SUBI    #$000D, R3                      ; 5E2F   033B 000D
        MVI@    R3,     R0                      ; 5E31   0298
        ADDI    #$0008, R3                      ; 5E32   02FB 0008
        MVI@    R3,     R1                      ; 5E34   0299
        SDBD                                    ; 5E35   0001
        ANDI    #$FDFF, R0                      ; 5E36   03B8 00FF 00FD
        SDBD                                    ; 5E39   0001
        ANDI    #$DDFF, R1                      ; 5E3A   03B9 00FF 00DD
        MVI     G_018D, R2                      ; 5E3D   0282 018D
        SAR     R2,     1                       ; 5E3F   006A
        CMPI    #$000C, R2                      ; 5E40   037A 000C
        BLE     L_5E48                          ; 5E42   0206 0004

        XORI    #$0200, R0                      ; 5E44   03F8 0200
        XORI    #$0200, R1                      ; 5E46   03F9 0200
L_5E48:
        SUBI    #$0003, R3                      ; 5E48   033B 0003
        MVI@    R3,     R2                      ; 5E4A   029A
        CMPI    #$0006, R2                      ; 5E4B   037A 0006
        BLE     L_5E51                          ; 5E4D   0206 0002

        XORI    #$0200, R1                      ; 5E4F   03F9 0200
L_5E51:
        SUBI    #$0005, R3                      ; 5E51   033B 0005
        MVO@    R0,     R3                      ; 5E53   0258
        PSHR    R3                              ; 5E54   0273
        ADDI    #$000D, R3                      ; 5E55   02FB 000D
        MVI@    R3,     R2                      ; 5E57   029A
        PULR    R3                              ; 5E58   02B3
        CMPI    #$0001, R2                      ; 5E59   037A 0001
        BGT     L_5E61                          ; 5E5B   020E 0004

        SDBD                                    ; 5E5D   0001
        XORI    #$2000, R1                      ; 5E5E   03F9 0000 0020
L_5E61:
        ADDI    #$0008, R3                      ; 5E61   02FB 0008
        MVO@    R1,     R3                      ; 5E63   0259
L_5E64:
        MVII    #$0321, R4                      ; 5E64   02BC 0321
        MVI     G_018C, R0                      ; 5E66   0280 018C
        MVI     G_018A, R3                      ; 5E68   0283 018A
        PSHR    R3                              ; 5E6A   0273
        PSHR    R0                              ; 5E6B   0270

        JSR     R5,     L_5F80                  ; 5E6C   0004 015C 0380

        MOVR    R0,     R1                      ; 5E6F   0081
        MOVR    R3,     R0                      ; 5E70   0098

        JSR     R5,     X_EXT_SIGN_LO           ; 5E71   0004 0114 0268
        JSR     R5,     X_MPY                   ; 5E74   0004 011C 01DC

        MOVR    R2,     R0                      ; 5E77   0090

        JSR     R5,     X_EXT_SIGN_HI           ; 5E78   0004 0114 0269

        MOVR    R0,     R3                      ; 5E7B   0083
        PULR    R0                              ; 5E7C   02B0

        JSR     R5,     L_5F8F                  ; 5E7D   0004 015C 038F

        MOVR    R0,     R1                      ; 5E80   0081
        PULR    R0                              ; 5E81   02B0

        JSR     R5,     X_EXT_SIGN_LO           ; 5E82   0004 0114 0268
        JSR     R5,     X_MPY                   ; 5E85   0004 011C 01DC

        MOVR    R2,     R0                      ; 5E88   0090

        JSR     R5,     X_EXT_SIGN_HI           ; 5E89   0004 0114 0269

        MOVR    R3,     R1                      ; 5E8C   0099

        JSR     R5,     X_PACK_BYTES            ; 5E8D   0004 0114 034F

        MVO@    R0,     R4                      ; 5E90   0260
        MVI     G_0178, R0                      ; 5E91   0280 0178
        TSTR    R0                              ; 5E93   0080
        BNEQ    L_5EC0                          ; 5E94   020C 002A

        MVI     G_0320, R2                      ; 5E96   0282 0320
        MVI     G_0321, R0                      ; 5E98   0280 0321

        JSR     R5,     X_EXT_SIGN_LO           ; 5E9A   0004 0114 0268

        SWAP    R2,     1                       ; 5E9D   0042
        ANDI    #$00FF, R2                      ; 5E9E   03BA 00FF
        CMPI    #$001D, R2                      ; 5EA0   037A 001D
        BGT     L_5EA8                          ; 5EA2   020E 0004

        SUBI    #$0008, R0                      ; 5EA4   0338 0008
        B       L_5EAE                          ; 5EA6   0200 0006

L_5EA8:
        CMPI    #$0027, R2                      ; 5EA8   037A 0027
        BLT     L_5EAE                          ; 5EAA   0205 0002

        ADDI    #$0008, R0                      ; 5EAC   02F8 0008
L_5EAE:
        MOVR    R0,     R3                      ; 5EAE   0083
        BPL     L_5EB2                          ; 5EAF   0203 0001

        CLRR    R3                              ; 5EB1   01DB
L_5EB2:
        NEGR    R3                              ; 5EB2   0023
        MVO     R3,     G_0192                  ; 5EB3   0243 0192
        MVI     G_0321, R0                      ; 5EB5   0280 0321

        JSR     R5,     X_UNPK_BYTES            ; 5EB7   0004 0114 0357

        ADDR    R3,     R1                      ; 5EBA   00D9

        JSR     R5,     X_PACK_BYTES            ; 5EBB   0004 0114 034F

        MVO     R0,     G_0321                  ; 5EBE   0240 0321
L_5EC0:
        PULR    R7                              ; 5EC0   02B7

        DECLE   $0004,  $0094,  $0094,  $0094   ; 5EC1   0004 0094 0094 0094
        DECLE   $0094,  $00E4,  $00C4,  $00B4   ; 5EC5   0094 00E4 00C4 00B4
        DECLE   $0004                           ; 5EC9   0004

        DIS                                     ; 5ECA   0003
        DIS                                     ; 5ECB   0003
        DECR    R4                              ; 5ECC   0014
        DECR    R4                              ; 5ECD   0014
        MOVR    R2,     R4                      ; 5ECE   0094
        MOVR    R2,     R4                      ; 5ECF   0094
        DECR    R4                              ; 5ED0   0014
        DIS                                     ; 5ED1   0003
        ADDR    R2,     R4                      ; 5ED2   00D4
        ADDR    R0,     R4                      ; 5ED3   00C4
        TSTR    R4                              ; 5ED4   00A4
        DECR    R4                              ; 5ED5   0014
        DECR    R4                              ; 5ED6   0014
        DECR    R4                              ; 5ED7   0014
        DECR    R4                              ; 5ED8   0014
        SLR     R0,     1                       ; 5ED9   0060
        RLC     R1,     1                       ; 5EDA   0051
        SWAP    R2,     1                       ; 5EDB   0042
        GSWD    R3                              ; 5EDC   0033
        NEGR    R4                              ; 5EDD   0024
        DECR    R5                              ; 5EDE   0015
        CLRC                                    ; 5EDF   0006
L_5EE0:
        DECR    R7                              ; 5EE0   0017

        ADCR    R0                              ; 5EE1   0028
        RSWD    R1                              ; 5EE2   0039
        SLL     R2,     1                       ; 5EE3   004A
        SLLC    R3,     1                       ; 5EE4   005B
        SAR     R0,     2                       ; 5EE5   006C
L_5EE6:
        PSHR    R5                              ; 5EE6   0275
        MVII    #$018F, R4                      ; 5EE7   02BC 018F
        SDBD                                    ; 5EE9   0001
        MVI@    R4,     R1                      ; 5EEA   02A1
        INCR    R1                              ; 5EEB   0009
        MVO     R1,     G_018F                  ; 5EEC   0241 018F
        SWAP    R1,     1                       ; 5EEE   0041
        MVO     R1,     G_0190                  ; 5EEF   0241 0190
        SWAP    R1,     1                       ; 5EF1   0041
        MVI     G_0191, R2                      ; 5EF2   0282 0191
        TSTR    R2                              ; 5EF4   0092
        BEQ     L_5F00                          ; 5EF5   0204 0009

        MVI     G_031D, R3                      ; 5EF7   0283 031D
        ANDI    #$0007, R3                      ; 5EF9   03BB 0007
        MVII    #$02D6, R4                      ; 5EFB   02BC 02D6

        JSR     R5,     L_58DD                  ; 5EFD   0004 0158 00DD

L_5F00:
        PULR    R7                              ; 5F00   02B7

L_5F01:
        PSHR    R5                              ; 5F01   0275
        MVII    #$0192, R4                      ; 5F02   02BC 0192
        MVI@    R4,     R0                      ; 5F04   02A0
        SWAP    R0,     1                       ; 5F05   0040
        SAR     R0,     2                       ; 5F06   006C
        SAR     R0,     2                       ; 5F07   006C
        SAR     R0,     1                       ; 5F08   0068
        MOVR    R4,     R3                      ; 5F09   00A3
        SDBD                                    ; 5F0A   0001
        ADD@    R4,     R0                      ; 5F0B   02E0
        MVO@    R0,     R3                      ; 5F0C   0258
        SWAP    R0,     1                       ; 5F0D   0040
        MOVR    R0,     R2                      ; 5F0E   0082
        INCR    R3                              ; 5F0F   000B
        SUB@    R3,     R0                      ; 5F10   0318
        MOVR    R2,     R1                      ; 5F11   0091
        ANDI    #$0007, R1                      ; 5F12   03B9 0007
        MVO@    R1,     R3                      ; 5F14   0259
        XORR    R1,     R2                      ; 5F15   01CA
        MVII    #$0197, R5                      ; 5F16   02BD 0197
        MVO@    R2,     R5                      ; 5F18   026A
        SUBR    R0,     R2                      ; 5F19   0102
        INCR    R5                              ; 5F1A   000D
        MVO@    R2,     R5                      ; 5F1B   026A
        MVII    #$0003, R3                      ; 5F1C   02BB 0003
        MVO@    R3,     R5                      ; 5F1E   026B
        MVII    #$0100, R5                      ; 5F1F   02BD 0100
        MVI@    R5,     R0                      ; 5F21   02A8
        MVO@    R0,     R4                      ; 5F22   0260
        MVI@    R5,     R0                      ; 5F23   02A8
        MVO@    R0,     R4                      ; 5F24   0260
        MVII    #$0039, R0                      ; 5F25   02B8 0039
        MVII    #$005F, R1                      ; 5F27   02B9 005F
        MVO     R0,     .ISRVEC.0               ; 5F29   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5F2B   0241 0101
L_5F2D:
        EIS                                     ; 5F2D   0002
        MVI     G_019A, R2                      ; 5F2E   0282 019A
        SARC    R2,     2                       ; 5F30   007E
        BC      L_5F2D                          ; 5F31   0221 0005
        BNOV    L_5F38                          ; 5F33   020A 0003

        JSR     R5,     L_576C                  ; 5F35   0004 0154 036C

L_5F38:
        PULR    R7                              ; 5F38   02B7

        PSHR    R5                              ; 5F39   0275
        MVII    #$0320, R2                      ; 5F3A   02BA 0320
        MVII    #$0008, R3                      ; 5F3C   02BB 0008
L_5F3E:
        MVII    #$0198, R5                      ; 5F3E   02BD 0198
        MVI@    R2,     R0                      ; 5F40   0290
        SDBD                                    ; 5F41   0001
        ADD@    R5,     R0                      ; 5F42   02E8
        MVO@    R0,     R2                      ; 5F43   0250
        MVI@    R3,     R0                      ; 5F44   0298
        MOVR    R0,     R1                      ; 5F45   0081
        ANDI    #$007F, R1                      ; 5F46   03B9 007F
        XORR    R1,     R0                      ; 5F48   01C8
        DECR    R5                              ; 5F49   0015
        ADD@    R5,     R1                      ; 5F4A   02E9
        ANDI    #$007F, R1                      ; 5F4B   03B9 007F
        XORR    R1,     R0                      ; 5F4D   01C8
        MVO@    R0,     R3                      ; 5F4E   0258
        ADDI    #$0008, R2                      ; 5F4F   02FA 0008
        INCR    R3                              ; 5F51   000B
        CMPI    #$0010, R3                      ; 5F52   037B 0010
        BNEQ    L_5F3E                          ; 5F54   022C 0017

        MVI     G_0194, R0                      ; 5F56   0280 0194
        MVO     R0,     .STIC.VDLY              ; 5F58   0240 0031
        MVO     R0,     .STIC.VIDEN             ; 5F5A   0240 0020
        MVI     G_0195, R0                      ; 5F5C   0280 0195
        MVI     G_0196, R1                      ; 5F5E   0281 0196
        MVO     R0,     .ISRVEC.0               ; 5F60   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5F62   0241 0101
        CLRR    R2                              ; 5F64   01D2
        MVI     G_0197, R0                      ; 5F65   0280 0197
        TSTR    R0                              ; 5F67   0080
        BEQ     L_5F78                          ; 5F68   0204 000E

        MVII    #$0200, R5                      ; 5F6A   02BD 0200
        MVII    #$0214, R4                      ; 5F6C   02BC 0214
L_5F6E:
        MVI@    R4,     R0                      ; 5F6E   02A0
        MVO@    R0,     R5                      ; 5F6F   0268
        CMPI    #$02DC, R5                      ; 5F70   037D 02DC
        BNEQ    L_5F6E                          ; 5F72   022C 0005

        MVII    #$0002, R2                      ; 5F74   02BA 0002
        MVII    #$0002, R0                      ; 5F76   02B8 0002
L_5F78:
        SLL     R2,     2                       ; 5F78   004E
        XORR    R0,     R2                      ; 5F79   01C2
        MVO     R2,     G_019A                  ; 5F7A   0242 019A

        JSR     R5,     X_PLAY_NOTE             ; 5F7C   0004 0118 02BD

        PULR    R7                              ; 5F7F   02B7

L_5F80:
        PSHR    R5                              ; 5F80   0275
        SUBI    #$000C, R0                      ; 5F81   0338 000C
        BMI     L_5F8C                          ; 5F83   020B 0007

        CMPI    #$0018, R0                      ; 5F85   0378 0018
        BMI     L_5F96                          ; 5F87   020B 000D

        SUBI    #$0018, R0                      ; 5F89   0338 0018
        INCR    R7                              ; 5F8B   000F

L_5F8C:
        NEGR    R0                              ; 5F8C   0020
L_5F8D:
        B       L_5FA9                          ; 5F8D   0200 001A

L_5F8F:
        PSHR    R5                              ; 5F8F   0275
        CMPI    #$0018, R0                      ; 5F90   0378 0018
        BMI     L_5FA9                          ; 5F92   020B 0015

        SUBI    #$0018, R0                      ; 5F94   0338 0018

L_5F96:
        JSR     R5,     L_5FA8                  ; 5F96   0004 015C 03A8

        NEGR    R0                              ; 5F99   0020
        PULR    R7                              ; 5F9A   02B7

        DECLE   $0000,  $0021,  $0042,  $0062   ; 5F9B   0000 0021 0042 0062
        DECLE   $0080,  $009C,  $00B5,  $00CB   ; 5F9F   0080 009C 00B5 00CB
        DECLE   $00DE,  $00ED,  $00F7           ; 5FA3   00DE 00ED 00F7

        ADDR    R7,     R6                      ; 5FA6   00FE
        SUBR    R0,     R0                      ; 5FA7   0100
L_5FA8:
        PSHR    R5                              ; 5FA8   0275
L_5FA9:
        PSHR    R1                              ; 5FA9   0271
        MOVR    R0,     R1                      ; 5FAA   0081
        CMPI    #$000C, R1                      ; 5FAB   0379 000C
        BMI     L_5FB2                          ; 5FAD   020B 0003

        SUBI    #$0018, R1                      ; 5FAF   0339 0018
        NEGR    R1                              ; 5FB1   0021
L_5FB2:
        SDBD                                    ; 5FB2   0001
        ADDI    #$5F9B, R1                      ; 5FB3   02F9 009B 005F
        MVI@    R1,     R0                      ; 5FB6   0288
        PULR    R1                              ; 5FB7   02B1
        PULR    R7                              ; 5FB8   02B7

L_5FB9:
        PSHR    R5                              ; 5FB9   0275
        MVI     G_0161, R4                      ; 5FBA   0284 0161
        ADD     G_0160, R4                      ; 5FBC   02C4 0160
        BNEQ    L_5FCF                          ; 5FBE   020C 000F

        MVII    #$018C, R2                      ; 5FC0   02BA 018C
        MVI     G_0121, R0                      ; 5FC2   0280 0121
        MVI     G_0122, R5                      ; 5FC4   0285 0122
        MVI     G_018B, R1                      ; 5FC6   0281 018B
        DECR    R0                              ; 5FC8   0010
        BEQ     L_5FD0                          ; 5FC9   0204 0005

        DECR    R5                              ; 5FCB   0015
        BEQ     L_5FD0                          ; 5FCC   0204 0002

        MVO@    R1,     R2                      ; 5FCE   0251
L_5FCF:
        PULR    R7                              ; 5FCF   02B7

L_5FD0:
        DECR    R4                              ; 5FD0   0014
        MVI@    R2,     R3                      ; 5FD1   0293
        SUB@    R2,     R1                      ; 5FD2   0311
        BEQ     L_5FCF                          ; 5FD3   0224 0005
        BPL     L_5FD9                          ; 5FD5   0203 0002

        NEGR    R1                              ; 5FD7   0021
        NEGR    R4                              ; 5FD8   0024
L_5FD9:
        CMPI    #$0018, R1                      ; 5FD9   0379 0018
        BLT     L_5FDE                          ; 5FDB   0205 0001

        NEGR    R4                              ; 5FDD   0024
L_5FDE:
        SUBR    R4,     R3                      ; 5FDE   0123
        BMI     L_5FE5                          ; 5FDF   020B 0004

        SUBI    #$0030, R3                      ; 5FE1   033B 0030
        BGE     L_5FE7                          ; 5FE3   020D 0002

L_5FE5:
        ADDI    #$0030, R3                      ; 5FE5   02FB 0030
L_5FE7:
        MVO@    R3,     R2                      ; 5FE7   0253
        MVI     G_018E, R4                      ; 5FE8   0284 018E
        SUB     G_018A, R4                      ; 5FEA   0304 018A
        SUBI    #$001F, R1                      ; 5FEC   0339 001F
        ANDR    R1,     R4                      ; 5FEE   018C
        ADDI    #$000E, R1                      ; 5FEF   02F9 000E
        NEGR    R1                              ; 5FF1   0021
        ANDR    R1,     R4                      ; 5FF2   018C
        BPL     L_5FCF                          ; 5FF3   0223 0025

        JSR     R5,     L_559A                  ; 5FF5   0004 0154 019A
        DECLE   $0004,  $0154,  $0133,  $0000   ; 5FF8   0004 0154 0133 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFC   0000 0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5035       <entry>
;;  $5042       $503A   $503E  
;;  $5068       $5058   $5061  
;;  $5098       $506A   $5074  
;;  $50B8       $5101  
;;  $50FD       $50B2   $50B6  
;;  $5103       $50BE  
;;  $510D       $510A  
;;  $510F       $50C2  
;;  $5126       $55AA  
;;  $5132       <entry>
;;  $5143       $513B  
;;  $5147       $5141  
;;  $514E       $514B  
;;  $5155       $5150  
;;  $515A       $5145  
;;  $5166       $5135  
;;  $5167       $5158   $5160  
;;  $5169       $5164  
;;  $5175       $5171  
;;  $51B4       <entry>
;;  $51B5       $50FA  
;;  $51CE       $51D5  
;;  $5236       $5318  
;;  $523F       $5232  
;;  $5260       $5229  
;;  $526E       $528A  
;;  $5284       $527E  
;;  $528C       $5282  
;;  $529E       $52BB  
;;  $52B3       $52AD  
;;  $52BD       $52B1  
;;  $52D0       $52E4  
;;  $52E6       $52DF  
;;  $52FF       $52EF  
;;  $5309       $52FD  
;;  $531A       $523D  
;;  $5326       $5332  
;;  $5330       $5329   $532C  
;;  $5340       $523F  
;;  $5352       $533E  
;;  $5356       $5372  
;;  $548C       $5489  
;;  $54DF       $54CF  
;;  $54E2       $54A9   $54AD  
;;  $54F0       $54B3  
;;  $54F4       $5510  
;;  $550E       $54FB   $54FF  
;;  $5512       $549F   $54A5   $54C7   $54CB   $54D3   $54F6   $5515   $552A  
;;  $5513       $54B7   $54BB   $54BF   $54C3  
;;  $551D       $549C  
;;  $5532       $551A   $552F   $5DE1  
;;  $554F       $5543  
;;  $556A       $553B  
;;  $5582       $5579   $557D  
;;  $558C       $5111  
;;  $5597       $558E  
;;  $559A       $552C   $5DDE   $5FF5  
;;  $559B       $55BE  
;;  $55AD       $5517  
;;  $55C1       $54ED  
;;  $576C       $5F35  
;;  $576F       $57E9  
;;  $578B       $577A   $5781  
;;  $5791       $5789  
;;  $57AB       $579F  
;;  $57AD       $57A5  
;;  $57AF       $579D   $57A9  
;;  $57BC       $57B8  
;;  $57D0       $57CA  
;;  $57D2       $57C8   $57CE  
;;  $57E8       $57C4   $580A  
;;  $57EC       $57D3   $57D7   $57DB   $57DF   $57E4  
;;  $5802       $57FC  
;;  $580C       $57B0   $57BD  
;;  $581A       $5814  
;;  $5820       $5775  
;;  $5830       $5828  
;;  $5876       $5900  
;;  $587F       $587B  
;;  $588D       $5886  
;;  $5892       $5832  
;;  $58AE       $54DF  
;;  $58D4       $58CF  
;;  $58D5       $58D2  
;;  $58DD       $536A   $5EFD  
;;  $58DE       $58DC  
;;  $58F2       $586A  
;;  $5D1C       $524C  
;;  $5D7B       <entry>
;;  $5D86       $5D81  
;;  $5D97       $5D94  
;;  $5D9C       $5D99  
;;  $5DA3       $5D9E  
;;  $5DA8       $5DA4  
;;  $5DAF       $5DA9  
;;  $5DB1       $5DAD  
;;  $5DCE       $5DC5  
;;  $5DD3       $5DC9   $5DCC   $5DD0  
;;  $5DE4       $5DD6  
;;  $5DE5       $5DDC  
;;  $5DF4       $5DF1  
;;  $5E10       $5E0D  
;;  $5E21       $5E1C  
;;  $5E48       $5E42  
;;  $5E51       $5E4D  
;;  $5E61       $5E5B  
;;  $5E64       $5DFA  
;;  $5EA8       $5EA2  
;;  $5EAE       $5EA6   $5EAA  
;;  $5EB2       $5EAF  
;;  $5EC0       $5E94  
;;  $5EE0       $5EE0  
;;  $5EE6       <entry>
;;  $5F00       $5EF5  
;;  $5F01       <entry>
;;  $5F2D       $5F31  
;;  $5F38       $5F33  
;;  $5F3E       $5F54  
;;  $5F6E       $5F72  
;;  $5F78       $5F68  
;;  $5F80       $5DB6   $5E6C  
;;  $5F8C       $5F83  
;;  $5F8D       $5F8B  
;;  $5F8F       $5E7D  
;;  $5F96       $5F87  
;;  $5FA8       $5F96  
;;  $5FA9       $5F8D   $5F92  
;;  $5FB2       $5FAD  
;;  $5FB9       <entry>
;;  $5FCF       $5FBE   $5FD3   $5FF3  
;;  $5FD0       $5FC9   $5FCC  
;;  $5FD9       $5FD5  
;;  $5FDE       $5FDB  
;;  $5FE5       $5FDF  
;;  $5FE7       $5FE3  
;; ======================================================================== ;;
