
        ORG     $5000
.HEADER:
        BIDECLE $535A           ; 5000  Ptr: MOB graphic images
        BIDECLE $583C           ; 5002  Ptr: EXEC timer table
        BIDECLE $504C           ; 5004  Ptr: Start of game
        BIDECLE $53AA           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5358           ; 5008  Ptr: GRAM init sequence
        BIDECLE $501C           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $000E,  $000E   ; 500F  Color Stack init (0, 1)
        DECLE   $000E,  $000E   ; 5011  Color Stack init (2, 3)
        DECLE   $0001           ; 5013  Border color init

        DECLE   $01A0,  $01A8,  $01B0,  $01B8   ; 5014   01A0 01A8 01B0 01B8
        DECLE   $01C0,  $01D0,  $01E0,  $01F0   ; 5018   01C0 01D0 01E0 01F0
.TITLE:
        DECLE   $0052                           ; 501C  Cartridge year
        STRING  "Takeover"                      ; 501D  Title string
        DECLE   $0000                           ; 5025  

.TITLECODE:
        MOVR    R7,     R4                      ; 5026   00BC
        ADDI    #$0004, R4                      ; 5027   02FC 0004
        PSHR    R4                              ; 5029   0274
        MOVR    R5,     R7                      ; 502A   00AF

        CMPI    #$0082, R2                      ; 502B   037A 0082
        BEQ     L_5038                          ; 502D   0204 0009

        MVII    #$0003, R1                      ; 502F   02B9 0003
        MVO     R1,     G_0103                  ; 5031   0241 0103
        SUBI    #$0004, R0                      ; 5033   0338 0004
        BPL     L_5038                          ; 5035   0203 0001

        CLRR    R0                              ; 5037   01C0
L_5038:
        SLL     R0,     2                       ; 5038   004C
        SLL     R0,     1                       ; 5039   0048
        MOVR    R0,     R3                      ; 503A   0083
        SLL     R0,     2                       ; 503B   004C
        MOVR    R0,     R1                      ; 503C   0081
        SLL     R0,     1                       ; 503D   0048
        ADDR    R1,     R0                      ; 503E   00C8
        SDBD                                    ; 503F   0001
        ADDI    #$5194, R0                      ; 5040   02F8 0094 0051
        MVO     R0,     G_0318                  ; 5043   0240 0318
        SDBD                                    ; 5045   0001
        ADDI    #$5314, R3                      ; 5046   02FB 0014 0053
        MVO     R3,     G_0317                  ; 5049   0243 0317
        PULR    R7                              ; 504B   02B7

.START:
        PSHR    R5                              ; 504C   0275
        EIS                                     ; 504D   0002
        MVII    #$0200, R4                      ; 504E   02BC 0200
        MVII    #$00F0, R0                      ; 5050   02B8 00F0
        SDBD                                    ; 5052   0001
        MVII    #$1249, R1                      ; 5053   02B9 0049 0012

        JSR     R5,     X_FILL_MEM              ; 5056   0004 0114 0341

        CLRR    R0                              ; 5059   01C0
        CLRR    R1                              ; 505A   01C9
L_505B:
        PSHR    R0                              ; 505B   0270
        PSHR    R1                              ; 505C   0271
        SLL     R1,     2                       ; 505D   004D
        MVII    #$000A, R5                      ; 505E   02BD 000A
L_5060:
        INCR    R1                              ; 5060   0009
        SUBR    R5,     R0                      ; 5061   0128
        BPL     L_5060                          ; 5062   0223 0003

        DECR    R1                              ; 5064   0011
        ADDR    R5,     R0                      ; 5065   00E8
        ADD     G_0318, R1                      ; 5066   02C1 0318
        MVI@    R1,     R2                      ; 5068   028A
        MVII    #$0001, R3                      ; 5069   02BB 0001
L_506B:
        SARC    R2,     1                       ; 506B   007A
        DECR    R0                              ; 506C   0010
        BPL     L_506B                          ; 506D   0223 0003
        BNC     L_507D                          ; 506F   0209 000C

        MVII    #$0007, R3                      ; 5071   02BB 0007
        PULR    R1                              ; 5073   02B1
        PULR    R0                              ; 5074   02B0
        PSHR    R0                              ; 5075   0270
        PSHR    R1                              ; 5076   0271

        JSR     R5,     L_5F76                  ; 5077   0004 015C 0376
        JSR     R5,     L_5F97                  ; 507A   0004 015C 0397

L_507D:
        PULR    R1                              ; 507D   02B1
        PULR    R0                              ; 507E   02B0
        INCR    R0                              ; 507F   0008
        CMPI    #$0028, R0                      ; 5080   0378 0028
        BNEQ    L_505B                          ; 5082   022C 0028

        CLRR    R0                              ; 5084   01C0
        INCR    R1                              ; 5085   0009
        CMPI    #$0018, R1                      ; 5086   0379 0018
        BNEQ    L_505B                          ; 5088   022C 002E

        MVII    #$031D, R4                      ; 508A   02BC 031D
        MVII    #$0040, R0                      ; 508C   02B8 0040

        JSR     R5,     X_FILL_ZERO             ; 508E   0004 0114 0338

        MVII    #$01C3, R4                      ; 5091   02BC 01C3
        MVII    #$002C, R0                      ; 5093   02B8 002C
        MVII    #$00FF, R1                      ; 5095   02B9 00FF
        MVO     R1,     G_0172                  ; 5097   0241 0172

        JSR     R5,     X_FILL_MEM              ; 5099   0004 0114 0341

        SDBD                                    ; 509C   0001
        MVII    #$551A, R0                      ; 509D   02B8 001A 0055
        MVO     R0,     G_035D                  ; 50A0   0240 035D
        MVII    #$0080, R0                      ; 50A2   02B8 0080
        SWAP    R0,     1                       ; 50A4   0040
        MVII    #$0323, R1                      ; 50A5   02B9 0323
        MVII    #$0004, R5                      ; 50A7   02BD 0004
        MVO     R5,     G_0170                  ; 50A9   0245 0170
L_50AB:
        MVO@    R0,     R1                      ; 50AB   0248
        ADDI    #$0008, R1                      ; 50AC   02F9 0008
        DECR    R5                              ; 50AE   0015
        BNEQ    L_50AB                          ; 50AF   022C 0005

        MVII    #$001C, R0                      ; 50B1   02B8 001C
        MVO     R0,     G_0171                  ; 50B3   0240 0171
        MVII    #$01C3, R2                      ; 50B5   02BA 01C3
L_50B7:
        MVII    #$0003, R0                      ; 50B7   02B8 0003

        JSR     R5,     X_RAND1                 ; 50B9   0004 0114 027D

        ADD     G_0317, R0                      ; 50BC   02C0 0317
        MOVR    R0,     R1                      ; 50BE   0081
        MVI@    R1,     R0                      ; 50BF   0288
        CMPI    #$01C3, R2                      ; 50C0   037A 01C3
        BEQ     L_50CE                          ; 50C2   0204 000A

        JSR     R5,     L_5E4C                  ; 50C4   0004 015C 024C

        MOVR    R3,     R0                      ; 50C7   0098
        CMPI    #$01C3, R2                      ; 50C8   037A 01C3
        BEQ     L_50D1                          ; 50CA   0204 0005

        MVII    #$01D7, R2                      ; 50CC   02BA 01D7

L_50CE:
        JSR     R5,     L_5437                  ; 50CE   0004 0154 0037

L_50D1:
        SDBD                                    ; 50D1   0001
        ADDI    #$0014, R2                      ; 50D2   02FA 0014 0000
        CMPI    #$01D7, R2                      ; 50D5   037A 01D7
        BEQ     L_50B7                          ; 50D7   0224 0021

        MVII    #$01C3, R2                      ; 50D9   02BA 01C3

        JSR     R5,     L_5454                  ; 50DB   0004 0154 0054

        MVII    #$01D7, R2                      ; 50DE   02BA 01D7

        JSR     R5,     L_5454                  ; 50E0   0004 0154 0054

        MVII    #$0334, R2                      ; 50E3   02BA 0334
L_50E5:
        MOVR    R2,     R5                      ; 50E5   0095
        SUBI    #$0007, R5                      ; 50E6   033D 0007
        SDBD                                    ; 50E8   0001
        MVII    #$9012, R0                      ; 50E9   02B8 0012 0090
        CMPI    #$033C, R2                      ; 50EC   037A 033C
        BMI     L_50F2                          ; 50EE   020B 0002

        ADDI    #$0003, R0                      ; 50F0   02F8 0003
L_50F2:
        MVO@    R0,     R5                      ; 50F2   0268
        SDBD                                    ; 50F3   0001
        MVII    #$533B, R0                      ; 50F4   02B8 003B 0053
        MVO@    R0,     R5                      ; 50F7   0268

        JSR     R5,     L_5481                  ; 50F8   0004 0154 0081

        ADDI    #$0008, R2                      ; 50FB   02FA 0008
        CMPI    #$0344, R2                      ; 50FD   037A 0344
        BNEQ    L_50E5                          ; 50FF   022C 001B

        MVII    #$031D, R3                      ; 5101   02BB 031D
        MVII    #$01C3, R2                      ; 5103   02BA 01C3
        CLRR    R0                              ; 5105   01C0
L_5106:
        MOVR    R3,     R5                      ; 5106   009D
        SDBD                                    ; 5107   0001
        ADDI    #$1080, R0                      ; 5108   02F8 0080 0010
        MVO@    R0,     R5                      ; 510B   0268
        SDBD                                    ; 510C   0001
        MVII    #$5334, R1                      ; 510D   02B9 0034 0053
        MVO@    R1,     R5                      ; 5110   0269

        JSR     R5,     L_5F14                  ; 5111   0004 015C 0314
        JSR     R5,     L_5F4D                  ; 5114   0004 015C 034D

        MOVR    R3,     R4                      ; 5117   009C
        ADDI    #$0002, R4                      ; 5118   02FC 0002
        MVO@    R0,     R4                      ; 511A   0260
        MVO@    R1,     R4                      ; 511B   0261
        MVII    #$01D7, R2                      ; 511C   02BA 01D7
        SDBD                                    ; 511E   0001
        ADDI    #$0008, R3                      ; 511F   02FB 0008 0000
        MVII    #$0007, R0                      ; 5122   02B8 0007
        CMPI    #$0325, R3                      ; 5124   037B 0325
        BEQ     L_5106                          ; 5126   0224 0021
L_5128:
        PULR    R7                              ; 5128   02B7

L_5129:
        PSHR    R5                              ; 5129   0275

        JSR     R5,     .EXEC.4F1               ; 512A   0004 0114 00F1

        MVII    #$000F, R2                      ; 512D   02BA 000F
        MVII    #$0136, R5                      ; 512F   02BD 0136
        MVI@    R5,     R0                      ; 5131   02A8
        ADD@    R5,     R0                      ; 5132   02E8
        MVI@    R5,     R4                      ; 5133   02AC
        ANDR    R2,     R4                      ; 5134   0194
        ADDR    R4,     R0                      ; 5135   00E0
        BEQ     L_5128                          ; 5136   0224 000F

        DECR    R5                              ; 5138   0015
        MVI@    R5,     R0                      ; 5139   02A8
        COMR    R2                              ; 513A   001A
        ANDR    R2,     R0                      ; 513B   0190
        ADD@    R5,     R0                      ; 513C   02E8
        ADD@    R5,     R0                      ; 513D   02E8
        BEQ     L_5128                          ; 513E   0224 0017

        JSR     R5,     X_PLAY_SFX2             ; 5140   0004 0118 03BE
        DECLE   $0071                           ; 5143  SFX prio
        DECLE   $004F,  $0020                   ; 5144  SFX data
        DECLE   $0013,  $0016                   ; 5146  SFX data
        DECLE   $0003,  $0022                   ; 5148  SFX data
        DECLE   $0379                           ; 514A  SFX data
        DECLE   $03C5                           ; 514B  SFX data
        DECLE   $03ED                           ; 514C  SFX data
        DECLE   $03EE                           ; 514D  SFX data
        DECLE   $000F,  $03FF                   ; 514E  SFX data
        DECLE   $0303,  $0042                   ; 5150  SFX data
        DECLE   $0003,  $0016                   ; 5152  SFX data
        DECLE   $03F9                           ; 5154  SFX data
        DECLE   $008F,  $002F                   ; 5155  SFX data
        DECLE   $0003,  $0026                   ; 5157  SFX data
        DECLE   $03E9                           ; 5159  SFX data
        DECLE   $00C0,  $0040                   ; 515A  SFX data
        DECLE   $0205                           ; 515C  SFX data
        DECLE   $0001,  $0004                   ; 515D  SFX data
        DECLE   $0012                           ; 515F  SFX data
        DECLE   $008F,  $0027                   ; 5160  SFX data
        DECLE   $0003,  $0388                   ; 5162  SFX data
        DECLE   $02CF                           ; 5164  SFX end

L_5165:
        PSHR    R5                              ; 5165   0275

        JSR     R5,     X_PLAY_SFX1             ; 5166   0004 0118 03BB
        DECLE   $0079                           ; 5169  SFX data
        DECLE   $03B7                           ; 516A  SFX data
        DECLE   $030D                           ; 516B  SFX data
        DECLE   $00CC,  $0000                   ; 516C  SFX data
        DECLE   $000B                           ; 516E  SFX data
        DECLE   $03CF                           ; 516F  SFX end

L_5170:
        PSHR    R5                              ; 5170   0275

        JSR     R5,     X_PLAY_SFX1             ; 5171   0004 0118 03BB
        DECLE   $0079                           ; 5174  SFX data
        DECLE   $03B5                           ; 5175  SFX data
        DECLE   $03EE                           ; 5176  SFX data
        DECLE   $02AD                           ; 5177  SFX data
        DECLE   $000F,  $0001                   ; 5178  SFX data
        DECLE   $008F,  $002F                   ; 517A  SFX data
        DECLE   $02CF                           ; 517C  SFX end

L_517D:
        PSHR    R5                              ; 517D   0275

        JSR     R5,     X_PLAY_SFX1             ; 517E   0004 0118 03BB
        DECLE   $03E9                           ; 5181  SFX data
        DECLE   $0060,  $0000                   ; 5182  SFX data
        DECLE   $002C,  $0000                   ; 5184  SFX data
        DECLE   $000B                           ; 5186  SFX data
        DECLE   $03CF                           ; 5187  SFX end

L_5188:
        PSHR    R5                              ; 5188   0275

        JSR     R5,     X_PLAY_SFX1             ; 5189   0004 0118 03BB
        DECLE   $03B9                           ; 518C  SFX data
        DECLE   $03ED                           ; 518D  SFX data
        DECLE   $000F,  $03FA                   ; 518E  SFX data
        DECLE   $0355                           ; 5190  SFX data
        DECLE   $008F,  $0017                   ; 5191  SFX data
        DECLE   $02CF                           ; 5193  SFX end

        DECLE   $03E0,  $03FF,  $03FF,  $03FF   ; 5194   03E0 03FF 03FF 03FF
        DECLE   $03C0,  $03FF,  $03FF,  $03FF   ; 5198   03C0 03FF 03FF 03FF
        DECLE   $03E0,  $03FF,  $03FF,  $03DF   ; 519C   03E0 03FF 03FF 03DF
        DECLE   $03FE,  $03FF,  $03FF           ; 51A0   03FE 03FF 03FF

        MVI@    R1,     R7                      ; 51A3   028F

        DECLE   $03FF,  $03FF,  $03FF,  $000F   ; 51A4   03FF 03FF 03FF 000F
        DECLE   $03FF,  $00FF,  $03FE,  $0007   ; 51A8   03FF 00FF 03FE 0007
        DECLE   $03FF,  $01F8,  $03FC,  $0003   ; 51AC   03FF 01F8 03FC 0003
        DECLE   $00FF,  $03C0,  $03F8,  $00C3   ; 51B0   00FF 03C0 03F8 00C3
        DECLE   $007F,  $0300,  $03F1,  $03E5   ; 51B4   007F 0300 03F1 03E5
        DECLE   $003F,  $0300,  $03E1,  $03FA   ; 51B8   003F 0300 03E1 03FA
        DECLE   $001E,  $0200,  $03C3,  $03FC   ; 51BC   001E 0200 03C3 03FC
        DECLE   $0004,  $0000,  $01C7           ; 51C0   0004 0000 01C7

        XORI    #$0008, R0                      ; 51C3   03F8 0008
        B       L_544C                          ; 51C5   0200 0285

        DECLE   $03E0,  $001E,  $0340,  $0100   ; 51C7   03E0 001E 0340 0100
        DECLE   $03C0,  $00FF,  $0040,  $0000   ; 51CB   03C0 00FF 0040 0000
        DECLE   $0303,  $03FF,  $0003,  $0000   ; 51CF   0303 03FF 0003 0000
        DECLE   $0380,  $03FF,  $001F,  $0000   ; 51D3   0380 03FF 001F 0000
        DECLE   $0380,  $03FF,  $003F,  $03C0   ; 51D7   0380 03FF 003F 03C0
        DECLE   $03C0,  $03FF,  $00FF,  $03E0   ; 51DB   03C0 03FF 00FF 03E0
        DECLE   $03E3,  $03FF,  $03FF,  $03F8   ; 51DF   03E3 03FF 03FF 03F8
        DECLE   $03F7,  $03FF,  $03FF,  $03FF   ; 51E3   03F7 03FF 03FF 03FF
        DECLE   $03EF,  $03FF,  $03FF,  $03FF   ; 51E7   03EF 03FF 03FF 03FF
        DECLE   $03DF,  $03FF,  $03FF,  $03FF   ; 51EB   03DF 03FF 03FF 03FF
        DECLE   $03DF,  $03FF,  $03FF,  $03FF   ; 51EF   03DF 03FF 03FF 03FF
        DECLE   $039F,  $03FF,  $03FF,  $03FF   ; 51F3   039F 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 51F7   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 51FB   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03C7,  $03FF   ; 51FF   03FF 03FF 03C7 03FF
        DECLE   $03FF,  $03FF,  $0380,  $03FF   ; 5203   03FF 03FF 0380 03FF
        DECLE   $03FF,  $01FF,  $0300,  $03FF   ; 5207   03FF 01FF 0300 03FF
        DECLE   $03FF,  $00FF,  $0200,  $03FF   ; 520B   03FF 00FF 0200 03FF
        DECLE   $03FF,  $007F,  $0200,  $03FF   ; 520F   03FF 007F 0200 03FF
        DECLE   $03FF,  $001F,  $0100,  $03B1   ; 5213   03FF 001F 0100 03B1
        DECLE   $03FF,  $000F,  $03C4,  $03C0   ; 5217   03FF 000F 03C4 03C0
        DECLE   $03FF,  $0007,  $00FE,  $0301   ; 521B   03FF 0007 00FE 0301
        DECLE   $03FF,  $0003,  $021F,  $0203   ; 521F   03FF 0003 021F 0203
        DECLE   $03FF,  $0223,  $030F,  $0223   ; 5223   03FF 0223 030F 0223
        DECLE   $03FF,  $039F,  $0383,  $01C3   ; 5227   03FF 039F 0383 01C3
        DECLE   $033F,  $03FF,  $0383,  $0383   ; 522B   033F 03FF 0383 0383
        DECLE   $038E,  $03FF,  $03C7,  $0383   ; 522F   038E 03FF 03C7 0383
        DECLE   $03C1,  $03FF,  $03C7,  $0385   ; 5233   03C1 03FF 03C7 0385
        DECLE   $03E0,  $03FF,  $03C7,  $03CF   ; 5237   03E0 03FF 03C7 03CF
        DECLE   $03FB,  $03FF,  $0387,  $00EF   ; 523B   03FB 03FF 0387 00EF
        DECLE   $03FC,  $03FF,  $0387,  $005F   ; 523F   03FC 03FF 0387 005F
        DECLE   $03FE,  $03FF,  $038F,  $003F   ; 5243   03FE 03FF 038F 003F
        DECLE   $03FF,  $03FF,  $039F,  $038F   ; 5247   03FF 03FF 039F 038F
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 524B   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 524F   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $0000,  $0000,  $0000   ; 5253   03FF 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5257   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $03C0,  $0001   ; 525B   0001 0000 03C0 0001
        DECLE   $0003,  $0000,  $03EE,  $0207   ; 525F   0003 0000 03EE 0207
        DECLE   $0003,  $0000,  $03FF           ; 5263   0003 0000 03FF

        BESC    L_526B                          ; 5266   020F 0003
        B       L_5669                          ; 5268   0200 03FF

        DECLE   $039F                           ; 526A   039F
