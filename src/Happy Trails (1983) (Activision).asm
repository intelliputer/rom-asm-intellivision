
        ORG     $5000
.HEADER:
        BIDECLE $500C           ; 5000  Ptr: MOB graphic images
        BIDECLE $500C           ; 5002  Ptr: EXEC timer table
        BIDECLE $5352           ; 5004  Ptr: Start of game
        BIDECLE $5177           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $500E           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5011           ; 500A  Ptr: Date/Title
.TIMER:
        DECLE   $0000,  $0000   ; 500C  End of timer table

        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0001,  $0300   ; 500F  Color Stack init (0, 1)
.TITLE:
        DECLE   $0052           ; 5011  Cartridge year
        STRING  " "                             ; 5012  Title string
        STRING  " "             ; 5013  Border color init

        STRING  "   Activision       "          ; 5014  
        STRING  "    presents        "          ; 5028  
        STRING  "                    "          ; 503C  
        STRING  "              tm    "          ; 5050  
        STRING  "  HAPPY TRAILS      "          ; 5064  
        STRING  "                    "          ; 5078  
        STRING  " Copyright 1983     "          ; 508C  
        STRING  "                    "          ; 50A0  
        STRING  "Activision, Inc.  "            ; 50B4  
        DECLE   $0000                           ; 50C6  

        DECLE   $0000,  $0001,  $0001,  $0001   ; 50C7   0000 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 50CB   0001 0001 0001 0001
        DECLE   $0001,  $0000,  $0000,  $0000   ; 50CF   0001 0000 0000 0000
        DECLE   $0000,  $0001,  $0000,  $0001   ; 50D3   0000 0001 0000 0001
        DECLE   $0001,  $0001,  $0001,  $0000   ; 50D7   0001 0001 0001 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 50DB   0001 0000 0000 0000
        DECLE   $0000,  $0002,  $000A,  $0002   ; 50DF   0000 0002 000A 0002
        DECLE   $0000,  $0010,  $0045,  $004E   ; 50E3   0000 0010 0045 004E
        DECLE   $0054,  $0045,  $0052,  $0020   ; 50E7   0054 0045 0052 0020
        DECLE   $0047,  $0041,  $004D,  $0045   ; 50EB   0047 0041 004D 0045
        DECLE   $0020,  $004E,  $0055,  $004D   ; 50EF   0020 004E 0055 004D
        DECLE   $0042,  $0045,  $0052,  $0020   ; 50F3   0042 0045 0052 0020
        DECLE   $0020,  $003A,  $0042,  $004F   ; 50F7   0020 003A 0042 004F
        DECLE   $004E,  $0055,  $0053,  $0020   ; 50FB   004E 0055 0053 0020
        DECLE   $0048,  $0049,  $0047,  $0048   ; 50FF   0048 0049 0047 0048
        DECLE   $0053,  $0074,  $0061,  $006E   ; 5103   0053 0074 0061 006E
        DECLE   $0064,  $0061,  $0072,  $0064   ; 5107   0064 0061 0072 0064
        DECLE   $0052,  $0061,  $006E,  $0064   ; 510B   0052 0061 006E 0064
        DECLE   $006F,  $006D,  $0041,  $0064   ; 510F   006F 006D 0041 0064
        DECLE   $0076,  $0061,  $006E,  $0063   ; 5113   0076 0061 006E 0063
        DECLE   $0065,  $0064,  $0046,  $0061   ; 5117   0065 0064 0046 0061
        DECLE   $0073,  $0074,  $0020,  $0052   ; 511B   0073 0074 0020 0052
        DECLE   $0061,  $006E,  $0064,  $006F   ; 511F   0061 006E 0064 006F
        DECLE   $006D,  $004F,  $006E,  $0065   ; 5123   006D 004F 006E 0065
        DECLE   $0020,  $0050,  $006C,  $0061   ; 5127   0020 0050 006C 0061
        DECLE   $0079,  $0065,  $0072,  $0054   ; 512B   0079 0065 0072 0054
        DECLE   $0077,  $006F,  $0020,  $0050   ; 512F   0077 006F 0020 0050
        DECLE   $006C,  $0061,  $0079,  $0065   ; 5133   006C 0061 0079 0065
        DECLE   $0072,  $0073,  $004D,  $0061   ; 5137   0072 0073 004D 0061
        DECLE   $007A,  $0065,  $0050,  $004C   ; 513B   007A 0065 0050 004C
        DECLE   $0041,  $0059,  $0045,  $0052   ; 513F   0041 0059 0045 0052
        DECLE   $0280,  $0003,  $01AC,  $0001   ; 5143   0280 0003 01AC 0001
        DECLE   $017C,  $0003,  $01AC,  $0001   ; 5147   017C 0003 01AC 0001
        DECLE   $0280,  $0003,  $01AC,  $0001   ; 514B   0280 0003 01AC 0001
        DECLE   $017C,  $0003,  $01AC,  $0001   ; 514F   017C 0003 01AC 0001
        DECLE   $023A,  $0003,  $01AC,  $0001   ; 5153   023A 0003 01AC 0001
        DECLE   $017C,  $0003,  $01AC,  $0001   ; 5157   017C 0003 01AC 0001
        DECLE   $023A,  $0003,  $01AC,  $0001   ; 515B   023A 0003 01AC 0001
        DECLE   $017C,  $0003,  $0358,  $0001   ; 515F   017C 0003 0358 0001
        DECLE   $0000,  $0008,  $000E,  $0016   ; 5163   0000 0008 000E 0016
        DECLE   $0021,  $002B,  $0036           ; 5167   0021 002B 0036

        RSWD    R2                              ; 516A   003A
        ADDR    R2,     R7                      ; 516B   00D7

        DECLE   $0077,  $00DB,  $00BB,  $007B   ; 516C   0077 00DB 00BB 007B
        DECLE   $00DD,  $00BD,  $007D,  $00DE   ; 5170   00DD 00BD 007D 00DE
        DECLE   $00BE,  $007E,  $00B7           ; 5174   00BE 007E 00B7
.GFX_LIST_5177:
        SUB     G_0300, R0                      ; 5177   0300 0300
        SETC                                    ; 5179   0007
        SUBR    R1,     R7                      ; 517A   010F
        SUBR    R3,     R7                      ; 517B   011F
        SUBR    R1,     R7                      ; 517C   010F

        DECLE   $0007,  $00E0,  $01F0,  $01F8   ; 517D   0007 00E0 01F0 01F8
        DECLE   $01F0,  $00E0,  $0200,  $0038   ; 5181   01F0 00E0 0200 0038
        DECLE   $007E,  $02FF,  $02FF           ; 5185   007E 02FF 02FF

        SARC    R2,     2                       ; 5188   007E
        COMR    R4                              ; 5189   001C
        B       L_5193                          ; 518A   0200 0007

        DECLE   $0027,  $000F,  $001F,  $007F   ; 518C   0027 000F 001F 007F
        DECLE   $00FF                           ; 5190   00FF

        ADDR    R7,     R6                      ; 5191   00FE
        ADDR    R7,     R4                      ; 5192   00FC
L_5193:
        ADDR    R4,     R2                      ; 5193   00E2
        ADDR    R6,     R0                      ; 5194   00F0
        XORR    R4,     R0                      ; 5195   01E0
        ADDR    R0,     R2                      ; 5196   00C2
        MOVR    R1,     R7                      ; 5197   008F

        DECLE   $001F,  $003F                   ; 5198   001F 003F

        ADDR    R7,     R4                      ; 519A   00FC
        ADDR    R7,     R0                      ; 519B   00F8
        ADDR    R6,     R1                      ; 519C   00F1
        NEGR    R3                              ; 519D   0023
        SUBR    R0,     R7                      ; 519E   0107

        DECLE   $000F,  $0047,  $003F,  $007F   ; 519F   000F 0047 003F 007F
        DECLE   $00FF                           ; 51A3   00FF

        ADDR    R7,     R6                      ; 51A4   00FE
        ADDR    R7,     R0                      ; 51A5   00F8
        XORR    R6,     R0                      ; 51A6   01F0
        ADDR    R4,     R4                      ; 51A7   00E4
        SETC                                    ; 51A8   0007
        ADCR    R7                              ; 51A9   002F
        SUBR    R0,     R7                      ; 51AA   0107

L_51AB:
        SWAP    R3,     1                       ; 51AB   0043
        DECLE   $00F1,  $00F8,  $00FC,  $00E0   ; 51AC   00F1 00F8 00FC 00E0
        DECLE   $00F1,  $01F8,  $00FC,  $00FF   ; 51B0   00F1 01F8 00FC 00FF
        DECLE   $007F,  $003F,  $00FC,  $00FE   ; 51B4   007F 003F 00FC 00FE
        DECLE   $00FF,  $007F,  $001F           ; 51B8   00FF 007F 001F

        SLL     R3,     2                       ; 51BB   004F
        SUBR    R0,     R7                      ; 51BC   0107

        DECLE   $003F,  $001F,  $008F,  $00C2   ; 51BD   003F 001F 008F 00C2
        DECLE   $01E0,  $00F4,  $00E0,  $0007   ; 51C1   01E0 00F4 00E0 0007
        DECLE   $0027,  $000F,  $0007,  $0027   ; 51C5   0027 000F 0007 0027
        DECLE   $00FB,  $01FF                   ; 51C9   00FB 01FF

        XORR    R4,     R0                      ; 51CB   01E0
        ADDR    R6,     R2                      ; 51CC   00F2
        ADDR    R4,     R0                      ; 51CD   00E0
        ADDR    R4,     R4                      ; 51CE   00E4
        ADDR    R3,     R7                      ; 51CF   00DF

        DECLE   $01FF,  $01FF,  $00FB,  $0027   ; 51D0   01FF 01FF 00FB 0027

        SETC                                    ; 51D4   0007
        INCR    R7                              ; 51D5   000F
        MOVR    R0,     R7                      ; 51D6   0087

L_51D7:
        SETC                                    ; 51D7   0007
        DECLE   $01FF                           ; 51D8   01FF

        ADDR    R3,     R7                      ; 51D9   00DF

        ADDR    R4,     R4                      ; 51DA   00E4
        ADDR    R4,     R0                      ; 51DB   00E0
        ADDR    R6,     R0                      ; 51DC   00F0
        XORR    R4,     R0                      ; 51DD   01E0
        ADDR    R6,     R0                      ; 51DE   00F0
        XORR    R4,     R0                      ; 51DF   01E0
        ADDR    R0,     R0                      ; 51E0   00C0
        TSTR    R0                              ; 51E1   0080
        B       L_52DC                          ; 51E2   0200 00F8

        ADDR    R6,     R0                      ; 51E4   00F0
        ADDR    R4,     R0                      ; 51E5   00E0
        TSTR    R0                              ; 51E6   0080
        SUB     .STIC.Y.7,R0                    ; 51E7   0300 000F
        SUBR    R0,     R7                      ; 51E9   0107

        DECLE   $0003,  $0001,  $0200,  $001F   ; 51EA   0003 0001 0200 001F
        DECLE   $000F,  $0007,  $0001           ; 51EE   000F 0007 0001

        SUB     G_0300, R0                      ; 51F1   0300 0300
        TSTR    R0                              ; 51F3   0080
        ADDR    R4,     R0                      ; 51F4   00E0
        ADDR    R6,     R0                      ; 51F5   00F0
        ADDR    R7,     R0                      ; 51F6   00F8
        B       L_5279                          ; 51F7   0200 0080

        ADDR    R0,     R0                      ; 51F9   00C0
        XORR    R4,     R0                      ; 51FA   01E0
        ADDR    R6,     R0                      ; 51FB   00F0
        SUB     .STIC.X.1,R0                    ; 51FC   0300 0001
        SETC                                    ; 51FE   0007
        INCR    R7                              ; 51FF   000F

        DECLE   $001F                           ; 5200   001F
L_5201:
        B       L_5204                          ; 5201   0200 0001

        DIS                                     ; 5203   0003
L_5204:
        SUBR    R0,     R7                      ; 5204   0107

        DECLE   $000F,  $03FF,  $00FF,  $00F8   ; 5205   000F 03FF 00FF 00F8
        DECLE   $00E0,  $0080,  $0080,  $00E0   ; 5209   00E0 0080 0080 00E0
        DECLE   $00F8,  $00FF,  $03FF,  $03FF   ; 520D   00F8 00FF 03FF 03FF
        DECLE   $00FF,  $001F,  $0007,  $0001   ; 5211   00FF 001F 0007 0001
        DECLE   $0001,  $0007,  $001F,  $00FF   ; 5215   0001 0007 001F 00FF
        DECLE   $03FF,  $00FF,  $01FE,  $01FC   ; 5219   03FF 00FF 01FE 01FC
        DECLE   $02F8,  $00FF,  $017F,  $013F   ; 521D   02F8 00FF 017F 013F
        DECLE   $021F,  $02F8,  $01FC,  $01FE   ; 5221   021F 02F8 01FC 01FE
        DECLE   $00FF,  $021F,  $013F,  $017F   ; 5225   00FF 021F 013F 017F
        DECLE   $01FF,  $0081,  $0399,  $0081   ; 5229   01FF 0081 0399 0081
        DECLE   $01FF,  $00D7,  $03C7,  $0001   ; 522D   01FF 00D7 03C7 0001
        DECLE   $00FF,  $02C7,  $00E7,  $01E1   ; 5231   00FF 02C7 00E7 01E1
        DECLE   $03FF,  $00D7,  $03C7,  $0001   ; 5235   03FF 00D7 03C7 0001
        DECLE   $00FF                           ; 5239   00FF

        MVI@    R2,     R3                      ; 523A   0293
        ANDR    R0,     R0                      ; 523B   0180
        ADDI    #$00D7, R7                      ; 523C   02FF 00D7

        DECLE   $03C7,  $0001,  $00FF           ; 523E   03C7 0001 00FF

        ADDR    R0,     R7                      ; 5241   00C7

        XORR    R0,     R1                      ; 5242   01C1
        ADDR    R1,     R7                      ; 5243   00CF

        DECLE   $01C3,  $01FF,  $00D7,  $03C7   ; 5244   01C3 01FF 00D7 03C7
        DECLE   $0001,  $00FF,  $00CF,  $01C3   ; 5248   0001 00FF 00CF 01C3
        DECLE   $01CF                           ; 524C   01CF

        XORR    R0,     R3                      ; 524D   01C3
        ADDI    #$00C9, R7                      ; 524E   02FF 00C9

        DECLE   $00E3,  $00F7,  $00E3,  $01C9   ; 5250   00E3 00F7 00E3 01C9
        DECLE   $009C,  $0090,  $009C,  $0084   ; 5254   009C 0090 009C 0084
        DECLE   $009C,  $0188,  $00C1,  $00FF   ; 5258   009C 0188 00C1 00FF
        DECLE   $00E3,  $01C1,  $0188,  $00BE   ; 525C   00E3 01C1 0188 00BE
        DECLE   $009C,  $0088,  $009C,  $0094   ; 5260   009C 0088 009C 0094
        DECLE   $00A2,  $0080,  $01C1,  $00E3   ; 5264   00A2 0080 01C1 00E3
        DECLE   $01FF,  $00D7,  $01C7,  $0001   ; 5268   01FF 00D7 01C7 0001

        ADDR    R2,     R7                      ; 526C   00D7

        MOVR    R2,     R3                      ; 526D   0093
        ADDI    #$00BB, R7                      ; 526E   02FF 00BB
        ADDR    R2,     R7                      ; 5270   00D7
        ADDR    R5,     R7                      ; 5271   00EF
        ADDR    R2,     R7                      ; 5272   00D7

        DECLE   $00BB,  $00FF,  $0028,  $0000   ; 5273   00BB 00FF 0028 0000

        EIS                                     ; 5277   0002
        SETC                                    ; 5278   0007
L_5279:
        INCR    R4                              ; 5279   000C
        DECLE   $0010,  $0014,  $001C,  $0023   ; 527A   0010 0014 001C 0023
        DECLE   $002A,  $0031,  $0038,  $003F   ; 527E   002A 0031 0038 003F
        DECLE   $0046,  $004D,  $0054,  $005A   ; 5282   0046 004D 0054 005A
        DECLE   $0061,  $0067,  $006C,  $0071   ; 5286   0061 0067 006C 0071
        DECLE   $0076,  $007B,  $0080,  $0085   ; 528A   0076 007B 0080 0085
        DECLE   $008A,  $0068,  $0070,  $0078   ; 528E   008A 0068 0070 0078
        DECLE   $0080,  $0028,  $0030,  $0038   ; 5292   0080 0028 0030 0038
        DECLE   $0040,  $0048,  $0050,  $0058   ; 5296   0040 0048 0050 0058
        DECLE   $0060,  $0008,  $0010,  $0008   ; 529A   0060 0008 0010 0008
        DECLE   $0010,  $0018,  $0018,  $0020   ; 529E   0010 0018 0018 0020
        DECLE   $0020,  $0028,  $0088,  $0090   ; 52A2   0020 0028 0088 0090
        DECLE   $0000,  $0098,  $0050,  $0000   ; 52A6   0000 0098 0050 0000
        DECLE   $00A0,  $00A8,  $0000,  $0058   ; 52AA   00A0 00A8 0000 0058
        DECLE   $00B0,  $0000                   ; 52AE   00B0 0000

        MOVR    R7,     R0                      ; 52B0   00B8
        ADDR    R0,     R0                      ; 52B1   00C0
        SWAP    R0,     1                       ; 52B2   0040
        NEGR    R1                              ; 52B3   0021
        SWAP    R1,     1                       ; 52B4   0041
        MOVR    R2,     R0                      ; 52B5   0090
        ADDR    R0,     R0                      ; 52B6   00C0
        ADDR    R4,     R3                      ; 52B7   00E3
        MOVR    R2,     R3                      ; 52B8   0093
        RLC     R2,     1                       ; 52B9   0052
        NEGR    R2                              ; 52BA   0022
        MOVR    R6,     R3                      ; 52BB   00B3
        ADDR    R0,     R3                      ; 52BC   00C3
        GSWD    R2                              ; 52BD   0032
        SWAP    R2,     1                       ; 52BE   0042
        NEGR    R1                              ; 52BF   0021
        SWAP    R1,     1                       ; 52C0   0041
        SUBR    R0,     R0                      ; 52C1   0100
        SUBR    R0,     R0                      ; 52C2   0100
        SUBR    R0,     R0                      ; 52C3   0100
        SUBR    R0,     R0                      ; 52C4   0100
        MOVR    R2,     R0                      ; 52C5   0090
        ADDR    R0,     R0                      ; 52C6   00C0
        SUBR    R0,     R0                      ; 52C7   0100
        MOVR    R2,     R3                      ; 52C8   0093
        SUBR    R0,     R0                      ; 52C9   0100
        NEGR    R2                              ; 52CA   0022
        SUBR    R0,     R0                      ; 52CB   0100
        ADDR    R0,     R3                      ; 52CC   00C3
        GSWD    R2                              ; 52CD   0032
        SUBR    R0,     R0                      ; 52CE   0100
        MOVR    R6,     R3                      ; 52CF   00B3
        SUBR    R0,     R0                      ; 52D0   0100
        SUBR    R0,     R0                      ; 52D1   0100
        SWAP    R2,     1                       ; 52D2   0042
        ADDR    R4,     R3                      ; 52D3   00E3
        SUBR    R0,     R0                      ; 52D4   0100
        RLC     R2,     1                       ; 52D5   0052
        SUBR    R0,     R0                      ; 52D6   0100
        ADDR    R4,     R7                      ; 52D7   00E7
        MOVR    R2,     R7                      ; 52D8   0097

        DECLE   $0054,  $0024,  $00B7           ; 52D9   0054 0024 00B7
