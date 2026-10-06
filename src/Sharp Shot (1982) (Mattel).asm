
        ORG     $5000
.HEADER:
        BIDECLE $5D20           ; 5000  Ptr: MOB graphic images
        BIDECLE $5023           ; 5002  Ptr: EXEC timer table
        BIDECLE $505D           ; 5004  Ptr: Start of game
        BIDECLE $5F78           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5FC8           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5014           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $000B,  $0002   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $000B           ; 5013  Border color init

.TITLE:
        DECLE   $0052                           ; 5014  Cartridge year
        STRING  "SHARP SHOT"                    ; 5015  Title string
        DECLE   $0000                           ; 501F  

.TITLECODE:
        ADDI    #$0003, R5                      ; 5020   02FD 0003
        MOVR    R5,     R7                      ; 5022   00AF

.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 5023  Timer dispatch/interval
        DECLE   $00E4,  $0051,  $0014,  $0000; 5027  Timer dispatch/interval
        DECLE   $003B,  $0050,  $0001,  $0000; 502B  Timer dispatch/interval
        BIDECLE $0000           ; 502F  End of timer table

        DECLE   $007C,  $0051,  $0036           ; 5031   007C 0051 0036

        RLC     R1,     1                       ; 5034   0051
        MOVR    R7,     R6                      ; 5035   00BE
        RLC     R1,     1                       ; 5036   0051
        MOVR    R7,     R6                      ; 5037   00BE
        RLC     R1,     1                       ; 5038   0051
        MOVR    R7,     R6                      ; 5039   00BE
        RLC     R1,     1                       ; 503A   0051
L_503B:
        PSHR    R5                              ; 503B   0275
        MVII    #$0078, R0                      ; 503C   02B8 0078
        MVII    #$0050, R1                      ; 503E   02B9 0050
        MVO     R0,     .ISRVEC.0               ; 5040   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5042   0241 0101
        MVI     G_0188, R0                      ; 5044   0280 0188
        XORI    #$0001, R0                      ; 5046   03F8 0001
        MVO     R0,     G_0188                  ; 5048   0240 0188
        MVI     G_0185, R0                      ; 504A   0280 0185
        DECR    R0                              ; 504C   0010
        BMI     L_5051                          ; 504D   020B 0002

        MVO     R0,     G_0185                  ; 504F   0240 0185

L_5051:
        JSR     R5,     L_51DC                  ; 5051   0004 0150 01DC

        MOVR    R5,     R3                      ; 5054   00AB
        RLC     R3,     2                       ; 5055   0057
        MOVR    R7,     R0                      ; 5056   00B8
        RLC     R2,     1                       ; 5057   0052
        ADDR    R7,     R0                      ; 5058   00F8
        RLC     R2,     1                       ; 5059   0052
        ADCR    R5                              ; 505A   002D
        SLLC    R2,     1                       ; 505B   005A
        PULR    R7                              ; 505C   02B7

.START:
        MVII    #$0100, R4                      ; 505D   02BC 0100
        SDBD                                    ; 505F   0001
        MVI@    R4,     R0                      ; 5060   02A0
        PSHR    R0                              ; 5061   0270
        PSHR    R5                              ; 5062   0275
        SDBD                                    ; 5063   0001
        MVII    #$5031, R0                      ; 5064   02B8 0031 0050
        MVO     R0,     G_035D                  ; 5067   0240 035D
        MVII    #$0002, R0                      ; 5069   02B8 0002
        MVO     R0,     G_0115                  ; 506B   0240 0115
        MVO     R0,     G_0165                  ; 506D   0240 0165
        MVII    #$000B, R0                      ; 506F   02B8 000B
        MVO     R0,     G_0189                  ; 5071   0240 0189
        CLRR    R0                              ; 5073   01C0

        JSR     R5,     L_50E2                  ; 5074   0004 0150 00E2

        PULR    R7                              ; 5077   02B7

        MVI     G_0102, R1                      ; 5078   0281 0102
        SWAP    R1,     1                       ; 507A   0041
        SWAP    R1,     1                       ; 507B   0041
        BMI     L_5081                          ; 507C   020B 0003

        DECR    R1                              ; 507E   0011
        BPL     L_5083                          ; 507F   0203 0002
L_5081:
        MVI     G_02F1, R7                      ; 5081   0287 02F1

L_5083:
        PSHR    R5                              ; 5083   0275
        MVI     G_0106, R0                      ; 5084   0280 0106
        MVO     R0,     .STIC.BORD              ; 5086   0240 002C
        MVI     G_0189, R0                      ; 5088   0280 0189
        MVO     R0,     .STIC.CS.0              ; 508A   0240 0028
        MVO     R1,     G_0102                  ; 508C   0241 0102
        BEQ     L_50CF                          ; 508E   0204 003F

        MVII    #$0008, R5                      ; 5090   02BD 0008
        SLL     R1,     2                       ; 5092   004D
        SUBR    R1,     R5                      ; 5093   010D
        MOVR    R5,     R4                      ; 5094   00AC
        ADDR    R4,     R4                      ; 5095   00E4
        ADDR    R5,     R4                      ; 5096   00EC
        ADDR    R4,     R4                      ; 5097   00E4
        ADDI    #$018A, R4                      ; 5098   02FC 018A
        MVII    #$0004, R2                      ; 509A   02BA 0004
L_509C:
        MVII    #$0003, R3                      ; 509C   02BB 0003
L_509E:
        SDBD                                    ; 509E   0001
        MVI@    R4,     R0                      ; 509F   02A0
        MVO@    R0,     R5                      ; 50A0   0268
        ADDI    #$0007, R5                      ; 50A1   02FD 0007
        DECR    R3                              ; 50A3   0013
        BNEQ    L_509E                          ; 50A4   022C 0007

        CLRR    R0                              ; 50A6   01C0
        MVO@    R0,     R5                      ; 50A7   0268
        SUBI    #$0018, R5                      ; 50A8   033D 0018
        DECR    R2                              ; 50AA   0012
        BNEQ    L_509C                          ; 50AB   022C 0010

        MVO     R0,     .STIC.VIDEN             ; 50AD   0240 0020
        SDBD                                    ; 50AF   0001
        MVII    #$3A00, R5                      ; 50B0   02BD 0000 003A
        MVI     G_0102, R0                      ; 50B3   0280 0102
        SWAP    R0,     1                       ; 50B5   0040
        SLR     R0,     2                       ; 50B6   0064
        SUBR    R0,     R5                      ; 50B7   0105
        MVII    #$0315, R3                      ; 50B8   02BB 0315
L_50BA:
        MVI@    R3,     R4                      ; 50BA   029C
        MVII    #$0004, R1                      ; 50BB   02B9 0004
L_50BD:
        MVI@    R4,     R0                      ; 50BD   02A0
        MVO@    R0,     R5                      ; 50BE   0268
        MVI@    R4,     R0                      ; 50BF   02A0
        MVO@    R0,     R5                      ; 50C0   0268
        MVI@    R4,     R0                      ; 50C1   02A0
        MVO@    R0,     R5                      ; 50C2   0268
        MVI@    R4,     R0                      ; 50C3   02A0
        MVO@    R0,     R5                      ; 50C4   0268
        DECR    R1                              ; 50C5   0011
        BNEQ    L_50BD                          ; 50C6   022C 000A

        INCR    R3                              ; 50C8   000B
        CMPI    #$0319, R3                      ; 50C9   037B 0319
        BLT     L_50BA                          ; 50CB   0225 0012
        B       L_50D4                          ; 50CD   0200 0005

L_50CF:
        JSR     R5,     .EXEC.154               ; 50CF   0004 0110 0154

        MVO     R0,     .STIC.VIDEN             ; 50D2   0240 0020
L_50D4:
        MVI     G_0102, R0                      ; 50D4   0280 0102
        CMPI    #$0001, R0                      ; 50D6   0378 0001
        BEQ     L_50DE                          ; 50D8   0204 0004

        SLL     R0,     1                       ; 50DA   0048

        JSR     R5,     L_50E2                  ; 50DB   0004 0150 00E2

L_50DE:
        PULR    R5                              ; 50DE   02B5
        J       X_PLAY_NOTE                     ; 50DF   0004 0318 02BD

L_50E2:
        PSHR    R5                              ; 50E2   0275
        MOVR    R0,     R4                      ; 50E3   0084
        ADDR    R4,     R4                      ; 50E4   00E4
        ADDR    R0,     R4                      ; 50E5   00C4
        ADDR    R4,     R4                      ; 50E6   00E4
        ADDI    #$018A, R4                      ; 50E7   02FC 018A

L_50E9:
        JSR     R5,     .EXEC.76C               ; 50E9   0004 0114 036C

        INCR    R1                              ; 50EC   0009
        MVI@    R1,     R2                      ; 50ED   028A
        DECR    R1                              ; 50EE   0011
        DECR    R2                              ; 50EF   0012
        BMI     L_50F5                          ; 50F0   020B 0003

        JSR     R5,     .EXEC.777               ; 50F2   0004 0114 0377

L_50F5:
        MOVR    R0,     R5                      ; 50F5   0085
        MVI@    R1,     R0                      ; 50F6   0288
        SLR     R0,     2                       ; 50F7   0064
        SLR     R0,     2                       ; 50F8   0064
        ANDI    #$0380, R0                      ; 50F9   03B8 0380
        SLL     R0,     1                       ; 50FB   0048
        XORR    R0,     R2                      ; 50FC   01C2
        MVO@    R2,     R4                      ; 50FD   0262
        SWAP    R2,     1                       ; 50FE   0042
        MVO@    R2,     R4                      ; 50FF   0262
        MVI@    R1,     R0                      ; 5100   0288
        SLR     R0,     1                       ; 5101   0060
        ANDI    #$03E0, R0                      ; 5102   03B8 03E0
        SLL     R0,     2                       ; 5104   004C
        XORR    R0,     R3                      ; 5105   01C3
        MVO@    R3,     R4                      ; 5106   0263
        SWAP    R3,     1                       ; 5107   0043
        MVO@    R3,     R4                      ; 5108   0263
        MOVR    R5,     R2                      ; 5109   00AA
        SLL     R2,     1                       ; 510A   004A
        ADDI    #$0030, R2                      ; 510B   02FA 0030
        SLL     R2,     2                       ; 510D   004E
        SLL     R2,     1                       ; 510E   004A
        MVI@    R1,     R3                      ; 510F   028B
        ANDI    #$0030, R3                      ; 5110   03BB 0030
        XORI    #$0008, R3                      ; 5112   03FB 0008
        SWAP    R3,     1                       ; 5114   0043
        XORR    R3,     R2                      ; 5115   01DA
        MVI@    R1,     R3                      ; 5116   028B
        ANDI    #$0007, R3                      ; 5117   03BB 0007
        XORR    R3,     R2                      ; 5119   01DA
        MVO@    R2,     R4                      ; 511A   0262
        SWAP    R2,     1                       ; 511B   0042
        MVO@    R2,     R4                      ; 511C   0262
        MOVR    R5,     R0                      ; 511D   00A8
        PSHR    R4                              ; 511E   0274

        JSR     R5,     .EXEC.43F               ; 511F   0004 0114 003F

        PULR    R4                              ; 5122   02B4
        SLL     R3,     2                       ; 5123   004F
        SLL     R3,     1                       ; 5124   004B
        SDBD                                    ; 5125   0001
        ADDI    #$5D18, R3                      ; 5126   02FB 0018 005D
        MOVR    R0,     R2                      ; 5129   0082
        ANDI    #$0003, R2                      ; 512A   03BA 0003
        ADDI    #$0315, R2                      ; 512C   02FA 0315
        MVO@    R3,     R2                      ; 512E   0253
        INCR    R0                              ; 512F   0008
        MOVR    R0,     R2                      ; 5130   0082
        ANDI    #$0003, R2                      ; 5131   03BA 0003
        BNEQ    L_50E9                          ; 5133   022C 004B
        PULR    R7                              ; 5135   02B7

        PSHR    R5                              ; 5136   0275
        DECR    R0                              ; 5137   0010
        BMI     L_51BD                          ; 5138   020B 0083

        CMPI    #$0003, R0                      ; 513A   0378 0003
        BGT     L_51BD                          ; 513C   020E 007F

L_513E:
        MVII    #$015E, R4                      ; 513E   02BC 015E
        MVO@    R0,     R4                      ; 5140   0260
        CLRR    R2                              ; 5141   01D2
        MVO     R2,     G_0165                  ; 5142   0242 0165
        MVO@    R2,     R4                      ; 5144   0262
        MVO@    R2,     R4                      ; 5145   0262
        MVO@    R2,     R4                      ; 5146   0262
        MVII    #$0007, R2                      ; 5147   02BA 0007
        MVO@    R2,     R4                      ; 5149   0262
        MVO@    R2,     R4                      ; 514A   0262
        INCR    R7                              ; 514B   000F

L_514C:
        PSHR    R5                              ; 514C   0275
L_514D:
        MVII    #$003C, R2                      ; 514D   02BA 003C
        MVO     R2,     G_0164                  ; 514F   0242 0164

        JSR     R5,     X_STOP_SFX              ; 5151   0004 011C 02B4
        JSR     R5,     .EXEC.7B3               ; 5154   0004 0114 03B3

        MVI     G_015E, R4                      ; 5157   0284 015E
        ADDR    R4,     R4                      ; 5159   00E4
        ADDR    R7,     R4                      ; 515A   00FC
        ADDI    #$0019, R4                      ; 515B   02FC 0019
        MVI@    R4,     R0                      ; 515D   02A0
        MVO     R0,     G_0189                  ; 515E   0240 0189
        MVI@    R4,     R0                      ; 5160   02A0
        MVO     R0,     G_0106                  ; 5161   0240 0106

        JSR     R5,     L_51DC                  ; 5163   0004 0150 01DC

        ADDR    R0,     R6                      ; 5166   00C6
        RLC     R2,     2                       ; 5167   0056
        SLL     R3,     2                       ; 5168   004F
        RLC     R2,     1                       ; 5169   0052
        MOVR    R7,     R6                      ; 516A   00BE
        RLC     R1,     2                       ; 516B   0055
        MOVR    R4,     R1                      ; 516C   00A1
        SLLC    R1,     1                       ; 516D   0059

        JSR     R5,     L_523A                  ; 516E   0004 0150 023A

        J       L_5203                          ; 5171   0004 0350 0203

        DECLE   $0005,  $0001,  $0000,  $0000   ; 5174   0005 0001 0000 0000
        DECLE   $000D,  $0001,  $0006,  $0005   ; 5178   000D 0001 0006 0005

        PSHR    R5                              ; 517C   0275
        TSTR    R0                              ; 517D   0080
        BMI     L_51BD                          ; 517E   020B 003D

        MVII    #$0003, R0                      ; 5180   02B8 0003
        MVI     G_0165, R2                      ; 5182   0282 0165
        DECR    R2                              ; 5184   0012
        BGT     L_513E                          ; 5185   022E 0048

        MVI     G_015F, R0                      ; 5187   0280 015F
        DECR    R0                              ; 5189   0010
        BGT     L_51BD                          ; 518A   020E 0031

        MVO     R1,     G_0165                  ; 518C   0241 0165
        BMI     L_5193                          ; 518E   020B 0003

        JSR     R5,     L_514C                  ; 5190   0004 0150 014C

L_5193:
        MVII    #$0002, R0                      ; 5193   02B8 0002
        MVO     R0,     G_015F                  ; 5195   0240 015F
        MVII    #$0160, R4                      ; 5197   02BC 0160
        CLRR    R3                              ; 5199   01DB
        MVI     G_015E, R0                      ; 519A   0280 015E
        SARC    R0,     1                       ; 519C   0078
        BNC     L_51A3                          ; 519D   0209 0004

        MVO@    R3,     R4                      ; 519F   0263
        MVO@    R3,     R4                      ; 51A0   0263
        B       L_51A8                          ; 51A1   0200 0005

L_51A3:
        ADD     G_0165, R4                      ; 51A3   02C4 0165
        MVO@    R3,     R4                      ; 51A5   0263
        INCR    R4                              ; 51A6   000C
        MVO@    R3,     R4                      ; 51A7   0263

L_51A8:
        JSR     R5,     L_523A                  ; 51A8   0004 0150 023A
        JSR     R5,     L_51DC                  ; 51AB   0004 0150 01DC

        ADDR    R3,     R0                      ; 51AE   00D8
        RLC     R3,     2                       ; 51AF   0057
        TSTR    R6                              ; 51B0   00B6
        RLC     R1,     1                       ; 51B1   0051
        INCR    R2                              ; 51B2   000A
        RLC     R2,     2                       ; 51B3   0056
        ADDR    R5,     R0                      ; 51B4   00E8
        SLLC    R2,     1                       ; 51B5   005A
        SDBD                                    ; 51B6   0001
        MVII    #$5027, R1                      ; 51B7   02B9 0027 0050

        JSR     R5,     X_TIMER_START           ; 51BA   0004 0118 0044

L_51BD:
        PULR    R7                              ; 51BD   02B7

        PSHR    R5                              ; 51BE   0275
        DECR    R0                              ; 51BF   0010
        BMI     L_51DB                          ; 51C0   020B 0019

        MVI     G_015F, R0                      ; 51C2   0280 015F
        DECR    R0                              ; 51C4   0010
        BLE     L_51DB                          ; 51C5   0206 0014

        MVI     G_015E, R0                      ; 51C7   0280 015E
        SARC    R0,     1                       ; 51C9   0078
        BC      L_51D0                          ; 51CA   0201 0004

        CMP     G_0165, R1                      ; 51CC   0341 0165
        BNEQ    L_51DB                          ; 51CE   020C 000B

L_51D0:
        JSR     R5,     L_51DC                  ; 51D0   0004 0150 01DC

        ADDR    R3,     R6                      ; 51D3   00DE
        SLLC    R0,     1                       ; 51D4   0058
        MOVR    R5,     R0                      ; 51D5   00A8
        RLC     R0,     2                       ; 51D6   0054
        ADCR    R4                              ; 51D7   002C
        RLC     R2,     2                       ; 51D8   0056
        ADDR    R1,     R0                      ; 51D9   00C8
        SLLC    R2,     1                       ; 51DA   005A
L_51DB:
        PULR    R7                              ; 51DB   02B7

L_51DC:
        MVI     G_015E, R4                      ; 51DC   0284 015E
        ADDR    R4,     R4                      ; 51DE   00E4
        ADDR    R5,     R4                      ; 51DF   00EC
        ADDI    #$0008, R5                      ; 51E0   02FD 0008
        SDBD                                    ; 51E2   0001
        MVI@    R4,     R7                      ; 51E3   02A7

L_51E4:
        PSHR    R5                              ; 51E4   0275
        MVI     G_0164, R0                      ; 51E5   0280 0164
        DECR    R0                              ; 51E7   0010
        BMI     L_522B                          ; 51E8   020B 0041

        MVO     R0,     G_0164                  ; 51EA   0240 0164
        BNEQ    L_520A                          ; 51EC   020C 001C

        CMP     G_015E, R0                      ; 51EE   0340 015E
        BNEQ    L_51F4                          ; 51F0   020C 0002

        MVII    #$0002, R0                      ; 51F2   02B8 0002
L_51F4:
        INCR    R0                              ; 51F4   0008
        MVO     R0,     G_015F                  ; 51F5   0240 015F
        MVII    #$0007, R0                      ; 51F7   02B8 0007
        MVO     R0,     G_0162                  ; 51F9   0240 0162
        MVO     R0,     G_0163                  ; 51FB   0240 0163

        JSR     R5,     L_523A                  ; 51FD   0004 0150 023A
        JSR     R5,     L_5215                  ; 5200   0004 0150 0215

L_5203:
        SDBD                                    ; 5203   0001
        MVII    #$5027, R1                      ; 5204   02B9 0027 0050

        JSR     R5,     X_TIMER_STOP            ; 5207   0004 0118 0038

L_520A:
        MVI     G_0164, R0                      ; 520A   0280 0164
        MVII    #$0007, R3                      ; 520C   02BB 0007
        MVII    #$0002, R1                      ; 520E   02B9 0002
        MVII    #$02E5, R4                      ; 5210   02BC 02E5
        J       .EXEC.8C6                       ; 5212   0004 0318 00C6

