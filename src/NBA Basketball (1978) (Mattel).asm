
        ORG     $5000
.HEADER:
        BIDECLE $5D25           ; 5000  Ptr: MOB graphic images
        BIDECLE $5027           ; 5002  Ptr: EXEC timer table
        BIDECLE $5043           ; 5004  Ptr: Start of game
        BIDECLE $50A3           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $50E3           ; 5008  Ptr: GRAM init sequence
        BIDECLE $501B           ; 500A  Ptr: Date/Title
        DECLE   $0000           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0006   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0006   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $0198,  $01A0,  $01B0,  $01C0   ; 5014   0198 01A0 01B0 01C0
        DECLE   $01D0,  $01E0,  $01F0           ; 5018   01D0 01E0 01F0
.TITLE:
        DECLE   $004E                           ; 501B  Cartridge year
        STRING  "BASKETBALL"                    ; 501C  Title string
        DECLE   $0000                           ; 5026  

.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 5027  Timer dispatch/interval
        DECLE   $0063,  $0050,  $0001,  $0000; 502B  Timer dispatch/interval
        DECLE   $00FF,  $0051,  $0009,  $0000; 502F  Timer dispatch/interval
        DECLE   $0033,  $0052,  $0009,  $0000; 5033  Timer dispatch/interval
        DECLE   $0089,  $0052,  $0003,  $0000; 5037  Timer dispatch/interval
        DECLE   $0074,  $0050,  $0001,  $0080; 503B  Timer dispatch/interval
        BIDECLE $0000           ; 503F  End of timer table

        DECLE   $0000,  $0000                   ; 5041   0000 0000
.START:
        PSHR    R5                              ; 5043   0275
        MVII    #$015D, R4                      ; 5044   02BC 015D
        MVII    #$0013, R0                      ; 5046   02B8 0013

        JSR     R5,     X_FILL_ZERO             ; 5048   0004 0114 0338

        MVII    #$0007, R0                      ; 504B   02B8 0007
        MVO     R0,     G_0104                  ; 504D   0240 0104
        MVII    #$0031, R0                      ; 504F   02B8 0031
        MVO     R0,     G_0119                  ; 5051   0240 0119
        MVII    #$0050, R0                      ; 5053   02B8 0050
        MVO     R0,     G_0118                  ; 5055   0240 0118
        MVO     R0,     G_016F                  ; 5057   0240 016F

        JSR     R5,     L_518A                  ; 5059   0004 0150 018A
        JSR     R5,     L_5275                  ; 505C   0004 0150 0275
        JSR     R5,     L_58E0                  ; 505F   0004 0158 00E0

        PULR    R7                              ; 5062   02B7

L_5063:
        PSHR    R5                              ; 5063   0275

        JSR     R5,     L_55F8                  ; 5064   0004 0154 01F8
        JSR     R5,     L_5748                  ; 5067   0004 0154 0348
        JSR     R5,     L_542D                  ; 506A   0004 0154 002D
        JSR     R5,     L_543B                  ; 506D   0004 0154 003B
        JSR     R5,     L_5660                  ; 5070   0004 0154 0260

        PULR    R7                              ; 5073   02B7

L_5074:
        MVI     G_0324, R0                      ; 5074   0280 0324
        INCR    R0                              ; 5076   0008
        INCR    R7                              ; 5077   000F

L_5078:
        CLRR    R0                              ; 5078   01C0
L_5079:
        MVO     R0,     G_0324                  ; 5079   0240 0324
        MOVR    R7,     R1                      ; 507B   00B9
        SUBI    #$0041, R1                      ; 507C   0339 0041
        J       .EXEC.81E                       ; 507E   0004 0318 001E

L_5081:
        MOVR    R7,     R1                      ; 5081   00B9
        SUBI    #$0047, R1                      ; 5082   0339 0047
        J       X_TIMER_STOP                    ; 5084   0004 0318 0038

L_5087:
        PSHR    R5                              ; 5087   0275
        MOVR    R7,     R1                      ; 5088   00B9
        SUBI    #$005A, R1                      ; 5089   0339 005A

        JSR     R5,     X_TIMER_STOP            ; 508B   0004 0118 0038

        PULR    R5                              ; 508E   02B5
L_508F:
        MOVR    R7,     R1                      ; 508F   00B9
        SUBI    #$005D, R1                      ; 5090   0339 005D
        J       X_TIMER_STOP                    ; 5092   0004 0318 0038

L_5095:
        PSHR    R5                              ; 5095   0275
        MOVR    R7,     R1                      ; 5096   00B9
        SUBI    #$0068, R1                      ; 5097   0339 0068

        JSR     R5,     X_TIMER_START           ; 5099   0004 0118 0044

        MOVR    R7,     R1                      ; 509C   00B9
        SUBI    #$006A, R1                      ; 509D   0339 006A

        JSR     R5,     .EXEC.81E               ; 509F   0004 0118 001E

        PULR    R7                              ; 50A2   02B7

.GFX_LIST_50A3:
        DECLE   $00FF,  $0010,  $000F,  $0035   ; 50A3  CART PIC #00
        DECLE   $003A,  $00FD,  $00FE,  $00FD   ; 50A7  
        DECLE   $0000,  $00E0,  $0000,  $00A0   ; 50AB  CART PIC #01
        DECLE   $0040,  $0080,  $0000,  $0080   ; 50AF  
        DECLE   $00C1,  $00C2,  $00C4,  $00CF   ; 50B3  CART PIC #02
        DECLE   $00D0,  $00E0,  $00C0,  $0080   ; 50B7  
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 50BB  CART PIC #03
        DECLE   $0004,  $0008,  $0008,  $0010   ; 50BF  
        DECLE   $0001,  $0001,  $0001,  $0007   ; 50C3  CART PIC #04
        DECLE   $0038,  $00C0,  $0000,  $0000   ; 50C7  
        DECLE   $0001,  $0002,  $0004,  $000F   ; 50CB  CART PIC #05
        DECLE   $0010,  $0020,  $0040,  $0080   ; 50CF  
        DECLE   $0020,  $0020,  $0040,  $00FF   ; 50D3  CART PIC #06
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50D7  
        DECLE   $0000,  $0080,  $0070,  $000F   ; 50DB  CART PIC #07
        DECLE   $0001,  $0001,  $0001,  $0001   ; 50DF  
.GRAM_INIT_50E3:
        DECLE   $002C           ; 50E3  # of GRAM cards to init
        DECLE   $03FF,  $03FC   ; 50E4  #00   :  4x4 tile
        DECLE   $02B9,  $01D6   ; 50E6  #01   :  Algo #1
        DECLE   $0203,  $0040   ; 50E8  #02-02:  GRAM #01-01 X---
        DECLE   $02A1,  $031F   ; 50EA  #03   :  Algo #2
        DECLE   $0207,  $0040   ; 50EC  #04-04:  GRAM #03-03 X---
        DECLE   $00EF,  $0030   ; 50EE  #05-05:  GROM #77-77 --I-
        DECLE   $020B,  $0040   ; 50F0  #06-06:  GRAM #05-05 X---
        DECLE   $0085,  $0058   ; 50F2  #07-07:  GROM #02-02 --IR
        DECLE   $020F,  $0040   ; 50F4  #08-08:  GRAM #07-07 X---
        DECLE   $0000           ; 50F6  #09   :  CART #00    ----
        DECLE   $0213,  $0040   ; 50F7  #0A-0A:  GRAM #09-09 X---
        DECLE   $0002           ; 50F9  #0B   :  CART #01    ----
        DECLE   $0217,  $0040   ; 50FA  #0C-0C:  GRAM #0B-0B X---
        DECLE   $0079,  $0050   ; 50FC  #0D-0D:  GROM #3C-3C ----
        DECLE   $007B,  $0050   ; 50FE  #0E-0E:  GROM #3D-3D ----
        DECLE   $0361,  $0181   ; 5100  #0F   :  Algo #2
        DECLE   $021F,  $0040   ; 5102  #10-10:  GRAM #0F-0F X---
        DECLE   $0019,  $00F0   ; 5104  #11-12:  GROM #0C-0D ----
        DECLE   $0004           ; 5106  #13   :  CART #02    ----
        DECLE   $0227,  $0040   ; 5107  #14-14:  GRAM #13-13 X---
        DECLE   $0006           ; 5109  #15   :  CART #03    ----
        DECLE   $022B,  $0040   ; 510A  #16-16:  GRAM #15-15 X---
        DECLE   $0119,  $01ED   ; 510C  #17   :  Algo #2
        DECLE   $022F,  $0040   ; 510E  #18-18:  GRAM #17-17 X---
        DECLE   $0051,  $03DE   ; 5110  #19   :  Algo #1
        DECLE   $0233,  $0040   ; 5112  #1A-1A:  GRAM #19-19 X---
        DECLE   $0008           ; 5114  #1B   :  CART #04    ----
        DECLE   $0237,  $0040   ; 5115  #1C-1C:  GRAM #1B-1B X---
        DECLE   $000A           ; 5117  #1D   :  CART #05    ----
        DECLE   $023B,  $0040   ; 5118  #1E-1E:  GRAM #1D-1D X---
        DECLE   $000C           ; 511A  #1F   :  CART #06    ----
        DECLE   $023F,  $0040   ; 511B  #20-20:  GRAM #1F-1F X---
        DECLE   $0071,  $03FF   ; 511D  #21   :  Algo #2
        DECLE   $0243,  $0040   ; 511F  #22-22:  GRAM #21-21 X---
        DECLE   $0021,  $02D6   ; 5121  #23   :  Algo #1
        DECLE   $0247,  $0040   ; 5123  #24-24:  GRAM #23-23 X---
        DECLE   $000E           ; 5125  #25   :  CART #07    ----
        DECLE   $024B,  $0040   ; 5126  #26-26:  GRAM #25-25 X---
        DECLE   $0001,  $0003   ; 5128  #27   :  Algo #2
        DECLE   $004F,  $0048   ; 512A  #28-28:  GRAM #27-27 ---R
        DECLE   $0003,  $0070   ; 512C  #29-29:  GROM #01-01 ----
        DECLE   $0001,  $0070   ; 512E  #2A-2A:  GROM #00-00 ----
        DECLE   $0011,  $0070   ; 5130  #2B-2B:  GROM #08-08 ----

        DECLE   $0000,  $0140,  $0000,  $0140   ; 5132   0000 0140 0000 0140
        DECLE   $0000,  $0060,  $000D,  $0027   ; 5136   0000 0060 000D 0027
        DECLE   $0000,  $00C0,  $0068,  $00AE   ; 513A   0000 00C0 0068 00AE
        DECLE   $0000                           ; 513E   0000

        MOVR    R4,     R0                      ; 513F   00A0
        B       L_5168                          ; 5140   0200 0026

        MVI     G_003F, R0                      ; 5142   0280 003F
        MVI     G_003F, R1                      ; 5144   0281 003F
        B       L_518E                          ; 5146   0200 0046

        DECLE   $0180,  $00A0,  $0200,  $0026   ; 5148   0180 00A0 0200 0026
        DECLE   $0280,  $0027,  $0084,  $003F   ; 514C   0280 0027 0084 003F

        MVI     G_0038, R5                      ; 5150   0285 0038
        MVI     G_003B, R2                      ; 5152   0282 003B
        MVI     G_00A3, R0                      ; 5154   0280 00A3
        B       L_517E                          ; 5156   0200 0026

        DECLE   $0283,  $003F,  $0286,  $0038   ; 5158   0283 003F 0286 0038
        DECLE   $0393,  $003A,  $0388,  $00AA   ; 515C   0393 003A 0388 00AA
        DECLE   $0387,  $003A,  $0200,  $0046   ; 5160   0387 003A 0200 0046

        MVI@    R1,     R1                      ; 5164   0289
        RSWD    R0                              ; 5165   0038
        AND@    R1,     R1                      ; 5166   0389
        SWAP    R2,     1                       ; 5167   0042
L_5168:
        AND@    R1,     R2                      ; 5168   038A
        RSWD    R2                              ; 5169   003A
        AND@    R1,     R3                      ; 516A   038B
        RSWD    R2                              ; 516B   003A
        B       L_5194                          ; 516C   0200 0026

        DECLE   $038C,  $003A,  $038D,  $003A   ; 516E   038C 003A 038D 003A
        DECLE   $0200,  $0026,  $038E,  $003A   ; 5172   0200 0026 038E 003A
        DECLE   $0389,  $0062,  $038F,  $003A   ; 5176   0389 0062 038F 003A
        DECLE   $0390,  $003A,  $0200,  $0026   ; 517A   0390 003A 0200 0026
L_517E:
        AND@    R2,     R1                      ; 517E   0391
        RSWD    R2                              ; 517F   003A
        AND@    R2,     R2                      ; 5180   0392
        RSWD    R2                              ; 5181   003A
        AND@    R2,     R3                      ; 5182   0393
        RSWD    R2                              ; 5183   003A
        B       L_528C                          ; 5184   0200 0106

        AND@    R2,     R4                      ; 5186   0394
        RSWD    R2                              ; 5187   003A
        ANDR    R2,     R5                      ; 5188   0195
        CMPR    R1,     R2                      ; 5189   014A
L_518A:
        PSHR    R5                              ; 518A   0275
        MVII    #$0214, R4                      ; 518B   02BC 0214
        MOVR    R7,     R5                      ; 518D   00BD
L_518E:
        SUBI    #$005C, R5                      ; 518E   033D 005C
        CLRR    R3                              ; 5190   01DB
L_5191:
        MVII    #$000A, R2                      ; 5191   02BA 000A
L_5193:
        PSHR    R4                              ; 5193   0274

L_5194:
        JSR     R4,     L_51F2                  ; 5194   0004 0050 01F2

        PULR    R4                              ; 5197   02B4
        PSHR    R5                              ; 5198   0275

        JSR     R5,     L_51E0                  ; 5199   0004 0150 01E0

        PULR    R5                              ; 519C   02B5
        TSTR    R2                              ; 519D   0092
        BNEQ    L_5193                          ; 519E   022C 000C

        PSHR    R5                              ; 51A0   0275
        ADDI    #$0002, R5                      ; 51A1   02FD 0002
        MVII    #$000A, R2                      ; 51A3   02BA 000A
L_51A5:
        SUBI    #$0004, R5                      ; 51A5   033D 0004
        PSHR    R4                              ; 51A7   0274

        JSR     R4,     L_51F2                  ; 51A8   0004 0050 01F2

        PULR    R4                              ; 51AB   02B4
        BNC     L_51B0                          ; 51AC   0209 0002

        ADDI    #$0008, R0                      ; 51AE   02F8 0008
L_51B0:
        PSHR    R5                              ; 51B0   0275

        JSR     R5,     L_51E0                  ; 51B1   0004 0150 01E0

        PULR    R5                              ; 51B4   02B5
        TSTR    R2                              ; 51B5   0092
        BNEQ    L_51A5                          ; 51B6   022C 0012

        PULR    R5                              ; 51B8   02B5
        SDBD                                    ; 51B9   0001
        CMPI    #$518A, R5                      ; 51BA   037D 008A 0051
        BLT     L_5191                          ; 51BD   0225 002D

        MVII    #$0200, R4                      ; 51BF   02BC 0200
        MVII    #$0002, R3                      ; 51C1   02BB 0002
        MVII    #$0014, R0                      ; 51C3   02B8 0014

        JSR     R5,     X_PRPAD_R5              ; 51C5   0004 0118 0071
        STRING  "   HOME"                       ; 51C8  
        DECLE   $0000                           ; 51CF   0000

        MVII    #$0005, R3                      ; 51D0   02BB 0005
        ADDI    #$0004, R4                      ; 51D2   02FC 0004

        JSR     R5,     X_PRINT_R5              ; 51D4   0004 0118 007B
        STRING  "VISITOR"                       ; 51D7  
        DECLE   $0000                           ; 51DE   0000

        PULR    R7                              ; 51DF   02B7

L_51E0:
        PSHR    R5                              ; 51E0   0275
        XORR    R3,     R0                      ; 51E1   01D8
        XORR    R0,     R3                      ; 51E2   01C3
        SDBD                                    ; 51E3   0001
        MVII    #$2000, R5                      ; 51E4   02BD 0000 0020
        ANDR    R5,     R3                      ; 51E7   01AB
        MVO@    R0,     R4                      ; 51E8   0260
        COMR    R5                              ; 51E9   001D
        ANDR    R5,     R0                      ; 51EA   01A8
        INCR    R7                              ; 51EB   000F

L_51EC:
        MVO@    R0,     R4                      ; 51EC   0260
L_51ED:
        DECR    R2                              ; 51ED   0012
        DECR    R1                              ; 51EE   0011
        BNEQ    L_51EC                          ; 51EF   022C 0004
        PULR    R7                              ; 51F1   02B7

L_51F2:
        MVI@    R5,     R0                      ; 51F2   02A8
        SLL     R0,     2                       ; 51F3   004C
        SLL     R0,     2                       ; 51F4   004C
        PSHR    R0                              ; 51F5   0270
        MVI@    R5,     R1                      ; 51F6   02A9
        MOVR    R1,     R0                      ; 51F7   0088
        ANDI    #$000F, R0                      ; 51F8   03B8 000F
        XOR@    R6,     R0                      ; 51FA   03F0
        SLR     R1,     2                       ; 51FB   0065
        SLR     R1,     2                       ; 51FC   0065
        SARC    R1,     1                       ; 51FD   0079
        MOVR    R4,     R7                      ; 51FE   00A7

L_51FF:
        MVII    #$015F, R4                      ; 51FF   02BC 015F
        MVI@    R4,     R1                      ; 5201   02A1
        DECR    R4                              ; 5202   0014
        SDBD                                    ; 5203   0001
        MVI@    R4,     R0                      ; 5204   02A0
        TSTR    R1                              ; 5205   0089
        BNEQ    L_520A                          ; 5206   020C 0002

        SUBI    #$00C4, R0                      ; 5208   0338 00C4
L_520A:
        DECR    R0                              ; 520A   0010
        BEQ     L_524E                          ; 520B   0204 0041

        PSHR    R5                              ; 520D   0275

        JSR     R5,     L_5242                  ; 520E   0004 0150 0242

        INCR    R7                              ; 5211   000F

L_5212:
        PSHR    R5                              ; 5212   0275
L_5213:
        MVII    #$0007, R3                      ; 5213   02BB 0007
        MVII    #$023D, R4                      ; 5215   02BC 023D
        MVII    #$0002, R1                      ; 5217   02B9 0002
        MVI     G_0160, R0                      ; 5219   0280 0160

        JSR     R5,     X_PRNUM_RGT             ; 521B   0004 0118 00C5

        MVII    #$0240, R4                      ; 521E   02BC 0240
        MVI     G_015F, R0                      ; 5220   0280 015F
        INCR    R7                              ; 5222   000F

L_5223:
        PSHR    R5                              ; 5223   0275