L_52DC:
        ADDR    R0,     R7                      ; 52DC   00C7

        DECLE   $0034,  $0044,  $00E5,  $0095   ; 52DD   0034 0044 00E5 0095
        DECLE   $0056,  $0026,  $00B5,  $00C5   ; 52E1   0056 0026 00B5 00C5
        DECLE   $0036,  $0046,  $0100,  $0100   ; 52E5   0036 0046 0100 0100
        DECLE   $0100,  $0100,  $0240,  $0100   ; 52E9   0100 0100 0240 0100
        DECLE   $0120,  $0240,  $0240,  $0100   ; 52ED   0120 0240 0240 0100
        DECLE   $0120,  $0120,  $0100,  $0022   ; 52F1   0120 0120 0100 0022
        DECLE   $0023,  $0024,  $0025,  $0034   ; 52F5   0023 0024 0025 0034
        DECLE   $0035,  $0036,  $0037           ; 52F9   0035 0036 0037

        SWAP    R0,     2                       ; 52FC   0044
        SWAP    R1,     2                       ; 52FD   0045
        SWAP    R2,     2                       ; 52FE   0046
        SWAP    R3,     2                       ; 52FF   0047
        RLC     R1,     2                       ; 5300   0055
        RLC     R2,     2                       ; 5301   0056
        RLC     R3,     2                       ; 5302   0057
        SLLC    R0,     1                       ; 5303   0058
        ADCR    R4                              ; 5304   002C
        GSWD    R0                              ; 5305   0030
        ADDR    R1,     R0                      ; 5306   00C8
        ADDR    R0,     R0                      ; 5307   00C0
        MOVR    R3,     R0                      ; 5308   0098
        ADDR    R2,     R0                      ; 5309   00D0
        GSWD    R0                              ; 530A   0030
        ADCR    R4                              ; 530B   002C
        ADDR    R3,     R0                      ; 530C   00D8
        MOVR    R6,     R0                      ; 530D   00B0
        MOVR    R1,     R0                      ; 530E   0088
        ADDR    R4,     R0                      ; 530F   00E0
        NEGR    R4                              ; 5310   0024
        ADCR    R0                              ; 5311   0028
        ADDR    R5,     R0                      ; 5312   00E8
        MOVR    R7,     R0                      ; 5313   00B8
        MOVR    R5,     R0                      ; 5314   00A8
L_5315:
        ADDR    R6,     R0                      ; 5315   00F0
        ADCR    R0                              ; 5316   0028
        NEGR    R4                              ; 5317   0024
        ADDR    R7,     R0                      ; 5318   00F8
L_5319:
        MOVR    R4,     R0                      ; 5319   00A0
        MOVR    R2,     R0                      ; 531A   0090
        SUBR    R0,     R0                      ; 531B   0100
        NOP                                     ; 531C   0034
        NOP                                     ; 531D   0034
        ANDR    R4,     R5                      ; 531E   01A5
        ANDR    R6,     R5                      ; 531F   01B5
        XORR    R0,     R5                      ; 5320   01C5
        XORR    R2,     R5                      ; 5321   01D5
        ANDR    R5,     R5                      ; 5322   01AD
        ANDR    R7,     R5                      ; 5323   01BD
        XORR    R1,     R5                      ; 5324   01CD
        XORR    R3,     R5                      ; 5325   01DD
        ANDR    R7,     R4                      ; 5326   01BC
        ANDR    R5,     R4                      ; 5327   01AC
        XORR    R3,     R4                      ; 5328   01DC
        XORR    R1,     R4                      ; 5329   01CC
        XORR    R0,     R4                      ; 532A   01C4
L_532B:
        ANDR    R6,     R4                      ; 532B   01B4
        DECLE   $01E4,  $01D4,  $01A5,  $01AD   ; 532C   01E4 01D4 01A5 01AD
        DECLE   $01C5,  $01CD,  $01B5,  $01BD   ; 5330   01C5 01CD 01B5 01BD
        DECLE   $01D5,  $01DD,  $01AD,  $01A5   ; 5334   01D5 01DD 01AD 01A5
        DECLE   $01CD,  $01C5,  $01BD,  $01B5   ; 5338   01CD 01C5 01BD 01B5
        DECLE   $01DD,  $01D5,  $01FC,  $00C8   ; 533C   01DD 01D5 01FC 00C8
        DECLE   $0158,  $01E8,  $00FC,  $0060   ; 5340   0158 01E8 00FC 0060
        DECLE   $00A4,  $00E8,  $007C,  $0028   ; 5344   00A4 00E8 007C 0028
        DECLE   $0048,  $0068,  $003C,  $0010   ; 5348   0048 0068 003C 0010
        DECLE   $001C,  $0028,  $001C,  $0004   ; 534C   001C 0028 001C 0004

        INCR    R0                              ; 5350   0008
        INCR    R4                              ; 5351   000C
.START:
        MVII    #$02F0, R0                      ; 5352   02B8 02F0
        MOVR    R0,     R6                      ; 5354   0086
        MVII    #$003E, R0                      ; 5355   02B8 003E
        MVO     R0,     .ISRVEC.0               ; 5357   0240 0100
        MVII    #$005D, R0                      ; 5359   02B8 005D
        MVO     R0,     .ISRVEC.1               ; 535B   0240 0101
        CLRR    R0                              ; 535D   01C0
        MVO     R0,     G_0358                  ; 535E   0240 0358
        INCR    R0                              ; 5360   0008
        MVO     R0,     G_035D                  ; 5361   0240 035D
        EIS                                     ; 5363   0002

        JSR     R4,     L_5DC6                  ; 5364   0004 005C 01C6
        JSR     R4,     L_5DFA                  ; 5367   0004 005C 01FA
        DECLE   $00E5,  $0011,  $023D           ; 536A   00E5 0011 023D
L_536D:
        JSR     R4,     L_5DAF                  ; 536D   0004 005C 01AF

        CLRR    R0                              ; 5370   01C0
        MVO     R0,     .STIC.BORD              ; 5371   0240 002C

        JSR     R4,     L_5E14                  ; 5373   0004 005C 0214

        BC      L_537D                          ; 5376   0201 0005

        TSTR    R1                              ; 5378   0089
        BPL     L_536D                          ; 5379   0223 000D
        B       L_5382                          ; 537B   0200 0005

L_537D:
        DECR    R1                              ; 537D   0011
        CMPI    #$0008, R1                      ; 537E   0379 0008
        BNC     L_5383                          ; 5380   0209 0001

L_5382:
        CLRR    R1                              ; 5382   01C9
L_5383:
        MVO     R1,     G_0102                  ; 5383   0241 0102
        SDBD                                    ; 5385   0001
        MVII    #$92CA, R2                      ; 5386   02BA 00CA 0092
        MVO     R2,     G_035E                  ; 5389   0242 035E
        MVO     R2,     G_035F                  ; 538B   0242 035F
        MVII    #$0102, R5                      ; 538D   02BD 0102
L_538F:
        MVO     R5,     G_035D                  ; 538F   0245 035D

        JSR     R4,     L_5DCE                  ; 5391   0004 005C 01CE
        DECLE   $01FE                           ; 5394   01FE

        JSR     R4,     L_5DCD                  ; 5395   0004 005C 01CD
        DECLE   $0308,  $035D                   ; 5398   0308 035D

        MVII    #$001F, R0                      ; 539A   02B8 001F
        MVO     R0,     .PSG0.noise             ; 539C   0240 01F9

        JSR     R4,     L_5DAF                  ; 539E   0004 005C 01AF
        JSR     R4,     L_5DCD                  ; 53A1   0004 005C 01CD
        DECLE   $0000,  $0020                   ; 53A4   0000 0020

        MVI     .STIC.MODE,R1                   ; 53A6   0281 0021

        JSR     R4,     L_5DC6                  ; 53A8   0004 005C 01C6
        JSR     R4,     L_5DFA                  ; 53AB   0004 005C 01FA
        DECLE   $004E,  $0028,  $0200           ; 53AE   004E 0028 0200

        JSR     R4,     L_5DFA                  ; 53B1   0004 005C 01FA
        DECLE   $00EB,  $000E,  $023F           ; 53B4   00EB 000E 023F
L_53B7:
        MVI     G_0102, R1                      ; 53B7   0281 0102
        SLL     R1,     2                       ; 53B9   004D
        SLL     R1,     1                       ; 53BA   0049
        ADDI    #$008F, R1                      ; 53BB   02F9 008F
        MVO     R1,     .BTAB.4B                ; 53BD   0241 024B

        JSR     R4,     L_5DC0                  ; 53BF   0004 005C 01C0

        MVI     G_0102, R2                      ; 53C2   0282 0102
        SLR     R2,     1                       ; 53C4   0062
        MVII    #$028F, R3                      ; 53C5   02BB 028F
        CLRR    R0                              ; 53C7   01C0
        CMPI    #$0002, R2                      ; 53C8   037A 0002
        BNC     L_53D1                          ; 53CA   0209 0005

        MVII    #$0004, R0                      ; 53CC   02B8 0004
        BEQ     L_53D1                          ; 53CE   0204 0001

        DECR    R3                              ; 53D0   0013
L_53D1:
        CMPI    #$0001, R2                      ; 53D1   037A 0001
        BNEQ    L_53D6                          ; 53D3   020C 0001

        INCR    R3                              ; 53D5   000B
L_53D6:
        MVO     R0,     G_018C                  ; 53D6   0240 018C
        MVO     R0,     G_0199                  ; 53D8   0240 0199

        JSR     R4,     L_5DEE                  ; 53DA   0004 005C 01EE

        MVII    #$0006, R2                      ; 53DD   02BA 0006
        INCR    R3                              ; 53DF   000B

        JSR     R4,     L_5DEE                  ; 53E0   0004 005C 01EE

        MVI     G_0102, R2                      ; 53E3   0282 0102
        ANDI    #$0001, R2                      ; 53E5   03BA 0001
        ADDI    #$0004, R2                      ; 53E7   02FA 0004

        JSR     R4,     L_5DED                  ; 53E9   0004 005C 01ED
        DECLE   $02B8                           ; 53EC   02B8

        MVII    #$0078, R2                      ; 53ED   02BA 0078

L_53EF:
        JSR     R4,     L_5DAF                  ; 53EF   0004 005C 01AF
        JSR     R4,     L_5E14                  ; 53F2   0004 005C 0214

        BNC     L_540B                          ; 53F5   0209 0014

        DECR    R1                              ; 53F7   0011
        CMPI    #$0008, R1                      ; 53F8   0379 0008
        BC      L_540B                          ; 53FA   0201 000F

        MVO     R1,     G_0102                  ; 53FC   0241 0102
        SDBD                                    ; 53FE   0001
        MVII    #$92CA, R0                      ; 53FF   02B8 00CA 0092
        RRC     R1,     2                       ; 5402   0075
        BNOV    L_5407                          ; 5403   020A 0002

        MVI     G_035E, R0                      ; 5405   0280 035E
L_5407:
        MVO     R0,     G_035F                  ; 5407   0240 035F
        B       L_53B7                          ; 5409   0220 0053

L_540B:
        DECR    R2                              ; 540B   0012
        BNEQ    L_53EF                          ; 540C   022C 001E

        MVI     G_035F, R0                      ; 540E   0280 035F
        MVII    #$035A, R4                      ; 5410   02BC 035A
        MVO@    R0,     R4                      ; 5412   0260
        MVO@    R0,     R4                      ; 5413   0260
        MVO@    R0,     R4                      ; 5414   0260
        DECR    R2                              ; 5415   0012
        MVO     R2,     G_035D                  ; 5416   0242 035D
        MVO     R2,     G_0190                  ; 5418   0242 0190
        MVO     R2,     G_019D                  ; 541A   0242 019D

        JSR     R4,     L_5DAF                  ; 541C   0004 005C 01AF

        SDBD                                    ; 541F   0001
        MVII    #$5177, R0                      ; 5420   02B8 0077 0051
        MVII    #$0180, R1                      ; 5423   02B9 0180
        SDBD                                    ; 5425   0001
        MVII    #$3800, R5                      ; 5426   02BD 0000 0038

        JSR     R4,     L_5E5A                  ; 5429   0004 005C 025A

        MVII    #$0003, R1                      ; 542C   02B9 0003
        MVO     R1,     G_018B                  ; 542E   0241 018B
        MVO     R1,     G_0198                  ; 5430   0241 0198
        MVO     R1,     .STIC.MODE              ; 5432   0241 0021
        DECR    R1                              ; 5434   0011
        MVO     R1,     .PSG0.envlp_hi          ; 5435   0241 01F7
        MVO     R1,     .PSG0.chn_c_hi          ; 5437   0241 01F6
L_5439:
        MVII    #$0001, R0                      ; 5439   02B8 0001
        MVO     R0,     G_0357                  ; 543B   0240 0357
        SUBI    #$0002, R0                      ; 543D   0338 0002
        MVO     R0,     G_035D                  ; 543F   0240 035D
        MVII    #$0018, R0                      ; 5441   02B8 0018
        MVO     R0,     .PSG0.chan_enable       ; 5443   0240 01F8

        JSR     R4,     L_5DCD                  ; 5445   0004 005C 01CD
        DECLE   $0310,  $0357                   ; 5448   0310 0357

        JSR     R4,     L_5DCD                  ; 544A   0004 005C 01CD
        DECLE   $010A,  $0184                   ; 544D   010A 0184

        MVI     G_018C, R3                      ; 544F   0283 018C
        MOVR    R3,     R1                      ; 5451   0099
        MVI     G_0102, R2                      ; 5452   0282 0102
        SLR     R2,     2                       ; 5454   0066
        BNEQ    L_5458                          ; 5455   020C 0001

        SLR     R1,     1                       ; 5457   0061
L_5458:
        ANDI    #$00FC, R1                      ; 5458   03B9 00FC
        CMPI    #$0014, R1                      ; 545A   0379 0014
        BNC     L_5460                          ; 545C   0209 0002

        MVII    #$0010, R1                      ; 545E   02B9 0010
L_5460:
        SDBD                                    ; 5460   0001
        DECLE   $02F9,  $003E,  $0053,  $008D   ; 5461   02F9 003E 0053 008D
        DECLE   $02BC,  $032F,  $02A9,  $0261   ; 5465   02BC 032F 02A9 0261
        DECLE   $02A9,  $0261,  $02A9,  $0261   ; 5469   02A9 0261 02A9 0261
        DECLE   $02A9,  $0261,  $03BB,  $000F   ; 546D   02A9 0261 03BB 000F
        DECLE   $0001                           ; 5471   0001

        ADDI    #$00F4, R3                      ; 5472   02FB 00F4
        RLC     R2,     1                       ; 5474   0052
        MVI@    R3,     R1                      ; 5475   0299
        MOVR    R1,     R2                      ; 5476   008A
        ANDI    #$000F, R2                      ; 5477   03BA 000F
        MVO     R2,     G_012D                  ; 5479   0242 012D
        SLR     R1,     2                       ; 547B   0065
        MVII    #$021E, R4                      ; 547C   02BC 021E
        SLR     R1,     2                       ; 547E   0065
        MVO     R1,     G_012C                  ; 547F   0241 012C
        SUBR    R2,     R4                      ; 5481   0114
        CMPI    #$0004, R1                      ; 5482   0379 0004
        BC      L_5488                          ; 5484   0201 0002

        ADDI    #$0014, R4                      ; 5486   02FC 0014
L_5488:
        MVO     R4,     G_0321                  ; 5488   0244 0321
        MVII    #$0016, R0                      ; 548A   02B8 0016
        SWAP    R0,     1                       ; 548C   0040

        JSR     R4,     L_5DC7                  ; 548D   0004 005C 01C7

        MVI     G_012C, R1                      ; 5490   0281 012C
        CMPI    #$0005, R1                      ; 5492   0379 0005
        BEQ     L_549A                          ; 5494   0204 0004

        JSR     R4,     L_5DD5                  ; 5496   0004 005C 01D5
        DECLE   $00F9                           ; 5499   00F9
L_549A:
        MVI     G_012C, R1                      ; 549A   0281 012C
        MVI     G_012D, R2                      ; 549C   0282 012D
        DECR    R2                              ; 549E   0012
        SLR     R2,     1                       ; 549F   0062
        DECR    R1                              ; 54A0   0011
        SLR     R1,     1                       ; 54A1   0061
        MVO     R1,     G_0119                  ; 54A2   0241 0119
        MVO     R2,     G_011A                  ; 54A4   0242 011A

        JSR     R4,     L_5E2E                  ; 54A6   0004 005C 022E
        JSR     R4,     L_5E38                  ; 54A9   0004 005C 0238

        MVII    #$0034, R0                      ; 54AC   02B8 0034
        MVO@    R0,     R3                      ; 54AE   0258
        CLRR    R1                              ; 54AF   01C9
        MVO@    R1,     R5                      ; 54B0   0269
        MVO@    R1,     R5                      ; 54B1   0269
        ADDI    #$0012, R5                      ; 54B2   02FD 0012
        MVO@    R1,     R5                      ; 54B4   0269
        MVO@    R1,     R5                      ; 54B5   0269
        MVI     G_012C, R1                      ; 54B6   0281 012C
        SDBD                                    ; 54B8   0001
        MVII    #$0804, R2                      ; 54B9   02BA 0004 0008
        MVII    #$0003, R3                      ; 54BC   02BB 0003
        MVI     G_0321, R4                      ; 54BE   0284 0321
        MVII    #$0149, R5                      ; 54C0   02BD 0149
L_54C2:
        PSHR    R1                              ; 54C2   0271
        MVO     R5,     G_0333                  ; 54C3   0245 0333
        MVI     G_012D, R0                      ; 54C5   0280 012D
        RRC     R0,     1                       ; 54C7   0070
        BC      L_54CC                          ; 54C8   0201 0002

        XORI    #$0001, R2                      ; 54CA   03FA 0001
L_54CC:
        RLC     R0,     1                       ; 54CC   0050
L_54CD:
        TSTR    R3                              ; 54CD   009B
        BNEQ    L_54D5                          ; 54CE   020C 0005

        DECR    R3                              ; 54D0   0013
        MVO     R3,     G_0121                  ; 54D1   0243 0121
        B       L_54DF                          ; 54D3   0200 000A

L_54D5:
        CMPI    #$0003, R3                      ; 54D5   037B 0003
        BEQ     L_54DF                          ; 54D7   0204 0006

        CMPI    #$0004, R3                      ; 54D9   037B 0004
        BEQ     L_54DF                          ; 54DB   0204 0002

        MVO     R3,     G_0120                  ; 54DD   0243 0120
L_54DF:
        MVI     G_035A, R1                      ; 54DF   0281 035A
        MOVR    R1,     R3                      ; 54E1   008B
        SLL     R3,     2                       ; 54E2   004F
        ADDR    R3,     R1                      ; 54E3   00D9
        SLL     R3,     2                       ; 54E4   004F
        SLL     R3,     2                       ; 54E5   004F
        ADDR    R3,     R1                      ; 54E6   00D9
        SLL     R3,     2                       ; 54E7   004F
        SLL     R3,     1                       ; 54E8   004B
        ADDR    R1,     R3                      ; 54E9   00CB
        ADDI    #$0059, R3                      ; 54EA   02FB 0059
        MVO     R3,     G_035A                  ; 54EC   0243 035A
        SLR     R3,     2                       ; 54EE   0067
        SLR     R3,     2                       ; 54EF   0067
        CLRR    R1                              ; 54F0   01C9
        SLR     R3,     2                       ; 54F1   0067
        SLR     R3,     1                       ; 54F2   0063
        AND     G_032F, R3                      ; 54F3   0383 032F
        CMP     G_0330, R3                      ; 54F5   0343 0330
        BNC     L_550A                          ; 54F7   0209 0011

        ADDI    #$0004, R1                      ; 54F9   02F9 0004
        CMP     G_0331, R3                      ; 54FB   0343 0331
        BNC     L_550A                          ; 54FD   0209 000B

        ADDI    #$0004, R1                      ; 54FF   02F9 0004
        CMP     G_0332, R3                      ; 5501   0343 0332
        BNC     L_550A                          ; 5503   0209 0005

        SUB     G_0332, R3                      ; 5505   0303 0332
        ADDI    #$000C, R3                      ; 5507   02FB 000C
        MOVR    R3,     R1                      ; 5509   0099
L_550A:
        MVI@    R5,     R3                      ; 550A   02AB
        PSHR    R5                              ; 550B   0275
        CMPI    #$0034, R3                      ; 550C   037B 0034
        BNEQ    L_5516                          ; 550E   020C 0006

        ADDI    #$0002, R4                      ; 5510   02FC 0002
        MVII    #$0003, R3                      ; 5512   02BB 0003
        B       L_5538                          ; 5514   0200 0022