L_5215:
        PSHR    R5                              ; 5215   0275
        MVII    #$0095, R0                      ; 5216   02B8 0095
        MVO     R0,     G_0146                  ; 5218   0240 0146

        JSR     R5,     X_PLAY_MUS2             ; 521A   0004 0118 035D
        DECLE   $018E                           ; 521D  Note (short)
        DECLE   $01AC                           ; 521E  Note (short)
        DECLE   $01AC                           ; 521F  Note (short)
        DECLE   $01CC                           ; 5220  Note (short)
        DECLE   $01CC                           ; 5221  Note (short)
        DECLE   $01DC                           ; 5222  Note (short)
        DECLE   $01DC                           ; 5223  Note (short)
        DECLE   $01FE                           ; 5224  Note (short)
        DECLE   $021C                           ; 5225  Note (short)
        DECLE   $021C                           ; 5226  Note (short)
        DECLE   $01FC                           ; 5227  Note (short)
        DECLE   $01FC                           ; 5228  Note (short)
        DECLE   $018E                           ; 5229  Note (short)
        DECLE   $0000                           ; 522A  End of music
L_522B:
        PULR    R7                              ; 522B   02B7

L_522C:
        MVII    #$0006, R0                      ; 522C   02B8 0006
        INCR    R7                              ; 522E   000F

L_522F:
        CLRR    R0                              ; 522F   01C0
L_5230:
        INCR    R0                              ; 5230   0008
        MVI     G_0165, R1                      ; 5231   0281 0165
L_5233:
        ADDI    #$0160, R1                      ; 5233   02F9 0160
        ADD@    R1,     R0                      ; 5235   02C8
        BPL     L_5239                          ; 5236   0203 0001

        CLRR    R0                              ; 5238   01C0
L_5239:
        MVO@    R0,     R1                      ; 5239   0248
L_523A:
        PSHR    R5                              ; 523A   0275
        MVI     G_0162, R3                      ; 523B   0283 0162
        MVII    #$0201, R4                      ; 523D   02BC 0201
        MVII    #$0002, R1                      ; 523F   02B9 0002
        MVI     G_0160, R0                      ; 5241   0280 0160

        JSR     R5,     X_PRNUM_RGT             ; 5243   0004 0118 00C5

        MVI     G_0163, R3                      ; 5246   0283 0163
        MVII    #$0211, R4                      ; 5248   02BC 0211
        MVI     G_0161, R0                      ; 524A   0280 0161
        J       .EXEC.8C6                       ; 524C   0004 0318 00C6

        PSHR    R5                              ; 524F   0275
        MVII    #$0200, R4                      ; 5250   02BC 0200
        MVII    #$00F0, R0                      ; 5252   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5254   0004 0114 0338

        MVII    #$0200, R4                      ; 5257   02BC 0200
        MVII    #$00F0, R3                      ; 5259   02BB 00F0
        SDBD                                    ; 525B   0001
        MVII    #$AD72, R0                      ; 525C   02B8 0072 00AD
L_525F:
        SLLC    R0,     1                       ; 525F   0058
        ADCR    R0                              ; 5260   0028
        XORR    R0,     R2                      ; 5261   01C2
        ANDI    #$003F, R2                      ; 5262   03BA 003F
        CMPI    #$0038, R2                      ; 5264   037A 0038
        BLT     L_526A                          ; 5266   0205 0002

        ANDI    #$0007, R2                      ; 5268   03BA 0007
L_526A:
        SDBD                                    ; 526A   0001
        ADDI    #$1878, R2                      ; 526B   02FA 0078 0018
        MVO@    R2,     R4                      ; 526E   0262
        DECR    R3                              ; 526F   0013
        BNEQ    L_525F                          ; 5270   022C 0012

        MVII    #$0269, R4                      ; 5272   02BC 0269

        JSR     R5,     L_527D                  ; 5274   0004 0150 027D

        MVII    #$0272, R4                      ; 5277   02BC 0272

        JSR     R5,     L_527D                  ; 5279   0004 0150 027D

        PULR    R7                              ; 527C   02B7

L_527D:
        MVII    #$0003, R3                      ; 527D   02BB 0003
L_527F:
        MOVR    R3,     R2                      ; 527F   009A
        MVII    #$0001, R1                      ; 5280   02B9 0001
        SARC    R2,     1                       ; 5282   007A
        BNC     L_5287                          ; 5283   0209 0002

        MVII    #$0014, R1                      ; 5285   02B9 0014
L_5287:
        SARC    R2,     1                       ; 5287   007A
        ADCR    R7                              ; 5288   002F

        NEGR    R1                              ; 5289   0021
L_528A:
        ADDR    R4,     R1                      ; 528A   00E1
        MOVR    R3,     R0                      ; 528B   0098
        SLL     R0,     2                       ; 528C   004C
        SLL     R0,     1                       ; 528D   0048
        SDBD                                    ; 528E   0001
        ADDI    #$08B5, R0                      ; 528F   02F8 00B5 0008
        MVO@    R0,     R1                      ; 5292   0248
        DECR    R3                              ; 5293   0013
        BPL     L_527F                          ; 5294   0223 0016
        MOVR    R5,     R7                      ; 5296   00AF

L_5297:
        MOVR    R0,     R2                      ; 5297   0082
        SLL     R2,     2                       ; 5298   004E
        SLL     R2,     1                       ; 5299   004A
        ADDR    R0,     R2                      ; 529A   00C2
        ADDI    #$0268, R2                      ; 529B   02FA 0268
        MVI@    R2,     R3                      ; 529D   0293
        XORI    #$0003, R3                      ; 529E   03FB 0003
        MVO@    R3,     R2                      ; 52A0   0253
        ADDI    #$0002, R2                      ; 52A1   02FA 0002
        MVI@    R2,     R3                      ; 52A3   0293
        XORI    #$0003, R3                      ; 52A4   03FB 0003
        MVO@    R3,     R2                      ; 52A6   0253
        MOVR    R5,     R7                      ; 52A7   00AF

L_52A8:
        PSHR    R5                              ; 52A8   0275

        JSR     R5,     X_PLAY_SFX2             ; 52A9   0004 0118 03BE
        DECLE   $0090                           ; 52AC  SFX prio
        DECLE   $0079                           ; 52AD  SFX data
        DECLE   $03ED                           ; 52AE  SFX data
        DECLE   $03B7                           ; 52AF  SFX data
        DECLE   $018C,  $0000                   ; 52B0  SFX data
        DECLE   $000B                           ; 52B2  SFX data
        DECLE   $000F,  $03FF                   ; 52B3  SFX data
        DECLE   $008F,  $003F                   ; 52B5  SFX data
        DECLE   $03CF                           ; 52B7  SFX end


        PSHR    R5                              ; 52B8   0275
        MVII    #$000A, R3                      ; 52B9   02BB 000A
        MVII    #$00F0, R0                      ; 52BB   02B8 00F0

        JSR     R5,     X_RAND2                 ; 52BD   0004 0114 029E

        MVII    #$0200, R1                      ; 52C0   02B9 0200
        ADDR    R0,     R1                      ; 52C2   00C1
        MVII    #$0003, R0                      ; 52C3   02B8 0003

        JSR     R5,     X_RAND1                 ; 52C5   0004 0114 027D

L_52C8:
        ADDI    #$001B, R1                      ; 52C8   02F9 001B
        CMPI    #$02F0, R1                      ; 52CA   0379 02F0
        BLT     L_52D0                          ; 52CC   0205 0002

        SUBI    #$00F0, R1                      ; 52CE   0339 00F0
L_52D0:
        INCR    R2                              ; 52D0   000A
        ANDI    #$0007, R2                      ; 52D1   03BA 0007
        MVI@    R1,     R2                      ; 52D3   028A
        SDBD                                    ; 52D4   0001
        ANDI    #$1000, R2                      ; 52D5   03BA 0000 0010
        BEQ     L_52C8                          ; 52D8   0224 0011

        MVI@    R1,     R2                      ; 52DA   028A
        XORR    R0,     R2                      ; 52DB   01C2
        MVO@    R2,     R1                      ; 52DC   024A
        DECR    R3                              ; 52DD   0013
        BNEQ    L_52C8                          ; 52DE   022C 0017

        MVI     G_0166, R0                      ; 52E0   0280 0166
        MVI     .BTAB.00,R2                     ; 52E2   0282 0200
        SDBD                                    ; 52E4   0001
        ANDI    #$DFFF, R2                      ; 52E5   03BA 00FF 00DF
        TSTR    R0                              ; 52E8   0080
        BEQ     L_52F2                          ; 52E9   0204 0007

        SDBD                                    ; 52EB   0001
        XORI    #$2000, R2                      ; 52EC   03FA 0000 0020

        JSR     R5,     L_52A8                  ; 52EF   0004 0150 02A8

L_52F2:
        MVO     R2,     .BTAB.00                ; 52F2   0242 0200
        CLRR    R0                              ; 52F4   01C0
        MVO     R0,     G_0166                  ; 52F5   0240 0166
        INCR    R7                              ; 52F7   000F

        PSHR    R5                              ; 52F8   0275
L_52F9:
        MVII    #$0335, R1                      ; 52F9   02B9 0335
        MVII    #$0005, R3                      ; 52FB   02BB 0005
        SUB     G_015E, R3                      ; 52FD   0303 015E

        JSR     R5,     L_5A81                  ; 52FF   0004 0158 0281

        BNEQ    L_536D                          ; 5302   020C 0069

        MVI     G_015E, R4                      ; 5304   0284 015E
        ADDR    R4,     R4                      ; 5306   00E4
        ADDR    R4,     R4                      ; 5307   00E4
        ADDR    R7,     R4                      ; 5308   00FC
        ADDI    #$006B, R4                      ; 5309   02FC 006B
        SDBD                                    ; 530B   0001
        MVI@    R4,     R2                      ; 530C   02A2
        MVI@    R4,     R0                      ; 530D   02A0
        ADD@    R4,     R4                      ; 530E   02E4

        JSR     R5,     X_RAND2                 ; 530F   0004 0114 029E

        ADDR    R0,     R4                      ; 5312   00C4
        MVI@    R4,     R3                      ; 5313   02A3
        SDBD                                    ; 5314   0001
        ADDI    #$5DA0, R3                      ; 5315   02FB 00A0 005D
        MOVR    R1,     R4                      ; 5318   008C
        MVO@    R2,     R4                      ; 5319   0262
        MOVR    R7,     R2                      ; 531A   00BA
        ADDI    #$0056, R2                      ; 531B   02FA 0056
        MVO@    R2,     R4                      ; 531D   0262

        JSR     R5,     L_5428                  ; 531E   0004 0154 0028
        DECLE   $0002                           ; 5321   0002

        SLL     R2,     1                       ; 5322   004A
        ADDR    R7,     R2                      ; 5323   00FA
        ADDI    #$0162, R2                      ; 5324   02FA 0162
        MVI@    R2,     R0                      ; 5326   0290
        SWAP    R0,     1                       ; 5327   0040
        MVO@    R0,     R4                      ; 5328   0260
        INCR    R2                              ; 5329   000A
        MVI@    R2,     R0                      ; 532A   0290
        SWAP    R0,     1                       ; 532B   0040
        MVO@    R0,     R4                      ; 532C   0260

        JSR     R5,     L_5428                  ; 532D   0004 0154 0028
        DECLE   $0002                           ; 5330   0002

        PSHR    R2                              ; 5331   0272
        SUBI    #$0004, R2                      ; 5332   033A 0004
        ANDI    #$0008, R2                      ; 5334   03BA 0008
        BNEQ    L_533C                          ; 5336   020C 0004

        MVI@    R1,     R0                      ; 5338   0288
        XORI    #$0200, R0                      ; 5339   03F8 0200
        MVO@    R0,     R1                      ; 533B   0248
L_533C:
        PULR    R1                              ; 533C   02B1

        JSR     R5,     L_5428                  ; 533D   0004 0154 0028
        DECLE   $0002                           ; 5340   0002

        MOVR    R2,     R0                      ; 5341   0090
        MOVR    R4,     R2                      ; 5342   00A2
        SUBI    #$0335, R2                      ; 5343   033A 0335
        SLR     R2,     2                       ; 5345   0066
        SLR     R2,     1                       ; 5346   0062
        ADDI    #$017B, R2                      ; 5347   02FA 017B
        MVO@    R0,     R2                      ; 5349   0250
        ADDI    #$0005, R2                      ; 534A   02FA 0005
        MVO@    R1,     R2                      ; 534C   0251
        SLL     R0,     1                       ; 534D   0048

        JSR     R5,     .EXEC.629               ; 534E   0004 0114 0229

        MVO@    R0,     R4                      ; 5351   0260
        SUBI    #$000A, R2                      ; 5352   033A 000A
        CLRR    R0                              ; 5354   01C0
        MVO@    R0,     R2                      ; 5355   0250
        PSHR    R2                              ; 5356   0272
        CLRR    R1                              ; 5357   01C9
        MVI     G_015E, R0                      ; 5358   0280 015E
        DECR    R0                              ; 535A   0010
        BEQ     L_5360                          ; 535B   0204 0003

        MOVR    R2,     R1                      ; 535D   0091
        SUBI    #$0170, R1                      ; 535E   0339 0170
L_5360:
        MVO@    R1,     R4                      ; 5360   0261

        JSR     R5,     L_5428                  ; 5361   0004 0154 0028
        DECLE   $0003                           ; 5364   0003

        MVO@    R2,     R4                      ; 5365   0262
        PULR    R4                              ; 5366   02B4
        ADDR    R4,     R4                      ; 5367   00E4
        SUBI    #$0185, R4                      ; 5368   033C 0185
        MVO@    R3,     R4                      ; 536A   0263
        SWAP    R3,     1                       ; 536B   0043
        MVO@    R3,     R4                      ; 536C   0263
L_536D:
        PULR    R7                              ; 536D   02B7
        J       .EXEC.7AE                       ; 536E   0004 0314 03AE

        DECLE   $026E,  $0053,  $0080,  $0053   ; 5371   026E 0053 0080 0053
        DECLE   $0007,  $0000,  $0000           ; 5375   0007 0000 0000

        RRC     R1,     2                       ; 5378   0075
        RSWD    R0                              ; 5379   0038
        INCR    R0                              ; 537A   0008
        SUBR    R3,     R6                      ; 537B   011E
        DECR    R0                              ; 537C   0010
        RSWD    R0                              ; 537D   0038
        CLRC                                    ; 537E   0006
        SUBR    R4,     R2                      ; 537F   0122
        MVI@    R1,     R2                      ; 5380   028A
        SDBD                                    ; 5381   0001
        ANDI    #$4000, R2                      ; 5382   03BA 0000 0040
        BEQ     L_538A                          ; 5385   0204 0003
        J       .EXEC.7AE                       ; 5387   0004 0314 03AE

L_538A:
        PSHR    R5                              ; 538A   0275
        MVI@    R1,     R2                      ; 538B   028A
        ANDI    #$0008, R2                      ; 538C   03BA 0008
        BNEQ    L_53B1                          ; 538E   020C 0021

        MVII    #$0161, R4                      ; 5390   02BC 0161
        ADDR    R0,     R4                      ; 5392   00C4
        ADDR    R0,     R4                      ; 5393   00C4
        SDBD                                    ; 5394   0001
        MVI@    R4,     R3                      ; 5395   02A3

        JSR     R5,     L_5428                  ; 5396   0004 0154 0028
        DECLE   $0002                           ; 5399   0002

        ADDR    R7,     R2                      ; 539A   00FA
        ADDI    #$00A6, R2                      ; 539B   02FA 00A6
        ADD@    R2,     R2                      ; 539D   02D2
        MOVR    R1,     R4                      ; 539E   008C
        ADDI    #$0007, R4                      ; 539F   02FC 0007
        MVO@    R2,     R4                      ; 53A1   0262

        JSR     R5,     L_5428                  ; 53A2   0004 0154 0028
        DECLE   $0003                           ; 53A5   0003

        MVII    #$016E, R4                      ; 53A6   02BC 016E
        ADDR    R0,     R4                      ; 53A8   00C4
        MVO@    R2,     R4                      ; 53A9   0262
        MVII    #$0161, R4                      ; 53AA   02BC 0161
        ADDR    R0,     R4                      ; 53AC   00C4
        ADDR    R0,     R4                      ; 53AD   00C4
        MVO@    R3,     R4                      ; 53AE   0263
        SWAP    R3,     1                       ; 53AF   0043
        MVO@    R3,     R4                      ; 53B0   0263
L_53B1:
        MOVR    R1,     R3                      ; 53B1   008B
        ADDI    #$0007, R3                      ; 53B2   02FB 0007
        MVI@    R3,     R5                      ; 53B4   029D
        MVI@    R5,     R2                      ; 53B5   02AA
        MVO@    R5,     R3                      ; 53B6   025D
        SARC    R2,     1                       ; 53B7   007A
        BNC     L_53CA                          ; 53B8   0209 0010

        MVI@    R1,     R5                      ; 53BA   028D
        XORI    #$0008, R5                      ; 53BB   03FD 0008
        MVO@    R5,     R1                      ; 53BD   024D
        ANDI    #$0008, R5                      ; 53BE   03BD 0008
        BNEQ    L_53CA                          ; 53C0   020C 0008

        MVII    #$016E, R5                      ; 53C2   02BD 016E
        ADDR    R0,     R5                      ; 53C4   00C5
        MVI@    R5,     R0                      ; 53C5   02A8
        ADDI    #$0006, R1                      ; 53C6   02F9 0006
        MVO@    R0,     R1                      ; 53C8   0248
        PULR    R7                              ; 53C9   02B7

L_53CA:
        MOVR    R1,     R4                      ; 53CA   008C
        MVII    #$0173, R3                      ; 53CB   02BB 0173
        ADDR    R0,     R3                      ; 53CD   00C3
L_53CE:
        CLRR    R1                              ; 53CE   01C9
        SARC    R2,     1                       ; 53CF   007A
        ADCR    R7                              ; 53D0   002F

        INCR    R1                              ; 53D1   0009
L_53D2:
        SARC    R2,     1                       ; 53D2   007A
        ADCR    R7                              ; 53D3   002F

        NEGR    R1                              ; 53D4   0021
L_53D5:
        ADD@    R3,     R1                      ; 53D5   02D9
        MVO@    R1,     R3                      ; 53D6   0259
        PSHR    R1                              ; 53D7   0271
        ADDI    #$0005, R3                      ; 53D8   02FB 0005
        CMPI    #$0185, R3                      ; 53DA   037B 0185
        BLT     L_53CE                          ; 53DC   0225 000F

        PULR    R1                              ; 53DE   02B1
        PULR    R0                              ; 53DF   02B0
        SLL     R0,     1                       ; 53E0   0048

        JSR     R5,     .EXEC.629               ; 53E1   0004 0114 0229

        ADDI    #$0004, R4                      ; 53E4   02FC 0004
        MVO@    R0,     R4                      ; 53E6   0260
        INCR    R4                              ; 53E7   000C
        MVII    #$0002, R3                      ; 53E8   02BB 0002
        MVO@    R3,     R4                      ; 53EA   0263
        MOVR    R4,     R1                      ; 53EB   00A1
        SUBI    #$0007, R1                      ; 53EC   0339 0007
        PULR    R2                              ; 53EE   02B2
        MVI     G_015E, R0                      ; 53EF   0280 015E
        DECR    R0                              ; 53F1   0010
        BNEQ    L_5410                          ; 53F2   020C 001C

        ANDI    #$0007, R2                      ; 53F4   03BA 0007
        ADDR    R7,     R2                      ; 53F6   00FA
        ADDI    #$0042, R2                      ; 53F7   02FA 0042
        MVI@    R2,     R2                      ; 53F9   0292
        MOVR    R2,     R3                      ; 53FA   0093
        ANDI    #$0003, R3                      ; 53FB   03BB 0003
        SLR     R2,     2                       ; 53FD   0066
        SWAP    R2,     1                       ; 53FE   0042
        SLR     R2,     1                       ; 53FF   0062
        MVI@    R1,     R0                      ; 5400   0288
        ANDI    #$007F, R0                      ; 5401   03B8 007F
        XORR    R2,     R0                      ; 5403   01D0
        MVO@    R0,     R1                      ; 5404   0248
        ADDI    #$0005, R1                      ; 5405   02F9 0005

        JSR     R5,     L_5411                  ; 5407   0004 0154 0011
        DECLE   $0004                           ; 540A   0004

        MVO@    R3,     R1                      ; 540B   024B

        JSR     R5,     L_5411                  ; 540C   0004 0154 0011
        DECLE   $0000                           ; 540F   0000