L_5224:
        MVII    #$0002, R1                      ; 5224   02B9 0002
        CMPI    #$000A, R0                      ; 5226   0378 000A
        BPL     L_522F                          ; 5228   0203 0005

        JSR     R5,     X_PRNUM_RGT             ; 522A   0004 0118 00C5

        DECR    R1                              ; 522D   0011
        CLRR    R0                              ; 522E   01C0

L_522F:
        JSR     R5,     X_PRNUM_RGT             ; 522F   0004 0118 00C5

        PULR    R7                              ; 5232   02B7

L_5233:
        MVI     G_0161, R0                      ; 5233   0280 0161
        DECR    R0                              ; 5235   0010
        MVO     R0,     G_0161                  ; 5236   0240 0161
        BEQ     L_525E                          ; 5238   0204 0024

L_523A:
        MVII    #$0007, R3                      ; 523A   02BB 0007
        MVII    #$024D, R4                      ; 523C   02BC 024D
        MVI     G_0161, R0                      ; 523E   0280 0161
        B       L_5223                          ; 5240   0220 001E

L_5242:
        PSHR    R0                              ; 5242   0270
        ANDI    #$00FF, R0                      ; 5243   03B8 00FF
        MVO     R0,     G_015F                  ; 5245   0240 015F
        PULR    R0                              ; 5247   02B0
        SWAP    R0,     1                       ; 5248   0040
        ANDI    #$00FF, R0                      ; 5249   03B8 00FF
        MVO     R0,     G_0160                  ; 524B   0240 0160
        MOVR    R5,     R7                      ; 524D   00AF

L_524E:
        PSHR    R5                              ; 524E   0275

        JSR     R5,     L_5242                  ; 524F   0004 0150 0242
        JSR     R5,     L_5212                  ; 5252   0004 0150 0212

        MVII    #$0014, R0                      ; 5255   02B8 0014

        JSR     R5,     X_PLAY_RAZZ4            ; 5257   0004 011C 02C4
        JSR     R5,     L_595B                  ; 525A   0004 0158 015B

        PULR    R7                              ; 525D   02B7

L_525E:
        PSHR    R5                              ; 525E   0275

        JSR     R5,     L_523A                  ; 525F   0004 0150 023A

        MVII    #$000C, R0                      ; 5262   02B8 000C

        JSR     R5,     X_PLAY_RAZZ4            ; 5264   0004 011C 02C4
        JSR     R5,     L_5AE5                  ; 5267   0004 0158 02E5

        PULR    R7                              ; 526A   02B7

L_526B:
        MVI     G_0163, R1                      ; 526B   0281 0163
        ANDI    #$0001, R1                      ; 526D   03B9 0001
        ADDI    #$015D, R1                      ; 526F   02F9 015D
        MVI@    R1,     R0                      ; 5271   0288
        ADDI    #$0002, R0                      ; 5272   02F8 0002
        MVO@    R0,     R1                      ; 5274   0248
L_5275:
        PSHR    R5                              ; 5275   0275
        MVII    #$0003, R1                      ; 5276   02B9 0003
        MVII    #$0006, R3                      ; 5278   02BB 0006
        MVII    #$0217, R4                      ; 527A   02BC 0217
        MVI     G_015D, R0                      ; 527C   0280 015D

        JSR     R5,     X_PRNUM_RGT             ; 527E   0004 0118 00C5

        MVII    #$0222, R4                      ; 5281   02BC 0222
        MVI     G_015E, R0                      ; 5283   0280 015E

        JSR     R5,     X_PRNUM_LFT             ; 5285   0004 0118 009E

        PULR    R7                              ; 5288   02B7

L_5289:
        PSHR    R5                              ; 5289   0275
        MVI     G_0163, R0                      ; 528A   0280 0163
L_528C:
        ANDI    #$0010, R0                      ; 528C   03B8 0010
        BEQ     L_52B1                          ; 528E   0204 0021

        JSR     R5,     L_52A2                  ; 5290   0004 0150 02A2
        JSR     R5,     L_5569                  ; 5293   0004 0154 0169

L_5296:
        ADDI    #$0010, R1                      ; 5296   02F9 0010
        PSHR    R1                              ; 5298   0271

        JSR     R5,     L_52C4                  ; 5299   0004 0150 02C4

        PULR    R1                              ; 529C   02B1
        CMPI    #$0345, R1                      ; 529D   0379 0345
        BMI     L_5296                          ; 529F   022B 000A
        PULR    R7                              ; 52A1   02B7

L_52A2:
        PSHR    R5                              ; 52A2   0275

        JSR     R5,     L_555E                  ; 52A3   0004 0154 015E

L_52A6:
        ADDI    #$0010, R1                      ; 52A6   02F9 0010
        PSHR    R1                              ; 52A8   0271

        JSR     R5,     L_5347                  ; 52A9   0004 0150 0347

        PULR    R1                              ; 52AC   02B1
        CMPI    #$0345, R1                      ; 52AD   0379 0345
        BMI     L_52A6                          ; 52AF   022B 000A
L_52B1:
        PULR    R7                              ; 52B1   02B7

        NEGR    R0                              ; 52B2   0020
        RSWD    R0                              ; 52B3   0038
        GSWD    R2                              ; 52B4   0032
        RSWD    R0                              ; 52B5   0038
        SWAP    R0,     1                       ; 52B6   0040
        RSWD    R0                              ; 52B7   0038
        COMR    R0                              ; 52B8   0018
        SWAP    R0,     1                       ; 52B9   0040
        ADCR    R6                              ; 52BA   002E
        SWAP    R0,     1                       ; 52BB   0040
        RSWD    R6                              ; 52BC   003E
        SWAP    R0,     1                       ; 52BD   0040
        DECR    R0                              ; 52BE   0010
        SLL     R0,     2                       ; 52BF   004C
        NEGR    R4                              ; 52C0   0024
        SLL     R0,     2                       ; 52C1   004C
        RSWD    R4                              ; 52C2   003C
        SLL     R0,     2                       ; 52C3   004C
L_52C4:
        PSHR    R5                              ; 52C4   0275

        JSR     R5,     L_5A46                  ; 52C5   0004 0158 0246
        JSR     R5,     .EXEC.777               ; 52C8   0004 0114 0377
        JSR     R5,     .EXEC.766               ; 52CB   0004 0114 0366

        PSHR    R1                              ; 52CE   0271
        MVII    #$016D, R4                      ; 52CF   02BC 016D
        MVI@    R4,     R1                      ; 52D1   02A1
        CMPI    #$0005, R0                      ; 52D2   0378 0005
        BPL     L_52D9                          ; 52D4   0203 0003

        MVI@    R4,     R1                      ; 52D6   02A1
        SUBI    #$0002, R4                      ; 52D7   033C 0002
L_52D9:
        MVI@    R4,     R0                      ; 52D9   02A0
        B       L_52E6                          ; 52DA   0200 000A

L_52DC:
        PULR    R1                              ; 52DC   02B1
L_52DD:
        MVII    #$0009, R0                      ; 52DD   02B8 0009

        JSR     R5,     X_RAND2                 ; 52DF   0004 0114 029E

        CMPR    R0,     R1                      ; 52E2   0141
        BEQ     L_52DD                          ; 52E3   0224 0007

        MVO@    R0,     R4                      ; 52E5   0260
L_52E6:
        DECR    R4                              ; 52E6   0014
        PSHR    R1                              ; 52E7   0271

        JSR     R5,     L_5322                  ; 52E8   0004 0150 0322

        SUBR    R2,     R0                      ; 52EB   0110
        SUBR    R3,     R1                      ; 52EC   0119
        MOVR    R0,     R2                      ; 52ED   0082
        BPL     L_52F1                          ; 52EE   0203 0001

        NEGR    R2                              ; 52F0   0022
L_52F1:
        MOVR    R1,     R3                      ; 52F1   008B
        BPL     L_52F5                          ; 52F2   0203 0001

        NEGR    R3                              ; 52F4   0023
L_52F5:
        CMPI    #$0004, R2                      ; 52F5   037A 0004
        BPL     L_52FD                          ; 52F7   0203 0004

        CMPI    #$0004, R3                      ; 52F9   037B 0004
        BMI     L_5305                          ; 52FB   020B 0008

L_52FD:
        JSR     R5,     .EXEC.A2F               ; 52FD   0004 0118 022F
        JSR     R5,     L_5596                  ; 5300   0004 0154 0196

        B       L_531A                          ; 5303   0200 0015

L_5305:
        MVI     G_0163, R0                      ; 5305   0280 0163
        ANDI    #$0004, R0                      ; 5307   03B8 0004
        BEQ     L_5311                          ; 5309   0204 0006

        MVI     G_016F, R0                      ; 530B   0280 016F
        CMP@    R4,     R0                      ; 530D   0360
        BEQ     L_5319                          ; 530E   0204 0009

        DECR    R4                              ; 5310   0014
L_5311:
        MVII    #$0003, R0                      ; 5311   02B8 0003

        JSR     R5,     X_RAND1                 ; 5313   0004 0114 027D

        TSTR    R0                              ; 5316   0080
        BEQ     L_52DC                          ; 5317   0224 003C

L_5319:
        CLRR    R0                              ; 5319   01C0
L_531A:
        PULR    R5                              ; 531A   02B5
        PULR    R1                              ; 531B   02B1
        MVII    #$0002, R4                      ; 531C   02BC 0002

        JSR     R5,     L_5776                  ; 531E   0004 0154 0376

        PULR    R7                              ; 5321   02B7

L_5322:
        PSHR    R5                              ; 5322   0275
        PSHR    R2                              ; 5323   0272

        JSR     R5,     L_5B6C                  ; 5324   0004 0158 036C

        TSTR    R2                              ; 5327   0092
        BEQ     L_5337                          ; 5328   0204 000D

        MOVR    R0,     R1                      ; 532A   0081
        MVII    #$0003, R2                      ; 532B   02BA 0003
        PSHR    R0                              ; 532D   0270

        JSR     R5,     X_DIV                   ; 532E   0004 011C 01FB

        PULR    R0                              ; 5331   02B0
        DECR    R1                              ; 5332   0011
        SLL     R1,     1                       ; 5333   0049
        SUBR    R1,     R0                      ; 5334   0108
        MVII    #$0001, R2                      ; 5335   02BA 0001
L_5337:
        MOVR    R7,     R1                      ; 5337   00B9
        SUBI    #$0086, R1                      ; 5338   0339 0086
        SLL     R0,     1                       ; 533A   0048
        ADDR    R0,     R1                      ; 533B   00C1
        MVI@    R1,     R0                      ; 533C   0288
        INCR    R1                              ; 533D   0009
        MVI@    R1,     R1                      ; 533E   0289
        TSTR    R2                              ; 533F   0092
        BEQ     L_5345                          ; 5340   0204 0003

        NEGR    R0                              ; 5342   0020
        ADDI    #$00A8, R0                      ; 5343   02F8 00A8
L_5345:
        PULR    R2                              ; 5345   02B2
        PULR    R7                              ; 5346   02B7

L_5347:
        PSHR    R5                              ; 5347   0275
        MVI@    R1,     R0                      ; 5348   0288
        ANDI    #$0008, R0                      ; 5349   03B8 0008
        BNEQ    L_52B1                          ; 534B   022C 009B

        JSR     R5,     L_5A46                  ; 534D   0004 0158 0246
        JSR     R5,     .EXEC.777               ; 5350   0004 0114 0377
        JSR     R5,     .EXEC.766               ; 5353   0004 0114 0366
        JSR     R5,     L_53EA                  ; 5356   0004 0150 03EA

        PSHR    R1                              ; 5359   0271
        MVI     G_0163, R5                      ; 535A   0285 0163
        ANDI    #$000C, R5                      ; 535C   03BD 000C
        XORI    #$0004, R5                      ; 535E   03FD 0004
        BEQ     L_53BD                          ; 5360   0204 005B

        JSR     R5,     L_53F5                  ; 5362   0004 0150 03F5

        BNC     L_53D8                          ; 5365   0209 0071

        MVI     G_0167, R0                      ; 5367   0280 0167
        MVI     G_0168, R1                      ; 5369   0281 0168

        JSR     R5,     .EXEC.78C               ; 536B   0004 0114 038C

        CMPI    #$02EE, R2                      ; 536E   037A 02EE
        BPL     L_53BA                          ; 5370   0203 0048

        JSR     R5,     .EXEC.A2F               ; 5372   0004 0118 022F

        MVI     G_0169, R0                      ; 5375   0280 0169
        ADDI    #$0010, R1                      ; 5377   02F9 0010
        SUBR    R0,     R1                      ; 5379   0101
        ANDI    #$000F, R1                      ; 537A   03B9 000F
        BEQ     L_5397                          ; 537C   0204 0019

        CMPI    #$000E, R1                      ; 537E   0379 000E
        BMI     L_5384                          ; 5380   020B 0002

        ADDI    #$0004, R0                      ; 5382   02F8 0004
L_5384:
        CMPI    #$0003, R1                      ; 5384   0379 0003
        BPL     L_538A                          ; 5386   0203 0002

        ADDI    #$000C, R0                      ; 5388   02F8 000C
L_538A:
        ANDI    #$000F, R0                      ; 538A   03B8 000F
        MOVR    R0,     R1                      ; 538C   0081

L_538D:
        JSR     R5,     L_5596                  ; 538D   0004 0154 0196

L_5390:
        PULR    R1                              ; 5390   02B1
L_5391:
        MVII    #$0001, R4                      ; 5391   02BC 0001

        JSR     R5,     L_5776                  ; 5393   0004 0154 0376

        PULR    R7                              ; 5396   02B7

L_5397:
        CMPI    #$0064, R2                      ; 5397   037A 0064
        BMI     L_539F                          ; 5399   020B 0004

        ADDI    #$0008, R0                      ; 539B   02F8 0008
        B       L_538A                          ; 539D   0220 0014

L_539F:
        MVI     G_0163, R0                      ; 539F   0280 0163
        ANDI    #$0008, R0                      ; 53A1   03B8 0008
        BEQ     L_53BA                          ; 53A3   0204 0015

        PULR    R1                              ; 53A5   02B1

        JSR     R5,     .EXEC.766               ; 53A6   0004 0114 0366
        JSR     R5,     X_POW2                  ; 53A9   0004 0114 0345

        MVI     G_016C, R5                      ; 53AC   0285 016C
        MOVR    R5,     R4                      ; 53AE   00AC
        ANDR    R0,     R5                      ; 53AF   0185
        BNEQ    L_53B9                          ; 53B0   020C 0007

        XORR    R0,     R4                      ; 53B2   01C4
        MVO     R4,     G_016C                  ; 53B3   0244 016C

        JSR     R5,     L_5578                  ; 53B5   0004 0154 0178

        PULR    R7                              ; 53B8   02B7

L_53B9:
        PSHR    R1                              ; 53B9   0271
L_53BA:
        CLRR    R0                              ; 53BA   01C0
        B       L_5390                          ; 53BB   0220 002C

L_53BD:
        MVI     G_031F, R0                      ; 53BD   0280 031F
        MVI     G_0320, R1                      ; 53BF   0281 0320
        SWAP    R0,     1                       ; 53C1   0040
        ANDI    #$00FF, R0                      ; 53C2   03B8 00FF
        SWAP    R1,     1                       ; 53C4   0041
        SUBI    #$0002, R1                      ; 53C5   0339 0002
        ANDI    #$00FF, R1                      ; 53C7   03B9 00FF
        SUBR    R2,     R0                      ; 53C9   0110
        SUBR    R3,     R1                      ; 53CA   0119

        JSR     R5,     .EXEC.A2F               ; 53CB   0004 0118 022F

        B       L_538D                          ; 53CE   0220 0042

        RSWD    R1                              ; 53D0   0039
        ADCR    R0                              ; 53D1   0028
        SLL     R0,     1                       ; 53D2   0048
        ADCR    R0                              ; 53D3   0028
        RSWD    R1                              ; 53D4   0039
        MOVR    R1,     R0                      ; 53D5   0088
        SLL     R0,     1                       ; 53D6   0048
        MOVR    R1,     R0                      ; 53D7   0088
L_53D8:
        ADDR    R4,     R4                      ; 53D8   00E4
        ADDR    R7,     R4                      ; 53D9   00FC
        SUBI    #$000A, R4                      ; 53DA   033C 000A
        SDBD                                    ; 53DC   0001
        MVI@    R4,     R2                      ; 53DD   02A2
        MVII    #$0018, R3                      ; 53DE   02BB 0018
        PULR    R1                              ; 53E0   02B1

        JSR     R5,     .EXEC.9A3               ; 53E1   0004 0118 01A3

        MOVR    R1,     R5                      ; 53E4   008D
        ADDI    #$0004, R5                      ; 53E5   02FD 0004
        MVI@    R5,     R0                      ; 53E7   02A8
        B       L_5391                          ; 53E8   0220 0058

L_53EA:
        MVI     G_0162, R4                      ; 53EA   0284 0162
        XOR     G_0163, R4                      ; 53EC   03C4 0163
        RRC     R0,     2                       ; 53EE   0074
        MOVR    R4,     R0                      ; 53EF   00A0
        RRC     R0,     1                       ; 53F0   0070
        CLRR    R0                              ; 53F1   01C0
        RLC     R0,     2                       ; 53F2   0054
        MOVR    R0,     R4                      ; 53F3   0084
        MOVR    R5,     R7                      ; 53F4   00AF

L_53F5:
        PSHR    R5                              ; 53F5   0275
        PSHR    R4                              ; 53F6   0274

        JSR     R5,     L_540B                  ; 53F7   0004 0154 000B

        CMP@    R4,     R2                      ; 53FA   0362
        BLT     L_5408                          ; 53FB   0205 000B

        CMP@    R4,     R3                      ; 53FD   0363
        BLT     L_5408                          ; 53FE   0205 0008

        CMP@    R4,     R2                      ; 5400   0362
        BGT     L_5408                          ; 5401   020E 0005

        CMP@    R4,     R3                      ; 5403   0363
        BGT     L_5408                          ; 5404   020E 0002

        SETC                                    ; 5406   0007
        INCR    R7                              ; 5407   000F

L_5408:
        CLRC                                    ; 5408   0006
L_5409:
        PULR    R4                              ; 5409   02B4
        PULR    R7                              ; 540A   02B7

L_540B:
        ADDR    R4,     R4                      ; 540B   00E4
        ADDR    R4,     R4                      ; 540C   00E4
        INCR    R4                              ; 540D   000C
        ADDR    R7,     R4                      ; 540E   00FC
        MOVR    R5,     R7                      ; 540F   00AF

        COMR    R2                              ; 5410   001A
        GSWD    R1                              ; 5411   0031
        RLC     R0,     1                       ; 5412   0050
        RSWD    R5                              ; 5413   003D
        INCR    R0                              ; 5414   0008
        SWAP    R2,     1                       ; 5415   0042
        RLC     R0,     1                       ; 5416   0050
        RLC     R0,     1                       ; 5417   0050
        SLLC    R0,     1                       ; 5418   0058
        GSWD    R1                              ; 5419   0031
        MOVR    R1,     R6                      ; 541A   008E
        RSWD    R5                              ; 541B   003D
        SLLC    R0,     1                       ; 541C   0058
        SWAP    R2,     1                       ; 541D   0042
        MOVR    R4,     R0                      ; 541E   00A0
        RLC     R0,     1                       ; 541F   0050