L_5516:
        DECR    R5                              ; 5516   0015
        MVO@    R1,     R5                      ; 5517   0269
        MOVR    R1,     R5                      ; 5518   008D
        SLR     R1,     2                       ; 5519   0065
        PSHR    R1                              ; 551A   0271
        SDBD                                    ; 551B   0001
        ADDI    #$52EB, R1                      ; 551C   02F9 00EB 0052
        MVI@    R1,     R3                      ; 551F   028B
        SLL     R3,     2                       ; 5520   004F
        SLL     R3,     2                       ; 5521   004F
        ADDR    R2,     R3                      ; 5522   00D3
        SDBD                                    ; 5523   0001
        ADDI    #$528F, R5                      ; 5524   02FD 008F 0052
        MVI@    R5,     R1                      ; 5527   02A9
        ADDR    R3,     R1                      ; 5528   00D9
        MVO@    R1,     R4                      ; 5529   0261
        MVI@    R5,     R1                      ; 552A   02A9
        ADDR    R3,     R1                      ; 552B   00D9
        MVO@    R1,     R4                      ; 552C   0261
        ADDI    #$0012, R4                      ; 552D   02FC 0012
        MVI@    R5,     R1                      ; 552F   02A9
        ADDR    R3,     R1                      ; 5530   00D9
        MVO@    R1,     R4                      ; 5531   0261
        MVI@    R5,     R1                      ; 5532   02A9
        ADDR    R3,     R1                      ; 5533   00D9
        MVO@    R1,     R4                      ; 5534   0261
        PULR    R3                              ; 5535   02B3
        SUBI    #$0014, R4                      ; 5536   033C 0014
L_5538:
        XORI    #$0001, R2                      ; 5538   03FA 0001
        PULR    R5                              ; 553A   02B5
        DECR    R0                              ; 553B   0010
        BNEQ    L_54CD                          ; 553C   022C 0070

        PULR    R1                              ; 553E   02B1
        DECR    R1                              ; 553F   0011
        BEQ     L_554E                          ; 5540   0204 000C

        MVI     G_0333, R5                      ; 5542   0285 0333
        ADDI    #$000A, R5                      ; 5544   02FD 000A
        ADDI    #$0028, R4                      ; 5546   02FC 0028
        SUB     G_012D, R4                      ; 5548   0304 012D
        SUB     G_012D, R4                      ; 554A   0304 012D
        B       L_54C2                          ; 554C   0220 008B

L_554E:
        MVII    #$0004, R1                      ; 554E   02B9 0004
        MVI     G_0120, R0                      ; 5550   0280 0120
        TSTR    R0                              ; 5552   0080
        BEQ     L_555A                          ; 5553   0204 0005

        MVI     G_0121, R1                      ; 5555   0281 0121
        TSTR    R1                              ; 5557   0089
        BNEQ    L_5568                          ; 5558   020C 000E

L_555A:
        XORI    #$0001, R2                      ; 555A   03FA 0001
        SUBI    #$0002, R4                      ; 555C   033C 0002
        DECR    R5                              ; 555E   0015
        MVII    #$0001, R0                      ; 555F   02B8 0001
        MVO     R0,     G_0120                  ; 5561   0240 0120
        MVO     R0,     G_0121                  ; 5563   0240 0121
        PSHR    R0                              ; 5565   0270
        B       L_550A                          ; 5566   0220 005D

L_5568:
        SDBD                                    ; 5568   0001
        MVII    #$5304, R5                      ; 5569   02BD 0004 0053
        MVI     G_0321, R2                      ; 556C   0282 0321
        DECR    R2                              ; 556E   0012
        MVII    #$0148, R3                      ; 556F   02BB 0148

        JSR     R4,     L_5E7C                  ; 5571   0004 005C 027C

        MVI     G_012D, R2                      ; 5574   0282 012D
        MVII    #$0149, R3                      ; 5576   02BB 0149
        ADDR    R2,     R3                      ; 5578   00D3
        SLL     R2,     1                       ; 5579   004A
        ADD     G_0321, R2                      ; 557A   02C2 0321

        JSR     R4,     L_5E7C                  ; 557C   0004 005C 027C

        MVI     G_0321, R2                      ; 557F   0282 0321
        SUBI    #$0015, R2                      ; 5581   033A 0015
        MVO@    R1,     R2                      ; 5583   0251
        INCR    R2                              ; 5584   000A
        MVII    #$013F, R3                      ; 5585   02BB 013F

        JSR     R4,     L_5E74                  ; 5587   0004 005C 0274

        MVI     G_012C, R1                      ; 558A   0281 012C
        CLRR    R2                              ; 558C   01D2

        JSR     R4,     L_5E2E                  ; 558D   0004 005C 022E
        JSR     R4,     L_5E38                  ; 5590   0004 005C 0238

        MOVR    R5,     R2                      ; 5593   00AA
        SDBD                                    ; 5594   0001
        MVII    #$5316, R5                      ; 5595   02BD 0016 0053
        CMPI    #$0005, R1                      ; 5598   0379 0005
        BNEQ    L_559E                          ; 559A   020C 0002

        ADDI    #$0006, R5                      ; 559C   02FD 0006

L_559E:
        JSR     R4,     L_5E74                  ; 559E   0004 005C 0274

        SDBD                                    ; 55A1   0001
        MVII    #$1688, R0                      ; 55A2   02B8 0088 0016
        MVO     R0,     .BTAB.EA                ; 55A5   0240 02EA
        SDBD                                    ; 55A7   0001
        MVII    #$1F78, R0                      ; 55A8   02B8 0078 001F
        MVO     R0,     .BTAB.EB                ; 55AB   0240 02EB
        MVII    #$0028, R1                      ; 55AD   02B9 0028
        MVO     R1,     G_010E                  ; 55AF   0241 010E
        MVII    #$0019, R1                      ; 55B1   02B9 0019
        MVO     R1,     G_0112                  ; 55B3   0241 0112
        CLRR    R0                              ; 55B5   01C0
        DECR    R0                              ; 55B6   0010
        CLRR    R2                              ; 55B7   01D2
        INCR    R2                              ; 55B8   000A
        MVII    #$000C, R3                      ; 55B9   02BB 000C
        MVII    #$00B7, R5                      ; 55BB   02BD 00B7
        MVII    #$0005, R4                      ; 55BD   02BC 0005
        MVO     R4,     G_0137                  ; 55BF   0244 0137
        MVO     R5,     G_0130                  ; 55C1   0245 0130
        MVII    #$033B, R5                      ; 55C3   02BD 033B
        MVO@    R0,     R5                      ; 55C5   0268
        MVO@    R2,     R5                      ; 55C6   026A
        MVO@    R3,     R5                      ; 55C7   026B
        MVI     G_012D, R2                      ; 55C8   0282 012D
        MVO@    R4,     R5                      ; 55CA   026C
        ANDI    #$000E, R2                      ; 55CB   03BA 000E
        DECR    R2                              ; 55CD   0012
        MVO@    R0,     R5                      ; 55CE   0268
        MVO@    R2,     R5                      ; 55CF   026A
        MVII    #$000D, R2                      ; 55D0   02BA 000D
        MVO@    R2,     R5                      ; 55D2   026A
        MVII    #$0007, R1                      ; 55D3   02B9 0007
        MVO@    R1,     R5                      ; 55D5   0269
        MVO     R1,     G_0138                  ; 55D6   0241 0138
        MVII    #$0044, R2                      ; 55D8   02BA 0044
        MVO     R2,     G_0131                  ; 55DA   0242 0131
        MVII    #$000B, R2                      ; 55DC   02BA 000B
        MVII    #$0004, R4                      ; 55DE   02BC 0004
        MVII    #$0347, R5                      ; 55E0   02BD 0347
        MVI     G_012C, R3                      ; 55E2   0283 012C
        ANDR    R4,     R3                      ; 55E4   01A3
        SLR     R3,     1                       ; 55E5   0063
        INCR    R3                              ; 55E6   000B
        MVO@    R3,     R5                      ; 55E7   026B
        MVO@    R0,     R5                      ; 55E8   0268
        MVO@    R1,     R5                      ; 55E9   0269
        MVI     G_012D, R3                      ; 55EA   0283 012D
        MVO@    R2,     R5                      ; 55EC   026A
        INCR    R5                              ; 55ED   000D
        MVO@    R3,     R5                      ; 55EE   026B
        MVII    #$0009, R2                      ; 55EF   02BA 0009
        MVO@    R2,     R5                      ; 55F1   026A
        MVI     G_018C, R2                      ; 55F2   0282 018C
        CMPI    #$0003, R2                      ; 55F4   037A 0003
        BNC     L_55F9                          ; 55F6   0209 0001

        MOVR    R3,     R2                      ; 55F8   009A
L_55F9:
        CMPI    #$0007, R2                      ; 55F9   037A 0007
        BNEQ    L_55FE                          ; 55FB   020C 0001

        INCR    R2                              ; 55FD   000A
L_55FE:
        ANDI    #$000C, R2                      ; 55FE   03BA 000C
        SLR     R2,     1                       ; 5600   0062
        MVO@    R4,     R5                      ; 5601   026C
        NOP                                     ; 5602   0034
        MVO@    R0,     R5                      ; 5603   0268
        MVO@    R2,     R5                      ; 5604   026A
        MVII    #$000C, R2                      ; 5605   02BA 000C
        MVO@    R2,     R5                      ; 5607   026A
        MVII    #$0008, R2                      ; 5608   02BA 0008
        MVO@    R2,     R5                      ; 560A   026A
        MOVR    R3,     R2                      ; 560B   009A
        MVI     G_012C, R3                      ; 560C   0283 012C
        CMPI    #$0005, R3                      ; 560E   037B 0005
        BNEQ    L_5625                          ; 5610   020C 0013

        MVII    #$0002, R3                      ; 5612   02BB 0002
        MVO@    R3,     R5                      ; 5614   026B
        INCR    R3                              ; 5615   000B
        MVO@    R2,     R5                      ; 5616   026A
        MVII    #$0009, R2                      ; 5617   02BA 0009
        MVO@    R2,     R5                      ; 5619   026A
        MVO@    R4,     R5                      ; 561A   026C
        MVII    #$0343, R5                      ; 561B   02BD 0343
        MVO@    R3,     R5                      ; 561D   026B
        MVO@    R0,     R5                      ; 561E   0268
        INCR    R5                              ; 561F   000D
        MVII    #$000B, R2                      ; 5620   02BA 000B
        MVO@    R2,     R5                      ; 5622   026A
        B       L_563E                          ; 5623   0200 0019

L_5625:
        MVO@    R3,     R5                      ; 5625   026B
        SUBI    #$0002, R2                      ; 5626   033A 0002
        ANDR    R4,     R2                      ; 5628   01A2
        SLR     R2,     1                       ; 5629   0062
        INCR    R2                              ; 562A   000A
        MVO@    R2,     R5                      ; 562B   026A
        MVO@    R4,     R5                      ; 562C   026C
        MVII    #$0006, R2                      ; 562D   02BA 0006
        MVO@    R2,     R5                      ; 562F   026A
        MVII    #$0343, R5                      ; 5630   02BD 0343
        MVI     G_0119, R0                      ; 5632   0280 0119
        INCR    R0                              ; 5634   0008
        MVO@    R0,     R5                      ; 5635   0268
        MVI     G_011A, R0                      ; 5636   0280 011A
        INCR    R0                              ; 5638   0008
        MVO@    R0,     R5                      ; 5639   0268
        MVII    #$0002, R0                      ; 563A   02B8 0002
        MVO@    R0,     R5                      ; 563C   0268
        MVO@    R1,     R5                      ; 563D   0269
L_563E:
        CLRR    R0                              ; 563E   01C0
        MVI     G_018F, R1                      ; 563F   0281 018F
        TSTR    R1                              ; 5641   0089
        BEQ     L_564B                          ; 5642   0204 0007

        MVO     R0,     G_018F                  ; 5644   0240 018F
        MVI     G_018B, R1                      ; 5646   0281 018B
        DECR    R1                              ; 5648   0011
        MVO     R1,     G_018B                  ; 5649   0241 018B
L_564B:
        CLRR    R1                              ; 564B   01C9
        MVII    #$0005, R4                      ; 564C   02BC 0005
        MVI     G_012D, R3                      ; 564E   0283 012D
        SLR     R3,     2                       ; 5650   0067
        BNEQ    L_5655                          ; 5651   020C 0002

        MVII    #$0020, R1                      ; 5653   02B9 0020
L_5655:
        MVI     G_0190, R3                      ; 5655   0283 0190
        MVO     R0,     G_0190                  ; 5657   0240 0190
        TSTR    R3                              ; 5659   009B
        BNEQ    L_5660                          ; 565A   020C 0004

        MVI     G_018E, R1                      ; 565C   0281 018E
        MVI     G_018D, R4                      ; 565E   0284 018D
L_5660:
        MVII    #$031E, R3                      ; 5660   02BB 031E
        MVII    #$0316, R2                      ; 5662   02BA 0316
        SDBD                                    ; 5664   0001
        MVII    #$0951, R5                      ; 5665   02BD 0051 0009
L_5668:
        CMPI    #$031A, R3                      ; 5668   037B 031A
        BGT     L_5681                          ; 566A   020E 0015
        BLT     L_567D                          ; 566C   0205 000F

        MVI     G_012C, R0                      ; 566E   0280 012C
        CMPI    #$0005, R0                      ; 5670   0378 0005
        BNC     L_5681                          ; 5672   0209 000D

        CMPI    #$0005, R4                      ; 5674   037C 0005
        BNEQ    L_5679                          ; 5676   020C 0001

        DECR    R4                              ; 5678   0014
L_5679:
        MVII    #$00C5, R0                      ; 5679   02B8 00C5
        MVO     R0,     G_0132                  ; 567B   0240 0132
L_567D:
        SDBD                                    ; 567D   0001
        MVII    #$0910, R5                      ; 567E   02BD 0010 0009
L_5681:
        RRC     R1,     1                       ; 5681   0071
        BC      L_5685                          ; 5682   0201 0001

        MVO@    R5,     R3                      ; 5684   025D
L_5685:
        DECR    R2                              ; 5685   0012
        DECR    R3                              ; 5686   0013
        CMPI    #$0319, R3                      ; 5687   037B 0319
        BC      L_5668                          ; 5689   0221 0022

        MVO     R4,     G_018D                  ; 568B   0244 018D
        MVO@    R5,     R3                      ; 568D   025D
        MVI     G_012D, R1                      ; 568E   0281 012D
        SLR     R1,     2                       ; 5690   0065
        BEQ     L_56A1                          ; 5691   0204 000E

        MVI     G_035B, R1                      ; 5693   0281 035B
        SLR     R1,     2                       ; 5695   0065
        ANDI    #$0003, R1                      ; 5696   03B9 0003
        ADDI    #$031B, R1                      ; 5698   02F9 031B
        MVI@    R1,     R0                      ; 569A   0288
        TSTR    R0                              ; 569B   0080
        BEQ     L_56A1                          ; 569C   0204 0003

        ADDI    #$0011, R0                      ; 569E   02F8 0011
        MVO@    R0,     R1                      ; 56A0   0248
L_56A1:
        MVII    #$0006, R3                      ; 56A1   02BB 0006

        JSR     R4,     L_5F87                  ; 56A3   0004 005C 0387

L_56A6:
        MVII    #$01FE, R5                      ; 56A6   02BD 01FE
        MVII    #$0189, R2                      ; 56A8   02BA 0189
L_56AA:
        MVI@    R5,     R1                      ; 56AA   02A9
        MVI@    R2,     R0                      ; 56AB   0290
        TSTR    R0                              ; 56AC   0080
        BNEQ    L_56B6                          ; 56AD   020C 0007

        CMPI    #$00FF, R1                      ; 56AF   0379 00FF
        BNEQ    L_56CE                          ; 56B1   020C 001B

        INCR    R0                              ; 56B3   0008
        B       L_56CD                          ; 56B4   0200 0017

L_56B6:
        DECR    R0                              ; 56B6   0010
        BNEQ    L_56BB                          ; 56B7   020C 0002

        XORI    #$0088, R1                      ; 56B9   03F9 0088
L_56BB:
        CMPI    #$00FF, R1                      ; 56BB   0379 00FF
        BNEQ    L_56C6                          ; 56BD   020C 0007

        DECR    R0                              ; 56BF   0010
        BMI     L_56CD                          ; 56C0   020B 000B

        MVII    #$010A, R5                      ; 56C2   02BD 010A
        B       L_538F                          ; 56C4   0220 0336

L_56C6:
        ANDI    #$0077, R1                      ; 56C6   03B9 0077
        CMPI    #$0077, R1                      ; 56C8   0379 0077
        BEQ     L_56CE                          ; 56CA   0204 0002

        CLRR    R0                              ; 56CC   01C0
L_56CD:
        MVO@    R0,     R2                      ; 56CD   0250
L_56CE:
        INCR    R2                              ; 56CE   000A
        CMPI    #$018A, R2                      ; 56CF   037A 018A
        BEQ     L_56AA                          ; 56D1   0224 0028

        MVI     G_0357, R0                      ; 56D3   0280 0357
        TSTR    R0                              ; 56D5   0080
        BPL     L_56E8                          ; 56D6   0203 0010

        MVI     G_0359, R0                      ; 56D8   0280 0359
        ANDI    #$007F, R0                      ; 56DA   03B8 007F
        BNEQ    L_56E5                          ; 56DC   020C 0007

        JSR     R4,     L_5F4D                  ; 56DE   0004 005C 034D
        JSR     R4,     L_5DD5                  ; 56E1   0004 005C 01D5
        DECLE   $00FE                           ; 56E4   00FE
L_56E5:
        J       L_5BC6                          ; 56E5   0004 0358 03C6

L_56E8:
        MVI     G_0357, R3                      ; 56E8   0283 0357
        MVI     G_012B, R0                      ; 56EA   0280 012B
        TSTR    R0                              ; 56EC   0080
        BEQ     L_5723                          ; 56ED   0204 0034

        MVI     G_0129, R0                      ; 56EF   0280 0129
        TSTR    R0                              ; 56F1   0080
        BEQ     L_56FD                          ; 56F2   0204 0009

        MVI     G_0114, R1                      ; 56F4   0281 0114
        TSTR    R1                              ; 56F6   0089
        BNEQ    L_56FD                          ; 56F7   020C 0004

        CMPI    #$0002, R3                      ; 56F9   037B 0002
        BNEQ    L_581F                          ; 56FB   020C 0122

L_56FD:
        CLRR    R0                              ; 56FD   01C0
        MVO     R0,     G_012B                  ; 56FE   0240 012B
        MVO     R0,     G_0129                  ; 5700   0240 0129
        MVI     G_0326, R5                      ; 5702   0285 0326
        MVO@    R0,     R5                      ; 5704   0268
        MVO@    R0,     R5                      ; 5705   0268
        ADDI    #$0012, R5                      ; 5706   02FD 0012
        MVO@    R0,     R5                      ; 5708   0268
        MVO@    R0,     R5                      ; 5709   0268
        MVI     G_0325, R5                      ; 570A   0285 0325
        MVII    #$0327, R4                      ; 570C   02BC 0327
        INCR    R0                              ; 570E   0008
        MVI@    R4,     R1                      ; 570F   02A1
        XORR    R0,     R1                      ; 5710   01C1
        MVO@    R1,     R5                      ; 5711   0269
        MVI@    R4,     R1                      ; 5712   02A1
        XORR    R0,     R1                      ; 5713   01C1
        MVO@    R1,     R5                      ; 5714   0269
        ADDI    #$0012, R5                      ; 5715   02FD 0012
        MVI@    R4,     R1                      ; 5717   02A1
        XORR    R0,     R1                      ; 5718   01C1
        MVO@    R1,     R5                      ; 5719   0269
        MVI@    R4,     R1                      ; 571A   02A1
        XORR    R0,     R1                      ; 571B   01C1
        MVO@    R1,     R5                      ; 571C   0269
        TSTR    R3                              ; 571D   009B
        BNEQ    L_5723                          ; 571E   020C 0003

        SLL     R0,     2                       ; 5720   004C
        MVO     R0,     .PSG0.envelope          ; 5721   0240 01FA