L_5410:
        PULR    R7                              ; 5410   02B7

L_5411:
        MVI@    R1,     R2                      ; 5411   028A
        XOR@    R5,     R2                      ; 5412   03EA
        PSHR    R1                              ; 5413   0271
        SUBI    #$0002, R1                      ; 5414   0339 0002
        SARC    R2,     1                       ; 5416   007A
        BC      L_5426                          ; 5417   0201 000D

        MVII    #$0200, R4                      ; 5419   02BC 0200
        SARC    R2,     1                       ; 541B   007A
        BC      L_5421                          ; 541C   0201 0003

        ADDI    #$0200, R4                      ; 541E   02FC 0200
        DECR    R1                              ; 5420   0011
L_5421:
        SARC    R2,     1                       ; 5421   007A
        ADCR    R7                              ; 5422   002F

        NEGR    R4                              ; 5423   0024
L_5424:
        ADD@    R1,     R4                      ; 5424   02CC
        MVO@    R4,     R1                      ; 5425   024C
L_5426:
        PULR    R1                              ; 5426   02B1
        MOVR    R5,     R7                      ; 5427   00AF

L_5428:
        PSHR    R0                              ; 5428   0270
        PSHR    R1                              ; 5429   0271
        MVI@    R5,     R1                      ; 542A   02A9
        CLRR    R2                              ; 542B   01D2
L_542C:
        MVI@    R3,     R0                      ; 542C   0298
        INCR    R3                              ; 542D   000B
        SWAP    R0,     1                       ; 542E   0040
        ANDI    #$0003, R0                      ; 542F   03B8 0003
        SLL     R2,     2                       ; 5431   004E
        XORR    R0,     R2                      ; 5432   01C2
        DECR    R1                              ; 5433   0011
        BNEQ    L_542C                          ; 5434   022C 0009

        PULR    R1                              ; 5436   02B1
        PULR    R0                              ; 5437   02B0
        MOVR    R5,     R7                      ; 5438   00AF

        DECLE   $01C0,  $00C1,  $00C6,  $00E1   ; 5439   01C0 00C1 00C6 00E1
        DECLE   $01E0,  $00F1,  $00D6,  $00D1   ; 543D   01E0 00F1 00D6 00D1
        DECLE   $0010,  $0011,  $0012,  $0015   ; 5441   0010 0011 0012 0015
        DECLE   $0018,  $0019,  $001A,  $001B   ; 5445   0018 0019 001A 001B
        DECLE   $001C,  $001D,  $001E,  $001E   ; 5449   001C 001D 001E 001E
        DECLE   $001E,  $001F,  $0020,  $0025   ; 544D   001E 001F 0020 0025
        DECLE   $0009,  $000A,  $004D,  $004A   ; 5451   0009 000A 004D 004A
        DECLE   $0009,  $000A,  $0008,  $000A   ; 5455   0009 000A 0008 000A
        DECLE   $004D,  $004A,  $004C,  $004A   ; 5459   004D 004A 004C 004A
        DECLE   $0011,  $0012,  $0055,  $0052   ; 545D   0011 0012 0055 0052
        DECLE   $0001,  $0002,  $0045,  $0042   ; 5461   0001 0002 0045 0042
        DECLE   $000B,  $000A,  $004B,  $004A   ; 5465   000B 000A 004B 004A
        DECLE   $0029,  $002D,  $0033,  $0032   ; 5469   0029 002D 0033 0032
        DECLE   $0023,  $0022,  $004D,  $004A   ; 546D   0023 0022 004D 004A
        DECLE   $004C,  $004A,  $004C,  $004A   ; 5471   004C 004A 004C 004A
        DECLE   $0011,  $0012,  $0010,  $0012   ; 5475   0011 0012 0010 0012
        DECLE   $0010,  $0012,  $0010,  $0012   ; 5479   0010 0012 0010 0012
        DECLE   $0000,  $0002,  $0000,  $0002   ; 547D   0000 0002 0000 0002
        DECLE   $0000,  $0002,  $0000,  $0002   ; 5481   0000 0002 0000 0002
        DECLE   $0001,  $0054,  $0000,  $0078   ; 5485   0001 0054 0000 0078
        DECLE   $0000,  $00A8,  $0008,  $00A8   ; 5489   0000 00A8 0008 00A8
        DECLE   $0018,  $00A8,  $0030,  $0054   ; 548D   0018 00A8 0030 0054
        DECLE   $0068,  $0000,  $0060,  $0000   ; 5491   0068 0000 0060 0000
        DECLE   $0030,  $0000,  $0018,  $0018   ; 5495   0030 0000 0018 0018
        DECLE   $0000,  $0000,  $0022,  $0035   ; 5499   0000 0000 0022 0035

        MOVR    R0,     R4                      ; 549D   0084
        ADDR    R0,     R4                      ; 549E   00C4
        ADDR    R5,     R3                      ; 549F   00EB
        SUBR    R1,     R0                      ; 54A0   0108
        SUBR    R4,     R0                      ; 54A1   0120
        SUBR    R7,     R0                      ; 54A2   0138
        CMPR    R2,     R5                      ; 54A3   0155
        CMPR    R5,     R5                      ; 54A4   016D
        ANDR    R1,     R2                      ; 54A5   018A
        ANDR    R4,     R2                      ; 54A6   01A2
        XORR    R0,     R4                      ; 54A7   01C4
        PSHR    R5                              ; 54A8   0275
        MOVR    R1,     R3                      ; 54A9   008B
        MOVR    R1,     R0                      ; 54AA   0088

        JSR     R5,     .EXEC.76C               ; 54AB   0004 0114 036C
        JSR     R5,     .EXEC.760               ; 54AE   0004 0114 0360
        DECLE   $020C,  $005B,  $008C,  $0001   ; 54B1   020C 005B 008C 0001

        MVII    #$0011, R2                      ; 54B5   02BA 0011
        GSWD    R1                              ; 54B7   0031
        MVO@    R2,     R4                      ; 54B8   0262
        MOVR    R7,     R2                      ; 54B9   00BA
        ADDI    #$0030, R2                      ; 54BA   02FA 0030
        MVO@    R2,     R4                      ; 54BC   0262
        MOVR    R7,     R2                      ; 54BD   00BA
        ADDI    #$0033, R2                      ; 54BE   02FA 0033
        ADDR    R3,     R2                      ; 54C0   00DA
        MVI@    R2,     R2                      ; 54C1   0292
        SWAP    R2,     1                       ; 54C2   0042
        MVO@    R2,     R4                      ; 54C3   0262
        MVII    #$0058, R2                      ; 54C4   02BA 0058
        SWAP    R2,     1                       ; 54C6   0042
        MVO@    R2,     R4                      ; 54C7   0262
        MVII    #$0080, R2                      ; 54C8   02BA 0080
        MVO@    R2,     R4                      ; 54CA   0262
        MVII    #$0200, R2                      ; 54CB   02BA 0200
        MVO@    R2,     R4                      ; 54CD   0262
        MVII    #$0005, R2                      ; 54CE   02BA 0005
        MVO@    R2,     R4                      ; 54D0   0262
        MOVR    R3,     R0                      ; 54D1   0098

        JSR     R5,     L_5297                  ; 54D2   0004 0150 0297
        JSR     R5,     X_PLAY_SFX1             ; 54D5   0004 0118 03BB
        DECLE   $01C9                           ; 54D8  SFX data
        DECLE   $030D                           ; 54D9  SFX data
        DECLE   $021D                           ; 54DA  SFX data
        DECLE   $03C0,  $0060                   ; 54DB  SFX data
        DECLE   $02C8,  $0080                   ; 54DD  SFX data
        DECLE   $02D5                           ; 54DF  SFX data
        DECLE   $0001,  $0040                   ; 54E0  SFX data
        DECLE   $03D2                           ; 54E2  SFX data
        DECLE   $03EA                           ; 54E3  SFX data
        DECLE   $03E6                           ; 54E4  SFX data
        DECLE   $0103,  $03D0                   ; 54E5  SFX data
        DECLE   $008F,  $001F                   ; 54E7  SFX data
        DECLE   $02CF                           ; 54E9  SFX end

        DECLE   $0000,  $0000,  $00F3,  $0054   ; 54EA   0000 0000 00F3 0054
        DECLE   $0003,  $000D,  $0000           ; 54EE   0003 000D 0000

        ADCR    R5                              ; 54F1   002D
        RRC     R1,     2                       ; 54F2   0075
        PSHR    R5                              ; 54F3   0275

        JSR     R5,     L_5533                  ; 54F4   0004 0154 0133

        TSTR    R0                              ; 54F7   0080
        BEQ     L_54FF                          ; 54F8   0204 0005

        MVII    #$0040, R2                      ; 54FA   02BA 0040
        SWAP    R2,     1                       ; 54FC   0042
        XOR@    R1,     R2                      ; 54FD   03CA
        MVO@    R2,     R1                      ; 54FE   024A
L_54FF:
        ADDI    #$0002, R1                      ; 54FF   02F9 0002
        MVI@    R1,     R2                      ; 5501   028A
        ADDI    #$0300, R2                      ; 5502   02FA 0300
        MVO@    R2,     R1                      ; 5504   024A
        ADDI    #$0002, R1                      ; 5505   02F9 0002
        CLRR    R2                              ; 5507   01D2
        MVO@    R2,     R1                      ; 5508   024A
        ADDI    #$0002, R1                      ; 5509   02F9 0002
        MVII    #$0003, R2                      ; 550B   02BA 0003
        MVO@    R2,     R1                      ; 550D   024A
        PULR    R7                              ; 550E   02B7

        PSHR    R5                              ; 550F   0275
        MVII    #$0008, R3                      ; 5510   02BB 0008
        SWAP    R3,     1                       ; 5512   0043
        MVI@    R1,     R2                      ; 5513   028A
        XORR    R3,     R2                      ; 5514   01DA
        MVO@    R2,     R1                      ; 5515   024A
        ANDR    R3,     R2                      ; 5516   019A
        BNEQ    L_5528                          ; 5517   020C 000F

        MOVR    R1,     R3                      ; 5519   008B
        ADDI    #$0004, R3                      ; 551A   02FB 0004
        MVI@    R3,     R3                      ; 551C   029B
        MVII    #$0004, R2                      ; 551D   02BA 0004
        TSTR    R3                              ; 551F   009B
        BNEQ    L_5524                          ; 5520   020C 0002

        MVII    #$0002, R2                      ; 5522   02BA 0002
L_5524:
        ADDI    #$0006, R1                      ; 5524   02F9 0006
        MVO@    R2,     R1                      ; 5526   024A
        PULR    R7                              ; 5527   02B7

L_5528:
        CMPI    #$0002, R0                      ; 5528   0378 0002
        BGE     L_552F                          ; 552A   020D 0003

        JSR     R5,     L_5297                  ; 552C   0004 0150 0297
L_552F:
        JSR     R5,     .EXEC.7AE               ; 552F   0004 0114 03AE

        PULR    R7                              ; 5532   02B7

L_5533:
        PSHR    R2                              ; 5533   0272
        PSHR    R4                              ; 5534   0274
        MOVR    R1,     R4                      ; 5535   008C
        SDBD                                    ; 5536   0001
        MVII    #$1842, R2                      ; 5537   02BA 0042 0018
        MVO@    R2,     R4                      ; 553A   0262
        MOVR    R7,     R2                      ; 553B   00BA
        ADDI    #$000E, R2                      ; 553C   02FA 000E
        MVO@    R2,     R4                      ; 553E   0262
        ADDI    #$0003, R4                      ; 553F   02FC 0003
        MVII    #$0180, R2                      ; 5541   02BA 0180
        MVO@    R2,     R4                      ; 5543   0262
        MVII    #$0006, R2                      ; 5544   02BA 0006
        MVO@    R2,     R4                      ; 5546   0262
        PULR    R4                              ; 5547   02B4
        PULR    R2                              ; 5548   02B2
        MOVR    R5,     R7                      ; 5549   00AF

        DECLE   $0000,  $0000                   ; 554A   0000 0000

        INCR    R7                              ; 554C   000F

        RLC     R1,     2                       ; 554D   0055

L_554E:
        JSR     R4,     .EXEC.00A               ; 554E   0004 0010 000A

        MVO@    R3,     R3                      ; 5551   025B
        CMPR    R2,     R5                      ; 5552   0155
        CMPR    R3,     R3                      ; 5553   015B
        RLC     R1,     2                       ; 5554   0055
        CMPR    R3,     R3                      ; 5555   015B
        CMPR    R2,     R5                      ; 5556   0155
        CMP@    R3,     R3                      ; 5557   035B
        RLC     R1,     2                       ; 5558   0055
        CMP@    R3,     R3                      ; 5559   035B
        CMPR    R2,     R5                      ; 555A   0155
        PSHR    R5                              ; 555B   0275
        MVI@    R1,     R2                      ; 555C   028A
        MOVR    R3,     R0                      ; 555D   0098
        MOVR    R1,     R3                      ; 555E   008B

        JSR     R5,     .EXEC.76C               ; 555F   0004 0114 036C

        MVI@    R1,     R4                      ; 5562   028C
        ANDI    #$0002, R4                      ; 5563   03BC 0002
        BNEQ    L_559A                          ; 5565   020C 0033

        JSR     R5,     L_5533                  ; 5567   0004 0154 0133

        MVO@    R2,     R1                      ; 556A   024A

        JSR     R5,     L_559B                  ; 556B   0004 0154 019B

        MOVR    R3,     R1                      ; 556E   0099

        JSR     R5,     L_5533                  ; 556F   0004 0154 0133

        MVO@    R2,     R1                      ; 5572   024A
        ADDI    #$0004, R3                      ; 5573   02FB 0004
        MVI@    R3,     R0                      ; 5575   0298

        JSR     R5,     L_559B                  ; 5576   0004 0154 019B

        MVII    #$032D, R1                      ; 5579   02B9 032D

        JSR     R5,     .EXEC.760               ; 557B   0004 0114 0360

        BNEQ    L_558F                          ; 557E   020C 000F

        JSR     R5,     L_5533                  ; 5580   0004 0154 0133

        MVO@    R2,     R1                      ; 5583   024A

        JSR     R5,     L_559B                  ; 5584   0004 0154 019B

        DECR    R1                              ; 5587   0011
        DECR    R3                              ; 5588   0013
        MVI@    R3,     R0                      ; 5589   0298
        MVO@    R0,     R1                      ; 558A   0248
        DECR    R1                              ; 558B   0011
        DECR    R3                              ; 558C   0013
        MVI@    R3,     R0                      ; 558D   0298
        MVO@    R0,     R1                      ; 558E   0248
L_558F:
        MVII    #$0001, R0                      ; 558F   02B8 0001
        MVO     R0,     G_0166                  ; 5591   0240 0166
        MOVR    R2,     R1                      ; 5593   0091
        RLC     R1,     2                       ; 5594   0055
        RLC     R1,     2                       ; 5595   0055
        ANDR    R0,     R1                      ; 5596   0181

        JSR     R5,     L_5233                  ; 5597   0004 0150 0233

L_559A:
        PULR    R7                              ; 559A   02B7

L_559B:
        PSHR    R5                              ; 559B   0275
        ADDI    #$0004, R1                      ; 559C   02F9 0004
        PSHR    R1                              ; 559E   0271
        TSTR    R0                              ; 559F   0080
        BNEQ    L_55A7                          ; 55A0   020C 0005

        MOVR    R4,     R1                      ; 55A2   00A1
        ADDI    #$0005, R1                      ; 55A3   02F9 0005
        B       L_55AE                          ; 55A5   0200 0007

L_55A7:
        MVI@    R1,     R0                      ; 55A7   0288

        JSR     R5,     X_UNPK_BYTES            ; 55A8   0004 0114 0357
        JSR     R5,     .EXEC.A2F               ; 55AB   0004 0118 022F

L_55AE:
        MVII    #$0003, R0                      ; 55AE   02B8 0003

        JSR     R5,     X_RAND2                 ; 55B0   0004 0114 029E

        DECR    R0                              ; 55B3   0010
        ADDR    R0,     R1                      ; 55B4   00C1
        MOVR    R1,     R4                      ; 55B5   008C
        MVII    #$0028, R0                      ; 55B6   02B8 0028

        JSR     R5,     .EXEC.629               ; 55B8   0004 0114 0229

        PULR    R1                              ; 55BB   02B1
        MVO@    R0,     R1                      ; 55BC   0248
        PULR    R7                              ; 55BD   02B7

        PSHR    R5                              ; 55BE   0275
        MVII    #$0200, R4                      ; 55BF   02BC 0200
        MVII    #$00F0, R0                      ; 55C1   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 55C3   0004 0114 0338

        SDBD                                    ; 55C6   0001
        MVII    #$5D20, R5                      ; 55C7   02BD 0020 005D
        MVII    #$0206, R4                      ; 55CA   02BC 0206
        MVII    #$0002, R3                      ; 55CC   02BB 0002
L_55CE:
        MVII    #$0004, R2                      ; 55CE   02BA 0004
L_55D0:
        MVII    #$0008, R1                      ; 55D0   02B9 0008
L_55D2:
        MVI@    R5,     R0                      ; 55D2   02A8
        ANDI    #$0300, R0                      ; 55D3   03B8 0300
        SLL     R0,     2                       ; 55D5   004C
        XOR@    R5,     R0                      ; 55D6   03E8
        SWAP    R0,     1                       ; 55D7   0040
        ANDI    #$000F, R0                      ; 55D8   03B8 000F
        SLL     R0,     2                       ; 55DA   004C
        SLL     R0,     1                       ; 55DB   0048
        SDBD                                    ; 55DC   0001
        XORI    #$0805, R0                      ; 55DD   03F8 0005 0008
        MVO@    R0,     R4                      ; 55E0   0260
        DECR    R1                              ; 55E1   0011
        BNEQ    L_55D2                          ; 55E2   022C 0011

        ADDI    #$000C, R4                      ; 55E4   02FC 000C
        DECR    R2                              ; 55E6   0012
        BNEQ    L_55D0                          ; 55E7   022C 0018

        ADDI    #$001E, R4                      ; 55E9   02FC 001E
        DECR    R3                              ; 55EB   0013
        BNEQ    L_55CE                          ; 55EC   022C 001F

        MVII    #$0355, R2                      ; 55EE   02BA 0355
        MOVR    R7,     R1                      ; 55F0   00B9
        ADDI    #$0006, R1                      ; 55F1   02F9 0006

        JSR     R5,     X_INIT_MOB              ; 55F3   0004 0114 02B2

        PULR    R7                              ; 55F6   02B7

        DECLE   $0007,  $0030,  $0003,  $0056   ; 55F7   0007 0030 0003 0056
        DECLE   $0000,  $0020,  $0000,  $0050   ; 55FB   0000 0020 0000 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55FF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0014,  $0056   ; 5603   0000 0000 0014 0056
        DECLE   $0001,  $0032,  $0000           ; 5607   0001 0032 0000

        PSHR    R5                              ; 560A   0275
        MVII    #$0359, R1                      ; 560B   02B9 0359
        MVII    #$000F, R3                      ; 560D   02BB 000F
        SWAP    R3,     1                       ; 560F   0043
        MVII    #$0066, R2                      ; 5610   02BA 0066
        B       L_5627                          ; 5612   0200 0013

        PSHR    R5                              ; 5614   0275
        MVII    #$0002, R3                      ; 5615   02BB 0002
        SWAP    R3,     1                       ; 5617   0043
        XOR@    R1,     R3                      ; 5618   03CB
        MVO@    R3,     R1                      ; 5619   024B
        MVII    #$0066, R2                      ; 561A   02BA 0066
        ADDI    #$0004, R1                      ; 561C   02F9 0004
        MVI@    R1,     R3                      ; 561E   028B
        NEGR    R3                              ; 561F   0023
        MVI     G_015F, R0                      ; 5620   0280 015F
        DECR    R0                              ; 5622   0010
        BNEQ    L_5627                          ; 5623   020C 0002

        CLRR    R3                              ; 5625   01DB
        CLRR    R2                              ; 5626   01D2