L_5420:
        PSHR    R5                              ; 5420   0275
        MVI     G_0163, R5                      ; 5421   0285 0163
        ANDI    #$002F, R5                      ; 5423   03BD 002F
        XORI    #$00C0, R5                      ; 5425   03FD 00C0
        MVO     R5,     G_0163                  ; 5427   0245 0163

        JSR     R5,     L_55B9                  ; 5429   0004 0154 01B9

        PULR    R7                              ; 542C   02B7

L_542D:
        PSHR    R5                              ; 542D   0275
        MVI     G_0163, R0                      ; 542E   0280 0163
        MOVR    R0,     R2                      ; 5430   0082
        ANDI    #$0080, R0                      ; 5431   03B8 0080
        BNEQ    L_55F7                          ; 5433   020C 01C2

        CLRR    R4                              ; 5435   01E4

        JSR     R5,     L_5569                  ; 5436   0004 0154 0169

        B       L_544A                          ; 5439   0200 000F

L_543B:
        PSHR    R5                              ; 543B   0275
        MVI     G_0163, R0                      ; 543C   0280 0163
        MOVR    R0,     R2                      ; 543E   0082
        ANDI    #$0040, R0                      ; 543F   03B8 0040
        BNEQ    L_55F7                          ; 5441   020C 01B4

        JSR     R5,     L_555E                  ; 5443   0004 0154 015E

        MVII    #$0001, R4                      ; 5446   02BC 0001
        XORI    #$0001, R2                      ; 5448   03FA 0001
L_544A:
        ANDI    #$0001, R2                      ; 544A   03BA 0001
        ADDI    #$011F, R2                      ; 544C   02FA 011F
        PSHR    R1                              ; 544E   0271
        MVI@    R2,     R1                      ; 544F   0291
        MOVR    R1,     R0                      ; 5450   0088
        ANDI    #$00C0, R0                      ; 5451   03B8 00C0
        BNEQ    L_545A                          ; 5453   020C 0005

        MOVR    R4,     R3                      ; 5455   00A3

        JSR     R5,     L_5597                  ; 5456   0004 0154 0197

        INCR    R7                              ; 5459   000F

L_545A:
        CLRR    R0                              ; 545A   01C0
L_545B:
        PULR    R1                              ; 545B   02B1

        JSR     R5,     L_5776                  ; 545C   0004 0154 0376

        PULR    R7                              ; 545F   02B7

        PSHR    R5                              ; 5460   0275
        TSTR    R0                              ; 5461   0080
        BEQ     L_54C6                          ; 5462   0204 0062

        DECR    R0                              ; 5464   0010
        CMPI    #$0009, R0                      ; 5465   0378 0009
        BPL     L_54C6                          ; 5467   0203 005D

        XOR     G_0163, R1                      ; 5469   03C1 0163
        ANDI    #$0001, R1                      ; 546B   03B9 0001
        BNEQ    L_55F7                          ; 546D   020C 0188

        JSR     R5,     L_5563                  ; 546F   0004 0154 0163

        BNEQ    L_55F7                          ; 5472   020C 0183

        JSR     R5,     L_54B0                  ; 5474   0004 0154 00B0

        MVI@    R1,     R5                      ; 5477   028D
        SDBD                                    ; 5478   0001
        ANDI    #$FDFF, R5                      ; 5479   03BD 00FF 00FD
        TSTR    R3                              ; 547C   009B
        BPL     L_5481                          ; 547D   0203 0002

        XORI    #$0200, R5                      ; 547F   03FD 0200
L_5481:
        MVO@    R5,     R1                      ; 5481   024D
        MVO     R0,     G_016F                  ; 5482   0240 016F
        MVI     G_0163, R5                      ; 5484   0285 0163
        ANDI    #$00D1, R5                      ; 5486   03BD 00D1
        XORI    #$0006, R5                      ; 5488   03FD 0006
        MVO     R5,     G_0163                  ; 548A   0245 0163
        ADDI    #$0010, R1                      ; 548C   02F9 0010

        JSR     R5,     L_54B0                  ; 548E   0004 0154 00B0

        PSHR    R2                              ; 5491   0272
        ADDI    #$0010, R1                      ; 5492   02F9 0010

        JSR     R5,     L_54B0                  ; 5494   0004 0154 00B0

        MVII    #$016D, R3                      ; 5497   02BB 016D
        CMP@    R6,     R2                      ; 5499   0372
        BGE     L_549D                          ; 549A   020D 0001

        INCR    R3                              ; 549C   000B
L_549D:
        MVO@    R0,     R3                      ; 549D   0258
        MOVR    R4,     R2                      ; 549E   00A2
        ADDI    #$0305, R2                      ; 549F   02FA 0305
        MVII    #$002D, R3                      ; 54A1   02BB 002D
        CLRR    R0                              ; 54A3   01C0

        JSR     R5,     .EXEC.9B9               ; 54A4   0004 0118 01B9
        JSR     R5,     L_5078                  ; 54A7   0004 0150 0078

        SDBD                                    ; 54AA   0001
        MVII    #$5FE1, R2                      ; 54AB   02BA 00E1 005F
        B       L_5558                          ; 54AE   0200 00A8

L_54B0:
        PSHR    R5                              ; 54B0   0275
        PSHR    R1                              ; 54B1   0271
        PSHR    R0                              ; 54B2   0270
        MOVR    R1,     R4                      ; 54B3   008C
        ADDI    #$0002, R4                      ; 54B4   02FC 0002

        JSR     R5,     L_5322                  ; 54B6   0004 0150 0322

        MOVR    R0,     R2                      ; 54B9   0082
        MOVR    R1,     R3                      ; 54BA   008B

        JSR     R5,     X_PACK_BYTES            ; 54BB   0004 0114 034F

        PSHR    R0                              ; 54BE   0270

        JSR     R5,     .EXEC.7A3               ; 54BF   0004 0114 03A3

        PULR    R4                              ; 54C2   02B4
        PULR    R0                              ; 54C3   02B0
        PULR    R1                              ; 54C4   02B1
        PULR    R7                              ; 54C5   02B7

L_54C6:
        MOVR    R1,     R2                      ; 54C6   008A
        XOR     G_0163, R2                      ; 54C7   03C2 0163
        ANDI    #$0001, R2                      ; 54C9   03BA 0001
        BEQ     L_54CF                          ; 54CB   0204 0002

        MVII    #$0003, R2                      ; 54CD   02BA 0003
L_54CF:
        ANDI    #$0003, R0                      ; 54CF   03B8 0003
        ADDR    R0,     R2                      ; 54D1   00C2
        INCR    R2                              ; 54D2   000A
        ADDR    R7,     R2                      ; 54D3   00FA
        ADD@    R2,     R7                      ; 54D4   02D7

        SUBR    R4,     R2                      ; 54D5   0122
        ADCR    R4                              ; 54D6   002C
        SWAP    R1,     2                       ; 54D7   0045
        CLRC                                    ; 54D8   0006
        SUBR    R4,     R2                      ; 54D9   0122
        SUBR    R4,     R2                      ; 54DA   0122

        JSR     R5,     L_555E                  ; 54DB   0004 0154 015E

        MVI@    R1,     R0                      ; 54DE   0288
        ANDI    #$0008, R0                      ; 54DF   03B8 0008
        BNEQ    L_55F7                          ; 54E1   020C 0114

        JSR     R5,     L_5578                  ; 54E3   0004 0154 0178

        SUBI    #$0003, R1                      ; 54E6   0339 0003
        MOVR    R1,     R4                      ; 54E8   008C
        MVI     G_0167, R2                      ; 54E9   0282 0167
        MVI     G_0168, R3                      ; 54EB   0283 0168

        JSR     R5,     .EXEC.784               ; 54ED   0004 0114 0384
        JSR     R5,     .EXEC.A2F               ; 54F0   0004 0118 022F

        CMPI    #$00FA, R2                      ; 54F3   037A 00FA
        RLC     R1,     1                       ; 54F5   0051
        MVO     R1,     G_0164                  ; 54F6   0241 0164
        MVI     G_016C, R0                      ; 54F8   0280 016C
        ANDI    #$00FE, R0                      ; 54FA   03B8 00FE
        XORI    #$0001, R0                      ; 54FC   03F8 0001
        MVO     R0,     G_016C                  ; 54FE   0240 016C
        PULR    R7                              ; 5500   02B7

        JSR     R5,     L_5563                  ; 5501   0004 0154 0163

        BNEQ    L_55F7                          ; 5504   020C 00F1

        MVII    #$0016, R0                      ; 5506   02B8 0016
        SDBD                                    ; 5508   0001
        MVII    #$5FC7, R2                      ; 5509   02BA 00C7 005F
        MVII    #$00D6, R3                      ; 550C   02BB 00D6
        MVII    #$020F, R4                      ; 550E   02BC 020F
        COMR    R4                              ; 5510   001C

        JSR     R5,     L_5581                  ; 5511   0004 0154 0181

        MVII    #$000D, R3                      ; 5514   02BB 000D
        MVII    #$0064, R4                      ; 5516   02BC 0064
        B       L_552E                          ; 5518   0200 0014

        JSR     R5,     L_5563                  ; 551A   0004 0154 0163

        BNEQ    L_55F7                          ; 551D   020C 00D8

        SDBD                                    ; 551F   0001
        MVII    #$5FC0, R2                      ; 5520   02BA 00C0 005F
        CLRR    R3                              ; 5523   01DB
        MVII    #$020F, R4                      ; 5524   02BC 020F
        COMR    R4                              ; 5526   001C

        JSR     R5,     L_5586                  ; 5527   0004 0154 0186

        MVII    #$0190, R4                      ; 552A   02BC 0190
        MVII    #$000A, R3                      ; 552C   02BB 000A
L_552E:
        MVO     R4,     G_016A                  ; 552E   0244 016A
        INCR    R1                              ; 5530   0009
        MVO@    R3,     R1                      ; 5531   024B
        MVI     G_0163, R0                      ; 5532   0280 0163
        ANDI    #$0057, R0                      ; 5534   03B8 0057
        XORI    #$0088, R0                      ; 5536   03F8 0088
        MVO     R0,     G_0163                  ; 5538   0240 0163
        SUBI    #$0006, R1                      ; 553A   0339 0006
        MVI@    R1,     R0                      ; 553C   0288
        SDBD                                    ; 553D   0001
        ANDI    #$FDFF, R0                      ; 553E   03B8 00FF 00FD
        MOVR    R1,     R4                      ; 5541   008C
        ADDI    #$0002, R4                      ; 5542   02FC 0002
        MVI@    R4,     R3                      ; 5544   02A3
        SWAP    R3,     1                       ; 5545   0043
        ANDI    #$00FF, R3                      ; 5546   03BB 00FF

        JSR     R5,     L_5B61                  ; 5548   0004 0158 0361

        CMPR    R2,     R3                      ; 554B   0153
        BMI     L_5550                          ; 554C   020B 0002

        XORI    #$0200, R0                      ; 554E   03F8 0200
L_5550:
        MVO@    R0,     R1                      ; 5550   0248

        JSR     R5,     L_508F                  ; 5551   0004 0150 008F

        SDBD                                    ; 5554   0001
        MVII    #$5F8A, R2                      ; 5555   02BA 008A 005F
L_5558:
        MVO     R2,     G_031E                  ; 5558   0242 031E
        CLRR    R2                              ; 555A   01D2
        MVO     R2,     G_0322                  ; 555B   0242 0322
        PULR    R7                              ; 555D   02B7

L_555E:
        PSHR    R5                              ; 555E   0275
        MVI     G_0163, R5                      ; 555F   0285 0163
        B       L_556E                          ; 5561   0200 000B

L_5563:
        MVI     G_0163, R2                      ; 5563   0282 0163
        ANDI    #$0008, R2                      ; 5565   03BA 0008
        BNEQ    L_55F7                          ; 5567   020C 008E

L_5569:
        PSHR    R5                              ; 5569   0275
        MVI     G_0163, R5                      ; 556A   0285 0163
        XORI    #$0001, R5                      ; 556C   03FD 0001
L_556E:
        MOVR    R5,     R1                      ; 556E   00A9
        ANDI    #$0001, R1                      ; 556F   03B9 0001
        SLL     R1,     2                       ; 5571   004D
        SLL     R1,     1                       ; 5572   0049
        ADDI    #$0325, R1                      ; 5573   02F9 0325
        ANDI    #$0002, R5                      ; 5575   03BD 0002
        PULR    R7                              ; 5577   02B7

L_5578:
        MVII    #$0018, R0                      ; 5578   02B8 0018
        SDBD                                    ; 557A   0001
        MVII    #$5F6E, R2                      ; 557B   02BA 006E 005F
        MVII    #$00D2, R3                      ; 557E   02BB 00D2
        CLRR    R4                              ; 5580   01E4
L_5581:
        PSHR    R5                              ; 5581   0275

        JSR     R5,     L_5A39                  ; 5582   0004 0158 0239

        PULR    R5                              ; 5585   02B5
L_5586:
        INCR    R1                              ; 5586   0009
        MVO@    R2,     R1                      ; 5587   024A
        ADDI    #$0003, R1                      ; 5588   02F9 0003
        MVO@    R3,     R1                      ; 558A   024B
        INCR    R1                              ; 558B   0009
        MVO@    R4,     R1                      ; 558C   024C
        MOVR    R5,     R7                      ; 558D   00AF

        NEGR    R0                              ; 558E   0020
        COMR    R4                              ; 558F   001C
        DECR    R4                              ; 5590   0014
        DECR    R0                              ; 5591   0010
        INCR    R6                              ; 5592   000E
        DECR    R0                              ; 5593   0010
        DECR    R4                              ; 5594   0014
        COMR    R4                              ; 5595   001C
L_5596:
        CLRR    R3                              ; 5596   01DB
L_5597:
        PSHR    R5                              ; 5597   0275
        MOVR    R1,     R5                      ; 5598   008D
        ANDI    #$0007, R5                      ; 5599   03BD 0007
        ADDR    R7,     R5                      ; 559B   00FD
        SUBI    #$000E, R5                      ; 559C   033D 000E
        MVI@    R5,     R0                      ; 559E   02A8
        TSTR    R3                              ; 559F   009B
        BEQ     L_55AB                          ; 55A0   0204 0009

        PSHR    R1                              ; 55A2   0271
        MVII    #$0005, R1                      ; 55A3   02B9 0005

        JSR     R5,     X_MPY                   ; 55A5   0004 011C 01DC

        PULR    R1                              ; 55A8   02B1
        SLR     R2,     2                       ; 55A9   0066
        MOVR    R2,     R0                      ; 55AA   0090

L_55AB:
        JSR     R5,     .EXEC.629               ; 55AB   0004 0114 0229

        PULR    R7                              ; 55AE   02B7

        DECLE   $0000,  $0000,  $0060,  $0054   ; 55AF   0000 0000 0060 0054
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55B3   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 55B7   0000 0000
L_55B9:
        MVI     G_0163, R0                      ; 55B9   0280 0163
        ANDI    #$003F, R0                      ; 55BB   03B8 003F
        XORI    #$00C0, R0                      ; 55BD   03F8 00C0
        MVO     R0,     G_0163                  ; 55BF   0240 0163
        SDBD                                    ; 55C1   0001
        MVII    #$1906, R0                      ; 55C2   02B8 0006 0019
        MVO     R0,     G_035D                  ; 55C5   0240 035D
        B       L_55DF                          ; 55C7   0200 0016

L_55C9:
        MVI     G_0163, R0                      ; 55C9   0280 0163
        ANDI    #$003F, R0                      ; 55CB   03B8 003F
        MVO     R0,     G_0163                  ; 55CD   0240 0163
        MOVR    R7,     R0                      ; 55CF   00B8
        SUBI    #$0021, R0                      ; 55D0   0338 0021
        MVO     R0,     G_035D                  ; 55D2   0240 035D
L_55D4:
        PSHR    R5                              ; 55D4   0275

        JSR     R5,     L_55DF                  ; 55D5   0004 0154 01DF

        MVII    #$0002, R5                      ; 55D8   02BD 0002
        CLRR    R2                              ; 55DA   01D2
        MVII    #$0013, R3                      ; 55DB   02BB 0013
        B       L_55E6                          ; 55DD   0200 0007

L_55DF:
        PSHR    R5                              ; 55DF   0275
        MVII    #$0006, R5                      ; 55E0   02BD 0006
        MVII    #$0004, R2                      ; 55E2   02BA 0004
        MVII    #$0002, R3                      ; 55E4   02BB 0002
L_55E6:
        MVII    #$0325, R1                      ; 55E6   02B9 0325
L_55E8:
        MVI@    R1,     R0                      ; 55E8   0288
        SDBD                                    ; 55E9   0001
        ANDI    #$FFE8, R0                      ; 55EA   03B8 00E8 00FF
        XORR    R2,     R0                      ; 55ED   01D0
        MVO@    R0,     R1                      ; 55EE   0248
        ADDI    #$0008, R1                      ; 55EF   02F9 0008
        PSHR    R2                              ; 55F1   0272
        MOVR    R3,     R2                      ; 55F2   009A
        PULR    R3                              ; 55F3   02B3
        DECR    R5                              ; 55F4   0015
        BNEQ    L_55E8                          ; 55F5   022C 000E
L_55F7:
        PULR    R7                              ; 55F7   02B7

L_55F8:
        PSHR    R5                              ; 55F8   0275

        JSR     R5,     L_5569                  ; 55F9   0004 0154 0169

        BNEQ    L_565F                          ; 55FC   020C 0061

        CLRR    R0                              ; 55FE   01C0
        MVO     R0,     G_0321                  ; 55FF   0240 0321
        MVI     G_0163, R0                      ; 5601   0280 0163
        ANDI    #$0020, R0                      ; 5603   03B8 0020
        BEQ     L_5620                          ; 5605   0204 0019

        MVI     G_0322, R0                      ; 5607   0280 0322
        ANDI    #$000F, R0                      ; 5609   03B8 000F
        CMPI    #$0002, R0                      ; 560B   0378 0002
        BNEQ    L_561A                          ; 560D   020C 000B

        MVI     G_016B, R5                      ; 560F   0285 016B
        TSTR    R5                              ; 5611   00AD
        BNEQ    L_561D                          ; 5612   020C 0009

        JSR     R5,     L_585D                  ; 5614   0004 0158 005D

        MVII    #$0001, R5                      ; 5617   02BD 0001
        INCR    R7                              ; 5619   000F

L_561A:
        CLRR    R5                              ; 561A   01ED
L_561B:
        MVO     R5,     G_016B                  ; 561B   0245 016B