L_5723:
        MVI     G_0129, R0                      ; 5723   0280 0129
        TSTR    R0                              ; 5725   0080
        BEQ     L_581F                          ; 5726   0204 00F7

        TSTR    R3                              ; 5728   009B
        BEQ     L_5731                          ; 5729   0204 0006

        MVO     R3,     G_012B                  ; 572B   0243 012B
        CMPI    #$0010, R0                      ; 572D   0378 0010
        BNEQ    L_581F                          ; 572F   020C 00EE

L_5731:
        MVO     R0,     G_012A                  ; 5731   0240 012A
        CMPI    #$0010, R0                      ; 5733   0378 0010
        BNEQ    L_5753                          ; 5735   020C 001C

        MVI     G_0327, R0                      ; 5737   0280 0327
        ANDI    #$0007, R0                      ; 5739   03B8 0007
        SDBD                                    ; 573B   0001
        ADDI    #$0980, R0                      ; 573C   02F8 0080 0009
        MVII    #$0008, R1                      ; 573F   02B9 0008
        MVII    #$0326, R3                      ; 5741   02BB 0326
L_5743:
        MVI@    R3,     R5                      ; 5743   029D
        MVO@    R0,     R5                      ; 5744   0268
        ADDR    R1,     R0                      ; 5745   00C8
        MVO@    R0,     R5                      ; 5746   0268
        ADDI    #$0012, R5                      ; 5747   02FD 0012
        ADDR    R1,     R0                      ; 5749   00C8
        MVO@    R0,     R5                      ; 574A   0268
        ADDR    R1,     R0                      ; 574B   00C8
        MVO@    R0,     R5                      ; 574C   0268
        ADDR    R1,     R0                      ; 574D   00C8
        DECR    R3                              ; 574E   0013
        CMPI    #$0325, R3                      ; 574F   037B 0325
        BC      L_5743                          ; 5751   0221 000F

L_5753:
        MVI     G_0324, R2                      ; 5753   0282 0324
        MVI     G_0323, R4                      ; 5755   0284 0323
        MVII    #$0334, R3                      ; 5757   02BB 0334
        MVI@    R3,     R1                      ; 5759   0299
        ADDR    R2,     R1                      ; 575A   00D1
        MVO@    R1,     R3                      ; 575B   0259
        INCR    R3                              ; 575C   000B
        MVI@    R3,     R1                      ; 575D   0299
        ADDR    R4,     R1                      ; 575E   00E1
        MVO@    R1,     R3                      ; 575F   0259
        MVI     G_030F, R1                      ; 5760   0281 030F
        ADDR    R4,     R1                      ; 5762   00E1
        MVO     R1,     G_030F                  ; 5763   0241 030F
        MVI     G_0317, R1                      ; 5765   0281 0317
        ADDR    R2,     R1                      ; 5767   00D1
        MVO     R1,     G_0317                  ; 5768   0241 0317
        MVII    #$0002, R0                      ; 576A   02B8 0002
        SDBD                                    ; 576C   0001
        MVII    #$531E, R5                      ; 576D   02BD 001E 0053
        TSTR    R2                              ; 5770   0092
        BEQ     L_5792                          ; 5771   0204 001F
        BPL     L_5777                          ; 5773   0203 0002

        ADDI    #$0008, R5                      ; 5775   02FD 0008
L_5777:
        PSHR    R0                              ; 5777   0270
        CLRR    R4                              ; 5778   01E4
        MVII    #$0004, R0                      ; 5779   02B8 0004
L_577B:
        PSHR    R0                              ; 577B   0270
        MVI@    R5,     R3                      ; 577C   02AB
        MVII    #$0004, R0                      ; 577D   02B8 0004
L_577F:
        MVI@    R3,     R1                      ; 577F   0299
        MVO@    R4,     R3                      ; 5780   025C
        ADDR    R2,     R3                      ; 5781   00D3
        MVI@    R3,     R4                      ; 5782   029C
        MVO@    R1,     R3                      ; 5783   0259
        ADDR    R2,     R3                      ; 5784   00D3
        DECR    R0                              ; 5785   0010
        BNEQ    L_577F                          ; 5786   022C 0008

        PULR    R0                              ; 5788   02B0
        DECR    R0                              ; 5789   0010
        BNEQ    L_577B                          ; 578A   022C 0010

        PULR    R0                              ; 578C   02B0
        DECR    R0                              ; 578D   0010
        BNEQ    L_5777                          ; 578E   022C 0018
        B       L_57E7                          ; 5790   0200 0055

L_5792:
        ADDI    #$0010, R5                      ; 5792   02FD 0010
        TSTR    R4                              ; 5794   00A4
        BPL     L_5799                          ; 5795   0203 0002

        ADDI    #$0008, R5                      ; 5797   02FD 0008
L_5799:
        PSHR    R0                              ; 5799   0270
        MVI@    R5,     R0                      ; 579A   02A8
        MVI@    R5,     R1                      ; 579B   02A9
        MVI@    R5,     R2                      ; 579C   02AA
        MVI@    R5,     R3                      ; 579D   02AB
        PSHR    R5                              ; 579E   0275
        MOVR    R0,     R5                      ; 579F   0085
        MVII    #$0008, R4                      ; 57A0   02BC 0008
        MVI     G_0323, R0                      ; 57A2   0280 0323
        TSTR    R0                              ; 57A4   0080
        BMI     L_57C9                          ; 57A5   020B 0022

L_57A7:
        CLRC                                    ; 57A7   0006
        MVI@    R5,     R0                      ; 57A8   02A8
        RRC     R0,     1                       ; 57A9   0070
        DECR    R5                              ; 57AA   0015
        MVO@    R0,     R5                      ; 57AB   0268
        MVI@    R1,     R0                      ; 57AC   0288
        BNC     L_57B1                          ; 57AD   0209 0002

        ADDI    #$0100, R0                      ; 57AF   02F8 0100
L_57B1:
        RRC     R0,     1                       ; 57B1   0070
        MVO@    R0,     R1                      ; 57B2   0248
        MVI@    R2,     R0                      ; 57B3   0290
        BNC     L_57B8                          ; 57B4   0209 0002

        ADDI    #$0100, R0                      ; 57B6   02F8 0100
L_57B8:
        RRC     R0,     1                       ; 57B8   0070
        MVO@    R0,     R2                      ; 57B9   0250
        MVI@    R3,     R0                      ; 57BA   0298
        BNC     L_57BF                          ; 57BB   0209 0002

        ADDI    #$0100, R0                      ; 57BD   02F8 0100
L_57BF:
        RRC     R0,     1                       ; 57BF   0070
        MVO@    R0,     R3                      ; 57C0   0258
        INCR    R1                              ; 57C1   0009
        INCR    R2                              ; 57C2   000A
        INCR    R3                              ; 57C3   000B
        DECR    R4                              ; 57C4   0014
        BNEQ    L_57A7                          ; 57C5   022C 001F
        B       L_57E2                          ; 57C7   0200 0019

L_57C9:
        MVI@    R5,     R0                      ; 57C9   02A8
        SLL     R0,     1                       ; 57CA   0048
        DECR    R5                              ; 57CB   0015
        MVO@    R0,     R5                      ; 57CC   0268
        CMPI    #$0100, R0                      ; 57CD   0378 0100
        MVI@    R1,     R0                      ; 57CF   0288
        RLC     R0,     1                       ; 57D0   0050
        MVO@    R0,     R1                      ; 57D1   0248
        CMPI    #$0100, R0                      ; 57D2   0378 0100
        MVI@    R2,     R0                      ; 57D4   0290
        RLC     R0,     1                       ; 57D5   0050
        MVO@    R0,     R2                      ; 57D6   0250
        CMPI    #$0100, R0                      ; 57D7   0378 0100
        MVI@    R3,     R0                      ; 57D9   0298
        RLC     R0,     1                       ; 57DA   0050
        MVO@    R0,     R3                      ; 57DB   0258
        INCR    R1                              ; 57DC   0009
        INCR    R2                              ; 57DD   000A
        INCR    R3                              ; 57DE   000B
        DECR    R4                              ; 57DF   0014
        BNEQ    L_57C9                          ; 57E0   022C 0018

L_57E2:
        PULR    R5                              ; 57E2   02B5
        PULR    R0                              ; 57E3   02B0
        DECR    R0                              ; 57E4   0010
        BNEQ    L_5799                          ; 57E5   022C 004D

L_57E7:
        MVI     G_0129, R0                      ; 57E7   0280 0129
        DECR    R0                              ; 57E9   0010
        BNEQ    L_581D                          ; 57EA   020C 0031

        MVO     R0,     G_030F                  ; 57EC   0240 030F
        MVO     R0,     G_0334                  ; 57EE   0240 0334
        MVO     R0,     G_0335                  ; 57F0   0240 0335
        MVI     G_011B, R1                      ; 57F2   0281 011B
        MVI     G_011C, R2                      ; 57F4   0282 011C
        MVII    #$0002, R3                      ; 57F6   02BB 0002
        MVO     R3,     G_012B                  ; 57F8   0243 012B
        MVII    #$0343, R5                      ; 57FA   02BD 0343
L_57FC:
        MVO     R3,     G_012E                  ; 57FC   0243 012E

        JSR     R4,     L_5EB4                  ; 57FE   0004 005C 02B4

        BNEQ    L_5807                          ; 5801   020C 0004

        MVO@    R1,     R5                      ; 5803   0269
        MVO@    R2,     R5                      ; 5804   026A
        SUBI    #$0002, R5                      ; 5805   033D 0002
L_5807:
        SUBI    #$0004, R5                      ; 5807   033D 0004
        DECR    R3                              ; 5809   0013
        BPL     L_57FC                          ; 580A   0223 000F

        JSR     R4,     L_5E38                  ; 580C   0004 005C 0238

        PSHR    R3                              ; 580F   0273
        MVI     G_0119, R1                      ; 5810   0281 0119
        MVI     G_011A, R2                      ; 5812   0282 011A

        JSR     R4,     L_5E38                  ; 5814   0004 005C 0238

        PULR    R2                              ; 5817   02B2
        MVI@    R2,     R0                      ; 5818   0290
        MVI@    R3,     R1                      ; 5819   0299
        MVO@    R1,     R2                      ; 581A   0251
        MVO@    R0,     R3                      ; 581B   0258
        CLRR    R0                              ; 581C   01C0
L_581D:
        MVO     R0,     G_0129                  ; 581D   0240 0129
L_581F:
        MVI     G_0357, R0                      ; 581F   0280 0357
        TSTR    R0                              ; 5821   0080
        BEQ     L_58A4                          ; 5822   0204 0080

        DECR    R0                              ; 5824   0010
        BEQ     L_5893                          ; 5825   0204 006C

        MVI     G_033A, R1                      ; 5827   0281 033A
        ADD     G_0114, R1                      ; 5829   02C1 0114
        BNEQ    L_56E5                          ; 582B   022C 0147

        MVO     R0,     G_0357                  ; 582D   0240 0357
        DECR    R0                              ; 582F   0010
        BNEQ    L_56E5                          ; 5830   022C 014C

        MVI     G_0190, R1                      ; 5832   0281 0190
        TSTR    R1                              ; 5834   0089
        BEQ     L_583E                          ; 5835   0204 0007

        MVI     G_018F, R3                      ; 5837   0283 018F
        TSTR    R3                              ; 5839   009B
        BNEQ    L_5843                          ; 583A   020C 0007
        B       L_585E                          ; 583C   0200 0020

L_583E:
        MVI     G_018D, R2                      ; 583E   0282 018D
        TSTR    R2                              ; 5840   0092
        BEQ     L_5904                          ; 5841   0204 00C1

L_5843:
        MVII    #$0319, R5                      ; 5843   02BD 0319
L_5845:
        CMP@    R5,     R0                      ; 5845   0368
        RLC     R1,     1                       ; 5846   0051
        CMPI    #$031F, R5                      ; 5847   037D 031F
        BNC     L_5845                          ; 5849   0229 0005

        MVO     R1,     G_018E                  ; 584B   0241 018E
        MVI     G_0198, R0                      ; 584D   0280 0198
        TSTR    R0                              ; 584F   0080
        BEQ     L_5855                          ; 5850   0204 0003

        JSR     R4,     L_5F4D                  ; 5852   0004 005C 034D

L_5855:
        MVI     G_035B, R0                      ; 5855   0280 035B
        MVO     R0,     G_035A                  ; 5857   0240 035A
        MVI     G_018B, R0                      ; 5859   0280 018B
        DECR    R0                              ; 585B   0010
        BMI     L_5861                          ; 585C   020B 0003
L_585E:
        J       L_5439                          ; 585E   0004 0354 0039

L_5861:
        MVO     R0,     G_0357                  ; 5861   0240 0357

        JSR     R4,     L_5F6E                  ; 5863   0004 005C 036E
        DECLE   $0191                           ; 5866   0191

        JSR     R4,     L_5F6E                  ; 5867   0004 005C 036E
        DECLE   $019E                           ; 586A   019E

        JSR     R4,     L_5DC0                  ; 586B   0004 005C 01C0
        JSR     R4,     L_5DFA                  ; 586E   0004 005C 01FA
        DECLE   $00EB,  $000B,  $02A3           ; 5871   00EB 000B 02A3

        MVI     G_0102, R1                      ; 5874   0281 0102
        SLL     R1,     2                       ; 5876   004D
        SLL     R1,     1                       ; 5877   0049
        SDBD                                    ; 5878   0001
        ADDI    #$168E, R1                      ; 5879   02F9 008E 0016
        MVO     R1,     .BTAB.AF                ; 587C   0241 02AF

        JSR     R4,     L_5DD5                  ; 587E   0004 005C 01D5
        DECLE   $00FE                           ; 5881   00FE

        MVII    #$0103, R4                      ; 5882   02BC 0103
        MVII    #$010A, R5                      ; 5884   02BD 010A
L_5886:
        MVI@    R4,     R0                      ; 5886   02A0
        MVO@    R0,     R5                      ; 5887   0268
        CMPI    #$010A, R4                      ; 5888   037C 010A
        BNC     L_5886                          ; 588A   0229 0005

        JSR     R4,     L_5DCD                  ; 588C   0004 005C 01CD
        DECLE   $0310,  $0320                   ; 588F   0310 0320

        B       L_56E5                          ; 5891   0220 01AD

L_5893:
        MVI     G_018D, R0                      ; 5893   0280 018D
        TSTR    R0                              ; 5895   0080
        BEQ     L_58A1                          ; 5896   0204 0009

        MVII    #$0185, R1                      ; 5898   02B9 0185
        SUB     G_0188, R1                      ; 589A   0301 0188
        MVI@    R1,     R0                      ; 589C   0288
        CMPI    #$00FF, R0                      ; 589D   0378 00FF
        BEQ     L_56E5                          ; 589F   0224 01BB

L_58A1:
        CLRR    R0                              ; 58A1   01C0
        MVO     R0,     G_0357                  ; 58A2   0240 0357
L_58A4:
        MVI     G_018D, R2                      ; 58A4   0282 018D
        MVI     G_033A, R5                      ; 58A6   0285 033A
        MVI     G_0320, R3                      ; 58A8   0283 0320
        SLL     R3,     2                       ; 58AA   004F
        SLL     R3,     2                       ; 58AB   004F
        SLL     R3,     2                       ; 58AC   004F
        MVII    #$031E, R1                      ; 58AD   02B9 031E
        SLL     R3,     2                       ; 58AF   004F
        SLL     R3,     1                       ; 58B0   004B
        BEQ     L_58FE                          ; 58B1   0204 004B

L_58B3:
        RLC     R3,     1                       ; 58B3   0053
        BNC     L_58F5                          ; 58B4   0209 003F

        MVI@    R1,     R0                      ; 58B6   0288
        TSTR    R0                              ; 58B7   0080
        BEQ     L_58F5                          ; 58B8   0204 003B

        ADD     G_0112, R5                      ; 58BA   02C5 0112
        CLRR    R4                              ; 58BC   01E4
        MVO@    R4,     R1                      ; 58BD   024C
        SUBI    #$0008, R1                      ; 58BE   0339 0008
        MVO@    R4,     R1                      ; 58C0   024C
        ADDI    #$0008, R1                      ; 58C1   02F9 0008
        ANDI    #$0007, R0                      ; 58C3   03B8 0007
        BNEQ    L_58E2                          ; 58C5   020C 001B

        MVI     G_0112, R0                      ; 58C7   0280 0112
        SLL     R0,     1                       ; 58C9   0048
        MVO     R0,     G_0112                  ; 58CA   0240 0112
        ADDR    R0,     R5                      ; 58CC   00C5
        MVI     .BTAB.EA,R0                     ; 58CD   0280 02EA
        ANDI    #$0038, R0                      ; 58CF   03B8 0038
        SLL     R0,     1                       ; 58D1   0048
        SDBD                                    ; 58D2   0001
        ADDI    #$1680, R0                      ; 58D3   02F8 0080 0016
        MVO     R0,     .BTAB.EA                ; 58D6   0240 02EA
        MVI     G_0339, R4                      ; 58D8   0284 0339
        TSTR    R4                              ; 58DA   00A4
        BNEQ    L_58F5                          ; 58DB   020C 0018

        JSR     R4,     L_5F42                  ; 58DD   0004 005C 0342

        B       L_58F5                          ; 58E0   0200 0013

L_58E2:
        DECR    R0                              ; 58E2   0010
        BEQ     L_58F4                          ; 58E3   0204 000F

        MVII    #$0258, R4                      ; 58E5   02BC 0258
        MVI     G_018C, R0                      ; 58E7   0280 018C
        SLL     R0,     2                       ; 58E9   004C
        SLL     R0,     1                       ; 58EA   0048
        CMPI    #$01E0, R0                      ; 58EB   0378 01E0
        BNC     L_58F1                          ; 58ED   0209 0002

        MVII    #$01E0, R0                      ; 58EF   02B8 01E0
L_58F1:
        SUBR    R0,     R4                      ; 58F1   0104
        MVO     R4,     G_0339                  ; 58F2   0244 0339
L_58F4:
        DECR    R2                              ; 58F4   0012
L_58F5:
        DECR    R1                              ; 58F5   0011
        CMPI    #$0319, R1                      ; 58F6   0379 0319
        BC      L_58B3                          ; 58F8   0221 0046

        MVO     R2,     G_018D                  ; 58FA   0242 018D
        MVO     R5,     G_033A                  ; 58FC   0245 033A
L_58FE:
        TSTR    R2                              ; 58FE   0092
        BNEQ    L_595F                          ; 58FF   020C 005E

        TSTR    R5                              ; 5901   00AD
        BNEQ    L_56E5                          ; 5902   022C 021E

L_5904:
        MVI     G_035A, R0                      ; 5904   0280 035A
        MVO     R0,     G_035B                  ; 5906   0240 035B

        JSR     R4,     L_5DB6                  ; 5908   0004 005C 01B6

        MVII    #$0008, R1                      ; 590B   02B9 0008
        MVO     R1,     G_0115                  ; 590D   0241 0115
        MVII    #$0006, R1                      ; 590F   02B9 0006
        MVO     R1,     G_032B                  ; 5911   0241 032B
        MVO     R1,     G_0190                  ; 5913   0241 0190
        MVII    #$001B, R1                      ; 5915   02B9 001B
        MVO     R1,     G_0116                  ; 5917   0241 0116
        MVII    #$0278, R5                      ; 5919   02BD 0278

        JSR     R4,     L_5DC2                  ; 591B   0004 005C 01C2
        JSR     R4,     L_5DCD                  ; 591E   0004 005C 01CD
        DECLE   $02A5,  $02AF                   ; 5921   02A5 02AF

        JSR     R4,     L_5DD5                  ; 5923   0004 005C 01D5
        DECLE   $00F9                           ; 5926   00F9

        JSR     R4,     L_5DFA                  ; 5927   0004 005C 01FA
        DECLE   $00F9,  $0005,  $0291           ; 592A   00F9 0005 0291

        MVII    #$0277, R0                      ; 592D   02B8 0277
        MVII    #$0308, R5                      ; 592F   02BD 0308
L_5931:
        MVO@    R0,     R5                      ; 5931   0268
        SUBI    #$000A, R0                      ; 5932   0338 000A
        CMPI    #$0310, R5                      ; 5934   037D 0310
        BNC     L_5931                          ; 5936   0229 0006

        MVII    #$00C8, R0                      ; 5938   02B8 00C8