L_5627:
        MVO@    R3,     R1                      ; 5627   024B
        ADDI    #$0002, R1                      ; 5628   02F9 0002
        MVO@    R2,     R1                      ; 562A   024A
        PULR    R7                              ; 562B   02B7

        PSHR    R5                              ; 562C   0275
        MVII    #$0003, R2                      ; 562D   02BA 0003
        MVII    #$031E, R1                      ; 562F   02B9 031E
L_5631:
        MVI@    R1,     R0                      ; 5631   0288
        TSTR    R0                              ; 5632   0080
        BEQ     L_563B                          ; 5633   0204 0006

        ADDI    #$0008, R1                      ; 5635   02F9 0008
        DECR    R2                              ; 5637   0012
        BNEQ    L_5631                          ; 5638   022C 0008
        PULR    R7                              ; 563A   02B7

L_563B:
        DECR    R1                              ; 563B   0011
        MOVR    R1,     R4                      ; 563C   008C
        MVII    #$0359, R2                      ; 563D   02BA 0359
        SDBD                                    ; 563F   0001
        MVII    #$1800, R3                      ; 5640   02BB 0000 0018
        MVO@    R3,     R4                      ; 5643   0263
        MOVR    R7,     R3                      ; 5644   00BB
        ADDI    #$0028, R3                      ; 5645   02FB 0028
        MVO@    R3,     R4                      ; 5647   0263
        MVI@    R2,     R1                      ; 5648   0291
        SUBI    #$0002, R2                      ; 5649   033A 0002
        MVI@    R2,     R3                      ; 564B   0293
        TSTR    R1                              ; 564C   0089
        BMI     L_5653                          ; 564D   020B 0004

        SDBD                                    ; 564F   0001
        ADDI    #$0800, R3                      ; 5650   02FB 0000 0008
L_5653:
        MVO@    R3,     R4                      ; 5653   0263
        INCR    R2                              ; 5654   000A
        MVI@    R2,     R3                      ; 5655   0293
        MVO@    R3,     R4                      ; 5656   0263
        MVII    #$00E4, R3                      ; 5657   02BB 00E4
        MVO@    R3,     R4                      ; 5659   0263
        MVII    #$0008, R3                      ; 565A   02BB 0008
        MVO@    R3,     R4                      ; 565C   0263
        MVO@    R0,     R4                      ; 565D   0260

        JSR     R5,     X_PLAY_SFX2             ; 565E   0004 0118 03BE
        DECLE   $0076                           ; 5661  SFX prio
        DECLE   $0279                           ; 5662  SFX data
        DECLE   $018D                           ; 5663  SFX data
        DECLE   $0235                           ; 5664  SFX data
        DECLE   $010E                           ; 5665  SFX data
        DECLE   $00AB                           ; 5666  SFX data
        DECLE   $000F,  $03FD                   ; 5667  SFX data
        DECLE   $03EE                           ; 5669  SFX data
        DECLE   $008F,  $001F                   ; 566A  SFX data
        DECLE   $02CF                           ; 566C  SFX end

        DECLE   $027E                           ; 566D   027E

        RLC     R2,     2                       ; 566E   0056
        SARC    R2,     2                       ; 566F   007E
        RLC     R2,     2                       ; 5670   0056

        JSR     R4,     .EXEC.009               ; 5671   0004 0010 0009

        MOVR    R5,     R0                      ; 5674   00A8
        RLC     R2,     2                       ; 5675   0056
        MVI     G_0156, R1                      ; 5676   0281 0156
        ANDR    R0,     R1                      ; 5678   0181
        RLC     R2,     2                       ; 5679   0056
        ANDR    R0,     R1                      ; 567A   0181
        CMPR    R2,     R6                      ; 567B   0156
        AND     G_0056, R1                      ; 567C   0381 0056
        J       .EXEC.7AE                       ; 567E   0004 0314 03AE

        PSHR    R5                              ; 5681   0275
        SLL     R3,     2                       ; 5682   004F
        SLL     R3,     1                       ; 5683   004B
        ADDI    #$031D, R3                      ; 5684   02FB 031D
        MVI@    R3,     R0                      ; 5686   0298
        SDBD                                    ; 5687   0001
        ANDI    #$4000, R0                      ; 5688   03B8 0000 0040
        BNEQ    L_56C5                          ; 568B   020C 0038

        SDBD                                    ; 568D   0001
        MVII    #$5210, R0                      ; 568E   02B8 0010 0052
        MVO@    R0,     R3                      ; 5691   0258
        ADDI    #$0004, R3                      ; 5692   02FB 0004
        CLRR    R2                              ; 5694   01D2
        MVO@    R2,     R3                      ; 5695   025A
        INCR    R3                              ; 5696   000B
        MVII    #$009A, R2                      ; 5697   02BA 009A
        MVO@    R2,     R3                      ; 5699   025A
        INCR    R3                              ; 569A   000B
        MVII    #$0014, R2                      ; 569B   02BA 0014
        MVO@    R2,     R3                      ; 569D   025A
        PSHR    R1                              ; 569E   0271

        JSR     R5,     L_522F                  ; 569F   0004 0150 022F
        JSR     R5,     L_52A8                  ; 56A2   0004 0150 02A8

        PULR    R1                              ; 56A5   02B1
        B       L_56AE                          ; 56A6   0200 0006

        PSHR    R5                              ; 56A8   0275
        MVI@    R1,     R2                      ; 56A9   028A
        ANDI    #$0002, R2                      ; 56AA   03BA 0002
        BNEQ    L_56C5                          ; 56AC   020C 0017

L_56AE:
        MOVR    R1,     R4                      ; 56AE   008C
        ADDI    #$0003, R4                      ; 56AF   02FC 0003
        MVI@    R4,     R3                      ; 56B1   02A3
        SDBD                                    ; 56B2   0001
        CMPI    #$4E00, R3                      ; 56B3   037B 0000 004E
        BGT     L_56C5                          ; 56B6   020E 000D

        SDBD                                    ; 56B8   0001
        MVII    #$1852, R3                      ; 56B9   02BB 0052 0018
        MVO@    R3,     R1                      ; 56BC   024B
        CLRR    R3                              ; 56BD   01DB
        MVO@    R3,     R4                      ; 56BE   0263
        MVII    #$0101, R3                      ; 56BF   02BB 0101
        MVO@    R3,     R4                      ; 56C1   0263
        MVII    #$000C, R3                      ; 56C2   02BB 000C
        MVO@    R3,     R4                      ; 56C4   0263
L_56C5:
        PULR    R7                              ; 56C5   02B7

        PSHR    R5                              ; 56C6   0275
        MVII    #$0200, R4                      ; 56C7   02BC 0200
        MVII    #$00F0, R0                      ; 56C9   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 56CB   0004 0114 0338

        MOVR    R7,     R4                      ; 56CE   00BC
        ADDI    #$00B8, R4                      ; 56CF   02FC 00B8
L_56D1:
        MVI@    R4,     R2                      ; 56D1   02A2
        TSTR    R2                              ; 56D2   0092
        BEQ     L_56F6                          ; 56D3   0204 0021

        MOVR    R2,     R3                      ; 56D5   0093
        ANDI    #$003F, R3                      ; 56D6   03BB 003F
        XORR    R3,     R2                      ; 56D8   01DA
        SLL     R2,     2                       ; 56D9   004E
        SWAP    R2,     1                       ; 56DA   0042
        MVII    #$0013, R0                      ; 56DB   02B8 0013
        SARC    R3,     1                       ; 56DD   007B
        ADCR    R7                              ; 56DE   002F

        CLRR    R0                              ; 56DF   01C0
L_56E0:
        INCR    R0                              ; 56E0   0008
        SARC    R3,     1                       ; 56E1   007B
        ADCR    R7                              ; 56E2   002F

        NEGR    R0                              ; 56E3   0020
L_56E4:
        ADDR    R7,     R3                      ; 56E4   00FB
        ADDI    #$00BB, R3                      ; 56E5   02FB 00BB
        MVI@    R3,     R3                      ; 56E7   029B
        SLL     R3,     2                       ; 56E8   004F
        XORI    #$0007, R3                      ; 56E9   03FB 0007
        SARC    R2,     1                       ; 56EB   007A
        ADCR    R7                              ; 56EC   002F

        MVI@    R4,     R1                      ; 56ED   02A1
L_56EE:
        MVO@    R3,     R1                      ; 56EE   024B
        ADDR    R0,     R1                      ; 56EF   00C1
        DECR    R2                              ; 56F0   0012
        BPL     L_56EE                          ; 56F1   0223 0004
        B       L_56D1                          ; 56F3   0220 0023

L_56F5:
        PSHR    R5                              ; 56F5   0275
L_56F6:
        MVII    #$031D, R5                      ; 56F6   02BD 031D
        MOVR    R7,     R4                      ; 56F8   00BC
        ADDI    #$003A, R4                      ; 56F9   02FC 003A
        MVII    #$0008, R2                      ; 56FB   02BA 0008
L_56FD:
        SDBD                                    ; 56FD   0001
        MVI@    R4,     R0                      ; 56FE   02A0
        MVO@    R0,     R5                      ; 56FF   0268
        DECR    R2                              ; 5700   0012
        BNEQ    L_56FD                          ; 5701   022C 0005

        MVII    #$0007, R2                      ; 5703   02BA 0007
L_5705:
        MVI@    R4,     R0                      ; 5705   02A0
        SDBD                                    ; 5706   0001
        XORI    #$9840, R0                      ; 5707   03F8 0040 0098
        MVO@    R0,     R5                      ; 570A   0268
        MOVR    R7,     R0                      ; 570B   00B8
        ADDI    #$0061, R0                      ; 570C   02F8 0061
        MVO@    R0,     R5                      ; 570E   0268
        MVI@    R4,     R0                      ; 570F   02A0
        SWAP    R0,     1                       ; 5710   0040
        MVO@    R0,     R5                      ; 5711   0268
        MVI@    R4,     R0                      ; 5712   02A0
        SWAP    R0,     1                       ; 5713   0040
        MVO@    R0,     R5                      ; 5714   0268
        SDBD                                    ; 5715   0001
        MVI@    R4,     R0                      ; 5716   02A0
        MVO@    R0,     R5                      ; 5717   0268
        MVII    #$000D, R0                      ; 5718   02B8 000D
        MVI@    R4,     R3                      ; 571A   02A3
        SARC    R3,     1                       ; 571B   007B
        ADCR    R0                              ; 571C   0028
        MVO@    R0,     R5                      ; 571D   0268
        NEGR    R3                              ; 571E   0023
        MVO@    R3,     R5                      ; 571F   026B
        INCR    R5                              ; 5720   000D
        DECR    R2                              ; 5721   0012
        BNEQ    L_5705                          ; 5722   022C 001E

        MVII    #$0116, R5                      ; 5724   02BD 0116
        MVII    #$0058, R0                      ; 5726   02B8 0058
        MVO@    R0,     R5                      ; 5728   0268
        MVII    #$0010, R3                      ; 5729   02BB 0010
        MVO@    R3,     R5                      ; 572B   026B
        MVO@    R0,     R5                      ; 572C   0268
        MVO@    R3,     R5                      ; 572D   026B
        MVO     R0,     G_0187                  ; 572E   0240 0187
        MVO     R2,     G_0186                  ; 5730   0242 0186
        PULR    R7                              ; 5732   02B7

        DECLE   $0013,  $0098,  $0078,  $0057   ; 5733   0013 0098 0078 0057
        DECLE   $0000,  $006B,  $0000,  $0037   ; 5737   0000 006B 0000 0037
        DECLE   $03F1,  $001E,  $0000,  $0000   ; 573B   03F1 001E 0000 0000
        DECLE   $00FB,  $00FF,  $0078,  $0057   ; 573F   00FB 00FF 0078 0057
        DECLE   $0200,  $007A,  $0030,  $0000   ; 5743   0200 007A 0030 0000
        DECLE   $0000,  $003D,  $0211,  $0072   ; 5747   0000 003D 0211 0072
        DECLE   $0030,  $03FB,  $03FB,  $001E   ; 574B   0030 03FB 03FB 001E
        DECLE   $0012,  $0064,  $0028,  $0005   ; 574F   0012 0064 0028 0005
        DECLE   $0005,  $0000,  $0211           ; 5753   0005 0000 0211

        RRC     R2,     1                       ; 5756   0072
        RSWD    R4                              ; 5757   003C
        INCR    R7                              ; 5758   000F

        XOR@    R4,     R2                      ; 5759   03E2
L_575A:
        ADCR    R0                              ; 575A   0028
        DECLE   $0211,  $0072,  $0012,  $03FF   ; 575B   0211 0072 0012 03FF
        DECLE   $03D8,  $0028,  $0002,  $0056   ; 575F   03D8 0028 0002 0056
        DECLE   $001C,  $0005                   ; 5763   001C 0005

        XOR@    R6,     R6                      ; 5765   03F6
        DECR    R5                              ; 5766   0015
        EIS                                     ; 5767   0002
        RLC     R2,     1                       ; 5768   0052
        RSWD    R6                              ; 5769   003E
        XORI    #$03F6, R3                      ; 576A   03FB 03F6
        DECR    R5                              ; 576C   0015
        AND@    R2,     R3                      ; 576D   0393
        SLLC    R1,     1                       ; 576E   0059
        INCR    R7                              ; 576F   000F

        SLLC    R0,     1                       ; 5770   0058
L_5771:
        INCR    R0                              ; 5771   0008
        DECLE   $0019,  $0004,  $00C5,  $0158   ; 5772   0019 0004 00C5 0158
        DECLE   $0254,  $0058,  $02A6,  $0058   ; 5776   0254 0058 02A6 0058
        DECLE   $001B,  $0058,  $0001,  $0031   ; 577A   001B 0058 0001 0031
        DECLE   $0008,  $014D,  $0059,  $014D   ; 577E   0008 014D 0059 014D
        DECLE   $0159,  $036C,  $0059,  $036C   ; 5782   0159 036C 0059 036C
        DECLE   $0159,  $01A4,  $0227,  $0054   ; 5786   0159 01A4 0227 0054
        DECLE   $01E4,  $0054,  $03C8,  $0053   ; 578A   01E4 0054 03C8 0053
        DECLE   $03C3,  $005A,  $03CE,  $005E   ; 578E   03C3 005A 03CE 005E
        DECLE   $01E2,  $005E,  $01E2,  $03A8   ; 5792   01E2 005E 01E2 03A8
        DECLE   $0263,  $0068,  $03A8,  $028B   ; 5796   0263 0068 03A8 028B
        DECLE   $0068,  $0387,  $0232,  $0387   ; 579A   0068 0387 0232 0387
        DECLE   $0237,  $0000,  $0180,  $0182   ; 579E   0237 0000 0180 0182
        DECLE   $0190,  $0196,  $0234,  $0236   ; 57A2   0190 0196 0234 0236
        DECLE   $0238,  $023A,  $023C,  $023E   ; 57A6   0238 023A 023C 023E

        MVO     R0,     .BTAB.75                ; 57AA   0240 0275
        MVII    #$0329, R1                      ; 57AC   02B9 0329
        MVII    #$0007, R2                      ; 57AE   02BA 0007
L_57B0:
        MVI@    R1,     R0                      ; 57B0   0288
        SUBI    #$0004, R1                      ; 57B1   0339 0004
        MVII    #$0200, R3                      ; 57B3   02BB 0200
        COMR    R3                              ; 57B5   001B
        AND@    R1,     R3                      ; 57B6   038B
        BMI     L_57C1                          ; 57B7   020B 0008

        TSTR    R0                              ; 57B9   0080
        BEQ     L_57C1                          ; 57BA   0204 0005
        BPL     L_57C0                          ; 57BC   0203 0002

        XORI    #$0200, R3                      ; 57BE   03FB 0200
L_57C0:
        MVO@    R3,     R1                      ; 57C0   024B
L_57C1:
        ADDI    #$000C, R1                      ; 57C1   02F9 000C
        DECR    R2                              ; 57C3   0012
        BNEQ    L_57B0                          ; 57C4   022C 0015

        MVI     G_0186, R0                      ; 57C6   0280 0186
        TSTR    R0                              ; 57C8   0080
        BEQ     L_57D7                          ; 57C9   0204 000C

        JSR     R5,     .EXEC.772               ; 57CB   0004 0114 0372

        SWAP    R2,     1                       ; 57CE   0042
        XORR    R3,     R2                      ; 57CF   01DA
        MVII    #$0014, R3                      ; 57D0   02BB 0014
        MVII    #$032D, R1                      ; 57D2   02B9 032D

        JSR     R5,     .EXEC.9A3               ; 57D4   0004 0118 01A3

L_57D7:
        PULR    R7                              ; 57D7   02B7

L_57D8:
        PSHR    R5                              ; 57D8   0275
        MVI     G_015F, R0                      ; 57D9   0280 015F
        CMPI    #$0002, R0                      ; 57DB   0378 0002
        BEQ     L_57E4                          ; 57DD   0204 0005

        MVII    #$0001, R0                      ; 57DF   02B8 0001
        MVO     R0,     G_015F                  ; 57E1   0240 015F
        PULR    R7                              ; 57E3   02B7

L_57E4:
        MVII    #$031D, R1                      ; 57E4   02B9 031D
        MVII    #$0008, R2                      ; 57E6   02BA 0008
L_57E8:
        MVI@    R1,     R0                      ; 57E8   0288
        SLL     R0,     1                       ; 57E9   0048
        SLR     R0,     1                       ; 57EA   0060
        MVO@    R0,     R1                      ; 57EB   0248
        ADDI    #$0005, R1                      ; 57EC   02F9 0005
        MVI@    R1,     R0                      ; 57EE   0288
        XORI    #$03E0, R0                      ; 57EF   03F8 03E0
        MVO@    R0,     R1                      ; 57F1   0248
        INCR    R1                              ; 57F2   0009
        MVI@    R1,     R0                      ; 57F3   0288
        NEGR    R0                              ; 57F4   0020
        MVO@    R0,     R1                      ; 57F5   0248
        ADDI    #$0002, R1                      ; 57F6   02F9 0002
        DECR    R2                              ; 57F8   0012
        BNEQ    L_57E8                          ; 57F9   022C 0012

        JSR     R5,     X_PLAY_SFX2             ; 57FB   0004 0118 03BE
        DECLE   $0070                           ; 57FE  SFX prio
        DECLE   $0389                           ; 57FF  SFX data
        DECLE   $0200,  $02C0                   ; 5800  SFX data
        DECLE   $0218,  $0100                   ; 5802  SFX data
        DECLE   $0214,  $0300                   ; 5804  SFX data
        DECLE   $0001,  $0303                   ; 5806  SFX data
        DECLE   $00CE                           ; 5808  SFX data
        DECLE   $00EB                           ; 5809  SFX data
        DECLE   $038E                           ; 580A  SFX data
        DECLE   $0001,  $01E3                   ; 580B  SFX data
        DECLE   $02EB                           ; 580D  SFX data
        DECLE   $02CF                           ; 580E  SFX end


        MOVR    R7,     R2                      ; 580F   00BA
        ADDI    #$0003, R2                      ; 5810   02FA 0003
        ADDR    R0,     R2                      ; 5812   00C2
        ADD@    R2,     R7                      ; 5813   02D7

        DECLE   $0018,  $0035                   ; 5814   0018 0035

        MOVR    R2,     R7                      ; 5816   0097

        ADDR    R7,     R5                      ; 5817   00FD
        ADDR    R7,     R5                      ; 5818   00FD
        SUBR    R1,     R7                      ; 5819   010F
        SUBR    R1,     R7                      ; 581A   010F

        PSHR    R5                              ; 581B   0275
        MVO     R0,     G_031E                  ; 581C   0240 031E
        MVII    #$0003, R0                      ; 581E   02B8 0003

        JSR     R5,     X_RAND2                 ; 5820   0004 0114 029E

        DECR    R0                              ; 5823   0010
        MOVR    R0,     R1                      ; 5824   0081

        JSR     R5,     .EXEC.628               ; 5825   0004 0114 0228

        INCR    R2                              ; 5828   000A
        MVO     R0,     G_0329                  ; 5829   0240 0329
        PULR    R7                              ; 582B   02B7

        CLRR    R0                              ; 582C   01C0
        MVO     R0,     G_0187                  ; 582D   0240 0187
        MVO     R0,     G_0329                  ; 582F   0240 0329
        MVO     R0,     G_0321                  ; 5831   0240 0321
        MVI     G_0327, R0                      ; 5833   0280 0327
        MVO     R0,     G_031F                  ; 5835   0240 031F
        MVI     G_0328, R0                      ; 5837   0280 0328
        SWAP    R0,     1                       ; 5839   0040
        ANDI    #$00FF, R0                      ; 583A   03B8 00FF
        DECR    R0                              ; 583C   0010
        SWAP    R0,     1                       ; 583D   0040
        MVO     R0,     G_0320                  ; 583E   0240 0320
        MVI     G_0324, R0                      ; 5840   0280 0324
        MVO     R0,     G_031E                  ; 5842   0240 031E
        MVII    #$0008, R0                      ; 5844   02B8 0008
        MVO     R0,     G_032A                  ; 5846   0240 032A
        MOVR    R5,     R7                      ; 5848   00AF

        MVII    #$020E, R2                      ; 5849   02BA 020E
        MVO     R2,     G_0332                  ; 584B   0242 0332
        MVO     R2,     G_033A                  ; 584D   0242 033A
        MVII    #$0004, R2                      ; 584F   02BA 0004
        MVO     R2,     G_0333                  ; 5851   0242 0333
        MOVR    R5,     R7                      ; 5853   00AF

        CMPI    #$0003, R0                      ; 5854   0378 0003
        BEQ     L_5890                          ; 5856   0204 0038

        PSHR    R5                              ; 5858   0275
        SUB     G_0186, R0                      ; 5859   0300 0186
        BNEQ    L_588F                          ; 585B   020C 0032

        MOVR    R1,     R4                      ; 585D   008C
        ADDI    #$0004, R4                      ; 585E   02FC 0004
        MVO     R0,     G_0186                  ; 5860   0240 0186
        MVO@    R0,     R4                      ; 5862   0260
        MVO     R0,     G_0331                  ; 5863   0240 0331
        MVII    #$000A, R3                      ; 5865   02BB 000A
        MVO     R3,     G_0332                  ; 5867   0243 0332
        INCR    R3                              ; 5869   000B
        MVO@    R3,     R4                      ; 586A   0263
        MVO@    R2,     R4                      ; 586B   0262
        SDBD                                    ; 586C   0001
        MVII    #$1051, R2                      ; 586D   02BA 0051 0010
        MVO     R2,     G_032D                  ; 5870   0242 032D