L_561D:
        COMR    R0                              ; 561D   0018
        XORI    #$000F, R0                      ; 561E   03F8 000F
L_5620:
        MVO     R0,     G_0322                  ; 5620   0240 0322
        MVI@    R1,     R3                      ; 5622   028B
        ADDI    #$0002, R1                      ; 5623   02F9 0002
        MVI@    R1,     R0                      ; 5625   0288
        SWAP    R0,     1                       ; 5626   0040
        ANDI    #$00FF, R0                      ; 5627   03B8 00FF
        PSHR    R0                              ; 5629   0270
        ANDI    #$0200, R3                      ; 562A   03BB 0200
        BNEQ    L_5630                          ; 562C   020C 0002

        ADDI    #$0007, R0                      ; 562E   02F8 0007
L_5630:
        DECR    R0                              ; 5630   0010
        INCR    R1                              ; 5631   0009
        MVI@    R1,     R1                      ; 5632   0289
        SWAP    R1,     1                       ; 5633   0041
        ANDI    #$00FF, R1                      ; 5634   03B9 00FF
        PSHR    R1                              ; 5636   0271
        MVI     G_0163, R4                      ; 5637   0284 0163
        ANDI    #$0008, R4                      ; 5639   03BC 0008
        SUBR    R4,     R1                      ; 563B   0121
        ADDI    #$0008, R1                      ; 563C   02F9 0008

        JSR     R5,     L_5B61                  ; 563E   0004 0158 0361

        SUBI    #$0003, R2                      ; 5641   033A 0003
        MVII    #$0040, R3                      ; 5643   02BB 0040
        SWAP    R0,     1                       ; 5645   0040
        MVO     R0,     G_031F                  ; 5646   0240 031F
        SWAP    R1,     1                       ; 5648   0041
        TSTR    R4                              ; 5649   00A4
        MVO     R1,     G_0320                  ; 564A   0241 0320
        PULR    R1                              ; 564C   02B1
        PULR    R0                              ; 564D   02B0
        BNEQ    L_565F                          ; 564E   020C 000F

        JSR     R5,     .EXEC.78C               ; 5650   0004 0114 038C

        MVII    #$0165, R5                      ; 5653   02BD 0165
        MVO@    R2,     R5                      ; 5655   026A
        SWAP    R2,     1                       ; 5656   0042
        MVO@    R2,     R5                      ; 5657   026A
        MVO@    R3,     R5                      ; 5658   026B
        MVO@    R4,     R5                      ; 5659   026C

        JSR     R5,     .EXEC.A2F               ; 565A   0004 0118 022F

        MVO     R1,     G_0169                  ; 565D   0241 0169
L_565F:
        PULR    R7                              ; 565F   02B7

L_5660:
        PSHR    R5                              ; 5660   0275
        MVII    #$0006, R3                      ; 5661   02BB 0006
        MVII    #$031E, R4                      ; 5663   02BC 031E
L_5665:
        ADDI    #$0007, R4                      ; 5665   02FC 0007
        MVI@    R4,     R0                      ; 5667   02A0
        ANDI    #$0008, R0                      ; 5668   03B8 0008
        BNEQ    L_568A                          ; 566A   020C 001E

        MVI@    R4,     R5                      ; 566C   02A5
        MVI@    R5,     R0                      ; 566D   02A8
        SWAP    R0,     1                       ; 566E   0040
        SARC    R0,     2                       ; 566F   007C
        BNC     L_5689                          ; 5670   0209 0017
        BNOV    L_5689                          ; 5672   020A 0015

        MVI@    R4,     R0                      ; 5674   02A0
        MVI@    R4,     R1                      ; 5675   02A1
        SWAP    R0,     1                       ; 5676   0040
        ANDI    #$00FF, R0                      ; 5677   03B8 00FF
        SWAP    R1,     1                       ; 5679   0041
        ANDI    #$00FF, R1                      ; 567A   03B9 00FF
        SUBI    #$004F, R0                      ; 567C   0338 004F
        CMPR    R0,     R1                      ; 567E   0141
        BLE     L_5699                          ; 567F   0206 0018

        NEGR    R0                              ; 5681   0020
        ADDI    #$000A, R0                      ; 5682   02F8 000A
        CMPR    R0,     R1                      ; 5684   0141
        BLE     L_568E                          ; 5685   0206 0007

        SUBI    #$0002, R4                      ; 5687   033C 0002
L_5689:
        DECR    R4                              ; 5689   0014
L_568A:
        DECR    R3                              ; 568A   0013
        BNEQ    L_5665                          ; 568B   022C 0027
        PULR    R7                              ; 568D   02B7

L_568E:
        MVI@    R4,     R0                      ; 568E   02A0
        BNEQ    L_5694                          ; 568F   020C 0003

        TSTR    R0                              ; 5691   0080
        BPL     L_56A9                          ; 5692   0203 0015

L_5694:
        NEGR    R1                              ; 5694   0021
        ADDI    #$000A, R1                      ; 5695   02F9 000A
        B       L_569F                          ; 5697   0200 0006

L_5699:
        MVI@    R4,     R0                      ; 5699   02A0
        BNEQ    L_569F                          ; 569A   020C 0003

        TSTR    R0                              ; 569C   0080
        BMI     L_56A9                          ; 569D   020B 000A

L_569F:
        ANDI    #$00FF, R0                      ; 569F   03B8 00FF
        ADDI    #$004F, R1                      ; 56A1   02F9 004F
        SUBI    #$0003, R4                      ; 56A3   033C 0003
        SWAP    R1,     1                       ; 56A5   0041
        MVO@    R1,     R4                      ; 56A6   0261
        INCR    R4                              ; 56A7   000C
        MVO@    R0,     R4                      ; 56A8   0260
L_56A9:
        SUBI    #$0004, R4                      ; 56A9   033C 0004
        B       L_568A                          ; 56AB   0220 0022

        PSHR    R5                              ; 56AD   0275
        MVII    #$0302, R4                      ; 56AE   02BC 0302

        JSR     R5,     .EXEC.70F               ; 56B0   0004 0114 030F

        BNC     L_565F                          ; 56B3   0229 0055

        CMPI    #$0335, R1                      ; 56B5   0379 0335
        BPL     L_56DD                          ; 56B7   0203 0024

        JSR     R5,     .EXEC.2CA               ; 56B9   0004 0110 02CA

        MOVR    R1,     R2                      ; 56BC   008A

        JSR     R5,     L_5569                  ; 56BD   0004 0154 0169

        BNEQ    L_565F                          ; 56C0   022C 0062

        CMPR    R1,     R2                      ; 56C2   014A
        BNEQ    L_565F                          ; 56C3   022C 0065

        CMPI    #$0003, R3                      ; 56C5   037B 0003
        BMI     L_565F                          ; 56C7   022B 0069

        JSR     R5,     .EXEC.766               ; 56C9   0004 0114 0366

        XORR    R3,     R0                      ; 56CC   01D8
        ANDI    #$0001, R0                      ; 56CD   03B8 0001
        BEQ     L_565F                          ; 56CF   0224 0071

        MVII    #$0004, R0                      ; 56D1   02B8 0004

        JSR     R5,     X_RAND1                 ; 56D3   0004 0114 027D

        TSTR    R0                              ; 56D6   0080
        BNEQ    L_565F                          ; 56D7   022C 0079

        PULR    R5                              ; 56D9   02B5
        J       L_5A4E                          ; 56DA   0004 0358 024E

L_56DD:
        MOVR    R1,     R2                      ; 56DD   008A
        ADDI    #$0004, R2                      ; 56DE   02FA 0004
        MVI@    R2,     R5                      ; 56E0   0295
        TSTR    R5                              ; 56E1   00AD
        BEQ     L_565F                          ; 56E2   0224 0084

        PSHR    R2                              ; 56E4   0272

        JSR     R5,     .EXEC.2CA               ; 56E5   0004 0110 02CA

        PULR    R2                              ; 56E8   02B2
        MVI@    R2,     R5                      ; 56E9   0295
        TSTR    R5                              ; 56EA   00AD
        BNEQ    L_565F                          ; 56EB   022C 008D

        MOVR    R3,     R0                      ; 56ED   0098

        JSR     R5,     .EXEC.777               ; 56EE   0004 0114 0377

        PSHR    R1                              ; 56F1   0271
        PSHR    R2                              ; 56F2   0272
        PSHR    R3                              ; 56F3   0273

        JSR     R5,     .EXEC.772               ; 56F4   0004 0114 0372

        SUB@    R6,     R3                      ; 56F7   0333
        SUB@    R6,     R2                      ; 56F8   0332
        PULR    R1                              ; 56F9   02B1
        PSHR    R3                              ; 56FA   0273
        PSHR    R2                              ; 56FB   0272
        MOVR    R0,     R3                      ; 56FC   0083
        MVII    #$0202, R4                      ; 56FD   02BC 0202

        JSR     R5,     .EXEC.70F               ; 56FF   0004 0114 030F

        CLRR    R0                              ; 5702   01C0
        RRC     R0,     1                       ; 5703   0070
        PSHR    R0                              ; 5704   0270
        MVII    #$0301, R4                      ; 5705   02BC 0301

        JSR     R5,     .EXEC.70F               ; 5707   0004 0114 030F

        PULR    R5                              ; 570A   02B5
        PULR    R2                              ; 570B   02B2
        PULR    R3                              ; 570C   02B3
        MVII    #$0019, R0                      ; 570D   02B8 0019
        BC      L_571B                          ; 570F   0201 000A

        TSTR    R5                              ; 5711   00AD
        BNEQ    L_5718                          ; 5712   020C 0004

        MOVR    R2,     R5                      ; 5714   0095
        XORR    R3,     R5                      ; 5715   01DD
        BMI     L_571B                          ; 5716   020B 0003

L_5718:
        MOVR    R3,     R2                      ; 5718   009A
        NEGR    R2                              ; 5719   0022
        SWAP    R0,     1                       ; 571A   0040
L_571B:
        TSTR    R2                              ; 571B   0092
        BMI     L_571F                          ; 571C   020B 0001

        NEGR    R0                              ; 571E   0020
L_571F:
        ADDI    #$0004, R1                      ; 571F   02F9 0004
        MVO@    R0,     R1                      ; 5721   0248
        PULR    R7                              ; 5722   02B7

L_5723:
        PSHR    R5                              ; 5723   0275
        CMPR    R0,     R3                      ; 5724   0143
        BEQ     L_565F                          ; 5725   0224 00C7

        JSR     R5,     .EXEC.98D               ; 5727   0004 0118 018D

        MOVR    R1,     R4                      ; 572A   008C
        MVII    #$0355, R1                      ; 572B   02B9 0355
        MVII    #$0008, R0                      ; 572D   02B8 0008
        PSHR    R4                              ; 572F   0274

        JSR     R5,     .EXEC.730               ; 5730   0004 0114 0330

        MOVR    R3,     R0                      ; 5733   0098

        JSR     R5,     .EXEC.98D               ; 5734   0004 0118 018D

        MOVR    R1,     R4                      ; 5737   008C
        PULR    R1                              ; 5738   02B1
        MVII    #$0008, R0                      ; 5739   02B8 0008
        PSHR    R4                              ; 573B   0274

        JSR     R5,     .EXEC.730               ; 573C   0004 0114 0330

        MVII    #$0008, R0                      ; 573F   02B8 0008
        PULR    R1                              ; 5741   02B1
        MVII    #$0355, R4                      ; 5742   02BC 0355

        JSR     R5,     .EXEC.730               ; 5744   0004 0114 0330

        PULR    R7                              ; 5747   02B7

L_5748:
        PSHR    R5                              ; 5748   0275
        CLRR    R4                              ; 5749   01E4
L_574A:
        MOVR    R4,     R0                      ; 574A   00A0

        JSR     R5,     .EXEC.76C               ; 574B   0004 0114 036C

        MOVR    R1,     R3                      ; 574E   008B
        MVI@    R3,     R0                      ; 574F   0298
        ANDI    #$0008, R0                      ; 5750   03B8 0008
        BEQ     L_5770                          ; 5752   0204 001C

        ADDI    #$0004, R3                      ; 5754   02FB 0004
        MVI@    R3,     R0                      ; 5756   0298
        MOVR    R0,     R1                      ; 5757   0081
        SWAP    R0,     1                       ; 5758   0040
        ADDI    #$0004, R1                      ; 5759   02F9 0004

        JSR     R5,     X_PACK_BYTES            ; 575B   0004 0114 034F

        MVO@    R0,     R3                      ; 575E   0258
        ADDI    #$0003, R3                      ; 575F   02FB 0003
        MVI@    R3,     R0                      ; 5761   0298
        DECR    R0                              ; 5762   0010
        MVO@    R0,     R3                      ; 5763   0258
        BNEQ    L_5770                          ; 5764   020C 000A

        SUBI    #$0007, R3                      ; 5766   033B 0007
        MVI@    R3,     R0                      ; 5768   0298
        XORI    #$0008, R0                      ; 5769   03F8 0008
        MVO@    R0,     R3                      ; 576B   0258
        CLRR    R0                              ; 576C   01C0
        ADDI    #$0004, R3                      ; 576D   02FB 0004
        MVO@    R0,     R3                      ; 576F   0258
L_5770:
        INCR    R4                              ; 5770   000C
        CMPI    #$0007, R4                      ; 5771   037C 0007
        BMI     L_574A                          ; 5773   022B 002A
        PULR    R7                              ; 5775   02B7

L_5776:
        PSHR    R5                              ; 5776   0275
        MVI@    R1,     R3                      ; 5777   028B
        ADDI    #$0004, R1                      ; 5778   02F9 0004
        ANDI    #$0008, R3                      ; 577A   03BB 0008
        BEQ     L_5783                          ; 577C   0204 0005

        CMPI    #$0001, R4                      ; 577E   037C 0001
        BEQ     L_565F                          ; 5780   0224 0122
        INCR    R7                              ; 5782   000F

L_5783:
        MVO@    R0,     R1                      ; 5783   0248
L_5784:
        MVI     G_0163, R2                      ; 5784   0282 0163
        TSTR    R0                              ; 5786   0080
        BEQ     L_57CF                          ; 5787   0204 0046

        SUBI    #$0004, R1                      ; 5789   0339 0004
        DECR    R4                              ; 578B   0014
        BNEQ    L_579E                          ; 578C   020C 0010

        JSR     R5,     L_581F                  ; 578E   0004 0158 001F

        BPL     L_57BC                          ; 5791   0203 0029

        JSR     R5,     L_584C                  ; 5793   0004 0158 004C

        SDBD                                    ; 5796   0001
        MVII    #$5F91, R2                      ; 5797   02BA 0091 005F
        MVII    #$0001, R3                      ; 579A   02BB 0001
        B       L_57C5                          ; 579C   0200 0027
L_579E:
        BPL     L_57BC                          ; 579E   0203 001C

        MOVR    R2,     R5                      ; 57A0   0095
        ANDI    #$0002, R5                      ; 57A1   03BD 0002
        BNEQ    L_57B1                          ; 57A3   020C 000C

        ANDI    #$00DF, R2                      ; 57A5   03BA 00DF
        XORI    #$0020, R2                      ; 57A7   03FA 0020
        MVO     R2,     G_0163                  ; 57A9   0242 0163
        SDBD                                    ; 57AB   0001
        MVII    #$5F5C, R5                      ; 57AC   02BD 005C 005F
        MVO     R5,     G_031E                  ; 57AF   0245 031E
L_57B1:
        MOVR    R2,     R5                      ; 57B1   0095
        ANDI    #$0008, R5                      ; 57B2   03BD 0008
        BEQ     L_57BC                          ; 57B4   0204 0006

        ANDI    #$00FB, R2                      ; 57B6   03BA 00FB
        XORI    #$0004, R2                      ; 57B8   03FA 0004
        MVO     R2,     G_0163                  ; 57BA   0242 0163

L_57BC:
        JSR     R5,     L_583F                  ; 57BC   0004 0158 003F

        SDBD                                    ; 57BF   0001
        MVII    #$5FCE, R2                      ; 57C0   02BA 00CE 005F
        MVII    #$0007, R3                      ; 57C3   02BB 0007
L_57C5:
        INCR    R1                              ; 57C5   0009
        MVO@    R2,     R1                      ; 57C6   024A
        ADDI    #$0004, R1                      ; 57C7   02F9 0004
        AND@    R1,     R3                      ; 57C9   038B
        COMR    R3                              ; 57CA   001B
        XORI    #$000F, R3                      ; 57CB   03FB 000F
        MVO@    R3,     R1                      ; 57CD   024B
        PULR    R7                              ; 57CE   02B7

L_57CF:
        INCR    R4                              ; 57CF   000C
        ADDR    R7,     R4                      ; 57D0   00FC
        ADD@    R4,     R7                      ; 57D1   02E7

        DIS                                     ; 57D2   0003
        GSWD    R0                              ; 57D3   0030
        SWAP    R0,     1                       ; 57D4   0040
        MOVR    R2,     R5                      ; 57D5   0095
        ANDI    #$0020, R2                      ; 57D6   03BA 0020
        BNEQ    L_57F2                          ; 57D8   020C 0018

        MOVR    R5,     R2                      ; 57DA   00AA
        ANDI    #$0008, R5                      ; 57DB   03BD 0008
        BNEQ    L_57E3                          ; 57DD   020C 0004

        INCR    R1                              ; 57DF   0009
        CLRR    R0                              ; 57E0   01C0
        B       L_57F9                          ; 57E1   0200 0016

L_57E3:
        MOVR    R2,     R0                      ; 57E3   0090
        ANDI    #$0002, R0                      ; 57E4   03B8 0002
        BEQ     L_565F                          ; 57E6   0224 0188

        ANDI    #$0004, R2                      ; 57E8   03BA 0004
        BNEQ    L_5812                          ; 57EA   020C 0026

        INCR    R1                              ; 57EC   0009
        MVI@    R1,     R0                      ; 57ED   0288
        ANDI    #$000F, R0                      ; 57EE   03B8 000F
        MVO@    R0,     R1                      ; 57F0   0248
        PULR    R7                              ; 57F1   02B7

L_57F2:
        INCR    R1                              ; 57F2   0009
        MVI@    R1,     R0                      ; 57F3   0288
        ANDI    #$0003, R0                      ; 57F4   03B8 0003
        COMR    R0                              ; 57F6   0018
        XORI    #$000F, R0                      ; 57F7   03F8 000F
L_57F9:
        MVO@    R0,     R1                      ; 57F9   0248
        SDBD                                    ; 57FA   0001
        MVII    #$5F55, R2                      ; 57FB   02BA 0055 005F
        SUBI    #$0004, R1                      ; 57FE   0339 0004
        MVO@    R2,     R1                      ; 5800   024A
        PULR    R7                              ; 5801   02B7

        SUBI    #$0004, R1                      ; 5802   0339 0004

        JSR     R5,     L_584C                  ; 5804   0004 0158 004C

        SDBD                                    ; 5807   0001
        MVII    #$5F91, R2                      ; 5808   02BA 0091 005F

        JSR     R5,     L_581F                  ; 580B   0004 0158 001F

        BMI     L_5818                          ; 580E   020B 0008
        B       L_5814                          ; 5810   0200 0002