L_526B:
        SETC                                    ; 526B   0007
        DECLE   $0300,  $03FF,  $03FF,  $0007   ; 526C   0300 03FF 03FF 0007
        DECLE   $0380,  $03FF,  $03FF,  $000F   ; 5270   0380 03FF 03FF 000F
        DECLE   $03C0,  $03FF,  $03FF,  $001F   ; 5274   03C0 03FF 03FF 001F
        DECLE   $03F0,  $03FF,  $03FF,  $003F   ; 5278   03F0 03FF 03FF 003F
        DECLE   $03FC,  $03FF,  $03FF,  $003F   ; 527C   03FC 03FF 03FF 003F
        DECLE   $03FE,  $03FF,  $03FF,  $007F   ; 5280   03FE 03FF 03FF 007F
        DECLE   $03FE,  $03FF,  $03FF,  $00FF   ; 5284   03FE 03FF 03FF 00FF
        DECLE   $03FE,  $03FF,  $03FF,  $01FF   ; 5288   03FE 03FF 03FF 01FF
        DECLE   $03FA,  $03FF,  $03FF,  $01FF   ; 528C   03FA 03FF 03FF 01FF
        DECLE   $03FC,  $03FF,  $03FF,  $01FF   ; 5290   03FC 03FF 03FF 01FF
        DECLE   $03FC,  $03FF,  $03EF,  $01FF   ; 5294   03FC 03FF 03EF 01FF
        DECLE   $03FC,  $03FF,  $03DF,  $00FF   ; 5298   03FC 03FF 03DF 00FF
        DECLE   $03F8,  $000F,  $03EF,  $00FF   ; 529C   03F8 000F 03EF 00FF
        DECLE   $03F8,  $0003,  $03F6,  $007F   ; 52A0   03F8 0003 03F6 007F
        DECLE   $00F8,  $0000,  $03F2,  $003F   ; 52A4   00F8 0000 03F2 003F
        DECLE   $0078,  $0000,  $03E0,  $001F   ; 52A8   0078 0000 03E0 001F
        DECLE   $0010,  $0000,  $0380,  $0006   ; 52AC   0010 0000 0380 0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; 52B0   0000 0000 0000 0000
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 52B4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $037F,  $03FF,  $03FF   ; 52B8   03FF 037F 03FF 03FF
        DECLE   $03FF,  $003F,  $03FC,  $03FF   ; 52BC   03FF 003F 03FC 03FF
        DECLE   $03DF,  $007F,  $032A,  $03FE   ; 52C0   03DF 007F 032A 03FE
        DECLE   $03C7,  $00FF,  $0055,  $03F0   ; 52C4   03C7 00FF 0055 03F0
        DECLE   $03E3,  $03FF,  $012B,  $03A0   ; 52C8   03E3 03FF 012B 03A0
        DECLE   $00F1,  $03DF,  $00FF,  $0302   ; 52CC   00F1 03DF 00FF 0302
        DECLE   $02F9,  $03EE,  $01FF,  $03BC   ; 52D0   02F9 03EE 01FF 03BC
        DECLE   $0021,  $0357,  $03FF,  $03F9   ; 52D4   0021 0357 03FF 03F9
        DECLE   $0003,  $02AA,  $03FF,  $03FF   ; 52D8   0003 02AA 03FF 03FF
        DECLE   $0327,  $01F5,  $03FD,  $03FF   ; 52DC   0327 01F5 03FD 03FF
        DECLE   $03FF,  $03FF,  $03FA,  $03FF   ; 52E0   03FF 03FF 03FA 03FF
        DECLE   $03FF,  $01FF,  $03F5,  $03EB   ; 52E4   03FF 01FF 03F5 03EB
        DECLE   $03BF,  $03FF,  $03FF,  $03D5   ; 52E8   03BF 03FF 03FF 03D5
        DECLE   $015F,  $03FF,  $03FF,  $03EB   ; 52EC   015F 03FF 03FF 03EB
        DECLE   $026F,  $03FF                   ; 52F0   026F 03FF

        XOR@    R5,     R3                      ; 52F2   03EB
        XOR@    R6,     R5                      ; 52F3   03F5
        SUBR    R2,     R7                      ; 52F4   0117

        DECLE   $03F5,  $03D5,  $03F0,  $021F   ; 52F5   03F5 03D5 03F0 021F

        XOR     G_01AB, R2                      ; 52F9   03C2 01AB
        XOR@    R4,     R4                      ; 52FB   03E4
        SUBR    R0,     R7                      ; 52FC   0107

        DECLE   $03E0,  $0057,  $03FC,  $03C3   ; 52FD   03E0 0057 03FC 03C3
        DECLE   $03F1,  $01AF,  $03FE,  $03FF   ; 5301   03F1 01AF 03FE 03FF
        DECLE   $03FB,  $03FF,  $03FF,  $03FF   ; 5305   03FB 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 5309   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 530D   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF           ; 5311   03FF 03FF 03FF

        MOVR    R0,     R6                      ; 5314   0086
        SUBR    R3,     R4                      ; 5315   011C
        SUBR    R6,     R3                      ; 5316   0133
        ANDR    R6,     R6                      ; 5317   01B6
        MVI     G_0314, R3                      ; 5318   0283 0314
        SUB@    R5,     R7                      ; 531A   032F

        DECLE   $0346,  $00A6,  $00B5,  $0187   ; 531B   0346 00A6 00B5 0187
        DECLE   $025B,  $0302,  $030D,  $030D   ; 531F   025B 0302 030D 030D
        DECLE   $0343,  $00B2,  $0123,  $0135   ; 5323   0343 00B2 0123 0135
        DECLE   $01CF,  $0200,  $0267,  $0286   ; 5327   01CF 0200 0267 0286
        DECLE   $0314,  $0030,  $0030,  $0045   ; 532B   0314 0030 0030 0045
        DECLE   $01E2,  $0255,  $0332,  $0350   ; 532F   01E2 0255 0332 0350
        DECLE   $0365,  $02AA,  $0053,  $0000   ; 5333   0365 02AA 0053 0000
        DECLE   $0000,  $0001,  $0000,  $0000   ; 5337   0000 0001 0000 0000
        DECLE   $0200,  $0000,  $0000,  $0000   ; 533B   0200 0000 0000 0000
        DECLE   $0001,  $0001,  $0000,  $0200   ; 533F   0001 0001 0000 0200
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5343   0000 0000 0000 0001

        EIS                                     ; 5347   0002
        INCR    R0                              ; 5348   0008
        XORR    R1,     R0                      ; 5349   01C8
        RLC     R3,     1                       ; 534A   0053
        XORR    R1,     R0                      ; 534B   01C8
        CMPR    R2,     R3                      ; 534C   0153
        XOR@    R1,     R0                      ; 534D   03C8
        RLC     R3,     1                       ; 534E   0053
        XOR@    R1,     R0                      ; 534F   03C8
        CMPR    R2,     R3                      ; 5350   0153
        B       L_5353                          ; 5351   0200 0000

L_5353:
        ADDR    R0,     R0                      ; 5353   00C0
        DECLE   $0053,  $0004,  $0004,  $0000   ; 5354   0053 0004 0004 0000
.GRAM_INIT_5358:
        DECLE   $0001           ; 5358  # of GRAM cards to init
        DECLE   $0000           ; 5359  #00   :  CART #00    ----

        DECLE   $0000,  $0036,  $0022,  $0000   ; 535A   0000 0036 0022 0000
        DECLE   $0022,  $0036,  $0000,  $0000   ; 535E   0022 0036 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5362   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5366   0018 0018 0018 0018
        DECLE   $0004,  $001F,  $001F,  $005F   ; 536A   0004 001F 001F 005F
        DECLE   $0044,  $005F,  $005F,  $005F   ; 536E   0044 005F 005F 005F
        DECLE   $0044,  $00FF,  $007E,  $0000   ; 5372   0044 00FF 007E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5376   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $001F,  $001F   ; 537A   0000 0004 001F 001F
        DECLE   $005F,  $0044,  $005F,  $005F   ; 537E   005F 0044 005F 005F
        DECLE   $005F,  $0044,  $00FF,  $0000   ; 5382   005F 0044 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5386   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $001F   ; 538A   0000 0000 0004 001F
        DECLE   $001F,  $005F,  $0044,  $005F   ; 538E   001F 005F 0044 005F
        DECLE   $005F,  $005F,  $0044,  $0000   ; 5392   005F 005F 0044 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5396   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 539A   0000 0000 0000 0000
        DECLE   $0004,  $001F,  $001F,  $005F   ; 539E   0004 001F 001F 005F
        DECLE   $0044,  $005F,  $005F,  $005F   ; 53A2   0044 005F 005F 005F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53A6   0000 0000 0000 0000
.GFX_LIST_53AA:
        DECLE   $01C0,  $02F9,  $0002,  $004A   ; 53AA  CART PIC #00
        DECLE   $00D7,  $0200,  $000D,  $0200   ; 53AE  
        DECLE   $0008                           ; 53B2   0008

        B       L_53B8                          ; 53B3   0200 0003

        MVII    #$0067, R0                      ; 53B5   02B8 0067
        SWAP    R0,     1                       ; 53B7   0040
L_53B8:
        INCR    R1                              ; 53B8   0009
        MVO@    R0,     R1                      ; 53B9   0248
        MOVR    R5,     R7                      ; 53BA   00AF

        MVII    #$00A7, R0                      ; 53BB   02B8 00A7
        SWAP    R0,     1                       ; 53BD   0040
        MVO@    R0,     R1                      ; 53BE   0248
        MOVR    R5,     R7                      ; 53BF   00AF

        ADDI    #$0001, R1                      ; 53C0   02F9 0001
        CLRR    R0                              ; 53C2   01C0
        MVO@    R0,     R1                      ; 53C3   0248
        ADDI    #$0004, R1                      ; 53C4   02F9 0004
        MVO@    R0,     R1                      ; 53C6   0248
        MOVR    R5,     R7                      ; 53C7   00AF

        PSHR    R5                              ; 53C8   0275
        SLR     R0,     1                       ; 53C9   0060
        SLR     R3,     1                       ; 53CA   0063
        CMPR    R0,     R3                      ; 53CB   0143
        BEQ     L_5436                          ; 53CC   0204 0068

        MOVR    R1,     R2                      ; 53CE   008A
        ADDI    #$0007, R2                      ; 53CF   02FA 0007
        MVII    #$0032, R4                      ; 53D1   02BC 0032

        JSR     R5,     L_5E2C                  ; 53D3   0004 015C 022C

        BEQ     L_53E1                          ; 53D6   0204 0009

        ADDR    R4,     R4                      ; 53D8   00E4
        INCR    R2                              ; 53D9   000A

        JSR     R5,     L_5E2C                  ; 53DA   0004 015C 022C

        BEQ     L_53E0                          ; 53DD   0204 0001

        ADDR    R4,     R4                      ; 53DF   00E4
L_53E0:
        DECR    R2                              ; 53E0   0012

L_53E1:
        JSR     R5,     L_5FEE                  ; 53E1   0004 015C 03EE

        CMPR    R4,     R0                      ; 53E4   0160
        BPL     L_542E                          ; 53E5   0203 0047

        MVI@    R1,     R0                      ; 53E7   0288
        SDBD                                    ; 53E8   0001
        ANDI    #$E7FF, R0                      ; 53E9   03B8 00FF 00E7
        SDBD                                    ; 53EC   0001
        XORI    #$1000, R0                      ; 53ED   03F8 0000 0010
        MOVR    R1,     R4                      ; 53F0   008C
        MVO@    R0,     R4                      ; 53F1   0260
        SDBD                                    ; 53F2   0001
        MVII    #$5351, R0                      ; 53F3   02B8 0051 0053
        MVO@    R0,     R4                      ; 53F6   0260
        ADDI    #$0003, R4                      ; 53F7   02FC 0003
        MVII    #$0080, R5                      ; 53F9   02BD 0080
        MVO@    R5,     R4                      ; 53FB   0265
        MVII    #$001E, R5                      ; 53FC   02BD 001E
        MVO@    R5,     R4                      ; 53FE   0265
        CLRR    R4                              ; 53FF   01E4
        MVO@    R4,     R2                      ; 5400   0254
        MVII    #$0324, R1                      ; 5401   02B9 0324
        CMPI    #$0354, R2                      ; 5403   037A 0354
        BMI     L_5409                          ; 5405   020B 0002

        MVII    #$032C, R1                      ; 5407   02B9 032C
L_5409:
        CMP@    R1,     R2                      ; 5409   034A
        BNEQ    L_540D                          ; 540A   020C 0001

        MVO@    R4,     R1                      ; 540C   024C

L_540D:
        JSR     R5,     L_5E2C                  ; 540D   0004 015C 022C

        BEQ     L_5422                          ; 5410   0204 0010

        MVII    #$016E, R1                      ; 5412   02B9 016E
        CMPI    #$0354, R2                      ; 5414   037A 0354
        BMI     L_5419                          ; 5416   020B 0001

        INCR    R1                              ; 5418   0009
L_5419:
        MVI@    R1,     R0                      ; 5419   0288
        DECR    R0                              ; 541A   0010
        MVO@    R0,     R1                      ; 541B   0248
        MVO@    R4,     R3                      ; 541C   025C
        INCR    R3                              ; 541D   000B
        MVO@    R4,     R3                      ; 541E   025C
        INCR    R2                              ; 541F   000A
        B       L_540D                          ; 5420   0220 0014

L_5422:
        JSR     R5,     X_PLAY_SFX1             ; 5422   0004 0118 03BB
        DECLE   $0079                           ; 5425  SFX data
        DECLE   $03B5                           ; 5426  SFX data
        DECLE   $03ED                           ; 5427  SFX data
        DECLE   $008F,  $001F                   ; 5428  SFX data
        DECLE   $03FE                           ; 542A  SFX data
        DECLE   $008F,  $003F                   ; 542B  SFX data
        DECLE   $02CF                           ; 542D  SFX end

L_542E:
        MVI@    R2,     R5                      ; 542E   0295
        MVII    #$0040, R0                      ; 542F   02B8 0040
        COMR    R0                              ; 5431   0018
        ANDR    R0,     R5                      ; 5432   0185
        COMR    R0                              ; 5433   0018
        XORR    R0,     R5                      ; 5434   01C5
        MVO@    R5,     R2                      ; 5435   0255
L_5436:
        PULR    R7                              ; 5436   02B7

L_5437:
        PSHR    R5                              ; 5437   0275

        JSR     R5,     L_5FB9                  ; 5438   0004 015C 03B9
        JSR     R5,     L_5F76                  ; 543B   0004 015C 0376

        MOVR    R1,     R5                      ; 543E   008D
        SUBI    #$0200, R5                      ; 543F   033D 0200
        MVO@    R5,     R2                      ; 5441   0255
        CLRR    R3                              ; 5442   01DB
        PSHR    R4                              ; 5443   0274

        JSR     R5,     L_5F97                  ; 5444   0004 015C 0397

        MVI@    R1,     R0                      ; 5447   0288
        SDBD                                    ; 5448   0001
        MVII    #$3FFF, R5                      ; 5449   02BD 00FF 003F
L_544C:
        ANDR    R5,     R0                      ; 544C   01A8
        PULR    R3                              ; 544D   02B3
        SWAP    R3,     1                       ; 544E   0043
        SLR     R3,     2                       ; 544F   0067
        SWAP    R3,     1                       ; 5450   0043
        XORR    R3,     R0                      ; 5451   01D8
        MVO@    R0,     R1                      ; 5452   0248
        PULR    R7                              ; 5453   02B7

L_5454:
        PSHR    R5                              ; 5454   0275

        JSR     R5,     L_5F14                  ; 5455   0004 015C 0314

        SUBI    #$01C3, R2                      ; 5458   033A 01C3
        SLL     R2,     1                       ; 545A   004A
        ADDI    #$0173, R2                      ; 545B   02FA 0173
        MVII    #$0040, R5                      ; 545D   02BD 0040
        MVO@    R5,     R2                      ; 545F   0255

        JSR     R5,     L_5F5A                  ; 5460   0004 015C 035A

        MVII    #$0002, R0                      ; 5463   02B8 0002

        JSR     R5,     L_54CD                  ; 5465   0004 0154 00CD
        JSR     R5,     L_5FD7                  ; 5468   0004 015C 03D7

        MVII    #$016E, R1                      ; 546B   02B9 016E
        CMPI    #$019B, R2                      ; 546D   037A 019B
        BMI     L_5472                          ; 546F   020B 0001

        INCR    R1                              ; 5471   0009
L_5472:
        MVI@    R1,     R0                      ; 5472   0288
        INCR    R0                              ; 5473   0008
        MVO@    R0,     R1                      ; 5474   0248
        J       L_5EDF                          ; 5475   0004 035C 02DF

L_5478:
        PSHR    R5                              ; 5478   0275

        JSR     R5,     L_54BC                  ; 5479   0004 0154 00BC

        ANDI    #$0003, R0                      ; 547C   03B8 0003
        J       L_54CE                          ; 547E   0004 0354 00CE

L_5481:
        PSHR    R5                              ; 5481   0275
        PSHR    R1                              ; 5482   0271
        PSHR    R3                              ; 5483   0273
        MOVR    R2,     R3                      ; 5484   0093
        MVII    #$01C3, R2                      ; 5485   02BA 01C3
        CMPI    #$033C, R3                      ; 5487   037B 033C
        BMI     L_548F                          ; 5489   020B 0004

        SDBD                                    ; 548B   0001
        ADDI    #$0014, R2                      ; 548C   02FA 0014 0000

L_548F:
        JSR     R5,     L_5F14                  ; 548F   0004 015C 0314

        MOVR    R3,     R2                      ; 5492   009A

        JSR     R5,     L_5F5A                  ; 5493   0004 015C 035A

        PULR    R3                              ; 5496   02B3
        PULR    R1                              ; 5497   02B1
        PULR    R7                              ; 5498   02B7

L_5499:
        PSHR    R5                              ; 5499   0275
        MOVR    R2,     R3                      ; 549A   0093
        MOVR    R0,     R1                      ; 549B   0081
        MVII    #$0173, R2                      ; 549C   02BA 0173
L_549E:
        MVI@    R2,     R5                      ; 549E   0295
        ANDI    #$00E0, R5                      ; 549F   03BD 00E0
        BEQ     L_54B0                          ; 54A1   0204 000D

        CMPI    #$00E0, R5                      ; 54A3   037D 00E0
        BEQ     L_54B0                          ; 54A5   0204 0009

        JSR     R5,     L_5F14                  ; 54A7   0004 015C 0314

        CMPR    R0,     R1                      ; 54AA   0141
        BNEQ    L_54B0                          ; 54AB   020C 0003

        CMPR    R2,     R3                      ; 54AD   0153
        BNEQ    L_54B6                          ; 54AE   020C 0006

L_54B0:
        ADDI    #$0002, R2                      ; 54B0   02FA 0002
        CMPI    #$01C3, R2                      ; 54B2   037A 01C3
        BNEQ    L_549E                          ; 54B4   022C 0017

L_54B6:
        MOVR    R3,     R5                      ; 54B6   009D
        MOVR    R2,     R3                      ; 54B7   0093
        MOVR    R5,     R2                      ; 54B8   00AA
        CMPI    #$01C3, R3                      ; 54B9   037B 01C3
        PULR    R7                              ; 54BB   02B7

L_54BC:
        PSHR    R5                              ; 54BC   0275
        PSHR    R2                              ; 54BD   0272

        JSR     R5,     L_54E7                  ; 54BE   0004 0154 00E7

L_54C1:
        DECR    R0                              ; 54C1   0010
        BMI     L_54C8                          ; 54C2   020B 0004

        SLR     R2,     2                       ; 54C4   0066
        SLR     R2,     1                       ; 54C5   0062
        B       L_54C1                          ; 54C6   0220 0006

L_54C8:
        MOVR    R2,     R0                      ; 54C8   0090
        ANDI    #$0007, R0                      ; 54C9   03B8 0007
        PULR    R2                              ; 54CB   02B2
        PULR    R7                              ; 54CC   02B7

L_54CD:
        PSHR    R5                              ; 54CD   0275
L_54CE:
        PSHR    R2                              ; 54CE   0272
        PSHR    R0                              ; 54CF   0270

        JSR     R5,     L_54E7                  ; 54D0   0004 0154 00E7

        MOVR    R0,     R5                      ; 54D3   0085
        PULR    R2                              ; 54D4   02B2
        MVII    #$0007, R0                      ; 54D5   02B8 0007