L_593A:
        MVO@    R0,     R5                      ; 593A   0268
        CMPI    #$0318, R5                      ; 593B   037D 0318
        BNC     L_593A                          ; 593D   0229 0004

        MVI     G_018C, R0                      ; 593F   0280 018C
        INCR    R0                              ; 5941   0008
        MVII    #$000C, R3                      ; 5942   02BB 000C
        CMPI    #$0011, R0                      ; 5944   0378 0011
        BNC     L_594A                          ; 5946   0209 0002

        MVII    #$0013, R3                      ; 5948   02BB 0013
L_594A:
        CMPI    #$0003, R0                      ; 594A   0378 0003
        BC      L_594F                          ; 594C   0201 0001

        CLRR    R3                              ; 594E   01DB
L_594F:
        MVO     R3,     G_0117                  ; 594F   0243 0117
        MVO     R0,     G_0114                  ; 5951   0240 0114
        CMPI    #$00FF, R0                      ; 5953   0378 00FF
        BEQ     L_5959                          ; 5955   0204 0002

        MVO     R0,     G_018C                  ; 5957   0240 018C
L_5959:
        MVII    #$003C, R0                      ; 5959   02B8 003C
        MVO     R0,     G_0357                  ; 595B   0240 0357
        B       L_56E5                          ; 595D   0220 0279

L_595F:
        MVII    #$0001, R0                      ; 595F   02B8 0001
        MVO     R0,     G_0123                  ; 5961   0240 0123
        MVI     G_0359, R0                      ; 5963   0280 0359
        ANDI    #$0007, R0                      ; 5965   03B8 0007
        BNEQ    L_5984                          ; 5967   020C 001B

        MVII    #$0110, R3                      ; 5969   02BB 0110
L_596B:
        MVI@    R3,     R0                      ; 596B   0298
        SUBI    #$0008, R0                      ; 596C   0338 0008
        BPL     L_5983                          ; 596E   0203 0013

        ADDI    #$0050, R0                      ; 5970   02F8 0050
        MVO@    R0,     R3                      ; 5972   0258
        DECR    R3                              ; 5973   0013
        CMPI    #$010E, R3                      ; 5974   037B 010E
        BC      L_596B                          ; 5976   0221 000C

        INCR    R3                              ; 5978   000B
        CLRR    R0                              ; 5979   01C0
        MOVR    R3,     R4                      ; 597A   009C
        MVO@    R0,     R4                      ; 597B   0260
        MVO@    R0,     R4                      ; 597C   0260
        MVO@    R0,     R4                      ; 597D   0260

        JSR     R4,     L_5F42                  ; 597E   0004 005C 0342

        B       L_56E5                          ; 5981   0220 029D

L_5983:
        MVO@    R0,     R3                      ; 5983   0258
L_5984:
        MVII    #$0185, R1                      ; 5984   02B9 0185
        SUB     G_0188, R1                      ; 5986   0301 0188
        MVI@    R1,     R0                      ; 5988   0288
        ANDI    #$001F, R0                      ; 5989   03B8 001F
        CLRR    R1                              ; 598B   01C9
        CMP     G_0124, R1                      ; 598C   0341 0124
        BEQ     L_5996                          ; 598E   0204 0006

        CMPI    #$001F, R0                      ; 5990   0378 001F
        BNEQ    L_5A35                          ; 5992   020C 00A1

        MVO     R1,     G_0124                  ; 5994   0241 0124
L_5996:
        MVI     G_012A, R3                      ; 5996   0283 012A
        TSTR    R3                              ; 5998   009B
        BEQ     L_599F                          ; 5999   0204 0004

        MVO     R1,     G_012A                  ; 599B   0241 012A
        B       L_5A35                          ; 599D   0200 0096

L_599F:
        MVI     G_0119, R3                      ; 599F   0283 0119
        MVI     G_011A, R4                      ; 59A1   0284 011A
        CLRR    R5                              ; 59A3   01ED
        ANDI    #$000F, R0                      ; 59A4   03B8 000F
        CMPI    #$0006, R0                      ; 59A6   0378 0006
        BEQ     L_59B4                          ; 59A8   0204 000A

        RRC     R0,     2                       ; 59AA   0074
        BNC     L_59C2                          ; 59AB   0209 0015
        BNOV    L_59BC                          ; 59AD   020A 000D

        RRC     R0,     2                       ; 59AF   0074
        BNC     L_59C8                          ; 59B0   0209 0016
        BOV     L_5A35                          ; 59B2   0202 0081

L_59B4:
        DECR    R1                              ; 59B4   0011
        INCR    R4                              ; 59B5   000C
        CMP     G_012D, R4                      ; 59B6   0344 012D
        BC      L_5A35                          ; 59B8   0201 007B
        B       L_59CE                          ; 59BA   0200 0012

L_59BC:
        INCR    R1                              ; 59BC   0009
        DECR    R4                              ; 59BD   0014
        BMI     L_5A35                          ; 59BE   020B 0075
        B       L_59CE                          ; 59C0   0200 000C

L_59C2:
        INCR    R5                              ; 59C2   000D
        DECR    R3                              ; 59C3   0013
        BMI     L_5A35                          ; 59C4   020B 006F
        B       L_59CE                          ; 59C6   0200 0006

L_59C8:
        DECR    R5                              ; 59C8   0015
        INCR    R3                              ; 59C9   000B
        CMP     G_012C, R3                      ; 59CA   0343 012C
        BC      L_5A35                          ; 59CC   0201 0067

L_59CE:
        MVO     R1,     G_0323                  ; 59CE   0241 0323
        MVO     R5,     G_0324                  ; 59D0   0245 0324
        MVI     G_0119, R1                      ; 59D2   0281 0119
        MVII    #$0119, R5                      ; 59D4   02BD 0119
        MVO@    R3,     R5                      ; 59D6   026B
        MVI     G_011A, R2                      ; 59D7   0282 011A
        MVO@    R4,     R5                      ; 59D9   026C
        MVO@    R1,     R5                      ; 59DA   0269
        MVO@    R2,     R5                      ; 59DB   026A

        JSR     R4,     L_5E2E                  ; 59DC   0004 005C 022E

        MVO     R5,     G_0325                  ; 59DF   0245 0325
        MOVR    R3,     R1                      ; 59E1   0099
        MVI     G_011A, R2                      ; 59E2   0282 011A

        JSR     R4,     L_5E2E                  ; 59E4   0004 005C 022E

        MVO     R5,     G_0326                  ; 59E7   0245 0326
        MVI@    R5,     R1                      ; 59E9   02A9
        SDBD                                    ; 59EA   0001
        MVII    #$3801, R3                      ; 59EB   02BB 0001 0038
        SDBD                                    ; 59EE   0001
        ANDI    #$F600, R1                      ; 59EF   03B9 0000 00F6
        SDBD                                    ; 59F2   0001
        CMPI    #$1200, R1                      ; 59F3   0379 0000 0012
        BEQ     L_59FF                          ; 59F6   0204 0007

        DECR    R3                              ; 59F8   0013
        BNC     L_59FF                          ; 59F9   0209 0004

        SDBD                                    ; 59FB   0001
        SUBI    #$0FFA, R3                      ; 59FC   033B 00FA 000F
L_59FF:
        MVO     R3,     G_031F                  ; 59FF   0243 031F
        SLL     R2,     1                       ; 5A01   004A
        ADDI    #$00CB, R2                      ; 5A02   02FA 00CB
        SUB     G_012D, R2                      ; 5A04   0302 012D
        SLL     R2,     2                       ; 5A06   004E
        SLL     R2,     1                       ; 5A07   004A
        MVO     R2,     G_030F                  ; 5A08   0242 030F
        ADDI    #$0210, R0                      ; 5A0A   02F8 0210
        MVI     G_012C, R4                      ; 5A0C   0284 012C
        CMPI    #$0004, R4                      ; 5A0E   037C 0004
        BC      L_5A14                          ; 5A10   0201 0002

        ADDI    #$0008, R0                      ; 5A12   02F8 0008
L_5A14:
        MVO     R0,     G_0317                  ; 5A14   0240 0317
        MVII    #$0010, R0                      ; 5A16   02B8 0010
        MVO     R0,     G_0129                  ; 5A18   0240 0129
        MVO     R0,     G_0124                  ; 5A1A   0240 0124
        MVII    #$0030, R2                      ; 5A1C   02BA 0030
        MVO     R2,     .PSG0.chn_c_vol         ; 5A1E   0242 01FD
        SLR     R0,     2                       ; 5A20   0064
        MVO     R0,     .PSG0.envelope          ; 5A21   0240 01FA
        MVI     G_0326, R2                      ; 5A23   0282 0326
        MVII    #$0327, R3                      ; 5A25   02BB 0327
        MVII    #$01A5, R5                      ; 5A27   02BD 01A5

        JSR     R4,     L_5E42                  ; 5A29   0004 005C 0242

        ADDI    #$0012, R2                      ; 5A2C   02FA 0012

        JSR     R4,     L_5E42                  ; 5A2E   0004 005C 0242
        JSR     R4,     L_5DCE                  ; 5A31   0004 005C 01CE
        DECLE   $01E5                           ; 5A34   01E5
L_5A35:
        MVII    #$01FF, R1                      ; 5A35   02B9 01FF
        SUB     G_0188, R1                      ; 5A37   0301 0188
        MVI@    R1,     R1                      ; 5A39   0289
        ANDI    #$00E0, R1                      ; 5A3A   03B9 00E0
        BEQ     L_5A49                          ; 5A3C   0204 000B

        CMPI    #$0080, R1                      ; 5A3E   0379 0080
        BEQ     L_5A49                          ; 5A40   0204 0007

        CMPI    #$0020, R1                      ; 5A42   0379 0020
        BEQ     L_5A49                          ; 5A44   0204 0003

        CLRR    R1                              ; 5A46   01C9
        MVO     R1,     G_011D                  ; 5A47   0241 011D
L_5A49:
        MVII    #$0002, R5                      ; 5A49   02BD 0002
L_5A4B:
        MVII    #$0318, R1                      ; 5A4B   02B9 0318
        ADDR    R5,     R1                      ; 5A4D   00E9
        MVI@    R1,     R0                      ; 5A4E   0288
        TSTR    R0                              ; 5A4F   0080
        BEQ     L_5BC3                          ; 5A50   0204 0171

        SUBI    #$01E8, R1                      ; 5A52   0339 01E8
        MVI@    R1,     R0                      ; 5A54   0288
        TSTR    R0                              ; 5A55   0080
        BEQ     L_5BC3                          ; 5A56   0204 016B

        MVO     R0,     G_012F                  ; 5A58   0240 012F
        MVI     G_018C, R0                      ; 5A5A   0280 018C
        MVII    #$0336, R3                      ; 5A5C   02BB 0336
        ADDR    R5,     R3                      ; 5A5E   00EB
        TSTR    R5                              ; 5A5F   00AD
        BEQ     L_5A74                          ; 5A60   0204 0012

        ADDI    #$0014, R0                      ; 5A62   02F8 0014
        MVI     G_012C, R1                      ; 5A64   0281 012C
        CMPI    #$0005, R1                      ; 5A66   0379 0005
        BNEQ    L_5A84                          ; 5A68   020C 001A

        MVI     G_0359, R1                      ; 5A6A   0281 0359
        ANDI    #$0001, R1                      ; 5A6C   03B9 0001
        INCR    R1                              ; 5A6E   0009
        CMPR    R1,     R5                      ; 5A6F   014D
        BEQ     L_5A98                          ; 5A70   0204 0026
        B       L_5BC3                          ; 5A72   0200 014F

L_5A74:
        ADDI    #$0010, R0                      ; 5A74   02F8 0010
        MVII    #$0185, R1                      ; 5A76   02B9 0185
        SUB     G_0188, R1                      ; 5A78   0301 0188
        MVI@    R1,     R1                      ; 5A7A   0289
        ANDI    #$00E0, R1                      ; 5A7B   03B9 00E0
        MVO     R1,     G_0332                  ; 5A7D   0241 0332
        CMPI    #$0040, R1                      ; 5A7F   0379 0040
        BNEQ    L_5A84                          ; 5A81   020C 0001

        SLL     R0,     2                       ; 5A83   004C
L_5A84:
        MVI     G_0102, R1                      ; 5A84   0281 0102
        SLR     R1,     2                       ; 5A86   0065
        BEQ     L_5A8A                          ; 5A87   0204 0001

        SLL     R0,     1                       ; 5A89   0048
L_5A8A:
        CMPI    #$0080, R0                      ; 5A8A   0378 0080
        BC      L_5A98                          ; 5A8C   0201 000A

        SLL     R0,     2                       ; 5A8E   004C
        SLL     R0,     2                       ; 5A8F   004C
        SLL     R0,     2                       ; 5A90   004C
        NOP                                     ; 5A91   0034
        SLL     R0,     2                       ; 5A92   004C
        SLL     R0,     1                       ; 5A93   0048
        ADD@    R3,     R0                      ; 5A94   02D8
        MVO@    R0,     R3                      ; 5A95   0258
        BNC     L_5BC3                          ; 5A96   0209 012B

L_5A98:
        MVO     R5,     G_012E                  ; 5A98   0245 012E
        MVII    #$0126, R3                      ; 5A9A   02BB 0126
        ADDR    R5,     R3                      ; 5A9C   00EB
        MVI@    R3,     R0                      ; 5A9D   0298
        DECR    R0                              ; 5A9E   0010
        BPL     L_5AA3                          ; 5A9F   0203 0002

        MVII    #$0003, R0                      ; 5AA1   02B8 0003
L_5AA3:
        MVO@    R0,     R3                      ; 5AA3   0258
        MOVR    R5,     R0                      ; 5AA4   00A8
        SLL     R0,     2                       ; 5AA5   004C
        ADDI    #$033B, R0                      ; 5AA6   02F8 033B
        MVO     R0,     G_0331                  ; 5AA8   0240 0331
        MVI     G_012F, R0                      ; 5AAA   0280 012F
        MVII    #$0010, R3                      ; 5AAC   02BB 0010
        ANDI    #$0007, R0                      ; 5AAE   03B8 0007
        CMPI    #$0002, R0                      ; 5AB0   0378 0002
        BC      L_5AB9                          ; 5AB2   0201 0005

        MOVR    R0,     R1                      ; 5AB4   0081
        XORI    #$0001, R1                      ; 5AB5   03F9 0001
        B       L_5AD3                          ; 5AB7   0200 001A

L_5AB9:
        MVII    #$000A, R3                      ; 5AB9   02BB 000A
        MOVR    R0,     R4                      ; 5ABB   0084
        SDBD                                    ; 5ABC   0001
        ADDI    #$50DD, R4                      ; 5ABD   02FC 00DD 0050
        MVII    #$0137, R2                      ; 5AC0   02BA 0137
        ADDR    R5,     R2                      ; 5AC2   00EA
        MVI@    R2,     R2                      ; 5AC3   0292
        SDBD                                    ; 5AC4   0001
        ADDI    #$50C6, R2                      ; 5AC5   02FA 00C6 0050
        PSHR    R2                              ; 5AC8   0272
        ADD@    R4,     R2                      ; 5AC9   02E2
        RRC     R0,     1                       ; 5ACA   0070
        MVI@    R2,     R0                      ; 5ACB   0290
        BNC     L_5AD0                          ; 5ACC   0209 0002

        SUBI    #$0002, R4                      ; 5ACE   033C 0002
L_5AD0:
        PULR    R2                              ; 5AD0   02B2
        ADD@    R4,     R2                      ; 5AD1   02E2
        MVI@    R2,     R1                      ; 5AD2   0291
L_5AD3:
        MVO     R3,     G_0333                  ; 5AD3   0243 0333
        MOVR    R5,     R4                      ; 5AD5   00AC
        ADD     G_011D, R4                      ; 5AD6   02C4 011D
        ADD     G_011F, R4                      ; 5AD8   02C4 011F
        BNEQ    L_5B15                          ; 5ADA   020C 0039

        ADD     G_0332, R4                      ; 5ADC   02C4 0332
        BEQ     L_5AE8                          ; 5ADE   0204 0008

        CMPI    #$0080, R4                      ; 5AE0   037C 0080
        BEQ     L_5AE8                          ; 5AE2   0204 0004

        CMPI    #$0020, R4                      ; 5AE4   037C 0020
        BNEQ    L_5B15                          ; 5AE6   020C 002D

L_5AE8:
        MVII    #$0014, R4                      ; 5AE8   02BC 0014
        MVO     R4,     G_011D                  ; 5AEA   0244 011D
        MVO     R4,     G_011F                  ; 5AEC   0244 011F
        MVO     R4,     G_011E                  ; 5AEE   0244 011E
        MVI     G_033B, R1                      ; 5AF0   0281 033B
        MVI     G_033C, R2                      ; 5AF2   0282 033C

        JSR     R4,     L_5E38                  ; 5AF4   0004 005C 0238

        MVI@    R3,     R3                      ; 5AF7   029B
        MVI     G_012F, R0                      ; 5AF8   0280 012F
        XORI    #$0040, R0                      ; 5AFA   03F8 0040
        SLR     R0,     2                       ; 5AFC   0064
        SLR     R0,     2                       ; 5AFD   0064
        SLR     R0,     2                       ; 5AFE   0064
        ADDR    R0,     R3                      ; 5AFF   00C3
        SDBD                                    ; 5B00   0001
        ADDI    #$52B3, R3                      ; 5B01   02FB 00B3 0052
        MVI@    R3,     R0                      ; 5B04   0298
        MVO     R0,     G_0130                  ; 5B05   0240 0130
        MVO     R0,     G_012F                  ; 5B07   0240 012F
        MVI     G_0137, R4                      ; 5B09   0284 0137
        TSTR    R4                              ; 5B0B   00A4
        BEQ     L_5B35                          ; 5B0C   0204 0027

        MVI     G_0333, R3                      ; 5B0E   0283 0333
        SUBR    R4,     R3                      ; 5B10   0123
        MVO     R3,     G_0137                  ; 5B11   0243 0137
        B       L_5BC1                          ; 5B13   0200 00AC

L_5B15:
        MVI     G_012F, R3                      ; 5B15   0283 012F
        ANDI    #$0030, R3                      ; 5B17   03BB 0030
        CMPI    #$0020, R3                      ; 5B19   037B 0020
        BNC     L_5B1E                          ; 5B1B   0209 0001

        NEGR    R0                              ; 5B1D   0020
L_5B1E:
        ANDI    #$0010, R3                      ; 5B1E   03BB 0010
        BEQ     L_5B23                          ; 5B20   0204 0001

        NEGR    R1                              ; 5B22   0021
L_5B23:
        MVI     G_0331, R3                      ; 5B23   0283 0331
        ADDI    #$0002, R3                      ; 5B25   02FB 0002
        ADD@    R3,     R0                      ; 5B27   02D8
        MVO@    R0,     R3                      ; 5B28   0258
        INCR    R3                              ; 5B29   000B
        ADD@    R3,     R1                      ; 5B2A   02D9
        MVO@    R1,     R3                      ; 5B2B   0259
        MVII    #$0137, R3                      ; 5B2C   02BB 0137
        ADDR    R5,     R3                      ; 5B2E   00EB
        MVI@    R3,     R4                      ; 5B2F   029C
        INCR    R4                              ; 5B30   000C
        CMP     G_0333, R4                      ; 5B31   0344 0333
        BLT     L_5BC0                          ; 5B33   0205 008B

L_5B35:
        MOVR    R5,     R4                      ; 5B35   00AC
        BNEQ    L_5B41                          ; 5B36   020C 0009

        MVO     R4,     G_011F                  ; 5B38   0244 011F
        MVI     G_0122, R0                      ; 5B3A   0280 0122
        MVO     R0,     G_0332                  ; 5B3C   0240 0332
        INCR    R4                              ; 5B3E   000C
        MVO     R4,     G_0122                  ; 5B3F   0244 0122