L_5812:
        SUBI    #$0004, R1                      ; 5812   0339 0004
L_5814:
        SDBD                                    ; 5814   0001
        MVII    #$5FB9, R2                      ; 5815   02BA 00B9 005F
L_5818:
        INCR    R1                              ; 5818   0009
        MVO@    R2,     R1                      ; 5819   024A
        ADDI    #$0004, R1                      ; 581A   02F9 0004
        CLRR    R0                              ; 581C   01C0
        MVO@    R0,     R1                      ; 581D   0248
        PULR    R7                              ; 581E   02B7

L_581F:
        PSHR    R5                              ; 581F   0275
        ADDI    #$0002, R1                      ; 5820   02F9 0002
        MVI@    R1,     R5                      ; 5822   028D
        SUB     G_031F, R5                      ; 5823   0305 031F
        BPL     L_5828                          ; 5825   0203 0001

        NEGR    R5                              ; 5827   0025
L_5828:
        SUBI    #$0002, R1                      ; 5828   0339 0002
        SDBD                                    ; 582A   0001
        CMPI    #$1E00, R5                      ; 582B   037D 0000 001E
        BPL     L_565F                          ; 582E   0223 01D0

        ADDI    #$0003, R1                      ; 5830   02F9 0003
        MVI@    R1,     R5                      ; 5832   028D
        SUB     G_0320, R5                      ; 5833   0305 0320
        BPL     L_5838                          ; 5835   0203 0001

        NEGR    R5                              ; 5837   0025
L_5838:
        SUBI    #$0003, R1                      ; 5838   0339 0003
        SDBD                                    ; 583A   0001
        CMPI    #$1400, R5                      ; 583B   037D 0000 0014
        PULR    R7                              ; 583E   02B7

L_583F:
        PSHR    R5                              ; 583F   0275
        MVI@    R1,     R5                      ; 5840   028D
        SDBD                                    ; 5841   0001
        ANDI    #$FDFF, R5                      ; 5842   03BD 00FF 00FD
        TSTR    R0                              ; 5845   0080
L_5846:
        BPL     L_584A                          ; 5846   0203 0002

        XORI    #$0200, R5                      ; 5848   03FD 0200
L_584A:
        MVO@    R5,     R1                      ; 584A   024D
        PULR    R7                              ; 584B   02B7

L_584C:
        PSHR    R5                              ; 584C   0275
        MVI@    R1,     R5                      ; 584D   028D
        SDBD                                    ; 584E   0001
        ANDI    #$FDFF, R5                      ; 584F   03BD 00FF 00FD
        MOVR    R1,     R3                      ; 5852   008B
        ADDI    #$0002, R3                      ; 5853   02FB 0002
        MVI@    R3,     R3                      ; 5855   029B
        SLR     R3,     1                       ; 5856   0063
        MVI     G_031F, R0                      ; 5857   0280 031F
        SLR     R0,     1                       ; 5859   0060
        SUBR    R3,     R0                      ; 585A   0118
        B       L_5846                          ; 585B   0220 0016

L_585D:
        PSHR    R5                              ; 585D   0275
        PSHR    R0                              ; 585E   0270
        PSHR    R1                              ; 585F   0271

        JSR     R5,     L_5CED                  ; 5860   0004 015C 00ED

        PULR    R1                              ; 5863   02B1
        PULR    R0                              ; 5864   02B0
        PULR    R7                              ; 5865   02B7

        DECLE   $0064,  $00A8,  $0064,  $0000   ; 5866   0064 00A8 0064 0000
        DECLE   $0068,  $00A8,  $0068,  $0000   ; 586A   0068 00A8 0068 0000
        DECLE   $0068,  $00A8,  $0064,  $0000   ; 586E   0068 00A8 0064 0000
        DECLE   $0038,  $0062,  $0038,  $0046   ; 5872   0038 0062 0038 0046
        DECLE   $0040,  $004F,  $0040,  $0059   ; 5876   0040 004F 0040 0059
        DECLE   $0048,  $0046,  $0048,  $0062   ; 587A   0048 0046 0048 0062
        DECLE   $0038,  $0062,  $0038,  $0046   ; 587E   0038 0062 0038 0046
        DECLE   $0040,  $0059,  $0040,  $004F   ; 5882   0040 0059 0040 004F
        DECLE   $0048,  $0046,  $0048,  $0062   ; 5886   0048 0046 0048 0062
        DECLE   $0040,  $0078,  $0045,  $0028   ; 588A   0040 0078 0045 0028
        DECLE   $0048,  $007E,  $0048,  $0008   ; 588E   0048 007E 0048 0008
        DECLE   $0038,  $0070,  $0040,  $0068   ; 5892   0038 0070 0040 0068
        DECLE   $0040,  $0078,  $0040,  $0030   ; 5896   0040 0078 0040 0030
        DECLE   $0045,  $0080,  $0048,  $002A   ; 589A   0045 0080 0048 002A
        DECLE   $0048,  $00A0,  $0038,  $0038   ; 589E   0048 00A0 0038 0038
        DECLE   $0040,  $0040,  $0040,  $0030   ; 58A2   0040 0040 0040 0030
        DECLE   $00C4,  $0018,  $0000,  $0000   ; 58A6   00C4 0018 0000 0000
        DECLE   $0000,  $00A0,  $0000,  $0064   ; 58AA   0000 00A0 0000 0064
        DECLE   $0000,  $0000,  $00F0,  $0003   ; 58AE   0000 0000 00F0 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58B2   0000 0000 0000 0000
        DECLE   $00C2,  $0018,  $0000,  $0000   ; 58B6   00C2 0018 0000 0000
        DECLE   $0000,  $0008,  $0000,  $0064   ; 58BA   0000 0008 0000 0064
        DECLE   $0000,  $0000,  $00F0,  $0003   ; 58BE   0000 0000 00F0 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58C2   0000 0000 0000 0000
        DECLE   $009B,  $0018,  $0063,  $005F   ; 58C6   009B 0018 0063 005F
        DECLE   $0000,  $0056,  $0000,  $003F   ; 58CA   0000 0056 0000 003F
        DECLE   $00D3,  $0000,  $0000,  $0000   ; 58CE   00D3 0000 0000 0000
        DECLE   $0000,  $0000,  $0034,  $0000   ; 58D2   0000 0000 0034 0000

        ADDR    R6,     R1                      ; 58D6   00F1
        SLLC    R1,     1                       ; 58D7   0059
        ADDR    R6,     R1                      ; 58D8   00F1
        SLLC    R1,     1                       ; 58D9   0059
        ADDR    R6,     R1                      ; 58DA   00F1
        SLLC    R1,     1                       ; 58DB   0059
        ADDR    R6,     R1                      ; 58DC   00F1
        SLLC    R1,     1                       ; 58DD   0059
        ADDR    R6,     R1                      ; 58DE   00F1
        SLLC    R1,     1                       ; 58DF   0059
L_58E0:
        PSHR    R5                              ; 58E0   0275

        JSR     R5,     L_5BB9                  ; 58E1   0004 0158 03B9

        MVII    #$0007, R0                      ; 58E4   02B8 0007

        JSR     R5,     X_PLAY_CHEER1           ; 58E6   0004 011C 02D5

        MVI     G_0162, R1                      ; 58E9   0281 0162
        INCR    R1                              ; 58EB   0009
        MVO     R1,     G_0162                  ; 58EC   0241 0162
        CMPI    #$0005, R1                      ; 58EE   0379 0005
        BPL     L_591C                          ; 58F0   0203 002A

        SDBD                                    ; 58F2   0001
        MVII    #$1140, R0                      ; 58F3   02B8 0040 0011
        CMPI    #$0003, R1                      ; 58F6   0379 0003
        BMI     L_58FD                          ; 58F8   020B 0003

        MVII    #$0032, R0                      ; 58FA   02B8 0032
        SWAP    R0,     1                       ; 58FC   0040
L_58FD:
        ADDI    #$022F, R1                      ; 58FD   02F9 022F
        MVO@    R0,     R1                      ; 58FF   0248
        MVII    #$000C, R0                      ; 5900   02B8 000C
L_5902:
        SWAP    R0,     1                       ; 5902   0040

        JSR     R5,     L_5242                  ; 5903   0004 0150 0242
        JSR     R5,     L_5212                  ; 5906   0004 0150 0212
        JSR     R5,     L_5925                  ; 5909   0004 0158 0125
        JSR     R5,     L_5087                  ; 590C   0004 0150 0087

        MVII    #$00C2, R0                      ; 590F   02B8 00C2
        MVO     R0,     G_0163                  ; 5911   0240 0163
        MVII    #$0064, R0                      ; 5913   02B8 0064

        JSR     R5,     .EXEC.A62               ; 5915   0004 0118 0262
        JSR     R5,     L_5937                  ; 5918   0004 0158 0137

        PULR    R7                              ; 591B   02B7

L_591C:
        MVI     G_015D, R0                      ; 591C   0280 015D
        CMP     G_015E, R0                      ; 591E   0340 015E
        MVII    #$0005, R0                      ; 5920   02B8 0005
        BEQ     L_5902                          ; 5922   0224 0021
L_5924:
        DECR    R7                              ; 5924   0017

L_5925:
        PSHR    R5                              ; 5925   0275
        MVII    #$0018, R0                      ; 5926   02B8 0018
        MVO     R0,     G_0161                  ; 5928   0240 0161

        JSR     R5,     L_523A                  ; 592A   0004 0150 023A
        JSR     R5,     L_5095                  ; 592D   0004 0150 0095

        PULR    R7                              ; 5930   02B7

        MOVR    R7,     R0                      ; 5931   00B8
        SUBI    #$005C, R0                      ; 5932   0338 005C
L_5934:
        MVO     R0,     G_035D                  ; 5934   0240 035D
L_5936:
        MOVR    R5,     R7                      ; 5936   00AF

L_5937:
        PSHR    R5                              ; 5937   0275
        MVII    #$0325, R2                      ; 5938   02BA 0325
        MOVR    R7,     R1                      ; 593A   00B9
        SUBI    #$0095, R1                      ; 593B   0339 0095
        MVII    #$0003, R3                      ; 593D   02BB 0003
L_593F:
        MVII    #$0002, R0                      ; 593F   02B8 0002

        JSR     R5,     X_INIT_MOBS             ; 5941   0004 0114 02B4

        ADDI    #$0010, R2                      ; 5944   02FA 0010
        DECR    R3                              ; 5946   0013
        BNEQ    L_593F                          ; 5947   022C 0009

        MOVR    R7,     R4                      ; 5949   00BC
        SUBI    #$00D8, R4                      ; 594A   033C 00D8
        MVI     G_0162, R5                      ; 594C   0285 0162
        ANDI    #$0001, R5                      ; 594E   03BD 0001
        BEQ     L_5954                          ; 5950   0204 0002

        ADDI    #$000C, R4                      ; 5952   02FC 000C
L_5954:
        MOVR    R7,     R0                      ; 5954   00B8
        SUBI    #$0024, R0                      ; 5955   0338 0024

        JSR     R5,     L_597C                  ; 5957   0004 0158 017C

        PULR    R7                              ; 595A   02B7

L_595B:
        PSHR    R5                              ; 595B   0275

        JSR     R5,     L_5087                  ; 595C   0004 0150 0087

        MOVR    R7,     R4                      ; 595F   00BC
        SUBI    #$00FA, R4                      ; 5960   033C 00FA
        MOVR    R7,     R0                      ; 5962   00B8
        SUBI    #$0083, R0                      ; 5963   0338 0083

        JSR     R5,     L_597C                  ; 5965   0004 0158 017C

        MVI     G_0163, R0                      ; 5968   0280 0163
        MOVR    R0,     R2                      ; 596A   0082
        ANDI    #$000A, R0                      ; 596B   03B8 000A
        XORI    #$000A, R0                      ; 596D   03F8 000A
        BEQ     L_5974                          ; 596F   0204 0003

        JSR     R5,     L_5BB9                  ; 5971   0004 0158 03B9

L_5974:
        ANDI    #$0025, R2                      ; 5974   03BA 0025
        XORI    #$00C2, R2                      ; 5976   03FA 00C2
        MVO     R2,     G_0163                  ; 5978   0242 0163
        B       L_5A78                          ; 597A   0200 00FC

L_597C:
        PSHR    R5                              ; 597C   0275
        MVO     R0,     G_0170                  ; 597D   0240 0170
        SWAP    R0,     1                       ; 597F   0040
        MVII    #$0325, R1                      ; 5980   02B9 0325
        MVO     R0,     G_0171                  ; 5982   0240 0171
        MVII    #$0001, R0                      ; 5984   02B8 0001
L_5986:
        MOVR    R1,     R5                      ; 5986   008D
        MVI@    R5,     R3                      ; 5987   02AB
        SDBD                                    ; 5988   0001
        MVII    #$5FB2, R1                      ; 5989   02B9 00B2 005F
        MVO@    R1,     R5                      ; 598C   0269
        SDBD                                    ; 598D   0001
        ANDI    #$F5F7, R3                      ; 598E   03BB 00F7 00F5
        SDBD                                    ; 5991   0001
        MVI@    R4,     R2                      ; 5992   02A2
        CMP@    R5,     R2                      ; 5993   036A
        BC      L_5998                          ; 5994   0201 0002

        XORI    #$0200, R3                      ; 5996   03FB 0200
L_5998:
        SUBI    #$0003, R5                      ; 5998   033D 0003
        MVO@    R3,     R5                      ; 599A   026B
        MVII    #$0018, R3                      ; 599B   02BB 0018

        JSR     R5,     .EXEC.9AD               ; 599D   0004 0118 01AD

        ADDI    #$0005, R1                      ; 59A0   02F9 0005
        MVII    #$000F, R2                      ; 59A2   02BA 000F
        COMR    R2                              ; 59A4   001A
        MVO@    R2,     R1                      ; 59A5   024A
        ADDI    #$0003, R1                      ; 59A6   02F9 0003
        INCR    R0                              ; 59A8   0008
        CMPI    #$0007, R0                      ; 59A9   0378 0007
        BMI     L_5986                          ; 59AB   022B 0026

        DECR    R0                              ; 59AD   0010
        MVO     R0,     G_0172                  ; 59AE   0240 0172

        JSR     R5,     L_5420                  ; 59B0   0004 0154 0020
        JSR     R5,     L_5087                  ; 59B3   0004 0150 0087

L_59B6:
        PULR    R7                              ; 59B6   02B7

        PSHR    R5                              ; 59B7   0275
        ADDI    #$0004, R1                      ; 59B8   02F9 0004
        CLRR    R0                              ; 59BA   01C0
        MVO@    R0,     R1                      ; 59BB   0248
        SUBI    #$0004, R1                      ; 59BC   0339 0004
        MOVR    R1,     R4                      ; 59BE   008C
        MVI@    R4,     R5                      ; 59BF   02A5
        SDBD                                    ; 59C0   0001
        ANDI    #$F5FF, R5                      ; 59C1   03BD 00FF 00F5
        SDBD                                    ; 59C4   0001
        XORI    #$0800, R5                      ; 59C5   03FD 0000 0008
        SDBD                                    ; 59C8   0001
        MVII    #$5FB9, R0                      ; 59C9   02B8 00B9 005F
        MVO@    R0,     R4                      ; 59CC   0260
        ADDI    #$0005, R4                      ; 59CD   02FC 0005
        MVI@    R4,     R0                      ; 59CF   02A0
        MOVR    R0,     R2                      ; 59D0   0082
        ANDI    #$00FF, R2                      ; 59D1   03BA 00FF
        XORR    R2,     R0                      ; 59D3   01D0
        SWAP    R2,     1                       ; 59D4   0042
        SUBI    #$0006, R4                      ; 59D5   033C 0006
        MVO@    R0,     R4                      ; 59D7   0260
        MVO@    R2,     R4                      ; 59D8   0262
        CLRR    R2                              ; 59D9   01D2
        MVO@    R2,     R4                      ; 59DA   0262
        MVO@    R2,     R4                      ; 59DB   0262
        SWAP    R0,     1                       ; 59DC   0040
        SUBI    #$0054, R0                      ; 59DD   0338 0054
        BMI     L_59E3                          ; 59DF   020B 0002

        XORI    #$0200, R5                      ; 59E1   03FD 0200
L_59E3:
        MVO@    R5,     R1                      ; 59E3   024D
        MVI     G_0172, R0                      ; 59E4   0280 0172
        DECR    R0                              ; 59E6   0010
        MVO     R0,     G_0172                  ; 59E7   0240 0172
        BNEQ    L_59B6                          ; 59E9   022C 0034

        MVII    #$0170, R5                      ; 59EB   02BD 0170
        SDBD                                    ; 59ED   0001
        MVI@    R5,     R1                      ; 59EE   02A9
        PULR    R5                              ; 59EF   02B5
        MOVR    R1,     R7                      ; 59F0   008F

        PSHR    R5                              ; 59F1   0275

        JSR     R5,     L_55B9                  ; 59F2   0004 0154 01B9

        MVII    #$031D, R2                      ; 59F5   02BA 031D
        SDBD                                    ; 59F7   0001
        MVII    #$58C6, R1                      ; 59F8   02B9 00C6 0058

        JSR     R5,     X_INIT_MOB              ; 59FB   0004 0114 02B2

        SDBD                                    ; 59FE   0001
        MVII    #$5FA4, R2                      ; 59FF   02BA 00A4 005F
        MVO     R2,     G_0336                  ; 5A02   0242 0336
        MVO     R2,     G_033E                  ; 5A04   0242 033E
        MVII    #$0006, R0                      ; 5A06   02B8 0006

        JSR     R5,     .EXEC.A62               ; 5A08   0004 0118 0262

        MVII    #$0017, R0                      ; 5A0B   02B8 0017
        MVI     G_0336, R2                      ; 5A0D   0282 0336
        MVII    #$00D3, R3                      ; 5A0F   02BB 00D3
        MVII    #$030F, R4                      ; 5A11   02BC 030F
        COMR    R4                              ; 5A13   001C
        MVII    #$0335, R1                      ; 5A14   02B9 0335

        JSR     R5,     L_5581                  ; 5A16   0004 0154 0181

        MVII    #$033D, R1                      ; 5A19   02B9 033D

        JSR     R5,     L_5581                  ; 5A1B   0004 0154 0181

        MVII    #$000A, R0                      ; 5A1E   02B8 000A
        MVO     R0,     G_033B                  ; 5A20   0240 033B
        PULR    R7                              ; 5A22   02B7

        PSHR    R5                              ; 5A23   0275
        MVII    #$0001, R0                      ; 5A24   02B8 0001

        JSR     R5,     X_RAND1                 ; 5A26   0004 0114 027D

        MVII    #$003C, R2                      ; 5A29   02BA 003C
        SWAP    R2,     1                       ; 5A2B   0042
        TSTR    R0                              ; 5A2C   0080
        BEQ     L_5A30                          ; 5A2D   0204 0001

        NEGR    R2                              ; 5A2F   0022