L_54D7:
        DECR    R5                              ; 54D7   0015
        BMI     L_54E0                          ; 54D8   020B 0006

        SLL     R0,     2                       ; 54DA   004C
        SLL     R0,     1                       ; 54DB   0048
        SLL     R2,     2                       ; 54DC   004E
        SLL     R2,     1                       ; 54DD   004A
        B       L_54D7                          ; 54DE   0220 0008

L_54E0:
        MVI@    R1,     R5                      ; 54E0   028D
        COMR    R0                              ; 54E1   0018
        ANDR    R0,     R5                      ; 54E2   0185
        XORR    R2,     R5                      ; 54E3   01D5
        MVO@    R5,     R1                      ; 54E4   024D
        PULR    R2                              ; 54E5   02B2
        PULR    R7                              ; 54E6   02B7

L_54E7:
        PSHR    R5                              ; 54E7   0275
        SUBI    #$0173, R2                      ; 54E8   033A 0173
        SLR     R2,     1                       ; 54EA   0062
        MOVR    R2,     R0                      ; 54EB   0090
        MVII    #$0005, R1                      ; 54EC   02B9 0005

        JSR     R5,     L_5FCD                  ; 54EE   0004 015C 03CD

        SLL     R1,     2                       ; 54F1   004D
        SLL     R1,     1                       ; 54F2   0049
        ADDI    #$0323, R1                      ; 54F3   02F9 0323
        CMPI    #$0341, R1                      ; 54F5   0379 0341
        BMI     L_54FB                          ; 54F7   020B 0002

        SUBI    #$0002, R1                      ; 54F9   0339 0002
L_54FB:
        MVI@    R1,     R2                      ; 54FB   028A
        PULR    R7                              ; 54FC   02B7

        PSHR    R5                              ; 54FD   0275
        MVII    #$0321, R2                      ; 54FE   02BA 0321
        SLL     R1,     2                       ; 5500   004D
        MVII    #$0004, R3                      ; 5501   02BB 0004
        ADDR    R1,     R3                      ; 5503   00CB
        SLL     R1,     1                       ; 5504   0049
        ADDR    R1,     R2                      ; 5505   00CA
        MVI     G_0169, R4                      ; 5506   0284 0169
        COMR    R3                              ; 5508   001B
        ANDR    R3,     R4                      ; 5509   019C
        MVO     R4,     G_0169                  ; 550A   0244 0169
        TSTR    R0                              ; 550C   0080
        BPL     L_5512                          ; 550D   0203 0003

        CLRR    R5                              ; 550F   01ED
        MVO@    R5,     R2                      ; 5510   0255
        PULR    R7                              ; 5511   02B7

L_5512:
        MOVR    R0,     R1                      ; 5512   0081
        MVII    #$001E, R0                      ; 5513   02B8 001E

        JSR     R5,     .EXEC.629               ; 5515   0004 0114 0229

        MVO@    R0,     R2                      ; 5518   0250
        PULR    R7                              ; 5519   02B7

        ADDR    R7,     R5                      ; 551A   00FD
        RLC     R0,     2                       ; 551B   0054
        NEGR    R4                              ; 551C   0024
        RLC     R1,     2                       ; 551D   0055
        MOVR    R4,     R6                      ; 551E   00A6
        RLC     R2,     2                       ; 551F   0056
        MOVR    R1,     R7                      ; 5520   008F

        RLC     R1,     2                       ; 5521   0055
        MOVR    R3,     R1                      ; 5522   0099
        RLC     R1,     2                       ; 5523   0055
        PSHR    R5                              ; 5524   0275
        MVO     R1,     G_016A                  ; 5525   0241 016A
        MVII    #$0165, R5                      ; 5527   02BD 0165
        ADDR    R1,     R5                      ; 5529   00CD
        MVII    #$0324, R4                      ; 552A   02BC 0324
        SLL     R1,     2                       ; 552C   004D
        SLL     R1,     1                       ; 552D   0049
        ADDR    R1,     R4                      ; 552E   00CC
        MVI@    R4,     R2                      ; 552F   02A2
        DECR    R4                              ; 5530   0014
        CLRR    R3                              ; 5531   01DB
        CMPI    #$000B, R0                      ; 5532   0378 000B
        BEQ     L_55AB                          ; 5534   0204 0075

        INCR    R3                              ; 5536   000B
        TSTR    R0                              ; 5537   0080
        BEQ     L_55B0                          ; 5538   0204 0076

        INCR    R3                              ; 553A   000B
        CMPI    #$000A, R0                      ; 553B   0378 000A
        BEQ     L_55CF                          ; 553D   0204 0090

        CMPI    #$0005, R0                      ; 553F   0378 0005
        BEQ     L_5578                          ; 5541   0204 0035

        MVI@    R2,     R1                      ; 5543   0291
        SDBD                                    ; 5544   0001
        ANDI    #$FFE3, R1                      ; 5545   03B9 00E3 00FF
        DECR    R0                              ; 5548   0010
        CMPI    #$0004, R0                      ; 5549   0378 0004
        BMI     L_554E                          ; 554B   020B 0001

        DECR    R0                              ; 554D   0010
L_554E:
        MOVR    R0,     R3                      ; 554E   0083
        SLL     R0,     2                       ; 554F   004C
        ADDR    R0,     R1                      ; 5550   00C1
        CMPI    #$031D, R2                      ; 5551   037A 031D
        BMI     L_5562                          ; 5553   020B 000D

        SDBD                                    ; 5555   0001
        ANDI    #$FFDF, R1                      ; 5556   03B9 00DF 00FF
        XORI    #$0020, R1                      ; 5559   03F9 0020
        MVO@    R1,     R2                      ; 555B   0251
        CMPI    #$0344, R2                      ; 555C   037A 0344
        BPL     L_575B                          ; 555E   0203 01FB
        B       L_578A                          ; 5560   0200 0228

L_5562:
        MVO@    R1,     R2                      ; 5562   0251

        JSR     R5,     L_5B50                  ; 5563   0004 0158 0350

        ANDR    R3,     R0                      ; 5566   0198
        COMR    R3                              ; 5567   001B
        XORR    R3,     R0                      ; 5568   01D8
        MVO@    R0,     R1                      ; 5569   0248

        JSR     R5,     L_54BC                  ; 556A   0004 0154 00BC

        ANDI    #$0003, R0                      ; 556D   03B8 0003
        ADDI    #$0004, R0                      ; 556F   02F8 0004

        JSR     R5,     L_54CD                  ; 5571   0004 0154 00CD
L_5574:
        JSR     R5,     .EXEC.607               ; 5574   0004 0114 0207

        PULR    R7                              ; 5577   02B7

L_5578:
        CMPI    #$031D, R2                      ; 5578   037A 031D
        BMI     L_558A                          ; 557A   020B 000E

        MVI@    R2,     R1                      ; 557C   0291
        SDBD                                    ; 557D   0001
        ANDI    #$FFDF, R1                      ; 557E   03B9 00DF 00FF
        CMPI    #$0344, R2                      ; 5581   037A 0344
        BPL     L_5587                          ; 5583   0203 0002

        XORI    #$0040, R1                      ; 5585   03F9 0040
L_5587:
        MVO@    R1,     R2                      ; 5587   0251
        B       L_5574                          ; 5588   0220 0015

L_558A:
        JSR     R5,     L_5478                  ; 558A   0004 0154 0078

        B       L_5574                          ; 558D   0220 001A

        PSHR    R5                              ; 558F   0275
        MVII    #$01C3, R2                      ; 5590   02BA 01C3
        TSTR    R1                              ; 5592   0089
        BEQ     L_5597                          ; 5593   0204 0002

        MVII    #$01D7, R2                      ; 5595   02BA 01D7
L_5597:
        B       L_55A1                          ; 5597   0200 0008

        PSHR    R5                              ; 5599   0275
        MVII    #$01D7, R2                      ; 559A   02BA 01D7
        TSTR    R1                              ; 559C   0089
        BEQ     L_55A1                          ; 559D   0204 0002

        MVII    #$01C3, R2                      ; 559F   02BA 01C3
L_55A1:
        SLL     R1,     2                       ; 55A1   004D
        SLL     R1,     1                       ; 55A2   0049
        MVII    #$031D, R4                      ; 55A3   02BC 031D
        ADDR    R1,     R4                      ; 55A5   00CC

        JSR     R5,     L_5698                  ; 55A6   0004 0154 0298

        B       L_5574                          ; 55A9   0220 0036

L_55AB:
        MVII    #$0334, R2                      ; 55AB   02BA 0334
        ADDR    R1,     R2                      ; 55AD   00CA
        B       L_5675                          ; 55AE   0200 00C5

L_55B0:
        MVII    #$0344, R4                      ; 55B0   02BC 0344
        SLL     R1,     1                       ; 55B2   0049
        ADDR    R1,     R4                      ; 55B3   00CC
        MVI@    R5,     R0                      ; 55B4   02A8
        DECR    R5                              ; 55B5   0015
        MVII    #$0002, R1                      ; 55B6   02B9 0002
L_55B8:
        ADDI    #$0008, R0                      ; 55B8   02F8 0008
        SDBD                                    ; 55BA   0001
        CMPI    #$0010, R0                      ; 55BB   0378 0010 0000
        BNEQ    L_55C1                          ; 55BE   020C 0001

        CLRR    R0                              ; 55C0   01C0
L_55C1:
        DECR    R1                              ; 55C1   0011
        BMI     L_575A                          ; 55C2   020B 0196

        MOVR    R4,     R2                      ; 55C4   00A2
        ADDR    R0,     R2                      ; 55C5   00C2
        MVI@    R2,     R2                      ; 55C6   0292
        SWAP    R2,     2                       ; 55C7   0046
        BEQ     L_55B8                          ; 55C8   0224 0011

        MOVR    R4,     R2                      ; 55CA   00A2
        ADDR    R0,     R2                      ; 55CB   00C2
        MVO@    R0,     R5                      ; 55CC   0268
        B       L_5675                          ; 55CD   0200 00A6

L_55CF:
        SDBD                                    ; 55CF   0001
        SUBI    #$0007, R4                      ; 55D0   033C 0007 0000

        JSR     R5,     L_5F14                  ; 55D3   0004 015C 0314

        MVO     R0,     G_0331                  ; 55D6   0240 0331
        MVII    #$0173, R2                      ; 55D8   02BA 0173
        MVI     G_0169, R0                      ; 55DA   0280 0169
        TSTR    R1                              ; 55DC   0089
        BEQ     L_55E4                          ; 55DD   0204 0005

        SARC    R0,     1                       ; 55DF   0078
        SDBD                                    ; 55E0   0001
        ADDI    #$0028, R2                      ; 55E1   02FA 0028 0000
L_55E4:
        SARC    R0,     2                       ; 55E4   007C
        SARC    R0,     1                       ; 55E5   0078
        BNC     L_5627                          ; 55E6   0209 003F

        PSHR    R4                              ; 55E8   0274
        MVII    #$03C0, R0                      ; 55E9   02B8 03C0
        MOVR    R0,     R4                      ; 55EB   0084
        PSHR    R0                              ; 55EC   0270
L_55ED:
        MVI@    R2,     R5                      ; 55ED   0295
        ANDI    #$00E0, R5                      ; 55EE   03BD 00E0
        BEQ     L_560D                          ; 55F0   0204 001B

        CMPI    #$00E0, R5                      ; 55F2   037D 00E0
        BEQ     L_560D                          ; 55F4   0204 0017

        JSR     R5,     L_5F14                  ; 55F6   0004 015C 0314

        CMP     G_0331, R0                      ; 55F9   0340 0331
        BLE     L_5608                          ; 55FB   0206 000B

        PULR    R1                              ; 55FD   02B1
        CMPR    R1,     R0                      ; 55FE   0148
        BPL     L_5605                          ; 55FF   0203 0004

        PSHR    R0                              ; 5601   0270
        MVO     R2,     G_0339                  ; 5602   0242 0339
        INCR    R7                              ; 5604   000F

L_5605:
        PSHR    R1                              ; 5605   0271
L_5606:
        B       L_560D                          ; 5606   0200 0005

L_5608:
        CMPR    R4,     R0                      ; 5608   0160
        BPL     L_560D                          ; 5609   0203 0002

        MOVR    R0,     R4                      ; 560B   0084
        MOVR    R2,     R3                      ; 560C   0093
L_560D:
        ADDI    #$0002, R2                      ; 560D   02FA 0002
        CMPI    #$019B, R2                      ; 560F   037A 019B
        BEQ     L_5617                          ; 5611   0204 0004

        CMPI    #$01C3, R2                      ; 5613   037A 01C3
        BNEQ    L_55ED                          ; 5615   022C 0029

L_5617:
        MOVR    R4,     R5                      ; 5617   00A5
        MVII    #$03C0, R0                      ; 5618   02B8 03C0
        CMP@    R6,     R0                      ; 561A   0370
        PULR    R4                              ; 561B   02B4
        BEQ     L_5622                          ; 561C   0204 0004

        MVI     G_0339, R2                      ; 561E   0282 0339
        B       L_5672                          ; 5620   0200 0050

L_5622:
        MOVR    R3,     R2                      ; 5622   009A
        CMPR    R0,     R5                      ; 5623   0145
        BNEQ    L_5672                          ; 5624   020C 004C
        PULR    R7                              ; 5626   02B7

L_5627:
        CLRR    R0                              ; 5627   01C0
        DECR    R0                              ; 5628   0010
        SLR     R0,     1                       ; 5629   0060
        MVO     R0,     G_0331                  ; 562A   0240 0331
        MVII    #$0014, R0                      ; 562C   02B8 0014
L_562E:
        MVI@    R2,     R5                      ; 562E   0295
        ANDI    #$00E0, R5                      ; 562F   03BD 00E0
        BEQ     L_565B                          ; 5631   0204 0028

        CMPI    #$00E0, R5                      ; 5633   037D 00E0
        BEQ     L_565B                          ; 5635   0204 0024

        PSHR    R0                              ; 5637   0270

        JSR     R5,     L_5F14                  ; 5638   0004 015C 0314
        JSR     R5,     L_5F4D                  ; 563B   0004 015C 034D

        MOVR    R4,     R5                      ; 563E   00A5
        ADDI    #$0002, R5                      ; 563F   02FD 0002
        SUB@    R5,     R0                      ; 5641   0328
        BPL     L_5645                          ; 5642   0203 0001

        NEGR    R0                              ; 5644   0020
L_5645:
        SUB@    R5,     R1                      ; 5645   0329
        BPL     L_5649                          ; 5646   0203 0001

        NEGR    R1                              ; 5648   0021
L_5649:
        SLR     R0,     2                       ; 5649   0064
        SLR     R1,     2                       ; 564A   0065
        MOVR    R0,     R3                      ; 564B   0083
        CMPR    R1,     R3                      ; 564C   014B
        BPL     L_5650                          ; 564D   0203 0001

        MOVR    R1,     R3                      ; 564F   008B
L_5650:
        ADDR    R0,     R1                      ; 5650   00C1
        ADDR    R1,     R3                      ; 5651   00CB
        CMP     G_0331, R3                      ; 5652   0343 0331
        BPL     L_565A                          ; 5654   0203 0004

        MVO     R3,     G_0331                  ; 5656   0243 0331
        MVO     R2,     G_0339                  ; 5658   0242 0339
L_565A:
        PULR    R0                              ; 565A   02B0
L_565B:
        ADDI    #$0002, R2                      ; 565B   02FA 0002
        DECR    R0                              ; 565D   0010
        BNEQ    L_562E                          ; 565E   022C 0031

        MVI     G_0331, R0                      ; 5660   0280 0331
        INCR    R0                              ; 5662   0008
        BMI     L_575A                          ; 5663   020B 00F5

        MVI     G_0169, R3                      ; 5665   0283 0169
        MVII    #$0004, R5                      ; 5667   02BD 0004
L_5669:
        MVI     G_016A, R2                      ; 5669   0282 016A
        SLL     R2,     2                       ; 566B   004E
        ADDR    R2,     R5                      ; 566C   00D5
        XORR    R5,     R3                      ; 566D   01EB
        MVO     R3,     G_0169                  ; 566E   0243 0169
        MVI     G_0339, R2                      ; 5670   0282 0339

L_5672:
        JSR     R5,     L_5698                  ; 5672   0004 0154 0298

L_5675:
        MVII    #$0324, R3                      ; 5675   02BB 0324
        MVI     G_016A, R1                      ; 5677   0281 016A
        SLL     R1,     2                       ; 5679   004D
        SLL     R1,     1                       ; 567A   0049
        ADDR    R1,     R3                      ; 567B   00CB
        MOVR    R2,     R4                      ; 567C   0094
        MVI@    R3,     R2                      ; 567D   029A
        MVO@    R4,     R3                      ; 567E   025C
        TSTR    R2                              ; 567F   0092
        BEQ     L_575A                          ; 5680   0204 00D8

        CMPI    #$031D, R2                      ; 5682   037A 031D
        BMI     L_5692                          ; 5684   020B 000C

        SUBI    #$0007, R2                      ; 5686   033A 0007
        MVI@    R2,     R0                      ; 5688   0290
        SDBD                                    ; 5689   0001
        MVII    #$EFFF, R3                      ; 568A   02BB 00FF 00EF
        ANDR    R3,     R0                      ; 568D   0198
        COMR    R3                              ; 568E   001B
        XORR    R3,     R0                      ; 568F   01D8
        MVO@    R0,     R2                      ; 5690   0250
        PULR    R7                              ; 5691   02B7

L_5692:
        JSR     R5,     L_5FD7                  ; 5692   0004 015C 03D7

        J       L_5EDF                          ; 5695   0004 035C 02DF

L_5698:
        PSHR    R5                              ; 5698   0275

        JSR     R5,     L_5F14                  ; 5699   0004 015C 0314
        JSR     R5,     L_5F4D                  ; 569C   0004 015C 034D

        ADDI    #$0002, R4                      ; 569F   02FC 0002
        MVO@    R0,     R4                      ; 56A1   0260
        MVO@    R1,     R4                      ; 56A2   0261
        CLRR    R5                              ; 56A3   01ED
        MVO@    R5,     R4                      ; 56A4   0265
        PULR    R7                              ; 56A5   02B7

        PSHR    R5                              ; 56A6   0275
        DECR    R0                              ; 56A7   0010
        BMI     L_575A                          ; 56A8   020B 00B0

        MVII    #$0324, R4                      ; 56AA   02BC 0324
        SLL     R1,     2                       ; 56AC   004D
        SLL     R1,     1                       ; 56AD   0049
        ADDR    R1,     R4                      ; 56AE   00CC
        MVI@    R4,     R2                      ; 56AF   02A2
        TSTR    R2                              ; 56B0   0092
        BEQ     L_575A                          ; 56B1   0204 00A7

        CMPI    #$031D, R2                      ; 56B3   037A 031D
        BPL     L_575A                          ; 56B5   0203 00A3

        JSR     R5,     L_54BC                  ; 56B7   0004 0154 00BC

        MVO     R0,     G_0168                  ; 56BA   0240 0168
        ANDI    #$0003, R0                      ; 56BC   03B8 0003
        CMPI    #$0002, R0                      ; 56BE   0378 0002
        BEQ     L_575A                          ; 56C0   0204 0098

        MVO     R2,     G_0339                  ; 56C2   0242 0339

        JSR     R5,     L_5F14                  ; 56C4   0004 015C 0314
        JSR     R5,     L_5FB9                  ; 56C7   0004 015C 03B9

        TSTR    R0                              ; 56CA   0080
        BEQ     L_575A                          ; 56CB   0204 008D

        TSTR    R1                              ; 56CD   0089
        BEQ     L_575A                          ; 56CE   0204 008A

        CMPI    #$0027, R0                      ; 56D0   0378 0027
        BEQ     L_575A                          ; 56D2   0204 0086

        CMPI    #$0017, R1                      ; 56D4   0379 0017
        BEQ     L_575A                          ; 56D6   0204 0082

        JSR     R5,     L_5FE5                  ; 56D8   0004 015C 03E5

        SDBD                                    ; 56DB   0001
        MVII    #$5EAD, R5                      ; 56DC   02BD 00AD 005E
L_56DF:
        MVI@    R5,     R3                      ; 56DF   02AB
        PSHR    R5                              ; 56E0   0275

        JSR     R5,     L_5FDF                  ; 56E1   0004 015C 03DF
        JSR     R5,     L_5EB5                  ; 56E4   0004 015C 02B5
        JSR     R5,     L_5F0C                  ; 56E7   0004 015C 030C
        JSR     R5,     L_5E4C                  ; 56EA   0004 015C 024C

        PULR    R5                              ; 56ED   02B5
        CMPI    #$01EB, R2                      ; 56EE   037A 01EB
        BNEQ    L_575A                          ; 56F0   020C 0068

        SDBD                                    ; 56F2   0001
        CMPI    #$5EB5, R5                      ; 56F3   037D 00B5 005E
        BNEQ    L_56DF                          ; 56F6   022C 0018

        MVI     G_0339, R2                      ; 56F8   0282 0339
        MVII    #$01C3, R1                      ; 56FA   02B9 01C3
        CMPI    #$019B, R2                      ; 56FC   037A 019B
        BMI     L_5704                          ; 56FE   020B 0004

        SDBD                                    ; 5700   0001
        ADDI    #$0014, R1                      ; 5701   02F9 0014 0000