L_5872:
        JSR     R5,     X_PLAY_WHST1            ; 5872   0004 011C 031B

        SDBD                                    ; 5875   0001
        MVII    #$1906, R0                      ; 5876   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5879   0240 035D

        JSR     R5,     .EXEC.A61               ; 587B   0004 0118 0261

        DECR    R4                              ; 587E   0014

        JSR     R5,     L_56F5                  ; 587F   0004 0154 02F5
        JSR     R5,     .EXEC.A61               ; 5882   0004 0118 0261

        INCR    R2                              ; 5885   000A

        JSR     R5,     L_57D8                  ; 5886   0004 0154 03D8

        SDBD                                    ; 5889   0001
        MVII    #$5031, R0                      ; 588A   02B8 0031 0050
        MVO     R0,     G_035D                  ; 588D   0240 035D
L_588F:
        PULR    R7                              ; 588F   02B7

L_5890:
        PSHR    R5                              ; 5890   0275
        SDBD                                    ; 5891   0001
        MVII    #$1251, R2                      ; 5892   02BA 0051 0012
        MVO     R2,     G_032D                  ; 5895   0242 032D
        CLRR    R2                              ; 5897   01D2
        MVO     R2,     G_0331                  ; 5898   0242 0331
        MVO     R2,     G_0339                  ; 589A   0242 0339
        MVII    #$0004, R0                      ; 589C   02B8 0004

        JSR     R5,     X_RAND1                 ; 589E   0004 0114 027D

        ADDI    #$003C, R0                      ; 58A1   02F8 003C
        MVO     R0,     G_033B                  ; 58A3   0240 033B
        PULR    R7                              ; 58A5   02B7

        PSHR    R5                              ; 58A6   0275
        INCR    R1                              ; 58A7   0009
        MVO@    R0,     R1                      ; 58A8   0248
        B       L_5872                          ; 58A9   0220 0038

        PSHR    R5                              ; 58AB   0275
        MVII    #$0325, R1                      ; 58AC   02B9 0325

        JSR     R5,     .EXEC.777               ; 58AE   0004 0114 0377

        SWAP    R2,     1                       ; 58B1   0042
        XORR    R3,     R2                      ; 58B2   01DA
        MVII    #$032D, R1                      ; 58B3   02B9 032D
        MVII    #$000A, R3                      ; 58B5   02BB 000A

        JSR     R5,     .EXEC.9A3               ; 58B7   0004 0118 01A3

        MVII    #$0335, R1                      ; 58BA   02B9 0335
        MVII    #$0014, R3                      ; 58BC   02BB 0014

        JSR     R5,     .EXEC.9A3               ; 58BE   0004 0118 01A3

        CLRR    R3                              ; 58C1   01DB
        MVO     R3,     G_0333                  ; 58C2   0243 0333
        PULR    R7                              ; 58C4   02B7

        DECLE   $0275,  $0001,  $02BB,  $0052   ; 58C5   0275 0001 02BB 0052
        DECLE   $0010,  $024B,  $01DB,  $0243   ; 58C9   0010 024B 01DB 0243
        DECLE   $031E,  $0243,  $0339,  $0243   ; 58CD   031E 0243 0339 0243
        DECLE   $0331,  $02BB,  $0009,  $0243   ; 58D1   0331 02BB 0009 0243
        DECLE   $0332,  $000B,  $0243,  $033A   ; 58D5   0332 000B 0243 033A
        DECLE   $000B,  $0243,  $032A,  $033F   ; 58D9   000B 0243 032A 033F
        DECLE   $006D                           ; 58DD   006D

        PSHR    R5                              ; 58DE   0275
        MVI     G_0187, R2                      ; 58DF   0282 0187
        TSTR    R2                              ; 58E1   0092
        BEQ     L_58E5                          ; 58E2   0204 0001
        PULR    R7                              ; 58E4   02B7

L_58E5:
        INCR    R2                              ; 58E5   000A
        MVO     R2,     G_0187                  ; 58E6   0242 0187
        MVII    #$0009, R3                      ; 58E8   02BB 0009
        MVO     R3,     G_0332                  ; 58EA   0243 0332
        MVO     R3,     G_033A                  ; 58EC   0243 033A
        MVO     R3,     G_032A                  ; 58EE   0243 032A
        SDBD                                    ; 58F0   0001
        MVII    #$1A40, R3                      ; 58F1   02BB 0040 001A
        MVO     R3,     G_0325                  ; 58F4   0243 0325
        CLRR    R3                              ; 58F6   01DB
        MVO     R3,     G_0331                  ; 58F7   0243 0331
        MVO     R3,     G_0339                  ; 58F9   0243 0339
        MVO     R3,     G_0333                  ; 58FB   0243 0333
        MVO     R3,     G_033B                  ; 58FD   0243 033B
        MVII    #$00B0, R3                      ; 58FF   02BB 00B0
        SWAP    R3,     1                       ; 5901   0043
        MVO     R3,     G_0321                  ; 5902   0243 0321

        JSR     R5,     X_PLAY_SFX1             ; 5904   0004 0118 03BB
        DECLE   $03E9                           ; 5907  SFX data
        DECLE   $02C0,  $0040                   ; 5908  SFX data
        DECLE   $00DB                           ; 590A  SFX data
        DECLE   $0001,  $0004                   ; 590B  SFX data
        DECLE   $009B                           ; 590D  SFX data
        DECLE   $008F,  $012B                   ; 590E  SFX data
        DECLE   $02CF                           ; 5910  SFX end


        PSHR    R5                              ; 5911   0275

        JSR     R5,     .EXEC.777               ; 5912   0004 0114 0377

        MVI     G_0328, R2                      ; 5915   0282 0328
        SWAP    R2,     1                       ; 5917   0042
        ANDI    #$007F, R2                      ; 5918   03BA 007F
        SUBR    R2,     R3                      ; 591A   0113
        BPL     L_591F                          ; 591B   0203 0002

        NEGR    R3                              ; 591D   0023
        CLRR    R0                              ; 591E   01C0
L_591F:
        ADDI    #$0008, R3                      ; 591F   02FB 0008
        B       L_592B                          ; 5921   0200 0008

        PSHR    R5                              ; 5923   0275
        MVII    #$000A, R3                      ; 5924   02BB 000A
        MVII    #$0001, R0                      ; 5926   02B8 0001

        JSR     R5,     X_RAND1                 ; 5928   0004 0114 027D

L_592B:
        MVII    #$000E, R2                      ; 592B   02BA 000E
        TSTR    R0                              ; 592D   0080
        BEQ     L_5931                          ; 592E   0204 0001

        NEGR    R2                              ; 5930   0022
L_5931:
        SDBD                                    ; 5931   0001
        MVII    #$0015, R0                      ; 5932   02B8 0015 0000

        JSR     R5,     X_RAND2                 ; 5935   0004 0114 029E

        SUBI    #$000A, R0                      ; 5938   0338 000A
        ANDI    #$00FF, R0                      ; 593A   03B8 00FF
        ANDI    #$00FF, R2                      ; 593C   03BA 00FF
        SWAP    R0,     1                       ; 593E   0040
        XORR    R2,     R0                      ; 593F   01D0
        ADDI    #$0004, R1                      ; 5940   02F9 0004
        MVO@    R0,     R1                      ; 5942   0248
        MVII    #$0004, R0                      ; 5943   02B8 0004

        JSR     R5,     X_RAND2                 ; 5945   0004 0114 029E

        ADDR    R0,     R3                      ; 5948   00C3
        ADDI    #$0002, R1                      ; 5949   02F9 0002
        MVO@    R3,     R1                      ; 594B   024B
        PULR    R7                              ; 594C   02B7

        PSHR    R5                              ; 594D   0275
        SLL     R3,     2                       ; 594E   004F
        SLL     R3,     1                       ; 594F   004B
        SDBD                                    ; 5950   0001
        ADDI    #$0321, R3                      ; 5951   02FB 0021 0003
        MOVR    R3,     R4                      ; 5954   009C
        MVO@    R0,     R4                      ; 5955   0260
        SDBD                                    ; 5956   0001
        MVII    #$0009, R2                      ; 5957   02BA 0009 0000
        MVO@    R2,     R4                      ; 595A   0262
        MVO@    R0,     R4                      ; 595B   0260

        JSR     R5,     L_522C                  ; 595C   0004 0150 022C

        CLRR    R0                              ; 595F   01C0
        MVO     R0,     G_031E                  ; 5960   0240 031E

        JSR     R5,     L_50E2                  ; 5962   0004 0150 00E2

        MVII    #$0003, R0                      ; 5965   02B8 0003

        JSR     R5,     X_PLAY_CHEER1           ; 5967   0004 011C 02D5
        DECLE   $033F,  $00F8                   ; 596A   033F 00F8

        PSHR    R5                              ; 596C   0275
        MVO     R3,     G_0186                  ; 596D   0243 0186
        MOVR    R3,     R0                      ; 596F   0098

        JSR     R5,     .EXEC.76C               ; 5970   0004 0114 036C

        MVII    #$000C, R3                      ; 5973   02BB 000C
        SDBD                                    ; 5975   0001
        MVII    #$7858, R2                      ; 5976   02BA 0058 0078

        JSR     R5,     .EXEC.9A1               ; 5979   0004 0118 01A1

        MVII    #$03E0, R2                      ; 597C   02BA 03E0
        MVO     R2,     G_0332                  ; 597E   0242 0332
        SDBD                                    ; 5980   0001
        MVII    #$1851, R2                      ; 5981   02BA 0051 0018
        MVO     R2,     G_032D                  ; 5984   0242 032D
        SDBD                                    ; 5986   0001
        MVII    #$1052, R2                      ; 5987   02BA 0052 0010
        MVO     R2,     G_0335                  ; 598A   0242 0335
        CLRR    R0                              ; 598C   01C0
        MVO     R0,     G_031E                  ; 598D   0240 031E

        JSR     R5,     L_50E2                  ; 598F   0004 0150 00E2

        PULR    R7                              ; 5992   02B7

        CMP     G_0186, R0                      ; 5993   0340 0186
        BNEQ    L_599B                          ; 5995   020C 0004

        ADDI    #$0002, R1                      ; 5997   02F9 0002
        MVO@    R3,     R1                      ; 5999   024B
        MOVR    R5,     R7                      ; 599A   00AF

L_599B:
        MVII    #$0001, R0                      ; 599B   02B8 0001
        ADDI    #$0006, R1                      ; 599D   02F9 0006
        MVO@    R0,     R1                      ; 599F   0248
        MOVR    R5,     R7                      ; 59A0   00AF

        PSHR    R5                              ; 59A1   0275
        MVII    #$0200, R2                      ; 59A2   02BA 0200
        MOVR    R7,     R5                      ; 59A4   00BD
        ADDI    #$0054, R5                      ; 59A5   02FD 0054
        MVII    #$000A, R3                      ; 59A7   02BB 000A
L_59A9:
        MVII    #$0004, R4                      ; 59A9   02BC 0004
L_59AB:
        MVI@    R5,     R0                      ; 59AB   02A8
        PSHR    R5                              ; 59AC   0275
        MVII    #$0003, R5                      ; 59AD   02BD 0003
L_59AF:
        MOVR    R0,     R1                      ; 59AF   0081
        ANDI    #$0007, R1                      ; 59B0   03B9 0007
        SLR     R0,     2                       ; 59B2   0064
        SLR     R0,     1                       ; 59B3   0060
        ADDR    R7,     R1                      ; 59B4   00F9
        ADDI    #$003C, R1                      ; 59B5   02F9 003C
        MVI@    R1,     R1                      ; 59B7   0289
        SLL     R1,     2                       ; 59B8   004D
        XORI    #$0004, R1                      ; 59B9   03F9 0004
        MVO@    R1,     R2                      ; 59BB   0251
        PSHR    R2                              ; 59BC   0272
        ADDR    R3,     R2                      ; 59BD   00DA
        ADDR    R3,     R2                      ; 59BE   00DA
        DECR    R2                              ; 59BF   0012
        PSHR    R1                              ; 59C0   0271
        SDBD                                    ; 59C1   0001
        ANDI    #$0800, R1                      ; 59C2   03B9 0000 0008
        PULR    R1                              ; 59C5   02B1
        BNEQ    L_59CA                          ; 59C6   020C 0002

        XORI    #$0008, R1                      ; 59C8   03F9 0008
L_59CA:
        MVO@    R1,     R2                      ; 59CA   0251
        PULR    R2                              ; 59CB   02B2
        ADDI    #$0014, R2                      ; 59CC   02FA 0014
        DECR    R5                              ; 59CE   0015
        BNEQ    L_59AF                          ; 59CF   022C 0021

        PULR    R5                              ; 59D1   02B5
        DECR    R4                              ; 59D2   0014
        BNEQ    L_59AB                          ; 59D3   022C 0029

        SUBI    #$00EF, R2                      ; 59D5   033A 00EF
        DECR    R3                              ; 59D7   0013
        BNEQ    L_59A9                          ; 59D8   022C 0030

        MVII    #$0004, R3                      ; 59DA   02BB 0004
L_59DC:
        MVI@    R5,     R1                      ; 59DC   02A9
        ADDI    #$0200, R1                      ; 59DD   02F9 0200
        SDBD                                    ; 59DF   0001
        MVI@    R5,     R2                      ; 59E0   02AA
        MVO@    R2,     R1                      ; 59E1   024A
        DECR    R3                              ; 59E2   0013
        BNEQ    L_59DC                          ; 59E3   022C 0008

        MVII    #$031D, R1                      ; 59E5   02B9 031D

        JSR     R5,     L_5C8C                  ; 59E7   0004 015C 008C

        MVII    #$0325, R1                      ; 59EA   02B9 0325

        JSR     R5,     L_5C8C                  ; 59EC   0004 015C 008C

        PULR    R7                              ; 59EF   02B7

        DECLE   $0242,  $0244,  $0246,  $021C   ; 59F0   0242 0244 0246 021C
        DECLE   $021E                           ; 59F4   021E

        ADDR    R5,     R0                      ; 59F5   00E8
        ADDR    R5,     R4                      ; 59F6   00EC
        ADDR    R5,     R6                      ; 59F7   00EE
        ADDR    R5,     R2                      ; 59F8   00EA
        MOVR    R2,     R7                      ; 59F9   0097

        TSTR    R2                              ; 59FA   0092
        ADDR    R3,     R3                      ; 59FB   00DB
        TSTR    R2                              ; 59FC   0092
        MOVR    R2,     R3                      ; 59FD   0093
        TSTR    R2                              ; 59FE   0092
        SUBR    R3,     R5                      ; 59FF   011D
        TSTR    R2                              ; 5A00   0092
        ANDR    R2,     R3                      ; 5A01   0193
        ADDR    R3,     R3                      ; 5A02   00DB
        ADDR    R3,     R3                      ; 5A03   00DB
        ANDR    R7,     R3                      ; 5A04   01BB
        ADDR    R2,     R4                      ; 5A05   00D4
        ADDR    R2,     R4                      ; 5A06   00D4
        ADDR    R5,     R2                      ; 5A07   00EA
        ADDR    R3,     R3                      ; 5A08   00DB
        ADDR    R2,     R2                      ; 5A09   00D2
        ADDR    R2,     R2                      ; 5A0A   00D2
        ADDR    R2,     R2                      ; 5A0B   00D2
        ADDR    R5,     R2                      ; 5A0C   00EA
        ADDR    R6,     R2                      ; 5A0D   00F2
        ADDR    R3,     R3                      ; 5A0E   00DB
        ADDR    R3,     R3                      ; 5A0F   00DB
        ADDR    R3,     R3                      ; 5A10   00DB
        ADDR    R3,     R2                      ; 5A11   00DA
        ADDR    R3,     R3                      ; 5A12   00DB
        ADDR    R3,     R3                      ; 5A13   00DB
        ADDR    R3,     R3                      ; 5A14   00DB
        MOVR    R3,     R2                      ; 5A15   009A
        MOVR    R3,     R2                      ; 5A16   009A
        MOVR    R3,     R2                      ; 5A17   009A
        ADDR    R6,     R2                      ; 5A18   00F2
        XORR    R3,     R6                      ; 5A19   01DE
        MOVR    R3,     R2                      ; 5A1A   009A
        MOVR    R3,     R2                      ; 5A1B   009A
        ADDR    R3,     R6                      ; 5A1C   00DE
        ADDR    R3,     R3                      ; 5A1D   00DB
        ADDR    R3,     R3                      ; 5A1E   00DB
        ADDR    R3,     R3                      ; 5A1F   00DB
        ADDR    R4,     R3                      ; 5A20   00E3
        COMR    R5                              ; 5A21   001D
        DECR    R0                              ; 5A22   0010
        COMR    R1                              ; 5A23   0019
        COMR    R6                              ; 5A24   001E
        COMR    R0                              ; 5A25   0018
        COMR    R1                              ; 5A26   0019
        MOVR    R1,     R4                      ; 5A27   008C
        INCR    R0                              ; 5A28   0008
        INCR    R1                              ; 5A29   0009
        MOVR    R3,     R7                      ; 5A2A   009F

        INCR    R0                              ; 5A2B   0008
        INCR    R1                              ; 5A2C   0009
        PSHR    R5                              ; 5A2D   0275
        MVII    #$032D, R1                      ; 5A2E   02B9 032D
        MVII    #$0005, R3                      ; 5A30   02BB 0005

        JSR     R5,     L_5A81                  ; 5A32   0004 0158 0281

        BNEQ    L_5A58                          ; 5A35   020C 0021

        MOVR    R1,     R4                      ; 5A37   008C

        JSR     R5,     L_5A9D                  ; 5A38   0004 0158 029D

        MOVR    R3,     R5                      ; 5A3B   009D
        MVII    #$0018, R2                      ; 5A3C   02BA 0018
        SWAP    R2,     1                       ; 5A3E   0042
        XOR@    R5,     R2                      ; 5A3F   03EA
        MVO@    R2,     R4                      ; 5A40   0262
        MOVR    R7,     R2                      ; 5A41   00BA
        ADDI    #$007F, R2                      ; 5A42   02FA 007F
        MVO@    R2,     R4                      ; 5A44   0262
        MVII    #$0050, R2                      ; 5A45   02BA 0050
        SARC    R0,     1                       ; 5A47   0078
        BNC     L_5A4C                          ; 5A48   0209 0002

        MVII    #$0058, R2                      ; 5A4A   02BA 0058