L_5B41:
        JSR     R4,     L_5EB4                  ; 5B41   0004 005C 02B4

        BEQ     L_5B97                          ; 5B44   0204 0051

        MVI     G_0331, R4                      ; 5B46   0284 0331
        MVI@    R4,     R1                      ; 5B48   02A1
        MVI@    R4,     R2                      ; 5B49   02A2
        MVI@    R4,     R3                      ; 5B4A   02A3
        MVI@    R4,     R0                      ; 5B4B   02A0
        MVI     G_012F, R5                      ; 5B4C   0285 012F
        ANDI    #$00C0, R5                      ; 5B4E   03BD 00C0
        BNEQ    L_5B57                          ; 5B50   020C 0005

        DECR    R1                              ; 5B52   0011
        MVII    #$0010, R3                      ; 5B53   02BB 0010
        B       L_5B68                          ; 5B55   0200 0011

L_5B57:
        CMPI    #$0080, R5                      ; 5B57   037D 0080
        BNEQ    L_5B60                          ; 5B59   020C 0005

        DECR    R2                              ; 5B5B   0012
        MVII    #$0010, R0                      ; 5B5C   02B8 0010
        B       L_5B68                          ; 5B5E   0200 0008
L_5B60:
        BC      L_5B66                          ; 5B60   0201 0004

        INCR    R1                              ; 5B62   0009
        CLRR    R3                              ; 5B63   01DB
        B       L_5B68                          ; 5B64   0200 0002

L_5B66:
        INCR    R2                              ; 5B66   000A
        CLRR    R0                              ; 5B67   01C0
L_5B68:
        CMP     G_0119, R1                      ; 5B68   0341 0119
        BNEQ    L_5B70                          ; 5B6A   020C 0004

        CMP     G_011A, R2                      ; 5B6C   0342 011A
        BEQ     L_5B97                          ; 5B6E   0204 0027

L_5B70:
        MVI     G_0129, R4                      ; 5B70   0284 0129
        TSTR    R4                              ; 5B72   00A4
        BEQ     L_5B7D                          ; 5B73   0204 0008

        CMP     G_011B, R1                      ; 5B75   0341 011B
        BNEQ    L_5B7D                          ; 5B77   020C 0004

        CMP     G_011C, R2                      ; 5B79   0342 011C
        BEQ     L_5B97                          ; 5B7B   0204 001A

L_5B7D:
        MOVR    R3,     R5                      ; 5B7D   009D

        JSR     R4,     L_5E38                  ; 5B7E   0004 005C 0238

        MVI@    R3,     R3                      ; 5B81   029B
        MOVR    R0,     R4                      ; 5B82   0084
        MVI     G_012F, R0                      ; 5B83   0280 012F
        SLR     R0,     2                       ; 5B85   0064
        SLR     R0,     2                       ; 5B86   0064
        SLR     R0,     2                       ; 5B87   0064
        ADDR    R0,     R3                      ; 5B88   00C3
        SDBD                                    ; 5B89   0001
        ADDI    #$52B3, R3                      ; 5B8A   02FB 00B3 0052
        MVI@    R3,     R0                      ; 5B8D   0298
        CMPI    #$0100, R0                      ; 5B8E   0378 0100
        BNC     L_5BB1                          ; 5B90   0209 001F

        MVI     G_0332, R4                      ; 5B92   0284 0332
        TSTR    R4                              ; 5B94   00A4
        BEQ     L_5B9A                          ; 5B95   0204 0003

L_5B97:
        JSR     R4,     L_5F3D                  ; 5B97   0004 005C 033D

L_5B9A:
        MVI     G_012E, R0                      ; 5B9A   0280 012E
        TSTR    R0                              ; 5B9C   0080
        BNEQ    L_5BA3                          ; 5B9D   020C 0004

        MVI     G_0332, R0                      ; 5B9F   0280 0332
        MVO     R0,     G_0122                  ; 5BA1   0240 0122
L_5BA3:
        MVI     G_012F, R0                      ; 5BA3   0280 012F
        XORI    #$0040, R0                      ; 5BA5   03F8 0040
        MVO     R0,     G_012F                  ; 5BA7   0240 012F
        MVI     G_0331, R4                      ; 5BA9   0284 0331
        MVI@    R4,     R1                      ; 5BAB   02A1
        MVI@    R4,     R2                      ; 5BAC   02A2
        MVI@    R4,     R3                      ; 5BAD   02A3
        MVI@    R4,     R0                      ; 5BAE   02A0
        B       L_5B7D                          ; 5BAF   0220 0033

L_5BB1:
        MOVR    R5,     R3                      ; 5BB1   00AB
        MVI     G_0331, R5                      ; 5BB2   0285 0331
        MVO@    R1,     R5                      ; 5BB4   0269
        MVO@    R2,     R5                      ; 5BB5   026A
        MVO@    R3,     R5                      ; 5BB6   026B
        MVI     G_012E, R3                      ; 5BB7   0283 012E
        MVO@    R4,     R5                      ; 5BB9   026C
        ADDI    #$0130, R3                      ; 5BBA   02FB 0130
        MVO@    R0,     R3                      ; 5BBC   0258
        ADDI    #$0007, R3                      ; 5BBD   02FB 0007
        CLRR    R4                              ; 5BBF   01E4
L_5BC0:
        MVO@    R4,     R3                      ; 5BC0   025C
L_5BC1:
        MVI     G_012E, R5                      ; 5BC1   0285 012E
L_5BC3:
        DECR    R5                              ; 5BC3   0015
        BPL     L_5A4B                          ; 5BC4   0223 017A

L_5BC6:
        MVII    #$0002, R3                      ; 5BC6   02BB 0002
        CMP     G_0357, R3                      ; 5BC8   0343 0357
        BLE     L_5BCF                          ; 5BCA   0206 0003

        JSR     R4,     L_5F87                  ; 5BCC   0004 005C 0387

L_5BCF:
        MVII    #$0191, R5                      ; 5BCF   02BD 0191
        MVII    #$02DD, R3                      ; 5BD1   02BB 02DD
        MVII    #$0006, R2                      ; 5BD3   02BA 0006

        JSR     R4,     L_5F17                  ; 5BD5   0004 005C 0317

        MVI     G_018B, R2                      ; 5BD8   0282 018B
        MVII    #$02E4, R4                      ; 5BDA   02BC 02E4
        CLRR    R5                              ; 5BDC   01ED
        SDBD                                    ; 5BDD   0001
        MVII    #$1F77, R0                      ; 5BDE   02B8 0077 001F
L_5BE1:
        CMPR    R2,     R5                      ; 5BE1   0155
        BNEQ    L_5BE7                          ; 5BE2   020C 0003

        MVII    #$0016, R0                      ; 5BE4   02B8 0016
        SWAP    R0,     1                       ; 5BE6   0040
L_5BE7:
        MVO@    R0,     R4                      ; 5BE7   0260
        INCR    R5                              ; 5BE8   000D
        CMPI    #$0006, R5                      ; 5BE9   037D 0006
        BNC     L_5BE1                          ; 5BEB   0229 000B

        MVII    #$010A, R5                      ; 5BED   02BD 010A
        MVII    #$02EC, R3                      ; 5BEF   02BB 02EC
        MVII    #$0002, R2                      ; 5BF1   02BA 0002
        MVI@    R5,     R0                      ; 5BF3   02A8
        ADD@    R5,     R0                      ; 5BF4   02E8
        ADD@    R5,     R0                      ; 5BF5   02E8
        ADD@    R5,     R0                      ; 5BF6   02E8
        BEQ     L_5BFE                          ; 5BF7   0204 0005

        MVII    #$0004, R0                      ; 5BF9   02B8 0004
        SUBR    R0,     R5                      ; 5BFB   0105
        SUBR    R0,     R3                      ; 5BFC   0103
        ADDR    R0,     R2                      ; 5BFD   00C2

L_5BFE:
        JSR     R4,     L_5F17                  ; 5BFE   0004 005C 0317

        CLRR    R1                              ; 5C01   01C9
        MVO     R1,     G_035D                  ; 5C02   0241 035D

        JSR     R4,     L_5DAF                  ; 5C04   0004 005C 01AF

        INCR    R1                              ; 5C07   0009
        MVO     R1,     G_035D                  ; 5C08   0241 035D

        JSR     R4,     L_5DCD                  ; 5C0A   0004 005C 01CD
        DECLE   $032F,  $0333                   ; 5C0D   032F 0333

        MVI     G_035E, R1                      ; 5C0F   0281 035E
        MOVR    R1,     R2                      ; 5C11   008A
        SLL     R1,     2                       ; 5C12   004D
        SLL     R1,     1                       ; 5C13   0049
        XORR    R2,     R1                      ; 5C14   01D1
        RLC     R1,     1                       ; 5C15   0051
        RLC     R2,     1                       ; 5C16   0052
        MVO     R2,     G_035E                  ; 5C17   0242 035E
        MVI     G_0123, R0                      ; 5C19   0280 0123
        TSTR    R0                              ; 5C1B   0080
        BEQ     L_5C4B                          ; 5C1C   0204 002D

        MVII    #$032C, R4                      ; 5C1E   02BC 032C
        MOVR    R4,     R5                      ; 5C20   00A5
        MVI@    R4,     R0                      ; 5C21   02A0
        DECR    R0                              ; 5C22   0010
        BPL     L_5C44                          ; 5C23   0203 001F

        MVI     G_0111, R1                      ; 5C25   0281 0111
L_5C27:
        INCR    R1                              ; 5C27   0009
        MVO     R1,     G_0111                  ; 5C28   0241 0111
        SDBD                                    ; 5C2A   0001
        ADDI    #$5142, R1                      ; 5C2B   02F9 0042 0051
        MVI@    R1,     R1                      ; 5C2E   0289
        MOVR    R1,     R2                      ; 5C2F   008A
        BEQ     L_5C27                          ; 5C30   0224 000A

        MVII    #$0003, R0                      ; 5C32   02B8 0003
        MVII    #$0009, R3                      ; 5C34   02BB 0009
        RRC     R1,     2                       ; 5C36   0075
        BNC     L_5C40                          ; 5C37   0209 0007

        CLRR    R3                              ; 5C39   01DB
        MVII    #$0004, R0                      ; 5C3A   02B8 0004
        BNOV    L_5C40                          ; 5C3C   020A 0002

        MVII    #$000D, R0                      ; 5C3E   02B8 000D
L_5C40:
        SLL     R2,     1                       ; 5C40   004A
        MVO@    R2,     R4                      ; 5C41   0262
        NOP                                     ; 5C42   0034
        MVO@    R3,     R4                      ; 5C43   0263
L_5C44:
        MVO@    R0,     R5                      ; 5C44   0268
        MVI@    R5,     R0                      ; 5C45   02A8
        MVO     R0,     G_032F                  ; 5C46   0240 032F
        MVI@    R5,     R0                      ; 5C48   02A8
        MVO     R0,     G_0331                  ; 5C49   0240 0331
L_5C4B:
        MVI     G_0113, R0                      ; 5C4B   0280 0113
        DECR    R0                              ; 5C4D   0010
        BMI     L_5C77                          ; 5C4E   020B 0027

        MVO     R0,     G_0113                  ; 5C50   0240 0113
        CLRR    R2                              ; 5C52   01D2
        MVO     R2,     G_011E                  ; 5C53   0242 011E
        MVI     .PSG0.chan_enable,R3            ; 5C55   0283 01F8
        ANDI    #$00F7, R3                      ; 5C57   03BB 00F7
        MVO     R3,     .PSG0.chan_enable       ; 5C59   0243 01F8
        MOVR    R0,     R1                      ; 5C5B   0081
        BEQ     L_5C71                          ; 5C5C   0204 0013

        MVI     G_0310, R2                      ; 5C5E   0282 0310
        ANDI    #$03FF, R2                      ; 5C60   03BA 03FF
        SDBD                                    ; 5C62   0001
        ADDI    #$0800, R2                      ; 5C63   02FA 0000 0008
        SLL     R1,     2                       ; 5C66   004D
        SLL     R1,     1                       ; 5C67   0049
        ANDI    #$0030, R1                      ; 5C68   03B9 0030
        SDBD                                    ; 5C6A   0001
        ADDI    #$0910, R1                      ; 5C6B   02F9 0010 0009
        ADD     G_0322, R1                      ; 5C6E   02C1 0322
        SLR     R0,     2                       ; 5C70   0064
L_5C71:
        MVO     R2,     G_0310                  ; 5C71   0242 0310
        MVO     R1,     G_0318                  ; 5C73   0241 0318
        B       L_5C81                          ; 5C75   0200 000A

L_5C77:
        MVI     G_011E, R0                      ; 5C77   0280 011E
        DECR    R0                              ; 5C79   0010
        BMI     L_5C87                          ; 5C7A   020B 000B

        MVO     R0,     G_011E                  ; 5C7C   0240 011E
        SLR     R0,     2                       ; 5C7E   0064
        ADDI    #$0006, R0                      ; 5C7F   02F8 0006
L_5C81:
        MVII    #$01AC, R2                      ; 5C81   02BA 01AC
        MVO     R2,     G_032F                  ; 5C83   0242 032F
        MVO     R0,     G_0331                  ; 5C85   0240 0331
L_5C87:
        MVI     G_033A, R0                      ; 5C87   0280 033A
        DECR    R0                              ; 5C89   0010
        BMI     L_5CA6                          ; 5C8A   020B 001A

        MVO     R0,     G_033A                  ; 5C8C   0240 033A
        SLL     R0,     1                       ; 5C8E   0048
        ANDI    #$0007, R0                      ; 5C8F   03B8 0007
        ADDI    #$0004, R0                      ; 5C91   02F8 0004
        MVO     R0,     G_0332                  ; 5C93   0240 0332
        CLRR    R0                              ; 5C95   01C0
        MVO     R0,     G_0125                  ; 5C96   0240 0125
        MVII    #$0153, R0                      ; 5C98   02B8 0153
        MVO     R0,     G_0330                  ; 5C9A   0240 0330
        SDBD                                    ; 5C9C   0001
        MVII    #$503A, R2                      ; 5C9D   02BA 003A 0050
        CLRR    R4                              ; 5CA0   01E4

        JSR     R5,     L_5ECC                  ; 5CA1   0004 015C 02CC

        B       L_5D02                          ; 5CA4   0200 005C

L_5CA6:
        MVI     G_0114, R0                      ; 5CA6   0280 0114
        DECR    R0                              ; 5CA8   0010
        BMI     L_5D04                          ; 5CA9   020B 0059

        MVII    #$017D, R1                      ; 5CAB   02B9 017D
        MVO     R1,     G_0330                  ; 5CAD   0241 0330
        MVII    #$0115, R4                      ; 5CAF   02BC 0115
        MVI@    R4,     R5                      ; 5CB1   02A5
        MVI@    R4,     R1                      ; 5CB2   02A1
        MOVR    R1,     R2                      ; 5CB3   008A
        SLR     R1,     2                       ; 5CB4   0065
        ADDI    #$0005, R1                      ; 5CB5   02F9 0005
        MVO     R1,     G_0332                  ; 5CB7   0241 0332
        MOVR    R2,     R1                      ; 5CB9   0091
        DECR    R2                              ; 5CBA   0012
        CMP@    R4,     R2                      ; 5CBB   0362
        BGT     L_5CC5                          ; 5CBC   020E 0007

        MVO     R0,     G_0114                  ; 5CBE   0240 0114
        CLRR    R2                              ; 5CC0   01D2
        MVO     R2,     G_0332                  ; 5CC1   0242 0332
        MVII    #$001B, R2                      ; 5CC3   02BA 001B
L_5CC5:
        MVO     R2,     G_0116                  ; 5CC5   0242 0116
        CMPI    #$001B, R1                      ; 5CC7   0379 001B
        BNEQ    L_5D02                          ; 5CC9   020C 0037

        MVI     G_032B, R3                      ; 5CCB   0283 032B
        DECR    R5                              ; 5CCD   0015
        BPL     L_5CE8                          ; 5CCE   0203 0018

        MVO     R1,     G_0118                  ; 5CD0   0241 0118
        DECR    R3                              ; 5CD2   0013
        BNEQ    L_5CD9                          ; 5CD3   020C 0004

        SDBD                                    ; 5CD5   0001
        MVII    #$1007, R3                      ; 5CD6   02BB 0007 0010
L_5CD9:
        SDBD                                    ; 5CD9   0001
        CMPI    #$0FFF, R3                      ; 5CDA   037B 00FF 000F
        BNEQ    L_5CE1                          ; 5CDD   020C 0002

        MVII    #$0007, R3                      ; 5CDF   02BB 0007
L_5CE1:
        MVO     R3,     G_032B                  ; 5CE1   0243 032B

        JSR     R4,     L_5DB6                  ; 5CE3   0004 005C 01B6

        MVII    #$0007, R5                      ; 5CE6   02BD 0007
L_5CE8:
        MVO     R5,     G_0115                  ; 5CE8   0245 0115
        ADDI    #$0318, R5                      ; 5CEA   02FD 0318
        SDBD                                    ; 5CEC   0001
        ADDI    #$0950, R3                      ; 5CED   02FB 0050 0009
        MVO@    R3,     R5                      ; 5CF0   026B
        MVII    #$0110, R2                      ; 5CF1   02BA 0110
        MVII    #$0002, R4                      ; 5CF3   02BC 0002
        MVI     G_0118, R5                      ; 5CF5   0285 0118
        TSTR    R5                              ; 5CF7   00AD
        BEQ     L_5CFF                          ; 5CF8   0204 0005

        SDBD                                    ; 5CFA   0001
        MVII    #$5276, R2                      ; 5CFB   02BA 0076 0052
        DECR    R4                              ; 5CFE   0014

L_5CFF:
        JSR     R5,     L_5ECC                  ; 5CFF   0004 015C 02CC

L_5D02:
        B       L_5D24                          ; 5D02   0200 0020

L_5D04:
        CLRR    R1                              ; 5D04   01C9
        MVI     G_0123, R0                      ; 5D05   0280 0123
        TSTR    R0                              ; 5D07   0080
        BEQ     L_5D22                          ; 5D08   0204 0018

        MVI     G_010E, R0                      ; 5D0A   0280 010E
        TSTR    R0                              ; 5D0C   0080
        BNEQ    L_5D22                          ; 5D0D   020C 0013

        MVI     G_0125, R0                      ; 5D0F   0280 0125
        DECR    R0                              ; 5D11   0010
        BPL     L_5D16                          ; 5D12   0203 0002

        MVII    #$003E, R0                      ; 5D14   02B8 003E
L_5D16:
        MVO     R0,     G_0125                  ; 5D16   0240 0125
        CMPI    #$001C, R0                      ; 5D18   0378 001C
        BNC     L_5D22                          ; 5D1A   0209 0006

        SLL     R0,     2                       ; 5D1C   004C
        SLL     R0,     2                       ; 5D1D   004C
        MVO     R0,     G_0330                  ; 5D1E   0240 0330
        MVII    #$000A, R1                      ; 5D20   02B9 000A
L_5D22:
        MVO     R1,     G_0332                  ; 5D22   0241 0332
L_5D24:
        CLRR    R0                              ; 5D24   01C0
        MVO     R0,     G_0123                  ; 5D25   0240 0123
        MVII    #$032F, R4                      ; 5D27   02BC 032F
        MVI@    R4,     R0                      ; 5D29   02A0
        MVO     R0,     .PSG0.chn_a_lo          ; 5D2A   0240 01F0
        SWAP    R0,     1                       ; 5D2C   0040
        MVO     R0,     .PSG0.chn_a_hi          ; 5D2D   0240 01F4
        MVI@    R4,     R0                      ; 5D2F   02A0
        MVO     R0,     .PSG0.chn_b_lo          ; 5D30   0240 01F1
        SWAP    R0,     1                       ; 5D32   0040
        MVO     R0,     .PSG0.chn_b_hi          ; 5D33   0240 01F5
        MVI@    R4,     R0                      ; 5D35   02A0
        MVO     R0,     .PSG0.chn_a_vol         ; 5D36   0240 01FB
        MVI@    R4,     R0                      ; 5D38   02A0
        MVO     R0,     .PSG0.chn_b_vol         ; 5D39   0240 01FC
        J       L_56A6                          ; 5D3B   0004 0354 02A6

        EIS                                     ; 5D3E   0002
        MVI     G_0358, R3                      ; 5D3F   0283 0358
        MVI     G_035D, R1                      ; 5D41   0281 035D
        TSTR    R1                              ; 5D43   0089
        BMI     L_5D62                          ; 5D44   020B 001C

        CMPI    #$0003, R3                      ; 5D46   037B 0003
        BC      L_5D4C                          ; 5D48   0201 0002

        MVO     R3,     .STIC.VIDEN             ; 5D4A   0243 0020