L_5704:
        MVII    #$0014, R5                      ; 5704   02BD 0014
L_5706:
        MVI@    R1,     R0                      ; 5706   0288
        CMPI    #$00FF, R0                      ; 5707   0378 00FF
        BEQ     L_5710                          ; 5709   0204 0005

        INCR    R1                              ; 570B   0009
        DECR    R5                              ; 570C   0015
        BNEQ    L_5706                          ; 570D   022C 0008
        PULR    R7                              ; 570F   02B7

L_5710:
        PSHR    R1                              ; 5710   0271
        MVI     G_0168, R0                      ; 5711   0280 0168
        ANDI    #$0004, R0                      ; 5713   03B8 0004
        ADDI    #$0002, R0                      ; 5715   02F8 0002

        JSR     R5,     L_54CD                  ; 5717   0004 0154 00CD

        PULR    R1                              ; 571A   02B1
        PSHR    R1                              ; 571B   0271
        SUBI    #$01C3, R1                      ; 571C   0339 01C3

        JSR     R5,     L_5749                  ; 571E   0004 0154 0349

        BNEQ    L_5738                          ; 5721   020C 0015

        MVII    #$01EB, R3                      ; 5723   02BB 01EB
        CMPI    #$019B, R2                      ; 5725   037A 019B
        BMI     L_572B                          ; 5727   020B 0002

        MVII    #$01ED, R3                      ; 5729   02BB 01ED
L_572B:
        MVI@    R3,     R0                      ; 572B   0298
        CMPI    #$00FF, R0                      ; 572C   0378 00FF
        BEQ     L_5737                          ; 572E   0204 0007

        INCR    R3                              ; 5730   000B
        MVI@    R3,     R0                      ; 5731   0298
        CMPI    #$00FF, R0                      ; 5732   0378 00FF
        BEQ     L_5737                          ; 5734   0204 0001
        INCR    R7                              ; 5736   000F

L_5737:
        MVO@    R1,     R3                      ; 5737   0259

L_5738:
        JSR     R5,     L_5F14                  ; 5738   0004 015C 0314

        PULR    R2                              ; 573B   02B2

        JSR     R5,     L_5437                  ; 573C   0004 0154 0037
        JSR     R5,     X_PLAY_SFX1             ; 573F   0004 0118 03BB
        DECLE   $03D9                           ; 5742  SFX data
        DECLE   $0040,  $0030                   ; 5743  SFX data
        DECLE   $003C,  $0000                   ; 5745  SFX data
        DECLE   $008B                           ; 5747  SFX data
        DECLE   $03CF                           ; 5748  SFX end

L_5749:
        PSHR    R5                              ; 5749   0275
        CLRR    R5                              ; 574A   01ED
        MVO     R5,     G_0168                  ; 574B   0245 0168

L_574D:
        JSR     R5,     L_5E6B                  ; 574D   0004 015C 026B

        BEQ     L_575A                          ; 5750   0204 0008

        MVI     G_0168, R5                      ; 5752   0285 0168
        SDBD                                    ; 5754   0001
        CMPI    #$0007, R5                      ; 5755   037D 0007 0000
        BLE     L_574D                          ; 5758   0226 000C
L_575A:
        PULR    R7                              ; 575A   02B7

L_575B:
        JSR     R5,     L_5E5C                  ; 575B   0004 015C 025C

        SLR     R0,     1                       ; 575E   0060
        BEQ     L_5574                          ; 575F   0224 01EC

        JSR     R5,     L_5F07                  ; 5761   0004 015C 0307
        JSR     R5,     L_5499                  ; 5764   0004 0154 0099

        BNEQ    L_5574                          ; 5767   022C 01F4

        INCR    R2                              ; 5769   000A

        JSR     R5,     L_5E2C                  ; 576A   0004 015C 022C

        BNEQ    L_5781                          ; 576D   020C 0012

        DECR    R2                              ; 576F   0012

        JSR     R5,     L_5E2C                  ; 5770   0004 015C 022C

        BEQ     L_5574                          ; 5773   0224 0200

        SUBI    #$0007, R2                      ; 5775   033A 0007
        MVI@    R2,     R4                      ; 5777   0294
        CMPI    #$034D, R2                      ; 5778   037A 034D
        BMI     L_577E                          ; 577A   020B 0002

        SUBI    #$0003, R4                      ; 577C   033C 0003
L_577E:
        XORI    #$0010, R4                      ; 577E   03FC 0010
        MVO@    R4,     R2                      ; 5780   0254
L_5781:
        MOVR    R3,     R2                      ; 5781   009A

        JSR     R5,     L_5BBB                  ; 5782   0004 0158 03BB
        JSR     R5,     L_5478                  ; 5785   0004 0154 0078

        B       L_5574                          ; 5788   0220 0215

L_578A:
        MOVR    R2,     R1                      ; 578A   0091
        SUBI    #$0334, R1                      ; 578B   0339 0334
        SLR     R1,     2                       ; 578D   0065
        SLR     R1,     1                       ; 578E   0061
        MVII    #$016C, R3                      ; 578F   02BB 016C
        ADDR    R1,     R3                      ; 5791   00CB
        ADDI    #$0163, R1                      ; 5792   02F9 0163
        MVI@    R1,     R0                      ; 5794   0288
        CMPI    #$0010, R0                      ; 5795   0378 0010
        BMI     L_575A                          ; 5797   022B 003E

        PSHR    R1                              ; 5799   0271
        PSHR    R3                              ; 579A   0273

        JSR     R5,     L_5E5C                  ; 579B   0004 015C 025C

        BNEQ    L_57A3                          ; 579E   020C 0003

        PULR    R1                              ; 57A0   02B1
        PULR    R1                              ; 57A1   02B1
        PULR    R7                              ; 57A2   02B7

L_57A3:
        MVO     R2,     G_0339                  ; 57A3   0242 0339

        JSR     R5,     L_5F07                  ; 57A5   0004 015C 0307
        JSR     R5,     L_5499                  ; 57A8   0004 0154 0099

        BEQ     L_57F5                          ; 57AB   0204 0048

        MOVR    R3,     R2                      ; 57AD   009A

        JSR     R5,     L_54BC                  ; 57AE   0004 0154 00BC

        MOVR    R0,     R4                      ; 57B1   0084
        ANDI    #$0003, R0                      ; 57B2   03B8 0003
        CMPI    #$0001, R0                      ; 57B4   0378 0001
        BGT     L_57D4                          ; 57B6   020E 001C

        MOVR    R4,     R0                      ; 57B8   00A0
        MVI     G_0339, R3                      ; 57B9   0283 0339
        MVI@    R3,     R3                      ; 57BB   029B
        ANDI    #$0040, R3                      ; 57BC   03BB 0040
        BEQ     L_57D4                          ; 57BE   0204 0014

        SLR     R3,     2                       ; 57C0   0067
        SLR     R3,     2                       ; 57C1   0067
        SLR     R3,     2                       ; 57C2   0067
        XORR    R3,     R0                      ; 57C3   01D8
        MOVR    R0,     R3                      ; 57C4   0083

        JSR     R5,     L_54CD                  ; 57C5   0004 0154 00CD

        PULR    R1                              ; 57C8   02B1
        MVI@    R1,     R5                      ; 57C9   028D
        SARC    R3,     1                       ; 57CA   007B
        BC      L_57D1                          ; 57CB   0201 0004

        DECR    R5                              ; 57CD   0015
        BMI     L_57D3                          ; 57CE   020B 0003
        INCR    R7                              ; 57D0   000F

L_57D1:
        INCR    R5                              ; 57D1   000D
L_57D2:
        MVO@    R5,     R1                      ; 57D2   024D
L_57D3:
        INCR    R7                              ; 57D3   000F

L_57D4:
        PULR    R5                              ; 57D4   02B5
L_57D5:
        MOVR    R2,     R3                      ; 57D5   0093
        MVI     G_0339, R2                      ; 57D6   0282 0339
        CMPI    #$019B, R3                      ; 57D8   037B 019B
        BMI     L_57E2                          ; 57DA   020B 0006

        CMPI    #$033C, R2                      ; 57DC   037A 033C
        BMI     L_57E6                          ; 57DE   020B 0006
        B       L_57EF                          ; 57E0   0200 000D

L_57E2:
        CMPI    #$033C, R2                      ; 57E2   037A 033C
        BMI     L_57EF                          ; 57E4   020B 0009

L_57E6:
        JSR     R5,     L_5481                  ; 57E6   0004 0154 0081

        MVII    #$0004, R5                      ; 57E9   02BD 0004
        MVO     R5,     G_0168                  ; 57EB   0245 0168
        B       L_582E                          ; 57ED   0200 003F

L_57EF:
        MVII    #$0001, R5                      ; 57EF   02BD 0001
        MVO     R5,     G_0168                  ; 57F1   0245 0168
        B       L_582B                          ; 57F3   0200 0036

L_57F5:
        PULR    R4                              ; 57F5   02B4
        MVII    #$0001, R3                      ; 57F6   02BB 0001
        MVI     G_0167, R0                      ; 57F8   0280 0167
        TSTR    R0                              ; 57FA   0080
        BEQ     L_582B                          ; 57FB   0204 002E

        CMPI    #$0006, R0                      ; 57FD   0378 0006
        BEQ     L_580E                          ; 57FF   0204 000D
        BPL     L_580E                          ; 5801   0203 000B

        MOVR    R2,     R1                      ; 5803   0091
        SUBI    #$0334, R1                      ; 5804   0339 0334
        SLR     R1,     2                       ; 5806   0065
        ADDI    #$0003, R1                      ; 5807   02F9 0003
        CMPR    R0,     R1                      ; 5809   0141
        BEQ     L_580F                          ; 580A   0204 0003

        SLL     R3,     2                       ; 580C   004F
        INCR    R7                              ; 580D   000F

L_580E:
        SLL     R3,     1                       ; 580E   004B
L_580F:
        MVO     R3,     G_0168                  ; 580F   0243 0168
        MVI@    R2,     R5                      ; 5811   0295
        ANDI    #$0040, R5                      ; 5812   03BD 0040
        BEQ     L_582B                          ; 5814   0204 0015

        JSR     R5,     L_5F07                  ; 5816   0004 015C 0307

        MVI@    R4,     R5                      ; 5819   02A5
        DECR    R4                              ; 581A   0014
        MVII    #$0006, R3                      ; 581B   02BB 0006
        CMP     G_0167, R3                      ; 581D   0343 0167
        BNEQ    L_5826                          ; 581F   020C 0005

        INCR    R3                              ; 5821   000B
        DECR    R5                              ; 5822   0015
        BMI     L_5828                          ; 5823   020B 0003
        INCR    R7                              ; 5825   000F

L_5826:
        INCR    R5                              ; 5826   000D
L_5827:
        MVO@    R5,     R4                      ; 5827   0265

L_5828:
        JSR     R5,     L_5EEE                  ; 5828   0004 015C 02EE
L_582B:
        JSR     R5,     L_5ED7                  ; 582B   0004 015C 02D7

L_582E:
        PULR    R1                              ; 582E   02B1
        MVI     G_0168, R3                      ; 582F   0283 0168
        MVI@    R2,     R5                      ; 5831   0295
        ANDI    #$0040, R5                      ; 5832   03BD 0040
        BEQ     L_5837                          ; 5834   0204 0001

        SLL     R3,     2                       ; 5836   004F
L_5837:
        MVI@    R1,     R0                      ; 5837   0288
        SUBR    R3,     R0                      ; 5838   0118
        MVO@    R0,     R1                      ; 5839   0248
        B       L_5574                          ; 583A   0220 02C7

.TIMER:
        DECLE   $0029,  $0051,  $0001,  $0000; 583C  Timer dispatch/interval
        DECLE   $004B,  $005D,  $0003,  $0000; 5840  Timer dispatch/interval
        DECLE   $004E,  $0058,  $000C,  $0000; 5844  Timer dispatch/interval
        DECLE   $00C5,  $005C,  $0064,  $0000; 5848  Timer dispatch/interval
        BIDECLE $0000           ; 584C  End of timer table

L_584E:
        PSHR    R5                              ; 584E   0275
        MVI     G_0160, R1                      ; 584F   0281 0160
        MVI     G_015E, R2                      ; 5851   0282 015E
        TSTR    R2                              ; 5853   0092
        BNEQ    L_586C                          ; 5854   020C 0016

        MVII    #$0163, R3                      ; 5856   02BB 0163
        MVI@    R3,     R5                      ; 5858   029D
        INCR    R5                              ; 5859   000D
        CMPI    #$004B, R5                      ; 585A   037D 004B
        BPL     L_585F                          ; 585C   0203 0001

        MVO@    R5,     R3                      ; 585E   025D
L_585F:
        INCR    R3                              ; 585F   000B
        MVI@    R3,     R5                      ; 5860   029D
        INCR    R5                              ; 5861   000D
        CMPI    #$004B, R5                      ; 5862   037D 004B
        BPL     L_5867                          ; 5864   0203 0001

        MVO@    R5,     R3                      ; 5866   025D
L_5867:
        DECR    R1                              ; 5867   0011
        BGT     L_586C                          ; 5868   020E 0002

        MVII    #$0008, R1                      ; 586A   02B9 0008
L_586C:
        MVO     R1,     G_0160                  ; 586C   0241 0160
        CMPI    #$0010, R2                      ; 586E   037A 0010
        BMI     L_587B                          ; 5870   020B 0009

        CMPI    #$0020, R2                      ; 5872   037A 0020
        BMI     L_5A58                          ; 5874   020B 01E2

        CMPI    #$002C, R2                      ; 5876   037A 002C
        BEQ     L_5ACF                          ; 5878   0204 0255
        PULR    R7                              ; 587A   02B7

L_587B:
        MVII    #$0001, R5                      ; 587B   02BD 0001
        SARC    R1,     1                       ; 587D   0079
        BC      L_588C                          ; 587E   0201 000C

        MVII    #$0003, R5                      ; 5880   02BD 0003
        SARC    R1,     1                       ; 5882   0079
        BC      L_588C                          ; 5883   0201 0007

        MVII    #$0007, R5                      ; 5885   02BD 0007
        SARC    R1,     1                       ; 5887   0079
        BC      L_588C                          ; 5888   0201 0002

        MVII    #$000F, R5                      ; 588A   02BD 000F
L_588C:
        MVO     R5,     G_015F                  ; 588C   0245 015F
        SLR     R2,     1                       ; 588E   0062
        MOVR    R2,     R5                      ; 588F   0095
        SLL     R2,     2                       ; 5890   004E
        ADDR    R5,     R2                      ; 5891   00EA
        ADDI    #$0173, R2                      ; 5892   02FA 0173
        MVII    #$000A, R5                      ; 5894   02BD 000A
L_5896:
        PSHR    R5                              ; 5896   0275
        MVI@    R2,     R4                      ; 5897   0294
        ANDI    #$00E0, R4                      ; 5898   03BC 00E0
        BEQ     L_59CE                          ; 589A   0204 0132

        CMPI    #$00E0, R4                      ; 589C   037C 00E0
        BEQ     L_59C1                          ; 589E   0204 0121

        JSR     R5,     L_54BC                  ; 58A0   0004 0154 00BC

        SUBI    #$0004, R0                      ; 58A3   0338 0004
        BPL     L_58D2                          ; 58A5   0203 002B

        JSR     R5,     L_5FEE                  ; 58A7   0004 015C 03EE

        ANDI    #$0007, R0                      ; 58AA   03B8 0007
        MVO     R0,     G_0168                  ; 58AC   0240 0168

        JSR     R5,     L_5E6B                  ; 58AE   0004 015C 026B

        TSTR    R3                              ; 58B1   009B
        BEQ     L_59C1                          ; 58B2   0204 010D

        CMPI    #$0003, R0                      ; 58B4   0378 0003
        BMI     L_59C1                          ; 58B6   020B 0109

        CMPI    #$0006, R0                      ; 58B8   0378 0006
        BEQ     L_59C1                          ; 58BA   0204 0105
        BPL     L_58CA                          ; 58BC   0203 000C

        CMPI    #$0004, R0                      ; 58BE   0378 0004
        BEQ     L_59C1                          ; 58C0   0204 00FF

        CMPR    R0,     R3                      ; 58C2   0143
        BEQ     L_59C1                          ; 58C3   0204 00FC

        MVI     G_0160, R1                      ; 58C5   0281 0160
        SARC    R1,     1                       ; 58C7   0079
        BNC     L_59C1                          ; 58C8   0209 00F7

L_58CA:
        JSR     R5,     L_5FDF                  ; 58CA   0004 015C 03DF
        JSR     R5,     L_5EEE                  ; 58CD   0004 015C 02EE

        B       L_59C1                          ; 58D0   0200 00EF

L_58D2:
        MVI     G_015F, R3                      ; 58D2   0283 015F
        CLRR    R1                              ; 58D4   01C9
L_58D5:
        SARC    R3,     1                       ; 58D5   007B
        BNC     L_59C1                          ; 58D6   0209 00E9

        ADDI    #$0020, R1                      ; 58D8   02F9 0020
        CMPR    R1,     R4                      ; 58DA   014C
        BNEQ    L_58D5                          ; 58DB   022C 0007

        JSR     R5,     L_5E5C                  ; 58DD   0004 015C 025C

        BNEQ    L_595E                          ; 58E0   020C 007C

        PSHR    R2                              ; 58E2   0272

        JSR     R5,     L_5F07                  ; 58E3   0004 015C 0307

        MOVR    R0,     R3                      ; 58E6   0083
        MOVR    R2,     R1                      ; 58E7   0091
        MVII    #$0344, R2                      ; 58E8   02BA 0344
        CMPI    #$019B, R1                      ; 58EA   0379 019B
        BMI     L_58F0                          ; 58EC   020B 0002

        MVII    #$0354, R2                      ; 58EE   02BA 0354

L_58F0:
        JSR     R5,     L_5F14                  ; 58F0   0004 015C 0314

        CMPR    R0,     R3                      ; 58F3   0143
        BEQ     L_58FE                          ; 58F4   0204 0008

        ADDI    #$0008, R2                      ; 58F6   02FA 0008

        JSR     R5,     L_5F14                  ; 58F8   0004 015C 0314

        CMPR    R0,     R3                      ; 58FB   0143
        BNEQ    L_5934                          ; 58FC   020C 0036

L_58FE:
        MOVR    R2,     R1                      ; 58FE   0091
        SUBI    #$0007, R1                      ; 58FF   0339 0007
        MVI@    R1,     R0                      ; 5901   0288
        MVII    #$0324, R4                      ; 5902   02BC 0324
        CMPI    #$0354, R2                      ; 5904   037A 0354
        BMI     L_590C                          ; 5906   020B 0004

        MVII    #$032C, R4                      ; 5908   02BC 032C
        ADDI    #$0003, R0                      ; 590A   02F8 0003
L_590C:
        XORI    #$0010, R0                      ; 590C   03F8 0010

        JSR     R5,     L_5E2C                  ; 590E   0004 015C 022C

        BEQ     L_591A                          ; 5911   0204 0007

        INCR    R2                              ; 5913   000A

        JSR     R5,     L_5E2C                  ; 5914   0004 015C 022C

        BNEQ    L_5934                          ; 5917   020C 001B
        INCR    R7                              ; 5919   000F

L_591A:
        MVO@    R0,     R1                      ; 591A   0248
L_591B:
        MOVR    R2,     R0                      ; 591B   0090
        PULR    R2                              ; 591C   02B2

        JSR     R5,     L_5B9D                  ; 591D   0004 0158 039D

        MOVR    R4,     R3                      ; 5920   00A3
        MVII    #$00E0, R5                      ; 5921   02BD 00E0
        MVO@    R5,     R2                      ; 5923   0255

        JSR     R5,     L_5F5A                  ; 5924   0004 015C 035A

        CMP@    R3,     R2                      ; 5927   035A
        BNEQ    L_592C                          ; 5928   020C 0002

        CLRR    R1                              ; 592A   01C9
        MVO@    R1,     R3                      ; 592B   0259