L_5A4C:
        SWAP    R2,     1                       ; 5A4C   0042
        MVO@    R2,     R4                      ; 5A4D   0262
        CLRR    R3                              ; 5A4E   01DB
        MVO@    R3,     R4                      ; 5A4F   0263
        MVI@    R5,     R2                      ; 5A50   02AA
        MVO@    R2,     R4                      ; 5A51   0262
        MVI@    R5,     R2                      ; 5A52   02AA
        MVO@    R2,     R4                      ; 5A53   0262
        MVI@    R5,     R2                      ; 5A54   02AA
        SLL     R2,     1                       ; 5A55   004A
        MVO@    R2,     R4                      ; 5A56   0262
        MVO@    R3,     R4                      ; 5A57   0263
L_5A58:
        MVII    #$032D, R1                      ; 5A58   02B9 032D
L_5A5A:
        MVI     G_015F, R0                      ; 5A5A   0280 015F
        DECR    R0                              ; 5A5C   0010
        BMI     L_5A80                          ; 5A5D   020B 0021
        BNEQ    L_5A6B                          ; 5A5F   020C 000A

        MVI@    R1,     R0                      ; 5A61   0288
        SWAP    R0,     1                       ; 5A62   0040
        ANDI    #$0040, R0                      ; 5A63   03B8 0040
        BNEQ    L_5A6B                          ; 5A65   020C 0004

        JSR     R5,     L_5AA9                  ; 5A67   0004 0158 02A9
        DECLE   $0008                           ; 5A6A   0008
L_5A6B:
        JSR     R5,     .EXEC.766               ; 5A6B   0004 0114 0366

        XOR     G_0188, R0                      ; 5A6E   03C0 0188
        SARC    R0,     1                       ; 5A70   0078
        BC      L_5A7A                          ; 5A71   0201 0007

        MOVR    R1,     R2                      ; 5A73   008A
        ADDI    #$0005, R2                      ; 5A74   02FA 0005
        MVI@    R2,     R0                      ; 5A76   0290
        XORI    #$0001, R0                      ; 5A77   03F8 0001
        MVO@    R0,     R2                      ; 5A79   0250
L_5A7A:
        ADDI    #$0008, R1                      ; 5A7A   02F9 0008
        CMPI    #$0355, R1                      ; 5A7C   0379 0355
        BLE     L_5A5A                          ; 5A7E   0226 0025
L_5A80:
        PULR    R7                              ; 5A80   02B7

L_5A81:
        PSHR    R5                              ; 5A81   0275
        MVI     G_015F, R0                      ; 5A82   0280 015F
        SUBI    #$0002, R0                      ; 5A84   0338 0002
        BMI     L_5A9C                          ; 5A86   020B 0014

L_5A88:
        JSR     R5,     .EXEC.760               ; 5A88   0004 0114 0360

        BEQ     L_5A93                          ; 5A8B   0204 0006

        ADDI    #$0008, R1                      ; 5A8D   02F9 0008
        DECR    R3                              ; 5A8F   0013
        BPL     L_5A88                          ; 5A90   0223 0009
        PULR    R7                              ; 5A92   02B7

L_5A93:
        MVI     G_0185, R0                      ; 5A93   0280 0185
        TSTR    R0                              ; 5A95   0080
        BNEQ    L_5A9C                          ; 5A96   020C 0004

        MVII    #$0004, R0                      ; 5A98   02B8 0004
        MVO     R0,     G_0185                  ; 5A9A   0240 0185
L_5A9C:
        PULR    R7                              ; 5A9C   02B7

L_5A9D:
        PSHR    R5                              ; 5A9D   0275

        JSR     R5,     .EXEC.766               ; 5A9E   0004 0114 0366

        MOVR    R0,     R3                      ; 5AA1   0083
        ANDI    #$0006, R3                      ; 5AA2   03BB 0006
        SLL     R3,     1                       ; 5AA4   004B
        ADDR    R7,     R3                      ; 5AA5   00FB
        ADDI    #$000B, R3                      ; 5AA6   02FB 000B
        PULR    R7                              ; 5AA8   02B7

L_5AA9:
        MVI@    R5,     R2                      ; 5AA9   02AA
        PSHR    R5                              ; 5AAA   0275

        JSR     R5,     L_5A9D                  ; 5AAB   0004 0158 029D

        XOR@    R3,     R2                      ; 5AAE   03DA
        SDBD                                    ; 5AAF   0001
        XORI    #$1800, R2                      ; 5AB0   03FA 0000 0018
        MVO@    R2,     R1                      ; 5AB3   024A
        PULR    R7                              ; 5AB4   02B7

        DECLE   $0045,  $0019,  $0002,  $0005   ; 5AB5   0045 0019 0002 0005
        DECLE   $0097,  $0012,  $000C,  $0007   ; 5AB9   0097 0012 000C 0007
        DECLE   $0053,  $000E,  $0000,  $0009   ; 5ABD   0053 000E 0000 0009
        DECLE   $02F4,  $005B,  $00F4,  $005A   ; 5AC1   02F4 005B 00F4 005A
        DECLE   $0002,  $0039,  $0000           ; 5AC5   0002 0039 0000

        PSHR    R5                              ; 5AC8   0275
        SLL     R1,     2                       ; 5AC9   004D
        SLL     R1,     1                       ; 5ACA   0049
        ADDI    #$031D, R1                      ; 5ACB   02F9 031D
        MVII    #$0080, R3                      ; 5ACD   02BB 0080
        SWAP    R3,     1                       ; 5ACF   0043
        MVI@    R1,     R2                      ; 5AD0   028A
        ANDR    R3,     R2                      ; 5AD1   019A
        BNEQ    L_5AE7                          ; 5AD2   020C 0013

        XOR@    R1,     R3                      ; 5AD4   03CB
        MVO@    R3,     R1                      ; 5AD5   024B
        ADDI    #$0006, R1                      ; 5AD6   02F9 0006
        INCR    R2                              ; 5AD8   000A
        MVO@    R2,     R1                      ; 5AD9   024A

        JSR     R5,     X_PLAY_SFX2             ; 5ADA   0004 0118 03BE
        DECLE   $0078                           ; 5ADD  SFX prio
        DECLE   $03E9                           ; 5ADE  SFX data
        DECLE   $0340,  $0080                   ; 5ADF  SFX data
        DECLE   $0001,  $0040                   ; 5AE1  SFX data
        DECLE   $03E2                           ; 5AE3  SFX data
        DECLE   $008F,  $0017                   ; 5AE4  SFX data
        DECLE   $02CF                           ; 5AE6  SFX end

L_5AE7:
        PULR    R7                              ; 5AE7   02B7

        PSHR    R5                              ; 5AE8   0275
        MVII    #$031D, R1                      ; 5AE9   02B9 031D

        JSR     R5,     L_5CAB                  ; 5AEB   0004 015C 00AB

        MVII    #$0325, R1                      ; 5AEE   02B9 0325

        JSR     R5,     L_5CAB                  ; 5AF0   0004 015C 00AB

        PULR    R7                              ; 5AF3   02B7

        MVI@    R1,     R0                      ; 5AF4   0288
        SWAP    R0,     1                       ; 5AF5   0040
        ANDI    #$0040, R0                      ; 5AF6   03B8 0040
        BEQ     L_5AFD                          ; 5AF8   0204 0003
        J       .EXEC.7AE                       ; 5AFA   0004 0314 03AE

L_5AFD:
        PSHR    R5                              ; 5AFD   0275
        MOVR    R1,     R2                      ; 5AFE   008A
        ADDI    #$0002, R2                      ; 5AFF   02FA 0002

        JSR     R5,     L_5B88                  ; 5B01   0004 0158 0388

        SWAP    R3,     1                       ; 5B04   0043
L_5B05:
        SUBI    #$0054, R3                      ; 5B05   033B 0054
        MOVR    R3,     R4                      ; 5B07   009C
        INCR    R2                              ; 5B08   000A

        JSR     R5,     L_5B88                  ; 5B09   0004 0158 0388

        MVI@    R1,     R0                      ; 5B0C   0288
        ADDI    #$0004, R2                      ; 5B0D   02FA 0004
        MVI@    R2,     R2                      ; 5B0F   0292
        TSTR    R2                              ; 5B10   0092
        BEQ     L_5B1F                          ; 5B11   0204 000C

        CMPI    #$0010, R2                      ; 5B13   037A 0010
        BNEQ    L_5B45                          ; 5B15   020C 002E

        ANDI    #$0017, R0                      ; 5B17   03B8 0017
        XOR@    R1,     R0                      ; 5B19   03C8
        XORI    #$0008, R0                      ; 5B1A   03F8 0008
        MVO@    R0,     R1                      ; 5B1C   0248
        B       L_5B45                          ; 5B1D   0200 0026

L_5B1F:
        MVI     G_015F, R3                      ; 5B1F   0283 015F
        DECR    R3                              ; 5B21   0013
        BNEQ    L_5B2A                          ; 5B22   020C 0006

        ADDI    #$0004, R1                      ; 5B24   02F9 0004
        MVII    #$00EE, R3                      ; 5B26   02BB 00EE
        MVO@    R3,     R1                      ; 5B28   024B
        PULR    R7                              ; 5B29   02B7

L_5B2A:
        ANDI    #$0008, R0                      ; 5B2A   03B8 0008
        BEQ     L_5B45                          ; 5B2C   0204 0017

        PSHR    R1                              ; 5B2E   0271

        JSR     R5,     L_5AA9                  ; 5B2F   0004 0158 02A9
        DECLE   $0000                           ; 5B32   0000

        CLRR    R1                              ; 5B33   01C9
        TSTR    R4                              ; 5B34   00A4
        BMI     L_5B38                          ; 5B35   020B 0001

        INCR    R1                              ; 5B37   0009
L_5B38:
        MVII    #$0001, R0                      ; 5B38   02B8 0001
        NEGR    R0                              ; 5B3A   0020
        PSHR    R4                              ; 5B3B   0274

        JSR     R5,     L_5233                  ; 5B3C   0004 0150 0233
        JSR     R5,     L_5BA4                  ; 5B3F   0004 0158 03A4

        PULR    R4                              ; 5B42   02B4
        PULR    R1                              ; 5B43   02B1
        CLRR    R2                              ; 5B44   01D2
L_5B45:
        SLL     R2,     2                       ; 5B45   004E
        ADDR    R7,     R2                      ; 5B46   00FA
        ADDI    #$006B, R2                      ; 5B47   02FA 006B
        MVI@    R2,     R3                      ; 5B49   0293
        ANDI    #$0008, R0                      ; 5B4A   03B8 0008
        BNEQ    L_5B50                          ; 5B4C   020C 0002

        SLR     R3,     2                       ; 5B4E   0067
        SLR     R3,     2                       ; 5B4F   0067
L_5B50:
        ANDI    #$000F, R3                      ; 5B50   03BB 000F
        MOVR    R3,     R0                      ; 5B52   0098
        ANDI    #$0003, R3                      ; 5B53   03BB 0003
        SLR     R0,     2                       ; 5B55   0064
        INCR    R2                              ; 5B56   000A
        ADDR    R3,     R2                      ; 5B57   00DA

        JSR     R5,     X_RAND2                 ; 5B58   0004 0114 029E

        ADDR    R0,     R2                      ; 5B5B   00C2

        JSR     R5,     L_5A9D                  ; 5B5C   0004 0158 029D

        ADDI    #$0001, R3                      ; 5B5F   02FB 0001
        TSTR    R4                              ; 5B61   00A4
        MVI@    R2,     R4                      ; 5B62   0294
        BMI     L_5B68                          ; 5B63   020B 0003

        ADDI    #$0004, R4                      ; 5B65   02FC 0004
        NEGR    R4                              ; 5B67   0024

L_5B68:
        JSR     R5,     L_5B91                  ; 5B68   0004 0158 0391

        PSHR    R0                              ; 5B6B   0270

        JSR     R5,     L_5B91                  ; 5B6C   0004 0158 0391

        SWAP    R0,     1                       ; 5B6F   0040
        XOR@    R6,     R0                      ; 5B70   03F0
        ADDI    #$0004, R1                      ; 5B71   02F9 0004
        MVO@    R0,     R1                      ; 5B73   0248
        ADDI    #$0002, R3                      ; 5B74   02FB 0002
        MVI@    R3,     R3                      ; 5B76   029B
        MVI@    R2,     R2                      ; 5B77   0292
        SLR     R2,     2                       ; 5B78   0066
        SLR     R2,     1                       ; 5B79   0062
        CLRR    R0                              ; 5B7A   01C0
        SARC    R2,     1                       ; 5B7B   007A
        ADCR    R7                              ; 5B7C   002F

        ADDR    R3,     R0                      ; 5B7D   00D8
L_5B7E:
        SLL     R0,     1                       ; 5B7E   0048
        SARC    R2,     1                       ; 5B7F   007A
        ADCR    R7                              ; 5B80   002F

        ADDR    R3,     R0                      ; 5B81   00D8
L_5B82:
        ADDI    #$0002, R1                      ; 5B82   02F9 0002
        MVO@    R0,     R1                      ; 5B84   0248
        INCR    R1                              ; 5B85   0009
        MVO@    R2,     R1                      ; 5B86   024A
        PULR    R7                              ; 5B87   02B7

L_5B88:
        MVI@    R2,     R3                      ; 5B88   0293
        ADDI    #$03FF, R3                      ; 5B89   02FB 03FF
        SDBD                                    ; 5B8B   0001
        ANDI    #$F800, R3                      ; 5B8C   03BB 0000 00F8
        MVO@    R3,     R2                      ; 5B8F   0253
        MOVR    R5,     R7                      ; 5B90   00AF

L_5B91:
        PSHR    R5                              ; 5B91   0275
        MOVR    R4,     R5                      ; 5B92   00A5
        CLRR    R0                              ; 5B93   01C0
        ANDI    #$0003, R5                      ; 5B94   03BD 0003
        BEQ     L_5B99                          ; 5B96   0204 0001

        MVI@    R3,     R0                      ; 5B98   0298
L_5B99:
        MOVR    R4,     R5                      ; 5B99   00A5
        ANDI    #$0004, R5                      ; 5B9A   03BD 0004
        BNEQ    L_5B9F                          ; 5B9C   020C 0001

        NEGR    R0                              ; 5B9E   0020
L_5B9F:
        ANDI    #$00FF, R0                      ; 5B9F   03B8 00FF
        SUBI    #$0002, R4                      ; 5BA1   033C 0002
        PULR    R7                              ; 5BA3   02B7

L_5BA4:
        PSHR    R5                              ; 5BA4   0275

        JSR     R5,     X_PLAY_SFX2             ; 5BA5   0004 0118 03BE
        DECLE   $0080                           ; 5BA8  SFX prio
        DECLE   $02E9                           ; 5BA9  SFX data
        DECLE   $03C0,  $0040                   ; 5BAA  SFX data
        DECLE   $02AD                           ; 5BAC  SFX data
        DECLE   $03E5                           ; 5BAD  SFX data
        DECLE   $03DE                           ; 5BAE  SFX data
        DECLE   $008F,  $0013                   ; 5BAF  SFX data
        DECLE   $02CF                           ; 5BB1  SFX end

        DECLE   $00C0,  $0024,  $00E6,  $0008   ; 5BB2   00C0 0024 00E6 0008
        DECLE   $0094,  $0000                   ; 5BB6   0094 0000

        SAR     R1,     2                       ; 5BB8   006D
        TSTR    R6                              ; 5BB9   00B6
        RLC     R0,     2                       ; 5BBA   0054
        RRC     R0,     1                       ; 5BBB   0070
        MOVR    R1,     R5                      ; 5BBC   008D
        MOVR    R1,     R5                      ; 5BBD   008D
        MOVR    R3,     R0                      ; 5BBE   0098
        ADCR    R1                              ; 5BBF   0029
        MOVR    R5,     R7                      ; 5BC0   00AF

        DECLE   $0054,  $0054,  $0049,  $0116   ; 5BC1   0054 0054 0049 0116
        DECLE   $0116,  $0064,  $0032,  $006B   ; 5BC5   0116 0064 0032 006B
        DECLE   $00CE,  $0068,  $00AA,  $00E0   ; 5BC9   00CE 0068 00AA 00E0
        DECLE   $012D,  $0094,  $0002,  $00C4   ; 5BCD   012D 0094 0002 00C4
        DECLE   $01A6,  $0068,  $0092,  $0120   ; 5BD1   01A6 0068 0092 0120
        DECLE   $0176,  $0098,  $00C9,  $014F   ; 5BD5   0176 0098 00C9 014F
        DECLE   $0104,  $0064,  $00D2,  $012B   ; 5BD9   0104 0064 00D2 012B
        DECLE   $018E,  $0068,  $0112,  $01CF   ; 5BDD   018E 0068 0112 01CF
        DECLE   $020C,  $0068,  $014A,  $01A0   ; 5BE1   020C 0068 014A 01A0
        DECLE   $01ED,  $0094,  $00E2,  $0184   ; 5BE5   01ED 0094 00E2 0184
        DECLE   $01A8,  $0054,  $01F0,  $016B   ; 5BE9   01A8 0054 01F0 016B
        DECLE   $016B,  $0068,  $0122,  $0189   ; 5BED   016B 0068 0122 0189
        DECLE   $01D4,  $0004                   ; 5BF1   01D4 0004

        CMPR    R5,     R0                      ; 5BF3   0168
        J       .EXEC.7AE                       ; 5BF4   0004 0314 03AE

        PSHR    R5                              ; 5BF7   0275
        MVI@    R1,     R2                      ; 5BF8   028A
        SWAP    R2,     1                       ; 5BF9   0042
        ANDI    #$0080, R2                      ; 5BFA   03BA 0080
        BEQ     L_5CBC                          ; 5BFC   0204 00BE

        JSR     R5,     .EXEC.777               ; 5BFE   0004 0114 0377

        ADDI    #$0005, R1                      ; 5C01   02F9 0005
        MVI@    R1,     R4                      ; 5C03   028C
        ADDR    R7,     R4                      ; 5C04   00FC
        ADDI    #$0082, R4                      ; 5C05   02FC 0082
        ADD@    R4,     R2                      ; 5C07   02E2
        ADD@    R4,     R3                      ; 5C08   02E3
        MOVR    R2,     R4                      ; 5C09   0094
        MOVR    R3,     R5                      ; 5C0A   009D
        SLR     R2,     2                       ; 5C0B   0066
        SLR     R2,     1                       ; 5C0C   0062
        SLR     R3,     2                       ; 5C0D   0067
        SLR     R3,     1                       ; 5C0E   0063
        SLL     R3,     2                       ; 5C0F   004F
        ADDR    R3,     R2                      ; 5C10   00DA
        SLL     R3,     2                       ; 5C11   004F
        ADDR    R3,     R2                      ; 5C12   00DA
        ADDI    #$01EB, R2                      ; 5C13   02FA 01EB
        MVI@    R2,     R3                      ; 5C15   0293
        SLR     R3,     2                       ; 5C16   0067
        ANDI    #$03FE, R3                      ; 5C17   03BB 03FE
        SDBD                                    ; 5C19   0001
        MVII    #$59EF, R0                      ; 5C1A   02B8 00EF 0059
        MOVR    R0,     R2                      ; 5C1D   0082