L_5D4C:
        TSTR    R1                              ; 5D4C   0089
        BNEQ    L_5D62                          ; 5D4D   020C 0013

        SDBD                                    ; 5D4F   0001
        MVII    #$3980, R5                      ; 5D50   02BD 0080 0039

        JSR     R4,     L_5D97                  ; 5D53   0004 005C 0197
        DECLE   $01A5,  $0008                   ; 5D56   01A5 0008

        CLRR    R5                              ; 5D58   01ED

        JSR     R4,     L_5D97                  ; 5D59   0004 005C 0197
        DECLE   $0308,  $0003                   ; 5D5C   0308 0003

        MVI@    R5,     R0                      ; 5D5E   02A8
        MVO@    R0,     R4                      ; 5D5F   0260
        MVO     R1,     .STIC.C.0               ; 5D60   0241 0018
L_5D62:
        MVI     G_0359, R1                      ; 5D62   0281 0359
        INCR    R1                              ; 5D64   0009
        BNEQ    L_5D6B                          ; 5D65   020C 0004

        INCR    R3                              ; 5D67   000B
        BNEQ    L_5D6B                          ; 5D68   020C 0001

        DECR    R3                              ; 5D6A   0013
L_5D6B:
        MVI     .PSG0.rgt_hand,R4               ; 5D6B   0284 01FE
        MVI     .PSG0.lft_hand,R5               ; 5D6D   0285 01FF
        MOVR    R4,     R0                      ; 5D6F   00A0
        ANDR    R5,     R0                      ; 5D70   01A8
        MVII    #$00FF, R2                      ; 5D71   02BA 00FF
        CMPR    R2,     R0                      ; 5D73   0150
        BEQ     L_5D78                          ; 5D74   0204 0002

        ANDR    R2,     R1                      ; 5D76   0191
        CLRR    R3                              ; 5D77   01DB
L_5D78:
        MVO     R1,     G_0359                  ; 5D78   0241 0359
        MVO     R3,     G_0358                  ; 5D7A   0243 0358
        CMP     G_0186, R4                      ; 5D7C   0344 0186
        MVO     R4,     G_0186                  ; 5D7E   0244 0186
        BEQ     L_5D83                          ; 5D80   0204 0001

        MOVR    R2,     R4                      ; 5D82   0094
L_5D83:
        MVO     R4,     G_0184                  ; 5D83   0244 0184
        CMP     G_0187, R5                      ; 5D85   0345 0187
        MVO     R5,     G_0187                  ; 5D87   0245 0187
        BEQ     L_5D8C                          ; 5D89   0204 0001

        MOVR    R2,     R5                      ; 5D8B   0095
L_5D8C:
        MVO     R5,     G_0185                  ; 5D8C   0245 0185
        PULR    R5                              ; 5D8E   02B5
        PULR    R4                              ; 5D8F   02B4
        PULR    R3                              ; 5D90   02B3
        PULR    R2                              ; 5D91   02B2
        PULR    R1                              ; 5D92   02B1
        PULR    R0                              ; 5D93   02B0
        RSWD    R0                              ; 5D94   0038
        PULR    R0                              ; 5D95   02B0
        PULR    R7                              ; 5D96   02B7

L_5D97:
        MVI@    R4,     R0                      ; 5D97   02A0
        MVI@    R4,     R2                      ; 5D98   02A2
        PSHR    R4                              ; 5D99   0274
        MOVR    R0,     R4                      ; 5D9A   0084
L_5D9B:
        MVI@    R4,     R0                      ; 5D9B   02A0
        MVO@    R0,     R5                      ; 5D9C   0268
        MVI@    R4,     R0                      ; 5D9D   02A0
        MVO@    R0,     R5                      ; 5D9E   0268
        MVI@    R4,     R0                      ; 5D9F   02A0
        MVO@    R0,     R5                      ; 5DA0   0268
        MVI@    R4,     R0                      ; 5DA1   02A0
        MVO@    R0,     R5                      ; 5DA2   0268
        MVI@    R4,     R0                      ; 5DA3   02A0
        MVO@    R0,     R5                      ; 5DA4   0268
        MVI@    R4,     R0                      ; 5DA5   02A0
        MVO@    R0,     R5                      ; 5DA6   0268
        MVI@    R4,     R0                      ; 5DA7   02A0
        MVO@    R0,     R5                      ; 5DA8   0268
        MVI@    R4,     R0                      ; 5DA9   02A0
        MVO@    R0,     R5                      ; 5DAA   0268
        DECR    R2                              ; 5DAB   0012
        BNEQ    L_5D9B                          ; 5DAC   022C 0012
        PULR    R7                              ; 5DAE   02B7

L_5DAF:
        MVI     G_0359, R0                      ; 5DAF   0280 0359
L_5DB1:
        CMP     G_0359, R0                      ; 5DB1   0340 0359
        BEQ     L_5DB1                          ; 5DB3   0224 0003
        MOVR    R4,     R7                      ; 5DB5   00A7

L_5DB6:
        MVII    #$0318, R5                      ; 5DB6   02BD 0318
        MVII    #$0320, R1                      ; 5DB8   02B9 0320
        SDBD                                    ; 5DBA   0001
        MVII    #$0950, R0                      ; 5DBB   02B8 0050 0009
        B       L_5DD0                          ; 5DBE   0200 0010

L_5DC0:
        MVII    #$028C, R5                      ; 5DC0   02BD 028C
L_5DC2:
        MVI     .BTAB.EF,R0                     ; 5DC2   0280 02EF
        B       L_5DC9                          ; 5DC4   0200 0003

L_5DC6:
        CLRR    R0                              ; 5DC6   01C0
L_5DC7:
        MVII    #$0200, R5                      ; 5DC7   02BD 0200
L_5DC9:
        MVII    #$02F0, R1                      ; 5DC9   02B9 02F0
        B       L_5DD0                          ; 5DCB   0200 0003

L_5DCD:
        MVI@    R4,     R5                      ; 5DCD   02A5
L_5DCE:
        MVI@    R4,     R1                      ; 5DCE   02A1
        CLRR    R0                              ; 5DCF   01C0
L_5DD0:
        MVO@    R0,     R5                      ; 5DD0   0268
        CMPR    R1,     R5                      ; 5DD1   014D
        BNC     L_5DD0                          ; 5DD2   0229 0003
        MOVR    R4,     R7                      ; 5DD4   00A7

L_5DD5:
        MVI@    R4,     R5                      ; 5DD5   02A5
        PSHR    R4                              ; 5DD6   0274

        JSR     R4,     L_5DFB                  ; 5DD7   0004 005C 01FB
        DECLE   $0005,  $02D6                   ; 5DDA   0005 02D6

        JSR     R4,     L_5DFA                  ; 5DDC   0004 005C 01FA
        DECLE   $013D,  $0006,  $02CA           ; 5DDF   013D 0006 02CA

        MVI     G_0188, R0                      ; 5DE2   0280 0188
        SLL     R0,     2                       ; 5DE4   004C
        SLL     R0,     1                       ; 5DE5   0048
        SDBD                                    ; 5DE6   0001
        ADDI    #$168E, R0                      ; 5DE7   02F8 008E 0016
        MVO     R0,     .BTAB.D1                ; 5DEA   0240 02D1
        PULR    R7                              ; 5DEC   02B7

L_5DED:
        MVI@    R4,     R3                      ; 5DED   02A3
L_5DEE:
        SDBD                                    ; 5DEE   0001
        ADDI    #$5164, R2                      ; 5DEF   02FA 0064 0051
        MVI@    R2,     R1                      ; 5DF2   0291
        DECR    R2                              ; 5DF3   0012
        MVI@    R2,     R5                      ; 5DF4   0295
        SUBR    R5,     R1                      ; 5DF5   0129
        ADDI    #$0103, R5                      ; 5DF6   02FD 0103
        B       L_5DFD                          ; 5DF8   0200 0003

L_5DFA:
        MVI@    R4,     R5                      ; 5DFA   02A5
L_5DFB:
        MVI@    R4,     R1                      ; 5DFB   02A1
        MVI@    R4,     R3                      ; 5DFC   02A3
L_5DFD:
        SDBD                                    ; 5DFD   0001
        ADDI    #$5000, R5                      ; 5DFE   02FD 0000 0050
L_5E01:
        MVI@    R5,     R0                      ; 5E01   02A8
        SUBI    #$0020, R0                      ; 5E02   0338 0020
        SLL     R0,     2                       ; 5E04   004C
        SLL     R0,     1                       ; 5E05   0048
        ADDI    #$0007, R0                      ; 5E06   02F8 0007
        MVI@    R3,     R2                      ; 5E08   029A
        SDBD                                    ; 5E09   0001
        ANDI    #$F600, R2                      ; 5E0A   03BA 0000 00F6
        ADDR    R0,     R2                      ; 5E0D   00C2
        MVO@    R2,     R3                      ; 5E0E   025A
        INCR    R3                              ; 5E0F   000B
        DECR    R1                              ; 5E10   0011
        BNEQ    L_5E01                          ; 5E11   022C 0011
        MOVR    R4,     R7                      ; 5E13   00A7

L_5E14:
        SDBD                                    ; 5E14   0001
        MVII    #$516B, R5                      ; 5E15   02BD 006B 0051
        MVII    #$000B, R1                      ; 5E18   02B9 000B
        MVI     G_0184, R0                      ; 5E1A   0280 0184
        CMPI    #$00FF, R0                      ; 5E1C   0378 00FF
        BNEQ    L_5E26                          ; 5E1E   020C 0006

        MVI     G_0185, R0                      ; 5E20   0280 0185
        CMPI    #$00FF, R0                      ; 5E22   0378 00FF
        BEQ     L_5E2C                          ; 5E24   0204 0006

L_5E26:
        CMP@    R5,     R0                      ; 5E26   0368
        BEQ     L_5E2D                          ; 5E27   0204 0004

        DECR    R1                              ; 5E29   0011
        BPL     L_5E26                          ; 5E2A   0223 0005

L_5E2C:
        CLRC                                    ; 5E2C   0006
L_5E2D:
        MOVR    R4,     R7                      ; 5E2D   00A7

L_5E2E:
        MOVR    R1,     R0                      ; 5E2E   0088
        SLL     R0,     2                       ; 5E2F   004C
        MOVR    R0,     R5                      ; 5E30   0085
        SLL     R0,     2                       ; 5E31   004C
        ADDR    R0,     R5                      ; 5E32   00C5
        ADDR    R2,     R5                      ; 5E33   00D5
        ADDR    R5,     R5                      ; 5E34   00ED
        ADD     G_0321, R5                      ; 5E35   02C5 0321
        MOVR    R4,     R7                      ; 5E37   00A7

L_5E38:
        PSHR    R4                              ; 5E38   0274
        MOVR    R1,     R3                      ; 5E39   008B
        SLL     R3,     1                       ; 5E3A   004B
        MOVR    R3,     R4                      ; 5E3B   009C
        SLL     R3,     2                       ; 5E3C   004F
        ADDR    R4,     R3                      ; 5E3D   00E3
        ADDR    R2,     R3                      ; 5E3E   00D3
        ADDI    #$0149, R3                      ; 5E3F   02FB 0149
        PULR    R7                              ; 5E41   02B7

L_5E42:
        PSHR    R4                              ; 5E42   0274

        JSR     R4,     L_5E47                  ; 5E43   0004 005C 0247

        PULR    R4                              ; 5E46   02B4
L_5E47:
        MVI@    R2,     R1                      ; 5E47   0291
        INCR    R2                              ; 5E48   000A
        MVO@    R1,     R3                      ; 5E49   0259
        INCR    R3                              ; 5E4A   000B
        ANDI    #$01F8, R1                      ; 5E4B   03B9 01F8
        SLR     R1,     2                       ; 5E4D   0065
        SLR     R1,     1                       ; 5E4E   0061
        SDBD                                    ; 5E4F   0001
        ADDI    #$5276, R1                      ; 5E50   02F9 0076 0052
        MVI@    R1,     R0                      ; 5E53   0288
        SDBD                                    ; 5E54   0001
        ADDI    #$5177, R0                      ; 5E55   02F8 0077 0051
        MVII    #$0008, R1                      ; 5E58   02B9 0008
L_5E5A:
        PSHR    R4                              ; 5E5A   0274
        MOVR    R0,     R4                      ; 5E5B   0084
        ADDR    R5,     R1                      ; 5E5C   00E9
L_5E5D:
        MVI@    R4,     R0                      ; 5E5D   02A0
        XORI    #$00FF, R0                      ; 5E5E   03F8 00FF
        MVO@    R0,     R5                      ; 5E60   0268
        CMPI    #$0100, R0                      ; 5E61   0378 0100
        BNC     L_5E70                          ; 5E63   0209 000B

        CMPI    #$0200, R0                      ; 5E65   0378 0200
        BNC     L_5E6F                          ; 5E67   0209 0006

        CMPI    #$0300, R0                      ; 5E69   0378 0300
        BNC     L_5E6E                          ; 5E6B   0209 0001

        MVO@    R0,     R5                      ; 5E6D   0268
L_5E6E:
        MVO@    R0,     R5                      ; 5E6E   0268
L_5E6F:
        MVO@    R0,     R5                      ; 5E6F   0268
L_5E70:
        CMPR    R1,     R5                      ; 5E70   014D
        BNC     L_5E5D                          ; 5E71   0229 0015
        PULR    R7                              ; 5E73   02B7

L_5E74:
        MVI     G_012D, R0                      ; 5E74   0280 012D
        MVII    #$0001, R1                      ; 5E76   02B9 0001
        MVO     R1,     G_0330                  ; 5E78   0241 0330
        B       L_5E83                          ; 5E7A   0200 0007

L_5E7C:
        MVI     G_012C, R0                      ; 5E7C   0280 012C
        MVII    #$000A, R1                      ; 5E7E   02B9 000A
        MVO     R1,     G_0330                  ; 5E80   0241 0330
        SLL     R1,     1                       ; 5E82   0049
L_5E83:
        PSHR    R4                              ; 5E83   0274
        MOVR    R1,     R4                      ; 5E84   008C
        PSHR    R0                              ; 5E85   0270
        SLR     R0,     1                       ; 5E86   0060
        MVO     R5,     G_032F                  ; 5E87   0245 032F
L_5E89:
        MVI     G_032F, R5                      ; 5E89   0285 032F
        MVI@    R5,     R1                      ; 5E8B   02A9
        MVO@    R1,     R3                      ; 5E8C   0259
        ADD     G_0330, R3                      ; 5E8D   02C3 0330
        MVI@    R5,     R1                      ; 5E8F   02A9
        MVO@    R1,     R3                      ; 5E90   0259
        ADD     G_0330, R3                      ; 5E91   02C3 0330
        PSHR    R3                              ; 5E93   0273
        MVII    #$0004, R3                      ; 5E94   02BB 0004
L_5E96:
        MVI@    R5,     R1                      ; 5E96   02A9
        SDBD                                    ; 5E97   0001
        ADDI    #$3C03, R1                      ; 5E98   02F9 0003 003C
        MVO@    R1,     R2                      ; 5E9B   0251
        ADDR    R4,     R2                      ; 5E9C   00E2
        DECR    R3                              ; 5E9D   0013
        BNEQ    L_5E96                          ; 5E9E   022C 0009

        PULR    R3                              ; 5EA0   02B3
        DECR    R0                              ; 5EA1   0010
        BNEQ    L_5E89                          ; 5EA2   022C 001A

        MVII    #$0034, R1                      ; 5EA4   02B9 0034
        SWAP    R1,     1                       ; 5EA6   0041
        PULR    R0                              ; 5EA7   02B0
        RRC     R0,     1                       ; 5EA8   0070
        MVII    #$0034, R0                      ; 5EA9   02B8 0034
        BNC     L_5EB2                          ; 5EAB   0209 0005

        MVO@    R0,     R3                      ; 5EAD   0258
        MVO@    R1,     R2                      ; 5EAE   0251
        ADDR    R4,     R2                      ; 5EAF   00E2
        MVO@    R1,     R2                      ; 5EB0   0251
        ADDR    R4,     R2                      ; 5EB1   00E2
L_5EB2:
        MVO@    R1,     R2                      ; 5EB2   0251
        PULR    R7                              ; 5EB3   02B7

L_5EB4:
        PSHR    R4                              ; 5EB4   0274
        MVI     G_0129, R4                      ; 5EB5   0284 0129
        DECR    R4                              ; 5EB7   0014
        BMI     L_5ECB                          ; 5EB8   020B 0011

        MVI     G_012E, R0                      ; 5EBA   0280 012E
        SLL     R0,     2                       ; 5EBC   004C
        MOVR    R0,     R4                      ; 5EBD   0084
        ADDI    #$033B, R4                      ; 5EBE   02FC 033B
        MVI@    R4,     R0                      ; 5EC0   02A0
        CMP     G_0119, R0                      ; 5EC1   0340 0119
        BNEQ    L_5ECB                          ; 5EC3   020C 0006

        MVI@    R4,     R0                      ; 5EC5   02A0
        CMP     G_011A, R0                      ; 5EC6   0340 011A
        BNEQ    L_5ECB                          ; 5EC8   020C 0001

        CLRR    R4                              ; 5ECA   01E4
L_5ECB:
        PULR    R7                              ; 5ECB   02B7

L_5ECC:
        MVII    #$0197, R3                      ; 5ECC   02BB 0197
        PSHR    R5                              ; 5ECE   0275
        MVII    #$0050, R5                      ; 5ECF   02BD 0050
        MVI@    R3,     R1                      ; 5ED1   0299
        CMPR    R5,     R1                      ; 5ED2   0169
        BEQ     L_5F16                          ; 5ED3   0204 0041

        MVI     G_0193, R1                      ; 5ED5   0281 0193
        PSHR    R1                              ; 5ED7   0271
        CLRR    R1                              ; 5ED8   01C9
L_5ED9:
        MVI@    R3,     R0                      ; 5ED9   0298
        ADDR    R1,     R0                      ; 5EDA   00C8
        CLRR    R1                              ; 5EDB   01C9
        TSTR    R4                              ; 5EDC   00A4
        BPL     L_5EE5                          ; 5EDD   0203 0006

        CMPR    R5,     R0                      ; 5EDF   0168
        BC      L_5EE9                          ; 5EE0   0201 0007

        MVO@    R0,     R3                      ; 5EE2   0258
        B       L_5EF4                          ; 5EE3   0200 000F

L_5EE5:
        ADD@    R2,     R0                      ; 5EE5   02D0
        CMPR    R5,     R0                      ; 5EE6   0168
        BNC     L_5EEC                          ; 5EE7   0209 0003

L_5EE9:
        SUBR    R5,     R0                      ; 5EE9   0128
        MVII    #$0008, R1                      ; 5EEA   02B9 0008
L_5EEC:
        MVO@    R0,     R3                      ; 5EEC   0258
        DECR    R2                              ; 5EED   0012
        DECR    R3                              ; 5EEE   0013
        DECR    R4                              ; 5EEF   0014
        CMPI    #$0191, R3                      ; 5EF0   037B 0191
        BC      L_5ED9                          ; 5EF2   0221 001A

L_5EF4:
        PULR    R0                              ; 5EF4   02B0
        TSTR    R1                              ; 5EF5   0089
        BEQ     L_5F05                          ; 5EF6   0204 000D

        JSR     R4,     L_5F42                  ; 5EF8   0004 005C 0342

        MVII    #$0191, R4                      ; 5EFB   02BC 0191
L_5EFD:
        MVO@    R5,     R4                      ; 5EFD   0265
        CMPI    #$0198, R4                      ; 5EFE   037C 0198
        BNC     L_5EFD                          ; 5F00   0229 0004

        CLRR    R0                              ; 5F02   01C0
        B       L_5F14                          ; 5F03   0200 000F

L_5F05:
        CMP     G_0193, R0                      ; 5F05   0340 0193
        BEQ     L_5F16                          ; 5F07   0204 000D

        ANDI    #$0008, R0                      ; 5F09   03B8 0008
        BNEQ    L_5F16                          ; 5F0B   020C 0009

        MVI     G_018B, R0                      ; 5F0D   0280 018B
        CMPI    #$0006, R0                      ; 5F0F   0378 0006
        BC      L_5F16                          ; 5F11   0201 0003

        INCR    R0                              ; 5F13   0008