L_592C:
        JSR     R5,     L_5B68                  ; 592C   0004 0158 0368
        JSR     R5,     L_5B46                  ; 592F   0004 0158 0346

        B       L_59C1                          ; 5932   0200 008D

L_5934:
        PULR    R2                              ; 5934   02B2

        JSR     R5,     L_5B46                  ; 5935   0004 0158 0346

        BNEQ    L_59C1                          ; 5938   020C 0087

        JSR     R5,     L_54BC                  ; 593A   0004 0154 00BC

        SDBD                                    ; 593D   0001
        CMPI    #$0005, R0                      ; 593E   0378 0005 0000
        BNEQ    L_59C1                          ; 5941   020C 007E

        MVI@    R2,     R3                      ; 5943   0293
        ANDI    #$001C, R3                      ; 5944   03BB 001C
        MVO     R3,     G_016B                  ; 5946   0243 016B
        SLR     R3,     2                       ; 5948   0067
        ADDR    R7,     R3                      ; 5949   00FB
        ADDI    #$01BC, R3                      ; 594A   02FB 01BC
        MVI@    R3,     R3                      ; 594C   029B

        JSR     R5,     L_5B0E                  ; 594D   0004 0158 030E

        MVI     G_016B, R3                      ; 5950   0283 016B
        SLR     R3,     2                       ; 5952   0067
        ADDR    R7,     R3                      ; 5953   00FB
        ADDI    #$01B2, R3                      ; 5954   02FB 01B2
        MVI@    R3,     R3                      ; 5956   029B
        SLR     R3,     2                       ; 5957   0067
        SLR     R3,     1                       ; 5958   0063

        JSR     R5,     L_5B0E                  ; 5959   0004 0158 030E

        B       L_59C1                          ; 595C   0200 0063

L_595E:
        JSR     R5,     L_5B46                  ; 595E   0004 0158 0346

        BNEQ    L_598D                          ; 5961   020C 002A

        JSR     R5,     L_54BC                  ; 5963   0004 0154 00BC

        SDBD                                    ; 5966   0001
        CMPI    #$0005, R0                      ; 5967   0378 0005 0000
        BNEQ    L_598D                          ; 596A   020C 0021

        MVI@    R2,     R3                      ; 596C   0293
        ANDI    #$001C, R3                      ; 596D   03BB 001C
        MVO     R3,     G_016B                  ; 596F   0243 016B

        JSR     R5,     L_5B0E                  ; 5971   0004 0158 030E

        MVI     G_016B, R3                      ; 5974   0283 016B
        SLR     R3,     2                       ; 5976   0067
        ADDR    R7,     R3                      ; 5977   00FB
        ADDI    #$018E, R3                      ; 5978   02FB 018E
        MVI@    R3,     R3                      ; 597A   029B

        JSR     R5,     L_5B0E                  ; 597B   0004 0158 030E

        MVI     G_016B, R3                      ; 597E   0283 016B
        SLR     R3,     2                       ; 5980   0067
        ADDR    R7,     R3                      ; 5981   00FB
        ADDI    #$0184, R3                      ; 5982   02FB 0184
        MVI@    R3,     R3                      ; 5984   029B
        SLR     R3,     2                       ; 5985   0067
        SLR     R3,     1                       ; 5986   0063

        JSR     R5,     L_5B0E                  ; 5987   0004 0158 030E
        JSR     R5,     L_5E5C                  ; 598A   0004 015C 025C

L_598D:
        MVI     G_0167, R0                      ; 598D   0280 0167
        CMPI    #$0002, R0                      ; 598F   0378 0002
        BEQ     L_5997                          ; 5991   0204 0004

        CMPI    #$0004, R0                      ; 5993   0378 0004
        BNEQ    L_599F                          ; 5995   020C 0008

L_5997:
        MVI@    R2,     R5                      ; 5997   0295
        ANDI    #$001F, R5                      ; 5998   03BD 001F
        ADDI    #$0020, R5                      ; 599A   02FD 0020
        MVO@    R5,     R2                      ; 599C   0255
        B       L_59C1                          ; 599D   0200 0022

L_599F:
        JSR     R5,     L_5B9D                  ; 599F   0004 0158 039D
        JSR     R5,     L_5BBB                  ; 59A2   0004 0158 03BB

        MVI     G_0324, R3                      ; 59A5   0283 0324
        MVII    #$031D, R4                      ; 59A7   02BC 031D
        MVII    #$0004, R1                      ; 59A9   02B9 0004
        CMPI    #$019B, R2                      ; 59AB   037A 019B
        BMI     L_59B4                          ; 59AD   020B 0005

        SLL     R1,     1                       ; 59AF   0049
        MVI     G_032C, R3                      ; 59B0   0283 032C
        MVII    #$0325, R4                      ; 59B2   02BC 0325
L_59B4:
        CMPR    R3,     R2                      ; 59B4   015A
        BNEQ    L_59C1                          ; 59B5   020C 000A

        MVI     G_0169, R0                      ; 59B7   0280 0169
        ANDR    R0,     R1                      ; 59B9   0181
        BEQ     L_59C1                          ; 59BA   0204 0005

        JSR     R5,     L_5698                  ; 59BC   0004 0154 0298

        INCR    R7                              ; 59BF   000F

L_59C0:
        PULR    R2                              ; 59C0   02B2
L_59C1:
        PULR    R5                              ; 59C1   02B5
        CMPI    #$019B, R2                      ; 59C2   037A 019B
        BPL     L_59C8                          ; 59C4   0203 0002

        ADDI    #$004E, R2                      ; 59C6   02FA 004E
L_59C8:
        SUBI    #$0026, R2                      ; 59C8   033A 0026
        DECR    R5                              ; 59CA   0015
        BNEQ    L_5896                          ; 59CB   022C 0136
        PULR    R7                              ; 59CD   02B7

L_59CE:
        MOVR    R2,     R3                      ; 59CE   0093
        INCR    R3                              ; 59CF   000B
        MVI@    R3,     R0                      ; 59D0   0298
        TSTR    R0                              ; 59D1   0080
        BEQ     L_59D8                          ; 59D2   0204 0004

        DECR    R0                              ; 59D4   0010
        MVO@    R0,     R3                      ; 59D5   0258
        B       L_59C1                          ; 59D6   0220 0016

L_59D8:
        PSHR    R2                              ; 59D8   0272
        SUBI    #$0173, R2                      ; 59D9   033A 0173
        SLR     R2,     1                       ; 59DB   0062
        ADDI    #$01C3, R2                      ; 59DC   02FA 01C3
        MVI@    R2,     R0                      ; 59DE   0290
        CMPI    #$00FF, R0                      ; 59DF   0378 00FF
        BEQ     L_59C0                          ; 59E1   0224 0022

        CMPI    #$00FE, R0                      ; 59E3   0378 00FE
        BEQ     L_59C0                          ; 59E5   0224 0026

        MVI     G_0317, R0                      ; 59E7   0280 0317
        MVI     G_016C, R1                      ; 59E9   0281 016C
        MVI     G_016E, R3                      ; 59EB   0283 016E
        CMPI    #$01D7, R2                      ; 59ED   037A 01D7
        BMI     L_59F7                          ; 59EF   020B 0006

        MVI     G_0318, R0                      ; 59F1   0280 0318
        MVI     G_016D, R1                      ; 59F3   0281 016D
        MVI     G_016F, R3                      ; 59F5   0283 016F
L_59F7:
        ADDR    R1,     R0                      ; 59F7   00C8
        MVI     G_0171, R1                      ; 59F8   0281 0171

        JSR     R5,     L_5FCD                  ; 59FA   0004 015C 03CD

        SUB     G_0170, R3                      ; 59FD   0303 0170
        CMPR    R1,     R3                      ; 59FF   014B
        BPL     L_59C0                          ; 5A00   0223 0041

        MVII    #$0008, R1                      ; 5A02   02B9 0008
        CLRR    R0                              ; 5A04   01C0
        MVO     R0,     G_0168                  ; 5A05   0240 0168

L_5A07:
        JSR     R5,     L_5E6B                  ; 5A07   0004 015C 026B

        BEQ     L_5A24                          ; 5A0A   0204 0018

        CMPI    #$0006, R0                      ; 5A0C   0378 0006
        BEQ     L_5A1C                          ; 5A0E   0204 000C
        BMI     L_5A14                          ; 5A10   020B 0002
        B       L_5A24                          ; 5A12   0200 0010

L_5A14:
        CMPI    #$01D7, R2                      ; 5A14   037A 01D7
        BPL     L_5A1F                          ; 5A16   0203 0007

        CMPI    #$0003, R0                      ; 5A18   0378 0003
        BGT     L_5A23                          ; 5A1A   020E 0007

L_5A1C:
        INCR    R1                              ; 5A1C   0009
        B       L_5A24                          ; 5A1D   0200 0005

L_5A1F:
        CMPI    #$0004, R0                      ; 5A1F   0378 0004
        BPL     L_5A1C                          ; 5A21   0223 0006

L_5A23:
        DECR    R1                              ; 5A23   0011
L_5A24:
        MVI     G_0168, R5                      ; 5A24   0285 0168
        SDBD                                    ; 5A26   0001
        CMPI    #$0008, R5                      ; 5A27   037D 0008 0000
        BNEQ    L_5A07                          ; 5A2A   022C 0024

        JSR     R5,     L_5FEE                  ; 5A2C   0004 015C 03EE

        SUBI    #$0009, R1                      ; 5A2F   0339 0009
        BMI     L_59C0                          ; 5A31   022B 0072

        ADDR    R7,     R1                      ; 5A33   00F9
        ADDI    #$0153, R1                      ; 5A34   02F9 0153
        CMP@    R1,     R0                      ; 5A36   0348
        BMI     L_59C0                          ; 5A37   022B 0078

        MOVR    R2,     R3                      ; 5A39   0093
        SUBI    #$01C3, R3                      ; 5A3A   033B 01C3
        SLL     R3,     1                       ; 5A3C   004B
        ADDI    #$0173, R3                      ; 5A3D   02FB 0173
        MVI@    R3,     R0                      ; 5A3F   0298
        TSTR    R0                              ; 5A40   0080
        BNEQ    L_59C0                          ; 5A41   022C 0082

        CLRR    R3                              ; 5A43   01DB

        JSR     R5,     L_5E77                  ; 5A44   0004 015C 0277

        CMPI    #$0002, R0                      ; 5A47   0378 0002
        BEQ     L_59C0                          ; 5A49   0224 008A

        CMPI    #$0004, R0                      ; 5A4B   0378 0004
        BEQ     L_59C0                          ; 5A4D   0224 008E

        JSR     R5,     L_5454                  ; 5A4F   0004 0154 0054
        JSR     R5,     L_5188                  ; 5A52   0004 0150 0188

        PULR    R2                              ; 5A55   02B2
        B       L_59C1                          ; 5A56   0220 0096

L_5A58:
        SUBI    #$0010, R2                      ; 5A58   033A 0010
        MOVR    R2,     R5                      ; 5A5A   0095
        SLL     R2,     2                       ; 5A5B   004E
        ADDR    R5,     R2                      ; 5A5C   00EA
        MVII    #$000A, R5                      ; 5A5D   02BD 000A
        ADDI    #$0173, R2                      ; 5A5F   02FA 0173
L_5A61:
        PSHR    R5                              ; 5A61   0275
        MVI@    R2,     R5                      ; 5A62   0295
        ANDI    #$00E0, R5                      ; 5A63   03BD 00E0
        BEQ     L_5AC8                          ; 5A65   0204 0061

        CMPI    #$00E0, R5                      ; 5A67   037D 00E0
        BEQ     L_5AC8                          ; 5A69   0204 005D

        JSR     R5,     L_5B68                  ; 5A6B   0004 0158 0368
        JSR     R5,     L_5F14                  ; 5A6E   0004 015C 0314
        JSR     R5,     L_5FB9                  ; 5A71   0004 015C 03B9
        JSR     R5,     L_5FE5                  ; 5A74   0004 015C 03E5

        CLRR    R4                              ; 5A77   01E4
        MVO     R4,     G_0161                  ; 5A78   0244 0161
        SDBD                                    ; 5A7A   0001
        MVII    #$5EAD, R5                      ; 5A7B   02BD 00AD 005E
L_5A7E:
        MVI@    R5,     R3                      ; 5A7E   02AB
        PSHR    R5                              ; 5A7F   0275
        PSHR    R4                              ; 5A80   0274

        JSR     R5,     L_5FDF                  ; 5A81   0004 015C 03DF
        JSR     R5,     L_5EB5                  ; 5A84   0004 015C 02B5

        TSTR    R4                              ; 5A87   00A4
        BNEQ    L_5AA7                          ; 5A88   020C 001D

        JSR     R5,     L_5F76                  ; 5A8A   0004 015C 0376
        JSR     R5,     L_5EFD                  ; 5A8D   0004 015C 02FD
        JSR     R5,     L_5FD7                  ; 5A90   0004 015C 03D7

        CMPI    #$0002, R0                      ; 5A93   0378 0002
        BEQ     L_5A9B                          ; 5A95   0204 0004

        CMPI    #$0004, R0                      ; 5A97   0378 0004
        BNEQ    L_5AA7                          ; 5A99   020C 000C

L_5A9B:
        PULR    R4                              ; 5A9B   02B4
        CMPR    R0,     R3                      ; 5A9C   0143
        BEQ     L_5AA5                          ; 5A9D   0204 0006

        MVII    #$0001, R5                      ; 5A9F   02BD 0001
        MVO     R5,     G_0161                  ; 5AA1   0245 0161
        DECR    R4                              ; 5AA3   0014
        INCR    R7                              ; 5AA4   000F

L_5AA5:
        INCR    R4                              ; 5AA5   000C
L_5AA6:
        PSHR    R4                              ; 5AA6   0274
L_5AA7:
        PULR    R4                              ; 5AA7   02B4
        PULR    R5                              ; 5AA8   02B5
        SDBD                                    ; 5AA9   0001
        CMPI    #$5EB5, R5                      ; 5AAA   037D 00B5 005E
        BNEQ    L_5A7E                          ; 5AAD   022C 0030

        MVI     G_0161, R5                      ; 5AAF   0285 0161
        TSTR    R5                              ; 5AB1   00AD
        BEQ     L_5AC8                          ; 5AB2   0204 0014

        ADDR    R7,     R4                      ; 5AB4   00FC
        ADDI    #$00E1, R4                      ; 5AB5   02FC 00E1

        JSR     R5,     L_5FEE                  ; 5AB7   0004 015C 03EE

        CMP@    R4,     R0                      ; 5ABA   0360
        BPL     L_5AC3                          ; 5ABB   0203 0006

        MVI@    R2,     R5                      ; 5ABD   0295
        ANDI    #$001F, R5                      ; 5ABE   03BD 001F
        ADDI    #$00C0, R5                      ; 5AC0   02FD 00C0
        MVO@    R5,     R2                      ; 5AC2   0255

L_5AC3:
        JSR     R5,     L_5B70                  ; 5AC3   0004 0158 0370

        XORR    R3,     R0                      ; 5AC6   01D8
        MVO@    R0,     R1                      ; 5AC7   0248
L_5AC8:
        ADDI    #$0002, R2                      ; 5AC8   02FA 0002
        PULR    R5                              ; 5ACA   02B5
        DECR    R5                              ; 5ACB   0015
        BNEQ    L_5A61                          ; 5ACC   022C 006C
        PULR    R7                              ; 5ACE   02B7

L_5ACF:
        MVII    #$0173, R2                      ; 5ACF   02BA 0173
L_5AD1:
        MVI@    R2,     R5                      ; 5AD1   0295
        ANDI    #$00E0, R5                      ; 5AD2   03BD 00E0
        CMPI    #$00C0, R5                      ; 5AD4   037D 00C0
        BNEQ    L_5AFF                          ; 5AD6   020C 0027

        JSR     R5,     L_5B9D                  ; 5AD8   0004 0158 039D

        MOVR    R2,     R4                      ; 5ADB   0094
        CLRR    R5                              ; 5ADC   01ED
        MVO@    R5,     R4                      ; 5ADD   0265
        MVII    #$0004, R0                      ; 5ADE   02B8 0004
        MVO@    R0,     R4                      ; 5AE0   0260
        MVII    #$0324, R1                      ; 5AE1   02B9 0324
        MVII    #$016E, R3                      ; 5AE3   02BB 016E
        CMPI    #$019B, R2                      ; 5AE5   037A 019B
        BMI     L_5AEC                          ; 5AE7   020B 0003

        MVII    #$032C, R1                      ; 5AE9   02B9 032C
        INCR    R3                              ; 5AEB   000B
L_5AEC:
        CMP@    R1,     R2                      ; 5AEC   034A
        BNEQ    L_5AF0                          ; 5AED   020C 0001

        MVO@    R5,     R1                      ; 5AEF   024D
L_5AF0:
        MVI@    R3,     R0                      ; 5AF0   0298
        DECR    R0                              ; 5AF1   0010
        MVO@    R0,     R3                      ; 5AF2   0258

        JSR     R5,     L_5B68                  ; 5AF3   0004 0158 0368

        CLRR    R0                              ; 5AF6   01C0

        JSR     R5,     L_54CD                  ; 5AF7   0004 0154 00CD

        PSHR    R2                              ; 5AFA   0272

        JSR     R5,     L_5170                  ; 5AFB   0004 0150 0170

        PULR    R2                              ; 5AFE   02B2
L_5AFF:
        ADDI    #$0002, R2                      ; 5AFF   02FA 0002
        CMPI    #$01C3, R2                      ; 5B01   037A 01C3
        BNEQ    L_5AD1                          ; 5B03   022C 0033
        PULR    R7                              ; 5B05   02B7

        SLR     R0,     2                       ; 5B06   0064
        INCR    R0                              ; 5B07   0008
        GSWD    R0                              ; 5B08   0030
        MOVR    R4,     R0                      ; 5B09   00A0
        SLLC    R0,     2                       ; 5B0A   005C
        ADDR    R1,     R4                      ; 5B0B   00CC
        ADDR    R6,     R4                      ; 5B0C   00F4
        MOVR    R3,     R0                      ; 5B0D   0098
L_5B0E:
        PSHR    R5                              ; 5B0E   0275
        ANDI    #$001C, R3                      ; 5B0F   03BB 001C
        MVI@    R2,     R5                      ; 5B11   0295
        ANDI    #$00E3, R5                      ; 5B12   03BD 00E3
        ADDR    R3,     R5                      ; 5B14   00DD
        MVO@    R5,     R2                      ; 5B15   0255

        JSR     R5,     L_5E5C                  ; 5B16   0004 015C 025C

        MVI     G_0162, R5                      ; 5B19   0285 0162
        TSTR    R5                              ; 5B1B   00AD
        BNEQ    L_5B3C                          ; 5B1C   020C 001E

        TSTR    R0                              ; 5B1E   0080
        BEQ     L_5B3C                          ; 5B1F   0204 001B

        CMPI    #$0006, R0                      ; 5B21   0378 0006
        BEQ     L_5B43                          ; 5B23   0204 001E

        SARC    R0,     1                       ; 5B25   0078
        BC      L_5B3C                          ; 5B26   0201 0014

        JSR     R5,     L_5F07                  ; 5B28   0004 015C 0307
        JSR     R5,     L_5499                  ; 5B2B   0004 0154 0099

        BEQ     L_5B3C                          ; 5B2E   0204 000C

        PSHR    R2                              ; 5B30   0272
        MOVR    R3,     R2                      ; 5B31   009A

        JSR     R5,     L_54BC                  ; 5B32   0004 0154 00BC

        PULR    R2                              ; 5B35   02B2
        ANDI    #$0003, R0                      ; 5B36   03B8 0003
        CMPI    #$0001, R0                      ; 5B38   0378 0001
        BEQ     L_5B43                          ; 5B3A   0204 0007

L_5B3C:
        MVI@    R2,     R5                      ; 5B3C   0295
        ANDI    #$00E3, R5                      ; 5B3D   03BD 00E3
        ADD     G_016B, R5                      ; 5B3F   02C5 016B
        MVO@    R5,     R2                      ; 5B41   0255
        PULR    R7                              ; 5B42   02B7

L_5B43:
        PULR    R0                              ; 5B43   02B0
        B       L_598D                          ; 5B44   0220 01B8

L_5B46:
        PSHR    R5                              ; 5B46   0275

        JSR     R5,     L_5B50                  ; 5B47   0004 0158 0350

        MOVR    R0,     R4                      ; 5B4A   0084
        ANDR    R3,     R0                      ; 5B4B   0198
        MVO@    R0,     R1                      ; 5B4C   0248
        COMR    R3                              ; 5B4D   001B
        ANDR    R3,     R4                      ; 5B4E   019C
        PULR    R7                              ; 5B4F   02B7