L_5C1E:
        INCR    R2                              ; 5C1E   000A
        CMP@    R2,     R3                      ; 5C1F   0353
        BNEQ    L_5C1E                          ; 5C20   022C 0003

        SUBR    R0,     R2                      ; 5C22   0102
        SUBI    #$0005, R2                      ; 5C23   033A 0005
        BMI     L_5C7C                          ; 5C25   020B 0055
        BEQ     L_5C69                          ; 5C27   0204 0040

        SUBI    #$0005, R1                      ; 5C29   0339 0005
        MVI@    R1,     R0                      ; 5C2B   0288
        XORI    #$0008, R0                      ; 5C2C   03F8 0008
        MVO@    R0,     R1                      ; 5C2E   0248
        ADDI    #$0005, R1                      ; 5C2F   02F9 0005
        ANDI    #$0008, R0                      ; 5C31   03B8 0008
        BEQ     L_5C69                          ; 5C33   0204 0034

        DECR    R2                              ; 5C35   0012
        MOVR    R2,     R3                      ; 5C36   0093
        SUB@    R1,     R2                      ; 5C37   030A
        ANDI    #$0003, R2                      ; 5C38   03BA 0003
        DECR    R2                              ; 5C3A   0012
        BGT     L_5C7C                          ; 5C3B   020E 003F

        NEGR    R2                              ; 5C3D   0022
        SLL     R2,     1                       ; 5C3E   004A
        DECR    R2                              ; 5C3F   0012
        ADD@    R1,     R2                      ; 5C40   02CA
        ANDI    #$0003, R2                      ; 5C41   03BA 0003
        MVO@    R2,     R1                      ; 5C43   024A
        MOVR    R4,     R0                      ; 5C44   00A0
        ANDI    #$0007, R0                      ; 5C45   03B8 0007
        XORR    R0,     R4                      ; 5C47   01C4
        XORR    R5,     R4                      ; 5C48   01EC
        ANDI    #$00F8, R5                      ; 5C49   03BD 00F8
        XORR    R5,     R4                      ; 5C4B   01EC
        XORR    R0,     R5                      ; 5C4C   01C5
        SARC    R3,     1                       ; 5C4D   007B
        BC      L_5C54                          ; 5C4E   0201 0004

        XORI    #$0007, R4                      ; 5C50   03FC 0007
        XORI    #$0007, R5                      ; 5C52   03FD 0007
L_5C54:
        MOVR    R4,     R0                      ; 5C54   00A0
        MOVR    R1,     R4                      ; 5C55   008C
        MOVR    R5,     R1                      ; 5C56   00A9
        MOVR    R2,     R5                      ; 5C57   0095
        ADDR    R7,     R5                      ; 5C58   00FD
        ADDI    #$002E, R5                      ; 5C59   02FD 002E
        SUB@    R5,     R0                      ; 5C5B   0328
        SUB@    R5,     R1                      ; 5C5C   0329
        SWAP    R0,     1                       ; 5C5D   0040
        SWAP    R1,     1                       ; 5C5E   0041
        SUBI    #$0003, R4                      ; 5C5F   033C 0003
        MVO@    R0,     R4                      ; 5C61   0260
        MVO@    R1,     R4                      ; 5C62   0261
        ADDI    #$0002, R4                      ; 5C63   02FC 0002
        MVII    #$0001, R2                      ; 5C65   02BA 0001
        MVO@    R2,     R4                      ; 5C67   0262
        PULR    R7                              ; 5C68   02B7

L_5C69:
        MVI@    R1,     R2                      ; 5C69   028A
        MVII    #$0008, R0                      ; 5C6A   02B8 0008
        MOVR    R2,     R3                      ; 5C6C   0093
        SLR     R3,     1                       ; 5C6D   0063
        XORR    R2,     R3                      ; 5C6E   01D3
L_5C6F:
        SARC    R3,     1                       ; 5C6F   007B
        BNC     L_5C73                          ; 5C70   0209 0001

        NEGR    R0                              ; 5C72   0020
L_5C73:
        MOVR    R2,     R3                      ; 5C73   0093
        SARC    R3,     1                       ; 5C74   007B
        BC      L_5C79                          ; 5C75   0201 0002

        ADDR    R0,     R4                      ; 5C77   00C4
        INCR    R7                              ; 5C78   000F

L_5C79:
        ADDR    R0,     R5                      ; 5C79   00C5
L_5C7A:
        B       L_5C54                          ; 5C7A   0220 0027

L_5C7C:
        SUBI    #$0005, R1                      ; 5C7C   0339 0005
        INCR    R7                              ; 5C7E   000F

L_5C7F:
        PSHR    R5                              ; 5C7F   0275

L_5C80:
        JSR     R5,     L_5C8C                  ; 5C80   0004 015C 008C
        JSR     R5,     L_5CAB                  ; 5C83   0004 015C 00AB

        PULR    R7                              ; 5C86   02B7

        DECLE   $0007,  $0004,  $0000,  $0004   ; 5C87   0007 0004 0000 0004

        SETC                                    ; 5C8B   0007
L_5C8C:
        MOVR    R1,     R4                      ; 5C8C   008C
        SDBD                                    ; 5C8D   0001
        MVII    #$18B3, R2                      ; 5C8E   02BA 00B3 0018
        MVO@    R2,     R4                      ; 5C91   0262
        MOVR    R7,     R2                      ; 5C92   00BA
        ADDI    #$0041, R2                      ; 5C93   02FA 0041
        MVO@    R2,     R4                      ; 5C95   0262
        MVII    #$001C, R2                      ; 5C96   02BA 001C
        CMPI    #$0325, R4                      ; 5C98   037C 0325
        BLT     L_5C9E                          ; 5C9A   0205 0002

        MVII    #$008B, R2                      ; 5C9C   02BA 008B
L_5C9E:
        SWAP    R2,     1                       ; 5C9E   0042
        MVO@    R2,     R4                      ; 5C9F   0262
        MVII    #$0060, R2                      ; 5CA0   02BA 0060
        SWAP    R2,     1                       ; 5CA2   0042
        MVO@    R2,     R4                      ; 5CA3   0262
        CLRR    R2                              ; 5CA4   01D2
        MVO@    R2,     R4                      ; 5CA5   0262
        MVII    #$0001, R3                      ; 5CA6   02BB 0001
        MVO@    R3,     R4                      ; 5CA8   0263
        MVO@    R2,     R4                      ; 5CA9   0262
        MOVR    R5,     R7                      ; 5CAA   00AF

L_5CAB:
        MOVR    R1,     R4                      ; 5CAB   008C
        ADDI    #$0004, R4                      ; 5CAC   02FC 0004
        MVII    #$0018, R2                      ; 5CAE   02BA 0018
        SWAP    R2,     1                       ; 5CB0   0042
        CMPI    #$031D, R1                      ; 5CB1   0379 031D
        BEQ     L_5CB6                          ; 5CB3   0204 0001

        NEGR    R2                              ; 5CB5   0022
L_5CB6:
        MVO@    R2,     R4                      ; 5CB6   0262
        INCR    R4                              ; 5CB7   000C
        MVII    #$001A, R2                      ; 5CB8   02BA 001A
        MVO@    R2,     R4                      ; 5CBA   0262
        MOVR    R5,     R7                      ; 5CBB   00AF

L_5CBC:
        JSR     R5,     .EXEC.766               ; 5CBC   0004 0114 0366

        ADDI    #$0004, R1                      ; 5CBF   02F9 0004
        MVI@    R1,     R2                      ; 5CC1   028A
        NEGR    R2                              ; 5CC2   0022
        MVI     G_015F, R3                      ; 5CC3   0283 015F
        DECR    R3                              ; 5CC5   0013
        BNEQ    L_5CCD                          ; 5CC6   020C 0005

        SARC    R0,     1                       ; 5CC8   0078
        TSTR    R2                              ; 5CC9   0092
        BUSC    L_5CCD                          ; 5CCA   0207 0001

        CLRR    R2                              ; 5CCC   01D2
L_5CCD:
        MVO@    R2,     R1                      ; 5CCD   024A
        ADDI    #$0002, R1                      ; 5CCE   02F9 0002
        MVII    #$001A, R2                      ; 5CD0   02BA 001A
        MVO@    R2,     R1                      ; 5CD2   024A
        PULR    R7                              ; 5CD3   02B7

        DECLE   $027F,  $005C,  $00F7,  $005B   ; 5CD4   027F 005C 00F7 005B
        DECLE   $0004                           ; 5CD8   0004

        SWAP    R3,     2                       ; 5CD9   0047
        INCR    R4                              ; 5CDA   000C
        ADD@    R4,     R7                      ; 5CDB   02E7

        SLLC    R0,     2                       ; 5CDC   005C
        ADD@    R4,     R7                      ; 5CDD   02E7

        DECLE   $015C,  $01E7,  $005C,  $01E7   ; 5CDE   015C 01E7 005C 01E7
        DECLE   $015C,  $03E7,  $005C,  $03E7   ; 5CE2   015C 03E7 005C 03E7

        CMPR    R3,     R4                      ; 5CE6   015C
        PSHR    R5                              ; 5CE7   0275
        MOVR    R0,     R4                      ; 5CE8   0084
        ADDR    R4,     R4                      ; 5CE9   00E4
        ADDR    R0,     R4                      ; 5CEA   00C4
        ADDR    R4,     R4                      ; 5CEB   00E4
        ADDI    #$018A, R4                      ; 5CEC   02FC 018A
        MVII    #$00FF, R2                      ; 5CEE   02BA 00FF
        MVO@    R2,     R4                      ; 5CF0   0262
        PSHR    R1                              ; 5CF1   0271
        PSHR    R3                              ; 5CF2   0273
        MOVR    R0,     R1                      ; 5CF3   0081
        MVII    #$0001, R0                      ; 5CF4   02B8 0001

        JSR     R5,     L_5233                  ; 5CF6   0004 0150 0233

        PULR    R0                              ; 5CF9   02B0

        JSR     R5,     .EXEC.76C               ; 5CFA   0004 0114 036C

        MOVR    R1,     R4                      ; 5CFD   008C
        SDBD                                    ; 5CFE   0001
        MVII    #$5050, R2                      ; 5CFF   02BA 0050 0050
        MVO@    R2,     R4                      ; 5D02   0262
        ADDI    #$0003, R4                      ; 5D03   02FC 0003
        MVII    #$00FC, R2                      ; 5D05   02BA 00FC
        MVO@    R2,     R4                      ; 5D07   0262
        MVII    #$0004, R2                      ; 5D08   02BA 0004
        MVO@    R2,     R4                      ; 5D0A   0262
        MVII    #$000A, R2                      ; 5D0B   02BA 000A
        MVO@    R2,     R4                      ; 5D0D   0262
        PULR    R1                              ; 5D0E   02B1

        JSR     R5,     L_5C7F                  ; 5D0F   0004 015C 007F
        JSR     R5,     X_PLAY_SFX2             ; 5D12   0004 0118 03BE
        DECLE   $0082                           ; 5D15  SFX prio
        DECLE   $0279                           ; 5D16  SFX data
        DECLE   $03ED                           ; 5D17  SFX data
        DECLE   $0335                           ; 5D18  SFX data
        DECLE   $005E                           ; 5D19  SFX data
        DECLE   $00AB                           ; 5D1A  SFX data
        DECLE   $000F,  $03F8                   ; 5D1B  SFX data
        DECLE   $03AE                           ; 5D1D  SFX data
        DECLE   $036B                           ; 5D1E  SFX data
        DECLE   $03CF                           ; 5D1F  SFX end

        DECLE   $0100,  $0100,  $0300,  $0200   ; 5D20   0100 0100 0300 0200
        DECLE   $031C,  $0208,  $033E,  $0255   ; 5D24   031C 0208 033E 0255
        DECLE   $032A,  $0200,  $0300,  $0200   ; 5D28   032A 0200 0300 0200
        DECLE   $0300,  $0200,  $0300,  $0100   ; 5D2C   0300 0200 0300 0100
        DECLE   $0001,  $0001,  $0306,  $0214   ; 5D30   0001 0001 0306 0214
        DECLE   $0316,  $0228,  $0368,  $0248   ; 5D34   0316 0228 0368 0248
        DECLE   $03B8,  $0200,  $0220,  $0040   ; 5D38   03B8 0200 0220 0040
        DECLE   $0240,  $0160,  $0380,  $0380   ; 5D3C   0240 0160 0380 0380
        DECLE   $0300,  $0304,  $0204,  $0208   ; 5D40   0300 0304 0204 0208
        DECLE   $0308,  $0224,  $033C,  $0224   ; 5D44   0308 0224 033C 0224
        DECLE   $0308,  $0108,  $0304,  $0304   ; 5D48   0308 0108 0304 0304
        DECLE   $0300,  $0300,  $0300,  $0300   ; 5D4C   0300 0300 0300 0300
        DECLE   $0300,  $0340,  $03FF,  $03FF   ; 5D50   0300 0340 03FF 03FF
        DECLE   $037E,  $007C,  $023C,  $0100   ; 5D54   037E 007C 023C 0100
        DECLE   $0340,  $0348,  $0368,  $0376   ; 5D58   0340 0348 0368 0376
        DECLE   $03FF,  $03FE,  $027C,  $0300   ; 5D5C   03FF 03FE 027C 0300
        DECLE   $0300,  $0320,  $0320,  $0370   ; 5D60   0300 0320 0320 0370
        DECLE   $0178,  $03FF                   ; 5D64   0178 03FF

        CMPR    R7,     R6                      ; 5D66   017E
        B       L_5D69                          ; 5D67   0200 0000

L_5D69:
        CMPR    R0,     R0                      ; 5D69   0140
        DECLE   $00E0,  $027E,  $017C,  $037C   ; 5D6A   00E0 027E 017C 037C
        DECLE   $0000,  $0200,  $0300,  $0300   ; 5D6E   0000 0200 0300 0300
        DECLE   $0000,  $0300,  $031C,  $0238   ; 5D72   0000 0300 031C 0238
        DECLE   $0370,  $02E0,  $0300,  $0200   ; 5D76   0370 02E0 0300 0200
        DECLE   $0300,  $0200,  $0300,  $021C   ; 5D7A   0300 0200 0300 021C
        DECLE   $0338,  $0170,  $0000,  $0300   ; 5D7E   0338 0170 0000 0300
        DECLE   $0300,  $0200,  $0300,  $0200   ; 5D82   0300 0200 0300 0200
        DECLE   $0310,  $0230,  $0381,  $0281   ; 5D86   0310 0230 0381 0281
        DECLE   $0381,  $0281,  $0381,  $0181   ; 5D8A   0381 0281 0381 0181
        DECLE   $0381,  $0381,  $0300,  $0000   ; 5D8E   0381 0381 0300 0000
        DECLE   $0242,  $0142,  $0142,  $0042   ; 5D92   0242 0142 0142 0042
        DECLE   $0242,  $0200,  $0300,  $0000   ; 5D96   0242 0200 0300 0000
        DECLE   $0200,  $0124,  $0324,  $0324   ; 5D9A   0200 0124 0324 0324
        DECLE   $0300,  $0300,  $0100,  $0000   ; 5D9E   0300 0300 0100 0000
        DECLE   $0208,  $0010,  $035A,  $0024   ; 5DA2   0208 0010 035A 0024
        DECLE   $005A,  $03BD,  $03BE,  $0354   ; 5DA6   005A 03BD 03BE 0354
        DECLE   $002A,  $0018,  $0124,  $0110   ; 5DAA   002A 0018 0124 0110
        DECLE   $0300,  $0000,  $0008,  $0110   ; 5DAE   0300 0000 0008 0110
        DECLE   $0118,  $0324,  $0008,  $0054   ; 5DB2   0118 0324 0008 0054
        DECLE   $013A,  $015C,  $033E,  $0078   ; 5DB6   013A 015C 033E 0078
        DECLE   $000A,  $0134,  $0128,  $0314   ; 5DBA   000A 0134 0128 0314
        DECLE   $0008,  $0010,  $0000,  $0000   ; 5DBE   0008 0010 0000 0000
        DECLE   $0108,  $0010,  $022A,  $0004   ; 5DC2   0108 0010 022A 0004
        DECLE   $035A,  $00BD,  $01BA,  $0154   ; 5DC6   035A 00BD 01BA 0154
        DECLE   $002E,  $0314,  $0328,  $0118   ; 5DCA   002E 0314 0328 0118
        DECLE   $0100,  $0000,  $0300,  $0300   ; 5DCE   0100 0000 0300 0300
        DECLE   $0000,  $0000,  $0000,  $0208   ; 5DD2   0000 0000 0000 0208
        DECLE   $0034,  $0018,  $002C,  $0310   ; 5DD6   0034 0018 002C 0310
        DECLE   $0308,  $0100,  $0000,  $0100   ; 5DDA   0308 0100 0000 0100
        DECLE   $0000,  $0000,  $0000           ; 5DDE   0000 0000 0000

        DECR    R0                              ; 5DE1   0010
        SUBR    R2,     R0                      ; 5DE2   0110
        DECR    R0                              ; 5DE3   0010
        DECR    R0                              ; 5DE4   0010
        DECR    R0                              ; 5DE5   0010
        DECR    R0                              ; 5DE6   0010
        SUBR    R0,     R0                      ; 5DE7   0100
        SUBR    R1,     R4                      ; 5DE8   010C
        SKIP                                    ; 5DE9   0208
        RSWD    R4                              ; 5DEA   003C
        SARC    R0,     1                       ; 5DEB   0078
        CMPR    R3,     R0                      ; 5DEC   0158
        CMPR    R3,     R7                      ; 5DED   015F
        B       L_5E08                          ; 5DEE   0200 0018

        COMR    R0                              ; 5DF0   0018
        SUBR    R7,     R4                      ; 5DF1   013C
        SUBR    R4,     R4                      ; 5DF2   0124
        MVO@    R6,     R4                      ; 5DF3   0266
        ADDR    R0,     R2                      ; 5DF4   00C2
        MOVR    R0,     R2                      ; 5DF5   0082
        SUBR    R0,     R3                      ; 5DF6   0103
        SUBR    R0,     R0                      ; 5DF7   0100
        BLE     L_5DFE                          ; 5DF8   0206 0004

        COMR    R6                              ; 5DFA   001E
        SUBR    R7,     R4                      ; 5DFB   013C
        CMPR    R7,     R4                      ; 5DFC   017C
        MVO@    R6,     R3                      ; 5DFD   025E
L_5DFE:
        SWAP    R0,     1                       ; 5DFE   0040
        DECLE   $0018,  $0138,  $013C,  $0224   ; 5DFF   0018 0138 013C 0224

        ADDR    R4,     R4                      ; 5E03   00E4
        MOVR    R0,     R4                      ; 5E04   0084
        ANDR    R0,     R4                      ; 5E05   0184
        SUB     .STIC.X.6,R4                    ; 5E06   0304 0006
L_5E08:
        CLRC                                    ; 5E08   0006

        JSRD    R5,     .EXEC.F3C               ; 5E09   0004 011E 033C

        RSWD    R4                              ; 5E0C   003C
        RSWD    R4                              ; 5E0D   003C
        RSWD    R6                              ; 5E0E   003E
        SUBR    R3,     R0                      ; 5E0F   0118
        SUBR    R3,     R0                      ; 5E10   0118
        COMR    R0                              ; 5E11   0018
        COMR    R0                              ; 5E12   0018
        SARC    R0,     1                       ; 5E13   0078
        CMPR    R1,     R0                      ; 5E14   0148
        CMPR    R1,     R0                      ; 5E15   0148
L_5E16:
        INCR    R0                              ; 5E16   0008
        DECLE   $000C,  $0106,  $0104,  $030E   ; 5E17   000C 0106 0104 030E
        DECLE   $020C,  $000C,  $010C,  $010C   ; 5E1B   020C 000C 010C 010C
        DECLE   $010C,  $010C,  $000C,  $000C   ; 5E1F   010C 010C 000C 000C
        DECLE   $003C,  $0128,  $0128,  $0108   ; 5E23   003C 0128 0128 0108
        DECLE   $000C,  $0306,  $0004,  $001E   ; 5E27   000C 0306 0004 001E
        DECLE   $013C,  $033C,  $023C,  $003E   ; 5E2B   013C 033C 023C 003E
        DECLE   $0018,  $011C,  $023E           ; 5E2F   0018 011C 023E