L_5A30:
        MVO     R2,     G_0321                  ; 5A30   0242 0321
        MVII    #$0003, R0                      ; 5A32   02B8 0003
        MVO     R0,     G_033A                  ; 5A34   0240 033A
        MVO     R0,     G_0342                  ; 5A36   0240 0342
        PULR    R7                              ; 5A38   02B7

L_5A39:
        PSHR    R5                              ; 5A39   0275
        ADDI    #$0007, R1                      ; 5A3A   02F9 0007
        MVO@    R0,     R1                      ; 5A3C   0248
        SUBI    #$0007, R1                      ; 5A3D   0339 0007

        JSR     R5,     L_5A46                  ; 5A3F   0004 0158 0246

        XORI    #$0008, R5                      ; 5A42   03FD 0008
        MVO@    R5,     R1                      ; 5A44   024D
        PULR    R7                              ; 5A45   02B7

L_5A46:
        PSHR    R5                              ; 5A46   0275
        MVI@    R1,     R5                      ; 5A47   028D
        SDBD                                    ; 5A48   0001
        ANDI    #$FFF7, R5                      ; 5A49   03BD 00F7 00FF
        MVO@    R5,     R1                      ; 5A4C   024D
        PULR    R7                              ; 5A4D   02B7

L_5A4E:
        PSHR    R5                              ; 5A4E   0275
        MOVR    R3,     R0                      ; 5A4F   0098
        ANDI    #$0001, R0                      ; 5A50   03B8 0001
        XORI    #$0010, R0                      ; 5A52   03F8 0010
        MVO     R0,     G_0163                  ; 5A54   0240 0163
        SDBD                                    ; 5A56   0001
        MVII    #$5F8A, R0                      ; 5A57   02B8 008A 005F
        MVO     R0,     G_031E                  ; 5A5A   0240 031E
        MVII    #$031D, R1                      ; 5A5C   02B9 031D

        JSR     R5,     L_5A46                  ; 5A5E   0004 0158 0246

        CLRR    R0                              ; 5A61   01C0
        MVO     R0,     G_0323                  ; 5A62   0240 0323
        MVO     R0,     G_0321                  ; 5A64   0240 0321

        JSR     R5,     L_5569                  ; 5A66   0004 0154 0169
        JSR     R5,     .EXEC.766               ; 5A69   0004 0114 0366
        JSR     R5,     L_5723                  ; 5A6C   0004 0154 0323
        JSR     R5,     L_55C9                  ; 5A6F   0004 0154 01C9
        JSR     R5,     L_5925                  ; 5A72   0004 0158 0125
        JSR     R5,     L_5D14                  ; 5A75   0004 015C 0114
L_5A78:
        JSR     R5,     L_5081                  ; 5A78   0004 0150 0081

        PULR    R7                              ; 5A7B   02B7

        MOVR    R1,     R3                      ; 5A7C   008B
        SLLC    R2,     1                       ; 5A7D   005A
        MOVR    R1,     R3                      ; 5A7E   008B
        SLLC    R2,     1                       ; 5A7F   005A
        MOVR    R1,     R3                      ; 5A80   008B
        SLLC    R2,     1                       ; 5A81   005A
        MOVR    R1,     R3                      ; 5A82   008B
        SLLC    R2,     1                       ; 5A83   005A
        MOVR    R1,     R3                      ; 5A84   008B
        SLLC    R2,     1                       ; 5A85   005A
        MOVR    R7,     R0                      ; 5A86   00B8
        SUBI    #$000B, R0                      ; 5A87   0338 000B
        B       L_5934                          ; 5A89   0220 0156

        XOR     G_0163, R1                      ; 5A8B   03C1 0163
        ANDI    #$0001, R1                      ; 5A8D   03B9 0001
        BEQ     L_5936                          ; 5A8F   0224 015A

        PSHR    R5                              ; 5A91   0275

        JSR     R5,     L_55B9                  ; 5A92   0004 0154 01B9

        MVI     G_0163, R0                      ; 5A95   0280 0163
        ANDI    #$0001, R0                      ; 5A97   03B8 0001
        BNEQ    L_5AA2                          ; 5A99   020C 0007

        MVII    #$0002, R0                      ; 5A9B   02B8 0002
        MVII    #$0006, R3                      ; 5A9D   02BB 0006

        JSR     R5,     L_5723                  ; 5A9F   0004 0154 0323
L_5AA2:
        JSR     R5,     L_555E                  ; 5AA2   0004 0154 015E

        MVI@    R1,     R5                      ; 5AA5   028D
        XORI    #$0200, R5                      ; 5AA6   03FD 0200
        MVO@    R5,     R1                      ; 5AA8   024D
        ADDI    #$0012, R1                      ; 5AA9   02F9 0012
        MOVR    R1,     R4                      ; 5AAB   008C
        MVII    #$031F, R5                      ; 5AAC   02BD 031F
        MVI@    R4,     R0                      ; 5AAE   02A0
        ADDI    #$0300, R0                      ; 5AAF   02F8 0300
        MVO@    R0,     R5                      ; 5AB1   0268
        MVI@    R4,     R2                      ; 5AB2   02A2
        MVO@    R2,     R5                      ; 5AB3   026A
        MVII    #$003C, R3                      ; 5AB4   02BB 003C
        SWAP    R0,     1                       ; 5AB6   0040
        CMPI    #$0054, R0                      ; 5AB7   0378 0054
        BMI     L_5ABC                          ; 5AB9   020B 0001

        NEGR    R3                              ; 5ABB   0023
L_5ABC:
        MVO     R3,     G_0170                  ; 5ABC   0243 0170
        SDBD                                    ; 5ABE   0001
        MVII    #$5F63, R2                      ; 5ABF   02BA 0063 005F
        MVO     R2,     G_031E                  ; 5AC2   0242 031E
        DECR    R1                              ; 5AC4   0011
        SDBD                                    ; 5AC5   0001
        MVII    #$5FAB, R2                      ; 5AC6   02BA 00AB 005F
        MVO@    R2,     R1                      ; 5AC9   024A
        SUBI    #$0319, R1                      ; 5ACA   0339 0319
        MVO     R1,     G_0171                  ; 5ACC   0241 0171
        MVII    #$031D, R1                      ; 5ACE   02B9 031D

        JSR     R5,     L_5A46                  ; 5AD0   0004 0158 0246

        MVII    #$0006, R0                      ; 5AD3   02B8 0006

        JSR     R5,     .EXEC.A62               ; 5AD5   0004 0118 0262

        MVI     G_0170, R0                      ; 5AD8   0280 0170
        SWAP    R0,     1                       ; 5ADA   0040
        MVO     R0,     G_0321                  ; 5ADB   0240 0321
        MVI     G_0171, R1                      ; 5ADD   0281 0171
        ADDI    #$031D, R1                      ; 5ADF   02F9 031D
        MVII    #$0001, R0                      ; 5AE1   02B8 0001
        MVO@    R0,     R1                      ; 5AE3   0248
        PULR    R7                              ; 5AE4   02B7

L_5AE5:
        PSHR    R5                              ; 5AE5   0275
        MVII    #$031D, R1                      ; 5AE6   02B9 031D

        JSR     R5,     L_5A46                  ; 5AE8   0004 0158 0246

        CLRR    R0                              ; 5AEB   01C0
        MVO     R0,     G_031E                  ; 5AEC   0240 031E
        MVII    #$0321, R5                      ; 5AEE   02BD 0321
        MVO@    R0,     R5                      ; 5AF0   0268
        MVI     G_0163, R1                      ; 5AF1   0281 0163
        MVO@    R0,     R5                      ; 5AF3   0268
        MVO@    R0,     R5                      ; 5AF4   0268
        DECR    R0                              ; 5AF5   0010
        MVO     R0,     G_016F                  ; 5AF6   0240 016F
        MOVR    R1,     R2                      ; 5AF8   008A
        ANDI    #$00FD, R2                      ; 5AF9   03BA 00FD
        XORI    #$0002, R2                      ; 5AFB   03FA 0002
        MVO     R2,     G_0163                  ; 5AFD   0242 0163
        XOR     G_0162, R1                      ; 5AFF   03C1 0162
        ANDI    #$0001, R1                      ; 5B01   03B9 0001
        ANDI    #$0001, R2                      ; 5B03   03BA 0001
        MOVR    R7,     R0                      ; 5B05   00B8
        SUBI    #$0080, R0                      ; 5B06   0338 0080
        MOVR    R7,     R4                      ; 5B08   00BC
        SUBI    #$027D, R4                      ; 5B09   033C 027D
        TSTR    R1                              ; 5B0B   0089
        BEQ     L_5B10                          ; 5B0C   0204 0002

        ADDI    #$000E, R4                      ; 5B0E   02FC 000E
L_5B10:
        SLL     R2,     1                       ; 5B10   004A
        SUBR    R2,     R4                      ; 5B11   0114
        PULR    R5                              ; 5B12   02B5
        B       L_597C                          ; 5B13   0220 0198

        PSHR    R5                              ; 5B15   0275
        MVI     G_0163, R2                      ; 5B16   0282 0163
        ANDI    #$007D, R2                      ; 5B18   03BA 007D
        XORI    #$0002, R2                      ; 5B1A   03FA 0002
        MVO     R2,     G_0163                  ; 5B1C   0242 0163

        JSR     R5,     L_5B61                  ; 5B1E   0004 0158 0361

        MVII    #$031F, R4                      ; 5B21   02BC 031F
        MVII    #$0036, R3                      ; 5B23   02BB 0036

        JSR     R5,     .EXEC.784               ; 5B25   0004 0114 0384

        PSHR    R0                              ; 5B28   0270
        PSHR    R1                              ; 5B29   0271
        ADDI    #$0008, R1                      ; 5B2A   02F9 0008
        BPL     L_5B2F                          ; 5B2C   0203 0001

        NEGR    R1                              ; 5B2E   0021
L_5B2F:
        SLL     R1,     2                       ; 5B2F   004D
        SLR     R2,     1                       ; 5B30   0062
        ADDR    R2,     R1                      ; 5B31   00D1
        MVII    #$0028, R2                      ; 5B32   02BA 0028
        SDBD                                    ; 5B34   0001
        CMPI    #$0640, R1                      ; 5B35   0379 0040 0006
        BPL     L_5B3D                          ; 5B38   0203 0003

        JSR     R5,     X_SQRT                  ; 5B3A   0004 011C 0223

L_5B3D:
        MVO     R2,     G_0323                  ; 5B3D   0242 0323
        INCR    R2                              ; 5B3F   000A
        MOVR    R2,     R4                      ; 5B40   0094
        PULR    R1                              ; 5B41   02B1
        SLL     R1,     2                       ; 5B42   004D
        SLL     R1,     2                       ; 5B43   004D
        SLL     R1,     1                       ; 5B44   0049

        JSR     R5,     X_DIV                   ; 5B45   0004 011C 01FB

        MOVR    R4,     R1                      ; 5B48   00A1
        SLL     R1,     1                       ; 5B49   0049
        SUBR    R1,     R0                      ; 5B4A   0108
        PULR    R1                              ; 5B4B   02B1
        MOVR    R4,     R2                      ; 5B4C   00A2
        PSHR    R0                              ; 5B4D   0270
        SLL     R1,     2                       ; 5B4E   004D
        SLL     R1,     2                       ; 5B4F   004D
        SLL     R1,     1                       ; 5B50   0049

        JSR     R5,     X_DIV                   ; 5B51   0004 011C 01FB

        PULR    R1                              ; 5B54   02B1

        JSR     R5,     X_PACK_BYTES            ; 5B55   0004 0114 034F

        MVO     R0,     G_0321                  ; 5B58   0240 0321
        MOVR    R4,     R0                      ; 5B5A   00A0
        MVII    #$031D, R1                      ; 5B5B   02B9 031D

        JSR     R5,     L_5A39                  ; 5B5D   0004 0158 0239

L_5B60:
        PULR    R7                              ; 5B60   02B7

L_5B61:
        PSHR    R5                              ; 5B61   0275

        JSR     R5,     L_5B6C                  ; 5B62   0004 0158 036C

        ADDI    #$0002, R2                      ; 5B65   02FA 0002
        ADDR    R7,     R2                      ; 5B67   00FA
        MVI@    R2,     R2                      ; 5B68   0292
        PULR    R7                              ; 5B69   02B7

        DECLE   $001F                           ; 5B6A   001F

        MOVR    R1,     R7                      ; 5B6B   008F

L_5B6C:
        MVI     G_0163, R2                      ; 5B6C   0282 0163
        XOR     G_0162, R2                      ; 5B6E   03C2 0162
        ANDI    #$0001, R2                      ; 5B70   03BA 0001
        MOVR    R5,     R7                      ; 5B72   00AF

        DECLE   $0005,  $0005,  $0005           ; 5B73   0005 0005 0005

        DIS                                     ; 5B76   0003
        DIS                                     ; 5B77   0003
        DIS                                     ; 5B78   0003
        CLRC                                    ; 5B79   0006
        INCR    R0                              ; 5B7A   0008
        PSHR    R5                              ; 5B7B   0275
        CLRR    R5                              ; 5B7C   01ED
        MVO     R5,     G_016C                  ; 5B7D   0245 016C
        MVII    #$0165, R4                      ; 5B7F   02BC 0165
        MVI     G_0169, R1                      ; 5B81   0281 0169

        JSR     R5,     L_5B6C                  ; 5B83   0004 0158 036C

        SUBR    R2,     R1                      ; 5B86   0111
        ANDI    #$0007, R1                      ; 5B87   03B9 0007
        TSTR    R2                              ; 5B89   0092
        BNEQ    L_5B8F                          ; 5B8A   020C 0003

        NEGR    R1                              ; 5B8C   0021
        ADDI    #$0007, R1                      ; 5B8D   02F9 0007
L_5B8F:
        ADDR    R7,     R1                      ; 5B8F   00F9
        SUBI    #$001D, R1                      ; 5B90   0339 001D
        MVI@    R1,     R2                      ; 5B92   028A
        SDBD                                    ; 5B93   0001
        MVI@    R4,     R1                      ; 5B94   02A1

        JSR     R5,     X_DIV                   ; 5B95   0004 011C 01FB

        SLL     R0,     2                       ; 5B98   004C

        JSR     R5,     X_RAND2                 ; 5B99   0004 0114 029E

        SUBI    #$0014, R0                      ; 5B9C   0338 0014
        PSHR    R0                              ; 5B9E   0270
        MVI     G_016A, R0                      ; 5B9F   0280 016A

        JSR     R5,     X_RAND2                 ; 5BA1   0004 0114 029E

        CMP@    R6,     R0                      ; 5BA4   0370
        BMI     L_5BBE                          ; 5BA5   020B 0017

        MVII    #$0002, R0                      ; 5BA7   02B8 0002

        JSR     R5,     X_PLAY_CHEER1           ; 5BA9   0004 011C 02D5
        JSR     R5,     L_526B                  ; 5BAC   0004 0150 026B

        MVI     G_0163, R0                      ; 5BAF   0280 0163
        ANDI    #$0008, R0                      ; 5BB1   03B8 0008
        PULR    R5                              ; 5BB3   02B5
        BEQ     L_5BB9                          ; 5BB4   0204 0003
        J       L_5AE5                          ; 5BB6   0004 0358 02E5

L_5BB9:
        MVII    #$031D, R1                      ; 5BB9   02B9 031D
        J       .EXEC.7AE                       ; 5BBB   0004 0314 03AE

L_5BBE:
        MVI     G_0321, R0                      ; 5BBE   0280 0321
        PSHR    R0                              ; 5BC0   0270

        JSR     R5,     X_UNPK_BYTES            ; 5BC1   0004 0114 0357

        MVI     G_031F, R5                      ; 5BC4   0285 031F
        SDBD                                    ; 5BC6   0001
        SUBI    #$5800, R5                      ; 5BC7   033D 0000 0058
        XOR@    R6,     R5                      ; 5BCA   03F5
        BMI     L_5BCE                          ; 5BCB   020B 0001

        NEGR    R0                              ; 5BCD   0020

L_5BCE:
        JSR     R5,     X_PACK_BYTES            ; 5BCE   0004 0114 034F

        MVO     R0,     G_0321                  ; 5BD1   0240 0321
        MVII    #$0006, R0                      ; 5BD3   02B8 0006

        JSR     R5,     X_RAND2                 ; 5BD5   0004 0114 029E

        ADDI    #$000A, R0                      ; 5BD8   02F8 000A
        MOVR    R0,     R3                      ; 5BDA   0083

        JSR     R5,     L_5C51                  ; 5BDB   0004 015C 0051
        JSR     R5,     L_5CFB                  ; 5BDE   0004 015C 00FB

        PULR    R7                              ; 5BE1   02B7

        PSHR    R5                              ; 5BE2   0275

        JSR     R5,     L_5C12                  ; 5BE3   0004 015C 0012

        MVI     G_0323, R0                      ; 5BE6   0280 0323
        CMPI    #$000A, R0                      ; 5BE8   0378 000A
        BPL     L_5B60                          ; 5BEA   0223 008B

        JSR     R5,     L_5A4E                  ; 5BEC   0004 0158 024E

        PULR    R7                              ; 5BEF   02B7

        PSHR    R5                              ; 5BF0   0275

        JSR     R5,     L_5C12                  ; 5BF1   0004 015C 0012

        XOR     G_0163, R0                      ; 5BF4   03C0 0163
        ANDI    #$0001, R0                      ; 5BF6   03B8 0001
        BEQ     L_5C06                          ; 5BF8   0204 000C

        MVII    #$000A, R0                      ; 5BFA   02B8 000A

        JSR     R5,     X_RAND2                 ; 5BFC   0004 0114 029E

        ADDI    #$0006, R0                      ; 5BFF   02F8 0006
        CMP     G_0324, R0                      ; 5C01   0340 0324
        BMI     L_5C0A                          ; 5C03   020B 0005

        CLRR    R3                              ; 5C05   01DB
L_5C06:
        CMPI    #$0003, R3                      ; 5C06   037B 0003
        BMI     L_5B60                          ; 5C08   022B 00A9

L_5C0A:
        JSR     R5,     L_5A4E                  ; 5C0A   0004 0158 024E

        MVII    #$00FF, R0                      ; 5C0D   02B8 00FF
        MVO     R0,     G_016F                  ; 5C0F   0240 016F
        PULR    R7                              ; 5C11   02B7