L_5B50:
        PSHR    R5                              ; 5B50   0275
        MOVR    R2,     R0                      ; 5B51   0090
        SUBI    #$0173, R0                      ; 5B52   0338 0173
        SLR     R0,     1                       ; 5B54   0060
        MVII    #$0008, R1                      ; 5B55   02B9 0008

        JSR     R5,     L_5FCD                  ; 5B57   0004 015C 03CD

        ADDI    #$0131, R1                      ; 5B5A   02F9 0131
        MVI@    R1,     R5                      ; 5B5C   028D
        MVII    #$0001, R3                      ; 5B5D   02BB 0001
L_5B5F:
        DECR    R0                              ; 5B5F   0010
        BMI     L_5B65                          ; 5B60   020B 0003

        SLL     R3,     1                       ; 5B62   004B
        B       L_5B5F                          ; 5B63   0220 0005

L_5B65:
        MOVR    R5,     R0                      ; 5B65   00A8
        COMR    R3                              ; 5B66   001B
        PULR    R7                              ; 5B67   02B7

L_5B68:
        PSHR    R5                              ; 5B68   0275

        JSR     R5,     L_5B70                  ; 5B69   0004 0158 0370

        COMR    R3                              ; 5B6C   001B
        ANDR    R3,     R0                      ; 5B6D   0198
        MVO@    R0,     R1                      ; 5B6E   0248
        PULR    R7                              ; 5B6F   02B7

L_5B70:
        PSHR    R5                              ; 5B70   0275
        MOVR    R2,     R0                      ; 5B71   0090
        SUBI    #$0173, R0                      ; 5B72   0338 0173
        SLR     R0,     1                       ; 5B74   0060
        MVII    #$0008, R1                      ; 5B75   02B9 0008

        JSR     R5,     L_5FCD                  ; 5B77   0004 015C 03CD

        ADDI    #$0136, R1                      ; 5B7A   02F9 0136
        MVI@    R1,     R5                      ; 5B7C   028D
        MVII    #$0001, R3                      ; 5B7D   02BB 0001
L_5B7F:
        DECR    R0                              ; 5B7F   0010
        BMI     L_5B85                          ; 5B80   020B 0003

        SLL     R3,     1                       ; 5B82   004B
        B       L_5B7F                          ; 5B83   0220 0005

L_5B85:
        MOVR    R5,     R0                      ; 5B85   00A8
        PULR    R7                              ; 5B86   02B7

        DECLE   $03ED,  $03D9,  $03B6,  $036B   ; 5B87   03ED 03D9 03B6 036B
        DECLE   $0339,  $02EE,  $028A,  $01F4   ; 5B8B   0339 02EE 028A 01F4
        DECLE   $03FC,  $03E8,  $03CF           ; 5B8F   03FC 03E8 03CF

        AND@    R6,     R6                      ; 5B92   03B6
        AND@    R3,     R5                      ; 5B93   039D
        CMP@    R5,     R3                      ; 5B94   036B
        SUB@    R4,     R0                      ; 5B95   0320
        XORR    R6,     R4                      ; 5B96   01F4
        CMPR    R3,     R6                      ; 5B97   015E
        ADDR    R4,     R1                      ; 5B98   00E1
        SARC    R1,     2                       ; 5B99   007D
        SLL     R3,     1                       ; 5B9A   004B
        GSWD    R2                              ; 5B9B   0032
        COMR    R1                              ; 5B9C   0019
L_5B9D:
        PSHR    R5                              ; 5B9D   0275
        PSHR    R0                              ; 5B9E   0270
        PSHR    R1                              ; 5B9F   0271
        PSHR    R4                              ; 5BA0   0274

        JSR     R5,     L_54BC                  ; 5BA1   0004 0154 00BC
        JSR     R5,     L_5FD7                  ; 5BA4   0004 015C 03D7

        INCR    R3                              ; 5BA7   000B
        ANDI    #$0003, R0                      ; 5BA8   03B8 0003
        SUBI    #$0001, R0                      ; 5BAA   0338 0001
        BMI     L_5BB4                          ; 5BAC   020B 0006
        BGT     L_5BB3                          ; 5BAE   020E 0003

        MVII    #$0006, R3                      ; 5BB0   02BB 0006
        INCR    R7                              ; 5BB2   000F

L_5BB3:
        CLRR    R3                              ; 5BB3   01DB

L_5BB4:
        JSR     R5,     L_5EDE                  ; 5BB4   0004 015C 02DE

        PULR    R4                              ; 5BB7   02B4
        PULR    R1                              ; 5BB8   02B1
        PULR    R0                              ; 5BB9   02B0
        PULR    R7                              ; 5BBA   02B7

L_5BBB:
        PSHR    R5                              ; 5BBB   0275

        JSR     R5,     L_5F07                  ; 5BBC   0004 015C 0307

        MOVR    R0,     R1                      ; 5BBF   0081
        MOVR    R2,     R3                      ; 5BC0   0093
        MVII    #$0334, R2                      ; 5BC1   02BA 0334

L_5BC3:
        JSR     R5,     L_5F14                  ; 5BC3   0004 015C 0314

        CMPR    R0,     R1                      ; 5BC6   0141
        BNEQ    L_5BDA                          ; 5BC7   020C 0011

        CMPI    #$019B, R3                      ; 5BC9   037B 019B
        BMI     L_5BD3                          ; 5BCB   020B 0006

        CMPI    #$033C, R2                      ; 5BCD   037A 033C
        BMI     L_5BD7                          ; 5BCF   020B 0006
        B       L_5BDA                          ; 5BD1   0200 0007

L_5BD3:
        CMPI    #$033C, R2                      ; 5BD3   037A 033C
        BMI     L_5BDA                          ; 5BD5   020B 0003

L_5BD7:
        JSR     R5,     L_5481                  ; 5BD7   0004 0154 0081

L_5BDA:
        ADDI    #$0008, R2                      ; 5BDA   02FA 0008
        CMPI    #$0344, R2                      ; 5BDC   037A 0344
        BMI     L_5BC3                          ; 5BDE   022B 001C

        MOVR    R3,     R2                      ; 5BE0   009A
        MVI     G_0167, R0                      ; 5BE1   0280 0167
        TSTR    R0                              ; 5BE3   0080
        BNEQ    L_5C93                          ; 5BE4   020C 00AD

        JSR     R5,     L_5F07                  ; 5BE6   0004 015C 0307

        PSHR    R2                              ; 5BE9   0272

        JSR     R5,     L_5E4C                  ; 5BEA   0004 015C 024C

        PULR    R4                              ; 5BED   02B4
        MVII    #$0002, R3                      ; 5BEE   02BB 0002
        CMPI    #$019B, R4                      ; 5BF0   037C 019B
        BMI     L_5C84                          ; 5BF2   020B 0090

        CMPI    #$01D7, R2                      ; 5BF4   037A 01D7
        BPL     L_5C8A                          ; 5BF6   0203 0092

        SLL     R3,     1                       ; 5BF8   004B
        MVII    #$01EB, R1                      ; 5BF9   02B9 01EB
L_5BFB:
        CMPI    #$01C3, R2                      ; 5BFB   037A 01C3
        BNEQ    L_5C69                          ; 5BFD   020C 006A

L_5BFF:
        PSHR    R4                              ; 5BFF   0274

        JSR     R5,     L_5EDE                  ; 5C00   0004 015C 02DE

        PULR    R2                              ; 5C03   02B2
        CLRR    R0                              ; 5C04   01C0
        CLRR    R1                              ; 5C05   01C9
L_5C06:
        PSHR    R0                              ; 5C06   0270
        PSHR    R1                              ; 5C07   0271

        JSR     R5,     L_5FE5                  ; 5C08   0004 015C 03E5
        JSR     R5,     L_5F76                  ; 5C0B   0004 015C 0376
        JSR     R5,     L_5EFD                  ; 5C0E   0004 015C 02FD
        JSR     R5,     L_5FD7                  ; 5C11   0004 015C 03D7

        INCR    R3                              ; 5C14   000B
        CMPR    R3,     R0                      ; 5C15   0158
        BEQ     L_5C21                          ; 5C16   0204 0009

        SARC    R0,     1                       ; 5C18   0078
        BNC     L_5C21                          ; 5C19   0209 0006

        TSTR    R0                              ; 5C1B   0080
        BEQ     L_5C21                          ; 5C1C   0204 0003

        JSR     R5,     L_5EEE                  ; 5C1E   0004 015C 02EE

L_5C21:
        PULR    R1                              ; 5C21   02B1
        PULR    R0                              ; 5C22   02B0
        INCR    R0                              ; 5C23   0008
        CMPI    #$0028, R0                      ; 5C24   0378 0028
        BNEQ    L_5C06                          ; 5C26   022C 0021

        CLRR    R0                              ; 5C28   01C0
        INCR    R1                              ; 5C29   0009
        CMPI    #$0018, R1                      ; 5C2A   0379 0018
        BNEQ    L_5C06                          ; 5C2C   022C 0027

        SDBD                                    ; 5C2E   0001
        MVII    #$1906, R0                      ; 5C2F   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5C32   0240 035D
        MVII    #$0005, R4                      ; 5C34   02BC 0005
        SDBD                                    ; 5C36   0001
        MVII    #$583C, R1                      ; 5C37   02B9 003C 0058

L_5C3A:
        JSR     R5,     X_TIMER_STOP            ; 5C3A   0004 0118 0038

        ADDI    #$0004, R1                      ; 5C3D   02F9 0004
        DECR    R4                              ; 5C3F   0014
        BNEQ    L_5C3A                          ; 5C40   022C 0007

        MVII    #$0321, R2                      ; 5C42   02BA 0321
        CLRR    R0                              ; 5C44   01C0
        MVO@    R0,     R2                      ; 5C45   0250
        ADDI    #$0008, R2                      ; 5C46   02FA 0008
        MVO@    R0,     R2                      ; 5C48   0250
        PULR    R0                              ; 5C49   02B0
        PULR    R0                              ; 5C4A   02B0

        JSR     R5,     X_PLAY_MUS2             ; 5C4B   0004 0118 035D
        DECLE   $002A                           ; 5C4E  Note (short)
        DECLE   $002D                           ; 5C4F  Note (short)
        DECLE   $0022                           ; 5C50  Note (short)
        DECLE   $007F                           ; 5C51  Note (short)
        DECLE   $0077                           ; 5C52  Note (short)
        DECLE   $009F                           ; 5C53  Note (short)
        DECLE   $0097                           ; 5C54  Note (short)
        DECLE   $03F4,  $00E6                   ; 5C55  Note (long)
        DECLE   $00BA                           ; 5C57  Note (short)
        DECLE   $007D                           ; 5C58  Note (short)
        DECLE   $007A                           ; 5C59  Note (short)
        DECLE   $00BD                           ; 5C5A  Note (short)
        DECLE   $0072                           ; 5C5B  Note (short)
        DECLE   $004F                           ; 5C5C  Note (short)
        DECLE   $03F4,  $00CF                   ; 5C5D  Note (long)
        DECLE   $009D                           ; 5C5F  Note (short)
        DECLE   $006A                           ; 5C60  Note (short)
        DECLE   $03F4,  $0073                   ; 5C61  Note (long)
        DECLE   $0000                           ; 5C63  End of music

        JSR     R5,     X_PLAY_SFX2             ; 5C64   0004 0118 03BE
        DECLE   $00FF                           ; 5C67  SFX prio
        DECLE   $02CF                           ; 5C68  SFX end

L_5C69:
        CMPI    #$01D7, R2                      ; 5C69   037A 01D7
        BEQ     L_5BFF                          ; 5C6B   0224 006D

        MVII    #$00FE, R5                      ; 5C6D   02BD 00FE
        MVO@    R5,     R2                      ; 5C6F   0255
        PSHR    R4                              ; 5C70   0274
        SUBI    #$01C3, R2                      ; 5C71   033A 01C3
        CMP@    R1,     R2                      ; 5C73   034A
        BEQ     L_5C7A                          ; 5C74   0204 0004

        INCR    R1                              ; 5C76   0009
        CMP@    R1,     R2                      ; 5C77   034A
        BNEQ    L_5C7C                          ; 5C78   020C 0002

L_5C7A:
        INCR    R5                              ; 5C7A   000D
        MVO@    R5,     R1                      ; 5C7B   024D

L_5C7C:
        JSR     R5,     L_5165                  ; 5C7C   0004 0150 0165

        PULR    R2                              ; 5C7F   02B2
        MVII    #$0080, R5                      ; 5C80   02BD 0080
        B       L_5CB0                          ; 5C82   0200 002C

L_5C84:
        MVII    #$01ED, R1                      ; 5C84   02B9 01ED
        CMPI    #$01D7, R2                      ; 5C86   037A 01D7
        BPL     L_5BFB                          ; 5C88   0223 008E

L_5C8A:
        MOVR    R4,     R2                      ; 5C8A   00A2
        SDBD                                    ; 5C8B   0001
        MVII    #$0006, R0                      ; 5C8C   02B8 0006 0000
        MVII    #$0040, R5                      ; 5C8F   02BD 0040
        B       L_5CB4                          ; 5C91   0200 0021

L_5C93:
        JSR     R5,     L_5FD7                  ; 5C93   0004 015C 03D7

        INCR    R3                              ; 5C96   000B
        CMPI    #$0006, R0                      ; 5C97   0378 0006
        BNEQ    L_5CA3                          ; 5C99   020C 0008

        SDBD                                    ; 5C9B   0001
        MVII    #$0005, R0                      ; 5C9C   02B8 0005 0000
        MVII    #$0020, R5                      ; 5C9F   02BD 0020
        B       L_5CB4                          ; 5CA1   0200 0011
L_5CA3:
        BMI     L_5CA9                          ; 5CA3   020B 0004

        MVII    #$0060, R5                      ; 5CA5   02BD 0060
        B       L_5CB0                          ; 5CA7   0200 0007

L_5CA9:
        MVII    #$0080, R5                      ; 5CA9   02BD 0080
        CMPR    R0,     R3                      ; 5CAB   0143
        BNEQ    L_5CB0                          ; 5CAC   020C 0002

        MVII    #$0040, R5                      ; 5CAE   02BD 0040
L_5CB0:
        SDBD                                    ; 5CB0   0001
        MVII    #$0004, R0                      ; 5CB1   02B8 0004 0000
L_5CB4:
        MVI@    R2,     R4                      ; 5CB4   0294
        ANDI    #$001F, R4                      ; 5CB5   03BC 001F
        XORR    R5,     R4                      ; 5CB7   01EC
        MVO@    R4,     R2                      ; 5CB8   0254

        JSR     R5,     L_54CD                  ; 5CB9   0004 0154 00CD
        JSR     R5,     L_5FD7                  ; 5CBC   0004 015C 03D7
        JSR     R5,     L_5EEE                  ; 5CBF   0004 015C 02EE

        J       L_5ED8                          ; 5CC2   0004 035C 02D8

L_5CC5:
        PSHR    R5                              ; 5CC5   0275
        MVII    #$0344, R2                      ; 5CC6   02BA 0344
L_5CC8:
        MVI@    R2,     R0                      ; 5CC8   0290
        SWAP    R0,     2                       ; 5CC9   0044
        BEQ     L_5CE0                          ; 5CCA   0204 0014

        MVI@    R2,     R5                      ; 5CCC   0295
        SDBD                                    ; 5CCD   0001
        ANDI    #$FFBF, R5                      ; 5CCE   03BD 00BF 00FF
        MVO@    R5,     R2                      ; 5CD1   0255
        ANDI    #$0020, R0                      ; 5CD2   03B8 0020
        BEQ     L_5D30                          ; 5CD4   0204 005A

        JSR     R5,     L_5E5C                  ; 5CD6   0004 015C 025C

        BNEQ    L_5D30                          ; 5CD9   020C 0055

        JSR     R5,     L_5ED7                  ; 5CDB   0004 015C 02D7

        B       L_5D30                          ; 5CDE   0200 0050

L_5CE0:
        JSR     R5,     L_5FEE                  ; 5CE0   0004 015C 03EE

        CMPI    #$0019, R0                      ; 5CE3   0378 0019
        BPL     L_5D30                          ; 5CE5   0203 0049

        MOVR    R2,     R4                      ; 5CE7   0094
        SUBI    #$0006, R4                      ; 5CE8   033C 0006
        MVI@    R4,     R4                      ; 5CEA   02A4
        TSTR    R4                              ; 5CEB   00A4
        BNEQ    L_5D30                          ; 5CEC   020C 0042

        MOVR    R2,     R3                      ; 5CEE   0093
        SUBI    #$0344, R3                      ; 5CEF   033B 0344
        SLR     R3,     2                       ; 5CF1   0067
        SLR     R3,     1                       ; 5CF2   0063
        ADDI    #$01EB, R3                      ; 5CF3   02FB 01EB
        MVI@    R3,     R3                      ; 5CF5   029B
        CMPI    #$00FF, R3                      ; 5CF6   037B 00FF
        BEQ     L_5D30                          ; 5CF8   0204 0036

        ADDI    #$01C3, R3                      ; 5CFA   02FB 01C3
        PSHR    R2                              ; 5CFC   0272
        MOVR    R3,     R2                      ; 5CFD   009A

        JSR     R5,     L_5749                  ; 5CFE   0004 0154 0349

        PULR    R2                              ; 5D01   02B2

        JSR     R5,     L_5F07                  ; 5D02   0004 015C 0307
        JSR     R5,     L_5F5A                  ; 5D05   0004 015C 035A

        MOVR    R2,     R5                      ; 5D08   0095
        SUBI    #$0007, R5                      ; 5D09   033D 0007
        SDBD                                    ; 5D0B   0001
        MVII    #$9852, R0                      ; 5D0C   02B8 0052 0098
        CMPI    #$0354, R2                      ; 5D0F   037A 0354
        BMI     L_5D14                          ; 5D11   020B 0001

        DECR    R0                              ; 5D13   0010
L_5D14:
        MVII    #$0002, R1                      ; 5D14   02B9 0002
        SWAP    R1,     1                       ; 5D16   0041
        CMPI    #$034C, R2                      ; 5D17   037A 034C
        BNEQ    L_5D1C                          ; 5D19   020C 0001

        ADDR    R1,     R0                      ; 5D1B   00C8
L_5D1C:
        CMPI    #$035C, R2                      ; 5D1C   037A 035C
        BNEQ    L_5D21                          ; 5D1E   020C 0001

        ADDR    R1,     R0                      ; 5D20   00C8
L_5D21:
        MVO@    R0,     R5                      ; 5D21   0268
        SDBD                                    ; 5D22   0001
        MVII    #$5342, R0                      ; 5D23   02B8 0042 0053
        MVO@    R0,     R5                      ; 5D26   0268
        MVI@    R2,     R1                      ; 5D27   0291
        ADDI    #$0080, R1                      ; 5D28   02F9 0080
        MVO@    R1,     R2                      ; 5D2A   0251
        PSHR    R2                              ; 5D2B   0272

        JSR     R5,     L_517D                  ; 5D2C   0004 0150 017D

        PULR    R2                              ; 5D2F   02B2
L_5D30:
        ADDI    #$0008, R2                      ; 5D30   02FA 0008
        CMPI    #$0364, R2                      ; 5D32   037A 0364
        BNEQ    L_5CC8                          ; 5D34   022C 006D

        MVI     G_0172, R1                      ; 5D36   0281 0172
        SUBI    #$0002, R1                      ; 5D38   0339 0002
        MVO     R1,     G_0172                  ; 5D3A   0241 0172
        BPL     L_5D4A                          ; 5D3C   0203 000C

        MVI     G_0170, R1                      ; 5D3E   0281 0170
        DECR    R1                              ; 5D40   0011
        BMI     L_5D4A                          ; 5D41   020B 0007

        MVO     R1,     G_0170                  ; 5D43   0241 0170
        MVI     G_0171, R2                      ; 5D45   0282 0171
        SUBR    R1,     R2                      ; 5D47   010A
        MVO     R2,     G_0171                  ; 5D48   0242 0171
L_5D4A:
        PULR    R7                              ; 5D4A   02B7

L_5D4B:
        PSHR    R5                              ; 5D4B   0275
        MVI     G_015E, R0                      ; 5D4C   0280 015E
        INCR    R0                              ; 5D4E   0008
        CMPI    #$0030, R0                      ; 5D4F   0378 0030
        BNEQ    L_5D54                          ; 5D51   020C 0001

        CLRR    R0                              ; 5D53   01C0