L_5E32:
        BOV     L_5B05                          ; 5E32   0222 032E

        ADCR    R0                              ; 5E34   0028
        B       L_5E16                          ; 5E35   0220 0020

        SUBR    R2,     R0                      ; 5E37   0110
        SUBR    R0,     R6                      ; 5E38   0106

        JSRD    R4,     .EXEC.D3C               ; 5E39   0004 001E 013C
        DECLE   $007C,  $035E,  $0040,  $0018   ; 5E3C   007C 035E 0040 0018
        DECLE   $011C,  $023F,  $0321,  $0027   ; 5E40   011C 023F 0321 0027
        DECLE   $0024,  $0144,  $0240,  $0340   ; 5E44   0024 0144 0240 0340
        DECLE   $000C,  $0008,  $013C,  $0278   ; 5E48   000C 0008 013C 0278
        DECLE   $0358,  $005F,  $0000,  $0118   ; 5E4C   0358 005F 0000 0118
        DECLE   $0218                           ; 5E50   0218

        SUBI    #$0021, R7                      ; 5E51   033F 0021

        SLR     R2,     1                       ; 5E53   0062
        CMPR    R0,     R2                      ; 5E54   0142
        ADDR    R0,     R0                      ; 5E55   00C0
        AND     .IV.ALD,R0                      ; 5E56   0380 0080
        BNEQ    L_5E62                          ; 5E58   020C 0008

        ADDR    R7,     R4                      ; 5E5A   00FC
        AND@    R3,     R0                      ; 5E5B   0398
        MOVR    R3,     R7                      ; 5E5C   009F

        SUBR    R3,     R0                      ; 5E5D   0118
        B       L_5E78                          ; 5E5E   0200 0018

        DECLE   $0318,  $003F                   ; 5E60   0318 003F
L_5E62:
        NEGR    R1                              ; 5E62   0021
        DECLE   $0061,  $0041,  $00C0,  $0380   ; 5E63   0061 0041 00C0 0380
        DECLE   $0000,  $0218,  $020A,  $011A   ; 5E67   0000 0218 020A 011A
        DECLE   $013E,  $02E8,  $0218,  $0018   ; 5E6B   013E 02E8 0218 0018
        DECLE   $0018,  $0000,  $0118,  $0230   ; 5E6F   0018 0000 0118 0230

        SAR     R0,     1                       ; 5E73   0068
        SLL     R0,     1                       ; 5E74   0048
        NEGR    R6                              ; 5E75   0026
        SUBR    R2,     R2                      ; 5E76   0112
        GSWD    R2                              ; 5E77   0032
L_5E78:
        COMR    R0                              ; 5E78   0018
        DECLE   $0010,  $0338,  $0078,  $0058   ; 5E79   0010 0338 0078 0058
        DECLE   $00B4,  $00B4,  $0084,  $01B0   ; 5E7D   00B4 00B4 0084 01B0
        DECLE   $0030,  $0228,  $0028,  $0348   ; 5E81   0030 0228 0028 0348
        DECLE   $0348,  $0048,  $006C,  $0000   ; 5E85   0348 0048 006C 0000
        DECLE   $0000,  $0000,  $0100,  $0200   ; 5E89   0000 0000 0100 0200
        DECLE   $0000,  $0200,  $0300,  $00C3   ; 5E8D   0000 0200 0300 00C3
        DECLE   $0042,  $004F,  $01DE,  $027C   ; 5E91   0042 004F 01DE 027C
        DECLE   $0364,  $0164,  $0067,  $0300   ; 5E95   0364 0164 0067 0300
        DECLE   $0300,  $0300,  $0000,  $0200   ; 5E99   0300 0300 0000 0200
        DECLE   $0200,  $0100,  $0000           ; 5E9D   0200 0100 0000

        MOVR    R0,     R3                      ; 5EA0   0083
        MVI@    R4,     R1                      ; 5EA1   02A1
        ADDR    R4,     R3                      ; 5EA2   00E3
        CMPR    R6,     R7                      ; 5EA3   0177
        MVO@    R7,     R2                      ; 5EA4   0257
        ADDR    R3,     R5                      ; 5EA5   00DD
        MOVR    R3,     R1                      ; 5EA6   0099
        MOVR    R3,     R7                      ; 5EA7   009F

        DECLE   $0006,  $000F,  $0206,  $0200   ; 5EA8   0006 000F 0206 0200
        DECLE   $0200,  $0200,  $0000,  $0000   ; 5EAC   0200 0200 0000 0000
        DECLE   $0100,  $0200,  $0302,  $010E   ; 5EB0   0100 0200 0302 010E
        DECLE   $007F,  $0200,  $0300,  $0200   ; 5EB4   007F 0200 0300 0200
        DECLE   $0100,  $0100,  $0000,  $0300   ; 5EB8   0100 0100 0000 0300
        DECLE   $0200,  $0000,  $0003,  $001E   ; 5EBC   0200 0000 0003 001E
        DECLE   $003F,  $016E,  $0376,  $0272   ; 5EC0   003F 016E 0376 0272
        DECLE   $0352,  $00F2,  $00A2,  $00A1   ; 5EC4   0352 00F2 00A2 00A1
        DECLE   $0100,  $0200                   ; 5EC8   0100 0200

        B       L_5ECC                          ; 5ECA   0200 0000

L_5ECC:
        SUBR    R0,     R6                      ; 5ECC   0106
        DECLE   $001C,  $003E,  $0278,  $0158   ; 5ECD   001C 003E 0278 0158
        DECLE   $006C,  $0336,  $0030,  $0230   ; 5ED1   006C 0336 0030 0230
        DECLE   $00F0,  $0090,  $0098,  $0200   ; 5ED5   00F0 0090 0098 0200
        DECLE   $0100,  $0306,  $021C,  $013E   ; 5ED9   0100 0306 021C 013E
        DECLE   $0078,  $0378,  $034F,  $0030   ; 5EDD   0078 0378 034F 0030
        DECLE   $0030,  $013C,  $0024,  $0264   ; 5EE1   0030 013C 0024 0264
        DECLE   $02C6,  $0080,  $0180,  $0000   ; 5EE5   02C6 0080 0180 0000
        DECLE   $0300,  $0300,  $0100,  $0206   ; 5EE9   0300 0300 0100 0206
        DECLE   $000E,  $033D,  $037F,  $0077   ; 5EED   000E 033D 037F 0077
        DECLE   $012A,  $007C,  $0028,  $0000   ; 5EF1   012A 007C 0028 0000
        DECLE   $0100,  $0300,  $0000,  $0000   ; 5EF5   0100 0300 0000 0000

        SUBR    R0,     R0                      ; 5EF9   0100
        SUBR    R0,     R0                      ; 5EFA   0100
        SUB     .STIC.X.6,R0                    ; 5EFB   0300 0006
        COMR    R6                              ; 5EFD   001E
        SUB@    R6,     R7                      ; 5EFE   0337

        DECLE   $013D,  $0077,  $0359,  $0334   ; 5EFF   013D 0077 0359 0334
        DECLE   $0000,  $0000,  $0200,  $0200   ; 5F03   0000 0000 0200 0200
        DECLE   $0000,  $0000,  $0320,  $0042   ; 5F07   0000 0000 0320 0042
        DECLE   $0025,  $003C,  $005A,  $023C   ; 5F0B   0025 003C 005A 023C
        DECLE   $0218,  $023C,  $015A,  $001C   ; 5F0F   0218 023C 015A 001C
        DECLE   $023C                           ; 5F13   023C

        SUB@    R6,     R4                      ; 5F14   0334
        SUBR    R4,     R7                      ; 5F15   0127

        DECLE   $0020,  $02E0,  $0100,  $0104   ; 5F16   0020 02E0 0100 0104
        DECLE   $0042,  $00A4,  $013C,  $005A   ; 5F1A   0042 00A4 013C 005A
        DECLE   $013C,  $0118,  $013C,  $015A   ; 5F1E   013C 0118 013C 015A
        DECLE   $0138,  $003C,  $022C,  $01E4   ; 5F22   0138 003C 022C 01E4
        DECLE   $0204,  $0007,  $001C,  $002A   ; 5F26   0204 0007 001C 002A
        DECLE   $014D,  $03FB,  $00AF,  $0056   ; 5F2A   014D 03FB 00AF 0056
        DECLE   $017A,  $021C,  $022C,  $0214   ; 5F2E   017A 021C 022C 0214
        DECLE   $0028,  $0318,  $0108,  $0110   ; 5F32   0028 0318 0108 0110
        DECLE   $0308,  $0200,  $031C,  $0036   ; 5F36   0308 0200 031C 0036
        DECLE   $016B,  $01BF,  $00D7,  $0134   ; 5F3A   016B 01BF 00D7 0134
        DECLE   $016E,  $0038,  $001C,  $0034   ; 5F3E   016E 0038 001C 0034
        DECLE   $0028,  $0318,  $0210,  $0008   ; 5F42   0028 0318 0210 0008
        DECLE   $0110,  $0200,  $0149,  $012A   ; 5F46   0110 0200 0149 012A
        DECLE   $001C,  $007F,  $033E,  $006B   ; 5F4A   001C 007F 033E 006B
        DECLE   $021C,  $022A,  $0100,  $022A   ; 5F4E   021C 022A 0100 022A
        DECLE   $005D,  $023E,  $027F           ; 5F52   005D 023E 027F

        SUBR    R5,     R2                      ; 5F55   012A
        MVO@    R5,     R3                      ; 5F56   025D
        SUB@    R5,     R2                      ; 5F57   032A
        SUB     .STIC.X.0,R0                    ; 5F58   0300 0000
        SUB     G_0082, R4                      ; 5F5A   0304 0082
        CMPI    #$0082, R7                      ; 5F5C   037F 0082
        BEQ     L_5F60                          ; 5F5E   0204 0000

L_5F60:
        SKIP                                    ; 5F60   0208
        DECLE   $001C,  $002A,  $0008,  $0008   ; 5F61   001C 002A 0008 0008
        DECLE   $0308,  $0208,  $0214           ; 5F65   0308 0208 0214

        SUBR    R0,     R0                      ; 5F68   0100
        SUBR    R0,     R0                      ; 5F69   0100
        SUBR    R4,     R0                      ; 5F6A   0120
        MVO     R1,     .PSG0.rgt_hand          ; 5F6B   0241 01FE
        CMPR    R0,     R1                      ; 5F6D   0141
        B       L_5C6F                          ; 5F6E   0220 0300

        DECLE   $0014,  $0208,  $0008,  $0108   ; 5F70   0014 0208 0008 0108
        DECLE   $0308,  $002A,  $021C,  $0008   ; 5F74   0308 002A 021C 0008
.GFX_LIST_5F78:
        DECLE   $0204,  $001E,  $0078,  $00FE   ; 5F78  CART PIC #00
        DECLE   $00FF,  $007E,  $0038,  $0010   ; 5F7C  
        DECLE   $0000,  $0000,  $0010,  $0000   ; 5F80  CART PIC #01
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F84  
        DECLE   $0000,  $0000,  $0000,  $0003   ; 5F88  CART PIC #02
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F8C  
        DECLE   $0000,  $0010,  $0010,  $007F   ; 5F90  CART PIC #03
        DECLE   $0010,  $0010,  $0000,  $0000   ; 5F94  
        DECLE   $0000,  $0008,  $0008,  $003E   ; 5F98  CART PIC #04
        DECLE   $0008,  $0008,  $0008,  $0000   ; 5F9C  
        DECLE   $0000,  $0004,  $0004,  $007F   ; 5FA0  CART PIC #05
        DECLE   $0004,  $0004,  $0000,  $0000   ; 5FA4  
        DECLE   $0008,  $0008,  $0008,  $003E   ; 5FA8  CART PIC #06
        DECLE   $0008,  $0008,  $0000,  $0000   ; 5FAC  
        DECLE   $0000,  $0000,  $007C,  $00FE   ; 5FB0  CART PIC #07
        DECLE   $00EE,  $00FE,  $00FE,  $0000   ; 5FB4  
        DECLE   $0000,  $0000,  $0003,  $000E   ; 5FB8  CART PIC #08
        DECLE   $003B,  $00EE,  $0000,  $0000   ; 5FBC  
        DECLE   $0000,  $0000,  $0080,  $00E0   ; 5FC0  CART PIC #09
        DECLE   $00B8,  $00EE,  $0000,  $0000   ; 5FC4  
.GRAM_INIT_5FC8:
        DECLE   $0024           ; 5FC8  # of GRAM cards to init
        DECLE   $02BF,  $01EA   ; 5FC9  #00   :  Algo #1
        DECLE   $0259,  $0059   ; 5FCB  #01   :  Algo #2
        DECLE   $0215,  $0315   ; 5FCD  #02   :  Algo #2
        DECLE   $02BF,  $0157   ; 5FCF  #03   :  Algo #2
        DECLE   $024B,  $01A6   ; 5FD1  #04   :  Algo #1
        DECLE   $0381,  $0040   ; 5FD3  #05-05:  GRAM #00-00 XYI-
        DECLE   $0203,  $00C0   ; 5FD5  #06-07:  GRAM #01-02 X---
        DECLE   $0103,  $0140   ; 5FD7  #08-0A:  GRAM #01-03 -Y--
        DECLE   $0000           ; 5FD9  #0B   :  CART #00    ----
        DECLE   $010F,  $0040   ; 5FDA  #0C-0C:  GRAM #07-07 -Y--
        DECLE   $0087,  $0040   ; 5FDC  #0D-0D:  GRAM #03-03 --I-
        DECLE   $0081,  $0002   ; 5FDE  #0E   :  Algo #1
        DECLE   $0001,  $0002   ; 5FE0  #0F   :  Algo #1
        DECLE   $0001,  $02A2   ; 5FE2  #10   :  Algo #1
        DECLE   $0003,  $0080   ; 5FE4  #11-12:  CART #01-02 ----
        DECLE   $0321,  $00C0   ; 5FE6  #13-14:  GRAM #10-11 XY--
        DECLE   $0121,  $0040   ; 5FE8  #15-15:  GRAM #10-10 -Y--
        DECLE   $0007,  $0180   ; 5FEA  #16-19:  CART #03-06 ----
        DECLE   $0219,  $02E3   ; 5FEC  #1A   :  Algo #2
        DECLE   $0235,  $0040   ; 5FEE  #1B-1B:  GRAM #1A-1A X---
        DECLE   $0135,  $00C0   ; 5FF0  #1C-1D:  GRAM #1A-1B -Y--
        DECLE   $0311,  $02E3   ; 5FF2  #1E   :  Algo #2
        DECLE   $013D,  $0040   ; 5FF4  #1F-1F:  GRAM #1E-1E -Y--
        DECLE   $03A9,  $0002   ; 5FF6  #20   :  Algo #1
        DECLE   $000F,  $0100   ; 5FF8  #21-23:  CART #07-09 ----

        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 5FFA   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF                   ; 5FFE   03FF 03FF
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5020       <entry>
;;  $503B       <entry>
;;  $5051       $504D  
;;  $505D       <entry>
;;  $5081       $507C  
;;  $5083       $507F  
;;  $509C       $50AB  
;;  $509E       $50A4  
;;  $50BA       $50CB  
;;  $50BD       $50C6  
;;  $50CF       $508E  
;;  $50D4       $50CD  
;;  $50DE       $50D8  
;;  $50E2       $5074   $50DB   $5962   $598F  
;;  $50E9       $5133  
;;  $50F5       $50F0  
;;  $513E       $5185  
;;  $514C       $5190  
;;  $514D       $514B  
;;  $5193       $518E  
;;  $51A3       $519D  
;;  $51A8       $51A1  
;;  $51BD       $5138   $513C   $517E   $518A  
;;  $51D0       $51CA  
;;  $51DB       $51C0   $51C5   $51CE  
;;  $51DC       $5051   $5163   $51AB   $51D0  
;;  $51E4       <entry>
;;  $51F4       $51F0  
;;  $5203       $5171  
;;  $520A       $51EC  
;;  $5215       $5200  
;;  $522B       $51E8  
;;  $522C       $595C  
;;  $522F       $569F  
;;  $5230       $522E  
;;  $5233       $5597   $5B3C   $5CF6  
;;  $5239       $5236  
;;  $523A       $516E   $51A8   $51FD  
;;  $525F       $5270  
;;  $526A       $5266  
;;  $527D       $5274   $5279  
;;  $527F       $5294  
;;  $5287       $5283  
;;  $528A       $5288  
;;  $5297       $54D2   $552C  
;;  $52A8       $52EF   $56A2  
;;  $52C8       $52D8   $52DE  
;;  $52D0       $52CC  
;;  $52F2       $52E9  
;;  $52F9       $52F7  
;;  $533C       $5336  
;;  $5360       $535B  
;;  $536D       $5302  
;;  $538A       $5385  
;;  $53B1       $538E  
;;  $53CA       $53B8   $53C0  
;;  $53CE       $53DC  
;;  $53D2       $53D0  
;;  $53D5       $53D3  
;;  $5410       $53F2  
;;  $5411       $5407   $540C  
;;  $5421       $541C  
;;  $5424       $5422  
;;  $5426       $5417  
;;  $5428       $531E   $532D   $533D   $5361   $5396   $53A2  
;;  $542C       $5434  
;;  $54FF       $54F8  
;;  $5524       $5520  
;;  $5528       $5517  
;;  $552F       $552A  
;;  $5533       $54F4   $5567   $556F   $5580  
;;  $554E       $554C  
;;  $558F       $557E  
;;  $559A       $5565  
;;  $559B       $556B   $5576   $5584  
;;  $55A7       $55A0  
;;  $55AE       $55A5  
;;  $55CE       $55EC  
;;  $55D0       $55E7  
;;  $55D2       $55E2  
;;  $5627       $5612   $5623  
;;  $5631       $5638  
;;  $563B       $5633  
;;  $5653       $564D  
;;  $56AE       $56A6  
;;  $56C5       $568B   $56AC   $56B6  
;;  $56D1       $56F3  
;;  $56E0       $56DE  
;;  $56E4       $56E2  
;;  $56EE       $56EC   $56F1  
;;  $56F5       $587F  
;;  $56F6       $56D3  
;;  $56FD       $5701  
;;  $5705       $5722  
;;  $575A       $5758  
;;  $5771       $576F  
;;  $57B0       $57C4  
;;  $57C0       $57BC  
;;  $57C1       $57B7   $57BA  
;;  $57D7       $57C9  
;;  $57D8       $5886  
;;  $57E4       $57DD  
;;  $57E8       $57F9  
;;  $5872       $58A9  
;;  $588F       $585B  
;;  $5890       $5856  
;;  $58E5       $58E2  
;;  $591F       $591B  
;;  $592B       $5921  
;;  $5931       $592E  
;;  $599B       $5995  
;;  $59A9       $59D8  
;;  $59AB       $59D3  
;;  $59AF       $59CF  
;;  $59CA       $59C6  
;;  $59DC       $59E3  
;;  $5A4C       $5A48  
;;  $5A58       $5A35  
;;  $5A5A       $5A7E  
;;  $5A6B       $5A5F   $5A65  
;;  $5A7A       $5A71  
;;  $5A80       $5A5D  
;;  $5A81       $52FF   $5A32  
;;  $5A88       $5A90  
;;  $5A93       $5A8B  
;;  $5A9C       $5A86   $5A96  
;;  $5A9D       $5A38   $5AAB   $5B5C  
;;  $5AA9       $5A67   $5B2F  
;;  $5AE7       $5AD2  
;;  $5AFD       $5AF8  
;;  $5B05       $5E32  
;;  $5B1F       $5B11  
;;  $5B2A       $5B22  
;;  $5B38       $5B35  
;;  $5B45       $5B15   $5B1D   $5B2C  
;;  $5B50       $5B4C  
;;  $5B68       $5B63  
;;  $5B7E       $5B7C  
;;  $5B82       $5B80  
;;  $5B88       $5B01   $5B09  
;;  $5B91       $5B68   $5B6C  
;;  $5B99       $5B96  
;;  $5B9F       $5B9C  
;;  $5BA4       $5B3F  
;;  $5C1E       $5C20  
;;  $5C54       $5C4E   $5C7A  
;;  $5C69       $5C27   $5C33  
;;  $5C6F       $5F6E  
;;  $5C73       $5C70  
;;  $5C79       $5C75  
;;  $5C7A       $5C78  
;;  $5C7C       $5C25   $5C3B  
;;  $5C7F       $5D0F  
;;  $5C80       $5C7E  
;;  $5C8C       $59E7   $59EC   $5C80  
;;  $5C9E       $5C9A  
;;  $5CAB       $5AEB   $5AF0   $5C83  
;;  $5CB6       $5CB3  
;;  $5CBC       $5BFC  
;;  $5CCD       $5CC6   $5CCA  
;;  $5D69       $5D67  
;;  $5DFE       $5DF8  
;;  $5E08       $5DEE  
;;  $5E16       $5E35  
;;  $5E32       $5E51  
;;  $5E62       $5E58  
;;  $5E78       $5E5E  
;;  $5ECC       $5ECA  
;;  $5F60       $5F5E  
;; ======================================================================== ;;