L_5F14:
        MVO     R0,     G_018B                  ; 5F14   0240 018B
L_5F16:
        PULR    R7                              ; 5F16   02B7

L_5F17:
        PSHR    R4                              ; 5F17   0274
        MOVR    R3,     R4                      ; 5F18   009C
        SDBD                                    ; 5F19   0001
        MVII    #$1606, R3                      ; 5F1A   02BB 0006 0016
        B       L_5F20                          ; 5F1D   0200 0001

L_5F1F:
        MVO@    R3,     R4                      ; 5F1F   0263
L_5F20:
        MVI@    R5,     R0                      ; 5F20   02A8
        TSTR    R0                              ; 5F21   0080
        BNEQ    L_5F2E                          ; 5F22   020C 000A

        DECR    R2                              ; 5F24   0012
        BPL     L_5F1F                          ; 5F25   0223 0007

L_5F27:
        TSTR    R0                              ; 5F27   0080
        BNEQ    L_5F2E                          ; 5F28   020C 0004

        SDBD                                    ; 5F2A   0001
        MVII    #$0888, R0                      ; 5F2B   02B8 0088 0008
L_5F2E:
        ADDI    #$0080, R0                      ; 5F2E   02F8 0080
        CMPI    #$00D0, R0                      ; 5F30   0378 00D0
        BNEQ    L_5F36                          ; 5F32   020C 0002

        MVII    #$0008, R0                      ; 5F34   02B8 0008
L_5F36:
        ADDR    R3,     R0                      ; 5F36   00D8
        MVO@    R0,     R4                      ; 5F37   0260
        MVI@    R5,     R0                      ; 5F38   02A8
        DECR    R2                              ; 5F39   0012
        BPL     L_5F27                          ; 5F3A   0223 0014
        PULR    R7                              ; 5F3C   02B7

L_5F3D:
        MVI     G_012E, R0                      ; 5F3D   0280 012E
        TSTR    R0                              ; 5F3F   0080
        BNEQ    L_5F4C                          ; 5F40   020C 000A

L_5F42:
        MVII    #$0040, R0                      ; 5F42   02B8 0040
        MVO     R0,     G_0113                  ; 5F44   0240 0113
        SLL     R0,     1                       ; 5F46   0048
        NOP                                     ; 5F47   0034
        MVO     R0,     G_0357                  ; 5F48   0240 0357
        MVO     R0,     G_018F                  ; 5F4A   0240 018F
L_5F4C:
        MOVR    R4,     R7                      ; 5F4C   00A7

L_5F4D:
        MVI     G_0102, R0                      ; 5F4D   0280 0102
        ANDI    #$0001, R0                      ; 5F4F   03B8 0001
        BEQ     L_5F6D                          ; 5F51   0204 001A

        XOR     G_0188, R0                      ; 5F53   03C0 0188
        MVO     R0,     G_0188                  ; 5F55   0240 0188
        MVII    #$018B, R2                      ; 5F57   02BA 018B
        MVII    #$0198, R3                      ; 5F59   02BB 0198
L_5F5B:
        MVI@    R2,     R0                      ; 5F5B   0290
        MVI@    R3,     R1                      ; 5F5C   0299
        MVO@    R0,     R3                      ; 5F5D   0258
        MVO@    R1,     R2                      ; 5F5E   0251
        INCR    R2                              ; 5F5F   000A
        INCR    R3                              ; 5F60   000B
        CMPI    #$0198, R2                      ; 5F61   037A 0198
        BNC     L_5F5B                          ; 5F63   0229 0009

        MVI     G_035B, R0                      ; 5F65   0280 035B
        MVI     G_035C, R1                      ; 5F67   0281 035C
        MVO     R0,     G_035C                  ; 5F69   0240 035C
        MVO     R1,     G_035B                  ; 5F6B   0241 035B
L_5F6D:
        MOVR    R4,     R7                      ; 5F6D   00A7

L_5F6E:
        MVI@    R4,     R0                      ; 5F6E   02A0
        PSHR    R4                              ; 5F6F   0274
        MOVR    R0,     R4                      ; 5F70   0084
        MVII    #$0103, R5                      ; 5F71   02BD 0103
L_5F73:
        CMPI    #$010A, R5                      ; 5F73   037D 010A
        BC      L_5F86                          ; 5F75   0201 000F

        MVI@    R4,     R1                      ; 5F77   02A1
        CMP@    R5,     R1                      ; 5F78   0369
        BEQ     L_5F73                          ; 5F79   0224 0007
        BNC     L_5F86                          ; 5F7B   0209 0009

        MOVR    R0,     R4                      ; 5F7D   0084
        MVII    #$0103, R5                      ; 5F7E   02BD 0103
L_5F80:
        MVI@    R4,     R1                      ; 5F80   02A1
        MVO@    R1,     R5                      ; 5F81   0269
        CMPI    #$010A, R5                      ; 5F82   037D 010A
        BNC     L_5F80                          ; 5F84   0229 0005
L_5F86:
        PULR    R7                              ; 5F86   02B7

L_5F87:
        PSHR    R4                              ; 5F87   0274
L_5F88:
        MVO     R3,     G_012E                  ; 5F88   0243 012E
        CLRR    R1                              ; 5F8A   01C9
        CLRR    R4                              ; 5F8B   01E4
        MVII    #$0318, R2                      ; 5F8C   02BA 0318
        ADDR    R3,     R2                      ; 5F8E   00DA
        MVI@    R2,     R2                      ; 5F8F   0292
        TSTR    R2                              ; 5F90   0092
        BEQ     L_5FF8                          ; 5F91   0204 0065

        MOVR    R3,     R0                      ; 5F93   0098
        SLL     R0,     2                       ; 5F94   004C
        ADDI    #$033B, R0                      ; 5F95   02F8 033B
        MOVR    R0,     R5                      ; 5F97   0085
        MVI@    R5,     R1                      ; 5F98   02A9
        SLL     R1,     2                       ; 5F99   004D
        SLL     R1,     2                       ; 5F9A   004D
        ADDI    #$008C, R1                      ; 5F9B   02F9 008C
        MVI     G_012C, R2                      ; 5F9D   0282 012C
        CMPI    #$0004, R2                      ; 5F9F   037A 0004
        BC      L_5FA5                          ; 5FA1   0201 0002

        ADDI    #$0008, R1                      ; 5FA3   02F9 0008
L_5FA5:
        MVI@    R5,     R2                      ; 5FA5   02AA
        ADD@    R5,     R1                      ; 5FA6   02E9
        SLL     R2,     1                       ; 5FA7   004A
        ADDI    #$006B, R2                      ; 5FA8   02FA 006B
        SUB     G_012D, R2                      ; 5FAA   0302 012D
        SLL     R2,     1                       ; 5FAC   004A
        DECR    R2                              ; 5FAD   0012
        SLL     R2,     2                       ; 5FAE   004E
        ADD@    R5,     R2                      ; 5FAF   02EA

        JSR     R4,     L_5EB4                  ; 5FB0   0004 005C 02B4

        BNEQ    L_5FB9                          ; 5FB3   020C 0004

        ADD     G_0334, R1                      ; 5FB5   02C1 0334
        ADD     G_0335, R2                      ; 5FB7   02C2 0335
L_5FB9:
        MVII    #$0130, R5                      ; 5FB9   02BD 0130
        ADDR    R3,     R5                      ; 5FBB   00DD
        MVI@    R5,     R0                      ; 5FBC   02A8
        MOVR    R0,     R4                      ; 5FBD   0084
        ANDI    #$0010, R0                      ; 5FBE   03B8 0010
        SLL     R0,     2                       ; 5FC0   004C
        SLL     R0,     2                       ; 5FC1   004C
        SLL     R0,     2                       ; 5FC2   004C
        ADDR    R0,     R1                      ; 5FC3   00C1
        ADDI    #$01D7, R5                      ; 5FC4   02FD 01D7
        MVO@    R2,     R5                      ; 5FC6   026A
        ADDI    #$0007, R5                      ; 5FC7   02FD 0007
        MVO@    R1,     R5                      ; 5FC9   0269
        MOVR    R4,     R0                      ; 5FCA   00A0
        BEQ     L_5FF8                          ; 5FCB   0204 002B

        MVII    #$0126, R2                      ; 5FCD   02BA 0126
        ADDR    R3,     R2                      ; 5FCF   00DA
        MVI@    R2,     R2                      ; 5FD0   0292
        ADDI    #$0091, R2                      ; 5FD1   02FA 0091
        SLL     R2,     2                       ; 5FD3   004E
        SLL     R2,     2                       ; 5FD4   004E
        ADDI    #$0007, R5                      ; 5FD5   02FD 0007
        TSTR    R3                              ; 5FD7   009B
        BNEQ    L_5FF7                          ; 5FD8   020C 001D

        MVII    #$0007, R1                      ; 5FDA   02B9 0007
        MVI     G_0188, R4                      ; 5FDC   0284 0188
        TSTR    R4                              ; 5FDE   00A4
        BEQ     L_5FE3                          ; 5FDF   0204 0002

        MVII    #$0002, R1                      ; 5FE1   02B9 0002
L_5FE3:
        ADDR    R1,     R2                      ; 5FE3   00CA
        MVO     R1,     G_0322                  ; 5FE4   0241 0322
        MVI     G_0339, R0                      ; 5FE6   0280 0339
        DECR    R0                              ; 5FE8   0010
        BMI     L_5FF7                          ; 5FE9   020B 000C

        MVO     R0,     G_0339                  ; 5FEB   0240 0339
        CMPI    #$0078, R0                      ; 5FED   0378 0078
        BNC     L_5FF5                          ; 5FEF   0209 0004

        ANDI    #$0008, R0                      ; 5FF1   03B8 0008
        BNEQ    L_5FF7                          ; 5FF3   020C 0002

L_5FF5:
        XORI    #$0005, R2                      ; 5FF5   03FA 0005
L_5FF7:
        MVO@    R2,     R5                      ; 5FF7   026A
L_5FF8:
        DECR    R3                              ; 5FF8   0013
        BPL     L_5F88                          ; 5FF9   0223 0072
        PULR    R7                              ; 5FFB   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFC   0000 0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5193       $518A  
;;  $51AB       $51A9  
;;  $51D7       $51D5  
;;  $5201       $51FF  
;;  $5204       $5201  
;;  $5279       $51F7  
;;  $52DC       $51E2  
;;  $5315       $523C  
;;  $5319       $524E  
;;  $532B       $526E  
;;  $5352       <entry>
;;  $536D       $5379  
;;  $537D       $5376  
;;  $5382       $537B  
;;  $5383       $5380  
;;  $538F       $56C4  
;;  $53B7       $5409  
;;  $53D1       $53CA   $53CE  
;;  $53D6       $53D3  
;;  $53EF       $540C  
;;  $5407       $5403  
;;  $540B       $53F5   $53FA  
;;  $5439       $585E  
;;  $5458       $5455  
;;  $5460       $545C  
;;  $5488       $5484  
;;  $549A       $5494  
;;  $54C2       $554C  
;;  $54CC       $54C8  
;;  $54CD       $553C  
;;  $54D5       $54CE  
;;  $54DF       $54D3   $54D7   $54DB  
;;  $550A       $54F7   $54FD   $5503   $5566  
;;  $5516       $550E  
;;  $5538       $5514  
;;  $554E       $5540  
;;  $555A       $5553  
;;  $5568       $5558  
;;  $559E       $559A  
;;  $55F9       $55F6  
;;  $55FE       $55FB  
;;  $5625       $5610  
;;  $563E       $5623  
;;  $564B       $5642  
;;  $5655       $5651  
;;  $5660       $565A  
;;  $5668       $5689  
;;  $5679       $5676  
;;  $567D       $566C  
;;  $5681       $566A   $5672  
;;  $5685       $5682  
;;  $56A1       $5691   $569C  
;;  $56A6       $5D3B  
;;  $56AA       $56D1  
;;  $56B6       $56AD  
;;  $56BB       $56B7  
;;  $56C6       $56BD  
;;  $56CD       $56B4   $56C0  
;;  $56CE       $56B1   $56CA  
;;  $56E5       $56DC   $582B   $5830   $5891   $589F   $5902   $595D   $5981  
;;  $56E8       $56D6  
;;  $56FD       $56F2   $56F7  
;;  $5723       $56ED   $571E  
;;  $5731       $5729  
;;  $5743       $5751  
;;  $5753       $5735  
;;  $5777       $5773   $578E  
;;  $577B       $578A  
;;  $577F       $5786  
;;  $5792       $5771  
;;  $5799       $5795   $57E5  
;;  $57A7       $57C5  
;;  $57B1       $57AD  
;;  $57B8       $57B4  
;;  $57BF       $57BB  
;;  $57C9       $57A5   $57E0  
;;  $57E2       $57C7  
;;  $57E7       $5790  
;;  $57FC       $580A  
;;  $5807       $5801  
;;  $581D       $57EA  
;;  $581F       $56FB   $5726   $572F  
;;  $583E       $5835  
;;  $5843       $583A  
;;  $5845       $5849  
;;  $5855       $5850  
;;  $585E       $583C  
;;  $5861       $585C  
;;  $5886       $588A  
;;  $5893       $5825  
;;  $58A1       $5896  
;;  $58A4       $5822  
;;  $58B3       $58F8  
;;  $58E2       $58C5  
;;  $58F1       $58ED  
;;  $58F4       $58E3  
;;  $58F5       $58B4   $58B8   $58DB   $58E0  
;;  $58FE       $58B1  
;;  $5904       $5841  
;;  $5931       $5936  
;;  $593A       $593D  
;;  $594A       $5946  
;;  $594F       $594C  
;;  $5959       $5955  
;;  $595F       $58FF  
;;  $596B       $5976  
;;  $5983       $596E  
;;  $5984       $5967  
;;  $5996       $598E  
;;  $599F       $5999  
;;  $59B4       $59A8  
;;  $59BC       $59AD  
;;  $59C2       $59AB  
;;  $59C8       $59B0  
;;  $59CE       $59BA   $59C0   $59C6  
;;  $59FF       $59F6   $59F9  
;;  $5A14       $5A10  
;;  $5A35       $5992   $599D   $59B2   $59B8   $59BE   $59C4   $59CC  
;;  $5A49       $5A3C   $5A40   $5A44  
;;  $5A4B       $5BC4  
;;  $5A74       $5A60  
;;  $5A84       $5A68   $5A81  
;;  $5A8A       $5A87  
;;  $5A98       $5A70   $5A8C  
;;  $5AA3       $5A9F  
;;  $5AB9       $5AB2  
;;  $5AD0       $5ACC  
;;  $5AD3       $5AB7  
;;  $5AE8       $5ADE   $5AE2  
;;  $5B15       $5ADA   $5AE6  
;;  $5B1E       $5B1B  
;;  $5B23       $5B20  
;;  $5B35       $5B0C  
;;  $5B41       $5B36  
;;  $5B57       $5B50  
;;  $5B60       $5B59  
;;  $5B66       $5B60  
;;  $5B68       $5B55   $5B5E   $5B64  
;;  $5B70       $5B6A  
;;  $5B7D       $5B73   $5B77   $5BAF  
;;  $5B97       $5B44   $5B6E   $5B7B  
;;  $5B9A       $5B95  
;;  $5BA3       $5B9D  
;;  $5BB1       $5B90  
;;  $5BC0       $5B33  
;;  $5BC1       $5B13  
;;  $5BC3       $5A50   $5A56   $5A72   $5A96  
;;  $5BC6       $56E5  
;;  $5BCF       $5BCA  
;;  $5BE1       $5BEB  
;;  $5BE7       $5BE2  
;;  $5BFE       $5BF7  
;;  $5C27       $5C30  
;;  $5C40       $5C37   $5C3C  
;;  $5C44       $5C23  
;;  $5C4B       $5C1C  
;;  $5C71       $5C5C  
;;  $5C77       $5C4E  
;;  $5C81       $5C75  
;;  $5C87       $5C7A  
;;  $5CA6       $5C8A  
;;  $5CC5       $5CBC  
;;  $5CD9       $5CD3  
;;  $5CE1       $5CDD  
;;  $5CE8       $5CCE  
;;  $5CFF       $5CF8  
;;  $5D02       $5CA4   $5CC9  
;;  $5D04       $5CA9  
;;  $5D16       $5D12  
;;  $5D22       $5D08   $5D0D   $5D1A  
;;  $5D24       $5D02  
;;  $5D4C       $5D48  
;;  $5D62       $5D44   $5D4D  
;;  $5D6B       $5D65   $5D68  
;;  $5D78       $5D74  
;;  $5D83       $5D80  
;;  $5D8C       $5D89  
;;  $5D97       $5D53   $5D59  
;;  $5D9B       $5DAC  
;;  $5DAF       $536D   $539E   $53EF   $541C   $5C04  
;;  $5DB1       $5DB3  
;;  $5DB6       $5908   $5CE3  
;;  $5DC0       $53BF   $586B  
;;  $5DC2       $591B  
;;  $5DC6       $5364   $53A8  
;;  $5DC7       $548D  
;;  $5DC9       $5DC4  
;;  $5DCD       $5395   $53A1   $5445   $544A   $588C   $591E   $5C0A  
;;  $5DCE       $5391   $5A31  
;;  $5DD0       $5DBE   $5DCB   $5DD2  
;;  $5DD5       $5496   $56E1   $587E   $5923  
;;  $5DED       $53E9  
;;  $5DEE       $53DA   $53E0  
;;  $5DFA       $5367   $53AB   $53B1   $586E   $5927   $5DDC  
;;  $5DFB       $5DD7  
;;  $5DFD       $5DF8  
;;  $5E01       $5E11  
;;  $5E14       $5373   $53F2  
;;  $5E26       $5E1E   $5E2A  
;;  $5E2C       $5E24  
;;  $5E2D       $5E27  
;;  $5E2E       $54A6   $558D   $59DC   $59E4  
;;  $5E38       $54A9   $5590   $580C   $5814   $5AF4   $5B7E  
;;  $5E42       $5A29   $5A2E  
;;  $5E47       $5E43  
;;  $5E5A       $5429  
;;  $5E5D       $5E71  
;;  $5E6E       $5E6B  
;;  $5E6F       $5E67  
;;  $5E70       $5E63  
;;  $5E74       $5587   $559E  
;;  $5E7C       $5571   $557C  
;;  $5E83       $5E7A  
;;  $5E89       $5EA2  
;;  $5E96       $5E9E  
;;  $5EB2       $5EAB  
;;  $5EB4       $57FE   $5B41   $5FB0  
;;  $5ECB       $5EB8   $5EC3   $5EC8  
;;  $5ECC       $5CA1   $5CFF  
;;  $5ED9       $5EF2  
;;  $5EE5       $5EDD  
;;  $5EE9       $5EE0  
;;  $5EEC       $5EE7  
;;  $5EF4       $5EE3  
;;  $5EFD       $5F00  
;;  $5F05       $5EF6  
;;  $5F14       $5F03  
;;  $5F16       $5ED3   $5F07   $5F0B   $5F11  
;;  $5F17       $5BD5   $5BFE  
;;  $5F1F       $5F25  
;;  $5F20       $5F1D  
;;  $5F27       $5F3A  
;;  $5F2E       $5F22   $5F28  
;;  $5F36       $5F32  
;;  $5F3D       $5B97  
;;  $5F42       $58DD   $597E   $5EF8  
;;  $5F4C       $5F40  
;;  $5F4D       $56DE   $5852  
;;  $5F5B       $5F63  
;;  $5F6D       $5F51  
;;  $5F6E       $5863   $5867  
;;  $5F73       $5F79  
;;  $5F80       $5F84  
;;  $5F86       $5F75   $5F7B  
;;  $5F87       $56A3   $5BCC  
;;  $5F88       $5FF9  
;;  $5FA5       $5FA1  
;;  $5FB9       $5FB3  
;;  $5FE3       $5FDF  
;;  $5FF5       $5FEF  
;;  $5FF7       $5FD8   $5FE9   $5FF3  
;;  $5FF8       $5F91   $5FCB  
;; ======================================================================== ;;