L_5D54:
        MVO     R0,     G_015E                  ; 5D54   0240 015E
        SARC    R0,     1                       ; 5D56   0078
        BC      L_5D99                          ; 5D57   0201 0040

        MVII    #$0173, R2                      ; 5D59   02BA 0173
L_5D5B:
        MVI@    R2,     R0                      ; 5D5B   0290
        TSTR    R0                              ; 5D5C   0080
        BEQ     L_5D75                          ; 5D5D   0204 0016

        JSR     R5,     L_5B70                  ; 5D5F   0004 0158 0370

        ANDR    R0,     R3                      ; 5D62   0183
        BEQ     L_5D75                          ; 5D63   0204 0010

        MVI     G_015E, R0                      ; 5D65   0280 015E
        SARC    R0,     2                       ; 5D67   007C
        BNOV    L_5D6F                          ; 5D68   020A 0005

        JSR     R5,     L_5B9D                  ; 5D6A   0004 0158 039D

        B       L_5D75                          ; 5D6D   0200 0006

L_5D6F:
        JSR     R5,     L_5FD7                  ; 5D6F   0004 015C 03D7
        JSR     R5,     L_5EDE                  ; 5D72   0004 015C 02DE

L_5D75:
        ADDI    #$0002, R2                      ; 5D75   02FA 0002
        CMPI    #$01C3, R2                      ; 5D77   037A 01C3
        BNEQ    L_5D5B                          ; 5D79   022C 001F

        MVII    #$0344, R2                      ; 5D7B   02BA 0344
L_5D7D:
        MOVR    R2,     R3                      ; 5D7D   0093
        SUBI    #$0007, R3                      ; 5D7E   033B 0007
        MVI@    R3,     R4                      ; 5D80   029C
        SDBD                                    ; 5D81   0001
        MVII    #$EFFF, R1                      ; 5D82   02B9 00FF 00EF
        ANDR    R1,     R4                      ; 5D85   018C
        MVI@    R2,     R5                      ; 5D86   0295
        ANDI    #$0040, R5                      ; 5D87   03BD 0040
        BEQ     L_5D90                          ; 5D89   0204 0005

        MVI     G_015E, R0                      ; 5D8B   0280 015E
        SARC    R0,     2                       ; 5D8D   007C
        BOV     L_5D92                          ; 5D8E   0202 0002

L_5D90:
        COMR    R1                              ; 5D90   0019
        XORR    R1,     R4                      ; 5D91   01CC
L_5D92:
        MVO@    R4,     R3                      ; 5D92   025C
        ADDI    #$0008, R2                      ; 5D93   02FA 0008
        CMPI    #$0364, R2                      ; 5D95   037A 0364
        BMI     L_5D7D                          ; 5D97   022B 001B

L_5D99:
        MVI     G_0324, R2                      ; 5D99   0282 0324
        MVII    #$0002, R1                      ; 5D9B   02B9 0002
L_5D9D:
        TSTR    R2                              ; 5D9D   0092
        BEQ     L_5DE7                          ; 5D9E   0204 0047

        MVI@    R2,     R5                      ; 5DA0   0295
        TSTR    R5                              ; 5DA1   00AD
        BEQ     L_5DE7                          ; 5DA2   0204 0043

        CMPI    #$031D, R2                      ; 5DA4   037A 031D
        BPL     L_5DC2                          ; 5DA6   0203 001A

        PSHR    R1                              ; 5DA8   0271

        JSR     R5,     L_5B70                  ; 5DA9   0004 0158 0370

        PULR    R1                              ; 5DAC   02B1
        ANDR    R3,     R0                      ; 5DAD   0198
        BNEQ    L_5DE7                          ; 5DAE   020C 0037

        MVI     G_015E, R0                      ; 5DB0   0280 015E
        SARC    R0,     1                       ; 5DB2   0078
        BNC     L_5DBA                          ; 5DB3   0209 0005

        JSR     R5,     L_5B9D                  ; 5DB5   0004 0158 039D

        B       L_5DE7                          ; 5DB8   0200 002D

L_5DBA:
        JSR     R5,     L_5FD7                  ; 5DBA   0004 015C 03D7
        JSR     R5,     L_5EDE                  ; 5DBD   0004 015C 02DE

        B       L_5DE7                          ; 5DC0   0200 0025

L_5DC2:
        MVII    #$0001, R4                      ; 5DC2   02BC 0001
        MVI@    R2,     R5                      ; 5DC4   0295
        ANDI    #$0040, R5                      ; 5DC5   03BD 0040
        CMPI    #$0344, R2                      ; 5DC7   037A 0344
        BMI     L_5DD0                          ; 5DC9   020B 0005

        TSTR    R5                              ; 5DCB   00AD
        BNEQ    L_5DE7                          ; 5DCC   020C 0019
        B       L_5DD4                          ; 5DCE   0200 0004

L_5DD0:
        TSTR    R5                              ; 5DD0   00AD
        BEQ     L_5DD4                          ; 5DD1   0204 0001

        CLRR    R4                              ; 5DD3   01E4
L_5DD4:
        SUBI    #$0007, R2                      ; 5DD4   033A 0007
        MVI@    R2,     R5                      ; 5DD6   0295
        SDBD                                    ; 5DD7   0001
        ANDI    #$EFFF, R5                      ; 5DD8   03BD 00FF 00EF
        MVI     G_015E, R0                      ; 5DDB   0280 015E
        ADDR    R4,     R7                      ; 5DDD   00E7

        SARC    R0,     1                       ; 5DDE   0078
        SARC    R0,     1                       ; 5DDF   0078
        BNC     L_5DE6                          ; 5DE0   0209 0004

        SDBD                                    ; 5DE2   0001
        XORI    #$1000, R5                      ; 5DE3   03FD 0000 0010
L_5DE6:
        MVO@    R5,     R2                      ; 5DE6   0255
L_5DE7:
        MVI     G_032C, R2                      ; 5DE7   0282 032C
        DECR    R1                              ; 5DE9   0011
        BNEQ    L_5D9D                          ; 5DEA   022C 004E

        MVI     G_015E, R1                      ; 5DEC   0281 015E
        SUBI    #$0010, R1                      ; 5DEE   0339 0010
        BMI     L_5E2B                          ; 5DF0   020B 0039
        BGT     L_5DF8                          ; 5DF2   020E 0004

        MVO     R1,     G_0317                  ; 5DF4   0241 0317
        MVO     R1,     G_0318                  ; 5DF6   0241 0318
L_5DF8:
        CMPI    #$0018, R1                      ; 5DF8   0379 0018
        BPL     L_5E2B                          ; 5DFA   0203 002F

        CLRR    R0                              ; 5DFC   01C0
        PSHR    R0                              ; 5DFD   0270
        PSHR    R0                              ; 5DFE   0270

L_5DFF:
        JSR     R5,     L_5FE5                  ; 5DFF   0004 015C 03E5
        JSR     R5,     L_5F76                  ; 5E02   0004 015C 0376
        JSR     R5,     L_5EFD                  ; 5E05   0004 015C 02FD

        SLR     R0,     1                       ; 5E08   0060
        BEQ     L_5E19                          ; 5E09   0204 000E

        CMPI    #$0002, R0                      ; 5E0B   0378 0002
        BGT     L_5E19                          ; 5E0D   020E 000A

        PULR    R1                              ; 5E0F   02B1
        PULR    R2                              ; 5E10   02B2
        DECR    R0                              ; 5E11   0010
        SLL     R0,     1                       ; 5E12   0048
        ADDR    R0,     R7                      ; 5E13   00C7

        INCR    R1                              ; 5E14   0009
        INCR    R7                              ; 5E15   000F

        INCR    R2                              ; 5E16   000A
L_5E17:
        PSHR    R2                              ; 5E17   0272
        PSHR    R1                              ; 5E18   0271

L_5E19:
        JSR     R5,     L_5FDF                  ; 5E19   0004 015C 03DF

        INCR    R0                              ; 5E1C   0008
        CMPI    #$0028, R0                      ; 5E1D   0378 0028
        BMI     L_5DFF                          ; 5E1F   022B 0021

        PULR    R0                              ; 5E21   02B0
        PULR    R1                              ; 5E22   02B1
        ADD     G_0317, R0                      ; 5E23   02C0 0317
        ADD     G_0318, R1                      ; 5E25   02C1 0318
        MVO     R0,     G_0317                  ; 5E27   0240 0317
        MVO     R1,     G_0318                  ; 5E29   0241 0318
L_5E2B:
        PULR    R7                              ; 5E2B   02B7

L_5E2C:
        PSHR    R5                              ; 5E2C   0275
        PSHR    R0                              ; 5E2D   0270
        PSHR    R1                              ; 5E2E   0271
        MOVR    R2,     R1                      ; 5E2F   0091
        MVII    #$0173, R2                      ; 5E30   02BA 0173
L_5E32:
        MVI@    R2,     R5                      ; 5E32   0295
        ANDI    #$00E0, R5                      ; 5E33   03BD 00E0
        CMPI    #$00E0, R5                      ; 5E35   037D 00E0
        BNEQ    L_5E3F                          ; 5E37   020C 0006

        JSR     R5,     L_5F14                  ; 5E39   0004 015C 0314

        CMPR    R0,     R1                      ; 5E3C   0141
        BEQ     L_5E45                          ; 5E3D   0204 0006

L_5E3F:
        ADDI    #$0002, R2                      ; 5E3F   02FA 0002
        CMPI    #$01C3, R2                      ; 5E41   037A 01C3
        BNEQ    L_5E32                          ; 5E43   022C 0012

L_5E45:
        MOVR    R2,     R3                      ; 5E45   0093
        MOVR    R1,     R2                      ; 5E46   008A
        CMPI    #$01C3, R3                      ; 5E47   037B 01C3
        PULR    R1                              ; 5E49   02B1
        PULR    R0                              ; 5E4A   02B0
        PULR    R7                              ; 5E4B   02B7

L_5E4C:
        PSHR    R5                              ; 5E4C   0275
        MVII    #$01C3, R2                      ; 5E4D   02BA 01C3
        MOVR    R0,     R3                      ; 5E4F   0083

L_5E50:
        JSR     R5,     L_5F14                  ; 5E50   0004 015C 0314

        CMPR    R0,     R3                      ; 5E53   0143
        BEQ     L_5E5B                          ; 5E54   0204 0005

        INCR    R2                              ; 5E56   000A
        CMPI    #$01EB, R2                      ; 5E57   037A 01EB
        BNEQ    L_5E50                          ; 5E59   022C 000A
L_5E5B:
        PULR    R7                              ; 5E5B   02B7

L_5E5C:
        PSHR    R5                              ; 5E5C   0275

        JSR     R5,     L_5E98                  ; 5E5D   0004 015C 0298
        JSR     R5,     L_5F76                  ; 5E60   0004 015C 0376
        JSR     R5,     L_5EFD                  ; 5E63   0004 015C 02FD

        MVO     R0,     G_0167                  ; 5E66   0240 0167
        CMPI    #$0001, R0                      ; 5E68   0378 0001
        PULR    R7                              ; 5E6A   02B7

L_5E6B:
        MVI     G_0168, R4                      ; 5E6B   0284 0168
        ADDR    R7,     R4                      ; 5E6D   00FC
        ADDI    #$003F, R4                      ; 5E6E   02FC 003F
        MVI@    R4,     R3                      ; 5E70   02A3
        SDBD                                    ; 5E71   0001
        SUBI    #$5EAD, R4                      ; 5E72   033C 00AD 005E
        MVO     R4,     G_0168                  ; 5E75   0244 0168
L_5E77:
        PSHR    R5                              ; 5E77   0275
        PSHR    R1                              ; 5E78   0271

        JSR     R5,     L_5F14                  ; 5E79   0004 015C 0314
        JSR     R5,     L_5FB9                  ; 5E7C   0004 015C 03B9
        JSR     R5,     L_5EB5                  ; 5E7F   0004 015C 02B5

        TSTR    R4                              ; 5E82   00A4
        BNEQ    L_5E93                          ; 5E83   020C 000E

        JSR     R5,     L_5FE5                  ; 5E85   0004 015C 03E5
        JSR     R5,     L_5F76                  ; 5E88   0004 015C 0376
        JSR     R5,     L_5EFD                  ; 5E8B   0004 015C 02FD
        JSR     R5,     L_5FD7                  ; 5E8E   0004 015C 03D7

        INCR    R3                              ; 5E91   000B
        INCR    R7                              ; 5E92   000F

L_5E93:
        CLRR    R3                              ; 5E93   01DB
L_5E94:
        CMPI    #$0001, R0                      ; 5E94   0378 0001
        PULR    R1                              ; 5E96   02B1
        PULR    R7                              ; 5E97   02B7

L_5E98:
        PSHR    R5                              ; 5E98   0275

        JSR     R5,     L_5F14                  ; 5E99   0004 015C 0314
        JSR     R5,     L_5FB9                  ; 5E9C   0004 015C 03B9

        MVI@    R2,     R3                      ; 5E9F   0293
        ANDI    #$001C, R3                      ; 5EA0   03BB 001C
        SLR     R3,     2                       ; 5EA2   0067
        ADDR    R7,     R3                      ; 5EA3   00FB
        ADDI    #$0009, R3                      ; 5EA4   02FB 0009
        MVI@    R3,     R3                      ; 5EA6   029B

        JSR     R5,     L_5EB5                  ; 5EA7   0004 015C 02B5
        JSR     R5,     L_5FE6                  ; 5EAA   0004 015C 03E6

        MOVR    R2,     R5                      ; 5EAD   0095
        MOVR    R0,     R1                      ; 5EAE   0081
        MOVR    R5,     R1                      ; 5EAF   00A9
        DECR    R4                              ; 5EB0   0014
        ADCR    R0                              ; 5EB1   0028
        RLC     R2,     2                       ; 5EB2   0056
        SWAP    R2,     1                       ; 5EB3   0042
        SAR     R2,     1                       ; 5EB4   006A
L_5EB5:
        CLRR    R4                              ; 5EB5   01E4
        SARC    R3,     2                       ; 5EB6   007F
        BNC     L_5EBD                          ; 5EB7   0209 0004

        TSTR    R1                              ; 5EB9   0089
        BEQ     L_5ED3                          ; 5EBA   0204 0017

        DECR    R1                              ; 5EBC   0011
L_5EBD:
        BNOV    L_5EC4                          ; 5EBD   020A 0005

        CMPI    #$0017, R1                      ; 5EBF   0379 0017
        BEQ     L_5ED3                          ; 5EC1   0204 0010

        INCR    R1                              ; 5EC3   0009
L_5EC4:
        SARC    R3,     2                       ; 5EC4   007F
        BNC     L_5ECB                          ; 5EC5   0209 0004

        TSTR    R0                              ; 5EC7   0080
        BEQ     L_5ED3                          ; 5EC8   0204 0009

        DECR    R0                              ; 5ECA   0010
L_5ECB:
        BNOV    L_5ED2                          ; 5ECB   020A 0005

        CMPI    #$0027, R0                      ; 5ECD   0378 0027
        BEQ     L_5ED3                          ; 5ECF   0204 0002

        INCR    R0                              ; 5ED1   0008
L_5ED2:
        INCR    R7                              ; 5ED2   000F

L_5ED3:
        INCR    R4                              ; 5ED3   000C
L_5ED4:
        MVO     R4,     G_0162                  ; 5ED4   0244 0162
        MOVR    R5,     R7                      ; 5ED6   00AF

L_5ED7:
        PSHR    R5                              ; 5ED7   0275

L_5ED8:
        JSR     R5,     L_5F07                  ; 5ED8   0004 015C 0307
        JSR     R5,     L_5F5B                  ; 5EDB   0004 015C 035B

L_5EDE:
        PSHR    R5                              ; 5EDE   0275
L_5EDF:
        PSHR    R1                              ; 5EDF   0271

        JSR     R5,     L_5F14                  ; 5EE0   0004 015C 0314
        JSR     R5,     L_5FB9                  ; 5EE3   0004 015C 03B9
        JSR     R5,     L_5F76                  ; 5EE6   0004 015C 0376
        JSR     R5,     L_5F97                  ; 5EE9   0004 015C 0397

        PULR    R1                              ; 5EEC   02B1
        PULR    R7                              ; 5EED   02B7

L_5EEE:
        PSHR    R5                              ; 5EEE   0275
        PSHR    R1                              ; 5EEF   0271
        PSHR    R4                              ; 5EF0   0274

        JSR     R5,     L_5FDF                  ; 5EF1   0004 015C 03DF
        JSR     R5,     L_5F76                  ; 5EF4   0004 015C 0376
        JSR     R5,     L_5F97                  ; 5EF7   0004 015C 0397

        PULR    R4                              ; 5EFA   02B4
        PULR    R1                              ; 5EFB   02B1
        PULR    R7                              ; 5EFC   02B7

L_5EFD:
        DECR    R4                              ; 5EFD   0014
        BMI     L_5F04                          ; 5EFE   020B 0004

        SLR     R0,     2                       ; 5F00   0064
        SLR     R0,     1                       ; 5F01   0060
        B       L_5EFD                          ; 5F02   0220 0006

L_5F04:
        ANDI    #$0007, R0                      ; 5F04   03B8 0007
        MOVR    R5,     R7                      ; 5F06   00AF

L_5F07:
        PSHR    R5                              ; 5F07   0275

        JSR     R5,     L_5FDF                  ; 5F08   0004 015C 03DF

        INCR    R7                              ; 5F0B   000F

L_5F0C:
        PSHR    R5                              ; 5F0C   0275
L_5F0D:
        SLL     R1,     1                       ; 5F0D   0049
        SLL     R1,     2                       ; 5F0E   004D
        MOVR    R1,     R5                      ; 5F0F   008D
        SLL     R1,     2                       ; 5F10   004D
        ADDR    R5,     R1                      ; 5F11   00E9
        ADDR    R1,     R0                      ; 5F12   00C8
        PULR    R7                              ; 5F13   02B7

L_5F14:
        PSHR    R5                              ; 5F14   0275
        MVI@    R2,     R0                      ; 5F15   0290
        SWAP    R0,     1                       ; 5F16   0040
        CMPI    #$031D, R2                      ; 5F17   037A 031D
        BPL     L_5F4A                          ; 5F19   0203 002F

        CMPI    #$01C3, R2                      ; 5F1B   037A 01C3
        BMI     L_5F47                          ; 5F1D   020B 0028

        PSHR    R4                              ; 5F1F   0274
        PSHR    R1                              ; 5F20   0271
        MVI@    R2,     R1                      ; 5F21   0291
        ADDI    #$0200, R1                      ; 5F22   02F9 0200
        MVI@    R1,     R0                      ; 5F24   0288
        RLC     R0,     1                       ; 5F25   0050
        RLC     R0,     1                       ; 5F26   0050
        RLC     R0,     1                       ; 5F27   0050
        ANDI    #$0003, R0                      ; 5F28   03B8 0003
        MOVR    R0,     R4                      ; 5F2A   0084
        SUBI    #$0200, R1                      ; 5F2B   0339 0200
        MOVR    R1,     R0                      ; 5F2D   0088
        MVII    #$0014, R1                      ; 5F2E   02B9 0014

        JSR     R5,     L_5FCD                  ; 5F30   0004 015C 03CD

        SLL     R0,     1                       ; 5F33   0048
        SLL     R1,     1                       ; 5F34   0049

        JSR     R5,     L_5F0C                  ; 5F35   0004 015C 030C

        DECR    R4                              ; 5F38   0014
        BMI     L_5F44                          ; 5F39   020B 0009
        BEQ     L_5F43                          ; 5F3B   0204 0006

        DECR    R4                              ; 5F3D   0014
        BEQ     L_5F41                          ; 5F3E   0204 0001

        INCR    R0                              ; 5F40   0008
L_5F41:
        ADDI    #$0027, R0                      ; 5F41   02F8 0027
L_5F43:
        INCR    R0                              ; 5F43   0008
L_5F44:
        PULR    R1                              ; 5F44   02B1
        PULR    R4                              ; 5F45   02B4
        PULR    R7                              ; 5F46   02B7

L_5F47:
        INCR    R2                              ; 5F47   000A
        ADD@    R2,     R0                      ; 5F48   02D0
        DECR    R2                              ; 5F49   0012
L_5F4A:
        ANDI    #$03FF, R0                      ; 5F4A   03B8 03FF
        PULR    R7                              ; 5F4C   02B7

L_5F4D:
        PSHR    R5                              ; 5F4D   0275

        JSR     R5,     L_5FB9                  ; 5F4E   0004 015C 03B9

        SLL     R0,     2                       ; 5F51   004C
        SLL     R1,     2                       ; 5F52   004D
        ADDI    #$0006, R0                      ; 5F53   02F8 0006
        ADDI    #$0007, R1                      ; 5F55   02F9 0007
        SWAP    R0,     1                       ; 5F57   0040
        SWAP    R1,     1                       ; 5F58   0041
        PULR    R7                              ; 5F59   02B7