L_5C12:
        PSHR    R5                              ; 5C12   0275
        MOVR    R3,     R0                      ; 5C13   0098

        JSR     R5,     .EXEC.772               ; 5C14   0004 0114 0372

        MVI     G_0320, R2                      ; 5C17   0282 0320
        SWAP    R2,     1                       ; 5C19   0042
        ANDI    #$00FF, R2                      ; 5C1A   03BA 00FF
        SUBR    R3,     R2                      ; 5C1C   011A
        CMPI    #$000A, R2                      ; 5C1D   037A 000A
        BMI     L_5C22                          ; 5C1F   020B 0001

        PULR    R5                              ; 5C21   02B5
L_5C22:
        MOVR    R0,     R3                      ; 5C22   0083
        PULR    R7                              ; 5C23   02B7

        PSHR    R5                              ; 5C24   0275

        JSR     R5,     L_5081                  ; 5C25   0004 0150 0081

        MVII    #$000B, R3                      ; 5C28   02BB 000B
        B       L_5C71                          ; 5C2A   0200 0045

        PSHR    R5                              ; 5C2C   0275

        JSR     R5,     .EXEC.772               ; 5C2D   0004 0114 0372

        CMPI    #$0060, R3                      ; 5C30   037B 0060
        BPL     L_5C43                          ; 5C32   0203 000F

        CMPI    #$003E, R3                      ; 5C34   037B 003E
        BMI     L_5C43                          ; 5C36   020B 000B

        SUBI    #$004A, R2                      ; 5C38   033A 004A
        CMPR    R2,     R3                      ; 5C3A   0153
        BLE     L_5C43                          ; 5C3B   0206 0006

        NEGR    R2                              ; 5C3D   0022
        ADDI    #$0019, R2                      ; 5C3E   02FA 0019
        CMPR    R2,     R3                      ; 5C40   0153
        BGE     L_5C4F                          ; 5C41   020D 000C

L_5C43:
        MVI     G_0172, R0                      ; 5C43   0280 0172
        TSTR    R0                              ; 5C45   0080
        BNEQ    L_5C4F                          ; 5C46   020C 0007

        JSR     R5,     L_5AE5                  ; 5C48   0004 0158 02E5
        JSR     R5,     X_PLAY_WHST1            ; 5C4B   0004 011C 031B

        PULR    R7                              ; 5C4E   02B7

L_5C4F:
        CLRR    R3                              ; 5C4F   01DB
        INCR    R7                              ; 5C50   000F

L_5C51:
        PSHR    R5                              ; 5C51   0275
L_5C52:
        PSHR    R3                              ; 5C52   0273

        JSR     R5,     L_5CED                  ; 5C53   0004 015C 00ED

        PULR    R3                              ; 5C56   02B3
        MVI     G_0163, R0                      ; 5C57   0280 0163
        ANDI    #$00F3, R0                      ; 5C59   03B8 00F3
        XORI    #$0004, R0                      ; 5C5B   03F8 0004
        MVO     R0,     G_0163                  ; 5C5D   0240 0163
        MVI     G_0321, R0                      ; 5C5F   0280 0321

        JSR     R5,     X_UNPK_BYTES            ; 5C61   0004 0114 0357

        MVII    #$00D8, R1                      ; 5C64   02B9 00D8
        TSTR    R3                              ; 5C66   009B
        BNEQ    L_5C6A                          ; 5C67   020C 0001

        SLR     R0,     1                       ; 5C69   0060

L_5C6A:
        JSR     R5,     X_PACK_BYTES            ; 5C6A   0004 0114 034F

        MVO     R0,     G_0321                  ; 5C6D   0240 0321
        ADDI    #$0015, R3                      ; 5C6F   02FB 0015
L_5C71:
        MVO     R3,     G_0323                  ; 5C71   0243 0323
        CLRR    R0                              ; 5C73   01C0
        MVII    #$031D, R1                      ; 5C74   02B9 031D

        JSR     R5,     L_5A39                  ; 5C76   0004 0158 0239

        SDBD                                    ; 5C79   0001
        MVII    #$5F77, R2                      ; 5C7A   02BA 0077 005F
L_5C7D:
        MVO     R2,     G_031E                  ; 5C7D   0242 031E
        PULR    R7                              ; 5C7F   02B7

        PSHR    R5                              ; 5C80   0275
        MVI     G_0163, R0                      ; 5C81   0280 0163
        MOVR    R0,     R2                      ; 5C83   0082
        ANDI    #$0008, R0                      ; 5C84   03B8 0008
        BEQ     L_5B60                          ; 5C86   0224 0127

        ANDI    #$0002, R2                      ; 5C88   03BA 0002
        BEQ     L_5B60                          ; 5C8A   0224 012B

        CMPI    #$0335, R1                      ; 5C8C   0379 0335
        BPL     L_5CA2                          ; 5C8E   0203 0012

        MVI     G_0164, R0                      ; 5C90   0280 0164
        SARC    R0,     1                       ; 5C92   0078
        BC      L_5B60                          ; 5C93   0221 0134

        ADDI    #$0008, R0                      ; 5C95   02F8 0008
        ANDI    #$000F, R0                      ; 5C97   03B8 000F
        SUB     G_0169, R0                      ; 5C99   0300 0169
        BPL     L_5C9E                          ; 5C9B   0203 0001

        NEGR    R0                              ; 5C9D   0020
L_5C9E:
        CMPI    #$0002, R0                      ; 5C9E   0378 0002
        BPL     L_5B60                          ; 5CA0   0223 0141

L_5CA2:
        CLRR    R0                              ; 5CA2   01C0
        MVO     R0,     G_0321                  ; 5CA3   0240 0321
        MVO     R0,     G_0323                  ; 5CA5   0240 0323
        MVI     G_0163, R0                      ; 5CA7   0280 0163
        ANDI    #$005D, R0                      ; 5CA9   03B8 005D
        XORI    #$0081, R0                      ; 5CAB   03F8 0081
        MVO     R0,     G_0163                  ; 5CAD   0240 0163
        ADDI    #$0006, R1                      ; 5CAF   02F9 0006
        MVII    #$0001, R0                      ; 5CB1   02B8 0001
        MVO@    R0,     R1                      ; 5CB3   0248
        MVII    #$031D, R1                      ; 5CB4   02B9 031D

        JSR     R5,     L_5A46                  ; 5CB6   0004 0158 0246
        JSR     R5,     L_5D14                  ; 5CB9   0004 015C 0114

        SDBD                                    ; 5CBC   0001
        MVII    #$5F8A, R2                      ; 5CBD   02BA 008A 005F
        B       L_5C7D                          ; 5CC0   0220 0044

        PSHR    R5                              ; 5CC2   0275
        MVI     G_016C, R0                      ; 5CC3   0280 016C
        TSTR    R0                              ; 5CC5   0080
        BEQ     L_5CE3                          ; 5CC6   0204 001B

        JSR     R5,     .EXEC.766               ; 5CC8   0004 0114 0366

        MOVR    R0,     R3                      ; 5CCB   0083

        JSR     R5,     L_5569                  ; 5CCC   0004 0154 0169

        PSHR    R1                              ; 5CCF   0271

        JSR     R5,     .EXEC.766               ; 5CD0   0004 0114 0366
        JSR     R5,     L_5723                  ; 5CD3   0004 0154 0323
        JSR     R5,     L_55D4                  ; 5CD6   0004 0154 01D4

        PULR    R1                              ; 5CD9   02B1
        ADDI    #$0007, R1                      ; 5CDA   02F9 0007
        MVI@    R1,     R0                      ; 5CDC   0288
        DECR    R1                              ; 5CDD   0011
        MVO@    R0,     R1                      ; 5CDE   0248
        CLRR    R0                              ; 5CDF   01C0
        MVO     R0,     G_016C                  ; 5CE0   0240 016C
        PULR    R7                              ; 5CE2   02B7

L_5CE3:
        MVI     G_0163, R0                      ; 5CE3   0280 0163
        ANDI    #$0077, R0                      ; 5CE5   03B8 0077
        MVO     R0,     G_0163                  ; 5CE7   0240 0163

        JSR     R5,     L_5925                  ; 5CE9   0004 0158 0125

        PULR    R7                              ; 5CEC   02B7

L_5CED:
        PSHR    R5                              ; 5CED   0275

        JSR     R5,     X_PLAY_SFX1             ; 5CEE   0004 0118 03BB
        DECLE   $0048,  $0328                   ; 5CF1  SFX data
        DECLE   $001B                           ; 5CF3  SFX data
        DECLE   $0040,  $0340                   ; 5CF4  SFX data
        DECLE   $03C9                           ; 5CF6  SFX data
        DECLE   $000C,  $0108                   ; 5CF7  SFX data
        DECLE   $000B                           ; 5CF9  SFX data
        DECLE   $03CF                           ; 5CFA  SFX end

L_5CFB:
        PSHR    R5                              ; 5CFB   0275

        JSR     R5,     X_PLAY_SFX1             ; 5CFC   0004 0118 03BB
        DECLE   $0389                           ; 5CFF  SFX data
        DECLE   $006C,  $0000                   ; 5D00  SFX data
        DECLE   $0050,  $0100                   ; 5D02  SFX data
        DECLE   $0058,  $010C                   ; 5D04  SFX data
        DECLE   $005B                           ; 5D06  SFX data
        DECLE   $0044,  $0100                   ; 5D07  SFX data
        DECLE   $0001,  $03A0                   ; 5D09  SFX data
        DECLE   $0001,  $03B2                   ; 5D0B  SFX data
        DECLE   $0001,  $03F1                   ; 5D0D  SFX data
        DECLE   $000B                           ; 5D0F  SFX data
        DECLE   $02EB                           ; 5D10  SFX data
        DECLE   $0001,  $0003                   ; 5D11  SFX data
        DECLE   $03CF                           ; 5D13  SFX end

L_5D14:
        PSHR    R5                              ; 5D14   0275
        MVI     G_0163, R0                      ; 5D15   0280 0163
        ANDI    #$0001, R0                      ; 5D17   03B8 0001

        JSR     R5,     X_PLAY_SFX1             ; 5D19   0004 0118 03BB
        DECLE   $0280,  $00C0                   ; 5D1C  SFX data
        DECLE   $0003,  $0008                   ; 5D1E  SFX data
        DECLE   $02C0,  $01C0                   ; 5D20  SFX data
        DECLE   $03E9                           ; 5D22  SFX data
        DECLE   $006B                           ; 5D23  SFX data
        DECLE   $02CF                           ; 5D24  SFX end

        DECLE   $0000,  $0000,  $0006,  $0006   ; 5D25   0000 0000 0006 0006
        DECLE   $000C,  $000C,  $000C,  $0000   ; 5D29   000C 000C 000C 0000
        DECLE   $000C,  $000C,  $000C,  $003C   ; 5D2D   000C 000C 000C 003C
        DECLE   $0028,  $0028,  $0008,  $000C   ; 5D31   0028 0028 0008 000C
        DECLE   $0000,  $0000,  $000C,  $000C   ; 5D35   0000 0000 000C 000C
        DECLE   $0038,  $0038,  $003C,  $0000   ; 5D39   0038 0038 003C 0000
        DECLE   $001C,  $003E,  $0022,  $002E   ; 5D3D   001C 003E 0022 002E
        DECLE   $0028,  $0020,  $0020,  $0010   ; 5D41   0028 0020 0020 0010
        DECLE   $0000,  $0000                   ; 5D45   0000 0000

        CLRC                                    ; 5D47   0006
        CLRC                                    ; 5D48   0006
        COMR    R4                              ; 5D49   001C
        RSWD    R4                              ; 5D4A   003C
        ADCR    R7                              ; 5D4B   002F

        NEGR    R0                              ; 5D4C   0020
L_5D4D:
        COMR    R4                              ; 5D4D   001C
        DECLE   $003F,  $0021,  $0027,  $0024   ; 5D4E   003F 0021 0027 0024
        DECLE   $0044,  $0040,  $0040,  $0000   ; 5D52   0044 0040 0040 0000
        DECLE   $0000,  $000C,  $000C,  $0078   ; 5D56   0000 000C 000C 0078
        DECLE   $0058,  $005F,  $0000,  $0018   ; 5D5A   0058 005F 0000 0018
        DECLE   $003F,  $0021,  $0062,  $0042   ; 5D5E   003F 0021 0062 0042
        DECLE   $00C0,  $0080,  $0080,  $0000   ; 5D62   00C0 0080 0080 0000
        DECLE   $0000                           ; 5D66   0000

        INCR    R4                              ; 5D67   000C
        INCR    R4                              ; 5D68   000C
        ADDR    R7,     R0                      ; 5D69   00F8
        MOVR    R3,     R7                      ; 5D6A   009F

        DECLE   $0018,  $0000,  $0018,  $003F   ; 5D6B   0018 0000 0018 003F
        DECLE   $0021,  $0061,  $0040,  $00C0   ; 5D6F   0021 0061 0040 00C0
        DECLE   $0080,  $0000,  $0000,  $0000   ; 5D73   0080 0000 0000 0000
        DECLE   $000C,  $000C,  $0078,  $0058   ; 5D77   000C 000C 0078 0058
        DECLE   $005F,  $0000,  $0018,  $003C   ; 5D7B   005F 0000 0018 003C
        DECLE   $0024,  $0066,  $00C2,  $0082   ; 5D7F   0024 0066 00C2 0082
        DECLE   $0003,  $0000,  $0000,  $0000   ; 5D83   0003 0000 0000 0000
        DECLE   $000C,  $000C,  $0038,  $0078   ; 5D87   000C 000C 0038 0078
        DECLE   $005E,  $0040,  $0038,  $003C   ; 5D8B   005E 0040 0038 003C
        DECLE   $0024,  $00E4,  $0084,  $0084   ; 5D8F   0024 00E4 0084 0084
        DECLE   $0004,  $0006,  $0000,  $0000   ; 5D93   0004 0006 0000 0000
        DECLE   $000C,  $000C,  $0038,  $0038   ; 5D97   000C 000C 0038 0038
        DECLE   $003C,  $0000,  $0018,  $0018   ; 5D9B   003C 0000 0018 0018
        DECLE   $0018,  $0078,  $0048,  $0048   ; 5D9F   0018 0078 0048 0048
        DECLE   $0008,  $000C,  $0000,  $0000   ; 5DA3   0008 000C 0000 0000
        DECLE   $0018,  $0018,  $0078,  $0074   ; 5DA7   0018 0018 0078 0074
        DECLE   $00B3,  $0080,  $0038,  $0038   ; 5DAB   00B3 0080 0038 0038
        DECLE   $0024,  $0014,  $0012,  $0012   ; 5DAF   0024 0014 0012 0012
        DECLE   $0024,  $0036,  $0040,  $00A0   ; 5DB3   0024 0036 0040 00A0
        DECLE   $0040,  $0000,  $0000,  $0000   ; 5DB7   0040 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DBB   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $00A0,  $0040   ; 5DBF   0000 0040 00A0 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DC3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; 5DC7   0000 0000 0000 0040
        DECLE   $00A0,  $0040,  $0000,  $0000   ; 5DCB   00A0 0040 0000 0000
        DECLE   $0040,  $00A0,  $0040,  $0000   ; 5DCF   0040 00A0 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5DD3   0000 0000 0000 0001
        DECLE   $0099,  $0099,  $00F2,  $0034   ; 5DD7   0099 0099 00F2 0034
        DECLE   $0030,  $0000,  $0038,  $0024   ; 5DDB   0030 0000 0038 0024
        DECLE   $0012,  $0011,  $0011,  $0022   ; 5DDF   0012 0011 0011 0022
        DECLE   $0044,  $0066,  $0000,  $0001   ; 5DE3   0044 0066 0000 0001
        DECLE   $0099,  $0099,  $00F2,  $0034   ; 5DE7   0099 0099 00F2 0034
        DECLE   $0030,  $0000,  $0038,  $0028   ; 5DEB   0030 0000 0038 0028
        DECLE   $0014,  $0014,  $0014,  $0028   ; 5DEF   0014 0014 0014 0028
        DECLE   $0048,  $006C,  $0000,  $0000   ; 5DF3   0048 006C 0000 0000
        DECLE   $0000,  $0006,  $000E,  $0018   ; 5DF7   0000 0006 000E 0018
        DECLE   $0038,  $000E,  $0030,  $0030   ; 5DFB   0038 000E 0030 0030
        DECLE   $0010,  $0008,  $0008,  $0010   ; 5DFF   0010 0008 0008 0010
        DECLE   $0010,  $0018,  $0000,  $0000   ; 5E03   0010 0018 0000 0000
        DECLE   $0000,  $0006,  $000E,  $0018   ; 5E07   0000 0006 000E 0018
        DECLE   $0038,  $0008,  $0036,  $0030   ; 5E0B   0038 0008 0036 0030
        DECLE   $0010,  $0008,  $0008,  $0010   ; 5E0F   0010 0008 0008 0010
        DECLE   $0010,  $0018,  $0000,  $0000   ; 5E13   0010 0018 0000 0000
        DECLE   $0000,  $0006,  $000E,  $0018   ; 5E17   0000 0006 000E 0018
        DECLE   $0038,  $0008,  $0036,  $0032   ; 5E1B   0038 0008 0036 0032
        DECLE   $0010,  $0008,  $0008,  $0010   ; 5E1F   0010 0008 0008 0010
        DECLE   $0010,  $0018,  $0000,  $0000   ; 5E23   0010 0018 0000 0000
        DECLE   $0000,  $0006,  $000E,  $0018   ; 5E27   0000 0006 000E 0018
        DECLE   $0038,  $0008,  $0036,  $0030   ; 5E2B   0038 0008 0036 0030
        DECLE   $0010,  $0008,  $0008,  $0010   ; 5E2F   0010 0008 0008 0010
        DECLE   $0010,  $0018,  $0000,  $0000   ; 5E33   0010 0018 0000 0000
        DECLE   $0018,  $0018,  $0031,  $003A   ; 5E37   0018 0018 0031 003A
        DECLE   $0034,  $0000,  $0030,  $0030   ; 5E3B   0034 0000 0030 0030
        DECLE   $0010,  $0008,  $0008,  $0010   ; 5E3F   0010 0008 0008 0010
        DECLE   $0010,  $0018,  $0000,  $0000   ; 5E43   0010 0018 0000 0000
        DECLE   $0030,  $0032,  $0022,  $003C   ; 5E47   0030 0032 0022 003C
        DECLE   $0030,  $0000,  $0030,  $0030   ; 5E4B   0030 0000 0030 0030
        DECLE   $0010,  $0008,  $0008,  $0010   ; 5E4F   0010 0008 0008 0010
        DECLE   $0010,  $0018,  $0000,  $0000   ; 5E53   0010 0018 0000 0000
        DECLE   $0064,  $0064,  $003C,  $0030   ; 5E57   0064 0064 003C 0030
        DECLE   $0030,  $0000,  $0030,  $0030   ; 5E5B   0030 0000 0030 0030
        DECLE   $0010,  $0010,  $0020,  $0020   ; 5E5F   0010 0010 0020 0020
        DECLE   $0020,  $0030,  $0000,  $0008   ; 5E63   0020 0030 0000 0008
        DECLE   $0064,  $0062,  $003C,  $0030   ; 5E67   0064 0062 003C 0030
        DECLE   $0030,  $0000,  $0030,  $0030   ; 5E6B   0030 0000 0030 0030
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5E6F   0010 0010 0010 0010
        DECLE   $0010,  $0018,  $0000,  $0006   ; 5E73   0010 0018 0000 0006
        DECLE   $0064,  $0064,  $003C,  $0030   ; 5E77   0064 0064 003C 0030
        DECLE   $0030,  $0000,  $0030,  $0030   ; 5E7B   0030 0000 0030 0030
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5E7F   0010 0010 0010 0010
        DECLE   $0010,  $0018,  $0000,  $0000   ; 5E83   0010 0018 0000 0000
        DECLE   $0018,  $0018,  $0031,  $003A   ; 5E87   0018 0018 0031 003A
        DECLE   $0034,  $0000,  $0030,  $0030   ; 5E8B   0034 0000 0030 0030
        DECLE   $0008,  $0004,  $0004,  $0008   ; 5E8F   0008 0004 0004 0008
        DECLE   $001C,  $0000,  $0000,  $0000   ; 5E93   001C 0000 0000 0000
        DECLE   $0030,  $0032,  $0032,  $003C   ; 5E97   0030 0032 0032 003C
        DECLE   $0030,  $0000,  $0030,  $0030   ; 5E9B   0030 0000 0030 0030
        DECLE   $0010,  $0010,  $0010,  $0020   ; 5E9F   0010 0010 0010 0020
        DECLE   $0020,  $0010,  $0000,  $0000   ; 5EA3   0020 0010 0000 0000
        DECLE   $0064,  $0064,  $003C,  $0030   ; 5EA7   0064 0064 003C 0030
        DECLE   $0030,  $0000,  $0030,  $003C   ; 5EAB   0030 0000 0030 003C
        DECLE   $0006,  $0004,  $0008,  $0008   ; 5EAF   0006 0004 0008 0008
        DECLE   $0000,  $0000,  $0000,  $0008   ; 5EB3   0000 0000 0000 0008
        DECLE   $0064,  $0062,  $003C,  $0030   ; 5EB7   0064 0062 003C 0030
        DECLE   $0030,  $0000,  $0030,  $0018   ; 5EBB   0030 0000 0030 0018
        DECLE   $000C,  $0004,  $003C,  $0020   ; 5EBF   000C 0004 003C 0020
        DECLE   $0000,  $0000,  $0000,  $0006   ; 5EC3   0000 0000 0000 0006
        DECLE   $0064,  $0064,  $003C,  $0030   ; 5EC7   0064 0064 003C 0030
        DECLE   $0030,  $0000,  $0030,  $0030   ; 5ECB   0030 0000 0030 0030
        DECLE   $0010,  $0010,  $0008,  $0008   ; 5ECF   0010 0010 0008 0008
        DECLE   $0006,  $0000,  $0000,  $0006   ; 5ED3   0006 0000 0000 0006
        DECLE   $0064,  $0064,  $003C,  $0030   ; 5ED7   0064 0064 003C 0030
        DECLE   $0030,  $0000,  $0030,  $0030   ; 5EDB   0030 0000 0030 0030
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5EDF   0010 0010 0010 0010
        DECLE   $0010,  $0018,  $0000,  $0000   ; 5EE3   0010 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EE7   0000 0000 0000 0000
        DECLE   $0018,  $00DB,  $00A4,  $003C   ; 5EEB   0018 00DB 00A4 003C
        DECLE   $0000,  $007E,  $0086,  $0062   ; 5EEF   0000 007E 0086 0062
        DECLE   $0012,  $0063,  $0000,  $0000   ; 5EF3   0012 0063 0000 0000
        DECLE   $0000,  $0018,  $0019,  $007F   ; 5EF7   0000 0018 0019 007F
        DECLE   $0058,  $0058,  $0000,  $001C   ; 5EFB   0058 0058 0000 001C
        DECLE   $0014,  $0022,  $0022,  $0022   ; 5EFF   0014 0022 0022 0022
        DECLE   $0024,  $0066,  $0000,  $0000   ; 5F03   0024 0066 0000 0000
        DECLE   $001A,  $0002,  $003C,  $0058   ; 5F07   001A 0002 003C 0058
        DECLE   $0058,  $0000,  $0038,  $0024   ; 5F0B   0058 0000 0038 0024
        DECLE   $0024,  $0024,  $0024,  $0028   ; 5F0F   0024 0024 0024 0028
        DECLE   $0008,  $000C,  $0001           ; 5F13   0008 000C 0001

        EIS                                     ; 5F16   0002
        EIS                                     ; 5F17   0002
        COMR    R2                              ; 5F18   001A

        JSR     R4,     .EXEC.C2C               ; 5F19   0004 001C 002C
        DECLE   $0044,  $0088,  $003C,  $0024   ; 5F1C   0044 0088 003C 0024
        DECLE   $0024,  $0064,  $0008,  $0008   ; 5F20   0024 0064 0008 0008
        DECLE   $000C,  $0021,  $0021,  $005A   ; 5F24   000C 0021 0021 005A
        DECLE   $005C,  $0038,  $0018,  $0018   ; 5F28   005C 0038 0018 0018
        DECLE   $0000,  $0018,  $0018,  $0028   ; 5F2C   0000 0018 0018 0028
        DECLE   $0028,  $0028,  $0050,  $0050   ; 5F30   0028 0028 0050 0050
        DECLE   $0028,  $0048,  $0084,  $00B4   ; 5F34   0028 0048 0084 00B4
        DECLE   $00B4,  $00FC,  $0030,  $0030   ; 5F38   00B4 00FC 0030 0030
        DECLE   $0000,  $0038,  $0028,  $0024   ; 5F3C   0000 0038 0028 0024
        DECLE   $0022,  $0022,  $0024,  $0024   ; 5F40   0022 0022 0024 0024
        DECLE   $0026,  $0000,  $0080,  $00B0   ; 5F44   0026 0000 0080 00B0
        DECLE   $00B0,  $00FC,  $0032,  $0031   ; 5F48   00B0 00FC 0032 0031
        DECLE   $0000,  $0038,  $0028,  $0024   ; 5F4C   0000 0038 0028 0024
        DECLE   $0022,  $0022,  $0024,  $0024   ; 5F50   0022 0022 0024 0024
        DECLE   $0026,  $0100,  $0000,  $0000   ; 5F54   0026 0100 0000 0000
        DECLE   $0000                           ; 5F58   0000

        JSRD    R4,     .EXEC.800               ; 5F59   0004 001A 0000
        DECLE   $0100,  $0000,  $0000,  $0000   ; 5F5C   0100 0000 0000 0000

        JSRD    R4,     X_RESET                 ; 5F60   0004 0012 0000
        DECLE   $0100,  $0000,  $0000,  $0000   ; 5F63   0100 0000 0000 0000
        DECLE   $0001,  $0012,  $0004,  $004E   ; 5F67   0001 0012 0004 004E
        DECLE   $015A,  $024E,  $005A,  $0100   ; 5F6B   015A 024E 005A 0100
        DECLE   $0000,  $00C2,  $005C,  $0001   ; 5F6F   0000 00C2 005C 0001
        DECLE   $0040,  $0002,  $0080,  $005C   ; 5F73   0040 0002 0080 005C
        DECLE   $0100,  $0000,  $002C,  $005C   ; 5F77   0100 0000 002C 005C
        DECLE   $0001,  $0012,  $000C,  $00E2   ; 5F7B   0001 0012 000C 00E2
        DECLE   $015B,  $02E2,  $005B,  $02E2   ; 5F7F   015B 02E2 005B 02E2
        DECLE   $015B,  $01E2,  $005B,  $01E2   ; 5F83   015B 01E2 005B 01E2
        DECLE   $015B,  $03E2,  $005B,  $0100   ; 5F87   015B 03E2 005B 0100
        DECLE   $0000,  $007B,  $005B,  $0001   ; 5F8B   0000 007B 005B 0001
        DECLE   $0012,  $0000,  $0300,  $0000   ; 5F8F   0012 0000 0300 0000
        DECLE   $0000,  $0000,  $0002,  $0016   ; 5F93   0000 0000 0002 0016
        DECLE   $000C,  $00AD,  $0156,  $02AD   ; 5F97   000C 00AD 0156 02AD
        DECLE   $0056,  $02AD,  $0156,  $01AD   ; 5F9B   0056 02AD 0156 01AD
        DECLE   $0056,  $01AD,  $0156,  $03AD   ; 5F9F   0056 01AD 0156 03AD
        DECLE   $0056,  $0300,  $0000,  $0023   ; 5FA3   0056 0300 0000 0023
        DECLE   $005A,  $0004,  $0038,  $0000   ; 5FA7   005A 0004 0038 0000
        DECLE   $0100,  $0000,  $0000,  $0000   ; 5FAB   0100 0000 0000 0000
        DECLE   $0002,  $0042,  $0000,  $0100   ; 5FAF   0002 0042 0000 0100
        DECLE   $0000,  $00B7,  $0059,  $0008   ; 5FB3   0000 00B7 0059 0008
        DECLE   $0000,  $0000,  $0100,  $0000   ; 5FB7   0000 0000 0100 0000
        DECLE   $0000,  $0000,  $0001,  $0010   ; 5FBB   0000 0000 0001 0010
        DECLE   $0000,  $0100,  $0000,  $0015   ; 5FBF   0000 0100 0000 0015
        DECLE   $005B,  $0005,  $0022,  $0000   ; 5FC3   005B 0005 0022 0000
        DECLE   $0100,  $0000,  $0015,  $005B   ; 5FC7   0100 0000 0015 005B
        DECLE   $0006,  $002C,  $0000,  $0300   ; 5FCB   0006 002C 0000 0300
        DECLE   $0000,  $0000,  $0000,  $0008   ; 5FCF   0000 0000 0000 0008
        DECLE   $0000,  $000C,  $00AD,  $0156   ; 5FD3   0000 000C 00AD 0156
        DECLE   $02AD,  $0056,  $02AD,  $0156   ; 5FD7   02AD 0056 02AD 0156
        DECLE   $01AD,  $0056,  $01AD,  $0156   ; 5FDB   01AD 0056 01AD 0156
        DECLE   $03AD,  $0056,  $0100,  $0000   ; 5FDF   03AD 0056 0100 0000
        DECLE   $0024,  $005C,  $0001           ; 5FE3   0024 005C 0001

        DECR    R2                              ; 5FE6   0012
        INCR    R4                              ; 5FE7   000C
        ADDR    R6,     R0                      ; 5FE8   00F0
        CMPR    R3,     R3                      ; 5FE9   015B
        ADD@    R6,     R0                      ; 5FEA   02F0
        SLLC    R3,     1                       ; 5FEB   005B
        ADD@    R6,     R0                      ; 5FEC   02F0
        CMPR    R3,     R3                      ; 5FED   015B
        XORR    R6,     R0                      ; 5FEE   01F0
        SLLC    R3,     1                       ; 5FEF   005B
        XORR    R6,     R0                      ; 5FF0   01F0
        CMPR    R3,     R3                      ; 5FF1   015B
        XOR@    R6,     R0                      ; 5FF2   03F0
        SLLC    R3,     1                       ; 5FF3   005B
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFC   0000 0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5043       <entry>
;;  $5063       <entry>
;;  $5074       <entry>
;;  $5078       $54A7  
;;  $5079       $5077  
;;  $5081       $5A78   $5C25  
;;  $5087       $590C   $595C   $59B3  
;;  $508F       $5551  
;;  $5095       $592D  
;;  $5168       $5140  
;;  $517E       $5156  
;;  $518A       $5059  
;;  $518E       $5146  
;;  $5191       $51BD  
;;  $5193       $519E  
;;  $5194       $516C  
;;  $51A5       $51B6  
;;  $51B0       $51AC  
;;  $51E0       $5199   $51B1  
;;  $51EC       $51EF  
;;  $51ED       $51EB  
;;  $51F2       $5194   $51A8  
;;  $51FF       <entry>
;;  $520A       $5206  
;;  $5212       $5252   $5906  
;;  $5213       $5211  
;;  $5223       $5240  
;;  $5224       $5222  
;;  $522F       $5228  
;;  $5233       <entry>
;;  $523A       $525F   $592A  
;;  $5242       $520E   $524F   $5903  
;;  $524E       $520B  
;;  $525E       $5238  
;;  $526B       $5BAC  
;;  $5275       $505C  
;;  $5289       <entry>
;;  $528C       $5184  
;;  $5296       $529F  
;;  $52A2       $5290  
;;  $52A6       $52AF  
;;  $52B1       $528E   $534B  
;;  $52C4       $5299  
;;  $52D9       $52D4  
;;  $52DC       $5317  
;;  $52DD       $52E3  
;;  $52E6       $52DA  
;;  $52F1       $52EE  
;;  $52F5       $52F2  
;;  $52FD       $52F7  
;;  $5305       $52FB  
;;  $5311       $5309  
;;  $5319       $530E  
;;  $531A       $5303  
;;  $5322       $52E8   $54B6  
;;  $5337       $5328  
;;  $5345       $5340  
;;  $5347       $52A9  
;;  $5384       $5380  
;;  $538A       $5386   $539D  
;;  $538D       $53CE  
;;  $5390       $53BB  
;;  $5391       $53E8  
;;  $5397       $537C  
;;  $539F       $5399  
;;  $53B9       $53B0  
;;  $53BA       $5370   $53A3  
;;  $53BD       $5360  
;;  $53D8       $5365  
;;  $53EA       $5356  
;;  $53F5       $5362  
;;  $5408       $53FB   $53FE   $5401   $5404  
;;  $5409       $5407  
;;  $540B       $53F7  
;;  $5420       $59B0  
;;  $542D       $506A  
;;  $543B       $506D  
;;  $544A       $5439  
;;  $545A       $5453  
;;  $545B       $5459  
;;  $5481       $547D  
;;  $549D       $549A  
;;  $54B0       $5474   $548E   $5494  
;;  $54C6       $5462   $5467  
;;  $54CF       $54CB  
;;  $552E       $5518  
;;  $5550       $554C  
;;  $5558       $54AE  
;;  $555E       $52A3   $5443   $54DB   $5AA2  
;;  $5563       $546F   $5501   $551A  
;;  $5569       $5293   $5436   $55F9   $56BD   $5A66   $5CCC  
;;  $556E       $5561  
;;  $5578       $53B5   $54E3  
;;  $5581       $5511   $5A16   $5A1B  
;;  $5586       $5527  
;;  $5596       $5300   $538D  
;;  $5597       $5456  
;;  $55AB       $55A0  
;;  $55B9       $5429   $59F2   $5A92  
;;  $55C9       $5A6F  
;;  $55D4       $5CD6  
;;  $55DF       $55C7   $55D5  
;;  $55E6       $55DD  
;;  $55E8       $55F5  
;;  $55F7       $5433   $5441   $546D   $5472   $54E1   $5504   $551D   $5567  
;;  $55F8       $5064  
;;  $561A       $560D  
;;  $561B       $5619  
;;  $561D       $5612  
;;  $5620       $5605  
;;  $5630       $562C  
;;  $565F       $55FC   $564E   $56B3   $56C0   $56C3   $56C7   $56CF   $56D7  
;;  $565F       $56E2   $56EB   $5725   $5780   $57E6   $582E  
;;  $5660       $5070  
;;  $5665       $568B  
;;  $5689       $5670   $5672  
;;  $568A       $566A   $56AB  
;;  $568E       $5685  
;;  $5694       $568F  
;;  $5699       $567F  
;;  $569F       $5697   $569A  
;;  $56A9       $5692   $569D  
;;  $56DD       $56B7  
;;  $5718       $5712  
;;  $571B       $570F   $5716  
;;  $571F       $571C  
;;  $5723       $5A6C   $5A9F   $5CD3  
;;  $5748       $5067  
;;  $574A       $5773  
;;  $5770       $5752   $5764  
;;  $5776       $531E   $5393   $545C  
;;  $5783       $577C  
;;  $5784       $5782  
;;  $579E       $578C  
;;  $57B1       $57A3  
;;  $57BC       $5791   $579E   $57B4  
;;  $57C5       $579C  
;;  $57CF       $5787  
;;  $57E3       $57DD  
;;  $57F2       $57D8  
;;  $57F9       $57E1  
;;  $5812       $57EA  
;;  $5814       $5810  
;;  $5818       $580E  
;;  $581F       $578E   $580B  
;;  $5828       $5825  
;;  $5838       $5835  
;;  $583F       $57BC  
;;  $5846       $585B  
;;  $584A       $5846  
;;  $584C       $5793   $5804  
;;  $585D       $5614  
;;  $58E0       $505F  
;;  $58FD       $58F8  
;;  $5902       $5922  
;;  $591C       $58F0  
;;  $5924       $5924  
;;  $5925       $5909   $5A72   $5CE9  
;;  $5934       $5A89  
;;  $5936       $5A8F  
;;  $5937       $5918  
;;  $593F       $5947  
;;  $5954       $5950  
;;  $595B       $525A  
;;  $5974       $596F  
;;  $597C       $5957   $5965   $5B13  
;;  $5986       $59AB  
;;  $5998       $5994  
;;  $59B6       $59E9  
;;  $59E3       $59DF  
;;  $5A30       $5A2D  
;;  $5A39       $5582   $5B5D   $5C76  
;;  $5A46       $52C5   $534D   $5A3F   $5A5E   $5AD0   $5AE8   $5CB6  
;;  $5A4E       $56DA   $5BEC   $5C0A  
;;  $5A78       $597A  
;;  $5AA2       $5A99  
;;  $5ABC       $5AB9  
;;  $5AE5       $5267   $5BB6   $5C48  
;;  $5B10       $5B0C  
;;  $5B2F       $5B2C  
;;  $5B3D       $5B38  
;;  $5B60       $5BEA   $5C08   $5C86   $5C8A   $5C93   $5CA0  
;;  $5B61       $5548   $563E   $5B1E  
;;  $5B6C       $5324   $5B62   $5B83  
;;  $5B8F       $5B8A  
;;  $5BB9       $58E1   $5971   $5BB4  
;;  $5BBE       $5BA5  
;;  $5BCE       $5BCB  
;;  $5C06       $5BF8  
;;  $5C0A       $5C03  
;;  $5C12       $5BE3   $5BF1  
;;  $5C22       $5C1F  
;;  $5C43       $5C32   $5C36   $5C3B  
;;  $5C4F       $5C41   $5C46  
;;  $5C51       $5BDB  
;;  $5C52       $5C50  
;;  $5C6A       $5C67  
;;  $5C71       $5C2A  
;;  $5C7D       $5CC0  
;;  $5C9E       $5C9B  
;;  $5CA2       $5C8E  
;;  $5CE3       $5CC6  
;;  $5CED       $5860   $5C53  
;;  $5CFB       $5BDE  
;;  $5D14       $5A75   $5CB9  
;;  $5D4D       $5D4B  
;; ======================================================================== ;;