L_5F5A:
        PSHR    R5                              ; 5F5A   0275
L_5F5B:
        MVI@    R2,     R4                      ; 5F5B   0294
        ANDI    #$00FC, R4                      ; 5F5C   03BC 00FC
        CMPI    #$031D, R2                      ; 5F5E   037A 031D
        BPL     L_5F67                          ; 5F60   0203 0005

        INCR    R2                              ; 5F62   000A
        MVO@    R0,     R2                      ; 5F63   0250
        DECR    R2                              ; 5F64   0012
        B       L_5F71                          ; 5F65   0200 000A

L_5F67:
        PSHR    R0                              ; 5F67   0270

        JSR     R5,     L_5F4D                  ; 5F68   0004 015C 034D

        MOVR    R2,     R5                      ; 5F6B   0095
        SUBI    #$0005, R5                      ; 5F6C   033D 0005
        MVO@    R0,     R5                      ; 5F6E   0268
        MVO@    R1,     R5                      ; 5F6F   0269
        PULR    R0                              ; 5F70   02B0
L_5F71:
        SWAP    R0,     1                       ; 5F71   0040
        ADDR    R0,     R4                      ; 5F72   00C4
        MVO@    R4,     R2                      ; 5F73   0254
        SWAP    R0,     1                       ; 5F74   0040
        PULR    R7                              ; 5F75   02B7

L_5F76:
        PSHR    R5                              ; 5F76   0275
        CLRR    R4                              ; 5F77   01E4
        SARC    R1,     1                       ; 5F78   0079
        BNC     L_5F7D                          ; 5F79   0209 0002

        ADDI    #$0002, R4                      ; 5F7B   02FC 0002
L_5F7D:
        SARC    R0,     1                       ; 5F7D   0078
        BNC     L_5F81                          ; 5F7E   0209 0001

        INCR    R4                              ; 5F80   000C
L_5F81:
        SLL     R1,     2                       ; 5F81   004D
        MOVR    R1,     R5                      ; 5F82   008D
        SLL     R1,     2                       ; 5F83   004D
        ADDR    R5,     R1                      ; 5F84   00E9
        ADDR    R0,     R1                      ; 5F85   00C1
        ADDI    #$0200, R1                      ; 5F86   02F9 0200
        MVI@    R1,     R0                      ; 5F88   0288
        MOVR    R3,     R5                      ; 5F89   009D
        MOVR    R0,     R3                      ; 5F8A   0083
        SDBD                                    ; 5F8B   0001
        ANDI    #$E000, R3                      ; 5F8C   03BB 0000 00E0
        SDBD                                    ; 5F8F   0001
        ANDI    #$07FF, R0                      ; 5F90   03B8 00FF 0007
        SLR     R3,     2                       ; 5F93   0067
        ADDR    R3,     R0                      ; 5F94   00D8
        MOVR    R5,     R3                      ; 5F95   00AB
        PULR    R7                              ; 5F96   02B7

L_5F97:
        PSHR    R5                              ; 5F97   0275
        PSHR    R2                              ; 5F98   0272
        MVII    #$0007, R2                      ; 5F99   02BA 0007
L_5F9B:
        DECR    R4                              ; 5F9B   0014
        BMI     L_5FA4                          ; 5F9C   020B 0006

        SLL     R2,     2                       ; 5F9E   004E
        SLL     R2,     1                       ; 5F9F   004A
        SLL     R3,     2                       ; 5FA0   004F
        SLL     R3,     1                       ; 5FA1   004B
        B       L_5F9B                          ; 5FA2   0220 0008

L_5FA4:
        COMR    R2                              ; 5FA4   001A
        ANDR    R2,     R0                      ; 5FA5   0190
        XORR    R3,     R0                      ; 5FA6   01D8
        MOVR    R0,     R3                      ; 5FA7   0083
        SDBD                                    ; 5FA8   0001
        ANDI    #$07FF, R0                      ; 5FA9   03B8 00FF 0007
        SDBD                                    ; 5FAC   0001
        ANDI    #$F800, R3                      ; 5FAD   03BB 0000 00F8
        SLL     R3,     2                       ; 5FB0   004F
        SDBD                                    ; 5FB1   0001
        ADDI    #$1000, R3                      ; 5FB2   02FB 0000 0010
        ADDR    R3,     R0                      ; 5FB5   00D8
        MVO@    R0,     R1                      ; 5FB6   0248
        PULR    R2                              ; 5FB7   02B2
        PULR    R7                              ; 5FB8   02B7

L_5FB9:
        PSHR    R5                              ; 5FB9   0275
        PSHR    R3                              ; 5FBA   0273
        MVII    #$0280, R1                      ; 5FBB   02B9 0280
        MVII    #$0010, R3                      ; 5FBD   02BB 0010
        CLRR    R5                              ; 5FBF   01ED
L_5FC0:
        SUBR    R1,     R0                      ; 5FC0   0108
        BMI     L_5FC5                          ; 5FC1   020B 0002

        ADDR    R3,     R5                      ; 5FC3   00DD
        INCR    R7                              ; 5FC4   000F

L_5FC5:
        ADDR    R1,     R0                      ; 5FC5   00C8
L_5FC6:
        SLR     R1,     1                       ; 5FC6   0061
        SARC    R3,     1                       ; 5FC7   007B
        BNC     L_5FC0                          ; 5FC8   0229 0009

        MOVR    R5,     R1                      ; 5FCA   00A9
        PULR    R3                              ; 5FCB   02B3
        PULR    R7                              ; 5FCC   02B7

L_5FCD:
        PSHR    R5                              ; 5FCD   0275
        CLRR    R5                              ; 5FCE   01ED
L_5FCF:
        INCR    R5                              ; 5FCF   000D
        SUBR    R1,     R0                      ; 5FD0   0108
        BPL     L_5FCF                          ; 5FD1   0223 0003

        ADDR    R1,     R0                      ; 5FD3   00C8
        DECR    R5                              ; 5FD4   0015
        MOVR    R5,     R1                      ; 5FD5   00A9
        PULR    R7                              ; 5FD6   02B7

L_5FD7:
        MVII    #$0002, R3                      ; 5FD7   02BB 0002
        CMPI    #$019B, R2                      ; 5FD9   037A 019B
        BMI     L_5FDE                          ; 5FDB   020B 0001

        SLL     R3,     1                       ; 5FDD   004B
L_5FDE:
        MOVR    R5,     R7                      ; 5FDE   00AF

L_5FDF:
        PSHR    R5                              ; 5FDF   0275
        MVI     G_0331, R0                      ; 5FE0   0280 0331
        J       X_UNPK_BYTES.1                  ; 5FE2   0004 0314 0358

L_5FE5:
        PSHR    R5                              ; 5FE5   0275

L_5FE6:
        JSR     R5,     X_PACK_BYTES            ; 5FE6   0004 0114 034F

        MVO     R0,     G_0331                  ; 5FE9   0240 0331
        J       X_UNPK_BYTES.1                  ; 5FEB   0004 0314 0358

L_5FEE:
        PSHR    R5                              ; 5FEE   0275
        MVII    #$000A, R0                      ; 5FEF   02B8 000A

        JSR     R5,     X_RAND1                 ; 5FF1   0004 0114 027D

        CMPI    #$00C8, R0                      ; 5FF4   0378 00C8
        PULR    R7                              ; 5FF6   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFB   0000 0000 0000 0000
        DECLE   $0000                           ; 5FFF   0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5026       <entry>
;;  $5038       $502D   $5035  
;;  $504C       <entry>
;;  $505B       $5082   $5088  
;;  $5060       $5062  
;;  $506B       $506D  
;;  $507D       $506F  
;;  $50AB       $50AF  
;;  $50B7       $50D7  
;;  $50CE       $50C2  
;;  $50D1       $50CA  
;;  $50E5       $50FF  
;;  $50F2       $50EE  
;;  $5106       $5126  
;;  $5128       $5136   $513E  
;;  $5129       <entry>
;;  $5165       $5C7C  
;;  $5170       $5AFB  
;;  $517D       $5D2C  
;;  $5188       $5A52  
;;  $526B       $5266  
;;  $5353       $5351  
;;  $53B8       $53B3  
;;  $53E0       $53DD  
;;  $53E1       $53D6  
;;  $5409       $5405  
;;  $540D       $540A   $5420  
;;  $5419       $5416  
;;  $5422       $5410  
;;  $542E       $53E5  
;;  $5436       $53CC  
;;  $5437       $50CE   $573C  
;;  $544C       $51C5  
;;  $5454       $50DB   $50E0   $5A4F  
;;  $5472       $546F  
;;  $5478       $558A   $5785  
;;  $5481       $50F8   $57E6   $5BD7  
;;  $548F       $5489  
;;  $5499       $5764   $57A8   $5B2B  
;;  $549E       $54B4  
;;  $54B0       $54A1   $54A5   $54AB  
;;  $54B6       $54AE  
;;  $54BC       $5479   $556A   $56B7   $57AE   $58A0   $593A   $5963   $5B32  
;;  $54BC       $5BA1  
;;  $54C1       $54C6  
;;  $54C8       $54C2  
;;  $54CD       $5465   $5571   $5717   $57C5   $5AF7   $5CB9  
;;  $54CE       $547E  
;;  $54D7       $54DE  
;;  $54E0       $54D8  
;;  $54E7       $54BE   $54D0  
;;  $54FB       $54F7  
;;  $5512       $550D  
;;  $554E       $554B  
;;  $5562       $5553  
;;  $5574       $5588   $558D   $55A9   $575F   $5767   $5773   $5788   $583A  
;;  $5578       $5541  
;;  $5587       $5583  
;;  $558A       $557A  
;;  $5597       $5593  
;;  $55A1       $5597   $559D  
;;  $55AB       $5534  
;;  $55B0       $5538  
;;  $55B8       $55C8  
;;  $55C1       $55BE  
;;  $55CF       $553D  
;;  $55E4       $55DD  
;;  $55ED       $5615  
;;  $5605       $55FF  
;;  $5606       $5604  
;;  $5608       $55FB  
;;  $560D       $55F0   $55F4   $5606   $5609  
;;  $5617       $5611  
;;  $5622       $561C  
;;  $5627       $55E6  
;;  $562E       $565E  
;;  $5645       $5642  
;;  $5649       $5646  
;;  $5650       $564D  
;;  $565A       $5654  
;;  $565B       $5631   $5635  
;;  $5669       $5268  
;;  $5672       $5620   $5624  
;;  $5675       $55AE   $55CD  
;;  $5692       $5684  
;;  $5698       $55A6   $5672   $59BC  
;;  $56DF       $56F6  
;;  $5704       $56FE  
;;  $5706       $570D  
;;  $5710       $5709  
;;  $572B       $5727  
;;  $5737       $572E   $5734  
;;  $5738       $5721   $5736  
;;  $5749       $571E   $5CFE  
;;  $574D       $5758  
;;  $575A       $55C2   $5663   $5680   $56A8   $56B1   $56B5   $56C0   $56CB  
;;  $575A       $56CE   $56D2   $56D6   $56F0   $5750   $5797  
;;  $575B       $555E  
;;  $577E       $577A  
;;  $5781       $576D  
;;  $578A       $5560  
;;  $57A3       $579E  
;;  $57D1       $57CB  
;;  $57D2       $57D0  
;;  $57D3       $57CE  
;;  $57D4       $57B6   $57BE  
;;  $57D5       $57D3  
;;  $57E2       $57DA  
;;  $57E6       $57DE  
;;  $57EF       $57E0   $57E4  
;;  $57F5       $57AB  
;;  $580E       $57FF   $5801  
;;  $580F       $580A   $580D  
;;  $5826       $581F  
;;  $5827       $5825  
;;  $5828       $5823  
;;  $582B       $57F3   $57FB   $5814  
;;  $582E       $57ED  
;;  $5837       $5834  
;;  $584E       <entry>
;;  $585F       $585C  
;;  $5867       $5864  
;;  $586C       $5854   $5868  
;;  $587B       $5870  
;;  $588C       $587E   $5883   $5888  
;;  $5896       $59CB  
;;  $58CA       $58BC  
;;  $58D2       $58A5  
;;  $58D5       $58DB  
;;  $58F0       $58EC  
;;  $58FE       $58F4  
;;  $590C       $5906  
;;  $591A       $5911  
;;  $591B       $5919  
;;  $592C       $5928  
;;  $5934       $58FC   $5917  
;;  $595E       $58E0  
;;  $598D       $5961   $596A   $5B44  
;;  $5997       $5991  
;;  $599F       $5995  
;;  $59B4       $59AD  
;;  $59C0       $59E1   $59E5   $5A00   $5A31   $5A37   $5A41   $5A49   $5A4D  
;;  $59C1       $589E   $58B2   $58B6   $58BA   $58C0   $58C3   $58C8   $58D0  
;;  $59C1       $58D6   $5932   $5938   $5941   $595C   $599D   $59B5   $59BA  
;;  $59C1       $59BF   $59D6   $5A56  
;;  $59C8       $59C4  
;;  $59CE       $589A  
;;  $59D8       $59D2  
;;  $59F7       $59EF  
;;  $5A07       $5A2A  
;;  $5A14       $5A10  
;;  $5A1C       $5A0E   $5A21  
;;  $5A1F       $5A16  
;;  $5A23       $5A1A  
;;  $5A24       $5A0A   $5A12   $5A1D  
;;  $5A58       $5874  
;;  $5A61       $5ACC  
;;  $5A7E       $5AAD  
;;  $5A9B       $5A95  
;;  $5AA5       $5A9D  
;;  $5AA6       $5AA4  
;;  $5AA7       $5A88   $5A99  
;;  $5AC3       $5ABB  
;;  $5AC8       $5A65   $5A69   $5AB2  
;;  $5ACF       $5878  
;;  $5AD1       $5B03  
;;  $5AEC       $5AE7  
;;  $5AF0       $5AED  
;;  $5AFF       $5AD6  
;;  $5B0E       $594D   $5959   $5971   $597B   $5987  
;;  $5B3C       $5B1C   $5B1F   $5B26   $5B2E  
;;  $5B43       $5B23   $5B3A  
;;  $5B46       $592F   $5935   $595E  
;;  $5B50       $5563   $5B47  
;;  $5B5F       $5B63  
;;  $5B65       $5B60  
;;  $5B68       $592C   $5A6B   $5AF3  
;;  $5B70       $5AC3   $5B69   $5D5F   $5DA9  
;;  $5B7F       $5B83  
;;  $5B85       $5B80  
;;  $5B9D       $591D   $599F   $5AD8   $5D6A   $5DB5  
;;  $5BB3       $5BAE  
;;  $5BB4       $5BAC   $5BB2  
;;  $5BBB       $5782   $59A2  
;;  $5BC3       $5BDE  
;;  $5BD3       $5BCB  
;;  $5BD7       $5BCF  
;;  $5BDA       $5BC7   $5BD1   $5BD5  
;;  $5BFB       $5C88  
;;  $5BFF       $5C6B  
;;  $5C06       $5C26   $5C2C  
;;  $5C21       $5C16   $5C19   $5C1C  
;;  $5C3A       $5C40  
;;  $5C69       $5BFD  
;;  $5C7A       $5C74  
;;  $5C7C       $5C78  
;;  $5C84       $5BF2  
;;  $5C8A       $5BF6  
;;  $5C93       $5BE4  
;;  $5CA3       $5C99  
;;  $5CA9       $5CA3  
;;  $5CB0       $5C82   $5CA7   $5CAC  
;;  $5CB4       $5C91   $5CA1  
;;  $5CC5       <entry>
;;  $5CC8       $5D34  
;;  $5CE0       $5CCA  
;;  $5D14       $5D11  
;;  $5D1C       $5D19  
;;  $5D21       $5D1E  
;;  $5D30       $5CD4   $5CD9   $5CDE   $5CE5   $5CEC   $5CF8  
;;  $5D4A       $5D3C   $5D41  
;;  $5D4B       <entry>
;;  $5D54       $5D51  
;;  $5D5B       $5D79  
;;  $5D6F       $5D68  
;;  $5D75       $5D5D   $5D63   $5D6D  
;;  $5D7D       $5D97  
;;  $5D90       $5D89  
;;  $5D92       $5D8E  
;;  $5D99       $5D57  
;;  $5D9D       $5DEA  
;;  $5DBA       $5DB3  
;;  $5DC2       $5DA6  
;;  $5DD0       $5DC9  
;;  $5DD4       $5DCE   $5DD1  
;;  $5DE6       $5DE0  
;;  $5DE7       $5D9E   $5DA2   $5DAE   $5DB8   $5DC0   $5DCC  
;;  $5DF8       $5DF2  
;;  $5DFF       $5E1F  
;;  $5E17       $5E15  
;;  $5E19       $5E09   $5E0D  
;;  $5E2B       $5DF0   $5DFA  
;;  $5E2C       $53D3   $53DA   $540D   $576A   $5770   $590E   $5914  
;;  $5E32       $5E43  
;;  $5E3F       $5E37  
;;  $5E45       $5E3D  
;;  $5E4C       $50C4   $56EA   $5BEA  
;;  $5E50       $5E59  
;;  $5E5B       $5E54  
;;  $5E5C       $575B   $579B   $58DD   $598A   $5B16   $5CD6  
;;  $5E6B       $574D   $58AE   $5A07  
;;  $5E77       $5A44  
;;  $5E93       $5E83  
;;  $5E94       $5E92  
;;  $5E98       $5E5D  
;;  $5EB5       $56E4   $5A84   $5E7F   $5EA7  
;;  $5EBD       $5EB7  
;;  $5EC4       $5EBD  
;;  $5ECB       $5EC5  
;;  $5ED2       $5ECB  
;;  $5ED3       $5EBA   $5EC1   $5EC8   $5ECF  
;;  $5ED4       $5ED2  
;;  $5ED7       $582B   $5CDB  
;;  $5ED8       $5CC2  
;;  $5EDE       $5BB4   $5C00   $5D72   $5DBD  
;;  $5EDF       $5475   $5695  
;;  $5EEE       $5828   $58CD   $5C1E   $5CBF  
;;  $5EFD       $5A8D   $5C0E   $5E05   $5E63   $5E8B   $5F02  
;;  $5F04       $5EFE  
;;  $5F07       $5761   $57A5   $5816   $58E3   $5B28   $5BBC   $5BE6   $5D02  
;;  $5F07       $5ED8  
;;  $5F0C       $56E7   $5F35  
;;  $5F0D       $5F0B  
;;  $5F14       $5111   $5455   $548F   $54A7   $55D3   $55F6   $5638   $5699  
;;  $5F14       $56C4   $5738   $58F0   $58F8   $5A6E   $5BC3   $5E39   $5E50  
;;  $5F14       $5E79   $5E99   $5EE0  
;;  $5F41       $5F3E  
;;  $5F43       $5F3B  
;;  $5F44       $5F39  
;;  $5F47       $5F1D  
;;  $5F4A       $5F19  
;;  $5F4D       $5114   $563B   $569C   $5F68  
;;  $5F5A       $5460   $5493   $5924   $5D05  
;;  $5F5B       $5EDB  
;;  $5F67       $5F60  
;;  $5F71       $5F65  
;;  $5F76       $5077   $543B   $5A8A   $5C0B   $5E02   $5E60   $5E88   $5EE6  
;;  $5F76       $5EF4  
;;  $5F7D       $5F79  
;;  $5F81       $5F7E  
;;  $5F97       $507A   $5444   $5EE9   $5EF7  
;;  $5F9B       $5FA2  
;;  $5FA4       $5F9C  
;;  $5FB9       $5438   $56C7   $5A71   $5E7C   $5E9C   $5EE3   $5F4E  
;;  $5FC0       $5FC8  
;;  $5FC5       $5FC1  
;;  $5FC6       $5FC4  
;;  $5FCD       $54EE   $59FA   $5B57   $5B77   $5F30  
;;  $5FCF       $5FD1  
;;  $5FD7       $5468   $5692   $5A90   $5BA4   $5C11   $5C93   $5CBC   $5D6F  
;;  $5FD7       $5DBA   $5E8E  
;;  $5FDE       $5FDB  
;;  $5FDF       $56E1   $58CA   $5A81   $5E19   $5EF1   $5F08  
;;  $5FE5       $56D8   $5A74   $5C08   $5DFF   $5E85  
;;  $5FE6       $5EAA  
;;  $5FEE       $53E1   $58A7   $5A2C   $5AB7   $5CE0  
;; ======================================================================== ;;
